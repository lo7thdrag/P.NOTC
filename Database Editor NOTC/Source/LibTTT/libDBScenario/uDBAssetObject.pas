unit uDBAssetObject;

interface

uses

  Windows, Classes, SysUtils, Graphics, tttData, uDBAsset_Vehicle,
  uDBAsset_Radar, uDBAsset_Sonar, uDBAsset_Countermeasure, uDBAsset_Cubicle,
  uDBAsset_Satellite, uDBAsset_Sonobuoy, uDBAsset_MotionCharacteristics,
  uDBAsset_Logistics, uGameData_TTT, uDBAsset_Transport,

  uSimObjects, uSimVisuals, uObjectVisuals, u2DMover,
  uBaseCoordSystem, uSteppers, uSimContainers,
  uWaypoint, uDBAsset_Scripted, Dialogs, uVectorVisual;

  const
    fromRuntime = 1;
    fromFilter = 2;
    fromPattern = 3;
    fromVehicle = 4;
    fromMineSel = 5;
    fromGunSel = 6;
    fromTorpedoSel = 7;
    fromMissile = 8;
    fromBombSel = 9;
    fromMissileSel = 10;
    fromRA = 11;
    fromTorpedo = 12;
    fromCharacteristic = 13;
    fromSonobuoy = 14;

    fromMain = 15;       //logistics
