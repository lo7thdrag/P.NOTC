unit uSNRvsPOD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, newClassASTT;

type
  TfSnrVsPod = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtName: TEdit;
    btnEditList: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    btnOk: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure getData;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    POD : TPOD_vs_SNR_Curve_Definition;
    isNew : Boolean;
  end;

var
  fSnrVsPod: TfSnrVsPod;

implementation

{$R *.dfm}

uses uDataModuleTTT, uOtherSingleList;

procedure TfSnrVsPod.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    getData;
    dmTTT.InsertPOD_vs_SNR_Curve_Definition(POD);
    isNew := False;
  end
  else
  begin
    getData;
    dmTTT.UpdatePOD_vs_SNR_Curve_Definition(IntToStr(POD.FData.Curve_Definition_Index),POD);
  end;
end;

procedure TfSnrVsPod.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfSnrVsPod.btnOkClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fOtherSingle.refresh;
end;

procedure TfSnrVsPod.FormCreate(Sender: TObject);
begin
  POD := TPOD_vs_SNR_Curve_Definition.Create;
end;

procedure TfSnrVsPod.getData;
begin

  with POD.FData do
  begin
    Curve_Definition_Identifier := edtName.Text;
  end;

end;

end.
