unit uT3Torpedo;

interface

uses Classes, uT3Weapon, uDBAsset_Weapon, Graphics, uObjectVisuals, u2DMover,
 uT3Listener, uSimObjects, uDataTypes, uT3Common, uT3UnitContainer,
 SysUtils , uWeaponWaypoint,uDBAsset_Scripted, uDBBlind_Zone, tttData, Math,
 uSnapshotData, uT3Unit, uGameData_TTT;

type
  TMoveChangeState  = (mcsStable, mcsIncrease, mcsDecrease);
  TOnCekLandandDepth = procedure (x, y : Double ;r: TRec_MapData) of object;

  TT3Torpedo = class(TT3Weapon)
  private
    FPOH              : TList;
    FIsOnLand         : boolean;
    FIsGrounded       : boolean;
    FEngageTarget     : boolean;

    FisCounterDelay   : boolean;
    FLaunching        : boolean;
    FLethality        : integer;
    FLaunchDelay      : double;
    FCounterDelay     : double;
    FSearchRadius     : double;
    FSearchDepth      : double;
    FSafetyCeiling    : double;
    FSeekerRange      : double;
    FLaunchBearing    : double;
    FTipeTorpedo      : double;
    FLastHeading      : double;
    FTargetCourse     : double;
    FTargetSpeed      : double;
    FTargetBearing    : double;
    FTargetRange      : double;
    FTargetAltitude   : double;
    FTargetDomain     : double;
    FOrderedAltitude  : double;
    FOrderedHeading   : double;
    FDeltaHead        : double;

    FMover            : T2DMover;
    FTargetPosition   : t3DPoint;
    FLaunchPosition : t3DPoint;
    FTorLastPosition  : t3DPoint;
    FOwner            : TSimObject;
    FLockTarget       : TSimObject;
    FAltitudeState    : TMoveChangeState;
    FSpeedState       : TMoveChangeState;
    FHeadingState     : TMoveChangeState;
    FTargetPlatforms  : TT3UnitContainer;
    FLaunchMethod     : TTorpedoLaunchMethod;

    FCycleUpdateAltitude    : double; // second
    FOrderedHeadingAchieved : boolean;
    FTorpedoDefinition      : TTorpedo_On_Board;

    {sinuationmove}
    FOrderedSinuation   : Double;
    FSinuationtemp_PosX : Double;
    FSinuationtemp_PosY : Double;

    {spiralmove}
    FSpiral : Single;
    TerminalCircleInDegree : double;
    Sudutawal : Double;

    isFirstSinuation : Boolean;
    isLeftSinuation  : Boolean;
    isStartSinuation : Boolean;
    isRightSinuation : Boolean;
    FPointHybrid: t2DPoint;
    FRunOutMode: Byte;
    FTargetInstanceIndex: Integer;

    function isSeekerOn: boolean;
    function searchTarget: TSimObject;
    function isWireBreak(PlatformHeading: Double): boolean;
    function isCloseIn(target: TSimObject): boolean;
    function isWHTargetCheck(target: TSimObject): boolean;
    function isSRTargetCheck(target: TSimObject): boolean;
    function isAPGTargetCheck(target: TSimObject): boolean;
    function isWGTargetCheck(target: TSimObject): boolean;

    {$IFDEF SERVER}
    function CalcHitSomething : TSimObject;
    function CalcPOH(pf : TSimObject) : boolean;
    {$ENDIF}

    function calcCrossSection(pf : TSimObject) : double;
    function TargetCheck(target: TSimObject): boolean;

    procedure SetTargetInstanceIndex(const Value: integer);
    procedure SetLethality(const Value: integer);
    procedure SetTargetCourse(const Value: double);
    procedure SetTargetPosition(const Value: t3DPoint);
    procedure SetTargetSpeed(const Value: double);
    procedure SettargetDomain(const Value: double);
    procedure SetTargetAltitude(const Value: double);
    procedure SetSearchRadius(const Value: double);
    procedure SetSearchDepth(const Value: double);
    procedure SetSafetyCeiling(const Value: double);
    procedure SetSeekerRange(const Value: double);
    procedure SetOrderedAltitude(const Value : double);
    procedure SetOrderedHeading(const Value: double);
    procedure SetTargetPlatforms(const Value: TT3UnitContainer);
    procedure SetOwner(const Value: TSimObject);
    procedure SetLaunchMethod(const Value: TTorpedoLaunchMethod);
    procedure setGrounded(const Value: boolean);
    procedure setOnLand(const Value: boolean);
    procedure SetLaunchBearing(const Value: double);
    procedure SetTipeTorpedo(const Value: double);
    procedure SetLaunchDelay(const Value: double);
    procedure setLaunchPosition(const Value: t3DPoint);
    procedure SetPointHybrid(const Value: t2DPoint);
    procedure SetRunOutMode(const Value: Byte);

  protected
    function  getAltitude: single;override;
    function  getPos(const Index: Integer): double; override;

    procedure SetInstructor(Const Value: boolean);override;
    procedure SetIsWasdal(const Value: Boolean); override;
    procedure SetLaunched(const Value: boolean);override;
    procedure SetAltitude(const Value: single); override;
    procedure setPos(const Index: Integer; const Value: double); override;
    procedure SetUnitData(const Value: TObject);override;
    procedure SetTargetObject(const Value: TSimObject);override;
    procedure CalcMovement(aDeltaMs: double); override;

  public
    Aimp : t3DPoint;
    IsInittialGuidance : Boolean;
    FSeekerOn : Boolean;
    WireBreak : Boolean;
    ApgLostTarget : Boolean;
    Circle_state : byte;
    MinRangeToTarget : Double;
    WeaponWaypoint : TWeaponWaypoint;
    LauncherIndex : Integer;
    LaunchPlatformHeading : Double;
    EngagementParentID : Integer;
    WireguidedDelay : Integer;
    TargetName : string;
    IsLaunchWithoutTarget : Boolean;

    constructor Create;override;
    destructor  Destroy;override;

    function GetSnapshotData : _SS_TT3Torpedo ;
    procedure SetSnapshotData(const ss : _SS_TT3Torpedo);
    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure Initialize;override;

    {Torpedo move}
    procedure StraigthMove(const aDeltaMs: double);
    procedure ActiveAcousticMove(const aDeltaMs: double);
    procedure PassiveAcousticMove(const aDeltaMs : double);
    procedure WireGuidedMove(const aDeltaMs: double);
    procedure WakeHomingMove(const aDeltaMs: double);
    procedure ActivePassiveMove(const aDeltaMs : double);
    procedure AirDroppedMove(const aDeltaMs : double);
    procedure CircleMove(const aDeltaMs: double);
    procedure SpiralMove(const aDeltaMs: double);
    procedure SinuationMove(const aDeltaMs : double);

    procedure setPositionX(const v: double); override;
    procedure setPositionY(const v: double); override;
    procedure setPositionZ(const v: double); override;
    procedure SetSelected(const Value: boolean); override;
    procedure RepositionTo(const x, y: double); override;
    procedure SetFreeMe(const Value: boolean); override;
    procedure LandCheck(const onLand: boolean; const dMin, dMax: double); override;
    procedure DepthCheck(const Valid: boolean; const dMin, dMax: double);override;

    {air dropped properties}
    property RunOutMode       : Byte read FRunOutMode write SetRunOutMode;
    property Lethality        : integer read FLethality write SetLethality;
    property SearchRadius     : double read FSearchRadius  write SetSearchRadius;    {satuan yards}
    property SearchDepth      : double read FSearchDepth   write SetSearchDepth;     {satuan meter}
    property SafetyCeiling    : double read FSafetyCeiling write SetSafetyCeiling;   {satuan meter}
    property SeekerRange      : double read FSeekerRange   write SetSeekerRange;     {satuan meter}
    property LaunchBearing    : double read FLaunchBearing write SetLaunchBearing;
    property TipeTorpedo      : double read FTipeTorpedo write SetTipeTorpedo;
    property TargetCourse     : double read FTargetCourse write SetTargetCourse;
    property TargetSpeed      : double read FTargetSpeed write SetTargetSpeed;
    property TargetDomain     : double read FTargetDomain write SetTargetDomain;
    property TargetAltitude   : double read FTargetAltitude write SetTargetAltitude;
    property lastHeading      : double read FLastHeading write FLastHeading;
    property OrderedAltitude  : double read FOrderedAltitude  write SetOrderedAltitude;
    property OrderedHeading   : double read FOrderedHeading   write SetOrderedHeading;
    property LaunchDelay      : double read FLaunchDelay write SetLaunchDelay;
    property OrderedSinuation    : Double read FOrderedSinuation write FOrderedSinuation;

    property SeekerOn         : boolean read isSeekerOn;
    property OnGrounded       : boolean read FIsGrounded write setGrounded;
    property OnLand           : boolean read FIsOnLand write setOnLand;

    property TargetInstanceIndex : Integer read FTargetInstanceIndex write SetTargetInstanceIndex;
    property TargetPosition   : t3DPoint read FTargetPosition write SetTargetPosition;
    property TargetPlatforms  : TT3UnitContainer read FTargetPlatforms write SetTargetPlatforms;
