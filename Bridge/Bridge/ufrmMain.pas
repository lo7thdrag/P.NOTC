unit ufrmMain;

interface

{$REGION 'USES'}
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.StdCtrls, Vcl.ExtCtrls, DateUtils,

  uTCPDatatype,
  uTCPServer,
  uTCPClient,
  uDataRec,
  uDataType,
  uNetLinkClient,
  uNetLinkServer,
  uNetUDPnode,
  UDataRecJSON,
  uBaseCoordSystem,

  Grijjy.Bson,
  Grijjy.Bson.IO,
  Grijjy.Bson.Serialization, Vcl.Imaging.pngimage;
{$ENDREGION}

{$REGION 'DECLARATIONS'}
type
  TMainForm = class(TForm)
  {$REGION 'Main Form global members'}
    ListenButton: TButton;
    LogMemo: TMemo;
    tmrGetPacketAsAotcClient: TTimer;
    TopPanel: TPanel;
    edtSvrIp: TEdit;
    tmrGetPacketAs3dServer: TTimer;
    edtSvrPort: TEdit;
    tmrGetPacketAsAotcServer: TTimer;
    lbl1: TLabel;
    lbl2: TLabel;
    edt3dSvrPort: TEdit;
    tmrDelayer: TTimer;
    lbl21: TLabel;
    edtThisSvrPort: TEdit;
    chkShowLog: TCheckBox;
    btnClearLog: TButton;
    lbl3: TLabel;
    lbl11: TLabel;
    edtSvrUdpIp: TEdit;
    lbl31: TLabel;
    edtSvrUdpPort: TEdit;
    tmrGetPacketForUDP: TTimer;
    pnlClose: TPanel;
    imgClose: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListenButtonClick(Sender: TObject);
    procedure tmrGetPacketAsAotcClientTimer(Sender: TObject);
    procedure tmrGetPacketAs3dServerTimer(Sender: TObject);
    procedure tmrGetPacketAsAotcServerTimer(Sender: TObject);
    procedure btnClearLogClick(Sender: TObject);
    procedure chkShowLogClick(Sender: TObject);
    procedure tmrGetPacketForUDPTimer(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
    procedure NetRecv_SessionStateLocal(apRec: PAnsiChar; aSize: Word);
    {$ENDREGION}
  private
    { Private declarations }
    //DEBUG ONLY
    FPosX_Incr: Double;
    FPosX_Incr_Multiplier: Double;

    VerboseLogEnabled: Boolean;

    FSessionId, GSessionId, SessCount: Integer;
    FAOTC_SIMSVR_2D_CLIENT: TTCPClient; // client socket to AOTC Sim Server general commands
    FAOTC_SIMSVR_3D_CLIENT: TTCPClient; // client socket to AOTC Sim Server general commands
    F3D_SERVER: TNetLinkServer; // server socket for 3D clients
    FAOTC_SIMSVR_UDP_NODE: TNetUDPNode; // UDP socket for AOTC Sim Server
    UDP_BROADCAST_ADDR: string;

    FTimerDelayerInterval,
    FTimerDelayerMaxCount: Integer;

    procedure RegisterProcedures;
    procedure Initialize3D;

    // FAOTC_SIMSVR_2D_CLIENT and FAOTC_SIMSVR_3D_CLIENT
    procedure NetRecv_AotcInitSync(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_Synch_Pos_VBS(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_TCPRequest(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_GameTime(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_AotcRecData(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_PlatformCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_RemovePlatform(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_LaunchPlatform(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_EmbarkCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_RampControl(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_GunCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_MissileCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_TorpedoCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_CameraControl(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_WaypointData(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_MultiMode(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_NewEmbarkCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_MineCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_BombCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_LogisticState(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_LogisticChange(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_EnviCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_GameControl(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_SessionState(apRec: PAnsiChar; aSize: Word);
    procedure NetRecv_SonarDeploy(apRec: PAnsiChar; aSize: Word);

    procedure OnConnectedToServerEvent(aSender: TObject);
    procedure OnDisconnectedFromServerEvent(aSender: TObject);

    procedure SendTCPRequest(const aID: Word; aBuffer: PAnsiChar);
    procedure SendRecAotcData(const aID: Word; aBuffer: PAnsiChar);
    procedure SendSyncPos3D(const aID: Word; aBuffer: PAnsiChar);
    procedure SendPauseToAOTC(const aID: Word; aBuffer: PAnsiChar);

    procedure Send3dSvrHandshakeMessageToSimServer;
    procedure Send3dReadyToInitScenObjectsFromSimServer;
    procedure Send3dReadyToGetNextObjectFromSimServer;
    procedure Send3DUpdateDataPosToSimServer(rec: NetRec_AOTC_Data_Initialize);
    procedure Send3DConnectedPause;
//    procedure Send3DUpdateDataPosToSimServer(rec: TRecUDP_PlatformMovement);

    // F3D_SERVER
    procedure FNetServer_OnClientConnect(const S: string);
    procedure FNetServer_OnClientDisConnect(const S: string);
    procedure NetRecv_Info3DReady(AHeader: TPacketHeader; AContent: string);
//    procedure NetRecv_UpdateDataPos(AHeader: TPacketHeader; AContent: string);
    procedure NetRecv_3D_NIL(AHeader: TPacketHeader; AContent: string);
    procedure NetRecv_3D_Pos_Update_From3D(AHeader: TPacketHeader; AContent: string);
    procedure NetSend_3DInit(SessionID: integer);
    procedure NetSend_ObjInit(NetRec: NetRec_AOTC_Data_Initialize);
    procedure NetSend_GameTimeUpdate(NetRec: NetRec_GameTime);
    procedure NetSend_PlatformCmd(NetRec: NetRec_Cmd_Platform);
    procedure NetSend_RemovePlatform(NetRec: NetRec_Cmd_SelectPlatformToRemove);
    procedure NetSend_LaunchPlatform(NetRec: NetRec_Cmd_LaunchRP);
    procedure NetSend_PlatformRepositionTo3D(NetRec: Net_RecCmd_Platform_MOVE);
    procedure NetSendEmbarkCmd(NetRec: NetRecCmd_Embark);
    procedure NetSendRampControl(NetRec: NetRecCmd_RampController);
    procedure NetSendGunCmd(NetRec: NetRecCmd_GunFire);
    procedure NetSendMissileCmd(NetRec: NetRecCmd_LaunchMissile);
    procedure NetSendTorpedoCmd(NetRec: NetRecCmd_LaunchMissile);
    procedure NetSendCameraControl(NetRec: NetRec_CameraController);
    procedure NetSendWaypointData(NetRec: NetRecSync_WaypointDataTo3D);
    procedure NetSendMultiMode(NetRec: NetRecCmdMultiModeTo3D);
    procedure NetSendNewEmbarkCmd(NetRec: NetRecCmd_Transport);
    procedure NetSendMineCmd(NetRec: NetRecCmd_LaunchMine);
    procedure NetSendBombCmd(NetRec: NetRecCmd_LaunchBomb);
    procedure NetSendLogisticState(NetRec: NetRecCmd_State_Logistic);
    procedure NetSendEnviCmd(NetRec: NetRecSinc_Envi);
    procedure NetSendGameControlCmd(NetRec: NetRecCmd_GameCtrl);
    procedure NetSendSessionState(NetRec: NetRecSessionState);
    procedure NetSendSonarDeploy(NetRec: NetRecCmd_SonarDeploy);

//    procedure SendPlatformInitData(aRec: TRec_AOTC_Data_Initialize);
    procedure SendPlatformInitObjData(aRec: TRec_AOTC_Data_Initialize; Net_Ord_ID:Byte);
    procedure SendGameTimeUpdate3D(aRec: TRec_GameTime);
    procedure SendPlatformCmd(aRec: TRecCmd_Platform);
    procedure SendRemovePlatform(aRec: TRecCmd_SelectPlatformToRemove);
    procedure SendLaunchPlatform(aRec: TRecCmd_LaunchRP);
    procedure SendPlatformRepositionTo3D(aRec: TRecCmd_Platform_MOVE);
    procedure SendEmbarkCmdTo3D(aRec: TRecCmd_Embark);
    procedure SendRampControlTo3D(aRec: TRecCmd_RampController);
    procedure SendGunCmdTo3D(aRec: TRecCmd_GunFire);
    procedure SendMissileCmdTo3D(aRec: TRecCmd_LaunchMissile);
    procedure SendTorpedoCmdTo3D(aRec: TRecCmd_LaunchMissile);
    procedure SendCameraControlTo3D(aRec: TRec_CameraController);
    procedure SendWaypointDataTo3D(aRec: TRecSync_WaypointDataTo3D);
    procedure SendMultiModeTo3D(aRec: TRecCmdMultiModeTo3D);
    procedure SendNewEmbarkCmdTo3D(aRec: TRecCmd_Transport);
    procedure SendMineCmdTo3D(aRec: TRecCmd_LaunchMine);
    procedure SendBombCmdTo3D(aRec: TRecCmd_LaunchBomb);
    procedure SendLogisticStateTo3D(aRec: TRecCmd_State_Logistic);
    procedure SendLogisticChangeTo3D(aRec: TRecCmd_Change_Logistic);
    procedure SendEnviCmdTo3D(aRec: TrecSinc_Envi);
    procedure SendGameControlTo3D(aRec: TRecCmd_GameCtrl);
    procedure SendSessionStateTo3D(aRec: TRecSessionState);
    procedure SendSonarDeployTo3D(aRec: TRecCmd_SonarDeploy);

    procedure OnSendLog(const S: string);


    // UDP SOCKET
    procedure NetRecv_UDP_PlatformReposition(apRec: PAnsiChar; aSize: Word);

    procedure LogAddEndSeparator;

  public
    { Public declarations }

  end;
{$ENDREGION}

var
  MainForm: TMainForm;

implementation


{$R *.dfm}

{$region 'CONSTRUCTOR AND INITIALIZATION'}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  RegisterProcedures;

  VerboseLogEnabled := true;

  FPosX_Incr:= 0.00001;
  FPosX_Incr_Multiplier:= 0.00001;

  FTimerDelayerInterval := 1000;
  FTimerDelayerMaxCount := 5000;
  tmrDelayer.Tag := 0;
  tmrDelayer.Interval := FTimerDelayerInterval;
  tmrDelayer.Enabled := False;

  tmrGetPacketAsAotcClient.Interval:= 15;
  tmrGetPacketAsAotcClient.Enabled:= True;

  tmrGetPacketAs3dServer.Interval:= 15;
  tmrGetPacketAs3dServer.Enabled:= True;

//  ListenButton.Click;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FSessionId := 69;

  FAOTC_SIMSVR_2D_CLIENT.Disconnect;
  FAOTC_SIMSVR_2D_CLIENT.UnregisterAllProcedure;
  FAOTC_SIMSVR_2D_CLIENT.Free;

  FAOTC_SIMSVR_3D_CLIENT.Disconnect;
  FAOTC_SIMSVR_3D_CLIENT.UnregisterAllProcedure;
  FAOTC_SIMSVR_3D_CLIENT.Free;

  F3D_SERVER.UnregisterAllProcedure;
  F3D_SERVER.Stop;
  F3D_SERVER.Free;

  FAOTC_SIMSVR_UDP_NODE.Close;
  FAOTC_SIMSVR_UDP_NODE.UnregisterAllProcedure;
  FAOTC_SIMSVR_UDP_NODE.Free;

end;

{$endregion}

{$region 'GUI HANDLERS'}
procedure TMainForm.btnClearLogClick(Sender: TObject);
begin
  LogMemo.Lines.Clear;
end;

procedure TMainForm.chkShowLogClick(Sender: TObject);
begin
  VerboseLogEnabled := chkShowLog.Checked;
end;

procedure TMainForm.ListenButtonClick(Sender: TObject);
var
  AButton: TButton;
begin
  if Sender is TButton then begin
    AButton:= (Sender as TButton);
    case AButton.Tag of
      0 :  //Start Listen
      begin
        SessCount := 0;
        FAOTC_SIMSVR_2D_CLIENT.Connect(edtSvrIp.Text, edtSvrPort.Text);
        FAOTC_SIMSVR_3D_CLIENT.Connect(edtSvrIp.Text, edt3dSvrPort.Text);
        F3D_SERVER.Listen(edtThisSvrPort.Text);
        FAOTC_SIMSVR_UDP_NODE.Listen(edtSvrUdpPort.Text);
        tmrGetPacketAsAotcClient.Enabled := True;
        AButton.Tag := 1;
        AButton.Caption := 'Stop';
      end;
      1 :  //Stop Listen
      begin
        SessCount := 0;
        tmrGetPacketAsAotcClient.Enabled := False;
        FAOTC_SIMSVR_2D_CLIENT.Disconnect;
        FAOTC_SIMSVR_3D_CLIENT.Disconnect;
        F3D_SERVER.Stop;
        FAOTC_SIMSVR_UDP_NODE.Close;
        AButton.Tag := 0;
        AButton.Caption := 'Start';
//        LogMemo.Clear;
      end;
    end;
  end;
end;

procedure TMainForm.LogAddEndSeparator;
begin
  LogMemo.Lines.Add('-------------------------------------------------');
end;

{$endregion}

{$REGION 'SOCKET REGISTER PROCS'}
procedure TMainForm.RegisterProcedures;
begin
  // AOTC (Delphi) 2D client
  //register paket receive dari 2d disini Denta
  FAOTC_SIMSVR_2D_CLIENT := TTCPClient.Create;
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_SYNCH, NetRecv_AotcInitSync, SizeOf(TRecCmdSYNCH));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_GAME_TIME, NetRecv_GameTime, SizeOf(TRec_GameTime));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_REC_AOTC_DATA, NetRecv_AotcRecData, SizeOf(TRec_AOTC_Data_Initialize));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_PLATFORM, NetRecv_PlatformCmd, SizeOf(TRecCmd_Platform));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_REMOVE_PLATFORM, NetRecv_RemovePlatform, SizeOf(TRecCmd_SelectPlatformToRemove));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_LAUNCH_RUNTIME_PLATFORM, NetRecv_LaunchPlatform, SizeOf(TRecCmd_LaunchRP));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_LAUNCH_EMBARK, NetRecv_EmbarkCmd, SizeOf(TRecCmd_Embark));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_RAMP, NetRecv_RampControl, SizeOf(TRecCmd_RampController));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_GUN_FIRE, NetRecv_GunCmd, SizeOf(TRecCmd_GunFire));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_LAUNCH_MISSILE, NetRecv_MissileCmd, SizeOf(TRecCmd_LaunchMissile));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_LAUNCH_TORPEDO, NetRecv_TorpedoCmd, SizeOf(TRecCmd_LaunchMissile));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_CAMERA_CONTROLLER, NetRecv_CameraControl, SizeOf(TRec_CameraController));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_SYNC_WAYPOINTDATATO3D, NetRecv_WaypointData, SizeOf(TRecSync_WaypointDataTo3D));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_MULTI_MODE_TO_3D, NetRecv_MultiMode, SizeOf(TRecCmdMultiModeTo3D));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_TRANSPORT, NetRecv_NewEmbarkCmd, SizeOf(TRecCmd_Transport));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_LAUNCH_MINES, NetRecv_MineCmd, SizeOf(TRecCmd_LaunchMine));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_LAUNCH_BOMB, NetRecv_BombCmd, SizeOf(TRecCmd_LaunchBomb));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_LOGISTIC_STATUS, NetRecv_LogisticState, SizeOf(TRecCmd_State_Logistic));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_CHANGE_LOGISTIC, NetRecv_LogisticChange, SizeOf(TRecCmd_Change_Logistic));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_ENVI, NetRecv_EnviCmd, SizeOf(TrecSinc_Envi));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_GAME_CTRL, NetRecv_GameControl, SizeOf(TRecCmd_GameCtrl));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_SESSIONSTATE, NetRecv_SessionState, SizeOf(TRecSessionState));
  FAOTC_SIMSVR_2D_CLIENT.RegisterProcedure(CPID_CMD_SONAR_DEPLOY, NetRecv_SonarDeploy, SizeOf(TRecCmd_SonarDeploy));

  // AOTC (Delphi) 3D client
  FAOTC_SIMSVR_3D_CLIENT := TTCPClient.Create;
  FAOTC_SIMSVR_3D_CLIENT.OnConnected := OnConnectedToServerEvent;
  FAOTC_SIMSVR_3D_CLIENT.OnDisconnected := OnDisconnectedFromServerEvent;
  //
  FAOTC_SIMSVR_3D_CLIENT.RegisterProcedure(CPID_TCP_REQUEST, NetRecv_TCPRequest, SizeOf(TRecTCP_Request));
  FAOTC_SIMSVR_3D_CLIENT.RegisterProcedure(CPID_SYNCH_POS_3D, nil, SizeOf(TRecUDP_PlatformMovement));
  FAOTC_SIMSVR_3D_CLIENT.RegisterProcedure(CPID_REC_AOTC_DATA, nil, SizeOf(TRec_AOTC_Data_Initialize));
  FAOTC_SIMSVR_3D_CLIENT.RegisterProcedure(CPID_CMD_GAME_CTRL, nil, SizeOf(TRecCmd_GameCtrl));
