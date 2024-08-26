unit uT3Missile;

interface

uses uT3Weapon, uDBAsset_Weapon, tttData, Graphics, u2DMover, uObjectVisuals,
  SysUtils, uSimObjects, uDataTypes, uT3UnitContainer, Classes, DIalogs,
  uT3Unit, uT3Common, uDBBlind_Zone, uT3Gun,
  uT3DetectedTrack, uDBAssetObject, uDBCubicles,uDBScenario, Windows,
  uWeaponWaypoint, uDBAsset_Scripted, uT3MissileEnvironment, newClassASTT,
  uSnapshotData;

type
  TMoveChangeState  = (mcsStable, mcsIncrease, mcsDecrease);
  TLogData = procedure (ts : TStringList) of object;

  TMissileRBLW_STOT = class(TSimObject)
    private

    public
      ListNonSort : Tlist;
      ListSort    : Tlist;

      constructor Create;
      destructor Destroy; override;
      procedure SortList;
      procedure Clear;
      function GetTimeLaunch(aLauncherIndex : integer): Integer;
  end;

  TT3Missile = class(TT3Weapon)
  private
    FLethality        : integer;
    FEngagementRange  : double;
    FCycleUpdateAltitude : double; // second
    FTurnOnSeekRange  : double;
    FSeekerOn         : boolean;
    FHaveSeeker       : Boolean;
    FAltitudeState    : TMoveChangeState;
    FSpeedState       : TMoveChangeState;
    FHeadingState     : TMoveChangeState;
    FLastAltitudeState    : TMoveChangeState; // test aj
    FOrderedHeadingAchieved : boolean;
    FOrderedSpeedAchieved   : boolean;
    FEngageTargetSucced     : boolean;
    FTargetPlatforms: TT3UnitContainer;
    FLockHeading  : boolean;
    FLastChaff      : TSimObject;
    FFiringMode     : TMissileFiringMode;
    FEngagement     : TMissileEngagement;
    FDamageCapacity: double;
    FMissileDefinition : TMissile_On_Board;
    FisRBLW : Boolean;
    FisBOLW : Boolean;
    FisBOL : Boolean;
    FDefinition: TRecMissile_Definition;
    FHAFO : Double;
    FOnSyncTarget : TOnSyncTarget;

    FShipIndex : Integer;
    FShipName  : string;
    FTargetIndex : Integer;
    FTargetName  : string;
    FTargetTrackCourse : Double;
    FTargetTrackSpeed  : Double;
    FTargetTrackAlt    : Single;
    FDistanceToTarget  : Double;
    FAirLaunch         : Boolean;

    FPrimaryGuidance    : TMissileGuidanceType;
    FSecondaryGuidance  : TMissileGuidanceType;
    FSpotNumber: integer;
    FHOJTypeB: Boolean;
    FHOJTypeC: Boolean;
    FHOJTypeA: Boolean;
    FECCMType: Integer;
    FOnLogDataMissile: TLogData;

    procedure SetTargetPlatforms(const Value: TT3UnitContainer);
    procedure SetOwner(const Value: TSimObject);
    procedure SetFiringMode(const Value: TMissileFiringMode);
    procedure SetEngagement(const Value: TMissileEngagement);
    procedure SetLaunchDelay(const Value: integer);
//    procedure Shoot;
    function isSeekerOn : boolean;
    procedure SetDamageCapacity(const Value: double);
    procedure SetDefinition(const Value: TRecMissile_Definition);
    procedure SetMaxRange(const Value: double);
    procedure SetEngagementRange(const Value: double);
    procedure SetTurnOnSeekRange(const Value: double);
    procedure SetDefaultAltitude(const Value: double);
    procedure SetDefaultSeekAltitude(const Value: double);
    procedure SetisCounterDelay(const Value: Boolean);
    procedure SetPrimaryGuidance(const Value: TMissileGuidanceType);
    procedure SetSecondaryGuidance(const Value: TMissileGuidanceType);
    procedure SetSpotNumber(const Value: integer);

  protected
    FHomePositionX        : double;
    FHomePositionY        : double;
    FMaxRange             : double;
    FMover                : T2DMover;
    FOwner                : TSimObject;
    FTarget               : TSimObject;
    FTerminal_Altitude_Required : Boolean;
    FSeekAltitudeOnce     : boolean;
    FDefaultAltitude      : double;
    FDefaultSeekAltitude  : double;     // feet
    FDeltaHead            : double;
    FOrderedAltitude      : double;
    FOrderedSpeed         : double;
    FOrderedHeading       : double;
    FisCounterDelay       : boolean;
    FCounterDelay         : double;
    FLaunchDelay          : integer;
    FlauncherNumber       : Integer;
    FLaunching            : boolean;
    FTargetPosition       : t3DPoint;
    FStaticTargetPos      : t3DPoint;
    FHAFOPosition         : t2DPoint;
    FTargetCourse         : double;
    FTargetSpeed          : double;
    FTargetBearing        : double;
    FTargetRange          : double;
    FSameGroupPlatform    : T3CubicleGroup;
    FDetectPlatform       : TT3UnitContainer;
    FRangeVisual          : double; //mk
    FSignHAFO             : TTextVisual;
    FLastTarget           : Integer;
    FEstimateHitTime      : single;

    FReAcquisitionCounter : single;
    FIsOnAcquisitionDelay : Boolean;

    procedure SetFreeMe(const Value: boolean);override;
    procedure SetInstructor(Const Value: boolean); override;//mk
    procedure SetIsWasdal(const Value: Boolean); override;
    procedure SetLethality(const Value: integer);
    procedure SetAltitude(const Value : Single); override;
    procedure SetOrderedAltitude(const Value : double);
    procedure SetOrderedHeading(const Value: double);
    procedure CalcMovement(aDeltaMs: double); override;
    procedure CalcMovementWithWaypoint(const aDeltaMs: double);
    procedure DrawCircleofRBL(acnv : Tcanvas);
    procedure SetLaunched(const Value: boolean);override;
    function getPos(const Index: Integer): double;  override;
    function Get_RainRangeReductionFactor(PrimaryGuidanceType, RainRate: Byte): Double;
    function CheckHitSomething : TSimObject;
    procedure setPos(const Index: Integer; const Value: double); override;
    function getAltitude: single;override;
  public
    isShowMode : Boolean;
    isLockTarget : Boolean;
    isSynchMissileVBS : Boolean;
    WeaponWaypoint : TWeaponWaypoint;
    PredictionEngageTime : Double;
    PredictionFlightTime : Double;
    LauncherIndex : Integer;
    EngagementParentID : Integer;

    FListCrossection: TStringList;

    constructor Create;override;
    destructor Destroy;override;
    function  GetSnapshotData : _SS_TT3Missile;
    procedure SetSnapshotData(const ss : _SS_TT3Missile);
    procedure SetSnapshotLaunched(const st: boolean);
    procedure Jammed(Sender : TObject);
    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure Initialize;overload; override;
    //procedure Initialize(vActivation : TRecPlatform_Activation); overload;
    procedure Abort;
    procedure Shooted(ShootBy: TSimObject; Lethality: single); override;
    procedure setPositionX(const v: double); override;
    procedure setPositionY(const v: double); override;
    procedure setPositionZ(const v: double); override;
    procedure RepositionTo(const x, y: double); override;
    procedure SetTargetObject(const Value: TSimObject);override;
    procedure SetSelected(const Value: boolean); override;
    function isValidToTarget(Target: TSimObject): Boolean;
    function isSeekerDetectTarget(Target: TSimObject): Boolean;
    function isMissileCapableToTarget(Target: TSimObject): Boolean;
    function calcCrossSection(pf : TT3PlatformInstance) : double;
    function calcAngleDifference(fromAngle,toAngle: Double): Double;
    property Lethality       : integer read FLethality write SetLethality;
    property TargetPlatforms : TT3UnitContainer read FTargetPlatforms write SetTargetPlatforms;
    property Owner           : TSimObject read FOwner write SetOwner;
    property FiringMode      : TMissileFiringMode read FFiringMode write SetFiringMode;
    property LaunchDelay     : integer read FLaunchDelay write SetLaunchDelay;   // second
    property DamageCapacity  : double read FDamageCapacity write SetDamageCapacity;
    //property Launched        : boolean read FLaunched write SetLaunched;
    property SameGroupPlatform : T3CubicleGroup read FSameGroupPlatform write FSameGroupPlatform;
    property DetectPlatform    : TT3UnitContainer read FDetectPlatform write FDetectPlatform;
    property SeekerOn: boolean read isSeekerOn write FSeekerOn;
    property HaveSeeker : Boolean read FHaveSeeker write FHaveSeeker;
    property Launching : boolean read FLaunching write FLaunching ;
    property isRBLW : Boolean read FisRBLW write FisRBLW;
    property isBOLW : Boolean read FisBOLW write FisBOLW;
    property isBOL  : Boolean read FisBOL write FisBOL;
    //property NeedAjust : Boolean  read FNeedAdjust write FNeedAdjust;
    property Definition : TRecMissile_Definition read FDefinition write SetDefinition;
    property Engagement : TMissileEngagement read FEngagement write SetEngagement;
    property LauncherNumber : integer read FlauncherNumber write FlauncherNumber;
    property TargetPosition   : t3DPoint read FTargetPosition write FTargetPosition;
    property StaticTargetPos   : t3DPoint read FStaticTargetPos write FStaticTargetPos;
    property HAFOPosition   : t2DPoint read FHAFOPosition write FHAFOPosition;
    property HAFO : Double read FHAFO write FHAFO;
    property Target : TSimObject read FTarget write FTarget;
    property ShipIndex : Integer read FShipIndex write FShipIndex;
    property ShipName  : string read FShipName write FShipName;
    property TargetIndex : integer read FTargetIndex write FTargetIndex;
    property TargetName  : string read FTargetName write FTargetName;
    property TargetTrackCourse : Double read FTargetTrackCourse write FTargetTrackCourse;
    property TargetTrackSpeed  : Double read FTargetTrackSpeed write FTargetTrackSpeed;
    property TargetTrackAlt    : Single read FTargetTrackAlt write FTargetTrackAlt;
    property DistanceToTarget : Double read FDistanceToTarget write FDistanceToTarget;
    property isAirLaunch : boolean read FAirLaunch write FAirLaunch;
    property OnSyncTarget : TOnSyncTarget read FOnSyncTarget write FOnSyncTarget;
    property MaxRange : double read FMaxRange write SetMaxRange;
    property EngagementRange : double read FEngagementRange write SetEngagementRange;
    property TurnOnSeekRange : double read FTurnOnSeekRange write SetTurnOnSeekRange;
    property DefaultAltitude : double read FDefaultAltitude write SetDefaultAltitude;
    property DefaultSeekAltitude : double read FDefaultSeekAltitude write SetDefaultSeekAltitude;
    property isCounterDelay : Boolean read FisCounterDelay write SetisCounterDelay;

    property PrimaryGuidance    : TMissileGuidanceType read FPrimaryGuidance write SetPrimaryGuidance;
    property SecondaryGuidance  : TMissileGuidanceType read FSecondaryGuidance write SetSecondaryGuidance;
    property EstimateHitTime    : single read FEstimateHitTime;
    property SpotNumber         : integer read FSpotNumber write SetSpotNumber;
    property HOJTypeA           : Boolean read FHOJTypeA;
    property HOJTypeB           : Boolean read FHOJTypeB;
    property HOJTypeC           : Boolean read FHOJTypeC;
    property ECCMType           : Integer read FECCMType;
    property MissileDefinition : TMissile_On_Board read FMissileDefinition;

    property OnLogDataMissile : TLogData read FOnLogDataMissile write FOnLogDataMissile;
  end;

  TT3MissilesOnVehicle = class(TT3Weapon)
  private
    FMissileDefinition: TMissile_On_Board;
    FEngagement: TMissileEngagement;
    FFiringMode: TMissileFiringMode;
    FQuantity   : integer;
    FSalvoSize  : integer;
    FOnSetSalvo : TOnWeaponSetSalvo;
    FLaunchDelay: integer;
    FTacticalSymbol   : TTacticalSymbol;
    FOnRBLW : Boolean;
    FOnBOLW : Boolean;
    FOnBOL  : Boolean;
    FLauncerNumber : Integer;

    FDefaultAltitude  : double;
    FDefaultSeekAltitude : double;

    //Ship Target
    FTargetPosition : t3DPoint;
    FTargetCourse   : double;
    FTargetSpeed    : double;
    FTargetBearing  : double;
    FTargetRange    : double;

    //Own Ship
    FShipPosition : t3DPoint;
    FDestruckRange    : Double;
    FSeekerRangeTurn  : single;

    procedure SetEngagement(const Value: TMissileEngagement);
    procedure SetFiringMode(const Value: TMissileFiringMode);
    procedure SetQuantity(const Value: integer);
    function  CreateProjectile: TT3Missile;
    procedure SetSalvoSize(const Value: integer);
    procedure SetOnSetSalvo(const Value: TOnWeaponSetSalvo);
    procedure SetLaunchDelay(const Value: integer);
  protected
    FSignHAFO             : TTextVisual;
    function getMountType: integer; override;

  public
    //nando
    VehiclePlatform       : TT3UnitContainer;
    RBLW_PointList        : TList;
    BOLW_PointList        : TList;
    RBLW_WaypointLineList : Tlist;
    RBLW_STOTList         : TMissileRBLW_STOT;

    //rangeRBLW
    RangeRBLW1, RangeRBLW2, RangeRBLW3, RangeRBLW4,
    RangeRBLW5, RangeRBLW6, RangeRBLW7, RangeRBLW8 : Double;

    BOL_Movement        : TT3BOL_Missile;
    RBL_Movement        : TT3RBL_Missile;
    Straight_Movement   : TT3Straight_Missile;
    Aimpoint_Movement   : TT3Aimpoint_Missile;
    Bearing_Movement    : TT3BearingOnly_Missile;
    HitMode        : TT3Hit_Missile;

    constructor Create; override;

    function GetSnapshotData : _SS_MissilesOnVehicle ;
    procedure SetSnapshotData(const ss : _SS_MissilesOnVehicle);

    function  PrepareLaunch : TT3Missile;
    procedure Initialize;override;
	  procedure InitAfterLaunch;
    procedure Move(const aDeltaMs: double); override;
    procedure Draw(aCnv: tCanvas); override;
    procedure UpdateVisual; override;
    procedure DrawBOL_Missile(aCnv: TCanvas; x1, y1, x2, y2: Double;
      aDegree: Integer; aLengthMissile: Double; Mode: Integer;
      tBearingNRP: Double);
    procedure DrawBOLW_Missile(aCnv: TCanvas; x1, y1, x2, y2: Double;
      aDegree: Integer; aLengthMissile: Double; aMode: Integer;
      aBearing : Double);
    procedure DrawRBL_Missile(aCnv: tCanvas; aRadius, aRing : Double; x1, y1, x2, y2 : Double);
    procedure DrawRBLW_Missile(aCnv: Tcanvas; x1, y1, x2, y2 : Double);
    function CalcDistanceTwoCoord(x1, x2, y1, y2 : Double):Double;
    function CheckQuadran(aX, aY : Double): Byte;  overload;
    function CheckQuadran(X1, X2, Y1, Y2 : Double): Byte; overload;
    function  InsideBlindZone(aObject : TSimObject) : boolean; override;
    procedure SetSelected(const Value: boolean);override;

    procedure CreateRBLWPoint(mX, mY : Double);
    procedure DrawLineInRBLW(aCnv: TCanvas; X1, Y1, X2,Y2: Double);
    procedure DrawRBLWPoint(aCnv : Tcanvas);
    procedure DrawBOLWPoint(aCnv : Tcanvas);
    procedure DrawRBLIntercept(aCnv :TCanvas; aRing : Double);
    procedure DrawRBLWIntercept(aCnv :TCanvas; aRing : Double; aLengthWaypoint : Double; aPositionX, aPositionY : Double);
    procedure setStaticFiringMode(const value: TMissileFiringMode);
    procedure setStaticEngagementMode(Const value : TMissileEngagement);

    function CalculateDistanceRBLW(aLauncherID : integer): Double;
    function GetLauncherByID(aLauncherID : Integer): TFitted_Weap_Launcher_On_Board;
    function GetRBLWPoint(aLauncherID: Integer): TPointVehicleMissileRBLW; overload;
    function GetRBLWPoint(aLauncherID, aPointID: Integer): TPointVehicleMissileRBLW; overload;
    function GetBOLWPoint(aLauncherID: Integer): TPointVehicleMissileBOLW; overload;
    function GetBOLWPoint(aLauncherID, aPointID: Integer): TPointVehicleMissileBOLW; overload;

    procedure TriggerLauncherListener(Launcher : TObject;Quantity  : Integer);

    function IsMissileCapableToTrack(aTarget: TT3PlatformInstance): Boolean;
    function GetBOLWPointMaxIndex(aLauncher: Integer): TPointVehicleMissileBOLW;

    property MissileDefinition : TMissile_On_Board read FMissileDefinition;
    property FiringMode : TMissileFiringMode read FFiringMode write SetFiringMode;
    property Engagement : TMissileEngagement read FEngagement write SetEngagement;
    property Quantity   : integer read FQuantity write SetQuantity;
    property SalvoSize  : integer read FSalvoSize write SetSalvoSize;
    property LaunchDelay : integer read FLaunchDelay write SetLaunchDelay;
    property OnSetSalvo : TOnWeaponSetSalvo read FOnSetSalvo write SetOnSetSalvo;
    property isONRBLW : Boolean read FOnRBLW write FOnRBLW;
    property isONBOLW : Boolean read FOnBOLW write FOnBOLW;
    property isONBOL  : Boolean read FOnBOL write FOnBOL;
    property LauncherNumber : integer read FLauncerNumber write FLauncerNumber;
    property DestruckRange    : Double read FDestruckRange write FDestruckRange;
    property SeekerRangeTurn  : single read FSeekerRangeTurn write FSeekerRangeTurn;
    property DefaultAltitude  : double read FDefaultAltitude write FDefaultAltitude;
    property DefaultSeekAltitude : double read FDefaultSeekAltitude write FDefaultSeekAltitude;
  end;

implementation

uses uBaseCoordSystem, uCoordConvertor, uDataModuleTTT,
  uDBAsset_MotionCharacteristics, uLibSettingTTT, uT3Vehicle,
  uDBAsset_Vehicle, uT3CounterMeasure, math, uT3MissileDetail,
  uT3Listener, uT3OtherSensor, uT3Sensor, uT3Radar, uT3Sonar,
  uT3DefensiveJammer, uFilter;

{ TT3Missile }

function getDeltaH(const  dst, src: double): double;
begin
    result := dst - src;
  if result < -180.0 then
    result := result + 360.0
  else
    if result > 180.0 then
      result := result - 360.0;
end;

procedure TT3Missile.Abort;
begin
  // dah terlanjur di launch
  if FLaunching then exit;

  FisCounterDelay := false;
  FreeMe := true;
  AbsoluteFree := True;
end;

function TT3Missile.calcAngleDifference(fromAngle, toAngle: Double): Double;
var
  difAngle : Double;
begin
  difAngle := Abs(fromAngle-toAngle);

  if difAngle > 180 then
    Result := 360.0 - difAngle
  else
    Result := difAngle;
end;

function TT3Missile.calcCrossSection(pf : TT3PlatformInstance): double;
  function isBetween(val1, val2, valtest : double) : boolean;
  begin
    result := (valtest >= val1) and (valtest <= val2);
  end;

  function isFreqBetween(val1, val2, valtest : double) : boolean;
  begin
    result := (valtest >= val1) and (valtest <= val2);
  end;
var
  delta, bearing, range, slantRange : Double;
  i : Integer;
  device : TT3DeviceUnit;
  CS : Double;
  LogStr : string;
begin
  delta := Abs(Course - pf.Course);
  bearing := CalcBearing(PosX,PosY,pf.PosX,pf.PosX);
  range := CalcRange3D(PosX,PosY,pf.PosX,pf.PosY, PosZ, pf.PosZ);
  slantRange := calcAngleDifference(Course, bearing);

  case Definition.Primary_Guide_Type of
    0,3,4,5 : Result := 999999;
    1,2     : Result := -999999;
  else
    Result := 0;
  end;

  if pf is TT3Vehicle then
  begin
    with TT3Vehicle(pf).VehicleDefinition.FData do
    begin
      if isBetween(30,150,delta) or isBetween(240,330,delta) then
      begin
        case Definition.Primary_Guide_Type of
          0,4,5:
            begin
              LogStr := 'Definition.Primary_Guide_Type = ' + FormatFloat('0.00', Definition.Primary_Guide_Type) + 'Range = ' + FormatFloat('0.00', range);
