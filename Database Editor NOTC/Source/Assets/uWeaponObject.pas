unit uWeaponObject;

interface

uses uPlatformUtility, uPlatforms, uDefinedType;

type

  TWeaponDevice = class(TPlatformDevice)

  public
  var
    FCapabilities: TWeaponCapabilities;
  strict private
    function GetLethality: Double;
    procedure SetLethality(val: Double);
  public
    /// <Definition>The lethal characteristics of the weapon,
    /// denoted by a sliding scale between 0 and 100,000.
    /// Higher values represent greater damage inflicted
    /// to targets which are hit by the weapon.</Definition>
    property Lethality: Double read GetLethality write SetLethality;
  strict private
    function GetPOH: Double;
    procedure SetPOH(val: Double);
  public
    property POH: Double read GetPOH write SetPOH;
  strict private
    function GetDamageSustain: Double;
    procedure SetDamageSustain(val: Double);
  public
    /// <Definition>Represents the weapon's ability to sustain damage
    /// and is denoted by a value from 0 to 100,000. Higher values represent the weapon's ability to
    /// sustain more damage.</Definition>
    property DamageSustain: Double read GetDamageSustain write SetDamageSustain;

  end;

  TTorpedo = class(TWeaponDevice)

  strict private
    function GetLaunchMethod: TWeaponLaunchMethod;
    procedure SetLaunchMethod(val: TWeaponLaunchMethod);
  public
    property LaunchMethod: TWeaponLaunchMethod read GetLaunchMethod write
      SetLaunchMethod;
  strict private
    function GetCommandSpeed: TCommandSpeed;
    procedure SetCommandSpeed(val: TCommandSpeed);
  public
    property CommandSpeed: TCommandSpeed read GetCommandSpeed write
      SetCommandSpeed;
  strict private
    function GetSafetyCeilingDepth: Double;
    procedure SetSafetyCeilingDepth(val: Double);
  public
    property SafetyCeilingDepth: Double read GetSafetyCeilingDepth write
      SetSafetyCeilingDepth;
  strict private
    function GetDetectability: TObjectDetectability;
    procedure SetDetectability(val: TObjectDetectability);
  public
    property Detectability: TObjectDetectability read GetDetectability write
      SetDetectability;
  strict private
    function GetMaxSearchDepth: Double;
    procedure SetMaxSearchDepth(val: Double);
  public
    property MaxSearchDepth
      : Double read GetMaxSearchDepth write SetMaxSearchDepth;

  end;

  TMissile = class(TWeaponDevice)
  public
  strict private
    function GetLaunchMethod: TWeaponLaunchMethod;
    procedure SetLaunchMethod(val: TWeaponLaunchMethod);
  public
    /// <Definition>The launch method determines which controls will
    /// be available to the operator for launching the
    /// weapon. four missile launching options are provided:
    /// - Aimpoint Only Launch
    /// - Bearing Only Launch
    /// - Aimpoint or Bearing Launch
    /// - Direct Launch</Definition>
    property LaunchMethod: TWeaponLaunchMethod read GetLaunchMethod write
      SetLaunchMethod;
  strict private
    function GetCommandSpeed: TCommandSpeed;
    procedure SetCommandSpeed(val: TCommandSpeed);
  public
    property CommandSpeed: TCommandSpeed read GetCommandSpeed write
      SetCommandSpeed;
  strict private
    function GetDetectability: TObjectDetectability;
    procedure SetDetectability(val: TObjectDetectability);
  public
    /// <Definition>Relates to the ability of sensors to detect the missile.
    /// Defined as:
    /// – Normal Detection - active and passive sensor detection
    /// – Undetectable - platform cannot be detected
    /// – Passive Detection - only platforms that are detectable by passive sensors
    /// – Always Visible - missile is always visible</Definition>
    property Detectability: TObjectDetectability read GetDetectability write
      SetDetectability;
  strict private
    function GetMaxAltitudeToTarget: Double;
    procedure SetMaxAltitudeToTarget(val: Double);
  public
    property MaxAltitudeToTarget: Double read GetMaxAltitudeToTarget write
      SetMaxAltitudeToTarget;
  strict private
    function GetMotion: TPlatformMotion;
    procedure SetMotion(val: TPlatformMotion);
  public
    /// <semantics>Karakteristik motion dari misile</semantics>
    /// <since>
    /// </since>
    /// <Definition>Motion characteristics have been defined as a separate class
    /// to allow the flexibility of assigning the same characteristics
    /// to more than one platform. This selection represents
    /// characteristics such as speed, acceleration, turn rates,
    /// vertical motion and endurance limits.</Definition>
    property Motion: TPlatformMotion read GetMotion write SetMotion;
  strict private
    function GetCrossSection: TPlatformCrossSection;
    procedure SetCrossSection(val: TPlatformCrossSection);
  public
    /// <Definition>three parameter groups that set the radar, visual/electro-optical and infrared
    /// cross-sectional areas of the missile for detection by sensor systems during
    /// an engagement in an exercise. During an exercise, the front and side
    /// cross-sections will be converted into a single crosssection based on the aspect
    /// of the missile relative to the detecting sensor. Further details of the cross-sections
    /// follows:
    /// – Radar – sets the front and side cross-sectional areas of the missile for detection by radar.
    /// Radar cross-section units (σ) are entered as m2 or dB.m2 (as selected units).
    /// To convert from m2 to dB.m2, apply the following:
    /// σ = 10 log (area)
    /// Example: for a 10 000 m2 target area,
    /// σ = 10 log (10,000 m2)
    /// = 40 dB.m2
    /// – Visual/Electro-Optical - represents the front and side cross-sectional areas of the
    /// missile detectable by visual and electro-optical detectors.
    /// – Infrared - the front and side cross-sectional areas of the missile detectable at night
    /// by IR-capable, electro-optical detectors.</Definition>
    property CrossSection: TPlatformCrossSection read GetCrossSection write
      SetCrossSection;
  strict private
    function GetEngagementRange: Double;
    procedure SetEngagementRange(val: Double);
  public
    /// <Definition>refers to the radius of a sphere around the missile which defines an
    /// area of vulnerability. If any weapon strikes within or passes through
    /// this volume, the engagement will be assessed to determine if the missile was hit.</Definition>
    property EngagementRange: Double read GetEngagementRange write
      SetEngagementRange;
  strict private
    function GetDimension: TDimension;
    procedure SetDimension(val: TDimension);
  public
    /// <Definition>Sets the dimensions of the missile.</Definition>
    property Dimension: TDimension read GetDimension write SetDimension;
  end;

  TMine = class(TWeaponDevice)

  strict private
    function GetMineCategory: TMineCategory;
    procedure SetMineCategory(val: TMineCategory);
  public
    property MineCategory: TMineCategory read GetMineCategory write
      SetMineCategory;
  strict private
    function GetMooringType: TMineMooringType;
    procedure SetMooringType(val: TMineMooringType);
  public
    property MooringType: TMineMooringType read GetMooringType write
      SetMooringType;
  strict private
    function GetDetectability: TObjectDetectability;
    procedure SetDetectability(val: TObjectDetectability);
  public
    property Detectability: TObjectDetectability read GetDetectability write
      SetDetectability;
  strict private
    function GetMaxLayingDepth: Double;
    procedure SetMaxLayingDepth(val: Double);
  public
    property MaxLayingDepth
      : Double read GetMaxLayingDepth write SetMaxLayingDepth;
  strict private
    function GetDimension: TDimension;
    procedure SetDimension(val: TDimension);
  public
    property Dimension: TDimension read GetDimension write SetDimension;
  strict private
    function GetEngagementRange: Double;
    procedure SetEngagementRange(val: Double);
  public
    property EngagementRange: Double read GetEngagementRange write
      SetEngagementRange;
  strict private
    function GetCrossSection: TPlatformCrossSection;
    procedure SetCrossSection(val: TPlatformCrossSection);
  public
    property CrossSection: TPlatformCrossSection read GetCrossSection write
      SetCrossSection;

  end;

  TGun = class(TWeaponDevice)

  strict private
    function GetRateFire: Integer;
    procedure SetRateFire(val: Integer);
  public
    property RateFire: Integer read GetRateFire write SetRateFire;
  strict private
    function GetMaxAltitudeTarget: Double;
    procedure SetMaxAltitudeTarget(val: Double);
  public
    property MaxAltitudeTarget: Double read GetMaxAltitudeTarget write
      SetMaxAltitudeTarget;
  strict private
    function GetisFireControlDirector: Boolean;
    procedure SetisFireControlDirector(val: Boolean);
  public
    property isFireControlDirector: Boolean read GetisFireControlDirector write
      SetisFireControlDirector;
  strict private
    function GetMinAirTarget: Double;
    procedure SetMinAirTarget(val: Double);
  public
    property MinAirTarget: Double read GetMinAirTarget write SetMinAirTarget;
  strict private
    function GetMaxAirTarget: Double;
    procedure SetMaxAirTarget(val: Double);
  public
    property MaxAirTarget: Double read GetMaxAirTarget write SetMaxAirTarget;
  strict private
    function GetMinLandTarget: Double;
    procedure SetMinLandTarget(val: Double);
  public
    property MinLandTarget: Double read GetMinLandTarget write SetMinLandTarget;
  strict private
    function GetMaxLandTarget: Double;
    procedure SetMaxLandTarget(val: Double);
  public
    property MaxLandTarget: Double read GetMaxLandTarget write SetMaxLandTarget;

  end;

  /// <Definition>Define the characteristics of bomb/depth charges,
  /// which are considered Point Effect Weapons as
  /// they cannot be detected by sensors. Bomb/depth
  /// charges can be assigned to air, surface and
  /// subsurface platforms.</Definition>
  TBomb = class(TWeaponDevice)

  strict private
    function GetBombType: TBombType;
    procedure SetBombType(val: TBombType);
  public
    /// <Definition>Refers to the type of free-falling weapon.
    /// - Bomb
    /// - Depth Charge</Definition>
    property BombType: TBombType read GetBombType write SetBombType;
  strict private
    function GetMinRange: Double;
    procedure SetMinRange(val: Double);
  public
    property MinRange: Double read GetMinRange write SetMinRange;
  strict private
    function GetMaxRange: Double;
    procedure SetMaxRange(val: Double);
  public
    property MaxRange: Double read GetMaxRange write SetMaxRange;

  end;

