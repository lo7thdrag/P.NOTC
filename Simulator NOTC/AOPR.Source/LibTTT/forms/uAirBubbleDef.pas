unit uAirBubbleDef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TfAirBubble = class(TForm)
    Panel1: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    lbl1: TLabel;
    edtClassAirBubble: TEdit;
    Panel3: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    Notes: TTabSheet;
    mmNotes: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDissipationTime: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtAscentRate: TEdit;
    edtMaxAcousticCross: TEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure getData;
  private
    { Private declarations }
  public
    { Public declarations }
    air_bubble : TAir_Bubble_Mount;
    isCopy   : Boolean;
  end;

var
  fAirBubble: TfAirBubble;

implementation

{$R *.dfm}

uses uCountermeasuresSingleList, uDataModuleTTT;

procedure TfAirBubble.btnApplyClick(Sender: TObject);
begin
  if fCountermeasureSingle.isNew then
  begin
    getData;
    dmTTT.insertAir_Bubble_Def(air_bubble);
    fCountermeasureSingle.isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateAir_Bubble_Def(air_bubble,IntToStr(air_bubble.FAirBubble_Def.Air_Bubble_Index));
  end;
end;

procedure TfAirBubble.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfAirBubble.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fCountermeasureSingle.refresh;
end;

procedure TfAirBubble.getData;
begin
  with air_bubble.FAirBubble_Def do begin
    Air_Bubble_Identifier := edtClassAirBubble.Text;
    Max_Acoustic_Cross    := StrToFloat(edtMaxAcousticCross.Text);
    Dissipation_Time      := StrToFloat(edtDissipationTime.Text);
    Ascent_Rate           := StrToFloat(edtAscentRate.Text);
  end;

  air_bubble.FNote.Notes := mmNotes.Lines.Text;
end;

end.
