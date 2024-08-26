﻿unit uNetLinkServer;

interface

uses
  System.SysUtils,
  System.Classes,

  OverbyteIcsWSocket,
  OverbyteIcsWSocketS,

  uDataType,
  uDataManager,
  UPacketProtocol,
  uBuffer,
  UHelper;

type
  // -----------------------------------------------------------------------------
  TClientConnected = class(TWSocketClient)
  private
    FBuffer: TBytes;
    FPacketizer: TPacketProtocol;
  public
    ConnectedIP: string;
    ConnectedPort: string;
    ConnectTime: TDateTime;
  end;

  // -----------------------------------------------------------------------------
  TNetLinkServer = class
  private
    WSocket: TWSocket;
    WSockServer: TWSocketServer;

    FLogStat, FLogSend, FLogRecv: TGetStrProc;

    FIPIndex: TStringList;

    FRegProcs: TPacketManager;

    FOnClient_Connect: TGetStrProc;
    FOnClient_DisConnect: TGetStrProc;
    FOnSvrChangeState: TChangeState;

    // FLongXAddress: Longword;
    FDataQueue: TDataQueue;
    FLongXAddress: Longword;

    function getClientCount: Integer;
    function getClientConnected(i: Integer): TClientConnected;


    procedure DefStrLog(const s: string);
    procedure SetStrLog(const index: integer; const Value: TGetStrProc);

    function GetChangeState: TChangeState;
    procedure SetChangeState(const Value: TChangeState);
    procedure HandleException(AE: exception; AClient: TWSocket);

    procedure WSockServer_OnChangeState(Sender: TObject;
      OldState, NewState: TSocketState);
    procedure WSockServer_OnClientConnect(Sender: TObject;
      Client: TWSocketClient; Error: Word);
    procedure WSockServer_OnClientDisconnect(Sender: TObject;
      Client: TWSocketClient; Error: Word);
    procedure Client_OnDataAvailable(Sender: TObject; Error: Word);
    procedure Client_OnBGException(Sender: TObject; E: Exception;
      var CanClose: Boolean);

    procedure MessageArrived(const AData: TBytes);

  public
    constructor Create;
    destructor Destroy; override;

    procedure Listen(aPort: string);
    procedure Stop;

//    procedure SendData(const aID: Word; aBuffer: PAnsiChar);
//    procedure SendDataExceptThis(const aID: Word; aBuffer: PAnsiChar;
//      const ipExcept: string);
//    procedure SendDataToIPAddress(const aID: Word; aBuffer: PAnsiChar;
//      const ipAdd: string);
    procedure SendData<T>(const aID: Word; aData: T);
    procedure SendDataExceptThis<T>(const aID: Word; aData: T;
      const ipExcept: string; const portExcept: string);
    procedure SendDataToIPAddress<T>(const aID: Word; aData: T;
      const ipTarget: string; const portTarget: string);

    procedure FlushSendData;
    procedure GetConnectedList(var sl: TStringList);

    procedure RegisterProcedure(const aType: Word;
      aProcedure: TPacketHandlerProc);
    procedure UnRegisterProcedure(const aType: Word);
    procedure UnregisterAllProcedure;

    procedure GetPacket;

    property OnClient_Connect: TGetStrProc read FOnClient_Connect
      write FOnClient_Connect;
    property OnClient_DisConnect: TGetStrProc read FOnClient_DisConnect
      write FOnClient_DisConnect;
    property OnStateChange: TChangeState read GetChangeState
      write SetChangeState;
    property ClientCount: Integer read getClientCount;
    property Clients[i: Integer]: TClientConnected read getClientConnected;
    property LongIP: Longword read FLongXAddress;

    property OnGetStatusLog: TGetStrProc index 1 read FLogStat write SetStrLog;
    property OnGetSendLog: TGetStrProc index 2 read FLogSend write SetStrLog;
    property OnGetRecvLog: TGetStrProc index 3 read FLogRecv write SetStrLog;
  end;

implementation

uses
  DateUtils;

constructor TNetLinkServer.Create;
begin
  inherited;
  WSockServer := TWSocketServer.Create(nil);
  WSocket := WSockServer;

  FRegProcs := TPacketManager.Create;

  WSockServer.MultiThreaded := False;
  WSockServer.OnChangeState := WSockServer_OnChangeState;

  FIPIndex := TStringList.Create;
  FIPIndex.Sorted := True;
  FIPIndex.Duplicates := dupAccept;

  FDataQueue := TDataQueue.Create;
  FDataQueue.RegProcs := FRegProcs;
