unit uDBScenario;

interface

uses
   Classes,
   tttData, newClassASTT,  uDataModuleTTT, uDBAssetObject,
   uDBAsset_Deploy, uDBFormation, uDBLink,
   uDBAsset_GameEnvironment, uDBAsset_Geo,  uDBCubicles,
   uDBAsset_Reference_Point, uLibSettingTTT, uDBGame_Defaults, Windows,
   uFormationManager, Generics.Collections;
type

  TT3CubicleChanel = class
  private
  public
    GroupID : integer;
    GroupName : string;
    ListExternalChannel : TList;
    constructor Create;
    destructor Destroy; override;
  end;

  TT3DBScenario = class
  private
    FOnAssignedPlatform: TNotifyEvent;
    FOnGetExternalCom: TNotifyEvent;
    FDefaultNonRealPlatform: TPlatform_Instance;
    FDictionaryPlatformInstanceRP : TObjectDictionary<Integer,TPlatform_Instance>;

    procedure SetOnAssignedPlatform(const Value: TNotifyEvent);
    procedure SetOnGetExternalCom(const Value: TNotifyEvent);
    function getDataModule: TdmTTT;

  protected
    function  getMemberInteger(const index: integer): Integer;
    function  getMemberString(const index: integer): string;
    function  getMemberfloat(const index: integer): double;

  public
    ScenarioDefinition  : TScenario_Definition;
    ResourceAllocation  : TResource_Allocation;
    GameEnvironment   : TGame_Environment_Definition;
    AssetDeployment     : TAsset_Deployment ;

    GameDefaults : TGame_Defaults;
    Formation_List_rev : TFormationManager;

    Resource_Overlay_Mapping : TResource_Overlay_Mapping;
    OverlayDefinition : TOverlay_Definition;
    GeoAreaDef        : TGeo_Area_Def;
    ReferencePoint    : TReference_Point;

    {Resource From Database}
    PlatformInstanceListFromDB  : TList;
    RPLListFromDB       : TList;
    BaseListFromDB      : TList;
    TransportListFromDB : TList;
    OverlayListFromDB   : TList;
    PlottingListFromDB  : TList;
    WaypointListFromDB  : TList;
    FormationListFromDB : TList;
    ReferencePointListFromDB  : TList;
    CubiclesGroupsListFromDB  : T3CubicleGroupList;

    Platform_Inst     : TList;
    Formation_List    : TList;
    Links             : TList;
    Platform_Ins      : TList;

    GDefList          : TList;
    GeoPoint          : TList;
    GeoEvent          : TList;

    StaticShape : TList;
    DynamicShape : TList;
    pattern_mapping   : TList;

    overlayName       : string;
    allOverlayNames   : Array[0..20] of string;

    ExternalCom : TExternal_Communication_Channel;
    ExCom : TList;
    CubChanelList : Tlist;

    Platform_Library_Entry : TList;

    {Added By Avi}
    ListDefinition_1, ListDefinition_2, ListDefinition_3 : TStringList;
    ListID_Def1, ListID_Def2, ListID_Def3 : TStringList;
    ListAreaName_Def1, ListAreaName_Def2, ListAreaName_Def3 : TStringList;
    ListDB_AreaName, ListDB_IDArea : TStringList;

  public
    constructor Create;
    destructor Destroy; override;

    procedure ClearScenario;
    procedure LoadFromDB(const ScenarioId: Integer; const unassignedGroupCub: TCubicleAssignSetting; const isController: Boolean);
    procedure LoadPlatformDefinition(pi : TPlatform_Instance);
    procedure SetEventOnExternalComm ;

    //nando add
    procedure LoadCommunicationFromDB(SceID : integer);

    //load platform instance untuk runtime platform
    procedure PutAllPiRPLListToDictionary();
    procedure PutAllPiBaseListToDictionary();
    procedure PutAllPiTransportListToDictionary();
    function GetPiRuntimePlatform(const index : Integer): TPlatform_Instance;

    function FindRuntimePlatform(const id: integer): TObject;

    //Added By Avi
    function FindMark(const LookingFor: string; var Mark: string): Boolean;
    function GetValue(LookFor, Sentence: string; var Value: string): Boolean;
    function CheckZoomArea(DataArea : string; LastZoom: Double;
      var ZoomValue: Integer): Boolean;
    function CheckPosArea(DataArea : string; CenterMapX, CenterMapY: Double;
      var PosValue: Integer): Boolean;

    property ScenarioIndex: Integer index 1 read  getMemberInteger;
    property ScenarioName: string   index 1 read  getMemberString;
    property ResourceAllocIndex: Integer index 2 read  getMemberInteger;
    property IdCubicle: integer index 3 read getMemberInteger;
    property OnAssignedPlatform : TNotifyEvent read FOnAssignedPlatform write SetOnAssignedPlatform;
    property OnGetExternalCom : TNotifyEvent read FOnGetExternalCom write SetOnGetExternalCom;

    //untuk default data nonreal dengan mengambil salah satu platform_instance
    property DefaultNonRealPlatform : TPlatform_Instance read FDefaultNonRealPlatform
              write FDefaultNonRealPlatform default nil;

    property DataModule : TdmTTT read getDataModule;
  end;

var
  VScenario : TT3DBScenario;

implementation

uses
  SysUtils, uSimContainers, ufProgress, uDBAsset_Vehicle, Dialogs,
  uDBAsset_Runtime_Platform_Library, uDBAsset_Embark_Library, uBrigadePersonel;
{ TT3DBScenario }