type

  TScenario_Definition = class
  public
    FData : TRecScenario_Definition;
  end;

  TGame_Area_Definition = class
  public
    FData  : TRecGame_Area_Definition;
  end;

  //===============================================================================

  TWaypoint_Data = class
    public
      FData : TRecWaypoint_Data;
  end;

  TWaypoint_Def = class
    public
      FData : TRecWaypoint_Def;
      FScenario : TRecScenario_Definition;
      isShow : Boolean;
  end;

  TResource_Waypoint_Mapping = class
  public
    FData : TRecResource_Waypoint_Mapping;
    FResource_Allocation : TRecResource_Allocation;
  end;

  TTarget_Def = class
    public
      FData : TRecTarget_Def;
  end;

  // ------------------------------------------------------------------------------
  TMissile_Definition = class
  public
    FData: TRecMissile_Definition;
  end;

  // ------------------------------------------------------------------------------
  TTorpedo_Definition = class
  public
    FData: TRecTorpedo_Definition;
  end;

  // ------------------------------------------------------------------------------
  TMine_Definition = class
  public
    FData: TRecMine_Definition;
  end;

  // ------------------------------------------------------------------------------
  THybrid_Definition = class
  public
    FData: TRecHybrid_Definition;
  end;

  // ------------------------------------------------------------------------------
  TChaff_Definition = class
  public
    FData: TRecChaff_Definition;
  end;

  // ------------------------------------------------------------------------------
  TJammer_Definition = class
  public
    FData: TRecRadar_Noise_Jammer_Definition;
    FNote  : TRecNote_Storage;
  end;

  // ------------------------------------------------------------------------------
  TAcoustic_Decoy_Definition = class
  public
    FData: TRecAcoustic_Decoy_Definition;
  end;

  // ------------------------------------------------------------------------------
  TAir_Bubble_Definition = class
  public
    FData: TRecAir_Bubble_Definition;
  end;

  // ------------------------------------------------------------------------------
  TChaff_On_Board = class
  public
    FData: TRecChaff_On_Board;
  end;

  // ------------------------------------------------------------------------------
  THosted_Platform = class
  public
    FData: TRecHosted_Platform;
    FVehicle: TRecVehicle_Definition end;
  // ------------------------------------------------------------------------------

  TResource_Allocation = class
  public
      FData : TRecResource_Allocation;
      FPlotting : TrecPlotting_Mapping;
      FPlotting_Usage : TRecPlotting_Usage;
      FOverlay : TRecOverlay_Definition;
      FResource_Overlay : TRecResource_Overlay_Mapping;
      FPattern : TRecPredefined_Pattern;
      FResource_Pattern : TRecResource_Pattern_Mapping;
      FRadarList : TRecRadar_Interval_List;
      FRadarListMap : TRecResource_Interval_List_Mapping;
  end;

  // ------------------------------------------------------------------------------

  TStudent_Role_Definition = class
  public
    FData: TRecStudent_Role_Definition;
  end;

  // ------------------------------------------------------------------------------

  TStudent_Role_List = class
  public
    FData: TRecStudent_Role_List;
    FResource_Allocation   : TRecResource_Allocation;
  end;

  // ------------------------------------------------------------------------------

  TCubicle_Group_Assignment = class(TSimObject)

  private
    function getIdCubicle: integer;

  public
    FPlatform : TRecPlatform_Instance;
    FData     : TRecCubicle_Group;
    FCubicle  : TRecCubicle_Group_Assignment;
    Cubicle_Group: TCubicle_Group;
    FChannel  : TRecCubicle_Group_Channel_Assgnmnt;

    constructor Create;
    destructor Cubicle_Group_AssignmenDestroy; // override;

    property IdCubicle: integer read getIdCubicle;

  end;

  // constructor TCubicle_Group_Assignment.Create;
  // destructor TCubicle_Group_Assignment.Destroy;

  // ------------------------------------------------------------------------------
  TPlatform_Type = class(TSimObject)
    public
      FData : TRecPlatform_Type;
  end;
  // ------------------------------------------------------------------------------

  TPlatform_Instance_Identifier = class
  public
    FData  : TRecPlatform_Instance_Identifier;
  end;

  // ------------------------------------------------------------------------------
  TMoveChangeState = (mcsStable, mcsIncrease, mcsDecrease);


  // ------------------------------------------------------------------------------

  TPlatform_Instance = class(TSimObject)
    private
      FOnChange: TNotifyEvent;
    function getHealth: Integer;

  protected
    FOrderedSpeed           : double;
    FOrderedSpeedAchieved   : boolean;
    FSpeedState             : TMoveChangeState;

    FOrderedHeadingAchieved : boolean;

    FOrderedHeading   : double;
    FDeltaHead        : double;
    FHeadingState     : TMoveChangeState;

    FOrderedAltitude: double;
    FAltitudeState : TMoveChangeState;

    procedure SetOrderedSpeed(const Value: double);
    procedure SetOrderedHeading(const Value: double);
    procedure SetOrderedAltitude(const Value: double);

    function getOrderedAltitude: Double;
  protected

    FShowTrails : boolean;
    FSelected : boolean;
    FActivated : boolean;              // untuk menonaktifkan platform ini -> g perlu di draw etc harusnya

    FTotalCruiseLength : double;
    FControlled: boolean;
    FOnHit: TNotifyEvent;

    function getPlatformTtype: integer;
    function getForceDesignation: integer;
    function getTrackId: string;
    function getString(const Index: integer): string;
    procedure setString(const Index: integer; const s: string);

    function getSonarData(const Index: integer): string;
    function getTrackNumber: integer;

    function getPos(const i: integer): double;
    procedure setPos(const i: integer; const val: double);

    function getAltitude: single;  //meter
    procedure setAltitude(const s: single);

    function getDomain: string;

    procedure setActivated(val : boolean);

    procedure WayPointMove(const aDeltaMs: double);

    procedure SetControlled(const Value: boolean);
    procedure SetSelected(const Value: boolean);
    procedure SetShowTrails(const Value: boolean);

    procedure setGrounded(const Value: boolean);
    procedure setOnLand(const Value: boolean);
    procedure SetOnHit(const Value: TNotifyEvent);

    procedure OnWeaponHitSomething(Sender : TObject);
  protected

    FMover: T2DMover;

    FMissileViews: TDrawContainers;
    FTorpedoViews: TDrawContainers;

    // FV = Visual member
    FVHistory: THistoryVisual;
    FTacticalSymbol  : TTacticalSymbol;

    FHisCounter: TDelayer;

    FDetectedObject : TDrawContainers;

    FIsGrounded : boolean;
    FIsOnLand   : boolean;
    FIsRepositioning: boolean;
    FHealth : double; // vs Damage_Capacity

    procedure HistoryOnAddpoint(sender: TObject);

  public
    FData: TRecPlatform_Instance;
    FActivation: TRecPlatform_Activation;
    FScenario: TRecScenario_Definition;
    FResource: TRecResource_Allocation;

    // . . . object
    Vehicle   : TVehicle_Definition;
    Satellite : TSatellite_Definition;
    Sonobuoy  : TSonobuoy_On_Board;
    Hybrid    : THybrid_Definition;
    Motion    : TMotion_Characteristics;
    Logistic  : TLogistics;
    Transport : TTransport;

    FVectorSymbol     : TVectorSymbol;

    ISOnGroup: boolean;
    ClientRole: integer;

    //ISIntruktur: boolean;
    // Waypont   :
    // Missile   : TMissile_Definition;
    { Torpedo   : TTorpedo_Definition;
      Mines     : TMine_Definition;

      }  // 0 0 0   View TDrawContainers
  public

    constructor Create;
    destructor Destroy; override;

    procedure InitData;

    procedure Move(const aDeltaMs: double); override;
    procedure MoveMember(const aDeltaMs: double);


    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;

    procedure DrawDetected(aCnv: tCanvas);

    function defineSensorType(search: string; out sensor : TSimObject): integer;
    function defineWeaponType(search: string): TWeapoonCategory;
    function defineECMType(search: string): integer;
    function findWeapon(search : string) : TObject;

    function FindMissileByID(const mID: integer): TObject;
    function FindGunByID(const mID: integer): TObject;


    function GetMovementData: TRecPlatformMovement;
    procedure SetMovementData(const aRec: TRecPlatformMovement);

    procedure DetectedList(var list : TSimContainer);
    procedure TurnLeft(val : double);
    procedure TurnRight(val : double);

    function getCorrectSymbol(const platform_type: integer;
      const force: integer; var color: TColor): string;

    procedure DepthCheck(const Valid: boolean; const dMin, dMax: double);
    procedure LandCheck(const onLand: boolean);

    procedure BeginReposition;
    procedure EndReposition;
    procedure RepositionTo(const x, y: double);
    procedure HitMe(hitBy : TObject);

  public

    property PlatformType: integer read getPlatformTtype;
    property InstanceName: string index 1 read getString;
    property TrackID: string index 2 read getString;

    property PositionX: double index 1 read getPos write setPos;
    property PositionY: double index 2 read getPos write setPos;
    property PositionZ: double index 3 read getPos write setPos;

    property TrackNumber: integer read getTrackNumber;

    property Course: double index 4 read getPos write setPos;
    property Speed: double index 5 read getPos write setPos;
    property OrderedSpeed   : double read FOrderedSpeed   write SetOrderedSpeed;
    property OrderedHeading : double read FOrderedHeading write SetOrderedHeading;
    property OrderedAltitude: Double read getOrderedAltitude write SetOrderedAltitude;


    property Altitude: single read getAltitude write SetAltitude;
    property Domain: string read getDomain;

    property SonarClass: string index 1 read getSonarData;
    property Activated : boolean read FActivated write setActivated;
    property DetectedObjects : TDrawContainers read FDetectedObject;
    property ShowTrails : boolean read FShowTrails write SetShowTrails;
    property Selected : boolean read FSelected write SetSelected;
    property TacticalSymbol : TTacticalSymbol read FTacticalSymbol;
    property Controlled : boolean read FControlled write SetControlled;

    property Grounded: boolean read FIsGrounded write setGrounded;
    property OnLand: boolean read FIsOnLand write setOnLand;
    property OnHit : TNotifyEvent read FOnHit write SetOnHit;
      property HealthPercent: Integer read getHealth;

  end;

  {
    BitmapSymbol = (AirAssumedFriend = 1, AirborneEarlyWarning,
    AirfieldAssumedFriend, AirfieldFriend, AirfieldHostile, AirfieldNeutral,
    AirfieldPending, AirfieldSuspect, AirfieldUnknown, AirFriend, AirGeneral,
    AirHostile, AirNeutral, AirPending, Airport_Civilian, Airport_Military,
    AirSuspect, AirUnknown, ArmourAssumedFriend, ArmourFriend, ArmourHostile,
    ArmourNeutral, ArmourPending, ArmourSuspect, ArmourUnknown, Assign,
    AswGeneral, BatteryAaaAssumedFriend, BatteryAaaFriend, BatteryAaaHostile,
    BatteryAaaNeutral, BatteryAaaPending, BatteryAaaSuspect,
    BatteryAaaUnknownBatterySamAssumedFriend, BatterySamFriend,
    BatterySamHostile, BatterySamNeutral, BatterySamPending, BatterySamSuspect,
    BatterySamUnknown, BriefContact, Bullseye, Buoy, ChaffAssumedFriend,
    ChaffFriend, ChaffHostile, ChaffNeutral, ChaffPending, ChaffSuspect,
    ChaffUnknown, CoastArtilleryAssumedFriend, CoastArtilleryFriend,
    CoastArtilleryHostile, CoastArtilleryNeutral, CoastArtilleryPending,
    CoastArtillerySuspect, CoastArtilleryUnknown, CoastMissileAssumedFriend,
    CoastMissileFriend, CoastMissileHostile, CoastMissileNeutral,
    CoastMissilePending, CoastMissileSuspect, CoastMissileUnknown,
    CombatAirPatrol, DataLinkReferencePoint, Datum, DecoyAssumedFriend,
    DecoyFriend, DecoyHostile, DecoyNeutral, DecoyPending, DecoySuspect,
    DecoyUnknown, DistressedVessel, DitchedAirCraft, Empty, Engage, EsmEcmFix,
    FixedWingAssumedFriend, FixedWingFriend, FixedWingHostile,
    FixedWingNeutral, FixedWingPending, FixedWingSuspect, FixedWingUnknown,
    ForceCenter, FormationMember, Gate, General, GroundZero, Iff,
    InfantryAssummedFriend, InfantryFriend, InfantryHostile, InfantryNeutral,
    InfantryPending, InfantrySuspect, InfantryUnknown,
    InfraredDecoyAssumedFriend, InfraredDecoyHostile, InfraredDecoyNeutral,
    InfraredDecoyPending, InfraredDecoySuspect, InfraredDecoyUnknown,
    LandAssumedFriend, LandFriend, LandHostile, LandNeutral, LandPending,
    LandSuspect, LandUnknown, ManInWater, MaritimeHeadquarters, MidCrsMissile,
    MineAssumedFriend, MineFriend, MineHazard, MineHostile, MinePending,
    MineSuspect, MineUnknown, MissileAssumedFriend, MissileFriend,
    MissileHostile, MissileNeutral, MissilePending, MissileSuspect,
    MissileUnknown, NavigationHazard, OilRig, OwnShip, Platform,
    Populated_Place, PortAssummedFriend, PortFriend,
    PortHostile, PortNeutral, PortPending, PortSuspect, PortUnknown, Riser,
    RotaryWingAssumedFriend, RotaryWingFriend, RotaryWingHostile,
    RotaryWingNeutral, RotaryWingPending, RotaryWingSuspect, RotaryWingUnknown,
    SearchCenter, Sinker, SonobuoyAssumedFriend, SonobuoyFriend,
    SonobuoyHostile, SonobuoyNeutral, SonobuoyPending,
    SonobuoySuspect, SonobuoyUnknown, SonoMonitorCtrl, SonoMonitorOther,
    Station, SubsurfaceAssumedFriend, SubsurfaceFriend,
    SubsurfaceHostile, SubsurfaceNeutral, SubsurfacePending,
    SubsurfaceSuspect, SubsurfaceUnknown, SurfaceAssumedFriend, SurfaceFriend,
    SurfaceHostile, SurfaceNeutral, SurfacePending, SurfaceSuspect,
    SurfaceUnknown, TacticalGridorigin, TaskGroup, TorpedoAssumedFriend,
    TorpedoFriend, TorpedoHostile, TorpedoNeutral, TorpedoPending,
    Torpedouspect, TorpedoUnknown, WayPoint, WeaponEntryPoint,
    WpnDropPoint, Wreck);
    }

  // platform type enum
  PlatformType = (Air, AirborneEarlyWarning, Airfield, Airport_Civilian,
    Airport_Military, Armour, Assign, AswGeneral, BatteryAaa, BatterySam,
    BriefContact, Bullseye, Buoy, Chaff, CoastArtillery, CoastMissile,
    CombatAirPatrol, DataLinkReferencePoint, Datum, Decoy, DistressedVessel,
    DitchedAirCraft, Empty, Engage, EsmEcmFix, FixedWing, ForceCenter,
    FormationMember, Gate, General, GroundZero, Iff, Infantry, InfraredDecoy,
    Land, ManInWater, MaritimeHeadquarters, MidCrsMissile, Mine, Missile,
    NavigationHazard, OilRig, OwnShip, _Platform, Populated_Place, Port, Riser,
    RotaryWing, SearchCenter, Sinker, Sonobuoy, SonoMonitorCtrl,
    SonoMonitorOther, Station, Subsurface, Surface, TacticalGridorigin,
    TaskGroup, Torpedo, WayPoint, WeaponEntryPoint, WpnDropPoint, Wreck);

  // force_designation enum
  forceType = (AssumedFriend, Friend, Hostile, Neutral, Pending, Suspect,
    Unknown);

