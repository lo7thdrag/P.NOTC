unit uNetStub;

interface

uses Windows, uMapStub, uNetHandle_TTT, uTCPDatatype,
  uTCPServer, uTCPClient, SysUtils,
  uPacketBuffer, uGameData_TTT,
  Classes, tttData;

type
  TFlagStatus = (fsNeedUpdate, fsRemove, fsNone);

  TRItem = record
    InstanceIndex: integer;
    SessionID: integer;
    LastUpdate: TDateTime;
    PosX, PosY: double;
    FlagStatus: TFlagStatus;
    IPAddr : String[20];
  end;

  PRItem = ^TRItem;

  TNetStubGC = class(TNetHandle_TTT)
  private
    FNetTCPServerGC: TTCPServer;
    FOnLogStr: TLogStrProc;

    procedure FNetStubGC_OnClientConnect(const S: string);
    procedure FNetStubGC_OnClientDisConnect(const S: string);
    procedure netRecvGCMapCmd(apRec: PAnsiChar; aSize: Word);
    procedure SetOnLogStr(const Value: TLogStrProc);
  public
    constructor Create;
    destructor Destroy; override;
    procedure StartNetworking; override;
    procedure StopNetworking; override;
    procedure StartListen;
    procedure StopListen;
    property OnLogStr: TLogStrProc read FOnLogStr write SetOnLogStr;
  end;

  TNetStub = class(TNetHandle_TTT)
  private
    FNetTCPServer: TTCPServer;
    FQueueBuffer: TPacketBuffer;
    FOnLogStr: TLogStrProc;
    FList: TThreadList;

    procedure FNetStub_OnClientConnect(const S: string);
    procedure FNetStub_OnClientDisConnect(const S: string);
    procedure netRecvMapCmd(apRec: PAnsiChar; aSize: Word);
    procedure SetOnLogStr(const Value: TLogStrProc);

    procedure RemoveAllItemIP(IPAddr : String);

    function CheckItem(rec: TRItem): boolean;
    procedure addItem(Item: PRItem);
  public
    constructor Create;
    destructor Destroy; override;
    procedure StartNetworking; override;
    procedure StopNetworking; override;
    procedure SendTo(const aID: Word; aBuffer: PAnsiChar; const ip: string);
    procedure SendBroadcast(const aID: Word; aBuffer: PAnsiChar);
    procedure StartListen;
    procedure StopListen;

    procedure GetPacket;

    procedure removeItem(InstanceIndex, SessionID: integer);
    procedure GetItem(Index: integer; var rec: TRItem);
    function GetCount: integer;
    procedure SetFlagItem(InstanceIndex, SessionID: integer; Flag: TFlagStatus);

    property QueueBuffer: TPacketBuffer read FQueueBuffer;
    property OnLogStr: TLogStrProc read FOnLogStr write SetOnLogStr;

  end;

var
  VNetStub   : TNetStub;
  VNetStubGC : TNetStubGC;

implementation

uses
  uBaseCoordSystem, uMapLayerDB;

const
  MAX_QUEUE = 100;

  { TNetStub }

procedure TNetStub.netRecvMapCmd(apRec: PAnsiChar; aSize: Word);
var
  sIP: string;
  rec: ^TRec_MapData;
  rItem: PRItem;
begin
  rec := @apRec^;
  sip :=  LongIp_To_StrIp(rec^.pid.ipSender);

  if rec^.OrderID <> CORD_MAPS_DEPTH then
    exit;

  New(rItem);
  rItem^.InstanceIndex := rec^.PlatformID;
  rItem^.LastUpdate := Now;
  rItem^.PosX := rec^.X;
  rItem^.PosY := rec^.Y;
  rItem^.FlagStatus := fsNeedUpdate;
  rItem^.SessionID := rec^.SessionID;
  rItem^.IPAddr := SIP;

  if not CheckItem(rItem^) then
  begin
    addItem(rItem);
    //FOnLogStr(IntToStr(rec^.PlatformID) + ': Session ' + IntToStr(rec^.SessionID) + ' request');
  end
  else
    Dispose(rItem);