//              if Assigned(OnLogEventStr) then
//                OnLogEventStr('TT3Missile.calcCrossSection', LogStr);
              Result := range;
            end;
          1:
            begin
              CS := Side_Radar_Cross - (40 * range); //TARH : find largest RCS after this calculation
              LogStr := 'Instance Name = ' + pf.InstanceName + ' Definition.Primary_Guide_Type = ' + FormatFloat('0.00', Definition.Primary_Guide_Type) +
                        'CrossSection = ' + FormatFloat('0.00', CS) + ' ; Side_Radar_Cross = ' + FormatFloat('0.00', Side_Radar_Cross)
                        + ' ; Range = ' + FormatFloat('0.00', range) + ' nM';
//              if Assigned(OnLogEventStr) then
//                OnLogEventStr('TT3Missile.calcCrossSection', LogStr);

              Result := CS;
            end;
          2:
            begin
              CS := Side_Infrared_Cross / range; //IRH : find largest IRCS after this calculation

              LogStr := 'Instance Name = ' + pf.InstanceName + ' Definition.Primary_Guide_Type = ' + FormatFloat('0.00', Definition.Primary_Guide_Type) +
                        'CrossSection = ' + FormatFloat('0.00', CS) + ' ; Side_Infrared_Cross = ' + FormatFloat('0.00', Side_Infrared_Cross)
                        + ' ; Range = ' + FormatFloat('0.00', range) + ' nM';
//              if Assigned(OnLogEventStr) then
//                OnLogEventStr('TT3Missile.calcCrossSection', LogStr);

              Result := CS;
            end;
          3:
          begin
            for i := 0 to TT3Vehicle(pf).Devices.Count - 1 do
            begin
              device := TT3Vehicle(pf).Devices.Items[i];

              if (device is TT3Radar) and (TT3Radar(device).OperationalStatus = sopOn) and
                 isFreqBetween(Definition.Lower_Received_Freq,Definition.Upper_Received_Freq,TT3Radar(device).RadarDefinition.FDef.Frequency) then
                Result := range
              else if (device is TT3Sonar) and (TT3Sonar(device).OperationalStatus = sopOn) then
              begin
                if (TT3Sonar(device).ControlMode = scmActive) and
                  isFreqBetween(Definition.Lower_Received_Freq,Definition.Upper_Received_Freq,TT3Sonar(device).SonarDefinition.FDef.Active_Freq_of_Op/1000) then
                  Result := range
                else if (TT3Sonar(device).ControlMode = scmPassive) and
                  isFreqBetween(Definition.Lower_Received_Freq,Definition.Upper_Received_Freq,TT3Sonar(device).SonarDefinition.FDef.Passive_Freq_of_Op/1000) then
                  Result := range;
              end
              else if (device is TT3ESMSensor) and (TT3ESMSensor(device).OperationalStatus = sopOn) then
              begin
                if (TT3ESMSensor(device).ESMDefinition.FESM_Def.Low_Detect_Frequency1 >= Definition.Lower_Received_Freq) and
                   (TT3ESMSensor(device).ESMDefinition.FESM_Def.High_Detect_Frequency1 <= Definition.Upper_Received_Freq) then
                  Result := range;
              end;
            end;
          end;
        else
          Result := range;
        end;
      end
      else
      begin
        case Definition.Primary_Guide_Type of
          0,4,5: Result := range;
          1:
            begin
              CS := Front_Radar_Cross - (40 * range); //TARH : find largest RCS after this calculation

              LogStr := 'Instance Name = ' + pf.InstanceName + ' Definition.Primary_Guide_Type = ' + FormatFloat('0.00', Definition.Primary_Guide_Type) +
                        'CrossSection = ' + FormatFloat('0.00', CS) + ' ; Front_Radar_Cross = ' + FormatFloat('0.00', Front_Radar_Cross)
                        + ' ; Range = ' + FormatFloat('0.00', range) + ' nM';
//              if Assigned(OnLogEventStr) then
//                OnLogEventStr('TT3Missile.calcCrossSection', LogStr);

              Result := CS;
            end;
          2:
           begin
              CS := Front_Infrared_Cross / range; //IRH : find largest IRCS after this calculation

              LogStr := 'Instance Name = ' + pf.InstanceName + ' Definition.Primary_Guide_Type = ' + FormatFloat('0.00', Definition.Primary_Guide_Type) +
                        'CrossSection = ' + FormatFloat('0.00', CS) + ' ; Front_Infrared_Cross = ' + FormatFloat('0.00', Front_Infrared_Cross)
                        + ' ; Range = ' + FormatFloat('0.00', range) + ' nM';
//              if Assigned(OnLogEventStr) then
//                OnLogEventStr('TT3Missile.calcCrossSection', LogStr);

              Result := CS;
           end;
          3:
          begin
            for i := 0 to TT3Vehicle(pf).Devices.Count - 1 do
            begin
              device := TT3Vehicle(pf).Devices.Items[i];

              if (device is TT3Radar) and (TT3Radar(device).OperationalStatus = sopOn) and
                 isFreqBetween(Definition.Lower_Received_Freq,Definition.Upper_Received_Freq,TT3Radar(device).RadarDefinition.FDef.Frequency) then
                Result := range
              else if (device is TT3Sonar) and (TT3Sonar(device).OperationalStatus = sopOn) then
              begin
                if (TT3Sonar(device).ControlMode = scmActive) and
                  isFreqBetween(Definition.Lower_Received_Freq,Definition.Upper_Received_Freq,TT3Sonar(device).SonarDefinition.FDef.Active_Freq_of_Op/1000) then
                  Result := range
                else if (TT3Sonar(device).ControlMode = scmPassive) and
                  isFreqBetween(Definition.Lower_Received_Freq,Definition.Upper_Received_Freq,TT3Sonar(device).SonarDefinition.FDef.Passive_Freq_of_Op/1000) then
                  Result := range;
              end
              else if (device is TT3ESMSensor) and (TT3ESMSensor(device).OperationalStatus = sopOn) then
              begin
                if (TT3ESMSensor(device).ESMDefinition.FESM_Def.Low_Detect_Frequency1 >= Definition.Lower_Received_Freq) and
                   (TT3ESMSensor(device).ESMDefinition.FESM_Def.High_Detect_Frequency1 <= Definition.Upper_Received_Freq) then
                  Result := range;
              end;
            end;
          end;
        end;
      end;
    end;
  end
  else if (pf is TT3Chaff) and (Definition.Primary_Guide_Type = 1) then
    Result := TT3Chaff(pf).RCS - (40 * range)
  else if (pf is TT3InfraredDecoy) and (Definition.Primary_Guide_Type = 2) then
    Result := TT3InfraredDecoy(pf).MaxInfraredIntensity / range
  else if (pf is TT3FloatingDecoy) and (Definition.Primary_Guide_Type = 1) then
  begin
    if isBetween(30,150,delta) or isBetween(240,330,delta) then
      Result := TT3FloatingDecoy(pf).RCS_Side - (40 * range)
    else
      Result := TT3FloatingDecoy(pf).RCS_Front - (40 * range);
  end
  else
    Result := range;
end;

procedure TT3Missile.CalcMovement(aDeltaMs: double);
var
  Max_Ground_Speed : double;
  bearing : double;
begin
  FCycleUpdateAltitude := FCycleUpdateAltitude + aDeltaMs;

  if FNeedAdjust then
  begin
    bearing := CalcBearing(FPosition.X, FPosition.Y,FTargetPosition.X,FTargetPosition.Y);

    FDeltaHead := getDeltaH(bearing, Course);

    if (Abs(FDeltaHead) > 1) then
      SetOrderedHeading(bearing)
    else
    begin
      Course := bearing;
      FNeedAdjust := false;
    end;
  end;

  if not Assigned(UnitMotion) then
    Max_Ground_Speed := 0
  else
    Max_Ground_Speed := UnitMotion.FData.Max_Ground_Speed;

  if (FMover.Speed >= Max_Ground_Speed) then
  begin
    FMover.Speed := Max_Ground_Speed;
    FMover.Acceleration := 0.0;
  end;

  FDeltaHead := getDeltaH(FOrderedHeading, Course);
  if (FHeadingState = mcsDecrease) then begin
    if FDeltaHead <= 0  then begin
      FMover.TurnRate := 0.0;
      FHeadingState := mcsStable;
      Course := FOrderedHeading;
    end;
  end
  else if (FHeadingState = mcsIncrease) then begin
    // turn left
    if FDeltaHead >= 0  then begin
      FMover.TurnRate := 0.0;
      FHeadingState := mcsStable;
      Course := FOrderedHeading;
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

  FPosition.X := FMover.X;
  FPosition.Y := FMover.Y;
  FPosition.Z := FMover.Z;
end;

procedure TT3Missile.CalcMovementWithWaypoint(const aDeltaMs: double);
var
  Max_Ground_Speed : double;
  bearing : double;
begin
  FCycleUpdateAltitude := FCycleUpdateAltitude + aDeltaMs;

  if FNeedAdjust then
  begin
    bearing := CalcBearing(FPosition.X, FPosition.Y,
              TScripted_Behav_Definition(WeaponWaypoint.FNextWaypoint^.Behav).FData.Waypoint_Latitude,
              TScripted_Behav_Definition(WeaponWaypoint.FNextWaypoint^.Behav).FData.Waypoint_Longitude);

    FDeltaHead := getDeltaH(bearing, Course);

    if (Abs(FDeltaHead) > 1) then
    begin
      SetOrderedHeading(bearing);
    end
    else begin
      Course := bearing;
      FNeedAdjust := false;
    end;
  end;

  if not Assigned(UnitMotion) then
    Max_Ground_Speed := 0
  else
    Max_Ground_Speed := UnitMotion.FData.Max_Ground_Speed ;

  if (FMover.Speed >= Max_Ground_Speed) then
  begin
    FMover.Speed := Max_Ground_Speed;
    FMover.Acceleration := 0.0;
  end;

  FDeltaHead := getDeltaH(FOrderedHeading, Course);
  if (FHeadingState = mcsDecrease) then
  begin
    if FDeltaHead <= 0 then
    begin
      FMover.TurnRate := 0.0;
      FHeadingState := mcsStable;
      Course := FOrderedHeading;
    end;
  end
  else if (FHeadingState = mcsIncrease) then
  begin
    // turn left
    if FDeltaHead >= 0 then
    begin
      FMover.TurnRate := 0.0;
      FHeadingState := mcsStable;
      Course := FOrderedHeading;
    end;
  end;

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
    end;
  end
  else if FAltitudeState = mcsStable then
  begin
    FMover.Vertical_Accel := 0.0;
    FMover.ClimbRate      := 0;
    FMover.DescentRate    := 0;
    FMover.VerticalSpeed := 0.0;
  end;

  FMover.Move(aDeltaMs);

  FPosition.X := FMover.X;
  FPosition.Y := FMover.Y;
  FPosition.Z := FMover.Z;
end;

function TT3Missile.CheckHitSomething: TSimObject;
//var
//  i : Integer;
//  pf : TSimObject;
begin
//  i := 0;
  Result  := nil;

  // langsung saja cek target object yang telah di lock, gk usah looping lagi...
  if Assigned(FTargetObject) then
  begin
    if TargetObject = Owner then
      Exit;

    if TargetObject = Self then
      Exit;

    if TT3PlatformInstance(TargetObject).Dormant then
      Exit;

    if IsInsideCircle(FPosition.X,FPosition.Y,
       TT3PlatformInstance(TargetObject).getPositionX,
       TT3PlatformInstance(TargetObject).getPositionY, 50,
       FPosition.Z, TT3PlatformInstance(TargetObject).getPositionZ, 1) then
    begin
      Result := TargetObject;
    end;
  end;

//  while (i < TargetPlatforms.itemCount) do
//  begin
//    pf := TargetPlatforms.getObject(i);
//    inc(i);
//
//    if pf = Owner then continue;
//    if pf = Self then continue;
//    if TT3PlatformInstance(pf).Dormant then continue;
//
//    if IsInsideCircle(FPosition.X,FPosition.Y,
//       TT3PlatformInstance(pf).getPositionX, TT3PlatformInstance(pf).getPositionY, 50,
//       FPosition.Z, TT3PlatformInstance(pf).getPositionZ, 1) then
//    begin
//      Result := pf;
//    end;
//  end;
end;

function TT3Missile.GetSnapshotData : _SS_TT3Missile ;
var
  ss : _SS_TT3Missile ;
begin
  ss.W := TT3Weapon(Self).GetSnapshotData ;
  ss.LauncherIndex     := LauncherIndex ;
  ss.Lethality         := Lethality ;
  ss.FiringMode        := FiringMode ;
  ss.LaunchDelay       := LaunchDelay ;   // second
  ss.DamageCapacity    := DamageCapacity ;

  //SameGroupPlatform : T3CubicleGroup ;
  //DetectPlatform    : TT3UnitContainer ;
  ss.SeekerOn          := SeekerOn ;
  ss.HaveSeeker        := HaveSeeker ;
  ss.isCounterDelay    := FisCounterDelay;
  ss.Launching         := Launching ;
  ss.isRBLW            := isRBLW ;
  ss.isBOLW            := isBOLW ;
  ss.isBOL             := isBOL ;
  ss.Definition        := Definition ;
  ss.Engagement        := byte(Engagement) ; // TMissileEngagement ;
  ss.LauncherNumber    := LauncherNumber ;
  ss.TargetPosition    := TargetPosition ;
  if Owner <> nil then
    ss.Owner           := TT3Unit(Owner).InstanceIndex ;
  ss.ShipIndex         := ShipIndex ;
  ss.ShipName          := ShipName ;
  ss.TargetIndex       := TargetIndex ;
  ss.TargetName        := TargetName ;
  ss.TargetTrackCourse := TargetTrackCourse ;
  ss.TargetTrackSpeed  := TargetTrackSpeed ;
  ss.TargetTrackAlt    := TargetTrackAlt ;
  ss.DistanceToTarget  := DistanceToTarget ;
  ss.isAirLaunch       := isAirLaunch ;
  ss.FHomePositionX    := FHomePositionX ;
  ss.FHomePositionY    := FHomePositionY ;
  Result := ss ;
end;

function TT3Missile.Get_RainRangeReductionFactor(PrimaryGuidanceType,
  RainRate: Byte): Double;
var
  i : Integer;
  reduction : Double;
  Rainfall : TRainfall_On_Missile_Seeker;
begin
  Result := 0;
  reduction := 0;

  if not Assigned(GameDefaults.RainfallMissile) then
  begin
    Exit;
  end;

  if not ((PrimaryGuidanceType >= 1) or (PrimaryGuidanceType <= 3)) then
    Exit;

  for i := 0 to GameDefaults.RainfallMissile.Count - 1 do
  begin
    Rainfall := GameDefaults.RainfallMissile.Items[i];


    //choco => PrimaryGuidanceType perlu di +2 karena data GuideType pada Rainfall Efect bernilai :
    //3 untuk TARH (di missile TARH direpresentasikan 1)
    //4 untuk IRH (di missile IRH direpresentasikan 2)
    //5 untuk ARH (di missile ARH direpresentasikan 3)
    if Rainfall.FData.Guide_Type = PrimaryGuidanceType+2 then
    begin
      case RainRate of
        0: reduction := Rainfall.FData.Rain_0_Effect;
        1: reduction := Rainfall.FData.Rain_1_Effect;
        2: reduction := Rainfall.FData.Rain_2_Effect;
        3: reduction := Rainfall.FData.Rain_3_Effect;
        4: reduction := Rainfall.FData.Rain_4_Effect;
        5: reduction := Rainfall.FData.Rain_5_Effect;
        6: reduction := Rainfall.FData.Rain_6_Effect;
      end;

      Result := Definition.Term_Guide_Range * reduction;
    end;
  end;
end;

//procedure TT3Missile.Initialize(vActivation: TRecPlatform_Activation);
//var
//  color : TCOlor;
//  symbol  : string;
//begin
//
//  inherited Initialize;
//
//  FMover.X := vActivation.Init_Position_Longitude;
//  FMover.Y := vActivation.Init_Position_Latitude;
////  FMover.Z := vActivation.Init_Altitude * C_Feet_To_Meter;
//  FMover.Z := 10; // default smentara
//
//  FPosition.X := FMover.X;
//  FPosition.Y := FMover.Y;
//  FPosition.Z := FMover.Z + (10  / (C_NauticalMile_To_Metre * C_Degree_To_NauticalMile));
//
//  Course  := vActivation.Init_Course;
//
//  FLastPosition.X := FPosition.X;
//  FLastPosition.Y := FPosition.Y;
//  FLastPosition.Z := FPosition.Z;
//
//  FMover.Enabled := true;
//  FAltitudeState := mcsStable;
//
//  FHomePositionY := FPosition.Y;
//  FHomePositionX := FPosition.X;
//
//  FPlatformDomain := 0; // otomatis domain udara
//
//  if isInstructor then
//  begin
//    if Assigned(Parent) then
//      symbol := getCorrectSymbol(TT3PlatformInstance(Parent).PlatformDomain,
//                TT3PlatformInstance(Parent).PlatformType,
//                TT3PlatformInstance(Parent).Force_Designation, color)
//    else begin
//      symbol := getCorrectSymbol(FPlatformDomain, PlatformType, Force_Designation, color);
//    end;
//  end
//  else
//  begin
//    symbol := getCorrectSymbol(FPlatformDomain, PlatformType, 3, color);
//  end;
//
//  FTacticalSymbol   := TTacticalSymbol.Create;
//  FSignPlatform     := TTextVisual.Create;
//  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'MissileFriend.bmp', color);
//  FTacticalSymbol.Color := color;
//
//  HaveSeeker := True; //asumsi awal2 semua misil pnya sekeer
//end;

procedure TT3Missile.SetSnapshotData(const ss : _SS_TT3Missile);
begin
   TT3Weapon(Self).SetSnapshotData(ss.W);
   Lethality         := ss.Lethality ;
   LauncherIndex     := ss.LauncherIndex ;
  FiringMode        := ss.FiringMode ;
  LaunchDelay       := ss.LaunchDelay ;   // second
  DamageCapacity    := ss.DamageCapacity ;
  //SameGroupPlatform : T3CubicleGroup ;
  //DetectPlatform    : TT3UnitContainer ;
  FLaunching        := ss.Launching;
  FisCounterDelay   := ss.isCounterDelay;
  SeekerOn          := ss.SeekerOn ;
  HaveSeeker        := ss.HaveSeeker ;
  isRBLW            := ss.isRBLW ;
  isBOLW            := ss.isBOLW ;
  isBOL             := ss.isBOL ;
  Definition        := ss.Definition ;
  Engagement        := TMissileEngagement(ss.Engagement) ; // TMissileEngagement ;
  LauncherNumber    := ss.LauncherNumber ;
  TargetPosition    := ss.TargetPosition ;
  ShipIndex         := ss.ShipIndex ;
  ShipName          := ss.ShipName ;
  TargetIndex       := ss.TargetIndex ;
  TargetName        := ss.TargetName ;
  TargetTrackCourse := ss.TargetTrackCourse ;
  TargetTrackSpeed  := ss.TargetTrackSpeed ;
  TargetTrackAlt    := ss.TargetTrackAlt ;
  DistanceToTarget  := ss.DistanceToTarget ;
  isAirLaunch       := ss.isAirLaunch ;
  FHomePositionX    := ss.FHomePositionX ;
  FHomePositionY    := ss.FHomePositionY ;
end;


procedure TT3Missile.SetSnapshotLaunched(const st: boolean);
begin
   FLaunching := st ;
end;

procedure TT3Missile.SetSpotNumber(const Value: integer);
begin
  FSpotNumber := Value;
end;

constructor TT3Missile.Create;
begin
  inherited;
  FLockHeading  := false;
  FMover        := T2DMover.Create;
  FLastChaff    := nil;
  FLaunchDelay  := 1;

  //  FTacticalSymbol   := TTacticalSymbol.Create;       //mk
  //  FSignPlatform     := TTextVisual.Create;
  //  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'MissileFriend.bmp',cgFriend);

  FAltitudeState      := mcsStable;
  FSpeedState         := mcsStable;
  FHeadingState       := mcsStable;
  FLastAltitudeState  := mcsStable;

  FOrderedSpeedAchieved   := true;
  FOrderedHeadingAchieved := true;
  FEngageTargetSucced     := false;
  FSeekerOn               := false;
  FSeekAltitudeOnce       := false;
  FNeedAdjust             := true;

  FCounterDelay           := 0;
  FisCounterDelay         := false;
  FLaunching              := false;

  FCycleUpdateAltitude    := 2.00; //second
  PredictionEngageTime    := 0;
  PredictionFlightTime    := 0;

  WeaponWaypoint := TWeaponWaypoint.Create;
  isLockTarget := False;
  isShowMode := True;
  FListCrossection := TStringList.Create;