implementation

uses
  uCoordConvertor, uLibSettingTTT, uDBAsset_Weapon, uDBAsset_Sensor;

{ TCubicle_Group_Assignment }

constructor TCubicle_Group_Assignment.Create;
begin
  inherited;
  Cubicle_Group := TCubicle_Group.Create;
end;

destructor TCubicle_Group_Assignment.Cubicle_Group_AssignmenDestroy;
begin
  Cubicle_Group.Free;
  inherited;
end;

function TCubicle_Group_Assignment.getIdCubicle: integer;
begin
  Result := FData.Group_Index;
end;

{ TPlatform_Instance }

constructor TPlatform_Instance.Create;
var
  cnv: TCanvas;
  color: TColor;
begin
  FMover := T2DMover.Create;

  FHisCounter := TDelayer.Create;
  FHisCounter.DInterval := 4.0;
  FHisCounter.OnTime    := HistoryOnAddpoint;
  FHisCounter.Enabled := true;

  Vehicle := TVehicle_Definition.Create;
  Satellite := TSatellite_Definition.Create;
  Sonobuoy := TSonobuoy_On_Board.Create;
  Hybrid := THybrid_Definition.Create;

  FMissileViews := TDrawContainers.Create;
  FTorpedoViews := TDrawContainers.Create;

  FTacticalSymbol := TTacticalSymbol.Create;

  FOrderedSpeed    := 0;
  FOrderedHeading  := 0;
  FOrderedAltitude := 0;

  FOrderedSpeedAchieved   := true;
  FOrderedHeadingAchieved := true;
  
  FAltitudeState := mcsStable;
  FSpeedState    := mcsStable;
  FHeadingState  := mcsStable;

  FShowTrails := false;
  FTotalCruiseLength := 0;

  FControlled := false;
  FSelected   := false;
  FActivated  := false;

  FVHistory := THistoryVisual.Create;
  FVHistory.Color := clGray;
  FVHistory.Visible := FShowTrails;

  FDetectedObject := TDrawContainers.Create;
  FIsRepositioning  := false;
  FIsGrounded       := false;
  FIsOnLand         := false;

end;

destructor TPlatform_Instance.Destroy;
begin
  FMover.Free;
  FHisCounter.Free;
  Hybrid.Free;

  FVHistory.Free;
  FTacticalSymbol.Free;

  FMissileViews.Free;
  FTorpedoViews.Free;
  FDetectedObject.Free;

  if Assigned(Vehicle) then
    FreeAndNil(Vehicle);
  if Assigned(Satellite) then
    FreeAndNil(Satellite);
  if Assigned(Sonobuoy) then
    FreeAndNil(Sonobuoy);

  inherited;
end;

procedure TPlatform_Instance.DetectedList(var list : TSimContainer);
var
  i: integer;
  rdr: TRadar_On_Board;
  snr: TSonar_On_Board;
  vis: TVisual_Sensor_On_Board;
  msl: TMissile_On_Board;
  tpd: TTorpedo_On_Board;
  gun: TGun_Definition;
begin

  if Vehicle <> nil then
  begin

    for i := 0 to Vehicle.Radars.Count - 1 do
    begin
      rdr := Vehicle.Radars[i];
      rdr.Parent := self;
      rdr.SetObjects(list, FDetectedObject);
    end;

    for i := 0 to Vehicle.Sonars.Count - 1 do
    begin
      snr := Vehicle.Sonars[i];
      snr.Parent := self;
      snr.SetObjects(list, FDetectedObject);
    end;

    for i := 0 to Vehicle.Visualsensors.Count - 1 do begin
      vis := Vehicle.Visualsensors[i];
      vis.Parent := self;
      vis.SetObjects(list, FDetectedObject);
    end;

    for i := 0 to Vehicle.Missiles.Count - 1 do
    begin
      msl := Vehicle.Missiles[i];
      msl.Parent := self;
      msl.OnHitSomething := OnWeaponHitSomething;
      //list.AddObject(msl);
    end;

    for i := 0 to Vehicle.Torpedos.Count - 1 do
    begin
      tpd := Vehicle.Torpedos[i];
      tpd.Parent := self
      //list.AddObject(tpd);
    end;

    for i := 0 to Vehicle.Guns.Count - 1 do
    begin
      gun := Vehicle.Guns[i];
      gun.Parent := self;
    end;
  end;

