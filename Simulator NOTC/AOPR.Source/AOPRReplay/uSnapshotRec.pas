unit uSnapshotRec;

interface

uses
  Classes, SysUtils, Windows,
  uSnapshotUtils, uSnapshotData, uSRRFunction,
  tttData, uDBAsset_GameEnvironment, uDBGame_Defaults, uDBScenario,
  uDBAsset_Radar, uDBAsset_Sensor, uDBAsset_Weapon, uDBAsset_Sonar,
  uDBAsset_Fitted, uDBAssetObject, uT3Unit, uDBRainfall, uDBCloud_Effect , uT3SimManager,
  uDBDefault_Var, uT3DataLink, uT3UnitContainer, uT3Vehicle, uT3Missile, uT3MissileDetail,
  uT3Radar, uT3Sonar, uT3Sensor, uT3OtherSensor, uT3Visual, uT3CounterMeasure,
  uT3Weapon, uT3Torpedo, uT3Bomb, uT3Gun, uT3Mine, uGameData_TTT,
  uT3DefensiveJammer, uMainLogisticTemplate, uMainStrategi, uDataModuleTTT, ZDataset
  , DB, uDBAsset_Embark_Library, uBrigadePersonel,
  uMainOverlay, uMainStaticShape, uMainPlottingShape;

type
  TSnapshotObjectWriter = class
  private
    FDataModule : TdmTTT;
    FQueueList  : TThreadList;
    FRecordIndex: integer;

    procedure SaveObject(obj : TStoredObject);
    procedure AddObject(obj : TStoredObject);
    procedure SetRecordIndex(const Value: integer);
  public
    constructor Create(DM : TdmTTT);
    destructor Destroy; override;
    procedure InitiateWriter(recordName:string;scenarioIndex : integer;
      gameTime : TDateTime);
    procedure WriteData(apRec: PAnsiChar ; const Size: Integer;
                  const EventID: Int64);
    procedure SaveToDB;

    property RecordIndex : integer read FRecordIndex write SetRecordIndex;
  end;

  TSnapshotObjectReader = class
  private
    FDataModule : TdmTTT;
    FRecordList : TZQuery;
    FGameTime : TDateTime;

  public
    constructor Create(DM : TdmTTT);
    destructor Destroy; override;
    function InitiateReader(SnapshotName:string) : boolean;
    function GetContainerData(EventID: Integer; var container : TT3UnitContainer): Boolean;

    property GameTime : TDateTime read FGameTime write FGameTime;
  end;

  TRecObjectSnapshot = record
    ID                 : Integer;
    Name               : string[60];
    AddName            : string[60];
    LastPlatformID     : Integer;
    FRCubicleGroupList : _SSA_CubGroup ;
    FRAssignCGList     : _SSA_CubAssign ;
    FRGameInfo         : _SS_GameInfo ;
    FRGameScenario     : _SS_GameScenario;

    FRRainfall         : _SS_Rainfall;
    FRCloudEffect      : _SS_CloudEffect;
    FRDefaultVar       : _SS_DefaultVar;

    FRDataLink         : _SSA_DataLink ;

    {simPlarform}
    FRVehicle          : _SSA_Vehicle;
    FRChaff            : _SSA_Chaff;
    FRAirBubble        : _SSA_AirBubble;
    FRJammer           : _SSA_Jammer;
    FRDecoy            : _SSA_Decoy;
    //FRWeapon           : _SSA_Weapon;
    FRTT3Missile_SS    : _SSA_TT3Missile_SS;
    FRTT3Missile_SA    : _SSA_TT3Missile_SA;
    FRTT3Missile_AA    : _SSA_TT3Missile_AA;
    FRTT3Missile_AS    : _SSA_TT3Missile_AS;
    FRTT3Missile_LA    : _SSA_TT3Missile_LA;
    FRTT3Missile_HM    : _SSA_TT3Missile_HM;
    FRTT3Missile_TM    : _SSA_TT3Missile_TM;
    FRTT3Torpedo       : _SSA_TT3Torpedo;
    FRTT3Bomb          : _SSA_TT3Bomb;
    FRTT3Mine          : _SSA_TT3Mine;
    FRTT3GunShoot      : _SSA_TT3GunShoot;
    FRTT3Vectac        : _SSA_TT3Vectac;
    FRT3Sonobuoy       : _SSA_TT3Sonobuoy;
    {simPlarform}

    FRNonRealTime      : _SSA_NonRealTime;
    FRPointRBLW        : _SSA_RBLW;
    FRPointBOLW        : _SSA_BOLW;

    {SimDevice :: Weapons}
    FRMissileOnVehicle  : _SSA_MissilesOnVehicle;
    FRTorpedoOnVehicle  : _SSA_TorpedoOnVehicle;
    FRGunOnVehicle      : _SSA_GunOnVehicle;
    FRMineOnVehicle     : _SSA_MineOnVehicle;
    FRBombOnVehicle     : _SSA_BombOnVehicle;
    //// TO-DO apa bedanya dengan object yang di FRTT3Vectac ?
    FRVectac            : _SSA_TT3Vectac;
    {SimDevice :: Weapons}

    {SimDevice :: sensor}
    FRRadar          : _SSA_Radar ;
    FRESMSensor      : _SSA_ESMSensor ;
    FREOSensor       : _SSA_EOSensor ;
    FRMADSensor      : _SSA_MADSensor ;
    FRFCRSensor      : _SSA_FCRSensor ;
    FRIFFSensor      : _SSA_IFFSensor ;
    FRSonar          : _SSA_Sonar ;
    FRVisual         : _SSA_Visual ;
    FRTT3SonobuoyOnVehicle : _SSA_TT3SonobuoyOnVehicle;
    {SimDevice :: sensor}
    {SimDevice :: CounterMeasure}
    FRDefensiveJammerOnVehicle    : _SSA_DefensiveJammerOnVehicle;
    FRTowedJammerOnVehicle        : _SSA_TowedJammerOnVehicle ;
    FRInfraredDecoyOnVehicle      : _SSA_InfraredDecoyOnVehicle ;
    FRRadarNoiseJammerOnVehicle   : _SSA_RadarNoiseJammerOnVehicle ;
    FRAirBubbleOnVehicle          : _SSA_AirBubbleOnVehicle ;
    FRAcousticDecoyOnVehicle      : _SSA_AcousticDecoyOnVehicle ;
    FRChaffOnVehicle              : _SSA_ChaffOnVehicle ;
    FRFloatingDecoyOnVehicle      : _SSA_FloatingDecoyOnVehicle ;
    FRChaffLauncher               : _SSA_ChaffLauncher ;

    FRMainOverlayTemplate         : _SSA_TMainOverlayTemplate;

    FRMainPlotting                : _SSA_TMainPlotting;
    FRShipingRoute                : _SSA_TShipingRoute;

    FRPlatformBase                : _SSA_TPlatrformBase;

//    FRTBase                       : _SSA_TBase;
//    FRTBaseRadar                  : _SSA_TBaseRadar;
    {SimDevice :: CounterMeasure}

    procedure SnapshotResetVarCount ;

    procedure SetRadarListFromVehicleID (const idx : integer ; var alist : TList );
    procedure SetESMSensorListFromVehicleID (const idx : integer ; var alist : TList );
    procedure SetSonarSensorListFromVehicleID (const idx : integer ; var alist : TList );
    procedure SetEOSensorListFromVehicleID (const idx : integer ; var alist : TList );
    procedure SetIFFSensorListFromVehicleID (const idx : integer ; var alist : TList );
    procedure SetMADSensorListFromVehicleID (const idx : integer ; var alist : TList );
    procedure SetFCRSensorListFromVehicleID (const idx : integer ; var alist : TList );
    procedure SetVisualSensorListFromVehicleID (const idx : integer ; var alist : TList );

    procedure SetMissileOnVehicleListFromVehicleID (const idx : integer ; var alist : TList );
    procedure SetTorpedoOnVehicleListFromVehicleID (const idx : integer ; var alist : TList );
    procedure SetGunOnVehicleListFromVehicleID (const idx : integer ; var alist : TList );
    procedure SetBomsOnVehicleListFromVehicleID (const idx : integer ; var alist : TList );
    procedure SetMineOnVehicleListFromVehicleID (const idx : integer ; var alist : TList );

    procedure SetAllAcoustic_Decoy_On_Board(const idx : integer ; var alist : TList );
    procedure SetAllAir_Bubble_Mount(const idx : integer ; var alist : TList );
    procedure SetAllChaff_On_Board(const idx : integer ; var alist : TList );
    procedure SetAllChaff_Launcher_On_Board(const idx : integer ; var alist : TList );
    procedure SetAllFloating_Decoy_On_Board(const idx : integer ; var alist : TList );
    procedure SetAllJammer_On_Board(const idx : integer ; var alist : TList );

    procedure SetHybrid_Definition(const ss : _SS_TT3Vehicle ; var alist : TList );
    procedure SetAllDefensive_Jammer_On_Board(const ss : _SS_TT3Vehicle ; var alist : TList );
    procedure SetAllPointEffect_On_Board(const ss : _SS_TT3Vehicle ;  var alist : TList );
    procedure SetAllInfrared_Decoy_On_Board(const ss : _SS_TT3Vehicle ; var alist : TList );
    procedure SetAllTowed_Jammer_Decoy_On_Board(const ss : _SS_TT3Vehicle ;  var alist : TList );
    procedure SetHosted_Platform(const ss : _SS_TT3Vehicle ; var alist : TList );
    procedure SetAllSonobuoy_On_Board(const ss : _SS_TT3Vehicle ; var alist : TList );


    function GetVehicleDataFromVehicleID (const idx : integer ; var rec : _SS_TT3Vehicle ) : boolean ;
    function GetRadarRecFromRadarID (const ID : integer ) : integer;
    function GetESMRecFromESMID (const ID : integer ) : integer;
    function GetSonarIndexFromID (const ID : integer ) : integer;
    function GetIFFSensorIndexFromID (const ID : integer ) : integer;
    function GetEOSensorIndexFromID (const ID : integer ) : integer;
    function GetVisualIndexFromID (const ID : integer ) : integer;
    function GetMADSensorIndexFromID (const ID : integer ) : integer;
    function GetFCRSensorIndexFromID (const ID : integer ) : integer;

    function GetMissileOnVehiceFromID (const ID : integer ) : integer;
    function GetTorpedoOnVehiceFromID (const ID : integer ) : integer;
    function GetGunOnVehiceFromID (const ID : integer ) : integer;
    function GetBomsOnVehiceFromID (const ID : integer ) : integer;
    function GetMinesOnVehiceFromID (const ID : integer ) : integer;
    function GetVectacIndexFromID (const ID : integer ) : integer;

    function GetDefensiveJammerOnVehicleIndexFromID (const ID : integer ) : integer;
    function GetTowedJammerOnVehicleIndexFromID (const ID : integer ) : integer;
    function GetInfraredDecoyOnVehicleIndexFromID (const ID : integer ) : integer;

    function GetChaffOnVehiceIndexFromID (const ID : integer ) : integer;
    function GetChaffLauncherOnVehiceIndexFromID (const ID : integer ) : integer;
    function GetAcousticDecoyOnVehicleIndexFromID (const ID : integer ) : integer;
    function GetAirBubbleOnVehicleIndexFromID (const ID : integer ) : integer;
    function GetRadarNoiseJammerOnVehicleIndexFromID (const ID : integer ) : integer;

    function SnapshotLaunchVectac(const sim : TT3UnitContainer; const mgr : TT3SimManager ;
      const FIsInstructor : boolean ;
      const rec: _SS_TT3Vectac): TObject;
    function SnapshotLaunchGun(const sim : TT3UnitContainer; const mgr : TT3SimManager ;
      const FIsInstructor : boolean ;
      const rec: _SS_TT3GunShoot): TObject;
    procedure SnapshotSetWeaponOnVehicle( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
      const FIsInstructor : boolean ;
      obj : TObject ; var s : string );
    procedure SnapshotSetDeviceSensor( obj : TObject ; var s : string );
    procedure SnapshotSetDeviceCounterMeasure( obj : TObject ; var s : string);

    procedure SnapshotGetPlatforms( obj : TObject ; var s : string );
    procedure SnapshotGetDeviceSensor( obj : TObject ; var s : string );
    procedure SnapshotGetDeviceCounterMeasure( obj : TObject  ; var s : string );
    procedure SnapshotGetWeaponOnVehicle( obj : TObject  ; var s : string );
    procedure SnapshotGetNonRealTimePlatforms( obj : TObject ; var s : string );
    procedure SnapshotGetPointRBLW_VehicleMissile( obj : TObject ; var s : string );
    procedure SnapshotGetPointBOLW_VehicleMissile( obj : TObject ; var s : string );

    procedure SnapshotGetShipingRoute( obj : TObject ; var s : string );
    procedure SnapshotGetPlotting( obj : TObject ; var s : string );
    procedure SnapshotGetOverlay( obj : TObject ; var s : string );
    procedure SnapshotGetBase( obj : TObject ; var s : string );

    function LoadFrom(AStream: TStream): Boolean;
    procedure SaveTo(AStream: TStream; ScenarioID: Integer);

  const
    cVersion = cSSUTILS_FILE_VERSION;
    cDefaultOptions = [ssuAnsiStringCodePage, ssuUTF16ToUTF8];
  end;

var
  lRec  : TRecObjectSnapshot;
  recSSCubGroup       : _SS_CubGroup ;

  recSSVehicle        : _SS_TT3Vehicle ;
  recSSWeapon         : _SS_TT3Weapon ;

  recSSNonRealtime    : _SS_TT3NonRealVehicle ;
  recRBLW             : _SS_TPointVehicleMissileRBLW ;
  recBOLW             : _SS_TPointVehicleMissileBOLW ;

  recSSMissile_SS     : _SS_TT3Missile_SS ;
  recSSMissile_SA     : _SS_TT3Missile_SA ;
  recSSMissile_AA     : _SS_TT3Missile_AA ;
  recSSMissile_AS     : _SS_TT3Missile_AS ;
  recSSMissile_LA     : _SS_TT3Missile_LA ;
  recSSMissile_HM     : _SS_TT3Missile_HM ;
  recSSMissile_TM     : _SS_TT3Missile_TM ;

  recSSRadar     : _SS_TT3Radar ;
  recSSSonar     : _SS_TT3Sonar ;
  recSSESMSensor : _SS_TT3ESMSensor ;
  recSSIFFSensor : _SS_TT3IFFSensor ;
  recSSEOSensor  : _SS_TT3EOSensor ;
  recSSMADSensor : _SS_TT3MADSensor ;
  recSSFCRSensor : _SS_TT3FCRSensor ;
  recSSVisual    : _SS_TT3Visual ;

  recSSMissilesOnVehicle  : _SS_MissilesOnVehicle ;
  recSSTorpedoOnVehicle   : _SS_TorpedoOnVehicle ;
  recSSGunOnVehicle       : _SS_GunOnVehicle ;
  recSSBomOnVehicle       : _SS_BombOnVehicle ;
  recSSMineOnVehicle      : _SS_MineOnVehicle ;

  recSSVectac             : _SS_TT3Vectac ;

  recSSChaffOnVehicle            : _SS_ChaffOnVehicle ;
  recSSChaffLauncher             : _SS_ChaffLauncher ;
  recSSAcousticDecoyOnVehicle    : _SS_AcousticDecoyOnVehicle ;
  recSSAirBubbleOnVehicle        : _SS_AirBubbleOnVehicle ;
  recSSRadarNoiseJammerOnVehicle : _SS_RadarNoiseJammerOnVehicle ;
  recSSInfraredDecoyOnVehicle    : _SS_InfraredDecoyOnVehicle ;
  recSSTowedJammerOnVehicle      : _SS_TowedJammerOnVehicle ;
  recSSDefensiveJammerOnVehicle  : _SS_DefensiveJammerOnVehicle ;

  recSSOverlayTemplate    : _SS_TMainOverlayTemplate;
  recSSOverlayStaticShape : _SS_TMainStaticShape;
  recSSPlotting           : _SS_TMainPlotting;
  recSSShipingRoute       : _SS_TShipingRoute;

  recSSLogisticRoute      : _SS_TPointRoute;
  recSSPlatformBase       : _SS_TPlatformBase;

//  recTBase                       : _SS_TBase;
//  RecTBaseRadar                  : _SS_TBaseRadar;

  ssCount                        : __SS_RecCount ;

procedure GetUidSnapShot(const aData: _SSA_Vehicle; var aStrs: TStrings);
{*********************************************************************************************}
procedure __snapshot_showprogress ( isShow : boolean );
procedure __snapshot_setprogress( const s : string ) ;
///---
function __snapshot_loadfile ( const s : string ) : boolean ;
///----
procedure __snapshot_getGameScenario (const scenario : TT3DBScenario);
procedure __snapshot_getGameDefaults (const GameDefaults : TGame_Defaults);
procedure __snapshot_getRainfall (const Rainfall : TRainfall);
procedure __snapshot_getCloudEffects (const CE : TCloud_Effects);
procedure __snapshot_getDefaultVar(const DV : TDefault_Var);
procedure __snapshot_getDatalink(const DL1,DL2,DL3 : TT3DataLink);

procedure __snapshot_setGameScenario (var scenario : TT3DBScenario);
procedure __snapshot_setGameEnvironment (var GameEnvironment : TGame_Environment_Definition);
procedure __snapshot_setGameDefault (var GameDefaults : TGame_Defaults);
procedure __snapshot_setRainfall (var Rainfall : TRainfall);
procedure __snapshot_setCloudEffects (var CE : TCloud_Effects);
procedure __snapshot_setDefaultVar(var DV : TDefault_Var);
procedure __snapshot_setDatalinks(const sim : TT3UnitContainer; var DL1,DL2,DL3 : TT3DataLink);
///----
///
procedure __snapshotSetVehicleDefList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ; var sLog : string);
procedure __snapshotSetVehicleList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ; var sLog : string ; var FlastPlatformID : Integer);
procedure __snapshotSetNonRealtimeList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ; var sLog : string);
procedure __snapshotSetPointRBLW_VehicleMissile( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ; var sLog : string);
procedure __snapshotSetPointBOLW_VehicleMissile( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ; var sLog : string);

procedure __snapshotSetMissileList( const sim : TT3UnitContainer; const mgr : TT3SimManager ; const FIsInstructor : boolean );
procedure __snapshotSetTorpedoList( const sim : TT3UnitContainer; const mgr : TT3SimManager ; const FIsInstructor : boolean );
procedure __snapshotSetBombList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;const FIsInstructor : boolean );
procedure __snapshotSetGunList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
procedure __snapshotSetVectacList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
procedure __snapshotSetAirBubbleList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
procedure __snapshotSetChaffList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
procedure __snapshotSetMineList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
procedure __snapshotSetSonobuoyList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );




///
implementation

uses uDBAsset_Scripted, uDBBlind_Zone, newClassASTT, uDBAsset_Countermeasure,
  uDBAsset_Geo, uDBAsset_Deploy, uDBAsset_Reference_Point,
  ufProgress, uDBFormation, uDBLink, uT3MissileEnvironment, uT3RadarNoiseJammer,
  uT3Sonobuoy;

const
  isExist       = 1 ;
  isNone        = 0 ;


{TSnapshotObjectWriter}
constructor TSnapshotObjectWriter.Create;
begin
  FDataModule := DM;

  FQueueList := TThreadList.Create;
end;

destructor TSnapshotObjectWriter.Destroy;
begin
  FDataModule := nil;

  FQueueList.Free;

  inherited;
end;

procedure TSnapshotObjectWriter.InitiateWriter(recordName:string;scenarioIndex : integer;
      gameTime : TDateTime);
begin

  // new data record
  FRecordIndex :=  FDataModule.newSnapshot(scenarioIndex,recordName,gameTime);

end;

procedure TSnapshotObjectWriter.SaveObject(obj : TStoredObject);
begin
  if Assigned(obj) then
  begin
    if Assigned(FDataModule) then
      FDataModule.SnapshotData(FRecordIndex, obj.FRecordType, obj.FStreamData,obj.FSizeRecord);
  end;

end;

procedure TSnapshotObjectWriter.SetRecordIndex(const Value: integer);
begin
  FRecordIndex := Value;
end;

procedure TSnapshotObjectWriter.WriteData(apRec: PAnsiChar ; const Size: Integer;
          const EventID: Int64);
var
  storedObject : TStoredObject;
  SPlatform : TT3UnitContainer;
  countData : Integer;
begin
  storedObject := TStoredObject.Create;
  with storedObject do
  begin
    FSizeRecord := SizeOf(apRec);
    FRecordType := EventID;
  end;

  case EventID of
    C_Simplatform : {0}
    begin
      CopyMemory(@SPlatform, apRec, SizeOf(apRec));
      countData := SPlatform.itemCount;
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(SPlatform,SizeOf(apRec)) ;
    end;
  end;

  // stream exist
  if Assigned(storedObject.FStreamData) then
  begin
    AddObject(storedObject);
  end
  else
    storedObject.Free;
end;

procedure TSnapshotObjectWriter.AddObject(obj: TStoredObject);
begin
  with FQueueList.LockList do
    Add(obj);

  FQueueList.UnlockList;

end;

procedure TSnapshotObjectWriter.SaveToDB;
var
  obj : TStoredObject;
begin
  with FQueueList.LockList do
    if Count > 0 then
    begin
      obj := items[0];

      SaveObject(obj);

      if Assigned(obj.FStreamData) then
        obj.FStreamData.Free;

      obj.Free;
      Delete(0);

    end;


  FQueueList.UnlockList;

end;

{TSnapshotObjectReader}

constructor TSnapshotObjectReader.Create;
begin
  FDataModule := DM;
  FRecordList := TZQuery.Create(nil);
end;

destructor TSnapshotObjectReader.Destroy;
begin
  FRecordList.Close;
  FRecordList.Free;

  inherited;
end;

function TSnapshotObjectReader.initiateReader(SnapshotName:string) : boolean;
begin
  Result := False;

  // fetch data records

  FRecordList.Close;
  FDataModule.getSnapshotData(SnapshotName,FRecordList);
  FDataModule.getSnapshotTime(SnapshotName,FGameTime);

  if FRecordList.RecordCount > 0 then
  begin
    FRecordList.First;
    Result := True;
  end;
end;

function TSnapshotObjectReader.GetContainerData(EventID: Integer; var container : TT3UnitContainer) : Boolean;
var
  CurrTick  : Int64;
  CurrRecType, SizeData : integer;
  CurrBlobData : TStream;
  bf : TBlobField;
begin
  FRecordList.First;

  while not FRecordList.Eof  do
  begin
    CurrRecType := FRecordList.FieldByName('Record_Type').AsInteger;

    if CurrRecType = EventID then
    begin
      bf := FRecordList.FieldByName('Blob_Data') as TBlobField;
      CurrBlobData := FRecordList.CreateBlobStream(bf, bmRead);

      SizeData := FRecordList.FieldByName('Size_Data').AsInteger;

      CurrBlobData.Read(container, 4096);
      Break;
    end;

    FRecordList.Next;
    Result := True;
  end;
end;

function __snapshot_getPI ( pii : integer )  : TPlatform_Instance ;
var
  i : integer ;
  pi : TPlatform_Instance ;
begin
  Result := nil ;
  for i := 0 to VScenario.PlatformInstanceListFromDB.Count - 1 do begin
      pi := VScenario.PlatformInstanceListFromDB[i];
      if pi <> nil then begin
        if pi.FData.Platform_Instance_Index = pii then
           Result := pi ;
      end;
  end;
end;

function __snapshot_getT3PI ( const simp : TT3UnitContainer ; const pii : integer )  : TT3PlatformInstance ;
var
  i,pin  : integer ;
  obj : TObject ;
  p   : TT3PlatformInstance ;