end;

procedure TT3Missile.DrawCircleofRBL(acnv: Tcanvas);
var
  Rects : TRect;

  i,r,j  : Integer;
  pi : TT3PlatformInstance;
  tg : TT3DetectedTrack;

  Ratio : Double;

  DistanceMissileToTarget, DistanceHomeToTarget, DistanceShipToTarget : Double;
  RangeCircleRBLShip, RangeCircleRBLTarget : Double;
  RangeCircleRBLShipShrink, RangeCircleRBLTargetShrink : Double;

  pt : TPoint;
  dx, dy : Double;

  CoorShipX, CoorShipY : Double;
  tCoorShipX, tCoorShipY : integer;

  grp : T3CubicleGroup;
  gm  : T3CubicleGroupMember;

  isFound : Boolean;
begin
  with acnv do
  begin
    Pen.Color := clSilver;
    Pen.Style := psSolid;
    Pen.Width := 1;
    Brush.Style := bsClear;

    RangeCircleRBLShip := 5/60; //5 nouctical mile
    RangeCircleRBLTarget := 0.9 * RangeCircleRBLShip; // For Target object
    RangeCircleRBLShipShrink := 0;

    //Draw Circle in All Ship
    if isInstructor or isWasdal then
    begin
      //Draw Circle in All Target (TT3platformInstance)
      if not Assigned(TargetPlatforms) then
        Exit;

      for i := 0 to TargetPlatforms.itemCount - 1 do
      begin
        pi := TargetPlatforms.getObject(i) as TT3PlatformInstance;

        if pi is TT3Vehicle then
        begin
          if TT3Vehicle(pi) = TT3Vehicle(Owner) then
            Continue;

          if TT3Vehicle(pi) = TT3Vehicle(Ftarget) then
            Continue;

          DistanceMissileToTarget := CalcRange(getPositionX, getPositionY, TT3Vehicle(FTarget).getPositionX,
                                     TT3Vehicle(FTarget).getPositionY);
          DistanceHomeToTarget    := CalcRange(Owner.getPositionX, Owner.getPositionY, TT3Vehicle(FTarget).getPositionX,
                                     TT3Vehicle(FTarget).getPositionY);
          DistanceShipToTarget    := CalcRange(TT3Vehicle(Ftarget).getPositionX, TT3Vehicle(Ftarget).getPositionY,
                                     TT3Vehicle(pi).getPositionX, TT3Vehicle(pi).getPositionY);

          if DistanceHomeToTarget <> 0 then
            Ratio := DistanceMissileToTarget / DistanceHomeToTarget
          else
            Ratio := DistanceMissileToTarget;

          if (Ratio <= 1) and (Ratio > 0.4) then
            RangeCircleRBLShipShrink   := RangeCircleRBLShip * Ratio
          else
          if (Ratio > 1) then
            RangeCircleRBLShipShrink   := RangeCircleRBLShip
          else
          if (Ratio < 0.4) then
            RangeCircleRBLShipShrink   := RangeCircleRBLShip * 0.4;

          if (not TT3Vehicle(pi).Dormant) and (DistanceShipToTarget < 25) then
          begin

            CoorShipX := TT3Vehicle(pi).getPositionX;
            CoorShipY := TT3Vehicle(pi).getPositionY;

            dx := CoorShipX + RangeCircleRBLShipShrink;
            dy := CoorShipY;

            Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
            Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

            r := Abs(pt.X - tCoorShipX);

            Rects.Top     := tCoorShipY - r;
            Rects.Left    := tCoorShipX - r;
            Rects.Bottom  := tCoorShipY + r;
            Rects.Right   := tCoorShipX + r;

            Ellipse(Rects);
          end;
        end;
      end;
    end
    else
    begin
      //Draw Circle in All Target (TT3detectedTrack & Fmygroup)
      //Draw Circle in DetectecTrack
      if not Assigned(DetectPlatform) then Exit;

      for i := 0 to DetectPlatform.itemCount - 1 do
      begin
        tg := DetectPlatform.getObject(i) as TT3DetectedTrack;

        if tg is TT3DetectedTrack then
        begin
          if TT3DetectedTrack(tg).TrackObject.InstanceIndex = TT3Vehicle(Owner).InstanceIndex then
            Continue;

          if TT3DetectedTrack(tg).TrackObject.InstanceIndex = TT3Vehicle(Ftarget).InstanceIndex then
            Continue;

          DistanceMissileToTarget := CalcRange(getPositionX, getPositionY, TT3Vehicle(FTarget).getPositionX,
                                     TT3Vehicle(FTarget).getPositionY);
          DistanceHomeToTarget    := CalcRange(Owner.getPositionX, Owner.getPositionY, TT3Vehicle(FTarget).getPositionX,
                                     TT3Vehicle(FTarget).getPositionY);
          DistanceShipToTarget    := CalcRange(TT3Vehicle(Ftarget).getPositionX, TT3Vehicle(Ftarget).getPositionY,
                                     TT3DetectedTrack(tg).getPositionX, TT3DetectedTrack(tg).getPositionY);

          if DistanceHomeToTarget <> 0 then
            Ratio := DistanceMissileToTarget / DistanceHomeToTarget
          else
            Ratio := DistanceMissileToTarget;

          if (Ratio <= 1) and (Ratio > 0.4) then
            RangeCircleRBLShipShrink   := RangeCircleRBLShip * Ratio
          else
          if (Ratio > 1) then
            RangeCircleRBLShipShrink   := RangeCircleRBLShip
          else
          if (Ratio < 0.4) then
            RangeCircleRBLShipShrink   := RangeCircleRBLShip * 0.4;

          if (not TT3DetectedTrack(tg).Dormant) and (DistanceShipToTarget < 25) then
          begin
            CoorShipX := TT3DetectedTrack(tg).getPositionX;
            CoorShipY := TT3DetectedTrack(tg).getPositionY;

            dx := CoorShipX + RangeCircleRBLShipShrink;
            dy := CoorShipY;

            Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
            Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

            r := Abs(pt.X - tCoorShipX);

            Rects.Top     := tCoorShipY - r;
            Rects.Left    := tCoorShipX - r;
            Rects.Bottom  := tCoorShipY + r;
            Rects.Right   := tCoorShipX + r;

            Ellipse(Rects);
          end;
        end;
      end;

      //Draw Circle in FmyCub
      if not Assigned(TargetPlatforms) then Exit;
      for i := 0 to TargetPlatforms.itemCount - 1 do
      begin
        pi := TargetPlatforms.getObject(i) as TT3PlatformInstance;

        if pi is TT3Vehicle then
        begin
          if TT3Vehicle(pi) = TT3Vehicle(Owner) then Continue;
          if TT3Vehicle(pi) = TT3Vehicle(Ftarget) then Continue;

          for j := 0 to SameGroupPlatform.Count - 1 do
          begin
            gm := SameGroupPlatform.Items[j] as T3CubicleGroupMember;
            if gm <> nil then
            begin
              if TT3Vehicle(pi).InstanceIndex = gm.FData.Platform_Instance_Index then
              begin
                DistanceMissileToTarget := CalcRange(getPositionX, getPositionY, TT3Vehicle(FTarget).getPositionX,
                                           TT3Vehicle(FTarget).getPositionY);
                DistanceHomeToTarget    := CalcRange(Owner.getPositionX, Owner.getPositionY, TT3Vehicle(FTarget).getPositionX,
                                           TT3Vehicle(FTarget).getPositionY);
                DistanceShipToTarget    := CalcRange(TT3Vehicle(Ftarget).getPositionX, TT3Vehicle(Ftarget).getPositionY,
                                           TT3Vehicle(pi).getPositionX, TT3Vehicle(pi).getPositionY);

                if DistanceHomeToTarget <> 0 then
                  Ratio := DistanceMissileToTarget / DistanceHomeToTarget
                else
                  Ratio := DistanceMissileToTarget;

                if (Ratio <= 1) and (Ratio > 0.4) then
                  RangeCircleRBLShipShrink   := RangeCircleRBLShip * Ratio
                else
                if (Ratio > 1) then
                  RangeCircleRBLShipShrink   := RangeCircleRBLShip
                else
                if (Ratio < 0.4) then
                  RangeCircleRBLShipShrink   := RangeCircleRBLShip * 0.4;

                if (not TT3Vehicle(pi).Dormant) and (DistanceShipToTarget < 25) then
                begin
                  CoorShipX := TT3Vehicle(pi).getPositionX;
                  CoorShipY := TT3Vehicle(pi).getPositionY;

                  dx := CoorShipX + RangeCircleRBLShipShrink;
                  dy := CoorShipY;

                  Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
                  Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

                  r := Abs(pt.X - tCoorShipX);

                  Rects.Top     := tCoorShipY - r;
                  Rects.Left    := tCoorShipX - r;
                  Rects.Bottom  := tCoorShipY + r;
                  Rects.Right   := tCoorShipX + r;

                  Ellipse(Rects);
                end;
              end;
            end;
          end;
        end;
      end;
    end;

    //Draw Circle in Owner Ship
    if (Assigned(Ftarget)) and (FTarget is TT3Vehicle) then
    begin
      DistanceMissileToTarget := CalcRange(getPositionX, getPositionY, TT3Vehicle(FTarget).getPositionX,
                                 TT3Vehicle(FTarget).getPositionY);
      DistanceHomeToTarget    := CalcRange(Owner.getPositionX, Owner.getPositionY,
                                 TT3Vehicle(FTarget).getPositionX, TT3Vehicle(FTarget).getPositionY);

      if DistanceHomeToTarget <> 0 then
        Ratio := DistanceMissileToTarget / DistanceHomeToTarget
      else
        Ratio := DistanceMissileToTarget;

      if (Ratio <= 1) and (Ratio > 0.4) then
        RangeCircleRBLShipShrink   := RangeCircleRBLShip * Ratio
      else
      if (Ratio > 1) then
        RangeCircleRBLShipShrink   := RangeCircleRBLShip
      else
      if (Ratio < 0.4) then
        RangeCircleRBLShipShrink   := RangeCircleRBLShip * 0.4;

      if (not TT3Vehicle(Ftarget).Dormant) and (DistanceHomeToTarget < 25) then
      begin
        CoorShipX := TT3Vehicle(Owner).getPositionX;
        CoorShipY := TT3Vehicle(Owner).getPositionY;

        dx := CoorShipX + RangeCircleRBLShipShrink;
        dy := CoorShipY;

        Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
        Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

        r := Abs(pt.X - tCoorShipX);

        Rects.Top     := tCoorShipY - r;
        Rects.Left    := tCoorShipX - r;
        Rects.Bottom  := tCoorShipY + r;
        Rects.Right   := tCoorShipX + r;

        Ellipse(Rects);
      end;
    end;

    //Draw Circle in Target
    if (Assigned(Ftarget)) and (FTarget is TT3Vehicle) then
    begin
      DistanceMissileToTarget := CalcRange(getPositionX, getPositionY, TT3Vehicle(FTarget).getPositionX, TT3Vehicle(FTarget).getPositionY);
      DistanceHomeToTarget    := CalcRange(Owner.getPositionX, Owner.getPositionY, TT3Vehicle(FTarget).getPositionX, TT3Vehicle(FTarget).getPositionY);

      if DistanceHomeToTarget <> 0 then
        Ratio := DistanceMissileToTarget / DistanceHomeToTarget
      else
        Ratio := DistanceMissileToTarget;

      if (Ratio <= 1) and (Ratio > 0.4) then
      begin
        RangeCircleRBLShipShrink   := RangeCircleRBLShip * Ratio;
        RangeCircleRBLTargetShrink := RangeCircleRBLTarget * Ratio;
      end
      else
      if (Ratio > 1) then
      begin
        RangeCircleRBLShipShrink   := RangeCircleRBLShip;
        RangeCircleRBLTargetShrink := RangeCircleRBLTarget;
      end
      else
      if (Ratio < 0.4) then
      begin
        RangeCircleRBLShipShrink   := RangeCircleRBLShip * 0.4;
        RangeCircleRBLTargetShrink := RangeCircleRBLTarget * 0.4;
      end;

      if (not TT3Vehicle(Ftarget).Dormant) then
      begin
        //Draw Circle 1
        CoorShipX := TT3Vehicle(FTarget).getPositionX;
        CoorShipY := TT3Vehicle(Ftarget).getPositionY;

        dx := CoorShipX + RangeCircleRBLShipShrink;
        dy := CoorShipY;

        Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
        Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

        r := Abs(pt.X - tCoorShipX);

        Rects.Top     := tCoorShipY - r;
        Rects.Left    := tCoorShipX - r;
        Rects.Bottom  := tCoorShipY + r;
        Rects.Right   := tCoorShipX + r;

        Ellipse(Rects);

        //Draw Circle 2
        CoorShipX := TT3Vehicle(FTarget).getPositionX;
        CoorShipY := TT3Vehicle(Ftarget).getPositionY;

        dx := CoorShipX + RangeCircleRBLTargetShrink;
        dy := CoorShipY;

        Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
        Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

        r := Abs(pt.X - tCoorShipX);

        Rects.Top     := tCoorShipY - r;
        Rects.Left    := tCoorShipX - r;
        Rects.Bottom  := tCoorShipY + r;
        Rects.Right   := tCoorShipX + r;

        Ellipse(Rects);
      end;
    end;
  end;
end;

destructor TT3Missile.Destroy;
begin

  inherited;
  FListCrossection.Clear;
  FListCrossection.Free;
end;

procedure TT3Missile.Draw(aCnv: tCanvas);
var
  xPos, yPos, tHAFO_X, tHAFO_Y : Integer;
begin
  inherited;

  FTacticalSymbol.isVehicle := false;

  if (Self is TT3Missile_SA) and
    not vFilter.Show(pftAir, 'Surface-to-air missile', 'Weapon engagements') then
    Exit;

  if not Visible then Exit;
  if not Planned then Exit;

  if (FLaunching) then
  begin
    FTacticalSymbol.SpeedVector.Speed   := 60;
    FTacticalSymbol.SpeedVector.Course  := Course;
    FTacticalSymbol.SpeedVector.Visible := True;
    FTacticalSymbol.SpeedVector.Color   := FTacticalSymbol.Color; //mk

    FTacticalSymbol.Seeker.Azimuth := Definition.Term_Guide_Azimuth;
    FTacticalSymbol.Seeker.Bearing := Course;
    FTacticalSymbol.Seeker.Range := Definition.Term_Guide_Range;
    FTacticalSymbol.Seeker.Visible := vSymbolSetting.MissileSeekerVisible;

    FTacticalSymbol.SetTextVisibility(Visible);

    if isInstructor or isWasdal then
      FTacticalSymbol.CallSign1   := Track_ID
    else
      FTacticalSymbol.CallSign1   := IntToStr(TrackNumber);

    FTacticalSymbol.SetTextColor(FTacticalSymbol.Color); //mk
    FTacticalSymbol.Visible             := Visible;
    FTacticalSymbol.Draw(aCnv);

    xPos := FTacticalSymbol.Center.X;
    yPos := FTacticalSymbol.Center.Y;
    FSignPlatform.Text    := '+';
    FSignPlatform.Center  := Point(xPos - 7, yPos);
    FSignPlatform.Visible := Visible;
    FSignPlatform.Color   := FTacticalSymbol.Color; //mk
    FSignPlatform.Draw(aCnv);

    Converter.ConvertToScreen(HAFOPosition.X,HAFOPosition.Y,tHAFO_X,tHAFO_Y);
    aCnv.TextOut(tHAFO_X,tHAFO_Y,'F')
  end;
end;

function TT3Missile.getAltitude: single;
begin
  Result := FMover.Z  * C_Degree_To_NauticalMile * C_NauticalMile_To_Metre;
end;

function TT3Missile.getPos(const Index: Integer): double;
begin
  Result := ConvCartesian_To_Compass(FMover.Direction);

  try
    case Index of
      1: Result := ConvCartesian_To_Compass(FMover.Direction);
      2: Result := FMover.Speed;
    end;
  except
  end;
end;

procedure TT3Missile.Initialize;
var
  color : TCOlor;
  symbol  : string;
begin
  inherited;

  isSynchMissileVBS := False;

  if not (Assigned(FParent)) then  //mk
    Exit;

  FMover.X := FParent.getPositionX;
  FMover.Y := FParent.getPositionY;
  FMover.Z := FParent.getPositionZ;

  FPosition.X := FMover.X;
  FPosition.Y := FMover.Y;
  //FPosition.Z := 10  / (C_NauticalMile_To_Metre * C_Degree_To_NauticalMile) ;
//  FPosition.Z := FMover.Z + (10  * (C_Meter_To_NauticalMile * C_Degree_To_NauticalMile));
  FPosition.Z := FMover.Z;

  FLastPosition.X := FPosition.X;
  FLastPosition.Y := FPosition.Y;
  FLastPosition.Z := FPosition.Z;

  FMover.Enabled := true;
  FAltitudeState := mcsStable;

  FHomePositionY := FParent.getPositionY;
  FHomePositionX := FParent.getPositionX;

  FMissileDefinition := TMissile_On_Board(UnitDefinition);
  FPlatformDomain := 0; // otomatis domain udara
  FEstimateHitTime := -1; //second
  FSpotNumber := FMissileDefinition.FDef.Spot_Number;
  FIsOnAcquisitionDelay := false;

  if isInstructor or isWasdal then
  begin            //mk
    symbol := getCorrectSymbol(TT3PlatformInstance(Parent).PlatformDomain,
              TT3PlatformInstance(Parent).PlatformType,
              TT3PlatformInstance(Parent).Force_Designation, color);
  end
  else
  begin
    symbol := getCorrectSymbol(FPlatformDomain, PlatformType, 3, color);
  end;

  FTacticalSymbol   := TTacticalSymbol.Create;
  FSignPlatform     := TTextVisual.Create;
//  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'MissileFriend.bmp', color);
  FTacticalSymbol.SymbolVisual.FontName := 'atct';
  FTacticalSymbol.SymbolVisual.CharSymbol := 's';
  FTacticalSymbol.Color := color;

  HaveSeeker := True; //asumsi awal2 semua misil pnya sekeer

  if Assigned(FMissileDefinition) then   begin
    with FMissileDefinition do begin
      DamageCapacity := Fdef.Damage_Capacity;
      InstanceIndex := FData.Fitted_Weap_Index;
      InstanceName  := FData.Instance_Identifier;
      Lethality     := FDef.Lethality;
      FMaxRange     := FDef.Max_Range;
      FEngagementRange  := FDef.Engagement_Range;
      FTurnOnSeekRange  := FDef.Seeker_TurnOn_Range;
      FTerminal_Altitude_Required := Boolean(FDef.Terminal_Altitude_Required);
      FDefaultAltitude  := FDef.Default_Altitude;
      FDefaultSeekAltitude := FDef.Terminal_Acquisition_Altitude;
      DamageCapacity := FDef.Damage_Capacity;

      FHOJTypeA := FDef.Home_On_Jam_Type_A_Capable = 1;
      FHOJTypeB := FDef.Home_On_Jam_Type_B_Capable = 1;
      FHOJTypeC := FDef.Home_On_Jam_Type_C_Capable = 1;
      FECCMType := FDef.ECCM_Type;
    end;
  end;

//  PopUp_Move := ppPopUP;
//  FisHAFOSet := False;
//  FHAFO      := 1.97;
//  FisPopUP   := false;
//  FisHavePopUp    := False;
//  FTargettoPopUp  := nil;

//set Detectability Type
  DetectabilityType := FMissileDefinition.FDef.Detectability_Type;

  case FMissileDefinition.FDef.Primary_Guide_Type of
    0 : FPrimaryGuidance :=  mgtSARH;
    1 : FPrimaryGuidance :=  mgtTARH;
    2 : FPrimaryGuidance :=  mgtIRHoming;
    3 : FPrimaryGuidance :=  mgtAntiRadiation;
    4 : FPrimaryGuidance :=  mgtStraigth;
    5 : FPrimaryGuidance :=  mgtHybrid;
  end;
  case FMissileDefinition.FDef.Secondary_Guide_Type of
    0 : FSecondaryGuidance :=  mgtSARH;
    1 : FSecondaryGuidance :=  mgtTARH;
    2 : FSecondaryGuidance :=  mgtIRHoming;
    3 : FSecondaryGuidance :=  mgtAntiRadiation;
    4 : FSecondaryGuidance :=  mgtStraigth;
    5 : FSecondaryGuidance :=  mgtHybrid;
  end;

  FReAcquisitionCounter := 0.00;
  FIsOnAcquisitionDelay := false;

  if Assigned(UnitMotion) then
    FMover.Speed := UnitMotion.FData.Max_Ground_Speed;
