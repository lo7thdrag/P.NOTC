unit uSonar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, uDBAsset_Sonar;

type
  TfSonar = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    edtClass: TEdit;
    Panel2: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel3: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    cbCategoryGeneralSonar: TComboBox;
    cbOperatignMOdeGeneralSonar: TComboBox;
    edtActiveDetectionRangeGeneral: TEdit;
    edtAssociatedCrossGeneral: TEdit;
    edtPassiveDetectionGeneral: TEdit;
    edtAssociatedSignalGeneral: TEdit;
    edtMaxDetectionGeneral: TEdit;
    edtActiveSonarGeneral: TEdit;
    edtActiveFreqGeneral: TEdit;
    cbxAssociatedCross: TComboBox;
    grbCapabilities: TGroupBox;
    cbxSurfaceDetecting: TCheckBox;
    cbxTorpedoDetecting: TCheckBox;
    cbxSubSurfaceDetecting: TCheckBox;
    cbxMineClass: TCheckBox;
    TabSheet1: TTabSheet;
    sbSearchSignalToNoise: TSpeedButton;
    StaticText1: TStaticText;
    edtSignalToNoise: TEdit;
    TabSheet2: TTabSheet;
    grbBasicCapabilities: TGroupBox;
    TabSheet3: TTabSheet;
    mmNotes: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label60: TLabel;
    edtPassiveFreqGeneral: TEdit;
    edtMaxOperatingGeneral: TEdit;
    edtOwnshipNoiseGeneral: TEdit;
    edtMaxSonarSpeedGeneral: TEdit;
    Label58: TLabel;
    Label59: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    edtActiveIntegrationPeriodCharacteristic: TEdit;
    Label28: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    edtPassiveIntegrationPeriodCharacteristic: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtShortRangeTimeInterval: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtMediumRangeTimeInterval: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    edtLongRangeTimeInterval: TEdit;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    edtTimeRequired: TEdit;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    edtCobleLength: TEdit;
    Label44: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    edtCoblePayoutRate: TEdit;
    Label67: TLabel;
    cbxPassiveTarget: TCheckBox;
    cbxPassiveInvestigating: TCheckBox;
    cbxTracking: TCheckBox;
    cbxDepthFinding: TCheckBox;
    cbxArrayKinking: TCheckBox;
    Label45: TLabel;
    Label46: TLabel;
    edtTurnRateToKink: TEdit;
    Label47: TLabel;
    Label48: TLabel;
    Label68: TLabel;
    edtTimeRequiredToSettle: TEdit;
    Label69: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    edtMinimumTowSpeed: TEdit;
    Label51: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    edtMinDepth: TEdit;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    edtmaxBearingReported: TEdit;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    edtMaxAverageBeamWidth: TEdit;
    Label78: TLabel;
    cbxBearingAmbiguity: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
    procedure getData;
  public
    { Public declarations }
    sonarObject: TSonar_On_Board;
    isNew,isCopy      : Boolean;
  end;

var
  fSonar: TfSonar;

implementation

{$R *.dfm}

uses uDataModuleTTT,uSonarPicklist;

procedure TfSonar.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    getData;
    dmTTT.insertSonar_Def(sonarObject);
    isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateSonar_Def(sonarObject,IntToStr(sonarObject.FDef.Sonar_Index));
  end;
end;

procedure TfSonar.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfSonar.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fSonarPicklist.getSonar;
end;

procedure TfSonar.FormCreate(Sender: TObject);
begin
  sonarObject := TSonar_On_Board.Create;
end;

