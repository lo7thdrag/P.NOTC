program AOPRSimClient;

{$DEFINE CLIENT}

uses
  Forms,
  SysUtils,
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
  uLibSettingTTT in '..\LibTTT\uLibSettingTTT.pas',
  uSimVisuals in '..\LibTTT\LibVisual\uSimVisuals.pas',
  uCompassVisual in '..\LibTTT\LibVisual\uCompassVisual.pas',
  uSimManager in '..\LibTTT\uSimManager.pas',
  uT3SimManager in '..\LibTTT\uT3SimManager.pas',
  uSimMgr_Client in 'uSimMgr_Client.pas',
  newClassASTT in '..\LibTTT\libDBScenario\newClassASTT.pas',
  tttData in '..\LibTTT\libDBScenario\tttData.pas',
  uObjectVisuals in '..\LibTTT\LibVisual\uObjectVisuals.pas',
  uDBScenario in '..\LibTTT\libDBScenario\uDBScenario.pas',
  uDBAssetObject in '..\LibTTT\libDBScenario\uDBAssetObject.pas',
  uDBAsset_Vehicle in '..\LibTTT\libDBScenario\uDBAsset_Vehicle.pas',
  uMapXHandler in '..\LibTTT\uMapXHandler.pas',
  uDataModuleTTT in '..\LibTTT\forms\uDataModuleTTT.pas' {dmTTT: TDataModule},
  ufTacticalDisplay in '..\LibTTT\forms\ufTacticalDisplay.pas' {frmTacticalDisplay},
  ufToteDisplay in '..\LibTTT\forms\ufToteDisplay.pas' {frmToteDisplay},
  ufDBSetting in '..\LibTTT\forms\ufDBSetting.pas' {frmDBSetting},
  uScriptSimClients in 'uScriptSimClients.pas',
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
  uDBAsset_MotionCharacteristics in '..\LibTTT\libDBScenario\uDBAsset_MotionCharacteristics.pas',
  uGameData_TTT in '..\LibTTT\netTTT\uGameData_TTT.pas',
  uPacketBuffer in '..\SimFramework\LibNets\NetComponent\uPacketBuffer.pas',
  uPacketRegister in '..\SimFramework\LibNets\NetComponent\uPacketRegister.pas',
  uTCPClient in '..\SimFramework\LibNets\NetComponent\uTCPClient.pas',
  uTCPDatatype in '..\SimFramework\LibNets\NetComponent\uTCPDatatype.pas',
  uTCPServer in '..\SimFramework\LibNets\NetComponent\uTCPServer.pas',
  uNetUDPnode in '..\SimFramework\LibNets\NetComponent\uNetUDPnode.pas',
  uNetHandle_TTT in '..\LibTTT\netTTT\uNetHandle_TTT.pas',
  uNetHandle_Client in 'uNetHandle_Client.pas',
  uDBAssets_SubAreaEnviroDefinition in '..\LibTTT\libDBScenario\uDBAssets_SubAreaEnviroDefinition.pas',
  uWaypointEditor in '..\LibTTT\forms\uWaypointEditor.pas' {frmWaypointEditor},
  uNetBaseSocket in '..\SimFramework\LibNets\NetComponent\uNetBaseSocket.pas',
  uBaseNetHandler in '..\SimFramework\LibNets\uBaseNetHandler.pas',
  uScriptCommon in '..\LibTTT\uScriptCommon.pas',
  uWaypoint in '..\LibTTT\libObjects\uWaypoint.pas',
  ufProgress in '..\LibTTT\forms\ufProgress.pas' {frmProgress},
  uDBAsset_Runtime_Platform_Library in '..\LibTTT\libDBScenario\uDBAsset_Runtime_Platform_Library.pas',
  uT3GroupList in '..\LibTTT\libNetSession\uT3GroupList.pas',
  GmXml in '..\SimFramework\LibComponent\XMLReader\GmXml.pas',
  GmXMLInterface in '..\SimFramework\LibComponent\XMLReader\GmXMLInterface.pas',
  uLaunchPlatform in '..\LibTTT\forms\uLaunchPlatform.pas' {frmLaunchPlaform},
  uRPLibrary in '..\LibTTT\forms\uRPLibrary.pas' {frmRPLibrary},
  ufLog in 'ufLog.pas' {frmLog},
  uT3Common in '..\LibTTT\uT3Common.pas',
  uT3Unit in '..\LibTTT\libUnit\uT3Unit.pas',
  uT3Vehicle in '..\LibTTT\libUnit\uT3Vehicle.pas',
  uT3UnitContainer in '..\LibTTT\libUnit\uT3UnitContainer.pas',
  uT3Weapon in '..\LibTTT\libUnit\uT3Weapon.pas',
  uGuidance in '..\LibTTT\libObjects\uGuidance.pas',
  uT3Radar in '..\LibTTT\libUnit\uT3Radar.pas',
  uT3Sonar in '..\LibTTT\libUnit\uT3Sonar.pas',
  uT3Sensor in '..\LibTTT\libUnit\uT3Sensor.pas',
  uT3DetectedTrack in '..\LibTTT\libUnit\uT3DetectedTrack.pas',
  ufmCounterMeasure in 'formClient\frames\ufmCounterMeasure.pas' {fmCounterMeasure: TFrame},
  ufmMapWindow in 'formClient\frames\ufmMapWindow.pas' {fmMapWindow: TFrame},
  ufmWeapon in 'formClient\frames\ufmWeapon.pas' {fmWeapon: TFrame},
  ufmFireControl in 'formClient\frames\ufmFireControl.pas' {fmFireControl: TFrame},
  ufmLogisticCalculation in 'formClient\frames\ufmLogisticCalculation.pas' {fmLogisticCalculation: TFrame},
  ufmControlled in 'formClient\frames\ufmControlled.pas' {fmControlled: TFrame},
  ufmPlatformGuidance in 'formClient\frames\ufmPlatformGuidance.pas' {fmPlatformGuidance: TFrame},
  ufmOwnShip in 'formClient\frames\ufmOwnShip.pas' {fmOwnShip: TFrame},
  uRotWheel in '..\LibTTT\uRotWheel.pas',
  uT3EventManager in '..\LibTTT\uT3EventManager.pas',
  uT3Visual in '..\LibTTT\libUnit\uT3Visual.pas',
  uT3Missile in '..\LibTTT\libUnit\uT3Missile.pas',
  uT3Torpedo in '..\LibTTT\libUnit\uT3Torpedo.pas',
  uT3Mine in '..\LibTTT\libUnit\uT3Mine.pas',
  uT3Bomb in '..\LibTTT\libUnit\uT3Bomb.pas',
  uT3Gun in '..\LibTTT\libUnit\uT3Gun.pas',
  ufmSensor in 'formClient\frames\ufmSensor.pas' {fmSensor: TFrame},
  uT3ClientEventManager in '..\LibTTT\uT3ClientEventManager.pas',
  uT3OtherSensor in '..\LibTTT\libUnit\uT3OtherSensor.pas',
  uDBCubicles in '..\LibTTT\libDBScenario\uDBCubicles.pas',
  ufChangeTrackNum in 'formClient\ufChangeTrackNum.pas' {frmChangeTrackNum},
  uT3CounterMeasure in '..\LibTTT\libUnit\uT3CounterMeasure.pas',
  uNewMessage in '..\LibTTT\forms\uNewMessage.pas' {fNewMessage},
  uSelectRecipient in '..\LibTTT\forms\uSelectRecipient.pas' {fSelectRecipient},
  ufEditRealTimeTrack in '..\LibTTT\forms\ufEditRealTimeTrack.pas' {frmEditRealTimeTrack},
  ufMergeTracks in '..\LibTTT\forms\ufMergeTracks.pas' {frmMergeTracks},
  ufChangeTrackNumber in '..\LibTTT\forms\ufChangeTrackNumber.pas' {frmChangeTrackNumber},
  uCommTTT in '..\LibTTT\uCommTTT.pas',
  ufTrackTargetDetail in '..\LibTTT\forms\ufTrackTargetDetail.pas' {frmDetailTrackTarget},
  uNetSessionData in '..\LibTTT\libNetSession\uNetSessionData.pas',
  ufEditNonRealTimeTrack in '..\LibTTT\forms\ufEditNonRealTimeTrack.pas' {frmEditNonRealTimeTrack},
  uNetVoipCtrl in '..\LibTTT\netTTT\uNetVoipCtrl.pas',
  uNetVoipCtrl_Server in '..\LibTTT\netTTT\uNetVoipCtrl_Server.pas',
  DosCommand in '..\SimFramework\LibComponent\DosCommand\DosCommand.pas',
  uAppUtils in '..\SimFramework\LibBaseUtils\uAppUtils.pas',
  uT3Listener in '..\LibTTT\libUnit\uT3Listener.pas',
  uSettingCoordinate in '..\LibTTT\forms\uSettingCoordinate.pas' {fSettingCoordinate},
  uGameSetting in '..\LibTTT\uGameSetting.pas',
  uWeaponWaypoint in '..\LibTTT\libObjects\uWeaponWaypoint.pas',
  uT3DataLink in '..\LibTTT\libUnit\uT3DataLink.pas',
  uPictureFilter in '..\LibTTT\forms\uPictureFilter.pas' {fPictureFilter},
  ufSurfaceToSurfaceMissile in '..\LibTTT\forms\ufSurfaceToSurfaceMissile.pas' {frmSurfaceSurfaceMissileControl},
  uCalculationEnvi in '..\LibTTT\uCalculationEnvi.pas',
  uFLanding in '..\LibTTT\forms\uFLanding.pas' {frmLanding},
  uFormUtil in '..\LibTTT\uFormUtil.pas',
  uDBAsset_Reference_Point in '..\LibTTT\libDBScenario\uDBAsset_Reference_Point.pas',
  uFormationEditorForm in '..\LibTTT\forms\uFormationEditorForm.pas' {frmFormationEditor},
  uT3SonarCD in '..\LibTTT\libUnit\uT3SonarCD.pas',
  uT3MissileDetail in '..\LibTTT\libUnit\uT3MissileDetail.pas',
  uT3MissileEnvironment in '..\LibTTT\libUnit\uT3MissileEnvironment.pas',
  ufmWeaponCtrl in 'formClient\frmWeapon\ufmWeaponCtrl.pas' {frmWeaponCtrl},
  ufrmGunAutoManual in 'formClient\frmWeapon\ufrmGunAutoManual.pas' {frmGunAutoManual},
  uExecuter in '..\SimFramework\LibComponent\Executor\uExecuter.pas',
  ufrmNGSGunSetup in 'formClient\frmWeapon\ufrmNGSGunSetup.pas' {frmNGSGunSetup},
  ufrmGunCIWS in 'formClient\frmWeapon\ufrmGunCIWS.pas' {frmGunCIWS},
  uT3Sonobuoy in '..\LibTTT\libUnit\uT3Sonobuoy.pas',
  uTransferSonobuoy in '..\LibTTT\forms\uTransferSonobuoy.pas' {fTransferSonobuoy},
  uChangeSonobuoyEndurance in '..\LibTTT\forms\uChangeSonobuoyEndurance.pas' {fChangeSonobuoyEndurance},
  uChangeSonobuoyDepth in '..\LibTTT\forms\uChangeSonobuoyDepth.pas' {fChangeSonobuoyDepth},
  ufmDetailPlan in '..\LibTTT\forms\ufmDetailPlan.pas' {PlanDetail},
  uT3HybridMissile in '..\LibTTT\libUnit\uT3HybridMissile.pas',
  uT3HybridOnVehicle in '..\LibTTT\libUnit\uT3HybridOnVehicle.pas',
  uT3DefensiveJammer in '..\LibTTT\libUnit\uT3DefensiveJammer.pas',
  uChangeTorpedoCourse in '..\LibTTT\forms\uChangeTorpedoCourse.pas' {fChangeTorpedoCourse},
  uChangeTorpedoDepth in '..\LibTTT\forms\uChangeTorpedoDepth.pas' {fChangeTorpedoDepth},
  uT3DatalinkManager in '..\LibTTT\libUnit\uT3DatalinkManager.pas',
  uDataBuffer in '..\SimFramework\LibNets\NetComponent\uDataBuffer.pas',
  uT3RadarNoiseJammer in '..\LibTTT\libUnit\uT3RadarNoiseJammer.pas',
  uT3DogBox in '..\LibTTT\libUnit\uT3DogBox.pas',
  uFormationAddRemMembers in '..\LibTTT\forms\uFormationAddRemMembers.pas' {frmFormationAddRemMembers},
  uFormationEditorPanel in '..\LibTTT\forms\uFormationEditorPanel.pas' {frmFormationEditorPanelForm},
  uFormationMembersDetail in '..\LibTTT\forms\uFormationMembersDetail.pas' {frmFormationMembersDetail},
  uFormationManager in '..\LibTTT\uFormationManager.pas',
  uFilter in '..\LibTTT\libVisual\uFilter.pas',
  uLogisticChange in '..\LibTTT\forms\uLogisticChange.pas' {frmLogisticChange},
  uTMapTouch2 in '..\LibTTT\uTMapTouch2.pas',
  uRotateMonitor in '..\LibTTT\monitor\uRotateMonitor.pas' {frmRotateMonitor},
  uStrategiEditor in '..\LibTTT\forms\uStrategiEditor.pas' {frmStrategiEditor},
  uSlidingTrans in '..\LibTTT\monitor\uSlidingTrans.pas',
  uDBAsset_Logistic in '..\LibTTT\libDBScenario\uDBAsset_Logistic.pas',
  ufmEMCON in 'formClient\frames\ufmEMCON.pas' {fmEMCON: TFrame},
  uLogisticCalculation in '..\LibTTT\forms\uLogisticCalculation.pas' {fmLogisticTamplate},
  uDetailRouteLogistic in '..\LibTTT\forms\uDetailRouteLogistic.pas' {fmDetailsRouteLogistic},
  uOverlayTemplateEditor in '..\LibTTT\forms\uOverlayTemplateEditor.pas' {fmOverlayEditor},
  uVectorVisual in '..\LibTTT\libVisual\uVectorVisual.pas',
  uShipTacticalInfo in '..\LibTTT\forms\uShipTacticalInfo.pas' {frmTacticalInfoSet},
  uGotoTime in '..\LibTTT\forms\uGotoTime.pas' {frmGotoTime},
  ufrmGeneraPfTools in 'formClient\wasdalUI\ufrmGeneraPfTools.pas' {frmGeneralPfTools},
  ufrmTop in 'formClient\wasdalUI\ufrmTop.pas' {frmTop},
  ufrmRight in 'formClient\wasdalUI\ufrmRight.pas' {frmRight},
  ufrmTrackDetails in 'formClient\wasdalUI\ufrmTrackDetails.pas' {frmTrackInfo},
  ufrmPlatformInfo in 'formClient\wasdalUI\ufrmPlatformInfo.pas' {frmPlatformInfo},
  ufrmGuidance in 'formClient\wasdalUI\ufrmGuidance.pas' {frmGuidance},
  ufrmRadar in 'formClient\wasdalUI\ufrmRadar.pas' {frmSensor},
  ufrmWeapon in 'formClient\wasdalUI\ufrmWeapon.pas' {frmWeapon},
  ufrmC in 'formClient\wasdalUI\ufrmC.pas' {frmCM},
  ufrmFireControl in 'formClient\wasdalUI\ufrmFireControl.pas' {frmFCR},
  ufrmEMCON in 'formClient\wasdalUI\ufrmEMCON.pas' {frmEMCON},
  ufrmLogistic in 'formClient\wasdalUI\ufrmLogistic.pas' {frmLogistic},
  ufrmMapTools in 'formClient\wasdalUI\ufrmMapTools.pas' {frmMapTools},
  ufrmPlatformTools in 'formClient\wasdalUI\ufrmPlatformTools.pas' {frmPlatformTools},
  ufrmTools in 'formClient\wasdalUI\ufrmTools.pas' {frmTools},
  ufrmLaunchRPCount in 'formClient\ufrmLaunchRPCount.pas' {frmlaunchCountRP},
  uDBEditSetting in '..\AOPRDBEditor.src\uDBEditSetting.pas',
  uRecord in '..\AOPRDBEditor.src\uRecord.pas',
  uSimDBEditor in '..\AOPRDBEditor.src\uSimDBEditor.pas',
  uRemoteHost in '..\AOPRRemote\uRemoteHost.pas' {frmRemoteHost},
  uGamePlayType in '..\AOPRReplay\uGamePlayType.pas',
  uSnapshotData in '..\AOPRReplay\uSnapshotData.pas',
  uSnapshotDLG in '..\AOPRReplay\uSnapshotDLG.pas' {frmSnapshotDLG},
  uSnapshotRec in '..\AOPRReplay\uSnapshotRec.pas',
  uSnapshotUtils in '..\AOPRReplay\uSnapshotUtils.pas',
  uSRRFunction in '..\AOPRReplay\uSRRFunction.pas',
  ufDeployMine in '..\LibTTT\forms\ufDeployMine.pas' {frmDeployMine},
  uBrowseMap in '..\LibTTT\forms\uBrowseMap.pas' {frmBrowseMap},
  uRuler in '..\LibTTT\forms\uRuler.pas' {frmRuler},
  ufmTimeOfRaid in '..\LibTTT\forms\ufmTimeOfRaid.pas' {fmTimeOfRaid},
  ufmInputTrackId in '..\LibTTT\forms\ufmInputTrackId.pas' {fmInputTrackId},
  uDBAsset_Embark_Library in '..\LibTTT\libDBScenario\uDBAsset_Embark_Library.pas',
  U_Helper in '..\LibTTT\U_Helper.pas',
  ufLandTemp in '..\LibTTT\forms\ufLandTemp.pas' {frmLandTemp},
  uEventSummary in '..\AOPRDBEditor.src\uEventSummary.pas',
  uSimbolTaktis in '..\LibTTT\forms\uSimbolTaktis.pas' {frmSimbolTaktis},
  uDBAsset_FontTaktis in '..\LibTTT\libDBScenario\uDBAsset_FontTaktis.pas',
  uPlottingRecord in '..\AOPRDBEditor.src\uPlottingRecord.pas',
  uWaypointCopy in '..\LibTTT\forms\uWaypointCopy.pas' {frmWaypointCopy},
  uSaveAsPlotting in '..\LibTTT\forms\uSaveAsPlotting.pas' {fmSaveAsPlot},
  uPlottingTime in '..\LibTTT\forms\uPlottingTime.pas' {fmPlottingTime},
  uSaveAsOverlay in '..\LibTTT\forms\uSaveAsOverlay.pas' {frmSaveAsOverlay},
  ufReturnToBase in '..\LibTTT\forms\ufReturnToBase.pas' {frmReturnToBase},
  uSaveWaypoint in '..\LibTTT\forms\uSaveWaypoint.pas' {frmSaveWaypoint},
  ufrmHelp in 'formClient\wasdalUI\ufrmHelp.pas' {frmHelp},
  ufrmKeyboard in 'formClient\wasdalUI\ufrmKeyboard.pas' {frmKeyboard},
  uDBAsset_Capability in '..\LibTTT\libDBScenario\uDBAsset_Capability.pas',
  GDIPAPI in '..\LibTTT\libGDIP\GDIPAPI.pas',
  GdiPlus in '..\LibTTT\libGDIP\GdiPlus.pas',
  GdiPlusHelpers in '..\LibTTT\libGDIP\GdiPlusHelpers.pas',
  GDIPOBJ in '..\LibTTT\libGDIP\GDIPOBJ.pas',
  ufmDisembarkWith in '..\LibTTT\forms\ufmDisembarkWith.pas' {fmDisembarkWith},
  uT3GroupVehicle in '..\LibTTT\libUnit\uT3GroupVehicle.pas',
  frmGroupName in 'formClient\frmGroupName.pas' {frmGroupName1},
  uFormula in '..\LibTTT\uFormula.pas',
  ufrmViewWasdal in 'formClient\wasdalUI\ufrmViewWasdal.pas' {frmViewWasdal},
  ufTransportEmbarkasi in '..\LibTTT\forms\ufTransportEmbarkasi.pas' {frmTransportEmbarkasi},
  ufrmLeftPlotter in 'formClient\plotterUI\ufrmLeftPlotter.pas' {frmLeftPlotter},
  ufrmLeftToolsPlotter in 'formClient\plotterUI\ufrmLeftToolsPlotter.pas' {frmLeftToolsPlotter},
  ufrmRightPlotter in 'formClient\plotterUI\ufrmRightPlotter.pas' {frmRightPlotter},
  ufrmRightToolsPlotter in 'formClient\plotterUI\ufrmRightToolsPlotter.pas' {frmRightToolsPlotter},
  ufrmTopPlotter in 'formClient\plotterUI\ufrmTopPlotter.pas' {frmTopPlotter},
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
  ufrmPlatformBaseDetail in '..\LibTTT\forms\ufrmPlatformBaseDetail.pas' {frmPlatformBaseDetail};

