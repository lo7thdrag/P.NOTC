unit uDeployment;

interface

uses

  Windows, Classes, SysUtils, Graphics, tttData, uDBAsset_Vehicle,
  uDBAsset_Radar, uDBAsset_Sonar, uDBAsset_Countermeasure, uDBAsset_Cubicle,
  uDBAsset_Satellite, uDBAsset_Sonobuoy, uDBAsset_MotionCharacteristics,


  uSimObjects, uSimVisuals, uObjectVisuals, u2DMover,
  uBaseCoordSystem, uSteppers, uTCPData_TTT, uSimContainers,
  uWaypoint, uDBAsset_Scripted;

type

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
    FData: TRecJammer_Definition;
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
      FOverlay : TRecOverlay_Definition;
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
  end;

  // ------------------------------------------------------------------------------

  TCubicle_Group_Assignment = class(TSimObject)

  private
    function getIdCubicle: integer;

  public
    FData: TRecCubicle_Group;
    FCubicle: TRecCubicle_Group_Assignment;
    FPlatform : TRecPlatform_Instance;
    Cubicle_Group: TCubicle_Group;

    constructor Create;
    destructor Destroy; // override;

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

  TPlatform_Instance = class(TSimObject)
  private
    FOnChange: TNotifyEvent;
    FOrderedSpeed     : double;
    FOrderedHeading   : double;
    FOrderedSpeedAchieved    : boolean;
    FOrderedHeadingAchieved : boolean;

    function getPlatformTtype: integer;
    function getForceDesignation: integer;
    function getTrackId: string;
    function getString(const Index: integer): string;
    function getSonarData(const Index: integer): string;
    function getTrackNumber: integer;

    function getPos(const i: integer): double;
    procedure setPos(const i: integer; const val: double);

    function getAltitude: single;

    function getDomain: string;

    function getCorrectSymbol(const platform_type: integer;
      const force: integer; var color: TColor): string;

    procedure setActivated(val : boolean);

    procedure WayPointMove(const aDeltaMs: double);
    procedure SetOrderedHeading(const Value: double);
    procedure SetOrderedSpeed(const Value: double);
  protected

    FMover: T2DMover;

    FMissileViews: TDrawContainers;
    FTorpedoViews: TDrawContainers;

    // FV = Visual member
    FVSpeedV: TSpeedVectorVisual;
    FVSymbol: TBitmapSymbol;
    FVHistory: THistoryVisual;
    FVLabel: TTextVisual;

    FHisCounter: TDelayer;
    FActivated : boolean;

    FDetectedObject : TDrawContainers;

    procedure HistoryOnAddpoint(sender: TObject);

  public
    FData: TRecPlatform_Instance;
    FActivation: TRecPlatform_Activation;

    // . . . object
    Vehicle: TVehicle_Definition;
    Satellite: TSatellite_Definition;
    Sonobuoy: TSonobuoy_On_Board;
    Hybrid: THybrid_Definition;
    Motion: TMotion_Characteristics;
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
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;

    function defineSensorType(search: string; out sensor : TSimObject): integer;
    function defineWeaponType(search: string): integer;
    function defineECMType(search: string): integer;

    function GetMovementData: TRecPlatformMovement;
    procedure SetMovementData(const aRec: TRecPlatformMovement);

    procedure DetectedList(var list : TSimContainer);
    procedure TurnLeft(val : double);
    procedure TurnRight(val : double);
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

    property Altitude: single read getAltitude;
    property Domain: string read getDomain;

    property SonarClass: string index 1 read getSonarData;
    property Activated : boolean read FActivated write setActivated;
    property DetectedObjects : TDrawContainers read FDetectedObject;

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
  // Missile   := TMissile_Definition.Create;
  // Torpedo   := TTorpedo_Definition.Create;
  { Mines     := TMine_Definition.Create;
    Hybrid    := THybrid_Definition.Create;
    }

  FMissileViews := TDrawContainers.Create;
  FTorpedoViews := TDrawContainers.Create;

  { FChilds.AddObject(Vehicle  );
    FChilds.AddObject(Missile  );
    FChilds.AddObject(Torpedo  );
    FChilds.AddObject(Mines    );
    FChilds.AddObject(Hybrid   );
    FChilds.AddObject(Satellite);
    FChilds.AddObject(Sonobuoy );
    }

  FVSpeedV := TSpeedVectorVisual.Create;

  FVSymbol := TBitmapSymbol.Create;
  vSymbolSetting.DefaultSymbol := 'SurfaceFriend' + '.bmp';
  FVSymbol.LoadBitmap(vSymbolSetting.ImgPath + vSymbolSetting.DefaultSymbol, FVSymbol.Color);


  //label
  FVLabel := TTextVisual.Create;

  FOrderedSpeed   := 0;
  FOrderedHeading := 0;
  FOrderedSpeedAchieved   := true;
  FOrderedHeadingAchieved := true;

  FVHistory := THistoryVisual.Create;
  FVHistory.Color := clGray;

  //Set true then all sensor will active
  FActivated := false;
  FDetectedObject := TDrawContainers.Create;
