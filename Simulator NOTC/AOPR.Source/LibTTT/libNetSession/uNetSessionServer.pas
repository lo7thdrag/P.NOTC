unit uNetSessionServer;

interface

uses

  Classes, OverbyteIcsWSocket, uNetBaseSocket, uTCPServer, uPacketBuffer, uNetSessionData,
  uBaseNetHandler, uExecuter, uGamePlayType, uTCPDataType, uThreadTimer{,
  IdHashSHA1};

type

  TNetStringProc = procedure(const sClientIP, sInfo: string) of object;

{  TSesionMember = class
  public
    IpAddress: string;

  end;
}

  TNetSessionServer = class(TBaseNetHandler)
  private
//     procedure netLog(const sLog: string);

  protected
    FTCPServer : TTCPServer;
    FPortListen: string;

    FOnClientConnect    : TGetStrProc;
    FOnClientDisConnect : TGetStrProc;

    FSessionSetterIP : string;

    FDBEditSessionVar,
    FGamePlaySessionVar       : TSessionVar;

    FAppGame    : TAppExecute;
    FOnSessionStateChange : TNotifySessionState;

    FOnNetLog : TNetStringProc;

    FAllCubAssign: TStringList;

    FThread : TMSTimer;

    procedure threadOnRunning(const dt: double);

    procedure netOnClientConnect(const sClientIp: string);
    procedure netOnClientDisConnect(const sClientIp: string);

    procedure netOnRecv_Request (apRec: PAnsiChar; aSize: Word);

    procedure netOnRecv_Session (apRec: PAnsiChar; aSize: Word);

    procedure netSend_SessionData(const CID: byte; const sv: TSessionVar; const ipAdd: string='');  //   ''-> broadcast

    procedure netSend_OnlineList(const ipAdd: string);
    procedure netSend_ServerTime(const ipAdd: string; const flag: Word);

    procedure netOnRecv_DBE_TBL_UPDATE(apRec: PAnsiChar; aSize: Word);

    procedure netOnRecv_CubicleAssign(apRec: PAnsiChar;
      aSize: Word);

    procedure netSend_CubicleAssignInfo(const toIp: string);

    procedure netSend_NotifyMapSynch();
    procedure netRecv_CmdVersion(apRec: PAnsiChar; aSize: word);
  public

    constructor Create;
    destructor Destroy; override;

    procedure ApplySetting; override;

    procedure StartNetworking; override;
    procedure StopNetworking; override;

    //--------------------------------------------------------------------------
    procedure SetSessionState(const ssType: TSessionType;
      const ssState: boolean;
      const scID: Integer;
      const ssName: string ;
      const cGPMType : byte ;
      const cGPMFName : string );

    procedure SendUpdateSession(const sv: TSessionVar);

    procedure StartDBEditSession;
    procedure StopDBEditSession;

  public

    property OnClientConnect: TGetStrProc read FOnClientConnect
       write FOnClientConnect;

    property OnClientDisConnect: TGetStrProc read FOnClientDisConnect
      write FOnClientDisConnect;

    //--------------------------------------------------------------------------
    property OnSessionStateChange: TNotifySessionState read FOnSessionStateChange
      write FOnSessionStateChange;

    property OnNetLog: TNetStringProc read FOnNetLog write FOnNetLog;
  end;

  procedure BeginServer;
  procedure EndServer;

var

  theServer: TNetSessionServer;

const
  CKEY1 = 53761;
  CKEY2 = 32618;

implementation

uses

  SysUtils,  uLibSettingTTT, uGameData_TTT;


procedure BeginServer;
begin
  vSettingFile := getFileSetting;
  LoadFF_NetSetting(vSettingFile, vNetSetting);
  LoadFF_AppSetting(vSettingFile, vAppSetting);
  LoadFF_GameSetting(vSettingFile, vGameDataSetting);

  theServer := TNetSessionServer.Create;

end;

procedure EndServer;
begin

  theServer.Free;
end;

//  TRecNodeOnlineList = packed record
//    pid       : TPacketID;
//    NodeOrder : Word;  // info / update
//    B4        : byte;
//    B3        : byte;
//    B2        : byte;
//    B0  : array [0..8] of LongWord;
//  end;

//function SHA1FromString(const AString: string): string;
//var
//  SHA1: TIdHashSHA1;
//begin
////  SHA1 := TIdHashSHA1.Create;
////  try
////    Result := SHA1.HashStringAsHex(AString);
////  finally
////    SHA1.Free;
////  end;
//end;