end;

function TT3Missile.isMissileCapableToTarget(Target: TSimObject): Boolean;
begin
  Result := False;

  if Target is TT3Vehicle then
  begin
    //cek domain platform sesuai capable nya
    case TT3Vehicle(Target).PlatformDomain of
      0:
      begin
        if Definition.Anti_Air_Capable = 1 then
          Result := True;
      end;
      1:
      begin
        if Definition.Anti_Sur_Capable = 1 then
          Result := True;
      end;
      2:
      begin
        if TT3Vehicle(Target).Altitude > 0 then
        begin
          if Definition.Anti_SubSur_Capable = 1 then
            Result := True;
        end
        else
        begin
          if Definition.Anti_Sur_Capable = 1 then
            Result := True;
        end;
      end;
      3:
      begin
        if Definition.Anti_Land_Capable = 1 then
          Result := True;
      end;
      vhdAmphibious :
      begin
        if Boolean(Definition.Anti_Amphibious_Capable) then
          Result := True;
      end;
    end;
  end
  else if Target is TT3Chaff then
  begin
    if (Definition.Primary_Guide_Type = 1) and (Definition.ECM_Detection = 0) then
      Result := True;
  end
  else if Target is TT3InfraredDecoy then
  begin
    if(Definition.Primary_Guide_Type = 2) and (Definition.IRCM_Detection = 0) then
      Result := True;
  end
  else if Target is TT3FloatingDecoy then
    Result := True;
end;

function TT3Missile.isSeekerDetectTarget(Target: TSimObject): Boolean;
var
  IsOnRange, IsOnAzimuth{*, IsOnElevation*} : Boolean;
  Range, Azimuth{*, Elevation*}, FromAngle, ToAngle, RainReductionFactor : Double;
//  PitchAngle, AltitudeAtCentreEnvelope : Double;
begin
  Result := False;

  Azimuth := CalcBearing(PosX,PosY,Target.PosX,Target.PosY);

  FromAngle := Course - Definition.Term_Guide_Azimuth;
  if FromAngle < 0 then
    FromAngle := FromAngle + 360;

  ToAngle   := Course + Definition.Term_Guide_Azimuth;
  if ToAngle >= 360 then
    ToAngle := ToAngle - 360;

  IsOnAzimuth := DegComp_IsBeetwen(Azimuth,FromAngle,ToAngle);

  {PitchAngle := FMover.VerticalSpeed / Speed;
  AltitudeAtCentreEnvelope := PitchAngle * Range + Altitude;
  Elevation := Tan(Definition.Term_Guide_Elevation) * Range;

  FromAngle := AltitudeAtCentreEnvelope - Elevation;
  ToAngle   := AltitudeAtCentreEnvelope + Elevation;
  isOnElevation := (Altitude > FromAngle) and (Altitude < ToAngle);}

  //cek pengaruh Rainfall Effect terhadap Missile Seeker Range Envelope
  Range := CalcRange(FPosition.X,FPosition.Y,Target.PosX,Target.PosY);
  RainReductionFactor := Get_RainRangeReductionFactor(Definition.Primary_Guide_Type,
                         Environment.FData.Rain_Rate);
  IsOnRange := Range < (Definition.Term_Guide_Range - RainReductionFactor);

  if IsOnRange and IsOnAzimuth {and IsOnElevation} then
    Result := True;
end;

function TT3Missile.isSeekerOn: boolean;
var
  rangeFromTarget : Double;
  rangeFromHome   : Double;
  hRange,hBearing,hTime,hSpeed : double;
begin
  //Perlu di cek lagi. jika missile primary guide adalah TARH dan missile di jamming, maka : seeker akan di
  //aktif kan ulang saat [Current Game Time > Game Time that Missile was Jammed + Missile Reaqusition Time
  //(from Game Default)]
  if FSeekerOn then result := FSeekerOn
  else begin
    rangeFromTarget := CalcRange(FTargetPosition.X,FTargetPosition.Y,FPosition.X, FPosition.Y);
    rangeFromHome   := CalcRange(FHomePositionX, FHomePositionY, FPosition.X, FPosition.Y);

    FSeekerOn := false;

    CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                     hRange,hBearing,hTime,hSpeed);
    PredictionEngageTime := hTime * 60 ; {menit to second}


    case FiringMode of
      mfmRBl,mfmRBLW, mfmDirect :
      begin
        if rangeFromTarget < FTurnOnSeekRange then
        begin
          FSeekerOn := true;
          if Assigned(OnLogEventStr) then
            OnLogEventStr('TT3Missile.isSeekerOn', 'Seeker On, In RBL/RBLW Mode');
        end;
      end;
      mfmBOL,mfmBOLW, mfmBearing :
      begin
        if rangeFromHome > FTurnOnSeekRange then
        begin
          FSeekerOn := True;
          if Assigned(OnLogEventStr) then
            OnLogEventStr('TT3Missile.isSeekerOn', 'Seeker On, In BOL/BOLW Mode');
        end;
      end;
      mfmAimpoint :
      begin
        rangeFromHome := CalcRange(StaticTargetPos.X, StaticTargetPos.Y, FPosition.X, FPosition.Y);

        if rangeFromHome > FTurnOnSeekRange then
        begin
          FSeekerOn := True;
          if Assigned(OnLogEventStr) then
            OnLogEventStr('TT3Missile.isSeekerOn', 'Seeker On, In BOL/BOLW Mode');
        end;
      end;
    end;

    result := FSeekerOn;
  end;
end;

function TT3Missile.isValidToTarget(Target: TSimObject): Boolean;
//var
//  i : Integer;
//  device : TT3DeviceUnit;
begin
  Result := False;

  if isSeekerDetectTarget(Target) and isMissileCapableToTarget(Target) then
  begin
    case Definition.Primary_Guide_Type of
      0:
      begin
        Result := True;
          //coment sementara, jadi untuk semua missile tidak menggunakan radar FC
//        for i := 0 to TT3Vehicle(Target).Devices.Count - 1 do
//        begin
//          device := TT3Vehicle(Target).Devices.Items[i];
//
//          if (device is TT3FCRSensor) and
//             (TT3FCRSensor(device).OperationalStatus = sopOn) then
//          begin
//            Result := True;
//            Break;
//          end;
//        end;
      end;
    else
      Result := True;
    end;
  end;
end;

procedure TT3Missile.Jammed(Sender: TObject);
begin
  if Sender is TT3DefensiveJammerOnVehicle then
  begin
    FIsOnAcquisitionDelay := true;
    FReAcquisitionCounter := 0.00;

    FTargetObject := nil;
    isLockTarget  := false;

    SetOrderedAltitude(Altitude);
    SetOrderedHeading(Course); // + 45);
  end;
end;

procedure TT3Missile.Move(const aDeltaMs: double);
var
  {$IFDEF SERVER}
  isOutOfEndurance : Boolean;
  {$ENDIF}
  vRange, vtime, vBearing, hSpeed : double;
  range, bearing : double;
begin
  inherited;
  vRange   := 0;
  vBearing := 0;
  vtime    := 1;
  hSpeed   := 0;

  {$IFDEF SERVER}
  if FreeMe <> True then
  begin
    isOutOfEndurance := False;

    case FEnduranceType of
      entFuel:
      begin
        if FFuelRemaining <= 0 then
          isOutOfEndurance := True;
      end;
      entTime:
      begin
        if FTimeRemaining <= 0 then
          isOutOfEndurance := True;
      end;
      entRange:
      begin
        if FRangeRemaining <= 0 then
          isOutOfEndurance := True;
      end;
      entUnlimited: ;
    end;

    if isOutOfEndurance then
    begin
      Launched := false;
      FLaunching := false;

      if Assigned(OnOut) then
        OnOut(Self,3);
    end;
  end;
  {$ENDIF}

  if FreeMe then
  begin
    if Assigned(OnHancur) then
      OnHancur(Self, Self.UnitMakeDestroy, Self.reasonDestroy);
  end;

  // estimasi waktu perkenaan
  if Assigned(FTargetObject) then begin
    if FTargetObject.FreeMe = False then
    begin
      range := CalcRange(FTargetObject.getPositionX,FTargetObject.getPositionY,
                         PosX,PosY);
      bearing := CalcBearing(FTargetObject.getPositionX,FTargetObject.getPositionY,
                         PosX,PosY);
      CalcHitPrediction(range, bearing, TT3PlatformInstance(FTargetObject).Speed,
           TT3PlatformInstance(FTargetObject).Course, Speed, vRange, vBearing, vtime, hSpeed);

      if Round(range) < 1 then
      begin
        if Assigned(OnMissileSynchVBS) and (isSynchMissileVBS = False) then
        begin
          //OnMissileSynchVBS(Self);
          //isSynchMissileVBS := True;
        end;
      end;
    end
    else
    begin
      FTargetObject := nil;
      FTarget       := nil;
    end;

    FEstimateHitTime := vtime * 60; // detik
  end else
    FEstimateHitTime := -1; // ga ada target
end;

procedure TT3Missile.RepositionTo(const x, y: double);
begin
  inherited;

  FMover.X := X;
  FMover.Y := Y;
end;

procedure TT3Missile.SetAltitude(const Value: Single);
begin
  FMover.Z          := Value  / (C_NauticalMile_To_Metre * C_Degree_To_NauticalMile) ;
end;

procedure TT3Missile.SetDamageCapacity(const Value: double);
begin
  FDamageCapacity := Value;
end;

procedure TT3Missile.SetDefaultAltitude(const Value: double);
begin
  FDefaultAltitude := Value;
end;

procedure TT3Missile.SetDefaultSeekAltitude(const Value: double);
begin
  FDefaultSeekAltitude := Value;
end;

procedure TT3Missile.SetDefinition(const Value: TRecMissile_Definition);
begin
  FDefinition := Value;
end;

procedure TT3Missile.SetFiringMode(const Value: TMissileFiringMode);
begin
  FFiringMode := Value;
end;

procedure TT3Missile.SetFreeMe(const Value: boolean);
begin
  inherited;
  if Assigned(OnFreeMe) then
    OnFreeMe(Self,Value);
end;

procedure TT3Missile.SetLaunchDelay(const Value: integer);
begin
  FLaunchDelay := Value;
end;

procedure TT3Missile.SetEngagement(const Value: TMissileEngagement);
begin
  FEngagement := Value;
end;

procedure TT3Missile.SetEngagementRange(const Value: double);
begin
  FEngagementRange := Value;
end;

procedure TT3Missile.SetLaunched(const Value: boolean);
var
  hRange,hBearing,hTime,hSpeed : Double;
begin
  inherited;

  if Assigned(FTargetObject) then
  begin
    if FLaunched then
    begin
      FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y,FPosition.X, FPosition.Y);
      FTargetBearing := Calcbearing(FPosition.X, FPosition.Y, FTargetPosition.X,FTargetPosition.Y);
      FTargetCourse  := TT3PlatformInstance(TargetObject).Course;
      FTargetSpeed   := TT3PlatformInstance(TargetObject).Speed;

      CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                       hRange,hBearing,hTime,hSpeed);
      PredictionFlightTime := (hTime)*3600;

      if Definition.Fly_Out_Required = 1 then
        SetOrderedAltitude(Definition.Fly_Out_Altitude * C_Feet_To_Meter)
      else
        SetOrderedAltitude(FDefaultAltitude * C_Feet_To_Meter);
    end;
  end
  else
  begin
    if FLaunched then
    begin
      case FiringMode of
        mfmAimpoint:
                    begin
                      FTargetRange   := CalcRange(StaticTargetPos.X,StaticTargetPos.Y,FPosition.X, FPosition.Y);
                      FTargetBearing := Calcbearing(FPosition.X,FPosition.Y, StaticTargetPos.X,StaticTargetPos.Y);
                      FTargetCourse  := 0;
                      FTargetSpeed   := 0;
                    end;
        mfmBearing:
                    begin
                      FTargetRange   := FMissileDefinition.FDef.Max_Range;
                      FTargetBearing := Course;
                      FTargetCourse  := 0;
                      FTargetSpeed   := 0;
                    end;
      end;

      CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                       hRange,hBearing,hTime,hSpeed);
      PredictionFlightTime := (hTime)*3600;

      if Definition.Fly_Out_Required = 1 then
        SetOrderedAltitude(Definition.Fly_Out_Altitude * C_Feet_To_Meter)
      else
        SetOrderedAltitude(FDefaultAltitude * C_Feet_To_Meter);
    end;
  end;

  FisCounterDelay := true;
end;

procedure TT3Missile.SetLethality(const Value: integer);
begin
  FLethality := Value;
end;

procedure TT3Missile.SetMaxRange(const Value: double);
begin
  FMaxRange := Value;
end;

procedure TT3Missile.SetInstructor(const Value: boolean);   //mk
begin
  inherited;

  Initialize;
end;

procedure TT3Missile.SetisCounterDelay(const Value: Boolean);
begin
  FisCounterDelay := Value;
end;

procedure TT3Missile.SetIsWasdal(const Value: Boolean);
begin
  inherited;

  Initialize;
end;

procedure TT3Missile.SetOrderedAltitude(const Value: double);
var
  dH : Double;
begin
  FOrderedAltitude          := Value  / (C_NauticalMile_To_Metre * C_Degree_To_NauticalMile) ;

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
end;

procedure TT3Missile.SetOrderedHeading(const Value: double);
var
  turnRate : double;
begin
  FOrderedHeading := Value;  // komaps

  FDeltaHead :=  getDeltaH(Value, Course);
  FOrderedHeadingAchieved :=  abs(FDeltaHead) < 2.0 ;

  if FOrderedHeadingAchieved then begin
    Course := Value;
    FHeadingState := mcsStable;
  end;

  if Assigned(UnitMotion) then begin
    turnRate     := UnitMotion.FData.Standard_Turn_Rate; // degree per second
  end else begin
    turnRate     := 0;    // degree per second
  end;

  if FDeltaHead < 0  then begin
     FMover.TurnRate := turnRate;
     FHeadingState := mcsIncrease;
  end
  else begin
     FMover.TurnRate := -turnRate;
     FHeadingState := mcsDecrease;
  end;
end;

procedure TT3Missile.SetOwner(const Value: TSimObject);
begin
  FOwner := Value;
end;

procedure TT3Missile.setPos(const Index: Integer; const Value: double);
begin
  inherited;
  case Index of
    1: FMover.Direction := ConvCompass_To_Cartesian(Value);
    2: FMover.Speed := Value;
  end;
end;

procedure TT3Missile.setPositionX(const v: double);
begin
  inherited;
  FMover.X := v;

end;

procedure TT3Missile.setPositionY(const v: double);
begin
  inherited;
  FMover.Y := v;

end;

procedure TT3Missile.setPositionZ(const v: double);
begin
  inherited;
  FMover.Z := v;

end;

procedure TT3Missile.SetPrimaryGuidance(const Value: TMissileGuidanceType);
begin
  FPrimaryGuidance := Value;
end;

procedure TT3Missile.SetSecondaryGuidance(const Value: TMissileGuidanceType);
begin
  FSecondaryGuidance := Value;
end;

procedure TT3Missile.SetSelected(const Value: boolean);
var
  col : TColor;
begin
//  col := FTacticalSymbol.Symbol.Color;
  FTacticalSymbol.Selected := Value;
//  FTacticalSymbol.Color := col;
//  FTacticalSymbol.Symbol.Visible := true;
//  FTacticalSymbol.Symbol.Color := col;

  FSelected := Value;
  //Visible := true;  ini buat apa??? buat masalah simbol

  if Assigned(FOnSelected) then
    FOnSelected(Self);
end;

procedure TT3Missile.SetTargetObject(const Value: TSimObject);
var
  hRange,hBearing,hTime,hSpeed,mx,my,h : double;
begin
  inherited;

  if not Assigned(Value) then exit;

  FTargetPosition.X := Value.getPositionX;
  FTargetPosition.Y := Value.getPositionY;
  FTargetPosition.Z := Value.getPositionZ;

  FTarget := Value;

  if FTargetObject <> Value then
    FTargetObject := Value;

  if FCycleUpdateAltitude <= 2 then exit;

  FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y,FPosition.X, FPosition.Y);
  FTargetBearing := Calcbearing(FPosition.X, FPosition.Y, FTargetPosition.X,FTargetPosition.Y);
  FTargetCourse  := TT3PlatformInstance(TargetObject).Course;
  FTargetSpeed   := TT3PlatformInstance(TargetObject).Speed;

//  if Definition.Pursuit_Guide_Type = 0 then
//  begin
    CalcHitPrediction(FTargetRange ,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                     hRange,hBearing,hTime,hSpeed);

    RangeBearingToCoord(hRange,hBearing,mx,my);
    FTargetPosition.X := FPosition.X + mx;
    FTargetPosition.Y := FPosition.Y + my;
    FTargetPosition.Z := TT3PlatformInstance(TargetObject).getPositionZ;

    FTargetBearing    := hBearing;
    FTargetRange      := hRange;
//  end;

  SetOrderedHeading(FTargetBearing);

  h := 0;
  if Assigned(Value) then
    if Value is TT3Vehicle then
      h := TT3Vehicle(Value).VehicleDefinition.FData.Height;

  if Value is TT3Vehicle then
  begin
    if (Self.Altitude >= ((h * C_Feet_To_Meter) + TT3Vehicle(Value).Altitude)) or
       (Self.Altitude <= TT3Vehicle(Value).Altitude) then
       SetOrderedAltitude(TT3Vehicle(Value).Altitude + ((h* C_Feet_To_Meter) / 2));
  end
  else
  begin
    SetOrderedAltitude(TT3PlatformInstance(Value).Altitude * C_Feet_To_Meter);
  end;

  FCycleUpdateAltitude := 0;
  FNeedAdjust  := true;
end;

procedure TT3Missile.SetTargetPlatforms(const Value: TT3UnitContainer);
begin
  FTargetPlatforms := Value;
end;

procedure TT3Missile.SetTurnOnSeekRange(const Value: double);
begin
  FTurnOnSeekRange := Value;
end;

//procedure TT3Missile.Shoot;
//begin
//  if (not Assigned(TargetObject) and not isBOLW) then exit;
//
//  FMover.MaxSpeed       := UnitMotion.FData.Max_Ground_Speed;
//  FMover.Acceleration   := UnitMotion.FData.Acceleration;
//
//  SetOrderedHeading(FTargetBearing);  // ini harusnya sesuai dengan bearing launcher
//
//  FLastPosition.X := FPosition.X;
//  FLastPosition.Y := FPosition.Y;
//  FLastPosition.Z := FPosition.Z;
//end;

procedure TT3Missile.Shooted(ShootBy: TSimObject; Lethality: single);
begin
  DamageCapacity := DamageCapacity - Lethality;

  if DamageCapacity <= 0 then
  begin
    FreeMe := true;
    AbsoluteFree := True;
  end;
end;

procedure TT3Missile.UpdateVisual;
var
  X,Y : integer;
begin
  if not Launched then begin
    Converter.ConvertToScreen(FPosition.X, FPosition.Y,X,Y);
  end else begin
    Converter.ConvertToScreen(FMover.X, FMover.Y, X, Y);
  end;

  FTacticalSymbol.Center := Point(X, Y);
  FTacticalSymbol.SpeedVector.Course := ConvCartesian_To_Compass(FMover.Direction);
  FTacticalSymbol.ConvertCoord(Converter);
end;

{ TT3MissileOnVehicle }

constructor TT3MissilesOnVehicle.Create;
begin
  inherited;

  RBLW_PointList        := TList.Create;
  RBLW_WaypointLineList := TList.Create;
  RBLW_STOTList         := TMissileRBLW_STOT.Create;

  BOLW_PointList        := TList.Create;

  FOnRBLW := False;
  FOnBOLW := False;
  FOnBOL  := False;

  BOL_Movement  := TT3BOL_Missile.create;
  RBL_Movement  := TT3RBL_Missile.create;
  HitMode       := TT3Hit_Missile.create;

  Straight_Movement   := TT3Straight_Missile.create;
  Aimpoint_Movement   := TT3Aimpoint_Missile.create;
  Bearing_Movement    := TT3BearingOnly_Missile.create;

  FSignHAFO     := TTextVisual.Create;