begin
  Result := nil ;
  for i := 0 to simp.itemCount - 1 do begin
      obj := simp.getObject(i);
      if obj is TT3PlatformInstance then begin
        if obj <> nil then begin
           p := TT3PlatformInstance(obj);
           pin := p.InstanceIndex ;
           if pin = pii then
           begin
              Result := p ;
              Break;
           end;
        end;
      end;
  end;
end;

procedure TRecObjectSnapshot.SnapshotResetVarCount ;
begin
  with ssCount do
  begin
    mMissileSSCount := 0 ;
    mMissileSACount := 0 ;
    mMissileAACount := 0 ;
    mMissileASCount := 0 ;
    mMissileLACount := 0 ;
    mMissileHMCount := 0 ;
    mMissileTMCount := 0 ;

    mVehicleCount   := 0 ;
    mWeaponCount    := 0 ;
    mChaffCount     := 0 ;
    mAirBubbleCount := 0 ;
    mJammerCount    := 0 ;
    mDecoyCount     := 0 ;
    mSonobuoyCount  := 0 ;

    mTT3RadarCount      := 0 ;
    mTT3ESMSensorCount  := 0 ;
    mTT3EOSensorCount   := 0 ;
    mTT3MADSensorCount  := 0 ;
    mTT3FCRSensorCount  := 0 ;
    mTT3IFFSensorCount  := 0 ;
    mTT3SonarCount      := 0 ;
    mTT3VisualCount     := 0 ;
    mTT3SonobuoyOnVehicleCount := 0 ;

    mTT3RadarNoiseJammerOnVehicleCount  := 0 ;
    mTT3AcousticDecoyOnVehicleCount     := 0 ;
    mTT3AirBubbleOnVehicleCount         := 0 ;
    mTT3ChaffLauncherCount              := 0 ;
    mTT3ChaffOnVehicleCount             := 0 ;
    mTT3FloatingDecoyOnVehicleCount     := 0 ;

    mTT3MissilesOnVehicleCount := 0 ;
    mTT3TorpedoOnVehicleCount  := 0 ;
    mTT3GunOnVehicleCount      := 0 ;
    mTT3MineOnVehicleCount     := 0 ;
    mTT3BombOnVehicleCount     := 0 ;

    mMissileSSCount := 0 ;
    mTT3VectacCount := 0 ;

    mTMainOverlayTamplate := 0;
    mTMainStaticShape := 0;

    mTMainPlotting := 0;
    mTIntelijenPlotting := 0;
    mTLogisticPlotting := 0;
    mTPangkalanPlotting := 0;

    mTShipingRoute := 0;
    mTPointRoute := 0;
//    mTBase := 0;
//    mTBaseRadar := 0;
  end;
end;


function TRecObjectSnapshot.GetVehicleDataFromVehicleID (const idx : integer ; var rec : _SS_TT3Vehicle ) : boolean ;
var
   i : integer ;
begin
   Result := false ;
   for i := low(FRVehicle) to High(FRVehicle) do begin
    if FRVehicle[i].P.SST3Unit.InstanceIndex = idx then begin
        rec := FRVehicle[i];
        Result := true ;
        break;
    end;
   end;
end;


procedure TRecObjectSnapshot.SetRadarListFromVehicleID (const idx : integer ; var alist : TList );
var
  i, j : integer;
  obj : TRadar_On_Board ;
  blind : TBlind_Zone ;
  pattern : TPattern_Radar;
  scripted : TScripted_Radar;
  cov : TRadar_Vertical_Coverage;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRRadar) to High(FRRadar) do begin
    with FRRadar[i].R do begin
      if FRRadar[i].S.Owner = idx then begin
         obj := TRadar_On_Board.Create;
         obj.FData      := FData ;
         obj.FDef       := FDef ;
         obj.FPattern   := FPattern ;
         obj.FType      := FType ;
         obj.FInterval  := FInterval;
         obj.FVehicle.FData             := FVehicle.FData;
         obj.FVehicle.FPlatform_Ident   := FVehicle.FPlatform_Ident;
         obj.FVehicle.FHeliLimitation   := FVehicle.FHeliLimitation;

         if obj.FNote = nil then
            obj.FNote := TNote_Storage.Create ;
         obj.FNote.FData := FNote ;

         if obj.FBlind_Zone = nil then
            obj.FBlind_Zone := TBlind_Zone.Create ;
         obj.FBlind_Zone.FData := FBlind_Zone.FData ;

         for j := low(FBlind) to High(FBlind) do begin
           blind := TBlind_Zone.Create;
           blind.FData := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;

         for j := low(FScripted_Pattern) to High(FScripted_Pattern) do begin
           pattern := TPattern_Radar.Create;
           pattern.Event.FData := FScripted_Pattern[j].Event ;
           pattern.Pattern.FData := FScripted_Pattern[j].Pattern ;
           obj.FScripted_Pattern.Add(pattern);
         end;

         for j := low(FScripted_Radar) to High(FScripted_Radar) do begin
           scripted := TScripted_Radar.Create;
           scripted.Event.FData := FScripted_Radar[j].Event ;
           scripted.Behav.FData := FScripted_Radar[j].Behav ;
           obj.FScripted_Radar.Add(scripted);
         end;

         for j := low(FRadar_Vertical) to High(FRadar_Vertical) do begin
           cov := TRadar_Vertical_Coverage.Create;
           cov.FData := FRadar_Vertical[j].FData ;
           if obj.FRadar_Vertical = nil then
              obj.FRadar_Vertical := TRadar_Vertical.Create;
           obj.FRadar_Vertical.Add(cov);
         end;

         obj.FECCM_Type          := FRRadar[i].R.FECCM_Type ;
         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetESMSensorListFromVehicleID (const idx : integer ; var alist : TList );
var
  i, j  : integer;
  obj   : TESM_On_Board ;
  blind : TBlind_Zone ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRESMSensor) to High(FRESMSensor) do begin
    with FRESMSensor[i].ESMDefinition do begin
      if FRESMSensor[i].S.Owner  = idx then begin
         obj := TESM_On_Board.Create;
         obj.FData                      := FData ;
         obj.FESM_Def                   := FESM_Def ;
         obj.FNote                      := FNote ;
         obj.FVehicle.FData             := FVehicle.FData;
         obj.FVehicle.FPlatform_Ident   := FVehicle.FPlatform_Ident;
         obj.FVehicle.FHeliLimitation   := FVehicle.FHeliLimitation;
         if obj.FBlind_Zone = nil then
            obj.FBlind_Zone := TBlind_Zone.Create ;
         obj.FBlind_Zone.FData := FBlind_Zone.FData ;
         for j := low(FBlind) to High(FBlind) do begin
           blind := TBlind_Zone.Create;
           blind.FData := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;
         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetSonarSensorListFromVehicleID (const idx : integer ; var alist : TList );
var
  i, j : integer;
  obj : TSonar_On_Board ;
  blind : TBlind_Zone ;
  pattern : TPattern_Sonar;
  scripted : TScripted_Sonar;
  pod : TPOD_vs_SNR_Point ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRSonar) to High(FRSonar) do begin
    with FRSonar[i].SonarDefinition do begin
      if FRSonar[i].S.Owner= idx then begin
         obj := TSonar_On_Board.Create;
         obj.FData                      := FData ;
         obj.FDef                       := FDef ;
         obj.FPattern                   := FPattern ;
         obj.FCategory                  := FCategory ;
         obj.FVehicle.FData             := FVehicle.FData;
         obj.FVehicle.FPlatform_Ident   := FVehicle.FPlatform_Ident;
         obj.FVehicle.FHeliLimitation   := FVehicle.FHeliLimitation;
         obj.FNote                      := FNote ;

         if obj.FBlind_Zone = nil then
            obj.FBlind_Zone := TBlind_Zone.Create ;
         obj.FBlind_Zone.FData := FBlind_Zone.FData ;

         for j := low(FBlind) to High(FBlind) do begin
           blind := TBlind_Zone.Create;
           blind.FData := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;

         for j := low(FPattern_Sonar) to High(FPattern_Sonar) do begin
           pattern := TPattern_Sonar.Create;
           pattern.Event.FData := FPattern_Sonar[j].Event ;
           pattern.Pattern.FData := FPattern_Sonar[j].Pattern ;
           obj.FPattern_Sonar.Add(pattern);
         end;

         for j := low(FScripted_sonar) to High(FScripted_sonar) do begin
           scripted := TScripted_Sonar.Create;
           scripted.Event.FData := FScripted_sonar[j].Event ;
           scripted.Behav.FData := FScripted_sonar[j].Behav ;
           obj.FScripted_sonar.Add(scripted);
         end;

         for j := low(FPOD) to High(FPOD) do begin
           pod := TPOD_vs_SNR_Point.Create;
           pod.FData := FPOD[j].FData ;
           obj.FPOD.Add(pod);
         end;

         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetEOSensorListFromVehicleID (const idx : integer ; var alist : TList );
var
  i,j   : integer;
  obj   : TEO_On_Board ;
  blind : TBlind_Zone ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FREOSensor) to High(FREOSensor) do begin
    with FREOSensor[i].EODefinition do begin
      if FREOSensor[i].S.Owner = idx then begin
         obj := TEO_On_Board.Create;
         obj.FData                      := FData ;
         obj.FEO_Def                    := FEO_Def ;
         obj.FNote                      := FNote ;
         obj.FVehicle.FData             := FVehicle.FData;
         obj.FVehicle.FPlatform_Ident   := FVehicle.FPlatform_Ident;
         obj.FVehicle.FHeliLimitation   := FVehicle.FHeliLimitation;
         if obj.FBlind_Zone = nil then
            obj.FBlind_Zone := TBlind_Zone.Create ;
         obj.FBlind_Zone.FData := FBlind_Zone.FData ;
         for j := low(FBlind) to High(FBlind) do begin
           blind := TBlind_Zone.Create;
           blind.FData := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;
         alist.Add(obj);
      end;
    end;

  end;
end;

procedure TRecObjectSnapshot.SetIFFSensorListFromVehicleID (const idx : integer ; var alist : TList );
var
  i, j : integer;
  obj : TIFF_Sensor_On_Board ;
  scripted : TScripted_IFF;
  pattern  : TPattern_IFF;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRIFFSensor) to High(FRIFFSensor) do begin
    with FRIFFSensor[i].IFFDefinition do begin
      if FRIFFSensor[i].S.Owner = idx then begin
         obj := TIFF_Sensor_On_Board.Create;
         obj.FData                      := FData ;
         obj.FVehicle.FData             := FVehicle.FData;
         obj.FVehicle.FPlatform_Ident   := FVehicle.FPlatform_Ident;
         obj.FVehicle.FHeliLimitation   := FVehicle.FHeliLimitation;

         for j := low(FPattern_IFF) to High(FPattern_IFF) do begin
           pattern := TPattern_IFF.Create;
           pattern.Event.FData := FPattern_IFF[j].Event ;
           pattern.Pattern.FData := FPattern_IFF[j].Pattern ;
           obj.FPattern_IFF.Add(pattern);
         end;

         for j := low(FScripted_IFF) to High(FScripted_IFF) do begin
           scripted := TScripted_IFF.Create;
           scripted.Event.FData := FScripted_IFF[j].Event ;
           scripted.Behav.FData := FScripted_IFF[j].Behav ;
           obj.FScripted_IFF.Add(scripted);
         end;

         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetMADSensorListFromVehicleID (const idx : integer ; var alist : TList );
var
  i: integer;
  obj : TMAD_Sensor_On_Board ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRMADSensor) to High(FRMADSensor) do begin
    if FRMADSensor[i].S.Owner = idx then begin
       obj := TMAD_Sensor_On_Board.Create;
       obj.FData    := FRMADSensor[i].MADDefinition.FData ;
       obj.FMAD_Def     := FRMADSensor[i].MADDefinition.FMAD_Def ;
       obj.FVehicle.FData   := FRMADSensor[i].MADDefinition.FVehicle.FData;
       obj.FVehicle.FPlatform_Ident   := FRMADSensor[i].MADDefinition.FVehicle.FPlatform_Ident;
       obj.FVehicle.FHeliLimitation   := FRMADSensor[i].MADDefinition.FVehicle.FHeliLimitation;
       alist.Add(obj);
    end;
  end;
end;

procedure TRecObjectSnapshot.SetFCRSensorListFromVehicleID (const idx : integer ; var alist : TList );
var
  i,j : integer;
  obj : TFCR_On_Board ;
  blind : TBlind_Zone ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRFCRSensor) to High(FRFCRSensor) do begin
    with FRFCRSensor[i].FCRDefinition do begin
      if FRFCRSensor[i].S.Owner = idx then begin
         obj := TFCR_On_Board.Create;
         obj.FData    := FData ;
         obj.FFCR_def := FFCR_def ;
         if obj.FBlind_Zone = nil then
              obj.FBlind_Zone := TBlind_Zone.Create ;
         obj.FBlind_Zone.FData := FBlind_Zone.FData ;
         for j := low(FBlind) to High(FBlind) do begin
           blind := TBlind_Zone.Create;
           blind.FData := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;
         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetVisualSensorListFromVehicleID (const idx : integer ; var alist : TList );
var
  i,j: integer;
  obj : TVisual_Sensor_On_Board ;
  blind : TBlind_Zone ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRVisual) to High(FRVisual) do begin
    with FRVisual[i].VisualDefinition do begin
      if FRVisual[i].S.Owner  = idx then begin
         obj := TVisual_Sensor_On_Board.Create;
         obj.FData                      := FData ;
         obj.FVehicle.FData             := FVehicle.FData;
         obj.FVehicle.FPlatform_Ident   := FVehicle.FPlatform_Ident;
         obj.FVehicle.FHeliLimitation   := FVehicle.FHeliLimitation;
         if obj.FBlind_Zone = nil then
              obj.FBlind_Zone := TBlind_Zone.Create ;
         obj.FBlind_Zone.FData := FBlind_Zone.FData ;
         for j := low(FBlind) to High(FBlind) do begin
           blind := TBlind_Zone.Create;
           blind.FData := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;
         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetMissileOnVehicleListFromVehicleID (const idx : integer ; var alist : TList );
var
  i, j : integer;
  obj           : TMissile_On_Board ;
  plauncher     : TFitted_Weap_Launcher_On_Board;
  weaponScript  : TScripted_Weapon ;
  pattern       : TPattern_Weapon ;
  blind         : TBlind_Zone;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRMissileOnVehicle) to High(FRMissileOnVehicle) do begin
    with FRMissileOnVehicle[i].MissileDefinition do begin
      if FRMissileOnVehicle[i].Owner  = idx then begin
         obj := TMissile_On_Board.Create;
         obj.FData := FData ;
         obj.FDef := FDef ;
         obj.FLaunch := FLaunch ;
         obj.FNote := FNote ;
         obj.FVehicle.FData := FVehicle.FData ;
         obj.FVehicle.FPlatform_Ident := FVehicle.FPlatform_Ident ;
         obj.FVehicle.FHeliLimitation := FVehicle.FHeliLimitation ;
         for j := low(FLaunchs) to High(FLaunchs) do begin
           plauncher := TFitted_Weap_Launcher_On_Board.Create;
           plauncher.FData := FLaunchs[j].FData ;
           obj.FLaunchs.Add(plauncher);
         end;
         for j := low(FScript_Missile) to High(FScript_Missile) do begin
           weaponScript             := TScripted_Weapon.Create;
           weaponScript.Event.FData := FScript_Missile[j].Event ;
           weaponScript.Behav.FData := FScript_Missile[j].Behav ;
           obj.FScript_Missile.Add(weaponScript);
         end;
         for j := low(FPattern_Missile) to High(FPattern_Missile) do begin
           pattern                := TPattern_Weapon.Create;
           pattern.Event.FData    := FPattern_Missile[j].Event ;
           pattern.Pattern.FData  := FPattern_Missile[j].Pattern ;
           obj.FPattern_Missile.Add(pattern);
         end;
         for j := low(FBlind) to High(FBlind) do begin
           blind        := TBlind_Zone.Create;
           blind.FData  := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;
         alist.Add(obj);
      end; // end if
    end;
  end;
end;

procedure TRecObjectSnapshot.SetTorpedoOnVehicleListFromVehicleID (const idx : integer ; var alist : TList );
var
  i, j : integer;
  obj : TTorpedo_On_Board ;
  weaponScript  : TScripted_Weapon ;
  pattern       : TPattern_Weapon ;
  blind         : TBlind_Zone;
  poh           : TTorpedo_POH_Modifier;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRTorpedoOnVehicle) to High(FRTorpedoOnVehicle) do begin
    with FRTorpedoOnVehicle[i].TorpedoDefinition do begin
      if FRTorpedoOnVehicle[i].Owner = idx then begin
         obj := TTorpedo_On_Board.Create;
         obj.FData := FData ;
         obj.FDef := FDef ;
         obj.FLaunch := FLaunch ;
         obj.FNote  := FNote ;
         obj.FVehicle.FData := FVehicle.FData ;
         obj.FVehicle.FPlatform_Ident := FVehicle.FPlatform_Ident ;
         obj.FVehicle.FHeliLimitation := FVehicle.FHeliLimitation ;

         for j := low(FScript_Torpedo) to High(FScript_Torpedo) do begin
           weaponScript             := TScripted_Weapon.Create;
           weaponScript.Event.FData := FScript_Torpedo[j].Event ;
           weaponScript.Behav.FData := FScript_Torpedo[j].Behav ;
           obj.FScript_Torpedo.Add(weaponScript);
         end;
         for j := low(FPattern_Torpedo) to High(FPattern_Torpedo) do begin
           pattern                := TPattern_Weapon.Create;
           pattern.Event.FData    := FPattern_Torpedo[j].Event ;
           pattern.Pattern.FData  := FPattern_Torpedo[j].Pattern ;
           obj.FPattern_Torpedo.Add(pattern);
         end;
         for j := low(FBlind) to High(FBlind) do begin
           blind        := TBlind_Zone.Create;
           blind.FData  := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;
         for j := low(FAspectPOH) to High(FAspectPOH) do begin
           poh        := TTorpedo_POH_Modifier.Create;
           poh.FData  := FAspectPOH[j].FData ;
           obj.FAspectPOH.Add(poh);
         end;


         alist.Add(obj);

      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetGunOnVehicleListFromVehicleID (const idx : integer ; var alist : TList );
var
  i,j : integer;
  obj : TGun_Definition ;
  blind : TBlind_Zone;
  ppoh  : TGun_POH_vs_Range;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRGunOnVehicle) to High(FRGunOnVehicle) do begin
    with FRGunOnVehicle[i].GunDefinition do begin
      if FRGunOnVehicle[i].Owner  = idx then begin
         obj := TGun_Definition.Create;
         obj.FData := FData ;
         obj.FPoint := TPoint_Effect_On_Board.Create;
         obj.FPoint.FData := FPoint.FData;
         obj.FGun_POH := FGun_POH ;
         obj.FNote := FNote ;

         for j := low(FBlind) to High(FBlind) do begin
           blind        := TBlind_Zone.Create;
           blind.FData  := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;
         for j := low(FPOH) to High(FPOH) do begin
           ppoh        := TGun_POH_vs_Range.Create;
           ppoh.FData    := FPOH[j].FData ;
           obj.FPOH.Add(ppoh);
         end;

         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetBomsOnVehicleListFromVehicleID (const idx : integer ; var alist : TList );
var
  i,j: integer;
  obj : TBomb_Definition ;
  //blind : TBlind_Zone;
  ppoh  : TBomb_POH_vs_Range;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRBombOnVehicle) to High(FRBombOnVehicle) do begin
    with FRBombOnVehicle[i].BombDefinition do begin
      if FRBombOnVehicle[i].Owner = idx then begin
         obj := TBomb_Definition.Create;
         obj.FData := FData ;
         obj.FBomb_POH := FBomb_POH ;
         obj.FNote := FNote;
         {
         for j := low(FBlind) to High(FBlind) do begin
           blind        := TBlind_Zone.Create;
           blind.FData  := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;
         }
         for j := low(FPOH) to High(FPOH) do begin
           ppoh        := TBomb_POH_vs_Range.Create;
           ppoh.FData  := FPOH[j].FData ;
           obj.FPOH.Add(ppoh);
         end;

         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetMineOnVehicleListFromVehicleID (const idx : integer ; var alist : TList );
var
  i, j : integer;
  obj : TMine_On_Board ;
  weaponScript  : TScripted_Weapon ;
  pattern       : TPattern_Weapon ;
  blind         : TBlind_Zone;
  pod           : TMine_POD_vs_Range;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRMineOnVehicle) to High(FRMineOnVehicle) do begin
    with FRMineOnVehicle[i].MineDefinition do begin
      if FRMineOnVehicle[i].Owner  = idx then begin
         obj := TMine_On_Board.Create;
         obj.FData := FData ;
         obj.FNote := FNote ;
         obj.FMine_Def := FMine_Def ;
         obj.FMine_POD := FMine_POD ;
         //obj.FPI.FData := FPI.FData ;
         //obj.FPI.FActivation := FPI.UnitActivation ;
         obj.FVehicle.FData := FVehicle.FData ;
         obj.FVehicle.FPlatform_Ident := FVehicle.FPlatform_Ident ;
         obj.FVehicle.FHeliLimitation := FVehicle.FHeliLimitation ;

         for j := low(FScript_Mine) to High(FScript_Mine) do begin
           weaponScript             := TScripted_Weapon.Create;
           weaponScript.Event.FData := FScript_Mine[j].Event ;
           weaponScript.Behav.FData := FScript_Mine[j].Behav ;
           obj.FScript_Mine.Add(weaponScript);
         end;
         for j := low(FPattern_Mine) to High(FPattern_Mine) do begin
           pattern                := TPattern_Weapon.Create;
           pattern.Event.FData    := FPattern_Mine[j].Event ;
           pattern.Pattern.FData  := FPattern_Mine[j].Pattern ;
           obj.FPattern_Mine.Add(pattern);
         end;
         for j := low(FBlind) to High(FBlind) do begin
           blind        := TBlind_Zone.Create;
           blind.FData  := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;
         for j := low(FPOD) to High(FPOD) do begin
           pod        := TMine_POD_vs_Range.Create;
           pod.FData  := FPOD[j].FData ;
           obj.FPOD.Add(pod);
         end;

         alist.Add(obj);
      end;
    end;
  end;
end;



procedure TRecObjectSnapshot.SetAllAcoustic_Decoy_On_Board(const idx : integer ; var alist : TList );
var
  i : integer;
  obj : TAcoustic_Decoy_On_Board ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRAcousticDecoyOnVehicle) to High(FRAcousticDecoyOnVehicle) do begin
    with FRAcousticDecoyOnVehicle[i].ECMDefinition do begin
      if FRAcousticDecoyOnVehicle[i].Owner  = idx then begin
         obj := TAcoustic_Decoy_On_Board.Create;
         obj.FData := FData ;
         obj.FNote := FNote ;
         obj.FAccousticDecoy_Def   := FAccousticDecoy_Def;
         obj.FAccousticDecoy_POH   := FAccousticDecoy_POH;
         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetAllAir_Bubble_Mount(const idx : integer ; var alist : TList );
var
  i : integer;
  obj : TAir_Bubble_Mount ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRAirBubbleOnVehicle) to High(FRAirBubbleOnVehicle) do begin
    with FRAirBubbleOnVehicle[i].AirBubbleMount do begin
      if FRAirBubbleOnVehicle[i].Owner  = idx then begin
         obj := TAir_Bubble_Mount.Create;
         obj.FData := FData ;
         obj.FNote := FNote ;
         obj.FAirBubble_Def   := FAirBubble_Def;
         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetAllChaff_On_Board(const idx : integer ; var alist : TList );
