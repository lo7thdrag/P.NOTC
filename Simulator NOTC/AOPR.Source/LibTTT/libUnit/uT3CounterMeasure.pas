unit uT3CounterMeasure;

interface

uses uT3Unit, uDBAsset_Countermeasure, Classes, SYsUtils, Graphics, u2DMover,
  uBaseCoordSystem, uObjectVisuals, uLibSettingTTT, tttData, uCoordConvertor,
  Windows, uT3Listener, uT3Common, uT3Vehicle, uSimObjects, uSnapshotData,
  uT3UnitContainer, Math;

type
  TECMStatus = (esAvailable, esLaunchingChaff, esUnavailable, esDamaged, esOn,
    esOff, esEMCON, esAutomatic, esManual, esDeployed, esStowed,
    esBlooming, esSustain, esDissipating);
  TECMCategory = (ecAcousticDecoy, ecAirborneChaff, ecFloatingDecoy,
    ecTowedJammer, ecSurfaceChaff, ecOnBoardDefence, ecBubble, ecInfraredDecoy,
    ecRadarNoiseJammer);    //jammer noise;
  TECMDeploymentAction = (edaDeploy, edaStow);
  TECMControlActivation = (ecaOn, ecaOff);
  TECMCycleTimer = (ectOn, ectOff);
  TECMAcousticDecoyMode = (eamSweptFreq, eamNoise, eamPulsedNoise,
    eamAlternating);

  TECMTargeting = (ettTrack, ettSpot);
  TNoiseJammerTargeting = (ettNJBarrage, ettNJTrack, ettNJSpotNum, ettNJFreq);
  TECMChaffCategory = (ecgBarrier, ecgConfusion, ecgDistraction, ecgSeduction,
                       ecgSurface, ecgAircraft, ecgGun);
  TIRState = (irsBlooming, irsSustain, irsDissipating);
  TJammerType = (jtA, jtB, jtC);

  TOnCheckTime = function(Sender : TObject): Boolean of object;
  TOnCheckStateInfraredDecoy = procedure (Sender : TObject; aDeltaMs : Double) of object;

  TT3CounterMeasure = class(TT3DeviceUnit)
  private
    isNeedNotify  : boolean;
    FCategory: TECMCategory;
    FStatus: TECMStatus;
    FOnLaunched: TNotifyEvent;
    FOnQuantityChange: TNotifyEvent;
    FOnECMlistUpdated : TNotifyEvent;

    procedure SetCategory(const Value: TECMCategory);
    procedure SetOnLaunched(const Value: TNotifyEvent);
    procedure SetOnQuantityChange(const Value: TNotifyEvent);
    procedure SetOnECMlistUpdated(const value : TNotifyEvent);
  protected
    FSimPlatforms     : TT3UnitContainer;

    procedure SetStatus(const Value: TECMStatus); virtual;
  public
    constructor Create; override;

    function  GetSnapshotData : _SS_TT3CounterMeasure ;
    procedure SetSnapshotData(const ss : _SS_TT3CounterMeasure);
    procedure SetObjects(platformObjects: TT3UnitContainer);

    property Category: TECMCategory read FCategory write SetCategory;
    property Status: TECMStatus read FStatus write SetStatus;
    property OnLaunched: TNotifyEvent read FOnLaunched write SetOnLaunched;
    property OnQuantityChange: TNotifyEvent read FOnQuantityChange write
             SetOnQuantityChange;
    property OnECMlistUpdated : TNotifyEvent read FOnECMlistUpdated write SetOnECMlistUpdated;
  end;

  TT3AcousticDecoyOnVehicle = class(TT3CounterMeasure)
  private
    FQuantity : Integer;
    FDeploymentAction: TECMDeploymentAction;
    FControl: TECMControlActivation;
    FCycleTimer: TECMCycleTimer;
    FMode: TECMAcousticDecoyMode;
    FFilterSetting: integer;
    FECMDefinition: TAcoustic_Decoy_On_Board;

    procedure SetDeploymentAction(const Value: TECMDeploymentAction);
    procedure SetControl(const Value: TECMControlActivation);
    procedure SetCycleTimer(const Value: TECMCycleTimer);
    procedure SetMode(const Value: TECMAcousticDecoyMode);
    procedure SetFilterSetting(const Value: integer);
  public
    constructor Create; override;
    procedure Initialize; override;

    function GetSnapshotData : _SS_AcousticDecoyOnVehicle ;
    procedure SetSnapshotData(const ss : _SS_AcousticDecoyOnVehicle);

    property DeploymentAction : TECMDeploymentAction read FDeploymentAction
       write SetDeploymentAction;
    property Control: TECMControlActivation read FControl write SetControl;
    property CycleTimer: TECMCycleTimer read FCycleTimer write SetCycleTimer;
    property Mode: TECMAcousticDecoyMode read FMode write SetMode;
    property FilterSetting: integer read FFilterSetting write SetFilterSetting;
    property ECMDefinition: TAcoustic_Decoy_On_Board read FECMDefinition;
    property Quantity : Integer read FQuantity write FQuantity;
  end;

  TChaffMoveState = (chClimb, chDrop);

  TT3Chaff = class(TT3PlatformInstance)
  private
    FTacticalSymbol: TTacticalSymbol;
    FMover: T2DMover;
    FBearing: double;
    FDescentRate: double;
    FBloomRange: double; // range in nm
    FBloomAltitude: double;
    FBlooming: boolean; // in feet
    FLaunch: boolean;
    FParentCourse: double;
    FAverageSpeed: double;
    FState: TChaffMoveState;
    FRCS: double;
    FMaxRcs : Double;
    FChaffCategory: TECMChaffCategory;
//    FIsInstructor: boolean;
    FMapPositionX: double;
    FMapPositionY: double;
    FIDState: byte;
    FisHancur : Boolean;
    FDisTime  : Double;
    FDisTimeWind : Double;
    FChaffDef : TRecChaff_Definition;
    FOwner: TSimObject;
    FChaffInstanceIndex: Integer;
    FLauncherID: Integer;

    procedure SetBearing(const Value: double);
    procedure SetBloomAltitude(const Value: double);
    procedure SetBloomRange(const Value: double);
    procedure SetDescentRate(const Value: double);
    procedure SetBlooming(const Value: boolean);
    procedure SetAverageSpeed(const Value: double);
    procedure SetRCS(const Value: double);
    procedure SetChaffCategory(const Value: TECMChaffCategory);
    procedure SetDisTime (const Value: Double);
    procedure SetDisTimeWind (const Value : Double);
    procedure setMaxRCS (const Value : Double);
    procedure SetOwner(const Value: TSimObject);
  protected
    function  cekRCS(const aDt: double): double;
    function  getPos(const Index: integer): double; override;
    function  getAltitude: single; override;

    procedure setPos(const Index: integer; const Value: double); override;
    procedure SetAltitude(const Value: single); override;
    procedure SetInstructor(Const Value: boolean);override;
    procedure SetIsWasdal(const Value: Boolean); override;
  public
    constructor Create; override;
    destructor Destroy; override;

    function  GetSnapshotData : _SS_TT3Chaff ;
    procedure SetSnapshotData(const ss : _SS_TT3Chaff);

    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure RepositionTo(const x, y: double); override;
    procedure Initialize; override;
    procedure Launch;

    procedure SetSelected(const Value: boolean); override;
    procedure setPositionX(const v: double); override;
    procedure setPositionY(const v: double); override;
    procedure setPositionZ(const v: double); override;

    property Bearing: double read FBearing write SetBearing;
    property BloomRange: double read FBloomRange write SetBloomRange; // nm
    property BloomAltitude: double read FBloomAltitude write SetBloomAltitude;
    // feet
    property DescentRate: double read FDescentRate write SetDescentRate;
    // feet/min
    property RCS: double read FRCS write SetRCS;
    property MaxRCS: Double read FMaxRcs write setMaxRCS;
    property Blooming: boolean read FBlooming write SetBlooming;
    property AverageSpeed: double read FAverageSpeed write SetAverageSpeed;
    // knot -> vertical
    property ChaffCategory: TECMChaffCategory read FChaffCategory write
             SetChaffCategory;
    property DisTime: Double read FDisTime write SetDisTime;
    property DisTimeWind: Double read FDisTimeWind write SetDisTimeWind;

    property MapPositionX: double read FMapPositionX write FMapPositionX;
    property MapPositionY: double read FMapPositionY write FMapPositionY;
    property IDState: byte read FIDState write FIDState;

    //untuk menyimpan instance index Chaffonvehicle; need for snapshot
    property ChaffInstanceIndex: Integer read FChaffInstanceIndex write FChaffInstanceIndex;
    property LauncherID : Integer read FLauncherID write FLauncherID;
  end;

  TT3ChaffLauncher = class(TT3CounterMeasure)
  private
    FLauncherDefinition: TChaff_Launcher_On_Board;
    FBloomRange: double;
    FDelay: integer;
    FSalvoSize: integer;
    FQty      : Integer;
    FBloomAltitude: double;
    FAngle: double;
    FNumber: integer;
    FKind: integer;
    FState: integer;
    FMapPositionX: double;
    FMapPositionY: double;
    FIDState: byte;

    FOnFire: TNotifyEvent;

    FCounter: double;
    FSalvoCounter: integer;
    FOnStopFire: TNotifyEvent;
    FFirstLaunch: boolean;
    FIsFiring: boolean;
    FChaffInstanceIndex: integer;

    procedure SetBloomAltitude(const Value: double);
    procedure SetBloomRange(const Value: double);
    procedure SetDelay(const Value: integer);
    procedure SetSalvoSize(const Value: integer);
    procedure SetAngle(const Value: double);
    procedure SetNumber(const Value: integer);
    procedure SetState(const Value: integer);
    procedure SetFire(const Value: TNotifyEvent);
    procedure SetOnStopFire(const Value: TNotifyEvent);
    procedure SetChaffInstanceIndex(const Value: integer);
    procedure SetMapPositionX(const Value: double);
    procedure SetMapPositionY(const Value: double);
    procedure SetIDState(const Value: byte);
    procedure SetQty(const Value: integer);
  public
    constructor Create; override;

    function GetSnapshotData : _SS_ChaffLauncher ;
    procedure SetSnapshotData(const ss : _SS_ChaffLauncher);

    procedure Initialize; override;
    procedure Move(const aDeltaMs: double); override;

    property LauncherDefinition : TChaff_Launcher_On_Board read FLauncherDefinition;
    property BloomRange: double read FBloomRange write SetBloomRange;
    property BloomAltitude: double read FBloomAltitude write SetBloomAltitude;
    property SalvoSize: integer read FSalvoSize write SetSalvoSize;
    property Delay: integer read FDelay write SetDelay;
    property Angle: double read FAngle write SetAngle;
    property Number: integer read FNumber write SetNumber;
    property Kind: integer read FKind;
    property State: integer read FState write SetState;
    property OnFire: TNotifyEvent read FOnFire write SetFire;
    property OnStopFire: TNotifyEvent read FOnStopFire write SetOnStopFire;
    property ChaffInstanceIndex: integer read FChaffInstanceIndex write
             SetChaffInstanceIndex;
    property MapPositionX: double read FMapPositionX write SetMapPositionX;
    property MapPositionY: double read FMapPositionY write SetMapPositionY;
    property IDState: byte read FIDState write SetIDState;
    property IsFiring: boolean read FIsFiring;
    property Qty: Integer read FQty write SetQty;
  end;

  TT3ChaffOnVehicle = class(TT3CounterMeasure)
  private
    FQuantity: integer;
    FChaffDefinition: TChaff_On_Board;
    FChaffLaunchers: TList;
    FLauncher: integer;

    procedure SetQuantity(const Value: integer);
    procedure SetLauncher(const Value: integer);
  public
    constructor Create; override;
    destructor Destroy; override;

    function  PrepareLaunch: TT3Chaff;
    //function untuk launch cahff barrier
    function  PrepareLaunchBarrier: TT3Chaff;
    function  GetSnapshotData : _SS_ChaffOnVehicle ;
    procedure SetSnapshotData(const ss : _SS_ChaffOnVehicle);
    procedure Initialize; override;
    procedure AddLauncher(Value: TT3ChaffLauncher);

    property Quantity: integer read FQuantity write SetQuantity;
    property ChaffDefinition: TChaff_On_Board read FChaffDefinition;
    property ChaffLaunchers: TList read FChaffLaunchers;
    property Launcher: integer read FLauncher write SetLauncher;
  end;

  TT3FloatingDecoyOnVehicle = class(TT3CounterMeasure)
  private
    FQuantity: integer;
    FFloatingDecoyDefinition: TFloating_Decoy_On_Board;

    procedure SetQuantity(const Value: integer);
    function CreateFloatingDecoy: TT3PlatformInstance;
  public
    constructor Create; override;
    procedure Initialize; override;
    function Deploy : TT3PlatformInstance;

    function GetSnapshotData : _SS_FloatingDecoyOnVehicle ;
    procedure SetSnapshotData(const ss : _SS_FloatingDecoyOnVehicle);

    property Quantity: integer read FQuantity write SetQuantity;
    property FloatingDecoyDefinition : TFloating_Decoy_On_Board read FFloatingDecoyDefinition;
  end;

  TT3InfraredDecoyOnVehicle = class(TT3CounterMeasure)
  private
    FQuantity: integer;
    FInfraredDecoyDefinition: TInfrared_Decoy_On_Board;

    procedure SetQuantity(const Value: integer);
    function CreateInfraredDecoy: TT3PlatformInstance;
  public
    constructor Create; override;
    procedure Initialize; override;