//    property Owner            : TSimObject read FOwner write SetOwner;
    property PointHybrid      : t2DPoint read FPointHybrid write SetPointHybrid;
    property LaunchMethod     : TTorpedoLaunchMethod read FLaunchMethod write SetLaunchMethod;
    property TorpedoDefinition: TTorpedo_On_Board read FTorpedoDefinition;

    property LaunchPosition : t3DPoint read FLaunchPosition write setLaunchPosition;

    //Sinuation Move
    property Sinuationtemp_PosX  : Double read FSinuationtemp_PosX write FSinuationtemp_PosX;
    property Sinuationtemp_PosY  : Double read FSinuationtemp_PosY write FSinuationtemp_PosY;

  end;

  TT3TorpedoesOnVehicle = class(TT3Weapon)
  private
    FSalvoSize            : integer;
    FQuantity             : integer;
    FParentPlatformID     : Integer;
    FTargetPlatformID     : Integer;
    FGyroAngle            : Integer;
    FSearchRadius         : double;
    FSearchDepth          : double;
    FSafetyCeiling        : double;
    FSeekerRange          : double;
    FLaunchBearing        : double;
    FTipeTorpedo          : Byte;
    FTubeOn               : Byte;
    FFiringMode           : Byte;
    FRunOutMode           : Byte;
    FButtonLaunch         : Boolean;
    FButtonPlan           : Boolean;
    FEnableLaunchBearing  : Boolean;
    FLaunchWhithoutTarget : Boolean;
    FTargetBearing        : String;
    FTargetTrack          : string;
    FTargetCourse         : string;
    FTargetGroundSpeed    : string;
    FTargetAltitude       : string;
    FTargetIdentity       : string;
    FTorpedoDefinition    : TTorpedo_On_Board;
    FLaunchMethod         : TTorpedoLaunchMethod;

    function CreateProjectile: TT3Torpedo;
    procedure SetFiringMode(const Value: Byte);
    procedure SetRunOutMode(const Value: Byte);
    procedure SetParentPlatformID(const Value: integer);
    procedure SetTargetPlatformID(const Value: integer);
    procedure SetButtonLaunch(const Value: Boolean);
    procedure SetButtonPlan (const Value: Boolean);
    procedure SetQuantity(const Value: integer);
    procedure SetSearchRadius(const Value: double);
    procedure SetSearchDepth(const Value: double);
    procedure SetSafetyCeiling(const Value: double);
    procedure SetSeekerRange(const Value: double);
    procedure SetLaunchBearing(const Value: double);
    procedure SetTipeTorpedo(const Value: Byte);

    procedure SetTargetBearing(const Value: string);
    procedure SetTargetIdentity(const Value: string);
    procedure SetTargetTrack(const Value: string);
    procedure SetTargetCourse(const Value: string);
    procedure SetTargetGroundSpeed(const Value: string);
    procedure SetTargetAltitude(const Value: string);

    procedure SetSalvoSize(const Value: integer);
    procedure SetEnableLaunchBearing(const Value: boolean);
    procedure SetLaunchWhithoutTarget(const Value: boolean);
    procedure SetLaunchMethod(const Value: TTorpedoLaunchMethod);
    procedure SetGyroAngle(const Value: Integer);
    procedure SetTubeOn(const Value: Byte);

  protected
    function getMountType: integer; override;

  public
    constructor Create; override;

    function PrepareLaunch : TT3Torpedo;
    function GetSnapshotData : _SS_TorpedoOnVehicle ;
    function InsideBlindZone(aObject : TSimObject) : boolean; override;
    function OutsideRange(aObject : TSimObject; var id : Integer) : boolean;

    procedure Initialize;override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure SetSnapshotData(const ss : _SS_TorpedoOnVehicle);
    procedure TriggerLauncherListener(Launcher : TObject;Quantity  : Integer);

    function IsTorpedoCapableToTrack(aTarget: TT3PlatformInstance): Boolean;

    {Sync Button}
    property ParentPlatformID : integer read FParentPlatformID write SetParentPlatformID;
    property TargetPlatformID : integer read FTargetPlatformID write SetTargetPlatformID;
    property ButtonLaunch : Boolean read FButtonLaunch write SetButtonLaunch;
    property TipeTorpedo : Byte read FTipeTorpedo write SetTipeTorpedo;

    {wire guided & straight running properties}
    property TargetTrack : string read FTargetTrack write SetTargetTrack;
    property TargetCourse : string read FTargetCourse write SetTargetCourse;
    property TargetGroundSpeed : string read FTargetGroundSpeed write SetTargetGroundSpeed;
    property TargetAltitude : string read FTargetAltitude write SetTargetAltitude;

    {wake homing properties}
    property SalvoSize : integer read FSalvoSize write SetSalvoSize;
    property TargetBearing : String read FTargetBearing write SetTargetBearing;
    property LaunchBearing : Double read FLaunchBearing write SetLaunchBearing;
    property TargetIdentity : string read FTargetIdentity write SetTargetIdentity;

    {air dropped properties}
    property SearchRadius : Double read FSearchRadius write SetSearchRadius;    {satuan nm}
    property SearchDepth : Double read FSearchDepth write SetSearchDepth;       {satuan meter}
    property SafetyCeiling : Double read FSafetyCeiling write SetSafetyCeiling; {satuan meter}
    property SeekerRange : Double read FSeekerRange write SetSeekerRange;       {satuan nm}
    property EnableLaunchBearing: boolean read FEnableLaunchBearing write SetEnableLaunchBearing;
    property LaunchWhithoutTarget: boolean read FLaunchWhithoutTarget write SetLaunchWhithoutTarget;

    {Acoustic properties}
    property FiringMode: Byte read FFiringMode write SetFiringMode;
    property RunOutMode: Byte read FRunOutMode write SetRunOutMode;
    property GyroAngle: Integer read FGyroAngle write SetGyroAngle;
    property TubeOn: Byte read FTubeOn write SetTubeOn;
    property ButtonPlan : Boolean read FButtonPlan write SetButtonPlan;

    property Quantity : integer read FQuantity write SetQuantity;

    property LaunchMethod       : TTorpedoLaunchMethod read FLaunchMethod write SetLaunchMethod;
    property TorpedoDefinition  : TTorpedo_On_Board read FTorpedoDefinition;

  end;

implementation

uses uDBAsset_MotionCharacteristics, uBaseCoordSystem,
  uDataModuleTTT, uLibSettingTTT, uCoordConvertor,
  uT3Vehicle, uDBAsset_Vehicle, uT3CounterMeasure,
  newClassASTT, uFilter;

const
  //cirlce
  cstateStraight = 1;
  cstateCircle = 2;

{ TT3TorpedoesOnVehicle }

function getDeltaH(const  dst, src: double): double;
begin
    result := dst - src;
  if result < -180.0 then
    result := result + 360.0
  else
    if result > 180.0 then
      result := result - 360.0;
end;

constructor TT3TorpedoesOnVehicle.Create;
begin
  inherited;

  FLaunchBearing        := 0;
  FEnableLaunchBearing  := False;
  FSalvoSize            := 1;
end;

procedure TT3TorpedoesOnVehicle.Draw(aCnv: tCanvas);
begin
  inherited;

end;

function TT3TorpedoesOnVehicle.getMountType: integer;
begin
  result := FTorpedoDefinition.FData.Mount_Type;
end;

procedure TT3TorpedoesOnVehicle.Initialize;
var
  i       : integer;
  blindZ  : TBlindZoneVisual;
  rec     : TMotion_Characteristics;
begin
  inherited;

  rec := nil;

  {Memindah Semua data yg ada di dbase ke FTorpedoDefinition -> FDef}
  if Assigned(UnitDefinition) then
    FTorpedoDefinition := TTorpedo_On_Board(UnitDefinition);

  if Assigned(FTorpedoDefinition) then
  begin
    with FTorpedoDefinition do
    begin

      {Set katagori torpedo}
      FWeaponCategory := TWeapoonCategory(FDef.Guidance_Type);
//      case FDef.Guidance_Type of
//        0  : FWeaponCategory := wcTorpedoStraigth;
//        1 : FWeaponCategory := wcTorpedoActiveAcoustic;
//        2 : FWeaponCategory := wcTorpedoPassiveAcoustic;
//        3 : FWeaponCategory := wcTorpedoActivePassive;
//        4 : FWeaponCategory := wcTorpedoWireGuided;
//        5 : FWeaponCategory := wcTorpedoWakeHoming;
//      end;
      if Assigned(Parent) then
      begin
        if TT3PlatformInstance(Parent).PlatformDomain = vhdAir then
          FWeaponCategory := wcTorpedoAirDropped;
      end;

      {Set Method launch torpedo}
//      case FDef.Launch_Method of
//        0 : FLaunchMethod := tlmAimpoint;
//        1 : FLaunchMethod := tlmBearing;
//        2 : FLaunchMethod := tlmAimBearing;
//        3 : FLaunchMethod := tlmDirect;
//      end;
      FLaunchMethod := TTorpedoLaunchMethod(FDef.Launch_Method);

      if FBlind.Count > 0 then
      begin
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

      InstanceName := FData.Instance_Identifier;
      InstanceIndex := FData.Fitted_Weap_Index;
      Quantity := FData.Quantity;
      WeaponRange := FDef.Max_Range;

      SearchDepth   := FDef.Default_Depth * C_Feet_To_Meter;
      SafetyCeiling := FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter;
      SeekerRange   := FDef.Seeker_TurnOn_Range;
      SearchRadius  := FDef.Terminal_Circle_Radius;

      FDamageStatus.DamageCapacity :=  FDef.Damage_Capacity;

      {Set Damage weapon torpedo}
      Health := FDef.Damage_Capacity - UnitActivation.Damage;

      rec := nil;
      dmTTT.GetMotionCharacteristicDef(FDef.Motion_Index,rec);
      UnitMotion := rec;
    end;
  end;

  // update rel start start-end angle
  for I := 0 to FBlindView.Count - 1 do
  begin
    blindZ := TBlindZoneVisual(FBlindView.Items[i]);
    blindZ.Ranges := WeaponRange;

    if Assigned(FParent) then begin
      blindZ.Heading:= TT3PlatformInstance(FParent).Course;
      blindZ.mX     := FParent.getPositionX;
      blindZ.mY     := FParent.getPositionY;
    end;

    blindZ.UpdateRelatifAngle;
  end;
end;

function TT3TorpedoesOnVehicle.InsideBlindZone(aObject: TSimObject): boolean;
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

function TT3TorpedoesOnVehicle.OutsideRange(aObject: TSimObject; var id : Integer): boolean;
var
  rangetotarget : double;
begin
  result := false;

  rangetotarget := CalcRange(FPosition.X, FPosition.Y, TT3PlatformInstance(aObject).getPositionX, TT3PlatformInstance(aObject).getPositionY);

  {jk method launchnya bukan bearing launch atau aimbearing periksa}
  if not ((LaunchMethod = tlmBearing) or (LaunchMethod = tlmAimBearing)) then
  begin
    if (rangetotarget < TorpedoDefinition.FDef.Min_Range) then
    begin
      result := True;
      id := 0;
    end
    else if (rangetotarget > TorpedoDefinition.FDef.Max_Range) then
    begin
      result := True;
      id := 1;
    end;
  end;
end;

function TT3TorpedoesOnVehicle.IsTorpedoCapableToTrack(aTarget: TT3PlatformInstance): Boolean;
begin
  Result := False;

  case aTarget.PlatformDomain of //if platformdomain = Air; 0 = Air, 1 = Surface, 2 = Subsurface
    1:
    begin
      if Self.TorpedoDefinition.FDef.Anti_Sur_Capable = 1 then
        Result := True;
    end;
    2:
    begin
      if Self.TorpedoDefinition.FDef.Anti_SubSur_Capable = 1 then
        Result := True;
    end;
  end;
end;

function TT3TorpedoesOnVehicle.CreateProjectile: TT3Torpedo;
var
  projectil : TT3Torpedo;
  tPt : t3DPoint;
  behav : TScripted_Behav_Definition; //add
begin
  {Set variabel2 awal torpedo}
  projectil := TT3Torpedo.Create;

  behav     := TScripted_Behav_Definition.Create;
  projectil.WeaponWaypoint.Add(behav, nil);  //add
  projectil.WeaponWaypoint.ApplyWeaponWaypoint;
  projectil.WeaponWaypoint.Owner := projectil;

  projectil.Parent := FParent;
  projectil.Owner := FParent;

  {Set Motion Characteristic dr dbase}
  projectil.UnitMotion      := UnitMotion;
  {Set Data dr dbase}
  projectil.UnitDefinition  := UnitDefinition;

  {Set utk tampilan saja}
  projectil.UnitGroup := UnitGroup;
  projectil.Enable := Enable;
  projectil.Track_ID := 'TOR';
  projectil.PlatformType := vhtTorpedo;
  projectil.Force_Designation := TT3PlatformInstance(FParent).Force_Designation;

  {harusnya g pake, sudah ada di unitDefinition -> FTorpedoDefinition}
  projectil.LaunchMethod := LaunchMethod;

  if Assigned(FParent) then
  begin
    if WeaponCategory = wcTorpedoAirDropped then
    begin
      if LaunchWhithoutTarget then
        projectil.LaunchBearing := TT3PlatformInstance(Parent).Heading
      else
        projectil.LaunchBearing := LaunchBearing;

      projectil.IsLaunchWithoutTarget := LaunchWhithoutTarget;
      projectil.WeaponCategory  := WeaponCategory;
    end
    else
    begin
      projectil.WeaponCategory  := WeaponCategory;
      projectil.LaunchBearing := LaunchBearing;
    end;
  end;

  {$REGION ' Set Search Radius -> radius berputarnya torpedo '}
  if Boolean(TorpedoDefinition.FDef.Use_Terminal_Circle) then
  begin
    if TorpedoDefinition.FDef.Fixed_Circle_Radius = 1 then
      projectil.SearchRadius := SearchRadius
    else
      projectil.SearchRadius := TorpedoDefinition.FDef.Terminal_Circle_Radius;
  end
  else
    projectil.SearchRadius := 0;
  {$ENDREGION}

  {$REGION ' Set Search Depth -> batas bawah search torpedo '}
  if (WeaponCategory = wcTorpedoWireGuided) then
  begin
    projectil.SearchDepth := TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter
  end
  else
  begin
    {jk lebih besar dr max depth, kedalaman dset max depth}
    if SearchDepth >  Round(TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter) then
      projectil.SearchDepth := TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter
    else
      projectil.SearchDepth := SearchDepth;
  end;
  {$ENDREGION}

  {$REGION ' Set Safety Ceiling -> batas atas search torpedo '}
  if (WeaponCategory = wcTorpedoWireGuided) then
  begin
    projectil.SafetyCeiling := Round(0 * C_Feet_To_Meter);
  end
  else
  begin
    if (TorpedoDefinition.FDef.Fixed_Ceiling_Depth = 0) then
      projectil.SafetyCeiling := SafetyCeiling
    else
      projectil.SafetyCeiling := TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter;
  end;
  {$ENDREGION}

  {$REGION ' Set SeekerRange -> jarak torpedo menyalakan seeker '}
  if not Boolean(TorpedoDefinition.FDef.Fixed_Seeker_TurnOn_Range) then
    projectil.SeekerRange := TorpedoDefinition.FDef.Seeker_TurnOn_Range
  else
    projectil.SeekerRange := SeekerRange;
  {$ENDREGION}

  projectil.RunOutMode := 1; {0: No RunOut; 1: RunOut}
  projectil.isInstructor    := TT3PlatformInstance(FParent).isInstructor;
  projectil.isWasdal        := TT3PlatformInstance(FParent).isWasdal;
  projectil.LauncherIndex   := TorpedoDefinition.FData.Fitted_Weap_Index;

  {Heading kapal saat peluncuran torpedo -> utk wirebreak}
  projectil.LaunchPlatformHeading := TT3PlatformInstance(FParent).Course;

  if Assigned(TargetObject) then
  begin
    projectil.TargetObject    := TargetObject;

    tPt.X                     := TargetObject.getPositionX;
    tPt.y                     := TargetObject.getPositionY;
    tPt.Z                     := TargetObject.getPositionZ;

    projectil.TargetPosition  := tPt;

    if LaunchWhithoutTarget then
      projectil.TargetCourse      := projectil.LaunchBearing
    else
      projectil.TargetCourse      := TT3PlatformInstance(TargetObject).Course;

    projectil.TargetSpeed         := TT3PlatformInstance(TargetObject).Speed;
    projectil.TargetAltitude      := TT3PlatformInstance(TargetObject).Altitude;
    projectil.TargetInstanceIndex := TT3PlatformInstance(TargetObject).InstanceIndex;
  end;

  projectil.Initialize;
  result := projectil;
