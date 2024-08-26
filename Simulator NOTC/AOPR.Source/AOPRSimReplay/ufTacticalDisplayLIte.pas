unit ufTacticalDisplayLIte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, ExtCtrls, ToolWin, ufmMapWindow;

type
  TForm1 = class(TForm)
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
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    View1: TMenuItem;
    Display1: TMenuItem;
    Tactical1: TMenuItem;
    Tote1: TMenuItem;
    mnFullScreen1: TMenuItem;
    Scale1: TMenuItem;
    Increase1: TMenuItem;
    Decrease1: TMenuItem;
    Zoom1: TMenuItem;
    Centre1: TMenuItem;
    Settings2: TMenuItem;
    OnHookedTrack2: TMenuItem;
    OnGameCentre1: TMenuItem;
    Pan1: TMenuItem;
    RangeRings1: TMenuItem;
    Settings1: TMenuItem;
    OnHookedTrack1: TMenuItem;
    Filters1: TMenuItem;
    Overrides1: TMenuItem;
    History1: TMenuItem;
    Hook1: TMenuItem;
    Next1: TMenuItem;
    Previous1: TMenuItem;
    rackTable1: TMenuItem;
    Add1: TMenuItem;
    Remove1: TMenuItem;
    AssumeControl1: TMenuItem;
    HookedTrack1: TMenuItem;
    CommandPlatform1: TMenuItem;
    Track1: TMenuItem;
    Characteristics1: TMenuItem;
    Domain1: TMenuItem;
    A1: TMenuItem;
    Surface1: TMenuItem;
    Subsurface1: TMenuItem;
    Land1: TMenuItem;
    General1: TMenuItem;
    IDentity1: TMenuItem;
    PlatformType1: TMenuItem;
    Propulsion1: TMenuItem;
    Edit1: TMenuItem;
    MErge1: TMenuItem;
    Split1: TMenuItem;
    Datalink1: TMenuItem;
    o1: TMenuItem;
    From1: TMenuItem;
    Number1: TMenuItem;
    Automatic1: TMenuItem;
    Manual1: TMenuItem;
    History2: TMenuItem;
    InitiateTMA1: TMenuItem;
    Sonobuoys1: TMenuItem;
    OperatingMode1: TMenuItem;
    Depth1: TMenuItem;
    Monitor1: TMenuItem;
    Destroy1: TMenuItem;
    Break1: TMenuItem;
    RangeControlandBlindZone1: TMenuItem;
    ClearforHookedTracks1: TMenuItem;
    ClearforAllTracks1: TMenuItem;
    Remove2: TMenuItem;
    ools1: TMenuItem;
    Cursor1: TMenuItem;
    Anchor1: TMenuItem;
    Origin1: TMenuItem;
    Select1: TMenuItem;
    SendEndPointExactly1: TMenuItem;
    Overlays1: TMenuItem;
    Formation1: TMenuItem;
    argetIntercept1: TMenuItem;
    argetPriorityA1: TMenuItem;
    Opotions1: TMenuItem;
    Help1: TMenuItem;
    Contents1: TMenuItem;
    About1: TMenuItem;
    pnlTop: TPanel;
    ToolBar1: TToolBar;
    tbtnFullScreen: TToolButton;
    cbSetScale: TComboBox;
    toolbtnDecreaseScale: TToolButton;
    toolbtnIncreaseScale: TToolButton;
    ToolButton3: TToolButton;
    toolbtnZoom: TToolButton;
    ToolBtnCentreOnHook: TToolButton;
    ToolBtnCentreOnGameCentre: TToolButton;
    ToolBtnPan: TToolButton;
    toolBtnFilterRangeRings: TToolButton;
    ToolBtnRangeRingsOnHook: TToolButton;
    ToolButton4: TToolButton;
    ToolBtnHookPrevious: TToolButton;
    ToolBtnHookNext: TToolButton;
    ToolButton5: TToolButton;
    cbAssumeControl: TComboBox;
    ToolBtnAssumeControlOfHook: TToolButton;
    tBtnGameFreeze: TToolButton;
    tbtnStartGame: TToolButton;
    tBtnDoubleSpeed: TToolButton;
    pnlMap: TPanel;
    fmMapWindow1: TfmMapWindow;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
