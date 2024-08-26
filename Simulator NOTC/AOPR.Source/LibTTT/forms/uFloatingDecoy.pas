unit uFloatingDecoy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, uDBAsset_Countermeasure;

type
  TfFloatingDecoy = class(TForm)
    Panel1: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    lbl1: TLabel;
    edtClassFloatingDecoy: TEdit;
    Panel3: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    grbAcousticCross: TGroupBox;
    Label23: TLabel;
    Label26: TLabel;
    Notes: TTabSheet;
    mmNotes: TMemo;
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
    grbRadarCross: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edtFrontRadarCross: TEdit;
    edtSideRadarCross: TEdit;
    cbFrontRadarCross: TComboBox;
    cbSideRadarCross: TComboBox;
    Label2: TLabel;
    Label7: TLabel;
    edtFrontAcousticCross: TEdit;
    edtSideAcousticCross: TEdit;
    Bevel1: TBevel;
    Label9: TLabel;
    grbVisualCross: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    edtFrontVisualCross: TEdit;
    edtSideVisualCross: TEdit;
    Label5: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Bevel2: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edtLifetimeDuration: TEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure getData;
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    floating : TFloating_Decoy_On_Board;
    isCopy   : Boolean;
  end;

var
  fFloatingDecoy: TfFloatingDecoy;

implementation

{$R *.dfm}

uses uCountermeasuresSingleList, uDataModuleTTT;

procedure TfFloatingDecoy.btnApplyClick(Sender: TObject);
begin
  if fCountermeasureSingle.isNew then
  begin
    getData;
    dmTTT.insertFloating_Decoy_Def(floating);
    fCountermeasureSingle.isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateFloating_Decoy_Def(floating,IntToStr(floating.FFloatingDecoy_Def.Floating_Decoy_Index));
  end;
end;

procedure TfFloatingDecoy.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfFloatingDecoy.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fCountermeasureSingle.refresh;
end;

procedure TfFloatingDecoy.getData;
begin
  with floating.FFloatingDecoy_Def do begin
    Floating_Decoy_Identifier  := edtClassFloatingDecoy.Text;
    Length                     := StrToFloat(edtLengthDimensions.Text);
    Width                      := StrToFloat(edtWidththDimensions.Text);
    Height                     := StrToFloat(edtHeigthDimensions.Text);
    Front_Radar_Cross          := StrToFloat(edtFrontRadarCross.Text);
    Side_Radar_Cross           := StrToFloat(edtSideRadarCross.Text);
    Front_Visual_Cross         := StrToFloat(edtFrontVisualCross.Text);
    Side_Visual_Cross          := StrToFloat(edtSideVisualCross.Text);
    Front_Acoustic_Cross       := StrToFloat(edtFrontAcousticCross.Text);
    Side_Acoustic_Cross        := StrToFloat(edtSideAcousticCross.Text);
    Lifetime_Duration          := StrToFloat(edtLifetimeDuration.Text);

  end;

  floating.FNote.Notes := mmNotes.Lines.Text;
end;

end.
