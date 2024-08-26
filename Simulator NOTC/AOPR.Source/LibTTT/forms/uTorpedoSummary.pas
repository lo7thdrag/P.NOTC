unit uTorpedoSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, uDBAsset_Weapon;

type
  TfTorpedoSummary = class(TForm)
    Panel1: TPanel;
    edtClassTorpedo: TEdit;
    Panel2: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    grbLaunchSettingGeneral: TGroupBox;
    lbl4: TLabel;
    lbl5: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    cbMethod: TComboBox;
    cbInitialCommanded: TComboBox;
    grbOptLaunchRange: TGroupBox;
    grbLethality: TGroupBox;
    Label120: TLabel;
    Label119: TLabel;
    edtLethality: TEdit;
    TrackBarLethality: TTrackBar;
    cbPrimaryTarget: TComboBox;
    cbDetectabilityType: TComboBox;
    edtMaxSearchDepth: TEdit;
    grbDamageSustainability: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edtDamage: TEdit;
    TrackBarDamage: TTrackBar;
    Physical: TTabSheet;
    sbbtnsearchMotion: TSpeedButton;
    Label15: TLabel;
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
    Label14: TLabel;
    edtLengthDimension: TEdit;
    edtWidthDimension: TEdit;
    edtHeightDimension: TEdit;
    edtEngagementRangeDimension: TEdit;
    edtMotionCharacteristic: TEdit;
    grbAirDropCapable: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label35: TLabel;
    edtLateralDecelerationAirDrop: TEdit;
    edtDecentRateAirDrop: TEdit;
    cbxAirDropCapable: TCheckBox;
    grbAcousticCrossSection: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    edtFrontAcousticCross: TEdit;
    edtSideAcousticCross: TEdit;
    grbAcousticIntensity: TGroupBox;
    TabSheet3: TTabSheet;
    grbTorpedo: TGroupBox;
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
    edtWakeHoming: TEdit;
    edtWireGuided: TEdit;
    edtActiveAccoustic: TEdit;
    edtPassiveAccoustic: TEdit;
    TrackBarWakeHoming: TTrackBar;
    TrackBarWireGuided: TTrackBar;
    TrackBarActiveAcoustic: TTrackBar;
    TrackBarPassiveAccoustic: TTrackBar;
    TabSheet4: TTabSheet;
    grbGuidance: TGroupBox;
    Label47: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    cbPrimaryLaunchGuidance: TComboBox;
    cbPursuitLaunchGuidance: TComboBox;
    grbSeekDetectionGuidance: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label61: TLabel;
    edtRangeSeekerDetectionGuide: TEdit;
    edtAzimuthSeekerDetectionGuide: TEdit;
    grbSinuationRunout: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label67: TLabel;
    edtPeriodSinuation: TEdit;
    edtAmplitudeSinuation: TEdit;
    cbxSinuationRunout: TCheckBox;
    grbRangeGuidance: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    edtMinRangeGuidance: TEdit;
    edtMaxRangeGuidance: TEdit;
    grbUseTerminalCircleGuidance: TGroupBox;
    Label79: TLabel;
    Label80: TLabel;
    Label84: TLabel;
    edtRadiusGuidance: TEdit;
    cbxRadiusOperatorGuidance: TCheckBox;
    grbSeekerTurnOnGuidance: TGroupBox;
    grbWaypointUser: TGroupBox;
    TabSheet6: TTabSheet;
    mmNotes: TMemo;
    grbCapabilities: TGroupBox;
    cbxAntiSurface: TCheckBox;
    cbxAntiSubSurface: TCheckBox;
    grbSafetyCeiling: TGroupBox;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    edtDepthSafetyCeiling: TEdit;
    Label5: TLabel;
    grbActiveAccoustic: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label150: TLabel;
    edtPower: TEdit;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    edtFreq: TEdit;
    edtNuclearSubmarine: TEdit;
    TrackBarNuclearSubmarine: TTrackBar;
    Label12: TLabel;
    Label13: TLabel;
    edtConvSubmarine: TEdit;
    TrackBarConvSubmarine: TTrackBar;
    Label154: TLabel;
    Label155: TLabel;
    edtOtherSubmarine: TEdit;
    TrackBarOtherSubmarine: TTrackBar;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    edtMinSpeedAccoustic: TEdit;
    edtBelowCavitationAccoustic: TEdit;
    edtAboveCavitationAccoustic: TEdit;
    edtCavitationSpeedAccoustic: TEdit;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    edtMaxSpeedAccoustic: TEdit;
    Label118: TLabel;
    Label121: TLabel;
    edtActPassAccoustic: TEdit;
    TrackBarActPassAccoustic: TTrackBar;
    Label48: TLabel;
    Label50: TLabel;
    Label122: TLabel;
    edtElevationSeekerDetectionGuide: TEdit;
    Label126: TLabel;
    Label127: TLabel;
    Label129: TLabel;
    edtMinRunoutGuidance: TEdit;
    cbxUseTerminalCircle: TCheckBox;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    edtRangeSeekerTurnOnGuidance: TEdit;
    cbxRangeSeekerTurnOnGuidance: TCheckBox;
    grbRadiusGyroAngels: TGroupBox;
    cbxrealtiveGyroAnglesGuidance: TCheckBox;
    Label74: TLabel;
    Label75: TLabel;
    cbxFirstGyroAngelsGuidance: TComboBox;
    Label76: TLabel;
    Label77: TLabel;
    cbxSecondGyroAngelsGuidance: TComboBox;
    Label78: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    edtDefaultCruiseGuidance: TEdit;
    edtWireAngleGuidance: TEdit;
    btnEdit: TButton;
    lbl1: TLabel;
    cbxFixDepth: TCheckBox;
    procedure btnCancelClick(Sender: TObject);
    procedure TrackBarNuclearSubmarineChange(Sender: TObject);
    procedure TrackBarConvSubmarineChange(Sender: TObject);
    procedure TrackBarOtherSubmarineChange(Sender: TObject);
    procedure TrackBarLethalityChange(Sender: TObject);
    procedure TrackBarDamageChange(Sender: TObject);
    procedure TrackBarWakeHomingChange(Sender: TObject);
    procedure TrackBarWireGuidedChange(Sender: TObject);
    procedure TrackBarActiveAcousticChange(Sender: TObject);
    procedure TrackBarPassiveAccousticChange(Sender: TObject);
    procedure TrackBarActPassAccousticChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure getDataTorpedo;
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure sbbtnsearchMotionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    torpedo : TTorpedo_On_Board;
    isCopy,fromTorpedo : Boolean;
  end;

