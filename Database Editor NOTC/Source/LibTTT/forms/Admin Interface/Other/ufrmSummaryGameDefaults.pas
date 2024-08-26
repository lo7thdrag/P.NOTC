unit ufrmSummaryGameDefaults;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Mask, Vcl.Imaging.pngimage,
  uDBGame_Defaults, uBaseCoordSystem;

type
  TfrmSummaryGameDefault = class(TForm)
    lbl1: TLabel;
    edtName: TEdit;
    ImgBackgroundForm: TImage;
    Label1: TLabel;
    ImgHeader: TImage;
    pnl2ControlPage: TPanel;
    pgcData: TPageControl;
    tsAboveWater: TTabSheet;
    grpRadarEffect: TGroupBox;
    btnEditRadarCloudCover: TButton;
    btnEditRadarSeaState: TButton;
    btnEditRadarRainfallRate: TButton;
    grpESMEffect: TGroupBox;
    btnEditESMCloudCover: TButton;
    btnEditESMRainfallRate: TButton;
    grpVisualEOFactor: TGroupBox;
    lblDetection: TLabel;
    lblIdentification: TLabel;
    Label2: TLabel;
    lbl2: TLabel;
    trckbrIdentification: TTrackBar;
    trckbrDetection: TTrackBar;
    edtIdentification: TEdit;
    edtDetection: TEdit;
    grpVisualDetector: TGroupBox;
    lblVisualDetectRange: TLabel;
    lblVisualCrossSection: TLabel;
    lblVisualMaxRange: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtVisualCrossSection: TEdit;
    edtVisualDetectRange: TEdit;
    edtVisualMaxRange: TEdit;
    grpChaff: TGroupBox;
    lblChaffAltitudeThreshold: TLabel;
    lblSeductionBloomAltitude: TLabel;
    lblSeductionBloomRange: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtSeductionBloomAltitude: TEdit;
    edtChaffAltitudeThreshold: TEdit;
    edtSeductionBloomRange: TEdit;
    grpAutoGun: TGroupBox;
    lblAutoGunInterceptRange: TLabel;
    lbl9: TLabel;
    lblAutoGunThresholdSpeed: TLabel;
    lbl10: TLabel;
    edtAutoGunInterceptRange: TEdit;
    edtAutoGunThresholdSpeed: TEdit;
    grpMissile: TGroupBox;
    lblMissileReacquisition: TLabel;
    lblMissileHAFOMinRange: TLabel;
    lblMissileHAFOMaxRange: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lblMissileSeaStatePeriodCheck: TLabel;
    lbl14: TLabel;
    edtMissileHAFOMinRange: TEdit;
    edtMissileHAFOMaxRange: TEdit;
    medtMissileReacquisition: TMaskEdit;
    medtMissileSeaStatePeriodCheck: TMaskEdit;
    grpDefensiveJammer: TGroupBox;
    lblBreakLockIntervalTime: TLabel;
    lbl15: TLabel;
    medtBreakLockIntervalTime: TMaskEdit;
    grpMissileEffect: TGroupBox;
    btnEditMissileSeaState: TButton;
    btnEditMissileRainfallRate: TButton;
    tsUnderWater: TTabSheet;
    lblSonobuoy: TLabel;
    lblSonar: TLabel;
    grpAmbientNoiseEffect: TGroupBox;
    btnEditSonarShipingNoise: TButton;
    btnEditSonarSeaState: TButton;
    btnEditSonarRainfallRate: TButton;
    grpAreaOfProbability: TGroupBox;
    lblSonobuoyInitialRadiusDelay: TLabel;
    lblProbabilityDecreaseRate: TLabel;
    lblProbabilityModifier: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    edtProbabilityDecreaseRate: TEdit;
    edtProbabilityModifier: TEdit;
    medtSonobuoyInitialRadiusDelay: TMaskEdit;
    grpMine: TGroupBox;
    lblMineTimeIntervalPODChecks: TLabel;
    lbl18: TLabel;
    medtMineTimeIntervalPODChecks: TMaskEdit;
    grpTMA: TGroupBox;
    lblSonarTMASeduction: TLabel;
    lblSonarTMABearing: TLabel;
    lblSonarTMAMaxCourseError: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lblSonarTMAMaxSpeedError: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    edtSonarTMABearing: TEdit;
    edtSonarTMASeduction: TEdit;
    edtSonarTMAMaxCourseError: TEdit;
    trckbrSonarTMAMaxSpeedError: TTrackBar;
    edtSonarTMAMaxSpeedError: TEdit;
    tsTrack: TTabSheet;
    lblClutterReduction: TLabel;
    lbl41: TLabel;
    grpTimeStaleTrackLostContact: TGroupBox;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl27: TLabel;
    lbl26: TLabel;
    lbl28: TLabel;
    lblTimeStaleTrackLostContactAir: TLabel;
    lblTimeStaleTrackLostContactSurface: TLabel;
    lblTimeStaleTrackLostContactSubsurface: TLabel;
    lblTimeStaleTrackLostContactESM: TLabel;
    lblTimeStaleTrackLostContactSonar: TLabel;
    medtTimeStaleTrackLostContactAir: TMaskEdit;
    medtTimeStaleTrackLostContactSurface: TMaskEdit;
    medtTimeStaleTrackLostContactSubsurface: TMaskEdit;
    medtTimeStaleTrackLostContactESM: TMaskEdit;
    medtTimeStaleTrackLostContactSonar: TMaskEdit;
    grpTrackHistorySampleRate: TGroupBox;
    lblSampleRateAir: TLabel;
    lblSampleRateSurface: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    edtSampleRateSurface: TEdit;
    edtSampleRateAir: TEdit;
    grpTrackHistoryMaxNumOfPoint: TGroupBox;
    lblMaxNumAir: TLabel;
    lblMaxNumSurface: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    edtMaxNumSurface: TEdit;
    edtMaxNumAir: TEdit;
    grpStraightLineGuidanceReversionTime: TGroupBox;
    lblReversionTimeEngagement: TLabel;
    lblReversionTimeOutrun: TLabel;
    lblReversionTimeShadow: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    medtReversionTimeEngagement: TMaskEdit;
    medtReversionTimeOutrun: TMaskEdit;
    medtReversionTimeShadow: TMaskEdit;
    edtClutterReduction: TEdit;
    tsGuidance: TTabSheet;
    lblZigZagPredefinedLegs: TLabel;
    grpSinuation: TGroupBox;
    lblSinuationPeriod: TLabel;
    lblSinuationAmplitude: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    edtSinuationAmplitude: TEdit;
    edtSinuationPeriod: TEdit;
    grpZigZagShort: TGroupBox;
    lblZigZagShortPeriod: TLabel;
    lblZigZagShortAmplitude: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    edtZigZagShortAmplitude: TEdit;
    edtZigZagShortPeriod: TEdit;
    grpZigZagLong: TGroupBox;
    lblZigZagLongPeriod: TLabel;
    lblZigZagLongAmplitude: TLabel;
    lbl46: TLabel;
    lbl47: TLabel;
    edtZigZagLongAmplitude: TEdit;
    edtZigZagLongPeriod: TEdit;
    grpZigZagVeryLong: TGroupBox;
    lblZigZagVeryLongPeriod: TLabel;
    lblZigZagVeryLongAmplitude: TLabel;
    lbl48: TLabel;
    lbl49: TLabel;
    edtZigZagVeryLongAmplitude: TEdit;
    edtZigZagVeryLongPeriod: TEdit;
    tsESMIFF: TTabSheet;
    lblESMBearingErrorRate: TLabel;
    lbl52: TLabel;
    lblMaxIFFRange: TLabel;
    lbl53: TLabel;
    grpDetectionModelling: TGroupBox;
    lblDetectionHF: TLabel;
    lbl50: TLabel;
    lblDetectionUHF: TLabel;
    lbl51: TLabel;
    edtDetectionUHF: TEdit;
    edtDetectionHF: TEdit;
    edtESMBearingErrorRate: TEdit;
    edtMaxIFFRange: TEdit;
    grpIFFModesOrCodes: TGroupBox;
    btnEditIFFModesOrCodes: TButton;
    tsAllocatioinMax: TTabSheet;
    lblMaxRadarClass: TLabel;
    lblMaxSonarClass: TLabel;
    lblMaxSonobuoyClass: TLabel;
    lblMaxEOClass: TLabel;
    lblMaxESMClass: TLabel;
    lblMaxMADClass: TLabel;
    lblMaxFittedWeaponClass: TLabel;
    lblMaxPointEffectWeaponClass: TLabel;
    lblTotalClassAllocationMax: TLabel;
    edtMaxRadarClass: TEdit;
    edtMaxSonarClass: TEdit;
    edtMaxSonobuoyClass: TEdit;
    edtMaxEOClass: TEdit;
    edtMaxESMClass: TEdit;
    edtMaxMADClass: TEdit;
    edtMaxFittedWeaponClass: TEdit;
    edtMaxPointEffectWeaponClass: TEdit;
    edtTotalClassAllocationMax: TEdit;
    mmoAllocationMaximumInfo: TMemo;
    tsCommunication: TTabSheet;
    grpMHSDelayTime: TGroupBox;
    lblMHSDelayTimeFlash: TLabel;
    lblMHSDelayTimeImmediate: TLabel;
    lblMHSDelayTimePriority: TLabel;
    lbl54: TLabel;
    lbl55: TLabel;
    lblMHSDelayTimeRoutine: TLabel;
    lbl57: TLabel;
    lbl56: TLabel;
    medtMHSDelayTimeFlash: TMaskEdit;
    medtMHSDelayTimeImmediate: TMaskEdit;
    medtMHSDelayTimePriority: TMaskEdit;
    medtMHSDelayTimeRoutine: TMaskEdit;
    grpMaximumRange: TGroupBox;
    lblMaxRangeUnderwaterTelephone: TLabel;
    lblMaxRangeHF: TLabel;
    lblMaxRangeUHF: TLabel;
    lbl58: TLabel;
    lbl59: TLabel;
    lbl60: TLabel;
    edtMaxRangeHF: TEdit;
    edtMaxRangeUnderwaterTelephone: TEdit;
    edtMaxRangeUHF: TEdit;
    grpTimeRemoveStaleTrack: TGroupBox;
    lblTimeRemoveStaleTrackAir: TLabel;
    lblTimeRemoveStaleTrackSurface: TLabel;
    lblTimeRemoveStaleTrackSubsurface: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lblTimeRemoveStaleTrackESM: TLabel;
    lblTimeRemoveStaleTrackSonar: TLabel;
    lbl32: TLabel;
    lbl31: TLabel;
    lbl33: TLabel;
    medtTimeRemoveStaleTrackAir: TMaskEdit;
    medtTimeRemoveStaleTrackSurface: TMaskEdit;
    medtTimeRemoveStaleTrackSubsurface: TMaskEdit;
    medtTimeRemoveStaleTrackESM: TMaskEdit;
    medtTimeRemoveStaleTrackSonar: TMaskEdit;
    btnSaveAsTrainer: TButton;
    btnOK: TButton;
    btnApply: TButton;
    btnCancel: TButton;

    procedure FormShow(Sender: TObject);

    //Global
    procedure edtChange(Sender: TObject);

    procedure edtNameKeyPress(Sender: TObject; var Key: Char);
    procedure DisplayEffectTable(Sender: TObject);
    procedure trckbrDetectionChange(Sender: TObject);
    procedure edtDetectionKeyPress(Sender: TObject; var Key: Char);
    procedure trckbrIdentificationChange(Sender: TObject);
    procedure edtIdentificationKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtVisualDetectRangeKeyPress(Sender: TObject; var Key: Char);
    procedure edtVisualCrossSectionKeyPress(Sender: TObject; var Key: Char);
    procedure edtVisualMaxRangeKeyPress(Sender: TObject; var Key: Char);
    procedure edtChaffAltitudeThresholdKeyPress(Sender: TObject; var Key: Char);
    procedure edtSeductionBloomAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure edtSeductionBloomRangeKeyPress(Sender: TObject; var Key: Char);
    procedure edtAutoGunInterceptRangeKeyPress(Sender: TObject; var Key: Char);
    procedure edtAutoGunThresholdSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure medtMissileReacquisitionKeyPress(Sender: TObject; var Key: Char);
    procedure edtMissileHAFOMinRangeKeyPress(Sender: TObject; var Key: Char);
    procedure edtMissileHAFOMaxRangeKeyPress(Sender: TObject; var Key: Char);
    procedure medtMissileSeaStatePeriodCheckKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtBreakLockIntervalTimeKeyPress(Sender: TObject; var Key: Char);
    procedure medtSonobuoyInitialRadiusDelayKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtProbabilityDecreaseRateKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtProbabilityModifierKeyPress(Sender: TObject; var Key: Char);
    procedure medtMineTimeIntervalPODChecksKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtSonarTMASeductionKeyPress(Sender: TObject; var Key: Char);
    procedure edtSonarTMABearingKeyPress(Sender: TObject; var Key: Char);
    procedure edtSonarTMAMaxCourseErrorKeyPress(Sender: TObject; var Key: Char);
    procedure trckbrSonarTMAMaxSpeedErrorChange(Sender: TObject);
    procedure edtSonarTMAMaxSpeedErrorKeyPress(Sender: TObject; var Key: Char);
    procedure medtTimeStaleTrackLostContactAirKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtTimeStaleTrackLostContactSurfaceKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtTimeStaleTrackLostContactSubsurfaceKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtTimeStaleTrackLostContactESMKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtTimeStaleTrackLostContactSonarKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtTimeRemoveStaleTrackAirKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtTimeRemoveStaleTrackSurfaceKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtTimeRemoveStaleTrackSubsurfaceKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtTimeRemoveStaleTrackESMKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtTimeRemoveStaleTrackSonarKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtSampleRateAirKeyPress(Sender: TObject; var Key: Char);
    procedure edtSampleRateSurfaceKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxNumAirKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxNumSurfaceKeyPress(Sender: TObject; var Key: Char);
    procedure medtReversionTimeEngagementKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtReversionTimeOutrunKeyPress(Sender: TObject; var Key: Char);
    procedure medtReversionTimeShadowKeyPress(Sender: TObject; var Key: Char);
    procedure edtClutterReductionKeyPress(Sender: TObject; var Key: Char);
    procedure edtSinuationPeriodKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtSinuationAmplitudeKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtZigZagShortPeriodKeyPress(Sender: TObject; var Key: Char);
    procedure edtZigZagShortAmplitudeKeyPress(Sender: TObject; var Key: Char);
    procedure edtZigZagLongPeriodKeyPress(Sender: TObject; var Key: Char);
    procedure edtZigZagLongAmplitudeKeyPress(Sender: TObject; var Key: Char);
    procedure edtZigZagVeryLongPeriodKeyPress(Sender: TObject; var Key: Char);
    procedure edtZigZagVeryLongAmplitudeKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtDetectionHFKeyPress(Sender: TObject; var Key: Char);
    procedure edtDetectionUHFKeyPress(Sender: TObject; var Key: Char);
    procedure edtESMBearingErrorRateKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxIFFRangeKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditIFFModesOrCodesClick(Sender: TObject);
    procedure edtMaxRadarClassKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxSonarClassKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxSonobuoyClassKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxEOClassKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxESMClassKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxMADClassKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtMaxFittedWeaponClassKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxPointEffectWeaponClassKeyPress(Sender: TObject;
      var Key: Char);
    procedure medtMHSDelayTimeFlashKeyPress(Sender: TObject; var Key: Char);
    procedure medtMHSDelayTimeImmediateKeyPress(Sender: TObject; var Key: Char);
    procedure medtMHSDelayTimePriorityKeyPress(Sender: TObject; var Key: Char);
    procedure medtMHSDelayTimeRoutineKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxRangeUnderwaterTelephoneKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtMaxRangeHFKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxRangeUHFKeyPress(Sender: TObject; var Key: Char);

    procedure btnSaveAsTrainerClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);

  private
    FSelectedGameDefault : TGame_Defaults;

    function CekInput: Boolean;
    procedure UpdateGameDefaultData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedGameDefault : TGame_Defaults read FSelectedGameDefault
      write FSelectedGameDefault;
  end;

