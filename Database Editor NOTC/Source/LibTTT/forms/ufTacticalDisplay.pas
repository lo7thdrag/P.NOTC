unit ufTacticalDisplay;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, OleCtrls, Menus,
  ToolWin, ImgList, uDBAssetObject, uDBAsset_Radar, uDBScenario, uDBAsset_Sonar,
  ActnMan, uSimObjects, tttData, uDBAsset_Sensor,
  uWaypointeditor, VrControls, VrWheel, uDetectedObject, uLaunchPlatform,
  ufmMapWindow, ufmOwnShip, ufmPlatformGuidance, ufmSensor, ufmControlled,
  ufmWeapon, ufmCounterMeasure, ufmFireControl, ufmEMCON;

type
  TfrmTacticalDisplay = class(TForm)
    pnlTop: TPanel;
    pnlLeft: TPanel;
    pnlMap: TPanel;
    pnlBottom: TPanel;
    HookContactInfoTraineeDisplay: TPageControl;
    tsHook: TTabSheet;
    tsDetails: TTabSheet;
    tsDetection: TTabSheet;
    tsIFF: TTabSheet;
    TacticalDisplayControlPanel: TPageControl;
    lvTrackTable: TListView;
    tsOwnShip: TTabSheet;
    tsPlatformGuidance: TTabSheet;
    tsSensor: TTabSheet;
    tsWeapon: TTabSheet;
    tsCounterMeasure: TTabSheet;
    tsFireControl: TTabSheet;
    tsEMCON: TTabSheet;
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
    lbAltitude: TLabel;
    lbFormation: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    StaticText1: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    lbTrackDetails: TLabel;
    Label11: TLabel;
    lbNameDetails: TLabel;
    lbClassDetails: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lbDomain: TLabel;
    Label15: TLabel;
    lbPropulsion: TLabel;
    lbIdentifier: TLabel;
    lbDoppler: TLabel;
    lbSonarClass: TLabel;
    lbTrackType: TLabel;
    lbTypeDetails: TLabel;
    lbMergeStatus: TLabel;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    lbTrackDetection: TLabel;
    Label16: TLabel;
    lbNameDetection: TLabel;
    lbClassDetection: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    lbFirstDetected: TLabel;
    Label20: TLabel;
    lbLastDetected: TLabel;
    lbOwner: TLabel;
    lbMonthFD: TLabel;
    lbMonthLastDetected: TLabel;
    lbYearFirstDetected: TLabel;
    lbYearLastDetected: TLabel;
    lbDetectionDetectionType: TLabel;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    lbDetectionType: TStaticText;
    lbTrackIff: TLabel;
    Label88: TLabel;
    lbNameIff: TLabel;
    lbClassIff: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    lbMode2Iff: TLabel;
    Label95: TLabel;
    lbMode1Iff: TLabel;
    lbMode3CIff: TLabel;
    lbMode3Iff: TLabel;
    lbMode4Iff: TLabel;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    tbtnFullScreen: TToolButton;
    ToolButton2: TToolButton;
    toolbtnDecreaseScale: TToolButton;
    toolbtnIncreaseScale: TToolButton;
    toolbtnZoom: TToolButton;
    ToolBtnCentreOnHook: TToolButton;
    ToolBtnCentreOnGameCentre: TToolButton;
    ToolButton8: TToolButton;
    ToolBtnPan: TToolButton;
    toolBtnFilterRangeRings: TToolButton;
    ToolBtnRangeRingsOnHook: TToolButton;
    ToolBtnHookPrevious: TToolButton;
    ToolBtnHookNext: TToolButton;
    ToolBtnAddToTrackTable: TToolButton;
    ToolButton15: TToolButton;
    ToolBtnRemoveFromTrackTable: TToolButton;
    ToolBtnAssumeControlOfHook: TToolButton;
    ToolButton18: TToolButton;
    ToolBtnEdit: TToolButton;
    ToolBtnTrackHistory: TToolButton;
    ToolButton21: TToolButton;
    cbAssumeControl: TComboBox;
    ToolBtnAddSonobuoy: TToolButton;
    ToolButton23: TToolButton;
    ToolBtnRemoveSonobuoy: TToolButton;
    ToolButton25: TToolButton;
    ToolBtnTransferSonobuoy: TToolButton;
    ToolButton27: TToolButton;
    ToolBtnFreeze: TToolButton;
    ToolBtn1x: TToolButton;
    ToolBtnDoubleSpeed: TToolButton;
    ToolButton31: TToolButton;
    ToolBtnFind: TToolButton;
    ToolBtnAnnotate: TToolButton;
    ToolBtnSnapshot: TToolButton;
    ToolButton35: TToolButton;
    ToolBtnAddPlatform: TToolButton;
    ToolBtnRemovePlatformOrTrack: TToolButton;
    ToolBtnFilterCursor: TToolButton;
    ToolBtnAnchorCursor: TToolButton;
    ToolBtnOptions: TToolButton;
    ToolBtnContents: TToolButton;
    Panel1: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    lbCourseHooked: TLabel;
    lbSpeedHooked: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    lbRangeRings: TLabel;
    Label64: TLabel;
    lblRangeScale: TLabel;
    Label66: TLabel;
    lbRangeAnchor: TLabel;
    Label68: TLabel;
    lbBearingAnchor: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label72: TLabel;
    lbLongitude: TLabel;
    lbLatitude: TLabel;
    lbY: TLabel;
    lbX: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    cbSetScale: TComboBox;
    StatusBar1: TStatusBar;
    ImageList2: TImageList;
    lbStatus: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label35: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    ToolButton42: TToolButton;
    ToolButton43: TToolButton;
    ToolButton44: TToolButton;
    ToolButton45: TToolButton;
    StaticText25: TStaticText;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    StaticText30: TStaticText;
    StaticText31: TStaticText;
    StaticText32: TStaticText;
    StaticText33: TStaticText;
    StaticText34: TStaticText;
    StaticText35: TStaticText;
    StaticText36: TStaticText;
    StaticText37: TStaticText;
    StaticText38: TStaticText;
    StaticText39: TStaticText;
    StaticText40: TStaticText;
    StaticText41: TStaticText;
    StaticText42: TStaticText;
    StaticText43: TStaticText;
    StaticText44: TStaticText;
    StaticText45: TStaticText;
    StaticText46: TStaticText;
    StaticText47: TStaticText;
    StaticText48: TStaticText;
    StaticText49: TStaticText;
    StaticText50: TStaticText;
    StaticText51: TStaticText;
    StaticText53: TStaticText;
    StaticText54: TStaticText;
    StaticText55: TStaticText;
    StaticText52: TStaticText;
    StaticText56: TStaticText;
    StaticText57: TStaticText;
    StaticText59: TStaticText;
    StaticText60: TStaticText;
    StaticText61: TStaticText;
    StaticText62: TStaticText;
    StaticText63: TStaticText;
    lbColor: TLabel;
    pmenuWeapon: TPopupMenu;
    fmMapWindow1: TfmMapWindow;
    fmOwnShip1: TfmOwnShip;
    fmPlatformGuidance1: TfmPlatformGuidance;
    fmSensor1: TfmSensor;
    fmWeapon1: TfmWeapon;
    fmCounterMeasure1: TfmCounterMeasure;
    fmFireControl1: TfmFireControl;
    fmEMCON1: TfmEMCON;
    procedure cbECMOperatingModeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvTrackTableSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ToolBtnPanClick(Sender: TObject);
    procedure cbSetScaleChange(Sender: TObject);
    procedure tbtnScaleDecreaseClick(Sender: TObject);
    procedure tbtnScaleIncreaseClick(Sender: TObject);
    procedure ToolBtnCentreOnHookClick(Sender: TObject);
    procedure OnHookedTrack2Click(Sender: TObject);
    procedure Settings2Click(Sender: TObject);
    procedure History2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure controlModeClick(Sender: TObject);
    procedure sbHideShowClick(Sender: TObject);
    procedure sbSonarBtnClick(Sender: TObject);
    procedure Activate1Click(Sender: TObject);
    procedure sbESMOnClisk(Sender: TObject);
    procedure tbtnFullScreenClick(Sender: TObject);
    procedure ToolBtnCentreOnGameCentreClick(Sender: TObject);
    procedure btnWaypointClick(Sender: TObject);
    procedure Select1Click(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Next1Click(Sender: TObject);
    procedure Previous1Click(Sender: TObject);
    procedure ToolBtnHookPreviousClick(Sender: TObject);
    procedure ToolBtnHookNextClick(Sender: TObject);
    procedure ToolBtnAddToTrackTableClick(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure ToolBtnRemoveFromTrackTableClick(Sender: TObject);
    procedure ToolBtnFilterCursorClick(Sender: TObject);
    
    procedure ToolBtnAnchorCursorClick(Sender: TObject);
    procedure Map2Exit(Sender: TObject);
    procedure toolBtnFilterRangeRingsClick(Sender: TObject);
    procedure ToolBtnRangeRingsOnHookClick(Sender: TObject);
    procedure toolbtnZoomClick(Sender: TObject);
    procedure ToolBtnOptionsClick(Sender: TObject);
    procedure cbAssumeControlChange(Sender: TObject);
    procedure Map2DblClick(Sender: TObject);
    procedure btnWeaponClick(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    procedure ToolBtnTrackHistoryClick(Sender: TObject);
    procedure OnVisualShowClick(Sender: TObject);
    procedure ToolBtnAddPlatformClick(Sender: TObject);
    procedure editControlSalvoSizeKeyPress(Sender: TObject; var Key: Char);
    procedure Map2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MapViewChanged(Sender: TObject);
    procedure fmWeapon1btnTargetSearchClick(Sender: TObject);
    procedure ToolBtnAssumeControlOfHookClick(Sender: TObject);
    private
      { Private declarations }
      isFullScreen: Boolean;
      isMouseLeftButtonDown: Boolean;
      isSelectedPIReadyOnMoving: Boolean;

      FAnchorFilterEnabled: Boolean;

      function FindTrackListByMember(const arg: string): TListItem;
      procedure UpdateTrackPlatform(Sender: TObject);
      procedure UpdateTrackListData;

      procedure UpdateOwnShipData(Sender: TObject);
      procedure UpdateHookedInfo(Sender: TObject);
      // procedure Update

      procedure UnselectAllTrackObject;
      procedure UncontrolledAllTrackObject;
      function SearchTrackObject(Sender: TObject): TDetectedObject;

    private
      isFirstUpdate: Boolean; // ini sementara untuk update data platform pertama kali
      isOnAnchorLine: Boolean;
      focused_sensor: TSimObject;
      focused_platform: TPlatform_Instance;
      focused_weapon: TSimObject;
      FOnUpdateAsset: TNotifyEvent;
      FControlledObject: TSimObject;
      FControlEmbarkedPlatform: Boolean;

      FMouseDown: Boolean;
      FMovedPI: TPlatform_Instance;

      procedure T3EventOnChange(eventType: TEventType; Sender: TObject);
      procedure InitOleVariant(var TheVar: OleVariant);
      function SearchObjectOnPoint(X, Y: double): TObject;
      procedure SetControlEmbarkedPlatform(const Value: Boolean);

    public
      { Public declarations }
      procedure SetRoleClient(rc: integer);
      procedure SetControlledPlatform(pit: TPlatform_Instance);
      procedure SetFocusedPlatform(pit: TPlatform_Instance);

      procedure setDefaultInterface(userLevel: word);

      procedure UpdateFormData(Sender: TObject);
      procedure Refresh_AssumeControl;

      procedure MapToolUsed(ASender: TObject; ToolNum: Smallint;
        X1, Y1, X2, Y2, Distance: double; Shift, Ctrl: WordBool;
        var EnableDefault: WordBool);
      procedure MapMouseMove(Sender: TObject; Shift: TShiftState;
        X, Y: integer);
      procedure MapMouseDown(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: integer);
      procedure MapMouseUp(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: integer);

      procedure DisplayGameTime(const gSpeed: single; const gTime: TDateTime);

      procedure Be_A_FullMap(const full: Boolean);

    public

      property ControlEmbarkedPlatform
        : Boolean read FControlEmbarkedPlatform write
        SetControlEmbarkedPlatform;
  end;

var
  frmTacticalDisplay: TfrmTacticalDisplay;

implementation

uses
  Math,
  uSimMgr_Client, uT3SimManager, uBaseCoordSystem,
  uPictureCentreControl, uTrackHistory,

  uCoordConvertor, uMapXHandler,
  uGameData_TTT,
  uDBAsset_Weapon, uRPLibrary;

{$R *.dfm}


var
  rMis: TRecCmd_LaunchMissile;
  rGun: TRecCmd_GunFire;

const
  CMin_Z = 0;
  CMax_Z = 14;

procedure TfrmTacticalDisplay.InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

function ZoomIndexToScale(const i: integer): double;
begin
  if i < -3 then
    result :=  0.125
  else
  if i > 14 then
    result := 2500.0
  else
    result := Power(2.0, (i-3));
end;

function FindClosestZoomIndex(const z: double): integer;
var i: integer;
begin
  result := 0;

  if z >= 2500 then
    result := CMax_Z
  else
  if z <= 0.125 then
    result := CMin_Z
  else begin
    i :=  Round(Log2(z));
    result := i + 3;
  end;
end;


function FixMapZoom(z: double): Double;
begin
  if z >= 1.0 then
    Result := Round(z)
  else
    Result := 0.001* Round(z * 1000);
end;


procedure TfrmTacticalDisplay.Activate1Click(Sender: TObject);
var
  p: TPlatform_Instance;
begin
  if lvTrackTable.ItemFocused = nil then
    exit;

  p := lvTrackTable.ItemFocused.Data;
  SetControlledPlatform(p);
end;


procedure TfrmTacticalDisplay.Be_A_FullMap(const full: Boolean);
begin
  // pnlTop.Visible  := yes;
  pnlLeft.Visible   := NOT full;
//  pnlBottom.Visible := NOT full;

  if full then
  begin
    WindowState := wsMaximized;
    BorderStyle := bsNone;
  end
  else  begin
    WindowState := wsNormal;
    BorderStyle := bsSingle;
  end;
end;

procedure TfrmTacticalDisplay.btnWaypointClick(Sender: TObject);
begin
  if SimMgrClient.OwnShipPlatform = nil then
    exit;

  frmWaypointEditor := TfrmWaypointEditor.Create(nil);
  frmWaypointEditor.HookedPlatform := SimMgrClient.OwnShipPlatform;
  frmWaypointEditor.Show;
  //
end;

procedure TfrmTacticalDisplay.btnWeaponClick(Sender: TObject);
var
  pt: TPoint;
begin
  GetCursorPos(pt);
  // pt.X := btnWeapon.Left + btnWeapon.Width + 1;
  // pt.Y := btnWeapon.Top ;
  // pt := ClientToScreen(pt);

  if pmenuWeapon.Items.Count > 0 then
    pmenuWeapon.Popup(pt.X, pt.Y);
end;

procedure TfrmTacticalDisplay.btnLaunchClick(Sender: TObject);
begin
  if not Assigned(frmLaunchPlaform) then
    frmLaunchPlaform := TfrmLaunchPlaform.Create(self);

  if FControlledObject <> nil then
  begin
    frmLaunchPlaform.PlatformInst := TPlatform_Instance(FControlledObject);
    frmLaunchPlaform.FormStyle := fsStayOnTop;
    frmLaunchPlaform.Show;
  end;
end;

procedure TfrmTacticalDisplay.cbAssumeControlChange(Sender: TObject);
var
  aObject: TObject;
begin

  try
    aObject := cbAssumeControl.Items.Objects[cbAssumeControl.ItemIndex];
    if aObject <> nil then
    begin
      UnselectAllTrackObject;
//      UncontrolledAllTrackObject;
      if aObject.ClassType = TPlatform_Instance then
      begin

        SetFocusedPlatform(TPlatform_Instance(aObject));
//        SetControlledPlatform(TPlatform_Instance(aObject));
      end;
    end;
  finally

  end;
  //
end;

procedure TfrmTacticalDisplay.cbECMOperatingModeChange(Sender: TObject);
begin
  { case lvECM.ItemIndex of
    0 : grbECMBarrage.BringToFront;
    1 : grbECMBarrage.BringToFront;
    2 : grbECMSpotNumber.BringToFront;
    3 : grbECMSpotTrack.BringToFront;
    end; }
end;

procedure TfrmTacticalDisplay.FormCreate(Sender: TObject);
var i : integer;
    pi: TPlatform_Instance;
    z : double;
begin
//  Map1.DoubleBuffered := true;
  fmMapWindow1.InitOnFormCreate;
  fmOwnShip1.InitCreate(self);
  fmPlatformGuidance1.InitCreate(self);
  fmSensor1.InitCreate(self);

  fmWeapon1.InitCreate(self);
  fmCounterMeasure1.InitCreate(self);
  fmFireControl1.InitCreate(self);
  fmEMCON1.InitCreate(self);

  FOnUpdateAsset := nil;
  FOnUpdateAsset := UpdateOwnShipData;

  lvTrackTable.DoubleBuffered := true;
  FAnchorFilterEnabled := false;

  FAnchorFilterEnabled := false;
  FControlEmbarkedPlatform := false;
  isSelectedPIReadyOnMoving := false;

  width := Screen.Monitors[0].width;
  height := Screen.Monitors[0].height;
  left := Screen.Monitors[0].left;
  top := Screen.Monitors[0].top;

  isFirstUpdate := true;
  isFullScreen := false;
  isMouseLeftButtonDown := false;
  isOnAnchorLine := false;


  focused_weapon := nil;

  cbSetScale.Items.Clear;

  for I := CMin_Z to CMax_Z do  begin
    z := ZoomIndexToScale(i);
    cbSetScale.Items.Add(FloatToStr(z));
  end;
//  cbSetScale.ItemIndex := 8;
//  cbSetScaleChange(cbSetScale);


  lblRangeScale.Caption := cbSetScale.Text;

  lvTrackTable.SortType := stText;
  TacticalDisplayControlPanel.TabIndex := 0;

  Show;
end;

procedure TfrmTacticalDisplay.FormShow(Sender: TObject);
begin
  // Be_A_FullMap(false);

end;

procedure TfrmTacticalDisplay.History2Click(Sender: TObject);
begin
  fTrackHistory.Show;
end;

procedure TfrmTacticalDisplay.lvTrackTableSelectItem
  (Sender: TObject; Item: TListItem; Selected: Boolean);
var
  pi: TPlatform_Instance;
  d: double;
  aObject: TDetectedObject;

begin
  // Hook

  if Item = nil then
    exit;

  UnselectAllTrackObject;

  pi := Item.Data;
  aObject := SearchTrackObject(pi);
  if aObject <> nil then
    aObject.Selected := true;

  SetFocusedPlatform(pi);
//  focused_platform := pi;
//  fmWeapon1.SetFocusedPlatform(focused_platform);

  lbTrackHook.Caption := pi.TrackID;
  lbNameHook.Caption := pi.InstanceName;
  lbClassHook.Caption := pi.Vehicle.FData.Vehicle_Identifier;
  if FControlledObject <> nil then
  begin

    d := CalcBearing(TPlatform_Instance(FControlledObject).PositionX,
      TPlatform_Instance(FControlledObject).PositionY, pi.PositionX,
      pi.PositionY);
    lbBearingHook.Caption := FormatFloat('000.0', d);

    d := CalcRange(TPlatform_Instance(FControlledObject).PositionX,
      TPlatform_Instance(FControlledObject).PositionY, pi.PositionX,
      pi.PositionY);
    lbRangeHook.Caption := FormatFloat('000.0', d);
  end;

  // lbRangeHook
  lbPositionHook1.Caption := formatDMS_long(pi.PositionX);
  lbPositionHook2.Caption := formatDMS_latt(pi.PositionY);
  lbCourseHook.Caption := FormatCourse(pi.Course);

  lbGround.Caption := FormatSpeed(pi.Speed);
  lbAltitude.Caption := FormatAltitude(pi.Altitude);
  // lbFormation         := skip

  // Details
  lbTrackDetails.Caption := pi.TrackID;
  lbNameDetails.Caption := pi.InstanceName;
  lbClassDetails.Caption := pi.Vehicle.FData.Vehicle_Identifier;
  // lbTypeDetails := skip

  lbDomain.Caption := pi.Domain;
  { lbPropulsion
    lbIdentifier }
  lbSonarClass.Caption := pi.SonarClass;
  { lbTrackType
    lbMergeStatus }

  // Detection
  lbTrackDetection.Caption := pi.TrackID;
  lbNameDetection.Caption := pi.InstanceName;
  lbClassDetection.Caption := pi.Vehicle.FData.Vehicle_Identifier;

  // IFF
  lbTrackIff.Caption := pi.TrackID;
  lbNameIff.Caption := pi.InstanceName;
  lbClassIff.Caption := pi.Vehicle.FData.Vehicle_Identifier;

  // OS
  // RefreshOwnShipTab(pi);

  // Platform Guidance
  // RefreshPlatformGuidanceTab(pi);

  // sensors
  // RefreshPlatformSensorsTab(pi);

  // weapons
  // RefreshPlatformWeaponsTab(pi);

  // ECM
  // RefreshPlatformECMTab(pi);
end;

procedure TfrmTacticalDisplay.Map2Click(Sender: TObject);
var pt: TPoint;
    mx, my: double;
    aObj: TObject;
    pi : TPlatform_Instance;
    det : TDetectedObject;
    i: integer;
begin
  GetCursorPos(pt);

  pt := fmMapWindow1.Map.ScreenToClient(pt);

  VConvertor.ConvertToMap(pt.X, pt.Y, mx, my);
  Label61.Caption := formatDMS_long(mx);
  Label59.Caption := formatDMS_latt(my);

  case fmMapWindow1.Map.CurrentTool of
    mtSelectObject: begin
      aObj := SearchObjectOnPoint(mx, my);
      if aObj <> nil then begin

        UnSelectAllTrackObject;
//        UncontrolledAllTrackObject;

        if aObj.ClassType = TPlatform_Instance then begin
            SetFocusedPlatform(TPlatform_Instance(aObj));
//            SetControlledPlatform(TPlatform_Instance(aObj));
        end
        else if (aObj.ClassType = TDetectedObject) then begin
          det := TDetectedObject(aObj);
          det.Selected := true;

          if (det.SimObject.ClassType = TPlatform_Instance) then begin
             SetFocusedPlatform(TPlatform_Instance(det.SimObject));
//             SetControlledPlatform(TPlatform_Instance(det.SimObject));

          end;

        end;

//        if Assigned(FControlledObject) then begin
//          UpdateHookedInfo(FControlledObject);
        if Assigned(focused_platform) then begin
          UpdateHookedInfo(focused_platform);

          ToolBtnTrackHistory.Down := TPlatform_Instance(FControlledObject)
            .ShowTrails;
        end;

        try
          i := cbAssumeControl.Items.IndexOfObject(FControlledObject);
          cbAssumeControl.ItemIndex := i;
        finally

        end;
      end;
    end;
    mtDeployPosition:
      begin
        frmRPLibrary.MapPositionX := mx;
        frmRPLibrary.MapPositionY := my;
        fmMapWindow1.Map.CurrentTool := mtSelectObject;
      end;
  end;
  fmMapWindow1.Map.Repaint;
end;

procedure TfrmTacticalDisplay.Map2DblClick(Sender: TObject);
var pt: TPoint;
    aObject: TObject;
   X, Y: double;
begin
  GetCursorPos(pt);
  pt := fmMapWindow1.Map.ScreenToClient(pt);

  VConvertor.ConvertToMap(pt.X, pt.Y, X, Y);

  aObject := SimMgrClient.FindNearestPlatform(X, Y, 5);

  if aObject <> nil then begin
    if SimMgrClient.ClientRole = crpInstruktur then begin

//      UnselectAllTrackObject;
//      SetFocusedPlatform(TPlatform_Instance(aObject));
        UncontrolledAllTrackObject;
        SetControlledPlatform(TPlatform_Instance(aObject));

    end
    else if SimMgrClient.ClientRole = crpCubicle then begin
      if SimMgrClient.isPIOnGroup(TPlatform_Instance(aObject)) then begin
//        UnselectAllTrackObject;
//        SetFocusedPlatform(TPlatform_Instance(aObject));

        UncontrolledAllTrackObject;
        SetControlledPlatform(TPlatform_Instance(aObject));
      end;
    end;

  end;
end;

{
procedure TfrmTacticalDisplay.Map2Click(Sender: TObject);
var
  pt: TPoint;
  mx, my: double;
  aObj: TObject;
  i: integer;
begin
  GetCursorPos(pt);

  pt := fmMapWindow1.Map.ScreenToClient(pt);

  VConvertor.ConvertToMap(pt.X, pt.Y, mx, my);
  Label61.Caption := formatDMS_long(mx);
  Label59.Caption := formatDMS_latt(my);

  case fmMapWindow1.Map.CurrentTool of
    mtSelectObject:
      begin
        aObj := SearchObjectOnPoint(mx, my);
        if aObj <> nil then
        begin

          UnselectAllTrackObject;

          case SimMgrClient.ClientRole of
            crpInstruktur:
              if aObj.ClassType = TPlatform_Instance then
              begin
                SetFocusedPlatform(TPlatform_Instance(aObj));

              end;
            crpCubicle:
              if (aObj.ClassType = TDetectedObject) and
                (TDetectedObject(aObj).SimObject.ClassType =
                  TPlatform_Instance) then
              begin
//                focused_platform := TPlatform_Instance
//                  (TDetectedObject(aObj).SimObject);
                SetFocusedPlatform(TPlatform_Instance
                  (TDetectedObject(aObj).SimObject));

                TDetectedObject(aObj).Selected := true;
              end
              else
              begin
//                focused_platform := TPlatform_Instance(aObj);
//                focused_platform.Selected := true;
                SetFocusedPlatform(TPlatform_Instance(aObj));
              end;
          end;
        end;

        if Assigned(focused_platform) then
        begin
          UpdateHookedInfo(focused_platform);
          ToolBtnTrackHistory.Down := TPlatform_Instance(focused_platform)
            .ShowTrails;
        end;

        try
          for i := 0 to cbAssumeControl.Items.Count - 1 do
          begin
            aObj := cbAssumeControl.Items.Objects[i];
            if focused_platform = aObj then
              break;
          end;
          cbAssumeControl.ItemIndex := i;
        finally

        end;
      end;
    mtDeployPosition:
      begin
        frmRPLibrary.MapPositionX := mx;
        frmRPLibrary.MapPositionY := my;
        fmMapWindow1.Map.CurrentTool := mtSelectObject;
      end;
  end;
  fmMapWindow1.Map.Repaint;
end;

procedure TfrmTacticalDisplay.Map2DblClick(Sender: TObject);
var pt: TPoint;
    aObject: TObject;
   X, Y: double;
begin
  GetCursorPos(pt);
  pt := fmMapWindow1.Map.ScreenToClient(pt);

  VConvertor.ConvertToMap(pt.X, pt.Y, X, Y);

  aObject := SimMgrClient.FindNearestPlatform(X, Y, 5);

  if SimMgrClient.ClientRole = crpInstruktur then
  begin
    if aObject <> nil then
    begin
      UnselectAllTrackObject;
      UncontrolledAllTrackObject;

      TPlatform_Instance(aObject).Controlled := true;
      TPlatform_Instance(aObject).Selected := true;

      SetControlledPlatform(TPlatform_Instance(aObject));
    end;
  end
  else if SimMgrClient.ClientRole = crpCubicle then
  begin
    if SimMgrClient.isPIOnGroup(TPlatform_Instance(aObject)) then
    begin
      UnselectAllTrackObject;
      UncontrolledAllTrackObject;

      TPlatform_Instance(aObject).Controlled := true;
      TPlatform_Instance(aObject).Selected := true;

      SetControlledPlatform(TPlatform_Instance(aObject));
    end;

  end;
end;

}
procedure TfrmTacticalDisplay.Map2Exit(Sender: TObject);
begin
  lbLongitude.Caption := '---';
  lbLatitude.Caption := '---';
end;

procedure TfrmTacticalDisplay.MapMouseDown
  (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  mx, my: double;
  tes: TPlatform_Instance;
begin
  VConvertor.ConvertToMap(X, Y, mx, my);

  if Button = mbRight then
  begin
    UnselectAllTrackObject;
    fmMapWindow1.Map.CurrentTool := mtSelectObject;
    focused_platform := nil;
    SetFocusedPlatform(nil);

  end;

  if Button = mbLeft then
  begin
    if FAnchorFilterEnabled then
      isMouseLeftButtonDown := true;
    if FAnchorFilterEnabled and isMouseLeftButtonDown then
    begin
      isOnAnchorLine := SimMgrClient.LineVisual.isPointOnLine(mx, my);
      if isOnAnchorLine then
      begin
        SimMgrClient.LineVisual.X2 := mx;
        SimMgrClient.LineVisual.Y2 := my;
      end;
    end;
  end;
  FMouseDown := Button = mbLeft;
  if FMouseDown then begin
    if (fmMapWindow1.Map.CurrentTool = mtSelectObject)
      and SimMgrClient.ISInstructor then begin

      if (focused_platform <> nil) and focused_platform.Selected then
      begin
        tes := SimMgrClient.FindNearestPlatform(mx, my, 5);
        if tes = focused_platform then
        begin
          FMovedPI := focused_platform;
          FMovedPI.BeginReposition;
        end;
      end;
    end

  end;
end;

procedure TfrmTacticalDisplay.MapMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: integer);
var
  mx, my: double;
  sX, sY, pX, pY: integer;
  long, lat: double;
begin
  VConvertor.ConvertToMap(X, Y, mx, my);
  lbLongitude.Caption := formatDMS_long(mx);
  lbLatitude.Caption := formatDMS_latt(my);

  if FAnchorFilterEnabled and isMouseLeftButtonDown then
  begin
    if isOnAnchorLine then
    begin
      SimMgrClient.LineVisual.X2 := mx;
      SimMgrClient.LineVisual.Y2 := my;
    end;
  end;

  long := SimMgrClient.GameEnvironment.FGameArea.Game_Centre_Long;
  lat := SimMgrClient.GameEnvironment.FGameArea.Game_Centre_Lat;

  VConvertor.ConvertToScreen(long, lat, sX, sY);
  // koordinat (0,0) di sX, sY --> pX dan pY koordinat cartesian dgn titik pusat (0,0);
  pX := X - sX;
  pY := Y - sY;

  lbX.Caption := IntToStr(pX) + ' X';
  lbY.Caption := IntToStr(pY) + ' Y';

  if (pX < 0) and (pY >= 0) then
    lbColor.Caption := 'Red'; // kuadran 1;
  if (pX >= 0) and (pY >= 0) then
    lbColor.Caption := 'White'; // kuadran 2;
  if (pX >= 0) and (pY < 0) then
    lbColor.Caption := 'Blue'; // kuadran 3;
  if (pX < 0) and (pY < 0) then
    lbColor.Caption := 'Green'; // kuadran 4;

  if FMouseDown and (fmMapWindow1.Map.CurrentTool = mtSelectObject)
    and SimMgrClient.ISInstructor and (FMovedPI <> nil) then
  begin

    FMovedPI.repositionTo(mx, my);

    SimMgrClient.netSend_CmdPlatform_Move
      (FMovedPI.FData.Platform_Instance_Index, CORD_ID_REPOS, mx, my);
  end;

{  if FMouseDown then
    fmMapWindow1.Map.Repaint;
}
end;

procedure TfrmTacticalDisplay.MapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  fmMapWindow1.Map.CurrentTool := mtSelectObject;
  isMouseLeftButtonDown := false;
  isOnAnchorLine := false;

  // rizky: repositon  isSelectedPIReadyOnMoving := false;

  if FMouseDown and (fmMapWindow1.Map.CurrentTool = mtSelectObject)
    and SimMgrClient.ISInstructor then
  begin
    if (FMovedPI <> nil) then
    begin
      FMovedPI.EndReposition;
      FMovedPI := nil;
    end;
  end;
{  FMouseDown := false;
  fmMapWindow1.Map.Repaint;
}
end;


procedure TfrmTacticalDisplay.MapToolUsed(ASender: TObject; ToolNum: Smallint;
  X1, Y1, X2, Y2, Distance: double; Shift, Ctrl: WordBool;
  var EnableDefault: WordBool);
//var z: double;
begin
{  if toolNum = miZoomInTool then begin
    z :=  FixMapZoom(VSimMap.FMap.Zoom);
    cbSetScale.Text       := FloatToStr(z);
    lblRangeScale.Caption := cbSetScale.Text;
  end;
}end;


procedure TfrmTacticalDisplay.Next1Click(Sender: TObject);
var
  index: integer;
  aObject: TDetectedObject;
begin
  if lvTrackTable.Items.Count > 0 then
  begin
    if lvTrackTable.ItemIndex = lvTrackTable.Items.Count - 1 then
    begin
      lvTrackTable.ItemIndex := 0;
    end
    else
      lvTrackTable.ItemIndex := lvTrackTable.ItemIndex + 1;

    aObject := SearchTrackObject
      (lvTrackTable.Items[lvTrackTable.ItemIndex].Data);
    if aObject <> nil then
    begin
      UnselectAllTrackObject;
      aObject.Selected := true;
    end;
  end;
end;



procedure TfrmTacticalDisplay.OnHookedTrack2Click(Sender: TObject);
begin
  if focused_platform.ClassType = TPlatform_Instance then
    VSimMap.SetMapCenter(focused_platform.PositionX, focused_platform.PositionY);
end;

procedure TfrmTacticalDisplay.Previous1Click(Sender: TObject);
var
  index: integer;
  aObject: TDetectedObject;
begin
  if lvTrackTable.Items.Count > 0 then
  begin
    if lvTrackTable.ItemIndex = 0 then
    begin
      lvTrackTable.ItemIndex := lvTrackTable.Items.Count - 1;
    end
    else
      lvTrackTable.ItemIndex := lvTrackTable.ItemIndex - 1;

    aObject := SearchTrackObject
      (lvTrackTable.Items[lvTrackTable.ItemIndex].Data);
    if aObject <> nil then
    begin
      UnselectAllTrackObject;
      aObject.Selected := true;
    end;
  end;
end;

procedure TfrmTacticalDisplay.sbESMOnClisk(Sender: TObject);
begin
  if Assigned(focused_sensor) and (focused_sensor.ClassType = TESM_On_Board)
    then
  begin
    with TESM_On_Board(focused_sensor) do
    begin

      case TSpeedButton(Sender).Tag of
        1:
          begin
            OperationalStatus := eosOn;

            if FControlledObject <> nil then

              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlledObject)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_ESM,
                FData.ESM_Instance_Index, CORD_ID_OperationalStatus, byte
                  (OperationalStatus));
          end;
        2:
          begin
            OperationalStatus := eosOff;

            if FControlledObject <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlledObject)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_ESM,
                FData.ESM_Instance_Index, CORD_ID_OperationalStatus, byte
                  (OperationalStatus));
          end;
        3:
          begin
            ShowBlindZone := true;
          end;
        4:
          begin
            ShowBlindZone := false;
          end;
      end;
    end;
  end;