constructor TT3DBScenario.Create;
begin
  ScenarioDefinition  := TScenario_Definition.Create;
  ResourceAllocation  := TResource_Allocation.Create;
  GameEnvironment     := TGame_Environment_Definition.Create;
  AssetDeployment     := TAsset_Deployment.Create;
  GeoAreaDef          := TGeo_Area_Def.Create;

  GameDefaults        := TGame_Defaults.Create;
  Formation_List_rev  := TFormationManager.Create;

  PlatformInstanceListFromDB    := TList.Create;
  RPLListFromDB       := TList.Create;
  OverlayListFromDB   := TList.Create;
  PlottingListFromDB  := TList.Create;
  BaseListFromDB      := TList.Create;
  WaypointListFromDB  := TList.Create;
  FormationListFromDB := TList.Create;
  TransportListFromDB := TList.Create;

  Platform_Inst     := TList.Create;
  Formation_List    := TList.Create;
  Links             := TList.Create;
  Platform_Ins      := TList.Create;
  GeoPoint          := TList.Create;
  GeoEvent          := TList.Create;
  StaticShape       := TList.Create;
  DynamicShape      := TList.Create;
  GDefList          := TList.Create;

  CubiclesGroupsListFromDB    := T3CubicleGroupList.Create;

  ExternalCom := TExternal_Communication_Channel.Create;
  ExCom := TList.Create;
  CubChanelList := TList.Create;

  ReferencePoint := TReference_Point.Create;
  ReferencePointListFromDB    := TList.Create;

  FDictionaryPlatformInstanceRP := TObjectDictionary<Integer,TPlatform_Instance>.Create;

  ListDefinition_1 := TStringList.Create;
  ListDefinition_2 := TStringList.Create;
  ListDefinition_3 := TStringList.Create;

  ListDB_AreaName := TStringList.Create;
  ListDB_IDArea := TStringList.Create;

  ListID_Def1 := TStringList.Create;
  ListID_Def2 := TStringList.Create;
  ListID_Def3 := TStringList.Create;

  ListAreaName_Def1 := TStringList.Create;
  ListAreaName_Def2 := TStringList.Create;
  ListAreaName_Def3 := TStringList.Create;
end;

destructor TT3DBScenario.Destroy;
var
  pi : TPair<Integer,TPlatform_Instance>;
begin
  for pi in FDictionaryPlatformInstanceRP do
    pi.Value.Free;

  FDictionaryPlatformInstanceRP.Clear;
  FDictionaryPlatformInstanceRP.Free;

  if Assigned(ScenarioDefinition) then
    FreeAndNil(ScenarioDefinition);

  if Assigned(ResourceAllocation) then
    FreeAndNil(ResourceAllocation);

  if Assigned(ExternalCom) then
    FreeAndNil(ExternalCom);

  if Assigned(Excom) then
    FreeAndNil(ExCom);

  if Assigned(PlatformInstanceListFromDB) then
    FreeAndNil(PlatformInstanceListFromDB);

  if Assigned(Platform_Ins) then
    FreeAndNil(Platform_Ins);

  if Assigned(Platform_Inst) then
    FreeAndNil(Platform_Inst);

  if Assigned(CubiclesGroupsListFromDB) then
    FreeAndNil(CubiclesGroupsListFromDB);

  if Assigned(AssetDeployment) then
    FreeAndNil(AssetDeployment);

  if Assigned(GeoAreaDef) then
    FreeAndNil(GeoAreaDef);

  if Assigned(ReferencePoint) then
    FreeAndNil(ReferencePoint);

  if Assigned(ReferencePointListFromDB) then
    FreeAndNil(ReferencePointListFromDB);

  if Assigned(OverlayListFromDB) then
    FreeAndNil(OverlayListFromDB);

  if Assigned(StaticShape) then
    FreeAndNil(StaticShape);

  if Assigned(DynamicShape) then
    FreeAndNil(DynamicShape);

  if Assigned(PlottingListFromDB) then
    FreeAndNil(PlottingListFromDB);

  if Assigned(RPLListFromDB) then
    FreeAndNil(RPLListFromDB);

  if Assigned(GeoEvent) then
    FreeAndNil(GeoEvent);

  if Assigned(GeoPoint) then
    FreeAndNil(GeoPoint);

  if Assigned(Links) then
    FreeAndNil(Links);

  if Assigned(Formation_List) then
    FreeAndNil(Formation_List);

  if Assigned(Formation_List_rev) then
    FreeAndNil(Formation_List_rev);

  if Assigned(FormationListFromDB) then
    FreeAndNil(FormationListFromDB);

  if Assigned(GameEnvironment) then
    FreeAndNil(GameEnvironment);

  if Assigned(GDefList) then
    FreeAndNil(GDefList);

  if Assigned(GameDefaults) then
    FreeAndNil(GameDefaults);

  if Assigned(CubChanelList) then
    FreeAndNil(CubChanelList);

  if Assigned(BaseListFromDB) then
    FreeAndNil(BaseListFromDB);

  if Assigned(WaypointListFromDB) then
    FreeAndNil(WaypointListFromDB);

  if Assigned(TransportListFromDB) then
    FreeAndNil(TransportListFromDB);
end;

function TT3DBScenario.getMemberInteger(const index: integer): Integer;
begin
  Result := -1;
  case index of
    1 : if Assigned(ScenarioDefinition) then
      Result := ScenarioDefinition.FData.Scenario_Index;
    2 : if Assigned(ScenarioDefinition) then
      Result := ScenarioDefinition.FData.Resource_Alloc_Index;
  end;
end;

function TT3DBScenario.getDataModule: TdmTTT;
begin
  result := dmTTT;
end;

function TT3DBScenario.getMemberfloat(const index: integer): double;
begin
  Result := 0;
end;

function TT3DBScenario.getMemberString(const index: integer): string;
begin
  case index of
     1: begin
       result := ScenarioDefinition.FData.Scenario_Identifier;
     end;
  end;