//    procedure Deploy;
    function Deploy : TT3PlatformInstance;

    function DeployIRDecoy: TT3PlatformInstance;
    function GetSnapshotData : _SS_InfraredDecoyOnVehicle ;
    procedure SetSnapshotData(const ss : _SS_InfraredDecoyOnVehicle);

    property Quantity: integer read FQuantity write SetQuantity;
    property InfraredDecoyDefinition
             : TInfrared_Decoy_On_Board read FInfraredDecoyDefinition;
  end;

  TT3TowedJammerOnVehicle = class(TT3CounterMeasure)
  private
    FTowedJammerDefinition: TTowed_Jammer_Decoy_On_Board;
    FQuantity: integer;
    FDeploymentAction: TECMDeploymentAction;
    FBearing: integer;
    FOrderedTowedLength: integer;
    FActualTOwedLength: integer;
    FTargeting: TECMTargeting;

    procedure SetQuantity(const Value: integer);
    procedure SetDeploymentAction(const Value: TECMDeploymentAction);
    procedure SetBearing(const Value: integer);
    procedure SetActualTOwedLength(const Value: integer);
    procedure SetOrderedTowedLength(const Value: integer);
    procedure SetTargeting(const Value: TECMTargeting);
  public
    constructor Create; override;
    procedure Initialize; override;

    function GetSnapshotData : _SS_TowedJammerOnVehicle ;
    procedure SetSnapshotData(const ss : _SS_TowedJammerOnVehicle);

    property Quantity: integer read FQuantity write SetQuantity;
    property TowedJammerDefinition
      : TTowed_Jammer_Decoy_On_Board read FTowedJammerDefinition;
    property DeploymentAction
      : TECMDeploymentAction read FDeploymentAction
      write SetDeploymentAction;
    property Bearing: integer read FBearing write SetBearing;
    property OrderedTowedLength: integer read FOrderedTowedLength write
      SetOrderedTowedLength;
    property ActualTOwedLength: integer read FActualTOwedLength write
      SetActualTOwedLength;
    property Targeting: TECMTargeting read FTargeting write SetTargeting;
  end;


  TT3AirBubbleState = (ecgClimb, ecgDrop);

  TT3AirBubble = class(TT3PlatformInstance)
  private
    FTacticalSymbol: TTacticalSymbol;
    FAirBubbleMount: TAir_Bubble_Mount;
    FDescentRate: double;
    FAscentRate: double;
    FMover: T2DMover;
    FLaunch: boolean;
    FBlooming: boolean;
    //FIsInstructor: boolean;
    FParentCourse: double;
    FAverageSpeed: double;
    FState: TT3AirBubbleState;
    FBubVisible: boolean;
    FBloomDepth: double;
    FRCS: double;
    FAngle: double;
    FBubbleCat: TECMCategory;
    FisHancur : Boolean;

    FOutPointX : Double;
    FOutPointY : Double;

    // setelah terpengaruh envi
    FCourse   : Double;
    FVelocity : Double;
    FBubbleInstanceIndex: Integer;
    FOwner: TSimObject;

    procedure SetDescentRate(const Value: double);
    procedure SetAscentRate(const Value: double);
    procedure SetAverageSpeed(const Value: double);
    procedure SetBloomDepth(const Value: double);
    procedure SetRCS(const Value: double);
    procedure SetBubbleCat(const Value: TECMCategory);
    procedure SetState(Const Value: TT3AirBubbleState);
    procedure SetAngle(const Value: double);
    procedure SetOwner(const Value: TSimObject);
  protected
    procedure SetVisible(Const Value: boolean);override;
    procedure SetInstructor(Const Value: boolean);override;
    procedure SetIsWasdal(const Value: Boolean); override;
    function getAltitude: single; override;
  public
    constructor Create; override;
    destructor Destroy; override;

    function GetSnapshotData : _SS_TT3AirBubble ;
    procedure SetSnapshotData(const ss : _SS_TT3AirBubble);

    procedure Move(const aDeltaMs: double); override;
    procedure Draw(aCnv: tCanvas); override;
    procedure UpdateVisual; override;
    procedure Initialize; override;
    procedure RepositionTo(const x, y: double); override;
    procedure Launch;

    procedure SetSelected(Const Value: boolean); override;
    procedure setPositionX(const v: double); override;
    procedure setPositionY(const v: double); override;
    procedure setPositionZ(const v: double); override;

    property AirBubbleMount: TAir_Bubble_Mount read FAirBubbleMount;
    property DescentRate: double read FDescentRate write SetDescentRate;
    // feet/min
    property AscentRate: double read FDescentRate write SetAscentRate;
    // feet/min
    property BloomDepth: double read FBloomDepth write SetBloomDepth;
    property RCS: double read FRCS write SetRCS;
    property BubbleCategory: TECMCategory read FBubbleCat write SetBubbleCat;
    property BubbleState: TT3AirBubbleState read FState write SetState;
    property AverageSpeed: double read FAverageSpeed write SetAverageSpeed;
    // knot -> vertical
    property Angle: double read FAngle write SetAngle;
    //untuk menyimpan instance index bubbleonvehicle; need for snapshot
    property BubbleInstanceIndex: Integer read FBubbleInstanceIndex write FBubbleInstanceIndex;
    property Owner           : TSimObject read FOwner write SetOwner;
  end;

  TT3AirBubbleOnVehicle = class(TT3CounterMeasure)
  private
    FQuantity: integer;
    FAirBubbleMount: TAir_Bubble_Mount;
    FChaffLaunchers: TList;
    FLauncher: integer;
    FState: integer;
    FOnFire: TNotifyEvent;
    FOnStopFire: TNotifyEvent;
    FBubbleInstanceIndex: integer;
    FSalvoSize: integer;
    FNumber: integer;
    FBloomDepth: double;
    FAngle: double;

    {$IFDEF SERVER}
    FFirstLaunch: boolean;
    FIsFiring: boolean;
    FCounter: double;
    FSalvoCounter: integer;
    FDelay: integer;
    {$ENDIF}

    procedure SetQuantity(const Value: integer);
    procedure SetLauncher(const Value: integer);
    procedure SetBloomDepth(const Value: double);
    procedure SetAngle(const Value: double);
    procedure SetState(const Value: integer);
    procedure SetFire(const Value: TNotifyEvent);
    procedure SetOnStopFire(const Value: TNotifyEvent);
    procedure SetBubbleInstanceIndex(const Value: integer);
    procedure SetSalvoSize(Const Value: integer);
    procedure SetNumber(const Value: integer);
  public
    constructor Create; override;
    procedure Initialize; override;

    function  PrepareLaunch: TT3AirBubble;
    procedure Move(const aDeltaMs: double); override;

    function GetSnapshotData : _SS_AirBubbleOnVehicle ;
    procedure SetSnapshotData(const ss : _SS_AirBubbleOnVehicle);

    property Quantity: integer read FQuantity write SetQuantity;
    property AirBubbleMount: TAir_Bubble_Mount read FAirBubbleMount;
    property ChaffLaunchers: TList read FChaffLaunchers;
    property Launcher: integer read FLauncher write SetLauncher;
    property BloomDepth: double read FBloomDepth write SetBloomDepth;
    property SalvoSize: integer read FSalvoSize write SetSalvoSize;
    property Angle: double read FAngle write SetAngle;
    property BubbleInstanceINdex: integer read FBubbleInstanceIndex write
             SetBubbleInstanceIndex;
    property State: integer read FState write SetState;
    property OnFire: TNotifyEvent read FOnFire write SetFire;
    property OnStopFire: TNotifyEvent read FOnStopFire write SetOnStopFire;
    property Number: integer read FNumber write SetNumber;
  end;

  /// ====================================================== Jammer
  TT3Jammer = class(TT3PlatformInstance)
  public
    function GetSnapshotData : _SS_TT3Jammer ;
    procedure SetSnapshotData(const ss : _SS_TT3Jammer);
  end;

  TT3TowedJammer = class(TT3Jammer)
  private
    //FTowedJammerDefinition: TTowed_Jammer_Decoy_On_Board;
  end;

  TT3DefensiveJammer = class(TT3Jammer)
  private
    //FDefensiveDefinition: TDefensive_Jammer_On_Board;
  end;

  TT3RadarNoiseJammer = class(TT3Jammer)
  private
    FRadarJammerDefinition : TJammer_On_Board;
    FPowerDensity : Double;
    FMaxEffectiveRange : Double;
    FJammerType : TJammerType;
    FMaximumSectorWidth : Double;
    FUpperFrequencyLimit : Double;
    FLowerFrequencyLimit : Double;
    FUpperVerticalCoverage : Double;
    FLowerVerticalCoverage : Double;
  public
    procedure Move(const aDeltaMs : Double); override;

    property RadarJammerDefinition : TJammer_On_Board read FRadarJammerDefinition write FRadarJammerDefinition;
    property PowerDensity : Double read FPowerDensity write FPowerDensity;
    property MaxEffectiveRange : Double read FMaxEffectiveRange write FMaxEffectiveRange;
    property JammerType : TJammerType read FJammerType write FJammerType;
    property MaximumSectorWidth : Double read FMaximumSectorWidth write FMaximumSectorWidth;
    property UpperFrequencyLimit : Double read FUpperFrequencyLimit write FUpperFrequencyLimit;
    property LowerFrequencyLimit : Double read FLowerFrequencyLimit write FLowerFrequencyLimit;
    property UpperVerticalCoverage : Double read FUpperVerticalCoverage write FUpperVerticalCoverage;
    property LowerVerticalCoverage : Double read FLowerVerticalCoverage write FLowerVerticalCoverage;
  end;
  /// ====================================================== End Jammer

  /// ====================================================== Decoy
  TT3Decoy = class(TT3PlatformInstance)
  private
    FMover : T2DMover;
  public
    constructor Create; override;
    destructor Destroy; override;

    function GetSnapshotData : _SS_TT3Decoy ;
    procedure SetSnapshotData(const ss : _SS_TT3Decoy);
    procedure Initialize; override;

    property Mover : T2DMover read FMover write FMover;
  end;

  TT3AccousticDecoy = class(TT3Decoy)
  private
    //FECMDefinition: TAcoustic_Decoy_On_Board;
  end;

  TT3FloatingDecoy = class(TT3Decoy)
  private
    FACS_Front : Double;
    FACS_Side : Double;
    FRCS_Front : Double;
    FRCS_Side : Double;
    FVCS_Front : Double;
    FVCS_Side : Double;
    FLifetimeDuration: double;
    FFloatingDecoyDefinition: TFloating_Decoy_On_Board;
    FDeployTime : TDateTime;
    FOnDeploy : TNotifyEvent;
    FOnCheckLifeTime : TOnCheckTime;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Initialize; override;
    procedure HorizontalMovement(aDeltaMs : Double);
    procedure VerticalMovement(aDeltaMs : Double);
    procedure Move(const aDeltaMs : Double); override;
    procedure Draw(aCnv: TCanvas);override;
    procedure UpdateVisual; override;
    procedure RepositionTo(const x, y: double); override;

    property OnDeploy : TNotifyEvent read FOnDeploy write FOnDeploy;
    property DeployTime : TDateTime read FDeployTime write FDeployTime;
    property OnCheckLifeTime : TOnCheckTime read FOnCheckLifeTime write FOnCheckLifeTime;
    property LifetimeDuration: double read FLifetimeDuration write FLifetimeDuration;
    property ACS_Front : double read FACS_Front;
    property ACS_Side : double read FACS_Side;
    property RCS_Front : double read FRCS_Front;
    property RCS_Side : double read FRCS_Side;
    property VCS_Front : double read FVCS_Front;
    property VCS_Side : double read FVCS_Side;
  end;

  TT3InfraredDecoy = class(TT3Decoy)
  private
    FInfraredDecoyDefinition: TInfrared_Decoy_On_Board;
    FMaxInfraredIntensity: double;
    FBloomTime: double;
    FSustainTime: double;
    FMaxDissipationTime: double;
    FMinDissipationTIme: double;
    FDescentRate: double;
    FIRState : TIRState;

    FStartOfBloom : TDateTime;
    FEndOfBloom : TDateTime;

    FOnDeploy : TNotifyEvent;
    FOnCheckStateIR : TOnCheckStateInfraredDecoy;
  protected
    function getAltitude: single; override;
    procedure SetAltitude(const Value: single); override;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Initialize; override;
    procedure HorizontalMovement(aDeltaMs : Double);
    procedure VerticalMovement(aDeltaMs : Double);
    procedure Move(const aDeltaMs: Double); override;
    procedure Draw(aCnv: TCanvas);override;
    procedure UpdateVisual; override;
    procedure RepositionTo(const x, y: double); override;

    property MaxInfraredIntensity
             : double read FMaxInfraredIntensity write FMaxInfraredIntensity;
    property BloomTime: double read FBloomTime write FBloomTime;
    property SustainTime: double read FSustainTime write FSustainTime;
    property MaxDissipationTime
             : double read FMaxDissipationTime write FMaxDissipationTime;
    property MinDissipationTime
             : double read FMinDissipationTIme write FMinDissipationTIme;
    property DescentRate: double read FDescentRate write FDescentRate;
    property InfraredDecoyDefinition
             : TInfrared_Decoy_On_Board read FInfraredDecoyDefinition write
             FInfraredDecoyDefinition;
    property IRState : TIRState read FIRState write FIRState;
    property OnCheckStateIR : TOnCheckStateInfraredDecoy read FOnCheckStateIR write FOnCheckStateIR;
    property StartOfBloom : TDateTime read FStartOfBloom write FStartOfBloom;
    property EndOfBloom : TDateTime read FEndOfBloom write FEndOfBloom;
    property OnDeploy : TNotifyEvent read FOnDeploy write FOnDeploy;
  end;