end;

procedure TfrmTacticalDisplay.sbHideShowClick(Sender: TObject);
begin
  if Assigned(focused_sensor) and (focused_sensor.ClassType = TRadar_On_Board)
    then
  begin
    with TRadar_On_Board(focused_sensor) do
      case TSpeedButton(Sender).Tag of
        1:
          ShowRange := true;
        2:
          ShowRange := false;
        3:
          ShowBlindZone := true;
        4:
          ShowBlindZone := false;
        5:
          FShowScanSector := true;
        6:
          FShowScanSector := false;
        9:
          begin
            ControlMode := rcmSearchTrack;
            if FControlledObject <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlledObject)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_RADAR,
                FData.Radar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));

          end;
        10:
          begin
            ControlMode := rcmTrack;

            if FControlledObject <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlledObject)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_RADAR,
                FData.Radar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));
          end;
        11:
          begin
            ControlMode := rcmOff;

            if FControlledObject <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlledObject)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_RADAR,
                FData.Radar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));
          end;
      end;
  end;
end;

procedure TfrmTacticalDisplay.sbSonarBtnClick(Sender: TObject);
begin
  if Assigned(focused_sensor) and (focused_sensor.ClassType = TSonar_On_Board)
    then
    with TSonar_On_Board(focused_sensor) do
      case TSpeedButton(Sender).Tag of
        1:
          begin
            ControlMode := scmActive;
            if FControlledObject <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlledObject)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_SONAR,
                FData.Sonar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));

          end;
        2:
          begin
            ControlMode := scmPassive;
            if FControlledObject <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlledObject)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_SONAR,
                FData.Sonar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));

          end;
        3:
          begin
            ControlMode := scmOff;
            if FControlledObject <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlledObject)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_SONAR,
                FData.Sonar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));

          end;
        6:
          ShowRange := false;
        7:
          ShowRange := true;
        8:
          ShowBlindZone := false;
        9:
          ShowBlindZone := true;
      end;

