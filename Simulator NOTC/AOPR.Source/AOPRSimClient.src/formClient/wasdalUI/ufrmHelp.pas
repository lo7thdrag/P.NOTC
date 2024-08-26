unit ufrmHelp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzBmpBtn, ufrmKeyboard, StdCtrls,  ActiveX, ufrmTop, ufTacticalDisplay;

type
  TfrmHelp = class(TForm)
    btnKeyboard: TRzBmpButton;
    btnManualBook: TRzBmpButton;
    btnFullScreen: TRzBmpButton;
    btnWindowedScreen: TRzBmpButton;
    procedure btnKeyboardClick(Sender: TObject);
    procedure FormActive(Sender : TObject);
    procedure btnWindowedScreenClick(Sender: TObject);
    procedure btnFullScreenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmHelp: TfrmHelp;

implementation

{$R *.dfm}

procedure TfrmHelp.btnFullScreenClick(Sender: TObject);
begin
  frmTacticalDisplay.hideBottomPanel(sender);
  frmTop.hideTopPanel(sender);
end;

procedure TfrmHelp.btnWindowedScreenClick(Sender: TObject);
begin
  frmTacticalDisplay.hideBottomPanel(sender);
  frmTop.hideTopPanel(sender);
end;

procedure TfrmHelp.btnKeyboardClick(Sender: TObject);
begin
  frmKeyboard.Show;
end;

procedure TfrmHelp.FormActive(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

end.