end;


function TPlatform_Instance.getPlatformTtype: integer;
begin
  //Result := FData.platform_type;
  Result := Vehicle.FData.Platform_Type;
end;

function TPlatform_Instance.getForceDesignation: integer;
begin
  Result := FData.Force_Designation;
end;

function TPlatform_Instance.getHealth: Integer;
begin
  if Vehicle.FData.Damage_Capacity > 0 then
    Result := Round( (FHealth * 100) / Vehicle.FData.Damage_Capacity)
  else
    Result := 100;

end;

function TPlatform_Instance.getTrackId: string;
begin
  Result := FData.Track_ID;
end;

function TPlatform_Instance.getString(const Index: integer): string;
begin
  case Index of
    1:
      Result := FData.Instance_Name;
    2:
      Result := FData.Track_ID;
  end;
end;

procedure TPlatform_Instance.setString(const Index: integer; const s: string);
begin
  case Index of
    1:
      FData.Instance_Name := s;
    2:
      FData.Track_ID := s;
  end;
end;

function TPlatform_Instance.getSonarData(const Index: integer): string;
var
  sonar: TSonar_On_Board;
begin
  Result := '';
  case Index of
    1:
      begin
        if Vehicle <> nil then
        begin

          if Vehicle.Sonars.Count > 1 then
          begin
            sonar := Vehicle.Sonars.Items[0];
            Result := sonar.FDef.Sonar_Identifier;

          end;
        end;
      end;
  end;

end;

function TPlatform_Instance.getPos(const i: integer): double;
begin
  Result := 0;
  try
  case i of
    1: Result := FMover.X;
    2: Result := FMover.Y;
    3: Result := FMover.Z;
    4: Result := ConvCartesian_To_Compass(FMover.Direction);
    5: Result := FMover.Speed;
  end;
  except
    //ShowMessage(intToStr( FData.Vehicle_Index));
  end;
end;

procedure TPlatform_Instance.setPos(const i: integer; const val: double);
begin
  case i of
    1: FMover.X := val;
    2: FMover.Y := val;
    3: FMover.Z := val;
    4: FMover.Direction := ConvCompass_To_Cartesian(val);
    5: FMover.Speed := val;
  end;
end;

function TPlatform_Instance.getAltitude: single;
begin
  Result := FMover.Z * C_Degree_To_NauticalMile * C_NauticalMile_To_Metre;
end;

procedure TPlatform_Instance.setAltitude(const s: single);
begin
  FMover.Z := s / (C_Degree_To_NauticalMile * C_NauticalMile_To_Metre);
end;

procedure TPlatform_Instance.SetSelected(const Value: boolean);
begin
  FSelected := Value;
  FTacticalSymbol.Selected := Value;
end;

procedure TPlatform_Instance.SetShowTrails(const Value: boolean);
begin
  FShowTrails := Value;
  FVHistory.Visible := Value;
end;

procedure TPlatform_Instance.setActivated(val: boolean);
begin
  FActivated := val;
  if not FActivated then begin
    FDetectedObject.ClearItems;
  end;
end;

procedure TPlatform_Instance.TurnLeft(val: double);
begin
  FMover.TurnRate := val;
end;

procedure TPlatform_Instance.TurnRight(val: double);
begin
  FMover.TurnRate := -val;
end;

function TPlatform_Instance.getTrackNumber: integer;
begin
  Result := FActivation.Deployment_Index;
end;


function TPlatform_Instance.getDomain: string;
begin
  if Vehicle.FData.Platform_Domain = 0 then
    Result := 'Air';
  if Vehicle.FData.Platform_Domain = 1 then
    Result := 'Surf';
  if Vehicle.FData.Platform_Domain = 2 then
    Result := 'Sub';
  if Vehicle.FData.Platform_Domain = 3 then
    Result := 'Land';
  if Vehicle.FData.Platform_Domain = 4 then
    Result := 'Gen';
end;

// result := nama bitmap yang sesuai
function TPlatform_Instance.getCorrectSymbol(const platform_type: integer;
  const force: integer; var color: TColor): string;

var
   symbolBMP, postfix: string;
