unit uTowedJammerDecoyDef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, uDBAsset_Countermeasure;

type
  TfTowedjammerDecoy = class(TForm)
    Panel1: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    lbl1: TLabel;
    edtClassTowedJammer: TEdit;
    Panel3: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    Notes: TTabSheet;
    mmNotes: TMemo;
    grbRadarCross: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edtFrontRadarCross: TEdit;
    edtSideRadarCross: TEdit;
    cbFrontRadarCross: TComboBox;
    cbSideRadarCross: TComboBox;
    grbDimensions: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label61: TLabel;
    Label48: TLabel;
    Label50: TLabel;
    Label122: TLabel;
    edtLengthDimensions: TEdit;
    edtWidththDimensions: TEdit;
    edtHeigthDimensions: TEdit;
    grbAcousticCross: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtFrontAcousticCross: TEdit;
    edtSideAcousticCross: TEdit;
    grbVisualCross: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtFrontVisualCross: TEdit;
    edtSideVisualCross: TEdit;
    grbTargetSelection: TGroupBox;
    cbxTARHMissiles: TCheckBox;
    cbxFireControlRadars: TCheckBox;
    Bevel1: TBevel;
    Label18: TLabel;
    Label19: TLabel;
    cbECMType: TComboBox;
    Label20: TLabel;
    Label21: TLabel;
    Label27: TLabel;
    edtActivationControl: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    edtTowLength: TEdit;
    grbProbOfSuccess: TGroupBox;
    Label12: TLabel;
    Label22: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtTypeA: TEdit;
    TrackBarTypeA: TTrackBar;
    edtTypeB: TEdit;
    TrackBarTypeB: TTrackBar;
    edtTypeC: TEdit;
    TrackBarTypeC: TTrackBar;
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure getData;
    procedure TrackBarTypeAChange(Sender: TObject);
    procedure TrackBarTypeBChange(Sender: TObject);
    procedure TrackBarTypeCChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    towed_jammer : TTowed_Jammer_Decoy_On_Board;
    isCopy   : Boolean;
  end;

var
  fTowedjammerDecoy: TfTowedjammerDecoy;

implementation

{$R *.dfm}

uses uCountermeasuresSingleList, uDataModuleTTT;

procedure TfTowedjammerDecoy.btnApplyClick(Sender: TObject);
begin
  if fCountermeasureSingle.isNew then
  begin
    getData;
    dmTTT.insertTowed_Jammer_Def(towed_jammer);
    fCountermeasureSingle.isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateTowed_Jammer_Def(towed_jammer,IntToStr(towed_jammer.FDef.Towed_Decoy_Index));
  end;
end;

procedure TfTowedjammerDecoy.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfTowedjammerDecoy.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fCountermeasureSingle.refresh;
end;

procedure TfTowedjammerDecoy.getData;
begin
  with towed_jammer.FDef do begin

    if cbxTARHMissiles.Checked then
      Decoy_TARH_Capable  := 1
    else
      Decoy_TARH_Capable  := 0;

    if cbxFireControlRadars.Checked then
      Decoy_SARH_Capable  := 1
    else
      Decoy_SARH_Capable  := 0;

    Towed_Decoy_Identifier := edtClassTowedJammer.Text;
    Length                := StrToFloat(edtLengthDimensions.Text);
    Width                 := StrToFloat(edtWidththDimensions.Text);
    Height                := StrToFloat(edtHeigthDimensions.Text);
    Front_Radar_Cross     := StrToFloat(edtFrontRadarCross.Text);
    Side_Radar_Cross      := StrToFloat(edtSideRadarCross.Text);
    Front_Visual_Cross    := StrToFloat(edtFrontVisualCross.Text);
    Side_Visual_Cross     := StrToFloat(edtSideVisualCross.Text);
    Front_Acoustic_Cross  := StrToFloat(edtFrontAcousticCross.Text);
    Side_Acoustic_Cross   := StrToFloat(edtSideAcousticCross.Text);
    Type_A_Seducing_Prob  := StrToFloat(edtTypeA.Text);
    Type_B_Seducing_Prob  := StrToFloat(edtTypeB.Text);
    Type_C_Seducing_Prob  := StrToFloat(edtTypeC.Text);
    Activation_Control_Delay  := StrToFloat(edtActivationControl.Text);
    Tow_Length            := StrToFloat(edtTowLength.Text);

    if cbECMType.ItemIndex = 0 then
      ECM_Type  := 0
    else if cbECMType.ItemIndex = 1 then
      ECM_Type  := 1
    else
      ECM_Type  := 2;
  end;

  towed_jammer.FNote.Notes := mmNotes.Lines.Text;

end;

procedure TfTowedjammerDecoy.TrackBarTypeAChange(Sender: TObject);
begin
  edtTypeA.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTowedjammerDecoy.TrackBarTypeBChange(Sender: TObject);
begin
  edtTypeB.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfTowedjammerDecoy.TrackBarTypeCChange(Sender: TObject);
begin
  edtTypeC.Text := IntToStr((sender as TTrackBar).Position);
end;

end.