end;

procedure TfrmTacticalDisplay.OnVisualShowClick(Sender: TObject);
begin
  if Assigned(focused_sensor) and (focused_sensor.ClassType =
      TVisual_Sensor_On_Board) then
    with TVisual_Sensor_On_Board(focused_sensor) do
      case TSpeedButton(Sender).Tag of
        1:
          ShowRange := true;
        2:
          ShowRange := false;
        3:
          ShowBlindZone := true;
        4:
          ShowBlindZone := false;
      end;
end;

function TfrmTacticalDisplay.SearchObjectOnPoint(X, Y: double): TObject;
var
  i: integer;
  aObject: TObject;
  isFound: Boolean;
  aX, aY, bX, bY: integer;
  range, pX, pY, dx, dy: double;
  isOnGroup: Boolean;
  aTemp: TPlatform_Instance;
begin
  aObject := nil;
  isFound := false;

  if SimMgrClient.OwnShipPlatform = nil then
    exit;

  VConvertor.ConvertToScreen(X, Y, aX, aY);

  if SimMgrClient.ClientRole = crpInstruktur then
  begin
    aObject := SimMgrClient.FindNearestPlatform(X, Y, 5);
    if aObject <> nil then
      isFound := true;
  end;

  if SimMgrClient.ClientRole = crpCubicle then
  begin

    aObject := SimMgrClient.FindNearestPlatform(X, Y, 5);
    isOnGroup := false;

    if (aObject <> nil) then
      isOnGroup := TPlatform_Instance(aObject).isOnGroup; // simMgrClient.isPIOnGroup(TPlatform_Instance(aObject));

    isFound := isOnGroup;

    if (aObject <> nil) and not isFound then
      isFound := SimMgrClient.OwnShipPlatform = TPlatform_Instance(aObject);

    if not isFound then
      // cari track / detected objects
      for i := 0 to SimMgrClient.OwnShipPlatform.DetectedObjects.ItemCount - 1
        do
      begin
        aObject := SimMgrClient.OwnShipPlatform.DetectedObjects.GetItem(i)
          as TDetectedObject;

        VConvertor.ConvertToScreen
          (TPlatform_Instance(TDetectedObject(aObject).SimObject).PositionX,
          TPlatform_Instance(TDetectedObject(aObject).SimObject).PositionY, bX,
          bY);

        range := sqrt(sqr(aX - bX) + sqr(aY - bY));
        if range < 5 { pixel } then
        begin
          isFound := true;
          break;
        end;
      end;
  end;

  if not isFound then
    aObject := nil;

  result := aObject;