end;

function TT3DBScenario.CheckPosArea(DataArea: string; CenterMapX, CenterMapY: Double; var PosValue: Integer): Boolean;
var
  FX1, FY1, FX2, FY2, FArea: string;
begin
  GetValue('X1_', DataArea, FX1);
  GetValue('Y1_', DataArea, FY1);
  GetValue('X2_', DataArea, FX2);
  GetValue('Y2_', DataArea, FY2);

  if (CenterMapX >= StrToFloat(FX1)) and (CenterMapY <= StrToFloat(FY1)) and
    (CenterMapX <= StrToFloat(FX2)) and (CenterMapY >= StrToFloat(FY2)) then
    PosValue := 2
  else
    PosValue := 0;

  Result :=(PosValue <> 0);
end;

function TT3DBScenario.CheckZoomArea(DataArea: string; LastZoom: Double; var ZoomValue: Integer): Boolean;
var
  FZoomIn, FZoomOut : string;
begin
  GetValue('InZoom_', DataArea, FZoomIn);
  GetValue('OutZoom', DataArea, FZoomOut);

  if (LastZoom >= StrToFloat(FZoomIn)) and (LastZoom <= StrToFloat(FZoomOut)) then
    ZoomValue := 1
  else
    ZoomValue := 0;

  Result := (ZoomValue <> 0);
end;

procedure TT3DBScenario.ClearScenario;
begin
  ClearAndFreeItems(PlatformInstanceListFromDB);
end;

procedure TT3DBScenario.LoadCommunicationFromDB(SceID: integer);
var
  i : Integer;
  grp        : T3CubicleGroup;
  cubChannel : TT3CubicleChanel;
begin
  //External Communication
  //{nando}
  //Controller
  cubChannel := TT3CubicleChanel.Create;
  cubChannel.GroupID := 0;
  cubChannel.GroupName := 'Controller';
  dmTTT.GetExternal_Communication_ChannelBySceID (cubChannel.ListExternalChannel,
                                         IntToStr(SceID));
  CubChanelList.Add(cubChannel);
  //Cubicle
  for i := 0 to CubiclesGroupsListFromDB.Count - 1 do
  begin
    grp := CubiclesGroupsListFromDB.Items[i] as T3CubicleGroup;
    if grp <> nil then begin
      if ((grp.FData.Group_Index = 0) or
          ( LowerCase(grp.FData.Group_Identifier) = 'controller')) then
      Continue;

      cubChannel := TT3CubicleChanel.Create;
      cubChannel.GroupID := grp.FData.Group_Index;
      cubChannel.GroupName := grp.FData.Group_Identifier;
      cubChannel.ListExternalChannel.Clear;
      dmTTT.GetExternal_Communication_ChannelByGroupID(cubChannel.ListExternalChannel,
                                                       IntToStr(grp.FData.Group_Index));
      CubChanelList.Add(cubChannel);
    end;
  end;

  if Assigned(FOnGetExternalCom) then
    FOnGetExternalCom(Self);
end;

procedure TT3DBScenario.LoadFromDB(const ScenarioId: Integer; const unassignedGroupCub: TCubicleAssignSetting; const isController: Boolean);
var
  i, j, k, l, m, n, ovIdx          : Integer;
  ResourceAllocationId, AssetDeploymentId     : Integer;
  pi, memberpi : TPlatform_Instance;
  newGrp, grp        : T3CubicleGroup;
  grm        : T3CubicleGroupMember;
  form       : TFormation;
  link       : TLink;
  found: Boolean;
  platformBaseTemp: TPlatformBase;
  s: string;

  ObjTL : THosted_Platform;

  DefName_1, DefName_2, DefName_3 : string;
  FArea, aa : string;

