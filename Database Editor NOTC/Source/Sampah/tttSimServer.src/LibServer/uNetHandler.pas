unit uNetHandler;
// gantinya simulation manager.

interface

uses
   Classes, SysUtils,
   uTCPDatatype, uThreadTimer, uSteppers, OverbyteIcsWSocket, uTCP_Client_Mesh,
   uPacketBuffer;

type

//------------------------------------------------------------------------------
  TMessageStrProc = procedure(const msgs, sender: string) of object;

//------------------------------------------------------------------------------
  TNetHandler_image = class
  private
    FOnStartNetworking: TNotifyEvent;
    FOnStopNetworking: TNotifyEvent;
    FClientChangeState: TClientNetStatus;
    FServerChangeState: TServerNetStatus;

    F0nAcceptClient: TGetStrProc;
    FOnExitClient: TGetStrProc;
  protected
    FNetThread: TZTimer;
    FStrThread: TZTimer;
    FNetTimer: TDelayer;

    FTryConnect : Boolean;

    FNetBuffer : TPacketBuffer;

    procedure ev_NetThread (const dt: double);
    procedure ev_StrThread (const dt: double);

    procedure ev_net_reconnect(sender: TObject);

    procedure ev_CState(const clientIp: string; const NewState : TSocketState);
    procedure ev_SState(const NewState : TSocketState);

    procedure ev_AcceptClient(const clientIP: string);
    procedure ev_ExitClient(const clientIP: string);

  protected

    FOnNetMessageStr: TMessageStrProc;
    FOnGetCallsign: TMessageStrProc;

    procedure ev_net_string
      (apRec: PAnsiChar; aSize: integer; ipsender: string);

    procedure ev_handle_fixstring
      (apRec: PAnsiChar; aSize: integer);

    procedure ev_net_callsign
      (apRec: PAnsiChar; aSize: integer; ipsender: string);

  public
    constructor Create;
    destructor Destroy; override;

    procedure StartNetworking;
    procedure StopNetworking;

    procedure SendMyCallsign;

    property OnGetMessageStr: TMessageStrProc
      read FOnNetMessageStr write FOnNetMessageStr;

    property OnGetCallsign: TMessageStrProc
      read FOnGetCallsign write FOnGetCallsign;

    property OnStartNetworking: TNotifyEvent
      read FOnStartNetworking write FOnStartNetworking;

    property OnStopNetworking: TNotifyEvent
      read FOnStopNetworking write FOnStopNetworking;

    property OnClientChangeState: TClientNetStatus
      read FClientChangeState write FClientChangeState;

    property OnServerChangeState: TServerNetStatus
      read FServerChangeState write FServerChangeState;

    property OnAcceptClient: TGetStrProc read F0nAcceptClient write F0nAcceptClient;
    property OnExitClient: TGetStrProc read  FOnExitClient write FOnExitClient;

  end;


  var
     NetHandler_image: TNetHandler_image;


implementation

{ TNetHandler_image }

uses
  uTCP_Common, uSimSettings;

//==============================================================================
constructor TNetHandler_image.Create;
begin
  FTryConnect := False;

  FNetBuffer := TPacketBuffer.Create;

  netClient_Mesh := TTCP_CMesh.Create;
  netClient      := netClient_Mesh;

  netClient_Mesh.OnCStateClient := ev_CState;
  netClient_Mesh.OnCStateServer := ev_SState;

  netClient_Mesh.OnAcceptClient := ev_AcceptClient;
  netClient_Mesh.OnExitClient   := ev_ExitClient;


  FNetTimer := TDelayer.Create;
  FNetTimer.DInterval := 10000; // net connector

  FNetThread            := TZTimer.Create;
  FNetThread.Interval   := 0;   // ms
  FNetThread.OnRunning  := ev_NetThread;

  FStrThread            := TZTimer.Create;
  FStrThread.OnRunning  := ev_StrThread;
  FStrThread.Interval   := 0;   // ms


end;

destructor TNetHandler_image.Destroy;
begin

  FNetThread.OnRunning := nil;
  FNetThread.Free;

  FNetTimer.OnTime := nil;
  FNetTimer.Free;

  netClient      := nil;
  netClient_Mesh.Free;
  netClient_Mesh := nil;

  FStrThread.OnRunning := nil;
  FStrThread.Free;

  FNetBuffer.Clear;
  FNetBuffer.Free;

  inherited;
end;

//==============================================================================
procedure TNetHandler_image.ev_NetThread (const dt: double);
begin
  FNetTimer.Run(dt);

  netClient.ProcessMessages;
end;