end;

function TfrmTacticalDisplay.SearchTrackObject(Sender: TObject)
  : TDetectedObject;
var
  i: integer;
  aObject: TDetectedObject;
begin
  result := nil;
  if SimMgrClient.OwnShipPlatform = nil then
    exit;

  for i := 0 to SimMgrClient.OwnShipPlatform.DetectedObjects.ItemCount - 1 do
  begin
    aObject := SimMgrClient.OwnShipPlatform.DetectedObjects.GetItem(i)
      as TDetectedObject;

    if aObject.SimObject = Sender then
    begin
      result := aObject;
      break;
    end;
  end;

end;

procedure TfrmTacticalDisplay.Select1Click(Sender: TObject);
begin
  fmMapWindow1.Map.CurrentTool := mtSelectObject;
end;

procedure TfrmTacticalDisplay.SetControlledPlatform(pit: TPlatform_Instance);
var
  i, j: integer;
  pi: TPlatform_Instance;
begin
  if not Assigned(SimMgrClient) then
    exit;
//  if SimMgrClient.OwnShipPlatform = nil then
//    exit;
  SimMgrClient.OwnShipPlatform := pit;

  with SimMgrClient do
  begin

    for i := 0 to GroupMembers.Count - 1 do
    // for i := 0 to Platforms.ChildCount - 1 do
    begin
      // with Platforms.Childs[i] as TPlatform_Instance do
      with TPlatform_Instance(GroupMembers[i]) do
      begin
        Controlled := false;
        for j := 0 to Vehicle.Radars.Count - 1 do
          TRadar_On_Board(Vehicle.Radars[j]).OnT3Event := nil;
        for j := 0 to Vehicle.Sonars.Count - 1 do
          TSonar_On_Board(Vehicle.Sonars[j]).OnT3Event := nil;
        for j := 0 to Vehicle.Visualsensors.Count - 1 do
          TVisual_Sensor_On_Board(Vehicle.Visualsensors[j]).OnT3Event := nil;
        for j := 0 to Vehicle.ESMSensors.Count - 1 do
          TESM_On_Board(Vehicle.ESMSensors[j]).OnT3Event := nil;
      end;
    end;
  end;

  FControlledObject := SimMgrClient.OwnShipPlatform;
  if FControlledObject <> nil then
  begin

    TPlatform_Instance(FControlledObject).Controlled := true;
    TPlatform_Instance(FControlledObject).Activated := true;

    with TPlatform_Instance(FControlledObject) do
    begin
      for i := 0 to Vehicle.Radars.Count - 1 do
        TRadar_On_Board(Vehicle.Radars[i]).OnT3Event := T3EventOnChange;
      for i := 0 to Vehicle.Sonars.Count - 1 do
        TSonar_On_Board(Vehicle.Sonars[i]).OnT3Event := T3EventOnChange;
      for i := 0 to Vehicle.Visualsensors.Count - 1 do
        TVisual_Sensor_On_Board(Vehicle.Visualsensors[i]).OnT3Event :=
          T3EventOnChange;
      for i := 0 to Vehicle.ESMSensors.Count - 1 do
        TESM_On_Board(Vehicle.ESMSensors[i]).OnT3Event := T3EventOnChange;
    end;



    if TPlatform_Instance(FControlledObject)
      .Vehicle.Hosted_Platform.Count > 0 then
      fmOwnShip1.btnLaunch.Enabled := true
    else
      fmOwnShip1.btnLaunch.Enabled := false;

    fmOwnShip1.SetControlledObject(FControlledObject);
    fmOwnShip1.Refresh_OwnShipTab(FControlledObject);

    fmPlatformGuidance1.SetControlledObject(FControlledObject);
    fmPlatformGuidance1.Refresh_StraightLineTab(true);

    fmSensor1.SetControlledObject(FControlledObject);

    fmSensor1.RefreshPlatformSensorsTab(TPlatform_Instance(FControlledObject));

    fmWeapon1.SetControlledObject(FControlledObject);
    fmWeapon1.RefreshPlatformWeaponsTab(TPlatform_Instance(FControlledObject));

    fmCounterMeasure1.SetControlledObject(FControlledObject);
    fmCounterMeasure1.RefreshPlatformECMTab(TPlatform_Instance(FControlledObject));

  end;
