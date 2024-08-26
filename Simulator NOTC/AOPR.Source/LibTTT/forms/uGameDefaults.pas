unit uGameDefaults;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uDBGame_Defaults;

type
  TfGameDefault = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtName: TEdit;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    ts5: TTabSheet;
    ts6: TTabSheet;
    ts7: TTabSheet;
    grp1: TGroupBox;
    grp2: TGroupBox;
    btnEditRadarRainfallRate: TButton;
    btnEditRadarCloudCover: TButton;
    btnEditRadarSeaState: TButton;
    btnEditESMCloud: TButton;
    btnEditESMRainfall: TButton;
    grp3: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    trckbrDetection: TTrackBar;
    trckbrIdentification: TTrackBar;
    edtVisualFactorDetection: TEdit;
    edtVisualFactorIdentification: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    grp4: TGroupBox;
    grp5: TGroupBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtVisualCrossSection: TEdit;
    edtVisualDetection: TEdit;
    edtVisualMaxRange: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    edtChaffSeductionAltitude: TEdit;
    edtChaffAltitude: TEdit;
    edtChaffSeductionRange: TEdit;
    grp6: TGroupBox;
    lbl12: TLabel;
    edtAutogunInterception: TEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    edtAutogunThreshold: TEdit;
    lbl21: TLabel;
    grp7: TGroupBox;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    edtMissileMinRange: TEdit;
    edtMissileReacquisition: TEdit;
    edtMissileMaxRange: TEdit;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    grp8: TGroupBox;
    lbl28: TLabel;
    edtDefensiveInterval: TEdit;
    lbl29: TLabel;
    pnl2: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOk: TButton;
    btnSaveAsTrainer: TButton;
    grp9: TGroupBox;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    grp10: TGroupBox;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    edtProbabilityDecreaseRate: TEdit;
    edtProbabilityRadiusDelay: TEdit;
    edtProbabilityModifier: TEdit;
    lbl34: TLabel;
    lbl35: TLabel;
    grp11: TGroupBox;
    lbl36: TLabel;
    lbl37: TLabel;
    edtMineTimeInterval: TEdit;
    grp12: TGroupBox;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    edtSonarTMABearing: TEdit;
    edtSonarTMASeduction: TEdit;
    edtSonarTMAMaxCauseEror: TEdit;
    lbl43: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    trckbrSonarMaxSpeedEror: TTrackBar;
    edtSonarTMAMaxSpeedEror: TEdit;
    lbl46: TLabel;
    lbl47: TLabel;
    grp13: TGroupBox;
    lbl48: TLabel;
    lbl49: TLabel;
    lbl50: TLabel;
    lbl51: TLabel;
    lbl52: TLabel;
    edtMakeStaleSurface: TEdit;
    edtMakeStaleAir: TEdit;
    edtMakeStaleSubsurface: TEdit;
    lbl53: TLabel;
    lbl54: TLabel;
    lbl55: TLabel;
    edtMakeStaleESM: TEdit;
    edtMakeStaleSonar: TEdit;
    lbl56: TLabel;
    lbl57: TLabel;
    grp14: TGroupBox;
    lbl58: TLabel;
    lbl59: TLabel;
    lbl60: TLabel;
    lbl61: TLabel;
    lbl62: TLabel;
    lbl63: TLabel;
    lbl64: TLabel;
    lbl65: TLabel;
    lbl66: TLabel;
    lbl67: TLabel;
    edtRemoveStaleSurface: TEdit;
    edtRemoveStaleAir: TEdit;
    edtRemoveStaleSubsurface: TEdit;
    edtRemoveStaleESM: TEdit;
    edtRemoveStaleSonar: TEdit;
    grp15: TGroupBox;
    lbl68: TLabel;
    lbl69: TLabel;
    lbl71: TLabel;
    lbl72: TLabel;
    edtSampleRateSurface: TEdit;
    edtSampleRateAir: TEdit;
    grp16: TGroupBox;
    lbl70: TLabel;
    lbl73: TLabel;
    lbl74: TLabel;
    lbl75: TLabel;
    edtMaxNumSurface: TEdit;
    edtMaxNumAir: TEdit;
    grp17: TGroupBox;
    lbl76: TLabel;
    lbl77: TLabel;
    lbl78: TLabel;
    lbl79: TLabel;
    lbl80: TLabel;
    lbl84: TLabel;
    edtGuideOutrun: TEdit;
    edtGuideEngangement: TEdit;
    edtGuideShadow: TEdit;
    lbl81: TLabel;
    lbl82: TLabel;
    edtClutterReduction: TEdit;
    grp18: TGroupBox;
    lbl83: TLabel;
    lbl85: TLabel;
    lbl86: TLabel;
    lbl87: TLabel;
    edtGuidanceSinuationAmplitude: TEdit;
    edtGuidanceSinuationPeriod: TEdit;
    lbl88: TLabel;
    grp19: TGroupBox;
    lbl89: TLabel;
    lbl90: TLabel;
    lbl91: TLabel;
    lbl92: TLabel;
    edtZigzagShortAmplitude: TEdit;
    edtZigzagShortPeriod: TEdit;
    grp20: TGroupBox;
    lbl93: TLabel;
    lbl94: TLabel;
    lbl95: TLabel;
    lbl96: TLabel;
    edtZigzagLongAmplitude: TEdit;
    edtZigzagLongPeriod: TEdit;
    grp21: TGroupBox;
    lbl97: TLabel;
    lbl98: TLabel;
    lbl99: TLabel;
    lbl100: TLabel;
    edtZigzagVeryLongAmplitude: TEdit;
    edtZigzagVeryLongPeriod: TEdit;
    grp22: TGroupBox;
    lbl101: TLabel;
    lbl104: TLabel;
    edtDetectionUHF: TEdit;
    edtDetectionHF: TEdit;
    lbl103: TLabel;
    lbl106: TLabel;
    edtESMBEaring: TEdit;
    lbl102: TLabel;
    lbl105: TLabel;
    lbl107: TLabel;
    lbl108: TLabel;
    edtESMMaxIFF: TEdit;
    grp23: TGroupBox;
    btnEditESM: TButton;
    grp24: TGroupBox;
    lbl109: TLabel;
    lbl110: TLabel;
    lbl111: TLabel;
    lbl112: TLabel;
    lbl113: TLabel;
    lbl114: TLabel;
    lbl116: TLabel;
    lbl117: TLabel;
    edtMHSImmediate: TEdit;
    edtMHSFlash: TEdit;
    edtMHSPriority: TEdit;
    edtMHSRoutine: TEdit;
    grp25: TGroupBox;
    lbl115: TLabel;
    lbl118: TLabel;
    lbl119: TLabel;
    lbl120: TLabel;
    lbl121: TLabel;
    lbl124: TLabel;
    edtMaxRangeHF: TEdit;
    edtMaxRangeUnderwater: TEdit;
    edtMaxRangeUHF: TEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure getData;
    procedure trckbrDetectionChange(Sender: TObject);
    procedure trckbrIdentificationChange(Sender: TObject);
    procedure trckbrSonarMaxSpeedErorChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure Definition;
  private
    { Private declarations }
  public
    { Public declarations }
    game_default : TGame_Defaults;
    isNew        : Boolean;
    mList        : TList;

  end;