var
  fTorpedoSummary: TfTorpedoSummary;

implementation

{$R *.dfm}

uses uDataModuleTTT, uWeaponSingleList, uMotionDoubleList, uMotion;

procedure TfTorpedoSummary.btnApplyClick(Sender: TObject);
begin

  getDataTorpedo;
  if fWeaponSingle.isNew then
  begin
    dmTTT.insertTorpedo_Def(torpedo);
    fWeaponSingle.isNew := False;
  end
  else
  begin
     dmTTT.updateTorpedo_Def(torpedo,IntToStr(torpedo.FDef.Torpedo_Index));
  end;

end;

procedure TfTorpedoSummary.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfTorpedoSummary.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fWeaponSingle.refresh;
end;

procedure TfTorpedoSummary.FormCreate(Sender: TObject);
begin
  torpedo := TTorpedo_On_Board.Create;
end;

procedure TfTorpedoSummary.TrackBarActiveAcousticChange(Sender: TObject);
begin
  edtActiveAccoustic.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTorpedoSummary.TrackBarActPassAccousticChange(Sender: TObject);
begin
  edtActPassAccoustic.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTorpedoSummary.TrackBarConvSubmarineChange(Sender: TObject);
begin
  edtConvSubmarine.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTorpedoSummary.TrackBarDamageChange(Sender: TObject);
begin
  edtDamage.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTorpedoSummary.TrackBarLethalityChange(Sender: TObject);
begin
  edtLethality.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTorpedoSummary.TrackBarNuclearSubmarineChange(Sender: TObject);
begin
  edtNuclearSubmarine.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTorpedoSummary.TrackBarOtherSubmarineChange(Sender: TObject);
begin
  edtOtherSubmarine.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTorpedoSummary.TrackBarPassiveAccousticChange(Sender: TObject);
begin
  edtPassiveAccoustic.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTorpedoSummary.TrackBarWakeHomingChange(Sender: TObject);
begin
  edtWakeHoming.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTorpedoSummary.TrackBarWireGuidedChange(Sender: TObject);
begin
  edtWireGuided.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTorpedoSummary.getDataTorpedo;