end;

procedure TfrmTacticalDisplay.SetFocusedPlatform(pit: TPlatform_Instance);
begin
  focused_platform := pit;

  if focused_platform <> nil then begin
    focused_platform.Selected := true;
    UpdateHookedInfo(focused_platform);
  end;

  fmWeapon1.SetFocusedPlatform(pit);
end;

procedure TfrmTacticalDisplay.SetControlEmbarkedPlatform(const Value: Boolean);
begin
  FControlEmbarkedPlatform := Value;
end;

procedure TfrmTacticalDisplay.setDefaultInterface(userLevel: word);
begin

  { case userLevel of
    1: //trainee

    2: //instruct
    end; }
end;

procedure TfrmTacticalDisplay.SetRoleClient(rc: integer);
var
  i, index: integer;
  aTemp: TObject;
  pi: TPlatform_Instance;
begin
  case rc of
    crpInstruktur:
      begin
        ToolButton27.Show;
        ToolButton31.Show;
        ToolButton35.Show;
        ToolBtnAddPlatform.Show;
        ToolBtnFreeze.Show;
        ToolBtn1x.Show;
        ToolBtnDoubleSpeed.Show;
        ToolBtnAnnotate.Show;
        ToolBtnFind.Show;
        ToolBtnSnapshot.Show;

        cbAssumeControl.Items.Clear;

        index := -1;

        {
          for i := 0 to simMgrClient.Scenario.Platform_Insts.Count - 1 do begin
          aTemp := simMgrClient.Scenario.Platform_Insts[i];
          cbAssumeControl.Items.AddObject(
          TPlatform_Instance(aTemp).Vehicle.FData.Vehicle_Identifier,
          aTemp);
          if TPlatform_Instance(aTemp).FData.Platform_Instance_Index =
          simMgrClient.OwnShipPlatform.FData.Platform_Instance_Index then
          index := i;
          end;
        }

      end;
    crpCubicle:
      begin
        ToolButton27.Hide;
        ToolButton31.Hide;
        ToolButton35.Hide;
        ToolBtnAddPlatform.Hide;
        ToolBtnFreeze.Hide;
        ToolBtn1x.Hide;
        ToolBtnDoubleSpeed.Hide;
        ToolBtnAnnotate.Hide;
        ToolBtnFind.Hide;
        ToolBtnSnapshot.Hide;
      end;
  end;

  Refresh_AssumeControl;
