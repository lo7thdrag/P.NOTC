unit uDBScenario;

interface

uses
   Classes,
   tttData, newClassASTT,  uDataModuleTTT, uDBAssetObject,uDBAsset_Cubicle,
   uDBAsset_Deploy,uDBFormation,uDBLink,
   uDBAsset_GameEnvironment,uDBAsset_Geo;

type

  TT3DBScenario = class
  protected
    function  getMemberInteger(const index: integer): Integer;
    function  getMemberString(const index: integer): string;
    function  getMemberfloat(const index: integer): double;

  public
    Scenario_def      : TScenario_Definition;
    Resource_alloc    : TResource_Allocation;
    Platform_Insts    : TList; //of TPlatform_Instance

    Formation         : TList;
    Platform_Inst     : TList;
    Links             : TList;
    Platform_Ins      : TList;
    RuntimePlatformLibrary : TList;

    GameEnvironment   : TGame_Environment_Definition;
    GeoAreaDef        : TGeo_Area_Def;
    GeoPoint          : TList;
    GeoEvent          : TList;

    CubiclesGroups    : TList; // TCubicle_Group;

    AssetDeployment   : TAsset_Deployment ;
    MapGeosetName     : string;


  public
    constructor Create;
    destructor Destroy; override;

    procedure ClearScenario;
    procedure LoadFromDB(const id: Integer);

  public
    property ScenarioIndex: Integer index 1 read  getMemberInteger;
    property ScenarioName: string   index 1 read  getMemberString;

    property ResourceAllocIndex: Integer index 2 read  getMemberInteger;
    property IdCubicle: integer index 3 read getMemberInteger;

  end;


implementation

uses
  SysUtils, uSimContainers, ufProgress;
{ TT3DBScenario }


constructor TT3DBScenario.Create;
begin

  Scenario_def      := TScenario_Definition.Create;
  Resource_alloc    := TResource_Allocation.Create;
  AssetDeployment   := TAsset_Deployment.Create;
  Formation         := TList.Create;
  Platform_Inst     := TList.Create;
  Links             := TList.Create;
  Platform_Ins      := TList.Create;
  GeoPoint          := TList.Create;
  GeoEvent          := TList.Create;
  RuntimePlatformLibrary := TList.Create;

  Platform_Insts    := TList.Create;
  GameEnvironment   := TGame_Environment_Definition.Create;
  GeoAreaDef        := TGeo_Area_Def.Create;

  CubiclesGroups    := TList.Create;

end;

destructor TT3DBScenario.Destroy;
begin
  GameEnvironment.Free;

  if Assigned(Scenario_def) then
    FreeAndNil(Scenario_def);

  if Assigned(Resource_alloc) then
    FreeAndNil(Resource_alloc);

  if Assigned(Platform_Insts) then begin

//    ClearAndFreeItems(Platform_Insts);
    FreeAndNil(Platform_Insts);

  if Assigned(CubiclesGroups) then
    FreeAndNil(CubiclesGroups);

  if Assigned(AssetDeployment) then
    FreeAndNil(AssetDeployment);

  if Assigned(GeoAreaDef) then
    FreeAndNil(GeoAreaDef);

  end;
end;

function TT3DBScenario.getMemberInteger(const index: integer): Integer;
begin
  Result := -1;
  case index of
    1 : if Assigned(Scenario_def) then
      Result := Scenario_def.FData.Scenario_Index;
    2 : if Assigned(Scenario_def) then
      Result := Scenario_def.FData.Resource_Alloc_Index;

  end;
end;

function TT3DBScenario.getMemberfloat(const index: integer): double;
begin
   Result := 0;
end;


function TT3DBScenario.getMemberString(const index: integer): string;
begin

end;
procedure TT3DBScenario.ClearScenario;
begin
  ClearAndFreeItems(Platform_Insts);

end;

procedure TT3DBScenario.LoadFromDB(const id: Integer);
var i, ra_id          : Integer;
    vIndex,dIndex     : Integer;
    pi         : TPlatform_Instance;
    cub        : TCubicle_Group_Assignment;

    form       : TFormation;
    link       : TLink;

begin
  ClearScenario;

  frmProgress := TfrmProgress.Create(nil);

  if not dmTTT.GetScenario(id, scenario_def ) then
    Exit;

  frmProgress.Caption := 'Loading Scenario ' +
   scenario_def.FData.Scenario_Identifier + '  from database';

  if not dmTTT.GetResourceAlloc(ResourceAllocIndex, Resource_alloc ) then
    Exit;


  ra_id := ResourceAllocIndex;

  if not dmTTT.GetAssetDeployment(id, AssetDeployment) then
    Exit;

// 2.1 platform instance
  dmTTT.getAllPlatFormInstance(ResourceAllocIndex, Platform_Insts );
  dmTTT.getAllRuntimePlatform(ResourceAllocIndex, RuntimePlatformLibrary);

  frmProgress.MaxJob := Platform_Insts.Count;

  for I := 0 to Platform_Insts.Count - 1 do begin
    pi := Platform_Insts[i];

    frmProgress.increase( pi.FData.Instance_Name);
    with pi do begin
      //Vehicle_Index
      dmTTT.GetVehicle_Definition(pi.FData.Vehicle_Index, Pi.Vehicle);