var
  frmSummaryGameDefault: TfrmSummaryGameDefault;

implementation

{$R *.dfm}
uses
  uDataModuleTTT, tttData, newClassASTT, ufrmEffectsTable, uLibSettingTTT, uIFFMode;

procedure TfrmSummaryGameDefault.btnApplyClick(Sender: TObject);
const
  C_RadarFreq : array [0..9] of Double = (0.0, 1.0, 2.0, 5.0, 10.0, 15.0, 20.0,
    30.0, 40.0, 100.0);
  C_SonarFreq1 : array [0..10] of Double = (0.1, 0.2, 0.4, 0.7, 1.0, 2.0, 4.0,
    7.0, 10.0, 20.0, 40.0);
  C_SonarFreq2 : array [0..15] of Double = (0.05, 0.1, 0.2, 0.5, 1.0, 2.0, 3.0,
    4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 20.0, 50.0);
var
  second, i, j, k, l : Integer;
  rainfallOnRadar : TGame_Rainfall_On_Radar;
  cloudOnRadar : TGame_Cloud_On_Radar;
  seastateOnRadar : TGame_Sea_On_Radar;
  rainfallOnESM : TGame_Rainfall_On_ESM;
  cloudOnESM : TGame_Cloud_On_ESM;
  rainfallOnMissile : TGame_Rainfall_On_Missile_Seeker;
  seastateOnMissile : TGame_Sea_On_Missile_Safe_Altitude;
  rainfallOnSonar : TGame_Rainfall_On_Sonar;
  shipnoiseOnSonar : TGame_Ship_On_Sonar;
  seastateOnSonar : TGame_Sea_On_Sonar;
  iffModeCode : TGame_Default_IFF_Mode_Code;