//  FAOTC_SIMSVR_3D_CLIENT.RegisterProcedure(CPID_CMD_PLATFORM, NetRecv_PlatformCmd, SizeOf(TRecCmd_Platform));

  // 3D (C#) server
  F3D_SERVER := TNetLinkServer.Create;
  F3D_SERVER.OnClient_Connect     := FNetServer_OnClientConnect;
  F3D_SERVER.OnClient_DisConnect  := FNetServer_OnClientDisConnect;
  F3D_SERVER.OnGetSendLog := OnSendLog;
  //
  F3D_SERVER.RegisterProcedure(CPID_3D_INFO, NetRecv_Info3DReady);
  F3D_SERVER.RegisterProcedure(CPID_3D_DATA_UPDATE, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_GAME_TIME_UPDATE_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_POS_UPDATE_FROM3D, NetRecv_3D_Pos_Update_From3D);
  F3D_SERVER.RegisterProcedure(CPID_CMD_PLATFORM3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_REMOVE_PLATFORM3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_LAUNCH_RUNTIME_PLATFORM3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_LAUNCH_EMBARK, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_RAMP_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_GUN_FIRE_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_LAUNCH_MISSILE_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_LAUNCH_TORPEDO_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_CAMERA_CONTROLLER_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_SYNC_WAYPOINTDATATO3D_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_MULTI_MODE_TO3D_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_TRANSPORT_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_LAUNCH_MINES_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_LAUNCH_BOMB_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_LOGISTIC_STATUS_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_ENVI_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_GAME_CTRL_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_SESSIONSTATE_3D, NetRecv_3D_NIL);
  F3D_SERVER.RegisterProcedure(CPID_CMD_SONAR_DEPLOY_3D, NetRecv_3D_NIL);

  // AOTC UDP (Delphi)
  FAOTC_SIMSVR_UDP_NODE := TNetUDPNode.Create;
  FAOTC_SIMSVR_UDP_NODE.Port := StrToInt(edtSvrUdpPort.Text);
  UDP_BROADCAST_ADDR := edtSvrUdpIp.Text;
  FAOTC_SIMSVR_UDP_NODE.RegisterProcedure(CPID_UDP_REPOSITION, NetRecv_UDP_PlatformReposition, SizeOf(TRecCmd_Platform_MOVE));