function EncryptStr(const S :WideString; Key: Word): String;
var   i          :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
begin
  Result:= '';
  RStr:= UTF8Encode(S);
  for i := 0 to Length(RStr)-1 do begin
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (RStrB[i] + Key) * CKEY1 + CKEY2;
  end;
  for i := 0 to Length(RStr)-1 do begin
    Result:= Result + IntToHex(RStrB[i], 2);
  end;
end;

function DecryptStr(const S: String; Key: Word): String;
var   i, tmpKey  :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
      tmpStr     :string;
begin
  tmpStr:= UpperCase(S);
  SetLength(RStr, Length(tmpStr) div 2);
  i:= 1;
  try
    while (i < Length(tmpStr)) do begin
      RStrB[i div 2]:= StrToInt('$' + tmpStr[i] + tmpStr[i+1]);
      Inc(i, 2);
    end;
  except
    Result:= '';
    Exit;
  end;
  for i := 0 to Length(RStr)-1 do begin
    tmpKey:= RStrB[i];
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (tmpKey + Key) * CKEY1 + CKEY2;
  end;
  Result:= UTF8Decode(RStr);
end;

constructor TNetSessionServer.Create;
begin
  inherited;
  FAppGame  := TAppExecute.Create;

  FTCPServer := TTCPServer.Create;
  FNetSock := FTCPServer;

  FTCPServer.OnStateChange        := FTCPSock_OnSocketChangeState;
  FTCPServer.OnClient_Connect     := netOnClientConnect;
  FTCPServer.OnClient_DisConnect  := netOnClientDisConnect;
//  FTCPServer.OnGetStatusLog  := netLog;

  FDBEditSessionVar.SessionType   := ssEditing;
  FDBEditSessionVar.StateActive   := false;

  FGamePlaySessionVar.SessionType := ssPlaying;
  FGamePlaySessionVar.StateActive := false;

  FGamePlaySessionVar.GamePlayMode.GameType := gpmScenario;

//  FSesionMembers:= TStringList.Create;
  FAllCubAssign := TStringList.Create;

  FThread := TMSTimer.Create;
  FThread.Interval := 1;
  FThread.OnRunning := threadOnRunning;
end;

destructor TNetSessionServer.Destroy;
begin
//  FSesionMembers.Free;
  FThread.Free;
  FTCPServer.Free;

  FAppGame.Free;
  FAllCubAssign.Free;

  inherited;
end;

{procedure TNetSessionServer.netLog(const sLog: string);
begin
  if Assigned(FOnNetLog) then FOnNetLog('server ', sLog);
end;
}

procedure TNetSessionServer.netOnClientConnect(const sClientIp: string);
var
  data : TRecCmdVersion;
begin
  // notify to form
  if Assigned(FOnClientConnect) then FOnClientConnect(sClientIp);

  //request version aplication simmgrClient
  data.SynchID := CORD_ID_GET_VERSION;
  data.Synch_Version := EncryptStr(FVersion, FKeyVersion);
  FTCPServer.SendDataToIPAddress(CPID_CMD_VERSION, @data, sClientIp);
end;

procedure TNetSessionServer.netOnClientDisConnect(const sClientIp: string);
begin
  if Assigned(FOnClientDisConnect) then FOnClientDisConnect(sClientIp);

end;

procedure TNetSessionServer.netOnRecv_Request(apRec: PAnsiChar; aSize: Word);
{ a client request  something }
var req: ^TRecRequest;
    reqID: Word;
    strIP, strData: string;
begin
  req := @aprec^;

  reqID := req^.RequestID;
  strIP := LongIp_To_StrIp(req^.pid.ipSender);

  case reqID of
    CREQID_DBEDIT_SESSION: begin
      netSend_SessionData(CID_INFO, FDBEditSessionVar, strIP);
      strData := 'DBEDIT_SESSION';

    end;

    CREQID_GAME_SESSION: begin
      netSend_SessionData(CID_INFO, FGamePlaySessionVar, strIP);
      strData := 'GAME_SESSION';

    end;

    CREQID_ONLINE_LIST: begin
      netSend_OnlineList(strIP);
      strData := 'ONLINE_LIST';
    end;

    CREQID_SYNCH_TIME: begin
      netSend_ServerTime(strIP, req^.RequestParam);
      strData := 'CREQID_SYNCH_TIME';
    end;

    CREQID_MAPSYNCH: begin
      netSend_NotifyMapSynch();
      strData := 'Map Synch';
    end;

    CREQID_ALL_CUB_ASSIGN:  begin
      netSend_CubicleAssignInfo(strIp);
      strData := 'CREQID_ALL_CUB_ASSIGN';
    end;
  end;

  if Assigned(FOnNetLog) then
    FOnNetLog(strIP, 'Request ' + strData );