end;

procedure TfrmTacticalDisplay.Settings2Click(Sender: TObject);
begin
  fPictureCentreSettings.Show;
end;

procedure TfrmTacticalDisplay.T3EventOnChange(eventType: TEventType;
  Sender: TObject);
begin
  case eventType of
    etSonarOperationalStatus:
      fmSensor1.RefreshPlatformSensorsTab(TPlatform_Instance(FControlledObject));
    etRadarOperationalStatus:
      fmSensor1.RefreshPlatformSensorsTab(TPlatform_Instance(FControlledObject));
  end;
end;

procedure TfrmTacticalDisplay.Timer1Timer(Sender: TObject);
begin
  fmMapWindow1.Map.Refresh;
end;

procedure TfrmTacticalDisplay.ToolBtnAddPlatformClick(Sender: TObject);
begin
  frmRPLibrary := TfrmRPLibrary.Create(self);
  frmRPLibrary.Show;
end;

procedure TfrmTacticalDisplay.ToolBtnAddToTrackTableClick(Sender: TObject);
begin
  Add1Click(Sender)
end;

procedure TfrmTacticalDisplay.ToolBtnAnchorCursorClick(Sender: TObject);
begin
  if focused_platform <> nil then
  begin
    if focused_platform.ClassType = TPlatform_Instance then
    begin
      SimMgrClient.LineVisual.X1 := TPlatform_Instance(focused_platform)
        .PositionX;
      SimMgrClient.LineVisual.Y1 := TPlatform_Instance(focused_platform)
        .PositionY;
    end;
  end;
end;

procedure TfrmTacticalDisplay.ToolBtnAssumeControlOfHookClick(Sender: TObject);
begin
  if focused_platform <> nil then begin
    SetControlledPlatform(focused_platform);
  end;

end;

procedure TfrmTacticalDisplay.ToolBtnCentreOnGameCentreClick(Sender: TObject);
var
  long, lat: double;
begin
  long := SimMgrClient.GameEnvironment.FGameArea.Game_Centre_Long;
  lat := SimMgrClient.GameEnvironment.FGameArea.Game_Centre_Lat;
  VSimMap.SetMapCenter(long, lat);

end;

procedure TfrmTacticalDisplay.ToolBtnCentreOnHookClick(Sender: TObject);
begin
  if (focused_platform <> nil) and
    (focused_platform.ClassType = TPlatform_Instance) then
    VSimMap.SetMapCenter(focused_platform.PositionX, focused_platform.PositionY);
end;


procedure TfrmTacticalDisplay.tbtnScaleDecreaseClick(Sender: TObject);
//: zoom out
var i: integer;
    z, zNow: Double;
begin
  zNow := FixMapZoom(VSimMap.FMap.Zoom);
  i := FindClosestZoomIndex(zNow);
  z := ZoomIndexToScale(i);

  if z <= zNow then
    i := i + 1;
  if i < 0      then i := 0;
  if i > CMax_Z then i := CMax_Z;

    // do the zoom out
  cbSetScale.ItemIndex := i;
  cbSetScaleChange(cbSetScale);

{
  if cbSetScale.ItemIndex > 0 then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex - 1;
    toolbtnIncreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if cbSetScale.ItemIndex = 0 then
    toolbtnDecreaseScale.Enabled := false
  else
    toolbtnDecreaseScale.Enabled := true;
}
end;


procedure TfrmTacticalDisplay.tbtnScaleIncreaseClick(Sender: TObject);
var i: integer;     //zoom in
    z, zNow: Double;
begin
  zNow := FixMapZoom(VSimMap.FMap.Zoom);
  i := FindClosestZoomIndex(zNow);
  z := ZoomIndexToScale(i);

  if z >= zNow then
    i := i - 1;
  if i < 0      then i := 0;
  if i > CMax_Z then i := CMax_Z;

    // do the zoom in
  cbSetScale.ItemIndex := i;
  cbSetScaleChange(cbSetScale);

end;
{
var i: integer;
begin
  if (cbSetScale.ItemIndex <= cbSetScale.Items.Count - 1) then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex + 1;
    toolbtnDecreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if (cbSetScale.ItemIndex = cbSetScale.Items.Count - 1) then
  // sampai batas akhir
    toolbtnIncreaseScale.Enabled := false
  else
    toolbtnIncreaseScale.Enabled := true;

end;

}
procedure TfrmTacticalDisplay.ToolBtnFilterCursorClick(Sender: TObject);
begin
  FAnchorFilterEnabled := not FAnchorFilterEnabled;

  ToolBtnFilterCursor.Down := FAnchorFilterEnabled;
  SimMgrClient.LineVisual.Visible := FAnchorFilterEnabled;
end;

procedure TfrmTacticalDisplay.toolBtnFilterRangeRingsClick(Sender: TObject);
var i: integer;
    rrVis: Boolean;
    z: Double;

begin
  rrVis := toolBtnFilterRangeRings.Down;

//  toolBtnFilterRangeRings.Down := FRangeRingVisible;
  if rrVis then begin
     z := FixMapZoom(VSimMap.FMap.Zoom);
     i := FindClosestZoomIndex(z);
     z := ZoomIndexToScale(i);
     SimMgrClient.RangeRing.Interval := 0.125 * z;
  end;
  SimMgrClient.RangeRing.Visible := rrVis;

