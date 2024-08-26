{*------------------------------------------------------------------------------
  Unit definition for hybrid on board implementation.

  @author  Ryu
  @version 2013/02/18 1.0 Initial revision.
  @todo
  @comment You can modify this codes for further development
-------------------------------------------------------------------------------}
unit uT3HybridOnVehicle;

interface

uses uT3Weapon, uT3Torpedo, uT3Missile,
  uDBAsset_Weapon, tttData, Graphics, uDataModuleTTT,
  uDBAsset_MotionCharacteristics, uT3HybridMissile,
  uT3MissileEnvironment, Classes;

type
  {*------------------------------------------------------------------------------
    Kelas TT3HybridOnVehicle untuk hybrid weapon di vehcle.
    Gabungan antara misile dan torpedo.

    18/02/2013 :
      - TT3HybridOnVehicle class is born!!
      - All general properties for hybrid weapon declared
  -------------------------------------------------------------------------------}
  TT3HybridOnVehicle = class(TT3Weapon)
  private


    {*------------------------------------------------------------------------------
      Motion characteristic, when cruise with missile and torpedo choose
        corrected motion
    -------------------------------------------------------------------------------}
    FMissileMotion : TMotion_Characteristics;
    FTorpedoMotion : TMotion_Characteristics;

    {*------------------------------------------------------------------------------
      Data Definition for missile, torpedo and hybrid
    -------------------------------------------------------------------------------}
    FMissileDefinition  : TRecMissile_Definition;
    FTorpedoDefinition  : TRecTorpedo_Definition;
    FHybridDefinition   : THybrid_On_Board;

    {*------------------------------------------------------------------------------
      Longitude Latitude of aimpoint
    -------------------------------------------------------------------------------}
    FAimpoint_Movement   : TT3Aimpoint_Missile;

    {*------------------------------------------------------------------------------
      getter for quantity property
    -------------------------------------------------------------------------------}
    FQuantity           : Integer;

    {*------------------------------------------------------------------------------
      getter for salvosize property
    -------------------------------------------------------------------------------}
    FSalvoSize          : Integer;

    {*------------------------------------------------------------------------------
      getter for cruise altitude property
    -------------------------------------------------------------------------------}
    FCruiseAltitude     : integer;

    {*------------------------------------------------------------------------------
      Firing delay in second
    -------------------------------------------------------------------------------}
    FFiringDelay        : double;

    {*-----------------------------------------------------------------------------
      Projectile Torpedo untuk dibawa oleh missile
      ----------------------------------------------------------------------------*}
      FTorpedoProjectil : TT3Torpedo;

     {*----------------------------------------------------------------------------
      List POH Torpedo
      ----------------------------------------------------------------------------*}
      FPohAspect : TList;

    {*------------------------------------------------------------------------------
      Kuantiti Setter

      @param Value : jumlah kuantiti
    -------------------------------------------------------------------------------}
    procedure SetQuantity(const Value: Integer);

    {*------------------------------------------------------------------------------
      Salvo Size Setter

      @param Value : Jumlah salvo
    -------------------------------------------------------------------------------}
    procedure SetSalvoSize(const Value: Integer);

    {*------------------------------------------------------------------------------
      Cruise altitude setter

      @param Value : altitude in feet while weapon cruising
    -------------------------------------------------------------------------------}
    procedure SetCruiseAltitude(const Value: integer);


    function CreateProjectile: TT3HybridMissile;
    function CreateTorpedoProjectile: TT3Torpedo;
  protected

  public

    {*------------------------------------------------------------------------------
      Override parent constructor
    -------------------------------------------------------------------------------}
    constructor Create;override;

    {*------------------------------------------------------------------------------
      Override parent destructor
    -------------------------------------------------------------------------------}
    destructor Destroy;override;

    {*------------------------------------------------------------------------------
      Running processes for all procedure per second declare here

      @param aDeltaMs : second per cycle process
    -------------------------------------------------------------------------------}
    procedure Move(const aDeltaMs: double); override;

    {*------------------------------------------------------------------------------
      Initialize hybrid on board
    -------------------------------------------------------------------------------}
    procedure Initialize;override;

    function PrepareLaunch : TT3HybridMissile;

    procedure UpdateVisual; override;

    {*------------------------------------------------------------------------------
      Kuantiti hybrid weapon di vehicle
    -------------------------------------------------------------------------------}
    property Quantity : Integer read FQuantity write SetQuantity;

    {*------------------------------------------------------------------------------
      Jumlah salvo dalam satu kali launch
    -------------------------------------------------------------------------------}
    property SalvoSize : Integer read FSalvoSize write SetSalvoSize;

    {*------------------------------------------------------------------------------
      Cruise altitude for weapon
    -------------------------------------------------------------------------------}
    property CruiseAltitude : integer read FCruiseAltitude write SetCruiseAltitude;

    property Aimpoint_Movement : TT3Aimpoint_Missile read FAimpoint_Movement;

    property MissileDefinition : TRecMissile_Definition read FMissileDefinition;

    property HybridDefinition   : THybrid_On_Board read FHybridDefinition;

    property PohAspect: TList  read FPohAspect write FPohAspect;
    property TorpedoMotion : TMotion_Characteristics read FTorpedoMotion write FTorpedoMotion;
    property TorpedoDefinition : TRecTorpedo_Definition read FTorpedoDefinition;

  end;


