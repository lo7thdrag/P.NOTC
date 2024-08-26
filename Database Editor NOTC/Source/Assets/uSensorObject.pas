unit uSensorObject;

interface

uses
  uDefinedType, uSimObjects, uPlatforms;

type
//==============================================================================
  TSensorDevice = class(TPlatformDevice)
  private
    FActivate : Boolean;

    function GetActivate: boolean;
    procedure SetActivate(val: boolean);
  public
    property Activate: boolean read GetActivate write SetActivate;
  end;

//==============================================================================
  TRadar = class(TSensorDevice)
  public
    RadarType             : TRadarType;
    BaselineDetectionRange: double;
    SpotNumber            : Integer;
    OTHRadarFactor        : double;
    CrossSection          : double;
    ClutterRejection      : double;
    BeamWidth             : Integer;
    MainLobeGain          : double;
    FCRChannels           : Integer;
    Frequency             : double;
    ScanRate              : double;
    MaxAmbigousRange      : double;
  end;

//==============================================================================

  TSonar = class(TSensorDevice)
  private
    FActiveDetectRange: double;
    FDetectingCapabilities: TDetectingCapabilities;
    FPassiveDetectRange: double;
    FCrossSection: double;
    FMaxOperatingDepth: double;
    FCategory: TSonarCategory;
    FActiveSonarPower: double;
    FAssSignalSourceLevel: double;
    FMaxSonarSpeed: double;
    FOperatingMode: TOperatingMode;
    procedure SetActiveDetectRange(const Value: double);
    procedure SetActiveSonarPower(const Value: double);
    procedure SetAssSignalSourceLevel(const Value: double);
    procedure SetCategory(const Value: TSonarCategory);
    procedure SetCrossSection(const Value: double);
    procedure SetDetectingCapabilities(const Value: TDetectingCapabilities);
    procedure SetMaxOperatingDepth(const Value: double);
    procedure SetMaxSonarSpeed(const Value: double);
    procedure SetOperatingMode(const Value: TOperatingMode);
    procedure SetPassiveDetectRange(const Value: double);
  published
  public
    property Category: TSonarCategory read FCategory write SetCategory;
    property OperatingMode: TOperatingMode read FOperatingMode write SetOperatingMode;
    property DetectingCapabilities: TDetectingCapabilities read FDetectingCapabilities write SetDetectingCapabilities;
    property ActiveDetectRange: double read FActiveDetectRange write SetActiveDetectRange;
    property CrossSection: double read FCrossSection write SetCrossSection;
    property PassiveDetectRange: double read FPassiveDetectRange write SetPassiveDetectRange;
    property AssSignalSourceLevel: double read FAssSignalSourceLevel write SetAssSignalSourceLevel;
    property ActiveSonarPower: double read FActiveSonarPower write SetActiveSonarPower;
    property MaxOperatingDepth: double read FMaxOperatingDepth write SetMaxOperatingDepth;
    property MaxSonarSpeed: double read FMaxSonarSpeed write SetMaxSonarSpeed;
  end;

//==============================================================================

  TElectroOptical = class(TSensorDevice)
  private
    FCrossSection: double;
    FMaxDetectRange: double;
    FDetectionRange: double;
    procedure SetCrossSection(const Value: double);
    procedure SetDetectionRange(const Value: double);
    procedure SetMaxDetectRange(const Value: double);
  published
  public
    property DetectionRange: double read FDetectionRange write SetDetectionRange;
    property CrossSection: double read FCrossSection write SetCrossSection;
    property MaxDetectRange: double read FMaxDetectRange write SetMaxDetectRange;
  end;

//==============================================================================

  TESM = class(TSensorDevice)
  private
    FisInterceptComm: boolean;
    FUpperFreqLimitSecond: double;
    FLowFreqLimitCom: double;
    FMaxConfidenceLevel: Integer;
    FIdentificationPeriod: Word;
    FisDetect2ndFreq: boolean;
    FLowFreqLimitSecond: double;
    FUpperFreqLimitCom: double;
    FClassificationPeriod: Word;
    procedure SetClassificationPeriod(const Value: Word);
    procedure SetIdentificationPeriod(const Value: Word);
    procedure SetisDetect2ndFreq(const Value: boolean);
    procedure SetisInterceptComm(const Value: boolean);
    procedure SetLowFreqLimitCom(const Value: double);
    procedure SetLowFreqLimitSecond(const Value: double);
    procedure SetMaxConfidenceLevel(const Value: Integer);
    procedure SetUpperFreqLimitCom(const Value: double);
    procedure SetUpperFreqLimitSecond(const Value: double);
  published
  public
    property MaxConfidenceLevel: Integer read FMaxConfidenceLevel write SetMaxConfidenceLevel;

    property ClassificationPeriod: Word read FClassificationPeriod write SetClassificationPeriod;

    property IdentificationPeriod: Word read FIdentificationPeriod write SetIdentificationPeriod;
    property isInterceptComm: boolean read FisInterceptComm write SetisInterceptComm;
    property isDetect2ndFreq: boolean read FisDetect2ndFreq write SetisDetect2ndFreq;
    property LowFreqLimitCom: double read FLowFreqLimitCom write SetLowFreqLimitCom;
    property UpperFreqLimitCom: double read FUpperFreqLimitCom write SetUpperFreqLimitCom;
    property LowFreqLimitSecond: double read FLowFreqLimitSecond write SetLowFreqLimitSecond;
    property UpperFreqLimitSecond: double read FUpperFreqLimitSecond write SetUpperFreqLimitSecond;
  end;

