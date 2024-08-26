unit uCounterMeasureObject;

interface

uses
  uPlatforms, uPlatformUtility, uDefinedType;

type

//==============================================================================
  TCounterMeasureDevice = class(TPlatformDevice)
  end;

//==============================================================================
  /// <definition>Class for Chaff Decoy Object</definition>
  TChaffDecoy = class(TCounterMeasureDevice)
  private type
    /// <Definition>The upper and lower limits of radar frequencies that this
    /// chaff is effective against. Radars which operate within this frequency range will be adversely
    /// affected when attempting to detect targets in or past the chaff cloud. Radars which
    /// operate outside of the frequency range will neither detect the chaff nor be affected (i.e., attenuated)
    /// by it.</Definition>
    /// <Unit>GHz</Unit>
    RadarFreqAffected = record
      LowerLimit: double;
      UpperLimit: double;
    end;

  strict private
    function GetMaxRadarCrossSection: double;
    procedure SetMaxRadarCrossSection(val: double);
  public
    /// <Definition>this represents the radar cross-section of the chaff at the
    /// end of the bloom phase. The value may be entered as m2 or dB.m2 (selectable units).</Definition>
    /// <Unit>m2 or dB.m2</Unit>
    property MaxRadarCrossSection: double read GetMaxRadarCrossSection write
      SetMaxRadarCrossSection;
  strict private
    function GetBloomTime: Word;
    procedure SetBloomTime(val: Word);
  public
    /// <Definition>Bloom time represents the time it takes for the radar cross-section to change
    /// from zero to the maximum cross-section</Definition>
    /// <Unit>hh:mm:ss</Unit>
    property BloomTime: Word read GetBloomTime write SetBloomTime;
  strict private
    function GetDissipationTImeInStillAir: Word;
    procedure SetDissipationTImeInStillAir(val: Word);
  public
    /// <Definition>Represents the time required for the chaff cloud to completely
    /// dissipate in a zero knot wind.</Definition>
    /// <Unit>hh:mm:ss</Unit>
    property DissipationTImeInStillAir
      : Word read GetDissipationTImeInStillAir
      write SetDissipationTImeInStillAir;
  strict private
    function GetDissipationTimeInWind: double;
    procedure SetDissipationTimeInWind(val: double);
  public
    /// <Defiinition>Represents the time required for the chaff cloud to completely
    /// dissipate in a 100 kt wind.</Defiinition>
    /// <Unit>hh:mm:ss</Unit>
    property DissipationTimeInWind: double read GetDissipationTimeInWind write
      SetDissipationTimeInWind;
  strict private
    function GetDescentRate: double;
    procedure SetDescentRate(val: double);
  public
    /// <Unit>feet/min</Unit>
    /// <Definition>The rate at which chaff altitude changes over time.</Definition>
    property DescentRate: double read GetDescentRate write SetDescentRate;
  strict private
    function GetMaxBloomRadius: double;
    procedure SetMaxBloomRadius(val: double);
  public
    /// <Definition>Sets the maximum physical radius of the chaff bloom.</Definition>
    /// <Unit>nm</Unit>
    property MaxBloomRadius
      : double read GetMaxBloomRadius write SetMaxBloomRadius;
  strict private
    function GetMaxRadarAttenuation: double;
    procedure SetMaxRadarAttenuation(val: double);
  public
    /// <Unit>dB/nm</Unit>
    /// <Definition>The attenuation of a radar signal at full bloom.</Definition>
    property MaxRadarAttenuation: double read GetMaxRadarAttenuation write
      SetMaxRadarAttenuation;
  end;

  /// <Definition>Air bubbles are detectable by active sonars only. When an air bubble is deployed, it's acoustic
  /// cross-section (ACS) will instantly be the maximum value. Over time, the bubble ACS will be reduced
  /// to a value of zero at a rate determined by the specified dissipation time.
  /// The air bubble will be removed from the exercise when the bubble has a depth of zero or the
  /// ACS has fully dissipated. Air bubbles will move in the direction and speed of the prevailing ocean
  /// currents within the exercise area.</Definition>
  TAirBubbleDecoy = class(TCounterMeasureDevice)

  strict private
    function GetMaxAcousticCrossSection: double;
    procedure SetMaxAcousticCrossSection(val: double);
  public
    /// <Definition>The acoustic cross-section of the air bubble at the
    /// point of release.</Definition>
    /// <Unit>db M2</Unit>
    property MaxAcousticCrossSection
      : double read GetMaxAcousticCrossSection write
      SetMaxAcousticCrossSection;
  strict private
    function GetDissipationTime: Integer;
    procedure SetDissipationTime(val: Integer);
  public
    /// <Definition>The time required for the air bubble to completely dissipate.</Definition>
    /// <Unit>second</Unit>
    property DissipationTime: Integer read GetDissipationTime write
      SetDissipationTime;
  strict private
    function GetAscentRate: double;
    procedure SetAscentRate(val: double);
  public
    /// <Definition>The rate at which the air bubble depth changes over time.</Definition>
    /// <Unit>feet/min</Unit>
    property AscentRate: double read GetAscentRate write SetAscentRate;

  end;

  /// <author>Ryu</author>
  /// <Definition>Surface platforms are capable of having a towed anti-torpedo decoy fitted. Developers will specify the decoy's probability of defeating an incoming acoustic torpedo.</Definition>
  TAcousticDecoy = class(TCounterMeasureDevice)

  strict private
    function GetDecoyNoise: Integer;
    procedure SetDecoyNoise(val: Integer);
  public
    /// <definition>define the Ownship/Ambient Noise Intensity Increase, which increases the platform's acoustic intensity
    /// when an acoustic decoy has been deployed by the platform.</definition>
    property DecoyNoise: Integer read GetDecoyNoise write SetDecoyNoise;
  end;

  /// <Definition>Class for Floating Decoy Object</Definition>
  TFloatingDecoy = class(TCounterMeasureDevice)

  strict private
    function GetDimension: TDimension;
    procedure SetDimension(val: TDimension);
  public
    /// <Definition>Entries are
    /// made to Length, Width, and Height.
    /// The platform Height setting is used by the visual detection simulation to determine the lineof-
    /// sight limits to the decoy.</Definition>
    /// <Unit>feet</Unit>
    property Dimension: TDimension read GetDimension write SetDimension;
  strict private
    function GetCrossSection: TPlatformCrossSection;
    procedure SetCrossSection(val: TPlatformCrossSection);
  public
    /// <Definition>Set the front and side cross-sectional areas of the
    /// decoy for detection by the simulated sensors systems during an exercise. During an exercise,
    /// the front and side cross-sections will be converted into a single cross-section based
    /// on the aspect of the decoy relative to the detecting sensor.</Definition>
    property CrossSection: TPlatformCrossSection read GetCrossSection write
      SetCrossSection;
  strict private
    function GetLifetimeDuration: Word;
    procedure SetLifetimeDuration(val: Word);
  public
    /// <Definition>Used to set the operating life of the decoy.</Definition>
    /// <Unit>hh:mm:ss</Unit>
    property LifetimeDuration: Word read GetLifetimeDuration write
      SetLifetimeDuration;

  end;

  /// <Definition>Class for Towed Self Defense Object</Definition>
  TTowedSelfDefense = class(TCounterMeasureDevice)
  public type
    /// <Definition>Set the probability of the jammer effectively
    /// breaking the TARH missile seeker lock or SARH missile FCR lock. The break lock
    /// attempt will occur periodically and the probability used is based on the missile/FCRs ECCM
    /// rating.
    /// If the break lock is successful against a TARH missile, the simulation will prevent the missile
    /// re-acquisition from occurring until the developer specified delay expires. If successful
    /// against an FCR, it will break the assignment and prevent guidance of any SARH missiles
    /// that were reliant on that FCR.</Definition>
    /// <Unit>%</Unit>
    ProbabilityOfSuccess = record
      TypeA: Integer;
      TypeB: Integer;
      TypeC: Integer;
    end;

  strict private
    function GetisTARHMissile: Boolean;
    procedure SetisTARHMissile(val: Boolean);
  public
    /// <Definition>Provides jammer's effectivity against TARH missiles</Definition>
    property isTARHMissile
      : Boolean read GetisTARHMissile write SetisTARHMissile;
  strict private
    function GetisFireControlRadar: Boolean;
    procedure SetisFireControlRadar(val: Boolean);
  public
    /// <Definition>Provides jammer's effectivity against Fire Control.</Definition>
    property isFireControlRadar: Boolean read GetisFireControlRadar write
      SetisFireControlRadar;
  strict private
    function GetECMType: Char;
    procedure SetECMType(val: Char);
  public
    /// <Definition>Jamming type to be used against attacking missiles (either type A, B or C). This
    /// is compared against the missile home on jam settings to determine if the missile will home
    /// on the jamming source and ignore break lock attempts.</Definition>
    property ECMType: Char read GetECMType write SetECMType;

  end;

  TTowedJammerDecoy = class(TCounterMeasureDevice)
  type
    /// <Definition>Set the probability of the jammer effectively
    /// breaking the TARH missile seeker lock or SARH missile FCR lock. The break lock
    /// attempt will occur periodically and the probability used is based on the missile/FCRs ECCM
    /// rating.
    /// If the break lock is successful against a TARH missile, the simulation will prevent the missile
    /// re-acquisition from occurring until the developer specified delay expires. If successful
    /// against an FCR, it will break the assignment and prevent guidance of any SARH missiles
    /// that were reliant on that FCR.</Definition>
    /// <Unit>%</Unit>
    ProbabilityOfSuccess = record
      TypeA: Integer;
      TypeB: Integer;
      TypeC: Integer;
    end;

  strict private
    function GetDimension: TDimension;
    procedure SetDimension(val: TDimension);
  public
    /// <Unit>feet</Unit>
    /// <Definition>Entries are
    /// made to Length, Width, and Height.
    /// The platform Height setting is used by the visual detection simulation to determine the lineof-
    /// sight limits to the decoy.</Definition>
    property Dimension: TDimension read GetDimension write SetDimension;
  strict private
    function GetCrossSection: TPlatformCrossSection;
    procedure SetCrossSection(val: TPlatformCrossSection);
  public
    /// <Definition>Set the front and side cross-sectional areas of the
    /// decoy for detection by the simulated sensors systems during an exercise. During an exercise,
    /// the front and side cross-sections will be converted into a single cross-section based
    /// on the aspect of the decoy relative to the detecting sensor.</Definition>
    property CrossSection: TPlatformCrossSection read GetCrossSection write
      SetCrossSection;
  strict private
    function GetisTARHMissile: Boolean;
    procedure SetisTARHMissile(val: Boolean);
  public
    /// <Definition>Provides jammer's effectivity against TARH missiles</Definition>
    property isTARHMissile
      : Boolean read GetisTARHMissile write SetisTARHMissile;
  strict private
    function GetisFireControlRadar: Boolean;
    procedure SetisFireControlRadar(val: Boolean);
  public
    /// <Definition>Provides jammer's effectivity against Fire Control.</Definition>
    property isFireControlRadar: Boolean read GetisFireControlRadar write
      SetisFireControlRadar;
  strict private
    function GetECMType: Char;
    procedure SetECMType(val: Char);
  public
    /// <Definition>Jamming type to be used against attacking missiles (either type A, B or C). This
    /// is compared against the missile home on jam settings to determine if the missile will home
    /// on the jamming source and ignore break lock attempts.</Definition>
    property ECMType: Char read GetECMType write SetECMType;
  strict private
    function GetActivationDelay: Word;
    procedure SetActivationDelay(val: Word);
  public
    /// <Definition>Set a time delay after deployment before the decoy is considered
    /// to be operational.</Definition>
    property ActivationDelay
      : Word read GetActivationDelay write SetActivationDelay;
  strict private
    function GetTowLength: double;
    procedure SetTowLength(val: double);
  public
    /// <Definition>Sets the length of the towline.</Definition>
    /// <Unit>metres</Unit>
    property TowLength: double read GetTowLength write SetTowLength;
  end;

  /// <Definition>Class for Radar Noise Jammer Object</Definition>
  TRadarNoiseJammer = class(TCounterMeasureDevice)
  public type
    /// <Definition>Sets the upper and lower frequency limits of
    /// the jammer.</Definition>
    /// <Unit>MHz</Unit>
    FreqOperation = record
      Lower: double;
      Upper: double;
    end;

    /// <Definition>Sets the extent of the jammer's vertical coverage.</Definition>
    /// <Unit>degrees</Unit>
    VerticalCoverage = record
      Lower: double;
      Upper: double;
    end;

  strict private
    function GetPowerDensity: double;
    procedure SetPowerDensity(val: double);
  public
    /// <Definition>Amount of power transmitted within the jammer's operating bandwidth.</Definition>
    /// <Unit>KW/MHz</Unit>
    property PowerDensity: double read GetPowerDensity write SetPowerDensity;
  strict private
    function GetJammerType: Char;
    procedure SetJammerType(val: Char);
  public
    /// <Definition>Jammers can be classified as an A, B or C type.
    /// Defines the jammer type, which is compared
    /// against the radar's jamming resistance and
    /// anti-jamming capabilities to determine how
    /// the radar will be affected by noise jamming.</Definition>
    property JammerType: Char read GetJammerType write SetJammerType;
  strict private
    function GetMaxEffectiveRange: double;
    procedure SetMaxEffectiveRange(val: double);
  public
    /// <Unit>nm</Unit>
    /// <Definition>Sets the maximum effective range of the selected jammer.</Definition>
    property MaxEffectiveRange: double read GetMaxEffectiveRange write
      SetMaxEffectiveRange;
  strict private
    function GetMaxSectorWidth: double;
    procedure SetMaxSectorWidth(val: double);
  public
    /// <Unit>degrees</Unit>
    /// <Definition>Sets the maximum angular arc width the jammer can operate in.</Definition>
    property MaxSectorWidth
      : double read GetMaxSectorWidth write SetMaxSectorWidth;

  end;

