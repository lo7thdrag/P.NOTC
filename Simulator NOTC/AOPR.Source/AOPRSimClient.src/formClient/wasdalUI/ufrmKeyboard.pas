unit ufrmKeyboard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Keyboard, StdCtrls;

type
  TKeyboardPanel = class (TTouchKeyboard)
  protected
    procedure WndProc(var message : TMessage); override;
  end;
  TfrmKeyboard = class(TForm)
    procedure FormCreate(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
    fHandleOfTheTargetForm: HWND;
    keyPanel  :TKeyboardPanel;
  public
    { Public declarations }
    property HandleOfTheTargetForm: HWND read fHandleOfTheTargetForm write fHandleOfTheTargetForm;
  end;

var
  frmKeyboard: TfrmKeyboard;

implementation

{$R *.dfm}


{ TKeyboardPanel }

procedure TKeyboardPanel.WndProc(var message: TMessage);
begin
  if Assigned(frmKeyboard) then
  begin
    if frmKeyboard.HandleOfTheTargetForm <> 0 then
    begin
      SetForegroundWindow(frmKeyboard.HandleOfTheTargetForm);
    end;
  end;
  inherited;
end;

{ TfrmKeyboard }

procedure TfrmKeyboard.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    ExStyle   := ExStyle or WS_EX_NOACTIVATE;
    WndParent := GetDesktopwindow;
  end;
end;

procedure TfrmKeyboard.FormCreate(Sender: TObject);
begin
  HandleOfTheTargetForm := 0;
  keyPanel              := TKeyboardPanel.Create(Self);
  keyPanel.Parent       := Self;
  with keyPanel do
  begin
    Left          := 8;
    Top           := 8;
    Width         := 937;
    Height        := 268;
    GradientEnd   := clSilver;
    GradientStart := clGray;
    Layout        := 'Standard'
  end;
end;

end.