end;

function TT3TorpedoesOnVehicle.PrepareLaunch: TT3Torpedo;
var
  projectil : TT3Torpedo;
begin
  result    := nil;

  if not Assigned(TargetObject) then exit;
  if not (Quantity > 0) then exit;

  projectil := CreateProjectile;
  result    := projectil;

  //Quantity  := Quantity - 1;
end;

procedure TT3TorpedoesOnVehicle.SetButtonLaunch(const Value: Boolean);
begin
  FButtonLaunch := Value;
end;

procedure TT3TorpedoesOnVehicle.SetButtonPlan(const Value: Boolean);
begin
  FButtonPlan := Value;
end;

procedure TT3TorpedoesOnVehicle.SetEnableLaunchBearing(const Value: boolean);
begin
  FEnableLaunchBearing := Value;
end;

procedure TT3TorpedoesOnVehicle.SetFiringMode(const Value: Byte);
begin
  FFiringMode := Value;
end;

procedure TT3TorpedoesOnVehicle.SetGyroAngle(const Value: Integer);
begin
  FGyroAngle := Value;
end;

procedure TT3TorpedoesOnVehicle.SetLaunchBearing(const Value: double);
begin
  FLaunchBearing := Value;
end;

procedure TT3TorpedoesOnVehicle.SetLaunchMethod(
  const Value: TTorpedoLaunchMethod);
begin
  FLaunchMethod := Value;
end;

procedure TT3TorpedoesOnVehicle.SetLaunchWhithoutTarget(const Value: boolean);
begin
  FLaunchWhithoutTarget := Value;
end;

procedure TT3TorpedoesOnVehicle.SetParentPlatformID(const Value: integer);
begin
  FParentPlatformID := Value;
end;

procedure TT3TorpedoesOnVehicle.SetQuantity(const Value: integer);
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

procedure TT3TorpedoesOnVehicle.SetRunOutMode(const Value: Byte);
begin
  FRunOutMode := Value;
end;

procedure TT3TorpedoesOnVehicle.SetSafetyCeiling(const Value: double);
begin
  FSafetyCeiling := Value;
end;

procedure TT3TorpedoesOnVehicle.SetSalvoSize(const Value: Integer);
begin
  FSalvoSize := Value;
end;

procedure TT3TorpedoesOnVehicle.SetSearchDepth(const Value: double);
begin
  FSearchDepth := Value;
end;

procedure TT3TorpedoesOnVehicle.SetSearchRadius(const Value: double);
begin
  FSearchRadius := Value;
end;

procedure TT3TorpedoesOnVehicle.SetSeekerRange(const Value: double);
begin
  FSeekerRange := Value;
end;

procedure TT3TorpedoesOnVehicle.UpdateVisual;
begin
  inherited;

  if not Assigned(Parent) then exit;

  FPosition.X := Parent.getPositionX;
  FPosition.Y := Parent.getPositionY;
  FPosition.Z := Parent.getPositionZ;
end;

function TT3TorpedoesOnVehicle.GetSnapshotData : _SS_TorpedoOnVehicle ;
var
    i  : integer ;
    ss : _SS_TorpedoOnVehicle ;
    weaponScript  : TScripted_Weapon ;
    pattern       : TPattern_Weapon ;
    blind         : TBlind_Zone;
    poh           : TTorpedo_POH_Modifier;
begin
    if Parent <> nil then
      ss.Owner  := TT3Unit(Parent).InstanceIndex ;

    ss.W := TT3Weapon(Self).GetSnapshotData ;
    ss.TorpedoDefinition.FData        := TorpedoDefinition.FData     ;
    ss.TorpedoDefinition.FDef         := TorpedoDefinition.FDef      ;
    ss.TorpedoDefinition.FNote        := TorpedoDefinition.FNote ;
    ss.SalvoSize                      := SalvoSize                   ;
    ss.SearchRadius                   := SearchRadius                ;
    ss.SearchDepth                    := SearchDepth                 ;
    ss.SafetyCeiling                  := SafetyCeiling               ;
    ss.SeekerRange                    := SeekerRange                 ;

    ss.Quantity                       := Quantity                    ;
    ss.LaunchBearing                  := LaunchBearing               ;
    ss.EnableLaunchBearing            := EnableLaunchBearing         ;
    ss.LaunchMethod                   := byte(LaunchMethod)          ;

    if TorpedoDefinition.FScript_Torpedo <> nil then begin
      SetLength(ss.TorpedoDefinition.FScript_Torpedo,TorpedoDefinition.FScript_Torpedo.Count);
      for I := 0 to TorpedoDefinition.FScript_Torpedo.Count - 1 do
      begin
          weaponScript := TScripted_Weapon(TorpedoDefinition.FScript_Torpedo[i]) ;
          if weaponScript <> nil then
          begin
            ss.TorpedoDefinition.FScript_Torpedo[i].Event := weaponScript.Event.FData ;
            ss.TorpedoDefinition.FScript_Torpedo[i].Behav := weaponScript.Behav.FData ;
          end;
      end;
    end;

    if TorpedoDefinition.FPattern_Torpedo <> nil then begin
      SetLength(ss.TorpedoDefinition.FPattern_Torpedo,TorpedoDefinition.FPattern_Torpedo.Count);
      for I := 0 to TorpedoDefinition.FPattern_Torpedo.Count - 1 do
      begin
          pattern := TPattern_Weapon(TorpedoDefinition.FPattern_Torpedo[i]) ;
          if pattern <> nil then
          begin
            ss.TorpedoDefinition.FPattern_Torpedo[i].Event := pattern.Event.FData ;
            ss.TorpedoDefinition.FPattern_Torpedo[i].Pattern := pattern.Pattern.FData ;
          end;
      end;
    end;

    if TorpedoDefinition.FBlind <> nil then begin
      SetLength(ss.TorpedoDefinition.FBlind,TorpedoDefinition.FBlind.Count);
      for I := 0 to TorpedoDefinition.FBlind.Count - 1 do
      begin
          blind := TBlind_Zone(TorpedoDefinition.FBlind[i]) ;
          if blind <> nil then
            ss.TorpedoDefinition.FBlind[i].FData := blind.FData;
      end;
    end;

    if TorpedoDefinition.FAspectPOH <> nil then begin
      SetLength(ss.TorpedoDefinition.FAspectPOH,TorpedoDefinition.FAspectPOH.Count);
      for I := 0 to TorpedoDefinition.FAspectPOH.Count - 1 do
      begin
          poh := TTorpedo_POH_Modifier(TorpedoDefinition.FAspectPOH[i]) ;
          if poh <> nil then
            ss.TorpedoDefinition.FAspectPOH[i].FData := poh.FData;
      end;
    end;

    Result := ss ;
end;

procedure TT3TorpedoesOnVehicle.SetSnapshotData(const ss : _SS_TorpedoOnVehicle);
begin
    TT3Weapon(Self).SetSnapshotData(ss.W) ;
    TorpedoDefinition.FData        := ss.TorpedoDefinition.FData     ;
    TorpedoDefinition.FDef         := ss.TorpedoDefinition.FDef      ;
    SalvoSize                      := ss.SalvoSize                   ;
    SearchRadius                   := ss.SearchRadius                ;
    SearchDepth                    := ss.SearchDepth                 ;
    SafetyCeiling                  := ss.SafetyCeiling               ;
    SeekerRange                    := ss.SeekerRange                 ;

    Quantity                       := ss.Quantity                    ;
    LaunchBearing                  := ss.LaunchBearing               ;
    EnableLaunchBearing            := ss.EnableLaunchBearing         ;
    LaunchMethod                   := TTorpedoLaunchMethod(ss.LaunchMethod);
end;

procedure TT3TorpedoesOnVehicle.SetTargetAltitude(const Value: string);
begin
  FTargetAltitude := Value;
end;

procedure TT3TorpedoesOnVehicle.SetTargetBearing(const Value: string);
begin
  FTargetBearing := Value;
end;

procedure TT3TorpedoesOnVehicle.SetTargetCourse(const Value: string);
begin
  FTargetCourse := Value;
end;

procedure TT3TorpedoesOnVehicle.SetTargetGroundSpeed(const Value: string);
begin
  FTargetGroundSpeed := Value;
end;

procedure TT3TorpedoesOnVehicle.SetTargetIdentity(const Value: string);
begin
  FTargetIdentity := Value;
end;

procedure TT3TorpedoesOnVehicle.SetTargetPlatformID(const Value: integer);
begin
  FTargetPlatformID := Value;
end;

procedure TT3TorpedoesOnVehicle.SetTargetTrack(const Value: string);
begin
  FTargetTrack := Value;
end;

procedure TT3TorpedoesOnVehicle.SetTipeTorpedo(const Value: Byte);
begin
  FTipeTorpedo := Value;
end;

procedure TT3TorpedoesOnVehicle.SetTubeOn(const Value: Byte);
begin
  FTubeOn := Value;
end;

procedure TT3TorpedoesOnVehicle.TriggerLauncherListener(Launcher: TObject;
  Quantity: Integer);
var
  i : integer;
  l : TObject;
begin
  for i := 0 to FListenerList.Count - 1 do begin
    l := FListenerList.Items[i];
    if l is TT3TorpedoOnVehicleListener then
      TT3TorpedoOnVehicleListener(l).OnPropertyLauncherChange(Self,Launcher,Quantity);
  end;
end;

{ TT3Torpedo }
{$IFDEF SERVER}
function TT3Torpedo.CalcHitSomething : TSimObject;
var
  i  : integer;
  pf : TSimObject;
  isHit : boolean;
  range : double;