var
  fGameDefault: TfGameDefault;

implementation

{$R *.dfm}
uses uDataModuleTTT,uOtherSingleList, uGameDefaultSelect, ufDBEDitor;

procedure TfGameDefault.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    getData;
    dmTTT.insertGame_Defaults(game_default);
  end
  else
  begin
    getData;
    dmTTT.updateGame_Defaults(game_default,IntToStr(game_default.FData.Defaults_Index));
  end;
  Close;
end;

procedure TfGameDefault.getData;
begin
  with game_default.FData do begin
    Defaults_Identifier := edtName.Text;
    Init_AOP            := StrToInt(edtProbabilityRadiusDelay.Text);
    AOP_Decrease_Rate   := StrToFloat(edtProbabilityDecreaseRate.Text);
   { Sono_Num_2_Initiate := ;
    Trans_Range_2_Air   := ;
    Trans_Range_2_Sur   := ; }
    Init_AOP_Modifier   := StrToFloat(edtProbabilityModifier.Text);
    Visual_Detect_Range := StrToFloat(edtVisualDetection.Text);
    Known_Cross_Section := StrToFloat(edtVisualCrossSection.Text);
    Max_Visual_Range    := StrToFloat(edtVisualMaxRange.Text);
   // EO_Detection_Factor := StrToFloat(edtProbabilityModifier.Text);
    Visual_Detection_Factor := StrToFloat(edtVisualFactorDetection.Text);
  //  EO_Ident_Factor         := ;
    Visual_Ident_Factor     := StrToFloat(edtVisualFactorIdentification.Text);
    Sine_Period_Distance    := StrToFloat(edtGuidanceSinuationPeriod.Text);
    Sine_Period_Amplitude   := StrToFloat(edtGuidanceSinuationAmplitude.Text);
    Short_Period_Distance   := StrToInt(edtZigzagShortPeriod.Text);
    Short_Period_Amplitude  := StrToInt(edtZigzagShortAmplitude.Text);
    Long_Period_Distance    := StrToInt(edtZigzagLongPeriod.Text);
    Long_Period_Amplitude   := StrToInt(edtZigzagLongAmplitude.Text);
    Very_Period_Distance    := StrToInt(edtZigzagVeryLongPeriod.Text);
    Very_Period_Amplitude   := StrToInt(edtZigzagVeryLongAmplitude.Text);
   { Air_Lost_Time           := ;
    Sur_Lost_Time           := ;
    Sub_Lost_Time           := ;
    ESM_Bearing_Lost_Time   := ;
    Sonar_Bearing_Lost_Time := ;  }
    Stale_Air_Time          := StrToInt(edtMakeStaleAir.Text);
    Stale_Sur_Time          := StrToInt(edtMakeStaleSurface.Text);
    Stale_Sub_Time          := StrToInt(edtMakeStaleSubsurface.Text);
    Stale_ESM_Bearing_Time  := StrToInt(edtMakeStaleESM.Text);
    Stale_Sonar_Bearing_Time := StrToInt(edtMakeStaleSonar.Text);
    POD_Check_Time           := StrToInt(edtMineTimeInterval.Text);
    TMA_Range_Rate           := StrToFloat(edtSonarTMASeduction.Text);
   { Frequency_Identity_Weighting    := ;
    PRF_Identity_Weighting          := ;
    Pulsewidth_Identity_Weighting   := ;
    Scan_Period_Identity_Weighting  := ;
    Crew_Eff_Heading_Error := ;
    Crew_Eff_Speed_Error := ;       }
    TMA_Relative_Bearing_Rate       := StrToFloat(edtSonarTMABearing.Text);
    Passive_Sonar_Max_Course_Error  := StrToFloat(edtSonarTMAMaxCauseEror.Text);
    Passive_Sonar_Max_Speed_Error   := StrToFloat(edtSonarTMAMaxSpeedEror.Text);
    ESM_Error_Corr_Rate             := StrToFloat(edtESMBEaring.Text);
    Chaff_Altitude_Threshold        := StrToFloat(edtChaffAltitude.Text);
    MHS_Flash_Delay_Time            := StrToFloat(edtMHSFlash.Text);
    MHS_Immed_Delay_Time            := StrToFloat(edtMHSImmediate.Text);
    MHS_Priority_Delay_Time         := StrToFloat(edtMHSPriority.Text);
    MHS_Routine_Delay_Time          := StrToFloat(edtMHSRoutine.Text);
    Max_UWT_Range                   := StrToFloat(edtMaxRangeUnderwater.Text);
    Max_HF_Detect_Range             := StrToFloat(edtMaxRangeHF.Text);
    Max_UHF_Detect_Range            := StrToFloat(edtMaxRangeUHF.Text);
    Max_IFF_Range                   := StrToFloat(edtESMMaxIFF.Text);
    Track_History_Air_Sample_Rate   := StrToInt(edtSampleRateAir.Text);
    Track_History_Air_Max_Points    := StrToInt(edtMaxNumAir.Text);
    Track_History_Sample_Rate       := StrToInt(edtSampleRateSurface.Text);
    Track_History_Max_Points        := StrToInt(edtMaxNumSurface.Text);
    Auto_Gun_Interception_Range     := StrToFloat(edtAutogunInterception.Text);
    Auto_Gun_Threshold_Speed        := StrToFloat(edtAutogunThreshold.Text);
    Clutter_Reduction_Scale         := StrToFloat(edtClutterReduction.Text);
    Jam_Break_Lock_Time_Interval    := StrToInt(edtDefensiveInterval.Text);
    Missile_Reacquisition_Time      := StrToInt(edtMissileReacquisition.Text);
    Seduction_Bloom_Altitude        := StrToInt(edtChaffSeductionAltitude.Text);
    Seduction_Bloom_Range           := StrToFloat(edtChaffSeductionRange.Text);
    HF_Datalink_MHS_Trans_Freq      := StrToFloat(edtDetectionHF.Text);
    UHF_Datalink_MHS_Trans_Freq     := StrToFloat(edtDetectionUHF.Text);
   { Max_Num_Radar_Classes           := ;
    Max_Num_Sonar_Classes           := ;
    Max_Num_Sonobuoy_Classes        := ;
    Max_Num_EO_Classes              := ;
    Max_Num_ESM_Classes             := ;
    Max_Num_MAD_Classes             := ;
    Max_Num_Fitted_Weap_Classes     := ;
    Max_Num_Point_Effect_Classes    := ;
    HAFO_Min_Range                  := ;
    HAFO_Max_Range                  := ;  }
    Engage_Guide_Stale_Target_Time  := StrToInt(edtGuideEngangement.Text);
    Outrun_Guide_Stale_Target_Time  := StrToInt(edtGuideOutrun.Text) ;
    Shadow_Guide_Stale_Target_Time  := StrToInt(edtGuideShadow.Text);
  { Sonobuoy_Air_Deceleration       := StrToFloat(edt.Text);
    Sonobuoy_Air_Descent_Rate       := StrToFloat(edtChaffAltitude.Text);
    Depth_Charge_Air_Deceleration   := StrToFloat(edtChaffAltitude.Text);
    Depth_Charge_Air_Descent_Rate   := StrToFloat(edtChaffAltitude.Text);
    Missile_Sea_Check_Interval      := StrToFloat(edtMis.Text);          }
  end;