{$R *.res}

var
  SavedDecimalSeparator : char;
  SavedDateFormat : string;
begin
//  ReportMemoryLeaksOnShutdown := False;

  SavedDecimalSeparator := FormatSettings.DecimalSeparator;
  FormatSettings.DecimalSeparator := '.';

  Application.Initialize;

  //Application.MainFormOnTaskbar := True;

  Application.Title := 'SimClient';
  Application.CreateForm(TdmTTT, dmTTT);
  Application.CreateForm(TfrmTacticalDisplay, frmTacticalDisplay);
  Application.CreateForm(TfrmToteDisplay, frmToteDisplay);
  Application.CreateForm(TfrmLog, frmLog);
  Application.CreateForm(TfmOverlayEditor, fmOverlayEditor);
  Application.CreateForm(TfSettingCoordinate, fSettingCoordinate);
  Application.CreateForm(TfrmFormationEditor, frmFormationEditor);
  Application.CreateForm(TfrmLogisticChange, frmLogisticChange);
  Application.CreateForm(TfrmEditNonRealTimeTrack, frmEditNonRealTimeTrack);
  Application.CreateForm(TfrmFormationAddRemMembers, frmFormationAddRemMembers);
  Application.CreateForm(TfrmRotateMonitor, frmRotateMonitor);
  Application.CreateForm(TfrmStrategiEditor, frmStrategiEditor);
  Application.CreateForm(TfmLogisticTamplate, fmLogisticTamplate);
  Application.CreateForm(TfmDetailsRouteLogistic, fmDetailsRouteLogistic);
  Application.CreateForm(TfrmlaunchCountRP, frmlaunchCountRP);
  Application.CreateForm(TfrmRemoteHost, frmRemoteHost);
  Application.CreateForm(TfrmSnapshotDLG, frmSnapshotDLG);
  Application.CreateForm(TfrmDeployMine, frmDeployMine);
  Application.CreateForm(TfrmBrowseMap, frmBrowseMap);
  Application.CreateForm(TfrmRuler, frmRuler);
  Application.CreateForm(TfmTimeOfRaid, fmTimeOfRaid);
  Application.CreateForm(TfmInputTrackId, fmInputTrackId);
  Application.CreateForm(TfrmLandTemp, frmLandTemp);
  Application.CreateForm(TfrmSimbolTaktis, frmSimbolTaktis);
  Application.CreateForm(TfrmWaypointCopy, frmWaypointCopy);
  Application.CreateForm(TfmSaveAsPlot, fmSaveAsPlot);
  Application.CreateForm(TfmPlottingTime, fmPlottingTime);
  Application.CreateForm(TfrmSaveAsOverlay, frmSaveAsOverlay);
  Application.CreateForm(TfrmReturnToBase, frmReturnToBase);
  Application.CreateForm(TfrmSaveWaypoint, frmSaveWaypoint);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.CreateForm(TfrmKeyboard, frmKeyboard);
  Application.CreateForm(TfmDisembarkWith, fmDisembarkWith);
  Application.CreateForm(TfrmGroupName1, frmGroupName1);
  Application.CreateForm(TfrmViewWasdal, frmViewWasdal);
  Application.CreateForm(TfrmRightToolsPlotter, frmRightToolsPlotter);
  Application.CreateForm(TfrmPlatformBaseDetail, frmPlatformBaseDetail);
  frmLog.LogFile.FileName := ChangeFileExt(Application.ExeName, '.log');
  frmLog.LogFile.Init;

  uScriptSimClients.BeginGame;
  Application.CreateForm(TfPictureFilter, fPictureFilter);

  VSimMap.FMap.CurrentTool := mtSelectObject;

  Application.Run;

  uScriptSimClients.EndGame;
  FormatSettings.DecimalSeparator := SavedDecimalSeparator;

end.
