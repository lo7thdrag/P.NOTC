unit uNetSessionClient;

interface

uses

  Classes, OverbyteIcsWSocket,  uTCPClient, uNetSessionData,
  uBaseNetHandler, uExecuter, uThreadTimer, uSteppers, uT3GroupList,
  uGamePlayType, {IdHashSHA1,} Dialogs, Forms, Controls;

type

  TNetSessionClient = class(TBaseNetHandler)
  protected
    FThread     : TMSTimer;
    FNetOnline  : boolean;
    FNetConnect : TDelayer;
    FTCPClient  : TTCPClient;

    FAppGame    : TAppExecute;
    FAppDBEdit  : TAppExecute;
    FAppSynchMap: TAppExecute;
    FAppWasdal  : TAppExecute;
    FAppVBS     : TAppExecute;
    FAppCamera  : TAppExecute;


    FGameSessionInfo : TSessionVar;

    // controller
    FDBEditSessionInfo : TSessionVar;

    FSesionMembers: TStrings;
    FGroupList: T3GroupList;

  protected
    FOnReceiveOnlineList: TNotifyEvent;
    FOnExecuteApp   : TNotifyEvent;
    FOnTerminateApp : TNotifyEvent;

    procedure eventExecDBEdit(sender :TObject);
    procedure eventTerminDBEdit(sender :TObject);

  private
    FMyIPAddress,
    FMyConsoleName : string;
    FIsInstructor  : boolean;

    FOnReceiveSession: TNotifyEvent;
    FIsWasdal: Boolean;
    FIsVBS: Boolean;
    FRunVBS: Boolean;

    function getGameSession: boolean;
    function getGameScenarioID: integer;

  protected
    FTimeREQ : TDateTime;
    FTimeFlag : word;

    procedure netOnConnected (sender: TObject);
    procedure netOnDisConnected (sender: TObject);

    procedure FNetConnectOnTimer(sender: TObject);

    procedure threadOnRunning(const dt: double);

    procedure netOnRecv_Session (apRec: PAnsiChar; aSize: Word);
    procedure netSend_RequestSession;

    procedure netSend_RequestClientList; // for assignment
    procedure netOnRecv_SessionOnlineList (apRec: PAnsiChar; aSize: Word);

    procedure netOnRecv_CubicleAssign (apRec: PAnsiChar; aSize: Word);
    procedure netOnRecv_SynchTime(apRec: PAnsiChar; aSize: Word);

    procedure netOnRecv_Notify(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_CmdVersion(apRec: PAnsiChar; aSize: word);
  public
    CubicleGroupAssign : TAssignGroup;   //daftar group assignment untuk ip ini.
    vbsMission : string;

    constructor Create;
    destructor Destroy; override;

    procedure ApplySetting; override;
    procedure StartNetworking; override;
    procedure StopNetworking; override;
    // T3 specific

    procedure SendStartGameSession(const scID: integer;
      const excName: string;
      const snapshotName: string;
      const cGPMType : byte;
      const cGPMFName : string);

    procedure SendTerminateGameSession;
    procedure ConnectGameSession;
    procedure DeleteGameSession;

    function StartDBEditSession: boolean;

    //Close VBS
    function CloseVBS(ExeFileName: string): integer;

    procedure RequestOnlineList;
    procedure SendCubicleAssign(const ipAdd: string;
      const cmd: byte; const param: Integer);
    procedure SendRequestSynchMap();

    procedure CreateBatFileVBS(const aTerrainID: Byte;
      const aTerrainName: string);

    property GameSessionExist: boolean read getGameSession;
    property GameSessionSCID: integer read getGameScenarioID;
    property OnReceiveOnlineList: TNotifyEvent
      read  FOnReceiveOnlineList write FOnReceiveOnlineList;
    property OnReceiveSession: TNotifyEvent
      read  FOnReceiveSession write FOnReceiveSession;
    property ConsoleName: string read FMyConsoleName;
    property IpAddress: string read FMyIPAddress;
    property IsController: boolean read FIsInstructor;
    property IsWasdal: Boolean read FIsWasdal;
    property IsVBS: Boolean read FIsVBS;
    property RunVBS: Boolean read FRunVBS write FRunVBS;
    property OnExecuteApp: TNotifyEvent read FOnExecuteApp write FOnExecuteApp;
    property OnTerminateApp: TNotifyEvent read FOnTerminateApp write FOnTerminateApp;
  end;

var
   theClient : TNetSessionClient;
   j : integer = 1;

  procedure BeginClient;
  procedure EndClient;

const
  CKEY1 = 53761;
  CKEY2 = 32618;

implementation

uses
  Windows,SysUtils, uStringFunc, uLibSettingTTT, uNetBaseSocket, uAppUtils,
  TlHelp32, uDMGC, uGameData_TTT;


procedure BeginClient;
begin
  vSettingFile := getFileSetting;

  LoadFF_NetSetting(vSettingFile, vNetSetting);
  LoadFF_NetClientSetting(vSettingFile, vNetClientSetting);
  LoadFF_dBaseSetting(vSettingFile, vDBSetting);

  LoadFF_AppSetting(vSettingFile, vAppSetting);
  LoadFF_GameSetting(vSettingFile, vGameDataSetting);

  LoadFF_VBSSetting(vSettingFile, vVBSSetting);

  LoadFF_CubicalAssignSetting(vSettingFile, vCubicalAssignSetting);

  LoadFF_MapSetting(vSettingFile, vMapSetting);

  theClient := TNetSessionClient.Create;

end;

procedure EndClient;
begin

  theClient.Free;
end;

//function SHA1FromString(const AString: string): string;
////var
////  SHA1: TIdHashSHA1;
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
  FAppGame.OnStartExecute := nil;
  FAppGame.OnEndExecute   := nil;

  FAppVBS := TAppExecute.Create;
  FAppVBS.OnStartExecute := nil;
  FAppVBS.OnEndExecute := nil;

  with FDBEditSessionInfo do begin
    SessionType := ssEditing;
    StateActive := false;
    ScenarioID := -1;
  end;

  FAppDBEdit  := TAppExecute.Create;
  FAppDBEdit.OnStartExecute := eventExecDBEdit;
  FAppDBEdit.OnEndExecute   := eventTerminDBEdit;

  FAppSynchMap := TAppExecute.Create;

  FAppCamera := TAppExecute.Create;

  FNetConnect := TDelayer.Create;

  FNetConnect.DInterval := 2.0;
  FNetConnect.OnTime    := FNetConnectOnTimer;
  FNetConnect.Enabled   := false;

  FThread   := TMSTimer.Create;
  FThread.Interval := 1;
  FThread.OnRunning := threadOnRunning;

  FRunVBS := False;
  FIsVBS := False;

  inherited;
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

  FAppDBEdit.Free;
  FAppGame.Free;
  FAppVBS.Free;

  FSesionMembers.Free;
  FGroupList.Free;

  inherited;
end;

procedure TNetSessionClient.CreateBatFileVBS(const aTerrainID: Byte;
  const aTerrainName: string);
var
  stringBatList : TStringList;
begin
   stringBatList := TStringList.Create;

//  stringBatList.Add('start "" ' + vGameDataSetting.VBSPath + ':\Bohemia" "Interactive\VBS3\'
//  + vAppSetting.VBSName + ' -admin ' +
//    '-forceSimul -init=playScriptedMission["' + aTerrainName + '",{[' +
//    IntToStr(aTerrainID) +
//    ']execVM"' + vGameDataSetting.SQFPath + '"},' +
//    'missionConfigFile,false]');

  stringBatList.Add('start "" ' + vGameDataSetting.VBSPath + vAppSetting.VBSName + ' -admin ' +
    '-forceSimul -init=playScriptedMission["' + aTerrainName + '",{[' +
    IntToStr(aTerrainID) +
    ']execVM"' + vGameDataSetting.SQFPath + '"},' +
    'missionConfigFile,false]');

  stringBatList.SaveToFile('startVBS.bat');

  stringBatList.Free;
end;

procedure TNetSessionClient.ApplySetting;
var i: integer;
    ss: TStrings;
    found: boolean;
    ip,host: string;
begin
//  FPortSession := IntTostr(vNetSetting.SessionPort);
  FMyIPAddress := '';

  FGroupList.LoadFromFile(vGameDataSetting.GroupSetting);
  FAppGame.FExecFname     := vAppSetting.GameClientName;
  FAppDBEdit.FExecFname   := vAppSetting.DBEditorName;
  FAppSynchMap.FExecFname := vAppSetting.MapSynchName;
  FAppVBS.FExecFname      := vAppSetting.VBSName;
  FAppCamera.FExecFname   := vAppSetting.CameraController;

  //why not ?
  //if vNetSetting.AutoStart then
  StartNetworking;

  ss := TStringList.Create;
  if GetHostandIPList(host, ss) then begin
    /// periksa semua, jika ada salah satu ip masuk di daftar controller,
    ///  maka jadilah controller.
    FIsInstructor  := false;
    for I := 0 to ss.Count - 1 do begin
      ip := ss[i];
      FIsInstructor  := FIsInstructor or  FGroupList.IsController(ip);
      if FIsInstructor then begin
        FMyIPAddress   := ip;
        FMyConsoleName := FGroupList.GetConsoleName(ip);
        Break;
      end;
    end;



    if not FIsInstructor then begin
      I := 0;
      found := false;
      while not found and (i< ss.Count) do begin

        ip := ss[i];
        //cek jika ip sebagai wasdal
        FIsWasdal := FIsWasdal or FGroupList.IsWasdal(ip);

        //cek jika ip sebagai vbs
        FIsVBS := FIsVBS or FGroupList.IsVBS(ip);

        found := FGroupList.IsGroupMember(ip);

        inc(i);
      end;
      if found then begin
        FMyIPAddress   := ip;
        FMyConsoleName := FGroupList.GetConsoleName(FMyIPAddress);
      end;
    end;
  end;

  ss.Free;
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
  FTCPClient.GetPacket;
end;


procedure TNetSessionClient.StartNetworking;
var sessionPort: string;
begin
  // request sender, not request handler.
  FTCPClient.RegisterProcedure(CPID_REQ,          nil,
    SizeOf(TRecRequest));

  FTCPClient.RegisterProcedure(CPID_NOTIFY,          netOnRecv_Notify,
    SizeOf(TRecNotify));

  FTCPClient.RegisterProcedure(CPID_SESSIONSTATE, netOnRecv_Session,
    SizeOf(TRecSessionState));

  FTCPClient.RegisterProcedure(CPID_SESSIONONLINELIST, netOnRecv_SessionOnlineList,
    SizeOf(TRecNodeOnlineList));

  FTCPClient.RegisterProcedure(CPID_CUBICLEASSIGN, netOnRecv_CubicleAssign,
   SizeOf(TRecCubAssign));

  FTCPClient.RegisterProcedure(CPID_SYNCH_TIME, netOnRecv_SynchTime ,
    SizeOf(TRecServerTime));

  FTCPClient.RegisterProcedure(CPID_CMD_VERSION, netRecv_CmdVersion,
    SizeOf(TRecCmdVersion));

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

// Client session routine:
// instructor can send 'CID_UPDATE'
// all client can receive 'CID_INFO'

procedure TNetSessionClient.eventExecDBEdit(sender :TObject);
begin

 if Assigned(FOnExecuteApp) then
    FOnExecuteApp(nil);

end;

procedure TNetSessionClient.eventTerminDBEdit(sender :TObject);
begin
  if Assigned(FOnTerminateApp) then
    FOnTerminateApp(nil);

end;


procedure TNetSessionClient.netOnRecv_Session (apRec: PAnsiChar; aSize: Word);
var rec  : ^TRecSessionState;
    OrdID  : Integer;
    {strIP, }strData,
    sSnap   : string;
    nType   : TSessionType;
    nState  : boolean;
    nSCID   : Integer;
    gpmType : TGamePlayType;
    gpmFName: string;
    GameAreaIndex : Integer;
    GameAreaIdentifier : string;
//    strIP: string;

begin
  rec := @aprec^;

  OrdID   := rec^.Order;
  nType   := TSessionType(rec^.SessionType);
  nState  := Boolean(rec^.SessionStat) ; // <> 0;
  nSCID   := rec^.ScenarioID;
  sSnap   := rec^.SnapshotName ;
  gpmType := TGamePlayType(rec^.GPMType);
  gpmFName:= rec^.GPMFName;

  if (nType = ssPlaying) then begin
    //if in authorize user then then

    case OrdID of
      CID_INFO : begin
        with FGameSessionInfo do begin
          StateActive   := Boolean(rec^.SessionStat);
          ScenarioID    := rec^.ScenarioID;
          SnapshotName  := rec^.SnapshotName;
          GamePlayMode.GameType    := gpmType;
          GamePlayMode.RecFileName := rec^.GPMFName;
        end;
      end;
      CID_CREATE : begin
        if (FGameSessionInfo.StateActive)  then
          FAppGame.Terminates;

        with FGameSessionInfo do begin

          StateActive := nState; // harusnya true
          ScenarioID  := nSCID;

          vGameDataSetting.ScenarioID     := nSCID;
          vGameDataSetting.SnapshotName   := sSnap;
          vGameDataSetting.GamePlayMode.GameType    := rec^.GPMType ;
          vGameDataSetting.GamePlayMode.RecFileName := gpmFName ;


          SaveFF_GameSetting(vSettingFile, vGameDataSetting);

          strData := 'Execute Game Client with ScenarioID = ' + IntToStr(nscID);

          if not IsController then
          begin
            //if CompareStr(vAppSetting.GameClientName, 'startVBS.bat') = 0 then
            if IsVBS then
            begin
              dmGC.GetGameArea(nSCID, GameAreaIdentifier, GameAreaIndex);
              CreateBatFileVBS(vMapSetting.TerrainID, vMapSetting.TerrainName);
            end;

//            if (CompareStr(vAppSetting.GameClientName, 'startVBS.bat') <> 0) and
//              (CubicleGroupAssign.Count > 0) then
            if (not IsVBS) and
              (CubicleGroupAssign.Count > 0) then
              FAppGame.Executes;

            if (not IsVBS) and
              (IsWasdal) then
              FAppGame.Executes;
//
//            if Assigned(FOnExecuteApp) then
//              FOnExecuteApp(self);
          end;
//          else
//            FAppCamera.Executes;
        end;
      end;
      CID_DESTROY: begin
        with FGameSessionInfo do begin

          StateActive := nState; // harusnya false
          ScenarioID  := nSCID;
          SnapshotName:= '';
          GamePlayMode.GameType    := gpmScenario;
          GamePlayMode.RecFileName := '';

        end;
        strData := 'Terminate game session.';

        FAppGame.Terminates;
        FAppCamera.Terminates;

        CloseVBS(FAppVBS.FExecFname);

        if processExists(vAppSetting.RemoteServerName) then
           CloseCurrentHandleApplication(vAppSetting.RemoteServerName);

        if processExists(vAppSetting.RemoteClientName) then
          CloseCurrentHandleApplication(vAppSetting.RemoteClientName);

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
  FTimeFlag         := Random(255);
  req.RequestID     := CREQID_SYNCH_TIME;
  req.RequestParam  := FTimeFlag;
  FTimeREQ          := now;
  FTCPClient.SendData(CPID_REQ, @req);

  //di pindah waktu connect aja
  req.RequestID     := CREQID_GAME_SESSION;
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
    ss, ss1, ss2 : TStrings;
//  I,b: Integer;

begin
  //j := 1;
  rec := @apRec^;
  ss  := TStringList.Create;
  ss1 := TStringList.Create;
  ss2 := TStringList.Create;

 // RecToOnlineList(rec^, ss);

  if j <> 2 then
  begin
    ss.Free;
    FSesionMembers.Clear;

    RecToOnlineList(rec^, ss1);
    ss.AddStrings(ss1);

    FSesionMembers.AddStrings(ss);

    ss1.Free;
  end
  else
  begin
    RecToOnlineList(rec^, ss2);
    ss.AddStrings(ss2);

    FSesionMembers.AddStrings(ss);

    //b := FSesionMembers.Count;

    if Assigned(FOnReceiveOnlineList) then
      FOnReceiveOnlineList(FSesionMembers);

    ss2.Free;
  end;

  if j <> 2 then
  begin
    j := 2;
    netSend_RequestClientList;
  end
  else
    j := 1;


end;

//== public method =============================================================
//------------------------------------------------------------------------------
procedure TNetSessionClient.SendStartGameSession(const scID: integer;
  const excName: string;
  const snapshotName: string;
  const cGPMType : byte;
  const cGPMFName : string);
var rs : TRecSessionState;
begin
  rs.Order := CID_CREATE;
  rs.SessionType  := Byte(ssPlaying);
  rs.ScenarioID   := scID;
  rs.SessionStat  := Byte(True);
  rs.SessionID    := 0;
  rs.ExerciseName := LimitStr(excName, 60);
  rs.SnapshotName := LimitStr(snapshotName, 20);
  rs.GPMType      := cGPMType;
  rs.GPMFName     := cGPMFName;
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
  rs.GPMType      := 0;
  FTCPClient.SendData(CPID_SESSIONSTATE, @rs);
end;


//------------------------------------------------------------------------------
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
function TNetSessionClient.CloseVBS(ExeFileName: string): integer;
const
PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
    UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
    UpperCase(ExeFileName))) then
    Result := Integer(TerminateProcess(
    OpenProcess(PROCESS_TERMINATE,
    BOOL(0),
    FProcessEntry32.th32ProcessID),
    0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TNetSessionClient.ConnectGameSession;
begin
   //if IsController then

  with FGameSessionInfo do begin

    if  StateActive  then begin
      if RunVBS then
        FAppGame.FExecFname     := vAppSetting.VBSClientName
      else
        FAppGame.FExecFname     := vAppSetting.GameClientName;

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


function TNetSessionClient.StartDBEditSession: boolean;
begin
  if FAppGame.Active then begin
    FAppGame.Terminates;
  end;

   // terminate dulu ?
  if FAppDBEdit.Active then begin
     FAppDBEdit.Terminates;
  end;

  FAppDBEdit.ExecutesAndWait;
  result := true;
end;


procedure TNetSessionClient.RequestOnlineList;
var rq: TRecRequest;
begin
  rq.RequestID := CREQID_ONLINE_LIST;
  FTCPClient.SendData(CPID_REQ, @rq);

end;

// -- assign cubicle to client -------------------------------------------------

procedure TNetSessionClient.SendCubicleAssign(const ipAdd: string;
 const cmd: Byte; const param: Integer);
var rq: TRecCubAssign;
begin
  rq.cmdID    := cmd;
  rq.GroupID  := param;
  rq.pid.ipReceiver := StrIp_To_LongIp(ipAdd);
  rq.LongIP   := rq.pid.ipReceiver;

  FTCPClient.SendData(CPID_CUBICLEASSIGN, @rq);
end;


procedure TNetSessionClient.netOnRecv_CubicleAssign(apRec: PAnsiChar;
  aSize: Word);
var rq: ^TRecCubAssign;
    ip: string;
    i: Integer;
begin
  rq := @apRec^;
  ip := LongIp_To_StrIp(rq^.LongIP);
  // ipne sopo to ?

  case rq.cmdID  of
    CMD_ASSIGN_CLEAR : begin
      CubicleGroupAssign.Clear;

      // clear from file setting
      SetLength(vCubicalAssignSetting.GroupIDs, 0);
      SaveFF_CubicalAssignSetting(vSettingFile, vCubicalAssignSetting);
    end;
    CMD_ASSIGN_ADD: begin
      CubicleGroupAssign.Add(rq^.GroupID);

    end;
    CMD_ASSIGN_END: begin
      // end of assignment; save to file setting;
      SetLength(vCubicalAssignSetting.GroupIDs, CubicleGroupAssign.Count);

      for I := 0 to CubicleGroupAssign.Count - 1 do
        vCubicalAssignSetting.GroupIDs[i] := CubicleGroupAssign.AssList[i];

      SaveFF_CubicalAssignSetting(vSettingFile, vCubicalAssignSetting);
    end;

  end;

end;
//------------------------------------------------------------------------------

procedure TNetSessionClient.netOnRecv_SynchTime(apRec: PAnsiChar; aSize: Word);
var r: ^TRecServerTime;
    svrTime: TDateTime;
    st: TSystemTime;
begin
  r := @apRec^;
  if r^.flag = FTimeFlag then begin
    svrTime := 0.5 * (Now - FTimeREQ) + r^.ServerTime;
    DateTimeToSystemTime(svrTime, st);

    SetLocalTime(st);
    FTimeFlag := 0;
  end;

end;

procedure TNetSessionClient.netRecv_CmdVersion(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmdVersion;
  data : TRecCmdVersion;
  IP : string;
begin
  aRec := @apRec^;

  IP := LongIp_To_StrIp(aRec^.pid.ipSender);


  case aRec^.SynchID of
    CORD_ID_GET_VERSION :
      begin
        data.SynchID := CORD_ID_GET_VERSION;
        data.Synch_Version := EncryptStr(FVersion, FKeyVersion);
        FTCPClient.SendData(CPID_CMD_VERSION, @data);
      end;
    CORD_ID_VERSION_MATCH :
      begin
        //ShowMessage('Version Match');
      end;
    CORD_ID_VERSION_NOT_MATCH :
      begin
        if MessageDlg('Version did not match, Session server version is ' + aRec^.Synch_Version, mtWarning,
        [mbOK], 0) = mrOK then
          Application.Terminate;

      end;
  end;
end;

procedure TNetSessionClient.netOnRecv_Notify(apRec: PAnsiChar; aSize: Word);
var r: ^TRecNotify;
begin
  r := @apRec^;
  if r^.NotifyID = CNOT_MAPSYNCH then begin
    FAppSynchMap.Executes;
  end;
end;

procedure TNetSessionClient.SendRequestSynchMap();
var r: TRecRequest;
begin
  r.RequestID := CREQID_MAPSYNCH;
  FTCPClient.SendData(CPID_REQ, @r);


end;

end.