end;

destructor TPlatform_Instance.Destroy;
begin

  FVHistory.Free;
  FVSymbol.Free;

  FMissileViews.ClearItems;
  FMissileViews.Free;

  FTorpedoViews.ClearItems;
  FTorpedoViews.Free;

  FMover.Free;

  if Assigned(Vehicle) then
    FreeAndNil(Vehicle);
  if Assigned(Satellite) then
    FreeAndNil(Satellite);
  if Assigned(Sonobuoy) then
    FreeAndNil(Sonobuoy);
  // if Assigned(Missile   ) then FreeAndNil(Missile   );
  // if Assigned(Torpedo   ) then FreeAndNil(Torpedo   );
  { if Assigned(Mines     ) then FreeAndNil(Mines     );
    if Assigned(Hybrid    ) then FreeAndNil(Hybrid    );
    if Assigned(Chaff     ) then FreeAndNil(Chaff     );
    }  // if Assigned(Jammer    ) then FreeAndNil(Jammer    );
  // if Assigned(AcousticDecoy) then FreeAndNil(AcousticDecoy);
  // if Assigned(AirBubble ) then FreeAndNil(AirBubble );

  inherited;
end;

procedure TPlatform_Instance.DetectedList(var list : TSimContainer);
var
  i: integer;
  rdr: TRadar_On_Board;
  snr: TSonar_On_Board;
  vis : TVisual_Sensor_On_Board;
  msl: TMissile_On_Board;
  tpd: TTorpedo_On_Board;
begin

  if Vehicle <> nil then
  begin

    for i := 0 to Vehicle.Radars.Count - 1 do
    begin
      rdr := Vehicle.Radars[i];
      rdr.Parent := self;
      rdr.SetObjects(list,FDetectedObject);
    end;

    for i := 0 to Vehicle.Sonars.Count - 1 do
    begin
      snr := Vehicle.Sonars[i];
      snr.Parent := self;
      snr.SetObjects(list,FDetectedObject);
    end;

    for i := 0 to Vehicle.Visualsensors.Count - 1 do begin
      vis := Vehicle.Visualsensors[i];
      vis.Parent := self;
      vis.SetObjects(list,FDetectedObject);
    end;

    for i := 0 to Vehicle.Missiles.Count - 1 do
    begin
      msl := Vehicle.Missiles[i];
      //list.AddObject(msl);
    end;

    for i := 0 to Vehicle.Torpedos.Count - 1 do
    begin
      tpd := Vehicle.Torpedos[i];
      //list.AddObject(tpd);
    end;
  end;

end;

constructor TCubicle_Group_Assignment.Create;
begin
  inherited;
end;

destructor TCubicle_Group_Assignment.Destroy;
begin
  inherited;
end;

function TPlatform_Instance.getPlatformTtype: integer;
begin
  Result := FData.platform_type;
end;

function TPlatform_Instance.getForceDesignation: integer;
begin
  Result := FData.Force_Designation;
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
  case i of
    1:
      Result := FMover.X;
    2:
      Result := FMover.Y;
    3:
      Result := FMover.Z;
    4:
      Result := ConvCartesian_To_Compass(FMover.Direction);
    5:
      Result := FMover.Speed;
  end;
end;

procedure TPlatform_Instance.setPos(const i: integer; const val: double);
begin
  case i of
    1:
      FMover.X := val;
    2:
      FMover.Y := val;
    3:
      FMover.Z := val;
    4:
      FMover.Direction := ConvCompass_To_Cartesian(val);
    5:
      FMover.Speed := val;
  end;
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

function TPlatform_Instance.getAltitude: single;
begin
  Result := FActivation.Init_Altitude;
end;