implementation

function TMissile.GetLaunchMethod: TWeaponLaunchMethod;
begin
end;

procedure TMissile.SetLaunchMethod(val: TWeaponLaunchMethod);
begin
end;

function TMissile.GetCommandSpeed: TCommandSpeed;
begin
end;

procedure TMissile.SetCommandSpeed(val: TCommandSpeed);
begin
end;

function TMissile.GetDetectability: TObjectDetectability;
begin
end;

procedure TMissile.SetDetectability(val: TObjectDetectability);
begin
end;

function TWeaponDevice.GetLethality: Double;
begin
end;

procedure TWeaponDevice.SetLethality(val: Double);
begin
end;

function TWeaponDevice.GetPOH: Double;
begin
end;

procedure TWeaponDevice.SetPOH(val: Double);
begin
end;

function TWeaponDevice.GetDamageSustain: Double;
begin
end;

procedure TWeaponDevice.SetDamageSustain(val: Double);
begin
end;

function TMissile.GetMaxAltitudeToTarget: Double;
begin
end;

procedure TMissile.SetMaxAltitudeToTarget(val: Double);
begin
end;

function TMissile.GetMotion: TPlatformMotion;
begin
end;

procedure TMissile.SetMotion(val: TPlatformMotion);
begin
end;

function TMissile.GetCrossSection: TPlatformCrossSection;
begin
end;