begin
  ClearScenario;

  if not dmTTT.GetScenario(ScenarioId, ScenarioDefinition ) then
    Exit;

  if not dmTTT.GetResourceAlloc(ResourceAllocIndex, ResourceAllocation ) then
    Exit;

  ResourceAllocationId := ResourceAllocIndex;

  if not dmTTT.GetAssetDeployment(ScenarioId, AssetDeployment) then
    Exit;

  AssetDeploymentId  := AssetDeployment.FData.Deployment_Index;

  frmProgress := TfrmProgress.Create(nil);
  frmProgress.Caption := 'Loading Scenario ' + ScenarioDefinition.FData.Scenario_Identifier + '  from database';

  {$REGION ' Load All Platform Instance Mapping '}
  dmTTT.GetAllPlatformInstance(ResourceAllocIndex, PlatformInstanceListFromDB);
  {$ENDREGION}

  {$REGION ' Load All RPL Mapping '}
  dmTTT.GetResourceRPLMapping(ResourceAllocIndex, RPLListFromDB);
  PutAllPiRPLListToDictionary;
  {$ENDREGION}

  {$REGION ' Load All Base Mapping '}
  dmTTT.GetResourceBaseMapping(ResourceAllocIndex, BaseListFromDB);

  if (BaseListFromDB.Count > 0) then
  begin
    for i := 0 to BaseListFromDB.Count - 1 do
    begin
      platformBaseTemp := TPlatformBase(BaseListFromDB.Items[i]);
      dmTTT.GetPlatform_Embark_Library(platformBaseTemp.id, platformBaseTemp.ListVehicle);
      dmTTT.GetPersonel_Embark_Library(platformBaseTemp.id,platformBaseTemp.ListPersonel);
    end;
  end;

  PutAllPiBaseListToDictionary;
  {$ENDREGION}

  {$REGION ' Load All Overlay Mapping '}
  dmTTT.GetResourceOverlayMapping(ResourceAllocIndex, OverlayListFromDB);

  if (OverlayListFromDB.Count > 0) then
  begin
    for I := 0 to OverlayListFromDB.Count - 1 do
    begin
      ovIdx := TResource_Allocation(OverlayListFromDB.Items[I]).FOverlay.Overlay_Index;

      case TResource_Allocation(OverlayListFromDB[I]).FOverlay.Static_Overlay of
        osDynamic : dmTTT.GetAllOverlay_Shape(ovIdx, DynamicShape);
        osStatic  : dmTTT.GetAllOverlay_Shape(ovIdx, StaticShape);
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Load All Plotting Mapping '}
  dmTTT.GetResourcePlottingMapping(ResourceAllocIndex, PlottingListFromDB);
  {$ENDREGION}

  {$REGION ' Load All Waypoint Mapping '}
  dmTTT.GetWaypointMapping(ResourceAllocIndex, WaypointListFromDB);
  {$ENDREGION}

  {$REGION ' Load All Game Defaults '}
  if (dmTTT.GetGame_Defaults(ResourceAllocation.FData.Resource_Alloc_Index, GameDefaults)) then
  begin
    dmTTT.GetGame_Cloud_On_ESM(GameDefaults.FData.Defaults_Index, GameDefaults);
    dmTTT.GetGame_Cloud_On_Radar(GameDefaults.FData.Defaults_Index, GameDefaults);
    dmTTT.GetGame_Default_IFF_Mode_Code(GameDefaults.FData.Defaults_Index, GameDefaults);
    dmTTT.GetGame_Rainfall_On_ESM(GameDefaults.FData.Defaults_Index, GameDefaults);
    dmTTT.GetGame_Rainfall_On_Missile_Seeker(GameDefaults.FData.Defaults_Index, GameDefaults);
    dmTTT.GetGame_Rainfall_On_Radar(GameDefaults.FData.Defaults_Index, GameDefaults);
    dmTTT.GetGame_Rainfall_On_Sonar(GameDefaults.FData.Defaults_Index, GameDefaults);
    dmTTT.GetGame_Sea_On_Missile_Safe_Altitude (GameDefaults.FData.Defaults_Index, GameDefaults);
    dmTTT.GetGame_Sea_On_Radar(GameDefaults.FData.Defaults_Index, GameDefaults);
    dmTTT.GetGame_Sea_On_Sonar(GameDefaults.FData.Defaults_Index, GameDefaults);
    dmTTT.GetGame_Ship_On_Sonar(GameDefaults.FData.Defaults_Index, GameDefaults);
  end;
  {$ENDREGION}

  frmProgress.MaxJob := PlatformInstanceListFromDB.Count;

  {$REGION ' Load Platform Instance Data & Asset '}
  for I := 0 to PlatformInstanceListFromDB.Count - 1 do
  begin
    pi := PlatformInstanceListFromDB[i];

    frmProgress.increase( pi.FData.Instance_Name );
    LoadPlatformDefinition(pi);

    if not FDictionaryPlatformInstanceRP.ContainsKey(pi.FData.Vehicle_Index) then
      FDictionaryPlatformInstanceRP.Add(pi.FData.Vehicle_Index, pi);

    //untuk set default data platform instance untuk NonRealTime Platform
    if DefaultNonRealPlatform = nil then
    begin
      if pi.FData.Vehicle_Index > 0 then
      begin
        DefaultNonRealPlatform := TPlatform_Instance.Create;
        DefaultNonRealPlatform.FData.Vehicle_Index := pi.FData.Vehicle_Index;
        LoadPlatformDefinition(DefaultNonRealPlatform)
      end;
    end;

    {$REGION ' Merubah TPlatform_Instance ke TT3PlatformInstance melalui event ini '}
    if Assigned(FOnAssignedPlatform) then
      FOnAssignedPlatform(pi);
    {$ENDREGION}
  end;
  {$ENDREGION}

  {$REGION ' Load Platform Instance Transport kedalam dictionary'}
