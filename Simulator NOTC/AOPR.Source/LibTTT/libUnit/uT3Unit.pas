unit uT3Unit;

interface

uses Classes, Graphics, uSimObjects, uDBAsset_MotionCharacteristics, tttData,
    uGameData_TTT, uT3Listener, uDataTypes, uBaseCoordSystem, uObjectVisuals,
    uCalculationEnvi, uDBAsset_GameEnvironment,  uDBGame_Defaults, uSnapshotData,
    uT3Common, SysUtils, uDBAsset_Logistic,uDBAsset_Capability ;

type

  TT3Unit = class(TSimObject)
  private
    FOnLogEventStr: TLogStrProc;
    FOnFreeMe     : TOnPlatformFreeMe;
    FFlagShowStatusDestroy: Boolean;
    FOnLogStr     : TGetStrProc;
    FVisible      : boolean;
    FOnLogTemporary : TGetStrProc;
    FOnCollision : TOnCollision;
    FOnChangeHeading : TOnChangeHeading;

    FOnChangePosition: TOnChangePosition;
    FOnFuelEmpty: TOnFuelEmpty;
//    FInstanceIndex: integer;

    procedure SetOnLogEventStr(const Value: TLogStrProc);
    procedure SetOnFreeMe(const Value: TOnPlatformFreeMe);
    procedure SetFlagShowStatusDestroy(const Value: Boolean);
    procedure SetOnLogStr(const Value: TGetStrProc);
    procedure SetOnLogTemporary(const Value: TGetStrProc);

  protected
    FUnitGroup      : boolean;
    FUnitData       : TObject;
    FLethality      : integer;
    FInstance_Name  : string;
    FInstance_Class  : string;

    FControlled     : boolean;
    FSelected       : boolean;
    FIsRepositioning: boolean;
    FOnDestroy      : TNotifyEvent;
    FOnSelected     : TnotifyEvent;
    FOnControlled   : TNotifyEvent;

    FDamageStatus   : TRecDamageStatus;
    FOnDamageChanged: TNotifyDamageChange;

    FTrackNumber    : integer;
    FTrackIdent     : integer;
    FTrackDomain    : integer;

    FListenerList   : TList;
    FPackListDelay  : double;
    FDelayCounter   : double;

    FDetectabilityType : Integer;
  	FOnHancur: THancurEvent;

    FisInstructor         : Boolean;
    FIsWasdal             : Boolean;
    sDt : double;

    procedure SetUnitData(const Value: TObject);virtual;
    procedure SetLethality(const Value: integer);
    procedure SetInstanceIndex(const Value: integer);
    procedure SetTrackNumber(const Value: integer);
    procedure SetOnControlled(const Value: TNotifyEvent);
    procedure SetOnSelected(const Value: TnotifyEvent);
    procedure SetInstance_Name(const Value: string);
    function getInstanceClass: string;  virtual;
    procedure SetInstructor(const Value: Boolean);virtual;
    procedure SetIsWasdal(const Value: Boolean); virtual;

    procedure SetControlled(const Value: boolean); virtual;
    procedure SetSelected(const Value: boolean); virtual;
    procedure SetUnitGroup(const Value: boolean); virtual;

    procedure updateHealthStatus(const i: integer; val: single); virtual;
    procedure setHealthStatus(const i: integer; val: single);
    function  getHealthStatus(const i: integer) : single;

    procedure LoadTrackSymbol; virtual;
    function getTrackLabel: string; virtual;
    procedure setTrackLabel(const Value: string); virtual;

    procedure SetTrackDomain(const Value: integer); virtual;
    procedure SetTrackIdent(const Value: integer); virtual;
    procedure SetFreeMe(const Value: boolean);override;
    procedure SetVisible(const Value: boolean);virtual;

    procedure TriggerListener(Sender : TObject;const PropsID : TPropsID;
        const Value : integer);overload;virtual;
    procedure TriggerListener(Sender : TObject;const PropsID : TPropsID;
        const Value : double);overload;virtual;
    procedure TriggerListener(Sender : TObject;const PropsID : TPropsID;
        const Value : boolean);overload;virtual;
    procedure TriggerListener(Sender : TObject;const PropsID : TPropsID;
        const Value : byte);overload;virtual;
    procedure TriggerListener(Sender : TObject;const PropsID : TPropsID;
        const Value : String);overload;virtual;
    procedure SetOwner(const Value: TSimObject);override;
  public
    NoCubicle   : Integer;
    Initialized : boolean;
    Environment : TGame_Environment_Definition;
    GameDefaults : TGame_Defaults;     //mm gd

    constructor Create; virtual;
    destructor Destroy;override;

    function GetSnapshotData : _SS_TT3Unit ;
    procedure SetSnapshotData(const ss : _SS_TT3Unit);

    procedure Initialize; virtual;
    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure BeginReposition;
    procedure EndReposition;
    procedure RepositionTo(const x, y: double); virtual;
    procedure FreeChilds; override;

    property UnitGroup  : boolean read FUnitGroup write SetUnitGroup;
    property UnitDefinition: TObject read FUnitData write SetUnitData;
    property Lethality  : integer read FLethality write SetLethality;
    property InstanceIndex : integer read FInstanceIndex write SetInstanceIndex;
    property Selected   : boolean read FSelected write SetSelected;
    property Controlled : boolean read FControlled write SetControlled;
    property IsRepositioning  : boolean read FIsRepositioning;

    property Health : single index 1
      read getHealthStatus write setHealthStatus;
    property HealthPercent : single index 2
      read getHealthStatus write setHealthStatus;
    property OnDamageChanged: TNotifyDamageChange
     read FOnDamageChanged write FOnDamageChanged;

    property InstanceName     : string read FInstance_Name write SetInstance_Name;
    property InstanceClass    : string read getInstanceClass;
    property TrackNumber : integer read FTrackNumber write SetTrackNumber;
    property OnSelected   : TnotifyEvent read FOnSelected write SetOnSelected;
    property OnControlled : TNotifyEvent read FOnControlled write SetOnControlled;
        // untuk tampilan di cubicle.
    property TrackLabel  : string read getTrackLabel write setTrackLabel;
    property TrackDomain : integer read FTrackDomain write SetTrackDomain;
    property TrackIdent  : integer read FTrackIdent write SetTrackIdent;

    property OnLogEventStr: TLogStrProc  read FOnLogEventStr write SetOnLogEventStr;
    property OnLogTemporary: TGetStrProc read FOnLogTemporary write SetOnLogTemporary;
    property OnLogStr: TGetStrProc  read FOnLogStr write SetOnLogStr;
    property OnFreeMe : TOnPlatformFreeMe read FOnFreeMe write SetOnFreeMe;

    procedure addListener(Value : TEventListener);
    procedure removeListener(Value : TEventListener);overload;
    procedure removeListener(Value : String);overload;
    property DamageStatus : TRecDamageStatus read FDamageStatus;

    property DetectabilityType : Integer read FDetectabilityType write FDetectabilityType;
    property FlagShowStatusDestroy : Boolean read FFlagShowStatusDestroy write SetFlagShowStatusDestroy default True;

  	property OnHancur: THancurEvent read FOnHancur write FOnHancur;
    property OnCollision : TOnCollision read FOnCollision write FOnCollision;
    property OnFuelEmpty : TOnFuelEmpty read FOnFuelEmpty write FOnFuelEmpty;
    property OnChangeHeading : TOnChangeHeading read FOnChangeHeading write FOnChangeHeading;
    property OnChangePosition : TOnChangePosition read FOnChangePosition write FOnChangePosition;

    property isInstructor : Boolean read FisInstructor write SetInstructor;
    property isWasdal : Boolean read FIsWasdal write SetIsWasdal;
    property Visible         : boolean read FVisible write SetVisible;
  end;

  TT3PlatformInstance = class(TT3Unit)
  protected
    FData             : TRecPlatform_Instance;  /// sam.added 2012-10-18.snapshot use
    FUnitMotion       : TMotion_Characteristics;
    FUnitLogistic     : TLogistic_Characteristics;
    FUnitActivation   : TRecPlatform_Activation;
    FForce_Designation: byte;
    FTrack_ID         : string;
    FPlatformType     : integer;
    FLaunchTime: integer;
    FPlatformDomain: integer;
    FPlatformCategory : integer;
    FOnOrderedControl: TOnPlatformOrderedControl;
    FIsGroupLeader: boolean;
    FTacticalSymbol   : TTacticalSymbol;
    FHalfTacticalSymbol: TTacticalSymbol;
    FOwnSymbol        : TTacticalSymbol;
    FSignPlatform     : TTextVisual;
    FDataLinkOn       : boolean;
    FDetailedDetection: TRadarDetailedCapabilities;
    FLastSavingPositionX: double;
    FLastSavingPositionY: double;

    procedure SetUnitMotion(const Value: TMotion_Characteristics);
    procedure SetUnitLogistik(const Value: TLogistic_Characteristics);
    procedure SetUnitActivation(const Value: TRecPlatform_Activation);
    procedure SetForce_Designation(const Value: byte);

    procedure SetPlatformType(const Value: integer);
    procedure SetLaunchTime(const Value: integer);
    procedure SetPlatformDomain(const Value: integer);
    procedure SetPlatformCategory(const Value: integer);
    procedure SetOnOrderedControl(const Value: TOnPlatformOrderedControl);

    procedure setIsGroupLeader(const Value: boolean); virtual;
    procedure SetTrack_ID(const Value: string);  virtual;
  private
    FOnLaunched: TNotifyEvent;

    FMLCapacity : Double;
    FATCapacity : Double;
    FFoodCapacity : Double;
    FWaterCapacity : Double;

    FMLRemaining : Double;
    FATRemaining : Double;
    FFoodRemaining : Double;
    FWaterRemaining : Double;
    FPARemaining: Double;
    FTARemaining: Double;
    FBARemaining: Double;

    FMLCons : Double;
    FATCons : Double;
    FFoodCons : Double;
    FWaterCons : Double;

    FOnIsCollision: TNotifyEvent;
    FOnDepthChecker: TNotifyEvent;

    FTrackCrash: TObject;

    FisCrash: Boolean;
    FUnitCapability: TTransport;
    FisOnPort: Boolean;
    procedure SetOnLaunched(const Value: TNotifyEvent);
    // calculate movement type, for fuel consumption
    procedure CalcMovementType;
    procedure SetFuelCapacity(const Value: double);
    procedure SetMLRemaining(Value: double);
    procedure SetATRemaining(Value: double);
    procedure SetFoodRemaining(Value: double);
    procedure SetWaterRemaining(Value: double);
    procedure SetFuelEndurance(const Value: TRecFuelEndurance);
    function  getFuelPercentage: double;
    procedure SetLastSavingPositionX(const Value: double);
    procedure SetLastSavingPositionY(const Value: double);
    procedure SetOnDepthChecker(const Value: TNotifyEvent);
    procedure SetisCollision(const Value: Boolean);

    procedure SetTrackCollision(const Value: TObject);

    procedure SetBARemaining(const Value: Double);
    procedure SetPARemaining(const Value: Double);
    procedure SetTARemaining(const Value: Double);


    procedure SetisCrash(const Value: Boolean);
    procedure SetTrackCrash(const Value: TObject);
    procedure SetATCapacity(const Value: Double);
    procedure SetFoodCapacity(const Value: Double);
    procedure SetMLCapacity(const Value: Double);
    procedure SetWaterCapacity(const Value: Double);

    procedure SetUnitCapability(const Value: TTransport);
    procedure SetisOnPort(const Value: Boolean);
    protected
    FLastPosition     : t3DPoint;
    FDormantTime      : word;
    FDormantCounter   : double;
    FDormant          : boolean;

    // Endurance properties
    FMotionType       : TMotionType;
    FEnduranceType    : TEnduranceType;

    // Endurance properties - Range
    FRangeEndurance   : double;           // nm
    FRangeRemaining   : double;

    // Endurance properties - Time
    FTimeEndurance    : double;          // second
    FTimeRemaining    : double;

    // Endurance properties - Fuel
    FFuelEndurance    : TRecFuelEndurance;   // consumption / hour
    FFuelCapacity     : double;
    FFuelRemaining    : double;

    // Movement properties
    // automatically define platform movement type from current speed;
    FMaximumSpeed     : double;
    FMovementType     : TMovementType;

    // endurance limit achieved?
    FEnduranceLimitAchieved : boolean;

    // event ketika diassign oleh other platform
    FOnAssigned       : TNotifyEvent;

    function getAltitude: single; virtual;
    procedure SetAltitude(const Value: single); virtual;

    function getPos(const Index: Integer): double; virtual;
    procedure setPos(const Index: Integer; const Value: double); virtual;

    function getHeading : Double; virtual;
    procedure setHeading(const value: Double); virtual;

    function getGroundSpeed : Double; virtual;
    procedure setGroundSpeed(const value: Double); virtual;

    procedure SetDormant(const Value: boolean);virtual;
    procedure SetDormantTime(const Value: word);virtual;
    procedure SetFuelRemaining(const Value: double);virtual;

    // calculate endurance from motion characteristic
    // every platform must have own endurance calculation
    // endurance type : fuel, time, range, unlimited;
    // calculated on server only
    {$IFDEF SERVER}
    procedure CalcEndurance(aDeltams : double);virtual;
    {$ENDIF}
    // calculate movement from motion characteristic
    // every platform must have own movement calculation
    // calculated on server and client, but sync clients periodically
    procedure CalcMovement(aDeltams : double);virtual;
    procedure SetOwner(const Value: TSimObject);override;
  public
    //added by choco
    reasonDestroy     : Byte;
	  UnitMakeDestroy   : string;
    MineHitFlag       : Boolean;
    BombHitFlag       : Boolean;
    BombDamage        : Double;
    isSkipDraw        : Boolean;

    {Prince}
    TempFlag : Byte;
    TempHeading, TempSpeed, TempRange,
    RangeToFormation, BearingToFormation : Double;
    RangeToPt, BearingToPt : Double;

    VehicleOnJamming  : TList;
    ParentInJamming   : TList;
    SubParentInJamming: TList;

    SonobuoyList : TList;
    PlatformDetect1Sonobuoy : Boolean;
    PlatformDetect2Sonobuoy : Boolean;
    PlatformDetect3Sonobuoy : Boolean;
    SonobuoyDetectPlatformList : TList; //list sonobuoy yang detect platform tersebut

    FDelayTIOW        : Integer;

    GroupIndex        : Integer;

    // bebe
    PatternName       : string;
    GuidanceTargetInst: TT3PlatformInstance;

    FisCollision : Boolean;
    FTrackCollision : TObject;

    constructor Create; override;
    destructor Destroy; override;

    function GetSnapshotData : _SS_TT3PlatformInstance ;
    procedure SetSnapshotData(const ss : _SS_TT3PlatformInstance);

    procedure Initialize; override;
    procedure Move(const aDeltaMs: double); override;
    procedure Draw(aCnv: tCanvas); override;
    procedure SetAssigned(const value : Boolean); override;

    function GetMovementData: TRecUDP_PlatformMovement; virtual;
    procedure SetMovementData(const aRec: TRecUDP_PlatformMovement); virtual;

    procedure Shooted(ShootBy : TSimObject; Lethality : single);virtual;
    procedure LandCheck(const onLand: boolean; const dMin, dMax: double); virtual;
    procedure DepthCheck(const Valid: boolean; const dMin, dMax: double);virtual;
    procedure SetSelected(const Value : boolean); override;
    procedure SetDataLinkOn(const value : boolean);
    procedure SetOnAssigned(const value : TNotifyEvent);

    property FPIData  : TRecPlatform_Instance read FData write FData ;  /// sam.added 2012-10-18.snapshot use
    property UnitMotion : TMotion_Characteristics read FUnitMotion write SetUnitMotion;
    property UnitLogistic : TLogistic_Characteristics read FUnitLogistic write SetUnitLogistik;
    property UnitActivation : TRecPlatform_Activation read FUnitActivation write SetUnitActivation;
    property UnitCapability : TTransport read FUnitCapability write SetUnitCapability;
    property Force_Designation : byte read FForce_Designation write SetForce_Designation;
    property Track_ID       : string read FTrack_ID write SetTrack_ID;
    property PlatformType   : integer read FPlatformType write SetPlatformType;
    property PlatformDomain : integer read FPlatformDomain write SetPlatformDomain;
    property PlatformCategory : integer read FPlatformCategory write SetPlatformCategory;
    property LaunchTime     : integer read FLaunchTime write SetLaunchTime;
    property IsGroupLeader  : boolean read FIsGroupLeader write setIsGroupLeader;
    property Selected : boolean read FSelected write SetSelected;

    property Altitude: single read getAltitude write SetAltitude;
    property Course: double index 1 read getPos write setPos;
    property Speed: double index 2 read getPos write setPos;
    property Heading: Double  read getHeading write setHeading;
    property GroundSpeed: Double read getGroundSpeed write setGroundSpeed;

    property OnOrderedControl : TOnPlatformOrderedControl read FOnOrderedControl write SetOnOrderedControl;
    property OnLaunched : TNotifyEvent read FOnLaunched write SetOnLaunched;
    property DormantTime  : word read FDormantTime write SetDormantTime;
    property Dormant      : boolean read FDormant write SetDormant;

    // fuel properties
    property FuelEndurance    : TRecFuelEndurance read FFuelEndurance write SetFuelEndurance;
    property FuelCapacity     : double read FFuelCapacity write SetFuelCapacity;
    property FuelRemaining    : double read FFuelRemaining write SetFuelRemaining;
    property FuelPercentage   : double read getFuelPercentage;

    property OnAssigned       : TNotifyEvent read FOnAssigned write SetOnAssigned;
    property DetailedDetectionShowed: TRadarDetailedCapabilities read FDetailedDetection write FDetailedDetection;

    // property ini digunakan untuk membandingkan posisi skr dan sebelumnya
    // digunakan pada check kedalaman, khusus server saja
    // shingga klo posisi platform diam, g perlu cek kedalaman terus menerus
    property LastSavingPositionX : double read FLastSavingPositionX write SetLastSavingPositionX;
    property LastSavingPositionY : double read FLastSavingPositionY write SetLastSavingPositionY;

    property TacticalSymbol : TTacticalSymbol read FTacticalSymbol write FTacticalSymbol;
    property HalfTacticalSymbol : TTacticalSymbol read FHalfTacticalSymbol write FHalfTacticalSymbol;
    property LastPosition : t3DPoint read FLastPosition write FLastPosition;

    property OnDepthChecker : TNotifyEvent read FOnDepthChecker write SetOnDepthChecker;

    property isCollision : Boolean read FisCollision write SetisCollision;

    //untuk pengecekan apakah dipelabuhan atau tidak
    property isOnPort : Boolean read FisOnPort write SetisOnPort;

    property TrackCollision : TObject read FTrackCollision write SetTrackCollision;

    {Prince : untuk gerakan menghindar saat akan tabrakan pada formation move,
     perbedaan dengan collision, variabel ini digunakan untuk prediksi agar tidak menabrak}
    property isCrash : Boolean read FisCrash write SetisCrash;
    property TrackCrash : TObject read FTrackCrash write SetTrackCrash;

    property OnIsCollision : TNotifyEvent read FOnIsCollision write FOnIsCollision;

    property MLCapacity : Double read FMLCapacity write SetMLCapacity;
    property ATCapacity : Double read FATCapacity write SetATCapacity;
    property FoodCapacity : Double read FFoodCapacity write SetFoodCapacity;
    property WaterCapacity : Double read FWaterCapacity write SetWaterCapacity;

    property PARemaining : Double read FPARemaining write SetPARemaining;
    property BARemaining : Double read FBARemaining write SetBARemaining;
    property TARemaining : Double read FTARemaining write SetTARemaining;
    property MLRemaining : Double read FMLRemaining write SetMLRemaining;
    property ATRemaining : Double read FATRemaining write SetATRemaining;
    property FoodRemaining : Double read FFoodRemaining write SetFoodRemaining;
    property WaterRemaining : Double read FWaterRemaining write SetWaterRemaining;

    //property DormantCounter : Double read FDormantCounter write FDormantCounter;
  end;

  TT3DeviceUnit = class(TT3Unit)
  private
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Move(const aDeltaMs: double); override;
  end;