end;

procedure TNetStub.RemoveAllItemIP(IPAddr: String);
var
  i: integer;
  pi: PRItem;
begin
  i := GetCount - 1;

  try
    with FList.LockList do
    begin
      while i >= 0 do
      begin
        pi := Items[i];
        if (pi^.IPAddr = IPAddr) then
        begin
          Delete(i);
          break;
        end;
        i := i - 1;
      end;
    end;
  finally
    FList.UnlockList;
  end;

end;

procedure TNetStub.removeItem(InstanceIndex, SessionID: integer);
var
  i: integer;
  pi: PRItem;
begin
  i := GetCount - 1;

  try
    with FList.LockList do
    begin
      while i >= 0 do
      begin
        pi := Items[i];
        if (pi^.InstanceIndex = InstanceIndex) and (pi^.SessionID = SessionID)
          then
        begin
          Delete(i);
          break;
        end;
        i := i - 1;
      end;
    end;
  finally
    FList.UnlockList;
  end;

end;

procedure TNetStub.addItem(Item: PRItem);
begin
  try
    with FList.LockList do
      Add(Item);
  finally
    FList.UnlockList;
  end;
end;

function TNetStub.CheckItem(rec: TRItem): boolean;
const
  MIN_RANGE_DEPTH_CHECK = 50; // meter
var
  i: integer;
  pi: PRItem;
  range: double;
begin
  result := false;

  for i := 0 to GetCount - 1 do
  begin
    with FList.LockList do
    begin
      try
        pi := Items[i];
        if (pi^.InstanceIndex = rec.InstanceIndex) and
          (pi^.SessionID = rec.SessionID) then
        begin

          range := CalcRange(pi^.PosX, pi^.PosY, rec.PosX, rec.PosY)
            * C_NauticalMile_To_Metre;
          if range < MIN_RANGE_DEPTH_CHECK then
          begin
            pi^.FlagStatus := fsNone;
          end
          else
          begin
            pi^.FlagStatus := fsNeedUpdate;
            pi^.PosX := rec.PosX;
            pi^.PosY := rec.PosY;
            //FOnLogStr('Update Position for ' + IntToStr(pi^.InstanceIndex));
          end;
          pi^.LastUpdate := Now;
          result := true;
          break;
        end;
      finally
        FList.UnlockList;
      end;
    end;
  end;
end;

constructor TNetStub.Create;
begin
  FList := TThreadList.Create;
end;

destructor TNetStub.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TNetStub.FNetStub_OnClientConnect(const S: string);
begin
  if Assigned(OnLogStr) then
    OnLogStr('TNetStub.FNetStub_OnClientConnect', 'Server : ' +  S + ' connected');
end;

procedure TNetStub.FNetStub_OnClientDisConnect(const S: string);
begin
  if Assigned(OnLogStr) then
    OnLogStr('TNetStub.FNetStub_OnClientDisConnect', 'Server : ' + S + ' disconnected');

  RemoveAllItemIP(S);
end;

function TNetStub.GetCount: integer;
begin
  try
    with FList.LockList do
      result := Count;
  finally
    FList.UnlockList;
  end;
end;

procedure TNetStub.GetItem(Index: integer; var rec: TRItem);
var
  p: PRItem;
begin

  if Index >= GetCount then
    Exit;

  try
    with FList.LockList do
    begin
      p := Items[Index];

      rec.InstanceIndex := p^.InstanceIndex;
      rec.LastUpdate := p^.LastUpdate;
      rec.PosX := p^.PosX;
      rec.PosY := p^.PosY;
      rec.FlagStatus := p^.FlagStatus;
      rec.SessionID := p^.SessionID;
    end;

  finally
    FList.UnlockList;
  end;

end;

procedure TNetStub.GetPacket;
begin
  FNetTCPServer.getPacket;
end;

procedure TNetStub.SendBroadcast(const aID: Word; aBuffer: PAnsiChar);
begin
  FNetTCPServer.SendData(aID, aBuffer);
end;

