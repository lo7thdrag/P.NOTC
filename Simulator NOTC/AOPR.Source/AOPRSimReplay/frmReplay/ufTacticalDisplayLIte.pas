unit ufTacticalDisplayLIte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, ExtCtrls, ToolWin, ufmMapWindow;

type
  TfrmTacticalDisplay = class(TForm)
    pnlLeft: TPanel;
    HookContactInfoTraineeDisplay: TPageControl;
    tsHook: TTabSheet;
    lbTrackHook: TLabel;
    Label1: TLabel;
    lbNameHook: TLabel;
    lbClassHook: TLabel;
    Label2: TLabel;
    lbBearingHook: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbRangeHook: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbPositionHook1: TLabel;
    lbCourseHook: TLabel;
    lbPositionHook2: TLabel;
    lbGround: TLabel;
    lbFormation: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbDamage: TLabel;
    lb8: TLabel;
    StaticText1: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText16: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    pnlDepth: TPanel;
    lbDepth: TLabel;
    lb2: TLabel;
    lbtext3: TStaticText;
    lb1: TStaticText;
    pnlAltitude: TPanel;
    lb4: TLabel;
    lbAltitude: TLabel;
    lb6: TStaticText;
    lb5: TStaticText;
    lb7: TStaticText;
    lb3: TStaticText;
    pnlMap: TPanel;
    fmMapWindow1: TfmMapWindow;
    procedure FormCreate(Sender: TObject);
  private
    FFullScreen: boolean;
    procedure SetFullScreen(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    property FullScreen : boolean read FFullScreen write SetFullScreen;
  end;

var
  frmTacticalDisplay: TfrmTacticalDisplay;

implementation

{$R *.dfm}

procedure TfrmTacticalDisplay.FormCreate(Sender: TObject);
begin
  fmMapWindow1.InitOnFormCreate;
  FormStyle   := fsNormal;
  BorderStyle := bsNone;
  WindowState := wsMaximized;
end;

procedure TfrmTacticalDisplay.SetFullScreen(const Value: boolean);
begin
  FFullScreen := Value;
  pnlLeft.Visible := NOT FFullScreen;
end;

end.