begin
  symbolBMP := '';
  postfix := pfFriend;

  {if force = piFriend then  postfix := pfFriend;           //friend
  if force = piAssumedFriend then  postfix := pfAssumedFriend;    //assumed friend
  if force = piHostile then  postfix := pfHostile;          //hostile
  if force = piNeutral then  postfix := pfNeutral;          //neutral
  if force = piPending then  postfix := pfPending;          //pending
  if force = piUnknown then  postfix := pfUnknown;          //unknown
  if force = piSuspect then  postfix := pfSuspect;          //suspect}

  case platform_type of
    vhtFighter       : symbolBMP := pctAir + postfix ;
    vhtStrikeBomber  : symbolBMP := pctAir + postfix ;
    vhtFixed         : symbolBMP := pctFixedWing + postfix ;
    vhtFixedEW       : symbolBMP := pctFixedWing + postfix ;
    vhtRotaryAttack  : symbolBMP := pctRotaryWing + postfix ;
    vhtRotaryASW     : symbolBMP := pctRotaryWing + postfix ;
    vhtFixedSurv     : symbolBMP := pctFixedWing + postfix ;
    vhtFixedRec      : symbolBMP := pctFixedWing + postfix ;
    vhtSeaPlane      : symbolBMP := pctSurface + postfix ;
    vhtMissile       : symbolBMP := pctMissile + postfix ;
    vhtAirCarrier    : symbolBMP := pctAir + postfix ;
    vhtCruiseGuided  : symbolBMP := pctSurface + postfix ;
    vhtDestroGuided  : symbolBMP := pctSurface + postfix ;
    vhtFrigatGuided  : symbolBMP := pctSurface + postfix ;
    vhtDestroyer     : symbolBMP := pctSurface + postfix    ;
    vhtFrigate       : symbolBMP := pctSurface + postfix      ;
    vhtMineWarfare   : symbolBMP := pctSurface + postfix  ;
    vhtPatrolCraft   : symbolBMP := pctSurface + postfix  ;
    vhtMerchant      : symbolBMP := pctSurface + postfix     ;
    vhtUtilityVess   : symbolBMP := pctSurface + postfix  ;
    vhtSurfOther     : symbolBMP := pctSurface + postfix    ;
    //vhtNuclearBalis : symbolBMP := pctSurface + postfix ;
    //vhtAuxiliary    : symbolBMP := pctSurface + postfix ;
    vhtNuclearAtt    : symbolBMP := pctSubSurface + postfix   ;
    vhtNuclearGuided : symbolBMP := pctSubSurface + postfix;
    vhtDieselAttack  : symbolBMP := pctSubSurface + postfix ;
    vhtDieselGuided  : symbolBMP := pctSubSurface + postfix ;
    vhtBaterySurf    : symbolBMP := pctBatterySam + postfix ;
    vhtBateryMissile : symbolBMP := pctBatterySam + postfix ;
    vhtBateryGun     : symbolBMP := pctBatterySam + postfix ;
    vhtAirfield      : symbolBMP := pctAirfield + postfix     ;
    vhtPlatoonArm    : symbolBMP := pctArmour + postfix  ;
    vhtPlatoonInf    : symbolBMP := pctInfantry + postfix  ;
    vhtBatteryArt    : symbolBMP := pctBatteryAaa + postfix ;
    vhtPort          : symbolBMP := pctPort + postfix ;
    vhtSpecialCraft  : symbolBMP := pctSurface + postfix ;
//    vhtOther         : symbolBMP := pctSurface + postfix ;
    //vhtAmphibious    : symbolBMP := pctSurface + postfix ;
    vhtRotarySurv    : symbolBMP := pctRotaryWing + postfix ;
    vhtRotaryRec     : symbolBMP := pctRotaryWing + postfix ;
  else
    symbolBMP := pctGeneral;
  end;

  case force of
    1 : color := clRed;
    2 : color := clYellow;
    3 : color := clBlue;
    4 : color := clGreen;
    5,6 : color := clwhite;
  end;

  result := symbolBMP;
end;

function TPlatform_Instance.defineSensorType
  (search: string; out sensor: TSimObject): integer;
var
  found: boolean;
  i: integer;
  rdr: TRadar_On_Board;
  snr: TSonar_On_Board;
  vis: TVisual_Sensor_On_Board;
  esm: TESM_On_Board;
begin
  Result := 0;
  found  := false;
  sensor := nil;

  // radar
  i := 0;

  while (not(found) and (Vehicle.Radars.Count > (i))) do
  begin
    rdr := Vehicle.Radars[i];
    if SameStr(rdr.FData.Instance_Identifier, search) then
    begin
      found := true;
      sensor := rdr;
      Result := 1; // isRadar
    end;
    inc(i);
  end;

  // sonar
  i := 0;
  while (not(found) and (Vehicle.Sonars.Count > (i))) do
  begin
    snr := Vehicle.Sonars[i];
    if SameStr(snr.FData.Instance_Identifier, search) then
    begin
      found := true;
      sensor := snr;
      Result := 2; // isSonar
    end;
    inc(i);
  end;

  // visual
  i := 0;
  while (not(found) and (Vehicle.Visualsensors.Count > (i))) do
  begin
    vis := Vehicle.Visualsensors[i];
    if SameStr(vis.FData.Instance_Identifier, search) then
    begin
      found := true;
      sensor := vis;
      Result := 3; // isVisual
    end;
    inc(i);
  end;

  // ESM
  i := 0;
  while (not(found) and (Vehicle.ESMSensors.Count > (i))) do
  begin
    esm := Vehicle.ESMSensors[i];
    if SameStr(esm.FData.Instance_Identifier, search) then
    begin
      found := true;
      sensor := esm;
      Result := 4; // isVisual
    end;
    inc(i);
  end;
end;

function TPlatform_Instance.defineECMType(search: string): integer;
var
  found: boolean;
  i: integer;
  chf: TChaff_On_Board;
  jam: TRadar_Noise_Jammer_On_Board;
  defjam: TDefensive_Jammer_On_Board;
  accDecoy: TAcoustic_Decoy_On_Board;
  airbub: TAir_Bubble_On_Board;
begin
  Result := 0;
  found := false;

  // Chaff;
  if Vehicle.Chaffs.Count > 0 then
  begin
    chf := Vehicle.Chaffs.Items[0];

    if SameStr(chf.FData.Instance_Identifier, search) then
    begin
      found := true;
      Result := 1; // isChaff
    end;
  end;

  // jammer
  i := 0;
  while (not(found) and (Vehicle.Jammers.Count > (i))) do
  begin
    jam := Vehicle.Jammers[i];
    if SameStr(jam.FData.Instance_Identifier, search) then
    begin
      found := true;
      Result := 2; // isJammer
    end;
    inc(i);
  end;

  // defensive jammer
  i := 0;
  while (not(found) and (Vehicle.Defensive_Jammers.Count > (i))) do
  begin
    defjam := Vehicle.Defensive_Jammers[i];
    if SameStr(defjam.FData.Instance_Identifier, search) then
    begin
      found := true;
      Result := 3; // isDefensiveJammer
    end;
    inc(i);
  end;

  // accoustic Decoy
  i := 0;
  while (not(found) and (Vehicle.Acoustic_Decoys.Count > (i))) do
  begin
    accDecoy := Vehicle.Acoustic_Decoys[i];
    if SameStr(accDecoy.FData.Instance_Identifier, search) then
    begin
      found := true;
      Result := 4; // isAccousticDecoy
    end;
    inc(i);
  end;

  // airbubble
  i := 0;
  while (not(found) and (Vehicle.Air_Bubble_Mount.Count > (i))) do
  begin
    airbub := Vehicle.Air_Bubble_Mount[i];
    if SameStr(airbub.FData.Instance_Identifier, search) then
    begin
      found := true;
      Result := 5; // isAirbubble
    end;
    inc(i);
  end;

end;

function TPlatform_Instance.defineWeaponType(search: string): TWeapoonCategory;
var
  found: boolean;
  i: integer;
  misl: TMissile_On_Board;
  torp: TTorpedo_On_Board;
  mine: TMine_On_Board;
  bomb: TBomb_Definition;
  gun : TGun_Definition;
begin
  found := false;

  // missile
  i := 0;
  while (not(found) and (Vehicle.Missiles.Count > (i))) do
  begin
    misl := Vehicle.Missiles[i];
    if SameStr(misl.FData.Instance_Identifier, search) then
    begin
      found := true;
      Result := misl.WeaponCategory;
    end;
    inc(i);
  end;

  // torpedo
  i := 0;
  while (not(found) and (Vehicle.Torpedos.Count > (i))) do
  begin
    torp := Vehicle.Torpedos[i];
    if SameStr(torp.FData.Instance_Identifier, search) then
    begin
      found := true;
      Result := torp.WeaponCategory;
    end;
    inc(i);
  end;

  // mine
  i := 0;
  while (not(found) and (Vehicle.Mines.Count > (i))) do
  begin
    mine := Vehicle.Mines[i];
    if SameStr(mine.FData.Instance_Identifier, search) then
    begin
      found := true;
      Result := mine.WeaponCategory; // mine
    end;
    inc(i);
  end;

  // bomb
  i := 0;
  while (not(found) and (Vehicle.Bombs.Count > (i))) do
  begin
    bomb := Vehicle.Bombs[i];
    if SameStr(bomb.FData.Bomb_Identifier, search) then
    begin
      found := true;
      Result := bomb.WeaponCategory; // bomb
    end;
    inc(i);
  end;

  // gun
  i := 0;
  while (not(found) and (Vehicle.Guns.Count > (i))) do
  begin
    gun := Vehicle.Guns[i];
    if SameStr(gun.FData.Gun_Identifier, search) then
    begin
      found := true;
      Result := gun.WeaponCategory; // isTorpedo
    end;
    inc(i);
  end;
end;

procedure TPlatform_Instance.HistoryOnAddpoint(sender: TObject);
begin
  if Speed > 0 then
    FVHistory.AddPoint(PositionX, PositionY);
end;

function getDeltaH(const dst, src: double): double;
begin
    result := dst - src;
  if result < -180.0 then
    result := result + 360.0
  else
    if result > 180.0 then
      result := result - 360.0;

end;

procedure TPlatform_Instance.HitMe(hitBy : TObject);
begin
  if hitBy.ClassType = TMissile_On_Board then
    FHealth := FHealth - TMissile_On_Board(hitBy).FDef.Lethality;

//    Vehicle.FData.Damage_Capacity := Vehicle.FData.Damage_Capacity -
//      TMissile_On_Board(hitBy).FDef.Lethality;

  if hitBy.ClassType = TShoot then
     FHealth := FHealth - TShoot(hitBy).Lethality;

//    Vehicle.FData.Damage_Capacity := Vehicle.FData.Damage_Capacity - TShoot
//      (hitBy).Lethality;

//  if Vehicle.FData.Damage_Capacity <= 0 then
  if FHealth <= 0 then begin
    FHealth := 0;
    if Assigned(FOnHit) then
    begin
      FOnHit(self);
      self.FreeMe := true;
    end;
  end;
end;

procedure TPlatform_Instance.Move(const aDeltaMs: double);
var

  obj : TSimObject;
  turnRate, tightRate : double;
  acceleration, deceleration : double;
begin
  inherited;

  if Vehicle <> nil then begin
    case Vehicle.GuidanceType of
      vgtWaypoint : ; {WayPointMove(aDeltaMs);}
    end;
  end;

  if FSpeedState = mcsIncrease then begin

    if (FMover.Speed >= FOrderedSpeed) then begin
      FMover.Speed := FOrderedSpeed;
      FMover.Acceleration := 0.0;
      FSpeedState := mcsStable;
    end;
    if FMover.Speed >= Motion.FData.Max_Ground_Speed then begin
      FMover.Acceleration := 0;
      FMover.Speed := Motion.FData.Max_Ground_Speed;
      FSpeedState := mcsStable;
    end;

  end
  else if FSpeedState = mcsDecrease then begin

    if FOrderedSpeed < FMover.Speed then begin
      FMover.Speed := FOrderedSpeed;
      FMover.Acceleration := 0.0;
      FSpeedState := mcsStable;

      if FMover.Speed < Motion.FData.Min_Ground_Speed then begin
        FMover.Speed := Motion.FData.Min_Ground_Speed;
        FMover.Acceleration := 0.0;
        FSpeedState := mcsStable;
      end;
    end;
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

   //CalcRange()
{  turnRate     := Motion.FData.Standard_Turn_Rate; // degree per second
  tightRate    := Motion.FData.Tight_Turn_Rate;    // degree per second

  if not FOrderedHeadingAchieved then begin

     if (Course - FOrderedHeading) > 0  then begin
      if (Course - FOrderedHeading) < 180  then
        TurnLeft(turnRate)
      else
        TurnRight(turnRate);
    end else
    if (Course - FOrderedHeading) < 0  then begin
      if Abs(Course - FOrderedHeading) > 180  then
        TurnLeft(turnRate)
      else
        TurnRight(turnRate);
    end
  end;

  if (not(FOrderedHeadingAchieved)) and (Abs(FOrderedHeading - Course) <= 0.5) then begin
    FMover.TurnRate := 0;
    FOrderedHeadingAchieved := true;
    FMover.Direction := FOrderedHeading;
  end;

}
  if FAltitudeState = mcsIncrease then begin
    if FMover.Z >= FOrderedAltitude then begin
      FMover.Z := FOrderedAltitude;
      FMover.Vertical_Accel := 0.0;
      FMover.VerticalSpeed  := 0.0;
      FMover.ClimbRate      := 0;
      FMover.DescentRate    := 0;
      FAltitudeState := mcsStable;
    end

    // going up
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
  FHisCounter.Run(aDeltaMs);

end;

procedure TPlatform_Instance.MoveMember(const aDeltaMs: double);
var i: Integer;
begin
  try
  // jika tidak active dalam permainan, maka sebaiknya tidak dijalankan.
  //harus run di server ?
  if Activated and (ClientRole <> crpInstruktur) then
//  if Activated then
  begin
    for i := 0 to Vehicle.Radars.Count - 1 do
      TSimObject( Vehicle.Radars[i]).Move(aDeltaMs);

    for i := 0 to Vehicle.Sonars.Count - 1 do
      TSimObject( Vehicle.Sonars[i]).Move(aDeltaMs);

    for i := 0 to Vehicle.ESMSensors.Count - 1 do
      TSimObject( Vehicle.ESMSensors[i]).Move(aDeltaMs);

    for i := 0 to Vehicle.Visualsensors.Count - 1 do
      TSimObject( Vehicle.Visualsensors[i]).Move(aDeltaMs);
  end;

  for i := 0 to Vehicle.Missiles.Count - 1 do
    TSimObject( Vehicle.Missiles[i]).Move(aDeltaMs);

  for i := 0 to Vehicle.Guns.Count - 1 do
    TSimObject( Vehicle.Guns[i]).Move(aDeltaMs);

  //for i := 0 to Vehicle.Torpedos.Count - 1 do
  //  TSimObject( Vehicle.Torpedos[i]).Move(aDeltaMs);
  finally

  end;
end;

procedure TPlatform_Instance.OnWeaponHitSomething(Sender: TObject);
var i : integer;
  found : boolean;
begin
  found := false;
  if Sender.ClassType = TMissile_On_Board then begin
    for I := Vehicle.Missiles.Count - 1 downto 0 do begin
      if Vehicle.Missiles[i] = Sender then begin
        Vehicle.Missiles.Delete(i);
        found := true;
        break;
      end;
    end;

    if found then Sender.Free;
  end;
end;

procedure TPlatform_Instance.InitData;
var
  symbol : string;
  color : TColor;
begin
  // dipanggil setelah object di create dari database
  FMover.X := FActivation.Init_Position_Longitude;
  FMover.Y := FActivation.Init_Position_Latitude;
  Altitude := FActivation.Init_Altitude;

  FMover.Direction := ConvCompass_To_Cartesian(FActivation.Init_Course);
  FMover.Speed := FActivation.Init_Ground_Speed;
  FMover.Enabled := true;

  //FMover.Acceleration := Motion.FData.Acceleration;
  FMover.MaxSpeed := MOtion.FData.Max_Ground_Speed;
  //FMover.TurnRate := Motion.FData.Standard_Turn_Rate;

  symbol := getCorrectSymbol(getPlatformTtype,getForceDesignation,color);
  FTacticalSymbol.Color := COlor;
  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + symbol + '.bmp',color);
