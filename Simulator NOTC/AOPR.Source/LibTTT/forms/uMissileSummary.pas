unit uMissileSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, uDBAsset_Weapon;

type
  TfMissileSummary = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtClassMissile: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Physical: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    grbCapabilities: TGroupBox;
    grbHomeOnJammer: TGroupBox;
    grbLaunchSettingGeneral: TGroupBox;
    grbHybridTorpedo: TGroupBox;
    grbLethality: TGroupBox;
    cbxAntiAir: TCheckBox;
    cbxAntiSurface: TCheckBox;
    cbxAntiSubsurface: TCheckBox;
    cbxAntiLand: TCheckBox;
    cbxTypeA: TCheckBox;
    cbxTypeB: TCheckBox;
    cbxTypeC: TCheckBox;
    lbl4: TLabel;
    lbl5: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    cbMethod: TComboBox;
    cbInitialCommanded: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbPrimaryTarget: TComboBox;
    cbDetectabilityType: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    cbMidCourse: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    edtMaxAltitude: TEdit;
    Label9: TLabel;
    edtHybridTorpedoDef: TEdit;
    sbbtnSearch: TSpeedButton;
    cbxHybridTorpedo: TCheckBox;
    edtLethality: TEdit;
    Label120: TLabel;
    Label119: TLabel;
    grbDamageSustainability: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edtDamage: TEdit;
    TrackBarDamage: TTrackBar;
    grbProbabilityOfHit: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    EditProbability: TEdit;
    TrackBarProbability: TTrackBar;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    grbDimensions: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edtLengthDimension: TEdit;
    edtWidthDimension: TEdit;
    edtHeightDimension: TEdit;
    edtEngagementRangeDimension: TEdit;
    edtMotionCharacteristic: TEdit;
    sbbtnsearchMotion: TSpeedButton;
    Label15: TLabel;
    Label14: TLabel;
    grbBoosterSeparation: TGroupBox;
    cbxBoosterSeparation: TCheckBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtRangeBooster: TEdit;
    edtBoxWeightBooster: TEdit;
    edtBoxHeightBooster: TEdit;
    Label35: TLabel;
    Bevel1: TBevel;
    Label36: TLabel;
    grbRadarPhysical: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    edtFrontRadarPhysical: TEdit;
    cbFrontRadarPhysical: TComboBox;
    edtSideRadarPhysical: TEdit;
    cbSideRadarPhysical: TComboBox;
    grbVisualPhysical: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    edtFrontVisualPhysical: TEdit;
    edtSideVisualPhysical: TEdit;
    grbInfraredPhysical: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    edtFrontInfraredPhysical: TEdit;
    edtSideInfraredPhysical: TEdit;
    grbMissile: TGroupBox;
    Label100: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label128: TLabel;
    edtAntiRadiationMissile: TEdit;
    edtInfraredMissile: TEdit;
    edtSARHMissile: TEdit;
    edtTARHMissile: TEdit;
    TrackBarAntiRadiationMissile: TTrackBar;
    TrackBarInfraredMissile: TTrackBar;
    TrackBarSARHMissile: TTrackBar;
    TrackBarTARHMissile: TTrackBar;
    grbLaunchSettingGuidance: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    cbPrimaryLaunchGuidance: TComboBox;
    cbSecondaryLaunchGuidance: TComboBox;
    Label51: TLabel;
    Label52: TLabel;
    cbPursuitLaunchGuidance: TComboBox;
    grbRangeGuidance: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label61: TLabel;
    edtMinRangeGuide: TEdit;
    edtMaxRangeGuide: TEdit;
    grbFlyGuidance: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label67: TLabel;
    edtRangeFlyGuide: TEdit;
    edtAltitudeFlyGuide: TEdit;
    cbxFlyOutRequired: TCheckBox;
    grbTerminalGuidance: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    edtStartRangeTerminalGuidance: TEdit;
    edtAltitudeTerminalGuidance: TEdit;
    Label71: TLabel;
    cbCapabilityTerminalGuidance: TComboBox;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    edtPeriodTerminalGuidance: TEdit;
    edtAmplitudeTerminalGuidance: TEdit;
    grbSeekerTurnOnGuidance: TGroupBox;
    Label79: TLabel;
    Label80: TLabel;
    Label84: TLabel;
    edtRangeSeekerTurnGuidance: TEdit;
    cbxRangeSeekerTurnGuidance: TCheckBox;
    grbSeekerDetectionEnvelopeGuidance: TGroupBox;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    edtRangeSeekerDetectionGuidance: TEdit;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    edtAzimuthSeekerDetectionGuidance: TEdit;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    edtElevationSeekerDetectionGuidance: TEdit;
    grbTerminalAcquisition: TGroupBox;
    Label91: TLabel;
    Label92: TLabel;
    Label96: TLabel;
    edtCommandAltitudeGuidance: TEdit;
    cbxTerminalAcqGuidance: TCheckBox;
    grbWaypointUser: TGroupBox;
    Label93: TLabel;
    Label95: TLabel;
    edtmaxNumWaypointGuidance: TEdit;
    cbxWaypointUserGuidance: TCheckBox;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    edtMinFinalWaypointGuidance: TEdit;
    Label94: TLabel;
    Label101: TLabel;
    edtMaxFiringGuidance: TEdit;
    Label102: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    edtDefaultCruiseGuidance: TEdit;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    cbPrimaryTARH: TComboBox;
    Label116: TLabel;
    Label117: TLabel;
    edtRangeTARH: TEdit;
    grbECM: TGroupBox;
    Label118: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    cbDetonationECMTARH: TComboBox;
    cbDetectionECMTARH: TComboBox;
    grnTerminalGuidanceTARH: TGroupBox;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    edtPulseRepTerminalTARH: TEdit;
    edtPulseWidthTerminalTARH: TEdit;
    edtScanRateTerminalTARH: TEdit;
    edtTransmitterPowerTerminalTARH: TEdit;
    Label141: TLabel;
    edtFreqTerminalTARH: TEdit;
    grbReceivedFreqTARH: TGroupBox;
    Label142: TLabel;
    Label143: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label156: TLabel;
    edtLowerLimitReceivedFreqTARH: TEdit;
    edtUpperLimitReceivedFreqTARH: TEdit;
    mmNotes: TMemo;
    TrackBarLethality: TTrackBar;
    lbl1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure TrackBarLethalityChange(Sender: TObject);
    procedure TrackBarDamageChange(Sender: TObject);
    procedure TrackBarProbabilityChange(Sender: TObject);
    procedure TrackBarAntiRadiationMissileChange(Sender: TObject);
    procedure TrackBarInfraredMissileChange(Sender: TObject);
    procedure TrackBarSARHMissileChange(Sender: TObject);
    procedure TrackBarTARHMissileChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure getData;
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbbtnSearchClick(Sender: TObject);
    procedure sbbtnsearchMotionClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Missile : TMissile_On_Board;
    isCopy,fromMissile  : Boolean;
  end;