end;

function TT3MissilesOnVehicle.CreateProjectile: TT3Missile;
var
  projectil : TT3Missile;
  PointRBLW : TPointVehicleMissileRBLW;
  PointBOLW : TPointVehicleMissileBOLW;

  i : Integer;
  behav : TScripted_Behav_Definition;
  motion : TMotion_Characteristics;

  //Surface -> Surface
  BOL_MissileMovement : TT3BOL_Missile;
  HAFOPos : t2DPoint;
  HAFOBearing, mX, mY : Double;
  Static3DPos : t3DPoint;
begin
  projectil := nil;

  case FMissileDefinition.FDef.Primary_Target_Domain of
    0 : begin
          //Create Air To Surface Missile
          projectil := TT3Missile_AS.Create;
          projectil.Converter := Converter;
          TT3Missile_AS(projectil).SetMovement(FiringMode);

          DefaultAltitude := TT3PlatformInstance(Parent).Altitude * C_Meter_To_Feet;

          case FiringMode of
            mfmAimpoint :
            begin
              TT3Aimpoint_Missile(TT3Missile_AA(projectil).MissileMovement).PositionX := Aimpoint_Movement.PositionX;
              TT3Aimpoint_Missile(TT3Missile_AA(projectil).MissileMovement).PositionY := Aimpoint_Movement.PositionY;
            end;
            mfmBearing :
            begin
              projectil.SeekerOn := True;
              TT3BearingOnly_Missile(TT3Missile_AA(projectil).MissileMovement).BearingLaunch := Bearing_Movement.BearingLaunch;
            end;
          end;
        end;
    1 : begin
          //Create Surface To Surface Missile
          projectil := TT3Missile_SS.Create;
          projectil.Converter := Converter;
          TT3Missile_SS(projectil).SetMovement(FFiringMode);

          case FFiringMode of
            mfmRBL :
            begin

            end;
            mfmRBLW :
            begin
              if RBLW_PointList.Count > 0 then
              begin
                for i := 0 to RBLW_PointList.Count - 1 do
                begin
                  PointRBLW := TPointVehicleMissileRBLW(RBLW_PointList[i]);

                  if FLauncerNumber = PointRBLW.LauncherIndex then
                  begin
                    behav := TScripted_Behav_Definition.Create;
                    with behav.FData do
                    begin
                      Scripted_Event_Index  := PointRBLW.IndexPoint;
                      Waypoint_Latitude     := PointRBLW.PointRBLW_X1;
                      Waypoint_Longitude    := PointRBLW.PointRBLW_Y1;
                    end;

                    projectil.WeaponWaypoint.Add(behav, nil);
                  end;
                end;
              end;

              projectil.DistanceToTarget := CalculateDistanceRBLW(FLauncerNumber);

              projectil.WeaponWaypoint.ApplyWeaponWaypoint;
              projectil.WeaponWaypoint.Owner := projectil;
              projectil.isRBLW := True;
            end;
            mfmBOL :
            begin
              projectil.isBOL := True;
              BOL_MissileMovement := TT3BOL_Missile(TT3Missile_SS(projectil).MissileMovement);
              BOL_MissileMovement.BOL_Point1_X      := BOL_Movement.BOL_Point1_X;
              BOL_MissileMovement.BOL_Point1_Y      := BOL_Movement.BOL_Point1_Y;
              BOL_MissileMovement.BOL_Point2_X      := BOL_Movement.BOL_Point2_X;
              BOL_MissileMovement.BOL_Point2_Y      := BOL_Movement.BOL_Point2_Y;
              BOL_MissileMovement.BOL_Point3_X      := BOL_Movement.BOL_Point3_X;
              BOL_MissileMovement.BOL_Point3_Y      := BOL_Movement.BOL_Point3_Y;
              BOL_MissileMovement.BOL_Point4_X      := BOL_Movement.BOL_Point4_X;
              BOL_MissileMovement.BOL_Point4_Y      := BOL_Movement.BOL_Point4_Y;
              BOL_MissileMovement.End_PointBOl_X    := BOL_Movement.End_PointBOl_X;
              BOL_MissileMovement.End_PointBOl_Y    := BOL_Movement.End_PointBOl_Y;
              BOL_MissileMovement.Start_PointBOl_X  := BOL_Movement.Start_PointBOl_X;
              BOL_MissileMovement.Start_PointBOl_Y  := BOL_Movement.Start_PointBOl_Y;
            end;
            mfmBOLW :
            begin
              if BOLW_PointList.Count > 0 then
              begin
                for i := 0 to BOLW_PointList.Count - 1 do
                begin
                  PointBOLW := TPointVehicleMissileBOLW(BOLW_PointList[i]);

                  if PointBOLW.LauncherIndex = FLauncerNumber then
                  begin
                    behav := TScripted_Behav_Definition.Create;
                    with behav.FData do
                    begin
                      Scripted_Event_Index  := PointBOLW.IndexPoint;
                      Waypoint_Latitude     := PointBOLW.PointBOLW_X1;
                      Waypoint_Longitude    := PointBOLW.PointBOLW_Y1;
                    end;

                    projectil.WeaponWaypoint.Add(behav, nil);
                  end;
                end;
              end;

              projectil.WeaponWaypoint.ApplyWeaponWaypoint;
              projectil.WeaponWaypoint.Owner := projectil;
              projectil.isBOLW := True;

              BOL_MissileMovement := TT3BOL_Missile(TT3Missile_SS(projectil).MissileMovement);
              BOL_MissileMovement.BOL_Point1_X      := BOL_Movement.BOL_Point1_X;
              BOL_MissileMovement.BOL_Point1_Y      := BOL_Movement.BOL_Point1_Y;
              BOL_MissileMovement.BOL_Point2_X      := BOL_Movement.BOL_Point2_X;
              BOL_MissileMovement.BOL_Point2_Y      := BOL_Movement.BOL_Point2_Y;
              BOL_MissileMovement.BOL_Point3_X      := BOL_Movement.BOL_Point3_X;
              BOL_MissileMovement.BOL_Point3_Y      := BOL_Movement.BOL_Point3_Y;
              BOL_MissileMovement.BOL_Point4_X      := BOL_Movement.BOL_Point4_X;
              BOL_MissileMovement.BOL_Point4_Y      := BOL_Movement.BOL_Point4_Y;
              BOL_MissileMovement.End_PointBOl_X    := BOL_Movement.End_PointBOl_X;
              BOL_MissileMovement.End_PointBOl_Y    := BOL_Movement.End_PointBOl_Y;
              BOL_MissileMovement.Start_PointBOl_X  := BOL_Movement.Start_PointBOl_X;
              BOL_MissileMovement.Start_PointBOl_Y  := BOL_Movement.Start_PointBOl_Y;
            end;
          end;
        end;
    2 : begin
          //Create Surface To Air Missile
          projectil := TT3Missile_SA.Create;
          projectil.Converter := Converter;

        end;
    3 : begin
          //Create Air To Air Missile
          projectil := TT3Missile_AA.Create;
          projectil.Converter := Converter;
          TT3Missile_AA(projectil).SetMovement(FiringMode);

          DefaultAltitude := TT3PlatformInstance(Parent).Altitude * C_Meter_To_Feet;

          case FiringMode of
            mfmAimpoint :
            begin
              TT3Aimpoint_Missile(TT3Missile_AA(projectil).MissileMovement).PositionX := Aimpoint_Movement.PositionX;
              TT3Aimpoint_Missile(TT3Missile_AA(projectil).MissileMovement).PositionY := Aimpoint_Movement.PositionY;
            end;
            mfmBearing :
            begin
              projectil.SeekerOn := True;
              TT3BearingOnly_Missile(TT3Missile_AA(projectil).MissileMovement).BearingLaunch := Bearing_Movement.BearingLaunch;
            end;
          end;
        end;
    4 : begin
          //Create Land Attack Missile
          projectil := TT3Missile_LA.Create;
          projectil.Converter := Converter;
          TT3Missile_LA(projectil).SetMovement(FFiringMode);

          DefaultAltitude := TT3PlatformInstance(Parent).Altitude * C_Meter_To_Feet;

          case FiringMode of
            mfmAimpoint :
            begin
              TT3Aimpoint_Missile(TT3Missile_AA(projectil).MissileMovement).PositionX := Aimpoint_Movement.PositionX;
              TT3Aimpoint_Missile(TT3Missile_AA(projectil).MissileMovement).PositionY := Aimpoint_Movement.PositionY;
            end;
            mfmBearing :
            begin
              projectil.SeekerOn := True;
              TT3BearingOnly_Missile(TT3Missile_AA(projectil).MissileMovement).BearingLaunch := Bearing_Movement.BearingLaunch;
            end;
          end;
        end;
  end;

  projectil.Parent          := FParent;
  projectil.Owner           := FParent;
  motion := TMotion_Characteristics.Create;
  UnitMotion.Clone(motion);
  projectil.UnitMotion      := motion;
  projectil.UnitDefinition  := UnitDefinition;
  projectil.Definition      := TMissile_On_Board(UnitDefinition).FDef;
  projectil.TargetObject    := TargetObject;

  Static3DPos.X         := FParent.getPositionX;
  Static3DPos.Y         := FParent.getPositionY;
  Static3DPos.Z         := FParent.getPositionZ;
  projectil.LastPosition := Static3DPos;

  if Assigned(TargetObject) then
  begin
    Static3DPos.X         := TargetObject.getPositionX;
    Static3DPos.Y         := TargetObject.getPositionY;
    Static3DPos.Z         := TargetObject.getPositionZ;
  end
  else
  begin
    Static3DPos.X         := Aimpoint_Movement.PositionX;
    Static3DPos.Y         := Aimpoint_Movement.PositionY;
    Static3DPos.Z         := 0;//posisi z diset default ke posisi nol
  end;

  projectil.StaticTargetPos := Static3DPos;

  HAFOBearing := CalcBearing(PosX,PosY,Static3DPos.X,Static3DPos.Y);
  RangeBearingToCoord(HitMode.HAFO, HAFOBearing, mX, mY);

  HAFOPos.X := TT3Vehicle(Parent).getPositionX + mX;
  HAFOPos.Y := TT3Vehicle(Parent).getPositionY + mY;
  projectil.HAFOPosition    := HAFOPos;

  projectil.UnitGroup       := UnitGroup;
  projectil.Enable          := Enable;
  projectil.WeaponCategory  := WeaponCategory;
  projectil.FiringMode      := FFiringMode;
  projectil.LaunchDelay     := FLaunchDelay;
  projectil.Track_ID        := 'MIS';
  projectil.Force_Designation   := TT3PlatformInstance(FParent).Force_Designation;
  projectil.PlatformType        := vhtMissile;

  projectil.ShipIndex := TT3PlatformInstance(FParent).InstanceIndex;
  projectil.ShipName  := TT3PlatformInstance(FParent).InstanceName;

  projectil.LauncherIndex := MissileDefinition.FData.Fitted_Weap_Index;

  if Assigned(TargetObject) then
  begin
    projectil.TargetIndex       := TT3PlatformInstance(TargetObject).InstanceIndex;
    projectil.TargetName        := TT3PlatformInstance(TargetObject).InstanceName;
    projectil.TargetTrackCourse := TT3PlatformInstance(TargetObject).Course;
    projectil.TargetTrackSpeed  := TT3PlatformInstance(TargetObject).Speed;
    projectil.TargetTrackAlt    := TT3PlatformInstance(TargetObject).Altitude;

    if TT3PlatformInstance(TargetObject).PlatformDomain = 0 then
      projectil.isAirLaunch := True
    else
      projectil.isAirLaunch := False;
  end;

  projectil.isInstructor    := TT3PlatformInstance(FParent).isInstructor;
  projectil.isWasdal        := TT3PlatformInstance(FParent).isWasdal;
  projectil.Initialize;

  projectil.FTurnOnSeekRange := SeekerRangeTurn;
  projectil.FDefaultAltitude := DefaultAltitude;

  projectil.LauncherNumber := FLauncerNumber;
  projectil.Engagement     := FEngagement;
  projectil.HAFO := HitMode.HAFO;

  InitAfterLaunch;

  result := projectil;
end;

procedure TT3MissilesOnVehicle.CreateRBLWPoint(mX, mY: Double);
var
  RBLWPointX, RBLWPointY : Double;
  tRBLWPointX, tRBLWPointY : integer;
begin
  FTacticalSymbol := TTacticalSymbol.Create;

  RBLWPointX := mX;
  RBLWPointY := mY;

  Converter.ConvertToScreen(RBLWPointX, RBLWPointY, tRBLWPointX, tRBLWPointY);
  FTacticalSymbol.ConvertCoord(Converter);
//  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + pctWayPoint + '.bmp',clRed);
//  FTacticalSymbol.Symbol.Center := Point(tRBLWPointX, tRBLWPointY);
  FTacticalSymbol.CallSign1 := '+RBLW-1';
  FTacticalSymbol.SetTextCenter(Point(tRBLWPointX, tRBLWPointY));
  FTacticalSymbol.Color := clRed;
  //FTacticalSymbol.Draw(aCnv);
end;

procedure TT3MissilesOnVehicle.SetSelected(const Value: boolean);
var
  str : string;
begin
  str := FTacticalSymbol.CallSign1;

  FTacticalSymbol.Selected := Value;
  FTacticalSymbol.Color := FTacticalSymbol.Color; //mk
//  FTacticalSymbol.Symbol.Visible := true;
//  FTacticalSymbol.Symbol.Color := FTacticalSymbol.Color; //mk
end;

function TT3MissilesOnVehicle.CalcDistanceTwoCoord(x1, x2, y1, y2 : Double):Double;
var
  CoordX1, CoordY1, CoordX2, CoordY2 : Double;
  Distance : Double;

  DifCoorX, DifCoorY : Double;
begin
  CoordX1 := x1;
  CoordX2 := x2;
  CoordY1 := y1;
  CoordY2 := y2;

  DifCoorX := Abs(CoordX2 - CoordX1);
  DifCoorY := Abs(CoordY2 - CoordY1);

  Distance := Sqrt(Abs((DifCoorX * DifCoorX) + (DifCoorY * DifCoorY)));

  Result := Distance;
end;

function TT3MissilesOnVehicle.CalculateDistanceRBLW(
  aLauncherID: integer): Double;
var
  i : integer;
  RBLWPoint      : TPointVehicleMissileRBLW;

  isRBLW : Boolean;
  idRBLW, idRBLW2 : integer;

  Dist : Double;
  TempX, TempY : Double;
begin
  isRBLW  := False;
  idRBLW  := -1;
  idRBLW2 := -1;
  Dist    := 0;
  TempX   := 0;
  TempY   := 0;

  if RBLW_PointList.Count > 0 then
  begin
    for i := 0 to RBLW_PointList.Count - 1 do
    begin
      RBLWPoint := TPointVehicleMissileRBLW(RBLW_PointList[i]);

      if RBLWPoint.LauncherIndex = aLauncherID then
      begin
         Dist := Dist + CalcDistanceTwoCoord(getPositionX, RBLWPoint.PointRBLW_X1, getPositionY, RBLWPoint.PointRBLW_Y1);
         TempX := RBLWPoint.PointRBLW_X1;
         TempY := RBLWPoint.PointRBLW_Y1;

         idRBLW := i;
         isRBLW := True;
         break;
      end;
    end;

    if idRBLW <> -1 then
    begin
      for i := idRBLW + 1 to RBLW_PointList.Count - 1 do
      begin
        RBLWPoint := TPointVehicleMissileRBLW(RBLW_PointList[i]);

        if RBLWPoint.LauncherIndex = aLauncherID then
        begin
          Dist := Dist + CalcDistanceTwoCoord(TempX, RBLWPoint.PointRBLW_X1,
                  TempY, RBLWPoint.PointRBLW_Y1);

          TempX := RBLWPoint.PointRBLW_X1;
          TempY := RBLWPoint.PointRBLW_Y1;

          idRBLW2 := i;
          Break;
        end;
      end;
    end;

    if idRBLW2 <> -1 then
    begin
      for i := idRBLW2 + 1 to RBLW_PointList.Count  - 1 do
      begin
        RBLWPoint := TPointVehicleMissileRBLW(RBLW_PointList[i]);

        if RBLWPoint.LauncherIndex = aLauncherID then
        begin
          Dist := Dist + CalcDistanceTwoCoord(TempX, RBLWPoint.PointRBLW_X1,
                  TempY, RBLWPoint.PointRBLW_Y1);

          TempX := RBLWPoint.PointRBLW_X1;
          TempY := RBLWPoint.PointRBLW_Y1;

          break;
        end;
      end;
    end;
  end;

  if isRBLW then
    Dist := Dist + CalcDistanceTwoCoord(TempX, TT3PlatformInstance(TargetObject).getPositionX,
            TempY,  TT3PlatformInstance(TargetObject).getPositionY);

  Result := Dist * 60;

  if RBLW_PointList.Count = 0 then
  begin
    Dist := Dist + CalcRange(TT3PlatformInstance(FParent).PosX, TT3PlatformInstance(FParent).PosY,
            TT3PlatformInstance(TargetObject).PosX, TT3PlatformInstance(TargetObject).PosY);

    Result := Dist;
  end;
end;

function TT3MissilesOnVehicle.CheckQuadran(X1, X2, Y1, Y2: Double): Byte;
var
  ConstMZero : Double;
begin
  Result      := 0;
  ConstMZero  := -0.001;

  if (X2 <> X1) and (Y2 <> Y1) then
  begin
    Result :=  CheckQuadran((X2 - X1), ((Y2 - Y1)));
  end
  else
  if (X2 = X1) then
  begin
    Result :=  CheckQuadran(ConstMZero, ((Y2 - Y1)))
  end
  else
  if (Y2 = Y1) then
  begin
    Result := CheckQuadran((X2 - X1), ConstMZero)
  end;
end;

function TT3MissilesOnVehicle.CheckQuadran(aX, aY: Double): Byte;
begin
  Result:= 1;
  if (aX<0) and (aY>0) then
    Result:= 2
  else if (aX<0) and (aY<0) then
    Result:= 3
  else if (aX>0) and (aY<0) then
    Result:= 4
end;

procedure TT3MissilesOnVehicle.DrawBOLW_Missile(aCnv: TCanvas; x1, y1, x2,
  y2: Double; aDegree: Integer; aLengthMissile: Double; aMode: Integer;
  aBearing: Double);
var
  bearing : Double;
  point1, point2, point3, point4, pointStart, pointEnd : t2DPoint;
  shipPos, targetPos, endPos, BOLWPos : TPoint;
  aPolygon : array[0..3] of TPoint;
  i, j : Integer;
  pointBOLW : TPointVehicleMissileBOLW;
begin
  for i := 1 to 8 do
  begin
    pointBOLW := GetBOLWPointMaxIndex(i);

    if not Assigned(pointBOLW) then
      Continue;

    case aMode of
      1: bearing := CalcBearing(pointBOLW.PointBOLW_X1, pointBOLW.PointBOLW_Y1,
        x2, y2);
      2: bearing := aBearing;
    else
      bearing := 0;
    end;

    CalcBOLRangeDestruck(bearing, FSeekerRangeTurn, pointBOLW.PointBOLW_X1,
      pointBOLW.PointBOLW_Y1, aLengthMissile, 0, 4, pointBOLW.PointBOLW_X1,
      pointBOLW.PointBOLW_Y1, Point1, Point2, Point3, Point4, PointEnd,
      PointStart);

    Converter.ConvertToScreen(x1, y1, shipPos.X, shipPos.Y);
    Converter.ConvertToScreen(x2, y2, targetPos.X, targetPos.Y);
    Converter.ConvertToScreen(point1.X, point1.Y, aPolygon[0].X, aPolygon[0].Y);
    Converter.ConvertToScreen(point2.X, point2.Y, aPolygon[1].X, aPolygon[1].Y);
    Converter.ConvertToScreen(point3.X, point3.Y, aPolygon[2].X, aPolygon[2].Y);
    Converter.ConvertToScreen(point4.X, point4.Y, aPolygon[3].X, aPolygon[3].Y);
    Converter.ConvertToScreen(pointEnd.X, pointEnd.Y, endPos.X, endPos.Y);

    with aCnv do
    begin
      Pen.Color := clSilver;
      Pen.Style := psSolid;
      Pen.Width := 1;

      MoveTo(shipPos.X, shipPos.Y);

      for j := 0 to BOLW_PointList.Count - 1 do
      begin
        pointBOLW := BOLW_PointList.Items[j];

        if pointBOLW.LauncherIndex = i then
        begin
          Converter.ConvertToScreen(pointBOLW.PointBOLW_X1, pointBOLW.PointBOLW_Y1,
            BOLWPos.X, BOLWPos.Y);
          LineTo(BOLWPos.X, BOLWPos.Y);
          MoveTo(BOLWPos.X, BOLWPos.Y);
        end;
      end;

      LineTo(targetPos.X, targetPos.Y);
      MoveTo(targetPos.X, targetPos.Y);
      LineTo(endPos.X, endPos.Y);

      Polygon(aPolygon);  //           /P1 ------------------------ P2
                          //          /   |                           |
                          // OWN SHIP ----|      BOL DESTRUCTION      |
                          //          \   |                           |
                          //           \P4 ------------------------ P3
    end;
  end;