/// ====================================================== End Decoy

implementation

uses uDBAsset_Scripted, uT3Sensor, uT3Radar;

{ TT3AcousticDecoyOnVehicle }

constructor TT3AcousticDecoyOnVehicle.Create;
begin
  inherited;
  FDeploymentAction := edaStow;
  FControl := ecaOff;
  FCycleTimer := ectOff;
  FMode := eamPulsedNoise;
end;

procedure TT3AcousticDecoyOnVehicle.Initialize;
begin
  inherited;

  if Assigned(UnitDefinition) then
    FECMDefinition := TAcoustic_Decoy_On_Board(UnitDefinition);

  if Assigned(FECMDefinition) then
  begin
    InstanceIndex := FECMDefinition.FData.Acoustic_Instance_Index;
    InstanceName := FECMDefinition.FData.Instance_Identifier;
    Category := ecAcousticDecoy;
  end;
end;

procedure TT3AcousticDecoyOnVehicle.SetControl
  (const Value: TECMControlActivation);
begin
  FControl := Value;
end;

procedure TT3AcousticDecoyOnVehicle.SetCycleTimer(const Value: TECMCycleTimer);
begin
  FCycleTimer := Value;
end;

procedure TT3AcousticDecoyOnVehicle.SetDeploymentAction
  (const Value: TECMDeploymentAction);
begin
  FDeploymentAction := Value;
end;

procedure TT3AcousticDecoyOnVehicle.SetFilterSetting(const Value: integer);
begin
  FFilterSetting := Value;
end;

procedure TT3AcousticDecoyOnVehicle.SetMode(const Value: TECMAcousticDecoyMode);
begin
  FMode := Value;
end;

function TT3AcousticDecoyOnVehicle.GetSnapshotData : _SS_AcousticDecoyOnVehicle ;
var
  ss :  _SS_AcousticDecoyOnVehicle ;
begin
  ss.CM := TT3CounterMeasure(Self).GetSnapshotData;
  if Parent <> nil then ss.Owner  := TT3Unit(Parent).InstanceIndex;
  ss.DeploymentAction  := byte(DeploymentAction) ;
  ss.Control           := byte(Control) ;
  ss.CycleTimer           := byte(CycleTimer) ; // read FCycleTimer write SetCycleTimer;
  ss.Mode                 := byte(Mode);
  ss.FilterSetting        := FilterSetting;
  ss.ECMDefinition.FData                      := ECMDefinition.FData;
  ss.ECMDefinition.FAccousticDecoy_Def        := ECMDefinition.FAccousticDecoy_Def;
  ss.ECMDefinition.FAccousticDecoy_POH        := ECMDefinition.FAccousticDecoy_POH;
  ss.ECMDefinition.FNote                      := ECMDefinition.FNote;
  ss.Quantity             := Quantity;
  Result := ss ;
end;

procedure TT3AcousticDecoyOnVehicle.SetSnapshotData(const ss : _SS_AcousticDecoyOnVehicle);
begin
  TT3CounterMeasure(Self).SetSnapshotData(ss.CM);
  DeploymentAction                  := TECMDeploymentAction(ss.DeploymentAction) ;
  Control                           := TECMControlActivation(ss.Control) ;
  CycleTimer                        := TECMCycleTimer(ss.CycleTimer) ; // read FCycleTimer write SetCycleTimer;
  Mode                              := TECMAcousticDecoyMode(ss.Mode);
  FilterSetting                     := ss.FilterSetting;
  ECMDefinition.FData                      := ss.ECMDefinition.FData;
  ECMDefinition.FAccousticDecoy_Def        := ss.ECMDefinition.FAccousticDecoy_Def;
  ECMDefinition.FAccousticDecoy_POH        := ss.ECMDefinition.FAccousticDecoy_POH;
  ECMDefinition.FNote                      := ss.ECMDefinition.FNote;
  Quantity             := Quantity;
end;

{ TT3CounterMeasure }

constructor TT3CounterMeasure.Create;
begin
  inherited;

end;

procedure TT3CounterMeasure.SetCategory(const Value: TECMCategory);
begin
  FCategory := Value;
end;

procedure TT3CounterMeasure.SetObjects(platformObjects: TT3UnitContainer);
begin
  FSimPlatforms   := platformObjects;
end;

procedure TT3CounterMeasure.SetOnECMlistUpdated(const value: TNotifyEvent);
begin
  FOnECMlistUpdated := value;
end;

procedure TT3CounterMeasure.SetOnLaunched(const Value: TNotifyEvent);
begin
  FOnLaunched := Value;
end;

procedure TT3CounterMeasure.SetOnQuantityChange(const Value: TNotifyEvent);
begin
  FOnQuantityChange := Value;
end;

procedure TT3CounterMeasure.SetStatus(const Value: TECMStatus);
begin
  isNeedNotify := false;
  if Value <> FStatus  then isNeedNotify := true;

  FStatus := Value;
  TriggerListener(Self,psCMStatus,Byte(Value));

  if isNeedNotify then
    if Assigned(FOnECMlistUpdated) then
      FOnECMlistUpdated(Self);
end;

function TT3CounterMeasure.GetSnapshotData : _SS_TT3CounterMeasure ;
var
  ss :  _SS_TT3CounterMeasure ;
begin
  ss.SST3Unit  := TT3Unit(Self).GetSnapshotData;
  ss.Category  := byte(Category) ;
  ss.Status    := byte(Status) ;
  Result := ss ;
end;

procedure TT3CounterMeasure.SetSnapshotData(const ss : _SS_TT3CounterMeasure);
begin
  TT3Unit(Self).SetSnapshotData(ss.SST3Unit);
  Category  := TECMCategory(ss.Category) ;
  Status    := TECMStatus(ss.Status) ;
end;

{ TT3ChaffOnVehicle }

procedure TT3ChaffOnVehicle.AddLauncher(Value: TT3ChaffLauncher);
begin
  FChaffLaunchers.Add(Value);
//   Value.OnFire      := OnLauncherFire;
//   Value.OnStopFire  := OnLauncherStop;
//  FLauncher := 1;
end;

constructor TT3ChaffOnVehicle.Create;
begin
  inherited;
  FChaffLaunchers := TList.Create;
  FLauncher := 0;
end;

destructor TT3ChaffOnVehicle.Destroy;
begin
  inherited;
  FChaffLaunchers.Free;
end;

procedure TT3ChaffOnVehicle.Initialize;
begin
  inherited;

  if Assigned(UnitDefinition) then
    FChaffDefinition := TChaff_On_Board(UnitDefinition);

  if Assigned(FChaffDefinition) then
  begin
    InstanceName  := FChaffDefinition.FData.Instance_Identifier;
    InstanceIndex := FChaffDefinition.FData.Chaff_Instance_Index;
    Quantity      := FChaffDefinition.FData.Chaff_Qty_On_Board;

    if TT3Vehicle(Parent).PlatformDomain = 0 then
      Category := ecAirborneChaff
    else
      Category := ecSurfaceChaff;
  end;
end;

function TT3ChaffOnVehicle.PrepareLaunch: TT3Chaff;
var
  chaff: TT3Chaff;
begin
  //chaff := nil;
  Result := nil;

  if not(Quantity > 0) then
    exit;

  chaff := TT3Chaff.Create;

  chaff.Parent := FParent;
  chaff.Owner  := FParent;
  chaff.UnitDefinition := UnitDefinition;
  chaff.UnitGroup := UnitGroup;
  chaff.Enable := Enable;
  chaff.InstanceName := InstanceName;
  chaff.Force_Designation := TT3PlatformInstance(FParent).Force_Designation;
  chaff.PlatformType      := vhtChaff;
  chaff.LauncherID := TT3ChaffLauncher(ChaffLaunchers.Items[Launcher]).InstanceIndex;

  chaff.BloomRange := TT3ChaffLauncher(ChaffLaunchers.Items[Launcher])
    .BloomRange;
  chaff.BloomAltitude := TT3ChaffLauncher(ChaffLaunchers.Items[Launcher])
    .BloomAltitude;
  chaff.DescentRate := ChaffDefinition.FChaff_Def.Descent_Rate;
  chaff.RCS := ChaffDefinition.FChaff_Def.Max_Radar_Cross;
  chaff.MaxRCS := ChaffDefinition.FChaff_Def.Max_Radar_Cross;
  chaff.DisTime := ChaffDefinition.FChaff_Def.Max_Dissipation_Time;
  chaff.DisTimeWind := ChaffDefinition.FChaff_Def.Min_Dissipation_Time;

  chaff.FChaffDef := ChaffDefinition.FChaff_Def;

  chaff.MapPositionX := TT3ChaffLauncher(ChaffLaunchers.Items[Launcher])
    .MapPositionX;
  chaff.MapPositionY := TT3ChaffLauncher(ChaffLaunchers.Items[Launcher])
    .MapPositionY;
  chaff.IDState := TT3ChaffLauncher(ChaffLaunchers.Items[Launcher]).IDState;

  chaff.ChaffCategory := TECMChaffCategory(ChaffDefinition.FData.Instance_Type);

  // chaff.Initialize;
  Result := chaff;

  Quantity := Quantity - 1;
end;

function TT3ChaffOnVehicle.PrepareLaunchBarrier: TT3Chaff;
var
  chaff: TT3Chaff;
begin
  //chaff := nil;
  Result := nil;

  if not(Quantity > 0) then
    exit;

  chaff := TT3Chaff.Create;

  chaff.Parent := FParent;
  chaff.UnitDefinition := UnitDefinition;
  chaff.UnitGroup := UnitGroup;
  chaff.Enable := Enable;
  chaff.InstanceName := Self.InstanceName;
  chaff.Force_Designation := TT3PlatformInstance(FParent).Force_Designation;
  chaff.PlatformType      := vhtChaff;

  chaff.BloomRange := 6;
  chaff.BloomAltitude := TT3PlatformInstance(Parent).Altitude;
  chaff.DescentRate := ChaffDefinition.FChaff_Def.Descent_Rate;
  chaff.RCS := ChaffDefinition.FChaff_Def.Max_Radar_Cross;
  chaff.MaxRCS := ChaffDefinition.FChaff_Def.Max_Radar_Cross;
  chaff.DisTime := ChaffDefinition.FChaff_Def.Max_Dissipation_Time;
  chaff.DisTimeWind := ChaffDefinition.FChaff_Def.Min_Dissipation_Time;

  chaff.FChaffDef := ChaffDefinition.FChaff_Def;

  chaff.MapPositionX := TT3PlatformInstance(FParent).PosX;
  chaff.MapPositionY := TT3PlatformInstance(FParent).PosY;
  chaff.IDState := 0;

  chaff.ChaffCategory := TECMChaffCategory(ChaffDefinition.FData.Instance_Type);
  chaff.Bearing := ValidateDegree(TT3PlatformInstance(Parent).Heading + 180);

  // chaff.Initialize;
  Result := chaff;

  Quantity := Quantity - 1;