implementation

uses uBaseCoordSystem, uDBAsset_Scripted, uDataTypes, uT3Listener, uT3Unit, uSnapshotData;

{ TT3HybridOnVehicle }

constructor TT3HybridOnVehicle.Create;
begin
  inherited;

  // aimpoint target
  FAimpoint_Movement   := TT3Aimpoint_Missile.create;

end;

function TT3HybridOnVehicle.CreateProjectile: TT3HybridMissile;
var
  projectil : TT3HybridMissile;
  Static3DPos : t3DPoint;
begin

  // asumsi missile yang digunakan adalah tipe Air to Surface
  // extend dari kelas TT3Missile_AS

  projectil := TT3HybridMissile.Create;

  projectil.Converter := Converter;

//  FTorpedoProjectil := CreateTorpedoProjectile;

//  TT3HybridMissile(projectil).SetMovement(mfmAimpoint);
  TT3Aimpoint_Missile(TT3HybridMissile(projectil).MissileMovement).PositionX := FAimpoint_Movement.PositionX;
  TT3Aimpoint_Missile(TT3HybridMissile(projectil).MissileMovement).PositionY := FAimpoint_Movement.PositionY;

  Static3DPos.X := FAimpoint_Movement.PositionX;;
  Static3DPos.Y := FAimpoint_Movement.PositionY;
  Static3DPos.Z := 0;

  projectil.StaticTargetPos := Static3DPos;

  projectil.Parent          := Parent;
  projectil.Owner           := Parent;
  projectil.UnitMotion      := FMissileMotion;
  projectil.UnitDefinition  := THybrid_On_Board(UnitDefinition);
  TMissile_On_Board(projectil.UnitDefinition).FDef := FMissileDefinition;

//  FTorpedoProjectil.UnitDefinition  := TTorpedo_On_Board(UnitDefinition);
//  TTorpedo_On_Board(FTorpedoProjectil.UnitDefinition).FDef := FTorpedoDefinition;
//  TTorpedo_On_Board(FTorpedoProjectil.UnitDefinition).FAspectPOH := FPohAspect;

  projectil.TargetObject    := nil;

  projectil.UnitGroup       := UnitGroup;
  projectil.Enable          := Enable;
  projectil.WeaponCategory  := WeaponCategory;
  projectil.Track_ID        := 'MIS';
//  projectil.LoadedTorpedo   := FTorpedoProjectil;
  projectil.isInstructor    := TT3PlatformInstance(FParent).isInstructor;
  projectil.isWasdal        := TT3PlatformInstance(FParent).isWasdal;
  projectil.Initialize;

//  FTorpedoProjectil.Parent   := FParent; //projectil;
//  FTorpedoProjectil.Owner    := FParent; //projectil;

//  FTorpedoProjectil.PointHybrid  := Make2DPoint(FAimpoint_Movement.PositionX, FAimpoint_Movement.PositionY);
//  FTorpedoProjectil.isInstructor := TT3PlatformInstance(FParent).isInstructor;
//  FTorpedoProjectil.Initialize;