end;

procedure TT3MissilesOnVehicle.DrawBOL_Missile(aCnv: tCanvas; x1, y1, x2,
  y2: Double; aDegree: integer; aLengthMissile: Double; Mode : integer; tBearingNRP : double);
var
  CoorShipX, CoorShipY : Double;
  CoorBearingX, CoorBearingY : Double;

  tCoorShipX, tCoorShipY : Integer;
  tCoorBearingX, tCoorBearingY : Integer;

  PointBOL1, PointBOL2, PointBOL3, PointBOL4, PointEndBOL, PointStartBOL : t2DPoint;              //4 Point BOL
  tPointBOL1_X, tPointBOL1_Y, tPointBOL2_X, tPointBOL2_Y : Integer;   //Convert to Map
  tPointBOL3_X, tPointBOL3_Y, tPointBOL4_X, tPointBOL4_Y : Integer;
  tPointEndBOL_X, tPointEndBOL_Y : Integer;
  Bearing : Double;

  SeekerRangeOn : Double;
  pol : array[0..3] of TPoint;
begin
  CoorShipX := x2;
  CoorShipY := y2;
  CoorBearingX := x1;
  CoorBearingY := y1;

  case mode of
    1 : Bearing := CalcBearing(CoorShipX, CoorShipY, CoorBearingX, CoorBearingY );
    2 : Bearing := tBearingNRP;
  else
    Bearing := 0;
  end;

  //Bearing := CalcBearing(CoorShipX, CoorShipY, CoorBearingX, CoorBearingY );
  //SeekerRangeOn := FMissileDefinition.FDef.Seeker_TurnOn_Range;

  SeekerRangeOn := SeekerRangeTurn;
  CalcBOLRangeDestruck(Bearing , SeekerRangeOn, CoorShipX, CoorShipY,
    aLengthMissile, 0, 4, CoorShipX, CoorShipY,
    PointBOL1, PointBOL2, PointBOL3, PointBOL4, PointEndBOL, PointStartBOL);

  //4 Point BOL
  Converter.ConvertToScreen(PointBOL1.X, PointBOL1.Y, pol[0].X, pol[0].Y);
  Converter.ConvertToScreen(PointBOL2.X, PointBOL2.Y, pol[1].X, pol[1].Y);
  Converter.ConvertToScreen(PointBOL3.X, PointBOL3.Y, pol[2].X, pol[2].Y);
  Converter.ConvertToScreen(PointBOL4.X, PointBOL4.Y, pol[3].X, pol[3].Y);

  Converter.ConvertToScreen(PointEndBOL.X, PointEndBOL.Y, tPointEndBOL_X, tPointEndBOL_Y);

  //Ship n Bearing Target
  Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
  Converter.ConvertToScreen(CoorBearingX, CoorBearingY, tCoorBearingX, tCoorBearingY);

  aCnv.Font.Color := clRed;
  aCnv.Font.Size := 12;
  aCnv.TextOut(pol[0].X,pol[0].Y, 'P1');
  aCnv.TextOut(pol[1].X,pol[1].Y, 'P2');
  aCnv.TextOut(pol[2].X,pol[2].Y, 'P3');
  aCnv.TextOut(pol[3].X,pol[3].Y, 'P4');

  with aCnv do
  begin
    Pen.Color := clSilver;
    Pen.Style := psSolid;
    Pen.Width := 1;

    Polygon(pol);
    //           /P1 ------------------------ P2
    //          /   |                           |
    // OWN SHIP ----|      BOL DESTRUCTION      |
    //          \   |                           |
    //           \P4 ------------------------ P3

    MoveTo(tCoorShipX, tCoorShipY);
    LineTo(tPointEndBOL_X, tPointEndBOL_Y);
  end;
end;

procedure TT3MissilesOnVehicle.DrawLineInRBLW(aCnv: TCanvas; X1, Y1, X2,
  Y2: Double);
var
  i,j : Integer;
  tX1, tX2, tY1, tY2 : Integer;
  OldRBLW_X, OldRBLW_Y, NewRBLW_X, NewRBLW_Y : Integer;
  RBLWPoint : TPointVehicleMissileRBLW;
  isFoundRBLW : Boolean;
  TempWaypointX, TempWaypointY, lastWaypointX, lastWaypointY : Double;
  NewRange, OldRange : Double;
begin
  with aCnv do
  begin
    Pen.Color := clSilver;
    Pen.Style := psSolid;
    Pen.Width := 1;

    for i := 1 to 8 do
    begin
      isFoundRBLW := False;
      NewRange := 0;
      OldRange := 0;
      TempWaypointX := 0;
      TempWaypointY := 0;

      Converter.ConvertToScreen(x1, y1, tX1, tY1);
      Converter.ConvertToScreen(x2, y2, tX2, tY2);

      if RBLW_PointList.Count > 0 then
      begin
        for j := 0 to RBLW_PointList.Count - 1 do
        begin
          RBLWPoint := TPointVehicleMissileRBLW(RBLW_PointList.Items[j]);

          if i = RBLWPoint.LauncherIndex then
          begin
            isFoundRBLW := True;
            TempWaypointX := RBLWPoint.PointRBLW_X1;
            TempWaypointY := RBLWPoint.PointRBLW_Y1;
            OldRange := NewRange;

            if RBLWPoint.IndexPoint = 1 then
            begin
              OldRBLW_X := tX2;
              OldRBLW_Y := tY2;
              Converter.ConvertToScreen(RBLWPoint.PointRBLW_X1,RBLWPoint.PointRBLW_Y1,NewRBLW_X,NewRBLW_Y);
              NewRange := OldRange + CalcRange(X2,Y2,RBLWPoint.PointRBLW_X1,RBLWPoint.PointRBLW_Y1);
            end
            else
            begin
              OldRBLW_X := NewRBLW_X;
              OldRBLW_Y := NewRBLW_Y;
              Converter.ConvertToScreen(RBLWPoint.PointRBLW_X1,RBLWPoint.PointRBLW_Y1,NewRBLW_X,NewRBLW_Y);

              Converter.ConvertToMap(OldRBLW_X,OldRBLW_Y,lastWaypointX,lastWaypointY);
              NewRange := OldRange + CalcRange(lastWaypointX,lastWaypointY,RBLWPoint.PointRBLW_X1,RBLWPoint.PointRBLW_Y1);
            end;

            aCnv.MoveTo(OldRBLW_X,OldRBLW_Y);
            aCnv.LineTo(NewRBLW_X,NewRBLW_Y);
          end;
        end;

        if isFoundRBLW then
        begin
          NewRange := OldRange + CalcRange(TempWaypointX,TempWaypointY,X1,Y1);
          DrawRBLWIntercept(aCnv, RangeRBLCircle,NewRange,TempWaypointX,TempWaypointY);
        end;
      end;
    end;
  end;
end;

procedure TT3MissilesOnVehicle.DrawRBL_Missile(aCnv: tCanvas; aRadius,
  aRing: Double ; x1, y1, x2, y2 : Double);
var
  i,j,r : Integer;
  Radius, Ring, rDegree: double;
  Rects : TRect;

  rX, rY : Integer;

  Vehicle, VehicleDetTrack : TObject;
  isDetect : Boolean;

  CoorShipX, CoorShipY : Double;
  tCoorShipX, tCoorShipY : integer;

  CoorX1, CoorY1, CoorX2, CoorY2, CoorX3, CoorY3 : Double;
  tCoorX1, tCoorY1, tCoorX2, tCoorY2, tCoorX3, tCoorY3 : Integer;

  ConstMZero : Double;

  aGradienM1, aGradienM2 : Double;

  BetaDegree, BetaDegree2 : Double;
  ax, ay : Double;

  pt : TPoint;
  dx, dy : Double;

  grp : T3CubicleGroup;
  gm : T3CubicleGroupMember;

  d : Integer;
begin
  ConstMZero := -0.001;
  aGradienM1 := 0;

  //TargetShip Coordinat
  CoorX1 := x1;
  CoorY1 := y1;

  //OwnShip Coordinat
  CoorX2 := x2;
  CoorY2 := y2;

  if (CoorX2 <> CoorX1) and (CoorY2 <> CoorY1) then
  begin
    aGradienM1 := ((CoorY2 - CoorY1)) / (CoorX2 - CoorX1);
  end
  else
  if (CoorX2 = CoorX1) then
  begin
    aGradienM1 := ((CoorY2 - CoorY1)) / ConstMZero;
  end
  else
  if (CoorY2 = CoorY1) then
  begin
    aGradienM1 := ConstMZero / (CoorX2 - CoorX1);
  end;

  aGradienM2 := -1*(1/aGradienM1);       // M1 n M2 saling Tegak Lurus
  BetaDegree := ArcTan(aGradienM2);

  BetaDegree2 := ArcTan(aGradienM1);
  ax:= Abs((1/60) * Cos(BetaDegree2));
  ay:= Abs((1/60) * Sin(BetaDegree2));

  //Checking Quadran
  case CheckQuadran(CoorX1, CoorX2, CoorY1, CoorY2) of
    2 : begin
          ax:= -1*ax;        // (Quadran 2) Cos Negatif
        end;
    3 : begin
          ax:= -1*ax;        // (Quadran 3) Sin Negatif, Cos Negatif
          ay:= -1*ay;
        end;
    4 : begin
          ay:= -1*ay         // (Quadran 4) Sin Negatif
        end;
  end;

  CoorX3 := CoorX1 - ax;
  CoorY3 := CoorY1 - ay;

  Radius := aRadius;
  Ring   := aRing;

  if isControllerPlat then
  begin
    if not Assigned(VehiclePlatform) then Exit;
    for i := 0 to VehiclePlatform.itemCount - 1 do
    begin
      Vehicle := TT3PlatformInstance(VehiclePlatform.getObject(i));
      if Vehicle is TT3Vehicle then
      begin
        CoorShipX   := TT3PlatformInstance(Vehicle).getPositionX;
        CoorShipY   := TT3PlatformInstance(Vehicle).getPositionY;

        if CalcDistanceTwoCoord(CoorX1, CoorX2, CoorY1, CoorY2)*60 < WeaponRange then
        //if CalcDistanceTwoCoord(CoorX1, CoorShipX, CoorY1, CoorShipY)*60 < WeaponRange then
        begin

          //==========================Step 1========================================
          //draw all circle
          if ((CalcDistanceTwoCoord(TT3PlatformInstance(TargetObject).getPositionX, TT3PlatformInstance(Vehicle).getPositionX,
          TT3PlatformInstance(TargetObject).getPositionY, TT3PlatformInstance(Vehicle).getPositionY)*60 < Radius) and (not TT3PlatformInstance(Vehicle).Dormant))
          then
          begin
            rDegree := Ring/60;
            dx := CoorShipX + rDegree;
            dy := CoorShipY;

            Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
            Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

            with aCnv do
            begin
              r := Abs(pt.X - tCoorShipX);

              Pen.Color := clSilver;
              Pen.Style := psSolid;
              Pen.Width := 1;
              Brush.Style := bsClear;

              Rects.Top     := tCoorShipY - r;
              Rects.Left    := tCoorShipX - r;
              Rects.Bottom  := tCoorShipY + r;
              Rects.Right   := tCoorShipX + r;

              Ellipse(Rects);
            end;
          end;

          //=======================Step 2============================================
          //draw small circle in target ship
          rDegree := 1/60;
          dx := CoorX3 + rDegree;
          dy := CoorY3;

          Converter.ConvertToScreen(CoorX3, CoorY3, tCoorX3, tCoorY3);
          Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

          with aCnv do
          begin
            r := Abs(pt.X - tCoorX3);

            Pen.Color := clSilver;
            Pen.Style := psSolid;
            Pen.Width := 1;
            Brush.Style := bsClear;

            Rects.Top     := tCoorY3 - r;
            Rects.Left    := tCoorX3 - r;
            Rects.Bottom  := tCoorY3 + r;
            Rects.Right   := tCoorX3 + r;

            Ellipse(Rects);
          end;

          //=======================Step 3==================================================
          //this circle will be shring if missile is approaching
          if (CalcDistanceTwoCoord(TT3PlatformInstance(TargetObject).getPositionX, getPositionX,
          TT3PlatformInstance(TargetObject).getPositionY, getPositionY)*60 > Radius) then
          begin
            rDegree := 0.9*Ring/60;
            dx := CoorX1 + rDegree;
            dy := CoorY1;

            Converter.ConvertToScreen(CoorX1, CoorY1, tCoorX1, tCoorY1);
            Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

            with aCnv do
            begin
              r := Abs(pt.X - tCoorX1);

              Pen.Color := clSilver;
              Pen.Style := psSolid;
              Pen.Width := 1;
              Brush.Style := bsClear;

              Rects.Top     := tCoorY1 - r;
              Rects.Left    := tCoorX1 - r;
              Rects.Bottom  := tCoorY1 + r;
              Rects.Right   := tCoorX1 + r;

              Ellipse(Rects);
            end;
          end;
        end;
      end;
    end;
  end
  else
  begin
    //==========================Step 1========================================
    //draw Circle in Own Ship
    if (CalcDistanceTwoCoord(TT3PlatformInstance(TargetObject).getPositionX, TT3PlatformInstance(Parent).getPositionX,
       TT3PlatformInstance(TargetObject).getPositionY, TT3PlatformInstance(Parent).getPositionY)*60 < Radius) then
    begin
      rDegree := Ring/60;
      dx := CoorX2 + rDegree;
      dy := CoorY2;

      Converter.ConvertToScreen(CoorX2, CoorY2, tCoorX2, tCoorY2);
      Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

      with aCnv do
      begin
        r := Abs(pt.X - tCoorX2);

        Pen.Color := clSilver;
        Pen.Style := psSolid;
        Pen.Width := 1;
        Brush.Style := bsClear;

        Rects.Top     := tCoorY2 - r;
        Rects.Left    := tCoorX2 - r;
        Rects.Bottom  := tCoorY2 + r;
        Rects.Right   := tCoorX2 + r;

        Ellipse(Rects);
      end;
    end;

    //==========================Step 2=========================================
    //draw 3 Circle in Target Ship

    //draw circle 1
    rDegree := Ring/60;
    dx := CoorX1 + rDegree;
    dy := CoorY1;

    Converter.ConvertToScreen(CoorX1, CoorY1, tCoorX1, tCoorY1);
    Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

    with aCnv do
    begin
      r := Abs(pt.X - tCoorX1);

      Pen.Color := clSilver;
      Pen.Style := psSolid;
      Pen.Width := 1;
      Brush.Style:= bsClear;

      Rects.Top     := tCoorY1 - r;
      Rects.Left    := tCoorX1 - r;
      Rects.Bottom  := tCoorY1 + r;
      Rects.Right   := tCoorX1 + r;

      Ellipse(Rects);
    end;

    //Draw small circle
    rDegree := 1/60;
    dx := CoorX3 + rDegree;
    dy := CoorY3;

    Converter.ConvertToScreen(CoorX3, CoorY3, tCoorX3, tCoorY3);
    Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

    with aCnv do
    begin
      r := Abs(pt.X - tCoorX3);

      Pen.Color := clSilver;
      Pen.Style := psSolid;
      Pen.Width := 1;
      Brush.Style:= bsClear;

      Rects.Top     := tCoorY3 - r;
      Rects.Left    := tCoorX3 - r;
      Rects.Bottom  := tCoorY3 + r;
      Rects.Right   := tCoorX3 + r;

      Ellipse(Rects);
    end;

    //this circle will be shring if missile is approaching
    if (CalcDistanceTwoCoord(TT3PlatformInstance(TargetObject).getPositionX, getPositionX,
    TT3PlatformInstance(TargetObject).getPositionY, getPositionY)*60 > Radius) then
    begin
      rDegree := 0.9*Ring/60;
      dx := CoorX1 + rDegree;
      dy := CoorY1;

      Converter.ConvertToScreen(CoorX1, CoorY1, tCoorX1, tCoorY1);
      Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

      with aCnv do
      begin
        r := Abs(pt.X - tCoorX1);

        Pen.Color := clSilver;
        Pen.Style := psSolid;
        Pen.Width := 1;
        Brush.Style:= bsClear;

        Rects.Top     := tCoorY1 - r;
        Rects.Left    := tCoorX1 - r;
        Rects.Bottom  := tCoorY1 + r;
        Rects.Right   := tCoorX1 + r;

        Ellipse(Rects);
      end;
    end;

    //==========================Step 3========================================
    //Draw Circle in Other Ship if Other Ship n Target Ship , Range < 25 NM

    //Check Detected Track and Draw all Circle in detectec track
    if not Assigned(VehicleDetect) then Exit;
    for i := 0 to VehicleDetect.itemCount - 1 do
    begin
      Vehicle := TT3DetectedTrack(VehicleDetect.getObject(i));
      if Vehicle is TT3DetectedTrack then
      begin
        CoorShipX   := TT3DetectedTrack(Vehicle).getPositionX;
        CoorShipY   := TT3DetectedTrack(Vehicle).getPositionY;

        if (CalcDistanceTwoCoord(TT3PlatformInstance(TargetObject).getPositionX, TT3DetectedTrack(Vehicle).getPositionX,
        TT3PlatformInstance(TargetObject).getPositionY, TT3DetectedTrack(Vehicle).getPositionY)*60 < Radius) and (not TT3DetectedTrack(Vehicle).Dormant)
        then
        begin
          rDegree := Ring/60;
          dx := CoorShipX + rDegree;
          dy := CoorShipY;

          Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
          Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

          with aCnv do
          begin
            r := Abs(pt.X - tCoorShipX);

            Pen.Color := clSilver;
            Pen.Style := psSolid;
            Pen.Width := 1;
            Brush.Style:= bsClear;

            Rects.Top     := tCoorShipY - r;
            Rects.Left    := tCoorShipX - r;
            Rects.Bottom  := tCoorShipY + r;
            Rects.Right   := tCoorShipX + r;

            Ellipse(Rects);
          end;
        end;
      end;
    end;

    //Check Ship 1 group Track and Draw all Circle in Ship 1 group Track
    if not Assigned(VehiclePlatform) then Exit;
    for i := 0 to VehiclePlatform.itemCount - 1 do
    begin
      Vehicle := TObject(VehiclePlatform.getObject(i));

      for j := 0 to VehicleOnGroup.Count - 1 do
      begin
        gm := VehicleOnGroup.Items[j] as T3CubicleGroupMember;

        if gm <> nil then
        begin
          if TT3PlatformInstance(Vehicle).InstanceIndex = gm.FData.Platform_Instance_Index then
          begin
            if Vehicle is TT3Vehicle then
            begin
              if CalcDistanceTwoCoord(CoorX1, CoorX2, CoorY1, CoorY2)*60 < WeaponRange then
              begin
                CoorShipX   := TT3PlatformInstance(Vehicle).getPositionX;
                CoorShipY   := TT3PlatformInstance(Vehicle).getPositionY;

                //==========================Step 1========================================
                //draw all circle
                if ((CalcDistanceTwoCoord(TT3PlatformInstance(TargetObject).getPositionX, TT3PlatformInstance(Vehicle).getPositionX,
                TT3PlatformInstance(TargetObject).getPositionY, TT3PlatformInstance(Vehicle).getPositionY)*60 < Radius) and (not TT3PlatformInstance(Vehicle).Dormant))
                then
                begin
                  rDegree := Ring/60;
                  dx := CoorShipX + rDegree;
                  dy := CoorShipY;

                  Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
                  Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

                  with aCnv do
                  begin
                    r := Abs(pt.X - tCoorShipX);

                    Pen.Color := clSilver;
                    Pen.Style := psSolid;
                    Pen.Width := 1;
                    Brush.Style:= bsClear;

                    Rects.Top     := tCoorShipY - r;
                    Rects.Left    := tCoorShipX - r;
                    Rects.Bottom  := tCoorShipY + r;
                    Rects.Right   := tCoorShipX + r;

                    Ellipse(Rects);
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TT3MissilesOnVehicle.GetBOLWPoint(
  aLauncherID: Integer): TPointVehicleMissileBOLW;
