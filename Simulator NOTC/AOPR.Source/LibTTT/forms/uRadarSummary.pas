unit uRadarSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons,uDBAsset_Radar,math;

type
  TfRadarSummary = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    edtClass: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    cbRadarTypeGeneral: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cbECCMTypeGeneral: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtEmitterTypeGeneral: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtBaselineDetectionGeneral: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtAssociatedCrossGeneral: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtMaxUnambigousGeneral: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    edtNumbOfFCRGeneral: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    edtSpotNumberGeneral: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    edtOTHRadarGeneral: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    edtMainLobeGeneral: TEdit;
    Label21: TLabel;
    cbxAssociatedCross: TComboBox;
    Label22: TLabel;
    Label23: TLabel;
    grbCapabilities: TGroupBox;
    cbxAltitudeData: TCheckBox;
    cbxPlatformType: TCheckBox;
    cbxGroundSpeed: TCheckBox;
    cbxPlatformClass: TCheckBox;
    cbxHeadingData: TCheckBox;
    cbxSectorscan: TCheckBox;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Label24: TLabel;
    Label25: TLabel;
    edtFreqCharacteristic: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    edtScanRateCharacteristic: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    edtPulseRepetitionCharacteristic: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    edtPulseWidthCharacteristic: TEdit;
    Label32: TLabel;
    edtPowerCharacteristic: TEdit;
    Label34: TLabel;
    edtClutterCharacteristic: TEdit;
    Label35: TLabel;
    edtBeamCharacteristic: TEdit;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label33: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    grbVerticalCoverage1: TGroupBox;
    btnEdt1: TButton;
    grbVerticalCoverage2: TGroupBox;
    btnEdt2: TButton;
    cbxValid: TCheckBox;
    StaticText1: TStaticText;
    edtSignalToNoise: TEdit;
    sbSearchSignalToNoise: TSpeedButton;
    grbBasicCapabilities: TGroupBox;
    cbxTypeA: TCheckBox;
    cbxTypeB: TCheckBox;
    cbxTypeC: TCheckBox;
    Label45: TLabel;
    TrackBarJammerReduction: TTrackBar;
    edtJammerStrength: TEdit;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    grbAntiJamming: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    cbxCancelTypeA: TCheckBox;
    cbxCancelTypeB: TCheckBox;
    cbxCancelTypeC: TCheckBox;
    TrackBarPercenrageMaxUnambigous: TTrackBar;
    edtPercentage: TEdit;
    cbxAntiJamming: TCheckBox;
    mmNotes: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure saveToRecord;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure TrackBarJammerReductionChange(Sender: TObject);
    procedure TrackBarPercenrageMaxUnambigousChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    isNew,isCopy : boolean;
    radarobject : TRadar_On_Board;
  end;

var
  fRadarSummary: TfRadarSummary;


implementation

uses uSimDBEditor,uRadarPickList;

{$R *.dfm}


