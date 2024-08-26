unit uDataModuleTTT;

interface

uses
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Classes, ZConnection,
  Dialogs, SysUtils, uDBGame_Defaults, uDBAsset_Bomb, uDBAsset_Gun,
  uDBAsset_Scripted,
  uDBRainfall, tttData, newClassASTT, uDBAssetObject, uDBAsset_Vehicle,
  uDBAsset_Sensor,
  uDBAsset_Sonobuoy, uDBAsset_GameEnvironment, uDBAsset_Cubicle, uDBFormation,
  uDBAsset_Satellite, uDBAsset_Fitted, uDBBlind_Zone, uDBPattern, uDBLink,
  uDBAsset_Sonar,
  uDBAsset_Radar, uDBAsset_Deploy, uDBAsset_Countermeasure, uDBAsset_Weapon,
  uDBAsset_Geo, uDBNote_Storage, uDBAsset_MotionCharacteristics,
  uDBAssets_SubAreaEnviroDefinition, uDBAsset_Runtime_Platform_Library,
  uDBCubicles, ADODB, uSRRFunction, ZAbstractConnection, uDBAsset_Logistic,
  uFormationManager, uDBAsset_FontTaktis, uDBAsset_Capability;
// ,uDBStudentRole;

type

  TdmTTT = class(TDataModule)
    ZQ: TZQuery;
    ZConn: TZConnection;
    ZQ2: TZQuery;

  private
    { Private declarations }
  public
    { Public declarations }
    function InitZDB(const zDbServer, zDBProto, zDBname, zDBuser,
      zDBPass: string): boolean;

    // --- 1 -- Scenario ----------------------------------------------------------
    function GetScenario(const id: Integer; var rec: TScenario_Definition)
      : boolean;

    function getAllScenario_Definition(var aRec: TList): Integer;
    function CekScenarioNameAlreadyExist(const aName : string):Boolean;

    function updateScenario(rec: TScenario_Definition; value: string): Integer;
    function insertScenario(rec: TScenario_Definition): Integer;
    function DeleteScenario_Definition(const id: string): Integer;

    // --- 2 ---------------------------------------------------------------------
    function GetResourceAlloc(const id: Integer; var rec: TResource_Allocation)
      : boolean;

    function GetResource_Overlay_Mapping(const id: Integer;
      var recList: TList): boolean;
    function GetResource_Plotting_mapping(const id: Integer;
      var recList: TList):Boolean;

    function getAllResource_Allocation(var aRec: TList): Integer;
    function GetMaxResource_Allocation(var id: Integer): boolean;
    function updateResource(rec: TResource_Allocation; id: string): Integer;
    function insertResource(var rec: TResource_Allocation): Integer;
    function DeleteResource_Allocation(const id: string): Integer;

    // --- 2.1 -- Resource Alloc --------------------------------------------------
    function getAllPlatFormInstance(const id: Integer;
      var aRec: TList): Integer;
    function getPlatformInstanceByIndex(const id:integer;var rec:TPlatform_Instance):boolean;
    function getAllPlatFormInstanceForceClassification(const v_id,id: integer;
      var aRec: TList;force:integer;classification:integer): Integer;

    function getPlatFormInstance(const ra_id,force: integer;const instance:string;
    var aRec: TList): Integer;

    function getPlatformInstanceByGroup(const group_id:integer;var cList:TList)
    :integer;
    function getPlatformInstanceByName(const id,ra_id,force:string;var rec:TPlatform_Instance):boolean;

    function GetPlatform_Instance_Identifier(const v_id: integer;const v_ident:string;var vList:TList;
    var rec: TPlatform_Instance_Identifier): boolean;
    function InsertPlatform_Instance_Identifier(var rec: TPlatform_Instance_Identifier): integer;
    function DeletePlatform_Instance_Identifier(const id: string): integer;

    function insertPlatformInstance(const rec:TPlatform_Instance;const id:integer):integer;
    function deletePlatformInstance(const pi_id:string):integer;

    function updatePlatformInstance(var rec: TPlatform_Instance;const pi_id,mis_id,tor_id,mine_id,hybrid_id,satelit_id,son_id:integer):Integer;
    function updatePlatformInst(rec: TList;pi_id:string):integer;

    function GetPlatform_ActivationByPlatformInstance(const id: integer;var rec: TPlatform_Activation): boolean;
    function GetPlatform_ActivationToPlatformInstance(const id: integer;
    var rec: TPlatform_Instance): boolean;
    function updatePlatformActivation(var rec:TList;pi_id: string):integer;
    function updatePlatformAct(var rec: TPlatform_Instance; pi_id: Integer):Integer;
    function UpdatePlatformActClient(var aLat, aLong, aCourse: Double; Alt : Single;  CartX, CartY, pi_id: Integer):Integer;
    function InsertPlatform_Activation(var rec: TPlatform_Instance): integer;
    function deletePlatformActivation(var pi_id: string;deploy_id:string):integer;

    procedure getFontIDByVecID(const VecID : integer; var FontID : Integer);
    procedure getFontTaktis(const FontID : Integer; var FontName : string; var FontIndex : Integer; var FontDesc : string);

    function deletePlatformByIndex(const platform_instace_index: string)
      : Integer;

    function getPlatformType(var aRec: TList): Integer;

    // --- 2.1.1 -- Platform Instance Detail --------------------------------------
    function GetVehicle_Definition(const id: Integer;
      var rec: TVehicle_Definition): boolean;
    function GetAllVehicle_Def(var vList: TList; var id: Integer;
      var rec: TVehicle_Definition): Integer;
    function GetVehicleBy(const domain, tipe, embarked: string;
      var vList: TList): Integer;
    function getVehicleByLibrary(const id_Library: Integer;
      var vList: TList): Integer;
    function getMissileByLibrary(const id_Library: Integer;
      var vList: TList): Integer;
    function updateVehicle_Def(var rec: TVehicle_Definition;
      const id: string): Integer;
    function insertVehicle_Def(rec: TVehicle_Definition): Integer;
    function deleteVehicle(const id: Integer): Integer;
    function updatePredifened_Pattern(rec: TPredefined_Pattern; id: string;
      pattern_id: string): Integer;
    function insertPredifened_Pattern(rec: TPredefined_Pattern): Integer;

    // Satellite
    function GetSatellite_Definition(const id: Integer;
      var rec: TSatellite_Definition): boolean;
    function getAllSatellite(const id: Integer; var sList: TList;
      var rec: TSatellite_Definition): Integer;
    function getPISatellite(var mList: TList; ra_id, force: Integer): Integer;
    function updateSatellite_Def(var rec: TSatellite_Definition;
      const id: string): Integer;
    function insertSatellite_Def(rec: TSatellite_Definition): Integer;
    function deleteSatellite_Def(id: Integer): Integer;

    { function GetMissile_Definition(const id: integer;
      var rec: TMissile_Definition): boolean;

      function GetTorpedo_Definition(const id: integer;
      var rec: TTorpedo_Definition): boolean;

      function GetMine_Definition(const id: integer;
      var rec: TMine_Definition): boolean;

      function GetSonobuoy_Definition(const id: integer;
      var rec: TSonobuoy_Definition): boolean;
      }
    // ---- 2.1.1.1 Vehicle Details -----------------------------------------------
    // -- sensor --
    // EC
    function getAllEO_On_Board(const id, index: Integer;
      var aRec: TList): Integer;
    function updateEO(rec: TEO_On_Board; id: string): Integer;
    function insertEO(rec: TEO_On_Board): Integer;
    function DeleteEO_On_Board(const id: string;
      var rec: TEO_On_Board): Integer;
    function getEO_Def(const id: Integer; var aRec: TList;
      var rec: TEO_On_Board): Integer;
    function updateEO_Def(rec: TEO_On_Board; id: string): Integer;
    function insertEO_Def(rec: TEO_On_Board): Integer;
    function deleteEO_Def(id: Integer): Integer;

    // ESM
    function getAllESM_On_Board(const id, index: Integer;
      var aRec: TList): Integer;
    function updateESM(rec: TESM_On_Board; id: string): Integer;
    function insertESM(rec: TESM_On_Board): Integer;
    function UpdateESM_On_Board(const id: string;
      var rec: TESM_On_Board): integer;
    function DeleteESM_On_Board(const id: string;
      var rec: TESM_On_Board): Integer;
    function getESM_Def(var aRec: TList): boolean;
    function updateESM_Def(rec: TESM_On_Board; id: string): Integer;
    function insertESM_Def(rec: TESM_On_Board): Integer;

    // IFF
    function getAllIFF_Sensor_On_Board(const id, index: Integer;
      var aRec: TList): Integer;
    function updateScriptIFF(rec: TScripted_IFF_Event; id: string): Integer;
    function updateIFF(rec: TIFF_Sensor_On_Board; id: string): Integer;
    function insertIFF(rec: TIFF_Sensor_On_Board): Integer;
    function DeleteIFF_Sensor_On_Board(const id: string;
      var rec: TIFF_Sensor_On_Board): Integer;

    // MAD
    function getAllMAD_Sensor_On_Board(const id, index: Integer;
      var aRec: TList): Integer;
    function updateMAD(rec: TMAD_Sensor_On_Board; id: string): Integer;
    function insertMAD(rec: TMAD_Sensor_On_Board): Integer;
    function DeleteMAD_Sensor_On_Board(const id: string;
      var rec: TMAD_Sensor_On_Board): Integer;
    function getMAD_Def(const id: Integer; var aRec: TList;
      var rec: TMAD_Sensor_On_Board): Integer;
    function updateMAD_Def(rec: TMAD_Sensor_On_Board; id: string): Integer;
    function insertMAD_Def(rec: TMAD_Sensor_On_Board): Integer;
    function deleteMAD_Def(id: Integer): Integer;

    // Visual
    function getAllVisual_Sensor_On_Board(const id, index: Integer;
      var aRec: TList): Integer;
    function updateVisual(rec: TVisual_Sensor_On_Board; id: string): Integer;
    function insertVisual(rec: TVisual_Sensor_On_Board): Integer;
    function DeleteVisual_Sensor_On_Board(const id: string;
      var rec: TVisual_Sensor_On_Board): Integer;

    // FCR
    function getAllFCR_On_Board(const id: Integer; var aRec: TList): Integer;

    // Radar
    function getAllRadar_On_Board(const id, index: Integer;
      var aRec: TList): Integer;
    function updateScriptRadar(rec: TScripted_Radar_Event; id: string): Integer;
    function GetRadar_Definition(var aRec: TList): boolean;
    function InsertRadar_On_Board(const id: string;
      var rec: TRadar_On_Board): Integer;
    function UpdateRadar_On_Board(const id: string;
      var rec: TRadar_On_Board): integer;
    function DeleteRadar_On_Board(const id: string;
      var rec: TRadar_On_Board): Integer;
    function insertRadar_Def(rec: TRadar_On_Board): Integer;
    function updateRadar_Def(rec: TRadar_On_Board; id: string): Integer;
    function DeleteRadar_Definition(const id: string): Integer;
    function updateRadar_Interval_Def(rec: TRadar_On_Board;
      id: string): Integer;
    function insertRadar_Interval_Def(rec: TRadar_On_Board): Integer;

    // Sonar
    function getAllSonar_On_Board(const id, index: Integer;
      var aRec: TList): Integer;
    function updateSonar(rec: TSonar_On_Board; id: string): Integer;
    function insertSonar(rec: TSonar_On_Board): Integer;
    function UpdateSonar_On_Board(const id: string;
      var rec: TSonar_On_Board): integer;
    function DeleteSonar_On_Board(const id: string;
      var rec: TSonar_On_Board): Integer;
    function getSonar_Def(const id: Integer; var aRec: TList;
      var rec: TSonar_On_Board): boolean;
    function updateSonar_Def(rec: TSonar_On_Board; id: string): Integer;
    function insertSonar_Def(rec: TSonar_On_Board): Integer;
    function deleteSonar_Def(id: Integer): Integer;
    function updateScriptSonar(rec: TScripted_Sonar_Event; id: string): Integer;

    function getAllSonarCategory(var cList: TList): Integer;

// -- weapons --
    // Missile
    function getAllMissile_OnBoard(const id, index: Integer;
      var aRec: TList): Integer;
    function getAllMissile_OnBoard2(const id, index: Integer;
      var aRec: TList): Integer;
    function getMissile_OnBoard_Distinct(const id: Integer;
      var aRec: TList): Integer;
    function getAllMissile(const id: Integer; var mList: TList;
      var rec: TMissile_On_Board): Integer;
    function getPIMissile(var mList: TList; ra_id, force: Integer): Integer;
    function getMissile_Def(var rec: TMissile_Definition; id: Integer): Integer;
    function updateMissile_Def(rec: TMissile_On_Board; id: string): Integer;
    function insertMissile_Def(rec: TMissile_On_Board): Integer;
    function deleteMissile_Def(id: Integer): Integer;

    //Fitted Weapon
    function GetFitted_Weapon_On_Board(const id: integer;
    var rec: TFitted_Weapon_On_Board): boolean;
    function InsertFitted_Weapon_On_Board(const id: string;const index :integer;
      var rec: TRecFitted_Weapon_On_Board): Integer;
    function DeleteFitted_Weapon_On_Board(const id: string):integer;
    function UpdateFitted_Weapon_OnBoard(const id: string;const index:integer;
      var rec: TRecFitted_Weapon_On_Board): Integer;

    function GetFitted_Weap_Launcher_On_Board(const id: integer;
    var rec: TRecFitted_Weap_Launcher_On_Board): boolean;
    function UpdateFitted_Weap_Launcher_On_Board(const id,launch: string;
    var rec: TFitted_Weap_Launcher_On_Board): integer;
    function InsertFitted_Weap_Launcher_On_Board(
    var rec: TRecFitted_Weap_Launcher_On_Board): integer;
    function DeleteFitted_Weap_Launcher_On_Board(const id: string): integer;

    // Torpedo
    function getAllTorpedo_OnBoard(const id, index: Integer;
      var aRec: TList): Integer;
    function getTorpedo_OnBoard(const id: Integer;
      var aRec: TList): Integer;
    function getAllTorpedo(const id: Integer; var mList: TList;
      var rec: TTorpedo_On_Board): Integer;
    function getPITorpedo(var mList: TList; ra_id, force: Integer): Integer;
    function updateTorpedo_Def(rec: TTorpedo_On_Board; id: string): Integer;
    function insertTorpedo_Def(rec: TTorpedo_On_Board): Integer;
    function deleteTorpedo_Def(id: Integer): Integer;
    function getTorpedo_Def(var rec: TTorpedo_Definition; id: Integer): Integer;
    procedure getTorpedoPOH(var data : TList; idx : integer);

    function getAllMines_OnBoard(const id, index: Integer;
      var aRec: TList): Integer;
    function getMine_OnBoard(const id: Integer;
      var aRec: TList): Integer;
    function getAllMine(const id: Integer; var mList: TList;
      var rec: TMine_On_Board): Integer;
    function getPIMine(var mList: TList; ra_id, force: Integer): Integer;
    function updateMine_Def(rec: TMine_On_Board; id: string): Integer;
    function insertMine_Def(rec: TMine_On_Board): Integer;
    function deleteMine_Def(id: Integer): Integer;
    function getMine_def(var rec: TMine_Definition; id: Integer): Integer;
    procedure getMinePOD(var PODList : TList; mineIndex : integer);

    function updateScriptWeapon(rec: TScripted_Weapon_Event;
      id: string): Integer;
    function updateFittedWeapon_Launch(rec: TFitted_Weap_Launcher_On_Board;
      id: string): Integer;
    function insertFittedWeapon_Launcher(rec: TFitted_Weap_Launcher_On_Board)
      : Integer;
    { skipped.
      function getAllHybrid_OnBoard(const id: integer;
      var aRec: TList): Integer; }

// -- countermeasure --

    //Accoustic Decoy
    function getAllAcoustic_Decoy_On_Board(const id: Integer;
      var aRec: TList): Integer;
    function getAccoustic_Decoy_On_Board(const id:integer;var aRec:TList):integer;
    function getAccoustic_Decoy(const id: Integer; var aRec: TList;
      var rec: TAcoustic_Decoy_On_Board): Integer;
    function updateAcoustic_Decoy_Def(rec: TAcoustic_Decoy_On_Board;
      id: string): Integer;
    function insertAcoustic_Decoy_Def(rec: TAcoustic_Decoy_On_Board): Integer;
    function deleteAccoustic_Decoy_Def(id: Integer): Integer;
    function UpdateAcoustic_Decoy_On_Board(const id: string;
    var rec: TAcoustic_Decoy_On_Board): integer;
    function InsertAcoustic_Decoy_On_Board(var rec: TAcoustic_Decoy_On_Board): Integer;
    function DeleteAcoustic_Decoy_On_Board(const id: string): Integer;

    // Air_Buble
    function getAllAir_Bubble_Mount(const id: Integer;
      var aRec: TList): Integer;
    function getAir_Buble_Mount(const id:integer;var aRec:TList):integer;
    function getAir_Bubble_Def(const id: Integer; var aRec: TList;
      var rec: TAir_Bubble_Mount): Integer;
    function updateAir_Bubble(rec: TAir_Bubble_Mount; id: string): Integer;
    function insertAir_Bubble(rec: TAir_Bubble_Mount): Integer;
    function DeleteAir_Bubble_Mount(const id: string): Integer;
    function updateAir_Bubble_Def(rec: TAir_Bubble_Mount; id: string): Integer;
    function insertAir_Bubble_Def(rec: TAir_Bubble_Mount): Integer;
    function deleteAir_Bubble_Def(id: Integer): Integer;

    // Chaff
    function getAllChaff_Definition(
        var aRec: TList): Integer;
    function getAllChaff_On_Board(const id: Integer; var aRec: TList): Integer;
    function getChaff_Def(const id: Integer; var aRec: TList;
      var rec: TChaff_On_Board): Integer;
    function updateScriptChaff(rec: TScripted_Chaff_Event; id: String): Integer;
    function updateChaff(rec: TChaff_On_Board; id: string;
      chaff_ins: string): Integer;
    function insertChaff(rec: TChaff_On_Board): Integer;
    function DeleteChaff_On_Board(const id: string;
      var rec: TChaff_On_Board): integer;
    function updateChaff_Def(var rec: TChaff_On_Board; id: string): Integer;
    function insertChaff_Def(rec: TChaff_On_Board): Integer;
    function deleteChaff_Def(id: Integer): Integer;

    // Defensive_Jammer
    function getAllChaff_Launcher_On_Board(const id: Integer;
      var aRec: TList): Integer;
    function updateChaff_Launcher(rec: TChaff_Launcher_On_Board;
      id: string): Integer;
    function insertChaff_Launcher(rec: TChaff_Launcher_On_Board): Integer;

    function getAllDefensive_Jammer_On_Board(const id: Integer;
      var aRec: TList): Integer;
    function getAllDefensive_Jammer_Definition(
        var aRec: TList): Integer;
    function getDefensive_Jammer_Def(const id: Integer; var aRec: TList;
      var rec: TDefensive_Jammer_On_Board): Integer;
    function updateDefensive_Jammer_Def(rec: TDefensive_Jammer_On_Board;
      id: string): Integer;
    function insertDefensive_Jammer_Def(rec: TDefensive_Jammer_On_Board)
      : Integer;
    function DeleteDefensive_Jammer_On_Board(const id: string;
      var rec: TDefensive_Jammer_On_Board): Integer;
    function InsertDefensive_Jammer_On_Board(const id: string;
      var rec: TDefensive_Jammer_On_Board): Integer;
    function deleteDefensive_Jammer_Def(id: Integer): Integer;

    // Floating_Decoy
    function getAllFloating_Decoy_Definition(
        var aRec: TList): Integer;
    function getAllFloating_Decoy_On_Board(const id: Integer;
      var aRec: TList): Integer;
    function getFloating_Decoy(const id: Integer; var aRec: TList;
      var rec: TFloating_Decoy_On_Board): Integer;
    function updateFloating_Decoy(rec: TFloating_Decoy_On_Board;
      id: string): Integer;
    function insertFloating_Decoy(rec: TFloating_Decoy_On_Board): Integer;
    function DeleteFloating_Decoy_On_Board(const id: string;
      var rec: TFloating_Decoy_On_Board): integer;
    function updateFloating_Decoy_Def(rec: TFloating_Decoy_On_Board;
      id: string): Integer;
    function insertFloating_Decoy_Def(rec: TFloating_Decoy_On_Board): Integer;
    function deleteFloating_Decoy_Def(id: Integer): Integer;

    // Infrared
    function getAllInfrared_Decoy_On_Board(const id: Integer;
      var aRec: TList): Integer;
    function updateScriptInfrared(rec: TScripted_Infrared_Decoy_Event;
      id: string): Integer;

    //Jammer
    function getAllJammer_On_Board(const id: Integer; var aRec: TList): Integer;
    function getJammer_OnBoard_Distinct(const id:integer;var aRec:TList):integer;
    function getJammer_Def(const id:integer;var aRec:TList):integer;
    function updateJammer(rec: TJammer_On_Board; id: string): Integer;
    function insertJammer(rec: TJammer_On_Board): Integer;
    function DeleteJammer_On_Board(const id: string;
      var rec: TJammer_On_Board): Integer;
    function updateJammer_Def(rec: TJammer_On_Board; id: string): Integer;
    function insertJammer_Def(rec: TJammer_On_Board): Integer;

    //Point_Effect
    function getAllPoint_Effect_On_Board(const id: Integer;
      var aRec: TList): Integer;
    function getAllTowed_Jammer_Decoy_On_Board_Only(const id: integer;
        var aRec: TList): Integer;
    function getAllTowed_Jammer_Decoy_On_Board(const id: Integer;
      var aRec: TList): Integer;
    function getAllTowed_Jammer_Decoy_Definition(
        var aRec: TList): Integer;
    function getTowed_Jammer_Def(const id: Integer; var aRec: TList;
      var rec: TTowed_Jammer_Decoy_On_Board): Integer;
    function updateTowed_Jammer(rec: TTowed_Jammer_Decoy_On_Board;
      id: string): Integer;
    function insertTowed_Jammer(rec: TTowed_Jammer_Decoy_On_Board): Integer;
    function DeleteTowed_Jammer_Decoy_On_Board(const id: string;
      var rec: TTowed_Jammer_Decoy_On_Board): integer;
    function updateTowed_Jammer_Def(rec: TTowed_Jammer_Decoy_On_Board;
      id: string): Integer;
    function insertTowed_Jammer_Def(rec: TTowed_Jammer_Decoy_On_Board): Integer;
    function deleteTowed_Jammer_Def(id: Integer): Integer;

    // Game_Envi
    function GetGame_Environment_Definition(const id: Integer;
      var rec: TGame_Environment_Definition): boolean;
    function GetGame_Environment_Definition_By_Identifier(const id: String;
      var rec: TGame_Environment_Definition): boolean;
    function GetAllGame_Environment_Definition(var gList: TList): Integer;
    function updateGame_Environment_Def(rec: TGame_Environment_Definition;
      id: string): Integer;
    function insertGame_Environment_Def(rec: TGame_Environment_Definition)
      : TGame_Environment_Definition;
    function deleteGame_Environment_Def(id: Integer): Integer;

    // Game Area Def
    function GetGame_Area_Def(var gList: TList): Integer;
    function GetGame_Area_DefByID(const id: Integer;
      var gameArea: TGame_Environment_Definition): Integer;
    function getGame_Area_Identifier(id: string; gList: TList;
      var rec: TGame_Environment_Definition): Integer;
    function updateGame_Area_Def(rec: TGame_Environment_Definition;
      id: string): Integer;
    function insertGame_Area_Def(rec: TGame_Environment_Definition): Integer;
    function deleteGame_Area_Def(id: Integer): Integer;


    // Cubicle_Group
    function getCubicle_GroupMemberResidu(const deploy_id, ra_id,
      force: Integer; var gList: TList): boolean;

    function getAllCubicle_Groups(const id, force: Integer; var cList: TList;
      var rec: TCubicle_Group): boolean;

    function getCubicle_GroupsByResource(const ra_id, force: Integer;
      var aRec: TList): Integer;
    function getPlatform_GroupsByResource(const ra_id, force: Integer;
      var aRec: TList): Integer;
    function getCubicle_GroupsByGroup(const id: Integer;
      var rec: TCubicle_Group): boolean;
    function getCubicle_GroupMember(var cGroup: TCubicle_Group;
      var pfList: TList): Integer;
    function getCubicle_GroupMemberByPlatform(const pi: Integer;
      var rec: TCubicle_Group_Assignment): Integer;
    function getMaxCubicle_Group(var recMax: Integer): boolean;

    function updateCubicle_Groups(var rec: TCubicle_Group; id: string): Integer;
    function insertCubicle_Groups(var rec: TCubicle_Group): Integer;

    function GetAllCubicle_Group_Assignment(const id: Integer;
      var cList: TList): boolean;

    function UpdateCubicle_Group_Assignment(const id: string;
      var rec: TCubicle_Group_Assignment): Integer;
    function InsertCubicle_Group_Assignment(var rec: TCubicle_Group_Assignment)
      : Integer;
    function DeleteCubicle_Group_Assignment(const id: Integer): Integer;

    function GetAllCubicle_Group_Channel_Assgnmnt(const id: Integer;
      var cList: TList): boolean;
    function GetCubicle_Group_Channel_Assgnmnt(const group_id, id,
      sign: Integer; var cList: TList): boolean;
    function InsertCubicle_Group_Channel_Assgnmnt
      (var rec: TCubicle_Group_Assignment): Integer;
    function UpdateCubicle_Group_Channel_Assgnmnt(const id: string;
      var rec: TCubicle_Group_Assignment): Integer;

    function  GetT3GroupList(const scID: Integer; var ss: TStringList): integer;
    function  GetT3GroupMember(const grpID: Integer; var ss: TStringList): integer;

    // Game Default
    function GetAllGame_Defaults(const id: Integer; var pList: TList;
      var rec: TGame_Defaults): Integer;
    function GetGame_Defaults(const id: Integer; var rec: TGame_Defaults)
      : boolean;
    function GetGame_Cloud_On_ESM(const id: Integer;
      var rec: TGame_Defaults): boolean;
    function GetGame_Cloud_On_Radar(const id: Integer;
      var rec: TGame_Defaults): boolean;
    function GetGame_Default_IFF_Mode_Code(const id: Integer;
      var rec: TGame_Defaults): boolean;
    function GetGame_Rainfall_On_ESM(const id: Integer;
      var rec: TGame_Defaults): boolean;
    function GetGame_Rainfall_On_Missile_Seeker(const id: Integer;
      var rec: TGame_Defaults): boolean;
    function GetGame_Rainfall_On_Radar(const id: Integer;
      var rec: TGame_Defaults): boolean;
    function GetGame_Rainfall_On_Sonar(const id: Integer;
      var rec: TGame_Defaults): boolean;
    function GetGame_Sea_On_Missile_Safe_Altitude(const id: Integer;
      var rec: TGame_Defaults): boolean;
    function GetGame_Sea_On_Radar(const id: Integer;
      var rec: TGame_Defaults): boolean;
    function GetGame_Sea_On_Sonar(const id: Integer;
      var rec: TGame_Defaults): boolean;
    function GetGame_Ship_On_Sonar(const id: Integer;
      var rec: TGame_Defaults): boolean;

    function updateGame_Defaults(rec: TGame_Defaults; id: string): Integer;
    function insertGame_Defaults(rec: TGame_Defaults): Integer;
    function deleteGame_Defaults(id: Integer): Integer;

    // Scripted
    function GetScripted_Behav(const id: Integer;
      var rec: TScripted_Behav_Definition): boolean;
    function GetScripted_Pattern(const id: Integer;
      var rec: TScripted_Pattern_Point): boolean;

    // Rainfall
    function GetRainfall_On_ESM(var aRec: TList): boolean;
    function updateRainfall_On_ESM(rec: TRainfall_On_ESM; id: string): Integer;
    function insertRainfall_On_ESM(rec: TRainfall_On_ESM): Integer;
    function GetRainfall_On_Missile(var aRec: TList): boolean;
    function GetRainfall_On_Radar(var aRec: TList): boolean;
    function updateRainfall_On_Radar(rec: TRainfall_On_Radar;
      id: string): Integer;
    function insertRainfall_On_Radar(rec: TRainfall_On_Radar): Integer;

    function GetRainfall_On_Sonar(var aRec: TList): boolean;
    function updateRainfall_On_Sonar(rec: TRainfall_On_Sonar;
      id: string): Integer;
    function insertRainfall_On_Sonar(rec: TRainfall_On_Sonar): Integer;
    function GetRainfallOnSonar(var rain: TRainRateNoiseSonarArray): boolean;

    // Cloud Effects
    function GetCloud_Effect_On_ESM(var aRec: TList): boolean;
    function updateCloud_Effects_On_ESM(rec: TCloud_Effects_On_ESM;
      id: string): Integer;
    function insertCloud_Effects_On_ESM(rec: TCloud_Effects_On_ESM): Integer;
    function GetCloud_Effect_On_Radar(var aRec: TList): boolean;
    function updateCloud_Effects_On_Radar(rec: TCloud_Effects_On_Radar;
      id: string): Integer;
    function insertCloud_Effects_On_Radar(rec: TCloud_Effects_On_Radar)
      : Integer;

    // Hosted
    function GetHelicopter(const id: Integer; var rec: THelicopter_Land_Launch_Limits): boolean;
    function GetHosted_Platform(const v_id, host_id: Integer;
      var aRec: TList): boolean;
    function updateHosted_Platform(const id: string;
      var rec: THosted_Platform): Integer;
    function insertHosted_Platform(var rec: THosted_Platform): Integer;
    function deleteHosted_Platform(const id: string):integer;

    // Sonobuoy
    function getAllSonobuoy_On_Board(const id, index: Integer;
      var aRec: TList): Integer;
    function getAllSonobuoy(const id: Integer; var sList: TList;
      var rec: TSonobuoy_On_Board): Integer;
    function getPISonobuoy(var sList: TList; ra_id, force: Integer): Integer;
    function updateSonobuoy_Def(rec: TSonobuoy_On_Board; id: string): Integer;
    function insertSonobuoy_Def(rec: TSonobuoy_On_Board): Integer;
    function deleteSonobuoy_Def(id: Integer): Integer;
    function DeleteSonobuoy_On_Board(const id: string;
      var rec: TSonobuoy_On_Board): Integer;
    function InsertSonobuoy_On_Board(const id: string;
      var rec: TSonobuoy_On_Board): Integer;
    function UpdateSonobuoy_On_Board(const id: string;
      var rec: TSonobuoy_On_Board): integer;
    function getMaxRange(const id: Integer): Double;
    function getActiveRange(const id: integer): double;
    function getPassiveRange(const id: integer): double;

    // Bomb
    function GetAllBomb(const id: Integer; var aRec: TList): Integer;
    function GetBomb_OnBoard(const id: Integer; var aRec: TList): Integer;
    function GetBomb(const id: Integer; var sList: TList;
      var rec: TBomb_Definition): Integer;
    function updateBomb_Def(rec: TBomb_Definition; id: string): Integer;
    function insertBomb_Def(rec: TBomb_Definition): Integer;
    function deleteBomb(id: Integer): Integer;

    // Gun
    function GetAllGun(const id: Integer; var aRec: TList): Integer;
    function GetGun_OnBoard (const id: Integer; var aRec: TList): Integer;
    function GetGun(const id: Integer; var sList: TList;
      var rec: TGun_Definition): Integer;
    function updateGun_Def(rec: TGun_Definition; id: string): Integer;
    function insertGun_Def(rec: TGun_Definition): Integer;
    function deleteGun(id: Integer): Integer;

    // Sea State
    function GetSeaStateOnMissile(var sea: TSingleArray): boolean;
    function GetSeaStateOnRadar(var sea: TSingleArray): boolean;

    function updateSeaState_On_Radar(rec: TSea_State_On_Radar;
      id: string): Integer;
    function insertSeaState_On_Radar(rec: TSea_State_On_Radar): Integer;

    function GetSeaStateOnSonar(var sea: TSeaStateSonarArray): boolean;
    function updateSeaStateOnSonar(rec: TSea_State_On_Sonar;
      id: string): Integer;
    function insertSeaStateOnSonar(rec: TSea_State_On_Sonar): Integer;

    // Ship
    function GetShipNoiseOnSonar(var ship: TShipNoiseOnSonarArray): boolean;
    procedure updateShipNoiseOnSonar(rec: TShip_Noise_On_Sonar;
      id: string);
    function insertShipNoiseOnSonar(rec: TShip_Noise_On_Sonar): Integer;

    // Operating Mode
    function GetOperatingMode(var operate: TString): boolean;

    // Link
    function GetLinkDefinition(const id: Integer; var aRec: TList): Integer;
    function GetLinkParticipant(lPart: TLink; pfList: TList): Integer;

    function updateLink_Def(rec: TLink; id: string): Integer;
    function insertLink_Def(rec: TLink): Integer;
    function updateLink_Part(rec: TLink; link_id: string;
      deploy_id: string): Integer;
    function insertLink_Part(rec: TLink): Integer;
    function deleteLink_Part(link_id: string; deploy_id: string): Integer;

    // Formation
    function GetFormationDefinition(const id: Integer;
      var aRec: TList): Integer;
    function GetFormationAssignment(var fAssign: TFormation;
      var pfList: TList): Integer;
    function GetFormation(const id: Integer;var pfList: TFormationManager): Integer; // refine query

    function updateFormation_Def(rec: TFormation; id: string): Integer;
    function insertFormation_Def(rec: TFormation): Integer;
    function updateFormation_Assign(rec: TFormation; form_id: string;
      pi_id: string): Integer;
    function insertFormation_Assign(rec: TFormation): Integer;
    function deleteFormation_Assign(form_id: string; pi_id: string): Integer;

    //fontTaktis
    function getAllFontTaktis(mList: TList; aFontType : Byte): Integer;

    // function GetFormation_Definition (const id: integer; var rec: TFormation_Definition): boolean;
    // Asset Deployment
    function GetAssetDeployment(const id: Integer; var asset: TAsset_Deployment)
      : boolean;

    // Default
    function GetDefaultDefinition(var def: TDefaultDef): boolean;
    function GetDefaultIFFMode(var iff: TIFFMode): boolean;

    // Geo Area
    function GetGeoAreaDefinition(const id: Integer; var aRec: TList): Integer;
    function updateGeo_Area_Def(rec: TGeo_Area_Def; id: string): Integer;
    function insertGeo_Area_Def(rec: TGeo_Area_Def): Integer;

    function updateGeo_Area_Point(rec: TGeo_Area_Point; id: string;
      point: string): Integer;
    function insertGeo_Area_Point(rec: TGeo_Area_Point): Integer;

    function updateResourceGeo_Area_Map(rec: TResource_Geo_Area_Map;
      geo_id: string): Integer;
    function insertResourceGeo_Area_Map(rec: TResource_Geo_Area_Map): Integer;
    function insertResourceOverlay_Map(rec: TResource_Overlay_Mapping): Integer;

    // Hybrid
    function GetAllHybrid_On_Board(const id: Integer; var aRec: TList): Integer;

    //load POH Torpedo hybrid
    function GetPOHHybrid(const id: Integer; var Poh: TList): Integer;

    // Reference
    function updateReference(rec: TRecReference_Point; id: string): Integer;
    function insertReference(rec: TRecReference_Point): Integer;
    function getAllReference_Point(const ra_id: integer; var aRec: TList): Integer;

    // External Comm
    function GetExternal_Communication_Channel(var aRec: TList;
      const ra_id, com_id: string; var rec: TExternal_Communication_Channel)
      : Integer;

    function GetExternal_Communication_ChannelBySceID(var aRec: TList; id : string): Integer;
    function GetExternal_Communication_ChannelByGroupID(var aRec: TList; id : string): Integer;
    function updateComm(rec: TRecExternal_Communication_Channel;
      id: string): Integer;
    function insertComm(rec: TRecExternal_Communication_Channel): Integer;
    function DeleteExternal_Communication_Channel(const id: string): Integer;

    // Note Storage
    function updateNote(rec: TNote_Storage; index: Integer;
      note_id: string): Integer;
    function insertNote(rec: TNote_Storage; index: Integer): Integer;

    // Blind Zone
    function updateBlind(rec: TBlind_Zone; index: Integer;
      blind_id: string): Integer;
    function insertBlind(rec: TBlind_Zone; index: Integer): Integer;

    // Helicopter
    function updateHelicopter(rec: THelicopter_Land_Launch_Limits;
      index: string): Integer;
    function insertHelicopter(rec: THelicopter_Land_Launch_Limits): Integer;

    // Logistic
    function GetLogistic_Characteristics(const id: Integer;
      var rec: TLogistic_Characteristics): boolean;

    // Motion
    function GetMotion_Characteristics(const id: Integer;
      var rec: TMotion_Characteristics): boolean;
    function getAllMotion_Characteristics(mList: TList): Integer;
    function updateMotion(rec: TMotion_Characteristics; index: string): Integer;
    function insertMotion(rec: TMotion_Characteristics): Integer;
    function deleteMotion(id: Integer): Integer;

    // Sub-Area
    function GetSubArea_Enviro_Definition(const id: Integer;
      var rectList: TList): boolean;
    function InsertSubArea_Enviro_Definition
      (var rec: TSubArea_Enviro_Definition): Integer;
    function UpdateSubArea_Enviro_Definition(const id: string;
      var rec: TSubArea_Enviro_Definition): Integer;
    /// <param>
    /// id_enviro = id subarea
    /// id_gameArea = id game area
    /// </param>
    function DeleteSubArea_Enviro_Definition(const id_enviro: Integer;
      const id_gameArea: Integer): Integer;

    // Runtime Platform Library
    function GetRuntime_Platform_Library(const id: Integer; var pList: TList;
      var rec: TRuntime_Platform_Library): boolean;
    function GetRuntime_Platform_LibraryByResourceAlloc(const id: Integer;
      var pList: TList): boolean;
    function InsertRuntime_Platform_Library(var rec: TRuntime_Platform_Library)
      : Integer;
    function InsertRuntime_Platform_LibraryByResourceAlloc(const id: string;
      var rec: TRuntime_Platform_Library): Integer;
    function UpdateRuntime_Platform_Library(const id: string;
      var rec: TRuntime_Platform_Library): Integer;
    function DeleteRuntime_Platform_Library(const id: string): Integer;
    function DeleteRuntime_Platform_LibraryByResourceAlloc(const id: string)
      : Integer;

    // Platform Library Entry
    function InsertPlatform_Library_Entry(var rec: TPlatform_Library_Entry)
      : Integer;
    function GetPlatform_Library_Entry(const id: Integer;
      var rec: TPlatform_Library_Entry): boolean;
    function getAllPlatform_Library_Entry(const id: Integer;
      var aRec: TList): Integer;
    function UpdatePlatform_Library_Entry(const id: string;
      var rec: TPlatform_Library_Entry): Integer;
    function DeletePlatform_Library_Entry(const id: string;
      var rec: TPlatform_Library_Entry): Integer;

    // Radar Interval
    function GetRadar_Interval_List(const id: Integer; var pList: TList;
      var rec: TRadar_Interval_List): boolean;
    function UpdateRadar_Interval_List(const id: string;
      var rec: TRadar_Interval_List): Integer;
    function InsertRadar_Interval_List(const id: string;
      var rec: TRadar_Interval_List): Integer;
    function DeleteRadar_Interval_List(const id: string): Integer;

    // Overlay
    function GetOverlay_Definition_List(const id: Integer; var pList: TList;
      var rec: TOverlay_Definition): boolean;
    function GetOverlay_Definition_ByID(const id: Integer;
      var rec: TOverlay_Definition): boolean;
    function UpdateOverlay_Definition_List(const id: string;
      var rec: TOverlay_Definition): Integer;
    function InsertOverlay_Definition_List(const id: string;
      var rec: TOverlay_Definition): Integer;
    function DeleteOverlay_Definition(const id: string): Integer;

    //Overlay
    function GetOverlay_Definition(const id: Integer; var aRec: TList): Integer;
    function GetOverlay_DefinitionByID(const id: Integer; var rec: TOverlay_Definition): Integer;
    function updateOverlay_Definition(rec: TOverlay_Definition; id: string): Integer;
    function insertOverlay_Definition(rec: TRecOverlay_Definition): Integer;
    function insert_Resource_Overlay_Mapping(rec: TResource_Allocation) : Integer;
    function updateResourceOverlay_Map(var rec: TResource_Overlay_Mapping;const id:integer):integer;
    function GetOverlay(const id: Integer; var aRec: TList): Integer;
    function GetAllOverlay_Shape(const id: Integer; var aRec: TList): Integer;
    function checkOverlayName(aName :string):Boolean;
    function getOverlayIndex(aName: String; aType:integer): Integer;
    function checkOverlayNameScenario(aIdx: Integer):Boolean;

    //Plotting
    function InsertPlotting_Definition(aRec : TrecPlotting_Definition): Integer;
    function CekPlottingInsert(aName : string):Boolean;
    function GetIdPlotting(const anName : string; atype : Integer; var aIndex : integer ): Integer;
    function InsertPlottingMapping(var aRec : TResource_Allocation): Integer;
    // Student Role
    function GetStudent_Role_Definition(const role_id, id: Integer;
      var pList: TList; var rec: TStudent_Role_Definition): boolean;
    function GetStudentRoleByResource(const ra_id: Integer;
      var sList: TList): boolean;

    function updateStudent_Def(rec: TStudent_Role_Definition;
      id: string): Integer;
    function insertStudent_Def(rec: TStudent_Role_Definition): Integer;
    function DeleteStudent_Role_Definition(const id: string): Integer;

    function GetStudent_Role_List(const id: Integer; var pList: TList;
      var rec: TStudent_Role_List): boolean;
    function GetMaxRecStudent_Role_List(var rec: TStudent_Role_List): boolean;
    function updateStudent_List(rec: TStudent_Role_List; id: string): Integer;
    function insertStudent_List(rec: TStudent_Role_List): Integer;
    function DeleteStudent_Role_List(const id: string): Integer;

    // POD vs SNR
    function GetPOD_vs_SNR_Curve_Definition(const id: Integer; pList: TList;
      var rec: TPOD_vs_SNR_Curve_Definition): boolean;
    function UpdatePOD_vs_SNR_Curve_Definition(const id: string;
      var rec: TPOD_vs_SNR_Curve_Definition): Integer;
    function InsertPOD_vs_SNR_Curve_Definition(var rec: TPOD_vs_SNR_Curve_Definition): Integer;
    function DeletePOD_vs_SNR_Curve_Definition(const id: string): Integer;

    function GetPOD_vs_SNR_Curve_Point(const id: Integer; pList: TList): boolean;
    function updatePOD_vs_SNR_Point(rec: TPOD_vs_SNR_Point;
      index: string): Integer;
    function insertPOD_vs_SNR_Point(rec: TPOD_vs_SNR_Point): Integer;


    procedure getAllVehicleProperties(vIndex: Integer;
      vehicle: TVehicle_Definition);
    procedure getAllRuntimePlatform(allocIndex: Integer;
      var list: TList);
    procedure GetCubicle_GroupMemberPlatformID(const grpId: Integer;
      var pi: TIntegerArray);

    // Predefined Pattern
    function GetPredefined_Pattern(const id: Integer; var rec: TRecPredefined_Pattern): boolean;
    function InsertPredefined_Pattern(var rec: TPredefined_Pattern): Integer;
    function UpdatePredefined_Pattern(const id: string;
      var rec: TPredefined_Pattern): Integer;
    function DeletePredefined_Pattern(const id: string;
      var rec: TPredefined_Pattern): Integer;

    function GetAllResource_Pattern_Mapping(const ra_id: Integer; var mList: TList): boolean;


    //Point Effect On Board
    function GetPoint_Effect_On_Board(const id: integer;
    var rec: TPoint_Effect_On_Board): boolean;
    function InsertPoint_Effect_On_Board(const id: string;const index:integer;
    var rec: TPoint_Effect_On_Board): integer;
    function UpdatePoint_Effect_On_Board(const id: string;const index:integer;
    var rec: TPoint_Effect_On_Board): integer;
    function DeletePoint_Effect_On_Board(const id: string): integer;

    function recordFrame(RecordID : Integer; RecordTick : Int64;
        RecordStructType : integer; RecordBlob : TStream;
        QueueNo : LongInt) : Boolean;
    function newRecord(ScenarioIndex : Integer; RecordName : String;
      gameTime : TDateTime) : integer; // return recordindex
    procedure updateRecTimeStop(RecordIdx : Integer; gameTime : TDateTime) ;
    function getRecords(RecordName: String; RecordTbl: TZQuery): boolean;overload;
    procedure getRecordTime(RecordName: String; out TimeStart, TimeStop : TDateTime );

    function newSnapshot(ScenarioIndex : Integer; SnapshotName : String;
      gameTime : TDateTime) : integer; //x

    function SnapshotData(SnapshotIndex : Integer;
        RecordStructType : integer; RecordBlob : TStream; Size: integer) : Boolean;

    function getSnapshotData(SnapshotName: String; RecordTbl: TZQuery): boolean;overload;
    procedure getSnapshotTime(SnapshotName: String; out GameTime : TDateTime );

    function CekWaypointName(WaypointName : String) : Boolean; //x
    function newWaypoint(RAid : Integer; WaypointName : String; Termination : Integer;
    lat, Long : Double; Dimensi : Single) : integer; //x
    procedure WaypointData(WaypointIndex : Integer; Waypoint : TRecScripted_Behav_Definition);

    function GetWaypoint(RAid : Integer; WaypointList : TList) : integer; //x
    function GetWaypointData(WaypointIndex : Integer; ListData : TList) : integer; //x

    // Embark Library

    function GetPlatform_Embark_Library(const id: Integer; var pList: TList): integer;
    function GetPersonel_Embark_Library(const id: Integer; var pList: Tlist): Boolean;
    function GetBatalyon(const id: Integer; var pList: TList): Boolean;
    function GetKompi(const id: Integer; var pList: TList): Boolean;
    function GetPlatoon(const id: Integer; var pList: TList): Boolean;
    function GetGroup(const id: Integer; var pList: TList): Boolean;

    function GetEmbark_LibByResAlloc(const id: Integer; 
	var pList: TList): boolean;
    function GetPlatformCapability(const id: Integer; var rec: TCapability_Characteristics): Boolean;
  end;

  function IntToDateTime(const int: Integer):TDateTime;
  function DateTimeToInt(const dt:TDateTime):integer;

var
  dmTTT: TdmTTT;

implementation

uses
  uDBAsset_Embark_Library, uBrigadePersonel, uT3Vehicle;

{ uses uSonar, uOverlay; }
{$R *.dfm}

// ------------------------------------------------------------------------------
function IntToDateTime(const int: Integer):TDateTime;
begin
  result := int / (60 * 60 * 24 ) ;

end;

function DateTimeToInt(const dt: TDateTime):integer;
begin
  result := Round(frac(dt) * (60 * 60 * 24));
end;


function TdmTTT.InitZDB(const zDbServer, zDBProto, zDBname, zDBuser,
  zDBPass: string): boolean;
var
  connStr : String;
begin
  //result := false;
  with ZConn do
  begin
    HostName := zDbServer;
    Protocol := zDBProto;
    Database := zDBname;
    User := zDBuser;
    Password := zDBPass;
  end;

//  // bug dari zeosdb adalah gagal waktu menyimpan blob data pada sqlserver
//  // so, pake adodb saja.
//  with ADOConn do
//  begin
//    connStr :=
////      'Provider=SQLNCLI.1;' +
//      'Provider=SQLOLEDB.1;' +
//      'Password=' + zDBPass + ';' +
//      'Persist Security Info=False;' +
//      'User ID=' + zDBuser + ';'+
//      'Initial Catalog=' + zDBname + ';' +
//      'Data Source=' + zDbServer + ';' +
//      'Use Procedure for Prepare=1;';
//  end;

  try
    ZConn.Connect;
//    ADOConn.Connected := True;
    result := ZConn.Connected;
  except
    on Exception do
    begin
      MessageDlg('Error Database Connection on ' + zDbServer, mtError, [mbOK],
        0);
      result := false;
      exit;
    end
  end;
  ZQ.Connection := ZConn;
end;

// ------------------------------------------------------------------------------
function TdmTTT.GetScenario(const id: Integer; var rec: TScenario_Definition)
  : boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Scenario_Definition');
    SQL.Add('WHERE (Scenario_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TScenario_Definition.Create;

      with rec.FData do
      begin
        Scenario_Index := FieldByName('Scenario_Index').AsInteger;
        Scenario_Identifier := FieldByName('Scenario_Identifier').AsString;
        Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
        Scenario_Code := FieldByName('Scenario_Code').AsInteger;
      end;
    end;
  end;
end;

/// /====================================================
function TdmTTT.getAllScenario_Definition(var aRec: TList): Integer;
var
  //i: Integer;
  rec: TScenario_Definition;
begin
  result := -1;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Scenario_Definition ');
    SQL.Add('WHERE  Scenario_Code = 0 ');
    SQL.Add('ORDER BY Scenario_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TScenario_Definition.Create;
        with rec.FData do
        begin
          Scenario_Index := FieldByName('Scenario_Index').AsInteger;
          Scenario_Identifier := FieldByName('Scenario_Identifier').AsString;
          Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
          Scenario_Code := FieldByName('Scenario_Code').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateScenario(rec: TScenario_Definition;
  value: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Scenario_Definition');
      SQL.Add('SET ');
      SQL.Add('Scenario_Identifier=''' + Scenario_Identifier + ''',');
      SQL.Add('Resource_Alloc_Index=' + IntToStr(Resource_Alloc_Index));
    end;

    SQL.Add('WHERE (Scenario_Index = ' + value + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertScenario(rec: TScenario_Definition): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Scenario_Definition');
      SQL.Add('(Scenario_Identifier,Resource_Alloc_Index,Scenario_Code) ');
      SQL.Add('VALUES (');
      SQL.Add('''' + Scenario_Identifier + ''',');
      SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
      SQL.Add(IntToStr(Scenario_Code) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM  Scenario_Definition ');
      SQL.Add('WHERE  Scenario_Identifier = ' + quotedStr(Scenario_Identifier));
      Open;

      rec.FData.Scenario_Index := FieldByName('Scenario_Index').AsInteger;

      SQL.Clear;
      SQL.Add('INSERT INTO Asset_Deployment_Definition');
      SQL.Add('VALUES (');
      SQL.Add('''' + '(Scenario ' + IntToStr(Scenario_Index) + ')' + ''',');
      SQL.Add(IntToStr(Scenario_Index) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.DeleteScenario_Definition(const id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Scenario_Definition  ');
    SQL.Add('WHERE (Scenario_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertSeaState_On_Radar(rec: TSea_State_On_Radar): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Sea_State_On_Radar] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Sea_State_On_Radar');
      SQL.Add('(Sea_State,Effect_on_Radar) ');
      SQL.Add('VALUES (');
      SQL.Add(IntToStr(Sea_State) + ',');
      SQL.Add(FloatToStr(Effect_on_Radar) + ')');
    end;
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetResourceAlloc(const id: Integer;
  var rec: TResource_Allocation): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Resource_Allocation ');
    SQL.Add('WHERE (Resource_Alloc_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TResource_Allocation.Create;

      with rec.FData do
      begin
        Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
        Allocation_Identifier := FieldByName('Allocation_Identifier').AsString;
        Game_Enviro_Index := FieldByName('Game_Enviro_Index').AsInteger;
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Role_List_Index := FieldByName('Role_List_Index').AsInteger;
        D_Day := FieldByName('D_Day').AsFloat;
        Game_Start_Time := FieldByName('Game_Start_Time').AsFloat;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetResource_Overlay_Mapping(const id: Integer;
  var recList: TList): boolean;
var
  rec: TResource_Allocation;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Resource_Overlay_Mapping a JOIN Overlay_Definition b');
    SQL.Add('on a.Overlay_Index = b.Overlay_Index');
    SQL.Add('WHERE (Resource_Alloc_Index = ' + IntToStr(id) + ')');
    //ShowMessage(SQL.Text);
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(recList) then
        recList := TList.Create
      else
        recList.Clear;

      while not ZQ.Eof do
      begin
        rec := TResource_Allocation.Create;

        with rec.FOverlay do
        begin
          Overlay_Index := FieldByName('Overlay_Index').AsInteger;
          Overlay_Identifier := FieldByName('Overlay_Identifier').AsString;
          Overlay_Filename := FieldByName('Overlay_Filename').AsString;
          Static_Overlay := FieldByName('Static_Overlay').AsInteger;
          Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
          domain := FieldByName('Domain').AsInteger;
          Force := FieldByName('Force_Designation').AsInteger;
        end;

        recList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;

end;
function TdmTTT.GetResource_Plotting_mapping(const id: Integer;
  var recList: TList): Boolean;
var
  rec: TResource_Allocation;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Resource_Plotting_Mapping a JOIN Plotting_Definition b');
    SQL.Add('on a.Plotting_Index = b.Plotting_Index');
    SQL.Add('WHERE (Resource_Alloc_Index = ' + IntToStr(id) + ')');
    //ShowMessage(SQL.Text);
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(recList) then
        recList := TList.Create
      else
        recList.Clear;

      while not ZQ.Eof do
      begin
        rec := TResource_Allocation.Create;

        with rec.FPlotting do
        begin
          Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').asinteger;
          Plotting_Index  := FieldByName('Plotting_Index').AsInteger;
          Plotting_Name   := FieldByName('Plotting_Name').AsString;
          Plotting_Type := FieldByName('Plotting_Type').AsInteger;
          Plotting_Group := FieldByName('Plotting_Group').AsInteger;
          Date   := FieldByName('Date').AsFloat;
          Force := FieldByName('Force').AsInteger;
        end;
        recList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updatePlatformInstance(var rec: TPlatform_Instance;
  const pi_id, mis_id, tor_id, mine_id, hybrid_id, satelit_id, son_id: Integer)
  : Integer;
var
  ssql: string;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      ssql := 'UPDATE Platform_Instance SET ';

      if mis_id <> -1 then
      begin
        ssql := ssql + 'Missile_Index = ' + IntToStr(mis_id) + ',';
      end
      else if mis_id = -1 then
      begin
        ssql := ssql + 'Missile_Index = Null' + ',';
      end;

      if tor_id <> -1 then
      begin
        ssql := ssql + 'Torpedo_Index = ' + IntToStr(tor_id) + ',';
      end
      else if tor_id = -1 then
      begin
        ssql := ssql + 'Torpedo_Index = Null' + ',';
      end;

      if mine_id <> -1 then
      begin
        ssql := ssql + 'Mine_Index = ' + IntToStr(mine_id) + ',';
      end
      else if mine_id = -1 then
      begin
        ssql := ssql + 'Mine_Index = Null' + ',';
      end;

      if hybrid_id <> -1 then
      begin
        ssql := ssql + 'Hybrid_Index = ' + IntToStr(hybrid_id) + ',';
      end
      else if hybrid_id = -1 then
      begin
        ssql := ssql + 'Hybrid_Index = Null' + ',';
      end;

      if satelit_id <> -1 then
      begin
        ssql := ssql + 'Satellite_Index = ' + IntToStr(satelit_id) + ',';
      end
      else if satelit_id = -1 then
      begin
        ssql := ssql + 'Satellite_Index = Null' + ',';
      end;

      if son_id <> -1 then
      begin
        ssql := ssql + 'Sonobuoy_Index = ' + IntToStr(son_id);
      end
      else if son_id = -1 then
      begin
        ssql := ssql + 'Sonobuoy_Index = Null';
      end;

      ssql := ssql + ' WHERE (Platform_Instance_Index = ' + IntToStr(pi_id)
        + ')';
      SQL.Add(ssql);
      ExecSQL;

    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updatePlatformInst(rec: TList; pi_id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with TPlatform_Instance(rec).FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Platform_Instance  ');
      SQL.Add('SET  ');
      SQL.Add('Platform_Instance_Index = ' + IntToStr(Platform_Instance_Index)
          + ',');
      SQL.Add('Resource_Alloc_Index = ' + IntToStr(Resource_Alloc_Index) + ',');
      SQL.Add('Platform_Type = ' + IntToStr(Platform_Type) + ',');
      SQL.Add('Vehicle_Index = ' + IntToStr(Vehicle_Index) + ',');
      SQL.Add('Missile_Index = ' + IntToStr(Missile_Index) + ',');
      SQL.Add('Torpedo_Index = ' + IntToStr(Torpedo_Index) + ',');
      SQL.Add('Mine_Index = ' + IntToStr(Mine_Index) + ',');
      SQL.Add('Hybrid_Index = ' + IntToStr(Hybrid_Index) + ',');
      SQL.Add('Satellite_Index = ' + IntToStr(Satellite_Index) + ',');
      SQL.Add('Sonobuoy_Index = ' + IntToStr(Sonobuoy_Index) + ',');
      SQL.Add('Instance_Name = ' + (Instance_Name) + ',');
      SQL.Add('Force_Designation = ' + IntToStr(Force_Designation) + ',');
      SQL.Add('Track_ID = ' + (Track_ID));
    end;
    SQL.Add(' WHERE (Platform_Instance_Index = ' + pi_id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updatePredifened_Pattern(rec: TPredefined_Pattern;
  id, pattern_id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Predefined_Pattern');
      SQL.Add('SET ');
      SQL.Add('Pattern_Identifier = ' + (Pattern_Identifier) + ',');
      SQL.Add('Pattern_Type = ' + IntToStr(Pattern_Type) + ',');
      SQL.Add('Pattern_Termination = ' + IntToStr(Pattern_Termination) + ',');
      SQL.Add('Termination_Heading = ' + FloatToStr(Termination_Heading));
    end;
    SQL.Add('WHERE (Pattern_Index = ' + pattern_id + ' AND');
    SQL.Add('Vehicle_Index=' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetPlatform_ActivationByPlatformInstance(const id: Integer;
  var rec: TPlatform_Activation): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Platform_Activation ');
    SQL.Add('WHERE (Platform_Instance_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TPlatform_Activation.Create;

      with rec.FData do
      begin
        Platform_Event_Index := FieldByName('Platform_Event_Index').AsInteger;
        Deployment_Index := FieldByName('Deployment_Index').AsInteger;
        Platform_Instance_Index := FieldByName('Platform_Instance_Index')
          .AsInteger;
        Platform_Activation_Time := FieldByName('Platform_Activation_Time')
          .AsInteger;
        Init_Guidance_Type := FieldByName('Init_Guidance_Type').AsInteger;
        Init_Position_Latitude := FieldByName('Init_Position_Latitude').AsFloat;
        Init_Position_Longitude := FieldByName('Init_Position_Longitude')
          .AsFloat;
        Init_Position_Cartesian_X := FieldByName('Init_Position_Cartesian_X')
          .AsSingle;
        Init_Position_Cartesian_Y := FieldByName('Init_Position_Cartesian_Y')
          .AsSingle;
        Init_Altitude := FieldByName('Init_Altitude').AsSingle;
//        Init_Logistic := FieldByName('Init_Logistic').AsSingle;
        Init_Course := FieldByName('Init_Course').AsSingle;
        Init_Fuel := FieldByName('Init_Fuel').AsSingle;
        Init_Lubricants := FieldByName('Init_Lubricants').AsSingle;
        Init_Freshwater := FieldByName('Init_Freshwater').AsSingle;
        Init_Water := FieldByName('Init_Water').AsSingle;
        Init_Food := FieldByName('Init_Food').AsSingle;
        Init_Helm_Angle := FieldByName('Init_Helm_Angle').AsSingle;
        Init_Ground_Speed := FieldByName('Init_Ground_Speed').AsInteger;
        Init_Vertical_Speed := FieldByName('Init_Vertical_Speed').AsInteger;
        Init_Command_Altitude := FieldByName('Init_Command_Altitude').AsSingle;
        Init_Command_Course := FieldByName('Init_Command_Course').AsSingle;
        Init_Command_Helm_Angle := FieldByName('Init_Command_Helm_Angle')
          .AsSingle;
        Init_Command_Ground := FieldByName('Init_Command_Ground').AsInteger;
        Init_Command_Vert := FieldByName('Init_Command_Vert').AsInteger;
        Deg_of_Rotation := FieldByName('Deg_of_Rotation').AsSingle;
        Radius_of_Travel := FieldByName('Radius_of_Travel').AsSingle;
        Direction_of_Travel := FieldByName('Direction_of_Travel').AsInteger;
        Circle_Latitude := FieldByName('Circle_Latitude').AsFloat;
        Circle_Longitude := FieldByName('Circle_Longitude').AsFloat;
        Circle_X := FieldByName('Circle_X').AsSingle;
        Circle_Y := FieldByName('Circle_Y').AsSingle;
        Dynamic_Circle_Range_Offset := FieldByName
          ('Dynamic_Circle_Range_Offset').AsSingle;
        Dynamic_Circle_Angle_Offset := FieldByName
          ('Dynamic_Circle_Angle_Offset')
          .AsInteger;
        Dynamic_Circle_Offset_Mode := FieldByName('Dynamic_Circle_Offset_Mode')
          .AsInteger;
        Period_Distance := FieldByName('Period_Distance').AsSingle;
        Amplitude_Distance := FieldByName('Amplitude_Distance').AsSingle;
        Zig_Zag_Leg_Type := FieldByName('Zig_Zag_Leg_Type').AsInteger;
        Target_Angle_Offset := FieldByName('Target_Angle_Offset').AsSingle;
        Target_Angle_Type := FieldByName('Target_Angle_Type').AsInteger;
        Target_Range := FieldByName('Target_Range').AsSingle;
        Guidance_Target := FieldByName('Guidance_Target').AsInteger;
        Pattern_Instance_Index := FieldByName('Pattern_Instance_Index')
          .AsInteger;
        Angular_Offset := FieldByName('Angular_Offset').AsSingle;
        Anchor_Cartesian_X := FieldByName('Anchor_Cartesian_X').AsSingle;
        Anchor_Cartesian_Y := FieldByName('Anchor_Cartesian_Y').AsSingle;
        Anchor_Latitude := FieldByName('Anchor_Latitude').AsSingle;
        Anchor_Longitude := FieldByName('Anchor_Longitude').AsSingle;
        Current_Drift := FieldByName('Current_Drift').AsInteger;
        Waypoint_Termination := FieldByName('Waypoint_Termination').AsInteger;
        Termination_Heading := FieldByName('Termination_Heading').AsSingle;
        Cond_List_Instance_Index := FieldByName('Cond_List_Instance_Index')
          .AsInteger;
        Damage := FieldByName('Damage').AsSingle;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetPlatform_ActivationToPlatformInstance(const id: Integer;
  var rec: TPlatform_Instance): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Platform_Activation a');
    SQL.Add(
      'join Asset_Deployment_Definition b on a.Deployment_Index = b.Deployment_Index');
    SQL.Add
      ('join Scenario_Definition c on b.Scenario_Index = c.Scenario_Index');
    SQL.Add(
      'join Platform_Instance d on a.Platform_Instance_Index = d.Platform_Instance_Index');
    SQL.Add('WHERE (a.Platform_Instance_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TPlatform_Instance.Create;

      with rec.FActivation do
      begin
        Platform_Event_Index := FieldByName('Platform_Event_Index').AsInteger;
        Deployment_Index := FieldByName('Deployment_Index').AsInteger;
        Platform_Instance_Index := FieldByName('Platform_Instance_Index')
          .AsInteger;
        Platform_Activation_Time := FieldByName('Platform_Activation_Time')
          .AsInteger;
        Init_Guidance_Type := FieldByName('Init_Guidance_Type').AsInteger;
        Init_Position_Latitude := FieldByName('Init_Position_Latitude').AsFloat;
        Init_Position_Longitude := FieldByName('Init_Position_Longitude')
          .AsFloat;
        Init_Position_Cartesian_X := FieldByName('Init_Position_Cartesian_X')
          .AsSingle;
        Init_Position_Cartesian_Y := FieldByName('Init_Position_Cartesian_Y')
          .AsSingle;
        Init_Altitude := FieldByName('Init_Altitude').AsSingle;
//        Init_Logistic := FieldByName('Init_Logistic').AsSingle;
        Init_Course := FieldByName('Init_Course').AsSingle;
        Init_Fuel := FieldByName('Init_Fuel').AsSingle;
        Init_Lubricants := FieldByName('Init_Lubricants').AsSingle;
        Init_Freshwater := FieldByName('Init_Freshwater').AsSingle;
        Init_Water := FieldByName('Init_Water').AsSingle;
        Init_Food := FieldByName('Init_Food').AsSingle;
        Init_Helm_Angle := FieldByName('Init_Helm_Angle').AsSingle;
        Init_Ground_Speed := FieldByName('Init_Ground_Speed').AsInteger;
        Init_Vertical_Speed := FieldByName('Init_Vertical_Speed').AsInteger;
        Init_Command_Altitude := FieldByName('Init_Command_Altitude').AsSingle;
        Init_Command_Course := FieldByName('Init_Command_Course').AsSingle;
        Init_Command_Helm_Angle := FieldByName('Init_Command_Helm_Angle')
          .AsSingle;
        Init_Command_Ground := FieldByName('Init_Command_Ground').AsInteger;
        Init_Command_Vert := FieldByName('Init_Command_Vert').AsInteger;
        Deg_of_Rotation := FieldByName('Deg_of_Rotation').AsSingle;
        Radius_of_Travel := FieldByName('Radius_of_Travel').AsSingle;
        Direction_of_Travel := FieldByName('Direction_of_Travel').AsInteger;
        Circle_Latitude := FieldByName('Circle_Latitude').AsFloat;
        Circle_Longitude := FieldByName('Circle_Longitude').AsFloat;
        Circle_X := FieldByName('Circle_X').AsSingle;
        Circle_Y := FieldByName('Circle_Y').AsSingle;
        Dynamic_Circle_Range_Offset := FieldByName
          ('Dynamic_Circle_Range_Offset').AsSingle;
        Dynamic_Circle_Angle_Offset := FieldByName
          ('Dynamic_Circle_Angle_Offset')
          .AsInteger;
        Dynamic_Circle_Offset_Mode := FieldByName('Dynamic_Circle_Offset_Mode')
          .AsInteger;
        Period_Distance := FieldByName('Period_Distance').AsSingle;
        Amplitude_Distance := FieldByName('Amplitude_Distance').AsSingle;
        Zig_Zag_Leg_Type := FieldByName('Zig_Zag_Leg_Type').AsInteger;
        Target_Angle_Offset := FieldByName('Target_Angle_Offset').AsSingle;
        Target_Angle_Type := FieldByName('Target_Angle_Type').AsInteger;
        Target_Range := FieldByName('Target_Range').AsSingle;
        Guidance_Target := FieldByName('Guidance_Target').AsInteger;
        Pattern_Instance_Index := FieldByName('Pattern_Instance_Index')
          .AsInteger;
        Angular_Offset := FieldByName('Angular_Offset').AsSingle;
        Anchor_Cartesian_X := FieldByName('Anchor_Cartesian_X').AsSingle;
        Anchor_Cartesian_Y := FieldByName('Anchor_Cartesian_Y').AsSingle;
        Anchor_Latitude := FieldByName('Anchor_Latitude').AsSingle;
        Anchor_Longitude := FieldByName('Anchor_Longitude').AsSingle;
        Current_Drift := FieldByName('Current_Drift').AsInteger;
        Waypoint_Termination := FieldByName('Waypoint_Termination').AsInteger;
        Termination_Heading := FieldByName('Termination_Heading').AsSingle;
        Cond_List_Instance_Index := FieldByName('Cond_List_Instance_Index')
          .AsInteger;
        Damage := FieldByName('Damage').AsSingle;
      end;

      if rec.FActivation.Pattern_Instance_Index <> 0 then
      begin
        GetPredefined_Pattern(rec.FActivation.Pattern_Instance_Index,rec.FPattern);
      end;
    end;
  end;
end;

function TdmTTT.GetPlatform_Embark_Library(const id: Integer; var pList: TList): integer;
var
  rec: TPlatform_Embark_Library;
begin

  Result := -1;
  if not ZConn.Connected then
    Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT a.Platform_Embark_Index, a.Embark_Library_Index, ');
    SQL.Add('b.Vehicle_Identifier, a.Vehicle_Index, a.Quantity, ');
    SQL.Add('b.Width, b.Length, b.Platform_Domain, b.Platform_Type ');
    SQL.Add('FROM Platform_Embark_Library a Join Vehicle_Definition b ');
    SQL.Add('ON a.Vehicle_Index = b.Vehicle_Index ');
    SQL.Add('WHERE (Embark_Library_Index = ' + IntToStr(id) + ')');

    Open;

    Result := RecordCount;
    if not Assigned(pList) then
      pList.Create
    else
      pList.Clear;

    if not IsEmpty then
    begin
      First;
      while not ZQ.Eof do
      begin
        rec := TPlatform_Embark_Library.Create;
        with rec.FData do
        begin
          Platform_Embark_Index := FieldByName('Platform_Embark_Index').AsInteger;
          Embark_Library_Index := FieldByName('Embark_Library_Index').AsInteger;
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
          Width := FieldByName('Width').AsFloat;
          Length := FieldByName('Length').AsFloat;
          Domain := FieldByName('Platform_Domain').AsInteger;
          PlatformType := FieldByName('Platform_Type').AsInteger;
        end;
        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updatePlatformActivation(var rec: TList;
  pi_id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with TPlatform_Instance(rec).FActivation do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Platform_Activation ');
      SQL.Add('SET ');
      // SQL.Add('Deployment_Index='+ IntToStr(Deployment_Index)+',' );
      // SQL.Add('Platform_Event_Index ='+ IntToStr(Platform_Event_Index) +',');
      SQL.Add('Platform_Activation_Time =' + IntToStr(Platform_Activation_Time)
          + ',');
      SQL.Add('Init_Guidance_Type =' + IntToStr(Init_Guidance_Type) + ',');
      SQL.Add('Init_Position_Latitude =' + FloatToStr(Init_Position_Latitude)
          + ',');
      SQL.Add('Init_Position_Longitude =' + FloatToStr(Init_Position_Longitude)
          + ',');
      SQL.Add('Init_Position_Cartesian_X =' + FloatToStr
          (Init_Position_Cartesian_X) + ',');
      SQL.Add('Init_Position_Cartesian_Y =' + FloatToStr
          (Init_Position_Cartesian_Y) + ',');
      SQL.Add('Init_Altitude =' + FloatToStr(Init_Altitude) + ',');
//      SQL.Add('Init_Logistic =' + FloatToStr(Init_Logistic) + ',');
      SQL.Add('Init_Course =' + FloatToStr(Init_Course) + ',');
      SQL.Add('Init_Fuel =' + FloatToStr(Init_Fuel) + ',');
      SQL.Add('Init_Lubricants =' + FloatToStr(Init_Lubricants) + ',');
      SQL.Add('Init_Freshwater =' + FloatToStr(Init_Freshwater) + ',');
      SQL.Add('Init_Water =' + FloatToStr(Init_Water) + ',');
      SQL.Add('Init_Food =' + FloatToStr(Init_Food) + ',');
      SQL.Add('Init_Helm_Angle =' + FloatToStr(Init_Helm_Angle) + ',');
      SQL.Add('Init_Ground_Speed =' + IntToStr(Init_Ground_Speed) + ',');
      SQL.Add('Init_Vertical_Speed =' + IntToStr(Init_Vertical_Speed) + ',');
      SQL.Add('Init_Command_Altitude =' + FloatToStr(Init_Command_Altitude)
          + ',');
      SQL.Add('Init_Command_Course =' + FloatToStr(Init_Command_Course) + ',');
      SQL.Add('Init_Command_Helm_Angle =' + FloatToStr(Init_Command_Helm_Angle)
          + ',');
      SQL.Add('Init_Command_Ground =' + IntToStr(Init_Command_Ground) + ',');
      SQL.Add('Init_Command_Vert =' + IntToStr(Init_Command_Vert) + ',');
      SQL.Add('Deg_of_Rotation =' + FloatToStr(Deg_of_Rotation) + ',');
      SQL.Add('Radius_of_Travel =' + FloatToStr(Radius_of_Travel) + ',');
      SQL.Add('Direction_of_Travel =' + IntToStr(Direction_of_Travel) + ',');
      SQL.Add('Circle_Latitude =' + FloatToStr(Circle_Latitude) + ',');
      SQL.Add('Circle_Longitude =' + FloatToStr(Circle_Longitude) + ',');
      SQL.Add('Circle_X =' + FloatToStr(Circle_X) + ',');
      SQL.Add('Circle_Y =' + FloatToStr(Circle_Y) + ',');
      SQL.Add('Dynamic_Circle_Range_Offset =' + FloatToStr
          (Dynamic_Circle_Range_Offset) + ',');
      SQL.Add('Dynamic_Circle_Angle_Offset =' + IntToStr
          (Dynamic_Circle_Angle_Offset) + ',');
      SQL.Add('Dynamic_Circle_Offset_Mode =' + IntToStr
          (Dynamic_Circle_Offset_Mode) + ',');
      SQL.Add('Period_Distance =' + FloatToStr(Period_Distance) + ',');
      SQL.Add('Amplitude_Distance =' + FloatToStr(Amplitude_Distance) + ',');
      SQL.Add('Zig_Zag_Leg_Type =' + IntToStr(Zig_Zag_Leg_Type) + ',');
      SQL.Add('Target_Angle_Offset =' + FloatToStr(Target_Angle_Offset) + ',');
      SQL.Add('Target_Angle_Type =' + IntToStr(Target_Angle_Type) + ',');
      SQL.Add('Target_Range =' + FloatToStr(Target_Range) + ',');
      // SQL.Add('Guidance_Target ='+ IntToStr(Guidance_Target)+',' );
      // SQL.Add('Pattern_Instance_Index ='+ IntToStr(Pattern_Instance_Index)+',' );
      SQL.Add('Angular_Offset  =' + FloatToStr(Angular_Offset) + ',');
      SQL.Add('Anchor_Cartesian_X =' + FloatToStr(Anchor_Cartesian_X) + ',');
      SQL.Add('Anchor_Cartesian_Y =' + FloatToStr(Anchor_Cartesian_Y) + ',');
      SQL.Add('Anchor_Latitude =' + FloatToStr(Anchor_Latitude) + ',');
      SQL.Add('Anchor_Longitude =' + FloatToStr(Anchor_Longitude) + ',');
      SQL.Add('Current_Drift =' + IntToStr(Current_Drift) + ',');
      SQL.Add('Waypoint_Termination =' + IntToStr(Waypoint_Termination) + ',');
      SQL.Add('Termination_Heading =' + FloatToStr(Termination_Heading) + ',');
      // SQL.Add('Cond_List_Instance_Index  ='+ IntToStr(Cond_List_Instance_Index )+',' );
      SQL.Add('Damage =' + FloatToStr(Damage));
    end;

    SQL.Add('WHERE Platform_Instance_Index = ' + pi_id { +' AND ' } );
    ExecSQL;

  end;
end;
// ------------------------------------------------------------------------------

function TdmTTT.updatePlatformAct(var rec: TPlatform_Instance;
  pi_id: Integer): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FActivation do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Platform_Activation ');
      SQL.Add('SET ');
      // SQL.Add('Deployment_Index='+ IntToStr(Deployment_Index)+',' );
      // SQL.Add('Platform_Event_Index ='+ IntToStr(Platform_Event_Index) +',');
      SQL.Add('Platform_Activation_Time =' + IntToStr(Platform_Activation_Time)
          + ',');
      SQL.Add('Init_Guidance_Type =' + IntToStr(Init_Guidance_Type) + ',');
      SQL.Add('Init_Position_Latitude =' + FloatToStr(Init_Position_Latitude)
          + ',');
      SQL.Add('Init_Position_Longitude =' + FloatToStr(Init_Position_Longitude)
          + ',');
      SQL.Add('Init_Position_Cartesian_X =' + FloatToStr
          (Init_Position_Cartesian_X) + ',');
      SQL.Add('Init_Position_Cartesian_Y =' + FloatToStr
          (Init_Position_Cartesian_Y) + ',');
      SQL.Add('Init_Altitude =' + FloatToStr(Init_Altitude) + ',');
//      SQL.Add('Init_Logistic =' + FloatToStr(Init_Logistic) + ',');
      SQL.Add('Init_Course =' + FloatToStr(Init_Course) + ',');
      SQL.Add('Init_Fuel =' + FloatToStr(Init_Fuel) + ',');
      SQL.Add('Init_Lubricants =' + FloatToStr(Init_Lubricants) + ',');
      SQL.Add('Init_Freshwater =' + FloatToStr(Init_Freshwater) + ',');
      SQL.Add('Init_Water =' + FloatToStr(Init_Water) + ',');
      SQL.Add('Init_Food =' + FloatToStr(Init_Food) + ',');
      SQL.Add('Init_Helm_Angle =' + FloatToStr(Init_Helm_Angle) + ',');
      SQL.Add('Init_Ground_Speed =' + IntToStr(Init_Ground_Speed) + ',');
      SQL.Add('Init_Vertical_Speed =' + IntToStr(Init_Vertical_Speed) + ',');
      SQL.Add('Init_Command_Altitude =' + FloatToStr(Init_Command_Altitude)
          + ',');
      SQL.Add('Init_Command_Course =' + FloatToStr(Init_Command_Course) + ',');
      SQL.Add('Init_Command_Helm_Angle =' + FloatToStr(Init_Command_Helm_Angle)
          + ',');
      SQL.Add('Init_Command_Ground =' + IntToStr(Init_Command_Ground) + ',');
      SQL.Add('Init_Command_Vert =' + IntToStr(Init_Command_Vert) + ',');
      SQL.Add('Deg_of_Rotation =' + FloatToStr(Deg_of_Rotation) + ',');
      SQL.Add('Radius_of_Travel =' + FloatToStr(Radius_of_Travel) + ',');
      SQL.Add('Direction_of_Travel =' + IntToStr(Direction_of_Travel) + ',');
      SQL.Add('Circle_Latitude =' + FloatToStr(Circle_Latitude) + ',');
      SQL.Add('Circle_Longitude =' + FloatToStr(Circle_Longitude) + ',');
      SQL.Add('Circle_X =' + FloatToStr(Circle_X) + ',');
      SQL.Add('Circle_Y =' + FloatToStr(Circle_Y) + ',');
      SQL.Add('Dynamic_Circle_Range_Offset =' + FloatToStr
          (Dynamic_Circle_Range_Offset) + ',');
      SQL.Add('Dynamic_Circle_Angle_Offset =' + IntToStr
          (Dynamic_Circle_Angle_Offset) + ',');
      SQL.Add('Dynamic_Circle_Offset_Mode =' + IntToStr
          (Dynamic_Circle_Offset_Mode) + ',');
      SQL.Add('Period_Distance =' + FloatToStr(Period_Distance) + ',');
      SQL.Add('Amplitude_Distance =' + FloatToStr(Amplitude_Distance) + ',');
      SQL.Add('Zig_Zag_Leg_Type =' + IntToStr(Zig_Zag_Leg_Type) + ',');
      SQL.Add('Target_Angle_Offset =' + FloatToStr(Target_Angle_Offset) + ',');
      SQL.Add('Target_Angle_Type =' + IntToStr(Target_Angle_Type) + ',');
      SQL.Add('Target_Range =' + FloatToStr(Target_Range) + ',');
      // SQL.Add('Guidance_Target ='+ IntToStr(Guidance_Target)+',' );
      // SQL.Add('Pattern_Instance_Index ='+ IntToStr(Pattern_Instance_Index)+',' );
      SQL.Add('Angular_Offset  =' + FloatToStr(Angular_Offset) + ',');
      SQL.Add('Anchor_Cartesian_X =' + FloatToStr(Anchor_Cartesian_X) + ',');
      SQL.Add('Anchor_Cartesian_Y =' + FloatToStr(Anchor_Cartesian_Y) + ',');
      SQL.Add('Anchor_Latitude =' + FloatToStr(Anchor_Latitude) + ',');
      SQL.Add('Anchor_Longitude =' + FloatToStr(Anchor_Longitude) + ',');
      SQL.Add('Current_Drift =' + IntToStr(Current_Drift) + ',');
      SQL.Add('Waypoint_Termination =' + IntToStr(Waypoint_Termination) + ',');
      SQL.Add('Termination_Heading =' + FloatToStr(Termination_Heading) + ',');
      // SQL.Add('Cond_List_Instance_Index  ='+ IntToStr(Cond_List_Instance_Index )+',' );
      SQL.Add('Damage =' + FloatToStr(Damage));
    end;

    SQL.Add('WHERE Platform_Event_Index = ' + IntToStr(pi_id) { +' AND ' } );
    ExecSQL;

  end;
end;
function TdmTTT.UpdatePlatformActClient(var aLat, aLong, aCourse: Double;
  Alt: Single; CartX, CartY, pi_id: Integer): Integer;
begin
  result := -1;
  with ZQ do
  begin

    Close;
    SQL.Clear;
    SQL.Add('UPDATE Platform_Activation ');
    SQL.Add('SET ');

    SQL.Add('Init_Position_Latitude =' + FloatToStr(aLat)
        + ',');
    SQL.Add('Init_Position_Longitude =' + FloatToStr(aLong)
        + ',');
    SQL.Add('Init_Position_Cartesian_X =' + FloatToStr
        (CartY) + ',');
    SQL.Add('Init_Position_Cartesian_Y =' + FloatToStr
        (CartX) + ',');
    SQL.Add('Init_Altitude =' + FloatToStr(Alt) + ',');
    SQL.Add('Init_Course =' + FloatToStr(aCourse));


    SQL.Add('WHERE Platform_Event_Index = ' + IntToStr(pi_id) { +' AND ' } );
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.InsertPlatform_Activation(var rec: TPlatform_Instance): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FActivation do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Platform_Activation (');

      SQL.Add('Deployment_Index, ');
      SQL.Add('Platform_Instance_Index, ');
      SQL.Add('Platform_Activation_Time, ');
      SQL.Add('Init_Guidance_Type, ');
      SQL.Add('Init_Position_Latitude, ');
      SQL.Add('Init_Position_Longitude, ');
      SQL.Add('Init_Position_Cartesian_X, ');
      SQL.Add('Init_Position_Cartesian_Y, ');
      SQL.Add('Init_Altitude, ');
//      SQL.Add('Init_Logistic, ');
      SQL.Add('Init_Course, ');
      SQL.Add('Init_Fuel, ');
      SQL.Add('Init_Lubricants, ');
      SQL.Add('Init_Freshwater, ');
      SQL.Add('Init_Water, ');
      SQL.Add('Init_Food, ');
      SQL.Add('Init_Helm_Angle, ');
      SQL.Add('Init_Ground_Speed, ');
      SQL.Add('Init_Vertical_Speed, ');
      SQL.Add('Init_Command_Altitude, ');
      SQL.Add('Init_Command_Course, ');
      SQL.Add('Init_Command_Helm_Angle, ');
      SQL.Add('Init_Command_Ground, ');
      SQL.Add('Init_Command_Vert, ');
      SQL.Add('Deg_of_Rotation, ');
      SQL.Add('Radius_of_Travel, ');
      SQL.Add('Direction_of_Travel, ');
      SQL.Add('Circle_Latitude, ');
      SQL.Add('Circle_Longitude, ');
      SQL.Add('Circle_X, ');
      SQL.Add('Circle_Y, ');
      SQL.Add('Dynamic_Circle_Range_Offset, ');
      SQL.Add('Dynamic_Circle_Angle_Offset, ');
      SQL.Add('Dynamic_Circle_Offset_Mode, ');
      SQL.Add('Period_Distance, ');
      SQL.Add('Amplitude_Distance, ');
      SQL.Add('Zig_Zag_Leg_Type, ');
      SQL.Add('Target_Angle_Offset, ');
      SQL.Add('Target_Angle_Type, ');
      SQL.Add('Target_Range, ');
      // SQL.Add('Guidance_Target, ');
      // SQL.Add('Pattern_Instance_Index, ');
      SQL.Add('Angular_Offset, ');
      SQL.Add('Anchor_Cartesian_X, ');
      SQL.Add('Anchor_Cartesian_Y, ');
      SQL.Add('Anchor_Latitude, ');
      SQL.Add('Anchor_Longitude, ');
      SQL.Add('Current_Drift, ');
      SQL.Add('Waypoint_Termination, ');
      SQL.Add('Termination_Heading, ');
      // SQL.Add('Cond_List_Instance_Index, ');
      SQL.Add('Damage) ');

      SQL.Add('VALUES ( ');
      // SQL.Add(IntToStr(Platform_Event_Index)+',');
      SQL.Add(IntToStr(Deployment_Index) + ',');
      SQL.Add(IntToStr(Platform_Instance_Index) + ',');
      SQL.Add(IntToStr(Platform_Activation_Time) + ',');
      SQL.Add(IntToStr(Init_Guidance_Type) + ',');
      SQL.Add(FloatToStr(Init_Position_Latitude) + ',');
      SQL.Add(FloatToStr(Init_Position_Longitude) + ',');
      SQL.Add(FloatToStr(Init_Position_Cartesian_X) + ',');
      SQL.Add(FloatToStr(Init_Position_Cartesian_Y) + ',');
      SQL.Add(FloatToStr(Init_Altitude) + ',');
//      SQL.Add(FloatToStr(Init_Logistic) + ',');
      SQL.Add(FloatToStr(Init_Course) + ',');
      SQL.Add(FloatToStr(Init_Fuel) + ',');
      SQL.Add(FloatToStr(Init_Lubricants) + ',');
      SQL.Add(FloatToStr(Init_Freshwater) + ',');
      SQL.Add(FloatToStr(Init_Water) + ',');
      SQL.Add(FloatToStr(Init_Food) + ',');
      SQL.Add(FloatToStr(Init_Helm_Angle) + ',');
      SQL.Add(IntToStr(Init_Ground_Speed) + ',');
      SQL.Add(IntToStr(Init_Vertical_Speed) + ',');
      SQL.Add(FloatToStr(Init_Command_Altitude) + ',');
      SQL.Add(FloatToStr(Init_Command_Course) + ',');
      SQL.Add(FloatToStr(Init_Command_Helm_Angle) + ',');
      SQL.Add(IntToStr(Init_Command_Ground) + ',');
      SQL.Add(IntToStr(Init_Command_Vert) + ',');
      SQL.Add(FloatToStr(Deg_of_Rotation) + ',');
      SQL.Add(FloatToStr(Radius_of_Travel) + ',');
      SQL.Add(IntToStr(Direction_of_Travel) + ',');
      SQL.Add(FloatToStr(Circle_Latitude) + ',');
      SQL.Add(FloatToStr(Circle_Longitude) + ',');
      SQL.Add(FloatToStr(Circle_X) + ',');
      SQL.Add(FloatToStr(Circle_Y) + ',');
      SQL.Add(FloatToStr(Dynamic_Circle_Range_Offset) + ',');
      SQL.Add(IntToStr(Dynamic_Circle_Angle_Offset) + ',');
      SQL.Add(IntToStr(Dynamic_Circle_Offset_Mode) + ',');
      SQL.Add(FloatToStr(Period_Distance) + ',');
      SQL.Add(FloatToStr(Amplitude_Distance) + ',');
      SQL.Add(IntToStr(Zig_Zag_Leg_Type) + ',');
      SQL.Add(FloatToStr(Target_Angle_Offset) + ',');
      SQL.Add(IntToStr(Target_Angle_Type) + ',');
      SQL.Add(FloatToStr(Target_Range) + ',');
      // SQL.Add(IntToStr(Guidance_Target)+',');
      // SQL.Add(IntToStr(Pattern_Instance_Index)+',');
      SQL.Add(FloatToStr(Angular_Offset) + ',');
      SQL.Add(FloatToStr(Anchor_Cartesian_X) + ',');
      SQL.Add(FloatToStr(Anchor_Cartesian_Y) + ',');
      SQL.Add(FloatToStr(Anchor_Latitude) + ',');
      SQL.Add(FloatToStr(Anchor_Longitude) + ',');
      SQL.Add(IntToStr(Current_Drift) + ',');
      SQL.Add(IntToStr(Waypoint_Termination) + ',');
      SQL.Add(FloatToStr(Termination_Heading) + ',');
      // SQL.Add(IntToStr(Cond_List_Instance_Index)+',');
      SQL.Add(FloatToStr(Damage) + ')');
      // ShowMessage(SQL.Text);
    end;
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deletePlatformActivation(var pi_id: string;
  deploy_id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Platform_Activation ');
    SQL.Add('WHERE Platform_Instance_Index = ' + pi_id + ' AND ');
    SQL.Add('Deployment_Index=' + deploy_id);
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deletePlatformByIndex(const platform_instace_index: string)
  : Integer;
begin
  result := -1;
  with ZQ do
  begin
    // delete platform Instance
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Platform_Instance');
    SQL.Add('WHERE Platform_Instance_Index = ' + platform_instace_index);
    ExecSQL;
    // delete platform Activation
    SQL.Clear;
    SQL.Add('DELETE FROM Platform_Activation');
    SQL.Add('WHERE Platform_Instance_Index = ' + platform_instace_index);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getPlatformType(var aRec: TList): Integer;
var
  recType: TPlatform_Type;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select *');
    SQL.Add('FROM Platform_Type_Def');
    Open;

    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        recType := TPlatform_Type.Create;

        recType.FData.Platform_Type := FieldByName('Platform_Type').AsInteger;
        recType.FData.Platform_Type_Definition := FieldByName
          ('Platform_Type_Definition').AsString;

        aRec.Add(recType);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllResource_Allocation(var aRec: TList): Integer;
var
  //i: Integer;
  rec: TResource_Allocation;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Resource_Allocation ');
    SQL.Add('ORDER BY Allocation_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TResource_Allocation.Create;

        with rec.FData do
        begin
          Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
          Allocation_Identifier := FieldByName('Allocation_Identifier')
            .AsString;
          Game_Enviro_Index := FieldByName('Game_Enviro_Index').AsInteger;
          Defaults_Index := FieldByName('Defaults_Index').AsInteger;
          Role_List_Index := FieldByName('Role_List_Index').AsInteger;
          Game_Start_Time := FieldByName('Game_Start_Time').AsFloat;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

procedure TdmTTT.getAllRuntimePlatform(allocIndex: Integer;
  var list: TList);
var
  rec: TRuntime_Platform_Library;
  listPLE, recList: TList;
  //ple: TPlatform_Library_Entry;
  i, J: Integer;
  aObject: TObject;
begin
  if not Assigned(list) then
    list := TList.Create;

  recList := TList.Create;
  rec := TRuntime_Platform_Library.Create;
  GetRuntime_Platform_LibraryByResourceAlloc(allocIndex, recList);

  if recList.Count = 0 then exit;

  // cuma ambil yang pertama
  rec := TRuntime_Platform_Library(recList[0]);

  for i := 0 to recList.Count - 1 do
  begin
    // ple := TPlatform_Library_Entry(rec.FPlatform_Library_Entry[i]);
    getAllPlatform_Library_Entry(TRuntime_Platform_Library(recList[i])
        .FData.Platform_Library_Index,
        TRuntime_Platform_Library(recList[i]).FPlatform_Library_Entry);

    listPLE := TRuntime_Platform_Library(recList[i]).FPlatform_Library_Entry;

    for J := 0 to listPLE.Count - 1 do
    begin
      with TPlatform_Library_Entry(listPLE[J]).FData do
      begin
        aObject := nil;

        if Vehicle_Index <> 0 then
        begin
          GetVehicle_Definition(Vehicle_Index, TVehicle_Definition(aObject));
          // getAllVehicleProperties(Vehicle_Index,TVehicle_Definition(aObject));
        end;

        if Missile_Index <> 0 then
          getMissile_Def(TMissile_Definition(aObject), Missile_Index);

        if Torpedo_Index <> 0 then
          getTorpedo_Def(TTorpedo_Definition(aObject), Torpedo_Index);

        if Mine_Index <> 0 then
          getMine_def(TMine_Definition(aObject), Mine_Index);

        if Hybrid_Index <> 0 then
          ;

        if Sonobuoy_Index <> 0 then
          ;

        if aObject <> nil then
          list.Add(aObject);
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetMaxResource_Allocation(var id: Integer): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT MAX(Resource_Alloc_Index) as last');
    SQL.Add('FROM Resource_Allocation ');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      id := Fields[0].AsInteger;
    end;
  end;
end;

procedure TdmTTT.getMinePOD(var PODList: TList; mineIndex: integer);
var
  ppod : TMine_POD_vs_Range;
begin
  if not ZConn.Connected then
    exit;

  if not Assigned(PODList) then
    PODList := TList.Create;

  with ZQ do
  begin
    Close;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Mine_POD_vs_Range g ');
    SQL.Add('WHERE (g.Mine_Index = ' + IntToStr(mineIndex) + ')');
    Open;

    First;

    while not ZQ.Eof do
    begin
      ppod := TMine_POD_vs_Range.Create;

      with ppod.FData do
      begin
        List_Index        := FieldByName('List_Index').AsInteger;
        Mine_Index        := FieldByName('Mine_Index').AsInteger;
        Prob_of_Detonation:= FieldByName('Prob_of_Detonation').AsSingle;
        Range             := FieldByName('Range').AsSingle;
      end;

      PODList.Add(ppod);
      ZQ.Next;
    end;
  end;
end;

function TdmTTT.getMine_def(var rec: TMine_Definition; id: Integer): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Mine_Definition ';
    if id <> 0 then
      ssql := ssql + 'WHERE Mine_Index=' + IntToStr(id);
    SQL.Add(ssql);
    SQL.Add('ORDER BY Mine_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      rec := TMine_Definition.Create;
      with rec.FData do
      begin
        Mine_Index := FieldByName('Mine_Index').AsInteger;
        Mine_Identifier := FieldByName('Mine_Identifier').AsString;
        Platform_Domain := FieldByName('Platform_Domain').AsInteger;
        Platform_Category := FieldByName('Platform_Category').AsInteger;
        Platform_Type := FieldByName('Platform_Type').AsInteger;
        Mine_Classification := FieldByName('Mine_Classification').AsInteger;
        Length := FieldByName('Length').AsSingle;
        Width := FieldByName('Width').AsSingle;
        Height := FieldByName('Height').AsSingle;
        Mooring_Type := FieldByName('Mooring_Type').AsInteger;
        Max_Laying_Depth := FieldByName('Max_Laying_Depth').AsSingle;
        Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
        Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
        Mine_Lethality := FieldByName('Mine_Lethality').AsInteger;
        Engagement_Range := FieldByName('Engagement_Range').AsSingle;
        Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
        Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
        Detectability_Type := FieldByName('Detectability_Type').AsInteger;
      end;
    end;
  end;
end;

function TdmTTT.getMissile_Def(var rec: TMissile_Definition; id: Integer): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Missile_Definition ';
    if id <> 0 then
      ssql := ssql + 'WHERE Missile_Index =' + IntToStr(id);
    SQL.Add(ssql);
    SQL.Add('ORDER BY Class_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      rec := TMissile_Definition.Create;
      First;

      with rec.FData do
      begin
        Missile_Index := FieldByName('Missile_Index').AsInteger;
        Class_Identifier := FieldByName('Class_Identifier').AsString;
        Platform_Domain := FieldByName('Platform_Domain').AsInteger;
        Platform_Category := FieldByName('Platform_Category').AsInteger;
        Platform_Type := FieldByName('Platform_Type').AsInteger;
        Max_Range := FieldByName('Max_Range').AsSingle;
        Min_Range := FieldByName('Min_Range').AsSingle;
        Motion_Index := FieldByName('Motion_Index').AsInteger;
        Seeker_TurnOn_Range := FieldByName('Seeker_TurnOn_Range').AsSingle;
        Second_Seeker_Pattern_Capable := FieldByName
          ('Second_Seeker_Pattern_Capable').AsInteger;
        Seeker_Bias_Capable := FieldByName('Seeker_Bias_Capable').AsInteger;
        Fixed_Seeker_Turn_On_Range := FieldByName('Fixed_Seeker_Turn_On_Range')
          .AsInteger;
        Lethality := FieldByName('Lethality').AsInteger;
        Prob_of_Hit := FieldByName('Prob_of_Hit').AsSingle;
        Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
        Default_Altitude := FieldByName('Default_Altitude').AsSingle;
        Length := FieldByName('Length').AsSingle;
        Width := FieldByName('Width').AsSingle;
        Height := FieldByName('Height').AsSingle;
        Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
        Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
        Front_Visual_Cross := FieldByName('Front_Visual_Cross').AsSingle;
        Side_Visual_Cross := FieldByName('Side_Visual_Cross').AsSingle;
        Front_Infrared_Cross := FieldByName('Front_Infrared_Cross').AsSingle;
        Side_Infrared_Cross := FieldByName('Side_Infrared_Cross').AsSingle;
        Pursuit_Guide_Type := FieldByName('Pursuit_Guide_Type').AsInteger;
        Primary_Guide_Type := FieldByName('Primary_Guide_Type').AsInteger;
        Secondary_Guide_Type := FieldByName('Secondary_Guide_Type').AsInteger;
        Anti_Air_Capable := FieldByName('Anti_Air_Capable').AsInteger;
        Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
        Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
        Anti_Land_Capable := FieldByName('Anti_Land_Capable').AsInteger;
        Anti_Amphibious_Capable := FieldByName('Anti_Amphibious_Capable').AsInteger;
        Primary_Target_Domain := FieldByName('Primary_Target_Domain').AsInteger;
        SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
        CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
        TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
        IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
        AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
        Transmitted_Frequency := FieldByName('Transmitted_Frequency').AsFloat;
        Scan_Rate := FieldByName('Scan_Rate').AsSingle;
        Pulse_Rep_Freq := FieldByName('Pulse_Rep_Freq').AsSingle;
        Pulse_Width := FieldByName('Pulse_Width').AsSingle;
        Xmit_Power := FieldByName('Xmit_Power').AsSingle;
        TARH_Jamming_A_Probability := FieldByName('TARH_Jamming_A_Probability')
          .AsSingle;
        TARH_Jamming_B_Probability := FieldByName('TARH_Jamming_B_Probability')
          .AsSingle;
        TARH_Jamming_C_Probability := FieldByName('TARH_Jamming_C_Probability')
          .AsSingle;
        Wpt_Capable := FieldByName('Wpt_Capable').AsInteger;
        Max_Num_Wpts := FieldByName('Max_Num_Wpts').AsInteger;
        Min_Final_Leg_Length := FieldByName('Min_Final_Leg_Length').AsSingle;
        Engagement_Range := FieldByName('Engagement_Range').AsSingle;
        Max_Firing_Depth := FieldByName('Max_Firing_Depth').AsSingle;
        Upper_Received_Freq := FieldByName('Upper_Received_Freq').AsFloat;
        Lower_Received_Freq := FieldByName('Lower_Received_Freq').AsFloat;
        Fly_Out_Required := FieldByName('Fly_Out_Required').AsInteger;
        Fly_Out_Range := FieldByName('Fly_Out_Range').AsSingle;
        Fly_Out_Altitude := FieldByName('Fly_Out_Altitude').AsSingle;
        Booster_Separation_Required := FieldByName
          ('Booster_Separation_Required')
          .AsInteger;
        Booster_Separation_Range := FieldByName('Booster_Separation_Range')
          .AsSingle;
        Booster_Separation_Box_Width := FieldByName
          ('Booster_Separation_Box_Width').AsSingle;
        Booster_Separation_Box_Length := FieldByName
          ('Booster_Separation_Box_Length').AsSingle;
        Term_Guide_Azimuth := FieldByName('Term_Guide_Azimuth').AsSingle;
        Term_Guide_Elevation := FieldByName('Term_Guide_Elevation').AsSingle;
        Term_Guide_Range := FieldByName('Term_Guide_Range').AsSingle;
        Terminal_Guidance_Capability := FieldByName
          ('Terminal_Guidance_Capability').AsInteger;
        Terminal_Altitude_Required := FieldByName('Terminal_Altitude_Required')
          .AsInteger;
        Terminal_Acquisition_Altitude := FieldByName
          ('Terminal_Acquisition_Altitude').AsSingle;
        Terminal_Sinuation_Start_Range := FieldByName
          ('Terminal_Sinuation_Start_Range').AsSingle;
        Terminal_Sinuation_Period := FieldByName('Terminal_Sinuation_Period')
          .AsSingle;
        Terminal_Sinuation_Amplitude := FieldByName
          ('Terminal_Sinuation_Amplitude').AsSingle;
        Terminal_Pop_Up_Range := FieldByName('Terminal_Pop_Up_Range').AsSingle;
        Terminal_Pop_Up_Altitude := FieldByName('Terminal_Pop_Up_Altitude')
          .AsSingle;
        Mid_Course_Update_Mode := FieldByName('Mid_Course_Update_Mode')
          .AsInteger;
        Home_On_Jam_Type_A_Capable := FieldByName('Home_On_Jam_Type_A_Capable')
          .AsInteger;
        Home_On_Jam_Type_B_Capable := FieldByName('Home_On_Jam_Type_B_Capable')
          .AsInteger;
        Home_On_Jam_Type_C_Capable := FieldByName('Home_On_Jam_Type_C_Capable')
          .AsInteger;
        Launch_Method := FieldByName('Launch_Method').AsInteger;
        Data_Entry_Method := FieldByName('Data_Entry_Method').AsInteger;
        Launch_Speed := FieldByName('Launch_Speed').AsInteger;
        Max_Target_Altitude_Delta := FieldByName('Max_Target_Altitude_Delta')
          .AsInteger;
        Term_Guide_Azimuth_Narrow := FieldByName('Term_Guide_Azimuth_Narrow')
          .AsSingle;
        Term_Guide_Elevation_Narrow := FieldByName
          ('Term_Guide_Elevation_Narrow').AsSingle;
        Term_Guide_Range_Narrow := FieldByName('Term_Guide_Range_Narrow')
          .AsSingle;
        Spot_Number := FieldByName('Spot_Number').AsInteger;
        ECCM_Type := FieldByName('ECCM_Type').AsInteger;
        ECM_Detonation := FieldByName('ECM_Detonation').AsInteger;
        ECM_Detection := FieldByName('ECM_Detection').AsInteger;
        Detectability_Type := FieldByName('Detectability_Type').AsInteger;
        IRCM_Detonation := FieldByName('IRCM_Detonation').AsInteger;
        IRCM_Detection := FieldByName('IRCM_Detection').AsInteger;
        Sea_State_Modelling_Capable := FieldByName
          ('Sea_State_Modelling_Capable')
          .AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateResource(rec: TResource_Allocation; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Resource_Allocation');
      SQL.Add('SET ');
      SQL.Add('Allocation_Identifier =''' + Allocation_Identifier + ''',');
      SQL.Add('Game_Enviro_Index =' + IntToStr(Game_Enviro_Index) + ',');
      SQL.Add('Defaults_Index =' + IntToStr(Defaults_Index) + ',');
      SQL.Add('Role_List_Index =' + IntToStr(Role_List_Index) + ',');
      SQL.Add('Game_Start_Time =' + FloatToStr(Game_Start_Time) + ' ');
    end;

    SQL.Add('WHERE (Resource_Alloc_Index = ' + id + ')');
    // ShowMessage(SQL.Text);
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertResource(var rec: TResource_Allocation): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Resource_Allocation');
      SQL.Add(
        '(Allocation_Identifier,Game_Enviro_Index,Defaults_Index,Role_List_Index,Game_Start_Time,D_Day)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Allocation_Identifier + ''',');
      SQL.Add(IntToStr(Game_Enviro_Index) + ',');
      SQL.Add(IntToStr(Defaults_Index) + ',');
      SQL.Add(IntToStr(Role_List_Index) + ',');
      SQL.Add(FloatToStr(Game_Start_Time) + ',');
      SQL.Add(FloatToStr(D_Day) + ')');
      // ShowMessage(SQL.Text);
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT * FROM Resource_Allocation ');
      SQL.Add('WHERE Allocation_Identifier = ' + quotedStr
          (Allocation_Identifier));

      Open;

      with rec.FData do
      begin
        Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.DeleteResource_Allocation(const id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Resource_Allocation  ');
    SQL.Add('WHERE (Resource_Alloc_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetStudent_Role_Definition(const role_id, id: Integer;
  var pList: TList; var rec: TStudent_Role_Definition): boolean;
var
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := ssql + 'SELECT * FROM Student_Role_Definition ';
    if role_id <> 0 then
      ssql := ssql + 'WHERE Student_Role_Index = ' + IntToStr(role_id)
    else if id <> 0 then
      ssql := ssql + 'WHERE (Role_List_Index = ' + IntToStr(id) + ')';
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not Assigned(pList) then
    begin
      pList.Create;
    end
    else
    begin
      pList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TStudent_Role_Definition.Create;

        with rec.FData do
        begin
          Student_Role_Index := FieldByName('Student_Role_Index').AsInteger;
          Role_Identifier := FieldByName('Role_Identifier').AsString;
          Role_List_Index := FieldByName('Role_List_Index').AsInteger;
        end;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetStudentRoleByResource(const ra_id: Integer;
  var sList: TList): boolean;
var
  ssql: string;
  rec: TStudent_Role_List;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := ssql +
      'SELECT * FROM Student_Role_List a JOIN Resource_Allocation b ';
    ssql := ssql + 'ON a.Role_List_Index = b.Role_List_Index ';
    if ra_id <> 0 then
      ssql := ssql + 'WHERE b.Resource_Alloc_Index = ' + IntToStr(ra_id);
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not Assigned(sList) then
    begin
      sList.Create;
    end
    else
    begin
      sList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TStudent_Role_List.Create;

        with rec.FData do
        begin
          Role_List_Index := FieldByName('Role_List_Index').AsInteger;
          Role_List_Identifier := FieldByName('Role_List_Identifier').AsString;
        end;

        sList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateStudent_Def(rec: TStudent_Role_Definition;
  id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Student_Role_Definition');
      SQL.Add('SET ');
      SQL.Add('Role_Identifier =''' + Role_Identifier + ''',');
      SQL.Add('Role_List_Index =' + IntToStr(Role_List_Index) + ' ');
    end;

    SQL.Add('WHERE (Student_Role_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertStudent_Def(rec: TStudent_Role_Definition): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Student_Role_Definition');
      SQL.Add('(Role_Identifier,Role_List_Index) ');
      SQL.Add('VALUES (');
      SQL.Add('''' + Role_Identifier + ''',');
      SQL.Add(FloatToStr(Role_List_Index) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.DeleteStudent_Role_Definition(const id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Student_Role_Definition  ');
    SQL.Add('WHERE (Student_Role_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateStudent_List(rec: TStudent_Role_List;
  id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Student_Role_List');
      SQL.Add('SET ');
      SQL.Add('Role_List_Identifier =''' + Role_List_Identifier + ''' ');
    end;

    SQL.Add('WHERE (Role_List_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertStudent_List(rec: TStudent_Role_List): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Student_Role_List');
      SQL.Add('(Role_List_Identifier) ');
      SQL.Add('VALUES (');
      SQL.Add('''' + Role_List_Identifier + ''')');
      ExecSQL;
      SQL.Clear;
      SQL.Add('SELECT * FROM Student_Role_List ');
      SQL.Add('WHERE Role_List_Identifier = ' + quotedStr(Role_List_Identifier)
        );

      Open;

      with rec.FData do
      begin
        Role_List_Index := FieldByName('Role_List_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllPlatFormInstance(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TPlatform_Instance;
  I: Integer;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ');
    SQL.Add('PlatForm_Instance a  JOIN Platform_Activation b ');
    SQL.Add('ON a.Platform_Instance_Index = b.Platform_Instance_Index ');
    SQL.Add('WHERE (Resource_Alloc_Index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY a.Instance_Name');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TPlatform_Instance.Create;

        with rec.FData do
        begin
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger; // byte
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index := FieldByName('Mine_Index').AsInteger;
          Hybrid_Index := FieldByName('Hybrid_Index').AsInteger;
          Satellite_Index := FieldByName('Satellite_Index').AsInteger;
          Sonobuoy_Index := FieldByName('Sonobuoy_Index').AsInteger;
          Instance_Name := FieldByName('Instance_Name').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
          Track_ID := FieldByName('Track_ID').AsString;
          Instance_Ident_Index := FieldByName('Instance_Ident_Index').AsInteger;
        end;

        with rec.FActivation do
        begin
          Platform_Event_Index := FieldByName('Platform_Event_Index').AsInteger;
          Deployment_Index := FieldByName('Deployment_Index').AsInteger;
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Platform_Activation_Time := FieldByName('Platform_Activation_Time')
            .AsInteger;
          Init_Guidance_Type := FieldByName('Init_Guidance_Type').AsInteger;
          Init_Position_Latitude := FieldByName('Init_Position_Latitude')
            .AsFloat;
          Init_Position_Longitude := FieldByName('Init_Position_Longitude')
            .AsFloat;
          Init_Position_Cartesian_X := FieldByName('Init_Position_Cartesian_X')
            .AsSingle;
          Init_Position_Cartesian_Y := FieldByName('Init_Position_Cartesian_Y')
            .AsSingle;
          Init_Altitude := FieldByName('Init_Altitude').AsSingle;
          Init_Course := FieldByName('Init_Course').AsSingle;
          Init_Helm_Angle := FieldByName('Init_Helm_Angle').AsSingle;
          Init_Ground_Speed := FieldByName('Init_Ground_Speed').AsInteger;
          Init_Vertical_Speed := FieldByName('Init_Vertical_Speed').AsInteger;
          Init_Command_Altitude := FieldByName('Init_Command_Altitude')
            .AsSingle;
          Init_Command_Course := FieldByName('Init_Command_Course').AsSingle;
          Init_Command_Helm_Angle := FieldByName('Init_Command_Helm_Angle')
            .AsSingle;
          Init_Command_Ground := FieldByName('Init_Command_Ground').AsInteger;
          Init_Command_Vert := FieldByName('Init_Command_Vert').AsInteger;
          Deg_of_Rotation := FieldByName('Deg_of_Rotation').AsSingle;
          Radius_of_Travel := FieldByName('Radius_of_Travel').AsSingle;
          Direction_of_Travel := FieldByName('Direction_of_Travel').AsInteger;
          Circle_Latitude := FieldByName('Circle_Latitude').AsFloat;
          Circle_Longitude := FieldByName('Circle_Longitude').AsFloat;
          Circle_X := FieldByName('Circle_X').AsSingle;
          Circle_Y := FieldByName('Circle_Y').AsSingle;
          Dynamic_Circle_Range_Offset := FieldByName
            ('Dynamic_Circle_Range_Offset').AsSingle;
          Dynamic_Circle_Angle_Offset := FieldByName
            ('Dynamic_Circle_Angle_Offset').AsInteger;
          Dynamic_Circle_Offset_Mode := FieldByName
            ('Dynamic_Circle_Offset_Mode')
            .AsInteger;
          Period_Distance := FieldByName('Period_Distance').AsSingle;
          Amplitude_Distance := FieldByName('Amplitude_Distance').AsSingle;
          Zig_Zag_Leg_Type := FieldByName('Zig_Zag_Leg_Type').AsInteger;
          Target_Angle_Offset := FieldByName('Target_Angle_Offset').AsSingle;
          Target_Angle_Type := FieldByName('Target_Angle_Type').AsInteger;
          Target_Range := FieldByName('Target_Range').AsSingle;
          Guidance_Target := FieldByName('Guidance_Target').AsInteger;
          Pattern_Instance_Index := FieldByName('Pattern_Instance_Index')
            .AsInteger;
          Angular_Offset := FieldByName('Angular_Offset').AsSingle;
          Anchor_Cartesian_X := FieldByName('Anchor_Cartesian_X').AsSingle;
          Anchor_Cartesian_Y := FieldByName('Anchor_Cartesian_Y').AsSingle;
          Anchor_Latitude := FieldByName('Anchor_Latitude').AsSingle;
          Anchor_Longitude := FieldByName('Anchor_Longitude').AsSingle;
          Current_Drift := FieldByName('Current_Drift').AsInteger;
          Waypoint_Termination := FieldByName('Waypoint_Termination').AsInteger;
          Termination_Heading := FieldByName('Termination_Heading').AsSingle;
          Cond_List_Instance_Index := FieldByName('Cond_List_Instance_Index')
            .AsInteger;
          Damage := FieldByName('Damage').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;

    for I := 0 to RecordCount - 1 do
    begin
      if TPlatform_Instance(aRec[I]).FActivation.Pattern_Instance_Index <> 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT a.* FROM ');
        SQL.Add('Predefined_Pattern a  JOIN Resource_Pattern_Mapping b ');
        SQL.Add('ON a.Pattern_Index = b.Pattern_Index ');
        SQL.Add('WHERE (Pattern_Instance_Index = ');
        SQL.Add(IntToStr(TPlatform_Instance(aRec[I]).FActivation.Pattern_Instance_Index) + ')');
        Open;

        with TPlatform_Instance(aRec[I]).FPattern do
        begin
          Pattern_Index        := FieldByName('Pattern_Index').AsInteger;
          Pattern_Identifier   := FieldByName('Pattern_Identifier').AsString;
          Pattern_Type         := FieldByName('Pattern_Type').AsInteger;
          Vehicle_Index        := FieldByName('Vehicle_Index').AsInteger;
          Pattern_Termination  := FieldByName('Pattern_Termination').AsInteger;
          Termination_Heading  := FieldByName('Termination_Heading').AsSingle;
        end;
      end;
    end;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getPlatformInstanceByIndex(const id: Integer;
  var rec: TPlatform_Instance): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Platform_Instance ');
    SQL.Add('WHERE (Platform_Instance_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TPlatform_Instance.Create;

      with rec.FData do
      begin
        Platform_Instance_Index := FieldByName('Platform_Instance_Index')
          .AsInteger;
        Instance_Name := FieldByName('Instance_Name').AsString;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllPlatFormInstanceForceClassification(const v_id,
  id: Integer; var aRec: TList; force: Integer;
  classification: Integer): Integer;
var
  //i: Integer;
  rec: TPlatform_Instance;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM ';
    ssql := ssql + '  Platform_Instance a INNER JOIN Vehicle_Definition b ';
    ssql := ssql +
      '  ON a.Vehicle_Index = b.Vehicle_Index INNER JOIN Resource_Allocation c ';
    ssql := ssql + '  ON a.Resource_Alloc_Index = c.Resource_Alloc_Index  ';
    ssql := ssql + 'WHERE (a.Resource_Alloc_Index = ' + IntToStr(id) + ')';

    if (v_id <> 0) then
      ssql := ssql + ' AND (a.Vehicle_Index = ' + IntToStr(v_id) + ')';

    if (force <> -1) then
      ssql := ssql + ' AND (a.Force_Designation = ' + IntToStr(force) + ')';

    if (classification <> -1) then
      ssql := ssql + ' AND (b.Platform_Domain = ' + IntToStr(classification)
        + ')';
    {
      SQL.Add('SELECT * ');
      SQL.Add('FROM ');
      SQL.Add('  Platform_Instance a INNER JOIN Vehicle_Definition b ' );
      SQL.Add('  ON a.Vehicle_Index = b.Vehicle_Index INNER JOIN Resource_Allocation c ');
      SQL.Add('  ON a.Resource_Alloc_Index = c.Resource_Alloc_Index  ' );
      SQL.Add('WHERE (Resource_Alloc_Index = ' +  IntToStr(id) + ')' );
      if (force<>-1) then
      SQL.Add(' AND (a.Force_Designation = ' +  IntToStr(force) + ')' );
      if (classification<>-1) then
      SQL.Add(' AND (b.Platform_Domain = ' +  IntToStr(classification) + ')' );

      }
    SQL.Add(ssql);
    SQL.Add('ORDER BY a.Instance_Name');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TPlatform_Instance.Create;

        with rec.FData do
        begin
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger; // byte
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index := FieldByName('Mine_Index').AsInteger;
          Hybrid_Index := FieldByName('Hybrid_Index').AsInteger;
          Satellite_Index := FieldByName('Satellite_Index').AsInteger;
          Sonobuoy_Index := FieldByName('Sonobuoy_Index').AsInteger;
          Instance_Name := FieldByName('Instance_Name').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
          Track_ID := FieldByName('Track_ID').AsString;
        end;
        {
          with rec.FActivation do begin
          Platform_Event_Index          := FieldByName('Platform_Event_Index').AsInteger;
          Deployment_Index              := FieldByName('Deployment_Index').AsInteger;
          Platform_Instance_Index       := FieldByName('Platform_Instance_Index').AsInteger;
          Platform_Activation_Time      := FieldByName('Platform_Activation_Time').AsInteger;
          Init_Guidance_Type            := FieldByName('Init_Guidance_Type').AsInteger;
          Init_Position_Latitude        := FieldByName('Init_Position_Latitude').AsFloat;
          Init_Position_Longitude       := FieldByName('Init_Position_Longitude').AsFloat;
          Init_Position_Cartesian_X     := FieldByName('Init_Position_Cartesian_X').AsSingle;
          Init_Position_Cartesian_Y     := FieldByName('Init_Position_Cartesian_Y').AsSingle;
          Init_Altitude                 := FieldByName('Init_Altitude').AsSingle;
          Init_Course                   := FieldByName('Init_Course').AsSingle;
          Init_Helm_Angle               := FieldByName('Init_Helm_Angle').AsSingle;
          Init_Ground_Speed             := FieldByName('Init_Ground_Speed').AsInteger;
          Init_Vertical_Speed           := FieldByName('Init_Vertical_Speed').AsInteger;
          Init_Command_Altitude         := FieldByName('Init_Command_Altitude').AsSingle;
          Init_Command_Course           := FieldByName('Init_Command_Course').AsSingle;
          Init_Command_Helm_Angle       := FieldByName('Init_Command_Helm_Angle').AsSingle;
          Init_Command_Ground           := FieldByName('Init_Command_Ground').AsInteger;
          Init_Command_Vert             := FieldByName('Init_Command_Vert').AsInteger;
          Deg_of_Rotation               := FieldByName('Deg_of_Rotation').AsSingle;
          Radius_of_Travel              := FieldByName('Radius_of_Travel').AsSingle;
          Direction_of_Travel           := FieldByName('Direction_of_Travel').AsInteger;
          Circle_Latitude               := FieldByName('Circle_Latitude').AsFloat;
          Circle_Longitude              := FieldByName('Circle_Longitude').AsFloat;
          Circle_X                      := FieldByName('Circle_X').AsSingle;
          Circle_Y                      := FieldByName('Circle_Y').AsSingle;
          Dynamic_Circle_Range_Offset   := FieldByName('Dynamic_Circle_Range_Offset').AsSingle;
          Dynamic_Circle_Angle_Offset   := FieldByName('Dynamic_Circle_Angle_Offset').AsInteger;
          Dynamic_Circle_Offset_Mode    := FieldByName('Dynamic_Circle_Offset_Mode').AsInteger;
          Period_Distance               := FieldByName('Period_Distance').AsSingle;
          Amplitude_Distance            := FieldByName('Amplitude_Distance').AsSingle;
          Zig_Zag_Leg_Type              := FieldByName('Zig_Zag_Leg_Type').AsInteger;
          Target_Angle_Offset           := FieldByName('Target_Angle_Offset').AsSingle;
          Target_Angle_Type             := FieldByName('Target_Angle_Type').AsInteger;
          Target_Range                  := FieldByName('Target_Range').AsSingle;
          Guidance_Target               := FieldByName('Guidance_Target').AsInteger;
          Pattern_Instance_Index        := FieldByName('Pattern_Instance_Index').AsInteger;
          Angular_Offset                := FieldByName('Angular_Offset').AsSingle;
          Anchor_Cartesian_X            := FieldByName('Anchor_Cartesian_X').AsSingle;
          Anchor_Cartesian_Y            := FieldByName('Anchor_Cartesian_Y').AsSingle;
          Anchor_Latitude               := FieldByName('Anchor_Latitude').AsSingle;
          Anchor_Longitude              := FieldByName('Anchor_Longitude').AsSingle;
          Current_Drift                 := FieldByName('Current_Drift').AsInteger;
          Waypoint_Termination          := FieldByName('Waypoint_Termination').AsInteger;
          Termination_Heading           := FieldByName('Termination_Heading').AsSingle;
          Cond_List_Instance_Index      := FieldByName('Cond_List_Instance_Index').AsInteger;
          Damage                        := FieldByName('Damage').AsSingle;
          end; }

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getPlatFormInstance(const ra_id, force: Integer;
  const instance: string; var aRec: TList): Integer;
var
  //i: Integer;
  rec: TPlatform_Instance;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := ssql + 'SELECT * FROM PlatForm_Instance ';

    if (ra_id <> 0) AND (force <> 0) then
    begin
      ssql := ssql + 'WHERE Resource_Alloc_Index = ' + IntToStr(ra_id)
        + ' AND ';
      ssql := ssql + 'Force_Designation =' + IntToStr(force);
    end
    else if (ra_id <> 0) AND (force = 0) then
      ssql := ssql + 'WHERE Resource_Alloc_Index = ' + IntToStr(ra_id)
    else if instance <> '' then
      ssql := ssql + 'WHERE Instance_Name = ''' + instance + '''';

    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TPlatform_Instance.Create;

        with rec.FData do
        begin
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Instance_Name := FieldByName('Instance_Name').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getPlatformInstanceByGroup(const group_id: Integer;
  var cList: TList): Integer;
var
  //i: Integer;
  rec: TCubicle_Group_Assignment;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ');
    SQL.Add('PlatForm_Instance a  JOIN Cubicle_group_Assignment b ');
    SQL.Add('ON a.Platform_Instance_Index = b.Platform_Instance_Index ');
    SQL.Add('WHERE (b.Group_Index = ' + IntToStr(group_id) + ')');
    SQL.Add('ORDER BY a.Instance_Name');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(cList) then
        cList := TList.Create
      else
        cList.Clear;

      while not ZQ.Eof do
      begin
        rec := TCubicle_Group_Assignment.Create;

        with rec.FPlatform do
        begin
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger; // byte
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index := FieldByName('Mine_Index').AsInteger;
          Hybrid_Index := FieldByName('Hybrid_Index').AsInteger;
          Satellite_Index := FieldByName('Satellite_Index').AsInteger;
          Sonobuoy_Index := FieldByName('Sonobuoy_Index').AsInteger;
          Instance_Name := FieldByName('Instance_Name').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
          Track_ID := FieldByName('Track_ID').AsString;
        end;

        cList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getPlatformInstanceByName(const id,ra_id,force: string; var rec: TPlatform_Instance):boolean;
var ssql : string;
begin
  result := false;

  if not zConn.Connected then Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := ssql +
      'SELECT distinct c.Platform_Instance_Index,c.Instance_Name ';
    ssql := ssql +
      'FROM Cubicle_Group a INNER JOIN Cubicle_Group_Assignment b ';
    ssql := ssql +
      'ON a.Group_Index = b.Group_Index INNER JOIN Platform_Instance c ';
    ssql := ssql +
      'ON b.Platform_Instance_Index = c.Platform_Instance_Index WHERE ';

    ssql := ssql +'c.Instance_Name = ' +  QuotedStr(id) + ' AND ';
    ssql := ssql + 'c.Resource_Alloc_Index = ' + ra_id + ' AND ';
    ssql := ssql + 'a.Force_Designation = '+ force;
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TPlatform_Instance.Create;

      with rec.FData do
      begin
        Platform_Instance_Index := FieldByName('Platform_Instance_Index').AsInteger;
        Instance_Name           := FieldByName('Instance_Name').AsString;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.DeletePlatform_Instance_Identifier(const id: string): integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Platform_Instance_Identifier  ');
    SQL.Add('WHERE (Instance_Ident_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.InsertPlatform_Instance_Identifier
  (var rec: TPlatform_Instance_Identifier): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Platform_Instance_Identifier  ');
      SQL.Add('VALUES ( ');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add('''' + Instance_Identifier + ''')');
    end;
    // ShowMessage(SQL.Text);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetPlatform_Instance_Identifier(const v_id: Integer;
  const v_ident: string; var vList: TList;
  var rec: TPlatform_Instance_Identifier): boolean;
var
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Platform_Instance_Identifier ';

    if v_id <> 0 then
      ssql := ssql + 'WHERE (Vehicle_Index = ' + IntToStr(v_id) + ')';

    if v_ident <> '' then
      ssql := ssql + 'WHERE (Instance_Identifier = ''' + v_ident + ''')';

    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(vList) then
        vList := TList.Create
      else
        vList.Clear;

      while not ZQ.Eof do
      begin
        rec := TPlatform_Instance_Identifier.Create;

        with rec.FData do
        begin
          Instance_Ident_Index := FieldByName('Instance_Ident_Index').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
        end;

        vList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertPlatformInstance(const rec: TPlatform_Instance;
  const id: Integer): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Platform_Instance ');
      if id = 1 then
      begin
        SQL.Add(
          '(Resource_Alloc_Index,Platform_Type,Vehicle_Index,Instance_Name,Force_Designation,Track_ID)');
        SQL.Add(' VALUES (');
        SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
        SQL.Add(IntToStr(Platform_Type) + ',');
        SQL.Add(IntToStr(Vehicle_Index) + ',');
        SQL.Add('''' + Instance_Name + ''',');
        SQL.Add(IntToStr(Force_Designation) + ',');
        SQL.Add('''' + Track_ID + ''')');
      end
      else if id = 2 then
      begin
        SQL.Add(
          '(Resource_Alloc_Index,Platform_Type,Missile_Index,Instance_Name,Force_Designation,Track_ID)');
        SQL.Add(' VALUES (');
        SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
        SQL.Add(IntToStr(Platform_Type) + ',');
        SQL.Add(IntToStr(Missile_Index) + ',');
        SQL.Add('''' + Instance_Name + ''',');
        SQL.Add(IntToStr(Force_Designation) + ',');
        SQL.Add('''' + Track_ID + ''')');
      end
      else if id = 3 then
      begin
        SQL.Add(
          '(Resource_Alloc_Index,Platform_Type,Torpedo_Index,Instance_Name,Force_Designation,Track_ID)');
        SQL.Add(' VALUES (');
        SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
        SQL.Add(IntToStr(Platform_Type) + ',');
        SQL.Add(IntToStr(Torpedo_Index) + ',');
        SQL.Add('''' + Instance_Name + ''',');
        SQL.Add(IntToStr(Force_Designation) + ',');
        SQL.Add('''' + Track_ID + ''')');
      end
      else if id = 4 then
      begin
        SQL.Add(
          '(Resource_Alloc_Index,Platform_Type,Sonobuoy_Index,Instance_Name,Force_Designation,Track_ID)');
        SQL.Add(' VALUES (');
        SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
        SQL.Add(IntToStr(Platform_Type) + ',');
        SQL.Add(IntToStr(Sonobuoy_Index) + ',');
        SQL.Add('''' + Instance_Name + ''',');
        SQL.Add(IntToStr(Force_Designation) + ',');
        SQL.Add('''' + Track_ID + ''')');
      end
      else if id = 5 then
      begin
        SQL.Add(
          '(Resource_Alloc_Index,Platform_Type,Mine_Index,Instance_Name,Force_Designation,Track_ID)');
        SQL.Add(' VALUES (');
        SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
        SQL.Add(IntToStr(Platform_Type) + ',');
        SQL.Add(IntToStr(Mine_Index) + ',');
        SQL.Add('''' + Instance_Name + ''',');
        SQL.Add(IntToStr(Force_Designation) + ',');
        SQL.Add('''' + Track_ID + ''')');
      end
      else if id = 6 then
      begin
        SQL.Add(
          '(Resource_Alloc_Index,Platform_Type,Satellite_Index,Instance_Name,Force_Designation,Track_ID)');
        SQL.Add(' VALUES (');
        SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
        SQL.Add(IntToStr(Platform_Type) + ',');
        SQL.Add(IntToStr(Satellite_Index) + ',');
        SQL.Add('''' + Instance_Name + ''',');
        SQL.Add(IntToStr(Force_Designation) + ',');
        SQL.Add('''' + Track_ID + ''')');
      end
      else if id = 7 then
      begin
        SQL.Add(
          '(Resource_Alloc_Index,Platform_Type,Vehicle_Index,Instance_Name,Force_Designation,Track_ID)');
        SQL.Add(' VALUES (');
        SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
        SQL.Add(IntToStr(Platform_Type) + ',');
        SQL.Add(IntToStr(Vehicle_Index) + ',');
        SQL.Add('''' + Instance_Name + ''',');
        SQL.Add(IntToStr(Force_Designation) + ',');
        SQL.Add('''' + Track_ID + ''')');
      end;
      // ShowMessage(SQL.Text);
      ExecSQL;

    end;
  end;

  //kembalikan nilai khusus untuk vehicle
  if id = 1 then
  begin
    with ZQ do
    begin
      with rec.FData do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM  Platform_Instance ');
        SQL.Add('WHERE Resource_Alloc_Index =' + IntToStr(Resource_Alloc_Index));
          SQL.Add(' AND Instance_Name =' + QuotedStr(Instance_Name));
        Open;

        if not IsEmpty then
        begin
          First;
          Result := FieldByName('Platform_Instance_Index').AsInteger; //andik,, platform ID sengaja saya taruh di result untuk keperluan save as scenario
        end;
      end;
    end;
  end;

end;

// ------------------------------------------------------------------------------

function TdmTTT.deletePlatformInstance(const pi_id: string): Integer;
var
  rec: TPlatform_Instance;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM Platform_Instance ');
      SQL.Add('WHERE Platform_Instance_Index =' + pi_id);
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetVehicle_Definition(const id: Integer;
  var rec: TVehicle_Definition): boolean;
var
  i, J, pre: Integer;
  predefined: TPredefined_Pattern;
  pattern: TPattern_Point;
begin
  result := false;
  predefined := nil;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Vehicle_Definition a LEFT JOIN Note_Storage b ');
    SQL.Add('ON a.Vehicle_Index = b.Vehicle_Index ');
    SQL.Add('LEFT JOIN Platform_Instance_Identifier c ');
    SQL.Add('ON a.Vehicle_Index = c.Vehicle_Index ');
    SQL.Add('WHERE (a.Vehicle_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TVehicle_Definition.Create;

      with rec.FData do
      begin
        Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
        Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
        Platform_Domain := FieldByName('Platform_Domain').AsInteger;
        Platform_Category := FieldByName('Platform_Category').AsInteger;
        Platform_Type := FieldByName('Platform_Type').AsInteger;
        Motion_Characteristics := FieldByName('Motion_Characteristics')
          .AsInteger;
        Logistic_Characteristics := FieldByName('Logistics_Index')
          .AsInteger;
        Capability_Characteristics := FieldByName('Platform_Capability_Index').AsInteger;
        Length := FieldByName('Length').AsSingle;
        Width := FieldByName('Width').AsSingle;
        Height := FieldByName('Height').AsSingle;
        Draft := FieldByName('Draft').AsSingle;
        Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
        Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
        Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
        Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
        Magnetic_Cross := FieldByName('Magnetic_Cross').AsSingle;
        Front_Visual_EO_Cross := FieldByName('Front_Visual_EO_Cross').AsSingle;
        Side_Visual_EO_Cross := FieldByName('Side_Visual_EO_Cross').AsSingle;
        Front_Infrared_Cross := FieldByName('Front_Infrared_Cross').AsSingle;
        Side_Infrared_Cross := FieldByName('Side_Infrared_Cross').AsSingle;
        LSpeed_Acoustic_Intens := FieldByName('LSpeed_Acoustic_Intens')
          .AsSingle;
        Below_Cav_Acoustic_Intens := FieldByName('Below_Cav_Acoustic_Intens')
          .AsSingle;
        Above_Cav_Acoustic_Intens := FieldByName('Above_Cav_Acoustic_Intens')
          .AsSingle;
        HSpeed_Acoustic_Intens := FieldByName('HSpeed_Acoustic_Intens')
          .AsSingle;
        Cavitation_Speed_Switch := FieldByName('Cavitation_Speed_Switch')
          .AsSingle;
        Time_of_Weapon_Impact := FieldByName('Time_of_Weapon_Impact').AsInteger;
        Chaff_Seduction_Capable := FieldByName('Chaff_Seduction_Capable')
          .AsBoolean;
        Seduction_Mode_Prob := FieldByName('Seduction_Mode_Prob').AsSingle;
        Min_Delay_Between_Chaff_Rounds := FieldByName
          ('Min_Delay_Between_Chaff_Rounds').AsInteger;
        Max_Chaff_Salvo_Size := FieldByName('Max_Chaff_Salvo_Size').AsInteger;
        SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
        CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
        TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
        IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
        AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
        Active_Acoustic_Tor_POH_Mod := FieldByName
          ('Active_Acoustic_Tor_POH_Mod').AsSingle;
        Passive_Acoustic_Tor_POH_Mod := FieldByName
          ('Passive_Acoustic_Tor_POH_Mod').AsSingle;
        Active_Passive_Tor_POH_Mod := FieldByName('Active_Passive_Tor_POH_Mod')
          .AsSingle;
        Wake_Home_POH_Modifier := FieldByName('Wake_Home_POH_Modifier')
          .AsSingle;
        Wire_Guide_POH_Modifier := FieldByName('Wire_Guide_POH_Modifier')
          .AsSingle;
        Mag_Mine_POH_Modifier := FieldByName('Mag_Mine_POH_Modifier').AsSingle;
        Press_Mine_POH_Modifier := FieldByName('Press_Mine_POH_Modifier')
          .AsSingle;
        Impact_Mine_POH_Modifier := FieldByName('Impact_Mine_POH_Modifier')
          .AsSingle;
        Acoustic_Mine_POH_Modifier := FieldByName('Acoustic_Mine_POH_Modifier')
          .AsSingle;
        Sub_Comm_Antenna_Height := FieldByName('Sub_Comm_Antenna_Height')
          .AsSingle;
        Rel_Comm_Antenna_Height := FieldByName('Rel_Comm_Antenna_Height')
          .AsSingle;
        Max_Comm_Operating_Depth := FieldByName('Max_Comm_Operating_Depth')
          .AsSingle;
        HF_Link_Capable := FieldByName('HF_Link_Capable').AsBoolean;
        UHF_Link_Capable := FieldByName('UHF_Link_Capable').AsBoolean;
        HF_Voice_Capable := FieldByName('HF_Voice_Capable').AsBoolean;
        VHF_Voice_Capable := FieldByName('VHF_Voice_Capable').AsBoolean;
        UHF_Voice_Capable := FieldByName('UHF_Voice_Capable').AsBoolean;
        SATCOM_Voice_Capable := FieldByName('SATCOM_Voice_Capable').AsBoolean;
        UWT_Voice_Capable := FieldByName('UWT_Voice_Capable').AsBoolean;
        HF_MHS_Capable := FieldByName('HF_MHS_Capable').AsBoolean;
        UHF_MHS_Capable := FieldByName('UHF_MHS_Capable').AsBoolean;
        SATCOM_MHS_Capable := FieldByName('SATCOM_MHS_Capable').AsBoolean;
        Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
        Plat_Basing_Capability := FieldByName('Plat_Basing_Capability')
          .AsBoolean;
        Chaff_Capability := FieldByName('Chaff_Capability').AsBoolean;
        Readying_Time := FieldByName('Readying_Time').AsInteger;
        Sonobuoy_Capable := FieldByName('Sonobuoy_Capable').AsBoolean;
        Nav_Light_Capable := FieldByName('Nav_Light_Capable').AsBoolean;
        Periscope_Depth := FieldByName('Periscope_Depth').AsSingle;
        Periscope_Height_Above_Water := FieldByName
          ('Periscope_Height_Above_Water').AsSingle;
        Periscope_Front_Radar_Xsection := FieldByName
          ('Periscope_Front_Radar_Xsection').AsSingle;
        Periscope_Side_Radar_Xsection := FieldByName
          ('Periscope_Side_Radar_Xsection').AsSingle;
        Periscope_Front_Vis_Xsection := FieldByName
          ('Periscope_Front_Vis_Xsection').AsSingle;
        Periscope_Side_Vis_Xsection := FieldByName
          ('Periscope_Side_Vis_Xsection').AsSingle;
        Periscope_Front_IR_Xsection := FieldByName
          ('Periscope_Front_IR_Xsection').AsSingle;
        Periscope_Side_IR_Xsection := FieldByName('Periscope_Side_IR_Xsection')
          .AsSingle;
        Engagement_Range := FieldByName('Engagement_Range').AsSingle;
        Auto_Air_Defense_Capable := FieldByName('Auto_Air_Defense_Capable')
          .AsBoolean;
        Alert_State_Time := FieldByName('Alert_State_Time').AsSingle;
        Detectability_Type := FieldByName('Detectability_Type').AsInteger;
        Max_Sonobuoys_To_Monitor := FieldByName('Max_Sonobuoys_To_Monitor')
          .AsInteger;
        Sonobuoy_Deploy_Max_Altitude := FieldByName
          ('Sonobuoy_Deploy_Max_Altitude').AsInteger;
        Sonobuoy_Deploy_Min_Altitude := FieldByName
          ('Sonobuoy_Deploy_Min_Altitude').AsInteger;
        Sonobuoy_Deploy_Max_Speed := FieldByName('Sonobuoy_Deploy_Max_Speed')
          .AsInteger;
        Air_Drop_Torpedo_Max_Altitude := FieldByName
          ('Air_Drop_Torpedo_Max_Altitude').AsInteger;
        Air_Drop_Torpedo_Min_Altitude := FieldByName
          ('Air_Drop_Torpedo_Min_Altitude').AsInteger;
        Air_Drop_Torpedo_Max_Speed := FieldByName('Air_Drop_Torpedo_Max_Speed')
          .AsInteger;
        TMA_Rate_Factor := FieldByName('TMA_Rate_Factor').AsSingle;
        HMS_Noise_Reduction_Factor := FieldByName('HMS_Noise_Reduction_Factor')
          .AsSingle;
        TAS_Noise_Reduction_Factor := FieldByName('TAS_Noise_Reduction_Factor')
          .AsSingle;
        Infrared_Decoy_Capable := FieldByName('Infrared_Decoy_Capable')
          .AsBoolean;
        HF_Mid_Course_Update_Capable := FieldByName
          ('HF_Mid_Course_Update_Capable').AsBoolean;
        UHF_Mid_Course_Update_Capable := FieldByName
          ('UHF_Mid_Course_Update_Capable').AsBoolean;
        // SATCOM_Mid_Course_Update_Capable    := FieldByName('SATCOM_Mid_Course_Update_Capable').AsBoolean;
        VBS_Class_Name := FieldByName('vbs_class_name').AsString;
        Quantity_Group_Personal := FieldByName('Quantity_Group_Personal').AsInteger;
        GangwayPosition := FieldByName('GangwayPosition').AsInteger;
        Weight := FieldByName('DWT').AsSingle;
      end;

      with rec.FNote do
      begin
        Note_Index := FieldByName('Note_Index').AsInteger;
        Note_Type := FieldByName('Note_Type').AsInteger;
        Notes := FieldByName('Notes').AsString;
      end;

      {
        with rec.FPlatform_Ident do
        begin
        Instance_Ident_Index    := FieldByName('Instance_Ident_Index').AsInteger;
        Vehicle_Index           := FieldByName('Vehicle_Index').AsInteger;
        Instance_Identifier     := FieldByName('Instance_Identifier').AsString;
        end;
      }

      for i := 0 to RecordCount - 1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT *');
        SQL.Add('FROM Predefined_Pattern a LEFT JOIN Note_Storage b ');
        SQL.Add('ON a.Pattern_Index = b.Pattern_Index ');
        SQL.Add('WHERE a.Vehicle_Index = ' + IntToStr(rec.FData.Vehicle_Index));
        Open;

        First;

        while not ZQ.Eof do
        begin
          predefined := TPredefined_Pattern.Create;

          with predefined.FData do
          begin
            Pattern_Index := FieldByName('Pattern_Index').AsInteger;
            Pattern_Identifier := FieldByName('Pattern_Identifier').AsString;
            Pattern_Type := FieldByName('Pattern_Type').AsInteger;
            Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
            Pattern_Termination := FieldByName('Pattern_Termination').AsInteger;
            Termination_Heading := FieldByName('Termination_Heading').AsSingle;
          end;

          with rec.FNote do
          begin
            Note_Index := FieldByName('Note_Index').AsInteger;
            Note_Type := FieldByName('Note_Type').AsInteger;
            Notes := FieldByName('Notes').AsString;
          end;

          rec.predefined.Add(predefined);
          ZQ.Next;
        end;

        pre := RecordCount;
        if predefined <> nil then
        begin
          for J := 0 to pre - 1 do
          begin
            Close;
            SQL.Add('SELECT * ');
            SQL.Add('FROM Pattern_Point ');
            SQL.Add('WHERE Pattern_Index =' + IntToStr
                (predefined.FData.Pattern_Index));
            Open;

            ZQ.First;

            while not ZQ.Eof do
            begin
              pattern := TPattern_Point.Create;

              with pattern.FData do
              begin
                Pattern_Index := FieldByName('Pattern_Index').AsInteger;
                Point_Number := FieldByName('Point_Number').AsInteger;
                Heading := FieldByName('Heading').AsSingle;
                Range := FieldByName('Range').AsSingle;
              end;

              predefined.pattern.Add(pattern);
              ZQ.Next;
            end;
          end;
        end;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetAllVehicle_Def(var vList: TList; var id: Integer;
  var rec: TVehicle_Definition): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM  Vehicle_Definition ';
    if id <> 0 then
    begin
      ssql := ssql + 'WHERE (Vehicle_Index = ' + IntToStr(id) + ') ';
      ssql := ssql + 'ORDER BY Vehicle_Identifier ASC '
    end
    else
      ssql := ssql + 'ORDER BY Vehicle_Identifier ASC ';

    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(vList) then
        vList := TList.Create
      else
        vList.Clear;

      while not ZQ.Eof do
      begin
        rec := TVehicle_Definition.Create;
        with rec.FData do
        begin
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Motion_Characteristics := FieldByName('Motion_Characteristics')
            .AsInteger;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Draft := FieldByName('Draft').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Magnetic_Cross := FieldByName('Magnetic_Cross').AsSingle;
          Front_Visual_EO_Cross := FieldByName('Front_Visual_EO_Cross')
            .AsSingle;
          Side_Visual_EO_Cross := FieldByName('Side_Visual_EO_Cross').AsSingle;
          Front_Infrared_Cross := FieldByName('Front_Infrared_Cross').AsSingle;
          Side_Infrared_Cross := FieldByName('Side_Infrared_Cross').AsSingle;
          LSpeed_Acoustic_Intens := FieldByName('LSpeed_Acoustic_Intens')
            .AsSingle;
          Below_Cav_Acoustic_Intens := FieldByName('Below_Cav_Acoustic_Intens')
            .AsSingle;
          Above_Cav_Acoustic_Intens := FieldByName('Above_Cav_Acoustic_Intens')
            .AsSingle;
          HSpeed_Acoustic_Intens := FieldByName('HSpeed_Acoustic_Intens')
            .AsSingle;
          Cavitation_Speed_Switch := FieldByName('Cavitation_Speed_Switch')
            .AsSingle;
          Time_of_Weapon_Impact := FieldByName('Time_of_Weapon_Impact')
            .AsInteger;
          Chaff_Seduction_Capable := FieldByName('Chaff_Seduction_Capable')
            .AsBoolean;
          Seduction_Mode_Prob := FieldByName('Seduction_Mode_Prob').AsSingle;
          Min_Delay_Between_Chaff_Rounds := FieldByName
            ('Min_Delay_Between_Chaff_Rounds').AsInteger;
          Max_Chaff_Salvo_Size := FieldByName('Max_Chaff_Salvo_Size').AsInteger;
          SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
          CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
          TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
          IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
          AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
          Active_Acoustic_Tor_POH_Mod := FieldByName
            ('Active_Acoustic_Tor_POH_Mod').AsSingle;
          Passive_Acoustic_Tor_POH_Mod := FieldByName
            ('Passive_Acoustic_Tor_POH_Mod').AsSingle;
          Active_Passive_Tor_POH_Mod := FieldByName
            ('Active_Passive_Tor_POH_Mod').AsSingle;
          Wake_Home_POH_Modifier := FieldByName('Wake_Home_POH_Modifier')
            .AsSingle;
          Wire_Guide_POH_Modifier := FieldByName('Wire_Guide_POH_Modifier')
            .AsSingle;
          Mag_Mine_POH_Modifier := FieldByName('Mag_Mine_POH_Modifier')
            .AsSingle;
          Press_Mine_POH_Modifier := FieldByName('Press_Mine_POH_Modifier')
            .AsSingle;
          Impact_Mine_POH_Modifier := FieldByName('Impact_Mine_POH_Modifier')
            .AsSingle;
          Acoustic_Mine_POH_Modifier := FieldByName
            ('Acoustic_Mine_POH_Modifier').AsSingle;
          Sub_Comm_Antenna_Height := FieldByName('Sub_Comm_Antenna_Height')
            .AsSingle;
          Rel_Comm_Antenna_Height := FieldByName('Rel_Comm_Antenna_Height')
            .AsSingle;
          Max_Comm_Operating_Depth := FieldByName('Max_Comm_Operating_Depth')
            .AsSingle;
          HF_Link_Capable := FieldByName('HF_Link_Capable').AsBoolean;
          UHF_Link_Capable := FieldByName('UHF_Link_Capable').AsBoolean;
          HF_Voice_Capable := FieldByName('HF_Voice_Capable').AsBoolean;
          VHF_Voice_Capable := FieldByName('VHF_Voice_Capable').AsBoolean;
          UHF_Voice_Capable := FieldByName('UHF_Voice_Capable').AsBoolean;
          SATCOM_Voice_Capable := FieldByName('SATCOM_Voice_Capable').AsBoolean;
          UWT_Voice_Capable := FieldByName('UWT_Voice_Capable').AsBoolean;
          HF_MHS_Capable := FieldByName('HF_MHS_Capable').AsBoolean;
          UHF_MHS_Capable := FieldByName('UHF_MHS_Capable').AsBoolean;
          SATCOM_MHS_Capable := FieldByName('SATCOM_MHS_Capable').AsBoolean;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          Plat_Basing_Capability := FieldByName('Plat_Basing_Capability')
            .AsBoolean;
          Chaff_Capability := FieldByName('Chaff_Capability').AsBoolean;
          Readying_Time := FieldByName('Readying_Time').AsInteger;
          Sonobuoy_Capable := FieldByName('Sonobuoy_Capable').AsBoolean;
          Nav_Light_Capable := FieldByName('Nav_Light_Capable').AsBoolean;
          Periscope_Depth := FieldByName('Periscope_Depth').AsSingle;
          Periscope_Height_Above_Water := FieldByName
            ('Periscope_Height_Above_Water').AsSingle;
          Periscope_Front_Radar_Xsection := FieldByName
            ('Periscope_Front_Radar_Xsection').AsSingle;
          Periscope_Side_Radar_Xsection := FieldByName
            ('Periscope_Side_Radar_Xsection').AsSingle;
          Periscope_Front_Vis_Xsection := FieldByName
            ('Periscope_Front_Vis_Xsection').AsSingle;
          Periscope_Side_Vis_Xsection := FieldByName
            ('Periscope_Side_Vis_Xsection').AsSingle;
          Periscope_Front_IR_Xsection := FieldByName
            ('Periscope_Front_IR_Xsection').AsSingle;
          Periscope_Side_IR_Xsection := FieldByName
            ('Periscope_Side_IR_Xsection').AsSingle;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          Auto_Air_Defense_Capable := FieldByName('Auto_Air_Defense_Capable')
            .AsBoolean;
          Alert_State_Time := FieldByName('Alert_State_Time').AsSingle;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
          Max_Sonobuoys_To_Monitor := FieldByName('Max_Sonobuoys_To_Monitor')
            .AsInteger;
          Sonobuoy_Deploy_Max_Altitude := FieldByName
            ('Sonobuoy_Deploy_Max_Altitude').AsInteger;
          Sonobuoy_Deploy_Min_Altitude := FieldByName
            ('Sonobuoy_Deploy_Min_Altitude').AsInteger;
          Sonobuoy_Deploy_Max_Speed := FieldByName('Sonobuoy_Deploy_Max_Speed')
            .AsInteger;
          Air_Drop_Torpedo_Max_Altitude := FieldByName
            ('Air_Drop_Torpedo_Max_Altitude').AsInteger;
          Air_Drop_Torpedo_Min_Altitude := FieldByName
            ('Air_Drop_Torpedo_Min_Altitude').AsInteger;
          Air_Drop_Torpedo_Max_Speed := FieldByName
            ('Air_Drop_Torpedo_Max_Speed')
            .AsInteger;
          TMA_Rate_Factor := FieldByName('TMA_Rate_Factor').AsSingle;
          HMS_Noise_Reduction_Factor := FieldByName
            ('HMS_Noise_Reduction_Factor').AsSingle;
          TAS_Noise_Reduction_Factor := FieldByName
            ('TAS_Noise_Reduction_Factor').AsSingle;
          Infrared_Decoy_Capable := FieldByName('Infrared_Decoy_Capable')
            .AsBoolean;
          HF_Mid_Course_Update_Capable := FieldByName
            ('HF_Mid_Course_Update_Capable').AsBoolean;
          UHF_Mid_Course_Update_Capable := FieldByName
            ('UHF_Mid_Course_Update_Capable').AsBoolean;
          Weight := FieldByName('DWT').AsSingle;
        end;

        vList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetVehicleBy(const domain, tipe, embarked: string;
  var vList: TList): Integer;
var
  rec: TVehicle_Definition;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM  Vehicle_Definition ';

    if domain <> '' then
    begin
      ssql := ssql + 'WHERE Platform_Domain = ' + domain;
      if tipe <> '' then
      begin
        ssql := ssql + ' AND Platform_Type = ' + tipe;
      end;
    end
    else if tipe <> '' then
    begin
      ssql := ssql + 'WHERE Platform_Type = ' + tipe;
      if domain <> '' then
      begin
        ssql := ssql + ' AND Platform_Domain = ' + domain;
      end;
    end;
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(vList) then
        vList := TList.Create
      else
        vList.Clear;

      while not ZQ.Eof do
      begin
        rec := TVehicle_Definition.Create;

        with rec.FData do
        begin
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Motion_Characteristics := FieldByName('Motion_Characteristics')
            .AsInteger;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Draft := FieldByName('Draft').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Magnetic_Cross := FieldByName('Magnetic_Cross').AsSingle;
          Front_Visual_EO_Cross := FieldByName('Front_Visual_EO_Cross')
            .AsSingle;
          Side_Visual_EO_Cross := FieldByName('Side_Visual_EO_Cross').AsSingle;
          Front_Infrared_Cross := FieldByName('Front_Infrared_Cross').AsSingle;
          Side_Infrared_Cross := FieldByName('Side_Infrared_Cross').AsSingle;
          LSpeed_Acoustic_Intens := FieldByName('LSpeed_Acoustic_Intens')
            .AsSingle;
          Below_Cav_Acoustic_Intens := FieldByName('Below_Cav_Acoustic_Intens')
            .AsSingle;
          Above_Cav_Acoustic_Intens := FieldByName('Above_Cav_Acoustic_Intens')
            .AsSingle;
          HSpeed_Acoustic_Intens := FieldByName('HSpeed_Acoustic_Intens')
            .AsSingle;
          Cavitation_Speed_Switch := FieldByName('Cavitation_Speed_Switch')
            .AsSingle;
          Time_of_Weapon_Impact := FieldByName('Time_of_Weapon_Impact')
            .AsInteger;
          Chaff_Seduction_Capable := FieldByName('Chaff_Seduction_Capable')
            .AsBoolean;
          Seduction_Mode_Prob := FieldByName('Seduction_Mode_Prob').AsSingle;
          Min_Delay_Between_Chaff_Rounds := FieldByName
            ('Min_Delay_Between_Chaff_Rounds').AsInteger;
          Max_Chaff_Salvo_Size := FieldByName('Max_Chaff_Salvo_Size').AsInteger;
          SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
          CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
          TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
          IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
          AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
          Active_Acoustic_Tor_POH_Mod := FieldByName
            ('Active_Acoustic_Tor_POH_Mod').AsSingle;
          Passive_Acoustic_Tor_POH_Mod := FieldByName
            ('Passive_Acoustic_Tor_POH_Mod').AsSingle;
          Active_Passive_Tor_POH_Mod := FieldByName
            ('Active_Passive_Tor_POH_Mod').AsSingle;
          Wake_Home_POH_Modifier := FieldByName('Wake_Home_POH_Modifier')
            .AsSingle;
          Wire_Guide_POH_Modifier := FieldByName('Wire_Guide_POH_Modifier')
            .AsSingle;
          Mag_Mine_POH_Modifier := FieldByName('Mag_Mine_POH_Modifier')
            .AsSingle;
          Press_Mine_POH_Modifier := FieldByName('Press_Mine_POH_Modifier')
            .AsSingle;
          Impact_Mine_POH_Modifier := FieldByName('Impact_Mine_POH_Modifier')
            .AsSingle;
          Acoustic_Mine_POH_Modifier := FieldByName
            ('Acoustic_Mine_POH_Modifier').AsSingle;
          Sub_Comm_Antenna_Height := FieldByName('Sub_Comm_Antenna_Height')
            .AsSingle;
          Rel_Comm_Antenna_Height := FieldByName('Rel_Comm_Antenna_Height')
            .AsSingle;
          Max_Comm_Operating_Depth := FieldByName('Max_Comm_Operating_Depth')
            .AsSingle;
          HF_Link_Capable := FieldByName('HF_Link_Capable').AsBoolean;
          UHF_Link_Capable := FieldByName('UHF_Link_Capable').AsBoolean;
          HF_Voice_Capable := FieldByName('HF_Voice_Capable').AsBoolean;
          VHF_Voice_Capable := FieldByName('VHF_Voice_Capable').AsBoolean;
          UHF_Voice_Capable := FieldByName('UHF_Voice_Capable').AsBoolean;
          SATCOM_Voice_Capable := FieldByName('SATCOM_Voice_Capable').AsBoolean;
          UWT_Voice_Capable := FieldByName('UWT_Voice_Capable').AsBoolean;
          HF_MHS_Capable := FieldByName('HF_MHS_Capable').AsBoolean;
          UHF_MHS_Capable := FieldByName('UHF_MHS_Capable').AsBoolean;
          SATCOM_MHS_Capable := FieldByName('SATCOM_MHS_Capable').AsBoolean;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          Plat_Basing_Capability := FieldByName('Plat_Basing_Capability')
            .AsBoolean;
          Chaff_Capability := FieldByName('Chaff_Capability').AsBoolean;
          Readying_Time := FieldByName('Readying_Time').AsInteger;
          Sonobuoy_Capable := FieldByName('Sonobuoy_Capable').AsBoolean;
          Nav_Light_Capable := FieldByName('Nav_Light_Capable').AsBoolean;
          Periscope_Depth := FieldByName('Periscope_Depth').AsSingle;
          Periscope_Height_Above_Water := FieldByName
            ('Periscope_Height_Above_Water').AsSingle;
          Periscope_Front_Radar_Xsection := FieldByName
            ('Periscope_Front_Radar_Xsection').AsSingle;
          Periscope_Side_Radar_Xsection := FieldByName
            ('Periscope_Side_Radar_Xsection').AsSingle;
          Periscope_Front_Vis_Xsection := FieldByName
            ('Periscope_Front_Vis_Xsection').AsSingle;
          Periscope_Side_Vis_Xsection := FieldByName
            ('Periscope_Side_Vis_Xsection').AsSingle;
          Periscope_Front_IR_Xsection := FieldByName
            ('Periscope_Front_IR_Xsection').AsSingle;
          Periscope_Side_IR_Xsection := FieldByName
            ('Periscope_Side_IR_Xsection').AsSingle;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          Auto_Air_Defense_Capable := FieldByName('Auto_Air_Defense_Capable')
            .AsBoolean;
          Alert_State_Time := FieldByName('Alert_State_Time').AsSingle;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
          Max_Sonobuoys_To_Monitor := FieldByName('Max_Sonobuoys_To_Monitor')
            .AsInteger;
          Sonobuoy_Deploy_Max_Altitude := FieldByName
            ('Sonobuoy_Deploy_Max_Altitude').AsInteger;
          Sonobuoy_Deploy_Min_Altitude := FieldByName
            ('Sonobuoy_Deploy_Min_Altitude').AsInteger;
          Sonobuoy_Deploy_Max_Speed := FieldByName('Sonobuoy_Deploy_Max_Speed')
            .AsInteger;
          Air_Drop_Torpedo_Max_Altitude := FieldByName
            ('Air_Drop_Torpedo_Max_Altitude').AsInteger;
          Air_Drop_Torpedo_Min_Altitude := FieldByName
            ('Air_Drop_Torpedo_Min_Altitude').AsInteger;
          Air_Drop_Torpedo_Max_Speed := FieldByName
            ('Air_Drop_Torpedo_Max_Speed')
            .AsInteger;
          TMA_Rate_Factor := FieldByName('TMA_Rate_Factor').AsSingle;
          HMS_Noise_Reduction_Factor := FieldByName
            ('HMS_Noise_Reduction_Factor').AsSingle;
          TAS_Noise_Reduction_Factor := FieldByName
            ('TAS_Noise_Reduction_Factor').AsSingle;
          Infrared_Decoy_Capable := FieldByName('Infrared_Decoy_Capable')
            .AsBoolean;
          HF_Mid_Course_Update_Capable := FieldByName
            ('HF_Mid_Course_Update_Capable').AsBoolean;
          UHF_Mid_Course_Update_Capable := FieldByName
            ('UHF_Mid_Course_Update_Capable').AsBoolean;
          Weight := FieldByName('DWT').AsSingle;
          // SATCOM_Mid_Course_Update_Capable    := FieldByName('SATCOM_Mid_Course_Update_Capable').AsBoolean;
        end;

        vList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getVehicleByLibrary(const id_Library: Integer;
  var vList: TList): Integer;
var
  rec: TVehicle_Definition;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM  Platform_Library_Entry a ';
    ssql := ssql +
      'join Vehicle_Definition b on a.Vehicle_Index = b.Vehicle_Index ';
    ssql := ssql + 'WHERE a.Library_Index = ' + IntToStr(id_Library) + ' ';
    ssql := ssql + 'AND a.Platform_Type = 1';
    // ShowMessage(ssql);
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(vList) then
        vList := TList.Create
      else
        vList.Clear;

      while not ZQ.Eof do
      begin
        rec := TVehicle_Definition.Create;

        with rec.FData do
        begin
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Motion_Characteristics := FieldByName('Motion_Characteristics')
            .AsInteger;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Draft := FieldByName('Draft').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Magnetic_Cross := FieldByName('Magnetic_Cross').AsSingle;
          Front_Visual_EO_Cross := FieldByName('Front_Visual_EO_Cross')
            .AsSingle;
          Side_Visual_EO_Cross := FieldByName('Side_Visual_EO_Cross').AsSingle;
          Front_Infrared_Cross := FieldByName('Front_Infrared_Cross').AsSingle;
          Side_Infrared_Cross := FieldByName('Side_Infrared_Cross').AsSingle;
          LSpeed_Acoustic_Intens := FieldByName('LSpeed_Acoustic_Intens')
            .AsSingle;
          Below_Cav_Acoustic_Intens := FieldByName('Below_Cav_Acoustic_Intens')
            .AsSingle;
          Above_Cav_Acoustic_Intens := FieldByName('Above_Cav_Acoustic_Intens')
            .AsSingle;
          HSpeed_Acoustic_Intens := FieldByName('HSpeed_Acoustic_Intens')
            .AsSingle;
          Cavitation_Speed_Switch := FieldByName('Cavitation_Speed_Switch')
            .AsSingle;
          Time_of_Weapon_Impact := FieldByName('Time_of_Weapon_Impact')
            .AsInteger;
          Chaff_Seduction_Capable := FieldByName('Chaff_Seduction_Capable')
            .AsBoolean;
          Seduction_Mode_Prob := FieldByName('Seduction_Mode_Prob').AsSingle;
          Min_Delay_Between_Chaff_Rounds := FieldByName
            ('Min_Delay_Between_Chaff_Rounds').AsInteger;
          Max_Chaff_Salvo_Size := FieldByName('Max_Chaff_Salvo_Size').AsInteger;
          SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
          CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
          TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
          IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
          AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
          Active_Acoustic_Tor_POH_Mod := FieldByName
            ('Active_Acoustic_Tor_POH_Mod').AsSingle;
          Passive_Acoustic_Tor_POH_Mod := FieldByName
            ('Passive_Acoustic_Tor_POH_Mod').AsSingle;
          Active_Passive_Tor_POH_Mod := FieldByName
            ('Active_Passive_Tor_POH_Mod').AsSingle;
          Wake_Home_POH_Modifier := FieldByName('Wake_Home_POH_Modifier')
            .AsSingle;
          Wire_Guide_POH_Modifier := FieldByName('Wire_Guide_POH_Modifier')
            .AsSingle;
          Mag_Mine_POH_Modifier := FieldByName('Mag_Mine_POH_Modifier')
            .AsSingle;
          Press_Mine_POH_Modifier := FieldByName('Press_Mine_POH_Modifier')
            .AsSingle;
          Impact_Mine_POH_Modifier := FieldByName('Impact_Mine_POH_Modifier')
            .AsSingle;
          Acoustic_Mine_POH_Modifier := FieldByName
            ('Acoustic_Mine_POH_Modifier').AsSingle;
          Sub_Comm_Antenna_Height := FieldByName('Sub_Comm_Antenna_Height')
            .AsSingle;
          Rel_Comm_Antenna_Height := FieldByName('Rel_Comm_Antenna_Height')
            .AsSingle;
          Max_Comm_Operating_Depth := FieldByName('Max_Comm_Operating_Depth')
            .AsSingle;
          HF_Link_Capable := FieldByName('HF_Link_Capable').AsBoolean;
          UHF_Link_Capable := FieldByName('UHF_Link_Capable').AsBoolean;
          HF_Voice_Capable := FieldByName('HF_Voice_Capable').AsBoolean;
          VHF_Voice_Capable := FieldByName('VHF_Voice_Capable').AsBoolean;
          UHF_Voice_Capable := FieldByName('UHF_Voice_Capable').AsBoolean;
          SATCOM_Voice_Capable := FieldByName('SATCOM_Voice_Capable').AsBoolean;
          UWT_Voice_Capable := FieldByName('UWT_Voice_Capable').AsBoolean;
          HF_MHS_Capable := FieldByName('HF_MHS_Capable').AsBoolean;
          UHF_MHS_Capable := FieldByName('UHF_MHS_Capable').AsBoolean;
          SATCOM_MHS_Capable := FieldByName('SATCOM_MHS_Capable').AsBoolean;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          Plat_Basing_Capability := FieldByName('Plat_Basing_Capability')
            .AsBoolean;
          Chaff_Capability := FieldByName('Chaff_Capability').AsBoolean;
          Readying_Time := FieldByName('Readying_Time').AsInteger;
          Sonobuoy_Capable := FieldByName('Sonobuoy_Capable').AsBoolean;
          Nav_Light_Capable := FieldByName('Nav_Light_Capable').AsBoolean;
          Periscope_Depth := FieldByName('Periscope_Depth').AsSingle;
          Periscope_Height_Above_Water := FieldByName
            ('Periscope_Height_Above_Water').AsSingle;
          Periscope_Front_Radar_Xsection := FieldByName
            ('Periscope_Front_Radar_Xsection').AsSingle;
          Periscope_Side_Radar_Xsection := FieldByName
            ('Periscope_Side_Radar_Xsection').AsSingle;
          Periscope_Front_Vis_Xsection := FieldByName
            ('Periscope_Front_Vis_Xsection').AsSingle;
          Periscope_Side_Vis_Xsection := FieldByName
            ('Periscope_Side_Vis_Xsection').AsSingle;
          Periscope_Front_IR_Xsection := FieldByName
            ('Periscope_Front_IR_Xsection').AsSingle;
          Periscope_Side_IR_Xsection := FieldByName
            ('Periscope_Side_IR_Xsection').AsSingle;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          Auto_Air_Defense_Capable := FieldByName('Auto_Air_Defense_Capable')
            .AsBoolean;
          Alert_State_Time := FieldByName('Alert_State_Time').AsSingle;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
          Max_Sonobuoys_To_Monitor := FieldByName('Max_Sonobuoys_To_Monitor')
            .AsInteger;
          Sonobuoy_Deploy_Max_Altitude := FieldByName
            ('Sonobuoy_Deploy_Max_Altitude').AsInteger;
          Sonobuoy_Deploy_Min_Altitude := FieldByName
            ('Sonobuoy_Deploy_Min_Altitude').AsInteger;
          Sonobuoy_Deploy_Max_Speed := FieldByName('Sonobuoy_Deploy_Max_Speed')
            .AsInteger;
          Air_Drop_Torpedo_Max_Altitude := FieldByName
            ('Air_Drop_Torpedo_Max_Altitude').AsInteger;
          Air_Drop_Torpedo_Min_Altitude := FieldByName
            ('Air_Drop_Torpedo_Min_Altitude').AsInteger;
          Air_Drop_Torpedo_Max_Speed := FieldByName
            ('Air_Drop_Torpedo_Max_Speed')
            .AsInteger;
          TMA_Rate_Factor := FieldByName('TMA_Rate_Factor').AsSingle;
          HMS_Noise_Reduction_Factor := FieldByName
            ('HMS_Noise_Reduction_Factor').AsSingle;
          TAS_Noise_Reduction_Factor := FieldByName
            ('TAS_Noise_Reduction_Factor').AsSingle;
          Infrared_Decoy_Capable := FieldByName('Infrared_Decoy_Capable')
            .AsBoolean;
          HF_Mid_Course_Update_Capable := FieldByName
            ('HF_Mid_Course_Update_Capable').AsBoolean;
          UHF_Mid_Course_Update_Capable := FieldByName
            ('UHF_Mid_Course_Update_Capable').AsBoolean;
          Weight := FieldByName('DWT').AsSingle;
          // SATCOM_Mid_Course_Update_Capable    := FieldByName('SATCOM_Mid_Course_Update_Capable').AsBoolean;
        end;

        vList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getMissileByLibrary(const id_Library: Integer;
  var vList: TList): Integer;
var
  rec: TVehicle_Definition;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM  Platform_Library_Entry a ';
    ssql := ssql +
      'join Vehicle_Definition b on a.Vehicle_Index = b.Vehicle_Index ';
    ssql := ssql + 'WHERE a.Library_Index = ' + IntToStr(id_Library) + ' ';
    ssql := ssql + 'AND a.Platform_Type = 1';
    // ShowMessage(ssql);
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(vList) then
        vList := TList.Create
      else
        vList.Clear;

      while not ZQ.Eof do
      begin
        rec := TVehicle_Definition.Create;

        with rec.FData do
        begin
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Motion_Characteristics := FieldByName('Motion_Characteristics')
            .AsInteger;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Draft := FieldByName('Draft').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Magnetic_Cross := FieldByName('Magnetic_Cross').AsSingle;
          Front_Visual_EO_Cross := FieldByName('Front_Visual_EO_Cross')
            .AsSingle;
          Side_Visual_EO_Cross := FieldByName('Side_Visual_EO_Cross').AsSingle;
          Front_Infrared_Cross := FieldByName('Front_Infrared_Cross').AsSingle;
          Side_Infrared_Cross := FieldByName('Side_Infrared_Cross').AsSingle;
          LSpeed_Acoustic_Intens := FieldByName('LSpeed_Acoustic_Intens')
            .AsSingle;
          Below_Cav_Acoustic_Intens := FieldByName('Below_Cav_Acoustic_Intens')
            .AsSingle;
          Above_Cav_Acoustic_Intens := FieldByName('Above_Cav_Acoustic_Intens')
            .AsSingle;
          HSpeed_Acoustic_Intens := FieldByName('HSpeed_Acoustic_Intens')
            .AsSingle;
          Cavitation_Speed_Switch := FieldByName('Cavitation_Speed_Switch')
            .AsSingle;
          Time_of_Weapon_Impact := FieldByName('Time_of_Weapon_Impact')
            .AsInteger;
          Chaff_Seduction_Capable := FieldByName('Chaff_Seduction_Capable')
            .AsBoolean;
          Seduction_Mode_Prob := FieldByName('Seduction_Mode_Prob').AsSingle;
          Min_Delay_Between_Chaff_Rounds := FieldByName
            ('Min_Delay_Between_Chaff_Rounds').AsInteger;
          Max_Chaff_Salvo_Size := FieldByName('Max_Chaff_Salvo_Size').AsInteger;
          SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
          CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
          TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
          IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
          AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
          Active_Acoustic_Tor_POH_Mod := FieldByName
            ('Active_Acoustic_Tor_POH_Mod').AsSingle;
          Passive_Acoustic_Tor_POH_Mod := FieldByName
            ('Passive_Acoustic_Tor_POH_Mod').AsSingle;
          Active_Passive_Tor_POH_Mod := FieldByName
            ('Active_Passive_Tor_POH_Mod').AsSingle;
          Wake_Home_POH_Modifier := FieldByName('Wake_Home_POH_Modifier')
            .AsSingle;
          Wire_Guide_POH_Modifier := FieldByName('Wire_Guide_POH_Modifier')
            .AsSingle;
          Mag_Mine_POH_Modifier := FieldByName('Mag_Mine_POH_Modifier')
            .AsSingle;
          Press_Mine_POH_Modifier := FieldByName('Press_Mine_POH_Modifier')
            .AsSingle;
          Impact_Mine_POH_Modifier := FieldByName('Impact_Mine_POH_Modifier')
            .AsSingle;
          Acoustic_Mine_POH_Modifier := FieldByName
            ('Acoustic_Mine_POH_Modifier').AsSingle;
          Sub_Comm_Antenna_Height := FieldByName('Sub_Comm_Antenna_Height')
            .AsSingle;
          Rel_Comm_Antenna_Height := FieldByName('Rel_Comm_Antenna_Height')
            .AsSingle;
          Max_Comm_Operating_Depth := FieldByName('Max_Comm_Operating_Depth')
            .AsSingle;
          HF_Link_Capable := FieldByName('HF_Link_Capable').AsBoolean;
          UHF_Link_Capable := FieldByName('UHF_Link_Capable').AsBoolean;
          HF_Voice_Capable := FieldByName('HF_Voice_Capable').AsBoolean;
          VHF_Voice_Capable := FieldByName('VHF_Voice_Capable').AsBoolean;
          UHF_Voice_Capable := FieldByName('UHF_Voice_Capable').AsBoolean;
          SATCOM_Voice_Capable := FieldByName('SATCOM_Voice_Capable').AsBoolean;
          UWT_Voice_Capable := FieldByName('UWT_Voice_Capable').AsBoolean;
          HF_MHS_Capable := FieldByName('HF_MHS_Capable').AsBoolean;
          UHF_MHS_Capable := FieldByName('UHF_MHS_Capable').AsBoolean;
          SATCOM_MHS_Capable := FieldByName('SATCOM_MHS_Capable').AsBoolean;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          Plat_Basing_Capability := FieldByName('Plat_Basing_Capability')
            .AsBoolean;
          Chaff_Capability := FieldByName('Chaff_Capability').AsBoolean;
          Readying_Time := FieldByName('Readying_Time').AsInteger;
          Sonobuoy_Capable := FieldByName('Sonobuoy_Capable').AsBoolean;
          Nav_Light_Capable := FieldByName('Nav_Light_Capable').AsBoolean;
          Periscope_Depth := FieldByName('Periscope_Depth').AsSingle;
          Periscope_Height_Above_Water := FieldByName
            ('Periscope_Height_Above_Water').AsSingle;
          Periscope_Front_Radar_Xsection := FieldByName
            ('Periscope_Front_Radar_Xsection').AsSingle;
          Periscope_Side_Radar_Xsection := FieldByName
            ('Periscope_Side_Radar_Xsection').AsSingle;
          Periscope_Front_Vis_Xsection := FieldByName
            ('Periscope_Front_Vis_Xsection').AsSingle;
          Periscope_Side_Vis_Xsection := FieldByName
            ('Periscope_Side_Vis_Xsection').AsSingle;
          Periscope_Front_IR_Xsection := FieldByName
            ('Periscope_Front_IR_Xsection').AsSingle;
          Periscope_Side_IR_Xsection := FieldByName
            ('Periscope_Side_IR_Xsection').AsSingle;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          Auto_Air_Defense_Capable := FieldByName('Auto_Air_Defense_Capable')
            .AsBoolean;
          Alert_State_Time := FieldByName('Alert_State_Time').AsSingle;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
          Max_Sonobuoys_To_Monitor := FieldByName('Max_Sonobuoys_To_Monitor')
            .AsInteger;
          Sonobuoy_Deploy_Max_Altitude := FieldByName
            ('Sonobuoy_Deploy_Max_Altitude').AsInteger;
          Sonobuoy_Deploy_Min_Altitude := FieldByName
            ('Sonobuoy_Deploy_Min_Altitude').AsInteger;
          Sonobuoy_Deploy_Max_Speed := FieldByName('Sonobuoy_Deploy_Max_Speed')
            .AsInteger;
          Air_Drop_Torpedo_Max_Altitude := FieldByName
            ('Air_Drop_Torpedo_Max_Altitude').AsInteger;
          Air_Drop_Torpedo_Min_Altitude := FieldByName
            ('Air_Drop_Torpedo_Min_Altitude').AsInteger;
          Air_Drop_Torpedo_Max_Speed := FieldByName
            ('Air_Drop_Torpedo_Max_Speed')
            .AsInteger;
          TMA_Rate_Factor := FieldByName('TMA_Rate_Factor').AsSingle;
          HMS_Noise_Reduction_Factor := FieldByName
            ('HMS_Noise_Reduction_Factor').AsSingle;
          TAS_Noise_Reduction_Factor := FieldByName
            ('TAS_Noise_Reduction_Factor').AsSingle;
          Infrared_Decoy_Capable := FieldByName('Infrared_Decoy_Capable')
            .AsBoolean;
          HF_Mid_Course_Update_Capable := FieldByName
            ('HF_Mid_Course_Update_Capable').AsBoolean;
          UHF_Mid_Course_Update_Capable := FieldByName
            ('UHF_Mid_Course_Update_Capable').AsBoolean;
          // SATCOM_Mid_Course_Update_Capable    := FieldByName('SATCOM_Mid_Course_Update_Capable').AsBoolean;
        end;

        vList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;
// ------------------------------------------------------------------------------

function TdmTTT.updateVehicle_Def(var rec: TVehicle_Definition;
  const id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Vehicle_Definition ');
      SQL.Add('SET ');
      SQL.Add('Vehicle_Identifier = ''' + Vehicle_Identifier + ''',');
      SQL.Add('Platform_Domain = ' + IntToStr(Platform_Domain) + ',');
      SQL.Add('Platform_Category = ' + IntToStr(Platform_Category) + ',');
      SQL.Add('Platform_Type = ' + IntToStr(Platform_Type) + ',');
      SQL.Add('Motion_Characteristics = ' + IntToStr(Motion_Characteristics)
          + ',');
      SQL.Add('Length = ' + FloatToStr(Length) + ',');
      SQL.Add('Width = ' + FloatToStr(Width) + ',');
      SQL.Add('Height = ' + FloatToStr(Height) + ',');
      SQL.Add('Draft = ' + FloatToStr(Draft) + ',');
      SQL.Add('Front_Radar_Cross = ' + FloatToStr(Front_Radar_Cross) + ',');
      SQL.Add('Side_Radar_Cross = ' + FloatToStr(Side_Radar_Cross) + ',');
      SQL.Add('Front_Acoustic_Cross = ' + FloatToStr(Front_Acoustic_Cross)
          + ',');
      SQL.Add('Side_Acoustic_Cross = ' + FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add('Magnetic_Cross = ' + FloatToStr(Magnetic_Cross) + ',');
      SQL.Add('Front_Visual_EO_Cross = ' + FloatToStr(Front_Visual_EO_Cross)
          + ',');
      SQL.Add('Side_Visual_EO_Cross = ' + FloatToStr(Side_Visual_EO_Cross)
          + ',');
      SQL.Add('Front_Infrared_Cross = ' + FloatToStr(Front_Infrared_Cross)
          + ',');
      SQL.Add('Side_Infrared_Cross = ' + FloatToStr(Side_Infrared_Cross) + ',');
      SQL.Add('LSpeed_Acoustic_Intens = ' + FloatToStr(LSpeed_Acoustic_Intens)
          + ',');
      SQL.Add('Below_Cav_Acoustic_Intens = ' + FloatToStr
          (Below_Cav_Acoustic_Intens) + ',');
      SQL.Add('Above_Cav_Acoustic_Intens = ' + FloatToStr
          (Above_Cav_Acoustic_Intens) + ',');
      SQL.Add('HSpeed_Acoustic_Intens = ' + FloatToStr(HSpeed_Acoustic_Intens)
          + ',');
      SQL.Add('Cavitation_Speed_Switch = ' + FloatToStr
          (Cavitation_Speed_Switch) + ',');
      SQL.Add('Time_of_Weapon_Impact = ' + IntToStr(Time_of_Weapon_Impact)
          + ',');
      SQL.Add('Chaff_Seduction_Capable = ' + BoolToStr(Chaff_Seduction_Capable)
          + ',');
      SQL.Add('Seduction_Mode_Prob = ' + FloatToStr(Seduction_Mode_Prob) + ',');
      SQL.Add('Min_Delay_Between_Chaff_Rounds = ' + IntToStr
          (Min_Delay_Between_Chaff_Rounds) + ',');
      SQL.Add('Max_Chaff_Salvo_Size = ' + IntToStr(Max_Chaff_Salvo_Size) + ',');
      SQL.Add('SARH_POH_Modifier = ' + FloatToStr(SARH_POH_Modifier) + ',');
      SQL.Add('CG_POH_Modifier = ' + FloatToStr(CG_POH_Modifier) + ',');
      SQL.Add('TARH_POH_Modifier = ' + FloatToStr(TARH_POH_Modifier) + ',');
      SQL.Add('IR_POH_Modifier = ' + FloatToStr(IR_POH_Modifier) + ',');
      SQL.Add('AR_POH_Modifier = ' + FloatToStr(AR_POH_Modifier) + ',');
      SQL.Add('Active_Acoustic_Tor_POH_Mod = ' + FloatToStr
          (Active_Acoustic_Tor_POH_Mod) + ',');
      SQL.Add('Passive_Acoustic_Tor_POH_Mod = ' + FloatToStr
          (Passive_Acoustic_Tor_POH_Mod) + ',');
      SQL.Add('Active_Passive_Tor_POH_Mod = ' + FloatToStr
          (Active_Passive_Tor_POH_Mod) + ',');
      SQL.Add('Wake_Home_POH_Modifier = ' + FloatToStr(Wake_Home_POH_Modifier)
          + ',');
      SQL.Add('Wire_Guide_POH_Modifier = ' + FloatToStr
          (Wire_Guide_POH_Modifier) + ',');
      SQL.Add('Mag_Mine_POH_Modifier = ' + FloatToStr(Mag_Mine_POH_Modifier)
          + ',');
      SQL.Add('Press_Mine_POH_Modifier = ' + FloatToStr
          (Press_Mine_POH_Modifier) + ',');
      SQL.Add('Impact_Mine_POH_Modifier = ' + FloatToStr
          (Impact_Mine_POH_Modifier) + ',');
      SQL.Add('Acoustic_Mine_POH_Modifier = ' + FloatToStr
          (Acoustic_Mine_POH_Modifier) + ',');
      SQL.Add('Sub_Comm_Antenna_Height = ' + FloatToStr
          (Sub_Comm_Antenna_Height) + ',');
      SQL.Add('Rel_Comm_Antenna_Height = ' + FloatToStr
          (Rel_Comm_Antenna_Height) + ',');
      SQL.Add('Max_Comm_Operating_Depth = ' + FloatToStr
          (Max_Comm_Operating_Depth) + ',');
      SQL.Add('HF_Link_Capable = ' + BoolToStr(HF_Link_Capable) + ',');
      SQL.Add('UHF_Link_Capable = ' + BoolToStr(UHF_Link_Capable) + ',');
      SQL.Add('HF_Voice_Capable = ' + BoolToStr(HF_Voice_Capable) + ',');
      SQL.Add('VHF_Voice_Capable = ' + BoolToStr(VHF_Voice_Capable) + ',');
      SQL.Add('UHF_Voice_Capable = ' + BoolToStr(UHF_Voice_Capable) + ',');
      SQL.Add('SATCOM_Voice_Capable = ' + BoolToStr(SATCOM_Voice_Capable)
          + ',');
      SQL.Add('UWT_Voice_Capable = ' + BoolToStr(UWT_Voice_Capable) + ',');
      SQL.Add('HF_MHS_Capable = ' + BoolToStr(HF_MHS_Capable) + ',');
      SQL.Add('UHF_MHS_Capable = ' + BoolToStr(UHF_MHS_Capable) + ',');
      SQL.Add('SATCOM_MHS_Capable = ' + BoolToStr(SATCOM_MHS_Capable) + ',');
      SQL.Add('Damage_Capacity = ' + IntToStr(Damage_Capacity) + ',');
      SQL.Add('Plat_Basing_Capability = ' + BoolToStr(Plat_Basing_Capability)
          + ',');
      SQL.Add('Chaff_Capability = ' + BoolToStr(Chaff_Capability) + ',');
      SQL.Add('Readying_Time = ' + IntToStr(Readying_Time) + ',');
      SQL.Add('Sonobuoy_Capable = ' + BoolToStr(Sonobuoy_Capable) + ',');
      SQL.Add('Nav_Light_Capable = ' + BoolToStr(Nav_Light_Capable) + ',');
      SQL.Add('Periscope_Depth = ' + FloatToStr(Periscope_Depth) + ',');
      SQL.Add('Periscope_Height_Above_Water = ' + FloatToStr
          (Periscope_Height_Above_Water) + ',');
      SQL.Add('Periscope_Front_Radar_Xsection = ' + FloatToStr
          (Periscope_Front_Radar_Xsection) + ',');
      SQL.Add('Periscope_Side_Radar_Xsection = ' + FloatToStr
          (Periscope_Side_Radar_Xsection) + ',');
      SQL.Add('Periscope_Front_Vis_Xsection = ' + FloatToStr
          (Periscope_Front_Vis_Xsection) + ',');
      SQL.Add('Periscope_Side_Vis_Xsection = ' + FloatToStr
          (Periscope_Side_Vis_Xsection) + ',');
      SQL.Add('Periscope_Front_IR_Xsection = ' + FloatToStr
          (Periscope_Front_IR_Xsection) + ',');
      SQL.Add('Periscope_Side_IR_Xsection = ' + FloatToStr
          (Periscope_Side_IR_Xsection) + ',');
      SQL.Add('Engagement_Range = ' + FloatToStr(Engagement_Range) + ',');
      SQL.Add('Auto_Air_Defense_Capable = ' + BoolToStr
          (Auto_Air_Defense_Capable) + ',');
      SQL.Add('Alert_State_Time = ' + FloatToStr(Alert_State_Time) + ',');
      SQL.Add('Detectability_Type = ' + IntToStr(Detectability_Type) + ',');
      SQL.Add('Max_Sonobuoys_To_Monitor = ' + IntToStr
          (Max_Sonobuoys_To_Monitor) + ',');
      SQL.Add('Sonobuoy_Deploy_Max_Altitude = ' + IntToStr
          (Sonobuoy_Deploy_Max_Altitude) + ',');
      SQL.Add('Sonobuoy_Deploy_Min_Altitude = ' + IntToStr
          (Sonobuoy_Deploy_Min_Altitude) + ',');
      SQL.Add('Sonobuoy_Deploy_Max_Speed = ' + IntToStr
          (Sonobuoy_Deploy_Max_Speed) + ',');
      SQL.Add('Air_Drop_Torpedo_Max_Altitude = ' + IntToStr
          (Air_Drop_Torpedo_Max_Altitude) + ',');
      SQL.Add('Air_Drop_Torpedo_Min_Altitude = ' + IntToStr
          (Air_Drop_Torpedo_Min_Altitude) + ',');
      SQL.Add('Air_Drop_Torpedo_Max_Speed = ' + IntToStr
          (Air_Drop_Torpedo_Max_Speed) + ',');
      SQL.Add('TMA_Rate_Factor = ' + FloatToStr(TMA_Rate_Factor) + ',');
      SQL.Add('HMS_Noise_Reduction_Factor = ' + FloatToStr
          (HMS_Noise_Reduction_Factor) + ',');
      SQL.Add('TAS_Noise_Reduction_Factor = ' + FloatToStr
          (TAS_Noise_Reduction_Factor) + ',');
      SQL.Add('Infrared_Decoy_Capable = ' + BoolToStr(Infrared_Decoy_Capable)
          + ',');
      SQL.Add('HF_Mid_Course_Update_Capable = ' + BoolToStr
          (HF_Mid_Course_Update_Capable) + ',');
      SQL.Add('UHF_Mid_Course_Update_Capable = ' + BoolToStr
          (UHF_Mid_Course_Update_Capable) + ',');
      SQL.Add('SATCOM_Mid_Course_Update_Capable = ' + BoolToStr
          (SATCOM_Mid_Course_Update_Capable));
      SQL.Add(' WHERE (Vehicle_Index = ' + id + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertVehicle_Def(rec: TVehicle_Definition): Integer;
begin
  result := -1;
//  DecimalSeparator := '.';
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Vehicle_Definition ');
      SQL.Add(
        '(Vehicle_Identifier,Platform_Domain,Platform_Category,Platform_Type,Motion_Characteristics,');
      SQL.Add(
        'Length,Width,Height,Draft,Front_Radar_Cross,Side_Radar_Cross,Front_Acoustic_Cross,Side_Acoustic_Cross,Magnetic_Cross,');
      SQL.Add(
        'Front_Visual_EO_Cross,Side_Visual_EO_Cross,Front_Infrared_Cross,Side_Infrared_Cross,LSpeed_Acoustic_Intens,');
      SQL.Add(
        'Below_Cav_Acoustic_Intens,Above_Cav_Acoustic_Intens,HSpeed_Acoustic_Intens,Cavitation_Speed_Switch,');
      SQL.Add(
        'Time_of_Weapon_Impact,Chaff_Seduction_Capable,Seduction_Mode_Prob,Min_Delay_Between_Chaff_Rounds,Max_Chaff_Salvo_Size,');
      SQL.Add(
        'SARH_POH_Modifier,CG_POH_Modifier,TARH_POH_Modifier,IR_POH_Modifier,AR_POH_Modifier,');
      SQL.Add(
        'Active_Acoustic_Tor_POH_Mod,Passive_Acoustic_Tor_POH_Mod,Active_Passive_Tor_POH_Mod,Wake_Home_POH_Modifier,Wire_Guide_POH_Modifier,');
      SQL.Add(
        'Mag_Mine_POH_Modifier,Press_Mine_POH_Modifier,Impact_Mine_POH_Modifier,Acoustic_Mine_POH_Modifier,');
      SQL.Add(
        'Sub_Comm_Antenna_Height,Rel_Comm_Antenna_Height,Max_Comm_Operating_Depth,HF_Link_Capable,UHF_Link_Capable,');
      SQL.Add(
        'HF_Voice_Capable,VHF_Voice_Capable,UHF_Voice_Capable,SATCOM_Voice_Capable,UWT_Voice_Capable,');
      SQL.Add(
        'HF_MHS_Capable,UHF_MHS_Capable,Satcom_MHS_Capable,Damage_Capacity,');
      SQL.Add(
        'Plat_Basing_Capability,Chaff_Capability,Readying_Time,Sonobuoy_Capable,Nav_Light_Capable,Periscope_Depth,');
      SQL.Add(
        'Periscope_Height_Above_Water,Periscope_Front_Radar_Xsection,Periscope_Side_Radar_Xsection,Periscope_Front_Vis_Xsection,Periscope_Side_Vis_Xsection,');
      SQL.Add(
        'Periscope_Front_IR_Xsection,Periscope_Side_IR_Xsection,Engagement_Range,Auto_Air_Defense_Capable,Alert_State_Time,');
      SQL.Add(
        'Detectability_Type,Max_Sonobuoys_To_Monitor,Sonobuoy_Deploy_Max_Altitude,Sonobuoy_Deploy_Min_Altitude,');
      SQL.Add(
        'Sonobuoy_Deploy_Max_Speed,Air_Drop_Torpedo_Max_Altitude,Air_Drop_Torpedo_Min_Altitude,Air_Drop_Torpedo_Max_Speed,TMA_Rate_Factor,');
      SQL.Add(
        'HMS_Noise_Reduction_Factor,TAS_Noise_Reduction_Factor,Infrared_Decoy_Capable,HF_Mid_Course_Update_Capable,');
      SQL.Add
        ('UHF_Mid_Course_Update_Capable,SATCOM_Mid_Course_Update_Capable)');
      SQL.Add(' VALUES (');

//      SQL.Add('''' + Vehicle_Identifier + ''',');
      SQL.Add( QuotedStr(Vehicle_Identifier) + ',');
      SQL.Add(IntToStr(Platform_Domain) + ',');
      SQL.Add(IntToStr(Platform_Category) + ',');
      SQL.Add(IntToStr(Platform_Type) + ',');
      SQL.Add(IntToStr(Motion_Characteristics) + ',');
      SQL.Add(FloatToStr(Length) + ',');
      SQL.Add(FloatToStr(Width) + ',');
      SQL.Add(FloatToStr(Height) + ',');
      SQL.Add(FloatToStr(Draft) + ',');
      SQL.Add(FloatToStr(Front_Radar_Cross) + ',');
      SQL.Add(FloatToStr(Side_Radar_Cross) + ',');
      SQL.Add(FloatToStr(Front_Acoustic_Cross) + ',');
      SQL.Add(FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add(FloatToStr(Magnetic_Cross) + ',');
      SQL.Add(FloatToStr(Front_Visual_EO_Cross) + ',');
      SQL.Add(FloatToStr(Side_Visual_EO_Cross) + ',');
      SQL.Add(FloatToStr(Front_Infrared_Cross) + ',');
      SQL.Add(FloatToStr(Side_Infrared_Cross) + ',');
      SQL.Add(FloatToStr(LSpeed_Acoustic_Intens) + ',');
      SQL.Add(FloatToStr(Below_Cav_Acoustic_Intens) + ',');
      SQL.Add(FloatToStr(Above_Cav_Acoustic_Intens) + ',');
      SQL.Add(FloatToStr(HSpeed_Acoustic_Intens) + ',');
      SQL.Add(FloatToStr(Cavitation_Speed_Switch) + ',');
      SQL.Add(IntToStr(Time_of_Weapon_Impact) + ',');
      SQL.Add(BoolToStr(Chaff_Seduction_Capable) + ',');
      SQL.Add(FloatToStr(Seduction_Mode_Prob) + ',');
      SQL.Add(IntToStr(Min_Delay_Between_Chaff_Rounds) + ',');
      SQL.Add(IntToStr(Max_Chaff_Salvo_Size) + ',');
      SQL.Add(FloatToStr(SARH_POH_Modifier) + ',');
      SQL.Add(FloatToStr(CG_POH_Modifier) + ',');
      SQL.Add(FloatToStr(TARH_POH_Modifier) + ',');
      SQL.Add(FloatToStr(IR_POH_Modifier) + ',');
      SQL.Add(FloatToStr(AR_POH_Modifier) + ',');
      SQL.Add(FloatToStr(Active_Acoustic_Tor_POH_Mod) + ',');
      SQL.Add(FloatToStr(Passive_Acoustic_Tor_POH_Mod) + ',');
      SQL.Add(FloatToStr(Active_Passive_Tor_POH_Mod) + ',');
      SQL.Add(FloatToStr(Wake_Home_POH_Modifier) + ',');
      SQL.Add(FloatToStr(Wire_Guide_POH_Modifier) + ',');
      SQL.Add(FloatToStr(Mag_Mine_POH_Modifier) + ',');
      SQL.Add(FloatToStr(Press_Mine_POH_Modifier) + ',');
      SQL.Add(FloatToStr(Impact_Mine_POH_Modifier) + ',');
      SQL.Add(FloatToStr(Acoustic_Mine_POH_Modifier) + ',');
      SQL.Add(FloatToStr(Sub_Comm_Antenna_Height) + ',');
      SQL.Add(FloatToStr(Rel_Comm_Antenna_Height) + ',');
      SQL.Add(FloatToStr(Max_Comm_Operating_Depth) + ',');
      SQL.Add(BoolToStr(HF_Link_Capable) + ',');
      SQL.Add(BoolToStr(UHF_Link_Capable) + ',');
      SQL.Add(BoolToStr(HF_Voice_Capable) + ',');
      SQL.Add(BoolToStr(VHF_Voice_Capable) + ',');
      SQL.Add(BoolToStr(UHF_Voice_Capable) + ',');
      SQL.Add(BoolToStr(SATCOM_Voice_Capable) + ',');
      SQL.Add(BoolToStr(UWT_Voice_Capable) + ',');
      SQL.Add(BoolToStr(HF_MHS_Capable) + ',');
      SQL.Add(BoolToStr(UHF_MHS_Capable) + ',');
      SQL.Add(BoolToStr(SATCOM_MHS_Capable) + ',');
      SQL.Add(IntToStr(Damage_Capacity) + ',');
      SQL.Add(BoolToStr(Plat_Basing_Capability) + ',');
      SQL.Add(BoolToStr(Chaff_Capability) + ',');
      SQL.Add(IntToStr(Readying_Time) + ',');
      SQL.Add(BoolToStr(Sonobuoy_Capable) + ',');
      SQL.Add(BoolToStr(Nav_Light_Capable) + ',');
      SQL.Add(FloatToStr(Periscope_Depth) + ',');
      SQL.Add(FloatToStr(Periscope_Height_Above_Water) + ',');
      SQL.Add(FloatToStr(Periscope_Front_Radar_Xsection) + ',');
      SQL.Add(FloatToStr(Periscope_Side_Radar_Xsection) + ',');
      SQL.Add(FloatToStr(Periscope_Front_Vis_Xsection) + ',');
      SQL.Add(FloatToStr(Periscope_Side_Vis_Xsection) + ',');
      SQL.Add(FloatToStr(Periscope_Front_IR_Xsection) + ',');
      SQL.Add(FloatToStr(Periscope_Side_IR_Xsection) + ',');
      SQL.Add(FloatToStr(Engagement_Range) + ',');
      SQL.Add(BoolToStr(Auto_Air_Defense_Capable) + ',');
      SQL.Add(FloatToStr(Alert_State_Time) + ',');
      SQL.Add(IntToStr(Detectability_Type) + ',');
      SQL.Add(IntToStr(Max_Sonobuoys_To_Monitor) + ',');
      SQL.Add(IntToStr(Sonobuoy_Deploy_Max_Altitude) + ',');
      SQL.Add(IntToStr(Sonobuoy_Deploy_Min_Altitude) + ',');
      SQL.Add(IntToStr(Sonobuoy_Deploy_Max_Speed) + ',');
      SQL.Add(IntToStr(Air_Drop_Torpedo_Max_Altitude) + ',');
      SQL.Add(IntToStr(Air_Drop_Torpedo_Min_Altitude) + ',');
      SQL.Add(IntToStr(Air_Drop_Torpedo_Max_Speed) + ',');
      SQL.Add(FloatToStr(TMA_Rate_Factor) + ',');
      SQL.Add(FloatToStr(HMS_Noise_Reduction_Factor) + ',');
      SQL.Add(FloatToStr(TAS_Noise_Reduction_Factor) + ',');
      SQL.Add(BoolToStr(Infrared_Decoy_Capable) + ',');
      SQL.Add(BoolToStr(HF_Mid_Course_Update_Capable) + ',');
      SQL.Add(BoolToStr(UHF_Mid_Course_Update_Capable) + ',');
      SQL.Add(BoolToStr(SATCOM_Mid_Course_Update_Capable) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT * FROM Vehicle_Definition ');
      SQL.Add('WHERE Vehicle_Identifier =' + quotedStr(Vehicle_Identifier));
      Open;
      with rec.FData do
      begin
        Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteVehicle(const id: Integer): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Vehicle_Definition ');
    SQL.Add('WHERE (Vehicle_Index = ' + IntToStr(id) + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------
function TdmTTT.GetSatellite_Definition(const id: Integer;
  var rec: TSatellite_Definition): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Satellite_Definition a LEFT JOIN Note_Storage b ');
    SQL.Add('ON a.Satellite_Index = b.Satellite_Index ');
    SQL.Add('WHERE (a.Satellite_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TSatellite_Definition.Create;

      with rec.FData do
      begin
        Satellite_Index := FieldByName('Satellite_Index').AsInteger;
        Satellite_Identifier := FieldByName('Satellite_Identifier').AsString;
        Platform_Domain := FieldByName('Platform_Domain').AsInteger;
        Platform_Category := FieldByName('Platform_Category').AsInteger;
        Platform_Type := FieldByName('Platform_Type').AsInteger;
        Length := FieldByName('Length').AsSingle;
        Width := FieldByName('Width').AsSingle;
        Height := FieldByName('Height').AsSingle;
        Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
        Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
        Orbit_Period := FieldByName('Orbit_Period').AsInteger;
        Detection_Range_Radius := FieldByName('Detection_Range_Radius')
          .AsSingle;
        Altitude := FieldByName('Altitude').AsSingle;
        Ground_Speed := FieldByName('Ground_Speed').AsSingle;
        Plat_Type_Recog_Capability := FieldByName('Plat_Type_Recog_Capability')
          .AsInteger;
        Plat_Class_Recog_Capability := FieldByName
          ('Plat_Class_Recog_Capability')
          .AsInteger;
      end;

      with rec.FNote do
      begin
        Note_Index := FieldByName('Note_Index').AsInteger;
        Note_Type := FieldByName('Note_Type').AsInteger;
        Notes := FieldByName('Notes').AsString;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllSatellite(const id: Integer; var sList: TList;
  var rec: TSatellite_Definition): Integer;
var
  ssql: string;
begin
  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Satellite_Definition ';
    if id <> 0 then
      ssql := ssql + 'WHERE Satellite_index =' + IntToStr(id);
    ssql := ssql + 'ORDER BY Satellite_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(sList) then
        sList := TList.Create
      else
        sList.Clear;

      while not ZQ.Eof do
      begin
        rec := TSatellite_Definition.Create;

        with rec.FData do
        begin
          Satellite_Index := FieldByName('Satellite_Index').AsInteger;
          Satellite_Identifier := FieldByName('Satellite_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
        end;

        sList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getPISatellite(var mList: TList; ra_id: Integer;
  force: Integer): Integer;
var
  rec: TSatellite_Definition;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Satellite_Definition a JOIN Platform_Instance b ');
    SQL.Add('ON a.Satellite_Index = b.Satellite_Index ');
    SQL.Add('WHERE b.Resource_Alloc_Index=' + IntToStr(ra_id) + ' AND ');
    SQL.Add('b.Force_Designation =' + IntToStr(force));
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(mList) then
        mList := TList.Create
      else
        mList.Clear;

      while not ZQ.Eof do
      begin
        rec := TSatellite_Definition.Create;

        with rec.FData do
        begin
          Satellite_Index := FieldByName('Satellite_Index').AsInteger;
          Satellite_Identifier := FieldByName('Satellite_Identifier').AsString;
        end;
        with rec.FPI do
        begin
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Instance_Name := FieldByName('Instance_Name').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
        end;

        mList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateSatellite_Def(var rec: TSatellite_Definition;
  const id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Satellite_Definition ');
      SQL.Add('SET ');
      SQL.Add('Satellite_Identifier =''' + Satellite_Identifier + ''',');
      SQL.Add('Platform_Domain  =' + IntToStr(Platform_Domain) + ',');
      SQL.Add('Platform_Category =' + IntToStr(Platform_Category) + ',');
      SQL.Add('Platform_Type =' + IntToStr(Platform_Type) + ',');
      SQL.Add('Length =' + FloatToStr(Length) + ',');
      SQL.Add('Width =' + FloatToStr(Width) + ',');
      SQL.Add('Height =' + FloatToStr(Height) + ',');
      SQL.Add('Front_Radar_Cross =' + FloatToStr(Front_Radar_Cross) + ',');
      SQL.Add('Side_Radar_Cross =' + FloatToStr(Side_Radar_Cross) + ',');
      SQL.Add('Orbit_Period =' + IntToStr(Orbit_Period) + ',');
      SQL.Add('Detection_Range_Radius =' + FloatToStr(Detection_Range_Radius)
          + ',');
      SQL.Add('Altitude =' + FloatToStr(Altitude) + ',');
      SQL.Add('Ground_Speed =' + FloatToStr(Ground_Speed) + ',');
      SQL.Add('Plat_Type_Recog_Capability =' + IntToStr
          (Plat_Type_Recog_Capability) + ',');
      SQL.Add('Plat_Class_Recog_Capability =' + IntToStr
          (Plat_Class_Recog_Capability));
    end;

    SQL.Add(' WHERE (Satellite_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteSatellite_Def(id: Integer): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Satellite_Definition ');
    SQL.Add('WHERE Satellite_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertSatellite_Def(rec: TSatellite_Definition): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Satellite_Definition ');
      SQL.Add(
        '(Satellite_Identifier,Platform_Domain,Platform_Category,Platform_Type,'
        );
      SQL.Add(
        'Length,Width,Height,Front_Radar_Cross,Side_Radar_Cross,Orbit_Period,Detection_Range_Radius,');
      SQL.Add(
        'Altitude,Ground_Speed,Plat_Type_Recog_Capability,Plat_Class_Recog_Capability)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Satellite_Identifier + ''',');
      SQL.Add(IntToStr(Platform_Domain) + ',');
      SQL.Add(IntToStr(Platform_Category) + ',');
      SQL.Add(IntToStr(Platform_Type) + ',');
      SQL.Add(FloatToStr(Length) + ',');
      SQL.Add(FloatToStr(Width) + ',');
      SQL.Add(FloatToStr(Height) + ',');
      SQL.Add(FloatToStr(Front_Radar_Cross) + ',');
      SQL.Add(FloatToStr(Side_Radar_Cross) + ',');
      SQL.Add(IntToStr(Orbit_Period) + ',');
      SQL.Add(FloatToStr(Detection_Range_Radius) + ',');
      SQL.Add(FloatToStr(Altitude) + ',');
      SQL.Add(FloatToStr(Ground_Speed) + ',');
      SQL.Add(IntToStr(Plat_Type_Recog_Capability) + ',');
      SQL.Add(IntToStr(Plat_Class_Recog_Capability) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Satellite_Index FROM Satellite_Definition ');
      SQL.Add('WHERE Satellite_Identifier = ' + quotedStr(Satellite_Identifier)
        );
      Open;
      with rec.FData do
      begin
        Satellite_Index := FieldByName('Satellite_Index').AsInteger;
      end;

    end;
  end;
end;

// ==Vehicle detail 1. Sensor ===================================================
// ------------------------------------------------------------------------------
function TdmTTT.getAllEO_On_Board(const id, index: Integer;
  var aRec: TList): Integer;
var
  i: Integer;
  rec: TEO_On_Board;
  EO_Blind: TBlind_Zone;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM  EO_On_Board a JOIN EO_Detection_Definition b ';
    ssql := ssql + 'ON a.EO_Index = b.EO_Index LEFT JOIN Note_Storage c ';
    ssql := ssql + 'ON c.EO_Index = b.EO_Index LEFT JOIN Vehicle_Definition d ';
    ssql := ssql + 'ON a.Vehicle_Index = d.Vehicle_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // if id tidak null
      if id <> 0 then
        ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(id) + ')';
    end
    else
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 AND a.EO_Index =' + IntToStr
        (index);

    SQL.Add(ssql);
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TEO_On_Board.Create;

        with rec.FData do
        begin
          EO_Instance_Index := FieldByName('EO_Instance_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          EO_Index := FieldByName('EO_Index').AsInteger;
          Antenna_Height := FieldByName('Antenna_Height').AsSingle;
        end;

        with rec.FEO_Def do
        begin
          EO_Index := FieldByName('EO_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Sensor_Type := FieldByName('Sensor_Type').AsInteger;
          Detection_Range := FieldByName('Detection_Range').AsSingle;
          Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Scan_Rate := FieldByName('Scan_Rate').AsSingle;
          Num_FC_Channels := FieldByName('Num_FC_Channels').AsInteger;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        with rec.FVehicle.FData do
        begin
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];
        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM EO_On_Board a JOIN Blind_ZOne_Definition b ');
        SQL.Add('ON a.EO_Instance_Index = b.EO_Instance_Index ');
        SQL.Add('WHERE (a.EO_Instance_Index = ' + IntToStr
            (rec.FData.EO_Instance_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          EO_Blind := TBlind_Zone.Create;

          with EO_Blind.FData do
          begin
            Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
            Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
            BlindZone_Number := FieldByName('BlindZone_Number').AsInteger;
            EO_Instance_Index := FieldByName('EO_Instance_Index').AsInteger;
            Start_Angle := FieldByName('Start_Angle').AsSingle;
            End_Angle := FieldByName('End_Angle').AsSingle;
          end;

          rec.FBlind.Add(EO_Blind);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateEO(rec: TEO_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE EO_On_Board ');
      SQL.Add('SET ');
      SQL.Add('EO_Instance_Index  =' + IntToStr(EO_Instance_Index) + ',');
      SQL.Add('Instance_Identifier=''' + Instance_Identifier + ''',');
      SQL.Add('Instance_Type  =' + IntToStr(Instance_Type) + ',');
      SQL.Add('EO_Index =' + IntToStr(EO_Index) + ',');
      SQL.Add('Antenna_Height =' + FloatToStr(Antenna_Height));
    end;

    SQL.Add(' WHERE (EO_Instance_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertEO(rec: TEO_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO EO_On_Board ');
      SQL.Add(
        '(Instance_Identifier,Instance_Type,Vehicle_Index,EO_Index,Antenna_Height)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Instance_Identifier + ''',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(EO_Index) + ',');
      SQL.Add(FloatToStr(Antenna_Height) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT * FROM EO_On_Board ');
      SQL.Add('WHERE Vehicle_Index = ' + IntToStr(Vehicle_Index) + ' ');
      SQL.Add('AND EO_Index = ' + IntToStr(EO_Index));
      Open;

      EO_Instance_Index := FieldByName('EO_Instance_Index').AsInteger;
    end;
  end;
end;

// ------------------------------------------------------------------------------

/// /====================================================
function TdmTTT.DeleteEO_On_Board(const id: string;
  var rec: TEO_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM EO_On_Board  ');
    SQL.Add('WHERE (EO_Instance_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.getEO_Def(const id: Integer; var aRec: TList;
  var rec: TEO_On_Board): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM EO_Detection_Definition a ';

    if id <> 0 then
      ssql := ssql + 'WHERE a.EO_Index = ' + IntToStr(id);

    ssql := ssql + 'ORDER BY Class_Identifier ';
    SQL.Add(ssql);
    Open;

    result := RecordCount;

    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TEO_On_Board.Create;

        with rec.FEO_Def do
        begin
          EO_Index := FieldByName('EO_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Sensor_Type := FieldByName('Sensor_Type').AsInteger;
          Detection_Range := FieldByName('Detection_Range').AsSingle;
          Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Scan_Rate := FieldByName('Scan_Rate').AsSingle;
          Num_FC_Channels := FieldByName('Num_FC_Channels').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateEO_Def(rec: TEO_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FEO_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE EO_Detection_Definition ');
      SQL.Add('SET ');
      SQL.Add('Class_Identifier =''' + Class_Identifier + ''',');
      SQL.Add('Sensor_Type  =' + IntToStr(Sensor_Type) + ',');
      SQL.Add('Detection_Range =' + FloatToStr(Detection_Range) + ',');
      SQL.Add('Known_Cross_Section =' + FloatToStr(Known_Cross_Section) + ',');
      SQL.Add('Max_Range  =' + FloatToStr(Max_Range) + ',');
      SQL.Add('Scan_Rate =' + FloatToStr(Scan_Rate) + ',');
      SQL.Add('Num_FC_Channels =' + IntToStr(Num_FC_Channels));
    end;

    SQL.Add(' WHERE (EO_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertEO_Def(rec: TEO_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FEO_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO EO_Detection_Definition ');
      SQL.Add(
        '(Class_Identifier,Sensor_Type,Detection_Range,Known_Cross_Section,');
      SQL.Add('Max_Range,Scan_Rate,Num_FC_Channels)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Class_Identifier + ''',');
      SQL.Add(IntToStr(Sensor_Type) + ',');
      SQL.Add(FloatToStr(Detection_Range) + ',');
      SQL.Add(FloatToStr(Known_Cross_Section) + ',');
      SQL.Add(FloatToStr(Max_Range) + ',');
      SQL.Add(FloatToStr(Scan_Rate) + ',');
      SQL.Add(IntToStr(Num_FC_Channels) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT EO_Index FROM EO_Detection_Definition ');
      SQL.Add('WHERE Class_Identifier =' + quotedStr(Class_Identifier));
      Open;
      with rec.FEO_Def do
      begin
        EO_Index := FieldByName('EO_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteEO_Def(id: Integer): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE EO_Detection_Definition ');
    SQL.Add('WHERE EO_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllESM_On_Board(const id, index: Integer;
  var aRec: TList): Integer;
var
  i: Integer;
  rec: TESM_On_Board;
  ESM_Blind: TBlind_Zone;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM  ESM_On_Board a JOIN  ESM_Definition b ';
    ssql := ssql + '   ON a.ESM_Index = b.ESM_Index LEFT JOIN Note_Storage c';
    ssql := ssql +
      '   ON c.ESM_Index = b.ESM_Index LEFT JOIN Vehicle_Definition d ';
    ssql := ssql + 'ON a.Vehicle_Index = d.Vehicle_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // jika id tidak 0
      if id <> 0 then
        ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(id) + ')';
    end
    else
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 AND a.ESM_Index =' + IntToStr
        (index);

    SQL.Add(ssql);
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TESM_On_Board.Create;

        with rec.FData do
        begin
          ESM_Instance_Index := FieldByName('ESM_Instance_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          ESM_Index := FieldByName('ESM_Index').AsInteger;
          Rel_Antenna_Height := FieldByName('Rel_Antenna_Height').AsSingle;
          Max_Operational_Depth := FieldByName('Max_Operational_Depth')
            .AsSingle;
          Submerged_Antenna_Height := FieldByName('Submerged_Antenna_Height')
            .AsSingle;
        end;

        with rec.FESM_Def do
        begin
          ESM_Index := FieldByName('ESM_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Low_Detect_Frequency1 := FieldByName('Low_Detect_Frequency1').AsFloat;
          High_Detect_Frequency1 := FieldByName('High_Detect_Frequency1')
            .AsFloat;
          Low_Detect_Frequency2 := FieldByName('Low_Detect_Frequency2').AsFloat;
          High_Detect_Frequency2 := FieldByName('High_Detect_Frequency2')
            .AsFloat;
          ESM_Classification := FieldByName('ESM_Classification').AsInteger;
          Emitter_Detect_Range_Factor := FieldByName
            ('Emitter_Detect_Range_Factor').AsSingle;
          Comm_Intercept_Capable := FieldByName('Comm_Intercept_Capable')
            .AsInteger;
          Frequency_Identify_Range := FieldByName('Frequency_Identify_Range')
            .AsFloat;
          PRF_Identify_Range := FieldByName('PRF_Identify_Range').AsSingle;
          Pulsewidth_Identify_Range := FieldByName('Pulsewidth_Identify_Range')
            .AsSingle;
          Scan_Period_Identify_Range := FieldByName
            ('Scan_Period_Identify_Range').AsSingle;
          Sector_Blank_Detection_Factor := FieldByName
            ('Sector_Blank_Detection_Factor').AsSingle;
          Identification_Period := FieldByName('Identification_Period')
            .AsSingle;
          Classification_Period := FieldByName('Classification_Period')
            .AsSingle;
          Minimum_Bearing_Error_Variance := FieldByName
            ('Minimum_Bearing_Error_Variance').AsSingle;
          Initial_Bearing_Error_Variance := FieldByName
            ('Initial_Bearing_Error_Variance').AsSingle;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        with rec.FVehicle.FData do
        begin
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];

        Close;
        SQL.Clear;
        SQL.Add('SELECT *');
        SQL.Add('FROM ESM_On_Board a JOIN Blind_Zone_Definition b ');
        SQL.Add('On a.ESM_Instance_Index = b.ESM_Instance_Index ');
        SQL.Add('WHERE (a.ESM_Instance_Index = ' + IntToStr
            (rec.FData.ESM_Instance_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          ESM_Blind := TBlind_Zone.Create;

          with ESM_Blind.FData do
          begin
            Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
            Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
            BlindZone_Number := FieldByName('BlindZone_Number').AsInteger;
            ESM_Instance_Index := FieldByName('ESM_Instance_Index').AsInteger;
            Start_Angle := FieldByName('Start_Angle').AsSingle;
            End_Angle := FieldByName('End_Angle').AsSingle;
          end;

          rec.FBlind.Add(ESM_Blind);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateESM(rec: TESM_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE ESM_On_Board ');
      SQL.Add('SET ');
      SQL.Add('ESM_Instance_Index  =' + IntToStr(ESM_Instance_Index) + ',');
      SQL.Add('Instance_Identifier=''' + Instance_Identifier + ''',');
      SQL.Add('Instance_Type  =' + IntToStr(Instance_Type) + ',');
      SQL.Add('ESM_Index =' + IntToStr(ESM_Index) + ',');
      SQL.Add('Rel_Antenna_Height =' + FloatToStr(Rel_Antenna_Height) + ',');
      SQL.Add('Max_Operational_Depth =' + FloatToStr(Max_Operational_Depth)
          + ',');
      SQL.Add('Submerged_Antenna_Height =' + FloatToStr
          (Submerged_Antenna_Height));
    end;

    SQL.Add(' WHERE (Vehicle_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertESM(rec: TESM_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO ESM_On_Board ');
      SQL.Add(
        '(Instance_Identifier,Instance_Type,Vehicle_Index,ESM_Index,Rel_Antenna_Height,Max_Operational_Depth,Submerged_Antenna_Height)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Instance_Identifier + ''',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(ESM_Index) + ',');
      SQL.Add(FloatToStr(Rel_Antenna_Height) + ',');
      SQL.Add(FloatToStr(Max_Operational_Depth) + ',');
      SQL.Add(FloatToStr(Submerged_Antenna_Height) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT * FROM ESM_On_Board ');
      SQL.Add('WHERE Vehicle_Index = '+ IntToStr(ESM_Index) + ' ');
      SQL.Add('AND ESM_Index = ' + IntToStr(ESM_Index) );
      Open;

      ESM_Instance_Index := FieldByName('ESM_Instance_Index').AsInteger;

    end;
  end;
end;

// -----------------------------------------------------------------------------
 ////====================================================
function TdmTTT.UpdateESM_On_Board(const id: string;
  var rec: TESM_On_Board): integer;
begin
  result := -1;
  with ZQ do begin
    with rec.FData do begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE ESM_On_Board  ');
      SQL.Add('SET ' );
      //SQL.Add('ESM_Instance_Index = '+IntToStr(ESM_Instance_Index)+',');
      SQL.Add('Instance_Identifier = '+ QuotedStr(Instance_Identifier)+',');
      SQL.Add('Instance_Type = '+IntToStr(Instance_Type)+',');
      SQL.Add('Vehicle_Index = '+IntToStr(Vehicle_Index)+',');
      SQL.Add('ESM_Index = '+IntToStr(ESM_Index)+',');
      SQL.Add('Rel_Antenna_Height = '+FloatToStr(Rel_Antenna_Height)+',');
      SQL.Add('Max_Operational_Depth = '+FloatToStr(Max_Operational_Depth)+',');
      SQL.Add('Submerged_Antenna_Height = '+FloatToStr(Submerged_Antenna_Height)+ ' ');
    end;
    SQL.Add('WHERE (ESM_Instance_Index = ' +  id + ')' );
    //ShowMessage(SQL.Text);
    ExecSQL;
  end;
end;
//-------------------------------------------------------------------

/// /====================================================
function TdmTTT.DeleteESM_On_Board(const id: string;
  var rec: TESM_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM ESM_On_Board  ');
    SQL.Add('WHERE (ESM_Instance_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.getESM_Def(var aRec: TList): boolean;
var
  rec: TESM_On_Board;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM ESM_Definition a LEFT JOIN Note_Storage b ');
    SQL.Add('ON a.ESM_Index = b.ESM_Index ORDER BY Class_Identifier ');
    Open;

    result := RecordCount > 0;

    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TESM_On_Board.Create;

        with rec.FESM_Def do
        begin
          ESM_Index := FieldByName('ESM_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Low_Detect_Frequency1 := FieldByName('Low_Detect_Frequency1').AsFloat;
          High_Detect_Frequency1 := FieldByName('High_Detect_Frequency1')
            .AsFloat;
          Low_Detect_Frequency2 := FieldByName('Low_Detect_Frequency2').AsFloat;
          High_Detect_Frequency2 := FieldByName('High_Detect_Frequency2')
            .AsFloat;
          ESM_Classification := FieldByName('ESM_Classification').AsInteger;
          Emitter_Detect_Range_Factor := FieldByName
            ('Emitter_Detect_Range_Factor').AsSingle;
          Comm_Intercept_Capable := FieldByName('Comm_Intercept_Capable')
            .AsInteger;
          Frequency_Identify_Range := FieldByName('Frequency_Identify_Range')
            .AsFloat;
          PRF_Identify_Range := FieldByName('PRF_Identify_Range').AsSingle;
          Pulsewidth_Identify_Range := FieldByName('Pulsewidth_Identify_Range')
            .AsSingle;
          Scan_Period_Identify_Range := FieldByName
            ('Scan_Period_Identify_Range').AsSingle;
          Sector_Blank_Detection_Factor := FieldByName
            ('Sector_Blank_Detection_Factor').AsSingle;
          Identification_Period := FieldByName('Identification_Period')
            .AsSingle;
          Classification_Period := FieldByName('Classification_Period')
            .AsSingle;
          Minimum_Bearing_Error_Variance := FieldByName
            ('Minimum_Bearing_Error_Variance').AsSingle;
          Initial_Bearing_Error_Variance := FieldByName
            ('Initial_Bearing_Error_Variance').AsSingle;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function TdmTTT.updateESM_Def(rec: TESM_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FESM_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE ESM_Definition ');
      SQL.Add('SET ');
      SQL.Add('Class_Identifier =''' + Class_Identifier + ''',');
      SQL.Add('Low_Detect_Frequency1  =' + FloatToStr(Low_Detect_Frequency1)
          + ',');
      SQL.Add('High_Detect_Frequency1 =' + FloatToStr(High_Detect_Frequency1)
          + ',');
      SQL.Add('Low_Detect_Frequency2 =' + FloatToStr(Low_Detect_Frequency2)
          + ',');
      SQL.Add('High_Detect_Frequency2 =' + FloatToStr(High_Detect_Frequency2)
          + ',');
      SQL.Add('ESM_Classification =' + IntToStr(ESM_Classification) + ',');
      SQL.Add('Emitter_Detect_Range_Factor  =' + FloatToStr
          (Emitter_Detect_Range_Factor) + ',');
      SQL.Add('Comm_Intercept_Capable =' + FloatToStr(Comm_Intercept_Capable)
          + ',');
      SQL.Add('Frequency_Identify_Range =' + FloatToStr
          (Frequency_Identify_Range) + ',');
      SQL.Add('PRF_Identify_Range =' + FloatToStr(PRF_Identify_Range) + ',');
      SQL.Add('Pulsewidth_Identify_Range =' + FloatToStr
          (Pulsewidth_Identify_Range) + ',');
      SQL.Add('Scan_Period_Identify_Range =' + FloatToStr
          (Scan_Period_Identify_Range) + ',');
      SQL.Add('Sector_Blank_Detection_Factor  =' + FloatToStr
          (Sector_Blank_Detection_Factor) + ',');
      SQL.Add('Identification_Period =' + FloatToStr(Identification_Period)
          + ',');
      SQL.Add('Classification_Period =' + FloatToStr(Classification_Period)
          + ',');
      SQL.Add('Minimum_Bearing_Error_Variance =' + FloatToStr
          (Minimum_Bearing_Error_Variance) + ',');
      SQL.Add('Initial_Bearing_Error_Variance =' + FloatToStr
          (Initial_Bearing_Error_Variance));
    end;

    SQL.Add(' WHERE (ESM_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// -----------------------------------------------------------------------------

function TdmTTT.insertESM_Def(rec: TESM_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FESM_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO ESM_Definition ');
      SQL.Add(
        '(Class_Identifier,Low_Detect_Frequency1,High_Detect_Frequency1,Low_Detect_Frequency2,');
      SQL.Add(
        'High_Detect_Frequency2,ESM_Classification,Emitter_Detect_Range_Factor,Comm_Intercept_Capable,');
      SQL.Add(
        'Frequency_Identify_Range,PRF_Identify_Range,Pulsewidth_Identify_Range,Scan_Period_Identify_Range,');
      SQL.Add(
        'Sector_Blank_Detection_Factor,Identification_Period,Classification_Period,Minimum_Bearing_Error_Variance,Initial_Bearing_Error_Variance)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Class_Identifier + ''',');
      SQL.Add(FloatToStr(Low_Detect_Frequency1) + ',');
      SQL.Add(FloatToStr(High_Detect_Frequency1) + ',');
      SQL.Add(FloatToStr(Low_Detect_Frequency2) + ',');
      SQL.Add(FloatToStr(High_Detect_Frequency2) + ',');
      SQL.Add(IntToStr(ESM_Classification) + ',');
      SQL.Add(FloatToStr(Emitter_Detect_Range_Factor) + ',');
      SQL.Add(FloatToStr(Comm_Intercept_Capable) + ',');
      SQL.Add(FloatToStr(Frequency_Identify_Range) + ',');
      SQL.Add(FloatToStr(PRF_Identify_Range) + ',');
      SQL.Add(FloatToStr(Pulsewidth_Identify_Range) + ',');
      SQL.Add(FloatToStr(Scan_Period_Identify_Range) + ',');
      SQL.Add(FloatToStr(Sector_Blank_Detection_Factor) + ',');
      SQL.Add(FloatToStr(Identification_Period) + ',');
      SQL.Add(FloatToStr(Classification_Period) + ',');
      SQL.Add(FloatToStr(Minimum_Bearing_Error_Variance) + ',');
      SQL.Add(FloatToStr(Initial_Bearing_Error_Variance) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT ESM_Index FROM ESM_Definition ');
      SQL.Add('WHERE Class_Identifier =' + quotedStr(Class_Identifier));
      Open;
      with rec.FESM_Def do
      begin
        ESM_Index := FieldByName('ESM_Index').AsInteger;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function TdmTTT.getAllIFF_Sensor_On_Board(const id, index: Integer;
  var aRec: TList): Integer;
var
  i, J: Integer;
  rec: TIFF_Sensor_On_Board;
  iffScript: TScripted_IFF;
  iffPattern: TPattern_IFF;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql +
      'FROM  IFF_Sensor_On_Board a LEFT JOIN Vehicle_Definition d ';
    ssql := ssql + 'ON a.Vehicle_Index = d.Vehicle_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // jika id tidak 0
      if id <> 0 then
      begin
        //ssql := ssql + 'JOIN Platform_IFF_Activation b ';
        //ssql := ssql + 'ON a.IFF_Instance_Index = b.IFF_Instance_Index ';
        ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(id) + ')';
      end;
    end
    else
    if id <> 0 then
    begin
      ssql := ssql + 'JOIN Platform_IFF_Activation b ';
      ssql := ssql + 'ON a.IFF_Instance_Index = b.IFF_Instance_Index ';
      ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(id) + ') AND ';
      ssql := ssql + '(a.IFF_Instance_Index =' + IntToStr(index) +')';
    end
    else
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 AND a.IFF_Instance_Index =' +
      IntToStr(index);

    SQL.Add(ssql);
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TIFF_Sensor_On_Board.Create;

        with rec.FData do
        begin
          IFF_Instance_Index := FieldByName('IFF_Instance_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          IFF_Capability := FieldByName('IFF_Capability').AsInteger;
          Rel_Antenna_Height := FieldByName('Rel_Antenna_Height').AsSingle;
          Submerged_Antenna_Height := FieldByName('Submerged_Antenna_Height')
            .AsSingle;
          Max_Operational_Depth := FieldByName('Max_Operational_Depth')
            .AsSingle;
        end;

        with rec.FVehicle.FData do
        begin
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];
        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM IFF_Sensor_On_Board a JOIN Scripted_IFF_Event b ');
        SQL.Add('ON a.IFF_Instance_Index = b.IFF_Instance_Index ');
        SQL.Add('WHERE (a.IFF_Instance_Index =' + IntToStr
            (rec.FData.IFF_Instance_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          iffScript := TScripted_IFF.Create;

          with iffScript.Event.FData do
          begin
            Scripted_Event_Index := FieldByName('Scripted_Event_Index')
              .AsInteger;
            IFF_Instance_Index := FieldByName('IFF_Instance_Index').AsInteger;
            IFF_Interrogator_Control := FieldByName('IFF_Interrogator_Control')
              .AsInteger;
            IFF_Transponder_Control := FieldByName('IFF_Transponder_Control')
              .AsInteger;
          end;

          GetScripted_Behav(iffScript.Event.FData.Scripted_Event_Index,
            iffScript.Behav);

          rec.FScripted_IFF.Add(iffScript);
          ZQ.Next;
        end;
      end;

      for J := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[J];

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM IFF_Sensor_On_Board a JOIN Pattern_IFF_Event b ');
        SQL.Add('ON a.IFF_Instance_Index = b.IFF_Instance_Index ');
        SQL.Add('WHERE (a.IFF_Instance_Index =' + IntToStr
            (rec.FData.IFF_Instance_Index) + ')');
        Open;

        ZQ.First;
        while not ZQ.Eof do
        begin
          iffPattern := TPattern_IFF.Create;

          with iffPattern.Event.FData do
          begin
            Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
              .AsInteger;
            IFF_Instance_Index := FieldByName('IFF_Instance_Index').AsInteger;
            IFF_Interrogator_Control := FieldByName('IFF_Interrogator_Control')
              .AsInteger;
            IFF_Transponder_Control := FieldByName('IFF_Transponder_Control')
              .AsInteger;
          end;

          GetScripted_Pattern(iffPattern.Event.FData.Scripted_Pattern_Index,
            iffPattern.pattern);

          rec.FPattern_IFF.Add(iffPattern);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateIFF(rec: TIFF_Sensor_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE IFF_Sensor_On_Board ');
      SQL.Add('SET ');
      //SQL.Add('IFF_Instance_Index  =' + IntToStr(IFF_Instance_Index) + ',');
      SQL.Add('Instance_Identifier=''' + Instance_Identifier + ''',');
      SQL.Add('Instance_Type  =' + IntToStr(Instance_Type) + ',');
      SQL.Add('IFF_Capability =' + IntToStr(IFF_Capability) + ',');
      SQL.Add('Rel_Antenna_Height =' + FloatToStr(Rel_Antenna_Height) + ',');
      SQL.Add('Max_Operational_Depth =' + FloatToStr(Max_Operational_Depth)
          + ',');
      SQL.Add('Submerged_Antenna_Height =' + FloatToStr
          (Submerged_Antenna_Height));
    end;

    SQL.Add(' WHERE (IFF_Instance_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertIFF(rec: TIFF_Sensor_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO IFF_Sensor_On_Board ');
      SQL.Add(
        '(Instance_Identifier,Instance_Type,Vehicle_Index,IFF_Capability,Rel_Antenna_Height,Max_Operational_Depth,Submerged_Antenna_Height)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Instance_Identifier + ''',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(IFF_Capability) + ',');
      SQL.Add(FloatToStr(Rel_Antenna_Height) + ',');
      SQL.Add(FloatToStr(Max_Operational_Depth) + ',');
      SQL.Add(FloatToStr(Submerged_Antenna_Height) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT * FROM IFF_Sensor_On_Board ');
      SQL.Add('WHERE Vehicle_Index = '+ IntToStr(Vehicle_Index) );
      Open;

      IFF_Instance_Index := FieldByName('IFF_Instance_Index').AsInteger;
    end;
  end;
end;

// ------------------------------------------------------------------------------

/// /====================================================
function TdmTTT.DeleteIFF_Sensor_On_Board(const id: string;
  var rec: TIFF_Sensor_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM IFF_Sensor_On_Board  ');
    SQL.Add('WHERE (IFF_Instance_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.updateScriptIFF(rec: TScripted_IFF_Event; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Scripted_IFF_Event ');
      SQL.Add('SET ');
      SQL.Add('IFF_Instance_Index =' + IntToStr(IFF_Instance_Index) + ',');
      SQL.Add('IFF_Interrogator_Control=' + IntToStr(IFF_Interrogator_Control)
          + ',');
      SQL.Add('IFF_Transponder_Control=' + IntToStr(IFF_Transponder_Control));
    end;

    SQL.Add(' WHERE (Scripted_Event_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllMAD_Sensor_On_Board(const id, index: Integer;
  var aRec: TList): Integer;
var
  rec: TMAD_Sensor_On_Board;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM  MAD_Sensor_On_Board a JOIN MAD_Definition b ';
    ssql := ssql + 'ON a.MAD_Index = b.MAD_Index LEFT JOIN Note_Storage c ';
    ssql := ssql +
      'ON c.MAD_Index = b.MAD_Index LEFT JOIN Vehicle_Definition d ';
    ssql := ssql + 'ON a.Vehicle_Index = d.Vehicle_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // jika id tidak 0
      if id <> 0 then
      begin
        ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(id) + ')';
      end;
    end
    else
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 AND a.MAD_Index =' + IntToStr
        (index);

    SQL.Add(ssql);
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TMAD_Sensor_On_Board.Create;

        with rec.FData do
        begin
          MAD_Instance_Index := FieldByName('MAD_Instance_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          MAD_Index := FieldByName('MAD_Index').AsInteger;
          Antenna_Height := FieldByName('Antenna_Height').AsSingle;
        end;

        with rec.FMAD_Def do
        begin
          MAD_Index := FieldByName('MAD_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Baseline_Detect_Range := FieldByName('Baseline_Detect_Range')
            .AsSingle;
          Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        with rec.FVehicle.FData do
        begin
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateMAD(rec: TMAD_Sensor_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE MAD_Sensor_On_Board ');
      SQL.Add('SET ');
      //SQL.Add('MAD_Instance_Index  =' + IntToStr(MAD_Instance_Index) + ',');
      SQL.Add('Instance_Identifier=''' + Instance_Identifier + ''',');
      SQL.Add('Instance_Type  =' + IntToStr(Instance_Type) + ',');
      SQL.Add('MAD_Index =' + IntToStr(MAD_Index) + ',');
      SQL.Add('Antenna_Height =' + FloatToStr(Antenna_Height));
    end;

    SQL.Add(' WHERE (MAD_Instance_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertMAD(rec: TMAD_Sensor_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO MAD_Sensor_On_Board ');
      SQL.Add(
        '(Instance_Identifier,Instance_Type,Vehicle_Index,MAD_Index,Antenna_Height)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Instance_Identifier + ''',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(MAD_Index) + ',');
      SQL.Add(FloatToStr(Antenna_Height) + ')');
      ExecSQL;

    end;
  end;
end;

/// /====================================================
function TdmTTT.DeleteMAD_Sensor_On_Board(const id: string;
  var rec: TMAD_Sensor_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM MAD_Sensor_On_Board  ');
    SQL.Add('WHERE (MAD_Instance_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------


// ------------------------------------------------------------------------------

function TdmTTT.getMAD_Def(const id: Integer; var aRec: TList;
  var rec: TMAD_Sensor_On_Board): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM MAD_Definition a ';
    if id <> 0 then
      ssql := ssql + 'WHERE a.MAD_Index = ' + IntToStr(id);
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TMAD_Sensor_On_Board.Create;

        with rec.FMAD_Def do
        begin
          MAD_Index := FieldByName('MAD_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Baseline_Detect_Range := FieldByName('Baseline_Detect_Range')
            .AsSingle;
          Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateMAD_Def(rec: TMAD_Sensor_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FMAD_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE MAD_Definition ');
      SQL.Add('SET ');
      SQL.Add('Class_Identifier =''' + Class_Identifier + ''',');
      SQL.Add('Baseline_Detect_Range  =' + FloatToStr(Baseline_Detect_Range)
          + ',');
      SQL.Add('Known_Cross_Section =' + FloatToStr(Known_Cross_Section));
    end;

    SQL.Add(' WHERE (MAD_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertMAD_Def(rec: TMAD_Sensor_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FMAD_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO MAD_Definition ');
      SQL.Add('(Class_Identifier,Baseline_Detect_Range,Known_Cross_Section)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Class_Identifier + ''',');
      SQL.Add(FloatToStr(Baseline_Detect_Range) + ',');
      SQL.Add(FloatToStr(Known_Cross_Section) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT MAD_Index FROM MAD_Definition ');
      SQL.Add('WHERE Class_Identifier =' + quotedStr(Class_Identifier));
      Open;
      with rec.FMAD_Def do
      begin
        MAD_Index := FieldByName('MAD_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteMAD_Def(id: Integer): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE MAD_Definition ');
    SQL.Add('WHERE MAD_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllVisual_Sensor_On_Board(const id, index: Integer;
  var aRec: TList): Integer;
var
  i: Integer;
  rec: TVisual_Sensor_On_Board;
  Visual_Blind: TBlind_Zone;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql +
      'FROM  Visual_Sensor_On_Board a LEFT JOIN Vehicle_Definition d ';
    ssql := ssql + 'ON a.Vehicle_Index = d.Vehicle_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // jika id tidak 0
      if id <> 0 then
        ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(id) + ')';
    end
    else
      ssql := ssql +
        'WHERE a.Vehicle_Index > 0 AND a.Visual_Instance_Index =' + IntToStr
        (index);

    SQL.Add(ssql);
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TVisual_Sensor_On_Board.Create;

        with rec.FData do
        begin
          Visual_Instance_Index := FieldByName('Visual_Instance_Index')
            .AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Observer_Height := FieldByName('Observer_Height').AsSingle;
        end;

        with rec.FVehicle.FData do
        begin
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Visual_Sensor_On_Board a JOIN Blind_Zone_Definition b ');
        SQL.Add('ON a.Visual_Instance_Index = b.Visual_Instance_Index ');
        SQL.Add('WHERE (a.Visual_Instance_Index = ' + IntToStr
            (rec.FData.Visual_Instance_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          Visual_Blind := TBlind_Zone.Create;

          with Visual_Blind.FData do
          begin
            Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
            Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
            BlindZone_Number := FieldByName('BlindZone_Number').AsInteger;
            Visual_Instance_Index := FieldByName('Visual_Instance_Index')
              .AsInteger;
            Start_Angle := FieldByName('Start_Angle').AsSingle;
            End_Angle := FieldByName('End_Angle').AsSingle;
          end;

          rec.FBlind.Add(Visual_Blind);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateVisual(rec: TVisual_Sensor_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Visual_Sensor_On_Board ');
      SQL.Add('SET ');
      SQL.Add('Instance_Identifier=''' + Instance_Identifier + ''', ');
      SQL.Add('Instance_Type  =' + IntToStr(Instance_Type) + ', ');
      SQL.Add('Observer_Height =' + FloatToStr(Observer_Height));
    end;

    SQL.Add(' WHERE (Visual_Instance_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertVisual(rec: TVisual_Sensor_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add(
        'SET IDENTITY_INSERT Runtime_DB.[dbo].[Visual_Sensor_On_Board] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Visual_Sensor_On_Board ');
      SQL.Add(
        '(Instance_Identifier,Instance_Type,Vehicle_Index,Observer_Height)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Instance_Identifier + ''',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(FloatToStr(Observer_Height) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

/// /====================================================
function TdmTTT.DeleteVisual_Sensor_On_Board(const id: string;
  var rec: TVisual_Sensor_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Visual_Sensor_On_Board  ');
    SQL.Add('WHERE (Visual_Instance_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.getAllFCR_On_Board(const id: Integer; var aRec: TList): Integer;
var
  i: Integer;
  rec: TFCR_On_Board;
  FCR_Blind: TBlind_Zone;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  FCR_On_Board a JOIN FCR_Definition b ');
    SQL.Add('   ON a.Radar_Index = b.FCR_Index LEFT JOIN Note_Storage c');
    SQL.Add('   ON c.FCR_Index = b.FCR_Index');
    SQL.Add('WHERE (a.Vehicle_index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TFCR_On_Board.Create;

        with rec.FData do
        begin
          FCR_Instance_Index := FieldByName('FCR_Instance_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Radar_Index := FieldByName('Radar_Index').AsInteger;
          Rel_Antenna_Height := FieldByName('Rel_Antenna_Height').AsSingle;
        end;

        with rec.FFCR_def do
        begin
          FCR_Index := FieldByName('FCR_Index').AsInteger;
          Radar_Identifier := FieldByName('Radar_Identifier').AsString;
          Radar_Emitter := FieldByName('Radar_Emitter').AsString;
          Frequency := FieldByName('Frequency').AsSingle;
          Scan_Rate := FieldByName('Scan_Rate').AsSingle;
          Radar_Power := FieldByName('Radar_Power').AsSingle;
          Pulse_Rep_Freq := FieldByName('Pulse_Rep_Freq').AsSingle;
          Pulse_Width := FieldByName('Pulse_Width').AsSingle;
          Max_Unambig_Detection_Range := FieldByName
            ('Max_Unambig_Detection_Range').AsSingle;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM FCR_On_Board a JOIN Blind_Zone_Definition b ');
        SQL.Add('ON a.FCR_Instance_Index = b.FCR_Instance_Index ');
        SQL.Add('WHERE (a.FCR_Instance_Index = ' + IntToStr
            (rec.FData.FCR_Instance_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          FCR_Blind := TBlind_Zone.Create;

          with FCR_Blind.FData do
          begin
            Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
            Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
            BlindZone_Number := FieldByName('BlindZone_Number').AsInteger;
            FCR_Instance_Index := FieldByName('FCR_Instance_Index').AsInteger;
            Start_Angle := FieldByName('Start_Angle').AsSingle;
            End_Angle := FieldByName('End_Angle').AsSingle;
          end;

          rec.FBlind.Add(FCR_Blind);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllRadar_On_Board(const id, index: Integer;
  var aRec: TList): Integer;
var
  i, J, k, l: Integer;
  radar: TRadar_On_Board;
  radarScript: TScripted_Radar;
  radarPattern: TPattern_Radar;
  //radarVertical: TRadar_Vertical;
  Radar_Blind: TBlind_Zone;
  ssql: string;
  //pVerticalCoverage: TRecRadar_Vertical_Coverage;
  pVerticalCoverage : TRadar_Vertical_Coverage;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM Radar_Definition a INNER JOIN Radar_On_Board b ';
    ssql := ssql + 'ON a.Radar_Index = b.Radar_Index INNER JOIN Radar_Type c ';
    ssql := ssql +
      'ON a.Radar_Type = c.Radar_Type_Index INNER JOIN ECCM_Type d ';
    ssql := ssql +
      'ON a.ECCM_Type = d.ECCM_Type_Index LEFT JOIN Note_Storage e ';
    ssql := ssql +
      'ON e.Radar_Index = b.Radar_Index LEFT JOIN Vehicle_Definition f ';
    ssql := ssql + 'ON b.Vehicle_Index = f.Vehicle_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE b.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // jika id tidak 0
      if id <> 0 then
      begin
        ssql := ssql + 'WHERE (b.Vehicle_index = ' + IntToStr(id) + ')';
      end;
    end
    else
      ssql := ssql + 'WHERE b.Vehicle_Index > 0 AND b.Radar_Index =' + IntToStr
        (index);

    SQL.Add(ssql);
    SQL.Add('ORDER BY b.Instance_Identifier');
    Open;

    result := RecordCount;
    if IsEmpty then
      exit;

    First;
  end;

  if not Assigned(aRec) then
    aRec := TList.Create
  else
    aRec.Clear;

  with ZQ do
  begin
    while not ZQ.Eof do
    begin
      radar := TRadar_On_Board.Create;

      with radar.FData do
      begin
        Radar_Instance_Index := FieldByName('Radar_Instance_Index').AsInteger;
        Instance_Identifier := FieldByName('Instance_Identifier').AsString;
        Instance_Type := FieldByName('Instance_Type').AsInteger;
        Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
        Radar_Index := FieldByName('Radar_Index').AsInteger;
        Rel_Antenna_Height := FieldByName('Rel_Antenna_Height').AsSingle;
        Submerged_Antenna_Height := FieldByName('Submerged_Antenna_Height')
          .AsSingle;
        Max_Operational_Depth := FieldByName('Max_Operational_Depth').AsSingle;
      end;

      with radar.FDef do
      begin
        Radar_Index := FieldByName('Radar_Index').AsInteger;
        Radar_Identifier := FieldByName('Radar_Identifier').AsString;
        Radar_Emitter := FieldByName('Radar_Emitter').AsString;
        Radar_Type := FieldByName('Radar_Type').AsInteger;
        Frequency := FieldByName('Frequency').AsSingle;
        Scan_Rate := FieldByName('Scan_Rate').AsSingle;
        Pulse_Rep_Freq := FieldByName('Pulse_Rep_Freq').AsSingle;
        Pulse_Width := FieldByName('Pulse_Width').AsSingle;
        Radar_Power := FieldByName('Radar_Power').AsSingle;
        Detection_Range := FieldByName('Detection_Range').AsSingle;
        Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
        Max_Unambig_Detect_Range := FieldByName('Max_Unambig_Detect_Range')
          .AsSingle;
        IFF_Capability := FieldByName('IFF_Capability').AsBoolean;
        Altitude_Data_Capability := FieldByName('Altitude_Data_Capability')
          .AsBoolean;
        Ground_Speed_Data_Capability := FieldByName
          ('Ground_Speed_Data_Capability').AsBoolean;
        Heading_Data_Capability := FieldByName('Heading_Data_Capability')
          .AsBoolean;
        Plat_Type_Recog_Capability := FieldByName('Plat_Type_Recog_Capability')
          .AsBoolean;
        Plat_Class_Recog_Capability := FieldByName
          ('Plat_Class_Recog_Capability')
          .AsBoolean;
        Clutter_Rejection := FieldByName('Clutter_Rejection').AsSingle;
        Anti_Jamming_Capable := FieldByName('Anti_Jamming_Capable').AsBoolean;
        Curve_Definition_Index := FieldByName('Curve_Definition_Index')
          .AsInteger;
        Second_Vert_Coverage := FieldByName('Second_Vert_Coverage').AsBoolean;
        Jamming_A_Resistant := FieldByName('Jamming_A_Resistant').AsBoolean;
        Jamming_B_Resistant := FieldByName('Jamming_B_Resistant').AsBoolean;
        Jamming_C_Resistant := FieldByName('Jamming_C_Resistant').AsBoolean;
        Anti_Jamming_A_Resistant := FieldByName('Anti_Jamming_A_Resistant')
          .AsBoolean;
        Anti_Jamming_B_Resistant := FieldByName('Anti_Jamming_B_Resistant')
          .AsBoolean;
        Anti_Jamming_C_Resistant := FieldByName('Anti_Jamming_C_Resistant')
          .AsBoolean;
        Anti_Jamming_Range_Reduction := FieldByName
          ('Anti_Jamming_Range_Reduction').AsSingle;
        Beam_Width := FieldByName('Beam_Width').AsSingle;
        Sector_Scan_Capable := FieldByName('Sector_Scan_Capable').AsBoolean;
        Off_Axis_Jammer_Reduction := FieldByName('Off_Axis_Jammer_Reduction')
          .AsSingle;
        Num_FCR_Channels := FieldByName('Num_FCR_Channels').AsInteger;
        Radar_Spot_Number := FieldByName('Radar_Spot_Number').AsInteger;
        Radar_Horizon_Factor := FieldByName('Radar_Horizon_Factor').AsSingle;
        Main_Lobe_Gain := FieldByName('Main_Lobe_Gain').AsSingle;
        Counter_Detection_Factor := FieldByName('Counter_Detection_Factor')
          .AsSingle;
        ECCM_Type := FieldByName('ECCM_Type').AsInteger;
        MTI_Capable := FieldByName('MTI_Capable').AsBoolean;
        MTI_MinTargetSpeed := FieldByName('MTI_MinTargetSpeed').AsSingle;

      end;

      with radar.FType do
      begin
        Radar_Type_Index := FieldByName('Radar_Type_Index').AsInteger;
        Radar_Type_Name := FieldByName('Radar_Type_Name').AsString;
      end;

      with radar.FECCM_Type do
      begin
        ECCM_Type_Index := FieldByName('ECCM_Type_Index').AsInteger;
        ECCM_Type_Name := FieldByName('ECCM_Type_Name').AsString;
      end;

      with radar.FNote.FData do
      begin
        Note_Index := FieldByName('Note_Index').AsInteger;
        Note_Type := FieldByName('Note_Type').AsInteger;
        Notes := FieldByName('Notes').AsString;
      end;

      with radar.FVehicle.FData do
      begin
        Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
      end;

      aRec.Add(radar);
      ZQ.Next;
    end;

    for k := 0 to aRec.Count - 1 do
    begin
      radar := aRec.Items[k];

      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Radar_Definition a JOIN Radar_Vertical_Coverage b ');
      SQL.Add('ON a.Radar_Index = b.Radar_Index ');
      SQL.Add('WHERE (a.Radar_Index = ' + IntToStr(radar.FData.Radar_Index)
          + ')');
      Open;

      ZQ.First;

      while not ZQ.Eof do
      begin
        pVerticalCoverage := TRadar_Vertical_Coverage.Create;

        with pVerticalCoverage.FData do
        begin
          Coverage_Index := FieldByName('Coverage_Index').AsInteger;
          Radar_Index := FieldByName('Radar_Index').AsInteger;
          Coverage_Diagram := FieldByName('Coverage_Diagram').AsInteger;
          Vert_Coverage_Range := FieldByName('Vert_Coverage_Range').AsSingle;
          Vert_Cover_Min_Elevation := FieldByName('Vert_Cover_Min_Elevation')
            .AsSingle;
          Vert_Cover_Max_Elevation := FieldByName('Vert_Cover_Max_Elevation')
            .AsSingle;
        end;

        radar.FRadar_Vertical.Add(pVerticalCoverage);
        ZQ.Next;
      end;
    end;

    for i := 0 to aRec.Count - 1 do
    begin
      radar := aRec.Items[i];

      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Radar_On_Board a JOIN Scripted_Radar_Event b ');
      SQL.Add('ON a.Radar_Index = b.Radar_Index ');
      SQL.Add('WHERE (a.Radar_Index = ' + IntToStr(radar.FData.Radar_Index)
          + ')');
      Open;

      ZQ.First;

      while not ZQ.Eof do
      begin
        radarScript := TScripted_Radar.Create;

        with radarScript.Event.FData do
        begin
          Scripted_Event_Index := FieldByName('Scripted_Event_Index').AsInteger;
          Radar_Index := FieldByName('Radar_Index').AsInteger;
          Radar_Control := FieldByName('Radar_Control').AsInteger;
        end;

        GetScripted_Behav(radarScript.Event.FData.Scripted_Event_Index,
          radarScript.Behav);

        radar.FScripted_Radar.Add(radarScript);
        ZQ.Next;
      end;
    end;

    for J := 0 to aRec.Count - 1 do
    begin
      radar := aRec.Items[J];

      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Radar_On_Board a JOIN Pattern_Radar_Event b ');
      SQL.Add('ON a.Radar_Index = b.Radar_Index ');
      SQL.Add('WHERE (a.Radar_Index = ' + IntToStr(radar.FData.Radar_Index)
          + ')');
      Open;

      ZQ.First;

      while not ZQ.Eof do
      begin
        radarPattern := TPattern_Radar.Create;

        with radarPattern.Event.FData do
        begin
          Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
            .AsInteger;
          Radar_Index := FieldByName('Radar_Index').AsInteger;
          Radar_Control := FieldByName('Radar_Control').AsInteger;
        end;

        GetScripted_Pattern(radarPattern.Event.FData.Scripted_Pattern_Index,
          radarPattern.pattern);

        radar.FScripted_Pattern.Add(radarPattern);
        ZQ.Next;
      end;
    end;

    for l := 0 to aRec.Count - 1 do
    begin
      radar := aRec.Items[l];

      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Radar_On_Board a JOIN Blind_Zone_Definition b ');
      SQL.Add('ON a.Radar_Instance_Index = b.Radar_Instance_Index ');
      SQL.Add('WHERE (a.Radar_Instance_Index = ' + IntToStr
          (radar.FData.Radar_Instance_Index) + ')');
      Open;

      ZQ.First;

      while not ZQ.Eof do
      begin
        Radar_Blind := TBlind_Zone.Create;

        with Radar_Blind.FData do
        begin
          Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
          Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
          BlindZone_Number := FieldByName('BlindZone_Number').AsInteger;
          Radar_Instance_Index := FieldByName('Radar_Instance_Index').AsInteger;
          Start_Angle := FieldByName('Start_Angle').AsSingle;
          End_Angle := FieldByName('End_Angle').AsSingle;
        end;

        radar.FBlind.Add(Radar_Blind);
        ZQ.Next;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function TdmTTT.updateScriptRadar(rec: TScripted_Radar_Event;
  id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Scripted_Radar_Event ');
      SQL.Add('SET ');
      SQL.Add('Radar_Index  =' + IntToStr(Radar_Index) + ',');
      SQL.Add('Radar_Control=' + IntToStr(Radar_Control));
    end;

    SQL.Add(' WHERE (Scripted_Event_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateRadar_Def(rec: TRadar_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Radar_Definition ');
      SQL.Add('SET ');
      SQL.Add('Radar_Identifier  =''' + Radar_Identifier + ''',');
      SQL.Add('Radar_Emitter = ''' + Radar_Emitter + ''',');
      SQL.Add('Radar_Type =' + IntToStr(Radar_Type) + ',');
      SQL.Add('Frequency =' + FloatToStr(Frequency) + ',');
      SQL.Add('Scan_Rate =' + FloatToStr(Scan_Rate) + ',');
      SQL.Add('Pulse_Rep_Freq =' + FloatToStr(Pulse_Rep_Freq) + ',');
      SQL.Add('Pulse_Width =' + FloatToStr(Pulse_Width) + ',');
      SQL.Add('Radar_Power =' + FloatToStr(Radar_Power) + ',');
      SQL.Add('Detection_Range =' + FloatToStr(Detection_Range) + ',');
      SQL.Add('Known_Cross_Section =' + FloatToStr(Known_Cross_Section) + ',');
      SQL.Add('Max_Unambig_Detect_Range =' + FloatToStr
          (Max_Unambig_Detect_Range) + ',');
      SQL.Add('IFF_Capability =' + BoolToStr(IFF_Capability) + ',');
      SQL.Add('Altitude_Data_Capability =' + BoolToStr
          (Altitude_Data_Capability) + ',');
      SQL.Add('Ground_Speed_Data_Capability =' + BoolToStr
          (Ground_Speed_Data_Capability) + ',');
      SQL.Add('Heading_Data_Capability =' + BoolToStr(Heading_Data_Capability)
          + ',');
      SQL.Add('Plat_Type_Recog_Capability =' + BoolToStr
          (Plat_Type_Recog_Capability) + ',');
      SQL.Add('Plat_Class_Recog_Capability =' + BoolToStr
          (Plat_Class_Recog_Capability) + ',');
      SQL.Add('Clutter_Rejection =' + FloatToStr(Clutter_Rejection) + ',');
      SQL.Add('Anti_Jamming_Capable =' + BoolToStr(Anti_Jamming_Capable) + ',');
      SQL.Add('Curve_Definition_Index =' + IntToStr(Curve_Definition_Index)
          + ',');
      SQL.Add('Second_Vert_Coverage =' + BoolToStr(Second_Vert_Coverage) + ',');
      SQL.Add('Jamming_A_Resistant =' + BoolToStr(Jamming_A_Resistant) + ',');
      SQL.Add('Jamming_B_Resistant =' + BoolToStr(Jamming_B_Resistant) + ',');
      SQL.Add('Jamming_C_Resistant =' + BoolToStr(Jamming_C_Resistant) + ',');
      SQL.Add('Anti_Jamming_A_Resistant =' + BoolToStr
          (Anti_Jamming_A_Resistant) + ',');
      SQL.Add('Anti_Jamming_B_Resistant =' + BoolToStr
          (Anti_Jamming_B_Resistant) + ',');
      SQL.Add('Anti_Jamming_C_Resistant =' + BoolToStr
          (Anti_Jamming_C_Resistant) + ',');
      SQL.Add('Anti_Jamming_Range_Reduction =' + FloatToStr
          (Anti_Jamming_Range_Reduction) + ',');
      SQL.Add('Beam_Width =' + FloatToStr(Beam_Width) + ',');
      SQL.Add('Sector_Scan_Capable =' + BoolToStr(Sector_Scan_Capable) + ',');
      SQL.Add('Off_Axis_Jammer_Reduction =' + FloatToStr
          (Off_Axis_Jammer_Reduction) + ',');
      SQL.Add('Num_FCR_Channels =' + IntToStr(Num_FCR_Channels) + ',');
      SQL.Add('Radar_Spot_Number =' + IntToStr(Radar_Spot_Number) + ',');
      SQL.Add('Radar_Horizon_Factor =' + FloatToStr(Radar_Horizon_Factor)
          + ',');
      SQL.Add('Main_Lobe_Gain =' + FloatToStr(Main_Lobe_Gain) + ',');
      SQL.Add('Counter_Detection_Factor =' + FloatToStr
          (Counter_Detection_Factor) + ',');
      SQL.Add('ECCM_Type =' + IntToStr(ECCM_Type) + ',');
      SQL.Add('MTI_Capable =' + BoolToStr(MTI_Capable) + ',');
      SQL.Add('MTI_MinTargetSpeed =' + FloatToStr(MTI_MinTargetSpeed));
    end;

    SQL.Add(' WHERE (Radar_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.DeleteRadar_Definition(const id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Radar_Definition  ');
    SQL.Add('WHERE (Radar_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateRainfall_On_ESM(rec: TRainfall_On_ESM;
  id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Rainfall_On_ESM  ');
      SQL.Add('SET ');
      SQL.Add('Rain_0_Effect = ' + FloatToStr(Rain_0_Effect) + ',');
      SQL.Add('Rain_1_Effect = ' + FloatToStr(Rain_1_Effect) + ',');
      SQL.Add('Rain_2_Effect = ' + FloatToStr(Rain_2_Effect) + ',');
      SQL.Add('Rain_3_Effect = ' + FloatToStr(Rain_3_Effect) + ',');
      SQL.Add('Rain_4_Effect = ' + FloatToStr(Rain_4_Effect) + ',');
      SQL.Add('Rain_5_Effect = ' + FloatToStr(Rain_5_Effect) + ',');
      SQL.Add('Rain_6_Effect = ' + FloatToStr(Rain_6_Effect) + ',');
    end;
    SQL.Add('WHERE (Radar_Frequency = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateRainfall_On_Radar(rec: TRainfall_On_Radar;
  id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Rainfall_On_Radar  ');
      SQL.Add('SET ');
      SQL.Add('Rain_0_Effect = ' + FloatToStr(Rain_0_Effect) + ',');
      SQL.Add('Rain_1_Effect = ' + FloatToStr(Rain_1_Effect) + ',');
      SQL.Add('Rain_2_Effect = ' + FloatToStr(Rain_2_Effect) + ',');
      SQL.Add('Rain_3_Effect = ' + FloatToStr(Rain_3_Effect) + ',');
      SQL.Add('Rain_4_Effect = ' + FloatToStr(Rain_4_Effect) + ',');
      SQL.Add('Rain_5_Effect = ' + FloatToStr(Rain_5_Effect) + ',');
      SQL.Add('Rain_6_Effect = ' + FloatToStr(Rain_6_Effect) + ',');
    end;
    SQL.Add('WHERE (Radar_Frequency = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetRadar_Definition(var aRec: TList): boolean;
var
  rec: TRadar_On_Board;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Radar_Definition a LEFT JOIN Note_Storage b ');
    SQL.Add('ON a.Radar_Index = b.Radar_Index ORDER BY Radar_Identifier');
    Open;

    result := RecordCount > 0;

    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TRadar_On_Board.Create;

        with rec.FDef do
        begin
          Radar_Index := FieldByName('Radar_Index').AsInteger;
          Radar_Identifier := FieldByName('Radar_Identifier').AsString;
          Radar_Emitter := FieldByName('Radar_Emitter').AsString;
          Radar_Type := FieldByName('Radar_Type').AsInteger;
          Frequency := FieldByName('Frequency').AsSingle;
          Scan_Rate := FieldByName('Scan_Rate').AsSingle;
          Pulse_Rep_Freq := FieldByName('Pulse_Rep_Freq').AsSingle;
          Pulse_Width := FieldByName('Pulse_Width').AsSingle;
          Radar_Power := FieldByName('Radar_Power').AsSingle;
          Detection_Range := FieldByName('Detection_Range').AsSingle;
          Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
          Max_Unambig_Detect_Range := FieldByName('Max_Unambig_Detect_Range')
            .AsSingle;
          IFF_Capability := FieldByName('IFF_Capability').AsBoolean;
          Altitude_Data_Capability := FieldByName('Altitude_Data_Capability')
            .AsBoolean;
          Ground_Speed_Data_Capability := FieldByName
            ('Ground_Speed_Data_Capability').AsBoolean;
          Heading_Data_Capability := FieldByName('Heading_Data_Capability')
            .AsBoolean;
          Plat_Type_Recog_Capability := FieldByName
            ('Plat_Type_Recog_Capability')
            .AsBoolean;
          Plat_Class_Recog_Capability := FieldByName
            ('Plat_Class_Recog_Capability').AsBoolean;
          Clutter_Rejection := FieldByName('Clutter_Rejection').AsSingle;
          Anti_Jamming_Capable := FieldByName('Anti_Jamming_Capable').AsBoolean;
          Curve_Definition_Index := FieldByName('Curve_Definition_Index')
            .AsInteger;
          Second_Vert_Coverage := FieldByName('Second_Vert_Coverage').AsBoolean;
          Jamming_A_Resistant := FieldByName('Jamming_A_Resistant').AsBoolean;
          Jamming_B_Resistant := FieldByName('Jamming_B_Resistant').AsBoolean;
          Jamming_C_Resistant := FieldByName('Jamming_C_Resistant').AsBoolean;
          Anti_Jamming_A_Resistant := FieldByName('Anti_Jamming_A_Resistant')
            .AsBoolean;
          Anti_Jamming_B_Resistant := FieldByName('Anti_Jamming_B_Resistant')
            .AsBoolean;
          Anti_Jamming_C_Resistant := FieldByName('Anti_Jamming_C_Resistant')
            .AsBoolean;
          Anti_Jamming_Range_Reduction := FieldByName
            ('Anti_Jamming_Range_Reduction').AsSingle;
          Beam_Width := FieldByName('Beam_Width').AsSingle;
          Sector_Scan_Capable := FieldByName('Sector_Scan_Capable').AsBoolean;
          Off_Axis_Jammer_Reduction := FieldByName('Off_Axis_Jammer_Reduction')
            .AsSingle;
          Num_FCR_Channels := FieldByName('Num_FCR_Channels').AsInteger;
          Radar_Spot_Number := FieldByName('Radar_Spot_Number').AsInteger;
          Radar_Horizon_Factor := FieldByName('Radar_Horizon_Factor').AsSingle;
          Main_Lobe_Gain := FieldByName('Main_Lobe_Gain').AsSingle;
          Counter_Detection_Factor := FieldByName('Counter_Detection_Factor')
            .AsSingle;
          ECCM_Type := FieldByName('ECCM_Type').AsInteger;
          MTI_Capable := FieldByName('MTI_Capable').AsBoolean;
          MTI_MinTargetSpeed := FieldByName('MTI_MinTargetSpeed').AsSingle;
        end;

        with rec.FNote.FData do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TdmTTT.InsertRadar_On_Board(const id: string;
  var rec: TRadar_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Radar_On_Board  ');
      SQL.Add('VALUES ( ');
      // SQL.Add(IntToStr(Radar_Instance_Index)+',');
      SQL.Add(QuotedStr(Instance_Identifier) + ',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Radar_Index) + ',');
      SQL.Add(FloatToStr(Rel_Antenna_Height) + ',');
      SQL.Add(FloatToStr(Submerged_Antenna_Height) + ',');
      SQL.Add(FloatToStr(Max_Operational_Depth) + ')');
      //ShowMessage(SQL.Text);
    end;
    ExecSQL;

    with rec.FData do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM Radar_On_Board ');
      SQL.Add('WHERE Vehicle_Index = '+ IntToStr(Vehicle_Index) +' ');
      SQL.Add('AND Radar_Index = ' + IntToStr(Radar_Index));
      Open;

      Radar_Instance_Index := FieldByName('Radar_Instance_Index').AsInteger;
    end;

  end;
end;
// -------------------------------------------------------------------

////====================================================
function TdmTTT.UpdateRadar_On_Board(const id: string;
  var rec: TRadar_On_Board): integer;
begin
  result := -1;
  with ZQ do begin
    with rec.FData do begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Radar_On_Board  ');
      SQL.Add('SET ' );
      //SQL.Add('Radar_Instance_Index = '+IntToStr(Radar_Instance_Index)+',');
      SQL.Add('Instance_Identifier = '+ QuotedStr(Instance_Identifier)+',');
      SQL.Add('Instance_Type = '+IntToStr(Instance_Type)+',');
      SQL.Add('Vehicle_Index = '+IntToStr(Vehicle_Index)+',');
      SQL.Add('Radar_Index = '+IntToStr(Radar_Index)+',');
      SQL.Add('Rel_Antenna_Height = '+FloatToStr(Rel_Antenna_Height)+',');
      SQL.Add('Submerged_Antenna_Height = '+FloatToStr(Submerged_Antenna_Height)+',');
      SQL.Add('Max_Operational_Depth = '+FloatToStr(Max_Operational_Depth));
    end;
    SQL.Add('WHERE (Radar_Instance_Index = ' +  id + ')' );
    //ShowMessage(SQL.Text);
    ExecSQL;
  end;
end;
//-------------------------------------------------------------------


/// /====================================================
function TdmTTT.DeleteRadar_On_Board(const id: string;
  var rec: TRadar_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Radar_On_Board  ');
    SQL.Add('WHERE (Radar_Instance_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.insertRadar_Def(rec: TRadar_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Radar_Definition ');
      SQL.Add
        ('(Radar_Identifier,Radar_Emitter,Radar_Type,Frequency,Scan_Rate,');
      SQL.Add(
        'Pulse_Rep_Freq,Pulse_Width,Radar_Power,Detection_Range,Known_Cross_Section,');
      SQL.Add(
        'Max_Unambig_Detect_Range,IFF_Capability,Altitude_Data_Capability,Ground_Speed_Data_Capability,');
      SQL.Add(
        'Heading_Data_Capability,Plat_Type_Recog_Capability,Plat_Class_Recog_Capability,Clutter_Rejection,');
      SQL.Add(
        'Anti_Jamming_Capable,Curve_Definition_Index,Second_Vert_Coverage,Jamming_A_Resistant,');
      SQL.Add(
        'Jamming_B_Resistant,Jamming_C_Resistant,Anti_Jamming_A_Resistant,Anti_Jamming_B_Resistant,');
      SQL.Add(
        'Anti_Jamming_C_Resistant,Anti_Jamming_Range_Reduction,Beam_Width,Sector_Scan_Capable,');
      SQL.Add(
        'Off_Axis_Jammer_Reduction,Num_FCR_Channels,Radar_Spot_Number,Radar_Horizon_Factor,');
      SQL.Add(
        'Main_Lobe_Gain,Counter_Detection_Factor,ECCM_Type,MTI_Capable,MTI_MinTargetSpeed)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Radar_Identifier + ''',');
      SQL.Add('''' + Radar_Emitter + ''',');
      SQL.Add(IntToStr(Radar_Type) + ',');
      SQL.Add(FloatToStr(Frequency) + ',');
      SQL.Add(FloatToStr(Scan_Rate) + ',');
      SQL.Add(FloatToStr(Pulse_Rep_Freq) + ',');
      SQL.Add(FloatToStr(Pulse_Width) + ',');
      SQL.Add(FloatToStr(Radar_Power) + ',');
      SQL.Add(FloatToStr(Detection_Range) + ',');
      SQL.Add(FloatToStr(Known_Cross_Section) + ',');
      SQL.Add(FloatToStr(Max_Unambig_Detect_Range) + ',');
      SQL.Add(BoolToStr(IFF_Capability) + ',');
      SQL.Add(BoolToStr(Altitude_Data_Capability) + ',');
      SQL.Add(BoolToStr(Ground_Speed_Data_Capability) + ',');
      SQL.Add(BoolToStr(Heading_Data_Capability) + ',');
      SQL.Add(BoolToStr(Plat_Type_Recog_Capability) + ',');
      SQL.Add(BoolToStr(Plat_Class_Recog_Capability) + ',');
      SQL.Add(FloatToStr(Clutter_Rejection) + ',');
      SQL.Add(BoolToStr(Anti_Jamming_Capable) + ',');
      SQL.Add(IntToStr(Curve_Definition_Index) + ',');
      SQL.Add(BoolToStr(Second_Vert_Coverage) + ',');
      SQL.Add(BoolToStr(Jamming_A_Resistant) + ',');
      SQL.Add(BoolToStr(Jamming_B_Resistant) + ',');
      SQL.Add(BoolToStr(Jamming_C_Resistant) + ',');
      SQL.Add(BoolToStr(Anti_Jamming_A_Resistant) + ',');
      SQL.Add(BoolToStr(Anti_Jamming_B_Resistant) + ',');
      SQL.Add(BoolToStr(Anti_Jamming_C_Resistant) + ',');
      SQL.Add(FloatToStr(Anti_Jamming_Range_Reduction) + ',');
      SQL.Add(FloatToStr(Beam_Width) + ',');
      SQL.Add(BoolToStr(Sector_Scan_Capable) + ',');
      SQL.Add(FloatToStr(Off_Axis_Jammer_Reduction) + ',');
      SQL.Add(IntToStr(Num_FCR_Channels) + ',');
      SQL.Add(IntToStr(Radar_Spot_Number) + ',');
      SQL.Add(FloatToStr(Radar_Horizon_Factor) + ',');
      SQL.Add(FloatToStr(Main_Lobe_Gain) + ',');
      SQL.Add(FloatToStr(Counter_Detection_Factor) + ',');
      SQL.Add(IntToStr(ECCM_Type) + ',');
      SQL.Add(BoolToStr(MTI_Capable) + ',');
      SQL.Add(FloatToStr(MTI_MinTargetSpeed) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Radar_Index FROM Radar_Definition ');
      SQL.Add('WHERE Radar_Identifier =' + quotedStr(Radar_Identifier));
      Open;
      with rec.FDef do
      begin
        Radar_Index := FieldByName('Radar_Index').AsInteger;
      end;

    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertRainfall_On_ESM(rec: TRainfall_On_ESM): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Rainfall_On_ESM] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Rainfall_On_ESM');
      SQL.Add('(Radar_Frequency,Rain_0_Effect,Rain_1_Effect,Rain_2_Effect');
      SQL.Add('Rain_3_Effect,Rain_4_Effect,Rain_5_Effect,Rain_6_Effect)');
      SQL.Add(' VALUES (');
      SQL.Add(FloatToStr(Radar_Frequency) + ',');
      SQL.Add(FloatToStr(Rain_0_Effect) + ',');
      SQL.Add(FloatToStr(Rain_1_Effect) + ',');
      SQL.Add(FloatToStr(Rain_2_Effect) + ',');
      SQL.Add(FloatToStr(Rain_3_Effect) + ',');
      SQL.Add(FloatToStr(Rain_4_Effect) + ',');
      SQL.Add(FloatToStr(Rain_5_Effect) + ',');
      SQL.Add(FloatToStr(Rain_6_Effect) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertRainfall_On_Radar(rec: TRainfall_On_Radar): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Rainfall_On_Radar] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Rainfall_On_Radar ');
      SQL.Add('(Radar_Frequency,Rain_0_Effect,Rain_1_Effect,Rain_2_Effect');
      SQL.Add('Rain_3_Effect,Rain_4_Effect,Rain_5_Effect,Rain_6_Effect)');
      SQL.Add(' VALUES (');
      SQL.Add(FloatToStr(Radar_Frequency) + ',');
      SQL.Add(FloatToStr(Rain_0_Effect) + ',');
      SQL.Add(FloatToStr(Rain_1_Effect) + ',');
      SQL.Add(FloatToStr(Rain_2_Effect) + ',');
      SQL.Add(FloatToStr(Rain_3_Effect) + ',');
      SQL.Add(FloatToStr(Rain_4_Effect) + ',');
      SQL.Add(FloatToStr(Rain_5_Effect) + ',');
      SQL.Add(FloatToStr(Rain_6_Effect) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateRadar_Interval_Def(rec: TRadar_On_Board;
  id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FInterval do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Radar_Interval_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Priority = ' + IntToStr(Priority) + ',');
      SQL.Add('Radar_State = ' + IntToStr(Radar_State) + ',');
      SQL.Add('Num_Scans = ' + IntToStr(Num_Scans) + ',');
      SQL.Add('Radar_Off_Time = ' + IntToStr(Radar_Off_Time));
    end;
    SQL.Add('WHERE (Interval_List_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertRadar_Interval_Def(rec: TRadar_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FInterval do
    begin
      Close;
      SQL.Clear;
      SQL.Add(
        'SET IDENTITY_INSERT Runtime_DB.[dbo].[Radar_Interval_Definition] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Radar_Interval_Definition ');
      SQL.Add(
        '(Interval_List_Index,Priority,Radar_State,Num_Scans,Radar_Off_Time)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Interval_List_Index) + ',');
      SQL.Add(IntToStr(Priority) + ',');
      SQL.Add(IntToStr(Radar_State) + ',');
      SQL.Add(IntToStr(Num_Scans) + ',');
      SQL.Add(IntToStr(Radar_Off_Time) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllSonar_On_Board(const id, index: Integer;
  var aRec: TList): Integer;
var
  i, J, k: Integer;
  rec: TSonar_On_Board;
  sonarScript: TScripted_Sonar;
  sonarPattern: TPattern_Sonar;
  Sonar_Blind: TBlind_Zone;
  //POD_SNR  : TPOD_vs_SNR_Curve_Definition;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM Sonar_On_Board a JOIN Sonar_Definition b ';
    ssql := ssql +
      'ON a.Sonar_Index = b.Sonar_Index INNER JOIN Sonar_Category c ';
    ssql := ssql +
      'ON b.Sonar_Category_Index = c.Sonar_Category_Index LEFT JOIN Note_Storage d ';
    ssql := ssql +
      'ON d.Sonar_Index = b.Sonar_Index LEFT JOIN Vehicle_Definition e ';
    ssql := ssql + 'ON a.Vehicle_Index = e.Vehicle_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // jika id tidak sama dg 0
      if id <> 0 then
      begin
        ssql := ssql + ' WHERE (a.Vehicle_Index = ' + IntToStr(id) + ')';
      end
      else
        ssql := ssql + ' ORDER BY a.Sonar_Index ASC';
    end
    else
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 AND a.Sonar_Index =' + IntToStr
        (index);

    SQL.Add(ssql);
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TSonar_On_Board.Create;

        GetShipNoiseOnSonar(rec.FShipNoiseData);
        GetSeaStateOnSonar(rec.FSeaStateNoiseData);
        GetRainfallOnSonar(rec.FRainRateNoiseData);

        with rec.FData do
        begin
          Sonar_Instance_Index := FieldByName('Sonar_Instance_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Sonar_Index := FieldByName('Sonar_Index').AsInteger;
          Minimum_Depth := FieldByName('Minimum_Depth').AsSingle;
          Time_2_Deploy := FieldByName('Time_2_Deploy').AsInteger;
          Time_2_Stow := FieldByName('Time_2_Stow').AsInteger;
        end;

        with rec.FDef do
        begin
          Sonar_Index := FieldByName('Sonar_Index').AsInteger;
          Sonar_Identifier := FieldByName('Sonar_Identifier').AsString;
          Sonar_Category_Index := FieldByName('Sonar_Category_Index').AsInteger;
          Sonar_Classification := FieldByName('Sonar_Classification').AsInteger;
          Passive_Int_Period := FieldByName('Passive_Int_Period').AsInteger;
          Active_Int_Period := FieldByName('Active_Int_Period').AsInteger;
          TIOW_Short_Range := FieldByName('TIOW_Short_Range').AsSingle;
          TIOW_Medium_Range := FieldByName('TIOW_Medium_Range').AsSingle;
          TIOW_Long_Range := FieldByName('TIOW_Long_Range').AsSingle;
          Passive_Detect_Range := FieldByName('Passive_Detect_Range').AsSingle;
          Active_Detect_Range := FieldByName('Active_Detect_Range').AsSingle;
          Max_Detect_Range := FieldByName('Max_Detect_Range').AsSingle;
          Known_Signal_Source := FieldByName('Known_Signal_Source').AsSingle;
          Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
          Sonar_Directivity_Index := FieldByName('Sonar_Directivity_Index')
            .AsSingle;
          Active_Operating_Power := FieldByName('Active_Operating_Power')
            .AsSingle;
          Active_Freq_of_Op := FieldByName('Active_Freq_of_Op').AsSingle;
          Passive_Freq_of_Op := FieldByName('Passive_Freq_of_Op').AsSingle;
          Max_Operating_Depth := FieldByName('Max_Operating_Depth').AsSingle;
          Sonar_Depth_Rate_of_Change := FieldByName
            ('Sonar_Depth_Rate_of_Change').AsSingle;
          Depth_per_Speed := FieldByName('Depth_per_Speed').AsSingle;
          Kinking_Processing := FieldByName('Kinking_Processing').AsBoolean;
          Turn_Rate_2_Kink := FieldByName('Turn_Rate_2_Kink').AsSingle;
          Time_2_Settle_Kinked := FieldByName('Time_2_Settle_Kinked').AsInteger;
          Bearing_Processing := FieldByName('Bearing_Processing').AsBoolean;
          Time_2_Resolve_Bearing := FieldByName('Time_2_Resolve_Bearing')
            .AsInteger;
          Passive_Processing := FieldByName('Passive_Processing').AsBoolean;
          Target_Identification := FieldByName('Target_Identification')
            .AsBoolean;
          Time_2_Identify := FieldByName('Time_2_Identify').AsInteger;
          Curve_Detection_Index := FieldByName('Curve_Detection_Index')
            .AsInteger;
          Track_Analysis := FieldByName('Track_Analysis').AsInteger;
          Time_2_Provide_Track := FieldByName('Time_2_Provide_Track').AsInteger;
          Ownship_Increase_due_to_Active := FieldByName
            ('Ownship_Increase_due_to_Active').AsSingle;
          Tow_Speed := FieldByName('Tow_Speed').AsSingle;
          Minimum_Depth := FieldByName('Minimum_Depth').AsSingle;
          Maximum_Tow_Speed := FieldByName('Maximum_Tow_Speed').AsSingle;
          Maximum_Sonar_Speed := FieldByName('Maximum_Sonar_Speed').AsSingle;
          Depth_Finding_Capable := FieldByName('Depth_Finding_Capable')
            .AsBoolean;
          Tracking_Capable := FieldByName('Tracking_Capable').AsBoolean;
          Surface_Detection_Capable := FieldByName('Surface_Detection_Capable')
            .AsBoolean;
          SubSurface_Detection_Capable := FieldByName
            ('SubSurface_Detection_Capable').AsBoolean;
          Torpedo_Detection_Capable := FieldByName('Torpedo_Detection_Capable')
            .AsBoolean;
          Mine_Detection_Capable := FieldByName('Mine_Detection_Capable')
            .AsBoolean;
          Cable_Length := FieldByName('Cable_Length').AsSingle;
          Maximum_Reported_Bearing_Error := FieldByName
            ('Maximum_Reported_Bearing_Error').AsSingle;
          Average_Beam_Width := FieldByName('Average_Beam_Width').AsSingle;
          Counter_Detection_Factor := FieldByName('Counter_Detection_Factor')
            .AsSingle;
        end;

        with rec.FCategory do
        begin
          Sonar_Category_Index := FieldByName('Sonar_Category_Index').AsInteger;
          Sonar_Category_Name := FieldByName('Sonar_Category_Name').AsString;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        with rec.FVehicle.FData do
        begin
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
        end;

        GetPOD_vs_SNR_Curve_Point(rec.FDef.Curve_Detection_Index,rec.FPOD);

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Sonar_On_Board a JOIN Scripted_Sonar_Event b ');
        SQL.Add('ON a.Sonar_Index = b.Sonar_Index ');
        SQL.Add(' WHERE (a.Sonar_Index = ' + IntToStr(rec.FData.Sonar_Index)
            + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          sonarScript := TScripted_Sonar.Create;

          with sonarScript.Event.FData do
          begin
            Scripted_Event_Index := FieldByName('Scripted_Event_Index')
              .AsInteger;
            Sonar_Index := FieldByName('Sonar_Index').AsInteger;
            Sonar_Control := FieldByName('Sonar_Control').AsInteger;
          end;

          GetScripted_Behav(sonarScript.Event.FData.Scripted_Event_Index,
            sonarScript.Behav);

          rec.FScripted_sonar.Add(sonarScript);
          ZQ.Next;
        end;
      end;

      for J := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[J];

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Sonar_On_Board a JOIN Pattern_Sonar_Event b ');
        SQL.Add('ON a.Sonar_Index = b.Sonar_Index ');
        SQL.Add('WHERE (a.Sonar_Index = ' + IntToStr(rec.FData.Sonar_Index)
            + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          sonarPattern := TPattern_Sonar.Create;

          with sonarPattern.Event.FData do
          begin
            Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
              .AsInteger;
            Sonar_Index := FieldByName('Sonar_Index').AsInteger;
            Sonar_Control := FieldByName('Sonar_Control').AsInteger;
          end;

          GetScripted_Pattern(sonarPattern.Event.FData.Scripted_Pattern_Index,
            sonarPattern.pattern);

          rec.FPattern_Sonar.Add(sonarPattern);
          ZQ.Next;
        end;
      end;

      for k := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[k];

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Sonar_On_Board a JOIN Blind_Zone_Definition b ');
        SQL.Add('ON a.Sonar_Instance_Index = b.Sonar_Instance_Index ');
        SQL.Add('WHERE (a.Sonar_Instance_Index = ' + IntToStr
            (rec.FData.Sonar_Instance_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          Sonar_Blind := TBlind_Zone.Create;

          with Sonar_Blind.FData do
          begin
            Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
            Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
            BlindZone_Number := FieldByName('BlindZone_Number').AsInteger;
            Sonar_Instance_Index := FieldByName('Sonar_Instance_Index')
              .AsInteger;
            Start_Angle := FieldByName('Start_Angle').AsSingle;
            End_Angle := FieldByName('End_Angle').AsSingle;
          end;

          rec.FBlind.Add(Sonar_Blind);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateSonar(rec: TSonar_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Sonar_On_Board ');
      SQL.Add('SET ');
      SQL.Add('Sonar_Instance_Index  =' + IntToStr(Sonar_Instance_Index) + ',');
      SQL.Add('Instance_Identifier=''' + Instance_Identifier + ''',');
      SQL.Add('Instance_Type  =' + IntToStr(Instance_Type) + ',');
      SQL.Add('Sonar_Index =' + IntToStr(Sonar_Index) + ',');
      SQL.Add('Minimum_Depth =' + FloatToStr(Minimum_Depth) + ',');
      SQL.Add('Time_2_Deploy  =' + IntToStr(Time_2_Deploy) + ',');
      SQL.Add('Time_2_Stow =' + IntToStr(Time_2_Stow));
    end;

    SQL.Add(' WHERE (Vehicle_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertSonar(rec: TSonar_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Sonar_On_Board ');
      SQL.Add(
        '(Instance_Identifier,Instance_Type,Vehicle_Index,Sonar_Index,Minimum_Depth,Time_2_Deploy,Time_2_Stow)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Instance_Identifier + ''',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Sonar_Index) + ',');
      SQL.Add(FloatToStr(Minimum_Depth) + ',');
      SQL.Add(IntToStr(Time_2_Deploy) + ',');
      SQL.Add(IntToStr(Time_2_Stow) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT * FROM Sonar_On_Board ');
      SQL.Add('WHERE Vehicle_Index = ' + IntToStr(Vehicle_Index) + ' ');
      SQL.Add('AND Sonar_Index = ' + IntToStr(Sonar_Index));
      Open;

      Sonar_Instance_Index := FieldByName('Sonar_Instance_Index').AsInteger;
    end;
  end;
end;

// ------------------------------------------------------------------------------

////====================================================
function TdmTTT.UpdateSonar_On_Board(const id: string;
  var rec: TSonar_On_Board): integer;
begin
  result := -1;
  with ZQ do begin
    with rec.FData do begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Sonar_On_Board  ');
      SQL.Add('SET ' );
      SQL.Add('Sonar_Instance_Index = '+IntToStr(Sonar_Instance_Index)+',');
      SQL.Add('Instance_Identifier = '+ (Instance_Identifier)+',');
      SQL.Add('Instance_Type = '+IntToStr(Instance_Type)+',');
      SQL.Add('Vehicle_Index = '+IntToStr(Vehicle_Index)+',');
      SQL.Add('Sonar_Index = '+IntToStr(Sonar_Index)+',');
      SQL.Add('Minimum_Depth = '+FloatToStr(Minimum_Depth)+',');
      SQL.Add('Time_2_Deploy = '+IntToStr(Time_2_Deploy)+',');
      SQL.Add('Time_2_Stow = '+IntToStr(Time_2_Stow)+',');
    end;
    SQL.Add('WHERE (Sonar_Instance_Index = ' +  id + ')' );
    ExecSQL;
  end;
end;
//-------------------------------------------------------------------


/// /====================================================
function TdmTTT.DeleteSonar_On_Board(const id: string;
  var rec: TSonar_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Sonar_On_Board  ');
    SQL.Add('WHERE (Sonar_Instance_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.getSonar_Def(const id: Integer; var aRec: TList;
  var rec: TSonar_On_Board): boolean;
var
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM Sonar_Definition a ';
    if id <> 0 then
      ssql := ssql + 'WHERE a.Sonar_Index = ' + IntToStr(id);
    ssql := ssql + 'ORDER BY Sonar_Identifier ';
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;

    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TSonar_On_Board.Create;

        with rec.FDef do
        begin
          Sonar_Index := FieldByName('Sonar_Index').AsInteger;
          Sonar_Identifier := FieldByName('Sonar_Identifier').AsString;
          Sonar_Category_Index := FieldByName('Sonar_Category_Index').AsInteger;
          Sonar_Classification := FieldByName('Sonar_Classification').AsInteger;
          Passive_Int_Period := FieldByName('Passive_Int_Period').AsInteger;
          Active_Int_Period := FieldByName('Active_Int_Period').AsInteger;
          TIOW_Short_Range := FieldByName('TIOW_Short_Range').AsSingle;
          TIOW_Medium_Range := FieldByName('TIOW_Medium_Range').AsSingle;
          TIOW_Long_Range := FieldByName('TIOW_Long_Range').AsSingle;
          Passive_Detect_Range := FieldByName('Passive_Detect_Range').AsSingle;
          Active_Detect_Range := FieldByName('Active_Detect_Range').AsSingle;
          Max_Detect_Range := FieldByName('Max_Detect_Range').AsSingle;
          Known_Signal_Source := FieldByName('Known_Signal_Source').AsSingle;
          Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
          Sonar_Directivity_Index := FieldByName('Sonar_Directivity_Index')
            .AsSingle;
          Active_Operating_Power := FieldByName('Active_Operating_Power')
            .AsSingle;
          Active_Freq_of_Op := FieldByName('Active_Freq_of_Op').AsSingle;
          Passive_Freq_of_Op := FieldByName('Passive_Freq_of_Op').AsSingle;
          Max_Operating_Depth := FieldByName('Max_Operating_Depth').AsSingle;
          Sonar_Depth_Rate_of_Change := FieldByName
            ('Sonar_Depth_Rate_of_Change').AsSingle;
          Depth_per_Speed := FieldByName('Depth_per_Speed').AsSingle;
          Kinking_Processing := FieldByName('Kinking_Processing').AsBoolean;
          Turn_Rate_2_Kink := FieldByName('Turn_Rate_2_Kink').AsSingle;
          Time_2_Settle_Kinked := FieldByName('Time_2_Settle_Kinked').AsInteger;
          Bearing_Processing := FieldByName('Bearing_Processing').AsBoolean;
          Time_2_Resolve_Bearing := FieldByName('Time_2_Resolve_Bearing')
            .AsInteger;
          Passive_Processing := FieldByName('Passive_Processing').AsBoolean;
          Target_Identification := FieldByName('Target_Identification')
            .AsBoolean;
          Time_2_Identify := FieldByName('Time_2_Identify').AsInteger;
          Curve_Detection_Index := FieldByName('Curve_Detection_Index')
            .AsInteger;
          Track_Analysis := FieldByName('Track_Analysis').AsInteger;
          Time_2_Provide_Track := FieldByName('Time_2_Provide_Track').AsInteger;
          Ownship_Increase_due_to_Active := FieldByName
            ('Ownship_Increase_due_to_Active').AsSingle;
          Tow_Speed := FieldByName('Tow_Speed').AsSingle;
          Minimum_Depth := FieldByName('Minimum_Depth').AsSingle;
          Maximum_Tow_Speed := FieldByName('Maximum_Tow_Speed').AsSingle;
          Maximum_Sonar_Speed := FieldByName('Maximum_Sonar_Speed').AsSingle;
          Depth_Finding_Capable := FieldByName('Depth_Finding_Capable')
            .AsBoolean;
          Tracking_Capable := FieldByName('Tracking_Capable').AsBoolean;
          Surface_Detection_Capable := FieldByName('Surface_Detection_Capable')
            .AsBoolean;
          SubSurface_Detection_Capable := FieldByName
            ('SubSurface_Detection_Capable').AsBoolean;
          Torpedo_Detection_Capable := FieldByName('Torpedo_Detection_Capable')
            .AsBoolean;
          Mine_Detection_Capable := FieldByName('Mine_Detection_Capable')
            .AsBoolean;
          Cable_Length := FieldByName('Cable_Length').AsSingle;
          Maximum_Reported_Bearing_Error := FieldByName
            ('Maximum_Reported_Bearing_Error').AsSingle;
          Average_Beam_Width := FieldByName('Average_Beam_Width').AsSingle;
          Counter_Detection_Factor := FieldByName('Counter_Detection_Factor')
            .AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateSonar_Def(rec: TSonar_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Sonar_Definition ');
      SQL.Add('SET ');
      SQL.Add('Sonar_Identifier =''' + Sonar_Identifier + ''',');
      SQL.Add('Sonar_Category_Index  =' + IntToStr(Sonar_Category_Index) + ',');
      SQL.Add('Sonar_Classification =' + IntToStr(Sonar_Classification) + ',');
      SQL.Add('Passive_Int_Period =' + IntToStr(Passive_Int_Period) + ',');
      SQL.Add('Active_Int_Period  =' + IntToStr(Active_Int_Period) + ',');
      SQL.Add('TIOW_Short_Range =' + FloatToStr(TIOW_Short_Range) + ',');
      SQL.Add('TIOW_Medium_Range  =' + FloatToStr(TIOW_Medium_Range) + ',');
      SQL.Add('TIOW_Long_Range =' + FloatToStr(TIOW_Long_Range) + ',');
      SQL.Add('Passive_Detect_Range =' + FloatToStr(Passive_Detect_Range)
          + ',');
      SQL.Add('Active_Detect_Range  =' + FloatToStr(Active_Detect_Range) + ',');
      SQL.Add('Max_Detect_Range =' + FloatToStr(Max_Detect_Range) + ',');
      SQL.Add('Known_Signal_Source =' + FloatToStr(Known_Signal_Source) + ',');
      SQL.Add('Known_Cross_Section  =' + FloatToStr(Known_Cross_Section) + ',');
      SQL.Add('Sonar_Directivity_Index =' + FloatToStr(Sonar_Directivity_Index)
          + ',');
      SQL.Add('Active_Operating_Power =' + FloatToStr(Active_Operating_Power)
          + ',');
      SQL.Add('Active_Freq_of_Op  =' + FloatToStr(Active_Freq_of_Op) + ',');
      SQL.Add('Passive_Freq_of_Op =' + FloatToStr(Passive_Freq_of_Op) + ',');
      SQL.Add('Max_Operating_Depth =' + FloatToStr(Max_Operating_Depth) + ',');
      SQL.Add('Sonar_Depth_Rate_of_Change  =' + FloatToStr
          (Sonar_Depth_Rate_of_Change) + ',');
      SQL.Add('Depth_per_Speed =' + FloatToStr(Depth_per_Speed) + ',');
      SQL.Add('Kinking_Processing =' + BoolToStr(Kinking_Processing) + ',');
      SQL.Add('Turn_Rate_2_Kink  =' + FloatToStr(Turn_Rate_2_Kink) + ',');
      SQL.Add('Time_2_Settle_Kinked =' + IntToStr(Time_2_Settle_Kinked) + ',');
      SQL.Add('Bearing_Processing =' + BoolToStr(Bearing_Processing) + ',');
      SQL.Add('Time_2_Resolve_Bearing  =' + IntToStr(Time_2_Resolve_Bearing)
          + ',');
      SQL.Add('Passive_Processing =' + BoolToStr(Passive_Processing) + ',');
      SQL.Add('Target_Identification =' + BoolToStr(Target_Identification)
          + ',');
      SQL.Add('Time_2_Identify  =' + IntToStr(Time_2_Identify) + ',');
      SQL.Add('Curve_Detection_Index =' + IntToStr(Curve_Detection_Index)
          + ',');
      SQL.Add('Track_Analysis =' + IntToStr(Track_Analysis) + ',');
      SQL.Add('Time_2_Provide_Track  =' + IntToStr(Time_2_Provide_Track) + ',');
      SQL.Add('Ownship_Increase_due_to_Active =' + FloatToStr
          (Ownship_Increase_due_to_Active) + ',');
      SQL.Add('Tow_Speed =' + FloatToStr(Tow_Speed) + ',');
      SQL.Add('Minimum_Depth  =' + FloatToStr(Minimum_Depth) + ',');
      SQL.Add('Maximum_Tow_Speed =' + FloatToStr(Maximum_Tow_Speed) + ',');
      SQL.Add('Maximum_Sonar_Speed =' + FloatToStr(Maximum_Sonar_Speed) + ',');
      SQL.Add('Depth_Finding_Capable =' + BoolToStr(Depth_Finding_Capable)
          + ',');
      SQL.Add('Tracking_Capable  =' + BoolToStr(Tracking_Capable) + ',');
      SQL.Add('Surface_Detection_Capable =' + BoolToStr
          (Surface_Detection_Capable) + ',');
      SQL.Add('SubSurface_Detection_Capable =' + BoolToStr
          (SubSurface_Detection_Capable) + ',');
      SQL.Add('Torpedo_Detection_Capable  =' + BoolToStr
          (Torpedo_Detection_Capable) + ',');
      SQL.Add('Mine_Detection_Capable =' + BoolToStr(Mine_Detection_Capable)
          + ',');
      SQL.Add('Cable_Length =' + FloatToStr(Cable_Length) + ',');
      SQL.Add('Maximum_Reported_Bearing_Error  =' + FloatToStr
          (Maximum_Reported_Bearing_Error) + ',');
      SQL.Add('Average_Beam_Width =' + FloatToStr(Average_Beam_Width) + ',');
      SQL.Add('Counter_Detection_Factor =' + FloatToStr
          (Counter_Detection_Factor));

    end;
    SQL.Add(' WHERE (Sonar_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertSonar_Def(rec: TSonar_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Sonar_Definition ');
      SQL.Add(
        '(Sonar_Identifier,Sonar_Category_Index,Sonar_Classification,Passive_Int_Period,');
      SQL.Add(
        'Active_Int_Period,TIOW_Short_Range,TIOW_Medium_Range,TIOW_Long_Range,Passive_Detect_Range,');
      SQL.Add(
        'Active_Detect_Range,Max_Detect_Range,Known_Signal_Source,Known_Cross_Section,');
      SQL.Add(
        'Sonar_Directivity_Index,Active_Operating_Power,Active_Freq_of_Op,Passive_Freq_of_Op,');
      SQL.Add(
        'Max_Operating_Depth,Sonar_Depth_Rate_of_Change,Depth_per_Speed,Kinking_Processing,');
      SQL.Add(
        'Turn_Rate_2_Kink,Time_2_Settle_Kinked,Bearing_Processing,Time_2_Resolve_Bearing,');
      SQL.Add(
        'Passive_Processing,Target_Identification,Time_2_Identify,Curve_Detection_Index,');
      SQL.Add(
        'Track_Analysis,Time_2_Provide_Track,Ownship_Increase_due_to_Active,Tow_Speed,');
      SQL.Add(
        'Minimum_Depth,Maximum_Tow_Speed,Maximum_Sonar_Speed,Depth_Finding_Capable,Tracking_Capable,');
      SQL.Add(
        'Surface_Detection_Capable,SubSurface_Detection_Capable,Torpedo_Detection_Capable,');
      SQL.Add(
        'Mine_Detection_Capable,Cable_Length,Maximum_Reported_Bearing_Error,Average_Beam_Width,Counter_Detection_Factor)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Sonar_Identifier + ''',');
      SQL.Add(IntToStr(Sonar_Category_Index) + ',');
      SQL.Add(IntToStr(Sonar_Classification) + ',');
      SQL.Add(IntToStr(Passive_Int_Period) + ',');
      SQL.Add(IntToStr(Active_Int_Period) + ',');
      SQL.Add(FloatToStr(TIOW_Short_Range) + ',');
      SQL.Add(FloatToStr(TIOW_Medium_Range) + ',');
      SQL.Add(FloatToStr(TIOW_Long_Range) + ',');
      SQL.Add(FloatToStr(Passive_Detect_Range) + ',');
      SQL.Add(FloatToStr(Active_Detect_Range) + ',');
      SQL.Add(FloatToStr(Max_Detect_Range) + ',');
      SQL.Add(FloatToStr(Known_Signal_Source) + ',');
      SQL.Add(FloatToStr(Known_Cross_Section) + ',');
      SQL.Add(FloatToStr(Sonar_Directivity_Index) + ',');
      SQL.Add(FloatToStr(Active_Operating_Power) + ',');
      SQL.Add(FloatToStr(Active_Freq_of_Op) + ',');
      SQL.Add(FloatToStr(Passive_Freq_of_Op) + ',');
      SQL.Add(FloatToStr(Max_Operating_Depth) + ',');
      SQL.Add(FloatToStr(Sonar_Depth_Rate_of_Change) + ',');
      SQL.Add(FloatToStr(Depth_per_Speed) + ',');
      SQL.Add(BoolToStr(Kinking_Processing) + ',');
      SQL.Add(FloatToStr(Turn_Rate_2_Kink) + ',');
      SQL.Add(IntToStr(Time_2_Settle_Kinked) + ',');
      SQL.Add(BoolToStr(Bearing_Processing) + ',');
      SQL.Add(IntToStr(Time_2_Resolve_Bearing) + ',');
      SQL.Add(BoolToStr(Passive_Processing) + ',');
      SQL.Add(BoolToStr(Target_Identification) + ',');
      SQL.Add(IntToStr(Time_2_Identify) + ',');
      SQL.Add(IntToStr(Curve_Detection_Index) + ',');
      SQL.Add(IntToStr(Track_Analysis) + ',');
      SQL.Add(IntToStr(Time_2_Provide_Track) + ',');
      SQL.Add(FloatToStr(Ownship_Increase_due_to_Active) + ',');
      SQL.Add(FloatToStr(Tow_Speed) + ',');
      SQL.Add(FloatToStr(Minimum_Depth) + ',');
      SQL.Add(FloatToStr(Maximum_Tow_Speed) + ',');
      SQL.Add(FloatToStr(Maximum_Sonar_Speed) + ',');
      SQL.Add(BoolToStr(Depth_Finding_Capable) + ',');
      SQL.Add(BoolToStr(Tracking_Capable) + ',');
      SQL.Add(BoolToStr(Surface_Detection_Capable) + ',');
      SQL.Add(BoolToStr(SubSurface_Detection_Capable) + ',');
      SQL.Add(BoolToStr(Torpedo_Detection_Capable) + ',');
      SQL.Add(BoolToStr(Mine_Detection_Capable) + ',');
      SQL.Add(FloatToStr(Cable_Length) + ',');
      SQL.Add(FloatToStr(Maximum_Reported_Bearing_Error) + ',');
      SQL.Add(FloatToStr(Average_Beam_Width) + ',');
      SQL.Add(FloatToStr(Counter_Detection_Factor) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Sonar_Index FROM Sonar_Definition ');
      SQL.Add('WHERE Sonar_Identifier =' + quotedStr(Sonar_Identifier));
      Open;
      with rec.FDef do
      begin
        Sonar_Index := FieldByName('Sonar_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteSonar_Def(id: Integer): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Sonar_Definition ');
    SQL.Add('WHERE Sonar_Index =' + IntToStr(id));
    ExecSQL;
  end;

end;

// ------------------------------------------------------------------------------

function TdmTTT.updateScriptSonar(rec: TScripted_Sonar_Event;
  id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Scripted_Sonar_Event ');
      SQL.Add('SET ');
      SQL.Add('Sonar_Index =' + IntToStr(Sonar_Index) + ',');
      SQL.Add('Sonar_Control=' + IntToStr(Sonar_Control));
    end;

    SQL.Add(' WHERE (Scripted_Event_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllSonarCategory(var cList: TList): Integer;
var
  cat: array of string;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Sonar_Category ');
    SQL.Add('ORDER BY Sonar_Category_Name');
    Open;

    if not IsEmpty then
    begin
      First;

      if not Assigned(cList) then
        cList := TList.Create
      else
        cList.Clear;

      while not ZQ.Eof do
      begin
        cat[0] := FieldByName('Sonar_Category_Index').AsString;
        cat[1] := FieldByName('Sonar_Category_Name').AsString;

        cList.Add(cat);
        ZQ.Next;
      end;
    end;
  end;
end;

// ==Vehicle detail 2. Weapon ===================================================
// ------------------------------------------------------------------------------
function TdmTTT.getAllMissile_OnBoard(const id, index: Integer;
  var aRec: TList): Integer;
var
  i, J, k: Integer;
  rec: TMissile_On_Board;
  weaponScript: TScripted_Weapon;
  weaponPattern: TPattern_Weapon;
  missile_Blind: TBlind_Zone;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql +
      'FROM  Fitted_Weapon_On_Board a INNER JOIN Missile_Definition b ';
    ssql := ssql +
      'ON a.Missile_Index = b.Missile_Index INNER JOIN Fitted_Weap_Launcher_On_Board c';
    ssql := ssql +
      ' ON a.Fitted_Weap_Index = c.Fitted_Weap_Index LEFT JOIN Note_Storage d';
    ssql := ssql +
      ' ON d.Missile_Index = b.Missile_Index LEFT JOIN Vehicle_Definition e ';
    ssql := ssql + 'ON a.Vehicle_Index = e.Vehicle_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // jika id tidak 0
      if id <> 0 then
        ssql := ssql + ' WHERE (a.Vehicle_index = ' + IntToStr(id) + ')';
    end
    else
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 AND a.Missile_Index =' +
        IntToStr(index);

    SQL.Add(ssql);
    SQL.Add(' ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TMissile_On_Board.Create;

        with rec.FData do
        begin
          Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Mount_Type := FieldByName('Mount_Type').AsInteger;
          Launch_Angle := FieldByName('Launch_Angle').AsSingle;
          Launch_Angle_Required := FieldByName('Launch_Angle_Required')
            .AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
          Firing_Delay := FieldByName('Firing_Delay').AsSingle;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index := FieldByName('Mine_Index').AsInteger;
          Hybrid_Index := FieldByName('Hybrid_Index').AsInteger;
        end;

        with rec.FDef do
        begin
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Min_Range := FieldByName('Min_Range').AsSingle;
          Motion_Index := FieldByName('Motion_Index').AsInteger;
          Seeker_TurnOn_Range := FieldByName('Seeker_TurnOn_Range').AsSingle;
          Second_Seeker_Pattern_Capable := FieldByName
            ('Second_Seeker_Pattern_Capable').AsInteger;
          Seeker_Bias_Capable := FieldByName('Seeker_Bias_Capable').AsInteger;
          Fixed_Seeker_Turn_On_Range := FieldByName
            ('Fixed_Seeker_Turn_On_Range')
            .AsInteger;
          Lethality := FieldByName('Lethality').AsInteger;
          Prob_of_Hit := FieldByName('Prob_of_Hit').AsSingle;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          Default_Altitude := FieldByName('Default_Altitude').AsSingle;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Visual_Cross := FieldByName('Front_Visual_Cross').AsSingle;
          Side_Visual_Cross := FieldByName('Side_Visual_Cross').AsSingle;
          Front_Infrared_Cross := FieldByName('Front_Infrared_Cross').AsSingle;
          Side_Infrared_Cross := FieldByName('Side_Infrared_Cross').AsSingle;
          Pursuit_Guide_Type := FieldByName('Pursuit_Guide_Type').AsInteger;
          Primary_Guide_Type := FieldByName('Primary_Guide_Type').AsInteger;
          Secondary_Guide_Type := FieldByName('Secondary_Guide_Type').AsInteger;
          Anti_Air_Capable := FieldByName('Anti_Air_Capable').AsInteger;
          Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
          Anti_Land_Capable := FieldByName('Anti_Land_Capable').AsInteger;
          Anti_Amphibious_Capable := FieldByName('Anti_Amphibious_Capable').AsInteger;
          Primary_Target_Domain := FieldByName('Primary_Target_Domain')
            .AsInteger;
          SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
          CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
          TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
          IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
          AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
          Transmitted_Frequency := FieldByName('Transmitted_Frequency').AsFloat;
          Scan_Rate := FieldByName('Scan_Rate').AsSingle;
          Pulse_Rep_Freq := FieldByName('Pulse_Rep_Freq').AsSingle;
          Pulse_Width := FieldByName('Pulse_Width').AsSingle;
          Xmit_Power := FieldByName('Xmit_Power').AsSingle;
          TARH_Jamming_A_Probability := FieldByName
            ('TARH_Jamming_A_Probability').AsSingle;
          TARH_Jamming_B_Probability := FieldByName
            ('TARH_Jamming_B_Probability').AsSingle;
          TARH_Jamming_C_Probability := FieldByName
            ('TARH_Jamming_C_Probability').AsSingle;
          Wpt_Capable := FieldByName('Wpt_Capable').AsInteger;
          Max_Num_Wpts := FieldByName('Max_Num_Wpts').AsInteger;
          Min_Final_Leg_Length := FieldByName('Min_Final_Leg_Length').AsSingle;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          Max_Firing_Depth := FieldByName('Max_Firing_Depth').AsSingle;
          Upper_Received_Freq := FieldByName('Upper_Received_Freq').AsFloat;
          Lower_Received_Freq := FieldByName('Lower_Received_Freq').AsFloat;
          Fly_Out_Required := FieldByName('Fly_Out_Required').AsInteger;
          Fly_Out_Range := FieldByName('Fly_Out_Range').AsSingle;
          Fly_Out_Altitude := FieldByName('Fly_Out_Altitude').AsSingle;
          Booster_Separation_Required := FieldByName
            ('Booster_Separation_Required').AsInteger;
          Booster_Separation_Range := FieldByName('Booster_Separation_Range')
            .AsSingle;
          Booster_Separation_Box_Width := FieldByName
            ('Booster_Separation_Box_Width').AsSingle;
          Booster_Separation_Box_Length := FieldByName
            ('Booster_Separation_Box_Length').AsSingle;
          Term_Guide_Azimuth := FieldByName('Term_Guide_Azimuth').AsSingle;
          Term_Guide_Elevation := FieldByName('Term_Guide_Elevation').AsSingle;
          Term_Guide_Range := FieldByName('Term_Guide_Range').AsSingle;
          Terminal_Guidance_Capability := FieldByName
            ('Terminal_Guidance_Capability').AsInteger;
          Terminal_Altitude_Required := FieldByName
            ('Terminal_Altitude_Required')
            .AsInteger;
          Terminal_Acquisition_Altitude := FieldByName
            ('Terminal_Acquisition_Altitude').AsSingle;
          Terminal_Sinuation_Start_Range := FieldByName
            ('Terminal_Sinuation_Start_Range').AsSingle;
          Terminal_Sinuation_Period := FieldByName('Terminal_Sinuation_Period')
            .AsSingle;
          Terminal_Sinuation_Amplitude := FieldByName
            ('Terminal_Sinuation_Amplitude').AsSingle;
          Terminal_Pop_Up_Range := FieldByName('Terminal_Pop_Up_Range')
            .AsSingle;
          Terminal_Pop_Up_Altitude := FieldByName('Terminal_Pop_Up_Altitude')
            .AsSingle;
          Mid_Course_Update_Mode := FieldByName('Mid_Course_Update_Mode')
            .AsInteger;
          Home_On_Jam_Type_A_Capable := FieldByName
            ('Home_On_Jam_Type_A_Capable')
            .AsInteger;
          Home_On_Jam_Type_B_Capable := FieldByName
            ('Home_On_Jam_Type_B_Capable')
            .AsInteger;
          Home_On_Jam_Type_C_Capable := FieldByName
            ('Home_On_Jam_Type_C_Capable')
            .AsInteger;
          Launch_Method := FieldByName('Launch_Method').AsInteger;
          Data_Entry_Method := FieldByName('Data_Entry_Method').AsInteger;
          Launch_Speed := FieldByName('Launch_Speed').AsInteger;
          Max_Target_Altitude_Delta := FieldByName('Max_Target_Altitude_Delta')
            .AsInteger;
          Term_Guide_Azimuth_Narrow := FieldByName('Term_Guide_Azimuth_Narrow')
            .AsSingle;
          Term_Guide_Elevation_Narrow := FieldByName
            ('Term_Guide_Elevation_Narrow').AsSingle;
          Term_Guide_Range_Narrow := FieldByName('Term_Guide_Range_Narrow')
            .AsSingle;
          Spot_Number := FieldByName('Spot_Number').AsInteger;
          ECCM_Type := FieldByName('ECCM_Type').AsInteger;
          ECM_Detonation := FieldByName('ECM_Detonation').AsInteger;
          ECM_Detection := FieldByName('ECM_Detection').AsInteger;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
          IRCM_Detonation := FieldByName('IRCM_Detonation').AsInteger;
          IRCM_Detection := FieldByName('IRCM_Detection').AsInteger;
          Sea_State_Modelling_Capable := FieldByName
            ('Sea_State_Modelling_Capable').AsInteger;
        end;

        with rec.FLaunch do
        begin
          Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
          Launcher_Type := FieldByName('Launcher_Type').AsInteger;
          Launcher_Angle_Required := FieldByName('Launcher_Angle_Required')
            .AsInteger;
          Launcher_Angle := FieldByName('Launcher_Angle').AsInteger;
          Launcher_Max_Qty := FieldByName('Launcher_Max_Qty').AsInteger;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        with rec.FVehicle.FData do
        begin
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];
        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Scripted_Weapon_Event b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Weapons_Mount ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          weaponScript := TScripted_Weapon.Create;

          with weaponScript.Event.FData do
          begin
            List_Index := FieldByName('List_Index').AsInteger;
            Scripted_Event_Index := FieldByName('Scripted_Event_Index')
              .AsInteger;
            Salvo_Size := FieldByName('Salvo_Size').AsInteger;
            Number_Layed := FieldByName('Number_Layed').AsInteger;
            Distance_Between := FieldByName('Distance_Between').AsSingle;
            Mine_Depth := FieldByName('Mine_Depth').AsSingle;
            Target_Index := FieldByName('Target_Index').AsInteger;
            Weapon_Type := FieldByName('Weapon_Type').AsInteger;
            Point_Effect := FieldByName('Point_Effect').AsInteger;
            Weapons_Mount := FieldByName('Weapons_Mount').AsInteger;
          end;

          GetScripted_Behav(weaponScript.Event.FData.Scripted_Event_Index,
            weaponScript.Behav);

          rec.FScript_Missile.Add(weaponScript);
          ZQ.Next;
        end;
      end;

      for J := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[J];
        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Pattern_Weapon_Event b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Weapons_Mount ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          weaponPattern := TPattern_Weapon.Create;

          with weaponPattern.Event.FData do
          begin
            List_Index := FieldByName('List_Index').AsInteger;
            Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
              .AsInteger;
            Salvo_Size := FieldByName('Salvo_Size').AsInteger;
            Number_Layed := FieldByName('Number_Layed').AsInteger;
            Distance_Between := FieldByName('Distance_Between').AsSingle;
            Mine_Depth := FieldByName('Mine_Depth').AsSingle;
            Weapon_Type := FieldByName('Weapon_Type').AsInteger;
            Point_Effect := FieldByName('Point_Effect').AsInteger;
            Weapons_Mount := FieldByName('Weapons_Mount').AsInteger;
          end;

          GetScripted_Pattern(weaponPattern.Event.FData.Scripted_Pattern_Index,
            weaponPattern.pattern);

          rec.FPattern_Missile.Add(weaponPattern);
          ZQ.Next;
        end;
      end;

      for k := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[k];
        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Blind_Zone_Definition b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Fitted_Weap_Index ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          missile_Blind := TBlind_Zone.Create;

          with missile_Blind.FData do
          begin
            Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
            Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
            Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
            Start_Angle := FieldByName('Start_Angle').AsSingle;
            End_Angle := FieldByName('End_Angle').AsSingle;
          end;

          rec.FBlind.Add(missile_Blind);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

function TdmTTT.getAllMissile_OnBoard2(const id, index: Integer;
  var aRec: TList): Integer;
var
  i, J, k: Integer;
  rec: TMissile_On_Board;
  weaponScript: TScripted_Weapon;
  weaponPattern: TPattern_Weapon;
  missile_Blind: TBlind_Zone;
  plauncher : TFitted_Weap_Launcher_On_Board;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql +
      'FROM  Fitted_Weapon_On_Board a INNER JOIN Missile_Definition b ';
    ssql := ssql +
      'ON a.Missile_Index = b.Missile_Index  LEFT JOIN Vehicle_Definition e ';
    ssql := ssql + 'ON a.Vehicle_Index = e.Vehicle_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // jika id tidak 0
      if id <> 0 then
        ssql := ssql + ' WHERE (a.Vehicle_index = ' + IntToStr(id) + ')';
    end
    else
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 AND a.Missile_Index =' +
        IntToStr(index);

    SQL.Add(ssql);
    SQL.Add(' ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TMissile_On_Board.Create;

        with rec.FData do
        begin
          Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Mount_Type := FieldByName('Mount_Type').AsInteger;
          Launch_Angle := FieldByName('Launch_Angle').AsSingle;
          Launch_Angle_Required := FieldByName('Launch_Angle_Required')
            .AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
          Firing_Delay := FieldByName('Firing_Delay').AsSingle;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index := FieldByName('Mine_Index').AsInteger;
          Hybrid_Index := FieldByName('Hybrid_Index').AsInteger;
        end;

        with rec.FDef do
        begin
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Min_Range := FieldByName('Min_Range').AsSingle;
          Motion_Index := FieldByName('Motion_Index').AsInteger;
          Seeker_TurnOn_Range := FieldByName('Seeker_TurnOn_Range').AsSingle;
          Second_Seeker_Pattern_Capable := FieldByName
            ('Second_Seeker_Pattern_Capable').AsInteger;
          Seeker_Bias_Capable := FieldByName('Seeker_Bias_Capable').AsInteger;
          Fixed_Seeker_Turn_On_Range := FieldByName
            ('Fixed_Seeker_Turn_On_Range')
            .AsInteger;
          Lethality := FieldByName('Lethality').AsInteger;
          Prob_of_Hit := FieldByName('Prob_of_Hit').AsSingle;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          Default_Altitude := FieldByName('Default_Altitude').AsSingle;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Visual_Cross := FieldByName('Front_Visual_Cross').AsSingle;
          Side_Visual_Cross := FieldByName('Side_Visual_Cross').AsSingle;
          Front_Infrared_Cross := FieldByName('Front_Infrared_Cross').AsSingle;
          Side_Infrared_Cross := FieldByName('Side_Infrared_Cross').AsSingle;
          Pursuit_Guide_Type := FieldByName('Pursuit_Guide_Type').AsInteger;
          Primary_Guide_Type := FieldByName('Primary_Guide_Type').AsInteger;
          Secondary_Guide_Type := FieldByName('Secondary_Guide_Type').AsInteger;
          Anti_Air_Capable := FieldByName('Anti_Air_Capable').AsInteger;
          Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
          Anti_Land_Capable := FieldByName('Anti_Land_Capable').AsInteger;
          Anti_Amphibious_Capable := FieldByName('Anti_Amphibious_Capable').AsInteger;
          Primary_Target_Domain := FieldByName('Primary_Target_Domain')
            .AsInteger;
          SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
          CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
          TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
          IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
          AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
          Transmitted_Frequency := FieldByName('Transmitted_Frequency').AsFloat;
          Scan_Rate := FieldByName('Scan_Rate').AsSingle;
          Pulse_Rep_Freq := FieldByName('Pulse_Rep_Freq').AsSingle;
          Pulse_Width := FieldByName('Pulse_Width').AsSingle;
          Xmit_Power := FieldByName('Xmit_Power').AsSingle;
          TARH_Jamming_A_Probability := FieldByName
            ('TARH_Jamming_A_Probability').AsSingle;
          TARH_Jamming_B_Probability := FieldByName
            ('TARH_Jamming_B_Probability').AsSingle;
          TARH_Jamming_C_Probability := FieldByName
            ('TARH_Jamming_C_Probability').AsSingle;
          Wpt_Capable := FieldByName('Wpt_Capable').AsInteger;
          Max_Num_Wpts := FieldByName('Max_Num_Wpts').AsInteger;
          Min_Final_Leg_Length := FieldByName('Min_Final_Leg_Length').AsSingle;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          Max_Firing_Depth := FieldByName('Max_Firing_Depth').AsSingle;
          Upper_Received_Freq := FieldByName('Upper_Received_Freq').AsFloat;
          Lower_Received_Freq := FieldByName('Lower_Received_Freq').AsFloat;
          Fly_Out_Required := FieldByName('Fly_Out_Required').AsInteger;
          Fly_Out_Range := FieldByName('Fly_Out_Range').AsSingle;
          Fly_Out_Altitude := FieldByName('Fly_Out_Altitude').AsSingle;
          Booster_Separation_Required := FieldByName
            ('Booster_Separation_Required').AsInteger;
          Booster_Separation_Range := FieldByName('Booster_Separation_Range')
            .AsSingle;
          Booster_Separation_Box_Width := FieldByName
            ('Booster_Separation_Box_Width').AsSingle;
          Booster_Separation_Box_Length := FieldByName
            ('Booster_Separation_Box_Length').AsSingle;
          Term_Guide_Azimuth := FieldByName('Term_Guide_Azimuth').AsSingle;
          Term_Guide_Elevation := FieldByName('Term_Guide_Elevation').AsSingle;
          Term_Guide_Range := FieldByName('Term_Guide_Range').AsSingle;
          Terminal_Guidance_Capability := FieldByName
            ('Terminal_Guidance_Capability').AsInteger;
          Terminal_Altitude_Required := FieldByName
            ('Terminal_Altitude_Required')
            .AsInteger;
          Terminal_Acquisition_Altitude := FieldByName
            ('Terminal_Acquisition_Altitude').AsSingle;
          Terminal_Sinuation_Start_Range := FieldByName
            ('Terminal_Sinuation_Start_Range').AsSingle;
          Terminal_Sinuation_Period := FieldByName('Terminal_Sinuation_Period')
            .AsSingle;
          Terminal_Sinuation_Amplitude := FieldByName
            ('Terminal_Sinuation_Amplitude').AsSingle;
          Terminal_Pop_Up_Range := FieldByName('Terminal_Pop_Up_Range')
            .AsSingle;
          Terminal_Pop_Up_Altitude := FieldByName('Terminal_Pop_Up_Altitude')
            .AsSingle;
          Mid_Course_Update_Mode := FieldByName('Mid_Course_Update_Mode')
            .AsInteger;
          Home_On_Jam_Type_A_Capable := FieldByName
            ('Home_On_Jam_Type_A_Capable')
            .AsInteger;
          Home_On_Jam_Type_B_Capable := FieldByName
            ('Home_On_Jam_Type_B_Capable')
            .AsInteger;
          Home_On_Jam_Type_C_Capable := FieldByName
            ('Home_On_Jam_Type_C_Capable')
            .AsInteger;
          Launch_Method := FieldByName('Launch_Method').AsInteger;
          Data_Entry_Method := FieldByName('Data_Entry_Method').AsInteger;
          Launch_Speed := FieldByName('Launch_Speed').AsInteger;
          Max_Target_Altitude_Delta := FieldByName('Max_Target_Altitude_Delta')
            .AsInteger;
          Term_Guide_Azimuth_Narrow := FieldByName('Term_Guide_Azimuth_Narrow')
            .AsSingle;
          Term_Guide_Elevation_Narrow := FieldByName
            ('Term_Guide_Elevation_Narrow').AsSingle;
          Term_Guide_Range_Narrow := FieldByName('Term_Guide_Range_Narrow')
            .AsSingle;
          Spot_Number := FieldByName('Spot_Number').AsInteger;
          ECCM_Type := FieldByName('ECCM_Type').AsInteger;
          ECM_Detonation := FieldByName('ECM_Detonation').AsInteger;
          ECM_Detection := FieldByName('ECM_Detection').AsInteger;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
          IRCM_Detonation := FieldByName('IRCM_Detonation').AsInteger;
          IRCM_Detection := FieldByName('IRCM_Detection').AsInteger;
          Sea_State_Modelling_Capable := FieldByName
            ('Sea_State_Modelling_Capable').AsInteger;
        end;

        with rec.FVehicle.FData do
        begin
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];

        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weap_Launcher_On_Board c');
        SQL.Add('WHERE (c.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          plauncher := TFitted_Weap_Launcher_On_Board.Create;

          with plauncher.FData do
          begin
            Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
            Launcher_Type := FieldByName('Launcher_Type').AsInteger;
            Launcher_Angle_Required := FieldByName('Launcher_Angle_Required').AsInteger;
            Launcher_Angle := FieldByName('Launcher_Angle').AsInteger;
            Launcher_Qty := FieldByName('Launcher_Max_Qty').AsInteger; //added by choco : assumsi ketika game play pertama dimulai maka tiap launcher berquantity sesuai max quantity-nya
            Launcher_Max_Qty := FieldByName('Launcher_Max_Qty').AsInteger;
          end;

          rec.FLaunchs.Add(plauncher);
          ZQ.Next;
        end;

        rec := aRec.Items[i];

        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Scripted_Weapon_Event b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Weapons_Mount ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          weaponScript := TScripted_Weapon.Create;

          with weaponScript.Event.FData do
          begin
            List_Index := FieldByName('List_Index').AsInteger;
            Scripted_Event_Index := FieldByName('Scripted_Event_Index')
              .AsInteger;
            Salvo_Size := FieldByName('Salvo_Size').AsInteger;
            Number_Layed := FieldByName('Number_Layed').AsInteger;
            Distance_Between := FieldByName('Distance_Between').AsSingle;
            Mine_Depth := FieldByName('Mine_Depth').AsSingle;
            Target_Index := FieldByName('Target_Index').AsInteger;
            Weapon_Type := FieldByName('Weapon_Type').AsInteger;
            Point_Effect := FieldByName('Point_Effect').AsInteger;
            Weapons_Mount := FieldByName('Weapons_Mount').AsInteger;
          end;

          GetScripted_Behav(weaponScript.Event.FData.Scripted_Event_Index,
            weaponScript.Behav);

          rec.FScript_Missile.Add(weaponScript);
          ZQ.Next;
        end;
      end;

      for J := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[J];

        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Pattern_Weapon_Event b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Weapons_Mount ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          weaponPattern := TPattern_Weapon.Create;

          with weaponPattern.Event.FData do
          begin
            List_Index := FieldByName('List_Index').AsInteger;
            Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
              .AsInteger;
            Salvo_Size := FieldByName('Salvo_Size').AsInteger;
            Number_Layed := FieldByName('Number_Layed').AsInteger;
            Distance_Between := FieldByName('Distance_Between').AsSingle;
            Mine_Depth := FieldByName('Mine_Depth').AsSingle;
            Weapon_Type := FieldByName('Weapon_Type').AsInteger;
            Point_Effect := FieldByName('Point_Effect').AsInteger;
            Weapons_Mount := FieldByName('Weapons_Mount').AsInteger;
          end;

          GetScripted_Pattern(weaponPattern.Event.FData.Scripted_Pattern_Index,
            weaponPattern.pattern);

          rec.FPattern_Missile.Add(weaponPattern);
          ZQ.Next;
        end;
      end;

      for k := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[k];
        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Blind_Zone_Definition b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Fitted_Weap_Index ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          missile_Blind := TBlind_Zone.Create;

          with missile_Blind.FData do
          begin
            Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
            Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
            Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
            Start_Angle := FieldByName('Start_Angle').AsSingle;
            End_Angle := FieldByName('End_Angle').AsSingle;
          end;

          rec.FBlind.Add(missile_Blind);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getMissile_OnBoard_Distinct(const id: Integer; var aRec: TList):integer;
var
  //i, J, k: Integer;
  rec: TMissile_On_Board;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT DISTINCT b.Instance_Identifier, b.Fitted_Weap_Index, ';
    ssql := ssql + 'b.Missile_Index,b.Torpedo_Index,b.Mine_Index,b.Vehicle_Index,';
    ssql := ssql + 'b.Instance_Type,b.Mount_Type,b.Quantity,b.Firing_Delay ';
    ssql := ssql +
      'FROM Missile_Definition a INNER JOIN Fitted_Weapon_On_Board b ';
    ssql := ssql +
      'ON a.Missile_Index = b.Missile_Index ';
    ssql := ssql + 'INNER JOIN Vehicle_Definition d ' ;
    ssql := ssql +
      ' ON d.Vehicle_Index = b.Vehicle_Index ';

    // jika id tidak 0
      if id <> 0 then
        ssql := ssql + ' WHERE (b.Vehicle_index = ' + IntToStr(id) + ')';

    ssql := ssql + ' ORDER BY b.Instance_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TMissile_On_Board.Create;

        with rec.FData do
        begin
          Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Mount_Type := FieldByName('Mount_Type').AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
          Firing_Delay := FieldByName('Firing_Delay').AsSingle;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index := FieldByName('Mine_Index').AsInteger;
        end;

        aRec.Add(rec);
        Zq.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllMissile(const id: Integer; var mList: TList;
  var rec: TMissile_On_Board): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Missile_Definition ';
    if id <> 0 then
       ssql := ssql + 'WHERE Missile_Index =' + IntToStr(id);
    SQL.Add(ssql);
    SQL.Add('ORDER BY Class_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(mList) then
        mList := TList.Create
      else
        mList.Clear;

      while not ZQ.Eof do
      begin
        rec := TMissile_On_Board.Create;

        with rec.FDef do
        begin
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Min_Range := FieldByName('Min_Range').AsSingle;
          Motion_Index := FieldByName('Motion_Index').AsInteger;
          Seeker_TurnOn_Range := FieldByName('Seeker_TurnOn_Range').AsSingle;
          Second_Seeker_Pattern_Capable := FieldByName
            ('Second_Seeker_Pattern_Capable').AsInteger;
          Seeker_Bias_Capable := FieldByName('Seeker_Bias_Capable').AsInteger;
          Fixed_Seeker_Turn_On_Range := FieldByName
            ('Fixed_Seeker_Turn_On_Range')
            .AsInteger;
          Lethality := FieldByName('Lethality').AsInteger;
          Prob_of_Hit := FieldByName('Prob_of_Hit').AsSingle;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          Default_Altitude := FieldByName('Default_Altitude').AsSingle;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Visual_Cross := FieldByName('Front_Visual_Cross').AsSingle;
          Side_Visual_Cross := FieldByName('Side_Visual_Cross').AsSingle;
          Front_Infrared_Cross := FieldByName('Front_Infrared_Cross').AsSingle;
          Side_Infrared_Cross := FieldByName('Side_Infrared_Cross').AsSingle;
          Pursuit_Guide_Type := FieldByName('Pursuit_Guide_Type').AsInteger;
          Primary_Guide_Type := FieldByName('Primary_Guide_Type').AsInteger;
          Secondary_Guide_Type := FieldByName('Secondary_Guide_Type').AsInteger;
          Anti_Air_Capable := FieldByName('Anti_Air_Capable').AsInteger;
          Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
          Anti_Land_Capable := FieldByName('Anti_Land_Capable').AsInteger;
          Anti_Amphibious_Capable := FieldByName('Anti_Amphibious_Capable').AsInteger;
          Primary_Target_Domain := FieldByName('Primary_Target_Domain')
            .AsInteger;
          SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
          CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
          TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
          IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
          AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
          Transmitted_Frequency := FieldByName('Transmitted_Frequency').AsFloat;
          Scan_Rate := FieldByName('Scan_Rate').AsSingle;
          Pulse_Rep_Freq := FieldByName('Pulse_Rep_Freq').AsSingle;
          Pulse_Width := FieldByName('Pulse_Width').AsSingle;
          Xmit_Power := FieldByName('Xmit_Power').AsSingle;
          TARH_Jamming_A_Probability := FieldByName
            ('TARH_Jamming_A_Probability').AsSingle;
          TARH_Jamming_B_Probability := FieldByName
            ('TARH_Jamming_B_Probability').AsSingle;
          TARH_Jamming_C_Probability := FieldByName
            ('TARH_Jamming_C_Probability').AsSingle;
          Wpt_Capable := FieldByName('Wpt_Capable').AsInteger;
          Max_Num_Wpts := FieldByName('Max_Num_Wpts').AsInteger;
          Min_Final_Leg_Length := FieldByName('Min_Final_Leg_Length').AsSingle;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          Max_Firing_Depth := FieldByName('Max_Firing_Depth').AsSingle;
          Upper_Received_Freq := FieldByName('Upper_Received_Freq').AsFloat;
          Lower_Received_Freq := FieldByName('Lower_Received_Freq').AsFloat;
          Fly_Out_Required := FieldByName('Fly_Out_Required').AsInteger;
          Fly_Out_Range := FieldByName('Fly_Out_Range').AsSingle;
          Fly_Out_Altitude := FieldByName('Fly_Out_Altitude').AsSingle;
          Booster_Separation_Required := FieldByName
            ('Booster_Separation_Required').AsInteger;
          Booster_Separation_Range := FieldByName('Booster_Separation_Range')
            .AsSingle;
          Booster_Separation_Box_Width := FieldByName
            ('Booster_Separation_Box_Width').AsSingle;
          Booster_Separation_Box_Length := FieldByName
            ('Booster_Separation_Box_Length').AsSingle;
          Term_Guide_Azimuth := FieldByName('Term_Guide_Azimuth').AsSingle;
          Term_Guide_Elevation := FieldByName('Term_Guide_Elevation').AsSingle;
          Term_Guide_Range := FieldByName('Term_Guide_Range').AsSingle;
          Terminal_Guidance_Capability := FieldByName
            ('Terminal_Guidance_Capability').AsInteger;
          Terminal_Altitude_Required := FieldByName
            ('Terminal_Altitude_Required')
            .AsInteger;
          Terminal_Acquisition_Altitude := FieldByName
            ('Terminal_Acquisition_Altitude').AsSingle;
          Terminal_Sinuation_Start_Range := FieldByName
            ('Terminal_Sinuation_Start_Range').AsSingle;
          Terminal_Sinuation_Period := FieldByName('Terminal_Sinuation_Period')
            .AsSingle;
          Terminal_Sinuation_Amplitude := FieldByName
            ('Terminal_Sinuation_Amplitude').AsSingle;
          Terminal_Pop_Up_Range := FieldByName('Terminal_Pop_Up_Range')
            .AsSingle;
          Terminal_Pop_Up_Altitude := FieldByName('Terminal_Pop_Up_Altitude')
            .AsSingle;
          Mid_Course_Update_Mode := FieldByName('Mid_Course_Update_Mode')
            .AsInteger;
          Home_On_Jam_Type_A_Capable := FieldByName
            ('Home_On_Jam_Type_A_Capable')
            .AsInteger;
          Home_On_Jam_Type_B_Capable := FieldByName
            ('Home_On_Jam_Type_B_Capable')
            .AsInteger;
          Home_On_Jam_Type_C_Capable := FieldByName
            ('Home_On_Jam_Type_C_Capable')
            .AsInteger;
          Launch_Method := FieldByName('Launch_Method').AsInteger;
          Data_Entry_Method := FieldByName('Data_Entry_Method').AsInteger;
          Launch_Speed := FieldByName('Launch_Speed').AsInteger;
          Max_Target_Altitude_Delta := FieldByName('Max_Target_Altitude_Delta')
            .AsInteger;
          Term_Guide_Azimuth_Narrow := FieldByName('Term_Guide_Azimuth_Narrow')
            .AsSingle;
          Term_Guide_Elevation_Narrow := FieldByName
            ('Term_Guide_Elevation_Narrow').AsSingle;
          Term_Guide_Range_Narrow := FieldByName('Term_Guide_Range_Narrow')
            .AsSingle;
          Spot_Number := FieldByName('Spot_Number').AsInteger;
          ECCM_Type := FieldByName('ECCM_Type').AsInteger;
          ECM_Detonation := FieldByName('ECM_Detonation').AsInteger;
          ECM_Detection := FieldByName('ECM_Detection').AsInteger;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
          IRCM_Detonation := FieldByName('IRCM_Detonation').AsInteger;
          IRCM_Detection := FieldByName('IRCM_Detection').AsInteger;
          Sea_State_Modelling_Capable := FieldByName
            ('Sea_State_Modelling_Capable').AsInteger;
        end;

        mList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getPIMissile(var mList: TList; ra_id, force: Integer): Integer;
var
  rec: TMissile_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Missile_Definition a JOIN Platform_Instance b ');
    SQL.Add('ON a.Missile_Index = b.Missile_Index ');
    SQL.Add('WHERE b.Resource_Alloc_Index=' + IntToStr(ra_id) + ' AND ');
    SQL.Add('b.Force_Designation =' + IntToStr(force));
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(mList) then
        mList := TList.Create
      else
        mList.Clear;

      while not ZQ.Eof do
      begin
        rec := TMissile_On_Board.Create;

        with rec.FDef do
        begin
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
        end;

        with rec.FPI.FData do
        begin
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Instance_Name := FieldByName('Instance_Name').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
        end;

        mList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateMissile_Def(rec: TMissile_On_Board; id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Missile_Definition ');
      SQL.Add('SET ');
      SQL.Add('Class_Identifier = ''' + Class_Identifier + ''',');
      SQL.Add('Platform_Domain = ' + IntToStr(Platform_Domain) + ',');
      SQL.Add('Platform_Category = ' + IntToStr(Platform_Category) + ',');
      SQL.Add('Platform_Type = ' + IntToStr(Platform_Type) + ',');
      SQL.Add('Max_Range = ' + FloatToStr(Max_Range) + ',');
      SQL.Add('Min_Range = ' + FloatToStr(Min_Range) + ',');
      SQL.Add('Motion_Index = ' + IntToStr(Motion_Index) + ',');
      SQL.Add('Seeker_TurnOn_Range = ' + FloatToStr(Seeker_TurnOn_Range) + ',');
      SQL.Add('Second_Seeker_Pattern_Capable = ' + IntToStr
          (Second_Seeker_Pattern_Capable) + ',');
      SQL.Add('Seeker_Bias_Capable = ' + IntToStr(Seeker_Bias_Capable) + ',');
      SQL.Add('Fixed_Seeker_Turn_On_Range = ' + IntToStr
          (Fixed_Seeker_Turn_On_Range) + ',');
      SQL.Add('Lethality = ' + IntToStr(Lethality) + ',');
      SQL.Add('Prob_of_Hit = ' + FloatToStr(Prob_of_Hit) + ',');
      SQL.Add('Damage_Capacity = ' + IntToStr(Damage_Capacity) + ',');
      SQL.Add('Default_Altitude = ' + FloatToStr(Default_Altitude) + ',');
      SQL.Add('Length = ' + FloatToStr(Length) + ',');
      SQL.Add('Width = ' + FloatToStr(Width) + ',');
      SQL.Add('Height = ' + FloatToStr(Height) + ',');
      SQL.Add('Front_Radar_Cross = ' + FloatToStr(Front_Radar_Cross) + ',');
      SQL.Add('Side_Radar_Cross = ' + FloatToStr(Side_Radar_Cross) + ',');
      SQL.Add('Front_Visual_Cross = ' + FloatToStr(Front_Visual_Cross) + ',');
      SQL.Add('Side_Visual_Cross = ' + FloatToStr(Side_Visual_Cross) + ',');
      SQL.Add('Front_Infrared_Cross = ' + FloatToStr(Front_Infrared_Cross)
          + ',');
      SQL.Add('Side_Infrared_Cross = ' + FloatToStr(Side_Infrared_Cross) + ',');
      SQL.Add('Pursuit_Guide_Type = ' + IntToStr(Pursuit_Guide_Type) + ',');
      SQL.Add('Primary_Guide_Type = ' + IntToStr(Primary_Guide_Type) + ',');
      SQL.Add('Secondary_Guide_Type = ' + IntToStr(Secondary_Guide_Type) + ',');
      SQL.Add('Anti_Air_Capable = ' + IntToStr(Anti_Air_Capable) + ',');
      SQL.Add('Anti_Sur_Capable = ' + IntToStr(Anti_Sur_Capable) + ',');
      SQL.Add('Anti_SubSur_Capable = ' + IntToStr(Anti_SubSur_Capable) + ',');
      SQL.Add('Anti_Land_Capable = ' + IntToStr(Anti_Land_Capable) + ',');
      SQL.Add('Primary_Target_Domain = ' + IntToStr(Primary_Target_Domain)
          + ',');
      SQL.Add('SARH_POH_Modifier = ' + FloatToStr(SARH_POH_Modifier) + ',');
      SQL.Add('CG_POH_Modifier = ' + FloatToStr(CG_POH_Modifier) + ',');
      SQL.Add('TARH_POH_Modifier = ' + FloatToStr(TARH_POH_Modifier) + ',');
      SQL.Add('IR_POH_Modifier = ' + FloatToStr(IR_POH_Modifier) + ',');
      SQL.Add('AR_POH_Modifier = ' + FloatToStr(AR_POH_Modifier) + ',');
      SQL.Add('Transmitted_Frequency = ' + FloatToStr(Transmitted_Frequency)
          + ',');
      SQL.Add('Scan_Rate = ' + FloatToStr(Scan_Rate) + ',');
      SQL.Add('Pulse_Rep_Freq = ' + FloatToStr(Pulse_Rep_Freq) + ',');
      SQL.Add('Pulse_Width = ' + FloatToStr(Pulse_Width) + ',');
      SQL.Add('Xmit_Power = ' + FloatToStr(Xmit_Power) + ',');
      SQL.Add('TARH_Jamming_A_Probability = ' + FloatToStr
          (TARH_Jamming_A_Probability) + ',');
      SQL.Add('TARH_Jamming_B_Probability = ' + FloatToStr
          (TARH_Jamming_B_Probability) + ',');
      SQL.Add('TARH_Jamming_C_Probability = ' + FloatToStr
          (TARH_Jamming_C_Probability) + ',');
      SQL.Add('Wpt_Capable = ' + IntToStr(Wpt_Capable) + ',');
      SQL.Add('Max_Num_Wpts = ' + IntToStr(Max_Num_Wpts) + ',');
      SQL.Add('Min_Final_Leg_Length = ' + FloatToStr(Min_Final_Leg_Length)
          + ',');
      SQL.Add('Engagement_Range = ' + FloatToStr(Engagement_Range) + ',');
      SQL.Add('Max_Firing_Depth = ' + FloatToStr(Max_Firing_Depth) + ',');
      SQL.Add('Upper_Received_Freq = ' + FloatToStr(Upper_Received_Freq) + ',');
      SQL.Add('Lower_Received_Freq = ' + FloatToStr(Lower_Received_Freq) + ',');
      SQL.Add('Fly_Out_Required = ' + IntToStr(Fly_Out_Required) + ',');
      SQL.Add('Fly_Out_Range = ' + FloatToStr(Fly_Out_Range) + ',');
      SQL.Add('Fly_Out_Altitude = ' + FloatToStr(Fly_Out_Altitude) + ',');
      SQL.Add('Booster_Separation_Required = ' + IntToStr
          (Booster_Separation_Required) + ',');
      SQL.Add('Booster_Separation_Range = ' + FloatToStr
          (Booster_Separation_Range) + ',');
      SQL.Add('Booster_Separation_Box_Width = ' + FloatToStr
          (Booster_Separation_Box_Width) + ',');
      SQL.Add('Booster_Separation_Box_Length = ' + FloatToStr
          (Booster_Separation_Box_Length) + ',');
      SQL.Add('Term_Guide_Azimuth = ' + FloatToStr(Term_Guide_Azimuth) + ',');
      SQL.Add('Term_Guide_Elevation = ' + FloatToStr(Term_Guide_Elevation)
          + ',');
      SQL.Add('Term_Guide_Range = ' + FloatToStr(Term_Guide_Range) + ',');
      SQL.Add('Terminal_Guidance_Capability = ' + IntToStr
          (Terminal_Guidance_Capability) + ',');
      SQL.Add('Terminal_Altitude_Required = ' + IntToStr
          (Terminal_Altitude_Required) + ',');
      SQL.Add('Terminal_Acquisition_Altitude = ' + FloatToStr
          (Terminal_Acquisition_Altitude) + ',');
      SQL.Add('Terminal_Sinuation_Start_Range = ' + FloatToStr
          (Terminal_Sinuation_Start_Range) + ',');
      SQL.Add('Terminal_Sinuation_Period = ' + FloatToStr
          (Terminal_Sinuation_Period) + ',');
      SQL.Add('Terminal_Sinuation_Amplitude = ' + FloatToStr
          (Terminal_Sinuation_Amplitude) + ',');
      SQL.Add('Terminal_Pop_Up_Range = ' + FloatToStr(Terminal_Pop_Up_Range)
          + ',');
      SQL.Add('Terminal_Pop_Up_Altitude = ' + FloatToStr
          (Terminal_Pop_Up_Altitude) + ',');
      SQL.Add('Mid_Course_Update_Mode = ' + IntToStr(Mid_Course_Update_Mode)
          + ',');
      SQL.Add('Home_On_Jam_Type_A_Capable = ' + IntToStr
          (Home_On_Jam_Type_A_Capable) + ',');
      SQL.Add('Home_On_Jam_Type_B_Capable = ' + IntToStr
          (Home_On_Jam_Type_B_Capable) + ',');
      SQL.Add('Home_On_Jam_Type_C_Capable = ' + IntToStr
          (Home_On_Jam_Type_C_Capable) + ',');
      SQL.Add('Launch_Method = ' + IntToStr(Launch_Method) + ',');
      SQL.Add('Data_Entry_Method = ' + IntToStr(Data_Entry_Method) + ',');
      SQL.Add('Launch_Speed = ' + IntToStr(Launch_Speed) + ',');
      SQL.Add('Max_Target_Altitude_Delta = ' + IntToStr
          (Max_Target_Altitude_Delta) + ',');
      SQL.Add('Term_Guide_Azimuth_Narrow = ' + FloatToStr
          (Term_Guide_Azimuth_Narrow) + ',');
      SQL.Add('Term_Guide_Elevation_Narrow = ' + FloatToStr
          (Term_Guide_Elevation_Narrow) + ',');
      SQL.Add('Term_Guide_Range_Narrow = ' + FloatToStr
          (Term_Guide_Range_Narrow) + ',');
      SQL.Add('Spot_Number = ' + IntToStr(Spot_Number) + ',');
      SQL.Add('ECCM_Type = ' + IntToStr(ECCM_Type) + ',');
      SQL.Add('ECM_Detonation = ' + IntToStr(ECM_Detonation) + ',');
      SQL.Add('ECM_Detection = ' + IntToStr(ECM_Detection) + ',');
      SQL.Add('Detectability_Type = ' + IntToStr(Detectability_Type) + ',');
      SQL.Add('IRCM_Detonation = ' + IntToStr(IRCM_Detonation) + ',');
      SQL.Add('IRCM_Detection = ' + IntToStr(IRCM_Detection) + ',');
      SQL.Add('Sea_State_Modelling_Capable = ' + IntToStr
          (Sea_State_Modelling_Capable));

    end;

    SQL.Add(' WHERE (Missile_Index = ' + id + ')');
    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertMissile_Def(rec: TMissile_On_Board): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Missile_Definition ');
      SQL.Add(
        '(Class_Identifier,Platform_Domain,Platform_Category,Platform_Type,');
      SQL.Add(
        'Max_Range,Min_Range,Motion_Index,Seeker_TurnOn_Range,Second_Seeker_Pattern_Capable,');
      SQL.Add(
        'Seeker_Bias_Capable,Fixed_Seeker_Turn_On_Range,Lethality,Prob_of_Hit,Damage_Capacity,');
      SQL.Add(
        'Default_Altitude,Length,Width,Height,Front_Radar_Cross,Side_Radar_Cross,Front_Visual_Cross,');
      SQL.Add(
        'Side_Visual_Cross,Front_Infrared_Cross,Side_Infrared_Cross,Pursuit_Guide_Type,Primary_Guide_Type,');
      SQL.Add(
        'Secondary_Guide_Type,Anti_Air_Capable,Anti_Sur_Capable,Anti_SubSur_Capable,Anti_Land_Capable,');
      SQL.Add(
        'Primary_Target_Domain,SARH_POH_Modifier,CG_POH_Modifier,TARH_POH_Modifier,IR_POH_Modifier,');
      SQL.Add(
        'AR_POH_Modifier,Transmitted_Frequency,Scan_Rate,Pulse_Rep_Freq,Pulse_Width,Xmit_Power,');
      SQL.Add(
        'TARH_Jamming_A_Probability,TARH_Jamming_B_Probability,TARH_Jamming_C_Probability,');
      SQL.Add(
        'Wpt_Capable,Max_Num_Wpts,Min_Final_Leg_Length,Engagement_Range,Max_Firing_Depth,');
      SQL.Add(
        'Upper_Received_Freq,Lower_Received_Freq,Fly_Out_Required,Fly_Out_Range,Fly_Out_Altitude,');
      SQL.Add(
        'Booster_Separation_Required,Booster_Separation_Range,Booster_Separation_Box_Width,');
      SQL.Add(
        'Booster_Separation_Box_Length,Term_Guide_Azimuth,Term_Guide_Elevation,Term_Guide_Range,');
      SQL.Add(
        'Terminal_Guidance_Capability,Terminal_Altitude_Required,Terminal_Acquisition_Altitude,');
      SQL.Add(
        'Terminal_Sinuation_Start_Range,Terminal_Sinuation_Period,Terminal_Sinuation_Amplitude,');
      SQL.Add(
        'Terminal_Pop_Up_Range,Terminal_Pop_Up_Altitude,Mid_Course_Update_Mode,Home_On_Jam_Type_A_Capable,');
      SQL.Add(
        'Home_On_Jam_Type_B_Capable,Home_On_Jam_Type_C_Capable,Launch_Method,Data_Entry_Method,');
      SQL.Add(
        'Launch_Speed,Max_Target_Altitude_Delta,Term_Guide_Azimuth_Narrow,Term_Guide_Elevation_Narrow,');
      SQL.Add(
        'Term_Guide_Range_Narrow,Spot_Number,ECCM_Type,ECM_Detonation,ECM_Detection,Detectability_Type,');
      SQL.Add('IRCM_Detonation,IRCM_Detection,Sea_State_Modelling_Capable)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Class_Identifier + ''',');
      SQL.Add(IntToStr(Platform_Domain) + ',');
      SQL.Add(IntToStr(Platform_Category) + ',');
      SQL.Add(IntToStr(Platform_Type) + ',');
      SQL.Add(FloatToStr(Max_Range) + ',');
      SQL.Add(FloatToStr(Min_Range) + ',');
      SQL.Add(IntToStr(Motion_Index) + ',');
      SQL.Add(FloatToStr(Seeker_TurnOn_Range) + ',');
      SQL.Add(IntToStr(Second_Seeker_Pattern_Capable) + ',');
      SQL.Add(IntToStr(Seeker_Bias_Capable) + ',');
      SQL.Add(IntToStr(Fixed_Seeker_Turn_On_Range) + ',');
      SQL.Add(IntToStr(Lethality) + ',');
      SQL.Add(FloatToStr(Prob_of_Hit) + ',');
      SQL.Add(IntToStr(Damage_Capacity) + ',');
      SQL.Add(FloatToStr(Default_Altitude) + ',');
      SQL.Add(FloatToStr(Length) + ',');
      SQL.Add(FloatToStr(Width) + ',');
      SQL.Add(FloatToStr(Height) + ',');
      SQL.Add(FloatToStr(Front_Radar_Cross) + ',');
      SQL.Add(FloatToStr(Side_Radar_Cross) + ',');
      SQL.Add(FloatToStr(Front_Visual_Cross) + ',');
      SQL.Add(FloatToStr(Side_Visual_Cross) + ',');
      SQL.Add(FloatToStr(Front_Infrared_Cross) + ',');
      SQL.Add(FloatToStr(Side_Infrared_Cross) + ',');
      SQL.Add(IntToStr(Pursuit_Guide_Type) + ',');
      SQL.Add(IntToStr(Primary_Guide_Type) + ',');
      SQL.Add(IntToStr(Secondary_Guide_Type) + ',');
      SQL.Add(IntToStr(Anti_Air_Capable) + ',');
      SQL.Add(IntToStr(Anti_Sur_Capable) + ',');
      SQL.Add(IntToStr(Anti_SubSur_Capable) + ',');
      SQL.Add(IntToStr(Anti_Land_Capable) + ',');
      SQL.Add(IntToStr(Primary_Target_Domain) + ',');
      SQL.Add(FloatToStr(SARH_POH_Modifier) + ',');
      SQL.Add(FloatToStr(CG_POH_Modifier) + ',');
      SQL.Add(FloatToStr(TARH_POH_Modifier) + ',');
      SQL.Add(FloatToStr(IR_POH_Modifier) + ',');
      SQL.Add(FloatToStr(AR_POH_Modifier) + ',');
      SQL.Add(FloatToStr(Transmitted_Frequency) + ',');
      SQL.Add(FloatToStr(Scan_Rate) + ',');
      SQL.Add(FloatToStr(Pulse_Rep_Freq) + ',');
      SQL.Add(FloatToStr(Pulse_Width) + ',');
      SQL.Add(FloatToStr(Xmit_Power) + ',');
      SQL.Add(FloatToStr(TARH_Jamming_A_Probability) + ',');
      SQL.Add(FloatToStr(TARH_Jamming_B_Probability) + ',');
      SQL.Add(FloatToStr(TARH_Jamming_C_Probability) + ',');
      SQL.Add(IntToStr(Wpt_Capable) + ',');
      SQL.Add(IntToStr(Max_Num_Wpts) + ',');
      SQL.Add(FloatToStr(Min_Final_Leg_Length) + ',');
      SQL.Add(FloatToStr(Engagement_Range) + ',');
      SQL.Add(FloatToStr(Max_Firing_Depth) + ',');
      SQL.Add(FloatToStr(Upper_Received_Freq) + ',');
      SQL.Add(FloatToStr(Lower_Received_Freq) + ',');
      SQL.Add(IntToStr(Fly_Out_Required) + ',');
      SQL.Add(FloatToStr(Fly_Out_Range) + ',');
      SQL.Add(FloatToStr(Fly_Out_Altitude) + ',');
      SQL.Add(IntToStr(Booster_Separation_Required) + ',');
      SQL.Add(FloatToStr(Booster_Separation_Range) + ',');
      SQL.Add(FloatToStr(Booster_Separation_Box_Width) + ',');
      SQL.Add(FloatToStr(Booster_Separation_Box_Length) + ',');
      SQL.Add(FloatToStr(Term_Guide_Azimuth) + ',');
      SQL.Add(FloatToStr(Term_Guide_Elevation) + ',');
      SQL.Add(FloatToStr(Term_Guide_Range) + ',');
      SQL.Add(IntToStr(Terminal_Guidance_Capability) + ',');
      SQL.Add(IntToStr(Terminal_Altitude_Required) + ',');
      SQL.Add(FloatToStr(Terminal_Acquisition_Altitude) + ',');
      SQL.Add(FloatToStr(Terminal_Sinuation_Start_Range) + ',');
      SQL.Add(FloatToStr(Terminal_Sinuation_Period) + ',');
      SQL.Add(FloatToStr(Terminal_Sinuation_Amplitude) + ',');
      SQL.Add(FloatToStr(Terminal_Pop_Up_Range) + ',');
      SQL.Add(FloatToStr(Terminal_Pop_Up_Altitude) + ',');
      SQL.Add(IntToStr(Mid_Course_Update_Mode) + ',');
      SQL.Add(IntToStr(Home_On_Jam_Type_A_Capable) + ',');
      SQL.Add(IntToStr(Home_On_Jam_Type_B_Capable) + ',');
      SQL.Add(IntToStr(Home_On_Jam_Type_C_Capable) + ',');
      SQL.Add(IntToStr(Launch_Method) + ',');
      SQL.Add(IntToStr(Data_Entry_Method) + ',');
      SQL.Add(IntToStr(Launch_Speed) + ',');
      SQL.Add(IntToStr(Max_Target_Altitude_Delta) + ',');
      SQL.Add(FloatToStr(Term_Guide_Azimuth_Narrow) + ',');
      SQL.Add(FloatToStr(Term_Guide_Elevation_Narrow) + ',');
      SQL.Add(FloatToStr(Term_Guide_Range_Narrow) + ',');
      SQL.Add(IntToStr(Spot_Number) + ',');
      SQL.Add(IntToStr(ECCM_Type) + ',');
      SQL.Add(IntToStr(ECM_Detonation) + ',');
      SQL.Add(IntToStr(ECM_Detection) + ',');
      SQL.Add(IntToStr(Detectability_Type) + ',');
      SQL.Add(IntToStr(IRCM_Detonation) + ',');
      SQL.Add(IntToStr(IRCM_Detection) + ',');
      SQL.Add(IntToStr(Sea_State_Modelling_Capable) + ')');

      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Missile_Index FROM Missile_Definition ');
      SQL.Add('WHERE Class_Identifier =' + quotedStr(Class_Identifier));
      Open;
      with rec.FDef do
      begin
        Missile_Index := FieldByName('Missile_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteMissile_Def(id: Integer): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Missile_Definition ');
    SQL.Add('WHERE Missile_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.GetPoint_Effect_On_Board(const id: integer;
  var rec: TPoint_Effect_On_Board): boolean;
begin
  result := false;

  if not zConn.Connected then Exit;

  with ZQ do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Point_Effect_On_Board ' );
    SQL.Add('WHERE (Point_Effect_Index = ' +  IntToStr(id) + ')' );
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TPoint_Effect_On_Board.Create;

      with rec.FData do
      begin
        Point_Effect_Index    := FieldByName('Point_Effect_Index').AsInteger;
        Instance_Identifier   := FieldByName('Instance_Identifier').AsString;
        Instance_Type         := FieldByName('Instance_Type').AsInteger;
        Vehicle_Index         := FieldByName('Vehicle_Index').AsInteger;
        Mount_Type            := FieldByName('Mount_Type').AsInteger;
        Quantity              := FieldByName('Quantity').AsInteger;
        Gun_Index             := FieldByName('Gun_Index').AsInteger;
        Bomb_Index            := FieldByName('Bomb_Index').AsInteger;
        TurretID              := FieldByName('TurretID').AsInteger;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.GetFitted_Weapon_On_Board(const id: integer;
  var rec: TFitted_Weapon_On_Board): boolean;
begin
  result := false;

  if not zConn.Connected then Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Fitted_Weapon_On_Board ' );
    SQL.Add('WHERE (Fitted_Weap_Index = ' +  IntToStr(id) + ')' );
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TFitted_Weapon_On_Board.Create;

      with rec.FData do
      begin
        Fitted_Weap_Index       := FieldByName('Fitted_Weap_Index').AsInteger;
        Instance_Identifier     := FieldByName('Instance_Identifier').AsString;
        Instance_Type           := FieldByName('Instance_Type').AsInteger;
        Vehicle_Index           := FieldByName('Vehicle_Index').AsInteger;
        Mount_Type              := FieldByName('Mount_Type').AsInteger;
        Launch_Angle            := FieldByName('Launch_Angle').AsSingle;
        Launch_Angle_Required   := FieldByName('Launch_Angle_Required').AsInteger;
        Quantity                := FieldByName('Quantity').AsInteger;
        Firing_Delay            := FieldByName('Firing_Delay').AsSingle;
        Missile_Index           := FieldByName('Missile_Index').AsInteger;
        Torpedo_Index           := FieldByName('Torpedo_Index').AsInteger;
        Mine_Index              := FieldByName('Mine_Index').AsInteger;
        Hybrid_Index            := FieldByName('Hybrid_Index').AsInteger;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.InsertFitted_Weapon_On_Board(const id: string;const index :integer;
  var rec: TRecFitted_Weapon_On_Board): Integer;
begin

  result := -1;
  with ZQ do
  begin
    with rec do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Fitted_Weapon_On_Board  ');
      SQL.Add('(Instance_Identifier,Vehicle_Index,Instance_Type,Mount_Type,Quantity,');
      case index of
        1:SQL.Add('Missile_Index)');
        2:SQL.Add('Torpedo_Index)');
        3:SQL.Add('Mine_Index)');
        4:SQL.Add('Hybrid_Index)');
      end;
      SQL.Add('VALUES ( ');
      SQL.Add(QuotedStr(Instance_Identifier)+',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Mount_Type) + ',');
      SQL.Add(IntToStr(Quantity) +',');
      case index of
        1:SQL.Add(IntToStr(Missile_Index) + ')');
        2:SQL.Add(IntToStr(Torpedo_Index) + ')');
        3:SQL.Add(IntToStr(Mine_Index) + ')');
        4:SQL.Add(IntToStr(Hybrid_Index) + ')');
      end;
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT * FROM Fitted_Weapon_On_Board ');
      SQL.Add('WHERE Instance_Identifier='+ QuotedStr('Instance_Identifier'));
      Open;
      with rec do
      begin
       Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
      end;

    end;
  end;
end;

//-------------------------------------------------------------------

function TdmTTT.UpdateFitted_Weapon_OnBoard(const id: string;const index:integer;var rec: TRecFitted_Weapon_On_Board):integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Fitted_Weapon_On_Board ');
      SQL.Add('SET ');
      SQL.Add('Instance_Identifier ='+ QuotedStr(Instance_Identifier)+',');
      SQL.Add('Vehicle_Index ='+ IntToStr(Vehicle_Index) + ',');
      SQL.Add('Instance_Type ='+ IntToStr(Instance_Type) + ',');
      SQL.Add('Mount_Type =' + IntToStr(Mount_Type) + ',');
      SQL.Add('Firing_Delay ='+ FloatToStr(Firing_Delay) +',');
      SQL.Add('Quantity =' + IntToStr(Quantity)+ ',');
      case index of
        1:SQL.Add('Missile_Index ='+IntToStr(Missile_Index));
        2:SQL.Add('Torpedo_Index ='+IntToStr(Torpedo_Index) );
        3:SQL.Add('Mine_Index ='+IntToStr(Mine_Index));
        4:SQL.Add('Hybrid_Index ='+IntToStr(Hybrid_Index));
      end;
      SQL.Add(' WHERE Fitted_Weap_index ='+ id);
    end;
    ExecSQL;
  end;
end;

//-------------------------------------------------------------------

function TdmTTT.DeleteFitted_Weapon_On_Board(const id: string):integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Fitted_Weapon_On_Board  ');
    SQL.Add('WHERE (Fitted_Weap_Index = ' + id + ')');
    ExecSQL;
  end;
end;

//-------------------------------------------------------------------

function TdmTTT.GetFitted_Weap_Launcher_On_Board(const id: integer;
var rec: TRecFitted_Weap_Launcher_On_Board): boolean;
begin
  result := false;

  if not zConn.Connected then Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Fitted_Weap_Launcher_On_Board ' );
    SQL.Add('WHERE (Fitted_Weap_Index = ' +  IntToStr(id) + ')' );
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

     { if not Assigned(rec) then
        rec := TFitted_Weap_Launcher_On_Board.Create;  }

      with rec do
      begin
        Fitted_Weap_Index         := FieldByName('Fitted_Weap_Index').AsInteger;
        Launcher_Type             := FieldByName('Launcher_Type').AsInteger;
        Launcher_Angle_Required   := FieldByName('Launcher_Angle_Required').AsInteger;
        Launcher_Angle            := FieldByName('Launcher_Angle').AsInteger;
        Launcher_Max_Qty          := FieldByName('Launcher_Max_Qty').AsInteger;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.UpdateFitted_Weap_Launcher_On_Board(const id,launch: string;
  var rec: TFitted_Weap_Launcher_On_Board): integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Fitted_Weap_Launcher_On_Board  ');
      SQL.Add('SET ' );
      SQL.Add('Launcher_Angle_Required = '+IntToStr(Launcher_Angle_Required)+',');
      SQL.Add('Launcher_Angle = '+ IntToStr(Launcher_Angle) +',');
      SQL.Add('Launcher_Max_Qty = '+IntToStr(Launcher_Max_Qty));
      SQL.Add(' WHERE (Fitted_Weap_Index = ' +  id + ') AND ' );
      SQL.Add('Launcher_Type ='+ launch );
    end;

    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.InsertFitted_Weap_Launcher_On_Board(var rec: TRecFitted_Weap_Launcher_On_Board): integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Fitted_Weap_Launcher_On_Board ');
      SQL.Add('(Fitted_Weap_Index,Launcher_Type,Launcher_Angle_Required,');
      SQL.Add('Launcher_Angle,Launcher_Max_Qty)');
      SQL.Add('VALUES ( ' );
      SQL.Add(IntToStr(Fitted_Weap_Index)+',');
      SQL.Add(IntToStr(Launcher_Type)+',');
      SQL.Add(IntToStr(Launcher_Angle_Required)+',');
      SQL.Add(IntToStr(Launcher_Angle)+',');
      SQL.Add(IntToStr(Launcher_Max_Qty)+')');
    end;

    ShowMessage(SQl.Text);
    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.DeleteFitted_Weap_Launcher_On_Board(const id: string): integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Fitted_Weap_Launcher_On_Board  ');
    SQL.Add('WHERE (Fitted_Weap_Index = ' +  id + ')' );

    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getAllTorpedo_OnBoard(const id, index: Integer;
  var aRec: TList): Integer;
var
  i, J, k: Integer;
  rec: TTorpedo_On_Board;
  weaponScript: TScripted_Weapon;
  weaponPattern: TPattern_Weapon;
  torpedo_Blind: TBlind_Zone;
  plauncher : TFitted_Weap_Launcher_On_Board;
  aspect_POH  : TTorpedo_POH_Modifier;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM  Fitted_Weapon_On_Board a JOIN Torpedo_Definition b ';
    ssql := ssql +
      'ON a.Torpedo_Index = b.Torpedo_Index LEFT JOIN Vehicle_Definition d ';
    ssql := ssql + 'ON a.Vehicle_Index = d.Vehicle_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // jika id tidak 0
      if id <> 0 then
        ssql := ssql + 'LEFT JOIN Note_Storage c ';
      ssql := ssql + 'ON c.Torpedo_Index = b.Torpedo_Index ';
      ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(id) + ')';
    end
    else
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 AND a.Torpedo_Index =' +
        IntToStr(index);

    SQL.Add(ssql);
    SQL.Add(' ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TTorpedo_On_Board.Create;

        with rec.FData do
        begin
          Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Mount_Type := FieldByName('Mount_Type').AsInteger;
          Launch_Angle := FieldByName('Launch_Angle').AsSingle;
          Launch_Angle_Required := FieldByName('Launch_Angle_Required')
            .AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
          Firing_Delay := FieldByName('Firing_Delay').AsSingle;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index := FieldByName('Mine_Index').AsInteger;
          Hybrid_Index := FieldByName('Hybrid_Index').AsInteger;
        end;

        with rec.FDef do
        begin
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Min_Range := FieldByName('Min_Range').AsSingle;
          Motion_Index := FieldByName('Motion_Index').AsInteger;
          Seeker_TurnOn_Range := FieldByName('Seeker_TurnOn_Range').AsSingle;
          Lethality := FieldByName('Lethality').AsInteger;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          Default_Depth := FieldByName('Default_Depth').AsSingle;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          LSpeed_Acoustic_Intens := FieldByName('LSpeed_Acoustic_Intens')
            .AsSingle;
          Below_Cav_Acoustic_Intens := FieldByName('Below_Cav_Acoustic_Intens')
            .AsSingle;
          Above_Cav_Acoustic_Intens := FieldByName('Above_Cav_Acoustic_Intens')
            .AsSingle;
          HSpeed_Acoustic_Intens := FieldByName('HSpeed_Acoustic_Intens')
            .AsSingle;
          Cavitation_Switch_Point := FieldByName('Cavitation_Switch_Point')
            .AsSingle;
          Term_Guide_Azimuth := FieldByName('Term_Guide_Azimuth').AsSingle;
          Term_Guide_Elevation := FieldByName('Term_Guide_Elevation').AsSingle;
          Term_Guide_Range := FieldByName('Term_Guide_Range').AsSingle;
          Pursuit_Guidance_Type := FieldByName('Pursuit_Guidance_Type')
            .AsInteger;
          Air_Drop_Capable := FieldByName('Air_Drop_Capable').AsInteger;
          Use_Terminal_Circle := FieldByName('Use_Terminal_Circle').AsInteger;
          Terminal_Circle_Radius := FieldByName('Terminal_Circle_Radius')
            .AsSingle;
          Fixed_Circle_Radius := FieldByName('Fixed_Circle_Radius').AsInteger;
          Lateral_Deceleration := FieldByName('Lateral_Deceleration').AsSingle;
          Airborne_Descent_Rate := FieldByName('Airborne_Descent_Rate').AsFloat;
          Wire_Angle_Offset := FieldByName('Wire_Angle_Offset').AsSingle;
          Guidance_Type := FieldByName('Guidance_Type').AsInteger;
          Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
          Primary_Target_Domain := FieldByName('Primary_Target_Domain')
            .AsInteger;
          Active_Acoustic_POH_Mod := FieldByName('Active_Acoustic_POH_Mod')
            .AsSingle;
          Passive_Acoustic_POH_Mod := FieldByName('Passive_Acoustic_POH_Mod')
            .AsSingle;
          Active_Passive_POH_Mod := FieldByName('Active_Passive_POH_Mod')
            .AsSingle;
          WireGuide_POH_Modifier := FieldByName('WireGuide_POH_Modifier')
            .AsSingle;
          WakeHome_POH_Modifier := FieldByName('WakeHome_POH_Modifier')
            .AsSingle;
          Active_Seeker_Power := FieldByName('Active_Seeker_Power').AsSingle;
          Active_Seeker_Freq := FieldByName('Active_Seeker_Freq').AsSingle;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          First_Relative_Gyro_Angle := FieldByName('First_Relative_Gyro_Angle')
            .AsInteger;
          Second_Relative_Gyro_Angle := FieldByName
            ('Second_Relative_Gyro_Angle')
            .AsInteger;
          Max_Torpedo_Gyro_Angle := FieldByName('Max_Torpedo_Gyro_Angle')
            .AsSingle;
          Max_Torpedo_Search_Depth := FieldByName('Max_Torpedo_Search_Depth')
            .AsSingle;
          Acoustic_Torp_Ceiling_Depth := FieldByName
            ('Acoustic_Torp_Ceiling_Depth').AsSingle;
          Fixed_Ceiling_Depth := FieldByName('Fixed_Ceiling_Depth').AsInteger;
          Fixed_Seeker_TurnOn_Range := FieldByName('Fixed_Seeker_TurnOn_Range')
            .AsInteger;
          Sinuation_Runout := FieldByName('Sinuation_Runout').AsInteger;
          Runout_Sinuation_Period := FieldByName('Runout_Sinuation_Period')
            .AsSingle;
          Runout_Sinuation_Amplitude := FieldByName
            ('Runout_Sinuation_Amplitude').AsSingle;
          Min_Runout_Range := FieldByName('Min_Runout_Range').AsSingle;
          Launch_Method := FieldByName('Launch_Method').AsInteger;
          Data_Entry_Method := FieldByName('Data_Entry_Method').AsInteger;
          Launch_Speed := FieldByName('Launch_Speed').AsInteger;
          Opt_Launch_Range_Nuc_Sub := FieldByName('Opt_Launch_Range_Nuc_Sub')
            .AsSingle;
          Opt_Launch_Range_Conv_Sub := FieldByName('Opt_Launch_Range_Conv_Sub')
            .AsSingle;
          Opt_Launch_Range_Other := FieldByName('Opt_Launch_Range_Other')
            .AsSingle;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        with rec.FVehicle.FData do
        begin
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];

        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weap_Launcher_On_Board a ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          plauncher := TFitted_Weap_Launcher_On_Board.Create;

          with plauncher.FData do
          begin
            Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
            Launcher_Type := FieldByName('Launcher_Type').AsInteger;
            Launcher_Angle_Required := FieldByName('Launcher_Angle_Required').AsInteger;
            Launcher_Angle := FieldByName('Launcher_Angle').AsInteger;
            Launcher_Qty := FieldByName('Launcher_Max_Qty').AsInteger; //added by choco : assumsi ketika game play pertama dimulai maka tiap launcher berquantity sesuai max quantity-nya
            Launcher_Max_Qty := FieldByName('Launcher_Max_Qty').AsInteger;
          end;

          rec.FLaunchs.Add(plauncher);
          ZQ.Next;
        end;

        //-------------------------
        rec := aRec.Items[i];
        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Scripted_Weapon_Event b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Weapons_Mount ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');

        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          weaponScript := TScripted_Weapon.Create;

          with weaponScript.Event.FData do
          begin
            List_Index := FieldByName('List_Index').AsInteger;
            Scripted_Event_Index := FieldByName('Scripted_Event_Index')
              .AsInteger;
            Salvo_Size := FieldByName('Salvo_Size').AsInteger;
            Number_Layed := FieldByName('Number_Layed').AsInteger;
            Distance_Between := FieldByName('Distance_Between').AsSingle;
            Mine_Depth := FieldByName('Mine_Depth').AsSingle;
            Target_Index := FieldByName('Target_Index').AsInteger;
            Weapon_Type := FieldByName('Weapon_Type').AsInteger;
            Point_Effect := FieldByName('Point_Effect').AsInteger;
            Weapons_Mount := FieldByName('Weapons_Mount').AsInteger;
          end;

          GetScripted_Behav(weaponScript.Event.FData.Scripted_Event_Index,
            weaponScript.Behav);

          rec.FScript_Torpedo.Add(weaponScript);
          ZQ.Next;
        end;
      end;

      for J := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[J];

        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Pattern_Weapon_Event b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Weapons_Mount ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          weaponPattern := TPattern_Weapon.Create;

          with weaponPattern.Event.FData do
          begin
            List_Index := FieldByName('List_Index').AsInteger;
            Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
              .AsInteger;
            Salvo_Size := FieldByName('Salvo_Size').AsInteger;
            Number_Layed := FieldByName('Number_Layed').AsInteger;
            Distance_Between := FieldByName('Distance_Between').AsSingle;
            Mine_Depth := FieldByName('Mine_Depth').AsSingle;
            Weapon_Type := FieldByName('Weapon_Type').AsInteger;
            Point_Effect := FieldByName('Point_Effect').AsInteger;
            Weapons_Mount := FieldByName('Weapons_Mount').AsInteger;

          end;

          GetScripted_Pattern(weaponPattern.Event.FData.Scripted_Pattern_Index,
            weaponPattern.pattern);

          rec.FPattern_Torpedo.Add(weaponPattern);
          ZQ.Next;
        end;
      end;

      for I := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];

        Close;
        SQL.Clear;
        SQL.Add('SELECT a.Torpedo_Index, a.Aspect_Angle, a.POH_Modifier ');
        SQL.Add('FROM Torpedo_POH_Modifier a JOIN Torpedo_Definition b ');
        SQL.Add('ON a.Torpedo_Index = b.Torpedo_Index ');
        SQL.Add('WHERE (a.Torpedo_Index = ' + IntToStr
            (rec.FDef.Torpedo_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          aspect_POH := TTorpedo_POH_Modifier.Create;

          with aspect_POH.FData do
          begin
            Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
            Aspect_Angle  := FieldByName('Aspect_Angle').AsInteger;
            POH_Modifier  := FieldByName('POH_Modifier').AsFloat;
          end;

          rec.FAspectPOH.Add(aspect_POH);
          ZQ.Next;
        end;
      end;

      for k := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[k];

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Blind_Zone_Definition b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Fitted_Weap_Index ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          torpedo_Blind := TBlind_Zone.Create;

          with torpedo_Blind.FData do
          begin
            Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
            Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
            Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
            Start_Angle := FieldByName('Start_Angle').AsSingle;
            End_Angle := FieldByName('End_Angle').AsSingle;
          end;

          rec.FBlind.Add(torpedo_Blind);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllTorpedo(const id: Integer; var mList: TList;
  var rec: TTorpedo_On_Board): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Torpedo_Definition ';
    if id <> 0 then
      ssql := ssql + 'WHERE Torpedo_Index = ' + IntToStr(id);
    SQL.Add(ssql);
    SQL.Add('ORDER BY Class_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(mList) then
        mList := TList.Create
      else
        mList.Clear;

      while not ZQ.Eof do
      begin
        rec := TTorpedo_On_Board.Create;

        with rec.FDef do
        begin
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Min_Range := FieldByName('Min_Range').AsSingle;
          Motion_Index := FieldByName('Motion_Index').AsInteger;
          Seeker_TurnOn_Range := FieldByName('Seeker_TurnOn_Range').AsSingle;
          Lethality := FieldByName('Lethality').AsInteger;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          Default_Depth := FieldByName('Default_Depth').AsSingle;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          LSpeed_Acoustic_Intens := FieldByName('LSpeed_Acoustic_Intens')
            .AsSingle;
          Below_Cav_Acoustic_Intens := FieldByName('Below_Cav_Acoustic_Intens')
            .AsSingle;
          Above_Cav_Acoustic_Intens := FieldByName('Above_Cav_Acoustic_Intens')
            .AsSingle;
          HSpeed_Acoustic_Intens := FieldByName('HSpeed_Acoustic_Intens')
            .AsSingle;
          Cavitation_Switch_Point := FieldByName('Cavitation_Switch_Point')
            .AsSingle;
          Term_Guide_Azimuth := FieldByName('Term_Guide_Azimuth').AsSingle;
          Term_Guide_Elevation := FieldByName('Term_Guide_Elevation').AsSingle;
          Term_Guide_Range := FieldByName('Term_Guide_Range').AsSingle;
          Pursuit_Guidance_Type := FieldByName('Pursuit_Guidance_Type')
            .AsInteger;
          Air_Drop_Capable := FieldByName('Air_Drop_Capable').AsInteger;
          Use_Terminal_Circle := FieldByName('Use_Terminal_Circle').AsInteger;
          Terminal_Circle_Radius := FieldByName('Terminal_Circle_Radius')
            .AsSingle;
          Fixed_Circle_Radius := FieldByName('Fixed_Circle_Radius').AsInteger;
          Lateral_Deceleration := FieldByName('Lateral_Deceleration').AsSingle;
          Airborne_Descent_Rate := FieldByName('Airborne_Descent_Rate').AsFloat;
          Wire_Angle_Offset := FieldByName('Wire_Angle_Offset').AsSingle;
          Guidance_Type := FieldByName('Guidance_Type').AsInteger;
          Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
          Primary_Target_Domain := FieldByName('Primary_Target_Domain')
            .AsInteger;
          Active_Acoustic_POH_Mod := FieldByName('Active_Acoustic_POH_Mod')
            .AsSingle;
          Passive_Acoustic_POH_Mod := FieldByName('Passive_Acoustic_POH_Mod')
            .AsSingle;
          Active_Passive_POH_Mod := FieldByName('Active_Passive_POH_Mod')
            .AsSingle;
          WireGuide_POH_Modifier := FieldByName('WireGuide_POH_Modifier')
            .AsSingle;
          WakeHome_POH_Modifier := FieldByName('WakeHome_POH_Modifier')
            .AsSingle;
          Active_Seeker_Power := FieldByName('Active_Seeker_Power').AsSingle;
          Active_Seeker_Freq := FieldByName('Active_Seeker_Freq').AsSingle;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          First_Relative_Gyro_Angle := FieldByName('First_Relative_Gyro_Angle')
            .AsInteger;
          Second_Relative_Gyro_Angle := FieldByName
            ('Second_Relative_Gyro_Angle')
            .AsInteger;
          Max_Torpedo_Gyro_Angle := FieldByName('Max_Torpedo_Gyro_Angle')
            .AsSingle;
          Max_Torpedo_Search_Depth := FieldByName('Max_Torpedo_Search_Depth')
            .AsSingle;
          Acoustic_Torp_Ceiling_Depth := FieldByName
            ('Acoustic_Torp_Ceiling_Depth').AsSingle;
          Fixed_Ceiling_Depth := FieldByName('Fixed_Ceiling_Depth').AsInteger;
          Fixed_Seeker_TurnOn_Range := FieldByName('Fixed_Seeker_TurnOn_Range')
            .AsInteger;
          Sinuation_Runout := FieldByName('Sinuation_Runout').AsInteger;
          Runout_Sinuation_Period := FieldByName('Runout_Sinuation_Period')
            .AsSingle;
          Runout_Sinuation_Amplitude := FieldByName
            ('Runout_Sinuation_Amplitude').AsSingle;
          Min_Runout_Range := FieldByName('Min_Runout_Range').AsSingle;
          Launch_Method := FieldByName('Launch_Method').AsInteger;
          Data_Entry_Method := FieldByName('Data_Entry_Method').AsInteger;
          Launch_Speed := FieldByName('Launch_Speed').AsInteger;
          Opt_Launch_Range_Nuc_Sub := FieldByName('Opt_Launch_Range_Nuc_Sub')
            .AsSingle;
          Opt_Launch_Range_Conv_Sub := FieldByName('Opt_Launch_Range_Conv_Sub')
            .AsSingle;
          Opt_Launch_Range_Other := FieldByName('Opt_Launch_Range_Other')
            .AsSingle;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
        end;

        mList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getTorpedo_OnBoard(const id: Integer; var aRec: TList):integer;
var
  //i, J, k: Integer;
  rec: TTorpedo_On_Board;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT DISTINCT a.Instance_Identifier,a.Fitted_Weap_Index,  ';
    ssql := ssql + 'a.Missile_Index,a.Torpedo_Index,a.Mine_Index,a.Quantity,a.Firing_Delay ';
    ssql := ssql + 'FROM  Fitted_Weapon_On_Board a JOIN Torpedo_Definition b ';
    ssql := ssql +
      'ON a.Torpedo_Index = b.Torpedo_Index LEFT JOIN Vehicle_Definition d ';
    ssql := ssql + 'ON a.Vehicle_Index = d.Vehicle_Index ';
    ssql := ssql + 'LEFT JOIN Note_Storage c ';
    ssql := ssql + 'ON c.Torpedo_Index = b.Torpedo_Index ';

    // jika id tidak 0
    if id <> 0 then
       ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(id) + ')';

    ssql := ssql + ' ORDER BY a.Instance_Identifier ';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TTorpedo_On_Board.Create;

        with rec.FData do
        begin
          Fitted_Weap_Index   := FieldByName('Fitted_Weap_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Missile_Index       := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index       := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index          := FieldByName('Mine_Index').AsInteger;
          Quantity            := FieldByName('Quantity').AsInteger;
          Firing_Delay        := FieldByName('Firing_Delay').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getPITorpedo(var mList: TList; ra_id: Integer;
  force: Integer): Integer;
var
  rec: TTorpedo_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Torpedo_Definition a JOIN Platform_Instance b ');
    SQL.Add('ON a.Torpedo_Index = b.Torpedo_Index ');
    SQL.Add('WHERE b.Resource_Alloc_Index=' + IntToStr(ra_id) + ' AND ');
    SQL.Add('b.Force_Designation =' + IntToStr(force));
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(mList) then
        mList := TList.Create
      else
        mList.Clear;

      while not ZQ.Eof do
      begin
        rec := TTorpedo_On_Board.Create;

        with rec.FDef do
        begin
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
        end;

        with rec.FPI.FData do
        begin
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Instance_Name := FieldByName('Instance_Name').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
        end;

        mList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

function TdmTTT.GetPlatformCapability(const id: Integer;
  var rec: TCapability_Characteristics): Boolean;
begin
  Result := False;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
//    SQL.Add('SELECT *');
//    SQL.Add('FROM Platform_Capability a, Vehicle_Definition b');
//    SQL.Add('WHERE a.Platform_Capability_Index = b.Platform_Capability_Index AND');
//    SQL.Add('b.Platform_Capability_Index ='+ IntToStr(id));
    SQL.Add('SELECT *');
    SQL.Add('FROM Platform_Capability ');
    SQL.Add('WHERE Platform_Capability_Index ='+ IntToStr(id));
    Open;

    Result := RecordCount > 0;

    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TCapability_Characteristics.Create;

      with rec.FData do
      begin
        Platform_Capability_Index := FieldByName('Platform_Capability_Index').AsInteger;
        Capability_Identifier := FieldByName('Capability_Identifier').AsString;
        Personnel_Unit_Carried := FieldByName('Personnel_Unit_Carried').AsBoolean;
        FixedWing_Carried := FieldByName('FixedWing_Carried').AsBoolean;
        Rotary_Carried := FieldByName('Rotary_Carried').AsBoolean;
        Max_Hangar_Capacity := FieldByName('Max_Hangar_Capacity').AsInteger;
        Max_Personnel_Capacity := FieldByName('Max_Personnel_Capacity').AsInteger;
        Carriable := FieldByName('Carriable').AsBoolean;
        Hangar_Unit_Carried := FieldByName('Hangar_Unit_Carried').AsBoolean;
        Deck_Unit_Carried  := FieldByName('Deck_Unit_Carried').AsBoolean;
        Amphibious_Carried := FieldByName('Amphibious_Carried').AsBoolean;
        Land_Carried := FieldByName('Land_Carried').AsBoolean;
        Max_Hangar_Weight := FieldByName('Max_Hangar_Weight').AsFloat;
        Max_Deck_Weight := FieldByName('Max_Deck_Weight').AsFloat;
        Max_Deck_Wide := FieldByName('Max_Deck_Wide').AsFloat;
      end;
    end;
//        while not ZQ.Eof do
//        begin
//          rec := TT3Vehicle.Create;
//          with rec do
//          begin
//            Capacity_Pesonel_Carried := FieldByName('Max_Personnel_Capacity').AsFloat ;
//            Capacity_AirPlatf_Carried := FieldByName('Max_Hangar_Capacity').AsFloat;
//            Wide_Hangar_UnitCarried := FieldByName('Max_Hangar_Wide').AsFloat;
//            Wide_Deck_UnitCarried := FieldByName('Max_Deck_Wide').AsFloat;
//            pList.Add(rec);
//            ZQ.Next;
//          end;
//        end;
  end
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateTorpedo_Def(rec: TTorpedo_On_Board; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Torpedo_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Class_Identifier = ''' + Class_Identifier + ''',');
      SQL.Add('Platform_Domain = ' + IntToStr(Platform_Domain) + ',');
      SQL.Add('Platform_Category = ' + IntToStr(Platform_Category) + ',');
      SQL.Add('Platform_Type = ' + IntToStr(Platform_Type) + ',');
      SQL.Add('Max_Range = ' + FloatToStr(Max_Range) + ',');
      SQL.Add('Min_Range = ' + FloatToStr(Min_Range) + ',');
      SQL.Add('Motion_Index = ' + IntToStr(Motion_Index) + ',');
      SQL.Add('Seeker_TurnOn_Range = ' + FloatToStr(Seeker_TurnOn_Range) + ',');
      SQL.Add('Lethality = ' + IntToStr(Lethality) + ',');
      SQL.Add('Damage_Capacity = ' + IntToStr(Damage_Capacity) + ',');
      SQL.Add('Default_Depth = ' + FloatToStr(Default_Depth) + ',');
      SQL.Add('Length = ' + FloatToStr(Length) + ',');
      SQL.Add('Width = ' + FloatToStr(Width) + ',');
      SQL.Add('Height = ' + FloatToStr(Height) + ',');
      SQL.Add('Front_Acoustic_Cross = ' + FloatToStr(Front_Acoustic_Cross)
          + ',');
      SQL.Add('Side_Acoustic_Cross = ' + FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add('LSpeed_Acoustic_Intens = ' + FloatToStr(LSpeed_Acoustic_Intens)
          + ',');
      SQL.Add('Below_Cav_Acoustic_Intens = ' + FloatToStr
          (Below_Cav_Acoustic_Intens) + ',');
      SQL.Add('Above_Cav_Acoustic_Intens = ' + FloatToStr
          (Above_Cav_Acoustic_Intens) + ',');
      SQL.Add('HSpeed_Acoustic_Intens = ' + FloatToStr(HSpeed_Acoustic_Intens)
          + ',');
      SQL.Add('Cavitation_Switch_Point = ' + FloatToStr
          (Cavitation_Switch_Point) + ',');
      SQL.Add('Term_Guide_Azimuth = ' + FloatToStr(Term_Guide_Azimuth) + ',');
      SQL.Add('Term_Guide_Elevation = ' + FloatToStr(Term_Guide_Elevation)
          + ',');
      SQL.Add('Term_Guide_Range = ' + FloatToStr(Term_Guide_Range) + ',');
      SQL.Add('Pursuit_Guidance_Type = ' + IntToStr(Pursuit_Guidance_Type)
          + ',');
      SQL.Add('Air_Drop_Capable = ' + IntToStr(Air_Drop_Capable) + ',');
      SQL.Add('Use_Terminal_Circle = ' + IntToStr(Use_Terminal_Circle) + ',');
      SQL.Add('Terminal_Circle_Radius = ' + FloatToStr(Terminal_Circle_Radius)
          + ',');
      SQL.Add('Fixed_Circle_Radius = ' + IntToStr(Fixed_Circle_Radius) + ',');
      SQL.Add('Lateral_Deceleration = ' + FloatToStr(Lateral_Deceleration)
          + ',');
      SQL.Add('Airborne_Descent_Rate = ' + FloatToStr(Airborne_Descent_Rate)
          + ',');
      SQL.Add('Wire_Angle_Offset = ' + FloatToStr(Wire_Angle_Offset) + ',');
      SQL.Add('Guidance_Type = ' + IntToStr(Guidance_Type) + ',');
      SQL.Add('Anti_Sur_Capable = ' + IntToStr(Anti_Sur_Capable) + ',');
      SQL.Add('Anti_SubSur_Capable = ' + IntToStr(Anti_SubSur_Capable) + ',');
      SQL.Add('Primary_Target_Domain = ' + IntToStr(Primary_Target_Domain)
          + ',');
      SQL.Add('Active_Acoustic_POH_Mod = ' + FloatToStr
          (Active_Acoustic_POH_Mod) + ',');
      SQL.Add('Passive_Acoustic_POH_Mod = ' + FloatToStr
          (Passive_Acoustic_POH_Mod) + ',');
      SQL.Add('Active_Passive_POH_Mod = ' + FloatToStr(Active_Passive_POH_Mod)
          + ',');
      SQL.Add('WireGuide_POH_Modifier = ' + FloatToStr(WireGuide_POH_Modifier)
          + ',');
      SQL.Add('WakeHome_POH_Modifier = ' + FloatToStr(WakeHome_POH_Modifier)
          + ',');
      SQL.Add('Active_Seeker_Power = ' + FloatToStr(Active_Seeker_Power) + ',');
      SQL.Add('Active_Seeker_Freq = ' + FloatToStr(Active_Seeker_Freq) + ',');
      SQL.Add('Engagement_Range = ' + FloatToStr(Engagement_Range) + ',');
      SQL.Add('First_Relative_Gyro_Angle = ' + IntToStr
          (First_Relative_Gyro_Angle) + ',');
      SQL.Add('Second_Relative_Gyro_Angle = ' + IntToStr
          (Second_Relative_Gyro_Angle) + ',');
      SQL.Add('Max_Torpedo_Gyro_Angle = ' + FloatToStr(Max_Torpedo_Gyro_Angle)
          + ',');
      SQL.Add('Max_Torpedo_Search_Depth = ' + FloatToStr
          (Max_Torpedo_Search_Depth) + ',');
      SQL.Add('Acoustic_Torp_Ceiling_Depth = ' + FloatToStr
          (Acoustic_Torp_Ceiling_Depth) + ',');
      SQL.Add('Fixed_Ceiling_Depth = ' + IntToStr(Fixed_Ceiling_Depth) + ',');
      SQL.Add('Fixed_Seeker_TurnOn_Range = ' + IntToStr
          (Fixed_Seeker_TurnOn_Range) + ',');
      SQL.Add('Sinuation_Runout = ' + IntToStr(Sinuation_Runout) + ',');
      SQL.Add('Runout_Sinuation_Period = ' + FloatToStr
          (Runout_Sinuation_Period) + ',');
      SQL.Add('Runout_Sinuation_Amplitude = ' + FloatToStr
          (Runout_Sinuation_Amplitude) + ',');
      SQL.Add('Min_Runout_Range = ' + FloatToStr(Min_Runout_Range) + ',');
      SQL.Add('Launch_Method = ' + IntToStr(Launch_Method) + ',');
      SQL.Add('Data_Entry_Method = ' + IntToStr(Data_Entry_Method) + ',');
      SQL.Add('Launch_Speed = ' + IntToStr(Launch_Speed) + ',');
      SQL.Add('Opt_Launch_Range_Nuc_Sub = ' + FloatToStr
          (Opt_Launch_Range_Nuc_Sub) + ',');
      SQL.Add('Opt_Launch_Range_Conv_Sub = ' + FloatToStr
          (Opt_Launch_Range_Conv_Sub) + ',');
      SQL.Add('Opt_Launch_Range_Other = ' + FloatToStr(Opt_Launch_Range_Other)
          + ',');
      SQL.Add('Detectability_Type = ' + IntToStr(Detectability_Type));
    end;

    SQL.Add('WHERE (Torpedo_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertTorpedo_Def(rec: TTorpedo_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Torpedo_Definition ');
      SQL.Add(
        '(Class_Identifier,Platform_Domain,Platform_Category,Platform_Type,');
      SQL.Add(
        'Max_Range,Min_Range,Motion_Index,Seeker_TurnOn_Range,Lethality,Damage_Capacity,');
      SQL.Add(
        'Default_Depth,Length,Width,Height,Front_Acoustic_Cross,Side_Acoustic_Cross,');
      SQL.Add(
        'LSpeed_Acoustic_Intens,Below_Cav_Acoustic_Intens,Above_Cav_Acoustic_Intens,');
      SQL.Add(
        'HSpeed_Acoustic_Intens,Cavitation_Switch_Point,Term_Guide_Azimuth,Term_Guide_Elevation,');
      SQL.Add(
        'Term_Guide_Range,Pursuit_Guidance_Type,Air_Drop_Capable,Use_Terminal_Circle,');
      SQL.Add(
        'Terminal_Circle_Radius,Fixed_Circle_Radius,Lateral_Deceleration,Airborne_Descent_Rate,');
      SQL.Add(
        'Wire_Angle_Offset,Guidance_Type,Anti_Sur_Capable,Anti_SubSur_Capable,Primary_Target_Domain,');
      SQL.Add(
        'Active_Acoustic_POH_Mod,Passive_Acoustic_POH_Mod,Active_Passive_POH_Mod,WireGuide_POH_Modifier,');
      SQL.Add(
        'WakeHome_POH_Modifier,Active_Seeker_Power,Active_Seeker_Freq,Engagement_Range,');
      SQL.Add(
        'First_Relative_Gyro_Angle,Second_Relative_Gyro_Angle,Max_Torpedo_Gyro_Angle,');
      SQL.Add(
        'Max_Torpedo_Search_Depth,Acoustic_Torp_Ceiling_Depth,Fixed_Ceiling_Depth,Fixed_Seeker_TurnOn_Range,');
      SQL.Add(
        'Sinuation_Runout,Runout_Sinuation_Period,Runout_Sinuation_Amplitude,Min_Runout_Range,');
      SQL.Add(
        'Launch_Method,Data_Entry_Method,Launch_Speed,Opt_Launch_Range_Nuc_Sub,Opt_Launch_Range_Conv_Sub,');
      SQL.Add('Opt_Launch_Range_Other,Detectability_Type)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Class_Identifier + ''',');
      SQL.Add(IntToStr(Platform_Domain) + ',');
      SQL.Add(IntToStr(Platform_Category) + ',');
      SQL.Add(IntToStr(Platform_Type) + ',');
      SQL.Add(FloatToStr(Max_Range) + ',');
      SQL.Add(FloatToStr(Min_Range) + ',');
      SQL.Add(IntToStr(Motion_Index) + ',');
      SQL.Add(FloatToStr(Seeker_TurnOn_Range) + ',');
      SQL.Add(IntToStr(Lethality) + ',');
      SQL.Add(IntToStr(Damage_Capacity) + ',');
      SQL.Add(FloatToStr(Default_Depth) + ',');
      SQL.Add(FloatToStr(Length) + ',');
      SQL.Add(FloatToStr(Width) + ',');
      SQL.Add(FloatToStr(Height) + ',');
      SQL.Add(FloatToStr(Front_Acoustic_Cross) + ',');
      SQL.Add(FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add(FloatToStr(LSpeed_Acoustic_Intens) + ',');
      SQL.Add(FloatToStr(Below_Cav_Acoustic_Intens) + ',');
      SQL.Add(FloatToStr(Above_Cav_Acoustic_Intens) + ',');
      SQL.Add(FloatToStr(HSpeed_Acoustic_Intens) + ',');
      SQL.Add(FloatToStr(Cavitation_Switch_Point) + ',');
      SQL.Add(FloatToStr(Term_Guide_Azimuth) + ',');
      SQL.Add(FloatToStr(Term_Guide_Elevation) + ',');
      SQL.Add(FloatToStr(Term_Guide_Range) + ',');
      SQL.Add(IntToStr(Pursuit_Guidance_Type) + ',');
      SQL.Add(IntToStr(Air_Drop_Capable) + ',');
      SQL.Add(IntToStr(Use_Terminal_Circle) + ',');
      SQL.Add(FloatToStr(Terminal_Circle_Radius) + ',');
      SQL.Add(IntToStr(Fixed_Circle_Radius) + ',');
      SQL.Add(FloatToStr(Lateral_Deceleration) + ',');
      SQL.Add(FloatToStr(Airborne_Descent_Rate) + ',');
      SQL.Add(FloatToStr(Wire_Angle_Offset) + ',');
      SQL.Add(IntToStr(Guidance_Type) + ',');
      SQL.Add(IntToStr(Anti_Sur_Capable) + ',');
      SQL.Add(IntToStr(Anti_SubSur_Capable) + ',');
      SQL.Add(IntToStr(Primary_Target_Domain) + ',');
      SQL.Add(FloatToStr(Active_Acoustic_POH_Mod) + ',');
      SQL.Add(FloatToStr(Passive_Acoustic_POH_Mod) + ',');
      SQL.Add(FloatToStr(Active_Passive_POH_Mod) + ',');
      SQL.Add(FloatToStr(WireGuide_POH_Modifier) + ',');
      SQL.Add(FloatToStr(WakeHome_POH_Modifier) + ',');
      SQL.Add(FloatToStr(Active_Seeker_Power) + ',');
      SQL.Add(FloatToStr(Active_Seeker_Freq) + ',');
      SQL.Add(FloatToStr(Engagement_Range) + ',');
      SQL.Add(IntToStr(First_Relative_Gyro_Angle) + ',');
      SQL.Add(IntToStr(Second_Relative_Gyro_Angle) + ',');
      SQL.Add(FloatToStr(Max_Torpedo_Gyro_Angle) + ',');
      SQL.Add(FloatToStr(Max_Torpedo_Search_Depth) + ',');
      SQL.Add(FloatToStr(Acoustic_Torp_Ceiling_Depth) + ',');
      SQL.Add(IntToStr(Fixed_Ceiling_Depth) + ',');
      SQL.Add(IntToStr(Fixed_Seeker_TurnOn_Range) + ',');
      SQL.Add(IntToStr(Sinuation_Runout) + ',');
      SQL.Add(FloatToStr(Runout_Sinuation_Period) + ',');
      SQL.Add(FloatToStr(Runout_Sinuation_Amplitude) + ',');
      SQL.Add(FloatToStr(Min_Runout_Range) + ',');
      SQL.Add(IntToStr(Launch_Method) + ',');
      SQL.Add(IntToStr(Data_Entry_Method) + ',');
      SQL.Add(IntToStr(Launch_Speed) + ',');
      SQL.Add(FloatToStr(Opt_Launch_Range_Nuc_Sub) + ',');
      SQL.Add(FloatToStr(Opt_Launch_Range_Conv_Sub) + ',');
      SQL.Add(FloatToStr(Opt_Launch_Range_Other) + ',');
      SQL.Add(IntToStr(Detectability_Type) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Torpedo_Index FROM Torpedo_Definition ');
      SQL.Add('WHERE Class_Identifier =' + quotedStr(Class_Identifier));
      Open;

      with rec.FDef do
      begin
        Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteTorpedo_Def(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Torpedo_Definition ');
    SQL.Add('WHERE Torpedo_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllMines_OnBoard(const id, index: Integer;
  var aRec: TList): Integer;
var
  i, J, k, l: Integer;
  rec: TMine_On_Board;
  weaponScript: TScripted_Weapon;
  weaponPattern: TPattern_Weapon;
  mine_Blind: TBlind_Zone;
  //ppod : ^TRecMine_POD_vs_Range;   --> Edited Nando & Andi
  ppod : TMine_POD_vs_Range;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;

    ssql := 'SELECT distinct * ';{ a.Instance_Identifier,b.Mine_Index ';}
    ssql := ssql + 'FROM  Fitted_Weapon_On_Board a JOIN Mine_Definition b ';
    ssql := ssql + 'ON a.Mine_Index = b.Mine_Index LEFT JOIN Note_Storage c ';
    ssql := ssql +
      'ON b.Mine_Index = c.Mine_Index LEFT JOIN Vehicle_Definition d ';
    ssql := ssql + 'ON a.Vehicle_Index = d.Vehicle_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // jika id tidak 0
      if id <> 0 then
        ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(id) + ') ';
    end
    else
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 AND a.Mine_Index =' + IntToStr
        (index) + ' ';

    SQL.Add(ssql);
    SQL.Add('ORDER BY a.Instance_Identifier');
    // ShowMessage(SQL.Text);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TMine_On_Board.Create;

        with rec.FData do
        begin
          Fitted_Weap_Index       := FieldByName('Fitted_Weap_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type           := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index           := FieldByName('Vehicle_Index').AsInteger;
          Mount_Type              := FieldByName('Mount_Type').AsInteger;
          Launch_Angle            := FieldByName('Launch_Angle').AsSingle;
          Launch_Angle_Required   := FieldByName('Launch_Angle_Required').AsInteger;
          Quantity                := FieldByName('Quantity').AsInteger;
          Firing_Delay            := FieldByName('Firing_Delay').AsSingle;
          Missile_Index           := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index           := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index              := FieldByName('Mine_Index').AsInteger;
          Hybrid_Index            := FieldByName('Hybrid_Index').AsInteger;
        end;

        with rec.FMine_Def do
        begin
          Mine_Index := FieldByName('Mine_Index').AsInteger;
          Mine_Identifier         := FieldByName('Mine_Identifier').AsString;
          Platform_Domain         := FieldByName('Platform_Domain').AsInteger;
          Platform_Category       := FieldByName('Platform_Category').AsInteger;
          Platform_Type           := FieldByName('Platform_Type').AsInteger;
          Mine_Classification     := FieldByName('Mine_Classification').AsInteger;
          Length                  := FieldByName('Length').AsSingle;
          Width                   := FieldByName('Width').AsSingle;
          Height                  := FieldByName('Height').AsSingle;
          Mooring_Type            := FieldByName('Mooring_Type').AsInteger;
          Max_Laying_Depth        := FieldByName('Max_Laying_Depth').AsSingle;
          Front_Acoustic_Cross    := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross     := FieldByName('Side_Acoustic_Cross').AsSingle;
          Mine_Lethality          := FieldByName('Mine_Lethality').AsInteger;
          Engagement_Range        := FieldByName('Engagement_Range').AsSingle;
          Anti_Sur_Capable        := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable     := FieldByName('Anti_SubSur_Capable').AsInteger;
          Detectability_Type      := FieldByName('Detectability_Type').AsInteger;
        end;

        with rec.FNote do
        begin
          Note_Index                := FieldByName('Note_Index').AsInteger;
          Note_Type                 := FieldByName('Note_Type').AsInteger;
          Notes                     := FieldByName('Notes').AsString;
        end;

        with rec.FVehicle.FData do
        begin
          Vehicle_Identifier        := FieldByName('Vehicle_Identifier').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];

        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Scripted_Weapon_Event b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Weapons_Mount ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          weaponScript := TScripted_Weapon.Create;

          with weaponScript.Event.FData do
          begin
            List_Index := FieldByName('List_Index').AsInteger;
            Scripted_Event_Index := FieldByName('Scripted_Event_Index')
              .AsInteger;
            Salvo_Size := FieldByName('Salvo_Size').AsInteger;
            Number_Layed := FieldByName('Number_Layed').AsInteger;
            Distance_Between := FieldByName('Distance_Between').AsSingle;
            Mine_Depth := FieldByName('Mine_Depth').AsSingle;
            Target_Index := FieldByName('Target_Index').AsInteger;
            Weapon_Type := FieldByName('Weapon_Type').AsInteger;
            Point_Effect := FieldByName('Point_Effect').AsInteger;
            Weapons_Mount := FieldByName('Weapons_Mount').AsInteger;
          end;

          GetScripted_Behav(weaponScript.Event.FData.Scripted_Event_Index,
            weaponScript.Behav);

          rec.FScript_Mine.Add(weaponScript);
          ZQ.Next;
        end;
      end;

      for J := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[J];

        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Pattern_Weapon_Event b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Weapons_Mount ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          weaponPattern := TPattern_Weapon.Create;

          with weaponPattern.Event.FData do
          begin
            List_Index := FieldByName('List_Index').AsInteger;
            Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
              .AsInteger;
            Salvo_Size := FieldByName('Salvo_Size').AsInteger;
            Number_Layed := FieldByName('Number_Layed').AsInteger;
            Distance_Between := FieldByName('Distance_Between').AsSingle;
            Mine_Depth := FieldByName('Mine_Depth').AsSingle;
            Weapon_Type := FieldByName('Weapon_Type').AsInteger;
            Point_Effect := FieldByName('Point_Effect').AsInteger;
            Weapons_Mount := FieldByName('Weapons_Mount').AsInteger;
          end;

          GetScripted_Pattern(weaponPattern.Event.FData.Scripted_Pattern_Index,
            weaponPattern.pattern);

          rec.FPattern_Mine.Add(weaponPattern);
          ZQ.Next;
        end;
      end;

      for k := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[k];

        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Blind_Zone_Definition b ');
        SQL.Add('ON a.Fitted_Weap_Index = b.Fitted_Weap_Index ');
        SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (rec.FData.Fitted_Weap_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          mine_Blind := TBlind_Zone.Create;

          with mine_Blind.FData do
          begin
            Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
            Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
            Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
            Start_Angle := FieldByName('Start_Angle').AsSingle;
            End_Angle := FieldByName('End_Angle').AsSingle;
          end;

          rec.FBlind.Add(mine_Blind);
          ZQ.Next;
        end;
      end;

      for l := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[l];

        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Mine_POD_vs_Range g ');
        SQL.Add('WHERE (g.Mine_Index = ' + IntToStr
            (rec.FMine_Def.Mine_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          ppod := TMine_POD_vs_Range.Create;

          with ppod.FData do
          begin
            List_Index        := FieldByName('List_Index').AsInteger;
            Mine_Index        := FieldByName('Mine_Index').AsInteger;
            Prob_of_Detonation:= FieldByName('Prob_of_Detonation').AsSingle;
            Range             := FieldByName('Range').AsSingle;
          end;

          rec.FPOD.Add(ppod);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getMine_OnBoard(const id: Integer; var aRec: TList):integer;
var
  //i, J, k: Integer;
  rec: TMine_On_Board;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT distinct a.Instance_Identifier, a.Fitted_Weap_Index ';
    ssql := ssql + 'FROM  Fitted_Weapon_On_Board a JOIN Mine_Definition b ';
    ssql := ssql + 'ON a.Mine_Index = b.Mine_Index LEFT JOIN Note_Storage c ';
    ssql := ssql +
      'ON b.Mine_Index = c.Mine_Index LEFT JOIN Vehicle_Definition d ';
    ssql := ssql + 'ON a.Vehicle_Index = d.Vehicle_Index ';

    // jika id tidak 0
    if id <> 0 then
      ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(id) + ') ';

    ssql := ssql + ' ORDER BY a.Instance_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TMine_On_Board.Create;

        with rec.FData do
        begin
          Fitted_Weap_Index   := FieldByName('Fitted_Weap_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getAllMine(const id: Integer; var mList: TList;
  var rec: TMine_On_Board): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Mine_Definition ';
    if id <> 0 then
       ssql := ssql + 'WHERE Mine_Index=' + IntToStr(id);
    SQL.Add(ssql);
    SQL.Add('ORDER BY Mine_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(mList) then
        mList := TList.Create
      else
        mList.Clear;

      while not ZQ.Eof do
      begin
        rec := TMine_On_Board.Create;

        with rec.FMine_Def do
        begin
          Mine_Index := FieldByName('Mine_Index').AsInteger;
          Mine_Identifier := FieldByName('Mine_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Mine_Classification := FieldByName('Mine_Classification').AsInteger;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Mooring_Type := FieldByName('Mooring_Type').AsInteger;
          Max_Laying_Depth := FieldByName('Max_Laying_Depth').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Mine_Lethality := FieldByName('Mine_Lethality').AsInteger;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
        end;

        mList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getPIMine(var mList: TList; ra_id: Integer;
  force: Integer): Integer;
var
  rec: TMine_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Mine_Definition a JOIN Platform_Instance b ');
    SQL.Add('ON a.Mine_Index = b.Mine_Index ');
    SQL.Add('WHERE b.Resource_Alloc_Index=' + IntToStr(ra_id) + ' AND ');
    SQL.Add('b.Force_Designation =' + IntToStr(force));

    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(mList) then
        mList := TList.Create
      else
        mList.Clear;

      while not ZQ.Eof do
      begin
        rec := TMine_On_Board.Create;

        with rec.FMine_Def do
        begin
          Mine_Index := FieldByName('Mine_Index').AsInteger;
          Mine_Identifier := FieldByName('Mine_Identifier').AsString;
        end;

        with rec.FPI.FData do
        begin
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Instance_Name := FieldByName('Instance_Name').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
        end;

        mList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateMine_Def(rec: TMine_On_Board; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FMine_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Mine_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Mine_Identifier = ''' + Mine_Identifier + ''',');
      SQL.Add('Platform_Domain = ' + IntToStr(Platform_Domain) + ',');
      SQL.Add('Platform_Category = ' + IntToStr(Platform_Category) + ',');
      SQL.Add('Platform_Type = ' + IntToStr(Platform_Type) + ',');
      SQL.Add('Mine_Classification = ' + IntToStr(Mine_Classification) + ',');
      SQL.Add('Length = ' + FloatToStr(Length) + ',');
      SQL.Add('Width = ' + FloatToStr(Width) + ',');
      SQL.Add('Height = ' + FloatToStr(Height) + ',');
      SQL.Add('Mooring_Type = ' + IntToStr(Mooring_Type) + ',');
      SQL.Add('Max_Laying_Depth = ' + FloatToStr(Max_Laying_Depth) + ',');
      SQL.Add('Front_Acoustic_Cross = ' + FloatToStr(Front_Acoustic_Cross)
          + ',');
      SQL.Add('Side_Acoustic_Cross = ' + FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add('Mine_Lethality = ' + IntToStr(Mine_Lethality) + ',');
      SQL.Add('Engagement_Range = ' + FloatToStr(Engagement_Range) + ',');
      SQL.Add('Anti_Sur_Capable = ' + IntToStr(Anti_Sur_Capable) + ',');
      SQL.Add('Anti_SubSur_Capable = ' + IntToStr(Anti_SubSur_Capable) + ',');
      SQL.Add('Detectability_Type = ' + IntToStr(Detectability_Type));
    end;

    SQL.Add('WHERE (Mine_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertMine_Def(rec: TMine_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FMine_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Mine_Definition ');
      SQL.Add(
        '(Mine_Identifier,Platform_Domain,Platform_Category,Platform_Type,Mine_Classification,');
      SQL.Add(
        'Length,Width,Height,Mooring_Type,Max_Laying_Depth,Front_Acoustic_Cross,Side_Acoustic_Cross,');
      SQL.Add(
        'Mine_Lethality,Engagement_Range,Anti_Sur_Capable,Anti_SubSur_Capable,Detectability_Type)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Mine_Identifier + ''',');
      SQL.Add(IntToStr(Platform_Domain) + ',');
      SQL.Add(IntToStr(Platform_Category) + ',');
      SQL.Add(IntToStr(Platform_Type) + ',');
      SQL.Add(IntToStr(Mine_Classification) + ',');
      SQL.Add(FloatToStr(Length) + ',');
      SQL.Add(FloatToStr(Width) + ',');
      SQL.Add(FloatToStr(Height) + ',');
      SQL.Add(IntToStr(Mooring_Type) + ',');
      SQL.Add(FloatToStr(Max_Laying_Depth) + ',');
      SQL.Add(FloatToStr(Front_Acoustic_Cross) + ',');
      SQL.Add(FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add(IntToStr(Mine_Lethality) + ',');
      SQL.Add(FloatToStr(Engagement_Range) + ',');
      SQL.Add(IntToStr(Anti_Sur_Capable) + ',');
      SQL.Add(IntToStr(Anti_SubSur_Capable) + ',');
      SQL.Add(IntToStr(Detectability_Type) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Mine_Index FROM Mine_Definition ');
      SQL.Add('WHERE Mine_Identifier =' + quotedStr(Mine_Identifier));
      Open;

      with rec.FMine_Def do
      begin
        Mine_Index := FieldByName('Mine_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteMine_Def(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Mine_Definition ');
    SQL.Add('WHERE Mine_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateScriptWeapon(rec: TScripted_Weapon_Event;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Scripted_Weapon_Event ');
      SQL.Add('SET ');
      SQL.Add('List_Index =' + IntToStr(List_Index) + ',');
      SQL.Add('Salvo_Size =' + IntToStr(Salvo_Size) + ',');
      SQL.Add('Number_Layed =' + IntToStr(Number_Layed) + ',');
      SQL.Add('Distance_Between =' + FloatToStr(Distance_Between) + ',');
      SQL.Add('Mine_Depth =' + FloatToStr(Mine_Depth) + ',');
      SQL.Add('Target_Index =' + IntToStr(Target_Index) + ',');
      SQL.Add('Weapon_Type =' + IntToStr(Weapon_Type) + ',');
      SQL.Add('Point_Effect =' + IntToStr(Point_Effect) + ',');
      SQL.Add('Weapons_Mount =' + IntToStr(Weapons_Mount));
    end;

    SQL.Add(' WHERE (Scripted_Event_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateSeaState_On_Radar(rec: TSea_State_On_Radar;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Sea_State_On_Radar');
      SQL.Add('SET ');
      SQL.Add('Effect_on_Radar = ' + FloatToStr(Effect_on_Radar));
    end;

    SQL.Add('WHERE (Sea_State = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateFittedWeapon_Launch(rec: TFitted_Weap_Launcher_On_Board;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Fitted_Wep_Launcher_On_Board ');
      SQL.Add('SET ');
      SQL.Add('Launcher_Type =' + IntToStr(Launcher_Type) + ',');
      SQL.Add('Launcher_Angle_Required =' + IntToStr(Launcher_Angle_Required)
          + ',');
      SQL.Add('Launcher_Angle =' + IntToStr(Launcher_Angle) + ',');
      SQL.Add('Launcher_Max_Qty =' + IntToStr(Launcher_Max_Qty));
    end;

    SQL.Add(' WHERE (Fitted_Weap_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertFittedWeapon_Launcher(rec: TFitted_Weap_Launcher_On_Board)
  : Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add(
        'SET IDENTITY_INSERT Runtime_DB.[dbo].[Fitted_Weap_Launcher_On_Board] ON;');
      ExecSQL;

      SQL.Clear;
      SQL.Add('INSERT INTO Fitted_Weap_Launcher_On_Board ');
      SQL.Add(
        '(Fitted_Weap_Index,Launcher_Type,Launcher_Angle_Required,Launcher_Angle,Launcher_Max_Qty)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Fitted_Weap_Index) + ',');
      SQL.Add(IntToStr(Launcher_Type) + ',');
      SQL.Add(IntToStr(Launcher_Angle_Required) + ',');
      SQL.Add(IntToStr(Launcher_Angle) + ',');
      SQL.Add(IntToStr(Launcher_Max_Qty) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetAllHybrid_On_Board(const id: Integer;
  var aRec: TList): Integer;
var
  hybrid: THybrid_On_Board;
  missile_Blind: TBlind_Zone;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
//    SQL.Add('SELECT * FROM Fitted_Weapon_On_Board a ');
//    SQL.Add('inner JOIN Vehicle_Definition b ON a.Vehicle_Index = b.Vehicle_Index ');
//    SQL.Add('inner join Hybrid_Definition c on a.Hybrid_Index = c.Hybrid_Index ');
//    SQL.Add('inner join Missile_Definition d on c.Missile_Index = d.Missile_Index ');
//    SQL.Add('inner join Torpedo_Definition e on c.Torpedo_Index = e.Torpedo_Index ');
//    SQL.Add('WHERE (a.Vehicle_Index = ' + IntToStr(id) + ')');
//    SQL.Add(' and not (a.Hybrid_Index is null)');
//    SQL.Add(' ORDER BY a.Instance_Identifier');

    SQL.Add('SELECT a.Fitted_Weap_Index, a.Instance_Identifier,a.Instance_Type,');
    SQL.Add('a.Vehicle_Index, a.Mount_Type, a.Launch_Angle, a.Launch_Angle_Required,');
    SQL.Add('a.Quantity, a.Firing_Delay, a.Mine_Index, c.* FROM Fitted_Weapon_On_Board a ');
    SQL.Add('inner JOIN Vehicle_Definition b ON a.Vehicle_Index = b.Vehicle_Index ');
    SQL.Add('inner join Hybrid_Definition c on a.Hybrid_Index = c.Hybrid_Index ');
    SQL.Add('WHERE (a.Vehicle_Index = ' + IntToStr(id) + ')');
    SQL.Add(' and not (a.Hybrid_Index is null)');
    SQL.Add(' ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        hybrid := THybrid_On_Board.Create;

        with hybrid.FData do
        begin
          Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Mount_Type := FieldByName('Mount_Type').AsInteger;
          Launch_Angle := FieldByName('Launch_Angle').AsSingle;
          Launch_Angle_Required := FieldByName('Launch_Angle_Required')
            .AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
          Firing_Delay := FieldByName('Firing_Delay').AsSingle;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index := FieldByName('Mine_Index').AsInteger;
          Hybrid_Index := FieldByName('Hybrid_Index').AsInteger;
        end;

        with hybrid.FHybridData do
        begin
          Hybrid_Index := FieldByName('Hybrid_Index').AsInteger;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
        end;

        ZQ2.Close;
        ZQ2.SQL.Clear;
        ZQ2.SQL.Add('SELECT * FROM Torpedo_Definition a');
        ZQ2.SQL.Add('WHERE (a.Torpedo_Index = ' + IntToStr(hybrid.FHybridData.Torpedo_Index) + ')');
        ZQ2.Open;
        ZQ2.First;

        while not ZQ2.Eof do
        begin
          with hybrid.FTorpedo_Def do begin
            Torpedo_Index := ZQ2.FieldByName('Torpedo_Index').AsInteger;
            Class_Identifier := hybrid.FData.Instance_Identifier;
            Platform_Domain := ZQ2.FieldByName('Platform_Domain').AsInteger;
            Platform_Category := ZQ2.FieldByName('Platform_Category').AsInteger;
            Platform_Type := ZQ2.FieldByName('Platform_Type').AsInteger;
            Max_Range := ZQ2.FieldByName('Max_Range').AsSingle;
            Min_Range := ZQ2.FieldByName('Min_Range').AsSingle;
            Motion_Index := ZQ2.FieldByName('Motion_Index').AsInteger;
            Seeker_TurnOn_Range := ZQ2.FieldByName('Seeker_TurnOn_Range').AsSingle;
            Lethality := ZQ2.FieldByName('Lethality').AsInteger;
            Damage_Capacity := ZQ2.FieldByName('Damage_Capacity').AsInteger;
            Default_Depth := ZQ2.FieldByName('Default_Depth').AsSingle;
            Length := ZQ2.FieldByName('Length').AsSingle;
            Width := ZQ2.FieldByName('Width').AsSingle;
            Height := ZQ2.FieldByName('Height').AsSingle;
            Front_Acoustic_Cross := ZQ2.FieldByName('Front_Acoustic_Cross').AsSingle;
            Side_Acoustic_Cross := ZQ2.FieldByName('Side_Acoustic_Cross').AsSingle;
            LSpeed_Acoustic_Intens := ZQ2.FieldByName('LSpeed_Acoustic_Intens')
              .AsSingle;
            Below_Cav_Acoustic_Intens := ZQ2.FieldByName('Below_Cav_Acoustic_Intens')
              .AsSingle;
            Above_Cav_Acoustic_Intens := ZQ2.FieldByName('Above_Cav_Acoustic_Intens')
              .AsSingle;
            HSpeed_Acoustic_Intens := ZQ2.FieldByName('HSpeed_Acoustic_Intens')
              .AsSingle;
            Cavitation_Switch_Point := ZQ2.FieldByName('Cavitation_Switch_Point')
              .AsSingle;
            Term_Guide_Azimuth := ZQ2.FieldByName('Term_Guide_Azimuth').AsSingle;
            Term_Guide_Elevation := ZQ2.FieldByName('Term_Guide_Elevation').AsSingle;
            Term_Guide_Range := ZQ2.FieldByName('Term_Guide_Range').AsSingle;
            Pursuit_Guidance_Type := ZQ2.FieldByName('Pursuit_Guidance_Type')
              .AsInteger;
            Air_Drop_Capable := ZQ2.FieldByName('Air_Drop_Capable').AsInteger;
            Use_Terminal_Circle := ZQ2.FieldByName('Use_Terminal_Circle').AsInteger;
            Terminal_Circle_Radius := ZQ2.FieldByName('Terminal_Circle_Radius')
              .AsSingle;
            Fixed_Circle_Radius := ZQ2.FieldByName('Fixed_Circle_Radius').AsInteger;
            Lateral_Deceleration := ZQ2.FieldByName('Lateral_Deceleration').AsSingle;
            Airborne_Descent_Rate := ZQ2.FieldByName('Airborne_Descent_Rate').AsFloat;
            Wire_Angle_Offset := ZQ2.FieldByName('Wire_Angle_Offset').AsSingle;
            Guidance_Type := ZQ2.FieldByName('Guidance_Type').AsInteger;
            Anti_Sur_Capable := ZQ2.FieldByName('Anti_Sur_Capable').AsInteger;
            Anti_SubSur_Capable := ZQ2.FieldByName('Anti_SubSur_Capable').AsInteger;
            Primary_Target_Domain := ZQ2.FieldByName('Primary_Target_Domain')
              .AsInteger;
            Active_Acoustic_POH_Mod := ZQ2.FieldByName('Active_Acoustic_POH_Mod')
              .AsSingle;
            Passive_Acoustic_POH_Mod := ZQ2.FieldByName('Passive_Acoustic_POH_Mod')
              .AsSingle;
            Active_Passive_POH_Mod := ZQ2.FieldByName('Active_Passive_POH_Mod')
              .AsSingle;
            WireGuide_POH_Modifier := ZQ2.FieldByName('WireGuide_POH_Modifier')
              .AsSingle;
            WakeHome_POH_Modifier := ZQ2.FieldByName('WakeHome_POH_Modifier')
              .AsSingle;
            Active_Seeker_Power := ZQ2.FieldByName('Active_Seeker_Power').AsSingle;
            Active_Seeker_Freq := ZQ2.FieldByName('Active_Seeker_Freq').AsSingle;
            Engagement_Range := ZQ2.FieldByName('Engagement_Range').AsSingle;
            First_Relative_Gyro_Angle := ZQ2.FieldByName('First_Relative_Gyro_Angle')
              .AsInteger;
            Second_Relative_Gyro_Angle := ZQ2.FieldByName
              ('Second_Relative_Gyro_Angle')
              .AsInteger;
            Max_Torpedo_Gyro_Angle := ZQ2.FieldByName('Max_Torpedo_Gyro_Angle')
              .AsSingle;
            Max_Torpedo_Search_Depth := ZQ2.FieldByName('Max_Torpedo_Search_Depth')
              .AsSingle;
            Acoustic_Torp_Ceiling_Depth := ZQ2.FieldByName
              ('Acoustic_Torp_Ceiling_Depth').AsSingle;
            Fixed_Ceiling_Depth := ZQ2.FieldByName('Fixed_Ceiling_Depth').AsInteger;
            Fixed_Seeker_TurnOn_Range := ZQ2.FieldByName('Fixed_Seeker_TurnOn_Range')
              .AsInteger;
            Sinuation_Runout := ZQ2.FieldByName('Sinuation_Runout').AsInteger;
            Runout_Sinuation_Period := ZQ2.FieldByName('Runout_Sinuation_Period')
              .AsSingle;
            Runout_Sinuation_Amplitude := ZQ2.FieldByName
              ('Runout_Sinuation_Amplitude').AsSingle;
            Min_Runout_Range := ZQ2.FieldByName('Min_Runout_Range').AsSingle;
            Launch_Method := ZQ2.FieldByName('Launch_Method').AsInteger;
            Data_Entry_Method := ZQ2.FieldByName('Data_Entry_Method').AsInteger;
            Launch_Speed := ZQ2.FieldByName('Launch_Speed').AsInteger;
            Opt_Launch_Range_Nuc_Sub := ZQ2.FieldByName('Opt_Launch_Range_Nuc_Sub')
              .AsSingle;
            Opt_Launch_Range_Conv_Sub := ZQ2.FieldByName('Opt_Launch_Range_Conv_Sub')
              .AsSingle;
            Opt_Launch_Range_Other := ZQ2.FieldByName('Opt_Launch_Range_Other')
              .AsSingle;
            Detectability_Type := ZQ2.FieldByName('Detectability_Type').AsInteger;
          end;
          ZQ2.Next;
        end;

        ZQ2.Close;
        ZQ2.SQL.Clear;
        ZQ2.SQL.Add('SELECT * FROM Missile_Definition a');
        ZQ2.SQL.Add('WHERE (a.Missile_Index = ' + IntToStr
            (hybrid.FHybridData.Missile_Index) + ')');
        ZQ2.Open;
        ZQ2.First;

        while not ZQ2.Eof do
        begin
          with hybrid.FMissile_Def do begin
            Missile_Index := ZQ2.FieldByName('Missile_Index').AsInteger;
            Class_Identifier := ZQ2.FieldByName('Class_Identifier').AsString;
            Platform_Domain := ZQ2.FieldByName('Platform_Domain').AsInteger;
            Platform_Category := ZQ2.FieldByName('Platform_Category').AsInteger;
            Platform_Type := ZQ2.FieldByName('Platform_Type').AsInteger;
            Max_Range := ZQ2.FieldByName('Max_Range').AsSingle;
            Min_Range := ZQ2.FieldByName('Min_Range').AsSingle;
            Motion_Index := ZQ2.FieldByName('Motion_Index').AsInteger;
            Seeker_TurnOn_Range := ZQ2.FieldByName('Seeker_TurnOn_Range').AsSingle;
            Second_Seeker_Pattern_Capable := ZQ2.FieldByName
              ('Second_Seeker_Pattern_Capable').AsInteger;
            Seeker_Bias_Capable := ZQ2.FieldByName('Seeker_Bias_Capable').AsInteger;
            Fixed_Seeker_Turn_On_Range := ZQ2.FieldByName
              ('Fixed_Seeker_Turn_On_Range')
              .AsInteger;
            Lethality := ZQ2.FieldByName('Lethality').AsInteger;
            Prob_of_Hit := ZQ2.FieldByName('Prob_of_Hit').AsSingle;
            Damage_Capacity := ZQ2.FieldByName('Damage_Capacity').AsInteger;
            Default_Altitude := ZQ2.FieldByName('Default_Altitude').AsSingle;
            Length := ZQ2.FieldByName('Length').AsSingle;
            Width := ZQ2.FieldByName('Width').AsSingle;
            Height := ZQ2.FieldByName('Height').AsSingle;
            Front_Radar_Cross := ZQ2.FieldByName('Front_Radar_Cross').AsSingle;
            Side_Radar_Cross := ZQ2.FieldByName('Side_Radar_Cross').AsSingle;
            Front_Visual_Cross := ZQ2.FieldByName('Front_Visual_Cross').AsSingle;
            Side_Visual_Cross := ZQ2.FieldByName('Side_Visual_Cross').AsSingle;
            Front_Infrared_Cross := ZQ2.FieldByName('Front_Infrared_Cross').AsSingle;
            Side_Infrared_Cross := ZQ2.FieldByName('Side_Infrared_Cross').AsSingle;
            Pursuit_Guide_Type := ZQ2.FieldByName('Pursuit_Guide_Type').AsInteger;
            Primary_Guide_Type := ZQ2.FieldByName('Primary_Guide_Type').AsInteger;
            Secondary_Guide_Type := ZQ2.FieldByName('Secondary_Guide_Type').AsInteger;
            Anti_Air_Capable := ZQ2.FieldByName('Anti_Air_Capable').AsInteger;
            Anti_Sur_Capable := ZQ2.FieldByName('Anti_Sur_Capable').AsInteger;
            Anti_SubSur_Capable := ZQ2.FieldByName('Anti_SubSur_Capable').AsInteger;
            Anti_Land_Capable := ZQ2.FieldByName('Anti_Land_Capable').AsInteger;
            Primary_Target_Domain := ZQ2.FieldByName('Primary_Target_Domain')
              .AsInteger;
            SARH_POH_Modifier := ZQ2.FieldByName('SARH_POH_Modifier').AsSingle;
            CG_POH_Modifier := ZQ2.FieldByName('CG_POH_Modifier').AsSingle;
            TARH_POH_Modifier := ZQ2.FieldByName('TARH_POH_Modifier').AsSingle;
            IR_POH_Modifier := ZQ2.FieldByName('IR_POH_Modifier').AsSingle;
            AR_POH_Modifier := ZQ2.FieldByName('AR_POH_Modifier').AsSingle;
            Transmitted_Frequency := ZQ2.FieldByName('Transmitted_Frequency').AsFloat;
            Scan_Rate := ZQ2.FieldByName('Scan_Rate').AsSingle;
            Pulse_Rep_Freq := ZQ2.FieldByName('Pulse_Rep_Freq').AsSingle;
            Pulse_Width := ZQ2.FieldByName('Pulse_Width').AsSingle;
            Xmit_Power := ZQ2.FieldByName('Xmit_Power').AsSingle;
            TARH_Jamming_A_Probability := ZQ2.FieldByName
              ('TARH_Jamming_A_Probability').AsSingle;
            TARH_Jamming_B_Probability := ZQ2.FieldByName
              ('TARH_Jamming_B_Probability').AsSingle;
            TARH_Jamming_C_Probability := ZQ2.FieldByName
              ('TARH_Jamming_C_Probability').AsSingle;
            Wpt_Capable := ZQ2.FieldByName('Wpt_Capable').AsInteger;
            Max_Num_Wpts := ZQ2.FieldByName('Max_Num_Wpts').AsInteger;
            Min_Final_Leg_Length := ZQ2.FieldByName('Min_Final_Leg_Length').AsSingle;
            Engagement_Range := ZQ2.FieldByName('Engagement_Range').AsSingle;
            Max_Firing_Depth := ZQ2.FieldByName('Max_Firing_Depth').AsSingle;
            Upper_Received_Freq := ZQ2.FieldByName('Upper_Received_Freq').AsFloat;
            Lower_Received_Freq := ZQ2.FieldByName('Lower_Received_Freq').AsFloat;
            Fly_Out_Required := ZQ2.FieldByName('Fly_Out_Required').AsInteger;
            Fly_Out_Range := ZQ2.FieldByName('Fly_Out_Range').AsSingle;
            Fly_Out_Altitude := ZQ2.FieldByName('Fly_Out_Altitude').AsSingle;
            Booster_Separation_Required := ZQ2.FieldByName
              ('Booster_Separation_Required').AsInteger;
            Booster_Separation_Range := ZQ2.FieldByName('Booster_Separation_Range')
              .AsSingle;
            Booster_Separation_Box_Width := ZQ2.FieldByName
              ('Booster_Separation_Box_Width').AsSingle;
            Booster_Separation_Box_Length := ZQ2.FieldByName
              ('Booster_Separation_Box_Length').AsSingle;
            Term_Guide_Azimuth := ZQ2.FieldByName('Term_Guide_Azimuth').AsSingle;
            Term_Guide_Elevation := ZQ2.FieldByName('Term_Guide_Elevation').AsSingle;
            Term_Guide_Range := ZQ2.FieldByName('Term_Guide_Range').AsSingle;
            Terminal_Guidance_Capability := ZQ2.FieldByName
              ('Terminal_Guidance_Capability').AsInteger;
            Terminal_Altitude_Required := ZQ2.FieldByName
              ('Terminal_Altitude_Required')
              .AsInteger;
            Terminal_Acquisition_Altitude := ZQ2.FieldByName
              ('Terminal_Acquisition_Altitude').AsSingle;
            Terminal_Sinuation_Start_Range := ZQ2.FieldByName
              ('Terminal_Sinuation_Start_Range').AsSingle;
            Terminal_Sinuation_Period := ZQ2.FieldByName('Terminal_Sinuation_Period')
              .AsSingle;
            Terminal_Sinuation_Amplitude := ZQ2.FieldByName
              ('Terminal_Sinuation_Amplitude').AsSingle;
            Terminal_Pop_Up_Range := ZQ2.FieldByName('Terminal_Pop_Up_Range')
              .AsSingle;
            Terminal_Pop_Up_Altitude := ZQ2.FieldByName('Terminal_Pop_Up_Altitude')
              .AsSingle;
            Mid_Course_Update_Mode := ZQ2.FieldByName('Mid_Course_Update_Mode')
              .AsInteger;
            Home_On_Jam_Type_A_Capable := ZQ2.FieldByName
              ('Home_On_Jam_Type_A_Capable')
              .AsInteger;
            Home_On_Jam_Type_B_Capable := ZQ2.FieldByName
              ('Home_On_Jam_Type_B_Capable')
              .AsInteger;
            Home_On_Jam_Type_C_Capable := ZQ2.FieldByName
              ('Home_On_Jam_Type_C_Capable')
              .AsInteger;
            Launch_Method := ZQ2.FieldByName('Launch_Method').AsInteger;
            Data_Entry_Method := ZQ2.FieldByName('Data_Entry_Method').AsInteger;
            Launch_Speed := ZQ2.FieldByName('Launch_Speed').AsInteger;
            Max_Target_Altitude_Delta := ZQ2.FieldByName('Max_Target_Altitude_Delta')
              .AsInteger;
            Term_Guide_Azimuth_Narrow := ZQ2.FieldByName('Term_Guide_Azimuth_Narrow')
              .AsSingle;
            Term_Guide_Elevation_Narrow := ZQ2.FieldByName
              ('Term_Guide_Elevation_Narrow').AsSingle;
            Term_Guide_Range_Narrow := ZQ2.FieldByName('Term_Guide_Range_Narrow')
              .AsSingle;
            Spot_Number := ZQ2.FieldByName('Spot_Number').AsInteger;
            ECCM_Type := ZQ2.FieldByName('ECCM_Type').AsInteger;
            ECM_Detonation := ZQ2.FieldByName('ECM_Detonation').AsInteger;
            ECM_Detection := ZQ2.FieldByName('ECM_Detection').AsInteger;
            Detectability_Type := ZQ2.FieldByName('Detectability_Type').AsInteger;
            IRCM_Detonation := ZQ2.FieldByName('IRCM_Detonation').AsInteger;
            IRCM_Detection := ZQ2.FieldByName('IRCM_Detection').AsInteger;
            Sea_State_Modelling_Capable := ZQ2.FieldByName
              ('Sea_State_Modelling_Capable').AsInteger;
          end;
          ZQ2.Next;
        end;


        ZQ2.Close;
        ZQ2.SQL.Clear;
        ZQ2.SQL.Add('SELECT * ');
        ZQ2.SQL.Add('FROM Fitted_Weapon_On_Board a JOIN Blind_Zone_Definition b ');
        ZQ2.SQL.Add('ON a.Fitted_Weap_Index = b.Fitted_Weap_Index ');
        ZQ2.SQL.Add('WHERE (a.Fitted_Weap_Index = ' + IntToStr
            (hybrid.FData.Fitted_Weap_Index) + ')');
        ZQ2.Open;
        ZQ2.First;

        while not ZQ2.Eof do
        begin
          missile_Blind := TBlind_Zone.Create;

          with missile_Blind.FData do
          begin
            Blind_Zone_Index  := ZQ2.FieldByName('Blind_Zone_Index').AsInteger;
            Blind_Zone_Type   := ZQ2.FieldByName('Blind_Zone_Type').AsInteger;
            Fitted_Weap_Index := ZQ2.FieldByName('Fitted_Weap_Index').AsInteger;
            Start_Angle       := ZQ2.FieldByName('Start_Angle').AsSingle;
            End_Angle         := ZQ2.FieldByName('End_Angle').AsSingle;
          end;

          hybrid.FBlind.Add(missile_Blind);
          ZQ2.Next;
        end;

        aRec.Add(hybrid);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetPOHHybrid(const id: Integer; var Poh: TList): Integer;
var
  aspect_POH  : TTorpedo_POH_Modifier;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  ZQ2.Close;
  ZQ2.SQL.Clear;
  ZQ2.SQL.Add('SELECT a.Torpedo_Index, a.Aspect_Angle, a.POH_Modifier ');
  ZQ2.SQL.Add('FROM Torpedo_POH_Modifier a JOIN Torpedo_Definition b ');
  ZQ2.SQL.Add('ON a.Torpedo_Index = b.Torpedo_Index ');
  ZQ2.SQL.Add('WHERE (a.Torpedo_Index = ' + IntToStr
      (id) + ')');
  ZQ2.Open;

  result := ZQ2.RecordCount;
  if not ZQ2.IsEmpty then
  begin
    ZQ2.First;

    if not Assigned(Poh) then
      Poh := TList.Create
    else
      Poh.Clear;

    while not ZQ2.Eof do
    begin
      aspect_POH := TTorpedo_POH_Modifier.Create;

      with aspect_POH.FData do
      begin
        Torpedo_Index := ZQ2.FieldByName('Torpedo_Index').AsInteger;
        Aspect_Angle  := ZQ2.FieldByName('Aspect_Angle').AsInteger;
        POH_Modifier  := ZQ2.FieldByName('POH_Modifier').AsFloat;
      end;

      Poh.Add(aspect_POH);
      ZQ2.Next;
    end;
  end;
end;

// ------------------------------------------------------------------------------

procedure TdmTTT.updateRecTimeStop(RecordIdx: Integer; gameTime: TDateTime);
var
  query : string;
  num : integer;
begin

  query := 'Update record set GameTimeStop=:timestop where Record_index=:id';

  with ZQ do begin
    ParamCheck := True;
    SQL.Clear;
    SQL.Add(query);
    Params.ParamByName('id').Value := RecordIdx;
    Params.ParamByName('Timestop').Value := gametime;
    ExecSQL;
  end;
end;

function TdmTTT.updateReference(rec: TRecReference_Point; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Reference_Point ');
      SQL.Add('SET ');
      SQL.Add('Reference_Identifier =''' + Reference_Identifier + ''',');
      SQL.Add('Reference_Index =' + IntToStr(Reference_Index) + ',');
      SQL.Add('Force_Designation =' + IntToStr(Force_Designation) + ',');
      SQL.Add('Track_Type =' + IntToStr(Track_Type) + ',');
      SQL.Add('Symbol_Type =' + IntToStr(Symbol_Type) + ',');
      SQL.Add('Course =' + FloatToStr(Course) + ',');
      SQL.Add('Speed =' + FloatToStr(Speed) + ',');
      SQL.Add('X_Position =' + FloatToStr(X_Position) + ',');
      SQL.Add('Y_Position =' + FloatToStr(Y_Position) + ',');
      SQL.Add('Latitude =' + FloatToStr(Latitude) + ',');
      SQL.Add('Longitude =' + FloatToStr(Longitude) + ',');
      SQL.Add('Track_Bearing =' + FloatToStr(Track_Bearing) + ',');
      SQL.Add('AOP_Start_Time_Offset =' + IntToStr(AOP_Start_Time_Offset));
    end;

    SQL.Add(' WHERE (Resource_Alloc_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertReference(rec: TRecReference_Point): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Reference_Point] ON;');
      ExecSQL;

      SQL.Clear;
      SQL.Add('INSERT INTO Reference_Point ');
      SQL.Add(
        '(Resource_Alloc_Index,Reference_Identifier,Reference_Index,Force_Designation,Track_Type,Symbol_Type,');
      SQL.Add(
        'Course,Speed,X_Position,Y_Position,Latitude,Longitude,Track_Bearing,AOP_Start_Time_Offset)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
      SQL.Add('''' + Reference_Identifier + ''',');
      SQL.Add(IntToStr(Force_Designation) + ',');
      SQL.Add(IntToStr(Track_Type) + ',');
      SQL.Add(IntToStr(Symbol_Type) + ',');
      SQL.Add(FloatToStr(Course) + ',');
      SQL.Add(FloatToStr(Speed) + ',');
      SQL.Add(FloatToStr(X_Position) + ',');
      SQL.Add(FloatToStr(Y_Position) + ',');
      SQL.Add(FloatToStr(Latitude) + ',');
      SQL.Add(FloatToStr(Longitude) + ',');
      SQL.Add(FloatToStr(Track_Bearing) + ',');
      SQL.Add(IntToStr(AOP_Start_Time_Offset) + ')');
      ExecSQL;
    end;
  end;
end;

function TdmTTT.getAllReference_Point(const ra_id: integer;
      var aRec: TList): Integer;
var rec: TReference_Point;
begin
  result := -1;

  if not zConn.Connected then Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Reference_Point ' );
    SQL.Add('WHERE (Resource_Alloc_Index = ' +  IntToStr(ra_id) + ') ' );
    //    SQL.Add('AND (Force_Designation = ' +  IntToStr(force) + ')' );
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TReference_Point.Create;

        with rec.FData do begin
          Reference_Index         := FieldByName('Reference_Index').AsInteger;
          Resource_Alloc_Index    := FieldByName('Resource_Alloc_Index').AsInteger;
          Reference_Identifier    := FieldByName('Reference_Identifier').AsString;
          Force_Designation       := FieldByName('Force_Designation').AsInteger;
          Track_Type              := FieldByName('Track_Type').AsInteger;
          Symbol_Type             := FieldByName('Symbol_Type').AsInteger;
          Course                  := FieldByName('Course').AsSingle;
          Speed                   := FieldByName('Speed').AsSingle;
          X_Position              := FieldByName('X_Position').AsSingle;
          Y_Position              := FieldByName('Y_Position').AsSingle;
          Latitude                := FieldByName('Latitude').AsFloat;
          Longitude               := FieldByName('Longitude').AsFloat;
          Track_Bearing           := FieldByName('Track_Bearing').AsSingle;
          AOP_Start_Time_Offset   := FieldByName('AOP_Start_Time_Offset').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

function TdmTTT.GetExternal_Communication_Channel(var aRec: TList;
  const ra_id, com_id: string; var rec: TExternal_Communication_Channel)
  : Integer;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM External_Communication_Channel WHERE ');
    if ra_id <> '' then
       SQL.Add('(Resource_Alloc_Index = ' + ra_id + ')')
    else
    if com_id <> '' then
       SQL.Add('(Comms_Channel_Index = ' + com_id + ')');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TExternal_Communication_Channel.Create;

        with rec.FData do
        begin
          Comms_Channel_Index := FieldByName('Comms_Channel_Index').AsInteger;
          Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
          Channel_Number := FieldByName('Channel_Number').AsInteger;
          Channel_Identifier := FieldByName('Channel_Identifier').AsString;
          Comms_Band := FieldByName('Comms_Band').AsInteger;
          Channel_Freq := FieldByName('Channel_Freq').AsFloat;
          Channel_Security := FieldByName('Channel_Security').AsInteger;
          Channel_Code := FieldByName('Channel_Code').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

function TdmTTT.GetExternal_Communication_ChannelByGroupID(var aRec: TList;
  id: string): Integer;
var
 Rec: TExternal_Communication_Channel;
begin
  result := -1;
  if not zConn.Connected then Exit;

  with ZQ do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT a.*, b.* ');
    SQL.Add('FROM Cubicle_Group_Channel_Assgnmnt a, External_Communication_Channel b ');
    SQL.Add('WHERE a.Group_Index='+ id + ' and a.comms_channel_index=b.Comms_Channel_Index');
    Open;

    result := RecordCount;
    if not IsEmpty then begin
      First;

      if not Assigned(aRec) then
        aRec := Tlist.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TExternal_Communication_Channel.Create;
        with rec.FData do begin
          Resource_Alloc_Index    := FieldByName('Resource_Alloc_Index').AsInteger;
          Comms_Channel_Index     := FieldByName('Comms_Channel_Index').AsInteger;
          Channel_Identifier      := FieldByName('Channel_Identifier').AsString;
          Channel_Number          := FieldByName('Channel_Number').AsInteger;
          Channel_Code            := FieldByName('Channel_Code').AsString;
          Channel_Freq            := FieldByName('Channel_Freq').AsFloat;
          Comms_Band              := FieldByName('Comms_Band').AsInteger;
          Channel_Security        := FieldByName('Channel_Security').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

function TdmTTT.GetExternal_Communication_ChannelBySceID(var aRec: TList;
  id: string): Integer;
var
 Rec: TExternal_Communication_Channel;
begin
  result := -1;
  if not zConn.Connected then Exit;

  with ZQ do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT a.Scenario_Index, b.* ');
    SQL.Add('FROM Scenario_Definition a, External_Communication_Channel b ');
    SQL.Add('WHERE a.Scenario_Index='+ id + ' and a.Resource_Alloc_Index = b.Resource_Alloc_Index');
    Open;

    result := RecordCount;
    if not IsEmpty then begin
      First;

      if not Assigned(aRec) then
        aRec := Tlist.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TExternal_Communication_Channel.Create;
        with rec.FData do begin
          Resource_Alloc_Index    := FieldByName('Resource_Alloc_Index').AsInteger;
          Comms_Channel_Index     := FieldByName('Comms_Channel_Index').AsInteger;
          Channel_Identifier      := FieldByName('Channel_Identifier').AsString;
          Channel_Number          := FieldByName('Channel_Number').AsInteger;
          Channel_Code            := FieldByName('Channel_Code').AsString;
          Channel_Freq            := FieldByName('Channel_Freq').AsFloat;
          Comms_Band              := FieldByName('Comms_Band').AsInteger;
          Channel_Security        := FieldByName('Channel_Security').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

function TdmTTT.updateComm(rec: TRecExternal_Communication_Channel;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE External_Communication_Channel ');
      SQL.Add('SET ');
      SQL.Add('Channel_Identifier =''' + Channel_Identifier + ''',');
      SQL.Add('Resource_Alloc_Index =' + IntToStr(Resource_Alloc_Index) + ',');
      SQL.Add('Channel_Number =' + IntToStr(Channel_Number) + ',');
      SQL.Add('Comms_Band =' + IntToStr(Comms_Band) + ',');
      SQL.Add('Channel_Freq =' + FloatToStr(Channel_Freq) + ',');
      SQL.Add('Channel_Security =' + FloatToStr(Channel_Security) + ',');
      SQL.Add('Channel_Code =''' + Channel_Code + '''');
    end;

    SQL.Add(' WHERE (Comms_Channel_Index = ' + id + ')');
    ExecSQL;
  end;
end;

function TdmTTT.insertComm(rec: TRecExternal_Communication_Channel): Integer;
begin
  result := -1;
  with ZQ do
  begin
    with rec do
    begin
      Close;
      SQL.Clear;
      // SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[External_Communication_Channel] ON;');
      // ExecSQL;
      // SQL.Clear;
      SQL.Add('INSERT INTO External_Communication_Channel ');
      SQL.Add(
        '(Channel_Identifier,Resource_Alloc_Index,Channel_Number,Comms_Band,Channel_Freq,Channel_Security,Channel_Code)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Channel_Identifier + ''',');
      SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
      SQL.Add(IntToStr(Channel_Number) + ',');
      SQL.Add(IntToStr(Comms_Band) + ',');
      SQL.Add(FloatToStr(Channel_Freq) + ',');
      SQL.Add(IntToStr(Channel_Security) + ',');
      SQL.Add('''' + Channel_Code + ''')');
      ExecSQL;
    end;
  end;
end;

function TdmTTT.DeleteExternal_Communication_Channel(const id: string): Integer;
begin
  result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM External_Communication_Channel  ');
    SQL.Add('WHERE (Comms_Channel_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------
// ==Vehicle detail 3. CounterMeasure  ==========================================
// ------------------------------------------------------------------------------
function TdmTTT.getAllAcoustic_Decoy_On_Board(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TAcoustic_Decoy_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add
      ('FROM  Acoustic_Decoy_On_Board a JOIN Acoustic_Decoy_Definition b	');
    SQL.Add('ON a.Decoy_Index = b.Decoy_Index LEFT JOIN Note_Storage c ');
    SQL.Add('ON c.Decoy_Index = b.Decoy_Index');
    SQL.Add(' WHERE (a.Vehicle_Index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TAcoustic_Decoy_On_Board.Create;

        with rec.FData do
        begin
          Acoustic_Instance_Index := FieldByName('Acoustic_Instance_Index')
            .AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Decoy_Index := FieldByName('Decoy_Index').AsInteger;
        end;

        with rec.FAccousticDecoy_Def do
        begin
          Decoy_Index := FieldByName('Decoy_Index').AsInteger;
          Decoy_Identifier := FieldByName('Decoy_Identifier').AsString;
          Acoustic_Intensity_Increase := FieldByName
            ('Acoustic_Intensity_Increase').AsSingle;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getAccoustic_Decoy_On_Board(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TAcoustic_Decoy_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT a.Instance_Identifier,a.Acoustic_Instance_Index, ');
    SQL.Add('a.Quantity,a.Vehicle_Index,a.Decoy_Index ');
    SQL.Add
      ('FROM  Acoustic_Decoy_On_Board a JOIN Acoustic_Decoy_Definition b	');
    SQL.Add('ON a.Decoy_Index = b.Decoy_Index LEFT JOIN Note_Storage c ');
    SQL.Add('ON c.Decoy_Index = b.Decoy_Index ');
    SQL.Add(' WHERE (a.Vehicle_Index = ' + IntToStr(id) + ') ');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TAcoustic_Decoy_On_Board.Create;

        with rec.FData do
        begin
          Acoustic_Instance_Index := FieldByName('Acoustic_Instance_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Quantity                := FieldByName('Quantity').AsInteger;
          Vehicle_Index           := FieldByName('Vehicle_Index').AsInteger;
          Decoy_Index             := FieldByName('Decoy_Index').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getAccoustic_Decoy(const id: Integer; var aRec: TList;
  var rec: TAcoustic_Decoy_On_Board): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Acoustic_Decoy_Definition ';
    if id <> 0 then
       ssql := ssql + 'WHERE Decoy_Index =' + IntToStr(id);
    ssql := ssql + ' ORDER BY Decoy_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TAcoustic_Decoy_On_Board.Create;

        with rec.FAccousticDecoy_Def do
        begin
          Decoy_Index := FieldByName('Decoy_Index').AsInteger;
          Decoy_Identifier := FieldByName('Decoy_Identifier').AsString;
          Acoustic_Intensity_Increase := FieldByName
            ('Acoustic_Intensity_Increase').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateAcoustic_Decoy_Def(rec: TAcoustic_Decoy_On_Board;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FAccousticDecoy_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Acoustic_Decoy_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Decoy_Identifier = ''' + Decoy_Identifier + ''',');
      SQL.Add('Acoustic_Intensity_Increase = ' + FloatToStr
             (Acoustic_Intensity_Increase));
    end;

    SQL.Add('WHERE (Decoy_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertAcoustic_Decoy_Def(rec: TAcoustic_Decoy_On_Board)
  : Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FAccousticDecoy_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Acoustic_Decoy_Definition ');
      SQL.Add('(Decoy_Identifier,Acoustic_Intensity_Increase)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Decoy_Identifier + ''',');
      SQL.Add(FloatToStr(Acoustic_Intensity_Increase) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Decoy_Index FROM Acoustic_Decoy_Definition ');
      SQL.Add('WHERE Decoy_Identifier=' + quotedStr(Decoy_Identifier));
      Open;
      with rec.FAccousticDecoy_Def do
      begin
        Decoy_Index := FieldByName('Decoy_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.CekPlottingInsert(aName: string): Boolean;
begin
  Result := false;

  if not ZConn.Connected  then
    Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Plotting_Definition');
    SQL.Add('WHERE Plotting_Name = '+ QuotedStr(aName));
    Open;

    Result := RecordCount > 0;
  end;
end;

function TdmTTT.CekScenarioNameAlreadyExist(const aName: string): Boolean;
begin
  Result := False;
  with ZQ do
  begin

    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Scenario_Definition');
    SQL.Add('WHERE Scenario_Identifier = '+ QuotedStr(aName));

    Open;

    result := RecordCount > 0;
  end;
end;

function TdmTTT.checkOverlayName(aName: string): Boolean;
begin
  result := False;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM OVERLAY_DEFINITION');
    SQL.Add('WHERE Overlay_Filename = '+ QuotedStr(aName));
    Open;

    if RecordCount > 0 then
      Result :=False
    else
      Result := True;

  end;
end;

function TdmTTT.checkOverlayNameScenario(aIdx: Integer): Boolean;
begin
result := False;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Resource_Overlay_Mapping');
    SQL.Add('WHERE Overlay_Index = '+ Inttostr(aIdx));
    Open;

    if RecordCount > 0 then
      Result :=False
    else
      Result := True;
  end;
end;

function TdmTTT.getOverlayIndex(aName: String; aType: integer): Integer;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT  Overlay_Index FROM Overlay_Definition');
    SQL.Add('Where (Overlay_Identifier  = ' +  QuotedStr(aName) + ') AND ');
    SQL.Add('(Static_Overlay = '+ IntToStr(atype)+')');

    Open;

    if not IsEmpty then
    begin
      Result := FieldByName('Overlay_Index').AsInteger;
    end;
  end;
end;

function TdmTTT.deleteAccoustic_Decoy_Def(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Acoustic_Decoy_Definition ');
    SQL.Add('WHERE Decoy_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.UpdateAcoustic_Decoy_On_Board(const id: string;
  var rec: TAcoustic_Decoy_On_Board): integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Acoustic_Decoy_On_Board  ');
      SQL.Add('SET ' );
      SQL.Add('Instance_Identifier = '+ QuotedStr(Instance_Identifier)+',');
      SQL.Add('Instance_Type = '+IntToStr(Instance_Type)+',');
      SQL.Add('Quantity = '+IntToStr(Quantity)+',');
      SQL.Add('Vehicle_Index = '+IntToStr(Vehicle_Index)+',');
      SQL.Add('Decoy_Index = '+IntToStr(Decoy_Index)+' ');
    end;

    SQL.Add('WHERE (Acoustic_Instance_Index = ' +  id + ')' );
    ExecSQL;
  end;
end;

/// /====================================================
function TdmTTT.InsertAcoustic_Decoy_On_Board(var rec: TAcoustic_Decoy_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Acoustic_Decoy_On_Board  ');
      SQL.Add('(Instance_Identifier,Instance_Type,Quantity,Vehicle_Index,Decoy_Index)');
      SQL.Add('VALUES ( ');
      SQL.Add(QuotedStr(Instance_Identifier) + ',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Quantity) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Decoy_Index) + ')');
    end;

    ExecSQL;
  end;
end;

//====================================================

function TdmTTT.DeleteAcoustic_Decoy_On_Board(const id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Acoustic_Decoy_On_Board  ');
    SQL.Add('WHERE (Acoustic_Instance_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.getAllAir_Bubble_Mount(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TAir_Bubble_Mount;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Air_Bubble_Mount a JOIN Air_Bubble_Definition b ');
    SQL.Add(
      'ON a.Air_Bubble_Index = b.Air_Bubble_Index LEFT JOIN Note_Storage c');
    SQL.Add('ON c.Air_Bubble_Index = b.Air_Bubble_Index ');
    SQL.Add('WHERE (a.Vehicle_index = ' + IntToStr(id) + ') ');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TAir_Bubble_Mount.Create;

        with rec.FData do
        begin
          Air_Bubble_Instance_Index := FieldByName('Air_Bubble_Instance_Index')
            .AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Bubble_Qty_On_Board := FieldByName('Bubble_Qty_On_Board').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Air_Bubble_Index := FieldByName('Air_Bubble_Index').AsInteger;
        end;

        with rec.FAirBubble_Def do
        begin
          Air_Bubble_Index := FieldByName('Air_Bubble_Index').AsInteger;
          Air_Bubble_Identifier := FieldByName('Air_Bubble_Identifier')
            .AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Max_Acoustic_Cross := FieldByName('Max_Acoustic_Cross').AsSingle;
          Dissipation_Time := FieldByName('Dissipation_Time').AsSingle;
          Ascent_Rate := FieldByName('Ascent_Rate').AsSingle;
          Descent_Rate := FieldByName('Descent_Rate').AsSingle;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getAir_Buble_Mount(const id: Integer; var aRec: TList):integer;
var
  //i: Integer;
  rec: TAir_Bubble_Mount;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT a.Instance_Identifier,a.Air_Bubble_Instance_Index, ');
    SQL.Add('a.Vehicle_Index,a.Bubble_Qty_On_Board,a.Air_Bubble_Index ');
    SQL.Add('FROM  Air_Bubble_Mount a JOIN Air_Bubble_Definition b ');
    SQL.Add(
      'ON a.Air_Bubble_Index = b.Air_Bubble_Index LEFT JOIN Note_Storage c');
    SQL.Add('ON c.Air_Bubble_Index = b.Air_Bubble_Index ');
    SQL.Add('WHERE (a.Vehicle_index = ' + IntToStr(id) + ') ');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TAir_Bubble_Mount.Create;

        with rec.FData do
        begin
          Air_Bubble_Instance_Index := FieldByName('Air_Bubble_Instance_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Vehicle_Index       := FieldByName('Vehicle_Index').AsInteger;
          Bubble_Qty_On_Board := FieldByName('Bubble_Qty_On_Board').AsInteger;
          Air_Bubble_Index    := FieldByName('Air_Bubble_Index').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getAir_Bubble_Def(const id: Integer; var aRec: TList;
  var rec: TAir_Bubble_Mount): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Air_Bubble_Definition ';
    if id <> 0 then
      ssql := ssql + 'WHERE Air_Bubble_Index =' + IntToStr(id);
    ssql := ssql + ' ORDER BY Air_Bubble_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TAir_Bubble_Mount.Create;

        with rec.FAirBubble_Def do
        begin
          Air_Bubble_Index := FieldByName('Air_Bubble_Index').AsInteger;
          Air_Bubble_Identifier := FieldByName('Air_Bubble_Identifier')
            .AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Max_Acoustic_Cross := FieldByName('Max_Acoustic_Cross').AsSingle;
          Dissipation_Time := FieldByName('Dissipation_Time').AsSingle;
          Ascent_Rate := FieldByName('Ascent_Rate').AsSingle;
          Descent_Rate := FieldByName('Descent_Rate').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function TdmTTT.updateAir_Bubble(rec: TAir_Bubble_Mount; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Air_Bubble_Mount ');
      SQL.Add('SET ');
      SQL.Add('Air_Bubble_Index =' + IntToStr
          (Air_Bubble_Index) + ',');
      SQL.Add('Instance_Identifier =''' + Instance_Identifier + ''',');
      SQL.Add('Instance_Type =' + IntToStr(Instance_Type) + ',');
      SQL.Add('Bubble_Qty_On_Board =' + IntToStr(Bubble_Qty_On_Board) + ',');
      SQL.Add('Vehicle_Index =' + IntToStr(Vehicle_Index));
      SQL.Add(' WHERE (Air_Bubble_Instance_Index = ' + id + ')');
    end;

    ShowMessage(SQL.Text);
    ExecSQL;
  end;
end;

// -----------------------------------------------------------------------------

function TdmTTT.insertAir_Bubble(rec: TAir_Bubble_Mount): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Air_Bubble_Mount ');
      SQL.Add(
        '(Instance_Identifier,Instance_Type,Bubble_Qty_On_Board,');
      SQL.Add('Vehicle_Index,Air_Bubble_Index)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Instance_Identifier + ''',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Bubble_Qty_On_Board) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Air_Bubble_Index) + ')');
      ExecSQL;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function TdmTTT.DeleteAir_Bubble_Mount(const id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Air_Bubble_Mount  ');
    SQL.Add('WHERE (Air_Bubble_Instance_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.updateAir_Bubble_Def(rec: TAir_Bubble_Mount;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FAirBubble_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Air_Bubble_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Air_Bubble_Identifier = ''' + Air_Bubble_Identifier + ''',');
      SQL.Add('Platform_Domain = ' + IntToStr(Platform_Domain) + ',');
      SQL.Add('Platform_Category = ' + IntToStr(Platform_Category) + ',');
      SQL.Add('Platform_Type = ' + IntToStr(Platform_Type) + ',');
      SQL.Add('Max_Acoustic_Cross = ' + FloatToStr(Max_Acoustic_Cross) + ',');
      SQL.Add('Dissipation_Time = ' + FloatToStr(Dissipation_Time) + ',');
      SQL.Add('Ascent_Rate = ' + FloatToStr(Ascent_Rate) + ',');
      SQL.Add('Descent_Rate = ' + FloatToStr(Descent_Rate));
    end;

    SQL.Add('WHERE (Air_Bubble_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// -----------------------------------------------------------------------------

function TdmTTT.insertAir_Bubble_Def(rec: TAir_Bubble_Mount): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FAirBubble_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Air_Bubble_Definition ');
      SQL.Add('(Air_Bubble_Identifier,Platform_Domain,Platform_Category,');
      SQL.Add(
        'Platform_Type,Max_Acoustic_Cross,Dissipation_Time,Ascent_Rate,Descent_Rate)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Air_Bubble_Identifier + ''',');
      SQL.Add(IntToStr(Platform_Domain) + ',');
      SQL.Add(IntToStr(Platform_Category) + ',');
      SQL.Add(IntToStr(Platform_Type) + ',');
      SQL.Add(FloatToStr(Max_Acoustic_Cross) + ',');
      SQL.Add(FloatToStr(Dissipation_Time) + ',');
      SQL.Add(FloatToStr(Ascent_Rate) + ',');
      SQL.Add(FloatToStr(Descent_Rate) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Air_Bubble_Index FROM Air_Bubble_Definition ');
      SQL.Add('WHERE Air_Bubble_Identifier=' + quotedStr(Air_Bubble_Identifier)
        );
      Open;
      with rec.FAirBubble_Def do
      begin
        Air_Bubble_Index := FieldByName('Air_Bubble_Index').AsInteger;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function TdmTTT.deleteAir_Bubble_Def(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Air_Bubble_Definition ');
    SQL.Add('WHERE Air_Bubble_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

////====================================================
function TdmTTT.getAllChaff_Definition(var aRec: TList): Integer;
var //i: Integer;
    rec: TChaff_On_Board;
begin
  result := -1;

  if not zConn.Connected then Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Chaff_Definition ' );
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TChaff_On_Board.Create;

        with rec.FChaff_Def do
        begin
          Chaff_Index               := FieldByName('Chaff_Index').AsInteger;
          Chaff_Identifier          := FieldByName('Chaff_Identifier').AsString;
          Platform_Domain           := FieldByName('Platform_Domain').AsInteger;
          Platform_Category         := FieldByName('Platform_Category').AsInteger;
          Platform_Type             := FieldByName('Platform_Type').AsInteger;
          Max_Radar_Cross           := FieldByName('Max_Radar_Cross').AsSingle;
          Bloom_Time                := FieldByName('Bloom_Time').AsInteger;
          Max_Dissipation_Time      := FieldByName('Max_Dissipation_Time').AsInteger;
          Min_Dissipation_Time      := FieldByName('Min_Dissipation_Time').AsInteger;
          Descent_Rate              := FieldByName('Descent_Rate').AsSingle;
          Max_Radius                := FieldByName('Max_Radius').AsSingle;
          Max_Radar_Attenuation     := FieldByName('Max_Radar_Attenuation').AsSingle;
          Radar_Affect_Lower_Freq   := FieldByName('Radar_Affect_Lower_Freq').AsSingle;
          Radar_Affect_Upper_Freq   := FieldByName('Radar_Affect_Upper_Freq').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

// -----------------------------------------------------------------------------

function TdmTTT.getAllChaff_On_Board(const id: Integer; var aRec: TList): Integer;
var
  i, J: Integer;
  chaff: TChaff_On_Board;
  chaffScript: TScripted_Chaff;
  chaffPattern: TPattern_Chaff;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Chaff_On_Board a JOIN Chaff_Definition b ');
    SQL.Add('ON a.Chaff_Index = b.Chaff_Index LEFT JOIN Note_Storage c ');
    SQL.Add('ON c.Chaff_Index = b.Chaff_Index ');
    SQL.Add('WHERE (a.Vehicle_index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        chaff := TChaff_On_Board.Create;

        with chaff.FData do
        begin
          Chaff_Instance_Index := FieldByName('Chaff_Instance_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Chaff_Qty_On_Board := FieldByName('Chaff_Qty_On_Board').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Chaff_Index := FieldByName('Chaff_Index').AsInteger;
        end;

        with chaff.FChaff_Def do
        begin
          Chaff_Index := FieldByName('Chaff_Index').AsInteger;
          Chaff_Identifier := FieldByName('Chaff_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Max_Radar_Cross := FieldByName('Max_Radar_Cross').AsSingle;
          Bloom_Time := FieldByName('Bloom_Time').AsInteger;
          Max_Dissipation_Time := FieldByName('Max_Dissipation_Time').AsInteger;
          Min_Dissipation_Time := FieldByName('Min_Dissipation_Time').AsInteger;
          Descent_Rate := FieldByName('Descent_Rate').AsSingle;
          Max_Radius := FieldByName('Max_Radius').AsSingle;
          Max_Radar_Attenuation := FieldByName('Max_Radar_Attenuation')
            .AsSingle;
          Radar_Affect_Lower_Freq := FieldByName('Radar_Affect_Lower_Freq')
            .AsSingle;
          Radar_Affect_Upper_Freq := FieldByName('Radar_Affect_Upper_Freq')
            .AsSingle;
        end;

        with chaff.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        aRec.Add(chaff);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        chaff := aRec.Items[i];

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Chaff_On_Board a JOIN Scripted_Chaff_Event b ');
        SQL.Add('ON a.Chaff_Instance_Index = b.Chaff_Instance_Index ');
        SQL.Add('WHERE (a.Chaff_Instance_Index=' + IntToStr
            (chaff.FData.Chaff_Instance_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          chaffScript := TScripted_Chaff.Create;

          with chaffScript.Event.FData do
          begin
            Scripted_Event_Index := FieldByName('Scripted_Event_Index')
              .AsInteger;
            Chaff_Instance_Index := FieldByName('Chaff_Instance_Index')
              .AsInteger;
            Chaff_Bloom_Spacing := FieldByName('Chaff_Bloom_Spacing').AsSingle;
            Num_Blooms_2_Release := FieldByName('Num_Blooms_2_Release')
              .AsInteger;
          end;

          GetScripted_Behav(chaffScript.Event.FData.Scripted_Event_Index,
            chaffScript.Behav);

          chaff.FScripted_Chaffs.Add(chaffScript);
          ZQ.Next;
        end;
      end;

      for J := 0 to aRec.Count - 1 do
      begin
        chaff := aRec.Items[J];

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Chaff_On_Board a JOIN Pattern_Chaff_Event b ');
        SQL.Add('ON a.Chaff_Instance_Index = b.Chaff_Instance_Index ');
        SQL.Add('WHERE (a.Chaff_Instance_Index=' + IntToStr
            (chaff.FData.Chaff_Instance_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          chaffPattern := TPattern_Chaff.Create;

          with chaffPattern.Event.FData do
          begin
            Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
              .AsInteger;
            Chaff_Instance_Index := FieldByName('Chaff_Instance_Index')
              .AsInteger;
            Chaff_Bloom_Spacing := FieldByName('Chaff_Bloom_Spacing').AsSingle;
            Num_Blooms_2_Release := FieldByName('Num_Blooms_2_Release')
              .AsInteger;
          end;

          GetScripted_Pattern(chaffPattern.Event.FData.Scripted_Pattern_Index,
            chaffPattern.pattern);

          chaff.FScripted_Pattern.Add(chaffPattern);
        end;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getChaff_Def(const id: Integer; var aRec: TList;
  var rec: TChaff_On_Board): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Chaff_Definition ';
    if id <> 0 then
      ssql := ssql + 'WHERE Chaff_Index =' + IntToStr(id);
    ssql := ssql + ' ORDER BY Chaff_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TChaff_On_Board.Create;

        with rec.FChaff_Def do
        begin
          Chaff_Index := FieldByName('Chaff_Index').AsInteger;
          Chaff_Identifier := FieldByName('Chaff_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Max_Radar_Cross := FieldByName('Max_Radar_Cross').AsSingle;
          Bloom_Time := FieldByName('Bloom_Time').AsInteger;
          Max_Dissipation_Time := FieldByName('Max_Dissipation_Time').AsInteger;
          Min_Dissipation_Time := FieldByName('Min_Dissipation_Time').AsInteger;
          Descent_Rate := FieldByName('Descent_Rate').AsSingle;
          Max_Radius := FieldByName('Max_Radius').AsSingle;
          Max_Radar_Attenuation := FieldByName('Max_Radar_Attenuation')
            .AsSingle;
          Radar_Affect_Lower_Freq := FieldByName('Radar_Affect_Lower_Freq')
            .AsSingle;
          Radar_Affect_Upper_Freq := FieldByName('Radar_Affect_Upper_Freq')
            .AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateScriptChaff(rec: TScripted_Chaff_Event;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Scripted_Chaff_Event ');
      SQL.Add('SET ');
      SQL.Add('Chaff_Instance_Index =' + IntToStr(Chaff_Instance_Index) + ',');
      SQL.Add('Chaff_Bloom_Spacing =' + FloatToStr(Chaff_Bloom_Spacing) + ',');
      SQL.Add('Num_Blooms_2_Release =' + IntToStr(Num_Blooms_2_Release));
    end;

    SQL.Add(' WHERE (Scripted_Event_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateChaff(rec: TChaff_On_Board; id: string;
  chaff_ins: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Chaff_On_Board ');
      SQL.Add('SET ');
      SQL.Add('Instance_Identifier =''' + Instance_Identifier + ''',');
      SQL.Add('Instance_Type =' + IntToStr(Instance_Type) + ',');
      SQL.Add('Chaff_Qty_On_Board =' + IntToStr(Chaff_Qty_On_Board) + ',');
      SQL.Add('Vehicle_Index =' + IntToStr(Vehicle_Index));
    end;

    SQL.Add(' WHERE Chaff_Index = ' + id + ' AND ');
    SQL.Add(' Chaff_Instance_Index = ' + chaff_ins);

    ExecSQL;

  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertChaff(rec: TChaff_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Chaff_On_Board ');
      SQL.Add(
        '(Instance_Identifier,Instance_Type,Chaff_Qty_On_Board,Vehicle_Index,Chaff_Index)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Instance_Identifier + ''',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Chaff_Qty_On_Board) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Chaff_Index) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

////====================================================
function TdmTTT.DeleteChaff_On_Board(const id: string;
  var rec: TChaff_On_Board): integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Chaff_On_Board  ');
    SQL.Add('WHERE (Chaff_Instance_Index = ' +  id + ')' );
    ExecSQL;
  end;
end;
//-------------------------------------------------------------------

function TdmTTT.updateChaff_Def(var rec: TChaff_On_Board; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FChaff_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Chaff_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Chaff_Identifier = ''' + Chaff_Identifier + ''',');
      SQL.Add('Platform_Domain = ' + IntToStr(Platform_Domain) + ',');
      SQL.Add('Platform_Category = ' + IntToStr(Platform_Category) + ',');
      SQL.Add('Platform_Type = ' + IntToStr(Platform_Type) + ',');
      SQL.Add('Max_Radar_Cross = ' + FloatToStr(Max_Radar_Cross) + ',');
      SQL.Add('Bloom_Time = ' + IntToStr(Bloom_Time) + ',');
      SQL.Add('Max_Dissipation_Time = ' + IntToStr(Max_Dissipation_Time) + ',');
      SQL.Add('Min_Dissipation_Time = ' + IntToStr(Min_Dissipation_Time) + ',');
      SQL.Add('Descent_Rate = ' + FloatToStr(Descent_Rate) + ',');
      SQL.Add('Max_Radius = ' + FloatToStr(Max_Radius) + ',');
      SQL.Add('Max_Radar_Attenuation = ' + FloatToStr(Max_Radar_Attenuation)
          + ',');
      SQL.Add('Radar_Affect_Lower_Freq = ' + FloatToStr
          (Radar_Affect_Lower_Freq) + ',');
      SQL.Add('Radar_Affect_Upper_Freq = ' + FloatToStr(Radar_Affect_Upper_Freq)
        );
    end;

    SQL.Add('WHERE (Chaff_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertChaff_Def(rec: TChaff_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FChaff_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Chaff_Definition ');
      SQL.Add(
        '(Chaff_Identifier,Platform_Domain,Platform_Category,Platform_Type,');
      SQL.Add(
        'Max_Radar_Cross,Bloom_Time,Max_Dissipation_Time,Min_Dissipation_Time,Descent_Rate,');
      SQL.Add(
        'Max_Radius,Max_Radar_Attenuation,Radar_Affect_Lower_Freq,Radar_Affect_Upper_Freq)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Chaff_Identifier + ''',');
      SQL.Add(IntToStr(Platform_Domain) + ',');
      SQL.Add(IntToStr(Platform_Category) + ',');
      SQL.Add(IntToStr(Platform_Type) + ',');
      SQL.Add(FloatToStr(Max_Radar_Cross) + ',');
      SQL.Add(IntToStr(Bloom_Time) + ',');
      SQL.Add(IntToStr(Max_Dissipation_Time) + ',');
      SQL.Add(IntToStr(Min_Dissipation_Time) + ',');
      SQL.Add(FloatToStr(Descent_Rate) + ',');
      SQL.Add(FloatToStr(Max_Radius) + ',');
      SQL.Add(FloatToStr(Max_Radar_Attenuation) + ',');
      SQL.Add(FloatToStr(Radar_Affect_Lower_Freq) + ',');
      SQL.Add(FloatToStr(Radar_Affect_Upper_Freq) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Chaff_Index FROM Chaff_Definition ');
      SQL.Add('WHERE Chaff_Identifier=' + quotedStr(Chaff_Identifier));
      Open;
      with rec.FChaff_Def do
      begin
        Chaff_Index := FieldByName('Chaff_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteChaff_Def(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Chaff_Definition ');
    SQL.Add('WHERE Chaff_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllChaff_Launcher_On_Board(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TChaff_Launcher_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Chaff_Launcher_On_Board a  ');
    SQL.Add('WHERE (a.Vehicle_index = ' + IntToStr(id) + ')');
    // SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TChaff_Launcher_On_Board.Create;

        with rec.FData do
        begin
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Launcher_Number := FieldByName('Launcher_Number').AsInteger;
          Launcher_Angle := FieldByName('Launcher_Angle').AsSingle;
          Launcher_Kind := FieldByName('Launcher_Kind').AsInteger;
          Def_Bloom_Range := FieldByName('Def_Bloom_Range').AsSingle;
          Def_Bloom_Altitude := FieldByName('Def_Bloom_Altitude').AsSingle;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Min_Range := FieldByName('Min_Range').AsSingle;
          Max_Elevation := FieldByName('Max_Elevation').AsSingle;
          Min_Elevation := FieldByName('Min_Elevation').AsSingle;
          Average_Launch_Spd := FieldByName('Average_Launch_Spd').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateChaff_Launcher(rec: TChaff_Launcher_On_Board;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Chaff_Launcher_On_Board ');
      SQL.Add('SET ');
      SQL.Add('Launcher_Number =' + IntToStr(Launcher_Number) + ',');
      SQL.Add('Launcher_Angle =' + FloatToStr(Launcher_Angle) + ',');
      SQL.Add('Launcher_Kind =' + IntToStr(Launcher_Kind) + ',');
      SQL.Add('Def_Bloom_Range =' + FloatToStr(Def_Bloom_Range) + ',');
      SQL.Add('Def_Bloom_Altitude =' + FloatToStr(Def_Bloom_Altitude) + ',');
      SQL.Add('Max_Range =' + FloatToStr(Max_Range) + ',');
      SQL.Add('Min_Range =' + FloatToStr(Min_Range) + ',');
      SQL.Add('Max_Elevation =' + FloatToStr(Max_Elevation) + ',');
      SQL.Add('Min_Elevation =' + FloatToStr(Min_Elevation) + ',');
      SQL.Add('Average_Launch_Spd =' + FloatToStr(Average_Launch_Spd));
    end;

    SQL.Add(' WHERE Vehicle_Index = ' + id);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateCloud_Effects_On_ESM(rec: TCloud_Effects_On_ESM;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Cloud_Effects_On_ESM ');
      SQL.Add('SET ');
      SQL.Add('Cloud_0_Effect = ' + FloatToStr(Cloud_0_Effect) + ',');
      SQL.Add('Cloud_1_Effect = ' + FloatToStr(Cloud_1_Effect) + ',');
      SQL.Add('Cloud_2_Effect = ' + FloatToStr(Cloud_2_Effect) + ',');
      SQL.Add('Cloud_3_Effect = ' + FloatToStr(Cloud_3_Effect) + ',');
      SQL.Add('Cloud_4_Effect = ' + FloatToStr(Cloud_4_Effect) + ',');
      SQL.Add('Cloud_5_Effect = ' + FloatToStr(Cloud_5_Effect) + ',');
      SQL.Add('Cloud_6_Effect = ' + FloatToStr(Cloud_6_Effect));
    end;

    SQL.Add('WHERE (Radar_Frequency = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateCloud_Effects_On_Radar(rec: TCloud_Effects_On_Radar;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Cloud_Effects_On_Radar  ');
      SQL.Add('SET ');
      SQL.Add('Cloud_0_Effect = ' + FloatToStr(Cloud_0_Effect) + ',');
      SQL.Add('Cloud_1_Effect = ' + FloatToStr(Cloud_1_Effect) + ',');
      SQL.Add('Cloud_2_Effect = ' + FloatToStr(Cloud_2_Effect) + ',');
      SQL.Add('Cloud_3_Effect = ' + FloatToStr(Cloud_3_Effect) + ',');
      SQL.Add('Cloud_4_Effect = ' + FloatToStr(Cloud_4_Effect) + ',');
      SQL.Add('Cloud_5_Effect = ' + FloatToStr(Cloud_5_Effect) + ',');
      SQL.Add('Cloud_6_Effect = ' + FloatToStr(Cloud_6_Effect));
    end;

    SQL.Add('WHERE (Radar_Frequency = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertChaff_Launcher(rec: TChaff_Launcher_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add(
        'SET IDENTITY_INSERT Runtime_DB.[dbo].[Chaff_Launcher_On_Board] ON;');
      ExecSQL;

      SQL.Clear;
      SQL.Add('INSERT INTO Chaff_Launcher_On_Board ');
      SQL.Add(
        '(Vehicle_Index,Launcher_Number,Launcher_Angle,Launcher_Kind,Def_Bloom_Range,Def_Bloom_Altitude,Max_Range,Min_Range,Max_Elevation,Min_Elevation,Average_Launch_Spd)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Launcher_Number) + ',');
      SQL.Add(FloatToStr(Launcher_Angle) + ',');
      SQL.Add(IntToStr(Launcher_Kind) + ',');
      SQL.Add(FloatToStr(Def_Bloom_Range) + ',');
      SQL.Add(FloatToStr(Def_Bloom_Altitude) + ',');
      SQL.Add(FloatToStr(Max_Range) + ',');
      SQL.Add(FloatToStr(Min_Range) + ',');
      SQL.Add(FloatToStr(Max_Elevation) + ',');
      SQL.Add(FloatToStr(Min_Elevation) + ',');
      SQL.Add(FloatToStr(Average_Launch_Spd) + ')');
      ExecSQL;
    end;
  end;
end;

function TdmTTT.insertCloud_Effects_On_ESM(rec: TCloud_Effects_On_ESM): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add
        ('SET IDENTITY_INSERT Runtime_DB.[dbo].[Cloud_Effects_On_ESM] ON;');
      ExecSQL;

      SQL.Clear;
      SQL.Add('INSERT INTO Cloud_Effects_On_ESM');
      SQL.Add('(Radar_Frequency,Cloud_0_Effect,Cloud_1_Effect,Cloud_2_Effect');
      SQL.Add('Cloud_3_Effect,Cloud_4_Effect,Cloud_5_Effect,Cloud_6_Effect)');
      SQL.Add(' VALUES (');
      SQL.Add(FloatToStr(Radar_Frequency) + ',');
      SQL.Add(FloatToStr(Cloud_0_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_1_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_2_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_3_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_4_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_5_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_6_Effect) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertCloud_Effects_On_Radar(rec: TCloud_Effects_On_Radar)
  : Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add(
        'SET IDENTITY_INSERT Runtime_DB.[dbo].[Cloud_Effects_On_Radar] ON;');
      ExecSQL;

      SQL.Clear;
      SQL.Add('INSERT INTO Cloud_Effects_On_Radar');
      SQL.Add('(Radar_Frequency,Cloud_0_Effect,Cloud_1_Effect,Cloud_2_Effect');
      SQL.Add('Cloud_3_Effect,Cloud_4_Effect,Cloud_5_Effect,Cloud_6_Effect)');
      SQL.Add(' VALUES (');
      SQL.Add(FloatToStr(Radar_Frequency) + ',');
      SQL.Add(FloatToStr(Cloud_0_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_1_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_2_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_3_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_4_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_5_Effect) + ',');
      SQL.Add(FloatToStr(Cloud_6_Effect) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllDefensive_Jammer_On_Board(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TDefensive_Jammer_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add(
      'FROM  Defensive_Jammer_On_Board a JOIN Defensive_Jammer_Definition b ');
    SQL.Add(
      'ON a.Defensive_Jammer_Index = b.Defensive_Jammer_Index LEFT JOIN Note_Storage c');
    SQL.Add(' ON c.Defensive_Jammer_Index = b.Defensive_Jammer_Index');
    SQL.Add(' WHERE (a.vehicle_Index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;

    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TDefensive_Jammer_On_Board.Create;

        with rec.FData do
        begin
          Defensive_Jammer_Instance_Index := FieldByName
            ('Defensive_Jammer_Instance_Id').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Defensive_Jammer_Index := FieldByName('Defensive_Jammer_Index')
            .AsInteger;
        end;

        with rec.FDefensiveJammer_Def do
        begin
          Defensive_Jammer_Index := FieldByName('Defensive_Jammer_Index')
            .AsInteger;
          Defensive_Jammer_Identifier := FieldByName
            ('Defensive_Jammer_Identifier').AsString;
          Jammer_TARH_Capable := FieldByName('Jammer_TARH_Capable').AsInteger;
          Jammer_SARH_Capable := FieldByName('Jammer_SARH_Capable').AsInteger;
          Type_A_Seducing_Prob := FieldByName('Type_A_Seducing_Prob').AsSingle;
          Type_B_Seducing_Prob := FieldByName('Type_B_Seducing_Prob').AsSingle;
          Type_C_Seducing_Prob := FieldByName('Type_C_Seducing_Prob').AsSingle;
          ECM_Type := FieldByName('ECM_Type').AsInteger;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;


////====================================================
function TdmTTT.getAllDefensive_Jammer_Definition(
      var aRec: TList): Integer;
var //i: Integer;
    rec: TDefensive_Jammer_Definition;
begin
  result := -1;

  if not zConn.Connected then Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Defensive_Jammer_Definition ' );
    //SQL.Add('WHERE (_Index = ' +  IntToStr(id) + ')' );
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TDefensive_Jammer_Definition.Create;

        with rec.FData do
        begin
          Defensive_Jammer_Index        := FieldByName('Defensive_Jammer_Index').AsInteger;
          Defensive_Jammer_Identifier   := FieldByName('Defensive_Jammer_Identifier').AsString;
          Jammer_TARH_Capable           := FieldByName('Jammer_TARH_Capable').AsInteger;
          Jammer_SARH_Capable           := FieldByName('Jammer_SARH_Capable').AsInteger;
          Type_A_Seducing_Prob          := FieldByName('Type_A_Seducing_Prob').AsSingle;
          Type_B_Seducing_Prob          := FieldByName('Type_B_Seducing_Prob').AsSingle;
          Type_C_Seducing_Prob          := FieldByName('Type_C_Seducing_Prob').AsSingle;
          ECM_Type                      := FieldByName('ECM_Type').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getDefensive_Jammer_Def(const id: Integer; var aRec: TList;
  var rec: TDefensive_Jammer_On_Board): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Defensive_Jammer_Definition ';
    if id <> 0 then
      ssql := ssql + 'WHERE Defensive_Jammer_Index =' + IntToStr(id);
    ssql := ssql + ' ORDER BY Defensive_Jammer_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TDefensive_Jammer_On_Board.Create;

        with rec.FDefensiveJammer_Def do
        begin
          Defensive_Jammer_Index := FieldByName('Defensive_Jammer_Index')
            .AsInteger;
          Defensive_Jammer_Identifier := FieldByName
            ('Defensive_Jammer_Identifier').AsString;
          Jammer_TARH_Capable := FieldByName('Jammer_TARH_Capable').AsInteger;
          Jammer_SARH_Capable := FieldByName('Jammer_SARH_Capable').AsInteger;
          Type_A_Seducing_Prob := FieldByName('Type_A_Seducing_Prob').AsSingle;
          Type_B_Seducing_Prob := FieldByName('Type_B_Seducing_Prob').AsSingle;
          Type_C_Seducing_Prob := FieldByName('Type_C_Seducing_Prob').AsSingle;
          ECM_Type := FieldByName('ECM_Type').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

function TdmTTT.GetEmbark_LibByResAlloc(const id: Integer;
  var pList: TList): boolean;
var
//  rec: TEmbark_Library;
  rec: TBaseEmbarkLibrary;

begin
  Result := False;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Resource_Embark_Library_Mapping a LEFT JOIN ');
    SQL.Add('Embark_Library b ON a.Embark_Library_Index = b.Embark_Library_Index ');

    SQl.Add('WHERE a.Resource_Alloc_Index = '+ IntToStr(id));
    SQL.Add(' ORDER BY b.Embark_Identifier ');

    Open;
    Result := RecordCount > 0;
    if not Assigned(pList) then
      pList.Create
    else
      pList.Clear;

    if not IsEmpty then
    begin
      First;
      while not ZQ.Eof do
      begin
        rec:= TBaseEmbarkLibrary.Create; {create objek pangkalan}

        rec.id := FieldByName('Embark_Library_Index').AsInteger;
        rec.identifier := FieldByName('Embark_Identifier').AsString;
        rec.force := FieldByName('Force').AsInteger;
        rec.Longitude := FieldByName('Longitude').AsFloat;
        rec.Latitude := FieldByName('Latitude').AsFloat;
        rec.Radius := FieldByName('Embark_Library_Radius').AsFloat;
        rec.TypeBase := FieldByName('Embark_Library_TypeBase').AsInteger;
        rec.Fuel := FieldByName('Fuel').AsFloat;
        rec.Lubricants := FieldByName('Lubricants').AsFloat;
        rec.FreshWater := FieldByName('Fresh_Water').AsFloat;
        rec.Water := FieldByName('Water').AsFloat;
        rec.Food := FieldByName('Food').AsFloat;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.updateDefensive_Jammer_Def(rec: TDefensive_Jammer_On_Board;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FDefensiveJammer_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Defensive_Jammer_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Defensive_Jammer_Identifier ='' ' +
          Defensive_Jammer_Identifier + ''',');
      SQL.Add('Jammer_TARH_Capable = ' + IntToStr(Jammer_TARH_Capable) + ',');
      SQL.Add('Jammer_SARH_Capable = ' + IntToStr(Jammer_SARH_Capable) + ',');
      SQL.Add('Type_A_Seducing_Prob = ' + FloatToStr(Type_A_Seducing_Prob)
          + ',');
      SQL.Add('Type_B_Seducing_Prob = ' + FloatToStr(Type_B_Seducing_Prob)
          + ',');
      SQL.Add('Type_C_Seducing_Prob = ' + FloatToStr(Type_C_Seducing_Prob)
          + ',');
      SQL.Add('ECM_Type = ' + IntToStr(ECM_Type));
    end;

    SQL.Add('WHERE (Defensive_Jammer_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertDefensive_Jammer_Def(rec: TDefensive_Jammer_On_Board)
  : Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FDefensiveJammer_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Defensive_Jammer_Definition ');
      SQL.Add(
        '(Defensive_Jammer_Identifier,Jammer_TARH_Capable,Jammer_SARH_Capable,'
        );
      SQL.Add(
        'Type_A_Seducing_Prob,Type_B_Seducing_Prob,Type_C_Seducing_Prob,ECM_Type)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Defensive_Jammer_Identifier + ''',');
      SQL.Add(IntToStr(Jammer_TARH_Capable) + ',');
      SQL.Add(IntToStr(Jammer_SARH_Capable) + ',');
      SQL.Add(FloatToStr(Type_A_Seducing_Prob) + ',');
      SQL.Add(FloatToStr(Type_B_Seducing_Prob) + ',');
      SQL.Add(FloatToStr(Type_C_Seducing_Prob) + ',');
      SQL.Add(IntToStr(ECM_Type) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add
        ('SELECT Defensive_Jammer_Index FROM Defensive_Jammer_Definition ');
      SQL.Add('WHERE Defensive_Jammer_Identifier=' + quotedStr
          (Defensive_Jammer_Identifier));
      Open;
      with rec.FDefensiveJammer_Def do
      begin
        Defensive_Jammer_Index := FieldByName('Defensive_Jammer_Index')
          .AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

/// /====================================================
function TdmTTT.DeleteDefensive_Jammer_On_Board(const id: string;
  var rec: TDefensive_Jammer_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Defensive_Jammer_On_Board  ');
    SQL.Add('WHERE (Defensive_Jammer_Instance_Id = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

/// /====================================================
function TdmTTT.InsertDefensive_Jammer_On_Board(const id: string;
  var rec: TDefensive_Jammer_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Defensive_Jammer_On_Board  ');
      SQL.Add('VALUES ( ');
      //SQL.Add(IntToStr(Defensive_Jammer_Instance_Index) + ',');
      SQL.Add(QuotedStr(Instance_Identifier) + ',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Defensive_Jammer_Index) + ')');
    end;

    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.deleteDefensive_Jammer_Def(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Defensive_Jammer_Definition ');
    SQL.Add('WHERE Defensive_Jammer_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

////====================================================
function TdmTTT.getAllFloating_Decoy_Definition(
      var aRec: TList): Integer;
var //i: Integer;
    rec: TFloating_Decoy_On_Board;
begin
  result := -1;

  if not zConn.Connected then Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Floating_Decoy_Definition ' );
    //SQL.Add('WHERE (_Index = ' +  IntToStr(id) + ')' );
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TFloating_Decoy_On_Board.Create;

        with rec.FFloatingDecoy_Def do
        begin
          Floating_Decoy_Index        := FieldByName('Floating_Decoy_Index').AsInteger;
          Floating_Decoy_Identifier   := FieldByName('Floating_Decoy_Identifier').AsString;
          Platform_Domain             := FieldByName('Platform_Domain').AsInteger;
          Platform_Category           := FieldByName('Platform_Category').AsInteger;
          Platform_Type               := FieldByName('Platform_Type').AsInteger;
          Length                      := FieldByName('Length').AsSingle;
          Width                       := FieldByName('Width').AsSingle;
          Height                      := FieldByName('Height').AsSingle;
          Front_Radar_Cross           := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross            := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Visual_Cross          := FieldByName('Front_Visual_Cross').AsSingle;
          Side_Visual_Cross           := FieldByName('Side_Visual_Cross').AsSingle;
          Front_Acoustic_Cross        := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross         := FieldByName('Side_Acoustic_Cross').AsSingle;
          Lifetime_Duration           := FieldByName('Lifetime_Duration').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllFloating_Decoy_On_Board(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TFloating_Decoy_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add
      ('FROM  Floating_Decoy_On_Board  a JOIN Floating_Decoy_Definition b ');
    SQL.Add(
      '   ON a.Floating_Decoy_Index = b.Floating_Decoy_Index LEFT JOIN Note_Storage c');
    SQL.Add('   ON c.Floating_Decoy_Index = b.Floating_Decoy_Index');
    SQL.Add('WHERE (a.Vehicle_index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TFloating_Decoy_On_Board.Create;

        with rec.FData do
        begin
          Floating_Decoy_Instance_Index := FieldByName
            ('Floating_Decoy_Instance_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Floating_Decoy_Index := FieldByName('Floating_Decoy_Index').AsInteger;
        end;

        with rec.FFloatingDecoy_Def do
        begin
          Floating_Decoy_Index := FieldByName('Floating_Decoy_Index').AsInteger;
          Floating_Decoy_Identifier := FieldByName('Floating_Decoy_Identifier')
            .AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Visual_Cross := FieldByName('Front_Visual_Cross').AsSingle;
          Side_Visual_Cross := FieldByName('Side_Visual_Cross').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Lifetime_Duration := FieldByName('Lifetime_Duration').AsSingle;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

function TdmTTT.getAllFontTaktis(mList: TList; aFontType: Byte): Integer;
var
  rec: TFontTaktis;
begin
  result := -1;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Font_Taktis ');

    if aFontType = 0 then
      SQL.Add('WHERE FONT_ID >= 221 and FONT_ID <= 404')
    else if aFontType = 1 then
      SQL.Add('WHERE FONT_ID >= 10 and FONT_ID <= 220')
    else if aFontType = 2 then
      SQL.Add('WHERE FONT_ID >= 405 and FONT_ID <= 539');

    SQL.Add('order by FONT_ID');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;
      if not Assigned(mList) then
        mList := TList.Create;
    end;

    while not ZQ.Eof do
    begin
      rec := TFontTaktis.Create;
      with rec.FData do
      begin
        FONT_ID := FieldByName('FONT_ID').AsInteger;
        FONT_NAME := FieldByName('FONT_NAME').AsString;
        FONT_INDEX := FieldByName('FONT_INDEX').AsInteger;
        KETERANGAN := FieldByName('KETERANGAN').AsString;

      end;

      mList.Add(rec);
      ZQ.Next;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getFloating_Decoy(const id: Integer; var aRec: TList;
  var rec: TFloating_Decoy_On_Board): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Floating_Decoy_Definition ';
    if id <> 0 then
      ssql := ssql + 'WHERE Floating_Decoy_Index  =' + IntToStr(id);
    ssql := ssql + ' ORDER BY Floating_Decoy_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TFloating_Decoy_On_Board.Create;

        with rec.FFloatingDecoy_Def do
        begin
          Floating_Decoy_Index := FieldByName('Floating_Decoy_Index').AsInteger;
          Floating_Decoy_Identifier := FieldByName('Floating_Decoy_Identifier')
            .AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Visual_Cross := FieldByName('Front_Visual_Cross').AsSingle;
          Side_Visual_Cross := FieldByName('Side_Visual_Cross').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Lifetime_Duration := FieldByName('Lifetime_Duration').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

procedure TdmTTT.getFontIDByVecID(const VecID: integer; var FontID: Integer);
var
  ssql: string;
begin
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT font_id FROM Vehicle_Definition ';
    ssql := ssql + 'WHERE Vehicle_Index  =' + IntToStr(VecID);
    SQL.Add(ssql);
    Open;

    if not IsEmpty then
    begin
      First;
      FontID := FieldByName('font_id').AsInteger;
    end;
  end;
end;

procedure TdmTTT.getFontTaktis(const FontID : Integer; var FontName : string; var FontIndex : Integer; var FontDesc : string);
var
  ssql: string;
begin
  if not ZConn.Connected then
    exit;

  FontName := 'TAKTIS_AL';
  FontIndex := 248;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Font_Taktis ';
    ssql := ssql + 'WHERE FONT_ID  =' + IntToStr(FontID);
    SQL.Add(ssql);
    Open;

    if not IsEmpty then
    begin
      First;
      FontName := FieldByName('FONT_NAME').AsString;
      FontIndex := FieldByName('FONT_INDEX').AsInteger;
      FontDesc := FieldByName('KETERANGAN').AsString;
    end;
  end;
end;


// ------------------------------------------------------------------------------

function TdmTTT.updateFloating_Decoy(rec: TFloating_Decoy_On_Board;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Floating_Decoy_On_Board ');
      SQL.Add('SET ');
      SQL.Add('Instance_Identifier =''' + Instance_Identifier + ''',');
      SQL.Add('Instance_Type =' + IntToStr(Instance_Type) + ',');
      SQL.Add('Quantity =' + IntToStr(Quantity) + ',');
      SQL.Add('Vehicle_Index =' + FloatToStr(Vehicle_Index));
    end;

    SQL.Add(' WHERE Floating_Decoy_Instance_Index = ' + id);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertFloating_Decoy(rec: TFloating_Decoy_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Floating_Decoy_On_Board ');
      SQL.Add(
        '(Instance_Identifier,Instance_Type,Quantity,Vehicle_Index,Floating_Decoy_Index)');
      SQL.Add(' VALUES (');
      //SQL.Add(IntToStr(Floating_Decoy_Instance_Index) + ',');
      SQL.Add('''' + Instance_Identifier + ''',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Quantity) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(FloatToStr(Floating_Decoy_Index) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

////====================================================
function TdmTTT.DeleteFloating_Decoy_On_Board(const id: string;
  var rec: TFloating_Decoy_On_Board): integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Floating_Decoy_On_Board  ');
    SQL.Add('WHERE (Floating_Decoy_Instance_Index = ' +  id + ')' );
    ExecSQL;
  end;
end;
//-------------------------------------------------------------------

function TdmTTT.updateFloating_Decoy_Def(rec: TFloating_Decoy_On_Board;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FFloatingDecoy_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Floating_Decoy_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Floating_Decoy_Identifier = ''' + Floating_Decoy_Identifier +
          ''',');
      SQL.Add('Platform_Domain = ' + IntToStr(Platform_Domain) + ',');
      SQL.Add('Platform_Category = ' + IntToStr(Platform_Category) + ',');
      SQL.Add('Platform_Type = ' + IntToStr(Platform_Type) + ',');
      SQL.Add('Length = ' + FloatToStr(Length) + ',');
      SQL.Add('Width = ' + FloatToStr(Width) + ',');
      SQL.Add('Height = ' + FloatToStr(Height) + ',');
      SQL.Add('Front_Radar_Cross = ' + FloatToStr(Front_Radar_Cross) + ',');
      SQL.Add('Side_Radar_Cross = ' + FloatToStr(Side_Radar_Cross) + ',');
      SQL.Add('Front_Visual_Cross = ' + FloatToStr(Front_Visual_Cross) + ',');
      SQL.Add('Side_Visual_Cross = ' + FloatToStr(Side_Visual_Cross) + ',');
      SQL.Add('Front_Acoustic_Cross = ' + FloatToStr(Front_Acoustic_Cross)
          + ',');
      SQL.Add('Side_Acoustic_Cross = ' + FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add('Lifetime_Duration = ' + FloatToStr(Lifetime_Duration));
    end;

    SQL.Add('WHERE (Floating_Decoy_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertFloating_Decoy_Def(rec: TFloating_Decoy_On_Board)
  : Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FFloatingDecoy_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Floating_Decoy_Definition ');
      SQL.Add('(Floating_Decoy_Identifier,Platform_Domain,Platform_Category,');
      SQL.Add(
        'Platform_Type,Length,Width,Height,Front_Radar_Cross,Side_Radar_Cross,Front_Visual_Cross,');
      SQL.Add(
        'Side_Visual_Cross,Front_Acoustic_Cross,Side_Acoustic_Cross,Lifetime_Duration)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Floating_Decoy_Identifier + ''',');
      SQL.Add(IntToStr(Platform_Domain) + ',');
      SQL.Add(IntToStr(Platform_Category) + ',');
      SQL.Add(IntToStr(Platform_Type) + ',');
      SQL.Add(FloatToStr(Length) + ',');
      SQL.Add(FloatToStr(Width) + ',');
      SQL.Add(FloatToStr(Height) + ',');
      SQL.Add(FloatToStr(Front_Radar_Cross) + ',');
      SQL.Add(FloatToStr(Side_Radar_Cross) + ',');
      SQL.Add(FloatToStr(Front_Visual_Cross) + ',');
      SQL.Add(FloatToStr(Side_Visual_Cross) + ',');
      SQL.Add(FloatToStr(Front_Acoustic_Cross) + ',');
      SQL.Add(FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add(FloatToStr(Lifetime_Duration) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Floating_Decoy_Index FROM Floating_Decoy_Definition ');
      SQL.Add('WHERE Floating_Decoy_Identifier=' + quotedStr
          (Floating_Decoy_Identifier));
      Open;
      with rec.FFloatingDecoy_Def do
      begin
        Floating_Decoy_Index := FieldByName('Floating_Decoy_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteFloating_Decoy_Def(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Floating_Decoy_Definition ');
    SQL.Add('WHERE Floating_Decoy_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllInfrared_Decoy_On_Board(const id: Integer;
  var aRec: TList): Integer;
var
  i, J: Integer;
  infraScript: TScripted_Infrared;
  infraPattern: TPattern_Infrared;
  rec: TInfrared_Decoy_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add
      ('FROM  Infrared_Decoy_On_Board a JOIN Infrared_Decoy_Definition  b ');
    SQL.Add(
      '   ON a.Infrared_Decoy_Index = b.Infrared_Decoy_Index LEFT JOIN Note_Storage c');
    SQL.Add('   ON c.Infrared_Decoy_Index = b.Infrared_Decoy_Index ');
    SQL.Add('WHERE (a.Vehicle_index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TInfrared_Decoy_On_Board.Create;
        with rec.FData do
        begin
          Infrared_Decoy_Instance_Index := FieldByName
            ('Infrared_Decoy_Instance_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Infrared_Decoy_Qty_On_Board := FieldByName
            ('Infrared_Decoy_Qty_On_Board').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Infrared_Decoy_Index := FieldByName('Infrared_Decoy_Index').AsInteger;
        end;

        with rec.FInfraRedDecoy_Def do
        begin
          Infrared_Decoy_Index := FieldByName('Infrared_Decoy_Index').AsInteger;
          Infrared_Decoy_Identifier := FieldByName('Infrared_Decoy_Identifier')
            .AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Max_Infrared_Cross := FieldByName('Max_Infrared_Cross').AsSingle;
          Bloom_Time := FieldByName('Bloom_Time').AsInteger;
          Sustain_Time := FieldByName('Sustain_Time').AsInteger;
          Max_Dissipation_Time := FieldByName('Max_Dissipation_Time').AsInteger;
          Min_Dissipation_Time := FieldByName('Min_Dissipation_Time').AsInteger;
          Descent_Rate := FieldByName('Descent_Rate').AsSingle;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];
        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add(
          'FROM Infrared_Decoy_On_Board a JOIN Scripted_Infrared_Decoy_Event b '
          );
        SQL.Add(
          'ON a.Infrared_Decoy_Instance_Index = b.Infrared_Decoy_Instance_Index ');
        SQL.Add('WHERE (a.Infrared_Decoy_Instance_Index = ' + IntToStr
            (rec.FData.Infrared_Decoy_Instance_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          infraScript := TScripted_Infrared.Create;

          with infraScript.Event.FData do
          begin
            Scripted_Event_Index := FieldByName('Scripted_Event_Index').AsInteger;
            Infrared_Decoy_Instance_Index := FieldByName
              ('Infrared_Decoy_Instance_Index').AsInteger;
            Infrared_Decoy_Bloom_Spacing := FieldByName
              ('Infrared_Decoy_Bloom_Spacing').AsSingle;
            Num_Blooms_2_Release := FieldByName('Num_Blooms_2_Release').AsInteger;
          end;

          GetScripted_Behav(infraScript.Event.FData.Scripted_Event_Index,
            infraScript.Behav);

          rec.FScripted_Infra.Add(infraScript);

          ZQ.Next;
        end;
      end;

      for J := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[J];
        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add(
          'FROM Infrared_Decoy_On_Board a JOIN Pattern_Infrared_Decoy_Event b '
          );
        SQL.Add(
          'ON a.Infrared_Decoy_Instance_Index = b.Infrared_Decoy_Instance_Index ');
        SQL.Add('WHERE (a.Infrared_Decoy_Instance_Index = ' + IntToStr
            (rec.FData.Infrared_Decoy_Instance_Index) + ')');
        Open;

        ZQ.First;
        while not ZQ.Eof do
        begin
          infraPattern := TPattern_Infrared.Create;

          with infraPattern.Event.FData do
          begin
            Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
              .AsInteger;
            Infrared_Decoy_Instance_Index := FieldByName
              ('Infrared_Decoy_Instance_Index').AsInteger;
            Infrared_Decoy_Bloom_Spacing := FieldByName
              ('Infrared_Decoy_Bloom_Spacing').AsSingle;
            Num_Blooms_2_Release := FieldByName('Num_Blooms_2_Release')
              .AsInteger;
          end;

          GetScripted_Pattern(infraPattern.Event.FData.Scripted_Pattern_Index,
            infraPattern.pattern);

          rec.FPattern_Infra.Add(infraPattern);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function TdmTTT.updateScriptInfrared(rec: TScripted_Infrared_Decoy_Event;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Scripted_Infrared_Decoy_Event ');
      SQL.Add('SET ');
      SQL.Add('Infrared_Decoy_Instance_Index =' + IntToStr
          (Infrared_Decoy_Instance_Index) + ',');
      SQL.Add('Infrared_Decoy_Bloom_Spacing =' + FloatToStr
          (Infrared_Decoy_Bloom_Spacing) + ',');
      SQL.Add('Num_Blooms_2_Release =' + IntToStr(Num_Blooms_2_Release));
    end;

    SQL.Add(' WHERE (Scripted_Event_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------
function TdmTTT.getAllJammer_On_Board(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TJammer_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Jammer_On_Board a JOIN Jammer_Definition  b ');
    SQL.Add('ON a.Jammer_Index = b.Jammer_Index LEFT JOIN Note_Storage c ');
    SQL.Add('ON c.Jammer_Index = b.Jammer_Index ');
    SQL.Add('WHERE (a.Vehicle_index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TJammer_On_Board.Create;

        with rec.FData do
        begin
          Jammer_Instance_Index := FieldByName('Jammer_Instance_Index')
            .AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Jammer_Index := FieldByName('Jammer_Index').AsInteger;
          Antenna_Height := FieldByName('Antenna_Height').AsSingle;
        end;

        with rec.FDef do
        begin
          Jammer_Index := FieldByName('Jammer_Index').AsInteger;
          Jammer_Type := FieldByName('Jammer_Type').AsInteger;
          Jammer_Identifier := FieldByName('Jammer_Identifier').AsString;
          Lower_Freq_Limit := FieldByName('Lower_Freq_Limit').AsFloat;
          Upper_Freq_Limit := FieldByName('Upper_Freq_Limit').AsFloat;
          Jammer_Power_Density := FieldByName('Jammer_Power_Density').AsFloat;
          Max_Effective_Range := FieldByName('Max_Effective_Range').AsSingle;
          Max_Sector_Width := FieldByName('Max_Sector_Width').AsSingle;
          Upper_Vert_Coverage_Angle := FieldByName('Upper_Vert_Coverage_Angle')
            .AsSingle;
          Lower_Vert_Coverage_Angle := FieldByName('Lower_Vert_Coverage_Angle')
            .AsSingle;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getJammer_OnBoard_Distinct(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TJammer_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT a.Instance_Identifier,a.Jammer_Instance_Index, ');
    SQL.Add('a.Vehicle_Index,a.Jammer_Index,a.Antenna_Height ');
    SQL.Add('FROM  Jammer_On_Board a JOIN Jammer_Definition  b ');
    SQL.Add('ON a.Jammer_Index = b.Jammer_Index LEFT JOIN Note_Storage c ');
    SQL.Add('ON c.Jammer_Index = b.Jammer_Index ');
    if id <> 0 then
       SQL.Add('WHERE (a.Vehicle_index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TJammer_On_Board.Create;

        with rec.FData do
        begin
          Jammer_Instance_Index := FieldByName('Jammer_Instance_Index').AsInteger;
          Instance_Identifier   := FieldByName('Instance_Identifier').AsString;
          Vehicle_Index         := FieldByName('Vehicle_Index').AsInteger;
          Jammer_Index          := FieldByName('Jammer_Index').AsInteger;
          Antenna_Height        := FieldByName('Antenna_Height').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getJammer_Def(const id: Integer; var aRec: TList):integer;
var
  //i: Integer;
  rec: TJammer_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Jammer_Definition ');
    if id <> 0 then
       SQL.Add('WHERE (Jammer_index = ' + IntToStr(id) + ')');

    SQL.Add('ORDER BY Jammer_Identifier ');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TJammer_On_Board.Create;

        with rec.FDef do
        begin
          Jammer_Index              := FieldByName('Jammer_Index').AsInteger;
          Jammer_Type               := FieldByName('Jammer_Type').AsInteger;
          Jammer_Identifier         := FieldByName('Jammer_Identifier').AsString;
          Lower_Freq_Limit          := FieldByName('Lower_Freq_Limit').AsFloat;
          Upper_Freq_Limit          := FieldByName('Upper_Freq_Limit').AsFloat;
          Jammer_Power_Density      := FieldByName('Jammer_Power_Density').AsFloat;
          Max_Effective_Range       := FieldByName('Max_Effective_Range').AsFloat;
          Max_Sector_Width          := FieldByName('Max_Sector_Width').AsFloat;
          Upper_Vert_Coverage_Angle := FieldByName('Upper_Vert_Coverage_Angle').AsFloat;
          Lower_Vert_Coverage_Angle := FieldByName('Lower_Vert_Coverage_Angle').AsFloat;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

function TdmTTT.updateJammer(rec: TJammer_On_Board; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Jammer_On_Board ');
      SQL.Add('SET ');
      SQL.Add('Jammer_Index =' + IntToStr(Jammer_Index)
          + ',');
      SQL.Add('Instance_Identifier =''' + Instance_Identifier + ''',');
      SQL.Add('Instance_Type =' + IntToStr(Instance_Type) + ',');
      SQL.Add('Vehicle_Index=' + IntToStr(Vehicle_Index) + ',');
      SQL.Add('Antenna_Height =' + FloatToStr(Antenna_Height));
    end;

    SQL.Add(' WHERE Jammer_Instance_Index = ' + id);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertJammer(rec: TJammer_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Jammer_On_Board ');
      SQL.Add(
        '(Instance_Identifier,Instance_Type,Vehicle_Index,Jammer_Index,Antenna_Height)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Instance_Identifier + ''',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Jammer_Index) + ',');
      SQL.Add(FloatToStr(Antenna_Height) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

/// /====================================================
function TdmTTT.DeleteJammer_On_Board(const id: string;
  var rec: TJammer_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Jammer_On_Board  ');
    SQL.Add('WHERE (Jammer_Instance_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.updateJammer_Def(rec: TJammer_On_Board; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Jammer_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Jammer_Type = ' + IntToStr(Jammer_Type) + ',');
      SQL.Add('Jammer_Identifier = ' + (Jammer_Identifier) + ',');
      SQL.Add('Lower_Freq_Limit = ' + FloatToStr(Lower_Freq_Limit) + ',');
      SQL.Add('Upper_Freq_Limit = ' + FloatToStr(Upper_Freq_Limit) + ',');
      SQL.Add('Jammer_Power_Density = ' + FloatToStr(Jammer_Power_Density)
          + ',');
      SQL.Add('Max_Effective_Range = ' + FloatToStr(Max_Effective_Range) + ',');
      SQL.Add('Max_Sector_Width = ' + FloatToStr(Max_Sector_Width) + ',');
      SQL.Add('Upper_Vert_Coverage_Angle = ' + FloatToStr
          (Upper_Vert_Coverage_Angle) + ',');
      SQL.Add('Lower_Vert_Coverage_Angle = ' + FloatToStr
          (Lower_Vert_Coverage_Angle));
    end;

    SQL.Add('WHERE (Jammer_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertJammer_Def(rec: TJammer_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Jammer_Definition] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Jammer_Definition ');
      SQL.Add(
        '(Jammer_Index,Jammer_Type,Jammer_Identifier,Lower_Freq_Limit,Upper_Freq_Limit,Jammer_Power_Density,');
      SQL.Add(
        'Max_Effective_Range,Max_Sector_Width,Upper_Vert_Coverage_Angle,Lower_Vert_Coverage_Angle)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Jammer_Index) + ',');
      SQL.Add(IntToStr(Jammer_Type) + ',');
      SQL.Add('''' + Jammer_Identifier + ''',');
      SQL.Add(FloatToStr(Lower_Freq_Limit) + ',');
      SQL.Add(FloatToStr(Upper_Freq_Limit) + ',');
      SQL.Add(FloatToStr(Jammer_Power_Density) + ',');
      SQL.Add(FloatToStr(Max_Effective_Range) + ',');
      SQL.Add(FloatToStr(Max_Sector_Width) + ',');
      SQL.Add(FloatToStr(Upper_Vert_Coverage_Angle) + ',');
      SQL.Add(FloatToStr(Lower_Vert_Coverage_Angle) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllPoint_Effect_On_Board(const id: Integer;
  var aRec: TList): Integer;
var
  i, J, k: Integer;
  weaponScript: TScripted_Weapon;
  weaponPattern: TPattern_Weapon;
  rec: TPoint_Effect_On_Board;
  Point_Blind: TBlind_Zone;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Point_Effect_On_Board a ');
    SQL.Add('WHERE (a.Vehicle_index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TPoint_Effect_On_Board.Create;

        with rec.FData do
        begin
          Point_Effect_Index := FieldByName('Point_Effect_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Mount_Type := FieldByName('Mount_Type').AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
          Gun_Index := FieldByName('Gun_Index').AsInteger;
          Bomb_Index := FieldByName('Bomb_Index').AsInteger;
          TurretID := FieldByName('TurretID').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[i];

        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Point_Effect_On_Board a JOIN Scripted_Weapon_Event b ');
        SQL.Add('ON a.Point_Effect_Index = b.Point_Effect ');
        SQL.Add('WHERE a.Point_Effect_Index = (' + IntToStr
            (rec.FData.Point_Effect_Index) + ')');
        Open;

        while not ZQ.Eof do
        begin
          weaponScript := TScripted_Weapon.Create;

          with weaponScript.Event.FData do
          begin
            List_Index := FieldByName('List_Index').AsInteger;
            Scripted_Event_Index := FieldByName('Scripted_Event_Index')
              .AsInteger;
            Salvo_Size := FieldByName('Salvo_Size').AsInteger;
            Number_Layed := FieldByName('Number_Layed').AsInteger;
            Distance_Between := FieldByName('Distance_Between').AsSingle;
            Mine_Depth := FieldByName('Mine_Depth').AsSingle;
            Target_Index := FieldByName('Target_Index').AsInteger;
            Weapon_Type := FieldByName('Weapon_Type').AsInteger;
            Point_Effect := FieldByName('Point_Effect').AsInteger;
            Weapons_Mount := FieldByName('Weapons_Mount').AsInteger;
          end;

          GetScripted_Behav(weaponScript.Event.FData.Scripted_Event_Index,
            weaponScript.Behav);

          rec.FScripted_Point.Add(weaponScript);
          ZQ.Next;
        end;
      end;

      for J := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[J];

        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Point_Effect_On_Board a JOIN Pattern_Weapon_Event b ');
        SQL.Add('ON a.Point_Effect_Index = b.Point_Effect ');
        SQL.Add('WHERE a.Point_Effect_Index = (' + IntToStr
            (rec.FData.Point_Effect_Index) + ')');
        Open;

        while not ZQ.Eof do
        begin
          weaponPattern := TPattern_Weapon.Create;

          with weaponPattern.Event.FData do
          begin
            List_Index := FieldByName('List_Index').AsInteger;
            Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
              .AsInteger;
            Salvo_Size := FieldByName('Salvo_Size').AsInteger;
            Number_Layed := FieldByName('Number_Layed').AsInteger;
            Distance_Between := FieldByName('Distance_Between').AsSingle;
            Mine_Depth := FieldByName('Mine_Depth').AsSingle;
            Weapon_Type := FieldByName('Weapon_Type').AsInteger;
            Point_Effect := FieldByName('Point_Effect').AsInteger;
            Weapons_Mount := FieldByName('Weapons_Mount').AsInteger;
          end;

          GetScripted_Pattern(weaponPattern.Event.FData.Scripted_Pattern_Index,
            weaponPattern.pattern);

          rec.FPattern_Point.Add(weaponPattern);
          ZQ.Next;
        end;
      end;

      for k := 0 to aRec.Count - 1 do
      begin
        rec := aRec.Items[k];
        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Point_Effect_On_Board a JOIN Blind_Zone_Definition b ');
        SQL.Add('ON a.Point_Effect_Index = b.Point_Effect_Index ');
        SQL.Add('WHERE (a.Point_Effect_Index = ' + IntToStr
            (rec.FData.Point_Effect_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          Point_Blind := TBlind_Zone.Create;

          with Point_Blind.FData do
          begin
            Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
            Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
            BlindZone_Number := FieldByName('BlindZone_Number').AsInteger;
            Point_Effect_Index := FieldByName('Point_Effect_Index').AsInteger;
            Start_Angle := FieldByName('Start_Angle').AsSingle;
            End_Angle := FieldByName('End_Angle').AsSingle;

          end;

          rec.FBlind.Add(Point_Blind);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

////====================================================
function TdmTTT.getAllTowed_Jammer_Decoy_On_Board_Only(const id: integer;
      var aRec: TList): Integer;
var //i: Integer;
    rec: TTowed_Jammer_Decoy_On_Board;
begin
  result := -1;

  if not zConn.Connected then Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Towed_Jammer_Decoy_On_Board ' );
    //SQL.Add('WHERE (_Index = ' +  IntToStr(id) + ')' );
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TTowed_Jammer_Decoy_On_Board.Create;

        with rec.FData do
        begin
          Towed_Decoy_Instance_Index    := FieldByName('Towed_Decoy_Instance_Index').AsInteger;
          Instance_Identifier           := FieldByName('Instance_Identifier').AsString;
          Instance_Type                 := FieldByName('Instance_Type').AsInteger;
          Quantity                      := FieldByName('Quantity').AsInteger;
          Vehicle_Index                 := FieldByName('Vehicle_Index').AsInteger;
          Towed_Decoy_Index             := FieldByName('Towed_Decoy_Index').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.getAllTowed_Jammer_Decoy_On_Board(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TTowed_Jammer_Decoy_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add(
      'FROM  Towed_Jammer_Decoy_On_Board a JOIN Towed_Jammer_Decoy_Definition  b ');
    SQL.Add(
      'ON a.Towed_Decoy_Index = b.Towed_Decoy_Index LEFT JOIN Note_Storage c ');
    SQL.Add('ON b.Towed_Decoy_Index = c.Towed_Decoy_Index ');
    SQL.Add('WHERE (a.Vehicle_index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TTowed_Jammer_Decoy_On_Board.Create;

        with rec.FData do
        begin
          Towed_Decoy_Instance_Index := FieldByName
            ('Towed_Decoy_Instance_Index')
            .AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Towed_Decoy_Index := FieldByName('Towed_Decoy_Index').AsInteger;
        end;

        with rec.FDef do
        begin
          Towed_Decoy_Index := FieldByName('Towed_Decoy_Index').AsInteger;
          Towed_Decoy_Identifier := FieldByName('Towed_Decoy_Identifier')
            .AsString;
          Decoy_TARH_Capable := FieldByName('Decoy_TARH_Capable').AsInteger;
          Decoy_SARH_Capable := FieldByName('Decoy_SARH_Capable').AsInteger;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Visual_Cross := FieldByName('Front_Visual_Cross').AsSingle;
          Side_Visual_Cross := FieldByName('Side_Visual_Cross').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Type_A_Seducing_Prob := FieldByName('Type_A_Seducing_Prob').AsSingle;
          Type_B_Seducing_Prob := FieldByName('Type_B_Seducing_Prob').AsSingle;
          Type_C_Seducing_Prob := FieldByName('Type_C_Seducing_Prob').AsSingle;
          Activation_Control_Delay := FieldByName('Activation_Control_Delay')
            .AsSingle;
          Tow_Length := FieldByName('Tow_Length').AsSingle;
          ECM_Type := FieldByName('ECM_Type').AsInteger;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

////====================================================
function TdmTTT.getAllTowed_Jammer_Decoy_Definition(
      var aRec: TList): Integer;
var //i: Integer;
    rec: TTowed_Jammer_Decoy_On_Board;
begin
  result := -1;

  if not zConn.Connected then Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Towed_Jammer_Decoy_Definition ' );
    //SQL.Add('WHERE (_Index = ' +  IntToStr(id) + ')' );
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TTowed_Jammer_Decoy_On_Board.Create;

        with rec.FDef do
        begin
          Towed_Decoy_Index           := FieldByName('Towed_Decoy_Index').AsInteger;
          Towed_Decoy_Identifier      := FieldByName('Towed_Decoy_Identifier').AsString;
          Decoy_TARH_Capable          := FieldByName('Decoy_TARH_Capable').AsInteger;
          Decoy_SARH_Capable          := FieldByName('Decoy_SARH_Capable').AsInteger;
          Platform_Domain             := FieldByName('Platform_Domain').AsInteger;
          Platform_Category           := FieldByName('Platform_Category').AsInteger;
          Platform_Type               := FieldByName('Platform_Type').AsInteger;
          Length                      := FieldByName('Length').AsSingle;
          Width                       := FieldByName('Width').AsSingle;
          Height                      := FieldByName('Height').AsSingle;
          Front_Radar_Cross           := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross            := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Visual_Cross          := FieldByName('Front_Visual_Cross').AsSingle;
          Side_Visual_Cross           := FieldByName('Side_Visual_Cross').AsSingle;
          Front_Acoustic_Cross        := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross         := FieldByName('Side_Acoustic_Cross').AsSingle;
          Type_A_Seducing_Prob        := FieldByName('Type_A_Seducing_Prob').AsSingle;
          Type_B_Seducing_Prob        := FieldByName('Type_B_Seducing_Prob').AsSingle;
          Type_C_Seducing_Prob        := FieldByName('Type_C_Seducing_Prob').AsSingle;
          Activation_Control_Delay    := FieldByName('Activation_Control_Delay').AsSingle;
          Tow_Length                  := FieldByName('Tow_Length').AsSingle;
          ECM_Type                    := FieldByName('ECM_Type').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TdmTTT.getAllVehicleProperties(vIndex: Integer;
  vehicle: TVehicle_Definition);
begin
  if vehicle = nil then
    exit;

  with vehicle do
  begin
    getAllEO_On_Board(vIndex, 0, EOSensors);
    getAllESM_On_Board(vIndex, 0, ESMSensors);
    getAllIFF_Sensor_On_Board(vIndex, 0, IFFSensors);
    getAllMAD_Sensor_On_Board(vIndex, 0, MADSensors);
    getAllVisual_Sensor_On_Board(vIndex, 0, Visualsensors);
    getAllFCR_On_Board(vIndex, FCRSensors);

    getAllRadar_On_Board(vIndex, 0, vehicle.Radars);
    getAllSonar_On_Board(vIndex, 0, vehicle.Sonars);

    // weapon fit on Board
    getAllMissile_OnBoard(vIndex, 0, Missiles);
    getAllTorpedo_OnBoard(vIndex, 0, Torpedos);
    GetAllHybrid_On_Board(vIndex, Hybrids);
    getAllMines_OnBoard(vIndex, 0, Mines);
    GetAllBomb(vIndex, Bombs);
    GetAllGun(vIndex, Guns);

    getAllAcoustic_Decoy_On_Board(vIndex, Acoustic_Decoys);
    getAllAir_Bubble_Mount(vIndex, Air_Bubble_Mount);
    getAllChaff_On_Board(vIndex, Chaffs);
    getAllChaff_Launcher_On_Board(vIndex, Chaff_Launchers);
    getAllDefensive_Jammer_On_Board(vIndex, Defensive_Jammers);
    getAllFloating_Decoy_On_Board(vIndex, Floating_Decoys);
    getAllInfrared_Decoy_On_Board(vIndex, Infrared_Decoys);
    getAllJammer_On_Board(vIndex, Jammers);
    getAllPoint_Effect_On_Board(vIndex, Point_Effects);
    getAllTowed_Jammer_Decoy_On_Board(vIndex, Towed_Jammer_Decoys);
    GetHosted_Platform(vIndex, 0, Hosted_Platform);
    getAllSonobuoy_On_Board(vIndex, 0, Sonobuoy);
  end;
end;

// ------------------------------------------------------------------------------

procedure TdmTTT.getTorpedoPOH(var data: TList;idx : integer);
var
  aspect_POH : TTorpedo_POH_Modifier;
begin
  if not Assigned(data) then
    data := TList.Create;

  with ZQ do begin
    Close;

    SQL.Clear;
    SQL.Add('SELECT a.Torpedo_Index, a.Aspect_Angle, a.POH_Modifier ');
    SQL.Add('FROM Torpedo_POH_Modifier a JOIN Torpedo_Definition b ');
    SQL.Add('ON a.Torpedo_Index = b.Torpedo_Index ');
    SQL.Add('WHERE (a.Torpedo_Index = ' + IntToStr(idx) + ')');
    Open;

    First;

    while not Eof do
    begin
      aspect_POH := TTorpedo_POH_Modifier.Create;

      with aspect_POH.FData do
      begin
        Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
        Aspect_Angle  := FieldByName('Aspect_Angle').AsInteger;
        POH_Modifier  := FieldByName('POH_Modifier').AsFloat;
      end;

      data.Add(aspect_POH);
      ZQ.Next;
    end;

    Close;
  end;

end;

function TdmTTT.getTorpedo_Def(var rec: TTorpedo_Definition; id: Integer): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Torpedo_Definition ';
    if id <> 0 then
       ssql := ssql + 'WHERE Torpedo_Index = ' + IntToStr(id);
    SQL.Add(ssql);
    SQL.Add('ORDER BY Class_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      rec := TTorpedo_Definition.Create;

      with rec.FData do
      begin
        Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
        Class_Identifier := FieldByName('Class_Identifier').AsString;
        Platform_Domain := FieldByName('Platform_Domain').AsInteger;
        Platform_Category := FieldByName('Platform_Category').AsInteger;
        Platform_Type := FieldByName('Platform_Type').AsInteger;
        Max_Range := FieldByName('Max_Range').AsSingle;
        Min_Range := FieldByName('Min_Range').AsSingle;
        Motion_Index := FieldByName('Motion_Index').AsInteger;
        Seeker_TurnOn_Range := FieldByName('Seeker_TurnOn_Range').AsSingle;
        Lethality := FieldByName('Lethality').AsInteger;
        Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
        Default_Depth := FieldByName('Default_Depth').AsSingle;
        Length := FieldByName('Length').AsSingle;
        Width := FieldByName('Width').AsSingle;
        Height := FieldByName('Height').AsSingle;
        Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
        Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
        LSpeed_Acoustic_Intens := FieldByName('LSpeed_Acoustic_Intens')
          .AsSingle;
        Below_Cav_Acoustic_Intens := FieldByName('Below_Cav_Acoustic_Intens')
          .AsSingle;
        Above_Cav_Acoustic_Intens := FieldByName('Above_Cav_Acoustic_Intens')
          .AsSingle;
        HSpeed_Acoustic_Intens := FieldByName('HSpeed_Acoustic_Intens')
          .AsSingle;
        Cavitation_Switch_Point := FieldByName('Cavitation_Switch_Point')
          .AsSingle;
        Term_Guide_Azimuth := FieldByName('Term_Guide_Azimuth').AsSingle;
        Term_Guide_Elevation := FieldByName('Term_Guide_Elevation').AsSingle;
        Term_Guide_Range := FieldByName('Term_Guide_Range').AsSingle;
        Pursuit_Guidance_Type := FieldByName('Pursuit_Guidance_Type').AsInteger;
        Air_Drop_Capable := FieldByName('Air_Drop_Capable').AsInteger;
        Use_Terminal_Circle := FieldByName('Use_Terminal_Circle').AsInteger;
        Terminal_Circle_Radius := FieldByName('Terminal_Circle_Radius')
          .AsSingle;
        Fixed_Circle_Radius := FieldByName('Fixed_Circle_Radius').AsInteger;
        Lateral_Deceleration := FieldByName('Lateral_Deceleration').AsSingle;
        Airborne_Descent_Rate := FieldByName('Airborne_Descent_Rate').AsFloat;
        Wire_Angle_Offset := FieldByName('Wire_Angle_Offset').AsSingle;
        Guidance_Type := FieldByName('Guidance_Type').AsInteger;
        Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
        Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
        Primary_Target_Domain := FieldByName('Primary_Target_Domain').AsInteger;
        Active_Acoustic_POH_Mod := FieldByName('Active_Acoustic_POH_Mod')
          .AsSingle;
        Passive_Acoustic_POH_Mod := FieldByName('Passive_Acoustic_POH_Mod')
          .AsSingle;
        Active_Passive_POH_Mod := FieldByName('Active_Passive_POH_Mod')
          .AsSingle;
        WireGuide_POH_Modifier := FieldByName('WireGuide_POH_Modifier')
          .AsSingle;
        WakeHome_POH_Modifier := FieldByName('WakeHome_POH_Modifier').AsSingle;
        Active_Seeker_Power := FieldByName('Active_Seeker_Power').AsSingle;
        Active_Seeker_Freq := FieldByName('Active_Seeker_Freq').AsSingle;
        Engagement_Range := FieldByName('Engagement_Range').AsSingle;
        First_Relative_Gyro_Angle := FieldByName('First_Relative_Gyro_Angle')
          .AsInteger;
        Second_Relative_Gyro_Angle := FieldByName('Second_Relative_Gyro_Angle')
          .AsInteger;
        Max_Torpedo_Gyro_Angle := FieldByName('Max_Torpedo_Gyro_Angle')
          .AsSingle;
        Max_Torpedo_Search_Depth := FieldByName('Max_Torpedo_Search_Depth')
          .AsSingle;
        Acoustic_Torp_Ceiling_Depth := FieldByName
          ('Acoustic_Torp_Ceiling_Depth').AsSingle;
        Fixed_Ceiling_Depth := FieldByName('Fixed_Ceiling_Depth').AsInteger;
        Fixed_Seeker_TurnOn_Range := FieldByName('Fixed_Seeker_TurnOn_Range')
          .AsInteger;
        Sinuation_Runout := FieldByName('Sinuation_Runout').AsInteger;
        Runout_Sinuation_Period := FieldByName('Runout_Sinuation_Period')
          .AsSingle;
        Runout_Sinuation_Amplitude := FieldByName('Runout_Sinuation_Amplitude')
          .AsSingle;
        Min_Runout_Range := FieldByName('Min_Runout_Range').AsSingle;
        Launch_Method := FieldByName('Launch_Method').AsInteger;
        Data_Entry_Method := FieldByName('Data_Entry_Method').AsInteger;
        Launch_Speed := FieldByName('Launch_Speed').AsInteger;
        Opt_Launch_Range_Nuc_Sub := FieldByName('Opt_Launch_Range_Nuc_Sub')
          .AsSingle;
        Opt_Launch_Range_Conv_Sub := FieldByName('Opt_Launch_Range_Conv_Sub')
          .AsSingle;
        Opt_Launch_Range_Other := FieldByName('Opt_Launch_Range_Other')
          .AsSingle;
        Detectability_Type := FieldByName('Detectability_Type').AsInteger;
      end;
    end;
  end;
end;

function TdmTTT.getTowed_Jammer_Def(const id: Integer; var aRec: TList;
  var rec: TTowed_Jammer_Decoy_On_Board): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Towed_Jammer_Decoy_Definition ';
    if id <> 0 then
       ssql := ssql + 'WHERE Towed_Decoy_Index  =' + IntToStr(id);
    ssql := ssql + ' ORDER BY Towed_Decoy_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TTowed_Jammer_Decoy_On_Board.Create;

        with rec.FDef do
        begin
          Towed_Decoy_Index := FieldByName('Towed_Decoy_Index').AsInteger;
          Towed_Decoy_Identifier := FieldByName('Towed_Decoy_Identifier')
            .AsString;
          Decoy_TARH_Capable := FieldByName('Decoy_TARH_Capable').AsInteger;
          Decoy_SARH_Capable := FieldByName('Decoy_SARH_Capable').AsInteger;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Visual_Cross := FieldByName('Front_Visual_Cross').AsSingle;
          Side_Visual_Cross := FieldByName('Side_Visual_Cross').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Type_A_Seducing_Prob := FieldByName('Type_A_Seducing_Prob').AsSingle;
          Type_B_Seducing_Prob := FieldByName('Type_B_Seducing_Prob').AsSingle;
          Type_C_Seducing_Prob := FieldByName('Type_C_Seducing_Prob').AsSingle;
          Activation_Control_Delay := FieldByName('Activation_Control_Delay')
            .AsSingle;
          Tow_Length := FieldByName('Tow_Length').AsSingle;
          ECM_Type := FieldByName('ECM_Type').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateTowed_Jammer(rec: TTowed_Jammer_Decoy_On_Board;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Towed_Jammer_Decoy_On_Board ');
      SQL.Add('SET ');
      SQL.Add('Instance_Identifier =''' + Instance_Identifier + ''',');
      SQL.Add('Instance_Type =' + IntToStr(Instance_Type) + ',');
      SQL.Add('Quantity =' + IntToStr(Quantity) + ',');
      SQL.Add('Vehicle_Index =' + FloatToStr(Vehicle_Index));
    end;

    SQL.Add(' WHERE Towed_Decoy_Instance_Index = ' + id);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateTowed_Jammer_Def(rec: TTowed_Jammer_Decoy_On_Board;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Towed_Jammer_Decoy_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Towed_Decoy_Identifier = ''' + Towed_Decoy_Identifier + ''',');
      SQL.Add('Decoy_TARH_Capable = ' + IntToStr(Decoy_TARH_Capable) + ',');
      SQL.Add('Decoy_SARH_Capable = ' + IntToStr(Decoy_SARH_Capable) + ',');
      SQL.Add('Platform_Domain = ' + IntToStr(Platform_Domain) + ',');
      SQL.Add('Platform_Category = ' + IntToStr(Platform_Category) + ',');
      SQL.Add('Platform_Type = ' + IntToStr(Platform_Type) + ',');
      SQL.Add('Length = ' + FloatToStr(Length) + ',');
      SQL.Add('Width = ' + FloatToStr(Width) + ',');
      SQL.Add('Height = ' + FloatToStr(Height) + ',');
      SQL.Add('Front_Radar_Cross = ' + FloatToStr(Front_Radar_Cross) + ',');
      SQL.Add('Side_Radar_Cross = ' + FloatToStr(Side_Radar_Cross) + ',');
      SQL.Add('Front_Visual_Cross = ' + FloatToStr(Front_Visual_Cross) + ',');
      SQL.Add('Side_Visual_Cross = ' + FloatToStr(Side_Visual_Cross) + ',');
      SQL.Add('Front_Acoustic_Cross = ' + FloatToStr(Front_Acoustic_Cross)
          + ',');
      SQL.Add('Side_Acoustic_Cross = ' + FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add('Type_A_Seducing_Prob = ' + FloatToStr(Type_A_Seducing_Prob)
          + ',');
      SQL.Add('Type_B_Seducing_Prob = ' + FloatToStr(Type_B_Seducing_Prob)
          + ',');
      SQL.Add('Type_C_Seducing_Prob = ' + FloatToStr(Type_C_Seducing_Prob)
          + ',');
      SQL.Add('Activation_Control_Delay = ' + FloatToStr
          (Activation_Control_Delay) + ',');
      SQL.Add('Tow_Length = ' + FloatToStr(Tow_Length) + ',');
      SQL.Add('ECM_Type = ' + IntToStr(ECM_Type));
    end;

    SQL.Add('WHERE (Towed_Decoy_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertTowed_Jammer_Def(rec: TTowed_Jammer_Decoy_On_Board)
  : Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Towed_Jammer_Decoy_Definition ');
      SQL.Add(
        '(Towed_Decoy_Identifier,Decoy_TARH_Capable,Decoy_SARH_Capable,Platform_Domain,');
      SQL.Add(
        'Platform_Category,Platform_Type,Length,Width,Height,Front_Radar_Cross,Side_Radar_Cross,');
      SQL.Add(
        'Front_Visual_Cross,Side_Visual_Cross,Front_Acoustic_Cross,Side_Acoustic_Cross,');
      SQL.Add(
        'Type_A_Seducing_Prob,Type_B_Seducing_Prob,Type_C_Seducing_Prob,Activation_Control_Delay,');
      SQL.Add('Tow_Length,ECM_Type)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Towed_Decoy_Identifier + ''',');
      SQL.Add(IntToStr(Decoy_TARH_Capable) + ',');
      SQL.Add(IntToStr(Decoy_SARH_Capable) + ',');
      SQL.Add(IntToStr(Platform_Domain) + ',');
      SQL.Add(IntToStr(Platform_Category) + ',');
      SQL.Add(IntToStr(Platform_Type) + ',');
      SQL.Add(FloatToStr(Length) + ',');
      SQL.Add(FloatToStr(Width) + ',');
      SQL.Add(FloatToStr(Height) + ',');
      SQL.Add(FloatToStr(Front_Radar_Cross) + ',');
      SQL.Add(FloatToStr(Side_Radar_Cross) + ',');
      SQL.Add(FloatToStr(Front_Visual_Cross) + ',');
      SQL.Add(FloatToStr(Side_Visual_Cross) + ',');
      SQL.Add(FloatToStr(Front_Acoustic_Cross) + ',');
      SQL.Add(FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add(FloatToStr(Type_A_Seducing_Prob) + ',');
      SQL.Add(FloatToStr(Type_B_Seducing_Prob) + ',');
      SQL.Add(FloatToStr(Type_C_Seducing_Prob) + ',');
      SQL.Add(FloatToStr(Activation_Control_Delay) + ',');
      SQL.Add(FloatToStr(Tow_Length) + ',');
      SQL.Add(IntToStr(ECM_Type) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Towed_Decoy_Index FROM Towed_Jammer_Decoy_Definition ');
      SQL.Add('WHERE Towed_Decoy_Identifier=' + quotedStr
          (Towed_Decoy_Identifier));
      Open;
      with rec.FDef do
      begin
        Towed_Decoy_Index := FieldByName('Towed_Decoy_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteTowed_Jammer_Def(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Towed_Jammer_Decoy_Definition ');
    SQL.Add('WHERE Towed_Decoy_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertTowed_Jammer(rec: TTowed_Jammer_Decoy_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Towed_Jammer_Decoy_On_Board ');
      SQL.Add(
        '(Instance_Identifier,Instance_Type,Vehicle_Index,Quantity,Towed_Decoy_Index)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Instance_Identifier + ''',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Quantity) + ',');
      SQL.Add(FloatToStr(Towed_Decoy_Index) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

////====================================================
function TdmTTT.DeleteTowed_Jammer_Decoy_On_Board(const id: string;
  var rec: TTowed_Jammer_Decoy_On_Board): integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Towed_Jammer_Decoy_On_Board  ');
    SQL.Add('WHERE (Towed_Decoy_Instance_Index = ' +  id + ')' );
    ExecSQL;
  end;
end;
//-------------------------------------------------------------------

function TdmTTT.GetGame_Environment_Definition(const id: Integer;
  var rec: TGame_Environment_Definition): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add(
      'FROM Game_Environment_Definition a LEFT OUTER JOIN Global_Convergence_Zone b ');
    SQL.Add('ON b.Game_Enviro_Index = a.Game_Enviro_Index ');
    SQL.Add('WHERE (a.Game_Enviro_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TGame_Environment_Definition.Create;

      with rec.FData do
      begin
        Game_Enviro_Index := FieldByName('Game_Enviro_Index').AsInteger;
        Game_Enviro_Identifier := FieldByName('Game_Enviro_Identifier')
          .AsString;
        Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
        Wind_Speed := FieldByName('Wind_Speed').AsSingle;
        Wind_Direction := FieldByName('Wind_Direction').AsSingle;
        Daytime_Visual_Modifier := FieldByName('Daytime_Visual_Modifier')
          .AsSingle;
        Nighttime_Visual_Modifier := FieldByName('Nighttime_Visual_Modifier')
          .AsSingle;
        Daytime_Infrared_Modifier := FieldByName('Daytime_Infrared_Modifier')
          .AsSingle;
        Nighttime_Infrared_Modifier := FieldByName
          ('Nighttime_Infrared_Modifier').AsSingle;
        Sunrise := FieldByName('Sunrise').AsInteger;
        Sunset := FieldByName('Sunset').AsInteger;
        Period_of_Twilight := FieldByName('Period_of_Twilight').AsInteger;
        Rain_Rate := FieldByName('Rain_Rate').AsInteger;
        Cloud_Base_Height := FieldByName('Cloud_Base_Height').AsSingle;
        Cloud_Attenuation := FieldByName('Cloud_Attenuation').AsInteger;
        Sea_State := FieldByName('Sea_State').AsInteger;
        Ocean_Current_Speed := FieldByName('Ocean_Current_Speed').AsSingle;
        Ocean_Current_Direction := FieldByName('Ocean_Current_Direction')
          .AsSingle;
        Thermal_Layer_Depth := FieldByName('Thermal_Layer_Depth').AsSingle;
        Sound_Velocity_Type := FieldByName('Sound_Velocity_Type').AsInteger;
        Surface_Sound_Speed := FieldByName('Surface_Sound_Speed').AsSingle;
        Layer_Sound_Speed := FieldByName('Layer_Sound_Speed').AsSingle;
        Bottom_Sound_Speed := FieldByName('Bottom_Sound_Speed').AsSingle;
        Bottomloss_Coefficient := FieldByName('Bottomloss_Coefficient')
          .AsInteger;
        Ave_Ocean_Depth := FieldByName('Ave_Ocean_Depth').AsSingle;
        CZ_Active := FieldByName('CZ_Active').AsInteger;
        Surface_Ducting_Active := FieldByName('Surface_Ducting_Active')
          .AsInteger;
        Upper_Limit_Surface_Duct_Depth := FieldByName
          ('Upper_Limit_Surface_Duct_Depth').AsSingle;
        Lower_Limit_Surface_Duct_Depth := FieldByName
          ('Lower_Limit_Surface_Duct_Depth').AsSingle;
        Sub_Ducting_Active := FieldByName('Sub_Ducting_Active').AsInteger;
        Upper_Limit_Sub_Duct_Depth := FieldByName('Upper_Limit_Sub_Duct_Depth')
          .AsSingle;
        Lower_Limit_Sub_Duct_Depth := FieldByName('Lower_Limit_Sub_Duct_Depth')
          .AsSingle;
        Shipping_Rate := FieldByName('Shipping_Rate').AsInteger;
        Shadow_Zone_Trans_Loss := FieldByName('Shadow_Zone_Trans_Loss')
          .AsSingle;
        Atmospheric_Refract_Modifier := FieldByName
          ('Atmospheric_Refract_Modifier').AsSingle;
        Barometric_Pressure := FieldByName('Barometric_Pressure').AsSingle;
        Air_Temperature := FieldByName('Air_Temperature').AsSingle;
        Surface_Temperature := FieldByName('Surface_Temperature').AsSingle;
        Start_HF_Range_Gap := FieldByName('Start_HF_Range_Gap').AsSingle;
        End_HF_Range_Gap := FieldByName('End_HF_Range_Gap').AsSingle;
        Game_Area_Index_2 := FieldByName('Game_Area_Index_2').AsInteger;
        Game_Area_Index_3 := FieldByName('Game_Area_Index_3').AsInteger;
        Game_Def_1 := FieldByName('Game_Def_1').AsString;
        Game_Def_2 := FieldByName('Game_Def_2').AsString;
        Game_Def_3 := FieldByName('Game_Def_3').AsString;
      end;

      with rec.FGlobal_Conv do
      begin
        Converge_Index := FieldByName('Converge_Index').AsInteger;
        Game_Enviro_Index := FieldByName('Game_Enviro_Index').AsInteger;
        Occurance_Range := FieldByName('Occurance_Range').AsSingle;
        Width := FieldByName('Width').AsSingle;
        Signal_Reduction_Term := FieldByName('Signal_Reduction_Term').AsSingle;
        Increase_per_CZ := FieldByName('Increase_per_CZ').AsSingle;
        Max_Sonar_Depth := FieldByName('Max_Sonar_Depth').AsSingle;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Environment_Definition_By_Identifier(const id: String;
  var rec: TGame_Environment_Definition): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add
      ('FROM Game_Environment_Definition a JOIN Global_Convergence_Zone b ');
    SQL.Add('ON b.Game_Enviro_Index = a.Game_Enviro_Index ');
    SQL.Add('WHERE (a.Game_Enviro_Identifier = ' + quotedStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TGame_Environment_Definition.Create;

      with rec.FData do
      begin
        Game_Enviro_Index := FieldByName('Game_Enviro_Index').AsInteger;
        Game_Enviro_Identifier := FieldByName('Game_Enviro_Identifier')
          .AsString;
        Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
        Wind_Speed := FieldByName('Wind_Speed').AsSingle;
        Wind_Direction := FieldByName('Wind_Direction').AsSingle;
        Daytime_Visual_Modifier := FieldByName('Daytime_Visual_Modifier')
          .AsSingle;
        Nighttime_Visual_Modifier := FieldByName('Nighttime_Visual_Modifier')
          .AsSingle;
        Daytime_Infrared_Modifier := FieldByName('Daytime_Infrared_Modifier')
          .AsSingle;
        Nighttime_Infrared_Modifier := FieldByName
          ('Nighttime_Infrared_Modifier').AsSingle;
        Sunrise := FieldByName('Sunrise').AsInteger;
        Sunset := FieldByName('Sunset').AsInteger;
        Period_of_Twilight := FieldByName('Period_of_Twilight').AsInteger;
        Rain_Rate := FieldByName('Rain_Rate').AsInteger;
        Cloud_Base_Height := FieldByName('Cloud_Base_Height').AsSingle;
        Cloud_Attenuation := FieldByName('Cloud_Attenuation').AsInteger;
        Sea_State := FieldByName('Sea_State').AsInteger;
        Ocean_Current_Speed := FieldByName('Ocean_Current_Speed').AsSingle;
        Ocean_Current_Direction := FieldByName('Ocean_Current_Direction')
          .AsSingle;
        Thermal_Layer_Depth := FieldByName('Thermal_Layer_Depth').AsSingle;
        Sound_Velocity_Type := FieldByName('Sound_Velocity_Type').AsInteger;
        Surface_Sound_Speed := FieldByName('Surface_Sound_Speed').AsSingle;
        Layer_Sound_Speed := FieldByName('Layer_Sound_Speed').AsSingle;
        Bottom_Sound_Speed := FieldByName('Bottom_Sound_Speed').AsSingle;
        Bottomloss_Coefficient := FieldByName('Bottomloss_Coefficient')
          .AsInteger;
        Ave_Ocean_Depth := FieldByName('Ave_Ocean_Depth').AsSingle;
        CZ_Active := FieldByName('CZ_Active').AsInteger;
        Surface_Ducting_Active := FieldByName('Surface_Ducting_Active')
          .AsInteger;
        Upper_Limit_Surface_Duct_Depth := FieldByName
          ('Upper_Limit_Surface_Duct_Depth').AsSingle;
        Lower_Limit_Surface_Duct_Depth := FieldByName
          ('Lower_Limit_Surface_Duct_Depth').AsSingle;
        Sub_Ducting_Active := FieldByName('Sub_Ducting_Active').AsInteger;
        Upper_Limit_Sub_Duct_Depth := FieldByName('Upper_Limit_Sub_Duct_Depth')
          .AsSingle;
        Lower_Limit_Sub_Duct_Depth := FieldByName('Lower_Limit_Sub_Duct_Depth')
          .AsSingle;
        Shipping_Rate := FieldByName('Shipping_Rate').AsInteger;
        Shadow_Zone_Trans_Loss := FieldByName('Shadow_Zone_Trans_Loss')
          .AsSingle;
        Atmospheric_Refract_Modifier := FieldByName
          ('Atmospheric_Refract_Modifier').AsSingle;
        Barometric_Pressure := FieldByName('Barometric_Pressure').AsSingle;
        Air_Temperature := FieldByName('Air_Temperature').AsSingle;
        Surface_Temperature := FieldByName('Surface_Temperature').AsSingle;
        Start_HF_Range_Gap := FieldByName('Start_HF_Range_Gap').AsSingle;
        End_HF_Range_Gap := FieldByName('End_HF_Range_Gap').AsSingle;
        Game_Area_Index_2 := FieldByName('Game_Area_Index_2').AsInteger;
        Game_Area_Index_3 := FieldByName('Game_Area_Index_3').AsInteger;
        Game_Def_1 := FieldByName('Game_Def_1').AsString;
        Game_Def_2 := FieldByName('Game_Def_2').AsString;
        Game_Def_3 := FieldByName('Game_Def_3').AsString;
      end;

      with rec.FGlobal_Conv do
      begin
        Converge_Index := FieldByName('Converge_Index').AsInteger;
        Game_Enviro_Index := FieldByName('Game_Enviro_Index').AsInteger;
        Occurance_Range := FieldByName('Occurance_Range').AsSingle;
        Width := FieldByName('Width').AsSingle;
        Signal_Reduction_Term := FieldByName('Signal_Reduction_Term').AsSingle;
        Increase_per_CZ := FieldByName('Increase_per_CZ').AsSingle;
        Max_Sonar_Depth := FieldByName('Max_Sonar_Depth').AsSingle;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetAllGame_Environment_Definition(var gList: TList): Integer;
var
  rec: TGame_Environment_Definition;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Environment_Definition ');
    SQL.Add('ORDER BY Game_Enviro_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(gList) then
        gList := TList.Create
      else
        gList.Clear;

      while not ZQ.Eof do
      begin
        rec := TGame_Environment_Definition.Create;

        with rec.FData do
        begin
          Game_Enviro_Index := FieldByName('Game_Enviro_Index').AsInteger;
          Game_Enviro_Identifier := FieldByName('Game_Enviro_Identifier')
            .AsString;
          Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
          Wind_Speed := FieldByName('Wind_Speed').AsSingle;
          Wind_Direction := FieldByName('Wind_Direction').AsSingle;
          Daytime_Visual_Modifier := FieldByName('Daytime_Visual_Modifier')
            .AsSingle;
          Nighttime_Visual_Modifier := FieldByName('Nighttime_Visual_Modifier')
            .AsSingle;
          Daytime_Infrared_Modifier := FieldByName('Daytime_Infrared_Modifier')
            .AsSingle;
          Nighttime_Infrared_Modifier := FieldByName
            ('Nighttime_Infrared_Modifier').AsSingle;
          Sunrise := FieldByName('Sunrise').AsInteger;
          Sunset := FieldByName('Sunset').AsInteger;
          Period_of_Twilight := FieldByName('Period_of_Twilight').AsInteger;
          Rain_Rate := FieldByName('Rain_Rate').AsInteger;
          Cloud_Base_Height := FieldByName('Cloud_Base_Height').AsSingle;
          Cloud_Attenuation := FieldByName('Cloud_Attenuation').AsInteger;
          Sea_State := FieldByName('Sea_State').AsInteger;
          Ocean_Current_Speed := FieldByName('Ocean_Current_Speed').AsSingle;
          Ocean_Current_Direction := FieldByName('Ocean_Current_Direction')
            .AsSingle;
          Thermal_Layer_Depth := FieldByName('Thermal_Layer_Depth').AsSingle;
          Sound_Velocity_Type := FieldByName('Sound_Velocity_Type').AsInteger;
          Surface_Sound_Speed := FieldByName('Surface_Sound_Speed').AsSingle;
          Layer_Sound_Speed := FieldByName('Layer_Sound_Speed').AsSingle;
          Bottom_Sound_Speed := FieldByName('Bottom_Sound_Speed').AsSingle;
          Bottomloss_Coefficient := FieldByName('Bottomloss_Coefficient')
            .AsInteger;
          Ave_Ocean_Depth := FieldByName('Ave_Ocean_Depth').AsSingle;
          CZ_Active := FieldByName('CZ_Active').AsInteger;
          Surface_Ducting_Active := FieldByName('Surface_Ducting_Active')
            .AsInteger;
          Upper_Limit_Surface_Duct_Depth := FieldByName
            ('Upper_Limit_Surface_Duct_Depth').AsSingle;
          Lower_Limit_Surface_Duct_Depth := FieldByName
            ('Lower_Limit_Surface_Duct_Depth').AsSingle;
          Sub_Ducting_Active := FieldByName('Sub_Ducting_Active').AsInteger;
          Upper_Limit_Sub_Duct_Depth := FieldByName
            ('Upper_Limit_Sub_Duct_Depth').AsSingle;
          Lower_Limit_Sub_Duct_Depth := FieldByName
            ('Lower_Limit_Sub_Duct_Depth').AsSingle;
          Shipping_Rate := FieldByName('Shipping_Rate').AsInteger;
          Shadow_Zone_Trans_Loss := FieldByName('Shadow_Zone_Trans_Loss')
            .AsSingle;
          Atmospheric_Refract_Modifier := FieldByName
            ('Atmospheric_Refract_Modifier').AsSingle;
          Barometric_Pressure := FieldByName('Barometric_Pressure').AsSingle;
          Air_Temperature := FieldByName('Air_Temperature').AsSingle;
          Surface_Temperature := FieldByName('Surface_Temperature').AsSingle;
          Start_HF_Range_Gap := FieldByName('Start_HF_Range_Gap').AsSingle;
          End_HF_Range_Gap := FieldByName('End_HF_Range_Gap').AsSingle;
          Game_Area_Index_2 := FieldByName('Game_Area_Index_2').AsInteger;
          Game_Area_Index_3 := FieldByName('Game_Area_Index_3').AsInteger;
          Game_Def_1 := FieldByName('Game_Def_1').AsString;
          Game_Def_2 := FieldByName('Game_Def_2').AsString;
          Game_Def_3 := FieldByName('Game_Def_3').AsString;
        end;

        gList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateGame_Environment_Def(rec: TGame_Environment_Definition;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Game_Environment_Definition ');
      SQL.Add('SET ');
      SQL.Add('Game_Enviro_Identifier =''' + Game_Enviro_Identifier + ''',');
      SQL.Add('Game_Area_Index =' + IntToStr(Game_Area_Index) + ',');
      SQL.Add('Wind_Speed =' + FloatToStr(Wind_Speed) + ',');
      SQL.Add('Wind_Direction =' + FloatToStr(Wind_Direction) + ',');
      SQL.Add('Daytime_Visual_Modifier =' + FloatToStr(Daytime_Visual_Modifier)
          + ',');
      SQL.Add('Nighttime_Visual_Modifier =' + FloatToStr
          (Nighttime_Visual_Modifier) + ',');
      SQL.Add('Daytime_Infrared_Modifier =' + FloatToStr
          (Daytime_Infrared_Modifier) + ',');
      SQL.Add('Nighttime_Infrared_Modifier =' + FloatToStr
          (Nighttime_Infrared_Modifier) + ',');
      SQL.Add('Sunrise =' + IntToStr(Sunrise) + ',');
      SQL.Add('Sunset =' + IntToStr(Sunset) + ',');
      SQL.Add('Period_of_Twilight =' + IntToStr(Period_of_Twilight) + ',');
      SQL.Add('Rain_Rate =' + IntToStr(Rain_Rate) + ',');
      SQL.Add('Cloud_Base_Height =' + FloatToStr(Cloud_Base_Height) + ',');
      SQL.Add('Cloud_Attenuation =' + IntToStr(Cloud_Attenuation) + ',');
      SQL.Add('Sea_State =' + FloatToStr(Sea_State) + ',');
      SQL.Add('Ocean_Current_Speed =' + FloatToStr(Ocean_Current_Speed) + ',');
      SQL.Add('Ocean_Current_Direction =' + FloatToStr(Ocean_Current_Direction)
          + ',');
      SQL.Add('Thermal_Layer_Depth =' + FloatToStr(Thermal_Layer_Depth) + ',');
      SQL.Add('Sound_Velocity_Type =' + IntToStr(Sound_Velocity_Type) + ',');
      SQL.Add('Surface_Sound_Speed =' + FloatToStr(Nighttime_Visual_Modifier)
          + ',');
      SQL.Add('Layer_Sound_Speed =' + FloatToStr(Layer_Sound_Speed) + ',');
      SQL.Add('Bottom_Sound_Speed =' + FloatToStr(Bottom_Sound_Speed) + ',');
      SQL.Add('Bottomloss_Coefficient =' + IntToStr(Bottomloss_Coefficient)
          + ',');
      SQL.Add('Ave_Ocean_Depth =' + FloatToStr(Ave_Ocean_Depth) + ',');
      SQL.Add('CZ_Active =' + IntToStr(CZ_Active) + ',');
      SQL.Add('Surface_Ducting_Active =' + IntToStr(Surface_Ducting_Active)
          + ',');
      SQL.Add('Upper_Limit_Surface_Duct_Depth =' + FloatToStr
          (Upper_Limit_Surface_Duct_Depth) + ',');
      SQL.Add('Lower_Limit_Surface_Duct_Depth =' + FloatToStr
          (Lower_Limit_Surface_Duct_Depth) + ',');
      SQL.Add('Sub_Ducting_Active =' + IntToStr(Sub_Ducting_Active) + ',');
      SQL.Add('Upper_Limit_Sub_Duct_Depth =' + FloatToStr
          (Upper_Limit_Sub_Duct_Depth) + ',');
      SQL.Add('Lower_Limit_Sub_Duct_Depth  =' + FloatToStr
          (Lower_Limit_Sub_Duct_Depth) + ',');
      SQL.Add('Shipping_Rate =' + IntToStr(Shipping_Rate) + ',');
      SQL.Add('Shadow_Zone_Trans_Loss =' + FloatToStr(Shadow_Zone_Trans_Loss)
          + ',');
      SQL.Add('Atmospheric_Refract_Modifier =' + FloatToStr
          (Atmospheric_Refract_Modifier) + ',');
      SQL.Add('Barometric_Pressure =' + FloatToStr(Barometric_Pressure) + ',');
      SQL.Add('Air_Temperature =' + FloatToStr(Air_Temperature) + ',');
      SQL.Add('Surface_Temperature =' + FloatToStr(Surface_Temperature) + ',');
      SQL.Add('Start_HF_Range_Gap =' + FloatToStr(Start_HF_Range_Gap) + ',');
      SQL.Add('End_HF_Range_Gap =' + FloatToStr(End_HF_Range_Gap)+ ',');
      SQL.Add('Game_Area_Index_2 =' + IntToStr(Game_Area_Index_2) + ',');
      SQL.Add('Game_Area_Index_3 =' + IntToStr(Game_Area_Index_3));
      SQL.Add('Game_Def_1 =''' + Game_Def_1 + ''',');
      SQL.Add('Game_Def_2 =''' + Game_Def_2 + ''',');
      SQL.Add('Game_Def_3 =''' + Game_Def_3 + ''',');
    end;

    SQL.Add(' WHERE (Game_Enviro_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteGame_Environment_Def(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Game_Environment_Definition ');
    SQL.Add('WHERE Game_Enviro_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertGame_Environment_Def(rec: TGame_Environment_Definition)
  : TGame_Environment_Definition;
begin
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      {
        SQL.Clear;
        SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Game_Environment_Definition] ON;');
        ExecSQL;
        }
      SQL.Clear;
      SQL.Add('INSERT INTO Game_Environment_Definition ');
      SQL.Add(
        '(Game_Enviro_Identifier,Game_Area_Index,Wind_Speed,Wind_Direction,');
      SQL.Add(
        'Daytime_Visual_Modifier,Nighttime_Visual_Modifier,Daytime_Infrared_Modifier,Nighttime_Infrared_Modifier,');
      SQL.Add(
        'Sunrise,Sunset,Period_of_Twilight,Rain_Rate,Cloud_Base_Height,Cloud_Attenuation,');
      SQL.Add(
        'Sea_State,Ocean_Current_Speed,Ocean_Current_Direction,Thermal_Layer_Depth,Sound_Velocity_Type,');
      SQL.Add(
        'Surface_Sound_Speed,Layer_Sound_Speed,Bottom_Sound_Speed,Bottomloss_Coefficient,Ave_Ocean_Depth,');
      SQL.Add(
        'CZ_Active,Surface_Ducting_Active,Upper_Limit_Surface_Duct_Depth,Lower_Limit_Surface_Duct_Depth, Sub_Ducting_Active, Upper_Limit_Sub_Duct_Depth, Lower_Limit_Sub_Duct_Depth,');
      SQL.Add(
        'Shipping_Rate,Shadow_Zone_Trans_Loss,Atmospheric_Refract_Modifier,Barometric_Pressure,Air_Temperature,');
      SQL.Add('Surface_Temperature,Start_HF_Range_Gap,End_HF_Range_Gap, Game_Area_Index_2, Game_Area_Index_3, Game_Def_1, Game_Def_2, Game_Def_3)');

      SQL.Add(' VALUES (');
      // SQL.Add(IntToStr(Game_Enviro_Index)+',');
      SQL.Add('''' + Game_Enviro_Identifier + ''',');
      SQL.Add(IntToStr(Game_Area_Index) + ',');
      SQL.Add(FloatToStr(Wind_Speed) + ',');
      SQL.Add(FloatToStr(Wind_Direction) + ',');
      SQL.Add(FloatToStr(Daytime_Visual_Modifier) + ',');
      SQL.Add(FloatToStr(Nighttime_Visual_Modifier) + ',');
      SQL.Add(FloatToStr(Daytime_Infrared_Modifier) + ',');
      SQL.Add(FloatToStr(Nighttime_Infrared_Modifier) + ',');
      SQL.Add(IntToStr(Sunrise) + ',');
      SQL.Add(IntToStr(Sunset) + ',');
      SQL.Add(IntToStr(Period_of_Twilight) + ',');
      SQL.Add(IntToStr(Rain_Rate) + ',');
      SQL.Add(FloatToStr(Cloud_Base_Height) + ',');
      SQL.Add(IntToStr(Cloud_Attenuation) + ',');
      SQL.Add(IntToStr(Sea_State) + ',');
      SQL.Add(FloatToStr(Ocean_Current_Speed) + ',');
      SQL.Add(FloatToStr(Ocean_Current_Direction) + ',');
      SQL.Add(FloatToStr(Thermal_Layer_Depth) + ',');
      SQL.Add(IntToStr(Sound_Velocity_Type) + ',');
      SQL.Add(FloatToStr(Surface_Sound_Speed) + ',');
      SQL.Add(FloatToStr(Layer_Sound_Speed) + ',');
      SQL.Add(FloatToStr(Bottom_Sound_Speed) + ',');
      SQL.Add(IntToStr(Bottomloss_Coefficient) + ',');
      SQL.Add(FloatToStr(Ave_Ocean_Depth) + ',');
      SQL.Add(IntToStr(CZ_Active) + ',');
      SQL.Add(IntToStr(Surface_Ducting_Active) + ',');
      SQL.Add(FloatToStr(Upper_Limit_Surface_Duct_Depth) + ',');
      SQL.Add(FloatToStr(Lower_Limit_Surface_Duct_Depth) + ',');
      SQL.Add(IntToStr(Sub_Ducting_Active) + ',');
      SQL.Add(FloatToStr(Upper_Limit_Sub_Duct_Depth) + ',');
      SQL.Add(FloatToStr(Lower_Limit_Sub_Duct_Depth) + ',');
      SQL.Add(IntToStr(Shipping_Rate) + ',');
      SQL.Add(FloatToStr(Shadow_Zone_Trans_Loss) + ',');
      SQL.Add(FloatToStr(Atmospheric_Refract_Modifier) + ',');
      SQL.Add(FloatToStr(Barometric_Pressure) + ',');
      SQL.Add(FloatToStr(Air_Temperature) + ',');
      SQL.Add(FloatToStr(Surface_Temperature) + ',');
      SQL.Add(FloatToStr(Start_HF_Range_Gap) + ',');
      SQL.Add(FloatToStr(End_HF_Range_Gap) + ',');
      SQL.Add(IntToStr(Game_Area_Index_2) + ',') ;
      SQL.Add(IntToStr(Game_Area_Index_3) + ',');
      SQL.Add('''' + Game_Def_1 + ''',');
      SQL.Add('''' + Game_Def_2 + ''',');
      SQL.Add('''' + Game_Def_3 + ''')');

      // ShowMessage(SQL.Text);
      ExecSQL;
    end;
  end;

  // ambil nilai return
  with ZQ do
  begin
    Close;
    SQL.Clear;
    //SQL.Add('USE Runtime_DB');
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Environment_Definition a');
    SQL.Add('WHERE a.Game_Enviro_Identifier Like ' + quotedStr
        (rec.FData.Game_Enviro_Identifier) + '');
    // ShowMessage(SQL.Text);
    Open;

    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TGame_Environment_Definition.Create;

      with rec.FData do
      begin
        Game_Enviro_Index := FieldByName('Game_Enviro_Index').AsInteger;
        Game_Enviro_Identifier := FieldByName('Game_Enviro_Identifier')
          .AsString;
        Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
        Wind_Speed := FieldByName('Wind_Speed').AsSingle;
        Wind_Direction := FieldByName('Wind_Direction').AsSingle;
        Daytime_Visual_Modifier := FieldByName('Daytime_Visual_Modifier')
          .AsSingle;
        Nighttime_Visual_Modifier := FieldByName('Nighttime_Visual_Modifier')
          .AsSingle;
        Daytime_Infrared_Modifier := FieldByName('Daytime_Infrared_Modifier')
          .AsSingle;
        Nighttime_Infrared_Modifier := FieldByName
          ('Nighttime_Infrared_Modifier').AsSingle;
        Sunrise := FieldByName('Sunrise').AsInteger;
        Sunset := FieldByName('Sunset').AsInteger;
        Period_of_Twilight := FieldByName('Period_of_Twilight').AsInteger;
        Rain_Rate := FieldByName('Rain_Rate').AsInteger;
        Cloud_Base_Height := FieldByName('Cloud_Base_Height').AsSingle;
        Cloud_Attenuation := FieldByName('Cloud_Attenuation').AsInteger;
        Sea_State := FieldByName('Sea_State').AsInteger;
        Ocean_Current_Speed := FieldByName('Ocean_Current_Speed').AsSingle;
        Ocean_Current_Direction := FieldByName('Ocean_Current_Direction')
          .AsSingle;
        Thermal_Layer_Depth := FieldByName('Thermal_Layer_Depth').AsSingle;
        Sound_Velocity_Type := FieldByName('Sound_Velocity_Type').AsInteger;
        Surface_Sound_Speed := FieldByName('Surface_Sound_Speed').AsSingle;
        Layer_Sound_Speed := FieldByName('Layer_Sound_Speed').AsSingle;
        Bottom_Sound_Speed := FieldByName('Bottom_Sound_Speed').AsSingle;
        Bottomloss_Coefficient := FieldByName('Bottomloss_Coefficient')
          .AsInteger;
        Ave_Ocean_Depth := FieldByName('Ave_Ocean_Depth').AsSingle;
        CZ_Active := FieldByName('CZ_Active').AsInteger;
        Surface_Ducting_Active := FieldByName('Surface_Ducting_Active')
          .AsInteger;
        Upper_Limit_Surface_Duct_Depth := FieldByName
          ('Upper_Limit_Surface_Duct_Depth').AsSingle;
        Lower_Limit_Surface_Duct_Depth := FieldByName
          ('Lower_Limit_Surface_Duct_Depth').AsSingle;
        Sub_Ducting_Active := FieldByName('Sub_Ducting_Active').AsInteger;
        Upper_Limit_Sub_Duct_Depth := FieldByName('Upper_Limit_Sub_Duct_Depth')
          .AsSingle;
        Lower_Limit_Sub_Duct_Depth := FieldByName('Lower_Limit_Sub_Duct_Depth')
          .AsSingle;
        Shipping_Rate := FieldByName('Shipping_Rate').AsInteger;
        Shadow_Zone_Trans_Loss := FieldByName('Shadow_Zone_Trans_Loss')
          .AsSingle;
        Atmospheric_Refract_Modifier := FieldByName
          ('Atmospheric_Refract_Modifier').AsSingle;
        Barometric_Pressure := FieldByName('Barometric_Pressure').AsSingle;
        Air_Temperature := FieldByName('Air_Temperature').AsSingle;
        Surface_Temperature := FieldByName('Surface_Temperature').AsSingle;
        Start_HF_Range_Gap := FieldByName('Start_HF_Range_Gap').AsSingle;
        End_HF_Range_Gap := FieldByName('End_HF_Range_Gap').AsSingle;
        Game_Def_1 := FieldByName('Game_Def_1').AsString;
        Game_Def_2 := FieldByName('Game_Def_2').AsString;
        Game_Def_3 := FieldByName('Game_Def_3').AsString;

      end;
    end;
  end;

  result := rec;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Area_Def(var gList: TList): Integer;
var
  rec: TGame_Environment_Definition;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Area_Definition ');
    SQL.Add('ORDER BY Game_Area_Identifier');
    Open;

    result := RecordCount;
    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(gList) then
        gList := TList.Create
      else
        gList.Clear;

      while not ZQ.Eof do
      begin
        rec := TGame_Environment_Definition.Create;

        with rec.FGameArea do
        begin
          Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
          Game_Area_Identifier := FieldByName('Game_Area_Identifier').AsString;
          Game_Centre_Lat := FieldByName('Game_Centre_Lat').AsFloat;
          Game_Centre_Long := FieldByName('Game_Centre_Long').AsFloat;
          Game_X_Dimension := FieldByName('Game_X_Dimension').AsSingle;
          Game_Y_Dimension := FieldByName('Game_Y_Dimension').AsSingle;
          Use_Real_World := FieldByName('Use_Real_World').AsInteger;
          Use_Artificial_Landmass := FieldByName('Use_Artificial_Landmass')
            .AsInteger;
          Detail_Map := FieldByName('Detail_Map').AsString;
        end;

        gList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Area_DefByID(const id: Integer;
  var gameArea: TGame_Environment_Definition): Integer;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Area_Definition ');
    SQL.Add('WHERE Game_Area_Index = ' + IntToStr(id));
    Open;

    if not ZQ.IsEmpty then
    begin
      if not Assigned(gameArea) then
        gameArea := TGame_Environment_Definition.Create;

      with gameArea.FGameArea do
      begin
        Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
        Game_Area_Identifier := FieldByName('Game_Area_Identifier').AsString;
        Game_Centre_Lat := FieldByName('Game_Centre_Lat').AsFloat;
        Game_Centre_Long := FieldByName('Game_Centre_Long').AsFloat;
        Game_X_Dimension := FieldByName('Game_X_Dimension').AsSingle;
        Game_Y_Dimension := FieldByName('Game_Y_Dimension').AsSingle;
        Use_Real_World := FieldByName('Use_Real_World').AsInteger;
        Use_Artificial_Landmass := FieldByName('Use_Artificial_Landmass')
          .AsInteger;
        Detail_Map := FieldByName('Detail_Map').AsString;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getGame_Area_Identifier(id: string; gList: TList;
  var rec: TGame_Environment_Definition): Integer;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Area_Definition ');
    SQL.Add('WHERE Game_Area_Index =' + id);
    Open;

    result := RecordCount;
    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(gList) then
        gList := TList.Create
      else
        gList.Clear;

      while not ZQ.Eof do
      begin
        rec := TGame_Environment_Definition.Create;

        with rec.FGameArea do
        begin
          Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
          Game_Area_Identifier := FieldByName('Game_Area_Identifier').AsString;
          Game_Centre_Lat := FieldByName('Game_Centre_Lat').AsFloat;
          Game_Centre_Long := FieldByName('Game_Centre_Long').AsFloat;
          Game_X_Dimension := FieldByName('Game_X_Dimension').AsSingle;
          Game_Y_Dimension := FieldByName('Game_Y_Dimension').AsSingle;
          Use_Real_World := FieldByName('Use_Real_World').AsInteger;
          Use_Artificial_Landmass := FieldByName('Use_Artificial_Landmass')
            .AsInteger;
          Detail_Map := FieldByName('Detail_Map').AsString;
        end;

        gList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateGame_Area_Def(rec: TGame_Environment_Definition;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FGameArea do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Game_Area_Definition ');
      SQL.Add('SET ');
      SQL.Add('Game_Area_Identifier =''' + Game_Area_Identifier + ''',');
      SQL.Add('Game_Centre_Lat =' + FloatToStr(Game_Centre_Lat) + ',');
      SQL.Add('Game_Centre_Long =' + FloatToStr(Game_Centre_Long) + ',');
      SQL.Add('Game_X_Dimension =' + FloatToStr(Game_X_Dimension) + ',');
      SQL.Add('Game_Y_Dimension =' + FloatToStr(Game_Y_Dimension) + ',');
      SQL.Add('Use_Real_World =' + IntToStr(Use_Real_World) + ',');
      SQL.Add('Use_Artificial_Landmass =' + IntToStr(Use_Artificial_Landmass)
          + ',');
      SQL.Add('Detail_Map =''' + Detail_Map + '''');
    end;

    SQL.Add(' WHERE (Game_Area_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertGame_Area_Def(rec: TGame_Environment_Definition): Integer;
begin
  with ZQ do
  begin
    with rec.FGameArea do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Game_Area_Definition ');
      SQL.Add(
        '(Game_Area_Identifier,Game_Centre_Lat,Game_Centre_Long,Game_X_Dimension,Game_Y_Dimension,Use_Real_World,Use_Artificial_Landmass,Detail_Map)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Game_Area_Identifier + ''',');
      SQL.Add(FloatToStr(Game_Centre_Lat) + ',');
      SQL.Add(FloatToStr(Game_Centre_Long) + ',');
      SQL.Add(FloatToStr(Game_X_Dimension) + ',');
      SQL.Add(FloatToStr(Game_Y_Dimension) + ',');
      SQL.Add(IntToStr(Use_Real_World) + ',');
      SQL.Add(IntToStr(Use_Artificial_Landmass) + ',');
      SQL.Add('''' + Detail_Map + '''' + ')');
      // ShowMessage(SQL.Text);
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Game_Area_Definition ');
      SQL.Add('WHERE Game_Area_Identifier =' + quotedStr
          (rec.FGameArea.Game_Area_Identifier));
      Open;
      begin
        rec := TGame_Environment_Definition.Create;

        with rec.FGameArea do
        begin
          Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
          Game_Area_Identifier := FieldByName('Game_Area_Identifier').AsString;
          Game_Centre_Lat := FieldByName('Game_Centre_Lat').AsFloat;
          Game_Centre_Long := FieldByName('Game_Centre_Long').AsFloat;
          Game_X_Dimension := FieldByName('Game_X_Dimension').AsSingle;
          Game_Y_Dimension := FieldByName('Game_Y_Dimension').AsSingle;
          Use_Real_World := FieldByName('Use_Real_World').AsInteger;
          Use_Artificial_Landmass := FieldByName('Use_Artificial_Landmass')
            .AsInteger;
          Detail_Map := FieldByName('Detail_Map').AsString;
        end;
      end;

      result := rec.FGameArea.Game_Area_Index;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteGame_Area_Def(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Game_Area_Definition ');
    SQL.Add('WHERE Game_Area_Index =' + IntToStr(id));
    ExecSQL
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetOverlay(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TOverlay_Definition;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Overlay_Definition ');
    SQL.Add('WHERE (Overlay_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TOverlay_Definition.Create;

        with rec.FData do
        begin
          Overlay_Index := FieldByName('Overlay_Index').AsInteger;
          Overlay_Identifier := FieldByName('Overlay_Identifier').AsString;
          Overlay_Filename := FieldByName('Overlay_Filename').AsString;
          Static_Overlay := FieldByName('Static_Overlay').AsInteger;
          Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
          domain := FieldByName('Domain').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetOverlay_Definition(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TOverlay_Definition;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Overlay_Definition ');
    SQL.Add('WHERE (Game_Area_index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TOverlay_Definition.Create;

        with rec.FData do
        begin
          Overlay_Index := FieldByName('Overlay_Index').AsInteger;
          Overlay_Identifier := FieldByName('Overlay_Identifier').AsString;
          Overlay_Filename := FieldByName('Overlay_Filename').AsString;
          Static_Overlay := FieldByName('Static_Overlay').AsInteger;
          Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
          domain := FieldByName('Domain').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetOverlay_DefinitionByID(const id: Integer;
  var rec: TOverlay_Definition): Integer;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Overlay_Definition');
    SQL.Add('WHERE (Overlay_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      rec := TOverlay_Definition.Create;

      with rec.FData do
      begin
        Overlay_Index := FieldByName('Overlay_Index').AsInteger;
        Overlay_Identifier := FieldByName('Overlay_Identifier').AsString;
        Overlay_Filename := FieldByName('Overlay_Filename').AsString;
        Static_Overlay := FieldByName('Static_Overlay').AsInteger;
        Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
        domain := FieldByName('Domain').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateOverlay_Definition(rec: TOverlay_Definition;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Overlay_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Overlay_Index = ' + IntToStr(Overlay_Index) + ',');
      SQL.Add('Overlay_Identifier = ''' + Overlay_Identifier + ''',');
      SQL.Add('Overlay_Filename = ''' + Overlay_Filename + ''',');
      SQL.Add('Static_Overlay = ' + IntToStr(Static_Overlay) + ',');
      SQL.Add('Game_Area_Index = ' + IntToStr(Game_Area_Index) + ',');
      SQL.Add('Domain = ' + IntToStr(domain));
    end;

    SQL.Add('WHERE (Overlay_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

//function TdmTTT.insertOverlay_Definition(rec: TOverlay_Definition): Integer;
function TdmTTT.insertOverlay_Definition(rec: TRecOverlay_Definition): Integer;
begin
  { Documentation
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      {
        SQL.Clear;
        SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Overlay_Definition] ON;');
        ExecSQL;
        }
   {  Documentation
      SQL.Clear;
      SQL.Add('INSERT INTO Overlay_Definition ');
      SQL.Add(
        '(Overlay_Identifier,Overlay_Filename,Static_Overlay,Game_Area_Index,Domain )');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Overlay_Identifier + ''',');
      SQL.Add('''' + Overlay_Filename + ''',');
      SQL.Add(IntToStr(Static_Overlay) + ',');
      SQL.Add(IntToStr(Game_Area_Index) + ',');
      SQL.Add(IntToStr(domain) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT * FROM Overlay_Definition');
      SQL.Add('WHERE Overlay_Identifier = ' + quotedStr(Overlay_Identifier));
      // ShowMessage(SQL.Text);
      Open;

      rec.FData.Overlay_Index := FieldByName('Overlay_Index').AsInteger;
    end;
  end;

  result := rec.FData.Overlay_Index; }
   with ZQ do
  begin
    with rec do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Overlay_Definition ');
      SQL.Add('(Overlay_Identifier,Overlay_Filename,Static_Overlay,Game_Area_Index,Domain )');

      SQL.Add(' VALUES (');
      SQL.Add(QuotedStr (Overlay_Identifier) + ',');
      SQL.Add(QuotedStr (Overlay_Filename) + ',');
      SQL.Add(IntToStr(Static_Overlay) + ',');
      SQL.Add(IntToStr(Game_Area_Index) + ',');
      SQL.Add(IntToStr(domain) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT * FROM Overlay_Definition');
      SQL.Add('WHERE Overlay_Identifier = ' + quotedStr(Overlay_Identifier));

      Open;

      rec.Overlay_Index := FieldByName('Overlay_Index').AsInteger;
    end;
  end;

  result := rec.Overlay_Index;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insert_Resource_Overlay_Mapping(rec: TResource_Allocation)
  : Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec do
    begin
      Close;
      {
        SQL.Clear;
        SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Overlay_Definition] ON;');
        ExecSQL;
        }
      SQL.Clear;
      SQL.Add('INSERT INTO Resource_Overlay_Mapping ');
      SQL.Add('(Resource_Alloc_Index,Overlay_Index,Force_Designation)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(FData.Resource_Alloc_Index) + ',');
      SQL.Add(IntToStr(FOverlay.Overlay_Index) + ',');
      SQL.Add(IntToStr(FOverlay.Force) + ')');
//      SQL.Add('' + IntToStr(FData.Resource_Alloc_Index) + ',');
//      SQL.Add('' + IntToStr(FOverlay.Overlay_Index) + ',');
//      SQL.Add(IntToStr(FOverlay.Force) + ')');
      ExecSQL;
    end;
  end;
end;

function TdmTTT.newRecord(ScenarioIndex: Integer; RecordName: String;
  gameTime : TDateTime): integer;
var
  query : string;
  num : integer;
begin

  query := 'Insert into record (scenario_index, record_name, GameTimeStart,GameTimeStop) values (' +
    IntToStr(ScenarioIndex) + ',' + QuotedStr(RecordName) + ',:TimeStart, :TimeStop)';

  with zq do begin
    ParamCheck := True;
    SQL.Clear;
    SQL.Add(query);
    Params.ParamByName('Timestart').Value := gametime;
    Params.ParamByName('Timestop').Value := gametime;
    ExecSQL;
  end;

  query := 'SELECT MAX(Record_Index) as NUM FROM RECORD';
  with zq do begin
    SQL.Clear;
    SQL.Add(query);
    Open;

    num := 0;
    if RecordCount > 0 then
    begin
      num := FieldByName('NUM').AsInteger;
    end;
    Close;

  end;
  result := num;
end;

function TdmTTT.recordFrame(RecordID: Integer; RecordTick: Int64;
  RecordStructType: integer; RecordBlob: TStream;QueueNo : LongInt): Boolean;
var
  query : string;
begin

  with zq do begin

    query := 'Insert into record_data(Record_Index,Tick,Record_Type,BlobData, QueueNo) values (:ID, :Tick, :Type , :data, :No);';
    ParamCheck := True;

    SQL.Clear;
    SQL.Add(query);
    Params.ParamByName('ID').Value := RecordID;
    Params.ParamByName('Tick').Value := RecordTick;
    Params.ParamByName('Type').Value := RecordStructType;
    Params.ParamByName('No').Value := QueueNo;

    if ASsigned(RecordBlob) then
      Params.ParamByName('data').LoadFromStream(RecordBlob,ftBlob);

    try
      ExecSQL;
    finally
    end;
  end;

end;

function TdmTTT.newSnapshot(ScenarioIndex: Integer; SnapshotName: String;
  gameTime: TDateTime): integer;
var
  query : string;
  num : integer;
begin

  query := 'Insert into Snapshot (scenario_index, Snapshot_name, Game_Time, Created) values (' +
    IntToStr(ScenarioIndex) + ',' + QuotedStr(SnapshotName) + ',:GameTime, :Created)';

  with zq do begin
    ParamCheck := True;
    SQL.Clear;
    SQL.Add(query);
    Params.ParamByName('GameTime').Value := gametime;
    Params.ParamByName('Created').Value := Now;
    ExecSQL;
  end;

  query := 'SELECT MAX(Snapshot_Index) as NUM FROM Snapshot';
  with zq do begin
    SQL.Clear;
    SQL.Add(query);
    Open;

    num := 0;
    if RecordCount > 0 then
    begin
      num := FieldByName('NUM').AsInteger;
    end;
    Close;

  end;
  result := num;
end;

function TdmTTT.SnapshotData(SnapshotIndex, RecordStructType: integer;
  RecordBlob: TStream; Size: integer): Boolean;
var
  query : string;
begin

  with zq do begin

    query := 'Insert into Snapshot_Data(Snapshot_Index,Record_Type,Blob_Data,Size_Data) values (:ID, :Type , :Data, :Size);';
    ParamCheck := True;

    SQL.Clear;
    SQL.Add(query);
    Params.ParamByName('ID').Value := SnapshotIndex;
    Params.ParamByName('Type').Value := RecordStructType;
    Params.ParamByName('Size').Value := Size;

    if ASsigned(RecordBlob) then
      Params.ParamByName('Data').LoadFromStream(RecordBlob,ftBlob);

    try
      ExecSQL;
    finally
    end;
  end;

end;

function TdmTTT.CekWaypointName(WaypointName: String): Boolean;
begin
  Result := False;
  with ZQ do
  begin

    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Waypoint');
    SQL.Add('WHERE Waypoint_Name = '+ QuotedStr(WaypointName));

    Open;

    result := RecordCount > 0;
  end;
end;

function TdmTTT.newWaypoint(RAid: Integer;
  WaypointName: String; Termination : Integer; lat, Long : Double; Dimensi : Single): integer;
var
  query : string;
  num : integer;
begin

  query := 'Insert into Waypoint (Waypoint_Name, Termination, Waypoint_Centre_Lat, ' +
            'Waypoint_Centre_Long, Dimension) values (' +
     QuotedStr(WaypointName) + ',' + IntToStr(Termination) + ','+ FloatToStr(lat)+','+
     FloatToStr(Long)+ ',' + FloatToStr(Dimensi)+ ')';

  with zq do begin
    ParamCheck := True;
    SQL.Clear;
    SQL.Add(query);
    ExecSQL;
  end;

  query := 'SELECT MAX(Waypoint_Index) as NUM FROM Waypoint';
  with zq do begin
    SQL.Clear;
    SQL.Add(query);
    Open;

    num := 0;
    if RecordCount > 0 then
    begin
      num := FieldByName('NUM').AsInteger;
    end;
    Close;

  end;
  result := num;

  query := 'Insert into Resource_Waypoint_Mapping (Resource_Alloc_Index, Waypoint_Index) values (' +
    IntToStr(RAid) + ',' + IntToStr(num) + ')';
  with zq do begin
    ParamCheck := True;
    SQL.Clear;
    SQL.Add(query);
    ExecSQL;
  end;
end;

procedure TdmTTT.WaypointData(WaypointIndex: Integer;
  Waypoint: TRecScripted_Behav_Definition);
var
  query : string;
begin
  with zq do begin

    query := 'Insert into Waypoint_Data(Waypoint_Index, Scripted_Event_Index, Number_of_Event, '
             + 'Platform_Event_Index, Speed, Altitude, Vert_Speed, Waypoint_Latitude, Waypoint_Longitude, '
             + 'Cartesian_Waypoint_X, Cartesian_Waypoint_Y, Time_Waypoint, Time_2_Waypoint, HF_Datalink_Activate, '
             + 'UHF_Datalink_Activate, Sonobuoy_Resource_Index, Sonobuoy_Instance_Index, Deploy_Sonobuoys, '
             + 'Sonobuoy_Spacing, Num_Sonobuoys_2_Drop, Sonobuoy_Depth, Jammer_Control, Remove_from_Game, '
             + 'StartMode, StartAt) values (:Waypoint_Index, :Scripted_Event_Index , :Number_of_Event, :Platform_Event_Index, :Speed, '
             + ':Altitude, :Vert_Speed, :Waypoint_Latitude, :Waypoint_Longitude, :Cartesian_Waypoint_X, :Cartesian_Waypoint_Y, '
             + ':Time_Waypoint, :Time_2_Waypoint, :HF_Datalink_Activate, :UHF_Datalink_Activate, '
             + ':Sonobuoy_Resource_Index, :Sonobuoy_Instance_Index, :Deploy_Sonobuoys, :Sonobuoy_Spacing, '
             + ':Num_Sonobuoys_2_Drop, :Sonobuoy_Depth, :Jammer_Control, :Remove_from_Game, '
             + ':StartMode, :StartAt)';
    ParamCheck := True;

    SQL.Clear;
    SQL.Add(query);
    Params.ParamByName('Waypoint_Index').Value := WaypointIndex;
    Params.ParamByName('Scripted_Event_Index').Value := Waypoint.Scripted_Event_Index;
    Params.ParamByName('Number_of_Event').Value := Waypoint.Number_of_Event;
    Params.ParamByName('Platform_Event_Index').Value := Waypoint.Platform_Event_Index;
    Params.ParamByName('Speed').Value := Waypoint.Speed;
    Params.ParamByName('Altitude').Value := Waypoint.Altitude;
    Params.ParamByName('Vert_Speed').Value := Waypoint.Vert_Speed;
    Params.ParamByName('Waypoint_Latitude').Value := Waypoint.Waypoint_Latitude;
    Params.ParamByName('Waypoint_Longitude').Value := Waypoint.Waypoint_Longitude;
    Params.ParamByName('Cartesian_Waypoint_X').Value := Waypoint.Cartesian_Waypoint_X;
    Params.ParamByName('Cartesian_Waypoint_Y').Value := Waypoint.Cartesian_Waypoint_Y;
    Params.ParamByName('Time_Waypoint').Value := Waypoint.Time_Waypoint;
    Params.ParamByName('Time_2_Waypoint').Value := Waypoint.Time_2_Waypoint;
    Params.ParamByName('HF_Datalink_Activate').Value := Waypoint.HF_Datalink_Activate;
    Params.ParamByName('UHF_Datalink_Activate').Value := Waypoint.UHF_Datalink_Activate;
    Params.ParamByName('Sonobuoy_Resource_Index').Value := Waypoint.Sonobuoy_Resource_Index;
    Params.ParamByName('Sonobuoy_Instance_Index').Value := Waypoint.Sonobuoy_Instance_Index;
    Params.ParamByName('Deploy_Sonobuoys').Value := Waypoint.Deploy_Sonobuoys;
    Params.ParamByName('Sonobuoy_Spacing').Value := Waypoint.Sonobuoy_Spacing;
    Params.ParamByName('Num_Sonobuoys_2_Drop').Value := Waypoint.Num_Sonobuoys_2_Drop;
    Params.ParamByName('Sonobuoy_Depth').Value := Waypoint.Sonobuoy_Depth;
    Params.ParamByName('Jammer_Control').Value := Waypoint.Jammer_Control;
    Params.ParamByName('Remove_from_Game').Value := Waypoint.Remove_from_Game;
    Params.ParamByName('StartMode').Value := Waypoint.StartMode;
    Params.ParamByName('StartAt').Value := Waypoint.StartAt;

    try
      ExecSQL;
    finally
    end;
  end;

end;

function TdmTTT.GetWaypoint(RAid : Integer; WaypointList : TList) : integer; //x
var
  rec: TScripted_Waypoint_Data;
  i: Integer;
begin
  result := 0;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Resource_Waypoint_Mapping a JOIN Waypoint b');
    SQL.Add('on a.Waypoint_Index = b.Waypoint_Index');
    SQL.Add('WHERE (Resource_Alloc_Index = ' + IntToStr(RAid) + ')');
    Open;

    result := RecordCount;
    if not Assigned(WaypointList) then
    begin
      WaypointList.Create;
    end
    else
    begin
      WaypointList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TScripted_Waypoint_Data.Create;

        with rec do
        begin
          Waypoint_Index := FieldByName('Waypoint_Index').AsInteger;
          Waypoint_Name := FieldByName('Waypoint_Name').AsString;
          Termination := FieldByName('Termination').AsInteger;
          Waypoint_Centre_Lat :=  FieldByName('Waypoint_Centre_Lat').AsFloat;
          Waypoint_Centre_Long :=  FieldByName('Waypoint_Centre_Long').AsFloat;
          Dimension := FieldByName('Dimension').AsSingle;
        end;

        WaypointList.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to WaypointList.Count - 1do
      begin
        rec := WaypointList.Items[i];
        GetWaypointData(rec.Waypoint_Index, rec.FData);
      end;
    end;
  end;
end;

function TdmTTT.GetWaypointData(WaypointIndex : Integer; ListData : TList) : integer; //x
var
  ssql: string;
  rec: TScripted_Behav_Definition;
  i: Integer;
begin
  result := 0;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM Waypoint_Data a ';
    ssql := ssql + 'WHERE (a.Waypoint_Index = ' + IntToStr(WaypointIndex) + ')';
    SQL.Add(ssql);
    // ShowMessage(SQL.Text);
    Open;

    result := RecordCount;
    if not Assigned(ListData) then
    begin
      ListData.Create;
    end
    else
    begin
      ListData.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TScripted_Behav_Definition.Create;

        with rec.FData do
        begin
          Scripted_Event_Index := FieldByName('Scripted_Event_Index').AsInteger;
          Number_of_Event := FieldByName('Number_of_Event').AsInteger;
          Platform_Event_Index := FieldByName('Platform_Event_Index').AsInteger;
          Speed := FieldByName('Speed').AsFloat;
          Altitude := FieldByName('Altitude').AsFloat;
          Vert_Speed := FieldByName('Vert_Speed').AsInteger;
          Waypoint_Latitude := FieldByName('Waypoint_Latitude').AsFloat;
          Waypoint_Longitude := FieldByName('Waypoint_Longitude').AsFloat;
          Cartesian_Waypoint_X := FieldByName('Cartesian_Waypoint_X').AsSingle;
          Cartesian_Waypoint_Y := FieldByName('Cartesian_Waypoint_Y').AsSingle;
          Time_Waypoint := FieldByName('Time_Waypoint').AsInteger;
          Time_2_Waypoint := FieldByName('Time_2_Waypoint').AsInteger;
          HF_Datalink_Activate := FieldByName('HF_Datalink_Activate').AsInteger;
          UHF_Datalink_Activate := FieldByName('UHF_Datalink_Activate').AsInteger;
          Sonobuoy_Resource_Index := FieldByName('Sonobuoy_Resource_Index').AsInteger;
          Sonobuoy_Instance_Index := FieldByName('Sonobuoy_Instance_Index').AsInteger;
          Deploy_Sonobuoys := FieldByName('Deploy_Sonobuoys').AsInteger;
          Sonobuoy_Spacing := FieldByName('Sonobuoy_Spacing').AsSingle;
          Num_Sonobuoys_2_Drop := FieldByName('Num_Sonobuoys_2_Drop').AsInteger;
          Sonobuoy_Depth := FieldByName('Sonobuoy_Depth').AsSingle;
          Jammer_Control := FieldByName('Jammer_Control').AsInteger;
          Remove_from_Game := FieldByName('Remove_from_Game').AsInteger;
          StartMode := FieldByName('StartMode').AsInteger;
          StartAt := FieldByName('StartAt').AsFloat;
        end;

        ListData.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateResourceOverlay_Map(var rec: TResource_Overlay_Mapping;
const  id: integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Resource_Overlay_Mapping  ');
      SQL.Add('SET ');
      SQL.Add('Resource_Alloc_Index = ' + IntToStr(Resource_Alloc_Index) + ',');
      SQL.Add('Overlay_Index = ' + IntToStr(Overlay_Index) + ',');
      SQL.Add('Force_Designation = ' + IntToStr(Force_Designation));
    end;

    SQL.Add(' WHERE (Overlay_Instance_Index = ' + IntToStr(id) + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------
function TdmTTT.GetHelicopter(const id: Integer; var rec: THelicopter_Land_Launch_Limits): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Helicopter_Land_Launch_Limits ');
    SQL.Add('WHERE (Vehicle_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := THelicopter_Land_Launch_Limits.Create;

      with rec.FData do
      begin
        Vehicle_Index                := FieldByName('Vehicle_Index').AsInteger;
        Max_Relative_Wind_Magnitude  := FieldByName('Max_Relative_Wind_Magnitude').Assingle;
        Max_Turn_Rate_To_Launch      := FieldByName('Max_Turn_Rate_To_Launch').Asinteger;
        Max_Turn_Rate_To_Land        := FieldByName('Max_Turn_Rate_To_Land').Asinteger;
        Max_Landing_Altitude         := FieldByName('Max_Landing_Altitude').Assingle;
        Max_Relative_Speed           := FieldByName('Max_Relative_Speed').Asinteger;
        Approach_Range               := FieldByName('Approach_Range').Assingle;
        Approach_Center_Bearing      := FieldByName('Approach_Center_Bearing').Asinteger;
        Approach_Sector_Width        := FieldByName('Approach_Sector_Width').Asinteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetHosted_Platform(const v_id, host_id: Integer;
  var aRec: TList): boolean;
var
  //i: Integer;
  rec: THosted_Platform;
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := ssql + 'SELECT * FROM ';
    ssql := ssql + 'Hosted_Platform a JOIN Vehicle_Definition  b ';

    if v_id <> 0 then
    begin
      ssql := ssql + 'ON a.Hosted_Vehicle_Index = b.Vehicle_Index ';
      ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(v_id) + ') ';
      if host_id <> 0 then
        ssql := ssql + 'AND (a.Hosted_Vehicle_Index = ' + IntToStr(host_id)
          + ')';
    end
    else if host_id <> 0 then
    begin
      ssql := ssql + 'ON a.Vehicle_Index = b.Vehicle_Index ';
      ssql := ssql + 'WHERE (a.Hosted_Vehicle_Index = ' + IntToStr(host_id)
      + ')';
    end;

    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := THosted_Platform.Create;

        with rec.FData do
        begin
          Slave_Index := FieldByName('Slave_Index').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Hosted_Vehicle_Index := FieldByName('Hosted_Vehicle_Index').AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
        end;

        with rec.FVehicle do
        begin
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Motion_Characteristics := FieldByName('Motion_Characteristics')
            .AsInteger;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Draft := FieldByName('Draft').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Magnetic_Cross := FieldByName('Magnetic_Cross').AsSingle;
          Front_Visual_EO_Cross := FieldByName('Front_Visual_EO_Cross')
            .AsSingle;
          Side_Visual_EO_Cross := FieldByName('Side_Visual_EO_Cross').AsSingle;
          Front_Infrared_Cross := FieldByName('Front_Infrared_Cross').AsSingle;
          Side_Infrared_Cross := FieldByName('Side_Infrared_Cross').AsSingle;
          LSpeed_Acoustic_Intens := FieldByName('LSpeed_Acoustic_Intens')
            .AsSingle;
          Below_Cav_Acoustic_Intens := FieldByName('Below_Cav_Acoustic_Intens')
            .AsSingle;
          Above_Cav_Acoustic_Intens := FieldByName('Above_Cav_Acoustic_Intens')
            .AsSingle;
          HSpeed_Acoustic_Intens := FieldByName('HSpeed_Acoustic_Intens')
            .AsSingle;
          Cavitation_Speed_Switch := FieldByName('Cavitation_Speed_Switch')
            .AsSingle;
          Time_of_Weapon_Impact := FieldByName('Time_of_Weapon_Impact')
            .AsInteger;
          Chaff_Seduction_Capable := FieldByName('Chaff_Seduction_Capable')
            .AsBoolean;
          Seduction_Mode_Prob := FieldByName('Seduction_Mode_Prob').AsSingle;
          Min_Delay_Between_Chaff_Rounds := FieldByName
            ('Min_Delay_Between_Chaff_Rounds').AsInteger;
          Max_Chaff_Salvo_Size := FieldByName('Max_Chaff_Salvo_Size').AsInteger;
          SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
          CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
          TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
          IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
          AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
          Active_Acoustic_Tor_POH_Mod := FieldByName
            ('Active_Acoustic_Tor_POH_Mod').AsSingle;
          Passive_Acoustic_Tor_POH_Mod := FieldByName
            ('Passive_Acoustic_Tor_POH_Mod').AsSingle;
          Active_Passive_Tor_POH_Mod := FieldByName
            ('Active_Passive_Tor_POH_Mod').AsSingle;
          Wake_Home_POH_Modifier := FieldByName('Wake_Home_POH_Modifier')
            .AsSingle;
          Wire_Guide_POH_Modifier := FieldByName('Wire_Guide_POH_Modifier')
            .AsSingle;
          Mag_Mine_POH_Modifier := FieldByName('Mag_Mine_POH_Modifier')
            .AsSingle;
          Press_Mine_POH_Modifier := FieldByName('Press_Mine_POH_Modifier')
            .AsSingle;
          Impact_Mine_POH_Modifier := FieldByName('Impact_Mine_POH_Modifier')
            .AsSingle;
          Acoustic_Mine_POH_Modifier := FieldByName
            ('Acoustic_Mine_POH_Modifier').AsSingle;
          Sub_Comm_Antenna_Height := FieldByName('Sub_Comm_Antenna_Height')
            .AsSingle;
          Rel_Comm_Antenna_Height := FieldByName('Rel_Comm_Antenna_Height')
            .AsSingle;
          Max_Comm_Operating_Depth := FieldByName('Max_Comm_Operating_Depth')
            .AsSingle;
          HF_Link_Capable := FieldByName('HF_Link_Capable').AsBoolean;
          UHF_Link_Capable := FieldByName('UHF_Link_Capable').AsBoolean;
          HF_Voice_Capable := FieldByName('HF_Voice_Capable').AsBoolean;
          VHF_Voice_Capable := FieldByName('VHF_Voice_Capable').AsBoolean;
          UHF_Voice_Capable := FieldByName('UHF_Voice_Capable').AsBoolean;
          SATCOM_Voice_Capable := FieldByName('SATCOM_Voice_Capable').AsBoolean;
          UWT_Voice_Capable := FieldByName('UWT_Voice_Capable').AsBoolean;
          HF_MHS_Capable := FieldByName('HF_MHS_Capable').AsBoolean;
          UHF_MHS_Capable := FieldByName('UHF_MHS_Capable').AsBoolean;
          SATCOM_MHS_Capable := FieldByName('SATCOM_MHS_Capable').AsBoolean;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          Plat_Basing_Capability := FieldByName('Plat_Basing_Capability')
            .AsBoolean;
          Chaff_Capability := FieldByName('Chaff_Capability').AsBoolean;
          Readying_Time := FieldByName('Readying_Time').AsInteger;
          Sonobuoy_Capable := FieldByName('Sonobuoy_Capable').AsBoolean;
          Nav_Light_Capable := FieldByName('Nav_Light_Capable').AsBoolean;
          Periscope_Depth := FieldByName('Periscope_Depth').AsSingle;
          Periscope_Height_Above_Water := FieldByName
            ('Periscope_Height_Above_Water').AsSingle;
          Periscope_Front_Radar_Xsection := FieldByName
            ('Periscope_Front_Radar_Xsection').AsSingle;
          Periscope_Side_Radar_Xsection := FieldByName
            ('Periscope_Side_Radar_Xsection').AsSingle;
          Periscope_Front_Vis_Xsection := FieldByName
            ('Periscope_Front_Vis_Xsection').AsSingle;
          Periscope_Side_Vis_Xsection := FieldByName
            ('Periscope_Side_Vis_Xsection').AsSingle;
          Periscope_Front_IR_Xsection := FieldByName
            ('Periscope_Front_IR_Xsection').AsSingle;
          Periscope_Side_IR_Xsection := FieldByName
            ('Periscope_Side_IR_Xsection').AsSingle;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          Auto_Air_Defense_Capable := FieldByName('Auto_Air_Defense_Capable')
            .AsBoolean;
          Alert_State_Time := FieldByName('Alert_State_Time').AsSingle;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
          Max_Sonobuoys_To_Monitor := FieldByName('Max_Sonobuoys_To_Monitor')
            .AsInteger;
          Sonobuoy_Deploy_Max_Altitude := FieldByName
            ('Sonobuoy_Deploy_Max_Altitude').AsInteger;
          Sonobuoy_Deploy_Min_Altitude := FieldByName
            ('Sonobuoy_Deploy_Min_Altitude').AsInteger;
          Sonobuoy_Deploy_Max_Speed := FieldByName('Sonobuoy_Deploy_Max_Speed')
            .AsInteger;
          Air_Drop_Torpedo_Max_Altitude := FieldByName
            ('Air_Drop_Torpedo_Max_Altitude').AsInteger;
          Air_Drop_Torpedo_Min_Altitude := FieldByName
            ('Air_Drop_Torpedo_Min_Altitude').AsInteger;
          Air_Drop_Torpedo_Max_Speed := FieldByName
            ('Air_Drop_Torpedo_Max_Speed')
            .AsInteger;
          TMA_Rate_Factor := FieldByName('TMA_Rate_Factor').AsSingle;
          HMS_Noise_Reduction_Factor := FieldByName
            ('HMS_Noise_Reduction_Factor').AsSingle;
          TAS_Noise_Reduction_Factor := FieldByName
            ('TAS_Noise_Reduction_Factor').AsSingle;
          Infrared_Decoy_Capable := FieldByName('Infrared_Decoy_Capable')
            .AsBoolean;
          HF_Mid_Course_Update_Capable := FieldByName
            ('HF_Mid_Course_Update_Capable').AsBoolean;
          UHF_Mid_Course_Update_Capable := FieldByName
            ('UHF_Mid_Course_Update_Capable').AsBoolean;
          // SATCOM_Mid_Course_Update_Capable    := FieldByName('SATCOM_Mid_Course_Update_Capable').AsBoolean;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

function TdmTTT.GetIdPlotting(const anName: string; atype: Integer;
  var aIndex: integer): Integer;
begin
  Result := -1;
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT  Plotting_Index FROM Plotting_Definition');
    SQL.Add('Where (Plotting_Name = ' + anName + ')and(Plotting_Type = '+ IntToStr(atype)+ ')');
    Open;

    result := RecordCount ;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        aIndex := FieldByName('Plotting_Index').AsInteger;
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateHosted_Platform(const id: string;
  var rec: THosted_Platform): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Hosted_Platform ');
      SQL.Add('SET ');
      SQL.Add('Hosted_Vehicle_Index = ' + IntToStr(Hosted_Vehicle_Index) + ',');
      SQL.Add('Quantity = ' + IntToStr(Quantity));
    end;

    SQL.Add(' WHERE (Vehicle_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertHosted_Platform(var rec: THosted_Platform): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Hosted_Platform ');
      SQL.Add('(Vehicle_Index,Hosted_Vehicle_Index,Quantity)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Hosted_Vehicle_Index) + ',');
      SQL.Add(IntToStr(Quantity) + ')');
      // ShowMessage(Sql.Text);
      ExecSQL;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.DeleteHosted_Platform(const id: string): integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Hosted_Platform  ');
    SQL.Add('WHERE (Slave_Index = ' +  id + ')' );
    ExecSQL;
   end;
end;

//------------- sonobuoy -------------------------------------------------------

function TdmTTT.getAllSonobuoy_On_Board(const id, index: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TSonobuoy_On_Board;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM  Sonobuoy_On_Board a JOIN Sonobuoy_Definition b ';
    ssql := ssql +
      'ON a.Sonobuoy_Index = b.Sonobuoy_Index LEFT JOIN Note_Storage c ';
    ssql := ssql +
      'ON b.Sonobuoy_Index = c.Sonobuoy_Index LEFT JOIN Vehicle_Definition d ';
    ssql := ssql + 'ON a.Vehicle_Index = d.Vehicle_Index ';
    ssql := ssql + 'LEFT JOIN Sonar_Definition e ON b.Sonar_Index = e.Sonar_Index ';

    if index = 1 then
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 '
    else if index = 0 then
    begin
      // jika id tidak sama dg 0
      if id <> 0 then
      begin
        ssql := ssql + 'WHERE (a.Vehicle_index = ' + IntToStr(id) + ')';
      end;
    end
    else
      ssql := ssql + 'WHERE a.Vehicle_Index > 0 AND a.Sonobuoy_Index =' +
        IntToStr(index);

    SQL.Add(ssql);
    SQL.Add('ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TSonobuoy_On_Board.Create;

        with rec.FData do
        begin
          Sonobuoy_Instance_Index := FieldByName('Sonobuoy_Instance_Index')
            .AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Instance_Type := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Sonobuoy_Index := FieldByName('Sonobuoy_Index').AsInteger;
          Quantity := FieldByName('Quantity').AsInteger;
          Sonar_Instance_Index := FieldByName('Sonar_Instance_Index').AsInteger;
        end;

        with rec.FDef do
        begin
          Sonobuoy_Index := FieldByName('Sonobuoy_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Sonobuoy_Type := FieldByName('Sonobuoy_Type').AsInteger;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Endurance_Time := FieldByName('Endurance_Time').AsInteger;
          Max_Depth := FieldByName('Max_Depth').AsSingle;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          CPA_Detection_Capable := FieldByName('CPA_Detection_Capable')
            .AsInteger;
          CPA_Range_Limit := FieldByName('CPA_Range_Limit').AsSingle;
          Sonar_Index := FieldByName('Sonar_Index').AsInteger;
        end;

        with rec.FNote do
        begin
          Note_Index := FieldByName('Note_Index').AsInteger;
          Note_Type := FieldByName('Note_Type').AsInteger;
          Notes := FieldByName('Notes').AsString;
        end;

        with rec.FVehicle.FData do
        begin
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
        end;

        with rec.FSonar.FDef do
        begin
          Sonar_Index := FieldByName('Sonar_Index').AsInteger;
          Sonar_Identifier := FieldByName('Sonar_Identifier').AsString;
          Sonar_Category_Index := FieldByName('Sonar_Category_Index').AsInteger;
          Sonar_Classification := FieldByName('Sonar_Classification').AsInteger;
          Max_Detect_Range := FieldByName('Sonar_Classification').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllSonobuoy(const id: Integer; var sList: TList;
  var rec: TSonobuoy_On_Board): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Sonobuoy_Definition a LEFT JOIN Sonar_Definition b ';
    ssql := ssql + 'ON a.Sonar_Index = b.Sonar_Index ';
    if id <> 0 then
       ssql := ssql + 'WHERE Sonobuoy_Index =' + IntToStr(id);
    SQL.Add(ssql);
    SQL.Add('ORDER BY a.Class_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(sList) then
        sList := TList.Create
      else
        sList.Clear;

      while not ZQ.Eof do
      begin
        rec := TSonobuoy_On_Board.Create;

        with rec.FDef do
        begin
          Sonobuoy_Index := FieldByName('Sonobuoy_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Sonobuoy_Type := FieldByName('Sonobuoy_Type').AsInteger;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Endurance_Time := FieldByName('Endurance_Time').AsInteger;
          Max_Depth := FieldByName('Max_Depth').AsSingle;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          CPA_Detection_Capable := FieldByName('CPA_Detection_Capable')
            .AsInteger;
          CPA_Range_Limit := FieldByName('CPA_Range_Limit').AsSingle;
          Sonar_Index := FieldByName('Sonar_Index').AsInteger;
        end;

        with rec.FSonar.FDef do
        begin
          Sonar_Index := FieldByName('Sonar_Index').AsInteger;
          Sonar_Identifier := FieldByName('Sonar_Identifier').AsString;
          Sonar_Category_Index := FieldByName('Sonar_Category_Index').AsInteger;
          Sonar_Classification := FieldByName('Sonar_Classification').AsInteger;
          Max_Detect_Range     := FieldByName('Max_Detect_Range').AsSingle;
        end;

        sList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getPISonobuoy(var sList: TList; ra_id: Integer;
  force: Integer): Integer;
var
  //i: Integer;
  rec: TSonobuoy_On_Board;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Platform_Instance a JOIN Sonobuoy_Definition b ');
    SQL.Add('ON a.Sonobuoy_Index = b.Sonobuoy_Index ');
    SQL.Add('WHERE a.Resource_Alloc_index = ' + IntToStr(ra_id) + ' AND ');
    SQL.Add('Force_Designation =' + IntToStr(force));
    Open;

    result := RecordCount;

    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(sList) then
        sList := TList.Create
      else
        sList.Clear;

      while not ZQ.Eof do
      begin
        rec := TSonobuoy_On_Board.Create;

        with rec.FDef do
        begin
          Sonobuoy_Index := FieldByName('Sonobuoy_Index').AsInteger;
          Class_Identifier := FieldByName('Class_Identifier').AsString;
          Sonobuoy_Type := FieldByName('Sonobuoy_Type').AsInteger;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
        end;

        with rec.FPI do
        begin
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Instance_Name := FieldByName('Instance_Name').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
        end;

        sList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateSonobuoy_Def(rec: TSonobuoy_On_Board;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Sonobuoy_Definition ');
      SQL.Add('SET ');
      SQL.Add('Class_Identifier =''' + Class_Identifier + ''',');
      SQL.Add('Sonobuoy_Type =' + IntToStr(Sonobuoy_Type) + ',');
      SQL.Add('Platform_Domain =' + IntToStr(Platform_Domain) + ',');
      SQL.Add('Platform_Category =' + IntToStr(Platform_Category) + ',');
      SQL.Add('Platform_Type =' + IntToStr(Platform_Type) + ',');
      SQL.Add('Endurance_Time =' + IntToStr(Endurance_Time) + ',');
      SQL.Add('Max_Depth =' + FloatToStr(Max_Depth) + ',');
      SQL.Add('Length =' + FloatToStr(Length) + ',');
      SQL.Add('Width =' + FloatToStr(Width) + ',');
      SQL.Add('Height =' + FloatToStr(Height) + ',');
      SQL.Add('Front_Acoustic_Cross =' + FloatToStr(Front_Acoustic_Cross)
          + ',');
      SQL.Add('Side_Acoustic_Cross =' + FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add('Damage_Capacity =' + IntToStr(Damage_Capacity) + ',');
      SQL.Add('CPA_Detection_Capable =' + IntToStr(CPA_Detection_Capable)
          + ',');
      SQL.Add('CPA_Range_Limit =' + FloatToStr(CPA_Range_Limit) + ',');
      SQL.Add('Sonar_Index =' + IntToStr(Sonar_Index));
    end;

    SQL.Add(' WHERE (Sonobuoy_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertSonobuoy_Def(rec: TSonobuoy_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Sonobuoy_Definition ');
      SQL.Add(
        '(Class_Identifier,Sonobuoy_Type,Platform_Domain,Platform_Category,');
      SQL.Add(
        'Platform_Type,Endurance_Time,Max_Depth,Length,Width,Height,Front_Acoustic_Cross,');
      SQL.Add(
        'Side_Acoustic_Cross,Damage_Capacity,CPA_Detection_Capable,CPA_Range_Limit,Sonar_Index)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Class_Identifier + ''',');
      SQL.Add(IntToStr(Sonobuoy_Type) + ',');
      SQL.Add(IntToStr(Platform_Domain) + ',');
      SQL.Add(IntToStr(Platform_Category) + ',');
      SQL.Add(IntToStr(Platform_Type) + ',');
      SQL.Add(IntToStr(Endurance_Time) + ',');
      SQL.Add(FloatToStr(Max_Depth) + ',');
      SQL.Add(FloatToStr(Length) + ',');
      SQL.Add(FloatToStr(Width) + ',');
      SQL.Add(FloatToStr(Height) + ',');
      SQL.Add(FloatToStr(Front_Acoustic_Cross) + ',');
      SQL.Add(FloatToStr(Side_Acoustic_Cross) + ',');
      SQL.Add(IntToStr(Damage_Capacity) + ',');
      SQL.Add(IntToStr(CPA_Detection_Capable) + ',');
      SQL.Add(FloatToStr(CPA_Range_Limit) + ',');
      SQL.Add(IntToStr(Sonar_Index) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Sonobuoy_Index FROM Sonobuoy_Definition ');
      SQL.Add('WHERE Class_Identifier =' + quotedStr(Class_Identifier));
      Open;
      with rec.FData do
      begin
        Sonobuoy_Index := FieldByName('Sonobuoy_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteSonobuoy_Def(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Sonobuoy_Definition ');
    SQL.Add('WHERE Sonobuoy_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

/// /====================================================
function TdmTTT.DeleteSonobuoy_On_Board(const id: string;
  var rec: TSonobuoy_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Sonobuoy_On_Board  ');
    SQL.Add('WHERE (Sonobuoy_Instance_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

/// /====================================================
function TdmTTT.InsertSonobuoy_On_Board(const id: string;
  var rec: TSonobuoy_On_Board): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Sonobuoy_On_Board  ');
      SQL.Add('VALUES ( ');
      // SQL.Add(IntToStr(Sonobuoy_Instance_Index)+',');
      SQL.Add(QuotedStr(Instance_Identifier) + ',');
      SQL.Add(IntToStr(Instance_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Sonobuoy_Index) + ',');
      SQL.Add(IntToStr(Quantity) + ',');
      SQL.Add(IntToStr(Sonar_Instance_Index) + ')');
    end;

    ExecSQL;
  end;
end;
////====================================================

function TdmTTT.UpdateSonobuoy_On_Board(const id: string;
  var rec: TSonobuoy_On_Board): integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Sonobuoy_On_Board  ');
      SQL.Add('SET ' );
      //SQL.Add('Sonobuoy_Instance_Index = '+IntToStr(Sonobuoy_Instance_Index)+',');
      SQL.Add('Instance_Identifier = '+ QuotedStr(Instance_Identifier)+',');
      SQL.Add('Instance_Type = '+IntToStr(Instance_Type)+',');
      SQL.Add('Vehicle_Index = '+IntToStr(Vehicle_Index)+',');
      SQL.Add('Sonobuoy_Index = '+IntToStr(Sonobuoy_Index)+',');
      SQL.Add('Quantity = '+IntToStr(Quantity)+',');
      SQL.Add('Sonar_Instance_Index = '+IntToStr(Sonar_Instance_Index)+' ');
    end;

    SQL.Add('WHERE (Sonobuoy_Instance_Index = ' +  id + ')' );
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.GetBomb_OnBoard(const id: Integer; var aRec: TList) :integer;
var
  //i: Integer;
  rec: TBomb_Definition;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT c.Instance_Identifier,c.Point_Effect_Index,c.Quantity,');
    SQL.Add('c.Gun_Index,c.Bomb_Index ');
    SQL.Add('FROM Bomb_Definition a INNER JOIN Bomb_POH_vs_Range b ');
    SQL.Add
      ('ON a.Bomb_Index = b.Bomb_Index INNER JOIN Point_Effect_On_Board c ');
    SQL.Add('ON a.Bomb_Index = c.Bomb_Index LEFT JOIN Note_Storage d ');
    SQL.Add('ON a.Bomb_Index = d.Bomb_Index ');
    SQL.Add('WHERE (c.Vehicle_Index = ' + IntToStr(id) + ')');
    SQL.Add(' ORDER BY c.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TBomb_Definition.Create;

        with rec.FPoint.FData do
        begin
          Point_Effect_Index  := FieldByName('Point_Effect_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Quantity            := FieldByName('Quantity').AsInteger;
          Gun_Index           := FieldByName('Gun_Index').AsInteger;
          Bomb_Index          := FieldByName('Bomb_Index').AsInteger;
          TurretID            := FieldByName('TurretID').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetAllBomb(const id: Integer; var aRec: TList): Integer;
var
  i: Integer;
  rec: TBomb_Definition;
  //ppoh : ^TRecBomb_POH_vs_Range; -> Edited Nando & Andi P
  ppoh : TBomb_POH_vs_Range;

  pBlind : TBlind_Zone;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Point_Effect_On_Board a INNER JOIN Bomb_Definition b  ');
    SQL.Add('ON a.Bomb_Index = b.Bomb_Index  ');
    SQL.Add('WHERE (a.Vehicle_Index = ' + IntToStr(id) + ')');
    SQL.Add(' ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TBomb_Definition.Create;

        with rec.FData do
        begin
          Bomb_Index := FieldByName('Bomb_Index').AsInteger;
          Bomb_Identifier := FieldByName('Bomb_Identifier').AsString;
          Bomb_Type := FieldByName('Bomb_Type').AsInteger;
          Lethality := FieldByName('Lethality').AsInteger;
          Min_Range := FieldByName('Min_Range').AsSingle;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
          Anti_Land_Capable := FieldByName('Anti_Land_Capable').AsInteger;
          Anti_Amphibious_Capable := FieldByName('Anti_Amphibious_Capable').AsInteger;
        end;

        with rec.FPoint.FData do
        begin
          Point_Effect_Index  := FieldByName('Point_Effect_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Quantity            := FieldByName('Quantity').AsInteger;
          Bomb_Index          := FieldByName('Bomb_Index').AsInteger;
          TurretID            := FieldByName('TurretID').AsInteger;
        end;

        {with rec.FBomb_POH do
        begin
          List_Index := FieldByName('List_Index').AsInteger;
          Bomb_Index := FieldByName('Bomb_Index').AsInteger;
          Prob_of_Hit := FieldByName('Prob_of_Hit').AsSingle;
          Range := FieldByName('Range').AsSingle;
        end;}

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;

    for i := 0 to aRec.Count - 1 do
    begin
      rec := aRec.Items[i];

      Close;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Bomb_POH_vs_Range g ');
      SQL.Add('WHERE (g.Bomb_Index = ' + IntToStr
          (rec.FData.Bomb_Index) + ')');
      Open;

      ZQ.First;

      while not ZQ.Eof do
      begin
        ppoh := TBomb_POH_vs_Range.Create;

        with ppoh.FData do
        begin
          List_Index        := FieldByName('List_Index').AsInteger;
          Bomb_Index         := FieldByName('Bomb_Index').AsInteger;
          Prob_of_Hit       := FieldByName('Prob_of_Hit').AsSingle;
          Range             := FieldByName('Range').AsSingle;
        end;

        rec.FPOH.Add(ppoh);
        ZQ.Next;
      end;

      Close;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Blind_Zone_Definition g ');
      SQL.Add('WHERE (g.Point_Effect_Index = ' + IntToStr
          (rec.FPoint.FData.Point_Effect_Index) + ')');
      Open;

      ZQ.First;

      while not ZQ.Eof do
      begin
        pBlind := TBlind_Zone.Create;

        with pBlind.FData do
        begin
          Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
          Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
          BlindZone_Number := FieldByName('BlindZone_Number').AsInteger;
          Point_Effect_Index := FieldByName('Point_Effect_Index').AsInteger;
          Start_Angle := FieldByName('Start_Angle').AsSingle;
          End_Angle := FieldByName('End_Angle').AsSingle;
        end;

        rec.FPOH.Add(pBlind);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetBatalyon(const id: Integer; var pList: TList): Boolean;
var
  rec: TPersonel;
begin
  result := False;
  if not ZConn.Connected then
    Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT a1.Brigade_Index, a1.Brigade_Identifier, ');
    SQL.Add('b2.BataLyon_Index, b2.Batalyon_Identifier ');
    SQL.Add('FROM Personel_Brigade a1 JOIN Personel_Batalyon b2 ON ');
    SQL.Add('a1.Brigade_Index = b2.Brigade_Index ');
    SQL.Add('WHERE a1.Brigade_Index = ' + IntToStr(id));

    Open;
    Result := RecordCount > 0;
    if not Assigned(pList) then
      pList := TList.Create
    else
      pList.Clear;

    if not IsEmpty then
    begin
      First;
      while not ZQ.Eof do
      begin
        rec := TPersonel.Create;
        TBrigade(rec).Id := FieldByName('Brigade_Index').AsInteger;
        TBrigade(rec).Identifier := FieldByName('Brigade_Identifier').AsString;
        TBatalyon(rec).Id := FieldByName('Batalyon_Index').AsInteger;
        TBatalyon(rec).Identifier := FieldByName('Batalyon_Identifier').AsString;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

function TdmTTT.GetBomb(const id: Integer; var sList: TList;
  var rec: TBomb_Definition): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Bomb_Definition ';
    if id <> 0 then
       ssql := ssql + 'WHERE Bomb_Index =' + IntToStr(id);
    ssql := ssql + ' ORDER BY BOmb_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(sList) then
        sList := TList.Create
      else
        sList.Clear;

      while not ZQ.Eof do
      begin
        rec := TBomb_Definition.Create;

        with rec.FData do
        begin
          Bomb_Index := FieldByName('Bomb_Index').AsInteger;
          Bomb_Identifier := FieldByName('Bomb_Identifier').AsString;
          Bomb_Type := FieldByName('Bomb_Type').AsInteger;
          Lethality := FieldByName('Lethality').AsInteger;
          Min_Range := FieldByName('Min_Range').AsSingle;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
          Anti_Land_Capable := FieldByName('Anti_Land_Capable').AsInteger;
          Anti_Amphibious_Capable := FieldByName('Anti_Amphibious_Capable').AsInteger;
        end;

        sList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateBomb_Def(rec: TBomb_Definition; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Bomb_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Bomb_Identifier = ''' + Bomb_Identifier + ''',');
      SQL.Add('Bomb_Type = ' + IntToStr(Bomb_Type) + ',');
      SQL.Add('Lethality = ' + IntToStr(Lethality) + ',');
      SQL.Add('Min_Range = ' + FloatToStr(Min_Range) + ',');
      SQL.Add('Max_Range = ' + FloatToStr(Max_Range) + ',');
      SQL.Add('Anti_Sur_Capable = ' + IntToStr(Anti_Sur_Capable) + ',');
      SQL.Add('Anti_SubSur_Capable = ' + IntToStr(Anti_SubSur_Capable) + ',');
      SQL.Add('Anti_Land_Capable = ' + IntToStr(Anti_Land_Capable));
    end;

    SQL.Add('WHERE (Bomb_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertBomb_Def(rec: TBomb_Definition): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Bomb_Definition ');
      SQL.Add(
        '(Bomb_Identifier,Bomb_Type,Lethality,Min_Range,Max_Range,Anti_Sur_Capable,Anti_SubSur_Capable,Anti_Land_Capable)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Bomb_Identifier + ''',');
      SQL.Add(IntToStr(Bomb_Type) + ',');
      SQL.Add(IntToStr(Lethality) + ',');
      SQL.Add(FloatToStr(Min_Range) + ',');
      SQL.Add(FloatToStr(Max_Range) + ',');
      SQL.Add(IntToStr(Anti_Sur_Capable) + ',');
      SQL.Add(IntToStr(Anti_SubSur_Capable) + ',');
      SQL.Add(IntToStr(Anti_Land_Capable) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Bomb_Index FROM Bomb_Definition ');
      SQL.Add('WHERE Bomb_Identifier =' + quotedStr(Bomb_Identifier));
      Open;
      with rec.FData do
      begin
        Bomb_Index := FieldByName('Bomb_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteBomb(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Bomb_Definition ');
    SQL.Add('WHERE Bomb_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetAllGun(const id: Integer; var aRec: TList): Integer;
var
  rec: TGun_Definition;
  //ppoh : ^TRecGun_POH_vs_Range; -> edited Nando & Andi
  ppoh : TGun_POH_vs_Range;

  pBlind : TBlind_Zone;
  i : integer;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Point_Effect_On_Board a INNER JOIN Gun_Definition b  ');
    SQL.Add('ON a.Gun_Index = b.Gun_Index  ');
    SQL.Add('WHERE (a.Vehicle_Index = ' + IntToStr(id) + ')');
    SQL.Add(' ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TGun_Definition.Create;

        with rec.FData do
        begin
          Gun_Index := FieldByName('Gun_Index').AsInteger;
          Gun_Identifier := FieldByName('Gun_Identifier').AsString;
          Gun_Category := FieldByName('Gun_Category').AsInteger;
          Rate_of_Fire := FieldByName('Rate_of_Fire').AsInteger;
          Lethality_per_Round := FieldByName('Lethality_per_Round').AsInteger;
          Min_Range := FieldByName('Min_Range').AsSingle;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Air_Min_Range := FieldByName('Air_Min_Range').AsSingle;
          Air_Max_Range := FieldByName('Air_Max_Range').AsSingle;
          Fire_Cntl_Director_Req := FieldByName('Fire_Cntl_Director_Req')
            .AsInteger;
          Chaff_Capable_Gun := FieldByName('Chaff_Capable_Gun').AsInteger;
          Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_Land_Capable := FieldByName('Anti_Land_Capable').AsInteger;
          Anti_Air_Capable := FieldByName('Anti_Air_Capable').AsInteger;
          Anti_Amphibious_Capable := FieldByName('Anti_Amphibious_Capable').AsInteger;
          FireArms := FieldByName('Firearms').AsInteger;
          Automode_Capable := FieldByName('Automode_Capable').AsInteger;
          Max_Target_Altitude_Delta := FieldByName('Max_Target_Altitude_Delta')
            .AsInteger;
          Gun_Average_Shell_Velocity := FieldByName
            ('Gun_Average_Shell_Velocity').AsSingle;
          Man_Gun_Max_Elevation := FieldByName('Man_Gun_Max_Elevation')
            .AsSingle;
          Man_Gun_Min_Elevation := FieldByName('Man_Gun_Min_Elevation')
            .AsSingle;
          Man_Gun_Rotation_Rate := FieldByName('Man_Gun_Rotation_Rate')
            .AsSingle;
          Man_Gun_Elevation_Rate := FieldByName('Man_Gun_Elevation_Rate')
            .AsSingle;
          Man_Gun_Num_Rounds_Per_Load := FieldByName
            ('Man_Gun_Num_Rounds_Per_Load').AsInteger;
          Man_Gun_Time_to_Reload := FieldByName('Man_Gun_Time_to_Reload')
            .AsSingle;
          Man_Gun_Muzzle_Velocity := FieldByName('Man_Gun_Muzzle_Velocity')
            .AsSingle;
          NGS_Capable := FieldByName('NGS_Capable').AsInteger;
          NGS_MinDeflectionError := FieldByName('NGS_MinDeflectionError')
            .AsSingle;
          NGS_MaxDeflectionError := FieldByName('NGS_MaxDeflectionError')
            .AsSingle;
          NGS_MinRangeError := FieldByName('NGS_MinRangeError').AsSingle;
          NGS_MaxRangeError := FieldByName('NGS_MaxRangeError').AsSingle;
          NGS_MaxDispersionError := FieldByName('NGS_MaxDispersionError')
            .AsSingle;
          NGS_MaxDamageRadius := FieldByName('NGS_MaxDamageRadius').AsSingle;
          NGS_EffectiveRadius := FieldByName('NGS_EffectiveRadius').AsSingle;
          NGS_DamageRating := FieldByName('NGS_DamageRating').AsInteger;
        end;

        with rec.FPoint.FData do
        begin
          Point_Effect_Index  := FieldByName('Point_Effect_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Quantity            := FieldByName('Quantity').AsInteger;
          Gun_Index           := FieldByName('Gun_Index').AsInteger;
          TurretID            := FieldByName('TurretID').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;

    for i := 0 to aRec.Count - 1 do
    begin
      rec := aRec.Items[i];

      Close;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Gun_POH_vs_Range g ');
      SQL.Add('WHERE (g.Gun_Index = ' + IntToStr
          (rec.FData.Gun_Index) + ')');
      Open;

      ZQ.First;
      while not ZQ.Eof do
      begin
        ppoh := TGun_POH_vs_Range.Create;

        with ppoh.FData do
        begin
          List_Index        := FieldByName('List_Index').AsInteger;
          Gun_Index         := FieldByName('Gun_Index').AsInteger;
          Target_Type       := FieldByName('Target_Type').AsInteger;
          Prob_of_Hit       := FieldByName('Prob_of_Hit').AsSingle;
          Range             := FieldByName('Range').AsSingle;
        end;

        rec.FPOH.Add(ppoh);
        ZQ.Next;
      end;

      Close;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Blind_Zone_Definition g ');
      SQL.Add('WHERE (g.Point_Effect_Index = ' + IntToStr
          (rec.FPoint.FData.Point_Effect_Index) + ')');
      Open;

      ZQ.First;
      while not ZQ.Eof do
      begin
        pBlind := TBlind_Zone.Create;

        with pBlind.FData do
        begin
          Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
          Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
          BlindZone_Number := FieldByName('BlindZone_Number').AsInteger;
          Point_Effect_Index := FieldByName('Point_Effect_Index').AsInteger;
          Start_Angle := FieldByName('Start_Angle').AsSingle;
          End_Angle := FieldByName('End_Angle').AsSingle;
        end;

        rec.FBlind.Add(pBlind);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGun_OnBoard(const id: Integer; var aRec: TList) :integer;
var
  rec: TGun_Definition;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT a.Instance_Identifier,a.Point_Effect_Index,a.Quantity,a.Gun_index ');
    SQL.Add('FROM Point_Effect_On_Board a INNER JOIN Gun_Definition b ');
    SQL.Add('ON a.Gun_Index = b.Gun_Index INNER JOIN Gun_POH_vs_Range c ');
    SQL.Add('ON b.Gun_Index = c.Gun_Index LEFT JOIN Note_Storage d ');
    SQL.Add('ON b.Gun_Index = d.Gun_Index ');
    SQL.Add('WHERE (a.Vehicle_Index = ' + IntToStr(id) + ')');
    SQL.Add(' ORDER BY a.Instance_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TGun_Definition.Create;

        with rec.FPoint.FData do
        begin
          Point_Effect_Index  := FieldByName('Point_Effect_Index').AsInteger;
          Instance_Identifier := FieldByName('Instance_Identifier').AsString;
          Quantity            := FieldByName('Quantity').AsInteger;
          Gun_Index           := FieldByName('Gun_Index').AsInteger;
          TurretID            := FieldByName('TurretID').AsInteger;
        end;

        with rec.FData do
        begin
          Gun_Index := FieldByName('Gun_Index').AsInteger;
          Gun_Identifier := FieldByName('Gun_Identifier').AsString;
          Gun_Category := FieldByName('Gun_Category').AsInteger;
          Rate_of_Fire := FieldByName('Rate_of_Fire').AsInteger;
          Lethality_per_Round := FieldByName('Lethality_per_Round').AsInteger;
          Min_Range := FieldByName('Min_Range').AsSingle;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Air_Min_Range := FieldByName('Air_Min_Range').AsSingle;
          Air_Max_Range := FieldByName('Air_Max_Range').AsSingle;
          Fire_Cntl_Director_Req := FieldByName('Fire_Cntl_Director_Req')
            .AsInteger;
          Chaff_Capable_Gun := FieldByName('Chaff_Capable_Gun').AsInteger;
          Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_Land_Capable := FieldByName('Anti_Land_Capable').AsInteger;
          Anti_Air_Capable := FieldByName('Anti_Air_Capable').AsInteger;
          Anti_Amphibious_Capable := FieldByName('Anti_Amphibious_Capable').AsInteger;
          FireArms := FieldByName('Firearms').AsInteger;
          Automode_Capable := FieldByName('Automode_Capable').AsInteger;
          Max_Target_Altitude_Delta := FieldByName('Max_Target_Altitude_Delta')
            .AsInteger;
          Gun_Average_Shell_Velocity := FieldByName
            ('Gun_Average_Shell_Velocity').AsSingle;
          Man_Gun_Max_Elevation := FieldByName('Man_Gun_Max_Elevation')
            .AsSingle;
          Man_Gun_Min_Elevation := FieldByName('Man_Gun_Min_Elevation')
            .AsSingle;
          Man_Gun_Rotation_Rate := FieldByName('Man_Gun_Rotation_Rate')
            .AsSingle;
          Man_Gun_Elevation_Rate := FieldByName('Man_Gun_Elevation_Rate')
            .AsSingle;
          Man_Gun_Num_Rounds_Per_Load := FieldByName
            ('Man_Gun_Num_Rounds_Per_Load').AsInteger;
          Man_Gun_Time_to_Reload := FieldByName('Man_Gun_Time_to_Reload')
            .AsSingle;
          Man_Gun_Muzzle_Velocity := FieldByName('Man_Gun_Muzzle_Velocity')
            .AsSingle;
          NGS_Capable := FieldByName('NGS_Capable').AsInteger;
          NGS_MinDeflectionError := FieldByName('NGS_MinDeflectionError')
            .AsSingle;
          NGS_MaxDeflectionError := FieldByName('NGS_MaxDeflectionError')
            .AsSingle;
          NGS_MinRangeError := FieldByName('NGS_MinRangeError').AsSingle;
          NGS_MaxRangeError := FieldByName('NGS_MaxRangeError').AsSingle;
          NGS_MaxDispersionError := FieldByName('NGS_MaxDispersionError')
            .AsSingle;
          NGS_MaxDamageRadius := FieldByName('NGS_MaxDamageRadius').AsSingle;
          NGS_EffectiveRadius := FieldByName('NGS_EffectiveRadius').AsSingle;
          NGS_DamageRating := FieldByName('NGS_DamageRating').AsInteger;
        end;

        aRec.Add(rec);
        Zq.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.GetGun(const id: Integer; var sList: TList;
  var rec: TGun_Definition): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Gun_Definition ';
    if id <> 0 then
       ssql := ssql + 'WHERE Gun_Index = ' + IntToStr(id);
    ssql := ssql + ' ORDER BY Gun_Identifier ';
    SQL.Add(ssql);
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(sList) then
        sList := TList.Create
      else
        sList.Clear;

      while not ZQ.Eof do
      begin
        rec := TGun_Definition.Create;

        with rec.FData do
        begin
          Gun_Index := FieldByName('Gun_Index').AsInteger;
          Gun_Identifier := FieldByName('Gun_Identifier').AsString;
          Gun_Category := FieldByName('Gun_Category').AsInteger;
          Rate_of_Fire := FieldByName('Rate_of_Fire').AsInteger;
          Lethality_per_Round := FieldByName('Lethality_per_Round').AsInteger;
          Min_Range := FieldByName('Min_Range').AsSingle;
          Max_Range := FieldByName('Max_Range').AsSingle;
          Air_Min_Range := FieldByName('Air_Min_Range').AsSingle;
          Air_Max_Range := FieldByName('Air_Max_Range').AsSingle;
          Fire_Cntl_Director_Req := FieldByName('Fire_Cntl_Director_Req')
            .AsInteger;
          Chaff_Capable_Gun := FieldByName('Chaff_Capable_Gun').AsInteger;
          Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_Land_Capable := FieldByName('Anti_Land_Capable').AsInteger;
          Anti_Air_Capable := FieldByName('Anti_Air_Capable').AsInteger;
          Anti_Amphibious_Capable := FieldByName('Anti_Amphibious_Capable').AsInteger;
          FireArms := FieldByName('Firearms').AsInteger;
          Automode_Capable := FieldByName('Automode_Capable').AsInteger;
          Max_Target_Altitude_Delta := FieldByName('Max_Target_Altitude_Delta')
            .AsInteger;
          Gun_Average_Shell_Velocity := FieldByName
            ('Gun_Average_Shell_Velocity').AsSingle;
          Man_Gun_Max_Elevation := FieldByName('Man_Gun_Max_Elevation')
            .AsSingle;
          Man_Gun_Min_Elevation := FieldByName('Man_Gun_Min_Elevation')
            .AsSingle;
          Man_Gun_Rotation_Rate := FieldByName('Man_Gun_Rotation_Rate')
            .AsSingle;
          Man_Gun_Elevation_Rate := FieldByName('Man_Gun_Elevation_Rate')
            .AsSingle;
          Man_Gun_Num_Rounds_Per_Load := FieldByName
            ('Man_Gun_Num_Rounds_Per_Load').AsInteger;
          Man_Gun_Time_to_Reload := FieldByName('Man_Gun_Time_to_Reload')
            .AsSingle;
          Man_Gun_Muzzle_Velocity := FieldByName('Man_Gun_Muzzle_Velocity')
            .AsSingle;
          NGS_Capable := FieldByName('NGS_Capable').AsInteger;
          NGS_MinDeflectionError := FieldByName('NGS_MinDeflectionError')
            .AsSingle;
          NGS_MaxDeflectionError := FieldByName('NGS_MaxDeflectionError')
            .AsSingle;
          NGS_MinRangeError := FieldByName('NGS_MinRangeError').AsSingle;
          NGS_MaxRangeError := FieldByName('NGS_MaxRangeError').AsSingle;
          NGS_MaxDispersionError := FieldByName('NGS_MaxDispersionError')
            .AsSingle;
          NGS_MaxDamageRadius := FieldByName('NGS_MaxDamageRadius').AsSingle;
          NGS_EffectiveRadius := FieldByName('NGS_EffectiveRadius').AsSingle;
          NGS_DamageRating := FieldByName('NGS_DamageRating').AsInteger;
        end;

        sList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateGun_Def(rec: TGun_Definition; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Gun_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Gun_Identifier = ''' + Gun_Identifier + ''',');
      SQL.Add('Gun_Category = ' + IntToStr(Gun_Category) + ',');
      SQL.Add('Rate_of_Fire = ' + IntToStr(Rate_of_Fire) + ',');
      SQL.Add('Lethality_per_Round = ' + IntToStr(Lethality_per_Round) + ',');
      SQL.Add('Min_Range = ' + FloatToStr(Min_Range) + ',');
      SQL.Add('Max_Range = ' + FloatToStr(Max_Range) + ',');
      SQL.Add('Air_Min_Range = ' + FloatToStr(Air_Min_Range) + ',');
      SQL.Add('Air_Max_Range = ' + FloatToStr(Air_Max_Range) + ',');
      SQL.Add('Fire_Cntl_Director_Req = ' + IntToStr(Fire_Cntl_Director_Req)
          + ',');
      SQL.Add('Chaff_Capable_Gun = ' + IntToStr(Chaff_Capable_Gun) + ',');
      SQL.Add('Anti_Sur_Capable = ' + IntToStr(Anti_Sur_Capable) + ',');
      SQL.Add('Anti_Land_Capable = ' + IntToStr(Anti_Land_Capable) + ',');
      SQL.Add('Anti_Air_Capable = ' + IntToStr(Anti_Air_Capable) + ',');
      SQL.Add('Automode_Capable = ' + IntToStr(Automode_Capable) + ',');
      SQL.Add('Max_Target_Altitude_Delta = ' + IntToStr
          (Max_Target_Altitude_Delta) + ',');
      SQL.Add('Gun_Average_Shell_Velocity = ' + FloatToStr
          (Gun_Average_Shell_Velocity) + ',');
      SQL.Add('Man_Gun_Max_Elevation = ' + FloatToStr(Man_Gun_Max_Elevation)
          + ',');
      SQL.Add('Man_Gun_Min_Elevation = ' + FloatToStr(Man_Gun_Min_Elevation)
          + ',');
      SQL.Add('Man_Gun_Rotation_Rate = ' + FloatToStr(Man_Gun_Rotation_Rate)
          + ',');
      SQL.Add('Man_Gun_Elevation_Rate = ' + FloatToStr(Man_Gun_Elevation_Rate)
          + ',');
      SQL.Add('Man_Gun_Num_Rounds_Per_Load = ' + IntToStr
          (Man_Gun_Num_Rounds_Per_Load) + ',');
      SQL.Add('Man_Gun_Time_to_Reload = ' + FloatToStr(Man_Gun_Time_to_Reload)
          + ',');
      SQL.Add('Man_Gun_Muzzle_Velocity = ' + FloatToStr
          (Man_Gun_Muzzle_Velocity) + ',');
      SQL.Add('NGS_Capable = ' + IntToStr(NGS_Capable) + ',');
      SQL.Add('NGS_MinDeflectionError = ' + FloatToStr(NGS_MinDeflectionError)
          + ',');
      SQL.Add('NGS_MaxDeflectionError = ' + FloatToStr(NGS_MaxDeflectionError)
          + ',');
      SQL.Add('NGS_MinRangeError = ' + FloatToStr(NGS_MinRangeError) + ',');
      SQL.Add('NGS_MaxRangeError = ' + FloatToStr(NGS_MaxRangeError) + ',');
      SQL.Add('NGS_MaxDispersionError = ' + FloatToStr(NGS_MaxDispersionError)
          + ',');
      SQL.Add('NGS_MaxDamageRadius = ' + FloatToStr(NGS_MaxDamageRadius) + ',');
      SQL.Add('NGS_EffectiveRadius = ' + FloatToStr(NGS_EffectiveRadius) + ',');
      SQL.Add('NGS_DamageRating = ' + IntToStr(NGS_DamageRating));
    end;

    SQL.Add(' WHERE (Gun_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertGun_Def(rec: TGun_Definition): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Gun_Definition ');
      SQL.Add(
        '(Gun_Identifier,Gun_Category,Rate_of_Fire,Lethality_per_Round,Min_Range,');
      SQL.Add(
        'Max_Range,Air_Min_Range,Air_Max_Range,Fire_Cntl_Director_Req,Chaff_Capable_Gun,');
      SQL.Add(
        'Anti_Sur_Capable,Anti_Land_Capable,Anti_Air_Capable,Automode_Capable,Max_Target_Altitude_Delta,');
      SQL.Add(
        'Gun_Average_Shell_Velocity,Man_Gun_Max_Elevation,Man_Gun_Min_Elevation,Man_Gun_Rotation_Rate,');
      SQL.Add(
        'Man_Gun_Elevation_Rate,Man_Gun_Num_Rounds_Per_Load,Man_Gun_Time_to_Reload,Man_Gun_Muzzle_Velocity,');
      SQL.Add(
        'NGS_Capable,NGS_MinDeflectionError,NGS_MaxDeflectionError,NGS_MinRangeError,NGS_MaxRangeError,');
      SQL.Add(
        'NGS_MaxDispersionError,NGS_MaxDamageRadius,NGS_EffectiveRadius,NGS_DamageRating)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Gun_Identifier + ''',');
      SQL.Add(IntToStr(Gun_Category) + ',');
      SQL.Add(IntToStr(Rate_of_Fire) + ',');
      SQL.Add(IntToStr(Lethality_per_Round) + ',');
      SQL.Add(FloatToStr(Min_Range) + ',');
      SQL.Add(FloatToStr(Max_Range) + ',');
      SQL.Add(FloatToStr(Air_Min_Range) + ',');
      SQL.Add(FloatToStr(Air_Max_Range) + ',');
      SQL.Add(IntToStr(Fire_Cntl_Director_Req) + ',');
      SQL.Add(IntToStr(Chaff_Capable_Gun) + ',');
      SQL.Add(IntToStr(Anti_Sur_Capable) + ',');
      SQL.Add(IntToStr(Anti_Land_Capable) + ',');
      SQL.Add(IntToStr(Anti_Air_Capable) + ',');
      SQL.Add(IntToStr(Automode_Capable) + ',');
      SQL.Add(IntToStr(Max_Target_Altitude_Delta) + ',');
      SQL.Add(FloatToStr(Gun_Average_Shell_Velocity) + ',');
      SQL.Add(FloatToStr(Man_Gun_Max_Elevation) + ',');
      SQL.Add(FloatToStr(Man_Gun_Min_Elevation) + ',');
      SQL.Add(FloatToStr(Man_Gun_Rotation_Rate) + ',');
      SQL.Add(FloatToStr(Man_Gun_Elevation_Rate) + ',');
      SQL.Add(IntToStr(Man_Gun_Num_Rounds_Per_Load) + ',');
      SQL.Add(FloatToStr(Man_Gun_Time_to_Reload) + ',');
      SQL.Add(FloatToStr(Man_Gun_Muzzle_Velocity) + ',');
      SQL.Add(IntToStr(NGS_Capable) + ',');
      SQL.Add(FloatToStr(NGS_MinDeflectionError) + ',');
      SQL.Add(FloatToStr(NGS_MaxDeflectionError) + ',');
      SQL.Add(FloatToStr(NGS_MinRangeError) + ',');
      SQL.Add(FloatToStr(NGS_MaxRangeError) + ',');
      SQL.Add(FloatToStr(NGS_MaxDispersionError) + ',');
      SQL.Add(FloatToStr(NGS_MaxDamageRadius) + ',');
      SQL.Add(FloatToStr(NGS_EffectiveRadius) + ',');
      SQL.Add(IntToStr(NGS_DamageRating) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Gun_Index FROM Gun_Definition ');
      SQL.Add('WHERE Gun_Identifier =' + quotedStr(Gun_Identifier));
      Open;
      with rec.FData do
      begin
        Gun_Index := FieldByName('Gun_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteGun(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Gun_Definition ');
    SQL.Add('WHERE Gun_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getCubicle_GroupMemberResidu(const deploy_id: Integer;
  const ra_id: Integer; const force: Integer; var gList: TList): boolean;
var
  rec: TCubicle_Group_Assignment;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT b.Platform_Instance_Index ');
    SQL.Add('FROM Platform_Instance b ');
    SQL.Add('WHERE b.Resource_Alloc_Index = ' + IntToStr(ra_id) + ' ');
    SQL.Add('AND b.Force_Designation = ' + IntToStr(force) + ' ');
    SQL.Add('AND b.Platform_Instance_Index NOT IN (');
    SQL.Add('SELECT a.Platform_Instance_Index ');
    SQL.Add('FROM Cubicle_Group_Assignment a ');
    SQL.Add('WHERE a.Deployment_Index = ' + IntToStr(deploy_id) + ')');
    Open;

    result := RecordCount > 0;
    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(gList) then
        gList := TList.Create
      else
        gList.Clear;

      while not ZQ.Eof do
      begin
        rec := TCubicle_Group_Assignment.Create;

        { with rec.FData do begin
          Deployment_Index    := FieldByName('Deployment_Index').AsInteger;
          end; }

        with rec.FPlatform do
        begin
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          { Instance_Name           := FieldByName('Instance_Name').AsString;
            Force_Designation       := FieldByName('Force_Designation').AsInteger;
            Resource_Alloc_Index    := FieldByName('Resource_Alloc_Index').AsInteger; }
        end;

        gList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getAllCubicle_Groups(const id, force: Integer;
  var cList: TList; var rec: TCubicle_Group): boolean;
var
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := ssql + 'SELECT * FROM Cubicle_Group ';

    if id <> 0 then
    begin
      ssql := ssql + 'WHERE (Deployment_Index = ' + IntToStr(id) + ') ';
      if force <> 0 then
        ssql := ssql + 'AND (Force_Designation = ' + IntToStr(force) + ')';
    end;

    if force <> 0 then
      ssql := ssql + 'WHERE (Force_Designation = ' + IntToStr(force) + ')';

    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(cList) then
        cList := TList.Create
      else
        cList.Clear;

      while not ZQ.Eof do
      begin
        rec := TCubicle_Group.Create;

        with rec.FData do
        begin
          Group_Index := FieldByName('Group_Index').AsInteger;
          Deployment_Index := FieldByName('Deployment_Index').AsInteger;
          Group_Identifier := FieldByName('Group_Identifier').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
          Tracks_Block := FieldByName('Tracks_Block').AsInteger;
          Track_Block_Start := FieldByName('Track_Block_Start').AsInteger;
          Track_Block_End := FieldByName('Track_Block_End').AsInteger;
          Zulu_Zulu := FieldByName('Zulu_Zulu').AsInteger;
        end;

        cList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getCubicle_GroupsByResource(const ra_id, force: Integer;
  var aRec: TList): Integer;
var
  rec: TCubicle_Group_Assignment;
  //i, J: Integer;
  // channelAssgn    : TCubicle_Channel_Assignment ;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := ssql +
      'SELECT distinct a.Group_Index, a.Deployment_Index,  a.Group_identifier, a.Force_designation ';
    ssql := ssql +
      'FROM Cubicle_Group a INNER JOIN Cubicle_Group_Assignment b ';
    ssql := ssql +
      'ON a.Group_Index = b.Group_Index INNER JOIN Platform_Instance c ';
    ssql := ssql +
      'ON b.Platform_Instance_Index = c.Platform_Instance_Index WHERE ';

    if ra_id <> 0 then
    begin
      ssql := ssql + 'c.Resource_Alloc_Index = ' + IntToStr(ra_id);
      if force <> 0 then
        ssql := ssql + ' AND a.Force_Designation = ' + IntToStr(force);
    end;

    ssql := ssql + ' ORDER BY a.Group_Index';
    SQL.Add(ssql);
    Open;

    result := RecordCount;

    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TCubicle_Group_Assignment.Create;

        with rec.FData do
        begin
          Group_Index := FieldByName('Group_Index').AsInteger;
          Deployment_Index := FieldByName('Deployment_Index').AsInteger;
          Group_Identifier := FieldByName('Group_Identifier').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      {
        for j := 0 to aRec.Count - 1 do
        begin
        rec := aRec.Items[j];

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Cubicle_Group_Channel_Assgnmnt ');
        SQL.Add('WHERE (Group_Index = ' + IntToStr(rec.FData.Group_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
        channelAssgn := TCubicle_Channel_Assignment.Create;

        with channelAssgn.FData do
        begin
        Group_Index           := FieldByName('Group_Index').AsInteger;
        Channel_Slot          := FieldByName('Channel_Slot').AsInteger;
        Comms_Channel_Index   := FieldByName('Comms_Channel_Index').AsInteger;
        end;

        rec.Cubicle_Group.Channel_Assgmnt.Add(channelAssgn);
        ZQ.Next;
        end;
        end; }
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getPlatform_GroupsByResource(const ra_id, force: Integer;
      var aRec: TList): Integer;
var
  rec: TCubicle_Group_Assignment;
  //i, J: Integer;
  // channelAssgn    : TCubicle_Channel_Assignment ;
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := ssql +
      'SELECT distinct a.Group_Index, a.Deployment_Index,  a.Group_identifier, a.Force_designation ';
    ssql := ssql +
      'FROM Cubicle_Group a INNER JOIN Cubicle_Group_Assignment b ';
    ssql := ssql +
      'ON a.Group_Index = b.Group_Index INNER JOIN Platform_Instance c ';
    ssql := ssql +
      'ON b.Platform_Instance_Index = c.Platform_Instance_Index WHERE ';

    if ra_id <> 0 then
    begin
      ssql := ssql + 'c.Resource_Alloc_Index = ' + IntToStr(ra_id);
      if force <> 0 then
        ssql := ssql + ' AND a.Force_Designation = ' + IntToStr(force);
    end;

    ssql := ssql + ' ORDER BY a.Group_Index';
    SQL.Add(ssql);
    Open;

    result := RecordCount;

    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TCubicle_Group_Assignment.Create;

        with rec.FData do
        begin
          Group_Index := FieldByName('Group_Index').AsInteger;
          Deployment_Index := FieldByName('Deployment_Index').AsInteger;
          Group_Identifier := FieldByName('Group_Identifier').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;

      {
        for j := 0 to aRec.Count - 1 do
        begin
        rec := aRec.Items[j];

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Cubicle_Group_Channel_Assgnmnt ');
        SQL.Add('WHERE (Group_Index = ' + IntToStr(rec.FData.Group_Index) + ')');
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
        channelAssgn := TCubicle_Channel_Assignment.Create;

        with channelAssgn.FData do
        begin
        Group_Index           := FieldByName('Group_Index').AsInteger;
        Channel_Slot          := FieldByName('Channel_Slot').AsInteger;
        Comms_Channel_Index   := FieldByName('Comms_Channel_Index').AsInteger;
        end;

        rec.Cubicle_Group.Channel_Assgmnt.Add(channelAssgn);
        ZQ.Next;
        end;
        end; }
    end;
  end;
end;

//-----------------------------------------------------------------------------

function TdmTTT.getCubicle_GroupsByGroup(const id: Integer;
  var rec: TCubicle_Group): boolean;
var
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := ssql + 'SELECT * FROM Cubicle_Group ';
    if id <> 0 then
      ssql := ssql + 'WHERE (Group_Index = ' + IntToStr(id) + ') ';
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not ZQ.IsEmpty then
    begin
      if not Assigned(rec) then
        rec := TCubicle_Group.Create;

      with rec.FData do
      begin
        Group_Index := FieldByName('Group_Index').AsInteger;
        Deployment_Index := FieldByName('Deployment_Index').AsInteger;
        Group_Identifier := FieldByName('Group_Identifier').AsString;
        Force_Designation := FieldByName('Force_Designation').AsInteger;
        Tracks_Block := FieldByName('Tracks_Block').AsInteger;
        Track_Block_Start := FieldByName('Track_Block_Start').AsInteger;
        Track_Block_End := FieldByName('Track_Block_End').AsInteger;
        Zulu_Zulu := FieldByName('Zulu_Zulu').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Ship_On_Sonar(const id: Integer;
  var rec: TGame_Defaults{TRecGame_Ship_On_Sonar}): boolean;
var i : Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Ship_On_Sonar a JOIN Game_Defaults b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (a.Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;

    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec)) then
        rec := TGame_Defaults.Create;

      SetLength(rec.FGameShip_Sonar, RecordCount);
      for I := 0 to RecordCount - 1 do
      begin
        with rec.FGameShip_Sonar[i] do
        begin
          Defaults_Index := FieldByName('Defaults_Index').AsInteger;
          Sonar_Frequency := FieldByName('Sonar_Frequency').AsSingle;
          Distant_Ship_Effect := FieldByName('Distant_Ship_Effect').AsSingle;
          Light_Ship_Effect := FieldByName('Light_Ship_Effect').AsSingle;
          Medium_Ship_Effect := FieldByName('Medium_Ship_Effect').AsSingle;
          Heavy_Ship_Effect := FieldByName('Heavy_Ship_Effect').AsSingle;
        end;
        Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateGame_Defaults(rec: TGame_Defaults; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Game_Defaults  ');
      SQL.Add('SET ');
      SQL.Add('Defaults_Identifier = ''' + Defaults_Identifier + ''',');
      SQL.Add('Init_AOP = ' + IntToStr(Init_AOP) + ',');
      SQL.Add('AOP_Decrease_Rate = ' + FloatToStr(AOP_Decrease_Rate) + ',');
      SQL.Add('Sono_Num_2_Initiate = ' + IntToStr(Sono_Num_2_Initiate) + ',');
      SQL.Add('Trans_Range_2_Air = ' + FloatToStr(Trans_Range_2_Air) + ',');
      SQL.Add('Trans_Range_2_Sur = ' + FloatToStr(Trans_Range_2_Sur) + ',');
      SQL.Add('Init_AOP_Modifier = ' + FloatToStr(Init_AOP_Modifier) + ',');
      SQL.Add('Visual_Detect_Range = ' + FloatToStr(Visual_Detect_Range) + ',');
      SQL.Add('Known_Cross_Section = ' + FloatToStr(Known_Cross_Section) + ',');
      SQL.Add('Max_Visual_Range = ' + FloatToStr(Max_Visual_Range) + ',');
      SQL.Add('EO_Detection_Factor = ' + FloatToStr(EO_Detection_Factor) + ',');
      SQL.Add('Visual_Detection_Factor = ' + FloatToStr
          (Visual_Detection_Factor) + ',');
      SQL.Add('EO_Ident_Factor = ' + FloatToStr(EO_Ident_Factor) + ',');
      SQL.Add('Visual_Ident_Factor = ' + FloatToStr(Visual_Ident_Factor) + ',');
      SQL.Add('Sine_Period_Distance = ' + FloatToStr(Sine_Period_Distance)
          + ',');
      SQL.Add('Sine_Period_Amplitude = ' + FloatToStr(Sine_Period_Amplitude)
          + ',');
      SQL.Add('Short_Period_Distance = ' + FloatToStr(Short_Period_Distance)
          + ',');
      SQL.Add('Short_Period_Amplitude = ' + FloatToStr(Short_Period_Amplitude)
          + ',');
      SQL.Add('Long_Period_Distance = ' + FloatToStr(Long_Period_Distance)
          + ',');
      SQL.Add('Long_Period_Amplitude = ' + FloatToStr(Long_Period_Amplitude)
          + ',');
      SQL.Add('Very_Period_Distance = ' + FloatToStr(Very_Period_Distance)
          + ',');
      SQL.Add('Very_Period_Amplitude = ' + FloatToStr(Very_Period_Amplitude)
          + ',');
      SQL.Add('Air_Lost_Time = ' + IntToStr(Air_Lost_Time) + ',');
      SQL.Add('Sur_Lost_Time = ' + IntToStr(Sur_Lost_Time) + ',');
      SQL.Add('Sub_Lost_Time = ' + IntToStr(Sub_Lost_Time) + ',');
      SQL.Add('ESM_Bearing_Lost_Time = ' + IntToStr(ESM_Bearing_Lost_Time)
          + ',');
      SQL.Add('Sonar_Bearing_Lost_Time = ' + IntToStr(Sonar_Bearing_Lost_Time)
          + ',');
      SQL.Add('Stale_Air_Time = ' + IntToStr(Stale_Air_Time) + ',');
      SQL.Add('Stale_Sur_Time = ' + IntToStr(Stale_Sur_Time) + ',');
      SQL.Add('Stale_Sub_Time = ' + IntToStr(Stale_Sub_Time) + ',');
      SQL.Add('Stale_ESM_Bearing_Time = ' + IntToStr(Stale_ESM_Bearing_Time)
          + ',');
      SQL.Add('Stale_Sonar_Bearing_Time = ' + IntToStr
          (Stale_Sonar_Bearing_Time) + ',');
      SQL.Add('POD_Check_Time = ' + IntToStr(POD_Check_Time) + ',');
      SQL.Add('TMA_Range_Rate = ' + FloatToStr(TMA_Range_Rate) + ',');
      SQL.Add('Frequency_Identity_Weighting = ' + FloatToStr
          (Frequency_Identity_Weighting) + ',');
      SQL.Add('PRF_Identity_Weighting = ' + FloatToStr(PRF_Identity_Weighting)
          + ',');
      SQL.Add('Pulsewidth_Identity_Weighting = ' + FloatToStr
          (Pulsewidth_Identity_Weighting) + ',');
      SQL.Add('Scan_Period_Identity_Weighting = ' + FloatToStr
          (Scan_Period_Identity_Weighting) + ',');
      SQL.Add('Crew_Eff_Heading_Error = ' + FloatToStr(Crew_Eff_Heading_Error)
          + ',');
      SQL.Add('Crew_Eff_Speed_Error = ' + FloatToStr(Crew_Eff_Speed_Error)
          + ',');
      SQL.Add('TMA_Relative_Bearing_Rate = ' + FloatToStr
          (TMA_Relative_Bearing_Rate) + ',');
      SQL.Add('Passive_Sonar_Max_Course_Error = ' + FloatToStr
          (Passive_Sonar_Max_Course_Error) + ',');
      SQL.Add('Passive_Sonar_Max_Speed_Error = ' + FloatToStr
          (Passive_Sonar_Max_Speed_Error) + ',');
      SQL.Add('ESM_Error_Corr_Rate = ' + FloatToStr(ESM_Error_Corr_Rate) + ',');
      SQL.Add('Chaff_Altitude_Threshold = ' + FloatToStr
          (Chaff_Altitude_Threshold) + ',');
      SQL.Add('MHS_Flash_Delay_Time = ' + FloatToStr(MHS_Flash_Delay_Time)
          + ',');
      SQL.Add('MHS_Immed_Delay_Time = ' + FloatToStr(MHS_Immed_Delay_Time)
          + ',');
      SQL.Add('MHS_Priority_Delay_Time = ' + FloatToStr
          (MHS_Priority_Delay_Time) + ',');
      SQL.Add('MHS_Routine_Delay_Time = ' + FloatToStr(MHS_Routine_Delay_Time)
          + ',');
      SQL.Add('Max_UWT_Range = ' + FloatToStr(Max_UWT_Range) + ',');
      SQL.Add('Max_HF_Detect_Range = ' + FloatToStr(Max_HF_Detect_Range) + ',');
      SQL.Add('Max_UHF_Detect_Range = ' + FloatToStr(Max_UHF_Detect_Range)
          + ',');
      SQL.Add('Max_IFF_Range = ' + FloatToStr(Max_IFF_Range) + ',');
      SQL.Add('Track_History_Air_Sample_Rate = ' + IntToStr
          (Track_History_Air_Sample_Rate) + ',');
      SQL.Add('Track_History_Air_Max_Points = ' + IntToStr
          (Track_History_Air_Max_Points) + ',');
      SQL.Add('Track_History_Sample_Rate = ' + IntToStr
          (Track_History_Sample_Rate) + ',');
      SQL.Add('Track_History_Max_Points = ' + IntToStr
          (Track_History_Max_Points) + ',');
      SQL.Add('Auto_Gun_Interception_Range = ' + FloatToStr
          (Auto_Gun_Interception_Range) + ',');
      SQL.Add('Auto_Gun_Threshold_Speed = ' + FloatToStr
          (Auto_Gun_Threshold_Speed) + ',');
      SQL.Add('Clutter_Reduction_Scale = ' + FloatToStr
          (Clutter_Reduction_Scale) + ',');
      SQL.Add('Jam_Break_Lock_Time_Interval = ' + IntToStr
          (Jam_Break_Lock_Time_Interval) + ',');
      SQL.Add('Missile_Reacquisition_Time = ' + IntToStr
          (Missile_Reacquisition_Time) + ',');
      SQL.Add('Seduction_Bloom_Altitude = ' + IntToStr
          (Seduction_Bloom_Altitude) + ',');
      SQL.Add('Seduction_Bloom_Range = ' + FloatToStr(Seduction_Bloom_Range)
          + ',');
      SQL.Add('HF_Datalink_MHS_Trans_Freq = ' + FloatToStr
          (HF_Datalink_MHS_Trans_Freq) + ',');
      SQL.Add('UHF_Datalink_MHS_Trans_Freq = ' + FloatToStr
          (UHF_Datalink_MHS_Trans_Freq) + ',');
      SQL.Add('Max_Num_Radar_Classes = ' + IntToStr(Max_Num_Radar_Classes)
          + ',');
      SQL.Add('Max_Num_Sonar_Classes = ' + IntToStr(Max_Num_Sonar_Classes)
          + ',');
      SQL.Add('Max_Num_Sonobuoy_Classes = ' + IntToStr
          (Max_Num_Sonobuoy_Classes) + ',');
      SQL.Add('Max_Num_EO_Classes = ' + IntToStr(Max_Num_EO_Classes) + ',');
      SQL.Add('Max_Num_ESM_Classes = ' + IntToStr(Max_Num_ESM_Classes) + ',');
      SQL.Add('Max_Num_MAD_Classes = ' + IntToStr(Max_Num_MAD_Classes) + ',');
      SQL.Add('Max_Num_Fitted_Weap_Classes = ' + IntToStr
          (Max_Num_Fitted_Weap_Classes) + ',');
      SQL.Add('Max_Num_Point_Effect_Classes = ' + IntToStr
          (Max_Num_Point_Effect_Classes) + ',');
      SQL.Add('HAFO_Min_Range = ' + FloatToStr(HAFO_Min_Range) + ',');
      SQL.Add('HAFO_Max_Range = ' + FloatToStr(HAFO_Max_Range) + ',');
      SQL.Add('Engage_Guide_Stale_Target_Time = ' + IntToStr
          (Engage_Guide_Stale_Target_Time) + ',');
      SQL.Add('Outrun_Guide_Stale_Target_Time = ' + IntToStr
          (Outrun_Guide_Stale_Target_Time) + ',');
      SQL.Add('Shadow_Guide_Stale_Target_Time = ' + IntToStr
          (Shadow_Guide_Stale_Target_Time) + ',');
      SQL.Add('Sonobuoy_Air_Deceleration = ' + FloatToStr
          (Sonobuoy_Air_Deceleration) + ',');
      SQL.Add('Sonobuoy_Air_Descent_Rate = ' + FloatToStr
          (Sonobuoy_Air_Descent_Rate) + ',');
      SQL.Add('Depth_Charge_Air_Deceleration = ' + FloatToStr
          (Depth_Charge_Air_Deceleration) + ',');
      SQL.Add('Depth_Charge_Air_Descent_Rate = ' + FloatToStr
          (Depth_Charge_Air_Descent_Rate) + ',');
      SQL.Add('Missile_Sea_Check_Interval = ' + IntToStr
          (Missile_Sea_Check_Interval));
    end;

    SQL.Add('WHERE (Defaults_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertGame_Defaults(rec: TGame_Defaults): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Game_Defaults ');
      SQL.Add(
        '(Defaults_Identifier,Init_AOP,AOP_Decrease_Rate,Sono_Num_2_Initiate,');
      SQL.Add(
        'Trans_Range_2_Air,Trans_Range_2_Sur,Init_AOP_Modifier,Visual_Detect_Range,Known_Cross_Section,');
      SQL.Add(
        'Max_Visual_Range,EO_Detection_Factor,Visual_Detection_Factor,EO_Ident_Factor,Visual_Ident_Factor,');
      SQL.Add(
        'Sine_Period_Distance,Sine_Period_Amplitude,Short_Period_Distance,Short_Period_Amplitude,');
      SQL.Add(
        'Long_Period_Distance,Long_Period_Amplitude,Very_Period_Distance,Very_Period_Amplitude,');
      SQL.Add(
        'Air_Lost_Time,Sur_Lost_Time,Sub_Lost_Time,ESM_Bearing_Lost_Time,Sonar_Bearing_Lost_Time,');
      SQL.Add(
        'Stale_Air_Time,Stale_Sur_Time,Stale_Sub_Time,Stale_ESM_Bearing_Time,Stale_Sonar_Bearing_Time,');
      SQL.Add(
        'POD_Check_Time,TMA_Range_Rate,Frequency_Identity_Weighting,PRF_Identity_Weighting,');
      SQL.Add(
        'Pulsewidth_Identity_Weighting,Scan_Period_Identity_Weighting,Crew_Eff_Heading_Error,');
      SQL.Add(
        'Crew_Eff_Speed_Error,TMA_Relative_Bearing_Rate,Passive_Sonar_Max_Course_Error,');
      SQL.Add(
        'Passive_Sonar_Max_Speed_Error,ESM_Error_Corr_Rate,Chaff_Altitude_Threshold,MHS_Flash_Delay_Time,');
      SQL.Add(
        'MHS_Immed_Delay_Time,MHS_Priority_Delay_Time,MHS_Routine_Delay_Time,Max_UWT_Range,');
      SQL.Add(
        'Max_HF_Detect_Range,Max_UHF_Detect_Range,Max_IFF_Range,Track_History_Air_Sample_Rate,');
      SQL.Add(
        'Track_History_Air_Max_Points,Track_History_Sample_Rate,Track_History_Max_Points,');
      SQL.Add(
        'Auto_Gun_Interception_Range,Auto_Gun_Threshold_Speed,Clutter_Reduction_Scale,');
      SQL.Add(
        'Jam_Break_Lock_Time_Interval,Missile_Reacquisition_Time,Seduction_Bloom_Altitude,');
      SQL.Add(
        'Seduction_Bloom_Range,HF_Datalink_MHS_Trans_Freq,UHF_Datalink_MHS_Trans_Freq,Max_Num_Radar_Classes,');
      SQL.Add(
        'Max_Num_Sonar_Classes,Max_Num_Sonobuoy_Classes,Max_Num_EO_Classes,Max_Num_ESM_Classes,');
      SQL.Add(
        'Max_Num_MAD_Classes,Max_Num_Fitted_Weap_Classes,Max_Num_Point_Effect_Classes,');
      SQL.Add(
        'HAFO_Min_Range,HAFO_Max_Range,Engage_Guide_Stale_Target_Time,Outrun_Guide_Stale_Target_Time,');
      SQL.Add(
        'Shadow_Guide_Stale_Target_Time,Sonobuoy_Air_Deceleration,Sonobuoy_Air_Descent_Rate,');
      SQL.Add(
        'Depth_Charge_Air_Deceleration,Depth_Charge_Air_Descent_Rate,Missile_Sea_Check_Interval)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Defaults_Identifier + ''',');
      SQL.Add(IntToStr(Init_AOP) + ',');
      SQL.Add(FloatToStr(AOP_Decrease_Rate) + ',');
      SQL.Add(IntToStr(Sono_Num_2_Initiate) + ',');
      SQL.Add(FloatToStr(Trans_Range_2_Air) + ',');
      SQL.Add(FloatToStr(Trans_Range_2_Sur) + ',');
      SQL.Add(FloatToStr(Init_AOP_Modifier) + ',');
      SQL.Add(FloatToStr(Visual_Detect_Range) + ',');
      SQL.Add(FloatToStr(Known_Cross_Section) + ',');
      SQL.Add(FloatToStr(Max_Visual_Range) + ',');
      SQL.Add(FloatToStr(EO_Detection_Factor) + ',');
      SQL.Add(FloatToStr(Visual_Detection_Factor) + ',');
      SQL.Add(FloatToStr(EO_Ident_Factor) + ',');
      SQL.Add(FloatToStr(Visual_Ident_Factor) + ',');
      SQL.Add(FloatToStr(Sine_Period_Distance) + ',');
      SQL.Add(FloatToStr(Sine_Period_Amplitude) + ',');
      SQL.Add(FloatToStr(Short_Period_Distance) + ',');
      SQL.Add(FloatToStr(Short_Period_Amplitude) + ',');
      SQL.Add(FloatToStr(Long_Period_Distance) + ',');
      SQL.Add(FloatToStr(Long_Period_Amplitude) + ',');
      SQL.Add(FloatToStr(Very_Period_Distance) + ',');
      SQL.Add(FloatToStr(Very_Period_Amplitude) + ',');
      SQL.Add(IntToStr(Air_Lost_Time) + ',');
      SQL.Add(IntToStr(Sur_Lost_Time) + ',');
      SQL.Add(IntToStr(Sub_Lost_Time) + ',');
      SQL.Add(IntToStr(ESM_Bearing_Lost_Time) + ',');
      SQL.Add(IntToStr(Sonar_Bearing_Lost_Time) + ',');
      SQL.Add(IntToStr(Stale_Air_Time) + ',');
      SQL.Add(IntToStr(Stale_Sur_Time) + ',');
      SQL.Add(IntToStr(Stale_Sub_Time) + ',');
      SQL.Add(IntToStr(Stale_ESM_Bearing_Time) + ',');
      SQL.Add(IntToStr(Stale_Sonar_Bearing_Time) + ',');
      SQL.Add(IntToStr(POD_Check_Time) + ',');
      SQL.Add(FloatToStr(TMA_Range_Rate) + ',');
      SQL.Add(FloatToStr(Frequency_Identity_Weighting) + ',');
      SQL.Add(FloatToStr(PRF_Identity_Weighting) + ',');
      SQL.Add(FloatToStr(Pulsewidth_Identity_Weighting) + ',');
      SQL.Add(FloatToStr(Scan_Period_Identity_Weighting) + ',');
      SQL.Add(FloatToStr(Crew_Eff_Heading_Error) + ',');
      SQL.Add(FloatToStr(Crew_Eff_Speed_Error) + ',');
      SQL.Add(FloatToStr(TMA_Relative_Bearing_Rate) + ',');
      SQL.Add(FloatToStr(Passive_Sonar_Max_Course_Error) + ',');
      SQL.Add(FloatToStr(Passive_Sonar_Max_Speed_Error) + ',');
      SQL.Add(FloatToStr(ESM_Error_Corr_Rate) + ',');
      SQL.Add(FloatToStr(Chaff_Altitude_Threshold) + ',');
      SQL.Add(FloatToStr(MHS_Flash_Delay_Time) + ',');
      SQL.Add(FloatToStr(MHS_Immed_Delay_Time) + ',');
      SQL.Add(FloatToStr(MHS_Priority_Delay_Time) + ',');
      SQL.Add(FloatToStr(MHS_Routine_Delay_Time) + ',');
      SQL.Add(FloatToStr(Max_UWT_Range) + ',');
      SQL.Add(FloatToStr(Max_HF_Detect_Range) + ',');
      SQL.Add(FloatToStr(Max_UHF_Detect_Range) + ',');
      SQL.Add(FloatToStr(Max_IFF_Range) + ',');
      SQL.Add(IntToStr(Track_History_Air_Sample_Rate) + ',');
      SQL.Add(IntToStr(Track_History_Air_Max_Points) + ',');
      SQL.Add(IntToStr(Track_History_Sample_Rate) + ',');
      SQL.Add(IntToStr(Track_History_Max_Points) + ',');
      SQL.Add(FloatToStr(Auto_Gun_Interception_Range) + ',');
      SQL.Add(FloatToStr(Auto_Gun_Threshold_Speed) + ',');
      SQL.Add(FloatToStr(Clutter_Reduction_Scale) + ',');
      SQL.Add(IntToStr(Jam_Break_Lock_Time_Interval) + ',');
      SQL.Add(IntToStr(Missile_Reacquisition_Time) + ',');
      SQL.Add(IntToStr(Seduction_Bloom_Altitude) + ',');
      SQL.Add(FloatToStr(Seduction_Bloom_Range) + ',');
      SQL.Add(FloatToStr(HF_Datalink_MHS_Trans_Freq) + ',');
      SQL.Add(FloatToStr(UHF_Datalink_MHS_Trans_Freq) + ',');
      SQL.Add(IntToStr(Max_Num_Radar_Classes) + ',');
      SQL.Add(IntToStr(Max_Num_Sonar_Classes) + ',');
      SQL.Add(IntToStr(Max_Num_Sonobuoy_Classes) + ',');
      SQL.Add(IntToStr(Max_Num_EO_Classes) + ',');
      SQL.Add(IntToStr(Max_Num_ESM_Classes) + ',');
      SQL.Add(IntToStr(Max_Num_MAD_Classes) + ',');
      SQL.Add(IntToStr(Max_Num_Fitted_Weap_Classes) + ',');
      SQL.Add(IntToStr(Max_Num_Point_Effect_Classes) + ',');
      SQL.Add(FloatToStr(HAFO_Min_Range) + ',');
      SQL.Add(FloatToStr(HAFO_Max_Range) + ',');
      SQL.Add(IntToStr(Engage_Guide_Stale_Target_Time) + ',');
      SQL.Add(IntToStr(Outrun_Guide_Stale_Target_Time) + ',');
      SQL.Add(IntToStr(Shadow_Guide_Stale_Target_Time) + ',');
      SQL.Add(FloatToStr(Sonobuoy_Air_Deceleration) + ',');
      SQL.Add(FloatToStr(Sonobuoy_Air_Descent_Rate) + ',');
      SQL.Add(FloatToStr(Depth_Charge_Air_Deceleration) + ',');
      SQL.Add(FloatToStr(Depth_Charge_Air_Descent_Rate) + ',');
      SQL.Add(IntToStr(Missile_Sea_Check_Interval) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteGame_Defaults(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Game_Defaults ');
    SQL.Add('WHERE Defaults_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getCubicle_GroupMember(var cGroup: TCubicle_Group;
  var pfList: TList): Integer;
var
  i, pi_Index: Integer;
  pi: TPlatform_Instance;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Cubicle_Group_Assignment a JOIN Platform_Instance b ');
    SQL.Add('ON a.Platform_Instance_Index = b.Platform_Instance_Index ');
    SQL.Add('WHERE (a.Group_Index = ' + IntToStr(cGroup.FData.Group_Index)
        + ')');
    SQL.Add('ORDER BY a.Group_Index');
    Open;

    // where group_index cGroup.FData.Group_Index;
    while not ZQ.Eof do
    begin
      pi_Index := ZQ.FieldByName('Platform_Instance_Index').AsInteger;

      for i := 0 to pfList.Count - 1 do
      begin
        pi := pfList[i];
        if pi.FData.Platform_Instance_Index = pi_Index then
          cGroup.PlatformInstances.Add(pi);
      end;

      ZQ.Next;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getCubicle_GroupMemberByPlatform(const pi: Integer;
  var rec: TCubicle_Group_Assignment): Integer;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Cubicle_Group_Assignment a JOIN Platform_Instance b ');
    SQL.Add('ON a.Platform_Instance_Index = b.Platform_Instance_Index ');
    SQL.Add('WHERE (a.Platform_Instance_Index = ' + IntToStr(pi) + ')');
    Open;

    // where group_index cGroup.FData.Group_Index;
    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TCubicle_Group_Assignment.Create;

      with rec.FPlatform do
      begin
        Platform_Instance_Index := FieldByName('Platform_Instance_Index')
          .AsInteger;
        Instance_Name := FieldByName('Instance_Name').AsString;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.getMaxCubicle_Group(var recMax: Integer): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT MAX(Group_Index) as last');
    SQL.Add('FROM Cubicle_Group ');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      recMax := Fields[0].AsInteger;
    end;
  end;
end;

function TdmTTT.getMaxRange(const id: Integer): Double;
var
  value : Double;
begin
  Result := 0;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT Max_Detect_Range');
    SQL.Add('FROM Sonar_Definition ');
    SQL.Add('Where (Sonar_Index = '+IntToStr(id)+')');
    Open;

    // result := RecordCount > 0;
    value := 0;
    if not IsEmpty then
    begin
      First;
      value := FieldByName('Max_Detect_Range').AsSingle;
    end;
  end;
  Result := value;
end;

function TdmTTT.getActiveRange(const id: integer): double;
var
  value : Double;
begin
  Result := 0;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT Active_Detect_Range');
    SQL.Add('FROM Sonar_Definition ');
    SQL.Add('Where (Sonar_Index = '+IntToStr(id)+')');
    Open;

    // result := RecordCount > 0;
    value := 0;
    if not IsEmpty then
    begin
      First;
      value := FieldByName('Active_Detect_Range').AsSingle;
    end;
  end;
  Result := value;
end;

function TdmTTT.getPassiveRange(const id: integer): double;
var
  value : Double;
begin
  Result := 0;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT Passive_Detect_Range');
    SQL.Add('FROM Sonar_Definition ');
    SQL.Add('Where (Sonar_Index = '+IntToStr(id)+')');
    Open;

    // result := RecordCount > 0;
    value := 0;
    if not IsEmpty then
    begin
      First;
      value := FieldByName('Passive_Detect_Range').AsSingle;
    end;
  end;
  Result := value;
end;


function TdmTTT.GetPersonel_Embark_Library(const id: Integer; var pList: Tlist): Boolean;
var
  rec: TPersonel;
begin
  Result := False;
  if not ZConn.Connected then
    Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Personel_Embark_Library ');
    SQL.Add('WHERE (Embark_Library_Index = ' + IntToStr(id) + ')');
    Open;

    Result := RecordCount > 0;
    if not Assigned(pList) then
      pList := TList.Create
    else
      pList.Clear;

    if not IsEmpty then
    begin
      First;
      while not ZQ.Eof do
      begin
        rec := TPersonel.Create;
        {with rec.FData do
        begin }
          rec.Id := FieldByName('Brigade_Index').AsInteger;
          rec.Identifier := FieldByName('Brigade_Identifier').AsString;
          rec.VeId := FieldByName('Vehicle_Index').AsInteger;
        {end;}
        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateCubicle_Groups(var rec: TCubicle_Group;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Cubicle_Group ');
      SQL.Add('SET ');
      SQL.Add('Group_Identifier=''' + Group_Identifier + ''',');
      SQL.Add('Deployment_Index=' + IntToStr(Deployment_Index) + ',');
      SQL.Add('Force_Designation=' + IntToStr(Force_Designation) + ',');
      SQL.Add('Track_Block_Start=' + IntToStr(Track_Block_Start) + ',');
      SQL.Add('Track_Block_End=' + IntToStr(Track_Block_End) + '');
    end;

    SQL.Add(' WHERE (Group_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertCubicle_Groups(var rec: TCubicle_Group): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Cubicle_Group ');
      SQL.Add(
        '(Group_Identifier,Deployment_Index,Force_Designation,Track_Block_Start,Track_Block_End)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Group_Identifier + ''',');
      SQL.Add(IntToStr(Deployment_Index) + ',');
      SQL.Add(IntToStr(Force_Designation) + ',');
      SQL.Add(IntToStr(Track_Block_Start) + ',');
      SQL.Add(IntToStr(Track_Block_End) + ')');
      // ShowMessage(SQL.Text);
      ExecSQL;
    end;

    //kembalikan nilai ke result // andik

    with ZQ do
    begin
      with rec.FData do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add('FROM  Cubicle_Group ');
        SQL.Add('WHERE Deployment_Index =' + IntToStr(Deployment_Index));
          SQL.Add(' AND Group_Identifier =' + QuotedStr(Group_Identifier));
        Open;

        if not IsEmpty then
        begin
          First;
          Result := FieldByName('Group_Index').AsInteger; //andik,, Group_Index sengaja saya taruh di result untuk keperluan save as scenario
        end;
      end;
    end;
  end;

end;

// ------------------------------------------------------------------------------

function TdmTTT.GetAllCubicle_Group_Channel_Assgnmnt(const id: Integer;
  var cList: TList): boolean;
var
  rec: TCubicle_Group_Assignment;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    //cendol by nando
    //    SQL.Add('SELECT * ');
    //    SQL.Add('FROM Cubicle_Group_Channel_Assgnmnt ');
    //    SQL.Add('WHERE (Group_Index = ' + IntToStr(id) + ')');
    SQL.Add('SELECT a.*, b.* ');
    SQL.Add('FROM Cubicle_Group_Channel_Assgnmnt a, External_Communication_Channel b ');
    SQL.Add('WHERE a.Group_Index='+ IntToStr(id) + ' and a.comms_channel_index=b.Comms_Channel_Index');
    Open;

    result := RecordCount > 0;
    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(cList) then
        cList := TList.Create
      else
        cList.Clear;

      while not ZQ.Eof do
      begin
        rec := TCubicle_Group_Assignment.Create;

        with rec.FChannel do
        begin
          Group_Index := FieldByName('Group_Index').AsInteger;
          Channel_Slot := FieldByName('Channel_Slot').AsInteger;
          Comms_Channel_Index := FieldByName('Comms_Channel_Index').AsInteger;
        end;

        cList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetCubicle_Group_Channel_Assgnmnt(const group_id, id,
  sign: Integer; var cList: TList): boolean;
var
  rec: TCubicle_Group_Assignment;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Cubicle_Group_Channel_Assgnmnt WHERE ');
    if sign = 1 then
      SQL.Add('Group_Index = ' + IntToStr(group_id))
    else if sign = 2 then
      SQL.Add('Comms_Channel_Index =' + IntToStr(id))
    else if sign = 3 then
    begin
      SQL.Add('Group_Index =' + IntToStr(group_id));
      SQL.Add(' AND Comms_Channel_Index =' + IntToStr(id));
    end;
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(cList) then
        cList := TList.Create
      else
        cList.Clear;

      while not ZQ.Eof do
      begin
        rec := TCubicle_Group_Assignment.Create;
        with rec.FChannel do
        begin
          Group_Index := FieldByName('Group_Index').AsInteger;
          Channel_Slot := FieldByName('Channel_Slot').AsInteger;
          Comms_Channel_Index := FieldByName('Comms_Channel_Index').AsInteger;
        end;

        cList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.InsertCubicle_Group_Channel_Assgnmnt
  (var rec: TCubicle_Group_Assignment): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FChannel do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Cubicle_Group_Channel_Assgnmnt  ');
      SQL.Add('(Group_Index,Channel_Slot,Comms_Channel_Index)');
      SQL.Add('VALUES ( ');
      SQL.Add(IntToStr(Group_Index) + ',');
      SQL.Add(IntToStr(Channel_Slot) + ',');
      SQL.Add(IntToStr(Comms_Channel_Index) + ')');
    end;

    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.UpdateCubicle_Group_Channel_Assgnmnt(const id: string;
  var rec: TCubicle_Group_Assignment): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FChannel do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Cubicle_Group_Channel_Assgnmnt  ');
      SQL.Add('SET ');
      SQL.Add('Channel_Slot = ' + IntToStr(Channel_Slot) + ',');
      SQL.Add('Comms_Channel_Index = ' + IntToStr(Comms_Channel_Index) + ' ');
    end;

    SQL.Add('WHERE (Group_Index = ' + id + ')');
    ExecSQL;
  end;
end;

function  TdmTTT.GetT3GroupList(const scID: Integer; var ss: TStringList): integer;
 var grp: T3CubicleGroup;
   i: Integer;
   LastGrpIndex, DeploymentIndex : Integer;
begin
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add(' a.Group_Index,  a.Deployment_Index,  a.Group_Identifier, ');
    SQL.Add(' a.Force_Designation, a.Tracks_Block , a.Track_Block_Start, ');
    SQL.Add(' a.Track_Block_End, a.Zulu_Zulu ');
    SQL.Add(' ');
    SQL.Add('FROM ');
    SQL.Add(' Cubicle_Group a JOIN  Asset_Deployment_Definition b ');
    SQL.Add(' ON a.Deployment_Index = b.Deployment_Index ');
    SQL.Add(' ');
    SQL.Add('WHERE ');
    SQL.Add(' b.Scenario_Index =');
    SQL.Add(IntToStr(scID));
    Open;
  end;

  Result  := ZQ.RecordCount;

  ss.Clear;
  while not ZQ.Eof do
  begin
    grp := T3CubicleGroup.Create;

    with grp.FData do
    begin
      Group_Index       := ZQ.Fields[0].AsInteger;
      Deployment_Index  := ZQ.Fields[1].AsInteger;
      Group_Identifier  := ZQ.Fields[2].AsString;
      Force_Designation := ZQ.Fields[3].AsInteger;
      Tracks_Block      := ZQ.Fields[4].AsInteger;
      Track_Block_Start := ZQ.Fields[5].AsInteger;
      Track_Block_End   := ZQ.Fields[6].AsInteger;
      Zulu_Zulu         := ZQ.Fields[7].AsInteger;
    end;

    grp.InitData;

    ss.AddObject(IntToStr(grp.FData.Group_Index), grp);
    LastGrpIndex := grp.FData.Group_Index;
    DeploymentIndex := grp.FData.Deployment_Index;
    ZQ.Next;
  end;

  //Andy Chibi
  //Add Controller For Each Force Designation
  for i := 1 to 5 do
  begin
    grp := T3CubicleGroup.Create;
    with grp.FData do
    begin
      Group_Index       := 0;
      Deployment_Index  := 0;
      Group_Identifier  := 'Controller';
      Force_Designation := i;
      Tracks_Block      := 0;
      Track_Block_Start := 0;
      Track_Block_End   := 0;
      Zulu_Zulu         := 0;
    end;

    grp.InitData;
    ss.AddObject(IntToStr(i), grp);
  end;

  grp := T3CubicleGroup.Create;
  inc(LastGrpIndex);
  with grp.FData do
  begin
    Group_Index       := 1;
    Deployment_Index  := 0;
    Group_Identifier  := 'Unassigned Group';
    Force_Designation := 0;
    Tracks_Block      := 0;
    Track_Block_Start := 0;
    Track_Block_End   := 0;
    Zulu_Zulu         := 0;
  end;
  grp.InitData;
  ss.AddObject(IntToStr(LastGrpIndex), grp);

  grp := T3CubicleGroup.Create;
  inc(LastGrpIndex);
  with grp.FData do
  begin
    Group_Index       := 1;
    Deployment_Index  := 0;
    Group_Identifier  := 'PELAKU';
    Force_Designation := 0;
    Tracks_Block      := 0;
    Track_Block_Start := 0;
    Track_Block_End   := 0;
    Zulu_Zulu         := 0;
  end;
  grp.InitData;
  ss.AddObject(IntToStr(LastGrpIndex), grp);

  grp := T3CubicleGroup.Create;
  inc(LastGrpIndex);
  with grp.FData do
  begin
    Group_Index       := 1;
    Deployment_Index  := 0;
    Group_Identifier  := 'VBS';
    Force_Designation := 0;
    Tracks_Block      := 0;
    Track_Block_Start := 0;
    Track_Block_End   := 0;
    Zulu_Zulu         := 0;
  end;

  grp.InitData;
  ss.AddObject(IntToStr(LastGrpIndex), grp);
end;

function  TdmTTT.GetT3GroupMember(const grpID: Integer; var ss: TStringList): integer;
var gm : T3CubicleGroupMember;
begin
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add(' a.Platform_Instance_Index, a.Group_Index, a.Command_Priority, ');
    SQL.Add(' a.Deployment_Index ');
    SQL.Add('FROM ');
    SQL.Add('  Cubicle_Group_Assignment a ');
    SQL.Add('WHERE ');
    SQL.Add('  a.Group_Index=');
    SQL.Add(IntToStr(grpId));
    SQL.Add('ORDER BY ');
    SQL.Add('a.Command_Priority ');
    Open;
  end;

  Result  := ZQ.RecordCount;

  ss.Clear;
  while not ZQ.Eof do
  begin
    gm := T3CubicleGroupMember.Create;

    with gm.FData do
    begin
      Platform_Instance_Index  :=ZQ.Fields[0].AsInteger;
      Group_Index              :=ZQ.Fields[1].AsInteger;
      Command_Priority         :=ZQ.Fields[2].AsInteger;
      Deployment_Index         :=ZQ.Fields[3].AsInteger;
    end;

    ss.AddObject(IntToStr(gm.FData.Platform_Instance_Index), gm);
    ZQ.Next;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetAllCubicle_Group_Assignment(const id: Integer;
  var cList: TList): boolean;
var
  rec: TCubicle_Group_Assignment;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Cubicle_Group_Assignment ');
    SQL.Add('WHERE (Group_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(cList) then
        cList := TList.Create
      else
        cList.Clear;

      while not ZQ.Eof do
      begin
        rec := TCubicle_Group_Assignment.Create;

        with rec.FCubicle do
        begin
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Group_Index       := FieldByName('Group_Index').AsInteger;
          Command_Priority  := FieldByName('Command_Priority').AsInteger;
          Deployment_Index  := FieldByName('Deployment_Index').AsInteger;
        end;

        cList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.InsertCubicle_Group_Assignment
  (var rec: TCubicle_Group_Assignment): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FCubicle do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Cubicle_Group_Assignment ');
      SQL.Add('VALUES ( ');
      SQL.Add(IntToStr(Platform_Instance_Index) + ',');
      SQL.Add(IntToStr(Group_Index) + ',');
      SQL.Add(IntToStr(Command_Priority) + ',');
      SQL.Add(IntToStr(Deployment_Index) + ')');
    end;

    // ShowMessage(SQL.Text);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.DeleteCubicle_Group_Assignment(const id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE Cubicle_Group_Assignment ');
    SQL.Add('WHERE Platform_Instance_Index =' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.UpdateCubicle_Group_Assignment(const id: string;
  var rec: TCubicle_Group_Assignment): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FCubicle do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Cubicle_Group_Assignment  ');
      SQL.Add('SET ');
      SQL.Add('Platform_Instance_Index = ' + IntToStr(Platform_Instance_Index)
          + ',');
      SQL.Add('Command_Priority = ' + IntToStr(Command_Priority) + ',');
      SQL.Add('Deployment_Index = ' + IntToStr(Deployment_Index) + ' ');
    end;

    SQL.Add('WHERE (Group_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetAllGame_Defaults(const id: Integer; var pList: TList;
  var rec: TGame_Defaults): Integer;
var
  ssql: string;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM Game_Defaults ';
    if id <> 0 then
      ssql := ssql + 'WHERE Defaults_Index =' + IntToStr(id);
    ssql := ssql + 'ORDER BY Defaults_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount;

    if not IsEmpty then
    begin
      First;

      if not Assigned(pList) then
        pList := TList.Create
      else
        pList.Clear;

      while not ZQ.Eof do
      begin
        rec := TGame_Defaults.Create;

        with rec.FData do
        begin
          Defaults_Index := FieldByName('Defaults_Index').AsInteger;
          Defaults_Identifier := FieldByName('Defaults_Identifier').AsString;
          Init_AOP := FieldByName('Init_AOP').AsInteger;
          AOP_Decrease_Rate := FieldByName('AOP_Decrease_Rate').AsSingle;
          Sono_Num_2_Initiate := FieldByName('Sono_Num_2_Initiate').AsInteger;
          Trans_Range_2_Air := FieldByName('Trans_Range_2_Air').AsSingle;
          Trans_Range_2_Sur := FieldByName('Trans_Range_2_Sur').AsSingle;
          Init_AOP_Modifier := FieldByName('Init_AOP_Modifier').AsSingle;
          Visual_Detect_Range := FieldByName('Visual_Detect_Range').AsSingle;
          Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
          Max_Visual_Range := FieldByName('Max_Visual_Range').AsSingle;
          EO_Detection_Factor := FieldByName('EO_Detection_Factor').AsSingle;
          Visual_Detection_Factor := FieldByName('Visual_Detection_Factor')
            .AsSingle;
          EO_Ident_Factor := FieldByName('EO_Ident_Factor').AsSingle;
          Visual_Ident_Factor := FieldByName('Visual_Ident_Factor').AsSingle;
          Sine_Period_Distance := FieldByName('Sine_Period_Distance').AsSingle;
          Sine_Period_Amplitude := FieldByName('Sine_Period_Amplitude')
            .AsSingle;
          Short_Period_Distance := FieldByName('Short_Period_Distance')
            .AsSingle;
          Short_Period_Amplitude := FieldByName('Short_Period_Amplitude')
            .AsSingle;
          Long_Period_Distance := FieldByName('Long_Period_Distance').AsSingle;
          Long_Period_Amplitude := FieldByName('Long_Period_Amplitude')
            .AsSingle;
          Very_Period_Distance := FieldByName('Very_Period_Distance').AsSingle;
          Very_Period_Amplitude := FieldByName('Very_Period_Amplitude')
            .AsSingle;
          Air_Lost_Time := FieldByName('Air_Lost_Time').AsInteger;
          Sur_Lost_Time := FieldByName('Sur_Lost_Time').AsInteger;
          Sub_Lost_Time := FieldByName('Sub_Lost_Time').AsInteger;
          ESM_Bearing_Lost_Time := FieldByName('ESM_Bearing_Lost_Time')
            .AsInteger;
          Sonar_Bearing_Lost_Time := FieldByName('Sonar_Bearing_Lost_Time')
            .AsInteger;
          Stale_Air_Time := FieldByName('Stale_Air_Time').AsInteger;
          Stale_Sur_Time := FieldByName('Stale_Sur_Time').AsInteger;
          Stale_Sub_Time := FieldByName('Stale_Sub_Time').AsInteger;
          Stale_ESM_Bearing_Time := FieldByName('Stale_ESM_Bearing_Time')
            .AsInteger;
          Stale_Sonar_Bearing_Time := FieldByName('Stale_Sonar_Bearing_Time')
            .AsInteger;
          POD_Check_Time := FieldByName('POD_Check_Time').AsInteger;
          TMA_Range_Rate := FieldByName('TMA_Range_Rate').AsSingle;
          Frequency_Identity_Weighting := FieldByName
            ('Frequency_Identity_Weighting').AsSingle;
          PRF_Identity_Weighting := FieldByName('PRF_Identity_Weighting')
            .AsSingle;
          Pulsewidth_Identity_Weighting := FieldByName
            ('Pulsewidth_Identity_Weighting').AsSingle;
          Scan_Period_Identity_Weighting := FieldByName
            ('Scan_Period_Identity_Weighting').AsSingle;
          Crew_Eff_Heading_Error := FieldByName('Crew_Eff_Heading_Error')
            .AsSingle;
          Crew_Eff_Speed_Error := FieldByName('Crew_Eff_Speed_Error').AsSingle;
          TMA_Relative_Bearing_Rate := FieldByName('TMA_Relative_Bearing_Rate')
            .AsSingle;
          Passive_Sonar_Max_Course_Error := FieldByName
            ('Passive_Sonar_Max_Course_Error').AsSingle;
          Passive_Sonar_Max_Speed_Error := FieldByName
            ('Passive_Sonar_Max_Speed_Error').AsSingle;
          ESM_Error_Corr_Rate := FieldByName('ESM_Error_Corr_Rate').AsSingle;
          Chaff_Altitude_Threshold := FieldByName('Chaff_Altitude_Threshold')
            .AsSingle;
          MHS_Flash_Delay_Time := FieldByName('MHS_Flash_Delay_Time').AsSingle;
          MHS_Immed_Delay_Time := FieldByName('MHS_Immed_Delay_Time').AsSingle;
          MHS_Priority_Delay_Time := FieldByName('MHS_Priority_Delay_Time')
            .AsSingle;
          MHS_Routine_Delay_Time := FieldByName('MHS_Routine_Delay_Time')
            .AsSingle;
          Max_UWT_Range := FieldByName('Max_UWT_Range').AsSingle;
          Max_HF_Detect_Range := FieldByName('Max_HF_Detect_Range').AsSingle;
          Max_UHF_Detect_Range := FieldByName('Max_UHF_Detect_Range').AsSingle;
          Max_IFF_Range := FieldByName('Max_IFF_Range').AsSingle;
          Track_History_Air_Sample_Rate := FieldByName
            ('Track_History_Air_Sample_Rate').AsInteger;
          Track_History_Air_Max_Points := FieldByName
            ('Track_History_Air_Max_Points').AsInteger;
          Track_History_Sample_Rate := FieldByName('Track_History_Sample_Rate')
            .AsInteger;
          Track_History_Max_Points := FieldByName('Track_History_Max_Points')
            .AsInteger;
          Auto_Gun_Interception_Range := FieldByName
            ('Auto_Gun_Interception_Range').AsSingle;
          Auto_Gun_Threshold_Speed := FieldByName('Auto_Gun_Threshold_Speed')
            .AsSingle;
          Clutter_Reduction_Scale := FieldByName('Clutter_Reduction_Scale')
            .AsSingle;
          Jam_Break_Lock_Time_Interval := FieldByName
            ('Jam_Break_Lock_Time_Interval').AsInteger;
          Missile_Reacquisition_Time := FieldByName
            ('Missile_Reacquisition_Time')
            .AsInteger;
          Seduction_Bloom_Altitude := FieldByName('Seduction_Bloom_Altitude')
            .AsInteger;
          Seduction_Bloom_Range := FieldByName('Seduction_Bloom_Range')
            .AsSingle;
          HF_Datalink_MHS_Trans_Freq := FieldByName
            ('HF_Datalink_MHS_Trans_Freq').AsSingle;
          UHF_Datalink_MHS_Trans_Freq := FieldByName
            ('UHF_Datalink_MHS_Trans_Freq').AsSingle;
          Max_Num_Radar_Classes := FieldByName('Max_Num_Radar_Classes')
            .AsInteger;
          Max_Num_Sonar_Classes := FieldByName('Max_Num_Sonar_Classes')
            .AsInteger;
          Max_Num_Sonobuoy_Classes := FieldByName('Max_Num_Sonobuoy_Classes')
            .AsInteger;
          Max_Num_EO_Classes := FieldByName('Max_Num_EO_Classes').AsInteger;
          Max_Num_ESM_Classes := FieldByName('Max_Num_ESM_Classes').AsInteger;
          Max_Num_MAD_Classes := FieldByName('Max_Num_MAD_Classes').AsInteger;
          Max_Num_Fitted_Weap_Classes := FieldByName
            ('Max_Num_Fitted_Weap_Classes').AsInteger;
          Max_Num_Point_Effect_Classes := FieldByName
            ('Max_Num_Point_Effect_Classes').AsInteger;
          HAFO_Min_Range := FieldByName('HAFO_Min_Range').AsSingle;
          HAFO_Max_Range := FieldByName('HAFO_Max_Range').AsSingle;
          Engage_Guide_Stale_Target_Time := FieldByName
            ('Engage_Guide_Stale_Target_Time').AsInteger;
          Outrun_Guide_Stale_Target_Time := FieldByName
            ('Outrun_Guide_Stale_Target_Time').AsInteger;
          Shadow_Guide_Stale_Target_Time := FieldByName
            ('Shadow_Guide_Stale_Target_Time').AsInteger;
          Sonobuoy_Air_Deceleration := FieldByName('Sonobuoy_Air_Deceleration')
            .AsSingle;
          Sonobuoy_Air_Descent_Rate := FieldByName('Sonobuoy_Air_Descent_Rate')
            .AsSingle;
          Depth_Charge_Air_Deceleration := FieldByName
            ('Depth_Charge_Air_Deceleration').AsSingle;
          Depth_Charge_Air_Descent_Rate := FieldByName
            ('Depth_Charge_Air_Descent_Rate').AsSingle;
          Missile_Sea_Check_Interval := FieldByName
            ('Missile_Sea_Check_Interval')
            .AsInteger;
        end;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Defaults(const id: Integer; var rec: TGame_Defaults)
  : boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Defaults a JOIN Resource_Allocation b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (b.Resource_Alloc_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;

    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec)) then
        rec := TGame_Defaults.Create;

      with rec.FData do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Defaults_Identifier := FieldByName('Defaults_Identifier').AsString;
        Init_AOP := FieldByName('Init_AOP').AsInteger;
        AOP_Decrease_Rate := FieldByName('AOP_Decrease_Rate').AsSingle;
        Sono_Num_2_Initiate := FieldByName('Sono_Num_2_Initiate').AsInteger;
        Trans_Range_2_Air := FieldByName('Trans_Range_2_Air').AsSingle;
        Trans_Range_2_Sur := FieldByName('Trans_Range_2_Sur').AsSingle;
        Init_AOP_Modifier := FieldByName('Init_AOP_Modifier').AsSingle;
        Visual_Detect_Range := FieldByName('Visual_Detect_Range').AsSingle;
        Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
        Max_Visual_Range := FieldByName('Max_Visual_Range').AsSingle;
        EO_Detection_Factor := FieldByName('EO_Detection_Factor').AsSingle;
        Visual_Detection_Factor := FieldByName('Visual_Detection_Factor')
          .AsSingle;
        EO_Ident_Factor := FieldByName('EO_Ident_Factor').AsSingle;
        Visual_Ident_Factor := FieldByName('Visual_Ident_Factor').AsSingle;
        Sine_Period_Distance := FieldByName('Sine_Period_Distance').AsSingle;
        Sine_Period_Amplitude := FieldByName('Sine_Period_Amplitude').AsSingle;
        Short_Period_Distance := FieldByName('Short_Period_Distance').AsSingle;
        Short_Period_Amplitude := FieldByName('Short_Period_Amplitude')
          .AsSingle;
        Long_Period_Distance := FieldByName('Long_Period_Distance').AsSingle;
        Long_Period_Amplitude := FieldByName('Long_Period_Amplitude').AsSingle;
        Very_Period_Distance := FieldByName('Very_Period_Distance').AsSingle;
        Very_Period_Amplitude := FieldByName('Very_Period_Amplitude').AsSingle;
        Air_Lost_Time := FieldByName('Air_Lost_Time').AsInteger;
        Sur_Lost_Time := FieldByName('Sur_Lost_Time').AsInteger;
        Sub_Lost_Time := FieldByName('Sub_Lost_Time').AsInteger;
        ESM_Bearing_Lost_Time := FieldByName('ESM_Bearing_Lost_Time').AsInteger;
        Sonar_Bearing_Lost_Time := FieldByName('Sonar_Bearing_Lost_Time')
          .AsInteger;
        Stale_Air_Time := FieldByName('Stale_Air_Time').AsInteger;
        Stale_Sur_Time := FieldByName('Stale_Sur_Time').AsInteger;
        Stale_Sub_Time := FieldByName('Stale_Sub_Time').AsInteger;
        Stale_ESM_Bearing_Time := FieldByName('Stale_ESM_Bearing_Time')
          .AsInteger;
        Stale_Sonar_Bearing_Time := FieldByName('Stale_Sonar_Bearing_Time')
          .AsInteger;
        POD_Check_Time := FieldByName('POD_Check_Time').AsInteger;
        TMA_Range_Rate := FieldByName('TMA_Range_Rate').AsSingle;
        Frequency_Identity_Weighting := FieldByName
          ('Frequency_Identity_Weighting').AsSingle;
        PRF_Identity_Weighting := FieldByName('PRF_Identity_Weighting')
          .AsSingle;
        Pulsewidth_Identity_Weighting := FieldByName
          ('Pulsewidth_Identity_Weighting').AsSingle;
        Scan_Period_Identity_Weighting := FieldByName
          ('Scan_Period_Identity_Weighting').AsSingle;
        Crew_Eff_Heading_Error := FieldByName('Crew_Eff_Heading_Error')
          .AsSingle;
        Crew_Eff_Speed_Error := FieldByName('Crew_Eff_Speed_Error').AsSingle;
        TMA_Relative_Bearing_Rate := FieldByName('TMA_Relative_Bearing_Rate')
          .AsSingle;
        Passive_Sonar_Max_Course_Error := FieldByName
          ('Passive_Sonar_Max_Course_Error').AsSingle;
        Passive_Sonar_Max_Speed_Error := FieldByName
          ('Passive_Sonar_Max_Speed_Error').AsSingle;
        ESM_Error_Corr_Rate := FieldByName('ESM_Error_Corr_Rate').AsSingle;
        Chaff_Altitude_Threshold := FieldByName('Chaff_Altitude_Threshold')
          .AsSingle;
        MHS_Flash_Delay_Time := FieldByName('MHS_Flash_Delay_Time').AsSingle;
        MHS_Immed_Delay_Time := FieldByName('MHS_Immed_Delay_Time').AsSingle;
        MHS_Priority_Delay_Time := FieldByName('MHS_Priority_Delay_Time')
          .AsSingle;
        MHS_Routine_Delay_Time := FieldByName('MHS_Routine_Delay_Time')
          .AsSingle;
        Max_UWT_Range := FieldByName('Max_UWT_Range').AsSingle;
        Max_HF_Detect_Range := FieldByName('Max_HF_Detect_Range').AsSingle;
        Max_UHF_Detect_Range := FieldByName('Max_UHF_Detect_Range').AsSingle;
        Max_IFF_Range := FieldByName('Max_IFF_Range').AsSingle;
        Track_History_Air_Sample_Rate := FieldByName
          ('Track_History_Air_Sample_Rate').AsInteger;
        Track_History_Air_Max_Points := FieldByName
          ('Track_History_Air_Max_Points').AsInteger;
        Track_History_Sample_Rate := FieldByName('Track_History_Sample_Rate')
          .AsInteger;
        Track_History_Max_Points := FieldByName('Track_History_Max_Points')
          .AsInteger;
        Auto_Gun_Interception_Range := FieldByName
          ('Auto_Gun_Interception_Range').AsSingle;
        Auto_Gun_Threshold_Speed := FieldByName('Auto_Gun_Threshold_Speed')
          .AsSingle;
        Clutter_Reduction_Scale := FieldByName('Clutter_Reduction_Scale')
          .AsSingle;
        Jam_Break_Lock_Time_Interval := FieldByName
          ('Jam_Break_Lock_Time_Interval').AsInteger;
        Missile_Reacquisition_Time := FieldByName('Missile_Reacquisition_Time')
          .AsInteger;
        Seduction_Bloom_Altitude := FieldByName('Seduction_Bloom_Altitude')
          .AsInteger;
        Seduction_Bloom_Range := FieldByName('Seduction_Bloom_Range').AsSingle;
        HF_Datalink_MHS_Trans_Freq := FieldByName('HF_Datalink_MHS_Trans_Freq')
          .AsSingle;
        UHF_Datalink_MHS_Trans_Freq := FieldByName
          ('UHF_Datalink_MHS_Trans_Freq').AsSingle;
        Max_Num_Radar_Classes := FieldByName('Max_Num_Radar_Classes').AsInteger;
        Max_Num_Sonar_Classes := FieldByName('Max_Num_Sonar_Classes').AsInteger;
        Max_Num_Sonobuoy_Classes := FieldByName('Max_Num_Sonobuoy_Classes')
          .AsInteger;
        Max_Num_EO_Classes := FieldByName('Max_Num_EO_Classes').AsInteger;
        Max_Num_ESM_Classes := FieldByName('Max_Num_ESM_Classes').AsInteger;
        Max_Num_MAD_Classes := FieldByName('Max_Num_MAD_Classes').AsInteger;
        Max_Num_Fitted_Weap_Classes := FieldByName
          ('Max_Num_Fitted_Weap_Classes')
          .AsInteger;
        Max_Num_Point_Effect_Classes := FieldByName
          ('Max_Num_Point_Effect_Classes').AsInteger;
        HAFO_Min_Range := FieldByName('HAFO_Min_Range').AsSingle;
        HAFO_Max_Range := FieldByName('HAFO_Max_Range').AsSingle;
        Engage_Guide_Stale_Target_Time := FieldByName
          ('Engage_Guide_Stale_Target_Time').AsInteger;
        Outrun_Guide_Stale_Target_Time := FieldByName
          ('Outrun_Guide_Stale_Target_Time').AsInteger;
        Shadow_Guide_Stale_Target_Time := FieldByName
          ('Shadow_Guide_Stale_Target_Time').AsInteger;
        Sonobuoy_Air_Deceleration := FieldByName('Sonobuoy_Air_Deceleration')
          .AsSingle;
        Sonobuoy_Air_Descent_Rate := FieldByName('Sonobuoy_Air_Descent_Rate')
          .AsSingle;
        Depth_Charge_Air_Deceleration := FieldByName
          ('Depth_Charge_Air_Deceleration').AsSingle;
        Depth_Charge_Air_Descent_Rate := FieldByName
          ('Depth_Charge_Air_Descent_Rate').AsSingle;
        Missile_Sea_Check_Interval := FieldByName('Missile_Sea_Check_Interval')
          .AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------
{
  function TdmTTT.GetFormation_Definition(const id: integer;
  var rec: TFormation_Definition): boolean;
  begin
  result := false;
  if not zConn.Connected then Exit;

  with ZQ do begin
  Close;
  SQL.Clear;
  SQL.Add('SELECT * ');
  SQL.Add('FROM Formation_Definition a ' );
  SQL.Add('WHERE (a.Deployment_Index = ' +  IntToStr(id) + ')' );
  Open;

  result := RecordCount > 0;
  if not IsEmpty then begin
  First;
  if not Assigned(rec) then
  rec := TFormation_Definition.Create;
  with rec.FData do begin
  Formation_Index         := FieldByName('Formation_Index').AsInteger;
  Formation_Identifier    := FieldByName('Formation_Identifier').AsString;
  Force_Designation       := FieldByName('Force_Designation').AsInteger;
  Formation_Leader        := FieldByName('Formation_Leader').AsInteger;
  Angle_Type              := FieldByName('Angle_Type').AsInteger;
  Deployment_Index        := FieldByName('Deployment_Index').AsInteger;
  end;
  end;
  end;
  end;
  }
// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Cloud_On_ESM(const id: Integer;
  var rec: TGame_Defaults{TRecGame_Cloud_On_ESM}): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Cloud_On_ESM a JOIN Game_Defaults b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (a.Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec)) then
        rec := TGame_Defaults.Create;

      with rec.FGameCloud_ESM do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
        Cloud_0_Effect := FieldByName('Cloud_0_Effect').AsSingle;
        Cloud_1_Effect := FieldByName('Cloud_1_Effect').AsSingle;
        Cloud_2_Effect := FieldByName('Cloud_2_Effect').AsSingle;
        Cloud_3_Effect := FieldByName('Cloud_3_Effect').AsSingle;
        Cloud_4_Effect := FieldByName('Cloud_4_Effect').AsSingle;
        Cloud_5_Effect := FieldByName('Cloud_5_Effect').AsSingle;
        Cloud_6_Effect := FieldByName('Cloud_6_Effect').AsSingle;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Cloud_On_Radar(const id: Integer;
  var rec: TGame_Defaults{TRecGame_Cloud_On_Radar}): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Cloud_On_Radar a JOIN Game_Defaults b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (a.Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec)) then
        rec := TGame_Defaults.Create;

      with rec.FGameCloud_Radar do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
        Cloud_0_Effect := FieldByName('Cloud_0_Effect').AsSingle;
        Cloud_1_Effect := FieldByName('Cloud_1_Effect').AsSingle;
        Cloud_2_Effect := FieldByName('Cloud_2_Effect').AsSingle;
        Cloud_3_Effect := FieldByName('Cloud_3_Effect').AsSingle;
        Cloud_4_Effect := FieldByName('Cloud_4_Effect').AsSingle;
        Cloud_5_Effect := FieldByName('Cloud_5_Effect').AsSingle;
        Cloud_6_Effect := FieldByName('Cloud_6_Effect').AsSingle;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Default_IFF_Mode_Code(const id: Integer;
  var rec: TGame_Defaults): boolean;
var
  I: Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Default_IFF_Mode_Code a JOIN Game_Defaults b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (a.Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec)) then
        rec := TGame_Defaults.Create;

      SetLength(rec.FGameDefault_IFF,RecordCount);

      for I := 0 to RecordCount - 1 do
      begin
        with rec.FGameDefault_IFF[I] do
        begin
          Defaults_Index := FieldByName('Defaults_Index').AsInteger;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
          IFF_Device_Type := FieldByName('IFF_Device_Type').AsInteger;
          IFF_Mode := FieldByName('IFF_Mode').AsInteger;
          IFF_Code := FieldByName('IFF_Code').AsInteger;
          Mode_State := FieldByName('Mode_State').AsInteger;
        end;
        Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Rainfall_On_ESM(const id: Integer;
  var rec: TGame_Defaults{TRecGame_Rainfall_On_ESM}): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Rainfall_On_ESM  a JOIN Game_Defaults b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (a.Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec)) then
        rec := TGame_Defaults.Create;

      with rec.FGameRainfall_ESM do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
        Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
        Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
        Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
        Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
        Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
        Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
        Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Rainfall_On_Missile_Seeker(const id: Integer;
  var rec: TGame_Defaults{TRecGame_Rainfall_On_Missile_Seeker}): boolean;
var
  Rainfall : TRainfall_On_Missile_Seeker;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Rainfall_On_Missile_Seeker a JOIN Game_Defaults b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (a.Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec.RainfallMissile)) then
        rec.RainfallMissile := TList.Create
      else
        rec.RainfallMissile.Clear;

      while not ZQ.Eof do
      begin
        Rainfall := TRainfall_On_Missile_Seeker.Create;

        with Rainfall.FData do
        begin
          Guide_Type := FieldByName('Guide_Type').AsInteger;
          Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
          Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
          Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
          Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
          Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
          Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
          Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
        end;

        rec.RainfallMissile.Add(Rainfall);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Rainfall_On_Radar(const id: Integer;
  var rec: TGame_Defaults{TRecGame_Rainfall_On_Radar}): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Rainfall_On_Radar a JOIN Game_Defaults b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (a.Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec)) then
        rec := TGame_Defaults.Create;

      with rec.FGameRainfall_Radar do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
        Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
        Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
        Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
        Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
        Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
        Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
        Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
      end;
    end;
  end;
end;
// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Rainfall_On_Sonar(const id: Integer;
  var rec: TGame_Defaults{TRecGame_Rainfall_On_Sonar}): boolean;
var i : Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Rainfall_On_Sonar a JOIN Game_Defaults b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (a.Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec)) then
        rec := TGame_Defaults.Create;

      SetLength(rec.FGameRainfall_Sonar, RecordCount);
      for I := 0 to RecordCount - 1 do
      begin
        with rec.FGameRainfall_Sonar[i] do
        begin
          Defaults_Index := FieldByName('Defaults_Index').AsInteger;
          Sonar_Frequency := FieldByName('Sonar_Frequency').AsSingle;
          Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
          Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
          Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
          Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
          Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
          Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
          Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
        end;
        Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Sea_On_Missile_Safe_Altitude(const id: Integer;
  var rec: TGame_Defaults{TRecGame_Sea_On_Missile_Safe_Altitude}): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Sea_On_Missile_Safe_Altitude a JOIN Game_Defaults b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (a.Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;

    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec)) then
        rec := TGame_Defaults.Create;

      with rec.FGameSea_Missile do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Sea_State := FieldByName('Sea_State').AsInteger;
        Effect_on_Missile_Safe_Altitude := FieldByName
          ('Effect_on_Missile_Safe_Altitud').AsSingle;
        // Effect_on_Missile_Safe_Altitude   := FieldByName('Effect_on_Missile_Safe_Altitude').AsSingle;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Sea_On_Radar(const id: Integer;
  var rec: TGame_Defaults{TRecGame_Sea_On_Radar}): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Sea_On_Radar a JOIN Game_Defaults b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (a.Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;

    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec)) then
        rec := TGame_Defaults.Create;

      with rec.FGameSea_Radar do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Sea_State := FieldByName('Sea_State').AsInteger;
        Effect_on_Radar := FieldByName('Effect_on_Radar').AsSingle;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGame_Sea_On_Sonar(const id: Integer;
  var rec: TGame_Defaults{TRecGame_Sea_On_Sonar}): boolean;
var
  i : Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Sea_On_Sonar a JOIN Game_Defaults b ');
    SQL.Add('ON a.Defaults_Index = b.Defaults_Index ');
    SQL.Add('WHERE (a.Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;

    if not IsEmpty then
    begin
      First;

      if not(Assigned(rec)) then
        rec := TGame_Defaults.Create;

      SetLength(rec.FGameSea_Sonar, RecordCount);

      for I := 0 to RecordCount - 1 do
      begin
        with rec.FGameSea_Sonar[i] do
        begin
          Defaults_Index := FieldByName('Defaults_Index').AsInteger;
          Sonar_Frequency := FieldByName('Sonar_Frequency').AsSingle;
          Sea_0_Effect := FieldByName('Sea_0_Effect').AsSingle;
          Sea_1_Effect := FieldByName('Sea_1_Effect').AsSingle;
          Sea_2_Effect := FieldByName('Sea_2_Effect').AsSingle;
          Sea_3_Effect := FieldByName('Sea_3_Effect').AsSingle;
          Sea_4_Effect := FieldByName('Sea_4_Effect').AsSingle;
          Sea_5_Effect := FieldByName('Sea_5_Effect').AsSingle;
          Sea_6_Effect := FieldByName('Sea_6_Effect').AsSingle;
          Sea_7_Effect := FieldByName('Sea_7_Effect').AsSingle;
          Sea_8_Effect := FieldByName('Sea_8_Effect').AsSingle;
          Sea_9_Effect := FieldByName('Sea_9_Effect').AsSingle;
        end;
        Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetScripted_Behav(const id: Integer;
  var rec: TScripted_Behav_Definition): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Scripted_Behav_Definition ');
    SQL.Add('WHERE (Scripted_Event_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TScripted_Behav_Definition.Create;

      with rec.FData do
      begin
        Scripted_Event_Index := FieldByName('Scripted_Event_Index').AsInteger;
        Number_of_Event := FieldByName('Number_of_Event').AsInteger;
        Platform_Event_Index := FieldByName('Platform_Event_Index').AsInteger;
        Speed := FieldByName('Speed').AsInteger;
        Altitude := FieldByName('Altitude').AsSingle;
        Vert_Speed := FieldByName('Vert_Speed').AsInteger;
        Waypoint_Latitude := FieldByName('Waypoint_Latitude').AsFloat;
        Waypoint_Longitude := FieldByName('Waypoint_Longitude').AsFloat;
        Cartesian_Waypoint_X := FieldByName('Cartesian_Waypoint_X').AsSingle;
        Cartesian_Waypoint_Y := FieldByName('Cartesian_Waypoint_Y').AsSingle;
        Time_Waypoint := FieldByName('Time_Waypoint').AsInteger;
        Time_2_Waypoint := FieldByName('Time_2_Waypoint').AsInteger;
        HF_Datalink_Activate := FieldByName('HF_Datalink_Activate').AsInteger;
        UHF_Datalink_Activate := FieldByName('UHF_Datalink_Activate').AsInteger;
        Sonobuoy_Resource_Index := FieldByName('Sonobuoy_Resource_Index')
          .AsInteger;
        Sonobuoy_Instance_Index := FieldByName('Sonobuoy_Instance_Index')
          .AsInteger;
        Deploy_Sonobuoys := FieldByName('Deploy_Sonobuoys').AsInteger;
        Sonobuoy_Spacing := FieldByName('Sonobuoy_Spacing').AsSingle;
        Num_Sonobuoys_2_Drop := FieldByName('Num_Sonobuoys_2_Drop').AsInteger;
        Sonobuoy_Depth := FieldByName('Sonobuoy_Depth').AsSingle;
        Jammer_Control := FieldByName('Jammer_Control').AsInteger;
        Remove_from_Game := FieldByName('Remove_from_Game').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetScripted_Pattern(const id: Integer;
  var rec: TScripted_Pattern_Point): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Scripted_Pattern_Point ');
    SQL.Add('WHERE (Scripted_Pattern_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TScripted_Pattern_Point.Create;

      with rec.FData do
      begin
        Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
          .AsInteger;
        Point_Number := FieldByName('Point_Number').AsInteger;
        Pattern_Index := FieldByName('Pattern_Index').AsInteger;
        Heading := FieldByName('Heading').AsSingle;
        Range := FieldByName('Range').AsSingle;
        Speed := FieldByName('Speed').AsInteger;
        Altitude := FieldByName('Altitude').AsSingle;
        Vert_Speed := FieldByName('Vert_Speed').AsInteger;
        Time_Waypoint := FieldByName('Time_Waypoint').AsInteger;
        Time_2_Waypoint := FieldByName('Time_2_Waypoint').AsInteger;
        HF_Datalink_Activate := FieldByName('HF_Datalink_Activate').AsInteger;
        UHF_Datalink_Activate := FieldByName('UHF_Datalink_Activate').AsInteger;
        Sonobuoy_Instance_Index := FieldByName('Sonobuoy_Instance_Index')
          .AsInteger;
        Deploy_Sonobuoys := FieldByName('Deploy_Sonobuoys').AsInteger;
        Sonobuoy_Spacing := FieldByName('Sonobuoy_Spacing').AsSingle;
        Num_Sonobuoys_2_Drop := FieldByName('Num_Sonobuoys_2_Drop').AsInteger;
        Sonobuoy_Depth := FieldByName('Sonobuoy_Depth').AsSingle;
        Jammer_Control := FieldByName('Jammer_Control').AsInteger;
        Remove_from_Game := FieldByName('Remove_from_Game').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetRainfall_On_ESM(var aRec: TList): boolean;
var
  rec: TRainfall_On_ESM;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Rainfall_On_ESM');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TRainfall_On_ESM.Create;

        with rec.FData do
        begin
          Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
          Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
          Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
          Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
          Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
          Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
          Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
          Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetRainfall_On_Missile(var aRec: TList): boolean;
var
  rec: TRainfall_On_Missile;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Rainfall_On_Missile_Seeker');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TRainfall_On_Missile.Create;

        with rec.FData do
        begin
          Guide_Type := FieldByName('Guide_Type').AsInteger;
          Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
          Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
          Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
          Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
          Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
          Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
          Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetRainfall_On_Radar(var aRec: TList): boolean;
var
  rec: TRainfall_On_Radar;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Rainfall_On_Radar');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TRainfall_On_Radar.Create;

        with rec.FData do
        begin
          Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
          Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
          Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
          Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
          Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
          Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
          Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
          Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetRainfall_On_Sonar(var aRec: TList): boolean;
var
  rec: TRainfall_On_Sonar;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Rainfall_On_Sonar');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TRainfall_On_Sonar.Create;

        with rec.FData do
        begin
          Sonar_Frequency := FieldByName('Sonar_Frequency').AsSingle;
          Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
          Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
          Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
          Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
          Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
          Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
          Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;

        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;


function TdmTTT.getRecords(RecordName: String; RecordTbl: TZQuery): boolean;
var
  query : string;
begin

  result := False;

  if not Assigned(RecordTbl) then
  begin
    RecordTbl := TZQuery.Create(nil);
  end;

  RecordTbl.Connection := ZConn;

  query := 'SELECT a.* FROM RECORD_DATA a INNER JOIN RECORD b ' +
    ' ON a.Record_Index = b.Record_Index WHERE b.Record_Name = ' + QuotedStr(RecordName) +
    ' ORDER BY a.QueueNo, a.TICK';

  with RecordTbl do begin
    SQL.Clear;
    SQL.Add(query);
    Open;
    First;
  end;

end;

function TdmTTT.getSnapshotData(SnapshotName: String;
  RecordTbl: TZQuery): boolean;
var
  query : string;
begin

  result := False;

  if not Assigned(RecordTbl) then
  begin
    RecordTbl := TZQuery.Create(nil);
  end;

  RecordTbl.Connection := ZConn;

  query := 'SELECT a.* FROM Snapshot_Data a INNER JOIN Snapshot b ' +
    ' ON a.Snapshot_Index = b.Snapshot_Index WHERE b.Snapshot_name = ' + QuotedStr(SnapshotName);

  with RecordTbl do begin
    SQL.Clear;
    SQL.Add(query);
    Open;
    First;
  end;

end;

procedure TdmTTT.getSnapshotTime(SnapshotName: String; out GameTime: TDateTime);
var
  query : string;
  num : integer;
begin

  query := 'SELECT * FROM Snapshot WHERE Snapshot_name = :Name';

  with ZQ do begin
    ParamCheck := True;
    SQL.Clear;
    SQL.Add(query);
    Params.ParamByName('name').Value := SnapshotName;
    Open;

    if RecordCount > 0 then
    begin
      First;
      GameTime := FieldByName('Game_Time').AsDateTime;
    end;
  end;

end;

procedure TdmTTT.getRecordTime(RecordName: String; out TimeStart,
  TimeStop: TDateTime);
var
  query : string;
  num : integer;
begin

  query := 'SELECT * FROM RECORD WHERE RECORD_NAME = :Name';

  with ZQ do begin
    ParamCheck := True;
    SQL.Clear;
    SQL.Add(query);
    Params.ParamByName('name').Value := RecordName;
    Open;

    if RecordCount > 0 then
    begin
      First;
      TimeStart := FieldByName('GameTimeStart').AsDateTime;
      TimeStop := FieldByName('GameTimeStop').AsDateTime;
    end;
  end;

end;

// ------------------------------------------------------------------------------

function TdmTTT.updateRainfall_On_Sonar(rec: TRainfall_On_Sonar;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Rainfall_On_Sonar  ');
      SQL.Add('SET ');
      SQL.Add('Rain_0_Effect = ' + FloatToStr(Rain_0_Effect) + ',');
      SQL.Add('Rain_1_Effect = ' + FloatToStr(Rain_1_Effect) + ',');
      SQL.Add('Rain_2_Effect = ' + FloatToStr(Rain_2_Effect) + ',');
      SQL.Add('Rain_3_Effect = ' + FloatToStr(Rain_3_Effect) + ',');
      SQL.Add('Rain_4_Effect = ' + FloatToStr(Rain_4_Effect) + ',');
      SQL.Add('Rain_5_Effect = ' + FloatToStr(Rain_5_Effect) + ',');
      SQL.Add('Rain_6_Effect = ' + FloatToStr(Rain_6_Effect));
    end;

    SQL.Add('WHERE (Sonar_Frequency = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertRainfall_On_Sonar(rec: TRainfall_On_Sonar): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Rainfall_On_Sonar] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Rainfall_On_Sonar ');
      SQL.Add(
        '(Sonar_Frequency,Rain_0_Effect,Rain_1_Effect,Rain_2_Effect,Rain_3_Effect,Rain_4_Effect,Rain_5_Effect,Rain_6_Effect)');
      SQL.Add(' VALUES (');
      SQL.Add(FloatToStr(Sonar_Frequency) + ',');
      SQL.Add(FloatToStr(Rain_0_Effect) + ',');
      SQL.Add(FloatToStr(Rain_1_Effect) + ',');
      SQL.Add(FloatToStr(Rain_2_Effect) + ',');
      SQL.Add(FloatToStr(Rain_3_Effect) + ',');
      SQL.Add(FloatToStr(Rain_4_Effect) + ',');
      SQL.Add(FloatToStr(Rain_5_Effect) + ',');
      SQL.Add(FloatToStr(Rain_6_Effect) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetCloud_Effect_On_ESM(var aRec: TList): boolean;
var
  rec: TCloud_Effects_On_ESM;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Cloud_Effects_On_ESM');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TCloud_Effects_On_ESM.Create;

        with rec.FData do
        begin
          Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
          Cloud_0_Effect := FieldByName('Cloud_0_Effect').AsSingle;
          Cloud_1_Effect := FieldByName('Cloud_1_Effect').AsSingle;
          Cloud_2_Effect := FieldByName('Cloud_2_Effect').AsSingle;
          Cloud_3_Effect := FieldByName('Cloud_3_Effect').AsSingle;
          Cloud_4_Effect := FieldByName('Cloud_4_Effect').AsSingle;
          Cloud_5_Effect := FieldByName('Cloud_5_Effect').AsSingle;
          Cloud_6_Effect := FieldByName('Cloud_6_Effect').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetCloud_Effect_On_Radar(var aRec: TList): boolean;
var
  rec: TCloud_Effects_On_Radar;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Cloud_Effects_On_Radar');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TCloud_Effects_On_Radar.Create;

        with rec.FData do
        begin
          Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
          Cloud_0_Effect := FieldByName('Cloud_0_Effect').AsSingle;
          Cloud_1_Effect := FieldByName('Cloud_1_Effect').AsSingle;
          Cloud_2_Effect := FieldByName('Cloud_2_Effect').AsSingle;
          Cloud_3_Effect := FieldByName('Cloud_3_Effect').AsSingle;
          Cloud_4_Effect := FieldByName('Cloud_4_Effect').AsSingle;
          Cloud_5_Effect := FieldByName('Cloud_5_Effect').AsSingle;
          Cloud_6_Effect := FieldByName('Cloud_6_Effect').AsSingle;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetSeaStateOnMissile(var sea: TSingleArray): boolean;
var
  i: Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Sea_State_On_Missile_Safe_Altitude ');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      SetLength(sea, RecordCount);
      i := 0;
      while not ZQ2.Eof do
      begin
        sea[i] := FieldByName('Effect_on_Missile_Safe_Altitud').AsSingle;
        Inc(i);
        Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetSeaStateOnRadar(var sea: TSingleArray): boolean;
var
  i: Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Sea_State_On_Radar ');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      SetLength(sea, RecordCount);
      i := 0;
      while not ZQ2.Eof do
      begin
        sea[i] := FieldByName('Effect_on_Radar').AsSingle;
        Inc(i);
        Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetSeaStateOnSonar(var sea: TSeaStateSonarArray): boolean;
var
  i: Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Sea_On_Sonar order by Sonar_Frequency ');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      SetLength(sea, RecordCount);

      for I := 0 to RecordCount - 1 do
      begin
        with sea[i] do
        begin
          Sonar_Frequency := FieldByName('Sonar_Frequency').AsSingle;
          Sea_0_Effect := FieldByName('Sea_0_Effect').AsSingle;
          Sea_1_Effect := FieldByName('Sea_1_Effect').AsSingle;
          Sea_2_Effect := FieldByName('Sea_2_Effect').AsSingle;
          Sea_3_Effect := FieldByName('Sea_3_Effect').AsSingle;
          Sea_4_Effect := FieldByName('Sea_4_Effect').AsSingle;
          Sea_5_Effect := FieldByName('Sea_5_Effect').AsSingle;
          Sea_6_Effect := FieldByName('Sea_6_Effect').AsSingle;
          Sea_7_Effect := FieldByName('Sea_7_Effect').AsSingle;
          Sea_8_Effect := FieldByName('Sea_8_Effect').AsSingle;
          Sea_9_Effect := FieldByName('Sea_9_Effect').AsSingle;
        end;

        Next;
      end;

      //Next;    sementara
      //Inc(i);
    end;
  end;
end;

function TdmTTT.GetRainfallOnSonar(var rain: TRainRateNoiseSonarArray): boolean;
var
  i: Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Rainfall_On_Sonar order by Sonar_Frequency ');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      SetLength(rain, RecordCount);

      for I := 0 to RecordCount - 1 do
      begin
        with rain[i] do
        begin
          Sonar_Frequency := FieldByName('Sonar_Frequency').AsSingle;
          Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
          Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
          Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
          Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
          Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
          Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
          Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
        end;

        Next;
      end;

      //Next;    sementara
      //Inc(i);
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateSeaStateOnSonar(rec: TSea_State_On_Sonar;
  id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Sea_State_On_Sonar  ');
      SQL.Add('SET ');
      SQL.Add('Sea_0_Effect = ' + FloatToStr(Sea_0_Effect) + ',');
      SQL.Add('Sea_1_Effect = ' + FloatToStr(Sea_1_Effect) + ',');
      SQL.Add('Sea_2_Effect = ' + FloatToStr(Sea_2_Effect) + ',');
      SQL.Add('Sea_3_Effect = ' + FloatToStr(Sea_3_Effect) + ',');
      SQL.Add('Sea_4_Effect = ' + FloatToStr(Sea_4_Effect) + ',');
      SQL.Add('Sea_5_Effect = ' + FloatToStr(Sea_5_Effect) + ',');
      SQL.Add('Sea_6_Effect = ' + FloatToStr(Sea_6_Effect) + ',');
      SQL.Add('Sea_7_Effect = ' + FloatToStr(Sea_7_Effect) + ',');
      SQL.Add('Sea_8_Effect = ' + FloatToStr(Sea_8_Effect) + ',');
      SQL.Add('Sea_9_Effect = ' + FloatToStr(Sea_9_Effect));
    end;

    SQL.Add('WHERE (Sonar_Frequency = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertSeaStateOnSonar(rec: TSea_State_On_Sonar): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Sea_State_On_Sonar] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Sea_State_On_Sonar ');
      SQL.Add(
        '(Sonar_Frequency,Sea_0_Effect,Sea_1_Effect,Sea_2_Effect,Sea_3_Effect,Sea_4_Effect,');
      SQL.Add(
        'Sea_5_Effect,Sea_6_Effect,Sea_7_Effect,Sea_8_Effect,Sea_9_Effect)');
      SQL.Add(' VALUES (');
      SQL.Add(FloatToStr(Sonar_Frequency) + ',');
      SQL.Add(FloatToStr(Sea_0_Effect) + ',');
      SQL.Add(FloatToStr(Sea_1_Effect) + ',');
      SQL.Add(FloatToStr(Sea_2_Effect) + ',');
      SQL.Add(FloatToStr(Sea_3_Effect) + ',');
      SQL.Add(FloatToStr(Sea_4_Effect) + ',');
      SQL.Add(FloatToStr(Sea_5_Effect) + ',');
      SQL.Add(FloatToStr(Sea_6_Effect) + ',');
      SQL.Add(FloatToStr(Sea_7_Effect) + ',');
      SQL.Add(FloatToStr(Sea_8_Effect) + ',');
      SQL.Add(FloatToStr(Sea_9_Effect) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetShipNoiseOnSonar(var ship: TShipNoiseOnSonarArray): boolean;
var
  i: Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Ship_On_Sonar order by Sonar_Frequency ');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      SetLength(ship, RecordCount);

      for I := 0 to RecordCount - 1 do
      begin
        with ship[i] do
        begin
          Sonar_Frequency := FieldByName('Sonar_Frequency').AsSingle;
          Distant_Ship_Effect := FieldByName('Distant_Ship_Effect').AsSingle;
          Light_Ship_Effect := FieldByName('Light_Ship_Effect').AsSingle;
          Medium_Ship_Effect := FieldByName('Medium_Ship_Effect').AsSingle;
          Heavy_Ship_Effect := FieldByName('Heavy_Ship_Effect').AsSingle;
        end;

        Next;
      end;

      //Next;       sementara
      //Inc(i);
    end;
  end;
end;

// ------------------------------------------------------------------------------

procedure TdmTTT.updateShipNoiseOnSonar(rec: TShip_Noise_On_Sonar;
  id: string);
begin
  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Ship_Noise_On_Sonar  ');
      SQL.Add('SET ');
      SQL.Add('Distant_Ship_Effect = ' + FloatToStr(Distant_Ship_Effect) + ',');
      SQL.Add('Light_Ship_Effect = ' + FloatToStr(Light_Ship_Effect) + ',');
      SQL.Add('Medium_Ship_Effect = ' + FloatToStr(Medium_Ship_Effect) + ',');
      SQL.Add('Heavy_Ship_Effect = ' + FloatToStr(Heavy_Ship_Effect));
    end;

    SQL.Add('WHERE (Sonar_Frequency = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertShipNoiseOnSonar(rec: TShip_Noise_On_Sonar): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Ship_Noise_On_Sonar] ON;');
      ExecSQL;

      SQL.Clear;
      SQL.Add('INSERT INTO Ship_Noise_On_Sonar ');
      SQL.Add(
        '(Sonar_Frequency,Distant_Ship_Effect,Light_Ship_Effect,Medium_Ship_Effect,Heavy_Ship_Effect)');
      SQL.Add(' VALUES (');
      SQL.Add(FloatToStr(Sonar_Frequency) + ',');
      SQL.Add(FloatToStr(Distant_Ship_Effect) + ',');
      SQL.Add(FloatToStr(Light_Ship_Effect) + ',');
      SQL.Add(FloatToStr(Medium_Ship_Effect) + ',');
      SQL.Add(FloatToStr(Heavy_Ship_Effect) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetOperatingMode(var operate: TString): boolean;
var
  i: Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Operating_Mode ');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      SetLength(operate, RecordCount);
      i := 0;
      while not ZQ2.Eof do
      begin
        operate[i] := FieldByName('Operating_Mode_Name').AsString;
        Inc(i);
        Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetKompi(const id: Integer; var pList: TList): Boolean;
var
  rec: TPersonel;
begin
  result := False;
  if not ZConn.Connected then
    Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT b2.BataLyon_Index, b2.Batalyon_Identifier , ');
    SQL.Add('c3.Kompi_Index, c3.Kompi_Identifier ');
    SQL.Add('FROM Personel_Brigade a1 JOIN Personel_Batalyon b2 ON ');
    SQL.Add('a1.Brigade_Index = b2.Brigade_Index JOIN ');
    SQL.Add('Personel_Kompi c3 ON b2.Batalyon_Index = c3.Batalyon_Index ');
    SQL.Add('WHERE b2.BataLyon_Index = ' + IntToStr(id));

    Open;
    Result := RecordCount > 0;
    if not Assigned(pList) then
      pList := TList.Create
    else
      pList.Clear;

    if not IsEmpty then
    begin
      First;
      while not ZQ.Eof do
      begin
        rec := TPersonel.Create;
        TBatalyon(rec).Id := FieldByName('Batalyon_Index').AsInteger;
        TBatalyon(rec).Identifier := FieldByName('Batalyon_Identifier').AsString;
        TKompi(rec).Id := FieldByName('Kompi_Index').AsInteger;
        TKompi(rec).Identifier := FieldByName('Kompi_Identifier').AsString;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

function TdmTTT.GetLinkDefinition(const id: Integer; var aRec: TList): Integer;
var
  linkDef: TLink;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Link_Definition ');
    SQL.Add('WHERE Deployment_Index = ' + IntToStr(id));
    Open;

    result := RecordCount;

    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        linkDef := TLink.Create;

        with linkDef.FLink_Def do
        begin
          Link_Index := FieldByName('Link_Index').AsInteger;
          Link_Identifier_Num := FieldByName('Link_Identifier_Num').AsInteger;
          Link_Force := FieldByName('Link_Force').AsInteger;
          Link_Controller := FieldByName('Link_Controller').AsInteger;
          Deployment_Index := FieldByName('Deployment_Index').AsInteger;
          Trans_Mode := FieldByName('Trans_Mode').AsInteger;
          Link_Identifier := FieldByName('Link_Identifier').AsString;
        end;

        aRec.Add(linkDef);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetLinkParticipant(lPart: TLink; pfList: TList): Integer;
var
  i, pi_Index: Integer;
  pi: TPlatform_Instance;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Link_Participant a JOIN Platform_Instance b ');
    SQL.Add('ON a.Participating_Unit = b.Platform_Instance_Index ');
    SQL.Add('WHERE (a.Link_Index = ' + IntToStr(lPart.FLink_Def.Link_Index)
        + ')');
    Open;

    // where Link_index lPart.FLink_Def.Link_Index;
    while not ZQ.Eof do
    begin
      pi_Index := ZQ.FieldByName('Platform_Instance_Index').AsInteger;

      for i := 0 to pfList.Count - 1 do
      begin
        pi := pfList[i];
        if pi.FData.Platform_Instance_Index = pi_Index then
          lPart.Participant.Add(pi);
      end;

      ZQ.Next;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateLink_Def(rec: TLink; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FLink_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Link_Definition ');
      SQL.Add('SET ');
      SQL.Add('Link_Identifier=''' + Link_Identifier + ''',');
      SQL.Add('Link_Identifier_Num=' + IntToStr(Link_Identifier_Num) + ',');
      SQL.Add('Link_Force=' + IntToStr(Link_Force) + ',');
      SQL.Add('Link_Controller=' + IntToStr(Link_Controller) + ',');
      SQL.Add('Deployment_Index=' + IntToStr(Deployment_Index) + ',');
      SQL.Add('Trans_Mode=' + IntToStr(Trans_Mode));
    end;

    SQL.Add(' WHERE (Link_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertLink_Def(rec: TLink): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FLink_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Link_Definition] ON;');
      ExecSQL;

      SQL.Clear;
      SQL.Add('INSERT INTO Link_Definition ');
      SQL.Add(
        '(Link_Index,Link_Identifier,Link_Identifier_Num,Link_Force,Link_Controller,Deployment_Index,Trans_Mode)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Link_Index) + ',');
      SQL.Add('''' + Link_Identifier + ''',');
      SQL.Add(IntToStr(Link_Identifier_Num) + ',');
      SQL.Add(IntToStr(Link_Force) + ',');
      SQL.Add(IntToStr(Link_Controller) + ',');
      SQL.Add(IntToStr(Deployment_Index) + ',');
      SQL.Add(IntToStr(Trans_Mode) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateLink_Part(rec: TLink; link_id: string;
  deploy_id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FLink_Part do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Link_Participant ');
      SQL.Add('SET ');
      SQL.Add('Participating_Unit =' + IntToStr(Participating_Unit) + ',');
      SQL.Add('Deployment_Index =' + IntToStr(Deployment_Index) + ',');
      SQL.Add('PU_Octal_Code =' + IntToStr(PU_Octal_Code));
    end;

    SQL.Add(' WHERE Link_Index = ' + link_id + ' AND ');
    SQL.Add('Deployment_Index=' + deploy_id);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertLink_Part(rec: TLink): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FLink_Part do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Link_Participant] ON;');
      ExecSQL;

      SQL.Clear;
      SQL.Add('INSERT INTO Link_Participant ');
      SQL.Add('(Link_Index,Participating_Unit,Deployment_Index,PU_Octal_Code)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Link_Index) + ',');
      SQL.Add(IntToStr(Participating_Unit) + ',');
      SQL.Add(IntToStr(Deployment_Index) + ',');
      SQL.Add(IntToStr(PU_Octal_Code) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteLink_Part(link_id: string; deploy_id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Link_Participant ');
    SQL.Add('WHERE Link_Index = ' + link_id + ' AND ');
    SQL.Add('Deployment_Index=' + deploy_id);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetFormationDefinition(const id: Integer;
  var aRec: TList): Integer;
var
  formationDef: TFormation;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Formation_Definition ');
    SQL.Add('WHERE Deployment_Index = ' + IntToStr(id));
    Open;

    result := RecordCount;

    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        formationDef := TFormation.Create;

        with formationDef.FFormation_Def do
        begin
          Formation_Index := FieldByName('Formation_Index').AsInteger;
          Formation_Identifier := FieldByName('Formation_Identifier').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
          Formation_Leader := FieldByName('Formation_Leader').AsInteger;
          Angle_Type := FieldByName('Angle_Type').AsInteger;
          Deployment_Index := FieldByName('Deployment_Index').AsInteger;
        end;

        aRec.Add(formationDef);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetFormation(const id: Integer;var pfList: TFormationManager): Integer;
var
  fm : TFormationRefine;
  fa : TClassFormation_Assignment;
  I : integer;
begin

  result := -1;

  if not ZConn.Connected then
    exit;

  { list of formation name and leader }
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Formation_Definition ');
    SQL.Add('WHERE Deployment_Index = ' + IntToStr(id));
    Open;

    result := RecordCount;

    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(pfList) then
        pfList := TFormationManager.Create
      else
        pfList.Clear;

      while not ZQ.Eof do
      begin
        fm := TFormationRefine.Create;

        with fm.FFormation_Def do
        begin
          Formation_Index := FieldByName('Formation_Index').AsInteger;
          Formation_Identifier := FieldByName('Formation_Identifier').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
          Formation_Leader := FieldByName('Formation_Leader').AsInteger;
          Angle_Type := FieldByName('Angle_Type').AsInteger;
          Deployment_Index := FieldByName('Deployment_Index').AsInteger;
        end;

        pfList.AddFormation(fm);
        ZQ.Next;
      end;
    end;
  end;

  if pfList.Count > 0 then
  begin

    { add follower to list }
    for I := 0 to pfList.Count - 1 do
    begin
      fm := pfList.get(I);

      with ZQ do
      begin
        Close;
        SQL.Clear;

        SQL.Add('SELECT a.* ');
        SQL.Add('FROM Formation_Assignment a JOIN Formation_Definition b ');
        SQL.Add('ON a.Formation_Index = b.Formation_Index');
        SQL.Add('WHERE b.Formation_Index = ' + IntToStr(fm.FFormation_Def.Formation_Index));
        Open;

        result := RecordCount;

        if not ZQ.IsEmpty then
        begin
          ZQ.First;

          while not ZQ.Eof do
          begin
            fa := TClassFormation_Assignment.Create;

            with fa do
            begin
              Formation_Index := FieldByName('Formation_Index').AsInteger;
              Platform_Instance_Index := FieldByName('Platform_Instance_Index')
                .AsInteger;
              Angle_Offset := FieldByName('Angle_Offset').AsInteger;
              Range_from_Leader := FieldByName('Range_from_Leader').AsSingle;
              Altitude := FieldByName('Altitude').AsInteger;
            end;

            fm.AddMember(fa);
            ZQ.Next;
          end;
        end;
      end;

    end;

  end;

end;

function TdmTTT.GetFormationAssignment(var fAssign: TFormation;
  var pfList: TList): Integer;
var
  //pi_Index: Integer;
  fm : TFormation;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Formation_Assignment a JOIN Platform_Instance b ');
    SQL.Add('ON a.Platform_Instance_Index = b.Platform_Instance_Index ');
    SQL.Add('LEFT JOIN Formation_Definition c ');
    SQL.Add('ON a.Formation_Index = c.Formation_Index ');
    SQL.Add('WHERE (a.Formation_Index = ' + IntToStr
        (fAssign.FFormation_Def.Formation_Index) + ')');
    Open;

    // where Link_index lPart.FLink_Def.Link_Index;
    if not ZQ.IsEmpty then
    begin
      //      if not Assigned(pfList) then
      //        pfList := TList.Create
      //      else
      //        pfList.Clear;

      while not ZQ.Eof do
      begin
        fm := TFormation.Create;
        //pi_Index := ZQ.FieldByName('Platform_Instance_Index').AsInteger;
        // ambil datanya

        with fm.FFormation_Def do
        begin
          Formation_Index := FieldByName('Formation_Index').AsInteger;
          Formation_Identifier := FieldByName('Formation_Identifier').AsString;
          Force_Designation := FieldByName('Force_Designation').AsInteger;
          Formation_Leader := FieldByName('Formation_Leader').AsInteger;
          Angle_Type := FieldByName('Angle_Type').AsInteger;
          Deployment_Index := FieldByName('Deployment_Index').AsInteger;
        end;

        with fm.FForm_Assign do
        begin
          Formation_Index := FieldByName('Formation_Index').AsInteger;
          Platform_Instance_Index := FieldByName('Platform_Instance_Index')
            .AsInteger;
          Angle_Offset := FieldByName('Angle_Offset').AsInteger;
          Range_from_Leader := FieldByName('Range_from_Leader').AsSingle;
          Altitude := FieldByName('Altitude').AsInteger;
        end;

        pfList.Add(fm);
        {
          for i := 0 to pfList.Count - 1 do
          begin
          pi := pfList[i];
          if pi.FData.Platform_Instance_Index = pi_Index then
          fAssign.Assignment.Add(pi);
          end;
          }
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateFormation_Def(rec: TFormation; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FFormation_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Formation_Definition ');
      SQL.Add('SET ');
      SQL.Add('Formation_Identifier =''' + Formation_Identifier + ''',');
      // SQL.Add('Formation_Index ='+ IntToStr(Formation_Index)+',' );
      SQL.Add('Force_Designation =' + IntToStr(Force_Designation) + ',');
      SQL.Add('Formation_Leader =' + IntToStr(Formation_Leader) + ',');
      SQL.Add('Angle_Type=' + IntToStr(Angle_Type));

      SQL.Add(' WHERE (Deployment_Index = ' + id + 'AND Formation_Index = ' +
          IntToStr(Formation_Index) + ')');
    end;

    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertFormation_Def(rec: TFormation): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FFormation_Def do
    begin
      Close;
      SQL.Clear;
      SQL.Add
        ('SET IDENTITY_INSERT Runtime_DB.[dbo].[Formation_Definition] ON;');
      ExecSQL;

      SQL.Clear;
      SQL.Add('INSERT INTO Formation_Definition ');
      SQL.Add(
        '(Deployment_Index,Formation_Index,Formation_Identifier,Force_Designation,Formation_Leader,Angle_Type)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Deployment_Index) + ',');
      SQL.Add(IntToStr(Formation_Index) + ',');
      SQL.Add('''' + Formation_Identifier + ''',');
      SQL.Add(IntToStr(Force_Designation) + ',');
      SQL.Add(IntToStr(Formation_Leader) + ',');
      SQL.Add(IntToStr(Angle_Type) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateFormation_Assign(rec: TFormation; form_id: string;
  pi_id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FForm_Assign do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Formation_Assignment ');
      SQL.Add('SET ');
      SQL.Add('Angle_Offset =' + FloatToStr(Angle_Offset) + ',');
      SQL.Add('Range_from_Leader =' + FloatToStr(Range_from_Leader) + ',');
      SQL.Add('Altitude =' + FloatToStr(Altitude));
    end;

    SQL.Add(' WHERE Formation_Index = ' + form_id + ' AND ');
    SQL.Add('Platform_Instance_Index = ' + pi_id);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertFormation_Assign(rec: TFormation): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FForm_Assign do
    begin
      Close;
      SQL.Clear;
      { SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Formation_Assignment] ON;');
        ExecSQL;
        SQL.Clear; }
      SQL.Add('INSERT INTO Formation_Assignment ');
      SQL.Add(
        '(Platform_Instance_Index,Formation_Index,Angle_Offset,Range_from_Leader,Altitude)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Platform_Instance_Index) + ',');
      SQL.Add(IntToStr(Formation_Index) + ',');
      SQL.Add(FloatToStr(Angle_Offset) + ',');
      SQL.Add(FloatToStr(Range_from_Leader) + ',');
      SQL.Add(FloatToStr(Altitude) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteFormation_Assign(form_id: string; pi_id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Formation_Assignment ');
    SQL.Add('WHERE Formation_Index = ' + form_id + ' AND ');
    SQL.Add('Platform_Instance_Index = ' + pi_id);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetAssetDeployment(const id: Integer;
  var asset: TAsset_Deployment): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Asset_Deployment_Definition a JOIN Scenario_Definition b ');
    SQL.Add('ON a.Scenario_Index = b.Scenario_Index ');
    SQL.Add('WHERE (a.Scenario_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      with asset.FData do
      begin
        Deployment_Index := FieldByName('Deployment_Index').AsInteger;
        Deployment_Identifier := FieldByName('Deployment_Identifier').AsString;
        Scenario_Index := FieldByName('Scenario_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetDefaultDefinition(var def: TDefaultDef): boolean;
var
  i: Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Default_Definition ');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      SetLength(def, RecordCount);
      i := 0;
      with def[i] do
      begin
        Init_AOP := FieldByName('Init_AOP').AsInteger;
        AOP_Decrease_Rate := FieldByName('AOP_Decrease_Rate').AsSingle;
        Sono_Num_2_Initiate := FieldByName('Sono_Num_2_Initiate').AsInteger;
        Trans_Range_2_Air := FieldByName('Trans_Range_2_Air').AsSingle;
        Trans_Range_2_Sur := FieldByName('Trans_Range_2_Sur').AsSingle;
        Init_AOP_Modifier := FieldByName('Init_AOP_Modifier').AsSingle;
        Visual_Detect_Range := FieldByName('Visual_Detect_Range').AsSingle;
        Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
        Max_Visual_Range := FieldByName('Max_Visual_Range').AsSingle;
        EO_Detection_Factor := FieldByName('EO_Detection_Factor').AsSingle;
        Visual_Detection_Factor := FieldByName('Visual_Detection_Factor')
          .AsSingle;
        EO_Ident_Factor := FieldByName('EO_Ident_Factor').AsSingle;
        Visual_Ident_Factor := FieldByName('Visual_Ident_Factor').AsSingle;
        Sine_Period_Distance := FieldByName('Sine_Period_Distance').AsSingle;
        Sine_Period_Amplitude := FieldByName('Sine_Period_Amplitude').AsSingle;
        Short_Period_Distance := FieldByName('Short_Period_Distance').AsSingle;
        Short_Period_Amplitude := FieldByName('Short_Period_Amplitude')
          .AsSingle;
        Long_Period_Distance := FieldByName('Long_Period_Distance').AsSingle;
        Long_Period_Amplitude := FieldByName('Long_Period_Amplitude').AsSingle;
        Very_Period_Distance := FieldByName('Very_Period_Distance').AsSingle;
        Very_Period_Amplitude := FieldByName('Very_Period_Amplitude').AsSingle;
        Air_Lost_Time := FieldByName('Air_Lost_Time').AsInteger;
        Sur_Lost_Time := FieldByName('Sur_Lost_Time').AsInteger;
        Sub_Lost_Time := FieldByName('Sub_Lost_Time').AsInteger;
        ESM_Bearing_Lost_Time := FieldByName('ESM_Bearing_Lost_Time').AsInteger;
        Sonar_Bearing_Lost_Time := FieldByName('Sonar_Bearing_Lost_Time')
          .AsInteger;
        Stale_Air_Time := FieldByName('Stale_Air_Time').AsInteger;
        Stale_Sur_Time := FieldByName('Stale_Sur_Time').AsInteger;
        Stale_Sub_Time := FieldByName('Stale_Sub_Time').AsInteger;
        Stale_ESM_Bearing_Time := FieldByName('Stale_ESM_Bearing_Time')
          .AsInteger;
        Stale_Sonar_Bearing_Time := FieldByName('Stale_Sonar_Bearing_Time')
          .AsInteger;
        POD_Check_Time := FieldByName('POD_Check_Time').AsInteger;
        TMA_Range_Rate := FieldByName('TMA_Range_Rate').AsSingle;
        Frequency_Identity_Weighting := FieldByName
          ('Frequency_Identity_Weighting').AsSingle;
        PRF_Identity_Weighting := FieldByName('PRF_Identity_Weighting')
          .AsSingle;
        Pulsewidth_Identity_Weighting := FieldByName
          ('Pulsewidth_Identity_Weighting').AsSingle;
        Scan_Period_Identity_Weighting := FieldByName
          ('Scan_Period_Identity_Weighting').AsSingle;
        Crew_Eff_Heading_Error := FieldByName('Crew_Eff_Heading_Error')
          .AsSingle;
        Crew_Eff_Speed_Error := FieldByName('Crew_Eff_Speed_Error').AsSingle;
        TMA_Relative_Bearing_Rate := FieldByName('TMA_Relative_Bearing_Rate')
          .AsSingle;
        Passive_Sonar_Max_Course_Error := FieldByName
          ('Passive_Sonar_Max_Course_Error').AsSingle;
        Passive_Sonar_Max_Speed_Error := FieldByName
          ('Passive_Sonar_Max_Speed_Error').AsSingle;
        ESM_Error_Corr_Rate := FieldByName('ESM_Error_Corr_Rate').AsSingle;
        Chaff_Altitude_Threshold := FieldByName('Chaff_Altitude_Threshold')
          .AsSingle;
        MHS_Flash_Delay_Time := FieldByName('MHS_Flash_Delay_Time').AsSingle;
        MHS_Immed_Delay_Time := FieldByName('MHS_Immed_Delay_Time').AsSingle;
        MHS_Priority_Delay_Time := FieldByName('MHS_Priority_Delay_Time')
          .AsSingle;
        MHS_Routine_Delay_Time := FieldByName('MHS_Routine_Delay_Time')
          .AsSingle;
        Max_UWT_Range := FieldByName('Max_UWT_Range').AsSingle;
        Max_HF_Detect_Range := FieldByName('Max_HF_Detect_Range').AsSingle;
        Max_UHF_Detect_Range := FieldByName('Max_UHF_Detect_Range').AsSingle;
        Max_IFF_Range := FieldByName('Max_IFF_Range').AsSingle;
        Track_History_Air_Sample_Rate := FieldByName
          ('Track_History_Air_Sample_Rate').AsInteger;
        Track_History_Air_Max_Points := FieldByName
          ('Track_History_Air_Max_Points').AsInteger;
        Track_History_Sample_Rate := FieldByName('Track_History_Sample_Rate')
          .AsInteger;
        Track_History_Max_Points := FieldByName('Track_History_Max_Points')
          .AsInteger;
        Auto_Gun_Interception_Range := FieldByName
          ('Auto_Gun_Interception_Range').AsSingle;
        Auto_Gun_Threshold_Speed := FieldByName('Auto_Gun_Threshold_Speed')
          .AsSingle;
        Clutter_Reduction_Scale := FieldByName('Clutter_Reduction_Scale')
          .AsSingle;
        Jam_Break_Lock_Time_Interval := FieldByName
          ('Jam_Break_Lock_Time_Interval').AsInteger;
        Missile_Reacquisition_Time := FieldByName('Missile_Reacquisition_Time')
          .AsInteger;
        Seduction_Bloom_Altitude := FieldByName('Seduction_Bloom_Altitude')
          .AsInteger;
        Seduction_Bloom_Range := FieldByName('Seduction_Bloom_Range').AsSingle;
        HF_Datalink_MHS_Trans_Freq := FieldByName('HF_Datalink_MHS_Trans_Freq')
          .AsSingle;
        UHF_Datalink_MHS_Trans_Freq := FieldByName
          ('UHF_Datalink_MHS_Trans_Freq').AsSingle;
        Max_Num_Radar_Classes := FieldByName('Max_Num_Radar_Classes').AsInteger;
        Max_Num_Sonar_Classes := FieldByName('Max_Num_Sonar_Classes').AsInteger;
        Max_Num_Sonobuoy_Classes := FieldByName('Max_Num_Sonobuoy_Classes')
          .AsInteger;
        Max_Num_EO_Classes := FieldByName('Max_Num_EO_Classes').AsInteger;
        Max_Num_ESM_Classes := FieldByName('Max_Num_ESM_Classes').AsInteger;
        Max_Num_MAD_Classes := FieldByName('Max_Num_MAD_Classes').AsInteger;
        Max_Num_Fitted_Weap_Classes := FieldByName
          ('Max_Num_Fitted_Weap_Classes')
          .AsInteger;
        Max_Num_Point_Effect_Classes := FieldByName
          ('Max_Num_Point_Effect_Classes').AsInteger;
        HAFO_Min_Range := FieldByName('HAFO_Min_Range').AsSingle;
        HAFO_Max_Range := FieldByName('HAFO_Max_Range').AsSingle;
        Engage_Guide_Stale_Target_Time := FieldByName
          ('Engage_Guide_Stale_Target_Time').AsInteger;
        Outrun_Guide_Stale_Target_Time := FieldByName
          ('Outrun_Guide_Stale_Target_Time').AsInteger;
        Shadow_Guide_Stale_Target_Time := FieldByName
          ('Shadow_Guide_Stale_Target_Time').AsInteger;
        Sonobuoy_Air_Deceleration := FieldByName('Sonobuoy_Air_Deceleration')
          .AsSingle;
        Sonobuoy_Air_Descent_Rate := FieldByName('Sonobuoy_Air_Descent_Rate')
          .AsSingle;
        Depth_Charge_Air_Deceleration := FieldByName
          ('Depth_Charge_Air_Deceleration').AsSingle;
        Depth_Charge_Air_Descent_Rate := FieldByName
          ('Depth_Charge_Air_Descent_Rate').AsSingle;
        Missile_Sea_Check_Interval := FieldByName('Missile_Sea_Check_Interval')
          .AsInteger;
      end;

      //Next;
      //Inc(i);
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetDefaultIFFMode(var iff: TIFFMode): boolean;
var
  i: Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Default_IFF_Mode_Code ');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      SetLength(iff, RecordCount);
      i := 0;
      with iff[i] do
      begin
        Force_Designation := FieldByName('Force_Designation').AsInteger;
        IFF_Device_Type := FieldByName('IFF_Device_Type').AsInteger;
        IFF_Mode := FieldByName('IFF_Mode').AsInteger;
        IFF_Code := FieldByName('IFF_Code').AsInteger;
        Mode_State := FieldByName('Mode_State').AsInteger;
      end;

      //Next;
      //Inc(i);
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetGeoAreaDefinition(const id: Integer;
  var aRec: TList): Integer;
var
  geoDef: TGeo_Area_Def;
  geoPoint: TGeo_Area_Point;
  condEvent: TConditional_Event;
  i, J: Integer;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Geo_Area_Definition ');
    SQL.Add('WHERE Game_Area_Index = ' + IntToStr(id));
    Open;

    result := RecordCount;
    if not ZQ.IsEmpty then
    begin
      ZQ.First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        geoDef := TGeo_Area_Def.Create;

        with geoDef.FData do
        begin
          Geo_Area_Index := FieldByName('Geo_Area_Index').AsInteger;
          Geo_Area_Identifier := FieldByName('Geo_Area_Identifier').AsString;
          Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
        end;

        aRec.Add(geoDef);
        ZQ.Next;
      end;

      for i := 0 to aRec.Count - 1 do
      begin
        geoDef := aRec.Items[i];
        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Geo_Area_Point ');
        SQL.Add('WHERE Geo_Area_Index =' + IntToStr(geoDef.FData.Geo_Area_Index)
          );
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          geoPoint := TGeo_Area_Point.Create;

          with geoPoint.FData do
          begin
            Geo_Area_Index := FieldByName('Geo_Area_Index').AsInteger;
            Point_Number := FieldByName('Point_Number').AsInteger;
            Latitude := FieldByName('Latitude').AsFloat;
            Longitude := FieldByName('Longitude').AsFloat;
            X_Position := FieldByName('X_Position').AsSingle;
            Y_Position := FieldByName('Y_Position').AsSingle;
          end;

          geoDef.point.Add(geoPoint);
          ZQ.Next;
        end;
      end;

      for J := 0 to aRec.Count - 1 do
      begin
        geoDef := aRec.Items[J];
        Close;
        SQL.Add('SELECT * ');
        SQL.Add('FROM Conditional_Event_Definition ');
        SQL.Add('WHERE Geo_Area_Index =' + IntToStr(geoDef.FData.Geo_Area_Index)
          );
        Open;

        ZQ.First;

        while not ZQ.Eof do
        begin
          condEvent := TConditional_Event.Create;

          with condEvent.FData do
          begin
            Conditional_Event_Index := FieldByName('Conditional_Event_Index')
              .AsInteger;
            Conditional_Identifier := FieldByName('Conditional_Identifier')
              .AsString;
            Conditional_Event_Type := FieldByName('Conditional_Event_Type')
              .AsInteger;
            Response_Speed := FieldByName('Response_Speed').AsInteger;
            Response_Altitude := FieldByName('Response_Altitude').AsInteger;
            Response_Range := FieldByName('Response_Range').AsSingle;
            Cleared_2_Attack := FieldByName('Cleared_2_Attack').AsInteger;
            Check_Fuel := FieldByName('Check_Fuel').AsInteger;
            Fuel_Condition := FieldByName('Fuel_Condition').AsInteger;
            Fuel_Threshold := FieldByName('Fuel_Threshold').AsSingle;
            Check_Weapons := FieldByName('Check_Weapons').AsInteger;
            Weapons_Condition := FieldByName('Weapons_Condition').AsInteger;
            Weapons_Inventory := FieldByName('Weapons_Inventory').AsInteger;
            Check_Damage := FieldByName('Check_Damage').AsInteger;
            Damage_Condition := FieldByName('Damage_Condition').AsInteger;
            Current_Damage_State := FieldByName('Current_Damage_State')
              .AsSingle;
            Hit_By_Weapon := FieldByName('Hit_By_Weapon').AsInteger;
            Lock_By_FCR_or_Weap := FieldByName('Lock_By_FCR_or_Weap').AsInteger;
            Check_Target_Domain := FieldByName('Check_Target_Domain').AsInteger;
            Target_Plat_Domain := FieldByName('Target_Plat_Domain').AsInteger;
            Check_Target_Type := FieldByName('Check_Target_Type').AsInteger;
            Target_Plat_Type := FieldByName('Target_Plat_Type').AsInteger;
            Check_Target_Threat := FieldByName('Check_Target_Threat').AsInteger;
            Target_Plat_Threat_Class := FieldByName('Target_Plat_Threat_Class')
              .AsInteger;
            Check_Target_Duration := FieldByName('Check_Target_Duration')
              .AsInteger;
            Target_Duration_State := FieldByName('Target_Duration_State')
              .AsInteger;
            Target_Range_Duration := FieldByName('Target_Range_Duration')
              .AsInteger;
            Check_Target_Range := FieldByName('Check_Target_Range').AsInteger;
            Target_Range_Condition := FieldByName('Target_Range_Condition')
              .AsInteger;
            Target_Plat_Range := FieldByName('Target_Plat_Range').AsSingle;
            Check_Target_Delta := FieldByName('Check_Target_Delta').AsInteger;
            Target_Delta_Condition := FieldByName('Target_Delta_Condition')
              .AsInteger;
            Target_Plat_Altitude_Delta := FieldByName
              ('Target_Plat_Altitude_Delta').AsSingle;
            Check_Target_Altitude := FieldByName('Check_Target_Altitude')
              .AsInteger;
            Target_Altitude_Condition := FieldByName
              ('Target_Altitude_Condition')
              .AsInteger;
            Target_Platform_Altitude := FieldByName('Target_Platform_Altitude')
              .AsSingle;
            Check_Target_Speed := FieldByName('Check_Target_Speed').AsInteger;
            Target_Speed_Condition := FieldByName('Target_Speed_Condition')
              .AsInteger;
            Target_Platform_Speed := FieldByName('Target_Platform_Speed')
              .AsSingle;
            Check_Own_Position := FieldByName('Check_Own_Position').AsInteger;
            Own_In_Geo := FieldByName('Own_In_Geo').AsInteger;
            Check_Encountered_Position := FieldByName
              ('Check_Encountered_Position').AsInteger;
            Encountered_In_Geo := FieldByName('Encountered_In_Geo').AsInteger;
            Geo_Area_Index := FieldByName('Geo_Area_Index').AsInteger;
          end;

          geoDef.Event.Add(condEvent);
          ZQ.Next;
        end;
      end;
    end;
  end;
end;

function TdmTTT.GetGroup(const id: Integer; var pList: TList): Boolean;
var
  rec: TPersonel;
begin
  result := False;
  if not ZConn.Connected then
    Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT d4.Pleton_Index, d4.Pleton_Identifier , ');
    SQL.Add('e5.Regu_Index, e5.Regu_Identifier, e5.Quantity ');
    SQL.Add('FROM Personel_Brigade a1 JOIN Personel_Batalyon b2 ON ');
    SQL.Add('a1.brigade_index = b2.brigade_index JOIN personel_kompi c3 ON ');
    SQL.Add('b2.batalyon_index = c3.batalyon_index JOIN personel_pleton d4 ON ');
    SQL.Add('c3.kompi_index = d4.kompi_index JOIN Personel_Regu e5 ON ');
    SQL.Add('d4.Pleton_Index = e5.Pleton_Index ');
    SQL.Add('WHERE d4.Pleton_Index = ' + IntToStr(id));

    Open;
    Result := RecordCount > 0;
    if not Assigned(pList) then
      pList := TList.Create
    else
      pList.Clear;

    if not IsEmpty then
    begin
      First;
      while not ZQ.Eof do
      begin
        rec := TPersonel.Create;
        TPlatoon(rec).Id := FieldByName('Pleton_Index').AsInteger;
        TPlatoon(rec).Identifier := FieldByName('Pleton_Identifier').AsString;
        TGroup(rec).Id := FieldByName('Regu_Index').AsInteger;
        TGroup(rec).Identifier := FieldByName('Regu_Identifier').AsString;
        TGroup(rec).quantity := FieldByName('Quantity').AsInteger;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.updateGeo_Area_Def(rec: TGeo_Area_Def; id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Geo_Area_Definition ');
      SQL.Add('SET ');
      SQL.Add('Geo_Area_Identifier =''' + Geo_Area_Identifier + ''',');
      SQL.Add('Game_Area_Index =' + IntToStr(Game_Area_Index));
    end;

    SQL.Add(' WHERE (Geo_Area_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertGeo_Area_Def(rec: TGeo_Area_Def): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Geo_Area_Definition] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Geo_Area_Definition ');
      SQL.Add('(Geo_Area_Index,Geo_Area_Identifier,Game_Area_Index)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Geo_Area_Index) + ',');
      SQL.Add('''' + Geo_Area_Identifier + ''',');
      SQL.Add(IntToStr(Game_Area_Index) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateGeo_Area_Point(rec: TGeo_Area_Point; id: string;
  point: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Geo_Area_Point ');
      SQL.Add('SET ');
      SQL.Add('Latitude =' + FloatToStr(Latitude) + ',');
      SQL.Add('Longitude =' + FloatToStr(Longitude) + ',');
      SQL.Add('X_Position =' + FloatToStr(X_Position) + ',');
      SQL.Add('Y_Position =' + FloatToStr(Y_Position));
    end;

    SQL.Add(' WHERE Geo_Area_Index = ' + id + ' AND ');
    SQL.Add('Point_Number = ' + point);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertGeo_Area_Point(rec: TGeo_Area_Point): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Geo_Area_Point] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Geo_Area_Point');
      SQL.Add(
        '(Geo_Area_Index,Point_Number,Latitude,Longitude,X_Position,Y_Position)'
        );
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Geo_Area_Index) + ',');
      SQL.Add(IntToStr(Point_Number) + ',');
      SQL.Add(FloatToStr(Latitude) + ',');
      SQL.Add(FloatToStr(Longitude) + ',');
      SQL.Add(FloatToStr(X_Position) + ',');
      SQL.Add(FloatToStr(Y_Position) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateResourceGeo_Area_Map(rec: TResource_Geo_Area_Map;
  geo_id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Resource_Geo_Area_Mapping ');
      SQL.Add('SET ');
      SQL.Add('Resource_Alloc_Index = ' + IntToStr(Resource_Alloc_Index) + ',');
      SQL.Add('Geo_Area_Index =' + IntToStr(Geo_Area_Index) + ',');
      SQL.Add('Force_Designation =' + IntToStr(Force_Designation));
    end;

    SQL.Add(' WHERE Geo_Area_Instance_Index = ' + geo_id);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertResourceGeo_Area_Map(rec: TResource_Geo_Area_Map)
  : Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Resource_Geo_Area_Mapping');
      SQL.Add('(Resource_Alloc_Index,Geo_Area_Index,Force_Designation)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
      SQL.Add(IntToStr(Geo_Area_Index) + ',');
      SQL.Add(IntToStr(Force_Designation) + ')');
      ExecSQL;
    end;
  end;
end;
// ------------------------------------------------------------------------------

function TdmTTT.insertResourceOverlay_Map(rec: TResource_Overlay_Mapping)
  : Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Resource_Overlay_Mapping');
      SQL.Add('(Resource_Alloc_Index,Overlay_Index,Force_Designation)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Resource_Alloc_Index) + ',');
      SQL.Add(IntToStr(Overlay_Index) + ',');
      SQL.Add(IntToStr(Force_Designation) + ')');
      ExecSQL;
    end;
  end;
end;
// ------------------------------------------------------------------------------

function TdmTTT.updateNote(rec: TNote_Storage; index: Integer;
  note_id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Note_Storage ');
      SQL.Add('SET ');
      SQL.Add('Note_Type = ' + IntToStr(Note_Type) + ',');
      SQL.Add('Notes =''' + Notes + ''',');
      case index of
        1:
          SQL.Add('Vehicle_Index = ' + IntToStr(index));
        2:
          SQL.Add('Missile_Index = ' + IntToStr(index));
        3:
          SQL.Add('Mine_Index = ' + IntToStr(index));
        4:
          SQL.Add('Torpedo_Index = ' + IntToStr(index));
        5:
          SQL.Add('Satellite_Index = ' + IntToStr(index));
        6:
          SQL.Add('Sonobuoy_Index = ' + IntToStr(index));
        7:
          SQL.Add('Radar_Index = ' + IntToStr(index));
        8:
          SQL.Add('FCR_Index = ' + IntToStr(index));
        9:
          SQL.Add('Sonar_Index = ' + IntToStr(index));
        10:
          SQL.Add('ESM_Index = ' + IntToStr(index));
        11:
          SQL.Add('MAD_Index = ' + IntToStr(index));
        12:
          SQL.Add('EO_Index = ' + IntToStr(index));
        13:
          SQL.Add('Gun_Index = ' + IntToStr(index));
        14:
          SQL.Add('Bomb_Index = ' + IntToStr(index));
        15:
          SQL.Add('Jammer_Index = ' + IntToStr(index));
        16:
          SQL.Add('Defensive_Jammer_Index = ' + IntToStr(index));
        17:
          SQL.Add('Towed_Decoy_Index = ' + IntToStr(index));
        18:
          SQL.Add('Floating_Decoy_Index = ' + IntToStr(index));
        19:
          SQL.Add('Chaff_Index = ' + IntToStr(index));
        20:
          SQL.Add('Decoy_Index = ' + IntToStr(index));
        21:
          SQL.Add('Air_Bubble_Index = ' + IntToStr(index));
        22:
          SQL.Add('Pattern_Index = ' + IntToStr(index));
        23:
          SQL.Add('Infrared_decoy_Index = ' + IntToStr(index));
      end;
    end;

    SQL.Add(' WHERE Note_Index = ' + note_id);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertNote(rec: TNote_Storage; index: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Note_Storage] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Note_Storage');
      SQL.Add('(Note_Index,Note_Type,Notes,');
      case index of
        1:
          SQL.Add('Vehicle_Index)');
        2:
          SQL.Add('Missile_Index)');
        3:
          SQL.Add('Mine_Index)');
        4:
          SQL.Add('Torpedo_Index)');
        5:
          SQL.Add('Satellite_Index)');
        6:
          SQL.Add('Sonobuoy_Index)');
        7:
          SQL.Add('Radar_Index)');
        8:
          SQL.Add('FCR_Index )');
        9:
          SQL.Add('Sonar_Index )');
        10:
          SQL.Add('ESM_Index )');
        11:
          SQL.Add('MAD_Index)');
        12:
          SQL.Add('EO_Index)');
        13:
          SQL.Add('Gun_Index)');
        14:
          SQL.Add('Bomb_Index)');
        15:
          SQL.Add('Jammer_Index )');
        16:
          SQL.Add('Defensive_Jammer_Index )');
        17:
          SQL.Add('Towed_Decoy_Index)');
        18:
          SQL.Add('Floating_Decoy_Index)');
        19:
          SQL.Add('Chaff_Index)');
        20:
          SQL.Add('Decoy_Index)');
        21:
          SQL.Add('Air_Bubble_Index)');
        22:
          SQL.Add('Pattern_Index)');
        23:
          SQL.Add('Infrared_decoy_Index)');
      end;

      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Note_Index) + ',');
      SQL.Add(IntToStr(Note_Type) + ',');
      SQL.Add('''' + Notes + ''',');
      case index of
        1:
          SQL.Add(IntToStr(index) + ')');
        2:
          SQL.Add(IntToStr(index) + ')');
        3:
          SQL.Add(IntToStr(index) + ')');
        4:
          SQL.Add(IntToStr(index) + ')');
        5:
          SQL.Add(IntToStr(index) + ')');
        6:
          SQL.Add(IntToStr(index) + ')');
        7:
          SQL.Add(IntToStr(index) + ')');
        8:
          SQL.Add(IntToStr(index) + ')');
        9:
          SQL.Add(IntToStr(index) + ')');
        10:
          SQL.Add(IntToStr(index) + ')');
        11:
          SQL.Add(IntToStr(index) + ')');
        12:
          SQL.Add(IntToStr(index) + ')');
        13:
          SQL.Add(IntToStr(index) + ')');
        14:
          SQL.Add(IntToStr(index) + ')');
        15:
          SQL.Add(IntToStr(index) + ')');
        16:
          SQL.Add(IntToStr(index) + ')');
        17:
          SQL.Add(IntToStr(index) + ')');
        18:
          SQL.Add(IntToStr(index) + ')');
        19:
          SQL.Add(IntToStr(index) + ')');
        20:
          SQL.Add(IntToStr(index) + ')');
        21:
          SQL.Add(IntToStr(index) + ')');
        22:
          SQL.Add(IntToStr(index) + ')');
        23:
          SQL.Add(IntToStr(index) + ')');
      end;

      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertPredifened_Pattern(rec: TPredefined_Pattern): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Predefined_Pattern] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Predefined_Pattern ');
      SQL.Add(
        '(Pattern_Index, Pattern_Indentifier, Pattern_Type, Vehicle_Index,');
      SQL.Add('Pattern_Termination, Termination_Heading)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Pattern_Index) + ',');
      SQL.Add(''' ' + Pattern_Identifier + ''',');
      SQL.Add(IntToStr(Pattern_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Pattern_Termination) + ',');
      SQL.Add(FloatToStr(Termination_Heading) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateBlind(rec: TBlind_Zone; index: Integer;
  blind_id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Blind_Zone ');
      SQL.Add('SET ');
      SQL.Add('Blind_Zone_Type = ' + IntToStr(Blind_Zone_Type) + ',');
      SQL.Add('BlindZone_Number =' + IntToStr(BlindZone_Number) + ',');
      SQL.Add('Start_Angle = ' + FloatToStr(Start_Angle) + ',');
      SQL.Add('End_Angle =' + FloatToStr(End_Angle) + ',');
      case index of
        1:
          SQL.Add('FCR_Instance_Index = ' + IntToStr(index));
        2:
          SQL.Add('ESM_Instance_Index = ' + IntToStr(index));
        3:
          SQL.Add('EO_Instance_Index = ' + IntToStr(index));
        4:
          SQL.Add('Visual_Instance_Index = ' + IntToStr(index));
        5:
          SQL.Add('Point_Effect_Index = ' + IntToStr(index));
        6:
          SQL.Add('Fitted_Weap_Index = ' + IntToStr(index));
        7:
          SQL.Add('Sonar_Instance_Index = ' + IntToStr(index));
        8:
          SQL.Add('Radar_Instance_Index = ' + IntToStr(index));
      end;
    end;

    SQL.Add(' WHERE Blind_Zone_Index = ' + blind_id);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertBlind(rec: TBlind_Zone; index: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[Blind_Zone] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Note_Storage');
      SQL.Add(
        '(Blind_Zone_Index,Blind_Zone_Type,BlindZone_Number,Start_Angle,End_Angle,');
      case index of
        1:
          SQL.Add('FCR_Instance_Index)');
        2:
          SQL.Add('ESM_Instance_Index)');
        3:
          SQL.Add('EO_Instance_Index)');
        4:
          SQL.Add('Visual_Instance_Index)');
        5:
          SQL.Add('Point_Effect_Index)');
        6:
          SQL.Add('Fitted_Weap_Index)');
        7:
          SQL.Add('Sonar_Instance_Index)');
        8:
          SQL.Add('Radar_Instance_Index)');
      end;

      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Blind_Zone_Index) + ',');
      SQL.Add(IntToStr(Blind_Zone_Type) + ',');
      SQL.Add(IntToStr(BlindZone_Number) + ',');
      SQL.Add(FloatToStr(Start_Angle) + ',');
      SQL.Add(FloatToStr(End_Angle) + ',');
      case index of
        1:
          SQL.Add(IntToStr(index) + ')');
        2:
          SQL.Add(IntToStr(index) + ')');
        3:
          SQL.Add(IntToStr(index) + ')');
        4:
          SQL.Add(IntToStr(index) + ')');
        5:
          SQL.Add(IntToStr(index) + ')');
        6:
          SQL.Add(IntToStr(index) + ')');
        7:
          SQL.Add(IntToStr(index) + ')');
        8:
          SQL.Add(IntToStr(index) + ')');
      end;

      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateHelicopter(rec: THelicopter_Land_Launch_Limits;
  index: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Helicopter_Land_Launch_Limits ');
      SQL.Add('SET ');
      SQL.Add('Max_Relative_Wind_Magnitude = ' + FloatToStr
          (Max_Relative_Wind_Magnitude) + ',');
      SQL.Add('Max_Turn_Rate_To_Launch =' + IntToStr(Max_Turn_Rate_To_Launch)
          + ',');
      SQL.Add('Max_Turn_Rate_To_Land = ' + IntToStr(Max_Turn_Rate_To_Land)
          + ',');
      SQL.Add('Max_Landing_Altitude =' + FloatToStr(Max_Landing_Altitude)
          + ',');
      SQL.Add('Max_Relative_Speed = ' + IntToStr(Max_Relative_Speed) + ',');
      SQL.Add('Approach_Range =' + FloatToStr(Approach_Range) + ',');
      SQL.Add('Approach_Center_Bearing =' + IntToStr(Approach_Center_Bearing)
          + ',');
      SQL.Add('Approach_Sector_Width =' + IntToStr(Approach_Sector_Width));
    end;

    SQL.Add(' WHERE Vehicle_Index = ' + index);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertHelicopter(rec: THelicopter_Land_Launch_Limits): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add(
        'SET IDENTITY_INSERT Runtime_DB.[dbo].[Helicopter_Land_Launch_Limits] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO Helicopter_Land_Launch_Limits ');
      SQL.Add(
        '(Vehicle_Index,Max_Relative_Wind_Magnitude,Max_Turn_Rate_To_Launch,Max_Turn_Rate_To_Land,');
      SQL.Add(
        'Max_Landing_Altitude,Max_Relative_Speed,Approach_Range,Approach_Center_Bearing,Approach_Sector_Width)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(FloatToStr(Max_Relative_Wind_Magnitude) + ',');
      SQL.Add(IntToStr(Max_Turn_Rate_To_Launch) + ',');
      SQL.Add(IntToStr(Max_Turn_Rate_To_Land) + ',');
      SQL.Add(FloatToStr(Max_Landing_Altitude) + ',');
      SQL.Add(IntToStr(Max_Relative_Speed) + ',');
      SQL.Add(FloatToStr(Approach_Range) + ',');
      SQL.Add(IntToStr(Approach_Center_Bearing) + ',');
      SQL.Add(IntToStr(Approach_Sector_Width) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.updateMotion(rec: TMotion_Characteristics;
  index: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Motion_Characteristics ');
      SQL.Add('SET ');
      SQL.Add('Motion_Identifier =''' + Motion_Identifier + ''',');
      SQL.Add('Motion_Type =' + IntToStr(Motion_Type) + ',');
      SQL.Add('Max_Altitude = ' + FloatToStr(Max_Altitude) + ',');
      SQL.Add('Max_Depth =' + FloatToStr(Max_Depth) + ',');
      SQL.Add('Min_Ground_Speed = ' + FloatToStr(Min_Ground_Speed) + ',');
      SQL.Add('Cruise_Ground_Speed =' + FloatToStr(Cruise_Ground_Speed) + ',');
      SQL.Add('High_Ground_Speed =' + FloatToStr(High_Ground_Speed) + ',');
      SQL.Add('Max_Ground_Speed =' + FloatToStr(Max_Ground_Speed) + ',');
      SQL.Add('Acceleration = ' + FloatToStr(Acceleration) + ',');
      SQL.Add('Deceleration =' + FloatToStr(Deceleration) + ',');
      SQL.Add('Normal_Climb_Rate = ' + FloatToStr(Normal_Climb_Rate) + ',');
      SQL.Add('Max_Climb_Rate =' + FloatToStr(Max_Climb_Rate) + ',');
      SQL.Add('Normal_Descent_Rate =' + FloatToStr(Normal_Descent_Rate) + ',');
      SQL.Add('Max_Descent_Rate =' + FloatToStr(Max_Descent_Rate) + ',');
      SQL.Add('Vertical_Accel = ' + FloatToStr(Vertical_Accel) + ',');
      SQL.Add('Standard_Turn_Rate =' + FloatToStr(Standard_Turn_Rate) + ',');
      SQL.Add('Tight_Turn_Rate = ' + FloatToStr(Tight_Turn_Rate) + ',');
      SQL.Add('Max_Helm_Angle =' + FloatToStr(Max_Helm_Angle) + ',');
      SQL.Add('Helm_Angle_Rate =' + FloatToStr(Helm_Angle_Rate) + ',');
      SQL.Add('Speed_Reduce_In_Turn =' + FloatToStr(Speed_Reduce_In_Turn)
          + ',');
      SQL.Add('Time_To_Reduce_Speed = ' + FloatToStr(Time_To_Reduce_Speed)
          + ',');
      SQL.Add('Min_Speed_To_Reduce =' + FloatToStr(Min_Speed_To_Reduce) + ',');
      SQL.Add('Rate_of_Turn_Rate_Chg = ' + FloatToStr(Rate_of_Turn_Rate_Chg)
          + ',');
      SQL.Add('Min_Pitch_Angle =' + FloatToStr(Min_Pitch_Angle) + ',');
      SQL.Add('Max_Pitch_Angle =' + FloatToStr(Max_Pitch_Angle) + ',');
      SQL.Add('Max_Roll_Angle =' + FloatToStr(Max_Roll_Angle) + ',');
      SQL.Add('Endurance_Type =' + IntToStr(Endurance_Type) + ',');
      SQL.Add('Endurance_Time =' + IntToStr(Endurance_Time) + ',');
      SQL.Add('Max_Effective_Range =' + FloatToStr(Max_Effective_Range) + ',');
      SQL.Add('Fuel_Unit_Type = ' + IntToStr(Fuel_Unit_Type) + ',');
      SQL.Add('Max_Fuel_Capacity =' + FloatToStr(Max_Fuel_Capacity) + ',');
      SQL.Add('Min_Speed_Fuel_Consume = ' + FloatToStr(Min_Speed_Fuel_Consume)
          + ',');
      SQL.Add('Cruise_Speed_Fuel_Consume =' + FloatToStr
          (Cruise_Speed_Fuel_Consume) + ',');
      SQL.Add('High_Speed_Fuel_Consume =' + FloatToStr(High_Speed_Fuel_Consume)
          + ',');
      SQL.Add('Max_Speed_Fuel_Consume =' + FloatToStr(Max_Speed_Fuel_Consume));
    end;

    SQL.Add(' WHERE Motion_Index = ' + index);
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertMotion(rec: TMotion_Characteristics): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Motion_Characteristics ');
      SQL.Add(
        '(Motion_Identifier,Motion_Type,Max_Altitude,Max_Depth,Min_Ground_Speed,Cruise_Ground_Speed,');
      SQL.Add(
        'High_Ground_Speed,Max_Ground_Speed,Acceleration,Deceleration,Normal_Climb_Rate,Max_Climb_Rate,');
      SQL.Add(
        'Normal_Descent_Rate,Max_Descent_Rate,Vertical_Accel,Standard_Turn_Rate,Tight_Turn_Rate,');
      SQL.Add(
        'Max_Helm_Angle,Helm_Angle_Rate,Speed_Reduce_In_Turn,Time_To_Reduce_Speed,Min_Speed_To_Reduce,');
      SQL.Add(
        'Rate_of_Turn_Rate_Chg,Min_Pitch_Angle,Max_Pitch_Angle,Max_Roll_Angle,Endurance_Type,Endurance_Time,');
      SQL.Add(
        'Max_Effective_Range,Fuel_Unit_Type,Max_Fuel_Capacity,Min_Speed_Fuel_Consume,Cruise_Speed_Fuel_Consume,');
      SQL.Add('High_Speed_Fuel_Consume,Max_Speed_Fuel_Consume)');
      SQL.Add(' VALUES (');
      SQL.Add('''' + Motion_Identifier + ''',');
      SQL.Add(IntToStr(Motion_Type) + ',');
      SQL.Add(FloatToStr(Max_Altitude) + ',');
      SQL.Add(FloatToStr(Max_Depth) + ',');
      SQL.Add(FloatToStr(Min_Ground_Speed) + ',');
      SQL.Add(FloatToStr(Cruise_Ground_Speed) + ',');
      SQL.Add(FloatToStr(High_Ground_Speed) + ',');
      SQL.Add(FloatToStr(Max_Ground_Speed) + ',');
      SQL.Add(FloatToStr(Acceleration) + ',');
      SQL.Add(FloatToStr(Deceleration) + ',');
      SQL.Add(FloatToStr(Normal_Climb_Rate) + ',');
      SQL.Add(FloatToStr(Max_Climb_Rate) + ',');
      SQL.Add(FloatToStr(Normal_Descent_Rate) + ',');
      SQL.Add(FloatToStr(Max_Descent_Rate) + ',');
      SQL.Add(FloatToStr(Vertical_Accel) + ',');
      SQL.Add(FloatToStr(Standard_Turn_Rate) + ',');
      SQL.Add(FloatToStr(Tight_Turn_Rate) + ',');
      SQL.Add(FloatToStr(Max_Helm_Angle) + ',');
      SQL.Add(FloatToStr(Helm_Angle_Rate) + ',');
      SQL.Add(FloatToStr(Speed_Reduce_In_Turn) + ',');
      SQL.Add(FloatToStr(Time_To_Reduce_Speed) + ',');
      SQL.Add(FloatToStr(Min_Speed_To_Reduce) + ',');
      SQL.Add(FloatToStr(Rate_of_Turn_Rate_Chg) + ',');
      SQL.Add(FloatToStr(Min_Pitch_Angle) + ',');
      SQL.Add(FloatToStr(Max_Pitch_Angle) + ',');
      SQL.Add(FloatToStr(Max_Roll_Angle) + ',');
      SQL.Add(IntToStr(Endurance_Type) + ',');
      SQL.Add(IntToStr(Endurance_Time) + ',');
      SQL.Add(FloatToStr(Max_Effective_Range) + ',');
      SQL.Add(IntToStr(Fuel_Unit_Type) + ',');
      SQL.Add(FloatToStr(Max_Fuel_Capacity) + ',');
      SQL.Add(FloatToStr(Min_Speed_Fuel_Consume) + ',');
      SQL.Add(FloatToStr(Cruise_Speed_Fuel_Consume) + ',');
      SQL.Add(FloatToStr(High_Speed_Fuel_Consume) + ',');
      SQL.Add(FloatToStr(Max_Speed_Fuel_Consume) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Motion_Index FROM Motion_Characteristics ');
      SQL.Add('WHERE Motion_Identifier =' + quotedStr(Motion_Identifier));
      Open;
      with rec.FData do
      begin
        Motion_Index := FieldByName('Motion_Index').AsInteger;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.deleteMotion(id: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Motion_Characteristics ');
    SQL.Add('WHERE Motion_Index = ' + IntToStr(id));
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetPOD_vs_SNR_Curve_Point(const id: Integer; pList: TList): boolean;
var
  ssql: string;
  rec : TPOD_vs_SNR_Point;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ2 do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM POD_vs_SNR_Point ';
    if id <> 0 then
      ssql := ssql + 'WHERE (Curve_Definition_Index = ' + IntToStr(id) + ')';
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not Assigned(pList) then
    begin
      pList.Create;
    end
    else
    begin
      pList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ2.Eof do
      begin
        rec := TPOD_vs_SNR_Point.Create;

        with rec.FData do
        begin
          Curve_Definition_Index := FieldByName('Curve_Definition_Index')
            .AsInteger;
          SNR_Ratio := FieldByName('SNR_Ratio').AsFloat;
          Prob_of_Detection := FieldByName('Prob_of_Detection').AsFloat;
        end;

        pList.Add(rec);
        ZQ2.Next;
      end;
    end;
  end;
end;

function TdmTTT.updatePOD_vs_SNR_Point(rec: TPOD_vs_SNR_Point;
  index: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE POD_vs_SNR_Point  ');
      SQL.Add('SET ');
      SQL.Add('Curve_Definition_Index = ' + IntToStr(Curve_Definition_Index)
          + ',');
      SQL.Add('SNR_Ratio = ' + FloatToStr(SNR_Ratio) + ',');
      SQL.Add('Prob_of_Detection = ' + FloatToStr(Prob_of_Detection));
    end;

    SQL.Add('WHERE (List_Index = ' + index + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.insertPOD_vs_SNR_Point(rec: TPOD_vs_SNR_Point): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Runtime_DB.[dbo].[POD_vs_SNR_Point] ON;');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO POD_vs_SNR_Point ');
      SQL.Add
        ('(List_Index,Curve_Definition_Index,SNR_Ratio,Prob_of_Detection)');
      SQL.Add(' VALUES (');
      SQL.Add(IntToStr(List_Index) + ',');
      SQL.Add(IntToStr(Curve_Definition_Index) + ',');
      SQL.Add(FloatToStr(SNR_Ratio) + ',');
      SQL.Add(FloatToStr(Prob_of_Detection) + ')');
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetMotion_Characteristics(const id: Integer;
  var rec: TMotion_Characteristics): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Motion_Characteristics ');
    SQL.Add('WHERE (Motion_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TMotion_Characteristics.Create;

      with rec.FData do
      begin
        Motion_Index := FieldByName('Motion_Index').AsInteger;
        Motion_Identifier := FieldByName('Motion_Identifier').AsString;
        Motion_Type := FieldByName('Motion_Type').AsInteger;
        Max_Altitude := FieldByName('Max_Altitude').AsSingle;
        Max_Depth := FieldByName('Max_Depth').AsSingle;
        Min_Ground_Speed := FieldByName('Min_Ground_Speed').AsSingle;
        Cruise_Ground_Speed := FieldByName('Cruise_Ground_Speed').AsSingle;
        High_Ground_Speed := FieldByName('High_Ground_Speed').AsSingle;
        Max_Ground_Speed := FieldByName('Max_Ground_Speed').AsSingle;
        Acceleration := FieldByName('Acceleration').AsSingle;
        Deceleration := FieldByName('Deceleration').AsSingle;
        Normal_Climb_Rate := FieldByName('Normal_Climb_Rate').AsSingle;
        Max_Climb_Rate := FieldByName('Max_Climb_Rate').AsSingle;
        Normal_Descent_Rate := FieldByName('Normal_Descent_Rate').AsSingle;
        Max_Descent_Rate := FieldByName('Max_Descent_Rate').AsSingle;
        Vertical_Accel := FieldByName('Vertical_Accel').AsSingle;
        Standard_Turn_Rate := FieldByName('Standard_Turn_Rate').AsSingle;
        Tight_Turn_Rate := FieldByName('Tight_Turn_Rate').AsSingle;
        Max_Helm_Angle := FieldByName('Max_Helm_Angle').AsSingle;
        Helm_Angle_Rate := FieldByName('Helm_Angle_Rate').AsSingle;
        Speed_Reduce_In_Turn := FieldByName('Speed_Reduce_In_Turn').AsSingle;
        Time_To_Reduce_Speed := FieldByName('Time_To_Reduce_Speed').AsSingle;
        Min_Speed_To_Reduce := FieldByName('Min_Speed_To_Reduce').AsSingle;
        Rate_of_Turn_Rate_Chg := FieldByName('Rate_of_Turn_Rate_Chg').AsSingle;
        Min_Pitch_Angle := FieldByName('Min_Pitch_Angle').AsSingle;
        Max_Pitch_Angle := FieldByName('Max_Pitch_Angle').AsSingle;
        Max_Roll_Angle := FieldByName('Max_Roll_Angle').AsSingle;
        Endurance_Type := FieldByName('Endurance_Type').AsInteger;
        Endurance_Time := FieldByName('Endurance_Time').AsInteger;
        Max_Effective_Range := FieldByName('Max_Effective_Range').AsSingle;
        Fuel_Unit_Type := FieldByName('Fuel_Unit_Type').AsInteger;
        Max_Fuel_Capacity := FieldByName('Max_Fuel_Capacity').AsSingle;
        Min_Speed_Fuel_Consume := FieldByName('Min_Speed_Fuel_Consume').AsFloat;
        Cruise_Speed_Fuel_Consume := FieldByName('Cruise_Speed_Fuel_Consume')
          .AsFloat;
        High_Speed_Fuel_Consume := FieldByName('High_Speed_Fuel_Consume')
          .AsFloat;
        Max_Speed_Fuel_Consume := FieldByName('Max_Speed_Fuel_Consume').AsFloat;
      end;
    end;
  end;
end;

function TdmTTT.GetLogistic_Characteristics(const id: Integer;
  var rec: TLogistic_Characteristics): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Default_Logistics ');
    SQL.Add('WHERE (Logistics_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TLogistic_Characteristics.Create;

      with rec.FData do
      begin
        Logistics_Index := ZQ.FieldByName('Logistics_Index').AsInteger;
        Logistics_Identifier := ZQ.FieldByName('Logistics_Identifier').AsString;
        PA := ZQ.FieldByName('PA').AsInteger;
        BA := ZQ.FieldByName('BA').AsInteger;
        TA := ZQ.FieldByName('TA').AsInteger;
        HSD := ZQ.FieldByName('HSD').AsFloat;
        ML := ZQ.FieldByName('ML').AsFloat;
        AT := ZQ.FieldByName('AT').AsFloat;
        AVTUR := ZQ.FieldByName('AVTUR').AsFloat;
        Food := ZQ.FieldByName('Food').AsFloat;
        Water := ZQ.FieldByName('Water').AsFloat;
        HSD_Consumption := ZQ.FieldByName('HSD_Consumption').AsFloat;
        ML_Consumption := ZQ.FieldByName('ML_Consumption').AsFloat;
        AT_Consumption := ZQ.FieldByName('AT_Consumption').AsFloat;
        AVTUR_Consumption := ZQ.FieldByName('AVTUR_Consumption').AsFloat;
        Food_Consumption := ZQ.FieldByName('Food_Consumption').AsFloat;
        Water_Consumption := ZQ.FieldByName('Water_Consumption').AsFloat;
        Fuel_TrS              := FieldByName('Fuel_TrS').AsFloat;
        Lubricants_TrS        := FieldByName('Lubricants_TrS').AsFloat;
        Fresh_Water_TrS       := FieldByName('Fresh_Water_TrS').AsFloat;
        Water_TrS             := FieldByName('Water_TrS').AsFloat;
        Food_TrS              := FieldByName('Food_TrS').AsFloat;
      end;
    end;
  end;
end;
// ------------------------------------------------------------------------------

function TdmTTT.getAllMotion_Characteristics(mList: TList): Integer;
var
  rec: TMotion_Characteristics;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Motion_Characteristics ');
    SQL.Add('ORDER BY Motion_Identifier');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(mList) then
        mList := TList.Create;
    end;

    while not ZQ.Eof do
    begin
      rec := TMotion_Characteristics.Create;

      with rec.FData do
      begin
        Motion_Index := FieldByName('Motion_Index').AsInteger;
        Motion_Identifier := FieldByName('Motion_Identifier').AsString;
        Motion_Type := FieldByName('Motion_Type').AsInteger;
        Max_Altitude := FieldByName('Max_Altitude').AsSingle;
        Max_Depth := FieldByName('Max_Depth').AsSingle;
        Min_Ground_Speed := FieldByName('Min_Ground_Speed').AsSingle;
        Cruise_Ground_Speed := FieldByName('Cruise_Ground_Speed').AsSingle;
        High_Ground_Speed := FieldByName('High_Ground_Speed').AsSingle;
        Max_Ground_Speed := FieldByName('Max_Ground_Speed').AsSingle;
        Acceleration := FieldByName('Acceleration').AsSingle;
        Deceleration := FieldByName('Deceleration').AsSingle;
        Normal_Climb_Rate := FieldByName('Normal_Climb_Rate').AsSingle;
        Max_Climb_Rate := FieldByName('Max_Climb_Rate').AsSingle;
        Normal_Descent_Rate := FieldByName('Normal_Descent_Rate').AsSingle;
        Max_Descent_Rate := FieldByName('Max_Descent_Rate').AsSingle;
        Vertical_Accel := FieldByName('Vertical_Accel').AsSingle;
        Standard_Turn_Rate := FieldByName('Standard_Turn_Rate').AsSingle;
        Tight_Turn_Rate := FieldByName('Tight_Turn_Rate').AsSingle;
        Max_Helm_Angle := FieldByName('Max_Helm_Angle').AsSingle;
        Helm_Angle_Rate := FieldByName('Helm_Angle_Rate').AsSingle;
        Speed_Reduce_In_Turn := FieldByName('Speed_Reduce_In_Turn').AsSingle;
        Time_To_Reduce_Speed := FieldByName('Time_To_Reduce_Speed').AsSingle;
        Min_Speed_To_Reduce := FieldByName('Min_Speed_To_Reduce').AsSingle;
        Rate_of_Turn_Rate_Chg := FieldByName('Rate_of_Turn_Rate_Chg').AsSingle;
        Min_Pitch_Angle := FieldByName('Min_Pitch_Angle').AsSingle;
        Max_Pitch_Angle := FieldByName('Max_Pitch_Angle').AsSingle;
        Max_Roll_Angle := FieldByName('Max_Roll_Angle').AsSingle;
        Endurance_Type := FieldByName('Endurance_Type').AsInteger;
        Endurance_Time := FieldByName('Endurance_Time').AsInteger;
        Max_Effective_Range := FieldByName('Max_Effective_Range').AsSingle;
        Fuel_Unit_Type := FieldByName('Fuel_Unit_Type').AsInteger;
        Max_Fuel_Capacity := FieldByName('Max_Fuel_Capacity').AsSingle;
        Min_Speed_Fuel_Consume := FieldByName('Min_Speed_Fuel_Consume').AsFloat;
        Cruise_Speed_Fuel_Consume := FieldByName('Cruise_Speed_Fuel_Consume')
          .AsFloat;
        High_Speed_Fuel_Consume := FieldByName('High_Speed_Fuel_Consume')
          .AsFloat;
        Max_Speed_Fuel_Consume := FieldByName('Max_Speed_Fuel_Consume').AsFloat;
      end;

      mList.Add(rec);
      ZQ.Next;
    end;
  end;
end;

function TdmTTT.GetAllOverlay_Shape(const id: Integer; var aRec: TList): Integer;
var
  rec: TShape_Definition;
begin
  result := -1;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Overlay_Shape ');
    SQL.Add('WHERE Overlay_Index = ' + IntToStr(id));
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TShape_Definition.Create;

        with rec.FData do
        begin
          OverlayIndex  := FieldByName('Overlay_Index').AsInteger;
          ShapeID       := FieldByName('Shape_ID').AsInteger;
          PostStartX    := FieldByName('PostStart_X').AsFloat;
          PostStartY    := FieldByName('PostStart_Y').AsFloat;
          PostEndX      := FieldByName('PostEnd_X').AsFloat;
          PostEndY      := FieldByName('PostEnd_Y').AsFloat;
          Words         := FieldByName('Words').AsString;
          Size          := FieldByName('Size').AsInteger;
          Radius1       := FieldByName('Radius_1').AsFloat;
          Radius2       := FieldByName('Radius_2').AsFloat;
          StartAngle    := FieldByName('Start_Angle').AsInteger;
          EndAngle      := FieldByName('End_Angle').AsInteger;
          Rotasi        := FieldByName('Rotasi').AsInteger;
          Kolom         := FieldByName('Kolom').AsInteger;
          Baris         := FieldByName('Baris').AsInteger;
          color         := FieldByName('Color').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetSubArea_Enviro_Definition(const id: Integer;
  var rectList: TList): boolean;
var
  rec: TSubArea_Enviro_Definition;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM SubArea_Enviro_Definition ');
    SQL.Add('WHERE (Game_Enviro_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not Assigned(rectList) then
    begin
      rectList.Create;
    end
    else
    begin
      rectList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TSubArea_Enviro_Definition.Create;

        with rec.FRect do
        begin
          Left := FieldByName('X_Position_1').AsInteger;
          Top := FieldByName('Y_Position_1').AsInteger;
          Right := FieldByName('X_Position_2').AsInteger;
          Bottom := FieldByName('Y_Position_2').AsInteger;
        end;

        with rec.FData do
        begin
          Enviro_Index := FieldByName('Enviro_Index').AsInteger;
          Game_Enviro_Index := FieldByName('Game_Enviro_Index').AsInteger;
          Enviro_Identifier := FieldByName('Enviro_Identifier').AsString;
          X_Position_1 := FieldByName('X_Position_1').AsSingle;
          Y_Position_1 := FieldByName('Y_Position_1').AsSingle;
          X_Position_2 := FieldByName('X_Position_2').AsSingle;
          Y_Position_2 := FieldByName('Y_Position_2').AsSingle;
          Latitude_1 := FieldByName('Latitude_1').AsFloat;
          Longitude_1 := FieldByName('Longitude_1').AsFloat;
          Latitude_2 := FieldByName('Latitude_2').AsFloat;
          Longitude_2 := FieldByName('Longitude_2').AsFloat;
          Wind_Speed := FieldByName('Wind_Speed').AsSingle;
          Wind_Direction := FieldByName('Wind_Direction').AsSingle;
          Daytime_Visual_Modifier := FieldByName('Daytime_Visual_Modifier')
            .AsSingle;
          Nighttime_Visual_Modifier := FieldByName('Nighttime_Visual_Modifier')
            .AsSingle;
          Daytime_Infrared_Modifier := FieldByName('Daytime_Infrared_Modifier')
            .AsSingle;
          Nighttime_Infrared_Modifier := FieldByName
            ('Nighttime_Infrared_Modifier').AsSingle;
          Rain_Rate := FieldByName('Rain_Rate').AsInteger;
          Cloud_Base_Height := FieldByName('Cloud_Base_Height').AsSingle;
          Cloud_Attenuation := FieldByName('Cloud_Attenuation').AsInteger;
          Sea_State := FieldByName('Sea_State').AsInteger;
          Ocean_Current_Speed := FieldByName('Ocean_Current_Speed').AsSingle;
          Ocean_Current_Direction := FieldByName('Ocean_Current_Direction')
            .AsSingle;
          Thermal_Layer_Depth := FieldByName('Thermal_Layer_Depth').AsSingle;
          Sound_Velocity_Type := FieldByName('Sound_Velocity_Type').AsInteger;
          Surface_Sound_Speed := FieldByName('Surface_Sound_Speed').AsSingle;
          Layer_Sound_Speed := FieldByName('Layer_Sound_Speed').AsSingle;
          Bottom_Sound_Speed := FieldByName('Bottom_Sound_Speed').AsSingle;
          Bottomloss_Coefficient := FieldByName('Bottomloss_Coefficient')
            .AsInteger;
          Ave_Ocean_Depth := FieldByName('Ave_Ocean_Depth').AsSingle;
          CZ_Active := FieldByName('CZ_Active').AsInteger;
          Surface_Ducting_Active := FieldByName('Surface_Ducting_Active')
            .AsInteger;
          Upper_Limit_Sur_Duct_Depth := FieldByName
            ('Upper_Limit_Sur_Duct_Depth').AsSingle;
          Lower_Limit_Sur_Duct_Depth := FieldByName
            ('Lower_Limit_Sur_Duct_Depth').AsSingle;
          Sub_Ducting_Active := FieldByName('Sub_Ducting_Active').AsInteger;
          Upper_Limit_Sub_Duct_Depth := FieldByName
            ('Upper_Limit_Sub_Duct_Depth').AsSingle;
          Lower_Limit_Sub_Duct_Depth := FieldByName
            ('Lower_Limit_Sub_Duct_Depth').AsSingle;
          Shipping_Rate := FieldByName('Shipping_Rate').AsInteger;
          Shadow_Zone_Trans_Loss := FieldByName('Shadow_Zone_Trans_Loss')
            .AsSingle;
          Atmospheric_Refract_Modifier := FieldByName
            ('Atmospheric_Refract_Modifier').AsSingle;
          Barometric_Pressure := FieldByName('Barometric_Pressure').AsSingle;
          Air_Temperature := FieldByName('Air_Temperature').AsSingle;
          Surface_Temperature := FieldByName('Surface_Temperature').AsSingle;
          HF_Black_Hole := FieldByName('HF_Black_Hole').AsInteger;
        end;

        rectList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------------------

function TdmTTT.InsertSubArea_Enviro_Definition
  (var rec: TSubArea_Enviro_Definition): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO SubArea_Enviro_Definition ');
      SQL.Add(
        '(Game_Enviro_Index,Enviro_Identifier,X_Position_1,Y_Position_1,X_Position_2, ');
      SQL.Add(
        'Y_Position_2,Latitude_1,Longitude_1,Latitude_2,Longitude_2,Wind_Speed,Wind_Direction,');
      SQL.Add(
        'Daytime_Visual_Modifier,Nighttime_Visual_Modifier,Daytime_Infrared_Modifier,Nighttime_Infrared_Modifier,');
      SQL.Add(
        'Rain_Rate,Cloud_Base_Height,Cloud_Attenuation,Sea_State,Ocean_Current_Speed,Ocean_Current_Direction,');
      SQL.Add(
        'Thermal_Layer_Depth,Sound_Velocity_Type,Surface_Sound_Speed,Layer_Sound_Speed,Bottom_Sound_Speed,');
      SQL.Add(
        'Bottomloss_Coefficient,Ave_Ocean_Depth,CZ_Active,Surface_Ducting_Active,');
      SQL.Add(
        'Upper_Limit_Sur_Duct_Depth,Lower_Limit_Sur_Duct_Depth,Sub_Ducting_Active,Upper_Limit_Sub_Duct_Depth,');
      SQL.Add(
        'Lower_Limit_Sub_Duct_Depth,Shipping_Rate,Shadow_Zone_Trans_Loss,Atmospheric_Refract_Modifier,');
      SQL.Add(
        'Barometric_Pressure,Air_Temperature,Surface_Temperature,HF_Black_Hole)'
        ); ;
      SQL.Add('VALUES (');
      SQL.Add(IntToStr(Game_Enviro_Index) + ',');
      SQL.Add('''' + Enviro_Identifier + ''',');
      SQL.Add(FloatToStr(X_Position_1) + ',');
      SQL.Add(FloatToStr(Y_Position_1) + ',');
      SQL.Add(FloatToStr(X_Position_2) + ',');
      SQL.Add(FloatToStr(Y_Position_2) + ',');
      SQL.Add(FloatToStr(Latitude_1) + ',');
      SQL.Add(FloatToStr(Longitude_1) + ',');
      SQL.Add(FloatToStr(Latitude_2) + ',');
      SQL.Add(FloatToStr(Longitude_2) + ',');
      SQL.Add(FloatToStr(Wind_Speed) + ',');
      SQL.Add(FloatToStr(Wind_Direction) + ',');
      SQL.Add(FloatToStr(Daytime_Visual_Modifier) + ',');
      SQL.Add(FloatToStr(Nighttime_Visual_Modifier) + ',');
      SQL.Add(FloatToStr(Daytime_Infrared_Modifier) + ',');
      SQL.Add(FloatToStr(Nighttime_Infrared_Modifier) + ',');
      SQL.Add(IntToStr(Rain_Rate) + ',');
      SQL.Add(FloatToStr(Cloud_Base_Height) + ',');
      SQL.Add(IntToStr(Cloud_Attenuation) + ',');
      SQL.Add(IntToStr(Sea_State) + ',');
      SQL.Add(FloatToStr(Ocean_Current_Speed) + ',');
      SQL.Add(FloatToStr(Ocean_Current_Direction) + ',');
      SQL.Add(FloatToStr(Thermal_Layer_Depth) + ',');
      SQL.Add(IntToStr(Sound_Velocity_Type) + ',');
      SQL.Add(FloatToStr(Surface_Sound_Speed) + ',');
      SQL.Add(FloatToStr(Layer_Sound_Speed) + ',');
      SQL.Add(FloatToStr(Bottom_Sound_Speed) + ',');
      SQL.Add(IntToStr(Bottomloss_Coefficient) + ',');
      SQL.Add(FloatToStr(Ave_Ocean_Depth) + ',');
      SQL.Add(IntToStr(CZ_Active) + ',');
      SQL.Add(IntToStr(Surface_Ducting_Active) + ',');
      SQL.Add(FloatToStr(Upper_Limit_Sur_Duct_Depth) + ',');
      SQL.Add(FloatToStr(Lower_Limit_Sur_Duct_Depth) + ',');
      SQL.Add(IntToStr(Sub_Ducting_Active) + ',');
      SQL.Add(FloatToStr(Upper_Limit_Sub_Duct_Depth) + ',');
      SQL.Add(FloatToStr(Lower_Limit_Sub_Duct_Depth) + ',');
      SQL.Add(IntToStr(Shipping_Rate) + ',');
      SQL.Add(FloatToStr(Shadow_Zone_Trans_Loss) + ',');
      SQL.Add(FloatToStr(Atmospheric_Refract_Modifier) + ',');
      SQL.Add(FloatToStr(Barometric_Pressure) + ',');
      SQL.Add(FloatToStr(Air_Temperature) + ',');
      SQL.Add(FloatToStr(Surface_Temperature) + ',');
      SQL.Add(IntToStr(HF_Black_Hole) + ')');
      {
        TestQuery.note.Text := SQL.Text;
        TestQuery.Show;
        }
      ExecSQL;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.UpdateSubArea_Enviro_Definition(const id: string;
  var rec: TSubArea_Enviro_Definition): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE SubArea_Enviro_Definition  ');
      SQL.Add('SET  ');
      SQL.Add('Game_Enviro_Index = ' + IntToStr(Game_Enviro_Index) + ',');
      SQL.Add('Enviro_Identifier = ''' + (Enviro_Identifier) + ''',');
      SQL.Add('X_Position_1 = ' + FloatToStr(X_Position_1) + ',');
      SQL.Add('Y_Position_1 = ' + FloatToStr(Y_Position_1) + ',');
      SQL.Add('X_Position_2 = ' + FloatToStr(X_Position_2) + ',');
      SQL.Add('Y_Position_2 = ' + FloatToStr(Y_Position_2) + ',');
      SQL.Add('Latitude_1 = ' + FloatToStr(Latitude_1) + ',');
      SQL.Add('Longitude_1 = ' + FloatToStr(Longitude_1) + ',');
      SQL.Add('Latitude_2 = ' + FloatToStr(Latitude_2) + ',');
      SQL.Add('Longitude_2 = ' + FloatToStr(Longitude_2) + ',');
      SQL.Add('Wind_Speed = ' + FloatToStr(Wind_Speed) + ',');
      SQL.Add('Wind_Direction = ' + FloatToStr(Wind_Direction) + ',');
      SQL.Add('Daytime_Visual_Modifier = ' + FloatToStr
          (Daytime_Visual_Modifier) + ',');
      SQL.Add('Nighttime_Visual_Modifier = ' + FloatToStr
          (Nighttime_Visual_Modifier) + ',');
      SQL.Add('Daytime_Infrared_Modifier = ' + FloatToStr
          (Daytime_Infrared_Modifier) + ',');
      SQL.Add('Nighttime_Infrared_Modifier = ' + FloatToStr
          (Nighttime_Infrared_Modifier) + ',');
      SQL.Add('Rain_Rate = ' + IntToStr(Rain_Rate) + ',');
      SQL.Add('Cloud_Base_Height = ' + FloatToStr(Cloud_Base_Height) + ',');
      SQL.Add('Cloud_Attenuation = ' + IntToStr(Cloud_Attenuation) + ',');
      SQL.Add('Sea_State = ' + IntToStr(Sea_State) + ',');
      SQL.Add('Ocean_Current_Speed = ' + FloatToStr(Ocean_Current_Speed) + ',');
      SQL.Add('Ocean_Current_Direction = ' + FloatToStr
          (Ocean_Current_Direction) + ',');
      SQL.Add('Thermal_Layer_Depth = ' + FloatToStr(Thermal_Layer_Depth) + ',');
      SQL.Add('Sound_Velocity_Type = ' + IntToStr(Sound_Velocity_Type) + ',');
      SQL.Add('Surface_Sound_Speed = ' + FloatToStr(Surface_Sound_Speed) + ',');
      SQL.Add('Layer_Sound_Speed = ' + FloatToStr(Layer_Sound_Speed) + ',');
      SQL.Add('Bottom_Sound_Speed = ' + FloatToStr(Bottom_Sound_Speed) + ',');
      SQL.Add('Bottomloss_Coefficient = ' + IntToStr(Bottomloss_Coefficient)
          + ',');
      SQL.Add('Ave_Ocean_Depth = ' + FloatToStr(Ave_Ocean_Depth) + ',');
      SQL.Add('CZ_Active = ' + IntToStr(CZ_Active) + ',');
      SQL.Add('Surface_Ducting_Active = ' + IntToStr(Surface_Ducting_Active)
          + ',');
      SQL.Add('Upper_Limit_Sur_Duct_Depth = ' + FloatToStr
          (Upper_Limit_Sur_Duct_Depth) + ',');
      SQL.Add('Lower_Limit_Sur_Duct_Depth = ' + FloatToStr
          (Lower_Limit_Sur_Duct_Depth) + ',');
      SQL.Add('Sub_Ducting_Active = ' + IntToStr(Sub_Ducting_Active) + ',');
      SQL.Add('Upper_Limit_Sub_Duct_Depth = ' + FloatToStr
          (Upper_Limit_Sub_Duct_Depth) + ',');
      SQL.Add('Lower_Limit_Sub_Duct_Depth = ' + FloatToStr
          (Lower_Limit_Sub_Duct_Depth) + ',');
      SQL.Add('Shipping_Rate = ' + IntToStr(Shipping_Rate) + ',');
      SQL.Add('Shadow_Zone_Trans_Loss = ' + FloatToStr(Shadow_Zone_Trans_Loss)
          + ',');
      SQL.Add('Atmospheric_Refract_Modifier = ' + FloatToStr
          (Atmospheric_Refract_Modifier) + ',');
      SQL.Add('Barometric_Pressure = ' + FloatToStr(Barometric_Pressure) + ',');
      SQL.Add('Air_Temperature = ' + FloatToStr(Air_Temperature) + ',');
      SQL.Add('Surface_Temperature = ' + FloatToStr(Surface_Temperature) + ',');
      SQL.Add('HF_Black_Hole = ' + IntToStr(HF_Black_Hole) + ' ');
    end;

    SQL.Add('WHERE (Enviro_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.DeleteSubArea_Enviro_Definition(const id_enviro: Integer;
  const id_gameArea: Integer): Integer;
begin
  result := -1;

  with ZQ do
  begin
    SQL.Clear;
    SQL.Add('DELETE from SubArea_Enviro_Definition');
    SQL.Add('WHERE (Enviro_Index = ' + IntToStr(id_enviro)
        + ') AND (Game_Enviro_Index =' + IntToStr(id_gameArea) + ')');
    ExecSQL;
  end;
end;

// -------------------------------------------------------------------

function TdmTTT.GetRuntime_Platform_Library(const id: Integer;
  var pList: TList; var rec: TRuntime_Platform_Library): boolean;
var
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM Runtime_Platform_Library ';
    if id <> 0 then
       ssql := ssql + 'WHERE (Platform_Library_Index = ' + IntToStr(id) + ')';
    ssql := ssql + 'ORDER BY Library_Name ';
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not Assigned(pList) then
    begin
      pList.Create;
    end
    else
    begin
      pList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TRuntime_Platform_Library.Create;

        with rec.FData do
        begin
          Platform_Library_Index := FieldByName('Platform_Library_Index')
            .AsInteger;
          Library_Name := FieldByName('Library_Name').AsString;
        end;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetRuntime_Platform_LibraryByResourceAlloc(const id: Integer;
  var pList: TList): boolean;
var
  ssql: string;
  rec: TRuntime_Platform_Library;
  i: Integer;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM Runtime_Platform_Library a ';
    ssql := ssql +
      'join Resource_Library_Mapping b on a.Platform_Library_Index = b.Library_Index ';
    if id <> 0 then
       ssql := ssql + 'WHERE (b.Resource_Alloc_Index = ' + IntToStr(id) + ')';
    SQL.Add(ssql);
    // ShowMessage(SQL.Text);
    Open;

    result := RecordCount > 0;
    if not Assigned(pList) then
    begin
      pList.Create;
    end
    else
    begin
      pList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TRuntime_Platform_Library.Create;

        with rec.FData do
        begin
          Platform_Library_Index := FieldByName('Platform_Library_Index')
            .AsInteger;
          Library_Name := FieldByName('Library_Name').AsString;
        end;

        pList.Add(rec);
        ZQ.Next;
      end;

      for i := 0 to pList.Count - 1do
      begin
        rec := pList.Items[i];
        getAllPlatform_Library_Entry(rec.FData.Platform_Library_Index, rec.FPlatform_Library_Entry);
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.InsertRuntime_Platform_Library
  (var rec: TRuntime_Platform_Library): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Runtime_Platform_Library(Library_Name)  ');
      SQL.Add('VALUES (');
      SQL.Add('''' + Library_Name + ''')');
    end;

    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.InsertRuntime_Platform_LibraryByResourceAlloc(const id: string;
  var rec: TRuntime_Platform_Library): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Resource_Library_Mapping  ');
      SQL.Add('VALUES (');
      SQL.Add('''' + id + ''', ' + IntToStr(Platform_Library_Index) + ')');
    end;

    ExecSQL;
  end;
end;
// ------------------------------------------------------------------------------

function TdmTTT.UpdateRuntime_Platform_Library(const id: string;
  var rec: TRuntime_Platform_Library): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Runtime_Platform_Library  ');
      SQL.Add('SET  ');
      SQL.Add('Library_Name = ''' + Library_Name + ''' ');
    end;

    SQL.Add('WHERE (Platform_Library_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.DeleteRuntime_Platform_Library(const id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Resource_Library_Mapping  ');
    SQL.Add('WHERE (Platform_Library_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.DeleteRuntime_Platform_LibraryByResourceAlloc(const id: string)
  : Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Runtime_Platform_Library  ');
    SQL.Add('WHERE (Platform_Library_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// ------------------------------------------------------------------------------

/// /====================================================
function TdmTTT.InsertPlatform_Library_Entry(var rec: TPlatform_Library_Entry)
  : Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      // Insert Pertama Kali
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Platform_Library_Entry  ');
      SQL.Add('(Library_Index, Platform_Type ');

      if Vehicle_Index <> 0 then
      begin
        SQL.Add(', Vehicle_Index');
      end;

      if Missile_Index <> 0 then
      begin
        SQL.Add(', Missile_Index');
      end;

      if Torpedo_Index <> 0 then
      begin
        SQL.Add(', Torpedo_Index');
      end;

      if Mine_Index <> 0 then
      begin
        SQL.Add(', Mine_Index');
      end;

      if Hybrid_Index <> 0 then
      begin
        SQL.Add(', Hybrid_Index');
      end;

      if Satellite_Index <> 0 then
      begin
        SQL.Add(', Satellite_Index');
      end;

      if Sonobuoy_Index <> 0 then
      begin
        SQL.Add(', Sonobuoy_Index')
      end;

      SQL.Add(') ');

      SQL.Add('VALUES ( ');
      // SQL.Add(IntToStr(Library_Entry_Index)+',');
      SQL.Add(IntToStr(Library_Index) + ',');
      SQL.Add(IntToStr(Platform_Type));

      if Vehicle_Index <> 0 then
      begin
        SQL.Add(',' + IntToStr(Vehicle_Index));
      end;

      if Missile_Index <> 0 then
      begin
        SQL.Add(',' + IntToStr(Missile_Index));
      end;

      if Torpedo_Index <> 0 then
      begin
        SQL.Add(',' + IntToStr(Torpedo_Index));
      end;

      if Mine_Index <> 0 then
      begin
        SQL.Add(',' + IntToStr(Mine_Index));
      end;

      if Hybrid_Index <> 0 then
      begin
        SQL.Add(',' + IntToStr(Hybrid_Index));
      end;

      if Satellite_Index <> 0 then
      begin
        SQL.Add(',' + IntToStr(Satellite_Index));
      end;

      if Sonobuoy_Index <> 0 then
      begin
        SQL.Add(',' + IntToStr(Sonobuoy_Index))
      end;

      SQL.Add(')');
      // ShowMessage(SQL.Text);
    end;

    ExecSQL;
  end;
end;
function TdmTTT.InsertPlottingMapping(var aRec: TResource_Allocation): Integer;
begin
  Result := -1;
  with ZQ do
  begin
    with aRec do
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO Resource_Plotting_Mapping');
      SQL.Add('(Resource_Alloc_Index, Plotting_Index, Plotting_Name, Date, Force)');
      SQL.Add('VALUES(');
      SQL.Add(IntToStr(FPlotting.Resource_Alloc_Index) + ',');
      SQL.Add(IntToStr(FPlotting.Plotting_Index) + ',');
      SQL.Add(QuotedStr(FPlotting.Plotting_Name)+ ',');
      SQL.Add(FloatToStr(FPlotting.Date) + ',');
      SQL.Add(IntToStr(FPlotting.Force) + ')');
      ExecSQL;
    end;
  end;
end;

function TdmTTT.InsertPlotting_Definition(
  aRec: TrecPlotting_Definition): Integer;
begin
  Result := -1;
  with ZQ do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO Plotting_Definition');
    SQL.Add('(Plotting_Name, Plotting_Type, Plotting_Group)');
    SQL.Add('VALUES(');
    SQL.Add(QuotedStr(aRec.Plotting_Name)+',');
    SQL.Add(IntToStr(aRec.Plotting_Type)+',') ;
    SQL.Add(IntToStr(aRec.Plotting_Group)+')');
    ExecSQL;

    SQL.Clear;
    SQL.Add('SELECT  Plotting_Index FROM Plotting_Definition');
    SQL.Add('Where (Plotting_Name = ' + QuotedStr(aRec.Plotting_Name) + ')and(Plotting_Type = '+ IntToStr(aRec.Plotting_Type)+ ')');
    Open;

    Result := FieldByName('Plotting_Index').AsInteger
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TdmTTT.GetPlatform_Library_Entry(const id: Integer;
  var rec: TPlatform_Library_Entry): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Platform_Library_Entry ');
    SQL.Add('WHERE (Library_Entry_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TPlatform_Library_Entry.Create;

      with rec.FData do
      begin
        Library_Entry_Index := FieldByName('Library_Entry_Index').AsInteger;
        Library_Index := FieldByName('Library_Index').AsInteger;
        Platform_Type := FieldByName('Platform_Type').AsInteger;
        Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
        Missile_Index := FieldByName('Missile_Index').AsInteger;
        Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
        Mine_Index := FieldByName('Mine_Index').AsInteger;
        Hybrid_Index := FieldByName('Hybrid_Index').AsInteger;
        Satellite_Index := FieldByName('Satellite_Index').AsInteger;
        Sonobuoy_Index := FieldByName('Sonobuoy_Index').AsInteger;
      end;
    end;
  end;
end;

function TdmTTT.GetPlatoon(const id: Integer; var pList: TList): Boolean;
var
  rec: TPersonel;
begin
  result := False;
  if not ZConn.Connected then
    Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT c3.Kompi_Index, c3.Kompi_Identifier, ');
    SQL.Add('d4.Pleton_Index, d4.Pleton_Identifier ');
    SQL.Add('FROM Personel_Brigade a1 JOIN Personel_Batalyon b2 ON ');
    SQL.Add('a1.brigade_index = b2.brigade_index JOIN personel_kompi c3 ON ');
    SQL.Add('b2.batalyon_index = c3.batalyon_index JOIN personel_pleton d4 ON ');
    SQL.Add('c3.kompi_index = d4.kompi_index ');
    SQL.Add('WHERE c3.Kompi_Index = ' + IntToStr(id));

    Open;
    Result := RecordCount > 0;
    if not Assigned(pList) then
      pList := TList.Create
    else
      pList.Clear;

    if not IsEmpty then
    begin
      First;
      while not ZQ.Eof do
      begin
        rec := TPersonel.Create;
        TKompi(rec).Id := FieldByName('Kompi_Index').AsInteger;
        TKompi(rec).Identifier := FieldByName('Kompi_Identifier').AsString;
        TPlatoon(rec).Id := FieldByName('Pleton_Index').AsInteger;
        TPlatoon(rec).Identifier := FieldByName('Pleton_Identifier').AsString;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//-------------------------------------------------------------------

/// /====================================================
function TdmTTT.getAllPlatform_Library_Entry(const id: Integer;
  var aRec: TList): Integer;
var
  //i: Integer;
  rec: TPlatform_Library_Entry;
begin
  result := -1;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  Platform_Library_Entry ');
    SQL.Add('WHERE (Library_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount;
    if not IsEmpty then
    begin
      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not ZQ.Eof do
      begin
        rec := TPlatform_Library_Entry.Create;

        with rec.FData do
        begin
          Library_Entry_Index := FieldByName('Library_Entry_Index').AsInteger;
          Library_Index := FieldByName('Library_Index').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index := FieldByName('Mine_Index').AsInteger;
          Hybrid_Index := FieldByName('Hybrid_Index').AsInteger;
          Satellite_Index := FieldByName('Satellite_Index').AsInteger;
          Sonobuoy_Index := FieldByName('Sonobuoy_Index').AsInteger;
        end;

        aRec.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

/// /====================================================
function TdmTTT.UpdatePlatform_Library_Entry(const id: string;
  var rec: TPlatform_Library_Entry): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Platform_Library_Entry  ');
      SQL.Add('SET ');
      SQL.Add('Library_Entry_Index = ' + IntToStr(Library_Entry_Index) + ',');
      SQL.Add('Library_Index = ' + IntToStr(Library_Index) + ',');
      SQL.Add('Platform_Type = ' + IntToStr(Platform_Type) + ',');
      SQL.Add('Vehicle_Index = ' + IntToStr(Vehicle_Index) + ',');
      SQL.Add('Missile_Index = ' + IntToStr(Missile_Index) + ',');
      SQL.Add('Torpedo_Index = ' + IntToStr(Torpedo_Index) + ',');
      SQL.Add('Mine_Index = ' + IntToStr(Mine_Index) + ',');
      SQL.Add('Hybrid_Index = ' + IntToStr(Hybrid_Index) + ',');
      SQL.Add('Satellite_Index = ' + IntToStr(Satellite_Index) + ',');
      SQL.Add('Sonobuoy_Index = ' + IntToStr(Sonobuoy_Index) + ',');
    end;

    SQL.Add('WHERE (Library_Entry_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

/// /====================================================
function TdmTTT.DeletePlatform_Library_Entry(const id: string;
  var rec: TPlatform_Library_Entry): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Platform_Library_Entry  ');
    SQL.Add('WHERE (Library_Entry_Index = ' + id + ')');
    ExecSQL;
  end;
end;
// -------------------------------------------------------------------

function TdmTTT.GetRadar_Interval_List(const id: Integer; var pList: TList;
  var rec: TRadar_Interval_List): boolean;
var
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM Radar_Interval_List ';
    if id <> 0 then
       ssql := ssql + 'WHERE (Interval_List_Index = ' + IntToStr(id) + ')';
    ssql := ssql + 'ORDER BY Interval_List_Identifier ';
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not Assigned(pList) then
    begin
      pList.Create;
    end
    else
    begin
      pList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TRadar_Interval_List.Create;

        with rec.FData do
        begin
          Interval_List_Index := FieldByName('Interval_List_Index').AsInteger;
          Interval_List_Identifier := FieldByName('Interval_List_Identifier')
            .AsString;
        end;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.UpdateRadar_Interval_List(const id: string;
  var rec: TRadar_Interval_List): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Radar_Interval_List  ');
      SQL.Add('SET ');
      SQL.Add('Interval_List_Identifier = ' + (Interval_List_Identifier) + ' ');
    end;

    SQL.Add('WHERE (Interval_List_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.InsertRadar_Interval_List(const id: string;
  var rec: TRadar_Interval_List): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Radar_Interval_List (Interval_List_Identifier) ');
      SQL.Add('VALUES ( ');
      SQL.Add('''' + Interval_List_Identifier + ''')');
    end;

    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.DeleteRadar_Interval_List(const id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Radar_Interval_List  ');
    SQL.Add('WHERE (Interval_List_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetOverlay_Definition_List(const id: Integer; var pList: TList;
  var rec: TOverlay_Definition): boolean;
var
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM Overlay_Definition ';
    if id <> 0 then
       ssql := ssql + 'WHERE (Overlay_Index = ' + IntToStr(id) + ')';
    ssql := ssql + 'ORDER BY Overlay_Identifier ';
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not Assigned(pList) then
    begin
      pList.Create;
    end
    else
    begin
      pList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TOverlay_Definition.Create;

        with rec.FData do
        begin
          Overlay_Index := FieldByName('Overlay_Index').AsInteger;
          Overlay_Identifier := FieldByName('Overlay_Identifier').AsString;
          Overlay_Filename := FieldByName('Overlay_Filename').AsString;
          Static_Overlay := FieldByName('Static_Overlay').AsInteger;
          Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
          domain := FieldByName('Domain').AsInteger;
        end;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.GetOverlay_Definition_ByID(const id: Integer;
  var rec: TOverlay_Definition): boolean;
var
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * ';
    ssql := ssql + 'FROM Overlay_Definition ';
    if id <> 0 then
       ssql := ssql + 'WHERE (Overlay_Index = ' + IntToStr(id) + ')';
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;

    if not IsEmpty then
    begin
      First;

      rec := TOverlay_Definition.Create;

      with rec.FData do
      begin
        Overlay_Index := FieldByName('Overlay_Index').AsInteger;
        Overlay_Identifier := FieldByName('Overlay_Identifier').AsString;
        Overlay_Filename := FieldByName('Overlay_Filename').AsString;
        Static_Overlay := FieldByName('Static_Overlay').AsInteger;
        Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
        domain := FieldByName('Domain').AsInteger;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.UpdateOverlay_Definition_List(const id: string;
  var rec: TOverlay_Definition): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Overlay_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Overlay_Identifier = ' + (Overlay_Identifier) + ',');
      SQL.Add('Overlay_Filename = ' + (Overlay_Filename) + ',');
      SQL.Add('Static_Overlay = ' + IntToStr(Static_Overlay) + ',');
      SQL.Add('Game_Area_Index = ' + IntToStr(Game_Area_Index) + ',');
      SQL.Add('Domain = ' + IntToStr(domain) + ' ');
    end;

    SQL.Add('WHERE (Overlay_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.InsertOverlay_Definition_List(const id: string;
  var rec: TOverlay_Definition): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Overlay_Definition ');
      SQL.Add(
        '(Overlay_Identifier,Overlay_Filename,Static_Overlay,Game_Area_Index,Domain)');
      SQL.Add('VALUES ( ');
      SQL.Add('''' + Overlay_Identifier + ''',');
      SQL.Add('''' + Overlay_Filename + ''',');
      SQL.Add(IntToStr(Static_Overlay) + ',');
      SQL.Add(IntToStr(Game_Area_Index) + ',');
      SQL.Add(IntToStr(domain) + ')');
    end;

    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.DeleteOverlay_Definition(const id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Overlay_Definition  ');
    SQL.Add('WHERE (Overlay_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetStudent_Role_List(const id: Integer; var pList: TList;
  var rec: TStudent_Role_List): boolean;
var
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := ssql + 'SELECT * FROM Student_Role_List ';
    if id <> 0 then
    begin
      ssql := ssql + 'WHERE (Role_List_Index = ' + IntToStr(id) + ')';
      ssql := ssql + 'ORDER BY Role_List_Identifier'
    end
    else
      ssql := ssql + 'ORDER BY Role_List_Identifier';
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not Assigned(pList) then
    begin
      pList.Create;
    end
    else
    begin
      pList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TStudent_Role_List.Create;

        with rec.FData do
        begin
          Role_List_Index := FieldByName('Role_List_Index').AsInteger;
          Role_List_Identifier := FieldByName('Role_List_Identifier').AsString;
        end;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetMaxRecStudent_Role_List(var rec: TStudent_Role_List)
  : boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT MAX(Role_List_Index) as last');
    SQL.Add('FROM Student_Role_List ');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;

      if not Assigned(rec) then
        rec := TStudent_Role_List.Create;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.DeleteStudent_Role_List(const id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Student_Role_List  ');
    SQL.Add('WHERE (Role_List_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.GetPOD_vs_SNR_Curve_Definition(const id: Integer; pList: TList;
  var rec: TPOD_vs_SNR_Curve_Definition): boolean;
var
  ssql: string;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    ssql := 'SELECT * FROM POD_vs_SNR_Curve_Definition ';
    if id <> 0 then
      ssql := ssql + 'WHERE (Curve_Definition_Index = ' + IntToStr(id) + ')';
    SQL.Add(ssql);
    Open;

    result := RecordCount > 0;
    if not Assigned(pList) then
    begin
      pList.Create;
    end
    else
    begin
      pList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TPOD_vs_SNR_Curve_Definition.Create;

        with rec.FData do
        begin
          Curve_Definition_Index := FieldByName('Curve_Definition_Index')
            .AsInteger;
          Curve_Definition_Identifier := FieldByName
            ('Curve_Definition_Identifier').AsString;
        end;

        pList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.UpdatePOD_vs_SNR_Curve_Definition(const id: string;
  var rec: TPOD_vs_SNR_Curve_Definition): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE POD_vs_SNR_Curve_Definition  ');
      SQL.Add('SET ');
      SQL.Add('Curve_Definition_Identifier = ' + QuotedStr(Curve_Definition_Identifier)
          + ' ');
    end;

    SQL.Add('WHERE (Curve_Definition_Index = ' + id + ')');
    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.InsertPOD_vs_SNR_Curve_Definition(
  var rec: TPOD_vs_SNR_Curve_Definition): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add(
        'INSERT INTO POD_vs_SNR_Curve_Definition(Curve_Definition_Identifier)  '
        );
      SQL.Add('VALUES ( ');
      SQL.Add('''' + Curve_Definition_Identifier + ''')');
    end;

    ExecSQL;
  end;
end;

// ------------------------------------------------------------------------------

function TdmTTT.DeletePOD_vs_SNR_Curve_Definition(const id: string): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM POD_vs_SNR_Curve_Definition  ');
    SQL.Add('WHERE (Curve_Definition_Index = ' + id + ')');
    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------

procedure TdmTTT.GetCubicle_GroupMemberPlatformID(const grpId: Integer;
  var pi: TIntegerArray);
var
  //dPI: TPlatform_Instance;
  //bResult: boolean;
  i: Integer;
begin
  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add(' a.Group_Index, c.Platform_Instance_Index, c.Instance_Name  ');
    SQL.Add('FROM ');
    SQL.Add('  Cubicle_Group_Assignment a ');
    SQL.Add('  JOIN Platform_Instance c ');
    SQL.Add('  ON a.Platform_Instance_Index = c.Platform_Instance_Index ');
    SQL.Add('WHERE ');
    SQL.Add('  a.Group_Index=');
    SQL.Add(IntToStr(grpId));
    Open;
  end;

  SetLength(pi, ZQ.RecordCount);
  i := 0;
  while not ZQ.Eof do
  begin
    pi[i] := ZQ.Fields[1].AsInteger;
    Inc(i);

    ZQ.Next;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.GetPredefined_Pattern(const id: Integer; var rec: TRecPredefined_Pattern): boolean;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Predefined_Pattern ');
    if id <> 0 then
      SQL.Add('WHERE (Pattern_Index = ' + IntToStr(id) + ')');
    SQL.Add('ORDER BY Pattern_Identifier ');
    Open;

    result := RecordCount > 0;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        with rec do
        begin
          Pattern_Index := FieldByName('Pattern_Index').AsInteger;
          Pattern_Identifier := FieldByName('Pattern_Identifier').AsString;
          Pattern_Type := FieldByName('Pattern_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Pattern_Termination := FieldByName('Pattern_Termination').AsInteger;
          Termination_Heading := FieldByName('Termination_Heading').AsSingle;
        end;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.InsertPredefined_Pattern(var rec: TPredefined_Pattern): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Predefined_Pattern  ');
      SQL.Add('VALUES ( ');
      SQL.Add('''' + Pattern_Identifier + ''',');
      SQL.Add(IntToStr(Pattern_Type) + ',');
      SQL.Add(IntToStr(Vehicle_Index) + ',');
      SQL.Add(IntToStr(Pattern_Termination) + ',');
      SQL.Add(FloatToStr(Termination_Heading) + ')');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Pattern_Index FROM Predefined_Pattern ');
      SQL.Add('WHERE Pattern_Identifier =' + quotedStr(Pattern_Identifier));
      Open;
      with rec.FData do
      begin
        Pattern_Index := FieldByName('Pattern_Index').AsInteger;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.UpdatePredefined_Pattern(const id: string;
  var rec: TPredefined_Pattern): Integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Predefined_Pattern  ');
      SQL.Add('SET ');
      SQL.Add('Pattern_Identifier = ' + QuotedStr(Pattern_Identifier) + ',');
      SQL.Add('Pattern_Type = ' + IntToStr(Pattern_Type) + ',');
      SQL.Add('Vehicle_Index = ' + IntToStr(Vehicle_Index) + ',');
      SQL.Add('Pattern_Termination = ' + IntToStr(Pattern_Termination) + ',');
      SQL.Add('Termination_Heading = ' + FloatToStr(Termination_Heading) + ' ');
    end;

    SQL.Add('WHERE (Pattern_Index = ' + id + ')');
    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.DeletePredefined_Pattern(const id: string;
  var rec: TPredefined_Pattern): Integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Predefined_Pattern  ');
    SQL.Add('WHERE (Pattern_Index = ' + id + ')');
    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.GetAllResource_Pattern_Mapping(const ra_id: Integer; var mList: TList): boolean;
var rec: TResource_Allocation;
begin
  result := false;

  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Resource_Pattern_Mapping a ');
    SQL.Add('JOIN Predefined_Pattern b ');
    SQL.Add('ON a.Pattern_Index = b.Pattern_Index ');
    if ra_id <> 0 then
      SQL.Add('WHERE (a.Resource_Alloc_Index = ' + IntToStr(ra_id) + ')');
    SQL.Add('ORDER BY b.Pattern_Identifier ');
    Open;

    result := RecordCount > 0;
    if not Assigned(mList) then
    begin
      mList.Create;
    end
    else
    begin
      mList.Clear;
    end;

    if not IsEmpty then
    begin
      First;

      while not ZQ.Eof do
      begin
        rec := TResource_Allocation.Create;

        with rec.FPattern_Mapping do
        begin
          Pattern_Instance_Index := FieldByName('Pattern_Instance_Index').AsInteger;
          Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
          Pattern_Index := FieldByName('Pattern_Index').AsInteger;
        end;
        with rec.FPattern do
        begin
          Pattern_Index := FieldByName('Pattern_Index').AsInteger;
          Pattern_Identifier := FieldByName('Pattern_Identifier').AsString;
          Pattern_Type := FieldByName('Pattern_Type').AsInteger;
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Pattern_Termination := FieldByName('Pattern_Termination').AsInteger;
          Termination_Heading := FieldByName('Termination_Heading').AsSingle;
        end;

        mList.Add(rec);
        ZQ.Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.InsertPoint_Effect_On_Board(const id: string;const index:integer;
  var rec: TPoint_Effect_On_Board): integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Point_Effect_On_Board ');
      SQL.Add('(Instance_Identifier,Instance_Type,Vehicle_Index,Mount_Type,');
      case index of
        1: begin SQL.Add('Gun_Index,');
                 SQL.Add('TurretID)');
           end;
        2: SQL.Add('Bomb_Index)');
      end;
      SQL.Add('VALUES ( ' );
      SQL.Add(QuotedStr(Instance_Identifier)+',');
      SQL.Add(IntToStr(Instance_Type)+',');
      SQL.Add(IntToStr(Vehicle_Index)+',');
      SQL.Add(IntToStr(Mount_Type)+',');
      case index of
        1: begin SQL.Add(IntToStr(Gun_Index)+',');
                 SQL.Add(IntToStr(TurretID)+')');
           end;
        2: SQL.Add(IntToStr(Bomb_Index)+')');
      end;
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT Point_Effect_Index FROM Point_Effect_On_Board ');
      SQL.Add('WHERE Instance_Identifier ='+QuotedStr(Instance_Identifier));
      Open;

      rec.FData.Point_Effect_Index := FieldByName('Point_Effect_Index').AsInteger;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TdmTTT.UpdatePoint_Effect_On_Board(const id: string; const index: Integer;
var rec: TPoint_Effect_On_Board):integer;
begin
  result := -1;

  with ZQ do
  begin
    with rec.FData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Point_Effect_On_Board ');
      SQL.Add('SET ');
      SQL.Add('Instance_Identifier ='+ QuotedStr(Instance_Identifier)+',');
      SQL.Add('Vehicle_Index ='+ IntToStr(Vehicle_Index) + ',');
      SQL.Add('Instance_Type ='+ IntToStr(Instance_Type) + ',');
      SQL.Add('Mount_Type =' + IntToStr(Mount_Type) + ',');
      SQL.Add('Quantity =' + IntToStr(Quantity) +',');
      case index of
        1:begin SQL.Add('Gun_Index ='+IntToStr(Gun_Index) +',');
                SQL.Add('TurretID ='+IntToStr(TurretID));
          end;
        2:SQL.Add('Bomb_Index ='+IntToStr(Bomb_Index) );
      end;
      SQL.Add(' WHERE Point_Effect_Index ='+ id );
    end;

    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------

function TdmTTT.DeletePoint_Effect_On_Board(const id: string): integer;
begin
  result := -1;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Point_Effect_On_Board  ');
    SQL.Add('WHERE (Point_Effect_Index = ' +  id + ')' );
    ExecSQL;
  end;
end;

end.