var
  i : Integer;
  PointBOLW : TPointVehicleMissileBOLW;
begin
  Result := nil;

  if BOLW_PointList.Count > 0 then
  begin
    for i := 0 to BOLW_PointList.Count - 1 do
    begin
      PointBOLW := BOLW_PointList[i];

      if PointBOLW.LauncherIndex = aLauncherID then
      begin
        Result := PointBOLW;
        Break;
      end;
    end;
  end;
end;

function TT3MissilesOnVehicle.GetBOLWPoint(aLauncherID,
  aPointID: Integer): TPointVehicleMissileBOLW;
var
  i : Integer;
  PointBOLW : TPointVehicleMissileBOLW;
begin
  Result := nil;

  if BOLW_PointList.Count > 0 then
  begin
    for i := 0 to BOLW_PointList.Count - 1 do
    begin
      PointBOLW := BOLW_PointList[i];

      if (PointBOLW.LauncherIndex = aLauncherID) and
        (PointBOLW.IndexPoint = aPointID) then
      begin
        Result := PointBOLW;
        Break;
      end;
    end;
  end;
end;

function TT3MissilesOnVehicle.GetBOLWPointMaxIndex(
  aLauncher: Integer): TPointVehicleMissileBOLW;
var
  i, maxIndex : Integer;
  pointBOLW : TPointVehicleMissileBOLW;
begin
  Result := nil;
  maxIndex := -1;

  for i := 0 to BOLW_PointList.Count - 1 do
  begin
    pointBOLW := BOLW_PointList.Items[i];

    if (pointBOLW.LauncherIndex = aLauncher) and
      (pointBOLW.IndexPoint > maxIndex) then
    begin
      maxIndex := pointBOLW.IndexPoint;
      Result := pointBOLW;
    end;
  end;
end;

function TT3MissilesOnVehicle.GetLauncherByID(
  aLauncherID: Integer): TFitted_Weap_Launcher_On_Board;
var
  I : Integer;
begin
  Result := nil;

  for I := 0 to Self.MissileDefinition.FLaunchs.Count - 1 do
  begin
    if TFitted_Weap_Launcher_On_Board(Self.MissileDefinition.FLaunchs.Items[i]).FData.Launcher_Type > 8 then
    begin
      if aLauncherID = (TFitted_Weap_Launcher_On_Board(Self.MissileDefinition.FLaunchs.Items[i]).FData.Launcher_Type - 8) then
      begin
        Result := Self.MissileDefinition.FLaunchs.Items[i];
        Break;
      end;
    end
    else
    begin
      if aLauncherID = TFitted_Weap_Launcher_On_Board(Self.MissileDefinition.FLaunchs.Items[i]).FData.Launcher_Type then
      begin
        Result := Self.MissileDefinition.FLaunchs.Items[i];
        Break;
      end;
    end;
  end;
end;

procedure TT3MissilesOnVehicle.DrawRBLIntercept(aCnv :TCanvas; aRing : Double);
var
  hRange , hBearing, hTime, hSpeed, mx, my : double;
  Rects : TRect;

  tCoorShipX, tCoorShipY : Integer;
  tInterceptX, tInterceptY : Integer;
  tHAFO_X, tHAFO_Y : Integer;

  pt : TPoint;
  Ring : Double;

  dx, dy: Double;
  r : Integer;
  Distance : Double;

  xHAFO, yHAFO : Double;
begin
  FTargetPosition.X := TT3PlatformInstance(TargetObject).getPositionX;
  FTargetPosition.Y := TT3PlatformInstance(TargetObject).getPositionY;
  FTargetPosition.Z := TT3PlatformInstance(TargetObject).getPositionZ;

  FShipPosition.X := getPositionX;
  FShipPosition.Y := getPositionY;
  FShipPosition.Z := getPositionZ;

  FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y,FShipPosition.X, FShipPosition.Y);
  FTargetBearing := Calcbearing(FShipPosition.X, FShipPosition.Y, FTargetPosition.X,FTargetPosition.Y);
  FTargetCourse  := TT3PlatformInstance(TargetObject).Course;
  FTargetSpeed   := TT3PlatformInstance(TargetObject).Speed;

  Distance := CalcRange(FTargetPosition.X,FTargetPosition.Y,FShipPosition.X, FShipPosition.Y);

  CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                   hRange,hBearing,hTime,hSpeed);

  RangeBearingToCoord(hRange,hBearing,mx,my);
  RangeBearingToCoord(HitMode.HAFO,hBearing,xHAFO,yHAFO);

  FTargetPosition.X := FShipPosition.X + mx;
  FTargetPosition.Y := FShipPosition.Y + mY;
  FTargetPosition.Z := TT3PlatformInstance(TargetObject).getPositionZ;

  if Distance < WeaponRange then
  begin
    with aCnv do
    begin
      Pen.Color := clSilver;
      Pen.Style := psSolid;
      Pen.Width := 1;
      Brush.Style := bsClear;

      Converter.ConvertToScreen(FShipPosition.X, FShipPosition.Y, tCoorShipX, tCoorShipY);
      Converter.ConvertToScreen(FTargetPosition.X, FTargetPosition.Y, tInterceptX, tInterceptY);
      Converter.ConvertToScreen(FShipPosition.X+xHAFO, FShipPosition.Y+yHAFO, tHAFO_X, tHAFO_Y);

      MoveTo(tCoorShipX, tCoorShipY);
      LineTo(tInterceptX, tInterceptY);

      Ring := (0.9*aRing)/60;
      dx := FTargetPosition.X + Ring;
      dy := FTargetPosition.Y;

      Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);
      r := Abs(pt.X - tInterceptX);

      Rects.Top     := tInterceptY - r;
      Rects.Left    := tInterceptX - r;
      Rects.Bottom  := tInterceptY + r;
      Rects.Right   := tInterceptX + r;
      Ellipse(Rects);

//      FSignHAFO.Text    := 'F';
//      FSignHAFO.Center  := Point(tHAFO_X, tHAFO_Y);
      FSignHAFO.Visible := True;
      FSignHAFO.Color   := getForceColor(Force_Designation);
      TextOut(tHAFO_X, tHAFO_Y, 'F');
//      FSignHAFO.Draw(aCnv);
    end;
  end;
end;

procedure TT3MissilesOnVehicle.DrawRBLWIntercept(aCnv: TCanvas; aRing: Double;
          aLengthWaypoint : Double; aPositionX, aPositionY : Double);
var
  hRange , hBearing, hTime, hSpeed, mx, my : double;
  Rects : TRect;

  tCoorShipX, tCoorShipY : Integer;
  tInterceptX, tInterceptY : Integer;
  tHAFO_X, tHAFO_Y : Integer;

  pt : TPoint;
  Ring : Double;

  dx, dy, xHAFO, yHAFO : Double;
  r : Integer;
  Bearing, Distance, OldDistance : Double;

  PositionX_RBLW, PositionY_RBLW : Double;
begin
  with aCnv do
  begin
    Pen.Color := clSilver;
    Pen.Style := psSolid;
    Pen.Width := 1;

    FTargetPosition.X := TT3PlatformInstance(TargetObject).getPositionX;
    FTargetPosition.Y := TT3PlatformInstance(TargetObject).getPositionY;
    FTargetPosition.Z := TT3PlatformInstance(TargetObject).getPositionZ;

    FShipPosition.X := getPositionX;
    FShipPosition.Y := getPositionY;
    FShipPosition.Z := getPositionZ;

    CalcHitPredictionWithWaypoint(TT3PlatformInstance(TargetObject).Speed, TT3PlatformInstance(TargetObject).Course, aLengthWaypoint
                                  ,FTargetPosition.X , FTargetPosition.Y, UnitMotion.FData.High_Ground_Speed,
                                  PositionX_RBLW, PositionY_RBLW);

    FTargetPosition.X := PositionX_RBLW;
    FTargetPosition.Y := PositionY_RBLW;

    FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y, aPositionX, aPositionY);
    FTargetBearing := Calcbearing(aPositionX, aPositionY, FTargetPosition.X,FTargetPosition.Y);

    FTargetCourse  := TT3PlatformInstance(TargetObject).Course;
    FTargetSpeed   := TT3PlatformInstance(TargetObject).Speed;

    CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                     hRange,hBearing,hTime,hSpeed);

    RangeBearingToCoord(hRange,hBearing,mx,my);

    FTargetPosition.X := aPositionX + mx;
    FTargetPosition.Y := aPositionY + mY;
    FTargetPosition.Z := TT3PlatformInstance(TargetObject).getPositionZ;

    //==========================================
    Converter.ConvertToScreen(aPositionX, aPositionY, tCoorShipX, tCoorShipY);
    Converter.ConvertToScreen(FTargetPosition.X, FTargetPosition.Y, tInterceptX, tInterceptY);

    MoveTo(tCoorShipX, tCoorShipY);
    LineTo(tInterceptX, tInterceptY);

    Ring := (0.9*aRing)/60;
    dx := FTargetPosition.X + Ring;
    dy := FTargetPosition.Y;

    Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);
    r := Abs(pt.X - tInterceptX);

    Rects.Top     := tInterceptY - r;
    Rects.Left    := tInterceptX - r;
    Rects.Bottom  := tInterceptY + r;
    Rects.Right   := tInterceptX + r;
    Ellipse(Rects);

     OldDistance := aLengthWaypoint;
    Distance := aLengthWaypoint + (CalcRange(aPositionX,aPositionY,FTargetPosition.X,FTargetPosition.Y));
    if (HitMode.HAFO > OldDistance) and (HitMode.HAFO <= Distance) then
    begin
      Bearing := CalcBearing(aPositionX,aPositionY,FTargetPosition.X,FTargetPosition.Y);
      RangeBearingToCoord(HitMode.HAFO-OldDistance,Bearing,xHAFO,yHAFO);
      Converter.ConvertToScreen(aPositionX+xHAFO, aPositionY+yHAFO, tHAFO_X, tHAFO_Y);
      Font.Size := 10;
      Font.Color := getForceColor(Force_Designation);
      TextOut(tHAFO_X, tHAFO_Y, 'F');
    end;
  end;
end;

procedure TT3MissilesOnVehicle.DrawBOLWPoint(aCnv: Tcanvas);
var
  PointBOLW : TPointVehicleMissileBOLW;
  i : Integer;
begin
  for i := 0 to BOLW_PointList.Count - 1 do
  begin
    PointBOLW := TPointVehicleMissileBOLW(BOLW_PointList[i]);
    PointBOLW.Converter := Converter;
    PointBOLW.DrawPointBOLW(aCnv);
  end;
end;

procedure TT3MissilesOnVehicle.DrawRBLWPoint(aCnv: Tcanvas);
var
  PointRBLW : TPointVehicleMissileRBLW;
  i: Integer;
begin
  if RBLW_PointList.Count > 0 then
  begin
    for i := 0 to RBLW_PointList.Count - 1 do
    begin
       PointRBLW := TPointVehicleMissileRBLW(RBLW_PointList[i]);
       PointRBLW.Converter := Converter;
       PointRBLW.DrawPointRBLW(aCnv);
    end;
  end;
end;

procedure TT3MissilesOnVehicle.DrawRBLW_missile(aCnv: Tcanvas; x1, y1, x2, y2 : Double);
var
  i: Integer;
  RBLMissile : TT3MissilesOnVehicle;

  RBLWPointX, RBLWPointY : Double;
  tRBLWPointX, tRBLWPointY : integer;
  str : string;

  tRBLWPointX1, tRBLWPointY1,
  tRBLWPointX2, tRBLWPointY2,
  tRBLWPointX3, tRBLWPointY3 : Integer;

  CoorX1, CoorY1, CoorX2, CoorY2: Double;
  tCoorX1, tCoorY1, tCoorX2, tCoorY2 : Integer;
begin

  FTacticalSymbol.isVehicle := false;

  //TargetShip Coordinat
  CoorX1 := x1;
  CoorY1 := y1;

  //OwnShip Coordinat
  CoorX2 := x2;
  CoorY2 := y2;

  for i := 0 to RBLWPoint.itemCount - 1 do
  begin
    RBLMissile := TT3MissilesOnVehicle(RBLWPoint.getObject(i));
    if RBLMissile = Self then
    begin
      RBLWPointX := RBLMissile.RBLW_PointX;
      RBLWPointY := RBLMissile.RBLW_PointY;

      str := RBLMissile.RBLW_Name;

      Converter.ConvertToScreen(RBLWPointX, RBLWPointY, tRBLWPointX, tRBLWPointY);
      FTacticalSymbol.ConvertCoord(Converter);
//      FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + pctWayPoint + '.bmp',clRed);
//      FTacticalSymbol.Symbol.Center := Point(tRBLWPointX, tRBLWPointY);
      FTacticalSymbol.CallSign1 := '+RBLW-' + IntToStr(i+1);
      FTacticalSymbol.SetTextCenter(Point(tRBLWPointX, tRBLWPointY));
      FTacticalSymbol.Color := clRed;
      FTacticalSymbol.Draw(aCnv);
    end;
  end;

  if RBLWPoint.itemCount = 1 then
  begin
    with aCnv do
    begin
      Converter.ConvertToScreen(CoorX1, CoorY1, tCoorX1, tCoorY1);
      Converter.ConvertToScreen(CoorX2, CoorY2, tCoorX2, tCoorY2);


      RBLMissile := TT3MissilesOnVehicle(RBLWPoint.getObject(0));
      if RBLMissile = Self then
      begin
        RBLWPointX := RBLMissile.RBLW_PointX;
        RBLWPointY := RBLMissile.RBLW_PointY;

        Converter.ConvertToScreen(RBLWPointX, RBLWPointY, tRBLWPointX1, tRBLWPointY1);
      end;

      Pen.Color := clSilver;
      Pen.Style := psSolid;
      Pen.Width := 1;

      MoveTo(tCoorX2,tCoorY2);
      LineTo(tRBLWPointX1, tRBLWPointY1);

      MoveTo(tRBLWPointX1, tRBLWPointY1);
      LineTo(tCoorX1,tCoorY1);
    end;
  end
  else
  if RBLWPoint.itemCount = 2 then
  begin
    with aCnv do
    begin
      Converter.ConvertToScreen(CoorX1, CoorY1, tCoorX1, tCoorY1);
      Converter.ConvertToScreen(CoorX2, CoorY2, tCoorX2, tCoorY2);


      RBLMissile := TT3MissilesOnVehicle(RBLWPoint.getObject(0));
      if RBLMissile = Self then
      begin
        RBLWPointX := RBLMissile.RBLW_PointX;
        RBLWPointY := RBLMissile.RBLW_PointY;

        Converter.ConvertToScreen(RBLWPointX, RBLWPointY, tRBLWPointX1, tRBLWPointY1);
      end;

      Pen.Color := clSilver;
      Pen.Style := psSolid;
      Pen.Width := 1;

      MoveTo(tCoorX2,tCoorY2);
      LineTo(tRBLWPointX1, tRBLWPointY1);

      RBLMissile := TT3MissilesOnVehicle(RBLWPoint.getObject(1));
      if RBLMissile = Self then
      begin
        RBLWPointX := RBLMissile.RBLW_PointX;
        RBLWPointY := RBLMissile.RBLW_PointY;

        Converter.ConvertToScreen(RBLWPointX, RBLWPointY, tRBLWPointX2, tRBLWPointY2);
      end;

      MoveTo(tRBLWPointX1, tRBLWPointY1);
      LineTo(tRBLWPointX2, tRBLWPointY2);

      MoveTo(tRBLWPointX2, tRBLWPointY2);
      LineTo(tCoorX1,tCoorY1);
    end;
  end
  else
  if RBLWPoint.itemCount = 3 then
  begin
    with aCnv do
    begin
      Converter.ConvertToScreen(CoorX1, CoorY1, tCoorX1, tCoorY1);
      Converter.ConvertToScreen(CoorX2, CoorY2, tCoorX2, tCoorY2);


      RBLMissile := TT3MissilesOnVehicle(RBLWPoint.getObject(0));
      if RBLMissile = Self then
      begin
        RBLWPointX := RBLMissile.RBLW_PointX;
        RBLWPointY := RBLMissile.RBLW_PointY;

        Converter.ConvertToScreen(RBLWPointX, RBLWPointY, tRBLWPointX1, tRBLWPointY1);
      end;

      Pen.Color := clSilver;
      Pen.Style := psSolid;
      Pen.Width := 1;

      MoveTo(tCoorX2,tCoorY2);
      LineTo(tRBLWPointX1, tRBLWPointY1);

      RBLMissile := TT3MissilesOnVehicle(RBLWPoint.getObject(1));
      if RBLMissile = Self then
      begin
        RBLWPointX := RBLMissile.RBLW_PointX;
        RBLWPointY := RBLMissile.RBLW_PointY;

        Converter.ConvertToScreen(RBLWPointX, RBLWPointY, tRBLWPointX2, tRBLWPointY2);
      end;

      MoveTo(tRBLWPointX1, tRBLWPointY1);
      LineTo(tRBLWPointX2, tRBLWPointY2);

      RBLMissile := TT3MissilesOnVehicle(RBLWPoint.getObject(2));
      if RBLMissile = Self then
      begin
        RBLWPointX := RBLMissile.RBLW_PointX;
        RBLWPointY := RBLMissile.RBLW_PointY;

        Converter.ConvertToScreen(RBLWPointX, RBLWPointY, tRBLWPointX3, tRBLWPointY3);
      end;

      MoveTo(tRBLWPointX2, tRBLWPointY2);
      LineTo(tRBLWPointX3, tRBLWPointY3);

      MoveTo(tRBLWPointX2, tRBLWPointY2);
      LineTo(tCoorX1,tCoorY1);
    end;
  end;


end;

procedure TT3MissilesOnVehicle.Draw(aCnv: tCanvas);
var
  PointBOLW : TPointVehicleMissileBOLW;
begin
  inherited;
  try
    if Assigned(TargetObject) then
    begin
      if Planned then
      begin
        //nando
        case FiringMode of
          mfmRBL :
          begin
            DrawRBLIntercept(aCnv, RangeRBLCircle);
            DrawRBL_Missile(aCnv, 25, RangeRBLCircle,
              TT3PlatformInstance(TargetObject).getPositionX,
              TT3PlatformInstance(TargetObject).getPositionY, getPositionX,
              getPositionY);
          end;
          mfmRBLW :
          begin
            DrawRBLWPoint(aCnv);

            DrawLineInRBLW(aCnv, TT3PlatformInstance(TargetObject).getPositionX,
             TT3PlatformInstance(TargetObject).getPositionY, getPositionX,
             getPositionY);

            DrawRBL_Missile(aCnv, 25, RangeRBLCircle,
            TT3PlatformInstance(TargetObject).getPositionX,
             TT3PlatformInstance(TargetObject).getPositionY, getPositionX,
             getPositionY);
          end;
          mfmBOL :
          begin
            if TT3PlatformInstance(TargetObject) is TT3Vehicle then
            begin
              DrawBOL_Missile(aCnv,
                TT3PlatformInstance(TargetObject).getPositionX,
                TT3PlatformInstance(TargetObject).getPositionY, getPositionX,
                getPositionY, 5, DestruckRange, 1, 0);
            end
            else if TT3PlatformInstance(TargetObject) is TT3NonRealVehicle then
            begin
              if TT3NonRealVehicle(TargetObject).NRPType = nrpBearing then
              begin
                DrawBOL_Missile(aCnv,
                  TT3PlatformInstance(TargetObject).getPositionX,
                  TT3PlatformInstance(TargetObject).getPositionY, getPositionX,
                  getPositionY, 5, DestruckRange, 2,
                  TT3NonRealVehicle(TargetObject).OrderedHeading);
              end;
            end;
          end;
          mfmBOLW :
          begin
            DrawBOLWPoint(aCnv);

            DrawBOLW_Missile(aCnv, getPositionX, getPositionY,
              TT3PlatformInstance(TargetObject).getPositionX,
              TT3PlatformInstance(TargetObject).getPositionY, 5, DestruckRange,
              1, 0);
          end;
        end;
      end;

      if not Planned and PreLaunched and (FiringMode = mfmRBLW) and (Engagement = meDTOT) then
      begin
        DrawRBLWPoint(aCnv);

        DrawLineInRBLW(aCnv, TT3PlatformInstance(TargetObject).getPositionX,
          TT3PlatformInstance(TargetObject).getPositionY, getPositionX, getPositionY);

        DrawRBL_Missile(aCnv, 25, RangeRBLCircle, TT3PlatformInstance(TargetObject).getPositionX,
          TT3PlatformInstance(TargetObject).getPositionY, getPositionX, getPositionY);
      end;
    end;
  except
    TargetObject := nil;
    Planned := false;
  end;