begin

  with torpedo.FDef do
  begin
    Class_Identifier          := edtClassTorpedo.Text;
   // Platform_Domain           :=
   // Platform_Category         :=
   // Platform_Type             :=
    Max_Range                 := StrToFloat(edtMaxRangeGuidance.Text);
    Min_Range                 := StrToFloat(edtMinRangeGuidance.Text);
    if fMotionDouble.mId <> '' then
      Motion_Index          := StrToInt(fMotionDouble.mId)
    else
      Motion_Index        := torpedo.FDef.Motion_Index;
    Seeker_TurnOn_Range       := StrToFloat(edtRangeSeekerTurnOnGuidance.Text);
    Lethality                 := StrToInt(edtLethality.Text);
    Damage_Capacity           := StrToInt(edtDamage.Text);
    Default_Depth             := StrToFloat(edtDefaultCruiseGuidance.Text);
    Length                    := StrToFloat(edtLengthDimension.Text);
    Width                     := StrToFloat(edtWidthDimension.Text);
    Height                    := StrToFloat(edtHeightDimension.Text);
    Front_Acoustic_Cross      := StrToFloat(edtFrontAcousticCross.Text);
    Side_Acoustic_Cross       := StrToFloat(edtSideAcousticCross.Text);
    LSpeed_Acoustic_Intens    := StrToFloat(edtMinSpeedAccoustic.Text);
    Below_Cav_Acoustic_Intens := StrToFloat(edtBelowCavitationAccoustic.Text);
    Above_Cav_Acoustic_Intens := StrToFloat(edtAboveCavitationAccoustic.Text);
    HSpeed_Acoustic_Intens    := StrToFloat(edtMaxSpeedAccoustic.Text);
    Cavitation_Switch_Point   := StrToFloat(edtCavitationSpeedAccoustic.Text);
    Term_Guide_Azimuth        := StrToFloat(edtAzimuthSeekerDetectionGuide.Text);
    Term_Guide_Elevation      := StrToFloat(edtElevationSeekerDetectionGuide.Text);
    Term_Guide_Range          := StrToFloat(edtRangeSeekerDetectionGuide.Text);
    Pursuit_Guidance_Type     := cbPursuitLaunchGuidance.ItemIndex;

    if cbxAirDropCapable.Checked then
      Air_Drop_Capable  := 1
    else
      Air_Drop_Capable  := 0;

    if cbxUseTerminalCircle.Checked then
      Use_Terminal_Circle  := 1
    else
      Use_Terminal_Circle  := 0;

    if cbxRadiusOperatorGuidance.Checked then
      Fixed_Circle_Radius  := 1
    else
      Fixed_Circle_Radius  := 0;

    if cbxAntiSurface.Checked then
      Anti_Sur_Capable  := 1
    else
      Anti_Sur_Capable  := 0;

    if cbxAntiSubSurface.Checked then
      Anti_SubSur_Capable  := 1
    else
      Anti_SubSur_Capable  := 0;

    if cbxFixDepth.Checked then
      Fixed_Ceiling_Depth  := 1
    else
      Fixed_Ceiling_Depth  := 0;

    if cbxRangeSeekerTurnOnGuidance.Checked then
      Fixed_Seeker_TurnOn_Range  := 1
    else
      Fixed_Seeker_TurnOn_Range  := 0;

    if cbxSinuationRunout.Checked then
      Sinuation_Runout  := 1
    else
      Sinuation_Runout  := 0;

    Terminal_Circle_Radius    := StrToFloat(edtRadiusGuidance.Text);
    Lateral_Deceleration      := StrToFloat(edtLateralDecelerationAirDrop.Text);
    Airborne_Descent_Rate     := StrToFloat(edtDecentRateAirDrop.Text);
    Wire_Angle_Offset         := StrToFloat(edtDefaultCruiseGuidance.Text);
    Guidance_Type             := cbPrimaryLaunchGuidance.ItemIndex;
    Primary_Target_Domain     := cbPrimaryTarget.ItemIndex;
    Active_Acoustic_POH_Mod   := StrToFloat(edtActiveAccoustic.Text);
    Passive_Acoustic_POH_Mod  := StrToFloat(edtPassiveAccoustic.Text);
    Active_Passive_POH_Mod    := StrToFloat(edtActPassAccoustic.Text);
    WireGuide_POH_Modifier    := StrToFloat(edtWireGuided.Text);
    WakeHome_POH_Modifier     := StrToFloat(edtWakeHoming.Text);
    Active_Seeker_Power       := StrToFloat(edtPower.Text);
    Active_Seeker_Freq        := StrToFloat(edtFreq.Text);
    Engagement_Range          := StrToFloat(edtEngagementRangeDimension.Text);
    First_Relative_Gyro_Angle   := cbxFirstGyroAngelsGuidance.ItemIndex;
    Second_Relative_Gyro_Angle  := cbxSecondGyroAngelsGuidance.ItemIndex;
   { Max_Torpedo_Gyro_Angle      :=
    Max_Torpedo_Search_Depth    :=
    Acoustic_Torp_Ceiling_Depth :=   }

    Runout_Sinuation_Period     := StrToFloat(edtPeriodSinuation.Text);
    Runout_Sinuation_Amplitude  := StrToFloat(edtAmplitudeSinuation.Text);
    Min_Runout_Range            := StrToFloat(edtMinRunoutGuidance.Text);
    Launch_Method               := cbMethod.ItemIndex;
   // Data_Entry_Method           :=
    Launch_Speed                := cbInitialCommanded.ItemIndex;
    Opt_Launch_Range_Nuc_Sub    := StrToFloat(edtNuclearSubmarine.Text);
    Opt_Launch_Range_Conv_Sub   := StrToFloat(edtConvSubmarine.Text);
    Opt_Launch_Range_Other      := StrToFloat(edtOtherSubmarine.Text);
    Detectability_Type          := cbDetectabilityType.ItemIndex;

  end;

  torpedo.FNote.Notes := mmNotes.Lines.Text;

end;

procedure TfTorpedoSummary.sbbtnsearchMotionClick(Sender: TObject);
begin
  fMotionDouble.Show;
end;

end.