implementation
{ T3Unit }

procedure TT3Unit.addListener(Value: TEventListener);
begin
  FListenerList.Add(Value);
end;

procedure TT3Unit.BeginReposition;
begin
  FIsRepositioning  := true;
end;

constructor TT3Unit.Create;
begin
  inherited;

  Initialized       := false;
  FUnitGroup        := false;
  FIsRepositioning  := false;
  FInstance_Name    := '';

  sDt := 0;

  // listener list dipack setiap 10 detik, untuk buang nil pointer;
  // hati2 dengan nil pointer di item list ini, kudu di tambahin pengecekan klo
  // mau make listenernya
  FListenerList     := Tlist.Create;
  FPackListDelay    := 10;
  FDelayCounter     := 0;

  with FDamageStatus do begin
    CurrentHealth         := 100.0;
    DamageCapacity  := 100.0;
    PercentHealth   := 100.0;
    PercentMaxSpeed := 100.0;
    SensorDamage    := false;
    WeaponDamage    := false;
    CommDamage      := false;
    HelmDamage      := false;
    PropultionDamage:= false;
  end;

  FlagShowStatusDestroy := True; //add mas aldi
end;

destructor TT3Unit.Destroy;
begin
  //if Assigned(FOnDestroy) then FOnDestroy(self);

  FListenerList.Free;

  inherited;