//  FHealth := Vehicle.FData.Damage_Capacity;
  FHealth :=  Vehicle.FData.Damage_Capacity - FActivation.Damage;
end;

procedure TPlatform_Instance.UpdateVisual;
var
  i: integer;
  pt: TPoint;
  rv: TRangeVisual;
begin
  inherited;

  FTacticalSymbol.SpeedVector.Course  :=  ConvCartesian_To_Compass(FMover.Direction);
  FTacticalSymbol.SpeedVector.Speed   := FMover.Speed;

  VConvertor.ConvertToScreen(FMover.X, FMover.Y, pt.X, pt.Y);
  FTacticalSymbol.SpeedVector.Center := pt;
  FTacticalSymbol.Symbol.Center := pt;

  FPosition.X := PositionX;
  FPosition.Y := PositionY;
  FPosition.Z := PositionZ;

  for i := 0 to FMissileViews.ItemCount - 1 do
  begin
    rv := FMissileViews.GetItem(i) as TRangeVisual;
    rv.mX := PositionX;
    rv.mY := PositionY;
  end;

  for i := 0 to FTorpedoViews.ItemCount - 1 do
  begin
    rv := FTorpedoViews.GetItem(i) as TRangeVisual;
    rv.mX := PositionX;
    rv.mY := PositionY;
  end;

  FMissileViews.ConvertAll(VConvertor);
  FTorpedoViews.ConvertAll(VConvertor);

  FVHistory.ConvertCoord(VConvertor);
  Vehicle.Waypoints.ConvertCoord(VConvertor);

  FTacticalSymbol.ConvertCoord(VConvertor);

  FDetectedObject.ConvertAll(VConvertor);

  for i := 0 to Vehicle.Radars.Count - 1 do
    TSimObject(Vehicle.Radars[i]).UpdateVisual;

  for i := 0 to Vehicle.Sonars.Count - 1 do
    TSimObject(Vehicle.Sonars[i]).UpdateVisual;

  for i := 0 to Vehicle.ESMSensors.Count - 1 do
    TSimObject(Vehicle.ESMSensors[i]).UpdateVisual;

  for i := 0 to Vehicle.Visualsensors.Count - 1 do
    TSimObject(Vehicle.Visualsensors[i]).UpdateVisual;

  for i := 0 to Vehicle.Missiles.Count - 1 do
    TSimObject( Vehicle.Missiles[i]).UpdateVisual;

  for i := 0 to Vehicle.Guns.Count - 1 do
    TSimObject( Vehicle.Guns[i]).UpdateVisual;

  //for i := 0 to Vehicle.Torpedos.Count - 1 do
  //  TSimObject( Vehicle.Missiles[i]).UpdateVisual;