end;

{ procedure TT3ChaffOnVehicle.LaunchDistraction;
  var
  lc : TObject;
  begin
  if FLauncher = 0 then begin
  exit;
  if Assigned(OnLogEventStr) then
  OnLogEventStr('Launcher not choosen yet..');
  end;

  if FLauncher > FChaffLaunchers.Count then begin
  exit;
  if Assigned(OnLogEventStr) then
  OnLogEventStr('Launcher number exceded..');
  end;


  lc := FChaffLaunchers.Items[FLauncher-1];
  TT3ChaffLauncher(lc).State := 1;
  end; }

{ procedure TT3ChaffOnVehicle.OnLauncherFire(Sender: TObject);
  var
  chaff : TT3Chaff;
  begin
  if not (Sender is TT3ChaffLauncher) then exit;

  if Assigned(OnLogEventStr) then
  OnLogEventStr(TT3ChaffLauncher(Sender).InstanceName + ' launch chaff');

  Quantity := Quantity - 1;
  end; }

{ procedure TT3ChaffOnVehicle.OnLauncherStop(Sender: TObject);
  begin
  if not (Sender is TT3ChaffLauncher) then exit;

  if Assigned(OnLogEventStr) then
  OnLogEventStr(TT3ChaffLauncher(Sender).InstanceName + ' stop launch');
  end; }

procedure TT3ChaffOnVehicle.SetLauncher(const Value: integer);
begin
  FLauncher := Value;
end;

procedure TT3ChaffOnVehicle.SetQuantity(const Value: integer);
begin
  FQuantity := Value;

  if Assigned(OnQuantityChange) then
    OnQuantityChange(Self);
end;

function TT3ChaffOnVehicle.GetSnapshotData : _SS_ChaffOnVehicle ;
var
  I : integer ;
  ss :  _SS_ChaffOnVehicle ;
  scripted : TScripted_Chaff ;
  pattern  : TPattern_Chaff;
begin
  ss.CM := TT3CounterMeasure(Self).GetSnapshotData;
  if Parent <> nil then ss.Owner  := TT3Unit(Parent).InstanceIndex ;
  ss.Quantity                     := Quantity;
  ss.ChaffDefinition.FData        := ChaffDefinition.FData ;
  ss.ChaffDefinition.FChaff_Def   := ChaffDefinition.FChaff_Def ;
  ss.ChaffDefinition.FNote        := ChaffDefinition.FNote ;

  if ChaffDefinition.FScripted_Chaffs <> nil then begin
    SetLength(ss.ChaffDefinition.FScripted_Chaffs,ChaffDefinition.FScripted_Chaffs.Count);
    for I := 0 to ChaffDefinition.FScripted_Chaffs.Count - 1 do
    begin
        scripted := TScripted_Chaff(ChaffDefinition.FScripted_Chaffs[i]) ;
        if scripted <> nil then
        begin
          ss.ChaffDefinition.FScripted_Chaffs[i].Event := scripted.Event.FData ;
          ss.ChaffDefinition.FScripted_Chaffs[i].Behav := scripted.Behav.FData ;
        end;
    end;
  end;

  if ChaffDefinition.FScripted_Pattern <> nil then begin
    SetLength(ss.ChaffDefinition.FScripted_Pattern,ChaffDefinition.FScripted_Pattern.Count);
    for I := 0 to ChaffDefinition.FScripted_Pattern.Count - 1 do
    begin
        pattern := TPattern_Chaff(ChaffDefinition.FScripted_Pattern[i]) ;
        if pattern <> nil then
        begin
          ss.ChaffDefinition.FScripted_Pattern[i].Event := pattern.Event.FData ;
          ss.ChaffDefinition.FScripted_Pattern[i].Pattern := pattern.Pattern.FData ;
        end;
    end;
  end;

  ss.Launcher                     := Launcher ;
  Result := ss ;
end;

procedure TT3ChaffOnVehicle.SetSnapshotData(const ss : _SS_ChaffOnVehicle);
begin
  TT3CounterMeasure(Self).SetSnapshotData(ss.CM);
  Quantity                     := ss.Quantity;
  ChaffDefinition.FData        := ss.ChaffDefinition.FData ;
  ChaffDefinition.FChaff_Def   := ss.ChaffDefinition.FChaff_Def ;
  ChaffDefinition.FNote        := ss.ChaffDefinition.FNote ;
  Launcher                     := ss.Launcher ;
end;
{ TT3ChaffLauncher }

constructor TT3ChaffLauncher.Create;
begin
  inherited;
end;

procedure TT3ChaffLauncher.Initialize;
begin
  inherited;
  if Assigned(UnitDefinition) then
    FLauncherDefinition := TChaff_Launcher_On_Board(UnitDefinition);

  if Assigned(FLauncherDefinition) then
  begin
    InstanceName := 'Launcher - ' + IntToStr
      (FLauncherDefinition.FData.Launcher_Number);
    InstanceIndex := FLauncherDefinition.FData.Launcher_Number;
    FBloomRange := FLauncherDefinition.FData.Def_Bloom_Range;
    FBloomAltitude := FLauncherDefinition.FData.Def_Bloom_Altitude;
    FAngle := FLauncherDefinition.FData.Launcher_Angle;
    FNumber := FLauncherDefinition.FData.Launcher_Number;
    FKind := FLauncherDefinition.FData.Launcher_Kind;
  end;

  FDelay := 1; // default delay salvo 1 detik
  FSalvoSize := 1;
  if Assigned(FParent) and (FParent is TT3Vehicle) then
  begin
    FDelay := TT3Vehicle(FParent).VehicleDefinition.FData.Min_Delay_Between_Chaff_Rounds;
    FSalvoSize := TT3Vehicle(FParent).VehicleDefinition.FData.Max_Chaff_Salvo_Size;
  end;

  FFirstLaunch := true;
  FState := 0; // --> 0 : steady, 1 : on salvo
  FCounter := 0;
  FSalvoCounter := 0;
  FChaffInstanceIndex := 0;
  FIDState := 0;
  FIsFiring := false;
end;

procedure TT3ChaffLauncher.Move(const aDeltaMs: double);
begin
  inherited;

  if FState = 0 then
    exit; // Launcher idle;

  {$IFDEF SERVER}
  if FFirstLaunch then
  begin
    FOnFire(Self);

    if not FIsFiring then
      FIsFiring := true;

    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3ChaffLauncher.Move', InstanceName + ' launch chaff ');

    inc(FSalvoCounter);
    FFirstLaunch := false;
  end
  else
  begin
    FCounter := FCounter + aDeltaMs;
    if FCounter >= FDelay then
    begin
      if Assigned(FOnFire) then
        FOnFire(Self);

      if Assigned(OnLogEventStr) then
        OnLogEventStr('TT3ChaffLauncher.Move', InstanceName + ' launch chaff ');

      inc(FSalvoCounter);
      FCounter := 0;
    end;
  end;

  //if InstanceName <> 'Barrier' then

  if FSalvoCounter = FSalvoSize then
  begin
    if Assigned(FOnStopFire) then
      FOnStopFire(Self);

    if FIsFiring then
      FIsFiring := false;

    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3ChaffLauncher.Move', InstanceName + ' stop launch');

    FState := 0;
    FFirstLaunch := true;
  end;

  if FQty = 0 then begin
    if Assigned(FOnStopFire) then
      FOnStopFire(Self);

    if FIsFiring then
      FIsFiring := false;

    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3ChaffLauncher.Move', InstanceName + ' stop launch');

    FState := 0;
    FFirstLaunch := true;
  end;

  if FQty > 0 then begin
    FQty := FQty - 1;
  end;
  {$ENDIF}
end;

procedure TT3ChaffLauncher.SetAngle(const Value: double);
var
  i: integer;
  l: TObject;
begin
  FAngle := Value;

  for i := 0 to FListenerList.Count - 1 do
  begin
    l := FListenerList.Items[i];
    if l is TT3ChaffLauncherListener then
      TT3ChaffLauncherListener(l).BloomAltitudeChange(Value);
  end;
end;

procedure TT3ChaffLauncher.SetBloomAltitude(const Value: double);
var
  i: integer;
  l: TObject;
begin
  FBloomAltitude := Value;

  for i := 0 to FListenerList.Count - 1 do
  begin
    l := FListenerList.Items[i];
    if l is TT3ChaffLauncherListener then
      TT3ChaffLauncherListener(l).BloomAltitudeChange(Value);
  end;
end;

procedure TT3ChaffLauncher.SetBloomRange(const Value: double);
var
  i: integer;
  l: TObject;
begin
  FBloomRange := Value;

  for i := 0 to FListenerList.Count - 1 do
  begin
    l := FListenerList.Items[i];
    if l is TT3ChaffLauncherListener then
      TT3ChaffLauncherListener(l).BloomRangeChange(Value);
  end;
end;

procedure TT3ChaffLauncher.SetChaffInstanceIndex(const Value: integer);
begin
  FChaffInstanceIndex := Value;
end;

procedure TT3ChaffLauncher.SetDelay(const Value: integer);
var
  i: integer;
  l: TObject;
begin
  FDelay := Value;

  for i := 0 to FListenerList.Count - 1 do
  begin
    l := FListenerList.Items[i];
    if l is TT3ChaffLauncherListener then
      TT3ChaffLauncherListener(l).DelayChange(Value);
  end;
end;

procedure TT3ChaffLauncher.SetFire(const Value: TNotifyEvent);
begin
  FOnFire := Value;
end;

procedure TT3ChaffLauncher.SetIDState(const Value: byte);
begin
  FIDState := Value;
end;

procedure TT3ChaffLauncher.SetMapPositionX(const Value: double);
begin
  FMapPositionX := Value;
end;

procedure TT3ChaffLauncher.SetMapPositionY(const Value: double);
begin
  FMapPositionY := Value;
end;

procedure TT3ChaffLauncher.SetNumber(const Value: integer);
begin
  FNumber := Value;
end;

procedure TT3ChaffLauncher.SetOnStopFire(const Value: TNotifyEvent);
begin
  FOnStopFire := Value;
end;

procedure TT3ChaffLauncher.SetQty(const Value: integer);
begin
  FQty := Value;
end;

procedure TT3ChaffLauncher.SetSalvoSize(const Value: integer);
var
  i: integer;
  l: TObject;
begin
  FSalvoSize := Value;

  for i := 0 to FListenerList.Count - 1 do
  begin
    l := FListenerList.Items[i];
    if l is TT3ChaffLauncherListener then
      TT3ChaffLauncherListener(l).SalvoSizeChange(Value);
  end;
end;

procedure TT3ChaffLauncher.SetState(const Value: integer);
var
  i: integer;
  l: TObject;
begin
  FState := Value;

  if FState = 1 then
  begin
    FCounter := 0;
    FSalvoCounter := 0;
  end;

  for i := 0 to FListenerList.Count - 1 do
  begin
    l := FListenerList.Items[i];
    if l is TT3ChaffLauncherListener then
      TT3ChaffLauncherListener(l).StateChange(Value);
  end;

  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3ChaffLauncher.SetState', InstanceName + ' state ' + IntToStr(Value));

end;

function TT3ChaffLauncher.GetSnapshotData : _SS_ChaffLauncher ;
var
  ss :  _SS_ChaffLauncher ;
begin
  ss.CM := TT3CounterMeasure(Self).GetSnapshotData;
  if Parent <> nil then ss.Owner  := TT3Unit(Parent).InstanceIndex ;
  ss.LauncherDefinition.FData    := LauncherDefinition.FData ;
  ss.BloomRange            := BloomRange ;
  ss.BloomAltitude         := BloomAltitude ;
  ss.SalvoSize             := SalvoSize ;
  ss.Delay                 := Delay ;
  ss.Angle                 := Angle ;
  ss.Number                := Number ;
  ss.Kind                  := Kind ;
  ss.State                 := State ;
  ss.ChaffInstanceIndex    := ChaffInstanceIndex ;
  ss.MapPositionX          := MapPositionX ;
  ss.MapPositionY          := MapPositionY ;
  ss.IDState               := IDState ;
  ss.IsFiring              := IsFiring ;
  Result := ss ;