end;

function TT3Unit.GetSnapshotData : _SS_TT3Unit ;
var
    ss : _SS_TT3Unit ;
    count : Integer;
  I: Integer;
begin
    ss.Initialized             := Initialized;

    if Environment <> nil then begin
      ss.Environment.FData       := Environment.FData ;
      ss.Environment.FGameArea   := Environment.FGameArea ;
      ss.Environment.FGlobal_Conv:= Environment.FGlobal_Conv ;
    end;

    if GameDefaults <> nil then begin
      ss.GameDefaults.FData                := GameDefaults.FData;
      ss.GameDefaults.FGameCloud_ESM       := GameDefaults.FGameCloud_ESM;
      ss.GameDefaults.FGameCloud_Radar     := GameDefaults.FGameCloud_Radar;
      //edited by andi
      count := Length(GameDefaults.FGameDefault_IFF);
      SetLength(ss.GameDefaults.FGameDefault_IFF,count);
      for I := 0 to Count - 1 do
      begin
        ss.GameDefaults.FGameDefault_IFF[i]     := GameDefaults.FGameDefault_IFF[i];
      end;
//      ss.GameDefaults.FGameDefault_IFF     := GameDefaults.FGameDefault_IFF;

      ss.GameDefaults.FGameRainfall_ESM    := GameDefaults.FGameRainfall_ESM;
      ss.GameDefaults.FGameRainfall_Missile:= GameDefaults.FGameRainfall_Missile;
      ss.GameDefaults.FGameRainfall_Radar  := GameDefaults.FGameRainfall_Radar;
      ss.GameDefaults.FGameRainfall_Sonar  := GameDefaults.FGameRainfall_Sonar;

      ss.GameDefaults.FGameSea_Missile   := GameDefaults.FGameSea_Missile;
      ss.GameDefaults.FGameSea_Radar     := GameDefaults.FGameSea_Radar;
      ss.GameDefaults.FGameSea_Sonar     := GameDefaults.FGameSea_Sonar;
      ss.GameDefaults.FGameShip_Sonar    := GameDefaults.FGameShip_Sonar;
    end;

    //ss.UnitGroup               := UnitGroup  ;
    ss.Lethality               := Lethality ;
    ss.InstanceIndex           := InstanceIndex ;
    ss.Selected                := Selected ;
    ss.Controlled              := Controlled ;
    ss.IsRepositioning         := IsRepositioning ;
    ss.NoCubicle               := NoCubicle ;
    ss.Health                  := Health ;
    ss.HealthPercent           := HealthPercent;
    ss.InstanceName            := InstanceName ;
    ss.TrackNumber             := TrackNumber ;
    ss.TrackLabel              := TrackLabel ;
    ss.TrackDomain             := TrackDomain ;
    ss.TrackIdent              := TrackIdent ;
    ss.DamageStatus            := DamageStatus ;
    ss.DetectabilityType       := DetectabilityType;
    ss.FlagShowStatusDestroy   := FlagShowStatusDestroy  ;
    ss.isInstructor            := isInstructor ;
    ss.isWasdal                := isWasdal;
    ss.Visible                 := Visible ;
    ss.FObject.IsAssigned      := IsAssigned ;
    ss.FObject.PosX            := PosX ;
    ss.FObject.PosY            := PosY ;
    ss.FObject.PosZ            := PosZ ;
    ss.DeleteFromSnapshot      := DeleteFromSnapshot;

    Result := ss ;