end;

destructor TNetLinkServer.Destroy;
begin
  FRegProcs.DisposeOf;
  FIPIndex.Clear;
  FIPIndex.Free;
  WSocket := nil;
  WSockServer.Free;
  WSockServer := nil;

  FDataQueue.DisposeOf;
  inherited;
end;

procedure TNetLinkServer.DefStrLog(const s: string);
begin
  // do nothing
  // LogFile_net(s);
end;

procedure TNetLinkServer.SetStrLog(const index: integer; const Value: TGetStrProc);
begin
  var
    x: TGetStrProc;
  if not Assigned(Value) then
    x := DefStrLog
  else
    x := Value;
  case index of
    1:
      FLogStat := x;
    2:
      FLogSend := x;
    3:
      FLogRecv := x;
  end;
  FDataQueue.LogRecv:= x;
end;

procedure TNetLinkServer.SetChangeState(const Value: TChangeState);
begin
  FOnSvrChangeState := Value;
end;

procedure TNetLinkServer.HandleException(AE: exception; AClient: TWSocket);
begin
  if (AE is ESocketException) then
  begin
    if Assigned(FLogStat) then
      FLogStat(TimeToString + '  Error : ' + AClient.Addr + AE.Message);
    AClient.Close;
  end
  else
  begin
    if Assigned(FLogStat) then
      FLogStat(TimeToString + ': Unhandled exception raised!');
  end;
end;

function TNetLinkServer.GetChangeState: TChangeState;
begin
  Result := FOnSvrChangeState;
end;

procedure TNetLinkServer.WSockServer_OnChangeState(Sender: TObject;
  OldState, NewState: TSocketState);
begin
  if Assigned(FOnSvrChangeState) then
    FOnSvrChangeState(Sender, OldState, NewState);
end;

procedure TNetLinkServer.Listen(aPort: string);
begin
  if WSockServer.State = wsClosed then
  begin
    WSockServer.OnClientConnect := WSockServer_OnClientConnect;
    WSockServer.OnClientDisconnect := WSockServer_OnClientDisconnect;
    WSockServer.Proto := C_SOCK_DEF_PROTO;
    WSockServer.Port := aPort;
    WSockServer.Addr := '0.0.0.0';
    WSockServer.LineMode := False;
    WSockServer.LineEdit := False;
    WSockServer.LineEcho := False;
    WSockServer.ClientClass := TClientConnected;
    WSockServer.Banner := '';
    WSockServer.Listen;
    FLongXAddress := StrToLongIP(WSockServer.LocalAddr);

    if Assigned(FLogStat) then
    begin
      FLogStat(DateToString + ': ' + 'Server Listening at port ' + aPort);
      FLogStat('addr : ' + WSockServer.Addr);
      FLogStat('local :' + WSockServer.LocalAddr);
      FLogStat('x addr' + WSockServer.GetXAddr);
    end;
  end;
end;

procedure TNetLinkServer.Stop;
begin
  var cClient: TWSocketClient;
  for var i: Integer := 0 to WSockServer.ClientCount - 1 do
  begin
    cClient := WSockServer.Client[i];
    if cClient.State <> wsClosed then
      cClient.Close;
    var cCon: TClientConnected:= TClientConnected(cClient);
    if Assigned(cCon.FPacketizer) then
    begin
      cCon.FPacketizer.MessageArrived := nil;
      cCon.FPacketizer.DisposeOf;
    end;
  end;
  WSockServer.Close;
  WSockServer.OnClientConnect := nil;
  WSockServer.OnClientDisconnect := nil;
  FDataQueue.Clear;
  if Assigned(FLogStat) then
    FLogStat(DateToString + ': ' + 'Server stopped');
end;