end;

procedure TT3ChaffLauncher.SetSnapshotData(const ss : _SS_ChaffLauncher);
begin
  TT3CounterMeasure(Self).SetSnapshotData(ss.CM);
  LauncherDefinition.FData    := ss.LauncherDefinition.FData ;
  BloomRange            := ss.BloomRange ;
  BloomAltitude         := ss.BloomAltitude ;
  SalvoSize             := ss.SalvoSize ;
  Delay                 := ss.Delay ;
  Angle                 := ss.Angle ;
  Number                := ss.Number ;
  // Kind                  := ss.Kind ;  read only
  FKind                 := ss.Kind ;
  State                 := ss.State ;
  ChaffInstanceIndex    := ss.ChaffInstanceIndex ;
  MapPositionX          := ss.MapPositionX ;
  MapPositionY          := ss.MapPositionY ;
  IDState               := ss.IDState ;
  //IsFiring              := ss.IsFiring ;
  FIsFiring             := ss.IsFiring ;
end;

{ TT3FloatingDecoyOnVehicle }

constructor TT3FloatingDecoyOnVehicle.Create;
begin
  inherited;

end;

function TT3FloatingDecoyOnVehicle.Deploy : TT3PlatformInstance;
begin
  result := nil;

  if Quantity <= 0 then
    exit;

  result := CreateFloatingDecoy;

  Quantity := Quantity - 1;
  if Quantity = 0 then
    Status := esUnavailable;
end;

function TT3FloatingDecoyOnVehicle.CreateFloatingDecoy: TT3PlatformInstance;
var
  dec : TT3FloatingDecoy;
begin
  dec := TT3FloatingDecoy.Create;
  dec.Parent := Self;
  dec.FFloatingDecoyDefinition := self.FloatingDecoyDefinition;
  dec.Environment := Self.Environment;

  //set track dan yang berkaitan dengan gambar
  dec.TrackDomain := TrackDomain;
  dec.TrackIdent := TrackIdent;

  dec.PosX := PosX;
  dec.PosY := PosY;
  dec.PosZ := PosZ;
  dec.UnitGroup := UnitGroup;

  dec.Initialize;

  Result := dec;
end;

function TT3FloatingDecoyOnVehicle.GetSnapshotData : _SS_FloatingDecoyOnVehicle ;
var
  ss :  _SS_FloatingDecoyOnVehicle ;
begin
  ss.CM := TT3CounterMeasure(Self).GetSnapshotData;
  if Parent <> nil then ss.Owner  := TT3Unit(Parent).InstanceIndex ;
  ss.Quantity                       := Quantity ;
  ss.FloatingDecoyDefinition.FData  := FloatingDecoyDefinition.FData ;
  ss.FloatingDecoyDefinition.FFloatingDecoy_Def  := FloatingDecoyDefinition.FFloatingDecoy_Def ;
  ss.FloatingDecoyDefinition.FNote  := FloatingDecoyDefinition.FNote ;
  Result := ss ;
end;

procedure TT3FloatingDecoyOnVehicle.SetSnapshotData(const ss : _SS_FloatingDecoyOnVehicle);
begin
  TT3CounterMeasure(Self).SetSnapshotData(ss.CM);
  Quantity                                    := ss.Quantity ;
  FloatingDecoyDefinition.FData               := ss.FloatingDecoyDefinition.FData ;
  FloatingDecoyDefinition.FFloatingDecoy_Def  := ss.FloatingDecoyDefinition.FFloatingDecoy_Def ;
  FloatingDecoyDefinition.FNote               := ss.FloatingDecoyDefinition.FNote ;
end;

//////

procedure TT3FloatingDecoy.Initialize;
var
  sName: string;
  color : TColor;
  MyParent : TSimObject;
begin
  if Assigned(FFloatingDecoyDefinition) then
  begin
    with FFloatingDecoyDefinition do
    begin
      InstanceIndex := FData.Floating_Decoy_Instance_Index;
      InstanceName := FData.Instance_Identifier;

      FACS_Front := FFloatingDecoy_Def.Front_Acoustic_Cross;
      FACS_Side := FFloatingDecoy_Def.Side_Acoustic_Cross;
      FRCS_Front := FFloatingDecoy_Def.Front_Radar_Cross;
      FRCS_Side := FFloatingDecoy_Def.Side_Radar_Cross;
      FVCS_Front := FFloatingDecoy_Def.Front_Visual_Cross;
      FVCS_Side := FFloatingDecoy_Def.Side_Visual_Cross;
      FLifetimeDuration := FFloatingDecoy_Def.Lifetime_Duration;
    end;
  end;

  FMover.X := PosX;
  FMover.Y := PosY;
  FMover.Z := PosZ;
  FMover.Enabled := True;

  if Assigned(Environment) then
  begin
    FMover.Speed := Environment.FData.Ocean_Current_Speed;
    FMover.Direction := Environment.FData.Ocean_Current_Direction;
  end;

  //init draw;
  sName := vSymbolSetting.ImgPath +  'DecoyFriend' + '.bmp';

  if FileExists(sName) then
  begin
    MyParent := TT3FloatingDecoyOnVehicle(FParent).FParent;
    getCorrectSymbol(TT3Vehicle(MyParent).PlatformDomain,
      TT3Vehicle(MyParent).PlatformType,
      TT3Vehicle(MyParent).Force_Designation, color);
//    FTacticalSymbol.Color := getColorFromIdentity(TrackIdent);
    FTacticalSymbol.Color := color;
    FTacticalSymbol.SetTextColor(color);
//    FTacticalSymbol.Symbol.LoadBitmap(sName,color);
  end;

end;

procedure TT3RadarNoiseJammer.Move(const aDeltaMs : Double);
begin
  //
end;

constructor TT3Decoy.Create;
begin
  inherited;
  FMover := T2DMover.Create;
end;

destructor TT3Decoy.Destroy;
begin
  inherited;
  FMover.Free;
end;

constructor TT3FloatingDecoy.Create;
begin
  inherited;
  FTacticalSymbol := TTacticalSymbol.Create;
end;

destructor TT3FloatingDecoy.Destroy;
begin
  inherited;
end;

procedure TT3FloatingDecoy.HorizontalMovement(aDeltaMs : Double);
begin
  Mover.Move(aDeltaMs);

  PosX := FMover.X;
  PosY := FMover.Y;
end;

procedure TT3FloatingDecoy.VerticalMovement(aDeltaMs: Double);
begin
  //posisi Z = posisi awal dideploy
  PosZ := PosZ;
  FMover.Z := PosZ;
end;

procedure TT3FloatingDecoy.Move(const aDeltaMs: Double);
begin
  HorizontalMovement(aDeltaMs);
  VerticalMovement(aDeltaMs);

  if Assigned(OnCheckLifeTime) then
  begin
    //jika telah melebihi waktu lifetime akan hilang...
    if not OnCheckLifeTime(Self) then
    begin
      Self.FreeMe := true;
      Self.AbsoluteFree := True;

      if Assigned(OnLogEventStr) then
        OnLogEventStr('TT3FloatingDecoy.Move', 'Floating Decoy destroyed');
    end;

    //jika keluar dari latihan juga seharusnya hilang...
  end;
end;

procedure TT3FloatingDecoy.RepositionTo(const x, y: double);
begin
  inherited;
  FMover.x := x;
  FMover.y := y;
end;

procedure TT3FloatingDecoy.Draw(aCnv: TCanvas);
var
  pt : TPoint;
begin
  inherited;

  FTacticalSymbol.isVehicle := false;

  Converter.ConvertToScreen(FMover.x, FMover.y, pt.x, pt.y);

  FTacticalSymbol.Center := pt;
  FTacticalSymbol.ConvertCoord(Converter);
  FTacticalSymbol.SetTextVisibility( Visible);
  FTacticalSymbol.Visible := Visible;

//  FTacticalSymbol.Color :=

  FTacticalSymbol.Draw(aCnv);
end;

procedure TT3FloatingDecoy.UpdateVisual;
var
  pt: TPOint;
begin
  inherited;
  Converter.ConvertToScreen(FMover.x, FMover.y, pt.x, pt.y);

  FTacticalSymbol.Center := pt;
  FTacticalSymbol.ConvertCoord(Converter);

end;

procedure TT3FloatingDecoyOnVehicle.Initialize;
begin
  inherited;

  if Assigned(UnitDefinition) then
    FFloatingDecoyDefinition := TFloating_Decoy_On_Board(UnitDefinition);

  if Assigned(FFloatingDecoyDefinition) then
    with FFloatingDecoyDefinition do
    begin
      InstanceIndex := FData.Floating_Decoy_Instance_Index;
      InstanceName := FData.Instance_Identifier;
      Quantity := FData.Quantity;
      Category := ecFloatingDecoy;
    end;
end;

procedure TT3FloatingDecoyOnVehicle.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

{ TT3TowedJammerOnVehicle }

constructor TT3TowedJammerOnVehicle.Create;
begin
  inherited;
  Status := esOff;
  FTargeting := ettSpot;   //jammer
  Category := ecTowedJammer;
end;

procedure TT3TowedJammerOnVehicle.Initialize;
begin
  inherited;

  if Assigned(UnitDefinition) then
    FTowedJammerDefinition := TTowed_Jammer_Decoy_On_Board(UnitDefinition);

  if Assigned(FTowedJammerDefinition) then
    with FTowedJammerDefinition do
    begin
      InstanceIndex := FData.Towed_Decoy_Instance_Index;
      InstanceName := FData.Instance_Identifier;
      Quantity := FData.Quantity;
      Category := ecTowedJammer;
    end;
end;

procedure TT3TowedJammerOnVehicle.SetActualTOwedLength(const Value: integer);
begin
  FActualTOwedLength := Value;
end;

procedure TT3TowedJammerOnVehicle.SetBearing(const Value: integer);
begin
  FBearing := Value;
end;

procedure TT3TowedJammerOnVehicle.SetDeploymentAction
  (const Value: TECMDeploymentAction);
begin
  FDeploymentAction := Value;
end;

procedure TT3TowedJammerOnVehicle.SetOrderedTowedLength(const Value: integer);
begin
  FOrderedTowedLength := Value;
end;

procedure TT3TowedJammerOnVehicle.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TT3TowedJammerOnVehicle.SetTargeting(const Value: TECMTargeting);
begin
  FTargeting := Value;
end;

function TT3TowedJammerOnVehicle.GetSnapshotData : _SS_TowedJammerOnVehicle ;
var
  ss : _SS_TowedJammerOnVehicle ;
begin
  ss.CM := TT3CounterMeasure(Self).GetSnapshotData;
  ss.Quantity:= Quantity;

  ss.TowedJammerDefinition.FData := TowedJammerDefinition.FData;
  ss.TowedJammerDefinition.FDef  := TowedJammerDefinition.FDef;
  ss.TowedJammerDefinition.FNote := TowedJammerDefinition.FNote;

  ss.DeploymentAction := byte(DeploymentAction);
  ss.Bearing:= Bearing ;
  ss.OrderedTowedLength:= OrderedTowedLength;
  ss.ActualTOwedLength:= ActualTOwedLength;
  ss.Targeting:= byte(Targeting) ;
  Result := ss ;
end;

procedure TT3TowedJammerOnVehicle.SetSnapshotData(const ss : _SS_TowedJammerOnVehicle);
begin
  TT3CounterMeasure(Self).SetSnapshotData(ss.CM);
  Quantity:= ss.Quantity ;
  TowedJammerDefinition.FData := ss.TowedJammerDefinition.FData;
  TowedJammerDefinition.FDef := ss.TowedJammerDefinition.FDef;
  TowedJammerDefinition.FNote := ss.TowedJammerDefinition.FNote;
  DeploymentAction := TECMDeploymentAction(ss.DeploymentAction);
  Bearing:= ss.Bearing ;
  OrderedTowedLength:= ss.OrderedTowedLength;
  ActualTOwedLength:= ss.ActualTOwedLength;
  Targeting:= TECMTargeting(ss.Targeting);

end;


{ TT3Chaff }

function TT3Chaff.cekRCS(const aDt: double): double;
var
  disTimeChaff, windSpeed : Double;
begin
  windSpeed := 0;
  if Assigned(Environment) then windSpeed := Environment.FData.Wind_Speed;

  disTimeChaff := DisTime - ((DisTime - DisTimeWind)* windSpeed / 100);

  RCS := RCS - (MaxRCS / disTimeChaff * aDt);

  Result := RCS;
