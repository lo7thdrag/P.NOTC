unit uT3Vehicle;

interface

uses uT3Unit, Classes, u2DMover, uT3Weapon, Graphics, uObjectVisuals, SysUtils,
     uWaypoint, uSteppers, uDBAsset_Vehicle, tttData, uDataTypes, uFormula,
     uGameData_TTT, uSimObjects, ExtCtrls, math , uCalculationEnvi, Windows,
     uCoordConvertor, uSnapshotData,uT3UnitContainer, uVectorVisual, DateUtils,
  uBrigadePersonel;


type
  TMoveChangeState  = (mcsStable, mcsIncrease, mcsDecrease);
  TOnGuidance_Engage = procedure (aShipID, aTargetID : TT3PlatformInstance;
                       MissileId : Integer ; IsHaveLaunch : Byte) of object;
  TOnStaleTimeReached = procedure (aParentID, aTargetID : TT3PlatformInstance; aDT : Double) of object;
  TOnStandoffReached = procedure (aParentID, aTargetID : TT3PlatformInstance) of object;
  TOnLaunchWeaponEngagement = procedure (aParentID, aTargetID : TT3PlatformInstance) of object;

  {Station}
//  TOnStationReached = procedure (aParentID : TT3PlatformInstance; aVal : Boolean) of object;
//  TOnStationUpdateSpeed = procedure (aParentID : TT3PlatformInstance; aSpeed : Double) of object;
//  TOnStationUpdateHeading = procedure (aParentID : TT3PlatformInstance; aHeading : Double) of object;
  TOnLastUpdateTimePlatform = procedure (str : string) of object;
//==============================================================================

  // event handling untuk embarked platform
  TOnEmbarkedReady = procedure (Sender : TObject; QueueNumber : integer) of object;
  TOnEmbarkedReadyTimer = procedure (Sender : TObject; QueueNumber : integer; Counter : integer) of object;
  TOnCekLandandDepth = procedure (x, y : Double ;r: TRec_MapData) of object;
  TOnDeleteVehicle3D = procedure (PlatformID : Integer) of object;

  TQueuedEmbarkedLaunch = class
  private
    FInitialHeading     : double;
    FInitialSpeed       : double;
    FQueueNumber        : integer;
    FReadyToLaunch      : boolean;
    FReadyingTime       : double;
    FDelayer            : TDelayer;
    FOnReadyToLaunch    : TOnEmbarkedReady;
    FOnEmbarkedReadyTimer: TOnEmbarkedReadyTimer;
    FTrackID            : string;
    FLaunchName         : string;
    FHasLaunch: boolean;
    FInstanceIndexEmbark: Integer;

    procedure SetInitialHeading(const Value: double);
    procedure SetInitialSpeed(const Value: double);
    procedure SetReadyToLaunch(const Value: boolean);
    procedure SetReadyingTime(const Value: double);
    procedure SetOnReadyToLaunch(const Value: TOnEmbarkedReady);
    procedure SetOnEmbarkedReadyTimer(const Value: TOnEmbarkedReadyTimer);
    procedure OnDelayer(Sender : TObject);
    procedure SetQueueNumber(const Value: integer);
    procedure SetTrackID(const Value: string);
    procedure SetLaunchName(const Value: string);
    procedure SetHasLaunch(const Value: boolean);

    procedure SetInstanceIndexEmbark(const Value: Integer);  public
    constructor Create;
    destructor Destroy; override;
    procedure Run(const aDeltaMs : double);

    property ReadyingTime   : double  read FReadyingTime    write SetReadyingTime; //second
    property ReadyToLaunch  : boolean read FReadyToLaunch   write SetReadyToLaunch  default false;
    property HasLaunch      : boolean read FHasLaunch       write SetHasLaunch default False;
    property InitialSpeed   : double  read FInitialSpeed    write SetInitialSpeed   ;
    property InitialHeading : double  read FInitialHeading  write SetInitialHeading ;
    property QueueNumber    : integer read FQueueNumber     write SetQueueNumber;
    property TrackID        : string  read FTrackID         write SetTrackID;
    property LaunchName     : string read FLaunchName write SetLaunchName;
    property OnReadyToLaunch      : TOnEmbarkedReady      read FOnReadyToLaunch       write SetOnReadyToLaunch;
    property OnEmbarkedReadyTimer : TOnEmbarkedReadyTimer read FOnEmbarkedReadyTimer  write SetOnEmbarkedReadyTimer;
    property InstanceIndexEmbark : Integer read FInstanceIndexEmbark write SetInstanceIndexEmbark;
  end;

  {Prince ini tes}
  TT3TransportedInstance = class (TSimObject)
  private

    FIdentifier: string;
    FTrackID: string;
    FWideScale: Double;
    FWeight: Double;
    FIdxVehicle: Integer;
    FDomain: Integer;
    FStatus: Integer; {0: Queue; 1: Embark Process; 2: Standby 3: Ready}
    FReadyingTime: double;
	FDWT: Double;

    procedure SetIdentifier(const Value: string);
    procedure SetTrackID(const Value: string);
    procedure SetWeight(const Value: Double);
    procedure SetWideScale(const Value: Double);

    procedure SetIdxVehicle(const Value: Integer);

    procedure SetDomain(const Value: Integer);
	  procedure SetDWT(const Value: Double); public
    procedure SetStatus(const Value: Integer);
    procedure SetReadyingTime(const Value: double);public
    constructor Create;
    destructor Destroy; override;
    procedure Run(const aDeltaMs : double);

    function RemoveTemporaryItem(Data: TObject): boolean;

  public


    property ReadyingTime   : double  read FReadyingTime    write SetReadyingTime;
    property IdxVehicle : Integer read FIdxVehicle write SetIdxVehicle;
    property Identifier : string read FIdentifier write SetIdentifier;
    property TrackID    : string read FTrackID    write SetTrackID;
    property Weight     : Double read FWeight write SetWeight;
    property WideScale  : Double read FWideScale write SetWideScale;
    property Domain     : Integer read FDomain write SetDomain;
    property Status     : Integer read FStatus write SetStatus;
	property DWT        : Double read FDWT write SetDWT;
  end;

  TT3EmbarkedVehicle = class(TSimObject)
  private
    FQuantity           : integer;
    FEmbarkedVehicle    : TRecHosted_Platform;
    FEmbarkedIdentifier : string;
    FLaunchAlert        : integer;
    FReadying           : Double;
    FQueueNumber        : integer;
    FLaunchQueue        : TList;
    FLandQueue          : TList;
    FOnEmbarkedTimer    : TOnEmbarkedReadyTimer;
    FOnEmbarkedReadyTimer: TOnEmbarkedReadyTimer;
    FOnUpdateState      : TNotifyEvent;
    FAvailabel          : integer;
    FIsAfterLanding : Boolean;
    FOnAfterLAnding : TNotifyEvent;
    FIndexEmbark: Integer;
    FEmbarkDefinition: TVehicle_Definition;
    FOnFormationRelease: TNotifyEvent;

    procedure SetEmbarkedVehicle(const Value: TRecHosted_Platform);
    procedure SetQuantity(const Value: integer);
    procedure SetEmbarkedIdentifier(const Value: string);
    //procedure SetReadyingTime(const Value: Double);
    procedure SetLaunchAlert(const Value: integer);
    procedure SetOnEmbarkedTimer(const Value: TOnEmbarkedReadyTimer);
    procedure OnQueueEmbarkedTimer(Sender : TObject; QueueNumber : integer; Counter : integer);
    procedure OnQueueLandEmbarkedTimer(Sender : TObject; QueueNumber : integer; Counter : integer);
    procedure OnEmbarkedReadyLaunch(Sender : TObject; QueueNumber : integer);
    procedure SetReadying(const Value: Double);
    procedure SetOnUpdateState(const Value: TNotifyEvent);
    procedure SetAvailabel(const Value: integer);
    procedure SetIsAfterLanding(const Value: Boolean);
    procedure SetOnAfterLAnding(const Value: TNotifyEvent);
    procedure setIndexEmbark(const Value: Integer);
    procedure SetEmbarkDefinition(const Value: TVehicle_Definition);
  protected
    FDelayer : TDelayer;
  public
    TempReadying : Double;

    constructor Create;
    destructor Destroy; override;

    //queue for launch embark
    function AddQueue(aSpeed, aHeading : double; aTrackID, aLaunchName : string; timeToLaunch : Double
              ; instanceIndexEmbar : Integer) : boolean;
    function getQueueCount : integer;
    function getQueueItem(Index : integer) : TQueuedEmbarkedLaunch;
    function removeQueueItem(Data : TObject) : boolean;

    //queue for land embark
    function AddQueueLand(aTrackID, aLaunchName : string; timeToLand : Double) : boolean;
    function getQueueLandCount : integer;
    function getQueueLandItem(Index : integer) : TQueuedEmbarkedLaunch;
    function removeQueueLandItem(Data : TObject) : boolean;

    procedure Run(aDt : double);
    procedure OnDelayer(Sender: TObject);

    property LaunchAlert      : integer read FLaunchAlert write SetLaunchAlert;
    property Quantity         : integer read FQuantity    write SetQuantity;
    property Availabel        : integer read FAvailabel write SetAvailabel;
    property IndexEmbark      : Integer read FIndexEmbark write setIndexEmbark;
    property Readying         : Double read FReadying    write SetReadying;

    //property ReadyingTime     : integer read FReadyingTime  write SetReadyingTime default 60; //second
    property EmbarkedVehicle  : TRecHosted_Platform read FEmbarkedVehicle
       write SetEmbarkedVehicle;
    property EmbarkedIdentifier : string read FEmbarkedIdentifier
       write SetEmbarkedIdentifier;
    property EmbarkDefinition : TVehicle_Definition read FEmbarkDefinition
       write SetEmbarkDefinition;
    property OnEmbarkedTimer : TOnEmbarkedReadyTimer read FOnEmbarkedTimer write SetOnEmbarkedTimer;
    property OnUpdateState   : TNotifyEvent read FOnUpdateState write SetOnUpdateState;
    property OnEmbarkedReadyTimer : TOnEmbarkedReadyTimer read FOnEmbarkedReadyTimer write FOnEmbarkedReadyTimer;
    property LaunchQueue     : TList read FLaunchQueue write FLaunchQueue;
    property LandQueue      : TList  read FLandQueue write FLandQueue;
    property IsAfterLanding : Boolean read FIsAfterLanding write SetIsAfterLanding;
    property OnAfterLAnding : TNotifyEvent read FOnAfterLAnding write SetOnAfterLAnding;

    // formation event
    property OnFormationRelease : TNotifyEvent read FOnFormationRelease write FOnFormationRelease;
  end;

//=============================================================================
  TEMCON_Category = class
    Name : TEMCON_Catgr;
    Mode : byte;
  end;

  TRamp = class
  private
    FRampaID    : Integer; {0: Depan; 1: Kanan; 2: Belakang; 3: Kiri}
    FAvailable  : Boolean;
    FState      : Boolean;
    FPos        : t2DPoint;

    constructor Create;
    destructor Destroy; override;

  public
    property RampaID : Integer  read FRampaID write FRampaID;
    property Available : Boolean read FAvailable write FAvailable;
    property State : Boolean read FState write FState;
    property Pos : t2DPoint read FPos write FPos;
  end;

  THose = class
  private
    FHoseID     : Integer; {0: Port; 1: Starboard;}
    FAvailable  : Boolean; {0: Idle; 1: Standby; 2: Process;}
    FState      : Integer;
    FDestinationID : Integer;

    constructor Create;
    destructor Destroy; override;

  public
    property HoseID : Integer  read FHoseID write FHoseID;
    property Available : Boolean read FAvailable write FAvailable;
    property State : Integer read FState write FState;
    property DestinationID : Integer read FDestinationID write FDestinationID;
  end;

  TT3Vehicle = class(TT3PlatformInstance)
  private
    FDevices          : TList;              // isinya TDevice
    FWeapons          : TList;              // isinya TWeapon
    FEmbarkedVehicles : TList;              // isinya TT3PlatformUnit

    FLastDevicesSelected : Byte;
    FLastWeaponsSelected : Byte;

    FWaypoints        : TWaypoint;
    FVHistory         : THistoryVisual;
    FVectorSymbol     : TVectorSymbol;
    FInfoBalloon      : TPlatformInfoBalloon;
    FTargetVisual     : TTargetVisual;

    FRangeLanding     : TRangeLandingPlatform;
    FLogisticsLineFromShip  : TLogisticsLine;
    FLogisticsLineFromBase : TLogisticsLine;

    FHisCounter       : TDelayer;
    FMover            : T2DMover;
    FVehicleDefition  : TVehicle_Definition;

    FSpeedState       : TMoveChangeState;
    FHeadingState     : TMoveChangeState;
    FAltitudeState    : TMoveChangeState;

    FOrderedSpeed     : double;
    FFirstHeading     : Double; // Tambahan Gue : Prince Achmad (27/ 03/ 2012)
    FOrderedHeading   : double;
    FOrderedAltitude  : double;
    FDeltaHead        : double;

    FWindDirection    : double;
    FWindSpeed        : double;
    FCounter          : Double;
//    FDelay            : Double;

    FOrderedHeadingAchieved : boolean;
    FOrderedSpeedAchieved   : boolean;
    FShowTrails             : boolean;
    FIsOnLand               : boolean;
    FIsGrounded             : boolean;
    FKananKiri              : Boolean;

    {arian}
    FMoveMode      : Byte;
    FFormationMode : Byte;

    FhelmDegree, FLastHeading : Double;
    FCircleDirection : double;
    FhelmAngleAchieved : boolean;
    FEvasionDegree : Double;
    FEvasionAngleAchieved : boolean;

    FCounterBlink : Integer;

    //Nando added for Zizgag Movement
    FisStartZigzag    : Boolean;
    FisFirstZigzag    : Boolean;
    FisLeftZigzag     : Boolean;
    FisRightZigzag    : Boolean;
    FAmplitudoZigzag  : Double;
    FPeriodZigzag     : Double;
    FOrderedZigzag    : Double;
    Ftemp_PosX        : Double;
    Ftemp_PosY        : Double;

    //aldy untuk auto landing
    FOnReadyLanding   : TNotifyEvent;

    //formation by bebe
    FFormationLeader  : TFormationRange;

    isAfterCircle, isTimeToCircle, isLandingFinish : Boolean;
    //FisCircleTime, FisFinishCircle : Boolean;

    FIsOwnShip : Boolean;

    //Beta Version Must Delete if Fixed
    FisHancur : Boolean;

    // variable utk last condition
    FLHead  : double;
    FLSpeed : double;
    FLAltitude : double;
    FUpdateCounter : Integer;

    //Nando added for Sinuation Movement
    FisLeftSinuation : Boolean;
    FAmplitudoSinuation : Double;
    FisRightSinuation : Boolean;
    FSinuationtemp_PosX : Double;
    FSinuationtemp_PosY : Double;
    FOrderedSinuation : Double;
    FisStartSinuation : Boolean;
    FPeriodSinuation : Double;
    FisFirstSinuation : Boolean;


    FontName : string;
    FontIndex : Integer;
    FontDesc : string;

    //Mamik Status EMCON Datalink
    FEMCON_HFDataLinkVehicle : TEMCON_HFDataLinkVehicle;//Boolean;
    FEMCON_UHFVHFDataLinkVehicle : TEMCON_UHFVHFDataLinkVehicle;//Boolean;
    FLastEMCON_HFDLink : TEMCON_HFDataLinkVehicle;//Boolean;
    FLastEMCON_UHFVHFDLink : TEMCON_UHFVHFDataLinkVehicle;

    FPlatformViewMode: Boolean;//Boolean;
    FTacticalDinamicSymbol : Boolean;
    FTacticalStaticSymbol : Boolean;
    FShipTacticalInfo : array [0..2] of String;
    FOnEventSendPlatformcmd: TEventSendPlatformcmd;
    FGameSpeed: Double;
	  FConnect3D: Boolean;
    FTransportedList: TList;
    FLaunchFromRPL: Boolean;

    FCounterUpdateWaypoint : Double;
    FDelayUpdateWaypoint : Double;
    FPersonelTransportedList: TList;
    FOnCekLandandDepth: TOnCekLandandDepth;
    FUpdateLandandDepthCounter : Double;

    Side : tOutSide{TRect};
    Ship : tPointOutSide;
    ShipPoint : TPntOutSide;
    FColourOutSide : Integer;
    FIsGrouped: Boolean;
    FAmphibiousOnLand : Boolean;
    FOnDeleteVehicle3D: TOnDeleteVehicle3D;

    //procedure SetDevices(const Value: TList);
    procedure SetEmbarkedVehicles(const Value: TList);
    procedure SetOrderedAltitude(const Value: double);
    procedure SetOrderedHeading(const Value: double);
    procedure SetEvasionHeading(const Value: double);
    procedure SetOrderedSpeed(const Value: double); virtual; //aldy tambah virtual untuk di override Non real
    procedure InitWaypoint;
    procedure SetWindDirection(const Value: double);
    procedure SetWindSpeed(const Value: double);

    procedure StraightLineMove(const aDeltaMs: double);
    procedure CircleMove(const aDeltaMs: double);
    procedure HelmMove(const aDeltaMs: double);
    procedure WaypointMove(const aDeltaMs: double);
    procedure EvasionMove(const aDeltaMs: double);
    procedure OutRunMove(const aDeltaMs: double);
    procedure EngagementMove(const aDeltaMs: double);
    procedure ShadowMove(const aDeltaMs: Double);
    procedure ReturnToBaseMove(const aDeltaMs: Double);
    procedure FormationMove(const aDeltaMs: Double);
    procedure StationMove(const aDeltaMs: Double);
    procedure PersonelMove(const aDeltaMs: Double);
    //added by nando
    procedure ZigzagMove(const aDeltaMs : double);
    procedure SinuationMove(const aDeltaMs : double);
    procedure OnWaypointReached(behaviour , events : TObject);

    procedure SetShowTrails(const Value: boolean);
    procedure HistoryOnAddpoint(sender: TObject);
    procedure setGrounded(const Value: boolean);
    procedure setOnLand(const Value: boolean);
    procedure SetFirstHeading(const Value: double);

    //mamik EMCON DATALINK
    procedure setEMCON_HFDataLinkVehicle(const Value: TEMCON_HFDataLinkVehicle);//Boolean);
    procedure setEMCON_UHFVHFDataLinkVehicle(const Value: TEMCON_UHFVHFDataLinkVehicle);
    procedure setLastEMCON_HFDLink(const Value: TEMCON_HFDataLinkVehicle);//Boolean);
    procedure setLastEMCON_UHFVHFDLink(const Value: TEMCON_UHFVHFDataLinkVehicle);

    procedure SetPlatformViewMode(const Value: Boolean);
    procedure SetTacticalDinamicSymbol(const Value: Boolean);
    procedure SetTacticalStaticSymbol(const Value: Boolean);
    function GetShipTacticalInfo(const Index: Integer): string;
    procedure SetShipTacticalInfo(const Index: Integer; const Value: string);
    procedure SetTransportedList(const Value: TList);
    procedure SetLaunchFromRPL(const Value: Boolean);
    procedure SetPersonelTransportedList(const Value: TList);
    procedure LogisticTransferFromShipProcess(const aDeltaMs: double);
    procedure LogisticTransferFromBaseProcess(const aDeltaMs: double);
    procedure TransportProcess(const aDeltaMs: double);
    procedure TransportMove();
    procedure CollisionProcess();
    procedure setConnect3D(const Value: Boolean);

    // Fian Embark Plarform
    function FindT3PlatformByID(const id: integer): TT3PlatformInstance;
    procedure SetMemberHeading();
    procedure SetMemberPosition();
    procedure SetMemberColision();
    function CheckDisembark(HostShip: TT3vehicle): Boolean;
    function CheckTurnTable(HostShip: TT3vehicle): Boolean;
    function CheckShapes(HostShip: TT3vehicle): Boolean;
    function DefinePolygon(x, y, Width, Length, Heading: Integer): TArray<Tpoint>;
    function RotatePoint(Point, Center: Tpoint; Cos, Sin: Double): Tpoint;
    function PointInPolygon(Point: Tpoint; const Polygons: TArray<TPoint>): Boolean;
    function PointInRectangle(Point: Tpoint; const Border: TRect): Boolean;

    procedure setOnCekLandandDepth(const Value: TOnCekLandandDepth);
    procedure setAmphibiousOnLand(const Value: Boolean);
    protected
    FOnUpdate : TNotifyEvent;
    FRangeRing: TRangeRingsVisual;

    // setelah terpengaruh envi
    FCourse   : Double;
    FVelocity : Double;

    procedure SetControlled(const Value: boolean); override;
    procedure SetUnitGroup(const Value: boolean);override;
    procedure SetEnable(const Value: boolean);override;
    procedure setIsGroupLeader(const Value: boolean); override;
    procedure SetTrack_ID(const Value: string);  override;
    function getInstanceClass: string;  override;

    function getAltitude: single;override;
    procedure SetAltitude(const Value: single); override;

    function getPos(const Index: Integer): double;  override;
    procedure setPos(const Index: Integer; const Value: double); override;

    function getHeading : Double; override;
    procedure setHeading(const value: Double); override;

    function getGroundSpeed : Double; override;
    procedure setGroundSpeed(const Value: Double); override;

    procedure LoadTrackSymbol; override;

    procedure SetTrackDomain(const Value: integer); override;
    procedure SetTrackIdent(const Value: integer); override;

    procedure updateHealthStatus(const i: integer; val: single); override;
    function getDamagePercent(const i: integer): integer;
    procedure setPercentSpeed(const index, val: Integer);

    procedure SetAllSensorDamage(const dmg: boolean);
    procedure SetAllWeaponDamage(const dmg: boolean);

    procedure SetSectorSensorDamage(const sect: byte; const pdmg: single);
    procedure SetECMDamage(const sect: byte; const pdmg: single);
    procedure SetSectorWeaponDamage(const sect: single; const pdmg: single);

    procedure SetDormantTime(const Value: word);override;
    procedure SetDormant(const Value: boolean);override;
    procedure SetFuelRemaining(const Value: double);override;
    procedure SetFreeMe(const Value: boolean);override;
    //function LaunchEmbarked

  protected
    FSimPlatforms     : TT3UnitContainer;

    function CallSignText(info : String) : String;

  public
    UpdateStatus : Boolean;

    FFormula : TFormula;
    isEngagementRangeReached : Boolean;
    isEngagementWeaponFire : Boolean;
    StaleTimeCounter : Double;
    WaypointLastSpeed : Double;
    VectacCommander : TT3PlatformInstance;
    launcherOn : array[0..7] of Boolean;
    // TimerBlink_Off : TDelayer;
    TimerBlink_Off : TTimer;
   	MissileLaunch : Tlist;
    MissileWaitToLaunch : Tlist;
    MissileDTOTLaunch   : TList;
    isReadyToCalculate : Boolean;
    OriginalMissileWaypoint : TList;
    //fCalculationEnvironment : CalculationEnvironment;
    ListEMCON : Tlist;

    //event engage
    OnGuidance_Engage : TOnGuidance_Engage;
    OnGuidanceStaleTimeReached : TOnStaleTimeReached;
    OnGuidanceStandoffReached : TOnStandoffReached;
    OnLaunchWeaponEngagement : TOnLaunchWeaponEngagement;

    {Station event}
    lastStationPointX, lastStationPointY : Double;
    lastCollPointX, lastCollPointY : Double;

    {field circle move by bebe}
    CenterCirclePointX : Double;
    CenterCirclePointY : Double;
    CircleRadius       : Double;
    CircleBearing      : Double;
    CircleRange        : Double;
    Circle_bearing_state  : byte;
    Circle_state       : byte;
    Circle_mode        : byte;
    CircleTrack        : TT3PlatformInstance;

    {field shadow move by aldy}
    ShadowedVehicle    : TT3PlatformInstance;
    ShadowDistance     : Double;

    {field return to base move by aldy}
    BaseVehicle        : TT3PlatformInstance;

    {field formation}
    LeaderPlatform     : TT3PlatformInstance;
    FormationLeader    : integer; // nyimpen inst index leader
    FormationState     : Byte;
    FormationRange     : Double;
    FormationAltitude  : Double;
    FormationBearing   : Double;
    isFormationLeader  : boolean;
    FormationName      : string[60];
    FormationModeActive : boolean;

    ShipPlatform   : TT3PlatformInstance;
    TargetPlatform : TT3PlatformInstance;
    MissileID      : Integer;
    IsHaveLaunch   : Byte;

    EvasionVehicle : TT3PlatformInstance;
    EngageVehicle  : TT3PlatformInstance;
    EngageDistance : Double;
    OutRunVehicle  : TT3PlatformInstance;

	  //Hambali Added For Dynamic Overlay
    ListDynamicOverlay : Tlist;

    ListLogisticPrediction : Tlist;

    //sonobuoy  andik
    Detect1Sonobuoy : Boolean;
    Detect2Sonobuoy : Boolean;
    Detect3Sonobuoy : Boolean;
    ObjSonobuoy : TT3PlatformInstance;
    AOPCounterSonobuoy2, AOPCounterSonobuoy3, TempADeltaMs : Double;
    FlagSono2, FlagSono3 : Boolean;

    FlagIFF : boolean;

    // station keep bebe
    StationMode     : Byte;
    StationTrack    : TT3PlatformInstance;
    StationBearing  : Double;
    StationBearing_state : Byte;
    StationRange    : Double;
    StationPostX    : Double;
    StationPostY    : Double;
    StationDrift    : Boolean;
    IsStationSpeedSet : Boolean;
    Vehicle_Control : TVehicle_Control;

    {$REGION ' Logistic Variabel '}

//    isTransferFromShip, isTransferToShip : Boolean;
    isTransferFromBase : Boolean;

    // Host Variable
    SupplierIDLog : Integer;
    HoseList : TList; {List Selang}

    // Member Variable
    DestinationIDLog : Integer;
    DestinationStateLog : Integer; {0: Idle; 1: Standby; 2: Process}
    HoseUseID : Integer; {0: Port; 1: Starboard}

    BaseLong, BaseLatt: Double;
    BaseRadius : Double;

    FuelTransferOrdered : Double;
    MLTransferOrdered : Double;
    ATTransferOrdered : Double;
    WaterTransferOrdered : Double;
    FoodTransferOrdered : Double;
    {$ENDREGION}

    {$REGION ' Transport Variabel '}
    DisEmbarkProsess : Boolean;
//    DisembarkParent : Integer;

    RampList : TList;

    FromEmbarkWith : Boolean;

    // Host Variable
    HostLoadState : Integer;
    MemberTransportList : TList;

    // Member Variable
    MemberLoadState : Integer;
    MemberPosX: Integer;
    MemberPosY: Integer;
    MemberHeading: Double;
    MemberOrderedHeading: Double;
    MemberSpeed: Integer;

    isInDisembarkArea: Boolean;
//    isInTurnTable: Boolean;
    isMemberCollision: Boolean;
    MemberPosDisembark: Integer;

    StateTransport : Boolean;
    HostIdTransport : Integer;

    CurrentHanggarWeight     : Double;
    CurrentHanggarCapacity   : Integer;

    CurrentOnBoardWeight     : Double;

    CurrentHullWeight     : Double;
    CurrentHullSpace      : Double;

    CurrentPersonelWeight : Double;
    CurrentPersonelCapacity : Integer;

    SumCurrentWeight  : Double;
    {$ENDREGION}

    //StationStopStatus : Boolean;
    //RNJammer
    //masukJamming  : Boolean;

    constructor Create;override;
    destructor Destroy;override;
    procedure Initialize;override;

    function GetSnapshotData : _SS_TT3Vehicle ;
    procedure SetSnapshotData(const ss : _SS_TT3Vehicle);

    //Nando added for Zizgag Movement
    procedure SetZigzagMovementShort;
    procedure SetZigzagMovementLong;
    procedure SetZigzagMovementVeryLong;
    procedure SetSinuationMovement;
    procedure SetSelected(const Value: boolean); override;

    procedure addDevice(uDevice : TT3DeviceUnit);
    procedure addWeapon(uWeapon : TT3Weapon);
    procedure addEmbarked(uVehicle : TT3EmbarkedVehicle);
    procedure FreeChilds; override;
    procedure FreeFromSnapshot;

    function getWeaponType(Name : string) : TWeapoonCategory;
    function getWeapon(Name : String) : TObject;      overload;
    function getWeapon(const id : integer) : TObject; overload;
    function getWeapon(const id : integer;Name : String) : TObject; overload;
    function getDevice(const id : integer; const className: TClass) : TObject;overload;
    function getDevice(const name : String; const className: TClass) : TObject; overload;
    function getWeapon(const id : integer; const className: TClass) : TObject; overload;
    function getWeapon(const name : String; const className: TClass) : TObject; overload;
    function getDeviceCount(DevClass : TClass) : integer;
    function getWeaponCount(WpnClass : TClass) : integer;
    function getMaxRangeRadar : double;
    function FindDevice(ClassT : TClass; IndexVal : integer) : TT3DeviceUnit;
    function getOrderedAltitude(): Double;
    function getFirstWeaponID(const className: TClass) : Integer;
    function getFirstDeviceID(const className: TClass) : Integer;

    {Prince}
    function CekSyaratTransfer(id : integer; supplierShip : TT3Vehicle; TrfPerSecond: Double): Boolean;
    function cekCollision: Boolean;
    function cekDisembarkProses: Boolean;
    // function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;

    procedure RepositionTo(const x, y: double); override;
    procedure Shooted(ShootBy: TSimObject; Lethality : single); override;
    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure setPositionX(const v: double); override;
    procedure setPositionY(const v: double); override;
    procedure setPositionZ(const v: double); override;
    procedure LandCheck(const onLand: boolean; const dMin, dMax: double); override;
    procedure DepthCheck(const Valid: boolean; const dMin, dMax: double);override;
    procedure LoadPlatformSymbol;
    procedure SetupChaff;
    procedure SetCircleDirection(value : Double);
    procedure DamageRepair(const dt : TDamageItemType);
    procedure OnTimerBlink_Off(sender : Tobject);

    {Prince}
    procedure SetObjects(platformObjects: TT3UnitContainer);
    procedure SetSpeedToFormation(Kuadran : Integer; var SpeedSet : Double);
    procedure SetSpeednEscapeAngle(Target : TT3Vehicle; var SpeedSet, HeadingSet : Double);
    procedure GetOutSet(Ship : TT3Vehicle; var Side : tOutSide{TRect};  var pt: tPointOutSide);
    procedure FindPoint(postCont: t2DPoint; var postValue : t2DPoint; vRange, vBearing: Double);

    procedure CekLandanDepth(x, y : Double);

    function InsideCollisionArea(aTarget, Area : tPointOutSide): Boolean;


    //choco
    property LastDevicesSelected : Byte read FLastDevicesSelected write FLastDevicesSelected;
    property LastWeaponsSelected : Byte read FLastWeaponsSelected write FLastWeaponsSelected;

    property RangeRing: TRangeRingsVisual read FRangeRing;
    property Heading : Double read getHeading write setHeading;                   // actual heading
    property GroundSpeed : Double read getGroundSpeed write setGroundSpeed;       // actual speed
    property WindDirection : double read FWindDirection write SetWindDirection;
    property WindSpeed     : double read FWindSpeed     write SetWindSpeed;

    property EmbarkedVehicles : TList read FEmbarkedVehicles write SetEmbarkedVehicles;
    property Devices  : TList read FDevices;
    property Weapons  : TList read FWeapons;
    property Waypoints: TWaypoint read FWaypoints;

    {Prince}
//    property TransportedList : TList read FTransportedList write SetTransportedList;
//    property PersonelTransportedList : TList read FPersonelTransportedList write SetPersonelTransportedList;

    property SpeedState       : TMoveChangeState read FSpeedState;
    property HeadingState     : TMoveChangeState read FHeadingState;
    property AltitudeState    : TMoveChangeState read FAltitudeState;

    // Tambahan Gue : Prince Achmad (27/ 03/ 2012)
    property FirstHeading   : double read FFirstHeading     write SetFirstHeading;
    property OrderedSpeed   : double read FOrderedSpeed     write SetOrderedSpeed;
    property OrderedHeading : double read FOrderedHeading   write SetOrderedHeading;
    property OrderedAltitude: double read getOrderedAltitude  write SetOrderedAltitude;
    property ShowTrails     : boolean read FShowTrails write SetShowTrails;
    property OnGrounded     : boolean read FIsGrounded write setGrounded;

    property  VehicleDefinition : TVehicle_Definition read FVehicleDefition;
    property  DamageSensor    : boolean read FDamageStatus.SensorDamage write FDamageStatus.SensorDamage;
    property  DamageWeapon    : boolean read FDamageStatus.WeaponDamage write FDamageStatus.WeaponDamage;
    property  DamageComm      : boolean read FDamageStatus.CommDamage write FDamageStatus.CommDamage;
    property  DamageHelm      : boolean read FDamageStatus.HelmDamage write FDamageStatus.HelmDamage;
    property  DamagePropulsion  : boolean read FDamageStatus.PropultionDamage write FDamageStatus.PropultionDamage;
    property  FuelLeakage     : boolean read FDamageStatus.FuelLeakage write FDamageStatus.FuelLeakage;
    //property  FuelRemaining   : single  read FDamageStatus.FuelRemaining;
    property  DamagePercentSpeed: integer index 1 read getDamagePercent write setPercentSpeed;
    property  DamageOverall     : integer index 2 read getDamagePercent;

    property Mover : T2DMover read FMover;
    property lastHeading : Double read FLastHeading write FLastHeading;
    property HelmDegree : Double read FhelmDegree write FhelmDegree;
    property CircleDirection : Double read FCircleDirection write SetCircleDirection;
    property EvasionDegree : Double read FEvasionDegree write SetEvasionHeading;
    property helmAngleAchieved : Boolean read FhelmAngleAchieved write FhelmAngleAchieved;
    property EvasionAngleAchieved : Boolean read FEvasionAngleAchieved write FEvasionAngleAchieved;
    property VHistory : THistoryVisual read FVHistory;
    property OnUpdateWeapon : TNotifyEvent read FOnUpdate write FOnUpdate;
    property OnReadyLanding : TNotifyEvent read FOnReadyLanding write FOnReadyLanding;

    //Nando added for Zizgag Movement
    property isStartZigzag    : Boolean read FisStartZigzag write FisStartZigzag;
    property isFirstZigzag    : Boolean read FisFirstZigzag write FisFirstZigzag;
    property isLeftZigzag     : Boolean read FisLeftZigzag write FisLeftZigzag;
    property isRightZigzag    : Boolean read FisRightZigzag write FisRightZigzag;
    property AmplitudoZigzag  : Double read FAmplitudoZigzag write FAmplitudoZigzag;
    property PeriodZigzag     : Double read FPeriodZigzag write FPeriodZigzag;
    property OrderedZigzag    : Double read FOrderedZigzag write FOrderedZigzag;
    property temp_PosX        : Double read Ftemp_PosX write Ftemp_PosX;
    property temp_PosY        : Double read Ftemp_PosY write Ftemp_PosY;

    //Nando added for Sinuation Movement
    property isStartSinuation    : Boolean read FisStartSinuation write FisStartSinuation;
    property isFirstSinuation    : Boolean read FisFirstSinuation write FisFirstSinuation;
    property isLeftSinuation     : Boolean read FisLeftSinuation write FisLeftSinuation;
    property isRightSinuation    : Boolean read FisRightSinuation write FisRightSinuation;
    property AmplitudoSinuation  : Double read FAmplitudoSinuation write FAmplitudoSinuation;
    property PeriodSinuation     : Double read FPeriodSinuation write FPeriodSinuation;
    property OrderedSinuation    : Double read FOrderedSinuation write FOrderedSinuation;
    property Sinuationtemp_PosX  : Double read FSinuationtemp_PosX write FSinuationtemp_PosX;
    property Sinuationtemp_PosY  : Double read FSinuationtemp_PosY write FSinuationtemp_PosY;
    property IsOwnShip : Boolean read FIsOwnShip write FIsOwnShip;
    property GameSpeed : Double read FGameSpeed write FGameSpeed;

    //ambil nilai speed dan direction relative envi
    property CourseEnvi : Double index 1 read getPos;
    property SpeedEnvi : Double index 2 read getPos;

    //mamik EMCON DATALINK VEHICLE
    property EMCON_HFDataLinkVehicle : TEMCON_HFDataLinkVehicle
      read FEMCON_HFDataLinkVehicle write SetEMCON_HFDataLinkVehicle;
    property EMCON_UHFVHFDataLinkVehicle : TEMCON_UHFVHFDataLinkVehicle
      read FEMCON_UHFVHFDataLinkVehicle write SetEMCON_UHFVHFDataLinkVehicle;
    property LastEMCON_HFDLink : TEMCON_HFDataLinkVehicle
      read FLastEMCON_HFDLink write SetLastEMCON_HFDLink;
    property LastEMCON_UHFVHFDLink : TEMCON_UHFVHFDataLinkVehicle
      read FLastEMCON_UHFVHFDLink write SetLastEMCON_UHFVHFDLink;

    {arian}
