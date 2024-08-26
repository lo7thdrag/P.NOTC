unit ufrmRightPlotter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Vcl.StdCtrls;

type
  TfrmRightPlotter = class(TForm)
    pnlContainer: TPanel;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  frmRightPlotter: TfrmRightPlotter;

implementation

uses
  ufrmRightToolsPlotter;

{$R *.dfm}

const
  cWidth = 186;

procedure TfrmRightPlotter.FormCreate(Sender: TObject);
begin
  Width := cWidth;

  frmRightToolsPlotter := TfrmRightToolsPlotter.Create(nil);
  frmRightToolsPlotter.Parent := pnlContainer;
  frmRightToolsPlotter.Align := alClient;
  frmRightToolsPlotter.Show;
end;

end.
