unit uDefensiveJammer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TfDefensiveJammer = class(TForm)
    Panel1: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    lbl1: TLabel;
    Panel3: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    Notes: TTabSheet;
    mmNotes: TMemo;
    grbTargetSelection: TGroupBox;
    cbxTARHMissiles: TCheckBox;
    cbxFireControlRadar: TCheckBox;
    Label74: TLabel;
    Label75: TLabel;
    cbECMType: TComboBox;
    grbProbOfSuccess: TGroupBox;
    Label53: TLabel;
    Label61: TLabel;
    edtTypeA: TEdit;
    Label159: TLabel;
    Label160: TLabel;
    TrackBarTypeA: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    edtTypeB: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    TrackBarTypeB: TTrackBar;
    Label5: TLabel;
    Label6: TLabel;
    edtTypeC: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    TrackBarTypeC: TTrackBar;
    edtClassDefensiveJammer: TEdit;
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
    defensive_jammer : TDefensive_Jammer_On_Board;
    isCopy   : Boolean;
  end;

var
  fDefensiveJammer: TfDefensiveJammer;

implementation

{$R *.dfm}

uses uCountermeasuresSingleList, uDataModuleTTT;

procedure TfDefensiveJammer.btnApplyClick(Sender: TObject);
begin
  if fCountermeasureSingle.isNew then
  begin
    getData;
    dmTTT.insertDefensive_Jammer_Def(defensive_jammer);
    fCountermeasureSingle.isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateDefensive_Jammer_Def(defensive_jammer,IntToStr(defensive_jammer.FDefensiveJammer_Def.Defensive_Jammer_Index));
  end;
end;

procedure TfDefensiveJammer.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfDefensiveJammer.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fCountermeasureSingle.refresh;
end;

procedure TfDefensiveJammer.getData;
begin
  with defensive_jammer.FDefensiveJammer_Def do begin
    Defensive_Jammer_Identifier   := edtClassDefensiveJammer.Text;
    Type_A_Seducing_Prob          := StrToFloat(edtTypeA.Text);
    Type_B_Seducing_Prob          := StrToFloat(edtTypeB.Text);
    Type_C_Seducing_Prob          := StrToFloat(edtTypeC.Text);

    if cbECMType.ItemIndex = 0 then
      ECM_Type := 0
    else if cbECMType.ItemIndex = 1 then
      ECM_Type := 1
    else
      ECM_Type := 2;

    if cbxTARHMissiles.Checked then
      Jammer_TARH_Capable := 1
    else
      Jammer_TARH_Capable := 0;

    if cbxFireControlRadar.Checked then
      Jammer_SARH_Capable := 1
    else
      Jammer_SARH_Capable := 0;
  end;

  defensive_jammer.FNote.Notes := mmNotes.Lines.Text;
end;


procedure TfDefensiveJammer.TrackBarTypeAChange(Sender: TObject);
begin
  edtTypeA.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfDefensiveJammer.TrackBarTypeBChange(Sender: TObject);
begin
  edtTypeB.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfDefensiveJammer.TrackBarTypeCChange(Sender: TObject);
begin
  edtTypeC.Text := IntToStr((sender as TTrackBar).Position);
end;

end.