end;

procedure TfGameDefault.trckbrDetectionChange(Sender: TObject);
begin
  edtVisualFactorDetection.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfGameDefault.trckbrIdentificationChange(Sender: TObject);
begin
  edtVisualFactorIdentification.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfGameDefault.trckbrSonarMaxSpeedErorChange(Sender: TObject);
begin
  edtSonarTMAMaxSpeedEror.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfGameDefault.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfGameDefault.btnOkClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TfGameDefault.FormCreate(Sender: TObject);
begin
  game_default := TGame_Defaults.Create;
  mList        := TList.Create;
end;

procedure TfGameDefault.Definition;
var i:integer;
begin
  for I := 0 to mList.Count - 1 do
  begin
    with game_default.FData do begin
     edtName.Text                       := TGame_Defaults(mList[i]).FData.Defaults_Identifier;
     edtVisualFactorDetection.Text      := FloatToStr(TGame_Defaults(mList[i]).FData.Visual_Detection_Factor);
     edtVisualFactorIdentification.Text := FloatToStr(TGame_Defaults(mList[i]).FData.Visual_Ident_Factor);
     edtVisualCrossSection.Text         := FloatToStr(TGame_Defaults(mList[i]).FData.Known_Cross_Section);
     edtVisualDetection.Text            := FloatToStr(TGame_Defaults(mList[i]).FData.Visual_Detect_Range);
     edtVisualMaxRange.Text             := FloatToStr(TGame_Defaults(mList[i]).FData.Max_Visual_Range);
     edtChaffSeductionAltitude.Text     := IntToStr(TGame_Defaults(mList[i]).FData.Seduction_Bloom_Altitude);
     edtChaffAltitude.Text              := FloatToStr(TGame_Defaults(mList[i]).FData.Chaff_Altitude_Threshold);
     edtChaffSeductionRange.Text        := FloatToStr(TGame_Defaults(mList[i]).FData.Seduction_Bloom_Range);
     edtAutogunInterception.Text        := FloatToStr(TGame_Defaults(mList[i]).FData.Auto_Gun_Interception_Range);
     edtAutogunThreshold.Text           := FloatToStr(TGame_Defaults(mList[i]).FData.Auto_Gun_Threshold_Speed);
