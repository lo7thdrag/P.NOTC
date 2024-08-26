unit uMADWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Sensor;

type
  TMADForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblName: TStaticText;
    edtClass: TEdit;
    PageControl1: TPageControl;
    General: TTabSheet;
    lblAntenna: TStaticText;
    edtAssociatedCross: TEdit;
    lblFeetAntenna: TStaticText;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    txt1: TStaticText;
    edtBaselineDetection: TEdit;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure getData;
  public
    { Public declarations }
    MADObject : TMAD_Sensor_On_Board;
    isNew,isCopy     : Boolean;
  end;

var
  MADForm: TMADForm;

implementation

{$R *.dfm}

uses uDataModuleTTT, uMADPicklist;

procedure TMADForm.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    getData;
    dmTTT.insertMAD_Def(MADObject);
    isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateMAD_Def(MADObject,IntToStr(MADObject.FMAD_Def.MAD_Index));
  end;
end;

procedure TMADForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMADForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fMADPicklist.getMAD;
end;

procedure TMADForm.getData;
begin
  with MADObject.FMAD_Def do begin
    Class_Identifier    := edtClass.Text;
    Baseline_Detect_Range           := StrToFloat(edtBaselineDetection.Text);
    Known_Cross_Section := StrToFloat(edtAssociatedCross.Text);
  end;
end;

end.