var
  i,j : integer;
  obj : TChaff_On_Board ;
  scripted : TScripted_Chaff ;
  pattern  : TPattern_Chaff;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRChaffOnVehicle) to High(FRChaffOnVehicle) do begin
    with FRChaffOnVehicle[i].ChaffDefinition do begin
      if FRChaffOnVehicle[i].Owner  = idx then begin
         obj := TChaff_On_Board.Create;
         obj.FData := FData ;
         obj.FNote := FNote ;
         obj.FChaff_Def := FChaff_Def ;
         for j := low(FScripted_Chaffs) to High(FScripted_Chaffs) do begin
           scripted             := TScripted_Chaff.Create;
           scripted.Event.FData := FScripted_Chaffs[j].Event ;
           scripted.Behav.FData := FScripted_Chaffs[j].Behav ;
           obj.FScripted_Chaffs.Add(scripted);
         end;
         for j := low(FScripted_Pattern) to High(FScripted_Pattern) do begin
           pattern                := TPattern_Chaff.Create;
           pattern.Event.FData    := FScripted_Pattern[j].Event ;
           pattern.Pattern.FData  := FScripted_Pattern[j].Pattern ;
           obj.FScripted_Pattern.Add(pattern);
         end;

         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetAllChaff_Launcher_On_Board(const idx : integer ; var alist : TList );
var
  i  : integer;
  obj : TChaff_Launcher_On_Board ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRChaffLauncher) to High(FRChaffLauncher) do begin
    with FRChaffLauncher[i].LauncherDefinition do begin
      if FRChaffLauncher[i].Owner = idx then begin
         obj := TChaff_Launcher_On_Board.Create;
         obj.FData := FData ;
         alist.Add(obj);
      end;
    end;
  end;
end;




procedure TRecObjectSnapshot.SetAllFloating_Decoy_On_Board(const idx : integer ; var alist : TList );
var
  i  : integer;
  obj : TFloating_Decoy_On_Board ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRFloatingDecoyOnVehicle) to High(FRFloatingDecoyOnVehicle) do begin
    with FRFloatingDecoyOnVehicle[i].FloatingDecoyDefinition do begin
      if FRFloatingDecoyOnVehicle[i].Owner  = idx then begin
         obj := TFloating_Decoy_On_Board.Create;
         obj.FData := FData ;
         obj.FFloatingDecoy_Def := FFloatingDecoy_Def ;
         obj.FNote := FNote ;
         alist.Add(obj);
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SetAllJammer_On_Board(const idx : integer ; var alist : TList );
var
  i   : integer;
  obj : TJammer_On_Board ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(FRRadarNoiseJammerOnVehicle) to High(FRRadarNoiseJammerOnVehicle) do begin
    with FRRadarNoiseJammerOnVehicle[i].RadarJammerDefinition do begin
      if FRRadarNoiseJammerOnVehicle[i].Owner  = idx then begin
         obj := TJammer_On_Board.Create;
         obj.FData := FData ;
         obj.FDef  := FDef ;
         obj.FNote := FNote ;
         alist.Add(obj);
      end;
    end;
  end;
end;


procedure TRecObjectSnapshot.SetHybrid_Definition(const ss : _SS_TT3Vehicle ; var alist : TList );
var
  i, j : integer;
  obj : TFitted_Weapon_On_Board ;
  h   : THybrid_On_Board ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;

  for i := low(ss.VehicleDefinition.FHybridOnBoard) to High(ss.VehicleDefinition.FHybridOnBoard) do begin
     obj := TFitted_Weapon_On_Board.Create;
     obj.FData := ss.VehicleDefinition.FHybridOnBoard[i].FData ;
     for j := Low(ss.VehicleDefinition.FHybridOnBoard[i].FHybrid) to
              high(ss.VehicleDefinition.FHybridOnBoard[i].FHybrid) do  begin
         h := THybrid_On_Board.Create;
         h.FData        := ss.VehicleDefinition.FHybridOnBoard[i].FHybrid[j].FData ;
         h.FHybridData  := ss.VehicleDefinition.FHybridOnBoard[i].FHybrid[j].FHybridData ;
         h.FTorpedo_Def := ss.VehicleDefinition.FHybridOnBoard[i].FHybrid[j].FTorpedo_Def ;
         h.FMissile_Def := ss.VehicleDefinition.FHybridOnBoard[i].FHybrid[j].FMissile_Def ;
         obj.FHybrid.Add(h);
     end;
     alist.Add(obj);
  end;
end;

procedure TRecObjectSnapshot.SetAllDefensive_Jammer_On_Board(const ss : _SS_TT3Vehicle ; var alist : TList );
var
  i  : integer;
  obj : TDefensive_Jammer_On_Board ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(ss.VehicleDefinition.FDefensiveJammerOnBoard) to High(ss.VehicleDefinition.FDefensiveJammerOnBoard) do begin
    with ss.VehicleDefinition.FDefensiveJammerOnBoard[i] do begin
         obj := TDefensive_Jammer_On_Board.Create;
         obj.FData := FData ;
         obj.FDefensiveJammer_Def  := FDefensiveJammer_Def ;
         obj.FNote := FNote ;
         alist.Add(obj);
    end;
  end;
end;

procedure TRecObjectSnapshot.SetAllInfrared_Decoy_On_Board(const ss : _SS_TT3Vehicle ; var alist : TList );
var
  i, j : integer;
  obj : TInfrared_Decoy_On_Board ;
  weaponScript  : TScripted_Infrared ;
  pattern       : TPattern_Infrared ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(ss.VehicleDefinition.FInfraredecoyOnBoard) to High(ss.VehicleDefinition.FInfraredecoyOnBoard) do begin
    with ss.VehicleDefinition.FInfraredecoyOnBoard[i] do begin
         obj := TInfrared_Decoy_On_Board.Create;
         obj.FData := FData ;
         for j := low(FScripted_Infra) to High(FScripted_Infra) do begin
           weaponScript             := TScripted_Infrared.Create;
           weaponScript.Event.FData := FScripted_Infra[j].Event ;
           weaponScript.Behav.FData := FScripted_Infra[j].Behav ;
           obj.FScripted_Infra.Add(weaponScript);
         end;
         for j := low(FPattern_Infra) to High(FPattern_Infra) do begin
           pattern                := TPattern_Infrared.Create;
           pattern.Event.FData    := FPattern_Infra[j].Event ;
           pattern.Pattern.FData  := FPattern_Infra[j].Pattern ;
           obj.FPattern_Infra.Add(pattern);
         end;
         alist.Add(obj);
    end;
  end;
end;

procedure TRecObjectSnapshot.SetAllPointEffect_On_Board(const ss : _SS_TT3Vehicle ; var alist : TList );
var
  i, j : integer;
  obj : TPoint_Effect_On_Board ;
  weaponScript  : TScripted_Weapon ;
  pattern       : TPattern_Weapon ;
  blind         : TBlind_Zone;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(ss.VehicleDefinition.FPointEffectsOnBoard) to High(ss.VehicleDefinition.FPointEffectsOnBoard) do begin
    with ss.VehicleDefinition.FPointEffectsOnBoard[i] do begin
         obj := TPoint_Effect_On_Board.Create;
         obj.FData := FData ;
         obj.FBlind_Zone.FData := FBlind_Zone.FData ;
         for j := low(FScripted_Point) to High(FScripted_Point) do begin
           weaponScript             := TScripted_Weapon.Create;
           weaponScript.Event.FData := FScripted_Point[j].Event ;
           weaponScript.Behav.FData := FScripted_Point[j].Behav ;
           obj.FScripted_Point.Add(weaponScript);
         end;
         for j := low(FPattern_Point) to High(FPattern_Point) do begin
           pattern                := TPattern_Weapon.Create;
           pattern.Event.FData    := FPattern_Point[j].Event ;
           pattern.Pattern.FData  := FPattern_Point[j].Pattern ;
           obj.FPattern_Point.Add(pattern);
         end;
         for j := low(FBlind) to High(FBlind) do begin
           blind        := TBlind_Zone.Create;
           blind.FData  := FBlind[j].FData ;
           obj.FBlind.Add(blind);
         end;
         alist.Add(obj);
    end;
  end;
end;

procedure TRecObjectSnapshot.SetAllTowed_Jammer_Decoy_On_Board(const ss : _SS_TT3Vehicle ; var alist : TList );
var
  i : integer;
  obj : TTowed_Jammer_Decoy_On_Board ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(ss.VehicleDefinition.FTowedJammerDecoyOnBoard) to High(ss.VehicleDefinition.FTowedJammerDecoyOnBoard) do begin
    with ss.VehicleDefinition.FTowedJammerDecoyOnBoard[i] do begin
         obj := TTowed_Jammer_Decoy_On_Board.Create;
         obj.FData := FData ;
         obj.FDef  := FDef ;
         obj.FNote := FNote ;
         alist.Add(obj);
    end;
  end;
end;

procedure TRecObjectSnapshot.SetHosted_Platform(const ss : _SS_TT3Vehicle ; var alist : TList );
var
  i   : integer;
  obj : THosted_Platform ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(ss.EmbarkedVehicles) to High(ss.EmbarkedVehicles) do begin
    with ss.EmbarkedVehicles[i] do begin
       obj := THosted_Platform.Create;
       obj.FData         := EmbarkedVehicle ;
//       obj.FVehicle      := ss.VehicleDefinition.FData ;
       obj.FVehicle      := EmbarkDefinition;
       alist.Add(obj);
    end;
  end;
end;

procedure TRecObjectSnapshot.SetAllSonobuoy_On_Board(const ss : _SS_TT3Vehicle ; var alist : TList );
var
  i   : integer;
  obj : TSonobuoy_On_Board ;
begin
  if not Assigned(alist) then
    alist := TList.Create
  else
    alist.Clear;
  for i := low(ss.VehicleDefinition.FSonobuoyOnBoard) to High(ss.VehicleDefinition.FSonobuoyOnBoard) do begin
    with ss.VehicleDefinition.FSonobuoyOnBoard[i] do begin
       obj := TSonobuoy_On_Board.Create;
       obj.FData := FData ;
       obj.FDef  := FDef ;
       alist.Add(obj);
    end;
  end;
end;


function TRecObjectSnapshot.GetRadarRecFromRadarID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRRadar) to High(FRRadar) do begin
    if FRRadar[i].S.SST3Unit.InstanceIndex = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetSonarIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRSonar) to High(FRSonar) do begin
    if FRSonar[i].S.SST3Unit.InstanceIndex = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetIFFSensorIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRIFFSensor) to High(FRIFFSensor) do begin
    if FRIFFSensor[i].S.SST3Unit.InstanceIndex = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetEOSensorIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FREOSensor) to High(FREOSensor) do begin
    if FREOSensor[i].S.SST3Unit.InstanceIndex = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetVisualIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRVisual) to High(FRVisual) do begin
    if FRVisual[i].S.SST3Unit.InstanceIndex = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetMADSensorIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRMADSensor) to High(FRMADSensor) do begin
    if FRMADSensor[i].S.SST3Unit.InstanceIndex = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetFCRSensorIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRFCRSensor) to High(FRFCRSensor) do begin
    if FRFCRSensor[i].S.SST3Unit.InstanceIndex = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetESMRecFromESMID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRESMSensor) to High(FRESMSensor) do begin
    if FRESMSensor[i].S.SST3Unit.InstanceIndex = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetMissileOnVehiceFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRMissileOnVehicle) to High(FRMissileOnVehicle) do begin
    if FRMissileOnVehicle[i].W.P.SST3Unit.InstanceIndex  = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetTorpedoOnVehiceFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRTorpedoOnVehicle) to High(FRTorpedoOnVehicle) do begin
    if FRTorpedoOnVehicle[i].W.P.SST3Unit.InstanceIndex  = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetGunOnVehiceFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRGunOnVehicle) to High(FRGunOnVehicle) do begin
    if FRGunOnVehicle[i].W.P.SST3Unit.InstanceIndex  = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetBomsOnVehiceFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRBombOnVehicle) to High(FRBombOnVehicle) do begin
    if FRBombOnVehicle[i].W.P.SST3Unit.InstanceIndex  = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetMinesOnVehiceFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRMineOnVehicle) to High(FRMineOnVehicle) do begin
    if FRMineOnVehicle[i].W.P.SST3Unit.InstanceIndex = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetVectacIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRVectac) to High(FRVectac) do begin
    if FRVectac[i].Owner = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetChaffOnVehiceIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRChaffOnVehicle) to High(FRChaffOnVehicle) do begin
//    if FRChaffOnVehicle[i].CM.SST3Unit.InstanceIndex  = ID then begin
    if FRChaffOnVehicle[i].Owner  = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetDefensiveJammerOnVehicleIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRDefensiveJammerOnVehicle) to High(FRDefensiveJammerOnVehicle) do begin
    if FRDefensiveJammerOnVehicle[i].CM.SST3Unit.InstanceIndex  = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;


function TRecObjectSnapshot.GetTowedJammerOnVehicleIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRTowedJammerOnVehicle) to High(FRTowedJammerOnVehicle) do begin
    if FRTowedJammerOnVehicle[i].CM.SST3Unit.InstanceIndex  = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetInfraredDecoyOnVehicleIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRInfraredDecoyOnVehicle) to High(FRInfraredDecoyOnVehicle) do begin
    if FRInfraredDecoyOnVehicle[i].CM.SST3Unit.InstanceIndex  = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetChaffLauncherOnVehiceIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRChaffLauncher) to High(FRChaffLauncher) do begin
    if FRChaffLauncher[i].CM.SST3Unit.InstanceIndex  = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetAcousticDecoyOnVehicleIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRAcousticDecoyOnVehicle) to High(FRAcousticDecoyOnVehicle) do begin
    if FRAcousticDecoyOnVehicle[i].CM.SST3Unit.InstanceIndex  = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetAirBubbleOnVehicleIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRAirBubbleOnVehicle) to High(FRAirBubbleOnVehicle) do begin
    if FRAirBubbleOnVehicle[i].AirBubbleMount.FData.Air_Bubble_Instance_Index = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

function TRecObjectSnapshot.GetRadarNoiseJammerOnVehicleIndexFromID (const ID : integer ) : integer;
var
  i: integer;
begin
  Result := -1;
  for i := low(FRRadarNoiseJammerOnVehicle) to High(FRRadarNoiseJammerOnVehicle) do begin
    if FRRadarNoiseJammerOnVehicle[i].CM.SST3Unit.InstanceIndex = ID then begin
       Result := i ;
       Break ;
    end;
  end;
end;

procedure TRecObjectSnapshot.SnapshotSetWeaponOnVehicle( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ;
    obj : TObject ; var s : string );
var
  idx    : integer ;
  piT3   : TT3PlatformInstance ;
begin
  if obj is TT3MissilesOnVehicle then begin
     idx := lRec.GetMissileOnVehiceFromID(TT3MissilesOnVehicle(obj).InstanceIndex);
     if idx >= 0 then begin
        recSSMissilesOnVehicle := lRec.FRMissileOnVehicle[idx];
        TT3MissilesOnVehicle(obj).SetSnapshotData(recSSMissilesOnVehicle);
     end;
  end else
  if obj is TT3TorpedoesOnVehicle then begin
     idx := lRec.GetTorpedoOnVehiceFromID(TT3TorpedoesOnVehicle(obj).InstanceIndex);
     if idx >= 0 then begin
        recSSTorpedoOnVehicle := lRec.FRTorpedoOnVehicle[idx];
        TT3TorpedoesOnVehicle(obj).SetSnapshotData(recSSTorpedoOnVehicle);
     end;
  end else
  if obj is TT3GunOnVehicle then begin
     idx := lRec.GetGunOnVehiceFromID(TT3GunOnVehicle(obj).InstanceIndex);
     if idx >= 0 then begin
        recSSGunOnVehicle := lRec.FRGunOnVehicle[idx];
        TT3GunOnVehicle(obj).SetSnapshotData(recSSGunOnVehicle);
     end;
  end else
  if obj is TT3BombONVehicle then begin
     idx := lRec.GetBomsOnVehiceFromID(TT3BombONVehicle(obj).InstanceIndex);
     if idx >= 0 then begin
        recSSBomOnVehicle := lRec.FRBombOnVehicle[idx];
        TT3BombONVehicle(obj).SetSnapshotData(recSSBomOnVehicle);
     end;
  end else
  if obj is TT3MineOnVehicle then begin
     idx := lRec.GetMinesOnVehiceFromID(TT3MineOnVehicle(obj).InstanceIndex);
     if idx >= 0 then begin
        recSSMineOnVehicle := lRec.FRMineOnVehicle[idx];
        TT3MineOnVehicle(obj).SetSnapshotData(recSSMineOnVehicle);
     end;
  end else
  if obj is TT3Vectac then begin
     idx := lRec.GetVectacIndexFromID(TT3PlatformInstance(TT3Vectac(obj).Owner).InstanceIndex);
     if idx >= 0 then begin
        recSSVectac := lRec.FRVectac[idx];

        piT3 := __snapshot_getT3PI(sim,recSSVectac.Owner);
        if piT3 <> nil then
            TT3Vectac(obj).Owner := piT3 ;

        piT3 := __snapshot_getT3PI(sim,recSSVectac.Target);
        if piT3 <> nil then
            TT3Vectac(obj).Target := piT3 ;

        piT3 := __snapshot_getT3PI(sim,recSSVectac.WeaponCarrier);
        if piT3 <> nil then
            TT3Vectac(obj).WeaponCarrier := piT3 ;

        TT3Vectac(obj).SetSnapshotData(recSSVectac);
     end;
  end else
     s := 'Snapshot Unlisted Vehicle Weapons "' + obj.ClassName +  '".';
end;




procedure TRecObjectSnapshot.SnapshotSetDeviceSensor( obj : TObject ; var s : string );
var
  idx : integer ;
begin
  if obj = nil then exit ;
  s := '';
  if obj is TT3Radar then begin
     idx := lRec.GetRadarRecFromRadarID(TT3Radar(obj).InstanceIndex);
     recSSRadar := lRec.FRRadar[idx];
     TT3Radar(obj).SetSnapshotData(recSSRadar);
  end else
  if obj is TT3Sonar then begin
     idx := lRec.GetSonarIndexFromID(TT3Sonar(obj).InstanceIndex);
     recSSSonar := lRec.FRSonar[idx];
     TT3Sonar(obj).SetSnapshotData(recSSSonar);
  end else
  if obj is TT3MADSensor then begin
     idx := lRec.GetMADSensorIndexFromID(TT3MADSensor(obj).InstanceIndex);
     recSSMADSensor := lRec.FRMADSensor[idx];
     TT3MADSensor(obj).SetSnapshotData(recSSMADSensor);
  end else
  if obj is TT3FCRSensor then begin
     idx := lRec.GetFCRSensorIndexFromID(TT3FCRSensor(obj).InstanceIndex);
     recSSFCRSensor := lRec.FRFCRSensor[idx];
     TT3FCRSensor(obj).SetSnapshotData(recSSFCRSensor);
  end else
  if obj is TT3Visual then begin
     idx := lRec.GetVisualIndexFromID(TT3Visual(obj).InstanceIndex);
     recSSVisual := lRec.FRVisual[idx];
     TT3Visual(obj).SetSnapshotData(recSSVisual);
  end else
  if obj is TT3IFFSensor then begin
     idx := lRec.GetIFFSensorIndexFromID(TT3IFFSensor(obj).InstanceIndex);
     recSSIFFSensor := lRec.FRIFFSensor[idx];
     TT3IFFSensor(obj).SetSnapshotData(recSSIFFSensor);
  end else
  if obj is TT3EOSensor then begin
     idx := lRec.GetEOSensorIndexFromID(TT3EOSensor(obj).InstanceIndex);
     recSSEOSensor := lRec.FREOSensor[idx];
     TT3EOSensor(obj).SetSnapshotData(recSSEOSensor);
  end else
  if obj is TT3ESMSensor then begin
     idx := lRec.GetESMRecFromESMID(TT3ESMSensor(obj).InstanceIndex);
     recSSESMSensor := lRec.FRESMSensor[idx];
     TT3ESMSensor(obj).SetSnapshotData(recSSESMSensor);
  end else
      s := 'Snapshot Unlisted Sensor on Device "' + obj.ClassName +  '".';
end;

procedure TRecObjectSnapshot.SnapshotSetDeviceCounterMeasure( obj : TObject ; var s : string);
var
  idx : integer ;
begin
  if obj = nil then exit ;
  s := '';
  if obj is TT3DefensiveJammerOnVehicle then begin
     idx := lRec.GetDefensiveJammerOnVehicleIndexFromID(TT3DefensiveJammerOnVehicle(obj).InstanceIndex);
     recSSDefensiveJammerOnVehicle := lRec.FRDefensiveJammerOnVehicle[idx];
     TT3DefensiveJammerOnVehicle(obj).SetSnapshotData(recSSDefensiveJammerOnVehicle);
  end else
  if obj is TT3TowedJammerOnVehicle then begin
     idx := lRec.GetTowedJammerOnVehicleIndexFromID(TT3TowedJammerOnVehicle(obj).InstanceIndex);
     recSSTowedJammerOnVehicle := lRec.FRTowedJammerOnVehicle[idx];
     TT3TowedJammerOnVehicle(obj).SetSnapshotData(recSSTowedJammerOnVehicle);
  end else
  if obj is TT3InfraredDecoyOnVehicle then begin
     idx := lRec.GetInfraredDecoyOnVehicleIndexFromID(TT3InfraredDecoyOnVehicle(obj).InstanceIndex);
     recSSInfraredDecoyOnVehicle := lRec.FRInfraredDecoyOnVehicle[idx];
     TT3InfraredDecoyOnVehicle(obj).SetSnapshotData(recSSInfraredDecoyOnVehicle);
  end else
  if obj is TT3ChaffOnVehicle then begin
     idx := lRec.GetChaffOnVehiceIndexFromID(TT3Unit(TT3ChaffOnVehicle(obj).Parent).InstanceIndex);
     recSSChaffOnVehicle := lRec.FRChaffOnVehicle[idx];
     TT3ChaffOnVehicle(obj).SetSnapshotData(recSSChaffOnVehicle);
  end else  if obj is TT3ChaffLauncher then begin
     idx := lRec.GetChaffLauncherOnVehiceIndexFromID(TT3ChaffLauncher(obj).InstanceIndex);
     recSSChaffLauncher := lRec.FRChaffLauncher[idx];
     TT3ChaffLauncher(obj).SetSnapshotData(recSSChaffLauncher);
  end else  if obj is TT3AcousticDecoyOnVehicle then begin
     idx := lRec.GetAcousticDecoyOnVehicleIndexFromID(TT3AcousticDecoyOnVehicle(obj).InstanceIndex);
     recSSAcousticDecoyOnVehicle := lRec.FRAcousticDecoyOnVehicle[idx];
     TT3AcousticDecoyOnVehicle(obj).SetSnapshotData(recSSAcousticDecoyOnVehicle);
  end else  if obj is TT3AirBubbleOnVehicle then begin
     idx := lRec.GetAirBubbleOnVehicleIndexFromID(TT3AirBubbleOnVehicle(obj).InstanceIndex);
     recSSAirBubbleOnVehicle := lRec.FRAirBubbleOnVehicle[idx];
     TT3AirBubbleOnVehicle(obj).SetSnapshotData(recSSAirBubbleOnVehicle);
  end else  if obj is TT3RadarNoiseJammerOnVehicle then begin
     idx := lRec.GetRadarNoiseJammerOnVehicleIndexFromID(TT3RadarNoiseJammerOnVehicle(obj).InstanceIndex);
     recSSRadarNoiseJammerOnVehicle := lRec.FRRadarNoiseJammerOnVehicle[idx];
     TT3RadarNoiseJammerOnVehicle(obj).SetSnapshotData(recSSRadarNoiseJammerOnVehicle);
  ////////////////////////////////////////////////////////////////////////////////
  end else
      s := 'Snapshot Unlisted CounterMeasure on Device "' + obj.ClassName +  '".';
