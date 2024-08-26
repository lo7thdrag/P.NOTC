unit uScriptSimClients;


interface

  procedure BeginGame;
  procedure EndGame;

implementation

uses
   uScriptCommon,
   SysUtils, Controls, Forms,
   uLibSettingTTT, uSimMgr_Client,
   uNetHandle_Client, uNetVoipCtrl_Server,
   uMapXHandler,
   ufTacticalDisplay, uCoordConvertor, ufToteDisplay,
   uT3Listener, uGameSetting, ufLog, uSRRFunction, uFilter, uSlidingTrans;


procedure BeginGame;
begin
  BeginGameCommon;

  if vMapSetting.FullScreen then
    frmTacticalDisplay.Be_A_FullMap(true);

  if vMapSetting.ActiveDoubleBufferd then
    frmTacticalDisplay.Set_DoubleBufferd(True);

  LoadFF_NetClientSetting(vSettingFile, vNetClientSetting);
  LoadFF_CubicalAssignSetting(vSettingFile, vCubicalAssignSetting);
  LoadFF_AppSetting(vSettingFile, vAppSetting);
  LoadFF_TerrainArea(vSettingFile, vTerrainArea);

  vFilter := TFilter.Create;
  simMgrClient := TSimMgr_Client.Create(frmTacticalDisplay.Map1);

  {Set Console Role berdasarkan IP}
  simMgrClient.ApplyCubicleSetting;

  simMgrClient.OnMapViewChange  := frmTacticalDisplay.MapViewChanged;

  if simMgrClient.ISWasdal then
    frmTacticalDisplay.pnlTop.Height := 45;

  VSimMap := TSimMap.Create(frmTacticalDisplay.Map1);

  {karvak}
  VSimMap.LoadDataMap(vMapSetting.MapKarvak);
//  frmTacticalDisplay.CreatSimMapX;

  VSimMap.OnDrawToCanvas  := simMgrClient.DrawAll;

  VSimMap.OnMapChange     := simMgrClient.OnMapChange;
  VSimMap.OnToolUsed      := frmTacticalDisplay.MapToolUsed;
  VSimMap.OnMapMouseMove  := frmTacticalDisplay.MapMouseMove;
  VSimMap.OnMapMouseDown  := frmTacticalDisplay.MapMouseDown;
  VSimMap.OnMapMouseUp    := frmTacticalDisplay.MapMouseUp;
  VSimMap.OnMapMouseDouble := frmTacticalDisplay.MapMouseDouble;
  VSimMap.OnMapMouseSingle := frmTacticalDisplay.MapMouseSingle;
  VSimMap.OnKeyDown      := frmTacticalDisplay.MapKeyDown;
  VSimMap.OnMapMouseExit := frmTacticalDisplay.MapMouseExit;
  VSimMap.OnLogTemporary  := frmLog.LogTemporary;

  simMgrClient.Scenario.OnGetExternalCom := frmToteDisplay.ObjectCommunicationCreate;
  simMgrClient.SessionID := vGameDataSetting.GameSessionID;

  try
    simMgrClient.EventManager.OnLogEventStr := frmLog.LogStr;
    simMgrClient.OnLogEventStr  :=  frmLog.NetworkEventLogs;
    simMgrClient.OnLogStr       :=  frmLog.LogStr;
    simMgrClient.OnLogTemporary :=  frmLog.LogTemporary;
  finally

  end;

//  simMgrClient.LoadFromSnapshot := True;
//  simMgrClient.SnapshotLoadFile('SN-10211-TES');

  if UseSnapshot(vGameDataSetting) then
  begin
    simMgrClient.LoadFromSnapshot := True;
    simMgrClient.SnapshotLoadFile(vGameDataSetting.SnapshotName);
  end
  else
  begin
    simMgrClient.LoadFromSnapshot := False;
    simMgrClient.LoadScenarioId(vGameDataSetting);
  end;

  //tambahan aldy environment
  simMgrClient.SensorSetEnvi;
  simMgrClient.VehicleSetEnvi;
  simMgrClient.DeviceSetEnvi;

  simMgrClient.OnUpdateForm    := frmTacticalDisplay.UpdateFormData;
  simMgrClient.OnUpdateTime    := frmTacticalDisplay.UpdateGameTime;
  simMgrClient.OnUpdateCenter  := frmTacticalDisplay.UpdateCenter;
  simMgrClient.OnUpdateMessage := frmToteDisplay.UpdateMessageHandling;

  frmTacticalDisplay.Initialize;
  frmTacticalDisplay.SetRoleClient(simMgrClient.ClientRole);


  frmToteDisplay.Initialize;
  frmToteDisplay.setRoleClient(simMgrClient.ClientRole);

  with frmToteDisplay do
  begin
    if CategoryPanelStatusOp.Enabled then
      btnPlatformStatusClick(frmToteDisplay)
    else
      btnPlatformStatusClick(frmToteDisplay);
  end;

  VNetClient                  := TNetHandler_Client.Create;
  VNetClient.GamePort         := vNetSetting.GamePort;
  VNetClient.CommandPort      := vNetSetting.CommandPort;
  VNetClient.VBSPort          := vNetSetting.VBSPort;
  VNetClient.BroadCastAddress := vNetSetting.GameAddress;
  VNetClient.ServerIP         := vNetClientSetting.ServerIP;

  VNetClient.StartNetworking;
//  VNetClient.OnReceivedLog := simMgrClient.LogNetworkEvent;
  VNetClient.OnReceivedLog := frmLog.LogNetworkEvent;
  VNetClient.OnConnected := simMgrClient.netOnConnected;
  VNetClient.OnConnectedVBS := simMgrClient.netVBSOnConnected;
  VNetClient.OnDisConnected := simMgrClient.netVBSOnDisConnected;
  VNetClient.OnLogRecv        := frmLog.LogDataBuffer;
  VNetClient.OnFinishBuffer := frmLog.FinishBuffer;

  VNetVoipCtrlServer              :=  TNetVoipCtrl_Server.Create;
  VNetVoipCtrlServer.VoipCtrlPort := vNetSetting.VoipCtrlPort;

  VSlidingTrans := TSlidingTrans.create;

  simMgrClient.InitNetwork;
  simMgrClient.GameStart;
  //bebe
  simMgrClient.LoadPredefinedPattern;

  simMgrClient.isFirstDraw := True;

  if vMapSetting.FormViewer then
  begin
    if Assigned(simMgrClient.ControlledPlatform) then
    simMgrClient.ControlledPlatform.Controlled := False;
  end
  else
  begin
    if Assigned(simMgrClient.ControlledPlatform) then
    simMgrClient.ControlledPlatform.Controlled := true;
  end;
end;

procedure EndGame;
begin
  VSlidingTrans.Free;

  simMgrClient.GamePause;

  VNetClient.StopNetworking;
  VNetClient.Free;

  VNetVoipCtrlServer.StopNetworking;
  VNetVoipCtrlServer.Free;

  simMgrClient.Free;

  VSimMap.Free;
  vFilter.Free
end;



end.


