unit uAcousticDecoy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TfAcousticDecoy = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    lbl1: TLabel;
    edtClassAcousticDecoy: TEdit;
    PageControl1: TPageControl;
    General: TTabSheet;
    Notes: TTabSheet;
    grbDecoyNoise: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edtDecoyNoise: TEdit;
    TrackBarDecoyNoise: TTrackBar;
    Label1: TLabel;
    grbProbOfHit: TGroupBox;
    btnEdtProbOfHit: TButton;
    mmNotes: TMemo;
    procedure TrackBarDecoyNoiseChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure getData;
  public
    { Public declarations }
    acoustic : TAcoustic_Decoy_On_Board;
    isCopy   : Boolean;
  end;

var
  fAcousticDecoy: TfAcousticDecoy;

implementation

{$R *.dfm}

uses uCountermeasuresSingleList, uDataModuleTTT;

procedure TfAcousticDecoy.btnApplyClick(Sender: TObject);
begin
  if fCountermeasureSingle.isNew then
  begin
    getData;
    dmTTT.insertAcoustic_Decoy_Def(acoustic);
    fCountermeasureSingle.isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateAcoustic_Decoy_Def(acoustic,IntToStr(acoustic.FAccousticDecoy_Def.Decoy_Index));
  end;
end;

procedure TfAcousticDecoy.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfAcousticDecoy.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fCountermeasureSingle.refresh;
end;

procedure TfAcousticDecoy.TrackBarDecoyNoiseChange(Sender: TObject);
begin
  edtDecoyNoise.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfAcousticDecoy.getData;
begin
  with acoustic.FAccousticDecoy_Def do begin
    Decoy_Identifier              := edtClassAcousticDecoy.Text;
    Acoustic_Intensity_Increase   := StrToFloat(edtDecoyNoise.Text);
  end;

  acoustic.FNote.Notes := mmNotes.Lines.Text;
end;

end.