//    property IsStop: Boolean read FStopPersonel write FStopPersonel;
    property OnLand: boolean read FIsOnLand write setOnLand;
    property FormationMode : Byte read FFormationMode write FFormationMode;
    property MoveMode : Byte read FMoveMode write FMoveMode;

    property PlatformViewMode : Boolean read FPlatformViewMode write SetPlatformViewMode;
    property TacticalDinamicSymbol: Boolean read FTacticalDinamicSymbol write SetTacticalDinamicSymbol;
    property TacticalStaticSymbol: Boolean read FTacticalStaticSymbol write SetTacticalStaticSymbol;
    property ShipTacticalInfo1 : string index 0 read GetShipTacticalInfo write SetShipTacticalInfo;
    property ShipTacticalInfo2 : string index 1 read GetShipTacticalInfo write SetShipTacticalInfo;
    property ShipTacticalInfo3 : string index 2 read GetShipTacticalInfo write SetShipTacticalInfo;

    property OnEventSendPlatformcmd : TEventSendPlatformcmd read FOnEventSendPlatformcmd write FOnEventSendPlatformcmd;

    property Connect3D : Boolean read FConnect3D write setConnect3D;
    property CounterUpdateWaypoint : Double read FCounterUpdateWaypoint write FCounterUpdateWaypoint;
    property DelayUpdateWaypoint : Double read FDelayUpdateWaypoint write FDelayUpdateWaypoint;

    {Prince}
//    property isRampOpen : Boolean read FisRampOpen write FisRampOpen;

    property LaunchFromRPL : Boolean read FLaunchFromRPL write SetLaunchFromRPL;
    property InfoBalloon : TPlatformInfoBalloon read FInfoBalloon;

    //untuk setting vehicle yang sudah dicontrol tidak dapat dicontrol lagi dari console lainnya.
    //property Vehicle_Control : TVehicle_Control read FVehicle_Control write FVehicle_Control;

    property RangeLanding : TRangeLandingPlatform read FRangeLanding;
    property LogisticsLineFromShip : TLogisticsLine read FLogisticsLineFromShip;
    property LogisticsLineFromBase : TLogisticsLine read FLogisticsLineFromBase;

    property OnCekLandandDepth : TOnCekLandandDepth read FOnCekLandandDepth write setOnCekLandandDepth;
    property IsGrouped : Boolean read FIsGrouped write FIsGrouped;
    property AmphibiousOnLand : Boolean read FAmphibiousOnLand write setAmphibiousOnLand;
    property OnDeleteVehicle3D: TOnDeleteVehicle3D read FOnDeleteVehicle3D write FOnDeleteVehicle3D;
end;

  TT3NonRealVehicle = class(TT3Vehicle)
    private
      FNRPType : Integer;
      FSymbolType : Char;
      FLineVisual : TLineVisual;
      FRangeVisual: TRangeVisual;
      FRadius : single;
      stateGrown : boolean;
      FOutPointX : Double;
      FOutPointY : Double;
      grow: double;
      FOnChanged : TNotifyEvent;
      FLastUpdate : string;
      FOnLastUpdateTimePlatform : TOnLastUpdateTimePlatform;

      procedure setFNRPType(const value : Integer);
      procedure setFSymbolType(const value : Char);
      procedure setRadius(const value : Single);
      procedure SetOrderedSpeed(const Value: double); override;
      procedure SetLastUpdate (const value : string);
    protected
      procedure SetConverter(const Value: TCoordConverter);override;
    public
      Color : TColor;

      constructor Create; override;
      destructor Destroy; override;

      function GetSnapshotData : _SS_TT3NonRealVehicle ;
      procedure SetSnapshotData(const ss : _SS_TT3NonRealVehicle);

      procedure Initialize;override;
      procedure Move(const aDeltaMs: double); override;
      procedure LoadTrackSymbol; override;
      procedure Draw(aCnv: tCanvas); override;
      procedure ActivateLine(aCnv : TCanvas);
      procedure UpdateVisual; override;
      procedure RepositionTo(const x, y: double); override;

      property NRPType : Integer read FNRPType write setFNRPType;
      property SymbolType : Char read FSymbolType write setFSymbolType;
      property Radius : single read FRadius write setRadius;
      property LineVisual : TLineVisual read FLineVisual;
      property OnChange : TNotifyEvent read FOnChanged write FOnChanged;
      property LastUpdate : string Read FLastUpdate write SetLastUpdate;
      property OnLastUpdateTimePlatform : TOnLastUpdateTimePlatform
          read FOnLastUpdateTimePlatform write FOnLastUpdateTimePlatform;
  end;

  { tambahan angga untuk embarkasi dipakai di LandTemp & TransportEmbarkasi }
var
  rampIDSpawn: Integer;
//  UpdateCounter: Integer = 0;

implementation

uses uBaseCoordSystem, uT3Common,
     uLibSettingTTT,
     uDBAsset_Scripted, uT3Missile, uT3gun,
     uT3Radar, uT3Sonar, uT3CounterMeasure, uT3Sensor, uT3Visual, uT3Torpedo,
     uT3Listener, uDBAsset_Countermeasure, uDBBlind_Zone, uDBAsset_Weapon,
     uDBAsset_Fitted, uDBAsset_Sonar, uT3Sonobuoy, uT3OtherSensor, uFilter;

const
  C_Dmgs_Speed : array [0..4, 0..2] of single = (
   (04, 18, 26), (19, 34, 42), (35, 50 , 58),
   (54, 66, 74), (75, 82, 90)
   );
  C_Limit_Sensor : array [0..2] of single =
   ( 68, 52, 52 );
  C_Limit_weapon : array [0..2] of single =
   ( 52, 36, 36 );
  C_Limit_comm : array [0..2] of single =
   ( 36, 20, 20 );
  C_Limit_helm : array [0..2] of single =
   ( 20, 20, 20 );

  //cirlce
  cstateStraight = 1;
  cstateCircle = 2;

  cModePosition = 1;
  cModeTrack = 2;

  cBearingTrue = 1;
  cBearingRelative = 2;

  formNonAbsolute = 0;
  formAbsolute = 1;

function getDamageIndex(const pDmg: single): integer;
begin
   if pDmg <= 0 then
     result := 0
   else if pDmg <= 20 then
     result := 1
   else if pDmg <=36  then
     result := 2
   else if pDmg <=52  then
     result := 3
   else if pDmg <=68  then
     result := 4
   else if pDmg <=84  then
     result := 5
   else
     result := 6;
end;

function getGTIndex(const dCap: single): byte;
begin
  result := 0;

  if dCap <= 25.0 then // GT < 500
    result := 0
  else if dCap < 75.0 then
    result := 1
  else if dCAp >= 75.0 then
    result := 2;
end;

{ TT3Vehicle }

function getDeltaH(const  dst, src: double): double;
begin
  result := dst - src;
  if result < -180.0 then
    result := result + 360.0
  else if result > 180.0 then
    result := result - 360.0;
end;

procedure TT3Vehicle.addDevice(uDevice: TT3DeviceUnit);
begin
  FDevices.Add(uDevice);
end;

procedure TT3Vehicle.addEmbarked(uVehicle: TT3EmbarkedVehicle);
begin
  FEmbarkedVehicles.Add(uVehicle);
end;

procedure TT3Vehicle.addWeapon(uWeapon: TT3Weapon);
begin
  FWeapons.Add(uWeapon);
end;

constructor TT3Vehicle.Create;
var
  i, j : integer;
  EMCON_Category : TEMCON_Category;
  tempRamp : TRamp;
begin
  inherited ;

  FTacticalSymbol := TTacticalSymbol.Create;
  FOwnSymbol      := TTacticalSymbol.Create;
  FSignPlatform := TTextVisual.Create;
  FMover    := T2DMover.Create;
  FDevices  := TList.Create;
  FWeapons  := TList.Create;
  EmbarkedVehicles := Tlist.Create;

  {$REGION ' Trnasport Variabel '}
  RampList := TList.Create;
  MemberTransportList := TList.Create;
  HostLoadState := hlsReady;
  MemberLoadState := mlsNone;
  MemberHeading := 0;
  MemberSpeed := 0;
  isInDisembarkArea := False;
//  isInTurnTable := False;
  isMemberCollision := False;
  StateTransport := False;
  HostIdTransport := 0;
  {$ENDREGION}

  {$REGION ' Logistic Variabel '}
  HoseList := TList.Create;
  SupplierIDLog:= 0;
//  PortStateLagistic := lsIdle;
//  StartboardStateLogistic := lsIdle;

  DestinationIDLog := 0;
//  StarboardDestIdLogistic := 0;

  DestinationStateLog := lsIdle;
  {$ENDREGION}

  {ryu : platform view mode default}
  FPlatformViewMode := False;
  FTacticalDinamicSymbol := False;
  FTacticalStaticSymbol := True;

  FWaypoints:= TWaypoint.Create;
  FWaypoints.OnPointReached := OnWaypointReached;
 // fMover.fCalcEnvi := Environment.CalculateEnvi;

  FOrderedSpeedAchieved   := true;
  FOrderedHeadingAchieved := true;
  FShowTrails     := false;
  FOrderedHeading := 0;

  {Prince : cuma flag saja}
  TempRange := 100000;
//  FDelay := 5;
  FCounter := 0;

  IsHaveLaunch := 0;

  FhelmAngleAchieved := False;
  LastHeading    := 0;

  FEvasionAngleAchieved := False;

  FAltitudeState := mcsStable;
  FSpeedState    := mcsStable;
  FHeadingState  := mcsStable;

  FVHistory := THistoryVisual.Create;
  FVHistory.Color := clGray;
  FVHistory.Visible := FShowTrails;

  FHisCounter := TDelayer.Create;
  FHisCounter.DInterval := 4.0;
  FHisCounter.OnTime    := HistoryOnAddpoint;
  FHisCounter.Enabled := true;

  FDormant        := false;
  //FDormantTime    := 120; // second
  FDormantTime := 120;
  FDormantCounter := 120;

  StaleTimeCounter := 0;

 { TimerBlink_Off := TDelayer.Create;
  TimerBlink_Off.DInterval := 1.0;
  TimerBlink_Off.OnTime := OnTimerBlink_Off;}
  TimerBlink_Off := TTimer.Create(nil);
  TimerBlink_Off.Interval := 1000;
  TimerBlink_Off.Enabled := False;
  TimerBlink_Off.OnTimer := OnTimerBlink_Off;
  FCounterBlink := 0;

  MissileLaunch := TList.Create;
  MissileWaittoLaunch := Tlist.Create;
  MissileDTOTLaunch := TList.Create;
  isReadyToCalculate := False;
  OriginalMissileWaypoint := TList.Create;

  Circle_state  := cstateStraight;

  ListEMCON := TList.Create;

  for i := 0 to 11 do
  begin
    EMCON_Category := TEMCON_Category.Create;
    EMCON_Category.Name := TEMCON_Catgr(i);
    EMCON_Category.Mode := byte(UnChecked);                   //0 : check, 1 : uncheck;
    ListEMCON.Add(EMCON_Category);
  end;

  FFormationLeader  := TFormationRange.Create;

  //Beta Version
  FisHancur := false;

//  isTransferFromShip := False;
//  isTransferToShip := False;
  isTransferFromBase := False;

  isAfterCircle := false;
  isTimeToCircle := false;
  isLandingFinish := false;

  //FisFinishCircle := False;
  //FisCircleTime := False;
  lastStationPointX := 0;
  lastStationPointY := 0;

  ListDynamicOverlay := TList.Create;
  ListLogisticPrediction := TList.Create;

  // var last condition
  FLHead      := 0;
  FLSpeed     := 0;
  FLAltitude  := 0;

  FOrderedSinuation := 0;
  FPeriodSinuation  := 0;
  FAmplitudoSinuation := 0;

  IsStationSpeedSet := False;

  // ADD MAMIK - EMCON DATALINK
  FEMCON_HFDataLinkVehicle := EmconHFDatalinkOff;
  FEMCON_UHFVHFDataLinkVehicle := EmconUHFVHFDatalinkOff;
  FLastEMCON_HFDLink  := EmconHFDatalinkOff;
  FLastEMCON_UHFVHFDLink  := EmconUHFVHFDatalinkOff;

  // RNJammer
  //masukJamming      := False;
  FormationModeActive := False;

  {$REGION ' Transport Variabel '}
  RampList := TList.Create;
  {$ENDREGION}

  {personel}
  FMoveMode      := 3;
  FFormationMode := 1;

  ShipTacticalInfo1 := C_TacticalInfos[1];
  ShipTacticalInfo2 := C_TacticalInfos[0];
  ShipTacticalInfo3 := C_TacticalInfos[0];
  FConnect3D := False;
  FLaunchFromRPL := False;

  FCounterUpdateWaypoint := 0;
  FDelayUpdateWaypoint := 4;

  UpdateStatus := False;
  DisEmbarkProsess := False;
  FUpdateLandandDepthCounter := 2;

  FColourOutSide := RGB(RandomRange(0, 255), RandomRange(10, 255), RandomRange(20, 255));
  FAmphibiousOnLand := False;
end;

procedure TT3Vehicle.DepthCheck(const Valid: boolean; const dMin, dMax: double);
var dmn: integer;
    draft : double;
    depm : double;
begin
  inherited;

  draft := TVehicle_Definition(UnitDefinition).FData.Draft * C_Feet_To_Meter;
  dmn   := TVehicle_Definition(UnitDefinition).FData.Platform_Domain;

  case dmn of
    0 : begin // Result := 'Air';

    end;
    1: begin //Result := 'Surface';
      if Valid then
        OnGrounded := ((-1 * draft) < (-1*dMax));
    end;
    2: begin //Result := 'Subsurface';
      if Valid then begin
        depm := getAltitude;
        OnGrounded := (-1*(draft + depm ) < -1*dMax);
      end;
    end;
    3: begin //Result := 'Land';

    end;
    4: begin //Result := 'General';

    end;
    6: begin //Result := 'Amphibious';

    end;
  end;
end;

destructor TT3Vehicle.Destroy;
var
  i : Integer;
begin
  inherited;

  //clear dipindah ketika destroy, bukan saat freechilds.
  //untuk menghindari clear device pada object2 yang dormant.
  Weapons.Clear;
  Devices.Clear;
  EmbarkedVehicles.Clear;
//  TransportedList.Clear;
//  PersonelTransportedList.Clear;

  MemberTransportList.Clear;

  //FreeAndNil(FMover);           //

  //FHisCounter.Free;
  FreeAndNil(FVHistory);

 // FreeAndNil(TimerBlink_Off);
  //FreeAndNil(FTacticalSymbol);   //
  //tambahan aldy
  //FreeAndNil(FSignPlatform);      //
  //FreeAndNil(FDevices);            //
  //FreeAndNil(FWeapons);           //
  //FreeAndNil(FEmbarkedVehicles);   //
  //FreeAndNil(FWaypoints);          //
  //FreeAndNil(FVHistory);       //
  FreeAndNil(FHisCounter);
  FreeAndNil(TimerBlink_Off);
  FreeAndNil(MissileLaunch);
  FreeAndNil(MissileWaittoLaunch);

  //Destroy Dynamic Overlay
  for i := ListDynamicOverlay.Count -1 downto 0 do
  begin
    ListDynamicOverlay.Delete(i);
  end;
  ListDynamicOverlay.Free;
end;

procedure TT3Vehicle.Draw(aCnv: tCanvas);
var
  i: integer;
  xPos, yPos : integer;

  aBearing, aRange : double;
  CoorShipX, CoorShipY : Double;
  dx, dy : double;
  tCoorShipX, tCoorShipY : integer;
  pt : TPoint;
  r : integer;
  mx, my, lx, ly: integer;
  Rects : TRect;
  AOPRadius : double;
  //rnd : double;
  filterType : TPictureFilterType;
  hosePortTemp, hoseStarboardTemp : THose;
begin
  inherited;

  {$REGION ' Sonobuoy Section '}
  if not (UnitGroup) then
  begin
    if Detect1Sonobuoy then
    begin
      aBearing := CalcBearing(ObjSonobuoy.getPositionX, ObjSonobuoy.getPositionY,
                             FPosition.X, FPosition.Y);

      RangeBearingToCoord(50, aBearing, CoorShipX, CoorShipY);
      CoorShipX := ObjSonobuoy.getPositionX + CoorShipX;
      CoorShipY := ObjSonobuoy.getPositionY + CoorShipY;
      Converter.ConvertToScreen(ObjSonobuoy.getPositionX , ObjSonobuoy.getPositionY, mx, my);
      Converter.ConvertToScreen(CoorShipX, CoorShipY, lx, ly);
      aCnv.Pen.Color := clGreen;
      aCnv.Pen.Style := psDot;
      aCnv.MoveTo(mx,my);
      aCnv.LineTo(lx,ly);

      FlagSono2 := False;
      FlagSono3 := False;
    end;
    if Detect2Sonobuoy then
    begin

      aRange := CalcRange(ObjSonobuoy.getPositionX, ObjSonobuoy.getPositionY,
                          FPosition.X, FPosition.Y);
      AOPRadius := GameDefaults.FData.Init_AOP_Modifier * aRange;

      //rnd := (1- (2*(random(100)/100)));
      CoorShipX := FPosition.X;
      CoorShipY := FPosition.Y;

      dx := CoorShipX + (AOPRadius /60);
      dy := CoorShipY;

      Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
      tCoorShipX := tCoorShipX + round( (1- (2 * (random(100)/100))));
      tCoorShipY := tCoorShipY + round( (1- (2 * (random(100)/100))));
      Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);
      r := Abs(pt.X - tCoorShipX);

      Rects.Top     := tCoorShipY - r + round(AOPCounterSonobuoy2);
      Rects.Left    := tCoorShipX - r + round(AOPCounterSonobuoy2);
      Rects.Bottom  := tCoorShipY + r - round(AOPCounterSonobuoy2);
      Rects.Right   := tCoorShipX + r - round(AOPCounterSonobuoy2);

      aCnv.Pen.Style := psSolid;
      aCnv.Pen.Color := clGreen;

      if ((abs(Rects.Bottom) - abs(Rects.Top)) > 0.0001) then
      begin
        aCnv.Ellipse(Rects);
      end
      else
      begin
        aCnv.Ellipse(tCoorShipX,tCoorShipY,tCoorShipX,tCoorShipY);
      end;

      FlagSono2 := True;
      FlagSono3 := False;
    end;
    if Detect3Sonobuoy then
    begin
      CoorShipX := FPosition.X;
      CoorShipY := FPosition.Y;
      dx := CoorShipX + (GameDefaults.FData.Init_AOP_Modifier/60);
      dy := CoorShipY;

      Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
      Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);
      r := Abs(pt.X - tCoorShipX);

      Rects.Top     := tCoorShipY - r + Round(AOPCounterSonobuoy3);
      Rects.Left    := tCoorShipX - r + Round(AOPCounterSonobuoy3);
      Rects.Bottom  := tCoorShipY + r - Round(AOPCounterSonobuoy3);
      Rects.Right   := tCoorShipX + r - Round(AOPCounterSonobuoy3);


      aCnv.Pen.Style := psSolid;
      aCnv.Pen.Color := clGreen;

      if ((Rects.Bottom - Rects.Top) > 0.001) then
      begin
        aCnv.Ellipse(Rects);
      end
      else
      begin
        aCnv.Ellipse(tCoorShipX,tCoorShipY,tCoorShipX,tCoorShipY);
      end;

      FlagSono2 := False;
      FlagSono3 := True;
    end;

    Detect1Sonobuoy := false;
    Detect2Sonobuoy := false;
    Detect3Sonobuoy := false;
  end;
  {$ENDREGION}

  // hanya gambar plaform yang aktif, selain itu digambar oleh radar
  if not Enable then
    Exit;

  filterType := TPictureFilterType(PlatformDomain);

  if ((TrackIdent = piPending) and not vFilter.Show(filterType, 'Pending', 'Identity')) or
    ((TrackIdent = piUnknown) and not vFilter.Show(filterType, 'Unknown', 'Identity')) or
    ((TrackIdent = piAssumedFriend) and not vFilter.Show(filterType, 'Assumed friend', 'Identity')) or
    ((TrackIdent = piFriend) and not vFilter.Show(filterType, 'Friend', 'Identity')) or
    ((TrackIdent = piNeutral) and not vFilter.Show(filterType, 'Neutral', 'Identity')) or
    ((TrackIdent = piSuspect) and not vFilter.Show(filterType, 'Suspect', 'Identity')) or
    ((TrackIdent = piHostile) and not vFilter.Show(filterType, 'Hostile', 'Identity')) then
    Exit;

  if isInstructor or isWasdal then
  begin
    //FTacticalSymbol.CallSign1   := Track_ID;
    FTacticalSymbol.isInstructor := True;
    FTacticalSymbol.isVehicle := True;
  end
  else
  begin
    //FTacticalSymbol.CallSign1   := IntToStr(TrackNumber);
    FTacticalSymbol.isInstructor := False;
    FTacticalSymbol.isVehicle := False;
  end;

  FTacticalSymbol.SetTextColor(FTacticalSymbol.Color); //mk

  {aldy test}
  if FreeMe then
    Exit;

  {Jk vehicle sedang diembark tidak pake digambar}
  if StateTransport then
    Exit;

  if FDormant then
   FTacticalSymbol.SpeedVector.Visible := False
  else if FIsGrounded then
   FTacticalSymbol.SpeedVector.Visible := False // Tambahan 24/ 04/ 2012
  else
  begin
    if isInstructor or isWasdal then
    begin
      if FTacticalDinamicSymbol then
        FTacticalSymbol.SpeedVector.Visible := False
      else if FTacticalStaticSymbol then
        FTacticalSymbol.SpeedVector.Visible := True
    end
    else
      FTacticalSymbol.SpeedVector.Visible := True;
  end;

  FWaypoints.Draw(aCnv);

  FTacticalSymbol.Visible := False;

  { ryu : ship plaftform view}

  if PlatformDomain = vhdTarget then
  begin
    FTargetVisual.Draw(aCnv);
  end
  else
  begin
    if not FPlatformViewMode then
    begin
      if FTacticalDinamicSymbol then
      begin
        FTacticalSymbol.SymbolMode := 2;
        FTacticalSymbol.Draw(aCnv);
      end
      else if FTacticalStaticSymbol then
      begin
        FTacticalSymbol.SymbolMode := 2;
        FTacticalSymbol.Draw(aCnv);
      end;
    end
    else
    if FPlatformViewMode and (PlatformDomain in [vhdAir,vhdSurface,
      vhdLand,vhdSubsurface,vhdAmphibious]) then // if ship, airplane, tank
      FVectorSymbol.Draw(aCnv)
    else
    begin
      FTacticalSymbol.SymbolMode := 2;
      FTacticalSymbol.Draw(aCnv);
    end;
  end;

  FInfoBalloon.Color := FTacticalSymbol.Color;
  FInfoBalloon.Draw(aCnv);

  FVHistory.Draw(aCnv);

  FRangeLanding.Draw(aCnv);

  {Gambar transfer logistic}
  if isTransferFromBase then
  begin
    FLogisticsLineFromBase.Draw(aCnv);
  end;

  if DestinationStateLog = lsProcess then
  begin
    FLogisticsLineFromShip.Draw(aCnv);
  end;

  if HoseList.Count > 1 then
  begin
    hosePortTemp := HoseList[0];
    hoseStarboardTemp := HoseList[1];

    if (hosePortTemp.FState = lsProcess) or (hoseStarboardTemp.FState = lsProcess) then
    begin
      FLogisticsLineFromShip.Draw(aCnv);
    end;
  end;

  if Self is TT3NonRealVehicle then
  begin
    Track_ID := IntToStr(TrackNumber);
    FSignPlatform.Text := '-' + IntToStr(TrackNumber);
  end;
//  else
//    FSignPlatform.Text := '+';

  if Selected then
    FSignPlatform.Color := clYellow
  else
    FSignPlatform.Color := FTacticalSymbol.Color;

  if vFilter.Show(pftNone, 'Track mode', 'Track label') then
  begin
    xPos := FTacticalSymbol.Center.X;
    yPos := FTacticalSymbol.Center.Y;
    FSignPlatform.Center := Point(xPos - 7, yPos);
    if not FPlatformViewMode then
      FSignPlatform.Draw(aCnv);
  end;

//  if isFormationLeader then
  if isFormationLeader and FormationModeActive then
  begin
    FFormationLeader.BaseBearing  := Course;
    FFormationLeader.x  := Mover.X;
    FFormationLeader.y  := Mover.Y;
    FFormationLeader.Draw(aCnv);
  end;

//  if not FPlatformViewMode then
//    if IsOwnShip then
//      FOwnSymbol.Draw(aCnv);

//  aCnv.Pen.Color := FColourOutSide;
//  aCnv.Pen.Style := psSolid;
//  aCnv.MoveTo(ShipPoint.LT.X,ShipPoint.LT.Y);
//  aCnv.LineTo(ShipPoint.RT.X,ShipPoint.RT.Y);
//  aCnv.MoveTo(ShipPoint.RT.X,ShipPoint.RT.Y);
//  aCnv.LineTo(ShipPoint.RB.X,ShipPoint.RB.Y);
//  aCnv.MoveTo(ShipPoint.RB.X,ShipPoint.RB.Y);
//  aCnv.LineTo(ShipPoint.LB.X,ShipPoint.LB.Y);
//  aCnv.MoveTo(ShipPoint.LB.X,ShipPoint.LB.Y);
//  aCnv.LineTo(ShipPoint.LT.X,ShipPoint.LT.Y);
//
//  aCnv.Font.Color := FColourOutSide;
//  aCnv.Font.Size := 12;
//
//  aCnv.TextOut(ShipPoint.LT.X,ShipPoint.LT.Y, 'LT');
//  aCnv.TextOut(ShipPoint.RT.X,ShipPoint.RT.Y, 'RT');
//  aCnv.TextOut(ShipPoint.RB.X,ShipPoint.RB.Y, 'RB');
//  aCnv.TextOut(ShipPoint.LB.X,ShipPoint.LB.Y, 'LB');
end;

function TT3Vehicle.getAltitude: single;
begin
  Result := FMover.Z  * C_Degree_To_NauticalMile * C_NauticalMile_To_Metre;
end;

function TT3Vehicle.getDevice(const name: String;
  const className: TClass): TObject;
var i : integer;
    found  : boolean;
    wu : TT3DeviceUnit;
begin
  found := false;
  wu := nil;

  i := 0;
  while not found and (i < Devices.Count) do
  begin
    wu := TT3DeviceUnit(Devices.items[i]);
    found := (wu.InstanceName = name) and (wu is className);
    inc(i);
  end;

  if found then
    result := wu
  else
    result := nil;
end;


function TT3Vehicle.getDeviceCount(DevClass: TClass): integer;
var
  i : integer;
  dev : TObject;
begin
  result := 0;

  for I := 0 to Devices.Count - 1 do begin
    dev := Devices.Items[i];
    if dev.ClassType = DevClass then
      result := result + 1;
  end;
end;

function TT3Vehicle.getFirstDeviceID(const className: TClass) : Integer;
var
  i : Integer;
  dev : TT3DeviceUnit;
begin
  Result := 0;

  for i := 0 to Devices.Count - 1 do
  begin
    dev := Devices.Items[i];
    if dev.ClassType = className then
    begin
      result := dev.InstanceIndex;
      Break;
    end;
  end;
end;

function TT3Vehicle.getFirstWeaponID(const className: TClass): Integer;
var
  i : Integer;
  wpn : TT3Weapon;
begin
  Result := 0;

  for i := 0 to Weapons.Count - 1 do
  begin
    wpn := Weapons.Items[i];
    if wpn.ClassType = className then
    begin
      result := wpn.InstanceIndex;
      Break;
    end;
  end;
end;

function TT3Vehicle.getWeapon(const id: integer;
  const className: TClass): TObject;
var i : integer;
    found  : boolean;
    wu : TT3Weapon;
begin
  found := false;
  wu := nil;

  i := 0;
  if Assigned(Weapons) then
  begin
    while not found and (i < Weapons.Count) do
    begin
      wu := TT3Weapon(Weapons.items[i]);
      found := (wu.InstanceIndex = id) and (wu is className);
      inc(i);
    end;
  end;

  if found then
    result := wu
  else
    result := nil;
end;

function TT3Vehicle.getWeapon(const name: String;
  const className: TClass): TObject;
var i : integer;
    found  : boolean;
    wu : TT3Weapon;
begin
  found := false;
  wu := nil;

  i := 0;
  while not found and (i < Weapons.Count) do
  begin
    wu := TT3Weapon(Weapons.items[i]);
    found := (wu.InstanceName = name) and (wu is className);
    inc(i);
  end;

  if found then
    result := wu
  else
    result := nil;
end;

function TT3Vehicle.getWeapon(const id: integer; Name: String): TObject;
var i : integer;
    found: boolean;
    weapon : TT3Weapon;
begin
  found := false;
  weapon := nil;

  i := 0;
  while not found and (i < Weapons.Count) do
  begin
    weapon := TT3Weapon(Weapons.items[i]);
    found := (weapon.InstanceIndex = id) and (CompareStr(weapon.InstanceName,Name) = 0);
    inc(i);
  end;

  if found then
    result := weapon
  else
    result := nil;
end;

function TT3Vehicle.getWeaponCount(WpnClass: TClass): integer;
var
  i : integer;
  wpn : TObject;
begin
  result := 0;

  for I := 0 to Weapons.Count - 1 do begin
    wpn := Weapons.Items[i];
    if wpn.ClassType = WpnClass then
      result := result + 1;
  end;
end;

function TT3Vehicle.getMaxRangeRadar : double;
var
  I: Integer;
  dev : TT3Sensor;
  range : double;
begin
  if FDevices.Count = 0 then
  begin
    Result := 0;
    Exit;
  end;

  range := 0;
  for I := 0 to FDevices.Count - 1 do
  begin
    dev := FDevices.Items[I];
    if dev is TT3Radar then
    begin
      if (range < TT3Radar(dev).DetectionRange) and (TT3Radar(dev).OperationalStatus = sopOn) then
        range := TT3Radar(dev).DetectionRange;
    end;
  end;

  Result := range;
end;

function TT3Vehicle.getOrderedAltitude: Double;
begin
  Result := FOrderedAltitude * (C_NauticalMile_To_Metre * C_Degree_To_NauticalMile);
end;

procedure TT3Vehicle.GetOutSet(Ship : TT3Vehicle; var Side : tOutSide{TRect};  var pt: tPointOutSide);
var
  x1, y1, x2, y2,
  x3, y3, x4, y4 : Integer;

  Idx, Idy,
  RKiAts, RKaAts, RKiBwh, RKaBwh,
  BKiAts, BKaAts, BKiBwh, BKaBwh : Double;

  rect1 : TRect;
  Pos : t2DPoint;

begin
  //               /\
  //              /  \
  //           LT ---- RT
  //             |COL |
  //             |AREA|
  //             |    |
  //           LB ---- RB

  Idx := Ship.VehicleDefinition.FData.Width / C_NauticalMile_To_Feet;
  Idy := Ship.VehicleDefinition.FData.Length/ C_NauticalMile_To_Feet;

  Pos.X := Ship.PosX; Pos.Y:= Ship.PosY;

  //Point Kiri Atas
  pt.LT.X := Ship.PosX - (Idx/60/2);
  pt.LT.Y := Ship.PosY + (Idy/60/2);

  //Point Kanan Atas
  pt.RT.X := Ship.PosX + (Idx/60/2);
  pt.RT.Y := Ship.PosY + (Idy/60/2);

  //Point Kanan Bawah
  pt.RB.X := Ship.PosX + (Idx/60/2);
  pt.RB.Y := Ship.PosY - (Idy/60/2);

  //Point Kiri Bawah
  pt.LB.X := Ship.PosX - (Idx/60/2);
  pt.LB.Y := Ship.PosY - (Idy/60/2);

  BKiAts  := CalcBearing(PosX, Ship.PosY, pt.LT.X, pt.LT.Y);
  BKaAts  := CalcBearing(PosX, Ship.PosY, pt.RT.X, pt.RT.Y);
  BKaBwh  := CalcBearing(PosX, Ship.PosY, pt.RB.X, pt.RB.Y);
  BKiBwh  := CalcBearing(PosX, Ship.PosY, pt.LB.X, pt.LB.Y);

  RKiAts  := CalcRange(PosX, Ship.PosY, pt.LT.X, pt.LT.Y);
  RKaAts  := CalcRange(PosX, Ship.PosY, pt.RT.X, pt.RT.Y);
  RKaBwh  := CalcRange(PosX, Ship.PosY, pt.RB.X, pt.RB.Y);
  RKiBwh  := CalcRange(PosX, Ship.PosY, pt.LB.X, pt.LB.Y);

  {Relative}
  BKiAts  := ValidateDegree(Ship.Heading + BKiAts);
  BKaAts  := ValidateDegree(Ship.Heading + BKaAts);
  BKaBwh  := ValidateDegree(Ship.Heading + BKaBwh);
  BKiBwh  := ValidateDegree(Ship.Heading + BKiBwh);

  FindPoint(Pos, pt.LT, RKiAts, BKiAts);
  FindPoint(Pos, pt.RT, RKaAts, BKaAts);
  FindPoint(Pos, pt.RB, RKaBwh, BKaBwh);
  FindPoint(Pos, pt.LB, RKiBwh, BKiBwh);

  {}
  Side.osL := pt.LT.X;
  Side.osR := pt.RT.X;
  Side.osT := pt.LT.Y;
  Side.osB := pt.RB.Y;
