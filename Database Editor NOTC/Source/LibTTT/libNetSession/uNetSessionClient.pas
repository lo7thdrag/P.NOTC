unit uNetSessionClient;

interface

uses

  Classes, OverbyteIcsWSocket,  uTCPClient, uNetSessionData,
  uBaseNetHandler, uExecuter, uThreadTimer, uSteppers, uT3GroupList;

type

  TNetSessionClient = class(TBaseNetHandler)
  protected
    FThread     : TMSTimer;
    FNetOnline  : boolean;
    FNetConnect : TDelayer;
    FTCPClient  : TTCPClient;
    FAppGame    : TAppExecute;

    FGameSessionInfo : TSessionVar;

    FSesionMembers: TStrings;
    FGroupList: T3GroupList;

  protected
    FOnReceiveOnlineList: TNotifyEvent;

  private
    FMyIPAddress,
    FMyConsoleName : string;
    FIsInstructor  : boolean;

    FOnReceiveSession: TNotifyEvent;

    function getGameSession: boolean;
    function getGameScenarioID: integer;


  protected
    procedure netOnConnected (sender: TObject);
    procedure netOnDisConnected (sender: TObject);

    procedure FNetConnectOnTimer(sender: TObject);

    procedure threadOnRunning(const dt: double);
    procedure netOnRecv_Session (apRec: PAnsiChar; aSize: Word);


    procedure netSend_RequestSession;

    procedure netSend_RequestClientList; // for assignment
    procedure netOnRecv_SessionOnlineList (apRec: PAnsiChar; aSize: Word);

    procedure netOnRecv_CubicleAssign (apRec: PAnsiChar; aSize: Word);

  public

    CubicleGroupAssign : TAssignGroup;

    constructor Create;
    destructor Destroy; override;

    procedure ApplySetting; override;

    procedure StartNetworking; override;
    procedure StopNetworking; override;
    // T3 specific

    procedure SendStartGameSession(const scID: integer; const excName: string);
    procedure SendTerminateGameSession;

    procedure ConnectGameSession;

    procedure DeleteGameSession;

    procedure RequestOnlineList;
    procedure SendCubicleAssign(const ipAdd: string;
      const cmd: byte; const param: Integer);



  published
    property GameSessionExist: boolean read getGameSession;
    property GameSessionSCID: integer read getGameScenarioID;

    property OnReceiveOnlineList: TNotifyEvent
      read  FOnReceiveOnlineList write FOnReceiveOnlineList;

    property OnReceiveSession: TNotifyEvent
      read  FOnReceiveSession write FOnReceiveSession;

    property ConsoleName: string read FMyConsoleName;
    property IpAddress: string read FMyIPAddress;

    property IsController: boolean read FIsInstructor;

  end;

var
   theClient : TNetSessionClient;

  procedure BeginClient;
  procedure EndClient;

implementation

uses
  SysUtils, uStringFunc, uLibSettingTTT, uNetBaseSocket;


procedure BeginClient;
begin
  vSettingFile := getFileSetting;

  LoadFF_NetSetting(vSettingFile, vNetSetting);
  LoadFF_NetClientSetting(vSettingFile, vNetClientSetting);
  LoadFF_dBaseSetting(vSettingFile, vDBSetting);

  LoadFF_AppSetting(vSettingFile, vAppSetting);
  LoadFF_GameSetting(vSettingFile, vGameDataSetting);

  LoadFF_CubicalAssignSetting(vSettingFile, vCubicalAssignSetting);


  theClient := TNetSessionClient.Create;

end;

procedure EndClient;
begin

  theClient.Free;
end;


//==============================================================================
{ TNetSessionServer }


constructor TNetSessionClient.Create;
begin

  CubicleGroupAssign := TAssignGroup.Create;
  FSesionMembers := TStringList.Create;

  FGroupList := T3GroupList.Create;

  FTCPClient := TTCPClient.Create;
  FNetSock   := FTCPClient;

  FTCPClient.OnConnected    := netOnConnected;
  FTCPClient.OnDisConnected := netOnDisConnected;

  with FGameSessionInfo do begin
    SessionType := ssPlaying;
    StateActive := false;
    ScenarioID  := -1;
  end;

  FAppGame    := TAppExecute.Create;
  FNetConnect := TDelayer.Create;

  FNetConnect.DInterval := 2.0;
  FNetConnect.OnTime    := FNetConnectOnTimer;
  FNetConnect.Enabled   := false;

  FThread   := TMSTimer.Create;
  FThread.Interval := 200;
  FThread.OnRunning := threadOnRunning;

end;

destructor TNetSessionClient.Destroy;
begin
  CubicleGroupAssign.Free;

  FThread.Free;
  FNetConnect.Free;

  FTCPClient.CloseSocket;
  FTCPClient.Disconnect;
  FTCPClient.Free;

  FNetSock := nil;

  FAppGame.Free;

  FSesionMembers.Free;
  FGroupList.Free;

  inherited;
end;

//= protected method ===========================================================
procedure TNetSessionClient.netOnConnected (sender: TObject);
begin
  netSend_RequestSession; // request game session