procedure TfRadarSummary.saveToRecord;
begin
 //radarobject := TRadar_On_Board.Create;

 with radarObject.FDef do
 begin

   Radar_Identifier := edtClass.Text;

   //tab general

   Radar_Type               := cbRadarTypeGeneral.ItemIndex;
   ECCM_Type                := cbECCMTypeGeneral.ItemIndex;
   Radar_Emitter            := edtEmitterTypeGeneral.Text;
   Detection_Range          := strtofloat(edtBaselineDetectionGeneral.Text);
   Known_Cross_Section      := strtofloat(edtAssociatedCrossGeneral.Text);
   Max_Unambig_Detect_Range := strtofloat(edtMaxUnambigousGeneral.Text);
   Num_FCR_Channels         := strtoint(edtNumbOfFCRGeneral.Text);
   Radar_Spot_Number        := strtoint(edtSpotNumberGeneral.Text);
   Radar_Horizon_Factor     := strtofloat(edtOTHRadarGeneral.Text);
   Main_Lobe_Gain           := strtofloat(edtMainLobeGeneral.Text);

   Altitude_Data_Capability     := cbxAltitudeData.Checked;
   Ground_Speed_Data_Capability := cbxGroundSpeed.Checked;
   Heading_Data_Capability      := cbxHeadingData.Checked;
   Plat_Type_Recog_Capability   := cbxPlatformType.Checked;
   Plat_Class_Recog_Capability  := cbxPlatformClass.Checked;
   Sector_Scan_Capable          := cbxSectorscan.Checked;

   //tab characteristics

   Frequency          := strtofloat(edtFreqCharacteristic.Text);
   Scan_Rate          := strtofloat(edtScanRateCharacteristic.Text);
   Pulse_Rep_Freq     := strtofloat(edtPulseRepetitionCharacteristic.Text);
   Pulse_Width        := strtofloat(edtPulseWidthCharacteristic.Text);
   Radar_Power        := strtofloat(edtPowerCharacteristic.Text);
   Clutter_Rejection  := strtofloat(edtClutterCharacteristic.Text);
   Beam_Width         := strtofloat(edtBeamCharacteristic.Text);

   Second_Vert_Coverage := cbxValid.Checked;

   //tab anti jamming

   Anti_Jamming_A_Resistant := cbxTypeA.Checked;
   Anti_Jamming_B_Resistant := cbxTypeB.Checked;
   Anti_Jamming_C_Resistant := cbxTypeC.Checked;

   //Off_Axis_Jammer_Reduction :=  TrackBarJammerReduction.Position / 1;

   Off_Axis_Jammer_Reduction := strtofloat(edtJammerStrength.Text)/100;

   Anti_Jamming_Capable     := cbxAntiJamming.Checked;
   Anti_Jamming_A_Resistant := cbxCancelTypeA.Checked;
   Anti_Jamming_B_Resistant := cbxCancelTypeB.Checked;
   Anti_Jamming_C_Resistant := cbxCancelTypeC.Checked;

   Max_Unambig_Detect_Range := strtofloat(edtPercentage.Text);

 end;

    //tab note storage
    radarObject.FNote.Notes := mmNotes.Lines.Text;


end;

procedure TfRadarSummary.TrackBarJammerReductionChange(Sender: TObject);
begin
  edtJammerStrength.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfRadarSummary.TrackBarPercenrageMaxUnambigousChange(Sender: TObject);
begin
  edtPercentage.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfRadarSummary.btnApplyClick(Sender: TObject);
begin
 saveToRecord;

 if isNew then
 begin
  insertRadar_Def(radarobject);
  isNew := False;
 end
 else updateRadar_Def(radarobject,inttostr(radarobject.FDef.Radar_Index));

end;

procedure TfRadarSummary.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfRadarSummary.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fRadarPickList.refresh;
end;

procedure TfRadarSummary.FormCreate(Sender: TObject);
begin
 radarObject := TRadar_On_Board.Create;
end;

