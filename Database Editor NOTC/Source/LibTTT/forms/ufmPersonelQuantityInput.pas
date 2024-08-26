unit ufmPersonelQuantityInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmPersonelQuantityInput = class(TForm)
    Label23: TLabel;
    edtQuantity: TEdit;
    btnOK: TButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPersonelQuantityInput: TfmPersonelQuantityInput;

implementation

{$R *.dfm}

procedure TfmPersonelQuantityInput.btnOKClick(Sender: TObject);
begin
  if StrToInt(edtQuantity.Text) < 1 then
  begin
    ShowMessage('Quantity must be greater than 0');
    Exit
  end
  else if StrToInt(edtQuantity.Text) > 13 then
  begin
    ShowMessage('Quantity must be less than 14');
    Exit
  end
  else
  begin
    ModalResult := mrOk;
  end;
end;

end.