//  HAFOBearing := CalcBearing(PosX,PosY,Static3DPos.X,Static3DPos.Y);
//  RangeBearingToCoord(HitMode.HAFO, HAFOBearing, mX, mY);
//
//  HAFOPos.X := TT3Vehicle(Parent).getPositionX + mX;
//  HAFOPos.Y := TT3Vehicle(Parent).getPositionY + mY;
//  projectil.HAFOPosition    := HAFOPos;
//
//  projectil.UnitGroup       := UnitGroup;
//  projectil.Enable          := Enable;
//  projectil.WeaponCategory  := WeaponCategory;
//  projectil.FiringMode      := FFiringMode;
//  projectil.LaunchDelay     := FLaunchDelay;
//  projectil.Track_ID        := 'MIS';
//
//  projectil.ShipIndex := TT3PlatformInstance(FParent).InstanceIndex;
//  projectil.ShipName  := TT3PlatformInstance(FParent).InstanceName;
//
//  projectil.LauncherIndex := MissileDefinition.FData.Fitted_Weap_Index;
//
//  if Assigned(TargetObject) then
//  begin
//    projectil.TargetIndex       := TT3PlatformInstance(TargetObject).InstanceIndex;
//    projectil.TargetName        := TT3PlatformInstance(TargetObject).InstanceName;
//    projectil.TargetTrackCourse := TT3PlatformInstance(TargetObject).Course;
//    projectil.TargetTrackSpeed  := TT3PlatformInstance(TargetObject).Speed;
//    projectil.TargetTrackAlt    := TT3PlatformInstance(TargetObject).Altitude;
//
//    if TT3PlatformInstance(TargetObject).PlatformDomain = 0 then
//      projectil.isAirLaunch := True
//    else
//      projectil.isAirLaunch := False;
//  end;
//
//  projectil.isInstructor    := TT3PlatformInstance(FParent).isInstructor;
//  projectil.Initialize;
//
//  projectil.FTurnOnSeekRange := SeekerRangeTurn;
//  projectil.FDefaultAltitude := DefaultAltitude;
//
//  projectil.LauncherNumber := FLauncerNumber;
//  projectil.Engagement     := FEngagement;
//  projectil.HAFO := HitMode.HAFO;
//
//  InitAfterLaunch;

  result := projectil;


end;

function TT3HybridOnVehicle.CreateTorpedoProjectile: TT3Torpedo;
var
  projectil : TT3Torpedo;
  behav : TScripted_Behav_Definition; //add
  TorpedoDefinition : TRecTorpedo_Definition;
  tPt : t3DPoint;
begin
  projectil := TT3Torpedo.Create;
  behav     := TScripted_Behav_Definition.Create;

  TorpedoDefinition := THybrid_On_Board(UnitDefinition).FTorpedo_Def;
  projectil.WeaponWaypoint.Add(behav, nil);  //add
  projectil.WeaponWaypoint.ApplyWeaponWaypoint;
  projectil.WeaponWaypoint.Owner := Parent;

  projectil.Parent          := FParent;
  projectil.Owner           := FParent;
  projectil.UnitMotion      := FTorpedoMotion;
//  projectil.UnitDefinition  := TTorpedo_On_Board(UnitDefinition);
//  TTorpedo_On_Board(projectil.UnitDefinition).FDef := TorpedoDefinition;

  projectil.UnitGroup       := UnitGroup;
  projectil.Enable          := Enable;
  projectil.WeaponCategory  := WeaponCategory;
  projectil.Track_ID        := 'TOR';
  projectil.SearchDepth     := TorpedoDefinition.Max_Torpedo_Search_Depth;
//  projectil.LaunchMethod    := FTorpedoDefinition.Launch_Method;
  projectil.SearchRadius    := TorpedoDefinition.Max_Range;
  projectil.SearchDepth     := TorpedoDefinition.Default_Depth;
  projectil.SafetyCeiling   := TorpedoDefinition.Acoustic_Torp_Ceiling_Depth;
  projectil.SeekerRange     := TorpedoDefinition.Seeker_TurnOn_Range;