function TPlatform_Instance.getDomain: string;
begin
  if Vehicle.FData.Platform_Domain = 0 then
    Result := 'Air';
  if Vehicle.FData.Platform_Domain = 1 then
    Result := 'Surface';
  if Vehicle.FData.Platform_Domain = 2 then
    Result := 'Subsurface';
  if Vehicle.FData.Platform_Domain = 3 then
    Result := 'Land';
  if Vehicle.FData.Platform_Domain = 4 then
    Result := 'General';
end;

// result := nama bitmap yang sesuai
function TPlatform_Instance.getCorrectSymbol(const platform_type: integer;
  const force: integer; var color: TColor): string;

var
  platformName, forceName: string;
begin
  //jika type_platform apa ? warna apa? -> set

  //FVSymbol.Color := ?
  Result := platformName + forceName + '.bmp';
end;

function TPlatform_Instance.defineSensorType(search: string; out sensor : TSimObject): integer;
var
  found: boolean;
  i: integer;
  rdr: TRadar_On_Board;
  snr: TSonar_On_Board;
begin

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

end;

function TPlatform_Instance.defineECMType(search: string): integer;
var
  found: boolean;
  i: integer;
  chf: TChaff_On_Board;
  jam: TJammer_On_Board;
  defjam: TDefensive_Jammer_On_Board;
  accDecoy: TAcoustic_Decoy_On_Board;
  airbub: TAir_Bubble_Mount;
begin

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

function TPlatform_Instance.defineWeaponType(search: string): integer;
var
  found: boolean;
  i: integer;
  misl: TMissile_Definition;
  torp: TTorpedo_Definition;
begin

  found := false;

  // missile
  i := 0;
  while (not(found) and (Vehicle.Missiles.Count > (i))) do
  begin
    misl := Vehicle.Missiles[i];
    if SameStr(misl.FData.Class_Identifier, search) then
    begin
      found := true;
      Result := 1; // isMissile
    end;
    inc(i);
  end;

  // torpedo
  i := 0;
  while (not(found) and (Vehicle.Torpedos.Count > (i))) do
  begin
    torp := Vehicle.Torpedos[i];
    if SameStr(torp.FData.Class_Identifier, search) then
    begin
      found := true;
      Result := 2; // isTorpedo
    end;
    inc(i);
  end;

end;

procedure TPlatform_Instance.HistoryOnAddpoint(sender: TObject);
begin
  FVHistory.AddPoint(PositionX, PositionY);
end;

procedure TPlatform_Instance.Move(const aDeltaMs: double);
var
  i: integer;
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

  turnRate     := Motion.FData.Standard_Turn_Rate; // degree per second
  tightRate    := Motion.FData.Tight_Turn_Rate;    // degree per second
  acceleration := Motion.FData.Acceleration;       // knot per second
  deceleration := Motion.FData.Deceleration;       // knot per second

  if Abs(FOrderedSpeed - Speed) > 0.05 then FOrderedSpeedAchieved := false;
  if Abs(FOrderedHeading - Course) > 0.05 then FOrderedHeadingAchieved := false; 
                                  
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

  if not FOrderedSpeedAchieved then begin
    if FOrderedSpeed > FMover.Speed then
      FMover.Acceleration := acceleration
    else 
      FMover.Acceleration := -deceleration;
  end;

  if (not(FOrderedSpeedAchieved)) and  (Abs(FOrderedSpeed - Speed) <= 0.05) then begin
    FMover.Acceleration := 0;
    FOrderedSpeedAchieved := true;
  end;
    
  if (not(FOrderedHeadingAchieved)) and (Abs(FOrderedHeading - Course) <= 0.05) then begin
    FMover.TurnRate := 0;
    FOrderedHeadingAchieved := true;
  end;

  if FMover.Speed >= Motion.FData.Max_Ground_Speed then begin
    FMover.Acceleration := 0;
    FMover.Speed := Motion.FData.Max_Ground_Speed;                               
  end;

  FMover.Move(aDeltaMs);
  FHisCounter.Run(aDeltaMs);

  for i := 0 to Vehicle.Radars.Count - 1 do
    TSimObject( Vehicle.Radars[i]).Move(aDeltaMs);

  for i := 0 to Vehicle.Sonars.Count - 1 do
    TSimObject( Vehicle.Sonars[i]).Move(aDeltaMs);

  for i := 0 to Vehicle.ESMSensors.Count - 1 do
    TSimObject( Vehicle.ESMSensors[i]).Move(aDeltaMs);

  for i := 0 to Vehicle.Visualsensors.Count - 1 do
    TSimObject( Vehicle.Visualsensors[i]).Move(aDeltaMs);