//      dmTTT.GetSatellite_Definition(pi.Satellite.FData.Satellite_Index, Pi.Satellite);
      dmTTT.GetMotion_Characteristics(pi.Vehicle.FData.Motion_Characteristics, Pi.Motion);
      //Missile_Index
      //Torpedo_Index
      //Mine_Index
      //Hybrid_Index
      //Satellite_Index
      //Sonobuoy_Index


      with pi.Vehicle do begin
        vIndex := Pi.FData.Vehicle_Index;
        //sensor
        dmTTT.getAllEO_On_Board(vIndex,0,             pi.Vehicle.EOSensors);
        dmTTT.getAllESM_On_Board(vIndex,0,            pi.Vehicle.ESMSensors);
        dmTTT.getAllIFF_Sensor_On_Board(vIndex,0,     pi.Vehicle.IFFSensors);
        dmTTT.getAllMAD_Sensor_On_Board(vIndex,0,     pi.Vehicle.MADSensors);
        dmTTT.getAllVisual_Sensor_On_Board(vIndex,0,  pi.Vehicle.Visualsensors);
        dmTTT.getAllFCR_On_Board(vIndex,              pi.Vehicle.FCRSensors);

        dmTTT.GetAllRadar_On_Board(vIndex,0, pi.Vehicle.Radars);
        dmTTT.GetAllSonar_On_Board(vIndex,0, pi.Vehicle.Sonars);

        //weapon fit on Board
        dmTTT.getAllMissile_OnBoard(vIndex,0,     Pi.Vehicle.Missiles  );
        dmTTT.getAllTorpedo_OnBoard(vIndex,0,    Pi.Vehicle.Torpedos  );
        dmTTT.GetHybrid_Definition(vIndex,      Pi.Vehicle.Hybrids   );
        dmTTT.getAllMines_OnBoard(vIndex,0 ,      Pi.Vehicle.Mines );
        dmTTT.GetAllBomb(vIndex,                Pi.Vehicle.Bombs);
        dmTTT.GetAllGun(vIndex,                 Pi.Vehicle.Guns);


        dmTTT.getAllAcoustic_Decoy_On_Board(vIndex,     pi.Vehicle.Acoustic_Decoys);
        dmTTT.getAllAir_Bubble_Mount(vIndex,            pi.Vehicle.Air_Bubble_Mount);
        dmTTT.getAllChaff_On_Board(vIndex,              pi.Vehicle.Chaffs);
        dmTTT.getAllChaff_Launcher_On_Board(vIndex,     pi.Vehicle.Chaff_Launchers);
        dmTTT.getAllDefensive_Jammer_On_Board(vIndex,   pi.Vehicle.Defensive_Jammers);
        dmTTT.getAllFloating_Decoy_On_Board(vIndex,     pi.Vehicle.Floating_Decoys);
        dmTTT.getAllInfrared_Decoy_On_Board(vIndex,     pi.Vehicle.Infrared_Decoys);
        dmTTT.getAllJammer_On_Board(vIndex,             pi.Vehicle.Jammers);
        dmTTT.getAllPoint_Effect_On_Board(vIndex,       pi.Vehicle.Point_Effects);
        dmTTT.getAllTowed_Jammer_Decoy_On_Board(vIndex, pi.Vehicle.Towed_Jammer_Decoys);
        dmTTT.getHosted_Platform(vIndex,0,                pi.Vehicle.Hosted_Platform);
        dmTTT.getAllSonobuoy_On_Board(vIndex,0,     Pi.Vehicle.Sonobuoy );

        InitWaypoint;

      end;
{      dmTTT.GetMine_Definition(pi.FData.Mine_Index   ,          Pi.Mines    );
      dmTTT.GetSatellite_Definition(pi.FData.Satellite_Index,   Pi.Satellite);
}   end;
    pi.InitData;

  end;

  dIndex  := AssetDeployment.FData.Deployment_Index;

  dmTTT.GetFormationDefinition(dIndex, Formation);

  for I := 0 to Formation.Count - 1 do
  begin
    form := Formation[i];

    with form do begin
      dmTTT.GetFormationAssignment(form,Platform_Inst ) ;
    end;
  end;

  dmTTT.GetLinkDefinition(dIndex, Links);
  for I := 0 to Links.Count - 1 do
  begin
    link  := Links[i];
      with link do begin
        dmTTT.GetLinkParticipant(link, Platform_Ins);
      end;
  end;

  // 2.2 from resource alloc

  dmTTT.GetGame_Environment_Definition(Resource_alloc.FData.Game_Enviro_Index,
    GameEnvironment);

  dmTTT.GetGame_Area_DefByID(GameEnvironment.FData.Game_Area_Index, GameEnvironment);

  MapGeosetName := GameEnvironment.FGameArea.Game_Area_Identifier + '\' +
  GameEnvironment.FGameArea.Game_Area_Identifier + '.gst';

  dmTTT.GetGeoAreaDefinition(GameEnvironment.FData.Game_Area_Index, GeoPoint);

  GameEnvironment.calculateMaxPowerScaleArea;

  for I := 0 to GeoPoint.Count - 1 do
  begin

  end;

 // 2.3

  dmTTT.getCubicle_GroupsByResource(ResourceAllocIndex, 0, CubiclesGroups);

  for I := 0 to CubiclesGroups.Count - 1 do begin
    cub := CubiclesGroups[i];
    cub.Cubicle_Group.FData := cub.FData;
    dmTTT.getCubicle_GroupMember(cub.Cubicle_Group,  Platform_Insts);
  end;

  frmProgress.Free;


end;



end.