begin
  result := nil;
  i := 0;

  while (i < FTargetPlatforms.itemCount) do
  begin
    pf := FTargetPlatforms.getObject(i);
    inc(i);
    result := nil;
    isHit  := false;

    { Jk self diabaikan }
    if pf = self then continue;

    { Jk obyek werk diabaikan }
    if TT3PlatformInstance(pf).Dormant then continue;

    { Jk platform bukan target yg benar }
    if not TargetCheck(pf) then continue;

    if IsInsideCircle(FPosition.X,FPosition.Y,TT3PlatformInstance(pf).getPositionX,
       TT3PlatformInstance(pf).getPositionY,5, FPosition.Z,TT3PlatformInstance(pf).getPositionZ,1) then
    begin
      { avoiding hit carrier platform at first launch }
      range := CalcRange(FLaunchPosition.X,FLaunchPosition.Y,FPosition.X,FPosition.Y) * C_NauticalMile_To_Metre;
      if (range <= 50) and (pf = Owner) then continue;

      {Syarat tambahan tiap torpedo}
      case FWeaponCategory of
        wcTorpedoActivePassive, wcTorpedoWakeHoming, wcTorpedoActiveAcoustic, wcTorpedoPassiveAcoustic, wcTorpedoWireGuided, wcTorpedoAirDropped :
        begin
          if (not Assigned(FLockTarget)) and
          (not IsInsideCircle(FPosition.X,FPosition.Y,TT3PlatformInstance(pf).getPositionX, TT3PlatformInstance(pf).getPositionY,
             1, FPosition.Z,TT3PlatformInstance(pf).getPositionZ,1)) then
            Continue;
        end;
      end;

      if (pf is TT3Vehicle) or (pf is TT3Weapon) then isHit := true;

      if isHit then
      begin
        result := pf;
        setPositionX(TT3PlatformInstance(pf).getPositionX);
        setPositionY(TT3PlatformInstance(pf).getPositionY);
        setPositionZ(TT3PlatformInstance(pf).getPositionZ);
        exit;
      end;
    end;
  end;
end;
{$ENDIF}

procedure TT3Torpedo.CalcMovement(aDeltaMs: double);
var
  bearingToTarget,
  Max_Ground_Speed : double;
begin
  // starting move missile here
  FCycleUpdateAltitude := FCycleUpdateAltitude + aDeltaMs;

  if FNeedAdjust then
  begin
    bearingToTarget := CalcBearing(FPosition.X, FPosition.Y, FTargetPosition.X,FTargetPosition.Y);

    FDeltaHead := getDeltaH(bearingToTarget, Course);

    if (Abs(FDeltaHead) > 1) then
    begin
      if (WeaponCategory = wcTorpedoAirDropped) or (WeaponCategory = wcTorpedoWakeHoming) then
      begin
        SetOrderedHeading(LaunchBearing);
        FNeedAdjust := false;
      end
      else if (WeaponCategory = wcTorpedoWireGuided)  then
      begin
        case TTorpedoPursuit(TorpedoDefinition.FDef.Pursuit_Guidance_Type) of
          tpLead: {Lead}
          begin
            SetOrderedHeading(OrderedHeading);
            FNeedAdjust := false;
          end;
          tpPure: {Pure}
          begin

          end;
        end;
      end
      else
        SetOrderedHeading(bearingToTarget)
    end
    else
    begin
      Course := bearingToTarget;
      FNeedAdjust := false;
    end;
  end;

  if FIsGrounded or FIsOnLand then
  begin
//    FreeChilds;
//    FreeMe := true;
//    AbsoluteFree := True;
  end;

  if not Assigned(UnitMotion) then
    Max_Ground_Speed := 0
  else
    Max_Ground_Speed := UnitMotion.FData.Max_Ground_Speed ;

  if (FMover.Speed >= Max_Ground_Speed) then
  begin
    FMover.Speed        := Max_Ground_Speed;
    FMover.Acceleration := 0.0;
  end;

  FDeltaHead := getDeltaH(FOrderedHeading, Course);
  if (FHeadingState = mcsDecrease) then begin
    if FDeltaHead <= 0  then begin
      FMover.TurnRate := 0.0;
      FHeadingState   := mcsStable;
      Course          := FOrderedHeading;
    end;
  end
  else if (FHeadingState = mcsIncrease) then begin
    // turn left
    if FDeltaHead >= 0  then begin
      FMover.TurnRate := 0.0;
      FHeadingState   := mcsStable;
      Course          := FOrderedHeading;
    end;
  end;

  if FAltitudeState = mcsIncrease then begin
    if FMover.Z >= FOrderedAltitude then begin
      FMover.Z := FOrderedAltitude;
      FMover.Vertical_Accel := 0.0;
      FMover.VerticalSpeed  := 0.0;
      FMover.ClimbRate      := 0;
      FMover.DescentRate    := 0;
      FAltitudeState        := mcsStable;
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

{$IFDEF SERVER}
  function TT3Torpedo.CalcPOH(pf : TSimObject): boolean;
  var
    aspectPOH : TObject;
    i, aspect : integer;
    bearing, course, diff : double;
    pohMod, poh, mpoh : double;
  begin
    if (not Assigned(pf)) or (FPOH.Count = 0) then
    begin
      result := true;
      exit;
    end;

    bearing := CalcBearing(FPosition.X,FPosition.Y,pf.getPositionX, pf.getPositionY);
    course  := TT3PlatformInstance(pf).Course;

    {*
      aspect dependent identifier check...
      0 : 330 - 30 deg
      1 : 30 - 90 deg or 270 - 330 deg
      2 : 90 - 150 deg or 210 - 270 deg
      3 : 150 - 210 deg
    *}

    poh := 1;  // default 100%
    diff := bearing - course;
    if diff < -180.0 then
      diff := diff + 360.0
    else
      if diff > 180.0 then
        diff := diff - 360.0;

    if ((diff >= 30) and (diff < 90)) or
       ((diff >= 270) and (diff < 330))
      then aspect := 1
    else
    if ((diff >= 90) and (diff < 150)) or
       ((diff >= 210) and (diff < 270))
      then aspect := 2
    else
    if ((diff >= 150) and (diff < 210))
      then aspect := 3
    else aspect := 0;

    for I := 0 to FPOH.Count - 1 do begin
      aspectPOH := FPOH.Items[i];
      if Assigned(aspectPOH) then
        if TTorpedo_POH_Modifier(aspectPOH).FData.Aspect_Angle = aspect then begin
          poh := TTorpedo_POH_Modifier(aspectPOH).FData.POH_Modifier;
          break;
        end;
    end;
    {--end aspect dependent POH--}

    {-- POH modifier for each torpedo category }
    pohMod := 0;
    case FWeaponCategory of
      wcTorpedoStraigth       : pohMod := -1;
      wcTorpedoActiveAcoustic : pohMod := TTorpedo_On_Board(UnitDefinition).FDef.Active_Acoustic_POH_Mod;
      wcTorpedoPassiveAcoustic: pohMod := TTorpedo_On_Board(UnitDefinition).FDef.Passive_Acoustic_POH_Mod;
      wcTorpedoWireGuided     : pohMod := TTorpedo_On_Board(UnitDefinition).FDef.WireGuide_POH_Modifier;
      wcTorpedoWakeHoming     : pohMod := TTorpedo_On_Board(UnitDefinition).FDef.WakeHome_POH_Modifier;
      wcTorpedoActivePassive  : pohMod := TTorpedo_On_Board(UnitDefinition).FDef.Active_Passive_POH_Mod;
    end;

    mpoh := poh - pohMod;

    { POH }
    result := Random <= mpoh;
  end;
{$ENDIF}

procedure TT3Torpedo.CircleMove(const aDeltaMs: double);
var
  mx,my,
  RangeToRunOut, RangeToAimp, RealDistance,
  heading_now, CircleDirection : double;
begin
  CircleDirection := -10;

  {Cek apakah torpedo RunOut}
  if RunOutMode = 1 then
    RangeToRunOut := SeekerRange/ C_NauticalMile_To_Yards
  else
    RangeToRunOut := 0;

  {jika pernah lock target dan lepas}
  if ApgLostTarget then
    RangeToRunOut := SearchRadius / C_NauticalMile_To_Yards;

  RealDistance := CalcRange(PosX, PosY, FLaunchPosition.X, FLaunchPosition.Y);

  if Circle_state = cstateStraight then
  begin
    if RealDistance > RangeToRunOut then
    begin
      RangeToAimp := SearchRadius / C_NauticalMile_To_Yards;
      RangeBearingToCoord(RangeToAimp, Course, mx, my);
      Aimp.X := PosX + mx;
      Aimp.Y := PosY + my;

      Circle_state    := cstateCircle;

      {heading diset muter ke kiri dulu}
      FOrderedHeading := Course + 20;
      if FOrderedHeading > 360 then
        FOrderedHeading := FOrderedHeading - 360;
    end;
  end
  else
  begin
    SetOrderedHeading(FOrderedHeading);

    if FOrderedHeadingAchieved then
    begin
      heading_now := CalcBearing(Aimp.X, Aimp.Y, PosX, PosY) + CircleDirection;

      if heading_now > 360 then
        heading_now := heading_now - 360
      else if heading_now < 0 then
        heading_now := heading_now + 360;

      FOrderedHeading := heading_now;
      LastHeading     := FOrderedHeading;
    end;

    {pergerakan torpedo diset naik turun sesuai batas atas n batas bawah}
    if Altitude >= SearchDepth then
      SetOrderedAltitude(SafetyCeiling)
    else
      if Altitude <= SafetyCeiling then
        SetOrderedAltitude(SearchDepth);
  end;
end;

constructor TT3Torpedo.Create;
begin
  inherited;
  FPOH            := Tlist.Create;
  FMover          := T2DMover.Create;
  WeaponWaypoint  := TWeaponWaypoint.Create; //mk add

  FAltitudeState  := mcsStable;
  FSpeedState     := mcsStable;
  FHeadingState   := mcsStable;

  FLockTarget           := nil;
  FTargetAltitude       := 0;
  FCycleUpdateAltitude  := 2.00; //second

  IsInittialGuidance := True;
  FisCounterDelay := false;
  FLaunching      := false;
  FSeekerOn       := false;
  FEngageTarget   := false;
  FNeedAdjust     := true;
  FOrderedHeadingAchieved := true;

  {Variabel utk pergerakan circle}
  Circle_state := cstateStraight;
  ApgLostTarget := False;

  {Variable utk pergerakan sinuation}
  isFirstSinuation := True;
  isLeftSinuation := True;
  isStartSinuation := False;
  isRightSinuation := False;
  isLaunchWithoutTarget := False;

  {Variabel utk wire guided}
  WireBreak := False;
//  FEngageTargetSucced     := false;
//  FSeekAltitudeOnce       := false;
//  FOrderedSpeedAchieved   := true;
end;

procedure TT3Torpedo.DepthCheck(const Valid: boolean; const dMin, dMax: double);
var
  depm : double;
begin
  inherited;
  if Valid then begin
    depm := getAltitude;
    OnGrounded := (depm > dMax);

    if OnGrounded then
    begin
      Self.reasonDestroy := 4;
      FreeChilds;
      FreeMe := true;
      AbsoluteFree := True;
    end;
  end;
end;

procedure TT3Torpedo.LandCheck(const onLand: boolean; const dMin, dMax: double);
begin
  inherited;
  if onLand then
  begin
    FIsOnLand := onLand ;
    Self.reasonDestroy := 4;
    FreeChilds;
    FreeMe := true;
    AbsoluteFree := True;
  end;
end;

destructor TT3Torpedo.destroy;
begin
  inherited;
end;

procedure TT3Torpedo.Draw(aCnv: tCanvas);
var
  X1, Y1, X2, Y2 : integer;
begin
  inherited;

  FTacticalSymbol.isVehicle := false;

  if not vFilter.Show(pftSubsurface, 'Torpedo', 'Weapon engagements') then
    Exit;

  if not Visible then Exit;

  if FLaunching then
  begin
    if FIsOnLand or FIsGrounded then
    begin
      FSeekerOn := False;
      FTacticalSymbol.SpeedVector.Visible := False;
    end
    else
    begin
      FTacticalSymbol.SpeedVector.Visible := True;
    end;

    FTacticalSymbol.SpeedVector.Speed   := 40;
    FTacticalSymbol.SpeedVector.Course  := Course;
    FTacticalSymbol.SpeedVector.Color   := FTacticalSymbol.Color;

    FTacticalSymbol.Seeker.Azimuth := TorpedoDefinition.FDef.Term_Guide_Azimuth;
    FTacticalSymbol.Seeker.Bearing := Course;
    FTacticalSymbol.Seeker.Tipe := 1;
    FTacticalSymbol.Seeker.Range := TorpedoDefinition.FDef.Term_Guide_Range;

    FTacticalSymbol.SetTextVisibility(Visible);
    FTacticalSymbol.Seeker.Color := FTacticalSymbol.Color;
    FTacticalSymbol.Seeker.Visible := FSeekerOn;

    //mk
    if isInstructor or isWasdal then
      FTacticalSymbol.CallSign1   := '+' + Track_ID
    else
      FTacticalSymbol.CallSign1   := '+' + IntToStr(TrackNumber);

    FTacticalSymbol.SetTextColor(FTacticalSymbol.Color);
    FTacticalSymbol.Visible             := Visible;
    FTacticalSymbol.Draw(aCnv);

    FSignPlatform.Visible               := Visible;
    FSignPlatform.Color                 := FTacticalSymbol.Color;
    FSignPlatform.Draw(aCnv);
  end;

  if Planned then begin
    Converter.ConvertToScreen(FTargetPosition.X,FTargetPosition.Y,X1,Y1);
    Converter.ConvertToScreen(getPositionX,getPositionY,X2,Y2);

    with aCnv do begin
      Pen.Color := clSilver;
      Pen.Style := psSolid;
      Pen.Width := 1;

      MoveTo(X1,Y1);
      LineTo(X2,Y2);
    end;
  end;