//  PutAllPiTransportListToDictionary;
  {$ENDREGION}

  {$REGION ' Load All Formation Mapping '}
  dmTTT.GetFormationDefinition(AssetDeploymentId, FormationListFromDB);
  Platform_Inst.Clear;
  Formation_List.Clear;

  // formation refinement
  Formation_List_rev.Clear;
  dmTTT.GetFormation(AssetDeploymentId, Formation_List_rev);

  for I := 0 to FormationListFromDB.Count - 1 do
  begin
    form := FormationListFromDB[i];
    dmTTT.GetFormationAssignment(form, Formation_List) ;
  end;

  dmTTT.GetLinkDefinition(AssetDeploymentId, Links);
  for I := 0 to Links.Count - 1 do
  begin
    link  := Links[i];
    with link do
    begin
      dmTTT.GetLinkParticipant(link, Platform_Ins);
    end;
  end;
  {$ENDREGION}

  // 2.2 from resource alloc
  dmTTT.GetGame_Environment_Definition(ResourceAllocation.FData.Game_Enviro_Index, GameEnvironment);

  {$REGION ' Load Peta Definistion '}
  // to move the value of definition area from 'txt' file to the list
  DefName_1 := vMapSetting.MapDefGame + '\Def_' + GameEnvironment.FData.Game_Def_1 + '.txt';
  DefName_2 := vMapSetting.MapDefGame + '\Def_' + GameEnvironment.FData.Game_Def_2 + '.txt';
  DefName_3 := vMapSetting.MapDefGame + '\Def_' + GameEnvironment.FData.Game_Def_3 + '.txt';

  if FileExists(DefName_1) then
    ListDefinition_1.LoadFromFile(DefName_1);

  if FileExists(DefName_2) then
    ListDefinition_2.LoadFromFile(DefName_2);

  if FileExists(DefName_3) then
    ListDefinition_3.LoadFromFile(DefName_3);

  //untuk load all game area definition
  dmTTT.GetGame_Area_Def(GDefList);

  for I := 0 to GDefList.Count - 1 do
  begin
    ListDB_AreaName.Add(TGame_Environment_Definition(GDefList[I]).FGameArea.Game_Area_Identifier);
    ListDB_IDArea.Add(IntToStr(TGame_Environment_Definition(GDefList[I]).FGameArea.Game_Area_Index));
  end;

  // get ID_GSTGame and game identifier of Definition Area_1

  for I := 0 to ListDefinition_1.Count - 1 do
  begin
    GetValue('Area_', ListDefinition_1[I], FArea);

    for J := 0 to ListDB_AreaName.Count - 1 do
    begin
      if FArea = ListDB_AreaName[J] then
      begin
        ListID_Def1.Add(ListDB_IDArea[J]);
        ListAreaName_Def1.Add(ListDB_AreaName[J]);
        Break;
      end
      else
        Continue;
    end;
  end;

  // get ID_GSTGame and game identifier of Definition Area_2

  for I := 0 to ListDefinition_2.Count - 1 do
  begin
    GetValue('Area_', ListDefinition_2[I], FArea);

    for J := 0 to ListDB_AreaName.Count - 1 do
    begin
      if FArea = ListDB_AreaName[J] then
      begin
        ListID_Def2.Add(ListDB_IDArea[J]);
        ListAreaName_Def2.Add(ListDB_AreaName[J]);
        Break;
      end
      else
        Continue;
    end;
  end;

  // get ID_GSTGame and game identifier of Definition Area_3

  for I := 0 to ListDefinition_3.Count - 1 do
  begin
    GetValue('Area_', ListDefinition_3[I], FArea);

    for J := 0 to ListDB_AreaName.Count - 1 do
    begin
      if FArea = ListDB_AreaName[J] then
      begin
        ListID_Def3.Add(ListDB_IDArea[J]);
        ListAreaName_Def3.Add(ListDB_AreaName[J]);
        Break;
      end
      else
        Continue;
    end;
  end;
  {$ENDREGION}

  dmTTT.GetGame_Area_DefByID(GameEnvironment.FData.Game_Area_Index, GameEnvironment);

  //tambahan dari aldy get sub area inList
  dmTTT.GetSubArea_Enviro_Definition(ResourceAllocation.FData.Game_Enviro_Index, GameEnvironment.FSubArea);

  dmTTT.GetGeoAreaDefinition(GameEnvironment.FData.Game_Area_Index, GeoPoint);

  GameEnvironment.calculateMaxPowerScaleArea;

  {$REGION ' Load All Cubicle Group '}
  dmTTT.GetT3GroupList(ScenarioId, CubiclesGroupsListFromDB.FSList);
  for I := 0 to CubiclesGroupsListFromDB.Count - 1 do
  begin
    grp  := CubiclesGroupsListFromDB.Items[i] as T3CubicleGroup;
    if grp <> nil then
    begin
      grp.InitData;

      dmTTT.GetT3GroupMember(grp.FData.Group_Index, grp.FSList);

      for j := 0 to grp.Count - 1 do
      begin
        grm := grp.Items[j] as T3CubicleGroupMember;
        if grm = nil then
          continue;

        k := 0;
        found := false;
        pi := nil;

        while not found and (k < PlatformInstanceListFromDB.Count) do
        begin
          pi := PlatformInstanceListFromDB[k];
          found := grm.FData.Platform_Instance_Index = pi.FData.Platform_Instance_Index;
          Inc(k);
        end;

        if found then
        begin
           if j = 0 then
             pi.IsGroupLeader := true
           else
             pi.IsGroupLeader := false;

           pi.CubicleGroupID := grp.FData.Group_Index;
           grp.SetTrackNumber(pi.FData.Platform_Instance_Index, j);
        end
      end;
    end;
  end;

  {Mencari Paltform yg tidak punya group}
  for I := 0 to PlatformInstanceListFromDB.Count - 1 do
  begin
    pi := PlatformInstanceListFromDB[i];

    if pi.CubicleGroupID > 1  then
      continue;

    grp := CubiclesGroupsListFromDB.GetGroupByIdentifier('Unassigned Group') as T3CubicleGroup;

    if Assigned(grp) then
    begin
      grm := T3CubicleGroupMember.Create;

      with grm.FData do
      begin
        Platform_Instance_Index  := pi.FData.Platform_Instance_Index;
        Group_Index              := 1;
        Command_Priority         := i;
        Deployment_Index         := Deployment_Index;
      end;

      grp.FSList.AddObject(IntToStr(grm.FData.Platform_Instance_Index), grm);
    end;
  end;
  {$ENDREGION}

  for i := ExCom.Count - 1 downto 0 do
  begin
    ExCom.Delete(i);
  end;
  ExCom.Clear;

  dmTTT.GetExternal_Communication_Channel(ExCom, IntToStr(ResourceAllocationId),'' ,ExternalCom);

  dmTTT.getAllReference_Point(ResourceAllocationId, ReferencePointListFromDB);

  frmProgress.Free;
end;

procedure TT3DBScenario.LoadPlatformDefinition(pi: TPlatform_Instance);
var
  vIndex : integer;