end;

procedure TfrmTacticalDisplay.ToolBtnHookNextClick(Sender: TObject);
begin
  Next1Click(Sender);
end;

procedure TfrmTacticalDisplay.ToolBtnHookPreviousClick(Sender: TObject);
begin
  Previous1Click(Sender);
end;


procedure TfrmTacticalDisplay.ToolBtnOptionsClick(Sender: TObject);
begin
  if focused_platform <> nil then
    fmMapWindow1.Map.CurrentTool := mtAnchorTool;

  if fmMapWindow1.Map.CurrentTool = mtAnchorTool then
    fmMapWindow1.Map.CurrentTool := mtSelectObject;

end;

procedure TfrmTacticalDisplay.ToolBtnPanClick(Sender: TObject);
begin
  fmMapWindow1.Map.CurrentTool := miCenterTool;
end;

procedure TfrmTacticalDisplay.ToolBtnRangeRingsOnHookClick(Sender: TObject);
begin
  if focused_platform <> nil then
  begin
    if focused_platform.ClassType = TPlatform_Instance then
    begin
      SimMgrClient.RangeRing.mx := TPlatform_Instance(focused_platform)
        .PositionX;
      SimMgrClient.RangeRing.my := TPlatform_Instance(focused_platform)
        .PositionY;
    end;

  end;
end;

procedure TfrmTacticalDisplay.ToolBtnRemoveFromTrackTableClick(Sender: TObject);
begin
  Remove1Click(Sender);
end;

procedure TfrmTacticalDisplay.ToolBtnTrackHistoryClick(Sender: TObject);
begin
  if focused_platform <> nil then
  begin
    if focused_platform.ClassType = TPlatform_Instance then
    begin
      TPlatform_Instance(focused_platform).ShowTrails := not TPlatform_Instance
        (focused_platform).ShowTrails;
      ToolBtnTrackHistory.Down := TPlatform_Instance(focused_platform)
        .ShowTrails;
    end;
  end;
end;

procedure TfrmTacticalDisplay.toolbtnZoomClick(Sender: TObject);
begin
  fmMapWindow1.Map.CurrentTool := miZoomInTool;
end;

procedure TfrmTacticalDisplay.tbtnFullScreenClick(Sender: TObject);
begin

  if not isFullScreen then
  begin
    Be_A_FullMap(true);
    isFullScreen := true;

  end
  else
  begin
    Be_A_FullMap(false);
    isFullScreen := false;
  end;
  mnFullScreen1.Checked := isFullScreen;

end;

procedure TfrmTacticalDisplay.UncontrolledAllTrackObject;
var
  i: integer;
  aObject: TObject;
begin
  // cari track / detected objects
  // case simMgrClient.ClientRole  of
  // crpInstruktur :
  // begin
  for i := 0 to SimMgrClient.GroupMembers.Count - 1 do
    TPlatform_Instance(SimMgrClient.GroupMembers[i]).Controlled := false;
  // for i := 0 to SimMgrClient.Platforms.ChildCount - 1 do
  // (SimMgrClient.Platforms.Childs[i] as TPlatform_Instance).Controlled := false;
  // end;
  // crpCubicle    : {do nothing}
  // end;
end;

procedure TfrmTacticalDisplay.UnselectAllTrackObject;
var
  i: integer;
  aObject: TObject;
begin
  // cari track / detected objects
  TPlatform_Instance(FControlledObject).Selected := false;

  // case simMgrClient.ClientRole  of
  // crpInstruktur :
  // for i := 0 to SimMgrClient.Platforms.ChildCount - 1 do
  // (SimMgrClient.Platforms.Childs[i] as TPlatform_Instance).Selected := false;

  for i := 0 to SimMgrClient.GroupMembers.Count - 1 do
    TPlatform_Instance(SimMgrClient.GroupMembers[i]).Selected := false;
  // crpCubicle    :
  for i := 0 to SimMgrClient.OwnShipPlatform.DetectedObjects.ItemCount - 1
    do (SimMgrClient.OwnShipPlatform.DetectedObjects.GetItem(i)
        as TDetectedObject)
    .Selected := false;
  // end;

end;


procedure TfrmTacticalDisplay.UpdateFormData(Sender: TObject);
var i: integer;
    pi: TPlatform_Instance;

begin  // ini procedure update yg dipanggil dari sim client

  with (Sender as TT3SimManager) do
  begin

    if Assigned(FOnUpdateAsset) then
      FOnUpdateAsset(Sender);

  end;

  UpdateTrackListData;

  if (FControlledObject <> nil) and
    (FControlledObject is TPlatform_Instance) then begin

    pi := TPlatform_Instance(FControlledObject);

    i := TacticalDisplayControlPanel.ActivePageIndex;

    case i of
      0 :  // ownship
         fmOwnShip1.Refresh_OwnShipTab(pi);
      1: // guidance
         fmPlatformGuidance1.Refresh_VisibleTab();
//      2: //  ;
//         fmWeapon1.
      7:  // fmSensor1.Refresh_VisibleTab();
    end;
  end;

  if FAnchorFilterEnabled then
  begin
    lbRangeAnchor.Caption := FormatSpeed(SimMgrClient.LineVisual.range);
    lbBearingAnchor.Caption := FormatCourse(SimMgrClient.LineVisual.Bearing);
  end
  else
  begin
    lbRangeAnchor.Caption := '---';
    lbBearingAnchor.Caption := '---';
  end;

  lbRangeRings.Caption := FormatCourse(SimMgrClient.RangeRing.Interval);

  if FControlledObject <> nil then
  begin
    lbCourseHooked.Caption := FormatCourse
      (TPlatform_Instance(FControlledObject).Course);
    lbSpeedHooked.Caption := FormatSpeed(TPlatform_Instance(FControlledObject)
        .Speed);
  end
  else
  begin
    lbCourseHooked.Caption := '---';
    lbSpeedHooked.Caption := '---';
  end;
  // Caption := DateTimetoStr(
  // (Sender as TT3SimManager).GameTIME);
  DisplayGameTime(SimMgrClient.GameSpeed, SimMgrClient.GameTIME);
end;


procedure TfrmTacticalDisplay.UpdateHookedInfo(Sender: TObject);
var
  pi: TPlatform_Instance;
  d: double;
begin

  // ini perlu dicek lagi, gara2 konflik
  if not Assigned(Sender) then
    exit;
  if Sender.ClassType <> TPlatform_Instance then
    exit;

  pi := TPlatform_Instance(Sender);

  lbTrackHook.Caption := pi.TrackID;
  lbNameHook.Caption := pi.InstanceName;
  lbClassHook.Caption := pi.Vehicle.FData.Vehicle_Identifier;
  if FControlledObject <> nil then
  begin

    d := CalcBearing(TPlatform_Instance(FControlledObject).PositionX,
      TPlatform_Instance(FControlledObject).PositionY, pi.PositionX,
      pi.PositionY);
    lbBearingHook.Caption := FormatFloat('000.0', d);

    d := CalcRange(TPlatform_Instance(FControlledObject).PositionX,
      TPlatform_Instance(FControlledObject).PositionY, pi.PositionX,
      pi.PositionY);
    lbRangeHook.Caption := FormatFloat('000.0', d);
  end;

  // lbRangeHook
  lbPositionHook1.Caption := formatDMS_long(pi.PositionX);
  lbPositionHook2.Caption := formatDMS_latt(pi.PositionY);
  lbCourseHook.Caption := FormatCourse(pi.Course);

  lbGround.Caption := FormatSpeed(pi.Speed);
  lbAltitude.Caption := FormatAltitude(pi.Altitude);
  // lbFormation         := skip

  // Details
  lbTrackDetails.Caption := pi.TrackID;
  lbNameDetails.Caption := pi.InstanceName;
  lbClassDetails.Caption := pi.Vehicle.FData.Vehicle_Identifier;
  // lbTypeDetails := skip

  lbDomain.Caption := pi.Domain;
  { lbPropulsion
    lbIdentifier }
  lbSonarClass.Caption := pi.SonarClass;
  { lbTrackType
    lbMergeStatus }

  // Detection
  lbTrackDetection.Caption := pi.TrackID;
  lbNameDetection.Caption := pi.InstanceName;
  lbClassDetection.Caption := pi.Vehicle.FData.Vehicle_Identifier;

  // IFF
  lbTrackIff.Caption := pi.TrackID;
  lbNameIff.Caption := pi.InstanceName;
  lbClassIff.Caption := pi.Vehicle.FData.Vehicle_Identifier;