begin

  with FSelectedGameDefault do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    with FData do
    begin
      LastName := edtName.Text;
      Defaults_Identifier := edtName.Text;

      //Above Water
      Visual_Detection_Factor := trckbrDetection.Position / 100;
      Visual_Ident_Factor := trckbrIdentification.Position / 100;
      Visual_Detect_Range := StrToFloat(edtVisualDetectRange.Text);
      Known_Cross_Section := StrToFloat(edtVisualCrossSection.Text);
      Max_Visual_Range := StrToFloat(edtVisualMaxRange.Text);
      Chaff_Altitude_Threshold := StrToFloat(edtChaffAltitudeThreshold.Text);
      Seduction_Bloom_Altitude := StrToInt(edtSeductionBloomAltitude.Text);
      Seduction_Bloom_Range := StrToFloat(edtSeductionBloomRange.Text);
      Auto_Gun_Interception_Range := StrToFloat(edtAutoGunInterceptRange.Text);
      Auto_Gun_Threshold_Speed := StrToFloat(edtAutoGunThresholdSpeed.Text);

      TimeToSecond(medtMissileReacquisition.Text, second);
      Missile_Reacquisition_Time := second;

      HAFO_Min_Range := StrToFloat(edtMissileHAFOMinRange.Text);
      HAFO_Max_Range := StrToFloat(edtMissileHAFOMaxRange.Text);

      TimeToSecond(medtMissileSeaStatePeriodCheck.Text, second);
      Missile_Sea_Check_Interval := second;

      TimeToSecond(medtBreakLockIntervalTime.Text, second);
      Jam_Break_Lock_Time_Interval := second;

      //Under Water
      TimeToSecond(medtSonobuoyInitialRadiusDelay.Text, second);
      Init_AOP := second;

      AOP_Decrease_Rate := StrToFloat(edtProbabilityDecreaseRate.Text);
      Init_AOP_Modifier := StrToFloat(edtProbabilityModifier.Text);

      TimeToSecond(medtMineTimeIntervalPODChecks.Text, second);
      POD_Check_Time := second;

      TMA_Range_Rate := StrToFloat(edtSonarTMASeduction.Text);
      TMA_Relative_Bearing_Rate := StrToFloat(edtSonarTMABearing.Text);
      Passive_Sonar_Max_Course_Error :=
        StrToFloat(edtSonarTMAMaxCourseError.Text);
      Passive_Sonar_Max_Speed_Error :=
        trckbrSonarTMAMaxSpeedError.Position / 100;

      //Tracks
      TimeToSecond(medtTimeStaleTrackLostContactAir.Text, second);
      Air_Lost_Time := second;

      TimeToSecond(medtTimeStaleTrackLostContactSurface.Text, second);
      Sur_Lost_Time := second;

      TimeToSecond(medtTimeStaleTrackLostContactSubsurface.Text, second);
      Sub_Lost_Time := second;

      TimeToSecond(medtTimeStaleTrackLostContactESM.Text, second);
      ESM_Bearing_Lost_Time := second;

      TimeToSecond(medtTimeStaleTrackLostContactSonar.Text, second);
      Sonar_Bearing_Lost_Time := second;

      TimeToSecond(medtTimeRemoveStaleTrackAir.Text, second);
      Stale_Air_Time := second;

      TimeToSecond(medtTimeRemoveStaleTrackSurface.Text, second);
      Stale_Sur_Time := second;

      TimeToSecond(medtTimeRemoveStaleTrackSubsurface.Text, second);
      Stale_Sub_Time := second;

      TimeToSecond(medtTimeRemoveStaleTrackESM.Text, second);
      Stale_ESM_Bearing_Time := second;

      TimeToSecond(medtTimeRemoveStaleTrackSonar.Text, second);
      Stale_Sonar_Bearing_Time := second;

      Track_History_Air_Sample_Rate := StrToInt(edtSampleRateAir.Text);
      Track_History_Sample_Rate := StrToInt(edtSampleRateSurface.Text);
      Track_History_Air_Max_Points := StrToInt(edtMaxNumAir.Text);
      Track_History_Sample_Rate := StrToInt(edtMaxNumSurface.Text);

      TimeToSecond(medtReversionTimeEngagement.Text, second);
      Engage_Guide_Stale_Target_Time := second;

      TimeToSecond(medtReversionTimeOutrun.Text, second);
      Outrun_Guide_Stale_Target_Time := second;

      TimeToSecond(medtReversionTimeShadow.Text, second);
      Shadow_Guide_Stale_Target_Time := second;

      Clutter_Reduction_Scale := StrToFloat(edtClutterReduction.Text);

      //Guidance
      Sine_Period_Distance := StrToFloat(edtSinuationPeriod.Text);
      Sine_Period_Amplitude := StrToFloat(edtSinuationAmplitude.Text);
      Short_Period_Distance := StrToFloat(edtZigZagShortPeriod.Text);
      Short_Period_Amplitude := StrToFloat(edtZigZagShortAmplitude.Text);
      Long_Period_Distance := StrToFloat(edtZigZagLongPeriod.Text);
      Long_Period_Amplitude := StrToFloat(edtZigZagLongAmplitude.Text);
      Very_Period_Distance := StrToFloat(edtZigZagVeryLongPeriod.Text);
      Very_Period_Amplitude := StrToFloat(edtZigZagVeryLongAmplitude.Text);

      //ESM/IFF
      HF_Datalink_MHS_Trans_Freq := StrToFloat(edtDetectionHF.Text);
      UHF_Datalink_MHS_Trans_Freq := StrToFloat(edtDetectionUHF.Text);
      ESM_Error_Corr_Rate := StrToFloat(edtESMBearingErrorRate.Text);
      Max_IFF_Range := StrToFloat(edtMaxIFFRange.Text);

      //Allocation Maximum
      Max_Num_Radar_Classes := StrToInt(edtMaxRadarClass.Text);
      Max_Num_Sonar_Classes := StrToInt(edtMaxSonarClass.Text);
      Max_Num_Sonobuoy_Classes := StrToInt(edtMaxSonobuoyClass.Text);
      Max_Num_EO_Classes := StrToInt(edtMaxEOClass.Text);
      Max_Num_ESM_Classes := StrToInt(edtMaxESMClass.Text);
      Max_Num_MAD_Classes := StrToInt(edtMaxMADClass.Text);
      Max_Num_Fitted_Weap_Classes := StrToInt(edtMaxFittedWeaponClass.Text);
      Max_Num_Point_Effect_Classes := StrToInt(edtMaxPointEffectWeaponClass.Text);

      //Communication
      TimeToSecond(medtMHSDelayTimeFlash.Text, second);
      MHS_Flash_Delay_Time := second;

      TimeToSecond(medtMHSDelayTimeImmediate.Text, second);
      MHS_Immed_Delay_Time := second;

      TimeToSecond(medtMHSDelayTimePriority.Text, second);
      MHS_Priority_Delay_Time := second;

      TimeToSecond(medtMHSDelayTimeRoutine.Text, second);
      MHS_Routine_Delay_Time := second;

      Max_UWT_Range := StrToFloat(edtMaxRangeUnderwaterTelephone.Text);
      Max_HF_Detect_Range := StrToFloat(edtMaxRangeHF.Text);
      Max_UHF_Detect_Range := StrToFloat(edtMaxRangeUHF.Text);
    end;

    if FData.Defaults_Index = 0 then
    begin
      dmTTT.InsertGameDefaultDef(FData);

      //Rainfal On Radar
      for i := 0 to Length(C_RadarFreq) - 1 do
      begin
        rainfallOnRadar := TGame_Rainfall_On_Radar.Create;
        rainfallOnRadar.FData.Defaults_Index := FData.Defaults_Index;
        rainfallOnRadar.FData.Radar_Frequency := C_RadarFreq[i];

        dmTTT.InsertGameRainfallOnRadar(rainfallOnRadar.FData);
      end;

      //Cloud On Radar
      for i := 0 to Length(C_RadarFreq) - 1 do
      begin
        cloudOnRadar := TGame_Cloud_On_Radar.Create;
        cloudOnRadar.FData.Defaults_Index := FData.Defaults_Index;
        cloudOnRadar.FData.Radar_Frequency := C_RadarFreq[i];

        dmTTT.InsertGameCloudOnRadar(cloudOnRadar.FData);
      end;

      //SeaState On Radar
      for i := 0 to 9 do
      begin
        seastateOnRadar := TGame_Sea_On_Radar.Create;
        seastateOnRadar.FData.Defaults_Index := FData.Defaults_Index;
        seastateOnRadar.FData.Sea_State := i;

        dmTTT.InsertGameSeaStateOnRadar(seastateOnRadar.FData);
      end;

      //Rainfal On ESM
      for i := 0 to Length(C_RadarFreq) - 1 do
      begin
        rainfallOnESM := TGame_Rainfall_On_ESM.Create;
        rainfallOnESM.FData.Defaults_Index := FData.Defaults_Index;
        rainfallOnESM.FData.Radar_Frequency := C_RadarFreq[i];

        dmTTT.InsertGameRainfallOnESM(rainfallOnESM.FData);
      end;

      //Cloud On ESM
      for i := 0 to Length(C_RadarFreq) - 1 do
      begin
        cloudOnESM := TGame_Cloud_On_ESM.Create;
        cloudOnESM.FData.Defaults_Index := FData.Defaults_Index;
        cloudOnESM.FData.Radar_Frequency := C_RadarFreq[i];

        dmTTT.InsertGameCloudOnESM(cloudOnESM.FData);
      end;

      //Rainfal On Missile
      for i := 3 to 5 do
      begin
        rainfallOnMissile := TGame_Rainfall_On_Missile_Seeker.Create;
        rainfallOnMissile.FData.Defaults_Index := FData.Defaults_Index;
        rainfallOnMissile.FData.Guide_Type := i;

        dmTTT.InsertGameRainfallOnMissile(rainfallOnMissile.FData);
      end;

      //SeaState On Missile
      for i := 0 to 9 do
      begin
        seastateOnMissile := TGame_Sea_On_Missile_Safe_Altitude.Create;
        seastateOnMissile.FData.Defaults_Index := FData.Defaults_Index;
        seastateOnMissile.FData.Sea_State := i;

        dmTTT.InsertGameSeaStateOnMissile(seastateOnMissile.FData);
      end;

      //Rainfal On Sonar
      for i := 0 to Length(C_SonarFreq1) - 1 do
      begin
        rainfallOnSonar := TGame_Rainfall_On_Sonar.Create;
        rainfallOnSonar.FData.Defaults_Index := FData.Defaults_Index;
        rainfallOnSonar.FData.Sonar_Frequency := C_SonarFreq1[i];

        dmTTT.InsertGameRainfallOnSonar(rainfallOnSonar.FData);
      end;

      //Ship On Sonar
      for i := 0 to Length(C_SonarFreq2) - 1 do
      begin
        shipnoiseOnSonar := TGame_Ship_On_Sonar.Create;
        shipnoiseOnSonar.FData.Defaults_Index := FData.Defaults_Index;
        shipnoiseOnSonar.FData.Sonar_Frequency := C_SonarFreq2[i];

        dmTTT.InsertGameShipNoiseOnSonar(shipnoiseOnSonar.FData);
      end;

      //SeaState On Sonar
      for i := 0 to Length(C_SonarFreq2) - 1 do
      begin
        seastateOnSonar := TGame_Sea_On_Sonar.Create;
        seastateOnSonar.FData.Defaults_Index := FData.Defaults_Index;
        seastateOnSonar.FData.Sonar_Frequency := C_SonarFreq2[i];

        dmTTT.InsertGameSeaStateOnSonar(seastateOnSonar.FData);
      end;

      //IFF Mode Code
      for i := 1 to 5 do //Force Designation : Red, Amber, Blue, Green, No Force
      begin
        for j := 0 to 1 do //IFF Type : Interrogator, Transponder
        begin
          for k := 0 to 4 do //Mode : 1, 2, 3, 3C, 4
          begin
            iffModeCode := TGame_Default_IFF_Mode_Code.Create;
            iffModeCode.FData.Defaults_Index := FData.Defaults_Index;
            iffModeCode.FData.Force_Designation := i;
            iffModeCode.FData.IFF_Device_Type := j;
            iffModeCode.FData.IFF_Mode := k;

            dmTTT.InsertIFFModeCode(iffModeCode.FData);
          end;
        end;
      end;

      ShowMessage('Data has been saved');
    end
    else
    begin
      dmTTT.UpdateGameDefaultDef(FData);
      ShowMessage('Data has been updated');
    end;
  end;

  UpdateGameDefaultData;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummaryGameDefault.trckbrDetectionChange(Sender: TObject);
