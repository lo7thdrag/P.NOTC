unit ufmEmbarkQuantityInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmEmbarkQuantityInput = class(TForm)
    Label23: TLabel;
    edtQuantity: TEdit;
    btnOK: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtQuantityKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
    IsClose : Boolean;
  end;

var
  fmEmbarkQuantityInput: TfmEmbarkQuantityInput;

implementation

{$R *.dfm}

procedure TfmEmbarkQuantityInput.btnOKClick(Sender: TObject);
begin
  if StrToInt(edtQuantity.Text) < 1 then
   ShowMessage('Quantity must be greater than 0')
  else
  begin
    IsClose := False;
    Close;
  end;


end;

procedure TfmEmbarkQuantityInput.edtQuantityKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;
end;

procedure TfmEmbarkQuantityInput.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Exit
end;



end.