end;

function TT3Torpedo.getAltitude: single;
begin
  Result := FMover.Z  * C_Degree_To_NauticalMile * C_NauticalMile_To_Metre;
end;

function TT3Torpedo.getPos(const Index: Integer): double;
begin
  Result := 0;

  try
  case Index of
    1: Result := ConvCartesian_To_Compass(FMover.Direction);
    2: Result := FMover.Speed;
  end;
  except
  end;
end;

procedure TT3Torpedo.Initialize;
var
  i : integer;
  color : TCOlor;
  symbol  : string;
  aspectPOH : TObject;
  mx,my,splashRange,
  Kec, Waktu : Double;
begin
  inherited;

  if (not (Assigned(FParent)) and (WeaponCategory <> wcHybrid) )then  //add 26042012 mk
    Exit;

  if WeaponCategory = wcTorpedoAirDropped then
  begin
    {jarak = kecepatan heli/ (ketinggian heli/ des rate)}
    Kec          := TT3PlatformInstance(Parent).Speed/ C_MS_To_KNOTS;
    Waktu        := (TT3PlatformInstance(Parent).Altitude*C_Meter_To_Feet)/
                    (FTorpedoDefinition.FDef.Airborne_Descent_Rate/60);
    splashRange  := (Kec * Waktu)/C_NauticalMile_To_Metre ;

    RangeBearingToCoord(splashRange,TT3PlatformInstance(Parent).Heading,mx,my);
    FMover.X     := (FParent.getPositionX) + mx;
    FMover.Y     := (FParent.getPositionY) + my;
    FMover.Z     := FParent.getPositionZ;
  end
  else if WeaponCategory = wcHybrid then
  begin
    FMover.X     := (PointHybrid.X);
    FMover.Y     := (PointHybrid.Y);
    FMover.Z     := 0;
    Waktu        := 0;
  end
  else
  begin
    if not Assigned(FParent) then begin
      FMover.X     := UnitActivation.Init_Position_Longitude;
      FMover.Y     := UnitActivation.Init_Position_Latitude;
      FMover.Z     := UnitActivation.Init_Altitude;
    end else begin
      FMover.X     := (FParent.getPositionX);
      FMover.Y     := (FParent.getPositionY);
      FMover.Z     := FParent.getPositionZ;
    end;
    Waktu        := 0;
  end;
  FLaunchDelay    := Round(Waktu);

  FPosition.X     := FMover.X;
  FPosition.y     := FMover.Y;
  FPosition.Z     := FMover.Z;

  {Titik saat torpedo di luncurkan}
  FLaunchPosition.X:= FPosition.X;
  FLaunchPosition.Y:= FPosition.Y;
  FLaunchPosition.Z:= FPosition.Z;

  FMover.Enabled  := true;
  FAltitudeState  := mcsStable;

  if Assigned(UnitDefinition) then
    FTorpedoDefinition := TTorpedo_On_Board(UnitDefinition);

  if isInstructor or isWasdal then            //edit mk 26042012
    symbol := getCorrectSymbol(TT3PlatformInstance(Parent).PlatformDomain,
              TT3PlatformInstance(Parent).PlatformType,
              TT3PlatformInstance(Parent).Force_Designation, color)
  else
    symbol := getCorrectSymbol(FPlatformDomain, PlatformType, 3, color);

  FTacticalSymbol       := TTacticalSymbol.Create;
  FSignPlatform         := TTextVisual.Create;
  FTacticalSymbol.Color := color;
  FTacticalSymbol.SymbolVisual.FontName := 'atct';
  FTacticalSymbol.SymbolVisual.CharSymbol := 'd';
//  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'TorpedoFriend.bmp', color);

  if Assigned(FTorpedoDefinition) then
  begin
    with FTorpedoDefinition do
    begin
      InstanceIndex       := FData.Fitted_Weap_Index;
      InstanceName        := FData.Instance_Identifier;
      Lethality           := FDef.Lethality;

      {Untuk Spiral move}
      FSpiral := 0.001;
      TerminalCircleInDegree := SearchRadius * C_NauticalMile_To_Degree;

      if Assigned(FAspectPOH) then
      begin
        for I := 0 to FAspectPOH.Count - 1 do
        begin
          aspectPOH := FAspectPOH.Items[i];
          FPOH.Add(aspectPOH);  // share object.
        end;
      end;
    end;
  end;
end;

function TT3Torpedo.isAPGTargetCheck(target: TSimObject): boolean;
var
  RangeToTarget : Double;
begin
  Result := False;

  {Mencari target terdekat}
  RangeToTarget := CalcRange(FPosition.X, FPosition.Y, target.getPositionX, target.getPositionY);
  if MinRangeToTarget > RangeToTarget then
  begin
    MinRangeToTarget := RangeToTarget;

    {Keluar dari batas atas dan batas bawah}
    if (TT3PlatformInstance(target).Altitude >= SafetyCeiling) and (TT3PlatformInstance(target).Altitude <= SearchDepth) then
      Result := True;
  end;
end;

function TT3Torpedo.isCloseIn(target: TSimObject): boolean;
begin

end;

function TT3Torpedo.isSeekerOn: boolean;
var
  rangeFromTarget : double;
  rangeFromLaunch : double;
begin
  if FSeekerOn then
    result := FSeekerOn
  else
  begin
    rangeFromTarget := CalcRange(FTargetPosition.X,FTargetPosition.Y,FPosition.X, FPosition.Y);
    rangeFromLaunch := CalcRange(FLaunchPosition.X,FLaunchPosition.Y,FPosition.X, FPosition.Y);
    FSeekerOn       := false;

    { rules :
      - jika launch method aimpoint/target, maka seeker on saat jarak torpedo ke target < seeker_turnon_range
      - jika launch method bearing launch, maka seeker on saat jarak torpedo dari titik penembakan > seeker_turnon_range
      - APG dan Airdrop langsung nyala
      - Hybrid langsung nyala
    }

    case WeaponCategory of
      wcHybrid :
      begin
        FSeekerOn := true;
      end;
      wcTorpedoAirDropped :
      begin
        if IsLaunchWithoutTarget then
        begin
          if rangeFromLaunch > SearchRadius then
            FSeekerOn := true;
        end
        else
        begin
          case FLaunchMethod of
            tlmAimpoint,tlmDirect    :
            begin
              if rangeFromTarget < SeekerRange then
              begin
                FSeekerOn := true;
              end;
            end;
            tlmBearing, tlmAimBearing:
            begin
              if rangeFromLaunch > SeekerRange then
                FSeekerOn := true;
            end;
          end;
        end;
      end;
      wcTorpedoStraigth, wcTorpedoActiveAcoustic, wcTorpedoPassiveAcoustic, wcTorpedoWireGuided, wcTorpedoWakeHoming,  wcTorpedoActivePassive :
      begin
        case FLaunchMethod of
          tlmAimpoint,tlmDirect    :
          begin
            if rangeFromTarget < SeekerRange then
            begin
              FSeekerOn := true;
            end;
          end;
          tlmBearing, tlmAimBearing:
          begin
            if rangeFromLaunch > SeekerRange then
              FSeekerOn := true;
          end;
        end;
      end;
    end;

    if FSeekerOn then
    begin
      if Assigned(OnLogEventStr) then
      begin
        OnLogEventStr('TT3Torpedo.isSeekerOn', 'Seeker On');
      end;
    end;
    result := FSeekerOn;
  end;
end;

function TT3Torpedo.isSRTargetCheck(target: TSimObject): boolean;
begin
  Result := False;
end;

function TT3Torpedo.isWGTargetCheck(target: TSimObject): boolean;
var
  RangeToTarget : Double;
begin
  Result := False;

  {Keluar dari batas atas dan batas bawah}
  if (TT3PlatformInstance(target).Altitude <= SearchDepth) then
    Result := True;
end;

function TT3Torpedo.isWHTargetCheck(target: TSimObject): boolean;
begin
  Result := False;

  {target harus surface dan bergerak}
  if (TT3PlatformInstance(target).Speed <> 0) and (TT3PlatformInstance(target).PlatformDomain = 1) then
  begin
    {jika sebelumnya sudah pernah lock target, apakah target yg sama(krn WH hanya mengejar target yg pertama)}
    if Assigned(FLockTarget) then
    begin
      if (TargetName = TT3PlatformInstance(target).InstanceName) then
        Result := True;
    end
    else
      Result := True;
  end;
end;

function TT3Torpedo.isWireBreak(PlatformHeading: Double): boolean;
var
  resultAngleUp : Double;
  resultAngleDown : Double;
begin
  resultAngleDown := LaunchPlatformHeading - round(TorpedoDefinition.FDef.Wire_Angle_Offset);
  if resultAngleDown < 0 then
    resultAngleDown := 360 + resultAngleDown;

  resultAngleUp := LaunchPlatformHeading + round(TorpedoDefinition.FDef.Wire_Angle_Offset);
  if resultAngleUp < resultAngleDown then
    resultAngleUp := resultAngleUp + 360;

  if (resultAngleUp > 360) and ((PlatformHeading >= 0) and (PlatformHeading < resultAngleDown)) then
    PlatformHeading := PlatformHeading + 360;

  if (resultAngleDown <= PlatformHeading) and (PlatformHeading  <= resultAngleUp)then
    result := False {masih dlm area wire angle}
  else
    result := True;
end;

function TT3Torpedo.TargetCheck(target: TSimObject): boolean;
var
  validTarget : boolean;
begin
  validTarget := False;
  case TorpedoDefinition.FDef.Primary_Target_Domain of
    {any within capability, surface / subsurface}   //5 hybrid
    0,5 : validTarget := ( TT3PlatformInstance(target).PlatformDomain = 1 ) or
                       ( TT3PlatformInstance(target).PlatformDomain = 2 );
    {surface domain}
    2 : validTarget := ( TT3PlatformInstance(target).PlatformDomain = 1 );
    {subsurface domain}
    4 : validTarget := ( TT3PlatformInstance(target).PlatformDomain = 2 );
  end;
  result := validTarget;
end;

procedure TT3Torpedo.ActiveAcousticMove(const aDeltaMs: double);
begin

end;

procedure TT3Torpedo.ActivePassiveMove(const aDeltaMs: double);
begin
  if TorpedoDefinition.FDef.Sinuation_Runout = 1 then
    SinuationMove(aDeltaMs)
  else
  begin
    CircleMove(aDeltaMs)
  end;
end;

procedure TT3Torpedo.AirDroppedMove(const aDeltaMs: double);
begin
//  if SearchRadius = 0 then
//  begin
//    SpiralMove(aDeltaMs)
//  end
//  else
    CircleMove(aDeltaMs)
end;

function TT3Torpedo.calcCrossSection(pf : TSimObject): double;
  function isBetween(val1, val2, valtest : double) : boolean;
  begin
    result := (valtest >= val1) and (valtest <= val2);
  end;
var
  delta : double;
begin
  if pf is TT3Vehicle then
  begin
    delta := Abs(Course - TT3Vehicle(pf).Course);

    {Samping}
    if isBetween(30,150,delta) or isBetween(240,330,delta) then
      result := TT3Vehicle(pf).VehicleDefinition.FData.Side_Acoustic_Cross
    {Depan}
    else
      result := TT3Vehicle(pf).VehicleDefinition.FData.Front_Acoustic_Cross
  end
  else
  if pf is TT3AirBubble then
    result := TT3AirBubble(pf).AirBubbleMount.FAirBubble_Def.Max_Acoustic_Cross
  else
    result := 0