end;

constructor TT3Chaff.Create;
begin
  inherited;

  FTacticalSymbol := TTacticalSymbol.Create;
//  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'ChaffFriend.bmp',
//    cgFriend);
  FPlatformDomain := 0;

  FLaunch := false;

  FMover := T2DMover.Create;
  FMover.Enabled := true;

  FAverageSpeed := 50; // knot
  FDescentRate := 10;
  FState := chClimb;
  FisHancur := false;
end;

destructor TT3Chaff.Destroy;
begin
  inherited;

  FTacticalSymbol.Free;
  FMover.Free;
end;

procedure TT3Chaff.Draw(aCnv: tCanvas);
begin
  inherited;

  if not Visible then
    exit;

  FTacticalSymbol.isVehicle := false;

  if FLaunch then
  begin
    FTacticalSymbol.SetTextVisibility( Visible);
    FTacticalSymbol.Visible := Visible;

    FTacticalSymbol.CallSign1   := '+' + Track_ID;
    FTacticalSymbol.SetTextColor(FTacticalSymbol.Color);
    FTacticalSymbol.Draw(aCnv);
  end;
end;

function TT3Chaff.getAltitude: single;
begin
  Result := FMover.Z * C_Degree_To_NauticalMile * C_NauticalMile_To_Metre;
end;

function TT3Chaff.getPos(const Index: integer): double;
begin
  Result := 0;

  try
    case Index of
      1:
        Result := ConvCartesian_To_Compass(FMover.Direction);
      2:
        Result := FMover.Speed;
    end;
  except
  end;
end;

procedure TT3Chaff.Initialize;
var
  color: TColor;
begin
  inherited;
  FBlooming := false;

  if Assigned(FParent) then
  begin
    FParentCourse := TT3PlatformInstance(FParent).Course;

    if IsInstructor then
    begin
      getCorrectSymbol(TT3Vehicle(FParent).PlatformDomain,
        TT3Vehicle(FParent).PlatformType,
        TT3Vehicle(FParent).Force_Designation, color);
    end
    else
      getCorrectSymbol(FPlatformDomain, PlatformType, 3, color);

    FTacticalSymbol.color := color;
//    FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'ChaffFriend.bmp', color);
    FTacticalSymbol.SymbolVisual.FontName := 'atct';
    FTacticalSymbol.SymbolVisual.CharSymbol := 'i';

    if IDState = 0 then
    begin
      FMover.x := FParent.getPositionX;
      FMover.y := FParent.getPositionY;
      FMover.Z := FParent.getPositionZ;
    end
    else
    begin
      FMover.x := FMapPositionX;
      FMover.y := FMapPositionY;
      FMover.Z := FParent.getPositionZ;
      IDState := 0;
    end;

    FPosition.x := FMover.x;
    FPosition.y := FMover.y;
    FPosition.Z := FMover.Z;
  end;
end;

procedure TT3Chaff.Launch;
begin
  if FLaunch then
    exit;

  FLaunch := true;

  FMover.VerticalSpeed := 5000; // feet per min
  FMover.Direction := ConvCompass_To_Cartesian(FParentCourse + Bearing);
  FMover.Speed := 0.5 * AverageSpeed; // biar jalan maka kasih stg dari kecepatan

  if Assigned(OnLaunched) then
    OnLaunched(Self);
end;

procedure TT3Chaff.Move(const aDeltaMs: double);
var
  altitude: double;
begin
  inherited;

  altitude := FBloomAltitude * C_Feet_To_Meter;

  if FLaunch then
  begin
    {$IFDEF SERVER}
    if cekRCS(aDeltaMs) < 0 then
    begin
      if Assigned(OnHancur) then
      begin
        Self.reasonDestroy := 6;
        OnHancur(Self, Self.UnitMakeDestroy, Self.reasonDestroy);
      end;
    end;
    {$ENDIF}

    if FState = chClimb then
    begin
      if getAltitude > altitude then
      begin
        FMover.VerticalSpeed := -FDescentRate;
        FMover.Direction := ConvCompass_To_Cartesian(FParentCourse + Bearing);
        // FMover.Speed  := AverageSpeed;
        FMover.Speed := 0;  //set awalnya o, berubah jika ada envi (sblmx 0.1)

        FState := chDrop;
        FBlooming := true;
      end;
    end
    else if FState = chDrop then
    begin
      if getAltitude <= 0 then
      begin
        FMover.Speed := 0;
        FLaunch := false;

        {$IFDEF SERVER}
        if Assigned(OnHancur) then
        begin
          Self.reasonDestroy := 5;
          OnHancur(Self, Self.UnitMakeDestroy, Self.reasonDestroy);
        end;
        {$ENDIF}
      end;
    end;

    FMover.Move(aDeltaMs);
    FPosition.x := FMover.x;
    FPosition.y := FMover.y;
    FPosition.Z := FMover.Z;
  end;
end;

procedure TT3Chaff.SetAltitude(const Value: single);
begin
  inherited;

  FMover.Z := Value / (C_Degree_To_NauticalMile * C_NauticalMile_To_Metre);
end;

procedure TT3Chaff.SetAverageSpeed(const Value: double);
begin
  FAverageSpeed := Value;
end;

procedure TT3Chaff.SetBearing(const Value: double);
begin
  FBearing := Value;
end;

procedure TT3Chaff.SetBloomAltitude(const Value: double);
begin
  FBloomAltitude := Value;
end;

procedure TT3Chaff.SetBlooming(const Value: boolean);
begin
  FBlooming := Value;
end;

procedure TT3Chaff.SetBloomRange(const Value: double);
begin
  FBloomRange := Value;
end;

procedure TT3Chaff.SetChaffCategory(const Value: TECMChaffCategory);
begin
  FChaffCategory := Value;
end;

procedure TT3Chaff.SetDescentRate(const Value: double);
begin
  FDescentRate := Value;
end;

procedure TT3Chaff.SetDisTime(const Value: Double);
begin
  FDisTime := Value;
end;

procedure TT3Chaff.SetDisTimeWind(const Value: Double);
begin
  FDisTimeWind := Value;
end;

procedure TT3Chaff.SetInstructor(const Value: boolean);
begin
  inherited;

  Initialize;
end;

procedure TT3Chaff.SetIsWasdal(const Value: Boolean);
begin
  inherited;

  Initialize;
end;

procedure TT3Chaff.setMaxRCS(const Value: Double);
begin
  FMaxRcs := Value;
end;

procedure TT3Chaff.SetOwner(const Value: TSimObject);
begin
  FOwner := Value;
end;

procedure TT3Chaff.setPos(const Index: integer; const Value: double);
begin
  inherited;
  case Index of
    1:
      FMover.Direction := ConvCompass_To_Cartesian(Value);
    2:
      FMover.Speed := Value;
  end;
end;

procedure TT3Chaff.setPositionX(const v: double);
begin
  inherited;
  FMover.x := v;
end;

procedure TT3Chaff.setPositionY(const v: double);
begin
  inherited;
  FMover.y := v;
end;

procedure TT3Chaff.setPositionZ(const v: double);
begin
  inherited;

  FMover.Z := v;
end;

procedure TT3Chaff.SetRCS(const Value: double);
begin
  FRCS := Value;
end;

{ farid Select Chaff }
procedure TT3Chaff.SetSelected(const Value: boolean);
var
  col: TColor;
begin
//  col := FTacticalSymbol.Symbol.color;
  FTacticalSymbol.Selected := Value;
  FTacticalSymbol.color := col;
//  FTacticalSymbol.Symbol.Visible := true;
//  FTacticalSymbol.Symbol.color := col;

  FSelected := Value;

  if Assigned(FOnSelected) then
    FOnSelected(Self);
end;

procedure TT3Chaff.UpdateVisual;
var
  pt: TPOint;
begin
  inherited;
  Converter.ConvertToScreen(FMover.x, FMover.y, pt.x, pt.y);

  FTacticalSymbol.Center := pt;
  FTacticalSymbol.ConvertCoord(Converter);
end;

procedure TT3Chaff.RepositionTo(const x, y: double);
begin
  inherited;
  FMover.x := x;
  FMover.y := y;
end;

{ snapshot }
function TT3Chaff.GetSnapshotData : _SS_TT3Chaff ;
var
    ss : _SS_TT3Chaff ;
begin
    ss.P := TT3PlatformInstance(Self).GetSnapshotData ;

    if FParent <> nil then ss.Owner := TT3PlatformInstance(FParent).InstanceIndex;
    if Owner <> nil then ss.Owner := TT3PlatformInstance(Owner).InstanceIndex;

    ss.LauncherID := Self.LauncherID;
    ss.BloomRange := Self.BloomRange;
    ss.BloomAltitude := Self.BloomAltitude;
    ss.MapPositionX := Self.MapPositionX;
    ss.MapPositionY := Self.MapPositionY;
    ss.ChaffInstanceIndex := Self.ChaffInstanceIndex;

    Result := ss ;
end;

procedure TT3Chaff.SetSnapshotData(const ss : _SS_TT3Chaff);
begin
   TT3PlatformInstance(Self).SetSnapshotData(ss.P) ;
   Self.BloomRange := ss.BloomRange;
   Self.BloomAltitude := ss.BloomAltitude;
end;

//==============================================================================

{ TT3AirBubbleOnVehicle }

constructor TT3AirBubbleOnVehicle.Create;
begin
  inherited;
end;

procedure TT3AirBubbleOnVehicle.Move(const aDeltaMs: double);
begin
  inherited;

  if FState = 0 then
    exit; // Launcher idle;

  {$IFDEF SERVER}
  if FFirstLaunch then
  begin
    FOnFire(Self);

    if not FIsFiring then
      FIsFiring := true;

    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3AirBubbleOnVehicle.Move', InstanceName + ' launch Bubble ');

    inc(FSalvoCounter);
    FFirstLaunch := false;
  end
  else
  begin
    FCounter := FCounter + aDeltaMs;
    if FCounter >= FDelay then
    begin
      if Assigned(FOnFire) then
        FOnFire(Self);

      if Assigned(OnLogEventStr) then
        OnLogEventStr('TT3AirBubbleOnVehicle.Move', InstanceName + ' launch Bubble ');

      inc(FSalvoCounter);
      FCounter := 0;
    end;
  end;

  if FSalvoCounter = FSalvoSize then
  begin
    if Assigned(FOnStopFire) then
      FOnStopFire(Self);
    if FIsFiring then
      FIsFiring := false;

    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3AirBubbleOnVehicle.Move', InstanceName + ' stop launch');

    FState := 0;
    FSalvoCounter := 0;
    FFirstLaunch := true;
  end;
  {$ENDIF}
end;

procedure TT3AirBubbleOnVehicle.Initialize;
begin
  inherited;

  if Assigned(UnitDefinition) then
    FAirBubbleMount := TAir_Bubble_Mount(UnitDefinition);

  if Assigned(FAirBubbleMount) then
  begin
    InstanceName := FAirBubbleMount.FData.Instance_Identifier;
    InstanceIndex := FAirBubbleMount.FData.Air_Bubble_Instance_Index;
    Quantity := FAirBubbleMount.FData.Bubble_Qty_On_Board;
    Category := ecBubble;
    Parent := FParent;
  end;

  FSalvoSize := 1;
end;

function TT3AirBubbleOnVehicle.PrepareLaunch: TT3AirBubble;
var
  Bubble: TT3AirBubble;
begin
  //Bubble := nil;
  Result := nil;

  if not(Quantity > 0) then
    exit;

  Bubble := TT3AirBubble.Create;

  Bubble.Parent := FParent;
  Bubble.Owner  := FParent;
  Bubble.UnitDefinition := UnitDefinition;
  Bubble.UnitGroup := UnitGroup;
  Bubble.Enable := Enable;
  Bubble.InstanceName := InstanceName;
  Bubble.Track_ID := 'BB';
  Bubble.Force_Designation := TT3PlatformInstance(FParent).Force_Designation;
  Bubble.PlatformType      := vhtAirBubble;

  // Bubble.BloomRange      := TT3ChaffLauncher(ChaffLaunchers.Items[Launcher-1]).BloomRange;
  Bubble.BloomDepth := BloomDepth; // 200;//TT3BubbleLauncher(ChaffLaunchers.Items[Launcher-1]).BloomDepth;
  Bubble.Angle := Angle;
  Bubble.DescentRate := FAirBubbleMount.FAirBubble_Def.Descent_Rate;
  Bubble.AscentRate := FAirBubbleMount.FAirBubble_Def.Ascent_Rate;
  Bubble.RCS := FAirBubbleMount.FAirBubble_Def.Max_Acoustic_Cross;
  Bubble.BubbleCategory := ecBubble;
  Bubble.isInstructor  := TT3PlatformInstance(Parent).isInstructor;
  Bubble.isWasdal := TT3PlatformInstance(Parent).isWasdal;


  Result := Bubble;
  Quantity := Quantity - 1;