end;

procedure TPlatform_Instance.InitData;
begin
  // dipanggil setelah object di create dari database
  FMover.X := FActivation.Init_Position_Longitude;
  FMover.Y := FActivation.Init_Position_Latitude;
  FMover.Direction := ConvCompass_To_Cartesian(FActivation.Init_Course);
  FMover.Speed := FActivation.Init_Ground_Speed;
  FMover.Enabled := true;

  //FMover.Acceleration := Motion.FData.Acceleration;
  FMover.MaxSpeed := MOtion.FData.Max_Ground_Speed;

  //FMover.TurnRate := Motion.FData.Standard_Turn_Rate;

  // s := getDomain + 'Pending.bmp';
  // FVSymbol.LoadBitmap(vSymbolSetting.ImgPath + s  );

end;

procedure TPlatform_Instance.UpdateVisual;
var
  i: integer;
  pt: TPoint;
  rv: TRangeVisual;
begin
  inherited;
  FVSpeedV.Course := ConvCartesian_To_Compass(FMover.Direction);
  FVSpeedV.Speed := FMover.Speed;

  VConvertor.ConvertToScreen(FMover.X, FMover.Y, pt.X, pt.Y);
  FVSpeedV.Center := pt;
  FVSpeedV.ConvertCoord(VConvertor);

  FVSymbol.Center := pt;

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
  FDetectedObject.ConvertAll(VConvertor);
  Vehicle.Waypoints.ConvertCoord(VConvertor);

  for i := 0 to Vehicle.Radars.Count - 1 do
    TSimObject(Vehicle.Radars[i]).UpdateVisual;

  for i := 0 to Vehicle.Sonars.Count - 1 do
    TSimObject(Vehicle.Sonars[i]).UpdateVisual;

  for i := 0 to Vehicle.ESMSensors.Count - 1 do
    TSimObject(Vehicle.ESMSensors[i]).UpdateVisual;

  for i := 0 to Vehicle.Visualsensors.Count - 1 do
    TSimObject(Vehicle.Visualsensors[i]).UpdateVisual;
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
var color: Tcolor;
  i: integer;
  rdr: TRadar_On_Board;
  snr: TSonar_On_Board;
begin
  // inherited;

  FMissileViews.DrawAll(aCnv);
  FTorpedoViews.DrawAll(aCnv);

  //vSymbolSetting.DefaultSymbol := getCorrectSymbol(getPlatformTtype, getForceDesignation, color);
  FVLabel.Text := getTrackId;

  //FVSymbol.Draw(aCnv);
  //set value center dan color FVlabel sama dengan FVSymbol
  FVLabel.Center := FVSymbol.Center;
  FVLabel.Color := FVSymbol.Color;

  //FVLabel.Draw(aCnv);
  //FVSpeedV.Draw(aCnv);
  //FVHistory.Draw(aCnv);

  // draw object detect by sensor
  if FActivated then begin
    FVSymbol.Draw(aCnv);
    FVLabel.Draw(aCnv);
    FVSpeedV.Draw(aCnv);
    //FVHistory.Draw(aCnv);

    FDetectedObject.DrawAll(aCnv);
    Vehicle.Waypoints.Draw(aCnv);

    for i := 0 to Vehicle.Radars.Count - 1 do
      TSimObject(Vehicle.Radars[i]).Draw(aCnv);
    for i := 0 to Vehicle.Sonars.Count - 1 do
      TSimObject(Vehicle.Sonars[i]).Draw(aCnv);
    for i := 0 to Vehicle.Visualsensors.Count - 1 do
      TSimObject(Vehicle.Visualsensors[i]).Draw(aCnv);
  end;
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
  FMover.X := aRec.X;
  FMover.Y := aRec.Y;
  FMover.Z := aRec.Z;

  FMover.Speed        := aRec.Speed;
  FMover.Direction    := aRec.Course;
  FMover.Acceleration := aRec.Accel;
  FMover.TurnRate     := aRec.TurnRate;

end;

procedure TPlatform_Instance.SetOrderedHeading(const Value: double);
begin
  FOrderedHeading := Value;
  FOrderedHeadingAchieved := false;
end;

procedure TPlatform_Instance.SetOrderedSpeed(const Value: double);
begin
  FOrderedSpeed := Value;
  FOrderedSpeedAchieved := false;
end;

function TCubicle_Group_Assignment.getIdCubicle: integer;
begin
  Result := FData.Group_Index;
end;

end.