//procedure TNetLinkServer.SendData(const aID: Word; aBuffer: PAnsiChar);
//var
//  pSize: Word;
//  i: Integer;
//  cCon: TClientConnected;
//  strTemp: string;
//begin
//  if WSockServer.ClientCount <= 0 then
//    Exit;
//  if not PrepareSendData(aID, aBuffer) then
//  begin
//    FLogSend(TimeToString + ': Unregistered Packet ID ' + inttostr(aID));
//    Exit;
//  end;
//  pSize := FRegProcs[aID].recSize;
//  strTemp := 'Send ALL: ID ' + inttostr(aID) + inttostr(pSize) + ' byte ';
//  for i := WSockServer.ClientCount - 1 downto 0 do
//  begin
//    cCon := TClientConnected(WSockServer.Client[i]);
//    if (cCon <> nil) and (cCon.State = wsConnected) then
//    begin
//      // if not cCon.AllSent then
//      // cCon.Flush;
//      FLogSend(TimeToString + ': ' + strTemp + ', to: ' + cCon.ConnectedIP);
//      try
//        cCon.Send(aBuffer, pSize);
//      except
//        on E: Exception do
//          HandleException(E, cCon);
//      end; // end exception
//    end;
//  end;
//end;

procedure TNetLinkServer.SendData<T>(const aID: Word; aData: T);
begin
  if WSockServer.ClientCount <= 0 then
    Exit;

  if not FRegProcs.IsRegistered(aID) then
  begin
    if Assigned(FLogSend) then
      FLogSend(TimeToString + ': Unregistered Packet ID ' + inttostr(aID));
    Exit;
  end;

  //pSize := FRegProcs[aID].recSize;
  //strTemp := 'Send ALL: ID ' + inttostr(aID) + inttostr(pSize) + ' byte ';

  var
    h: TPacketHeader;
  var
    dtutc: TDateTime:= TTimeZone.Local.ToUniversalTime(Now);

  h.PacketID := aID;
  h.SenderAddress := FLongXAddress;
  h.SenderPort := StrToInt(WSocket.GetXPort);
  h.SentTime := DateTimeToUnixMs(dtutc, False);
  var
    DataBytes: TBytes := TPacketProtocol.WrapMessage
      (UHelper.TComposer.ComposePacket(h, aData));
  var
    sz: integer := Length(DataBytes);
  var
    strTemp := 'Send ALL: ID ' + inttostr(aID) + ' -  ' + inttostr(sz) + ' byte ';

  var cCon: TClientConnected;
  for var i:Integer := WSockServer.ClientCount - 1 downto 0 do
  begin
    cCon:= TClientConnected(WSockServer.Client[i]);
    if (cCon <> nil) and (cCon.State = wsConnected) then
    begin
      // if not cCon.AllSent then
      // cCon.Flush;

      if Assigned(FLogSend) then
        FLogSend(TimeToString + ': ' + strTemp + ', to: ' +
          cCon.ConnectedIP + ':' + cCon.ConnectedPort);
      try
        cCon.Send(DataBytes, sz);
      except
        on E: Exception do
          HandleException(E, cCon);
      end; // end exception
    end;
  end;
end;

//procedure TNetLinkServer.SendDataExceptThis(const aID: Word; aBuffer: PAnsiChar;
//  const ipExcept: string);
//var
//  pSize: Word;
//  i: Integer;
//  cCon: TClientConnected;
//  strTemp: string;
//begin
//  if WSockServer.ClientCount <= 0 then
//    Exit;
//  if not PrepareSendData(aID, aBuffer) then
//  begin
//    FLogSend(TimeToString + ': Unregistered Packet ID ' + inttostr(aID));
//    Exit;
//  end;
//  pSize := FRegProcs[aID].recSize;
//  strTemp := 'Send: ID ' + inttostr(aID) + ' EXCEPT ' + ipExcept;
//  for i := 0 to WSockServer.ClientCount - 1 do
//  begin
//    cCon := TClientConnected(WSockServer.Client[i]);
//    if (cCon <> nil) and (cCon.ConnectedIP <> ipExcept) and
//      (cCon.State = wsConnected) then
//    begin
//      if not cCon.AllSent then
//        cCon.Flush;
//      FLogSend(TimeToString + ': ' + strTemp + ', to: ' + cCon.ConnectedIP);
//      try
//        cCon.Send(aBuffer, pSize);
//      except
//        on E: Exception do
//          HandleException(E, cCon);
//      end; // end exception
//    end;
//  end;
//end;

procedure TNetLinkServer.SendDataExceptThis<T>(const aID: Word; aData: T;
      const ipExcept: string; const portExcept: string);