begin

  dmTTT.GetPlatform_ActivationToPlatformInstance(pi.FData.Platform_Instance_Index,pi);

  {$REGION ' Load Vehicle Definition and Asset '}
  if pi.FData.Vehicle_Index > 0 then begin

    dmTTT.GetVehicleDef(pi.FData.Vehicle_Index, Pi.Vehicle);
    dmTTT.GetHelicopter(pi.FData.Vehicle_Index, Pi.HeliLimitation);
    dmTTT.GetMotionCharacteristicDef(pi.Vehicle.FData.Motion_Characteristics, Pi.Motion);
    dmTTT.GetLogisticDef(pi.Vehicle.FData.Logistic_Characteristics, Pi.Logistic);
    dmTTT.GetTransportDef(pi.Vehicle.FData.Capability_Characteristics, Pi.Transport);

    with pi.Vehicle do
    begin
      vIndex := Pi.FData.Vehicle_Index;

      //sensor
      dmTTT.getAllEO_On_Board(vIndex,0, pi.Vehicle.EOSensors);
      dmTTT.getAllESM_On_Board(vIndex,0, pi.Vehicle.ESMSensors);
      dmTTT.getAllIFF_Sensor_On_Board(vIndex,0, pi.Vehicle.IFFSensors);
      dmTTT.getAllMAD_Sensor_On_Board(vIndex,0, pi.Vehicle.MADSensors);
      dmTTT.getAllVisual_Sensor_On_Board(vIndex,0, pi.Vehicle.Visualsensors);
      dmTTT.getAllFCR_On_Board(vIndex, pi.Vehicle.FCRSensors);

      dmTTT.GetAllRadar_On_Board(vIndex,0, pi.Vehicle.Radars);
      dmTTT.GetAllSonar_On_Board(vIndex,0, pi.Vehicle.Sonars);

      //weapon fit on Board
      dmTTT.getAllMissile_OnBoard2(vIndex,0, Pi.Vehicle.Missiles  );
      dmTTT.getAllTorpedo_OnBoard(vIndex,0, Pi.Vehicle.Torpedos  );
      dmTTT.GetAllHybrid_On_Board(vIndex, Pi.Vehicle.Hybrids   );
      dmTTT.getAllMines_OnBoard(vIndex,0 , Pi.Vehicle.Mines );
      dmTTT.GetAllBomb(vIndex, Pi.Vehicle.Bombs);
      dmTTT.GetAllGun(vIndex, Pi.Vehicle.Guns);

      dmTTT.getAllAcoustic_Decoy_On_Board(vIndex, pi.Vehicle.Acoustic_Decoys);
      dmTTT.getAllAir_Bubble_Mount(vIndex, pi.Vehicle.Air_Bubble_Mount);
      dmTTT.getAllChaff_On_Board(vIndex, pi.Vehicle.Chaffs);
      dmTTT.getAllChaff_Launcher_On_Board(vIndex, pi.Vehicle.Chaff_Launchers);
      dmTTT.getAllDefensive_Jammer_On_Board(vIndex, pi.Vehicle.Defensive_Jammers);
      dmTTT.getAllFloating_Decoy_On_Board(vIndex, pi.Vehicle.Floating_Decoys);
      dmTTT.getAllInfrared_Decoy_On_Board(vIndex, pi.Vehicle.Infrared_Decoys);
      dmTTT.getAllJammer_On_Board(vIndex, pi.Vehicle.Jammers);
      dmTTT.getAllPoint_Effect_On_Board(vIndex, pi.Vehicle.Point_Effects);
      dmTTT.getAllTowed_Jammer_Decoy_On_Board(vIndex, pi.Vehicle.Towed_Jammer_Decoys);
      dmTTT.getAllSonobuoy_On_Board(vIndex,0, Pi.Vehicle.Sonobuoy );
      dmTTT.getHosted_Platform(vIndex,0, pi.Vehicle.Hosted_Platform);
      dmTTT.getAllHosted_Platform(vIndex, 0, TransportListFromDB);

    end;
  end;
  {$ENDREGION}

  {$REGION ' Load Satellite Definition and Asset '}
  if pi.FData.Satellite_Index > 0 then
    dmTTT.GetSatellite_Definition(pi.FData.Satellite_Index, Pi.Satellite);
  {$ENDREGION}

  {$REGION ' Load Mine Definition and Asset '}
  if pi.FData.Mine_Index > 0 then begin
    dmTTT.getMine_def(pi.Mine, pi.FData.Mine_Index);
    dmTTT.getMinePOD(pi.Mine.FPOD,pi.FData.Mine_Index);
  end;
  {$ENDREGION}

  {$REGION ' Load Missile Definition and Asset '}
  if pi.FData.Missile_Index > 0 then begin
    dmTTT.getMissile_Def(pi.Missile, pi.FData.Missile_Index);
    dmTTT.GetMotionCharacteristicDef(pi.Missile.FData.Motion_Index, Pi.Motion);
  end;
  {$ENDREGION}

  {$REGION ' Load Torpedo Definition and Asset '}
  if pi.FData.Torpedo_Index > 0 then begin
    dmTTT.getTorpedo_Def(pi.Torpedo, pi.FData.Torpedo_Index);
    dmTTT.getTorpedoPOH(pi.Torpedo.FPOHs,pi.FData.Torpedo_Index);
    dmTTT.GetMotionCharacteristicDef(pi.Torpedo.FData.Motion_Index, Pi.Motion);
  end;
  {$ENDREGION}

  {$REGION ' Load Hybrid Definition and Asset '}
  if pi.FData.Hybrid_Index > 0 then begin
  end;
  {$ENDREGION}

  {$REGION ' Load Sonobuoy Definition and Asset '}
  if pi.FData.Sonobuoy_Index > 0 then begin
  end;
  {$ENDREGION}

end;

function TT3DBScenario.FindMark(const LookingFor: string;var Mark: string): Boolean;
begin
  if LookingFor = 'Area_' then
    Mark := '\X1_'
  else if LookingFor = 'X1_' then
    Mark := '\Y1_'
  else if LookingFor = 'X2_' then
    Mark := '\Y2_'
  else if LookingFor = 'Y1_' then
    Mark := '\X2_'
  else if LookingFor = 'Y2_' then
    Mark := '\InZoom_'
  else if LookingFor = 'InZoom_' then
    Mark := '\OutZoom_'
  else
    Mark := '#';