//==============================================================================
  TMAD = class(TSensorDevice)
  private
    FDetectionRange: double;
    FCrossSection: double;
    procedure SetDetectionRange(const Value: double);
    procedure SetCrossSection(const Value: double);
  public

    property DetectionRange: double read FDetectionRange write SetDetectionRange;
    property CrossSection: double read FCrossSection write SetCrossSection;

  end;

//==============================================================================

  TSonobuoy = class(TSensorDevice)
  private
    FSonar: TSonar;
    FLength: double;
    FWidth: double;
    FEnduranceTime: Word;
    FMaxDepth: Integer;
    FHeight: double;
    procedure SetEnduranceTime(const Value: Word);
    procedure SetHeight(const Value: double);
    procedure SetLength(const Value: double);
    procedure SetMaxDepth(const Value: Integer);
    procedure SetSonar(const Value: TSonar);
    procedure SetWidth(const Value: double);
  published

  public
    property MaxDepth: Integer read FMaxDepth write SetMaxDepth;
    property EnduranceTime:Word read FEnduranceTime write SetEnduranceTime;
    property Length: double read FLength write SetLength;
    property Width: double  read FWidth write SetWidth;
    property Height: double read FHeight write SetHeight;
    property Sonar: TSonar read FSonar write SetSonar;
  end;

implementation

//==============================================================================
{ TSensorDevice }

function TSensorDevice.GetActivate: boolean;
begin

end;

procedure TSensorDevice.SetActivate(val: boolean);
begin
  FActivate := val;
end;

{ TSonar }

procedure TSonar.SetActiveDetectRange(const Value: double);
begin
  FActiveDetectRange := Value;
end;

procedure TSonar.SetActiveSonarPower(const Value: double);
begin
  FActiveSonarPower := Value;
end;

procedure TSonar.SetAssSignalSourceLevel(const Value: double);
begin
  FAssSignalSourceLevel := Value;
end;

procedure TSonar.SetCategory(const Value: TSonarCategory);
begin
  FCategory := Value;
end;

procedure TSonar.SetCrossSection(const Value: double);
begin
  FCrossSection := Value;
end;

procedure TSonar.SetDetectingCapabilities(const Value: TDetectingCapabilities);
begin
  FDetectingCapabilities := Value;
end;

procedure TSonar.SetMaxOperatingDepth(const Value: double);
begin
  FMaxOperatingDepth := Value;
end;

procedure TSonar.SetMaxSonarSpeed(const Value: double);
begin
  FMaxSonarSpeed := Value;
end;

procedure TSonar.SetOperatingMode(const Value: TOperatingMode);
begin
  FOperatingMode := Value;
end;

procedure TSonar.SetPassiveDetectRange(const Value: double);
begin
  FPassiveDetectRange := Value;
end;

{ TElectroOptical }

procedure TElectroOptical.SetCrossSection(const Value: double);
begin
  FCrossSection := Value;
end;

procedure TElectroOptical.SetDetectionRange(const Value: double);
begin
  FDetectionRange := Value;
end;

procedure TElectroOptical.SetMaxDetectRange(const Value: double);
begin
  FMaxDetectRange := Value;
end;

{ TESM }

procedure TESM.SetClassificationPeriod(const Value: Word);
begin
  FClassificationPeriod := Value;
end;

procedure TESM.SetIdentificationPeriod(const Value: Word);
begin
  FIdentificationPeriod := Value;
end;

procedure TESM.SetisDetect2ndFreq(const Value: boolean);
begin
  FisDetect2ndFreq := Value;
end;

procedure TESM.SetisInterceptComm(const Value: boolean);
begin
  FisInterceptComm := Value;
end;

procedure TESM.SetLowFreqLimitCom(const Value: double);
begin
  FLowFreqLimitCom := Value;
end;

procedure TESM.SetLowFreqLimitSecond(const Value: double);
begin
  FLowFreqLimitSecond := Value;
end;

procedure TESM.SetMaxConfidenceLevel(const Value: Integer);
begin
  FMaxConfidenceLevel := Value;
end;

procedure TESM.SetUpperFreqLimitCom(const Value: double);
begin
  FUpperFreqLimitCom := Value;
end;

procedure TESM.SetUpperFreqLimitSecond(const Value: double);
begin
  FUpperFreqLimitSecond := Value;
end;

{ TMAD }

procedure TMAD.SetCrossSection(const Value: double);
begin
  FCrossSection := Value;
end;

procedure TMAD.SetDetectionRange(const Value: double);
begin
  FDetectionRange := Value;
end;

{ TSonobuoy }

procedure TSonobuoy.SetEnduranceTime(const Value: Word);
begin
  FEnduranceTime := Value;
end;

procedure TSonobuoy.SetHeight(const Value: double);
begin
  FHeight := Value;
end;

procedure TSonobuoy.SetLength(const Value: double);
begin
  FLength := Value;
end;

procedure TSonobuoy.SetMaxDepth(const Value: Integer);
begin
  FMaxDepth := Value;
end;

procedure TSonobuoy.SetSonar(const Value: TSonar);
begin
  FSonar := Value;
end;

procedure TSonobuoy.SetWidth(const Value: double);
begin
  FWidth := Value;
end;


end.