implementation

function TAcousticDecoy.GetDecoyNoise: Integer;
begin
end;

procedure TAcousticDecoy.SetDecoyNoise(val: Integer);
begin
end;

function TAirBubbleDecoy.GetMaxAcousticCrossSection: double;
begin
end;

procedure TAirBubbleDecoy.SetMaxAcousticCrossSection(val: double);
begin
end;

function TAirBubbleDecoy.GetDissipationTime: Integer;
begin
end;

procedure TAirBubbleDecoy.SetDissipationTime(val: Integer);
begin
end;

function TAirBubbleDecoy.GetAscentRate: double;
begin
end;

procedure TAirBubbleDecoy.SetAscentRate(val: double);
begin
end;

function TChaffDecoy.GetMaxRadarCrossSection: double;
begin
end;

procedure TChaffDecoy.SetMaxRadarCrossSection(val: double);
begin
end;

function TChaffDecoy.GetBloomTime: Word;
begin
end;

procedure TChaffDecoy.SetBloomTime(val: Word);
begin
end;

function TChaffDecoy.GetDissipationTImeInStillAir: Word;
begin
end;

procedure TChaffDecoy.SetDissipationTImeInStillAir(val: Word);
begin
end;

function TChaffDecoy.GetDissipationTimeInWind: double;
begin
end;