end;

procedure TT3Unit.SetSnapshotData(const ss : _SS_TT3Unit);
begin
    /// unit T3
    Initialized             := ss.Initialized;
    if Assigned(Environment) then begin
      Environment.FData       := ss.Environment.FData ;
      Environment.FGameArea   := ss.Environment.FGameArea ;
      Environment.FGlobal_Conv:= ss.Environment.FGlobal_Conv ;
    end;

    //UnitGroup               := ss.UnitGroup  ;
    Lethality               := ss.Lethality ;
    InstanceIndex           := ss.InstanceIndex ;
    //Selected                := ss.Selected ;
    Controlled              := ss.Controlled ;
    //FIsRepositioning        := ss.IsRepositioning ;
    Health                  := ss.Health ;
    HealthPercent           := ss.HealthPercent;
    InstanceName            := ss.InstanceName ;
//    TrackNumber             := ss.TrackNumber ;
    TrackLabel              := ss.TrackLabel ;
    TrackDomain             := ss.TrackDomain ;
    TrackIdent              := ss.TrackIdent ;
    FDamageStatus           := ss.DamageStatus ;
    DetectabilityType       := ss.DetectabilityType;
    FlagShowStatusDestroy   := ss.FlagShowStatusDestroy  ;
//    isInstructor            := ss.isInstructor ;
    //Visible                 := ss.Visible ;
    NoCubicle               := ss.NoCubicle;
    IsAssigned  := ss.FObject.IsAssigned    ;
    PosX        := ss.FObject.PosX          ;
    PosY        := ss.FObject.PosY          ;
    PosZ        := ss.FObject.PosZ          ;
    DeleteFromSnapshot := ss.DeleteFromSnapshot;
end;

procedure TT3Unit.Draw(aCnv: tCanvas);
begin
//  inherited;

  if not Enable then exit;

end;

procedure TT3Unit.EndReposition;
begin
  FIsRepositioning  := false;
end;

procedure TT3Unit.FreeChilds;
begin
  inherited;
end;

procedure TT3Unit.setHealthStatus(const i: integer; val: single);
begin
  case i of
    1 : begin
      if val < 0 then val := 0;
      if val > FDamageStatus.DamageCapacity  then
        val := FDamageStatus.DamageCapacity;

//      FDamageStatus.PercentHealth := (val / FDamageStatus.DamageCapacity) * 100;
      FDamageStatus.CurrentHealth := val;
    end;
    2 : begin
      if val < 0    then val := 0;
      if val > 100  then val := 100;

      FDamageStatus.PercentHealth := val;
      FDamageStatus.CurrentHealth := (0.01 * val) * FDamageStatus.DamageCapacity;
    end;
  end;

  updateHealthStatus(i, val);
end;

function  TT3Unit.getHealthStatus(const i: integer): single;
begin
  result := 0;

  case i of
   1 : result := FDamageStatus.CurrentHealth;
   2 : result := Round(FDamageStatus.PercentHealth);
  end;
end;

procedure TT3Unit.updateHealthStatus(const i: integer; val: single);
begin
  with FDamageStatus do begin
    if DamageCapacity > 0 then
      PercentHealth :=  (CurrentHealth * 100) / DamageCapacity
    else
      PercentHealth := 100;

    if Assigned(FOnDamageChanged) then
      FOnDamageChanged(self, diOverall);
  end;
end;

procedure TT3Unit.LoadTrackSymbol;
begin
//x
end;

procedure TT3Unit.Move(const aDeltaMs: double);
begin
  inherited;

  FDelayCounter := FDelayCounter + aDeltaMs;
  if FDelayCounter > FPackListDelay then begin
    FListenerList.Pack;
    FListenerList.Capacity := FListenerList.Count;
    FDelayCounter := 0;
  end;
end;

procedure TT3Unit.removeListener(Value: String);
var
  i: integer;
  l : TEventListener;
begin
//  i := 0;
  if FListenerList.Count <= 0 then
    Exit;

  for I := FListenerList.Count - 1 to 0 do    
  begin

    l := TEventListener(FListenerList.Items[i]);
    if CompareStr(l.ListenerID,Value)=0 then
    begin
      FListenerList.Delete(i);
      FreeAndNil(l);
    end;

  end;
end;

procedure TT3Unit.removeListener(Value: TEventListener);
begin
  if not(Assigned(FListenerList)) then Exit;

  FListenerList.Remove(Value);
  FreeAndNil(Value);
end;

function TT3Unit.getTrackLabel: string;
begin // belum punya label.

end;

procedure TT3Unit.setTrackLabel(const Value: string);
begin // belum punya label.

end;

procedure TT3Unit.SetTrackDomain(const Value: integer);
begin  // belum punya symbol
  FTrackDomain := Value;
end;

procedure TT3Unit.SetTrackIdent(const Value: integer);
begin  // belum punya symbol
  FTrackIdent := Value;
end;

procedure TT3Unit.Initialize;
begin
  Initialized := true;
end;

procedure TT3Unit.RepositionTo(const x, y: double);
begin
  FPosition.X := X;
  FPosition.Y := Y;
end;

procedure TT3Unit.SetControlled(const Value: boolean);
begin
  FControlled := Value;
  FSelected := Value;

  if Assigned(FOnSelected) then
    FOnSelected(Self);

  if Assigned(FOnControlled) then
    FOnControlled(Self);
end;

procedure TT3Unit.SetFlagShowStatusDestroy(const Value: Boolean);
begin
  FFlagShowStatusDestroy := Value;
end;

procedure TT3Unit.SetFreeMe(const Value: boolean);
begin
  inherited;
end;

procedure TT3Unit.SetInstanceIndex(const Value: integer);
begin
  FInstanceIndex := Value;

  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3Unit.SetInstanceIndex',
        'InstanceName : ' + InstanceName + ' ; InstanceIndex : ' + IntToStr(InstanceIndex));
end;

//procedure TT3Unit.SetInstance_Class(const Value: string);
//begin
//  FInstance_Class := Value;
//end;

procedure TT3Unit.SetInstance_Name(const Value: string);
begin
  FInstance_Name := Value;
end;

procedure TT3Unit.SetInstructor(const Value: Boolean);
begin
  FisInstructor := Value;
end;

function TT3Unit.getInstanceClass: string;
begin

end;

procedure TT3Unit.SetLethality(const Value: integer);
begin
  FLethality := Value;
end;

procedure TT3Unit.SetOnControlled(const Value: TNotifyEvent);
begin
  FOnControlled := Value;
end;

procedure TT3Unit.SetOnFreeMe(const Value: TOnPlatformFreeMe);
begin
  FOnFreeMe := Value;
end;

procedure TT3Unit.SetOnLogEventStr(const Value: TLogStrProc);
begin
  FOnLogEventStr := Value;
end;

procedure TT3Unit.SetOnLogStr(const Value: TGetStrProc);
begin
  FOnLogStr := Value;
end;

procedure TT3Unit.SetOnLogTemporary(const Value: TGetStrProc);
begin
  FOnLogTemporary := Value;
end;