//  projectil.LaunchBearing   := FTorpedoDefinition.LaunchBearing;
  projectil.TipeTorpedo     := 2;
  projectil.isInstructor    := isInstructor;
  projectil.isWasdal        := isWasdal;

  {Harus ada target}
  projectil.TargetObject    := Parent;

  tPt.X                     := FAimpoint_Movement.PositionX;
  tPt.y                     := FAimpoint_Movement.PositionY;
  tPt.Z                     := FParent.PosZ;
//
//  projectil.TargetPosition   := tPt;
//  projectil.TargetCourse     := TT3PlatformInstance(TargetObject).Course;
//  projectil.TargetSpeed      := TT3PlatformInstance(TargetObject).Speed;
  //----------------------------------------------------------------------------

//  projectil.Initialize;

  Result := projectil;
end;

destructor TT3HybridOnVehicle.Destroy;
begin

  inherited;
end;

procedure TT3HybridOnVehicle.Initialize;
begin
  inherited;

  // downcast object definition
  if Assigned(UnitDefinition) then
  begin
    FHybridDefinition := THybrid_On_Board(UnitDefinition);
    FMissileDefinition := THybrid_On_Board(UnitDefinition).FMissile_Def;
    FTorpedoDefinition := THybrid_On_Board(UnitDefinition).FTorpedo_Def;
  end;

  // get motion characteristic
  dmTTT.GetMotionCharacteristicDef(FHybridDefinition.FMissile_Def.Motion_Index,FMissileMotion);
  dmTTT.GetMotionCharacteristicDef(FHybridDefinition.FTorpedo_Def.Motion_Index,FTorpedoMotion);

  // get poh torpedo
  dmTTT.GetPOHHybrid(FTorpedoDefinition.Torpedo_Index, FPohAspect);

  // set name and index for instance object
  InstanceName  := FHybridDefinition.FData.Instance_Identifier;
  InstanceIndex := FHybridDefinition.FData.Fitted_Weap_Index;
  FFiringDelay  := FHybridDefinition.FData.Firing_Delay;
  FQuantity     := FHybridDefinition.FData.Quantity;

  FWeaponCategory := wcHybrid;
  FSalvoSize      := 1;

  FAimpoint_Movement.PositionX := 0;
  FAimpoint_Movement.PositionY := 0;

  WeaponRange := FHybridDefinition.FMissile_Def.Max_Range;

end;

procedure TT3HybridOnVehicle.Move(const aDeltaMs: double);
begin
  inherited;

  if not Assigned(Parent) then exit;

  FPosition.X := Parent.getPositionX;
  FPosition.Y := Parent.getPositionY;
  FPosition.Z := Parent.getPositionZ;
end;

function TT3HybridOnVehicle.PrepareLaunch: TT3HybridMissile;
var
  projectil : TT3HybridMissile;
  isInRange : boolean;
begin
  result := nil;

  if not (FQuantity > 0) then exit;

  isInRange := true;
  if (CalcRange(FPosition.X,FPosition.Y, FAimpoint_Movement.PositionX,
      FAimpoint_Movement.PositionY) <=
     FHybridDefinition.FMissile_Def.Min_Range) or
     (CalcRange(FPosition.X,FPosition.Y, FAimpoint_Movement.PositionX,
      FAimpoint_Movement.PositionY) >=
     FHybridDefinition.FMissile_Def.Max_Range) then begin

    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3HybridOnVehicle.PrepareLaunch', 'Target is neither too close or too far');
    Exit;
  end;

  if isInRange then
  begin
    projectil := CreateProjectile;
    result := projectil;
    Quantity := Quantity - 1;
  end;

end;

procedure TT3HybridOnVehicle.SetCruiseAltitude(const Value: integer);
begin
  FCruiseAltitude := Value;
end;

procedure TT3HybridOnVehicle.SetQuantity(const Value: Integer);
begin
//  FQuantity := Value;

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

procedure TT3HybridOnVehicle.SetSalvoSize(const Value: Integer);
begin
  FSalvoSize := Value;
end;

procedure TT3HybridOnVehicle.UpdateVisual;
begin
  if not Assigned(Parent) then exit;

  FPosition.X := Parent.getPositionX;
  FPosition.Y := Parent.getPositionY;
  FPosition.Z := Parent.getPositionZ;

  inherited;

end;

end.