end;

{Prince Snap}
procedure TRecObjectSnapshot.SnapshotGetShipingRoute( obj : TObject ; var s : string );
var
  i : Integer;
  objTemp : TObject;
begin
  if obj = nil then Exit;

  S := '';
  if obj is TMainShipingRoute then
  begin
    inc(ssCount.mTShipingRoute);
    SetLength(lRec.FRShipingRoute, ssCount.mTShipingRoute);
    lRec.FRShipingRoute[ssCount.mTShipingRoute-1] := TMainShipingRoute(obj).GetSnapshotData;

    if TMainShipingRoute(obj).FList.Count > 0 then
    begin
      for i:=0 to TMainShipingRoute(obj).FList.Count -1 do
      begin
        objTemp := TMainShipingRoute(obj).FList.Items[i];

        Inc(ssCount.mTPointRoute);;
        SetLength(lRec.FRShipingRoute[ssCount.mTShipingRoute-1].FList, ssCount.mTPointRoute);
        lRec.FRShipingRoute[ssCount.mTShipingRoute-1].FList[ssCount.mTPointRoute-1] := TPointRoute(objTemp).GetSnapshotData;
      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SnapshotGetPlotting( obj : TObject ; var s : string );
var
  i : Integer;
  objTemp : TObject;

begin
  if obj = nil then Exit;

  S := '';
  if obj is TIntelijenPlotting then
  begin
    {$REGION ' Intelijen '}
    inc(ssCount.mTMainPlotting);
    SetLength(lRec.FRMainPlotting, ssCount.mTMainPlotting);
    lRec.FRMainPlotting[ssCount.mTMainPlotting-1] := TIntelijenPlotting(obj).GetSnapshotData;

    for i:=0 to TIntelijenPlotting(obj).InfoList.Count -1 do
    begin
      objTemp := TIntelijenPlotting(obj).InfoList.Items[i];

      Inc(ssCount.mTIntelijenPlotting);;
      SetLength(lRec.FRMainPlotting[ssCount.mTMainPlotting-1].IntelInfoList, ssCount.mTIntelijenPlotting);
      lRec.FRMainPlotting[ssCount.mTMainPlotting-1].IntelInfoList[ssCount.mTIntelijenPlotting-1] := TIntelijenInfo(objTemp).GetSnapshotData;
    end;
    {$ENDREGION}
  end
  else if obj is TLogisticPlotting then
  begin
    {$REGION ' Logistic '}
    inc(ssCount.mTMainPlotting);
    SetLength(lRec.FRMainPlotting, ssCount.mTMainPlotting);
    lRec.FRMainPlotting[ssCount.mTMainPlotting-1] := TLogisticPlotting(obj).GetSnapshotData;

    for i:=0 to TLogisticPlotting(obj).LogisticList.Count -1 do
    begin
      objTemp := TLogisticPlotting(obj).LogisticList.Items[i];

      Inc(ssCount.mTLogisticPlotting);;
      SetLength(lRec.FRMainPlotting[ssCount.mTMainPlotting-1].LogisticOnBaseList, ssCount.mTLogisticPlotting);
      lRec.FRMainPlotting[ssCount.mTMainPlotting-1].LogisticOnBaseList[ssCount.mTLogisticPlotting-1] := TLogisticOnBase(objTemp).GetSnapshotData;
    end;
    {$ENDREGION}
  end
  else if obj is TPangkalanPlotting then
  begin
    {$REGION ' Pangkalan '}
    inc(ssCount.mTMainPlotting);
    SetLength(lRec.FRMainPlotting, ssCount.mTMainPlotting);
    lRec.FRMainPlotting[ssCount.mTMainPlotting-1] := TPangkalanPlotting(obj).GetSnapshotData;

    for i:=0 to TPangkalanPlotting(obj).VehiclesList.Count -1 do
    begin
      objTemp := TPangkalanPlotting(obj).VehiclesList.Items[i];

      Inc(ssCount.mTPangkalanPlotting);;
      SetLength(lRec.FRMainPlotting[ssCount.mTMainPlotting-1].VehicleOnBaseList, ssCount.mTPangkalanPlotting);
      lRec.FRMainPlotting[ssCount.mTMainPlotting-1].VehicleOnBaseList[ssCount.mTPangkalanPlotting-1] := TVehicleOnBase(objTemp).GetSnapshotData;
    end;
    {$ENDREGION}
  end
  else if obj is TRadarPlotting then
  begin
    {$REGION ' Radar '}
    inc(ssCount.mTMainPlotting);
    SetLength(lRec.FRMainPlotting, ssCount.mTMainPlotting);
    lRec.FRMainPlotting[ssCount.mTMainPlotting-1] := TRadarPlotting(obj).GetSnapshotData;
    {$ENDREGION}
  end
  else if obj is TPanahPlotting then
  begin
    {$REGION ' Panah '}
    inc(ssCount.mTMainPlotting);
    SetLength(lRec.FRMainPlotting, ssCount.mTMainPlotting);
    lRec.FRMainPlotting[ssCount.mTMainPlotting-1] := TPanahPlotting(obj).GetSnapshotData;
    {$ENDREGION}
  end
end;

procedure TRecObjectSnapshot.SnapshotGetOverlay(obj: TObject; var s: string);
var
  i : Integer;
  objTemp : TObject;
begin
  if obj = nil then Exit;

  S := '';
  if obj is TMainOverlayTemplate then
  begin
    inc(ssCount.mTMainOverlayTamplate);
    SetLength(lRec.FRMainOverlayTemplate, ssCount.mTMainOverlayTamplate);
    lRec.FRMainOverlayTemplate[ssCount.mTMainOverlayTamplate-1] := TMainOverlayTemplate(obj).GetSnapshotData;

    for i:=0 to TMainOverlayTemplate(obj).StaticList.Count -1 do
    begin
      objTemp := TMainOverlayTemplate(obj).StaticList.Items[i];

      if objTemp is TMainStaticShape then
      begin
        Inc(ssCount.mTMainStaticShape);;
        SetLength(lRec.FRMainOverlayTemplate[ssCount.mTMainOverlayTamplate-1].StaticList, ssCount.mTMainStaticShape);

        if objTemp is TTextStatic then
          lRec.FRMainOverlayTemplate[ssCount.mTMainOverlayTamplate-1].StaticList[ssCount.mTMainStaticShape-1] := TTextStatic(objTemp).GetSnapshotData
        else if objTemp is TLineStatic then
          lRec.FRMainOverlayTemplate[ssCount.mTMainOverlayTamplate-1].StaticList[ssCount.mTMainStaticShape-1] := TLineStatic(objTemp).GetSnapshotData
        else if objTemp is TRectangleStatic then
          lRec.FRMainOverlayTemplate[ssCount.mTMainOverlayTamplate-1].StaticList[ssCount.mTMainStaticShape-1] := TRectangleStatic(objTemp).GetSnapshotData
        else if objTemp is TCircleStatic then
          lRec.FRMainOverlayTemplate[ssCount.mTMainOverlayTamplate-1].StaticList[ssCount.mTMainStaticShape-1] := TCircleStatic(objTemp).GetSnapshotData
        else if objTemp is TEllipseStatic then
          lRec.FRMainOverlayTemplate[ssCount.mTMainOverlayTamplate-1].StaticList[ssCount.mTMainStaticShape-1] := TEllipseStatic(objTemp).GetSnapshotData
        else if objTemp is TArcStatic then
          lRec.FRMainOverlayTemplate[ssCount.mTMainOverlayTamplate-1].StaticList[ssCount.mTMainStaticShape-1] := TArcStatic(objTemp).GetSnapshotData
        else if objTemp is TSectorStatic then
          lRec.FRMainOverlayTemplate[ssCount.mTMainOverlayTamplate-1].StaticList[ssCount.mTMainStaticShape-1] := TSectorStatic(objTemp).GetSnapshotData
        else if objTemp is TGridStatic then
          lRec.FRMainOverlayTemplate[ssCount.mTMainOverlayTamplate-1].StaticList[ssCount.mTMainStaticShape-1] := TGridStatic(objTemp).GetSnapshotData
        else if objTemp is TPolygonStatic then
          lRec.FRMainOverlayTemplate[ssCount.mTMainOverlayTamplate-1].StaticList[ssCount.mTMainStaticShape-1] := TPolygonStatic(objTemp).GetSnapshotData

      end;
    end;
  end;
end;

procedure TRecObjectSnapshot.SnapshotGetBase(obj: TObject; var s: string);
var
  i : Integer;
  objTemp : TObject;
begin
  if obj = nil then Exit;

  S := '';

  if obj is TPlatformBase then
  begin
    inc(ssCount.mTPlatformBase);
    SetLength(lRec.FRPlatformBase, ssCount.mTPlatformBase);
//    lRec.FRPlatformBase[ssCount.mTPlatformBase-1] := TPlatformBase(obj).GetSnapshotData;
  end;
end;

procedure TRecObjectSnapshot.SnapshotGetPlatforms( obj : TObject ; var s : string );
begin
  if obj = nil then exit ;
  s := '';
  if obj is TT3Weapon then
  begin
    {$REGION ' Weapon Section '}
    if obj is TT3Missile then
    begin
      if obj is TT3Missile_SS then
      begin
        inc(ssCount.mMissileSSCount);
        SetLength(lRec.FRTT3Missile_SS,ssCount.mMissileSSCount);
        lRec.FRTT3Missile_SS[ssCount.mMissileSSCount-1] :=  TT3Missile_SS(obj).GetSnapshotData ;
      end
      else if obj is TT3Missile_SA then
      begin
        inc(ssCount.mMissileSACount);
        SetLength(lRec.FRTT3Missile_SA,ssCount.mMissileSACount);
        lRec.FRTT3Missile_SA[ssCount.mMissileSACount-1] :=  TT3Missile_SA(obj).GetSnapshotData ;
      end
      else if obj is TT3Missile_AA then
      begin
        inc(ssCount.mMissileAACount);
        SetLength(lRec.FRTT3Missile_AA,ssCount.mMissileAACount);
        lRec.FRTT3Missile_AA[ssCount.mMissileSACount-1] :=  TT3Missile_AA(obj).GetSnapshotData ;
      end
      else if obj is TT3Missile_AS then
      begin
        inc(ssCount.mMissileASCount);
        SetLength(lRec.FRTT3Missile_AS,ssCount.mMissileASCount);
        lRec.FRTT3Missile_AS[ssCount.mMissileSACount-1] :=  TT3Missile_AS(obj).GetSnapshotData ;
      end
      else if obj is TT3Missile_LA then
      begin
        inc(ssCount.mMissileLACount);
        SetLength(lRec.FRTT3Missile_LA,ssCount.mMissileLACount);
        lRec.FRTT3Missile_LA[ssCount.mMissileLACount-1] :=  TT3Missile_LA(obj).GetSnapshotData ;
      end
      else if obj is TT3Missile_HM then
      begin
        inc(ssCount.mMissileHMCount);
        SetLength(lRec.FRTT3Missile_HM,ssCount.mMissileHMCount);
        lRec.FRTT3Missile_HM[ssCount.mMissileHMCount-1] :=  TT3Missile_HM(obj).GetSnapshotData ;
      end
      else if obj is TT3Missile_TM then
      begin
        inc(ssCount.mMissileTMCount);
        SetLength(lRec.FRTT3Missile_TM,ssCount.mMissileTMCount);
        lRec.FRTT3Missile_TM[ssCount.mMissileTMCount-1] :=  TT3Missile_TM(obj).GetSnapshotData ;
      end;

    end
    else if obj is TT3Torpedo then
    begin
        inc(ssCount.mMissileTorpedCount);
        SetLength(lRec.FRTT3Torpedo,ssCount.mMissileTorpedCount);
        lRec.FRTT3Torpedo[ssCount.mMissileTorpedCount-1] :=  TT3Torpedo(obj).GetSnapshotData ;
    end
    else if obj is TT3Mine then
    begin
        inc(ssCount.mMissileMineCount);
        SetLength(lRec.FRTT3Mine,ssCount.mMissileMineCount);
        lRec.FRTT3Mine[ssCount.mMissileMineCount-1] :=  TT3Mine(obj).GetSnapshotData ;
    end
    else if obj is TT3Bomb then
    begin
        inc(ssCount.mMissileBombCount);
        SetLength(lRec.FRTT3Bomb,ssCount.mMissileBombCount);
        lRec.FRTT3Bomb[ssCount.mMissileBombCount-1] :=  TT3Bomb(obj).GetSnapshotData ;
    end
    else if obj is TT3GunShoot then
    begin
        inc(ssCount.mMissileGunShootCount);
        SetLength(lRec.FRTT3GunShoot,ssCount.mMissileGunShootCount);
        lRec.FRTT3GunShoot[ssCount.mMissileGunShootCount-1] :=  TT3GunShoot(obj).GetSnapshotData ;
    end
    else if obj is TT3Vectac then
    begin
        inc(ssCount.mMissileVectacCount);
        SetLength(lRec.FRTT3Vectac,ssCount.mMissileVectacCount);
        lRec.FRTT3Vectac[ssCount.mMissileVectacCount-1] :=  TT3Vectac(obj).GetSnapshotData ;
    end
    else
        s := 'Snapshot :: Unknown TT3Weapon "'+TT3Weapon(obj).ClassName+'".';
    {$ENDREGION}
  end
  else if obj is TT3Vehicle then
  begin
    {$REGION ' Vehicle Section '}
    inc(ssCount.mVehicleCount);
    SetLength(lRec.FRVehicle,ssCount.mVehicleCount);
    lRec.FRVehicle[ssCount.mVehicleCount-1] := TT3Vehicle(obj).GetSnapshotData;
    {$ENDREGION}
  end
  else if obj is TT3Chaff then
  begin
    {$REGION ' Chaff Section '}
    inc(ssCount.mChaffCount);
    SetLength(lRec.FRChaff,ssCount.mChaffCount);
    lRec.FRChaff[ssCount.mChaffCount-1] := TT3Chaff(obj).GetSnapshotData;
    {$ENDREGION}
  end
  else if obj is TT3AirBubble then
  begin
    {$REGION ' AirBubble Section '}
    inc(ssCount.mAirBubbleCount);
    SetLength(lRec.FRAirBubble,ssCount.mAirBubbleCount);
    lRec.FRAirBubble[ssCount.mAirBubbleCount-1] := TT3AirBubble(obj).GetSnapshotData;
    {$ENDREGION}
  end
  else if obj is TT3Jammer then
  begin
    {$REGION ' Jammer Section '}
    inc(ssCount.mJammerCount);
    SetLength(lRec.FRJammer,ssCount.mJammerCount);
    lRec.FRJammer[ssCount.mJammerCount-1] := TT3Jammer(obj).GetSnapshotData;
    {$ENDREGION}
  end else if obj is TT3Decoy then
  begin
    {$REGION ' Decoy Section '}
    inc(ssCount.mDecoyCount);
    SetLength(lRec.FRDecoy,ssCount.mDecoyCount);
    lRec.FRDecoy[ssCount.mDecoyCount-1] := TT3Decoy(obj).GetSnapshotData;
    {$ENDREGION}
  end
  else if obj is TT3Sonobuoy then
  begin
    {$REGION ' Sonobuoy Section '}
    inc(ssCount.mSonobuoyCount);
    SetLength(lRec.FRT3Sonobuoy, ssCount.mSonobuoyCount);
    lRec.FRT3Sonobuoy[ssCount.mSonobuoyCount-1] := TT3Sonobuoy(obj).GetSnapshotData;
    {$ENDREGION}
  end
  else
    s := 'Snapshot :: Unlisted SimPlatforms "'+TT3PlatformInstance(obj).ClassName+'".';
end;

procedure TRecObjectSnapshot.SnapshotGetDeviceSensor( obj : TObject ; var s : string );
begin
  if obj = nil then exit ;
  s := '';
  if obj is TT3Radar then begin
    inc(ssCount.mTT3RadarCount);
    SetLength(lRec.FRRadar,ssCount.mTT3RadarCount);
    lRec.FRRadar[ssCount.mTT3RadarCount-1] := TT3Radar(obj).GetSnapshotData;
  end else
  if obj is TT3ESMSensor then begin
    inc(ssCount.mTT3ESMSensorCount);
    SetLength(lRec.FRESMSensor,ssCount.mTT3ESMSensorCount);
    lRec.FRESMSensor[ssCount.mTT3ESMSensorCount-1] := TT3ESMSensor(obj).GetSnapshotData;
  end else
  if obj is TT3EOSensor then begin
    inc(ssCount.mTT3EOSensorCount);
    SetLength(lRec.FREOSensor,ssCount.mTT3EOSensorCount);
    lRec.FREOSensor[ssCount.mTT3EOSensorCount-1] := TT3EOSensor(obj).GetSnapshotData;
  end else
  if obj is TT3MADSensor then begin
    inc(ssCount.mTT3MADSensorCount);
    SetLength(lRec.FRMADSensor,ssCount.mTT3MADSensorCount);
    lRec.FRMADSensor[ssCount.mTT3MADSensorCount-1] := TT3MADSensor(obj).GetSnapshotData;
  end else
  if obj is TT3FCRSensor then begin
    inc(ssCount.mTT3FCRSensorCount);
    SetLength(lRec.FRFCRSensor,ssCount.mTT3FCRSensorCount);
    lRec.FRFCRSensor[ssCount.mTT3FCRSensorCount-1] := TT3FCRSensor(obj).GetSnapshotData;
  end else
  if obj is TT3IFFSensor then begin
    inc(ssCount.mTT3IFFSensorCount);
    SetLength(lRec.FRIFFSensor,ssCount.mTT3IFFSensorCount);
    lRec.FRIFFSensor[ssCount.mTT3IFFSensorCount-1] := TT3IFFSensor(obj).GetSnapshotData;
  end else
  if obj is TT3Sonar then begin
    inc(ssCount.mTT3SonarCount);
    SetLength(lRec.FRSonar,ssCount.mTT3SonarCount);
    lRec.FRSonar[ssCount.mTT3SonarCount-1] := TT3Sonar(obj).GetSnapshotData;
  end else
  if obj is TT3Visual then begin
    inc(ssCount.mTT3VisualCount);
    SetLength(lRec.FRVisual,ssCount.mTT3VisualCount);
    lRec.FRVisual[ssCount.mTT3VisualCount-1] := TT3Visual(obj).GetSnapshotData;
  end else
  if obj is TT3SonobuoyOnVehicle then begin
    inc(ssCount.mTT3SonobuoyOnVehicleCount);
    SetLength(lRec.FRTT3SonobuoyOnVehicle,ssCount.mTT3SonobuoyOnVehicleCount);
    lRec.FRTT3SonobuoyOnVehicle[ssCount.mTT3SonobuoyOnVehicleCount-1] := TT3SonobuoyOnVehicle(obj).GetSnapshotData;
  end
  else
    s :='Snapshot :: UnListed TT3Sensor "'+TT3Sensor(obj).ClassName+'".';
end;


procedure TRecObjectSnapshot.SnapshotGetDeviceCounterMeasure( obj : TObject  ; var s : string );
begin
  if obj = nil then exit ;
  s := '';
  if obj is TT3DefensiveJammerOnVehicle then begin
    inc(ssCount.mTT3DefensiveJammerOnVehicle);
    SetLength(lRec.FRDefensiveJammerOnVehicle,ssCount.mTT3DefensiveJammerOnVehicle);
    lRec.FRDefensiveJammerOnVehicle[ssCount.mTT3DefensiveJammerOnVehicle-1] :=
      TT3DefensiveJammerOnVehicle(obj).GetSnapshotData;
  end else
  if obj is TT3TowedJammerOnVehicle then begin
    inc(ssCount.mTT3TowedJammerOnVehicle);
    SetLength(lRec.FRTowedJammerOnVehicle,ssCount.mTT3TowedJammerOnVehicle);
    lRec.FRTowedJammerOnVehicle[ssCount.mTT3TowedJammerOnVehicle-1] :=
      TT3TowedJammerOnVehicle(obj).GetSnapshotData;
  end else
  if obj is TT3InfraredDecoyOnVehicle then begin
    inc(ssCount.mTT3InfraredDecoyOnVehicle);
    SetLength(lRec.FRInfraredDecoyOnVehicle,ssCount.mTT3InfraredDecoyOnVehicle);
    lRec.FRInfraredDecoyOnVehicle[ssCount.mTT3InfraredDecoyOnVehicle-1] :=
      TT3InfraredDecoyOnVehicle(obj).GetSnapshotData;
  end else if obj is TT3AirBubbleOnVehicle then begin
    inc(ssCount.mTT3AirBubbleOnVehicleCount);
    SetLength(lRec.FRAirBubbleOnVehicle,ssCount.mTT3AirBubbleOnVehicleCount);
    lRec.FRAirBubbleOnVehicle[ssCount.mTT3AirBubbleOnVehicleCount-1] :=
      TT3AirBubbleOnVehicle(obj).GetSnapshotData;
  end else if obj is TT3AcousticDecoyOnVehicle then begin
    inc(ssCount.mTT3AcousticDecoyOnVehicleCount);
    SetLength(lRec.FRAcousticDecoyOnVehicle,ssCount.mTT3AcousticDecoyOnVehicleCount);
    lRec.FRAcousticDecoyOnVehicle[ssCount.mTT3AcousticDecoyOnVehicleCount-1] :=
      TT3AcousticDecoyOnVehicle(obj).GetSnapshotData;
  end else if obj is TT3ChaffOnVehicle then begin
    inc(ssCount.mTT3ChaffOnVehicleCount);
    SetLength(lRec.FRChaffOnVehicle,ssCount.mTT3ChaffOnVehicleCount);
    lRec.FRChaffOnVehicle[ssCount.mTT3ChaffOnVehicleCount-1] := TT3ChaffOnVehicle(obj).GetSnapshotData;
  end else if obj is TT3ChaffLauncher then begin
    inc(ssCount.mTT3ChaffLauncherCount);
    SetLength(lRec.FRChaffLauncher,ssCount.mTT3ChaffLauncherCount);
    lRec.FRChaffLauncher[ssCount.mTT3ChaffLauncherCount-1] := TT3ChaffLauncher(obj).GetSnapshotData;
  end else if obj is TT3FloatingDecoyOnVehicle then begin
    inc(ssCount.mTT3FloatingDecoyOnVehicleCount);
    SetLength(lRec.FRFloatingDecoyOnVehicle,ssCount.mTT3FloatingDecoyOnVehicleCount);
    lRec.FRFloatingDecoyOnVehicle[ssCount.mTT3FloatingDecoyOnVehicleCount-1] := TT3FloatingDecoyOnVehicle(obj).GetSnapshotData;
  end else if obj is TT3RadarNoiseJammerOnVehicle then begin
    inc(ssCount.mTT3RadarNoiseJammerOnVehicleCount);
    SetLength(lRec.FRRadarNoiseJammerOnVehicle,ssCount.mTT3RadarNoiseJammerOnVehicleCount);
    lRec.FRRadarNoiseJammerOnVehicle[ssCount.mTT3RadarNoiseJammerOnVehicleCount-1] :=
    TT3RadarNoiseJammerOnVehicle(obj).GetSnapshotData;
  end else
    s := 'Snapshot :: UnListed CounterMeasure "'+TT3CounterMeasure(obj).ClassName+'".';
end;

