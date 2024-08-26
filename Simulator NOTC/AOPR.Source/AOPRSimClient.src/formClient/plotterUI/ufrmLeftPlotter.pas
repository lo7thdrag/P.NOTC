unit ufrmLeftPlotter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Vcl.StdCtrls;

type
  TfrmLeftPlotter = class(TForm)
    pnlContainer: TPanel;
    procedure FormCreate(Sender: TObject);

  private

  public


  end;

var
  frmLeftPlotter: TfrmLeftPlotter;

implementation

uses
  ufrmLeftToolsPlotter;

{$R *.dfm}

{ TfrmRight }

const
  cWidth = 186;

procedure TfrmLeftPlotter.FormCreate(Sender: TObject);
begin
  Width := cWidth;

  frmLeftToolsPlotter := TfrmLeftToolsPlotter.Create(nil);
  frmLeftToolsPlotter.Parent := pnlContainer;
  frmLeftToolsPlotter.Align := alClient;
  frmLeftToolsPlotter.Show;
end;

end.
