unit uNetSessionServer;

interface

uses

  Classes, OverbyteIcsWSocket, uNetBaseSocket, uTCPServer, uPacketBuffer, uNetSessionData,
  uBaseNetHandler, uExecuter;

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

//    FSesionMembers: TStringList;
    FCubAssign: TStringList;

    procedure netOnClientConnect(const sClientIp: string);
    procedure netOnClientDisConnect(const sClientIp: string);

    procedure netOnRecv_Request (apRec: PAnsiChar; aSize: Word);

    procedure netOnRecv_Session (apRec: PAnsiChar; aSize: Word);

    procedure netSend_SessionData(const CID: byte; const sv: TSessionVar; const ipAdd: string='');  //   ''-> broadcast

    procedure netSend_OnlineList(const ipAdd: string);

    procedure netOnRecv_DBE_TBL_UPDATE(apRec: PAnsiChar; aSize: Word);
    procedure netOnRecv_CubicleAssign(apRec: PAnsiChar;
      aSize: Word);


  public

    constructor Create;
    destructor Destroy; override;

    procedure ApplySetting; override;

    procedure StartNetworking; override;
    procedure StopNetworking; override;

    //--------------------------------------------------------------------------
    procedure SetSessionState(const ssType: TSessionType;
      const ssState: boolean;
      const scID: Integer);

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

implementation

uses

  SysUtils,  uLibSettingTTT;


procedure BeginServer;
begin
  vSettingFile := getFileSetting;
  LoadFF_NetSetting(vSettingFile, vNetSetting);
  LoadFF_AppSetting(vSettingFile, vAppSetting);

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

//  FSesionMembers:= TStringList.Create;
  FCubAssign := TStringList.Create;

end;

destructor TNetSessionServer.Destroy;
begin
//  FSesionMembers.Free;
  FTCPServer.Free;

  FAppGame.Free;
  FCubAssign.Free;

  inherited;
end;

{procedure TNetSessionServer.netLog(const sLog: string);
begin
  if Assigned(FOnNetLog) then FOnNetLog('server ', sLog);
end;
}

procedure TNetSessionServer.netOnClientConnect(const sClientIp: string);
begin
  // notify to form
  if Assigned(FOnClientConnect) then FOnClientConnect(sClientIp);

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
      strData := 'Request DBEDIT_SESSION';

    end;
    CREQID_GAME_SESSION: begin
      netSend_SessionData(CID_INFO, FGamePlaySessionVar, strIP);
      strData := 'Request GAME_SESSION';

    end;
    CREQID_ONLINE_LIST: begin
      netSend_OnlineList(strIP);
      strData := 'Request ONLINE_LIST';
    end;
  end;

  if Assigned(FOnNetLog) then
    FOnNetLog(strIP,  strData );

end;

procedure TNetSessionServer.netOnRecv_Session(apRec: PAnsiChar; aSize: Word);
var rec  : ^TRecSessionState;
    OrdID  : Integer;
    strIP, strData: string;
    nType : TSessionType;
    nState: boolean;
    nSCID : Integer;

begin
  rec := @aprec^;
  strIP := LongIp_To_StrIp(rec^.pid.ipSender);

  OrdID   := rec^.Order;
  nType   := TSessionType(rec^.SessionType);
  nState  := Boolean(rec^.SessionStat) ; // <> 0;
  nSCID   := rec^.ScenarioID;

  if nType = ssEditing then begin

    case OrdID of
      CID_CREATE : begin
        if not (FDBEditSessionVar.StateActive)  then begin
          FSessionSetterIP := strIP;

          SetSessionState(nType, true, nscID);

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
          SetSessionState(ssPlaying, true, nscID);
          netSend_SessionData(CID_CREATE, FGamePlaySessionVar);

          strData := 'Create Game Session with ScenarioID = ' + IntToStr(nscID);
        end;
      CID_DESTROY:
        if (FGamePlaySessionVar.StateActive)  then begin
          FSessionSetterIP := '';

          FGamePlaySessionVar.ExerciseName :=  '';

          SetSessionState(ssPlaying, false, -1);
          netSend_SessionData(CID_DESTROY, FGamePlaySessionVar);
          strData := 'Terminate game session.';

        end;
    end;
//    netSend_OnlineList('');
  end;
  if Assigned(FOnNetLog) then
    FOnNetLog(strIP,  strData );
end;


procedure TNetSessionServer.netSend_SessionData(const CID: byte; const sv: TSessionVar; const ipAdd: string='');  //   ''-> broadcast
var rsSession:  TRecSessionState;
begin
//  rsSession.Order       := CID_INFO;
  rsSession.Order       := CID;
  rsSession.SessionType := Byte(sv.SessionType);
  rsSession.ScenarioID  := sv.ScenarioID;
  rsSession.SessionStat := Byte(sv.StateActive);

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

        FCubAssign.Clear; // mestinya clear and free item.
        FTCPServer.SendData(CPID_CUBICLEASSIGN, apRec);
      end;

    end;
    CMD_ASSIGN_ADD: begin
      FTCPServer.SendDataToIPAddress(CPID_CUBICLEASSIGN, apRec, ip);
      if FCubAssign.Find(ip, i) then begin
        g := FCubAssign.Objects[i] as TAssignGroup;
        g.Add(rq^.GroupID);

      end
      else begin
        g := TAssignGroup.Create;
        g.Add(rq^.GroupID);
        FCubAssign.AddObject(ip, g);
      end;

    end;
  end;

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

  FTCPServer.RegisterProcedure(CPID_SESSIONSTATE, netOnRecv_Session,
    SizeOf(TRecSessionState));


  FTCPServer.RegisterProcedure(CPID_SESSIONONLINELIST, nil,
    SizeOf(TRecNodeOnlineList));

  FTCPServer.RegisterProcedure(CPID_CUBICLEASSIGN, netOnRecv_CubicleAssign,
   SizeOf(TRecCubAssign));

  FTCPServer.Listen(FPortListen);
end;

procedure TNetSessionServer.StopNetworking;
begin

  FTCPServer.Stop;
  FTCPServer.UnregisterAllProcedure;
end;


procedure TNetSessionServer.SetSessionState(const ssType: TSessionType;
  const ssState: boolean;
  const scID: Integer);
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