procedure TRecObjectSnapshot.SnapshotGetWeaponOnVehicle( obj : TObject  ; var s : string );
begin
  if obj = nil then exit ;
  s := '';
  if obj is TT3MissilesOnVehicle then begin
     inc(ssCount.mTT3MissilesOnVehicleCount);
     SetLength(lRec.FRMissileOnVehicle,ssCount.mTT3MissilesOnVehicleCount);
     lRec.FRMissileOnVehicle[ssCount.mTT3MissilesOnVehicleCount-1] := TT3MissilesOnVehicle(obj).GetSnapshotData;
  end else
  if obj is TT3TorpedoesOnVehicle then begin
     inc(ssCount.mTT3TorpedoOnVehicleCount);
     SetLength(lRec.FRTorpedoOnVehicle,ssCount.mTT3TorpedoOnVehicleCount);
     lRec.FRTorpedoOnVehicle[ssCount.mTT3TorpedoOnVehicleCount-1] := TT3TorpedoesOnVehicle(obj).GetSnapshotData;
  end else
  if obj is TT3GunOnVehicle then begin
     inc(ssCount.mTT3GunOnVehicleCount);
     SetLength(lRec.FRGunOnVehicle,ssCount.mTT3GunOnVehicleCount);
     lRec.FRGunOnVehicle[ssCount.mTT3GunOnVehicleCount-1] := TT3GunOnVehicle(obj).GetSnapshotData;
  end else
  if obj is TT3MineOnVehicle then begin
     inc(ssCount.mTT3MineOnVehicleCount);
     SetLength(lRec.FRMineOnVehicle,ssCount.mTT3MineOnVehicleCount);
     lRec.FRMineOnVehicle[ssCount.mTT3MineOnVehicleCount-1] := TT3MineOnVehicle(obj).GetSnapshotData;
  end else
  if obj is TT3BombONVehicle then begin
     inc(ssCount.mTT3BombOnVehicleCount);
     SetLength(lRec.FRBombOnVehicle,ssCount.mTT3BombOnVehicleCount);
     lRec.FRBombOnVehicle[ssCount.mTT3BombOnVehicleCount-1] := TT3BombONVehicle(obj).GetSnapshotData;
  end else
  if obj is TT3Vectac then begin
     inc(ssCount.mTT3VectacCount);
     SetLength(lRec.FRVectac,ssCount.mTT3VectacCount);
     lRec.FRVectac[ssCount.mTT3VectacCount-1] := TT3Vectac(obj).GetSnapshotData;
  end else
   s :='Snapshot :: UnListed TT3Weapon "'+TT3Weapon(obj).ClassName+'".';
end;


procedure TRecObjectSnapshot.SnapshotGetNonRealtimePlatforms( obj : TObject ; var s : string );
begin
  if obj = nil then exit ;
  s := '';
  if obj is TT3NonRealVehicle then begin
     inc(ssCount.mNonRealTimeCount);
     SetLength(lRec.FRNonRealTime,ssCount.mNonRealTimeCount);
     lRec.FRNonRealTime[ssCount.mNonRealTimeCount-1] := TT3NonRealVehicle(obj).GetSnapshotData;
     s :='Snapshot :: Get Non Realtime Platform "'+TT3NonRealVehicle(obj).ClassName+'".';
  end;
end;

procedure TRecObjectSnapshot.SnapshotGetPointRBLW_VehicleMissile( obj : TObject ; var s : string );
begin
  if obj = nil then exit ;
  s := '';
  if obj is TPointVehicleMissileRBLW then begin
     inc(ssCount.mPointVehicleMissileRBLW);
     SetLength(lRec.FRPointRBLW,ssCount.mPointVehicleMissileRBLW);
     lRec.FRPointRBLW[ssCount.mPointVehicleMissileRBLW-1] := TPointVehicleMissileRBLW(obj).GetSnapshotData;
     s :='Snapshot :: Get Point Vehicle Missile RBLW "'+TPointVehicleMissileRBLW(obj).ClassName+'".';
  end;
end;

procedure TRecObjectSnapshot.SnapshotGetPointBOLW_VehicleMissile( obj : TObject ; var s : string );
begin
  if obj = nil then exit ;
  s := '';
  if obj is TPointVehicleMissileBOLW then begin
     inc(ssCount.mPointVehicleMissileBOLW);
     SetLength(lRec.FRPointBOLW,ssCount.mPointVehicleMissileBOLW);
     lRec.FRPointBOLW[ssCount.mPointVehicleMissileBOLW-1] := TPointVehicleMissileBOLW(obj).GetSnapshotData;
     s :='Snapshot :: Get Point Vehicle Missile BOLW "'+TPointVehicleMissileBOLW(obj).ClassName+'".';
  end;
end;


function TRecObjectSnapshot.LoadFrom(AStream: TStream): Boolean;
begin
  Result := TSnapshotUtils.ReadFrom(AStream, Self, TypeInfo(TRecObjectSnapshot), cVersion); // or
end;

procedure TRecObjectSnapshot.SaveTo(AStream: TStream; ScenarioID: Integer);
begin
  TSnapshotUtils.WriteTo(AStream, Self, TypeInfo(TRecObjectSnapshot), ScenarioID, cVersion, cDefaultOptions);
end;

procedure GetUidSnapShot(const aData: _SSA_Vehicle ; var aStrs: TStrings);
var
  i: integer;
begin
  if assigned(aStrs) then
    aStrs.Clear
  else
    aStrs := TStringList.Create;

  for i := 0 to Length(aData) - 1 do
    aStrs.Add(IntToStr(aData[i].P.SST3Unit.InstanceIndex));

  TStringList(aStrs).Sort;
end;

procedure ClearAndFreeObjectRec(var sl: TList);
var
  i: integer;
  o: TObject;
begin
  for i := sl.Count - 1 downto 0 do begin
    o := sl.Items[i];
    o.Free;
  end;
  sl.Clear;
  FreeAndNil(sl);
end;

{*********************************************************************************************}
function __snapshot_loadfile ( const s : string ) : boolean ;

  procedure copyToLocal( src, des : string );
  var
    SourceFile, DestFile : string ;
  begin
    SourceFile := '';
    DestFile := '';
    CopyFile(PChar(SourceFile), PChar(DestFile), True);
  end;

var
  lFileInfo   : TFileStream ;
  sfile       : string ;
begin
  sfile  := GetFullNameSnapshotFileFromName(s);
  if not ValidSnapshotExt(sfile) then begin
    Result := false ;
    exit ;
  end;
  lFileInfo := TFileStream.Create(sfile, fmOpenRead or fmShareDenyWrite);
  try
    if not lRec.LoadFrom(lFileInfo) then
    begin
      Result := false ;
      lFileInfo.Free;
      Exit ;
    end;
  finally
    Result := true ;
    lFileInfo.Free;
  end;
end;

procedure __snapshot_getGameScenario (const scenario : TT3DBScenario);
var
  i,j, k, l, m, n : integer ;
  mGeoAreaDef   : TGeo_Area_Def ;
  mGeoAreaPoint : TGeo_Area_Point ;
  mGeoAreaEvent : TConditional_Event ;

  mResAllocation : TResource_Allocation ;
  mExCommChannel : TExternal_Communication_Channel ;
  mRefPoint      : TReference_Point;

  p              : TPlatform_Instance ;
  recPI          : _SS_TPlatform_Instance ;
  fmList         : TList;
  fmDef          : TFormation;
  objLink        : TLink ;
  recLink        : _SS_TLink ;
  shape          : TShape_Definition;
  gDefRec        : TGame_Environment_Definition;
  BaseEmbarkLib  : TPlatformBase;
  PlatformLibrary: TPlatform_Embark_Library;
  ObjBrigade     : TBrigade;
  ObjBatalyon    : TBatalyon;
  ObjKompi       : TKompi;
  ObjPlatoon     : TPlatoon;
  ObjGroup       : TGroup;
begin
  with lRec.FRGameScenario do
  begin
    Scenario_def := scenario.ScenarioDefinition.FData;

    {$REGION ' Resource Allocation '}
    if scenario.ResourceAllocation <> nil then
    begin
      Resource_alloc.FData         := scenario.ResourceAllocation.FData;

      {yg ini tunggu dulu}
      Resource_alloc.FOverlay      := scenario.ResourceAllocation.FOverlay;
      Resource_alloc.IsOverlayShow := scenario.ResourceAllocation.IsOverlayShow;
      Resource_alloc.IsOverlayEdit := scenario.ResourceAllocation.IsOverlayEdit;
      Resource_alloc.IsCubicle     := scenario.ResourceAllocation.IsCubicle;
      Resource_alloc.FCubicleNumbr := scenario.ResourceAllocation.FCubicleNumbr;
      Resource_allocObjFlag        := isExist;
    end
    else
      Resource_allocObjFlag        := isNone;
    {$ENDREGION}

    {$REGION ' Game Environtment '}
    if scenario.GameEnvironment <> nil then
    begin
      GameEnvironment.FData        := scenario.GameEnvironment.FData;
      GameEnvironment.FGameArea    := scenario.GameEnvironment.FGameArea;
      GameEnvironment.FGlobal_Conv := scenario.GameEnvironment.FGlobal_Conv;
      GameEnvironmentObjFlag       := isExist;
    end
    else
      GameEnvironmentObjFlag        := isNone;
    {$ENDREGION}

    {$REGION ' GetGeoAreaDefinition '}
    if scenario.GeoAreaDef <> nil then
    begin
      GeoAreaDef.FData  := scenario.GeoAreaDef.FData;
      GeoAreaDefObjFlag := isExist;
    end
    else
      GeoAreaDefObjFlag       := isNone;

    if scenario.GDefList.Count <> 0 then
    begin
      SetLength(GameEnvironmentList, scenario.GDefList.Count);
      for I := 0 to scenario.GDefList.Count -1 do
      begin
        gDefRec := scenario.GDefList.Items[i];
        GameEnvironmentList[i].FData        := gDefRec.FData;
        GameEnvironmentList[i].FGameArea    := gDefRec.FGameArea;
        GameEnvironmentList[i].FGlobal_Conv := gDefRec.FGlobal_Conv;
      end;
      GameEnvironmentListFlag := isExist;
    end
    else
      GameEnvironmentListFlag := isNone;

    if scenario.GeoPoint <> nil then
    begin
      SetLength(GeoPoint,scenario.GeoPoint.Count);
      for I := 0 to scenario.GeoPoint.Count - 1 do
      begin
        mGeoAreaDef := TGeo_Area_Def(scenario.GeoPoint[i]) ;
        if mGeoAreaDef <> nil then
        begin
          GeoPoint[i].FData     := mGeoAreaDef.FData ;
          if mGeoAreaDef.Point <> nil then
          begin
            SetLength(GeoPoint[i].Point,mGeoAreaDef.Point.Count);
            for j := 0 to mGeoAreaDef.Point.Count - 1 do
            begin
              mGeoAreaPoint        := TGeo_Area_Point(mGeoAreaDef.Point[j]) ;
              if mGeoAreaPoint <> nil then
                GeoPoint[i].Point[j] := mGeoAreaPoint.FData ;
            end;
          end;
          if mGeoAreaDef.Event <> nil then
          begin
            SetLength(GeoPoint[i].Event,mGeoAreaDef.Event.Count);
            for j := 0 to mGeoAreaDef.Point.Count - 1 do
            begin
              mGeoAreaEvent        := TConditional_Event(mGeoAreaDef.Event[j]) ;
              if mGeoAreaEvent <> nil then
                GeoPoint[i].Event[j] := mGeoAreaEvent.FData ;
            end;
          end;
        end;
      end;
      GeoPointObjFlag := isExist ;
    end;
    {$ENDREGION}

    if scenario.AssetDeployment <> nil then
    begin
      AssetDeployment           := scenario.AssetDeployment.FData ;
      AssetDeploymentObjFlag    := isExist;
    end;

    overlayName               := scenario.overlayName;
    for I := low(scenario.allOverlayNames) to high(scenario.allOverlayNames) do
    begin
      allOverlayNames[i]      := scenario.allOverlayNames[i];
    end;

    SetLength(Platform_Insts,Scenario.PlatformInstanceListFromDB.Count);
    for i := 0 to Scenario.PlatformInstanceListFromDB.Count-1 do
    begin
       p := Scenario.PlatformInstanceListFromDB[i] ;
       if p <> nil then
       begin
         Platform_Insts[i].FData := p.FData ;;
         Platform_Insts[i].FActivation := p.FActivation ;
         Platform_Insts[i].CubicleGroupID  := p.CubicleGroupID;
         Platform_Insts[i].IsGroupLeader   := p.IsGroupLeader;
         Platform_Insts[i].PlatformType    := p.PlatformType ;
         Platform_Insts[i].InstanceName    := p.InstanceName ;
         Platform_Insts[i].TrackID         := p.TrackID ;
       end;
    end;

    //??? dmTTT.getAllRuntimePlatform(scenario.ResourceAllocIndex,scenario.RuntimePlatformLibrary);

//    SetLength(Formation.FForm,Scenario.Formation.Count);
//    for I := 0 to VScenario.Formation.Count-1 do
//    begin
//      fmDef := Scenario.Formation[i];
//      if fmDef <> nil then begin
//         Formation.FForm[i].FFormation_Def := fmDef.FFormation_Def ;
//         Formation.FForm[i].FForm_Assign   := fmDef.FForm_Assign ;
//      end;
//    end;

    SetLength(Formation_List.FFormList,Scenario.Formation_List.Count);
    for I := 0 to Scenario.Formation_List.Count-1 do
    begin
      fmDef := Scenario.Formation_List[i];
      Formation_List.FFormList[i].FForm.FFormation_Def := fmDef.FFormation_Def ;
      Formation_List.FFormList[i].FForm.FForm_Assign   := fmDef.FForm_Assign ;

//      if fmList <> nil then begin
//          SetLength(Formation_List.FFormList[i].FForm,fmList.Count );
//          for j := 0 to fmList.Count - 1 do begin
//            fmDef := fmlist.Items[j];
//            if fmDef <> nil then begin
//                Formation_List.FFormList[i].FForm.FFormation_Def := fmDef.FFormation_Def ;
//                Formation_List.FFormList[i].FForm.FForm_Assign   := fmDef.FForm_Assign ;
//            end;
//          end;
//      end;
    end;

    // dmTTT.GetLinkDefinition(dIndex, Links);
    SetLength(FLinks,Scenario.Links.Count);
    for I := 0 to Scenario.Links.Count-1 do
    begin
       objLink := Scenario.Links[i];
       if objLink <> nil then begin
         FLinks[i].FLink_Def  := objLink.FLink_Def ;
         FLinks[i].FLink_Part := objLink.FLink_Part ;
         SetLength(FLinks[i].Participant,objLink.Participant.Count);
         for j := 0 to objLink.Participant.Count-1 do begin
            p := objLink.Participant[j];
            if p <> nil then begin
               FLinks[i].Participant[j].FData           := p.FData ;
               FLinks[i].Participant[j].FActivation     := p.FActivation ;
               FLinks[i].Participant[j].CubicleGroupID  := p.CubicleGroupID;
               FLinks[i].Participant[j].IsGroupLeader   := p.IsGroupLeader;
               FLinks[i].Participant[j].PlatformType    := p.PlatformType ;
               FLinks[i].Participant[j].InstanceName    := p.InstanceName ;
               FLinks[i].Participant[j].TrackID         := p.TrackID ;
            end ;
         end;
       end;
    end;

    // reff GetExternal_Communication_Channel
    if scenario.ExternalCom <> nil then begin
      ExternalCom               := scenario.ExternalCom.FData;
      ExternalComObjFlag        := isExist ;
    end;

    if scenario.ExCom <> nil then begin
      SetLength(ExCom,scenario.ExCom.Count);
      for I := 0 to scenario.ExCom.Count - 1 do begin
         mExCommChannel         := TExternal_Communication_Channel(scenario.ExCom[i]) ;
         if mExCommChannel <> nil then begin
           ExCom[i].Comms_Channel_Index   := ExternalCom.Comms_Channel_Index ;
           ExCom[i].Resource_Alloc_Index  := ExternalCom.Resource_Alloc_Index ;
           ExCom[i].Channel_Number        := ExternalCom.Channel_Number ;
           ExCom[i].Channel_Identifier    := ExternalCom.Channel_Identifier ;
           ExCom[i].Comms_Band            := ExternalCom.Comms_Band ;
           ExCom[i].Channel_Freq          := ExternalCom.Channel_Freq ;
           ExCom[i].Channel_Security      := ExternalCom.Channel_Security ;
           ExCom[i].Channel_Code          := ExternalCom.Channel_Code ;
         end;
      end;
      ExComObjFlag := isExist ;
    end;

    if scenario.ReferencePoint <> nil then begin
      Ref_Point.FData           := scenario.ReferencePoint.FData;
      Ref_Point.Symbol_Name     := scenario.ReferencePoint.Symbol_Name;
      Ref_Point.Symbol_Color    := scenario.ReferencePoint.Symbol_Color;
      Ref_Point.IsSelected      := scenario.ReferencePoint.IsSelected;
      Ref_PointObjFlag          := isExist;
    end;
    // reff getAllReference_Point
    if scenario.ReferencePointListFromDB <> nil then  begin
        SetLength(rpList,scenario.ReferencePointListFromDB.Count);
        for i := 0 to scenario.ReferencePointListFromDB.Count - 1 do begin
             mRefPoint :=  TReference_Point(scenario.ReferencePointListFromDB[i]);
             if mRefPoint <> nil then  rpList[i].FData        := mRefPoint.FData ;
        end;
        rpListObjFlag := isExist;
    end;

//    if scenario.BaseListFromDB <> nil then
//    begin
//      SetLength(EmbarkLib, scenario.BaseListFromDB.Count);
//      for i := 0 to scenario.BaseListFromDB.Count - 1 do
//      begin
//        BaseEmbarkLib := TPlatformBase(scenario.BaseListFromDB.Items[i]);
//        EmbarkLib[i].id := BaseEmbarkLib.id;
//        EmbarkLib[i].identifier := BaseEmbarkLib.identifier;
//        EmbarkLib[i].force := BaseEmbarkLib.force;
//        EmbarkLib[i].Longitude := BaseEmbarkLib.Longitude;
//        EmbarkLib[i].Latitude := BaseEmbarkLib.Latitude;
//        EmbarkLib[i].Radius := BaseEmbarkLib.Radius;
//        EmbarkLib[i].TypeBase := BaseEmbarkLib.TypeBase;
//        EmbarkLib[i].Fuel := BaseEmbarkLib.Fuel;
//        EmbarkLib[i].Lubricants := BaseEmbarkLib.Lubricants;
//        EmbarkLib[i].FreshWater := BaseEmbarkLib.FreshWater;
//        EmbarkLib[i].Water := BaseEmbarkLib.Water;
//        EmbarkLib[i].Food := BaseEmbarkLib.Food;
//
//        if BaseEmbarkLib.ListVehicle <> nil then
//        begin
//          SetLength(EmbarkLib[i].FVehicleList, BaseEmbarkLib.ListVehicle.Count);
//          for j := 0 to BaseEmbarkLib.ListVehicle.Count - 1 do
//          begin
//            PlatformLibrary := TPlatform_Embark_Library(BaseEmbarkLib.ListVehicle.Items[j]);
//
//            if Assigned(PlatformLibrary) then
//              EmbarkLib[i].FVehicleList[j] := PlatformLibrary.FData;
//          end;
//          EmbarkLib[i].VehicleListFlag := isExist;
//        end;
//
//        //get data brigade
//        if BaseEmbarkLib.ListPersonel <> nil then
//        begin
//          SetLength(EmbarkLib[i].BrigadeList, BaseEmbarkLib.ListPersonel.Count);
//          for j := 0 to BaseEmbarkLib.ListPersonel.Count - 1 do
//          begin
//            ObjBrigade := TBrigade(BaseEmbarkLib.ListPersonel.Items[j]);
//            EmbarkLib[i].BrigadeList[j].BrigadeData.Id := ObjBrigade.Id;
//            EmbarkLib[i].BrigadeList[j].BrigadeData.Identifier := ObjBrigade.Identifier;
//            EmbarkLib[i].BrigadeList[j].BrigadeData.VeID := ObjBrigade.VeId;
//
//            //get data batalyon
//            if ObjBrigade.BatalyonList <> nil then
//            begin
//              SetLength(EmbarkLib[i].BrigadeList[j].Batalyon, ObjBrigade.BatalyonList.Count);
//              for k := 0 to ObjBrigade.BatalyonList.Count - 1 do
//              begin
//                ObjBatalyon := TBatalyon(ObjBrigade.BatalyonList.Items[k]);
//                EmbarkLib[i].BrigadeList[j].Batalyon[k].BatalyonData.Id := ObjBatalyon.Id;
//                EmbarkLib[i].BrigadeList[j].Batalyon[k].BatalyonData.Identifier := ObjBatalyon.Identifier;
//                EmbarkLib[i].BrigadeList[j].Batalyon[k].BatalyonData.ChildFromBrigade := ObjBrigade.Identifier;
//
//                //get kompi
//                if ObjBatalyon.KompiList <> nil then
//                begin
//                  SetLength(EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList, ObjBatalyon.KompiList.Count);
//                  for l := 0 to ObjBatalyon.KompiList.Count - 1 do
//                  begin
//                    ObjKompi := TKompi(ObjBatalyon.KompiList.Items[l]);
//                    EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].KompiData.Id := ObjKompi.Id;
//                    EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].KompiData.Identifier := ObjKompi.Identifier;
//                    EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].KompiData.ChildFromBrigade := ObjBrigade.Identifier;
//                    EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].KompiData.ChildFromBatalyon := ObjBatalyon.Identifier;
//
//                    //get platoon
//                    if ObjKompi.PlatoonList <> nil then
//                    begin
//                      SetLength(EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList, ObjKompi.PlatoonList.Count);
//                      for m := 0 to ObjKompi.PlatoonList.Count - 1 do
//                      begin
//                        ObjPlatoon := TPlatoon(ObjKompi.PlatoonList.Items[m]);
//                        EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].PlatoonData.Id := ObjPlatoon.Id;
//                        EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].PlatoonData.Identifier := ObjPlatoon.Identifier;
//                        EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].PlatoonData.ChildFromBrigade := ObjBrigade.Identifier;
//                        EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].PlatoonData.ChildFromBatalyon := ObjBatalyon.Identifier;
//                        EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].PlatoonData.ChildFromKompi := ObjKompi.Identifier;
//
//                        //get group
//                        if ObjPlatoon.GroupList <> nil then
//                        begin
//                          SetLength(EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList, ObjPlatoon.GroupList.Count);
//                          for n := 0 to ObjPlatoon.GroupList.Count - 1 do
//                          begin
//                            ObjGroup := TGroup(ObjPlatoon.GroupList.Items[m]);
//
//                            EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.Id := ObjGroup.Id;
//                            EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.Identifier := ObjGroup.Identifier;
//                            EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.ChildFromBrigade := ObjBrigade.Identifier;
//                            EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.ChildFromBatalyon := ObjBatalyon.Identifier;
//                            EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.ChildFromKompi := ObjKompi.Identifier;
//                            EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.ChildFromPleton := ObjPlatoon.Identifier;
//                            EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].Quantity := ObjGroup.quantity;
//                          end;
//                          EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupFlag := isExist;
//                        end;
//                      end;
//                      EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatoonFlag := isExist;
//                    end;
//                  end;
//                  EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiFlag := isExist;
//                end;
//              end;
//              EmbarkLib[i].BrigadeList[j].BatalyonFlag := isExist;
//            end;
//          end;
//          EmbarkLib[i].BrigadeListFlag := isExist;
//        end;
//      end;
//      EmbarkListObjFlag := isExist;
//    end;
  end;
end;