end;

procedure TPlatform_Instance.WayPointMove(const aDeltaMs: double);
var
  bearing, range : double;
  wpX,wpY, mX,mY : double;
begin
  with Vehicle do begin
    if ActiveWaypoint <> nil then begin
      wpX := TScripted_Behav_Definition(ActiveWaypoint).FData.Waypoint_Latitude;
      wpY := TScripted_Behav_Definition(ActiveWaypoint).FData.Waypoint_Longitude;
      mX  := PositionX;
      mY  := PositionY;

      range := CalcRange(wpX,wpY,mX,mY);
      bearing := CalcBearing(mX,mY,wpX,wpY);

      range := range * C_NauticalMile_To_Metre;

      if bearing > 0.09  then begin
        TurnLeft(0.5);
      end;

      if range < 10 {meter} then begin
        ActiveWaypoint := Waypoints.Next;
      end;

      // Motion.FData.Standard_Turn_Rate
      //TurnLeft();
    end;


    if FMover.Speed >= Motion.FData.Max_Ground_Speed then begin
      FMover.Acceleration := 0;
      FMover.Speed := Motion.FData.Max_Ground_Speed;
    end else begin
      FMover.Acceleration := Motion.FData.Acceleration;
    end;

  end;
end;

procedure TPlatform_Instance.Draw(aCnv: tCanvas);
var
  i: integer;
begin
  inherited;

  // hanya gambar plaform yang aktif, selain itu digambar oleh radar
  if FActivated then begin

    //FMissileViews.DrawAll(aCnv);
    //FTorpedoViews.DrawAll(aCnv);

    FTacticalSymbol.TextVisual.Text := getTrackId;
    FTacticalSymbol.Draw(aCnv);

    FVHistory.Draw(aCnv);

    for i := 0 to Vehicle.Radars.Count - 1 do
      TSimObject(Vehicle.Radars[i]).Draw(aCnv);
    for i := 0 to Vehicle.Sonars.Count - 1 do
      TSimObject(Vehicle.Sonars[i]).Draw(aCnv);
    for i := 0 to Vehicle.Visualsensors.Count - 1 do
      TSimObject(Vehicle.Visualsensors[i]).Draw(aCnv);
    //for i := 0 to Vehicle.Torpedos.Count - 1 do
    //  TSimObject(Vehicle.Torpedos[i]).Draw(aCnv);

    Vehicle.Waypoints.Draw(aCnv);
  //    if simMgrClient.ClientRole <> crpInstruktur then
//      FDetectedObject.DrawAll(aCnv);
  end;
  for i := 0 to Vehicle.Missiles.Count - 1 do
    TSimObject(Vehicle.Missiles[i]).Draw(aCnv);

  for i := 0 to Vehicle.Guns.Count - 1 do
    TSimObject(Vehicle.Guns[i]).Draw(aCnv);
end;

procedure TPlatform_Instance.DrawDetected(aCnv: tCanvas);
begin
  if Activated then
      FDetectedObject.DrawAll(aCnv);
end;


function TPlatform_Instance.findWeapon(search: string): TObject;
var
  found: boolean;
  i: integer;
  misl: TMissile_On_Board;
  torp: TTorpedo_On_Board;
  wpn : TObject;
begin

  found := false;

  // missile
  i := 0;
  while (not(found) and (Vehicle.Missiles.Count > (i))) do
  begin
    misl := Vehicle.Missiles[i];
    if SameStr(misl.FData.Instance_Identifier, search) then
    begin
      found := true;
      result := misl;
      break;
    end;
    inc(i);
  end;

  // torpedo
  i := 0;
  while (not(found) and (Vehicle.Torpedos.Count > (i))) do
  begin
    torp := Vehicle.Torpedos[i];
    if SameStr(torp.FData.Instance_Identifier, search) then
    begin
      found := true;
      Result := torp; // isTorpedo
      break;
    end;
    inc(i);
  end;
  // mines
  i := 0;
  while (not(found) and (Vehicle.Mines.Count > (i))) do
  begin
    wpn := Vehicle.Mines[i];
    if SameStr(TMine_On_Board(wpn).FData.Instance_Identifier, search) then
    begin
      found := true;
      Result := wpn; // isTorpedo
      break;
    end;
    inc(i);
  end;

  // bomb
  i := 0;
  while (not(found) and (Vehicle.Bombs.Count > (i))) do
  begin
    wpn := Vehicle.Bombs[i];
    if SameStr(TBomb_Definition(wpn).FData.Bomb_Identifier, search) then
    begin
      found := true;
      Result := wpn; // isTorpedo
      break;
    end;
    inc(i);
  end;

  // gun
  i := 0;
  while (not(found) and (Vehicle.Guns.Count > (i))) do
  begin
    wpn := Vehicle.Guns[i];
    if SameStr(TGun_Definition(wpn).FData.Gun_Identifier, search) then
    begin
      found := true;
      Result := wpn; // isTorpedo
      break;
    end;
    inc(i);
  end;
end;

function TPlatform_Instance.FindMissileByID(const mID: integer): TObject;
var found: boolean;
    i: integer;
begin
  found := false;
  result := nil;
  i := 0;
  while not found and  (i < Vehicle.Missiles.Count) do begin
    result := Vehicle.Missiles[i];
    found  := TMissile_On_Board(result).FData.Fitted_Weap_Index =  mID;
    inc(i);
  end;
  if not found then result := nil;
