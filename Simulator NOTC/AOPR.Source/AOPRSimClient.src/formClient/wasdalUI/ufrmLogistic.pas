unit ufrmLogistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ufmLogisticCalculation;

type
  TfrmLogistic = class(TForm)
    fmLogisticCalculation1: TfmLogisticCalculation;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fmLogisticCalculation1btnUseTemplateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogistic: TfrmLogistic;

implementation

uses ufrmGeneraPfTools;

{$R *.dfm}

procedure TfrmLogistic.fmLogisticCalculation1btnUseTemplateClick(
  Sender: TObject);
begin
  fmLogisticCalculation1.ButtonHandleFormMiror(Sender);

end;

procedure TfrmLogistic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;

  if Assigned(frmGeneralPfTools) then
    frmGeneralPfTools.btnOther.Down := False;

end;

end.