procedure __snapshot_getGameDefaults (const GameDefaults : TGame_Defaults);
var count,I : Integer;
begin
  with lRec.FRGameScenario.GameDefaults do
  begin
    if GameDefaults <> nil then begin
      lRec.FRGameScenario.GameDefaultsObjFlag := isExist            ;
      FData                  := GameDefaults.FData                  ;
      FGameCloud_ESM         := GameDefaults.FGameCloud_ESM         ;
      FGameCloud_Radar       := GameDefaults.FGameCloud_Radar       ;
      //edited by andi
      count := Length(GameDefaults.FGameDefault_IFF);
      SetLength(FGameDefault_IFF,count);
      for I := 0 to count - 1 do
      begin
        FGameDefault_IFF[i] := GameDefaults.FGameDefault_IFF[i];
      end;
      //FGameDefault_IFF       := GameDefaults.FGameDefault_IFF       ;
      FGameRainfall_ESM      := GameDefaults.FGameRainfall_ESM      ;
      FGameRainfall_Missile  := GameDefaults.FGameRainfall_Missile  ;
      FGameRainfall_Radar    := GameDefaults.FGameRainfall_Radar    ;
      count := Length(GameDefaults.FGameRainfall_Sonar);
      SetLength(FGameRainfall_Sonar,count);
      for I := 0 to count - 1 do
      begin
        FGameRainfall_Sonar    := GameDefaults.FGameRainfall_Sonar    ;
      end;
      FGameSea_Missile       := GameDefaults.FGameSea_Missile       ;
      FGameSea_Radar         := GameDefaults.FGameSea_Radar         ;
      count := Length(GameDefaults.FGameSea_Sonar);
      SetLength(FGameSea_Sonar,count);
      for I := 0 to count - 1 do
      begin
        FGameSea_Sonar[i]         := GameDefaults.FGameSea_Sonar[i]         ;
      end;

      count := Length(GameDefaults.FGameShip_Sonar);
      SetLength(FGameShip_Sonar,count);
      for I := 0 to count - 1 do
      begin
        FGameShip_Sonar[i]        := GameDefaults.FGameShip_Sonar[i]        ;
      end;
    end else
      lRec.FRGameScenario.GameDefaultsObjFlag := isNone             ;
  end;
end;

procedure __snapshot_getRainfall (const Rainfall : TRainfall);
var
  i : integer ;

  R_ESM : TRainfall_On_ESM;
  R_MSS : TRainfall_On_Missile;
  R_RDR : TRainfall_On_Radar ;
  R_SNR : TRainfall_On_Sonar;

begin

  //FRainfall.LoadFromRainfall();
  SetLength(lRec.FRRainfall.FRainfall_On_ESM,Rainfall.FRainfall_On_ESM.Count);
  for i := 0 to Rainfall.FRainfall_On_ESM.Count-1 do begin
      R_ESM := Rainfall.FRainfall_On_ESM[i];
      lRec.FRRainfall.FRainfall_On_ESM[i] := R_ESM.FData;
  end;
  SetLength(lRec.FRRainfall.FRainfall_On_Missile,Rainfall.FRainfall_On_Missile.Count);
  for i := 0 to Rainfall.FRainfall_On_Missile.Count-1 do begin
      R_MSS := Rainfall.FRainfall_On_Missile[i];
      lRec.FRRainfall.FRainfall_On_Missile[i]  := R_MSS.FData ;
  end;
  SetLength(lRec.FRRainfall.FRainfall_On_Radar,Rainfall.FRainfall_On_Radar.Count);
  for i := 0 to Rainfall.FRainfall_On_Radar.Count-1  do begin
      R_RDR := Rainfall.FRainfall_On_Radar[i];
      lRec.FRRainfall.FRainfall_On_Radar[i] := R_RDR.FData ;
  end;
  SetLength(lRec.FRRainfall.FRainfall_On_Sonar,Rainfall.FRainfall_On_Sonar.Count);
  for i := 0 to Rainfall.FRainfall_On_Sonar.Count-1 do begin
      R_SNR := Rainfall.FRainfall_On_Sonar[i];
      lRec.FRRainfall.FRainfall_On_Sonar[i] := R_SNR.FData ;
  end;

end;

procedure __snapshot_getCloudEffects (const CE : TCloud_Effects);
var
  i     : integer ;
  R_ESM : TCloud_Effects_On_ESM;
  R_RDR : TCloud_Effects_On_Radar ;
begin
  //FCloud_Effects.LoadFromCloudEffects();
  SetLength(lRec.FRCloudEffect.FRainfall_On_ESM,CE.FCloud_Effects_On_ESM.Count);
  for i := 0 to CE.FCloud_Effects_On_ESM.Count-1 do begin
      R_ESM := CE.FCloud_Effects_On_ESM[i];
      lRec.FRCloudEffect.FRainfall_On_ESM[i] := R_ESM.FData ;
  end;
  SetLength(lRec.FRCloudEffect.FRainfall_On_Radar,CE.FCloud_Effects_On_Radar.Count);
  for i := 0 to CE.FCloud_Effects_On_Radar.Count-1 do begin
      R_RDR := CE.FCloud_Effects_On_Radar[i];
      lRec.FRCloudEffect.FRainfall_On_Radar[i]  := R_RDR.FData;
  end;
end;

procedure __snapshot_getDefaultVar(const DV : TDefault_Var);
var
  i : integer ;
begin
  with lRec.FRDefaultVar do
  begin
    SetLength(Sea_State_On_Missile_Safe_Altitude,length(DV.Sea_State_On_Missile_Safe_Altitude));
    for i := 0 to length(DV.Sea_State_On_Missile_Safe_Altitude)-1 do begin
       Sea_State_On_Missile_Safe_Altitude[i] := DV.Sea_State_On_Missile_Safe_Altitude[i];
    end;
    SetLength(Sea_State_On_Radar,length(DV.Sea_State_On_Radar));
    for i := 0 to length(DV.Sea_State_On_Radar)-1 do begin
       Sea_State_On_Radar[i] := DV.Sea_State_On_Radar[i];
    end;
    SetLength(Sea_State_On_Sonar,length(DV.Sea_State_On_Sonar));
    for i := 0 to length(DV.Sea_State_On_Sonar)-1 do begin
       Sea_State_On_Sonar[i] := DV.Sea_State_On_Sonar[i];
    end;
  end;
end;

procedure __snapshot_getDatalink(const DL1,DL2,DL3 : TT3DataLink);
begin
   SetLength(lRec.FRDataLink,3);
   if DL1 <> nil then lRec.FRDataLink[0]:= DL1.GetSnapshotData ;
   if DL2 <> nil then lRec.FRDataLink[1]:= DL2.GetSnapshotData ;
   if DL3 <> nil then lRec.FRDataLink[2]:= DL3.GetSnapshotData ;
end;

procedure __snapshot_setGameScenario (var scenario : TT3DBScenario);
var
  i,j,k,l,m,n   : integer ;
  mGeoAreaDef   : TGeo_Area_Def ;
  mGeoAreaPoint : TGeo_Area_Point ;
  mGeoAreaEvent : TConditional_Event ;

  mResAllocation : TResource_Allocation ;
  mExCommChannel : TExternal_Communication_Channel ;
  mRefPoint      : TReference_Point;

  pi             : TPlatform_Instance ;
  recPI          : _SS_TPlatform_Instance ;
  fmDef          : TFormation;
  recFmDef       : _SS_TFormation ;

  objLink        : TLink ;
  recLink        : _SS_TLink ;
  shape          : TShape_Definition;
  gDefRec  : TGame_Environment_Definition;
  BaseEmbarkLib   : TPlatformBase;
  Platform_Embark_Library : TPlatform_Embark_Library;
  ObjBrigade     : TBrigade;
  ObjBatalyon    : TBatalyon;
  ObjKompi       : TKompi;
  ObjPlatoon     : TPlatoon;
  ObjGroup       : TGroup;
begin
  with lRec.FRGameScenario do
  begin

    scenario.ScenarioDefinition.FData           := Scenario_def;

    if Resource_allocObjFlag = isExist then begin
       if scenario.ResourceAllocation = nil then
          scenario.ResourceAllocation := TResource_Allocation.Create;
      scenario.ResourceAllocation.FData         := Resource_alloc.FData;
      scenario.ResourceAllocation.FOverlay      := Resource_alloc.FOverlay;
      scenario.ResourceAllocation.IsOverlayShow := Resource_alloc.IsOverlayShow;
      scenario.ResourceAllocation.IsOverlayEdit := Resource_alloc.IsOverlayEdit;
      scenario.ResourceAllocation.IsCubicle     := Resource_alloc.IsCubicle;
      scenario.ResourceAllocation.FCubicleNumbr := Resource_alloc.FCubicleNumbr;
    end;

    // reff GetGeoAreaDefinition
    if GeoAreaDefObjFlag = isExist then begin
       if scenario.GeoAreaDef = nil then
          scenario.GeoAreaDef := TGeo_Area_Def.Create;
       scenario.GeoAreaDef.FData  := GeoAreaDef.FData;
    end;

    if lRec.FRGameScenario.GameEnvironmentListFlag = isExist then begin
      if not Assigned(scenario.GDefList) then
        scenario.GDefList := TList.Create
      else
        scenario.GDefList.Clear;

      for I := Low(lRec.FRGameScenario.GameEnvironmentList) to High(lRec.FRGameScenario.GameEnvironmentList) do begin
        gDefRec := TGame_Environment_Definition.Create;
        gDefRec.FData := lRec.FRGameScenario.GameEnvironmentList[i].FData;
        gDefRec.FGameArea    := lRec.FRGameScenario.GameEnvironmentList[i].FGameArea    ;
        gDefRec.FGlobal_Conv := lRec.FRGameScenario.GameEnvironmentList[i].FGlobal_Conv ;
        scenario.GDefList.Add(gDefRec);
      end;
    end;

    if GeoPointObjFlag = isExist then begin
      if scenario.GeoPoint = nil then
         scenario.GeoPoint := TList.Create;
      for I := low(GeoPoint) to high(GeoPoint) do begin
        mGeoAreaDef             := TGeo_Area_Def.Create ;
        mGeoAreaDef.FData       := GeoPoint[i].FData;
        for j := low(GeoPoint[i].Point) to high(GeoPoint[i].Point) do begin
          mGeoAreaPoint        := TGeo_Area_Point.Create ;
          mGeoAreaPoint.FData  := GeoPoint[i].Point[j];
          mGeoAreaDef.Point.Add(mGeoAreaPoint);
        end;
        for j := low(GeoPoint[i].Event) to high(GeoPoint[i].Event) do begin
          mGeoAreaEvent        := TConditional_Event.Create;
          mGeoAreaEvent.FData  := GeoPoint[i].Event[j];
          mGeoAreaDef.Event.Add(mGeoAreaEvent);
        end;
        scenario.GeoPoint.Add(mGeoAreaDef);
      end;
    end;

    // reff GetResource_Overlay_Mapping
//    if Resource_Overlay_MappingObjFlag = isExist then begin
//      if scenario.Resource_Overlay_Mapping = nil then
//        scenario.Resource_Overlay_Mapping := TResource_Overlay_Mapping.Create;
//      scenario.Resource_Overlay_Mapping.FData  := Resource_Overlay_Mapping;
//    end;

//    if Overlay_DefinitionObjFlag = isExist then begin
//      if scenario.OverlayDefinition = nil then
//         scenario.OverlayDefinition := uDBAsset_GameEnvironment.TOverlay_Definition.Create ;
//      scenario.OverlayDefinition.FData        := Overlay_Definition;
//    end;

//    if Overlay_MappingObjFlag = isExist then begin
//      if scenario.OverlayListFromDB = nil then
//         scenario.OverlayListFromDB := TList.Create;
//      for I := low(Overlay_Mapping) to high(Overlay_Mapping) do begin
//        mResAllocation          := TResource_Allocation.Create ;
//        mResAllocation.FData         := Overlay_Mapping[i].FData          ;
//        mResAllocation.FOverlay      := Overlay_Mapping[i].FOverlay       ;
//        mResAllocation.IsOverlayShow := Overlay_Mapping[i].IsOverlayShow  ;
//        mResAllocation.IsOverlayEdit := Overlay_Mapping[i].IsOverlayEdit  ;
//        mResAllocation.IsCubicle     := Overlay_Mapping[i].IsCubicle      ;
//        mResAllocation.FCubicleNumbr := Overlay_Mapping[i].FCubicleNumbr  ;
//        scenario.OverlayListFromDB.Add(mResAllocation);
//      end;
//    end;

    if DynamicShape_Flag = isExist then begin
      if scenario.DynamicShape = nil then
        scenario.DynamicShape := TList.Create;

      for I := Low(DynamicShape) to High(DynamicShape) do begin
        shape := TShape_Definition.Create;
        shape.FData := DynamicShape[i].FData;
        scenario.DynamicShape.Add(shape);
      end;
    end;

    if StaticShape_Flag = isExist then begin
      if scenario.StaticShape = nil then
        scenario.StaticShape := TList.Create;

      for I := Low(StaticShape) to High(StaticShape) do begin
        shape := TShape_Definition.Create;
        shape.FData := StaticShape[i].FData;
        scenario.StaticShape.Add(shape);
      end;
    end;

    if AssetDeploymentObjFlag = isExist then begin
      if scenario.AssetDeployment = nil then
         scenario.AssetDeployment :=  TAsset_Deployment.Create;
      scenario.AssetDeployment.FData   := AssetDeployment ;
    end;

    //dmTTT.getAllPlatFormInstance(ResourceAllocIndex, Platform_Insts );
    for i := low(Platform_Insts) to high(Platform_Insts) do begin
       recPI := Platform_Insts[i] ;
       pi    := __snapshot_getPI(recPI.FData.Platform_Instance_Index);
       if pi = nil then begin
         pi := TPlatform_Instance.Create ;
         pi.FData := recPI.FData ;
         pi.FData.Instance_Name := recPI.InstanceName ;
         pi.FData.Track_ID := recPI.TrackID ;
         pi.FData.Platform_Type := recPI.PlatformType ;
         pi.FActivation := recPI.FActivation ;
         pi.CubicleGroupID  := recPI.CubicleGroupID;
         pi.IsGroupLeader   := recPI.IsGroupLeader;
         scenario.PlatformInstanceListFromDB.Add(pi);

         if scenario.DefaultNonRealPlatform = nil then
         begin
           scenario.DefaultNonRealPlatform := TPlatform_Instance.Create;
           scenario.DefaultNonRealPlatform := pi;
         end;
       end;
    end;


//    dmTTT.getAllRuntimePlatform(scenario.ResourceAllocIndex,scenario.RuntimePlatformLibrary);
    dmTTT.GetResourceRPLMapping(scenario.ResourceAllocIndex,scenario.RPLListFromDB);
    scenario.PutAllPiRPLListToDictionary;

//    for I := low(Formation.FForm) to high(Formation.FForm) do
//    begin
//      recFmDef := Formation.FForm[i];
//      fmDef    := TFormation.Create;
//      fmDef.FFormation_Def := recFmDef.FFormation_Def ;
//      fmDef.FForm_Assign   := recFmDef.FForm_Assign ;
//      scenario.Formation.Add(fmDef);
//    end;

    scenario.Platform_Inst.Clear;
    for I := low(Formation_List.FFormList) to high(Formation_List.FFormList) do
    begin
//       for j := low(Formation_List.FFormList[i].FForm) to high(Formation_List.FFormList[i].FForm) do
//       begin
          fmDef    := TFormation.Create;
          fmDef.FFormation_Def := Formation_List.FFormList[I].FForm.FFormation_Def;
          fmDef.FForm_Assign   := Formation_List.FFormList[I].FForm.FForm_Assign;
//          scenario.Platform_Inst.Add(fmDef);
//       end;
       scenario.Formation_List.Add(scenario.Platform_Inst);
    end;

    // dmTTT.GetLinkDefinition(dIndex, Links);
    for I := low(FLinks) to high(FLinks) do
    begin
       recLink := FLinks[i];
       objLink := TLink.Create ;
       objLink.FLink_Def := recLink.FLink_Def ;
       for j := low(recLink.Participant) to high(recLink.Participant) do begin
          recPI :=  recLink.Participant[j];
          pi := __snapshot_getPI(recPI.FData.Platform_Instance_Index);
          if pi = nil then begin
             pi  := TPlatform_Instance.Create;
             pi.FData := recPI.FData ;
             pi.FActivation := recPI.FActivation ;
             pi.CubicleGroupID  := recPI.CubicleGroupID;
             pi.IsGroupLeader   := recPI.IsGroupLeader;
          end ;
          //pi.PlatformType    := recPI.PlatformType ;
          //pi.InstanceName    := recPI.InstanceName ;
          //pi.TrackID         := recPI.TrackID ;
          objLink.Participant.Add(pi);
       end;
       scenario.Links.Add(objLink);
    end;

//    scenario.MapGeosetName             := MapGeosetName;
    //scenario.predefPatternName         := predefPatternName;   *comment by bebe*
    scenario.overlayName               := overlayName;
    for I := low(allOverlayNames) to high(allOverlayNames) do begin
      scenario.allOverlayNames[i]      := allOverlayNames[i];
    end;

    // reff GetExternal_Communication_Channel
    if ExternalComObjFlag = isExist then begin
        if scenario.ExternalCom = nil then
           scenario.ExternalCom := TExternal_Communication_Channel.Create ;
        scenario.ExternalCom.FData := ExternalCom ;
    end;

    if ExComObjFlag = isExist then begin
      if scenario.ExCom = nil then
         scenario.ExCom := TList.Create;
      for I := low(ExCom) to high(ExCom) do begin
         mExCommChannel         := TExternal_Communication_Channel.Create;
         ExternalCom.Comms_Channel_Index    := ExCom[i].Comms_Channel_Index   ;
         ExternalCom.Resource_Alloc_Index   := ExCom[i].Resource_Alloc_Index  ;
         ExternalCom.Channel_Number         := ExCom[i].Channel_Number        ;
         ExternalCom.Channel_Identifier     := ExCom[i].Channel_Identifier    ;
         ExternalCom.Comms_Band             := ExCom[i].Comms_Band            ;
         ExternalCom.Channel_Freq           := ExCom[i].Channel_Freq          ;
         ExternalCom.Channel_Security       := ExCom[i].Channel_Security      ;
         ExternalCom.Channel_Code           := ExCom[i].Channel_Code          ;
         scenario.ExCom.Add(mExCommChannel);
         scenario.SetEventOnExternalComm;
      end;
    end;

    if Ref_PointObjFlag = isExist then begin
      if scenario.ReferencePoint = nil then
         scenario.ReferencePoint := TReference_Point.Create;
      scenario.ReferencePoint.FData           := Ref_Point.FData;
      scenario.ReferencePoint.Symbol_Name     := Ref_Point.Symbol_Name;
      scenario.ReferencePoint.Symbol_Color    := Ref_Point.Symbol_Color;
      scenario.ReferencePoint.IsSelected      := Ref_Point.IsSelected;
    end;

    // reff getAllReference_Point

    if scenario.ReferencePointListFromDB = nil then
        scenario.ReferencePointListFromDB := TList.Create;
    for i := Low(rpList) to High(rpList) do begin
       mRefPoint :=  TReference_Point.Create;
       mRefPoint.FData := rpList[i].FData ;
       scenario.ReferencePointListFromDB.Add(mRefPoint);
    end;

    //set data embark list
//    if EmbarkListObjFlag = isExist then begin
//      if scenario.BaseListFromDB = nil then
//        scenario.BaseListFromDB := TList.Create;
//
//      for i := Low(EmbarkLib) to High(EmbarkLib) do begin
//        BaseEmbarkLib := TPlatformBase.Create;
//        BaseEmbarkLib.id            :=    EmbarkLib[i].id;
//        BaseEmbarkLib.identifier    :=    EmbarkLib[i].identifier;
//        BaseEmbarkLib.force         :=    EmbarkLib[i].force;
//        BaseEmbarkLib.Longitude     :=    EmbarkLib[i].Longitude;
//        BaseEmbarkLib.Latitude      :=    EmbarkLib[i].Latitude;
//        BaseEmbarkLib.Radius        :=    EmbarkLib[i].Radius;
//        BaseEmbarkLib.TypeBase      :=    EmbarkLib[i].TypeBase;
//        BaseEmbarkLib.Fuel          :=    EmbarkLib[i].Fuel;
//        BaseEmbarkLib.Lubricants    :=    EmbarkLib[i].Lubricants;
//        BaseEmbarkLib.FreshWater    :=    EmbarkLib[i].FreshWater;
//        BaseEmbarkLib.Water         :=    EmbarkLib[i].Water;
//        BaseEmbarkLib.Food          :=    EmbarkLib[i].Food;
//
//        //set data vehicle
//        if EmbarkLib[i].VehicleListFlag = isExist then
//        begin
//          for j := Low(EmbarkLib[i].FVehicleList) to High(EmbarkLib[i].FVehicleList) do begin
//            Platform_Embark_Library := TPlatform_Embark_Library.Create;
//            Platform_Embark_Library.FData := EmbarkLib[i].FVehicleList[j];
//            BaseEmbarkLib.ListVehicle.Add(Platform_Embark_Library);
//          end;
//        end;
//
//        //set data brigade/personel
//        if EmbarkLib[i].BrigadeListFlag = isExist then
//        begin
//          for j := Low(EmbarkLib[i].BrigadeList) to High(EmbarkLib[i].BrigadeList) do begin
//            ObjBrigade := TBrigade.Create;
//            ObjBrigade.Id := EmbarkLib[i].BrigadeList[j].BrigadeData.Id;
//            ObjBrigade.Identifier := EmbarkLib[i].BrigadeList[j].BrigadeData.Identifier;
//            ObjBrigade.VeId := EmbarkLib[i].BrigadeList[j].BrigadeData.VeID;
//
//            //set data batalyon
//            if EmbarkLib[i].BrigadeList[j].BatalyonFlag = isExist then
//            begin
//              for k := Low(EmbarkLib[i].BrigadeList[j].Batalyon) to High(EmbarkLib[i].BrigadeList[j].Batalyon) do
//              begin
//                ObjBatalyon := TBatalyon.Create;
//                ObjBatalyon.Id := EmbarkLib[i].BrigadeList[j].Batalyon[k].BatalyonData.Id;
//                ObjBatalyon.Identifier := EmbarkLib[i].BrigadeList[j].Batalyon[k].BatalyonData.Identifier;
//                ObjBatalyon.ChildFromBrigade := EmbarkLib[i].BrigadeList[j].Batalyon[k].BatalyonData.ChildFromBrigade;
//
//                //set data kompi
//                if EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiFlag = isExist then
//                begin
//                  for l := Low(EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList) to High(EmbarkLib[i].BrigadeList[j].Batalyon) do
//                  begin
//                    ObjKompi := TKompi.Create;
//                    ObjKompi.Id := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].KompiData.Id;
//                    ObjKompi.Identifier := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].KompiData.Identifier;
//                    ObjKompi.ChildFromBrigade := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].KompiData.ChildFromBrigade;
//                    ObjKompi.ChildFromBatalyon := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].KompiData.ChildFromBatalyon;
//
//                    //set data platoon
//                    if EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatoonFlag = isExist then
//                    begin
//                      for m := Low(EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList) to High(EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList) do
//                      begin
//                        ObjPlatoon := TPlatoon.Create;
//                        ObjPlatoon.Id := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].PlatoonData.Id;
//                        ObjPlatoon.Identifier := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].PlatoonData.Identifier;
//                        ObjPlatoon.ChildFromBrigade := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].PlatoonData.ChildFromBrigade;
//                        ObjPlatoon.ChildFromBatalyon := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].PlatoonData.ChildFromBatalyon;
//                        ObjPlatoon.ChildFromKompi := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].PlatoonData.ChildFromKompi;
//
//                        //set data group
//                        if EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupFlag = isExist then
//                        begin
//                          for n := Low(EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList) to High(EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList) do
//                          begin
//                            ObjGroup := TGroup.Create;
//                            ObjGroup.Id := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.Id;
//                            ObjGroup.Identifier := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.Identifier;
//                            ObjGroup.quantity := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].Quantity;
//
//                            ObjGroup.ChildFromBrigade := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.ChildFromBrigade;
//                            ObjGroup.ChildFromBatalyon := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.ChildFromBatalyon;
//                            ObjGroup.ChildFromKompi := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.ChildFromKompi;
//                            ObjGroup.ChildFromPleton := EmbarkLib[i].BrigadeList[j].Batalyon[k].KompiList[l].PlatonList[m].GroupList[n].GroupData.ChildFromPleton;
//
//                            ObjPlatoon.GroupList.Add(ObjGroup);
//                          end;
//                        end;
//                        ObjKompi.PlatoonList.Add(ObjPlatoon);
//                      end;
//                    end;
//                    ObjBatalyon.KompiList.Add(ObjKompi);
//                  end;
//                end;
//                ObjBrigade.BatalyonList.Add(ObjBatalyon);
//              end;
//            end;
//            BaseEmbarkLib.ListPersonel.Add(ObjBrigade);
//          end;
//        end;
//
//        scenario.BaseListFromDB.Add(BaseEmbarkLib);
//      end;
//
//      scenario.PutAllPiBaseListToDictionary;
//    end;
  end;

