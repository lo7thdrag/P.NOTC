unit uDBAssetObject;

interface

uses

  Windows, Classes, SysUtils, Graphics, newClassASTT, tttData, uDBAsset_Vehicle,
  uDBAsset_Radar, uDBAsset_Sonar, uDBAsset_Countermeasure, uDBAsset_Cubicle,
  uDBAsset_Satellite, uDBAsset_MotionCharacteristics, uDBAsset_Logistic,
  uGameData_TTT, uDBAsset_Sonobuoy, uDBAsset_Capability;

type
  TEnvi = class
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
    FPOHs: TList;
  end;

  // ------------------------------------------------------------------------------
  TMine_Definition = class
  public
    FData: TRecMine_Definition;
    FPOD : TList;
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
      FData         : TRecResource_Allocation;
      FOverlay      : TRecOverlay_Definition;
      FPlotting     : TRecResource_Plotting_mapping;
      FPattern      : TRecPredefined_Pattern;
      FPattern_Mapping  : TRecResource_Pattern_Mapping;
      FPattern_Point  : array of TPoint;
      IsOverlayShow : Boolean;
      IsOverlayEdit : Boolean;
      IsCubicle     : Boolean;
      FCubicleNumbr : Integer;
      FDynamicTrack : TList; // array of TRecord_DynamicOverlay;

      constructor Create;
      destructor Destroy; override;
  end;

  TDynamic_Overlay = class
  public
    FData : TRecord_DynamicOverlay;
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

  TCubicle_Group_Assignment = class
  private
    function getIdCubicle: integer;
  public
    FPlatform : TRecPlatform_Instance;
    FData     : TRecCubicle_Group;
    FCubicle  : TRecCubicle_Group_Assignment;
    Cubicle_Group: TCubicle_Group;
    FChannel  : TRecCubicle_Group_Channel_Assgnmnt;

    constructor Create;
    destructor Destroy; override;
    property IdCubicle: integer read getIdCubicle;
  end;

  // ------------------------------------------------------------------------------
  TPlatform_Type = class
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

  //---------------------------------------------------------------------------------

  //--- Nando & Andi P
  TMine_POD_vs_Range = class
    FData : TRecMine_POD_vs_Range;
  end;

  TBomb_POH_vs_Range = class
    FData : TRecBomb_POH_vs_Range;
  end;

  TGun_POH_vs_Range = class
    FData : TRecGun_POH_vs_Range;
  end;
  //---------------------------------------------------------------------------------

  TPlatform_Instance = class
  protected
    function getPlatformTtype: integer;
    function getTrackId: string;
    function getString(const Index: integer): string;
    procedure setString(const Index: integer; const s: string);
    function getTrackNumber: integer;
  public
    FData: TRecPlatform_Instance;
    FActivation: TRecPlatform_Activation;
    FPattern: TRecPredefined_Pattern;
    // . . . object
    Vehicle   : TVehicle_Definition;
    Satellite : TSatellite_Definition;
    Sonobuoy  : TSonobuoy_On_Board;
    Hybrid    : THybrid_Definition;
    Motion    : TMotion_Characteristics;
    Logistic  : TLogistic_Characteristics;
    Transport : TTransport;
    HeliLimitation : THelicopter_Land_Launch_Limits;

    Mine      : TMine_Definition;
    Missile   : TMissile_Definition;
    Torpedo   : TTorpedo_Definition;

    CubicleGroupID  : Integer;
    IsGroupLeader   : boolean;
  public
    constructor Create;
    destructor Destroy; override;

    function getCorrectSymbol(const platform_type: integer;
       const force: integer; var color: TColor): string;
    function getPendingSymbol(const platform_type: integer): string;

    property PlatformType: integer read getPlatformTtype;
    property InstanceName: string index 1 read getString;
    property TrackID: string index 2 read getString;
  end;

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
  uLibSettingTTT, uDBAsset_Weapon, uDBAsset_Sensor;

{ TCubicle_Group_Assignment }

constructor TCubicle_Group_Assignment.Create;
begin
//  inherited;
  Cubicle_Group := TCubicle_Group.Create;
end;

destructor TCubicle_Group_Assignment.Destroy;
begin
  Cubicle_Group.Free;
  inherited;
end;

constructor TResource_Allocation.Create;
begin
  inherited;
  FDynamicTrack := TList.Create;
end;

destructor TResource_Allocation.Destroy;
begin
  FDynamicTrack.Free;
  inherited;
end;

function TCubicle_Group_Assignment.getIdCubicle: integer;
begin
  Result := FData.Group_Index;
end;

{ TPlatform_Instance }

constructor TPlatform_Instance.Create;
begin
  Vehicle := TVehicle_Definition.Create;
  Satellite := TSatellite_Definition.Create;
  Sonobuoy := TSonobuoy_On_Board.Create;
  Hybrid := THybrid_Definition.Create;
  Motion := TMotion_Characteristics.Create;
  Logistic := TLogistic_Characteristics.Create;
  Transport := TTransport.Create;
  HeliLimitation := THelicopter_Land_Launch_Limits.Create;
  Mine := TMine_Definition.Create;
  Missile := TMissile_Definition.Create;
  Torpedo := TTorpedo_Definition.Create;