end;

procedure TT3AirBubbleOnVehicle.SetAngle(const Value: double);
begin
  FAngle := Value;
end;

procedure TT3AirBubbleOnVehicle.SetBloomDepth(const Value: double);
begin
  FBloomDepth := Value;
end;

procedure TT3AirBubbleOnVehicle.SetBubbleInstanceIndex(const Value: integer);
begin
  FInstanceIndex := Value;
end;

procedure TT3AirBubbleOnVehicle.SetFire(const Value: TNotifyEvent);
begin
  FOnFire := Value;
end;

procedure TT3AirBubbleOnVehicle.SetLauncher(const Value: integer);
begin
  FLauncher := Value;
end;

procedure TT3AirBubbleOnVehicle.SetNumber(const Value: integer);
begin
  FNumber := Value;
end;

procedure TT3AirBubbleOnVehicle.SetOnStopFire(const Value: TNotifyEvent);
begin
  FOnStopFire := Value;
end;

procedure TT3AirBubbleOnVehicle.SetQuantity(const Value: integer);
begin
  FQuantity := Value;

  if Assigned(OnQuantityChange) then
    OnQuantityChange(Self);
end;

procedure TT3AirBubbleOnVehicle.SetSalvoSize(const Value: integer);
begin
  FSalvoSize := Value;
end;

procedure TT3AirBubbleOnVehicle.SetState(const Value: integer);
begin
  FState := Value;
end;

function TT3AirBubbleOnVehicle.GetSnapshotData : _SS_AirBubbleOnVehicle ;
var
  ss : _SS_AirBubbleOnVehicle ;
begin
  ss.CM := TT3CounterMeasure(Self).GetSnapshotData;
  if Parent <> nil then ss.Owner    := TT3Unit(Parent).InstanceIndex ;
  ss.Quantity                       := Quantity ;
  ss.AirBubbleMount.FData           := AirBubbleMount.FData;
  ss.AirBubbleMount.FAirBubble_Def  := AirBubbleMount.FAirBubble_Def;
  ss.AirBubbleMount.FNote           := AirBubbleMount.FNote;
  ss.Launcher                       := Launcher ;
  ss.BloomDepth                     := BloomDepth ;
  ss.SalvoSize                      := SalvoSize ;
  ss.Angle                          := Angle ;
  ss.BubbleInstanceINdex            := BubbleInstanceINdex ;
  ss.State                          := State ;
  ss.Number                         := Number ;

  Result := ss ;
end;

procedure TT3AirBubbleOnVehicle.SetSnapshotData(const ss : _SS_AirBubbleOnVehicle);
begin
  TT3CounterMeasure(Self).SetSnapshotData(ss.CM);
  Quantity                       := ss.Quantity ;
  AirBubbleMount.FData           := ss.AirBubbleMount.FData;
  AirBubbleMount.FAirBubble_Def  := ss.AirBubbleMount.FAirBubble_Def;
  AirBubbleMount.FNote           := ss.AirBubbleMount.FNote;
  Launcher                       := ss.Launcher ;
  BloomDepth                     := ss.BloomDepth ;
  SalvoSize                      := ss.SalvoSize ;
  Angle                          := ss.Angle ;
  BubbleInstanceINdex            := ss.BubbleInstanceINdex ;
  State                          := ss.State ;
  Number                         := ss.Number ;
end;

{ TT3AirBubble }

constructor TT3AirBubble.Create;
begin
  inherited;

  FTacticalSymbol := TTacticalSymbol.Create;
  FSignPlatform := TTextVisual.Create;
//  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath +
//      'SubsurfaceFriend.bmp', cgHostile);
  FPlatformDomain := 2;

  FLaunch := false;

  FMover := T2DMover.Create;
  FMover.Enabled := true;

  FAverageSpeed := 50; // knot
  FDescentRate := 10;
  FAscentRate := 20; // FAirBubbleMount.FAirBubble_Def.Ascent_Rate;
  // FDescentRate  := FAirBubbleMount.FAirBubble_Def.Descent_Rate;

  FState := ecgClimb;
  FisHancur := false;
end;

destructor TT3AirBubble.Destroy;
begin
  inherited;

  FTacticalSymbol.Free;
  FMover.Free;
end;

procedure TT3AirBubble.Initialize;
var
  color: TColor;
  Symbol: Char;
begin
  inherited;
  FBlooming := false;

  if Assigned(UnitDefinition) then
    FAirBubbleMount := TAir_Bubble_Mount(UnitDefinition);

  if Assigned(FParent) then
  begin
    FParentCourse := TT3PlatformInstance(FParent).Course;

    if IsInstructor then
    begin
      Symbol := getCorrectSymbol(2, TT3Vehicle(FParent).PlatformType,
        TT3Vehicle(FParent).Force_Designation, color);
    end
    else
    begin
      Symbol := getCorrectSymbol(2, PlatformType, 3, color);
    end;

    FTacticalSymbol.color := color;
//    FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + Symbol + '.bmp', color);
    FTacticalSymbol.SymbolVisual.FontName := 'atct';
    FTacticalSymbol.SymbolVisual.CharSymbol := Symbol;
    FTacticalSymbol.SpeedVector.color := color;
    FTacticalSymbol.SetTextColor(color);
    FSignPlatform.color := color;

    FMover.x := FParent.getPositionX;
    FMover.y := FParent.getPositionY;
    FMover.Z := FParent.getPositionZ;

    FPosition.x := FMover.x;
    FPosition.y := FMover.y;
    FPosition.Z := FMover.Z;
  end;
end;

procedure TT3AirBubble.Launch;
begin
  if FLaunch then
    exit;

  FLaunch := true;

  FMover.VerticalSpeed := 5000; // feet per min
  FMover.Direction := 0.0; // ConvCompass_To_Cartesian(FParentCourse + Bearing);
  FMover.Speed := 0.5 * AverageSpeed; // biar jalan maka kasih stg dari keepatan

  if Assigned(OnLaunched) then
    OnLaunched(Self);
end;

procedure TT3AirBubble.Move(const aDeltaMs: double);
var
  altitude: double;
  dmn: integer;
  dx, dy : Double;
  temp : Boolean;
begin
  inherited;

  altitude := FBloomDepth * C_Feet_To_Meter;

  if altitude = 0 then
    FState := ecgDrop;

  if FLaunch then
  begin
    if FState = ecgClimb then
    begin
      if getAltitude > altitude then
      begin
        FMover.VerticalSpeed := -FAscentRate;
        FMover.Direction := 0.0; // ConvCompass_To_Cartesian(FParentCourse + Bearing);
        FMover.Speed := AverageSpeed;
        FMover.Speed := 0.1;

        FState := ecgDrop;
        FBlooming := true;
      end;
    end
    else if FState = ecgDrop then
    begin
      if getAltitude <= 0 then
      begin
        FMover.Speed := 0;
        FLaunch := false;

        //{$IfDef SERVER}
        if Assigned(OnHancur) then
        begin
          Self.reasonDestroy := 2;
          OnHancur(Self, Self.UnitMakeDestroy, Self.reasonDestroy);
        end;
        //{$EndIf}
      end;
    end;

    FMover.Move(aDeltaMs);
    FPosition.x := FMover.x;
    FPosition.y := FMover.y;
    FPosition.Z := FMover.Z;

    dx := 0;
    dy := 0;
    temp := False; //add
    if Assigned(Environment) then
    begin
      dmn := 2;
      Environment.getCalc_EnviEffect(dmn, Heading, GroundSpeed, temp, FCourse, FVelocity);

      dx := Environment.get_DX(dmn, aDeltaMs);
      dy := Environment.get_DY(dmn, aDeltaMs);
    end;

    FOutPointX := FMover.X + dx;
    FOutPointY := FMover.Y + dy;
    FPosition.Z := FMover.Z;

    FMover.X := FOutPointX;
    FMover.Y := FOutPointY;

  end;
end;

procedure TT3AirBubble.UpdateVisual;
var
  pt: TPOint;
begin
  inherited;
  Converter.ConvertToScreen(FMover.x, FMover.y, pt.x, pt.y);

  FTacticalSymbol.Center := pt;
  FTacticalSymbol.ConvertCoord(Converter);

end;

procedure TT3AirBubble.SetAngle(const Value: double);
begin
  FAngle := Value;
end;

procedure TT3AirBubble.SetAscentRate(const Value: double);
begin
  FAscentRate := Value;
end;

procedure TT3AirBubble.SetAverageSpeed(const Value: double);
begin
  FAverageSpeed := Value;
end;

procedure TT3AirBubble.SetBloomDepth(const Value: double);
begin
  FBloomDepth := Value;
end;

procedure TT3AirBubble.SetBubbleCat(const Value: TECMCategory);
begin
  FBubbleCat := Value;
end;

procedure TT3AirBubble.SetDescentRate(const Value: double);
begin
  FDescentRate := Value;
end;

procedure TT3AirBubble.SetInstructor(const Value: boolean);
begin
  inherited;
  Initialize;
end;

procedure TT3AirBubble.SetIsWasdal(const Value: Boolean);
begin
  inherited;

  Initialize;
end;

procedure TT3AirBubble.SetOwner(const Value: TSimObject);
begin
  FOwner := Value;
end;

procedure TT3AirBubble.RepositionTo(const x, y: double);
begin
  inherited;
  FMover.x := x;
  FMover.y := y;
end;

procedure TT3AirBubble.setPositionX(const v: double);
begin
  inherited;
  FMover.x := v;
end;

procedure TT3AirBubble.setPositionY(const v: double);
begin
  inherited;
  FMover.y := v;
end;

procedure TT3AirBubble.setPositionZ(const v: double);
begin
  inherited;
  FMover.Z := v;
end;

procedure TT3AirBubble.SetRCS(const Value: double);
begin
  FRCS := Value;
end;

procedure TT3AirBubble.SetSelected(const Value: boolean);
var
  col: TColor;
begin
//  col := FTacticalSymbol.Symbol.color;
  FTacticalSymbol.Selected := Value;
  FTacticalSymbol.color := col;
//  FTacticalSymbol.Symbol.Visible := true;
//  FTacticalSymbol.Symbol.color := col;

  FSelected := Value;

  if Assigned(FOnSelected) then
    FOnSelected(Self);

end;

procedure TT3AirBubble.SetState(const Value: TT3AirBubbleState);
begin
  FState := Value;
end;

procedure TT3AirBubble.SetVisible(const Value: boolean);
begin
  inherited;
  FBubVisible := Value;
end;

procedure TT3AirBubble.Draw(aCnv: tCanvas);
var
  xPos, yPos: integer;
begin
  inherited;
  if not Visible then
    exit;

  FTacticalSymbol.isVehicle := false;

  if FLaunch then
  begin
    FTacticalSymbol.SpeedVector.Speed := 20;
    FTacticalSymbol.SpeedVector.Course := FAngle;
    FTacticalSymbol.SpeedVector.Visible := true;
    FTacticalSymbol.SetTextVisibility(Visible);
    FTacticalSymbol.Visible := Visible;

    //if IsInstructor then
      FTacticalSymbol.CallSign1 := Track_ID;
    //else
      //FTacticalSymbol.TextVisual.Text := IntToStr(TrackNumber);

    // FTacticalSymbol.Color := RGB(0,0,50);
    FTacticalSymbol.Draw(aCnv);

    xPos := FTacticalSymbol.Center.x;
    yPos := FTacticalSymbol.Center.y;
    FSignPlatform.Text := '+';
    FSignPlatform.Center := Point(xPos - 7, yPos);
    FSignPlatform.Visible := Visible;
    FSignPlatform.Draw(aCnv);
  end;
end;

function TT3AirBubble.getAltitude: single;
begin
  Result := FMover.Z * C_Degree_To_NauticalMile * C_NauticalMile_To_Metre;
end;

{ snapshot }
function TT3AirBubble.GetSnapshotData : _SS_TT3AirBubble ;
var
    ss : _SS_TT3AirBubble ;