end;


procedure __snapshot_setGameEnvironment (var GameEnvironment : TGame_Environment_Definition);
begin
  with lRec.FRGameScenario.GameEnvironment do
  begin
    if lRec.FRGameScenario.GameEnvironmentObjFlag = isExist then begin
      if GameEnvironment = nil then
         GameEnvironment := TGame_Environment_Definition.Create;
      GameEnvironment.FData := FData ;
      GameEnvironment.FGameArea := FGameArea ;
      GameEnvironment.FGlobal_Conv := FGlobal_Conv ;
      GameEnvironment.calculateMaxPowerScaleArea;
    end;
  end;
end;

procedure __snapshot_setGameDefault (var GameDefaults : TGame_Defaults);
var count,I: Integer;
begin
  with lRec.FRGameScenario.GameDefaults do
  begin
    if lRec.FRGameScenario.GameDefaultsObjFlag = isExist then begin
      if GameDefaults = nil then
         GameDefaults := TGame_Defaults.Create;
      GameDefaults.FData                  := FData;
      GameDefaults.FGameCloud_ESM         := FGameCloud_ESM;
      GameDefaults.FGameCloud_Radar       := FGameCloud_Radar;
      //edited by andi
      count := Length(FGameDefault_IFF);
      SetLength(GameDefaults.FGameDefault_IFF,count);
      for I := 0 to count - 1 do
      begin
        GameDefaults.FGameDefault_IFF[i] := FGameDefault_IFF[i];
      end;
      //GameDefaults.FGameDefault_IFF       := FGameDefault_IFF;
      GameDefaults.FGameRainfall_ESM      := FGameRainfall_ESM;
      GameDefaults.FGameRainfall_Missile  := FGameRainfall_Missile;
      GameDefaults.FGameRainfall_Radar    := FGameRainfall_Radar;
      GameDefaults.FGameRainfall_Sonar    := FGameRainfall_Sonar;
      GameDefaults.FGameSea_Missile       := FGameSea_Missile;
      GameDefaults.FGameSea_Radar         := FGameSea_Radar;
      GameDefaults.FGameSea_Sonar         := FGameSea_Sonar;
      GameDefaults.FGameShip_Sonar        := FGameShip_Sonar;
    end;
  end;
end;

procedure __snapshot_setRainfall (var Rainfall : TRainfall);
var
  i     : integer ;
  R_ESM : TRainfall_On_ESM;
  R_MSS : TRainfall_On_Missile;
  R_RDR : TRainfall_On_Radar ;
  R_SNR : TRainfall_On_Sonar;
begin
  //FRainfall.LoadFromRainfall();
  for i := low(lRec.FRRainfall.FRainfall_On_ESM) to high(lRec.FRRainfall.FRainfall_On_ESM) do begin
      R_ESM := TRainfall_On_ESM.Create;
      R_ESM.FData := lRec.FRRainfall.FRainfall_On_ESM[i] ;
      Rainfall.FRainfall_On_ESM.Add(R_ESM);
  end;
  for i := low(lRec.FRRainfall.FRainfall_On_Missile) to high(lRec.FRRainfall.FRainfall_On_Missile) do begin
      R_MSS := TRainfall_On_Missile.Create;
      R_MSS.FData := lRec.FRRainfall.FRainfall_On_Missile[i] ;
      Rainfall.FRainfall_On_Missile.Add(R_MSS);
  end;
  for i := low(lRec.FRRainfall.FRainfall_On_Radar) to high(lRec.FRRainfall.FRainfall_On_Radar) do begin
      R_RDR := TRainfall_On_Radar.Create;
      R_RDR.FData := lRec.FRRainfall.FRainfall_On_Radar[i] ;
      Rainfall.FRainfall_On_Radar.Add(R_RDR);
  end;
  for i := low(lRec.FRRainfall.FRainfall_On_Sonar) to high(lRec.FRRainfall.FRainfall_On_Sonar) do begin
      R_SNR := TRainfall_On_Sonar.Create;
      R_SNR.FData := lRec.FRRainfall.FRainfall_On_Sonar[i] ;
      Rainfall.FRainfall_On_Sonar.Add(R_SNR);
  end;
end;

procedure __snapshot_setCloudEffects (var CE : TCloud_Effects);
var
  i     : integer ;
  R_ESM : TCloud_Effects_On_ESM;
  R_RDR : TCloud_Effects_On_Radar ;
begin
  //FCloud_Effects.LoadFromCloudEffects();
  for i := low(lRec.FRCloudEffect.FRainfall_On_ESM) to high(lRec.FRCloudEffect.FRainfall_On_ESM) do begin
      R_ESM := TCloud_Effects_On_ESM.Create;
      R_ESM.FData := lRec.FRCloudEffect.FRainfall_On_ESM[i] ;
      CE.FCloud_Effects_On_ESM.Add(R_ESM);
  end;
  for i := low(lRec.FRCloudEffect.FRainfall_On_Radar) to high(lRec.FRCloudEffect.FRainfall_On_Radar) do begin
      R_RDR := TCloud_Effects_On_Radar.Create;
      R_RDR.FData := lRec.FRCloudEffect.FRainfall_On_Radar[i] ;
      CE.FCloud_Effects_On_Radar.Add(R_RDR);
  end;
end;

procedure __snapshot_setDefaultVar(var DV : TDefault_Var);
var
  i : integer ;
begin
   with lRec.FRDefaultVar do
   begin
      SetLength(DV.Sea_State_On_Missile_Safe_Altitude,length(Sea_State_On_Missile_Safe_Altitude));
      for i := 0 to length(DV.Sea_State_On_Missile_Safe_Altitude)-1 do
         Sea_State_On_Missile_Safe_Altitude[i] := DV.Sea_State_On_Missile_Safe_Altitude[i];

      SetLength(DV.Sea_State_On_Radar,length(Sea_State_On_Radar));
      for i := 0 to length(DV.Sea_State_On_Radar)-1 do
         Sea_State_On_Radar[i] := DV.Sea_State_On_Radar[i];

      SetLength(DV.Sea_State_On_Sonar,length(Sea_State_On_Sonar));
      for i := 0 to length(DV.Sea_State_On_Sonar)-1 do
         Sea_State_On_Sonar[i] := DV.Sea_State_On_Sonar[i];
   end;
end;

procedure __snapshot_setDatalinks(const sim : TT3UnitContainer; var DL1,DL2,DL3 : TT3DataLink);
var
  i,pid  : integer ;
  p      : TT3PlatformInstance;
begin
   if DL1 <> nil then begin
      DL1.SetSnapshotData(lRec.FRDataLink[0]);
      with lRec.FRDataLink[0] do begin
        for i := low(EligibleUnits) to high(EligibleUnits) do begin
            pid :=  EligibleUnits[I];
            p := __snapshot_getT3PI(sim,pid);
            if p <> nil then
               DL1.AddEligibleUnit(p);
        end;
        for i := low(ParticipatingUnits) to high(ParticipatingUnits) - 1 do begin
            pid := ParticipatingUnits[I];
            p := __snapshot_getT3PI(sim,pid);
             if p <> nil then
              DL1.AddParticipatingUnit(p);
        end;
      end;
   end;

   if DL2 <> nil then begin
      DL2.SetSnapshotData(lRec.FRDataLink[1]);
      with lRec.FRDataLink[1] do begin
        for i := low(EligibleUnits) to high(EligibleUnits) do begin
            pid :=  EligibleUnits[I];
            p := __snapshot_getT3PI(sim,pid);
            if p <> nil then
               DL1.AddEligibleUnit(p);
        end;
        for i := low(ParticipatingUnits) to high(ParticipatingUnits) - 1 do begin
            pid := ParticipatingUnits[I];
            p := __snapshot_getT3PI(sim,pid);
             if p <> nil then
              DL1.AddParticipatingUnit(p);
        end;
      end;
   end;

   if DL3 <> nil then begin
      DL3.SetSnapshotData(lRec.FRDataLink[2]);
      with lRec.FRDataLink[2] do begin
        for i := low(EligibleUnits) to high(EligibleUnits) do begin
            pid :=  EligibleUnits[I];
            p := __snapshot_getT3PI(sim,pid);
            if p <> nil then
               DL1.AddEligibleUnit(p);
        end;
        for i := low(ParticipatingUnits) to high(ParticipatingUnits) - 1 do begin
            pid := ParticipatingUnits[I];
            p := __snapshot_getT3PI(sim,pid);
             if p <> nil then
              DL1.AddParticipatingUnit(p);
        end;
      end;
   end;

end;


function __snapshot_setVehicleData ( const ss : _SS_TT3Vehicle ; var pi : TPlatform_Instance ) : boolean ;
var
   idx      : integer ;
begin
   /// getAllPlatFormInstance
   try
      pi := __snapshot_getPI(ss.P.SST3Unit.InstanceIndex) ;
      if pi = nil then begin
         pi := TPlatform_Instance.Create;
      end;
      pi.FData         := ss.P.FData ;
      pi.FActivation   := ss.P.UnitActivation ;
      //---
      pi.Vehicle.FData              := ss.VehicleDefinition.FData ;
      pi.Vehicle.FPlatform_Ident    := ss.VehicleDefinition.FPlatform_Ident ;
      pi.Vehicle.FHeliLimitation    := ss.VehicleDefinition.FHeliLimitation ;
      pi.Motion.FData               := ss.P.UnitMotion ;
      idx := ss.P.SST3Unit.InstanceIndex  ;

      // LoadPlatformDefinition
      //sensor
      lRec.SetEOSensorListFromVehicleID(idx,            pi.Vehicle.EOSensors);            //dmTTT.getAllEO_On_Board(vIndex,0,               pi.Vehicle.EOSensors);
      lRec.SetESMSensorListFromVehicleID(idx,           pi.Vehicle.ESMSensors);           //dmTTT.getAllESM_On_Board(vIndex,0,              pi.Vehicle.ESMSensors);
      lRec.SetIFFSensorListFromVehicleID(idx,           pi.Vehicle.IFFSensors);           //dmTTT.getAllIFF_Sensor_On_Board(vIndex,0,       pi.Vehicle.IFFSensors);
      lRec.SetMADSensorListFromVehicleID(idx,           pi.Vehicle.MADSensors);           //dmTTT.getAllMAD_Sensor_On_Board(vIndex,0,       pi.Vehicle.MADSensors);
      lRec.SetVisualSensorListFromVehicleID(idx,        pi.Vehicle.Visualsensors);        //dmTTT.getAllVisual_Sensor_On_Board(vIndex,0,    pi.Vehicle.Visualsensors);
      lRec.SetFCRSensorListFromVehicleID(idx,           pi.Vehicle.FCRSensors);           //dmTTT.getAllFCR_On_Board(vIndex,                pi.Vehicle.FCRSensors);
      lRec.SetRadarListFromVehicleID(idx,               pi.Vehicle.Radars);               //dmTTT.GetAllRadar_On_Board(vIndex,0,            pi.Vehicle.Radars);
      lRec.SetSonarSensorListFromVehicleID(idx,         pi.Vehicle.Sonars);               //dmTTT.GetAllSonar_On_Board(vIndex,0,            pi.Vehicle.Sonars);
      //weapon fit on Board
      lRec.SetMissileOnVehicleListFromVehicleID(idx,    pi.Vehicle.Missiles);             //dmTTT.getAllMissile_OnBoard2(vIndex,0,          Pi.Vehicle.Missiles  );
      lRec.SetTorpedoOnVehicleListFromVehicleID(idx,    pi.Vehicle.Torpedos);             //dmTTT.getAllTorpedo_OnBoard(vIndex,0,           Pi.Vehicle.Torpedos  );
      lRec.SetMineOnVehicleListFromVehicleID(idx,       pi.Vehicle.Mines);                //dmTTT.getAllMines_OnBoard(vIndex,0 ,            Pi.Vehicle.Mines );
      lRec.SetBomsOnVehicleListFromVehicleID(idx,       pi.Vehicle.Bombs);                //dmTTT.GetAllBomb(vIndex,                        Pi.Vehicle.Bombs);
      lRec.SetGunOnVehicleListFromVehicleID(idx,        pi.Vehicle.Guns);                 //dmTTT.GetAllGun(vIndex,                         Pi.Vehicle.Guns);
      //---
      lRec.SetAllAcoustic_Decoy_On_Board(idx,           pi.Vehicle.Acoustic_Decoys);      //dmTTT.getAllAcoustic_Decoy_On_Board(vIndex,     pi.Vehicle.Acoustic_Decoys);
      lRec.SetAllAir_Bubble_Mount(idx,                  pi.Vehicle.Air_Bubble_Mount);     //dmTTT.getAllAir_Bubble_Mount(vIndex,            pi.Vehicle.Air_Bubble_Mount);
      lRec.SetAllChaff_On_Board(idx,                    pi.Vehicle.Chaffs);               //dmTTT.getAllChaff_On_Board(vIndex,              pi.Vehicle.Chaffs);
      lRec.SetAllChaff_Launcher_On_Board(idx,           pi.Vehicle.Chaff_Launchers);      //dmTTT.getAllChaff_Launcher_On_Board(vIndex,     pi.Vehicle.Chaff_Launchers);
      lRec.SetAllFloating_Decoy_On_Board(idx,           pi.Vehicle.Floating_Decoys);      //dmTTT.getAllFloating_Decoy_On_Board(vIndex,     pi.Vehicle.Floating_Decoys);
      lRec.SetAllJammer_On_Board(idx,                   pi.Vehicle.Jammers);              //dmTTT.getAllJammer_On_Board(vIndex,             pi.Vehicle.Jammers);
      // input by rec ss
      lRec.SetHybrid_Definition(ss,                     Pi.Vehicle.Hybrids   );           //dmTTT.GetHybrid_Definition(vIndex,              Pi.Vehicle.Hybrids   );
      lRec.SetAllDefensive_Jammer_On_Board(ss,          pi.Vehicle.Defensive_Jammers);    //dmTTT.getAllDefensive_Jammer_On_Board(vIndex,   pi.Vehicle.Defensive_Jammers);
      lRec.SetAllInfrared_Decoy_On_Board(ss,            pi.Vehicle.Infrared_Decoys);      //dmTTT.getAllInfrared_Decoy_On_Board(vIndex,     pi.Vehicle.Infrared_Decoys);
      lRec.SetAllPointEffect_On_Board(ss,               pi.Vehicle.Point_Effects);        //dmTTT.getAllPoint_Effect_On_Board(vIndex,       pi.Vehicle.Point_Effects);
      lRec.SetAllTowed_Jammer_Decoy_On_Board(ss,        pi.Vehicle.Towed_Jammer_Decoys) ; //dmTTT.getAllTowed_Jammer_Decoy_On_Board(vIndex, pi.Vehicle.Towed_Jammer_Decoys);
      lRec.SetHosted_Platform(ss,                       pi.Vehicle.Hosted_Platform);      //dmTTT.getHosted_Platform(vIndex,0,              pi.Vehicle.Hosted_Platform);
      lRec.SetAllSonobuoy_On_Board(ss,                  pi.Vehicle.Sonobuoy);        //dmTTT.getAllSonobuoy_On_Board(vIndex,0,         Pi.Vehicle.Sonobuoy );
      //---
      Result := true ;

   except on E: Exception do
      Result := false ;
   end;
end;

procedure __snapshotSetNonRealtimeList( const sim : TT3UnitContainer;
    const mgr : TT3SimManager ; const FIsInstructor : boolean ; var sLog : string);
var
   i,idx : integer;
   piT3  : TT3PlatformInstance;
   rec   : TRecCmd_LaunchNonRP;
begin
  for i := Low(lRec.FRNonRealTime) to High(lRec.FRNonRealTime) do
  begin
    recSSNonRealtime := lRec.FRNonRealTime[i] ;
    idx := recSSNonRealtime.V.P.SST3Unit.InstanceIndex ;

    rec.NRPPlatformID := idx ;
    rec.TrackIdent    := recSSNonRealtime.V.P.Track_ID;
    rec.InstanceName  := recSSNonRealtime.V.P.SST3Unit.InstanceName;
    rec.NewPlatformID := idx;
    rec.pX            := recSSNonRealtime.V.P.SST3Unit.FObject.PosX;
    rec.pY            := recSSNonRealtime.V.P.SST3Unit.FObject.Posy;
    rec.Identity      := recSSNonRealtime.V.P.SST3Unit.TrackIdent;
    rec.PointType     := recSSNonRealtime.NRPType;
    rec.TrackDomain   := recSSNonRealtime.V.P.SST3Unit.TrackDomain;
    rec.Symbol        := recSSNonRealtime.SymbolType;
    rec.NRPGroupID    := recSSNonRealtime.V.P.GroupIndex;

    piT3 := mgr.LaunchNonRealtimeRuntimePlatform(rec);

    if (piT3 <> nil) then
    begin
      if piT3 is TT3NonRealVehicle then
         TT3NonRealVehicle(piT3).SetSnapshotData(recSSNonRealtime)
      else
        TT3NonRealVehicle(piT3).SetSnapshotData(recSSNonRealtime);
    end;
  end;
end;

procedure __snapshotSetPointRBLW_VehicleMissile( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ; var sLog : string);
var
   i : integer;
   PointRBLW : TPointVehicleMissileRBLW;
begin
  for i := Low(lRec.FRPointRBLW) to High(lRec.FRPointRBLW) do begin
      recRBLW   := lRec.FRPointRBLW[i] ;
      PointRBLW := TPointVehicleMissileRBLW.Create(recRBLW.PointRBLW_X1, recRBLW.PointRBLW_Y1,
                    recRBLW.IndexPoint, recRBLW.LauncherIndex, recRBLW.OwnerID);
      //VehicleWeapon.RBLW_PointList.Add(PointRBLW);
      if ( PointRBLW <> nil ) then begin
        PointRBLW.SetSnapshotData(recRBLW);
        sim.addObject(PointRBLW);
      end;
  end;
end;

procedure __snapshotSetPointBOLW_VehicleMissile( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ; var sLog : string);
var
   i : integer;
   PointBOLW : TPointVehicleMissileBOLW;
begin
  for i := Low(lRec.FRPointBOLW) to High(lRec.FRPointBOLW) do begin
      recBOLW   := lRec.FRPointBOLW[i] ;
      PointBOLW := TPointVehicleMissileBOLW.Create(recBOLW.PointBOLW_X1, recBOLW.PointBOLW_Y1,
                    recBOLW.IndexPoint, recBOLW.LauncherIndex, 0);
      //VehicleWeapon.RBLW_PointList.Add(PointRBLW);
      if ( PointBOLW <> nil ) then begin
        PointBOLW.SetSnapshotData(recBOLW);
        sim.addObject(PointBOLW);
      end;
  end;

end;

procedure __snapshotSetVehicleList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ; var sLog : string;  var FlastPlatformID : Integer);
var
   i, j, idx : integer;
   pi    : TPlatform_Instance;
   piT3, piT3Find  : TT3PlatformInstance;
   recPI : _SS_TT3PlatformInstance;
begin
  for i := Low(lRec.FRVehicle) to High(lRec.FRVehicle) do
  begin
    recSSVehicle := lRec.FRVehicle[i] ;
    idx := recSSVehicle.P.SST3Unit.InstanceIndex ;

 //   if recSSVehicle.LaunchFromRPL then
 //     FlastPlatformID := idx;

    if __snapshot_setVehicleData(recSSVehicle,pi) then
    begin
      piT3 :=  mgr.SimAssetAssignment(pi);

      { public field }
      recPI := recSSVehicle.P ;

      piT3.reasonDestroy     := recPI.reasonDestroy   ;
      piT3.UnitMakeDestroy   := recPI.UnitMakeDestroy ;
      piT3.isSkipDraw        := recPI.isSkipDraw      ;
      //piT3.masukJamming      := recPI.masukJamming    ;

      for j := low(recPI.VehicleOnJamming) to high(recPI.VehicleOnJamming) do
      begin
         piT3Find := __snapshot_getT3PI(sim,recPI.VehicleOnJamming[j]);
         if piT3Find<> nil then piT3.VehicleOnJamming.Add(piT3Find);
      end;

      for j := low(recPI.ParentInJamming) to high(recPI.ParentInJamming) do
      begin
         piT3Find := __snapshot_getT3PI(sim,recPI.ParentInJamming[j]);
         if piT3Find<> nil then piT3.ParentInJamming.Add(piT3Find);
      end;

      for j := low(recPI.SubParentInJamming) to high(recPI.SubParentInJamming) do
      begin
         piT3Find := __snapshot_getT3PI(sim,recPI.SubParentInJamming[j]);
         if piT3Find<> nil then piT3.SubParentInJamming.Add(piT3Find);
      end;

      for j := low(recPI.SonobuoyList) to high(recPI.SonobuoyList) do
      begin
         piT3Find := __snapshot_getT3PI(sim,recPI.SonobuoyList[j]);
         if piT3Find<> nil then piT3.SonobuoyList.Add(piT3Find);
      end;

//      for j := low(recPI.PlatformDetectBySonobuoy) to high(recPI.PlatformDetectBySonobuoy) do
//      begin
//         piT3Find := __snapshot_getT3PI(sim,recPI.PlatformDetectBySonobuoy[j]);
//         if piT3Find<> nil then piT3.PlatformDetectBySonobuoy.Add(piT3Find);
//      end;

      piT3.FDelayTIOW          := recPI.FDelayTIOW;
      { public field }
      sLog :=  'Snapshot Get Platform Instance : " ID ' + IntToStr(idx) +'. '+piT3.InstanceName + ' ".';
               __snapshot_setprogress(sLog);
    end
    else
      sLog := 'Snapshot Error Get Platform Instance : "' + recSSVehicle.P.SST3Unit.InstanceName +  '".';

  end;
end;

procedure __snapshotSetVehicleDefList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ; var sLog : string);
var
   i, j, idx : integer;
   ve    : TT3Vehicle;
   obj   : TObject;