var
  fMissileSummary: TfMissileSummary;

implementation

{$R *.dfm}

uses uDataModuleTTT,uWeaponSingleList, uTorpedoSelect, uMotionDoubleList;

procedure TfMissileSummary.btnApplyClick(Sender: TObject);
begin
  if fWeaponSingle.isNew then
  begin
    getData;
    dmTTT.insertMissile_Def(Missile);
    fWeaponSingle.isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateMissile_Def(Missile,IntToStr(Missile.FDef.Missile_Index));
  end;
end;

procedure TfMissileSummary.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfMissileSummary.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fWeaponSingle.refresh;
end;

procedure TfMissileSummary.FormCreate(Sender: TObject);
begin
  Missile := TMissile_On_Board.Create;
end;

procedure TfMissileSummary.TrackBarAntiRadiationMissileChange(Sender: TObject);
begin
  edtAntiRadiationMissile.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfMissileSummary.TrackBarDamageChange(Sender: TObject);
begin
  edtDamage.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfMissileSummary.TrackBarInfraredMissileChange(Sender: TObject);
begin
  edtInfraredMissile.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfMissileSummary.TrackBarLethalityChange(Sender: TObject);
begin
  edtLethality.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfMissileSummary.TrackBarProbabilityChange(Sender: TObject);
begin
  EditProbability.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfMissileSummary.TrackBarSARHMissileChange(Sender: TObject);
begin
  edtSARHMissile.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfMissileSummary.TrackBarTARHMissileChange(Sender: TObject);
begin
  edtTARHMissile.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfMissileSummary.getData;