procedure TChaffDecoy.SetDissipationTimeInWind(val: double);
begin
end;

function TChaffDecoy.GetDescentRate: double;
begin
end;

procedure TChaffDecoy.SetDescentRate(val: double);
begin
end;

function TChaffDecoy.GetMaxBloomRadius: double;
begin
end;

procedure TChaffDecoy.SetMaxBloomRadius(val: double);
begin
end;

function TChaffDecoy.GetMaxRadarAttenuation: double;
begin
end;

procedure TChaffDecoy.SetMaxRadarAttenuation(val: double);
begin
end;

function TFloatingDecoy.GetDimension: TDimension;
begin
end;

procedure TFloatingDecoy.SetDimension(val: TDimension);
begin
end;

function TFloatingDecoy.GetCrossSection: TPlatformCrossSection;
begin
end;

procedure TFloatingDecoy.SetCrossSection(val: TPlatformCrossSection);
begin
end;

function TFloatingDecoy.GetLifetimeDuration: Word;
begin
end;

procedure TFloatingDecoy.SetLifetimeDuration(val: Word);
begin
end;

function TTowedSelfDefense.GetisTARHMissile: Boolean;
begin
end;

procedure TTowedSelfDefense.SetisTARHMissile(val: Boolean);
begin
end;

function TTowedSelfDefense.GetisFireControlRadar: Boolean;
begin
end;