//==============================================================================
procedure TNetHandler_image.ev_net_reconnect(sender: TObject);
begin
  if FTryConnect and not netClient.Connected then begin
     netClient.Connect; // connect to all client.
  end;
end;

//--  string processing ------------------------------------------------------
//  this procedure is experimental for testing purpose
{procedure TNetHandler_image.ev_net_string(apRec: PAnsiChar; aSize: integer;
  ipsender: string);
var pCopy: PAnsiChar;
    pSize : Word;
begin
  FNetBuffer.PutPacket(apRec, aSize);
   while FNetBuffer.GetPacket(pCopy, pSize) do begin


    ev_handle_fixstring(pCopy, pSize);
  end;



end;
}
{
//  this procedure work perfectly.
procedure TNetHandler_image.ev_net_string(apRec: PAnsiChar; aSize: integer;
  ipsender: string);
var pid: ^TPacketID;
    r : ^TRecString;
    r16: ^TRecCA_16;

    OriCallsign, ipSend: string;
    i: Integer;
    sData : string;
    c, cNul : Char;
begin
  pid := @apRec^;
  sData := '';

  if pid.recID =  HC_RECID_STRING then begin
    r := @apRec^;
    sData     := r^.data;
    ipSend  := LongIp_To_StrIp(r^.ipSender);
  end
  else begin
    r16 := @apRec^;
    ipSend  := LongIp_To_StrIp(r16^.addr.ipSender);

    sData := GetFixStringData(apRec);
  end;

  OriCallsign := netClient_Mesh.GetCallsignFromIP(ipSend);
  if Assigned(FOnNetMessageStr) then FOnNetMessageStr(sData, OriCallsign);

end;
}


procedure TNetHandler_image.ev_net_string(apRec: PAnsiChar; aSize: integer;
  ipsender: string);
begin
  FNetBuffer.PutPacket(apRec, aSize);
end;

procedure TNetHandler_image.ev_StrThread (const dt: double);
var pCopy: PAnsiChar;
    pSize : Word;
begin
  //get from buffer and throw;
  while FNetBuffer.GetPacket(pCopy, pSize) do begin

    ev_handle_fixstring(pCopy, pSize);
  end;

end;

procedure TNetHandler_image.ev_handle_fixstring
  (apRec: PAnsiChar; aSize: integer);
var pid: ^TPacketID;
    r : ^TRecString;
    r16: ^TRecCA_16;

    OriCallsign, ipSend: string;
    i: Integer;
    sData : string;
    c, cNul : Char;
begin
  pid := @apRec^;
  sData := '';

  if pid.recID =  HC_RECID_STRING then begin
    r := @apRec^;
    sData     := r^.data;
    ipSend  := LongIp_To_StrIp(r^.ipSender);
  end
  else begin
    r16 := @apRec^;
    ipSend  := LongIp_To_StrIp(r16^.addr.ipSender);

    sData := GetFixStringData(apRec);
  end;

  OriCallsign := netClient_Mesh.GetCallsignFromIP(ipSend);
  if Assigned(FOnNetMessageStr) then FOnNetMessageStr(sData, OriCallsign);

end;

//--  callsign update ------------------------------------------------------

procedure TNetHandler_image.ev_net_callsign(apRec: PAnsiChar;
  aSize: integer; ipSender: string);
var
  r: ^TRecUpdateCallsign;
  sNew, sOld, strIP: string;
  fGroup: string;
begin
  r := @apRec^;
  sNew := r^.NewCallsign;

  strIP := LongIp_To_StrIp(r^.ipSender);
  // if strIP <> ipSender then piye hayooo...

  sOld := netClient_Mesh.GetCallsignFromIP(strIP);

  if netClient_Mesh.ChangeClientCallsign(sNew, strIP) then
    if Assigned(FOnGetCallsign) then FOnGetCallsign(sNew, sOld);


  fGroup := ExtractFilePath(ParamStr(0))+  LibNetMeshSetting.groupIPList;

  if FileExists(fGroup) then
    netClient_Mesh.SaveGroupIPlist(fGroup);

end;

