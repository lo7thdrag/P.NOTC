unit uFrozen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufDBEditor;

type
  TfrmFrozen = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFrozen: TfrmFrozen;

implementation

{$R *.dfm}

procedure TfrmFrozen.FormCreate(Sender: TObject);
begin
//  frmFrozen.Show;

//  frmFrozen.AlphaBlend := True;
//  frmFrozen.AlphaBlendValue := 230;

//  fDBEditor.Show;
//  fDBEditor.AlphaBlend := True;
//  fDBEditor.AlphaBlendValue := 230;

end;

procedure TfrmFrozen.FormShow(Sender: TObject);
begin
   frmFrozen.AlphaBlend := True;
  frmFrozen.AlphaBlendValue := 230;
  frmFrozen.Left := fDBEditor.Left;
  frmFrozen.Left := fDBEditor.Top;
  frmFrozen.Height := fDBEditor.Height;
  frmFrozen.Width := fDBEditor.Width;
end;

end.