end;

procedure TNetSessionServer.netOnRecv_Session(apRec: PAnsiChar; aSize: Word);
var rec  : ^TRecSessionState;
    OrdID  : Integer;
    strIP, strData: string;
    nType : TSessionType;
    nState: boolean;
    nSCID : Integer;
    ssName : string ;
    gpmType : TGamePlayType;
    gpmFName: string;
begin
  rec := @aprec^;
  strIP := LongIp_To_StrIp(rec^.pid.ipSender);

  OrdID   := rec^.Order;
  nType   := TSessionType(rec^.SessionType);
  nState  := Boolean(rec^.SessionStat) ; // <> 0;
  nSCID   := rec^.ScenarioID;
  ssName  := rec^.SnapshotName;
  gpmType := TGamePlayType(rec^.GPMType);
  gpmFName:= rec^.GPMFName;

  if nType = ssEditing then begin

    case OrdID of
      CID_CREATE : begin
        if not (FDBEditSessionVar.StateActive)  then begin
          FSessionSetterIP := strIP;

          SetSessionState(nType, true, nscID, ssName , byte(gpmType), gpmFName );

          netSend_SessionData(CID_CREATE, FDBEditSessionVar);

          strData := 'create dbeditor session';
        end;
      end;

    end
  end
  else if (nType = ssPlaying) then begin
    //if in authorize user then then

    case OrdID of
      CID_CREATE :    // can't create session while any session active
        if not (FGamePlaySessionVar.StateActive)  then begin
          FSessionSetterIP := strIP;

          FGamePlaySessionVar.ExerciseName :=  rec^.ExerciseName;
          FGamePlaySessionVar.SnapshotName :=  ssName;
          FGamePlaySessionVar.GamePlayMode.GameType := gpmType ;
          FGamePlaySessionVar.GamePlayMode.RecFileName := gpmFName;

          SetSessionState(ssPlaying, true, nscID, ssName, byte(gpmType), gpmFName);
          netSend_SessionData(CID_CREATE, FGamePlaySessionVar);

          strData := 'Create Game Session with ScenarioID = ' + IntToStr(nscID);
        end;
      CID_DESTROY:
        if (FGamePlaySessionVar.StateActive)  then begin
          FSessionSetterIP := '';

          FGamePlaySessionVar.ExerciseName :=  '';
          FGamePlaySessionVar.SnapshotName :=  '';
          FGamePlaySessionVar.GamePlayMode.GameType := gpmScenario ;
          FGamePlaySessionVar.GamePlayMode.RecFileName := '';

          SetSessionState(ssPlaying, false, -1, '', byte(gpmScenario),'' );
          netSend_SessionData(CID_DESTROY, FGamePlaySessionVar);
          strData := 'Terminate game session.';

        end;
    end;
//    netSend_OnlineList('');
  end;
  if Assigned(FOnNetLog) then
    FOnNetLog(strIP,  strData );
end;


