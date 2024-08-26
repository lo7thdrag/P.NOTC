unit ufrmRightToolsPlotter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzBmpBtn, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmRightToolsPlotter = class(TForm)
    imgShow: TImage;
    pnlContent: TPanel;
    imgBackground: TImage;
    btnKeyboard: TRzBmpButton;
    btnOverlayEditor: TRzBmpButton;
    btnPlotting: TRzBmpButton;
    procedure btnKeyboardClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOverlayEditorClick(Sender: TObject);
    procedure btnPlottingClick(Sender: TObject);
    procedure imgShowClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRightToolsPlotter: TfrmRightToolsPlotter;

implementation

uses ufTacticalDisplay, ufrmKeyboard;

{$R *.dfm}

procedure TfrmRightToolsPlotter.btnKeyboardClick(Sender: TObject);
begin
  frmKeyboard.Show;
end;

procedure TfrmRightToolsPlotter.btnOverlayEditorClick(Sender: TObject);
begin
  frmTacticalDisplay.btnOverlayClick(nil);
end;

procedure TfrmRightToolsPlotter.btnPlottingClick(Sender: TObject);
begin
  frmTacticalDisplay.btnPlottingClick(nil);
end;

procedure TfrmRightToolsPlotter.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmRightToolsPlotter.imgShowClick(Sender: TObject);
begin
  if pnlContent.Visible then pnlContent.Visible := False
  else pnlContent.Visible := True;
  BringToFront;
end;

end.