begin
  edtDetection.Text := IntToStr(TTrackBar(Sender).Position);
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.trckbrIdentificationChange(Sender: TObject);
begin
  edtIdentification.Text := IntToStr(TTrackBar(Sender).Position);
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.trckbrSonarTMAMaxSpeedErrorChange( Sender: TObject);
begin
  edtSonarTMAMaxSpeedError.Text := IntToStr(TTrackBar(Sender).Position);
end;

procedure TfrmSummaryGameDefault.UpdateGameDefaultData;
var
  timeStr : string;
begin
  with FSelectedGameDefault.FData do
  begin
    if Defaults_Index = 0 then
      edtName.Text := '(Unnamed)'
    else
      edtName.Text := Defaults_Identifier;

    //Above Water
    btnEditRadarRainfallRate.Enabled := Defaults_Index <> 0;
    btnEditRadarCloudCover.Enabled := Defaults_Index <> 0;
    btnEditRadarSeaState.Enabled := Defaults_Index <> 0;
    btnEditESMRainfallRate.Enabled := Defaults_Index <> 0;
    btnEditESMCloudCover.Enabled := Defaults_Index <> 0;
    btnEditMissileRainfallRate.Enabled := Defaults_Index <> 0;
    btnEditMissileSeaState.Enabled := Defaults_Index <> 0;
    trckbrDetection.Position := Round(Visual_Detection_Factor * 100);
    trckbrIdentification.Position := Round(Visual_Ident_Factor * 100);
    edtVisualDetectRange.Text := FormatFloat('0.00', Visual_Detect_Range);
    edtVisualCrossSection.Text := FormatFloat('0.0', Known_Cross_Section);
    edtVisualMaxRange.Text := FormatFloat('0.00', Max_Visual_Range);
    edtChaffAltitudeThreshold.Text := FormatFloat('0', Chaff_Altitude_Threshold);
    edtSeductionBloomAltitude.Text := FormatFloat('0', Seduction_Bloom_Altitude);
    edtSeductionBloomRange.Text := FormatFloat('0.00', Seduction_Bloom_Range);
    edtAutoGunInterceptRange.Text := FormatFloat('0.00', Auto_Gun_Interception_Range);
    edtAutoGunThresholdSpeed.Text := FormatFloat('0.00', Seduction_Bloom_Range);

    SecondToTime(Missile_Reacquisition_Time, timeStr);
    medtMissileReacquisition.Text := timeStr;

    edtMissileHAFOMinRange.Text := FormatFloat('0', HAFO_Min_Range);
    edtMissileHAFOMaxRange.Text := FormatFloat('0', HAFO_Max_Range);

    SecondToTime(Missile_Sea_Check_Interval, timeStr);
    medtMissileSeaStatePeriodCheck.Text := timeStr;

    SecondToTime(Jam_Break_Lock_Time_Interval, timeStr);
    medtBreakLockIntervalTime.Text := timeStr;

    //Under Water
    btnEditSonarRainfallRate.Enabled := Defaults_Index <> 0;
    btnEditSonarShipingNoise.Enabled := Defaults_Index <> 0;
    btnEditSonarSeaState.Enabled := Defaults_Index <> 0;

    SecondToTime(Init_AOP, timeStr);
    medtSonobuoyInitialRadiusDelay.Text := timeStr;

    edtProbabilityDecreaseRate.Text := FormatFloat('0.00', AOP_Decrease_Rate);
    edtProbabilityModifier.Text := FormatFloat('0.0', Init_AOP_Modifier);

    SecondToTime(POD_Check_Time, timeStr);
    medtMineTimeIntervalPODChecks.Text := timeStr;

    edtSonarTMASeduction.Text := FormatFloat('0.00', TMA_Range_Rate);
    edtSonarTMABearing.Text := FormatFloat('0.0', TMA_Relative_Bearing_Rate);
    edtSonarTMAMaxCourseError.Text := FormatFloat('0', Passive_Sonar_Max_Course_Error);
    trckbrSonarTMAMaxSpeedError.Position :=
      Round(Passive_Sonar_Max_Speed_Error * 100);

    //Tracks
    SecondToTime(Air_Lost_Time, timeStr);
    medtTimeStaleTrackLostContactAir.Text := timeStr;

    SecondToTime(Sur_Lost_Time, timeStr);
    medtTimeStaleTrackLostContactSurface.Text := timeStr;

    SecondToTime(Sub_Lost_Time, timeStr);
    medtTimeStaleTrackLostContactSubsurface.Text := timeStr;

    SecondToTime(ESM_Bearing_Lost_Time, timeStr);
    medtTimeStaleTrackLostContactESM.Text := timeStr;

    SecondToTime(Sonar_Bearing_Lost_Time, timeStr);
    medtTimeStaleTrackLostContactSonar.Text := timeStr;

    SecondToTime(Stale_Air_Time, timeStr);
    medtTimeRemoveStaleTrackAir.Text := timeStr;

    SecondToTime(Stale_Sur_Time, timeStr);
    medtTimeRemoveStaleTrackSurface.Text := timeStr;

    SecondToTime(Stale_Sub_Time, timeStr);
    medtTimeRemoveStaleTrackSubsurface.Text := timeStr;

    SecondToTime(Stale_ESM_Bearing_Time, timeStr);
    medtTimeRemoveStaleTrackESM.Text := timeStr;

    SecondToTime(Stale_Sonar_Bearing_Time, timeStr);
    medtTimeRemoveStaleTrackSonar.Text := timeStr;

    edtSampleRateAir.Text := IntToStr(Track_History_Air_Sample_Rate);
    edtSampleRateSurface.Text := IntToStr(Track_History_Sample_Rate);
    edtMaxNumAir.Text := IntToStr(Track_History_Air_Max_Points);
    edtMaxNumSurface.Text := IntToStr(Track_History_Sample_Rate);

    SecondToTime(Engage_Guide_Stale_Target_Time, timeStr);
    medtReversionTimeEngagement.Text := timeStr;

    SecondToTime(Outrun_Guide_Stale_Target_Time, timeStr);
    medtReversionTimeOutrun.Text := timeStr;

    SecondToTime(Shadow_Guide_Stale_Target_Time, timeStr);
    medtReversionTimeShadow.Text := timeStr;

    edtClutterReduction.Text := FormatFloat('0', Clutter_Reduction_Scale);

    //Guidance
    edtSinuationPeriod.Text := FormatFloat('0.00', Sine_Period_Distance);
    edtSinuationAmplitude.Text := FormatFloat('0.00', Sine_Period_Amplitude);
    edtZigZagShortPeriod.Text := FormatFloat('0.00', Short_Period_Distance);
    edtZigZagShortAmplitude.Text := FormatFloat('0.00', Short_Period_Amplitude);
    edtZigZagLongPeriod.Text := FormatFloat('0.00', Long_Period_Distance);
    edtZigZagLongAmplitude.Text := FormatFloat('0.00', Long_Period_Amplitude);
    edtZigZagVeryLongPeriod.Text := FormatFloat('0.00', Very_Period_Distance);
    edtZigZagVeryLongAmplitude.Text := FormatFloat('0.00', Very_Period_Amplitude);

    //ESM/IFF
    edtDetectionHF.Text := FormatFloat('0.0', HF_Datalink_MHS_Trans_Freq);
    edtDetectionUHF.Text := FormatFloat('0.0', UHF_Datalink_MHS_Trans_Freq);
    edtESMBearingErrorRate.Text := FormatFloat('0', ESM_Error_Corr_Rate);
    edtMaxIFFRange.Text := FormatFloat('0.00', Max_IFF_Range);

    //Allocation Maximum
    edtMaxRadarClass.Text := IntToStr(Max_Num_Radar_Classes);
    edtMaxSonarClass.Text := IntToStr(Max_Num_Sonar_Classes);
    edtMaxSonobuoyClass.Text := IntToStr(Max_Num_Sonobuoy_Classes);
    edtMaxEOClass.Text := IntToStr(Max_Num_EO_Classes);
    edtMaxESMClass.Text := IntToStr(Max_Num_ESM_Classes);
    edtMaxMADClass.Text := IntToStr(Max_Num_MAD_Classes);
    edtMaxFittedWeaponClass.Text := IntToStr(Max_Num_Fitted_Weap_Classes);
    edtMaxPointEffectWeaponClass.Text := IntToStr(Max_Num_Point_Effect_Classes);
    edtTotalClassAllocationMax.Text := IntToStr(Max_Num_Radar_Classes +
      Max_Num_Sonar_Classes + Max_Num_Sonobuoy_Classes + Max_Num_EO_Classes +
      Max_Num_ESM_Classes + Max_Num_MAD_Classes + Max_Num_Fitted_Weap_Classes +
      Max_Num_Point_Effect_Classes);

    //Communication
    SecondToTime(Round(MHS_Flash_Delay_Time), timeStr);
    medtMHSDelayTimeFlash.Text := timeStr;

    SecondToTime(Round(MHS_Immed_Delay_Time), timeStr);
    medtMHSDelayTimeImmediate.Text := timeStr;

    SecondToTime(Round(MHS_Priority_Delay_Time), timeStr);
    medtMHSDelayTimePriority.Text := timeStr;

    SecondToTime(Round(MHS_Routine_Delay_Time), timeStr);
    medtMHSDelayTimeRoutine.Text := timeStr;

    edtMaxRangeUnderwaterTelephone.Text := FormatFloat('0.00', Max_UWT_Range);
    edtMaxRangeHF.Text := FormatFloat('0.00', Max_HF_Detect_Range);
    edtMaxRangeUHF.Text := FormatFloat('0.00', Max_UHF_Detect_Range);
  end;

  LastName := edtName.Text;