end;

destructor TPlatform_Instance.Destroy;
begin
  if Assigned(Vehicle) then
    FreeAndNil(Vehicle);
  if Assigned(Satellite) then
    FreeAndNil(Satellite);
  if Assigned(Sonobuoy) then
    FreeAndNil(Sonobuoy);
  if Assigned(Mine) then
    FreeAndNil(Mine);
  inherited;
end;


function TPlatform_Instance.getPlatformTtype: integer;
begin
  //Result := FData.platform_type;
  Result := Vehicle.FData.Platform_Type;
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

function TPlatform_Instance.getTrackNumber: integer;
begin
  Result := FActivation.Deployment_Index;
end;

// result := nama bitmap yang sesuai
function TPlatform_Instance.getCorrectSymbol(const platform_type: integer;
  const force: integer; var color: TColor): string;

var
  symbolBMP, postfix: string;
begin
  symbolBMP := '';
  postfix := pfPending;

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
    vhtChaff         : symbolBMP := pctChaff + postfix ;
//    vhtAirBubble     : symbolBMP := pctAirBubble    ;
    vhtSonobuoy      : symbolBMP := pctSonobuoy + postfix ;
    vhtMine          : symbolBMP := pctMine + postfix ;
    vhtTorpedo       : symbolBMP := pctTorpedo + postfix ;
  else
//    symbolBMP := pctGeneral;
    symbolBMP := pctSurface + postfix;
  end;

  case force of
    1 : color := clRed;
    2 : color := clYellow;
    3 : color := clBlue;
    4 : color := clGreen;
    5,6 : color := clwhite;
  else
    color := clwhite;
  end;

  result := symbolBMP;
end;

function TPlatform_Instance.getPendingSymbol(const platform_type: integer): string;
var
  symbolBMP, postfix: string;
begin
  symbolBMP := '';
  postfix := pfPending;

   case platform_type of
    vhtFighter       : symbolBMP := pctAir  ;
    vhtStrikeBomber  : symbolBMP := pctAir  ;
    vhtFixed         : symbolBMP := pctFixedWing  ;
    vhtFixedEW       : symbolBMP := pctFixedWing  ;
    vhtRotaryAttack  : symbolBMP := pctRotaryWing  ;
    vhtRotaryASW     : symbolBMP := pctRotaryWing  ;
    vhtFixedSurv     : symbolBMP := pctFixedWing  ;
    vhtFixedRec      : symbolBMP := pctFixedWing  ;
    vhtSeaPlane      : symbolBMP := pctSurface  ;
    vhtMissile       : symbolBMP := pctMissile  ;
    vhtAirCarrier    : symbolBMP := pctAir  ;
    vhtCruiseGuided  : symbolBMP := pctSurface  ;
    vhtDestroGuided  : symbolBMP := pctSurface  ;
    vhtFrigatGuided  : symbolBMP := pctSurface  ;
    vhtDestroyer     : symbolBMP := pctSurface     ;
    vhtFrigate       : symbolBMP := pctSurface       ;
    vhtMineWarfare   : symbolBMP := pctSurface   ;
    vhtPatrolCraft   : symbolBMP := pctSurface   ;
    vhtMerchant      : symbolBMP := pctSurface      ;
    vhtUtilityVess   : symbolBMP := pctSurface   ;
    vhtSurfOther     : symbolBMP := pctSurface     ;
    //vhtNuclearBalis : symbolBMP := pctSurface  ;
    //vhtAuxiliary    : symbolBMP := pctSurface  ;
    vhtNuclearAtt    : symbolBMP := pctSubSurface    ;
    vhtNuclearGuided : symbolBMP := pctSubSurface ;
    vhtDieselAttack  : symbolBMP := pctSubSurface  ;
    vhtDieselGuided  : symbolBMP := pctSubSurface  ;
    vhtBaterySurf    : symbolBMP := pctBatterySam  ;
    vhtBateryMissile : symbolBMP := pctBatterySam  ;
    vhtBateryGun     : symbolBMP := pctBatterySam  ;
    vhtAirfield      : symbolBMP := pctAirfield      ;
    vhtPlatoonArm    : symbolBMP := pctArmour   ;
    vhtPlatoonInf    : symbolBMP := pctInfantry   ;
    vhtBatteryArt    : symbolBMP := pctBatteryAaa  ;
    vhtPort          : symbolBMP := pctPort  ;
    vhtSpecialCraft  : symbolBMP := pctSurface  ;
//    vhtOther         : symbolBMP := pctSurface  ;
    //vhtAmphibious    : symbolBMP := pctSurface  ;
    vhtRotarySurv    : symbolBMP := pctRotaryWing  ;
    vhtRotaryRec     : symbolBMP := pctRotaryWing  ;
    vhtChaff         : symbolBMP := pctChaff        ;
//    vhtAirBubble     : symbolBMP := pctAirBubble    ;
    vhtSonobuoy      : symbolBMP := pctSonobuoy     ;
    vhtMine          : symbolBMP := pctMine         ;
    vhtTorpedo       : symbolBMP := pctTorpedo      ;
  else
    symbolBMP := pctSurface;
  end;

  result := symbolBMP + postfix;
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

end.