end;

function TT3Torpedo.searchTarget : TSimObject;
var
  pf, target : TSimObject;
  i : integer;
  bearing, range : double;
  pitch_angle, alt_envelope, elev_alt_limit,
  min_tgt_alt, max_tgt_alt : double;
  min_tgt_azi, max_tgt_azi : double;
  validAzimuth : boolean;
//  MinRangeToTarget : Double;
begin
  i       := 0;
  target  := nil;
  result  := nil;

  if not Assigned(FTargetPlatforms) then exit;

  if not isSeekerOn then exit;

  MinRangeToTarget := 1000000;{target terdekat dset 1jt nm}

  while (i < FTargetPlatforms.itemCount) do begin

    pf := FTargetPlatforms.getObject(i);
    inc(i);

    {jk target sdg direposisi lompati}
    if TT3PlatformInstance(pf).IsRepositioning = True then continue;

    {jk target parentnya lompati}
    if pf = Owner then continue;

    {jk target torpedo itu sendiri lompati}
    if pf = Self then continue;

    {jk target bukan vehicle/airbubble lompati}
    if not ((pf is TT3Vehicle) or (pf is TT3AirBubble)) then continue;

    {jk target dormant lompati}
    if TT3PlatformInstance(pf).Dormant then continue;

    {jk target tdk memenuhi syarat lompati}
    if not TargetCheck(pf) then continue;

    { range check : if lateral range to target < seeker detection range, then target within range envelope}
    range := CalcRange(FPosition.X, FPosition.Y, TT3PlatformInstance(pf).getPositionX, TT3PlatformInstance(pf).getPositionY);
    if range > TorpedoDefinition.FDef.Term_Guide_Range then
      continue;

    { elevation check : target is within the vertical envelope of torpedo seeker}
    pitch_angle  := FMover.VerticalSpeed / ( FMover.Speed * 101.268591 ); // feet per minutes
    alt_envelope := pitch_angle * range + Altitude;
    elev_alt_limit := Tan(C_DegToRad * TorpedoDefinition.FDef.Term_Guide_Elevation) * (range * C_NauticalMile_To_Metre);

    min_tgt_alt := alt_envelope - elev_alt_limit;
    max_tgt_alt := alt_envelope + elev_alt_limit;

    if min_tgt_alt < 0 then
      min_tgt_alt := 0;

    if not ((TT3PlatformInstance(pf).Altitude >= min_tgt_alt) and (TT3PlatformInstance(pf).Altitude <= max_tgt_alt)) then
       continue;

    { azimuth check : target will chcek if it is within horizontal azimuth envelope }
    min_tgt_azi := Course - TorpedoDefinition.FDef.Term_Guide_Azimuth;
    if min_tgt_azi < 0 then
      min_tgt_azi := 360 + min_tgt_azi;

    max_tgt_azi := Course + TorpedoDefinition.FDef.Term_Guide_Azimuth;
    if max_tgt_azi < min_tgt_azi then
      max_tgt_azi := max_tgt_azi + 360;

    bearing := CalcBearing(FPosition.X, FPosition.Y, TT3PlatformInstance(pf).getPositionX, TT3PlatformInstance(pf).getPositionY);
    if (max_tgt_azi > 360) and ((bearing > 0) and (bearing < min_tgt_azi)) then
      bearing := bearing + 360;

    validAzimuth := (min_tgt_azi <= bearing) and (bearing  <= max_tgt_azi);

    if not validAzimuth then continue;

    {Syarat tambahan tiap torpedo}
    case FWeaponCategory of
      wcTorpedoStraigth : {SR tdk bisa search target}
      begin
        if not isSRTargetCheck(pf) then
          Continue;
      end;
      wcTorpedoActivePassive, wcTorpedoWireGuided, wcTorpedoActiveAcoustic, wcTorpedoAirDropped, wcTorpedoPassiveAcoustic :{APG mencari target terdekat}
      begin
        if not isAPGTargetCheck(pf) then
          Continue;
      end;
      wcTorpedoWakeHoming: {WH mencari target yg pertama kali terdeteksi}
      begin
        if not isWHTargetCheck(pf) then
          Continue;
      end;
    end;

    { if all constraint passed, then set this to target }
    target        := pf;
    FEngageTarget := true;
  end;

  if Assigned(target) then
  begin
    SetTargetObject(target);
    if Assigned(OnLogEventStr) and (TargetName <> TT3PlatformInstance(target).InstanceName)then
    begin
      OnLogEventStr('TT3Torpedo.searchTarget', 'Locked at ' + TT3PlatformInstance(target).InstanceName);
      TargetName := TT3PlatformInstance(target).InstanceName;
    end;

    FLockTarget := target;
  end
  else
  begin
    FTargetObject := nil;
    if Assigned(OnLogEventStr) and Assigned(FLockTarget) then
      OnLogEventStr('TT3Torpedo.searchTarget', 'Target Nill');
    FLockTarget   := nil;
  end;
end;

procedure TT3Torpedo.Move(const aDeltaMs: double);
var
  BearingToLockedTarget,
  Sudut                 : Double;
  {$IFDEF SERVER}
  pf                    : TSimObject;
  boom                  : Boolean;
  {$ENDIF}
begin
  inherited;

  //Waiting Time to Launch
  if FisCounterDelay then
  begin
    FCounterDelay := FCounterDelay + aDeltaMs;
    if FCounterDelay < FLaunchDelay then
      exit
    else
    begin
      FisCounterDelay := false;
      FLaunching := true;
    end;
  end;

  if FLaunching then
  begin
    if FIsOnLand or FIsGrounded then
    begin
      {$REGION ' Jika Torpedo Grounded '}
      FMover.Speed        := 0;
      FMover.Acceleration := 0;
      FSpeedState := mcsStable;
      GroundSpeed := 0;
      Speed := 0;

      FMover.TurnRate := 0.0;
      FHeadingState := mcsStable;
      Exit;
      {$ENDREGION}
    end;

    { move object }
    CalcMovement(aDeltaMs);

    {$IFDEF SERVER}
    { hit something when move ? }
    pf := CalcHitSomething;
    if Assigned(pf) then
    begin
      setPositionX(TT3PlatformInstance(pf).getPositionX);
      setPositionY(TT3PlatformInstance(pf).getPositionY);
      setPositionZ(TT3PlatformInstance(pf).getPositionZ);

      FEngageTarget := false;

//      if not CalcPOH(pf) then begin
//        if Assigned(OnLogEventStr) then
//          OnLogEventStr('TT3Torpedo.Move', TT3Torpedo(Self).InstanceName + ' (' +
//                        IntToStr(TT3Torpedo(Self).InstanceIndex) + ') miss target '+
//                        TT3PlatformInstance(pf).InstanceName + ' (' +
//                        IntToStr(TT3PlatformInstance(pf).InstanceIndex) + ')');
//      end
//      else begin
        FLaunching := false;

        if Assigned(OnHit) then
        begin
          Self.reasonDestroy := 22;
          OnHit(Self, pf, TorpedoDefinition.FDef.Lethality);
        end;
        {after hit, then exit main thread loop}
        exit;
//      end;
    end;
    {$ENDIF}

    { seek target terus untuk mendptkan target baru yg terdekat }
    searchTarget;

    { jk target sudah di lock}
    if Assigned(FLockTarget) then
    begin
     {di set bergerak kearah target yg dilock (Homing)}
      BearingToLockedTarget := CalcBearing(FPosition.X, FPosition.Y, FLockTarget.getPositionX, FLockTarget.getPositionY);
      SetOrderedHeading(BearingToLockedTarget);
      SetAltitude(TT3PlatformInstance(FLockTarget).Altitude);
      FTargetPosition.X := FLockTarget.getPositionX;
      FTargetPosition.Y := FLockTarget.getPositionY;
      FTargetPosition.Z := FLockTarget.getPositionZ;

      {flag jika target APG lepas}
      if FWeaponCategory = wcTorpedoWireGuided then
        TargetInstanceIndex := 0
      else
        ApgLostTarget := True;

      {jk jarak torpedo ke target lebih besar dari 3}
      if CalcRange(FPosition.X, FPosition.Y, FLockTarget.getPositionX, FLockTarget.getPositionY) > 3 then
      begin
        FTargetObject := nil;
        FLockTarget   := nil;
      end;
    end
    else
    begin
      if WeaponCategory = wcHybrid then {Hybrid Tropedo move}
        AirDroppedMove(aDeltaMs)
      else if WeaponCategory = wcTorpedoStraigth then  {Torpedo Straigth move}
        StraigthMove(aDeltaMs)
      else if WeaponCategory = wcTorpedoActiveAcoustic then  {Torpedo ActiveAcoustic move}
        ActiveAcousticMove(aDeltaMs)
      else if WeaponCategory = wcTorpedoPassiveAcoustic then  {Torpedo PassiveAcoustic move}
        PassiveAcousticMove(aDeltaMs)
      else if WeaponCategory = wcTorpedoWireGuided then  {Torpedo WireGuided move}
        WireGuidedMove(aDeltaMs)
      else if WeaponCategory = wcTorpedoWakeHoming then  {Torpedo WakeHoming move}
        WakeHomingMove(aDeltaMs)
      else if WeaponCategory = wcTorpedoActivePassive then {Torpedo ActivePassive move}
        ActivePassiveMove(aDeltaMs)
      else if WeaponCategory = wcTorpedoAirDropped then {Torpedo AirDropped move}
        AirDroppedMove(aDeltaMs);
    end;

    {$IFDEF SERVER}
    if FreeMe <> True then
    begin
      boom := False;
      case FEnduranceType of
        entFuel :
        begin
          if FFuelRemaining <= 0 then
          begin
            boom  := True;
            if Assigned(OnLogEventStr) then
              OnLogEventStr('TT3Torpedo.Move', 'The Fuel runs out...');
          end;
        end;
        entTime :
        begin
          if FTimeRemaining <= 0 then
          begin
            boom  := True;
            if Assigned(OnLogEventStr) then
              OnLogEventStr('TT3Torpedo.Move', 'Time runs out...');
          end;
        end;
        entRange:
        begin
          if FRangeRemaining <= 0 then
          begin
            boom  := True;
            if Assigned(OnLogEventStr) then
              OnLogEventStr('TT3Torpedo.Move', 'Exceeds the limit...');
          end;
        end;
        entUnlimited: ;
      end;

      { Jk bahan bakar atau waktu habis atau diluar range max maka destroy }
      if boom then
      begin
        FLaunching := false;
        if Assigned(OnOut) then
          OnOut(Self,3);
      end;
    end;
    {$ENDIF}
  end
end;

procedure TT3Torpedo.PassiveAcousticMove(const aDeltaMs: double);
begin

end;

procedure TT3Torpedo.RepositionTo(const x, y: double);
begin
  inherited;

  FMover.X := X;
  FMover.Y := Y;
end;

procedure TT3Torpedo.SetOrderedAltitude(const Value: double);
var
  dH: double;
begin
  FOrderedAltitude  := Value/ (C_NauticalMile_To_Metre * C_Degree_To_NauticalMile) ;
  dH                := (FOrderedAltitude - FMover.Z);

  if abs(dH) < 0.000000000001  then
  begin
    FAltitudeState := mcsStable;
    FMover.Vertical_Accel := 0;
  end
  else
  begin
    if FOrderedAltitude > FMover.Z then begin
      FMover.ClimbRate      := UnitMotion.FData.Normal_Climb_Rate;
      FMover.Vertical_Accel := Abs(UnitMotion.FData.Vertical_Accel);
      FAltitudeState        := mcsIncrease;
    end
    else begin
      FMover.DescentRate    := UnitMotion.FData.Normal_Descent_Rate;
      FMover.Vertical_Accel := - Abs(UnitMotion.FData.Vertical_Accel);
      FAltitudeState        := mcsDecrease;
    end;
  end;
end;

