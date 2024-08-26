program tttSimServer;

uses
  Forms,
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
  uTrackHistory in '..\LibTTT\forms\uTrackHistory.pas' {fTrackHistory},
  uNetHandle_TTT in '..\LibTTT\netTTT\uNetHandle_TTT.pas',
  uDataModuleTTT in '..\LibTTT\forms\uDataModuleTTT.pas' {dmTTT: TDataModule},
  ufDBSetting in '..\LibTTT\forms\ufDBSetting.pas' {frmDBSetting},
  ufDebugNet in '..\LibDebug\ufDebugNet.pas' {frmDebug},
  ufDebug in '..\LibDebug\ufDebug.pas',
  uDBAsset_MotionCharacteristics in '..\LibTTT\libDBScenario\uDBAsset_MotionCharacteristics.pas',
  uNetBaseSocket in '..\SimFramework\LibNets\NetComponent\uNetBaseSocket.pas',
  uBaseNetHandler in '..\SimFramework\LibNets\uBaseNetHandler.pas',
  uWaypoint in '..\LibTTT\libObjects\uWaypoint.pas',
  uSensor in '..\LibTTT\libObjects\uSensor.pas',
  uDetectedObject in '..\LibTTT\uDetectedObject.pas',
  uDBAssets_SubAreaEnviroDefinition in '..\LibTTT\libDBScenario\uDBAssets_SubAreaEnviroDefinition.pas',
  uScriptCommon in '..\LibTTT\uScriptCommon.pas',
  uScriptSimServer in 'uScriptSimServer.pas' {$R *.res},
  ufProgress in '..\LibTTT\forms\ufProgress.pas' {frmProgress},
  uT3GroupList in '..\LibTTT\libNetSession\uT3GroupList.pas',
  uDBAsset_Runtime_Platform_Library in '..\LibTTT\libDBScenario\uDBAsset_Runtime_Platform_Library.pas',
  ufMapWindow in 'ufMapWindow.pas' {frmMapWindows},
  uMapXData in '..\LibTTT\uMapXData.pas';

{$R *.res}

begin
  Application.Initialize;

  //Application.MainFormOnTaskbar := True;

  Application.Title := 'TTT Game Server';
  Application.CreateForm(TdmTTT, dmTTT);
  Application.CreateForm(TfMainGServer, fMainGServer);
  Application.CreateForm(TfrmMapWindows, frmMapWindows);
  uScriptSimServer.BeginGame_Server;

  Application.Run;

  uScriptSimServer.EndGame_Server;

end.
