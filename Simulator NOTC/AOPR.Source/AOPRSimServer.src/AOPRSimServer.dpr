program AOPRSimServer;

{$DEFINE SERVER}

uses
  Windows,
  Messages,
  Forms,
  SysUtils,
  ShellApi,
  GmXml in '..\SimFramework\LibComponent\XMLReader\GmXml.pas',
  GmXMLInterface in '..\SimFramework\LibComponent\XMLReader\GmXMLInterface.pas',
  uThreadTimer in '..\SimFramework\LibBaseUtils\Counter\uThreadTimer.pas',
  uIniFilesProcs in '..\SimFramework\LibBaseUtils\uIniFilesProcs.pas',
  uBaseCoordSystem in '..\SimFramework\LibBaseUtils\CoordSystem\uBaseCoordSystem.pas',
  uCoordConvertor in '..\SimFramework\LibBaseUtils\CoordSystem\uCoordConvertor.pas',
  uDataTypes in '..\SimFramework\LibBaseUtils\CoordSystem\uDataTypes.pas',
  uStringFunc in '..\SimFramework\LibBaseUtils\StringUtils\uStringFunc.pas',
  uCodecBase64 in '..\SimFramework\LibBaseUtils\StringUtils\uCodecBase64.pas',
  uVirtualTime in '..\SimFramework\LibBaseUtils\Counter\uVirtualTime.pas',
  uSteppers in '..\SimFramework\LibBaseUtils\Counter\uSteppers.pas',
  uBaseSimObjects in '..\SimFramework\LibSims\SimSystem\uBaseSimObjects.pas',
  uSimContainers in '..\SimFramework\LibSims\SimSystem\uSimContainers.pas',
  uSimSettings in '..\SimFramework\LibSims\SimSystem\uSimSettings.pas',
  u2DMover in '..\SimFramework\LibSims\SimsObjects\u2DMover.pas',
  uSimObjects in '..\SimFramework\LibSims\SimSystem\uSimObjects.pas',
  uBaseSimCenter in '..\SimFramework\LibSims\SimSystem\uBaseSimCenter.pas',
  uPacketBuffer in '..\SimFramework\LibNets\NetComponent\uPacketBuffer.pas',
  uPacketRegister in '..\SimFramework\LibNets\NetComponent\uPacketRegister.pas',
  uTCPDatatype in '..\SimFramework\LibNets\NetComponent\uTCPDatatype.pas',
  uTCPClient in '..\SimFramework\LibNets\NetComponent\uTCPClient.pas',
  uTCPServer in '..\SimFramework\LibNets\NetComponent\uTCPServer.pas',
  uNetUDPnode in '..\SimFramework\LibNets\NetComponent\uNetUDPnode.pas',
  uNetHandle_Server in 'uNetHandle_Server.pas',
  uGameData_TTT in '..\LibTTT\netTTT\uGameData_TTT.pas',
  uLibSettingTTT in '..\LibTTT\uLibSettingTTT.pas',
  uSimVisuals in '..\LibTTT\LibVisual\uSimVisuals.pas',
  uCompassVisual in '..\LibTTT\LibVisual\uCompassVisual.pas',
  uSimManager in '..\LibTTT\uSimManager.pas',
  uT3SimManager in '..\LibTTT\uT3SimManager.pas',
  uSimMgr_Server in 'uSimMgr_Server.pas',
  ufMainGServer in 'ufMainGServer.pas' {fMainGServer},
  newClassASTT in '..\LibTTT\libDBScenario\newClassASTT.pas',
  tttData in '..\LibTTT\libDBScenario\tttData.pas',
  uObjectVisuals in '..\LibTTT\LibVisual\uObjectVisuals.pas',
  uDBScenario in '..\LibTTT\libDBScenario\uDBScenario.pas',
  uDBAssetObject in '..\LibTTT\libDBScenario\uDBAssetObject.pas',
  uDBAsset_Vehicle in '..\LibTTT\libDBScenario\uDBAsset_Vehicle.pas',
  uMapXHandler in '..\LibTTT\uMapXHandler.pas',
  uDBAsset_Sonar in '..\LibTTT\libDBScenario\uDBAsset_Sonar.pas',
  uDBAsset_Weapon in '..\LibTTT\libDBScenario\uDBAsset_Weapon.pas',
  uDBAsset_Countermeasure in '..\LibTTT\libDBScenario\uDBAsset_Countermeasure.pas',
  uDBAsset_GameEnvironment in '..\LibTTT\libDBScenario\uDBAsset_GameEnvironment.pas',
  uDBAsset_Scripted in '..\LibTTT\libDBScenario\uDBAsset_Scripted.pas',
  uDBAsset_Sensor in '..\LibTTT\libDBScenario\uDBAsset_Sensor.pas',
  uDBGame_Defaults in '..\LibTTT\libDBScenario\uDBGame_Defaults.pas',
  uDBAsset_Radar in '..\LibTTT\libDBScenario\uDBAsset_Radar.pas',
  uDBRainfall in '..\LibTTT\libDBScenario\uDBRainfall.pas',
  uDBCloud_Effect in '..\LibTTT\libDBScenario\uDBCloud_Effect.pas',
  uDBAsset_Satellite in '..\LibTTT\libDBScenario\uDBAsset_Satellite.pas',
  uDBDefault_Var in '..\LibTTT\libDBScenario\uDBDefault_Var.pas',
  uDBAsset_Fitted in '..\LibTTT\libDBScenario\uDBAsset_Fitted.pas',
  uDBBlind_Zone in '..\LibTTT\libDBScenario\uDBBlind_Zone.pas',
  uDBPattern in '..\LibTTT\libDBScenario\uDBPattern.pas',
  uDBAsset_Deploy in '..\LibTTT\libDBScenario\uDBAsset_Deploy.pas',
  uDBFormation in '..\LibTTT\libDBScenario\uDBFormation.pas',
  uDBNote_Storage in '..\LibTTT\libDBScenario\uDBNote_Storage.pas',
  uDBAsset_Bomb in '..\LibTTT\libDBScenario\uDBAsset_Bomb.pas',
  uDBAsset_Gun in '..\LibTTT\libDBScenario\uDBAsset_Gun.pas',
  uDBAsset_Cubicle in '..\LibTTT\libDBScenario\uDBAsset_Cubicle.pas',
  uDBAsset_Sonobuoy in '..\LibTTT\libDBScenario\uDBAsset_Sonobuoy.pas',
  uDBLink in '..\LibTTT\libDBScenario\uDBLink.pas',
  uDBAsset_Geo in '..\LibTTT\libDBScenario\uDBAsset_Geo.pas',
  uPictureCentreControl in '..\LibTTT\forms\uPictureCentreControl.pas' {fPictureCentreSettings},
  uNetHandle_TTT in '..\LibTTT\netTTT\uNetHandle_TTT.pas',
  uDataModuleTTT in '..\LibTTT\forms\uDataModuleTTT.pas' {dmTTT: TDataModule},
  ufDBSetting in '..\LibTTT\forms\ufDBSetting.pas' {frmDBSetting},
  ufDebugNet in '..\LibDebug\ufDebugNet.pas' {frmDebug},
  uDBAsset_MotionCharacteristics in '..\LibTTT\libDBScenario\uDBAsset_MotionCharacteristics.pas',
  uNetBaseSocket in '..\SimFramework\LibNets\NetComponent\uNetBaseSocket.pas',
  uBaseNetHandler in '..\SimFramework\LibNets\uBaseNetHandler.pas',
  uWaypoint in '..\LibTTT\libObjects\uWaypoint.pas',
  uDBAssets_SubAreaEnviroDefinition in '..\LibTTT\libDBScenario\uDBAssets_SubAreaEnviroDefinition.pas',
  uScriptCommon in '..\LibTTT\uScriptCommon.pas',
  uScriptSimServer in 'uScriptSimServer.pas' {$R *.res},
  ufProgress in '..\LibTTT\forms\ufProgress.pas' {frmProgress},
  uT3GroupList in '..\LibTTT\libNetSession\uT3GroupList.pas',
  uDBAsset_Runtime_Platform_Library in '..\LibTTT\libDBScenario\uDBAsset_Runtime_Platform_Library.pas',
  uMapXData in '..\LibTTT\uMapXData.pas',
  uT3Bomb in '..\LibTTT\libUnit\uT3Bomb.pas',
  uT3DetectedTrack in '..\LibTTT\libUnit\uT3DetectedTrack.pas',
  uT3Gun in '..\LibTTT\libUnit\uT3Gun.pas',
  uT3Mine in '..\LibTTT\libUnit\uT3Mine.pas',
  uT3Missile in '..\LibTTT\libUnit\uT3Missile.pas',
  uT3OtherSensor in '..\LibTTT\libUnit\uT3OtherSensor.pas',
  uT3Radar in '..\LibTTT\libUnit\uT3Radar.pas',
  uT3Sensor in '..\LibTTT\libUnit\uT3Sensor.pas',
  uT3Sonar in '..\LibTTT\libUnit\uT3Sonar.pas',
  uT3Torpedo in '..\LibTTT\libUnit\uT3Torpedo.pas',
  uT3Unit in '..\LibTTT\libUnit\uT3Unit.pas',
  uT3UnitContainer in '..\LibTTT\libUnit\uT3UnitContainer.pas',
  uT3Vehicle in '..\LibTTT\libUnit\uT3Vehicle.pas',
  uT3Visual in '..\LibTTT\libUnit\uT3Visual.pas',
  uT3Weapon in '..\LibTTT\libUnit\uT3Weapon.pas',
  uT3EventManager in '..\LibTTT\uT3EventManager.pas',
  uT3Common in '..\LibTTT\uT3Common.pas',
  uDBCubicles in '..\LibTTT\libDBScenario\uDBCubicles.pas',
  uT3ServerEventManager in 'LibServer\uT3ServerEventManager.pas',
  uT3CounterMeasure in '..\LibTTT\libUnit\uT3CounterMeasure.pas',
  uNetSessionData in '..\LibTTT\libNetSession\uNetSessionData.pas',
  uT3Listener in '..\LibTTT\libUnit\uT3Listener.pas',
  uGameSetting in '..\LibTTT\uGameSetting.pas',
  uWeaponWaypoint in '..\LibTTT\libObjects\uWeaponWaypoint.pas',
  uT3DataLink in '..\LibTTT\libUnit\uT3DataLink.pas',
  uCalculationEnvi in '..\LibTTT\uCalculationEnvi.pas',
  uFormUtil in '..\LibTTT\uFormUtil.pas',
  uDBAsset_Reference_Point in '..\LibTTT\libDBScenario\uDBAsset_Reference_Point.pas',
  uT3SonarCD in '..\LibTTT\libUnit\uT3SonarCD.pas',
  uT3MissileDetail in '..\LibTTT\libUnit\uT3MissileDetail.pas',
  uT3MissileEnvironment in '..\LibTTT\libUnit\uT3MissileEnvironment.pas',
  uDynamicOverlay in '..\LibTTT\libObjects\uDynamicOverlay.pas',
  uExecuter in '..\SimFramework\LibComponent\Executor\uExecuter.pas',
  uT3Sonobuoy in '..\LibTTT\libUnit\uT3Sonobuoy.pas',
  uT3DefensiveJammer in '..\LibTTT\libUnit\uT3DefensiveJammer.pas',
  uT3HybridOnVehicle in '..\LibTTT\libUnit\uT3HybridOnVehicle.pas',
  uT3HybridMissile in '..\LibTTT\libUnit\uT3HybridMissile.pas',
  uT3DatalinkManager in '..\LibTTT\libUnit\uT3DatalinkManager.pas',
  uDataBuffer in '..\SimFramework\LibNets\NetComponent\uDataBuffer.pas',
  uT3RadarNoiseJammer in '..\LibTTT\libUnit\uT3RadarNoiseJammer.pas',
  uT3DogBox in '..\LibTTT\libUnit\uT3DogBox.pas',
  uFormationManager in '..\LibTTT\uFormationManager.pas',
  uFilter in '..\LibTTT\libVisual\uFilter.pas',
  uTMapTouch2 in '..\LibTTT\uTMapTouch2.pas',
  uDBAsset_Logistic in '..\LibTTT\libDBScenario\uDBAsset_Logistic.pas',
  uVectorVisual in '..\LibTTT\libVisual\uVectorVisual.pas',
  uRecord in '..\AOPRDBEditor.src\uRecord.pas',
  uCommonLogReplay in '..\AOPRReplay\uCommonLogReplay.pas',
  uGamePlayType in '..\AOPRReplay\uGamePlayType.pas',
  uNewLog in '..\AOPRReplay\uNewLog.pas',
  uNewReplay in '..\AOPRReplay\uNewReplay.pas',
  uRecorder in '..\AOPRReplay\uRecorder.pas',
  uSnapshotData in '..\AOPRReplay\uSnapshotData.pas',
  uSnapshotRec in '..\AOPRReplay\uSnapshotRec.pas',
  uSnapshotUtils in '..\AOPRReplay\uSnapshotUtils.pas',
  uSRRFunction in '..\AOPRReplay\uSRRFunction.pas',
  uDBAsset_Embark_Library in '..\LibTTT\libDBScenario\uDBAsset_Embark_Library.pas',
  U_Helper in '..\LibTTT\U_Helper.pas',
  uEventSummary in '..\AOPRDBEditor.src\uEventSummary.pas',
  uDBAsset_FontTaktis in '..\LibTTT\libDBScenario\uDBAsset_FontTaktis.pas',
  uPlottingRecord in '..\AOPRDBEditor.src\uPlottingRecord.pas',
  uMapLayerDB in '..\AOPRSupportMap\uMapLayerDB.pas',
  uDBAsset_Capability in '..\LibTTT\libDBScenario\uDBAsset_Capability.pas',
  uT3GroupVehicle in '..\LibTTT\libUnit\uT3GroupVehicle.pas',
  GDIPAPI in '..\LibTTT\libGDIP\GDIPAPI.pas',
  GdiPlus in '..\LibTTT\libGDIP\GdiPlus.pas',
  GdiPlusHelpers in '..\LibTTT\libGDIP\GdiPlusHelpers.pas',
  GDIPOBJ in '..\LibTTT\libGDIP\GDIPOBJ.pas',
  WbemScripting_TLB in '..\LibTTT\WbemScripting_TLB.pas',
  uBaseShape in '..\LibTTT\libObjects\uBaseShape.pas',
  uBrigadePersonel in '..\LibTTT\libObjects\uBrigadePersonel.pas',
  uDrawLogisticTemplate in '..\LibTTT\libObjects\uDrawLogisticTemplate.pas',
  uDrawOverlay in '..\LibTTT\libObjects\uDrawOverlay.pas',
  uDrawStrategi in '..\LibTTT\libObjects\uDrawStrategi.pas',
  uMainDynamicShape in '..\LibTTT\libObjects\uMainDynamicShape.pas',
  uMainLogisticTemplate in '..\LibTTT\libObjects\uMainLogisticTemplate.pas',
  uMainOverlay in '..\LibTTT\libObjects\uMainOverlay.pas',
  uMainPlottingShape in '..\LibTTT\libObjects\uMainPlottingShape.pas',
  uMainStaticShape in '..\LibTTT\libObjects\uMainStaticShape.pas',
  uMainStrategi in '..\LibTTT\libObjects\uMainStrategi.pas',
  uFormula in '..\LibTTT\uFormula.pas';

{$R *.res}

var
  Mutex : THandle;
begin
  ReportMemoryLeaksOnShutdown := True;

  MyMsg := RegisterWindowMessage('GameServer_Message');
  Mutex := CreateMutex(nil, True, 'GameServer_Mutex');
  if (Mutex = 0) OR (GetLastError = ERROR_ALREADY_EXISTS) then
  begin
    SendMessage(HWND_BROADCAST, MyMsg, 0, 0);

    Application.MessageBox('Another Game Server has already running.',
      'Game Server', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    Application.Initialize;

   //Application.MainFormOnTaskbar := True;

    Application.Title := 'Game Server';
    Application.CreateForm(TdmTTT, dmTTT);
  Application.CreateForm(TfMainGServer, fMainGServer);
  fMainGServer.LogFile.FileName := ChangeFileExt(Application.ExeName, '.Log');
    fMainGServer.LogFile.Init;

    uScriptSimServer.BeginGame_Server;

    Randomize;

    Application.Run;

    uScriptSimServer.EndGame_Server;
    if Mutex <> 0 then
      CloseHandle(Mutex);
  end;
end.