procedure TT3Unit.SetOnSelected(const Value: TnotifyEvent);
begin
  FOnSelected := Value;
end;

procedure TT3Unit.SetOwner(const Value: TSimObject);
begin
  inherited;

end;

procedure TT3Unit.SetSelected(const Value: boolean);
begin
  FSelected := Value;

  if Assigned(FOnSelected) then
    FOnSelected(Self);
end;

procedure TT3Unit.SetTrackNumber(const Value: integer);
begin
  if FTrackNumber <> Value then
    TriggerListener(Self,psTrackNumber,Value);

  FTrackNumber := Value;
end;

procedure TT3Unit.SetUnitData(const Value: TObject);
begin
  FUnitData := Value;
end;

procedure TT3Unit.SetUnitGroup(const Value: boolean);
begin
  FUnitGroup := Value;
end;

procedure TT3Unit.SetVisible(const Value: boolean);
begin
  if FVisible <> Value then
    TriggerListener(Self,psVisible,Value);

  FVisible := Value;
end;

procedure TT3Unit.SetIsWasdal(const Value: Boolean);
begin
  FIsWasdal := Value;
end;

procedure TT3Unit.TriggerListener(Sender: TObject; const PropsID: TPropsID;
  const Value: String);
var
  i : integer;
  l : TObject;
begin
  for i := 0 to FListenerList.Count - 1 do begin
    l := FListenerList.Items[i];
    if not(Assigned(l)) then Continue;

    if l is TPropertyEventListener then
      TPropertyEventListener(l).PropertyStrChange(Sender,PropsID,Value);
  end;
end;

procedure TT3Unit.TriggerListener(Sender : TObject;const PropsID: TPropsID; const Value: byte);
var
  i : integer;
  l : TObject;
begin
  for i := 0 to FListenerList.Count - 1 do begin
    l := FListenerList.Items[i];
    if not(Assigned(l)) then Continue;

    if l is TPropertyEventListener then
      TPropertyEventListener(l).PropertyByteChange(Sender,PropsID,Value);
  end;
end;

procedure TT3Unit.TriggerListener(Sender : TObject;const PropsID: TPropsID;
  const Value: integer);
var
  i : integer;
  l : TObject;
begin
  for i := 0 to FListenerList.Count - 1 do begin
    l := FListenerList.Items[i];
    if not(Assigned(l)) then Continue;

    if (l is TPropertyEventListener) then
      TPropertyEventListener(l).PropertyIntChange(Sender,PropsID,Value);
  end;
end;

procedure TT3Unit.TriggerListener(Sender : TObject;const PropsID: TPropsID; const Value: double);
var
  i : integer;
  l : TObject;
begin
  for i := 0 to FListenerList.Count - 1 do begin
    l := FListenerList.Items[i];
    if not(Assigned(l)) then Continue;

    if l is TPropertyEventListener then
      TPropertyEventListener(l).PropertyDblChange(Sender,PropsID,Value);
  end;
end;

procedure TT3Unit.TriggerListener(Sender : TObject; const PropsID: TPropsID;
  const Value: boolean);
var
  i : integer;
  l : TObject;
begin
  for i := 0 to FListenerList.Count - 1 do begin
    l := FListenerList.Items[i];
    if not(Assigned(l)) then Continue;

    if l is TPropertyEventListener then
      TPropertyEventListener(l).PropertyBoolChange(Sender,PropsID,Value);
  end;
end;

procedure TT3Unit.UpdateVisual;
begin
  inherited;
  if not Enable then exit;
end;

{ TT3PlatformUnit }

{$IFDEF SERVER}
procedure TT3PlatformInstance.CalcEndurance(aDeltams: double);
  function CalcFuelConsumtion(mt: TMovementType): Double;
  var
    aUpperSpeed, aLowerSpeed, aUpperFuel, aLowerFuel{, Temp} : Double;
    //SpeedNumerator, SpeedDenominator, FuelDenominator : Double;
  begin
    aUpperSpeed := 0;
    aLowerSpeed := 0;
    aUpperFuel  := 0;
    aLowerFuel  := 0;

    case mt of
      mtMinimumCruise:
      begin
        aUpperSpeed := UnitMotion.FData.Cruise_Ground_Speed;
        aLowerSpeed := UnitMotion.FData.Min_Ground_Speed;
        aUpperFuel  := FFuelEndurance.FuelCruise;
        aLowerFuel  := FFuelEndurance.FuelMinimum;
      end;
      mtCruiseHigh:
      begin
        aUpperSpeed := UnitMotion.FData.High_Ground_Speed;
        aLowerSpeed := UnitMotion.FData.Cruise_Ground_Speed;
        aUpperFuel  := FFuelEndurance.FuelHigh;
        aLowerFuel  := FFuelEndurance.FuelCruise;
      end;
      mtHighMaximum:
      begin
        aUpperSpeed := UnitMotion.FData.Max_Ground_Speed;
        aLowerSpeed := UnitMotion.FData.High_Ground_Speed;
        aUpperFuel  := FFuelEndurance.FuelMaximum;
        aLowerFuel  := FFuelEndurance.FuelHigh;
      end;
    end;

    //SpeedNumerator    := Speed - aLowerSpeed;
    //SpeedDenominator  := aUpperSpeed - aLowerSpeed;
    //FuelDenominator   := aUpperFuel - aLowerFuel;

    Result := Interpolate(Speed,aLowerSpeed,aLowerFuel,aUpperSpeed,aUpperFuel);

    //Temp := (SpeedNumerator * FuelDenominator) + (aLowerFuel * SpeedDenominator);
    //Result := Temp / SpeedDenominator;
  end;
var
  FuelConsumptionPerSecond : double;
  MLConsumptionPerSecond : double;
  ATConsumptionPerSecond : double;
  FoodConsumptionPerSecond : double;
  WaterConsumptionPerSecond : double;
begin
  case FEnduranceType of
    entFuel :
      begin
        FuelConsumptionPerSecond := 0;

        case FMovementType of
          mtStop          : FuelConsumptionPerSecond := 0;
          mtMinimum       : FuelConsumptionPerSecond := aDeltams * ( FFuelEndurance.FuelMinimum /3600 );
          mtCruise        : FuelConsumptionPerSecond := aDeltams * ( FFuelEndurance.FuelCruise  /3600 );
          mtHigh          : FuelConsumptionPerSecond := aDeltams * ( FFuelEndurance.FuelHigh    /3600 );
          mtMaximum       : FuelConsumptionPerSecond := aDeltams * ( FFuelEndurance.FuelMaximum /3600 );
          mtMinimumCruise,
          mtCruiseHigh,
          mtHighMaximum   : FuelConsumptionPerSecond := aDeltams * ( CalcFuelConsumtion(FMovementType) /3600 );
        end;

        FuelRemaining := FuelRemaining - FuelConsumptionPerSecond;

        if FFuelRemaining <= 0 then begin
          FuelRemaining := 0;
          FMovementType  := mtStop;
          FEnduranceLimitAchieved := true;
        end;
      end;
    entTime :
      begin
        FTimeRemaining := FTimeRemaining - aDeltams;
        if FTimeRemaining <= 0 then begin
          FTimeRemaining  := 0;
          FMovementType   := mtstop;
          FEnduranceLimitAchieved := true;
        end;
      end;
    entRange:
      begin
        sDt := sDt + aDeltams;

        if sDt > 1 then
        begin
          FRangeRemaining := FRangeRemaining - (Speed/3600);
          sDt := 0;
        end;

        if FRangeRemaining <= 0 then begin
          FRangeRemaining  := 0;
          FMovementType   := mtstop;
          FEnduranceLimitAchieved := true;
        end;
      end;
    entUnlimited:
      begin
        FuelRemaining := FuelRemaining;
      end;
  end;

  MLConsumptionPerSecond := aDeltams * ( FMLCons /3600 );
  ATConsumptionPerSecond := aDeltams * ( FATCons /3600 );
  FoodConsumptionPerSecond := aDeltams * ( FFoodCons /3600 );
  WaterConsumptionPerSecond := aDeltams * ( FWaterCons /3600 );

  MLRemaining := MLRemaining - MLConsumptionPerSecond;
  ATRemaining := ATRemaining - ATConsumptionPerSecond;
  FoodRemaining  := FoodRemaining - FoodConsumptionPerSecond;
  WaterRemaining := WaterRemaining - WaterConsumptionPerSecond;

  if MLRemaining <= 0 then MLRemaining  := 0;
  if ATRemaining <= 0 then ATRemaining  := 0;
  if FoodRemaining <= 0 then FoodRemaining  := 0;
  if WaterRemaining <= 0 then WaterRemaining  := 0;