begin
  if WSockServer.ClientCount <= 0 then
    Exit;

  if not FRegProcs.IsRegistered(aID) then
  begin
    if Assigned(FLogSend) then
      FLogSend(TimeToString + ': Unregistered Packet ID ' + inttostr(aID));
    Exit;
  end;

  var
    h: TPacketHeader;
  var
    dtutc: TDateTime:= TTimeZone.Local.ToUniversalTime(Now);

  h.PacketID := aID;
  h.SenderAddress := FLongXAddress;
  h.SenderPort := StrToInt(WSocket.GetXPort);
  h.SentTime := DateTimeToUnixMs(dtutc, False);
  var
    DataBytes: TBytes := TPacketProtocol.WrapMessage
      (UHelper.TComposer.ComposePacket(h, aData));
  var
    sz: integer := Length(DataBytes);
  var
    strTemp := 'Send : ID ' + inttostr(aID) + ' EXCEPT ' + ipExcept +
      ' -  ' + inttostr(sz) + ' byte ';

  var cCon: TClientConnected;
  for var i:Integer := WSockServer.ClientCount - 1 downto 0 do
  begin
    cCon:= TClientConnected(WSockServer.Client[i]);
    if (cCon <> nil) and (cCon.State = wsConnected) then
      if (cCon.ConnectedIP = ipExcept) and (cCon.ConnectedPort = portExcept) then
      else
      begin
        // if not cCon.AllSent then
        // cCon.Flush;

        if Assigned(FLogSend) then
          FLogSend(TimeToString + ': ' + strTemp + ', to: ' +
            cCon.ConnectedIP + ':' + cCon.ConnectedPort);
        try
          cCon.Send(DataBytes, sz);
        except
          on E: Exception do
            HandleException(E, cCon);
        end; // end exception
      end;
  end;
end;

//
//procedure TNetLinkServer.SendDataToIPAddress(const aID: Word; aBuffer: PAnsiChar;
//  const ipAdd: string);
//var
//  pSize: Word;
//  i: Integer;
//  cCon: TClientConnected;
//begin
//  // gimana klo ada multiple connection dari ip address yg sama?
//  // kirim ke semua..
//  if not PrepareSendData(aID, aBuffer) then
//  begin
//    FLogSend(TimeToString + ': Unregistered Packet ID ' + inttostr(aID));
//    Exit;
//  end;
//  pSize := FRegProcs[aID].recSize;
//  if not FIPIndex.Find(ipAdd, i) then
//  begin
//    FLogSend(TimeToString + ': ' + ipAdd + ' not connected');
//    Exit;
//  end;
//  for i := 0 to FIPIndex.Count - 1 do
//  begin
//    cCon := TClientConnected(FIPIndex.Objects[i]);
//    // if (cCon = nil) then continue; delete ?
//    if (cCon.PeerAddr = ipAdd) and (cCon.State = wsConnected) then
//    begin
//      FLogSend(TimeToString + ':ID ' + inttostr(aID) + ' to: ' + cCon.ConnectedIP);
//      try
//        cCon.Send(aBuffer, pSize);
//      except
//        on E: Exception do
//          HandleException(E, cCon);
//      end; // end exception
//    end;
//  end;
//end;

procedure TNetLinkServer.SendDataToIPAddress<T>(const aID: Word; aData: T;
      const ipTarget: string; const portTarget: string);
begin
  if WSockServer.ClientCount <= 0 then
    Exit;

  if not FRegProcs.IsRegistered(aID) then
  begin
    if Assigned(FLogSend) then
      FLogSend(TimeToString + ': Unregistered Packet ID ' + inttostr(aID));
    Exit;
  end;

  var
    isFound: Boolean:= False;

  var cCon: TClientConnected;
  for var i: Integer := 0 to FIPIndex.Count - 1 do
  begin
    var obj: TObject:= FIPIndex.Objects[i];
    if obj <> nil then
    begin
      cCon := TClientConnected(obj);
      if (cCon.PeerAddr = ipTarget) and (cCon.PeerPort = portTarget) and
        (cCon.State = wsConnected) then
      begin
        isFound:= True;
        Break
      end;
    end;
  end;

  if isFound then
  begin
    var
      h: TPacketHeader;
    var
      dtutc: TDateTime:= TTimeZone.Local.ToUniversalTime(Now);

    h.PacketID := aID;
    h.SenderAddress := FLongXAddress;
    h.SenderPort := StrToInt(WSocket.GetXPort);
    h.SentTime := DateTimeToUnixMs(dtutc, False);
    var
      DataBytes: TBytes := TPacketProtocol.WrapMessage
        (UHelper.TComposer.ComposePacket(h, aData));
    var
      sz: integer := Length(DataBytes);

    FLogSend(TimeToString + ':ID ' + inttostr(aID) + ' to: ' + cCon.ConnectedIP);
      try
        cCon.Send(DataBytes, sz);
      except
        on E: Exception do
          HandleException(E, cCon);
      end; // end exception
  end;

