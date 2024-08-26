unit ufmEmbarkTrackIDInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmEmbarkTrackIDInput = class(TForm)
    btnOk: TButton;
    lblTrackID: TLabel;
    edtTrackID: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure edtTrackIDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    IsClose : Boolean;
  end;

var
  fmEmbarkTrackIDInput: TfmEmbarkTrackIDInput;

implementation

{$R *.dfm}

procedure TfmEmbarkTrackIDInput.btnOkClick(Sender: TObject);
begin
  IsClose := False;
  Close;
end;

procedure TfmEmbarkTrackIDInput.edtTrackIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Length(edtTrackID.Text) >= 5 then
  begin
    if not (Key = #8) then
      Key := #0;
  end;
end;

end.
