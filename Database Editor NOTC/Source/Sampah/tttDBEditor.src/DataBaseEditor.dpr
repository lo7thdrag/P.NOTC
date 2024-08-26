program DataBaseEditor;

uses
  Forms,
  ufDBEditor in '..\LibTTT\forms\ufDBEditor.pas' {fDBEditor},
  ufScenario in '..\LibTTT\forms\ufScenario.pas' {frmScenario},
  uGroupAllocationWindow in '..\LibTTT\forms\uGroupAllocationWindow.pas' {GroupAllocationWindowForm},
  uLinkWindow in '..\LibTTT\forms\uLinkWindow.pas' {LinkWindowForm},
  uPlatformDeployment in '..\LibTTT\forms\uPlatformDeployment.pas' {fPlatformDeploytment},
  uSimDBEditor in 'uSimDBEditor.pas',
  uLibSettingTTT in '..\LibTTT\uLibSettingTTT.pas',
  ufDBSetting in '..\LibTTT\forms\ufDBSetting.pas' {frmDBSetting},
  uDataModuleTTT in '..\LibTTT\forms\uDataModuleTTT.pas' {dmTTT: TDataModule},
  uIniFilesProcs in '..\SimFramework\LibBaseUtils\uIniFilesProcs.pas',
  uCodecBase64 in '..\SimFramework\LibBaseUtils\StringUtils\uCodecBase64.pas',
  tttData in '..\LibTTT\libDBScenario\tttData.pas',
  newClassASTT in '..\LibTTT\libDBScenario\newClassASTT.pas',
  uDBAsset_Vehicle in '..\LibTTT\libDBScenario\uDBAsset_Vehicle.pas',
  uSimObjects in '..\SimFramework\LibSims\SimSystem\uSimObjects.pas',
  uSimVisuals in '..\LibTTT\LibVisual\uSimVisuals.pas',
  uObjectVisuals in '..\LibTTT\LibVisual\uObjectVisuals.pas',
  u2DMover in '..\SimFramework\LibSims\SimsObjects\u2DMover.pas',
  uBaseCoordSystem in '..\SimFramework\LibBaseUtils\CoordSystem\uBaseCoordSystem.pas',
  uSteppers in '..\SimFramework\LibBaseUtils\Counter\uSteppers.pas',
  uBaseSimObjects in '..\SimFramework\LibSims\SimSystem\uBaseSimObjects.pas',
  uSimContainers in '..\SimFramework\LibSims\SimSystem\uSimContainers.pas',
  uDataTypes in '..\SimFramework\LibBaseUtils\CoordSystem\uDataTypes.pas',
  uCoordConvertor in '..\SimFramework\LibBaseUtils\CoordSystem\uCoordConvertor.pas',
  uStringFunc in '..\SimFramework\LibBaseUtils\StringUtils\uStringFunc.pas',
  uDBAsset_Sensor in '..\LibTTT\libDBScenario\uDBAsset_Sensor.pas',
  uDBAsset_Radar in '..\LibTTT\libDBScenario\uDBAsset_Radar.pas',
  uDBAsset_Sonar in '..\LibTTT\libDBScenario\uDBAsset_Sonar.pas',
  uDBAsset_Weapon in '..\LibTTT\libDBScenario\uDBAsset_Weapon.pas',
  uDBAsset_Countermeasure in '..\LibTTT\libDBScenario\uDBAsset_Countermeasure.pas',
  uAvailableScenario in '..\LibTTT\forms\uAvailableScenario.pas' {fAvailableScenario},
  uResurceAllocationSelect in '..\LibTTT\forms\uResurceAllocationSelect.pas' {fResorceAllocationSelect},
  ufResouceAllocation in '..\LibTTT\forms\ufResouceAllocation.pas' {fResourceAllocSelection},
  uDBScenario in '..\LibTTT\libDBScenario\uDBScenario.pas',
  uVirtualTime in '..\SimFramework\LibBaseUtils\Counter\uVirtualTime.pas',
  uThreadTimer in '..\SimFramework\LibBaseUtils\Counter\uThreadTimer.pas',
  uT3SimManager in '..\LibTTT\uT3SimManager.pas',
  uCompassVisual in '..\LibTTT\libVisual\uCompassVisual.pas',
  uMapXHandler in '..\LibTTT\uMapXHandler.pas',
  uPlatformDeploymentPickList in '..\LibTTT\forms\uPlatformDeploymentPickList.pas' {PlatformDeploymentPickListForm},
  uDBAsset_Geo in '..\LibTTT\libDBScenario\uDBAsset_Geo.pas',
  uDBLink in '..\LibTTT\libDBScenario\uDBLink.pas',
  uDBFormation in '..\LibTTT\libDBScenario\uDBFormation.pas',
  uDBNote_Storage in '..\LibTTT\libDBScenario\uDBNote_Storage.pas',
  uDBAsset_Deploy in '..\LibTTT\libDBScenario\uDBAsset_Deploy.pas',
  uDBPattern in '..\LibTTT\libDBScenario\uDBPattern.pas',
  uDBBlind_Zone in '..\LibTTT\libDBScenario\uDBBlind_Zone.pas',
  uDBAsset_Fitted in '..\LibTTT\libDBScenario\uDBAsset_Fitted.pas',
  uDBAsset_Satellite in '..\LibTTT\libDBScenario\uDBAsset_Satellite.pas',
  uDBGame_Defaults in '..\LibTTT\libDBScenario\uDBGame_Defaults.pas',
  uDBAsset_Bomb in '..\LibTTT\libDBScenario\uDBAsset_Bomb.pas',
  uDBAsset_Gun in '..\LibTTT\libDBScenario\uDBAsset_Gun.pas',
  uDBAsset_Scripted in '..\LibTTT\libDBScenario\uDBAsset_Scripted.pas',
  uDBRainfall in '..\LibTTT\libDBScenario\uDBRainfall.pas',
  uDBAsset_Cubicle in '..\LibTTT\libDBScenario\uDBAsset_Cubicle.pas',
  uDBAsset_Sonobuoy in '..\LibTTT\libDBScenario\uDBAsset_Sonobuoy.pas',
  uAddParticipant in '..\LibTTT\forms\uAddParticipant.pas' {AddParticipantForm},
  uEvents in '..\LibTTT\forms\uEvents.pas' {EventsWindowForm},
  uAddExCompChannel in '..\LibTTT\forms\uAddExCompChannel.pas' {AddExCompChannelForm},
  uAddMember in '..\LibTTT\forms\uAddMember.pas' {AddMemberForm},
  uDBDefault_Var in '..\LibTTT\libDBScenario\uDBDefault_Var.pas',
  uDBCloud_Effect in '..\LibTTT\libDBScenario\uDBCloud_Effect.pas',
  uFEnvironmentSelection in '..\LibTTT\forms\uFEnvironmentSelection.pas' {fEnvironmentsSelect},
  uFormationEditor in '..\LibTTT\forms\uFormationEditor.pas' {fFormationEditor},
  uFormationEditorPanel in '..\LibTTT\forms\uFormationEditorPanel.pas' {fFormationEditorPanel},
  uFormationMemberList in '..\LibTTT\forms\uFormationMemberList.pas' {FormationMemberForm},
  uFormatioResourceList in '..\LibTTT\forms\uFormatioResourceList.pas' {FormationResourcesForm},
  uGameAreaList in '..\LibTTT\forms\uGameAreaList.pas' {fGameAreaList},
  uExerciseArea in '..\LibTTT\forms\uExerciseArea.pas' {ExerciseAreaForm},
  uDBAsset_GameEnvironment in '..\LibTTT\libDBScenario\uDBAsset_GameEnvironment.pas',
  uDBAsset_MotionCharacteristics in '..\LibTTT\libDBScenario\uDBAsset_MotionCharacteristics.pas',
  uEnvironmentSelect in '..\LibTTT\forms\uEnvironmentSelect.pas' {fEnvironmentSelect},
  uGameDefaults in '..\LibTTT\forms\uGameDefaults.pas' {fGameDefaults},
  uGameDefaultSelect in '..\LibTTT\forms\uGameDefaultSelect.pas' {fGameDefaultSelect},
  uMissileSelect in '..\LibTTT\forms\uMissileSelect.pas' {fMissileSelect},
  uTorpedoSelect in '..\LibTTT\forms\uTorpedoSelect.pas' {fTorpedo},
  uSonobuoySelect in '..\LibTTT\forms\uSonobuoySelect.pas' {fSonobuoySelect},
  uMineSelect in '..\LibTTT\forms\uMineSelect.pas' {fMine},
  uSatelliteSelect in '..\LibTTT\forms\uSatelliteSelect.pas' {fSatellite},
  uSimManager in '..\LibTTT\uSimManager.pas',
  uEnvironment in '..\LibTTT\forms\uEnvironment.pas' {EnvironmentForm},
  uGameAreaSelection in '..\LibTTT\forms\uGameAreaSelection.pas' {fGameAreaSelection},
  uEnvironmentCharacteristicsWindow in '..\LibTTT\forms\uEnvironmentCharacteristicsWindow.pas' {EnvironmentCharacteristicsWindowForm},
  uTCPData_TTT in '..\LibTTT\netTTT\uTCPData_TTT.pas',
  uPacketBuffer in '..\SimFramework\LibNets\NetComponent\uPacketBuffer.pas',
  uPacketRegister in '..\SimFramework\LibNets\NetComponent\uPacketRegister.pas',
  uTCPClient in '..\SimFramework\LibNets\NetComponent\uTCPClient.pas',
  uTCPDatatype in '..\SimFramework\LibNets\NetComponent\uTCPDatatype.pas',
  uTCPServer in '..\SimFramework\LibNets\NetComponent\uTCPServer.pas',
  uGeographicalFeatureImport in '..\LibTTT\forms\uGeographicalFeatureImport.pas' {GeographicalFeatureImportForm},
  uSatellitePlatform in '..\LibTTT\forms\uSatellitePlatform.pas' {SatellitePlatformForm},
  uSatelliteList in '..\LibTTT\forms\uSatelliteList.pas' {SatelliteListForm},
  uInputName in '..\LibTTT\forms\uInputName.pas' {fInputName},
  uPISelect in '..\LibTTT\forms\uPISelect.pas' {fPISelect},
  uMotionSingleList in '..\LibTTT\forms\uMotionSingleList.pas' {fmotionSingleList},
  uMotion in '..\LibTTT\forms\uMotion.pas' {MotionHorizontalForm},
  uRadarIntervalList in '..\LibTTT\forms\uRadarIntervalList.pas' {RadarIntervalListForm},
  uRadarIntervalSetup in '..\LibTTT\forms\uRadarIntervalSetup.pas' {fRadarIntervalSetup},
  uRadarMount in '..\LibTTT\forms\uRadarMount.pas' {RadarMountForm},
  uRadarPickList in '..\LibTTT\forms\uRadarPickList.pas' {fRadarPickList},
  uLandmassEditor in '..\LibTTT\forms\uLandmassEditor.pas' {fLandmassEditor},
  drawRec in '..\LibTTT\forms\drawRec.pas' {fEditGameCenter},
  uRadarSummary in '..\LibTTT\forms\uRadarSummary.pas' {fRadar},
  uCharacteristicLandmass in '..\LibTTT\forms\uCharacteristicLandmass.pas' {fCharacteristicLandmass},
  uVehiclePicklistFilter in '..\LibTTT\forms\uVehiclePicklistFilter.pas' {fVehiclePicklistFilter},
  uVehicleSelect in '..\LibTTT\forms\uVehicleSelect.pas' {fVehicleSelect},
  uVehicleAttributeWindow in '..\LibTTT\forms\uVehicleAttributeWindow.pas' {fVehicleAttributeWindow},
  uVehicleName in '..\LibTTT\forms\uVehicleName.pas' {fVehicleName},
  uMotionDoubleList in '..\LibTTT\forms\uMotionDoubleList.pas' {fMotionDouble},
  uSensorDoubleList in '..\LibTTT\forms\uSensorDoubleList.pas' {fSensor},
  uWeaponDoubleList in '..\LibTTT\forms\uWeaponDoubleList.pas' {fWeaponDoubleList},
  uESMMount in '..\LibTTT\forms\uESMMount.pas' {ESMMountForm},
  uESMPickList in '..\LibTTT\forms\uESMPickList.pas' {fESMPickList},
  uDBAsset_ESM in '..\LibTTT\libDBScenario\uDBAsset_ESM.pas',
  uESMWindow in '..\LibTTT\forms\uESMWindow.pas' {fESMWindow},
  uDBAssets_SubAreaEnviroDefinition in '..\LibTTT\libDBScenario\uDBAssets_SubAreaEnviroDefinition.pas',
  uSonobuoySinglePickList in '..\LibTTT\forms\uSonobuoySinglePickList.pas' {fSonobuoySingle},
  uSonobuoyWindow in '..\LibTTT\forms\uSonobuoyWindow.pas' {fSonobuoyWindow},
  uSonarList in '..\LibTTT\forms\uSonarList.pas' {fSonarList},
  uSonarMount in '..\LibTTT\forms\uSonarMount.pas' {SonarMountForm},
  uEOPicklist in '..\LibTTT\forms\uEOPicklist.pas' {fEO},
  uElectroOpticalDetectorMount in '..\LibTTT\forms\uElectroOpticalDetectorMount.pas' {ElectroOpticalMountForm},
  uElectroOpticalDetector in '..\LibTTT\forms\uElectroOpticalDetector.pas' {ElectroOpticalForm},
  uMAD in '..\LibTTT\forms\uMAD.pas' {MADMount},
  uMADPicklist in '..\LibTTT\forms\uMADPicklist.pas' {fMADPicklist},
  uMADWindow in '..\LibTTT\forms\uMADWindow.pas' {MADForm},
  uRotWheel in '..\LibTTT\uRotWheel.pas' {uSonar in '..\LibTTT\forms\uSonar.pas' {fSonar},
  uSonarPicklist in '..\LibTTT\forms\uSonarPicklist.pas' {fSonarPicklist},
  uSonar in '..\LibTTT\forms\uSonar.pas' {fSonar},
  uSonarDefList in '..\LibTTT\forms\uSonarDefList.pas' {fSonarDefList},
  uSonarDoubleList in '..\LibTTT\forms\uSonarDoubleList.pas' {fSonarDoubleList},
  uWeaponSingleList in '..\LibTTT\forms\uWeaponSingleList.pas' {fWeaponSingle},
  uMissileSummary in '..\LibTTT\forms\uMissileSummary.pas' {fMissileSummary},
  uTorpedoSummary in '..\LibTTT\forms\uTorpedoSummary.pas' {fTorpedoSummary},
  uMineSummary in '..\LibTTT\forms\uMineSummary.pas' {fMineSummary},
  uBombWindow in '..\LibTTT\forms\uBombWindow.pas' {fBombWindow},
  uScrCapture in '..\LibTTT\forms\uScrCapture.pas' {fScrCapture},
  ufCaptureRes in '..\LibTTT\forms\ufCaptureRes.pas' {fCaptureRes},
  uGunSummary in '..\LibTTT\forms\uGunSummary.pas' {fGunSummary},
  uDetectedObject in '..\LibTTT\uDetectedObject.pas',
  uResourceAllocation in '..\LibTTT\forms\uResourceAllocation.pas' {ResourceAllocationForm},
  uRAList in '..\LibTTT\forms\uRAList.pas' {fRAList},
  uVehicleList in '..\LibTTT\forms\uVehicleList.pas' {fVehicleList},
  uDBAssetObject in '..\LibTTT\libDBScenario\uDBAssetObject.pas',
  uChannelComList in '..\LibTTT\forms\uChannelComList.pas' {fChannelComList},
  uCommunicationsChannels in '..\LibTTT\forms\uCommunicationsChannels.pas' {CommunicationsChannelsForm},
  uOverlayTemplateEditor in '..\LibTTT\forms\uOverlayTemplateEditor.pas' {fmOverlayTemplateEditor},
  uOverlayEditor in '..\LibTTT\forms\uOverlayEditor.pas' {OverlayEditorForm},
  uOverlaySelectListForm in '..\LibTTT\forms\uOverlaySelectListForm.pas' {fOverlaySelect},
  uStudentRoleListWindow in '..\LibTTT\forms\uStudentRoleListWindow.pas' {fStudentRoleListWindow},
  uStudentRoleList in '..\LibTTT\forms\uStudentRoleList.pas' {fStudentRole},
  uEditStudentRoleList in '..\LibTTT\forms\uEditStudentRoleList.pas' {fEditRoleList},
  uOtherSingleList in '..\LibTTT\forms\uOtherSingleList.pas' {fOtherSingle},
  uCountermeasuresSingleList in '..\LibTTT\forms\uCountermeasuresSingleList.pas' {fCountermeasureSingle},
  uAcousticDecoy in '..\LibTTT\forms\uAcousticDecoy.pas' {fAcousticDecoy},
  uAirBubbleDef in '..\LibTTT\forms\uAirBubbleDef.pas' {fAirBubble},
  uChaffDecoy in '..\LibTTT\forms\uChaffDecoy.pas' {fChaff},
  uFloatingDecoy in '..\LibTTT\forms\uFloatingDecoy.pas' {fFloatingDecoy},
  uDefensiveJammer in '..\LibTTT\forms\uDefensiveJammer.pas' {fDefensiveJammer},
  uTowedJammerDecoyDef in '..\LibTTT\forms\uTowedJammerDecoyDef.pas' {fTowedjammerDecoy},
  uRadarJammer in '..\LibTTT\forms\uRadarJammer.pas' {fRadarJammer},
  uWaypointEditorPanel in '..\LibTTT\forms\uWaypointEditorPanel.pas' {WaypointEditorPanelForm},
  uSensor in '..\LibTTT\libObjects\uSensor.pas',
  uWaypoint in '..\LibTTT\libObjects\uWaypoint.pas',
  uPictureCentreControl in '..\LibTTT\forms\uPictureCentreControl.pas' {fPictureCentreSettings},
  uTrackHistory in '..\LibTTT\forms\uTrackHistory.pas' {fTrackHistory},
  uPlatformHandle in '..\LibTTT\forms\uPlatformHandle.pas' {frmHandle},
  uGroupSelect in '..\LibTTT\forms\uGroupSelect.pas' {fGroupSelect},
  uNetBaseSocket in '..\SimFramework\LibNets\NetComponent\uNetBaseSocket.pas',
  uBaseNetHandler in '..\SimFramework\LibNets\uBaseNetHandler.pas',
  ufProgress in '..\LibTTT\forms\ufProgress.pas' {frmProgress},
  uGameData_TTT in '..\LibTTT\netTTT\uGameData_TTT.pas',
  uDBAsset_Runtime_Platform_Library in '..\LibTTT\libDBScenario\uDBAsset_Runtime_Platform_Library.pas',
  UfPlatformLibrary in '..\LibTTT\forms\UfPlatformLibrary.pas' {fPlatformLibraryDoublePickList},
  uT3GroupList in '..\LibTTT\libNetSession\uT3GroupList.pas',
  GmXml in '..\SimFramework\LibComponent\XMLReader\GmXml.pas',
  GmXMLInterface in '..\SimFramework\LibComponent\XMLReader\GmXMLInterface.pas',
  xmlInterface in '..\SimFramework\LibComponent\XMLReader\xmlInterface.pas' {,
  uSimMgr_Client in '..\tttSimClient.src\uSimMgr_Client.pas',
  uNetHandle_Client in '..\tttSimClient.src\uNetHandle_Client.pas',
  uNetUDPnode in '..\SimFramework\LibNets\NetComponent\uNetUDPnode.pas',
  uNetHandle_TTT in '..\LibTTT\netTTT\uNetHandle_TTT.pas'},
  uGroupMemberSelection in '..\LibTTT\forms\uGroupMemberSelection.pas' {fGroupMemberSelection},
  uRuntimePlatform in '..\LibTTT\forms\uRuntimePlatform.pas' {fRuntimePlatform},
  uGuidance in '..\LibTTT\libObjects\uGuidance.pas',
  uBombDoublePickList in '..\LibTTT\forms\uBombDoublePickList.pas' {fBombDoublePickList},
  UfRadarDoublePickList in '..\LibTTT\forms\UfRadarDoublePickList.pas' {fRadarDoublePickList},
  uMADDoublePickList in '..\LibTTT\forms\uMADDoublePickList.pas' {fMADDoublePickList},
  uESMDoublePickList in '..\LibTTT\forms\uESMDoublePickList.pas' {fESMDoublePickList},
  uEODoublePickList in '..\LibTTT\forms\uEODoublePickList.pas' {fEODoublePickList},
  uIFFDoublePickList in '..\LibTTT\forms\uIFFDoublePickList.pas' {fIFFDoublePickList},
  uVDDoublePickList in '..\LibTTT\forms\uVDDoublePickList.pas' {fVDDoublePickList},
  uSonobuoyDoublePickList in '..\LibTTT\forms\uSonobuoyDoublePickList.pas' {fSonobuoyDoublePickList},
  uGunSelect in '..\LibTTT\forms\uGunSelect.pas' {fGunSelect},
  uRadarJammerSelect in '..\LibTTT\forms\uRadarJammerSelect.pas' {fRadarJammerSelect},
  uAirBubbleSelect in '..\LibTTT\forms\uAirBubbleSelect.pas' {fAirBubbleSelect},
  uAccousticDecoySelect in '..\LibTTT\forms\uAccousticDecoySelect.pas' {fAccousticDeploySelect},
  uDefensiveJammerSelect in '..\LibTTT\forms\uDefensiveJammerSelect.pas' {fDefensiveJammerSelect},
  uTJDecoySelect in '..\LibTTT\forms\uTJDecoySelect.pas' {fTJDecoySelect},
  uFloatingDecoySelect in '..\LibTTT\forms\uFloatingDecoySelect.pas' {fFloatingDecoySelect},
  uChaffSelect in '..\LibTTT\forms\uChaffSelect.pas' {fChaffSelect},
  uIFFMount in '..\LibTTT\forms\uIFFMount.pas' {IFFMountForm},
  uMineMount in '..\LibTTT\forms\uMineMount.pas' {MineMountForm},
  uMissileLaunchers in '..\LibTTT\forms\uMissileLaunchers.pas' {MissileLaunchersForm},
  uMissileMountForm in '..\LibTTT\forms\uMissileMountForm.pas' {MissileMountForm},
  uTorpedoMounts in '..\LibTTT\forms\uTorpedoMounts.pas' {TorpedoMountsForm},
  uGunMount in '..\LibTTT\forms\uGunMount.pas' {GunMountForm},
  uBombDepthChargeMount in '..\LibTTT\forms\uBombDepthChargeMount.pas' {BombDepthChargeMountForm},
  uTorpedoLauncher in '..\LibTTT\forms\uTorpedoLauncher.pas' {TorpedoLauncherForm},
  uRadarJammerMount in '..\LibTTT\forms\uRadarJammerMount.pas' {RadarJammerMountForm},
  uAirBubbleMounts in '..\LibTTT\forms\uAirBubbleMounts.pas' {AirBubblesMounts},
  uAccousticDecoyMount in '..\LibTTT\forms\uAccousticDecoyMount.pas' {AccousticDecoy},
  uSonobuoyMount in '..\LibTTT\forms\uSonobuoyMount.pas' {SonobuoyMountForm},
  uTowedJammerMount in '..\LibTTT\forms\uTowedJammerMount.pas' {TowedJammerMountForm},
  uFloatingDecoyMount in '..\LibTTT\forms\uFloatingDecoyMount.pas' {FloatingMountForm},
  uChaffMount in '..\LibTTT\forms\uChaffMount.pas' {ChaffMountForm},
  uVisualDetectorMount in '..\LibTTT\forms\uVisualDetectorMount.pas' {VisualDetectorMountForm},
  uSNRvsPOD in '..\LibTTT\forms\uSNRvsPOD.pas' {fSnrVsPod},
  uPredefinedPattern in '..\LibTTT\forms\uPredefinedPattern.pas' {fPredefinedPattern},
  uBlindZoneAttachment in '..\LibTTT\forms\uBlindZoneAttachment.pas' {BlindZonesAttachmentForm},
  uBlindZoneView in '..\LibTTT\forms\uBlindZoneView.pas',
  uChaffAssets in '..\LibTTT\forms\uChaffAssets.pas' {ChaffAssets},
  uChaffLauncher in '..\LibTTT\forms\uChaffLauncher.pas' {fChaffLauncher},
  uChooseMap in '..\LibTTT\forms\uChooseMap.pas' {ChooseMap},
  uENCSelect in '..\LibTTT\forms\uENCSelect.pas' {ENCSelect},
  uOverlayOther in 'uOverlayOther.pas',
  uOverlayRecord in 'uOverlayRecord.pas' {$R *.res},
  uDBAsset_Filter in '..\LibTTT\libDBScenario\uDBAsset_Filter.pas',
  uLauncherList in '..\LibTTT\forms\uLauncherList.pas' {fLauncherList},
  uUsage in '..\LibTTT\forms\uUsage.pas' {Usage},
  uTrainingPattern in '..\LibTTT\forms\uTrainingPattern.pas' {fTrainingPattern},
  uDrawOverlay in 'uDrawOverlay.pas',
  uMainOverlay in 'uMainOverlay.pas',
  uRecord in 'uRecord.pas',
  uEffectsTable in '..\LibTTT\forms\uEffectsTable.pas' {EffectsTable},
  uDBEditSetting in 'uDBEditSetting.pas',
  uProbabilityGraph in '..\LibTTT\forms\uProbabilityGraph.pas' {ProbabilityGraph},
  uAccousticDecoyProb in '..\LibTTT\forms\uAccousticDecoyProb.pas' {AccousticDecoyProb},
  uIFFMode in '..\LibTTT\forms\uIFFMode.pas' {IFFMode},
  uPredefinedPatternEvents in '..\LibTTT\forms\uPredefinedPatternEvents.pas' {EditEvents},
  uInfraredDecoy in '..\LibTTT\forms\uInfraredDecoy.pas' {fInfraredDecoy},
  uReferencePointEditor in '..\LibTTT\forms\uReferencePointEditor.pas' {fReferencePointEditor},
  uReferencePointNew in '..\LibTTT\forms\uReferencePointNew.pas' {fReferencePointNew},
  uT3Common in '..\LibTTT\uT3Common.pas',
  uDBAsset_Reference_Point in '..\LibTTT\libDBScenario\uDBAsset_Reference_Point.pas',
  uEmbarkedSelect in '..\LibTTT\forms\uEmbarkedSelect.pas' {fEmbarkedSelect},
  uHelicopterLimitations in '..\LibTTT\forms\uHelicopterLimitations.pas' {frmHelicopterLimitations},
  uHelicopter_Land_Launch_Limits in '..\LibTTT\libDBScenario\uHelicopter_Land_Launch_Limits.pas',
  uRadarCoverage in '..\LibTTT\forms\uRadarCoverage.pas' {RadarCoverage},
  uPredefinedSelectListForm in '..\LibTTT\forms\uPredefinedSelectListForm.pas' {fPredefinedSelect},
  uInfraredDecoyDouble in '..\LibTTT\forms\uInfraredDecoyDouble.pas' {fInfraredDecoyPickList},
  uInfraRedmount in '..\LibTTT\forms\uInfraRedmount.pas' {fIRmount},
  uRadarIntervalDouble in '..\LibTTT\forms\uRadarIntervalDouble.pas' {fRadarIntervalSelect},
  uEnvi in 'uEnvi.pas' {frmEnvi},
  uEditScenario in 'uEditScenario.pas' {frmEditScenario},
  uLogisticsList in '..\LibTTT\forms\uLogisticsList.pas' {frmLogisticsList},
  uDBAsset_Logistics in '..\LibTTT\libDBScenario\uDBAsset_Logistics.pas',
  uLogistics in '..\LibTTT\forms\uLogistics.pas' {frmLogistics},
  uTacticalSymbol in '..\LibTTT\forms\uTacticalSymbol.pas' {frmTacticalSymbol},
  uLogin in '..\LibTTT\forms\uLogin.pas' {frmLogin},
  uUserLogin in '..\LibTTT\forms\uUserLogin.pas' {frmUserLogin},
  uAdministrator in '..\LibTTT\forms\uAdministrator.pas' {frmAdministrator},
  uDBAsset_UserLogin in '..\LibTTT\libDBScenario\uDBAsset_UserLogin.pas',
  uPelabuhan in '..\LibTTT\forms\uPelabuhan.pas' {frmPelabuhan},
  uBeach in '..\LibTTT\forms\uBeach.pas' {frmBeach},
  uTeluk in '..\LibTTT\forms\uTeluk.pas' {frmTeluk},
  uMainDynamicShape in 'uMainDynamicShape.pas',
  uMainStaticShape in 'uMainStaticShape.pas',
  uMLayerSelect in '..\LibTTT\forms\uMLayerSelect.pas' {MLayerSelect},
  uSimbolTaktis in '..\LibTTT\forms\uSimbolTaktis.pas' {frmSimbolTaktis},
  uDBAsset_FontTaktis in '..\LibTTT\libDBScenario\uDBAsset_FontTaktis.pas',
  ufmEmbarkLibrary in '..\LibTTT\forms\ufmEmbarkLibrary.pas' {fmEmbarkLibraryPickList},
  ufmEmbarkPositionInput in '..\LibTTT\forms\ufmEmbarkPositionInput.pas' {fmEmbarkPositionInput},
  uDBAsset_Embark_Library in '..\LibTTT\libDBScenario\uDBAsset_Embark_Library.pas',
  ufmEmbarkPlatformLibrary in '..\LibTTT\forms\ufmEmbarkPlatformLibrary.pas' {fmEmbarkPlatformLibrary},
  ufmEmbarkQuantityInput in '..\LibTTT\forms\ufmEmbarkQuantityInput.pas' {fmEmbarkQuantityInput},
  ufmBaseLocation in '..\LibTTT\forms\ufmBaseLocation.pas' {fmBaseLocation},
  ufmGroupPersonel in '..\LibTTT\forms\ufmGroupPersonel.pas' {fmGroupPersonel},
  ufmPersonelQuantityInput in '..\LibTTT\forms\ufmPersonelQuantityInput.pas' {fmPersonelQuantityInput},
  uBrigadePersonel in 'uBrigadePersonel.pas',
  uVectorVisual in '..\LibTTT\libVisual\uVectorVisual.pas',
  uMainStrategi in 'uMainStrategi.pas',
  uMainPlottingShape in 'uMainPlottingShape.pas',
  uDrawStrategi in 'uDrawStrategi.pas',
  uPlottingTemplateEditor in '..\LibTTT\forms\uPlottingTemplateEditor.pas' {fmPlottingTemplateEditor},
  uPlottingRecord in 'uPlottingRecord.pas',
  uDBAsset_Plotting_Definition in '..\LibTTT\libDBScenario\uDBAsset_Plotting_Definition.pas',
  uPlottingEditor in '..\LibTTT\forms\uPlottingEditor.pas' {fmPlottingEditor},
  ufmPlottingSelectListForm in '..\LibTTT\forms\ufmPlottingSelectListForm.pas' {fmPlottingSelectListForm},
  ufmPlottingTime in '..\LibTTT\forms\ufmPlottingTime.pas' {fmPlottingTime},
  uGameReport in '..\LibTTT\forms\uGameReport.pas' {frmGameReport},
  uDBAsset_GameReport in '..\LibTTT\libDBScenario\uDBAsset_GameReport.pas',
  uWaypointWindow in '..\LibTTT\forms\uWaypointWindow.pas' {frmWaypointWindow},
  uWaypointWindowEditor in '..\LibTTT\forms\uWaypointWindowEditor.pas' {frmWaypointWindowEditor},
  uWaypointSelect in '..\LibTTT\forms\uWaypointSelect.pas' {frmWaypointSelect},
  uCapability in '..\LibTTT\forms\uCapability.pas' {frmCapability},
  uCapabilityList in '..\LibTTT\forms\uCapabilityList.pas' {frmCapabilityList},
  uDBAsset_Capability in '..\LibTTT\libDBScenario\uDBAsset_Capability.pas',
  uGameAreaDefinition in '..\LibTTT\forms\uGameAreaDefinition.pas' {DefinitionArea},
  uFormDefinition in '..\LibTTT\forms\uFormDefinition.pas' {FormDefinition},
  uCreateDefinitionArea in '..\LibTTT\forms\uCreateDefinitionArea.pas' {CreateDefinitionArea},
  uTargetEditor in '..\LibTTT\forms\uTargetEditor.pas' {frmTargetEditor},
  ufmDefaultEmbark in '..\LibTTT\forms\ufmDefaultEmbark.pas' {Form1},
  GDIPAPI in '..\LibTTT\libGDIP\GDIPAPI.pas',
  GdiPlus in '..\LibTTT\libGDIP\GdiPlus.pas',
  GdiPlusHelpers in '..\LibTTT\libGDIP\GdiPlusHelpers.pas',
  GDIPOBJ in '..\LibTTT\libGDIP\GDIPOBJ.pas',
  ufmEmbarkTrackIDInput in '..\LibTTT\forms\ufmEmbarkTrackIDInput.pas' {fmEmbarkTrackIDInput},
  ufrmAvailableMissile in '..\LibTTT\forms\Weapon\ufrmAvailableMissile.pas' {frmAvailableMissile},
  ufrmAvailableTorpedo in '..\LibTTT\forms\Weapon\ufrmAvailableTorpedo.pas' {frmAvailableTorpedo},
  ufrmAvailableMine in '..\LibTTT\forms\Weapon\ufrmAvailableMine.pas' {frmAvailableMine},
  ufrmAvailableBomb in '..\LibTTT\forms\Weapon\ufrmAvailableBomb.pas' {frmAvailableBomb},
  ufrmAvailableGun in '..\LibTTT\forms\Weapon\ufrmAvailableGun.pas' {frmAvailableGun},
  ufrmAvailableRadar in '..\LibTTT\forms\Sensor\ufrmAvailableRadar.pas' {frmAvailableRadar},
  ufrmAvailableSonar in '..\LibTTT\forms\Sensor\ufrmAvailableSonar.pas' {frmAvailableSonar},
  ufrmAvailableSonobuoy in '..\LibTTT\forms\Sensor\ufrmAvailableSonobuoy.pas' {frmAvailableSonobuoy},
  ufrmAvailableESM in '..\LibTTT\forms\Sensor\ufrmAvailableESM.pas' {frmAvailableESM},
  ufrmAvailableMAD in '..\LibTTT\forms\Sensor\ufrmAvailableMAD.pas' {frmAvailableMAD},
  ufrmAvailableVehicle in '..\LibTTT\forms\Platform\ufrmAvailableVehicle.pas' {frmAvailableVehicle},
  ufrmAvailableMotion in '..\LibTTT\forms\Platform\ufrmAvailableMotion.pas' {frmAvailableMotion},
  ufrmAvailableRuntimePlatformLibrary in '..\LibTTT\forms\Other\ufrmAvailableRuntimePlatformLibrary.pas' {frmAvailableRuntimePlatformLibrary},
  ufrmAvailableOverlay in '..\LibTTT\forms\Other\ufrmAvailableOverlay.pas' {frmAvailableOverlay},
  ufrmAvailableLogistic in '..\LibTTT\forms\Other\ufrmAvailableLogistic.pas' {frmAvailableLogistic},
  ufrmAvailableTransport in '..\LibTTT\forms\Other\ufrmAvailableTransport.pas' {frmAvailableTransport},
  ufrmAvailableBase in '..\LibTTT\forms\Other\ufrmAvailableBase.pas' {frmAvailableBase},
  ufrmAvailableWaypoint in '..\LibTTT\forms\Other\ufrmAvailableWaypoint.pas' {frmAvailableWaypoint};

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfDBEditor, fDBEditor);
  Application.CreateForm(TdmTTT, dmTTT);
  Application.CreateForm(TfPredefinedSelect, fPredefinedSelect);
  Application.CreateForm(TfInfraredDecoyPickList, fInfraredDecoyPickList);
  Application.CreateForm(TfIRmount, fIRmount);
  Application.CreateForm(TfRadarIntervalSelect, fRadarIntervalSelect);
  Application.CreateForm(TfrmEnvi, frmEnvi);
  Application.CreateForm(TfrmEditScenario, frmEditScenario);
  Application.CreateForm(TfrmLogisticsList, frmLogisticsList);
  Application.CreateForm(TfrmLogistics, frmLogistics);
  Application.CreateForm(TfrmTacticalSymbol, frmTacticalSymbol);
  Application.CreateForm(TfrmUserLogin, frmUserLogin);
  Application.CreateForm(TfrmAdministrator, frmAdministrator);
  Application.CreateForm(TfrmPelabuhan, frmPelabuhan);
  Application.CreateForm(TfrmBeach, frmBeach);
  Application.CreateForm(TfrmTeluk, frmTeluk);
  Application.CreateForm(TMLayerSelect, MLayerSelect);
  Application.CreateForm(TfrmSimbolTaktis, frmSimbolTaktis);
  Application.CreateForm(TfmEmbarkLibraryPickList, fmEmbarkLibraryPickList);
  Application.CreateForm(TfmEmbarkPositionInput, fmEmbarkPositionInput);
  Application.CreateForm(TfmEmbarkLibraryPickList, fmEmbarkLibraryPickList);
  Application.CreateForm(TfmEmbarkPositionInput, fmEmbarkPositionInput);
  Application.CreateForm(TfmEmbarkPlatformLibrary, fmEmbarkPlatformLibrary);
  Application.CreateForm(TfmEmbarkQuantityInput, fmEmbarkQuantityInput);
  Application.CreateForm(TfmBaseLocation, fmBaseLocation);
  Application.CreateForm(TfmGroupPersonel, fmGroupPersonel);
  Application.CreateForm(TfmPersonelQuantityInput, fmPersonelQuantityInput);
  Application.CreateForm(TfmPlottingTemplateEditor, fmPlottingTemplateEditor);
  Application.CreateForm(TfmPlottingEditor, fmPlottingEditor);
  Application.CreateForm(TfmPlottingSelectListForm, fmPlottingSelectListForm);
  Application.CreateForm(TfmPlottingTime, fmPlottingTime);
  Application.CreateForm(TfrmGameReport, frmGameReport);
  Application.CreateForm(TfrmGameReport, frmGameReport);
  Application.CreateForm(TfrmGameReport, frmGameReport);
  Application.CreateForm(TfrmWaypointWindow, frmWaypointWindow);
  Application.CreateForm(TfrmWaypointWindowEditor, frmWaypointWindowEditor);
  Application.CreateForm(TfrmWaypointSelect, frmWaypointSelect);
  Application.CreateForm(TFormDefinition, FormDefinition);
  Application.CreateForm(TfrmCapability, frmCapability);
  Application.CreateForm(TCreateDefinitionArea, CreateDefinitionArea);
  Application.CreateForm(TfrmCapabilityList, frmCapabilityList);
  Application.CreateForm(TDefinitionArea, DefinitionArea);
  Application.CreateForm(TDefinitionArea, DefinitionArea);
  Application.CreateForm(TFormDefinition, FormDefinition);
  Application.CreateForm(TCreateDefinitionArea, CreateDefinitionArea);
  Application.CreateForm(TfrmTargetEditor, frmTargetEditor);
  Application.CreateForm(TfrmDefaultEmbark, frmDefaultEmbark);
  Application.CreateForm(TfmEmbarkTrackIDInput, fmEmbarkTrackIDInput);
  Application.CreateForm(TfrmAvailableMissile, frmAvailableMissile);
  Application.CreateForm(TfrmAvailableTorpedo, frmAvailableTorpedo);
  Application.CreateForm(TfrmAvailableMine, frmAvailableMine);
  Application.CreateForm(TfrmAvailableBomb, frmAvailableBomb);
  Application.CreateForm(TfrmAvailableGun, frmAvailableGun);
  Application.CreateForm(TfrmAvailableRadar, frmAvailableRadar);
  Application.CreateForm(TfrmAvailableSonar, frmAvailableSonar);
  Application.CreateForm(TfrmAvailableSonobuoy, frmAvailableSonobuoy);
  Application.CreateForm(TfrmAvailableESM, frmAvailableESM);
  Application.CreateForm(TfrmAvailableMAD, frmAvailableMAD);
  Application.CreateForm(TfrmAvailableVehicle, frmAvailableVehicle);
  Application.CreateForm(TfrmAvailableMotion, frmAvailableMotion);
  Application.CreateForm(TfrmAvailableRuntimePlatformLibrary, frmAvailableRuntimePlatformLibrary);
  Application.CreateForm(TfrmAvailableOverlay, frmAvailableOverlay);
  Application.CreateForm(TfrmAvailableLogistic, frmAvailableLogistic);
  Application.CreateForm(TfrmAvailableTransport, frmAvailableTransport);
  Application.CreateForm(TfrmAvailableBase, frmAvailableBase);
  Application.CreateForm(TfrmAvailableWaypoint, frmAvailableWaypoint);
  uSimDBEditor.StartInitialize;


  //Application.MainFormOnTaskbar := True;
  //Application.CreateForm(TfDBEditor, fDBEditor);
  Application.CreateForm(TfrmScenario, frmScenario);
  Application.CreateForm(TGroupAllocationWindowForm, GroupAllocationWindowForm);
  Application.CreateForm(TLinkWindowForm, LinkWindowForm);
  Application.CreateForm(TfPlatformDeploytment, fPlatformDeploytment);
  Application.CreateForm(TfrmDBSetting, frmDBSetting);
  Application.CreateForm(TfAvailableScenario, fAvailableScenario);
  Application.CreateForm(TfResorceAllocationSelect, fResorceAllocationSelect);
  Application.CreateForm(TfResourceAllocSelection, fResourceAllocSelection);
  Application.CreateForm(TPlatformDeploymentPickListForm, PlatformDeploymentPickListForm);
  Application.CreateForm(TResourceAllocationForm, ResourceAllocationForm);
  Application.CreateForm(TWaypointEditorPanelForm, WaypointEditorPanelForm);
  Application.CreateForm(TAddParticipantForm, AddParticipantForm);
  Application.CreateForm(TEventsWindowForm, EventsWindowForm);
  Application.CreateForm(TAddExCompChannelForm, AddExCompChannelForm);
  Application.CreateForm(TAddMemberForm, AddMemberForm);
  Application.CreateForm(TfEnvironmentsSelect, fEnvironmentsSelect);
  Application.CreateForm(TFormationEditorForm, FormationEditorForm);
  Application.CreateForm(TfFormationEditorPanel, FormationEditorPanelForm);
  Application.CreateForm(TFormationMemberForm, FormationMemberForm);
  Application.CreateForm(TFormationResourcesForm, FormationResourcesForm);
  Application.CreateForm(TFormationMemberForm, FormationMemberForm);
  Application.CreateForm(TfGameAreaList, fGameAreaList);
  Application.CreateForm(TExerciseAreaForm, ExerciseAreaForm);
  Application.CreateForm(TfEnvironmentSelect, fEnvironmentSelect);
  Application.CreateForm(TfGameDefaults, fGameDefaults);
  Application.CreateForm(TfVehicleSelect, fVehicleSelect);
  Application.CreateForm(TfVehicleName, fVehicleName);
  Application.CreateForm(TfMissileSelect, fMissileSelect);
  Application.CreateForm(TfTorpedo, fTorpedo);
  Application.CreateForm(TfSonobuoySelect, fSonobuoySelect);
  Application.CreateForm(TfMine, fMine);
  Application.CreateForm(TfSatellite, fSatellite);
  Application.CreateForm(TfReferencePointEditor, fReferencePointEditor);
  Application.CreateForm(TEnvironmentForm, EnvironmentForm);
  Application.CreateForm(TfGameAreaSelection, fGameAreaSelection);
  Application.CreateForm(TEnvironmentCharacteristicsWindowForm, EnvironmentCharacteristicsWindowForm);
  Application.CreateForm(TGeographicalFeatureImportForm, GeographicalFeatureImportForm);
  Application.CreateForm(TSatellitePlatformForm, SatellitePlatformForm);
  Application.CreateForm(TSatelliteListForm, SatelliteListForm);
  Application.CreateForm(TfInputName, fInputName);
  Application.CreateForm(TfPISelect, fPISelect);
  Application.CreateForm(TfmotionSingleList, fmotionSingleList);
  Application.CreateForm(TMotionHorizontalForm, MotionHorizontalForm);
  Application.CreateForm(TRadarIntervalListForm, RadarIntervalListForm);
  Application.CreateForm(TfRadarIntervalSetup, fRadarIntervalSetup);
  Application.CreateForm(TRadarJammerMountForm, RadarJammerMountForm);
  Application.CreateForm(TRadarMountForm, RadarMountForm);
  Application.CreateForm(TfRadarPickList, fRadarPickList);
  Application.CreateForm(TfLandmassEditor, fLandmassEditor);
  Application.CreateForm(TfEditGameCenter, fEditGameCenter);
  Application.CreateForm(TfCharacteristicLandmass, fCharacteristicLandmass);
  Application.CreateForm(TfSonarList, fSonarList);
  Application.CreateForm(TfSonar, fSonar);
  Application.CreateForm(TfVehiclePicklistFilter, fVehiclePicklistFilter);
  Application.CreateForm(TfVehicleSelect, fVehicleSelect);
  Application.CreateForm(TfVehicleAttributeWindow, fVehicleAttributeWindow);
  Application.CreateForm(TfSonobuoyDoublePickList, fSonobuoyDoublePickList);
  Application.CreateForm(TfGunSelect, fGunSelect);
  Application.CreateForm(TfRadarJammerSelect, fRadarJammerSelect);
  Application.CreateForm(TfAirBubbleSelect, fAirBubbleSelect);
  Application.CreateForm(TfAccousticDeploySelect, fAccousticDeploySelect);
  Application.CreateForm(TfDefensiveJammerSelect, fDefensiveJammerSelect);
  Application.CreateForm(TfTJDecoySelect, fTJDecoySelect);
  Application.CreateForm(TfFloatingDecoySelect, fFloatingDecoySelect);
  Application.CreateForm(TfChaffSelect, fChaffSelect);
  Application.CreateForm(TIFFMountForm, IFFMountForm);
  Application.CreateForm(TMineMountForm, MineMountForm);
  Application.CreateForm(TMissileLaunchersForm, MissileLaunchersForm);
  Application.CreateForm(TMissileMountForm, MissileMountForm);
  Application.CreateForm(TTorpedoMountsForm, TorpedoMountsForm);
  Application.CreateForm(TGunMountForm, GunMountForm);
  Application.CreateForm(TBombDepthChargeMountForm, BombDepthChargeMountForm);
  Application.CreateForm(TTorpedoLauncherForm, TorpedoLauncherForm);
  Application.CreateForm(TRadarJammerMountForm, RadarJammerMountForm);
  Application.CreateForm(TAirBubblesMounts, AirBubblesMounts);
  Application.CreateForm(TAccousticDecoy, AccousticDecoy);
  Application.CreateForm(TSonobuoyMountForm, SonobuoyMountForm);
  Application.CreateForm(TTowedJammerMountForm, TowedJammerMountForm);
  Application.CreateForm(TFloatingMountForm, FloatingMountForm);
  Application.CreateForm(TChaffMountForm, ChaffMountForm);
  Application.CreateForm(TVisualDetectorMountForm, VisualDetectorMountForm);
  Application.CreateForm(TESMMountForm,ESMMountForm);
  //Application.CreateForm(TfrmTacticalDisplay, frmTacticalDisplay);
  //Application.CreateForm(TfrmLaunchPlaform, frmLaunchPlaform);
  //Application.CreateForm(TfrmWaypointEditor, frmWaypointEditor);
  //Application.CreateForm(TfrmRPLibrary, frmRPLibrary);
  //Application.CreateForm(TfmEMCON, fmEMCON);
  //Application.CreateForm(TfChannelComSelect, fChannelComSelect);
  Application.CreateForm(TfVehicleList, fVehicleList);
  Application.CreateForm(TCommunicationsChannelsForm, CommunicationsChannelsForm);
  Application.CreateForm(TfmOverlayTemplateEditor, fmOverlayTemplateEditor);
  Application.CreateForm(TOverlayEditorForm, OverlayEditorForm);
  Application.CreateForm(TfStudentRoleListWindow, fStudentRoleListWindow);
  Application.CreateForm(TfStudentRole, fStudentRole);
  Application.CreateForm(TfEditRoleList, fEditRoleList);
  Application.CreateForm(TfGameDefault, fGameDefault);
  Application.CreateForm(TfOtherSingle, fOtherSingle);
  Application.CreateForm(TfCountermeasureSingle, fCountermeasureSingle);
  Application.CreateForm(TfAcousticDecoy, fAcousticDecoy);
  Application.CreateForm(TfAirBubble, fAirBubble);
  Application.CreateForm(TfChaff, fChaff);
  Application.CreateForm(TfFloatingDecoy, fFloatingDecoy);
  Application.CreateForm(TfDefensiveJammer, fDefensiveJammer);
  Application.CreateForm(TfTowedjammerDecoy, fTowedjammerDecoy);
  Application.CreateForm(TfRadarJammer, fRadarJammer);
  Application.CreateForm(TWaypointEditorPanelForm, WaypointEditorPanelForm);
  Application.CreateForm(TfrmProgress, frmProgress);
  Application.CreateForm(TfPlatformLibraryDoublePickList, fPlatformLibraryDoublePickList);
  Application.CreateForm(TfGroupMemberSelection, fGroupMemberSelection);
  Application.CreateForm(TfRuntimePlatform, fRuntimePlatform);
  //  Application.CreateForm(TfrmTacticalDisplay, frmTacticalDisplay);
  Application.CreateForm(TfPictureCentreSettings, fPictureCentreSettings);
  Application.CreateForm(TfTrackHistory, fTrackHistory);
  Application.CreateForm(TfrmHandle, frmHandle);
  Application.CreateForm(TfGroupSelect, fGroupSelect);
  Application.CreateForm(TfrmProgress, frmProgress);
  //  Application.CreateForm(TOverlayTextEntryForm, OverlayTextEntryForm);
  Application.CreateForm(TfOverlaySelect, fOverlaySelect);
  Application.CreateForm(TfmOverlayTemplateEditor, fmOverlayTemplateEditor);
  Application.CreateForm(TOverlayEditorForm, OverlayEditorForm);
  //  Application.CreateForm(TfRadar, fRadar);
  Application.CreateForm(TSonobuoyWindowForm, SonobuoyWindowForm);
  Application.CreateForm(TSonarMountForm, SonarMountForm);
  Application.CreateForm(TfEO, fEO);
  Application.CreateForm(TElectroOpticalMountForm, ElectroOpticalMountForm);
  Application.CreateForm(TElectroOpticalForm, ElectroOpticalForm);
  Application.CreateForm(TMADMount, MADMount);
  Application.CreateForm(TfMADPicklist, fMADPicklist);
  Application.CreateForm(TMADForm, MADForm);
  Application.CreateForm(TfSonarPicklist, fSonarPicklist);
  //Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TSonarMountForm, SonarMountForm);
  Application.CreateForm(TfEO, fEO);
  Application.CreateForm(TElectroOpticalMountForm, ElectroOpticalMountForm);
  Application.CreateForm(TElectroOpticalForm, ElectroOpticalForm);
  Application.CreateForm(TMADForm, MADForm);
  Application.CreateForm(TfMADPicklist, fMADPicklist);
  //Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TfRadarSummary, fRadarSummary);
  Application.CreateForm(TfESMPickList, fESMPickList);
  Application.Createform(TfESMWindow,fESMWindow);
  Application.CreateForm(TfSonobuoySingle,fSonobuoySingle);
  Application.CreateForm(TfSnrVsPod, fSnrVsPod);
  Application.CreateForm(TfPredefinedPattern, fPredefinedPattern);
  Application.CreateForm(TBlindZonesAttachmentForm, BlindZonesAttachmentForm);
  Application.CreateForm(TfSonarDefList, fSonarDefList);
  Application.CreateForm(TfSonarDoubleList, fSonarDoubleList);
  Application.CreateForm(TfWeaponSingle, fWeaponSingle);
  Application.CreateForm(TfMissileSummary, fMissileSummary);
  Application.CreateForm(TfTorpedoSummary, fTorpedoSummary);
  Application.CreateForm(TfMineSummary, fMineSummary);
  Application.CreateForm(TfBombWindow, fBombWindow);
  Application.CreateForm(TfScrCapture, fScrCapture);
  Application.CreateForm(TfCaptureRes, fCaptureRes);
  Application.CreateForm(TfGunSummary, fGunSummary);
  Application.CreateForm(TfRAList, fRAList);
  Application.CreateForm(TfChannelComList, fChannelComList);
  Application.CreateForm(TfBombDoublePickList, fBombDoublePickList);
  Application.CreateForm(TfRadarDoublePickList, fRadarDoublePickList);
  Application.CreateForm(TfMADDoublePickList, fMADDoublePickList);
  Application.CreateForm(TfESMDoublePickList, fESMDoublePickList);
  Application.CreateForm(TfEODoublePickList, fEODoublePickList);
  Application.CreateForm(TfIFFDoublePickList, fIFFDoublePickList);
  Application.CreateForm(TfVDDoublePickList, fVDDoublePickList);
  Application.CreateForm(TfMotionDouble,fMotionDouble);
  Application.CreateForm(TChaffAssets, ChaffAssets);
  Application.CreateForm(TfChaffLauncher, fChaffLauncher);
  Application.CreateForm(TChooseMap, ChooseMap);
  Application.CreateForm(TENCSelect, ENCSelect);
  Application.CreateForm(TfLauncherList, fLauncherList);
  Application.CreateForm(TUsage, fUsage);
  Application.CreateForm(TfTrainingPattern, fTrainingPattern);
  Application.CreateForm(TfSensor, fSensor);
  Application.CreateForm(TfWeaponDoubleList, fWeaponDoubleList);
  Application.CreateForm(TEffectsTable, fEffectsTable);
  Application.CreateForm(TProbabilityGraph, fProbabilityGraph);
  Application.CreateForm(TAccousticDecoyProb, fAccousticDecoyProb);
  Application.CreateForm(TIFFMode, fIFFMode);
  Application.CreateForm(TEditEvents, EditEvents);
  Application.CreateForm(TfInfraredDecoy, fInfraredDecoy);
  Application.CreateForm(TfReferencePointNew, fReferencePointNew);
  Application.CreateForm(TfEmbarkedSelect, fEmbarkedSelect);
  Application.CreateForm(TfrmHelicopterLimitations, frmHelicopterLimitations);
  Application.CreateForm(TRadarCoverage, RadarCoverage);
//  uSimDBEditor.StartInitialize;

  Application.Run;
end.