begin

  with Missile.FDef do
  begin
    Class_Identifier      := edtClassMissile.Text;
   { Platform_Domain       := ;
    Platform_Category     := ;
    Platform_Type         := ;   }
    Max_Range             := StrToFloat(edtMaxRangeGuide.Text);
    Min_Range             := StrToFloat(edtMinRangeGuide.Text);
    if fMotionDouble.mId <> '' then
      Motion_Index          := StrToInt(fMotionDouble.mId)
    else
      Motion_Index        := Missile.FDef.Motion_Index;
    Seeker_TurnOn_Range   := StrToFloat(edtRangeSeekerTurnGuidance.Text);
   { Second_Seeker_Pattern_Capable := ;
    Seeker_Bias_Capable           := ;   }
    Lethality             := StrToInt(edtLethality.Text);
    Prob_of_Hit           := StrToFloat(EditProbability.Text);
    Damage_Capacity       := StrToInt(edtDamage.Text);
    Default_Altitude      := StrToFloat(edtDefaultCruiseGuidance.Text);
    Length                := StrToFloat(edtLengthDimension.Text);
    Width                 := StrToFloat(edtWidthDimension.Text);
    Height                := StrToFloat(edtHeightDimension.Text);
    Front_Radar_Cross     := StrToFloat(edtFrontRadarPhysical.Text);
    Side_Radar_Cross      := StrToFloat(edtSideRadarPhysical.Text);
    Front_Visual_Cross    := StrToFloat(edtFrontVisualPhysical.Text);
    Side_Visual_Cross     := StrToFloat(edtSideVisualPhysical.Text);
    Front_Infrared_Cross  := StrToFloat(edtFrontInfraredPhysical.Text);
    Side_Infrared_Cross   := StrToFloat(edtSideInfraredPhysical.Text);

    if cbPursuitLaunchGuidance.ItemIndex = 0 then
      Pursuit_Guide_Type    := 0
    else
      Pursuit_Guide_Type    :=1;

   { if cbPrimaryLaunchGuidance.ItemIndex = 0 then
      Primary_Guide_Type    := 0
    else if cbPrimaryLaunchGuidance = 1 then
      Primary_Guide_Type    := 1
    else if cbPrimaryLaunchGuidance = 2 then
      Primary_Guide_Type    := 2
    else if cbPrimaryLaunchGuidance = 3 then
      Primary_Guide_Type    := 3
    else if cbPrimaryLaunchGuidance = 4 then
      Primary_Guide_Type    := 4
    else
      Primary_Guide_Type    := 5; }

    if cbSecondaryLaunchGuidance.ItemIndex = 0 then
      Secondary_Guide_Type    := 0
    else if cbSecondaryLaunchGuidance.ItemIndex = 1 then
      Secondary_Guide_Type    := 1
    else if cbSecondaryLaunchGuidance.ItemIndex = 2 then
      Secondary_Guide_Type    := 2;

    if cbxAntiAir.Checked then
      Anti_Air_Capable  := 1
    else
      Anti_Air_Capable  := 0;

    if cbxAntiSurface.Checked then
      Anti_Sur_Capable  := 1
    else
      Anti_Sur_Capable  := 0;

    if cbxAntiSubsurface.Checked then
      Anti_SubSur_Capable  := 1
    else
      Anti_SubSur_Capable  := 0;

    if cbxAntiLand.Checked then
      Anti_Land_Capable  := 1
    else
      Anti_Land_Capable  := 0;

    if cbPrimaryTarget.ItemIndex = 0 then
      Primary_Target_Domain := 0
    else if cbPrimaryTarget.ItemIndex = 1 then
      Primary_Target_Domain := 1
    else if cbPrimaryTarget.ItemIndex = 2 then
      Primary_Target_Domain := 2
    else if cbPrimaryTarget.ItemIndex = 3 then
      Primary_Target_Domain := 3
    else
      Primary_Target_Domain := 4;


   // Primary_Target_Domain := ;
    SARH_POH_Modifier     := StrToFloat(edtSARHMissile.Text);
   // CG_POH_Modifier       := StrToFloat(;
    TARH_POH_Modifier     := StrToFloat(edtTARHMissile.Text);
    IR_POH_Modifier       := StrToFloat(edtInfraredMissile.Text);
    AR_POH_Modifier       := StrToFloat(edtAntiRadiationMissile.Text);
    Transmitted_Frequency := StrToFloat(edtFreqTerminalTARH.Text);
    Scan_Rate             := StrToFloat(edtScanRateTerminalTARH.Text);
    Pulse_Rep_Freq        := StrToFloat(edtPulseRepTerminalTARH.Text);
    Pulse_Width           := StrToFloat(edtPulseWidthTerminalTARH.Text);
    Xmit_Power            := StrToFloat(edtTransmitterPowerTerminalTARH.Text);
   { TARH_Jamming_A_Probability := ;
    TARH_Jamming_B_Probability := ;
    TARH_Jamming_C_Probability := ; }

    if cbxWaypointUserGuidance.Checked then
      Wpt_Capable   := 1
    else
      Wpt_Capable   :=0 ;

   // Max_Num_Wpts          := StrToFloat(edtmaxNumWaypointGuidance.Text);
    Min_Final_Leg_Length  := StrToFloat(edtMinFinalWaypointGuidance.Text);
    Engagement_Range      := StrToFloat(edtEngagementRangeDimension.Text);
    Max_Firing_Depth      := StrToFloat(edtMaxFiringGuidance.Text);
    Upper_Received_Freq   := StrToFloat(edtUpperLimitReceivedFreqTARH.Text);
    Lower_Received_Freq   := StrToFloat(edtLowerLimitReceivedFreqTARH.Text);
   // Fly_Out_Required      := StrToFloat(;
    Fly_Out_Range         := StrToFloat(edtRangeFlyGuide.Text);
    Fly_Out_Altitude      := StrToFloat(edtAltitudeFlyGuide.Text);

    if cbxBoosterSeparation.Checked then
      Booster_Separation_Required   := 1
    else
      Booster_Separation_Required   := 0;
    Booster_Separation_Range      := StrToFloat(edtRangeBooster.Text);
    Booster_Separation_Box_Width  := StrToFloat(edtBoxWeightBooster.Text);
    Booster_Separation_Box_Length := StrToFloat(edtBoxHeightBooster.Text);
    Term_Guide_Azimuth            := StrToFloat(edtRangeSeekerDetectionGuidance.Text);
    Term_Guide_Elevation          := StrToFloat(edtAzimuthSeekerDetectionGuidance.Text);
    Term_Guide_Range              := StrToFloat(edtElevationSeekerDetectionGuidance.Text);

    if cbxTerminalAcqGuidance.Checked then
      Terminal_Guidance_Capability  := 1
    else
      Terminal_Guidance_Capability  := 0;

   // Terminal_Altitude_Required    := StrToFloat(;
    Terminal_Acquisition_Altitude := StrToFloat(edtAltitudeTerminalGuidance.Text);
    Terminal_Sinuation_Start_Range:= StrToFloat(edtStartRangeTerminalGuidance.Text);
    Terminal_Sinuation_Period     := StrToFloat(edtPeriodTerminalGuidance.Text);
   { Terminal_Sinuation_Amplitude  := StrToFloat(;
    Terminal_Pop_Up_Range         := StrToFloat(;
    Terminal_Pop_Up_Altitude      := StrToFloat(;
    Mid_Course_Update_Mode        := ; }

    if cbxTypeA.Checked then
      Home_On_Jam_Type_A_Capable    := 1
    else
      Home_On_Jam_Type_A_Capable    := 0;

    if cbxTypeB.Checked then
      Home_On_Jam_Type_B_Capable    := 1
    else
      Home_On_Jam_Type_B_Capable    := 0;

    if cbxTypeC.Checked then
      Home_On_Jam_Type_C_Capable    := 1
    else
      Home_On_Jam_Type_C_Capable    := 0;

    if cbMethod.ItemIndex = 0 then
      Launch_Method  := 0
    else if cbMethod.ItemIndex = 1 then
      Launch_Method  := 1
    else if cbMethod.ItemIndex = 2 then
      Launch_Method  := 2
    else
      Launch_Method  := 3;

    if cbInitialCommanded.ItemIndex = 0 then
      Launch_Speed  := 0
    else if cbInitialCommanded.ItemIndex = 1 then
      Launch_Speed  := 1
    else if cbInitialCommanded.ItemIndex = 2 then
      Launch_Speed  := 2
    else
      Launch_Speed  := 3;

   { Data_Entry_Method             := ;
    Max_Target_Altitude_Delta     := ;
    Term_Guide_Azimuth_Narrow     := ;
    Term_Guide_Elevation_Narrow   := ;
    Term_Guide_Range_Narrow       := ;    }
    {
    Spot_Number                   := StrToInt(edtRangeTARH.Text);
    ECCM_Type                     := cbPrimaryTARH.ItemIndex;
    ECM_Detonation                := cbDetonationECMTARH.ItemIndex;
    ECM_Detection                 := cbDetectionECMTARH.ItemIndex;
    Detectability_Type            := cbDetectabilityType.ItemIndex;
   { IRCM_Detonation               := ;
    IRCM_Detection                := ;    }
   // Sea_State_Modelling_Capable   := StrToFloat(edt;
  end;

  Missile.FNote.Notes := mmNotes.Lines.Text;

end;


procedure TfMissileSummary.sbbtnSearchClick(Sender: TObject);
begin
  fTorpedo.Show;
end;

procedure TfMissileSummary.sbbtnsearchMotionClick(Sender: TObject);
begin
  fMotionDouble.Show;
end;

end.
