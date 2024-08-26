unit uChaffDecoy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TfChaff = class(TForm)
    Panel1: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    lbl1: TLabel;
    edtClassChaff: TEdit;
    Panel3: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtDissipationTimein100kt: TEdit;
    edtDescentRate: TEdit;
    edtMaxBloom: TEdit;
    Notes: TTabSheet;
    mmNotes: TMemo;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edtMaxRadarCross: TEdit;
    edtBloomTime: TEdit;
    edtDissipationTimeinStillAir: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtMaxRadarAttenuation: TEdit;
    cbMaxRadar: TComboBox;
    grbRadarFreq: TGroupBox;
    Label12: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edtLowerLimit: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edtUpperLimit: TEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure getData;
  private
    { Private declarations }
  public
    { Public declarations }
    chaff : TChaff_On_Board;
    isCopy   : Boolean;
  end;

var
  fChaff: TfChaff;

implementation

{$R *.dfm}

uses uCountermeasuresSingleList, uDataModuleTTT;

procedure TfChaff.btnApplyClick(Sender: TObject);
begin
  if fCountermeasureSingle.isNew then
  begin
    getData;
    dmTTT.insertChaff_Def(chaff);
    fCountermeasureSingle.isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateChaff_Def(chaff,IntToStr(chaff.FChaff_Def.Chaff_Index));
  end;
end;

procedure TfChaff.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfChaff.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fCountermeasureSingle.refresh;
end;

procedure TfChaff.getData;
begin
  with chaff.FChaff_Def do begin
    Chaff_Identifier        := edtClassChaff.Text;
    Max_Radar_Cross         := StrToFloat(edtMaxRadarCross.Text);
    Bloom_Time              := StrToInt(edtBloomTime.Text);
    Max_Dissipation_Time    := StrToInt(edtDissipationTimeinStillAir.Text);
    Min_Dissipation_Time    := StrToInt(edtDissipationTimein100kt.Text);
    Descent_Rate            := StrToFloat(edtDescentRate.Text);
    Max_Radius              := StrToFloat(edtMaxBloom.Text);
    Max_Radar_Attenuation   := StrToFloat(edtMaxRadarAttenuation.Text);
    Radar_Affect_Lower_Freq := StrToFloat(edtLowerLimit.Text);
    Radar_Affect_Upper_Freq := StrToFloat(edtUpperLimit.Text);

  end;

  chaff.FNote.Notes := mmNotes.Lines.Text;
end;


end.