end;

function TT3Vehicle.getWeaponType(Name: string): TWeapoonCategory;
var
  i : integer;
  weapon : TT3Weapon;
begin
  result := wcMissileAirToSurfaceSubsurface;

  for i := 0 to Weapons.Count - 1 do
  begin
    weapon := TT3Weapon(Weapons.items[i]);
    if weapon.InstanceName = Name then
    begin
      result := weapon.WeaponCategory;

//      if (Result = wcTorpedoStraigth) or
//         (Result = wcTorpedoActiveAcoustic) or
//         (Result = wcTorpedoPassiveAcoustic) or
//         (Result = wcTorpedoWireGuided) or
//         (Result = wcTorpedoWakeHoming) or
//         (Result = wcTorpedoActivePassive) or
//         (Result = wcTorpedoAirDropped) then
//
//         Result := wcTorpedoStraigth;


//      break;
    end;
  end;
end;

function TT3Vehicle.getWeapon(Name: String): TObject;
var
  i : integer;
  weapon : TT3Weapon;
  found: boolean;
begin
  found := false;
  weapon := nil;

  i := 0;
  while not found and (i < Weapons.Count) do
  begin
    weapon := TT3Weapon(Weapons.items[i]);
    found := weapon.InstanceName = Name;
    inc(i);
  end;

  if found then
    result := weapon
  else
    result := nil;

//  weapon := nil;
//  for i := 0 to Weapons.Count - 1 do begin
//    weapon := TT3Weapon(Weapons.items[i]);
//    if weapon.InstanceName = Name then
//      break;

//  end;

//  result := weapon;
end;

function TT3Vehicle.getWeapon(const id : integer) : TObject;
var i : integer;
    found: boolean;
    weapon : TT3Weapon;
begin
  found := false;
  weapon := nil;

  i := 0;
  while not found and (i < Weapons.Count) do
  begin
    weapon := TT3Weapon(Weapons.items[i]);
    found := weapon.InstanceIndex = id;
    inc(i);
  end;

  if found then
    result := weapon
  else
    result := nil;
end;


function TT3Vehicle.getDevice(const id : integer; const className: TClass) : TObject;
var i : integer;
    found  : boolean;
    du : TT3DeviceUnit;
begin
  found := false;
  du := nil;

  i := 0;
  while not found and (i < Devices.Count) do
  begin
    du := TT3DeviceUnit(Devices.items[i]);
    found := (du.InstanceIndex = id) and (du is className);
    inc(i);
  end;

  if found then
    result := du
  else
    result := nil;
end;

procedure TT3Vehicle.HistoryOnAddpoint;
begin
  if Speed > 0 then
    FVHistory.AddPoint(getPositionX, getPositionY);
end;

procedure TT3Vehicle.Initialize;
var
  i : Integer;
  tempRamp : TRamp;
  tempHose : THose;

begin
  inherited;

  if Assigned(UnitDefinition) then
  begin
    PlatformType  := TVehicle_Definition(UnitDefinition).FData.Platform_Type;
    PlatformDomain := TVehicle_Definition(UnitDefinition).FData.Platform_Domain;
    PlatformCategory:= TVehicle_Definition(UnitDefinition).FData.Platform_Category;
    FVehicleDefition  := TVehicle_Definition(UnitDefinition);
    FDamageStatus.DamageCapacity := TVehicle_Definition(UnitDefinition).FData.Damage_Capacity;
  end;

  OrderedAltitude := UnitActivation.Init_Altitude;
  Altitude      := UnitActivation.Init_Altitude;

  {$REGION ' Motion and Position Activation Initialize '}
  FMover.X      := UnitActivation.Init_Position_Longitude;
  FMover.Y      := UnitActivation.Init_Position_Latitude;
  FMover.Direction    := ConvCompass_To_Cartesian(UnitActivation.Init_Course);

  if Assigned(UnitMotion) then
  begin
    FMover.TurnRate := UnitMotion.FData.Standard_Turn_Rate;

    case UnitActivation.Init_Ground_Speed of
      0 : FMover.Speed := UnitMotion.FData.Min_Ground_Speed;
      1 : FMover.Speed := UnitMotion.FData.Cruise_Ground_Speed;
      2 : FMover.Speed := UnitMotion.FData.High_Ground_Speed;
      3 : FMover.Speed := UnitMotion.FData.Max_Ground_Speed;
      else
          FMover.Speed  := UnitMotion.FData.Min_Ground_Speed;
    end;

    FMover.MinSpeed     := UnitMotion.FData.Min_Ground_Speed;
    FMover.CruiseSpeed  := UnitMotion.FData.Cruise_Ground_Speed;
    FMover.MaxSpeed     := UnitMotion.FData.Max_Ground_Speed;
    FMover.MaxAltitude  := UnitMotion.FData.Max_Altitude;
    FMover.MaxDepth     := UnitMotion.FData.Max_Depth;
  end;

  FMover.Enabled := true;

  FPosition.X := FMover.X;
  FPosition.Y := FMover.Y;
  FPosition.Z := Altitude;

  FFormationLeader.x := FPosition.X;
  FFormationLeader.y := FPosition.Y;
  {$ENDREGION}

  {$REGION ' Logistic Activation Initialize '}
  if UnitMotion.FData.Endurance_Type = etFuel  then
    FuelRemaining := UnitActivation.Init_Fuel
  else
  begin
    FuelRemaining := FuelCapacity;
  end;

  if Assigned(UnitLogistic) then
  begin
    if (UnitActivation.Init_Lubricants > UnitLogistic.FData.Max_Lubricants_Capacity) then
      MLRemaining := UnitLogistic.FData.Max_Lubricants_Capacity
    else
      MLRemaining := UnitActivation.Init_Lubricants;

    if (UnitActivation.Init_Freshwater > UnitLogistic.FData.Max_Freshwater_Capacity) then
      ATRemaining := UnitLogistic.FData.Max_Freshwater_Capacity
    else
      ATRemaining := UnitActivation.Init_Freshwater;

    if (UnitActivation.Init_Water > UnitLogistic.FData.Max_Water_Capacity) then
      WaterRemaining := UnitLogistic.FData.Max_Water_Capacity
    else
      WaterRemaining := UnitActivation.Init_Water;

    if (UnitActivation.Init_Ration > UnitLogistic.FData.Max_Ration_Capacity) then
      FoodRemaining := UnitLogistic.FData.Max_Ration_Capacity
    else
      FoodRemaining := UnitActivation.Init_Ration;

    {$REGION ' Hose Initialize '}
    for i := 0 to 1 do
    begin
      tempHose := THose.create;
      tempHose.HoseID := i;
      tempHose.Available := UnitLogistic.FData.Tranferable_Logistic;
      tempHose.State := lsIdle;
      tempHose.DestinationID := 0;

      HoseList.Add(tempHose);
    end;
    {$ENDREGION}

  end;
  {$ENDREGION}

  Health :=  FDamageStatus.DamageCapacity - UnitActivation.Damage;

  {$REGION ' Guidance Activation Initialize '}
  case UnitActivation.Init_Guidance_Type of
    0:  // straight/heading
      begin
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtStraightLine;
        OrderedHeading  := UnitActivation.Init_Course;

        case UnitActivation.Init_Ground_Speed of
          0 : OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
          1 : OrderedSpeed := UnitMotion.FData.Cruise_Ground_Speed;
          2 : OrderedSpeed := UnitMotion.FData.High_Ground_Speed;
          3 : OrderedSpeed := UnitMotion.FData.Max_Ground_Speed;
          else
          OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
        end;
      end;
    1: // waypoint
      begin
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtWaypoint;
        if PlatformDomain = vhdAir then
          Waypoints.Termination := wtRP;
      end;
    2:  // pattern on self
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtWaypoint;
    3:  // pattern on target
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtWaypoint;
    4:  // pattern on point
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtWaypoint;
    5:  // helm guidance
      begin
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtHelm;
        OrderedHeading  := UnitActivation.Init_Helm_Angle;
        case UnitActivation.Init_Ground_Speed of
          0 : OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
          1 : OrderedSpeed := UnitMotion.FData.Cruise_Ground_Speed;
          2 : OrderedSpeed := UnitMotion.FData.High_Ground_Speed;
          3 : OrderedSpeed := UnitMotion.FData.Max_Ground_Speed;
          else
          OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
        end;
      end;
    6:  // return to base
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtReturnToBase;
    //7:  // station keep on track
    //8:  // station keep on position
    9:  // circle on track
      begin
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtCircle;
        Circle_mode := cModeTrack;
        Circle_state := cstateStraight;
        if Assigned(GuidanceTargetInst) then
        begin
          ShadowedVehicle := GuidanceTargetInst;
        end;
        CircleRadius := UnitActivation.Radius_of_Travel;
        case UnitActivation.Direction_of_Travel of
          0:  CircleDirection := 90;
          1:  CircleDirection := -90;
        end;

        ShadowDistance  := UnitActivation.Dynamic_Circle_Range_Offset;
        CircleBearing := UnitActivation.Dynamic_Circle_Angle_Offset;
        case UnitActivation.Dynamic_Circle_Offset_Mode of
          0: Circle_bearing_state := cBearingTrue;
          1: Circle_bearing_state := cBearingRelative;
        end;

        case UnitActivation.Init_Ground_Speed of
          0 : OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
          1 : OrderedSpeed := UnitMotion.FData.Cruise_Ground_Speed;
          2 : OrderedSpeed := UnitMotion.FData.High_Ground_Speed;
          3 : OrderedSpeed := UnitMotion.FData.Max_Ground_Speed;
          else
          OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
        end;
      end;
    10:  // circle on point
      begin
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtCircle;
        Circle_mode := cModePosition;
        Circle_state := cstateStraight;
        CenterCirclePointX  := UnitActivation.Circle_Longitude;
        CenterCirclePointY  := UnitActivation.Circle_Latitude;
        CircleRadius := UnitActivation.Radius_of_Travel;
        case UnitActivation.Direction_of_Travel of
          0:  CircleDirection := 90;
          1:  CircleDirection := -90;
        end;

        case UnitActivation.Init_Ground_Speed of
          0 : OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
          1 : OrderedSpeed := UnitMotion.FData.Cruise_Ground_Speed;
          2 : OrderedSpeed := UnitMotion.FData.High_Ground_Speed;
          3 : OrderedSpeed := UnitMotion.FData.Max_Ground_Speed;
          else
          OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
        end;
      end;
    11: // zig-zag
      begin
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtZigzag;
        case UnitActivation.Zig_Zag_Leg_Type of
          1: SetZigzagMovementShort;
          2: SetZigzagMovementLong;
          3: SetZigzagMovementVeryLong;
        end;
        OrderedZigzag := UnitActivation.Init_Course;
        case UnitActivation.Init_Ground_Speed of
          0 : OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
          1 : OrderedSpeed := UnitMotion.FData.Cruise_Ground_Speed;
          2 : OrderedSpeed := UnitMotion.FData.High_Ground_Speed;
          3 : OrderedSpeed := UnitMotion.FData.Max_Ground_Speed;
          else
          OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
        end;

        if UnitActivation.Period_Distance <> 0 then
          FPeriodZigzag := UnitActivation.Period_Distance;
        if UnitActivation.Amplitude_Distance <> 0 then
          FAmplitudoZigzag := UnitActivation.Amplitude_Distance;
      end;
    12: // sinuate
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtSinuation;
    13: // shadow
      begin
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtShadow;
        if Assigned(GuidanceTargetInst) then
        begin
          ShadowedVehicle := GuidanceTargetInst;
        end;
        ShadowDistance := UnitActivation.Target_Range;
      end;
    14: // engagement
      begin
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtEngagement;
        if Assigned(GuidanceTargetInst) then
        begin
          //ShadowedVehicle := GuidanceTargetInst;
        end;
      end;
    15: // evasion
      begin
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtEvasion;
        if Assigned(GuidanceTargetInst) then
        begin
          //ShadowedVehicle := GuidanceTargetInst;
        end;
      end;
    16: // outrun
      begin
        TVehicle_Definition(UnitDefinition).GuidanceType := vgtOutrun;
        if Assigned(GuidanceTargetInst) then
        begin
          //ShadowedVehicle := GuidanceTargetInst;
        end;
      end;
  end;

  if TVehicle_Definition(UnitDefinition).FData.Platform_Domain = vhdGrpPersonel then
  begin
    TVehicle_Definition(UnitDefinition).GuidanceType := vgtPersonelGuidance;
    OrderedHeading := UnitActivation.Init_Course;
    case UnitActivation.Init_Ground_Speed of
      0 : OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
      1 : OrderedSpeed := UnitMotion.FData.Cruise_Ground_Speed;
      2 : OrderedSpeed := UnitMotion.FData.High_Ground_Speed;
      3 : OrderedSpeed := UnitMotion.FData.Max_Ground_Speed;
      else
      OrderedSpeed := UnitMotion.FData.Min_Ground_Speed;
    end;
  end;

  {$ENDREGION}

  {$REGION ' Rampa Initialize '}
  for i := 0 to 3 do
  begin
    tempRamp := TRamp.create;
    tempRamp.RampaID := i;

    case i of
      0 : tempRamp.Available := VehicleDefinition.FData.FrontGangway;
      1 : tempRamp.Available := VehicleDefinition.FData.StarBoardGangway;
      2 : tempRamp.Available := VehicleDefinition.FData.RearGangway;
      3 : tempRamp.Available := VehicleDefinition.FData.PortGangway;
    end;

    tempRamp.State := False;
    RampList.Add(tempRamp);
  end;
  {$ENDREGION}

  FWaypoints.Owner := Self;
  InitWaypoint;

  {$REGION ' Platform Tactical Visual Initialize '}

  getFontTaktis(FData.Vehicle_Index, FontName, FontIndex, FontDesc);

  LoadPlatformSymbol;
  {$ENDREGION}

  {$REGION ' Platform Shilloute Visual Initialize '}
  if Assigned(FVectorSymbol) then
    FVectorSymbol.Free;

  case PlatformDomain of
    vhdAir :
    begin
      case PlatformType of
        aptFixwing : FVectorSymbol := TAirPlaneVectorSymbol.Create;
        aptRotary  : FVectorSymbol := THelicopterVectorSymbol.Create;
      else
        FVectorSymbol := TAirPlaneVectorSymbol.Create;
      end;
    end;
    vhdSurface     : FVectorSymbol := TShipVectorSymbol.Create;
    vhdSubsurface  : FVectorSymbol := TShipVectorSymbol.Create;
    vhdLand        : FVectorSymbol := TTankVectorSymbol.Create;
    vhdAmphibious  : FVectorSymbol := TTankVectorSymbol.Create;
  else
    FVectorSymbol := TVectorSymbol.Create;
  end;

  if Assigned(FVectorSymbol) then
    FVectorSymbol.Color := FTacticalSymbol.Color;

  {$ENDREGION}

  FlagSono2 := False;
  FlagSono3 := False;
  AOPCounterSonobuoy2 := 0;
  AOPCounterSonobuoy3 := 0;
  TempADeltaMs := 0;
  FlagIFF := false;
  FGameSpeed := 1;
  FUpdateCounter := 0;

  FInfoBalloon := TPlatformInfoBalloon.Create;
  FInfoBalloon.Color := FTacticalSymbol.Color;

  FTargetVisual := TTargetVisual.create;

  FRangeLanding := TRangeLandingPlatform.Create;
  FRangeLanding.Color := FTacticalSymbol.Color;

  FLogisticsLineFromShip := TLogisticsLine.Create;
  FLogisticsLineFromShip.Color := FTacticalSymbol.Color;
  FLogisticsLineFromBase := TLogisticsLine.Create;
  FLogisticsLineFromBase.Color := FTacticalSymbol.Color;

  Vehicle_Control.Controlled := False;
  Vehicle_Control.Control_Name := '';

  FLastSavingPositionX := FPosition.X;
  FLastSavingPositionY := FPosition.Y;

  IsGrouped := False;
end;