//      edtMissileMinRange.Text            := IntToStr(TGame_Defaults(mList[i]).FData.);
     edtMissileReacquisition.Text       := IntToStr(TGame_Defaults(mList[i]).FData.Missile_Reacquisition_Time);
//       edtMissileMaxRange.Text            := FloatToStr(TGame_Defaults(mList[i]).FData.
     edtDefensiveInterval.Text          := IntToStr(TGame_Defaults(mList[i]).FData.Jam_Break_Lock_Time_Interval);
     edtProbabilityDecreaseRate.Text    := FloatToStr(TGame_Defaults(mList[i]).FData.AOP_Decrease_Rate);
     edtProbabilityRadiusDelay.Text     := IntToStr(TGame_Defaults(mList[i]).FData.Init_AOP);
     edtProbabilityModifier.Text        := FloatToStr(TGame_Defaults(mList[i]).FData.Init_AOP_Modifier);
     edtMineTimeInterval.Text           := IntToStr(TGame_Defaults(mList[i]).FData.POD_Check_Time);
     edtSonarTMABearing.Text            := FloatToStr(TGame_Defaults(mList[i]).FData.TMA_Relative_Bearing_Rate);
     edtSonarTMASeduction.Text          := FloatToStr(TGame_Defaults(mList[i]).FData.TMA_Range_Rate);
     edtSonarTMAMaxCauseEror.Text       := FloatToStr(TGame_Defaults(mList[i]).FData.Passive_Sonar_Max_Course_Error);
     edtSonarTMAMaxSpeedEror.Text       := FloatToStr(TGame_Defaults(mList[i]).FData.Passive_Sonar_Max_Speed_Error);
     edtMakeStaleSurface.Text           := IntToStr(TGame_Defaults(mList[i]).FData.Stale_Sur_Time);
     edtMakeStaleAir.Text               := IntToStr(TGame_Defaults(mList[i]).FData.Stale_Air_Time);
     edtMakeStaleSubsurface.Text        := IntToStr(TGame_Defaults(mList[i]).FData.Stale_Sub_Time);
     edtMakeStaleESM.Text               := IntToStr(TGame_Defaults(mList[i]).FData.Stale_ESM_Bearing_Time);
     edtMakeStaleSonar.Text             := IntToStr(TGame_Defaults(mList[i]).FData.Stale_Sonar_Bearing_Time);
{       edtRemoveStaleSurface.Text         := FloatToStr(TGame_Defaults(mList[i]).FData.
     edtRemoveStaleAir.Text             := FloatToStr(TGame_Defaults(mList[i]).FData.
     edtRemoveStaleSubsurface.Text      := FloatToStr(TGame_Defaults(mList[i]).FData.
     edtRemoveStaleESM.Text             := FloatToStr(TGame_Defaults(mList[i]).FData.
     edtRemoveStaleSonar.Text           := FloatToStr(TGame_Defaults(mList[i]).FData.}
     edtSampleRateSurface.Text          := IntToStr(TGame_Defaults(mList[i]).FData.Track_History_Sample_Rate);
     edtSampleRateAir.Text              := IntToStr(TGame_Defaults(mList[i]).FData.Track_History_Air_Sample_Rate);
     edtMaxNumSurface.Text              := IntToStr(TGame_Defaults(mList[i]).FData.Track_History_Max_Points);
     edtMaxNumAir.Text                  := IntToStr(TGame_Defaults(mList[i]).FData.Track_History_Air_Max_Points);
     edtMaxRangeHF.Text                 := FloatToStr(TGame_Defaults(mList[i]).FData.Max_HF_Detect_Range);
     edtMaxRangeUnderwater.Text         := FloatToStr(TGame_Defaults(mList[i]).FData.Max_UWT_Range);
     edtMaxRangeUHF.Text                := FloatToStr(TGame_Defaults(mList[i]).FData.Max_UHF_Detect_Range);
     edtGuideOutrun.Text                := IntToStr(TGame_Defaults(mList[i]).FData.Outrun_Guide_Stale_Target_Time);
     edtGuideEngangement.Text           := IntToStr(TGame_Defaults(mList[i]).FData.Engage_Guide_Stale_Target_Time);
     edtGuideShadow.Text                := IntToStr(TGame_Defaults(mList[i]).FData.Shadow_Guide_Stale_Target_Time);
     edtClutterReduction.Text           := FloatToStr(TGame_Defaults(mList[i]).FData.Clutter_Reduction_Scale);
     edtGuidanceSinuationAmplitude.Text := FloatToStr(TGame_Defaults(mList[i]).FData.Sine_Period_Amplitude);
     edtGuidanceSinuationPeriod.Text    := FloatToStr(TGame_Defaults(mList[i]).FData.Sine_Period_Distance);
     edtZigzagShortAmplitude.Text       := FloatToStr(TGame_Defaults(mList[i]).FData.Short_Period_Amplitude);
     edtZigzagShortPeriod.Text          := FloatToStr(TGame_Defaults(mList[i]).FData.Short_Period_Distance);
     edtZigzagLongAmplitude.Text        := FloatToStr(TGame_Defaults(mList[i]).FData.Long_Period_Amplitude);
     edtZigzagLongPeriod.Text           := FloatToStr(TGame_Defaults(mList[i]).FData.Long_Period_Distance);
     edtZigzagVeryLongAmplitude.Text    := FloatToStr(TGame_Defaults(mList[i]).FData.Very_Period_Amplitude);
     edtZigzagVeryLongPeriod.Text       := FloatToStr(TGame_Defaults(mList[i]).FData.Very_Period_Distance);
     edtDetectionUHF.Text               := FloatToStr(TGame_Defaults(mList[i]).FData.UHF_Datalink_MHS_Trans_Freq);
     edtDetectionHF.Text                := FloatToStr(TGame_Defaults(mList[i]).FData.HF_Datalink_MHS_Trans_Freq);
     edtESMBEaring.Text                 := FloatToStr(TGame_Defaults(mList[i]).FData.ESM_Error_Corr_Rate);
     edtESMMaxIFF.Text                  := FloatToStr(TGame_Defaults(mList[i]).FData.Max_IFF_Range);
     edtMHSImmediate.Text               := FloatToStr(TGame_Defaults(mList[i]).FData.MHS_Immed_Delay_Time);
     edtMHSFlash.Text                   := FloatToStr(TGame_Defaults(mList[i]).FData.MHS_Flash_Delay_Time);
     edtMHSRoutine.Text                 := FloatToStr(TGame_Defaults(mList[i]).FData.MHS_Routine_Delay_Time);
     edtMHSPriority.Text                := FloatToStr(TGame_Defaults(mList[i]).FData.MHS_Priority_Delay_Time);

    end;
  end;

end;

end.