end;

function TT3MissilesOnVehicle.getMountType: integer;
begin
  result := FMissileDefinition.FData.Mount_Type;
end;

procedure TT3MissilesOnVehicle.InitAfterLaunch;
begin
  if Assigned(FMissileDefinition) then
  begin
    WeaponRange     := FMissileDefinition.FDef.Max_Range;
    DestruckRange   := WeaponRange;
    SeekerRangeTurn := FMissileDefinition.FDef.Seeker_TurnOn_Range;
    DefaultAltitude := FMissileDefinition.FDef.Default_Altitude;

    //popup
    HitMode.PopUp_Move := ppPopUP;
    HitMode.HAFO       := 1.97;     //nauctical mile

    FLaunchDelay := Round(FMissileDefinition.FData.Firing_Delay);

    FOnRBLW := False;
    FOnBOLW := False;
    FOnBOL  := False;
  end;
end;

procedure TT3MissilesOnVehicle.Initialize;
var
  rec : TMotion_Characteristics;
  blindZ  : TBlindZoneVisual;
  i : Integer;
begin
  inherited;

  if Assigned(UnitDefinition) then
    FMissileDefinition := TMissile_On_Board(UnitDefinition);

  if Assigned(FMissileDefinition) then
  begin
    case FMissileDefinition.FDef.Primary_Target_Domain of
      0 : FWeaponCategory := wcMissileAirToSurfaceSubsurface;
      1 : FWeaponCategory := wcMissileSurfaceSubsurfaceToSurfaceSubsurface;
      2 : FWeaponCategory := wcMissileSurfaceSubsurfaceToAir;
      3 : FWeaponCategory := wcMissileAirToAir;
      4 : FWeaponCategory := wcMissileLandAttack;
    end;

    rec := nil;
    dmTTT.GetMotionCharacteristicDef(FMissileDefinition.FDef.Motion_Index,rec);
    InstanceName  := FMissileDefinition.FData.Instance_Identifier;
    InstanceIndex := FMissileDefinition.FData.Fitted_Weap_Index;

    FDamageStatus.DamageCapacity :=  FMissileDefinition.FDef.Damage_Capacity;
    Health       := FMissileDefinition.FDef.Damage_Capacity - UnitActivation.Damage;
//    Health   := FMissileDefinition.FDef.Damage_Capacity - UnitActivation.Damage;

    Quantity  := FMissileDefinition.FData.Quantity;

    FSalvoSize  := 1;

    UnitMotion := rec;

    with FMissileDefinition do
    begin
      if FBlind.Count > 0 then begin
        SetLength(BZStartAngle,FBlind.Count);
        SetLength(BZEndAngle,FBlind.Count);

        for i := 0 to FBlind.Count - 1 do
        begin
          blindz            := TBlindZoneVisual.Create;
          BZStartAngle[i]   := TBlind_Zone(FBlind.Items[i]).FData.Start_Angle;
          BZEndAngle[i]     := TBlind_Zone(FBlind.Items[i]).FData.End_Angle;
          blindZ.StartAngle := BZStartAngle[i];
          blindZ.EndAngle   := BZEndAngle[i];
          FBlindView.Add(blindZ);
        end;
      end;
    end;
  end;
end;

function TT3MissilesOnVehicle.InsideBlindZone(aObject: TSimObject): boolean;
var
  i : integer;
  blindZ : TBlindZoneVisual;
  bearing : double;
begin
  inherited;

  result := false;

  bearing := CalcBearing(FPosition.X,FPosition.Y,
           TT3PlatformInstance(aObject).getPositionX,
           TT3PlatformInstance(aObject).getPositionY);

  // periksa apakah didalam area blind zone
  if FBlindView.Count > 0 then begin
    for I := 0 to FBlindView.Count - 1 do begin

      blindZ := TBlindZoneVisual(FBlindView.Items[i]);
      Result := DegComp_IsBeetwen(bearing, blindZ.RelativeStartAngle, blindZ.RelativeEndAngle);
    end;
  end;
end;

function TT3MissilesOnVehicle.IsMissileCapableToTrack(
  aTarget: TT3PlatformInstance): Boolean;
begin
  Result := False;

  case aTarget.PlatformDomain of //if platformdomain = Air; 0 = Air, 1 = Surface, 2 = Subsurface
    0:
    begin
      if Self.MissileDefinition.FDef.Anti_Air_Capable = 1 then
        Result := True;
    end;
    1:
    begin
      if Self.MissileDefinition.FDef.Anti_Sur_Capable = 1 then
        Result := True;
    end;
    2:
    begin
      if Self.MissileDefinition.FDef.Anti_SubSur_Capable = 1 then
        Result := True;
    end;
    3:
    begin
      if Self.MissileDefinition.FDef.Anti_Land_Capable = 1 then
        Result := True;
    end;
  end;
end;

procedure TT3MissilesOnVehicle.Move(const aDeltaMs: double);
begin
  inherited;
  if not Assigned(Parent) then exit;

  FPosition.X := Parent.getPositionX;
  FPosition.Y := Parent.getPositionY;
  FPosition.Z := Parent.getPositionZ;
end;

function TT3MissilesOnVehicle.PrepareLaunch : TT3Missile;
var
  projectil : TT3Missile;
  isInRange : boolean;
begin
  result := nil;

  if not (Quantity > 0) then exit;

  case FWeaponCategory of
    wcMissileSurfaceSubsurfaceToSurfaceSubsurface:
    begin
      case FiringMode of
        mfmRBl, mfmRBLW :
        begin
          if not Assigned(TargetObject) then Exit;

          isInRange := true;

          if CalcRange(FPosition.X,FPosition.Y,TargetObject.getPositionX, TargetObject.getPositionY) <=
             TMissile_On_Board(UnitDefinition).FDef.Min_Range then
          begin
            if Assigned(OnLogEventStr) then
              OnLogEventStr('TT3MissilesOnVehicle.PrepareLaunch', 'Target is to close');

            isInRange := false;
          end
          else
          if CalcRange(FPosition.X,FPosition.Y,TargetObject.getPositionX, TargetObject.getPositionY) >=
             TMissile_On_Board(UnitDefinition).FDef.Max_Range then
          begin
            if Assigned(OnLogEventStr) then
              OnLogEventStr('TT3MissilesOnVehicle.PrepareLaunch', 'Target is too far');
            isInRange := false;
          end;

          if isInRange then
          begin
            projectil := CreateProjectile;
            result := projectil;
          end;
        end;
        mfmBOL,mfmBOLW :
        begin
          projectil := CreateProjectile;
          result := projectil;
        end;
      end;
    end;
    wcMissileSurfaceSubsurfaceToAir:
    begin
      if not Assigned(TargetObject) then Exit;

      isInRange := true;

      if CalcRange(FPosition.X,FPosition.Y,TargetObject.getPositionX, TargetObject.getPositionY) <=
       TMissile_On_Board(UnitDefinition).FDef.Min_Range then
      begin
      if Assigned(OnLogEventStr) then
        OnLogEventStr('TT3MissilesOnVehicle.PrepareLaunch', 'Target is to close');
      isInRange := false;
      end
      else
      if CalcRange(FPosition.X,FPosition.Y,TargetObject.getPositionX, TargetObject.getPositionY) >=
         TMissile_On_Board(UnitDefinition).FDef.Max_Range then
      begin
        if Assigned(OnLogEventStr) then
          OnLogEventStr('TT3MissilesOnVehicle.PrepareLaunch', 'Target is too far');
        isInRange := false;
      end;

      if isInRange then
      begin
        projectil := CreateProjectile;
        result := projectil;
      end;
    end;
    wcMissileAirToAir, wcMissileAirToSurfaceSubsurface, wcMissileLandAttack:
    begin
      case FiringMode of
        mfmDirect :
        begin
          if not Assigned(TargetObject) then Exit;

          isInRange := true;

          if CalcRange(FPosition.X,FPosition.Y,TargetObject.getPositionX, TargetObject.getPositionY) <=
           TMissile_On_Board(UnitDefinition).FDef.Min_Range then
          begin
          if Assigned(OnLogEventStr) then
            OnLogEventStr('TT3MissilesOnVehicle.PrepareLaunch', 'Target is to close');
          isInRange := false;
          end
          else
          if CalcRange(FPosition.X,FPosition.Y,TargetObject.getPositionX, TargetObject.getPositionY) >=
             TMissile_On_Board(UnitDefinition).FDef.Max_Range then
          begin
            if Assigned(OnLogEventStr) then
              OnLogEventStr('TT3MissilesOnVehicle.PrepareLaunch', 'Target is too far');
            isInRange := false;
          end;

          if isInRange then
          begin
            projectil := CreateProjectile;
            result := projectil;
          end;
        end;
        mfmAimpoint, mfmBearing :
        begin
          projectil := CreateProjectile;
          result := projectil;
        end;
      end;
    end;

  end;
end;

procedure TT3MissilesOnVehicle.SetEngagement(const Value: TMissileEngagement);
begin
  FEngagement := Value;
end;

procedure TT3MissilesOnVehicle.SetFiringMode(const Value: TMissileFiringMode);
begin
  FFiringMode := Value;
end;

procedure TT3MissilesOnVehicle.setStaticEngagementMode(
  const value: TMissileEngagement);
begin
  FEngagement := value;

  case value of
    meRipple : SetEngagement(meRipple);
    meSTOT   : SetEngagement(meSTOT);
    meDTOT   : SetEngagement(meDTOT);
  end;

end;

procedure TT3MissilesOnVehicle.setStaticFiringMode(const value: TMissileFiringMode);
begin
  FFiringMode := Value;

  case value of
    mfmRBl : SetFiringMode(mfmRBl);
    mfmRBLW: SetFiringMode(mfmRBLW);
    mfmBOL : SetFiringMode(mfmBOL);
    mfmBOLW: SetFiringMode(mfmBOLW);
    mfmDirect: SetFiringMode(mfmDirect);
    mfmAimpoint: SetFiringMode(mfmAimpoint);
    mfmBearing: SetFiringMode(mfmBearing);
  end;
end;

procedure TT3MissilesOnVehicle.TriggerLauncherListener(Launcher: TObject;
  Quantity: Integer);
var
  i : integer;
  l : TObject;
begin
  for i := 0 to FListenerList.Count - 1 do begin
    l := FListenerList.Items[i];
    if l is TT3MissileOnVehicleListener then
      TT3MissileOnVehicleListener(l).OnPropertyLauncherChange(Self,Launcher,Quantity);
  end;
end;

procedure TT3MissilesOnVehicle.SetLaunchDelay(const Value: integer);
begin
  FLaunchDelay := Value;
end;

procedure TT3MissilesOnVehicle.SetOnSetSalvo(const Value: TOnWeaponSetSalvo);
begin
  FOnSetSalvo := Value;
end;

procedure TT3MissilesOnVehicle.SetQuantity(const Value: integer);
begin
  if Value <= 0 then
  begin
    if WeaponStatus = wsAvailable then
    begin
      FQuantity     := 0;
      WeaponStatus  := wsUnavailable;
    end;
  end
  else
  begin
    if WeaponStatus <> wsDamaged then
    begin
      FQuantity     := Value;
      WeaponStatus  := wsAvailable;
    end;
  end;

  TriggerListener(Self,psQuantity,FQuantity);
  if Assigned(OnPropertyChange) then
    OnPropertyChange(Self);
end;

procedure TT3MissilesOnVehicle.SetSalvoSize(const Value: integer);
begin
  FSalvoSize := Value;
  if Assigned(FOnSetSalvo) then
    FOnSetSalvo(Self,Value);
end;

procedure TT3MissilesOnVehicle.UpdateVisual;
begin
  if not Assigned(Parent) then exit;

  FPosition.X := Parent.getPositionX;
  FPosition.Y := Parent.getPositionY;
  FPosition.Z := Parent.getPositionZ;

  inherited;
end;

function TT3MissilesOnVehicle.GetSnapshotData : _SS_MissilesOnVehicle ;
var
    i  : integer ;
    ss : _SS_MissilesOnVehicle ;
    plauncher     : TFitted_Weap_Launcher_On_Board;
    weaponScript  : TScripted_Weapon ;
    pattern       : TPattern_Weapon ;
    blind         : TBlind_Zone;
begin
    if Parent <> nil then
      ss.Owner  := TT3Unit(Parent).InstanceIndex;
    ss.W := TT3Weapon(Self).GetSnapshotData ;
    ss.MissileDefinition.FData := MissileDefinition.FData ;
    ss.MissileDefinition.FDef := MissileDefinition.FDef ;
    ss.MissileDefinition.FLaunch := MissileDefinition.FLaunch ;
    ss.MissileDefinition.FNote := MissileDefinition.FNote ;

    if MissileDefinition.FLaunchs <> nil then begin
      SetLength(ss.MissileDefinition.FLaunchs,MissileDefinition.FLaunchs.Count);
      for I := 0 to MissileDefinition.FLaunchs.Count - 1 do
      begin
          plauncher := TFitted_Weap_Launcher_On_Board(MissileDefinition.FLaunchs[i]) ;
          if plauncher <> nil then
          begin
            ss.MissileDefinition.FLaunchs[i].FData := plauncher.FData ;
          end;
      end;
    end;

    if MissileDefinition.FScript_Missile <> nil then begin
      SetLength(ss.MissileDefinition.FScript_Missile,MissileDefinition.FScript_Missile.Count);
      for I := 0 to MissileDefinition.FScript_Missile.Count - 1 do
      begin
          weaponScript := TScripted_Weapon(MissileDefinition.FScript_Missile[i]) ;
          if weaponScript <> nil then
          begin
            ss.MissileDefinition.FScript_Missile[i].Event := weaponScript.Event.FData ;
            ss.MissileDefinition.FScript_Missile[i].Behav := weaponScript.Behav.FData ;
          end;
      end;
    end;

    if MissileDefinition.FPattern_Missile <> nil then begin
      SetLength(ss.MissileDefinition.FPattern_Missile,MissileDefinition.FPattern_Missile.Count);
      for I := 0 to MissileDefinition.FPattern_Missile.Count - 1 do
      begin
          pattern := TPattern_Weapon(MissileDefinition.FPattern_Missile[i]) ;
          if pattern <> nil then
          begin
            ss.MissileDefinition.FPattern_Missile[i].Event := pattern.Event.FData ;
            ss.MissileDefinition.FPattern_Missile[i].Pattern := pattern.Pattern.FData ;
          end;
      end;
    end;

    if MissileDefinition.FBlind <> nil then begin
      SetLength(ss.MissileDefinition.FBlind,MissileDefinition.FBlind.Count);
      for I := 0 to MissileDefinition.FBlind.Count - 1 do
      begin
          blind := TBlind_Zone(MissileDefinition.FBlind[i]) ;
          if blind <> nil then
            ss.MissileDefinition.FBlind[i].FData := blind.FData;
      end;
    end;

    ss.MissileDefinition.FVehicle.FData := MissileDefinition.FVehicle.FData ;
    ss.MissileDefinition.FVehicle.FPlatform_Ident := MissileDefinition.FVehicle.FPlatform_Ident ;
    ss.MissileDefinition.FVehicle.FHeliLimitation := MissileDefinition.FVehicle.FHeliLimitation ;

    ss.FiringMode := byte(FiringMode);
    ss.Engagement := byte(Engagement);
    ss.Quantity   := Quantity ;
    ss.SalvoSize  := SalvoSize ;
    ss.LaunchDelay := LaunchDelay ;
    //OnSetSalvo : TOnWeaponSetSalvo read FOnSetSalvo write SetOnSetSalvo;
    ss.isONRBLW := isONRBLW ;
    ss.isONBOLW := isONBOLW ;
    ss.isONBOL  := isONBOL ;
    ss.LauncherNumber := LauncherNumber ;
    ss.DestruckRange    := DestruckRange ;
    ss.SeekerRangeTurn  := SeekerRangeTurn ;
    ss.DefaultAltitude  := DefaultAltitude ;
    ss.DefaultSeekAltitude := DefaultSeekAltitude ;

    Result := ss ;
end;

function TT3MissilesOnVehicle.GetRBLWPoint(
  aLauncherID: Integer): TPointVehicleMissileRBLW;
var
  i : Integer;
  PointRBLW : TPointVehicleMissileRBLW;
begin
  Result := nil;

  if RBLW_PointList.Count > 0 then
  begin
    for i := 0 to RBLW_PointList.Count - 1 do
    begin
      PointRBLW := TPointVehicleMissileRBLW(RBLW_PointList[i]);
      if PointRBLW.LauncherIndex = aLauncherID then
      begin
        Result := PointRBLW;
        Break;
      end;
    end;
  end;
end;

function TT3MissilesOnVehicle.GetRBLWPoint(
  aLauncherID, aPointID: Integer): TPointVehicleMissileRBLW;
var
  i : Integer;
  PointRBLW : TPointVehicleMissileRBLW;
begin
  Result := nil;

  if RBLW_PointList.Count > 0 then
  begin
    for i := 0 to RBLW_PointList.Count - 1 do
    begin
      PointRBLW := TPointVehicleMissileRBLW(RBLW_PointList[i]);
      if (PointRBLW.LauncherIndex = aLauncherID) and
         (PointRBLW.IndexPoint = aPointID) then
      begin
        Result := PointRBLW;
        Break;
      end;
    end;
  end;
end;

procedure TT3MissilesOnVehicle.SetSnapshotData(const ss : _SS_MissilesOnVehicle);
begin
    TT3Weapon(Self).SetSnapshotData(ss.W) ;
    MissileDefinition.FData := ss.MissileDefinition.FData ;
    MissileDefinition.FDef := ss.MissileDefinition.FDef ;
    MissileDefinition.FLaunch := ss.MissileDefinition.FLaunch ;
    MissileDefinition.FVehicle.FData := ss.MissileDefinition.FVehicle.FData ;
    MissileDefinition.FVehicle.FPlatform_Ident := ss.MissileDefinition.FVehicle.FPlatform_Ident ;
    MissileDefinition.FVehicle.FHeliLimitation := ss.MissileDefinition.FVehicle.FHeliLimitation ;

    FiringMode := TMissileFiringMode(ss.FiringMode);
    Engagement := TMissileEngagement(ss.Engagement);
    Quantity   := ss.Quantity ;
    SalvoSize  := ss.SalvoSize ;
    LaunchDelay := ss.LaunchDelay ;
    //OnSetSalvo : TOnWeaponSetSalvo read FOnSetSalvo write SetOnSetSalvo;
    isONRBLW := ss.isONRBLW ;
    isONBOLW := ss.isONBOLW ;
    isONBOL  := ss.isONBOL ;
    LauncherNumber := ss.LauncherNumber ;
    DestruckRange    := ss.DestruckRange ;
    SeekerRangeTurn  := ss.SeekerRangeTurn ;
    DefaultAltitude  := ss.DefaultAltitude ;
    DefaultSeekAltitude := ss.DefaultSeekAltitude ;
end;


{ TMissileRBLW_STOT }

procedure TMissileRBLW_STOT.Clear;
begin
  ListNonSort.Clear;
  ListSort.Clear;
end;

constructor TMissileRBLW_STOT.Create;
begin
  ListNonSort := TList.Create;
  ListSort := TList.Create;
end;

destructor TMissileRBLW_STOT.Destroy;
begin
  ListSort.Free;
  ListNonSort.Free;

  inherited;
end;

function TMissileRBLW_STOT.GetTimeLaunch(aLauncherIndex: integer): Integer;
begin
  Result := 0;
end;

procedure TMissileRBLW_STOT.SortList;
var
  i,j : Integer;
  RBLWPoint, RBLWPoint2 : TPointVehicleMissileRBLW;
begin

  for i := 0 to ListNonSort.Count - 1 do
  begin
    RBLWPoint := TPointVehicleMissileRBLW(ListNonSort[i]);

    for j := 0 to ListNonSort.Count - 1 do
    begin
      RBLWPoint2 := TPointVehicleMissileRBLW(ListNonSort[j]);
      if RBLWPoint.DistanceToTarget > RBLWPoint2.DistanceToTarget then
      begin
        ListNonSort.Exchange(i,j);
      end;
    end;
  end;

  ListSort := ListNonSort;
end;

end.