procedure TfRadarSummary.FormShow(Sender: TObject);
begin
 with (radarObject.FDef) do
 begin
   if isCopy then
   begin
      edtClass.Text  := 'Copy of '+ Radar_Identifier;
      isNew := True;
   end
   else if not isCopy then

      edtClass.Text  := Radar_Identifier;

   //tab general

   if Radar_Type = 0 then
     cbRadarTypeGeneral.ItemIndex := 0
     else cbRadarTypeGeneral.ItemIndex := Radar_Type - 1;

   cbECCMTypeGeneral.ItemIndex      := ECCM_Type;
   edtEmitterTypeGeneral.Text       := Radar_Emitter;
   edtBaselineDetectionGeneral.Text := FloatToStr(Detection_Range);
   edtAssociatedCrossGeneral.Text   := FloatToStr(Known_Cross_Section);
   edtMaxUnambigousGeneral.Text     := floattostr(Max_Unambig_Detect_Range) ;
   edtNumbOfFCRGeneral.Text         := inttostr(Num_FCR_Channels);
   edtSpotNumberGeneral.Text        := inttostr(Radar_Spot_Number);
   edtOTHRadarGeneral.Text          := floattostr(Radar_Horizon_Factor);
   edtMainLobeGeneral.Text          := floattostr(Main_Lobe_Gain);

   cbxAltitudeData.Checked  := Altitude_Data_Capability;
   cbxGroundSpeed.Checked   := Ground_Speed_Data_Capability;
   cbxHeadingData.Checked   := Heading_Data_Capability;
   cbxPlatformType.Checked  := Plat_Type_Recog_Capability;
   cbxPlatformClass.Checked := Plat_Class_Recog_Capability;
   cbxSectorscan.Checked    := Sector_Scan_Capable;

   //tab characteristics

   edtFreqCharacteristic.Text             := floattostr(Frequency);
   edtScanRateCharacteristic.Text         := FloatToStr(Scan_Rate);
   edtPulseRepetitionCharacteristic.Text  := FloatToStr(Pulse_Rep_Freq);
   edtPulseWidthCharacteristic.Text       := FloatToStr(Pulse_Width);
   edtPowerCharacteristic.Text            := FloatToStr(Radar_Power);
   edtClutterCharacteristic.Text          := FloatToStr(Clutter_Rejection);
   edtBeamCharacteristic.Text             := FloatToStr(Beam_Width);

   cbxValid.Checked := Second_Vert_Coverage;

   //tab anti jamming

   cbxTypeA.Checked := Anti_Jamming_A_Resistant;
   cbxTypeB.Checked := Anti_Jamming_B_Resistant;
   cbxTypeC.Checked := Anti_Jamming_C_Resistant;

   if (Off_Axis_Jammer_Reduction<TrackBarJammerReduction.min) then TrackBarJammerReduction.Position := TrackBarJammerReduction.min
   else if (Off_Axis_Jammer_Reduction>TrackBarJammerReduction.Max) then TrackBarJammerReduction.Position := TrackBarJammerReduction.Max
   else TrackBarJammerReduction.Position := floor(Off_Axis_Jammer_Reduction/1);

   edtJammerStrength.Text := FloatToStr(Off_Axis_Jammer_Reduction*100);

   cbxAntiJamming.Checked := Anti_Jamming_Capable;
   cbxCancelTypeA.Checked := Anti_Jamming_A_Resistant;
   cbxCancelTypeB.Checked := Anti_Jamming_B_Resistant;
   cbxCancelTypeC.Checked := Anti_Jamming_C_Resistant;

   if Max_Unambig_Detect_Range>100 then
   begin
    TrackBarPercenrageMaxUnambigous.Position := TrackBarPercenrageMaxUnambigous.Max;
    edtPercentage.Text                       := '100';
   end
   else
   begin
    TrackBarPercenrageMaxUnambigous.Position  := Floor(Max_Unambig_Detect_Range/1);
    edtPercentage.Text                        := FloatToStr(Max_Unambig_Detect_Range);
   end;
 end;

    //tab note storage
    mmNotes.Clear;
    mmNotes.Lines.Add(radarObject.FNote.Notes);

 if isNew then
 begin
   cbxAltitudeData.Checked := False;
   cbxPlatformType.Checked := False;
   cbxGroundSpeed.Checked := False;
   cbxPlatformClass.Checked := False;
   cbxHeadingData.Checked := False;
   cbxSectorscan.Checked := False;
   cbxValid.Checked := False;
   cbxTypeA.Checked := False;
   cbxTypeB.Checked := False;
   cbxTypeC.Checked := False;
   cbxCancelTypeA.Checked := False;
   cbxCancelTypeB.Checked := False;
   cbxCancelTypeC.Checked := False;
   cbxAntiJamming.Checked := False;

   edtClass.Text                    := '';
   edtEmitterTypeGeneral.Text       := '';
   edtBaselineDetectionGeneral.Text := '';
   edtAssociatedCrossGeneral.Text   := '';
   edtMaxUnambigousGeneral.Text     := '';
   edtNumbOfFCRGeneral.Text         := '';
   edtSpotNumberGeneral.Text        := '';
   edtOTHRadarGeneral.Text          := '';
   edtMainLobeGeneral.Text          := '';
   edtFreqCharacteristic.Text       := '';
   edtScanRateCharacteristic.Text   := '';
   edtPulseRepetitionCharacteristic.Text := '';
   edtPulseWidthCharacteristic.Text      := '';
   edtPowerCharacteristic.Text           := '';
   edtClutterCharacteristic.Text         := '';
   edtBeamCharacteristic.Text            := '';
   edtSignalToNoise.Text                 := '';
   edtJammerStrength.Text                := '';
   edtPercentage.Text                    := '';

   cbRadarTypeGeneral.Clear;
   cbECCMTypeGeneral.Clear;
   cbxAssociatedCross.Clear;


 end;

end;

end.