end;

function TT3DBScenario.FindRuntimePlatform(const id: integer): TObject;
var i, j : integer;
    f: Boolean;
    recLBN: TRuntime_Platform_Library;
    objPLE : TPlatform_Library_Entry;
    vDef: TVehicle_Definition;
    mDef: TMissile_Definition;
    bDef: TMine_Definition;
begin
  j := 0;
  f := False;
  Result := nil;

  for i := 0 to RPLListFromDB.Count - 1 do
  begin
    recLBN := RPLListFromDB.Items[i];

    for j := 0 to recLBN.FPlatform_Library_Entry.Count - 1 do
    begin
      objPLE := recLBN.FPlatform_Library_Entry.Items[j];

      if objPLE.FData.Vehicle_Index = id then begin
        Result := objPLE;
        f := objPLE.FData.Vehicle_Index = id;
        Break;
      end;

      if objPLE.FData.Missile_Index = id then begin
        Result := objPLE;
        f := objPLE.FData.Missile_Index = id;
        Break;
      end;

      if objPLE.FData.Mine_Index = id then begin
        Result := objPLE;
        f := objPLE.FData.Mine_Index = id;
        Break;
      end;

      if objPLE.FData.Torpedo_Index = id then begin
        Result := objPLE;
        f := objPLE.FData.Torpedo_Index = id;
        Break;
      end;
    end;

//    while not f and (j < recLBN.FPlatform_Library_Entry.Count) do begin
//      objPLE  := recLBN.FPlatform_Library_Entry.Items[j];
//
//      if objPLE.FData.Vehicle_Index = id then begin
//        Result := objPLE;
//        f := objPLE.FData.Vehicle_Index = id;
//      end;
//
//      if objPLE.FData.Missile_Index = id then begin
//        Result := objPLE;
//        f := objPLE.FData.Missile_Index = id;
//      end;
//
//      if objPLE.FData.Mine_Index = id then begin
//        Result := objPLE;
//        f := objPLE.FData.Mine_Index = id;
//      end;
//
//      if objPLE.FData.Torpedo_Index = id then begin
//        Result := objPLE;
//        f := objPLE.FData.Torpedo_Index = id;
//      end;
//
//      Inc(j);
//    end;

    if f then
      Break;

    if not f then
      Result := nil;
  end;
end;

procedure TT3DBScenario.PutAllPiBaseListToDictionary;
var
  ObjET : TPlatformBase;
  objPEL : TPlatform_Embark_Library;
  i, j, k : Integer;
  vDef: TVehicle_Definition;
  mDef: TMissile_Definition;
  bDef: TMine_Definition;
  Pi : TPlatform_Instance;
begin
  for i := 0 to BaseListFromDB.Count - 1 do
  begin
    ObjET := BaseListFromDB.Items[i];

    if ObjET <> nil then
    begin
      for j := 0 to ObjET.ListVehicle.Count - 1 do
      begin
        objPEL := ObjET.ListVehicle.Items[j];

        if objPEL.FData.Vehicle_Index <> 0 then begin
          if not FDictionaryPlatformInstanceRP.ContainsKey(objPEL.FData.Vehicle_Index) then
          begin
            Pi := TPlatform_Instance.Create;
            Pi.FData.Vehicle_Index := objPEL.FData.Vehicle_Index;
            LoadPlatformDefinition(Pi);
            FDictionaryPlatformInstanceRP.Add(objPEL.FData.Vehicle_Index, Pi);
          end;
        end;
      end;

      {Prince : Vehicle Index group personel di hardcode, menggunakan vehicle index indonesia - Group Personel}
      if ObjET.ListPersonel.Count > 0 then
      begin
        if not FDictionaryPlatformInstanceRP.ContainsKey(931) then
        begin
          Pi := TPlatform_Instance.Create;
          Pi.FData.Vehicle_Index := 931;
          LoadPlatformDefinition(Pi);
          FDictionaryPlatformInstanceRP.Add(931, Pi);
        end;
      end;

      {LCU}
      if not FDictionaryPlatformInstanceRP.ContainsKey(160) then
      begin
        Pi := TPlatform_Instance.Create;
        Pi.FData.Vehicle_Index := 160;
        LoadPlatformDefinition(Pi);
        FDictionaryPlatformInstanceRP.Add(160, Pi);
      end;
      {LCR}
      if not FDictionaryPlatformInstanceRP.ContainsKey(600) then
      begin
        Pi := TPlatform_Instance.Create;
        Pi.FData.Vehicle_Index := 600;
        LoadPlatformDefinition(Pi);
        FDictionaryPlatformInstanceRP.Add(600, Pi);
      end;
      {LCVP}
      if not FDictionaryPlatformInstanceRP.ContainsKey(20) then
      begin
        Pi := TPlatform_Instance.Create;
        Pi.FData.Vehicle_Index := 20;
        LoadPlatformDefinition(Pi);
        FDictionaryPlatformInstanceRP.Add(20, Pi);
      end;
    end;
  end;
end;

procedure TT3DBScenario.PutAllPiRPLListToDictionary;
var
  ObjRPL : TRuntime_Platform_Library;
  objPLE : TPlatform_Library_Entry;
  i, j : Integer;
  vDef: TVehicle_Definition;
  mDef: TMissile_Definition;
  bDef: TMine_Definition;
  Pi : TPlatform_Instance;