end;

function TPlatform_Instance.FindGunByID(const mID: integer): TObject;
var found: boolean;
    i: integer;
begin
  found := false;
  result := nil;
  i := 0;

  while not found and  (i < Vehicle.Missiles.Count) do begin
    result := Vehicle.Missiles[i];
    found  := TMissile_On_Board(result).FData.Fitted_Weap_Index =  mID;
    inc(i);
  end;
  if not found then result := nil;
end;

function TPlatform_Instance.GetMovementData: TRecPlatformMovement;
begin
  result.PlatformID := FData.Platform_Instance_Index;
  result.X := PositionX;
  result.Y := PositionY;
  result.Z := PositionZ;

  result.Course     := FMover.Direction;
  result.Speed      := FMover.Speed;
  result.Accel      := FMover.Acceleration;
  result.TurnRate   := FMover.TurnRate;


end;
procedure TPlatform_Instance.SetMovementData(const aRec: TRecPlatformMovement);
begin
  if FIsRepositioning then exit;

  FMover.X := aRec.X;
  FMover.Y := aRec.Y;
  FMover.Z := aRec.Z;

  FMover.Speed        := aRec.Speed;
  FMover.Direction    := aRec.Course;

//  FMover.Acceleration := aRec.Accel;
//..  FMover.TurnRate     := aRec.TurnRate;
end;

procedure TPlatform_Instance.SetControlled(const Value: boolean);
var symbolBMP : string;
    color : TColor;
begin
  FControlled := Value;
  FSelected := Value;

  //if Value then
  //  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath +  pctOwnShip + '.bmp',cgFriend)
  //else begin
    symbolBMP := getCorrectSymbol(getPlatformTtype,getForceDesignation,color);
    FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + symbolBMP + '.bmp',color);
  //end;

  FTacticalSymbol.Selected := Value;
  FTacticalSymbol.Controlled := Value;
end;

procedure TPlatform_Instance.setGrounded(const Value: boolean);
begin //grounded : kandas ... kapal menabrak pulau atau lewat laut dangkal
   if Value <> FIsGrounded then begin
    if Value then
       FMover.Speed := 0;
    FIsGrounded   := Value;
//    if Assigned (FOnGrounded) then FOnGrounded(self) then

   end;
 end;


procedure TPlatform_Instance.SetOnHit(const Value: TNotifyEvent);
begin
  FOnHit := Value;
end;

procedure TPlatform_Instance.setOnLand(const Value: boolean);
begin
  FIsOnLand := Value;

end;


procedure TPlatform_Instance.SetOrderedHeading(const Value: double);
var
    turnRate, tightRate : double;

begin
  FOrderedHeading := Value;  // komaps

  FDeltaHead :=  getDeltaH(Value, Course);
  FOrderedHeadingAchieved :=  abs(FDeltaHead) < 2.0 ;

  if FOrderedHeadingAchieved then begin
    Course := Value;
    FHeadingState := mcsStable;
  end;

  turnRate     := Motion.FData.Standard_Turn_Rate; // degree per second
  tightRate    := Motion.FData.Tight_Turn_Rate;    // degree per second

  if FDeltaHead < 0  then begin
     FMover.TurnRate := turnRate;
     FHeadingState := mcsIncrease;
  end
  else begin
     FMover.TurnRate := -turnRate;
     FHeadingState := mcsDecrease;
  end


//  FDeltaHead        := Course - Value;
//  FHeadingState     : TMoveChangeState;

//  FHeadingState           : TMoveChangeState;

end;

procedure TPlatform_Instance.SetOrderedSpeed(const Value: double);
begin
  FOrderedSpeed := Value;
  FOrderedSpeedAchieved := false;

  if FOrderedSpeed > FMover.Speed then begin
    FMover.Acceleration := Motion.FData.Acceleration; // knot per second
    FSpeedState := mcsIncrease;
  end
  else if FOrderedSpeed < FMover.Speed then begin
    FMover.Acceleration := - abs(Motion.FData.Deceleration); // knot per second
    FSpeedState := mcsDecrease;
  end
  else begin
    FMover.Acceleration := 0.0;
    FSpeedState := mcsStable;
  end;


end;

procedure TPlatform_Instance.SetOrderedAltitude(const Value: double);
var dH: double;
begin
  FOrderedAltitude          := Value  /
    (C_NauticalMile_To_Metre * C_Degree_To_NauticalMile) ;

  dH := (FOrderedAltitude - FMover.Z);
  if abs(dH) < 0.000000000001  then begin
    FAltitudeState := mcsStable;
    FMover.Vertical_Accel := 0;
  end
  else begin
   
    if FOrderedAltitude > FMover.Z then begin
      FMover.ClimbRate      := Motion.FData.Normal_Climb_Rate;
      FMover.Vertical_Accel := Abs(Motion.FData.Vertical_Accel);

      FAltitudeState        := mcsIncrease;
    end
    else begin
      FMover.DescentRate := Motion.FData.Normal_Descent_Rate;
      FMover.Vertical_Accel := - Abs(Motion.FData.Vertical_Accel);

      FAltitudeState := mcsDecrease;
    end;
  end;
end;

function TPlatform_Instance.getOrderedAltitude: Double;
begin
  result := FOrderedAltitude  *
    (C_NauticalMile_To_Metre * C_Degree_To_NauticalMile) ;

end;


procedure TPlatform_Instance.DepthCheck(const Valid: boolean;
  const dMin, dMax: double);
var dmn: integer;
    draft : double;
    depm : double;
begin
//  if not Valid then exit; //
  draft := Vehicle.FData.Draft;

  dmn := Vehicle.FData.Platform_Domain;

  case dmn of
    0 : begin // Result := 'Air';
      //don't care
      Grounded := (PositionZ < 0);

    end;
    1: begin //Result := 'Surface';
      if Valid then
        Grounded := (draft > dMax);

    end;
    2: begin //Result := 'Subsurface';
      if Valid then begin
        depm := C_NauticalMile_To_Metre * PositionZ;
        Grounded := ((draft + depm ) > dMax);
      end;
    end;
    3: begin //Result := 'Land';

    end;
    4: begin //Result := 'General';

    end;
  end;

end;

procedure TPlatform_Instance.LandCheck(const onLand: boolean);
var dmn: integer;
begin
  FIsOnLand := onLand;

  dmn := Vehicle.FData.Platform_Domain;
  case dmn of
    0 : begin // Result := 'Air';
      //don't care
       Grounded := PositionZ < 0;

    end;
    1: begin //Result := 'Surface';
       Grounded := FIsOnLand;

    end;
    2: begin //Result := 'Subsurface';

    end;
    3: begin //Result := 'Land';

    end;
    4: begin //Result := 'General';

    end;
  end;

end;


procedure TPlatform_Instance.BeginReposition;
begin
  FIsRepositioning  := true;

end;

procedure TPlatform_Instance.EndReposition;
begin
  FIsRepositioning  := false;

end;

procedure TPlatform_Instance.RepositionTo(const x, y: double);
begin
  FMover.X := X;
  FMover.Y := Y;
end;


end.