begin
    ss.P := TT3PlatformInstance(Self).GetSnapshotData ;
    ss.BubbleInstanceIndex := BubbleInstanceIndex;

    if Parent <> nil then ss.Owner  := TT3Unit(Parent).InstanceIndex ;
    if Owner <> nil then ss.Owner  := TT3Unit(Owner).InstanceIndex ;

    ss.BloomDepth := Self.BloomDepth;
    ss.BloomAngle := Self.Angle;

    Result := ss ;
end;

procedure TT3AirBubble.SetSnapshotData(const ss : _SS_TT3AirBubble);
begin
  TT3PlatformInstance(Self).SetSnapshotData(ss.P) ;

  Self.BloomDepth := ss.BloomDepth;
  Self.Angle := ss.BloomAngle;
end;
{ snapshot }


constructor TT3InfraredDecoyOnVehicle.Create;
begin
  inherited;

end;

//procedure TT3InfraredDecoyOnVehicle.Deploy;
//begin
//  if Quantity <= 0 then
//    exit;
//
//  Quantity := Quantity - 1;
//
//  if Quantity = 0 then
//    Status := esUnavailable;
//end;

function TT3InfraredDecoyOnVehicle.CreateInfraredDecoy: TT3PlatformInstance;
var
  dec : TT3InfraredDecoy;
begin
  dec := TT3InfraredDecoy.Create;
  dec.Parent := Self;
  dec.FInfraredDecoyDefinition := self.InfraredDecoyDefinition;
  dec.Environment := Self.Environment;

  //set track dan yang berkaitan dengan gambar
  dec.TrackDomain := TrackDomain;
  dec.TrackIdent := TrackIdent;

  dec.PosX := PosX;
  dec.PosY := PosY;
  dec.PosZ := PosZ;
  dec.UnitGroup := UnitGroup;

  dec.Initialize;

  Result := dec;
end;

function TT3InfraredDecoyOnVehicle.Deploy: TT3PlatformInstance;
begin
  result := nil;

  if Quantity <= 0 then
    Exit;

  Result := CreateInfraredDecoy;

  Quantity := Quantity - 1;
  if Quantity = 0 then
    Status := esUnavailable;
end;

function TT3InfraredDecoyOnVehicle.DeployIRDecoy: TT3PlatformInstance;
var
  dec : TT3InfraredDecoy;
begin
  dec := TT3InfraredDecoy.Create;
  dec.InfraredDecoyDefinition := InfraredDecoyDefinition;
  dec.Environment := Self.Environment;

  //set domain dan identity
  dec.TrackDomain := TrackDomain;
  dec.TrackIdent := TrackIdent;

  dec.Initialize;

  //posisi awal sama dengan yg deploy
  dec.PosX := PosX;
  dec.PosY := PosY;
  dec.PosZ := PosZ;

  Result := dec;
end;

procedure TT3InfraredDecoyOnVehicle.Initialize;
begin
  inherited;

  if Assigned(UnitDefinition) then
    FInfraredDecoyDefinition := TInfrared_Decoy_On_Board(UnitDefinition);

  if Assigned(FInfraredDecoyDefinition) then
    with FInfraredDecoyDefinition do
    begin
      InstanceIndex := FData.Infrared_Decoy_Instance_Index;
      InstanceName := FData.Instance_Identifier;
      Quantity := FData.Infrared_Decoy_Qty_On_Board;
      Category := ecInfraredDecoy;
    end;
end;

procedure TT3InfraredDecoyOnVehicle.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

function TT3InfraredDecoyOnVehicle.GetSnapshotData : _SS_InfraredDecoyOnVehicle ;
var
  ss      :  _SS_InfraredDecoyOnVehicle ;
  i       : integer ;

begin
  ss.CM := TT3CounterMeasure(Self).GetSnapshotData;
  ss.Quantity := Quantity  ;

  if InfraredDecoyDefinition <> nil then begin
    with InfraredDecoyDefinition do begin
      ss.InfraredDecoyDefinition.FData  := FData ;
      ss.InfraredDecoyDefinition.FInfraRedDecoy_Def  := FInfraRedDecoy_Def ;
      if FScripted_Infra <> nil then
      begin
        SetLength(ss.InfraredDecoyDefinition.FScripted_Infra,FScripted_Infra.Count);
        for i := 0 to FScripted_Infra.Count-1 do begin
            ss.InfraredDecoyDefinition.FScripted_Infra[i].Event  := TScripted_Infrared(FScripted_Infra[i]).Event.FData;
            ss.InfraredDecoyDefinition.FScripted_Infra[i].Behav  := TScripted_Infrared(FScripted_Infra[i]).Behav.FData;
        end;
      end;
      if FPattern_Infra <> nil then
      begin
        SetLength(ss.InfraredDecoyDefinition.FPattern_Infra,FPattern_Infra.Count);
        for i := 0 to FPattern_Infra.Count-1 do begin
            ss.InfraredDecoyDefinition.FPattern_Infra[i].Event   := TPattern_Infrared(FPattern_Infra[i]).Event.FData;
            ss.InfraredDecoyDefinition.FPattern_Infra[i].Pattern := TPattern_Infrared(FPattern_Infra[i]).Pattern.FData;
        end;
      end;
      ss.InfraredDecoyDefinition.FNote := FNote ;
    end;
  end;

  Result := ss ;
end;

procedure TT3InfraredDecoyOnVehicle.SetSnapshotData(const ss : _SS_InfraredDecoyOnVehicle);
var
  i : integer ;
  script  : TScripted_Infrared;
  pattern : TPattern_Infrared;
begin
  TT3CounterMeasure(Self).SetSnapshotData(ss.CM);
  Quantity := ss.Quantity ;
  if InfraredDecoyDefinition <> nil then begin
    with InfraredDecoyDefinition do begin
      FData  := ss.InfraredDecoyDefinition.FData ;
      FInfraRedDecoy_Def  := ss.InfraredDecoyDefinition.FInfraRedDecoy_Def ;
      for i := low(ss.InfraredDecoyDefinition.FScripted_Infra) to high(ss.InfraredDecoyDefinition.FScripted_Infra) do begin
          script := TScripted_Infrared.Create;
          script.Event.FData := ss.InfraredDecoyDefinition.FScripted_Infra[i].Event ;
          script.Behav.FData := ss.InfraredDecoyDefinition.FScripted_Infra[i].Behav ;
          FScripted_Infra.Add(script);
      end;
      for i := low(ss.InfraredDecoyDefinition.FPattern_Infra) to high(ss.InfraredDecoyDefinition.FPattern_Infra) do begin
          pattern := TPattern_Infrared.Create;
          pattern.Event.FData   := ss.InfraredDecoyDefinition.FPattern_Infra[i].Event ;
          pattern.Pattern.FData   := ss.InfraredDecoyDefinition.FPattern_Infra[i].Pattern ;
          FPattern_Infra.Add(pattern);
      end;
      FNote := ss.InfraredDecoyDefinition.FNote ;
    end;
  end;

end;

procedure TT3Decoy.Initialize;
begin
  Inherited;
end;

function TT3Decoy.GetSnapshotData : _SS_TT3Decoy ;
var
    ss : _SS_TT3Decoy ;
begin
    ss.P := TT3PlatformInstance(Self).GetSnapshotData ;
    Result := ss ;
end;

procedure TT3Decoy.SetSnapshotData(const ss : _SS_TT3Decoy);
begin
    TT3PlatformInstance(Self).SetSnapshotData(ss.P) ;
end;

constructor TT3InfraredDecoy.Create;
begin
  inherited;
  FTacticalSymbol := TTacticalSymbol.Create;
end;

destructor TT3InfraredDecoy.Destroy;
begin
  inherited;
end;

procedure TT3InfraredDecoy.Initialize;
var
  sName : String;
  color : TColor;
  MyParent : TSimObject;
begin
  Inherited;
  if Assigned(InfraredDecoyDefinition) then
  begin
    with InfraredDecoyDefinition do
    begin
      InstanceName := FInfraRedDecoy_Def.Infrared_Decoy_Identifier;
      InstanceIndex := FInfraRedDecoy_Def.Infrared_Decoy_Index;

      FMaxInfraredIntensity := FInfraRedDecoy_Def.Max_Infrared_Cross;
      FBloomTime := FInfraRedDecoy_Def.Bloom_Time;
      FSustainTime := FInfraRedDecoy_Def.Sustain_Time;
      FMaxDissipationTime := FInfraRedDecoy_Def.Max_Dissipation_Time;
      FMinDissipationTIme := FInfraRedDecoy_Def.Min_Dissipation_Time;
      FDescentRate := FInfraRedDecoy_Def.Descent_Rate;
    end;

    IRState := irsBlooming; //state awal blooming
  end;

  FMover.X := PosX;
  FMover.Y := PosY;
  FMover.Z := PosZ;
  FMover.Enabled := True;
  FMover.DescentRate := FDescentRate;
  FMover.VerticalSpeed := 0;

  if Assigned(Environment) then
  begin
    FMover.Speed := Environment.FData.Ocean_Current_Speed;
    FMover.Direction := Environment.FData.Ocean_Current_Direction;
  end;

  Altitude := TT3PlatformInstance(Self.Parent.Parent).Altitude;

  //init draw;
  sName := vSymbolSetting.ImgPath +  'InfraredDecoyFriend' + '.bmp';

  if FileExists(sName) then
  begin
    MyParent := TT3FloatingDecoyOnVehicle(FParent).FParent;
    getCorrectSymbol(TT3Vehicle(MyParent).PlatformDomain,
      TT3Vehicle(MyParent).PlatformType,
      TT3Vehicle(MyParent).Force_Designation, color);
//    FTacticalSymbol.Color := getColorFromIdentity(TrackIdent);
    FTacticalSymbol.Color := color;
    FTacticalSymbol.SetTextColor(color);
    FTacticalSymbol.SymbolVisual.FontName := 'atct';
    FTacticalSymbol.SymbolVisual.CharSymbol := 'i';
//    FTacticalSymbol.Symbol.LoadBitmap(sName,color);
  end;
end;

procedure TT3InfraredDecoy.HorizontalMovement(aDeltaMs : Double);
begin
  PosX := FMover.X;
  PosY := FMover.Y;
end;

procedure TT3InfraredDecoy.VerticalMovement(aDeltaMs: Double);
begin
  PosZ := FMover.Z;
end;

procedure TT3InfraredDecoy.Move(const aDeltaMs: Double);
{var
  BloomDuration : Double; }
begin
//  FMover.Move(aDeltaMs);
  HorizontalMovement(aDeltaMs);
  VerticalMovement(aDeltaMs);

  //checking status
  if Assigned(OnCheckStateIR) then
  begin
    OnCheckStateIR(Self, aDeltaMs);
  end;
end;

procedure TT3InfraredDecoy.RepositionTo(const x, y: double);
begin
  inherited;
  FMover.x := x;
  FMover.y := y;
end;

procedure TT3InfraredDecoy.SetAltitude(const Value: single);
begin
  inherited;

  FMover.Z := Value / (C_Degree_To_NauticalMile * C_NauticalMile_To_Metre);
end;

procedure TT3InfraredDecoy.Draw(aCnv: TCanvas);
var
  pt : TPoint;
begin
  inherited;

  FTacticalSymbol.isVehicle := false;

  Converter.ConvertToScreen(FMover.x, FMover.y, pt.x, pt.y);

  FTacticalSymbol.Center := pt;
  FTacticalSymbol.ConvertCoord(Converter);

  FTacticalSymbol.SetTextVisibility(Visible);
  FTacticalSymbol.Visible := Visible;

//  FTacticalSymbol.Color :=

  FTacticalSymbol.Draw(aCnv);
end;

function TT3InfraredDecoy.getAltitude: single;
begin
  Result := FMover.Z * C_Degree_To_NauticalMile * C_NauticalMile_To_Metre;
end;

procedure TT3InfraredDecoy.UpdateVisual;
var
  pt: TPOint;
begin
  inherited;
  Converter.ConvertToScreen(FMover.x, FMover.y, pt.x, pt.y);

  FTacticalSymbol.Center := pt;
  FTacticalSymbol.ConvertCoord(Converter);

end;

{ TT3Jammer }

function TT3Jammer.GetSnapshotData: _SS_TT3Jammer;
var
    ss : _SS_TT3Jammer ;
begin
    ss.P := TT3PlatformInstance(Self).GetSnapshotData ;
    if Parent <> nil then
      ss.Owner  := TT3Unit(Parent).InstanceIndex ;
    Result := ss ;
end;

procedure TT3Jammer.SetSnapshotData(const ss: _SS_TT3Jammer);
begin
    TT3PlatformInstance(Self).SetSnapshotData(ss.P) ;
end;

end.