procedure TMissile.SetCrossSection(val: TPlatformCrossSection);
begin
end;

function TTorpedo.GetLaunchMethod: TWeaponLaunchMethod;
begin
end;

procedure TTorpedo.SetLaunchMethod(val: TWeaponLaunchMethod);
begin
end;

function TTorpedo.GetCommandSpeed: TCommandSpeed;
begin
end;

procedure TTorpedo.SetCommandSpeed(val: TCommandSpeed);
begin
end;

function TTorpedo.GetSafetyCeilingDepth: Double;
begin
end;

procedure TTorpedo.SetSafetyCeilingDepth(val: Double);
begin
end;

function TTorpedo.GetDetectability: TObjectDetectability;
begin
end;

procedure TTorpedo.SetDetectability(val: TObjectDetectability);
begin
end;

function TTorpedo.GetMaxSearchDepth: Double;
begin
end;

procedure TTorpedo.SetMaxSearchDepth(val: Double);
begin
end;

function TBomb.GetBombType: TBombType;
begin
end;

procedure TBomb.SetBombType(val: TBombType);
begin
end;

function TBomb.GetMinRange: Double;
begin
end;

procedure TBomb.SetMinRange(val: Double);
begin
end;

function TBomb.GetMaxRange: Double;
begin
end;