procedure TTowedSelfDefense.SetisFireControlRadar(val: Boolean);
begin
end;

function TTowedSelfDefense.GetECMType: Char;
begin
end;

procedure TTowedSelfDefense.SetECMType(val: Char);
begin
end;

function TTowedJammerDecoy.GetDimension: TDimension;
begin
end;

procedure TTowedJammerDecoy.SetDimension(val: TDimension);
begin
end;

function TTowedJammerDecoy.GetCrossSection: TPlatformCrossSection;
begin
end;

procedure TTowedJammerDecoy.SetCrossSection(val: TPlatformCrossSection);
begin
end;

function TTowedJammerDecoy.GetisTARHMissile: Boolean;
begin
end;

procedure TTowedJammerDecoy.SetisTARHMissile(val: Boolean);
begin
end;

function TTowedJammerDecoy.GetisFireControlRadar: Boolean;
begin
end;

procedure TTowedJammerDecoy.SetisFireControlRadar(val: Boolean);
begin
end;

function TTowedJammerDecoy.GetECMType: Char;
begin
end;

procedure TTowedJammerDecoy.SetECMType(val: Char);
begin
end;

function TTowedJammerDecoy.GetActivationDelay: Word;
begin
end;

procedure TTowedJammerDecoy.SetActivationDelay(val: Word);
begin
end;

function TTowedJammerDecoy.GetTowLength: double;
begin
end;

procedure TTowedJammerDecoy.SetTowLength(val: double);
begin
end;

function TRadarNoiseJammer.GetPowerDensity: double;
begin
end;

procedure TRadarNoiseJammer.SetPowerDensity(val: double);
begin
end;

function TRadarNoiseJammer.GetJammerType: Char;
begin
end;

procedure TRadarNoiseJammer.SetJammerType(val: Char);
begin
end;

function TRadarNoiseJammer.GetMaxEffectiveRange: double;
begin
end;

procedure TRadarNoiseJammer.SetMaxEffectiveRange(val: double);
begin
end;

function TRadarNoiseJammer.GetMaxSectorWidth: double;
begin
end;

procedure TRadarNoiseJammer.SetMaxSectorWidth(val: double);
begin
end;

end.