procedure TNetSessionServer.netRecv_CmdVersion(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmdVersion;
  data: TRecCmdVersion;
  sha1, IP: string;
begin
// walah.. kok dikirimi... ga usah repot-repot.. server aja yg ngirim...
  aRec := @apRec^;
  IP := LongIp_To_StrIp(aRec^.pid.ipSender);

  case aRec^.SynchID of
    CORD_ID_GET_VERSION :
      begin
        sha1 := DecryptStr(aRec^.Synch_Version, FKeyVersion);
        if sha1 = FVersion then
        begin
          data.SynchID := CORD_ID_VERSION_MATCH;
          FTCPServer.SendDataToIPAddress(CPID_CMD_VERSION, @data, IP);
        end
        else
        begin
          data.SynchID := CORD_ID_VERSION_NOT_MATCH;
          data.Synch_Version := FVersion;
          FTCPServer.SendDataToIPAddress(CPID_CMD_VERSION, @data, IP);
        end;
      end;
  end;
end;

procedure TNetSessionServer.netSend_SessionData(const CID: byte; const sv: TSessionVar; const ipAdd: string='');  //   ''-> broadcast
var rsSession:  TRecSessionState;
begin
//  rsSession.Order       := CID_INFO;
  rsSession.Order       := CID;
  rsSession.SessionType := Byte(sv.SessionType);
  rsSession.ScenarioID  := sv.ScenarioID;
  rsSession.SessionStat := Byte(sv.StateActive);
  rsSession.SnapshotName:= sv.SnapshotName;
  rsSession.GPMType     := Byte(sv.GamePlayMode.GameType);
  rsSession.GPMFName    := sv.GamePlayMode.RecFileName;

  if ipAdd = '' then
    FTCPServer.SendData(CPID_SESSIONSTATE, @rsSession)
  else
    FTCPServer.SendDataToIPAddress(CPID_SESSIONSTATE, @rsSession, ipAdd  );

end;

procedure TNetSessionServer.netSend_OnlineList(const ipAdd: string);
var rList : TRecNodeOnlineList;
    ss: TStringList;
begin

  ss := TStringList.Create;
  FTCPServer.GetConnectedList(ss);

  rList := OnlineListToRec(ss);
  rList.NodeOrder := 0;

  ss.Free;

  if ipADD='' then
    FTCPServer.SendData(CPID_SESSIONONLINELIST, @rList)
  else
    FTCPServer.SendDataToIPAddress(CPID_SESSIONONLINELIST, @rList, ipAdd);
end;

procedure TNetSessionServer.netSend_ServerTime(const ipAdd: string; const flag: Word);
var r: TRecServerTime;
begin
  r.Flag := flag;
  r.ServerTime := Now;
  FTCPServer.SendDataToIPAddress(CPID_SYNCH_TIME, @r, ipAdd);

end;

procedure TNetSessionServer.netOnRecv_DBE_TBL_UPDATE(apRec: PAnsiChar; aSize: Word);
var pid : ^TPacketID;
    ipSndr : string;
begin
  // broadcast to all
  pid := @apRec^;

  ipSndr := LongIp_To_StrIp(pid.ipSender);
  FTCPServer.SendDataExceptThis(CPID_DBE_TBL_UPDATE, apRec, ipSndr);
end;

procedure TNetSessionServer.netOnRecv_CubicleAssign(apRec: PAnsiChar;
      aSize: Word);
var rq: ^TRecCubAssign;
    ip: string;
    i: Integer;
    g : TAssignGroup;
begin
  rq := @apRec^;

  ip := LongIp_To_StrIp(rq^.LongIP);

  case rq.cmdID  of
    CMD_ASSIGN_CLEAR : begin
      if rq^.LongIP = 0 then begin

        FAllCubAssign.Clear; // mestinya clear and free item.
        FTCPServer.SendData(CPID_CUBICLEASSIGN, apRec);
      end;

    end;
    CMD_ASSIGN_ADD: begin
      FTCPServer.SendDataToIPAddress(CPID_CUBICLEASSIGN, apRec, ip);
      if FAllCubAssign.Find(ip, i) then begin
        g := FAllCubAssign.Objects[i] as TAssignGroup;
        g.Add(rq^.GroupID);
      end
      else begin
        g := TAssignGroup.Create;
        g.Add(rq^.GroupID);
        FAllCubAssign.AddObject(ip, g);
      end;

    end;
    CMD_ASSIGN_END: begin
       FTCPServer.SendData(CPID_CUBICLEASSIGN, apRec);

    end;
  end;

end;

procedure TNetSessionServer.netSend_CubicleAssignInfo(const toIp: string);
var rq: TRecCubAssign;
    ip: string;
    i, j: Integer;
    g : TAssignGroup;
begin
  rq.LongIP := 0;
  rq.cmdID  := CMD_ASSIGN_INFO_START;
  FTCPServer.SendDataToIPAddress(CPID_CUBICLEASSIGN, @rq, toip);

  rq.cmdID  := CMD_ASSIGN_INFO_DATA;
  for i := 0 to FAllCubAssign.Count - 1 do  begin
    ip := FAllCubAssign[i];
    g := FAllCubAssign.Objects[i] as TAssignGroup;

    rq.LongIP  := StrIp_To_LongIp(ip);
    for j := 0 to g.Count - 1 do begin
      rq.GroupID := g.AssList[j];
      FTCPServer.SendDataToIPAddress(CPID_CUBICLEASSIGN, @rq, toip);

    end;
  end;

  rq.LongIP := 0;
  rq.cmdID  := CMD_ASSIGN_INFO_END;
  FTCPServer.SendDataToIPAddress(CPID_CUBICLEASSIGN, @rq, toip);
end;

procedure TNetSessionServer.netSend_NotifyMapSynch();
var r: TRecNotify;
begin
  r.NotifyID := CNOT_MAPSYNCH;
  FTCPServer.SendData(CPID_NOTIFY, @r);
end;

//== public method =============================================================

procedure TNetSessionServer.ApplySetting;
begin
  FPortListen:= IntTostr(vNetSetting.SessionPort);

  FAppGame.FExecFname   := vAppSetting.GameServerName;

//  if vNetSetting.AutoStart then
//    StartNetworking;

end;

procedure TNetSessionServer.StartNetworking;
begin
  FTCPServer.RegisterProcedure(CPID_REQ,          netOnRecv_Request,
    SizeOf(TRecRequest));

  FTCPServer.RegisterProcedure(CPID_NOTIFY,       nil,
    SizeOf(TRecNotify));

  FTCPServer.RegisterProcedure(CPID_SESSIONSTATE, netOnRecv_Session,
    SizeOf(TRecSessionState));

  FTCPServer.RegisterProcedure(CPID_SESSIONONLINELIST, nil,
    SizeOf(TRecNodeOnlineList));

  FTCPServer.RegisterProcedure(CPID_CUBICLEASSIGN, netOnRecv_CubicleAssign,
    SizeOf(TRecCubAssign));

  FTCPServer.RegisterProcedure(CPID_SYNCH_TIME, nil ,
    SizeOf(TRecServerTime));

  FTCPServer.RegisterProcedure(CPID_CMD_VERSION, netRecv_CmdVersion,
    SizeOf(TRecCmdVersion));

  FTCPServer.Listen(FPortListen);

  FThread.Enabled := True;
end;

procedure TNetSessionServer.StopNetworking;
begin
  FThread.Enabled := False;

  FTCPServer.Stop;
  FTCPServer.UnregisterAllProcedure;
end;


procedure TNetSessionServer.threadOnRunning(const dt: double);
begin
  FTCPServer.getPacket;
end;

procedure TNetSessionServer.SetSessionState(const ssType: TSessionType;
  const ssState: boolean;
  const scID: Integer;
  const ssName: string ;  /// add for snapshot
  const cGPMType : byte ;
  const cGPMFName : string );
begin
  if ssType = ssEditing then begin
    FDBEditSessionVar.StateActive := ssState;
    if ssState then begin
      FDBEditSessionVar.ScenarioID  := scID;

      StartDBEditSession;

    end
    else begin
      FDBEditSessionVar.ScenarioID  := -1;
      StopDBEditSession;
    end;

    if Assigned(FOnSessionStateChange) then
     FOnSessionStateChange(FDBEditSessionVar);

     // enable / disable dbEDIT session

  end
  else if ssType = ssPlaying then begin

    FGamePlaySessionVar.StateActive := ssState;
    FGamePlaySessionVar.ScenarioID  := scID;
    if ssState then begin

      vGameDataSetting.ScenarioID := scID;
      vGameDataSetting.SnapshotName := ssName;
      vGameDataSetting.GamePlayMode.GameType := cGPMType;
      vGameDataSetting.GamePlayMode.RecFileName := cGPMFName;

      SaveFF_GameSetting(vSettingFile, vGameDataSetting);

      FAppGame.Executes;

    end
    else
      FAppGame.Terminates;

    if Assigned(FOnSessionStateChange) then
      FOnSessionStateChange(FGamePlaySessionVar);
  end;
end;

procedure TNetSessionServer.SendUpdateSession(const sv: TSessionVar);
var rec: TRecSessionState;
begin
  rec.Order        := CID_CREATE;

  rec.SessionType  := Byte(sv.SessionType);
  rec.SessionStat  := Byte(sv.StateActive);
  rec.ScenarioID   := sv.ScenarioID;
  rec.ExerciseName := sv.ExerciseName;
  rec.SnapshotName := sv.SnapshotName;
  rec.GPMType      := Byte(sv.GamePlayMode.GameType);
  rec.GPMFName     := sv.GamePlayMode.RecFileName;
  FTCPServer.SendData(CPID_SESSIONSTATE, @rec);
end;

procedure TNetSessionServer.StartDBEditSession;
begin
  FTCPServer.RegisterProcedure(CPID_DBE_TBL_UPDATE, netOnRecv_DBE_TBL_UPDATE,
    SizeOf(TRecRequest));

end;

procedure TNetSessionServer.StopDBEditSession;
begin
  FTCPServer.UnRegisterProcedure(CPID_DBE_TBL_UPDATE);

end;

end.
