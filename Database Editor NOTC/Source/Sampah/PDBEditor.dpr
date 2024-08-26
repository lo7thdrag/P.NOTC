program PDBEditor;

uses
  Forms,
  ufDBEditor in '..\LibTTT\forms\ufDBEditor.pas' {fDBEditor},
  ufScenario in '..\LibTTT\forms\ufScenario.pas' {frmScenario},
  uGroupAllocationWindow in '..\LibTTT\forms\uGroupAllocationWindow.pas' {GroupAllocationWindowForm},
  uLinkWindow in '..\LibTTT\forms\uLinkWindow.pas' {LinkWindowForm},
  uPlatformDeployment in '..\LibTTT\forms\uPlatformDeployment.pas' {fPlatformDeploytment},
  uLibSettingTTT in '..\LibTTT\uLibSettingTTT.pas',
  ufDBSetting in '..\LibTTT\forms\ufDBSetting.pas' {frmDBSetting},
  uDataModuleTTT in '..\LibTTT\forms\uDataModuleTTT.pas' {dmTTT: TDataModule},
  uIniFilesProcs in '..\SimFramework\LibBaseUtils\uIniFilesProcs.pas',
  uCodecBase64 in '..\SimFramework\LibBaseUtils\StringUtils\uCodecBase64.pas',
  tttData in '..\LibTTT\libDBScenario\tttData.pas',
  newClassASTT in '..\LibTTT\libDBScenario\newClassASTT.pas',
  uDBAssetObject in '..\LibTTT\libDBScenario\uDBAssetObject.pas',
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
  uSimManager in '..\LibTTT\uSimManager.pas',
  uDBScenario in '..\LibTTT\libDBScenario\uDBScenario.pas',
  uVirtualTime in '..\SimFramework\LibBaseUtils\Counter\uVirtualTime.pas',
  uThreadTimer in '..\SimFramework\LibBaseUtils\Counter\uThreadTimer.pas',
  uT3SimManager in '..\LibTTT\uT3SimManager.pas',
  uCompassVisual in '..\LibTTT\libVisual\uCompassVisual.pas',
  uMapXHandler in '..\LibTTT\uMapXHandler.pas',
  uPlatformDeploymentPickList in '..\LibTTT\forms\uPlatformDeploymentPickList.pas' {PlatformDeploymentPickListForm},
  uResourceAllocation in '..\LibTTT\forms\uResourceAllocation.pas' {ResourceAllocationForm},
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
  uWaypointEditorPanel in '..\LibTTT\forms\uWaypointEditorPanel.pas' {WaypointEditorPanelForm},
  uAddParticipant in '..\LibTTT\forms\uAddParticipant.pas' {AddParticipantForm},
  uEvents in '..\LibTTT\forms\uEvents.pas' {EventsWindowForm},
  uAddExCompChannel in '..\LibTTT\forms\uAddExCompChannel.pas' {AddExCompChannelForm},
  uAddMember in '..\LibTTT\forms\uAddMember.pas' {AddMemberForm},
  uDBDefault_Var in '..\LibTTT\libDBScenario\uDBDefault_Var.pas',
  uDBCloud_Effect in '..\LibTTT\libDBScenario\uDBCloud_Effect.pas',
  uFEnvironmentSelection in '..\LibTTT\forms\uFEnvironmentSelection.pas' {fEnvironmentsSelect},
  uFormationEditor in '..\LibTTT\forms\uFormationEditor.pas' {FormationEditorForm},
  uFormationEditorPanel in '..\LibTTT\forms\uFormationEditorPanel.pas' {FormationEditorPanelForm},
  uFormatioResourceList in '..\LibTTT\forms\uFormatioResourceList.pas' {FormationResourcesForm},
  uFormationMemberList in '..\LibTTT\forms\uFormationMemberList.pas' {FormationMemberForm},
  uExerciseArea in '..\LibTTT\forms\uExerciseArea.pas' {ExerciseAreaForm},
  uDBAsset_GameEnvironment in '..\LibTTT\libDBScenario\uDBAsset_GameEnvironment.pas',
  uGameDefaultSelect in '..\LibTTT\forms\uGameDefaultSelect.pas' {fGameDefaults},
  uVehicleSelect in '..\LibTTT\forms\uVehicleSelect.pas' {fVehicleSelect},
  uEnvironmentSelect in '..\LibTTT\forms\uEnvironmentSelect.pas' {fEnvironmentSelect},
  uInputName in '..\LibTTT\forms\uInputName.pas' {fInputName},
  uMissileSelect in '..\LibTTT\forms\uMissileSelect.pas' {fMissileSelect},
  uTorpedoSelect in '..\LibTTT\forms\uTorpedoSelect.pas' {fTorpedo},
  uSonobuoySelect in '..\LibTTT\forms\uSonobuoySelect.pas' {fSonobuoy},
  uMineSelect in '..\LibTTT\forms\uMineSelect.pas' {fMine},
  uSatelliteSelect in '..\LibTTT\forms\uSatelliteSelect.pas' {fSatellite},
  uDBAsset_MotionCharacteristics in '..\LibTTT\libDBScenario\uDBAsset_MotionCharacteristics.pas',
  uReferencePointEditor in '..\LibTTT\forms\uReferencePointEditor.pas' {ReferencePointEditorForm},
  uEnvironment in '..\LibTTT\forms\uEnvironment.pas' {EnvironmentForm},
  uGameAreaSelection in '..\LibTTT\forms\uGameAreaSelection.pas' {fGameAreaSelection},
  uEnvironmentCharacteristicsWindow in '..\LibTTT\forms\uEnvironmentCharacteristicsWindow.pas' {EnvironmentCharacteristicsWindowForm},
  uSimDBEditor in 'uSimDBEditor.pas',
  uVehiclePicklistFilter in '..\LibTTT\forms\uVehiclePicklistFilter.pas' {fVehiclePicklistFilter},
  uTCPData_TTT in '..\LibTTT\netTTT\uTCPData_TTT.pas',
  uTCPDatatype in '..\SimFramework\LibNets\NetComponent\uTCPDatatype.pas',
  uPacketRegister in '..\SimFramework\LibNets\NetComponent\uPacketRegister.pas',
  uGameAreaList in '..\LibTTT\forms\uGameAreaList.pas' {fGameAreaList},
  uGeographicalFeatureImport in '..\LibTTT\forms\uGeographicalFeatureImport.pas' {GeographicalFeatureImportForm},
  uVehicleAttributeWindow in '..\LibTTT\forms\uVehicleAttributeWindow.pas' {fVehicleAttributeWindow},
  uMotion in '..\LibTTT\forms\uMotion.pas' {MotionHorizontalForm},
  uLandmassEditor in '..\LibTTT\forms\uLandmassEditor.pas' {fLandmassEditor},
  drawRec in '..\LibTTT\forms\drawRec.pas' {fEditGameCenter},
  uSatellitePlatform in '..\LibTTT\forms\uSatellitePlatform.pas' {SatellitePlatformForm},
  uMotionSingleList in '..\LibTTT\forms\uMotionSingleList.pas' {fmotionSingleList},
  uMotionDoubleList in '..\LibTTT\forms\uMotionDoubleList.pas' {fMotionDouble},
  uSensorDoubleList in '..\LibTTT\forms\uSensorDoubleList.pas' {fSensor},
  uWeaponDoubleList in '..\LibTTT\forms\uWeaponDoubleList.pas' {fWeaponDoubleList},
  uCharacteristicLandmass in '..\LibTTT\forms\uCharacteristicLandmass.pas' {fCharacteristicLandmass},
  uSatelliteList in '..\LibTTT\forms\uSatelliteList.pas' {SatelliteListForm},
  uRadarPickList in '..\LibTTT\forms\uRadarPickList.pas' {fRadarPickList},
  uRadarSummary in '..\LibTTT\forms\uRadarSummary.pas' {fRadarSummary},
  uSonarMount in '..\LibTTT\forms\uSonarMount.pas' {SonarMountForm},
  uSonar in '..\LibTTT\forms\uSonar.pas' {fSonar},
  uSonarPicklist in '..\LibTTT\forms\uSonarPicklist.pas' {fSonarPicklist},
  uESMPickList in '..\LibTTT\forms\uESMPickList.pas' {fESMPickList},
  uESMWindow in '..\LibTTT\forms\uESMWindow.pas' {fESMWindow},
  uEOPicklist in '..\LibTTT\forms\uEOPicklist.pas' {fEO},
  uElectroOpticalDetector in '..\LibTTT\forms\uElectroOpticalDetector.pas' {ElectroOpticalForm},
  uMADWindow in '..\LibTTT\forms\uMADWindow.pas' {MADForm},
  uMADPicklist in '..\LibTTT\forms\uMADPicklist.pas' {fMADPicklist},
  uSonobuoyWindow in '..\LibTTT\forms\uSonobuoyWindow.pas' {SonobuoyWindowForm},
  uSonobuoySinglePickList in '..\LibTTT\forms\uSonobuoySinglePickList.pas' {fSonobuoySelect},
  uDBAssets_SubAreaEnviroDefinition in '..\LibTTT\libDBScenario\uDBAssets_SubAreaEnviroDefinition.pas';

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmTTT, dmTTT);
  Application.CreateForm(TfDBEditor, fDBEditor);
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
  Application.CreateForm(TFormationEditorPanelForm, FormationEditorPanelForm);
  Application.CreateForm(TFormationResourcesForm, FormationResourcesForm);
  Application.CreateForm(TFormationMemberForm, FormationMemberForm);
  Application.CreateForm(TfGameAreaList, fGameAreaList);
  Application.CreateForm(TExerciseAreaForm, ExerciseAreaForm);
  Application.CreateForm(TfEnvironmentSelect, fEnvironmentSelect);
  Application.CreateForm(TfGameDefaults, fGameDefaults);
  Application.CreateForm(TfVehicleSelect, fVehicleSelect);
  Application.CreateForm(TfEnvironmentSelect, fEnvironmentSelect);
  Application.CreateForm(TfInputName, fInputName);
  Application.CreateForm(TfinputName, finputName);
  Application.CreateForm(TfInputName, fInputName);
  Application.CreateForm(TfMissileSelect, fMissileSelect);
  Application.CreateForm(TfMissileSelect, fMissileSelect);
  Application.CreateForm(TfTorpedo, fTorpedo);
  Application.CreateForm(TfSonobuoy, fSonobuoy);
  Application.CreateForm(TfMine, fMine);
  Application.CreateForm(TfSatellite, fSatellite);
  Application.CreateForm(TReferencePointEditorForm, ReferencePointEditorForm);
  Application.CreateForm(TEnvironmentForm, EnvironmentForm);
  Application.CreateForm(TfGameAreaSelection, fGameAreaSelection);
  Application.CreateForm(TEnvironmentCharacteristicsWindowForm, EnvironmentCharacteristicsWindowForm);
  Application.CreateForm(TfVehiclePicklistFilter, fVehiclePicklistFilter);
  Application.CreateForm(TfVehicleAttributeWindow, fVehicleAttributeWindow);
  Application.CreateForm(TfGameAreaList, fGameAreaList);
  Application.CreateForm(TGeographicalFeatureImportForm, GeographicalFeatureImportForm);
  Application.CreateForm(TfVehicleAttributeWindow, fVehicleAttributeWindow);
  Application.CreateForm(TMotionHorizontalForm, MotionHorizontalForm);
  Application.CreateForm(TfLandmassEditor, fLandmassEditor);
  Application.CreateForm(TfEditGameCenter, fEditGameCenter);
  Application.CreateForm(TSatelliteListForm, SatelliteListForm);
  Application.CreateForm(TSatellitePlatformForm, SatellitePlatformForm);
  Application.CreateForm(TfmotionSingleList, fmotionSingleList);
  Application.CreateForm(TfMotionDouble, fMotionDouble);
  Application.CreateForm(TfSensor, fSensor);
  Application.CreateForm(TfWeaponDoubleList, fWeaponDoubleList);
  Application.CreateForm(TfCharacteristicLandmass, fCharacteristicLandmass);
  Application.CreateForm(TSatelliteListForm, SatelliteListForm);
  Application.CreateForm(TSatelliteListForm, SatelliteListForm);
  Application.CreateForm(TfRadarPickList, fRadarPickList);
  Application.CreateForm(TfRadarSummary, fRadarSummary);
  Application.CreateForm(TSonarMountForm, SonarMountForm);
  Application.CreateForm(TfSonar, fSonar);
  Application.CreateForm(TfSonarPicklist, fSonarPicklist);
  Application.CreateForm(TfESMPickList, fESMPickList);
  Application.CreateForm(TfESMWindow, fESMWindow);
  Application.CreateForm(TfEO, fEO);
  Application.CreateForm(TElectroOpticalForm, ElectroOpticalForm);
  Application.CreateForm(TMADForm, MADForm);
  Application.CreateForm(TfMADPicklist, fMADPicklist);
  Application.CreateForm(TSonobuoyWindowForm, SonobuoyWindowForm);
  Application.CreateForm(TfSonobuoySelect, fSonobuoySelect);
  uSimDBEditor.StartInitialize;

  Application.Run;
end.