begin
  for i := 0 to RPLListFromDB.Count - 1 do
  begin
    ObjRPL := TRuntime_Platform_Library(RPLListFromDB.Items[i]);

    if ObjRPL <> nil then
    begin
      for j := 0 to ObjRPL.FPlatform_Library_Entry.Count - 1 do
      begin
        objPLE := TPlatform_Library_Entry(ObjRPL.FPlatform_Library_Entry.Items[j]);

        {$REGION ' Vehicle '}
        if objPLE.FData.Vehicle_Index <> 0 then
        begin
          if not FDictionaryPlatformInstanceRP.ContainsKey(objPLE.FData.Vehicle_Index) then
          begin
            Pi := TPlatform_Instance.Create;
            Pi.FData.Vehicle_Index := objPLE.FData.Vehicle_Index;
            LoadPlatformDefinition(Pi);
            FDictionaryPlatformInstanceRP.Add(objPLE.FData.Vehicle_Index, Pi);
          end;
        end
        {$ENDREGION}

        {$REGION ' Missile '}
        else if objPLE.FData.Missile_Index <> 0 then
        begin
          if not FDictionaryPlatformInstanceRP.ContainsKey(objPLE.FData.Missile_Index) then
          begin
            Pi := TPlatform_Instance.Create;
            Pi.FData.Missile_Index := objPLE.FData.Missile_Index;
            LoadPlatformDefinition(Pi);
            FDictionaryPlatformInstanceRP.Add(objPLE.FData.Missile_Index, Pi);
          end;
        end
        {$ENDREGION}

        {$REGION ' Torpedo '}
        else if objPLE.FData.Torpedo_Index <> 0 then
        begin
          if not FDictionaryPlatformInstanceRP.ContainsKey(objPLE.FData.Torpedo_Index) then
          begin
            Pi := TPlatform_Instance.Create;
            Pi.FData.Torpedo_Index := objPLE.FData.Torpedo_Index;
            LoadPlatformDefinition(Pi);
            FDictionaryPlatformInstanceRP.Add(objPLE.FData.Torpedo_Index, Pi);
          end;
        end
        {$ENDREGION}

        {$REGION ' Mine '}
        else if objPLE.FData.Mine_Index <> 0 then
        begin
          if not FDictionaryPlatformInstanceRP.ContainsKey(objPLE.FData.Mine_Index) then
          begin
            Pi := TPlatform_Instance.Create;
            Pi.FData.Mine_Index := objPLE.FData.Mine_Index;
            LoadPlatformDefinition(Pi);
            FDictionaryPlatformInstanceRP.Add(objPLE.FData.Mine_Index, Pi);
          end;
        end;
        {$ENDREGION}

      end;
    end;
  end;
end;

procedure TT3DBScenario.PutAllPiTransportListToDictionary;
var
  ObjTL : THosted_Platform;
  i, j : Integer;
  Pi : TPlatform_Instance;
begin
  for i := 0 to TransportListFromDB.Count - 1 do
  begin
    ObjTL := THosted_Platform(TransportListFromDB.Items[i]);

    if ObjTL <> nil then
    begin
      if ObjTL.FData.Vehicle_Index <> 0 then
      begin
        if not FDictionaryPlatformInstanceRP.ContainsKey(ObjTL.FData.Vehicle_Index) then
        begin
          Pi := TPlatform_Instance.Create;
          Pi.FData.Vehicle_Index := ObjTL.FData.Vehicle_Index;
          LoadPlatformDefinition(Pi);
          FDictionaryPlatformInstanceRP.Add(ObjTL.FData.Vehicle_Index, Pi);
        end;
      end
    end;
  end;
end;

function TT3DBScenario.GetPiRuntimePlatform(const index: Integer): TPlatform_Instance;
var
  Pi : TPlatform_Instance;
begin
  try
    Result := FDictionaryPlatformInstanceRP.Items[index];
  except on E: Exception do
    Result := nil;
  end;
//  if FDictionaryPlatformInstanceRP.TryGetValue(index, Pi) then
//    Result := Pi
//  else
//    Exit;
end;

function TT3DBScenario.GetValue(LookFor, Sentence: string; var Value: string): Boolean;
var
  IndexSeparate1, IndexSeparate2, IndexSeparate3 : Integer;
  Marker, FData : string;
  LData : Integer;
begin
  IndexSeparate1 := Pos(LookFor, Sentence);
  if IndexSeparate1 > 0 then
  begin
    FindMark(LookFor, Marker);
    IndexSeparate2 := Pos(Marker, Sentence);
    FData := Copy(Sentence, IndexSeparate1, (IndexSeparate2 - IndexSeparate1));

    LData := Length(FData);
    IndexSeparate3 := Pos('_', FData);
    Value := Copy(FData, IndexSeparate3 + 1, LData);
    Value := Trim(Value);
  end
  else
    Value := '0';

  Result := (Value <> '');
end;

procedure TT3DBScenario.SetEventOnExternalComm;
begin
  if Assigned(FOnGetExternalCom) then
    FOnGetExternalCom(Self);
end;

procedure TT3DBScenario.SetOnAssignedPlatform(const Value: TNotifyEvent);
begin
  FOnAssignedPlatform := Value;
end;

procedure TT3DBScenario.SetOnGetExternalCom(const Value: TNotifyEvent);
begin
  FOnGetExternalCom := Value;
end;

{ TT3CubicleChanel }

constructor TT3CubicleChanel.Create;
begin
  ListExternalChannel := TList.Create;
end;

destructor TT3CubicleChanel.destroy;
var
  i : integer;
begin
  inherited;

  if Assigned(ListExternalChannel) then
  begin
    for i := ListExternalChannel.Count - 1 downto 0 do
    begin
      ListExternalChannel.Delete(i);
    end;
    ListExternalChannel.Clear;
    ListExternalChannel.Free;
  end;
end;

end.