end;

procedure TfrmSummaryGameDefault.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummaryGameDefault.btnEditIFFModesOrCodesClick(Sender: TObject);
begin
  fIFFMode := TIFFMode.Create(Self);
  try
    with fIFFMode do
    begin
      SelectedGameDefault := FSelectedGameDefault;
      ShowModal;
    end;
  finally
    fIFFMode.Free;
  end;
end;

procedure TfrmSummaryGameDefault.btnOkClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  Close;
end;

procedure TfrmSummaryGameDefault.btnSaveAsTrainerClick(Sender: TObject);
begin
  SaveFF_dBaseSetting(vSettingFile, vDBSetting);
end;

function TfrmSummaryGameDefault.CekInput: Boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtName.Text = '') or (edtName.Text = ' ') then
  begin
    ShowMessage('Please use another name');
    Exit;
  end;

  {Jika berisi spasi semua}
  if Copy(edtName.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtName.Text);
    numSpace := 0;
    for i := 1 to chkSpace do
    begin
      if edtName.Text[i] = #32 then
      numSpace := numSpace + 1;
    end;
    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another name');
      Exit;
    end;
  end;

  {Game Default utama tidak bisa Rename}
  if FSelectedGameDefault.FData.Defaults_Index = 1 then
  begin
    if LastName <> edtName.Text then
    begin
      ShowMessage('Cannot Rename this Game Default');
        Exit;
    end;
  end;


  {Jika Class Name sudah ada}
  if (dmTTT.GetGameDefaultDef(edtName.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedGameDefault.FData.Defaults_Index= 0 then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end
    else if LastName <> edtName.Text then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfrmSummaryGameDefault.DisplayEffectTable(Sender: TObject);
begin
  frmEffectsTable := TfrmEffectsTable.Create(Self);
  try
    with frmEffectsTable do
    begin
      EffectType := E_EffectType(TButton(Sender).Tag);
      SelectedGameDefault := FSelectedGameDefault;
      ShowModal;
    end;
  finally
    frmEffectsTable.Free;
  end;
end;

procedure TfrmSummaryGameDefault.FormShow(Sender: TObject);
begin
  tsAboveWater.Show;
  UpdateGameDefaultData;

  with FSelectedGameDefault.FData do
    btnApply.Enabled := Defaults_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtBreakLockIntervalTimeKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtMHSDelayTimeFlashKeyPress(Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtMHSDelayTimeImmediateKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtMHSDelayTimePriorityKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtMHSDelayTimeRoutineKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtMineTimeIntervalPODChecksKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtMissileReacquisitionKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtMissileSeaStatePeriodCheckKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtReversionTimeEngagementKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtReversionTimeOutrunKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtReversionTimeShadowKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtSonobuoyInitialRadiusDelayKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtTimeRemoveStaleTrackAirKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtTimeRemoveStaleTrackESMKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtTimeRemoveStaleTrackSonarKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtTimeRemoveStaleTrackSubsurfaceKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtTimeRemoveStaleTrackSurfaceKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtTimeStaleTrackLostContactAirKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtTimeStaleTrackLostContactESMKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtTimeStaleTrackLostContactSonarKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtTimeStaleTrackLostContactSubsurfaceKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.medtTimeStaleTrackLostContactSurfaceKeyPress( Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.edtAutoGunInterceptRangeKeyPress( Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtAutoGunInterceptRange.Text);
    edtAutoGunInterceptRange.Text := FormatFloat('0.00', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtAutoGunThresholdSpeedKeyPress( Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtAutoGunThresholdSpeed.Text);
    edtAutoGunThresholdSpeed.Text := FormatFloat('0.00', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtChaffAltitudeThresholdKeyPress( Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtChaffAltitudeThreshold.Text);
    edtChaffAltitudeThreshold.Text := FormatFloat('0.#', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.edtClutterReductionKeyPress(Sender: TObject;   var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtClutterReduction.Text);
    edtClutterReduction.Text := FormatFloat('0.#', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtDetectionHFKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtDetectionHF.Text);
    edtDetectionHF.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtDetectionKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToInt(edtDetection.Text);

    if value > 100 then
      value := 100;

    trckbrDetection.Position := value;
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtDetectionUHFKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtDetectionUHF.Text);
    edtDetectionUHF.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtESMBearingErrorRateKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtESMBearingErrorRate.Text);
    edtESMBearingErrorRate.Text := FormatFloat('', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtIdentificationKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToInt(edtIdentification.Text);

    if value > 100 then
      value := 100;

    trckbrIdentification.Position := value;
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxEOClassKeyPress(Sender: TObject; var Key: Char);
var
  maxRadar, maxSonar, maxSonobuoy, maxEO, maxESM, maxMAD, maxFittedWeapon,
  maxPointEffect : Integer;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    maxRadar := StrToInt(edtMaxRadarClass.Text);
    maxSonar := StrToInt(edtMaxSonarClass.Text);
    maxSonobuoy := StrToInt(edtMaxSonobuoyClass.Text);
    maxEO := StrToInt(edtMaxEOClass.Text);
    maxESM := StrToInt(edtMaxESMClass.Text);
    maxMAD := StrToInt(edtMaxMADClass.Text);
    maxFittedWeapon := StrToInt(edtMaxFittedWeaponClass.Text);
    maxPointEffect := StrToInt(edtMaxPointEffectWeaponClass.Text);

    edtTotalClassAllocationMax.Text := IntToStr(maxRadar + maxSonar +
      maxSonobuoy + maxEO + maxESM + maxMAD + maxFittedWeapon + maxPointEffect);

    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxESMClassKeyPress(Sender: TObject; var Key: Char);
var
  maxRadar, maxSonar, maxSonobuoy, maxEO, maxESM, maxMAD, maxFittedWeapon,
  maxPointEffect : Integer;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    maxRadar := StrToInt(edtMaxRadarClass.Text);
    maxSonar := StrToInt(edtMaxSonarClass.Text);
    maxSonobuoy := StrToInt(edtMaxSonobuoyClass.Text);
    maxEO := StrToInt(edtMaxEOClass.Text);
    maxESM := StrToInt(edtMaxESMClass.Text);
    maxMAD := StrToInt(edtMaxMADClass.Text);
    maxFittedWeapon := StrToInt(edtMaxFittedWeaponClass.Text);
    maxPointEffect := StrToInt(edtMaxPointEffectWeaponClass.Text);

    edtTotalClassAllocationMax.Text := IntToStr(maxRadar + maxSonar +
      maxSonobuoy + maxEO + maxESM + maxMAD + maxFittedWeapon + maxPointEffect);

    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxFittedWeaponClassKeyPress( Sender: TObject; var Key: Char);
var
  maxRadar, maxSonar, maxSonobuoy, maxEO, maxESM, maxMAD, maxFittedWeapon,
  maxPointEffect : Integer;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    maxRadar := StrToInt(edtMaxRadarClass.Text);
    maxSonar := StrToInt(edtMaxSonarClass.Text);
    maxSonobuoy := StrToInt(edtMaxSonobuoyClass.Text);
    maxEO := StrToInt(edtMaxEOClass.Text);
    maxESM := StrToInt(edtMaxESMClass.Text);
    maxMAD := StrToInt(edtMaxMADClass.Text);
    maxFittedWeapon := StrToInt(edtMaxFittedWeaponClass.Text);
    maxPointEffect := StrToInt(edtMaxPointEffectWeaponClass.Text);

    edtTotalClassAllocationMax.Text := IntToStr(maxRadar + maxSonar +
      maxSonobuoy + maxEO + maxESM + maxMAD + maxFittedWeapon + maxPointEffect);

    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxIFFRangeKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtMaxIFFRange.Text);
    edtMaxIFFRange.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxMADClassKeyPress(Sender: TObject; var Key: Char);
var
  maxRadar, maxSonar, maxSonobuoy, maxEO, maxESM, maxMAD, maxFittedWeapon,
  maxPointEffect : Integer;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    maxRadar := StrToInt(edtMaxRadarClass.Text);
    maxSonar := StrToInt(edtMaxSonarClass.Text);
    maxSonobuoy := StrToInt(edtMaxSonobuoyClass.Text);
    maxEO := StrToInt(edtMaxEOClass.Text);
    maxESM := StrToInt(edtMaxESMClass.Text);
    maxMAD := StrToInt(edtMaxMADClass.Text);
    maxFittedWeapon := StrToInt(edtMaxFittedWeaponClass.Text);
    maxPointEffect := StrToInt(edtMaxPointEffectWeaponClass.Text);

    edtTotalClassAllocationMax.Text := IntToStr(maxRadar + maxSonar +
      maxSonobuoy + maxEO + maxESM + maxMAD + maxFittedWeapon + maxPointEffect);

    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxNumAirKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#48 .. #57, #8, #13]) then
  begin
    Key := #0;
    Exit;
  end;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.edtMaxNumSurfaceKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#48 .. #57, #8, #13]) then
  begin
    Key := #0;
    Exit;
  end;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.edtMaxPointEffectWeaponClassKeyPress( Sender: TObject; var Key: Char);
var
  maxRadar, maxSonar, maxSonobuoy, maxEO, maxESM, maxMAD, maxFittedWeapon,
  maxPointEffect : Integer;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    maxRadar := StrToInt(edtMaxRadarClass.Text);
    maxSonar := StrToInt(edtMaxSonarClass.Text);
    maxSonobuoy := StrToInt(edtMaxSonobuoyClass.Text);
    maxEO := StrToInt(edtMaxEOClass.Text);
    maxESM := StrToInt(edtMaxESMClass.Text);
    maxMAD := StrToInt(edtMaxMADClass.Text);
    maxFittedWeapon := StrToInt(edtMaxFittedWeaponClass.Text);
    maxPointEffect := StrToInt(edtMaxPointEffectWeaponClass.Text);

    edtTotalClassAllocationMax.Text := IntToStr(maxRadar + maxSonar +
      maxSonobuoy + maxEO + maxESM + maxMAD + maxFittedWeapon + maxPointEffect);

    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxRadarClassKeyPress(Sender: TObject; var Key: Char);
var
  maxRadar, maxSonar, maxSonobuoy, maxEO, maxESM, maxMAD, maxFittedWeapon,
  maxPointEffect : Integer;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    maxRadar := StrToInt(edtMaxRadarClass.Text);
    maxSonar := StrToInt(edtMaxSonarClass.Text);
    maxSonobuoy := StrToInt(edtMaxSonobuoyClass.Text);
    maxEO := StrToInt(edtMaxEOClass.Text);
    maxESM := StrToInt(edtMaxESMClass.Text);
    maxMAD := StrToInt(edtMaxMADClass.Text);
    maxFittedWeapon := StrToInt(edtMaxFittedWeaponClass.Text);
    maxPointEffect := StrToInt(edtMaxPointEffectWeaponClass.Text);

    edtTotalClassAllocationMax.Text := IntToStr(maxRadar + maxSonar +
      maxSonobuoy + maxEO + maxESM + maxMAD + maxFittedWeapon + maxPointEffect);

    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxRangeHFKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value :=  StrToFloat(edtMaxRangeHF.Text);
    edtMaxRangeHF.Text := FormatFloat('0.00', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxRangeUHFKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value :=  StrToFloat(edtMaxRangeUHF.Text);
    edtMaxRangeUHF.Text := FormatFloat('0.00', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxRangeUnderwaterTelephoneKeyPress( Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value :=  StrToFloat(edtMaxRangeUnderwaterTelephone.Text);
    edtMaxRangeUnderwaterTelephone.Text := FormatFloat('0.00', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxSonarClassKeyPress(Sender: TObject; var Key: Char);
var
  maxRadar, maxSonar, maxSonobuoy, maxEO, maxESM, maxMAD, maxFittedWeapon,
  maxPointEffect : Integer;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    maxRadar := StrToInt(edtMaxRadarClass.Text);
    maxSonar := StrToInt(edtMaxSonarClass.Text);
    maxSonobuoy := StrToInt(edtMaxSonobuoyClass.Text);
    maxEO := StrToInt(edtMaxEOClass.Text);
    maxESM := StrToInt(edtMaxESMClass.Text);
    maxMAD := StrToInt(edtMaxMADClass.Text);
    maxFittedWeapon := StrToInt(edtMaxFittedWeaponClass.Text);
    maxPointEffect := StrToInt(edtMaxPointEffectWeaponClass.Text);

    edtTotalClassAllocationMax.Text := IntToStr(maxRadar + maxSonar +
      maxSonobuoy + maxEO + maxESM + maxMAD + maxFittedWeapon + maxPointEffect);

    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMaxSonobuoyClassKeyPress(Sender: TObject; var Key: Char);
var
  maxRadar, maxSonar, maxSonobuoy, maxEO, maxESM, maxMAD, maxFittedWeapon,
  maxPointEffect : Integer;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    maxRadar := StrToInt(edtMaxRadarClass.Text);
    maxSonar := StrToInt(edtMaxSonarClass.Text);
    maxSonobuoy := StrToInt(edtMaxSonobuoyClass.Text);
    maxEO := StrToInt(edtMaxEOClass.Text);
    maxESM := StrToInt(edtMaxESMClass.Text);
    maxMAD := StrToInt(edtMaxMADClass.Text);
    maxFittedWeapon := StrToInt(edtMaxFittedWeaponClass.Text);
    maxPointEffect := StrToInt(edtMaxPointEffectWeaponClass.Text);

    edtTotalClassAllocationMax.Text := IntToStr(maxRadar + maxSonar +
      maxSonobuoy + maxEO + maxESM + maxMAD + maxFittedWeapon + maxPointEffect);

    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMissileHAFOMaxRangeKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtMissileHAFOMaxRange.Text);
    edtMissileHAFOMaxRange.Text := FormatFloat('0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtMissileHAFOMinRangeKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtMissileHAFOMinRange.Text);
    edtMissileHAFOMinRange.Text := FormatFloat('0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtNameKeyPress(Sender: TObject; var Key: Char);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.edtProbabilityDecreaseRateKeyPress( Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtProbabilityDecreaseRate.Text);
    edtProbabilityDecreaseRate.Text := FormatFloat('0.00', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtProbabilityModifierKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtProbabilityModifier.Text);
    edtProbabilityModifier.Text := FormatFloat('', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtSampleRateAirKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#48 .. #57, #8, #13]) then
  begin
    Key := #0;
    Exit;
  end;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.edtSampleRateSurfaceKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#48 .. #57, #8, #13]) then
  begin
    Key := #0;
    Exit;
  end;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryGameDefault.edtSeductionBloomAltitudeKeyPress( Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtSeductionBloomAltitude.Text);
    edtSeductionBloomAltitude.Text := FormatFloat('0.#', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtSeductionBloomRangeKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtSeductionBloomRange.Text);
    edtSeductionBloomRange.Text := FormatFloat('0.00', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtSinuationAmplitudeKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtSeductionBloomAltitude.Text);
    edtSeductionBloomAltitude.Text := FormatFloat('0.#', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtSinuationPeriodKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtSinuationPeriod.Text);
    edtSinuationPeriod.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtSonarTMABearingKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtSonarTMAMaxCourseError.Text);
    edtSonarTMAMaxCourseError.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtSonarTMAMaxCourseErrorKeyPress( Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToInt(edtSonarTMAMaxSpeedError.Text);
    trckbrSonarTMAMaxSpeedError.Position := value;
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtSonarTMAMaxSpeedErrorKeyPress( Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToInt(edtSonarTMAMaxSpeedError.Text);
    trckbrSonarTMAMaxSpeedError.Position := value;
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtSonarTMASeductionKeyPress(Sender: TObject;   var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtSonarTMASeduction.Text);
    edtSonarTMASeduction.Text := FormatFloat('0.00', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtVisualCrossSectionKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtVisualCrossSection.Text);
    edtVisualCrossSection.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtVisualDetectRangeKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtVisualDetectRange.Text);
    edtVisualDetectRange.Text := FormatFloat('0.00', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtVisualMaxRangeKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtVisualMaxRange.Text);
    edtVisualMaxRange.Text := FormatFloat('0.00', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtZigzagLongAmplitudeKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtZigZagLongAmplitude.Text);
    edtZigZagLongAmplitude.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtZigzagLongPeriodKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtZigZagLongPeriod.Text);
    edtZigZagLongPeriod.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtZigzagShortAmplitudeKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtZigZagShortAmplitude.Text);
    edtZigZagShortAmplitude.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtZigzagShortPeriodKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtZigZagShortPeriod.Text);
    edtZigZagShortPeriod.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtZigzagVeryLongAmplitudeKeyPress(Sender: TObject;var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtZigZagVeryLongAmplitude.Text);
    edtZigZagVeryLongAmplitude.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryGameDefault.edtZigzagVeryLongPeriodKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToFloat(edtZigZagVeryLongPeriod.Text);
    edtZigZagVeryLongPeriod.Text := FormatFloat('0.0', value);
    btnApply.Enabled := True;
  end;
end;

end.