procedure TT3Torpedo.SetAltitude(const Value: single);
begin
  inherited;
  FMover.Z := Value / (C_Degree_To_NauticalMile * C_NauticalMile_To_Metre);
end;

procedure TT3Torpedo.SetFreeMe(const Value: boolean);
begin
  inherited;

  if Assigned(OnFreeMe) then
    OnFreeMe(Self, Value);
end;

procedure TT3Torpedo.setGrounded(const Value: boolean);
begin
  FIsGrounded := Value;
end;

procedure TT3Torpedo.SetLaunchBearing(const Value: Double);
begin
  FLaunchBearing := Value;
end;

procedure TT3Torpedo.SetLaunchDelay(const Value: double);
begin
 FLaunchDelay := Value;
end;

procedure TT3Torpedo.SetLaunched(const Value: boolean);
var
  mx,my,
  hTime,hSpeed,
  hRange,hBearing : double;
begin
  inherited;

  if Value then
  begin
    FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y,FPosition.X, FPosition.Y);
    FTargetBearing := Calcbearing(FPosition.X, FPosition.Y, FTargetPosition.X,FTargetPosition.Y);
//    FTargetCourse  := TT3PlatformInstance(TargetObject).Course;
//    FTargetSpeed   := TT3PlatformInstance(TargetObject).Speed;

    {perhitungan titik tabrakan}
    CalcHitPrediction(FTargetRange, FTargetBearing, FTargetSpeed, FTargetCourse,
                          UnitMotion.FData.High_Ground_Speed, hRange, hBearing, hTime, hSpeed);

    {perhitungan titik target}
    RangeBearingToCoord(hRange,hBearing,mx,my);
    FTargetPosition.X := FPosition.X + mx;
    FTargetPosition.Y := FPosition.Y + my;

    {Posisi Awal}
    {diset saat initialize torpedo}

    {$REGION ' Setting Kedalaman '}

    {Kedalaman awal}
    if Assigned(FParent) then
    begin
      if (TT3PlatformInstance(Parent).PlatformDomain = vhdSubsurface)then
        Altitude   := TT3PlatformInstance(FParent).Altitude
      else
        Altitude   := 0;
    end;

    {Kedalaman Tujuan}
    case WeaponCategory of
      wcHybrid, wcTorpedoActivePassive, wcTorpedoAirDropped :
      begin
        OrderedAltitude  := SearchDepth;
      end;
      wcTorpedoWireGuided, wcTorpedoWakeHoming, wcTorpedoStraigth:
      begin
        OrderedAltitude  := TargetAltitude;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Speed Awal '}
    {semua speed awal torpedo 0, tp sama pak reza disuruh buat sesuai parent}
    if Assigned(UnitMotion) then
    begin
      FMover.Acceleration := UnitMotion.FData.Acceleration;
      FMover.MaxSpeed     := UnitMotion.FData.Max_Ground_Speed;
    end;
    {$ENDREGION}

    {$REGION ' Heading Awal '}
    case FLaunchMethod of
      tlmAimpoint:
      begin
        OrderedHeading := FTargetBearing
      end;
      tlmBearing, tlmAimBearing:
      begin
        OrderedHeading := LaunchBearing;
      end;
      tlmDirect:
      begin
        case TTorpedoPursuit(TorpedoDefinition.FDef.Pursuit_Guidance_Type) of
          tpLead: {Lead}
          begin
            OrderedHeading := FTargetBearing;
          end;
          tpPure: {Pure}
          begin
            OrderedHeading := hBearing;
          end;
        end;
      end;
    end;

    if IsLaunchWithoutTarget then
      OrderedHeading := LaunchBearing;

    case WeaponCategory of
      wcHybrid :
      begin
        Self.Heading          := TT3PlatformInstance(Parent).Heading;
        FTargetBearing        := TT3PlatformInstance(Parent).Heading;
      end;
    end;
    {$ENDREGION};

    FMover.Direction := ConvCompass_To_Cartesian(OrderedHeading);

    FisCounterDelay := true;
  end;

end;

procedure TT3Torpedo.SetLaunchMethod(const Value: TTorpedoLaunchMethod);
begin
  FLaunchMethod := Value;
end;

procedure TT3Torpedo.SetLethality(const Value: integer);
begin
  FLethality := Value;
end;

procedure TT3Torpedo.setOnLand(const Value: boolean);
begin
  FIsOnLand := Value;
end;

procedure TT3Torpedo.SetInstructor(const Value: boolean);
begin
  inherited;

  Initialize;
end;

procedure TT3Torpedo.SetIsWasdal(const Value: Boolean);
begin
  inherited;

  Initialize;
end;

procedure TT3Torpedo.SetOrderedHeading(const Value: double);
var
    turnRate : double;
begin
  FOrderedHeading := Value;  // komaps

  FDeltaHead :=  getDeltaH(Value, Course);
  FOrderedHeadingAchieved :=  abs(FDeltaHead) < 2.0 ;

  if FOrderedHeadingAchieved then begin
    Course        := Value;
    FHeadingState := mcsStable;
  end;

  if Assigned(UnitMotion) then begin
    turnRate     := UnitMotion.FData.Standard_Turn_Rate; // degree per second
  end else begin
    turnRate     := 0;    // degree per second
  end;

  if FDeltaHead < 0  then begin
     FMover.TurnRate := turnRate;
     FHeadingState   := mcsIncrease;
  end
  else begin
     FMover.TurnRate := -turnRate;
     FHeadingState   := mcsDecrease;
  end;
end;

procedure TT3Torpedo.SetOwner(const Value: TSimObject);
begin
  FOwner := Value;
end;

procedure TT3Torpedo.SetPointHybrid(const Value: t2DPoint);
begin
  FPointHybrid := Value;
end;

procedure TT3Torpedo.setPos(const Index: Integer; const Value: double);
begin
  inherited;
  case Index of
    1: FMover.Direction := ConvCompass_To_Cartesian(Value);
    2: FMover.Speed := Value;
  end;
end;

procedure TT3Torpedo.setPositionX(const v: double);
begin
  inherited;
  FMover.X := v;

end;

procedure TT3Torpedo.setPositionY(const v: double);
begin
  inherited;
  FMover.Y := v;

end;

procedure TT3Torpedo.setPositionZ(const v: double);
begin
  inherited;
  FMover.Z := v;
end;

procedure TT3Torpedo.SetRunOutMode(const Value: Byte);
begin
  FRunOutMode := Value;
end;

procedure TT3Torpedo.SetSafetyCeiling(const Value: double);
begin
  FSafetyCeiling := Value;
end;

procedure TT3Torpedo.SetSearchDepth(const Value: double);
begin
  FSearchDepth := Value;
end;

procedure TT3Torpedo.SetSearchRadius(const Value: double);
begin
  FSearchRadius := Value;
end;

procedure TT3Torpedo.SetSeekerRange(const Value: double);
begin
  FSeekerRange := Value;
end;

procedure TT3Torpedo.SetSelected(const Value: boolean);
var
  col : TColor;
begin
  col := FTacticalSymbol.Color;
  FTacticalSymbol.Selected := Value;

  FTacticalSymbol.Color := col;
//  FTacticalSymbol.Symbol.Visible := true;
//  FTacticalSymbol.Symbol.Color := col;

  FSelected := Value;

  if Assigned(FOnSelected) then
    FOnSelected(Self);
end;

procedure TT3Torpedo.SetTargetAltitude(const Value: double);
begin
  FTargetAltitude := Value;
end;

procedure TT3Torpedo.SetTargetCourse(const Value: double);
begin
  FTargetCourse := Value;
end;

procedure TT3Torpedo.setTargetDomain(const Value: double);
begin
  FTargetDomain := Value;
end;

procedure TT3Torpedo.SetTargetInstanceIndex(const Value: integer);
begin
  FTargetInstanceIndex := Value;
end;

procedure TT3Torpedo.SetTargetObject(const Value: TSimObject);
var
  hRange,hBearing,hTime,hSpeed,mx,my: double;

begin
  inherited;
  if Assigned(Value) then
  begin
    FTargetPosition.X := Value.getPositionX;
    FTargetPosition.Y := Value.getPositionY;
    FTargetPosition.Z := Value.getPositionZ;

    if FTargetObject <> Value then begin
      FTargetObject := Value;

      if Assigned(OnLogEventStr) then
        OnLogEventStr('TT3Torpedo.SetTargetObject', 'Targeting ' + TT3PlatformInstance(Value).InstanceName);
    end;

    if FCycleUpdateAltitude <= 2 then exit;

    FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y,FPosition.X, FPosition.Y);
    FTargetBearing := Calcbearing(FPosition.X, FPosition.Y, FTargetPosition.X,FTargetPosition.Y);
    FTargetCourse  := TT3PlatformInstance(Value).Course;
    FTargetSpeed   := TT3PlatformInstance(Value).Speed;
    FTargetAltitude:= TT3PlatformInstance(Value).Altitude;

    CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                     hRange,hBearing,hTime,hSpeed);

    RangeBearingToCoord(hRange,hBearing,mx,my);
    FTargetPosition.X := FPosition.X + mx;
    FTargetPosition.Y := FPosition.Y + my;
    FTargetPosition.Z := TT3PlatformInstance(Value).getPositionZ;

    FLaunchPosition.X:= getPositionX;
    FLaunchPosition.Y:= getPositionY;
    FLaunchPosition.Z:= getPositionZ;

    FTargetBearing    := hBearing;
    FTargetRange      := hRange;

    SetAltitude(FTargetAltitude);

    FCycleUpdateAltitude := 0;
    FNeedAdjust  := true;
  end;
end;

procedure TT3Torpedo.SetTargetPlatforms(const Value: TT3UnitContainer);
begin
  FTargetPlatforms := Value;
end;

procedure TT3Torpedo.SetTargetPosition(const Value: t3DPoint);
begin
  FTargetPosition := Value;
end;

procedure TT3Torpedo.SetTargetSpeed(const Value: double);
begin
  FTargetSpeed := Value;
end;

procedure TT3Torpedo.SetTipeTorpedo(const Value: double);
begin
  FTipeTorpedo := Value;
end;

procedure TT3Torpedo.setLaunchPosition(const Value: t3DPoint);
begin
  FLaunchPosition := Value;
end;

procedure TT3Torpedo.SetUnitData(const Value: TObject);
begin
  inherited;
  FTorpedoDefinition :=  TTorpedo_On_Board(Value);
end;

procedure TT3Torpedo.SinuationMove(const aDeltaMs: double);
var
  Degree, Length_Sinuation,
  lengthDistance: Double;

begin
  Length_Sinuation := 0;
  Degree           := 0;

  GetAngleAndDistanceSinuation(OrderedSinuation, TorpedoDefinition.FDef.Runout_Sinuation_Period,
                               TorpedoDefinition.FDef.Runout_Sinuation_Amplitude,Length_Sinuation, Degree);

  if isFirstSinuation = True then
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
  if isRightSinuation = True then
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
  if isLeftSinuation = True then
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

procedure TT3Torpedo.SpiralMove(const aDeltaMs: double);
var
  X_center, Y_center,
  distance, heading_now,
  CircleRadius, CircleDirection : double;
  TerminalCircleDegree1,Sudutsekarang,
  pembanding : Double;