end;
{$ENDIF}

 procedure TT3PlatformInstance.CalcMovement(aDeltams: double);
begin
  if FFuelRemaining <= 0 then exit;
end;

procedure TT3PlatformInstance.CalcMovementType;
var
  MotMinSpeed, MotCruiseSpeed, MotHighSpeed, MotMaxSpeed : double;
begin
  if Assigned(UnitMotion) then begin
    with UnitMotion.FData do begin
      MotMinSpeed     := Min_Ground_Speed;
      MotCruiseSpeed  := Cruise_Ground_Speed;
      MotHighSpeed    := High_Ground_Speed;
      MotMaxSpeed     := Max_Ground_Speed;

    end;

    if Speed <= 0.001 then FMovementType := mtStop
    else if Speed = MotMinSpeed then FMovementType := mtMinimum
    else if (Speed > MotMinSpeed) and (Speed < MotCruiseSpeed) then  FMovementType := mtMinimumCruise
    else if Speed = MotCruiseSpeed then FMovementType := mtCruise
    else if (Speed > MotCruiseSpeed) and (Speed < MotHighSpeed) then  FMovementType := mtCruiseHigh
    else if Speed = MotHighSpeed then FMovementType := mtHigh
    else if (Speed > MotHighSpeed) and (Speed < MotMaxSpeed) then  FMovementType := mtHighMaximum
    else if (Speed >= MotMaxSpeed) then  FMovementType := mtMaximum;
  end;
end;

constructor TT3PlatformInstance.Create;
begin
  inherited;

  FMotionType     := motMobile;
  FEnduranceType  := entUnlimited;
  FEnduranceLimitAchieved := false;
  FVisible        := false;
  isSkipDraw      := False;

  FLaunchTime := 0; // in milisecond
  FDormant        := false;
  //FDormantTime    := 120; // second
  FDormantTime := 60;
  FDormantCounter := 0;

  VehicleOnJamming  := TList.Create;
  ParentInJamming   := TList.Create;
  SubParentInJamming:= TList.Create;

  SonobuoyList := TList.Create;
  PlatformDetect1Sonobuoy := False;
  PlatformDetect2Sonobuoy := False;
  PlatformDetect3Sonobuoy := False;
  SonobuoyDetectPlatformList := TList.Create;

  with FDetailedDetection do
  begin
    IFF_Capability := False;
    Altitude_Data_Capability := False;
    Ground_Speed_Data_Capability := False;
    Heading_Data_Capability := False;
    Plat_Type_Recog_Capability := False;
    Plat_Class_Recog_Capability := False;
    Plat_Name_Recog_Capability  := False;
    Track_ID := True;
  end;

  FisOnPort := False;
end;

destructor TT3PlatformInstance.Destroy;
begin
  inherited;
end;

procedure TT3PlatformInstance.Draw(aCnv: tCanvas);
begin
  inherited;

end;

procedure TT3PlatformInstance.DepthCheck(const Valid: boolean; const dMin,
  dMax: double);
begin

end;

procedure TT3PlatformInstance.SetSelected(const Value : boolean);
begin
  FSelected := Value;
  FTacticalSymbol.Selected := FSelected;

  if Assigned(FOnSelected) then
    FOnSelected(Self);
end;

procedure TT3PlatformInstance.SetDataLinkOn(const value : boolean);
begin
  FDataLinkOn := value;
end;

procedure TT3PlatformInstance.SetOnAssigned(const value : TNotifyEvent);
begin
  FOnAssigned := value;
end;

procedure TT3PlatformInstance.SetOnDepthChecker(const Value: TNotifyEvent);
begin
  FOnDepthChecker := Value;
end;

function TT3PlatformInstance.getAltitude: single;
begin
  result := 0;
end;

function TT3PlatformInstance.getFuelPercentage: double;
begin
  result := 0.00;
  if FFuelCapacity > 0 then
    result := (FFuelRemaining / FFuelCapacity) * 100;
end;

function TT3PlatformInstance.getPos(const Index: Integer): double;
begin
  result := 0;
end;

function TT3PlatformInstance.getHeading : Double;
begin
  result := 0;
end;

procedure TT3PlatformInstance.setHeading(const value: Double);
begin

end;

procedure TT3PlatformInstance.SetisCollision(const Value: Boolean);
begin
  if Value <> FisCollision then
  begin
    if Assigned(OnIsCollision) then
      OnIsCollision(Self);
  end;
  FisCollision := Value;
end;

procedure TT3PlatformInstance.SetisCrash(const Value: Boolean);
begin
  FisCrash := Value;
end;

function TT3PlatformInstance.getGroundSpeed : Double;
begin
  result := 0;
end;

procedure TT3PlatformInstance.setGroundSpeed(const value: Double);
begin

end;


procedure TT3PlatformInstance.Initialize;
begin
  inherited;

  Altitude := 0; //default

  if Assigned(UnitMotion) then
  begin
    // setting endurance
    case UnitMotion.FData.Motion_Type of
      0 : FMotionType := motMobile;
      1 : FMotionType := motDriftCurrent;
      2 : FMotionType := motFixed;
    end;

    case UnitMotion.FData.Endurance_Type of
      0 : FEnduranceType := entFuel;
      1 : FEnduranceType := entTime;
      2 : FEnduranceType := entRange;
      3 : FEnduranceType := entUnlimited;
    end;

    case FEnduranceType of
      entFuel:
        begin
          FFuelEndurance.FuelMinimum  := UnitMotion.FData.Min_Speed_Fuel_Consume;
          FFuelEndurance.FuelCruise   := UnitMotion.FData.Cruise_Speed_Fuel_Consume;
          FFuelEndurance.FuelHigh     := UnitMotion.FData.High_Speed_Fuel_Consume;
          FFuelEndurance.FuelMaximum  := UnitMotion.FData.Max_Speed_Fuel_Consume;
          FFuelCapacity  := UnitMotion.FData.Max_Fuel_Capacity;
          FFuelRemaining := FFuelCapacity ;
        end;
      entTime   :
        begin
          FTimeEndurance := UnitMotion.FData.Endurance_Time;
          FTimeRemaining := FTimeEndurance;
        end;
      entRange  :
        begin
          FRangeEndurance := UnitMotion.FData.Max_Effective_Range ;
          FRangeRemaining := FRangeEndurance;
        end;
      entUnlimited:
        begin
          FFuelRemaining := 1;
        end
        ;
    end;

    // setting movement characteristic

  end
  else
    FEnduranceType := entUnlimited;

  if Assigned(UnitLogistic) then
  begin
    // setting endurance
    FMLCapacity := UnitLogistic.FData.Max_Lubricants_Capacity;
    FATCapacity := UnitLogistic.FData.Max_Freshwater_Capacity;
    FFoodCapacity := UnitLogistic.FData.Max_Ration_Capacity;
    FWaterCapacity := UnitLogistic.FData.Max_Water_Capacity;

    FPARemaining := UnitLogistic.FData.PA;
    FBARemaining := UnitLogistic.FData.BA;
    FTARemaining := UnitLogistic.FData.TA;
    FMLRemaining := UnitLogistic.FData.Max_Lubricants_Capacity;
    FATRemaining := UnitLogistic.FData.Max_Freshwater_Capacity;
    FFoodRemaining := UnitLogistic.FData.Max_Ration_Capacity;
    FWaterRemaining := UnitLogistic.FData.Max_Water_Capacity;

    FMLCons := UnitLogistic.FData.Lubricants_Consumption;
    FATCons := UnitLogistic.FData.Freshwater_Consumption;
    FFoodCons := UnitLogistic.FData.Ration_Consumption;
    FWaterCons := UnitLogistic.FData.Water_Consumption;

  end
  else
    FEnduranceType := entUnlimited;

  // set default detectabilitytype = dtNormalDetection
  DetectabilityType := dtNormalDetection;

  FLastSavingPositionX := 0;
  FLastSavingPositionY := 0;
