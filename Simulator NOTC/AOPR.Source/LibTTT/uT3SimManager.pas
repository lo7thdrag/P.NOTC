unit uT3SimManager;

interface

uses
   MapXLib_TLB,
   Classes, SysUtils, System.Win.Registry, System.Variants, Graphics,
     uThreadTimer, WbemScripting_TLB, uVirtualTime,
     uLibSettingTTT,uDBGame_Defaults,
     uDBScenario,  uDBAsset_Weapon, uDBAssetObject,
     uSimManager , uSimObjects,
     uDBAsset_GameEnvironment, uDBRainfall, uDBCloud_Effect,
     uDBDefault_Var, tttData,
     uGameData_TTT, uT3Unit, uT3UnitContainer,
     uT3EventManager, uT3Sensor, uT3Weapon, uT3counterMeasure,
     uT3Vehicle, uT3Listener,
     uDBAsset_Scripted, uWaypoint, uDBAsset_Radar, uDBAsset_Sonar,
     uDBAsset_Sensor, uT3DataLink, uT3MissileDetail, uT3MissileEnvironment, newClassASTT,
     uCoordConvertor, uT3HybridOnVehicle, uT3HybridMissile,
     uDBAsset_MotionCharacteristics, uT3DefensiveJammer,
     uT3DatalinkManager, uSteppers, Dialogs, uDBFormation, uDrawLogisticTemplate,
     uDrawStrategi, uDrawOverlay, uDBAsset_Embark_Library, uNetBaseSocket, uBrigadePersonel, uT3GroupVehicle,
     uDBCubicles;

type


  TT3SimManager = class(TSimManager)
  protected
    FScenario     : tT3DBScenario;
    //FGameDefault  : TGame_Defaults;
    FRainfall     : TRainfall;
    FCloud_Effects: TCloud_Effects;
    FDefault_Var  : TDefault_Var;

    FEmbarkedPlatform : TT3PlatformInstance;
    FLastPlatformID   : Integer;
    FlastFormationID  : Integer;
    FLastOverlayID  : Integer;
    FLastPlottingID  : Integer;
    FLastShipingRouteID  : Integer;
    FCounterSensor : Double;
    FCounterBombMine : Double;

    procedure FGameThread_OnTerminate(sender: TObject);
    procedure FGameThread_OnRunning(const dt: double); virtual;
    procedure FGameThread_OnPaused(const dt: double); virtual;

    procedure FGotoThread_OnRunning(const dt: double);virtual;

    procedure FDeviceThread_OnTerminate(sender: TObject);
    procedure FDeviceThread_OnRunning(const dt: double); virtual;
    procedure FDeviceThread_OnPaused(const dt: double); virtual;

    procedure FNetworkThread_OnRunning(const dt: double);virtual;
    procedure FNetworkThread_OnPaused(const dt: double); virtual;
    procedure FNetworkThread_OnTerminate(sender: TObject);
    procedure FNetworkThreadVBS_OnRunning(const dt: double);virtual;
    procedure FNetworkThreadVBS_OnPaused(const dt: double); virtual;
    procedure FNetworkThreadVBS_OnTerminate(sender: TObject);
    procedure CreateMapConverter(Map : TMap);
  private
    FCubAssignList: T3CubicleGroupList;
    FOnLogEventStr    : TLogStrProc;
    FReg              : TRegistry;
    FConverter        : TCoordConverter;
    FOnLogTemporary   : TGetStrProc;
    FLoadFromSnapshot : Boolean;

    FDelayer          : TDelayer;
    FIsVBS: Boolean;

    TempIntelijen,
    TempPangkalan, TempLogistic : TList;

    procedure SetOnLogEventStr(const Value: TLogStrProc);

//    procedure CreateTT3MissileInstance(Pi : TPlatform_Instance);
//    procedure CreateTT3TorpedoInstance(Pi : TPlatform_Instance);
    function CreateTT3MineInstance(Pi : TPlatform_Instance) : TT3PlatformInstance;
    function GetConsoleIdentification : Boolean;
    procedure SetOnLogTemporary(const Value: TGetStrProc);
    procedure SetLoadFromSnapshot(const Value: Boolean);

  protected
    FOnLogStr      : TLogStrProc;
    FOnReplayStr,
    FOnLogInitStr  : TGetStrProc;
    FIsInstructor  : boolean;
    FIsWasdal      : Boolean;
    FSessionID     : integer;

    FGotoTimeMode  : boolean;
    FGotoTimeIndex : integer;
    FTimeToGo      : TDateTime;
    FElapseTimeToGo: Extended;

//    FGDefList : TList;
    FStateOrderIDRequestDataPosFromVBS : Byte;

    FVersion : string;
    FKeyVersion : Integer;

    procedure OnDelayerNotify(Sender : TObject);virtual;

    procedure ChaffLauncherFire(Sender : TObject); virtual;
    procedure ChaffLauncherStop(Sender : TObject); virtual;
    procedure BubbleLauncherFire(Sender : TObject); virtual;
    procedure BubbleLauncherStop(Sender : TObject); virtual;

    procedure setSessionID(const Value: integer);

    //network procedures.
    //farah
    procedure netSend_SynchObject(rSynch : TRecUDP_Synch_Obj); virtual;
    procedure netSend_CmdSync_Hit_Mine_Bomb(recSynch : TRecCmd_Sync_Hit_BombMine); virtual;

    procedure netRecv_CmdGunFire(apRec: PAnsiChar; aSize: word); virtual; abstract;
    procedure netRecv_CmdGunFireState(apRec: PAnsiChar; aSize: word); virtual;
    procedure netRecv_Cmd_FireControl(apRec : PAnsiChar; aSize: word); virtual; abstract;

    function InitiateEmbarkPlatform(var rec : TRecCmd_Embark ):boolean;virtual;
    function LaunchEmbarkPlatform(const rec : TRecCmd_Embark ):TT3PlatformInstance; virtual;

    function TakeOffFromBase(const rec: TRecCmd_LaunchRP): Boolean; virtual;
    function ReturnTobase (const rec : TRecCmd_ReturnToBase ):Boolean; virtual;
    function LaunchVectac(var recVectac: TRecVectac): TObject; virtual;
    //{** snapshot move to public **} function LaunchMissile(const rec: TRecCmd_LaunchMissile ): TObject ; virtual;
    //{** snapshot move to public **} function LaunchTorpedo(const rec: TRecCmd_LaunchMissile ): TObject ; virtual;
    //{** snapshot move to public **} function LaunchNonRealtimeRuntimePlatform(const rec : TRecCmd_LaunchNonRP ): TT3PlatformInstance; virtual;

    //function OnCheckBombHit(sender : TObject): Integer; virtual;
    //function bombHit(sender : TObject; salvo : Integer): Integer;
    {aldy - mine}
//    procedure OnMineMove(sender : TObject); virtual;
    procedure GunFire(rec: TRecCmd_GunFire); overload; virtual; abstract;
    procedure GunFire(rec: TRecCmd_GunFireState); overload; virtual; abstract;

    function LaunchRuntimePlatform(const rec : TRecCmd_LaunchRP ): TT3PlatformInstance; virtual;
    function LaunchReferencePoint(const rec : TRecCmd_LaunchNonRP ): TT3PlatformInstance; virtual;
    function UpdatePropertyPlatform(const rec : TRecCmd_Platform_SET_PROPERTY): TT3PlatformInstance; virtual;

    procedure FreePlatform(rec : TRecPlatformFreeMe);
    procedure AssignGameSettingChange(Listener : TEventListener);

    //{nando} + choco
    procedure netRecv_Vectac(apRec: PAnsiChar; aSize: Word); virtual;
    procedure SensorCommand(cmd : TRecCmd_Sensor); virtual;

    function DeployDecoys(const rDecoys : TRecCmdDecoys) : TT3PlatformInstance;
    procedure FireControlCommand(r: TRecCmd_FC);

    { use by goto time }
    procedure Run(const dt : Double);virtual;
  public
    GameEnvironment : TGame_Environment_Definition;
    GameDefaults    : TGame_Defaults; //mm gd

    SimPlatforms          : TT3UnitContainer;
    SimDevices            : TT3UnitContainer;
    SimWeapons            : TT3UnitContainer;
    simNonRealPlatform    : TT3UnitContainer;
    SimEventSummary       : TList;
    SimPointRBLW_VehicleMissile : TT3UnitContainer;
    SimPointBOLW_VehicleMissile : TT3UnitContainer;
    DataLinkManager       : TT3DatalinkManager;
    SimShipingRoute       : TShipingRouteContainer;
    SimPlotting           : TPlottingContainer;
    SimOverlayTemplate    : TOverlayTemplateContainer;
    SimPlatformBase       : TPlatformBaseContainer;

    SimSnapshotData       : TT3UnitContainer;
    ListPlatformSelect    : TList;

    procedure ChangeGameSetting(const rec : TRecCmd_GameSetting); virtual;
//    procedure CheckAllMineBomb(aDeltaMs : Double); virtual;
    procedure CheckAllSensorProses(aDeltaMs : Double);
    procedure SensorProcess(sensor : TT3Sensor);

    procedure AssignPlatformInstanceEvent(pi : TT3PlatformInstance); virtual;
    procedure AssignSensorEvent(sensor : TT3Sensor); virtual;
    procedure AssignWeaponEvent(weapon : TT3Weapon); virtual;
    procedure AssignECMEvent(ecm : TT3CounterMeasure);overload;
    procedure AssignECMEvent(ecm : TT3PlatformInstance);overload;

    procedure UnassignPlatformInstanceEvent(pi : TT3PlatformInstance); virtual;
    procedure UnassignSensorEvent(sensor : TT3Sensor); virtual;
    procedure UnassignWeaponEvent(weapon : TT3Weapon); virtual;
    procedure UnassignECMEvent(ecm : TT3CounterMeasure);virtual;

    function LaunchBubble(const rec: TRecCmd_LaunchBubble): TObject; virtual;
    function LauncherBubbleState(const rec: TRecCmd_LaunchBubbleState): TObject ; virtual;
    function LaunchChaff(const rec: TRecCmd_LaunchChaff ): TObject ; virtual;
    //prosedure untuk launch chaff barrier. prosedure ini dibuat karena chaff
    //barrier tidak memerlukan launcher untuk launch chaff
    function LaunchChaffBarrier(const rec: TRecCmd_LaunchChaff ): TObject ; virtual;
    function LauncherChaffState(const rec: TRecCmd_LaunchChaffState): TObject ; virtual;
    function LaunchMine(const rec : TRecCmd_LaunchMine): TObject; virtual;
    function LaunchBomb(const rec : TRecCmd_LaunchBomb): TObject; virtual;
    function LaunchSonobuoy(const rec : TRecCmd_LaunchSonobuoy): TObject; virtual;

    {** snapshot need this function**}
    function LaunchMissile(const rec: TRecCmd_LaunchMissile ): TObject ; virtual;
    function LaunchHybrid(const rec: TRecCmd_LaunchMissile ): TObject ; virtual;
    function LaunchNonRealtimeRuntimePlatform(const rec : TRecCmd_LaunchNonRP ):
             TT3PlatformInstance; virtual;
    function LaunchTorpedo(const rec: TRecCmd_LaunchMissile ): TObject ; virtual;

    function CreateTorpedoProjectileHybrid(const PlatformID, MisID, InstanceIndex : Integer): TObject;
    {** snapshot need this function**}

    procedure LauncherBubbleProp(const rec: TRecCmd_BubbleLauncherProperties);
    procedure LauncherChaffProp(const rec: TRecCmd_ChaffLauncherProperties) ;
    procedure CopyChaffLauncherProp(const rec: TRecCmd_LaunchChaffState) ;
    procedure LaunchMissileEngageProps(const rec: TRecEngagementModeWeapon);
    procedure LaunchMissileProps(const rec: TRecFiringModeWeapon);

    procedure NetRecv_cmd_environment(apRec: PAnsiChar; aSize: Word); virtual;
    procedure NetRecv_SincMissileEnvi(apRec: PAnsiChar; aSize: Word);virtual;
    procedure NetRecv_SincBOLWMissile(apRec : PAnsiChar; aSize: Word);virtual;
    procedure NetRecv_SincRBLWMissile(apRec : PAnsiChar; aSize: Word);virtual;
    procedure NetRecv_SincWaypoint(apRec: PAnsiChar; aSize: Word);virtual;

    procedure netRecv_Cmd_Embark_Land(apRec : PAnsiChar; aSize: word); virtual;
    procedure netRecv_EngageTrack(apRec: PAnsiChar; aSize: Word); virtual;
    procedure netRecv_SetStatus(apRec: PAnsiChar; aSize: Word); virtual;
    procedure netRecv_SetQuantity(apRec: PAnsiChar; aSize: Word); virtual;
    procedure netRecv_SetLauncherQty(apRec: PAnsiChar; aSize: Word); virtual;
    procedure netRecv_CmdEmcon(apRec: PAnsiChar; aSize: word); virtual;
    procedure netRecv_platform_cmd(apRec: PAnsiChar; aSize: Word); virtual;
    procedure netRecv_Platform_PersonelMove(apRec: PAnsiChar; aSize: Word); virtual;
    procedure netRecv_Synch_Pos_VBS(apRec: PAnsiChar; aSize: word); virtual;

    function CreateGroupVehicle(rec : TRecCmdMultiMode):T3GroupVehicle; virtual;

    procedure netRecvMapCmd (apRec: PAnsiChar; aSize: Word); virtual;

    //procedure for finish readying time
    procedure FinishReadyingTime(const r : TRecCmd_Embark_Landing); virtual;

    //Radar Noise Jammer
    procedure netRecv_CmdRadarNoiseJammer(apRec: PAnsiChar; aSize: word); virtual;
    function FindActiveJammers(Sender : TObject): TList;
    function FindJammersInRange(Sender : TObject): TList;

    procedure netRecv_Cmd_DataLink(apRec: PAnsiChar; aSize: word); virtual;
    procedure netRecv_CMD_DataLink_AddTrack(apRec: PAnsiChar; aSize: word); virtual;
    procedure netRecv_CMD_DataLink_RemoveTrack(apRec: PAnsiChar; aSize: word); virtual;
    procedure netRecv_ECMCommand(apRec: PAnsiChar; aSize: word); virtual;

    {Add/Edit Formation - mm}
    procedure netRecv_CmdEditFormation(apRec: PAnsiChar; aSize: word);  virtual;

    function FindBaseTransportByName(const Name: String): TPlatformBase;
    function FindT3PlatformByID(const id: integer): TT3PlatformInstance;
    function FindNonRealPlatformByID(const id : integer) : TT3PlatformInstance;overload;
    function FindNonRealPlatformByID(const id,group : integer) : TT3PlatformInstance;overload;
    function FindT3DeviceByID(classT : TClass; Parent : TSimObject;
       const id: integer): TT3DeviceUnit;
    function FindDeviceByID(id: integer): TT3Unit;
    function FindNearestTrack(const px, py: double;
       const maxDist: integer): TSimObject;
    function FindNearestTrackExcept(const px, py: double;
       const maxDist: integer ; const id : Integer): TSimObject;
    function FindNearestInfoBalloon(const aX, aY: Integer): TObject;
    function FindWaypointByID(const id: integer): TScripted_Waypoint_Data;

    function FindMissileByID(const id: integer): TMissile_On_Board;
    function FindWeaponByID(const id: Integer): TT3Weapon;
    function FindWeaponByIDAndName(const id: Integer;const Name : String): TT3Weapon;
    function FindDeviceByIDAndName(const id: Integer;const Name : String): TT3Unit;
    function GetSerialPlatformID: Integer;
    function GetSerialFormationID: Integer;
    function GetSerialOverlayID: Integer;
    function GetSerialPlottingID: Integer;
    function GetSerialShipingRouteID: Integer;

    procedure CounterMeasureAssets(pi: TPlatform_Instance; vehicle : TT3Vehicle);
    procedure CounterMeasureSet(aList : TList;aClass : TClass; aParent : TT3Vehicle);
    procedure SensorAssets(pi: TPlatform_Instance; vehicle : TT3Vehicle);
    procedure SensorSet(aList : TList;aClass : TClass; aParent : TT3Vehicle);

    procedure SensorSetEnvi; //di awal load game;
    procedure VehicleSetEnvi; //di awal load game;
    procedure DeviceSetEnvi; //di awal load game;

    procedure GunAssets(pi: TPlatform_Instance; vehicle : TT3Vehicle);
    procedure GunSet(aList : TList;aClass : TClass; aParent : TT3Vehicle);
    procedure VectacSet(aClass : TClass; aParent : TT3Vehicle);

    procedure OnGunFire(Sender : TObject); virtual;
    procedure OnGunCeaseFire(Sender : TObject); virtual;

    procedure OnVehicleReadyLanding(Sender : TObject); virtual;
    procedure WreckTimeChange(Value : integer);

    procedure LoadReferencePoint();
    procedure LoadFormation(v_platform: TT3Vehicle; status : integer);

    function getNameReferencePoint(tipe, domain, identity: Integer): String;
    function getNameReferencePointInt(tipe, domain, identity: Integer): Char;
    function CekPersonelOnShip(list : TList; idx: string; var id : Integer): Boolean;
    function GetPersonel(list: TList; identifier: string; var Personel: TPersonel;
    level : Integer; var idx : Integer): Boolean;

    procedure SyncObject(recSynv : TRecSyncPos) ;
    procedure CalcAfterTime(aTime : Double);
    procedure GetFuelConsBySpeed(aVehicle : TT3Vehicle; aSpeed : Double; var afuelCons : Double);
  public
    isFirstStart : Boolean;

    EventManager    : TT3EventManager;

    constructor Create(Map : TMap);
    destructor Destroy; override;

    procedure ResetScenario;   override;

    procedure LoadScenarioID(const vSet: TGameDataSetting); virtual;

    procedure GameStart; override;
    procedure GamePause; override;
    procedure GameTerminate; override;

    function CreatePlatformInstance(piType, Index, NewId : integer): TPlatform_Instance;
    function CreatePlatformInstanceRP(piType, Index, NewId : integer): TPlatform_Instance;
    procedure CopyDataPlatformInstance(const piInput : TPlatform_Instance;
              var piOutput : TPlatform_Instance);
    function SimAssetAssignment(pi: TPlatform_Instance): TT3PlatformInstance;
    function SimNonrealAssetAssignment(pi: TPlatform_Instance): TT3PlatformInstance;

    //aldy
    function  CreateNonRealPlatformInstance(NewId : integer): TPlatform_Instance;
    procedure RepairPlatform(const rec : TRecCmd_Platform_Repair); virtual;
    procedure UpdateAllDevicePlatform(ve : TT3Vehicle); virtual;

    procedure InitNetwork; virtual;
    procedure StopNetwork;  virtual;

    procedure OnAssignedPlatform(Sender : TObject);

    //Decoy
    procedure OnDeployDecoy(Sender : TObject);
    function  OnCheckLifeTimeFloatingDecoy(Sender : TObject) : Boolean;
    procedure OnCheckStateIRDecoy(Sender : TObject; aDeltaMs : Double);

    property Scenario : tT3DBScenario read FScenario;
    property SessionID: integer read FSessionID write setSessionID;

    property OnReplayStr: TGetStrProc read FOnReplayStr write FOnReplayStr;
    property OnLogStr: TLogStrProc read FOnLogStr write FOnLogStr;
    property OnLogInitStr: TGetStrProc read FOnLogInitStr write FOnLogInitStr;
    property OnLogEventStr: TLogStrProc  read FOnLogEventStr write SetOnLogEventStr;
    property OnLogTemporary: TGetStrProc read FOnLogTemporary write SetOnLogTemporary;
    property LoadFromSnapshot: Boolean  read FLoadFromSnapshot write SetLoadFromSnapshot;
    //property IndexControlledShip: Integer read FIndexControlledShip write FIndexControlledShip;

    //Prince
    procedure netRecv_CmdTorpedoSyncPanelWeapon(apRec: PAnsiChar; aSize: word);virtual;
    procedure netRecv_CmdBombSyncPanelWeapon(apRec: PAnsiChar; aSize: word);virtual;
    procedure netRecv_CmdTorpedoProperty(apRec: PAnsiChar; aSize: word);virtual;
    procedure netRecv_CmdBombProperty(apRec: PAnsiChar; aSize: word);virtual;
    procedure netRecv_CmdMineProperty(apRec: PAnsiChar; aSize: word);virtual;

//    procedure netRecv_CmdTorpedoSync(apRec: PAnsiChar; aSize: Word);virtual;

    {farid set for chaff}
    property IsController: Boolean read FIsInstructor write FIsInstructor;
    property IsWasdal : Boolean read FIsWasdal write FIsWasdal;
    property IsVBS : Boolean read FIsVBS write FIsVBS;
    property Converter : TCoordConverter read FConverter;

    property Version : string read FVersion;
    function IsGameStart: Boolean; virtual;

    //ESM
    procedure OnVarianceESM(aESMtrack: TObject; aTrack : TObject); virtual;
    //System State
    procedure ChangeSystemState(const rec : TRecCmd_Change_SystemState); virtual;

    //Logistic
    procedure ChangeLogistic(const rec : TRecCmd_Change_Logistic); virtual;
    procedure ChangeLogisticState(const rec : TRecCmd_State_Logistic); virtual;
    procedure DisembarkPersonelWith (const rec : TRecCmd_Embark); virtual;

    procedure GotoTime(Index : Integer);virtual;

    {$REGION ' Transport Method '}
    procedure EmbarkTransported (const rec : TRecCmd_Transport); virtual;
    procedure DisembarkTransported (const rec : TRecCmd_Transport); virtual;
    procedure DisembarkWithTransported (const rec : TRecCmd_Transport); virtual;

    procedure TransportProcess (const rec : TRecCmd_TransportProcess); virtual;
    procedure EmbarkedPlatformData (const rec : TRec_EmbarkedPlatformData); virtual;

    procedure ChangeRampState(const rec : TRecCmd_RampController); virtual;

    function DisembarkTransportedOld(const rec : TRecCmd_Embark ):TT3PlatformInstance; virtual;
    function DisembarkTransportedPersonel(const rec : TRecCmd_DisembarkPersonelTemporary ):TT3PlatformInstance; virtual;
    procedure EmbarkTransportedPersonel (const rec : TRecCmd_EmbarkPersonelTemporary); virtual;
    procedure EmbarkTransportedFromBase (const rec : TRecCmd_Transport; const _OwnShip : TT3Vehicle);
    procedure EmbarkTransportedFromGame (const rec : TRecCmd_Transport; const _OwnShip, _TransportedFromReEmbark: TT3Vehicle);
    {$ENDREGION}

    {$REGION ' Overlay Method '}
    procedure CreateOverlayTamplate (rec : TRecCmd_OverlayTemplate); virtual;
    procedure CreateOverlayShape (rec : TRecCmd_OverlayStaticShape); virtual;
    {$ENDREGION}

    {$REGION ' Plotting Method '}
    procedure CreatePlotting (rec : TRecCmd_PlottingShape); virtual;
    {$ENDREGION}

    {$REGION ' Shiping Route Method '}
    procedure CreateShipingRoute (rec : TRecCmd_ShipingRoute); virtual;
    {$ENDREGION}

    {$REGION ' Cubicle Assign Method '}
    procedure ChangePlatformGroup (rec : TRecPlatformGroupChange; var veTemp: TT3Vehicle; var oldGrpTemp, newGrpTemp: T3CubicleGroup); virtual;
    {$ENDREGION}

    property CubAssignList: T3CubicleGroupList read FCubAssignList write FCubAssignList;
end;

var
  SimManager: TT3SimManager;

implementation

 uses
   uDBAsset_Vehicle,
   uT3Missile, uT3Gun, uT3Radar, uT3Sonar, uT3Sonobuoy,
   uT3visual, uT3OtherSensor,uT3Common,
   uT3Torpedo, uT3Mine, uT3Bomb, Windows, forms,
   uGameSetting, uDBAssets_SubAreaEnviroDefinition, uDBAsset_Reference_Point,
   StrUtils, uBaseCoordSystem, uT3RadarNoiseJammer,
   uDataTypes, uSnapshotData, uMainLogisticTemplate, DateUtils,
  uDBAsset_Runtime_Platform_Library, Math,
  uMainOverlay, uMainStaticShape,
  uMainPlottingShape;

{ TT3SimManager }

procedure TT3SimManager.AssignECMEvent(ecm: TT3CounterMeasure);
begin
  with ecm do begin
    OnLaunched    := EventManager.OnECMLaunched;
    OnLogEventStr := EventManager.OnLogEventStr;
    OnQuantityChange := EventManager.OnECMQuantityChange;
    OnECMlistUpdated := EventManager.OnECMlistUpdated;
  end;

  if ecm is TT3DefensiveJammerOnVehicle then begin
    with TT3DefensiveJammerOnVehicle(ecm) do begin
      OnJammingSuccess  := EventManager.OnECMJammingSuccess;
      OnJammingFailed   := EventManager.OnECMJammingFailed;
      DeviceEntities    := SimDevices;
      PlatformEntities  := SimPlatforms;
    end;
  end;

  if ecm is TT3RadarNoiseJammerOnVehicle then begin
    with TT3RadarNoiseJammerOnVehicle(ecm) do
    begin
      OnJammingSuccess  := EventManager.OnRadarNoiseJammingSuccess;
      //OnJammingFailed   := EventManager.OnRadarNoiseJammingFailed;
      DeviceEntities    := SimDevices;
    end;
  end;
end;

procedure TT3SimManager.AssignECMEvent(ecm: TT3PlatformInstance);
begin
  with ecm do begin
    OnLaunched    := EventManager.OnECMLaunched;
    OnLogEventStr := EventManager.OnLogEventStr;
	  OnDestroy     := EventManager.OnECMDestroy;
    OnHancur      := EventManager.OnPlatformHancur;
    OnFreeMe      := EventManager.OnPlatformFreeMe;
  end;

  if ecm is TT3FloatingDecoy then
    TT3FloatingDecoy(ecm).OnCheckLifeTime := OnCheckLifeTimeFloatingDecoy
  else if ecm is TT3InfraredDecoy then
    TT3InfraredDecoy(ecm).OnCheckStateIR := OnCheckStateIRDecoy;
end;

function TT3SimManager.FindActiveJammers(Sender : TObject): TList;
var
  so : TSimObject;
  dev : TSimObject;
  I, J : Integer;
  ls : TList;
begin
  ls := TList.Create;
  for I := 0 to SimPlatforms.itemCount - 1 do
  begin
    so := SimPlatforms.getObject(I);
    if so is TT3Vehicle then
    begin
      for J := 0 to TT3Vehicle(so).Devices.Count - 1 do
      begin
        dev := TT3Vehicle(so).Devices.Items[J];
        if dev is TT3RadarNoiseJammerOnVehicle then
        begin
          if TT3RadarNoiseJammerOnVehicle(dev).Status = esOn then
          begin
            ls.Add(so);
          end;
        end;
      end;
    end;
  end;

  if ls.Count = 0 then
  begin
    ls.Free;
    Result := nil;
  end
  else
    Result := ls;
end;

function TT3SimManager.FindBaseTransportByName(const Name: String): TPlatformBase;
var
  i : Integer;
  _BaseTransport  : TPlatformBase;

begin
  for i := 0 to VScenario.BaseListFromDB.Count - 1 do
  begin
    _BaseTransport := TPlatformBase(VScenario.BaseListFromDB.Items[i]);

    if _BaseTransport.identifier = Name then
    begin

      Break;
    end
    else
      _BaseTransport := nil;
  end;

  result := _BaseTransport;
end;

function TT3SimManager.FindDeviceByIDAndName(const id: Integer;
  const Name: String): TT3Unit;
var
  dvc : TT3Unit;
  f : boolean;
  I, c: Integer;
begin
  f := false;
  I := 0;
  c := SimDevices.itemCount;
  dvc := nil;

  while not f and (i < c) do
  begin
    dvc := TT3Unit(SimDevices.getObject(i));
    f := (dvc.InstanceIndex = id);
    f := f and (dvc.InstanceName = Name);
    inc(i);
  end;

  if f then
    result := dvc
  else
    result := nil;
end;

function TT3SimManager.FindJammersInRange(Sender: TObject): TList;
begin
  Result := nil;
end;

procedure TT3SimManager.netRecv_Cmd_DataLink(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecCmd_DataLink;
  aPlatform, puPlatform : TT3PlatformInstance;
  isRestart : boolean;
  //i : integer;
begin
  r := @apRec^;
  isRestart := false;

  if r^.SessionID <> FSessionID then
    Exit;

  aPlatform  := FindT3PlatformByID(r^.platformID);
  // puPlatform platform yg mengirim hasil deteksi datalink bkn haya platfor
  // yg ada di cub itu tapi bisa dari cubicle lain yg msh satu fore n satu datalink
  puPlatform := FindT3PlatformByID(r^.PooledPUID);

  case r^.OrderDL of
    odlAdd    :
      DataLinkManager.AddParticipatingUnit(r^.DataLinkID , aPlatform);

    odlRemove :
      DataLinkManager.RemoveParticipatingUnit(r^.DataLinkID , aPlatform);

    odlForce:
      DataLinkManager.SetDataLinkForce(r^.DataLinkID , r^.Force);

    odlBand:
      DataLinkManager.SetBandType(r^.DataLinkID , r^.Band);

    odlRemovePermanently :
      DataLinkManager.RemoveDestroyedPlatform(aPlatform);

    odlActivate:
      begin
        // cek last status Data Link - if Play, Stop it before
        if DataLinkManager.IsDLPlayed(r^.DataLinkID) then begin
          DataLinkManager.SetPlayed(r^.DataLinkID, false);
          isRestart := true;
        end;

        // Set NCS Data Link
        DataLinkManager.SetNCSPlatform(r^.DataLinkID, aPlatform, true);

        // Set Data Link Status = Play
        if isRestart then
        begin
          DataLinkManager.SetPlayed(r^.DataLinkID,true);
        end;
      end;

    odlPlay:
      DataLinkManager.SetPlayed(r^.DataLinkID, true);

    odlStop:
      DataLinkManager.SetPlayed(r^.DataLinkID, false);

    odlPUStatus :
      DataLinkManager.SetParticipatingUnitStatus(r^.DataLinkID,
        aPlatform,r^.PUStatus);

    odlPooledTracks :
      begin
        if Assigned(puPlatform) then
        begin
          if puPlatform is TT3Vehicle then
          begin
            // cek emcon status pada Participating Unit Platform //
            if (TT3Vehicle(puPlatform).EMCON_HFDataLinkVehicle <> EmconHFDatalinkOn) and
               (TT3Vehicle(puPlatform).EMCON_UHFVHFDataLinkVehicle <> EmconUHFVHFDatalinkOn) then
            begin
              // if ok, do upadate track data link //
              DataLinkManager.AddNCSEntityItems(r^.DataLinkID, r^.PooledPUID, r^.PooledTracksID);
            end;
          end;
        end;
      end;
  end;
end;

procedure TT3SimManager.netRecv_CMD_DataLink_AddTrack(apRec: PAnsiChar; aSize: word);
begin

end;

procedure TT3SimManager.netRecv_CMD_DataLink_RemoveTrack(apRec: PAnsiChar;
  aSize: word);
begin

end;

procedure TT3SimManager.AssignGameSettingChange(Listener: TEventListener);
begin
  if Listener is TPropertyEventListener then
  begin
    with TPropertyEventListener(Listener) do begin
      OnPropertyIntChange   := EventManager.OnPropGameSettingIntChange;
      OnPropertyDblChange   := EventManager.OnPropGameSettingDoubleChange;
      OnPropertyBoolChange  := EventManager.OnPropGameSettingBoolChange;
      OnPropertyByteChange  := EventManager.OnPropGameSettingByteChange;
    end;
  end;
end;

procedure TT3SimManager.CheckAllSensorProses(aDeltaMs : Double);
var
  FDelay : Double;
  I: Integer;
  dev : TSimObject;
begin
  FDelay := 5;

  FCounterSensor := FCounterSensor + aDeltaMs;
  if FCounterSensor > FDelay then
  begin
    for I := 0 to SimDevices.itemCount - 1 do
    begin
      dev := SimDevices.getObject(I);

      if dev is TT3Sensor then
      begin
        if ((TT3Sensor(dev).OperationalStatus = sopOn)      or
          (TT3Sensor(dev).OperationalStatus = sopActive)    or
		      (TT3Sensor(dev).OperationalStatus = sopDeployed)  or     //17042012 mk
          //(TT3Sensor(dev).OperationalStatus = sopStowed)    or     //17042012 mk
          (TT3Sensor(dev).OperationalStatus = sopPassive) ) and
          (TT3Sensor(dev).OperationalStatus <> sopDamage)   then
          //SensorProcess(TT3Sensor(dev));
          TT3Sensor(dev).SensorProcess;
      end;

    end;

    FCounterSensor := 0;
  end;
end;

procedure TT3SimManager.SensorProcess(sensor : TT3Sensor);
var
  i : integer;
  range : double;
  pfObject : TT3PlatformInstance;
  isInRange     : boolean;
  isInsideBlindZone   : boolean;
  isInsideVerticalCov : boolean;
  isInsideOtherMeasurement : boolean;
  allState : boolean;
begin
  for I := 0 to SimPlatforms.itemCount - 1 do
  begin
    pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
    if pfObject = sensor.Parent then
      continue;

    if pfObject.UnitGroup then
    begin
      if Assigned(sensor.OnSensorDetect) then
        sensor.OnSensorDetect(Self,pfObject,false,False);

      continue;
    end;

    range   := CalcRange(sensor.PosX,sensor.PosY,
             pfObject.getPositionX,pfObject.getPositionY);

    // periksa apakah dalam jangkauan radar
    isInRange           := range <= sensor.DetectionRange;
    // periksa apa di dalam blind zone
    isInsideBlindZone   := sensor.InsideBlindZone(pfObject);
    // periksa apa di dalam vertical cov
    isInsideVerticalCov := sensor.InsideVerticalCoverage(pfObject);
    // periksa pengukuran lainyya
    isInsideOtherMeasurement := sensor.InsideOtherMeasurement(pfObject);
    // periksa apa dalam detail range
    {isInsideDetailRange   := }
    sensor.InsideDetailRange(pfObject);

    // periksa semua factor deteksi
//    allState := isInRange and (not isInsideBlindZone) and isInsideVerticalCov
//                and (sensor.EmconOperationalStatus <> EmconOn)
//                and (isInsideOtherMeasurement);

    // untuk AOTC detail perhitungan tidak dimasukkan, yang penting masuk range
    allState := isInRange and (not isInsideBlindZone) and isInsideVerticalCov
                and (sensor.EmconOperationalStatus <> EmconOn);

    if Assigned(sensor.OnSensorDetect) then
      sensor.OnSensorDetect(sensor,pfObject,allState, False);
  end;
end;

procedure TT3SimManager.AssignPlatformInstanceEvent(pi: TT3PlatformInstance);
begin
  if not Assigned(pi) then
    Exit;

  with pi do
  begin
    OnDestroy         := EventManager.OnPlatformDestroy;
    OnHancur          := EventManager.OnPlatformHancur;
    OnSelected        := EventManager.OnPlatformSelected;
    OnControlled      := EventManager.OnPlatformControlled;
    OnOrderedControl  := EventManager.OnPlatformOrderedControl;
    OnDamageChanged   := EventManager.OnPlatformDamageChanged;
    OnLogEventStr     := EventManager.OnLogEventStr;
    OnFreeMe          := EventManager.OnPlatformFreeMe;
    OnAssigned        := EventManager.OnPlatformAssigned;
    OnPropertyChange  := EventManager.OnPlatformPropertyChange;

    // ini hanya berlaku di server saja ya...
    OnDepthChecker    := EventManager.OnDepthChecker;

    OnCollision       := EventManager.OnCollision;
    OnFuelEmpty       := EventManager.OnFuelEmpty;
    OnChangeHeading   := EventManager.OnChangeHeading;
    OnChangePosition  := EventManager.OnChangePosition;
    OnIsCollision     := EventManager.OnIsCollision;

    (pi as TT3Vehicle).OnEventSendPlatformcmd := EventManager.OnEventSendPlatformcmd
  end;

  //nando - event waypoint
  if pi is TT3Vehicle then
  begin
    {$IfDef SERVER}
    (pi as TT3Vehicle).Waypoints.FonLaunchMissile       := EventManager.OnLaunchMisile;
    (pi as TT3Vehicle).Waypoints.FOnLaunchTorpedo       := EventManager.OnLaunchTorpedo;
    (pi as TT3Vehicle).Waypoints.FOnLaunchBomb          := EventManager.OnLaunchBomb;
    (pi as TT3Vehicle).Waypoints.FOnLaunchGun           := EventManager.OnLaunchGun;
    (pi as TT3Vehicle).Waypoints.FonRadarEvent          := EventManager.OnRadarEvent;
    (pi as TT3Vehicle).Waypoints.FonSonarEvent          := EventManager.OnSonarEvent;
    (pi as TT3Vehicle).Waypoints.FonIffEvent            := EventManager.OnIffEvent;
    (pi as TT3Vehicle).Waypoints.FonDeployContinousEvent  := EventManager.OnDeployContinousEvent;
    (pi as TT3Vehicle).Waypoints.FonDeploySonobuoy      := EventManager.OnDeploySonobuoy;
    (pi as TT3Vehicle).Waypoints.FonDeployMine          := EventManager.OnDeployMine;
    (pi as TT3Vehicle).Waypoints.FonCMEvent             := EventManager.OnCountermeasureEvent;
    (pi as TT3Vehicle).Waypoints.FonDatalinkEvent       := EventManager.OnDatalinkEvent;
    (pi as TT3Vehicle).Waypoints.FonWaypointRemoveOwner := EventManager.OnWaypointRemoveOwner;

    {$EndIf}

    (pi as TT3Vehicle).Waypoints.FOnWaypointChange:= EventManager.OnWaypointChange;
    (pi as TT3Vehicle).Waypoints.FonWaypointEnd   := EventManager.OnWaypointEnd;
    (pi as TT3Vehicle).Waypoints.FonWaypointDestinationChange   := EventManager.OnWaypointDestinationChange;

        //AOPR event
    (pi as TT3Vehicle).Waypoints.OnNextWaypointChangeTo3D := EventManager.OnNextWaypointChangeTo3D;
    (pi as TT3Vehicle).OnCekLandandDepth := EventManager.OnCekLandAndDepth;
    (pi as TT3Vehicle).OnDeleteVehicle3D := EventManager.OnDeletVehicle3D;
  end;

  //farid added
  if pi is TT3Vehicle then
  begin
    TT3Vehicle(pi).OnGuidance_Engage := EventManager.OnGuidance_Engage;
    TT3Vehicle(pi).OnPositionChange := EventManager.OnPlatformPositonChange;

    //choco add
    TT3Vehicle(pi).OnGuidanceStaleTimeReached := EventManager.OnGuidanceStaleTimeReached;
    TT3Vehicle(pi).OnGuidanceStandoffReached := EventManager.OnGuidanceStandoffReached;
    TT3Vehicle(pi).OnLaunchWeaponEngagement := EventManager.OnGuidanceLaunchWeapon;

    //bebe
    //TT3Vehicle(pi).OnGuidanceStationReached := EventManager.OnGuidanceStationReached;
    //(pi).OnGuidanceStationUpdateHeading := EventManager.OnGuidanceStationUpdateHeading;
  end;

  //andik
  if pi is TT3NonRealVehicle then
  begin
    TT3NonRealVehicle(pi).OnLastUpdateTimePlatform := EventManager.OnLastUpdateTimePlatform;
  end;
end;

procedure TT3SimManager.AssignSensorEvent(sensor: TT3Sensor);
begin
  if not Assigned(sensor) then
    Exit;

  with sensor do begin
    OnSensorOperationalStatus  := EventManager.OnSensorOperationalStatus;
    OnDestroy                  := EventManager.OnSensorRemoved;
    OnSensorDetect             := EventManager.OnSensorDetect;
    OnSensorRemoved            := EventManager.OnSensorRemoved;
    OnLogEventStr              := EventManager.OnLogEventStr;
    OnDayTimeUpdate            := EventManager.OnCheckDateTime;
    OnIFFDetect                := EventManager.OnIFFSensorDetect;
    OnDeploySonar              := EventManager.OnDeploySonar;
    OnUpdateFormSonar          := EventManager.OnUpdateFormSonar ;
    OnUpdateActualCable        := EventManager.OnUpdateActualCable;
    OnModeSearchIFF            := EventManager.OnModeSearchIFF;
  end;

  if sensor is TT3DataLink then
  begin
    with TT3DataLink(sensor) do begin
      OnDatalinkPoolRequest := EventManager.OnDatalinkPoolRequest;
      OnDatalinkOffline     := EventManager.OnDatalinkOffline;
      OnDatalinkOnline      := EventManager.OnDatalinkOnline;
      OnDatalinkTrackUpdate := EventManager.OnDatalinkTracksUpdate;
      OnNCSDatalinkEMCON    := EventManager.OnNCSDatalinkEMCON;
      OnPUDatalinkEMCON     := EventManager.OnPUDatalinkEMCON;
    end;
  end;
end;

procedure TT3SimManager.AssignWeaponEvent(weapon: TT3Weapon);
begin
  if not Assigned(weapon) then
    Exit;

  with weapon do begin
    OnLaunched        := EventManager.OnWeaponLaunched;
    OnHit             := EventManager.OnWeaponHit;
    OnHitTo3D         := EventManager.OnWeaponHitTo3D;
	  OnOut             := EventManager.OnWeaponOut; //ham 04052012
//    OnHancur          := EventManager.OnPlatformHancur;
    OnDestroy         := EventManager.OnWeaponDestroy;
    OnTargeted        := EventManager.OnWeaponTarget;
    OnPropertyChange  := EventManager.OnWeaponPropertyChange;
    OnFreeMe   		    := EventManager.OnPlatformFreeMe;
    OnLogEventStr     := EventManager.OnLogEventStr;
    OnHybridLaunch    := EventManager.OnWeaponHybrid;
    OnMissileSynchVBS := EventManager.OnMissileSynchVBS;

    //ini hanya berlaku di client
    OnPropertyIntChange := EventManager.OnPropertyIntChange;

    // ini hanya berlaku di server saja ya...
    OnDepthChecker    := EventManager.OnDepthChecker;
  end;

  weapon.OnLogTemporary    := OnLogTemporary;

  if weapon is TT3GunOnVehicle then
  begin
    {$IfDef CLIENT}
    TT3GunOnVehicle(weapon).OnUpdateQuantity := EventManager.OnGunUpdateQuantity;
    TT3GunOnVehicle(weapon).OnSetCaseFire := EventManager.OnGunSetButtonCase;
    {$EndIf}
  end
  else if weapon is TT3MineOnVehicle then
  begin
    {$IfDef CLIENT}
    TT3MineONVehicle(weapon).OnUpdateQuantity := EventManager.OnGunUpdateQuantity;
    {$EndIf}
  end
  else if weapon is TT3BombONVehicle then
  begin
    {$IfDef CLIENT}
    TT3BombONVehicle(weapon).OnBombUpdateQuantity := EventManager.OnGunUpdateQuantity;
    {$EndIf}
  end
  else if weapon is TT3Missile then
  begin
    TT3Missile(weapon).OnSyncTarget := EventManager.OnSyncTarget;
    TT3Missile(weapon).OnLogDataMissile := EventManager.OnlogDataMissile;
  end;
end;

//function TT3SimManager.bombHit(sender: TObject; salvo : Integer): Integer;
//var
//  bomb : TT3Bomb;
//  lethal : Double;
//  targetBomb : TT3PlatformInstance;
//  range : Double;
//  prob : Double;
//begin
//  Result := 0;

//  if TT3Bomb(sender).BombAktif then
//  begin
//    bomb := sender as TT3Bomb;
//    lethal := bomb.BombDefinition.FData.Lethality;
//    targetBomb:=TT3Weapon(sender).TargetObject as TT3PlatformInstance;
//    range := CalcRange(bomb.PosX, bomb.PosY, targetBomb.PosX, targetBomb.PosY);
//    prob := bomb.getPOH(range);

//    if prob > 0 then //hit
//    begin
//      if Assigned(bomb.OnHit) then
//      begin
//        TT3PlatformInstance(bomb).InstanceName:= bomb.BombDefinition.FData.Bomb_Identifier;
//        bomb.OnHit(bomb, targetBomb, Round(lethal*salvo));
//        TT3Bomb(sender).BombAktif := False;

//        Result := targetBomb.InstanceIndex;
//      end;
//    end;
//  end;
//end;

procedure TT3SimManager.CopyChaffLauncherProp(
  const rec: TRecCmd_LaunchChaffState);
var
  i : Integer;
  pi : TT3PlatformInstance;
  dev : TObject;
begin
  pi := FindT3PlatformByID(rec.ParentPlatformID);

  if not Assigned(pi) and not (pi is TT3Vehicle) then
    Exit;

  dev := TT3Vehicle(pi).getDevice(rec.ChaffOnVehicleID, TT3ChaffOnVehicle);

  if not Assigned(dev) then
    Exit;

  with TT3ChaffOnVehicle(dev) do
  begin
    for i := 0 to ChaffLaunchers.Count - 1 do
    begin
      if i = rec.LauncherID then
        Continue;

      TT3ChaffLauncher(ChaffLaunchers.Items[i]).Angle :=
        TT3ChaffLauncher(ChaffLaunchers.Items[rec.LauncherID]).Angle;

      TT3ChaffLauncher(ChaffLaunchers.Items[i]).BloomRange :=
        TT3ChaffLauncher(ChaffLaunchers.Items[rec.LauncherID]).BloomRange;
      TT3ChaffLauncher(ChaffLaunchers.Items[i]).BloomAltitude :=
        TT3ChaffLauncher(ChaffLaunchers.Items[rec.LauncherID]).BloomAltitude;;
      TT3ChaffLauncher(ChaffLaunchers.Items[i]).SalvoSize :=
        TT3ChaffLauncher(ChaffLaunchers.Items[rec.LauncherID]).SalvoSize;;
      TT3ChaffLauncher(ChaffLaunchers.Items[i]).Delay :=
        TT3ChaffLauncher(ChaffLaunchers.Items[rec.LauncherID]).Delay;;
    end;
  end;
end;

procedure TT3SimManager.CounterMeasureAssets(pi: TPlatform_Instance; vehicle : TT3Vehicle);
begin
  CounterMeasureSet(pi.Vehicle.Acoustic_Decoys,TT3AcousticDecoyOnVehicle,vehicle);
  CounterMeasureSet(pi.Vehicle.Chaffs,TT3ChaffOnVehicle,vehicle);
  CounterMeasureSet(pi.Vehicle.Chaff_Launchers,TT3ChaffLauncher,vehicle);
  CounterMeasureSet(pi.Vehicle.Floating_Decoys,TT3FloatingDecoyOnVehicle,vehicle);
  CounterMeasureSet(pi.Vehicle.Infrared_Decoys,TT3InfraredDecoyOnVehicle,vehicle);
  CounterMeasureSet(pi.Vehicle.Towed_Jammer_Decoys,TT3TowedJammerOnVehicle,vehicle);
  CounterMeasureSet(pi.Vehicle.Defensive_Jammers,TT3DefensiveJammerOnVehicle,vehicle);
  CounterMeasureSet(pi.Vehicle.Air_Bubble_Mount, TT3AirBubbleOnVehicle, vehicle);
  CounterMeasureSet(pi.Vehicle.Jammers, TT3RadarNoiseJammerOnVehicle, vehicle); //jammer
end;

procedure TT3SimManager.CounterMeasureSet(aList: TList; aClass: TClass;
  aParent: TT3Vehicle);
var
  j : integer;
  ecm : TObject;
begin
  for j := 0 to aList.Count - 1 do
  begin
    ecm := nil;

    if aClass = TT3AcousticDecoyOnVehicle   then ecm := TT3AcousticDecoyOnVehicle.Create else
    if aClass = TT3ChaffOnVehicle           then ecm := TT3ChaffOnVehicle.Create else
    if aClass = TT3FloatingDecoyOnVehicle   then ecm := TT3FloatingDecoyOnVehicle.Create else
    if aClass = TT3InfraredDecoyOnVehicle   then ecm := TT3InfraredDecoyOnVehicle.Create else
    if aClass = TT3TowedJammerOnVehicle     then ecm := TT3TowedJammerOnVehicle.Create else
    if aClass = TT3DefensiveJammerOnVehicle then ecm := TT3DefensiveJammerOnVehicle.Create else
    if aClass = TT3ChaffLauncher            then ecm := TT3ChaffLauncher.Create else
    if aClass = TT3AirBubbleOnVehicle       then ecm := TT3AirBubbleOnVehicle.Create;
    if aClass = TT3RadarNoiseJammerOnVehicle then ecm := TT3RadarNoiseJammerOnVehicle.Create;   //jammer    //nando

    if (Assigned(ecm)) and (ecm is TT3CounterMeasure) then
    begin
      with TT3CounterMeasure(ecm) do
      begin
        UnitDefinition := aList[j];
        Parent := aParent;
        Initialize;
        SetObjects(SimPlatforms);
      end;

      AssignECMEvent(TT3CounterMeasure(ecm));
      aParent.addDevice(TT3CounterMeasure(ecm));
      SimDevices.addObject(TT3CounterMeasure(ecm));
    end;
  end;
end;

constructor TT3SimManager.Create(Map : TMap);
begin
  inherited Create;

  isFirstStart := True;

  CreateMapConverter(Map);

  GameSetting := TGameSetting.Create;

  FGameThread.Interval := 10;
  FGameThread.OnRunning   := FGameThread_OnPaused;
  FGameThread.OnTerminate := FGameThread_OnTerminate;

  FGotoThread.Interval := 10;
  FGotoThread.OnRunning   := FGotoThread_OnRunning;
  FGotoThread.Enabled := False;

  FDeviceThread.Interval := 10;
  FDeviceThread.OnRunning := FDeviceThread_OnPaused;
  FDeviceThread.OnTerminate := FDeviceThread_OnTerminate;

  FDelayer := TDelayer.Create;
  FDelayer.DInterval := 1;
  FDelayer.Enabled := True;
  FDelayer.OnTime := OnDelayerNotify;

  FNetworkThread.OnRunning := FNetworkThread_OnRunning;
  FNetworkThread.OnTerminate := FNetworkThread_OnTerminate;
  FNetworkThread.Enabled := True;

  FNetworkThreadVBS.OnRunning := FNetworkThreadVBS_OnRunning;
  FNetworkThreadVBS.OnTerminate := FNetworkThreadVBS_OnTerminate;
  FNetworkThreadVBS.Enabled := True;

  FScenario       := tT3DBScenario.Create;

  FRainfall       := TRainfall.Create;
  FCloud_Effects  := TCloud_Effects.Create;
  FDefault_Var    := TDefault_Var.Create;

  GameEnvironment := nil;
  GameDefaults    := nil;

  SimPlatforms    := TT3UnitContainer.Create;
  SimPlatforms.Converter := Converter;
  SimDevices      := TT3UnitContainer.Create;
  SimDevices.Converter := Converter;
  SimWeapons      := TT3UnitContainer.Create;
  SimWeapons.Converter := Converter;
  simNonRealPlatform := TT3UnitContainer.Create;
  simNonRealPlatform.Converter := Converter;

  SimSnapshotData := TT3UnitContainer.Create;
  SimSnapshotData.Converter := Converter;

  DataLinkManager := TT3DatalinkManager.Create;
  DataLinkManager.SetSimPlatforms(SimPlatforms);

  // rodo ngawur tapi yo ben..
  VScenario := FScenario;
  Scenario.OnAssignedPlatform := OnAssignedPlatform;

  SimPointRBLW_VehicleMissile := TT3UnitContainer.Create;
  SimPointRBLW_VehicleMissile.Converter := Converter;
  SimPointBOLW_VehicleMissile := TT3UnitContainer.Create;
  SimPointBOLW_VehicleMissile.Converter := Converter;

  SimShipingRoute := TShipingRouteContainer.Create;
  SimShipingRoute.Converter := Converter;

  SimPlotting := TPlottingContainer.Create;
  SimPlotting.Converter := Converter;

  SimOverlayTemplate := TOverlayTemplateContainer.Create;
  SimOverlayTemplate.Converter := Converter;

  SimPlatformBase := TPlatformBaseContainer.Create;
  SimPlatformBase.Converter := Converter;

  SimEventSummary := TList.Create;

  FScenario.Formation_List_rev.SetManager(Self);
  FGotoTimeMode := False;
  FGotoTimeIndex := -1;

  //list Multi control
  ListPlatformSelect := TList.Create;

  TempPangkalan := TList.Create;
  TempLogistic  := TList.Create;
  TempIntelijen := TList.Create;

  FIsVBS := False;

  FVersion := '1.7';
  FKeyVersion := 2;
end;

procedure TT3SimManager.CreateMapConverter(Map: TMap);
begin
  FConverter      := TCoordConverter.Create;
  FConverter.FMap := Map;
end;

function TT3SimManager.DeployDecoys(const rDecoys: TRecCmdDecoys) : TT3PlatformInstance;
var
  decoyOnVeh : TObject;
  decoy : TT3PlatformInstance;
  pi    : TT3PlatformInstance;
begin

  Result := nil;
  pi := FindT3PlatformByID(rDecoys.PlatformID);

  if not Assigned(pi) then
    Exit;

  case rDecoys.OrderID of
    CORD_ID_Deploy_Float :
    begin
      decoyOnVeh := TT3Vehicle(pi).getDevice(rDecoys.CounterMeasureID, TT3FloatingDecoyOnVehicle);
      if Assigned(decoyOnVeh) and (TT3FloatingDecoyOnVehicle(decoyOnVeh).Quantity > 0) then
        with TT3FloatingDecoyOnVehicle(decoyOnVeh) do begin
          decoy := Deploy ;
          decoy.GroupIndex := pi.GroupIndex;

          if Assigned(decoy) then
            OnDeployDecoy(decoy);

          if FIsInstructor or FIsWasdal or decoy.UnitGroup then
            decoy.Visible := True
          else
            decoy.Visible := False;

          AssignECMEvent(decoy);
          SimPlatforms.addObject(decoy);

          if rDecoys.DecoyInstanceIndex = 0 then
            decoy.InstanceIndex := GetSerialPlatformID
          else
            decoy.InstanceIndex := rDecoys.DecoyInstanceIndex;

          Result := decoy;
        end;
    end;
    CORD_ID_Deploy_IR :
    begin
      decoyOnVeh := TT3Vehicle(pi).getDevice(rDecoys.CounterMeasureID, TT3InfraredDecoyOnVehicle);
      if Assigned(decoyOnVeh) and (TT3InfraredDecoyOnVehicle(decoyOnVeh).Quantity > 0) then
        with TT3InfraredDecoyOnVehicle(decoyOnVeh) do begin
          decoy := Deploy ;
          decoy.GroupIndex := pi.GroupIndex;

          if Assigned(decoy) then
            OnDeployDecoy(decoy);

          if FIsInstructor or FIsWasdal or decoy.UnitGroup then
            decoy.Visible := True
          else
            decoy.Visible := False;

          AssignECMEvent(decoy);
          SimPlatforms.addObject(decoy);

          if rDecoys.DecoyInstanceIndex = 0 then
            decoy.InstanceIndex := GetSerialPlatformID
          else
            decoy.InstanceIndex := rDecoys.DecoyInstanceIndex;

          Result := decoy;
        end;
    end;
  end;


end;

destructor TT3SimManager.Destroy;
var
  i,j : integer;
  obj, obj2 : TObject;
begin
  //FPlatForms.Free;    // and free all the childs.

  for i := ListPlatformSelect.Count - 1 downto 0 do
  begin
    ListPlatformSelect.Delete(i);
  end;

  ListPlatformSelect.Clear;
  ListPlatformSelect.Free;

  // safely remove
  for i := 0 to SimPlatforms.itemCount - 1 do begin
    obj := SimPlatforms.getObject(i);
    if obj is TT3PlatformInstance then
      UnassignPlatformInstanceEvent(obj as TT3PlatformInstance);
  end;

  for i := 0 to SimDevices.itemCount - 1 do begin
    obj := SimDevices.getObject(i);
    if obj is TT3Weapon then
      UnassignWeaponEvent(obj as TT3Weapon)
    else
    if obj is TT3Sensor then
      UnassignSensorEvent(obj as TT3Sensor)
    else
    if obj is TT3CounterMeasure then
      UnassignECMEvent(obj as TT3CounterMeasure);
  end;

  for i := 0 to SimWeapons.itemCount - 1 do begin
    obj := SimWeapons.getObject(i);
    if obj is TT3Weapon then
      UnassignWeaponEvent(obj as TT3Weapon);
  end;

  for i:= SimShipingRoute.FList.Count - 1 downto 0 do
  begin
    obj := SimShipingRoute.FList.Items[i];

    if obj is TShipingRouteContainer then
    begin
      for j := TShipingRouteContainer(obj).FList.Count - 1 downto 0 do
      begin
         obj2 := TShipingRouteContainer(obj).FList.Items[j];
         if Assigned(obj2) then
         begin
           TPointRoute(obj2).Free;
           TShipingRouteContainer(obj).FList.Delete(j);
         end;
      end;

      TShipingRouteContainer(obj).Free;
      SimShipingRoute.FList.Delete(i);
    end;
  end;

  TempPangkalan.Free;
  TempLogistic.Free;
  TempIntelijen.Free;

  FScenario.Free;
  FCubAssignList.Free;
  //FGameDefault.Free;
  FRainfall.Free;
  FCloud_Effects.Free;
  FDefault_Var.Free;

  SimWeapons.ClearAndRemove;
  SimDevices.ClearAndRemove;

  SimPlatforms.ClearObjectEvent;
  SimPlatforms.ClearAndRemove;

  simNonRealPlatform.ClearAndRemove;

  SimPlotting.Free;
  SimShipingRoute.Free;
  SimWeapons.Free;
  SimDevices.Free;
  SimPlatforms.Free;
  simNonRealPlatform.Free;
  SimEventSummary.Free;
  SimPlatformBase.Free;

  inherited;
end;


procedure TT3SimManager.FGameThread_OnTerminate(sender: TObject);
begin

end;

procedure TT3SimManager.FDeviceThread_OnPaused(const dt: double);
begin

end;

procedure TT3SimManager.FDeviceThread_OnRunning(const dt: double);
var
  i, gS: integer;
begin
  if GameSPEED < 1.0 then
  begin
    // slow down baby...
  end
  else
  begin
    SimWeapons.Validate;
    SimDevices.Validate;
//    SimPlatforms.Validate;
//    simNonRealPlatform.Validate;

    gS := Round(GameSPEED);
    for I := 0 to gs - 1 do begin
//      FMainVTime.IncreaseMillisecond(dt * 1000.0 );

//      SimPlatforms.Moves(dt);

      SimDevices.Moves(dt);
      SimWeapons.Moves(dt);
//      simNonRealPlatform.Moves(dt);

//      FDelayer.Run(dt);
    end;

    {$IFDEF SERVER}
//    DataLinkManager.PoolDataLink(dt);
    {$ENDIF}

  end;
end;

procedure TT3SimManager.FDeviceThread_OnTerminate(sender: TObject);
begin

end;

procedure TT3SimManager.FGotoThread_OnRunning(const dt: double);
const
  C_DELTATIME = 40; //sec
var
  i : integer;
  gdt : double;
begin
  {
    v0.1 :larger delta time make less accurate sim calculation..!
      run running thread exactly every specific sec (exp 1 sec) per cycle,
      til gototime reached

    v0.2 : change to game speed like, adapt from gamethread_running procedure,
      loop until FElapsedTime reach 0 on 1 cycle time

    v0.3 : Applying C_DELTATIME, another version of v0.1
    v0.4 : delta time value get from setting.ini
  }

  {still check with actual time togo and game time}
  if FTimeToGo <= GameTIME  then
    FElapseTimeToGo := 0;

//  if vGameDataSetting.GotoInterval <= 0 then
//    gdt := C_DELTATIME  // set to default
//  else
//    gdt := vGameDataSetting.GotoInterval;

//  while (FElapseTimeToGo > 0) do
//  begin

    {$IFDEF SERVER}
//    Run(gdt);
      CalcAfterTime(FElapseTimeToGo);
    {$ENDIF}

//    {decrease Elapsedtime with dt}
//    if FElapseTimeToGo - gdt < 0 then
//    begin
//      {$IFDEF SERVER}
//      Run(FElapseTimeToGo);
//      {$ENDIF}
//      FElapseTimeToGo := 0;
//    end else
//      FElapseTimeToGo := FElapseTimeToGo - gdt;
//  end;

  FElapseTimeToGo := 0;

  if (FElapseTimeToGo <= 0) or (FGotoTimeIndex = -1) then begin
    FGotoThread.Enabled     := False;
    GameSPEED               := 0.0;

    FGameThread.OnRunning   := FGameThread_OnRunning;
    FDeviceThread.OnRunning := FDeviceThread_OnRunning;
  end;
end;

procedure TT3SimManager.FGameThread_OnPaused(const dt: double);
begin

end;

procedure TT3SimManager.FGameThread_OnRunning(const dt: double);
var
  i, gS: integer;
begin
  // d
  if GameSPEED < 1.0 then
  begin
    // slow down baby...
  end
  else
  begin
    SimPlatforms.Validate;
    simNonRealPlatform.Validate;
    SimSnapshotData.Validate;

    gS := Round(GameSPEED);
    for I := 0 to gs - 1 do begin
      FMainVTime.IncreaseMillisecond(dt * 1000.0 );
//      FMainVTime.IncreaseMillisecond(dt);
//      OnLogStr('FGameThread_OnRunning', FloatToStr(dt * 1000.0));

      SimPlatforms.Moves(dt);
      simNonRealPlatform.Moves(dt);
      SimPlatforms.GameTime(FMainVTime.GetTime);

      FDelayer.Run(dt);
    end;

    {$IFDEF SERVER}
//    DataLinkManager.PoolDataLink(dt);
    {$ENDIF}

  end;
end;


procedure TT3SimManager.GameStart;
begin
//  inherited;

  if isFirstStart then
  begin
    FGameThread.Enabled := true;  //add p.ryu(biar gk loncat saat game awal start)
    FDeviceThread.Enabled := True;
  end;

  if FGameState = gsStop then
  begin
    FGameThread.OnRunning := FGameThread_OnRunning;
    FDeviceThread.OnRunning := FDeviceThread_OnRunning;

    if FGameThread.Suspended then
      FGameThread.Start;

    if FDeviceThread.Suspended then
      FDeviceThread.Start;
  end
  else begin

  end;
  FGameState := gsPlaying;
end;

procedure TT3SimManager.GamePause;
begin
//  inherited;
  if FGameState = gsPlaying then begin

    FGameThread.OnRunning := FGameThread_OnPaused;
    FDeviceThread.OnRunning := FDeviceThread_OnPaused;
    // thread do nothing. :P
  end;
  FGameState := gsStop;

end;

procedure TT3SimManager.GameTerminate;
begin
  FGameState := gsTerminated;
  FDeviceThread.Terminate;
  FGameThread.Terminate;
end;

function TT3SimManager.GetConsoleIdentification: Boolean;
var
  WMIServices : ISWbemServices;
  Root        : ISWbemObjectSet;
  Item        : Variant;
  snTemp      : string;
  regTemp     : string;
  Address     : string;
  dateTemp    : string;
  stop, start : TDateTime;
  selisih     : Double;
  Tahun, Bulan, Hari : Word;
begin
  snTemp :=  '';
  regTemp := '';

  WMIServices := CoSWbemLocator.Create.ConnectServer('.', 'root\cimv2','', '', '', '', 0, nil);
  Root  := WMIServices.ExecQuery('Select SerialNumber From Win32_DiskDrive','WQL', 0, nil);
  Item := Root.ItemIndex(0);
  snTemp:=VarToStr(Item.SerialNumber);

  snTemp := ReplaceStr(snTemp, '_', '');
  snTemp := ReplaceStr(snTemp, '.', '');
  snTemp := RightStr(snTemp,8);

  Address := 'Software\CmPack\CmLogin';
  try
    try
      FReg := Tregistry.Create;
      FReg.OpenKey(Address,False);
      regTemp := FReg.ReadString('LockID');
      dateTemp := FReg.ReadString('Date');
    except on ERegistryException do
    end;
  finally
    FReg.CloseKey;
  end;

  DecodeDate(Now, Tahun, Bulan, Hari);
  start := EncodeDate(Tahun, Bulan, Hari);

  if dateTemp = 'U' then
  begin
    Result := snTemp = regTemp;
  end
  else
  begin
    Stop := StrToFloat(dateTemp);
    selisih := Stop - start;

    if selisih < 0 then
      Result := False
    else
      Result := snTemp = regTemp;
  end;
end;

procedure TT3SimManager.GetFuelConsBySpeed(aVehicle : TT3Vehicle; aSpeed: Double; var
  afuelCons: Double);
begin
  if aSpeed = aVehicle.UnitMotion.FData.Min_Ground_Speed then
    afuelCons := aVehicle.UnitMotion.FData.Min_Speed_Fuel_Consume
  else if (aSpeed > aVehicle.UnitMotion.FData.Min_Ground_Speed)
    and (aSpeed < aVehicle.UnitMotion.FData.High_Ground_Speed) then
    afuelCons := aVehicle.UnitMotion.FData.Cruise_Speed_Fuel_Consume
  else if (aSpeed >= aVehicle.UnitMotion.FData.High_Ground_Speed)
    and (aSpeed < aVehicle.UnitMotion.FData.Max_Ground_Speed) then
    afuelCons := aVehicle.UnitMotion.FData.High_Speed_Fuel_Consume
  else if (aSpeed >= aVehicle.UnitMotion.FData.Max_Ground_Speed) then
    afuelCons := aVehicle.UnitMotion.FData.Max_Speed_Fuel_Consume;
end;

function TT3SimManager.GetPersonel(list: TList; identifier: string;
var Personel: TPersonel; level : Integer; var idx : Integer): Boolean;
var
  I : Integer;
begin
  Result := False;

  for I := 0 to list.Count - 1 do
  begin
    case level of
      0 : Personel  := TBrigade(list.Items[i]);
      1 : Personel  := TBatalyon(list.Items[i]);
      2 : Personel  := TKompi(list.Items[i]);
      3 : Personel  := TPlatoon(list.Items[i]);
      4 : Personel  := TGroup(list.Items[i]);
    end;

    if identifier  = Personel.Identifier then
    begin
      Result := True;
      idx := i;
      Break;
    end;
  end;
end;

function TT3SimManager.GetSerialFormationID: Integer;
begin
  Result := FlastFormationID;
  Inc(FlastFormationID);
end;

function TT3SimManager.GetSerialOverlayID: Integer;
begin
  Result := FLastOverlayID;
  Inc(FLastOverlayID);
end;

function TT3SimManager.GetSerialPlatformID: Integer;
begin
  Result := FLastPlatformID;
  Inc(FLastPlatformID);
end;

function TT3SimManager.GetSerialPlottingID: Integer;
begin
  Result := FLastPlottingID;
  Inc(FLastPlottingID);
end;

function TT3SimManager.GetSerialShipingRouteID: Integer;
begin
  Result := FLastShipingRouteID;
  Inc(FLastShipingRouteID);
end;

procedure TT3SimManager.GotoTime(Index: Integer);
var
  time : TTime;
  date : TDate;
  h,m,s : word;
  md : integer;
begin
  FGotoTimeIndex  := Index;

  if Index < 0 then
    Exit;

  FGotoTimeMode   := True;

  if (Index > Length(C_GotoTimeSecond) - 1) and (Index <> 1000) then
  begin
    FGotoTimeIndex  := -1;
    FGotoTimeMode   := False;
  end
  else
  begin
    { start goto, normal gamespeed and paused }
    GameSPEED           := 1.0;
    GamePause;

    {calc time to go from current to togo time}
    if FGotoTimeIndex <= Length(C_GotoTimeSecond) - 1 then
    begin
      FElapseTimeToGo := C_GotoTimeSecond[FGotoTimeIndex];
      SecondToHMS(FElapseTimeToGo,h,m,s);
      {if h > 24 hours }
      if h >= HoursPerDay then
      begin
        md := h div HoursPerDay;
        time := EncodeTime(H mod HoursPerDay,M,S,0);
        FTimeToGo := GameTIME + time;
        { inc day }
        FTimeToGo := IncDay(FTimeToGo,md);
      end else
      begin
        time := EncodeTime(H,M,S,0);
        FTimeToGo := GameTIME + time;
      end;
    end
    else
    if FGotoTimeIndex = 1000 then
    begin
      FElapseTimeToGo := SecondsBetween(FTimeToGo,GameTIME);
    end;

    {enable goto thread}
    FGameThread.OnRunning   := nil;
    FDeviceThread.OnRunning := nil;
    FGotoThread.Enabled     := True;
  end;

end;

procedure TT3SimManager.ResetScenario;
begin
  inherited;

  SimDevices.ClearAndRemove;
  SimWeapons.ClearAndRemove;
  SimPlatforms.ClearAndRemove;
  simNonRealPlatform.ClearAndRemove;
end;

function TT3SimManager.ReturnTobase(const rec: TRecCmd_ReturnToBase):Boolean;
var
  i : integer;
  PfOnBase, SelBase : TPlatformBase;
  pob,pobAdd : TPlatform_Embark_Library;
  add : Boolean;

begin
  Result := False;
  add := True;
  SelBase := nil;

  for i := 0 to VScenario.BaseListFromDB.Count - 1 do
  begin
    PfOnBase := TPlatformBase(VScenario.BaseListFromDB.Items[i]);
    if PfOnBase.id = rec.BaseId then
    begin
      SelBase := PfOnBase;
      Break;
    end;
  end;

  if SelBase = nil then Exit;

  for i := 0 to SelBase.ListVehicle.Count - 1 do
  begin
    pob := TPlatform_Embark_Library(SelBase.ListVehicle.Items[i]);
    if pob.FData.Vehicle_Index = rec.IdPlatform then
    begin
      pob.FData.Quantity := pob.FData.Quantity + 1;
      add := False;
      Break;
    end;
  end;

  if add then
  begin
    pobAdd := TPlatform_Embark_Library.Create;
    with pobAdd.FData do
    begin
      Platform_Embark_Index := 0;
      Embark_Library_Index := rec.BaseId;
      Vehicle_Identifier := rec.PlatformClassIden;
      Vehicle_Index := rec.IdPlatform;
      Quantity := 1;
      Width := rec.Width;
      Length := rec.Length;
    end;
    SelBase.ListVehicle.Add(pobAdd);
  end;
  Result := True;
end;

procedure TT3SimManager.Run(const dt: Double);
begin
  FMainVTime.IncreaseMillisecond(dt * 1000.0 );
  SimPlatforms.Moves(dt);
  simNonRealPlatform.Moves(dt);
  SimDevices.Moves(dt);
  SimWeapons.Moves(dt);
  SimPlatforms.GameTime(FMainVTime.GetTime);
  FDelayer.Run(dt);
end;

procedure TT3SimManager.setSessionID(const Value: integer);
begin
  FSessionID := Value;
end;

procedure TT3SimManager.LoadScenarioID(const vSet: TGameDataSetting);
var
  i : Integer;
  hostShipTemp: TT3Vehicle;
  memberShipTemp: TT3Vehicle;
begin
  ResetScenario;

  FLastPlatformID := 100;
  FlastFormationID:= 0;
  FLastOverlayID:= 0;
  FLastPlottingID := 0;
  FLastShipingRouteID := 0;

  GameEnvironment  := FScenario.GameEnvironment;
  GameDefaults := FScenario.GameDefaults;

  if GetConsoleIdentification then
    FScenario.LoadFromDB(vSet.ScenarioID, vCubicalAssignSetting, IsController);

  FMainVTime.Reset(0);
  FMainVTime.DateTimeOffset := FScenario.ResourceAllocation.FData.Game_Start_Time;

  FLastPlatformID := ((FLastPlatformID  div 100) + 1 ) * 100;
  
  GameEnvironment.COnverter := Converter;
  DataLinkManager.SetGameDefaults(GameDefaults);

  FRainfall.LoadFromRainfall();
  FCloud_Effects.LoadFromCloudEffects();
  FDefault_Var.LoadFromDatabase();

  {$REGION ' Set Vehicle for Transport Fitur '}
  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    memberShipTemp := TT3Vehicle(SimPlatforms.getObject(i));

    if memberShipTemp is TT3Vehicle then
    begin
      if not memberShipTemp.StateTransport then
        Continue;

      if memberShipTemp.StateTransport then
      begin
        hostShipTemp := TT3Vehicle(SimPlatforms.getObjectByInstanceIndex(memberShipTemp.HostIdTransport));

        if not Assigned(hostShipTemp) then
          Continue;

        memberShipTemp.MemberHeading := ValidateDegree(memberShipTemp.UnitActivation.Init_Helm_Angle);
        memberShipTemp.MemberOrderedHeading := ValidateDegree(memberShipTemp.UnitActivation.Init_Helm_Angle);
        memberShipTemp.MemberLoadState := mlsStandby;

        case memberShipTemp.PlatformDomain of
          vhdAir :
          begin
            {$REGION ' Air Section '}
            hostShipTemp.CurrentHanggarWeight := hostShipTemp.CurrentHanggarWeight + memberShipTemp.VehicleDefinition.FData.Weight;
            hostShipTemp.CurrentHanggarCapacity := hostShipTemp.CurrentHanggarCapacity + 1;
            {$ENDREGION}
          end;
          vhdSurface,vhdSubsurface :
          begin
            {$REGION ' Surface & Subsurface Section '}
            hostShipTemp.CurrentOnBoardWeight:= hostShipTemp.CurrentOnBoardWeight + memberShipTemp.VehicleDefinition.FData.Weight;
            {$ENDREGION}
          end;
          vhdLand :
          begin
            if (memberShipTemp.PlatformCategory =  2) and (memberShipTemp.PlatformType =  0) then
            begin
              {$REGION ' Personel Section '}
              hostShipTemp.CurrentPersonelWeight := hostShipTemp.CurrentPersonelWeight + memberShipTemp.VehicleDefinition.FData.Weight;
              hostShipTemp.CurrentPersonelCapacity := hostShipTemp.CurrentPersonelCapacity + memberShipTemp.VehicleDefinition.FData.Quantity_Group_Personal;
              {$ENDREGION}
            end
            else
            begin
              {$REGION ' Land Section '}
              hostShipTemp.CurrentHullWeight := hostShipTemp.CurrentHullWeight + memberShipTemp.VehicleDefinition.FData.Weight;
              hostShipTemp.CurrentHullSpace := hostShipTemp.CurrentHullSpace + (memberShipTemp.VehicleDefinition.FData.Width * memberShipTemp.VehicleDefinition.FData.Length);
              {$ENDREGION}
            end;
          end;
          vhdAmphibious :
          begin
            {$REGION ' Amphibious Section '}
            hostShipTemp.CurrentHullWeight := hostShipTemp.CurrentHullWeight + memberShipTemp.VehicleDefinition.FData.Weight;
            hostShipTemp.CurrentHullSpace := hostShipTemp.CurrentHullSpace + (memberShipTemp.VehicleDefinition.FData.Width *
            memberShipTemp.VehicleDefinition.FData.Length);
            {$ENDREGION}
          end;
        end;


        hostShipTemp.MemberTransportList.Add(memberShipTemp);
      end;
    end;
  end;
  {$ENDREGION}

  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    hostShipTemp := TT3Vehicle(SimPlatforms.getObject(i));

    if hostShipTemp is TT3Vehicle then
    begin
      hostShipTemp.SumCurrentWeight := hostShipTemp.CurrentHanggarWeight + hostShipTemp.CurrentOnBoardWeight +
      hostShipTemp.CurrentPersonelWeight + hostShipTemp.CurrentHullWeight;
    end;
  end;

  for i := 0 to Scenario.FormationListFromDB.Count - 1 do
  begin
    if FlastFormationID < TFormation(Scenario.FormationListFromDB[i]).FFormation_Def.Formation_Index then
    begin
      FlastFormationID  := TFormation(Scenario.FormationListFromDB[i]).FFormation_Def.Formation_Index;
    end;
  end;
  Inc(FlastFormationID);

//  for i := 0 to Scenario.OverlayListFromDB.Count - 1 do
//  begin
//    if FLastOverlayID < TResource_Allocation(Scenario.OverlayListFromDB.Items[i]).FOverlay.Overlay_Index  then
//    begin
//      FLastOverlayID := TResource_Allocation(Scenario.OverlayListFromDB.Items[i]).FOverlay.Overlay_Index
//    end;
//  end;
//  Inc(FLastOverlayID);

  for i := 0 to Scenario.PlottingListFromDB.Count - 1 do
  begin
    if FLastPlottingID < TResource_Allocation(Scenario.PlottingListFromDB.Items[i]).FPlotting.Plotting_Index  then
    begin
      FLastPlottingID := TResource_Allocation(Scenario.PlottingListFromDB.Items[i]).FPlotting.Plotting_Index
    end;
  end;
  Inc(FLastPlottingID);

//  FGDefList := FScenario.GDefList;
end;

procedure TT3SimManager.LoadReferencePoint();
var
  I: Integer;
  rec : TRecCmd_LaunchNonRP;
  ref_point: TReference_Point;
  domain,identity: String;
begin
  for I := 0 to FScenario.ReferencePointListFromDB.Count - 1 do
  begin
    //set record
    ref_point := FScenario.ReferencePointListFromDB[I];
    rec.SessionID := FSessionID;
    rec.NRPPlatformID := ref_point.FData.Reference_Index;
    rec.NRPGroupID    := ref_point.FData.Force_Designation;
    rec.InstanceName  := ref_point.FData.Reference_Identifier;
    rec.NewPlatformID := 0;
    rec.TrackIdent    := '';

    case ref_point.FData.Track_Type of
      0: rec.PointType  := nrpBearing;
      1: rec.PointType  := nrpSpecial;
      2: rec.PointType  := nrpPoint;
      3: rec.PointType  := nrpArea;
    end;

    domain   := '0';
    identity := '0';
    if ref_point.FData.Track_Type <> 1 then
    begin
      if Length(IntToStr(ref_point.FData.Symbol_Type)) = 1 then
      begin
        identity := IntToStr(ref_point.FData.Symbol_Type);
        rec.Identity := StrToInt(identity);
      end
      else
      begin
        domain   := AnsiMidStr(IntToStr(ref_point.FData.Symbol_Type),1,1);
        identity := AnsiMidStr(IntToStr(ref_point.FData.Symbol_Type),2,1);
      end;

      case StrToInt(domain) of
        0: rec.TrackDomain := vhdAir;
        1: rec.TrackDomain := vhdSurface;
        2: rec.TrackDomain := vhdSubsurface;
        3: rec.TrackDomain := vhdLand;
      end;
      case StrToInt(identity) of
        0: rec.Identity := piPending;
        1: rec.Identity := piUnknown;
        2: rec.Identity := piAssumedFriend;
        3: rec.Identity := piFriend;
        4: rec.Identity := piNeutral;
        5: rec.Identity := piSuspect;
        6: rec.Identity := piHostile;
      end;
    end
    else
    begin
      rec.TrackDomain := vhdSurface;
      rec.Identity := ref_point.FData.Symbol_Type;
    end;

    rec.pX      := ref_point.FData.Longitude;
    rec.pY      := ref_point.FData.Latitude;
    rec.pZ      := 0;
    rec.Symbol  := getNameReferencePointInt(ref_point.FData.Track_Type,rec.TrackDomain,rec.Identity);

    rec.Speed   := ref_point.FData.Speed;
    rec.Course  := ref_point.FData.Course;
    rec.Bearing := ref_point.FData.Track_Bearing;
    rec.AOP_time:= ref_point.FData.AOP_Start_Time_Offset;

    LaunchReferencePoint(rec);
  end;
end;

procedure TT3SimManager.LoadFormation(v_platform: TT3Vehicle; status : integer);
var
  I : Integer;
  form      : TFormation;
  member_platform: TT3Vehicle;
  leader_platform: TT3Vehicle;
//  p: TT3Vehicle;
begin
  for I := 0 to Scenario.Formation_List.Count - 1 do
  begin
    form := TFormation(Scenario.Formation_List[I]);
    if not(Assigned(form)) then
      Continue;

    if form.FFormation_Def.Formation_Leader = v_platform.InstanceIndex then
    begin
//      for J := 0 to formation.Count - 1 do
//      begin
//        form := formation[J];
        //p := FindT3PlatformByID(form.FFormation_Def.Formation_Leader) as TT3Vehicle;
//        if Assigned(p) then
//        begin
//          if v_platform = p then

      if form.FFormation_Def.Formation_Leader = v_platform.InstanceIndex then
      begin
        member_platform := FindT3PlatformByID(form.FForm_Assign.Platform_Instance_Index) as TT3Vehicle;
        leader_platform := FindT3PlatformByID(form.FFormation_Def.Formation_Leader) as TT3Vehicle;

        if status = 1 then
        begin
          if Assigned(leader_platform) then begin
            leader_platform.isFormationLeader := false;
          end;

          if Assigned(member_platform) and Assigned(leader_platform) then
          begin
            leader_platform.isFormationLeader := true;
            leader_platform.FormationName     := form.FFormation_Def.Formation_Identifier;

            member_platform.FormationRange    := form.FForm_Assign.Range_from_Leader;
            member_platform.FormationAltitude := form.FForm_Assign.Altitude;
            member_platform.FormationBearing  := form.FForm_Assign.Angle_Offset;
            member_platform.LeaderPlatform    := leader_platform;
            member_platform.OrderedSpeed      := member_platform.Mover.MaxSpeed;
            member_platform.FormationState    := form.FFormation_Def.Angle_Type;

            member_platform.lastStationPointX := 0;
            member_platform.lastStationPointY := 0;
            member_platform.VehicleDefinition.GuidanceType := vgtFormation;
          end;
        end else  if status = 0 then
        begin
          if Assigned(member_platform) and Assigned(leader_platform) then
          begin
            leader_platform.isFormationLeader := false;
            leader_platform.FormationName     := '';

            member_platform.FormationRange    := 0;
            member_platform.FormationAltitude := 0;
            member_platform.FormationBearing  := 0;
            member_platform.LeaderPlatform    := nil;
            member_platform.OrderedSpeed      := 0;
            member_platform.FormationState    := 0;

            member_platform.lastStationPointX := 0;
            member_platform.lastStationPointY := 0;

            if member_platform.VehicleDefinition.GuidanceType = vgtFormation then
              member_platform.VehicleDefinition.GuidanceType := vgtStraightLine
          end;
        end;
      end;
//        end;
//      end;
    end;
  end;
end;

function TT3SimManager.getNameReferencePoint(tipe, domain, identity: Integer): String;
var bmp_name: String;
    domain_name: Integer;
begin
  case tipe of
    1:
      begin
        case identity of
          0: bmp_name := pctGeneral;
          1: bmp_name := pctBuoy;
          2: bmp_name := pctDataLinkReferencePoint;
          3: bmp_name := pctDistressedVessel;
          4: bmp_name := pctEsmEcmFix;
          5: bmp_name := pctGroundZero;
          6: bmp_name := pctManInWater;
          7: bmp_name := pctMaritimeHeadquarters;
          8: bmp_name := pctMineHazard;
          9: bmp_name := pctNavigationalHazard;
          10: bmp_name := pctOilRig;
          11: bmp_name := pctStation;
          12: bmp_name := pctTacticalGridorigin;
          13: bmp_name := pctAirGeneral;
          14: bmp_name := pctAirborneEarlyWarning;
          15: bmp_name := pctBullseye;
          16: bmp_name := pctCombatAirPatrol;
          17: bmp_name := pctDitchedAirCraft;
          18: bmp_name := pctGate;
          19: bmp_name := pctAswGeneral;
          20: bmp_name := pctBriefContact;
          21: bmp_name := pctDatum;
          22: bmp_name := pctKingpin;
          23: bmp_name := pctRiser;
          24: bmp_name := pctSearchCentre;
          25: bmp_name := pctSinker;
          26: bmp_name := pctWeaponEntryPoint;
          27: bmp_name := pctWreck;
        end;
        bmp_name  := bmp_name;
      end;
    2,3:
      begin
        domain_name := 1; //def surface

        case domain of
          0: domain_name := vhdAir;
          1: domain_name := vhdSurface;
          2: domain_name := vhdSubsurface;
          3: domain_name := vhdLand;
        end;

        case identity of
          0: bmp_name  := getDetectedSymbolFileName(domain_name, piPending);
          1: bmp_name  := getDetectedSymbolFileName(domain_name, piUnknown);
          2: bmp_name  := getDetectedSymbolFileName(domain_name, piAssumedFriend);
          3: bmp_name  := getDetectedSymbolFileName(domain_name, piFriend);
          4: bmp_name  := getDetectedSymbolFileName(domain_name, piNeutral);
          5: bmp_name  := getDetectedSymbolFileName(domain_name, piSuspect);
          6: bmp_name  := getDetectedSymbolFileName(domain_name, piHostile);
        end;
      end;
  end;

  Result  := bmp_name;
end;

function TT3SimManager.getNameReferencePointInt(tipe, domain,
  identity: Integer): Char;
var bmp_name: Char;
    domain_name: Integer;
begin
  case tipe of
    1:
      begin
        case identity of
          0: bmp_name := pciGeneral;
          1: bmp_name := pciBuoy;
          2: bmp_name := pciDataLinkReferencePoint;
          3: bmp_name := pciDistressedVessel;
          4: bmp_name := pciEsmEcmFix;
          5: bmp_name := pciGroundZero;
          6: bmp_name := pciManInWater;
          7: bmp_name := pciMaritimeHeadquarters;
          8: bmp_name := pciMineHazard;
          9: bmp_name := pciNavigationalHazard;
          10: bmp_name := pciOilRig;
          11: bmp_name := pciStation;
          12: bmp_name := pciTacticalGridorigin;
          13: bmp_name := pciAirGeneral;
          14: bmp_name := pciAirborneEarlyWarning;
          15: bmp_name := pciBullseye;
          16: bmp_name := pciCombatAirPatrol;
          17: bmp_name := pciDitchedAirCraft;
          18: bmp_name := pciGate;
          19: bmp_name := pciAswGeneral;
          20: bmp_name := pciBriefContact;
          21: bmp_name := pciDatum;
          22: bmp_name := pciKingpin;
          23: bmp_name := pciRiser;
          24: bmp_name := pciSearchCentre;
          25: bmp_name := pciSinker;
          26: bmp_name := pciWeaponEntryPoint;
          27: bmp_name := pciWreck;
        end;
        bmp_name  := bmp_name;
      end;
    2,3:
      begin
        domain_name := 1; //def surface

        case domain of
          0: domain_name := vhdAir;
          1: domain_name := vhdSurface;
          2: domain_name := vhdSubsurface;
          3: domain_name := vhdLand;
        end;

        case identity of
          0: bmp_name  := getDetectedSymbolFileName(domain_name, piPending);
          1: bmp_name  := getDetectedSymbolFileName(domain_name, piUnknown);
          2: bmp_name  := getDetectedSymbolFileName(domain_name, piAssumedFriend);
          3: bmp_name  := getDetectedSymbolFileName(domain_name, piFriend);
          4: bmp_name  := getDetectedSymbolFileName(domain_name, piNeutral);
          5: bmp_name  := getDetectedSymbolFileName(domain_name, piSuspect);
          6: bmp_name  := getDetectedSymbolFileName(domain_name, piHostile);
        end;
      end;
  end;

  Result := bmp_name;
end;

function TT3SimManager.FindT3DeviceByID(classT: TClass; Parent: TSimObject;
  const id: integer): TT3DeviceUnit;
var i, c: Integer;
    dev : TT3DeviceUnit;
    f: boolean;
begin
  f := false;
  I := 0;
  c := SimDevices.itemCount;
  dev := nil;

  while not f and (i < c) do
  begin
    dev := TT3DeviceUnit(SimDevices.getObject(i));
    f := (dev.ClassType = classT) and (dev.Parent = Parent) and (dev.InstanceIndex = id);
    inc(i);
  end;

  if f then
    result := dev
  else
    result := nil;
end;

function TT3SimManager.FindDeviceByID(id: integer): TT3Unit;
var i, c: Integer;
    dev : TT3Unit;
    f: boolean;
begin
  f := false;
  I := 0;
  c := SimDevices.itemCount;
  dev := nil;

  while not f and (i < c) do
  begin
    dev := TT3DeviceUnit(SimDevices.getObject(i));
    f := (dev.InstanceIndex = id);
    inc(i);
  end;

  if f then
    result := dev
  else
    result := nil;
end;

function TT3SimManager.FindT3PlatformByID(
  const id: integer): TT3PlatformInstance;
var i, c: Integer;
    pi : TT3PlatformInstance;
    f: boolean;
begin
  f := false;
  I := 0;
  c := SimPlatforms.itemCount;
  pi := nil;

  while not f and (i < c) do
  begin
    pi := TT3PlatformInstance(SimPlatforms.getObject(i));
    f := (pi.InstanceIndex = id);
    inc(i);
  end;

  if f then
    result := pi
  else
    result := nil;
end;

function TT3SimManager.FindNonRealPlatformByID(const id : integer) : TT3PlatformInstance;
var i, c: Integer;
    pi : TT3PlatformInstance;
    f: boolean;
begin
  f := false;
  I := 0;
  c := simNonRealPlatform.itemCount;
  pi := nil;

  while not f and (i < c) do
  begin
    pi := TT3PlatformInstance(simNonRealPlatform.getObject(i));
    f := (pi.InstanceIndex = id);
    inc(i);
  end;

  if f then
    result := pi
  else
    result := nil;
end;

procedure TT3SimManager.FreePlatform(rec: TRecPlatformFreeMe);
var
  pi : TT3PlatformInstance;
  S : string;
begin
  pi := FindT3PlatformByID(rec.PlatformID);

  if pi = nil then
    pi := FindNonRealPlatformByID(rec.PlatformID);

  if Assigned(pi) then
  begin
    pi.reasonDestroy := rec.reasondestroy;
    pi.FreeMe := rec.FreeMe;

    if not ((pi is TT3Vehicle) or (pi is TT3NonRealVehicle)) then
      pi.AbsoluteFree := True;

    case pi.FreeMe of
      True : S := 'FreeMe Platform : True';
      False : S := 'FreeMe Platform : False';
    end;

    if pi is TT3Weapon then
    begin
      if Assigned((pi as TT3Weapon).TargetObject) then
         S := S + ' , Target Platform : ' + TT3PlatformInstance((pi as TT3Weapon).TargetObject).InstanceName;
    end;

    if Assigned(OnLogTemporary) then
      OnLogTemporary('Platform Name : ' + pi.InstanceName
                      + ' , ' + S)
  end;
end;

function TT3SimManager.FindNearestInfoBalloon(const aX, aY: Integer): TObject;
var
  i : Integer;
  simObject : TSimObject;
  vehicle : TT3Vehicle;
begin
  Result := nil;

  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    simObject := SimPlatforms.getObject(i);

    if not (simObject is TT3Vehicle) then
      Continue;

    vehicle := TT3Vehicle(simObject);

    with vehicle.InfoBalloon do
    begin
      if PtInRect(BalloonRect, Point(aX, aY)) then
      begin
        Result := vehicle.InfoBalloon;
        Break;
      end;
    end;
  end;
end;

function TT3SimManager.FindNearestTrack(const px, py: double;
  const maxDist: integer): TSimObject;
var
    i: Integer;
    pi : TSimObject;
    rr : Integer;
    m, r: double;
    ctx, cty: integer;
    ptx, pty: integer;
    found : boolean;
begin
  Converter.ConvertToScreen(px, py, ctx, cty);
  m := 1000000.0;
  result := nil;
  found := false;

  // for platforms
  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    pi := SimPlatforms.getObject(i);
    if Assigned(pi.Parent) then
      continue;

    if pi.FreeMe then
      continue;

    if pi is TT3Vehicle then
    begin
      if TT3Vehicle(pi).StateTransport then
        continue;
    end;

    Converter.ConvertToScreen(pi.getPositionX, pi.getPositionY, ptx, pty);
	  try
	    rr := sqr(ptX - ctx) + sqr(ptY - ctY);
	    if  rr = 0 then
	      r := 10000
	    else
	       r := Sqrt(Abs(rr)); //add mamik 29032012
    except
      r := 10000;
    end;

    if (r < m) and (r < maxDist) then begin
      m := r;
      result := pi;
      found := true;
      break;
    end;
  end;

  if found then exit;

  // for weapons
  for i := 0 to SimWeapons.itemCount - 1 do begin

    pi := SimWeapons.getObject(i);
    if Assigned(pi.Parent) then continue;
    if pi.FreeMe then continue;

    Converter.ConvertToScreen(pi.getPositionX, pi.getPositionY, ptx, pty);

	  try
	    rr := sqr(ptX - ctx) + sqr(ptY - ctY);
	    if  rr = 0 then
	      r := 10000
	    else
	       r := Sqrt(Abs(rr)); //add mamik 29032012
    except
      r := 10000;
    end;

    if (r < m) and (r < maxDist) then
    begin
      m := r;
      result := pi;
      found := true;
      break;
    end;
  end;

  if found then exit;

  // for Non Real Platform
  for I := 0 to simNonRealPlatform.itemCount - 1 do
  begin
    pi := simNonRealPlatform.getObject(i);
    if Assigned(pi.Parent) then
      continue;

    if pi.FreeMe then
      continue;

    Converter.ConvertToScreen(pi.getPositionX, pi.getPositionY, ptx, pty);
	  try
	    rr := sqr(ptX - ctx) + sqr(ptY - ctY);
	    if  rr = 0 then
	      r := 10000
	    else
	       r := Sqrt(Abs(rr));  //add mamik 29032012
    except
      r := 10000;
    end;

    if (r < m) and (r < maxDist) then
    begin
      //m := r;
      result := pi;
      //found := true;
      break;
    end;
  end;
end;

function TT3SimManager.FindNearestTrackExcept(const px, py: double;
      const maxDist: integer ; const id : Integer): TSimObject;
var
    i: Integer;
    pi : TSimObject;
    rr : Integer;
    m, r: double;
    ctx, cty: integer;
    ptx, pty: integer;
    found : boolean;
begin
  Converter.ConvertToScreen(px, py, ctx, cty);
  m := 1000000.0;
  result := nil;
  found := false;

  // for platforms
  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    pi := SimPlatforms.getObject(i);
    if Assigned(pi.Parent) then
      continue;

    if pi.FreeMe then
      continue;
    //if TT3PlatformInstance(pi).InstanceIndex = id then Continue;    //jika exeption continue

    Converter.ConvertToScreen(pi.getPositionX, pi.getPositionY, ptx, pty);
	  try
	    rr := sqr(ptX - ctx) + sqr(ptY - ctY);
	    if  rr = 0 then
	      r := 10000
	    else
	       r := Sqrt(Abs(rr));   //add mamik 29032012
    except
      r := 10000;
    end;

    if (r < m) and (r < maxDist) then
    begin
      m := r;
      result := pi;
      found := true;
      break;
    end;
  end;

  if found then exit;

  // for weapons
  for i := 0 to SimWeapons.itemCount - 1 do
  begin
    pi := SimWeapons.getObject(i);
    if Assigned(pi.Parent) then
      continue;

    if pi.FreeMe then
      continue;

    Converter.ConvertToScreen(pi.getPositionX, pi.getPositionY, ptx, pty);
	  try
	    rr := sqr(ptX - ctx) + sqr(ptY - ctY);
	    if  rr = 0 then
	      r := 10000
	    else
	       r := Sqrt(Abs(rr));  //add mamik 29032012
    except
      r := 10000;
    end;

    if (r < m) and (r < maxDist) then
    begin
      m := r;
      result := pi;
      found := true;
      break;
    end;
  end;

  if found then exit;

  // for Non Real Platform
  for I := 0 to simNonRealPlatform.itemCount - 1 do
  begin
    pi := simNonRealPlatform.getObject(i);
    if Assigned(pi.Parent) then
      continue;

    if pi.FreeMe then
      continue;

    if TT3PlatformInstance(pi).InstanceIndex = id then
      Continue;

    Converter.ConvertToScreen(pi.getPositionX, pi.getPositionY, ptx, pty);
	  try
	    rr := sqr(ptX - ctx) + sqr(ptY - ctY);
	    if  rr = 0 then
	      r := 10000
	    else
	       r := Sqrt(Abs(rr));  //add mamik 29032012
    except
      r := 10000;
    end;

    if (r < m) and (r < maxDist) then
    begin
      //m := r;
      result := pi;
      //found := true;
      break;
    end;
  end;
end;

function TT3SimManager.FindNonRealPlatformByID(const id,
  group: integer): TT3PlatformInstance;
var i, c: Integer;
    pi : TT3PlatformInstance;
    f: boolean;
begin
  f := false;
  I := 0;
  c := simNonRealPlatform.itemCount;
  pi := nil;

  while not f and (i < c) do
  begin
    pi := TT3PlatformInstance(simNonRealPlatform.getObject(i));
    f := (pi.InstanceIndex = id) and (pi.GroupIndex = group);
    inc(i);
  end;

  if f then
    result := pi
  else
    result := nil;
end;

function TT3SimManager.FindMissileByID(const id: integer): TMissile_On_Board;
begin
  Result := nil;
end;

function TT3SimManager.FindWaypointByID(const id: integer): TScripted_Waypoint_Data;
var
  i, c : Integer;
  f : Boolean;
  wp : TScripted_Waypoint_Data;
begin
  f := False;
  i := 0;
  c := Scenario.WaypointListFromDB.Count;
  wp := nil;

  while not f and (i < c) do
  begin
    wp := TScripted_Waypoint_Data(Scenario.WaypointListFromDB[i]);
    f := wp.Waypoint_Index = id;
    inc(i);
  end;

  if f then
    Result := wp
  else
    Result := nil;
end;

function TT3SimManager.FindWeaponByID(const id: Integer): TT3Weapon;
var
  wpn : TT3Weapon;
  f : boolean;
  I, c: Integer;
begin
  f := false;
  I := 0;
  c := simWeapons.itemCount;

  wpn := nil;
  while not f and (i < c) do begin
    wpn := TT3Weapon(simWeapons.getObject(i));
    f := (wpn.InstanceIndex = id);
    inc(i);
  end;

  if f then
    result := wpn
  else
    result := nil;
end;

function TT3SimManager.FindWeaponByIDAndName(const id: Integer;
  const Name: String): TT3Weapon;
var
  wpn : TT3Weapon;
  f : boolean;
  I, c: Integer;
begin
  f := false;
  I := 0;
  c := simWeapons.itemCount;

  wpn := nil;
  while not f and (i < c) do
  begin
    wpn := TT3Weapon(simWeapons.getObject(i));
    f := (wpn.InstanceIndex = id);
    f := f and (wpn.InstanceName = Name);
    inc(i);
  end;

  if f then
    result := wpn
  else
    result := nil;
end;

procedure TT3SimManager.FinishReadyingTime(const r: TRecCmd_Embark_Landing);
var
  aObj : TObject;
  ve   : TT3Vehicle;
  embark : TT3EmbarkedVehicle;
  queueEmb, queueEmbTemp : TQueuedEmbarkedLaunch;
  I, J: Integer;
begin
  embark   := nil;
  queueEmbTemp := nil;

  aObj := FindT3PlatformByID(r.ParentPlatformID);

  if not(aObj is TT3Vehicle) then Exit;

  ve := TT3Vehicle(aObj);

  if ve.EmbarkedVehicles.Count <= 0 then Exit;

  for I := 0 to ve.EmbarkedVehicles.Count - 1 do
  begin
    embark := ve.EmbarkedVehicles.Items[I];

    if embark = nil then Continue;
    if embark.IndexEmbark <> r.IndexEmbark then Continue;
    if embark.getQueueLandCount <= 0 then Exit;

    for J := embark.getQueueLandCount - 1 downto 0 do
    begin
      queueEmb := embark.getQueueLandItem(J);
      if queueEmb = nil then Continue;

      if queueEmb.QueueNumber = r.IndexLanding then
      begin
        queueEmbTemp := queueEmb;
        Break;
      end;
    end;

    if queueEmbTemp <> nil then
      Break;
  end;

  embark.removeQueueLandItem(queueEmbTemp);
  embark.Quantity := embark.Quantity + 1;
end;

function TT3SimManager.InitiateEmbarkPlatform(var rec: TRecCmd_Embark): boolean;
var
  papi : TT3Vehicle;
  aObj : TObject;
  pi, pi2 : TPlatform_Instance;
  hostPlatform : TT3EmbarkedVehicle;
  I: Integer;
  TrckID : AnsiString;
begin
  result := false;

  aObj := FindT3PlatformByID(rec.ParentPlatformID);
  if not (aObj is TT3Vehicle) then exit;

  papi          := TT3Vehicle(aObj);
  if (rec.Hosted_Index < 0)
  or (rec.Hosted_Index >= papi.EmbarkedVehicles.Count) then exit;

  hostPlatform  := TT3EmbarkedVehicle(papi.EmbarkedVehicles.Items[rec.Hosted_Index]);

  pi := CreatePlatformInstanceRP(1, hostPlatform.EmbarkedVehicle.Hosted_Vehicle_Index, 0);

//  if hostPlatform.IsAfterLanding then
//    Exit;
  if Assigned(pi) then
  begin
    rec.Quantity_Group_Personal := pi.Vehicle.FData.Quantity_Group_Personal;
    StrToChar(pi.Vehicle.FData.Vehicle_Identifier, rec.nameClass);
    StrToChar(pi.FData.Instance_Name, rec.namePlatform);
    StrToChar(pi.Vehicle.FData.VBS_Class_Name, rec.VBSClassName);

    rec.IDPlatformName := pi.FData.Instance_Ident_Index;
    rec.IDPlatformClass := pi.FData.Vehicle_Index;

    CopyArrayToStr(rec.TrackIdent, TrckID);

    if rec.EmbarkPlatformID = 0 then
    begin
      rec.EmbarkPlatformID := GetSerialPlatformID;
    end;

    if hostPlatform.TempReadying = -1 then
      result := hostPlatform.AddQueue(rec.InitSpeed,rec.InitCourse,TrckID,
                rec.LaunchName, pi.Vehicle.FData.Alert_State_Time, rec.EmbarkPlatformID)//.Readying_Time)
    else
      result := hostPlatform.AddQueue(rec.InitSpeed,rec.InitCourse,TrckID,
                rec.LaunchName, hostPlatform.TempReadying, rec.EmbarkPlatformID);

    for I := FScenario.PlatformInstanceListFromDB.Count - 1 downto 0 do
    begin
      pi2 := FScenario.PlatformInstanceListFromDB.Items[i];

      if pi2.Vehicle.FData.Vehicle_Index =  pi.Vehicle.FData.Vehicle_Index then
      begin
        pi.Free;
        FScenario.PlatformInstanceListFromDB.Delete(i);
        Break;
      end;
    end;
  end;
end;

procedure TT3SimManager.InitNetwork;
begin
  // some of register packet
end;


function TT3SimManager.IsGameStart: Boolean;
begin
  if FGameState = gsPlaying then
    Result := True
  else
    Result := False;
end;

procedure TT3SimManager.StopNetwork;
begin
 // unregister all packet
end;

procedure TT3SimManager.SyncObject(recSynv: TRecSyncPos);
var
  i, idx : integer;
  p   : TT3PlatformInstance;
begin
  for I := 0 to Length(recSynv.InstanceIndexes) - 1 do
  begin
    idx := recSynv.InstanceIndexes[i];

    if idx = -1 then
      Break;

    p := FindT3PlatformByID(idx);
    if not Assigned(p) then
      p := FindNonRealPlatformByID(idx);

    // update obj state
    with recSynv.PositionPoints[i] do
    begin
      p.PosX := FPosX;
      p.PosY := FPosY;
      p.PosZ := FPosZ;
      p.DormantTime := FDormantTime;
      p.Dormant := FDormant;
      p.Speed := FSpeed;
      p.GroundSpeed := FGroundSpeed;
      p.Heading := FHeading;
      p.Course := FCourse;
      p.Health := FHealth;

    end;
  end;

end;

procedure TT3SimManager.netRecv_platform_cmd(apRec: PAnsiChar; aSize: Word);
var
  rec : ^TRecCmd_Platform;
  p   : TT3PlatformInstance;
  vShadow, vEvasion, vEngage, vOutRun, vCircle, vStation : TT3PlatformInstance;
  tmp : TRecPlatform_Activation;
begin
  rec := @apRec^;

  p := FindT3PlatformByID(rec^.PlatfomID);

  if not Assigned(p) then
    p := FindNonRealPlatformByID(rec^.PlatfomID);

  if not Assigned(p) then
    Exit;

  if p is TT3Vehicle then begin
    rec^.TurnRate := TT3Vehicle(p).UnitMotion.FData.Standard_Turn_Rate;
    rec^.IDPlatformClass := TT3Vehicle(p).FPIData.Vehicle_Index;
    rec^.VDomain := TT3Vehicle(p).PlatformDomain;
  end;


  case rec^.OrderID of
    CORD_ID_MOVE :
    begin
      case rec^.OrderType of
        CORD_TYPE_SPEED :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).OrderedSpeed := rec^.OrderParam;
            TT3Vehicle(p).WaypointLastSpeed := rec^.OrderParam;
            TT3Vehicle(p).TempSpeed := rec^.OrderParam;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
          if p is TT3Torpedo then
          begin
            if rec^.OrderParam = 0 then
              TT3Torpedo(p).OnGrounded := True;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_SET_HEADING :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).OrderedHeading := rec^.OrderParam;
            TT3Vehicle(p).Heading := rec^.OrderParam;
          end;
        end;
        CORD_TYPE_COURSE :
        begin
          if p is TT3NonRealVehicle then
          begin
            if TT3NonRealVehicle(p).NRPType = nrpBearing then
            begin
//              TT3NonRealVehicle(p).LineVisual.Bearing := rec^.OrderParam;
              TT3NonRealVehicle(p).OrderedHeading := rec^.OrderParam;
            end
            else
            begin
              TT3Vehicle(p).OrderedHeading := rec^.OrderParam;
              TT3Vehicle(p).FirstHeading   := rec^.OrderParam;
              TT3Vehicle(p).HelmDegree     := rec^.OrderParam;
              TT3Vehicle(p).EvasionDegree  := rec^.OrderParam;
              TT3Vehicle(p).CircleDirection:= rec^.OrderParam;
              TT3Vehicle(p).OrderedZigzag  := rec^.OrderParam;
              TT3Vehicle(p).OrderedSinuation := rec^.OrderParam;

            end;
          end
          else if p is TT3Vehicle then
          begin
            TT3Vehicle(p).OrderedHeading := rec^.OrderParam;
            TT3Vehicle(p).FirstHeading   := rec^.OrderParam;
            TT3Vehicle(p).HelmDegree     := rec^.OrderParam;
            TT3Vehicle(p).EvasionDegree  := rec^.OrderParam;
            TT3Vehicle(p).CircleDirection:= rec^.OrderParam;
            TT3Vehicle(p).OrderedZigzag  := rec^.OrderParam;
            TT3Vehicle(p).OrderedSinuation := rec^.OrderParam;
            TT3Vehicle(p).tempHeading := rec^.OrderParam;
          end
          else if p is TT3Torpedo then
          begin
            if (TT3Torpedo(p).WeaponCategory = wcTorpedoWireGuided) then
            begin
              if not(TT3Torpedo(p).WireBreak) then
              begin
                TT3Torpedo(p).OrderedHeading := rec^.OrderParam;
                TT3Torpedo(p).IsInittialGuidance := False;
              end;
            end;
          end;

          TT3Vehicle(p).Circle_state := 1;

          EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
              rec^.PlatfomID, rec^.OrderParam);
        end;
        CORD_TYPE_ALTITUDE :
        begin
          if p is TT3Vehicle then
          begin
            if rec^.DiveMode <> 3 then
            begin
              if rec^.OrderParam > TT3Vehicle(p).OrderedAltitude then
                rec^.DiveMode := 1    //dive mode
              else if rec^.OrderParam < TT3Vehicle(p).OrderedAltitude then
                rec^.DiveMode := 2;   // to survace mode

              TT3Vehicle(p).OrderedAltitude := rec^.OrderParam;

              EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                  rec^.PlatfomID, rec^.OrderParam);
            end;
          end
          else if p is TT3Torpedo then
          begin
            if (TT3Torpedo(p).WeaponCategory = wcTorpedoWireGuided) then
            begin
              if not(TT3Torpedo(p).WireBreak) then
              begin
                TT3Torpedo(p).OrderedAltitude := rec^.OrderParam;
                TT3Torpedo(p).IsInittialGuidance := False;
              end;
            end;
          end
          else
          begin
            TT3Sonobuoy(p).OrderDepth := rec^.OrderParam;
          end;
        end;
        CORD_TYPE_CIRCLE_MODE :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).Circle_mode := Round(rec^.OrderParam);
            TT3Vehicle(p).Circle_state := 1;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_CIRCLE_CENTER_X :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).CenterCirclePointX := rec^.OrderParam;
            TT3Vehicle(p).Circle_state := 1;
            TT3Vehicle(p).Circle_mode := 1;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_CIRCLE_CENTER_Y :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).CenterCirclePointY := rec^.OrderParam;
            TT3Vehicle(p).Circle_state := 1;
            TT3Vehicle(p).Circle_mode := 1;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_CIRCLE_RADIUS :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).CircleRadius := rec^.OrderParam;
            TT3Vehicle(p).Circle_state := 1;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_CIRCLE_BEARING :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).CircleBearing := rec^.OrderParam;
            TT3Vehicle(p).Circle_state := 1;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_CIRCLE_BEARING_STATE :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).Circle_bearing_state := Round(rec^.OrderParam);
            TT3Vehicle(p).Circle_state := 1;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_CIRCLE_RANGE :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).CircleRange := rec^.OrderParam;
            TT3Vehicle(p).Circle_state := 1;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                   rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_CIRCLE_TRACK :
        begin
          if p is TT3Vehicle then
          begin
            vCircle := FindT3PlatformByID(Round(rec^.OrderParam));

            if not Assigned(vCircle) then
              vCircle := FindNonRealPlatformByID(Round(rec^.OrderParam));

            TT3Vehicle(p).CircleTrack := vCircle;
            TT3Vehicle(p).Circle_state := 1;
            TT3Vehicle(p).Circle_mode := 2;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                   rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_SHADOW_TRACK :
        begin
          if p is TT3Vehicle then
          begin
            vShadow := FindT3PlatformByID(Round(rec^.OrderParam));
            TT3Vehicle(p).ShadowedVehicle := vShadow;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                  rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_SHADOW_DISTANCE :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).ShadowDistance := rec^.OrderParam;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                  rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_ZIGZAG_AMPLITUDO :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).AmplitudoZigzag := rec^.OrderParam;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                  rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_ZIGZAG_PERIOD :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).PeriodZigzag := rec^.OrderParam;
            EventManager.OnPlatformOrderedControlChange(rec^.OrderID,rec^.OrderType,rec^.PlatfomID,rec^.OrderParam);
          end;
        end;
        CORD_TYPE_EVASION_TRACK :
        begin
          if p is TT3Vehicle then
          begin
            vEvasion := FindT3PlatformByID(Round(rec^.OrderParam));
            TT3Vehicle(p).EvasionVehicle := vEvasion;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                 rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_OUTRUN_TRACK :
        begin
          if p is TT3Vehicle then
          begin
            vOutRun := FindT3PlatformByID(Round(rec^.OrderParam));
            TT3Vehicle(p).OutRunVehicle := vOutRun;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                 rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_ENGAGE_TRACK :
        begin
          if p is TT3Vehicle then
          begin
            vEngage := FindT3PlatformByID(Round(rec^.OrderParam));

            TT3Vehicle(p).EngageVehicle := vEngage;
            TT3Vehicle(p).isEngagementRangeReached := False;
            TT3Vehicle(p).isEngagementWeaponFire := False;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                 rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_ENGAGE_DISTANCE :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).EngageDistance := rec^.OrderParam;
            TT3Vehicle(p).isEngagementRangeReached := False;
            TT3Vehicle(p).isEngagementWeaponFire := False;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_RTB_BASEVEHICLE :
        begin
          if p is TT3Vehicle then
          begin
            vShadow := FindT3PlatformByID(Round(rec^.OrderParam));

            if Assigned(vShadow) then
            begin
              TT3Vehicle(p).BaseVehicle := vShadow;

              EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                   rec^.PlatfomID, rec^.OrderParam);
            end;
          end;
        end;
        CORD_TYPE_SINUATION_AMPLITUDO :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).AmplitudoSinuation := rec^.OrderParam;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                 rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_SINUATION_PERIOD :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).PeriodSinuation := rec^.OrderParam;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                 rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_STATION_MODE:
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).StationMode := Round(rec^.OrderParam);

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_STATION_CENTER_X:
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).StationPostX := rec^.OrderParam;
            TT3Vehicle(p).StationMode := 1;
            TT3Vehicle(p).IsStationSpeedSet := False;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_STATION_CENTER_Y:
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).StationPostY := rec^.OrderParam;
            TT3Vehicle(p).StationMode := 1;
            TT3Vehicle(p).IsStationSpeedSet := False;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_STATION_TRACK:
        begin
          if p is TT3Vehicle then
          begin
            vStation := FindT3PlatformByID(Round(rec^.OrderParam));

            if not Assigned(vStation) then
              vStation := FindNonRealPlatformByID(Round(rec^.OrderParam));

            TT3Vehicle(p).StationTrack := vStation;
            TT3Vehicle(p).StationMode := 2;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_STATION_BEARING:
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).StationBearing := rec^.OrderParam;
            TT3Vehicle(p).StationMode := 2;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
               rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_STATION_BEARING_STATE:
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).StationBearing_state := Round(rec^.OrderParam);
            TT3Vehicle(p).StationMode := 2;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
              rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_STATION_RANGE :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).StationRange := rec^.OrderParam;
            TT3Vehicle(p).StationMode := 2;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
               rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_STATION_DRIFT:
        begin
          if p is TT3Vehicle then
          begin
            case Round(rec^.OrderParam) of
              0: TT3Vehicle(p).StationDrift := False;
              1: TT3Vehicle(p).StationDrift := True;
            end;

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
                rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_SETFORMATION:
        begin
          if p is TT3Vehicle then
          begin
         { TODO : comment dulu }
//            if rec^.OrderParam = 1 then
//              LoadFormation(TT3Vehicle(p),  1)
//            else if rec^.OrderParam = 0 then
//              LoadFormation(TT3Vehicle(p),  0);

            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
               rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        {CORD_TYPE_STATION_STOP:
        begin
          if p is TT3Vehicle then
          begin
            case Round(rec^.OrderParam) of
              0: TT3Vehicle(p).StationStopStatus := False;
              1: TT3Vehicle(p).StationStopStatus := True;
            end;

            //EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
               //rec^.PlatfomID, rec^.OrderParam);
          end;
        end;}
        CORD_TYPE_PERSONEL_FORMATION:
        begin
          if p is TT3Vehicle then
          begin
            EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
               rec^.PlatfomID, rec^.OrderParam);
          end;
        end;
        CORD_TYPE_SETCOLLISION :
        begin
          if p is TT3Vehicle then
          begin
            if rec^.OrderParam = 1 then
            begin
              TT3Vehicle(p).isCollision := True;
              TT3Vehicle(p).OrderedSpeed := 0;
              TT3Vehicle(p).Speed := 0;
            end
            else
              TT3Vehicle(p).isCollision := False;
          end;
        end;
        CORD_SPEED_FORMATION :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).OrderedSpeed := rec^.OrderParam ;
            TT3Vehicle(p).Speed := rec^.OrderParam ;
            TT3Vehicle(p).TempSpeed := rec^.OrderParam ;
          end;
        end;
        CORD_HEADING_FORMATION :
        begin
          if p is TT3Vehicle then
          begin
            TT3Vehicle(p).OrderedHeading := rec^.OrderParam ;
            TT3Vehicle(p).Heading := rec^.OrderParam ;
            TT3Vehicle(p).TempHeading := rec^.OrderParam ;
          end;
        end;
      end;
    end;
    CORD_ID_ACTIVATION :
    begin
      tmp := p.UnitActivation;
      tmp.Init_Guidance_Type := rec^.OrderType;
      p.UnitActivation := tmp;

      if rec^.OrderType <> Byte(vgtWaypoint) then
        TT3Vehicle(p).Waypoints.Clear;

      // release dari formasi jika selain vgtformation
      if rec^.OrderType <> Byte(vgtFormation) then
        with TT3Vehicle(p) do
          if not isFormationLeader then
          begin
            // ryu : di comment karena g boleh ilang dari daftar formasi
            //Scenario.Formation_List_rev.RemoveFormationMember(
            //  Scenario.Formation_List_rev.FormationByName(FormationName),
            //  InstanceIndex);

            // set formation move moce to false;
            FormationModeActive := False;
          end;

      case rec^.OrderType of
        Byte(vgtStraightLine)  : TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtStraightLine;
        Byte(vgtHelm)          : TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtHelm;
        Byte(vgtCircle)        :
        begin
          TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtCircle;
          TT3Vehicle(p).Circle_state := 1;
          TT3Vehicle(p).CircleDirection := 90;
          TT3Vehicle(p).Circle_mode := 1;
          TT3Vehicle(p).Circle_bearing_state := 1;
        end;
        Byte(vgtZigzag)   :
        begin
          TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtZigzag;

          TT3Vehicle(p).isFirstZigzag := True;
          TT3Vehicle(p).isLeftZigzag  := True;
          TT3Vehicle(p).isStartZigzag := False;
          TT3Vehicle(p).isRightZigzag := False;

          if rec^.OrderParam = 1 then
            TT3Vehicle(p).SetZigzagMovementShort
          else
          if rec^.OrderParam = 2 then
            TT3Vehicle(p).SetZigzagMovementLong
          else
          if rec^.OrderParam = 3 then
            TT3Vehicle(p).SetZigzagMovementVeryLong;

          EventManager.OnPlatformOrderedControlChange(rec^.OrderID,rec^.OrderType,rec^.PlatfomID,rec^.OrderParam);
        end;
        Byte(vgtSinuation) :
        begin
          TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtSinuation;
          TT3Vehicle(p).isFirstSinuation := True;
          TT3Vehicle(p).isLeftSinuation  := True;
          TT3Vehicle(p).isStartSinuation := False;
          TT3Vehicle(p).isRightSinuation := False;

          TT3Vehicle(p).SetSinuationMovement;
        end;

        Byte(vgtEvasion)  : TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtEvasion;
        Byte(vgtWaypoint) :
        begin
          TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtWaypoint;
          TT3Vehicle(p).DelayUpdateWaypoint := vGameDataSetting.DelaySendData;
          TT3Vehicle(p).CounterUpdateWaypoint := 0;
        end;
        Byte(vgtOutrun)     : TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtOutrun;
        Byte(vgtEngagement) : TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtEngagement;
        Byte(vgtShadow) : TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtShadow;
        Byte(vgtReturnToBase) : TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtReturnToBase;
        Byte(vgtFormation) :
        begin
          // tidak perlu diset jika sebagai leader, tapi smua member jadi vgt formation
          if not TT3Vehicle(p).isFormationLeader then
            TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtFormation
          else
          begin
            TT3Vehicle(p).FormationModeActive := True;
            Scenario.Formation_List_rev.ActivateFormationByLeader(TT3Vehicle(p).InstanceIndex);
          end;

        end;
        Byte(vgtStation)  :
        begin
          TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtStation;
          TT3Vehicle(p).StationMode := 1;
          TT3Vehicle(p).StationBearing_state := 1;
          TT3Vehicle(p).StationDrift  := False;
        end;

        Byte(vgtPersonelGuidance)  :
        begin
          TVehicle_Definition(p.UnitDefinition).GuidanceType := vgtPersonelGuidance;
        end;
      end;

      EventManager.OnPlatformOrderedControlChange(rec^.OrderID, rec^.OrderType,
        rec^.PlatfomID, rec^.OrderParam);
    end;
  end;
end;

procedure TT3SimManager.netRecv_Platform_PersonelMove(apRec: PAnsiChar;
  aSize: Word);
var
  rec : ^TRec_Personel_Move;
  p   : TT3PlatformInstance;
begin
  rec := @apRec^;

  p := FindT3PlatformByID(rec^.PlatformID);

  if not Assigned(p) then
    p := FindT3PlatformByID(rec^.PlatformID);

  if not Assigned(p) then
    Exit;

  if p is TT3Vehicle then
  begin
    if TT3Vehicle(p).PlatformDomain = vhdGrpPersonel then
    begin
      TT3Vehicle(p).InstanceIndex     := rec^.PlatformID;
      TT3Vehicle(p).OrderedHeading    := rec^.Heading;
      TT3Vehicle(p).MoveMode          := rec^.MoveType;
      TT3Vehicle(p).FormationMode     := rec^.FormationType;
    end;
  end;
end;

procedure TT3SimManager.netRecv_ECMCommand(apRec: PAnsiChar; aSize: word);
var
  rec : ^TRecECMCommand;
  jammerObject, jammerOwner : TObject;
begin
  rec := @apRec^;

  if rec^.SessionID <> FSessionID then
    Exit;

  case rec.OrderID of
    CORD_ID_SD_SETMODE,
    CORD_ID_SD_SETMANMODE,
    CORD_ID_SD_SETSPOTNUMBER,
    CORD_ID_SD_SETBEARING,
    CORD_ID_SD_SETTRACK :
      begin
        jammerObject := nil;

        jammerOwner := FindT3PlatformByID(rec.JammerObjectOwnerID);
        if Assigned(jammerOwner) then
          jammerObject := FindT3DeviceByID(TT3DefensiveJammerOnVehicle,
                          TSimObject(jammerOwner),rec.JammerObjectID );

        if not Assigned(jammerObject) then
          Exit;

        with TT3DefensiveJammerOnVehicle(jammerObject) do
        begin
          {0:off, 1:manual; 2:auto}
          case rec^.Mode of
            0 : Status := esOff;
            1 : Status := esManual;
            2 : Status := esAutomatic;
          end;

          {0:track; 1:spot}
          case rec^.ManualTgtType of
            0 : Targeting := ettTrack;
            1 : Targeting := ettSpot;
          end;

          SpotNumber  := rec^.SpotNumber;
          Bearing     := rec^.Bearing;

          {set target index for manual by track mode}
          case Byte(rec^.JammedObjectType) of
            Byte(jotMissile) : TargetIndex := rec^.JammedObjectID;
            Byte(jotFCR)     : TargetIndex := rec^.JammedObjectOwnerID;
          end;
        end;
      end;
  end;
end;

procedure TT3SimManager.netRecv_EngageTrack(apRec: PAnsiChar; aSize: Word);
var rec : ^TRecCmd_EngageTrack;
begin
  rec := @apRec^;
  EventManager.onEngageTrack(rec^.Track);
end;

function TT3SimManager.CreateGroupVehicle(rec : TRecCmdMultiMode):
  T3GroupVehicle;
var
  p: TT3PlatformInstance;
  i, j : Integer;
  aObj : TObject;
  aObj1 : T3GroupVehicle;
  str : AnsiString;
begin
  Result := nil;
  if rec.aAction = C_ADD then //add
  begin
    aObj1 := T3GroupVehicle.Create;

    aObj1.CubicleGroupID := rec.CubicleGroup;
    CopyArrayToStr(rec.GroupName, str);
    aObj1.GroupName := str;

    aObj1.GroupID := rec.GroupID;

    for j := 0 to rec.CountVehicle - 1 do
    begin
      p := FindT3PlatformByID(rec.PlatformID[j]);

      if not Assigned(p) then
        p := FindNonRealPlatformByID(rec.PlatformID[j]);
      if p <> nil then
      begin
        if p is TT3Vehicle then
          (p as TT3Vehicle).IsGrouped := True;

        if Assigned(ListPlatformSelect) then
          aObj1.AddVehicle(p);
      end;
    end;

    ListPlatformSelect.Add(aObj1);
    EventManager.OnUpdateGroupControl(aObj1, rec.aAction);
    Result := aObj1;
  end
  else if rec.aAction = C_DELETE  then
  begin

    if ListPlatformSelect.Count > 0 then
    begin
      for i := ListPlatformSelect.Count - 1 downto 0 do
      begin
        aObj1 := ListPlatformSelect.Items[i];
        if aObj1.GroupID = rec.GroupID then
        begin
          EventManager.OnUpdateGroupControl(aObj1, rec.aAction);
          aObj1.DeleteList;
          ListPlatformSelect.Delete(i);
          Break;
        end;
      end;
    end;
  end
  else if rec.aAction = C_MOVE then
  begin
    if ListPlatformSelect.Count > 0 then
    begin
      for i := ListPlatformSelect.Count - 1 downto 0 do
      begin
        aObj1 := ListPlatformSelect.Items[i];
        if aObj1.GroupID = rec.GroupID then
        begin
          aObj1.Reposition(rec.X, rec.Y);
          Result := aObj1;
          Break;
        end;
      end;
    end;
  end
  else if rec.aAction = C_SPEED then
  begin
    if ListPlatformSelect.Count > 0 then
    begin
      for i := ListPlatformSelect.Count - 1 downto 0 do
      begin
        aObj1 := ListPlatformSelect.Items[i];
        if aObj1.GroupID = rec.GroupID then
        begin
          aObj1.Speed := rec.Param;
          EventManager.OnUpdateGroupControl(aObj1, rec.aAction);
          Result := aObj1;
          Break;
        end;
      end;
    end;
  end
  else if rec.aAction = C_COURSE then
  begin
    if ListPlatformSelect.Count > 0 then
    begin
      for i := ListPlatformSelect.Count - 1 downto 0 do
      begin
        aObj1 := ListPlatformSelect.Items[i];
        if aObj1.GroupID = rec.GroupID then
        begin
          aObj1.Course := rec.Param;
          EventManager.OnUpdateGroupControl(aObj1, rec.aAction);
          Result := aObj1;
          Break;
        end;
      end;
    end;
  end
  else if rec.aAction = C_HEADING then
  begin
    if ListPlatformSelect.Count > 0 then
    begin
      for i := ListPlatformSelect.Count - 1 downto 0 do
      begin
        aObj1 := ListPlatformSelect.Items[i];
        if aObj1.GroupID = rec.GroupID then
        begin
          aObj1.Heading := rec.Param;
          Result := aObj1;
          Break;
        end;
      end;
    end;
  end;
end;

procedure TT3SimManager.netRecv_SetLauncherQty(apRec: PAnsiChar; aSize: Word);
var
  rec : ^TRecCmd_Set_LauncherQty;
  p   : TT3PlatformInstance;
  ve  : TT3Vehicle;
  wpn : TT3Weapon;
  mov : TT3MissilesOnVehicle;
  tov : TT3TorpedoesOnVehicle;
  launcher : TFitted_Weap_Launcher_On_Board;
  i, j, qty : Integer;
begin
  rec := @apRec^;

  p   := FindT3PlatformByID(rec^.PlatfomID);
  if  (p = nil) then Exit;

  ve := TT3Vehicle(p);

  qty := round(rec^.OrderQuantity);

  for i := 0 to ve.Weapons.Count - 1 do
  begin
    wpn := TT3Weapon(ve.Weapons.Items[i]);

    if (wpn is TT3MissilesOnVehicle) then
    begin
      mov := TT3MissilesOnVehicle(wpn);

      if mov.InstanceIndex = rec^.WeaponID then
      begin
        for j := 0 to mov.MissileDefinition.FLaunchs.Count - 1 do
        begin
          launcher := mov.MissileDefinition.FLaunchs.Items[j];

          if launcher.FData.Launcher_Type = rec^.LauncherID then
          begin
            launcher.FData.Launcher_Qty := qty;
            // trigger listener when launcher quantity change
            mov.TriggerLauncherListener(launcher,qty);
            Break;
          end;
        end;
      end;
    end
    else if (wpn is TT3TorpedoesOnVehicle) then
    begin
      tov := TT3TorpedoesOnVehicle(wpn);

      if tov.InstanceIndex = rec^.WeaponID then
      begin
        for j := 0 to tov.TorpedoDefinition.FLaunchs.Count - 1 do
        begin
          launcher := tov.TorpedoDefinition.FLaunchs.Items[j];

          if launcher.FData.Launcher_Type = rec^.LauncherID then
          begin
            launcher.FData.Launcher_Qty := qty;
            // trigger listener when launcher quantity change
            tov.TriggerLauncherListener(launcher,qty);
            Break;
          end;
        end;
      end;
    end;
  end;
end;

procedure TT3SimManager.netRecv_SetQuantity(apRec: PAnsiChar; aSize: Word);
var
  rec          : ^TRecCmd_Set_Quantity;
  p            : TT3PlatformInstance;
  ve           : TT3Vehicle;
  hostPlatform : TT3EmbarkedVehicle;
  wpn          : TT3Weapon;
  I  : Integer;
begin
  rec := @apRec^;
  // if rec^.SessionID <>  FGameSession.SessionID  then Exit;
  //ve := TT3Vehicle.Create;
  p   := FindT3PlatformByID(rec^.PlatfomID);
  if  (p = nil) then Exit;
    ve := TT3Vehicle(p);

  case rec.OrderType of
    CORD_TYPE_WEAPON :
    begin

      for I := 0 to ve.Weapons.Count - 1 do
      begin
        wpn := TT3Weapon(ve.Weapons.Items[i]);
        //GUN
        if (wpn is TT3GunOnVehicle) then begin
          //if TT3GunOnVehicle(ve.Weapons.Items[i]).GunDefinition.FPoint.FData.Point_Effect_Index = rec^.IDUnit then
          if TT3GunOnVehicle(ve.Weapons.Items[i]).InstanceIndex = rec^.IDUnit then
          begin
            TT3GunOnVehicle(ve.Weapons.Items[i]).Quantity := round(rec^.OrderQuantity);
          end;
        end
        //MISSILE
        else if (wpn is TT3MissilesOnVehicle) then begin
          if TT3MissilesOnVehicle(ve.Weapons.Items[i]).InstanceIndex = rec^.IDUnit then
          begin
            TT3MissilesOnVehicle(ve.Weapons.Items[i]).Quantity := round(rec^.OrderQuantity);
          end;
        end
        //TORPEDO
        else if (wpn is TT3TorpedoesOnVehicle) then begin
          if TT3TorpedoesOnVehicle(ve.Weapons.Items[i]).InstanceIndex = rec^.IDUnit then
          begin
            TT3TorpedoesOnVehicle(ve.Weapons.Items[i]).Quantity := round(rec^.OrderQuantity);
          end;
        end
        //BOMB
        else if (wpn is TT3BombONVehicle) then begin
          if TT3BombONVehicle(ve.Weapons.Items[i]).InstanceIndex = rec^.IDUnit then
          begin
            TT3BombONVehicle(ve.Weapons.Items[i]).Quantity := round(rec^.OrderQuantity);
          end;
        end
        //MINE
        else if (wpn is TT3MineOnVehicle) then begin
          if TT3MineOnVehicle(ve.Weapons.Items[i]).InstanceIndex = rec^.IDUnit then
          begin
            TT3MineOnVehicle(ve.Weapons.Items[i]).Quantity := round(rec^.OrderQuantity);
          end;
        end
        //Hybrid
        else if (wpn is TT3HybridOnVehicle) then begin
          if TT3HybridOnVehicle(ve.Weapons.Items[i]).InstanceIndex = rec^.IDUnit then
          begin
            TT3HybridOnVehicle(ve.Weapons.Items[i]).Quantity := round(rec^.OrderQuantity);
          end;
        end;
      end;
    end;
    CORD_TYPE_COUNTERMEASURE :
	  begin

    end;
    CORD_TYPE_EMBARK :
	  begin
      for I := 0 to ve.EmbarkedVehicles.Count - 1 do
      begin
        hostPlatform := ve.EmbarkedVehicles.Items[i];
        case rec^.OrderID of
          CORD_ID_QUANTITY :
          begin
            if hostPlatform.EmbarkedVehicle.Hosted_Vehicle_Index = rec^.IDUnit then
            begin
              hostPlatform.Quantity := rec.OrderQuantity;
            end;
          end;
          CORD_ID_READYING_TIME :
          begin
            if hostPlatform.EmbarkedVehicle.Hosted_Vehicle_Index = rec^.IDUnit then
            begin
              hostPlatform.TempReadying := rec.OrderQuantity;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TT3SimManager.netRecv_SetStatus(apRec: PAnsiChar; aSize: Word);
var
  rec          : ^TRecCmd_Set_Status;
  p            : TT3PlatformInstance;
  ve           : TT3Vehicle;
  hostPlatform : TT3EmbarkedVehicle;
  wpn          : TT3Weapon;
  I            : Integer;
  stats        : Byte;
begin
  rec := @apRec^;

  p   := FindT3PlatformByID(rec^.PlatfomID);
  if  (p = nil) then Exit;
    ve := TT3Vehicle(p);

  case rec.OrderType of
    CORD_TYPE_WEAPON : 
	begin
      for I := 0 to ve.Weapons.Count - 1 do
      begin
        wpn := TT3Weapon(ve.Weapons.Items[i]);
        //GUN
        if (wpn is TT3GunOnVehicle) then begin
          //if TT3GunOnVehicle(ve.Weapons.Items[i]).GunDefinition.FPoint.FData.Point_Effect_Index = rec^.IDUnit then
          if TT3GunOnVehicle(ve.Weapons.Items[i]).InstanceIndex = rec^.IDUnit then
          begin
            stats := rec^.OrderStatus;
            case stats of
              0 : TT3GunOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsAvailable;
              1 : TT3GunOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsUnavailable;
              2 : TT3GunOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsDamaged;
              3 : TT3GunOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsTooHigh;
            end;
          end;
        end
        //MISSILE
        else if (wpn is TT3MissilesOnVehicle) then begin
          if TT3MissilesOnVehicle(ve.Weapons.Items[i]).InstanceIndex = rec^.IDUnit then
          begin
            stats := rec^.OrderStatus;
            case stats of
              0 : TT3MissilesOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsAvailable;
              1 : TT3MissilesOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsUnavailable;
              2 : TT3MissilesOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsDamaged;
              3 : TT3MissilesOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsTooHigh;
            end;
          end;
        end
        //TORPEDO
        else if (wpn is TT3TorpedoesOnVehicle) then begin
          if TT3TorpedoesOnVehicle(ve.Weapons.Items[i]).InstanceIndex = rec^.IDUnit then
          begin
            stats := rec^.OrderStatus;
            case stats of
              0 : TT3TorpedoesOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsAvailable;
              1 : TT3TorpedoesOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsUnavailable;
              2 : TT3TorpedoesOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsDamaged;
              3 : TT3TorpedoesOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsTooHigh;
            end;
          end;
        end
        //BOMB
        else if (wpn is TT3BombONVehicle) then begin
          if TT3BombONVehicle(ve.Weapons.Items[i]).InstanceIndex = rec^.IDUnit then
          begin
            stats := rec^.OrderStatus;
            case stats of
              0 : TT3BombONVehicle(ve.Weapons.Items[i]).WeaponStatus := wsAvailable;
              1 : TT3BombONVehicle(ve.Weapons.Items[i]).WeaponStatus := wsUnavailable;
              2 : TT3BombONVehicle(ve.Weapons.Items[i]).WeaponStatus := wsDamaged;
              3 : TT3BombONVehicle(ve.Weapons.Items[i]).WeaponStatus := wsTooHigh;
            end;
          end;
        end
        //MINE
        else if (wpn is TT3MineOnVehicle) then begin
          if TT3MineOnVehicle(ve.Weapons.Items[i]).InstanceIndex = rec^.IDUnit then
          begin
            stats := rec^.OrderStatus;
            case stats of
              0 : TT3MineOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsAvailable;
              1 : TT3MineOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsUnavailable;
              2 : TT3MineOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsDamaged;
              3 : TT3MineOnVehicle(ve.Weapons.Items[i]).WeaponStatus := wsTooHigh;
            end;
          end;
        end;
      end;
    end;
    CORD_TYPE_COUNTERMEASURE :
	begin
    end;
    CORD_TYPE_EMBARK :
	begin
      for I := 0 to ve.EmbarkedVehicles.Count - 1 do
      begin
        hostPlatform := ve.EmbarkedVehicles.Items[i];
        case rec^.OrderID of
          CORD_ID_QUANTITY :
          begin
            if hostPlatform.EmbarkedVehicle.Hosted_Vehicle_Index = rec^.IDUnit then
            begin
//              hostPlatform.Quantity := rec.OrderQuantity;
            end;
          end;
          CORD_ID_READYING_TIME :
          begin
            if hostPlatform.EmbarkedVehicle.Hosted_Vehicle_Index = rec^.IDUnit then
            begin
//              hostPlatform.TempReadying := rec.OrderQuantity;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TT3SimManager.FireControlCommand(r: TRecCmd_FC);
var
  objParentPlatform: TSimObject;
  objPlatform: TSimObject;
  radar: TT3Radar;
  i : integer;
  tempPlatform: TT3PlatformInstance;
  isExist: Boolean;
begin
  if (r.SessionID <> SessionID) then
    Exit;

  objParentPlatform := FindT3PlatformByID(r.PlatformParentID);
  if not Assigned(objParentPlatform) then
    Exit;

  radar := nil;
  if objParentPlatform is TT3Vehicle then
  begin
    radar := TT3Vehicle(objParentPlatform).getDevice(r.FCRadarID, TT3Radar) as TT3Radar;
  end;

  objPlatform := FindT3PlatformByID(r.PlatformID);
  if not Assigned(objPlatform) then
    Exit;

  if Assigned(radar) then
  begin
    case r.OrderID of
      CORD_FC_BREAKALL:
        begin
          if radar.AssignedTrack <> nil then
          begin
            for i := 0 to radar.AssignedTrack.Count - 1 do
            begin
              tempPlatform := radar.AssignedTrack.Items[i];
              tempPlatform.IsAssigned := false;
            end;

            radar.AssignedTrack.Clear;
          end;
        end;

      CORD_FC_ASSIGN:
        begin
          isExist := false; // mk
          objPlatform.IsAssigned := True;

          if radar.AssignedTrack <> nil then
          begin
            for i := 0 to radar.AssignedTrack.Count - 1 do
            begin
              if objPlatform.Equals(radar.AssignedTrack.Items[i]) then
              begin
                isExist := True;
                break;
              end;
            end;

            if not isExist then
              radar.AssignedTrack.Add(objPlatform);
          end;
        end;

      CORD_FC_BREAK:
        begin
          isExist := false; // mk
          if radar.AssignedTrack <> nil then
          begin
            if radar.AssignedTrack.Count <= 0 then
              Exit;

            for i := 0 to radar.AssignedTrack.Count - 1 do
            begin
              if objPlatform.Equals(radar.AssignedTrack.Items[i]) then
              begin
                isExist := True;
                break;
              end;
            end;

            if isExist then
            begin
              objPlatform.IsAssigned := false;
              radar.AssignedTrack.Remove(objPlatform);
            end;
          end;
        end;
    end;

    if Assigned(radar.OnFireControlUpdated) then
    begin
      radar.OnFireControlUpdated(radar);
    end;
  end;
end;

procedure TT3SimManager.FNetworkThreadVBS_OnPaused(const dt: double);
begin
//x
end;

procedure TT3SimManager.FNetworkThreadVBS_OnRunning(const dt: double);
begin
//x
end;

procedure TT3SimManager.FNetworkThreadVBS_OnTerminate(sender: TObject);
begin
//x
end;

procedure TT3SimManager.FNetworkThread_OnPaused(const dt: double);
begin
//x
end;

procedure TT3SimManager.FNetworkThread_OnRunning(const dt: double);
begin
//x
end;

procedure TT3SimManager.FNetworkThread_OnTerminate(sender: TObject);
begin
//x
end;

procedure TT3SimManager.netRecv_CmdMineProperty(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecMineProperty;
  ParentPlatform : TT3PlatformInstance;
  mine : TObject;
begin
  r := @apRec^;

  ParentPlatform := FindT3PlatformByID(r^.ParentPlatformID);
  if ParentPlatform is TT3Vehicle then
  begin
    //mine := TT3Vehicle(ParentPlatform).getWeapon(r^.WeaponName, TT3MineOnVehicle);
    mine := TT3Vehicle(ParentPlatform).getWeapon(r^.WeaponIndex, TT3MineOnVehicle);

    if mine <> nil then
      TT3MineOnVehicle(mine).Depth := Round(r^.Param);
  end;
end;

//procedure TT3SimManager.netRecv_CmdPlotting(apRec: PAnsiChar; aSize: word);
//var
//  r: ^TRecCmd_Plotting;
//  rec: TRecCmd_Plotting;
//begin
//  r := @apRec^;
//
//  if r = nil then
//    Exit;
//
//  if r^.SessionID <> FSessionID then
//    Exit;
//
//  rec := r^;
//
//  EventManager.OnPlotting(rec);
//end;

procedure TT3SimManager.netRecv_CmdRadarNoiseJammer(apRec: PAnsiChar;
  aSize: word);
var
  rec : ^TrecRadarNoiseJammer;
  i   : Integer;
  jammerObject, jammerOwner, radarJammed : TObject;
begin
  rec := @apRec^;

  if rec^.SessionID <> FSessionID then
    Exit;

  jammerObject := nil;

  { find parent jammer }
  jammerOwner := FindT3PlatformByID(rec.JammerPlatformOwnerID);
  { find jammer }
  if Assigned(jammerOwner) then
    jammerObject := FindT3DeviceByID(TT3RadarNoiseJammerOnVehicle,
                    TSimObject(jammerOwner), rec.JammerID);

  if not Assigned(jammerObject) then
    Exit;

  case rec.OrderID of
    CORD_ID_RN_SETJAMSTATUS,
    CORD_ID_RN_SETJAMMODE,
    CORD_ID_RN_SETJAMSPOTNUMB,
    CORD_ID_RN_SETJAMBEARING,
    CORD_ID_RN_SETJAMCENTFREQ,
    CORD_ID_RN_SETJAMBANDWIDTH,
    CORD_ID_RN_SETJAMTRACK :
      begin
        with TT3RadarNoiseJammerOnVehicle(jammerObject) do
        begin
          {0:off, 1:onn}
          case rec^.JammerStatus of
            0 : Status := esOff;
            1 : Status := esOn;
          end;

          {0:mode barrage; 1:mode track; 2:mode spot; 3:mode center frequency}
          case rec^.JammerMode of
            0 : JamTargeting := ettNJBarrage;
            1 : JamTargeting := ettNJTrack;
            2 : JamTargeting := ettNJSpotNum;
            3 : JamTargeting := ettNJFreq;
          end;

          JamSpotNumber  := rec^.SpotNumber;
          JamBearing     := rec^.Bearing;
          JamCenterFreq  := rec^.CenterFreq;
          JamBandWidth   := rec^.BandWidth;

          {set request target jammer}
          JamReqTargetRadarId     := rec^.ObjectReqJammedID;
          JamReqTargetRadarOwnId  := rec^.ObjectReqJammedOwnerID;
        end;
      end;
  end;

  if jammerObject is TT3RadarNoiseJammerOnVehicle then
  begin
    if (TT3RadarNoiseJammerOnVehicle(jammerObject).Status = esOff) then
    begin
      if TT3RadarNoiseJammerOnVehicle(jammerObject).TargetJamming <> nil then
      begin
        for i := 0 to TT3RadarNoiseJammerOnVehicle(jammerObject).TargetJamming.Count - 1 do
        begin
          radarJammed  :=  TT3RadarNoiseJammerOnVehicle(jammerObject).TargetJamming.Items[i];

          if Assigned(radarJammed) then
          begin
            TT3Radar(radarJammed).RNJammOperationalStatus := JammedOff;

            TT3Radar(radarJammed).JammedBy.Remove(jammerObject);
          end;
        end;

        TT3RadarNoiseJammerOnVehicle(jammerObject).TargetJamming.Clear;
      end;
    end;
  end;
end;

procedure TT3SimManager.netRecvMapCmd(apRec: PAnsiChar; aSize: Word);
begin

end;

procedure TT3SimManager.netRecv_CmdBombProperty(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecBombProperty;
  ParentPlatform : TT3PlatformInstance;
  bom : TObject;
begin
  r := @apRec^;

  ParentPlatform := FindT3PlatformByID(r^.ParentPlatformID);
  if ParentPlatform is TT3Vehicle then
  begin
    //bom := TT3Vehicle(ParentPlatform).getWeapon(r^.WeaponName, TT3BombONVehicle);
    bom := TT3Vehicle(ParentPlatform).getWeapon(r^.WeaponIndex, TT3BombONVehicle);

    if bom <> nil then
      TT3BombONVehicle(bom).SalvoSize := Round(r^.Param);
  end;
end;

procedure TT3SimManager.netRecv_CmdBombSyncPanelWeapon(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecBombPanelWeapon;
  OwnPlatform   : TT3PlatformInstance;
  OwnVehicle    : TT3Vehicle;
  VehicleWeapon : TT3BombONVehicle;
  Focused_weapon  : TObject;
begin
  r := @apRec^;

  OwnPlatform := FindT3PlatformByID(r^.ParentPlatformID);
  if OwnPlatform is TT3Vehicle then
  begin
    OwnVehicle := TT3Vehicle(OwnPlatform);
    //Focused_weapon := TT3BombONVehicle(OwnVehicle.getWeapon(r^.WeaponName));
    Focused_weapon := OwnVehicle.getWeapon(r^.WeaponIndex, TT3BombONVehicle);

    if not Assigned(Focused_weapon) then
      Exit;

    if not(Focused_weapon is TT3BombONVehicle) then
      Exit;

    VehicleWeapon  := TT3BombONVehicle(Focused_weapon);

    VehicleWeapon.ParentPlatformID := r^.ParentPlatformID;
    VehicleWeapon.TargetPlatformID := r^.TargetPlatformID;
    VehicleWeapon.TargetTrack := r^.TargetTrack;
    VehicleWeapon.SalvoSize := r^.SalvoSize;
    VehicleWeapon.NoCubicle := r^.NoCubicle;
    VehicleWeapon.ButtonLaunch := r^.ButtonLaunch;
    VehicleWeapon.DropWhithoutTarget := r^.NoTarget;
  end;
end;

procedure TT3SimManager.netRecv_CmdEditFormation(apRec: PAnsiChar; aSize: word);
var
  rec : ^TRecEditFormation;
  fm : TFormationRefine;
  member : TClassFormation_Assignment;
begin
  rec := @apRec^;

  case rec.OrderID of

    // Add Formation
    CORD_ID_AddForm :
      begin
        // refine formation
        fm := TFormationRefine.Create;
        with fm.FFormation_Def do
        begin
          Formation_Index := GetSerialFormationID;
          Formation_Identifier := rec.FormationName;
          Formation_Leader := rec.FormationLeader;
          Force_Designation  := rec.Force;
          Angle_Type := rec.AngelType;
          Deployment_Index := rec.DeploymentId;
        end;
        Scenario.Formation_List_rev.AddFormation(fm)

      end;

    // Edit Formation
    CORD_ID_EditForm :
      begin
        // refine
        fm := Scenario.Formation_List_rev.FormationByIndex(rec.FormationID);
        if Assigned(fm) then
        begin
          with fm.FFormation_Def do
          begin
            Formation_Identifier := rec.FormationName;
            Formation_Leader := rec.FormationLeader;
            Force_Designation  := rec.Force;
          end;
        end;
      end;

    // Remove Formation
    CORD_ID_RemoveForm :
      begin
        Scenario.Formation_List_rev.RemoveFormationByIndex(rec.FormationID);
        EventManager.OnUpdateFormationList;
      end;

    // Add Members Formation
    CORD_ID_AddMember :
      begin
        fm := Scenario.Formation_List_rev.FormationByIndex(rec.FormationID);
        if not Assigned(fm) then
          Exit;

        member := TClassFormation_Assignment.Create;

        with member do
        begin
          Formation_Index := rec.FormationID;
          Platform_Instance_Index := rec.MemberId;
          Angle_Offset := rec.MemberBearing;
          Range_from_Leader  := rec.MemberRange;
          Altitude := rec.MemberAltitude;
        end;

        fm.AddMember(member);
      end;

    // Remove Members Formation
    CORD_ID_RemoveMember :
      begin

        fm := Scenario.Formation_List_rev.FormationByIndex(rec.FormationID);
        if not Assigned(fm) then
          Exit;

        fm.RemoveMemberByIndex(rec.MemberId);
      end;

    // Edit Members Formation
    CORD_ID_EditMember :
      begin

        fm := Scenario.Formation_List_rev.FormationByIndex(rec.FormationID);
        if not Assigned(fm) then
          Exit;

        member := fm.MemberByIndex(rec.MemberId);
        if not Assigned(member) then
          Exit;

        with member do
        begin
          Angle_Offset      := rec.MemberBearing;
          Range_from_Leader := rec.MemberRange;
          Altitude          := rec.MemberAltitude;
        end;

      end;
  end;
end;

procedure TT3SimManager.netRecv_CmdEmcon(apRec: PAnsiChar; aSize: word);
var
  r      : ^TRecCmd_ModeEmcon;
  v      : TT3Vehicle;
  p      : TT3PlatformInstance;
  sensor : TT3Sensor;
  obj    : TObject;
  I, k, j     : Integer;
  tempPlatform       : TT3PlatformInstance;
  EMCON : TEMCON_Category;
  datalink : TT3DataLink;
begin
  r := @apRec^;
  obj := nil;

  p   := FindT3PlatformByID(r^.PlatformID);
  if  (p = nil) then Exit;

  v := TT3Vehicle(p);

  if r^.EmconCtgr <> 12 then
  begin
    case r^.Mode of
      byte(Checked) :   begin
                          for i := 0 to v.ListEMCON.Count - 1 do
                          begin
                            EMCON := TEMCON_Category(v.ListEMCON[i]);

                            if byte(EMCON.Name) = byte(r^.EmconCtgr) then
                              EMCON.Mode := byte(Checked);
                          end;
                        end;
      byte(UnChecked) : begin
                          for i := 0 to v.ListEMCON.Count - 1 do
                          begin
                            EMCON := TEMCON_Category(v.ListEMCON[i]);

                            if byte(EMCON.Name) = byte(r^.EmconCtgr) then
                              EMCON.Mode := byte(unChecked);
                          end;
                        end;
    end;
  end;

  //------------------------- EMCON = ALLSILENT -------------------------//
  if r^.SensorID = 0 then
  begin
    //------------------------ EMCON DATALINK ---------------------------//
    datalink := DataLinkManager.getDatalinkOnPU(v);
    if datalink <> nil then
    begin
      datalink.EmconOperationalStatus :=
        TEMCON_OperasionalStatus(byte(r^.OrderParam));

      if r^.OrderParam = Byte(EmconOn) then begin
        v.EMCON_HFDataLinkVehicle := EmconHFDatalinkOn;
        v.EMCON_UHFVHFDataLinkVehicle := EmconUHFVHFDatalinkOn;
      end
      else begin
        v.EMCON_HFDataLinkVehicle := EmconHFDatalinkOff;
        v.EMCON_UHFVHFDataLinkVehicle := EmconUHFVHFDatalinkOff;
      end;
    end;

    case r^.Mode of
      byte(Checked) :
        begin
          for j := 0 to v.ListEMCON.Count - 1 do
          begin
            EMCON := TEMCON_Category(v.ListEMCON[j]);

            if byte(EMCON.Name) = Byte(HFDatalink) then
            begin
              EMCON.Mode := byte(Checked);
              //Break;
            end
            else if byte(EMCON.Name) = Byte(VHFDatalink) then
            begin
              EMCON.Mode := byte(Checked);
              //Break;
            end;
          end;
        end;
      byte(UnChecked) :
        begin
          for j := 0 to v.ListEMCON.Count - 1 do
          begin
            EMCON := TEMCON_Category(v.ListEMCON[j]);

            if byte(EMCON.Name) = Byte(HFDatalink) then
            begin
              EMCON.Mode := byte(UnChecked);
              //Break;
            end
            else if byte(EMCON.Name) = Byte(VHFDatalink) then
            begin
              EMCON.Mode := byte(UnChecked);
              //Break;
            end;
          end;
        end;
    end;
    //---------------------------- END ----------------------------------//

    //------------------------- EMCON SENSOR ----------------------------//
    for I := 0 to v.Devices.Count - 1 do
    begin
      sensor := v.Devices.Items[i];

      if sensor is TT3Radar then
      begin
        TT3Radar(sensor).EmconOperationalStatus :=
          TEMCON_OperasionalStatus(byte(r^.OrderParam));

        if (TT3Radar(sensor).EmconOperationalStatus = EmconOn)
          and (TT3Radar(sensor).RadarDefinition.FDef.Num_FCR_Channels > 0) then
        begin
          if TT3Radar(sensor).AssignedTrack <> nil then
          begin
            if (TT3Radar(sensor).AssignedTrack.Count <= 0)
            or (TT3Radar(sensor).AssignedTrack.Count >
                TT3Radar(sensor).RadarDefinition.FDef.Num_FCR_Channels) then
            begin
              for k := 0 to TT3Radar(sensor).AssignedTrack.Count - 1 do
              begin
                tempPlatform := TT3Radar(sensor).AssignedTrack.Items[k];
                tempPlatform.IsAssigned := false;
              end;

              TT3Radar(sensor).AssignedTrack.Clear;
            end;
          end;

          if Assigned(TT3Radar(sensor).OnFireControlUpdated) then
          begin
            TT3Radar(sensor).OnFireControlUpdated(TT3Radar(obj));
          end;
        end;

        case r^.Mode of
          byte(Checked) :   begin
                              for j := 0 to v.ListEMCON.Count - 1 do
                              begin
                                EMCON := TEMCON_Category(v.ListEMCON[j]);

                                if (TT3Radar(sensor).RadarDefinition.FDef.Num_FCR_Channels > 0) then
                                begin
                                  if byte(EMCON.Name) = byte(FCRadar) then
                                  begin
                                    EMCON.Mode := byte(Checked);
                                    Break;
                                  end;
                                end
                                else
                                begin
                                  if byte(EMCON.Name) = byte(srcRadar) then
                                  begin
                                    EMCON.Mode := byte(Checked);
                                    Break;
                                  end;
                                end;
                              end;
                            end;
          byte(UnChecked) : begin
                              for j := 0 to v.ListEMCON.Count - 1 do
                              begin
                                EMCON := TEMCON_Category(v.ListEMCON[j]);

                                if (TT3Radar(sensor).RadarDefinition.FDef.Num_FCR_Channels > 0) then
                                begin
                                  if byte(EMCON.Name) = byte(FCRadar) then
                                  begin
                                    EMCON.Mode := byte(UnChecked);
                                    Break;
                                  end;
                                end
                                else
                                begin
                                  if byte(EMCON.Name) = byte(srcRadar) then
                                  begin
                                    EMCON.Mode := byte(UnChecked);
                                    Break;
                                  end;
                                end;
                              end;
                            end;
        end;
      end
      else
      begin
//        if (not(sensor is TT3Visual)) and (not(sensor is TT3MADSensor))
//            and (not(sensor is TT3SonobuoyOnVehicle)) then
        if (sensor is TT3Sonar) or (sensor is TT3IFFSensor)
           or (sensor is TT3ESMSensor) or (sensor is TT3EOSensor)
        then
        begin
          sensor.EmconOperationalStatus := TEMCON_OperasionalStatus(byte(r^.OrderParam));

          case r^.Mode of
            byte(Checked) :   begin
                                for j := 0 to v.ListEMCON.Count - 1 do
                                begin
                                  EMCON := TEMCON_Category(v.ListEMCON[j]);

                                  if sensor is TT3Sonar then
                                  begin
                                    if byte(EMCON.Name) = byte(ActiveSonar) then
                                    begin
                                      EMCON.Mode := byte(Checked);
                                      Break;
                                    end;
                                  end
                                  else if sensor is TT3IFFSensor then
                                  begin
                                    if byte(EMCON.Name) = byte(IFF) then
                                    begin
                                      EMCON.Mode := byte(Checked);
                                      Break;
                                    end;
                                  end;
                                end;
                              end;
            byte(UnChecked) : begin
                                for j := 0 to v.ListEMCON.Count - 1 do
                                begin
                                  EMCON := TEMCON_Category(v.ListEMCON[j]);

                                  if sensor is TT3Sonar then
                                  begin
                                    if byte(EMCON.Name) = byte(ActiveSonar) then
                                    begin
                                      EMCON.Mode := byte(UnChecked);
                                      Break;
                                    end;
                                  end
                                  else if sensor is TT3IFFSensor then
                                  begin
                                    if byte(EMCON.Name) = byte(IFF) then
                                    begin
                                      EMCON.Mode := byte(UnChecked);
                                      Break;
                                    end;
                                  end;
                                end;
                              end;
          end;
        end;
      end;
    end;
    //---------------------------- END ----------------------------------//
  end
  else
  //----------------------- EMCON = PER SENSOR --------------------------//
  begin
    //------------------------ EMCON DATALINK ---------------------------//
    datalink := DataLinkManager.getDatalink(r^.SensorID);
    if datalink <> nil then
    begin
      datalink.EmconOperationalStatus :=
        TEMCON_OperasionalStatus(byte(r^.OrderParam));

      if r^.EmconCtgr = Byte(HFDatalink) then
      begin
        if r^.OrderParam = Byte(EmconOn) then
          v.EMCON_HFDataLinkVehicle := EmconHFDatalinkOn
        else
          v.EMCON_HFDataLinkVehicle := EmconHFDatalinkOff;
      end
      else if r^.EmconCtgr = Byte(VHFDatalink) then
      begin
        if r^.OrderParam = Byte(EmconOn) then
          v.EMCON_UHFVHFDataLinkVehicle := EmconUHFVHFDatalinkOn
        else
          v.EMCON_UHFVHFDataLinkVehicle := EmconUHFVHFDatalinkOff;
      end;
    end
    //---------------------------- END ----------------------------------//
    else begin
    //------------------------- EMCON SENSOR ----------------------------//
      for I := 0 to v.Devices.Count - 1 do
      begin
        sensor := v.Devices.Items[i];

        if sensor is TT3Radar then
        begin
          obj := v.getDevice(r^.SensorID, TT3Radar);
          if obj = nil then
            continue;

          if r^.SensorID <> TT3Radar(obj).InstanceIndex then
            continue;

          TT3Radar(obj).EmconOperationalStatus := TEMCON_OperasionalStatus(byte(r^.OrderParam));

          if (TT3Radar(obj).EmconOperationalStatus = EmconOn)
            and (TT3Radar(obj).RadarDefinition.FDef.Num_FCR_Channels > 0) then
          begin
            if TT3Radar(obj).AssignedTrack <> nil then
            begin
              if (TT3Radar(obj).AssignedTrack.Count <= 0)
              or (TT3Radar(obj).AssignedTrack.Count > TT3Radar(obj).RadarDefinition.FDef.Num_FCR_Channels) then
              begin
                for k := 0 to TT3Radar(obj).AssignedTrack.Count - 1 do
                begin
                  tempPlatform := TT3Radar(obj).AssignedTrack.Items[k];
                  tempPlatform.IsAssigned := false;
                end;

                TT3Radar(obj).AssignedTrack.Clear;
              end;
            end;

            if Assigned(TT3Radar(obj).OnFireControlUpdated) then
            begin
              TT3Radar(obj).OnFireControlUpdated(TT3Radar(obj));
            end;
          end;
        end
        else if sensor is TT3Sonar then
        begin
          obj := v.getDevice(r^.SensorID, TT3Sonar);

          if obj = nil then continue;

          TT3Sonar(obj).EmconOperationalStatus := TEMCON_OperasionalStatus(byte(r^.OrderParam));
        end
        else if sensor is TT3IFFSensor then
        begin
          obj := v.getDevice(r^.SensorID, TT3IFFSensor);

          if obj = nil then continue;

          TT3IFFSensor(obj).EmconOperationalStatus := TEMCON_OperasionalStatus(byte(r^.OrderParam));
        end;
      end;
    end;
    //---------------------------- END ----------------------------------//
  end;
end;

procedure TT3SimManager.netRecv_CmdGunFireState(apRec: PAnsiChar; aSize: word);
begin
  //x
end;

procedure TT3SimManager.netRecv_CmdTorpedoProperty(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecTorpedoProperty;
  OwnPlatform   : TT3PlatformInstance;
  OwnVehicle    : TT3Vehicle;
  VehicleWeapon : TT3TorpedoesOnVehicle;
  Focused_weapon  : TObject;
begin
  r := @apRec^;

  OwnPlatform := FindT3PlatformByID(r^.ParentPlatformID);
  if OwnPlatform is TT3Vehicle then
  begin
    OwnVehicle := TT3Vehicle(OwnPlatform);
    //Focused_weapon := TT3TorpedoesOnVehicle(OwnVehicle.getWeapon(r^.WeaponName));
    Focused_weapon := OwnVehicle.getWeapon(r^.WeaponIndex, TT3TorpedoesOnVehicle);

    if Focused_weapon = nil then
      Exit;

    if not(Focused_weapon is TT3TorpedoesOnVehicle) then
      Exit;

    VehicleWeapon  := TT3TorpedoesOnVehicle(Focused_weapon);

    {$REGION 'TipeTorpedo'}
      {(5)TorpedoStraigth,    (6)TorpedoActiveAcoustic,  (7)TorpedoPassiveAcoustic, (8)TorpedoWireGuided,
       (9) TorpedoWakeHoming, (10) TorpedoActivePassive, (11) TorpedoAirDropped }
    {$ENDREGION}

    if TWeapoonCategory(r^.TorpType) = wcTorpedoActiveAcoustic then
    begin

      {$REGION 'Konstanta Acoustic'}
      {(1)Tube, (2)Firing Mode, (3)RunOut Mode, (4)SearchRadius, (5)SearchDepth,
      (6)Safety Ceiling, (7)SeekerRange, (8)GyroAngle }
      {$ENDREGION}

      if r^.OrderType = 1 then
        VehicleWeapon.TubeOn := Round(r^.Param)
      else if r^.OrderType = 2 then
        VehicleWeapon.FiringMode := Round(r^.Param)
      else if r^.OrderType = 3 then
        VehicleWeapon.RunOutMode := Round(r^.Param)
      else if r^.OrderType = 4 then
        VehicleWeapon.SearchRadius := r^.Param
      else if r^.OrderType = 5 then
        VehicleWeapon.SearchDepth := r^.Param
      else if r^.OrderType = 6 then
        VehicleWeapon.SafetyCeiling := r^.Param
      else if r^.OrderType = 7 then
        VehicleWeapon.SeekerRange := r^.Param
      else if r^.OrderType = 8 then
        VehicleWeapon.GyroAngle := Round(r^.Param)
      else if r^.OrderType = 9 then
      begin
        VehicleWeapon.ButtonLaunch := True;
        VehicleWeapon.ButtonPlan := False;
      end;

//      case r^.OrderType of
//        ORDERTYPE_Tube          : VehicleWeapon.TubeOn := Round(r^.Param);
//        ORDERTYPE_FiringMode    : VehicleWeapon.FiringMode := Round(r^.Param);
//        ORDERTYPE_RunOutMode    : VehicleWeapon.RunOutMode := Round(r^.Param);
//        ORDERTYPE_SearchRadius  : VehicleWeapon.SearchRadius := r^.Param;
//        ORDERTYPE_SearchDepth   : VehicleWeapon.SearchDepth := r^.Param;
//        ORDERTYPE_SafetyCeiling : VehicleWeapon.SafetyCeiling := r^.Param;
//        ORDERTYPE_SeekerRange   : VehicleWeapon.SeekerRange := r^.Param;
//        ORDERTYPE_GyroAngle     : VehicleWeapon.GyroAngle := Round(r^.Param);
//        ORDERTYPE_Button :
//        begin
//          VehicleWeapon.ButtonLaunch := True;
//          VehicleWeapon.ButtonPlan := False;
//        end;
//      end;
    end
    else if TWeapoonCategory(r^.TorpType) = wcTorpedoWakeHoming then
    begin
//      case r^.OrderType of
//        ORDERTYPE_SeekerRange   : VehicleWeapon.SeekerRange := r^.Param;
//        ORDERTYPE_SalvoSize     : VehicleWeapon.SalvoSize := Round(r^.Param);
//        ORDERTYPE_LaunchBearing : VehicleWeapon.LaunchBearing := r^.Param;
//      end;

      if r^.OrderType = 1 then
        VehicleWeapon.SalvoSize := Round(r^.Param)
      else if r^.OrderType = 2 then
        VehicleWeapon.LaunchBearing := r^.Param
      else if r^.OrderType = 3 then
        VehicleWeapon.SeekerRange := r^.Param
    end
    else if TWeapoonCategory(r^.TorpType) = wcTorpedoActivePassive then
    begin
//      case r^.OrderType of
//        ORDERTYPE_SearchRadius  : VehicleWeapon.SearchRadius := r^.Param;
//        ORDERTYPE_SearchDepth   : VehicleWeapon.SearchDepth := r^.Param;
//        ORDERTYPE_SafetyCeiling : VehicleWeapon.SafetyCeiling := r^.Param;
//        ORDERTYPE_SeekerRange   : VehicleWeapon.SeekerRange := r^.Param;
//        ORDERTYPE_SalvoSize     : VehicleWeapon.SalvoSize := Round(r^.Param);
//      end;

      if r^.OrderType = 1 then
        VehicleWeapon.SalvoSize := Round(r^.Param)
      else if r^.OrderType = 2 then
        VehicleWeapon.SearchRadius := r^.Param
      else if r^.OrderType = 3 then
        VehicleWeapon.SearchDepth := r^.Param
      else if r^.OrderType = 4 then
        VehicleWeapon.SafetyCeiling := r^.Param
      else if r^.OrderType = 5 then
        VehicleWeapon.SeekerRange := r^.Param
    end
    else if TWeapoonCategory(r^.TorpType) = wcTorpedoAirDropped then
    begin
//      case r^.OrderType of
//        ORDERTYPE_SearchRadius  : VehicleWeapon.SearchRadius := r^.Param;
//        ORDERTYPE_SearchDepth   : VehicleWeapon.SearchDepth := r^.Param;
//        ORDERTYPE_SafetyCeiling : VehicleWeapon.SafetyCeiling := r^.Param;
//        ORDERTYPE_SeekerRange   : VehicleWeapon.SeekerRange := r^.Param;
//        ORDERTYPE_LaunchBearing : VehicleWeapon.LaunchBearing := r^.Param;
//        ORDERTYPE_Button :
//        begin
//          if r^.Param = 1 then
//            VehicleWeapon.EnableLaunchBearing := True
//          else
//            VehicleWeapon.EnableLaunchBearing := False;
//        end;
//      end;

      if r^.OrderType = 1 then
        VehicleWeapon.SearchRadius := r^.Param / C_NauticalMile_To_Yards
      else if r^.OrderType = 2 then
        VehicleWeapon.SearchDepth := r^.Param
      else if r^.OrderType = 3 then
        VehicleWeapon.SafetyCeiling := r^.Param
      else if r^.OrderType = 4 then
        VehicleWeapon.LaunchBearing := r^.Param
      else if r^.OrderType = 5 then
      begin
        if r^.Param = 1 then
          VehicleWeapon.EnableLaunchBearing := True
        else
          VehicleWeapon.EnableLaunchBearing := False;
      end;
    end;
  end;
end;

procedure TT3SimManager.netRecv_CmdTorpedoSyncPanelWeapon(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecTorpedoPanelWeapon;
  OwnPlatform   : TT3PlatformInstance;
  OwnVehicle    : TT3Vehicle;
  VehicleWeapon : TT3TorpedoesOnVehicle;
  Focused_weapon  : TObject;
begin
  r := @apRec^;

  OwnPlatform := FindT3PlatformByID(r^.ParentPlatformID);

  if Assigned(OwnPlatform) then
  begin
    if OwnPlatform is TT3Vehicle then
    begin
      OwnVehicle := TT3Vehicle(OwnPlatform);

      Focused_weapon := OwnVehicle.getWeapon(r^.WeaponIndex, TT3TorpedoesOnVehicle);

      if Assigned(Focused_weapon) then
      begin
        if Focused_weapon is TT3TorpedoesOnVehicle then
        begin
          VehicleWeapon  := TT3TorpedoesOnVehicle(Focused_weapon);

          VehicleWeapon.WeaponCategory   := TWeapoonCategory(r^.TorpType);
          VehicleWeapon.ParentPlatformID := r^.ParentPlatformID;
          VehicleWeapon.TargetPlatformID := r^.TargetPlatformID;
          VehicleWeapon.TargetTrack := r^.TargetTrack;
          VehicleWeapon.NoCubicle := r^.NoCubicle;

          case TWeapoonCategory(r^.TorpType) of
            wcTorpedoStraigth, wcTorpedoWireGuided :
            begin
              VehicleWeapon.TargetIdentity := r^.Param1;
              VehicleWeapon.TargetCourse := r^.Param2;
              VehicleWeapon.TargetGroundSpeed := r^.Param3;
              VehicleWeapon.TargetAltitude := r^.Param4;
              VehicleWeapon.ButtonLaunch := r^.ButtonLaunch;
            end;
            wcTorpedoActiveAcoustic :
            begin
              VehicleWeapon.TargetIdentity := r^.Param1;
              VehicleWeapon.TargetCourse := r^.Param2;
              VehicleWeapon.TargetGroundSpeed := r^.Param3;
              VehicleWeapon.TargetAltitude := r^.Param4;
              VehicleWeapon.FiringMode := r^.FiringMode;
              VehicleWeapon.RunOutMode := r^.RunOut;
              VehicleWeapon.SearchRadius := r^.SearchRadius;
              VehicleWeapon.SearchDepth := r^.SearchDepth;
              VehicleWeapon.SafetyCeiling := r^.SafetyCeiling;
              VehicleWeapon.SeekerRange := r^.SeekerRange;
              VehicleWeapon.GyroAngle := r^.GyroAngle;
              VehicleWeapon.LaunchBearing := r^.GyroAngle;
              VehicleWeapon.ButtonPlan := r^.ButtonPlan;
              VehicleWeapon.ButtonLaunch := r^.ButtonLaunch;
            end;
            wcTorpedoWakeHoming :
            begin
              VehicleWeapon.SalvoSize := r^.SalvoSize;
              VehicleWeapon.TargetIdentity := r^.Param1;
              VehicleWeapon.TargetBearing := r^.Param2;
              VehicleWeapon.LaunchBearing := r^.LaunchBearing;
              VehicleWeapon.SeekerRange := r^.SeekerRange;
              VehicleWeapon.ButtonLaunch := r^.ButtonLaunch;
            end;
            wcTorpedoActivePassive :
            begin
              if (r^.Param1 = 'x') then
              begin
                VehicleWeapon.ButtonLaunch := r^.ButtonLaunch;
              end
              else
              begin
                VehicleWeapon.SalvoSize := r^.SalvoSize;
                VehicleWeapon.SearchRadius := r^.SearchRadius;
                VehicleWeapon.SearchDepth := r^.SearchDepth;
                VehicleWeapon.SafetyCeiling := r^.SafetyCeiling;
                VehicleWeapon.SeekerRange := r^.SeekerRange;
                VehicleWeapon.ButtonLaunch := r^.ButtonLaunch;
              end;
            end;
            wcTorpedoAirDropped :
            begin
              VehicleWeapon.TargetIdentity := r^.Param1;
              VehicleWeapon.TargetCourse := r^.Param2;
              VehicleWeapon.TargetGroundSpeed := r^.Param3;
              VehicleWeapon.TargetAltitude := r^.Param4;
              VehicleWeapon.SearchRadius := r^.SearchRadius;
              VehicleWeapon.SearchDepth := r^.SearchDepth;
              VehicleWeapon.SafetyCeiling := r^.SafetyCeiling;
              VehicleWeapon.EnableLaunchBearing := True;
              VehicleWeapon.LaunchWhithoutTarget := r^.NoTarget;
              VehicleWeapon.ButtonLaunch := r^.ButtonLaunch;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TT3SimManager.netRecv_SincBOLWMissile(apRec: PAnsiChar; aSize: Word);
var
  r : ^TrecSinc_BOLW;
  OwnPlatform : TT3PlatformInstance;
  OwnVehicle : TT3Vehicle;
  Focused_weapon  : TObject;
  VehicleWeapon : TT3MissilesOnVehicle;
  PointBOLW : TPointVehicleMissileBOLW;
  OriginalSaved : PRec_WeaponWaypoint_Original;
  i, j : Integer;
begin
  r := @apRec^;

  OwnPlatform := FindT3PlatformByID(r^.platformID);
  if OwnPlatform is TT3Vehicle then
  begin
    OwnVehicle := TT3Vehicle(OwnPlatform);
    //Focused_weapon := TT3MissilesOnVehicle(OwnVehicle.getWeapon(r^.WeaponName));
    Focused_weapon := OwnVehicle.getWeapon(r^.WeaponIndex, TT3MissilesOnVehicle);

    if Focused_weapon = nil then
      Exit;

    if not (Focused_weapon is TT3MissilesOnVehicle) then
      Exit;

    VehicleWeapon  := TT3MissilesOnVehicle(Focused_weapon);

    case r^.cmd of
      0 : //Add Waypoint
      begin
        PointBOLW := TPointVehicleMissileBOLW.Create(VehicleWeapon.BOLW_PointX,
          VehicleWeapon.BOLW_PointY, r^.BOLWIndex, r^.BOLWLauncherIndex, r^.PlatformID);

        PointBOLW.IsEdit := r^.IsAdd;

        VehicleWeapon.BOLW_PointList.Add(PointBOLW);
        SimPointBOLW_VehicleMissile.addObject(PointBOLW);
      end;
      1 : //Cancel Change Waypoint
      begin
        for i := OwnVehicle.OriginalMissileWaypoint.Count - 1 downto 0 do
        begin
          OriginalSaved := OwnVehicle.OriginalMissileWaypoint.Items[i];

          if OriginalSaved.WaypointType <> wtBOLW then
            Continue;

          case OriginalSaved.Action of
            waMove:
            begin
              for j := 0 to VehicleWeapon.BOLW_PointList.Count - 1 do
              begin
                PointBOLW := VehicleWeapon.BOLW_PointList.Items[j];

                if (OriginalSaved.ShipID = r^.PlatformID) and
                  (OriginalSaved.PointIndex = PointBOLW.IndexPoint) and
                  (OriginalSaved.PointLauncherIndex = PointBOLW.LauncherIndex) then
                begin
                  PointBOLW.IsChange := False;
                  PointBOLW.IsOriginal := True;
                  PointBOLW.PointBOLW_X1 := OriginalSaved.PointX;
                  PointBOLW.PointBOLW_Y1 := OriginalSaved.PointY;
                  Break;
                end;
              end;
            end;
            waInsert:
            begin
              for j := 0 to VehicleWeapon.BOLW_PointList.Count - 1 do
              begin
                PointBOLW := VehicleWeapon.BOLW_PointList.Items[j];

                if (OriginalSaved.ShipID = r^.PlatformID) and
                  (OriginalSaved.PointIndex = PointBOLW.IndexPoint) and
                  (OriginalSaved.PointLauncherIndex = PointBOLW.LauncherIndex) then
                begin
                  SimPointBOLW_VehicleMissile.deleteObject(PointBOLW);
                  VehicleWeapon.BOLW_PointList.Delete(j);
                  Break;
                end;
              end;
            end;
            waDelete:
            begin
              PointBOLW := TPointVehicleMissileBOLW.Create(OriginalSaved.PointX,
                OriginalSaved.PointY, OriginalSaved.PointIndex,
                OriginalSaved.PointLauncherIndex, OriginalSaved.ShipID);

              VehicleWeapon.BOLW_PointList.Add(PointBOLW);
              SimPointBOLW_VehicleMissile.addObject(PointBOLW);
            end;
          end;
        end;
        OwnVehicle.OriginalMissileWaypoint.Clear;

        for i := 0 to VehicleWeapon.BOLW_PointList.Count - 1 do
        begin
          PointBOLW := VehicleWeapon.BOLW_PointList.Items[i];
          PointBOLW.IsEdit := False;
        end;
      end;
      2 : //Apply Change Waypoint
      begin
        for i := 0 to VehicleWeapon.BOLW_PointList.Count - 1 do
        begin
          PointBOLW := VehicleWeapon.BOLW_PointList.Items[i];
          PointBOLW.IsEdit := False;
          PointBOLW.IsChange := False;
          PointBOLW.IsOriginal := True;
        end;
        OwnVehicle.OriginalMissileWaypoint.Clear;
      end;
      3 :
      begin
        for i := 0 to VehicleWeapon.BOLW_PointList.Count - 1 do
        begin
          PointBOLW := VehicleWeapon.BOLW_PointList.Items[i];
          SimPointBOLW_VehicleMissile.deleteObject(PointBOLW);
        end;

        VehicleWeapon.BOLW_PointList.Clear;
        VehicleWeapon.isONBOLW := False;

        EventManager.AbortMissileLaunch(OwnVehicle.InstanceIndex, VehicleWeapon.InstanceIndex);
      end;
      4 : //Move Selected Waypoint Long Lat
      begin
        for i := 0 to VehicleWeapon.BOLW_PointList.Count - 1 do
        begin
          PointBOLW := VehicleWeapon.BOLW_PointList[i];

          if (PointBOLW.OwnerID = r^.PlatformID) and
            (PointBOLW.LauncherIndex = r^.BOLWLauncherIndex) and
            (PointBOLW.IndexPoint = r^.BOLWIndex) then
          begin
            PointBOLW.IsOriginal := False;
            PointBOLW.IsChange := True;
            PointBOLW.PointBOLW_X1 := r^.BOLW_PointX;
            PointBOLW.PointBOLW_Y1 := r^.BOLW_POintY;
          end;
        end;
      end;
      5 :
      begin
        VehicleWeapon.LauncherNumber := r^.LauncherNumber;
        VehicleWeapon.LaunchDelay := r^.LaunchDelay;
      end;
      6 :
      begin
        VehicleWeapon.LaunchDelay := 0;
      end;
      7 :
      begin
        VehicleWeapon.BOL_Movement.BOL_Point1_X := r^.BOLW_Point1_X;
        VehicleWeapon.BOL_Movement.BOL_Point1_Y := r^.BOLW_Point1_Y;
        VehicleWeapon.BOL_Movement.BOL_Point2_X := r^.BOLW_Point2_X;
        VehicleWeapon.BOL_Movement.BOL_Point2_Y := r^.BOLW_Point2_Y;
        VehicleWeapon.BOL_Movement.BOL_Point3_X := r^.BOLW_Point3_X;
        VehicleWeapon.BOL_Movement.BOL_Point3_Y := r^.BOLW_Point3_Y;
        VehicleWeapon.BOL_Movement.BOL_Point4_X := r^.BOLW_Point4_X;
        VehicleWeapon.BOL_Movement.BOL_Point4_Y := r^.BOLW_Point4_Y;
        VehicleWeapon.BOL_Movement.End_PointBOl_X := r^.EndBOLW_Point_X;
        VehicleWeapon.BOL_Movement.End_PointBOl_Y := r^.EndBOLW_Point_Y;
        VehicleWeapon.BOL_Movement.Start_PointBOl_X := r^.StartBOLW_Point_X;
        VehicleWeapon.BOL_Movement.Start_PointBOl_Y := r^.StartBOLW_Point_Y
      end;
      8 :
      begin
        VehicleWeapon.SeekerRangeTurn := r^.SeekerTurnOnRange;
        VehicleWeapon.HitMode.HAFO := r^.HAFO;
        VehicleWeapon.DefaultAltitude := r^.CruiseAltitude;

        case r^.PopUp of
          1 : VehicleWeapon.HitMode.PopUp_Move := ppPopUP;
          2 : VehicleWeapon.HitMode.PopUp_Move := ppSeaSkim;
        end;
      end;
      9 :
      begin
        New(OriginalSaved);

        with OriginalSaved^ do
        begin
          ShipID := r^.PlatformID;
          WeaponName := r^.WeaponName;
          WaypointType := wtBOLW;
          PointIndex := r^.BOLWIndex;
          PointLauncherIndex := r^.BOLWLauncherIndex;
          PointX := r^.BOLW_PointX;
          PointY := r^.BOLW_POintY;
          Action := r^.Action;
        end;
        OwnVehicle.OriginalMissileWaypoint.Add(OriginalSaved);
      end;
      11:
      begin
        for i := 0 to VehicleWeapon.BOLW_PointList.Count - 1 do
        begin
          PointBOLW := VehicleWeapon.BOLW_PointList.Items[i];

          if (PointBOLW.IndexPoint = r^.BOLWIndex) and
            (PointBOLW.LauncherIndex = r^.BOLWLauncherIndex) then
          begin
            SimPointBOLW_VehicleMissile.deleteObject(PointBOLW);
            Break;
          end;
        end;
        VehicleWeapon.BOLW_PointList.Delete(i);
      end;
      12:
      begin
        for i := 0 to VehicleWeapon.BOLW_PointList.Count - 1 do
        begin
          PointBOLW := VehicleWeapon.BOLW_PointList.Items[i];
          PointBOLW.IsEdit := True;
        end;
      end;
      13:
      begin
        for i := VehicleWeapon.BOLW_PointList.Count - 1 downto 0 do
        begin
          PointBOLW := VehicleWeapon.BOLW_PointList.Items[i];

          if PointBOLW.LauncherIndex = r^.BOLWLauncherIndex then
          begin
            SimPointBOLW_VehicleMissile.deleteObject(PointBOLW);
            VehicleWeapon.BOLW_PointList.Delete(i);
          end;
        end;
      end;
    end;
  end;
end;

//procedure TT3SimManager.netRecv_CmdTorpedoSync(apRec: PAnsiChar; aSize: Word);
//var
//  r : ^TrecTorpedoSync;
//  OwnPlatform   : TT3PlatformInstance;
//  OwnVehicle    : TT3Vehicle;
//  VehicleWeapon : TT3TorpedoesOnVehicle;

//  Focused_weapon  : TSimObject;
//begin
//  r := @apRec^;

//  OwnPlatform := FindT3PlatformByID(r^.ParentPlatformID);
//  if OwnPlatform is TT3Vehicle then
//  begin
//    OwnVehicle := TT3Vehicle(OwnPlatform);
//    Focused_weapon := TT3TorpedoesOnVehicle(OwnVehicle.getWeapon(r^.WeaponName));
//    VehicleWeapon  := TT3TorpedoesOnVehicle(Focused_weapon);

//    VehicleWeapon.TipeTorpedo   := r^.TorpType;
//    VehicleWeapon.LaunchBearing := r^.TorpBearing;
//    VehicleWeapon.SearchRadius  := r^.SearchRadius;
//    VehicleWeapon.SearchDepth   := r^.SearchDepth;
//    VehicleWeapon.SafetyCeiling := r^.SafetyCeiling;
//    VehicleWeapon.SeekerRange   := r^.SeekerRange;
//  end;
//end;

procedure TT3SimManager.netRecv_SincMissileEnvi(apRec: PAnsiChar; aSize: Word);
var
  r : ^TrecMissile_Envi;
  OwnPlatform   : TT3PlatformInstance;
  OwnVehicle    : TT3Vehicle;
  VehicleWeapon : TT3MissilesOnVehicle;
  HybridWeapon  : TT3HybridOnVehicle;
  Focused_weapon  : TSimObject;
begin
  r := @apRec^;

  OwnPlatform := FindT3PlatformByID(r^.platformID);
  if OwnPlatform is TT3Vehicle then
  begin
    OwnVehicle := TT3Vehicle(OwnPlatform);

    if r^.isHybrid then
    begin
      //choco : saya modif jadi gini. di sintax yg dicomment di bawah pada line 2347
      //kalau didebug selalu dilewati.
      Focused_weapon := TT3Weapon(OwnVehicle.getWeapon(r^.WeaponIndex));
      if Focused_weapon is TT3HybridOnVehicle then
        HybridWeapon := TT3HybridOnVehicle(Focused_weapon)
      else
        HybridWeapon := nil;

      if Assigned(HybridWeapon) then
      begin
        HybridWeapon.Aimpoint_Movement.PositionX := r^.Missile_PositionX;
        HybridWeapon.Aimpoint_Movement.PositionY := r^.Missile_PositionY;
      end
      else
      begin
        if Assigned(OnLogEventStr) then
          OnLogEventStr('TT3SimManager.netRecv_SincMissileEnvi', 'Not Assigned Missile Hybrid Weapon!');
      end;

//      Focused_weapon := TT3HybridOnVehicle(OwnVehicle.getWeapon(r^.WeaponName));
//      HybridWeapon   := TT3HybridOnVehicle(Focused_weapon);

//      HybridWeapon.Aimpoint_Movement.PositionX := r^.Missile_PositionX;
//      HybridWeapon.Aimpoint_Movement.PositionY := r^.Missile_PositionY;
    end
    else
    begin
      //Focused_weapon := TT3MissilesOnVehicle(OwnVehicle.getWeapon(r^.WeaponName));
      Focused_weapon := TT3Weapon(OwnVehicle.getWeapon(r^.WeaponIndex, TT3MissilesOnVehicle));
      if Assigned(Focused_weapon) then
      begin
        if Focused_weapon is TT3MissilesOnVehicle then
        begin
          VehicleWeapon  := TT3MissilesOnVehicle(Focused_weapon);

          case r^.Missile_Kind of
            Integer(wcMissileAirToSurfaceSubsurface) :
              VehicleWeapon.WeaponCategory := wcMissileAirToSurfaceSubsurface;
            Integer(wcMissileSurfaceSubsurfaceToSurfaceSubsurface) :
              VehicleWeapon.WeaponCategory := wcMissileSurfaceSubsurfaceToSurfaceSubsurface;
            Integer(wcMissileSurfaceSubsurfaceToAir) :
              VehicleWeapon.WeaponCategory := wcMissileSurfaceSubsurfaceToAir;
            Integer(wcMissileAirToAir) :
              VehicleWeapon.WeaponCategory := wcMissileAirToAir;
            Integer(wcMissileLandAttack) :
              VehicleWeapon.WeaponCategory := wcMissileLandAttack;
          end;

          case r^.MIssile_Method of
            Integer(mfmRBl)      : VehicleWeapon.FiringMode := mfmRBl;
            Integer(mfmRBLW)     : VehicleWeapon.FiringMode := mfmRBlW;
            Integer(mfmBOL)      : VehicleWeapon.FiringMode := mfmBOL;
            Integer(mfmBOLW)     : VehicleWeapon.FiringMode := mfmBOLW;
            Integer(mfmDirect)   : VehicleWeapon.FiringMode := mfmDirect;
            Integer(mfmAimpoint) :
            begin
              VehicleWeapon.FiringMode := mfmAimpoint;
              VehicleWeapon.Aimpoint_Movement.PositionX := r^.Missile_PositionX;
              VehicleWeapon.Aimpoint_Movement.PositionY := r^.Missile_PositionY;
            end;
            Integer(mfmBearing)  :
            begin
              VehicleWeapon.FiringMode := mfmBearing;
              VehicleWeapon.Bearing_Movement.BearingLaunch := r^.Bearing;
            end;
          end;
        end
        else
        begin
          if Assigned(OnLogEventStr) then
            OnLogEventStr('TT3SimManager.netRecv_SincMissileEnvi', 'Weapon is not TT3MissilesOnVehicle!');
        end;
      end
      else
      begin
        if Assigned(OnLogEventStr) then
          OnLogEventStr('TT3SimManager.netRecv_SincMissileEnvi', 'Not Assigned Missile Weapon!');
      end;
    end;
  end;
end;

procedure TT3SimManager.netRecv_SincRBLWMissile(apRec: PAnsiChar; aSize: Word);
var
  r : ^TrecSinc_RBLW;
  OwnPlatform    : TT3PlatformInstance;
  OwnVehicle     : TT3Vehicle;
  VehicleWeapon  : TT3MissilesOnVehicle;
  Focused_weapon : TObject;
  PointRBLW      : TPointVehicleMissileRBLW;
  i, j : Integer;
  OriginalSaved   : PRec_WeaponWaypoint_Original;
begin
  r := @apRec^;

  OwnPlatform := FindT3PlatformByID(r^.platformID);
  if OwnPlatform is TT3Vehicle then
  begin
    OwnVehicle := TT3Vehicle(OwnPlatform);
    //Focused_weapon := TT3MissilesOnVehicle(OwnVehicle.getWeapon(r^.WeaponName));
    Focused_weapon := OwnVehicle.getWeapon(r^.WeaponIndex, TT3MissilesOnVehicle);

    if Focused_weapon <> nil then
    begin
      VehicleWeapon  := TT3MissilesOnVehicle(Focused_weapon);

      case r^.cmd of
        0 : //Add Waypoint
        begin
          PointRBLW := TPointVehicleMissileRBLW.Create(r^.RBLW_PointX,
            r^.RBLW_POintY, r^.RBLWIndex, r^.RBLWLauncherIndex, r^.PlatformID);

          PointRBLW.IsEdit := r^.IsAdd;

          VehicleWeapon.RBLW_PointList.Add(PointRBLW);
          SimPointRBLW_VehicleMissile.addObject(PointRBLW);
        end;
        1 : //Cancel Change Waypoint
        begin
          for i := OwnVehicle.OriginalMissileWaypoint.Count - 1 downto 0 do
          begin
            OriginalSaved := OwnVehicle.OriginalMissileWaypoint.Items[i];

            if OriginalSaved.WaypointType <> wtRBLW then
              Continue;

            case OriginalSaved.Action of
              waMove:
              begin
                for j := 0 to VehicleWeapon.RBLW_PointList.Count - 1 do
                begin
                  PointRBLW := VehicleWeapon.RBLW_PointList.Items[j];

                  if (OriginalSaved.ShipID = r^.PlatformID) and
                    (OriginalSaved.PointIndex = PointRBLW.IndexPoint) and
                    (OriginalSaved.PointLauncherIndex = PointRBLW.LauncherIndex) then
                  begin
                    PointRBLW.IsChange      := False;
                    PointRBLW.IsOriginal    := True;
                    PointRBLW.PointRBLW_X1  := OriginalSaved.PointX;
                    PointRBLW.PointRBLW_Y1  := OriginalSaved.PointY;
                    Break;
                  end;
                end;
              end;
              waInsert:
              begin
                for j := 0 to VehicleWeapon.RBLW_PointList.Count - 1 do
                begin
                  PointRBLW := VehicleWeapon.RBLW_PointList.Items[j];

                  if (OriginalSaved.ShipID = r^.PlatformID) and
                    (OriginalSaved.PointIndex = PointRBLW.IndexPoint) and
                    (OriginalSaved.PointLauncherIndex = PointRBLW.LauncherIndex) then
                  begin
                    SimPointRBLW_VehicleMissile.deleteObject(PointRBLW);
                    VehicleWeapon.RBLW_PointList.Delete(j);
                    Break;
                  end;
                end;
              end;
              waDelete:
              begin
                PointRBLW := TPointVehicleMissileRBLW.Create(OriginalSaved.PointX,
                  OriginalSaved.PointY, OriginalSaved.PointIndex,
                  OriginalSaved.PointLauncherIndex, OriginalSaved.ShipID);

                VehicleWeapon.RBLW_PointList.Add(PointRBLW);
                SimPointRBLW_VehicleMissile.addObject(PointRBLW);
              end;
            end;
          end;
          OwnVehicle.OriginalMissileWaypoint.Clear;

          for i := 0 to VehicleWeapon.RBLW_PointList.Count - 1 do
          begin
            PointRBLW := VehicleWeapon.RBLW_PointList.Items[i];
            PointRBLW.IsEdit := False;
          end;
        end;
        2 : //Apply Change Waypoint
        begin
          for i := 0 to VehicleWeapon.RBLW_PointList.Count - 1 do
          begin
            PointRBLW := VehicleWeapon.RBLW_PointList.Items[i];
            PointRBLW.IsEdit := False;
            PointRBLW.IsChange := False;
            PointRBLW.IsOriginal := True;
          end;
          OwnVehicle.OriginalMissileWaypoint.Clear;
        end;
        3 :
        begin
          for i := 0 to VehicleWeapon.RBLW_PointList.Count - 1 do
          begin
            PointRBLW := VehicleWeapon.RBLW_PointList.Items[i];
            SimPointRBLW_VehicleMissile.deleteObject(PointRBLW);
          end;

          VehicleWeapon.RBLW_PointList.Clear;
          VehicleWeapon.isONRBLW := False;

          EventManager.AbortMissileLaunch(OwnVehicle.InstanceIndex, VehicleWeapon.InstanceIndex);
        end;
        4 : //Move Selected Waypoint Long Lat
        begin
          for i := 0 to VehicleWeapon.RBLW_PointList.Count - 1 do
          begin
            PointRBLW := VehicleWeapon.RBLW_PointList[i];

            if (PointRBLW.OwnerID = r^.PlatformID) and
              (PointRBLW.LauncherIndex = r^.RBLWLauncherIndex) and
              (PointRBLW.IndexPoint = r^.RBLWIndex) then
            begin
              PointRBLW.IsOriginal := False;
              PointRBLW.IsChange := True;
              PointRBLW.PointRBLW_X1 := r^.RBLW_PointX;
              PointRBLW.PointRBLW_Y1 := r^.RBLW_POintY;
            end;
          end;
        end;
        5 :
        begin
          VehicleWeapon.LauncherNumber := r^.LauncherNumber;
          VehicleWeapon.LaunchDelay := r^.LaunchDelay;
        end;
        6 :
        begin
          VehicleWeapon.LaunchDelay := 0;
        end;
        7 :
        begin
          VehicleWeapon.LaunchDelay := r^.LaunchDelay;
        end;
        8 :
        begin
          VehicleWeapon.SeekerRangeTurn := r^.SeekerTurnOnRange;
          VehicleWeapon.HitMode.HAFO := r^.HAFO;
          VehicleWeapon.DefaultAltitude := r^.CruiseAltitude;

          case r^.PopUp of
           1 : VehicleWeapon.HitMode.PopUp_Move := ppPopUP;
           2 : VehicleWeapon.HitMode.PopUp_Move := ppSeaSkim;
          end;
        end;
        9 :
        begin
          New(OriginalSaved);

          with OriginalSaved^ do
          begin
            ShipID := r^.PlatformID;
            WeaponName := r^.WeaponName;
            WaypointType := wtRBLW;
            PointIndex := r^.RBLWIndex;
            PointLauncherIndex := r^.RBLWLauncherIndex;
            PointX := r^.RBLW_PointX;
            PointY := r^.RBLW_POintY;
            Action := r^.Action;
          end;
          OwnVehicle.OriginalMissileWaypoint.Add(OriginalSaved);
        end;
  //      10:
  //      begin
  //        PointRBLW := TPointVehicleMissileRBLW.Create(VehicleWeapon.RBLW_PointX, VehicleWeapon.RBLW_PointY,
  //            r^.RBLWIndex, r^.RBLWLauncherIndex, r^.PlatformID);

  //        PointRBLW.IsEdit      := True;

  //        VehicleWeapon.RBLW_PointList.Add(PointRBLW);
  //        SimPointRBLW_VehicleMissile.addObject(PointRBLW);
  //      end;
        11:
        begin
          for i := 0 to VehicleWeapon.RBLW_PointList.Count - 1 do
          begin
            PointRBLW := VehicleWeapon.RBLW_PointList.Items[i];

            if (PointRBLW.IndexPoint = r^.RBLWIndex) and
              (PointRBLW.LauncherIndex = r^.RBLWLauncherIndex) then
            begin
              SimPointRBLW_VehicleMissile.deleteObject(PointRBLW);
              Break;
            end;
          end;
          VehicleWeapon.RBLW_PointList.Delete(i);
        end;
        12:
        begin
          for i := 0 to VehicleWeapon.RBLW_PointList.Count - 1 do
          begin
            PointRBLW := VehicleWeapon.RBLW_PointList.Items[i];
            PointRBLW.IsEdit := True;
          end;
        end;
        13:
        begin
          for i := VehicleWeapon.RBLW_PointList.Count - 1 downto 0 do
          begin
            PointRBLW := VehicleWeapon.RBLW_PointList.Items[i];

            if PointRBLW.LauncherIndex = r^.RBLWLauncherIndex then
            begin
              SimPointRBLW_VehicleMissile.deleteObject(PointRBLW);
              VehicleWeapon.RBLW_PointList.Delete(i);
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TT3SimManager.netRecv_SincWaypoint(apRec: PAnsiChar; aSize: Word);
var
  r : ^TrecSinc_Waypoint;
  OwnPlatform, targetPlatform : TT3PlatformInstance;
  OwnVehicle, targetVehicle : TT3Vehicle;
  Behav : TScripted_Behav_Definition;
  FFocusedBehav : TScripted_Behav_Definition;
  WpEvent, ObjEvent, dev : TObject;
  i, j: integer;
  obj : TObject;
  wp : TScripted_Waypoint_Data;
begin
  r := @apRec^;

  OwnPlatform := FindT3PlatformByID(r^.platformID);
  if OwnPlatform is TT3Vehicle then
  begin
    OwnVehicle := TT3Vehicle(OwnPlatform);

//    if (r^.Cmd = 0) and ((r^.Mode = 8) or (r^.Mode = 9)) then
//      EventManager.OnWaypointChange(4); //choco

    case r^.Cmd of
      0 : //General Command
      begin
        case r^.Mode of
          0 : //Add Waypoint
          begin
            Behav := TScripted_Behav_Definition.Create;

            with Behav.FData do
            begin
              Scripted_Event_Index  := r^.Scripted_Event_Index;
              Waypoint_Latitude     := r^.Waypoint_Latitude;
              Waypoint_Longitude    := r^.Waypoint_Longitude;
              Speed                 := r^.Speed;
              Altitude              := r^.Altitude;
              Time_Waypoint         := Byte(r^.CheckArrival);
              Time_2_Waypoint       := r^.TimeArrival;
              StartMode             := r^.StartMode;
              StartAt               := r^.StartAt;
            end;

            OwnVehicle.Waypoints.VisibleCircleWP := vGameDataSetting.VisibleCircleWP;
            OwnVehicle.Waypoints.Add(Behav, nil);
            OwnVehicle.Waypoints.Enabled := True;

            //Add Waypoint Event
            with OwnVehicle do
            begin
              for i := 0 to Devices.Count - 1 do
              begin
                dev :=  Devices.Items[i];

                // radar
                if dev is TT3Radar then
                begin
                  objEvent  := TScripted_Radar_Event.Create;
                  with TScripted_Radar_Event(objEvent).FData do
                  begin
                    Scripted_Event_Index := r^.Scripted_Event_Index;
                    Radar_Index          := TT3Radar(dev).InstanceIndex;
                    Radar_Control        := 2; //no change
                  end;

                  wpevent   := TWaypointEventClass.Create;
                  TWaypointEventClass(wpevent).FType := wetRadar;
                  TWaypointEventClass(wpevent).FData := objEvent;
                  TWaypointEventClass(wpevent).FEnable := false;
                  TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3Radar(dev).InstanceIndex;

                  Waypoints.Add(behav,TWaypointEventClass(wpevent));
                end
                // sonar
                else if dev is TT3Sonar then
                begin
                  objEvent  := TScripted_Sonar_Event.Create;
                  with TScripted_Sonar_Event(objEvent).FData do
                  begin
                    Scripted_Event_Index := r^.Scripted_Event_Index;
                    Sonar_Index          := TT3Sonar(dev).InstanceIndex;
                    Sonar_Control        := 2; //no change
                  end;

                  wpevent   := TWaypointEventClass.Create;
                  TWaypointEventClass(wpevent).FType := wetSonar;
                  TWaypointEventClass(wpevent).FData := objEvent;
                  TWaypointEventClass(wpevent).FEnable := false;
                  TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3Sonar(dev).InstanceIndex;

                  Waypoints.Add(behav,TWaypointEventClass(wpevent));
                end
                // iff
                else if dev is TT3IFFSensor then
                begin
                  objEvent  := TScripted_IFF_Event.Create;
                  with TScripted_IFF_Event(objEvent).FData do
                  begin
                    Scripted_Event_Index   := r^.Scripted_Event_Index;
                    IFF_Instance_Index     := TT3IFFSensor(dev).InstanceIndex;

                    IFF_Interrogator_Control  := 2; //no change
                    IFF_Transponder_Control   := 2; //no change
                  end;

                  // wp event untuk transpondernya
                  wpevent   := TWaypointEventClass.Create;
                  TWaypointEventClass(wpevent).FType := wetIFFTransponder;
                  TWaypointEventClass(wpevent).FData := objEvent;
                  TWaypointEventClass(wpevent).FEnable := false;
                  TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3IFFSensor(dev).InstanceIndex;

                  Waypoints.Add(behav,TWaypointEventClass(wpevent));

                  // wp event untuk interogatornya
                  wpevent   := TWaypointEventClass.Create;
                  TWaypointEventClass(wpevent).FType := wetIFFInterogator;
                  TWaypointEventClass(wpevent).FData := objEvent;
                  TWaypointEventClass(wpevent).FEnable := false;
                  TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3IFFSensor(dev).InstanceIndex;

                  Waypoints.Add(behav,TWaypointEventClass(wpevent));
                end;
              end;

              //sonobuoy
              if getDeviceCount(TT3SonobuoyOnVehicle) > 0 then
              begin
                objEvent  := TScripted_Sonobuoy_Event.Create;
                with TScripted_Sonobuoy_Event(objEvent).FData do
                begin
                  Scripted_Event_Index    := r^.Scripted_Event_Index;
                  List_Index              := -1;
                  SonobuoyType            := 0;
                  SonobuoyMode            := 0; // Passive
                  SonobuoyDepth           := 35;
                  SonobuoySpacing         := 0.25;
                  SonobuoyQuantity        := 1;
                  DeploySonoUntilNextWp   := False;
                end;

                wpevent   := TWaypointEventClass.Create;
                TWaypointEventClass(wpevent).FType := wetSonobuoy;
                TWaypointEventClass(wpevent).FData := objEvent;
                TWaypointEventClass(wpevent).FEnable := false;
                TWaypointEventClass(wpevent).FObjectInstanceIndex := getFirstDeviceID(TT3SonobuoyOnVehicle);

                Waypoints.Add(behav,TWaypointEventClass(wpevent));
              end;

              //Check Weapon
              //5 Weapon / 1 Coordinat Wayoint
              for i := 1 to 5 do
              begin
                objEvent := TScripted_Weapon_Event.Create;
                with TScripted_Weapon_Event(objEvent).FData do
                begin
                  Scripted_Event_Index := r^.Scripted_Event_Index;
                  List_Index           := -1;
                  Salvo_Size           := 1;
                  Target_Index         := 0;
                  Weapon_Type          := 0;
                end;

                wpevent   := TWaypointEventClass.Create;

                case i of
                  1 : TWaypointEventClass(wpevent).FType := wetWeapon1;
                  2 : TWaypointEventClass(wpevent).FType := wetWeapon2;
                  3 : TWaypointEventClass(wpevent).FType := wetWeapon3;
                  4 : TWaypointEventClass(wpevent).FType := wetWeapon4;
                  5 : TWaypointEventClass(wpevent).FType := wetWeapon5;
                end;

                TWaypointEventClass(wpevent).FData := objEvent;
                TWaypointEventClass(wpevent).FEnable := false;
                TWaypointEventClass(wpevent).FObjectInstanceIndex := 0;

                Waypoints.Add(behav,TWaypointEventClass(wpevent));
              end;

              //mine
              if getWeaponCount(TT3MineOnVehicle) > 0 then
              begin
                objEvent  := TScripted_Mine_Event.Create;
                with TScripted_Mine_Event(objEvent).FData do
                begin
                  Scripted_Event_Index    := r^.Scripted_Event_Index;
                  List_Index              := -1;
                  MineType                := 0;
                  MineDepth               := 50;
                  MineSpacing             := 5.00;
                  MineQuantity            := 1;
                  DeployMineUntilNextWp   := False;
                end;

                wpevent   := TWaypointEventClass.Create;
                TWaypointEventClass(wpevent).FType := wetMine;
                TWaypointEventClass(wpevent).FData := objEvent;
                TWaypointEventClass(wpevent).FEnable := false;
                TWaypointEventClass(wpevent).FObjectInstanceIndex := getFirstWeaponID(TT3MineOnVehicle);

                Waypoints.Add(behav,TWaypointEventClass(wpevent));
              end;

              //countermeasure
              for i := 0 to Devices.Count - 1 do
              begin
                dev :=  Devices.Items[i];

                if dev is TT3RadarNoiseJammerOnVehicle then
                begin
                  objEvent  := TScripted_Chaff_Event.Create;
                  with TScripted_Chaff_Event(objEvent).FData do
                  begin
                    Scripted_Event_Index    := r^.Scripted_Event_Index;
                    Chaff_Instance_Index    := TT3RadarNoiseJammerOnVehicle(dev).InstanceIndex;
                    Countermeasure_Control  := 2; //no change
                  end;

                  wpevent   := TWaypointEventClass.Create;
                  TWaypointEventClass(wpevent).FType := wetCounterMeasure;
                  TWaypointEventClass(wpevent).FData := objEvent;
                  TWaypointEventClass(wpevent).FEnable := false;
                  TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3RadarNoiseJammerOnVehicle(dev).InstanceIndex;

                  Waypoints.Add(behav,TWaypointEventClass(wpevent));
                end;
              end;

              if VehicleDefinition.FData.HF_Link_Capable then
              begin
                objEvent  := TScripted_Datalink_Event.Create;
                with TScripted_Datalink_Event(objEvent).FData do
                begin
                  Scripted_Event_Index    := r^.Scripted_Event_Index;
                  Datalink_Control        := 2; //no change
                end;

                wpevent   := TWaypointEventClass.Create;
                TWaypointEventClass(wpevent).FType := wetComHF;
                TWaypointEventClass(wpevent).FData := objEvent;
                TWaypointEventClass(wpevent).FEnable := false;
                TWaypointEventClass(wpevent).FObjectInstanceIndex := 0;

                Waypoints.Add(behav,TWaypointEventClass(wpevent));
              end;

              if VehicleDefinition.FData.UHF_Link_Capable then
              begin
                objEvent  := TScripted_Datalink_Event.Create;
                with TScripted_Datalink_Event(objEvent).FData do
                begin
                  Scripted_Event_Index    := r^.Scripted_Event_Index;
                  Datalink_Control        := 2; //no change
                end;

                wpevent   := TWaypointEventClass.Create;
                TWaypointEventClass(wpevent).FType := wetComUHF;
                TWaypointEventClass(wpevent).FData := objEvent;
                TWaypointEventClass(wpevent).FEnable := false;
                TWaypointEventClass(wpevent).FObjectInstanceIndex := 0;

                Waypoints.Add(behav,TWaypointEventClass(wpevent));
              end;
            end;

            EventManager.OnWaypointDataChange(r^);
          end;
          1 :
          begin
            //Delete Waypoint
            OwnVehicle.Waypoints.Delete(r^.WaypointIndex);

            if OwnVehicle.Waypoints.RunWaypoint then
              OwnVehicle.Waypoints.RestartWaypoint;

            EventManager.OnWaypointChange(1);
          end;
          2 :
          begin
            //Clear Waypoint
            OwnVehicle.Waypoints.Enabled := False;
            OwnVehicle.Waypoints.Clear;

            TVehicle_Definition(OwnVehicle.UnitDefinition).GuidanceType := vgtStraightLine;

            EventManager.OnWaypointChange(1);
          end;
          3 :
          begin
            //Change Waypoint LongLat
            obj := OwnVehicle.Waypoints.Behaviour[r^.WaypointIndex];

            if Assigned(obj) then
            begin
              FFocusedBehav := TScripted_Behav_Definition(obj);
              FFocusedBehav.FData.Waypoint_Longitude := r^.Waypoint_Longitude;
              FFocusedBehav.FData.Waypoint_Latitude := r^.Waypoint_Latitude;

              EventManager.OnWaypointDataChange(r^);
            end;
          end;
          4 :
          begin
            //Add Speed
            obj := OwnVehicle.Waypoints.Behaviour[r^.WaypointIndex];

            if Assigned(obj) then
            begin
              FFocusedBehav := TScripted_Behav_Definition(obj);
              FFocusedBehav.FData.Speed := r^.Speed;

              EventManager.OnWaypointDataChange(r^);
            end;
          end;
          5 :
          begin
            //Altitude/Depth
            obj := OwnVehicle.Waypoints.Behaviour[r^.WaypointIndex];

            if Assigned(obj) then
            begin
              FFocusedBehav := TScripted_Behav_Definition(obj);
              FFocusedBehav.FData.Altitude := r^.Altitude;

              EventManager.OnWaypointDataChange(r^);
            end;
          end;
          6 :
          begin
            //Arrival Time
          end;
          7 :
          begin
            case r^.index of
              0 : OwnVehicle.Waypoints.Termination := wtLH;
              1 : OwnVehicle.Waypoints.Termination := wtTH;
              2 : OwnVehicle.Waypoints.Termination := wtRP;
              3 : OwnVehicle.Waypoints.Termination := wtRP2;
              4 : OwnVehicle.Waypoints.Termination := wtRB;
              5 : OwnVehicle.Waypoints.Termination := wtRM;
              6 : OwnVehicle.Waypoints.Termination := wtSp;
            end;

            EventManager.OnWaypointChange(3);
          end;
          8 :
          begin
            OwnVehicle.Waypoints.OldRange := 9999999999;
            OwnVehicle.Waypoints.Enabled := true;
            //OwnVehicle.Waypoints.RestartWaypoint;
            OwnVehicle.Waypoints.Apply;
            OwnVehicle.Waypoints.RunWaypoint := True;
            OwnVehicle.Waypoints.TerminationHeading := r^.TerminationHeading;
            TVehicle_Definition(OwnVehicle.UnitDefinition).GuidanceType := vgtWaypoint;
          end;
          9 :
          begin
            //Cancel
          end;
          10:
          begin
            obj := OwnVehicle.Waypoints.Behaviour[r^.WaypointIndex];

            if Assigned(obj) then
            begin
              FFocusedBehav := TScripted_Behav_Definition(obj);
              FFocusedBehav.FData.StartMode := r^.StartMode;

              EventManager.OnWaypointDataChange(r^);
            end;
          end;
          11:
          begin
            obj := OwnVehicle.Waypoints.Behaviour[r^.WaypointIndex];

            if Assigned(obj) then
            begin
              FFocusedBehav := TScripted_Behav_Definition(obj);
              FFocusedBehav.FData.StartAt := r^.StartAt;

              EventManager.OnWaypointDataChange(r^);
            end;
          end;
          12://copy waypoint from another platform
          begin
            targetPlatform := FindT3PlatformByID(r^.PlatformIDCopy);
            if Assigned(targetVehicle) then
            begin
              if targetPlatform is TT3Vehicle then
              begin
                targetVehicle := TT3Vehicle(targetPlatform);

                for j:= 0 to targetVehicle.Waypoints.Count - 1 do
                begin
                  obj := targetVehicle.Waypoints.Behaviour[j];
                  if Assigned(obj) then
                  begin
                    FFocusedBehav := TScripted_Behav_Definition(obj);

                    Behav := TScripted_Behav_Definition.Create;

                    with Behav.FData do
                    begin
                      Scripted_Event_Index  := FFocusedBehav.FData.Scripted_Event_Index;
                      Waypoint_Latitude     := FFocusedBehav.FData.Waypoint_Latitude;
                      Waypoint_Longitude    := FFocusedBehav.FData.Waypoint_Longitude;

                      if FFocusedBehav.FData.Speed > OwnVehicle.Mover.MaxSpeed then
                        Speed := OwnVehicle.Mover.MaxSpeed
                      else if FFocusedBehav.FData.Speed < OwnVehicle.Mover.MinSpeed then
                        Speed := OwnVehicle.Mover.MinSpeed
                      else
                        Speed := FFocusedBehav.FData.Speed;

                      Altitude              := FFocusedBehav.FData.Altitude;
                      Time_Waypoint         := FFocusedBehav.FData.Time_Waypoint;
                      Time_2_Waypoint       := FFocusedBehav.FData.Time_2_Waypoint;
                      StartMode             := FFocusedBehav.FData.StartMode;
                      StartAt               := FFocusedBehav.FData.StartAt;
                    end;

                    OwnVehicle.Waypoints.VisibleCircleWP := vGameDataSetting.VisibleCircleWP;
                    OwnVehicle.Waypoints.Add(Behav, nil);
                    OwnVehicle.Waypoints.Enabled := True;

                    //Add Waypoint Event
                    with OwnVehicle do
                    begin
                      for i := 0 to Devices.Count - 1 do
                      begin
                        dev :=  Devices.Items[i];

                        // radar
                        if dev is TT3Radar then
                        begin
                          objEvent  := TScripted_Radar_Event.Create;
                          with TScripted_Radar_Event(objEvent).FData do
                          begin
                            Scripted_Event_Index := FFocusedBehav.FData.Scripted_Event_Index;
                            Radar_Index          := TT3Radar(dev).InstanceIndex;
                            Radar_Control        := 2; //no change
                          end;

                          wpevent   := TWaypointEventClass.Create;
                          TWaypointEventClass(wpevent).FType := wetRadar;
                          TWaypointEventClass(wpevent).FData := objEvent;
                          TWaypointEventClass(wpevent).FEnable := false;
                          TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3Radar(dev).InstanceIndex;

                          Waypoints.Add(behav,TWaypointEventClass(wpevent));
                        end
                        // sonar
                        else if dev is TT3Sonar then
                        begin
                          objEvent  := TScripted_Sonar_Event.Create;
                          with TScripted_Sonar_Event(objEvent).FData do
                          begin
                            Scripted_Event_Index := FFocusedBehav.FData.Scripted_Event_Index;
                            Sonar_Index          := TT3Sonar(dev).InstanceIndex;
                            Sonar_Control        := 2; //no change
                          end;

                          wpevent   := TWaypointEventClass.Create;
                          TWaypointEventClass(wpevent).FType := wetSonar;
                          TWaypointEventClass(wpevent).FData := objEvent;
                          TWaypointEventClass(wpevent).FEnable := false;
                          TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3Sonar(dev).InstanceIndex;

                          Waypoints.Add(behav,TWaypointEventClass(wpevent));
                        end
                        // iff
                        else if dev is TT3IFFSensor then
                        begin
                          objEvent  := TScripted_IFF_Event.Create;
                          with TScripted_IFF_Event(objEvent).FData do
                          begin
                            Scripted_Event_Index   := FFocusedBehav.FData.Scripted_Event_Index;
                            IFF_Instance_Index     := TT3IFFSensor(dev).InstanceIndex;

                            IFF_Interrogator_Control  := 2; //no change
                            IFF_Transponder_Control   := 2; //no change
                          end;

                          // wp event untuk transpondernya
                          wpevent   := TWaypointEventClass.Create;
                          TWaypointEventClass(wpevent).FType := wetIFFTransponder;
                          TWaypointEventClass(wpevent).FData := objEvent;
                          TWaypointEventClass(wpevent).FEnable := false;
                          TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3IFFSensor(dev).InstanceIndex;

                          Waypoints.Add(behav,TWaypointEventClass(wpevent));

                          // wp event untuk interogatornya
                          wpevent   := TWaypointEventClass.Create;
                          TWaypointEventClass(wpevent).FType := wetIFFInterogator;
                          TWaypointEventClass(wpevent).FData := objEvent;
                          TWaypointEventClass(wpevent).FEnable := false;
                          TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3IFFSensor(dev).InstanceIndex;

                          Waypoints.Add(behav,TWaypointEventClass(wpevent));
                        end;
                      end;

                      //sonobuoy
                      if getDeviceCount(TT3SonobuoyOnVehicle) > 0 then
                      begin
                        objEvent  := TScripted_Sonobuoy_Event.Create;
                        with TScripted_Sonobuoy_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index    := FFocusedBehav.FData.Scripted_Event_Index;
                          List_Index              := -1;
                          SonobuoyType            := 0;
                          SonobuoyMode            := 0; // Passive
                          SonobuoyDepth           := 35;
                          SonobuoySpacing         := 0.25;
                          SonobuoyQuantity        := 1;
                          DeploySonoUntilNextWp   := False;
                        end;

                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetSonobuoy;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := getFirstDeviceID(TT3SonobuoyOnVehicle);

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end;

                      //Check Weapon
                      //5 Weapon / 1 Coordinat Wayoint
                      for i := 1 to 5 do
                      begin
                        objEvent := TScripted_Weapon_Event.Create;
                        with TScripted_Weapon_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index := FFocusedBehav.FData.Scripted_Event_Index;
                          List_Index           := -1;
                          Salvo_Size           := 1;
                          Target_Index         := 0;
                          Weapon_Type          := 0;
                        end;

                        wpevent   := TWaypointEventClass.Create;

                        case i of
                          1 : TWaypointEventClass(wpevent).FType := wetWeapon1;
                          2 : TWaypointEventClass(wpevent).FType := wetWeapon2;
                          3 : TWaypointEventClass(wpevent).FType := wetWeapon3;
                          4 : TWaypointEventClass(wpevent).FType := wetWeapon4;
                          5 : TWaypointEventClass(wpevent).FType := wetWeapon5;
                        end;

                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := 0;

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end;

                      //mine
                      if getWeaponCount(TT3MineOnVehicle) > 0 then
                      begin
                        objEvent  := TScripted_Mine_Event.Create;
                        with TScripted_Mine_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index    := FFocusedBehav.FData.Scripted_Event_Index;
                          List_Index              := -1;
                          MineType                := 0;
                          MineDepth               := 50;
                          MineSpacing             := 5.00;
                          MineQuantity            := 1;
                          DeployMineUntilNextWp   := False;
                        end;

                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetMine;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := getFirstWeaponID(TT3MineOnVehicle);

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end;

                      //countermeasure
                      for i := 0 to Devices.Count - 1 do
                      begin
                        dev :=  Devices.Items[i];

                        if dev is TT3RadarNoiseJammerOnVehicle then
                        begin
                          objEvent  := TScripted_Chaff_Event.Create;
                          with TScripted_Chaff_Event(objEvent).FData do
                          begin
                            Scripted_Event_Index    := FFocusedBehav.FData.Scripted_Event_Index;
                            Chaff_Instance_Index    := TT3RadarNoiseJammerOnVehicle(dev).InstanceIndex;
                            Countermeasure_Control  := 2; //no change
                          end;

                          wpevent   := TWaypointEventClass.Create;
                          TWaypointEventClass(wpevent).FType := wetCounterMeasure;
                          TWaypointEventClass(wpevent).FData := objEvent;
                          TWaypointEventClass(wpevent).FEnable := false;
                          TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3RadarNoiseJammerOnVehicle(dev).InstanceIndex;

                          Waypoints.Add(behav,TWaypointEventClass(wpevent));
                        end;
                      end;

                      if VehicleDefinition.FData.HF_Link_Capable then
                      begin
                        objEvent  := TScripted_Datalink_Event.Create;
                        with TScripted_Datalink_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index    := FFocusedBehav.FData.Scripted_Event_Index;
                          Datalink_Control        := 2; //no change
                        end;

                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetComHF;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := 0;

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end;

                      if VehicleDefinition.FData.UHF_Link_Capable then
                      begin
                        objEvent  := TScripted_Datalink_Event.Create;
                        with TScripted_Datalink_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index    := FFocusedBehav.FData.Scripted_Event_Index;
                          Datalink_Control        := 2; //no change
                        end;

                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetComUHF;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := 0;

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end;
                    end;
                  end;
                end;
                OwnVehicle.Waypoints.Termination := targetVehicle.Waypoints.Termination;
                EventManager.OnWaypointDataChange(r^);
                EventManager.OnWaypointChange(3);
              end;
            end;
          end;
          13 : //copy waypoint from template
          begin
            wp := FindWaypointByID(r^.PlatformIDCopy);
            if Assigned(wp) then
            begin
              OwnVehicle.Waypoints.RangeList.Clear;
              OwnVehicle.Waypoints.Clear;

              for j:= 0 to wp.FData.Count - 1 do
              begin
                obj := wp.FData[j];
                if Assigned(obj) then
                begin
                  FFocusedBehav := TScripted_Behav_Definition(obj);

                  Behav := TScripted_Behav_Definition.Create;

                  with Behav.FData do
                  begin
                    Scripted_Event_Index  := FFocusedBehav.FData.Scripted_Event_Index;
                    Waypoint_Latitude     := FFocusedBehav.FData.Waypoint_Latitude;
                    Waypoint_Longitude    := FFocusedBehav.FData.Waypoint_Longitude;

                    if FFocusedBehav.FData.Speed > OwnVehicle.Mover.MaxSpeed then
                      Speed := OwnVehicle.Mover.MaxSpeed
                    else if FFocusedBehav.FData.Speed < OwnVehicle.Mover.MinSpeed then
                      Speed := OwnVehicle.Mover.MinSpeed
                    else
                      Speed := FFocusedBehav.FData.Speed;

                    Altitude              := FFocusedBehav.FData.Altitude;
                    Time_Waypoint         := FFocusedBehav.FData.Time_Waypoint;
                    Time_2_Waypoint       := FFocusedBehav.FData.Time_2_Waypoint;
                    StartMode             := FFocusedBehav.FData.StartMode;
                    StartAt               := FFocusedBehav.FData.StartAt;
                  end;

                  OwnVehicle.Waypoints.VisibleCircleWP := vGameDataSetting.VisibleCircleWP;
                  OwnVehicle.Waypoints.Add(Behav, nil);
                  OwnVehicle.Waypoints.Enabled := True;

                  //Add Waypoint Event
                  with OwnVehicle do
                  begin
                    for i := 0 to Devices.Count - 1 do
                    begin
                      dev :=  Devices.Items[i];

                      // radar
                      if dev is TT3Radar then
                      begin
                        objEvent  := TScripted_Radar_Event.Create;
                        with TScripted_Radar_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index := FFocusedBehav.FData.Scripted_Event_Index;
                          Radar_Index          := TT3Radar(dev).InstanceIndex;
                          Radar_Control        := 2; //no change
                        end;

                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetRadar;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3Radar(dev).InstanceIndex;

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end
                      // sonar
                      else if dev is TT3Sonar then
                      begin
                        objEvent  := TScripted_Sonar_Event.Create;
                        with TScripted_Sonar_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index := FFocusedBehav.FData.Scripted_Event_Index;
                          Sonar_Index          := TT3Sonar(dev).InstanceIndex;
                          Sonar_Control        := 2; //no change
                        end;

                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetSonar;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3Sonar(dev).InstanceIndex;

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end
                      // iff
                      else if dev is TT3IFFSensor then
                      begin
                        objEvent  := TScripted_IFF_Event.Create;
                        with TScripted_IFF_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index   := FFocusedBehav.FData.Scripted_Event_Index;
                          IFF_Instance_Index     := TT3IFFSensor(dev).InstanceIndex;

                          IFF_Interrogator_Control  := 2; //no change
                          IFF_Transponder_Control   := 2; //no change
                        end;

                        // wp event untuk transpondernya
                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetIFFTransponder;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3IFFSensor(dev).InstanceIndex;

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));

                        // wp event untuk interogatornya
                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetIFFInterogator;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3IFFSensor(dev).InstanceIndex;

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end;
                    end;

                    //sonobuoy
                    if getDeviceCount(TT3SonobuoyOnVehicle) > 0 then
                    begin
                      objEvent  := TScripted_Sonobuoy_Event.Create;
                      with TScripted_Sonobuoy_Event(objEvent).FData do
                      begin
                        Scripted_Event_Index    := FFocusedBehav.FData.Scripted_Event_Index;
                        List_Index              := -1;
                        SonobuoyType            := 0;
                        SonobuoyMode            := 0; // Passive
                        SonobuoyDepth           := 35;
                        SonobuoySpacing         := 0.25;
                        SonobuoyQuantity        := 1;
                        DeploySonoUntilNextWp   := False;
                      end;

                      wpevent   := TWaypointEventClass.Create;
                      TWaypointEventClass(wpevent).FType := wetSonobuoy;
                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := false;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := getFirstDeviceID(TT3SonobuoyOnVehicle);

                      Waypoints.Add(behav,TWaypointEventClass(wpevent));
                    end;

                    //Check Weapon
                    //5 Weapon / 1 Coordinat Wayoint
                    for i := 1 to 5 do
                    begin
                      objEvent := TScripted_Weapon_Event.Create;
                      with TScripted_Weapon_Event(objEvent).FData do
                      begin
                        Scripted_Event_Index := FFocusedBehav.FData.Scripted_Event_Index;
                        List_Index           := -1;
                        Salvo_Size           := 1;
                        Target_Index         := 0;
                        Weapon_Type          := 0;
                      end;

                      wpevent   := TWaypointEventClass.Create;

                      case i of
                        1 : TWaypointEventClass(wpevent).FType := wetWeapon1;
                        2 : TWaypointEventClass(wpevent).FType := wetWeapon2;
                        3 : TWaypointEventClass(wpevent).FType := wetWeapon3;
                        4 : TWaypointEventClass(wpevent).FType := wetWeapon4;
                        5 : TWaypointEventClass(wpevent).FType := wetWeapon5;
                      end;

                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := false;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := 0;

                      Waypoints.Add(behav,TWaypointEventClass(wpevent));
                    end;

                    //mine
                    if getWeaponCount(TT3MineOnVehicle) > 0 then
                    begin
                      objEvent  := TScripted_Mine_Event.Create;
                      with TScripted_Mine_Event(objEvent).FData do
                      begin
                        Scripted_Event_Index    := FFocusedBehav.FData.Scripted_Event_Index;
                        List_Index              := -1;
                        MineType                := 0;
                        MineDepth               := 50;
                        MineSpacing             := 5.00;
                        MineQuantity            := 1;
                        DeployMineUntilNextWp   := False;
                      end;

                      wpevent   := TWaypointEventClass.Create;
                      TWaypointEventClass(wpevent).FType := wetMine;
                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := false;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := getFirstWeaponID(TT3MineOnVehicle);

                      Waypoints.Add(behav,TWaypointEventClass(wpevent));
                    end;

                    //countermeasure
                    for i := 0 to Devices.Count - 1 do
                    begin
                      dev :=  Devices.Items[i];

                      if dev is TT3RadarNoiseJammerOnVehicle then
                      begin
                        objEvent  := TScripted_Chaff_Event.Create;
                        with TScripted_Chaff_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index    := FFocusedBehav.FData.Scripted_Event_Index;
                          Chaff_Instance_Index    := TT3RadarNoiseJammerOnVehicle(dev).InstanceIndex;
                          Countermeasure_Control  := 2; //no change
                        end;

                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetCounterMeasure;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3RadarNoiseJammerOnVehicle(dev).InstanceIndex;

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end;
                    end;

                    if VehicleDefinition.FData.HF_Link_Capable then
                    begin
                      objEvent  := TScripted_Datalink_Event.Create;
                      with TScripted_Datalink_Event(objEvent).FData do
                      begin
                        Scripted_Event_Index    := FFocusedBehav.FData.Scripted_Event_Index;
                        Datalink_Control        := 2; //no change
                      end;

                      wpevent   := TWaypointEventClass.Create;
                      TWaypointEventClass(wpevent).FType := wetComHF;
                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := false;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := 0;

                      Waypoints.Add(behav,TWaypointEventClass(wpevent));
                    end;

                    if VehicleDefinition.FData.UHF_Link_Capable then
                    begin
                      objEvent  := TScripted_Datalink_Event.Create;
                      with TScripted_Datalink_Event(objEvent).FData do
                      begin
                        Scripted_Event_Index    := FFocusedBehav.FData.Scripted_Event_Index;
                        Datalink_Control        := 2; //no change
                      end;

                      wpevent   := TWaypointEventClass.Create;
                      TWaypointEventClass(wpevent).FType := wetComUHF;
                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := false;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := 0;

                      Waypoints.Add(behav,TWaypointEventClass(wpevent));
                    end;
                  end;
                end;
              end;
              OwnVehicle.Waypoints.NextNodeID := TScripted_Behav_Definition(OwnVehicle.Waypoints.RangeList.Objects[0]).FData.Scripted_Event_Index - 1;
              OwnVehicle.Waypoints.Termination := TWaypointTermination(wp.Termination);
              EventManager.OnWaypointDataChange(r^);
              EventManager.OnWaypointChange(3);
            end;
          end;
        end;
      end;
      //Event
      1 : //Sensor : Radar, Sonar, IFF
      begin
        OwnVehicle.Waypoints.SensorStateChange(r^.index, r^.List_Index,
          r^.WpEventType, r^.Mode);

        EventManager.OnWaypointDataChange(r^);
      end;
      2 : //Sonobuoy
      begin
        case r^.Mode of
          0 :
          begin
            OwnVehicle.Waypoints.SonobuoyChange(r^.index, r^.List_Index,
              r^.Sonobuoy_Index, r^.Device_ID);

            EventManager.OnWaypointDataChange(r^);
          end;
          1 :
          begin
            OwnVehicle.Waypoints.SonobuoyModeChange(r^.index, r^.List_Index,
              r^.Sonobuoy_Index, r^.Sonobuoy_Mode);

            EventManager.OnWaypointDataChange(r^);
          end;
          2 :
          begin
            OwnVehicle.Waypoints.SonobuoyDepthChange(r^.index, r^.List_Index,
              r^.Sonobuoy_Index, r^.Sonobuoy_Depth);

            EventManager.OnWaypointDataChange(r^);
          end;
          3 :
          begin
            OwnVehicle.Waypoints.SonobuoySpacingChange(r^.index, r^.List_Index,
              r^.Sonobuoy_Index, r^.Sonobuoy_Spacing);

            EventManager.OnWaypointDataChange(r^);
          end;
          4 :
          begin
            OwnVehicle.Waypoints.SonobuoyQuantityChange(r^.index, r^.List_Index,
              r^.Sonobuoy_Index, r^.Sonobuoy_Qty);

            EventManager.OnWaypointDataChange(r^);
          end;
          5 :
          begin
            OwnVehicle.Waypoints.SonobuoyContinueStateChange(r^.index, r^.List_Index,
              r^.Sonobuoy_Index, r^.Sonobuoy_ContinueDeploy);

            EventManager.OnWaypointDataChange(r^);
          end;
        end;
      end;
      3 : //Weapon : Missile, Torpedo, Bomb, Depth Charge
      begin
        case r^.Mode of
          0 :
          begin
            OwnVehicle.Waypoints.WeaponChange(r^.index, r^.List_Index,
              r^.Weapon_Type, r^.Weapon_ID);

            EventManager.OnWaypointDataChange(r^);
          end;
          1 :
          begin
            OwnVehicle.Waypoints.WeaponSalvoChange(r^.index, r^.List_Index,
              r^.Weapon_Type, r^.Salvo_Size);

            EventManager.OnWaypointDataChange(r^);
          end;
          2 :
          begin
            OwnVehicle.Waypoints.WeaponTargetChange(r^.index, r^.List_Index,
              r^.Weapon_ID, r^.Target_Index);

            EventManager.OnWaypointDataChange(r^);
          end;
        end;
      end;
      4 : //Mine
      begin
        case r^.Mode of
          0 :
          begin
            OwnVehicle.Waypoints.MineChange(r^.index, r^.List_Index,
              r^.Mine_Index, r^.Weapon_ID);

            EventManager.OnWaypointDataChange(r^);
          end;
          1 :
          begin
            OwnVehicle.Waypoints.MineDepthChange(r^.index, r^.List_Index,
              r^.Mine_Index, r^.Mine_Depth);

            EventManager.OnWaypointDataChange(r^);
          end;
          2 :
          begin
            OwnVehicle.Waypoints.MineSpacingChange(r^.index, r^.List_Index,
              r^.Mine_Index, r^.Mine_Spacing);

            EventManager.OnWaypointDataChange(r^);
          end;
          3 :
          begin
            OwnVehicle.Waypoints.MineQuantityChange(r^.index, r^.List_Index,
              r^.Mine_Index, r^.Mine_Qty);

            EventManager.OnWaypointDataChange(r^);
          end;
          4 :
          begin
            OwnVehicle.Waypoints.MineContinueStateChange(r^.index, r^.List_Index,
              r^.Mine_Index, r^.Mine_ContinueDeploy);

            EventManager.OnWaypointDataChange(r^);
          end;
        end;
      end;
      5 : //Countermeasure
      begin
        OwnVehicle.Waypoints.CountermeasureStateChange(r^.index, r^.List_Index,
          r^.Mode);

        EventManager.OnWaypointDataChange(r^);
      end;
      6 : //Datalink
      begin
        OwnVehicle.Waypoints.DatalinkStateChange(r^.index, r^.List_Index,
          r^.WpEventType, r^.Mode);

        EventManager.OnWaypointDataChange(r^);
      end;
      7 : //Continous Event
      begin
        OwnVehicle.Waypoints.ContinousEventChange(r^.Obj_Index,
          r^.Obj_Type, r^.Obj_Mode, r^.Obj_Depth, r^.Obj_Spacing, r^.Obj_Qty,
          r^.Obj_ContinueDeploy);
      end;
    end;
  end;
end;

procedure TT3SimManager.netRecv_Synch_Pos_VBS(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecUDP_PlatformMovement;
  X, Y, Z, Course: string;
  Obj : TSimObject;
  I, PID : Integer;
begin
  r := @apRec^;

  if (not IsNan(r^.X)) and (not IsNan(r^.Y)) then
  begin
    X := formatDMS_long(r^.X);
    Y := formatDMS_latt(r^.Y);
    Z := FormatFloat('0.000', r^.Z);
    Course := FormatFloat('0.000', r^.Course);

    Obj := FindT3PlatformByID(r^.PlatformID);

    if Assigned(Obj) then
    begin
      TT3PlatformInstance(Obj).Heading := ValidateDegree(r^.Course);
      Obj.PosX := r^.X;
      Obj.PosY := r^.Y;

      //altitude/posZ di vbs (feet), altitude/posZ di 2D (meter)
      if (Obj is TT3Vehicle) then
      begin
        TT3Vehicle(Obj).Heading := ValidateDegree(r^.Course);
//            TT3Vehicle(Obj).Mover.Direction := ValidateDegree(r^.Data[i].Course);
        TT3Vehicle(Obj).Mover.X := r^.X;
        TT3Vehicle(Obj).Mover.Y := r^.Y;

//        TT3Vehicle(Obj).Speed := r^.Speed * 0.539957;
        TT3Vehicle(Obj).Speed := r^.Speed;

        if (TT3Vehicle(Obj).PlatformDomain = vhdAir) then
        begin
//          TT3Vehicle(Obj).OrderedAltitude := r^.Z * C_Feet_To_Meter;
//          TT3Vehicle(Obj).Altitude := r^.Z * C_Feet_To_Meter;

          {Dari 3D sudah dikirim dalam bentuk meter}
          TT3Vehicle(Obj).OrderedAltitude := r^.Z;
          TT3Vehicle(Obj).Altitude := r^.Z;
        end;
      end;

//          NetSendUDP_MovementData(Obj);

      OnLogEventStr('TSimMgr_Server.netRecv_Synch_Pos_VBS', 'Sender : '+ LongIp_To_StrIp(r^.PId.ipSender) +
        'Platform Name : ' + TT3PlatformInstance(Obj).InstanceName +
        ' ; Platform ID = ' + IntToStr(r^.PlatformID) + ' X = ' + X + ' Y = ' + Y
        + ' Z = '+ Z + ' Course = ' + Course + ' Speed = ' + FormatFloat('0.00', r^.Speed {* 0.539957})
        + ' Altitude = ' + FormatFloat('0.00', r^.z{C_Feet_To_Meter}));
    end;
  end;

//  case r^.OrderID of
//    CORD_ID_REQ_DATA :
//    begin
////      PID := r^.PlatformID;
////      X := formatDMS_long(r^.X);
////      Y := formatDMS_latt(r^.Y);
////      Z := FormatFloat('0.000', r^.Z);
////      Course := FormatFloat('0.000', r^.Course);
////      FStateOrderIDRequestDataPosFromVBS := r^.OrderID;
////
////      Obj := FindT3PlatformByID(r^.PlatformID);
////
////      if Assigned(Obj) then
////      begin
////        TT3PlatformInstance(Obj).Heading := ValidateDegree(r^.Course);
////        Obj.PosX := r^.X;
////        Obj.PosY := r^.Y;
////
////        //altitude/posZ di vbs (feet), altitude/posZ di 2D (meter)
////        if (Obj is TT3Vehicle) and (TT3Vehicle(Obj).PlatformDomain = vhdAir) then
////          TT3Vehicle(Obj).OrderedAltitude := r^.Z * C_Feet_To_Meter;
////
////        if Assigned(OnLogEventStr) then
////          OnLogEventStr('TSimMgr_Server.netRecv_Synch_Pos_VBS', 'Platform ID = ' + IntToStr(r^.PlatformID) + ' X = ' + X + ' Y = ' + Y
////                       + ' Z = '+ Z + ' Course = ' + Course);
////      end;

//      FStateOrderIDRequestDataPosFromVBS := r^.OrderID;

//      for I := Low(r^.Data) to High(r^.Data) do
//      begin
//        if (not IsNan(r^.Data[i].X)) and (not IsNan(r^.Data[i].Y)) then
//        begin
//          X := formatDMS_long(r^.Data[i].X);
//          Y := formatDMS_latt(r^.Data[i].Y);
//          Z := FormatFloat('0.000', r^.Data[i].Z);
//          Course := FormatFloat('0.000', r^.Data[i].Course);

//          Obj := FindT3PlatformByID(r^.Data[i].PlatformID);

//          if Assigned(Obj) then
//          begin
//            TT3PlatformInstance(Obj).Heading := ValidateDegree(r^.Data[i].Course);
//            Obj.PosX := r^.Data[i].X;
//            Obj.PosY := r^.Data[i].Y;

//            //altitude/posZ di vbs (feet), altitude/posZ di 2D (meter)
//            if (Obj is TT3Vehicle) then
//            begin
//              TT3Vehicle(Obj).Heading := ValidateDegree(r^.Data[i].Course);
//  //            TT3Vehicle(Obj).Mover.Direction := ValidateDegree(r^.Data[i].Course);
//              TT3Vehicle(Obj).Mover.X := r^.Data[i].X;
//              TT3Vehicle(Obj).Mover.Y := r^.Data[i].Y;

//              if (TT3Vehicle(Obj).PlatformDomain = vhdAir) then
//                TT3Vehicle(Obj).OrderedAltitude := r^.Data[i].Z * C_Feet_To_Meter;
//            end;

//  //          NetSendUDP_MovementData(Obj);

//            OnLogEventStr('TSimMgr_Server.netRecv_Synch_Pos_VBS', 'Platform Name : ' + TT3PlatformInstance(Obj).InstanceName +
//              ' ; Platform ID = ' + IntToStr(r^.Data[i].PlatformID) + ' X = ' + X + ' Y = ' + Y
//              + ' Z = '+ Z + ' Course = ' + Course);
//          end;
//        end;
//      end;
//    end;
//    CORD_ID_END_DATA :
//    begin
//      FStateOrderIDRequestDataPosFromVBS := r^.OrderID;

//      if Assigned(OnLogEventStr) then
//        OnLogEventStr('TSimMgr_Server.netRecv_Synch_Pos_VBS', ' X = ' + X + ' Y = ' + Y
//                     + ' Z = '+ Z + ' Course = ' + Course);
//    end;
//  end;


//  for I := Low(r^.Data) to High(r^.Data) do
//  begin
//    X := formatDMS_long(r^.Data[i].X);
//    Y := formatDMS_latt(r^.Data[i].Y);
//    Z := FormatFloat('0.000', r^.Data[i].Z);
//    Course := FormatFloat('0.000', r^.Data[i].Course);

//    Obj := SimPlatforms.getObjectByInstanceIndex(r^.Data[i].PlatformID);

//    if Assigned(Obj) then
//    begin
//      TT3PlatformInstance(Obj).Heading := ValidateDegree(r^.Data[i].Course);
//      Obj.PosX := r^.Data[i].X;
//      Obj.PosY := r^.Data[i].Y;

//      //altitude/posZ di vbs (feet), altitude/posZ di 2D (meter)
//      if (Obj is TT3Vehicle) and (TT3Vehicle(Obj).PlatformDomain = vhdAir) then
//        TT3Vehicle(Obj).OrderedAltitude := r^.Data[i].Z * C_Feet_To_Meter;

//      NetSendUDP_MovementData(Obj);

//      OnLogEventStr('TSimMgr_Server.netRecv_Synch_Pos_VBS', 'Platform ID = ' + IntToStr(r^.Data[i].PlatformID) + ' X = ' + X + ' Y = ' + Y
//                     + ' Z = '+ Z + ' Course = ' + Course);
//    end;
end;

procedure TT3SimManager.netRecv_Vectac(apRec: PAnsiChar; aSize: Word);
var
  rec : ^TRecVectac;
  commander, wpnCarrier : TT3Vehicle;
  PlatTarget : TT3PlatformInstance;
  weapon : TT3Weapon;
  vectac : TT3Vectac;
  behav : TScripted_Behav_Definition;
  I: Integer;
begin
  rec := @apRec^;

  commander := FindT3PlatformByID(rec^.CommanderID) as TT3Vehicle;

  if not Assigned(commander) then
    Exit;

  vectac := commander.Weapons.Items[commander.Weapons.Count-1];

  case rec^.cmd of
    CPID_CMD_VECTAC_TRACK :
    begin
      PlatTarget := FindT3PlatformByID(rec^.TargetID);
      vectac.Target := PlatTarget;
      vectac.Tracked := True;
    end;
    CPID_CMD_VECTAC_WPN_CARRIER :
    begin
      WpnCarrier := FindT3PlatformByID(rec^.WpnCarrierID) as TT3Vehicle;
      vectac.WeaponCarrier := WpnCarrier;
    end;
    CPID_CMD_VECTAC_SPEED_CHANGE :
    begin
      WpnCarrier := Vectac.WeaponCarrier as TT3Vehicle;
      wpnCarrier.OrderedSpeed := rec^.WpnCarrierSpeed;
    end;
    CPID_CMD_VECTAC_DROP_CHANGE :
    begin
      vectac.DropOffset := rec^.WeaponDropOffset;
    end;
    CPID_CMD_VECTAC_WEAPON :
    begin
      WpnCarrier := Vectac.WeaponCarrier as TT3Vehicle;
      weapon := WpnCarrier.getWeapon(rec^.Weapon) as TT3Weapon;

      if weapon is TT3TorpedoesOnVehicle then
        vectac.Airborne_Descent_Rate := TT3TorpedoesOnVehicle(weapon).TorpedoDefinition.FDef.Airborne_Descent_Rate
      else
        vectac.Airborne_Descent_Rate := 0;

      vectac.Weapon := weapon;
      vectac.CalcExpiredTime;
    end;
    CPID_CMD_VECTAC_PLAN :
    begin
      WpnCarrier := Vectac.WeaponCarrier as TT3Vehicle;

      if rec^.CmdFromController then
      begin
        TVehicle_Definition(WpnCarrier.UnitDefinition).GuidanceType := vgtWaypoint;

        WpnCarrier.Waypoints.Clear;

        behav := TScripted_Behav_Definition.Create;

        with behav.FData do
        begin
          Scripted_Event_Index  := 0;
          Waypoint_Longitude    := rec^.CoordX;
          Waypoint_Latitude     := rec^.CoordY;
          Speed                 := WpnCarrier.Mover.MaxSpeed;
        end;

        WpnCarrier.Waypoints.Add(behav, nil);
        WpnCarrier.Waypoints.Enabled := True;
        WpnCarrier.Waypoints.Termination := wtLH;
        WpnCarrier.Waypoints.RestartWaypoint;
        WpnCarrier.Waypoints.Apply;
        WpnCarrier.Waypoints.RunWaypoint := True;

        WpnCarrier.OrderedSpeed := WpnCarrier.Mover.MaxSpeed;
      end;

      if wpnCarrier.Weapons.Count = 2 then
      begin
        for I := 0 to wpnCarrier.Weapons.Count - 1 do
        begin
          Weapon := TT3Weapon(wpnCarrier.Weapons.Items[i]);

          if ((weapon is TT3TorpedoesOnVehicle) or (weapon is TT3BombONVehicle)) then
          begin
            vectac.Weapon := weapon;
            vectac.CalcExpiredTime;

            if weapon is TT3TorpedoesOnVehicle then
              vectac.Airborne_Descent_Rate := TT3TorpedoesOnVehicle(weapon).TorpedoDefinition.FDef.Airborne_Descent_Rate
            else
              vectac.Airborne_Descent_Rate := 0;

            Break;
          end;
        end;
      end;

      vectac.Planned := True;
    end;
    CPID_CMD_VECTAC_CANCEL :
    begin
      WpnCarrier := Vectac.WeaponCarrier as TT3Vehicle;

      WpnCarrier.Waypoints.Clear;
      TVehicle_Definition(WpnCarrier.UnitDefinition).GuidanceType := vgtStraightLine;

      vectac.Weapon := nil;

      vectac.Planned := False;
    end;
    CPID_CMD_VECTAC_LAUNCH :
    begin
      if rec^.CmdFromController then
        LaunchVectac(rec^);

      WpnCarrier := Vectac.WeaponCarrier as TT3Vehicle;

      WpnCarrier.Waypoints.Clear;
      TVehicle_Definition(WpnCarrier.UnitDefinition).GuidanceType := vgtStraightLine;

//      vectac.WeaponCarrier := nil;
//      vectac.Weapon := nil;

//      vectac.Tracked := False;
//      vectac.Planned := False;
      Weapon := TT3Vehicle(WpnCarrier).getWeapon(rec^.Weapon) as TT3Weapon;

      vectac.ParentX := wpnCarrier.PosX;
      vectac.ParentY := wpnCarrier.PosY;

      if weapon is TT3TorpedoesOnVehicle then
      begin
        vectac.SearchRadius := TT3TorpedoesOnVehicle(weapon).TorpedoDefinition.FDef.Max_Range;
      end
      else if weapon is TT3BombONVehicle then
      begin
        vectac.SearchRadius := TT3BombONVehicle(weapon).BombDefinition.FData.Max_Range;
      end;

      vectac.ConfirmDrop := True;
      vectac.CreateDogBox;
      vectac.VisibleDogBox := True;
    end;
  end;

  EventManager.OnVectactChange(rec^);
end;

procedure TT3SimManager.netSend_SynchObject(rSynch : TRecUDP_Synch_Obj);
begin

end;

procedure TT3SimManager.netSend_CmdSync_Hit_Mine_Bomb(recSynch: TRecCmd_Sync_Hit_BombMine);
begin

end;

procedure TT3SimManager.OnAssignedPlatform(Sender: TObject);
var
  pi : TPlatform_Instance;
begin
  if Sender is TPlatform_Instance then
  begin
    pi := TPlatform_Instance(Sender);

    if FLastPlatformID < pi.FData.Platform_Instance_Index then
      FLastPlatformID := pi.FData.Platform_Instance_Index;

    SimAssetAssignment(pi);
  end;
end;

procedure TT3SimManager.OnDelayerNotify(Sender: TObject);
var
    r : TRec_MapData;
    Pi : TT3PlatformInstance;
    i : Integer;

begin
  // used by sim server
//  {$IFDEF SERVER}
//  try
//    for I := 0 to SimPlatforms.itemCount do
//    begin
//      pi := TT3PlatformInstance(SimPlatforms.getObject(I));

//      if pi is TT3Vehicle then
//      begin
//       // if Pi.Speed > 0 then
//       // begin
//          r.PlatformID := pi.InstanceIndex;
//          r.SessionID := SessionID;
//          r.OrderID := CORD_MAPS_DEPTH;
//          netRecvMapCmd(@r, SizeOf(trec_mapdata));
//        //end;
//      end;
//    end;
//  finally

//  end;
//  {$ENDIF}
end;

procedure TT3SimManager.OnDeployDecoy(Sender : TObject);
begin
  if Sender is TT3FloatingDecoy then
  begin
    TT3FloatingDecoy(Sender).DeployTime := GetGameTime;
  end
  else if Sender is TT3InfraredDecoy then
  begin
    TT3InfraredDecoy(Sender).StartOfBloom := GetGameTime;
  end;
end;

procedure TT3SimManager.OnGunCeaseFire(Sender: TObject);
begin
 // x
end;

procedure TT3SimManager.OnGunFire(Sender: TObject);
begin
  //x
end;

function TT3SimManager.OnCheckLifeTimeFloatingDecoy(Sender : TObject) : Boolean;
var
  tNow, tDeploy : TDateTime;
  difTime : Integer;
begin
  Result := True;
  if Sender is TT3FloatingDecoy then
  begin
    tDeploy := TT3FloatingDecoy(Sender).DeployTime;
    tNow := GetGameTime;

    //selisih dalam detik
    difTime := Trunc((tNow - tDeploy) * 86400);

    if difTime >= TT3FloatingDecoy(Sender).LifetimeDuration then
      Result := False;
  end;
end;

procedure TT3SimManager.OnCheckStateIRDecoy(Sender : TObject; aDeltaMs : Double);
var
  BloomDuration : Double;
  SustainDuration : Double;
  DissipationTime : Double;
  IRCrossSection : Double;
begin
  if Sender is TT3InfraredDecoy then
  begin
     IRCrossSection := 0;

    //BLOOMING--------------------------------------------
    if TT3InfraredDecoy(Sender).IRState = irsBlooming then
    begin
      BloomDuration := GetGameTime - TT3InfraredDecoy(Sender).StartOfBloom;
      IRCrossSection := TT3InfraredDecoy(Sender).InfraredDecoyDefinition.FInfraRedDecoy_Def.Max_Infrared_Cross * BloomDuration /
                        TT3InfraredDecoy(Sender).BloomTime;

      if BloomDuration > TT3InfraredDecoy(Sender).BloomTime then
      begin
        TT3InfraredDecoy(Sender).IRState := irsSustain;
        TT3InfraredDecoy(Sender).EndOfBloom := GetGameTime;
      end;
    end;

    //SUSTAIN--------------------------------------------
    if TT3InfraredDecoy(Sender).IRState = irsSustain then
    begin
      SustainDuration := GetGameTime - TT3InfraredDecoy(Sender).EndOfBloom;
      IRCrossSection := TT3InfraredDecoy(Sender).InfraredDecoyDefinition.FInfraRedDecoy_Def.Max_Infrared_Cross;

      if SustainDuration > TT3InfraredDecoy(Sender).SustainTime then
      begin
        TT3InfraredDecoy(Sender).IRState := irsDissipating;
      end;
    end;

    //DISSIPATING--------------------------------------------
    if TT3InfraredDecoy(Sender).IRState = irsDissipating then
    begin
      DissipationTime := TT3InfraredDecoy(Sender).MaxDissipationTime -
                         ((TT3InfraredDecoy(Sender).MaxDissipationTime - TT3InfraredDecoy(Sender).MinDissipationTime)
                         * GameEnvironment.FData.Wind_Speed / 100);

      IRCrossSection := IRCrossSection - (TT3InfraredDecoy(Sender).MaxInfraredIntensity / DissipationTime * aDeltaMs);
    end;

    TT3InfraredDecoy(Sender).Altitude := TT3InfraredDecoy(Sender).Altitude -
      aDeltaMs * (TT3InfraredDecoy(Sender).DescentRate * C_Feet_To_Meter / 60);

    //REMOVAL
    if (IRCrossSection <= 0) or (TT3InfraredDecoy(Sender).Altitude <= 0) then
    begin
      TT3InfraredDecoy(Sender).FreeMe := True;
      TT3InfraredDecoy(Sender).AbsoluteFree := True;
    end;
  end;
end;

procedure TT3SimManager.WreckTimeChange(Value: integer);
var
  i : integer;
  pf : TObject;
begin
  for i := 0 to SimPlatforms.itemCount - 1 do begin
    pf := SimPlatforms.getObject(i);
    if pf is TT3Vehicle then
      TT3Vehicle(pf).DormantTime := Value;
  end;
end;

function TT3SimManager.CreatePlatformInstance(piType,
  Index, NewId : integer): TPlatform_Instance;
var
  pi : TPlatform_Instance;
begin
  pi := TPlatform_Instance.Create;

  if (NewId = 0) then
    pi.FData.Platform_Instance_Index := GetSerialPlatformID
  else
    pi.FData.Platform_Instance_Index := NewId;

  case piType of
    // vehicle
    1 : pi.FData.Vehicle_Index := index;
    2 : pi.FData.Mine_Index    := Index;
  end;

  FScenario.LoadPlatformDefinition(pi);

  if pi.Vehicle.FData.Alert_State_Time = 0 then
    pi.Vehicle.FData.Alert_State_Time := 1;

  if pi.Vehicle.FData.Readying_Time = 0 then
    pi.Vehicle.FData.Readying_Time := 1;

  FScenario.PlatformInstanceListFromDB.Add(pi);

  result := pi;
end;

function TT3SimManager.CreatePlatformInstanceRP(piType, Index,
  NewId: integer): TPlatform_Instance;
var
  pi : TPlatform_Instance;
  PiSce : TPlatform_Instance;
begin
  pi := TPlatform_Instance.Create;

  if (NewId = 0) then
    pi.FData.Platform_Instance_Index := GetSerialPlatformID
  else
    pi.FData.Platform_Instance_Index := NewId;

  case piType of
    // vehicle
    1 : pi.FData.Vehicle_Index := index;
    2 : pi.FData.Mine_Index    := Index;
  end;

  PiSce := FScenario.GetPiRuntimePlatform(Index);

  //pi := PiSce;

  CopyDataPlatformInstance(PiSce, pi);

  if pi.Vehicle.FData.Alert_State_Time = 0 then
    pi.Vehicle.FData.Alert_State_Time := 1;

  if pi.Vehicle.FData.Readying_Time = 0 then
    pi.Vehicle.FData.Readying_Time := 1;

 // FScenario.Platform_Insts.Add(pi);

  result := pi;
end;

procedure TT3SimManager.CreatePlotting(rec: TRecCmd_PlottingShape);
var
  i, j : Integer;
  flag : Boolean;

  shipDataTemp  : TVehicleOnBase;
  logDataTemp : TLogisticOnBase;
  intelDataTemp : TIntelijenInfo;

  IntelPlotTemp : TIntelijenPlotting;
  logPlotTemp : TLogisticPlotting;
  radarPlotTemp : TRadarPlotting;
  basePlotTemp : TPangkalanPlotting;
  arrowTemp : TPanahPlotting;
  plottingTemp : TMainPlottingShape;

begin
  if rec.IdAction = caAdd then
    rec.PlottingID := GetSerialPlottingID;

  case rec.IdAction of
    caAdd, caEdit, caSnapShoot : {Add}
    begin
      case rec.Tipe of
        plIntelijen:
        begin
          {$REGION ' Intelijen '}
          if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
          begin
            IntelPlotTemp := TIntelijenPlotting.Create(Converter);
            IntelPlotTemp.PlottingId := rec.PlottingID;
          end
          else
          begin
            plottingTemp := SimPlotting.GetPlotting(rec.PlottingID);
            IntelPlotTemp := TIntelijenPlotting(plottingTemp);
          end;

          IntelPlotTemp.Name := rec.TemplateName;
          IntelPlotTemp.postCenter := rec.PostStart;
          IntelPlotTemp.TableProp := rec.PostStart;
          IntelPlotTemp.Tipe := rec.Tipe;
          IntelPlotTemp.Force := rec.Force;
          IntelPlotTemp.Identity := rec.Identity;
          IntelPlotTemp.isShow := rec.isShow;
          IntelPlotTemp.isRepostPlot := False;
          IntelPlotTemp.isRepostProperty := False;
          IntelPlotTemp.Role := rec.role;
          IntelPlotTemp.roleName := rec.roleName;
          IntelPlotTemp.IsCreate := rec.IsCreate;

          if IntelPlotTemp.InfoList.Count > 0 then
            IntelPlotTemp.InfoList.Clear;

          for i := 0 to 12 do
          begin
            if (rec.Data[i] = '') then
              Continue;

            intelDataTemp := TIntelijenInfo.create;
            intelDataTemp.Info := rec.Data[i];
            IntelPlotTemp.InfoList.Add(intelDataTemp);
          end;

          if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
            SimPlotting.AddPlotting(IntelPlotTemp);

          {$ENDREGION}
        end;
        plLogistic:
        begin
          {$REGION ' Logistic '}
          if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
          begin
            logPlotTemp := TLogisticPlotting.Create(Converter);
            logPlotTemp.PlottingId := rec.PlottingID;
          end
          else
          begin
            plottingTemp := SimPlotting.GetPlotting(rec.PlottingID);
            logPlotTemp := TLogisticPlotting(plottingTemp);
          end;

          logPlotTemp.Name := rec.TemplateName;
          logPlotTemp.postCenter := rec.PostStart;
          logPlotTemp.TableProp := rec.PostStart;
          logPlotTemp.Tipe := rec.Tipe;
          logPlotTemp.Force := rec.Force;
          logPlotTemp.Identity := rec.Identity;
          logPlotTemp.isShow := rec.isShow;
          logPlotTemp.IsCreate := rec.IsCreate;
          logPlotTemp.isRepostPlot := False;
          logPlotTemp.isRepostProperty := False;
          logPlotTemp.Role := rec.role;
          logPlotTemp.roleName := rec.roleName;

          if logPlotTemp.LogisticList.Count > 0 then
            logPlotTemp.LogisticList.Clear;

          for i := 0 to 12 do
          begin
            if (rec.Data[i] = '') then
              Continue;

            logDataTemp := TLogisticOnBase.create;
            logDataTemp.Name := rec.Data[i];
            logDataTemp.Status := rec.Status[i];
            logPlotTemp.LogisticList.Add(logDataTemp);
          end;

          if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
            SimPlotting.AddPlotting(logPlotTemp);
          {$ENDREGION}
        end;
        plRadar:
        begin
          {$REGION ' Radar '}
          if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
          begin
            radarPlotTemp := TRadarPlotting.Create(Converter);
            radarPlotTemp.PlottingId := rec.PlottingID;
          end
          else
          begin
            plottingTemp := SimPlotting.GetPlotting(rec.PlottingID);
            radarPlotTemp := TRadarPlotting(plottingTemp);
          end;

          radarPlotTemp.Name := rec.TemplateName;
          radarPlotTemp.postCenter := rec.PostStart;
          radarPlotTemp.TableProp := rec.PostStart;
          radarPlotTemp.Radius := rec.Radius;
          radarPlotTemp.Tipe := rec.Tipe;
          radarPlotTemp.Force := rec.Force;
          radarPlotTemp.Identity := rec.Identity;
          radarPlotTemp.isShow := rec.isShow;
          radarPlotTemp.IsCreate := rec.IsCreate;
          radarPlotTemp.isRepostPlot := False;
          radarPlotTemp.isRepostProperty := False;
          radarPlotTemp.Role := rec.role;
          radarPlotTemp.roleName := rec.roleName;

          if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
            SimPlotting.AddPlotting(radarPlotTemp);

          {$ENDREGION}
        end;
        plPangkalan:
        begin
          {$REGION ' Pangkalan '}
          if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
          begin
            basePlotTemp := TPangkalanPlotting.Create(Converter);
            basePlotTemp.PlottingId := rec.PlottingID;
          end
          else
          begin
            plottingTemp := SimPlotting.GetPlotting(rec.PlottingID);
            basePlotTemp := TPangkalanPlotting(plottingTemp);
          end;

          basePlotTemp.Name := rec.TemplateName;
          basePlotTemp.postCenter := rec.PostStart;
          basePlotTemp.TableProp := rec.PostStart;
          basePlotTemp.Tipe := rec.Tipe;
          basePlotTemp.Force := rec.Force;
          basePlotTemp.Identity := rec.Identity;
          basePlotTemp.isShow := rec.isShow;
          basePlotTemp.IsCreate := rec.IsCreate;
          basePlotTemp.isRepostPlot := False;
          basePlotTemp.isRepostProperty := False;
          basePlotTemp.Role := rec.role;
          basePlotTemp.roleName := rec.roleName;

          if basePlotTemp.VehiclesList.Count > 0 then
            basePlotTemp.VehiclesList.Clear;

          for i := 0 to 12 do
          begin
            if (rec.Data[i] = '') then
              Continue;

            shipDataTemp := TVehicleOnBase.create;
            shipDataTemp.Name := rec.Data[i];
            shipDataTemp.Quantity := rec.Quantity[i];
            shipDataTemp.Simbol := rec.Simbol[i];
            basePlotTemp.VehiclesList.Add(shipDataTemp);
          end;

          if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
            SimPlotting.AddPlotting(basePlotTemp)

          {$ENDREGION}
        end;
        plPanah:
        begin
          {$REGION ' Panah '}
          if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
          begin
            arrowTemp := TPanahPlotting.Create(Converter);
            arrowTemp.PlottingId := rec.PlottingID;
          end
          else
          begin
            plottingTemp := SimPlotting.GetPlotting(rec.PlottingID);
            arrowTemp := TPanahPlotting(plottingTemp);
          end;

          arrowTemp.Name := rec.TemplateName;
          arrowTemp.postCenter := rec.PostStart;
          arrowTemp.postEnd := rec.PostEnd;
          arrowTemp.Tipe := rec.Tipe;
          arrowTemp.Force := rec.Force;
          arrowTemp.Identity := rec.Identity;
          arrowTemp.isShow := rec.isShow;
          arrowTemp.IsCreate := rec.IsCreate;
          arrowTemp.isRepostPlot := False;
          arrowTemp.isRepostProperty := False;
          arrowTemp.Role := rec.role;
          arrowTemp.roleName := rec.roleName;

          if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
            SimPlotting.AddPlotting(arrowTemp);

          {$ENDREGION}
        end;
      end;
    end;
    caDelete : {Delete}
    begin
      plottingTemp := SimPlotting.GetPlotting(rec.PlottingID);

      SimPlotting.FList.Remove(plottingTemp);
    end;
  end;
//  frmStrategiEditor.RefreshLTemplate;
end;

procedure TT3SimManager.CreateShipingRoute(rec: TRecCmd_ShipingRoute);
var
  i : Integer;
  ShipingRouteTemp : TMainShipingRoute;
  pointRouteTemp : TPointRoute;
begin
  if rec.IdAction = caAdd then
    rec.ShipingRouteId := GetSerialShipingRouteID;

  case rec.IdAction of
    caAdd, caEdit, caSnapShoot:
    begin
      if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
      begin
        ShipingRouteTemp := TMainShipingRoute.Create(Converter);
        ShipingRouteTemp.ShipingRouteId := rec.ShipingRouteId;
      end
      else
      begin
        ShipingRouteTemp := SimShipingRoute.GetShipingRoute(rec.ShipingRouteId);
      end;

      ShipingRouteTemp.Name := rec.Name;
      ShipingRouteTemp.Force := rec.Force;
      ShipingRouteTemp.Color := rec.Color;
      ShipingRouteTemp.isShow := rec.Show;

      if ShipingRouteTemp.FList.Count > 0 then
        ShipingRouteTemp.FList.Clear;

      for i := 0 to 25 do
      begin
        if (rec.postStart[i].X = 0) then
          Continue;

        pointRouteTemp := TPointRoute.create(Converter);
        pointRouteTemp.PointId := i+1;
        pointRouteTemp.Color := rec.Color;
        pointRouteTemp.Personel := rec.Personel[i];
        pointRouteTemp.Speed := rec.Speed[i];
        pointRouteTemp.PosAwal.X := rec.postStart[i].X;
        pointRouteTemp.PosAwal.Y := rec.postStart[i].Y;
        pointRouteTemp.PosAkhir.X := rec.postEnd[i].X;
        pointRouteTemp.PosAkhir.Y := rec.postEnd[i].Y;

        ShipingRouteTemp.AddRoute(pointRouteTemp);
      end;

      if (rec.IdAction = caAdd) or (rec.IdAction = caSnapShoot) then
        SimShipingRoute.AddShipingRoute(ShipingRouteTemp);

    end;
    3:{delete}
    begin
      ShipingRouteTemp := SimShipingRoute.GetShipingRoute(rec.ShipingRouteId);

      SimShipingRoute.RemoveShipingRoute(ShipingRouteTemp);
    end;
  end;
end;

procedure TT3SimManager.CopyDataPlatformInstance(
  const piInput: TPlatform_Instance; var piOutput: TPlatform_Instance);
var
  i : Integer;
begin
  with piOutput do
  begin
    // Copy Fdata
    FData.Resource_Alloc_Index    := piInput.FData.Resource_Alloc_Index;
    FData.Platform_Type           := piInput.FData.Platform_Type;
    FData.Vehicle_Index           := piInput.FData.Vehicle_Index;
    FData.Instance_Name           := piInput.FData.Instance_Name;
    FData.Force_Designation       := piInput.FData.Force_Designation;

    // Copy Vehicle Data
    Vehicle.FData.Vehicle_Index := piInput.Vehicle.FData.Vehicle_Index;
    Vehicle.FData.Vehicle_Identifier := piInput.Vehicle.FData.Vehicle_Identifier;
    Vehicle.FData.Platform_Domain := piInput.Vehicle.FData.Platform_Domain;
    Vehicle.FData.Platform_Category := piInput.Vehicle.FData.Platform_Category;
    Vehicle.FData.Platform_Type := piInput.Vehicle.FData.Platform_Type;
    Vehicle.FData.Motion_Characteristics := piInput.Vehicle.FData.Motion_Characteristics;
    Vehicle.FData.Length := piInput.Vehicle.FData.Length;
    Vehicle.FData.Width := piInput.Vehicle.FData.Width;
    Vehicle.FData.Height:= piInput.Vehicle.FData.Height;
    Vehicle.FData.Draft := piInput.Vehicle.FData.Draft;
    Vehicle.FData.Front_Radar_Cross := piInput.Vehicle.FData.Front_Radar_Cross;
    Vehicle.FData.Side_Radar_Cross := piInput.Vehicle.FData.Side_Radar_Cross;
    Vehicle.FData.Front_Acoustic_Cross := piInput.Vehicle.FData.Front_Acoustic_Cross;
    Vehicle.FData.Side_Acoustic_Cross := piInput.Vehicle.FData.Side_Acoustic_Cross;
    Vehicle.FData.Magnetic_Cross := piInput.Vehicle.FData.Magnetic_Cross;
    Vehicle.FData.Front_Visual_EO_Cross := piInput.Vehicle.FData.Front_Visual_EO_Cross;
    Vehicle.FData.Side_Visual_EO_Cross := piInput.Vehicle.FData.Side_Visual_EO_Cross;
    Vehicle.FData.Front_Infrared_Cross := piInput.Vehicle.FData.Front_Infrared_Cross;
    Vehicle.FData.Side_Infrared_Cross := piInput.Vehicle.FData.Side_Infrared_Cross;
    Vehicle.FData.LSpeed_Acoustic_Intens := piInput.Vehicle.FData.LSpeed_Acoustic_Intens;
    Vehicle.FData.Below_Cav_Acoustic_Intens := piInput.Vehicle.FData.Below_Cav_Acoustic_Intens;
    Vehicle.FData.Above_Cav_Acoustic_Intens := piInput.Vehicle.FData.Above_Cav_Acoustic_Intens;
    Vehicle.FData.HSpeed_Acoustic_Intens := piInput.Vehicle.FData.HSpeed_Acoustic_Intens;
    Vehicle.FData.Cavitation_Speed_Switch  := piInput.Vehicle.FData.Cavitation_Speed_Switch;
    Vehicle.FData.Time_of_Weapon_Impact := piInput.Vehicle.FData.Time_of_Weapon_Impact;
    Vehicle.FData.Chaff_Seduction_Capable := piInput.Vehicle.FData.Chaff_Seduction_Capable;
    Vehicle.FData.Seduction_Mode_Prob := piInput.Vehicle.FData.Seduction_Mode_Prob;
    Vehicle.FData.Min_Delay_Between_Chaff_Rounds := piInput.Vehicle.FData.Min_Delay_Between_Chaff_Rounds;
    Vehicle.FData.Max_Chaff_Salvo_Size := piInput.Vehicle.FData.Max_Chaff_Salvo_Size;
    Vehicle.FData.SARH_POH_Modifier := piInput.Vehicle.FData.SARH_POH_Modifier;
    Vehicle.FData.CG_POH_Modifier := piInput.Vehicle.FData.CG_POH_Modifier;
    Vehicle.FData.TARH_POH_Modifier := piInput.Vehicle.FData.TARH_POH_Modifier;
    Vehicle.FData.IR_POH_Modifier := piInput.Vehicle.FData.IR_POH_Modifier;
    Vehicle.FData.AR_POH_Modifier := piInput.Vehicle.FData.AR_POH_Modifier;
    Vehicle.FData.Active_Acoustic_Tor_POH_Mod := piInput.Vehicle.FData.Active_Acoustic_Tor_POH_Mod;
    Vehicle.FData.Passive_Acoustic_Tor_POH_Mod := piInput.Vehicle.FData.Passive_Acoustic_Tor_POH_Mod;
    Vehicle.FData.Active_Passive_Tor_POH_Mod := piInput.Vehicle.FData.Active_Passive_Tor_POH_Mod;
    Vehicle.FData.Wake_Home_POH_Modifier := piInput.Vehicle.FData.Wake_Home_POH_Modifier;
    Vehicle.FData.Wire_Guide_POH_Modifier := piInput.Vehicle.FData.Wire_Guide_POH_Modifier;
    Vehicle.FData.Mag_Mine_POH_Modifier := piInput.Vehicle.FData.Mag_Mine_POH_Modifier;
    Vehicle.FData.Press_Mine_POH_Modifier := piInput.Vehicle.FData.Press_Mine_POH_Modifier;
    Vehicle.FData.Impact_Mine_POH_Modifier := piInput.Vehicle.FData.Impact_Mine_POH_Modifier;
    Vehicle.FData.Acoustic_Mine_POH_Modifier := piInput.Vehicle.FData.Acoustic_Mine_POH_Modifier;
    Vehicle.FData.Sub_Comm_Antenna_Height := piInput.Vehicle.FData.Sub_Comm_Antenna_Height;
    Vehicle.FData.Rel_Comm_Antenna_Height := piInput.Vehicle.FData.Rel_Comm_Antenna_Height;
    Vehicle.FData.Max_Comm_Operating_Depth := piInput.Vehicle.FData.Max_Comm_Operating_Depth;
    Vehicle.FData.HF_Link_Capable := piInput.Vehicle.FData.HF_Link_Capable;
    Vehicle.FData.UHF_Link_Capable := piInput.Vehicle.FData.UHF_Link_Capable;
    Vehicle.FData.HF_Voice_Capable := piInput.Vehicle.FData.HF_Voice_Capable;
    Vehicle.FData.VHF_Voice_Capable := piInput.Vehicle.FData.VHF_Voice_Capable;
    Vehicle.FData.UHF_Voice_Capable := piInput.Vehicle.FData.UHF_Voice_Capable;
    Vehicle.FData.SATCOM_Voice_Capable := piInput.Vehicle.FData.SATCOM_Voice_Capable;
    Vehicle.FData.UWT_Voice_Capable := piInput.Vehicle.FData.UWT_Voice_Capable;
    Vehicle.FData.HF_MHS_Capable := piInput.Vehicle.FData.HF_MHS_Capable;
    Vehicle.FData.UHF_MHS_Capable := piInput.Vehicle.FData.UHF_MHS_Capable;
    Vehicle.FData.SATCOM_MHS_Capable := piInput.Vehicle.FData.SATCOM_MHS_Capable;
    Vehicle.FData.Damage_Capacity := piInput.Vehicle.FData.Damage_Capacity;
    Vehicle.FData.Plat_Basing_Capability := piInput.Vehicle.FData.Plat_Basing_Capability;
    Vehicle.FData.Chaff_Capability := piInput.Vehicle.FData.Chaff_Capability;
    Vehicle.FData.Readying_Time := piInput.Vehicle.FData.Readying_Time;
    Vehicle.FData.Sonobuoy_Capable := piInput.Vehicle.FData.Sonobuoy_Capable;
    Vehicle.FData.Nav_Light_Capable := piInput.Vehicle.FData.Nav_Light_Capable;
    Vehicle.FData.Periscope_Depth := piInput.Vehicle.FData.Periscope_Depth;
    Vehicle.FData.Periscope_Height_Above_Water := piInput.Vehicle.FData.Periscope_Height_Above_Water;
    Vehicle.FData.Periscope_Front_Radar_Xsection := piInput.Vehicle.FData.Periscope_Front_Radar_Xsection;
    Vehicle.FData.Periscope_Side_Radar_Xsection := piInput.Vehicle.FData.Periscope_Side_Radar_Xsection;
    Vehicle.FData.Periscope_Front_Vis_Xsection := piInput.Vehicle.FData.Periscope_Front_Vis_Xsection;
    Vehicle.FData.Periscope_Side_Vis_Xsection := piInput.Vehicle.FData.Periscope_Side_Vis_Xsection;
    Vehicle.FData.Periscope_Front_IR_Xsection := piInput.Vehicle.FData.Periscope_Front_IR_Xsection;
    Vehicle.FData.Periscope_Side_IR_Xsection := piInput.Vehicle.FData.Periscope_Side_IR_Xsection;
    Vehicle.FData.Engagement_Range := piInput.Vehicle.FData.Engagement_Range;
    Vehicle.FData.Auto_Air_Defense_Capable := piInput.Vehicle.FData.Auto_Air_Defense_Capable;
    Vehicle.FData.Alert_State_Time := piInput.Vehicle.FData.Alert_State_Time;
    Vehicle.FData.Detectability_Type := piInput.Vehicle.FData.Detectability_Type;
    Vehicle.FData.Max_Sonobuoys_To_Monitor := piInput.Vehicle.FData.Max_Sonobuoys_To_Monitor;
    Vehicle.FData.Sonobuoy_Deploy_Max_Altitude := piInput.Vehicle.FData.Sonobuoy_Deploy_Max_Altitude;
    Vehicle.FData.Sonobuoy_Deploy_Min_Altitude := piInput.Vehicle.FData.Sonobuoy_Deploy_Min_Altitude;
    Vehicle.FData.Sonobuoy_Deploy_Max_Speed := piInput.Vehicle.FData.Sonobuoy_Deploy_Max_Speed;
    Vehicle.FData.Air_Drop_Torpedo_Max_Altitude := piInput.Vehicle.FData.Air_Drop_Torpedo_Max_Altitude;
    Vehicle.FData.Air_Drop_Torpedo_Min_Altitude := piInput.Vehicle.FData.Air_Drop_Torpedo_Min_Altitude;
    Vehicle.FData.Air_Drop_Torpedo_Max_Speed := piInput.Vehicle.FData.Air_Drop_Torpedo_Max_Speed;
    Vehicle.FData.TMA_Rate_Factor := piInput.Vehicle.FData.TMA_Rate_Factor;
    Vehicle.FData.HMS_Noise_Reduction_Factor := piInput.Vehicle.FData.HMS_Noise_Reduction_Factor;
    Vehicle.FData.TAS_Noise_Reduction_Factor := piInput.Vehicle.FData.TAS_Noise_Reduction_Factor;
    Vehicle.FData.Infrared_Decoy_Capable := piInput.Vehicle.FData.Infrared_Decoy_Capable;
    Vehicle.FData.HF_Mid_Course_Update_Capable := piInput.Vehicle.FData.HF_Mid_Course_Update_Capable;
    Vehicle.FData.UHF_Mid_Course_Update_Capable := piInput.Vehicle.FData.UHF_Mid_Course_Update_Capable;
    Vehicle.FData.Logistic_Characteristics := piInput.Vehicle.FData.Logistic_Characteristics;
    Vehicle.FData.Capability_Characteristics := piInput.Vehicle.FData.Capability_Characteristics;
    Vehicle.FData.SATCOM_Mid_Course_Update_Capable := piInput.Vehicle.FData.SATCOM_Mid_Course_Update_Capable;
    Vehicle.FData.Quantity_Group_Personal := piInput.Vehicle.FData.Quantity_Group_Personal;
    Vehicle.FData.VBS_Class_Name := piInput.Vehicle.FData.VBS_Class_Name;
    Vehicle.FData.GangwayPosition := piInput.Vehicle.FData.GangwayPosition;
    Vehicle.FData.FrontGangway := piInput.Vehicle.FData.FrontGangway;
    Vehicle.FData.RearGangway := piInput.Vehicle.FData.RearGangway;
    Vehicle.FData.PortGangway := piInput.Vehicle.FData.PortGangway;
    Vehicle.FData.StarBoardGangway := piInput.Vehicle.FData.StarBoardGangway;
    Vehicle.FData.Weight := piInput.Vehicle.FData.Weight;

    // sensors
    Vehicle.Radars         := piInput.Vehicle.Radars;         //      : TRadar_On_Board;
    Vehicle.Sonars         := piInput.Vehicle.Sonars;         //      : TSonar_On_Board;
    Vehicle.EOSensors      := piInput.Vehicle.EOSensors;      //      : TEO_On_Board;
    Vehicle.ESMSensors     := piInput.Vehicle.ESMSensors;     //      : TESM_On_Board;
    Vehicle.IFFSensors     := piInput.Vehicle.IFFSensors;     //      : TIFF_Sensor_On_Board;
    Vehicle.MADSensors     := piInput.Vehicle.MADSensors;     //      : TMAD_Sensor_On_Board;
    Vehicle.Visualsensors  := piInput.Vehicle.Visualsensors;  //      : Visual_Sensor_On_Board;
    Vehicle.FCRSensors     := piInput.Vehicle.FCRSensors;     //      : TFCR_On_Board;

    // weapons
    Vehicle.Missiles := piInput.Vehicle.Missiles;
    Vehicle.Torpedos := piInput.Vehicle.Torpedos;
    Vehicle.Mines    := piInput.Vehicle.Mines;
    Vehicle.Bombs    := piInput.Vehicle.Bombs;
    Vehicle.Guns     := piInput.Vehicle.Guns;
    Vehicle.Hybrids  := piInput.Vehicle.Hybrids;

    Vehicle.Acoustic_Decoys         := piInput.Vehicle.Acoustic_Decoys;
    Vehicle.Air_Bubble_Mount        := piInput.Vehicle.Air_Bubble_Mount;
    Vehicle.Chaffs                  := piInput.Vehicle.Chaffs;
    Vehicle.Chaff_Launchers         := piInput.Vehicle.Chaff_Launchers;
    Vehicle.Defensive_Jammers       := piInput.Vehicle.Defensive_Jammers;
    Vehicle.Floating_Decoys         := piInput.Vehicle.Floating_Decoys;
    Vehicle.Infrared_Decoys         := piInput.Vehicle.Infrared_Decoys;
    Vehicle.Jammers                 := piInput.Vehicle.Jammers;    //jammer noise
    Vehicle.Point_Effects           := piInput.Vehicle.Point_Effects;
    Vehicle.Towed_Jammer_Decoys     := piInput.Vehicle.Towed_Jammer_Decoys;
    Vehicle.BubbleLauncher          := piInput.Vehicle.BubbleLauncher;

    Vehicle.Hosted_Platform         := piInput.Vehicle.Hosted_Platform;
    // TSonobuoy_On_Board;
    Vehicle.Sonobuoy                := piInput.Vehicle.Sonobuoy;
    Vehicle.FNote                   := piInput.Vehicle.FNote ;
    //Pattern
    Vehicle.Predefined              := piInput.Vehicle.Predefined;

    FActivation := piInput.FActivation;
    FPattern := piInput.FPattern;
    Satellite := piInput.Satellite;

    Sonobuoy  := piInput.Sonobuoy;
    Hybrid    := piInput.Hybrid;
    HeliLimitation := piInput.HeliLimitation;

    Mine      := piInput.Mine;
    Missile   := piInput.Missile;
    Torpedo   := piInput.Torpedo;

    //logistik karakteristik
    piInput.Logistic.Clone(Logistic);

    piInput.Transport.Clone(Transport);

    // Copy Motion
    piInput.Motion.Clone(Motion);
//    Motion.FData.Motion_Index := PiSce.Motion.FData.Motion_Index;
//    Motion.FData.Motion_Identifier := PiSce.Motion.FData.Motion_Identifier;
//    Motion.FData.Motion_Type := PiSce.Motion.FData.Motion_Type;
//    Motion.FData.Endurance_Type := PiSce.Motion.FData.Endurance_Type;
//    Motion.FData.Endurance_Time := PiSce.Motion.FData.Endurance_Time;
//    Motion.FData.Max_Effective_Range := PiSce.Motion.FData.Max_Effective_Range;
//    Motion.FData.Fuel_Unit_Type := PiSce.Motion.FData.Fuel_Unit_Type;
//    Motion.FData.Max_Fuel_Capacity := PiSce.Motion.FData.Max_Fuel_Capacity;
//    Motion.FData.Min_Speed_Fuel_Consume := PiSce.Motion.FData.Min_Speed_Fuel_Consume;
//    Motion.FData.Cruise_Speed_Fuel_Consume := PiSce.Motion.FData.Cruise_Speed_Fuel_Consume;
//    Motion.FData.High_Speed_Fuel_Consume := PiSce.Motion.FData.High_Speed_Fuel_Consume;
//    Motion.FData.Max_Speed_Fuel_Consume := PiSce.Motion.FData.Max_Speed_Fuel_Consume;
//    Motion.FData.Max_Ground_Speed := PiSce.Motion.FData.Max_Ground_Speed;
  end;
end;

function TT3SimManager.CreateTorpedoProjectileHybrid(const PlatformID, MisID,
  InstanceIndex: Integer): TObject;
var
  pi : TT3PlatformInstance;
  mis: TT3HybridOnVehicle;
  projectil : TT3Torpedo;
  behav : TScripted_Behav_Definition; //add
  TorpedoDefinition : TRecTorpedo_Definition;
  tPt : t3DPoint;
begin
  result := nil;
  pi   := FindT3PlatformByID(PlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    exit;

  mis := TT3HybridOnVehicle(FindDeviceByID(MisID));

  if mis <> nil then
  begin
    projectil := TT3Torpedo.Create;
    behav     := TScripted_Behav_Definition.Create;

    TorpedoDefinition := mis.TorpedoDefinition;
    projectil.WeaponWaypoint.Add(behav, nil);  //add
    projectil.WeaponWaypoint.ApplyWeaponWaypoint;
    projectil.WeaponWaypoint.Owner := pi;

    projectil.Parent          := pi;
    projectil.Owner           := pi;
    projectil.UnitMotion      := mis.TorpedoMotion;

//    projectil.UnitGroup       := True;
//    projectil.Enable          := True;
    projectil.WeaponCategory  := mis.WeaponCategory;
    projectil.Track_ID        := 'TOR';
    projectil.SearchDepth     := TorpedoDefinition.Max_Torpedo_Search_Depth;
    projectil.SearchRadius    := TorpedoDefinition.Max_Range;
    projectil.SearchDepth     := TorpedoDefinition.Default_Depth;
    projectil.SafetyCeiling   := TorpedoDefinition.Acoustic_Torp_Ceiling_Depth;
    projectil.SeekerRange     := TorpedoDefinition.Seeker_TurnOn_Range;
    projectil.TipeTorpedo     := 2;
    projectil.isInstructor    := FIsInstructor;
    projectil.isWasdal        := FIsWasdal;

    {Harus ada target}
    projectil.TargetObject    := pi;

    tPt.X                     := mis.Aimpoint_Movement.PositionX;
    tPt.y                     := mis.Aimpoint_Movement.PositionY;
    tPt.Z                     := pi.PosZ;

    projectil.LaunchPosition := tPt;

    projectil.UnitDefinition  := TTorpedo_On_Board(mis.UnitDefinition);
    TTorpedo_On_Board(projectil.UnitDefinition).FDef := TorpedoDefinition;
    TTorpedo_On_Board(projectil.UnitDefinition).FAspectPOH := mis.PohAspect;

    projectil.PointHybrid  := Make2DPoint(mis.Aimpoint_Movement.PositionX, mis.Aimpoint_Movement.PositionY);
    projectil.Initialize;

    //untuk torpedo yang dbwa missile
    projectil.Environment := Self.GameEnvironment;
    projectil.GameDefaults := Self.GameDefaults;

    AssignWeaponEvent(projectil);
    projectil.TargetPlatforms := SimPlatforms;
    projectil.PlatformDomain := vhdSubsurface;
    projectil.Launched := True;

    //torpedo

    if InstanceIndex = 0 then
    begin
      projectil.InstanceIndex := GetSerialPlatformID;
      projectil.InstanceName := mis.InstanceName;
    end
    else
    begin
      projectil.InstanceIndex := InstanceIndex;
      projectil.InstanceName := mis.InstanceName;
    end;

    Result := projectil;
  end;
end;

function TT3SimManager.CreateTT3MineInstance(Pi: TPlatform_Instance) : TT3PlatformInstance;
var
  motion : TMotion_Characteristics;
  FMineDefinition : TMine_Definition;
  mine  : TT3Mine;
begin
  FMineDefinition := Pi.Mine;
  motion := TMotion_Characteristics.Create;
  Pi.Motion.Clone(motion);

  mine := TT3Mine.Create;
  mine.Converter := Converter;

  mine.UnitActivation  := pi.FActivation;
  mine.Parent          := nil;
  mine.Owner           := nil;
  mine.UnitMotion      := motion;
  mine.UnitDefinition  := pi.Mine;
  mine.Enable          := True;
  mine.WeaponCategory  := wcMine;
  mine.Track_ID        := Pi.FData.Track_ID;
  mine.isInstructor    := FIsInstructor;
  mine.isWasdal        := FIsWasdal;

  mine.InstanceIndex     := pi.FData.Platform_Instance_Index;
  mine.InstanceName      := pi.FData.Instance_Name;
  mine.Lethality         := FMineDefinition.FData.Mine_Lethality;
  mine.DetectabilityType := FMineDefinition.FData.Detectability_Type;
  mine.EngageRange       := FMineDefinition.FData.Engagement_Range;
  mine.GameDefaults      := GameDefaults;

  mine.Force_Designation := Pi.FData.Force_Designation;
  mine.PlatformType      := FMineDefinition.FData.Platform_Type;

  mine.TargetPlatforms := SimPlatforms;

  mine.Initialize;
  mine.Launch;
  mine.Launched := True;

  result := mine;

  AssignWeaponEvent(mine);
  SimPlatforms.addObject(mine);
end;

//procedure TT3SimManager.CreateTT3MissileInstance(Pi: TPlatform_Instance);
//var
//  projectil : TT3Missile;
//  motion : TMotion_Characteristics;
//  FMissileDefinition : TMissile_Definition;
//begin
//  projectil := nil;

//  FMissileDefinition := Pi.Missile;
//  motion := TMotion_Characteristics.Create;
//  Pi.Motion.Clone(motion);

//  case FMissileDefinition.FData.Primary_Target_Domain of
//    0 : begin
//          //Create Air To Surface Missile
//          projectil := TT3Missile_AS.Create;
//          projectil.Converter := Converter;
//          projectil.WeaponCategory    := wcMissileAirToSurfaceSubsurface;

//          TT3Missile_AS(projectil).SetMovement(mfmBearing);
//          TT3BearingOnly_Missile(TT3Missile_AS(projectil).MissileMovement).BearingLaunch
//                := pi.FActivation.Init_Course;
//        end;
//    1 : begin
//          //Create Surface To Surface Missile
//          projectil := TT3Missile_SS.Create;
//          projectil.Converter := Converter;
//          projectil.WeaponCategory    := wcMissileSurfaceSubsurfaceToSurfaceSubsurface;
//          // ??
//        end;
//    2 : begin
//          //Create Surface To Air Missile
//          projectil := TT3Missile_SA.Create;
//          projectil.Converter := Converter;
//          projectil.WeaponCategory    := wcMissileSurfaceSubsurfaceToAir;
//          // ??
//        end;
//    3 : begin
//          //Create Air To Air Missile
//          projectil := TT3Missile_AA.Create;
//          projectil.Converter := Converter;
//          projectil.WeaponCategory    := wcMissileAirToAir;

//          TT3Missile_AA(projectil).SetMovement(mfmBearing);
//          TT3BearingOnly_Missile(TT3Missile_AA(projectil).MissileMovement).BearingLaunch
//                := pi.FActivation.Init_Course;
//        end;
//    4 : begin
//          //Create Land Attack Missile
//          projectil := TT3Missile_LA.Create;
//          projectil.Converter := Converter;
//          projectil.WeaponCategory    := wcMissileLandAttack;

//          TT3Missile_LA(projectil).SetMovement(mfmBearing);
//          TT3BearingOnly_Missile(TT3Missile_LA(projectil).MissileMovement).BearingLaunch
//                := pi.FActivation.Init_Course;
//        end;
//  end;

//  if Assigned(projectil) then begin

//    with projectil do begin
//      UnitActivation    := pi.FActivation;
//      Initialize(pi.FActivation);
//      DamageCapacity    := FMissileDefinition.FData.Damage_Capacity;
//      DetectabilityType := FMissileDefinition.FData.Detectability_Type;
//      Lethality         := FMissileDefinition.FData.Lethality;
//      MaxRange          := FMissileDefinition.FData.Max_Range;
//      EngagementRange   := FMissileDefinition.FData.Engagement_Range;
//      TurnOnSeekRange   := FMissileDefinition.FData.Seeker_TurnOn_Range;
//      DefaultAltitude   := FMissileDefinition.FData.Default_Altitude;
//      DefaultSeekAltitude := FMissileDefinition.FData.Terminal_Acquisition_Altitude;
//      InstanceIndex     := Pi.FData.Platform_Instance_Index;
//      InstanceName      := Pi.FData.Instance_Name;
//      UnitDefinition    := Pi.Missile; //--> TMissile_Definition
//      Track_ID          := Pi.FData.Track_ID;
//      UnitMotion        := motion;
//      Parent            := nil;
//      Owner             := nil;
//      TargetObject      := nil;
//      isInstructor      := FIsInstructor;
//      Enable            := True;
//      LaunchDelay       := 0;
//      Force_Designation := Pi.FData.Force_Designation;
//      PlatformType      := FMissileDefinition.FData.Platform_Type;

//      Planned           := true;
//      Launching         := true;
//      TargetPlatforms   := SimPlatforms;
//      isCounterDelay    := true;
//    end;

//    if FMissileDefinition.FData.Fly_Out_Required = 1 then begin
////      HAFOBearing := CalcBearing(PosX,PosY,Static3DPos.X,Static3DPos.Y);
////      RangeBearingToCoord(HitMode.HAFO, HAFOBearing, mX, mY);
////
////      HAFOPos.X := TT3Vehicle(Parent).getPositionX + mX;
////      HAFOPos.Y := TT3Vehicle(Parent).getPositionY + mY;
////      projectil.HAFOPosition    := HAFOPos;
//    end;
//  end;

//  AssignWeaponEvent(projectil);
//  SimPlatforms.addObject(projectil);

//end;

//procedure TT3SimManager.CreateTT3TorpedoInstance(Pi: TPlatform_Instance);
//var
//  projectil : TT3Torpedo;
//  motion : TMotion_Characteristics;
//  FTorpedoDefinition : TTorpedo_Definition;
//begin
//  //projectil := nil;

//  FTorpedoDefinition := Pi.Torpedo;
//  motion := TMotion_Characteristics.Create;
//  Pi.Motion.Clone(motion);

//  projectil := TT3Torpedo.Create;
//  with projectil do begin
//    Parent          := nil;
//    Owner           := nil;
//    UnitActivation  := pi.FActivation;
//    UnitMotion      := motion;
//    UnitDefinition  := FTorpedoDefinition; //--> TTorpedo_Definition
//    Enable          := True;
//    //WeaponCategory  := wcto;
//    Track_ID        := FTorpedoDefinition.FData.Class_Identifier;

//    case FTorpedoDefinition.FData.Launch_Method of
//      1 : LaunchMethod := tlmAimpoint;
//      2 : LaunchMethod := tlmBearing;
//      3 : LaunchMethod := tlmAimBearing;
//      4 : LaunchMethod := tlmDirect;
//    end;

//    case FTorpedoDefinition.FData.Guidance_Type of
//      9  : WeaponCategory := wcTorpedoStraigth;
//      10 : WeaponCategory := wcTorpedoActiveAcoustic;
//      11 : WeaponCategory := wcTorpedoPassiveAcoustic;
//      18 : WeaponCategory := wcTorpedoActivePassive;
//      12 : WeaponCategory := wcTorpedoWireGuided;
//      13 : WeaponCategory := wcTorpedoWakeHoming;
//    end;

//    //SearchRadius    := FTorpedoDefinition.FData.;
//    //SearchDepth     := SearchDepth;
//    //SafetyCeiling   := SafetyCeiling;
//    SeekerRange     := FTorpedoDefinition.FData.Seeker_TurnOn_Range;
//    LaunchBearing   := pi.FActivation.Init_Course;
//    //TipeTorpedo     := FTorpedoDefinition.FData;
//    isInstructor    := FIsInstructor;

//    Initialize;
//  end;
//  AssignWeaponEvent(projectil);
//  SimPlatforms.addObject(projectil);
//end;

function TT3SimManager.LaunchChaff(const rec: TRecCmd_LaunchChaff): TObject;
var pi: TT3PlatformInstance;
    cob, lc: TObject;
    chaff : TT3Chaff;
begin
  result := nil;
  pi   := FindT3PlatformByID(rec.ParentPlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    exit;

  cob := TT3Vehicle(pi).FindDevice(TT3ChaffOnVehicle, rec.ChaffOnVehicleID);
  lc  := TT3Vehicle(pi).FindDevice(TT3ChaffLauncher, rec.LauncherID);

  if (cob = nil) then
    exit;

  if TT3ChaffOnVehicle(cob).ChaffDefinition.FData.Instance_Type <> Byte(ecgBarrier) then
  begin
    if (lc = nil)  then
      Exit;

    chaff := TT3ChaffOnVehicle(cob).PrepareLaunch;
    if not Assigned(chaff) then exit;

    Chaff.IsInstructor := FIsInstructor;
    chaff.isWasdal := FIsWasdal;
    chaff.Environment := Self.GameEnvironment;
    chaff.GameDefaults := Self.GameDefaults; //mm gd
    chaff.Bearing := TT3ChaffLauncher(lc).Angle;
    chaff.ChaffInstanceIndex := TT3ChaffOnVehicle(cob).InstanceIndex;

    AssignECmEvent(chaff);
    chaff.Parent     := nil;

    if FIsInstructor or FIsWasdal or chaff.UnitGroup then //edit 26042012 mk
      chaff.Visible := True
    else
      chaff.Visible := False;

    chaff.PlatformDomain := 0;
    chaff.Launch;
    chaff.Enable := true;

    if rec.ChaffInstanceIndex = 0 then
     // server
      chaff.InstanceIndex := GetSerialPlatformID
    else
    begin
      if LoadFromSnapshot then
      begin
        chaff.InstanceIndex := rec.ChaffInstanceIndex;
        FLastPlatformID := rec.ChaffInstanceIndex + 1;
      end
      else
        chaff.InstanceIndex := rec.ChaffInstanceIndex;
    end;

    chaff.Track_ID := 'Chaf'; //'CH' + IntToStr(chaff.InstanceIndex);
    result := chaff;
  end
  else
  begin
    LaunchChaffBarrier(rec);
  end;
end;

function TT3SimManager.LaunchChaffBarrier(
  const rec: TRecCmd_LaunchChaff): TObject;
var pi: TT3PlatformInstance;
    cob{, lc}: TObject;
    chaff : TT3Chaff;
begin
  result := nil;
  pi   := FindT3PlatformByID(rec.ParentPlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    exit;

  cob := TT3Vehicle(pi).getDevice(rec.ChaffOnVehicleID, TT3ChaffOnVehicle);
//  lc  := TT3Vehicle(pi).FindDevice(TT3ChaffLauncher, rec.LauncherID);

  if (cob = nil) then
    exit;

  chaff := TT3ChaffOnVehicle(cob).PrepareLaunchBarrier;
  if not Assigned(chaff) then exit;

  Chaff.IsInstructor := FIsInstructor;
  chaff.isWasdal := FIsWasdal;
  chaff.Environment := Self.GameEnvironment;
  chaff.GameDefaults := Self.GameDefaults; //mm gd
//  chaff.Bearing := TT3ChaffLauncher(lc).Angle;
  chaff.ChaffInstanceIndex := TT3ChaffOnVehicle(cob).InstanceIndex;

  AssignECmEvent(chaff);
  chaff.Parent     := nil;

  if FIsInstructor or FIsWasdal or chaff.UnitGroup then //edit 26042012 mk
    chaff.Visible := True
  else
    chaff.Visible := False;

  chaff.PlatformDomain := 0;
  chaff.Launch;
  chaff.Enable := true;

  if rec.ChaffInstanceIndex = 0 then
   // server
    chaff.InstanceIndex := GetSerialPlatformID
  else
  begin
    if LoadFromSnapshot then
    begin
      chaff.InstanceIndex := rec.ChaffInstanceIndex;
      FLastPlatformID := rec.ChaffInstanceIndex + 1;
    end
    else
      chaff.InstanceIndex := rec.ChaffInstanceIndex;
  end;

  chaff.Track_ID := 'Chaf'; //'CH' + IntToStr(chaff.InstanceIndex);
  result := chaff;
end;

function TT3SimManager.LaunchBubble(const rec: TRecCmd_LaunchBubble): TObject;
var pi: TT3PlatformInstance;
    cob : TObject;
    Bubble : TT3AirBubble;
begin
  result := nil;

  pi   := FindT3PlatformByID(rec.ParentPlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    exit;

  cob := TT3Vehicle(pi).FindDevice(TT3AirBubbleOnVehicle,rec.ChaffOnVehicleID);

  if (cob = nil) then exit;

  Bubble := TT3AirBubbleOnVehicle(cob).PrepareLaunch;
  if not Assigned(Bubble) then exit;

  Bubble.Environment := Self.GameEnvironment;
  Bubble.GameDefaults := Self.GameDefaults;
  Bubble.BubbleInstanceIndex := TT3AirBubbleOnVehicle(cob).InstanceIndex;
  //Bubble.Bearing := TT3ChaffLauncher(lc).Angle;


  AssignECmEvent(Bubble);
  Bubble.Parent     := nil;

  if FIsInstructor or FIsWasdal or Bubble.UnitGroup then //edit 26042012 mk
    Bubble.Visible := True
  else
    Bubble.Visible := False;

  Bubble.PlatformDomain := 2;
  Bubble.Launch;
  Bubble.Enable := true;

  if rec.BubbleInstanceIndex = 0 then
   // server
    Bubble.InstanceIndex := GetSerialPlatformID
  else
  begin
    if LoadFromSnapshot then
    begin
      Bubble.InstanceIndex := rec.BubbleInstanceIndex;
      FLastPlatformID := rec.BubbleInstanceIndex + 1;
    end
    else
      Bubble.InstanceIndex := rec.BubbleInstanceIndex;
  end;

  if FIsInstructor or FIsWasdal then
    Bubble.Track_ID := 'BB'
  else
    Bubble.Track_ID := IntToStr(Bubble.InstanceIndex);

  result := Bubble;
end;

procedure TT3SimManager.netRecv_Cmd_Embark_Land(apRec : PAnsiChar; aSize: word);
var
  r : ^TRecCmd_Embark_Landing;
  parentObj : TSimObject;
  embarkObj : TSimObject;
  ve, vEmbark : TT3Vehicle;
  embarkPlatform : TT3Vehicle;
  embarkHost     : TT3EmbarkedVehicle;
  I: Integer;
  hostRec : TRecHosted_Platform;
  found : Boolean;
begin
  //receive embark landing
  r := @apRec^;
  found := false;

  if not r^.SessionID = SessionID then
    Exit;

  parentObj := FindT3PlatformByID(r^.ParentPlatformID);
  embarkObj := FindT3PlatformByID(r^.EmbarkPlatformID);

  if parentObj is TT3Vehicle then
  begin
    ve := parentObj as TT3Vehicle;

    if embarkObj is TT3PlatformInstance then
    begin
      embarkPlatform := embarkObj as TT3Vehicle;

      if Assigned(ve.EmbarkedVehicles) then
      begin
        embarkHost := nil;

        for I := 0 to ve.EmbarkedVehicles.Count - 1 do
        begin
          embarkHost := ve.EmbarkedVehicles.Items[I];

          if (embarkHost.EmbarkedVehicle.Vehicle_Index = ve.VehicleDefinition.FData.Vehicle_Index)
          and (embarkHost.EmbarkedVehicle.Hosted_Vehicle_Index = embarkPlatform.VehicleDefinition.FData.Vehicle_Index) then
          begin
            found := True;
            Break;
          end;
        end;

        vEmbark := TT3Vehicle(embarkObj);
        if found then
        begin
          embarkPlatform.FlagShowStatusDestroy := false;
//          embarkHost.Quantity := embarkHost.Quantity + 1;  //tambah quantity
          hostRec := embarkHost.EmbarkedVehicle;
         // hostRec.Quantity := hostRec.Quantity + 1;
          embarkHost.EmbarkedVehicle := hostRec;

          embarkHost.AddQueueLand(embarkPlatform.Track_ID, embarkPlatform.InstanceName,
                vEmbark.VehicleDefinition.FData.Readying_Time);

          //set manualy for testing...
          embarkHost.Readying := vEmbark.VehicleDefinition.FData.Readying_Time {second};
          embarkHost.IsAfterLanding := True;
        end;
        {else
        begin
          // embark tidak bisa kecuali yg sekelas

          embarkHost := TT3EmbarkedVehicle.Create;
          with hostRec do
          begin
            hostRec.Slave_Index := ve.EmbarkedVehicles.Count + 1;
            Vehicle_Index := ve.VehicleDefinition.FData.Vehicle_Index;
            Hosted_Vehicle_Index := embarkPlatform.VehicleDefinition.FData.Vehicle_Index;
            Quantity := 1;
          end;

          embarkHost.EmbarkedVehicle := hostRec;
          embarkHost.EmbarkedIdentifier := embarkPlatform.VehicleDefinition.FData.Vehicle_Identifier;
          embarkHost.Quantity := embarkHost.Quantity + 1;
          ve.addEmbarked(embarkHost);
        end;

        //set manualy for testing...
        embarkHost.Readying := ve.VehicleDefinition.FData.Readying_Time {second};
      //  embarkHost.IsAfterLanding := True;
      end;
    end;
  end;

end;

procedure TT3SimManager.NetRecv_cmd_environment(apRec: PAnsiChar; aSize: Word);
var
  r : ^TrecSinc_Envi;
  I : Integer;
  sub : TSubArea_Enviro_Definition;

  pi : TT3PlatformInstance;
begin
  r := @apRec^;

  if not r^.SessionID = SessionID then
    Exit;

   if r^.Envi_Type = 0 then
   begin
     case r^.Envi_Chance of
        E_Wind_Speed                      : GameEnvironment.FData.Wind_Speed := r^.Value;
        E_Wind_Direction                  : GameEnvironment.FData.Wind_Direction := r^.Value;
        E_Daytime_Visual_Modifier         : GameEnvironment.FData.Daytime_Visual_Modifier := r^.Value;
        E_Nighttime_Visual_Modifier       : GameEnvironment.FData.Nighttime_Visual_Modifier := r^.Value;
        E_Daytime_Infrared_Modifier       : GameEnvironment.FData.Daytime_Infrared_Modifier := r^.Value;
        E_Nighttime_Infrared_Modifier     : GameEnvironment.FData.Nighttime_Infrared_Modifier := r^.Value;
        E_Sunrise                         : GameEnvironment.FData.Sunrise := Round(r^.Value);
        E_Sunset                          : GameEnvironment.FData.Sunset := Round(r^.Value);
        E_Period_of_Twilight              : GameEnvironment.FData.Period_of_Twilight := Round(r^.Value);
        E_Rain_Rate                       : GameEnvironment.FData.Rain_Rate := Round(r^.Value);
        E_Cloud_Base_Height               : GameEnvironment.FData.Cloud_Base_Height := r^.Value;
        E_Cloud_Attenuation               : GameEnvironment.FData.Cloud_Attenuation := Round(r^.Value);
        E_Sea_State                       : GameEnvironment.FData.Sea_State := Round(r^.Value);
        E_Ocean_Current_Speed             : GameEnvironment.FData.Ocean_Current_Speed := r^.Value;
        E_Ocean_Current_Direction         : GameEnvironment.FData.Ocean_Current_Direction := r^.Value;
        E_Thermal_Layer_Depth             : GameEnvironment.FData.Thermal_Layer_Depth := r^.Value;
        E_Sound_Velocity_Type             : GameEnvironment.FData.Sound_Velocity_Type := Round(r^.Value);
        E_Surface_Sound_Speed             : GameEnvironment.FData.Surface_Sound_Speed := r^.Value;
        E_Layer_Sound_Speed               : GameEnvironment.FData.Layer_Sound_Speed := r^.Value;
        E_Bottom_Sound_Speed              : GameEnvironment.FData.Bottom_Sound_Speed := r^.Value;
        E_Bottomloss_Coefficient          : GameEnvironment.FData.Bottomloss_Coefficient := Round(r^.Value);
        E_Ave_Ocean_Depth                 : GameEnvironment.FData.Ave_Ocean_Depth := r^.Value;
        E_CZ_Active                       : GameEnvironment.FData.CZ_Active := Round(r^.Value);
        E_Surface_Ducting_Active          : GameEnvironment.FData.Surface_Ducting_Active := Round(r^.Value);
        E_Upper_Limit_Surface_Duct_Depth  : ;
        E_Lower_Limit_Surface_Duct_Depth  : ;
        E_Sub_Ducting_Active              : GameEnvironment.FData.Sub_Ducting_Active := Round(r^.Value);
        E_Upper_Limit_Sub_Duct_Depth      : GameEnvironment.FData.Upper_Limit_Sub_Duct_Depth := r^.Value;
        E_Lower_Limit_Sub_Duct_Depth      : GameEnvironment.FData.Lower_Limit_Sub_Duct_Depth := r^.Value;
        E_Shipping_Rate                   : GameEnvironment.FData.Shipping_Rate := Round(r^.Value);
        E_Shadow_Zone_Trans_Loss          : GameEnvironment.FData.Shadow_Zone_Trans_Loss := r^.Value;
        E_Atmospheric_Refract_Modifier    : GameEnvironment.FData.Atmospheric_Refract_Modifier := r^.Value;
        E_Barometric_Pressure             : GameEnvironment.FData.Barometric_Pressure := r^.Value;
        E_Air_Temperature                 : GameEnvironment.FData.Air_Temperature := r^.Value;
        E_Surface_Temperature             : GameEnvironment.FData.Surface_Temperature := r^.Value;
        E_Start_HF_Range_Gap              : ;
        E_End_HF_Range_Gap                : ;
     end;
   end;

   for I := 0 to GameEnvironment.FSubArea.Count - 1 do
   begin
      sub := GameEnvironment.FSubArea.items[I];

      if r^.Sub_EnviID = sub.FData.Enviro_Index then
      begin
        case r^.Envi_Chance of
          E_Wind_Speed                      : sub.FData.Wind_Speed := r^.Value;
          E_Wind_Direction                  : sub.FData.Wind_Direction := r^.Value;
          E_Daytime_Visual_Modifier         : sub.FData.Daytime_Visual_Modifier := r^.Value;
          E_Nighttime_Visual_Modifier       : sub.FData.Nighttime_Visual_Modifier := r^.Value;
          E_Daytime_Infrared_Modifier       : sub.FData.Daytime_Infrared_Modifier := r^.Value;
          E_Nighttime_Infrared_Modifier     : sub.FData.Nighttime_Infrared_Modifier := r^.Value;
          E_Sunrise                         : ;
          E_Sunset                          : ;
          E_Period_of_Twilight              : ;
          E_Rain_Rate                       : sub.FData.Rain_Rate := Round(r^.Value);
          E_Cloud_Base_Height               : sub.FData.Cloud_Base_Height := r^.Value;
          E_Cloud_Attenuation               : sub.FData.Cloud_Attenuation := Round(r^.Value);
          E_Sea_State                       : sub.FData.Sea_State := Round(r^.Value);
          E_Ocean_Current_Speed             : sub.FData.Ocean_Current_Speed := r^.Value;
          E_Ocean_Current_Direction         : sub.FData.Ocean_Current_Direction := r^.Value;
          E_Thermal_Layer_Depth             : sub.FData.Thermal_Layer_Depth := r^.Value;
          E_Sound_Velocity_Type             : sub.FData.Sound_Velocity_Type := Round(r^.Value);
          E_Surface_Sound_Speed             : sub.FData.Surface_Sound_Speed := r^.Value;
          E_Layer_Sound_Speed               : sub.FData.Layer_Sound_Speed := r^.Value;
          E_Bottom_Sound_Speed              : sub.FData.Bottom_Sound_Speed := r^.Value;
          E_Bottomloss_Coefficient          : sub.FData.Bottomloss_Coefficient := Round(r^.Value);
          E_Ave_Ocean_Depth                 : sub.FData.Ave_Ocean_Depth := r^.Value;
          E_CZ_Active                       : sub.FData.CZ_Active := Round(r^.Value);
          E_Surface_Ducting_Active          : sub.FData.Surface_Ducting_Active := Round(r^.Value);
          E_Upper_Limit_Surface_Duct_Depth  : sub.FData.Upper_Limit_Sur_Duct_Depth := r^.Value;
          E_Lower_Limit_Surface_Duct_Depth  : sub.FData.Lower_Limit_Sur_Duct_Depth := r^.Value;
          E_Sub_Ducting_Active              : sub.FData.Sub_Ducting_Active := Round(r^.Value);
          E_Upper_Limit_Sub_Duct_Depth      : sub.FData.Upper_Limit_Sub_Duct_Depth := r^.Value;
          E_Lower_Limit_Sub_Duct_Depth      : sub.FData.Lower_Limit_Sub_Duct_Depth := r^.Value;
          E_Shipping_Rate                   : sub.FData.Shipping_Rate := Round(r^.Value);
          E_Shadow_Zone_Trans_Loss          : sub.FData.Shadow_Zone_Trans_Loss := r^.Value;
          E_Atmospheric_Refract_Modifier    : sub.FData.Atmospheric_Refract_Modifier := r^.Value;
          E_Barometric_Pressure             : sub.FData.Barometric_Pressure := r^.Value;
          E_Air_Temperature                 : sub.FData.Air_Temperature := r^.Value;
          E_Surface_Temperature             : sub.FData.Surface_Temperature := r^.Value;
          E_Start_HF_Range_Gap              : ;
          E_End_HF_Range_Gap                : ;
          E_Overcast                        : ;
        end;
      end;
   end;

   for i := 0 to SimPlatforms.itemCount - 1 do
   begin
     pi := Simplatforms.getObject(i) as TT3PlatformInstance;

     if pi is TT3Vehicle then
     begin
       pi.Environment := GameEnvironment;
     end;
   end;

   EventManager.OnUpdateEnvi(r^.Envi_Chance, r^.Value, GameEnvironment);
end;

function TT3SimManager.DisembarkTransportedPersonel(
  const rec: TRecCmd_DisembarkPersonelTemporary): TT3PlatformInstance;
var
  i, idx, vIndex, nIndex, flag: integer;
  papi : TT3Vehicle;
  aObj : TObject;
  FDeployedPlatform : TPlatform_Instance;
  FLaunchPlatform : TT3PlatformInstance;
  grp  : T3CubicleGroup;
  data : AnsiString;

  BrigadeOnShip : TBrigade;
  BatalyonOnShip: TBatalyon;
  KompiOnship   : TKompi;
  PlatoonOnship : TPlatoon;
  GroupOnShip   : TGroup;
begin
  result := nil;
  GroupOnShip := nil;

  if rec.ParentPlatformID <> 0 then
  begin
    aObj := FindT3PlatformByID(rec.ParentPlatformID);
    if not (aObj is TT3Vehicle) then
      exit;

    papi   := TT3Vehicle(aObj);

    if not(assigned(papi)) then
      exit;

//    if (papi.PersonelTransportedList.Count < 1) then
//      exit;
//
//    if CekPersonelOnShip(papi.PersonelTransportedList, rec.BrigadeIdentifier, i) then
//    begin
//      BrigadeOnShip := TBrigade(papi.PersonelTransportedList.Items[i]);
//
//      if CekPersonelOnShip(BrigadeOnShip.BatalyonList, rec.BatalyonIdentifier, i) then
//      begin
//        BatalyonOnShip := TBatalyon(BrigadeOnShip.BatalyonList.Items[i]);
//
//        if CekPersonelOnShip(BatalyonOnShip.KompiList, rec.KompiIdentifier, i) then
//        begin
//          KompiOnship := TKompi(BatalyonOnShip.KompiList.Items[i]);
//
//          if CekPersonelOnShip(KompiOnship.PlatoonList, rec.PlatoonIdentifier, i) then
//          begin
//            PlatoonOnship := TPlatoon(KompiOnship.PlatoonList.Items[i]);
//
//            if GetPersonel(PlatoonOnship.GroupList, rec.SelectedIdentifier, Tpersonel(GroupOnShip), 4, idx) then
//            begin
//              {dicek track Id, antrian, status}
//              CopyArrayToStr(rec.TrackIdent, data);
//              PlatoonOnship.GroupList.Delete(idx);
//              papi.UpdateStatus := True;
//            end;
//          end
//        end
//      end
//    end;

    if (GroupOnShip <> nil)then
    begin
      vIndex  := rec.IDPlatformClass;
      nIndex  := rec.EmbarkPlatformID;

      FDeployedPlatform := CreatePlatformInstanceRP(1, vIndex, nIndex);

      if not(assigned(FDeployedPlatform)) then
        exit;

      with FDeployedPlatform do
      begin
        FData.Track_ID                      := GroupOnShip.Identifier;
        FData.Instance_Name                 := GroupOnShip.Identifier;

        if rec.Hosted_Index = 0 then
        Begin
          if FData.Platform_Instance_Index = 0 then
            FData.Platform_Instance_Index :=  GetSerialPlatformID;
        End
        else
        begin
          if LoadFromSnapshot then
          begin
            FData.Platform_Instance_Index := rec.Hosted_Index;
            FLastPlatformID := rec.Hosted_Index + 1;
          end
          else
            FData.Platform_Instance_Index := rec.Hosted_Index;
        end;

        FData.Force_Designation           := papi.Force_Designation;
        FActivation.Init_Position_Longitude := papi.getPositionX;
        FActivation.Init_Position_Latitude  := papi.getPositionY;

        case papi.VehicleDefinition.FData.GangwayPosition of
          0 :   //haluan
          begin
            FActivation.Init_Course := papi.Course;
          end;
          1 :  //buritan
          begin
            FActivation.Init_Course := papi.Course + 180;
            if FActivation.Init_Course > 360 then
              FActivation.Init_Course := FActivation.Init_Course - 360;
          end;
          2:  //lambung tengah
          begin
            FActivation.Init_Course := papi.Course;
          end;
          3:  //none
          begin
            FActivation.Init_Course := papi.Course;
          end;
        end;

        FActivation.Init_Altitude           := 0;
        FActivation.Init_Ground_Speed       := 0;
        FActivation.Init_Fuel := Motion.FData.Max_Fuel_Capacity;
        FActivation.Init_Lubricants := Logistic.FData.Max_Lubricants_Capacity;
        FActivation.Init_Freshwater := Logistic.FData.Max_Freshwater_Capacity;
        FActivation.Init_Water := Logistic.FData.Max_Water_Capacity;
        FActivation.Init_Ration := Logistic.FData.Max_Ration_Capacity;
      end;

      FLaunchPlatform := SimAssetAssignment(FDeployedPlatform);

      if (Assigned(FLaunchPlatform)) and (FLaunchPlatform is TT3Vehicle) then
      begin
        FLaunchPlatform.PosX := papi.getPositionX;
        FLaunchPlatform.PosY := papi.getPositionY;
        FLaunchPlatform.PosZ := papi.getPositionZ;

        if (TT3Vehicle(FLaunchPlatform).VehicleDefinition.FData.Platform_Domain = vhdAir) then
        begin
          TT3Vehicle(FLaunchPlatform).OrderedAltitude := 100;   //--> default launch dengan ketingian = 100
        end;

        if (TT3Vehicle(FLaunchPlatform).VehicleDefinition.FData.Platform_Domain <> vhdAir) then
          TT3Vehicle(FLaunchPlatform).OrderedSpeed := 3;

        FLaunchPlatform.UnitGroup       := papi.UnitGroup;
        FLaunchPlatform.GroupIndex      := papi.GroupIndex;

        // asumsi langsung launch
        FLaunchPlatform.Parent          := nil;
        TT3Vehicle(FLaunchPlatform).LeaderPlatform := papi;
        TT3Vehicle(FLaunchPlatform).DisEmbarkProsess := True;
        TT3Vehicle(FLaunchPlatform).HostIdTransport := papi.InstanceIndex;
        FLaunchPlatform.Enable          := papi.Enable;

        grp := FScenario.CubiclesGroupsListFromDB.GetGroupOf_PlatformIndex(rec.ParentPlatformID) ;

        if Assigned(grp) then begin
          grp.AddMember(TT3Vehicle(FLaunchPlatform).InstanceIndex);
          TT3Vehicle(FLaunchPlatform).GroupIndex := grp.FData.Group_Index;
          TT3Vehicle(FLaunchPlatform).TrackNumber := grp.GetTrackNumber(rec.EmbarkPlatformID);
        end
        else
        begin
          FLaunchPlatform.TrackNumber := 0;
        end;

        result := FLaunchPlatform;
      end;
    end;
  end;
end;

procedure TT3SimManager.DisembarkWithTransported(const rec: TRecCmd_Transport);
var
  i : Integer;
  airQuantityTemp  : Integer;
  personelQuantityTemp : Integer;

  airWeightTemp : Double;
  onboardWeightTemp : Double;
  hullWeightTemp : Double;
  personelWeightTemp : Double;

  sumSpaceTemp : Double;

  hostShipTemp : TT3Vehicle;
  newhostShipTemp : TT3Vehicle;
  memberShipTemp : TT3Vehicle;

  shipTemp    : TT3Vehicle;

begin

  {$REGION ' Pengecekan kapal yang mengangkut '}
  hostShipTemp := FindT3PlatformByID(rec.HostPlatformID) as TT3Vehicle;

  if hostShipTemp = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang diangkut '}
  memberShipTemp := FindT3PlatformByID(rec.MemberPlatformID) as TT3Vehicle;

  if memberShipTemp = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang baru mengangkut '}
  newhostShipTemp := FindT3PlatformByID(rec.NewHostPlatformID) as TT3Vehicle;

  if newhostShipTemp = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Proses Embark Ke Kapal yg baru'}
  memberShipTemp.StateTransport := rec.StateTransport;
  memberShipTemp.HostIdTransport := newhostShipTemp.InstanceIndex;

  case memberShipTemp.PlatformDomain of
    vhdLand :
    begin
      if (memberShipTemp.PlatformCategory =  2) and (memberShipTemp.PlatformType =  0) then
      begin
        memberShipTemp.MemberLoadState := mlsStandby;
        newhostShipTemp.HostLoadState := hlsReady;
      end
      else
      begin
        memberShipTemp.MemberLoadState := mlsQueue;
        newhostShipTemp.HostLoadState := hlsLoading;
      end;
    end;
  end;

  newhostShipTemp.MemberTransportList.Add(memberShipTemp);
  {$ENDREGION}

  {$REGION ' Refresh data kapasitas kapal baru '}
  airQuantityTemp := 0;
  airWeightTemp := 0;
  onboardWeightTemp := 0;
  hullWeightTemp := 0;
  personelQuantityTemp := 0;
  personelWeightTemp := 0;

  for i := 0 to newhostShipTemp.MemberTransportList.Count - 1 do
  begin
    shipTemp := newhostShipTemp.MemberTransportList.Items[i];

    case shipTemp.PlatformDomain of
      vhdAir :
      begin
        {$REGION ' Air Section '}
        airQuantityTemp  := airQuantityTemp + 1;
        airWeightTemp    := airWeightTemp + shipTemp.SumCurrentWeight;
        {$ENDREGION}
      end;
      vhdSurface,vhdSubsurface :
      begin
        {$REGION ' Surface & Subsurface Section '}
        onboardWeightTemp    := onboardWeightTemp + shipTemp.SumCurrentWeight;
        {$ENDREGION}
      end;
      vhdLand :
      begin
        if (memberShipTemp.PlatformCategory =  2) and (memberShipTemp.PlatformType =  0) then
        begin
          {$REGION ' Personel Section '}
          personelQuantityTemp  := personelQuantityTemp + shipTemp.VehicleDefinition.FData.Quantity_Group_Personal;
          personelWeightTemp    := personelWeightTemp + shipTemp.VehicleDefinition.FData.Weight;
          {$ENDREGION}
        end
        else
        begin
          {$REGION ' Land Section '}
          hullWeightTemp := hullWeightTemp + shipTemp.SumCurrentWeight;
          sumSpaceTemp   := sumSpaceTemp + (shipTemp.VehicleDefinition.FData.Width * shipTemp.VehicleDefinition.FData.Length);
          {$ENDREGION}
        end;
      end;
      vhdAmphibious :
      begin
        {$REGION ' Amphibious Section '}
        hullWeightTemp := hullWeightTemp + shipTemp.SumCurrentWeight;
        sumSpaceTemp   := sumSpaceTemp + (shipTemp.VehicleDefinition.FData.Width * shipTemp.VehicleDefinition.FData.Length);
        {$ENDREGION}
      end;
    end;
  end;

  newhostShipTemp.CurrentHanggarWeight :=  airWeightTemp;
  newhostShipTemp.CurrentHanggarCapacity := airQuantityTemp;

  newhostShipTemp.CurrentOnBoardWeight := onboardWeightTemp;

  newhostShipTemp.CurrentHullWeight := hullWeightTemp;
  newhostShipTemp.CurrentHullSpace := sumSpaceTemp;

  newhostShipTemp.CurrentPersonelWeight := personelWeightTemp;
  newhostShipTemp.CurrentPersonelCapacity := personelQuantityTemp;

  newhostShipTemp.SumCurrentWeight := airWeightTemp + onboardWeightTemp + hullWeightTemp + personelWeightTemp;
  {$ENDREGION}

  {$REGION ' Menghapus data kapal dari dalam kapal lama '}
  for i := 0 to hostShipTemp.MemberTransportList.Count - 1 do
  begin
    shipTemp := hostShipTemp.MemberTransportList.Items[i];

    if shipTemp.InstanceIndex = rec.MemberPlatformID then
    begin
      hostShipTemp.MemberTransportList.Delete(i);
      Break;
    end
  end;
  {$ENDREGION}

  {$REGION ' Refresh data kapasitas kapal lama '}
  airQuantityTemp := 0;
  airWeightTemp := 0;
  onboardWeightTemp := 0;
  hullWeightTemp := 0;
  personelQuantityTemp := 0;
  personelWeightTemp := 0;

  for i := 0 to hostShipTemp.MemberTransportList.Count - 1 do
  begin
    shipTemp := hostShipTemp.MemberTransportList.Items[i];

    case shipTemp.PlatformDomain of
      vhdAir :
      begin
        {$REGION ' Air Section '}
        airQuantityTemp  := airQuantityTemp + 1;
        airWeightTemp    := airWeightTemp + shipTemp.SumCurrentWeight;
        {$ENDREGION}
      end;
      vhdSurface,vhdSubsurface :
      begin
        {$REGION ' Surface & Subsurface Section '}
        onboardWeightTemp    := onboardWeightTemp + shipTemp.SumCurrentWeight;
        {$ENDREGION}
      end;
      vhdLand :
      begin
        if (memberShipTemp.PlatformCategory =  2) and (memberShipTemp.PlatformType =  0) then
        begin
          {$REGION ' Personel Section '}
          personelQuantityTemp  := personelQuantityTemp + shipTemp.VehicleDefinition.FData.Quantity_Group_Personal;
          personelWeightTemp    := personelWeightTemp + shipTemp.VehicleDefinition.FData.Weight;
          {$ENDREGION}
        end
        else
        begin
          {$REGION ' Land Section '}
          hullWeightTemp := hullWeightTemp + shipTemp.SumCurrentWeight;
          sumSpaceTemp   := sumSpaceTemp + (shipTemp.VehicleDefinition.FData.Width * shipTemp.VehicleDefinition.FData.Length);
          {$ENDREGION}
        end;
      end;
      vhdAmphibious :
      begin
        {$REGION ' Amphibious Section '}
        hullWeightTemp := hullWeightTemp + shipTemp.SumCurrentWeight;
        sumSpaceTemp   := sumSpaceTemp + (shipTemp.VehicleDefinition.FData.Width * shipTemp.VehicleDefinition.FData.Length);
        {$ENDREGION}
      end;
    end;
  end;

  hostShipTemp.CurrentHanggarWeight :=  airWeightTemp;
  hostShipTemp.CurrentHanggarCapacity := airQuantityTemp;

  hostShipTemp.CurrentOnBoardWeight := onboardWeightTemp;

  hostShipTemp.CurrentHullWeight := hullWeightTemp;
  hostShipTemp.CurrentHullSpace := sumSpaceTemp;

  hostShipTemp.CurrentPersonelWeight := personelWeightTemp;
  hostShipTemp.CurrentPersonelCapacity := personelQuantityTemp;

  hostShipTemp.SumCurrentWeight := airWeightTemp + onboardWeightTemp + hullWeightTemp + personelWeightTemp;
  {$ENDREGION}

end;

function TT3SimManager.LaunchEmbarkPlatform(const rec : TRecCmd_Embark) : TT3PlatformInstance;
var
  i,j, count, vIndex, nIndex: integer;
  papi : TT3Vehicle;
  aObj : TObject;
  hostPlatform, candidatePf : TT3EmbarkedVehicle;
  queueEmbark, candidate  : TQueuedEmbarkedLaunch;
  pi : TPlatform_Instance;
  grp  : T3CubicleGroup;
begin
  result := nil;

  aObj := FindT3PlatformByID(rec.ParentPlatformID);
  if not (aObj is TT3Vehicle) then exit;

  candidate := nil;
  candidatePf := nil;

  papi   := TT3Vehicle(aObj);
  if not(assigned(papi)) then exit;

  count  := papi.EmbarkedVehicles.Count;
  if count <= 0 then exit;

  { F I F O }
  for I := 0 to Count - 1 do
  begin
    hostPlatform  := TT3EmbarkedVehicle(papi.EmbarkedVehicles.Items[i]);
    if not(assigned(hostPlatform)) then Continue;

    for j := 0 to hostPlatform.getQueueCount - 1 do
    begin
      queueEmbark := hostPlatform.getQueueItem(j);
      if not(assigned(queueEmbark)) then Continue;
//      if not(queueEmbark.ReadyToLaunch) then Continue;


//      if ((candidate = nil) or (candidate.QueueNumber > queueEmbark.QueueNumber)) then
        //and (rec.TrackIdent = queueEmbark.TrackID)) then
      if queueEmbark.QueueNumber = rec.QueueNum then
      begin
        candidatePf := hostPlatform;
        candidate   := queueEmbark;
        Break;
      end;
    end;

    if candidate <> nil then
      Break;
  end;

  if (candidate <> nil) or (candidatePf <> nil) then
  begin
    vIndex  := candidatePf.EmbarkedVehicle.Hosted_Vehicle_Index;
    nIndex  := rec.EmbarkPlatformID;

    pi      := CreatePlatformInstance(1, vIndex, nIndex);
    if not(assigned(pi)) then
      exit;

    with pi do
    begin
      FData.Track_ID                      := candidate.TrackID;
      FData.Instance_Name                 := candidate.LaunchName;

      if rec.EmbarkPlatformID = 0 then
        Begin
          if FData.Platform_Instance_Index = 0 then
            FData.Platform_Instance_Index :=  GetSerialPlatformID;
        End
      else
      begin
        if LoadFromSnapshot then
        begin
          FData.Platform_Instance_Index := rec.EmbarkPlatformID;
          FLastPlatformID := rec.EmbarkPlatformID + 1;
        end
        else
          FData.Platform_Instance_Index := rec.EmbarkPlatformID;
      end;

//      if FIsInstructor then
      FData.Force_Designation           := papi.Force_Designation;  //mk 03052012
//      else
//        FData.Force_Designation           := 3;

      //FData.Force_Designation             := papi.Force_Designation;
      FActivation.Init_Position_Longitude := papi.getPositionX;
      FActivation.Init_Position_Latitude  := papi.getPositionY;


      if candidatePf.EmbarkDefinition.FData.Platform_Domain = vhdAmphibious then
      begin
       FActivation.Init_Course             := candidate.InitialHeading + 180;
       if FActivation.Init_Course > 360 then
        FActivation.Init_Course := FActivation.Init_Course - 360;
      end
      else
       FActivation.Init_Course             := candidate.InitialHeading;


      case papi.VehicleDefinition.FData.GangwayPosition of
        0 :   //haluan
        begin
          FActivation.Init_Course := papi.Course;
        end;
        1 :  //buritan
        begin
          FActivation.Init_Course := papi.Course + 180;
          if FActivation.Init_Course > 360 then
            FActivation.Init_Course := FActivation.Init_Course - 360;
        end;
        2:  //lambung tengah
        begin
          FActivation.Init_Course := papi.Course;
        end;
        3:  //none
        begin
          FActivation.Init_Course := papi.Course;
        end;
      end;



      FActivation.Init_Altitude           := 0;
      FActivation.Init_Ground_Speed       := 0;
//      FActivation.Init_Logistic           := 100;

      FActivation.Init_Fuel := pi.Motion.FData.Max_Fuel_Capacity;
      FActivation.Init_Lubricants := pi.Logistic.FData.Max_Lubricants_Capacity;
      FActivation.Init_Freshwater := pi.Logistic.FData.Max_Freshwater_Capacity;
      FActivation.Init_Water := pi.Logistic.FData.Max_Water_Capacity;
      FActivation.Init_Ration := pi.Logistic.FData.Max_Ration_Capacity;
    end;

    FEmbarkedPlatform := SimAssetAssignment(pi);
    if (Assigned(FEmbarkedPlatform)) and (FEmbarkedPlatform is TT3Vehicle) then
    begin
      FEmbarkedPlatform.PosX := papi.getPositionX;
      FEmbarkedPlatform.PosY := papi.getPositionY;
      FEmbarkedPlatform.PosZ := papi.getPositionZ;

      TT3Vehicle(FEmbarkedPlatform).DormantTime := GameSetting.TimeRemoveWreck;

      if (TT3Vehicle(FEmbarkedPlatform).VehicleDefinition.FData.Platform_Domain = vhdAir) then
      begin
        TT3Vehicle(FEmbarkedPlatform).OrderedAltitude := 100;     //rec.InitZ;     --> default launch dengan ketingian = 100
      end;

      if (TT3Vehicle(FEmbarkedPlatform).VehicleDefinition.FData.Platform_Domain <> vhdAir) then
        TT3Vehicle(FEmbarkedPlatform).OrderedSpeed := 1; //add andik

      FEmbarkedPlatform.UnitGroup       := papi.UnitGroup;
      FEmbarkedPlatform.GroupIndex      := papi.GroupIndex;

      // asumsi langsung launch
      FEmbarkedPlatform.Parent          := nil; // parentnya adalah platform yg ngeluarkan (by aldy).
      TT3Vehicle(FEmbarkedPlatform).LeaderPlatform := papi;
      FEmbarkedPlatform.Enable          := papi.Enable;

      if (candidatePf.Quantity = 0) and (candidatePf.Readying = 0) and (candidatePf.LaunchAlert = 0) then
      begin
        papi.EmbarkedVehicles.Remove(candidatePf);
        candidatePf.Free;
      end;

      candidatePf.removeQueueItem(candidate);
      candidatePf.LaunchAlert := candidatePf.LaunchAlert - 1;

    {  grp  := FScenario.CubiclesGroupsList.GetGroupByID2(rec.GrpID) as T3CubicleGroup;
      if Assigned(grp) then
      begin
        FEmbarkedPlatform.GroupIndex := grp.FData.Group_Index;
        FEmbarkedPlatform.TrackNumber := grp.GetTrackNumber(FEmbarkedPlatform.InstanceIndex);
        grp.AddMember(FEmbarkedPlatform.InstanceIndex);
      end
      else
      begin
        FEmbarkedPlatform.TrackNumber := 0;
      end;  }


      grp := FScenario.CubiclesGroupsListFromDB.GetGroupOf_PlatformIndex(rec.ParentPlatformID) ;

      if Assigned(grp) then begin
        grp.AddMember(TT3Vehicle(FEmbarkedPlatform).InstanceIndex);
        TT3Vehicle(FEmbarkedPlatform).GroupIndex := grp.FData.Group_Index;
        TT3Vehicle(FEmbarkedPlatform).TrackNumber := grp.GetTrackNumber(rec.EmbarkPlatformID);
      end
      else
      begin
        FEmbarkedPlatform.TrackNumber := 0;
      end;

      result := FEmbarkedPlatform;
    end;
  end;
end;

function TT3SimManager.TakeOffFromBase(const rec: TRecCmd_LaunchRP): Boolean;
var
  i, j : integer;

  _Base : TPlatformBase;
  _TransportedOnBaseSelected : TPlatform_Embark_Library;
begin
  for i := 0 to VScenario.BaseListFromDB.Count - 1 do
  begin
    _Base := TPlatformBase(VScenario.BaseListFromDB.Items[i]);

    {variabel rec.MaxColumnIndex tak pinjem buat penanda id list kapal dipangkalan, biar gak usah ngerubah paket di plug in}
    if _Base.id = rec.MaxColumnIndex then
    begin
      for j := 0 to _Base.ListVehicle.Count - 1 do
      begin
        _TransportedOnBaseSelected := TPlatform_Embark_Library(_Base.ListVehicle.Items[j]);
        if _TransportedOnBaseSelected.FData.Vehicle_Index = rec.RPPlatformID then
        begin
          _TransportedOnBaseSelected.FData.Quantity := _TransportedOnBaseSelected.FData.Quantity - 1;
          Break;
        end;
      end;
      Break
    end;
  end;
end;

procedure TT3SimManager.LauncherChaffProp(
  const rec: TRecCmd_ChaffLauncherProperties);
var
    pi: TT3PlatformInstance;
    lc: TObject;
begin
  pi   := FindT3PlatformByID(rec.ParentPlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    Exit;

  lc  := TT3Vehicle(pi).FindDevice(TT3ChaffLauncher,rec.LauncherID);

  if not Assigned(lc) then
    Exit;

  case rec.Tag of
    1 : TT3ChaffLauncher(lc).Angle := rec.Bearing;
    2 : TT3ChaffLauncher(lc).BloomRange := rec.BloomRange;
    3 : TT3ChaffLauncher(lc).BloomAltitude := rec.BloomAltitude;
    4 : TT3ChaffLauncher(lc).SalvoSize := rec.SalvoSize;
    5 : TT3ChaffLauncher(lc).Delay := rec.Delay;
  end;

  TT3ChaffLauncher(lc).IDState := rec.IDState;
end;

function TT3SimManager.LauncherChaffState(
  const rec: TRecCmd_LaunchChaffState): TObject;
var
    pi: TT3PlatformInstance;
    cob, lc: TObject;
begin
  result := nil;
  pi   := FindT3PlatformByID(rec.ParentPlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    exit;

  cob := TT3Vehicle(pi).FindDevice(TT3ChaffOnVehicle,rec.ChaffOnVehicleID);
  lc  := TT3ChaffOnVehicle(cob).ChaffLaunchers.Items[rec.LauncherID];

  if not Assigned(lc) then
    Exit;

  TT3ChaffLauncher(lc).ChaffInstanceIndex := rec.ChaffOnVehicleID;

  {$IfDef SERVER}
  TT3ChaffLauncher(lc).OnFire     := ChaffLauncherFire;
  TT3ChaffLauncher(lc).OnStopFire := ChaffLauncherStop;
  {$EndIf}

  if (cob = nil) or (lc = nil) then exit;

  TT3ChaffLauncher(lc).State  := rec.StateID;
  TT3ChaffLauncher(lc).Qty    := rec.Qty;
end;

function TT3SimManager.LaunchHybrid(const rec: TRecCmd_LaunchMissile): TObject;
var
    pi : TT3PlatformInstance;
    mis: TObject;
    projectile : TT3HybridMissile;
//    torpedoprojectile : TT3Torpedo;
begin
  result := nil;
  pi   := FindT3PlatformByID(rec.ParentPlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    exit;

  mis := TT3Vehicle(pi).getWeapon(rec.MissileID, rec.MissileName);

  if mis <> nil then begin

    projectile := TT3HybridOnVehicle(mis).PrepareLaunch;
//    torpedoprojectile := projectile.LoadedTorpedo;

    if not(Assigned(projectile)) then Exit;

    projectile.Environment := Self.GameEnvironment;
    projectile.GameDefaults := Self.GameDefaults;
    projectile.WeaponOnVehicleID := TT3HybridOnVehicle(mis).InstanceIndex;

    AssignWeaponEvent(projectile);
    projectile.Course := pi.Course;

    projectile.Parent         := nil;
    projectile.PlatformDomain :=  0;
    projectile.Launched       := True;
    projectile.WeaponOnVehicleID := TT3HybridOnVehicle(mis).InstanceIndex ;
    projectile.TargetPlatforms := SimPlatforms;

    //untuk torpedo yang dbwa missile
//    torpedoprojectile.Environment := Self.GameEnvironment;
//    torpedoprojectile.GameDefaults := Self.GameDefaults;

//    AssignWeaponEvent(torpedoprojectile);
//    torpedoprojectile.TargetPlatforms := SimPlatforms;


    if projectile.UnitGroup then
      projectile.Planned    := true;

    if FIsInstructor or FIsWasdal or projectile.UnitGroup then
      projectile.Visible := True
    else
      projectile.Visible := False;

    if rec.ProjectileInstanceIndex = 0 then
    begin
      projectile.InstanceIndex := GetSerialPlatformID;

      //torpedo
//      torpedoprojectile.InstanceIndex := projectile.InstanceIndex;
//      torpedoprojectile.InstanceName := projectile.InstanceName;
    end
    else
    begin
      if LoadFromSnapshot then
      begin
        projectile.InstanceIndex := rec.ProjectileInstanceIndex;

        //torpedo
//        torpedoprojectile.InstanceIndex := projectile.InstanceIndex;
//        torpedoprojectile.InstanceName := projectile.InstanceName;
        FLastPlatformID := rec.ProjectileInstanceIndex + 1;
      end
      else
      begin
        projectile.InstanceIndex := rec.ProjectileInstanceIndex;

        //torpedo
//        torpedoprojectile.InstanceIndex := projectile.InstanceIndex;
//        torpedoprojectile.InstanceName := projectile.InstanceName;
      end;
    end;

    result := projectile;

  end;
end;

procedure TT3SimManager.LauncherBubbleProp(
  const rec: TRecCmd_BubbleLauncherProperties);
var
    pi: TT3PlatformInstance;
    lc: TObject;
begin
  pi   := FindT3PlatformByID(rec.ParentPlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    exit;

  lc  := TT3Vehicle(pi).FindDevice(TT3AirBubbleOnVehicle,rec.LauncherID);
  if not Assigned(lc) then exit;

  TT3AirBubbleOnVehicle(lc).BloomDepth  := rec.BloomDepth;
  TT3AirBubbleOnVehicle(lc).SalvoSize  := rec.SalvoSize;
  TT3AirBubbleOnVehicle(lc).Angle := rec.Bearing;
end;

function TT3SimManager.LaunchMine(const rec: TRecCmd_LaunchMine): TObject;
var
  pi          : TT3PlatformInstance;
  min         : TObject;
  projectile  : TT3Mine;
begin
  Result := nil;
  pi     := FindT3PlatformByID(rec.ParentPlatformID);

  if not Assigned(pi) then
    Exit;

  min := TT3Vehicle(pi).getWeapon(rec.MineOnVehicleID, TT3MineOnVehicle);

  if (min <> nil) {and (TT3MineOnVehicle(min).WeaponStatus <> wsDamaged)} then
  begin
    TT3MineOnVehicle(min).Planned := false;

    projectile := TT3MineOnVehicle(min).PrepareDrop;
    if Assigned(projectile) then
    begin
      projectile.Environment  := Self.GameEnvironment;
      projectile.GameDefaults := Self.GameDefaults; //mm gd

      AssignWeaponEvent(projectile);

      if projectile.UnitDefinition is TMine_On_Board then begin
        if rec.Depth < TMine_On_Board(projectile.UnitDefinition).FMine_Def.Max_Laying_Depth * C_Feet_To_Meter then
          projectile.OrderDepth := rec.Depth
        else
          projectile.OrderDepth := TMine_On_Board(projectile.UnitDefinition).FMine_Def.Max_Laying_Depth * C_Feet_To_Meter;
      end else
      if projectile.UnitDefinition is TMine_Definition then begin
        if rec.Depth < TMine_Definition(projectile.UnitDefinition).FData.Max_Laying_Depth * C_Feet_To_Meter then
          projectile.OrderDepth := rec.Depth
        else
          projectile.OrderDepth := TMine_Definition(projectile.UnitDefinition).FData.Max_Laying_Depth * C_Feet_To_Meter;
      end;

      projectile.TargetPlatforms  := SimPlatforms;
      projectile.Launched         := true;
      projectile.Parent           := nil;
      projectile.PlatformDomain   :=  2;
      projectile.RangeArea := rec.Range;
      projectile.CountMine := rec.Count;

      if pi is TT3Vehicle then
      begin
        if (TT3Vehicle(pi).PlatformDomain = vhdSurface) or (TT3Vehicle(pi).PlatformDomain = vhdSubsurface)  then
          projectile.MineType := 0
        else
          projectile.MineType := 1;
      end;

      projectile.WeaponOnVehicleID := TT3MineOnVehicle(min).InstanceIndex ;

      if FIsInstructor or FIsWasdal or projectile.UnitGroup then
        projectile.Visible := True
      else
        projectile.Visible := False;

      if rec.ProjectileInstanceIndex = 0 then
       // server
        projectile.InstanceIndex := GetSerialPlatformID
      else
      begin
        if LoadFromSnapshot then
        begin
          projectile.InstanceIndex := rec.ProjectileInstanceIndex;
          FLastPlatformID := rec.ProjectileInstanceIndex + 1;
        end
        else
          projectile.InstanceIndex := rec.ProjectileInstanceIndex;
      end;

      result := projectile;
    end;
  end;
end;

function TT3SimManager.LaunchBomb(const rec: TRecCmd_LaunchBomb): TObject;
var
  pi, tgt     : TT3PlatformInstance;
  bom         : TObject;
  projectile  : TT3Bomb;
begin
  Result := nil;
  pi     := FindT3PlatformByID(rec.ParentPlatformID);

  tgt    := FindT3PlatformByID(rec.TargetPlatformID);

  if tgt = nil then
    tgt    := FindNonRealPlatformByID(rec.TargetPlatformID);

  if ((pi = nil) and not (pi is TT3Vehicle)) or (tgt = nil) then
    exit;

  bom := TT3Vehicle(pi).getWeapon(rec.BombOnVehicleID, TT3BombONVehicle);

  if (bom <> nil) {and (TT3BombONVehicle(bom).WeaponStatus <> wsDamaged)} then
  begin
    if Assigned(tgt) then
      TT3BombONVehicle(bom).TargetObject := tgt;

    TT3BombONVehicle(bom).Planned   := false;
    TT3BombONVehicle(bom).SalvoSize := rec.SalvoSize;

    projectile := TT3BombONVehicle(bom).PrepareDrop;
    if Assigned(projectile) then
    begin
      projectile.Environment  := Self.GameEnvironment;
      projectile.GameDefaults := Self.GameDefaults; //mm gd

      AssignWeaponEvent(projectile);

      projectile.OrderDepth := rec.Depth;

      projectile.TargetPlatforms  := SimPlatforms;
      projectile.Launched         := true;
      projectile.Parent           := nil;
      projectile.WeaponOnVehicleID:= TT3BombONVehicle(bom).InstanceIndex;

      if TBombType(rec.BombType) = btRocket then
      begin
        projectile.PosX := rec.TargetPosX;
        projectile.PosY := rec.TargetPosY;
      end;

//      if pi is TT3Vehicle then
//      begin
//
//        case TBombType(rec.BombType) of
//          btBomb, btDepthCharge :
//          begin
//            if (TT3Vehicle(pi).PlatformDomain = vhdAir) then
//              projectile.BombType := Byte(btBomb)
//            else
//              projectile.BombType := Byte(btDepthCharge);
//          end;
//          btRocket :
//          begin
//            projectile.BombType := Byte(btRocket);
//            projectile.PosX := rec.TargetPosX;
//            projectile.PosY := rec.TargetPosY;
//          end;
//        end;
//      end;

      if FIsInstructor or FIsWasdal or projectile.UnitGroup then
        projectile.Visible := True
      else
        projectile.Visible := False;

      if rec.ProjectileInstanceIndex = 0 then
        projectile.InstanceIndex := GetSerialPlatformID
      else
      begin
        if LoadFromSnapshot then
        begin
          projectile.InstanceIndex := rec.ProjectileInstanceIndex;
          FLastPlatformID := rec.ProjectileInstanceIndex + 1;
        end
        else
          projectile.InstanceIndex := rec.ProjectileInstanceIndex;
      end;

      projectile.IDNameBomb := rec.NameBombVbs;

      result := projectile;
    end;
  end;
end;

function TT3SimManager.LaunchSonobuoy(const rec: TRecCmd_LaunchSonobuoy): TObject;
var
  pi         : TT3PlatformInstance;
  Son        : TObject;
  Sonobuoy   : TT3Sonobuoy;
begin
  Result := nil;
  Sonobuoy := nil;
  pi := FindT3PlatformByID(rec.ParentPlatformID);

  if not Assigned(pi) then
    Exit;

  Son := TT3Vehicle(pi).FindDevice(TT3SonobuoyOnVehicle, rec.SonobuoyOnVehicleID);

  if (Son <> nil) {and (TT3SonobuoyOnVehicle(Son).OperationalStatus <> sopDamage)} then
  begin
    Sonobuoy := TT3SonobuoyOnVehicle(Son).PrepareDrop;
    if not Assigned(Sonobuoy) then exit;

    Sonobuoy.Environment := Self.GameEnvironment;
    Sonobuoy.GameDefaults := Self.GameDefaults;
    Sonobuoy.OnSonobuoyPassiveDetect := EventManager.OnSonobuoyPassiveDetect;

    if Assigned(SimPlatforms) then Sonobuoy.SimPlatforms := SimPlatforms;

    AssignECmEvent(Sonobuoy);
    Sonobuoy.Owner  := pi;
    Sonobuoy.SonobuoyID := rec.SonobuoyOnVehicleID;
    Sonobuoy.Parent           := nil;

    if rec.Depth < Sonobuoy.SonobuoyDefinition.FDef.Max_Depth then
      Sonobuoy.OrderDepth := rec.Depth
    else
      Sonobuoy.OrderDepth := Sonobuoy.SonobuoyDefinition.FDef.Max_Depth;

    if FIsInstructor or FIsWasdal or Sonobuoy.UnitGroup then
      Sonobuoy.Visible := True
    else
      Sonobuoy.Visible := False;

    Sonobuoy.PlatformDomain := 2;
    Sonobuoy.Launch;
    Sonobuoy.Enable := true;

    if rec.ProjectileInstanceIndex = 0 then
      Sonobuoy.InstanceIndex := GetSerialPlatformID
    else
    begin
      if LoadFromSnapshot then
      begin
        Sonobuoy.InstanceIndex := rec.ProjectileInstanceIndex;
        FLastPlatformID := rec.ProjectileInstanceIndex + 1;
      end
      else
        Sonobuoy.InstanceIndex := rec.ProjectileInstanceIndex;
    end;

//    if FIsInstructor then
      Sonobuoy.Track_ID := 'SON';
//    else
//      Sonobuoy.Track_ID := IntToStr(Sonobuoy.InstanceIndex);

    Sonobuoy.ControlMode := TSonarControlMode(rec.SonobuoyMode);
    if Sonobuoy.ControlMode = scmActive then
      Sonobuoy.FRangeSonobuoy := Sonobuoy.FRangeActive
    else if Sonobuoy.ControlMode = scmPassive then
      Sonobuoy.FRangeSonobuoy := Sonobuoy.FRangePassive;
  end;

  result := Sonobuoy;
end;

//function TT3SimManager.OnCheckBombHit(sender : TObject): Integer;
//var
//  mine : TT3Mine;

////  bomb : TT3Bomb;
//  I: Integer;
//  pl : TT3PlatformInstance;
//  range : Double;
//  r : Double;
//  prob : Double;
//  lethal : Double;
//  pmine : TT3MineOnVehicle;
////  pBomb : TT3BombONVehicle;

//  policyRange : Double;
//  policyVehicle : Double;

//  check : Boolean;
//begin
//  Result := 0;

//  if sender is TT3Mine then
//  begin
//     if TT3Mine(sender).MineAktif then
//     begin

////      mine := sender as TT3Mine;                                               DrawEscape();
//      lethal := mine.MineDefinition.FMine_Def.Mine_Lethality;

//      for I := 0 to SimPlatforms.itemCount - 1 do
//      begin
//        pl := SimPlatforms.getObject(I) as TT3PlatformInstance;
//        if ((pl.TrackDomain <> vhdSurface) or (pl.PlatformDomain <> vhdSurface))
//          AND ((pl.TrackDomain <> vhdSubsurface) or (pl.PlatformDomain <> vhdSubsurface)) then
//          Continue;

//        //check apakah dia capable terhadap platform ini.
//        //check surface---------------------------------

//        if (pl.TrackDomain = vhdSurface) or (pl.PlatformDomain = vhdSurface) then
//        begin
//          if (mine.MineDefinition.FMine_Def.Anti_Sur_Capable = 0) then
//            Continue;
//        end;

//        if (pl.TrackDomain = vhdSubsurface) or (pl.PlatformDomain = vhdSubsurface) then
//        begin
//          if (mine.MineDefinition.FMine_Def.Anti_SubSur_Capable = 0) then
//            Continue;
//        end;

//        range := CalcRange(mine.Mover.X, mine.Mover.Y, TT3Vehicle(pl).Mover.X, TT3Vehicle(pl).Mover.Y);

//        policyRange := abs(range - (mine.MineDefinition.FMine_Def.Engagement_Range * C_Feet_To_Meter * C_Feet_To_Meter * C_Meter_To_NauticalMile));
//        policyVehicle := 1;

//        if (policyRange > policyVehicle) then
//          Continue;

//        prob := mine.getPOD(range);

//       if  prob > 0 then
//        begin
//          if Assigned(mine.OnHit) then
//          begin
//            TT3PlatformInstance(mine).InstanceName:= mine.MineDefinition.FData.Instance_Identifier;
//            mine.OnHit(mine, pl, Round(lethal));
//            TT3Mine(sender).MineAktif := False;
//            TT3Mine(Sender).FreeMe := True;
//            Result := pl.InstanceIndex;
//          end;
//        end;

//      end;
//    end;
//  end;

  { if (sender is TT3Bomb) then
  begin
    if TT3Bomb(sender).BombAktif then
    begin

      bomb := sender as TT3Bomb;
      lethal := bomb.BombDefinition.FData.Lethality;
      targetBomb:=TT3Weapon(sender).TargetObject as TT3PlatformInstance;

     { for I := 0 to SimPlatforms.itemCount - 1 do
      begin
        pl := nil;
        pl := SimPlatforms.getObject(I) as TT3PlatformInstance;

        if ((pl.TrackDomain <> vhdSurface) or (pl.PlatformDomain <> vhdSurface))
          and ((pl.TrackDomain <> vhdSubsurface) or (pl.PlatformDomain <> vhdSubsurface))
          and ((pl.PlatformDomain <> vhdLand) or (pl.PlatformDomain <> vhdLand)) then
          Continue;

        //check apakah dia capable terhadap platform ini.
        //check surface---------------------------------

        if (pl.TrackDomain = vhdSurface) or (pl.PlatformDomain = vhdSurface) then
        begin
          if (bomb.BombDefinition.FData.Anti_Sur_Capable = 0) then
            check := True;
        end;

        if (pl.TrackDomain = vhdSubsurface) or (pl.PlatformDomain = vhdSubsurface) then
        begin
          if (bomb.BombDefinition.FData.Anti_SubSur_Capable = 0) then
            check := true;
        end;

        if (pl.TrackDomain = vhdLand) or (pl.PlatformDomain = vhdLand) then
        begin
          if (bomb.BombDefinition.FData.Anti_Land_Capable = 0) then
            check := true;
        end;

        if not check then
          Continue;

        range := 0;
        //range := CalcRange3D(bomb.PosX, bomb.PosY, bomb.PosZ, pl.PosX, pl.PosY, pl.PosZ);
        range := CalcRange(bomb.PosX, bomb.PosY, targetBomb.PosX, targetBomb.PosY);
  //      pBomb := TT3Vehicle(pl).getWeapon(bomb.BombDefinition.FData.Bomb_Index, TT3BombONVehicle) as TT3BombONVehicle;

       // policyRange := abs(range - (bomb.BombDefinition.FData.Max_Range * C_Feet_To_Meter * C_Feet_To_Meter * C_Meter_To_NauticalMile));
       // policyVehicle := 1 ;//TT3Vehicle(pl).VehicleDefinition.FData.Length / 2 * C_Feet_To_Meter * C_Feet_To_Meter * C_Meter_To_NauticalMile;

  //      if (policyRange < policyVehicle)
  //        or (range < bomb.BombDefinition.FData.Min_Range)
  //        or (Assigned(pBomb)) then
  //        Continue; //teruskan ke selanjutnya;

        r := Random(100) / 100;

        prob := bomb.getPOH(range);

        if r < prob then //hit
        begin
          if Assigned(bomb.OnHit) then
          begin
            TT3PlatformInstance(bomb).InstanceName:= bomb.BombDefinition.FData.Bomb_Identifier;
            bomb.OnHit(bomb, targetBomb, Round(lethal));
            TT3Bomb(sender).BombAktif := False;
            Result := targetBomb.InstanceIndex;
          end;
        end;
     // end;
    end;
  end;  }
//end;

//procedure TT3SimManager.CheckAllMineBomb(aDeltaMs : Double);
//var
//  FDelay : Double;
//  I: Integer;
//  dev : TSimObject;
//begin
//  if SimWeapons.itemCount < 1 then
//    Exit;

//  FDelay := 5;

//  FCounterBombMine := FCounterBombMine + aDeltaMs;

//  if FCounterBombMine > FDelay then
//  begin
//    for I := 0 to SimWeapons.itemCount - 1 do
//    begin
//      dev := SimWeapons.getObject(I);
//      if (dev is TT3Mine) or (dev is TT3Bomb) then
//      begin
//        OnCheckBombHit(dev);
//      end;
//    end;

//    FCounterBombMine := 0;
//   // FCounterSensor := 0;
//  end;
//end;

//procedure TT3SimManager.OnMineMove(sender :TObject);
//var
//  mine : TT3Mine;
//  I: Integer;
//  pl : TT3PlatformInstance;
//  nearestPl : TT3PlatformInstance;
//  range : Double;
//  nearestRange : Double;
//  pmine : TT3MineOnVehicle;
//begin
//  if not (sender is TT3Mine) then
//    Exit;

//  mine := sender as TT3mine;
//  nearestRange := 100000;
//  nearestPl := nil;;

//  //get nearest platform to mine and in range of detonation mine
//  for I := 0 to SimPlatforms.itemCount - 1 do
//  begin
//    pl := SimPlatforms.getObject(I) as TT3PlatformInstance;
//    range := CalcRange3D(mine.PosX, mine.PosY, mine.PosZ, pl.PosX, pl.PosY, pl.PosZ);

//    pmine := TT3vehicle(pl).getWeapon(mine.MineDefinition.FData.Fitted_Weap_Index, TT3MineOnVehicle) as TT3MineOnVehicle;

//    if Assigned(pmine) then
//      Continue;

//    if range < nearestRange then
//    begin
//      nearestRange := range;
//      nearestPl := pl;
//    end;
//  end;

//  if Assigned(nearestPl) then
//  begin
//    case mine.MineDefinition.FMine_Def.Platform_Category of
//      mcAccoustic:
//      begin

//      end;
//      mcImpact:
//      begin
//        //      if nearestRange < mine.MineDefinition.FMine_Def.Engagement_Range then
//        //        mine.OnBombCheckHit(mine);
//      end;
//      mcMagnetic:
//      begin
//        mine.Mover.Speed := 3;        //default pendekatan 3
//        mine.Mover.Direction := CalcBearing(mine.PosX, mine.PosY, nearestPl.PosX, nearestPl.PosY);
//      end;
//      mcPressure:
//      begin

//      end;
//    end;
//  end;
//end;

procedure TT3SimManager.OnVarianceESM(aESMtrack, aTrack: TObject);
begin
  //x
end;

procedure TT3SimManager.OnVehicleReadyLanding(Sender: TObject);
begin
 // x
end;

function TT3SimManager.LauncherBubbleState(
  const rec: TRecCmd_LaunchBubbleState): TObject ;
var
    pi: TT3PlatformInstance;
    cob: TObject;
begin
  result := nil;
  pi   := FindT3PlatformByID(rec.ParentPlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    exit;

  cob := TT3Vehicle(pi).FindDevice(TT3AirBubbleOnVehicle,rec.ChaffOnVehicleID);

  if not Assigned(cob) then exit;

  TT3AirBubbleOnVehicle(cob).InstanceIndex := rec.ChaffOnVehicleID;

  {$IfDef SERVER}
    TT3AirBubbleOnVehicle(cob).OnFire     := BubbleLauncherFire;
    TT3AirBubbleOnVehicle(cob).OnStopFire := BubbleLauncherStop;
  {$EndIf}

   if (cob = nil){ or (lc = nil) }then exit;

   TT3AirBubbleOnVehicle(cob).State  := rec.StateID;
end;

procedure TT3SimManager.CalcAfterTime(aTime: Double);
var
  i, j, idxStartW : Integer;
  SimObj : TSimObject;
  objv : TT3Vehicle;
  objw : TObject;
  Behav : TScripted_Behav_Definition;
  objList : TList;
  dist, dth, newX, newY, distanceW, fuelCons, fuelRmn, fuelCost,
  lubRmn, lubCost, freshWtrRmn, freshWtrCost, waterRmn, waterCost, foodRmn,
  foodCost, {fuelTrsAfterTime, MLTrsAfterTime, ATTrsAfterTime, waterTrsAfterTime,
  foodTrsAfterTime,} bearingW, speedw, altitudew, diswtemp,  sDistanceW,
  bearingWtemp, sBearingW, startBearing, difwtemp, dthW, dthTemp : Double;
begin
  dth := (aTime/3600);  //convert to hours
  for i := 0 to SimPlatforms.ItemCount - 1 do
  begin
    SimObj := SimPlatforms.getObject(i);
    if Assigned(SimObj) then
    begin
//      if Assigned(OnLogStr) then
//        OnLogStr('CalcAfterTime','SimObj = '+ BoolToStr(SimObj.IsAssigned));
    end
    else
    begin
      if Assigned(OnLogStr) then
        OnLogStr('CalcAfterTime','SimObj = nil');
      Continue;
    end;

    if SimObj is TT3Vehicle then
    begin
      objv := TT3Vehicle(SimObj);
      if Assigned(objv) then
      begin
//        if Assigned(OnLogStr) then
//          OnLogStr('CalcAfterTime','objv = ' + objv.InstanceName + ' ' + objv.ClassName);
      end
      else
      begin
        if Assigned(OnLogStr) then
          OnLogStr('CalcAfterTime','objv = nil');
        Continue;
      end;
//      if objv.FuelRemaining > 0 then
//      begin
        case TVehicle_Definition(objv.UnitDefinition).GuidanceType of
          vgtStraightLine :
          begin
            dist := (objv.GroundSpeed * dth);  //estimate distance after time
//            if dist > 0 then
//            begin
              // check groundspeed for fuel consumption rate (meter cubic/hours)
              GetFuelConsBySpeed(objv, objv.GroundSpeed, fuelCons);
              // check endurance type it is fuel
              case objv.UnitMotion.FData.Endurance_Type of
                byte(entFuel)       :
                begin
                  fuelCost := fuelCons * dth; // estimate fuel consumption after time
                  fuelRmn := objv.FuelRemaining - fuelCost;
                  if fuelRmn > 0 then                       // set remaining fuel
                    objv.FuelRemaining := fuelRmn
                  else
                  begin
                    if objv.FuelRemaining > 0 then
                      dist := objv.GroundSpeed * (objv.FuelRemaining / fuelCons) // if fuelremaining not enough to do tralvel
                    else
                      dist := 0;
                    objv.FuelRemaining := 0;
                    objv.Speed := 0;
                    {check platform type Fighter, Strike/Bomber, ASW/MP, EW, Surveillance/AEW, Reconnaissance}
                    if (objv.PlatformType = 20) or (objv.PlatformType = 1) or (objv.PlatformType = 2) or
                      (objv.PlatformType = 3) or (objv.PlatformType = 5) or (objv.PlatformType = 7) then
                      objv.Altitude := 0;
                  end;
                end;
              end;

              RangeBearingToCoord(dist, objv.Course, newX, newY);  //estimate new pos
              {apply new position}
              objv.PosX := objv.PosX + newX;
              objv.PosY := objv.PosY + newY;
//            end;
          end;
          vgtWaypoint :
          begin
            dthTemp := dth;
            if Assigned(objv.Waypoints.NextWaypoint) then
            begin
              idxStartW := objv.Waypoints.NextWaypoint.FData.Scripted_Event_Index - 1 ;
              for j := idxStartW to objv.Waypoints.Count - 1 do
              begin
                objw := objv.Waypoints.Behaviour[j];
                if Assigned(objw) then
                begin
                  Behav := TScripted_Behav_Definition(objw);
                  // distance to waypoint j
                  distanceW := CalcRange(objv.PosX, objv.PosY,
                    Behav.FData.Waypoint_Longitude, Behav.FData.Waypoint_Latitude);
                  // bearing to waypoint j
                  bearingW := CalcBearing(objv.PosX, objv.PosY,
                    Behav.FData.Waypoint_Longitude, Behav.FData.Waypoint_Latitude);
                  // speed along waypoint j
                  speedw := Behav.FData.Speed;
                  if speedw > objv.UnitMotion.FData.Max_Ground_Speed then
                    speedw := objv.UnitMotion.FData.Max_Ground_Speed;
                  // altitude along waypoint j
                  altitudew := Behav.FData.Altitude;
                  // travel's time to waypoint j
                  dthW := distanceW / speedw;

                  // check groundspeed for fuel consumption rate (meter cubic/hours)
                  GetFuelConsBySpeed(objv, speedw, fuelCons);
                  // check endurance type it is fuel
                  case objv.UnitMotion.FData.Endurance_Type of
                    byte(entFuel)       :
                    begin
                      if dthW < dthTemp then
                        fuelCost := fuelCons * dthW // estimate fuel consumption after time
                      else
                        fuelCost := fuelCons * dthTemp;

                      fuelRmn := objv.FuelRemaining - fuelCost;
                      if fuelRmn > 0 then                       // set remaining fuel
                      begin
                        if dthW >= dthTemp then
                          distanceW := speedw * dthTemp;

                        objv.FuelRemaining := fuelRmn;
                      end
                      else
                      begin
                        if objv.FuelRemaining > 0 then
                          distanceW := speedw * (objv.FuelRemaining / fuelCons)  // if fuelremaining not enough to do tralvel
                        else
                          distanceW := 0;
                        objv.FuelRemaining := 0;
                        objv.Speed := 0;
                        {check platform type Fighter, Strike/Bomber, ASW/MP, EW, Surveillance/AEW, Reconnaissance}
                        if (objv.PlatformType = 20) or (objv.PlatformType = 1) or (objv.PlatformType = 2) or
                          (objv.PlatformType = 3) or (objv.PlatformType = 5) or (objv.PlatformType = 7) then
                          objv.Altitude := 0;
                      end;
                    end;
                  end;

                  RangeBearingToCoord(distanceW, bearingW, newX, newY);  // estimate new position
                  // apply new position
                  objv.PosX := objv.PosX + newX;
                  objv.PosY := objv.PosY + newY;

                  objv.Course := bearingW;
                  objv.Speed := speedw;
                  objv.Altitude := altitudew;
                  if dthW < dthTemp then
                  begin
                    dthTemp := dthTemp - dthW;
                    objv.Waypoints.CheckWaypointReach((dthW * 3600000));  // in ms
                  end
                  else
                  begin
                    objv.Waypoints.CheckWaypointReach((dthTemp * 3600000));  // in ms
                    dthTemp := 0;
                    Break;
                  end;
                end;
              end;
              // if there is time remaining
              if dthTemp > 0 then
              begin
                case objv.Waypoints.Termination of
                  wtLH: {Continue on last heading and ground speed}
                  begin
                    distanceW := (speedw * dthTemp); // estimate distance after time
                    // check endurance type it is fuel
                    case objv.UnitMotion.FData.Endurance_Type of
                      byte(entfuel) :
                      begin
                        fuelCost := fuelCons * dthTemp; // estimate fuel consumption after time
                        fuelRmn := objv.FuelRemaining - fuelCost;

                        if fuelRmn > 0 then
                          objv.FuelRemaining := fuelRmn
                        else
                        begin
                          if objv.FuelRemaining > 0 then
                            distanceW := speedw * (objv.FuelRemaining / fuelCons)  // if fuelremaining not enough to do travel
                          else
                            distanceW := 0;
                          objv.FuelRemaining := 0;
                          objv.Speed := 0;
                          {check platform type Fighter, Strike/Bomber, ASW/MP, EW, Surveillance/AEW, Reconnaissance}
                          if (objv.PlatformType = 20) or (objv.PlatformType = 1) or (objv.PlatformType = 2) or
                            (objv.PlatformType = 3) or (objv.PlatformType = 5) or (objv.PlatformType = 7) then
                            objv.Altitude := 0;
                        end;
                      end;
                    end;

                    RangeBearingToCoord(distanceW, bearingW, newX, newY);  // estimate new position
                    // apply new position
                    objv.PosX := objv.PosX + newX;
                    objv.PosY := objv.PosY + newY;

                    objv.Course := bearingW;
                    objv.Speed := speedw;

                    objv.Altitude := altitudew;
                    dthTemp := 0;
                  end;
                  wtTH: {Continue on terminal heading}
                  begin
                    distanceW := (speedw * dthTemp); // estimate distance after time
                    // check endurance type it is fuel
                    case objv.UnitMotion.FData.Endurance_Type of
                      byte(entFuel) :
                      begin
                        fuelCost := fuelCons * dthTemp; // estimate fuel consumption after time
                        fuelRmn := objv.FuelRemaining - fuelCost;
                        if fuelRmn > 0 then
                          objv.FuelRemaining := fuelRmn
                        else
                        begin
                          if objv.FuelRemaining > 0 then
                            distanceW := speedw * (objv.FuelRemaining / fuelCons)  // if fuelremaining not enough to do travel
                          else
                            distanceW := 0;
                          objv.FuelRemaining := 0;
                          objv.Speed := 0;
                          {check platform type Fighter, Strike/Bomber, ASW/MP, EW, Surveillance/AEW, Reconnaissance}
                          if (objv.PlatformType = 20) or (objv.PlatformType = 1) or (objv.PlatformType = 2) or
                            (objv.PlatformType = 3) or (objv.PlatformType = 5) or (objv.PlatformType = 7) then
                            objv.Altitude := 0;
                        end;
                      end;
                    end;

                    RangeBearingToCoord(distanceW, bearingW, newX, newY);  // estimate new position
                    // apply new position
                    objv.PosX := objv.PosX + newX;
                    objv.PosY := objv.PosY + newY;

                    objv.Course := objv.Waypoints.TerminationHeading;
                    objv.Speed := speedw;

                    objv.Altitude := altitudew;
                    dthTemp := 0;
                  end;
                  wtRP, {Repeat the pattern, using the current position as the anchor point}
                  wtRP2: {Repeat the pattern, using the existing waypoint positions}
                  begin
                    j := objv.Waypoints.NextWaypoint.FData.Scripted_Event_Index - 1;
                    while dthTemp > 0 do
                    begin
                      objw := objv.Waypoints.Behaviour[j];
                      if Assigned(objw) then
                      begin
                        Behav := TScripted_Behav_Definition(objw);
                        // distance to waypoint j
                        distanceW := CalcRange(objv.PosX, objv.PosY,
                          Behav.FData.Waypoint_Longitude, Behav.FData.Waypoint_Latitude);
                        // bearing to waypoint j
                        bearingW := CalcBearing(objv.PosX, objv.PosY,
                          Behav.FData.Waypoint_Longitude, Behav.FData.Waypoint_Latitude);
                        // speed along waypoint j
                        speedw := Behav.FData.Speed;
                        if speedw > objv.UnitMotion.FData.Max_Ground_Speed then
                          speedw := objv.UnitMotion.FData.Max_Ground_Speed;
                        // altitude along waypoint j
                        altitudew := Behav.FData.Altitude;
                        // travel's time to waypoint j
                        dthW := distanceW / speedw;

                        // check groundspeed for fuel consumption rate (meter cubic/hours)
                        GetFuelConsBySpeed(objv, speedw, fuelCons);
                        // check endurance type it is fuel
                        case objv.UnitMotion.FData.Endurance_Type of
                          Byte(entFuel) :
                          begin
                            if dthW < dthTemp then
                              fuelCost := fuelCons * dthW // estimate fuel consumption after time
                            else
                              fuelCost := fuelCons * dthTemp;

                            fuelRmn := objv.FuelRemaining - fuelCost;
                            if fuelRmn > 0 then                       // set remaining fuel
                            begin
                              if dthW >= dthTemp then
                                distanceW := speedw * dthTemp;

                              objv.FuelRemaining := fuelRmn;
                            end
                            else
                            begin
                              if objv.FuelRemaining > 0 then
                                distanceW := speedw * (objv.FuelRemaining / fuelCons)  // if fuelremaining not enough to do tralvel
                              else
                                distanceW := 0;
                              objv.FuelRemaining := 0;
                              objv.Speed := 0;
                              {check platform type Fighter, Strike/Bomber, ASW/MP, EW, Surveillance/AEW, Reconnaissance}
                              if (objv.PlatformType = 20) or (objv.PlatformType = 1) or (objv.PlatformType = 2) or
                                (objv.PlatformType = 3) or (objv.PlatformType = 5) or (objv.PlatformType = 7) then
                                objv.Altitude := 0;
                            end;
                          end;
                        end;

                        RangeBearingToCoord(distanceW, bearingW, newX, newY);  // estimate new position
                        // apply new position
                        objv.PosX := objv.PosX + newX;
                        objv.PosY := objv.PosY + newY;

                        objv.Course := bearingW;
                        objv.Speed := speedw;
                        objv.Altitude := altitudew;
                        if dthW < dthTemp then
                        begin
                          dthTemp := dthTemp - dthW;
                          objv.Waypoints.CheckWaypointReach((dthW * 3600000));  // in ms
                        end
                        else
                        begin
                          objv.Waypoints.CheckWaypointReach((dthTemp * 3600000));  // in ms
                          dthTemp := 0;
                          Break;
                        end;
                      end;
                      if j < objv.Waypoints.Count - 1 then
                        j := j + 1
                      else
                        j := objv.Waypoints.NextWaypoint.FData.Scripted_Event_Index - 1;
                    end;
                  end;
                  wtRB: {Return to launching base}
                  begin
                    objv.Course := bearingW;
                    objv.Speed := 0;
                    objv.Altitude := altitudew;
                    dthTemp := 0;
                  end;
                  wtRM: {Remove platform from exercise}
                  begin
                    objv.Course := bearingW;
                    objv.Speed := 0;
                    objv.Altitude := altitudew;
                    dthTemp := 0;
                  end;
                  wtSp: {Stop on last waypoint}
                  begin
                    objv.Course := bearingW;
                    objv.Speed := 0;
                    objv.Altitude := altitudew;
                    dthTemp := 0;
                  end;
                end;
              end;
            end
            else
            begin
              dist := (objv.GroundSpeed * dth);  //estimate distance after time
              // check groundspeed for fuel consumption rate (meter cubic/hours)
              GetFuelConsBySpeed(objv, objv.GroundSpeed, fuelCons);
              // check endurance type it is fuel
              case objv.UnitMotion.FData.Endurance_Type of
                byte(entFuel)       :
                begin
                  fuelCost := fuelCons * dth; // estimate fuel consumption after time
                  fuelRmn := objv.FuelRemaining - fuelCost;
                  if fuelRmn > 0 then                       // set remaining fuel
                    objv.FuelRemaining := fuelRmn
                  else
                  begin
                    if objv.FuelRemaining > 0 then
                      dist := objv.GroundSpeed * (objv.FuelRemaining / fuelCons) // if fuelremaining not enough to do tralvel
                    else
                      dist := 0;
                    objv.FuelRemaining := 0;
                    objv.Speed := 0;
                    {check platform type Fighter, Strike/Bomber, ASW/MP, EW, Surveillance/AEW, Reconnaissance}
                    if (objv.PlatformType = 20) or (objv.PlatformType = 1) or (objv.PlatformType = 2) or
                      (objv.PlatformType = 3) or (objv.PlatformType = 5) or (objv.PlatformType = 7) then
                      objv.Altitude := 0;
                  end;
                end;
              end;
              RangeBearingToCoord(dist, objv.Course, newX, newY);  //estimate new pos
              {apply new position}
              objv.PosX := objv.PosX + newX;
              objv.PosY := objv.PosY + newY;
            end;
          end;
        end;
//      end;

      // estimate logistics after time
      lubCost := objv.UnitLogistic.FData.Lubricants_Consumption * dth;
      freshWtrCost := objv.UnitLogistic.FData.Freshwater_Consumption * dth;
      waterCost := objv.UnitLogistic.FData.Water_Consumption * dth;
      foodCost := objv.UnitLogistic.FData.Ration_Consumption * dth;
      // set remaining logistics
      lubRmn := objv.MLRemaining - lubCost; //lubricants
      if lubRmn > 0 then
        objv.MLRemaining := lubRmn
      else
        objv.MLRemaining := 0;
      freshWtrRmn := objv.ATRemaining - freshWtrCost; //freshwater
      if freshWtrRmn > 0 then
        objv.ATRemaining := freshWtrRmn
      else
        objv.ATRemaining := 0;
      waterRmn := objv.WaterRemaining - waterCost; //water
      if waterRmn > 0 then
        objv.WaterRemaining := waterRmn
      else
        objv.WaterRemaining := 0;
      foodRmn := objv.FoodRemaining - foodCost; //food
      if foodRmn > 0 then
        objv.FoodRemaining := foodRmn
      else
        objv.FoodRemaining := 0;
      {// sementara tidak dipakai
      if objv.isTransferFromShip or objv.isTransferToShip or
        objv.isTransferFromBase then
      begin
        // estimate transfer after time
        FuelTrsAfterTime := objv.UnitLogistic.FData.Fuel_TrS * dth;
        MLTrsAfterTime := objv.UnitLogistic.FData.Lubricants_TrS * dth;
        ATTrsAfterTime := objv.UnitLogistic.FData.Fresh_Water_TrS * dth;
        waterTrsAfterTime := objv.UnitLogistic.FData.Water_TrS * dth;
        foodTrsAfterTime := objv.UnitLogistic.FData.Food_TrS * dth;
      end;
      if objv.isTransferFromShip or objv.isTransferFromBase then
      begin
        // set transfered logistics
        if FuelTrsAfterTime <= objv.FuelTransfer then //fuel
        begin
          objv.FuelRemaining := objv.FuelRemaining + FuelTrsAfterTime;
          objv.FuelTransfer := objv.FuelTransfer - fuelTrsAfterTime;
        end
        else
        begin
          objv.FuelRemaining := objv.FuelRemaining + objv.FuelTransfer;
          objv.FuelTransfer := 0;
        end;
        if MLTrsAfterTime <= objv.MLTransfer then //lubricants
        begin
          objv.MLRemaining := objv.MLRemaining + MLTrsAfterTime;
          objv.MLTransfer := objv.MLTransfer - MLTrsAfterTime;
        end
        else
        begin
          objv.MLRemaining := objv.MLRemaining + objv.MLTransfer;
          objv.MLTransfer := 0;
        end;
        if ATTrsAfterTime <= objv.ATTransfer then //freshwater
        begin
          objv.ATRemaining := objv.ATRemaining + ATTrsAfterTime;
          objv.ATTransfer := objv.ATTransfer - ATTrsAfterTime;
        end
        else
        begin
          objv.ATRemaining := objv.ATRemaining + objv.ATTransfer;
          objv.ATTransfer := 0;
        end;
        if foodTrsAfterTime <= objv.FoodTransfer then //food
        begin
          objv.FoodRemaining := objv.FoodRemaining + foodTrsAfterTime;
          objv.FoodTransfer := objv.FoodTransfer - foodTrsAfterTime;
        end
        else
        begin
          objv.FoodRemaining := objv.FoodRemaining + objv.FoodTransfer;
          objv.FoodTransfer := 0;
        end;
        if waterTrsAfterTime <= objv.WaterTransfer then //water
        begin
          objv.WaterRemaining := objv.WaterRemaining + WaterTrsAfterTime;
          objv.WaterTransfer := objv.WaterTransfer - waterTrsAfterTime;
        end
        else
        begin
          objv.WaterRemaining := objv.WaterRemaining + objv.WaterTransfer;
          objv.WaterTransfer := 0;
        end;
      end;

      if objv.isTransferToShip then
      begin
        // set transfered logistics
        if fuelTrsAfterTime <= objv.FuelTransfer then //fuel
        begin
          objv.FuelRemaining := objv.FuelRemaining - fuelTrsAfterTime;
          objv.FuelTransfer := objv.FuelTransfer - fuelTrsAfterTime;
        end
        else
        begin
          objv.FuelRemaining := objv.FuelRemaining - objv.FuelTransfer;
          objv.FuelTransfer := 0;
        end;
        if MLTrsAfterTime <= objv.MLTransfer then //lubricants
        begin
          objv.MLRemaining := objv.MLRemaining - MLTrsAfterTime;
          objv.MLTransfer := objv.MLTransfer - MLTrsAfterTime;
        end
        else
        begin
          objv.MLRemaining := objv.MLRemaining - objv.MLTransfer;
          objv.MLTransfer := 0;
        end;
        if ATTrsAfterTime <= objv.ATTransfer then //freshwater
        begin
          objv.ATRemaining := objv.ATRemaining - ATTrsAfterTime;
          objv.ATTransfer := objv.ATTransfer - ATTrsAfterTime;
        end
        else
        begin
          objv.ATRemaining := objv.ATRemaining - objv.ATTransfer;
          objv.ATTransfer := 0;
        end;
        if foodTrsAfterTime <= objv.FoodTransfer then //food
        begin
          objv.FoodRemaining := objv.FoodRemaining - ATTrsAfterTime;
          objv.FoodTransfer := objv.FoodTransfer - ATTrsAfterTime;
        end
        else
        begin
          objv.FoodRemaining := objv.FoodRemaining - objv.FoodTransfer;
          objv.FoodTransfer := 0;
        end;
        if waterTrsAfterTime <= objv.WaterTransfer then //water
        begin
          objv.WaterRemaining := objv.WaterRemaining - foodTrsAfterTime;
          objv.FoodTransfer := objv.FoodTransfer - foodTrsAfterTime;
        end
        else
        begin
          objv.FoodRemaining := objv.FoodRemaining - objv.FoodTransfer;
          objv.FoodTransfer := 0;
        end;
      end;
      }
    end;
  end;
  FMainVTime.IncreaseMillisecond(aTime * 1000);
  SimPlatforms.GameTime(FMainVTime.GetTime);
end;

function TT3SimManager.CekPersonelOnShip(list: TList; idx: string; var id: Integer): Boolean;
var
  I : Integer;
  Personel : TPersonel;
begin
  Result := False;

  for I := 0 to list.Count - 1 do
  begin
    Personel  := TPersonel(list.Items[i]);

    if idx  = Personel.Identifier then
    begin
      Result := True;
      id := i;
      Break
    end;
  end;
end;

procedure TT3SimManager.ChaffLauncherFire(Sender: TObject);
begin

end;

procedure TT3SimManager.ChaffLauncherStop(Sender: TObject);
begin

end;

procedure TT3SimManager.BubbleLauncherFire(Sender: TObject);
begin

end;

procedure TT3SimManager.BubbleLauncherStop(Sender: TObject);
begin

end;

procedure TT3SimManager.ChangeGameSetting(const rec: TRecCmd_GameSetting);
var
  tmp : string;
  obj : TSimObject;
  i : Integer;
begin

  case rec.Index of
    // Boolean values
    GSID_AUTOREMOVEPF, GSID_RPTAIRBUBBLERMV..GSID_RPTSONOBUOYRMV,
    GSID_COASTLINECOLL, GSID_AIRCRAFTCOLLTERRAIN,
    GSID_SimplifiedSensor..GSID_IFFFilter, GSID_LandmassOcculting,
    GSID_ProcessSensorBZ, GSID_AcTorpedoDecoySetup..GSID_ProcessWeaponBZ  :

      tmp := BoolToStr(rec.ValBoolean);

    // Time format values
    GSID_WRECKTIME :
    begin
      for i := 0 to SimPlatforms.itemCount - 1 do
      begin
        obj := SimPlatforms.getObject(i);
        if obj is TT3Vehicle then
        begin
          TT3Vehicle(obj).DormantTime := rec.ValInteger;
        end;
      end;
      GameSetting.TimeRemoveWreck := rec.ValInteger;
    end;
    GSID_FLASHTransmission..GSID_RoutineTransmission,
    GSID_AcBearingDispLost..GSID_SurfaceLandDropTrack :

      tmp := SecondToTimeString(rec.ValInteger);

    // double values
    GSID_CubicalGroupClutter  : tmp := FormatFloat('#.##',rec.ValDouble);

    // integer values
    GSID_VisualVisDetectF     : tmp := IntToStr(rec.ValInteger);
  end;

  case rec.Index of
    GSID_RPTCHAFFRMV            : GameSetting.ChaffRemovalEvent           := rec.ValBoolean;
    GSID_RPTSONOBUOYRMV         : GameSetting.SonobuoyRemovalEvent        := rec.ValBoolean;
    GSID_RPTAIRBUBBLERMV        : GameSetting.BubbleRemovalEvent          := rec.ValBoolean;
    GSID_AUTOREMOVEPF           : GameSetting.AutomaticRemovePlatformOutsideArea := rec.ValBoolean;
    GSID_PROBOFKILL             :
      begin
        case rec.ValByte of
          0 : GameSetting.ProbabilityOfKill := sNormal;
          1 : GameSetting.ProbabilityOfKill := sAlways;
          2 : GameSetting.ProbabilityOfKill := sNever;
        end;
        case rec.ValByte of
          0 : tmp := 'Normal';
          1 : tmp := 'Always kill if hit';
          2 : tmp := 'Never kill';
        end;
      end;
    GSID_COASTLINECOLL          : GameSetting.CoastlineCollision          := rec.ValBoolean;
    GSID_AIRCRAFTCOLLTERRAIN    : GameSetting.AircraftTerrainColl         := rec.ValBoolean;
    GSID_TidalStreamEffects     : GameSetting.TidalStreamEffectToShip     := rec.ValBoolean;
    GSID_WindEffects            : GameSetting.WindEffectToAircraft        := rec.ValBoolean;
    GSID_GuidanceCommand        :
      begin
        case rec.ValByte of
          0 : GameSetting.GuidanceCommand := gcRealistic;
          1 : GameSetting.GuidanceCommand := gcDirect;
        end;
        case rec.ValByte of
          0 : tmp := 'Realistic';
          1 : tmp := 'Direct';
        end;
      end;
    GSID_SimplifiedSensor       : GameSetting.SimplifySensorCheck         := rec.ValBoolean;
    GSID_LaunchRestrictions     : GameSetting.StudentLaunchRestriction    := rec.ValBoolean;
    GSID_CanLaunchAircraft      : GameSetting.StudentCanLaunchAirCraft    := rec.ValBoolean;
    GSID_ControllerSoundEff     : ;
    GSID_RecordReplayInterf     : ;
    GSID_InterfSoundEffects     : ;
    GSID_AutomaticSensorId      : GameSetting.AutomaticSensorIdentity     := rec.ValBoolean;
    GSID_ChaffAttenuation       : GameSetting.ChaffAttenuationOnRadar     := rec.ValBoolean;
    GSID_AutomaticSonarTarget   : ;
    GSID_EODatalink_1           : ;
    GSID_ESMDatalink_1          : ;
    GSID_IFFDatalink_1          : ;
    GSID_RadarDatalink_1        : ;
    GSID_SonarDatalink_1        : ;
    GSID_EODatalink_2           : ;
    GSID_ESMDatalink_2          : ;
    GSID_IFFDatalink_2          : ;
    GSID_RadarDatalink_2        : ;
    GSID_SonarDatalink_2        : ;
    GSID_EODatalink_3           : ;
    GSID_ESMDatalink_3          : ;
    GSID_IFFDatalink_3          : ;
    GSID_RadarDatalink_3        : ;
    GSID_SonarDatalink_3        : ;
    GSID_IFFFilter              : ;
    GSID_VisualVisDetectF       : GameSetting.VisualVisibility            := rec.ValInteger;
    GSID_LandmassOcculting      : GameSetting.LandmassOcculting           := rec.ValBoolean;
    GSID_ProcessSensorBZ        : ;
    GSID_FLASHTransmission      : ;
    GSID_IMMEDTransmission      : ;
    GSID_PRIORITYTransmission   : ;
    GSID_RoutineTransmission    : ;
    GSID_ProcessWeaponBZ        : ;
    GSID_AntiSurfaceWarEng      : ;
    GSID_AntiSubsurfaceWarEng   : ;
    GSID_AcTorpedoDecoySetup    : ;
    GSID_CubicalGroupClutter    : ;
    GSID_AcBearingDropTrack     : GameSetting.AcousticTrackDropTime       := rec.ValInteger;
    GSID_AirDropTrack           : GameSetting.AirTrackDropTime            := rec.ValInteger;
    GSID_ESMBearingDropTrack    : GameSetting.ESMTrackDropTime            := rec.ValInteger;
    GSID_SubsurfaceDropTrack    : GameSetting.SubsurfaceTrackDropTime     := rec.ValInteger;
    GSID_SurfaceLandDropTrack   : GameSetting.SurfaceTrackDropTime        := rec.ValInteger;
    GSID_AcBearingDispLost      : GameSetting.AcousticTrackLostContactTimer := rec.ValInteger;
    GSID_AirDispLost            : GameSetting.AirTrackLostContactTime     := rec.ValInteger;
    GSID_ESMBearingDispLost     : GameSetting.ESMTrackLostContactTime     := rec.ValInteger;
    GSID_SubsurfaceDispLost     : GameSetting.SubSurfaceTrackLostContatTime := rec.ValInteger;
    GSID_SurfaceLandDispLost    : GameSetting.SurfaceTrackLostContactTime := rec.ValInteger;
    GSID_WRECKTIME              : GameSetting.TimeRemoveWreck             := rec.ValInteger;
  end;

 if Assigned(OnLogStr) then
    OnLogStr('ChangeGameSetting', 'Change Game Setting : ' + GSINFO[rec.Index] + ' to ' + tmp);
end;

procedure TT3SimManager.ChangeLogistic(const rec: TRecCmd_Change_Logistic);
var
  ve, tgt : TT3Vehicle;
  base : TPlatformBase;
  i : Integer;
  hoseTemp : THose;

begin
  case rec.ModeTransferID of
    0 :
    {$REGION ' Transfer logistik antar kapal '}
    begin
      ve := FindT3PlatformByID(rec.PlatfomID) as TT3Vehicle;
      if not Assigned(ve) then
        Exit;

//      ve.isTransferToShip := True;
      ve.DestinationIDLog := rec.DestinationID;

      hoseTemp := ve.HoseList[Rec.HoseID];
      hoseTemp.State := rec.StateID;

      tgt := FindT3PlatformByID(rec.DestinationID) as TT3Vehicle;
      if not Assigned(tgt) then
        Exit;

//      tgt.isTransferFromShip := True;
      tgt.FuelTransferOrdered := rec.vFuel;
      tgt.MLTransferOrdered := rec.vLubricants;
      tgt.ATTransferOrdered := rec.vFreshWater;
      tgt.FoodTransferOrdered := rec.vFood;
      tgt.SupplierIDLog := rec.PlatfomID;
      tgt.HoseUseID := rec.HoseID;
      tgt.DestinationStateLog := rec.StateID;
    end;
    {$ENDREGION}

    1 :
    {$REGION ' Transfer logistik dari pangkalan '}
    begin
      for I := 0 to VScenario.BaseListFromDB.Count - 1 do
      begin
        base := TPlatformBase(VScenario.BaseListFromDB.Items[i]);

        if base.id =  rec.PlatfomID then
          Break
        else
          base := nil;
      end;

      if not Assigned(base) then
        Exit;

      base.Fuel := base.Fuel - rec.vFuel;
      base.Lubricants := base.Lubricants - rec.vLubricants;
      base.FreshWater := base.FreshWater - rec.vFreshWater;
      base.Food := base.Food - rec.vFood;

      tgt := FindT3PlatformByID(rec.DestinationID) as TT3Vehicle;
      if not Assigned(tgt) then
        Exit;

      {Penampung posisi base, biar g bingung nyarik lagi}
      tgt.BaseLong := base.Longitude;
      tgt.BaseLatt := base.Latitude;
      tgt.BaseRadius  := base.Radius;

      tgt.isTransferFromBase := rec.StateID = lsProcess;
      tgt.DestinationStateLog := rec.StateID;
      tgt.FuelTransferOrdered := rec.vFuel;
      tgt.MLTransferOrdered := rec.vLubricants;
      tgt.ATTransferOrdered := rec.vFreshWater;
      tgt.FoodTransferOrdered := rec.vFood;
    end;
    {$ENDREGION}

    2:
    {$REGION ' Merubah Logistik dari instruktur '}
    begin
      ve := FindT3PlatformByID(rec.PlatfomID) as TT3Vehicle;
      if not Assigned(ve) then
        Exit;

      case rec.ItemID of
        liFuel : ve.FuelRemaining  := rec.vFuel;
        liLubricants : ve.MLRemaining    := rec.vLubricants;
        liWater : ve.ATRemaining := rec.vWater;
        liFood : ve.FoodRemaining  := rec.vFood;
      end;
    end;
    {$ENDREGION}
  end;

end;

procedure TT3SimManager.ChangeLogisticState(const rec: TRecCmd_State_Logistic);
var
  shipTemp : TT3Vehicle;
  hoseTemp : THose;
begin
  case rec.ActionID of
    0 :
    {$REGION ' yg dirubah state kapal sebagai penerima '}
    begin
      shipTemp := FindT3PlatformByID(rec.PlatfomID) as TT3Vehicle;
      if not Assigned(shipTemp) then
        Exit;

      shipTemp.DestinationStateLog := rec.StateID;
    end;
    {$ENDREGION}

    1 :
    {$REGION ' yg dirubah state selang kapal sebagai pemberi '}
    begin
      shipTemp := FindT3PlatformByID(rec.PlatfomID) as TT3Vehicle;
      if not Assigned(shipTemp) then
        Exit;

      case rec.HoseID of
        0:
        begin
          hoseTemp := shipTemp.HoseList[0];
          hoseTemp.State := rec.StateID
        end;
        1:
        begin
          hoseTemp := shipTemp.HoseList[1];
          hoseTemp.State := rec.StateID
        end;
      end;
    end;
    {$ENDREGION}
  end;

end;

procedure TT3SimManager.ChangePlatformGroup(rec : TRecPlatformGroupChange; var veTemp: TT3Vehicle; var oldGrpTemp, newGrpTemp: T3CubicleGroup);
var
  OldFound, NewFound : Boolean;
  i : Integer;
  grp, OldGroup, NewGroup : T3CubicleGroup;
  SelectedMember  : TPlatform_Instance;
  SelectedMembera  : TT3PlatformInstance;
  ve : TT3Vehicle;

begin
  veTemp := nil;

  OldFound := False;
  NewFound := False;

  OldGroup:= nil;
  NewGroup := nil;

  //find old & new group
  for i := 0 to CubAssignList.Count - 1 do
  begin
    grp := T3CubicleGroup(CubAssignList.Items[i]);

    if Assigned(grp) then
    begin
      if grp.FData.Group_Index = rec.OldGroupID then
      begin
        OldGroup := grp;
        OldFound := True;
      end
      else if grp.FData.Group_Index = rec.NewGroupID then
      begin
        NewGroup := grp;
        NewFound := True;
      end;
    end;

    if OldFound and NewFound then
      Break;
  end;

  if Assigned(OldGroup) and Assigned(NewGroup) then
  begin
    SelectedMembera := nil;
    for i := 0 to SimPlatforms.itemCount - 1 do
    begin
      SelectedMembera := TT3PlatformInstance(SimPlatforms.getObject(i));
      if SelectedMembera.InstanceIndex = rec.PlatformID then
        Break;
    end;

    if Assigned(SelectedMembera) then
    begin
      OldGroup.RemoveMember(SelectedMembera.InstanceIndex);
      NewGroup.AddMember(SelectedMembera.InstanceIndex);

      ve := TT3Vehicle(SelectedMembera);
      if Assigned(ve) then
      begin
        ve.GroupIndex := NewGroup.FData.Group_Index;

        veTemp := ve;
        oldGrpTemp := OldGroup;
        newGrpTemp := NewGroup;
      end;
    end;
  end
  else
  begin
    EventManager.OnLogStatusTactical('Group not found!');
  end;
end;

procedure TT3SimManager.ChangeRampState(const rec: TRecCmd_RampController);
var
  i : Integer;
  HostTransport : TT3Vehicle;
  tempRamp : TRamp;

begin

  {$REGION ' Pengecekan kapal '}
  HostTransport := FindT3PlatformByID(rec.PlatformID) as TT3Vehicle;

  if HostTransport = nil then
    Exit;
  {$ENDREGION}

  for i := 0 to HostTransport.RampList.Count - 1 do
  begin
    tempRamp := HostTransport.RampList[i];
    if tempRamp.RampaID = Rec.RampID then
    begin
      tempRamp.State := rec.RampState = CORD_ID_OPEN;
      Exit;
    end;
  end;
end;

procedure TT3SimManager.ChangeSystemState(
  const rec: TRecCmd_Change_SystemState);
var
  ve : TT3Vehicle;
begin
  ve := FindT3PlatformByID(rec.PlatfomID) as TT3Vehicle;
  if not Assigned(ve) then
    Exit;

  if rec.StateID = 3 then
  begin
    //speed percentase
    ve.DamagePercentSpeed := Round(rec.nValue);
  end
  else if rec.StateID = 2 then
  begin
    //Propulsion
    ve.DamagePropulsion := Round(rec.nValue).ToBoolean;
  end
  else if rec.StateID = 4 then
  begin
    ve.FuelRemaining := rec.nValue;
  end
  else if rec.StateID = 5 then
  begin
    //FuelLeakage
    ve.FuelLeakage := Round(rec.nValue).ToBoolean;
  end
  else if rec.StateID = 1 then
  begin
    //Helm
    ve.DamageHelm := Round(rec.nValue).ToBoolean;
  end
  else if rec.StateID = 6 then
  begin
    //Comunication
    ve.DamageComm := Round(rec.nValue).ToBoolean;
  end;
end;

function TT3SimManager.LaunchMissile(const rec: TRecCmd_LaunchMissile ): TObject;
var pi, tgt: TT3PlatformInstance;
    mis: TObject;
    projectile : TT3Missile;
    grp: T3CubicleGroup;
begin
  Result := nil;
  pi   := FindT3PlatformByID(rec.ParentPlatformID);
  tgt  := FindT3PlatformByID(rec.TargetPlatformID);

  if not Assigned(tgt) then
    tgt := FindNonRealPlatformByID(rec.TargetPlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) and (tgt = nil) then
    exit;

  mis := TT3Vehicle(pi).getWeapon(rec.MissileID, TT3MissilesOnVehicle);

  if (mis <> nil) {and (TT3MissilesOnVehicle(mis).WeaponStatus <> wsDamaged)} then
  begin
    //add untuk setting firing mode missile supaya firing mode missile bisa sinkron 18/09/2013
//    TT3MissilesOnVehicle(mis).FiringMode := TMissileFiringMode(rec.FiringMode);

    case TT3MissilesOnVehicle(mis).WeaponCategory of
      wcMissileSurfaceSubsurfaceToSurfaceSubsurface :
      begin
        case TT3MissilesOnVehicle(mis).FiringMode of
          mfmRBl, mfmRBLW : if tgt = nil then Exit;
        end;
      end;
      wcMissileSurfaceSubsurfaceToAir : if tgt = nil then Exit;
      wcMissileAirToAir, wcMissileAirToSurfaceSubsurface, wcMissileLandAttack :
      begin
        TT3MissilesOnVehicle(mis).FiringMode := TMissileFiringMode(rec.FiringMode);
        case TT3MissilesOnVehicle(mis).Firingmode of
          mfmDirect : if tgt = nil then Exit;
        end;
      end;
    end;

    if Assigned(tgt) then
    begin
      TT3MissilesOnVehicle(mis).TargetObject := tgt;
    end;

    TT3MissilesOnVehicle(mis).Planned := False;
    projectile := TT3MissilesOnVehicle(mis).PrepareLaunch;
    if not(Assigned(projectile)) then Exit;

    projectile.Environment := Self.GameEnvironment;
    projectile.GameDefaults := Self.GameDefaults; //mm gd
    projectile.LauncherNumber := rec.LauncherID;
    projectile.TargetInitID   := rec.TargetPlatformID;

    if rec.ProjectileInstanceIndex = 0 then
      projectile.InstanceIndex := GetSerialPlatformID
    else
    begin
      if LoadFromSnapshot then
      begin
        projectile.InstanceIndex := rec.ProjectileInstanceIndex;
        FLastPlatformID := rec.ProjectileInstanceIndex + 1;
      end
      else
        projectile.InstanceIndex := rec.ProjectileInstanceIndex;
    end;

    grp := FScenario.CubiclesGroupsListFromDB.GetGroupByID(TT3PlatformInstance(projectile.Parent).GroupIndex) as T3CubicleGroup;

    if grp <> nil then
    begin // (lha.. iki... dapet pi.Fdata dari mana..)
      //vObj.OnReadyLanding := OnVehicleReadyLanding;
      grp.AddMember(projectile.InstanceIndex);
      projectile.TrackNumber := grp.GetTrackNumber(projectile.InstanceIndex);
      projectile.GroupIndex := grp.FData.Group_Index;
    end;

    AssignWeaponEvent(projectile);
    projectile.TargetPlatforms := SimPlatforms;

    if projectile is TT3Missile_SS then
      projectile.Course := pi.Course + rec.LaunchAngle    //tambahan launcher
    else
    begin
      case TT3MissilesOnVehicle(mis).FiringMode of
        mfmAimpoint :
        begin
          projectile.Course := CalcBearing(pi.PosX, pi.PosY, projectile.StaticTargetPos.X, projectile.StaticTargetPos.Y);
        end;
        mfmBearing :
        begin
          projectile.Course := TT3MissilesOnVehicle(mis).Bearing_Movement.BearingLaunch;
        end;
      else
        begin
          projectile.Course := CalcBearing(pi.PosX, pi.PosY, tgt.PosX, tgt.PosY);
        end;
      end;
//      if Assigned(tgt) then
//      begin
//        projectile.Course := CalcBearing(pi.PosX, pi.PosY, tgt.PosX, tgt.PosY);
//        projectile.TargetInitID   := TT3Unit(tgt).InstanceIndex ;
//      end
//      else

    end;

    if projectile.Course > 360 then
      projectile.Course := projectile.Course - 360;

    projectile.Parent         := nil;
    projectile.NoCubicle      := rec.NoCubicle;
    projectile.PlatformDomain :=  0;
    projectile.Launched       := True;
    projectile.WeaponOnVehicleID := TT3MissilesOnVehicle(mis).InstanceIndex;

    if projectile.UnitGroup then
      projectile.Planned    := true;

    if FIsInstructor or FIsWasdal or projectile.UnitGroup then //edit 26042012 mk
      projectile.Visible := True
    else
      projectile.Visible := False;

    if rec.IsEngagementWeapon then
      projectile.EngagementParentID := rec.ParentPlatformID
    else
      projectile.EngagementParentID := 0;

    Result := projectile;
  end;
end;

procedure TT3SimManager.LaunchMissileEngageProps(const rec: TRecEngagementModeWeapon);
var
  pi : TT3PlatformInstance;
  mis : TObject;
begin
  pi   := FindT3PlatformByID(rec.PlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    exit;

  mis := TT3Vehicle(pi).getWeapon(rec.MissileID, TT3MissilesOnVehicle);

  if mis <> nil then
  begin
    TT3MissilesOnVehicle(mis).setStaticEngagementMode(TMissileEngagement(rec.EngagementMode));
  end;

  EventManager.OnEngagementChange(mis);
end;

procedure TT3SimManager.LaunchMissileProps(const rec: TRecFiringModeWeapon);
var
  pi : TT3PlatformInstance;
  mis : TObject;
begin
  pi   := FindT3PlatformByID(rec.PlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    exit;

  mis := TT3Vehicle(pi).getWeapon(rec.MissileID, TT3MissilesOnVehicle);
  if mis <> nil then
  begin
    TT3MissilesOnVehicle(mis).setStaticFiringMode(TMissileFiringMode(rec.FiringMode));
  end;

  EventManager.OnFiringModeChange(mis);
end;

procedure TT3SimManager.GunAssets(pi: TPlatform_Instance; vehicle: TT3Vehicle);
begin
  GunSet(pi.Vehicle.Missiles,TT3MissilesOnVehicle,vehicle);
  GunSet(pi.Vehicle.Torpedos,TT3TorpedoesOnVehicle,vehicle);
  GunSet(pi.Vehicle.Mines,TT3MineOnVehicle,vehicle);
  GunSet(pi.Vehicle.Bombs,TT3BombONVehicle,vehicle);
  GunSet(pi.Vehicle.Guns,TT3GunOnVehicle,vehicle);
  GunSet(pi.Vehicle.Hybrids,TT3HybridOnVehicle,vehicle);

  if (vehicle.PlatformDomain <> 2) and (vehicle.PlatformType <> 40) then
    VectacSet(TT3Vectac,vehicle);
end;

procedure TT3SimManager.GunSet(aList: TList; aClass: TClass;
  aParent: TT3Vehicle);
var
  j         : integer;
  weapon    : TObject;
begin
  for j := 0 to aList.Count - 1 do
  begin
    weapon := nil;

    if aClass = TT3MissilesOnVehicle   then weapon := TT3MissilesOnVehicle.Create else
    if aClass = TT3TorpedoesOnVehicle  then weapon := TT3TorpedoesOnVehicle.Create else
    if aClass = TT3BombONVehicle       then weapon := TT3BombONVehicle.Create else
    if aClass = TT3MineOnVehicle       then weapon := TT3MineOnVehicle.Create else
    if aClass = TT3GunOnVehicle        then weapon := TT3GunOnVehicle.Create else
    if aClass = TT3HybridOnVehicle     then weapon := TT3HybridOnVehicle.Create;

    if (Assigned(weapon)) and (weapon is TT3Weapon) then
    begin
      with TT3Weapon(weapon) do
      begin
        UnitDefinition := aList[j];
        Parent := aParent;
        Initialize;
        SetObjects(SimPlatforms);       //mk test

        //added by choco
        if TT3Weapon(weapon) is TT3MissilesOnVehicle then
        begin
          TT3MissilesOnVehicle(weapon).Force_Designation := aParent.Force_Designation;
          TT3MissilesOnVehicle(weapon).InitAfterLaunch;
        end;
      end;

      AssignWeaponEvent(TT3Weapon(weapon));
      aParent.addWeapon(TT3Weapon(weapon));
      SimDevices.addObject(TT3Weapon(weapon));
    end;
  end;
end;

function TT3SimManager.LaunchRuntimePlatform(const rec : TRecCmd_LaunchRP )
  : TT3PlatformInstance;
var
  i : Integer;
    objPLE : TPlatform_Library_Entry;
    FDeployedObject : TPlatform_Instance;
    FDeployedPlatform : TT3PlatformInstance;
    vIndex, nIndex : integer;
    grp: T3CubicleGroup;
    vObj: TT3PlatformInstance;
    data : AnsiString;
begin
  result := nil;

  vIndex := rec.RPPlatformID;
  nIndex := rec.NewPlatformID;

  {$REGION ' Pengecekan saat Take Off dari pangkalan '}
  if rec.MaxRowIndex = 123 then
  begin
    if TakeOffFromBase(rec)then
      objPLE.FData.Vehicle_Index := rec.RPPlatformID;
  end
  {$ENDREGION}

  {$REGION ' Pengecekan saat RPL biasa '}
  else
  begin
    objPLE := TPlatform_Library_Entry(FScenario.FindRuntimePlatform(vIndex));

    if objPLE = nil then
      Exit;
  end;
  {$ENDREGION}

  {$REGION ' Launch Vehicle '}
  if objPLE.FData.Vehicle_Index <> 0 then
  begin
    FDeployedObject := CreatePlatformInstanceRP(1, vIndex, nIndex);

    with FDeployedObject do
    begin
      CopyArrayToStr(rec.TrackIdent, data);
      FData.Track_ID := data;
      data := '';
      CopyArrayToStr(rec.InstanceName, data);
      FData.Instance_Name := data;

      if rec.NewPlatformID = 0 then
        Begin
          if FData.Platform_Instance_Index = 0 then
            FData.Platform_Instance_Index :=  GetSerialPlatformID;
        End
      else
      begin
        if LoadFromSnapshot then
        begin
          FData.Platform_Instance_Index := rec.NewPlatformID;
          FLastPlatformID := rec.NewPlatformID + 1;
        end
        else
          FData.Platform_Instance_Index := rec.NewPlatformID;
      end;

      FData.Force_Designation             := rec.ForceDesignation; //mk Force Designation 27042012
      FActivation.Init_Position_Longitude := rec.pX;
      FActivation.Init_Position_Latitude  := rec.pY;
      FActivation.Init_Course             := 0;
      FActivation.Init_Altitude           := 0;
      FActivation.Init_Ground_Speed       := 0;
      FActivation.Init_Fuel               := Motion.FData.Max_Fuel_Capacity;
      FActivation.Init_Lubricants         := Logistic.FData.Max_Lubricants_Capacity;
      FActivation.Init_Freshwater         := Logistic.FData.Max_Freshwater_Capacity;
      FActivation.Init_Water              := Logistic.FData.Max_Water_Capacity;
      FActivation.Init_Ration             := Logistic.FData.Max_Ration_Capacity;
    end;

    FDeployedPlatform := SimAssetAssignment(FDeployedObject);

    result := FDeployedPlatform;

    FDeployedPlatform.setPositionX(rec.pX);
    FDeployedPlatform.setPositionY(rec.pY);
    FDeployedPlatform.Heading := rec.PHeading;
    TT3Vehicle(FDeployedPlatform).OrderedHeading := rec.PHeading;
    TT3Vehicle(FDeployedPlatform).DormantTime := GameSetting.TimeRemoveWreck;

    if rec.PSpeed > FDeployedPlatform.UnitMotion.FData.Max_Ground_Speed then
    begin
       FDeployedPlatform.Speed := FDeployedPlatform.UnitMotion.FData.Max_Ground_Speed;
       TT3Vehicle(FDeployedPlatform).OrderedSpeed := FDeployedPlatform.UnitMotion.FData.Max_Ground_Speed;
    end
    else
    if rec.PSpeed < FDeployedPlatform.UnitMotion.FData.Min_Ground_Speed then
    begin
       FDeployedPlatform.Speed := FDeployedPlatform.UnitMotion.FData.Min_Ground_Speed;
       TT3Vehicle(FDeployedPlatform).OrderedSpeed := FDeployedPlatform.UnitMotion.FData.Min_Ground_Speed;
    end
    else
    begin
       FDeployedPlatform.Speed := rec.PSpeed;
       TT3Vehicle(FDeployedPlatform).OrderedSpeed := rec.PSpeed;
    end;

    if (FDeployedPlatform.PlatformDomain = 0) then
    begin
       if rec.PAltitude > FDeployedPlatform.UnitMotion.FData.Max_Altitude then
       begin
        FDeployedPlatform.Altitude := FDeployedPlatform.UnitMotion.FData.Max_Altitude;
        TT3Vehicle(FDeployedPlatform).OrderedAltitude := FDeployedPlatform.UnitMotion.FData.Max_Altitude;
       end
       else
       begin
        FDeployedPlatform.Altitude := rec.PAltitude;
        TT3Vehicle(FDeployedPlatform).OrderedAltitude := rec.PAltitude;
       end;
    end
    else
    if (FDeployedPlatform.PlatformDomain = 2) then
    begin
       if rec.PAltitude > FDeployedPlatform.UnitMotion.FData.Max_Depth then
       begin
        FDeployedPlatform.Altitude := FDeployedPlatform.UnitMotion.FData.Max_Depth;
        TT3Vehicle(FDeployedPlatform).OrderedAltitude := FDeployedPlatform.UnitMotion.FData.Max_Depth;
       end
       else
       begin
        FDeployedPlatform.Altitude := rec.PAltitude;
        TT3Vehicle(FDeployedPlatform).OrderedAltitude := rec.PAltitude;
       end;
    end;

    if Assigned(FOnLogInitStr) then
      FOnLogInitStr(IntToStr(FDeployedPlatform.InstanceIndex )+ ' : ' + FDeployedPlatform.InstanceName );
  end

  {$ENDREGION}

  {$REGION ' Launch Mine '}
  else
  // deploy mine bulsit
  if objPLE.FData.Mine_Index <> 0 then
  begin
    FDeployedObject := CreatePlatformInstanceRP(2, vIndex, nIndex);
    with FDeployedObject do begin
      FData.Track_ID                      := rec.TrackIdent;
      FData.Instance_Name                 := rec.InstanceName;

      if rec.NewPlatformID = 0 then
        Begin
          if FData.Platform_Instance_Index = 0 then
            FData.Platform_Instance_Index :=  GetSerialPlatformID;
        End
      else
      begin
        if LoadFromSnapshot then
        begin
          FData.Platform_Instance_Index := rec.NewPlatformID;
          FLastPlatformID := rec.NewPlatformID + 1;
        end
        else
          FData.Platform_Instance_Index := rec.NewPlatformID;
      end;

      FData.Force_Designation             := rec.ForceDesignation;
      FActivation.Init_Position_Longitude := rec.pX;
      FActivation.Init_Position_Latitude  := rec.pY;
      FActivation.Init_Course             := 0;
      FActivation.Init_Altitude           := 0;
//      FActivation.Init_Logistic           := 100;
      FActivation.Init_Ground_Speed       := 0;

      FActivation.Init_Fuel := Motion.FData.Max_Fuel_Capacity;
      FActivation.Init_Lubricants := Logistic.FData.Max_Lubricants_Capacity;
      FActivation.Init_Freshwater := Logistic.FData.Max_Freshwater_Capacity;
      FActivation.Init_Water := Logistic.FData.Max_Water_Capacity;
      FActivation.Init_Ration := Logistic.FData.Max_Ration_Capacity;
    end;

    FDeployedPlatform := SimAssetAssignment(FDeployedObject);
    FDeployedPlatform.setPositionX(rec.pX);
    FDeployedPlatform.setPositionY(rec.pY);
    FDeployedPlatform.Heading := rec.PHeading;
//    TT3Vehicle(FDeployedPlatform).OrderedHeading := rec.PHeading;

    if rec.PSpeed > FDeployedPlatform.UnitMotion.FData.Max_Ground_Speed then
    begin
       FDeployedPlatform.Speed := FDeployedPlatform.UnitMotion.FData.Max_Ground_Speed;
    end
    else
    if rec.PSpeed < FDeployedPlatform.UnitMotion.FData.Min_Ground_Speed then
    begin
       FDeployedPlatform.Speed := FDeployedPlatform.UnitMotion.FData.Min_Ground_Speed;
//       TT3Vehicle(FDeployedPlatform).OrderedSpeed := FDeployedPlatform.UnitMotion.FData.Min_Ground_Speed;
    end
    else
    begin
       FDeployedPlatform.Speed := rec.PSpeed;
//       TT3Vehicle(FDeployedPlatform).OrderedSpeed := rec.PSpeed;
    end;

    FDeployedPlatform.Altitude := 0;

    result := FDeployedPlatform;
  end
  {$ENDREGION}

  else
  begin
    if Assigned(FOnLogInitStr) then
      FOnLogInitStr( ' bkn mine ');
  end;

  for i := 0 to CubAssignList.Count - 1 do
  begin
    grp := T3CubicleGroup(CubAssignList.Items[i]);

    if Assigned(grp) then
    begin
      if grp.FData.Group_Index = rec.RPGroupID then
      begin
        if (result is TT3Vehicle) or (result is TT3Mine) then
        begin
          vObj := result as TT3PlatformInstance;
          grp.AddMember(vobj.InstanceIndex);
          vObj.TrackNumber := grp.GetTrackNumber(vobj.InstanceIndex);
          vObj.GroupIndex := grp.FData.Group_Index;
        end;
      end
    end;
  end;

//  grp := FScenario.CubiclesGroupsList.GetGroupByID(rec.RPGroupID) as T3CubicleGroup;
//
//  if grp <> nil then
//  begin // (lha.. iki... dapet pi.Fdata dari mana..)
//    if (result is TT3Vehicle) or (result is TT3Mine) then
//    begin
//      vObj := result as TT3PlatformInstance;
//      //vObj.OnReadyLanding := OnVehicleReadyLanding;
//      grp.AddMember(vobj.InstanceIndex);
//      vObj.TrackNumber := grp.GetTrackNumber(vobj.InstanceIndex);
//      vObj.GroupIndex := grp.FData.Group_Index;
//    end;
//  end
//  else
//  begin
//    //find old & new group
//    for i := 0 to CubAssignList.Count - 1 do
//    begin
//      grp := T3CubicleGroup(CubAssignList.Items[i]);
//
//      if Assigned(grp) then
//      begin
//        if grp.FData.Group_Index = rec.RPGroupID then
//        begin
//          if (result is TT3Vehicle) or (result is TT3Mine) then
//          begin
//            vObj := result as TT3PlatformInstance;
//            //vObj.OnReadyLanding := OnVehicleReadyLanding;
//            grp.AddMember(vobj.InstanceIndex);
//            vObj.TrackNumber := grp.GetTrackNumber(vobj.InstanceIndex);
//            vObj.GroupIndex := grp.FData.Group_Index;
//          end;
//        end
//      end;
//    end;
//  end;
end;

function TT3SimManager.LaunchTorpedo(const rec: TRecCmd_LaunchMissile): TObject;
var
  pi, tgt     : TT3PlatformInstance;
  mis         : TObject;
  projectile  : TT3Torpedo;
begin
  result := nil;
  pi     := FindT3PlatformByID(rec.ParentPlatformID);

  tgt    := FindT3PlatformByID(rec.TargetPlatformID);
  if tgt = nil then
    tgt    := FindNonRealPlatformByID(rec.TargetPlatformID);

  if ((pi = nil) and not (pi is TT3Vehicle)) or (tgt = nil) then
    exit;

  mis := TT3Vehicle(pi).getWeapon(rec.MissileID, TT3TorpedoesOnVehicle);

  if (mis <> nil) {and (TT3TorpedoesOnVehicle(mis).WeaponStatus <> wsDamaged)} then
  begin
    if Assigned(tgt) then
      TT3TorpedoesOnVehicle(mis).TargetObject := tgt;

    TT3TorpedoesOnVehicle(mis).Planned := false;

    if (rec.ParentPlatformID = rec.TargetPlatformID) then
    begin
      TT3TorpedoesOnVehicle(mis).LaunchWhithoutTarget := True;
    end;

    projectile := TT3TorpedoesOnVehicle(mis).PrepareLaunch;
    if Assigned(projectile) then
    begin
      projectile.Environment := Self.GameEnvironment;
      projectile.GameDefaults := Self.GameDefaults; //mm gd

      AssignWeaponEvent(projectile);
      projectile.TargetPlatforms  := SimPlatforms;

      projectile.Launched         := true;
      projectile.Parent           := nil;
      projectile.PlatformDomain   :=  2;
      projectile.NoCubicle        := rec.NoCubicle;
      projectile.TargetInitID     := rec.TargetPlatformID;
      projectile.GroupIndex       := pi.GroupIndex;

      projectile.WeaponOnVehicleID := TT3TorpedoesOnVehicle(mis).InstanceIndex ;

      if FIsInstructor or FIsWasdal or projectile.UnitGroup then
        projectile.Visible := True
      else
        projectile.Visible := False;

      if rec.ProjectileInstanceIndex = 0 then
       // server
        projectile.InstanceIndex := GetSerialPlatformID
      else
      begin
        if LoadFromSnapshot then
        begin
          projectile.InstanceIndex := rec.ProjectileInstanceIndex;
          FLastPlatformID := rec.ProjectileInstanceIndex + 1;
        end
        else
          projectile.InstanceIndex := rec.ProjectileInstanceIndex;
      end;

      result := projectile;
    end;
  end;
end;

function TT3SimManager.LaunchVectac(var recVectac: TRecVectac): TObject;
var
  WpnCarrier, Target : TT3PlatformInstance;
  Weapon : TObject;
  projTorp : TT3Torpedo;
  projBomb : TT3Bomb;
begin
  result := nil;
  WpnCarrier   := FindT3PlatformByID(recVectac.WpnCarrierID);
  Target  := FindT3PlatformByID(recVectac.TargetID);

  if (WpnCarrier = nil) and not (WpnCarrier is TT3Vehicle) then
    exit;

  if Target = nil then
    exit;

  Weapon := TT3Vehicle(WpnCarrier).getWeapon(recVectac.Weapon);
  if Assigned(Weapon) then
  begin
    if Weapon is TT3TorpedoesOnVehicle then
    begin
      TT3TorpedoesOnVehicle(Weapon).TargetObject := Target;

      TT3TorpedoesOnVehicle(Weapon).Planned := false;

      //param
      with TT3TorpedoesOnVehicle(Weapon) do
      begin
        SearchRadius  := Round(TorpedoDefinition.FDef.Terminal_Circle_Radius);
        SearchDepth   := Round(TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter);
        SafetyCeiling := Round(TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter);
        SeekerRange   := Round(TorpedoDefinition.FDef.Seeker_TurnOn_Range);
        TipeTorpedo   := 11;
      end;

      projTorp := TT3TorpedoesOnVehicle(Weapon).PrepareLaunch;
      if Assigned(projTorp) then
      begin
        projTorp.Environment := Self.GameEnvironment;
        projTorp.GameDefaults := Self.GameDefaults; //mm gd
        projTorp.IsInstructor := FIsInstructor; //add 26042012 mk
        projTorp.isWasdal := FIsWasdal;
        projTorp.GroupIndex   := WpnCarrier.GroupIndex;

        AssignWeaponEvent(projTorp);
        projTorp.TargetPlatforms := SimPlatforms;
        projTorp.Launched   := true;
        projTorp.Parent     := nil;

        if FIsInstructor or FIsWasdal or projTorp.UnitGroup then
          projTorp.Visible := True
        else
          projTorp.Visible := False;

        if recVectac.ProjectileInstanceIndex = 0 then
        begin
         // server
          projTorp.InstanceIndex := GetSerialPlatformID;
          recVectac.ProjectileInstanceIndex := projTorp.InstanceIndex;
        end
        else
        begin
          if LoadFromSnapshot then
          begin
            projTorp.InstanceIndex := recVectac.ProjectileInstanceIndex;
            FLastPlatformID := recVectac.ProjectileInstanceIndex + 1;
          end
          else
            projTorp.InstanceIndex := recVectac.ProjectileInstanceIndex;
        end;

        result := projTorp;
      end;
    end
    else if Weapon is TT3BombONVehicle then
    begin
      TT3BombONVehicle(Weapon).TargetObject := Target;
      TT3BombONVehicle(Weapon).Planned   := false;
      TT3BombONVehicle(Weapon).SalvoSize := 1;

      projBomb := TT3BombONVehicle(Weapon).PrepareDrop;
      if Assigned(projBomb) then
      begin
        projBomb.Environment  := Self.GameEnvironment;
        projBomb.GameDefaults := Self.GameDefaults; //mm gd

        AssignWeaponEvent(projBomb);
        projBomb.TargetPlatforms  := SimPlatforms;
        projBomb.Launched         := true;
        projBomb.Parent           := nil;
        projBomb.WeaponOnVehicleID:= TT3BombONVehicle(Weapon).InstanceIndex;
        projBomb.GroupIndex       := WpnCarrier.GroupIndex;

        if FIsInstructor or FIsWasdal or projBomb.UnitGroup then
          projBomb.Visible := True
        else
          projBomb.Visible := False;

        if recVectac.ProjectileInstanceIndex = 0 then
        begin
         // server
          projBomb.InstanceIndex := GetSerialPlatformID;
          recVectac.ProjectileInstanceIndex := projBomb.InstanceIndex;
        end
        else
        begin
          if LoadFromSnapshot then
          begin
            projBomb.InstanceIndex := recVectac.ProjectileInstanceIndex;
            FLastPlatformID := recVectac.ProjectileInstanceIndex;
          end
          else
            projBomb.InstanceIndex := recVectac.ProjectileInstanceIndex;
        end;

        result := projBomb;
      end;
    end;
  end;
end;

function TT3SimManager.LaunchNonRealtimeRuntimePlatform(const rec : TRecCmd_LaunchNonRP ): TT3PlatformInstance;
var
    FDeployedObject : TPlatform_Instance;
    FDeployedPlatform : TT3NonRealVehicle;
    grp  : T3CubicleGroup;
    {vIndex, }nIndex : integer;
begin
  //vIndex := rec.NRPPlatformID;
  nIndex := rec.NewPlatformID;

  FDeployedObject := CreateNonRealPlatformInstance(nIndex);

  with FDeployedObject do
  begin
    FData.Track_ID                      := rec.TrackIdent;
    FData.Instance_Name                 := rec.InstanceName;

    if rec.NewPlatformID = 0 then
    Begin
      if FData.Platform_Instance_Index = 0 then
        FData.Platform_Instance_Index :=  GetSerialPlatformID;
    End
    else
    begin
      if LoadFromSnapshot then
      begin
        FData.Platform_Instance_Index := rec.NewPlatformID;
        FLastPlatformID := rec.NewPlatformID + 1;
      end
      else
        FData.Platform_Instance_Index := rec.NewPlatformID;
    end;

    FActivation.Init_Position_Longitude := rec.pX;
    FActivation.Init_Position_Latitude  := rec.pY;
    FActivation.Init_Course             := 0;
    FActivation.Init_Altitude           := 0;
    FActivation.Init_Ground_Speed       := 0;

    FActivation.Init_Fuel := Motion.FData.Max_Fuel_Capacity;
    FActivation.Init_Lubricants := Logistic.FData.Max_Lubricants_Capacity;
    FActivation.Init_Freshwater := Logistic.FData.Max_Freshwater_Capacity;
    FActivation.Init_Water := Logistic.FData.Max_Water_Capacity;
    FActivation.Init_Ration := Logistic.FData.Max_Ration_Capacity;
  end;

  with FDeployedObject.Motion do
  begin
    FData.Max_Altitude := 1000;
    FData.Min_Ground_Speed := 0;
    FData.Max_Ground_Speed := 200;
    FData.Max_Depth := 1000;
    FData.Acceleration := 0.92;
    FData.Deceleration := 1.83;
    FData.Standard_Turn_Rate := 1.4;
    FData.Tight_Turn_Rate := 2.8;
    FData.Normal_Climb_Rate := 3418;
    FData.Normal_Descent_Rate := 13670;
    FData.Vertical_Accel := 335;
  end;

  with FDeployedObject do
  begin
    FData.Force_Designation := rec.Identity;
    Vehicle.FData.Platform_Domain := rec.Identity;
    Vehicle.FData.Platform_Type := rec.PointType;
    Vehicle.FData.Vehicle_Identifier := 'Unknown';
  end;

  TT3PlatformInstance(FDeployedPlatform) := SimNonrealAssetAssignment(FDeployedObject);

  FDeployedPlatform.SymbolType := rec.Symbol;
  FDeployedPlatform.InstanceName := 'Unknown';
  FDeployedPlatform.TrackDomain := rec.TrackDomain;
  FDeployedPlatform.TrackIdent := rec.identity;
  FDeployedPlatform.NRPType := rec.PointType;

  FDeployedPlatform.setPositionX(rec.pX);
  FDeployedPlatform.setPositionY(rec.pY);
  FDeployedPlatform.LastUpdate := rec.LastUpdateTime;

  grp := FScenario.CubiclesGroupsListFromDB.GetGroupByID(rec.NRPGroupID) as T3CubicleGroup;
  if grp <> nil then begin
    grp.AddMember(rec.NewPlatformID);
    grp.GetTrackNumber(rec.NewPlatformID);

    FDeployedPlatform.GroupIndex := rec.NRPGroupID;
    FDeployedPlatform.TrackNumber := grp.GetTrackNumber(FDeployedPlatform.InstanceIndex);
  end
  else begin
    FDeployedPlatform.TrackNumber := 0;
  end;

  result := TT3NonRealVehicle(FDeployedPlatform);

  if Assigned(FOnLogInitStr) then
    FOnLogInitStr(IntToStr(FDeployedPlatform.InstanceIndex )+ ' : '
     + FDeployedPlatform.InstanceName );
end;

function TT3SimManager.LaunchReferencePoint(const rec : TRecCmd_LaunchNonRP ): TT3PlatformInstance;
var
  FDeployedObject : TPlatform_Instance;
  nIndex : integer;
begin
  //edited by nando, bebe, mamik
  result := nil;
  nIndex := rec.NewPlatformID;

  //cendol....
  FDeployedObject := CreateNonRealPlatformInstance(nIndex);
  if Assigned(FDeployedObject) then
  begin
    with FDeployedObject do
    begin
      FData.Track_ID                      := rec.TrackIdent;
      FData.Instance_Name                 := rec.InstanceName;

      if rec.NewPlatformID = 0 then
      Begin
        if FData.Platform_Instance_Index = 0 then
          FData.Platform_Instance_Index :=  GetSerialPlatformID;
      End
      else
      begin
        if LoadFromSnapshot then
        begin
          FData.Platform_Instance_Index := rec.NewPlatformID;
          FLastPlatformID := rec.NRPPlatformID + 1;
        end
        else
          FData.Platform_Instance_Index := rec.NewPlatformID;
      end;

      //FData.Force_Designation           := ??
      FActivation.Init_Position_Longitude := rec.pX;
      FActivation.Init_Position_Latitude  := rec.pY;
      FActivation.Init_Course             := 0;
      FActivation.Init_Altitude           := 0;
//      FActivation.Init_Logistic           := 100;
      FActivation.Init_Ground_Speed       := 0;

      FActivation.Init_Fuel := Motion.FData.Max_Fuel_Capacity;
      FActivation.Init_Lubricants := Logistic.FData.Max_Lubricants_Capacity;
      FActivation.Init_Freshwater := Logistic.FData.Max_Freshwater_Capacity;
      FActivation.Init_Water := Logistic.FData.Max_Water_Capacity;
      FActivation.Init_Ration := Logistic.FData.Max_Ration_Capacity;
    end;

    with FDeployedObject.Motion do
    begin
      FData.Max_Altitude := 1000;
      FData.Min_Ground_Speed := 0;
      FData.Max_Ground_Speed := 200;
      FData.Max_Depth := 1000;
      FData.Acceleration := 0.92;
      FData.Deceleration := 1.83;
      FData.Standard_Turn_Rate := 1.4;
      FData.Tight_Turn_Rate := 2.8;
      FData.Normal_Climb_Rate := 3418;
      FData.Normal_Descent_Rate := 13670;
      FData.Vertical_Accel := 335;
    end;

    with FDeployedObject do
    begin
      FData.Force_Designation := rec.NRPGroupID;
      Vehicle.FData.Platform_Domain := rec.TrackDomain;
      Vehicle.FData.Platform_Category := rec.Identity;
      Vehicle.FData.Platform_Type := rec.PointType;
      Vehicle.FData.Vehicle_Identifier := 'Unknown';
    end;

    if TT3NonRealVehicle(FDeployedObject).SymbolType <> '' then
      TT3NonRealVehicle(FDeployedObject).SymbolType := rec.Symbol;

    TT3PlatformInstance(FDeployedObject) := SimNonrealAssetAssignment(FDeployedObject);
    TT3NonRealVehicle(FDeployedObject).InstanceName := 'Unknown';
    TT3PlatformInstance(FDeployedObject).TrackDomain := rec.TrackDomain;
    TT3PlatformInstance(FDeployedObject).TrackIdent := rec.Identity;
    TT3NonRealVehicle(FDeployedObject).NRPType := rec.PointType;
    TT3NonRealVehicle(FDeployedObject).SymbolType := rec.Symbol;
    TT3NonRealVehicle(FDeployedObject).OrderedSpeed  := rec.Speed;

    if rec.PointType = nrpBearing then
      TT3NonRealVehicle(FDeployedObject).OrderedHeading  := rec.Bearing
    else TT3NonRealVehicle(FDeployedObject).OrderedHeading  := rec.Course;

    TT3PlatformInstance(FDeployedObject).setPositionX(rec.pX);
    TT3PlatformInstance(FDeployedObject).setPositionY(rec.pY);

    result := TT3NonRealVehicle(FDeployedObject);

    if Assigned(FOnLogInitStr) then
      FOnLogInitStr(IntToStr( TT3PlatformInstance(FDeployedObject).InstanceIndex)
        + ' : ' + FDeployedObject.InstanceName);
  end;
end;

function TT3SimManager.UpdatePropertyPlatform(const rec : TRecCmd_Platform_SET_PROPERTY): TT3PlatformInstance;
var
  vIndex : Integer;
  obj : TObject;
begin
   Result := nil;

   vIndex := rec.PlatfomID;
   obj := FindT3PlatformByID(vIndex);

   if obj <> nil then
   begin
     //update domain
     Result := TT3PlatformInstance(obj);
   end;

   {if rec.domain <> -1 then
      TT3PlatformInstance(obj).TrackDomain := rec.domain;

   if rec.identity <> -1 then
      TT3PlatformInstance(obj).TrackIdent := rec.identity;

   if rec.platformType <> -1 then
      TT3PlatformInstance(obj).PlatformType := rec.platformType;}
end;

procedure TT3SimManager.SensorAssets(pi: TPlatform_Instance;
  vehicle: TT3Vehicle);
begin
  SensorSet(pi.Vehicle.Radars,TT3Radar,vehicle);
  SensorSet(pi.Vehicle.Sonars,TT3Sonar,vehicle);
  SensorSet(pi.Vehicle.Visualsensors,TT3Visual,vehicle);
  SensorSet(pi.Vehicle.EOSensors,TT3EOSensor,vehicle);
  SensorSet(pi.Vehicle.ESMSensors,TT3ESMSensor,vehicle);
  SensorSet(pi.Vehicle.MADSensors,TT3MADSensor,vehicle);
  SensorSet(pi.Vehicle.IFFSensors,TT3IFFSensor,vehicle);
  SensorSet(pi.Vehicle.FCRSensors,TT3FCRSensor,vehicle);
  SensorSet(pi.Vehicle.Sonobuoy,TT3SonobuoyOnVehicle ,vehicle);
end;

procedure TT3SimManager.SensorCommand(cmd : TRecCmd_Sensor);
var
  pi: TT3PlatformInstance;
  obj: TObject;
begin
  pi := FindT3PlatformByID(cmd.PlatformID);

  if pi = nil then
    Exit;

  if not(pi is TT3Vehicle) then
    Exit;

  case cmd.SensorType of
    CSENSOR_TYPE_RADAR:
      begin
        obj := TT3Vehicle(pi).getDevice(cmd.SensorID, TT3Radar);

        if (obj = nil) or (TT3Radar(obj).OperationalStatus = sopDamage) then
          Exit;

        case cmd.OrderID of
          CORD_ID_ControlMode:
            TT3Radar(obj).ControlMode := TRadarControlMode(cmd.OrderParam);
        end;
      end;

    CSENSOR_TYPE_SONAR:
      begin
        obj := TT3Vehicle(pi).getDevice(cmd.SensorID, TT3Sonar);

        if (obj = nil) or (TT3Sonar(obj).OperationalStatus = sopDamage) then
          Exit;

        case cmd.OrderID of
          CORD_ID_ControlMode:
            TT3Sonar(obj).ControlMode := TSonarControlMode(cmd.OrderParam);
          CORD_ID_ControlRangeSonar:
          begin
            TT3Sonar(obj).TIOWRange := TSonarTIOWRange(cmd.OrderParam);

            if Assigned(OnLogEventStr) then
              OnLogEventStr('TT3SimManager.SensorCommand', 'Sensor ' + TT3Sensor(obj).InstanceName + ', TIOW : '
                      + SonarTIOWRangeToString(TSonarTIOWRange(cmd.OrderParam)));
          end;
        end;

        EventManager.OnSonarControlMode(TT3Sensor(obj), TT3Sonar(obj).ControlMode);
      end;

    CSENSOR_TYPE_ESM:
      begin
        obj := TT3Vehicle(pi).getDevice(cmd.SensorID, TT3ESMSensor);

        if (obj = nil) or (TT3ESMSensor(obj).OperationalStatus = sopDamage) then
          Exit;

        case cmd.OrderID of
          CORD_ID_OperationalStatus:
            TT3ESMSensor(obj).OperationalStatus := TSensorOperationalStatus
              (cmd.OrderParam);
        end;
      end;

    CSENSOR_TYPE_EO:
      begin
        obj := TT3Vehicle(pi).getDevice(cmd.SensorID, TT3EOSensor);

        if (obj = nil) or (TT3EOSensor(obj).OperationalStatus = sopDamage) then
          Exit;

        case cmd.OrderID of
          CORD_ID_OperationalStatus:
            TT3EOSensor(obj).OperationalStatus := TSensorOperationalStatus
              (cmd.OrderParam);
        end;
      end;

    CSENSOR_TYPE_MAD:
      begin
        obj := TT3Vehicle(pi).getDevice(cmd.SensorID, TT3MADSensor);

        if (obj = nil) or (TT3MADSensor(obj).OperationalStatus = sopDamage) then
          Exit;

        case cmd.OrderID of
          CORD_ID_OperationalStatus:
            TT3MADSensor(obj).OperationalStatus := TSensorOperationalStatus
              (cmd.OrderParam);
        end;
      end;

    CSENSOR_TYPE_IFF:
      begin
        obj := TT3Vehicle(pi).getDevice(cmd.SensorID, TT3IFFSensor);

        if (obj = nil) or (TT3IFFSensor(obj).OperationalStatus = sopDamage) then
          Exit;

        case cmd.OrderID of
          1:
            TT3IFFSensor(obj).TransponderOperateStatus :=
              TSensorOperationalStatus(cmd.OrderParam);
          2:
            TT3IFFSensor(obj).InterrogatorOperateStatus :=
              TSensorOperationalStatus(cmd.OrderParam);
        end;
      end;
  end;

end;

procedure TT3SimManager.SensorSet(aList: TList; aClass: TClass;
  aParent: TT3Vehicle);
var
  j : integer;
  sensor : TObject;
begin
  for j := 0 to aList.Count - 1 do
  begin
    sensor := nil;

    if aClass = TT3Radar     then sensor := TT3Radar.Create else
    if aClass = TT3Sonar     then sensor := TT3Sonar.Create else
    if aClass = TT3Visual    then sensor := TT3Visual.Create else
    if aClass = TT3EOSensor  then sensor := TT3EOSensor.Create else
    if aClass = TT3ESMSensor then sensor := TT3ESMSensor.Create else
    if aClass = TT3MADSensor then sensor := TT3MADSensor.Create else
    if aClass = TT3FCRSensor then sensor := TT3FCRSensor.Create else
    if aClass = TT3IFFSensor then sensor := TT3IFFSensor.Create else
    if aClass = TT3SonobuoyOnVehicle  then sensor := TT3SonobuoyOnVehicle.Create;

    if (Assigned(sensor)) and (sensor is TT3Sensor) then
    begin
      with TT3Sensor(sensor) do
      begin
        UnitDefinition := aList[j];
        Parent := aParent;

        //set game defaults
        GameDefaults := Self.GameDefaults;
        // sensor for envi
        Environment := Self.GameEnvironment;

        Initialize;
        SetObjects(SimPlatforms);

        if aClass = TT3Radar then
        begin
          TT3Radar(sensor).OnControlMode := EventManager.OnRadarControlMode;
          TT3Radar(sensor).OnRemoveDetected := EventManager.OnRadarRemoveAssignedPlatform;
        end
        else if aClass = TT3Sonar then
          TT3Sonar(sensor).OnControlMode := EventManager.OnSonarControlMode
        else if aClass = TT3ESMSensor then
          TT3ESMSensor(sensor).Devices := SimDevices
        else if aClass = TT3Visual then
          OperationalStatus := sopOn
        else if aClass = TT3IFFSensor then
        begin
          TT3IFFSensor(sensor).OnTransponderStatus := EventManager.onIFFTransponderStatus;
          TT3IFFSensor(sensor).OnInterrogatorStatus := EventManager.OnIFFInterrogatorStatus;
        end;
      end;

      AssignSensorEvent(TT3Sensor(sensor));
      aParent.addDevice(TT3Sensor(sensor));
      SimDevices.addObject(TT3Sensor(sensor));
    end;
  end;
end;

procedure TT3SimManager.SensorSetEnvi;     //set envi + game default
var
  I: Integer;
  sensor : TSimObject;
begin
  for I := 0 to SimDevices.itemCount - 1 do
  begin
    sensor := SimDevices.getObject(I);

    if sensor is TT3Sensor then
    begin
      TT3Sensor(sensor).Environment := Self.GameEnvironment;
      TT3Sensor(sensor).GameDefaults := Self.GameDefaults;
    end;
  end;
end;

procedure TT3SimManager.VectacSet(aClass: TClass; aParent: TT3Vehicle);
var
  weapon : TObject;
begin
  weapon := TT3Vectac.Create;

  with TT3Vectac(weapon) do
  begin
    Owner := aParent;
  end;

  with TT3Weapon(weapon) do
  begin
    Parent := aParent;
    Initialize;
    SetObjects(SimPlatforms);
  end;

  AssignWeaponEvent(TT3Weapon(weapon));
  aParent.addWeapon(TT3Weapon(weapon));
  SimDevices.addObject(TT3Weapon(weapon));
end;

procedure TT3SimManager.VehicleSetEnvi;
var
  I: Integer;
  pl : TSimObject;
begin
  for I := 0 to SimPlatforms.itemCount - 1 do
  begin
    pl := SimPlatforms.getObject(I);

    if pl is TT3PlatformInstance then
    begin
      TT3PlatformInstance(pl).Environment := Self.GameEnvironment;
      TT3PlatformInstance(pl).GameDefaults := Self.GameDefaults;
    end;
  end;
end;

procedure TT3SimManager.DeviceSetEnvi;
var
  I: Integer;
  dev : TSimObject;
begin
  for I := 0 to SimDevices.itemCount - 1 do
  begin
    dev := SimDevices.getObject(I);

    if dev is TT3PlatformInstance then
    begin
      TT3PlatformInstance(dev).Environment := Self.GameEnvironment;
      TT3PlatformInstance(dev).GameDefaults := Self.GameDefaults;
    end;
  end;
end;

procedure TT3SimManager.DisembarkPersonelWith(const rec: TRecCmd_Embark);
var
  i, j, k, l, m : Integer;
  find :Boolean;
  idx : Integer;
  vParent, vchild : TT3Vehicle;
  BrigadeOnParent,  BrigadeOnChild  : TBrigade;
  BatalyonOnParent, BatalyonOnChild : TBatalyon;
  KompiOnParent,    KompiOnChild    : TKompi;
  PlatoonOnParent,  PlatoonOnChild  : TPlatoon;
  GroupOnParent,    GroupOnChild    : TGroup;

begin
  Find := False;

  vParent := nil;
  vchild  := nil;

  vParent := SimManager.FindT3PlatformByID(rec.ParentPlatformID) as TT3Vehicle;
  if not Assigned(vParent) then
    Exit;

  vchild  := SimManager.FindT3PlatformByID(rec.EmbarkPlatformID) as TT3Vehicle;
  if not Assigned(vchild) then
    Exit;

//  for i := 0 to vParent.PersonelTransportedList.Count - 1 do
//  begin
//    BrigadeOnParent := TBrigade(vParent.PersonelTransportedList.Items[i]);
//    for j := 0 to BrigadeOnParent.BatalyonList.Count - 1 do
//    begin
//      BatalyonOnParent := TBatalyon(BrigadeOnParent.BatalyonList.Items[j]);
//      for k := 0 to BatalyonOnParent.KompiList.Count - 1 do
//      begin
//        KompiOnParent := TKompi(BatalyonOnParent.KompiList.Items[k]);
//        for l := 0 to KompiOnParent.PlatoonList.Count - 1 do
//        begin
//          PlatoonOnParent := TPlatoon(KompiOnParent.PlatoonList.Items[l]);
//          for m := 0 to PlatoonOnParent.GroupList.Count - 1 do
//          begin
//            GroupOnParent := TGroup(PlatoonOnParent.GroupList.Items[m]);
//
//            if GroupOnParent.Id = rec.Quantity_Group_Personal then
//            begin
//              Find  := True;
//              idx   := m;
//              Break;
//            end;
//          end;
//          if find then Break;
//        end;
//        if find then Break;
//      end;
//      if find then Break;
//    end;
//    if find then Break;
//  end;

  if not find then
    Exit;

  {Brigade}
//  if CekPersonelOnShip(vchild.PersonelTransportedList, BrigadeOnParent.Identifier, i) then
//  begin
//    BrigadeOnChild := TBrigade(vchild.PersonelTransportedList.Items[i]);
//  end
//  else
//  begin
//    BrigadeOnChild  := TBrigade.Create;
//    BrigadeOnChild.Id := BrigadeOnParent.Id;
//    BrigadeOnChild.VeId := BrigadeOnParent.VeId;
//    BrigadeOnChild.Identifier := BrigadeOnParent.Identifier;
//    vchild.PersonelTransportedList.Add(BrigadeOnChild);
//  end;

  {Batalyon}
  if CekPersonelOnShip(BrigadeOnChild.BatalyonList, BatalyonOnParent.Identifier, i) then
  begin
    BatalyonOnChild := TBatalyon(BrigadeOnChild.BatalyonList.Items[i]);
  end
  else
  begin
    BatalyonOnChild := TBatalyon.Create;
    BatalyonOnChild.Id := BatalyonOnParent.Id;
    BatalyonOnChild.VeId := BatalyonOnParent.VeId;
    BatalyonOnChild.ChildFromBrigade := BatalyonOnParent.ChildFromBrigade;
    BatalyonOnChild.Identifier := BatalyonOnParent.Identifier;
    BrigadeOnChild.BatalyonList.Add(BatalyonOnChild);
  end;

  {Kompi}
  if CekPersonelOnShip(BatalyonOnChild.KompiList, KompiOnParent.Identifier, i) then
  begin
    KompiOnChild := TKompi(BatalyonOnChild.KompiList.Items[i]);
  end
  else
  begin
    KompiOnChild := TKompi.Create;
    KompiOnChild.Id := KompiOnParent.Id;
    KompiOnChild.VeId := KompiOnParent.VeId;
    KompiOnChild.Identifier := KompiOnParent.Identifier;
    KompiOnChild.ChildFromBrigade := KompiOnParent.ChildFromBrigade;
    KompiOnChild.ChildFromBatalyon := KompiOnParent.ChildFromBatalyon;
    BatalyonOnChild.KompiList.Add(KompiOnChild);
  end;

  {Platoon}
  if CekPersonelOnShip(KompiOnChild.PlatoonList, PlatoonOnParent.Identifier, i) then
  begin
    PlatoonOnChild := TPlatoon(KompiOnChild.PlatoonList.Items[i]);
  end
  else
  begin
    PlatoonOnChild := TPlatoon.Create;
    PlatoonOnChild.Id := PlatoonOnParent.Id;
    PlatoonOnChild.VeId := PlatoonOnParent.VeId;
    PlatoonOnChild.Identifier := PlatoonOnParent.Identifier;
    PlatoonOnChild.ChildFromBrigade := PlatoonOnParent.ChildFromBrigade;
    PlatoonOnChild.ChildFromBatalyon := PlatoonOnParent.ChildFromBatalyon;
    PlatoonOnChild.ChildFromKompi := PlatoonOnParent.ChildFromKompi;
    KompiOnChild.PlatoonList.Add(PlatoonOnChild);
  end;

  {Group}
  GroupOnChild := TGroup.Create;
  GroupOnChild.Id := GroupOnParent.Id;
  GroupOnChild.VeId := GroupOnParent.VeId;
  GroupOnChild.Identifier := GroupOnParent.Identifier;
  GroupOnChild.ChildFromBrigade := GroupOnParent.ChildFromBrigade;
  GroupOnChild.ChildFromBatalyon := GroupOnParent.ChildFromBatalyon;
  GroupOnChild.ChildFromKompi := GroupOnParent.ChildFromKompi;
  GroupOnChild.ChildFromPleton := GroupOnParent.ChildFromPleton;
  GroupOnChild.quantity := GroupOnParent.quantity;

  PlatoonOnChild.GroupList.Add(GroupOnChild);

  PlatoonOnParent.GroupList.Delete(idx);
end;

procedure TT3SimManager.SetLoadFromSnapshot(const Value: Boolean);
begin
  FLoadFromSnapshot := Value;
end;

procedure TT3SimManager.SetOnLogEventStr(const Value: TLogStrProc);
begin
  FOnLogEventStr := Value;
end;

procedure TT3SimManager.SetOnLogTemporary(const Value: TGetStrProc);
begin
  FOnLogTemporary := Value;
end;

function TT3SimManager.SimAssetAssignment(pi : TPlatform_Instance): TT3PlatformInstance;
var
  i, j, k : integer;
  vehicle   : TT3Vehicle;
  vLength, vWidth  : Double;
  hostPlatform : TT3EmbarkedVehicle;
  Transported : TT3TransportedInstance;
begin
  result := nil;

  GameEnvironment := FScenario.GameEnvironment;
  GameDefaults    := FScenario.GameDefaults;

  // jika platform instance tipe vehicle
  if pi.FData.Vehicle_Index <> 0 then
  begin
    vehicle := TT3Vehicle.Create;
    result := vehicle;

    if not Assigned(pi.Vehicle) then
      exit;

    with vehicle do
    begin
      FPIData        := pi.FData ;

      if pi.FData.vbs_class_name <> '' then
        pi.Vehicle.FData.VBS_Class_Name := pi.FData.vbs_class_name;

      UnitDefinition := pi.Vehicle;
      UnitMotion     := pi.Motion;
      UnitActivation := pi.FActivation;
      UnitLogistic   := pi.Logistic;
      UnitCapability := pi.Transport;

      //bebe
      PatternName    := pi.FPattern.Pattern_Identifier;
      if pi.FActivation.Guidance_Target > 0 then
      begin
        GuidanceTargetInst := FindT3PlatformByID(pi.FActivation.Guidance_Target);
      end;

      Enable         := false;

      // event assignment
      AssignPlatformInstanceEvent(vehicle);

      Force_Designation := pi.FData.Force_Designation;
      Track_ID          := pi.FData.Track_ID;
      InstanceName      := pi.FData.Instance_Name;
      InstanceIndex     := pi.FData.Platform_Instance_Index;
      IsGroupLeader     := pi.IsGroupLeader;
      PlatformDomain    := pi.Vehicle.FData.Platform_Domain;
      HostIdTransport   := pi.FActivation.Host_ID;
      StateTransport    := pi.FActivation.State_Transport;
      MemberPosX        := Trunc(pi.FActivation.Circle_X);
      MemberPosY        := Trunc(pi.FActivation.Circle_Y);
      MemberHeading     := pi.FActivation.Init_Helm_Angle;

      //choco
      LastDevicesSelected := 0;
      LastWeaponsSelected := 0;
      //TES
      isInstructor := FIsInstructor;
      isWasdal := FIsWasdal;

      {Prince}

      CurrentHanggarWeight := 0;
      CurrentHanggarCapacity := 0;

      CurrentOnBoardWeight := 0;

      CurrentHullWeight := 0;
      CurrentHullSpace := 0;

      CurrentPersonelWeight := 0;
      CurrentPersonelCapacity := 0;

      SumCurrentWeight := 0;

      SetObjects(SimPlatforms);

      Initialize;

      //heli limitation
      //VehicleDefinition not nill after initialize
      if Assigned(VehicleDefinition) then
      begin
        VehicleDefinition.FHeliLimitation := pi.HeliLimitation.FData;
      end;
//      GameSetting.TimeRemoveWreck := vehicle.DormantTime;
    end;

    //tambahkan enviro
    vehicle.Environment := Self.GameEnvironment;
    vehicle.GameDefaults := Self.GameDefaults;

    SimPlatforms.addObject(vehicle);

    SensorAssets(pi,vehicle);
    GunAssets(pi,vehicle);
    CounterMeasureAssets(pi,vehicle);

    vehicle.SetupChaff;
  end;

  if pi.FData.Mine_Index <> 0 then
    result := CreateTT3MineInstance(pi);
end;

function TT3SimManager.SimNonRealAssetAssignment(pi: TPlatform_Instance): TT3PlatformInstance;
var
  vehicle   : TT3NonRealVehicle;
begin
  result := nil;

  GameEnvironment := FScenario.GameEnvironment;
  GameDefaults    := FScenario.GameDefaults;

  // jika platform instance tipe vehicle
  if pi.FData.Vehicle_Index <> 0 then
  begin
    vehicle := TT3NonRealVehicle.Create;
    result := vehicle;

    if Assigned(pi.Vehicle) then
    begin
      with vehicle do
      begin
        UnitDefinition := pi.Vehicle;
        UnitMotion     := pi.Motion;
        UnitActivation := pi.FActivation;

        Enable         := false;

        // event assignment
        AssignPlatformInstanceEvent(vehicle);
        {
        Force_Designation := pi.FData.Force_Designation;
        Track_ID          := pi.FData.Track_ID;
        InstanceName      := pi.FData.Instance_Name;
        }
        InstanceIndex     := pi.FData.Platform_Instance_Index;
        IsGroupLeader     := pi.IsGroupLeader;
        PlatformDomain    := pi.Vehicle.FData.Platform_Domain;
        Force_Designation := pi.FData.Force_Designation;

        Initialize;
      end;

      with TT3PlatformInstance(vehicle).UnitMotion do
      begin
        FData.Min_Ground_Speed := 0;
        FData.Max_Ground_Speed := 2000;
        FData.Acceleration := 50;
        FData.Deceleration := 100;
        FData.Normal_Climb_Rate := 1000;
        FData.Max_Climb_Rate := 2000;
        FData.Normal_Descent_Rate := 1000;
        FData.Max_Descent_Rate := 2000;
        FData.Standard_Turn_Rate := 45;
        FData.Tight_Turn_Rate := 90;
      end;

      //environment
      vehicle.Environment := Self.GameEnvironment;
      vehicle.GameDefaults := Self.GameDefaults;

      simNonRealPlatform.addObject(vehicle);
      {
      SensorAssets(pi,vehicle);
      GunAssets(pi,vehicle);
      CounterMeasureAssets(pi,vehicle);
      }
    end;
  end;
end;

function TT3SimManager.CreateNonRealPlatformInstance(NewId : integer): TPlatform_Instance;
var
  pi : TPlatform_Instance;
begin
  result := nil;

  if Assigned(FScenario.DefaultNonRealPlatform) then
  begin
    // don't do it, u must copied before use it. so the original object not allowed edited
    // pi:= FScenario.DefaultNonRealPlatform;
    pi := TPlatform_Instance.Create;
    if (NewId = 0) then
      pi.FData.Platform_Instance_Index := GetSerialPlatformID
    else
      pi.FData.Platform_Instance_Index := NewId;

    with pi do
    begin
      // Copy Fdata
      FData.Resource_Alloc_Index    := FScenario.DefaultNonRealPlatform.FData.Resource_Alloc_Index;
      FData.Platform_Type           := FScenario.DefaultNonRealPlatform.FData.Platform_Type;
      FData.Vehicle_Index           := FScenario.DefaultNonRealPlatform.FData.Vehicle_Index;
      FData.Instance_Name           := FScenario.DefaultNonRealPlatform.FData.Instance_Name;
      FData.Force_Designation       := FScenario.DefaultNonRealPlatform.FData.Force_Designation;

      // Copy Vehicle Data
      Vehicle.FData.Vehicle_Index := FScenario.DefaultNonRealPlatform.Vehicle.FData.Vehicle_Index;
      Vehicle.FData.Vehicle_Identifier := 'Unknown';
      Vehicle.FData.Motion_Characteristics := FScenario.DefaultNonRealPlatform.Vehicle.FData.Motion_Characteristics;
      Vehicle.FPlatform_Ident.Instance_Ident_Index := pi.FData.Platform_Instance_Index;
      Vehicle.FPlatform_Ident.Vehicle_Index := FScenario.DefaultNonRealPlatform.Vehicle.FPlatform_Ident.Vehicle_Index;
      Vehicle.FPlatform_Ident.Instance_Identifier := 'Unknown';

      // Copy Motion
      Motion.FData.Motion_Index := FScenario.DefaultNonRealPlatform.Motion.FData.Motion_Index;
      Motion.FData.Motion_Identifier := FScenario.DefaultNonRealPlatform.Motion.FData.Motion_Identifier;
      Motion.FData.Motion_Type := FScenario.DefaultNonRealPlatform.Motion.FData.Motion_Type;
      Motion.FData.Endurance_Type := FScenario.DefaultNonRealPlatform.Motion.FData.Endurance_Type;
      Motion.FData.Endurance_Time := FScenario.DefaultNonRealPlatform.Motion.FData.Endurance_Time;
      Motion.FData.Max_Effective_Range := FScenario.DefaultNonRealPlatform.Motion.FData.Max_Effective_Range;
      Motion.FData.Fuel_Unit_Type := FScenario.DefaultNonRealPlatform.Motion.FData.Fuel_Unit_Type;
      Motion.FData.Max_Fuel_Capacity := FScenario.DefaultNonRealPlatform.Motion.FData.Max_Fuel_Capacity;
      Motion.FData.Min_Speed_Fuel_Consume := FScenario.DefaultNonRealPlatform.Motion.FData.Min_Speed_Fuel_Consume;
      Motion.FData.Cruise_Speed_Fuel_Consume := FScenario.DefaultNonRealPlatform.Motion.FData.Cruise_Speed_Fuel_Consume;
      Motion.FData.High_Speed_Fuel_Consume := FScenario.DefaultNonRealPlatform.Motion.FData.High_Speed_Fuel_Consume;
      Motion.FData.Max_Speed_Fuel_Consume := FScenario.DefaultNonRealPlatform.Motion.FData.Max_Speed_Fuel_Consume;
    end;

    if Assigned(OnLogStr) then
       OnLogStr('CreateNonRealPlatformInstance', 'Default TPlatform_Instance for Non Real Platform = '
                      + FScenario.DefaultNonRealPlatform.Vehicle.FData.Vehicle_Identifier);
  end
  else
  begin
    if Assigned(OnLogStr) then
       OnLogStr('CreateNonRealPlatformInstance', 'Default TPlatform_Instance for Non Real Platform = nil');

    Exit;
  end;

  //  pi.FData.Vehicle_Index := 294; //Ahmad Yani -> asumsi ahmad yani ada trus....
  //  FScenario.LoadPlatformDefinition(pi);

  pi.FData.Instance_Name := 'Unknown';

  FScenario.PlatformInstanceListFromDB.Add(pi);

  result := pi;
end;

procedure TT3SimManager.CreateOverlayShape(rec: TRecCmd_OverlayStaticShape);
var
  i, j : Integer;
  Point1 : TDotStatic;
  TextShape : TTextStatic;
  LineShape : TLineStatic;
  RectangleShape : TRectangleStatic;
  CircleShape : TCircleStatic;
  EllipseShape : TEllipseStatic;
  ArcShape : TArcStatic;
  SectorShape : TSectorStatic;
  GridShape : TGridStatic;
  PolygonShape : TPolygonStatic;
  OverlayTemplate : TMainOverlayTemplate;

begin
  OverlayTemplate := SimOverlayTemplate.GetOverlayTemplate(rec.TemplateId);

  if Assigned(OverlayTemplate) then
  begin
    case rec.IdAction of
      caAdd, caEdit :
      begin
        case rec.ShapeType of
          ovText :
          begin
            {$Region' Text '}
            if rec.IdAction = caAdd then
              TextShape := TTextStatic.Create(Converter)
            else
              TextShape := OverlayTemplate.StaticList.Items[rec.IdSelectShape];

            TextShape.postStart := rec.PostStart;
            TextShape.size := rec.Size;
            TextShape.words := rec.Words;
            TextShape.Color := rec.color;
            TextShape.isSelected := False;

            if rec.IdAction = caAdd then
              OverlayTemplate.StaticList.Add(TextShape);
            {$ENDREGION}
          end;
          ovLine :
          begin
            {$Region' Line '}
            if rec.IdAction = caAdd then
              LineShape := TLineStatic.Create(Converter)
            else
              LineShape := OverlayTemplate.StaticList.Items[rec.IdSelectShape];

            LineShape.postStart := rec.PostStart;
            LineShape.postEnd := rec.PostEnd;
            LineShape.color := rec.color;
            LineShape.ColorFill := rec.ColorFill;
            LineShape.LineType := rec.lineType;
            LineShape.Weight := rec.weight;
            LineShape.BrushStyle := rec.BrushStyle;
            LineShape.isSelected := False;

            if rec.IdAction = caAdd then
              OverlayTemplate.StaticList.Add(LineShape);
            {$ENDREGION}
          end;
          ovRectangle :
          begin
            {$Region' Rectangle '}
            if rec.IdAction = caAdd then
              RectangleShape := TRectangleStatic.Create(Converter)
            else
              RectangleShape := OverlayTemplate.StaticList.Items[rec.IdSelectShape];

            RectangleShape.postStart := rec.PostStart;
            RectangleShape.postEnd := rec.PostEnd;
            RectangleShape.color := rec.color;
            RectangleShape.ColorFill := rec.ColorFill;
            RectangleShape.LineType := rec.lineType;
            RectangleShape.Weight := rec.weight;
            RectangleShape.BrushStyle := rec.BrushStyle;

            RectangleShape.isSelected := False;

            if rec.IdAction = caAdd then
              OverlayTemplate.StaticList.Add(RectangleShape);
            {$ENDREGION}
          end;
          ovCircle :
          begin
            {$Region' Circle '}
            if rec.IdAction = caAdd then
              CircleShape := TCircleStatic.Create(Converter)
            else
              CircleShape := OverlayTemplate.StaticList.Items[rec.IdSelectShape];

            CircleShape.postCenter := rec.PostStart;
            CircleShape.radius := rec.Radius1;
            CircleShape.Color := rec.color;
            CircleShape.ColorFill := rec.ColorFill;
            CircleShape.LineType := rec.lineType;
            CircleShape.Weight := rec.weight;
            CircleShape.BrushStyle := rec.BrushStyle;
            CircleShape.isSelected := False;

            if rec.IdAction = caAdd then
              OverlayTemplate.StaticList.Add(CircleShape);
            {$ENDREGION}
          end;
          ovEllipse :
          begin
            {$Region' Ellipse '}
            if rec.IdAction = caAdd then
              EllipseShape := TEllipseStatic.Create(Converter)
            else
              EllipseShape := OverlayTemplate.StaticList.Items[rec.IdSelectShape];

            EllipseShape.postCenter := rec.PostStart;
            EllipseShape.Hradius := rec.Radius1;
            EllipseShape.Vradius := rec.Radius2;
            EllipseShape.Color := rec.color;
            EllipseShape.ColorFill := rec.ColorFill;
            EllipseShape.LineType := rec.lineType;
            EllipseShape.Weight := rec.weight;
            EllipseShape.BrushStyle := rec.BrushStyle;
            EllipseShape.isSelected := False;

            if rec.IdAction = caAdd then
              OverlayTemplate.StaticList.Add(EllipseShape);
            {$ENDREGION}
          end;
          ovArc :
          begin
            {$Region' Arc '}
            if rec.IdAction = caAdd then
              ArcShape := TArcStatic.Create(Converter)
            else
              ArcShape := OverlayTemplate.StaticList.Items[rec.IdSelectShape];

            ArcShape.postCenter := rec.PostStart;
            ArcShape.radius := rec.Radius1;
            ArcShape.StartAngle := rec.StartAngle;
            ArcShape.EndAngle := rec.EndAngle;
            ArcShape.Color := rec.color;
            ArcShape.LineType := rec.lineType;
            ArcShape.Weight := rec.weight;
            ArcShape.BrushStyle := rec.BrushStyle;
            ArcShape.isSelected := False;

            if rec.IdAction = caAdd then
              OverlayTemplate.StaticList.Add(ArcShape);
            {$ENDREGION}
          end;
          ovSector :
          begin
            {$Region' Sector '}
            if rec.IdAction = caAdd then
              SectorShape := TSectorStatic.Create(Converter)
            else
              SectorShape := OverlayTemplate.StaticList.Items[rec.IdSelectShape];

            SectorShape.postCenter := rec.PostStart;
            SectorShape.Oradius := rec.Radius1;
            SectorShape.Iradius := rec.Radius2;
            SectorShape.StartAngle := rec.StartAngle;
            SectorShape.EndAngle := rec.EndAngle;
            SectorShape.Color := rec.color;
            SectorShape.LineType := rec.lineType;
            SectorShape.Weight := rec.weight;
            SectorShape.BrushStyle := rec.BrushStyle;
            SectorShape.isSelected := False;

            if rec.IdAction = caAdd then
              OverlayTemplate.StaticList.Add(SectorShape);
            {$ENDREGION}
          end;
          ovGrid :
          begin
            {$Region' Sector '}
            if rec.IdAction = caAdd then
              GridShape := TGridStatic.Create(Converter)
            else
              GridShape := OverlayTemplate.StaticList.Items[rec.IdSelectShape];

            GridShape.postCenter := rec.PostStart;
            GridShape.Height := rec.Radius1;
            GridShape.Width := rec.Radius2;
            GridShape.HCount := rec.Kolom;
            GridShape.WCount := rec.Baris;
            GridShape.Rotation := rec.Rotasi;
            GridShape.Color := rec.color;
            GridShape.ColorFill := rec.ColorFill;
            GridShape.LineType := rec.lineType;
            GridShape.Weight := rec.weight;
            GridShape.BrushStyle := rec.BrushStyle;
            GridShape.isSelected := False;

            if rec.IdAction = caAdd then
              OverlayTemplate.StaticList.Add(GridShape);
            {$ENDREGION}
          end;
          ovPolygon  :
          begin
            {$Region' Polygon '}
            case rec.IdAction of
              caAdd :
              begin
                PolygonShape := TPolygonStatic.Create(Converter);
              end;
              caEdit :
              begin
                PolygonShape := OverlayTemplate.StaticList.Items[rec.IdSelectShape];
                PolygonShape.polyList.Clear;
              end;
            end;

            PolygonShape.Color := rec.color;
            PolygonShape.ColorFill := rec.ColorFill;
            PolygonShape.LineType := rec.lineType;
            PolygonShape.Weight := rec.weight;
            PolygonShape.BrushStyle := rec.BrushStyle;
            PolygonShape.isSelected := False;

            for i := 0 to 12 do
            begin
              if (rec.polyPoint[i].X = 0) and (rec.polyPoint[i].Y = 0) then
                Continue;

              Point1 := TDotStatic.Create;
              Point1.X := rec.polyPoint[i].X;
              Point1.Y := rec.polyPoint[i].Y;
              PolygonShape.polyList.Add(Point1);
            end;

            if rec.IdAction = caAdd then
              OverlayTemplate.StaticList.Add(PolygonShape);
            {$ENDREGION}
          end;
        end;
      end;
      caDelete :
      begin
        OverlayTemplate.StaticList.Delete(rec.IdSelectShape);
      end;
    end;
  end;
end;

procedure TT3SimManager.CreateOverlayTamplate(rec: TRecCmd_OverlayTemplate);
var
  OverlayTemplate : TMainOverlayTemplate;
begin
  if rec.IdAction = caAdd then
    rec.OverlayID := GetSerialOverlayID;

  rec.isShow := False;

  case rec.IdAction of
    caAdd, caSnapShoot: {Add}
    begin
      OverlayTemplate := TMainOverlayTemplate.Create;

      OverlayTemplate.OverlayIndex := rec.OverlayID;
      OverlayTemplate.Name := rec.Name;
      OverlayTemplate.Tipe := rec.Tipe;
      OverlayTemplate.Domain := rec.Domain;
      OverlayTemplate.isShow := rec.isShow;
      OverlayTemplate.Force := rec.force;
      OverlayTemplate.Role := rec.role;
      OverlayTemplate.RoleName := rec.roleName;
      SimOverlayTemplate.AddOverlayTemplate(OverlayTemplate);
    end;
    caEdit:{edit}
    begin

    end;
    caDelete:{delete}
    begin
      OverlayTemplate := SimOverlayTemplate.GetOverlayTemplate(rec.OverlayID);

      if Assigned(OverlayTemplate) then
        SimOverlayTemplate.RemoveOverlayTemplate(OverlayTemplate);

    end;
  end;
end;

procedure TT3SimManager.RepairPlatform(const rec : TRecCmd_Platform_Repair);
var
  ve : TT3Vehicle;
begin
  ve := FindT3PlatformByID(rec.PlatfomID) as TT3Vehicle;
  if not Assigned(ve) then Exit;

  ve.Health := rec.Health;
  ve.HealthPercent := rec.HealthPercent;

  UpdateAllDevicePlatform(ve);

  ve.Dormant := rec.nDormant;
  //ve.DormantTime := 120;
  ve.DormantTime := 60;
end;

procedure TT3SimManager.UnassignECMEvent(ecm: TT3CounterMeasure);
begin
  with ecm do
  begin
    OnLaunched    := nil;
    OnLogEventStr := nil;
    OnQuantityChange := nil;
    OnECMlistUpdated := nil;
  end;

  if ecm is TT3DefensiveJammerOnVehicle then
  begin
    with TT3DefensiveJammerOnVehicle(ecm) do
    begin
      OnJammingSuccess  := nil;
      OnJammingFailed   := nil;
      DeviceEntities    := nil;
      PlatformEntities  := nil;
    end;
  end;

  if ecm is TT3RadarNoiseJammerOnVehicle then
  begin
    with TT3RadarNoiseJammerOnVehicle(ecm) do
    begin
      OnJammingSuccess  := nil;
      //OnJammingFailed   := nil;
      DeviceEntities    := nil;
    end;
  end;
end;

procedure TT3SimManager.UnassignPlatformInstanceEvent(pi: TT3PlatformInstance);
begin
  with pi do begin
    OnDestroy         := nil;
    OnHancur          := nil;
    OnSelected        := nil;
    OnControlled      := nil;
    OnOrderedControl  := nil;
    OnDamageChanged   := nil;
    OnLogEventStr     := nil;
    OnFreeMe          := nil;
    OnAssigned        := nil;
    OnPropertyChange  := nil;

    // ini hanya berlaku di server saja ya...
    OnDepthChecker    := nil;
  end;

  //nando - event waypoint
  if pi is TT3Vehicle then
  begin
    (pi as TT3Vehicle).Waypoints.FonLaunchMissile := nil;
    (pi as TT3Vehicle).Waypoints.FOnLaunchTorpedo := nil;
    (pi as TT3Vehicle).Waypoints.FOnLaunchBomb    := nil;
    (pi as TT3Vehicle).Waypoints.FOnLaunchGun    := nil;
    (pi as TT3Vehicle).Waypoints.FonRadarEvent    := nil;
    (pi as TT3Vehicle).Waypoints.FonSonarEvent    := nil;
    (pi as TT3Vehicle).Waypoints.FonIffEvent      := nil;
    (pi as TT3Vehicle).Waypoints.FonDeployContinousEvent := nil;
    (pi as TT3Vehicle).Waypoints.FonDeploySonobuoy      := nil;
    (pi as TT3Vehicle).Waypoints.FonDeployMine          := nil;
    (pi as TT3Vehicle).Waypoints.FonCMEvent             := nil;
    (pi as TT3Vehicle).Waypoints.FonDatalinkEvent       := nil;
    (pi as TT3Vehicle).Waypoints.FonWaypointRemoveOwner := nil;

    (pi as TT3Vehicle).Waypoints.FOnWaypointChange:= nil;
    (pi as TT3Vehicle).Waypoints.FonWaypointEnd   := nil;
    (pi as TT3Vehicle).Waypoints.FonWaypointDestinationChange   := nil;
  end;

  if pi is TT3Vehicle then
  begin
    TT3Vehicle(pi).OnGuidance_Engage := nil;
    TT3Vehicle(pi).OnPositionChange := nil;

    //choco add
    TT3Vehicle(pi).OnGuidanceStaleTimeReached := nil;
    TT3Vehicle(pi).OnGuidanceStandoffReached := nil;
    TT3Vehicle(pi).OnLaunchWeaponEngagement := nil;

    //bebe
    //TT3Vehicle(pi).OnGuidanceStationReached := nil;
    //TT3Vehicle(pi).OnGuidanceStationUpdateHeading := nil;
  end;

  //andik
  if pi is TT3NonRealVehicle then
  begin
    TT3NonRealVehicle(pi).OnLastUpdateTimePlatform := nil;
  end;
end;

procedure TT3SimManager.UnassignSensorEvent(sensor: TT3Sensor);
begin
  if not Assigned(sensor) then
    Exit;

  with sensor do
  begin
    OnSensorOperationalStatus  := nil;
    OnDestroy                  := nil;
    OnSensorDetect             := nil;
    OnSensorRemoved            := nil;
    OnLogEventStr              := nil;
    OnDayTimeUpdate            := nil;
    OnIFFDetect                := nil;
    OnDeploySonar              := nil;
    OnUpdateFormSonar          := nil;
    OnUpdateActualCable        := nil;
    OnModeSearchIFF            := nil;
  end;

  if sensor is TT3DataLink then
  begin
    with TT3DataLink(sensor) do
    begin
      OnDatalinkPoolRequest := nil;
      OnDatalinkOffline     := nil;
      OnDatalinkOnline      := nil;
      OnDatalinkTrackUpdate := nil;
    end;
  end;
end;

procedure TT3SimManager.UnassignWeaponEvent(weapon: TT3Weapon);
begin
  if not Assigned(weapon) then
    Exit;

  with weapon do begin
    OnLaunched        := nil;
    OnHit             := nil;
    onHitTo3D         := nil;
	  OnOut             := nil;
    OnDestroy         := nil;
    OnTargeted        := nil;
    OnPropertyChange  := nil;
    OnFreeMe   		    := nil;
    OnLogEventStr     := nil;
    OnHybridLaunch    := nil;

    //ini hanya berlaku di client
    OnPropertyIntChange := nil;
    // ini hanya berlaku di server saja ya...
    OnDepthChecker    := nil;

    OnLogTemporary    := nil;
  end;

  if weapon is TT3GunOnVehicle then
  begin
    TT3GunOnVehicle(weapon).OnUpdateQuantity := nil;
    TT3GunOnVehicle(weapon).OnSetCaseFire := nil;
  end
  else if weapon is TT3MineOnVehicle then
  begin
    TT3MineONVehicle(weapon).OnUpdateQuantity := nil;
  end
  else if weapon is TT3BombONVehicle then
  begin
    TT3BombONVehicle(weapon).OnBombUpdateQuantity := nil;
  end
  else if weapon is TT3Missile then
  begin
    TT3Missile(weapon).OnSyncTarget := nil;
  end
  else if weapon is TT3Vectac then
  begin

  end;
end;

procedure TT3SimManager.UpdateAllDevicePlatform(ve : TT3Vehicle);
var
  i : Integer;
  device : TT3DeviceUnit;
  weapon : TT3Weapon;
begin
  for i := 0 to ve.Devices.Count - 1 do
  begin
    device := ve.Devices[i];
    if not ve.DamageStatus.SensorDamage then
    begin
      if device is TT3Sensor then
      begin
        if device is TT3IFFSensor then begin
          TT3IFFSensor(device).TransponderOperateStatus := sopOff;
          TT3IFFSensor(device).InterrogatorOperateStatus := sopOff;
        end;

        if device is TT3Visual then //andik
          TT3Sensor(device).OperationalStatus := TSensorOperationalStatus.sopOn
        else
          TT3Sensor(device).OperationalStatus := TSensorOperationalStatus.sopOff;
      end
      else if device is TT3CounterMeasure then
      begin
        TT3CounterMeasure(device).Status := TECMStatus.esAvailable;
      end;
    end
    else
    begin
      if device is TT3Sensor then
      begin
        if device is TT3IFFSensor then begin
          TT3IFFSensor(device).TransponderOperateStatus := sopDamage;
          TT3IFFSensor(device).InterrogatorOperateStatus := sopDamage;
        end;

        TT3Sensor(device).OperationalStatus := TSensorOperationalStatus.sopDamage;
      end
      else if device is TT3CounterMeasure then
      begin
        TT3CounterMeasure(device).Status := TECMStatus.esDamaged;
      end;
    end;
  end;

  for i := 0 to ve.Weapons.Count - 1 do
  begin
    weapon := ve.Weapons[i];
    if not ve.DamageStatus.WeaponDamage then
    begin
      if weapon is TT3Weapon then
      begin
        TT3Weapon(weapon).WeaponStatus := TWeaponStatus.wsAvailable;
      end;
    end
    else
    begin
      if weapon is TT3Weapon then
      begin
        TT3Weapon(weapon).WeaponStatus := TWeaponStatus.wsDamaged;
      end;
    end;
  end;
end;

procedure TT3SimManager.EmbarkTransportedPersonel(const rec: TRecCmd_EmbarkPersonelTemporary);
var

  idx, i, j, k, l, m, n : Integer;
  _PersonelQuantity     : Integer;

  _IsNewKompi     : Boolean;
  _IsNewPlatoon   : Boolean;
  _OwnShip        : TT3Vehicle;
  _BaseTransport  : TPlatformBase;

  _BrigadeOnShip,  _BrigadeOnBase  : TBrigade;
  _BatalyonOnShip, _BatalyonOnBase : TBatalyon;
  _KompiOnship,    _KompiOnBase    : TKompi;
  _PlatoonOnship,  _PlatoonOnBase  : TPlatoon;
  _GroupOnShip,    _GroupOnBase    : TGroup;

begin
  {$REGION ' Pengecekan kapal yang mengangkut '}
  _OwnShip := FindT3PlatformByID(rec.ParentPlatformID) as TT3Vehicle;

  if _OwnShip = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan pangkalan '}
  _BaseTransport := FindBaseTransportByName(rec.BaseIdentifier) as TPlatformBase;

  if _BaseTransport = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan brigade di kapal, jk sdh ada di add kan, jk belum create baru '}
//  if CekPersonelOnShip(_OwnShip.PersonelTransportedList, rec.BrigadeIdentifier, i) then
//  begin
//    _BrigadeOnShip := TBrigade(_OwnShip.PersonelTransportedList.Items[i]);
//  end
//  else
//  begin
//    _BrigadeOnShip  := TBrigade.Create;
//    _BrigadeOnShip.Identifier := rec.BrigadeIdentifier;
//    _OwnShip.PersonelTransportedList.Add(_BrigadeOnShip);
//  end;
  {$ENDREGION}

  {$REGION ' Pengecekan batalyon di kapal, jk sdh ada di add kan, jk belum create baru '}
  if CekPersonelOnShip(_BrigadeOnShip.BatalyonList, rec.BatalyonIdentifier, i) then
  begin
    _BatalyonOnShip := TBatalyon(_BrigadeOnShip.BatalyonList.Items[i]);
  end
  else
  begin
    _BatalyonOnShip := TBatalyon.Create;
    _BatalyonOnShip.Identifier := rec.BatalyonIdentifier;
    _BrigadeOnShip.BatalyonList.Add(_BatalyonOnShip);
  end;
  {$ENDREGION}

  {$REGION ' Memindah personel dari pangkalan ke kapal '}
  if GetPersonel(_BaseTransport.ListPersonel, rec.BrigadeIdentifier, Tpersonel(_BrigadeOnBase), 0, idx) then
  begin
    _BrigadeOnShip.Id   := _BrigadeOnBase.Id;
    _BrigadeOnShip.VeId := _BrigadeOnBase.VeId;

    if GetPersonel(_BrigadeOnBase.BatalyonList, rec.BatalyonIdentifier, Tpersonel(_BatalyonOnBase), 1, idx) then
    begin
      _BatalyonOnShip.Id := _BatalyonOnBase.Id;
      _BatalyonOnShip.VeId := _BatalyonOnBase.VeId;
      _BatalyonOnShip.ChildFromBrigade := _BatalyonOnBase.ChildFromBrigade;

      _IsNewKompi    := False;
      _IsNewPlatoon  := False;

      case rec.LevelID of
        2 :
        begin
          {$REGION ' Jk yang dipindah level Kompi '}
          if GetPersonel(_BatalyonOnBase.KompiList, rec.SelectedIdentifier, Tpersonel(_KompiOnBase), 2, idx) then
          begin
            {Cek apakah kompi sdh ada}
            if CekPersonelOnShip(_BatalyonOnShip.KompiList, rec.SelectedIdentifier, i) then
            begin
              _KompiOnship := TKompi(_BatalyonOnShip.KompiList.Items[i]);
            end
            else
            begin
              _KompiOnship := TKompi.Create;
              _KompiOnship.Id := _KompiOnBase.Id;
              _KompiOnship.VeId := _KompiOnBase.VeId;
              _KompiOnship.Identifier := rec.SelectedIdentifier;
              _KompiOnship.ChildFromBrigade := _KompiOnBase.ChildFromBrigade;
              _KompiOnship.ChildFromBatalyon := _KompiOnBase.ChildFromBatalyon;
              _IsNewKompi := True;
            end;

            for i := 0 to _KompiOnBase.PlatoonList.Count - 1 do
            begin
              _PlatoonOnBase := TPlatoon(_KompiOnBase.PlatoonList.Items[i]);

              _PlatoonOnship := TPlatoon.Create;
              _PlatoonOnship.Id := _PlatoonOnBase.Id;
              _PlatoonOnship.VeId := _PlatoonOnBase.VeId;
              _PlatoonOnship.Identifier := _PlatoonOnBase.Identifier;
              _PlatoonOnship.ChildFromBrigade := _PlatoonOnBase.ChildFromBrigade;
              _PlatoonOnship.ChildFromBatalyon := _PlatoonOnBase.ChildFromBatalyon;
              _PlatoonOnship.ChildFromKompi := _PlatoonOnBase.ChildFromKompi;

              for j := 0 to _PlatoonOnBase.GroupList.Count - 1 do
              begin
                _GroupOnBase := TGroup(_PlatoonOnBase.GroupList.Items[j]);

                _GroupOnShip := TGroup.Create;
                _GroupOnShip.Id := _GroupOnBase.Id;
                _GroupOnShip.VeId := _GroupOnBase.VeId;
                _GroupOnShip.Identifier := _GroupOnBase.Identifier;
                _GroupOnShip.ChildFromBrigade := _GroupOnBase.ChildFromBrigade;
                _GroupOnShip.ChildFromBatalyon := _GroupOnBase.ChildFromBatalyon;
                _GroupOnShip.ChildFromKompi := _GroupOnBase.ChildFromKompi;
                _GroupOnShip.ChildFromPleton := _GroupOnBase.ChildFromPleton;
                _GroupOnShip.quantity := _GroupOnBase.quantity;

                _PlatoonOnship.GroupList.Add(_GroupOnShip);
              end;

              _KompiOnship.PlatoonList.Add(_PlatoonOnship);
            end;

            if _IsNewKompi then
              _BatalyonOnShip.KompiList.Add(_KompiOnship);

            _BatalyonOnBase.KompiList.Delete(idx);
          end;
          {$ENDREGION}
        end;
        3 :
        begin
          {$REGION ' Jk yang dipindah level Platoon '}
          if GetPersonel(_BatalyonOnBase.KompiList, rec.KompiIdentifier, Tpersonel(_KompiOnBase), 2, idx) then
          begin
            {Cek apakah kompi sdh ada}
            if CekPersonelOnShip(_BatalyonOnShip.KompiList, rec.KompiIdentifier, i) then
            begin
              _KompiOnship := TKompi(_BatalyonOnShip.KompiList.Items[i]);
            end
            else
            begin
              _KompiOnship := TKompi.Create;
              _KompiOnship.Id := _KompiOnBase.Id;
              _KompiOnship.VeId := _KompiOnBase.VeId;
              _KompiOnship.Identifier := rec.KompiIdentifier;
              _KompiOnship.ChildFromBrigade := _KompiOnBase.ChildFromBrigade;
              _KompiOnship.ChildFromBatalyon := _KompiOnBase.ChildFromBatalyon;
              _IsNewKompi := True;
            end;

            if GetPersonel(_KompiOnBase.PlatoonList, rec.SelectedIdentifier, Tpersonel(_PlatoonOnBase), 3, idx) then
            begin
              {Cek apakah platoon sdh ada}
              if CekPersonelOnShip(_KompiOnship.PlatoonList, rec.SelectedIdentifier, i) then
              begin
                _PlatoonOnship := TPlatoon(_KompiOnship.PlatoonList.Items[i]);
              end
              else
              begin
                _PlatoonOnship := TPlatoon.Create;
                _PlatoonOnship.Id := _PlatoonOnBase.Id;
                _PlatoonOnship.VeId := _PlatoonOnBase.VeId;
                _PlatoonOnship.Identifier := rec.SelectedIdentifier;
                _PlatoonOnship.ChildFromBrigade := _PlatoonOnBase.ChildFromBrigade;
                _PlatoonOnship.ChildFromBatalyon := _PlatoonOnBase.ChildFromBatalyon;
                _PlatoonOnship.ChildFromKompi := _PlatoonOnBase.ChildFromKompi;
                _IsNewPlatoon := True;
              end;

              for j := 0 to _PlatoonOnBase.GroupList.Count - 1 do
              begin
                _GroupOnBase := TGroup(_PlatoonOnBase.GroupList.Items[j]);

                _GroupOnShip := TGroup.Create;
                _GroupOnShip.Id := _GroupOnBase.Id;
                _GroupOnShip.VeId := _GroupOnBase.VeId;
                _GroupOnShip.Identifier := _GroupOnBase.Identifier;
                _GroupOnShip.ChildFromBrigade := _GroupOnBase.ChildFromBrigade;
                _GroupOnShip.ChildFromBatalyon := _GroupOnBase.ChildFromBatalyon;
                _GroupOnShip.ChildFromKompi := _GroupOnBase.ChildFromKompi;
                _GroupOnShip.ChildFromPleton := _GroupOnBase.ChildFromPleton;
                _GroupOnShip.quantity := _GroupOnBase.quantity;

                _PlatoonOnship.GroupList.Add(_GroupOnShip);
              end;

              if _IsNewPlatoon then
                _KompiOnship.PlatoonList.Add(_PlatoonOnship);

              if _IsNewKompi then
                _BatalyonOnShip.KompiList.Add(_KompiOnship);

              _KompiOnBase.PlatoonList.Delete(idx);
            end;
          end;
          {$ENDREGION}
        end;
        4 :
        begin
          {$REGION ' Jk yang dipindah level Group '}
          if GetPersonel(_BatalyonOnBase.KompiList, rec.KompiIdentifier, Tpersonel(_KompiOnBase), 2, idx) then
          begin
            {Cek apakah kompi sdh ada}
            if CekPersonelOnShip(_BatalyonOnShip.KompiList, rec.KompiIdentifier, i) then
            begin
              _KompiOnship := TKompi(_BatalyonOnShip.KompiList.Items[i]);
            end
            else
            begin
              _KompiOnship := TKompi.Create;
              _KompiOnship.Id := _KompiOnBase.Id;
              _KompiOnship.VeId := _KompiOnBase.VeId;
              _KompiOnship.Identifier := rec.KompiIdentifier;
              _KompiOnship.ChildFromBrigade := _KompiOnBase.ChildFromBrigade;
              _KompiOnship.ChildFromBatalyon := _KompiOnBase.ChildFromBatalyon;
              _IsNewKompi := True;
            end;

            if GetPersonel(_KompiOnBase.PlatoonList, rec.PlatoonIdentifier, Tpersonel(_PlatoonOnBase), 3, idx) then
            begin
              {Cek apakah platoon sdh ada}
              if CekPersonelOnShip(_KompiOnship.PlatoonList, rec.PlatoonIdentifier, i) then
              begin
                _PlatoonOnship := TPlatoon(_KompiOnship.PlatoonList.Items[i]);
              end
              else
              begin
                _PlatoonOnship := TPlatoon.Create;
                _PlatoonOnship.Id := _PlatoonOnBase.Id;
                _PlatoonOnship.VeId := _PlatoonOnBase.VeId;
                _PlatoonOnship.Identifier := _PlatoonOnBase.Identifier;
                _PlatoonOnship.ChildFromBrigade := _PlatoonOnBase.ChildFromBrigade;
                _PlatoonOnship.ChildFromBatalyon := _PlatoonOnBase.ChildFromBatalyon;
                _PlatoonOnship.ChildFromKompi := _PlatoonOnBase.ChildFromKompi;
                _IsNewPlatoon := True;
              end;

              if GetPersonel(_PlatoonOnBase.GroupList, rec.SelectedIdentifier, Tpersonel(_GroupOnBase), 4, idx) then
              begin
                _GroupOnShip := TGroup.Create;
                _GroupOnShip.Id := _GroupOnBase.Id;
                _GroupOnShip.VeId := _GroupOnBase.VeId;
                _GroupOnShip.Identifier := _GroupOnBase.Identifier;
                _GroupOnShip.ChildFromBrigade := _GroupOnBase.ChildFromBrigade;
                _GroupOnShip.ChildFromBatalyon := _GroupOnBase.ChildFromBatalyon;
                _GroupOnShip.ChildFromKompi := _GroupOnBase.ChildFromKompi;
                _GroupOnShip.ChildFromPleton := _GroupOnBase.ChildFromPleton;
                _GroupOnShip.quantity := _GroupOnBase.quantity;

                _PlatoonOnship.GroupList.Add(_GroupOnShip);

                if _IsNewPlatoon then
                  _KompiOnship.PlatoonList.Add(_PlatoonOnship);

                if _IsNewKompi then
                  _BatalyonOnShip.KompiList.Add(_KompiOnship);

                _PlatoonOnBase.GroupList.Delete(idx);
              end;
            end;
          end;
          {$ENDREGION}
        end;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Menghitung jumlah personel yg diangkut'}
//  _PersonelQuantity := 0;
//  for j := 0 to _OwnShip.PersonelTransportedList.Count - 1 do
//  begin
//    _BrigadeOnShip  := TBrigade(_OwnShip.PersonelTransportedList.Items[j]);
//
//    for k := 0 to _BrigadeOnShip.BatalyonList.Count - 1 do
//    begin
//      _BatalyonOnShip := _BrigadeOnShip.BatalyonList.Items[k];
//
//      for l := 0 to _BatalyonOnShip.KompiList.Count - 1 do
//      begin
//        _KompiOnship := _BatalyonOnShip.KompiList.Items[l];
//
//        for m := 0 to _KompiOnship.PlatoonList.Count - 1 do
//        begin
//          _PlatoonOnship := _KompiOnship.PlatoonList.Items[m];
//
//          for n := 0 to _PlatoonOnship.GroupList.Count-1 do
//          begin
//            _GroupOnShip := _PlatoonOnship.GroupList.Items[n];
//            _PersonelQuantity := _PersonelQuantity + _GroupOnShip.quantity;
//          end;
//        end;
//      end;
//    end;
//  end;
  {$ENDREGION}

  {$REGION ' Refresh data kapasitas kapal '}
  _OwnShip.CurrentPersonelWeight    := (_OwnShip.UnitCapability.FData.Max_Personnel_Capacity * C_Personel_Weight) - (_PersonelQuantity * C_Personel_Weight);
  _OwnShip.CurrentPersonelCapacity  := (_OwnShip.UnitCapability.FData.Max_Personnel_Capacity - _PersonelQuantity);
  {$ENDREGION}
end;

procedure TT3SimManager.EmbarkTransported(const rec: TRecCmd_Transport);
var
  i : Integer;
  airQuantityTemp  : Integer;
  personelQuantityTemp : Integer;

  airWeightTemp : Double;
  onboardWeightTemp : Double;
  hullWeightTemp : Double;
  personelWeightTemp : Double;

  sumSpaceTemp : Double;

  hostShipTemp : TT3Vehicle;
  memberShipTemp : TT3Vehicle;

  shipTemp    : TT3Vehicle;

begin

  {$REGION ' Pengecekan kapal yang mengangkut '}
  hostShipTemp := FindT3PlatformByID(rec.HostPlatformID) as TT3Vehicle;

  if hostShipTemp = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang diangkut '}
  memberShipTemp := FindT3PlatformByID(rec.MemberPlatformID) as TT3Vehicle;

  if memberShipTemp = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Proses Embark '}
  memberShipTemp.StateTransport := rec.StateTransport;
  memberShipTemp.HostIdTransport := hostShipTemp.InstanceIndex;

  case memberShipTemp.PlatformDomain of
    vhdAir, vhdSurface, vhdSubsurface :
    begin
      memberShipTemp.MemberLoadState := mlsStandby;
      hostShipTemp.HostLoadState := hlsReady;
    end;
    vhdLand :
    begin
      if (memberShipTemp.PlatformCategory =  2) and (memberShipTemp.PlatformType =  0) then
      begin
        memberShipTemp.MemberLoadState := mlsStandby;
        hostShipTemp.HostLoadState := hlsReady;
      end
      else
      begin
        memberShipTemp.MemberLoadState := mlsQueue;
        hostShipTemp.HostLoadState := hlsLoading;
      end;
    end;
    vhdAmphibious :
    begin
      memberShipTemp.MemberLoadState := mlsQueue;
      hostShipTemp.HostLoadState := hlsLoading;
    end;
  end;

  hostShipTemp.MemberTransportList.Add(memberShipTemp);
  {$ENDREGION}

  {$REGION ' Refresh data kapasitas kapal '}
  airQuantityTemp := 0;
  airWeightTemp := 0;
  onboardWeightTemp := 0;
  hullWeightTemp := 0;
  personelQuantityTemp := 0;
  personelWeightTemp := 0;

  for i := 0 to hostShipTemp.MemberTransportList.Count - 1 do
  begin
    shipTemp := hostShipTemp.MemberTransportList.Items[i];

    case shipTemp.PlatformDomain of
      vhdAir :
      begin
        {$REGION ' Air Section '}
        airQuantityTemp  := airQuantityTemp + 1;
        airWeightTemp    := airWeightTemp + shipTemp.SumCurrentWeight;
        {$ENDREGION}
      end;
      vhdSurface,vhdSubsurface :
      begin
        {$REGION ' Surface & Subsurface Section '}
        onboardWeightTemp := onboardWeightTemp + shipTemp.SumCurrentWeight;
        {$ENDREGION}
      end;
      vhdLand :
      begin
        if (memberShipTemp.PlatformCategory =  2) and (memberShipTemp.PlatformType =  0) then
        begin
          {$REGION ' Personel Section '}
          personelQuantityTemp  := personelQuantityTemp + shipTemp.VehicleDefinition.FData.Quantity_Group_Personal;
          personelWeightTemp    := personelWeightTemp + shipTemp.VehicleDefinition.FData.Weight;
          {$ENDREGION}
        end
        else
        begin
          {$REGION ' Land Section '}
          hullWeightTemp := hullWeightTemp + shipTemp.SumCurrentWeight;
          sumSpaceTemp   := sumSpaceTemp + (shipTemp.VehicleDefinition.FData.Width * shipTemp.VehicleDefinition.FData.Length);
          {$ENDREGION}
        end;
      end;
      vhdAmphibious :
      begin
        {$REGION ' Amphibious Section '}
        hullWeightTemp := hullWeightTemp + shipTemp.SumCurrentWeight;
        sumSpaceTemp   := sumSpaceTemp + (shipTemp.VehicleDefinition.FData.Width * shipTemp.VehicleDefinition.FData.Length);
        {$ENDREGION}
      end;
    end;
  end;

  hostShipTemp.CurrentHanggarWeight :=  airWeightTemp;
  hostShipTemp.CurrentHanggarCapacity := airQuantityTemp;

  hostShipTemp.CurrentOnBoardWeight := onboardWeightTemp;

  hostShipTemp.CurrentHullWeight := hullWeightTemp;
  hostShipTemp.CurrentHullSpace := sumSpaceTemp;

  hostShipTemp.CurrentPersonelWeight := personelWeightTemp;
  hostShipTemp.CurrentPersonelCapacity := personelQuantityTemp;

  hostShipTemp.SumCurrentWeight := airWeightTemp + onboardWeightTemp + hullWeightTemp + personelWeightTemp;
  {$ENDREGION}

end;

procedure TT3SimManager.TransportProcess(const rec: TRecCmd_TransportProcess);
var
  HostTransport : TT3Vehicle;
  MemberTransport : TT3Vehicle;
begin
  {$REGION ' Pengecekan kapal yang mengangkut '}
  HostTransport := FindT3PlatformByID(rec.HostPlatformID) as TT3Vehicle;

  if HostTransport = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang diangkut '}
  MemberTransport := FindT3PlatformByID(rec.MemberPlatformID) as TT3Vehicle;

  if MemberTransport = nil then
    Exit;
  {$ENDREGION}

  MemberTransport.MemberLoadState := rec.MemberLoadState;
  MemberTransport.MemberPosX := rec.MemberPosX;
  MemberTransport.MemberPosY:= rec.MemberPosY;
  MemberTransport.MemberHeading:= rec.MemberHeading;
end;

procedure TT3SimManager.EmbarkedPlatformData(const rec: TRec_EmbarkedPlatformData);
var
  i : Integer;
  HostTransport : TT3Vehicle;
  MemberTransport, shipTemp : TT3Vehicle;
begin
  {$REGION ' Pengecekan kapal yang mengangkut '}
  HostTransport := FindT3PlatformByID(rec.HostShipID) as TT3Vehicle;

  if HostTransport = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang diangkut '}
  MemberTransport := FindT3PlatformByID(rec.MemberShipID) as TT3Vehicle;

  if MemberTransport = nil then
    Exit;
  {$ENDREGION}

  MemberTransport.IsinDisembarkArea := rec.IsEmbarkArea;
//  MemberTransport.IsMemberCollision := rec.IsCollision;

  case rec.OrderID of
    CORD_ID_SETHEADING :
    begin
      MemberTransport.MemberOrderedHeading := rec.Heading;
      MemberTransport.Heading := rec.Heading;
    end;
    CORD_ID_SETMOVE :
    begin
      MemberTransport.Heading := rec.Heading;
      MemberTransport.MemberSpeed := rec.Speed;

      if MemberTransport.MemberSpeed = 0 then
      begin
        MemberTransport.MemberLoadState := mlsStandby
      end
      else
        MemberTransport.MemberLoadState := mlsProcess
    end;
    CORD_ID_SETLOADSTATE :
    begin
      MemberTransport.Heading := rec.Heading;
      MemberTransport.MemberLoadState := mlsReady;
    end;
  end;

  MemberTransport.MemberPosX := rec.PosX;
  MemberTransport.MemberPosY := rec.PosY;

  HostTransport.HostLoadState := hlsReady;
  for i := 0 to HostTransport.MemberTransportList.Count-1 do
  begin
    shipTemp := HostTransport.MemberTransportList[i];

    if (shipTemp.MemberLoadState =  mlsProcess) <> (shipTemp.MemberLoadState =  mlsQueue) then
      HostTransport.HostLoadState := hlsLoading;
  end;

end;

procedure TT3SimManager.DisembarkTransported(const rec: TRecCmd_Transport);
var
  i, j : Integer;
  airQuantityTemp  : Integer;
  personelQuantityTemp : Integer;

  airWeightTemp : Double;
  onboardWeightTemp : Double;
  hullWeightTemp : Double;
  personelWeightTemp : Double;

  sumSpaceTemp : Double;

  hostShipTemp : TT3Vehicle;
  memberShipTemp : TT3Vehicle;

  shipTemp    : TT3Vehicle;

begin

  {$REGION ' Pengecekan kapal yang mengangkut '}
  hostShipTemp := FindT3PlatformByID(rec.HostPlatformID) as TT3Vehicle;

  if hostShipTemp = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang diangkut '}
  memberShipTemp := FindT3PlatformByID(rec.MemberPlatformID) as TT3Vehicle;

  if memberShipTemp = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Proses Disembark '}
  memberShipTemp.StateTransport := rec.StateTransport;
  memberShipTemp.HostIdTransport := 0;

  memberShipTemp.MemberLoadState := mlsNone;
  memberShipTemp.Heading := rec.InitCourse;
  memberShipTemp.OrderedHeading := rec.InitCourse;
  memberShipTemp.OrderedAltitude := rec.InitAltitude;

  memberShipTemp.Speed := rec.InitSpeed;

  hostShipTemp.HostLoadState := hlsReady;

  {$REGION ' Menghapus data kapal dari dalam host nya '}
  for i := 0 to hostShipTemp.MemberTransportList.Count - 1 do
  begin
    shipTemp := hostShipTemp.MemberTransportList.Items[i];

    if shipTemp.InstanceIndex = rec.MemberPlatformID then
    begin
      hostShipTemp.MemberTransportList.Delete(i);
      Break;
    end
  end;
  {$ENDREGION}

  {$ENDREGION}

  {$REGION ' Refresh data kapasitas kapal '}
  airQuantityTemp := 0;
  airWeightTemp := 0;
  onboardWeightTemp := 0;
  hullWeightTemp := 0;
  personelQuantityTemp := 0;
  personelWeightTemp := 0;

  for i := 0 to hostShipTemp.MemberTransportList.Count - 1 do
  begin
    shipTemp := hostShipTemp.MemberTransportList.Items[i];

    case shipTemp.PlatformDomain of
      vhdAir :
      begin
        {$REGION ' Air Section '}
        airQuantityTemp  := airQuantityTemp + 1;
        airWeightTemp    := airWeightTemp + shipTemp.SumCurrentWeight;
        {$ENDREGION}
      end;
      vhdSurface,vhdSubsurface :
      begin
        {$REGION ' Surface & Subsurface Section '}
        onboardWeightTemp    := onboardWeightTemp + shipTemp.SumCurrentWeight;
        {$ENDREGION}
      end;
      vhdLand :
      begin
        if (memberShipTemp.PlatformCategory =  2) and (memberShipTemp.PlatformType =  0) then
        begin
          {$REGION ' Personel Section '}
          personelQuantityTemp  := personelQuantityTemp + shipTemp.VehicleDefinition.FData.Quantity_Group_Personal;
          personelWeightTemp    := personelWeightTemp + shipTemp.VehicleDefinition.FData.Weight;
          {$ENDREGION}
        end
        else
        begin
          {$REGION ' Land Section '}
          hullWeightTemp := hullWeightTemp + shipTemp.SumCurrentWeight;
          sumSpaceTemp   := sumSpaceTemp + (shipTemp.VehicleDefinition.FData.Width * shipTemp.VehicleDefinition.FData.Length);
          {$ENDREGION}
        end;
      end;
      vhdAmphibious :
      begin
        {$REGION ' Amphibious Section '}
        hullWeightTemp := hullWeightTemp + shipTemp.SumCurrentWeight;
        sumSpaceTemp   := sumSpaceTemp + (shipTemp.VehicleDefinition.FData.Width * shipTemp.VehicleDefinition.FData.Length);
        {$ENDREGION}
      end;
    end;
  end;

  hostShipTemp.CurrentHanggarWeight :=  airWeightTemp;
  hostShipTemp.CurrentHanggarCapacity := airQuantityTemp;

  hostShipTemp.CurrentOnBoardWeight := onboardWeightTemp;

  hostShipTemp.CurrentHullWeight := hullWeightTemp;
  hostShipTemp.CurrentHullSpace := sumSpaceTemp;

  hostShipTemp.CurrentPersonelWeight := personelWeightTemp;
  hostShipTemp.CurrentPersonelCapacity := personelQuantityTemp;

  hostShipTemp.SumCurrentWeight := airWeightTemp + onboardWeightTemp + hullWeightTemp + personelWeightTemp;
  {$ENDREGION}

end;

procedure TT3SimManager.EmbarkTransportedFromBase(const rec: TRecCmd_Transport; const _OwnShip : TT3Vehicle);
var
  i : Integer;

  _Transported    : TT3TransportedInstance;
  _TransportedData: TPlatform_Instance;
  _BaseTransport  : TPlatformBase;
  _TransportedOnBaseSelected  : TPlatform_Embark_Library;

begin
  {$REGION ' Pengecekan pangkalan '}
  _BaseTransport := FindBaseTransportByName(rec.BaseIdentifier) as TPlatformBase;

  if _BaseTransport = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Mengurangi kapal yg diangkut dari pangkalan '}
  for i := 0 to _BaseTransport.ListVehicle.Count - 1 do
  begin
    _TransportedOnBaseSelected := TPlatform_Embark_Library(_BaseTransport.ListVehicle.Items[i]);

    if _TransportedOnBaseSelected.FData.Vehicle_Index = rec.MemberPlatformID then
    begin
      {Mengurangi quantity platform embark di pangkalan}
      _TransportedOnBaseSelected.FData.Quantity := _TransportedOnBaseSelected.FData.Quantity - 1;
      Break;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Menambahkan kapal yg diangkut ke dalam kapal pengangkut '}
  _TransportedData := FScenario.GetPiRuntimePlatform(rec.MemberPlatformID);

  _Transported            := TT3TransportedInstance.Create;
//  _Transported.Identifier := rec.EmbarkIdentifier;
  _Transported.TrackID    := rec.TrackID;
//  _Transported.Weight     := rec.Weight;
//  _Transported.WideScale  := rec.WideScale;
  _Transported.IdxVehicle := rec.MemberPlatformID;
//  _Transported.Domain     := rec.Domain;
  _Transported.ReadyingTime := _TransportedData.Vehicle.FData.Readying_Time;
  _Transported.Status     := 0;

//  _OwnShip.TransportedList.Add(_Transported);
  {$ENDREGION}

end;

procedure TT3SimManager.EmbarkTransportedFromGame(const rec: TRecCmd_Transport; const _OwnShip, _TransportedFromReEmbark : TT3Vehicle);
var
  i, j, k, l, m : Integer;

  _Brigade  : TBrigade;
  _Batalyon : TBatalyon;
  _Kompi    : TKompi;
  _Platoon  : TPlatoon;
  _Group    : TGroup;

  _recPersonel      : TRecCmd_Embark;
  _TransportedData  : TPlatform_Instance;
  _Transported      : TT3TransportedInstance;

begin

  {$REGION ' Memasukkan kapal pendarat ke dalam kapal pengangkut '}
  if _TransportedFromReEmbark.FromEmbarkWith then
  begin
//    if _TransportedFromReEmbark.Track_ID = 'LCR' then
//      _OwnShip.SumLCR := _OwnShip.SumLCR + 1
//    else if _TransportedFromReEmbark.Track_ID = 'LCVP' then
//      _OwnShip.SumLCVP := _OwnShip.SumLCVP + 1
//    else if _TransportedFromReEmbark.Track_ID = 'LCU' then
//      _OwnShip.SumLCU := _OwnShip.SumLCU + 1;
  end
  {$ENDREGION}

  {$REGION ' Menambahkan kapal yg diangkut ke dalam kapal pengangkut '}
  else
  begin
    _TransportedData := FScenario.GetPiRuntimePlatform(rec.MemberPlatformID);

    _Transported            := TT3TransportedInstance.Create;
//    _Transported.Identifier := rec.EmbarkIdentifier;
    _Transported.TrackID    := rec.TrackID;
//    _Transported.Weight     := rec.Weight;
//    _Transported.WideScale  := rec.WideScale;
    _Transported.IdxVehicle := rec.MemberPlatformID;
//    _Transported.Domain     := rec.Domain;
    _Transported.ReadyingTime := _TransportedData.Vehicle.FData.Readying_Time;
    _Transported.Status     := 0;

//    _OwnShip.TransportedList.Add(_Transported);
  end;
  {$ENDREGION}

  {$REGION ' Jk yg di embark membawa personel '}
//  for i := 0 to _TransportedFromReEmbark.PersonelTransportedList.Count - 1 do
//  begin
//    _Brigade := TBrigade(_TransportedFromReEmbark.PersonelTransportedList.Items[i]);
//    for j := 0 to _Brigade.BatalyonList.Count - 1 do
//    begin
//      _Batalyon := TBatalyon(_Brigade.BatalyonList.Items[j]);
//      for k := 0 to _Batalyon.KompiList.Count - 1 do
//      begin
//        _Kompi := TKompi(_Batalyon.KompiList.Items[k]);
//        for l := 0 to _Kompi.PlatoonList.Count - 1 do
//        begin
//          _Platoon := TPlatoon(_Kompi.PlatoonList.Items[l]);
//          for m := 0 to _Platoon.GroupList.Count - 1 do
//          begin
//            _Group := TGroup(_Platoon.GroupList.Items[m]);
//
////            _recPersonel.ParentPlatformID := rec.ReEmbarkPlatformID;
//            _recPersonel.EmbarkPlatformID := rec.HostPlatformID;
//            _recPersonel.Quantity_Group_Personal := _Group.id;
//            DisembarkPersonelWith(_recPersonel);
//          end;
//        end;
//      end;
//    end;
//  end;
  {$ENDREGION}

  {$REGION ' Jk yg di embark membawa kapal lain '}
//  for i := 0 to _TransportedFromReEmbark.TransportedList.Count - 1 do
//  begin
//    _Transported := _TransportedFromReEmbark.TransportedList.Items[i];
//
//    _Transported.ReadyingTime := 0;
//    _Transported.Status       := 0;
//
//    _OwnShip.TransportedList.Add(_Transported);
//  end;
  {$ENDREGION}
end;

function TT3SimManager.DisembarkTransportedOld(const rec: TRecCmd_Embark): TT3PlatformInstance;
var
  i     : integer;
  _Data : AnsiString;

  _OwnShip      : TT3Vehicle;
  _Transported  : TT3TransportedInstance;

  _PlatformInstance   : TPlatform_Instance;
  _LaunchTransported  : TT3PlatformInstance;

  _GroupCubicle  : T3CubicleGroup;
begin
  result := nil;

  {$REGION ' Pengecekan kapal yang mengangkut '}
  _OwnShip := FindT3PlatformByID(rec.ParentPlatformID) as TT3Vehicle;

  if _OwnShip = nil then
    Exit;
  {$ENDREGION}

  CopyArrayToStr(rec.TrackIdent, _Data);

  {$REGION ' Hanya diproses saat disembark : menghapus transported dr kapal pengangkut '}
//  if rec.Quantity = 100 then
//  begin
//    for I := 0 to _OwnShip.TransportedList.Count - 1 do
//    begin
//      _Transported  := TT3TransportedInstance(_OwnShip.TransportedList.Items[i]);
//
//      if not(assigned(_Transported)) then
//        Continue;
//
//      {dicek track Id, antrian, status}
//      if (_Transported.TrackID = _Data) and (i = rec.QueueNum) then
//      begin
//        _OwnShip.TransportedList.Delete(i);
//        _OwnShip.UpdateStatus := True;
//        Break;
//      end
//      else
//        _Transported := nil;
//    end;
//
//    if _Transported = nil then
//      Exit;
//  end;
  {$ENDREGION}

  {$REGION ' Create Platform Instance '}
  _PlatformInstance := CreatePlatformInstanceRP(1, rec.IDPlatformClass, rec.EmbarkPlatformID);

  if not(assigned(_PlatformInstance)) then
    exit;

  with _PlatformInstance do
  begin
    FData.Track_ID  := _Data;
    _Data           := '';

    CopyArrayToStr(rec.LaunchName, _Data);
    FData.Instance_Name := _Data;

    if rec.Hosted_Index = 0 then
    Begin
      if FData.Platform_Instance_Index = 0 then
        FData.Platform_Instance_Index :=  GetSerialPlatformID;
    End
    else
    begin
      if LoadFromSnapshot then
      begin
        FData.Platform_Instance_Index := rec.Hosted_Index;
        FLastPlatformID := rec.Hosted_Index + 1;
      end
      else
        FData.Platform_Instance_Index := rec.Hosted_Index;
    end;

    FData.Force_Designation           := _OwnShip.Force_Designation;
    FActivation.Init_Position_Longitude := _OwnShip.getPositionX;
    FActivation.Init_Position_Latitude  := _OwnShip.getPositionY;

    case _OwnShip.VehicleDefinition.FData.GangwayPosition of
      0 :   //haluan
      begin
        FActivation.Init_Course := _OwnShip.Course;
      end;
      1 :  //buritan
      begin
        FActivation.Init_Course := _OwnShip.Course + 180;
        if FActivation.Init_Course > 360 then
          FActivation.Init_Course := FActivation.Init_Course - 360;
      end;
      2:  //lambung tengah
      begin
        FActivation.Init_Course := _OwnShip.Course;
      end;
      3:  //none
      begin
        FActivation.Init_Course := _OwnShip.Course;
      end;
    end;

    FActivation.Init_Altitude           := 0;
    FActivation.Init_Ground_Speed       := 0;
    FActivation.Init_Fuel := Motion.FData.Max_Fuel_Capacity;
    FActivation.Init_Lubricants := Logistic.FData.Max_Lubricants_Capacity;
    FActivation.Init_Freshwater := Logistic.FData.Max_Freshwater_Capacity;
    FActivation.Init_Water := Logistic.FData.Max_Water_Capacity;
    FActivation.Init_Ration := Logistic.FData.Max_Ration_Capacity;
  end;
  {$ENDREGION}

  {$REGION ' Create TT3PlatformInstance '}
  _LaunchTransported := SimAssetAssignment(_PlatformInstance);

  if (Assigned(_LaunchTransported)) and (_LaunchTransported is TT3Vehicle) then
  begin
    _LaunchTransported.PosX := _OwnShip.getPositionX;
    _LaunchTransported.PosY := _OwnShip.getPositionY;
    _LaunchTransported.PosZ := _OwnShip.getPositionZ;

    if (TT3Vehicle(_LaunchTransported).VehicleDefinition.FData.Platform_Domain = vhdAir) then
    begin
      TT3Vehicle(_LaunchTransported).OrderedAltitude := 100;   //--> default launch dengan ketingian = 100
    end;

    if (TT3Vehicle(_LaunchTransported).VehicleDefinition.FData.Platform_Domain <> vhdAir) then
      TT3Vehicle(_LaunchTransported).OrderedSpeed := 3;

    _LaunchTransported.UnitGroup       := _OwnShip.UnitGroup;
    _LaunchTransported.GroupIndex      := _OwnShip.GroupIndex;

    _LaunchTransported.Parent          := nil;
    _LaunchTransported.Enable          := _OwnShip.Enable;

    TT3Vehicle(_LaunchTransported).LeaderPlatform   := _OwnShip;
    TT3Vehicle(_LaunchTransported).DisEmbarkProsess := True;
    TT3Vehicle(_LaunchTransported).HostIdTransport  := _OwnShip.InstanceIndex;

    _GroupCubicle := FScenario.CubiclesGroupsListFromDB.GetGroupOf_PlatformIndex(rec.ParentPlatformID) ;

    if Assigned(_GroupCubicle) then
    begin
      _GroupCubicle.AddMember(TT3Vehicle(_LaunchTransported).InstanceIndex);
      TT3Vehicle(_LaunchTransported).GroupIndex := _GroupCubicle.FData.Group_Index;
      TT3Vehicle(_LaunchTransported).TrackNumber := _GroupCubicle.GetTrackNumber(rec.EmbarkPlatformID);
    end
    else
    begin
      _LaunchTransported.TrackNumber := 0;
    end;

    if rec.Quantity = 101 then
    begin
      TT3Vehicle(_LaunchTransported).FromEmbarkWith := True;

    end
    else
      TT3Vehicle(_LaunchTransported).FromEmbarkWith := False;

    result := _LaunchTransported;
  end;
  {$ENDREGION}

  if rec.Quantity = 101 then
  begin
    DisembarkPersonelWith(rec);
  end;

end;
{$ENDREGION}

end.