end;

procedure TNetLinkServer.WSockServer_OnClientConnect(Sender: TObject;
  Client: TWSocketClient; Error: Word);
begin
  var cCon: TClientConnected := TClientConnected(Client);

  SetLength(cCon.FBuffer, 4 * 1024);

  with cCon do
  begin
    LineMode := False;
    LineEdit := False;
    LineEcho := False;
    OnDataAvailable := Client_OnDataAvailable;
    OnBgException := Client_OnBGException;
    ConnectTime := Now;
    FPacketizer := TPacketProtocol.Create(10000);
    FPacketizer.MessageArrived := MessageArrived;
  end;

  var ipAdd: string := cCon.PeerAddr;
  cCon.ConnectedIP := ipAdd;
  cCon.ConnectedPort:= cCon.PeerPort;
  FIPIndex.AddObject(ipAdd, cCon);
  if Assigned(FOnClient_Connect) then
    FOnClient_Connect(ipAdd);
  if Assigned(FLogStat) then
    FLogStat(TimeToString + ': ' + 'Connection from ' + ipAdd + ':' + cCon.PeerPort);
end;

procedure TNetLinkServer.WSockServer_OnClientDisconnect(Sender: TObject;
  Client: TWSocketClient; Error: Word);
begin
  var cCon: TClientConnected := TClientConnected(Client);
  if Assigned(cCon.FPacketizer) then
  begin
    cCon.FPacketizer.MessageArrived := nil;
    cCon.FPacketizer.DisposeOf;
    cCon.FPacketizer:= nil;
  end;

  var i: Integer := FIPIndex.IndexOfObject(cCon);
  if i >= 0 then
    FIPIndex.Delete(i);

  var ipAdd: string := cCon.PeerAddr;
  if Assigned(FOnClient_DisConnect) then
    FOnClient_DisConnect(ipAdd);

  SetLength(cCon.FBuffer, 0);

  if Assigned(FLogStat) then
    FLogStat(TimeToString + ': ' + 'Disconnecting ' + ipAdd + ':' + cCon.PeerPort +
      ', duration: ' + FormatDateTime('hh:nn:ss', Now - cCon.ConnectTime));
end;

procedure TNetLinkServer.Client_OnBGException(Sender: TObject; E: Exception;
  var CanClose: Boolean);
begin
  if Assigned(FLogStat) then
    FLogStat(TimeToString + ': ' + 'Client exception occured: ' + E.ClassName + ': ' +
      E.Message);
  CanClose := True;
end;

//procedure TNetLinkServer.Client_OnDataAvailable(Sender: TObject; Error: Word);
//var
//  lbuffer: PAnsiChar;
//  receivedByte, readByte: Integer;
//  p: pointer;
//  findRec: Boolean;
//  pSize: ^Word;
//  recSize: Integer;
//  ipSend: string;
//  bCount: Integer;
//  cCon: TClientConnected;
//begin
//  if Assigned(FLogData) then
//    FLogData('Error Code : ' + inttostr(Error));
//  if Error <> 0 then
//    Exit; // tambahan dari farid
//  cCon := TClientConnected(Sender);
//  ipSend := cCon.PeerAddr;
//  receivedByte := cCon.RcvdCount;
//  // Number of characters in receive buffer but not read yet.
//  if receivedByte < 1 then
//    Exit;
//  FLogRecv(TimeToString + ': ' + inttostr(receivedByte));
//  GetMem(lbuffer, receivedByte + 1);
//  readByte := TWSocket(Sender).Receive(lbuffer, receivedByte);
//  if readByte < 1 then
//    Exit;
//  p := cCon.FBuffer + cCon.FBufferNow;
//  CopyMemory(PAnsiChar(p), lbuffer, readByte);
//  Inc(cCon.FBufferNow, readByte);
//  p := cCon.FBuffer;
//  bCount := cCon.FBufferNow;
//  findRec := True;
//  while findRec and (bCount >= CMAX_PACKET_BYTESIZE) do
//  begin
//    pSize := p;
//    recSize := pSize^;
//    findRec := bCount >= recSize;
//    if (findRec) then
//    begin
//      // PacketRecognizer(p, recSize, cCon.ConnectedIP); // ambil 1 record, lempar.
//      FDataBuffer.PutPacket(p, recSize, cCon.ConnectedIP);
//      // ambil 1 record, lempar.
//      bCount := bCount - recSize;
//      p := pByte(Integer(p) + recSize);
//    end;
//  end;
//  if bCount > 0 then
//  begin
//    CopyMemory(cCon.FBuffer, p, bCount); // geser data ke awal FBuffer
//  end;
//  cCon.FBufferNow := bCount;
//  FreeMem(lbuffer);
//end;