end;

procedure TT3PlatformInstance.LandCheck(const onLand: boolean; const dMin, dMax: double);
begin

end;

procedure TT3PlatformInstance.Move(const aDeltaMs: double);
const
  MIN_RANGE_DEPTH_CHECK = 50; // meter

{$IFDEF SERVER}
var
  range : double;
{$ENDIF}
begin
  inherited;

  // jika motion type adalah mobile, maka motion karakteristik dijalankan
  if FMotionType = motMobile then begin
    case FEnduranceType of
      entFuel     : if FFuelRemaining <= 0 then exit;
      entTime     : if FTimeRemaining <= 0 then exit;
      entRange    : if FRangeRemaining <= 0 then exit;
      entUnlimited: {do nothing};
    end;

    // calculate movement type : min, cruise, high, max
    CalcMovementType;

    // calculate endurance platform: fuel, time or range
    {$IFDEF SERVER}
    CalcEndurance(aDeltaMs);

    // untuk depth checker
    range := CalcRange(FPosition.X,FPosition.Y,FLastSavingPositionX,FLastSavingPositionY);
    range := range * C_NauticalMile_To_Metre;
    if (range >= MIN_RANGE_DEPTH_CHECK) then begin
      FLastSavingPositionX := FPosition.X;
      FLastSavingPositionY := FPosition.Y;

      if Assigned(FOnDepthChecker) then
        FOnDepthChecker(Self);
    end;


    {$ENDIF}

    //CalcMovement(aDeltaMs);
  end;
end;

procedure TT3PlatformInstance.SetAssigned(const value : Boolean);
begin
  inherited;

  if Assigned(OnAssigned) then
  begin
    OnAssigned(Self);
  end;
end;

procedure TT3PlatformInstance.SetMLCapacity(const Value: Double);
begin
  FMLCapacity := Value;
end;

procedure TT3PlatformInstance.SetMLRemaining(Value: double);
begin
  FMLRemaining := Value;
end;

procedure TT3PlatformInstance.SetATCapacity(const Value: Double);
begin
  FATCapacity := Value;
end;

procedure TT3PlatformInstance.SetATRemaining(Value: double);
begin
  FATRemaining := Value;
end;

procedure TT3PlatformInstance.SetBARemaining(const Value: Double);
begin
  FBARemaining := Value;
end;

procedure TT3PlatformInstance.SetFoodCapacity(const Value: Double);
begin
  FFoodCapacity := Value;
end;

procedure TT3PlatformInstance.SetFoodRemaining(Value: double);
begin
  FFoodRemaining := Value;
end;

procedure TT3PlatformInstance.SetAltitude(const Value: single);
begin
{  if Assigned(FOnOrderedControl) then
    FOnOrderedControl(Self,pocAltitude,Value);
}
end;

procedure TT3PlatformInstance.SetDormant(const Value: boolean);
begin
  if FDormant <> Value then
    TriggerListener(Self,psDormant,Value);

  FDormant := Value;
end;

procedure TT3PlatformInstance.SetDormantTime(const Value: word);
begin
  if FDormantTime <> Value then
    TriggerListener(Self,psDormantTime,Value);

  FDormantTime := Value;
end;

procedure TT3PlatformInstance.SetForce_Designation(const Value: byte);
begin
  FForce_Designation := Value;

  TriggerListener(Self,psForceDesig,Value);

end;

procedure TT3PlatformInstance.SetFuelCapacity(const Value: double);
begin
  if FFuelCapacity <> Value then
    TriggerListener(Self,psFuelCapacity,Value);

  FFuelCapacity := Value;

end;

procedure TT3PlatformInstance.SetFuelEndurance(const Value: TRecFuelEndurance);
begin

  FFuelEndurance := Value;
end;

procedure TT3PlatformInstance.SetFuelRemaining(const Value: double);
begin
  FFuelRemaining := Value;
end;

procedure TT3PlatformInstance.setIsGroupLeader(const Value: boolean);
begin
  FIsGroupLeader := Value;
end;

procedure TT3PlatformInstance.SetisOnPort(const Value: Boolean);
begin
  FisOnPort := Value;
end;

procedure TT3PlatformInstance.SetLastSavingPositionX(const Value: double);
begin
  FLastSavingPositionX := Value;
end;

procedure TT3PlatformInstance.SetLastSavingPositionY(const Value: double);
begin
  FLastSavingPositionY := Value;
end;

procedure TT3PlatformInstance.SetLaunchTime(const Value: integer);
begin
  if FLaunchTime <> Value then
    TriggerListener(Self,psLaunchTime,Value);

  FLaunchTime := Value;
end;

procedure TT3PlatformInstance.SetPARemaining(const Value: Double);
begin
  FPARemaining := Value;
end;

procedure TT3PlatformInstance.SetPlatformCategory(const Value: integer);
begin
  FPlatformCategory := Value;
end;

procedure TT3PlatformInstance.SetPlatformDomain(const Value: integer);
begin
  FPlatformDomain := Value;
  TrackDomain  := Value;
end;

procedure TT3PlatformInstance.SetPlatformType(const Value: integer);
begin
  FPlatformType := Value;
end;

procedure TT3PlatformInstance.setPos(const Index: Integer; const Value: double);
begin
{  case Index of
    1 :
      if Assigned(FOnOrderedControl) then
        FOnOrderedControl(Self,pocHeading,Value);
    2 :
      if Assigned(FOnOrderedControl) then
        FOnOrderedControl(Self,pocSpeed,Value);
  end;
}
end;

procedure TT3PlatformInstance.SetTARemaining(const Value: Double);
begin
  FTARemaining := Value;
end;

procedure TT3PlatformInstance.SetTrackCollision(const Value: TObject);
begin
  FTrackCollision := Value;
end;

procedure TT3PlatformInstance.SetTrackCrash(const Value: TObject);
begin
  FTrackCrash := Value;
end;

procedure TT3PlatformInstance.SetTrack_ID(const Value: string);
begin
  if FTrack_ID <> Value then
    TriggerListener(Self,psTrack_ID,Value);

  FTrack_ID := Value;
end;

procedure TT3PlatformInstance.SetUnitActivation(
  const Value: TRecPlatform_Activation);
begin
  FUnitActivation := Value;
end;

procedure TT3PlatformInstance.SetUnitCapability(
  const Value: TTransport);
begin
  FUnitCapability := Value;
end;

procedure TT3PlatformInstance.SetUnitLogistik(const Value: TLogistic_Characteristics);
begin
  FUnitLogistic := Value;
end;

procedure TT3PlatformInstance.SetUnitMotion(const Value: TMotion_Characteristics);
begin
  FUnitMotion := Value;
end;

procedure TT3PlatformInstance.SetWaterCapacity(const Value: Double);
begin
  FWaterCapacity := Value;
end;

procedure TT3PlatformInstance.SetWaterRemaining(Value: double);
begin
  FWaterRemaining := Value;
end;

procedure TT3PlatformInstance.Shooted(ShootBy: TSimObject; Lethality: single);
var newHealth : single;
begin
  newHealth := FDamageStatus.CurrentHealth -  Lethality;

  Health := newHealth; // ini manggil updateHealthStatus
end;

function TT3PlatformInstance.GetMovementData: TRecUDP_PlatformMovement;
begin
  result.PlatformID := InstanceIndex;

  result.IDPlatformName := FPIData.Instance_Ident_Index;
  result.IDPlatformClass := FPIData.Vehicle_Index;

  result.X := getPositionX;
  result.Y := getPositionY;
  result.Z := getPositionZ;

  result.Course     := Heading;       //course;
  result.Speed      := GroundSpeed;   //Speed;
  result.Accel      := 0;
  result.TurnRate   := 0;

  result.FuelRemaining := FFuelRemaining;
  result.MLRemaining := FMLRemaining;
  result.ATRemaining := FATRemaining;
  result.FoodRemaining := FFoodRemaining;
  result.WaterRemaining := FWaterRemaining;
  result.TimeRemaining := FTimeRemaining;
  result.RangeRemaining:= FRangeRemaining;