end;

procedure TNetSessionClient.netOnDisConnected (sender: TObject);
begin

end;

function TNetSessionClient.getGameScenarioID: integer;
begin
  result := FGameSessionInfo.ScenarioID ;
end;

function TNetSessionClient.getGameSession: boolean;
begin
  result := FGameSessionInfo.StateActive;

end;

procedure TNetSessionClient.FNetConnectOnTimer(sender: TObject);
var sessionPort: string;
begin
  if FNetOnline and not FTCPClient.Connected then begin
    sessionPort := IntToStr(vNetSetting.SessionPort);
    FTCPClient.Connect(vNetClientSetting.ServerIP, sessionPort);
  end;
end;

procedure TNetSessionClient.threadOnRunning(const dt: double);
begin
  FNetConnect.Run(dt);

end;


// Client session routine:
// instructor can send 'CID_UPDATE'
// all client can receive 'CID_INFO'
procedure TNetSessionClient.netOnRecv_CubicleAssign(apRec: PAnsiChar;
  aSize: Word);
var rq: ^TRecCubAssign;
    ip: string;
    i: Integer;
begin
  rq := @apRec^;

  ip := LongIp_To_StrIp(rq^.LongIP);

  case rq.cmdID  of
    CMD_ASSIGN_CLEAR : begin
      CubicleGroupAssign.Clear;
    end;
    CMD_ASSIGN_ADD: begin
      CubicleGroupAssign.Add(rq^.GroupID);
    end;
  end;
  SetLength(vCubicalAssignSetting.GroupIDs, CubicleGroupAssign.Count);

  for I := 0 to CubicleGroupAssign.Count - 1 do begin
    vCubicalAssignSetting.GroupIDs[i] := CubicleGroupAssign.AssList[i];
  end;

  SaveFF_CubicalAssignSetting(vSettingFile, vCubicalAssignSetting);


end;

procedure TNetSessionClient.netOnRecv_Session (apRec: PAnsiChar; aSize: Word);
var rec  : ^TRecSessionState;
    OrdID  : Integer;
    strIP, strData: string;
    nType : TSessionType;
    nState: boolean;
    nSCID : Integer;

//    strIP: string;
begin
  rec := @aprec^;

  OrdID   := rec^.Order;
  nType   := TSessionType(rec^.SessionType);
  nState  := Boolean(rec^.SessionStat) ; // <> 0;
  nSCID   := rec^.ScenarioID;

  if (nType = ssPlaying) then begin
    //if in authorize user then then

    case OrdID of
      CID_INFO : begin
        with FGameSessionInfo do begin
          StateActive := Boolean(rec^.SessionStat);
          ScenarioID  := rec^.ScenarioID;
        end;
      end;
      CID_CREATE : begin
        if (FGameSessionInfo.StateActive)  then
          FAppGame.Terminates;

        with FGameSessionInfo do begin

          StateActive := nState; // harusnya true
          ScenarioID  := nSCID;

          vGameDataSetting.ScenarioID := nSCID;
          SaveFF_GameSetting(vSettingFile, vGameDataSetting);

          strData := 'Execute Game Client with ScenarioID = ' + IntToStr(nscID);

          if not IsController then
            FAppGame.Executes;

        end;
      end;
      CID_DESTROY: begin
        with FGameSessionInfo do begin

          StateActive := nState; // harusnya false
          ScenarioID  := nSCID;
        end;
        strData := 'Terminate game session.';
        FAppGame.Terminates;

      end;
    end;
  end;

  if Assigned(FOnReceiveSession) then
    FOnReceiveSession(self);


 // if instructor say 'PLAY NOW', then launch the game client
//    CekSessionChanged();
end;

procedure TNetSessionClient.netSend_RequestSession;
var req   : TRecRequest;
{    sPort : string;}
begin
{  if not FTCPClient.Connected then begin
    sPort :=  IntToStr(vNetSetting.SessionPort);
    FTCPClient.Connect(vNetClientSetting.ServerIP, sPort);
  end;}

  req.RequestID := CREQID_GAME_SESSION;
  FTCPClient.SendData(CPID_REQ, @req);
end;

procedure TNetSessionClient.netSend_RequestClientList; // for assignment
var req: TRecRequest;
begin
  req.RequestID := CREQID_ONLINE_LIST;
  FTCPClient.SendData(CPID_REQ, @req);
end;

procedure TNetSessionClient.netOnRecv_SessionOnlineList(apRec: PAnsiChar; aSize: Word);
var rec: ^TRecNodeOnlineList;
    ss : TStrings;
begin
  rec := @apRec^;
  ss := TStringList.Create;

  RecToOnlineList(rec^, ss);

  FSesionMembers.Clear;
  FSesionMembers.AddStrings(ss);

  if Assigned(FOnReceiveOnlineList) then
    FOnReceiveOnlineList(FSesionMembers);

  ss.Free;
end;

//== public method =============================================================
procedure TNetSessionClient.ApplySetting;
var i: integer;
    ss: TStrings;
    found: boolean;
    ip,host: string;