begin
  CircleDirection := -90;
  CircleRadius    := 0/ C_NauticalMile_To_Yards;
  X_center        := FLaunchPosition.X;
  Y_center        := FLaunchPosition.Y;
  distance        := CalcRange(PosX, PosY, X_center,Y_center);

  TerminalCircleDegree1 := FSpiral * C_NauticalMile_To_Degree;

  if Circle_state = cstateStraight then
  begin
    if Abs(distance - CircleRadius) > 0.09 then
    begin
      if distance < CircleRadius then
        FOrderedHeading := CalcBearing(X_center,Y_center, PosX, PosY)
      else
        FOrderedHeading := CalcBearing(PosX, PosY, X_center,Y_center);

      FDeltaHead := getDeltaH(FOrderedHeading, Heading);
    end
    else
    begin
      Sudutawal := 0;
      Circle_state    := cstateCircle;
      FOrderedHeading := CalcBearing(X_center,Y_center, PosX, PosY) + CircleDirection/2;
      SetOrderedAltitude(SearchDepth)
    end;
  end
  else
  begin
    SetOrderedHeading(FOrderedHeading);

    if (distance <= TerminalCircleInDegree) then
    begin
      Sudutsekarang := Round(CalcBearing(X_center,Y_center, PosX, PosY));

      pembanding :=  Sudutawal - Sudutsekarang;

      if abs(pembanding) <= 1  then
      begin
        if Sudutawal = 0 then
        begin
          Sudutawal := 315;
          FMover.X := FMover.X;
          FMover.Y := FMover.Y + TerminalCircleDegree1;
          FSpiral := FSpiral + 0.001;
        end
        else if Sudutawal = 315 then
          Sudutawal := 270

        else if Sudutawal = 270 then
        begin
          Sudutawal := 225;
          FMover.X := FMover.X - TerminalCircleDegree1;
          FMover.Y := FMover.Y;
          FSpiral := FSpiral + 0.001;
        end
        else if Sudutawal = 225 then
          Sudutawal := 180

        else if Sudutawal = 180 then
        begin
          Sudutawal := 135;
          FMover.X := FMover.X;
          FMover.Y := FMover.Y - TerminalCircleDegree1;
          FSpiral := FSpiral + 0.001;
        end
        else if Sudutawal = 135 then
          Sudutawal := 90

        else if Sudutawal = 90 then
        begin
          Sudutawal := 45;
          FMover.X := FMover.X + TerminalCircleDegree1;
          FMover.Y := FMover.Y;
          FSpiral := FSpiral + 0.001;
        end
        else
          Sudutawal := 0;

        FPosition.X := FMover.X;
        FPosition.Y := FMover.Y;

      end;
    end;

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

    {pergerakan torpedo diset naik turun sesuai batas atas n batas bawah}
    if Altitude = SearchDepth then
      SetOrderedAltitude(SafetyCeiling)
    else
      if Altitude = SafetyCeiling then
        SetOrderedAltitude(SearchDepth);
  end;
end;

procedure TT3Torpedo.StraigthMove(const aDeltaMs: double);
begin
  if IsInittialGuidance then
  begin
    IsInittialGuidance := False;
    SetOrderedHeading(OrderedHeading);
    SetOrderedAltitude(FTargetAltitude + 1);
  end
end;

procedure TT3Torpedo.UpdateVisual;
var
  X,Y : integer;
begin
  inherited;
  if not FLaunching then begin
    Converter.ConvertToScreen(FPosition.X, FPosition.Y,X,Y);
  end else begin
    Converter.ConvertToScreen(FMover.X, FMover.Y, X, Y);
  end;

  FTacticalSymbol.Center := Point(X, Y);
  FTacticalSymbol.SpeedVector.Course := ConvCartesian_To_Compass(FMover.Direction);
  FTacticalSymbol.ConvertCoord(Converter);
end;

procedure TT3Torpedo.WakeHomingMove(const aDeltaMs: double);
begin
  if IsInittialGuidance then
  begin
    IsInittialGuidance := False;
    SetOrderedHeading(OrderedHeading);
    SetOrderedAltitude(FTargetAltitude + 1);
  end

end;

procedure TT3Torpedo.WireGuidedMove(const aDeltaMs: double);
var
  i : Integer;
  target : TSimObject;
  BearingRead : Double;
  TorpedoHeading : Double;
  PosTargetX, PosTargetY : Double;
begin
  i :=0;
  target  := nil;

  {menentukan pergerakan awal : pure atau lead}
  if IsInittialGuidance then
  begin
    while (i < FTargetPlatforms.itemCount) do
    begin
      target := FTargetPlatforms.getObject(i);
      inc(i);

      if Assigned(target) then
      begin
        if (TT3PlatformInstance(target).InstanceIndex = TargetInstanceIndex) and
           (TT3PlatformInstance(target).Altitude <= SearchDepth) then
        begin
          PosTargetX := target.getPositionX;
          PosTargetY := target.getPositionY;

          BearingRead := Calcbearing(FPosition.X, FPosition.Y, PosTargetX,PosTargetY);
          case TTorpedoPursuit(TorpedoDefinition.FDef.Pursuit_Guidance_Type) of
            tpLead: {Lead}
            begin
              SetOrderedHeading(BearingRead);
              SetOrderedAltitude(FTargetAltitude + 1);
            end;
          end;
        end;
      end;
    end;
  end;

  {mengecek kabel putus atau tidak}
  if (isWireBreak(round(TT3PlatformInstance(Owner).Heading))) and (not WireBreak) then
  begin
    Circle_state := cstateStraight;
    IsInittialGuidance := False;
    WireBreak := True;
    if SearchRadius = 0 then
      SearchRadius := 1000;

    FLaunchPosition.X := FPosition.X;
    FLaunchPosition.Y := FPosition.Y;
    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3Torpedo.WireGuidedMove', 'kabel putus');
  end;

  {pergerakan setelah kabel putus}
  if WireBreak then
    CircleMove(aDeltaMs);
end;

function TT3Torpedo.GetSnapshotData : _SS_TT3Torpedo ;
var
    i  : integer ;
    ss : _SS_TT3Torpedo ;
    weaponScript  : TScripted_Weapon ;
    pattern       : TPattern_Weapon ;
    blind         : TBlind_Zone;
    poh           : TTorpedo_POH_Modifier;
begin
    ss.W := TT3Weapon(Self).GetSnapshotData ;
    ss.SearchRadius     := SearchRadius ;
    ss.SearchDepth      := SearchDepth ;
    ss.SafetyCeiling    := SafetyCeiling ;
    ss.SeekerRange      := SeekerRange ;
    ss.Lethality        := Lethality ;
    ss.SeekerOn         := SeekerOn ;
    ss.OnGrounded       := OnGrounded ;
    ss.OnLand           := OnLand ;
    ss.Launching        := FLaunching;
    ss.TargetCourse     := TargetCourse ;
    ss.TargetSpeed      := TargetSpeed ;
    ss.TargetDomain     := TargetDomain ;
    ss.lastHeading      := lastHeading ;
    ss.OrderedAltitude  := OrderedAltitude ;
    ss.TargetPosition   := TargetPosition  ;
    SetLength(ss.TargetPlatforms,TargetPlatforms.itemCount);
    for I := 0 to TargetPlatforms.itemCount - 1 do begin
        ss.TargetPlatforms[i].InstanceIndex  := TT3Unit(TargetPlatforms).InstanceIndex ;
    end;
    if Owner <> nil then
      ss.Owner  := TT3Unit(Owner).InstanceIndex ;
    ss.LaunchMethod     := byte(LaunchMethod)  ;

    ss.TorpedoDefinition.FData        := TorpedoDefinition.FData     ;
    ss.TorpedoDefinition.FDef         := TorpedoDefinition.FDef      ;
    ss.TorpedoDefinition.FNote        := TorpedoDefinition.FNote ;

    if TorpedoDefinition.FScript_Torpedo <> nil then begin
      SetLength(ss.TorpedoDefinition.FScript_Torpedo,TorpedoDefinition.FScript_Torpedo.Count);
      for I := 0 to TorpedoDefinition.FScript_Torpedo.Count - 1 do
      begin
          weaponScript := TScripted_Weapon(TorpedoDefinition.FScript_Torpedo[i]) ;
          if weaponScript <> nil then
          begin
            ss.TorpedoDefinition.FScript_Torpedo[i].Event := weaponScript.Event.FData ;
            ss.TorpedoDefinition.FScript_Torpedo[i].Behav := weaponScript.Behav.FData ;
          end;
      end;
    end;

    if TorpedoDefinition.FPattern_Torpedo <> nil then begin
      SetLength(ss.TorpedoDefinition.FPattern_Torpedo,TorpedoDefinition.FPattern_Torpedo.Count);
      for I := 0 to TorpedoDefinition.FPattern_Torpedo.Count - 1 do
      begin
          pattern := TPattern_Weapon(TorpedoDefinition.FPattern_Torpedo[i]) ;
          if pattern <> nil then
          begin
            ss.TorpedoDefinition.FPattern_Torpedo[i].Event := pattern.Event.FData ;
            ss.TorpedoDefinition.FPattern_Torpedo[i].Pattern := pattern.Pattern.FData ;
          end;
      end;
    end;

    if TorpedoDefinition.FBlind <> nil then begin
      SetLength(ss.TorpedoDefinition.FBlind,TorpedoDefinition.FBlind.Count);
      for I := 0 to TorpedoDefinition.FBlind.Count - 1 do
      begin
          blind := TBlind_Zone(TorpedoDefinition.FBlind[i]) ;
          if blind <> nil then
            ss.TorpedoDefinition.FBlind[i].FData := blind.FData;
      end;
    end;

    if TorpedoDefinition.FAspectPOH <> nil then begin
      SetLength(ss.TorpedoDefinition.FAspectPOH,TorpedoDefinition.FAspectPOH.Count);
      for I := 0 to TorpedoDefinition.FAspectPOH.Count - 1 do
      begin
          poh := TTorpedo_POH_Modifier(TorpedoDefinition.FAspectPOH[i]) ;
          if poh <> nil then
            ss.TorpedoDefinition.FAspectPOH[i].FData := poh.FData;
      end;
    end;
    ss.FHomePositionX    := FLaunchPosition.X ;
    ss.FHomePositionY    := FLaunchPosition.Y ;
    Result := ss ;

end;

procedure TT3Torpedo.SetSnapshotData(const ss : _SS_TT3Torpedo);
var
    i  : integer ;
    weaponScript  : TScripted_Weapon ;
    pattern       : TPattern_Weapon ;
    blind         : TBlind_Zone;
    poh           : TTorpedo_POH_Modifier;
begin
    TT3Weapon(Self).SetSnapshotData(ss.W) ;
    SearchRadius     := ss.SearchRadius ;
    SearchDepth      := ss.SearchDepth ;
    SafetyCeiling    := ss.SafetyCeiling ;
    SeekerRange      := ss.SeekerRange ;
    Lethality        := ss.Lethality ;
    //SeekerOn         := ss.SeekerOn ;
    FLaunching       := ss.Launching;
    OnGrounded       := ss.OnGrounded ;
    OnLand           := ss.OnLand ;
    TargetCourse     := ss.TargetCourse ;
    TargetSpeed      := ss.TargetSpeed ;
    TargetDomain     := ss.TargetDomain ;
    lastHeading      := ss.lastHeading ;
    OrderedAltitude  := ss.OrderedAltitude ;
    TargetPosition   := ss.TargetPosition  ;

    TorpedoDefinition.FData        := ss.TorpedoDefinition.FData     ;
    TorpedoDefinition.FDef         := ss.TorpedoDefinition.FDef      ;
    TorpedoDefinition.FNote        := ss.TorpedoDefinition.FNote ;

    with ss.TorpedoDefinition do begin
      for i := low(FScript_Torpedo) to High(FScript_Torpedo) do begin
       weaponScript             := TScripted_Weapon.Create;
       weaponScript.Event.FData := FScript_Torpedo[i].Event ;
       weaponScript.Behav.FData := FScript_Torpedo[i].Behav ;
       TorpedoDefinition.FScript_Torpedo.Add(weaponScript);
      end;
      for i := low(FPattern_Torpedo) to High(FPattern_Torpedo) do begin
       pattern                := TPattern_Weapon.Create;
       pattern.Event.FData    := FPattern_Torpedo[i].Event ;
       pattern.Pattern.FData  := FPattern_Torpedo[i].Pattern ;
       TorpedoDefinition.FPattern_Torpedo.Add(pattern);
      end;
      for i := low(FBlind) to High(FBlind) do begin
       blind        := TBlind_Zone.Create;
       blind.FData  := FBlind[i].FData ;
       TorpedoDefinition.FBlind.Add(blind);
      end;
      for i := low(FAspectPOH) to High(FAspectPOH) do begin
       poh        := TTorpedo_POH_Modifier.Create;
       poh.FData  := FAspectPOH[i].FData ;
       TorpedoDefinition.FAspectPOH.Add(poh);
      end;
    end;
    FLaunchPosition.X    := ss.FHomePositionX ;
    FLaunchPosition.Y    := ss.FHomePositionY ;
end;

end.