end;
{$ENDREGION}

{$region 'SOCKET TIMER HANDLERS'}
procedure TMainForm.tmrGetPacketAsAotcClientTimer(Sender: TObject);
begin
  FAOTC_SIMSVR_2D_CLIENT.GetPacket;
  FAOTC_SIMSVR_3D_CLIENT.GetPacket;
end;

procedure TMainForm.tmrGetPacketAs3dServerTimer(Sender: TObject);
begin
  F3D_SERVER.GetPacket;
end;

procedure TMainForm.tmrGetPacketAsAotcServerTimer(Sender: TObject);
begin
//
end;
procedure TMainForm.tmrGetPacketForUDPTimer(Sender: TObject);
begin
  //FAOTC_SIMSVR_UDP_NODE.GetPac
end;

{$ENDREGION}

{$REGION 'SOCKET EVENT HANDLERS'}
procedure TMainForm.OnConnectedToServerEvent(aSender: TObject);
begin
  Send3dSvrHandshakeMessageToSimServer;
end;

procedure TMainForm.OnDisconnectedFromServerEvent(aSender: TObject);
begin

end;

procedure TMainForm.OnSendLog(const S: string);
begin
  LogMemo.Lines.Add(S);
end;

procedure TMainForm.FNetServer_OnClientConnect(const S: string);
begin
  LogMemo.Lines.Add('--AOTC 3D CLIENT CONNECTED--');
  Send3DConnectedPause;
  LogAddEndSeparator;
  NetSend_3DInit(FSessionId);
end;

procedure TMainForm.FNetServer_OnClientDisConnect(const S: string);
begin
  LogMemo.Lines.Add('--AOTC 3D CLIENT DISCONNECTED--');
  LogAddEndSeparator;
end;
{$ENDREGION}

{$REGION 'INCOMING MESSAGE HANDLERS'}
procedure TMainForm.Initialize3D;
begin
  Send3dReadyToInitScenObjectsFromSimServer;
  Sleep(100); // safe?
  Send3dReadyToGetNextObjectFromSimServer;
end;

procedure TMainForm.NetRecv_Info3DReady(AHeader: TPacketHeader;
  AContent: string);
var
  r : NetRecData3D;
begin
  TgoBsonSerializer.Deserialize<NetRecData3D>(AContent, r);

  if (r.OrderId = CORD_ID_3D_READY) then begin
    LogMemo.Lines.Add('3D Client notifies it''s ready to accept data.');
    LogAddEndSeparator;
    Initialize3D;
  end;
end;

procedure TMainForm.NetRecv_3D_NIL(AHeader: TPacketHeader;
  AContent: string);
begin

end;

procedure TMainForm.NetRecv_3D_Pos_Update_From3D(AHeader: TPacketHeader;
  AContent: string);
var
  r : NetRec_AOTC_Data_Initialize;
begin
  TgoBsonSerializer.Deserialize<NetRec_AOTC_Data_Initialize>(AContent, r);

  if (VerboseLogEnabled = true) then begin
//    LogMemo.Lines.Add('------------------------------UPDATE-POS-FROM-3D------------------------------');
    //LogMemo.Lines.Add('Platform ID: ' + r.PlatformID.ToString);
    //LogMemo.Lines.Add('Platform Name: ' + r.namePlatform);
//    LogMemo.Lines.Add('Platform Class: ' + r.nameClass);
//    LogMemo.Lines.Add('Platform Name ID: ' + r.IDPlatformName.ToString);
//    LogMemo.Lines.Add('Platform Class ID: ' + r.IDPlatformClass.ToString);
//    LogMemo.Lines.Add('Position Lon: ' + formatDMS_long(r.PosX));
//    LogMemo.Lines.Add('Position Lat: ' + formatDMS_latt(r.PosY));
//    LogMemo.Lines.Add('Heading (T): ' + FormatFloat('000', r.Heading));
//    LogMemo.Lines.Add('Speed (kt): ' + FormatFloat('0', r.Speed));
//    LogMemo.Lines.Add('Altitude (m): ' + FormatFloat('0', r.PosZ));
//    LogAddEndSeparator;
  end;

  Send3DUpdateDataPosToSimServer(r);

end;

procedure TMainForm.NetRecv_AotcInitSync(apRec: PAnsiChar; aSize: Word);
var
  r : ^TRecCmdSYNCH;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Session ID: ' + r^.SessionID.ToString);
  LogMemo.Lines.Add('SynchID: ' + r^.SynchID.ToString);
  LogAddEndSeparator;

  case SessCount of
    0:
    begin
      GSessionId := r^.SessionID;
      SessCount := SessCount + 1;
    end;
    1: FSessionId := r^.SessionID;
  end;
end;