procedure TNetLinkServer.Client_OnDataAvailable(Sender: TObject; Error: Word);
begin
  if Assigned(FLogStat) then
    FLogStat('Error Code : ' + inttostr(Error));

  if Error <> 0 then
    Exit;

  var cCon: TClientConnected := TClientConnected(Sender);
  var ipSend: string := cCon.PeerAddr;

  try
    FillChar(cCon.FBuffer[0], Length(cCon.FBuffer), 0);
    var receivedByte: Integer := TWSocket(Sender).Receive(cCon.FBuffer,
      Length(cCon.FBuffer));
    if Assigned(FLogRecv) then
      FLogRecv(TimeToString + ': ReceivedBytes = ' + inttostr(receivedByte));
    if receivedByte < 1 then
      Exit;

    // svrIP := TWSocket(Sender).Addr;

    var readBytes: TBytes;
    SetLength(readBytes, receivedByte);
    Move(cCon.FBuffer[0], readBytes[0], receivedByte);
    cCon.FPacketizer.DataReceived(readBytes);

  finally

  end;
end;

procedure TNetLinkServer.MessageArrived(const AData: TBytes);
begin
  if Assigned(FLogRecv) then
    FLogRecv('Packet Found.');
  FDataQueue.PutPacket(AData);
end;

function TNetLinkServer.getClientConnected(i: Integer): TClientConnected;
begin
  Result := nil;
  if i < WSockServer.ClientCount then
    Result := WSockServer.Client[i] as TClientConnected
end;

function TNetLinkServer.getClientCount: Integer;
begin
  // kalo pakai WSockServer.ClientCount, waktu event client onDisconnect
  // client yg sedang OnDisconnect masih dihitung.
  // Result := WSockServer.ClientCount;
  Result := FIPIndex.Count;
end;

procedure TNetLinkServer.FlushSendData;
begin
  var cCon: TClientConnected;
  for var i: Integer := 0 to WSockServer.ClientCount - 1 do
  begin
    cCon:= TClientConnected(WSockServer.Client[i]);
    if (cCon <> nil) and (cCon.State = wsConnected) then
    begin
      if not cCon.AllSent then
      begin
        if Assigned(FLogSend) then
          FLogSend(TimeToString + ': flush  ' + cCon.ConnectedIP + ':' +
            cCon.ConnectedPort);
        cCon.Flush;
      end;
    end;
  end;
end;

procedure TNetLinkServer.GetConnectedList(var sl: TStringList);
begin
  if not Assigned(sl) then
    sl := TStringList.Create;
  sl.Clear;

  var cCon: TClientConnected;
  for var i: Integer := 0 to WSockServer.ClientCount - 1 do
  begin
    cCon:= TClientConnected(WSockServer.Client[i]);
    if (cCon <> nil) and (cCon.State = wsConnected) then
      sl.Add(cCon.PeerAddr + ':' + cCon.PeerPort);
  end;
end;

procedure TNetLinkServer.GetPacket;
begin
  FDataQueue.GetPacket;
end;

procedure TNetLinkServer.RegisterProcedure(const aType: Word;
  aProcedure: TPacketHandlerProc);
begin
  if Assigned(FRegProcs) and Assigned(aProcedure) then
    FRegProcs.Register(aType, aProcedure);
end;

procedure TNetLinkServer.UnRegisterProcedure(const aType: Word);
begin
  if Assigned(FRegProcs) then
    FRegProcs.UnRegister(aType);
end;

procedure TNetLinkServer.UnregisterAllProcedure;
begin
  if Assigned(FRegProcs) then
    FRegProcs.UnregisterALL;
end;

end.