procedure TNetStub.SendTo(const aID: Word; aBuffer: PAnsiChar;
  const ip: string);
var
  pid: ^TPacketID;
begin
  FNetTCPServer.SendDataToIPAddress(aID, aBuffer, ip);
  pid := @aBuffer^;
  pid^.ipReceiver := StrIp_To_LongIp(ip);

end;

procedure TNetStub.SetFlagItem(InstanceIndex, SessionID: integer;
  Flag: TFlagStatus);
var
  i: integer;
  pi: PRItem;
  list: TList;
begin
  list := FList.LockList;

  for i := 0 to list.Count - 1 do
  begin
    pi := list.Items[i];
    if (pi^.InstanceIndex = InstanceIndex) and (pi^.SessionID = SessionID) then
    begin
      pi^.FlagStatus := fsNone;
      break;
    end;
  end;
  FList.UnlockList;
end;

procedure TNetStub.SetOnLogStr(const Value: TLogStrProc);
begin
  FOnLogStr := Value;
end;

procedure TNetStub.StartListen;
begin
  FNetTCPServer.Listen(IntToStr(StubPort));
end;

procedure TNetStub.StartNetworking;
begin
  inherited;

  FNetTCPServer := TTCPServer.Create;
  FNetTCPSock := FNetTCPServer;

  FNetTCPServer.OnClient_Connect := FNetStub_OnClientConnect;
  FNetTCPServer.OnClient_DisConnect := FNetStub_OnClientDisConnect;

  FQueueBuffer := TPacketBuffer.Create;

  RegisterTCPPacket(CPID_CMD_MAPS, SizeOf(TRec_MapData), netRecvMapCmd);
end;

procedure TNetStub.StopListen;
begin
  FNetTCPServer.Stop;
end;

procedure TNetStub.StopNetworking;
begin
  inherited;
  FQueueBuffer.Free;
  FNetTCPServer.Free;
end;

{ TNetStubGC }

constructor TNetStubGC.Create;
begin

end;

destructor TNetStubGC.Destroy;
begin

  inherited;
end;

procedure TNetStubGC.FNetStubGC_OnClientConnect(const S: string);
begin
  if Assigned(OnLogStr) then
    OnLogStr('TNetStubGC.FNetStubGC_OnClientConnect', 'Game Control : ' +  S + ' connected');
end;

procedure TNetStubGC.FNetStubGC_OnClientDisConnect(const S: string);
begin
  if Assigned(OnLogStr) then
    OnLogStr('TNetStubGC.FNetStubGC_OnClientDisConnect', 'Game Control : ' +  S + ' disconnected');
end;

procedure TNetStubGC.netRecvGCMapCmd(apRec: PAnsiChar; aSize: Word);
//var
//  rec: ^TRec_MapData;
begin
//  rec := @apRec^;
//
//  if rec^.OrderID = CORD_CHANGE_MAPS then begin
//    FOnLogStr('MapStub is switching resource...' + IntToStr(rec^.ScenarioID) );
//    DepthLayerDB.GetDBResource(rec^.ScenarioID);
//    exit;
//  end;
end;

procedure TNetStubGC.SetOnLogStr(const Value: TLogStrProc);
begin
  FOnLogStr := Value;
end;

procedure TNetStubGC.StartListen;
begin
  FNetTCPServerGC.Listen(IntToStr(StubPort));
end;

procedure TNetStubGC.StartNetworking;
begin
  inherited;
  FNetTCPServerGC := TTCPServer.Create;
  FNetTCPSock := FNetTCPServerGC;

  FNetTCPServerGC.OnClient_Connect := FNetStubGC_OnClientConnect;
  FNetTCPServerGC.OnClient_DisConnect := FNetStubGC_OnClientDisConnect;

  RegisterTCPPacket(CPID_CMD_MAPS, SizeOf(TRec_MapData), netRecvGCMapCmd);

end;

procedure TNetStubGC.StopListen;
begin
  FNetTCPServerGC.Stop;
end;

procedure TNetStubGC.StopNetworking;
begin
  inherited;
  FNetTCPServerGC.Free;
end;

end.