procedure TBomb.SetMaxRange(val: Double);
begin
end;

function TGun.GetRateFire: Integer;
begin
end;

procedure TGun.SetRateFire(val: Integer);
begin
end;

function TGun.GetMaxAltitudeTarget: Double;
begin
end;

procedure TGun.SetMaxAltitudeTarget(val: Double);
begin
end;

function TGun.GetisFireControlDirector: Boolean;
begin
end;

procedure TGun.SetisFireControlDirector(val: Boolean);
begin
end;

function TGun.GetMinAirTarget: Double;
begin
end;

procedure TGun.SetMinAirTarget(val: Double);
begin
end;

function TGun.GetMaxAirTarget: Double;
begin
end;

procedure TGun.SetMaxAirTarget(val: Double);
begin
end;

function TGun.GetMinLandTarget: Double;
begin
end;

procedure TGun.SetMinLandTarget(val: Double);
begin
end;

function TGun.GetMaxLandTarget: Double;
begin
end;

procedure TGun.SetMaxLandTarget(val: Double);
begin
end;

function TMine.GetMineCategory: TMineCategory;
begin
end;

procedure TMine.SetMineCategory(val: TMineCategory);
begin
end;

function TMine.GetMooringType: TMineMooringType;
begin
end;

procedure TMine.SetMooringType(val: TMineMooringType);
begin
end;

function TMine.GetDetectability: TObjectDetectability;
begin
end;

procedure TMine.SetDetectability(val: TObjectDetectability);
begin
end;

function TMine.GetMaxLayingDepth: Double;
begin
end;

procedure TMine.SetMaxLayingDepth(val: Double);
begin
end;

function TMine.GetDimension: TDimension;
begin
end;

procedure TMine.SetDimension(val: TDimension);
begin
end;

function TMine.GetEngagementRange: Double;
begin
end;

procedure TMine.SetEngagementRange(val: Double);
begin
end;

function TMine.GetCrossSection: TPlatformCrossSection;
begin
end;

procedure TMine.SetCrossSection(val: TPlatformCrossSection);
begin
end;

function TMissile.GetEngagementRange: Double;
begin
end;

procedure TMissile.SetEngagementRange(val: Double);
begin
end;

function TMissile.GetDimension: TDimension;
begin
end;

procedure TMissile.SetDimension(val: TDimension);
begin
end;

end.