begin

  for i := 0 to sim.itemCount - 1 do
  begin
    obj := sim.getObject(i);
    if obj is TT3Vehicle then
    begin
      ve := TT3Vehicle(obj);
      idx := ve.InstanceIndex  ;
      if lRec.GetVehicleDataFromVehicleID(idx,recSSVehicle) then
      begin
        recSSVehicle := lRec.FRVehicle[i] ;
        ve.SetSnapshotData(recSSVehicle);
        /// --------  device
        for j:= 0 to ve.Devices.Count - 1 do
        begin
          obj := ve.Devices[j] ;
          if obj is TT3Sensor then
             lRec.SnapshotSetDeviceSensor(obj,slog)
          else  if obj is TT3CounterMeasure then
             lRec.SnapshotSetDeviceCounterMeasure(obj,slog)
          else
             slog := 'Snapshot Unlisted on Device "' + obj.ClassName +  '".';
        end;
        /// --------  device
        for j:= 0 to ve.Weapons.Count - 1 do
        begin  /// -------- Weapons
          obj := ve.Weapons[j] ;
          lRec.SnapshotSetWeaponOnVehicle(sim,mgr,FIsInstructor,obj,slog);
        end;
        __snapshot_setprogress('Snapshot Vehicle List :: ' + recSSVehicle.P.SST3Unit.InstanceName);

      end
      else
         slog := 'Snapshot :: Unknown Vehicle ID "'+IntToStr(idx)+'".';

    end
    else // end if obj is TT3Vehicle then begin
      slog := 'Snapshot :: Unlisted SimPlatforms "'+TT3PlatformInstance(obj).ClassName+'".';

  end;
end;

function TRecObjectSnapshot.SnapshotLaunchGun(const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ;
    const rec: _SS_TT3GunShoot): TObject;
begin
  Result := nil;
end;

function TRecObjectSnapshot.SnapshotLaunchVectac(const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean ;
    const rec: _SS_TT3Vectac): TObject;
var
  ve : TT3Vehicle;
begin
  ve := __snapshot_getT3PI(sim,rec.Owner) as TT3Vehicle;
  Result := ve;

  if not Assigned(ve) then
    Exit;

  ve.Health := rec.W.P.SST3Unit.Health;
  ve.HealthPercent := rec.W.P.SST3Unit.HealthPercent;
  mgr.UpdateAllDevicePlatform(ve);
  ve.Dormant := rec.W.P.Dormant;
  //ve.DormantTime := 120;
  ve.DormantTime := 60;
end;


function __snapshotLaunchMissiles(const sim : TT3UnitContainer; const mgr : TT3SimManager ;
   rec : _SS_TT3Missile) : TObject ;
var
  pi : TT3PlatformInstance;
  mis : TObject;
  r   : TRecCmd_LaunchMissile;
//  qty : integer;
begin
  Result := nil;
  r.ParentPlatformID        := rec.Owner ;
  r.TargetPlatformID        := rec.W.TargetObject ;
  r.LauncherID              := rec.LauncherNumber ;
  r.NoCubicle               := rec.W.P.SST3Unit.NoCubicle ;
  r.ProjectileInstanceIndex := rec.W.P.SST3Unit.InstanceIndex ;
  r.MissileID               := rec.W.WeaponOnVehicleID;

  pi   := __snapshot_getT3PI(sim,r.ParentPlatformID);
  if (pi <> nil) and (pi is TT3Vehicle) then begin
    mis  := TT3Vehicle(pi).getWeapon(r.MissileID, TT3MissilesOnVehicle);
    if mis <> nil then begin
//       qty :=  TT3MissilesOnVehicle(mis).Quantity ;
//       TT3MissilesOnVehicle(mis).Quantity := qty + 1;
       Result := mgr.LaunchMissile(r);
//       TT3MissilesOnVehicle(mis).Quantity := qty ;
    end;
  end;

end;

procedure __snapshotSetMissileList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
var
   i : integer ;
   obj : TObject ;
begin
  for i := Low(lRec.FRTT3Missile_SS) to High(lRec.FRTT3Missile_SS) do begin
      recSSMissile_SS := lRec.FRTT3Missile_SS[i] ;
      obj := __snapshotLaunchMissiles(sim,mgr,recSSMissile_SS.M);
      if obj <> nil then begin
        if obj is TT3Missile_SS then
           TT3Missile_SS(obj).SetSnapshotData(recSSMissile_SS)
        else
          TT3Missile(obj).SetSnapshotData(recSSMissile_SS.M);
      end;
  end;

  for i := Low(lRec.FRTT3Missile_SA) to High(lRec.FRTT3Missile_SA) do begin
      recSSMissile_SA := lRec.FRTT3Missile_SA[i] ;
      obj := __snapshotLaunchMissiles(sim,mgr,recSSMissile_SA.M);
      if obj <> nil then begin
        if obj is TT3Missile_SA then
           TT3Missile_SA(obj).SetSnapshotData(recSSMissile_SA)
        else
          TT3Missile(obj).SetSnapshotData(recSSMissile_SA.M);
     end;
  end;

  for i := Low(lRec.FRTT3Missile_AA) to High(lRec.FRTT3Missile_AA) do begin
      recSSMissile_AA := lRec.FRTT3Missile_AA[i] ;
      obj := __snapshotLaunchMissiles(sim,mgr,recSSMissile_AA.M);
      if obj <> nil then begin
        if obj is TT3Missile_AA then
          TT3Missile_AA(obj).SetSnapshotData(recSSMissile_AA)
        else
          TT3Missile(obj).SetSnapshotData(recSSMissile_AA.M);
      end;
  end;

  for i := Low(lRec.FRTT3Missile_AS) to High(lRec.FRTT3Missile_AS) do begin
      recSSMissile_AS := lRec.FRTT3Missile_AS[i] ;
      obj := __snapshotLaunchMissiles(sim,mgr,recSSMissile_AS.M);
      if obj <> nil then begin
        if obj is TT3Missile_AS then
          TT3Missile_AS(obj).SetSnapshotData(recSSMissile_AS)
        else
          TT3Missile(obj).SetSnapshotData(recSSMissile_AS.M);
      end;
  end;

 for i := Low(lRec.FRTT3Missile_LA) to High(lRec.FRTT3Missile_LA) do begin
      recSSMissile_LA := lRec.FRTT3Missile_LA[i] ;
      obj := __snapshotLaunchMissiles(sim,mgr,recSSMissile_LA.M);
      if obj <> nil then begin
        if obj is TT3Missile_LA then
          TT3Missile_LA(obj).SetSnapshotData(recSSMissile_LA)
        else
          TT3Missile(obj).SetSnapshotData(recSSMissile_LA.M);
     end;
  end;

  for i := Low(lRec.FRTT3Missile_HM) to High(lRec.FRTT3Missile_HM) do begin
      recSSMissile_HM := lRec.FRTT3Missile_HM[i] ;
      obj := __snapshotLaunchMissiles(sim,mgr,recSSMissile_HM.M);
      if obj <> nil then begin
        if obj is TT3Missile_HM then
          TT3Missile_HM(obj).SetSnapshotData(recSSMissile_HM)
        else
          TT3Missile(obj).SetSnapshotData(recSSMissile_HM.M);
      end;
  end;

  for i := Low(lRec.FRTT3Missile_TM) to High(lRec.FRTT3Missile_TM) do begin
      recSSMissile_TM := lRec.FRTT3Missile_TM[i] ;
      obj := __snapshotLaunchMissiles(sim,mgr,recSSMissile_TM.M);
      if obj <> nil then begin
        if obj is TT3Missile_TM then
          TT3Missile_TM(obj).SetSnapshotData(recSSMissile_TM)
        else
          TT3Missile(obj).SetSnapshotData(recSSMissile_TM.M);
      end;
  end;
end;

procedure __snapshotSetTorpedoList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );

  function isTargetExist ( tor : TT3Torpedo ; id : integer ) : boolean ;
  var
     i : integer ;
  begin
     Result := false ;
     if tor = nil then exit ;
     for I := 0 to tor.TargetPlatforms.itemCount - 1 do begin
         if TT3Unit(tor.TargetPlatforms).InstanceIndex = id then
         begin
            Result := true ;
            break ;
         end;
    end;
       
  end;

var
   i,j,id  : integer ;
   pi      : TT3PlatformInstance;
   onVhc   : TObject ;
   torpedo : TObject ;
   rec     : TRecCmd_LaunchMissile ;
//   qty     : integer;
begin
  for i := Low(lRec.FRTT3Torpedo) to High(lRec.FRTT3Torpedo) do begin
      rec.ParentPlatformID        := lRec.FRTT3Torpedo[i].Owner ;
      rec.TargetPlatformID        := lRec.FRTT3Torpedo[i].W.TargetObject ;
      rec.ProjectileInstanceIndex := lRec.FRTT3Torpedo[i].W.P.SST3Unit.InstanceIndex ;
      rec.MissileID               := lRec.FRTT3Torpedo[i].W.WeaponOnVehicleID;
      rec.NoCubicle               := lRec.FRTT3Torpedo[i].W.P.SST3Unit.NoCubicle;
      pi := __snapshot_getT3PI(sim,rec.ParentPlatformID);
      if (pi <> nil) and (pi is TT3Vehicle) then begin
        {weapon category 18 adalah torpedo untuk category hybrid}
        if lRec.FRTT3Torpedo[i].W.WeaponCategory <> 18 then
        begin
          onVhc  := TT3Vehicle(pi).getWeapon(rec.MissileID, TT3TorpedoesOnVehicle);
  //        qty := TT3TorpedoesOnVehicle(onVhc).Quantity ;
          if onVhc <> nil then
          torpedo := nil;
  //          TT3TorpedoesOnVehicle(onVhc).Quantity := qty + 1 ;
            torpedo := mgr.LaunchTorpedo(rec);
            if torpedo <> nil then begin
               TT3Torpedo(torpedo).SetSnapshotData(lRec.FRTT3Torpedo[i]);
               for j := low(lRec.FRTT3Torpedo[i].TargetPlatforms) to
                        high(lRec.FRTT3Torpedo[i].TargetPlatforms) do begin
                   id := lRec.FRTT3Torpedo[i].TargetPlatforms[j].InstanceIndex ;
                   if not isTargetExist(TT3Torpedo(torpedo),id) then begin
                      pi := __snapshot_getT3PI(sim,id);
                      if pi <> nil then
                         TT3Torpedo(torpedo).TargetPlatforms.addObject(pi);
                   end;
               end;
            end;
        end
        else
        begin
          torpedo := mgr.CreateTorpedoProjectileHybrid(rec.ParentPlatformID,
                      rec.MissileID, rec.ProjectileInstanceIndex);

          if torpedo <> nil then begin
             TT3Torpedo(torpedo).SetSnapshotData(lRec.FRTT3Torpedo[i]);
             for j := low(lRec.FRTT3Torpedo[i].TargetPlatforms) to
                      high(lRec.FRTT3Torpedo[i].TargetPlatforms) do begin
                 id := lRec.FRTT3Torpedo[i].TargetPlatforms[j].InstanceIndex ;
                 if not isTargetExist(TT3Torpedo(torpedo),id) then begin
                    pi := __snapshot_getT3PI(sim,id);
                    if pi <> nil then
                       TT3Torpedo(torpedo).TargetPlatforms.addObject(pi);
                 end;
             end;
          end;
        end;
//          TT3TorpedoesOnVehicle(onVhc).Quantity := qty;
      end;
  end;
end;

procedure __snapshotSetBombList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );

  function isTargetExist ( bom : TT3Bomb ; id : integer ) : boolean ;
  var
     i : integer ;
  begin
     Result := false ;
     if bom = nil then exit ;
     for I := 0 to bom.TargetPlatforms.itemCount - 1 do begin
         if TT3Unit(bom.TargetPlatforms).InstanceIndex = id then
         begin
            Result := true ;
            break ;
         end;
    end;

  end;

var
   i,j,id   : integer ;
   pi       : TT3PlatformInstance;
   bom,
   onVhc    : TObject ;
   r        : TRecCmd_LaunchBomb ;
   qty      : integer;
begin
  for i := Low(lRec.FRTT3Bomb) to High(lRec.FRTT3Bomb) do begin
    r.ParentPlatformID  := lRec.FRTT3Bomb[i].Owner ;
    r.ParentPlatformID  := lRec.FRTT3Bomb[i].W.TargetObject ;
    r.ProjectileInstanceIndex := lRec.FRTT3Bomb[i].W.P.SST3Unit.InstanceIndex ;
    pi := __snapshot_getT3PI(sim,r.ParentPlatformID);
    if (pi <> nil) and (pi is TT3Vehicle) then begin
      onVhc  := TT3Vehicle(pi).getWeapon(r.BombOnVehicleID, TT3BombONVehicle);
      qty    := TT3BombONVehicle(onVhc).Quantity ;
      if onVhc <> nil then begin
         TT3BombONVehicle(onVhc).Quantity := qty + 1 ;
//         r.SalvoSize := TT3BombONVehicle(onVhc).SalvoSize ;
      end;

      bom := mgr.LaunchBomb(r);
      if bom <> nil then begin
         TT3Bomb(bom).SetSnapshotData(lRec.FRTT3Bomb[i]);

         for j := low(lRec.FRTT3Bomb[i].TargetPlatforms) to
                high(lRec.FRTT3Bomb[i].TargetPlatforms) do begin
           id := lRec.FRTT3Bomb[i].TargetPlatforms[j].InstanceIndex ;
           if not isTargetExist(TT3Bomb(bom),id) then begin
              pi := __snapshot_getT3PI(sim,id);
              if pi <> nil then
                 TT3Bomb(bom).TargetPlatforms.addObject(pi);
           end;
         end;
         id := lRec.FRTT3Bomb[i].TargetedTrack ;
         pi := __snapshot_getT3PI(sim,id);
         if pi <> nil then
//            TT3Bomb(bom).TargetedTrack := pi ;
      end;

      TT3BombONVehicle(onVhc).Quantity := qty ;

    end;

  end;
end;

procedure __snapshotSetGunList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
var
   i : integer ;
   obj : TObject ;
begin
  for i := Low(lRec.FRTT3GunShoot) to High(lRec.FRTT3GunShoot) do begin
      obj := lRec.SnapshotLaunchGun(sim,mgr,FIsInstructor,lRec.FRTT3GunShoot[i]);
      if obj <> nil then
         TT3GunShoot(obj).SetSnapshotData(lRec.FRTT3GunShoot[i]);
  end;
end;

procedure __snapshotSetVectacList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
var
   i : integer ;
   obj : TObject ;
   piT3   : TT3PlatformInstance ;
begin
  for i := Low(lRec.FRVectac) to High(lRec.FRVectac) do begin
      obj := lRec.SnapshotLaunchVectac(sim,mgr,FIsInstructor,lRec.FRVectac[i]);
      if obj <> nil then
      begin
        if obj is TT3Vectac then
        begin
          TT3Vectac(obj).SetSnapshotData(lRec.FRVectac[i]);

          piT3 := __snapshot_getT3PI(sim, lRec.FRVectac[i].Owner);
          if piT3 <> nil then
              TT3Vectac(obj).Owner := piT3 ;

          piT3 := __snapshot_getT3PI(sim, lRec.FRVectac[i].Target);
          if piT3 <> nil then
              TT3Vectac(obj).Target := piT3 ;

          piT3 := __snapshot_getT3PI(sim, lRec.FRVectac[i].WeaponCarrier);
          if piT3 <> nil then
              TT3Vectac(obj).WeaponCarrier := piT3 ;
        end;
      end;
  end;
end;

function __snapshotLaunchBubble(const sim : TT3UnitContainer; const mgr : TT3SimManager ;
   rec : _SS_TT3AirBubble) : TObject ;
var
  pi : TT3PlatformInstance;
  obj : TObject;
  r : TRecCmd_LaunchBubble;
  qty : integer;
begin
  Result := nil;
  r.ParentPlatformID        := rec.Owner ;
  r.BubbleInstanceIndex     := rec.P.SST3Unit.InstanceIndex;
  r.ChaffOnVehicleID        := rec.BubbleInstanceIndex;

  pi   := __snapshot_getT3PI(sim,r.ParentPlatformID);
  if (pi <> nil) and (pi is TT3Vehicle) then begin
    obj  := TT3Vehicle(pi).getDevice(r.ChaffOnVehicleID, TT3AirBubbleOnVehicle);
    if obj <> nil then begin
       qty :=  TT3AirBubbleOnVehicle(obj).Quantity ;
       TT3AirBubbleOnVehicle(obj).Quantity := qty + 1;
       Result := mgr.LaunchBubble(r);
       TT3AirBubbleOnVehicle(obj).Quantity := qty ;
    end;
  end;

end;

procedure __snapshotSetAirBubbleList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
var
   i : integer ;
   obj : TObject ;
   //pi : TT3PlatformInstance;
begin
  for i := Low(lRec.FRAirBubble) to High(lRec.FRAirBubble) do begin
      obj := __snapshotLaunchBubble(sim,mgr,lRec.FRAirBubble[i]);
      if obj <> nil then
         TT3AirBubble(obj).SetSnapshotData(lRec.FRAirBubble[i]);

  end;
end;

function __snapshotLaunchChaff(const sim : TT3UnitContainer; const mgr : TT3SimManager ;
   rec : _SS_TT3Chaff) : TObject ;
var
  pi : TT3PlatformInstance;
  obj : TObject;
  r : TRecCmd_LaunchChaff;
  qty : integer;
begin
  Result := nil;
  r.ParentPlatformID        := rec.Owner ;
  r.ChaffInstanceIndex      := rec.P.SST3Unit.InstanceIndex;
  r.ChaffOnVehicleID        := rec.ChaffInstanceIndex;
  r.LauncherID              := rec.LauncherID;

  pi   := __snapshot_getT3PI(sim,r.ParentPlatformID);
  if (pi <> nil) and (pi is TT3Vehicle) then begin
    obj  := TT3Vehicle(pi).getDevice(r.ChaffOnVehicleID, TT3ChaffOnVehicle);
    if obj <> nil then begin
       qty :=  TT3ChaffOnVehicle(obj).Quantity ;
       TT3ChaffOnVehicle(obj).Quantity := qty + 1;
       Result := mgr.LaunchChaff(r);
       TT3ChaffOnVehicle(obj).Quantity := qty ;
    end;
  end;

end;

procedure __snapshotSetChaffList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
var
   i : integer ;
   obj : TObject ;
   //pi : TT3PlatformInstance;
begin
  for i := Low(lRec.FRChaff) to High(lRec.FRChaff) do begin
      obj := __snapshotLaunchChaff(sim,mgr,lRec.FRChaff[i]);
      if obj <> nil then
         TT3Chaff(obj).SetSnapshotData(lRec.FRChaff[i]);
  end;
end;

function __snapshotLaunchMine(const sim : TT3UnitContainer; const mgr : TT3SimManager ;
   rec : _SS_TT3Mine) : TObject ;
var
  pi : TT3PlatformInstance;
  obj : TObject;
  r : TRecCmd_LaunchMine;
//  qty : integer;
begin
  Result := nil;
  r.ParentPlatformID := rec.Owner;
  r.MineOnVehicleID  := rec.B.W.WeaponOnVehicleID;
  r.Depth            := rec.B.OrderDepth;
  r.ProjectileInstanceIndex := rec.B.W.P.SST3Unit.InstanceIndex;

  pi := __snapshot_getT3PI(sim,r.ParentPlatformID);
  if (pi <> nil) and (pi is TT3Vehicle) then begin
    obj  := TT3Vehicle(pi).getWeapon(r.MineOnVehicleID, TT3MineOnVehicle);
    if obj <> nil then begin
//       qty :=  TT3MineOnVehicle(obj).Quantity ;
//       TT3MineOnVehicle(obj).Quantity := qty + 1;
       Result := mgr.LaunchMine(r);
//       TT3MineOnVehicle(obj).Quantity := qty ;
    end;
  end;
end;

procedure __snapshotSetMineList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
var
  I: Integer;
  obj: TObject;
begin
  for I := Low(lRec.FRTT3Mine) to High(lRec.FRTT3Mine) do
  begin
    obj := __snapshotLaunchMine(sim, mgr, lRec.FRTT3Mine[i]);
    if obj <> nil then
       TT3Mine(obj).SetSnapshotData(lRec.FRTT3Mine[i]);

  end;
end;

function __snapshotLaunchSonobuoy(const sim : TT3UnitContainer; const mgr : TT3SimManager ;
   rec : _SS_TT3Sonobuoy) : TObject ;
var
  pi : TT3PlatformInstance;
  obj : TObject;
  r : TRecCmd_LaunchSonobuoy;
  qty : integer;
begin
  Result := nil;
  r.ParentPlatformID := rec.ParentPlatformID;
  r.SonobuoyOnVehicleID  := rec.SonobuoyOnVehicleID;
  r.Depth            := rec.Depth;
  r.ProjectileInstanceIndex := rec.P.SST3Unit.InstanceIndex;

  pi := __snapshot_getT3PI(sim,r.ParentPlatformID);
  if (pi <> nil) and (pi is TT3Vehicle) then begin
    obj  := TT3Vehicle(pi).getDevice(r.SonobuoyOnVehicleID, TT3SonobuoyOnVehicle);
    if obj <> nil then begin
       qty :=  TT3SonobuoyOnVehicle(obj).Quantity ;
       TT3SonobuoyOnVehicle(obj).Quantity := qty + 1;
       Result := mgr.LaunchSonobuoy(r);
       TT3SonobuoyOnVehicle(obj).Quantity := qty ;
    end;
  end;
end;

procedure __snapshotSetSonobuoyList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
    const FIsInstructor : boolean );
var
  I : Integer;
  obj : TObject;
begin
  for I := Low(lRec.FRT3Sonobuoy) to High(lRec.FRT3Sonobuoy) do
  begin
    obj := __snapshotLaunchSonobuoy(sim, mgr, lRec.FRT3Sonobuoy[i]);

    if obj <> nil then
      TT3Sonobuoy(obj).SetSnapshotData(lRec.FRT3Sonobuoy[i]);
  end;
end;

//function __snapshotLaunchBomb(const sim : TT3UnitContainer; const mgr : TT3SimManager ;
//   rec : _SS_TT3Bomb) : TObject ;
//var
//  pi : TT3PlatformInstance;
//  obj : TObject;
//  r : TRecCmd_LaunchBomb;
//  qty : integer;
//begin
//  Result := nil;
//  r.ParentPlatformID := rec.Owner;
//  r.TargetPlatformID := rec.W.TargetObject;
//  r.BombOnVehicleID  := rec.W.WeaponOnVehicleID;
////  r.SalvoSize        := rec.;
//  r.ProjectileInstanceIndex := rec.W.P.SST3Unit.InstanceIndex;

//  pi := __snapshot_getT3PI(sim,r.ParentPlatformID);
//  if (pi <> nil) and (pi is TT3Vehicle) then begin
//    obj  := TT3Vehicle(pi).getWeapon(r.BombOnVehicleID, TT3BombONVehicle);
//    if obj <> nil then begin
//       qty :=  TT3BombONVehicle(obj).Quantity ;
//       TT3BombONVehicle(obj).Quantity := qty + 1;
//       Result := mgr.LaunchBomb(r);
//       TT3BombONVehicle(obj).Quantity := qty ;
//    end;
//  end;
//end;

//procedure __snapshotSetBombList( const sim : TT3UnitContainer; const mgr : TT3SimManager ;
//    const FIsInstructor : boolean );
//var
//  I: Integer;
//  obj: TObject;
//begin
//  for I := Low(lRec.FRTT3Bomb) to High(lRec.FRTT3Bomb) do
//  begin
//    obj := __snapshotLaunchBomb(sim, mgr, lRec.FRTT3Bomb[i]);
//    if obj <> nil then
//       TT3Bomb(obj).SetSnapshotData(lRec.FRTT3Bomb[i]);

//  end;
//end;

procedure __snapshot_showprogress ( isShow : boolean );
begin
  if isShow then
    frmProgress := TfrmProgress.Create(nil)
  else
    frmProgress.Free;
end;

procedure __snapshot_setprogress ( const s : string ) ;
begin
   frmProgress.Increase(s) ;
end;

end.