begin
//  FPortSession := IntTostr(vNetSetting.SessionPort);
  FMyIPAddress := '';

  FGroupList.LoadFromFile(vGameDataSetting.GroupSetting);
  FAppGame.FExecFname   := vAppSetting.GameClientName;

  if vNetSetting.AutoStart then
    StartNetworking;

  ss := TStringList.Create;
  if GetHostandIPList(host, ss) then begin
    I := 0;
    found := false;
    while not found and (i< ss.Count) do begin
      ip := ss[i];
      found := FGroupList.IsGroupMember(ip);

      inc(i);
    end;
    if found then begin
      FMyIPAddress   := ip;
      FIsInstructor  := FGroupList.IsController(FMyIPAddress);
      FMyConsoleName := FGroupList.GetConsoleName(FMyIPAddress);
    end;
  end;

  ss.Free;
end;

procedure TNetSessionClient.StartNetworking;
var sessionPort: string;
begin
  // request sender, not request handler.
  FTCPClient.RegisterProcedure(CPID_REQ,          nil,
    SizeOf(TRecRequest));

  FTCPClient.RegisterProcedure(CPID_SESSIONSTATE, netOnRecv_Session,
    SizeOf(TRecSessionState));

  FTCPClient.RegisterProcedure(CPID_SESSIONONLINELIST, netOnRecv_SessionOnlineList,
    SizeOf(TRecNodeOnlineList));

  FTCPClient.RegisterProcedure(CPID_CUBICLEASSIGN, netOnRecv_CubicleAssign,
   SizeOf(TRecCubAssign));

  sessionPort := IntToStr(vNetSetting.SessionPort);
  FTCPClient.Connect(vNetClientSetting.ServerIP, sessionPort);

  FNetOnline := true;
  FNetConnect.Enabled := true;

  FThread.Enabled := true;
end;

procedure TNetSessionClient.StopNetworking;
begin
  FThread.Enabled := false;
  FNetOnline := False;
  FNetConnect.Enabled := false;
end;

//------------------------------------------------------------------------------
procedure TNetSessionClient.SendStartGameSession(const scID: integer; const excName: string);
var rs : TRecSessionState;
begin
  rs.Order := CID_CREATE;
  rs.SessionType  := Byte(ssPlaying);
  rs.ScenarioID   := scID;
  rs.SessionStat  := Byte(True);
  rs.SessionID    := 0;
  rs.ExerciseName := LimitStr(excName, 60);

  FTCPClient.SendData(CPID_SESSIONSTATE, @rs);
  //client Create a session. automaticaly connect to.
end;

procedure TNetSessionClient.SendTerminateGameSession;
var rs : TRecSessionState;
begin
  rs.Order := CID_DESTROY;
  rs.SessionType  := Byte(ssPlaying);
  rs.ScenarioID   := 0;                  // ignored
  rs.SessionStat  := Byte(True);         // ignored
  rs.SessionID    := 0;                  // ignored

  FTCPClient.SendData(CPID_SESSIONSTATE, @rs);
end;

{
procedure TNetSessionClient.ConnectGameSession;
var rs : TRecSessionState;
begin

  rs.Order := CID_CONNECT;
  rs.SessionType  := Byte(ssPlaying);
  rs.ScenarioID   := 0;                  // ignored
  rs.SessionStat  := Byte(True);         // ignored
  rs.SessionID    := 0;                  // ignored

  FTCPClient.SendData(CPID_SESSIONSTATE, @rs);
end;
procedure TNetSessionClient.DeleteGameSession;
var rs : TRecSessionState;
begin
  rs.Order := CID_DISCONNECT;
  rs.SessionType  := Byte(ssPlaying);
  rs.ScenarioID   := 0;                  // ignored
  rs.SessionStat  := Byte(True);         // ignored
  rs.SessionID    := 0;                  // ignored

  FTCPClient.SendData(CPID_SESSIONSTATE, @rs);
end;
}
procedure TNetSessionClient.ConnectGameSession;
begin
   //if IsController then

  with FGameSessionInfo do begin

    if  StateActive  then begin
      if FAppGame.Active then
         FAppGame.Terminates;
      FAppGame.Executes;
    end;

  end;


end;

procedure TNetSessionClient.DeleteGameSession;
begin
// delete replay
end;



procedure TNetSessionClient.RequestOnlineList;
var rq: TRecRequest;
begin
  rq.RequestID := CREQID_ONLINE_LIST;
  FTCPClient.SendData(CPID_REQ, @rq);

end;

procedure TNetSessionClient.SendCubicleAssign(const ipAdd: string;
 const cmd: Byte; const param: Integer);
var rq: TRecCubAssign;
begin
  rq.cmdID := cmd;
  rq.GroupID := param;
  rq.pid.ipReceiver := StrIp_To_LongIp(ipAdd);
  rq.LongIP := rq.pid.ipReceiver;

  FTCPClient.SendData(CPID_CUBICLEASSIGN, @rq);

end;



end.