//==============================================================================
procedure TNetHandler_image.StartNetworking;
var fGroup: string;
begin
  if FTryConnect then Exit;// i'm still trying.. disconnect first!

  netClient_Mesh.RegisterProcedure(HC_RECID_STRING, ev_net_string,
    SizeOF(TRecString));

  netClient.RegisterProcedure(HC_RECID_CA_16 , ev_net_string, SizeOF(TRecCA_16 ));
  netClient.RegisterProcedure(HC_RECID_CA_32 , ev_net_string, SizeOF(TRecCA_32 ));
  netClient.RegisterProcedure(HC_RECID_CA_64 , ev_net_string, SizeOF(TRecCA_64 ));
  netClient.RegisterProcedure(HC_RECID_CA_128, ev_net_string, SizeOF(TRecCA_128));
  netClient.RegisterProcedure(HC_RECID_CA_192, ev_net_string, SizeOF(TRecCA_192));
  netClient.RegisterProcedure(HC_RECID_CA_256, ev_net_string, SizeOF(TRecCA_256));
  netClient.RegisterProcedure(HC_RECID_CA_384, ev_net_string, SizeOF(TRecCA_384));
  netClient.RegisterProcedure(HC_RECID_CA_512, ev_net_string, SizeOF(TRecCA_512));


  netClient_Mesh.RegisterProcedure(HC_RECID_SYNCHCALLSIGN, ev_net_callsign,
    SizeOF(TRecUpdateCallsign));

  fGroup := ExtractFilePath(ParamStr(0))+  LibNetMeshSetting.groupIPList;

  if FileExists(fGroup) then
    netClient_Mesh.LoadGroupIPlist(fGroup);

  FTryConnect := True;
  try
    netClient_Mesh.Listen; // make my self online.
  except
    on ESocketException do
  end;

  try
    netClient.Connect;     // then connect to other.
  except
  end;

  FNetTimer.OnTime      := ev_net_reconnect;
  FNetTimer.Enabled     := True;

  FNetThread.OnRunning  := ev_NetThread;
  FNetThread.Enabled    := True;

  FStrThread.OnRunning  := ev_StrThread;
  FStrThread.Enabled    := True;

//  FStrThread.OnRunning  := nil;

  if Assigned(FOnStartNetworking) then FOnStartNetworking(self);
end;

procedure TNetHandler_image.StopNetworking;
begin
  FTryConnect           := False;
  FNetThread.Enabled    := false;
  FNetThread.OnRunning  := nil;


  FNetTimer.OnTime  := nil;
  FNetTimer.Enabled := false;

  FStrThread.OnRunning  := nil;
  FStrThread.Enabled    := False;

  try
    (netClient as TTCP_CMesh).UnListen;
  except
  end;

  try
    netClient.DisConnect;
  except
  end;

  netClient.UnRegisterProcedure(HC_RECID_STRING);
  netClient.UnRegisterProcedure(HC_RECID_SYNCHCALLSIGN);

  netClient.UnRegisterProcedure(HC_RECID_CA_512);
  netClient.UnRegisterProcedure(HC_RECID_CA_384);
  netClient.UnRegisterProcedure(HC_RECID_CA_256);
  netClient.UnRegisterProcedure(HC_RECID_CA_192);
  netClient.UnRegisterProcedure(HC_RECID_CA_128);
  netClient.UnRegisterProcedure(HC_RECID_CA_64 );
  netClient.UnRegisterProcedure(HC_RECID_CA_32 );
  netClient.UnRegisterProcedure(HC_RECID_CA_16 );


  if Assigned(FOnStopNetworking) then FOnStopNetworking(self);
end;

//==============================================================================
procedure TNetHandler_image.ev_CState(const clientIp: string; const NewState : TSocketState);
begin
  if Assigned(FClientChangeState) then begin
    FClientChangeState(clientIp, NewState);

  end;
end;

procedure TNetHandler_image.ev_SState(const NewState : TSocketState);
begin
  if Assigned(FServerChangeState) then
    FServerChangeState(NewState);
end;

function LimitStr(const sNew: string): string;
begin
  if Length(sNew) > 15 then
    result  := Copy(sNew, 1, 16)
  else
    Result  := sNew;
end;

procedure TNetHandler_image.SendMyCallsign;
var
  rCall : TRecUpdateCallsign;
  s : string;
begin

  rCall.NewCallsign := LimitStr(netClient_Mesh.MyCallsign);
  rCall.NewShipName := LimitStr(netClient_Mesh.MyShipName);

  rCall.ipSender :=  StrIp_To_LongIp(netClient_Mesh.MyIpAddress);

  netClient_Mesh.SendData(HC_RECID_SYNCHCALLSIGN, @rCall);
end;

procedure TNetHandler_image.ev_AcceptClient(const clientIP: string);
var s: string;
begin
  SendMyCallsign;

  s := netClient_Mesh.GetCallsignFromIP(clientIP);
  if Assigned(F0nAcceptClient) then
   F0nAcceptClient(s);

end;

procedure TNetHandler_image.ev_ExitClient(const clientIP: string);
var s: string;
begin
  s := netClient_Mesh.GetCallsignFromIP(clientIP);
  if Assigned(FOnExitClient) then
    FOnExitClient(s);

end;

end.