procedure TT3Vehicle.InitWaypoint;
begin
  // event n behav radar
  with TVehicle_Definition(UnitDefinition) do
  begin
   { for i:= 0 to Radars.Count - 1 do
      for j := 0 to TRadar_On_Board(Radars[i]).FScripted_Radar.Count - 1 do
        with TScripted_Radar(TRadar_On_Board(Radars[i]).FScripted_Radar) do begin
          wpEvent := TWaypointEventClass.Create;
          wpEvent.FType := wetRadar;
          wpEvent.FData := event;
          wpEvent.FEnable := false;
          Waypoints.Add(behav,wpEvent);
        end;

    // event n behav sonar
    for i:= 0 to Sonars.Count - 1 do
      for j := 0 to TSonar_On_Board(Sonars[i]).FScripted_sonar.Count - 1 do
        with TScripted_Sonar(TSonar_On_Board(Sonars[i]).FScripted_sonar) do begin
          wpEvent := TWaypointEventClass.Create;
          wpEvent.FType := wetSonar;
          wpEvent.FData := event;
          wpEvent.FEnable := false;
          Waypoints.Add(behav,wpEvent);
        end;

    // event n behav chaff
    {for i:= 0 to Chaffs.Count - 1 do
      for j := 0 to TChaff_On_Board(Chaffs[i]).FScripted_Chaffs.Count - 1 do
        with TScripted_Chaff(TChaff_On_Board(Chaffs[i]).FScripted_Chaffs)do
          Waypoints.Add(behav,event);

    // event n behav infrared
    for i:= 0 to Infrared_Decoys.Count - 1 do
      for j := 0 to TInfrared_Decoy_On_Board(Infrared_Decoys[i]).FScripted_Infra.Count - 1 do
        with TScripted_Infrared(TInfrared_Decoy_On_Board(Infrared_Decoys[i]).FScripted_Infra)do
          Waypoints.Add(behav,event); }
  end;
end;

function TT3Vehicle.InsideCollisionArea(aTarget, Area : tPointOutSide): Boolean;
var
  LTx, LTy,
  RTx, RTy,
  RBx, RBy,
  LBx, LBy,
  x1, y1,
  x2, y2,
  x3, y3,
  x4, y4 : Integer;
  r1,r2,r3,r4 : Boolean;
begin
  //               /\
  //              /  \
  //           LT ---- RT
  //             |COL |
  //             |AREA|
  //             |    |
  //           LB ---- RB

  Result := False;

  Converter.ConvertToScreen(aTarget.LT.X, aTarget.LT.Y, LTx, LTy);
  Converter.ConvertToScreen(aTarget.RT.X, aTarget.RT.Y, RTx, RTy);
  Converter.ConvertToScreen(aTarget.RB.X, aTarget.RB.Y, RBx, RBy);
  Converter.ConvertToScreen(aTarget.LB.X, aTarget.LB.Y, LBx, LBy);

  Converter.ConvertToScreen(Area.LT.X, Area.LT.Y, x1, y1);
  Converter.ConvertToScreen(Area.RT.X, Area.RT.Y, x2, y2);
  Converter.ConvertToScreen(Area.RB.X, Area.RB.Y, x3, y3);
  Converter.ConvertToScreen(Area.LB.X, Area.LB.Y, x4, y4);

  r1 := IsPointInPolygon(LTx, LTy, x1, y1, x2, y2, x3, y3, x4, y4);
  r2 := IsPointInPolygon(RTx, RTy, x1, y1, x2, y2, x3, y3, x4, y4);
  r3 := IsPointInPolygon(RBx, RBy, x1, y1, x2, y2, x3, y3, x4, y4);
  r4 := IsPointInPolygon(LBx, LBy, x1, y1, x2, y2, x3, y3, x4, y4);

  Result := r1 or r2 or r3 or r4;

end;

procedure TT3Vehicle.LandCheck(const onLand: boolean; const dMin, dMax: double);
var
  dmn: integer;
  depm : double;
begin
  inherited;

  dmn := TVehicle_Definition(UnitDefinition).FData.Platform_Domain;
  case dmn of
    vhdAir :
    begin // Result := 'Air';
      //don't care
       if onLand then begin
        depm := getAltitude; //C_NauticalMile_To_Metre * getAltitude ;//getPositionZ;
        if depm < dMax then
        begin
          FIsOnLand := True;
          Self.reasonDestroy := 4;
//          FreeChilds;
          FreeMe := true;
        end;
      end;
    end;
    vhdSurface:
    begin //Result := 'Surface';
         FIsOnLand := onLand;
         if FIsOnLand then
         begin
           Speed := 0;
           GroundSpeed := 0;
         end;
    end;
    vhdSubsurface:
    begin //Result := 'Subsurface';
         FIsOnLand := onLand;
         if FIsOnLand then
         begin
           Speed := 0;
           GroundSpeed := 0;
         end;
    end;
    vhdLand:
    begin //Result := 'Land';
      FIsOnLand := onLand;
    end;
    vhdAmphibious:
    begin //Result := 'Amphibious';
      FIsOnLand := onLand;
      AmphibiousOnLand := onLand;
    end;
    vhdGrpPersonel:
    begin //Result := 'Personel'
      FIsOnLand := onLand;
//      if FIsOnLand then
//        Speed := 0;
    end;

  end;
end;

procedure TT3Vehicle.Move(const aDeltaMs: double);
var
  i : integer;
  vehicle : TVehicle_Definition;
  Max_Ground_Speed : double;

  dx, dy : Double;
  delta : double;

  pf : TSimObject;
  embark : TT3EmbarkedVehicle;
  HeadingNow, OrderHeadingNow : Double;
  MemberPlatform : TT3Vehicle;
  tes: Double;
{$IFDEF SERVER}
const
  MIN_RANGE_DEPTH_CHECK = 2; // meter
var
  range : double;
{$ENDIF}
begin
  inherited;

  {$REGION ' Sonobuoy Calculation '}
  TempADeltaMs := aDeltaMs;

  if FlagSono2 then
  begin
    if (round(aDeltaMs) mod 1000) = 0 then
       AOPCounterSonobuoy2 := AOPCounterSonobuoy2 + (GameDefaults.FData.AOP_Decrease_Rate / 60);
  end
  else if FlagSono3 then
  begin
    if (round(aDeltaMs) mod 1000) = 0 then
       AOPCounterSonobuoy3 := AOPCounterSonobuoy3 + (GameDefaults.FData.AOP_Decrease_Rate / 60);
  end
  else
  begin
    AOPCounterSonobuoy2 := GameDefaults.FData.AOP_Decrease_Rate / 60;
    AOPCounterSonobuoy3 := GameDefaults.FData.AOP_Decrease_Rate / 60;
  end;

  {$ENDREGION}

  vehicle := TVehicle_Definition(UnitDefinition);

  if Vehicle = nil then
    exit;

  {$REGION ' Transport Process '}
  TransportProcess(aDeltaMs);

  {Process saat vehicle sebagai transported}
  if StateTransport then
  begin

    case PlatformDomain of

      {$REGION ' Jika yang diangkut air platform '}
      vhdAir, vhdSurface, vhdSubsurface: Exit;
      {$ENDREGION}

      {$REGION ' Jika yang diangkut Land platform '}
      vhdLand:
      begin
        if (PlatformCategory =  2) and (PlatformType =  0) then
        begin
          Exit;
        end
      end;
      {$ENDREGION}

    end;

    {update pergerakan kapal didalam Hull}
    if FUpdateCounter > 4 then
    begin
      SetMemberHeading;
      SetMemberColision;
      SetMemberPosition;
      FUpdateCounter := 0;
    end
    else
      FUpdateCounter := FUpdateCounter + 1;

    Exit;
  end;

  {update pergerakan kapal yang diangkut, diset sesuai kapal pengangkut}
  TransportMove;

  // readying timer for embarked vehicle
  //  for I := 0 to EmbarkedVehicles.Count - 1 do
  //  begin
  //    embark := TT3EmbarkedVehicle(EmbarkedVehicles.Items[i]);
  //    embark.Run(aDeltaMs);
  //  end;

//  cekDisembarkProses;

  {$ENDREGION}

  {$REGION ' Dormant Process '}
  if FDormant then
  begin
    FDormantCounter := FDormantCounter - aDeltaMs;
    if FDormantCounter <= 0 then
    begin
      if not FisHancur then
      begin
        if Assigned(OnHancur) then
        begin
          Self.reasonDestroy := 21;
          OnHancur(Self, Self.UnitMakeDestroy, Self.reasonDestroy);
        end;

        FisHancur := True;
      end;
    end;
    exit;
  end;
  {$ENDREGION}

  {$REGION ' Logistic Process '}
  if DestinationStateLog = lsProcess then
  begin
    {Perhitungan logistic dilakukan dari sisi kapal penerima}
    LogisticTransferFromShipProcess(aDeltaMs);
  end;

  if isTransferFromBase then
  begin
    LogisticTransferFromBaseProcess(aDeltaMs);
  end;
  {$ENDREGION}

  {$REGION ' Collision Process '}
//  CollisionProcess;
  {$ENDREGION}

  {$REGION ' Collision, On Land, On Grounded Effect '}
  case FVehicleDefition.FData.Platform_Domain of
    vhdAir:
    begin
      if FIsOnLand then
        Dormant := True;

      if isCollision then
        Dormant := True;
    end;
    vhdSurface:
    begin
      if DamagePropulsion then
       Speed := 0;

      if FIsOnLand or FIsGrounded then
      begin
        FMover.Speed        := 0;
        FMover.Acceleration := 0;
        FSpeedState := mcsStable;
        GroundSpeed := 0;
        Speed := 0;

        FMover.TurnRate := 0.0;
        FHeadingState := mcsStable;

        FTacticalSymbol.SpeedVector.Visible := False;
      end;

      if isCollision then
        Speed := 0;
    end;
    vhdSubsurface:
    begin
      if DamagePropulsion then
       Speed := 0;

      if FIsGrounded or FIsOnLand then
      begin
        FMover.Speed        := 0;
        FMover.Acceleration := 0;
        FSpeedState := mcsStable;
        GroundSpeed := 0;
        Speed := 0;

        FMover.TurnRate := 0.0;
        FHeadingState := mcsStable;

        FAltitudeState := mcsStable;

        FTacticalSymbol.SpeedVector.Visible := False;
      end;

      if isCollision then
        Speed := 0;
    end;
    vhdLand:
    begin
      if DamagePropulsion then
       Speed := 0;

      if isCollision then
        Speed := 0;

      if not FIsOnLand then
      begin
        FMover.Speed        := 0;
        FMover.Acceleration := 0;
        FSpeedState := mcsStable;
        GroundSpeed := 0;
        Speed := 0;

        FMover.TurnRate := 0.0;
        FHeadingState := mcsStable;

        FTacticalSymbol.SpeedVector.Visible := False;
      end;
    end;
    vhdAmphibious:
    begin
      if DamagePropulsion then
       Speed := 0;

      if isCollision then
        Speed := 0;
    end;
    vhdGrpPersonel:
    begin
      if FIsOnLand then
      begin
        if FMoveMode = pWalk then
        begin
          FMover.Speed := UnitMotion.FData.Min_Ground_Speed;
        end;
        if FMoveMode = pRun then
        begin
          FMover.Speed := UnitMotion.FData.Max_Ground_Speed;
        end;
        if FMoveMode = pStop then
        begin
          FMover.Speed := 0;
          FTacticalSymbol.SpeedVector.Visible := False;
        end;
      end
      else
      begin
        FMover.Speed := UnitMotion.FData.Min_Ground_Speed;
      end;
    End;
  end;
  {$ENDREGION}

  {$REGION ' Logistic, Fuel Effect '}
  case UnitMotion.FData.Endurance_Type  of
    etFuel:
    begin
      if FuelRemaining <= 0 then
      begin
        FMover.Speed        := 0;
        FMover.Acceleration := 0;
        FSpeedState := mcsStable;
        GroundSpeed := 0;
        Speed := 0;

        FMover.TurnRate := 0.0;
        FHeadingState := mcsStable;

        FTacticalSymbol.SpeedVector.Visible := False;
      end;
    end;
    etTime:
    begin

    end;
    etRange:
    begin

    end;
    etUnlimited:
    begin

    end;
  end;
  {$ENDREGION}

  {$REGION ' Damage Effect '}
  if not Assigned(UnitMotion) then
  begin
    Max_Ground_Speed := 0;
  end
  else
  begin
    Max_Ground_Speed := 0.01 * FDamageStatus.PercentMaxSpeed * UnitMotion.FData.Max_Ground_Speed ;
  end;
  {$ENDREGION}

  {$REGION ' Heading Move '}
  FKananKiri := Vehicle.GuidanceType = vgtHelm;
  case Vehicle.GuidanceType of
    vgtStraightLine : StraightLineMove(aDeltaMs);
    vgtHelm         : HelmMove(aDeltaMs);
    vgtCircle       : CircleMove(aDeltaMs);
    vgtEvasion      : EvasionMove(aDeltaMs);
    vgtWaypoint     : WayPointMove(aDeltaMs);
    vgtOutrun       : OutRunMove(aDeltaMs);
    vgtEngagement   : EngagementMove(aDeltaMs);
    vgtShadow       : ShadowMove(aDeltaMs);
	  vgtZigzag       : ZigzagMove(aDeltaMs);
    vgtSinuation    : SinuationMove(aDeltaMs);
    vgtReturnToBase : ReturnToBaseMove(aDeltaMs);
    vgtFormation    : FormationMove(aDeltaMs);
    vgtStation      : StationMove(aDeltaMs);
    vgtPersonelGuidance : PersonelMove(aDeltaMs);
  end;

  if (Vehicle.GuidanceType = vgtStraightLine)
      or (Vehicle.GuidanceType = vgtEngagement)
      or (Vehicle.GuidanceType = vgtFormation)
      or (Vehicle.GuidanceType = vgtPersonelGuidance)then
  begin
      FDeltaHead := getDeltaH(FOrderedHeading, Heading);
      if (FHeadingState = mcsDecrease) then begin
        if FDeltaHead <= 0  then begin
          FMover.TurnRate := 0.0;
          FHeadingState := mcsStable;
          Heading := FOrderedHeading;
        end;
      end
      else if (FHeadingState = mcsIncrease) then begin
        // turn left
        if FDeltaHead >= 0  then begin
          FMover.TurnRate := 0.0;
          FHeadingState := mcsStable;
          Heading := FOrderedHeading;
        end;
      end;
  end;
  {$ENDREGION}

  {$REGION ' Speed Move '}
  if FSpeedState = mcsIncrease then
  begin
    if (FMover.Speed >= FOrderedSpeed) then
    begin
      FMover.Speed := FOrderedSpeed;
      FMover.Acceleration := 0.0;
      FSpeedState := mcsStable;
    end;
    if FMover.Speed >= Max_Ground_Speed then
    begin
      FMover.Acceleration := 0;
      FMover.Speed := Max_Ground_Speed;
      FSpeedState := mcsStable;
    end;
  end
  else if FSpeedState = mcsDecrease then
  begin
    if FMover.Speed < FOrderedSpeed then
    begin
      FMover.Speed := FOrderedSpeed;
      FMover.Acceleration := 0.0;
      FSpeedState := mcsStable;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Altitude Move '}
  if FAltitudeState = mcsIncrease then
  begin
    if FMover.Z >= FOrderedAltitude then
    begin
      FMover.Z := FOrderedAltitude;
      FMover.Vertical_Accel := 0.0;
      FMover.VerticalSpeed  := 0.0;
      FMover.ClimbRate      := 0;
      FMover.DescentRate    := 0;
      FAltitudeState := mcsStable;

//      if PlatformDomain = vhdSubsurface then
//      begin
//        if Assigned(OnEventSendPlatformcmd) then
//          OnEventSendPlatformcmd(InstanceIndex, CORD_ID_MOVE,
//                      CORD_TYPE_ALTITUDE, 3, (FOrderedAltitude));
//      end;
    end
  end
  else if FAltitudeState = mcsDecrease then
  begin
    if FMover.Z <= FOrderedAltitude then
    begin
      FMover.Z := FOrderedAltitude;
      FMover.Vertical_Accel := 0.0;
      FMover.VerticalSpeed  := 0.0;
      FMover.ClimbRate      := 0;
      FMover.DescentRate    := 0;
      FAltitudeState := mcsStable;

//      if PlatformDomain = vhdSubsurface then
//      begin
//        if Assigned(OnEventSendPlatformcmd) then
//          OnEventSendPlatformcmd(InstanceIndex, CORD_ID_MOVE,
//                      CORD_TYPE_ALTITUDE, 3, (FOrderedAltitude));
//      end;
    end;
  end
  else if FAltitudeState = mcsStable then
  begin
      FMover.Vertical_Accel := 0.0;
      FMover.ClimbRate      := 0;
      FMover.DescentRate    := 0;
      FMover.VerticalSpeed := 0.0;
  end;
  {$ENDREGION}

  FMover.Move(aDeltaMs, FVehicleDefition.FData.Platform_Domain, FGameSpeed, FConnect3D);

  {$IFDEF SERVER}
  if FVehicleDefition.FData.Platform_Domain <> vhdAir then
  begin
    FUpdateLandandDepthCounter := FUpdateLandandDepthCounter - aDeltaMs;

    if FUpdateLandandDepthCounter <= 0 then
    begin
      range := CalcRange(FPosition.X,FPosition.Y,FLastSavingPositionX,FLastSavingPositionY);
      range := range * C_NauticalMile_To_Metre;

      if (range >= MIN_RANGE_DEPTH_CHECK) then begin
        FLastSavingPositionX := FPosition.X;
        FLastSavingPositionY := FPosition.Y;
        CekLandanDepth(FMover.X, FMover.Y);
      end;

      FUpdateLandandDepthCounter := 2;
    end;
  end;
  {$ENDIF}

  {$REGION ' Environment Effect '}
  if Assigned(Environment) then
  begin
    case FVehicleDefition.FData.Platform_Domain of
      vhdAir:
      begin
        if Altitude <= 0 then
        begin
          dx := 0;
          dy := 0;
          FCourse   := Heading;
          FVelocity := GroundSpeed;
        end
        else
        begin
          Environment.getCalc_EnviEffect(FVehicleDefition.FData.Platform_Domain, Heading, GroundSpeed, FIsOnLand, FCourse, FVelocity);

          dx := Environment.get_DX(FVehicleDefition.FData.Platform_Domain, aDeltaMs);
          dy := Environment.get_DY(FVehicleDefition.FData.Platform_Domain, aDeltaMs);
        end;
      end;
      vhdSurface, vhdSubsurface:
      begin
        if FIsGrounded or FIsOnLand then
        begin
          dx := 0;
          dy := 0;
          FCourse   := Heading;
          FVelocity := GroundSpeed;
        end
        else
        begin
          Environment.getCalc_EnviEffect(FVehicleDefition.FData.Platform_Domain, Heading, GroundSpeed, FIsOnLand, FCourse, FVelocity);

          dx := Environment.get_DX(FVehicleDefition.FData.Platform_Domain, aDeltaMs);
          dy := Environment.get_DY(FVehicleDefition.FData.Platform_Domain, aDeltaMs);
        end;
      end;
      vhdLand:
      begin
        if FIsOnLand then
        begin
          Environment.getCalc_EnviEffect(FVehicleDefition.FData.Platform_Domain, Heading, GroundSpeed, FIsOnLand, FCourse, FVelocity);

          dx := Environment.get_DX(FVehicleDefition.FData.Platform_Domain, aDeltaMs);
          dy := Environment.get_DY(FVehicleDefition.FData.Platform_Domain, aDeltaMs);

//          FCourse   := Heading;
//          FVelocity := GroundSpeed;
        end
        else
        begin
          dx := 0;
          dy := 0;

          FCourse   := Heading;
          FVelocity := GroundSpeed;
        end;
      end;
      vhdAmphibious:
      begin
        Environment.getCalc_EnviEffect(FVehicleDefition.FData.Platform_Domain, Heading, GroundSpeed, FIsOnLand, FCourse, FVelocity);

        dx := Environment.get_DX(FVehicleDefition.FData.Platform_Domain, aDeltaMs);
        dy := Environment.get_DY(FVehicleDefition.FData.Platform_Domain, aDeltaMs);
      end;
    end;
  end
  else
  begin
    dx := 0;
    dy := 0;
    FVelocity := GroundSpeed;
  end;
  {$ENDREGION}

  FPosition.X := FMover.X + dx;
  FPosition.Y := FMover.Y + dy;
  FPosition.Z := FMover.Z;

  FMover.X := FPosition.X;
  FMover.Y := FPosition.Y;
  FOnPositionChange(Self);

  FFormationLeader.x := FPosition.X;
  FFormationLeader.y := FPosition.Y;
  FFormationLeader.BaseBearing := Self.Course;

  FHisCounter.Run(aDeltaMs);

  // triggering event
  delta := abs(Heading - FLHead);
  if delta > 1.0 then begin
    FLHead := Heading;
    TriggerListener(Self,psHeading,Heading);
  end;

  delta := abs(GroundSpeed - FLSpeed);
  if delta > 1.0 then begin
    FLSpeed := GroundSpeed;
    TriggerListener(Self,psSpeed,GroundSpeed);
  end;

  delta := abs(Altitude - FLAltitude);
  if delta > 1.0 then begin
    FLAltitude := Altitude;
    TriggerListener(Self,psAltitudeDepth,Altitude);
  end;
end;

procedure TT3Vehicle.OnTimerBlink_Off(sender: Tobject);
var
  symbol: string;
  Color: TColor;
begin
  FCounterBlink := FCounterBlink + 1;
  symbol := getCorrectSymbol(vhdWreck, PlatformType, Force_Designation, color);

  if FCounterBlink <= 10 then
  begin

    if FCounterBlink mod 2 <> 0 then
    begin
      FTacticalSymbol.Color := RGB(0,0,51);
      Color := RGB(0,0,51);
      FSignPlatform.Color := Color;
      FTacticalSymbol.SetTextColor(Color);
//      FTacticalSymbol.symbol.LoadBitmap(vSymbolSetting.ImgPath + symbol + '.bmp',
//      Color);
    end
    else
    begin
      FTacticalSymbol.Color := Color;
      FSignPlatform.Color := Color;
      FTacticalSymbol.SetTextColor(Color);
//      FTacticalSymbol.symbol.LoadBitmap(vSymbolSetting.ImgPath + symbol + '.bmp',
//      Color);
    end;

  end
  else
  begin
    TimerBlink_Off.Enabled := False;
    FCounterBlink := 0;
//    FreeChilds;
    FreeMe := true;

  end;
end;

procedure TT3Vehicle.SetCircleDirection(value : Double);
begin
  FCircleDirection := value;
  Circle_state := cstateStraight;
end;

procedure TT3Vehicle.setConnect3D(const Value: Boolean);
begin
  FConnect3D := Value;
end;

procedure TT3Vehicle.OnWaypointReached(behaviour, events: TObject);
begin
  if Assigned(behaviour) then
  begin
    SetOrderedSpeed(TScripted_Behav_Definition(behaviour).FData.Speed);
    SetOrderedAltitude(TScripted_Behav_Definition(behaviour).FData.Altitude);
  end;
end;

procedure TT3Vehicle.RepositionTo(const x, y: double);
begin
  inherited;
  FMover.X := X;
  FMover.Y := Y;

  {$IFDEF SERVER}
    CekLandanDepth(FMover.X, FMover.Y);
  {$ENDIF}
end;

procedure TT3Vehicle.SetAltitude(const Value: single);
begin
  FMover.Z := Value / (C_Degree_To_NauticalMile * C_NauticalMile_To_Metre);
end;


procedure TT3Vehicle.setAmphibiousOnLand(const Value: Boolean);
begin
  if Value <> FAmphibiousOnLand then
  begin
    if Value = True then
    begin
//      if Assigned(OnDeleteVehicle3D) then
//        OnDeleteVehicle3D(Self.InstanceIndex);
    end;
  end;

  FAmphibiousOnLand := Value;

end;

procedure TT3Vehicle.SetControlled(const Value: boolean);
begin
  inherited;

  FTacticalSymbol.Selected   := Value;
  FTacticalSymbol.Controlled := Value;

  FVectorSymbol.Selected     := Value;
  FVectorSymbol.Controlled   := Value;
end;

procedure TT3Vehicle.SetDormant(const Value: boolean);
var
  symbol : string;
  color : TColor;
begin
  inherited;

  if FDormant then begin
    // start dying here
    FMover.Speed    := 0;
    FDormantCounter := FDormantTime;

    if isInstructor or isWasdal then
    begin
      symbol := getCorrectSymbol(5, 0, Force_Designation, color);
      FTacticalSymbol.isWreck := True;
    end
    else
    begin
      symbol := getCorrectSymbol(5, 0, 3, color)
    end;

    FTacticalSymbol.Color := Color;
//    FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + symbol + '.bmp',color);
    FTacticalSymbol.Color := COlor;
  end else
  begin
    // cancelled dying object;
    FDormantCounter := FDormantTime;
    FTacticalSymbol.isWreck := False;
    LoadPlatformSymbol;
  end;

  //set Detectability Type
  DetectabilityType := VehicleDefinition.FData.Detectability_Type;
end;

procedure TT3Vehicle.SetDormantTime(const Value: word);
begin
  inherited;
end;

procedure TT3Vehicle.SetPersonelTransportedList(const Value: TList);
begin
  FPersonelTransportedList := Value;
end;

procedure TT3Vehicle.SetTransportedList(const Value: TList);
begin
  FTransportedList := Value;
end;

procedure TT3Vehicle.SetEmbarkedVehicles(const Value: TList);
begin
  FEmbarkedVehicles := Value;
end;

procedure TT3Vehicle.setEMCON_HFDataLinkVehicle(const Value: TEMCON_HFDataLinkVehicle);
begin
  FEMCON_HFDataLinkVehicle := value;
end;

procedure TT3Vehicle.setEMCON_UHFVHFDataLinkVehicle(
  const Value: TEMCON_UHFVHFDataLinkVehicle);
begin
  FEMCON_UHFVHFDataLinkVehicle := value;
end;

procedure TT3Vehicle.SetEnable(const Value: boolean);
var i : integer;
begin
  inherited;

  for i := 0 to Devices.Count - 1 do
    TT3Unit(Devices.Items[i]).Enable := Value;

  for i := 0 to Weapons.Count - 1 do
    TT3Unit(Weapons.Items[i]).Enable := Value;
end;

// Tambahan Gue : Prince Achmad (27/ 03/ 2012)
procedure TT3Vehicle.SetFirstHeading(const Value: double);
begin
  FFirstHeading := Value;
end;

procedure TT3Vehicle.SetSpeednEscapeAngle(Target : TT3Vehicle; var SpeedSet, HeadingSet : Double);
var
  inleft : Boolean;
  goingTo : Integer;
  BearingToCrash : Double;
  
begin
  inleft := False;
  HeadingSet := Heading;
  SpeedSet := UnitMotion.FData.Max_Ground_Speed;
  
  BearingToCrash := CalcBearing(PosX, PosY, Target.PosX, Target.PosY);

  {cek apakah target ada di sisi kiri atau kanan}
  if ((BearingToCrash - Heading) < 0) or ((BearingToCrash - Heading) > 180) then
    inleft := True;

  {cek apakah target menuju ke sisi kiri atau kanan}
  goingTo := CalcRelativeHeading(Heading, Target.Heading);

  if inleft then
  begin
    if Target.Speed = 0 then
    begin
      HeadingSet := ValidateDegree(Heading + 45)
    end
    else
    begin
      case goingTo of
        -1: HeadingSet := ValidateDegree(Heading + 45);
        0 : HeadingSet := Heading;
        1 : HeadingSet := ValidateDegree(Heading - 45);  
      end;
    end;         
  end
  else
  begin
    if Target.Speed = 0 then
    begin
      HeadingSet := ValidateDegree(Heading - 45)
    end
    else
    begin
      case goingTo of
        -1: HeadingSet := ValidateDegree(Heading + 45);
        0 : HeadingSet := Heading;
        1 : HeadingSet := ValidateDegree(Heading - 45);
      end;
    end;
  end;

  if HeadingSet <> Heading then
    SpeedSet := 2;
end;

procedure TT3Vehicle.SetSpeedToFormation(Kuadran : Integer; var SpeedSet : Double);
var
  minSpeed, maxSpeed,
  Gear : Double;
begin
  minSpeed := LeaderPlatform.Speed;
  maxSpeed := UnitMotion.FData.Max_Ground_Speed;

  Gear := minSpeed + (maxSpeed/ 2);

  if Gear > maxSpeed then
    SpeedSet := maxSpeed;

  if LeaderPlatform.Speed >= maxSpeed then Exit;

  if Kuadran = 2 then
  begin
    SpeedSet := 0;
    Exit;
  end;

  if (RangeToFormation > 0.5) then
  begin
    SpeedSet := maxSpeed;
  end
  else if (RangeToFormation < 0.5) and (RangeToFormation > 0.05) then
  begin
    SpeedSet := Gear;
  end
  else if (RangeToFormation < 0.05) and (RangeToFormation > 0.01) then
  begin
    SpeedSet := minSpeed + 1;
  end
  else
  begin
    SpeedSet := minSpeed;
  end;

  SpeedSet := Round(SpeedSet);
end;

// --------

procedure TT3Vehicle.SetFreeMe(const Value: boolean);
begin
  inherited;

  DeleteFromSnapshot := Value;

  if Value then
    FreeFromSnapshot;

  if Assigned(OnFreeMe) then
    OnFreeMe(Self,Value);
end;

procedure TT3Vehicle.SetFuelRemaining(const Value: double);
begin
  inherited;
  FDamageStatus.FuelRemaining := Value;
end;

procedure TT3Vehicle.setIsGroupLeader(const Value: boolean);
begin
  inherited;

  FTacticalSymbol.SpeedVector.Speed := 90;
end;

procedure TT3Vehicle.setLastEMCON_HFDLink(
  const Value: TEMCON_HFDataLinkVehicle);
begin
  FLastEMCON_HFDLink := value;
end;

procedure TT3Vehicle.setLastEMCON_UHFVHFDLink(
  const Value: TEMCON_UHFVHFDataLinkVehicle);
begin
  FLastEMCON_UHFVHFDLink := value;
end;

procedure TT3Vehicle.SetLaunchFromRPL(const Value: Boolean);
begin
  FLaunchFromRPL := Value;
end;

procedure TT3Vehicle.SetObjects(platformObjects: TT3UnitContainer);
begin
  FSimPlatforms   := platformObjects;
end;

procedure TT3Vehicle.SetTrack_ID(const Value: string);
begin
  inherited;
  FTacticalSymbol.CallSign1 := Value;
end;

function TT3Vehicle.getInstanceClass: string;
begin
  result := VehicleDefinition.FData.Vehicle_Identifier;
end;

procedure TT3Vehicle.setGrounded(const Value: boolean);
begin
  FIsGrounded := Value;
end;

procedure TT3Vehicle.setOnCekLandandDepth(const Value: TOnCekLandandDepth);
begin
  FOnCekLandandDepth := Value;
end;

procedure TT3Vehicle.setOnLand(const Value: boolean);
begin
  FIsOnLand := Value;
end;

function TT3Vehicle.FindDevice(ClassT : TClass;IndexVal: integer): TT3DeviceUnit;
var
  i : integer;
  f : boolean;
  dev : TObject;
begin
  f := false;
  i := 0;
  dev := nil;

  while (not f) and (i < Devices.Count) do
  begin
    dev := Devices.Items[i];
    if (TT3DeviceUnit(dev).InstanceIndex = IndexVal) {and
       (dev is ClassT)} then // sementara
       f := true;

    inc(i);
  end;

  if f then
    result := TT3DeviceUnit(dev)
  else
    result := nil;
end;

procedure TT3Vehicle.FindPoint(postCont: t2DPoint; var postValue: t2DPoint; vRange, vBearing: Double);
var
  dx, dy : Double;
begin
  RangeBearingToCoord(vRange, vBearing, dx, dy);
  postValue.X := postCont.X + dx;
  postValue.Y := postCont.Y + dy;
end;

procedure TT3Vehicle.FreeChilds;
var
  i : integer;
begin
  inherited;

  for i := 0 to Weapons.Count - 1 do
  begin
      TSimObject(Weapons[i]).FreeMe := true;
      TSimObject(Weapons[i]).AbsoluteFree := true;
  end;

//  Weapons.Clear;

  for i := 0 to Devices.Count - 1 do
  begin
     TSimObject(Devices[i]).FreeMe := true;
     TSimObject(Devices[i]).AbsoluteFree := true;
  end;

//  Devices.Clear;

  for i := 0 to EmbarkedVehicles.Count - 1 do
  begin
      TSimObject(EmbarkedVehicles[i]).FreeMe := true;
      TSimObject(EmbarkedVehicles[i]).AbsoluteFree := true;
  end;

//  for i := 0 to TransportedList.Count - 1 do
//  begin
//      TSimObject(TransportedList[i]).FreeMe := true;
//      TSimObject(TransportedList[i]).AbsoluteFree := true;
//  end;

//  for i := 0 to PersonelTransportedList.Count - 1 do
//  begin
//      TSimObject(PersonelTransportedList[i]).FreeMe := true;
//      TSimObject(PersonelTransportedList[i]).AbsoluteFree := true;
//  end;

//  EmbarkedVehicles.Clear;

  LeaderPlatform := nil;
  BaseVehicle := nil;
end;

procedure TT3Vehicle.FreeFromSnapshot;
var
  i : integer;
begin
  for i := 0 to Weapons.Count - 1 do
      TSimObject(Weapons[i]).DeleteFromSnapshot := true;

  Weapons.Clear;

  for i := 0 to Devices.Count - 1 do
     TSimObject(Devices[i]).DeleteFromSnapshot := true;

  Devices.Clear;

  for i := 0 to EmbarkedVehicles.Count - 1 do
      TSimObject(EmbarkedVehicles[i]).DeleteFromSnapshot := true;

//  EmbarkedVehicles.Clear;
end;

procedure TT3Vehicle.SetOrderedAltitude(const Value: double);
var dH: double;
begin
  FOrderedAltitude          := Value  /
    (C_NauticalMile_To_Metre * C_Degree_To_NauticalMile) ;

  dH := (FOrderedAltitude - FMover.Z);
  if abs(dH) < 0.000000000001 then
  begin
    FAltitudeState := mcsStable;
    FMover.Vertical_Accel := 0;
  end
  else
  begin
    if FOrderedAltitude > FMover.Z then
    begin
      FMover.ClimbRate      := UnitMotion.FData.Normal_Climb_Rate;
      FMover.Vertical_Accel := Abs(UnitMotion.FData.Vertical_Accel);

      FAltitudeState        := mcsIncrease;
    end
    else
    begin
      FMover.DescentRate    := UnitMotion.FData.Normal_Descent_Rate;
      FMover.Vertical_Accel := - Abs(UnitMotion.FData.Vertical_Accel);

      FAltitudeState := mcsDecrease;
    end;
  end;

{  if Assigned(FOnOrderedControl) then FOnOrderedControl(Self,
    pocAltitude, Value);
}
end;

procedure TT3Vehicle.SetWindDirection(const Value: Double);
begin
  FWindDirection := Value;

end;

procedure TT3Vehicle.SetWindSpeed(const Value: Double);
begin
  FWindSpeed := Value;

end;

procedure TT3Vehicle.SetZigzagMovementShort;
begin
  //-- Hardcore Mode;
  //FAmplitudoZigzag := 0.5;
  //FPeriodZigzag    := 2;

  if Assigned(GameDefaults) then
  begin
    FAmplitudoZigzag := GameDefaults.FData.Short_Period_Amplitude;
    FPeriodZigzag    := GameDefaults.FData.Short_Period_Distance;
  end
  else
  begin
    FAmplitudoZigzag := 0.5;
    FPeriodZigzag    := 2;
  end;
end;

procedure TT3Vehicle.SetZigzagMovementLong;
begin
  //-- Hardcore Mode
  //FAmplitudoZigzag := 0.75;
  //FPeriodZigzag    := 4;

  if Assigned(GameDefaults) then
  begin
    FAmplitudoZigzag := GameDefaults.FData.Long_Period_Amplitude;
    FPeriodZigzag    := GameDefaults.FData.Long_Period_Distance;
  end
  else
  begin
    FAmplitudoZigzag := 0.75;
    FPeriodZigzag    := 4;
  end;
end;

procedure TT3Vehicle.SetZigzagMovementVeryLong;
begin
  //-- Hardcore Mode
  //FAmplitudoZigzag := 1;
  //FPeriodZigzag    := 6;

  if Assigned(GameDefaults) then
  begin
    FAmplitudoZigzag := GameDefaults.FData.Very_Period_Amplitude;
    FPeriodZigzag    := GameDefaults.FData.Very_Period_Distance;
  end
  else
  begin
    FAmplitudoZigzag := 1;
    FPeriodZigzag    := 6;
  end;
end;

procedure TT3Vehicle.SetSinuationMovement;
begin
  //-- Hardcore Mode
  //FAmplitudoSinuation := 0.75;
  //FPeriodSinuation    := 0.75;

  if Assigned(GameDefaults) then
  begin
    FAmplitudoSinuation := GameDefaults.FData.Sine_Period_Amplitude;
    FPeriodSinuation    := GameDefaults.FData.Sine_Period_Distance;
  end
  else
  begin
    FAmplitudoSinuation := 0.75;
    FPeriodSinuation    := 0.75;
  end;
end;

procedure TT3Vehicle.SetOrderedHeading(const Value: double);
var
  vehicle : TVehicle_Definition;
  turnRate : double;
begin
  vehicle := TVehicle_Definition(UnitDefinition);

  FOrderedHeading  := Value;

  FDeltaHead :=  getDeltaH(Value, Heading);
  FOrderedHeadingAchieved :=  abs(FDeltaHead) < 2.0 ;
  FhelmAngleAchieved      :=  abs(FDeltaHead) < 2.0 ;
  FEvasionAngleAchieved   :=  Abs(FDeltaHead) < 2.0 ;

  if FOrderedHeadingAchieved then begin
    Heading       := Value;
    FHeadingState := mcsStable;
  end;

  if Assigned(UnitMotion) then
  begin
    if vehicle.GuidanceType = vgtHelm then
    begin
      turnRate     := (abs(HelmDegree)*UnitMotion.FData.Tight_Turn_Rate)/UnitMotion.FData.Max_Helm_Angle;
    end
    else
      turnRate     := UnitMotion.FData.Standard_Turn_Rate // degree per second
  end
  else
    turnRate     := 0;                                  // degree per second

  if FKananKiri then // Hanya untuk helm move
  begin
    if Value < 0  then begin
       FMover.TurnRate := turnRate;
       FHeadingState   := mcsIncrease;
    end
    else
    begin
       FMover.TurnRate := -turnRate;
       FHeadingState   := mcsDecrease;
    end;
  end
  else
  begin
    if FDeltaHead < 0  then begin
       FMover.TurnRate := turnRate;
       FHeadingState   := mcsIncrease;
    end
    else begin
       FMover.TurnRate := -turnRate;
       FHeadingState   := mcsDecrease;
    end;
  end;

end;

procedure TT3Vehicle.SetEvasionHeading(const Value: double);
var
  turnRate : double;
begin
  FEvasionDegree := Value;  // komaps

  FDeltaHead :=  getDeltaH(Value, Course);
  FEvasionAngleAchieved   :=  Abs(FDeltaHead) < 2.0 ;

  if FEvasionAngleAchieved then begin
    Course := Value;
    FHeadingState := mcsStable;
  end;

  if Assigned(UnitMotion) then begin
    turnRate     := UnitMotion.FData.Standard_Turn_Rate; // degree per second
    //tightRate    := UnitMotion.FData.Tight_Turn_Rate;    // degree per second
  end else begin
    turnRate     := 0;    // degree per second
    //tightRate    := 0;    // degree per second
  end;

  if FDeltaHead < 0 then begin
    FMover.TurnRate := turnRate;
    FHeadingState := mcsIncrease
  end
  else begin
    FMover.TurnRate := -turnRate;
    FHeadingState := mcsDecrease;
  end;

{  if Assigned(FOnOrderedControl) then FOnOrderedControl(Self,
    pocHeading, Value);
    //pocAltitude,}
end;

procedure TT3Vehicle.SetOrderedSpeed(const Value: double);
//var
//  dt : Double;
begin
  FOrderedSpeed := Value;            //kompas
  FOrderedSpeedAchieved := false;

  if FOrderedSpeed > FMover.Speed then begin
    FMover.Acceleration :=  UnitMotion.FData.Acceleration; // knot per second
    FMover.Acceleration :=  UnitMotion.FData.Acceleration; // knot per second
    FSpeedState := mcsIncrease;
  end
  else if FOrderedSpeed < FMover.Speed then begin
    FMover.Acceleration := - abs(UnitMotion.FData.Deceleration); // knot per second
    FSpeedState := mcsDecrease;
  end
  else begin
    FMover.Acceleration := 0.0;
    FSpeedState := mcsStable;
  end;

end;

procedure TT3Vehicle.setPercentSpeed(const index, val: Integer);
var
  sinVal : Single;
begin
  case index of
    1:
    begin
      sinVal := single(val);
      FDamageStatus.PercentMaxSpeed := sinVal;
    end;
  end;

end;

procedure TT3Vehicle.SetPlatformViewMode(const Value: Boolean);
begin
  FPlatformViewMode := Value;
end;

function TT3Vehicle.getPos(const Index: Integer): double;
begin
  Result := 0;

  case Index of
    1: Result := FCourse;          //ConvCartesian_To_Compass(FMover.Direction);
    2: Result := FVelocity;        //FMover.Speed;
  end;
end;

procedure TT3Vehicle.setPos(const Index: Integer; const Value: double);
begin
  case Index of
    1: FMover.Direction := ConvCompass_To_Cartesian(Value);
    2: FMover.Speed := Value;
  end;
end;

function TT3Vehicle.getHeading: Double;
begin
  Result := ConvCartesian_To_Compass(FMover.Direction);
end;

procedure TT3Vehicle.setHeading(const Value: Double);
begin
  TriggerListener(Self,psHeading,Value);

  FMover.Direction := ConvCompass_To_Cartesian(value);
end;

function TT3Vehicle.getGroundSpeed: Double;
begin
   Result := FMover.speed;
end;

procedure TT3Vehicle.setGroundSpeed(const Value: Double);
begin
   FMover.speed := value;
end;

procedure TT3Vehicle.setPositionX(const v: double);
begin
  inherited;
  FMover.X := v;
end;

procedure TT3Vehicle.setPositionY(const v: double);
begin
  inherited;
  FMover.Y := v;
end;

procedure TT3Vehicle.setPositionZ(const v: double);
begin
  inherited;
  //Altitude := v;
  FMover.Z := v;
end;

procedure TT3Vehicle.LoadPlatformSymbol;
var
  color   : TColor;
  symbol  : Char;
begin
  if isInstructor or isWasdal then
  begin
    if FDormant then
      symbol := getCorrectSymbol(5, 0, Force_Designation, color)
    else
      symbol := getCorrectSymbol(PlatformDomain, PlatformType, Force_Designation, color);
  end
  else
  begin
    if FDormant then
      symbol := getCorrectSymbol(5, 0, 3, color)
    else
      symbol := getCorrectSymbol(PlatformDomain, PlatformType, 3, color);
  end;

  FTacticalSymbol.Color := Color;
  FTacticalSymbol.SetTextColor(color);

  FTacticalSymbol.Color := Color;
  FTacticalSymbol.SetTextColor(color);

  if isInstructor or isWasdal then
  begin
    FTacticalSymbol.SymbolVisual.FontName := FontName;
    FTacticalSymbol.SymbolVisual.CharSymbol := Char(FontIndex);

    FOwnSymbol.SymbolVisual.FontName := FontName;
    FOwnSymbol.SymbolVisual.CharSymbol := Char(FontIndex);
  end
  else
  begin
    FTacticalSymbol.SymbolVisual.FontName := 'atct';
    FTacticalSymbol.SymbolVisual.CharSymbol := symbol;

    FOwnSymbol.SymbolVisual.FontName := 'atct';
    FOwnSymbol.SymbolVisual.CharSymbol := symbol;
  end;

  FTacticalSymbol.SymbolVisual.Size := vSymbolSetting.FontSize;
end;

procedure TT3Vehicle.LoadTrackSymbol;
var sName: string;
begin // untuk 'detected' track
  //sName := vSymbolSetting.ImgPath +  getDetectedSymbolFileName(FTrackDomain, FTrackIdent);

  //if FileExists(sName) then begin
    FTacticalSymbol.Color := getColorFromIdentity(FTrackIdent);
//    FTacticalSymbol.Symbol.LoadBitmap( sName,FTacticalSymbol.Color);
    FTacticalSymbol.SetTextColor(FTacticalSymbol.Color);
    FTacticalSymbol.SpeedVector.Color := FTacticalSymbol.Color;
    FTacticalSymbol.SymbolVisual.FontName := 'atct';
    //FTacticalSymbol.SymbolVisual.CharSymbol := FSymbolType;
  //end;
end;

procedure TT3Vehicle.SetTacticalDinamicSymbol(const Value: Boolean);
begin
  FTacticalDinamicSymbol := Value;
end;

procedure TT3Vehicle.SetTacticalStaticSymbol(const Value: Boolean);
begin
  FTacticalStaticSymbol := Value;
end;

procedure TT3Vehicle.SetTrackDomain(const Value: integer);
begin
  inherited;
  LoadTrackSymbol;
end;

procedure TT3Vehicle.SetTrackIdent(const Value: integer);
begin
  inherited;
  LoadTrackSymbol;
end;

procedure TT3Vehicle.SetSelected(const Value: boolean);
begin
  inherited;
  FTacticalSymbol.Selected := Value;
  FVectorSymbol.Selected   := Value;
end;

procedure TT3Vehicle.SetShipTacticalInfo(const Index: Integer;
  const Value: string);
begin
  FShipTacticalInfo[Index] := Value;
end;

procedure TT3Vehicle.SetShowTrails(const Value: boolean);
begin
  FShowTrails := Value;
  FVHistory.Visible := Value;
end;

procedure TT3Vehicle.SetUnitGroup(const Value: boolean);
var i : integer;
begin
  inherited;

  for i := 0 to Devices.Count - 1 do
    TT3Unit(Devices.Items[i]).UnitGroup := Value;

  for i := 0 to Weapons.Count - 1 do
    TT3Unit(Weapons.Items[i]).UnitGroup := Value;
end;

procedure TT3Vehicle.SetupChaff;
var
  i,j : integer;
  item : TObject;
  list : TList;
begin
  list := TList.Create;

  // cari launchernya dulu
  for i := 0 to FDevices.Count - 1 do begin
    item := FDevices.Items[i];
    if item is TT3ChaffLauncher then
      list.Add(item);
  end;

  for i := 0 to FDevices.Count - 1 do begin
    item := FDevices.Items[i];

    if item is TT3ChaffOnVehicle then
      for j := 0 to list.Count - 1 do begin
        TT3ChaffOnVehicle(item).AddLauncher(TT3ChaffLauncher(list.Items[j]));
      end;

  end;

  list.Free;

end;

{function getSectorFromMountPoint(const aMountPt : integer): integer;
var t: integer;
begin
// ini yg dari database. angkanya di sesuaikan disini kalo perlu
// di database 0.. ?? dijadikan 0..
  result := aMountPt;
  if result < 0 then
    result := 0;

  if result > 5  then
    result := 5;
end;
{    / \
    / F \
   -------
   | 2 1 |
   | 4 3 |
P  | 6 5 | S
   | 8 7 |
   |  A  |
   -------
}

procedure TT3Vehicle.Shooted(ShootBy: TSimObject; Lethality: single);
{$IFDEF SERVER}
var
  bullet: TT3GunShoot;
  vx, vy, sx, sy: double;
  bOri, bRel : double;
  prevDmg : TRecDamageStatus;
  gt: integer;
  hp, perc : single;
{$ENDIF}
begin
{$IFDEF SERVER}
  prevDmg := FDamageStatus;
  inherited;

  // ---- weapon damage --------------------
  if ShootBy is TT3GunShoot then begin
    bullet := TT3GunShoot(ShootBy);
    //shooter pos
    sx := bullet.Parent.getPositionX;
    sy := bullet.Parent.getPositionY;
  end
  else if ShootBy is TT3Missile then begin
    if Assigned(TT3Missile(ShootBy).Parent) then begin
      sx := TT3Missile(ShootBy).Parent.getPositionX;
      sy := TT3Missile(ShootBy).Parent.getPositionY;
    end else begin
      sx := (ShootBy as TT3Missile).getPositionX;
      sy := (ShootBy as TT3Missile).getPositionY;
    end;
  end
  else if ShootBy is TT3Torpedo then begin   // 13/ 02/ 2014
    if Assigned(TT3Torpedo(ShootBy).Parent) then begin
      sx := TT3Torpedo(ShootBy).Parent.getPositionX;
      sy := TT3Torpedo(ShootBy).Parent.getPositionY;
    end else begin
      sx := (ShootBy as TT3Torpedo).getPositionX;
      sy := (ShootBy as TT3Torpedo).getPositionY;
    end;
  end
  else begin //default
    sx := getPositionX;
    sy := getPositionY + 0.1;

  end;
  vx := getPositionX;
  vy := getPositionY;

  bOri := CalcBearing(vx, vy, sx, sy);
  bRel := ValidateDegree(bOri - Course);

  gt := getGTIndex(FDamageStatus.DamageCapacity);

  if FDamageStatus.WeaponDamage then
  begin
    hp := FDamageStatus.PercentHealth;

    perc := 100.0 * (C_Limit_Weapon[gt] - hp ) /
            (C_Limit_Weapon[gt] - C_Limit_comm[gt]);

    SetSectorWeaponDamage(bRel, perc);

    if Assigned(FOnDamageChanged) then
      FOnDamageChanged(self, diWeapon);
  end;
{$ENDIF}
end;

procedure TT3Vehicle.SinuationMove(const aDeltaMs: double);
var
  Degree, Length_Sinuation : Double;
  lengthDistance : Double;
begin
  Length_Sinuation := 0;
  Degree           := 0;

  GetAngleAndDistanceSinuation(OrderedSinuation, FPeriodSinuation, FAmplitudoSinuation,
                               Length_Sinuation, Degree);

  if isFirstSinuation then
  begin
    SetOrderedHeading(FOrderedSinuation - Degree);

    if FOrderedHeadingAchieved then
    begin
      if not isStartSinuation then
      begin
        Sinuationtemp_PosX := getPositionX;
        Sinuationtemp_PosY := getPositionY;
      end;

      isStartSinuation := True;

      if CalcRange(getPositionX, getPositionY, Sinuationtemp_PosX, Sinuationtemp_PosY) > (0.5*Length_Sinuation)then
      begin
         isFirstSinuation := False;
         isStartSinuation := False;

         isLeftSinuation  := False;
         isRightSinuation := True;
      end;
    end;
  end
  else
  if isRightSinuation then
  begin
    SetOrderedHeading(FOrderedSinuation + Degree);

    if FOrderedHeadingAchieved then
    begin
      if not isStartSinuation then
      begin
        Sinuationtemp_PosX := getPositionX;
        Sinuationtemp_PosY := getPositionY;
      end;

      isStartSinuation := True;

      lengthDistance := CalcRange(getPositionX, getPositionY, Sinuationtemp_PosX, Sinuationtemp_PosY);
      if lengthDistance > Length_Sinuation then
      begin
         isFirstSinuation := False;
         isStartSinuation := False;

         isLeftSinuation  := True;
         isRightSinuation := False;
      end;
    end;
  end
  else
  if isLeftSinuation then
  begin
    SetOrderedHeading(FOrderedSinuation - Degree);

    if FOrderedHeadingAchieved then
    begin
      if not isStartSinuation then
      begin
        Sinuationtemp_PosX := getPositionX;
        Sinuationtemp_PosY := getPositionY;
      end;

      isStartSinuation := True;

      lengthDistance := CalcRange(getPositionX, getPositionY, Sinuationtemp_PosX, Sinuationtemp_PosY);
      if lengthDistance > Length_Sinuation then
      begin
         isFirstSinuation := False;
         isStartSinuation := False;

         isLeftSinuation  := False;
         isRightSinuation := True;
      end;
    end;
  end;
end;

procedure TT3Vehicle.StraightLineMove(const aDeltaMs: double);
begin
  SetOrderedHeading(FOrderedHeading);
end;

procedure TT3Vehicle.EvasionMove(const aDeltaMs: double);
begin
  FDeltaHead := getDeltaH(FEvasionDegree, Heading);

  if (FHeadingState = mcsDecrease) then begin
    if FDeltaHead <= 0  then begin
      FMover.TurnRate := 0.0;
      FHeadingState := mcsStable;
      Heading := FEvasionDegree;
    end;
  end
  else if (FHeadingState = mcsIncrease) then begin
    // turn left
    if FDeltaHead >= 0  then begin
      FMover.TurnRate := 0.0;
      FHeadingState := mcsStable;
      Heading := FEvasionDegree;
    end;
  end;
end;

procedure TT3Vehicle.OutRunMove(const aDeltaMs: double);
begin
  FDeltaHead := getDeltaH(FEvasionDegree, Heading);

  if (FHeadingState = mcsDecrease) then begin
    if FDeltaHead <= 0  then begin
      FMover.TurnRate := 0.0;
      FHeadingState := mcsStable;
      Heading := FEvasionDegree;
    end;
  end
  else if (FHeadingState = mcsIncrease) then begin
    // turn left
    if FDeltaHead >= 0  then begin
      FMover.TurnRate := 0.0;
      FHeadingState := mcsStable;
      Heading := FEvasionDegree;
    end;
  end;

  if Assigned(OnGuidanceStaleTimeReached) then
    OnGuidanceStaleTimeReached(Self, OutRunVehicle, aDeltaMs);
end;

procedure TT3Vehicle.PersonelMove(const aDeltaMs: Double);
begin
  SetOrderedSpeed(FOrderedSpeed);
//  SetOrderedHeading(FOrderedHeading);
end;

procedure TT3Vehicle.EngagementMove(const aDeltaMs: double);
begin
  if Assigned(OnGuidanceStandoffReached) then
    OnGuidanceStandoffReached(Self, EngageVehicle);

  if Assigned(OnLaunchWeaponEngagement) then
    OnLaunchWeaponEngagement(Self, EngageVehicle);

  if Assigned(OnGuidanceStaleTimeReached) then
    OnGuidanceStaleTimeReached(Self, EngageVehicle, aDeltaMs);

//  if Assigned(OnGuidance_Engage) then
//     OnGuidance_Engage(ShipPlatform, TargetPlatform, MissileID, IsHaveLaunch)
end;

procedure TT3Vehicle.UpdateVisual;
var
  pt: TPoint;
begin
  inherited;

  FPosition.X := FMover.X;
  FPosition.Y := FMover.Y;
  FPosition.Z := Altitude;

  FVectorSymbol.Course := Heading;
  FVectorSymbol.DimWidth := VehicleDefinition.FData.Width;
  FVectorSymbol.DimLength := VehicleDefinition.FData.Length;
  FVectorSymbol.CallSign1 := CallSignText(ShipTacticalInfo1);
  FVectorSymbol.CallSign2 := CallSignText(ShipTacticalInfo2);
  FVectorSymbol.CallSign3 := CallSignText(ShipTacticalInfo3);

  FTacticalSymbol.CallSign1 := CallSignText(ShipTacticalInfo1);
  FTacticalSymbol.CallSign2 := CallSignText(ShipTacticalInfo2);
  FTacticalSymbol.CallSign3 := CallSignText(ShipTacticalInfo3);

  FInfoBalloon.CallSign1 := CallSignText(ShipTacticalInfo1);
  FInfoBalloon.CallSign2 := CallSignText(ShipTacticalInfo2);
  FInfoBalloon.CallSign3 := CallSignText(ShipTacticalInfo3);

  FTacticalSymbol.SpeedVector.Course  := Heading;
//  FTacticalSymbol.SymbolBMP.FDegr := Round(Heading);
  FTacticalSymbol.SymbolVisual.FDegr := Round(Heading);

  if IsGroupLeader then
    FTacticalSymbol.SpeedVector.Speed := 90
  else 
  begin
    if (Abs(Speed) < 0.1) and (Connect3D = False) then
      FTacticalSymbol.SpeedVector.Speed := 0
    else
    begin
      FTacticalSymbol.SpeedVector.Speed := 30
    end;
  end;

  if FIsGrounded then
    FTacticalSymbol.SpeedVector.Speed := 0;

  Converter.ConvertToScreen(FPosition.X, FPosition.Y, pt.X, pt.Y);

  FVectorSymbol.Center := pt;
  FTacticalSymbol.Center := pt;
  FOwnSymbol.Center := pt;
  FInfoBalloon.Center := pt;
  FRangeLanding.Center := pt;
  FTargetVisual.Center := pt;

  FVectorSymbol.ConvertCoord(Converter);
  FTacticalSymbol.ConvertCoord(Converter);
  FOwnSymbol.ConvertCoord(Converter);
  FInfoBalloon.ConvertCoord(Converter);
  FRangeLanding.ConvertCoord(Converter);
  FTargetVisual.ConvertCoord(Converter);

  FWaypoints.ConvertCoord(Converter);
  FVHistory.ConvertCoord(Converter);

  FFormationLeader.Converter := Converter;
  FFormationLeader.ConvertCoord(Converter);

//  GetOutSet(Self, Side, Ship);
//
//  Converter.ConvertToScreen(Ship.LT.X, Ship.LT.Y, ShipPoint.LT.X, ShipPoint.LT.Y);
//  Converter.ConvertToScreen(Ship.RT.X, Ship.RT.Y, ShipPoint.RT.X, ShipPoint.RT.Y);
//  Converter.ConvertToScreen(Ship.LB.X, Ship.LB.Y, ShipPoint.LB.X, ShipPoint.LB.Y);
//  Converter.ConvertToScreen(Ship.RB.X, Ship.RB.Y, ShipPoint.RB.X, ShipPoint.RB.Y);
end;

procedure TT3Vehicle.LogisticTransferFromShipProcess(const aDeltaMs: double);
var
  fuelTrfPerSecTemp : Double;
  mlTrfPerSecTemp : Double;
  atTrfPerSecTemp : Double;
  foodTrfPerSecTemp : Double;

//  targetShipTemp : TT3Vehicle;
  supplierShipTemp : TT3Vehicle;

begin

  {$REGION ' Get Supplier Data '}
  supplierShipTemp := TT3Vehicle(FSimPlatforms.getObjectByInstanceIndex(SupplierIDLog));
  {$ENDREGION}
  if Assigned(supplierShipTemp) then
  begin
    with supplierShipTemp.UnitLogistic.FData do
    begin
      fuelTrfPerSecTemp  := aDeltams * (Fuel_TrS / 3600);
      mlTrfPerSecTemp    := aDeltams * (Lubricant_TrS / 3600);
      atTrfPerSecTemp    := aDeltams * (Freshwater_TrS / 3600);
      foodTrfPerSecTemp  := aDeltams * (Ration_TrS / 3600);
    end;

    {$REGION ' Transfer Logistic Calculation '}

//  isTransferToShip := False;
//  targetShipTemp.isTransferFromShip := False;

    {$REGION ' Untuk kebutuhan menggambar garis transfer '}
    FLogisticsLineFromShip.pointTarget.X  := supplierShipTemp.PosX;
    FLogisticsLineFromShip.pointTarget.Y  := supplierShipTemp.PosY;
    FLogisticsLineFromShip.pointSelf.X    := Self.PosX;
    FLogisticsLineFromShip.pointSelf.Y    := Self.PosY;
    FLogisticsLineFromShip.ConvertCoord(Converter);

    supplierShipTemp.FLogisticsLineFromShip.pointTarget.X  := supplierShipTemp.PosX;
    supplierShipTemp.FLogisticsLineFromShip.pointTarget.Y  := supplierShipTemp.PosY;
    supplierShipTemp.FLogisticsLineFromShip.pointSelf.X    := Self.PosX;
    supplierShipTemp.FLogisticsLineFromShip.pointSelf.Y    := Self.PosY;
    supplierShipTemp.FLogisticsLineFromShip.ConvertCoord(Converter);
    {$ENDREGION}

    {$REGION ' Feul '}
    if CekSyaratTransfer(0, supplierShipTemp, fuelTrfPerSecTemp)then
    begin
  //    isTransferToShip := True;
  //    targetShipTemp.isTransferFromShip := True;

      if (FuelTransferOrdered - fuelTrfPerSecTemp) < 0 then
        fuelTrfPerSecTemp := FuelTransferOrdered;

      FuelTransferOrdered := FuelTransferOrdered - fuelTrfPerSecTemp;

      {Mengurangi nilai logistic di kapal penyuplai}
      supplierShipTemp.FuelRemaining := supplierShipTemp.FuelRemaining - fuelTrfPerSecTemp;

      {Menambah nilai logistic di kapal yg disupplai}
      FuelRemaining := FuelRemaining + fuelTrfPerSecTemp;
    end;
    {$ENDREGION}

    {$REGION ' Lubricants '}
    if CekSyaratTransfer(1, supplierShipTemp, mlTrfPerSecTemp)then
    begin
  //    isTransferToShip := True;
  //    targetShipTemp.isTransferFromShip := True;

      if (MLTransferOrdered - mlTrfPerSecTemp) < 0 then
        mlTrfPerSecTemp := MLTransferOrdered;

      MLTransferOrdered := MLTransferOrdered - mlTrfPerSecTemp;

      {Mengurangi nilai logistic di kapal penyuplai}
      supplierShipTemp.MLRemaining := supplierShipTemp.MLRemaining - mlTrfPerSecTemp;

      {Menambah nilai logistic di kapal yg disupplai}
      MLRemaining := MLRemaining + mlTrfPerSecTemp;
    end;
    {$ENDREGION}

    {$REGION ' Fresh Water '}
    if CekSyaratTransfer(2, supplierShipTemp, atTrfPerSecTemp) then
    begin
  //    isTransferToShip := True;
  //    targetShipTemp.isTransferFromShip := True;

      if (ATTransferOrdered - atTrfPerSecTemp) < 0 then
        atTrfPerSecTemp := ATTransferOrdered;

      ATTransferOrdered := ATTransferOrdered - atTrfPerSecTemp;

      {Mengurangi nilai logistic di kapal penyuplai}
      supplierShipTemp.ATRemaining := supplierShipTemp.ATRemaining - atTrfPerSecTemp;

      {Menambah nilai logistic di kapal yg disupplai}
      ATRemaining := ATRemaining + atTrfPerSecTemp;
    end;
    {$ENDREGION}

    {$REGION ' Food '}
    if CekSyaratTransfer(3, supplierShipTemp, foodTrfPerSecTemp) then
    begin
  //    isTransferToShip := True;
  //    targetShipTemp.isTransferFromShip := True;

      if (FoodTransferOrdered - foodTrfPerSecTemp) < 0 then
        foodTrfPerSecTemp := FoodTransferOrdered;

      FoodTransferOrdered := FoodTransferOrdered - foodTrfPerSecTemp;

      {Mengurangi nilai logistic di kapal penyuplai}
      supplierShipTemp.FoodRemaining := supplierShipTemp.FoodRemaining - foodTrfPerSecTemp;

      {Menambah nilai logistic di kapal yg disupplai}
      FoodRemaining := FoodRemaining + foodTrfPerSecTemp;
    end;
    {$ENDREGION}

    {$ENDREGION}

  end;




end;

procedure TT3Vehicle.TransportMove();
var
  i : Integer;
  tempTransport    : TT3Vehicle;

begin

  {$REGION ' Merubah posisi transported sesuai posisi hosted '}
  for i := 0 to MemberTransportList.Count - 1 do
  begin
    tempTransport := TT3Vehicle(MemberTransportList.Items[i]);

    tempTransport.PosX := PosX;
    tempTransport.PosY := PosY;
    tempTransport.PosZ := PosZ;
  end;
  {$ENDREGION}

end;

function TT3Vehicle.FindT3PlatformByID(
  const id: integer): TT3PlatformInstance;
var i, c: Integer;
    pi : TT3PlatformInstance;
    f: boolean;
begin
  f := false;
  I := 0;
  c := FSimPlatforms.itemCount;
  pi := nil;

  while not f and (i < c) do
  begin
    pi := TT3PlatformInstance(FSimPlatforms.getObject(i));
    f := (pi.InstanceIndex = id);
    inc(i);
  end;

  if f then
    result := pi
  else
    result := nil;
end;

procedure TT3Vehicle.SetMemberHeading;
var
  deltaHeading : Double;
  isCW : Boolean;
begin
  isCW := False;
  deltaHeading := MemberOrderedHeading - MemberHeading;

  if deltaHeading <> 0 then
  begin
    if deltaHeading > 0 then
    begin
      if deltaHeading <= 180 then
        isCW := True
      else
        isCW := False;
    end
    else
    begin
      if deltaHeading <= -180 then
        isCW := True
      else
        isCW := False;
    end;

    if isCW then
    begin
      tempHeading := MemberHeading + 1;
      if tempHeading >= 360 then
        MemberHeading := tempHeading - 360
      else
        MemberHeading := tempHeading;
    end
    else
    begin
      tempHeading := MemberHeading - 1;
      if tempHeading < 0 then
        MemberHeading := 360 + tempHeading
      else
        MemberHeading := tempHeading;
    end;
  end
  else
  begin
    MemberHeading := MemberOrderedHeading;
  end;
end;

procedure TT3Vehicle.SetMemberPosition;
var
  angle, CosAngle, SinAngle : Double;
  Width, Length,
  HostWidth, HostLength : Single;
  tempx, tempy : Integer;
  HostShip : TT3Vehicle;
begin
  HostShip := FindT3PlatformByID(HostIdTransport) as TT3Vehicle;

  if HostShip = nil then Exit;


  HostWidth := HostShip.VehicleDefinition.FData.Width * 3;
  HostLength := HostShip.VehicleDefinition.FData.Length * 3;
  Width := VehicleDefinition.FData.Width * 3;
  Length := VehicleDefinition.FData.Length * 3;

  angle := DegToRad(90 - MemberHeading);
  CosAngle := Cos(angle);
  SinAngle := Sin(angle);
  tempx := Round(MemberSpeed * CosAngle);
  tempy := Round(MemberSpeed * SinAngle);

  if not isMemberCollision then
  begin
    MemberPosX := MemberPosX + tempx;
    MemberPosY := MemberPosY - tempy;
  end
  else
  begin
    MemberPosX := MemberPosX + (tempx * -3);
    MemberPosY := MemberPosY - (tempy * -3);
    MemberSpeed := 0;
  end;
end;

procedure TT3Vehicle.SetMemberColision;
var
  x1,x2,y1,y2,
  x3,x4,y3,y4,
  x5,x6,y5,y6,
  pos1 : Integer;
  tempfrontramp, tempsideramp: TRamp;
  HostShip : TT3Vehicle;
  HostWidth, HostLength : Single;
begin
  HostShip := FindT3PlatformByID(HostIdTransport) as TT3Vehicle;
  if HostShip <> nil then
  begin
    isInDisembarkArea := CheckDisembark(HostShip);
    isMemberCollision := CheckShapes(HostShip);
//    isInTurnTable := CheckTurnTable(HostShip);
  end;
end;


function TT3Vehicle.CheckDisembark(HostShip: TT3vehicle): Boolean;
var
  x1,x2,y1,y2,
  x3,x4,y3,y4,
  x5,x6,y5,y6,
  pos1 : Integer;
  tempfrontramp, tempsideramp: TRamp;
  HostWidth, HostLength : Integer;
begin
  HostWidth := Trunc(HostShip.UnitCapability.FData.Deck_Width * 5);
  HostLength := Trunc(HostShip.UnitCapability.FData.Deck_Length * 5);

  //Check Disembark Area
  tempfrontramp:= HostShip.RampList[0];
  tempsideramp:= HostShip.RampList[1];

  if tempfrontramp.Available then
  begin
    pos1 := 0;
    x1 := HostLength - 150;
    x2 := HostLength;
    y1 := 0;
    y2 := HostWidth;

    if tempsideramp.Available then
    begin
      x3 := 50;
      x4 := 160;
      y3 := 0;
      y4 := (HostWidth div 2) - 20;

      x5 := 50;
      x6 := 160;
      y5 := (HostWidth div 2) + 20;
      y6 := HostWidth;
    end;
  end
  else
  begin
    pos1 := 1;
    x1 := 0;
    x2 := 150;
    y1 := 0;
    y2 := HostWidth;

    if tempsideramp.Available then
    begin
      x3 := HostLength - 160;
      x4 := HostLength - 50;
      y3 := 0;
      y4 := (HostWidth div 2) - 20;

      x5 := HostLength - 160;
      x6 := HostLength - 50;
      y5 := (HostWidth div 2) + 20;
      y6 := HostWidth;
    end;
  end;

  if ((MemberPosX > x1) and (MemberPosX < x2)) and ((MemberPosY > y1) and (MemberPosY < y2)) then
  begin
    result := True;
    if pos1 = 0 then
    begin
      MemberPosDisembark := 0;
      Exit
    end
    else if pos1 = 1 then
    begin
      MemberPosDisembark := 2;
      Exit
    end;
  end;

  if tempsideramp.Available then
  begin
    if ((MemberPosX > x3) and (MemberPosX < x4)) and ((MemberPosY > y3) and (MemberPosY < y4)) then
    begin
      result := True;
      MemberPosDisembark := 3;
      Exit
    end
    else if ((MemberPosX > x5) and (MemberPosX < x6)) and ((MemberPosY > y5) and (MemberPosY < y6)) then
    begin
      result := True;
      MemberPosDisembark := 1;
      Exit
    end;
  end;

  MemberPosDisembark := 4;
  result := False;
end;

function TT3Vehicle.CheckTurnTable(HostShip: TT3vehicle): Boolean;
var
  x1,x2,y1,y2 : Integer;
  diameter : Integer;
  HostWidth, HostLength: Integer;
  tempfrontramp, tempsideramp: TRamp;
begin
  HostWidth := Trunc(HostShip.VehicleDefinition.FData.Width * 3);
  HostLength := Trunc(HostShip.VehicleDefinition.FData.Length * 3);

  tempfrontramp:= HostShip.RampList[0];
  tempsideramp:= HostShip.RampList[1];

  diameter := (HostWidth - 40);
  if diameter > 110 then diameter := 110;

  if tempfrontramp.Available then
  begin
    if tempsideramp.Available then
    begin
      x1 := 40;
      x2 := 40 + diameter;
      y1 := (HostWidth div 2) - (diameter div 2);
      y2 := (HostWidth div 2) + (diameter div 2);
    end
    else
    begin
      x1 := HostLength - 40 - diameter;
      x2 := HostLength - 40;
      y1 := (HostWidth div 2) - (diameter div 2);
      y2 := (HostWidth div 2) + (diameter div 2);
    end;
  end
  else
  begin
    if tempsideramp.Available then
    begin
      x1 := HostLength - 40 - diameter;
      x2 := HostLength - 40;
      y1 := (HostWidth div 2) - (diameter div 2);
      y2 := (HostWidth div 2) + (diameter div 2);
    end
    else
    begin
      x1 := 40;
      x2 := 40 + diameter;
      y1 := (HostWidth div 2) - (diameter div 2);
      y2 := (HostWidth div 2) + (diameter div 2);
    end;
  end;

  if ((MemberPosX > x1) and (MemberPosX < x2)) then
  begin
    if ((MemberPosY > y1) and (MemberPosY <y2)) then
    begin
      result := True;
    end
    else result := False;
  end
  else result := False;
end;

function TT3Vehicle.CheckShapes(HostShip: TT3vehicle): Boolean;
var
  i, j: Integer;
  MemberShip: TT3Vehicle;
  Width, Length, Heading,
  WidthOther, LengthOther, HeadingOther,
  HostWidth, HostLength: Integer;
  Polygon1, Polygon2: TArray<TPoint>;
  Border: TRect;
begin
  SetLength(Polygon1, 8);
  SetLength(Polygon2, 8);

  HostWidth := Trunc(HostShip.UnitCapability.FData.Deck_Width * 7);
  HostLength := Trunc(HostShip.UnitCapability.FData.Deck_Length * 7);
  Border := Rect(0,0,HostLength, HostWidth);

  Width := Trunc(VehicleDefinition.FData.Width * 3);
  Length := Trunc(VehicleDefinition.FData.Length * 3);
  Heading := Trunc(MemberHeading);
  Polygon1 := DefinePolygon(MemberPosX, MemberPosY, width, Length, Heading);
  isMemberCollision := False;

  {$REGION 'Check Collision With Border'}
  for j := Low(Polygon1) to High(Polygon1) do
  begin
    result:= PointInRectangle(Polygon1[j], Border);
    if Result then Exit;
  end;
  {$ENDREGION}

  {$REGION 'Check Collision With Other Platform'}
  for i := 0 to HostShip.MemberTransportList.Count - 1 do
  begin
    MemberShip := HostShip.MemberTransportList[i];

    if InstanceIndex = MemberShip.InstanceIndex then
    begin
      result := isMemberCollision;
      continue;
    end;

    WidthOther := Trunc(MemberShip.VehicleDefinition.FData.Width * 3);
    LengthOther := Trunc(MemberShip.VehicleDefinition.FData.Length * 3);
    HeadingOther := Trunc(MemberShip.MemberHeading);
    Polygon2 := DefinePolygon(MemberShip.MemberPosX, MemberShip.MemberPosY, WidthOther, LengthOther, HeadingOther);

    for j := Low(Polygon1) to High(Polygon1) do
    begin
      result:= PointInPolygon(Polygon1[j], Polygon2);
      if Result then Break;
    end;
    if Result then Break;
  end;
  {$ENDREGION}
end;

function TT3Vehicle.DefinePolygon(x, y, Width, Length, Heading: Integer): TArray<Tpoint>;
var
  Polygons: array [0..7] of Tpoint;
  Rad, SinAngle, CosAngle: Double;
  i: Integer;
  Center: Tpoint;
begin
  SetLength(result, 8);
  Center:= Point(X, Y);

  Rad := DegToRad(90 - Heading);
  CosAngle := Cos(Rad);
  SinAngle := Sin(Rad);

  Polygons[0].X:= X - Length div 2;
  Polygons[0].Y:= Y - Width div 2;

  Polygons[1].X:= (X + Length div 2) - (Length div 4);
  Polygons[1].Y:= Y - Width div 2;

  Polygons[2].X:= X + Length div 2; // titik depan spawn bawah
  Polygons[2].Y:= Y;

  Polygons[3].X:= (X + Length div 2) - (Length div 4);
  Polygons[3].Y:= Y + Width div 2;

  Polygons[4].X:= X - Length div 2;
  Polygons[4].Y:= Y + Width div 2;
//
  Polygons[5].X:= X - Length div 2;
  Polygons[5].Y:= Y + Width div 3;

  Polygons[6].X:= X - Length div 2;
  Polygons[6].Y:= Y;

  Polygons[7].X:= X - Length div 2;
  Polygons[7].Y:= Y - Width div 3 ;

  for i := Low(Polygons) to High(Polygons) do
  begin
    result[i]:= RotatePoint(Polygons[i], Center, CosAngle, SinAngle);
  end;
end;

function TT3Vehicle.RotatePoint(Point, Center: Tpoint; Cos, Sin: Double): Tpoint;
var
  tempPoint, RotatedPoint: TPoint;
begin
  // Step 1
  TempPoint.X := Point.X - Center.X;
  TempPoint.Y := Point.Y - Center.Y;
  // Step 2
  RotatedPoint.X := Round(TempPoint.X * Cos + TempPoint.Y * Sin);
  RotatedPoint.Y := Round(TempPoint.Y * Cos - TempPoint.X * Sin);
  // Step 3
  Result.X := RotatedPoint.X + Center.X;
  Result.Y := RotatedPoint.Y + Center.Y;
end;

function TT3Vehicle.PointInPolygon(Point: Tpoint; const Polygons: TArray<TPoint>): Boolean;
var
  rgn: HRGN;
begin
  rgn := CreatePolygonRgn(Polygons[0], Length(Polygons), WINDING);
  Result := PtInRegion(rgn, Point.X, Point.Y);
  DeleteObject(rgn);
end;

function TT3Vehicle.PointInRectangle(Point: Tpoint; const Border: TRect): Boolean;
begin
  if not PtInRect(Border, Point) then result:= True
  else Result:= False;
end;

procedure TT3Vehicle.TransportProcess(const aDeltaMs: double);
var
  i, j : Integer;

  _OnDeckList  : TList;
  _OnHullList  : TList;
  _OnPersonelList  : TList;

  tempTransport    : TT3Vehicle;

begin
  {$REGION ' Menghitung jumlah platform yg diangkut, baik di deck atau di hull '}
  _OnDeckList := TList.Create();
  _OnHullList := TList.Create();
  _OnPersonelList := TList.Create();

  for I := 0 to MemberTransportList.Count - 1 do
  begin
    tempTransport := TT3Vehicle(MemberTransportList.Items[i]);

    if tempTransport.PlatformDomain = vhdAir then
    begin
      {$REGION ' Air Section '}
      _OnDeckList.Add(tempTransport);
      {$ENDREGION}
    end
    else if (tempTransport.PlatformDomain =  vhdLand) and (tempTransport.PlatformCategory =  2) and (tempTransport.PlatformType =  0) then
    begin
      {$REGION ' Personel Section '}
      _OnPersonelList.Add(tempTransport);
      {$ENDREGION}
    end
    else
    begin
      {$REGION ' Other Section '}
      _OnHullList.Add(tempTransport);
      {$ENDREGION}
    end;
  end;
  {$ENDREGION}

  {$REGION ' Hanggar/ Deck Proses '}
//  for I := 0 to _OnDeckList.Count - 1 do
//  begin
//    _Transported := TT3TransportedInstance(_OnDeckList.Items[i]);
//
//    case TTransportedStatus(_Transported.Status) of
//
//      {$REGION ' Embark Process Section : disini perhitungan readying time dilakukan '}
//      tsEmbarkProcess :
//      begin
//        _Transported.Run(aDeltaMs);
//        Break;
//      end;
//      {$ENDREGION}
//
//      {$REGION ' Queue Section : Jk tdk ada kapal lain yg sedang diproses, maka status kapal queue langsung berubah ke embark proses '}
//      tsQueue :
//      begin
//        _Transported.Status := integer(tsEmbarkProcess);
//        UpdateStatus := True;
//        Break;
//      end;
//      tsStandby, tsReady :
//      begin
//        {$REGION ' Standby/ Ready Section : platform terakhir yg berstatus standby akan berubah menjadi ready '}
//        if i = _OnDeckList.Count - 1  then
//        begin
//          if TTransportedStatus(_Transported.Status) <> tsReady then
//          begin
//            UpdateStatus := True;
//            _Transported.Status := integer(tsReady);
//          end;
//        end
//        else
//        begin
//          if TTransportedStatus(_Transported.Status) <> tsStandby then
//          begin
//            UpdateStatus:= True;
//            _Transported.Status := integer(tsStandby);
//          end;
//        end;
//        {$ENDREGION}
//      end;
//      {$ENDREGION}
//
//    end;
//  end;
  {$ENDREGION}

  {$REGION ' Personel Proses '}
//  for I := 0 to _OnPersonelList.Count - 1 do
//  begin
//    _Transported := TT3TransportedInstance(_OnPersonelList.Items[i]);
//
//    case TTransportedStatus(_Transported.Status) of
//
//      {$REGION ' Embark Process Section : disini perhitungan readying time dilakukan '}
//      tsEmbarkProcess :
//      begin
//        _Transported.Run(aDeltaMs);
//        Break;
//      end;
//      {$ENDREGION}
//
//      {$REGION ' Queue Section : Jk tdk ada kapal lain yg sedang diproses, maka status kapal queue langsung berubah ke embark proses '}
//      tsQueue :
//      begin
//        _Transported.Status := integer(tsEmbarkProcess);
//        UpdateStatus := True;
//        Break;
//      end;
//      {$ENDREGION}
//
//      {$REGION ' Standby/ Ready Section : platform terakhir yg berstatus standby akan berubah menjadi ready '}
//      tsStandby, tsReady :
//      begin
//        if i = _OnPersonelList.Count - 1  then
//        begin
//          if TTransportedStatus(_Transported.Status) <> tsReady then
//          begin
//            UpdateStatus := True;
//            _Transported.Status := integer(tsReady);
//          end;
//        end
//        else
//        begin
//          if TTransportedStatus(_Transported.Status) <> tsStandby then
//          begin
//            UpdateStatus:= True;
//            _Transported.Status := integer(tsStandby);
//          end;
//        end;
//      end;
//      {$ENDREGION}
//
//    end;
//  end;
  {$ENDREGION}

  {$REGION ' Hull Proses '}
//  for I := 0 to _OnHullList.Count - 1 do
//  begin
//    _Transported := TT3TransportedInstance(_OnHullList.Items[i]);
//
//    case TTransportedStatus(_Transported.Status) of
//
//      {$REGION ' Embark Process Section : disini perhitungan readying time dilakukan '}
//      tsEmbarkProcess :
//      begin
//        _Transported.Run(aDeltaMs);
//        Break;
//      end;
//      {$ENDREGION}
//
//      {$REGION ' Queue Section : Jk tdk ada kapal lain yg sedang diproses, maka status kapal queue langsung berubah ke embark proses '}
//      tsQueue :
//      begin
//        _Transported.Status := integer(tsEmbarkProcess);
//        UpdateStatus := True;
//        Break;
//      end;
//      {$ENDREGION}
//
//      {$REGION ' Standby/ Ready Section : platform terakhir yg berstatus standby akan berubah menjadi ready '}
//      tsStandby :
//      begin
//        if i = _OnHullList.Count - 1  then
//        begin
//          _Transported.Status := integer(tsReady);
//          UpdateStatus := True;
//        end
//      end;
//      tsReady :
//      begin
//        if i <> _OnHullList.Count - 1  then
//        begin
//          _Transported.Status := integer(tsStandby);
//          UpdateStatus:= True;
//        end
//      end;
//      {$ENDREGION}
//
//    end;
//  end;
  {$ENDREGION}

  _OnDeckList.Free;
  _OnHullList.Free;
  _OnPersonelList.Free;
end;

procedure TT3Vehicle.LogisticTransferFromBaseProcess(const aDeltaMs: double);
var
  FuelTrfPerSecond, MLTrfPerSecond,
  ATTrfPerSecond, WaterTrfPerSecond,
  FoodTrfPerSecond : Double;

  _Range : Double;

begin

  FuelTrfPerSecond  := aDeltams * (35 / 3600);
  MLTrfPerSecond    := aDeltams * (35 / 3600);
  ATTrfPerSecond    := aDeltams * (35 / 3600);
  FoodTrfPerSecond  := aDeltams * (35 / 3600);

  isTransferFromBase := False;

  {untuk kebutuhan menggambar garis transfer}
  FLogisticsLineFromBase.pointTarget.X := BaseLong;
  FLogisticsLineFromBase.pointTarget.Y := BaseLatt;
  FLogisticsLineFromBase.pointSelf.X := Self.PosX;
  FLogisticsLineFromBase.pointSelf.Y := Self.PosY;
  FLogisticsLineFromBase.ConvertCoord(Converter);

  _Range := CalcRange(PosX, PosY, BaseLong, BaseLatt);

  if _Range >  BaseRadius then
    Exit;

  {Feul}
  if FuelTransferOrdered > 0 then
  begin
    isTransferFromBase := True;

    if (FuelTransferOrdered - FuelTrfPerSecond) < 0 then
      FuelTrfPerSecond := FuelTransferOrdered;

    FuelTransferOrdered := FuelTransferOrdered - FuelTrfPerSecond;
    FuelRemaining := FuelRemaining + FuelTrfPerSecond;
  end;

  {Lubricants}
  if MLTransferOrdered > 0 then
  begin
    isTransferFromBase := True;

    if (MLTransferOrdered - MLTrfPerSecond) < 0 then
      MLTrfPerSecond := MLTransferOrdered;

    MLTransferOrdered := MLTransferOrdered - MLTrfPerSecond;
    MLRemaining := MLRemaining + MLTrfPerSecond;

  end;

  {Fresh Water}
  if ATTransferOrdered > 0 then
  begin
    isTransferFromBase := True;

    if (ATTransferOrdered - ATTrfPerSecond) < 0 then
      ATTrfPerSecond := ATTransferOrdered;

    ATTransferOrdered := ATTransferOrdered - ATTrfPerSecond;
    ATRemaining := ATRemaining + ATTrfPerSecond;
  end;

  {Food}
  if FoodTransferOrdered > 0 then
  begin
    isTransferFromBase := True;

    if (FoodTransferOrdered - FoodTrfPerSecond) < 0 then
      FoodTrfPerSecond := FoodTransferOrdered;

    FoodTransferOrdered := FoodTransferOrdered - FoodTrfPerSecond;
    FoodRemaining := FoodRemaining + FoodTrfPerSecond;
  end;
end;

function TT3Vehicle.CallSignText(info: String): String;
var
  separatorPos : Integer;
begin
  if info = C_TacticalInfos[0] then       //Empty
    Result := ''
  else if info = C_TacticalInfos[1] then  //Class
  begin
    if FDormant then
    begin
      Result := FormatDateTime('hhmmss', TimeOf(FDormantCounter / (3600*24)));
    end
    else
    begin
      separatorPos := AnsiPos(' - ', InstanceClass);

      if separatorPos = 0 then
        Result := InstanceClass
      else
        Result := Copy(InstanceClass, separatorPos + 3, Length(InstanceClass));
    end;
  end
  else if info = C_TacticalInfos[2] then  //Track ID/Number
  begin
    if FDormant then
    begin
      Result := FormatDateTime('hhmmss', TimeOf(FDormantCounter / (3600*24)));
    end
    else
    begin
      if isInstructor or isWasdal then
        Result := Track_ID
      else
        Result := IntToStr(TrackNumber);
    end;
  end
  else if info = C_TacticalInfos[3] then  //Speed
  begin
    if FDormant then
    begin
      Result := FormatDateTime('hhmmss', TimeOf(FDormantCounter / (3600*24)));
    end
    else
    begin
      Result := Format('%.1f',[Speed])
    end;
  end
  else if info = C_TacticalInfos[4] then  //Course
  begin
    if FDormant then
    begin
      Result := FormatDateTime('hhmmss', TimeOf(FDormantCounter / (3600*24)));
    end
    else
    begin
      Result := Format('%.1f',[Course])
    end;
  end
  else if info = C_TacticalInfos[5] then //altitude
  begin
    if FDormant then
    begin
      Result := FormatDateTime('hhmmss', TimeOf(FDormantCounter / (3600*24)));
    end
    else
    begin
      Result := Format('%.1f',[Altitude])
    end;
  end
  else if info = C_TacticalInfos[6] then  //Fuel
  begin
    if FDormant then
    begin
      Result := FormatDateTime('hhmmss', TimeOf(FDormantCounter / (3600*24)));
    end
    else
    begin
      Result := Format('%.1f',[FuelRemaining])
    end;
  end
  else if info = C_TacticalInfos[7] then  //Lubricants
  begin
    if FDormant then
    begin
      Result := FormatDateTime('hhmmss', TimeOf(FDormantCounter / (3600*24)));
    end
    else
    begin
      Result := Format('%.1f',[MLRemaining])
    end;
  end
  else if info = C_TacticalInfos[8] then  //Freshwater
  begin
    if FDormant then
    begin
      Result := FormatDateTime('hhmmss', TimeOf(FDormantCounter / (3600*24)));
    end
    else
    begin
      Result := Format('%.1f',[ATRemaining])
    end;
  end
  else if info = C_TacticalInfos[9] then  //Food
  begin
    if FDormant then
    begin
      Result := FormatDateTime('hhmmss', TimeOf(FDormantCounter / (3600*24)));
    end
    else
    begin
      Result := Format('%.1f',[FoodRemaining])
    end;
  end
  else if info = C_TacticalInfos[10] then  //Water
  begin
    if FDormant then
    begin
      Result := FormatDateTime('hhmmss', TimeOf(FDormantCounter / (3600*24)));
    end
    else
    begin
      Result := Format('%.1f',[WaterRemaining])
    end;
  end
  else
    Result := '';
end;

function TT3Vehicle.cekCollision: Boolean;
var
  i : Integer;
  simObj : TSimObject;
  obj1, obj2 : TT3Vehicle;
  ptLT1, ptRT1, ptLB1, ptRB1,
  ptLT2, ptRT2, ptLB2, ptRB2: t2DPoint;
  Side1, Side2 : tOutSide{TRect};
  Ship1, Ship2: tPointOutSide;

  PointShip : t2DPoint; // Point
  l, r : Double;
begin
  Result := False;

  TrackCollision := nil;
  GetOutSet(Self, Side1, Ship1);

  for i:= 0 to FSimPlatforms.itemCount - 1 do
  begin
    simObj := FSimPlatforms.getObject(i);

    if simObj is TT3Vehicle then
    begin
      obj2 := TT3Vehicle(simObj);
      obj2.GetOutSet(obj2, Side2, Ship2);

      if InstanceIndex <> obj2.InstanceIndex then
      begin
        if obj2.StateTransport then
          Break;

        if Abs(Altitude - obj2.Altitude) < 1 then
        begin
          if (PlatformDomain <> vhdLand) and (obj2.PlatformDomain <> vhdLand) then
          begin
            l := self.VehicleDefinition.FData.Length/ C_NauticalMile_To_Feet;
            r := CalcRange(Self.PosX, Self.PosY, obj2.PosX, obj2.PosY);

            if PointInPoligonLangLot(Ship1.LT, Ship2.LB, Ship2.LT, Ship2.RT, Ship2.RB) or
               PointInPoligonLangLot(Ship1.RT, Ship2.LB, Ship2.LT, Ship2.RT, Ship2.RB) or
               PointInPoligonLangLot(Ship1.RB, Ship2.LB, Ship2.LT, Ship2.RT, Ship2.RB) or
               PointInPoligonLangLot(Ship1.LB, Ship2.LB, Ship2.LT, Ship2.RT, Ship2.RB) then
            begin
              TrackCollision := obj2;
              Result := True;
              Break;
            end;

            if PointInPoligonLangLot(Ship2.LT, Ship1.LB, Ship1.LT, Ship1.RT, Ship1.RB) or
               PointInPoligonLangLot(Ship2.RT, Ship1.LB, Ship1.LT, Ship1.RT, Ship1.RB) or
               PointInPoligonLangLot(Ship2.RB, Ship1.LB, Ship1.LT, Ship1.RT, Ship1.RB) or
               PointInPoligonLangLot(Ship2.LB, Ship1.LB, Ship1.LT, Ship1.RT, Ship1.RB) then
            begin
              TrackCollision := obj2;
              Result := True;
              Break;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TT3Vehicle.cekDisembarkProses: Boolean;
var
  papi : TT3Vehicle;
  l, r : Double;
begin
  Result := False;

  if DisEmbarkProsess then
  begin
    Result := True;

    papi := TT3Vehicle(FSimPlatforms.getObjectByInstanceIndex(HostIdTransport));

    if not Assigned(papi) then
      Exit;

    l := (papi.VehicleDefinition.FData.Length/ C_NauticalMile_To_Feet)* 0.6;
    r := CalcRange(Self.PosX, Self.PosY, papi.PosX, papi.PosY);
    if r > l then
    begin
      DisEmbarkProsess := False;
      Result := False;
    end;
  end;
end;

procedure TT3Vehicle.CekLandanDepth(x, y: Double);
var
  recMap: TRec_MapData;
begin
  recMap.PlatformID := Self.InstanceIndex;

  if Assigned(FOnCekLandandDepth) then
    FOnCekLandandDepth(x, y, recMap);
end;

function TT3Vehicle.CekSyaratTransfer(id: integer; supplierShip : TT3Vehicle; TrfPerSecond: Double): Boolean;
var
  JrkKapal : Double;

begin
  result := False;

  JrkKapal := CalcRange(PosX, PosY, supplierShip.PosX, supplierShip.PosY);

  {jarak antar kapal 0.1 nm}
  if JrkKapal >  0.1 then
    Exit;

  case id of
    0 : {Fuel}
    begin
      if (supplierShip.FuelRemaining - TrfPerSecond) > 0 then
      begin
        if FuelTransferOrdered > 0 then
          result := True
      end;
    end;
    1 : {Lubricant}
    begin
      if (supplierShip.MLRemaining - TrfPerSecond) > 0 then
      begin
        if MLTransferOrdered > 0 then
          result := True
      end;
    end;
    2 : {Fresh Water}
    begin
      if (supplierShip.ATRemaining - TrfPerSecond) > 0 then
      begin
        if ATTransferOrdered > 0 then
          result := True
      end;
    end;
    3 : {Food}
    begin
      if (supplierShip.FoodRemaining - TrfPerSecond) > 0 then
      begin
        if FoodTransferOrdered > 0 then
          result := True
      end;
    end;
  end;
end;

procedure TT3Vehicle.CircleMove(const aDeltaMs: Double);
const
  C_KnotsToMeterPerSecond = 0.5144444;
  phi = Pi;//22/7;
var
  dist_to_turn,
  distance,
  heading_now,bearing_now,
  X_center,Y_center : Double;
begin
  if (Circle_mode = cModeTrack) and not Assigned(CircleTrack) then
  begin
    SetOrderedHeading(FOrderedHeading);
    Exit;
  end;

  if Assigned(CircleTrack) then
  begin
    if TT3Vehicle(CircleTrack).FHeadingState <> mcsStable then
    begin
//      Circle_state := cstateStraight;
    end;
  end;
  //else exit;

  if Circle_mode = cModePosition then
  begin
    if (CenterCirclePointX = 0) and (CenterCirclePointY = 0) then
    begin
      SetOrderedHeading(OrderedHeading);
      Exit;
    end;
    X_center  := CenterCirclePointX;
    Y_center  := CenterCirclePointY;
  end
  else if Circle_mode = cModeTrack then
  begin
    bearing_now := 0;

    if Circle_bearing_state = cBearingRelative then
    begin
      bearing_now := CircleTrack.Course + CircleBearing;
      if bearing_now > 360 then
        bearing_now := bearing_now - 360;
    end
    else
    if Circle_bearing_state = cBearingTrue then
      bearing_now := CircleBearing;

    if (ShadowDistance = 0) and (CircleBearing = 0) then
    begin
      X_center  := CircleTrack.PosX;
      Y_center  := CircleTrack.PosY;
    end
    else
      CalcForward(CircleTrack.PosX, CircleTrack.PosY, CircleRange, bearing_now, X_center, Y_center);
  end;

  distance := CalcRange(PosX, PosY, X_center,Y_center);
  if Circle_state = cstateStraight then
  begin
    dist_to_turn := 0.5;
    if Assigned(UnitMotion) then
    begin
      if UnitMotion.FData.Standard_Turn_Rate <> 0 then
      begin
        //calcute the distance to turn
        dist_to_turn := ((Speed*C_KnotsToMeterPerSecond) * (90/Abs(UnitMotion.FData.Standard_Turn_Rate))) *C_Meter_To_NauticalMile;
        dist_to_turn := (2*dist_to_turn)/phi;
        // biar pas kalau radius 1
//        if CircleRadius < 2 then
//          dist_to_turn := dist_to_turn - 0.1;
      end;
    end;
    if (Abs(distance - CircleRadius) > dist_to_turn) then
    begin
      if distance < CircleRadius then
        OrderedHeading := CalcBearing(X_center,Y_center, PosX, PosY)
      else OrderedHeading := CalcBearing(PosX, PosY, X_center,Y_center);
    end
    else
    begin
      Circle_state := cstateCircle;
    end;
  end
  else if Circle_state = cstateCircle then
  begin
    SetOrderedHeading(FOrderedHeading);
    if FOrderedHeadingAchieved then
    begin
      heading_now := CalcBearing(X_center,Y_center, PosX, PosY) + CircleDirection;
      if CircleDirection > 0 then    //clockwise
      begin
        if heading_now > 360 then
          heading_now := heading_now - 360;
      end                            //counter-clockwise
      else if heading_now < 0 then
        heading_now := heading_now + 360;

      FOrderedHeading := heading_now;
      LastHeading     := FOrderedHeading;
    end;

    if Abs(CalcRange(PosX, PosY, X_center,Y_center) - CircleRadius) >= 0.1 then
    begin
      Circle_state := cstateStraight;
    end;
  end;
end;

procedure TT3Vehicle.CollisionProcess;
var
  collisionTemp : Boolean;
begin
  if self is TT3NonRealVehicle then
    exit;

  if cekDisembarkProses then
    exit;

  {$IFDEF SERVER}
  if Assigned(OnCollision) then
  begin
    collisionTemp := cekCollision;

    if isCollision <> collisionTemp then
    begin
      isCollision := collisionTemp;
      OnCollision(self, self.TrackCollision, collisionTemp);
    end;
  end;
  {$ENDIF}
end;

procedure TT3Vehicle.HelmMove(const aDeltaMs: Double);
begin
  if FOrderedHeading = 0 then
    SetOrderedHeading(Round(Heading))
  else
    SetOrderedHeading(FOrderedHeading);

  if FOrderedHeadingAchieved then
  begin
    FOrderedHeading := FOrderedHeading + HelmDegree;
    if FOrderedHeading > 360 then
      FOrderedHeading := FOrderedHeading - 360;

    LastHeading     := FOrderedHeading;
  end;
end;

procedure TT3Vehicle.WaypointMove(const aDeltaMs: double);
var
  bearing : double;
begin
  if not Waypoints.Enabled then Exit;
  if not Assigned(Waypoints.NextWaypoint) then Exit;

  with Waypoints.NextWaypoint do
  begin
    bearing := CalcBearing(getPositionX, getPositionY, FData.Waypoint_Longitude,
      FData.Waypoint_Latitude);

    if FData.Speed < 0 then
      bearing := ValidateDegree(bearing + 180);

    SetOrderedHeading(bearing);

    {$IFDEF SERVER}
    FCounterUpdateWaypoint := FCounterUpdateWaypoint + aDeltaMs;

    if FCounterUpdateWaypoint > FDelayUpdateWaypoint then
    begin
      if GameSpeed <= 1.0 then
      begin
        if Assigned(Waypoints.OnNextWaypointChangeTo3D) then
          Waypoints.OnNextWaypointChangeTo3D(Waypoints.NextNodeID, InstanceIndex,
                      FData.Speed, bearing, FData.Altitude, FData.Waypoint_Longitude,
                      FData.Waypoint_Latitude);
      end;
      FCounterUpdateWaypoint := 0;
    end;
    {$ENDIF}
  end;

  //SetOrderedHeading(FOrderedHeading);
  {$IFDEF SERVER}
  Waypoints.CheckWaypointReach(aDeltaMs);
  {$ENDIF}

  Waypoints.DoContinousEvent; //To Execute Event like Sonobuoy, Mine and Countermeasure
end;

procedure TT3Vehicle.ZigzagMove(const aDeltaMs: double);
var
  Degree, Length_Zigzag : Double;
  lengthDistance : Double;
begin
  GetAngleAndDistanceZigzag(OrderedZigzag, FPeriodZigzag, FAmplitudoZigzag,
                            Length_Zigzag, Degree);

  if isFirstZigzag then
  begin
    SetOrderedHeading(FOrderedZigzag - Degree);

    if FOrderedHeadingAchieved then
    begin
      if not isStartZigzag then
      begin
        temp_PosX := getPositionX;
        temp_PosY := getPositionY;
      end;

      isStartZigzag := True;

      if CalcRange(getPositionX, getPositionY, temp_PosX, temp_PosY) > (0.5*Length_Zigzag)then
      begin
         isFirstZigzag := False;
         isStartZigzag := False;

         isLeftZigzag  := False;
         isRightZigzag := True;
      end;
    end;
  end
  else
  if isRightZigzag then
  begin
    SetOrderedHeading(FOrderedZigzag + Degree);

    if FOrderedHeadingAchieved then
    begin
      if not isStartZigzag then
      begin
        temp_PosX := getPositionX;
        temp_PosY := getPositionY;
      end;

      isStartZigzag := True;

      lengthDistance := CalcRange(getPositionX, getPositionY, temp_PosX, temp_PosY);
      if lengthDistance > Length_Zigzag then
      begin
         isFirstZigzag := False;
         isStartZigzag := False;

         isLeftZigzag  := True;
         isRightZigzag := False;
      end;
    end;
  end
  else
  if isLeftZigzag then
  begin
    SetOrderedHeading(FOrderedZigzag - Degree);

    if FOrderedHeadingAchieved then
    begin
      if not isStartZigzag then
      begin
        temp_PosX := getPositionX;
        temp_PosY := getPositionY;
      end;

      isStartZigzag := True;

      lengthDistance := CalcRange(getPositionX, getPositionY, temp_PosX, temp_PosY);
      if lengthDistance > Length_Zigzag then
      begin
         isFirstZigzag := False;
         isStartZigzag := False;

         isLeftZigzag  := False;
         isRightZigzag := True;
      end;
    end;
  end;
end;


procedure TT3Vehicle.ShadowMove(const aDeltaMs: Double);
var
  ShadowHeading : Double;
  shadowPointX, shadowPointY : Double;
  shadowedVehicleCourse : Double;
  dist : Double;
  distBehind : Double;
begin
  if not Assigned(ShadowedVehicle) then
    Exit;

  //set default if distance = 0
  if ShadowDistance = 0 then
    ShadowDistance := 1;

//  shadowedVehicleCourse := ShadowedVehicle.Course + 180;
  shadowedVehicleCourse := ShadowedVehicle.Heading + 180;
  if shadowedVehicleCourse > 360 then
    shadowedVehicleCourse := shadowedVehicleCourse - 360;

  CalcForward(ShadowedVehicle.PosX, ShadowedVehicle.PosY, ShadowDistance, shadowedVehicleCourse, shadowPointX, shadowPointY);


  dist := CalcRange(PosX, PosY, ShadowedVehicle.PosX, ShadowedVehicle.PosY);
  distBehind := CalcRange(PosX, PosY, shadowPointX, shadowPointY);

  if (Abs(dist - ShadowDistance) <= 0.3) or (distBehind <= 0.3) then
  begin
    //velocity := ShadowedVehicle.Speed;
    {jika telah masuk range dia langsung mengarah ke Shadowed Kapal...}
    shadowPointX := ShadowedVehicle.PosX;
    shadowPointY := ShadowedVehicle.PosY;
  end;

  {
  if OrderedSpeed <> velocity then
    SetOrderedSpeed(velocity);
  }

  ShadowHeading := CalcBearing(PosX, PosY, shadowPointX, shadowPointY);

  OrderedHeading := ShadowHeading;

//  FDeltaHead := getDeltaH(FOrderedHeading, Course);
  FDeltaHead := getDeltaH(FOrderedHeading, Heading);
  if (FHeadingState = mcsDecrease) then
  begin
    if FDeltaHead <= 0  then begin
      FMover.TurnRate := 0.0;
      FHeadingState := mcsStable;
//      Course := FOrderedHeading;
      Heading := FOrderedHeading;
      //SetOrderedSpeed(Mover.MaxSpeed);
    end;
  end
  else if (FHeadingState = mcsIncrease) then
  begin
    // turn left
    if FDeltaHead >= 0  then begin
      FMover.TurnRate := 0.0;
      FHeadingState := mcsStable;
//      Course := FOrderedHeading;
      Heading := FOrderedHeading;
      //SetOrderedSpeed(Mover.MaxSpeed);
    end;
  end;

  //choco : mengembalikan guidance ke Straight Line jika target yang di track
  //tidak terdeteksi selama waktu yang ditentukan pada GameDefault - Tab Track
  if Assigned(OnGuidanceStaleTimeReached) then
    OnGuidanceStaleTimeReached(Self, ShadowedVehicle, aDeltaMs);
end;

procedure TT3Vehicle.StationMove(const aDeltaMs: Double);
//const
  //C_KnotsToMS= 0.5144444;
var
  Xcenter,Ycenter : Double;
  dist_to_slow, time_to_stop, dist : double;
  bearing_now, speed_now : Double;
begin
{
  perhitungan GLBB, sesuai dengan decelaration masing2 vehicle.
  speed ketika berhenti = 0, tp garis course msh ada (utk mempertahankan posisinya).
}

  if Abs(Speed) <= FOrderedSpeed then
    speed_now := Speed
  else speed_now := UnitMotion.FData.Max_Ground_Speed;

  //calculate time for stopping
  time_to_stop := speed_now / UnitMotion.FData.Deceleration;
  //calculate distance to decelerate (GLBB)
  dist_to_slow := (((speed_now/C_MS_To_KNOTS) * time_to_stop) -
      ((UnitMotion.FData.Deceleration/C_MS_To_KNOTS)*Sqr(time_to_stop)/2)) * C_Meter_To_NauticalMile;

  case StationMode of
    cModePosition:
    begin
      SetOrderedHeading(OrderedHeading);

      if (lastStationPointX <> StationPostX) and (lastStationPointY <> StationPostY) then
      begin
        Xcenter := StationPostX;
        Ycenter := StationPostY;
        dist := CalcRange(Xcenter, Ycenter, PosX, PosY);

        if (Xcenter <> 0) and (Ycenter <> 0) then
        begin
          if dist > dist_to_slow then
          begin
            OrderedHeading  := CalcBearing(PosX, PosY, Xcenter, Ycenter);
            OrderedSpeed := UnitMotion.FData.Max_Ground_Speed;

  //          if StationStopStatus then
  //          begin
  //            if Assigned(OnGuidanceStationReached) then
  //              OnGuidanceStationReached(Self, False);
  //          end;
          end
          else
          begin
            OrderedSpeed := 0;
            SetOrderedHeading(OrderedHeading);

            lastStationPointX := Xcenter;
            lastStationPointY := Ycenter;

  //            if not(StationStopStatus) then
  //            begin
  //              if Assigned(OnGuidanceStationUpdateSpeed) then
  //                OnGuidanceStationUpdateSpeed(Self, 0);

  //              if Assigned(OnGuidanceStationUpdateHeading) then
  //                OnGuidanceStationUpdateHeading(Self, OrderedHeading);

  //              if Assigned(OnGuidanceStationReached) then
  //                OnGuidanceStationReached(Self, True);
  //            end;
          end;
        end;
      end;
    end;
    cModeTrack:
    begin
      if not Assigned(StationTrack) then
        Exit;

      bearing_now := 0;

      if StationBearing_state = cBearingRelative then
      begin
        bearing_now := StationTrack.Course + StationBearing;
        if bearing_now > 360 then
          bearing_now := bearing_now - 360;
      end
      else
      if StationBearing_state = cBearingTrue then
        bearing_now := StationBearing;

      if (StationRange = 0) and (StationBearing = 0) then
      begin
        Xcenter  := StationTrack.PosX;
        Ycenter  := StationTrack.PosY;
      end
      else
        CalcForward(StationTrack.PosX, StationTrack.PosY, StationRange,
                    bearing_now, Xcenter, Ycenter);

      if (Xcenter <> 0) and (Ycenter <> 0) then
      begin
        dist := CalcRange(Xcenter, Ycenter, PosX, PosY);

        if StationTrack.Speed = 0 then
        begin
          SetOrderedHeading(OrderedHeading);

          if (lastStationPointX <> Xcenter) and (lastStationPointY <> Ycenter) then
          begin
            if dist > dist_to_slow then
            begin
              OrderedHeading  := CalcBearing(PosX, PosY, Xcenter, Ycenter);
              OrderedSpeed := UnitMotion.FData.Max_Ground_Speed;
            end
            else
            begin
              OrderedSpeed := 0;
              SetOrderedHeading(OrderedHeading);

              lastStationPointX := Xcenter;
              lastStationPointY := Ycenter;
            end;
          end;
        end else
        begin
          if dist > dist_to_slow then
          begin
            OrderedSpeed    := UnitMotion.FData.Max_Ground_Speed;
            OrderedHeading  := CalcBearing(PosX, PosY, Xcenter, Ycenter);
          end
          else
          begin
            if dist < 0.05 then
            begin
              OrderedSpeed   := StationTrack.Speed;
              OrderedHeading := StationTrack.Heading;
            end
            else
            begin
              OrderedSpeed := StationTrack.Speed;
              SetOrderedHeading(OrderedHeading);
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TT3Vehicle.FormationMove(const aDeltaMs: Double);
var
    BearingLead,
    SpeedSet, HeadingSet, rangeq : Double;
    ptForm, ptLead, ptShip, ptNewPos : t2DPoint;

    objToCrash : TT3Vehicle;
    KuadrantPt : Integer;
begin
  if Assigned(LeaderPlatform) and FormationModeActive then
  begin
    if isCollision then
      Exit;

    if isFormationLeader then
      Exit;

    {Prince}
    ptLead.X := LeaderPlatform.PosX;
    ptLead.Y := LeaderPlatform.PosY;
    ptShip.X := PosX;
    ptShip.Y := PosY;

    if FormationState = 0 then
      BearingLead := ValidateDegree(LeaderPlatform.heading + FormationBearing)
    else
      BearingLead := FormationBearing;

    {Mencari titik dlm formasi : ptForm}
    FindPoint(ptLead, ptForm, FormationRange, BearingLead);

    {Mencari range, bearing, n kuadran titik dlm formasi : RangeToFormation, BearingToFormation n KuadrantPt}
    CalcKuadranPt(ptShip, ptForm, Heading, RangeToFormation, BearingToFormation, KuadrantPt);

    {Mencari Speed : speedset}
    SetSpeedToFormation(KuadrantPt, SpeedSet);

    if (ptForm.X = 0) or (ptForm.Y = 0) then
      Exit;

    {Jk heading leader belum fix}
    if LeaderPlatform.Heading <>  TT3Vehicle(LeaderPlatform).OrderedHeading then
    begin
      TempHeading := 720;
      TempSpeed := 720;
      Exit;
    end;

    FCounter := FCounter + 0.01;
    if FCounter >= 5 then
    begin
      FCounter := 0;

      if RangeToFormation > 0.05 then
      begin
        if KuadrantPt <> 2 then
        begin
          RangeToPt := 0.05;

          FindPoint(ptShip , ptNewPos, RangeToPt, BearingToFormation );
          TempRange := RangeToFormation-RangeToPt;

          if TempRange < 0 then
          begin
            OnChangePosition(Self, 1, ptForm.X, ptForm.Y);
            Exit;
          end;

          if (abs (Round(tempHeading - BearingToFormation)) > 1) and (Round(TempSpeed) <> SpeedSet) then
            OnChangePosition(Self, 0, ptNewPos.X, ptNewPos.Y);
        end
        else
        begin
          TempFlag := TempFlag + 1;
          if TempFlag < 3 then
            Exit;;
        end;

        if abs (Round(tempHeading - BearingToFormation)) > 1 then
        begin
          OnChangeHeading(Self, CORD_TYPE_COURSE, Round(BearingToFormation));
//          tempHeading := BearingToFormation;
        end;

        if Round(TempSpeed) <> SpeedSet then
        begin
          OnChangeHeading(Self, CORD_TYPE_SPEED, SpeedSet);
//          TempSpeed := SpeedSet;
        end;

        TempFlag := 2;
      end
      else
      begin
        TempFlag := TempFlag + 1;
        if TempFlag > 2 then
        begin
          if (abs (Round(tempHeading - BearingToFormation)) > 1) and (Round(TempSpeed) <> LeaderPlatform.Speed) then
            OnChangePosition(Self, 1, ptForm.X, ptForm.Y);

          TempFlag := 0;
          Exit;
        end;
      end;
    end
  end;

  if Assigned(LeaderPlatform) then
  begin
    if LeaderPlatform.FreeMe then
    begin
      LeaderPlatform := nil;
      VehicleDefinition.GuidanceType := vgtStraightLine;
    end;
  end;
end;

procedure TT3Vehicle.ReturnToBaseMove(const aDeltaMs: Double);
const
  C_KnotsToMS= 0.5144444;
var
  //parentHeading : Double;
  parentPointX, parentPointY : Double;
  dist,dist_to_turn,circ_counter,heading_now : Double;
  fw : Double;
  vParent : TT3Vehicle;
  headingTmp, ax, ay : double;
begin
  if isLandingFinish then exit;

  vParent := nil;

  if not Assigned(BaseVehicle) then
    Exit;

  if Assigned(BaseVehicle) then
  begin
    if BaseVehicle is TT3Vehicle then
    begin
      vParent := BaseVehicle as TT3Vehicle;
    end;
  end;

  if Assigned(vParent) then
  begin
    dist := CalcRange(PosX, PosY, vParent.PosX, vParent.PosY);

    dist_to_turn := 0.1;
    if Assigned(UnitMotion) then
    begin
      if UnitMotion.FData.Standard_Turn_Rate <> 0 then
      begin
        //update dist_to_turn
        dist_to_turn := 0.1 + ((Speed*C_KnotsToMS) * (90/Abs(UnitMotion.FData.Standard_Turn_Rate))) *C_Meter_To_NauticalMile;
      end;
    end;

    parentPointX := vParent.PosX;
    parentPointY := vParent.PosY;

    if TrackDomain = vhdAir then
    begin
      fw := vParent.Heading + 180;
      if fw > 360 then
        fw := fw - 360;
    end
    else
      fw := vParent.Heading;

    CalcForward(vParent.PosX, vParent.PosY, dist_to_turn, fw, parentPointX, parentPointY);

    if isTimeToCircle then
    begin
      if isAfterCircle then
      begin
        if (CalcRange(PosX, PosY, vParent.PosX, vParent.PosY) < 0.05) then
        begin
          if TrackDomain = vhdAir then
          begin
            OrderedHeading := vParent.Heading;
          end
          else
          begin
            headingTmp := vParent.Heading + 180;   //masuk lewat depan
            if headingTmp > 360 then
              OrderedHeading := headingTmp - 360
            else
              OrderedHeading := headingTmp;
          end;

          if FOrderedHeadingAchieved then
          begin
            //if (CalcRange(PosX, PosY, vParent.PosX, vParent.PosY) < 0.05) then
            //begin
              if (Abs(Mover.Speed - (vParent).Mover.Speed) < 10) then
              begin
                if (TrackDomain = vhdAir) or (PlatformDomain = vhdAir) then
                begin
                  if (Altitude < 30) then
                  begin
                    if Assigned(OnReadyLanding) then
                    begin
                      OnReadyLanding(Self);
                      isLandingFinish := true;
                    end;
                  end
                  else
                  begin
                    OrderedAltitude := 29;
                  end;
                end
                else if Assigned(OnReadyLanding) then
                begin
                  OnReadyLanding(Self);
                  isLandingFinish := true;
                end;
              end
              else
                Mover.Speed := vParent.Mover.Speed;
           // end;
          end;
        end
        else
        begin
          // cari belakang ato depannya kapal dulu
          if not(TrackDomain = vhdAir) then  //cari depannya
          begin
            headingTmp := vParent.Heading;
          end
          else                               //cari belakangnya
          begin
            headingTmp := vParent.Heading + 180;   //masuk lewat depan

            if headingTmp > 360 then
              headingTmp := headingTmp - 360;
          end;

          RangeBearingToCoord(0.04, headingTmp, ax, ay);

          OrderedHeading := CalcBearing(PosX, PosY, vParent.PosX+ ax,vParent.PosY + ay);
        end;
      end
      else //masih jauh dengan titik belakang parent,circle move
      begin
        if UnitMotion.FData.Max_Ground_Speed > 5  then
        begin
          if (UnitMotion.FData.Min_Ground_Speed + vParent.Speed + 5) <
             (UnitMotion.FData.Max_Ground_Speed)   then
            OrderedSpeed := UnitMotion.FData.Min_Ground_Speed + vParent.Speed + 5
          else
           OrderedSpeed := UnitMotion.FData.Max_Ground_Speed;
        end
        else
          OrderedSpeed := UnitMotion.FData.Max_Ground_Speed;

        if TrackDomain = vhdAir then
          circ_counter := fw - CalcBearing(vParent.PosX,vParent.PosY,PosX,PosY)
        else
          circ_counter := vparent.Heading - CalcBearing(vParent.PosX,vParent.PosY,PosX,PosY);

        if circ_counter < 0 then circ_counter := 360 + circ_counter;

        SetOrderedHeading(FOrderedHeading);

        if FOrderedHeadingAchieved then
        begin
          heading_now := CalcBearing(vParent.PosX,vParent.PosY, PosX, PosY);

          if circ_counter < 180 then //clockwise
          begin
            heading_now := heading_now + 90;

            if (round(fw-heading_now) < (-80)) then
              isAfterCircle := True;

            if heading_now > 360 then
              heading_now := heading_now - 360;
          end
          else                       //counter cw
          begin
            heading_now := heading_now - 90;
            if (round(fw-heading_now) >= 80) then
              isAfterCircle := True;

            if heading_now < 0 then
            heading_now := heading_now + 360;
          end;

          FOrderedHeading := heading_now;
        end;
      end;
    end
    else
    begin
      //posisi dalam track circle
      if (dist < dist_to_turn) or (Abs(dist - dist_to_turn) <= 0.05) then
      begin
        isTimeToCircle := true;
      end
      else  //menuju ke coord parent,straight line
      begin
        OrderedHeading := CalcBearing(PosX, PosY, vParent.PosX,vParent.PosY);

  //      FDeltaHead := getDeltaH(FOrderedHeading, Course);
        FDeltaHead := getDeltaH(FOrderedHeading, Heading);
        if (FHeadingState = mcsDecrease) then begin
          if FDeltaHead <= 0  then begin
            FMover.TurnRate := 0.0;
            FHeadingState := mcsStable;
  //          Course := FOrderedHeading;
            Heading := FOrderedHeading;
          end;
        end
        else if (FHeadingState = mcsIncrease) then begin
          // turn left
          if FDeltaHead >= 0  then begin
            FMover.TurnRate := 0.0;
            FHeadingState := mcsStable;
  //          Course := FOrderedHeading;
            Heading := FOrderedHeading;
          end;
        end;
      end;
    end;
  end;
end;

procedure TT3Vehicle.updateHealthStatus(const i: integer; val: single);
var j, gt: integer;
    hp, newVal, perc  : single;
    newStat: boolean;
begin
  inherited;

   hp := FDamageStatus.PercentHealth;

  j := getDamageIndex(hp);
  if j >= 6 then
  begin // health > 84%. tidak ada yg rusak.
    with FDamageStatus do begin
      PercentMaxSpeed := 100.0;
      SensorDamage    := false;
      WeaponDamage    := false;
      CommDamage      := false;
      HelmDamage      := false;
      PropultionDamage:= false;
      //MainBodyDamage  := false;
    end;

    exit;
  end;

  with FDamageStatus do
  begin
    gt :=  getGTIndex(DamageCapacity);

    newVal := C_Dmgs_Speed[j, gt];
    if PercentMaxSpeed <> newVal then
    begin
      PercentMaxSpeed  := newVal;
      PropultionDamage := newVal < 1;

      if Assigned(FOnDamageChanged) then
        FOnDamageChanged(self, diMaxSpeed);
    end;

    // PercentMaxSpeed langsung ngefek
    // ---- sensor damage------
    newStat := hp < C_Limit_Sensor[gt];
    SensorDamage := newStat;

    perc := 100.0 * (C_Limit_Sensor[gt] - hp) /
            (C_Limit_Sensor[gt] - C_Limit_Weapon[gt]);

    SetSectorSensorDamage(0, perc);
    SetECMDamage(0, perc);

    if Assigned(FOnDamageChanged) then
      FOnDamageChanged(self, diSensor);

    if Assigned(FOnDamageChanged) then
      FOnDamageChanged(self, diECM);

    // ---- weapon damage --------------------
    newStat := hp < C_Limit_Weapon[gt];
    WeaponDamage := newStat;

    // ini dihitung 2x, waktu update health value langsung
    // (untuk keperluan set damage n repair)
    // dan waktu ditembak 'shootby()'
    perc := 100.0 * (C_Limit_Weapon[gt] - hp ) /
            (C_Limit_Weapon[gt] - C_Limit_comm[gt]);

    SetSectorWeaponDamage(0, perc);

    if Assigned(FOnDamageChanged) then
      FOnDamageChanged(self, diWeapon);
    //-----------------------------------------

    newStat := hp < C_Limit_comm[gt];
    if CommDamage <> newStat then begin
      CommDamage := newStat;
      if Assigned(FOnDamageChanged) then
        FOnDamageChanged(self, diCommm);
    end;

    newStat := hp < C_Limit_helm[gt];
    if HelmDamage <> newStat then begin
      HelmDamage := newStat;
      if Assigned(FOnDamageChanged) then
        FOnDamageChanged(self, diHelm);
    end;
  end;

  newStat   := j = 0;
  if newStat <> FDormant then
   Dormant := newStat;
end;

function TT3Vehicle.getDamagePercent(const i: integer): integer;
begin
  result := 0;

  case i of
    1: result := Round(FDamageStatus.PercentMaxSpeed);
    2: result := Round(100 - FDamageStatus.PercentHealth);
  end;
end;


procedure TT3Vehicle.SetAllSensorDamage(const dmg: boolean);
var i : integer;
   dev: TT3DeviceUnit;
   sen: TT3Sensor;
   sos : TSensorOperationalStatus;
begin
  if dmg  then
    sos := sopDamage
  else // klo di repair di set apa?
    sos := sopOff;

  for i := 0 to FDevices.Count - 1 do begin
    dev := FDevices[i];
    if dev is TT3Sensor then begin

      sen := TT3Sensor(dev);
      sen.OperationalStatus := sos
    end;
  end;

end;

procedure TT3Vehicle.SetAllWeaponDamage(const dmg: boolean);
var i: integer;
    wpn : TT3Weapon;
    ws : TWeaponStatus;
begin
  if dmg then
    ws := wsDamaged
  else
    ws := wsAvailable; ///

  for i := 0 to FWeapons.Count - 1 do begin
    wpn := FWeapons[i];
    wpn.WeaponStatus := ws;
  end;

end;

procedure TT3Vehicle.SetSectorSensorDamage(const sect: byte; const pdmg: single);
{ input:
   pDmg = percent damage. 100% berarti semua sensor di rusak. kecuali visual.
}
var i: integer;
    dev: TT3DeviceUnit;
    sen: TT3Sensor;
    numDmg, numSen: integer;
begin
  // jumlah sensor yg ada di FDevice;
  numSen := 0;
  for i := 0 to FDevices.Count - 1 do begin
    dev := FDevices[i];

    if dev is TT3Sensor then begin
      NumSen := NumSen + 1;
    end;
  end;

  numDmg := Round(0.01 * pDmg * (numsen -1)); //total sensor yg harus di rusak.
  numSen := 0;                                //counter sensor yg dirusak

  for i := 0 to FDevices.Count - 1 do
  begin
    dev := FDevices[i];
    if (dev is TT3Sensor) and  not (dev is TT3Visual) then begin
      sen := dev as TT3Sensor;

      if numSen < numDmg then begin
        sen.OperationalStatus := sopDamage;
      end
      else begin
        if sen.OperationalStatus = sopDamage then
          sen.OperationalStatus := sopOff;
        ///  else biarin.. yg on tetep on.. yg off tetep off
      end;

      inc(numSen);
    end;
  end;
end;

procedure TT3Vehicle.SetECMDamage(const sect: byte; const pdmg: single);
{ input:
   pDmg = percent damage. 100% berarti semua sensor di rusak. kecuali visual.
}
var
    i: integer;
    dev: TT3DeviceUnit;
    ECM: TT3CounterMeasure;
    numDmg, numECM: integer;
begin
  // jumlah sensor yg ada di FDevice;
  numECM := 0;
  for i := 0 to FDevices.Count - 1 do begin
    dev := FDevices[i];

    if dev is TT3CounterMeasure then begin
      numECM := numECM + 1;
    end;
  end;

  numDmg := Round(0.01 * pDmg * (numECM -1)); //total sensor yg harus di rusak.
  numECM := 0;                                //counter sensor yg dirusak
  for i := 0 to FDevices.Count - 1 do begin
    dev := FDevices[i];
    if (dev is TT3CounterMeasure) then begin
      ECM := dev as TT3CounterMeasure;
      if numECM < numDmg then begin
        ECM.Status := esDamaged;
      end
      else begin
        if ECM.Status = esDamaged then
          ECM.Status := esDamaged;
        ///  else biarin.. yg on tetep on.. yg off tetep off
      end;
      inc(numECM);
    end;
  end;
end;

{1 -  9 : mount 1 - 9       2   1
     10 : AFT               4   3
     11 : F                 6   5
     12 : P                 8   7
     13 : S;
}

procedure TT3Vehicle.SetSectorWeaponDamage(const sect: single; const pdmg: single);
var
    i: integer;
    wpn : TT3Weapon;
    totDmg : integer;
    bMount : byte;
    sDamage: set of byte;
    FList : TList; // temporary untuk sort by angle;
begin
  // diupdate ke 'damage by sector' klo datanya ada.
  // if wpn.MountPoint.sector = sect  then
  sDamage := [];
  if (sect >= 345) or (sect < 15) then begin
    // forward
    sDamage := [11];
  end
  else if (sect >= 15) and (sect < 165) then begin
    //starboard
    if (sect < 90) then
      sDamage := [1, 3, 13]
    else
      sDamage := [5, 7, 13];
  end
  else if (sect >= 165) and (sect < 195) then begin
    // aft
    sDamage := [10];
  end
  else if (sect >= 195) and (sect < 345) then begin
   // port
    if (sect < 270) then
      sDamage := [6, 8, 12]
    else
      sDamage := [2, 4, 12];
  end;

  totDmg := Round(0.01 * pDmg * FWeapons.Count);
  // totDmg: jumlah weapon yg rusak berdasarkan persentase;
  // weapon di 'urut' kan berdasarkan relevasi arah tembakan,
  // kemudian dirusak sejumlah totDmg

  FList := TList.Create;

  for i := 0 to FWeapons.Count - 1 do begin
    wpn     := FWeapons[i];
    bMount  := byte(wpn.MountType);
    if bMount in sDamage then
      FList.Insert(0, wpn)
    else
      FList.Add(wpn);
  end;

  for i := 0 to FList.Count - 1 do begin
    wpn := FList[i];
    if i < totDmg then
      wpn.WeaponStatus := wsDamaged
    else
      if wpn.WeaponStatus = wsDamaged then
        wpn.WeaponStatus := wsAvailable;

  end;
  FList.Clear;
  FList.Free;

end;

procedure TT3Vehicle.DamageRepair(const dt : TDamageItemType);
{
C_Limit_Sensor : array [0..2] of single =
   ( 68, 52, 52 );
  C_Limit_weapon : array [0..2] of single =
   ( 52, 36, 36 );
  C_Limit_comm : array [0..2] of single =
   ( 36, 20, 20 );
  C_Limit_helm : array [0..2] of single =
   ( 20, 20, 20 );
}
var
  gt: byte;
begin
  with FDamageStatus do
  begin
    gt :=  getGTIndex(DamageCapacity);
  end;

  case dt of
     diOverall    : HealthPercent := 100;
     diMaxSpeed   : HealthPercent := 100;

     diSensor     :
//       HealthPercent := C_Limit_Sensor[gt] + 10;
       HealthPercent := 75;

     diWeapon     :
//       HealthPercent := C_Limit_weapon[gt] + 1;
       HealthPercent := C_Limit_Sensor[gt] - 1;
     diCommm      :
//       HealthPercent := C_Limit_comm[gt] + 1;
       HealthPercent := C_Limit_weapon[gt] - 1;
     diHelm       :
       HealthPercent := C_Limit_comm[gt] - 1;
//       HealthPercent := C_Limit_helm[gt] + 1;
     diPropulsion :
       HealthPercent := 100;

  end;
end;

{ snapshot }
function TT3Vehicle.GetShipTacticalInfo(const Index: Integer): string;
begin
  result := FShipTacticalInfo[Index];
end;

function TT3Vehicle.GetSnapshotData : _SS_TT3Vehicle ;
var
  i,j, k, l, m, n   : integer ;
//  embark    : TT3EmbarkedVehicle;
  scripted  : TScripted_Weapon;
  pattern   : TPattern_Weapon;
  points    : TPoint_Effect_On_Board;
  Queue     : TQueuedEmbarkedLaunch;

  obj       : TObject ;
  infra     : TInfrared_Decoy_On_Board;
  scriInfra : TScripted_Infrared;
  pattInfra : TPattern_Infrared;
  fitWeapon : TFitted_Weapon_On_Board ;

  ss        : _SS_TT3Vehicle ;
  recPoint  : _SS_Point_Effect_On_Board ;
  recTowed  : _SS_Towed_Jammer_Decoy_On_Board ;
  recInfra  : _SS_Infrared_Decoy_On_Board ;
  recHibryd : _SS_Fitted_Weapon_On_Board;
  recDefensive  : _SS_Defensive_Jammer_On_Board ;
  recSonobuoy   : _SS_Sonobuoy_On_Board;

  hoseTemp : THose;
  memberShipTemp : TT3Vehicle;

  s  : string ;
begin
  ss.P := TT3PlatformInstance(Self).GetSnapshotData ;

  ss.VehicleDefinition.FData := VehicleDefinition.FData;
  ss.VehicleDefinition.FPlatform_Ident := VehicleDefinition.FPlatform_Ident;
  ss.VehicleDefinition.FHeliLimitation := VehicleDefinition.FHeliLimitation;
  ss.VehicleDefinition.GuidanceType := Byte(TVehicle_Definition(UnitDefinition).GuidanceType);
  ss.IsOwnShip           := IsOwnShip ;
  ss.CharSymbol          := FTacticalSymbol.SymbolVisual.CharSymbol;
  ss.FontName            := FontName;
  ss.FontIndex           := FontIndex;
  ss.LaunchFromRPL       := FLaunchFromRPL;

  {$REGION ' Vehicle Guidance '}
  ss.Heading := Heading ;
  ss.GroundSpeed := GroundSpeed ;
  ss.Altitude := Altitude ;

  ss.FirstHeading   := FirstHeading ;
  ss.OrderedSpeed   := OrderedSpeed ;
  ss.OrderedHeading := OrderedHeading ;
  ss.OrderedAltitude:= OrderedAltitude ;

  ss.WindDirection  := WindDirection ;
  ss.WindSpeed      := WindSpeed ;
  ss.ShowTrails     := ShowTrails ;
  ss.OnGrounded     := OnGrounded ;
  ss.OnLand         := OnLand ;

  ss.lastHeading          := lastHeading ;
  ss.HelmDegree           := HelmDegree ;
  ss.CircleDirection      := CircleDirection ;
  ss.EvasionDegree        := EvasionDegree ;
  ss.helmAngleAchieved    := helmAngleAchieved ;
  ss.EvasionAngleAchieved := EvasionAngleAchieved ;

  ss.isStartZigzag    := isStartZigzag ;
  ss.isFirstZigzag    := isFirstZigzag ;
  ss.isLeftZigzag     := isLeftZigzag ;
  ss.isRightZigzag    := isRightZigzag ;
  ss.AmplitudoZigzag  := AmplitudoZigzag ;
  ss.PeriodZigzag     := PeriodZigzag ;
  ss.OrderedZigzag    := OrderedZigzag ;
  ss.temp_PosX        := temp_PosX ;
  ss.temp_PosY        := temp_PosY ;
  ss.PosisiX          := FPosition.X;
  ss.PosisiY          := FPosition.Y;

  ss.isStartSinuation    := isStartSinuation ;
  ss.isFirstSinuation    := isFirstSinuation ;
  ss.isLeftSinuation     := isLeftSinuation ;
  ss.isRightSinuation    := isRightSinuation ;
  ss.AmplitudoSinuation  := AmplitudoSinuation ;
  ss.PeriodSinuation     := PeriodSinuation ;
  ss.OrderedSinuation    := OrderedSinuation ;
  ss.Sinuationtemp_PosX  := Sinuationtemp_PosX ;
  ss.Sinuationtemp_PosY  := Sinuationtemp_PosY ;
  {$ENDREGION}

  {$REGION ' Vehicle Logistic '}
  ss.isTransferFromBase   := isTransferFromBase;
  ss.SupplierIDLog        := SupplierIDLog;
  ss.HoseUseID            := HoseUseID;
  ss.DestinationIDLog     := DestinationIDLog;
  ss.DestinationStateLog  := DestinationStateLog;

  if HoseList <> nil then
  begin
    SetLength(ss.HoseList,HoseList.Count);
    for i := 0 to HoseList.Count -1 do
    begin
      hoseTemp := HoseList.Items[i] ;

      if Assigned(hoseTemp) then
      begin
        ss.HoseList[i].HoseID := hoseTemp.HoseID;
        ss.HoseList[i].Available := hoseTemp.Available;
        ss.HoseList[i].State := hoseTemp.State;
        ss.HoseList[i].DestinationID := hoseTemp.DestinationID;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Vehicle Transport '}
  ss.CurrentHanggarWeight := CurrentHanggarWeight;
  ss.CurrentHanggarCapacity := CurrentHanggarCapacity;
  ss.CurrentOnBoardWeight:= CurrentOnBoardWeight;
  ss.CurrentPersonelWeight := CurrentPersonelWeight;
  ss.CurrentPersonelCapacity := CurrentPersonelCapacity;
  ss.CurrentHullWeight := CurrentHullWeight;
  ss.CurrentHullSpace := CurrentHullSpace;

  if MemberTransportList <> nil then
  begin
    SetLength(ss.MemberTransport, MemberTransportList.Count);
    for i := 0 to MemberTransportList.Count - 1 do
    begin
      memberShipTemp := TT3Vehicle(MemberTransportList.Items[i]);
      ss.MemberTransport[i].MemberId := memberShipTemp.InstanceIndex;
      ss.MemberTransport[i].StateTransport := memberShipTemp.StateTransport;
      ss.MemberTransport[i].HostIdTransport := memberShipTemp.HostIdTransport;
      ss.MemberTransport[i].MemberPosX := memberShipTemp.MemberPosX;
      ss.MemberTransport[i].MemberPosY := memberShipTemp.MemberPosY;
      ss.MemberTransport[i].MemberHeading := memberShipTemp.MemberHeading;
      ss.MemberTransport[i].MemberOrderedHeading := memberShipTemp.MemberOrderedHeading;
      ss.MemberTransport[i].MemberSpeed := memberShipTemp.MemberSpeed;
      ss.MemberTransport[i].MemberLoadState := memberShipTemp.MemberLoadState;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Sonobuoy Definition '}
  if VehicleDefinition.Sonobuoy <> nil then
  begin
    SetLength(ss.VehicleDefinition.FSonobuoyOnBoard,VehicleDefinition.Sonobuoy.Count);
    for I := 0 to VehicleDefinition.Sonobuoy.Count - 1 do
    begin
      with  TSonobuoy_On_Board(VehicleDefinition.Sonobuoy[i]) do
      begin
        recSonobuoy.FData   := FData ;
        recSonobuoy.FDef    := FDef ;
        recSonobuoy.Owner   := InstanceIndex;
        ss.VehicleDefinition.FSonobuoyOnBoard[i] := recSonobuoy ;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Hybrid Definition '}
  if VehicleDefinition.Hybrids <> nil then
  begin
    SetLength(ss.VehicleDefinition.FHybridOnBoard,VehicleDefinition.Hybrids.Count);
    for I := 0 to VehicleDefinition.Hybrids.Count - 1 do
    begin
      obj := TObject(VehicleDefinition.Hybrids.Items[i] ) ;
      if obj <> nil then
      begin
        if obj is TFitted_Weapon_On_Board then
        begin
          fitWeapon := TFitted_Weapon_On_Board(VehicleDefinition.Hybrids[i]);
          if fitWeapon <> nil then
          begin
            recHibryd.FData := fitWeapon.FData ;
            SetLength(ss.VehicleDefinition.FHybridOnBoard[i].FHybrid,fitWeapon.FHybrid.Count);
            for j := 0 to fitWeapon.FHybrid.Count - 1 do
            begin
              recHibryd.FHybrid[j].FData         := THybrid_On_Board(fitWeapon.FHybrid[j]).FData ;
              recHibryd.FHybrid[j].FHybridData   := THybrid_On_Board(fitWeapon.FHybrid[j]).FHybridData ;
              recHibryd.FHybrid[j].FTorpedo_Def  := THybrid_On_Board(fitWeapon.FHybrid[j]).FTorpedo_Def ;
              recHibryd.FHybrid[j].FMissile_Def  := THybrid_On_Board(fitWeapon.FHybrid[j]).FMissile_Def ;
            end;
            ss.VehicleDefinition.FHybridOnBoard[i] := recHibryd ;
          end;
        end;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Point Effect Definition '}
  if VehicleDefinition.Point_Effects <> nil then
  begin
    SetLength(ss.VehicleDefinition.FPointEffectsOnBoard,VehicleDefinition.Point_Effects.Count);
    for I := 0 to VehicleDefinition.Point_Effects.Count - 1 do
    begin
      with  TPoint_Effect_On_Board(VehicleDefinition.Point_Effects[i]) do
      begin
        recPoint.ParentInstanceIndex := InstanceIndex ;
        recPoint.FData          := FData ;
        recPoint.FBlind_Zone.FData  :=  FBlind_Zone.FData ;
        SetLength(recPoint.FBlind,FBlind.Count);
        for j := 0 to FBlind.Count - 1 do
        begin
          if FBlind[j]<>nil then
          begin
            recPoint.FBlind[j].FData :=  TBlind_Zone(FBlind[j]).FData ;
          end;
        end;
        SetLength(recPoint.FScripted_Point,FScripted_Point.Count);
        for j := 0 to FScripted_Point.Count - 1 do
        begin
          scripted := TScripted_Weapon(FScripted_Point[j]);
          if scripted <> nil then
          begin
            recPoint.FScripted_Point[j].Event :=  scripted.Event.FData ;
            recPoint.FScripted_Point[j].Behav :=  scripted.Behav.FData ;
          end;
        end;
        SetLength(recPoint.FPattern_Point,FPattern_Point.Count);
        for j := 0 to FPattern_Point.Count - 1 do
        begin
          pattern := TPattern_Weapon(FPattern_Point[j]);
          if pattern <> nil then
          begin
            recPoint.FPattern_Point[j].Event :=  pattern.Event.FData ;
            recPoint.FPattern_Point[j].Pattern :=  pattern.Pattern.FData ;
          end;
        end;
        ss.VehicleDefinition.FPointEffectsOnBoard[i] := recPoint ;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Towed Jammer Decoys Definition '}
  if VehicleDefinition.Towed_Jammer_Decoys <> nil then
  begin
    SetLength(ss.VehicleDefinition.FTowedJammerDecoyOnBoard,VehicleDefinition.Towed_Jammer_Decoys.Count);
    for I := 0 to VehicleDefinition.Towed_Jammer_Decoys.Count - 1 do
    begin
      with  TTowed_Jammer_Decoy_On_Board(VehicleDefinition.Towed_Jammer_Decoys[i]) do
      begin
        recTowed.FData := FData ;
        recTowed.FDef  := FDef ;
        recTowed.FNote := FNote ;
        ss.VehicleDefinition.FTowedJammerDecoyOnBoard[i] := recTowed ;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Infrared Decoy Definition '}
  if VehicleDefinition.Infrared_Decoys <> nil then
  begin
    SetLength(ss.VehicleDefinition.FInfraredecoyOnBoard,VehicleDefinition.Infrared_Decoys.Count);
    for I := 0 to VehicleDefinition.Infrared_Decoys.Count - 1 do
    begin
      with  TInfrared_Decoy_On_Board(VehicleDefinition.Infrared_Decoys[i]) do
      begin
        recInfra.FData          := FData ;
        recInfra.FInfraRedDecoy_Def  :=  FInfraRedDecoy_Def ;
        recInfra.FNote  :=  FNote ;

        if FScripted_Infra <> nil then
        begin
          SetLength(recInfra.FScripted_Infra,FScripted_Infra.Count);
          for j := 0 to FScripted_Infra.Count - 1 do
          begin
            scriInfra := TScripted_Infrared(FScripted_Infra[j]);
            if scriInfra <> nil then
            begin
              recInfra.FScripted_Infra[j].Event :=  scriInfra.Event.FData ;
              recInfra.FScripted_Infra[j].Behav :=  scriInfra.Behav.FData ;
            end;
          end;
        end;

        if FPattern_Infra <> nil then
        begin
          SetLength(recInfra.FPattern_Infra,FPattern_Infra.Count);
          for j := 0 to FPattern_Infra.Count - 1 do
          begin
            pattInfra := TPattern_Infrared(FPattern_Infra[j]);
            if pattInfra <> nil then
            begin
              recInfra.FPattern_Infra[j].Event :=  pattInfra.Event.FData ;
              recInfra.FPattern_Infra[j].Pattern :=  pattInfra.Pattern.FData ;
            end;
          end;
        end;

        ss.VehicleDefinition.FInfraredecoyOnBoard[i] := recInfra ;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Defensive Jammer Definition '}

  if VehicleDefinition.Defensive_Jammers <> nil then
  begin
    SetLength(ss.VehicleDefinition.FDefensiveJammerOnBoard,VehicleDefinition.Defensive_Jammers.Count);
    for I := 0 to VehicleDefinition.Defensive_Jammers.Count - 1 do
    begin
      with  TDefensive_Jammer_On_Board(VehicleDefinition.Defensive_Jammers[i]) do
      begin
        recDefensive.FData                := FData ;
        recDefensive.FDefensiveJammer_Def := FDefensiveJammer_Def ;
        recDefensive.FNote                := FNote ;
        ss.VehicleDefinition.FDefensiveJammerOnBoard[i] := recDefensive ;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION ' System State '}
  ss.DamageOverall      := DamageOverall;
  ss.DamageHelm         := DamageHelm;
  ss.DamagePropulsion   := DamagePropulsion;
  ss.DamagePercentSpeed := DamagePercentSpeed;
  ss.FuelRemainingPersen     := FuelRemaining;
  ss.FuelLeakage        := FuelLeakage;
  ss.DamageComm         := DamageComm;
  ss.DamageSensor       := DamageSensor;
  ss.DamageWeapon       := DamageWeapon;
  {$ENDREGION}

  {$REGION ' waypoint '}
  if Waypoints.Count > 0 then
  begin
    SetLength(ss.waypoint, Waypoints.Count);
    for i := 0 to Waypoints.Count - 1 do
    begin
      ss.waypoint[i] := Waypoints.GetSnapshotData(i);
    end;
  end;
  {$ENDREGION}

  Result := ss ;
end;

procedure TT3Vehicle.SetSnapshotData(const ss : _SS_TT3Vehicle);
function GetEmbarkedVehicle ( id : string ) : TT3EmbarkedVehicle ;
var
   j : integer ;
   hostPlatform : TT3EmbarkedVehicle;
begin
   Result := nil ;
   for j := 0 to EmbarkedVehicles.Count - 1 do begin
      hostPlatform  := TT3EmbarkedVehicle(EmbarkedVehicles.Items[j]);
      if hostPlatform.FEmbarkedIdentifier = id then begin
         Result := hostPlatform ;
         Break;
      end;
   end;
end;
var
  emb : TT3EmbarkedVehicle;
  Behav : TScripted_Behav_Definition;
  WpEvent, ObjEvent : TObject;
  i : Integer;
  j, k, l, m ,n: Integer;
  EmbarkTemp : TT3TransportedInstance;
  hoseTemp : THose;
  memberShipTemp: TT3Vehicle;
begin
  TT3PlatformInstance(Self).SetSnapshotData(ss.P);

  VehicleDefinition.FData := ss.VehicleDefinition.FData;
  VehicleDefinition.FPlatform_Ident := ss.VehicleDefinition.FPlatform_Ident;
  VehicleDefinition.FHeliLimitation := ss.VehicleDefinition.FHeliLimitation;
  TVehicle_Definition(UnitDefinition).GuidanceType := TVehicleGuidanceType(ss.VehicleDefinition.GuidanceType);
  FTacticalSymbol.SymbolVisual.CharSymbol := ss.CharSymbol;
  IsOwnShip       := ss.IsOwnShip ;
  FontName        := ss.FontName;
  FontIndex       := ss.FontIndex;
  FLaunchFromRPL  := ss.LaunchFromRPL;

  {$REGION ' Vehicle Guidance '}
  Heading         := ss.Heading ;
  GroundSpeed     := ss.GroundSpeed ;
  Altitude        := ss.Altitude ;

  FirstHeading    := ss.FirstHeading ;
  OrderedSpeed    := ss.OrderedSpeed ;
  OrderedHeading  := ss.OrderedHeading ;
  OrderedAltitude := ss.OrderedAltitude ;

  WindDirection   := ss.WindDirection ;
  WindSpeed       := ss.WindSpeed ;
  ShowTrails      := ss.ShowTrails ;
  OnGrounded      := ss.OnGrounded ;
  OnLand          := ss.onLand ;

  lastHeading           := ss.lastHeading ;
  HelmDegree            := ss.HelmDegree ;
  CircleDirection       := ss.CircleDirection ;
  EvasionDegree         := ss.EvasionDegree ;
  helmAngleAchieved     := ss.helmAngleAchieved ;
  EvasionAngleAchieved  := ss.EvasionAngleAchieved ;

  isStartZigzag    := ss.isStartZigzag ;
  isFirstZigzag    := ss.isFirstZigzag ;
  isLeftZigzag     := ss.isLeftZigzag ;
  isRightZigzag    := ss.isRightZigzag ;
  AmplitudoZigzag  := ss.AmplitudoZigzag ;
  PeriodZigzag     := ss.PeriodZigzag ;
  OrderedZigzag    := ss.OrderedZigzag ;
  temp_PosX        := ss.temp_PosX ;
  temp_PosY        := ss.temp_PosY ;

  FMover.X      := ss.PosisiX;
  FMover.Y      := ss.PosisiY;

  FPosition.X := FMover.X;
  FPosition.Y := FMover.Y;
  FPosition.Z := Altitude;

  isStartSinuation    := ss.isStartSinuation ;
  isFirstSinuation    := ss.isFirstSinuation ;
  isLeftSinuation     := ss.isLeftSinuation ;
  isRightSinuation    := ss.isRightSinuation ;
  AmplitudoSinuation  := ss.AmplitudoSinuation ;
  PeriodSinuation     := ss.PeriodSinuation ;
  OrderedSinuation    := ss.OrderedSinuation ;
  Sinuationtemp_PosX  := ss.Sinuationtemp_PosX ;
  Sinuationtemp_PosY  := ss.Sinuationtemp_PosY ;
  {$ENDREGION}

  {$REGION ' Vehicle Logistic '}
  isTransferFromBase  := ss.isTransferFromBase;
  SupplierIDLog       := ss.SupplierIDLog;
  HoseUseID           := ss.HoseUseID;
  DestinationIDLog    := ss.DestinationIDLog;
  DestinationStateLog := ss.DestinationStateLog;

  HoseList.Clear;
  for i := low(ss.HoseList) to High(ss.HoseList) do
  begin
    hoseTemp := THose.Create;
    hoseTemp.HoseID := ss.HoseList[i].HoseID;
    hoseTemp.Available := ss.HoseList[i].Available;
    hoseTemp.State := ss.HoseList[i].State;
    hoseTemp.DestinationID := ss.HoseList[i].DestinationID;

    HoseList.Add(hoseTemp);
  end;
  {$ENDREGION}

  {$REGION ' Vehicle Transport '}
  CurrentHanggarWeight    := ss.CurrentHanggarWeight;
  CurrentHanggarCapacity  := ss.CurrentHanggarCapacity;
  CurrentOnBoardWeight    := ss.CurrentOnBoardWeight;
  CurrentPersonelWeight   := ss.CurrentPersonelWeight;
  CurrentPersonelCapacity := ss.CurrentPersonelCapacity;
  CurrentHullWeight       := ss.CurrentHullWeight;
  CurrentHullSpace        := ss.CurrentHullSpace;

  MemberTransportList.Clear;
  for i := low(ss.MemberTransport) to High(ss.MemberTransport) do
  begin
//    memberShipTemp := TT3Vehicle(MemberTransportList.Items[i]);
    memberShipTemp := TT3Vehicle(FSimPlatforms.getObjectByInstanceIndex(ss.MemberTransport[i].MemberId));

    if Assigned(memberShipTemp) then
    begin
      memberShipTemp.StateTransport := ss.MemberTransport[i].StateTransport;
      memberShipTemp.HostIdTransport := ss.MemberTransport[i].HostIdTransport;
      memberShipTemp.MemberPosX := ss.MemberTransport[i].MemberPosX;
      memberShipTemp.MemberPosY := ss.MemberTransport[i].MemberPosY;
      memberShipTemp.MemberHeading := ss.MemberTransport[i].MemberHeading;
      memberShipTemp.MemberOrderedHeading := ss.MemberTransport[i].MemberOrderedHeading;
      memberShipTemp.MemberSpeed := ss.MemberTransport[i].MemberSpeed;
      memberShipTemp.MemberLoadState := ss.MemberTransport[i].MemberLoadState;

      MemberTransportList.Add(memberShipTemp);
    end
  end;
  {$ENDREGION}

  {$REGION ' Waypoint '}
  if Length(ss.waypoint) > 0 then
  begin
    for i := Low(ss.waypoint) to High(ss.waypoint) do
    begin

      Behav := TScripted_Behav_Definition.Create;
      Behav.FData := ss.waypoint[i].ScriptBehavDefinition;

      Waypoints.Add(Behav, nil);
      Waypoints.Enabled := True;

      //Waypoints.NextWaypoint := TScripted_Behav_Definition.Create;
      //Waypoints.NextWaypoint.FData := ss.waypoint[i].NextWaypoint;

      for j := Low(ss.waypoint[i].WaypointEvent) to High(ss.waypoint[i].WaypointEvent) do
      begin
        case TWaypointEventType(ss.waypoint[i].WaypointEvent[j].FType) of
          wetRadar:
                  begin
                    objEvent  := TScripted_Radar_Event.Create;
                    TScripted_Radar_Event(ObjEvent).FData := ss.waypoint[i].WaypointEvent[j].ScriptedRadarEvent;

                    wpevent   := TWaypointEventClass.Create;
                    TWaypointEventClass(wpevent).FType := TWaypointEventType(ss.waypoint[i].WaypointEvent[j].FType);
                    TWaypointEventClass(wpevent).FData := objEvent;
                    TWaypointEventClass(wpevent).FEnable := ss.waypoint[i].WaypointEvent[j].FEnable;
                    TWaypointEventClass(wpevent).FObjectInstanceIndex := ss.waypoint[i].WaypointEvent[j].FObjectInstanceIndex;

                    Waypoints.Add(behav,TWaypointEventClass(wpevent));
                  end;
          wetSonar:
                  begin
                    objEvent  := TScripted_Sonar_Event.Create;
                    TScripted_Sonar_Event(objEvent).FData := ss.waypoint[i].WaypointEvent[j].ScriptedSonarEvent;

                    wpevent   := TWaypointEventClass.Create;
                    TWaypointEventClass(wpevent).FType := TWaypointEventType(ss.waypoint[i].WaypointEvent[j].FType);
                    TWaypointEventClass(wpevent).FData := objEvent;
                    TWaypointEventClass(wpevent).FEnable := ss.waypoint[i].WaypointEvent[j].FEnable;
                    TWaypointEventClass(wpevent).FObjectInstanceIndex := ss.waypoint[i].WaypointEvent[j].FObjectInstanceIndex;

                    Waypoints.Add(behav,TWaypointEventClass(wpevent));
                  end;
          wetIFFTransponder, wetIFFInterogator:
                  begin
                    if TWaypointEventType(ss.waypoint[i].WaypointEvent[j].FType) = wetIFFTransponder then
                    begin
                      objEvent  := TScripted_IFF_Event.Create;
                      TScripted_IFF_Event(objEvent).FData := ss.waypoint[i].WaypointEvent[j].ScriptedIFFEvent;


                      // wp event untuk transpondernya
                      wpevent   := TWaypointEventClass.Create;
                      TWaypointEventClass(wpevent).FType := wetIFFTransponder;
                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := ss.waypoint[i].WaypointEvent[j].FEnable;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := ss.waypoint[i].WaypointEvent[j].FObjectInstanceIndex;

                      Waypoints.Add(behav,TWaypointEventClass(wpevent));

                      // wp event untuk interogatornya
                      wpevent   := TWaypointEventClass.Create;
                      TWaypointEventClass(wpevent).FType := wetIFFInterogator;
                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := ss.waypoint[i].WaypointEvent[j].FEnable;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := ss.waypoint[i].WaypointEvent[j].FObjectInstanceIndex;

                      Waypoints.Add(behav,TWaypointEventClass(wpevent));
                    end;
                  end;
          wetSonobuoy:
                  begin
                    objEvent  := TScripted_Sonobuoy_Event.Create;
                    TScripted_Sonobuoy_Event(objEvent).FData := ss.waypoint[i].WaypointEvent[j].ScriptedSonobuoyEvent;

                    wpevent   := TWaypointEventClass.Create;
                    TWaypointEventClass(wpevent).FType := TWaypointEventType(ss.waypoint[i].WaypointEvent[j].FType);
                    TWaypointEventClass(wpevent).FData := objEvent;
                    TWaypointEventClass(wpevent).FEnable := ss.waypoint[i].WaypointEvent[j].FEnable;
                    TWaypointEventClass(wpevent).FObjectInstanceIndex := ss.waypoint[i].WaypointEvent[j].FObjectInstanceIndex;

                    Waypoints.Add(behav,TWaypointEventClass(wpevent));
                  end;
          wetWeapon1, wetWeapon2, wetWeapon3, wetWeapon4, wetWeapon5:
                  begin
  //                      for l := 1 to 5 do
  //                      begin
                      objEvent := TScripted_Weapon_Event.Create;
                      TScripted_Weapon_Event(objEvent).FData := ss.waypoint[i].WaypointEvent[j].ScriptedWeaponEvent;

                      wpevent   := TWaypointEventClass.Create;
                      TWaypointEventClass(wpevent).FType := TWaypointEventType(ss.waypoint[i].WaypointEvent[j].FType);
                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := ss.waypoint[i].WaypointEvent[j].FEnable;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := ss.waypoint[i].WaypointEvent[j].FObjectInstanceIndex;

                      Waypoints.Add(behav,TWaypointEventClass(wpevent));
  //                      end;
                  end;
          wetMine:
                  begin
                      objEvent  := TScripted_Mine_Event.Create;
                      TScripted_Mine_Event(objEvent).FData  := ss.waypoint[i].WaypointEvent[j].ScriptedMineEvent;

                      wpevent   := TWaypointEventClass.Create;
                      TWaypointEventClass(wpevent).FType := TWaypointEventType(ss.waypoint[i].WaypointEvent[j].FType);
                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := ss.waypoint[i].WaypointEvent[j].FEnable;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := ss.waypoint[i].WaypointEvent[j].FObjectInstanceIndex;

                      Waypoints.Add(behav,TWaypointEventClass(wpevent));
                  end;
          wetCounterMeasure:
                  begin
                      objEvent  := TScripted_Chaff_Event.Create;
                      TScripted_Chaff_Event(objEvent).FData := ss.waypoint[i].WaypointEvent[j].ScriptedChaffEvent;

                      wpevent   := TWaypointEventClass.Create;
                      TWaypointEventClass(wpevent).FType := TWaypointEventType(ss.waypoint[i].WaypointEvent[j].FType);
                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := ss.waypoint[i].WaypointEvent[j].FEnable;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := ss.waypoint[i].WaypointEvent[j].FObjectInstanceIndex;

                      Waypoints.Add(behav,TWaypointEventClass(wpevent));
                  end;
          wetComHF, wetComUHF:
                  begin
                      objEvent  := TScripted_Datalink_Event.Create;
                      TScripted_Datalink_Event(objEvent).FData := ss.waypoint[i].WaypointEvent[j].ScriptedDatalinkEvent;

                      wpevent   := TWaypointEventClass.Create;
                      TWaypointEventClass(wpevent).FType := TWaypointEventType(ss.waypoint[i].WaypointEvent[j].FType);
                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := ss.waypoint[i].WaypointEvent[j].FEnable;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := ss.waypoint[i].WaypointEvent[j].FObjectInstanceIndex;

                      Waypoints.Add(behav,TWaypointEventClass(wpevent));
                  end;
          wetNone:
                  begin

                  end;
        end;
      end;
    end;

    Waypoints.Termination := TWaypointTermination(ss.waypoint[0].Termination);
    Waypoints.NextNodeID := ss.waypoint[0].NextNodeID;
    Waypoints.TerminationHeading := ss.waypoint[0].TerminationHeading;
    Waypoints.Apply;
    Waypoints.RunWaypoint := True
  end;
  {$ENDREGION}

  {$REGION ' System State '}
//  DamageOverall     := ss.DamageOverall;
  DamageHelm        := ss.DamageHelm ;
  DamagePropulsion  := ss.DamagePropulsion ;
  DamagePercentSpeed:= ss.DamagePercentSpeed;
  FuelRemaining     := ss.FuelRemainingPersen;
  FuelLeakage       := ss.FuelLeakage ;
  DamageSensor      := ss.DamageSensor ;
  DamageWeapon      := ss.DamageWeapon ;
  DamageComm        := ss.DamageComm ;
  {$ENDREGION}

  FFreeMe := ss.P.Dormant;

  if ss.P.Dormant then
    FreeChilds;
end;

//==============================================================================
{ TT3EmbarkedVehicle }

function TT3EmbarkedVehicle.AddQueue(aSpeed, aHeading: double; aTrackID,
         aLaunchName : string; timeToLaunch : Double; instanceIndexEmbar : Integer) : boolean;
var
  queueLaunch : TQueuedEmbarkedLaunch;
begin
  // jumlah queue ga boleh lebih dari quantity
//  if FLaunchQueue.Count > Quantity then
//  begin
//    raise Exception.Create('Queue can not exceed Embarked Vehicle Quantity');
//    exit;
//  end;

  FQueueNumber  := FQueueNumber + 1;

  queueLaunch := TQueuedEmbarkedLaunch.Create;
  queueLaunch.InitialSpeed    := aSpeed;
  queueLaunch.InitialHeading  := aHeading;
  queueLaunch.TrackID         := aTrackID;
  queueLaunch.LaunchName      := aLaunchName;
  queueLaunch.InstanceIndexEmbark := instanceIndexEmbar;
  queueLaunch.ReadyingTime    := timeToLaunch;    // second, ini harusnya diset dari GameSetting Tote / by database
//  queueLaunch.QueueNumber     := FQueueNumber;

  if FLaunchQueue.Count <= 0 then
    queueLaunch.QueueNumber := 0
  else
  begin
    queueLaunch.QueueNumber     := FLaunchQueue.Count;
  end;

  queueLaunch.OnEmbarkedReadyTimer := OnQueueEmbarkedTimer;
  queueLaunch.OnReadyToLaunch := OnEmbarkedReadyLaunch;
  queueLaunch.HasLaunch       := False;

  Quantity := Quantity - 1;

//  FReadying := FReadying + 1;
  FLaunchAlert  := FLaunchAlert + 1;

  FLaunchQueue.Add(queueLaunch);

  if Assigned(FOnUpdateState) then
    FOnUpdateState(Self);

  result := true;
end;

function TT3EmbarkedVehicle.AddQueueLand(aTrackID, aLaunchName: string;
  timeToLand: Double): boolean;
var
  queueLaunch : TQueuedEmbarkedLaunch;
begin

  queueLaunch := TQueuedEmbarkedLaunch.Create;
  queueLaunch.InitialSpeed    := 0;
  queueLaunch.InitialHeading  := 0;
  queueLaunch.TrackID         := aTrackID;
  queueLaunch.LaunchName      := aLaunchName;
  queueLaunch.ReadyingTime    := timeToLand;    // second, ini harusnya diset dari GameSetting Tote / by database

  if FLandQueue.Count <= 0 then
    queueLaunch.QueueNumber := 0
  else
  begin
    queueLaunch.QueueNumber     := FLandQueue.Count;
  end;

  queueLaunch.OnEmbarkedReadyTimer := OnQueueLandEmbarkedTimer;
  queueLaunch.OnReadyToLaunch := OnEmbarkedReadyLaunch;
  queueLaunch.HasLaunch       := False;

  FLandQueue.Add(queueLaunch);

  if Assigned(FOnUpdateState) then
    FOnUpdateState(Self);

  Result := True;
end;

function TT3EmbarkedVehicle.getQueueLandCount: integer;
begin
  Result := FLandQueue.Count;
end;

function TT3EmbarkedVehicle.getQueueLandItem(
  Index: integer): TQueuedEmbarkedLaunch;
begin
  try
    Result := FLandQueue.Items[Index];
  except
    Result := nil;
  end;
end;


constructor TT3EmbarkedVehicle.Create;
begin
  FLaunchQueue := TList.Create;
  FLandQueue   := TList.Create;

  FQueueNumber := 0;
  TempReadying := -1;
  FDelayer            :=  TDelayer.Create;
  FDelayer.DInterval  := 1;  // set setiap 1 detik.
  FDelayer.OnTime     := OnDelayer;
  FDelayer.Enabled    := true;
end;

destructor TT3EmbarkedVehicle.Destroy;
begin
  FLaunchQueue.Clear;
  FLaunchQueue.Free;

  FLandQueue.Clear;
  FLandQueue.Free;

  inherited;
end;

procedure TT3EmbarkedVehicle.OnDelayer(Sender: TObject);
begin
  if Assigned(FOnEmbarkedReadyTimer) then
    FOnEmbarkedReadyTimer(Self, FQueueNumber, Round(Readying));
end;

function TT3EmbarkedVehicle.getQueueCount: integer;
begin
  result := FLaunchQueue.Count;
end;

function TT3EmbarkedVehicle.getQueueItem(Index: integer): TQueuedEmbarkedLaunch;
begin
  try
    result := FLaunchQueue.Items[index];    
  except
    result := nil;
  end;
end;

procedure TT3EmbarkedVehicle.OnEmbarkedReadyLaunch(Sender: TObject;
  QueueNumber: integer);
begin
  FReadying    := FReadying - 1;
//  FLaunchAlert := FLaunchAlert + 1;

  if Assigned(FOnUpdateState) then
    FOnUpdateState(Self);
end;

procedure TT3EmbarkedVehicle.OnQueueEmbarkedTimer(Sender: TObject; QueueNumber,
  Counter: integer);
begin
  if Assigned(FOnEmbarkedTimer) then
    FOnEmbarkedTimer(Self,QueueNumber,Counter);
end;

procedure TT3EmbarkedVehicle.OnQueueLandEmbarkedTimer(Sender: TObject;
  QueueNumber, Counter: integer);
begin
  if Assigned(FOnEmbarkedReadyTimer) then
    FOnEmbarkedReadyTimer(Self, FQueueNumber, Round(Readying));
end;

function TT3EmbarkedVehicle.removeQueueLandItem(Data: TObject): boolean;
begin
  FLandQueue.Remove(Data);
  FreeAndNil(Data);

  Result := True;
end;

function TT3EmbarkedVehicle.removeQueueItem(Data: TObject): boolean;
begin
  FLaunchQueue.Remove(Data);
  FreeAndNil(Data);

  Result := True;
end;

procedure TT3EmbarkedVehicle.Run(aDt: double);
var
  I: Integer;
begin
  for I := 0 to FLaunchQueue.Count - 1 do
    TQueuedEmbarkedLaunch(FLaunchQueue.Items[i]).Run(aDt);

  for I := 0 to FLandQueue.Count - 1 do
    TQueuedEmbarkedLaunch(FLandQueue.Items[i]).Run(aDt);

//  if (Readying > 0) and IsAfterLanding then
//  begin
//    FDelayer.Run(aDt);
//    Readying := Readying - aDt;
//  end
//  else
//  begin
//    Readying := 0;
//    IsAfterLanding := false;
//  end;

end;

procedure TT3EmbarkedVehicle.SetAvailabel(const Value: integer);
begin
  FAvailabel := Value;
end;

procedure TT3EmbarkedVehicle.SetEmbarkDefinition(
  const Value: TVehicle_Definition);
begin
  FEmbarkDefinition := Value;
end;

procedure TT3EmbarkedVehicle.SetEmbarkedIdentifier(const Value: string);
begin
  FEmbarkedIdentifier := Value;
end;

procedure TT3EmbarkedVehicle.SetEmbarkedVehicle(
  const Value: TRecHosted_Platform);
begin
  FEmbarkedVehicle := Value;
end;

procedure TT3EmbarkedVehicle.setIndexEmbark(const Value: Integer);
begin
  FIndexEmbark := Value;
end;

procedure TT3EmbarkedVehicle.SetIsAfterLanding(const Value: Boolean);
begin
  FIsAfterLanding := Value;
  if Value then
  begin
    if Assigned(OnAfterLAnding) then
      OnAfterLAnding(Self);
  end;
end;

procedure TT3EmbarkedVehicle.SetLaunchAlert(const Value: integer);
begin
  FLaunchAlert := Value;
  if Assigned(FOnUpdateState) then
    FOnUpdateState(Self);
end;

procedure TT3EmbarkedVehicle.SetOnAfterLAnding(const Value: TNotifyEvent);
begin
  FOnAfterLAnding := Value;
end;

procedure TT3EmbarkedVehicle.SetOnEmbarkedTimer(
  const Value: TOnEmbarkedReadyTimer);
begin
  FOnEmbarkedTimer := Value;
end;

procedure TT3EmbarkedVehicle.SetOnUpdateState(const Value: TNotifyEvent);
begin
  FOnUpdateState := Value;
end;

procedure TT3EmbarkedVehicle.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
  FEmbarkedVehicle.Quantity := Value;

  if Assigned(FOnUpdateState) then
    FOnUpdateState(Self);
end;

procedure TT3EmbarkedVehicle.SetReadying(const Value: Double);
begin
  FReadying := Value;


end;

//procedure TT3EmbarkedVehicle.SetReadyingTime(const Value: Double);
//begin
//  FReadyingTime := Value;
//end;

{NON REAL TIME PLATFORM}

constructor TT3NonRealVehicle.Create;
begin
  inherited;

  FLineVisual  := TLineVisual.Create;
  FLineVisual.Range := 2000;
  FLineVisual.IsOnce := False;
  FRangeVisual := TRangeVisual.Create;
end;

Destructor TT3NonRealVehicle.Destroy;
begin
  inherited;

  FreeAndNil(FLineVisual);
  FreeAndNil(FRangeVisual);
end;

procedure TT3NonRealVehicle.Initialize;
begin
  inherited;

//  if FTacticalSymbol.Symbol.BitmapName = '' then
    LoadTrackSymbol;
end;

procedure TT3NonRealVehicle.Move(const aDeltaMs: double);
var
  Max_Ground_Speed, Min_Ground_Speed : Double;
  vehicle : TVehicle_Definition;
  dmn: integer;

  dx, dy : Double;
  temp : Boolean;
  str : string;
begin
  case NRPType of
    nrpPoint   : inherited;
    nrpBearing : inherited;
    nrpArea    :
    begin
        vehicle := TVehicle_Definition(UnitDefinition);

        if Vehicle = nil then
          exit;

        dmn := TVehicle_Definition(UnitDefinition).FData.Platform_Domain;
        temp := False;
        if dmn = vhdAir then
        begin
           temp := True;
        end
        else if dmn = vhdSurface then
        begin
           if FIsGrounded or FIsOnLand then
           begin
              FMover.Speed        := 0;
              FMover.Acceleration := 0;
              FTacticalSymbol.SpeedVector.Visible := False
           end
        end
        else if dmn = vhdSubsurface then
        begin
           if FIsGrounded or FIsOnLand then
           begin
              FMover.Speed        := 0;
              FMover.Acceleration := 0;
              FTacticalSymbol.SpeedVector.Visible := False
           end
        end
        else if dmn = vhdLand then
        begin

        end
        else if dmn = vhdGeneral then
        begin

        end
        else if dmn = vhdWreck then
        begin

        end
        else if dmn = vhdAmphibious then
        begin

        end
        else if dmn = vhdGrpPersonel then
        begin

        end;

        if FDormant then begin

          FDormantCounter := FDormantCounter + aDeltaMs;
          if FDormantCounter >= FDormantTime then begin
            //TimerBlink_Off.Enabled := true;
//            FreeChilds;

//            FreeMe := true;
          end;
          //TimerBlink_Off.Run(aDeltaMs);

          exit;
        end;

        case Vehicle.GuidanceType of
          vgtStraightLine : StraightLineMove(aDeltaMs);
          vgtHelm         : HelmMove(aDeltaMs);
          vgtCircle       : CircleMove(aDeltaMs);
          vgtEvasion      : EvasionMove(aDeltaMs);
          vgtWaypoint     : WayPointMove(aDeltaMs);
          vgtOutrun       : OutRunMove(aDeltaMs);
          vgtEngagement   : EngagementMove(aDeltaMs);
          vgtShadow       : ShadowMove(aDeltaMs);
          vgtZigzag       : ZigzagMove(aDeltaMs);
          vgtSinuation    : SinuationMove(aDeltaMs);
          vgtReturnToBase : ReturnToBaseMove(aDeltaMs);
          vgtFormation    : FormationMove(aDeltaMs);
        end;

        if not Assigned(UnitMotion) then begin
          Max_Ground_Speed := 0;
          Min_Ground_Speed := 0;
        end
        else begin
          Max_Ground_Speed := 0.01 * FDamageStatus.PercentMaxSpeed * UnitMotion.FData.Max_Ground_Speed ;
          Min_Ground_Speed := UnitMotion.FData.Min_Ground_Speed ;
        end;

        if FSpeedState = mcsIncrease then begin

          if (FMover.Speed >= FOrderedSpeed) then begin
            FMover.Speed := FOrderedSpeed;
            FMover.Acceleration := 0.0;
            FSpeedState := mcsStable;
          end;
          if FMover.Speed >= Max_Ground_Speed then begin
            FMover.Acceleration := 0;
            FMover.Speed := Max_Ground_Speed;
            FSpeedState := mcsStable;
          end;

        end
        else if FSpeedState = mcsDecrease then begin

          if FMover.Speed < FOrderedSpeed   then begin
            FMover.Speed := FOrderedSpeed;
            FMover.Acceleration := 0.0;
            FSpeedState := mcsStable;

//            if FMover.Speed < Min_Ground_Speed then begin
//              FMover.Speed := Min_Ground_Speed;
//              FMover.Acceleration := 0.0;
//              FSpeedState := mcsStable;
//            end;
          end;
        end;

        if (Vehicle.GuidanceType = vgtStraightLine) or (Vehicle.GuidanceType = vgtEngagement)then
        begin
      //      FDeltaHead := getDeltaH(FOrderedHeading, Course);
            FDeltaHead := getDeltaH(FOrderedHeading, Heading);
            if (FHeadingState = mcsDecrease) then begin
              if FDeltaHead <= 0  then begin
                FMover.TurnRate := 0.0;
                FHeadingState := mcsStable;
                Heading := FOrderedHeading;
      //          Course := FOrderedHeading;
              end;
            end
            else if (FHeadingState = mcsIncrease) then begin
              // turn left
              if FDeltaHead >= 0  then begin
                FMover.TurnRate := 0.0;
                FHeadingState := mcsStable;
                Heading := FOrderedHeading;
      //          Course := FOrderedHeading;
              end;
            end;
        end;

        if Vehicle.GuidanceType = vgtEvasion  then
        begin
           // FDeltaHead := getDeltaH(FEvasionDegree, Course);
            FDeltaHead := getDeltaH(FEvasionDegree, Heading);

            if (FHeadingState = mcsDecrease) then begin
              if FDeltaHead <= 0  then begin
                FMover.TurnRate := 0.0;
                FHeadingState := mcsStable;
      //          Course := FEvasionDegree;
                Heading := FEvasionDegree;
              end;
            end
            else if (FHeadingState = mcsIncrease) then begin
              // turn left
              if FDeltaHead >= 0  then begin
                FMover.TurnRate := 0.0;
                FHeadingState := mcsStable;
      //          Course := FEvasionDegree;
                Heading := FEvasionDegree;
              end;
            end;
        end;

        if (Vehicle.GuidanceType = vgtOutrun) then
        begin
      //      FDeltaHead := getDeltaH(FEvasionDegree, Course);
            FDeltaHead := getDeltaH(FEvasionDegree, Heading);

            if (FHeadingState = mcsDecrease) then begin
              if FDeltaHead <= 0  then begin
                FMover.TurnRate := 0.0;
                FHeadingState := mcsStable;
      //          Course := FEvasionDegree;
                Heading := FEvasionDegree;
              end;
            end
            else if (FHeadingState = mcsIncrease) then begin
              // turn left
              if FDeltaHead >= 0  then begin
                FMover.TurnRate := 0.0;
                FHeadingState := mcsStable;
      //          Course := FEvasionDegree;
                Heading := FEvasionDegree;
              end;
            end;
        end;

        if FAltitudeState = mcsIncrease then begin
          if FMover.Z >= FOrderedAltitude then begin
            FMover.Z := FOrderedAltitude;
            FMover.Vertical_Accel := 0.0;
            FMover.VerticalSpeed  := 0.0;
            FMover.ClimbRate      := 0;
            FMover.DescentRate    := 0;
            FAltitudeState := mcsStable;
          end
        end
        else if FAltitudeState = mcsDecrease then begin
          if FMover.Z <= FOrderedAltitude then begin
            FMover.Z := FOrderedAltitude;
            FMover.Vertical_Accel := 0.0;
            FMover.VerticalSpeed  := 0.0;
            FMover.ClimbRate      := 0;
            FMover.DescentRate    := 0;
            FAltitudeState := mcsStable;
          end;
        end
        else if FAltitudeState = mcsStable then begin
            FMover.Vertical_Accel := 0.0;
            FMover.ClimbRate      := 0;
            FMover.DescentRate    := 0;
            FMover.VerticalSpeed := 0.0;
        end;

        FMover.Move(aDeltaMs);
        str := InstanceName;
        dx := 0;
        dy := 0;

        if Assigned(Environment) then
        begin
          //Tambahan effect envi wind terhadap heli :hambali
          if dmn = vhdAir then
          begin
            //drift on station keep -- bebe
            if (Vehicle.GuidanceType = vgtStation) then
            begin
              if (StationMode = 1) and (StationDrift) then
              begin
                if Altitude<=0 then
                  begin
                    dx := 0;
                    dy := 0;
                  end
                else
                begin
                  Environment.getCalc_EnviEffect(dmn, Heading, GroundSpeed, temp, FCourse, FVelocity);

                  dx := Environment.get_DX(dmn, aDeltaMs);
                  dy := Environment.get_DY(dmn, aDeltaMs);
                end;
              end;
            end
            else
            begin
              if Altitude<=0 then
                begin
                  dx := 0;
                  dy := 0;
                end
              else
              begin
                Environment.getCalc_EnviEffect(dmn, Heading, GroundSpeed, temp, FCourse, FVelocity);

                dx := Environment.get_DX(dmn, aDeltaMs);
                dy := Environment.get_DY(dmn, aDeltaMs);
              end;
            end;
          end
          //-------------------------------------------------
          else if dmn = vhdSurface then
          begin
             if FIsGrounded or FIsOnLand then
               begin
                  dx := 0;
                  dy := 0;
               end
             else
             begin
                Environment.getCalc_EnviEffect(dmn, Heading, GroundSpeed, temp, FCourse, FVelocity);

                dx := Environment.get_DX(dmn, aDeltaMs);
                dy := Environment.get_DY(dmn, aDeltaMs);
             end;
          end
          else if dmn = vhdSubsurface then
          begin
             if FIsGrounded or FIsOnLand then
               begin
                  dx := 0;
                  dy := 0;
               end
             else
             begin
                Environment.getCalc_EnviEffect(dmn, Heading, GroundSpeed, temp, FCourse, FVelocity);

                dx := Environment.get_DX(dmn, aDeltaMs);
                dy := Environment.get_DY(dmn, aDeltaMs);
             end;
          end
          else
          begin
            Environment.getCalc_EnviEffect(dmn, Heading, GroundSpeed, temp, FCourse, FVelocity);

            dx := Environment.get_DX(dmn, aDeltaMs);
            dy := Environment.get_DY(dmn, aDeltaMs);
          end;
        end
        else
        begin
          dx := 0;
          dy := 0;
        end;

        FOutPointX := FMover.X + dx;
        FOutPointY := FMover.Y + dy;
        FPosition.Z := FMover.Z;

        FMover.X := FOutPointX;
        FMover.Y := FOutPointY;

        FHisCounter.Run(aDeltaMs);
    end;
    nrpSpecial : inherited;
  end;
end;

procedure TT3NonRealVehicle.setFNRPType(const value: Integer);
begin
  FNRPType := value;
end;

procedure TT3NonRealVehicle.setFSymbolType(const value : Char);
begin
  FSymbolType := value;
  FTacticalSymbol.SymbolVisual.FontName := 'atct';
  FTacticalSymbol.SymbolVisual.CharSymbol := FSymbolType;
end;

procedure TT3NonRealVehicle.setRadius(const value: single);
begin
  FRadius := value;
  FRangeVisual.Range := Radius;
end;

procedure TT3NonRealVehicle.SetLastUpdate(const value: string);
begin
  FLastUpdate := value;
//  if Assigned(OnLastUpdateTimePlatform) then
//   OnLastUpdateTimePlatform(value);
end;

procedure TT3NonRealVehicle.SetOrderedSpeed(const Value: double);
begin
  inherited;
  Exit;

  if NRPType <> nrpArea then
  begin
    inherited;
    exit;
  end;

  FOrderedSpeed := Value;
  FOrderedSpeedAchieved := false;

  FMover.Speed := FOrderedSpeed;
  if FMover.Speed <> 0 then
  begin
    stateGrown := true;
    //Radius := C_NauticalMile_To_Degree * Speed * (1/3600);
    grow := C_NauticalMile_To_Degree * Speed * (1/3600);
  end
  else
    stateGrown := false;

  {
  if FOrderedSpeed > FMover.Speed then begin
    FMover.Acceleration :=  UnitMotion.FData.Acceleration; // knot per second
    FMover.Acceleration :=  UnitMotion.FData.Acceleration; // knot per second
    FSpeedState := mcsIncrease;
  end
  else if FOrderedSpeed < FMover.Speed then begin
    FMover.Acceleration := - abs(UnitMotion.FData.Deceleration); // knot per second
    FSpeedState := mcsDecrease;
  end
  else begin
    FMover.Acceleration := 0.0;
    FSpeedState := mcsStable;
  end;
  }
  //aldy : untuk gambar ring yg membesar

end;

procedure TT3NonRealVehicle.LoadTrackSymbol;
var sName: string;
begin
  inherited;

//  if NRPType = nrpSpecial then
//  begin
//    if FSymbolType = '' then
//      sName := vSymbolSetting.ImgPath + pctSurface + '.bmp'
//    else
//      sName := vSymbolSetting.ImgPath + FSymbolType + '.bmp';

//    if FileExists(sName) then begin
      FTacticalSymbol.Color := getColorFromIdentity(FTrackIdent);
//      FTacticalSymbol.Symbol.LoadBitmap( sName,FTacticalSymbol.Color);
      FTacticalSymbol.SymbolVisual.FontName := 'atct';
      FTacticalSymbol.SymbolVisual.CharSymbol := FSymbolType;
      FTacticalSymbol.SpeedVector.Color := FTacticalSymbol.Color;
//    end;
  //end;
end;

procedure TT3NonRealVehicle.Draw(aCnv: tCanvas);
var
  xPos, yPos: integer;
begin
   FTacticalSymbol.isNRP := True;   // NRP pake load symbol
  // hanya gambar plaform yang aktif, selain itu digambar oleh radar
  if (not Enable) or (FreeMe) then exit;

  case Self.TrackIdent of
    piPending : Color := clWhite;
    piFriend : Color := clBlue;
    piAssumedFriend : Color := clBlue;
    piNeutral : Color := clGreen;
    piSuspect : Color := clRed;
    piHostile : Color := clRed;
    piUnknown : Color := clWhite;
  end;

//  case Self.Force_Designation of
//    fcRed : Color := clRed;
//    fcBlue : Color := clBlue;
//    fcGreen : Color := clGreen;
//    fcAmber : Color := RGB(0, 0, 70);
//    fcNoForce : Color := clWhite;
//  end;

  //  FTacticalSymbol.TextVisual.Text := Track_ID;
  if (NRPType = nrpSpecial) then
    LoadTrackSymbol;

  if (NRPType = nrpArea) and not (self.IsRepositioning) then
  begin
    if (FMover.Speed > 0) and (stateGrown) then
    begin
      grow := FMover.Speed;
    end
    else if (FMover.Speed = 0) and not (stateGrown) then
    begin
      grow := FMover.Speed;
    end;
  end;

  FRangeVisual.Visible := NRPType = nrpArea;
  if FRangeVisual.Visible then
  begin
    FRangeVisual.mX := Self.getPositionX;
    FRangeVisual.mY := Self.getPositionY;
    FRangeVisual.ConvertCoord(Converter);
    FRangeVisual.Color := Color;
    FRangeVisual.LineStyles := psSolid;
    FRangeVisual.Draw(aCnv);
  end;

  FLineVisual.Visible := NRPType = nrpBearing;
  if NRPType = nrpBearing then
  begin
    ActivateLine(aCnv);
  end
  else
    inherited;

//  case Self.Force_Designation of
//    fcRed : Color := clRed;
//    fcBlue : Color := clBlue;
//    fcGreen : Color := clGreen;
//    fcAmber : Color := clBlack;
//    fcNoForce : Color := clWhite;
//  end;

  //simbol sebagai nonrealtime dengan tanda minus
  if Selected then
  begin
    FSignPlatform.Color := clYellow;
    FTacticalSymbol.Color := FTacticalSymbol.Color;
  end
  else
  begin
    FSignPlatform.Color := Color;
    FTacticalSymbol.Color := Color;
  end;

  FTacticalSymbol.CallSign1 := IntToStr(Self.TrackNumber);
  FTacticalSymbol.SetTextColor(FTacticalSymbol.Color); //mk

  if NRPType <> nrpBearing then
    FTacticalSymbol.Draw(aCnv);

  FSignPlatform.Text := '-';
  xPos := FTacticalSymbol.Center.X;
  yPos := FTacticalSymbol.Center.Y;;
  FSignPlatform.Center := Point(xPos - 7, yPos);
  FSignPlatform.Draw(aCnv);
end;

procedure TT3NonRealVehicle.ActivateLine(aCnv : TCanvas);
begin
  if NRPType = nrpBearing then
  begin
    FLineVisual.X1 := Self.getPositionX;
    FLineVisual.Y1 := Self.getPositionY;
  end;

  if Selected then
    Color := clYellow
  else
    Color := getColorFromIdentity(TrackIdent);

  FLineVisual.Color := Color;
  FLineVisual.LineStyles := psDash;
  FLineVisual.Bearing := OrderedHeading;
  FLineVisual.ConvertCoord(Converter);
  FLineVisual.Draw(aCnv);
end;

procedure TT3NonRealVehicle.UpdateVisual;
var
  pt : TPoint;
begin
  if NRPType <> nrpArea then
    inherited
  else
  begin
    if not Enable then exit;

//    FPosition.X := FMover.X;
//    FPosition.Y := FMover.Y;
    FPosition.Z := Altitude;

    FTacticalSymbol.SpeedVector.Course  := Heading;  // ConvCartesian_To_Compass(FMover.Direction);
//    FTacticalSymbol.SymbolBMP.FDegr := Round(Heading);

    if IsGroupLeader then
      FTacticalSymbol.SpeedVector.Speed := 90
    else begin
      if Abs(Speed) < 0.1 then
        FTacticalSymbol.SpeedVector.Speed := 0
      else
        FTacticalSymbol.SpeedVector.Speed := 30;
    end;

    if NRPType = nrpArea then
      Radius := CalcRange(PosX, PosY, FMover.X, FMover.Y);

    Converter.ConvertToScreen(FPosition.X, FPosition.Y, pt.X, pt.Y);

    FTacticalSymbol.Center := pt;
    FOwnSymbol.Center := pt;
    FTacticalSymbol.ConvertCoord(Converter);
    FOwnSymbol.ConvertCoord(Converter);

    FWaypoints.ConvertCoord(Converter);
    FVHistory.ConvertCoord(Converter);
  end;
end;

procedure TT3NonRealVehicle.RepositionTo(const x, y: double);
var
  newMoverPosX, newMoverPosY : Double;
begin
  if NRPType = nrpArea then
  begin
    PosX := x;
    PosY := y;

    CalcForward(PosX, PosY, Radius, 0, newMoverPosX, newMoverPosY);

    FMover.X := newMoverPosX;
    FMover.Y := newMoverPosY;

    UpdateVisual;  //edit mas aldi

    Exit;
  end;

  inherited;        // yang lain
end;

procedure TT3NonRealVehicle.SetConverter(const Value: TCoordConverter);
begin
  inherited;
  FLineVisual.Converter := Value;
  FRangeVisual.Converter := Value;
end;

function TT3NonRealVehicle.GetSnapshotData : _SS_TT3NonRealVehicle ;
var
  ss : _SS_TT3NonRealVehicle ;
begin
  ss.V := TT3Vehicle(Self).GetSnapshotData ;
  ss.Color      := Color;
  ss.NRPType    := NRPType;
  ss.SymbolType := SymbolType;
  ss.Radius     := Radius;
  Result := ss ;
end;

procedure TT3NonRealVehicle.SetSnapshotData(const ss : _SS_TT3NonRealVehicle);
begin
  TT3Vehicle(Self).SetSnapshotData(ss.V) ;
  Color      := ss.Color;
  NRPType    := ss.NRPType;
  SymbolType := ss.SymbolType;
  Radius     := ss.Radius;
end;


{END NON REALTIME PLATFORM}

{ TQueuedEmbarkedLaunch }

constructor TQueuedEmbarkedLaunch.Create;
begin
  FReadyToLaunch := false;
  FReadyingTime  := 60;     // default 60 s

  FDelayer            :=  TDelayer.Create;
  FDelayer.DInterval  := 1;  // set setiap 1 detik.
  FDelayer.OnTime     := OnDelayer;
  FDelayer.Enabled    := true;

end;

destructor TQueuedEmbarkedLaunch.Destroy;
begin
  FDelayer.OnTime := nil;
  FDelayer.Free;
  inherited;
end;

procedure TQueuedEmbarkedLaunch.OnDelayer(Sender: TObject);
begin
  if Assigned(FOnEmbarkedReadyTimer) then
    FOnEmbarkedReadyTimer(Self, FQueueNumber, Round(ReadyingTime));
end;

procedure TQueuedEmbarkedLaunch.Run(const aDeltaMs: double);
begin
//  if FReadyToLaunch then begin
//    exit;
//  end;

  FDelayer.Run(aDeltaMs);
  ReadyingTime := ReadyingTime - aDeltaMs;
end;

procedure TQueuedEmbarkedLaunch.SetHasLaunch(const Value: boolean);
begin
  FHasLaunch := Value;
end;

procedure TQueuedEmbarkedLaunch.SetInitialHeading(const Value: double);
begin
  FInitialHeading := Value;
end;

procedure TQueuedEmbarkedLaunch.SetInitialSpeed(const Value: double);
begin
  FInitialSpeed := Value;
end;

procedure TQueuedEmbarkedLaunch.SetInstanceIndexEmbark(const Value: Integer);
begin
  FInstanceIndexEmbark := Value;
end;

procedure TQueuedEmbarkedLaunch.SetLaunchName(const Value: string);
begin
  FLaunchName := Value;
end;

procedure TQueuedEmbarkedLaunch.SetOnEmbarkedReadyTimer(
  const Value: TOnEmbarkedReadyTimer);
begin
  FOnEmbarkedReadyTimer := Value;
end;

procedure TQueuedEmbarkedLaunch.SetOnReadyToLaunch(
  const Value: TOnEmbarkedReady);
begin
  FOnReadyToLaunch := Value;
end;

procedure TQueuedEmbarkedLaunch.SetQueueNumber(const Value: integer);
begin
  FQueueNumber := Value;
end;

procedure TQueuedEmbarkedLaunch.SetReadyingTime(const Value: double);
begin
  FReadyingTime := Value;

  if FReadyingTime <= 0 then begin
    FReadyingTime  := 0;
    ReadyToLaunch := true;
  end else 
    ReadyToLaunch := false;

//  if Assigned(FOnEmbarkedReadyTimer) then
//    FOnEmbarkedReadyTimer(Self, FQueueNumber, Round(ReadyingTime));
end;

procedure TQueuedEmbarkedLaunch.SetReadyToLaunch(const Value: boolean);
begin
  FReadyToLaunch := Value;

  if Value then
    if Assigned(FOnReadyToLaunch) then
      FOnReadyToLaunch(self,FQueueNumber);

end;

procedure TQueuedEmbarkedLaunch.SetTrackID(const Value: string);
begin
  FTrackID := Value;
end;

{ TT3EmbarkTitipan }


constructor TT3TransportedInstance.Create;
begin
  ReadyingTime := 10;
end;


destructor TT3TransportedInstance.Destroy;
begin

  inherited;
end;


procedure TT3TransportedInstance.SetDomain(const Value: Integer);
begin
  FDomain := Value;
end;

procedure TT3TransportedInstance.SetDWT(const Value: Double);
begin
  FDWT := Value;
end;

function TT3TransportedInstance.RemoveTemporaryItem(Data: TObject): boolean;
begin
  FreeAndNil(Data);

  Result := True;
end;

procedure TT3TransportedInstance.Run(const aDeltaMs: double);
begin
  ReadyingTime := ReadyingTime - aDeltaMs;

  if ReadyingTime <= 0 then
  begin
    Status := integer(tsStandby);;
  end;
end;

procedure TT3TransportedInstance.SetIdentifier(const Value: string);
begin
  FIdentifier := Value;
end;


procedure TT3TransportedInstance.SetIdxVehicle(const Value: Integer);
begin
  FIdxVehicle := Value;
end;

procedure TT3TransportedInstance.SetReadyingTime(const Value: double);
begin
  FReadyingTime := Value;
end;

procedure TT3TransportedInstance.SetStatus(const Value: Integer);
begin
  FStatus := Value;
end;

procedure TT3TransportedInstance.SetTrackID(const Value: string);
begin
  FTrackID := Value;
end;


procedure TT3TransportedInstance.SetWeight(const Value: Double);
begin
  FWeight := Value;
end;


procedure TT3TransportedInstance.SetWideScale(const Value: Double);
begin
  FWideScale := Value;
end;

{ TRamp }

constructor TRamp.Create;
begin
  FRampaID := 0;
  FAvailable := False;
  FState := False;
  FPos.X := 0;
  FPos.Y := 0;
end;

destructor TRamp.Destroy;
begin

  inherited;
end;

{ THose }

constructor THose.Create;
begin
  FHoseID := 0;
  FAvailable := False;
  FState := lsIdle;
end;

destructor THose.Destroy;
begin

  inherited;
end;

end.