end;

procedure TfrmTacticalDisplay.UpdateOwnShipData(Sender: TObject);
var pi: TPlatform_Instance;
begin

  if FControlledObject = nil then
    exit;

  pi := TPlatform_Instance(FControlledObject);

  fmOwnShip1.Refresh_OwnShipTab(pi);

  lbCourseHooked.Caption := FormatCourse(pi.Course);
  lbSpeedHooked.Caption  := FormatSpeed(pi.Speed);

  Caption := 'Tactical Display - ' + SimMgrClient.Scenario.ScenarioName +
    ' - ' + TPlatform_Instance(FControlledObject)
    .InstanceName + ' on ' + SimMgrClient.CubicleName + ' - ' +
    SimMgrClient.ConsoleName;
end;


procedure TfrmTacticalDisplay.cbSetScaleChange(Sender: TObject);
var
  z: double;
  s: string;
begin
  if cbSetScale.ItemIndex < 0 then
    exit;
  s := cbSetScale.Items[cbSetScale.ItemIndex];
  try
    z := StrToFloat(s);
    VSimMap.SetMapZoom(z);
    lblRangeScale.Caption := cbSetScale.Text;
  finally

  end;
end;

procedure TfrmTacticalDisplay.controlModeClick(Sender: TObject);
begin
  TSpeedButton(Sender).Down := true;

  if Assigned(focused_platform) then
  begin

  end;
end;

procedure TfrmTacticalDisplay.editControlSalvoSizeKeyPress
  (Sender: TObject; var Key: Char);
var
  salvo: integer;
begin
  if not(Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;
  if Key = #13 then
  begin
    TryStrToInt(TEdit(Sender).Text, salvo);

    if focused_weapon = nil then
      exit;
    if focused_weapon.ClassType <> TGun_Definition then
      exit;

    TGun_Definition(focused_weapon).SalvoSize := salvo;
    rGun.SalvoSize := salvo;
  end;
end;


function TfrmTacticalDisplay.FindTrackListByMember(const arg: string)
  : TListItem;
var
  i: integer;
  f: Boolean;
  li: TListItem;
begin
  result := nil;

  f := false;
  i := 0;
  while not f and (i < lvTrackTable.Items.Count) do
  begin
    li := lvTrackTable.Items.Item[i];

    f := false;
    // f := SameText(li.Caption, arg);
    f := SameText(li.SubItems[1], arg);

    Inc(i);
  end;

  if f then
    result := li;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnTargetSearchClick(Sender: TObject);
begin
  fmWeapon1.btnTargetSearchClick(Sender);
//  fmFireControl1.setTarget()

end;

procedure TfrmTacticalDisplay.MapViewChanged(Sender: TObject);
var i: Integer;
    z: Double;
begin
  z :=  FixMapZoom(fmMapWindow1.Map.Zoom);
  cbSetScale.Text       := FloatToStr(z);
  lblRangeScale.Caption := cbSetScale.Text;

  i := FindClosestZoomIndex(z);

  toolbtnDecreaseScale.Enabled := i < CMax_Z;
  toolbtnIncreaseScale.Enabled := i > 0;


//  toolBtnFilterRangeRings.Down := FRangeRingVisible;
  if toolBtnFilterRangeRings.Down then begin
     i := FindClosestZoomIndex(z);
     z := ZoomIndexToScale(i);
     SimMgrClient.RangeRing.Interval := 0.125 * z;
  end;


  fmMapWindow1.Map.Repaint;
end;

procedure TfrmTacticalDisplay.UpdateTrackPlatform(Sender: TObject);
var
  i: integer;
  f: Boolean;
  s: string;
  li: TListItem;
  pi: TPlatform_Instance;
begin
  if Sender.ClassType <> TPlatform_Instance then
    exit;

  pi := Sender as TPlatform_Instance;
  // s := pi.FData.Track_ID;
  s := pi.FData.Instance_Name;
  li := FindTrackListByMember(s);

  if li = nil then
  begin
    li := lvTrackTable.Items.Add;
    li.Caption := pi.Domain;
    // li.SubItems.Add(pi.Domain); // pi.
    li.SubItems.Add(FormatTrackNumber(pi.TrackNumber));
    li.SubItems.Add(pi.InstanceName);
    li.SubItems.Add(FormatCourse(pi.Course));
    li.SubItems.Add(FormatSpeed(pi.Speed));
    if pi.Altitude >= 0 then  begin
      li.SubItems.Add(FormatAltitude(pi.Altitude));
      li.SubItems.Add(' ');
    end
    else begin
      li.SubItems.Add(' ');
      li.SubItems.Add(FormatAltitude(Abs(pi.Altitude)));
    end;
    li.Data := pi;
  end
  else
  begin
    // sudah ada.
    // li.SubItems.Clear;

    li.SubItems[0] := FormatTrackNumber(pi.TrackNumber);
    li.SubItems[1] := pi.InstanceName;
    li.SubItems[2] := FormatCourse(pi.Course);
    li.SubItems[3] := FormatSpeed(pi.Speed);
    if pi.Altitude >= 0 then begin
      li.SubItems[4] := FormatAltitude(pi.Altitude);
      li.SubItems[5] := ' ';
    end
    else begin
      li.SubItems[4] := ' ';
      li.SubItems[5] := FormatAltitude(pi.Altitude);
    end;

  end;
end;

procedure TfrmTacticalDisplay.UpdateTrackListData;
var i: Integer;
   li: TListItem;
   pi: TPlatform_Instance;
begin
  for i := 0 to lvTrackTable.Items.Count - 1 do begin
    li :=  lvTrackTable.Items[i];
    pi := li.Data;

    li.SubItems[0] := FormatTrackNumber(pi.TrackNumber);
    li.SubItems[1] := pi.InstanceName;
    li.SubItems[2] := FormatCourse(pi.Course);
    li.SubItems[3] := FormatSpeed(pi.Speed);

    if pi.Altitude >= 0 then begin
      li.SubItems[4] := FormatAltitude(pi.Altitude);
      li.SubItems[5] := ' ';
    end
    else begin
      li.SubItems[4] := ' ';
      li.SubItems[5] := FormatAltitude(pi.Altitude);
    end;


  end;
end;


procedure TfrmTacticalDisplay.Refresh_AssumeControl;
var
  i: integer;
  pi: TPlatform_Instance;
begin
  cbAssumeControl.Clear;
  cbAssumeControl.Items.Clear;

  for i := 0 to SimMgrClient.GroupMembers.Count - 1 do
  begin
    pi := SimMgrClient.GroupMembers[i];
    // cbAssumeControl.Items.AddObject(pi.Vehicle.FData.Vehicle_Identifier,  pi);
    cbAssumeControl.Items.AddObject(pi.InstanceName, pi);

    pi.Activated := true;
  end;

  if SimMgrClient.GroupMembers.Count = 0 then
    if Assigned(FControlledObject) then
    begin
      pi := TPlatform_Instance(FControlledObject);
      // cbAssumeControl.Items.AddObject(pi.Vehicle.FData.Vehicle_Identifier,  pi);
//      cbAssumeControl.Items.AddObject(pi.InstanceName, pi);
      cbAssumeControl.Items.AddObject(pi.FData.Track_ID, pi);

      pi.Activated := true;
    end;

  if SimMgrClient.GroupMembers.Count > 0 then
    cbAssumeControl.ItemIndex := 0;
end;


procedure TfrmTacticalDisplay.Add1Click(Sender: TObject);
begin
  if focused_platform <> nil then
  begin
    UpdateTrackPlatform(focused_platform);
  end;
  // if True then

end;

procedure TfrmTacticalDisplay.Remove1Click(Sender: TObject);
var s: string;
    li: TListItem;
begin

  if focused_platform <> nil then begin
    s := focused_platform.FData.Instance_Name;
    li := FindTrackListByMember(s);
    if li <> nil then
      li.Delete;
  end;
end;


procedure TfrmTacticalDisplay.DisplayGameTime(const gSpeed: single;
  const gTime: TDateTime);
var
  d: double;
  i: integer;
begin
  if abs(gSpeed) < 0.000001 then
    StatusBar1.Panels[9].Text := 'FROZEN'
  else
  begin
    if gSpeed < 1 then
    begin
      i := Round(1.0 / gSpeed);
      StatusBar1.Panels[9].Text := '1/' + IntToStr(i) + 'X';
    end
    else
      StatusBar1.Panels[9].Text := IntToStr(Round(gSpeed));

  end;

  StatusBar1.Panels[10].Text := FormatDateTime('ddhhnnss', gTime)
    + 'Z' + FormatDateTime('mmmyyyy', gTime);

end;

end.