procedure TfSonar.getData;
begin

  with sonarObject.FDef do begin
    Sonar_Identifier := edtClass.Text;

    if cbCategoryGeneralSonar.ItemIndex = 0 then
       Sonar_Category_Index := 0
    else if cbCategoryGeneralSonar.ItemIndex = 1 then
       Sonar_Category_Index := 1
    else if cbCategoryGeneralSonar.ItemIndex = 2 then
       Sonar_Category_Index := 2
    else if cbCategoryGeneralSonar.ItemIndex = 3 then
       Sonar_Category_Index := 3
    else if cbCategoryGeneralSonar.ItemIndex = 4 then
       Sonar_Category_Index := 4;



    //Sonar_Classification := FieldByName('Sonar_Classification').AsInteger;
    Passive_Int_Period    := StrToInt(edtPassiveIntegrationPeriodCharacteristic.Text);
    Active_Int_Period     := StrToInt(edtActiveIntegrationPeriodCharacteristic.Text);
    TIOW_Short_Range      := StrToFloat(edtShortRangeTimeInterval.Text);
    TIOW_Medium_Range     := StrToFloat(edtMediumRangeTimeInterval.Text);
    TIOW_Long_Range       := StrToFloat(edtLongRangeTimeInterval.Text);
    Passive_Detect_Range  := StrToFloat(edtPassiveDetectionGeneral.Text);
    Active_Detect_Range   := StrToFloat(edtActiveDetectionRangeGeneral.Text);
    Max_Detect_Range      := StrToFloat(edtMaxDetectionGeneral.Text);
    Known_Signal_Source   := StrToFloat(edtSignalToNoise.Text);
    Known_Cross_Section   := StrToFloat(edtAssociatedCrossGeneral.Text);
   // Sonar_Directivity_Index := StrToFloat(edt;
    Active_Operating_Power  := StrToFloat(edtActiveSonarGeneral.Text);
    Active_Freq_of_Op     := StrToFloat(edtActiveFreqGeneral.Text);
    Passive_Freq_of_Op    := StrToFloat(edtPassiveFreqGeneral.Text);
    Max_Operating_Depth   := StrToFloat(edtMaxOperatingGeneral.Text);
    Sonar_Depth_Rate_of_Change := StrToFloat(edtCoblePayoutRate.Text);
  //  Depth_per_Speed       := StrToFloat(;
  //  Kinking_Processing    := StrToFloat(edt;
    Turn_Rate_2_Kink      := StrToInt(edtTurnRateToKink.Text);
    Time_2_Settle_Kinked  := StrToint(edtTimeRequiredToSettle.Text);
  //  Time_2_Resolve_Bearing := StrToFloat(;
    Time_2_Identify        := StrToint(edtTimeRequired.Text);
  //  Curve_Detection_Index  := StrToFloat(;
  //  Track_Analysis         := StrToFloat(;
  //  Time_2_Provide_Track   := StrToFloat(;
    Ownship_Increase_due_to_Active := StrToFloat(edtOwnshipNoiseGeneral.Text);
  //  Tow_Speed             := StrToFloat(;
    Minimum_Depth         := StrToFloat(edtMinDepth.Text);
    Maximum_Tow_Speed     := StrToFloat(edtMinimumTowSpeed.Text);
    Maximum_Sonar_Speed   := StrToFloat(edtMaxSonarSpeedGeneral.Text);
    Cable_Length                 := StrToFloat(edtCobleLength.Text);
    Maximum_Reported_Bearing_Error := StrToFloat(edtmaxBearingReported.Text);
    Average_Beam_Width             := StrToFloat(edtMaxAverageBeamWidth.Text);
  //  Counter_Detection_Factor       := StrToFloat(;


    if cbxDepthFinding.Checked then
       Depth_Finding_Capable := True
    else Depth_Finding_Capable := False;

    if cbxTracking.Checked then
       Tracking_Capable := True
    else Tracking_Capable := False;

    if cbxSurfaceDetecting.Checked then
       Surface_Detection_Capable := True
    else Surface_Detection_Capable := False;

    if cbxSubSurfaceDetecting.Checked then
       SubSurface_Detection_Capable := True
    else SubSurface_Detection_Capable := False;

    if cbxTorpedoDetecting.Checked then
       Torpedo_Detection_Capable := True
    else Torpedo_Detection_Capable := False;

    if cbxMineClass.Checked then
       Mine_Detection_Capable := True
    else Mine_Detection_Capable := False;

    if cbxArrayKinking.Checked then
       Kinking_Processing := True
    else Kinking_Processing := False;

    if cbxBearingAmbiguity.Checked then
       Bearing_Processing := True
    else Bearing_Processing := False;

    if cbxPassiveInvestigating.Checked then
       Passive_Processing := True
    else Passive_Processing := False;

    if cbxPassiveTarget.Checked then
       Target_Identification := True
    else Target_Identification := False;
  end;

  sonarObject.FNote.Notes := mmNotes.Lines.Text;
end;


end.