end;


procedure TT3PlatformInstance.SetMovementData(const aRec: TRecUDP_PlatformMovement);
begin
  if FIsRepositioning then exit;

  setPositionX(aRec.X);
  setPositionY(aRec.Y);
  setPositionZ(aRec.Z);

  {Speed}  GroundSpeed := aRec.Speed;
  {Course} Heading     := aRec.Course;

  FuelRemaining   := aRec.FuelRemaining;
  MLRemaining := aRec.MLRemaining;
  ATRemaining := aRec.ATRemaining;
  FoodRemaining := aRec.FoodRemaining;
  WaterRemaining := aRec.WaterRemaining;
  FTimeRemaining  := aRec.TimeRemaining;
  FRangeRemaining := aRec.RangeRemaining;
end;


procedure TT3PlatformInstance.SetOnLaunched(const Value: TNotifyEvent);
begin
  FOnLaunched := Value;
end;

procedure TT3PlatformInstance.SetOnOrderedControl(
  const Value: TOnPlatformOrderedControl);
begin
  FOnOrderedControl := Value;
end;

procedure TT3PlatformInstance.SetOwner(const Value: TSimObject);
begin
  inherited;
  if Assigned(Value) then
    ParentInstanceIndex := TT3PlatformInstance(Value).InstanceIndex;
end;

{ snapshot }
function TT3PlatformInstance.GetSnapshotData : _SS_TT3PlatformInstance ;
var
  ss  : _SS_TT3PlatformInstance ;
  i   : integer ;
  obj : TT3PlatformInstance ;
begin
  ss.SST3Unit           := TT3Unit(Self).GetSnapshotData;

  ss.FData              := FData;
  { public field }

  ss.reasonDestroy     := reasonDestroy   ;
  ss.UnitMakeDestroy   := UnitMakeDestroy ;
  ss.isSkipDraw        := isSkipDraw      ;

  SetLength(ss.VehicleOnJamming,VehicleOnJamming.Count);
  for i := 0 to VehicleOnJamming.Count-1 do
  begin
     obj := TT3PlatformInstance(VehicleOnJamming.Items[i]);
     if obj<> nil then ss.VehicleOnJamming[i] := obj.InstanceIndex ;
  end;

  SetLength(ss.ParentInJamming,ParentInJamming.Count);
  for i := 0 to ParentInJamming.Count-1 do
  begin
     obj := TT3PlatformInstance(ParentInJamming.Items[i]);
     if obj<> nil then ss.ParentInJamming[i] := obj.InstanceIndex ;
  end;

  SetLength(ss.SubParentInJamming,SubParentInJamming.Count);
  for i := 0 to SubParentInJamming.Count-1 do
  begin
     obj := TT3PlatformInstance(SubParentInJamming.Items[i]);
     if obj<> nil then ss.SubParentInJamming[i] := obj.InstanceIndex ;
  end;

  SetLength(ss.SonobuoyList,SonobuoyList.Count);
  for i := 0 to SonobuoyList.Count-1 do
  begin
     obj := TT3PlatformInstance(SonobuoyList.Items[i]);
     if obj<> nil then ss.SonobuoyList[i] := obj.InstanceIndex ;
  end;

//    SetLength(ss.PlatformDetectBySonobuoy,PlatformDetectBySonobuoy.Count);
//    for i := 0 to PlatformDetectBySonobuoy.Count-1 do
//    begin
//       obj := TT3PlatformInstance(PlatformDetectBySonobuoy.Items[i]);
//       ss.PlatformDetectBySonobuoy[i] := obj.InstanceIndex ;
//    end;
  ss.FDelayTIOW          := FDelayTIOW;
  ss.GroupIndex          := GroupIndex;

  { property field }
  if UnitMotion <> nil then
     ss.UnitMotion         := UnitMotion.FData ;

  if UnitLogistic <> nil then
    ss.UnitLogistic     := UnitLogistic.FData;

  if UnitCapability <> nil then
    ss.UnitCapability := UnitCapability.FData;

  ss.UnitActivation     := UnitActivation ;
  ss.Force_Designation  := Force_Designation;
  ss.Track_ID           := Track_ID ;
  ss.PlatformType       := PlatformType ;
  ss.PlatformDomain     := TrackDomain ;
  ss.LaunchTime         := LaunchTime ;
  ss.IsGroupLeader      := IsGroupLeader ;
  ss.Selected           := Selected ;
  ss.Altitude           := Altitude ;
  ss.Course             := Course ;
  ss.Speed              := Speed ;
  ss.Heading            := Heading;
  ss.GroundSpeed        := GroundSpeed ;
  ss.DormantTime        := DormantTime ;
  ss.GroupIndex         := GroupIndex;
  ss.Dormant            := Dormant;

  {$REGION ' Logistic '}
  ss.PARemaining        := PARemaining;
  ss.BARemaining        := BARemaining;
  ss.TARemaining        := TARemaining;
  ss.FuelRemaining      := FuelRemaining ;
  ss.MLRemaining        := MLRemaining;
  ss.ATRemaining        := ATRemaining;
  ss.FoodRemaining      := FoodRemaining;
  ss.WaterRemaining     := WaterRemaining;
  {$ENDREGION}

  Result := ss ;
end;

procedure TT3PlatformInstance.SetSnapshotData(const ss : _SS_TT3PlatformInstance);
begin
    TT3Unit(Self).SetSnapshotData(ss.SST3Unit);
    FPIData            := ss.FData ;
    if Assigned(UnitMotion) then
      UnitMotion.FData   := ss.UnitMotion
    else
    begin
      UnitMotion := TMotion_Characteristics.Create;
      UnitMotion.FData   := ss.UnitMotion;
    end;

    if Assigned(UnitLogistic) then
      UnitLogistic.FData := ss.UnitLogistic
    else
    begin
      UnitLogistic := TLogistic_Characteristics.Create;
      UnitLogistic.FData := ss.UnitLogistic;
    end;

    if Assigned(UnitCapability) then
      UnitCapability.FData := ss.UnitCapability
    else
    begin
      UnitCapability := TTransport.Create;
      UnitCapability.FData := ss.UnitCapability;
    end;

    Initialize;

    UnitActivation     := ss.UnitActivation ;
    Force_Designation  := ss.Force_Designation;
    Track_ID           := ss.Track_ID ;
    PlatformType       := ss.PlatformType ;
    PlatformDomain     := ss.PlatformDomain ;
    LaunchTime         := ss.LaunchTime ;
    IsGroupLeader      := ss.IsGroupLeader ;
    Altitude           := ss.Altitude ;
    Course             := ss.Course ;
    Speed              := ss.Speed ;
    Heading            := ss.Heading;
    GroundSpeed        := ss.GroundSpeed ;
    DormantTime        := ss.DormantTime ;
    GroupIndex         := ss.GroupIndex;
    AbsoluteFree       := ss.Dormant;

    {$REGION ' Logistic '}
    PARemaining                 := ss.PARemaining;
    BARemaining                 := ss.BARemaining;
    TARemaining                 := ss.TARemaining;
    MLRemaining                 := ss.MLRemaining;
    ATRemaining                 := ss.ATRemaining;
    FoodRemaining               := ss.FoodRemaining;
    WaterRemaining              := ss.WaterRemaining;
    {$ENDREGION}
end;

{ TT3DeviceUnit }

constructor TT3DeviceUnit.Create;
begin
  inherited;
end;

destructor TT3DeviceUnit.Destroy;
begin
  inherited;
end;

procedure TT3DeviceUnit.Move(const aDeltaMs: double);
begin
  inherited;

  if Assigned(FParent) then begin
    FPosition.X := FParent.getPositionX;
    FPosition.Y := FParent.getPositionY;
    FPosition.Z := FParent.getPositionZ;
  end;

end;

end.
