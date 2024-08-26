unit ufToteDisplay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, ExtCtrls, Grids, Buttons, uDBAssetObject,
  xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TfrmToteDisplay = class(TForm)
    MainMenu1: TMainMenu;
    View1: TMenuItem;
    Hook1: TMenuItem;
    rack1: TMenuItem;
    ools1: TMenuItem;
    Help1: TMenuItem;
    FullScreen1: TMenuItem;
    Scale1: TMenuItem;
    Centre1: TMenuItem;
    RangeRings1: TMenuItem;
    Filters1: TMenuItem;
    Overrides1: TMenuItem;
    History1: TMenuItem;
    Increase1: TMenuItem;
    Decrease1: TMenuItem;
    Zoom1: TMenuItem;
    Settings1: TMenuItem;
    OnHookedTrack1: TMenuItem;
    Settings2: TMenuItem;
    OnHookedTrack2: TMenuItem;
    OnGameCentre1: TMenuItem;
    Pan1: TMenuItem;
    Next1: TMenuItem;
    Previous1: TMenuItem;
    rackTable1: TMenuItem;
    AssumeControl1: TMenuItem;
    Add1: TMenuItem;
    Remove1: TMenuItem;
    HookedTrack1: TMenuItem;
    CommandPlatform1: TMenuItem;
    Characteristics1: TMenuItem;
    Domain1: TMenuItem;
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
    Contents1: TMenuItem;
    About1: TMenuItem;
    A1: TMenuItem;
    Surface1: TMenuItem;
    Subsurface1: TMenuItem;
    Land1: TMenuItem;
    General1: TMenuItem;
    StatusBar1: TStatusBar;
    Display1: TMenuItem;
    Tactical1: TMenuItem;
    Tote1: TMenuItem;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    CategoryPanel3: TCategoryPanel;
    CategoryPanel4: TCategoryPanel;
    btnPlatformStatus: TSpeedButton;
    btnEnviroStatus: TSpeedButton;
    btnWeaponEngagement: TSpeedButton;
    btnPlatformRemoval: TSpeedButton;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label88: TLabel;
    btnSurfaceToAir: TSpeedButton;
    Label122: TLabel;
    btnSurfaceToSurface: TSpeedButton;
    Label123: TLabel;
    btnCommInterfecene: TSpeedButton;
    Label124: TLabel;
    btnCommMapping: TSpeedButton;
    Label125: TLabel;
    btnCommDefinition: TSpeedButton;
    Label126: TLabel;
    btnMessageHandling: TSpeedButton;
    btnDatalinkControl: TSpeedButton;
    Label127: TLabel;
    btnAudioRecord: TSpeedButton;
    Label128: TLabel;
    Label153: TLabel;
    btnCubicleGroups: TSpeedButton;
    Label1: TLabel;
    btnEnviroControl: TSpeedButton;
    Label155: TLabel;
    btnSensorOverride: TSpeedButton;
    Label156: TLabel;
    btnSetting: TSpeedButton;
    gbAudioRecordTracks: TPanel;
    Panel14: TPanel;
    Panel40: TPanel;
    Panel65: TPanel;
    Label150: TLabel;
    Panel66: TPanel;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    Panel67: TPanel;
    StringGrid18: TStringGrid;
    TabSheet7: TTabSheet;
    Panel68: TPanel;
    StringGrid19: TStringGrid;
    Panel41: TPanel;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Panel42: TPanel;
    Panel69: TPanel;
    Label149: TLabel;
    SpeedButton19: TSpeedButton;
    Edit7: TEdit;
    Panel70: TPanel;
    Label151: TLabel;
    Panel71: TPanel;
    StringGrid17: TStringGrid;
    Panel72: TPanel;
    Label152: TLabel;
    Panel73: TPanel;
    StringGrid16: TStringGrid;
    gbCommunicationsChannelDefinition: TPanel;
    Panel9: TPanel;
    Panel24: TPanel;
    StringGrid8: TStringGrid;
    gbCommunicationsChannelMapping: TPanel;
    Panel10: TPanel;
    Panel35: TPanel;
    Panel57: TPanel;
    StringGrid9: TStringGrid;
    Panel58: TPanel;
    Label129: TLabel;
    SpeedButton13: TSpeedButton;
    Edit2: TEdit;
    Panel59: TPanel;
    Label130: TLabel;
    Panel36: TPanel;
    Button25: TButton;
    Button26: TButton;
    Panel37: TPanel;
    Panel60: TPanel;
    Label131: TLabel;
    Panel62: TPanel;
    StringGrid10: TStringGrid;
    gbCommunicationsInterference: TPanel;
    Panel11: TPanel;
    Panel32: TPanel;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    Panel53: TPanel;
    StringGrid11: TStringGrid;
    TabSheet5: TTabSheet;
    Label133: TLabel;
    Bevel11: TBevel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    TrackBar10: TTrackBar;
    TrackBar11: TTrackBar;
    TrackBar12: TTrackBar;
    gbCubicleGroups: TPanel;
    Panel15: TPanel;
    Panel38: TPanel;
    Panel64: TPanel;
    Panel39: TPanel;
    PageControl3: TPageControl;
    TabSheet8: TTabSheet;
    Panel63: TPanel;
    tvCubicleGroups: TTreeView;
    TabSheet9: TTabSheet;
    Label157: TLabel;
    StringGrid23: TStringGrid;
    Button36: TButton;
    Button37: TButton;
    gbDatalinkControl: TPanel;
    Panel12: TPanel;
    Panel29: TPanel;
    StringGrid12: TStringGrid;
    Panel93: TPanel;
    Label141: TLabel;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    Label144: TLabel;
    SpeedButton18: TSpeedButton;
    Label148: TLabel;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Panel94: TPanel;
    Label142: TLabel;
    Panel95: TPanel;
    Panel30: TPanel;
    Button27: TButton;
    Button28: TButton;
    Panel31: TPanel;
    StringGrid13: TStringGrid;
    Panel96: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Button31: TButton;
    Panel97: TPanel;
    Label143: TLabel;
    gbEnvironmentControl: TPanel;
    Panel16: TPanel;
    Panel22: TPanel;
    Panel54: TPanel;
    Panel23: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Button40: TButton;
    Button41: TButton;
    Panel92: TPanel;
    pcEnvironmentControl: TPageControl;
    tsAboveWater: TTabSheet;
    GroupBox6: TGroupBox;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    lblEnviCtrlSunrise: TLabel;
    Label173: TLabel;
    lblEnviCtrlSunset: TLabel;
    Label175: TLabel;
    lblEnviCtrlPeriodTwilight: TLabel;
    edtDayVis: TEdit;
    edtNightVis: TEdit;
    trbDaytimeVisual: TTrackBar;
    trbNighttimeVisual: TTrackBar;
    trbDaytimeInfra: TTrackBar;
    trbNighttimeInfra: TTrackBar;
    edtNightInfra: TEdit;
    edtDayInfra: TEdit;
    GroupBox7: TGroupBox;
    Label177: TLabel;
    Label178: TLabel;
    Label179: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    Label182: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    edtAttenRainRate: TEdit;
    edtAttenCloud: TEdit;
    trbAttenRainRate: TTrackBar;
    trbAttenCloud: TTrackBar;
    edtAirTemp: TEdit;
    edtBarometricPressure: TEdit;
    edtCloudBaseHeight: TEdit;
    GroupBox8: TGroupBox;
    Label185: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label192: TLabel;
    edtAtmRefract: TEdit;
    trbAtmRefract: TTrackBar;
    GroupBox5: TGroupBox;
    Label163: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    Label166: TLabel;
    edtWindDir: TEdit;
    edtWindSpeed: TEdit;
    tsSurface: TTabSheet;
    Label194: TLabel;
    Label195: TLabel;
    Label188: TLabel;
    Label212: TLabel;
    Label213: TLabel;
    Label214: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    Label217: TLabel;
    Label218: TLabel;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label223: TLabel;
    GroupBox11: TGroupBox;
    Label158: TLabel;
    Label191: TLabel;
    Label193: TLabel;
    Label196: TLabel;
    edtOceanCurrentDirection: TEdit;
    edtOceanCurrentSpeed: TEdit;
    cbxShippingRate: TComboBox;
    edtDepthTermalLayer: TEdit;
    GroupBox12: TGroupBox;
    Label197: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    Label200: TLabel;
    Label201: TLabel;
    Label202: TLabel;
    edtSpeedOfSoundSurface: TEdit;
    edtSpeedOfSoundlayer: TEdit;
    edtSpeedOfSoundBottom: TEdit;
    GroupBox2: TGroupBox;
    Label203: TLabel;
    SpeedButton25: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    GroupBox13: TGroupBox;
    Label204: TLabel;
    Label205: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    edtSurfaceDuctLow: TEdit;
    edtSurfaceDuctUp: TEdit;
    GroupBox14: TGroupBox;
    Label208: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    Label211: TLabel;
    edtSubSurfaceDuctLow: TEdit;
    edtSubSurfaceDuctUp: TEdit;
    trbSeaState: TTrackBar;
    edtSeaState: TEdit;
    edtBottomLost: TEdit;
    trbBottomLost: TTrackBar;
    edtShadowZone: TEdit;
    edtAvgOceanDepth: TEdit;
    edtSurfaceTemperatur: TEdit;
    cbxConvergenceZone: TCheckBox;
    tsBoundary: TTabSheet;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    gbEnvironmentStatus: TPanel;
    Panel3: TPanel;
    Panel21: TPanel;
    Label81: TLabel;
    Bevel1: TBevel;
    Label82: TLabel;
    Bevel2: TBevel;
    Label83: TLabel;
    Label84: TLabel;
    Bevel3: TBevel;
    Label85: TLabel;
    lblSpeedWIndTrue: TLabel;
    lblDirectionWindTrue: TLabel;
    lblWindRelativeDirection: TLabel;
    Label87: TLabel;
    lblWindRelativeSpeed: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    lblVisibilityFactorsElectroOptical: TLabel;
    Label94: TLabel;
    lblAttenuationFactorsCloud: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    lblVisibilityactorsTime: TLabel;
    Label99: TLabel;
    lblAttenuationFactorsRain: TLabel;
    Label101: TLabel;
    Bevel4: TBevel;
    Label102: TLabel;
    Bevel5: TBevel;
    Label103: TLabel;
    lblVisibilityFactorsnfrared: TLabel;
    Label105: TLabel;
    lblOtherBarometric: TLabel;
    Label107: TLabel;
    lblOtherAirTemp: TLabel;
    Label109: TLabel;
    Bevel6: TBevel;
    Label111: TLabel;
    Label86: TLabel;
    Bevel7: TBevel;
    lblSoundVelocityAverageBottom: TLabel;
    lblSoundVelocityLayer: TLabel;
    lblSoundVelocityProfile: TLabel;
    Label98: TLabel;
    Label100: TLabel;
    Label104: TLabel;
    Label106: TLabel;
    lblOceanCurrentDirection: TLabel;
    Label112: TLabel;
    lblOceanCurrentSpeed: TLabel;
    Label114: TLabel;
    Bevel8: TBevel;
    Label115: TLabel;
    Bevel9: TBevel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    lblSurfaceTemp: TLabel;
    Label95: TLabel;
    Label108: TLabel;
    lblSeaState: TLabel;
    Label120: TLabel;
    Bevel10: TBevel;
    Label110: TLabel;
    Label121: TLabel;
    gbMessageHandlingSystem: TPanel;
    Panel8: TPanel;
    Panel25: TPanel;
    pcReceived: TPageControl;
    TabSheet1: TTabSheet;
    Panel74: TPanel;
    StringGrid5: TStringGrid;
    Panel75: TPanel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Panel76: TPanel;
    ListBox1: TListBox;
    Panel77: TPanel;
    TabSheet2: TTabSheet;
    Panel78: TPanel;
    StringGrid6: TStringGrid;
    Panel79: TPanel;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Panel80: TPanel;
    ListBox2: TListBox;
    Panel81: TPanel;
    TabSheet3: TTabSheet;
    Panel82: TPanel;
    StringGrid7: TStringGrid;
    Panel83: TPanel;
    btnRemove: TButton;
    btnPrint: TButton;
    btnForward: TButton;
    btnReply: TButton;
    btnNew: TButton;
    btnEdit: TButton;
    btnSend: TButton;
    Panel84: TPanel;
    ListBox3: TListBox;
    Panel85: TPanel;
    gbPlatformRemovalSummary: TPanel;
    Panel6: TPanel;
    Panel28: TPanel;
    Panel90: TPanel;
    gbPlatformStatus: TPanel;
    Panel2: TPanel;
    pnlPlatformLeft: TPanel;
    tvEmbarkedPlatforms: TTreeView;
    pnlPlatforms: TPanel;
    btSelectHookedPlatform: TButton;
    btHookSelectedPlatform: TButton;
    pnlPlatformRight: TPanel;
    gbSensorOverride: TPanel;
    Panel17: TPanel;
    Panel33: TPanel;
    StringGrid22: TStringGrid;
    Panel18: TPanel;
    Label224: TLabel;
    Label225: TLabel;
    SpeedButton28: TSpeedButton;
    Label226: TLabel;
    Panel19: TPanel;
    Edit37: TEdit;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Panel34: TPanel;
    Button38: TButton;
    Button39: TButton;
    Button42: TButton;
    Button43: TButton;
    gbSurfaceToAir: TPanel;
    Panel4: TPanel;
    Panel27: TPanel;
    sgSurfacetoAir: TStringGrid;
    Panel89: TPanel;
    btAbort: TButton;
    gbSurfaceToSurface: TPanel;
    Panel7: TPanel;
    Panel26: TPanel;
    sgSurfacetoSurface: TStringGrid;
    Panel87: TPanel;
    btnAbortSurfaceToSurface: TButton;
    gbWeaponEngagementsSUmmary: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    tvWeapons: TTreeView;
    pnlPlatSensor: TPanel;
    pnlPlatWeapon: TPanel;
    Label77: TLabel;
    Label76: TLabel;
    pnlPlatCounterMeasure: TPanel;
    Label78: TLabel;
    pnlPlatSystemState: TPanel;
    Label80: TLabel;
    pnlPlatEmbarked: TPanel;
    Label75: TLabel;
    Panel61: TPanel;
    Label132: TLabel;
    SpeedButton14: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton29: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tvCountermeasures: TTreeView;
    lvSensors: TListView;
    pnlTooop: TPanel;
    pnlGroupBox: TPanel;
    lvSystemState: TListView;
    lvPlatforms: TListView;
    Panel13: TPanel;
    Label79: TLabel;
    lvWeaponEngagement: TListView;
    ListView1: TListView;
    lvEnviroArea: TListView;
    lvCubicle: TListView;
    pnWheelAbove: TPanel;
    pnlWheelSurface: TPanel;
    pmSensor: TPopupMenu;
    damage1: TMenuItem;
    fixed1: TMenuItem;
    gbSettings: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    tvSettings: TTreeView;
    Panel45: TPanel;
    gbSetEnDis: TGroupBox;
    cbSetEnDis: TCheckBox;
    gbSetTime: TGroupBox;
    edtSetTime: TEdit;
    Button1: TButton;
    btnSetXML: TButton;
    btnGetXML: TButton;
    procedure btnPlatformStatusClick(sender: TObject);
    procedure btnEnviroStatusClick(sender: TObject);
    procedure btnWeaponEngagementClick(sender: TObject);
    procedure btnPlatformRemovalClick(sender: TObject);
    procedure btnSurfaceToAirClick(sender: TObject);
    procedure btnSurfaceToSurfaceClick(sender: TObject);
    procedure btnMessageHandlingClick(sender: TObject);
    procedure btnCommDefinitionClick(sender: TObject);
    procedure btnCommMappingClick(sender: TObject);
    procedure btnCommInterfeceneClick(sender: TObject);
    procedure btnDatalinkControlClick(sender: TObject);
    procedure btnAudioRecordClick(sender: TObject);
    procedure btnCubicleGroupsClick(sender: TObject);
    procedure btnEnviroControlClick(sender: TObject);
    procedure btnSensorOverrideClick(sender: TObject);
    procedure FormCreate(sender: TObject);
    procedure Tactical1Click(sender: TObject);
    procedure lvPlatformsSelectItem(sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormResize(sender: TObject);
    procedure lvEnviroAreaSelectItem(sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure trbDaytimeVisualChange(sender: TObject);
    procedure trbNighttimeVisualChange(sender: TObject);
    procedure trbDaytimeInfraChange(sender: TObject);
    procedure trbNighttimeInfraChange(sender: TObject);
    procedure trbAttenRainRateChange(sender: TObject);
    procedure trbAttenCloudChange(sender: TObject);
    procedure trbAtmRefractChange(sender: TObject);
    procedure lvSensorsMouseDown(sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label156Click(sender: TObject);
    procedure btnSetXMLClick(sender: TObject);
    procedure btnGetXMLClick(sender: TObject);
    procedure tvSettingsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
    procedure AdjustComponentDisplayPosition;

    function FindTrackListPlatformByMember(const arg: string): TListItem;
    function FindTrackListCubicleByMember(const arg: string): TListItem;
    procedure setHeaderSGSurfaceToAir;
    procedure setHeaderSGSurfaceToSurface;

  public
    procedure UpdateTrackList(sender: TObject);
    function FindTrackListSensorByMember(const arg: string): TListItem;
    procedure RefreshPlatformWeapons(PfList: TPlatform_Instance);
    procedure RefreshPlatformCountermeasures(PfList: TPlatform_Instance);
    procedure RefreshEmbarkedPlatform(PfList: TPlatform_Instance);

    procedure DisplayEnvironMentControl;
    procedure RefreshCubicle_Platform(cubList: TList);
    procedure TreeToXML(tv: TTreeView);
    procedure XMLToTree(tv: TTreeView; XMLDoc: TXMLDocument);
    procedure DOMShow(ATree: TTreeView; Anode: IXMLNode; tNode: TTreeNode);

  end;

var
  frmToteDisplay: TfrmToteDisplay;

implementation

uses
  ufTacticalDisplay, uSimMgr_Client, uBaseCoordSystem,
  uDBAsset_Radar, uDBAsset_GameEnvironment, uDBAsset_Countermeasure,
  uDBAsset_Vehicle, uDBScenario, uDBAsset_Cubicle;
{$R *.dfm}

function SecondToTime(const s: Integer): TTime;
var
  h: Double;
begin
  h := s / 3600;
  Result := h / 24;
end;

procedure TfrmToteDisplay.setHeaderSGSurfaceToAir;
begin
  with sgSurfacetoAir do
  begin
    Cells[0, 0] := 'Launch Platform';
    Cells[1, 0] := 'Mount';
    Cells[2, 0] := 'Target Track';
    Cells[3, 0] := 'Course (degrees T)';
    Cells[4, 0] := 'Ground Speed (knots)';
    Cells[5, 0] := 'Altitude (feet)';
    Cells[6, 0] := 'Time To Wait (mm:ss)';
    Cells[7, 0] := 'Time To Intercept';
  end;
end;

procedure TfrmToteDisplay.setHeaderSGSurfaceToSurface;
begin
  with sgSurfacetoSurface do
  begin
    Cells[0, 0] := 'Missile';
    Cells[1, 0] := 'Status';
    Cells[2, 0] := 'Firing Bearing Angle';
    Cells[3, 0] := 'Time Until Launch';
    Cells[4, 0] := 'Time Of Flight';
  end;
end;

procedure TfrmToteDisplay.btnMessageHandlingClick(sender: TObject);
begin
  gbMessageHandlingSystem.BringToFront;
end;

procedure TfrmToteDisplay.btnDatalinkControlClick(sender: TObject);
begin
  gbDatalinkControl.BringToFront;
end;

procedure TfrmToteDisplay.btnAudioRecordClick(sender: TObject);
begin
  gbAudioRecordTracks.BringToFront;
end;

procedure TfrmToteDisplay.btnPlatformStatusClick(sender: TObject);

var
  s: string;
  li: TListItem;
  pi: TPlatform_Instance;
  i: Integer;
begin
  gbPlatformStatus.BringToFront;

  with (simMgrClient) do
  begin
    for i := 0 to Platforms.ChildCount - 1 do
    begin

      pi := TPlatform_Instance(Platforms.Childs[i]);

      s := pi.FData.Instance_Name;

      li := FindTrackListPlatformByMember(s);

      if li = nil then
      begin
        li := lvPlatforms.Items.Add;
        li.Caption := pi.Vehicle.FData.Vehicle_Identifier;
        li.SubItems.Add(pi.InstanceName);
        li.SubItems.Add(FormatTrackNumber(pi.TrackNumber));
        // li.SubItems.Add ('Off'):
        li.Data := pi;
      end
      else
      begin
        // sudah ada.
        li.SubItems[0] := pi.InstanceName;
        li.SubItems[1] := FormatTrackNumber(pi.TrackNumber);
        // li.SubItems[2] := 'Off';
      end;
    end;
  end;

end;

function TfrmToteDisplay.FindTrackListPlatformByMember(const arg: string)
  : TListItem;
var
  i: Integer;
  f: Boolean;
  li: TListItem;

begin
  Result := nil;

  f := False;
  i := 0;
  while not f and (i < lvPlatforms.Items.Count) do
  begin
    li := lvPlatforms.Items.Item[i];

    // f := False;
    // f := SameText(li.Caption, arg);
    f := SameText(li.SubItems[0], arg);

    Inc(i);
  end;

  if f then
    Result := li;
end;

function TfrmToteDisplay.FindTrackListCubicleByMember(const arg: string)
  : TListItem;
var
  i: Integer;
  f: Boolean;
  li: TListItem;

begin
  Result := nil;

  f := False;
  i := 0;
  while not f and (i < lvCubicle.Items.Count) do
  begin
    li := lvCubicle.Items.Item[i];

    f := False;
    // f := SameText(li.Caption, arg);
    f := SameText(li.SubItems[0], arg);

    Inc(i);
  end;

  if f then
    Result := li;

end;

function TfrmToteDisplay.FindTrackListSensorByMember(const arg: string)
  : TListItem;
var
  i: Integer;
  f: Boolean;
  li: TListItem;

begin
  Result := nil;

  f := False;
  i := 0;
  while not f and (i < lvSensors.Items.Count) do
  begin
    li := lvSensors.Items.Item[i];

    f := False;
    // f := SameText(li.Caption, arg);
    f := SameText(li.SubItems[0], arg);

    Inc(i);
  end;

  if f then
    Result := li;

end;

procedure TfrmToteDisplay.UpdateTrackList(sender: TObject);
var
  i: Integer;
  pi: TPlatform_Instance;

begin
  { if sender = nil then
    Exit;

    with (simMgrClient) do begin
    for I := 0 to Platforms.ChildCount - 1 do begin

    SpeedButton1Click(Platforms.Childs[i]);
    end;
    end;
    }
end;

procedure TfrmToteDisplay.RefreshPlatformWeapons(PfList: TPlatform_Instance);
var
  i: Integer;
  mis: TMissile_Definition;
  torp: TTorpedo_Definition;
begin

  tvWeapons.Items.Clear;

  // missiles
  if (PfList.Vehicle.Missiles <> nil) then
    for i := 0 to PfList.Vehicle.Missiles.Count - 1 do
    begin
      mis := PfList.Vehicle.Missiles[i];
      tvWeapons.Items.Add(nil, mis.FData.Class_Identifier);
    end;

  // torpedoes
  if (PfList.Vehicle.Torpedos <> nil) then
    for i := 0 to PfList.Vehicle.Torpedos.Count - 1 do
    begin
      torp := PfList.Vehicle.Torpedos[i];
      tvWeapons.Items.Add(nil, torp.FData.Class_Identifier);
    end;
end;

procedure TfrmToteDisplay.RefreshPlatformCountermeasures
  (PfList: TPlatform_Instance);
var
  i: Integer;
  ac_decoy: TAcoustic_Decoy_On_Board;
  bubble: TAir_Bubble_Mount;
  chaff: TChaff_On_Board;
  chaff_launch: TChaff_Launcher_On_Board;
  def_jam: TDefensive_Jammer_On_Board;
  float_decoy: TFloating_Decoy_On_Board;
  infra_decoy: TInfrared_Decoy_On_Board;
  jammer: TJammer_On_Board;
  point: TPoint_Effect_On_Board;
  towed_jam: TTowed_Jammer_Decoy_On_Board;

begin

  tvCountermeasures.Items.Clear;

  // accoustic decoy
  if (PfList.Vehicle.Acoustic_Decoys <> nil) then
    for i := 0 to PfList.Vehicle.Acoustic_Decoys.Count - 1 do
    begin
      ac_decoy := PfList.Vehicle.Acoustic_Decoys[i];
      tvCountermeasures.Items.Add(nil, ac_decoy.FData.Instance_Identifier);
    end;

  // air bubble
  if (PfList.Vehicle.Air_Bubble_Mount <> nil) then
    for i := 0 to PfList.Vehicle.Air_Bubble_Mount.Count - 1 do
    begin
      bubble := PfList.Vehicle.Air_Bubble_Mount[i];
      tvCountermeasures.Items.Add(nil, bubble.FData.Instance_Identifier);
    end;

  // chaff
  if (PfList.Vehicle.Chaffs <> nil) then
    for i := 0 to PfList.Vehicle.Chaffs.Count - 1 do
    begin
      chaff := PfList.Vehicle.Chaffs[i];
      tvCountermeasures.Items.Add(nil, chaff.FData.Instance_Identifier);
    end;

  // chaff launcher
  if (PfList.Vehicle.Chaff_Launchers <> nil) then
    for i := 0 to PfList.Vehicle.Chaff_Launchers.Count - 1 do
    begin
      chaff_launch := PfList.Vehicle.Chaff_Launchers[i];
      // tvCountermeasures.Items.add(nil,chaff_launch.FData.);
    end;

  // defensive jammer
  if (PfList.Vehicle.Defensive_Jammers <> nil) then
    for i := 0 to PfList.Vehicle.Defensive_Jammers.Count - 1 do
    begin
      def_jam := PfList.Vehicle.Defensive_Jammers[i];
      tvCountermeasures.Items.Add(nil, def_jam.FData.Instance_Identifier);
    end;

  // floating decoy
  if (PfList.Vehicle.Floating_Decoys <> nil) then
    for i := 0 to PfList.Vehicle.Floating_Decoys.Count - 1 do
    begin
      float_decoy := PfList.Vehicle.Floating_Decoys[i];
      tvCountermeasures.Items.Add(nil, float_decoy.FData.Instance_Identifier);
    end;

  // infrared decoy
  if (PfList.Vehicle.Infrared_Decoys <> nil) then
    for i := 0 to PfList.Vehicle.Infrared_Decoys.Count - 1 do
    begin
      infra_decoy := PfList.Vehicle.Infrared_Decoys[i];
      tvCountermeasures.Items.Add(nil, infra_decoy.FData.Instance_Identifier);
    end;

  // jammer
  if (PfList.Vehicle.Jammers <> nil) then
    for i := 0 to PfList.Vehicle.Jammers.Count - 1 do
    begin
      jammer := PfList.Vehicle.Jammers[i];
      tvCountermeasures.Items.Add(nil, jammer.FData.Instance_Identifier);
    end;

  // point effect
  if (PfList.Vehicle.Point_Effects <> nil) then
    for i := 0 to PfList.Vehicle.Point_Effects.Count - 1 do
    begin
      point := PfList.Vehicle.Point_Effects[i];
      tvCountermeasures.Items.Add(nil, point.FData.Instance_Identifier);
    end;

  // towed jammer
  if (PfList.Vehicle.Towed_Jammer_Decoys <> nil) then
    for i := 0 to PfList.Vehicle.Towed_Jammer_Decoys.Count - 1 do
    begin
      towed_jam := PfList.Vehicle.Towed_Jammer_Decoys[i];
      tvCountermeasures.Items.Add(nil, towed_jam.FData.Instance_Identifier);
    end;
end;

procedure TfrmToteDisplay.RefreshEmbarkedPlatform(PfList: TPlatform_Instance);
var
  i: Integer;
  embarked_plat: THosted_Platform;

begin

  tvEmbarkedPlatforms.Items.Clear;

  // embarked platform
  if (PfList.Vehicle.Hosted_Platform <> nil) then
    for i := 0 to PfList.Vehicle.Hosted_Platform.Count - 1 do
    begin
      embarked_plat := PfList.Vehicle.Hosted_Platform[i];
      tvEmbarkedPlatforms.Items.Add(nil,
        embarked_plat.FVehicle.Vehicle_Identifier);
    end;
end;

procedure TfrmToteDisplay.btnCubicleGroupsClick(sender: TObject);
begin
  gbCubicleGroups.BringToFront;
end;

procedure TfrmToteDisplay.btnEnviroControlClick(sender: TObject);
begin
  gbEnvironmentControl.BringToFront;
  DisplayEnvironMentControl;

end;

procedure TfrmToteDisplay.btnSensorOverrideClick(sender: TObject);
begin
  gbSensorOverride.BringToFront;
end;

procedure TfrmToteDisplay.btnSetXMLClick(sender: TObject);
begin
  TreeToXML(Self.tvSettings);
end;

procedure TfrmToteDisplay.btnEnviroStatusClick(sender: TObject);
var
  ge: TGame_Environment_Definition;
begin
  gbEnvironmentStatus.BringToFront;
  ge := (simMgrClient).GameEnvironment;

  with ge.FData do
  begin
    lblSpeedWIndTrue.Caption := FormatCourse(Wind_Direction);
    lblDirectionWindTrue.Caption := FormatSpeed(Wind_Speed);
    // lblWindRelativeSpeed
    // lblWindRelativeDirection

    lblAttenuationFactorsRain.Caption := IntToStr(Rain_Rate);
    lblAttenuationFactorsCloud.Caption := IntToStr(Cloud_Attenuation);

    // lblVisibilityactorsTime.Caption :=
    // lblVisibilityFactorsElectroOptical
    // lblVisibilityFactorsnfrared

    lblOtherAirTemp.Caption := FormatFloat('00.0', Air_Temperature);
    lblOtherBarometric.Caption := FormatFloat('000.0', Barometric_Pressure);
    lblOceanCurrentSpeed.Caption := FormatFloat('00.0', Ocean_Current_Speed);
    lblOceanCurrentDirection.Caption := FormatFloat('000.0',
      Ocean_Current_Direction);

    lblSoundVelocityProfile.Caption := IntToStr(Sound_Velocity_Type);
    lblSoundVelocityLayer.Caption := FormatFloat('0.0', Thermal_Layer_Depth);
    lblSoundVelocityAverageBottom.Caption := FormatFloat('0.0',
      Ave_Ocean_Depth);
    //
    lblSeaState.Caption := IntToStr(Sea_State);
    lblSurfaceTemp.Caption := FormatFloat('0.0', Surface_Temperature);
  end;

end;

procedure TfrmToteDisplay.btnGetXMLClick(sender: TObject);
var
  XMLDoc: TXMLDocument;
  temp: string;
  I: Integer;
begin
  XMLDoc := TXMLDocument.Create(nil);

  //ShowMessage(temp);
  XMLToTree(tvSettings, XMLDoc);
  tvSettings.AutoExpand := true;
  tvSettings.Items[0].Expand(true);

end;

procedure TfrmToteDisplay.btnWeaponEngagementClick(sender: TObject);
begin
  gbWeaponEngagementsSUmmary.BringToFront;
end;

procedure TfrmToteDisplay.btnPlatformRemovalClick(sender: TObject);
begin
  gbPlatformRemovalSummary.BringToFront;
end;

procedure TfrmToteDisplay.btnSurfaceToAirClick(sender: TObject);
begin
  gbSurfaceToAir.BringToFront;
end;

procedure TfrmToteDisplay.btnSurfaceToSurfaceClick(sender: TObject);
begin
  gbSurfaceToSurface.BringToFront;
end;

procedure TfrmToteDisplay.btnCommInterfeceneClick(sender: TObject);
begin
  gbCommunicationsInterference.BringToFront;
end;

procedure TfrmToteDisplay.btnCommMappingClick(sender: TObject);
begin
  gbCommunicationsChannelMapping.BringToFront;
end;

procedure TfrmToteDisplay.btnCommDefinitionClick(sender: TObject);
begin
  gbCommunicationsChannelDefinition.BringToFront;
end;

procedure TfrmToteDisplay.FormCreate(sender: TObject);
var
  i: Integer;
begin
  // DoubleBuffered := True;

  if Screen.MonitorCount > 1 then
    i := 1
  else
    i := 0;

  DefaultMonitor := dmDesktop;

  Width := Screen.Monitors[i].Width;
  Height := Screen.Monitors[i].Height;
  Left := Screen.Monitors[i].Left;
  Top := Screen.Monitors[i].Top;

  gbPlatformStatus.Align := alClient;
  gbEnvironmentStatus.Align := alClient;
  gbWeaponEngagementsSUmmary.Align := alClient;
  gbPlatformRemovalSummary.Align := alClient;
  gbSurfaceToAir.Align := alClient;
  gbSurfaceToSurface.Align := alClient;
  gbMessageHandlingSystem.Align := alClient;
  gbCommunicationsChannelDefinition.Align := alClient;
  gbCommunicationsChannelMapping.Align := alClient;
  gbCommunicationsInterference.Align := alClient;
  gbDatalinkControl.Align := alClient;
  gbAudioRecordTracks.Align := alClient;
  gbCubicleGroups.Align := alClient;
  gbEnvironmentControl.Align := alClient;
  gbSensorOverride.Align := alClient;
  gbSettings.Align := alClient;

  setHeaderSGSurfaceToAir;
  setHeaderSGSurfaceToSurface;

  AdjustComponentDisplayPosition;
  Show;
  Repaint;
end;

procedure TfrmToteDisplay.FormResize(sender: TObject);
begin

  // AdjustComponentDisplayPosition;

end;

procedure TfrmToteDisplay.Label156Click(sender: TObject);
begin
  gbSettings.BringToFront;
end;

procedure TfrmToteDisplay.lvPlatformsSelectItem(sender: TObject;
  Item: TListItem; Selected: Boolean);

var
  s: string;
  li: TListItem;
  pi: TPlatform_Instance;
  rdr: TRadar_On_Board;
  i: Integer;
begin
  if Item = nil then
    exit;

  pi := Item.Data;
  if pi = nil then
    exit;

  lvSensors.Items.Clear;
  for i := 0 to pi.Vehicle.Radars.Count - 1 do
  begin
    rdr := pi.Vehicle.Radars[i];

    li := lvSensors.Items.Add;
    li.Caption := rdr.FDef.Radar_Identifier;
  end;

  RefreshPlatformWeapons(pi);
  RefreshPlatformCountermeasures(pi);
  RefreshEmbarkedPlatform(pi);
end;

procedure TfrmToteDisplay.lvSensorsMouseDown(sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // klik kanan
  if (Button = mbRight) and (Shift = []) then
  begin
    //
  end
  else
  // klik kiri
  begin
    //
  end;

end;

procedure TfrmToteDisplay.Tactical1Click(sender: TObject);
begin
  frmTacticalDisplay.Show;
end;

procedure setGroupBoxDimension(gb: TGroupBox; const aLeft, aTop, aWidth,
  aHeight: Integer);
begin
  with gb do
  begin
    Left := aLeft;
    Top := aTop;
    Width := aWidth;
    Height := aHeight;
  end;
end;

procedure TfrmToteDisplay.AdjustComponentDisplayPosition;
var
  i, w, h: Integer;
  c: TComponent;
  gb: TGroupBox;

begin
  // gbPlatformStatus.members
  pnlPlatformRight.Width := gbPlatformStatus.Width div 3;
  if pnlPlatformRight.Height < 740 then
    h := (pnlPlatformRight.Height - 20) div 4
  else
    h := 180;

  pnlPlatSystemState.Height := h;
  pnlPlatCounterMeasure.Height := h;
  pnlPlatCounterMeasure.Height := h;
  pnlPlatEmbarked.Height := h;

  btHookSelectedPlatform.Left := pnlPlatformLeft.Width -
    btHookSelectedPlatform.Width - 16;
  btSelectHookedPlatform.Left := btHookSelectedPlatform.Left -
    btSelectHookedPlatform.Width - 8;

  w := lvPlatforms.Width;
  lvPlatforms.Column[0].Width := Round(0.4 * w);
  lvPlatforms.Column[1].Width := Round(0.3 * w);
  lvPlatforms.Column[2].Width := Round(0.2 * w);
  lvPlatforms.Column[3].Width := Round(0.1 * w);

  w := lvSensors.Width;
  lvSensors.Column[0].Width := Round(0.7 * w);
  lvSensors.Column[1].Width := Round(0.3 * w);

  // gbEnvironmentStatus.member
  // gbWeaponEngagementsSUmmary.member
  // lvWeaponEngagement

  { Date/time of engagement
    Launching platform name
    Weapon class name
    Target platform name
    Engagement outcome.
  }

  gbPlatformStatus.BringToFront;

end;

procedure TfrmToteDisplay.trbAtmRefractChange(sender: TObject);
begin
  edtAtmRefract.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfrmToteDisplay.trbAttenCloudChange(sender: TObject);
begin
  edtAttenCloud.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfrmToteDisplay.trbAttenRainRateChange(sender: TObject);
begin
  edtAttenRainRate.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfrmToteDisplay.trbDaytimeInfraChange(sender: TObject);
begin
  edtDayInfra.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfrmToteDisplay.trbDaytimeVisualChange(sender: TObject);
begin
  edtDayVis.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfrmToteDisplay.trbNighttimeInfraChange(sender: TObject);
begin
  edtNightInfra.Text := IntToStr((sender as TTrackBar).Position);

end;

procedure TfrmToteDisplay.trbNighttimeVisualChange(sender: TObject);
begin
  edtNightVis.Text := IntToStr((sender as TTrackBar).Position);

end;

procedure TfrmToteDisplay.DisplayEnvironMentControl;
var
  li: TListItem;
  ge: TGame_Environment_Definition;
begin
  lvEnviroArea.Columns[0].Width := lvEnviroArea.Width - 10;
  ge := (simMgrClient).GameEnvironment;

  // while  do

  lvEnviroArea.Clear;
  li := lvEnviroArea.Items.Add;
  li.Caption := 'Default Game Area';

  // if first item then add default

  li.Data := ge;

end;

procedure TfrmToteDisplay.RefreshCubicle_Platform(cubList: TList);
var
  i, int: Integer;
  cub: TCubicle_Group;
  pi: TPlatform_Instance;
  tNode: TTreeNode;

begin
  tvCubicleGroups.Items.Clear;

  // embarked platform

  for i := 0 to cubList.Count - 1 do
  begin
    cub := cubList[i];
    tNode := tvCubicleGroups.Items.Add(nil, cub.FData.Group_Identifier);

    for int := 0 to cub.PlatformInstances.Count - 1 do
    begin
      pi := cub.PlatformInstances[int];
      tvCubicleGroups.Items.AddChildFirst(tNode, pi.FData.Instance_Name);
    end;

  end;

end;

procedure TfrmToteDisplay.TreeToXML(tv: TTreeView);
var
  tn: TTreeNode;
  XMLDoc: TXMLDocument;
  iNode: IXMLNode;

  procedure ProcessTreeItem(tn: TTreeNode; iNode: IXMLNode);
  var
    cNode: IXMLNode;
  begin
    if (tn = nil) then
      exit;
    cNode := iNode.AddChild('item');
    cNode.Attributes['text'] := tn.Text;
    cNode.Attributes['imageIndex'] := tn.ImageIndex;
    cNode.Attributes['stateIndex'] := tn.StateIndex;

    // child nodes
    tn := tn.getFirstChild;
    while tn <> nil do
    begin
      ProcessTreeItem(tn, cNode);
      tn := tn.getNextSibling;
    end;
  end;

begin
  XMLDoc := TXMLDocument.Create(nil);
  XMLDoc.Active := True;
  iNode := XMLDoc.AddChild('tree2xml');
  iNode.Attributes['app'] := ParamStr(0);

  tn := tv.TopItem;
  while tn <> nil do
  begin
    ProcessTreeItem(tn, iNode);

    tn := tn.getNextSibling;
  end;

  XMLDoc.SaveToFile(ChangeFileExt('setting', '.XML'));

  XMLDoc := nil;
end;

procedure TfrmToteDisplay.tvSettingsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ((Sender as TTreeView).RowSelect) then
  begin
    (Sender as TTreeView).Selected.EditText;
  end;
end;

procedure TfrmToteDisplay.XMLToTree(tv: TTreeView; XMLDoc: TXMLDocument);
var
  iNode: IXMLNode;
  temp : String;
  procedure ProcessNode(Node: IXMLNode; tn: TTreeNode);
  var
    cNode: IXMLNode;
  begin
    if Node = nil then
      exit;
    with Node do
    begin
      tn := tv.Items.AddChild(tn, Attributes['text']);
      tn.ImageIndex := Integer(Attributes['imageIndex']);
      tn.StateIndex := Integer(Attributes['stateIndex']);
    end;
    cNode := Node.ChildNodes.First;
    while cNode <> nil do
    begin
      ProcessNode(cNode, tn);
      cNode := cNode.NextSibling;
    end;
  end;
(* ProcessNode *)
begin
  tv.Items.Clear;
  //XMLDoc.FileName := ChangeFileExt('setting', '.XML');
  XMLDoc.LoadFromFile('setting.XML');
  XMLDoc.AfterConstruction;
  XMLDoc.Active := True;
  iNode := XMLDoc.DocumentElement.ChildNodes.First;

  while iNode <> nil do
  begin
    ProcessNode(iNode, nil);
    iNode := iNode.NextSibling;
  end;

  XMLDoc.Active := False;
end;

procedure TfrmToteDisplay.DOMShow(ATree: TTreeView; Anode: IXMLNode; tNode: TTreeNode);
var
  i: Integer;
  NTNode: TTreeNode;
  NText: string;
  AttrNode: IXMLNode;
begin
  if not(Anode.NodeType = ntElement) then
    exit;

  NText := '<' + UpperCase(Anode.NodeName) + '>';

  if Anode.IsTextElement then
    NText := NText + '=' + Anode.NodeValue;
  NTNode := ATree.Items.AddChild(tNode, NText);

  // NTNode.ImageIndex := 190;

  for i := 0 to Anode.AttributeNodes.Count - 1 do

  begin
    Application.ProcessMessages;
    AttrNode := Anode.AttributeNodes.Nodes[i];
    // NTNode.ImageIndex := 188;
    ATree.Items.AddChild(NTNode,
      // AttrNode.NodeName + ‘ = “‘ + AttrNode.Text + ‘”‘);
      AttrNode.Text);
  end;

  if Anode.HasChildNodes then
    for i := 0 to Anode.ChildNodes.Count - 1 do
    begin
      Application.ProcessMessages;
      DOMShow(ATree, Anode.ChildNodes.Nodes[i], NTNode);

    end;
  ATree.FullExpand;

end;

procedure TfrmToteDisplay.lvEnviroAreaSelectItem(sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  ge: TGame_Environment_Definition;
  t: TTime;
begin

  if Item = nil then
    exit;
  if not Assigned(Item.Data) then
    exit;
  if not Selected then
    exit;
  // if first item then
  ge := Item.Data;

  with ge.FData do
  begin
    edtWindDir.Text := FormatCourse(Wind_Direction);
    edtWindSpeed.Text := FormatSpeed(Wind_Speed);

    trbDaytimeVisual.Position := Round(Daytime_Visual_Modifier * 100.0);
    trbDaytimeInfra.Position := Round(Daytime_Infrared_Modifier * 100.0);
    trbNighttimeVisual.Position := Round(Nighttime_Visual_Modifier * 100.0);
    trbNighttimeInfra.Position := Round(Nighttime_Infrared_Modifier * 100.0);

    t := SecondToTime(Sunrise);
    lblEnviCtrlSunrise.Caption := FormatDateTime('hh : nn : ss', t);

    t := SecondToTime(Sunset);
    lblEnviCtrlSunset.Caption := FormatDateTime('hh : nn : ss', t);
    t := SecondToTime(Period_of_Twilight);
    lblEnviCtrlPeriodTwilight.Caption := FormatDateTime('hh : nn : ss', t);

    trbAttenRainRate.Position := Rain_Rate;
    trbAttenCloud.Position := Cloud_Attenuation;

    edtBarometricPressure.Text := FormatFloat('000.0', Barometric_Pressure);
    edtAirTemp.Text := FormatFloat('00.0', Air_Temperature);
    edtCloudBaseHeight.Text := FormatFloat('0000.0', Cloud_Base_Height);

    trbAtmRefract.Position := Round(Atmospheric_Refract_Modifier);

    //
    edtOceanCurrentDirection.Text := FormatFloat('00.0',
      ge.FData.Ocean_Current_Direction);
    edtOceanCurrentSpeed.Text := FormatFloat('00.0',
      ge.FData.Ocean_Current_Speed);

    edtDepthTermalLayer.Text := FormatFloat('00.0',
      ge.FData.Thermal_Layer_Depth);
    { if  ge.FData.Shipping_Rate < 4 then
      cbxShippingRate.ItemIndex ge.FData.Shipping_Rate
    }// edtDepthTermalLayer
    //
    // edtSpeedOfSoundSurface
    // edtSpeedOfSoundlayer
    // edtSpeedOfSoundBottom
    //
    // edtSurfaceDuctUp
    // edtSurfaceDuctLow
    //
    // edtSubSurfaceDuctUp
    // edtSubSurfaceDuctLow
    //
    // trbSeaState
    // trbBottomLost
    // edtSurfaceTemperatur
    // edtAvgOceanDepth
    // edtShadowZone
    //

  end;

end;

end.