procedure TMainForm.NetRecv_AotcRecData(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRec_AOTC_Data_Initialize;
begin
  r := @apRec^;

  case r^.OrderID of

    CORD_ID_REQ_NEXT_DATA: begin

      if (r^.FreeMe = 0) and (r^.PlatformID <> 0) then
      begin // ignore freed objects

        if (VerboseLogEnabled = true) then
        begin
          // Only log the received msg! Do NOT save it, this isn't a REAL server!!!
          LogMemo.Lines.Add('Platform ID: ' + r^.PlatformID.ToString);
          LogMemo.Lines.Add('Platform Name: ' + r^.namePlatform);
          LogMemo.Lines.Add('Platform Class: ' + r^.nameClass);
          LogMemo.Lines.Add('Platform Name ID: ' + r^.IDPlatformName.ToString);
          LogMemo.Lines.Add('Platform Class ID: ' + r^.IDPlatformClass.ToString);
          LogMemo.Lines.Add('Position Lon: ' + formatDMS_long(r^.PosX));
          LogMemo.Lines.Add('Position Lat: ' + formatDMS_latt(r^.PosY));
          LogMemo.Lines.Add('Heading (T): ' + r^.Course.ToString);
          LogMemo.Lines.Add('Speed (kt): ' + r^.Speed.ToString);
          LogMemo.Lines.Add('Altitude (m): ' + r^.Altitude.ToString);
        end;

        SendPlatformInitObjData(r^, CORD_ID_OBJ_INIT); // parse to 3D client
      end;

      Send3dReadyToGetNextObjectFromSimServer; // done with this one. Request next
    end;

    CORD_ID_END_SEND_DATA: begin
      LogMemo.Lines.Add('Done getting all object data from SimServer');
      SendPlatformInitObjData(r^, CORD_ID_END_OBJ_INIT); // parse to 3D client
    end;

  end;
  LogAddEndSeparator;

end;

procedure TMainForm.NetRecv_EmbarkCmd(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_Embark;
begin

  r := @apRec^;

  LogMemo.Lines.Add('Received embark command for PlatfID ' + r^.EmbarkPlatformID.ToString +
                    ' from carrier ' + r^.ParentPlatformID.ToString);

  SendEmbarkCmdTo3D(r^);

end;

procedure TMainForm.NetRecv_PlatformCmd(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_Platform;
begin
  r := @apRec^;

  if (VerboseLogEnabled = True) then begin
    LogMemo.Lines.Add('Platform ID: ' + r^.PlatfomID.ToString);
    LogMemo.Lines.Add('Order ID: ' + r^.OrderID.ToString);
    LogMemo.Lines.Add('Order Type: ' + r^.OrderType.ToString);
    LogMemo.Lines.Add('Order Param: ' + FormatFloat('000', r^.OrderParam));
    LogAddEndSeparator;
  end;

  SendPlatformCmd(r^);

end;

procedure TMainForm.NetRecv_RampControl(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_RampController;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received ramp control for PlatfID ' + r^.PlatformID.ToString +
                    '. Ramp status is ' + r^.RampState.ToString);

  SendRampControlTo3D(r^);
end;

procedure TMainForm.NetRecv_GunCmd(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_GunFire;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received gun control for PlatfID ' + r^.ParentPlatformID.ToString +
                    '. Gun status is ' + r^.OrderID.ToString);

  SendGunCmdTo3D(r^);
end;

procedure TMainForm.NetRecv_MissileCmd(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_LaunchMissile;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Missile control for PlatfID ' + r^.ParentPlatformID.ToString +
                    '. Missile status is ' + r^.Order.ToString);

  SendMissileCmdTo3D(r^);
end;

procedure TMainForm.NetRecv_TorpedoCmd(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_LaunchMissile;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Torpedo control for PlatfID ' + r^.ParentPlatformID.ToString +
                    '. Torpedo status is ' + r^.Order.ToString);

  SendTorpedoCmdTo3D(r^);
end;

procedure TMainForm.NetRecv_CameraControl(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRec_CameraController;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Camera control' +
                    '. Camera status is ' + r^.cmd.ToString);

  SendCameraControlTo3D(r^);
end;

procedure TMainForm.NetRecv_WaypointData(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecSync_WaypointDataTo3D;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Waypoint control for PlatfID ' + r^.PlatformID.ToString +
                    '. Waypoint status is ' + r^.OrderID.ToString);

  SendWaypointDataTo3D(r^);
end;

procedure TMainForm.NetRecv_MultiMode(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmdMultiModeTo3D;
  I: Integer;
begin
  r := @apRec^;

  for I := 0 to r^.CountVehicle do
  begin
    LogMemo.Lines.Add('Received Multi Mode control for PlatfID ' + r^.PlatformID[I].ToString +
                    '. Multi Mode status is ' + r^.aAction.ToString);
  end;

  SendMultiModeTo3D(r^);
end;

procedure TMainForm.NetRecv_NewEmbarkCmd(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_Transport;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Embark control for PlatfID ' + r^.HostPlatformID.ToString +
                    '. Embark status is ' + r^.OrderID.ToString);

  SendNewEmbarkCmdTo3D(r^);
end;

procedure TMainForm.NetRecv_MineCmd(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_LaunchMine;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Mine control for PlatfID ' + r^.ParentPlatformID.ToString +
                    '. Mine status is 0');

  SendMineCmdTo3D(r^);
end;

procedure TMainForm.NetRecv_BombCmd(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_LaunchBomb;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Bomb control for PlatfID ' + r^.ParentPlatformID.ToString +
                    '. Bomb status is 0');

  SendBombCmdTo3D(r^);
end;

procedure TMainForm.NetRecv_LogisticState(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_State_Logistic;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Logistic State for PlatfID ' + r^.PlatfomID.ToString +
                    '. Logistic status is ' + r^.ActionID.ToString);

  SendLogisticStateTo3D(r^);
end;

procedure TMainForm.NetRecv_LogisticChange(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_Change_Logistic;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Logistic State for PlatfID ' + r^.PlatfomID.ToString +
                    '. Logistic status is ' + r^.StateID.ToString);

  SendLogisticChangeTo3D(r^);
end;

procedure TMainForm.NetRecv_EnviCmd(apRec: PAnsiChar; aSize: Word);
var
  r: ^TrecSinc_Envi;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Environment State ' + r^.Envi_Chance.ToString +
                    '. Environment Value is ' + r^.Value.ToString);

  SendEnviCmdTo3D(r^);
end;

procedure TMainForm.NetRecv_GameControl(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_GameCtrl;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Game Control ' + r^.GameCtrl.ToString +
                    '. Game speed is ' + r^.GameSpeed.ToString);

  SendGameControlTo3D(r^);
end;

procedure TMainForm.NetRecv_SessionState(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecSessionState;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Session state ' + r^.SessionType.ToString +
                    '. state is ' + r^.Order.ToString);

  SendSessionStateTo3D(r^);
end;

procedure TMainForm.NetRecv_SonarDeploy(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_SonarDeploy;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Sonar Command ' + r^.Param +
                    '. Deploy Status is ' + r^.OrderCable);

  SendSonarDeployTo3D(r^);
end;

procedure TMainForm.NetRecv_SessionStateLocal(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecSessionState;
begin
  r := @apRec^;

  LogMemo.Lines.Add('Received Local Session state ' + r^.SessionType.ToString +
                    '. state is ' + r^.Order.ToString);

  SendSessionStateTo3D(r^);
end;

procedure TMainForm.NetRecv_RemovePlatform(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_SelectPlatformToRemove;
begin
  r := @apRec^;

  if (VerboseLogEnabled = True) then begin
    LogMemo.Lines.Add('Remove Platform ID: ' + r^.PlatfomID.ToString);
    LogMemo.Lines.Add('Action ID: ' + r^.IdAction.ToString);
    LogAddEndSeparator;
  end;

  SendRemovePlatform(r^);

end;

procedure TMainForm.NetRecv_LaunchPlatform(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_LaunchRP;
begin

  r := @apRec^;

  if (VerboseLogEnabled = True) then begin
    LogMemo.Lines.Add('::SPAWN NEW REAL PLATFORM::');
    LogMemo.Lines.Add('RP Platform ID: ' + r^.RPPlatformID.ToString);
    LogMemo.Lines.Add('New Platform ID: ' + r^.NewPlatformID.ToString);
    LogMemo.Lines.Add('Platform Name: ' + r^.namePlatform);
    LogMemo.Lines.Add('Platform Class: ' + r^.nameClass);
    LogMemo.Lines.Add('Platform Name ID: ' + r^.IDPlatformName.ToString);
    LogMemo.Lines.Add('Platform Class ID: ' + r^.IDPlatformClass.ToString);
    LogMemo.Lines.Add('Position Lon: ' + formatDMS_long(r^.pX));
    LogMemo.Lines.Add('Position Lat: ' + formatDMS_latt(r^.pY));
    LogMemo.Lines.Add('Heading (T): ' + r^.PHeading.ToString);
    LogMemo.Lines.Add('Speed (kt): ' + r^.pSpeed.ToString);
    LogMemo.Lines.Add('Altitude (m): ' + r^.pAltitude.ToString);
    LogMemo.Lines.Add('Turn Rate : ' + r^.TurnRate.ToString);
    LogMemo.Lines.Add('Dive Rate : ' + r^.DiveRate.ToString);
    LogAddEndSeparator;
  end;

  SendLaunchPlatform(r^);

end;

//procedure TMainForm.NetRecv_UpdateDataPos(AHeader: TPacketHeader;
//  AContent: string);
//begin
//
//end;

procedure TMainForm.NetRecv_GameTime(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRec_GameTime;
  gYear, gMonth, gDay,
  gHour, gMin, gSec: Integer;
  gDateTime: TDateTime;
begin
  r := @apRec^;

  gYear := r^.GameYear;
  gMonth := r^.GameMonth;
  gDay := r^.GameDay;
  gHour := r^.Gamehour;
  gMin := r^.GameMinute;
  gSec := r^.GameSecond;
  gDateTime := EncodeDateTime(gYear, gMonth, gDay, gHour, gMin, gSec, 000);

  if (VerboseLogEnabled = True) then begin
    LogMemo.Lines.Add('Received Game Time from SIM SERVER : ' +
                        FormatDateTime('dddd d of mmmm yyyy hh:nn:ss', gDateTime));
    LogAddEndSeparator;
  end;

  SendGameTimeUpdate3D(r^);
end;

procedure TMainForm.NetRecv_Synch_Pos_VBS(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecUDP_PlatformMovement;
begin

end;

procedure TMainForm.NetRecv_TCPRequest(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecTCP_Request;
begin

end;

{$ENDREGION}

{$REGION 'UDP event handlers'}

procedure TMainForm.NetRecv_UDP_PlatformReposition(apRec: PAnsiChar; aSize: Word);
var
  r: ^TRecCmd_Platform_MOVE;
  xpos, ypos: string;
begin
  r := @apRec^;
  xpos := formatDMS_long(r^.X);
  ypos := formatDMS_long(r^.Y);
  LogMemo.Lines.Add('Received UDP data move for Platform ID ' + r^.PlatfomID.ToString + ' to ' + xpos + ' ' + ypos);
  LogAddEndSeparator;

  SendPlatformRepositionTo3D(r^);
end;


{$ENDREGION}


{$REGION 'MESSAGE SENDERS TO SIM SERVER'}

procedure TMainForm.Send3dSvrHandshakeMessageToSimServer;
var
  r: TRecTCP_Request;
begin
  r.SessionID := FSessionId;
  r.State3D := 1;
  r.reqID := REQ_DATA_PLATFORM;
  SendTCPRequest(CPID_TCP_REQUEST, @r);
end;

procedure TMainForm.Send3dReadyToInitScenObjectsFromSimServer;
var
  r: TRec_AOTC_Data_Initialize;
begin
  r.OrderID := CORD_ID_START_SEND_DATA;
  SendRecAotcData(CPID_REC_AOTC_DATA, @r);
end;

procedure TMainForm.Send3DConnectedPause;
var
  r: TRecCmd_GameCtrl;
begin
  r.SessionID := GSessionId;
  r.GameCtrl := CORD_ID_pause;
  r.GameSpeed := 0;
  r.GotoTime := 0;
  r.TimeTogo := 0;
  SendPauseToAOTC(CPID_CMD_GAME_CTRL, @r);
end;

procedure TMainForm.Send3DUpdateDataPosToSimServer(
  rec: NetRec_AOTC_Data_Initialize);
var
  r: TRecUDP_PlatformMovement;
begin

  r.SessionID := FSessionId;
  r.PlatformID := rec.PlatformID;
  r.OrderID := rec.OrderID;
  r.IDPlatformName := rec.IDPlatformName;
  r.IDPlatformClass := rec.IDPlatformClass;
  r.X := rec.PosX;// + (FPosX_Incr + FPosX_Incr_Multiplier);
  r.Y := rec.PosY;
  r.Z := rec.PosZ;
  r.Course := rec.Heading;
  r.Speed := rec.Speed;
  r.TurnRate := rec.TurnRate;
  //
  r.Accel := 0.0;
  r.ObjectType := 0;
  r.FuelRemaining := 0.0;
  r.MLRemaining := 0.0;
  r.ATRemaining := 0.0;
  r.FoodRemaining := 0.0;
  r.WaterRemaining := 0.0;
  r.TimeRemaining := 0.0;
  r.RangeRemaining := 0.0;
  r.OveralDamage := 0;
  r.HealthPercent := 0.0;

  //FPosX_Incr_Multiplier := FPosX_Incr_Multiplier + 0.00001;

  SendSyncPos3D(CPID_SYNCH_POS_3D, @r);
end;

procedure TMainForm.SendEmbarkCmdTo3D(aRec: TRecCmd_Embark);
var
  NetRec: NetRecCmd_Embark;
begin

  NetRec.OrderID := aRec.OrderID;
  NetRec.QueueNum := aRec.QueueNum;
  NetRec.SessionID := FSessionId;
  NetRec.ParentPlatformID := aRec.ParentPlatformID;
  NetRec.EmbarkPlatformID := aRec.EmbarkPlatformID;
  NetRec.Hosted_Index := aRec.Hosted_Index;
  NetRec.Quantity := aRec.Quantity;
  NetRec.BaseId := aRec.BaseId;
  NetRec.IDPlatformName := aRec.IDPlatformName;
  NetRec.IDPlatformClass := aRec.IDPlatformClass;

  NetRec.nameClass := aRec.nameClass;
  NetRec.namePlatform := aRec.namePlatform;
  NetRec.VBSClassName := aRec.VBSClassName;
  NetRec.LaunchName := aRec.LaunchName;
  NetRec.TrackIdent := aRec.TrackIdent;
//  NetRec.nameClass := TEncoding.ANSI.GetString(aRec.nameClass);
//  NetRec.namePlatform := TEncoding.ANSI.GetString(aRec.namePlatform);
//  NetRec.VBSClassName := TEncoding.ANSI.GetString(aRec.VBSClassName);
//  NetRec.LaunchName := TEncoding.ANSI.GetString(aRec.LaunchName);
//  NetRec.TrackIdent := TEncoding.ANSI.GetString(aRec.TrackIdent);


  NetRec.InitSpeed := aRec.InitSpeed;
  NetRec.InitCourse := aRec.InitCourse;
  NetRec.InitAltitude := aRec.InitAltitude;
  NetRec.InitX := aRec.InitX;
  NetRec.InitY := aRec.InitY;
  NetRec.InitZ := aRec.InitZ;
  NetRec.Quantity_Group_Personal := aRec.Quantity_Group_Personal;
  NetRec.GrpID := aRec.GrpID;
  NetRec.Domain := aRec.Domain;
  NetRec.TurnRate := aRec.TurnRate;
  NetRec.DiveRate := aRec.DiveRate;

  LogMemo.Lines.Add(NetRec.namePlatform);
  LogMemo.Lines.Add(NetRec.nameClass);
  LogMemo.Lines.Add(NetRec.VBSClassName);

  NetSendEmbarkCmd(NetRec);

end;

procedure TMainForm.SendRampControlTo3D(aRec: TRecCmd_RampController);
var
  NetRec: NetRecCmd_RampController;
begin

  NetRec.SessionID := FSessionId;
  NetRec.PlatformID := aRec.PlatformID;
  NetRec.RampID := aRec.RampID;
  NetRec.RampState := aRec.RampState;

  NetSendRampControl(NetRec);

end;

procedure TMainForm.SendGunCmdTo3D(aRec: TRecCmd_GunFire);
var
  NetRec: NetRecCmd_GunFire;
begin
    NetRec.SessionID  := aRec.SessionID;
    NetRec.ParentPlatformID  := aRec.ParentPlatformID;
    NetRec.GunID             := aRec.GunID;
    NetRec.IDPlatformClass   := aRec.IDPlatformClass;
    NetRec.TargetPlatformID  := aRec.TargetPlatformID;
    NetRec.OrderID           := aRec.OrderID;
    NetRec.ControlMode       := aRec.ControlMode;
    NetRec.SalvoMode         := aRec.SalvoMode;
    NetRec.SalvoSize         := aRec.SalvoSize;
    NetRec.GunCapacityRemain := aRec.GunCapacityRemain;
	  NetRec.InterceptRange    := aRec.InterceptRange;
    NetRec.ThresSpeed        := aRec.ThresSpeed;
    NetRec.HitProbability    := aRec.HitProbability;
    NetRec.GunName           := aRec.GunName;
    NetRec.ChaffX            := aRec.ChaffX;
    NetRec.ChaffY            := aRec.ChaffY;
    NetRec.ChaffBloom        := aRec.ChaffBloom;
    NetRec.ChaffType         := aRec.ChaffType;
    NetRec.pX                := aRec.pX;
    NetRec.pY                := aRec.pY;
    NetRec.pXflash           := aRec.pXflash;
    NetRec.pYflash           := aRec.pYflash;
    NetRec.pAltitude         := aRec.pAltitude;
    NetRec.degSpotLine       := aRec.degSpotLine;
    NetRec.degGunLine        := aRec.degGunLine;
    NetRec.NGSCorrMode       := aRec.NGSCorrMode;
    NetRec.NGSRangeCorr      := aRec.NGSRangeCorr;
    NetRec.NGSDefCorr        := aRec.NGSDefCorr;
    NetRec.NGSBearing        := aRec.NGSBearing;
    NetRec.NGSElevation      := aRec.NGSElevation;
    NetRec.VBSAzimuth        := aRec.VBSAzimuth;
    NetRec.VBSElevation      := aRec.VBSElevation;
    NetRec.TurretID          := aRec.TurretID;

  NetSendGunCmd(NetRec);

end;

procedure TMainForm.SendMissileCmdTo3D(aRec: TRecCmd_LaunchMissile);
var
  NetRec: NetRecCmd_LaunchMissile;
begin
    NetRec.SessionID                 := aRec.SessionID;
    NetRec.ParentPlatformID          := aRec.ParentPlatformID;
    NetRec.GroupID                   := aRec.GroupID;
    NetRec.ParentPlatformID          := aRec.ParentPlatformID;
    NetRec.MissileID                 := aRec.MissileID;
    NetRec.TargetPlatformID          := aRec.TargetPlatformID;
    NetRec.ProjectileInstanceIndex   := aRec.ProjectileInstanceIndex;
    NetRec.Order                     := aRec.Order;
    NetRec.LaunchAngle               := aRec.LaunchAngle;
    NetRec.FiringMode                := aRec.FiringMode;
    NetRec.LaunchBearing             := aRec.LaunchBearing;
    NetRec.SeekerRange               := aRec.SeekerRange;
    NetRec.LauncherID                := aRec.LauncherID;
    NetRec.NoCubicle                 := aRec.NoCubicle;
    NetRec.MissileName               := aRec.MissileName;
    NetRec.IsEngagementWeapon        := aRec.IsEngagementWeapon;

  NetSendMissileCmd(NetRec);

end;

procedure TMainForm.SendTorpedoCmdTo3D(aRec: TRecCmd_LaunchMissile);
var
  NetRec: NetRecCmd_LaunchMissile;
begin
    NetRec.SessionID                 := aRec.SessionID;
    NetRec.ParentPlatformID          := aRec.ParentPlatformID;
    NetRec.GroupID                   := aRec.GroupID;
    NetRec.ParentPlatformID          := aRec.ParentPlatformID;
    NetRec.MissileID                 := aRec.MissileID;
    NetRec.TargetPlatformID          := aRec.TargetPlatformID;
    NetRec.ProjectileInstanceIndex   := aRec.ProjectileInstanceIndex;
    NetRec.Order                     := aRec.Order;
    NetRec.LaunchAngle               := aRec.LaunchAngle;
    NetRec.FiringMode                := aRec.FiringMode;
    NetRec.LaunchBearing             := aRec.LaunchBearing;
    NetRec.SeekerRange               := aRec.SeekerRange;
    NetRec.LauncherID                := aRec.LauncherID;
    NetRec.NoCubicle                 := aRec.NoCubicle;
    NetRec.MissileName               := aRec.MissileName;
    NetRec.IsEngagementWeapon        := aRec.IsEngagementWeapon;

  NetSendTorpedoCmd(NetRec);

end;

procedure TMainForm.SendCameraControlTo3D(aRec: TRec_CameraController);
var
  NetRec: NetRec_CameraController;
begin
    NetRec.SessionID                 := aRec.SessionID;
    NetRec.cmd                       := aRec.cmd;
    Netrec.valueInt                  := aRec.valueInt;
    Netrec.valueDbl                  := aRec.valueDbl;

  NetSendCameraControl(NetRec);

end;

procedure TMainForm.SendWaypointDataTo3D(aRec: TRecSync_WaypointDataTo3D);
var
  NetRec: NetRecSync_WaypointDataTo3D;
begin
    NetRec.SessionID                 := aRec.SessionID;
    NetRec.OrderID                   := aRec.OrderID;
    NetRec.PlatformID                := aRec.PlatformID;
    NetRec.WaypointID                := aRec.WaypointID;
    NetRec.Speed                     := aRec.Speed;
    NetRec.PosX                      := aRec.PosX;
    NetRec.PosY                      := aRec.PosY;
    NetRec.Course                    := aRec.Course;
    NetRec.Altitude                  := aRec.Altitude;
    NetRec.Domain                    := aRec.Domain;

  NetSendWaypointData(NetRec);

end;

procedure TMainForm.SendMultiModeTo3D(aRec: TRecCmdMultiModeTo3D);
var
  NetRec: NetRecCmdMultiModeTo3D;
  i: integer;
begin

    for I := 0 to aRec.CountVehicle do
    begin
      NetRec.SessionID                := aRec.SessionID;
      NetRec.CountVehicle             := aRec.CountVehicle;
      NetRec.PlatformID               := aRec.PlatformID[i];
      NetRec.aAction                  := aRec.aAction;
      NetRec.X                        := '';
      NetRec.Y                        := '';
      NetRec.Param                    := aRec.Param;
      NetRec.X3D                      := aRec.X3D[i];
      NetRec.Y3D                      := aRec.Y3D[i];
      NetRec.Speed3D                  := aRec.Speed3D[i][0];

      NetSendMultiMode(NetRec);
    end;
end;

procedure TMainForm.SendNewEmbarkCmdTo3D(aRec: TRecCmd_Transport);
var
  NetRec: NetRecCmd_Transport;
 begin
    NetRec.SessionID                := aRec.SessionID;
    NetRec.OrderID                  := aRec.OrderID;
    NetRec.HostPlatformID           := aRec.HostPlatformID;
    NetRec.MemberPlatformID         := aRec.MemberPlatformID;
    NetRec.MemberPlatformName       := aRec.MemberPlatformName;
    NetRec.MemberPlatform3DName     := aRec.MemberPlatform3DName;
    NetRec.MemberDomain             := aRec.MemberDomain;
    NetRec.BaseIdentifier           := aRec.BaseIdentifier;
    NetRec.TrackID                  := aRec.TrackID;
    NetRec.StateTransport           := aRec.StateTransport;
    NetRec.InitSpeed                := aRec.InitSpeed;
    NetRec.InitCourse               := aRec.InitCourse;
    NetRec.InitAltitude             := aRec.InitAltitude;
    NetRec.TurnRate                 := aRec.TurnRate;
    NetRec.DiveRate                 := aRec.DiveRate;
    NetRec.RampID                   := aRec.RampID;

  NetSendNewEmbarkCmd(NetRec);

end;

procedure TMainForm.SendMineCmdTo3D(aRec: TRecCmd_LaunchMine);
var
  NetRec: NetRecCmd_LaunchMine;
begin
    NetRec.SessionID                := aRec.SessionID;
    NetRec.GroupID                  := aRec.GroupID;
    NetRec.NoCubicle                := aRec.NoCubicle;
    NetRec.ParentPlatformID         := aRec.ParentPlatformID;
    NetRec.MineOnVehicleID          := aRec.MineOnVehicleID;
    NetRec.Depth                    := aRec.Depth;
    NetRec.AvailableQuantity        := aRec.AvailableQuantity;
    NetRec.ProjectileInstanceIndex  := aRec.ProjectileInstanceIndex;
    NetRec.Range                    := aRec.Range;
    NetRec.Count                    := aRec.Count;
    NetRec.NameMineVbs              := aRec.NameMineVbs;

  NetSendMineCmd(NetRec);

end;

procedure TMainForm.SendBombCmdTo3D(aRec: TRecCmd_LaunchBomb);
var
  NetRec: NetRecCmd_LaunchBomb;
begin
    NetRec.SessionID                := aRec.SessionID;
    NetRec.GroupID                  := aRec.GroupID;
    NetRec.NoCubicle                := aRec.NoCubicle;
    NetRec.ParentPlatformID         := aRec.ParentPlatformID;
    NetRec.TargetPlatformID         := aRec.TargetPlatformID;
    NetRec.BombOnVehicleID          := aRec.BombOnVehicleID;
    NetRec.SalvoSize                := aRec.SalvoSize;
    NetRec.AvailableQuantity        := aRec.AvailableQuantity;
    NetRec.ProjectileInstanceIndex  := aRec.ProjectileInstanceIndex;
    NetRec.BombType                 := aRec.BombType;
    NetRec.NameBombVbs              := aRec.NameBombVbs;
    NetRec.TargetPosX               := aRec.TargetPosX;
    NetRec.TargetPosY               := aRec.TargetPosY;

  NetSendBombCmd(NetRec);

end;

procedure TMainForm.SendLogisticStateTo3D(aRec: TRecCmd_State_Logistic);
var
  NetRec: NetRecCmd_State_Logistic;
begin
    NetRec.SessionID        := aRec.SessionID;
    NetRec.PlatfomID        := aRec.PlatfomID;
    NetRec.DestinationID    := aRec.DestinationID;
    NetRec.ActionID         := aRec.ActionID;
    NetRec.StateID          := aRec.StateID;
    NetRec.HoseID           := aRec.HoseID;

    NetSendLogisticState(NetRec);
end;

procedure TMainForm.SendLogisticChangeTo3D(aRec: TRecCmd_Change_Logistic);
var
  NetRec: NetRecCmd_State_Logistic;
begin
    NetRec.SessionID        := aRec.SessionID;
    NetRec.PlatfomID        := aRec.PlatfomID;
    NetRec.DestinationID    := aRec.DestinationID;
    NetRec.ActionID         := aRec.ModeTransferID;
    NetRec.StateID          := aRec.StateID;
    NetRec.HoseID           := aRec.HoseID;

    NetSendLogisticState(NetRec);
end;

procedure TMainForm.SendEnviCmdTo3D(aRec: TrecSinc_Envi);
var
  NetRec: NetRecSinc_Envi;
begin
    NetRec.SessionID      := aRec.SessionID;
    NetRec.Sub_EnviID     := aRec.Sub_EnviID;
    NetRec.Envi_Type      := aRec.Envi_Type;
    NetRec.Envi_Chance    := aRec.Envi_Chance;
    NetRec.Value          := aRec.Value;

    NetSendEnviCmd(NetRec);
end;

procedure TMainForm.SendGameControlTo3D(aRec: TRecCmd_GameCtrl);
var
  NetRec: NetRecCmd_GameCtrl;
begin
    NetRec.SessionID      := aRec.SessionID;
    NetRec.GameCtrl       := aRec.GameCtrl;
    NetRec.GameSpeed      := aRec.GameSpeed;
    NetSendGameControlCmd(NetRec);
end;

procedure TMainForm.SendSessionStateTo3D(aRec: TRecSessionState);
var
  NetRec: NetRecSessionState;
begin
    NetRec.SessionID      := aRec.SessionID;
    NetRec.ScenarioID     := aRec.ScenarioID;
    NetRec.SessionStat    := aRec.SessionStat;
    NetRec.SessionType    := aRec.SessionType;
    NetRec.Order          := aRec.Order;
    NetRec.GPMType        := aRec.GPMType;
    NetSendSessionState(NetRec);
end;

procedure TMainForm.SendSonarDeployTo3D(aRec: TRecCmd_SonarDeploy);
var
  NetRec: NetRecCmd_SonarDeploy;
begin
    NetRec.SessionID      := aRec.SessionID;
    NetRec.PlatformID     := aRec.PlatformID;
    NetRec.SensorID       := aRec.SensorID;
    NetRec.TimeToActive   := aRec.TimeToActive;
    NetRec.Param          := aRec.Param;
    NetRec.ActualCable    := aRec.ActualCable;
    NetRec.OrderCable     := aRec.OrderCable;

    NetSendSonarDeploy(NetRec);
end;

procedure TMainForm.Send3dReadyToGetNextObjectFromSimServer;
var
  r: TRec_AOTC_Data_Initialize;
begin
  r.OrderID := CORD_ID_REQ_NEXT_DATA;
  SendRecAotcData(CPID_REC_AOTC_DATA, @r);
end;

//
//
procedure TMainForm.SendTCPRequest(const aID: Word; aBuffer: PAnsiChar);
begin
  FAOTC_SIMSVR_3D_CLIENT.SendData(aID, aBuffer);
end;

procedure TMainForm.SendRecAotcData(const aID: Word; aBuffer: PAnsiChar);
begin
  FAOTC_SIMSVR_3D_CLIENT.SendData(aID, aBuffer);
end;

procedure TMainForm.SendSyncPos3D(const aID: Word; aBuffer: PAnsiChar);
begin
  FAOTC_SIMSVR_3D_CLIENT.SendData(aID, aBuffer);
end;

procedure TMainForm.SendPauseToAOTC(const aID: Word; aBuffer: PAnsiChar);
begin
  FAOTC_SIMSVR_3D_CLIENT.SendData(aID, aBuffer);
end;

{$ENDREGION}

{$REGION 'MESSAGE SENDERS TO 3D CLIENT'}

procedure TMainForm.SendPlatformCmd(aRec: TRecCmd_Platform);
var
  NetRec: NetRec_Cmd_Platform;
begin

  NetRec.SessionID := FSessionId;
  NetRec.PlatfomID := aRec.PlatfomID;
  NetRec.TurnRate := aRec.TurnRate;
  NetRec.OrderID := aRec.OrderID;
  NetRec.OrderType := aRec.OrderType;
  NetRec.OrderParam := aRec.OrderParam;
  NetRec.IDPlatformClass := aRec.IDPlatformClass;
  NetRec.VDomain := aRec.VDomain;
  NetRec.DiveMode := aRec.DiveMode;
  NetRec.quickFormation := aRec.quickFormation;

  NetSend_PlatformCmd(NetRec);

end;

procedure TMainForm.SendRemovePlatform(aRec: TRecCmd_SelectPlatformToRemove);
var
  NetRec: NetRec_Cmd_SelectPlatformToRemove;
begin
  NetRec.SessionID := FSessionId;
  NetRec.PlatfomID := aRec.PlatfomID;
  NetRec.isNRPlatform := aRec.isNRPlatform;
  NetRec.IdAction := aRec.IdAction;

  NetSend_RemovePlatform(NetRec);
end;

procedure TMainForm.SendPlatformInitObjData(aRec: TRec_AOTC_Data_Initialize;
  Net_Ord_ID: Byte);
var
  NetRec: NetRec_AOTC_Data_Initialize;
begin
  NetRec.SessionId := FSessionId;
  NetRec.OrderID := Net_Ord_ID;
  NetRec.PlatformID := aRec.PlatformID;
  NetRec.IDPlatformName := aRec.IDPlatformName;
  NetRec.IDPlatformClass := aRec.IDPlatformClass;
  NetRec.nameClass := AnsiCharArrayToString(aRec.nameClass);
  NetRec.namePlatform := AnsiCharArrayToString(aRec.namePlatform);
  NetRec.ClassName3D := AnsiCharArrayToString(aRec.VBSClassName);
  NetRec.TurnRate := aRec.TurnRate;
  NetRec.DiveRate := aRec.DiveRate;
  NetRec.Heading := aRec.Course;
  NetRec.Speed := aRec.Speed;
  NetRec.Altitude := aRec.Altitude;
  NetRec.PosX := aRec.PosX;
  NetRec.PosY := aRec.PosY;
  NetRec.PosZ := aRec.PosZ;
  NetRec.FreeMe := aRec.FreeMe;
  NetRec.PlatformDomain := aRec.PlatformDomain;
  NetRec.OveralDamage := aRec.OveralDamage;
  NetRec.HealthPercent := aRec.HealthPercent;
  NetRec.ForceDesignation := aRec.ForceDesignation;

  NetSend_ObjInit(NetRec);

end;

procedure TMainForm.SendPlatformRepositionTo3D(aRec: TRecCmd_Platform_MOVE);
var
  NetRec: Net_RecCmd_Platform_MOVE;
begin
  NetRec.SessionID := FSessionId;
  NetRec.PlatfomID := aRec.PlatfomID;
  NetRec.IDPlatformName := aRec.IDPlatformName;
  NetRec.IDPlatformClass := aRec.IDPlatformClass;
  NetRec.OrderID := aRec.OrderID;
  NetRec.X := aRec.X;
  NetRec.Y := aRec.Y;
  NetRec.Z := aRec.Z;
  NetRec.GroupID := aRec.GroupID;

  NetSend_PlatformRepositionTo3D(NetRec);
end;

procedure TMainForm.SendGameTimeUpdate3D(aRec: TRec_GameTime);
var
  NetRec: NetRec_GameTime;
begin
  NetRec.SessionId := FSessionId;
  NetRec.OrderID := aRec.OrderID;
  NetRec.GameYear := aRec.GameYear;
  NetRec.GameMonth := aRec.GameMonth;
  NetRec.GameDay := aRec.GameDay;
  NetRec.Gamehour := aRec.Gamehour;
  NetRec.GameMinute := aRec.GameMinute;
  NetRec.GameSecond := aRec.GameSecond;

  NetSend_GameTimeUpdate(NetRec);
end;


procedure TMainForm.SendLaunchPlatform(aRec: TRecCmd_LaunchRP);
var
  NetRec: NetRec_Cmd_LaunchRP;
begin
  NetRec.SessionID := FSessionId;
  NetRec.OrderID := aRec.OrderID;
  NetRec.OrderType := aRec.OrderType;
  NetRec.MaxRowIndex := aRec.MaxRowIndex;
  NetRec.MaxColumnIndex := aRec.MaxColumnIndex;
  NetRec.RPPlatformID := aRec.RPPlatformID;
  NetRec.NewPlatformID := aRec.NewPlatformID;
  NetRec.RPGroupID := aRec.RPGroupID;
  NetRec.ForceDesignation := aRec.ForceDesignation;
  NetRec.IDPlatformName := aRec.IDPlatformName;
  NetRec.IDPlatformClass := aRec.IDPlatformClass;
  NetRec.nameClass := AnsiCharArrayToString(aRec.nameClass);
  NetRec.namePlatform := AnsiCharArrayToString(aRec.namePlatform);
  NetRec.ClassName3D := AnsiCharArrayToString(aRec.VBSClassName);
  NetRec.InstanceName := AnsiCharArrayToString(aRec.InstanceName);
  NetRec.TrackIdent := AnsiCharArrayToString(aRec.TrackIdent);
  NetRec.domain := aRec.domain;
  NetRec.pX := aRec.pX;
  NetRec.pY := aRec.pY;
  NetRec.pZ := aRec.pZ;
  NetRec.PHeading := aRec.PHeading;
  NetRec.PSpeed := aRec.PSpeed;
  NetRec.PAltitude := aRec.PAltitude;
  NetRec.Quantity_Group_Personal := aRec.Quantity_Group_Personal;
  NetRec.TurnRate := aRec.TurnRate;
  NetRec.DiveRate := aRec.DiveRate;

  NetSend_LaunchPlatform(NetRec);
end;

procedure TMainForm.NetSend_3DInit(SessionID: integer);
var
  r2: NetRecData3D;
begin
  r2.SessionId:= SessionID;
  r2.SoftwareType:= 'AOTC';
  r2.OrderId:= CORD_ID_3D_HANDSHAKE;
  F3D_SERVER.SendData(CPID_3D_INFO, r2)
end;

procedure TMainForm.NetSendRampControl(NetRec: NetRecCmd_RampController);
begin
  F3D_SERVER.SendData(CPID_CMD_RAMP_3D, NetRec);
end;

procedure TMainForm.NetSendGunCmd(NetRec: NetRecCmd_GunFire);
begin
  F3D_SERVER.SendData(CPID_CMD_GUN_FIRE_3D, NetRec);
end;

procedure TMainForm.NetSendMissileCmd(NetRec: NetRecCmd_LaunchMissile);
begin
  F3D_SERVER.SendData(CPID_CMD_LAUNCH_MISSILE_3D, NetRec);
end;

procedure TMainForm.NetSendTorpedoCmd(NetRec: NetRecCmd_LaunchMissile);
begin
  F3D_SERVER.SendData(CPID_CMD_LAUNCH_TORPEDO_3D, NetRec);
end;

procedure TMainForm.NetSendCameraControl(NetRec: NetRec_CameraController);
begin
  F3D_SERVER.SendData(CPID_CMD_CAMERA_CONTROLLER_3D, NetRec);
end;

procedure TMainForm.NetSendWaypointData(NetRec: NetRecSync_WaypointDataTo3D);
begin
  F3D_SERVER.SendData(CPID_CMD_SYNC_WAYPOINTDATATO3D_3D, NetRec);
end;

procedure TMainForm.NetSendMultiMode(NetRec: NetRecCmdMultiModeTo3D);
begin
  F3D_SERVER.SendData(CPID_CMD_MULTI_MODE_TO3D_3D, NetRec);
end;

procedure TMainForm.NetSendNewEmbarkCmd(NetRec: NetRecCmd_Transport);
begin
  F3D_SERVER.SendData(CPID_CMD_TRANSPORT_3D, NetRec);
end;

procedure TMainForm.NetSendMineCmd(NetRec: NetRecCmd_LaunchMine);
begin
  F3D_SERVER.SendData(CPID_CMD_LAUNCH_MINES_3D, NetRec);
end;

procedure TMainForm.NetSendBombCmd(NetRec: NetRecCmd_LaunchBomb);
begin
  F3D_SERVER.SendData(CPID_CMD_LAUNCH_BOMB_3D, NetRec);
end;

procedure TMainForm.NetSendLogisticState(NetRec: NetRecCmd_State_Logistic);
begin
  F3D_SERVER.SendData(CPID_CMD_LOGISTIC_STATUS_3D, NetRec);
end;

procedure TMainForm.NetSendEnviCmd(NetRec: NetRecSinc_Envi);
begin
  F3D_SERVER.SendData(CPID_CMD_ENVI_3D, NetRec);
end;

procedure TMainForm.NetSendGameControlCmd(NetRec: NetRecCmd_GameCtrl);
begin
  F3D_SERVER.SendData(CPID_CMD_GAME_CTRL_3D, NetRec);
end;

procedure TMainForm.NetSendSessionState(NetRec: NetRecSessionState);
begin
  F3D_SERVER.SendData(CPID_SESSIONSTATE_3D, NetRec);
end;

procedure TMainForm.NetSendSonarDeploy(NetRec: NetRecCmd_SonarDeploy);
begin
  F3D_SERVER.SendData(CPID_CMD_SONAR_DEPLOY_3D, NetRec);
end;

procedure TMainForm.NetSend_ObjInit(NetRec: NetRec_AOTC_Data_Initialize);
begin
  F3D_SERVER.SendData(CPID_3D_DATA_UPDATE, NetRec);
end;

procedure TMainForm.NetSend_PlatformCmd(NetRec: NetRec_Cmd_Platform);
begin
  F3D_SERVER.SendData(CPID_CMD_PLATFORM3D, NetRec);
end;

procedure TMainForm.NetSend_RemovePlatform(
  NetRec: NetRec_Cmd_SelectPlatformToRemove);
begin
  F3D_SERVER.SendData(CPID_CMD_REMOVE_PLATFORM3D, NetRec);
end;

procedure TMainForm.NetSend_GameTimeUpdate(NetRec: NetRec_GameTime);
begin
  F3D_SERVER.SendData(CPID_GAME_TIME_UPDATE_3D, NetRec);
end;

procedure TMainForm.NetSend_LaunchPlatform(NetRec: NetRec_Cmd_LaunchRP);
begin
  F3D_SERVER.SendData(CPID_CMD_LAUNCH_RUNTIME_PLATFORM3D, NetRec);
end;


procedure TMainForm.NetSendEmbarkCmd(NetRec: NetRecCmd_Embark);
begin
  F3D_SERVER.SendData(CPID_CMD_EMBARK, NetRec);
//  LogMemo.Lines.Add(NetRec);
end;


//UDP

procedure TMainForm.NetSend_PlatformRepositionTo3D(NetRec: Net_RecCmd_Platform_MOVE);
begin
  F3D_SERVER.SendData(CPID_CMD_PLATFORM_REPOSITION, NetRec);
end;

{$ENDREGION}

{$REGION 'UI Region'}

procedure TMainForm.imgCloseClick(Sender: TObject);
begin
//    Screen.Forms[1].Visible := True;
  Close;
end;

{$ENDREGION}
end.
