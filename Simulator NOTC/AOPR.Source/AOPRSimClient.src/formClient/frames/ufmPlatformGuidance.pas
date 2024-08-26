unit ufmPlatformGuidance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VrControls, VrWheel, StdCtrls, ExtCtrls, Buttons, Menus, 
  ufmControlled, uT3Unit, uSimObjects, uT3DetectedTrack, uT3Missile, uT3Torpedo, uT3Weapon,
  uT3Sensor, uT3Radar, uDataTypes, uT3GroupVehicle;

type

  TRecTabGuidance = record
    InitGuideType : byte;
    Caption       : string;
    GBX           : TGroupBox;
  end;

  TfmPlatformGuidance = class(TfmControlled)
    PanelGuidanceControlChoices: TPanel;
    SpeedButton2: TSpeedButton;
    edGuidance: TEdit;
    PanelPlatformGuidance: TPanel;
    grbReturnToBase: TGroupBox;
    Label327: TLabel;
    lblReturnToBaseDestinationBase: TLabel;
    Label329: TLabel;
    Label334: TLabel;
    Label382: TLabel;
    Label397: TLabel;
    lblReturnToBaseActualGroundSpeed: TLabel;
    Label406: TLabel;
    Label419: TLabel;
    Label437: TLabel;
    Label451: TLabel;
    lblReturnToBaseActualAltitude: TLabel;
    StaticText158: TStaticText;
    StaticText159: TStaticText;
    edtReturnToBaseOrderedGroundSpeed: TEdit;
    StaticText160: TStaticText;
    StaticText161: TStaticText;
    edtReturnToBaseOrderedAltitude: TEdit;
    StaticText162: TStaticText;
    grbFormation: TGroupBox;
    Label323: TLabel;
    Label324: TLabel;
    lblLeaderFormation: TLabel;
    lblNameFormation: TLabel;
    Label373: TLabel;
    Label374: TLabel;
    Label381: TLabel;
    lblRangeFormation: TLabel;
    lblBearingFormation: TLabel;
    Label399: TLabel;
    StaticText154: TStaticText;
    StaticText155: TStaticText;
    StaticText156: TStaticText;
    StaticText157: TStaticText;
    grbEvasion: TGroupBox;
    Label318: TLabel;
    Label319: TLabel;
    Label320: TLabel;
    lblEvasionActualGroundSpeed: TLabel;
    sbTrackToEvade: TSpeedButton;
    StaticText151: TStaticText;
    edtTrackToEvade: TEdit;
    StaticText152: TStaticText;
    grbOutrun: TGroupBox;
    Label310: TLabel;
    Label321: TLabel;
    Label322: TLabel;
    lblOutrunActualGroundSpeed: TLabel;
    sbTrackToOutrun: TSpeedButton;
    StaticText150: TStaticText;
    edtTrackToOutrun: TEdit;
    StaticText153: TStaticText;
    grbEngagement: TGroupBox;
    Label300: TLabel;
    Label305: TLabel;
    Label306: TLabel;
    Label307: TLabel;
    Label308: TLabel;
    Label309: TLabel;
    lblEngageActualGroundSpeed: TLabel;
    Label314: TLabel;
    sbEngageTrackToEngage: TSpeedButton;
    StaticText146: TStaticText;
    edtTrackToEngage: TEdit;
    StaticText147: TStaticText;
    StaticText148: TStaticText;
    StaticText149: TStaticText;
    grbShadow: TGroupBox;
    Label173: TLabel;
    Label180: TLabel;
    Label196: TLabel;
    Label290: TLabel;
    Label298: TLabel;
    Label299: TLabel;
    lblShadowActualGroundSpeed: TLabel;
    Label301: TLabel;
    sbTrackToshadow: TSpeedButton;
    StaticText128: TStaticText;
    edtTrackToShadow: TEdit;
    StaticText143: TStaticText;
    edtStandoffDistanceShadow: TEdit;
    StaticText144: TStaticText;
    edtShadowOrdeeredGroundSpeed: TEdit;
    StaticText145: TStaticText;
    grbSinuation: TGroupBox;
    Label206: TLabel;
    Label227: TLabel;
    Label241: TLabel;
    Label255: TLabel;
    Label256: TLabel;
    Label260: TLabel;
    Label270: TLabel;
    Label287: TLabel;
    lblSinuationActualGroundSpeed: TLabel;
    Label293: TLabel;
    Label297: TLabel;
    StaticText138: TStaticText;
    edtSinuationBaseCourse: TEdit;
    StaticText139: TStaticText;
    edtSinuationBasePeriod: TEdit;
    StaticText140: TStaticText;
    edtSinuationAmplitude: TEdit;
    StaticText141: TStaticText;
    edtSinuationOrderedgroundSpeed: TEdit;
    StaticText142: TStaticText;
    grbZigZag: TGroupBox;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    lblZigZagActualGroundSpeed: TLabel;
    Label207: TLabel;
    Label209: TLabel;
    StaticText106: TStaticText;
    edtZigZagBaseCourse: TEdit;
    StaticText108: TStaticText;
    edtZigZagPeriod: TEdit;
    StaticText109: TStaticText;
    edtZigZagAmplitude: TEdit;
    StaticText110: TStaticText;
    edtZigZagOrderedGroundSpeed: TEdit;
    StaticText137: TStaticText;
    grpCircle: TGroupBox;
    grpStation: TGroupBox;
    Label154: TLabel;
    Bevel32: TBevel;
    sbOnTrackAnchorMode: TSpeedButton;
    Label155: TLabel;
    sbOnTrackAnchorTrack: TSpeedButton;
    Label156: TLabel;
    Label157: TLabel;
    lblStationBearingState: TLabel;
    Label159: TLabel;
    StaticText113: TStaticText;
    edtOnTrackAnchorMode: TEdit;
    StaticText114: TStaticText;
    StaticText115: TStaticText;
    edtOnTrackAnchorTrack: TEdit;
    StaticText116: TStaticText;
    edtOnTrackAnchorBearing: TEdit;
    StaticText117: TStaticText;
    edtOnTrackAnchorRange: TEdit;
    grbHelm: TGroupBox;
    Label120: TLabel;
    lblHelmActualTurnRate: TLabel;
    Label127: TLabel;
    Label129: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    lblHelmActualGroundSpeed: TLabel;
    Image2: TImage;
    Label135: TLabel;
    lbActualHelmAngle: TLabel;
    lblHelmActualHeading: TLabel;
    Label137: TLabel;
    lblHelmActualCourse: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    lblHelmActualDepth: TLabel;
    StaticText88: TStaticText;
    StaticText89: TStaticText;
    StaticText90: TStaticText;
    StaticText91: TStaticText;
    StaticText92: TStaticText;
    StaticText93: TStaticText;
    StaticText94: TStaticText;
    edtOrderedHelmAngle: TEdit;
    edtHelmOrderedGroundSpeed: TEdit;
    StaticText95: TStaticText;
    StaticText96: TStaticText;
    StaticText97: TStaticText;
    StaticText98: TStaticText;
    StaticText99: TStaticText;
    StaticText100: TStaticText;
    StaticText101: TStaticText;
    edtHelmOrderedDepth: TEdit;
    gbWaypoint: TGroupBox;
    Label97: TLabel;
    lbName: TLabel;
    lblLongitude: TLabel;
    Label103: TLabel;
    lbGroundSpeed: TLabel;
    Label104: TLabel;
    lbEta: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    lbDistance: TLabel;
    Label177: TLabel;
    Label179: TLabel;
    Label184: TLabel;
    lblLatitude: TLabel;
    lbActualGroundWaypoint: TLabel;
    Bevel19: TBevel;
    Bevel20: TBevel;
    StaticText24: TStaticText;
    StaticText26: TStaticText;
    StaticText27: TStaticText;
    btnWaypoint: TButton;
    StaticText67: TStaticText;
    StaticText71: TStaticText;
    StaticText76: TStaticText;
    StaticText77: TStaticText;
    StaticText78: TStaticText;
    StaticText79: TStaticText;
    StaticText80: TStaticText;
    grbStraightLine: TGroupBox;
    ScrollBox5: TScrollBox;
    whHeading: TVrWheel;
    lblStraightLineActualHeading: TLabel;
    Label128: TLabel;
    lblStraightLineActualGroundSpeed: TLabel;
    Label126: TLabel;
    Label125: TLabel;
    Label124: TLabel;
    Label123: TLabel;
    Label122: TLabel;
    Label121: TLabel;
    lblStraightLineActuaCourse: TLabel;
    Label119: TLabel;
    edtStraightLineOrderedGroundSpeed: TEdit;
    edtStraightLineOrderedHeading: TEdit;
    StaticText87: TStaticText;
    StaticText86: TStaticText;
    StaticText85: TStaticText;
    StaticText84: TStaticText;
    StaticText83: TStaticText;
    StaticText82: TStaticText;
    StaticText81: TStaticText;
    panAltitude: TPanel;
    Label57: TLabel;
    lblActualAltitude: TLabel;
    Label63: TLabel;
    Label65: TLabel;
    StaticText105: TStaticText;
    StaticText107: TStaticText;
    StaticText111: TStaticText;
    edOrderAltitude: TEdit;
    pmGuidance: TPopupMenu;
    mnStraightLine1: TMenuItem;
    mnHelm1: TMenuItem;
    mnCircle: TMenuItem;
    mnStation: TMenuItem;
    mnZigzag1: TMenuItem;
    mnSinuation1: TMenuItem;
    mnFormation2: TMenuItem;
    mnEvasion1: TMenuItem;
    mnWaypoint1: TMenuItem;
    mnOutrun1: TMenuItem;
    mnEngagement1: TMenuItem;
    mnShadow1: TMenuItem;
    mnReturntoBase1: TMenuItem;
    ScrollBox1: TScrollBox;
//    btnCircleMode: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnCircleDirection: TSpeedButton;
    Bevel2: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblCircleActualGroundSpeed: TLabel;
    StaticText1: TStaticText;
    edtCircleMode: TEdit;
    StaticText2: TStaticText;
    StaticText4: TStaticText;
    edtCircleRadius: TEdit;
    StaticText5: TStaticText;
    edtCircleDirection: TEdit;
    StaticText6: TStaticText;
    edtCircleOrderedGroundSpeed: TEdit;
    StaticText7: TStaticText;
    pnlTrack: TPanel;
    Label14: TLabel;
    sbCircleOnTrackTrack: TSpeedButton;
    Label15: TLabel;
    lblCircleDegree: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    sbCircleOnTrackBearing: TSpeedButton;
    StaticText10: TStaticText;
    edtCircleOnTrackTrack: TEdit;
    StaticText11: TStaticText;
    edtCircleOnTrackBearing: TEdit;
    StaticText12: TStaticText;
    edtCircleOnTrackRange: TEdit;
    pnlPosition: TPanel;
    Label2: TLabel;
    StaticText3: TStaticText;
    edtCircleOnPositionPosition: TEdit;
    sbCircleOnPositionPosition: TSpeedButton;
    panDepth: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    txt1: TStaticText;
    txt2: TStaticText;
    txt3: TStaticText;
    wheelHelmAngle: TVrWheel;
    Panel1: TPanel;
    Label20: TLabel;
    Panel2: TPanel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    lblActuaAltitudeHelm: TLabel;
    EdtHelmOrderedAltitude: TEdit;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    edt1: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    pmCircleMode: TPopupMenu;
    Position1: TMenuItem;
    track1: TMenuItem;
    pmCircleDirection: TPopupMenu;
    Clockwise1: TMenuItem;
    Counterclockwise1: TMenuItem;
    lb1: TLabel;
    btnCircleMode: TSpeedButton;
    pmCircleBearingDegree: TPopupMenu;
    True1: TMenuItem;
    Relative1: TMenuItem;
    pnlCoverAltitudeReturnToBase: TPanel;
    pnlAltitudeEngagement: TPanel;
    Label1: TLabel;
    lblAltitudeEngagement: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText16: TStaticText;
    edtAltitudeEngagement: TEdit;
    pnlDepthEngagement: TPanel;
    Label13: TLabel;
    lblDeptEngagMOde: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    Edit2: TEdit;
    edtEngageStandOffDistance: TEdit;
    edtEngageOrderedGroundSpeed: TEdit;
    edtWaypointOrderedGroundSpeed: TEdit;
    Label10: TLabel;
    Label23: TLabel;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    Label29: TLabel;
    lblEvasionActualAltitudeDepth: TLabel;
    Label16: TLabel;
    lblOutrunAltitudeDepth: TLabel;
    panShadowAltitude: TPanel;
    Label28: TLabel;
    lblActShadowAltitude: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText25: TStaticText;
    edtOrdShadowAltitude: TEdit;
    panShadowDepth: TPanel;
    Label33: TLabel;
    lblActShadowDepth: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    StaticText30: TStaticText;
    edtOrdShadowDepth: TEdit;
    pnlStationPosition: TPanel;
    pnlStationTrack: TPanel;
    edtStationPosition: TEdit;
    lbl5: TLabel;
    txt4: TStaticText;
    btnStationAnchorPosition: TSpeedButton;
    chkStationDrift: TCheckBox;
    bvl1: TBevel;
    btnStationOnTrackBearing: TSpeedButton;
    pnlAltitude: TPanel;
    labelFormationAltitude: TLabel;
    Label38: TLabel;
    StaticText31: TStaticText;
    StaticText33: TStaticText;
    pnlDepth: TPanel;
    labelFormationDepth: TLabel;
    Label42: TLabel;
    StaticText34: TStaticText;
    StaticText36: TStaticText;
    pnlStationAltitude: TPanel;
    Label30: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    StaticText32: TStaticText;
    StaticText35: TStaticText;
    StaticText37: TStaticText;
    pnlStationDepth: TPanel;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    StaticText38: TStaticText;
    StaticText39: TStaticText;
    StaticText40: TStaticText;
    edtStationOrderedAltitude: TEdit;
    lblStationActualAltitude: TLabel;
    edtStationOrderedDepth: TEdit;
    lblStationActualDepth: TLabel;
    grpPersonelGuidance: TGroupBox;
    whHeadingPersonel: TVrWheel;
    lbl6: TLabel;
    edtPersonelGuidanceOrderedHeading: TEdit;
    lbl9: TLabel;
    lbl11: TLabel;
    mnPersonelGudance1: TMenuItem;
    pmPersonalGuidance: TPopupMenu;
    walk1: TMenuItem;
    run1: TMenuItem;
    edtPersonelGuidanceOrderedSpeed: TEdit;
    sbPersonalGuidanceMode: TSpeedButton;
    Stop1: TMenuItem;
    Swim1: TMenuItem;
    lbl7: TLabel;
    edtPersonelFormationOrdered: TEdit;
    sbPersonelFormationMode: TSpeedButton;
    pmPersonalFormation: TPopupMenu;
    column1: TMenuItem;
    stagCol1: TMenuItem;
    wedge1: TMenuItem;
    echLeft1: TMenuItem;
    echRight1: TMenuItem;
    vee1: TMenuItem;
    line1: TMenuItem;
    file1: TMenuItem;
    diamond1: TMenuItem;
    btnQuickFormation: TButton;
    Bevel1: TBevel;

    procedure whHeadingChange(Sender: TObject);
    procedure mnGuidanceClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtStraightLineOrderedHeadingKeyPress(Sender: TObject;
          var Key: Char);
    procedure edtStraightLineOrderedGroundSpeedKeyPress(Sender: TObject;
          var Key: Char);
    procedure edOrderAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure btnWaypointClick(Sender: TObject);
    procedure whHeadingMouseUp(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure UpdatemnGuidance(Sender: byte);
    procedure wheelHelmAngleChange(Sender: TObject);
    procedure edtOrderedHelmAngleKeyPress(Sender: TObject; var Key: Char);
    procedure edtHelmOrderedGroundSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure wheelHelmAngleMouseUp(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure sbTrackToEvadeClick(Sender: TObject);
    procedure btnCircleModeClick(Sender: TObject);
    procedure btnCircleDirectionClick(Sender: TObject);
    procedure Clockwise1Click(Sender: TObject);
    procedure Counterclockwise1Click(Sender: TObject);
    procedure Position1Click(Sender: TObject);
    procedure track1Click(Sender: TObject);
    procedure edtCircleRadiusKeyPress(Sender: TObject; var Key: Char);
    procedure edtCircleOrderedGroundSpeedKeyPress(Sender: TObject;
          var Key: Char);
    procedure edtCircleOnPositionPositionChange(Sender: TObject);
    procedure sbCircleOnTrackBearingClick(Sender: TObject);
    procedure True1Click(Sender: TObject);
    procedure Relative1Click(Sender: TObject);
    procedure edtShadowOrdeeredGroundSpeedKeyPress(Sender: TObject;
          var Key: Char);
    procedure edtStandoffDistanceShadowKeyPress(Sender: TObject;
          var Key: Char);
    procedure sbTrackToshadowClick(Sender: TObject);
    procedure Short1Click(Sender: TObject);
    procedure Long1Click(Sender: TObject);
    procedure VeryLong1Click(Sender: TObject);
    procedure mnZigzag1Click(Sender: TObject);
    procedure edtZigZagBaseCourseKeyPress(Sender: TObject; var Key: Char);
    procedure sbCircleOnTrackTrackClick(Sender: TObject);
    procedure edtCircleOnTrackBearingKeyPress(Sender: TObject; var Key: Char);
    procedure edtCircleOnTrackRangeKeyPress(Sender: TObject; var Key: Char);
    procedure sbTrackToOutrunClick(Sender: TObject);
    procedure edtEngageStandOffDistanceKeyPress(Sender: TObject; var Key: Char);
    procedure sbEngageTrackToEngageClick(Sender: TObject);
    procedure edtSinuationBaseCourseKeyPress(Sender: TObject; var Key: Char);
    procedure EdtHelmOrderedAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure edtOnTrackAnchorBearingKeyPress(Sender: TObject; var Key: Char);
    procedure edtWaypointOrderedGroundSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure edtOrdShadowAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure chkStationDriftClick(Sender: TObject);
    procedure edtStationOrderedAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure edtOnTrackAnchorRangeKeyPress(Sender: TObject; var Key: Char);
    procedure sbOnTrackAnchorTrackClick(Sender: TObject);
    procedure btnStationAnchorPositionClick(Sender: TObject);
    procedure sbCircleOnPositionPositionClick(Sender: TObject);
    procedure edtPersonelGuidanceOrderedHeadingKeyPress(Sender: TObject;
      var Key: Char);
    procedure whHeadingPersonelChange(Sender: TObject);
    procedure whHeadingPersonelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbPersonalGuidanceModeClick(Sender: TObject);
    Procedure PersonelGuidanceMode(Sender: TObject);
    procedure PersonelFormationMode(Sender: TObject);
    procedure sbPersonelFormationModeClick(Sender: TObject);
    procedure btnQuickFormationClick(Sender: TObject);
  private
    { Private declarations }
    FATabGuidance: array [0 .. 15] of TRecTabGuidance;
    FFirst : boolean;
    FMapPositionX: double;
    FMapPositionY: double;


    procedure SetMapPositionX(const Value: double);
    procedure SetMapPositionY(const Value: double);
  protected
    procedure DisplayTab(const i: byte); override;
  public
    { Public declarations }
    focused_platform: TSimObject;
    FPlatformMultiSelectList : TList;
    GrpVehicle : T3GroupVehicle;

    procedure SetFocusedPlatform(pi: TT3PlatformInstance);
    procedure InitCreate(sender: TForm); override;
    procedure SetControlledObject(ctrlObj: TObject); override;
    procedure clearPlatformMultiSelectList; override;
    procedure SetPlatformMultiSelectList(ctrlObj: TObject); override;

    procedure Refresh_VisibleTab();
    procedure Refresh_WaypointTab;
    procedure Refresh_StraightLineTab(const first: Boolean);
    procedure Refresh_EngagementTab(const first: Boolean);
    procedure Refresh_EvasionTab;
    procedure Refresh_OutRunTab;
    procedure Refresh_HelmTab;
    procedure Refresh_CircleTab;
    procedure Refresh_ShadowTab;
    procedure Refresh_ReturnToBaseTab;
    procedure Refresh_ZigzagTab;
    procedure Refresh_SinuationTab;
    procedure Refresh_StationTab;
    procedure Refresh_FormationTab;
    procedure Refresh_PersonelGuidanceTab(const first: Boolean);

    procedure UpdateForm; override;
    procedure RemoveListGuidance(ctrlObj: TObject);
    procedure SetReturnToBaseOption;
    procedure ReturnToBaseClick(Sender: TObject);

    property MapPositionX : double read FMapPositionX write SetMapPositionX;
    property MapPositionY : double read FMapPositionY write SetMapPositionY;
  end;

implementation

{$R *.dfm}

uses
  uBaseCoordSystem, tttData, uWaypointEditor,
  uSimMgr_Client, uGameData_TTT, uT3Vehicle,
  uDBAsset_Vehicle, ufTacticalDisplay, uLaunchPlatform, ufToteDisplay,
  DateUtils, Math, uMapXHandler, uDBFormation;

function getTabIndex(const vgt: TVehicleGuidanceType): byte;
const CVGT: array[TVehicleGuidanceType] of byte =
      ( 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13{, 14});
begin
  result := CVGT[vgt];
end;

procedure TfmPlatformGuidance.edOrderAltitudeKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  OrderAltitude, Altitude: double;
  v : TT3Vehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    Altitude := 0;

    case TEdit(Sender).Tag of
      1 :
      begin
        TryStrToFloat(TEdit(Sender).Text, OrderAltitude);
        Altitude := OrderAltitude * C_Feet_To_Meter
      end;
      2 :
      begin
        TryStrToFloat(edt1.Text, OrderAltitude);
        Altitude := OrderAltitude;
      end;
    end;

    if frmTacticalDisplay.ControlEmbarkedPlatform then
    begin
      if Assigned(frmLaunchPlaform) then
      begin
        frmLaunchPlaform.EmbarkedAltitude := Altitude;
        exit;
      end;
    end;

    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;
      //v.OrderedAltitude := Altitude;

      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                    CORD_TYPE_ALTITUDE, (Altitude));
    end;
  end;
end;

procedure TfmPlatformGuidance.edtCircleOnPositionPositionChange(
          Sender: TObject);
var
  v: TT3Vehicle;
begin
  if edtCircleOnPositionPosition.Text <> '' then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;

      if edtCircleOnPositionPosition.Text = 'Clockwise' then
         SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
           CORD_ID_MOVE, CORD_TYPE_COURSE, 10);

      if edtCircleOnPositionPosition.Text = 'Counter-clockwise' then
         SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
           CORD_ID_MOVE, CORD_TYPE_COURSE, -10);
    end;
  end;
end;

procedure TfmPlatformGuidance.edtCircleOnTrackBearingKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  bearing : Double;
  v: TT3Vehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;
      if TryStrToFloat(edtCircleOnTrackBearing.Text, bearing) then
        SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
        CORD_ID_MOVE, CORD_TYPE_CIRCLE_BEARING, bearing)
      else frmTacticalDisplay.addStatus('It is not valid input');
    end;
  end;
end;

procedure TfmPlatformGuidance.edtCircleOnTrackRangeKeyPress(Sender: TObject;
  var Key: Char);
var
  ValKey : set of AnsiChar;
  range : Double;
  v: TT3Vehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;
      if TryStrToFloat(edtCircleOnTrackRange.Text, range) then
        SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
        CORD_ID_MOVE, CORD_TYPE_CIRCLE_RANGE, range)
      else frmTacticalDisplay.addStatus('It is not valid input');
    end;
  end;
end;

procedure TfmPlatformGuidance.edtCircleOrderedGroundSpeedKeyPress(
          Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  Speed: double;
  v : TT3Vehicle;
begin
  ValKey := [#45, #48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;
      if TryStrToFloat(edtCircleOrderedGroundSpeed.Text, Speed) then
      begin
        if (v.FuelRemaining <= 0 ) and (v.UnitMotion.FData.Endurance_Type = 0) then
        begin
          if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            frmTacticalDisplay.addStatus(v.TrackLabel+' Out of Fuel')
          else
            frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Out of Fuel');

          Exit;
        end;

        if (Abs(Speed) > v.Mover.MaxSpeed) then
        begin
          edtCircleOrderedGroundSpeed.Text := FloatToStr(v.Mover.MaxSpeed);

          if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            frmTacticalDisplay.addStatus(v.TrackLabel+' Over Speed = '+FloatToStr(Speed))
          else
            frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Over Speed = '+FloatToStr(Speed));

          Speed := v.Mover.MaxSpeed;     //mk test
        end
        else if (Abs(Speed) < v.Mover.MinSpeed) then //choco
        begin
          edtCircleOrderedGroundSpeed.Text := FloatToStr(v.Mover.MinSpeed);

          if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            frmTacticalDisplay.addStatus(v.TrackLabel + ' MIN SPEED')
          else
            frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber) + ' MIN SPEED');

          Speed := v.Mover.MinSpeed;
        end;

        //--- send record move circle ----//
        //v.OrderedSpeed := Speed;
        SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
          CORD_ID_MOVE, CORD_TYPE_SPEED, Speed)
      end
      else frmTacticalDisplay.addStatus('It is not valid input');
    end;
  end;
end;

procedure TfmPlatformGuidance.edtCircleRadiusKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  radius : double;
  v: TT3Vehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;
      if TryStrToFloat(edtCircleRadius.Text, radius) then
      begin
        if radius > 0 then
        begin
          SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                      CORD_TYPE_CIRCLE_RADIUS, radius);
        end
        else frmTacticalDisplay.addStatus('Radius must more than zero');
      end
      else frmTacticalDisplay.addStatus('It is not valid input');
    end;
  end;
end;

procedure TfmPlatformGuidance.edtEngageStandOffDistanceKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  Distance : double;
  v : TT3Vehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      TryStrToFloat(edtEngageStandOffDistance.Text, Distance);

      v := FControlled as TT3Vehicle;
      //v.EngageDistance := Distance;
      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                        CORD_TYPE_ENGAGE_DISTANCE, Distance);
    end;
  end;
end;

procedure TfmPlatformGuidance.EdtHelmOrderedAltitudeKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  OrderAltitude, Altitude: double;
  v : TT3Vehicle;
begin
  inherited;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    Altitude := 0;

    case TEdit(Sender).Tag of
      1 :
      begin
        TryStrToFloat(TEdit(Sender).Text, OrderAltitude);
        Altitude := OrderAltitude * C_Feet_To_Meter
      end;
      2 :
      begin
        TryStrToFloat(edtHelmOrderedDepth.Text, OrderAltitude);
        Altitude := OrderAltitude;
      end;
    end;

    if frmTacticalDisplay.ControlEmbarkedPlatform then
    begin
      if Assigned(frmLaunchPlaform) then
      begin
        frmLaunchPlaform.EmbarkedAltitude := Altitude;
        exit;
      end;
    end;

    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;
      //v.OrderedAltitude := Altitude;

      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                    CORD_TYPE_ALTITUDE, (Altitude));
    end;
  end;
end;

procedure TfmPlatformGuidance.edtHelmOrderedGroundSpeedKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  Speed: double;
  v : TT3Vehicle;
  i : Integer;
  ctrlObj : TObject;
begin
  ValKey := [#45, #48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      if Assigned(FPlatformMultiSelectList) then
      begin
        if FPlatformMultiSelectList.Count = 0 then
        begin
          TryStrToFloat(edtHelmOrderedGroundSpeed.Text, Speed);
          v := FControlled as TT3Vehicle;

          if (v.FuelRemaining <= 0 ) and (v.UnitMotion.FData.Endurance_Type = 0) then
          begin
            if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
              frmTacticalDisplay.addStatus(v.TrackLabel+' Out of Fuel')
            else
              frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Out of Fuel');

            Exit;
          end;

          if (Abs(Speed) > v.Mover.MaxSpeed) then
          begin
            edtHelmOrderedGroundSpeed.Text := FloatToStr(v.Mover.MaxSpeed);

            if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
              frmTacticalDisplay.addStatus(v.TrackLabel+' OVER SPEED')
            else
              frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' OVER SPEED');

            Speed := v.Mover.MaxSpeed;     //mk test
          end
          else if (Abs(Speed) < v.Mover.MinSpeed) then //choco
          begin
            edtHelmOrderedGroundSpeed.Text := FloatToStr(v.Mover.MinSpeed);

            if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
              frmTacticalDisplay.addStatus(v.TrackLabel + ' MIN SPEED')
            else
              frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber) + ' MIN SPEED');

            Speed := v.Mover.MinSpeed;
          end;

          //------ send record speed helm -------//
          //v.OrderedSpeed := Speed;
          SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                            CORD_TYPE_SPEED, Speed);
        end
        else
        begin
          TryStrToFloat(edtHelmOrderedGroundSpeed.Text, Speed);
          for I := 0 to FPlatformMultiSelectList.Count - 1 do
          begin
            ctrlObj := FPlatformMultiSelectList.Items[i];
            if ctrlObj is TT3Vehicle then
            begin
              v := ctrlObj as TT3Vehicle;
              if (v.FuelRemaining <= 0 ) and (v.UnitMotion.FData.Endurance_Type = 0) then
              begin
                if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                  frmTacticalDisplay.addStatus(v.TrackLabel+' Out of Fuel')
                else
                  frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Out of Fuel');

                Exit;
              end;

              if (Abs(Speed) > v.Mover.MaxSpeed) then
              begin
                edtHelmOrderedGroundSpeed.Text := FloatToStr(v.Mover.MaxSpeed);

                if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                  frmTacticalDisplay.addStatus(v.TrackLabel+' OVER SPEED')
                else
                  frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' OVER SPEED');

                Speed := v.Mover.MaxSpeed;     //mk test
              end
              else if (Abs(Speed) < v.Mover.MinSpeed) then //choco
              begin
                edtHelmOrderedGroundSpeed.Text := FloatToStr(v.Mover.MinSpeed);

                if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                  frmTacticalDisplay.addStatus(v.TrackLabel + ' MIN SPEED')
                else
                  frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber) + ' MIN SPEED');

                Speed := v.Mover.MinSpeed;
              end;

              //v.OrderedSpeed := Speed;
              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                               CORD_TYPE_SPEED, Speed);
              Application.ProcessMessages;
              Sleep(1000);


            end;
          end;

        end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.edtOnTrackAnchorBearingKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  bear : Integer;
  v: TT3Vehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;
      TryStrToInt(edtOnTrackAnchorBearing.Text, bear);

      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                      CORD_TYPE_STATION_BEARING, bear);
    end;
  end;
end;

procedure TfmPlatformGuidance.edtOnTrackAnchorRangeKeyPress(Sender: TObject;
  var Key: Char);
var
  ValKey : set of AnsiChar;
  range : Double;
  v: TT3Vehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;
      TryStrToFloat(edtOnTrackAnchorRange.Text, range);

      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                      CORD_TYPE_STATION_RANGE, range);
    end;
  end;
end;

procedure TfmPlatformGuidance.edtOrderedHelmAngleKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  heading, head: double;
  v: TT3Vehicle;
  max_angle, min_angle: single;
  i : Integer;
  ctrlObj : TObject;
begin
  ValKey := [#48 .. #57, #8, #13, #46, #45];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      if Assigned(FPlatformMultiSelectList) then
      begin
        if FPlatformMultiSelectList.Count = 0 then
        begin
          TryStrToFloat(edtOrderedHelmAngle.Text, heading);

          v := FControlled as TT3Vehicle;

          max_angle := v.UnitMotion.FData.Max_Helm_Angle;
          min_angle := - v.UnitMotion.FData.Max_Helm_Angle;

          if(heading > max_angle)then
            head := max_angle
          else if (heading < min_angle) then
            head := min_angle
          else
            head := heading;

          SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                           CORD_TYPE_COURSE, head);
        end
        else
        begin
          TryStrToFloat(edtOrderedHelmAngle.Text, heading);
          for I := 0 to FPlatformMultiSelectList.Count - 1 do
          begin
            ctrlObj := FPlatformMultiSelectList.Items[i];
            if ctrlObj is TT3Vehicle then
            begin
              v := ctrlObj as TT3Vehicle;

              max_angle := v.UnitMotion.FData.Max_Helm_Angle;
              min_angle := - v.UnitMotion.FData.Max_Helm_Angle;

              if(heading > max_angle)then
                head := max_angle
              else if (heading < min_angle) then
                head := min_angle
              else
                head := heading;

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                               CORD_TYPE_COURSE, head);
              Application.ProcessMessages;
              Sleep(1000);
            end;
          end;

        end;

      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.edtOrdShadowAltitudeKeyPress(Sender: TObject;
  var Key: Char);
var
  ValKey : set of AnsiChar;
  OrderAltitude, Altitude: double;
  v : TT3Vehicle;
begin
  inherited;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    Altitude := 0;

    case TEdit(Sender).Tag of
      1 :
      begin
        TryStrToFloat(TEdit(Sender).Text, OrderAltitude);
        Altitude := OrderAltitude * C_Feet_To_Meter
      end;
      2 :
      begin
        TryStrToFloat(edtOrdShadowDepth.Text, OrderAltitude);
        Altitude := OrderAltitude;
      end;
    end;

    if frmTacticalDisplay.ControlEmbarkedPlatform then
    begin
      if Assigned(frmLaunchPlaform) then
      begin
        frmLaunchPlaform.EmbarkedAltitude := Altitude;
        exit;
      end;
    end;

    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;
      //v.OrderedAltitude := Altitude;

      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                    CORD_TYPE_ALTITUDE, (Altitude));
    end;
  end;
end;

procedure TfmPlatformGuidance.edtPersonelGuidanceOrderedHeadingKeyPress(
  Sender: TObject; var Key: Char);
var
  valKey : set of AnsiChar;
  headingPersonel : Double;
  vi : TT3Vehicle;
  i : Integer;
  ctrlObj : TObject;
begin
  valKey := [#48..#57, #8, #13, #46];

  if not(CharInSet(Key, valKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(edtPersonelGuidanceOrderedHeading.Text, headingPersonel);

    if headingPersonel > 360 then
      headingPersonel := 0;

    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      if Assigned(FPlatformMultiSelectList) then
      begin
        if FPlatformMultiSelectList.Count = 0 then
        begin
          vi := FControlled as TT3Vehicle;
          //vi.OrderedHeading := headingPersonel;

          simMgrClient.netSend_CmdPlatform(vi.InstanceIndex, CORD_ID_MOVE,
                                         CORD_TYPE_COURSE, headingPersonel);
        end
        else
        begin
          for I := 0 to FPlatformMultiSelectList.Count - 1 do
          begin
            ctrlObj := FPlatformMultiSelectList.Items[i];
            if ctrlObj is TT3Vehicle then
            begin
              vi := ctrlObj as TT3Vehicle;
              //vi.OrderedHeading := headingPersonel;
              simMgrClient.netSend_CmdPlatform(vi.InstanceIndex, CORD_ID_MOVE,
                                         CORD_TYPE_COURSE, headingPersonel);
              Application.ProcessMessages;
              Sleep(1000);

            end;
          end;
        end;
      end;
    end;

    if headingPersonel > 180 then
      whHeadingPersonel.Position := Round(headingPersonel - 180)
    else
      whHeadingPersonel.Position := Round(headingPersonel + 180);


  end;
end;

procedure TfmPlatformGuidance.edtWaypointOrderedGroundSpeedKeyPress(Sender: TObject;
  var Key: Char);
var
  ValKey : set of AnsiChar;
  Speed : double;
  v : TT3Vehicle;
begin
  ValKey := [#45, #48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;

      TryStrToFloat(edtWaypointOrderedGroundSpeed.Text, Speed);

      if frmTacticalDisplay.ControlEmbarkedPlatform then
      begin
        if Assigned(frmLaunchPlaform) then
        begin
          frmLaunchPlaform.EmbarkedSpeed := Speed;
          exit;
        end;
      end;

      if (v.FuelRemaining <= 0 ) and (v.UnitMotion.FData.Endurance_Type = 0) then
      begin
        if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
          frmTacticalDisplay.addStatus(v.TrackLabel + ' Out of Fuel')
        else
          frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+ ' Out of Fuel');
        Exit;
      end;

      if (Abs(Speed) > v.Mover.MaxSpeed) then
      begin
        edtWaypointOrderedGroundSpeed.Text := FloatToStr(v.Mover.MaxSpeed);

        if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
          frmTacticalDisplay.addStatus(v.TrackLabel+' Over Speed = '+FloatToStr(Speed))
        else
          frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Over Speed = '+FloatToStr(Speed));

        Speed := v.Mover.MaxSpeed;     //mk test
      end
      else if (Abs(Speed) < v.Mover.MinSpeed) then //choco
      begin
        edtWaypointOrderedGroundSpeed.Text := FloatToStr(v.Mover.MinSpeed);

        if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
          frmTacticalDisplay.addStatus(v.TrackLabel + ' MIN SPEED')
        else
          frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber) + ' MIN SPEED');

        Speed := v.Mover.MinSpeed;
      end;

       //------------ send record speed straightline ------------------//
       //v.OrderedSpeed := Speed;
       SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                        CORD_TYPE_SPEED, Speed);
    end;
  end;
end;

procedure TfmPlatformGuidance.edtShadowOrdeeredGroundSpeedKeyPress(
  Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  Speed : double;
  v : TT3Vehicle;
begin
  ValKey := [#45, #48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      TryStrToFloat(TEdit(Sender).Text, Speed);
      v := FControlled as TT3Vehicle;

      if frmTacticalDisplay.ControlEmbarkedPlatform then
      begin
        if Assigned(frmLaunchPlaform) then
        begin
          frmLaunchPlaform.EmbarkedSpeed := Speed;
          exit;
        end;
      end;

      if (v.FuelRemaining <= 0 ) and (v.UnitMotion.FData.Endurance_Type = 0) then
      begin
        if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
          frmTacticalDisplay.addStatus(v.TrackLabel + ' Out of Fuel')
        else
          frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Out of Fuel');
        Exit;
      end;

      if (Abs(Speed) > v.Mover.MaxSpeed) then
      begin
        edtShadowOrdeeredGroundSpeed.Text := FloatToStr(v.Mover.MaxSpeed);

        if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
          frmTacticalDisplay.addStatus(v.TrackLabel+' Over Speed = '+FloatToStr(Speed))
        else
          frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Over Speed = '+FloatToStr(Speed));

        Speed := v.Mover.MaxSpeed;     //mk test
      end
      else if (Abs(Speed) < v.Mover.MinSpeed) then //choco
      begin
        edtShadowOrdeeredGroundSpeed.Text := FloatToStr(v.Mover.MinSpeed);

        if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
          frmTacticalDisplay.addStatus(v.TrackLabel + ' MIN SPEED')
        else
          frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber) + ' MIN SPEED');

        Speed := v.Mover.MinSpeed;
      end;

       //v.OrderedSpeed := Speed;
       SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                        CORD_TYPE_SPEED, Speed);
    end;
  end;
end;

procedure TfmPlatformGuidance.edtSinuationBaseCourseKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  Course, Period, Amplitudo, Speed : Double;
  v : TT3Vehicle;
begin
  inherited;

  ValKey := [#45, #48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if FControlled is TT3Vehicle then
    begin
      v := FControlled as TT3Vehicle;

      case TEdit(sender).Tag of
        1 : begin
              //Sinuation Course
              Course := StrToFloat(edtSinuationBaseCourse.Text);
              if Course > 360 then
              begin
                Course := 0;
              end;

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                  CORD_TYPE_COURSE, Course);
            end;
        2 : begin
              //Period Sinuation
              if TryStrToFloat(edtSinuationBasePeriod.Text, Period) then
              begin
                if Period > 0 then
                begin
                  SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                    CORD_TYPE_SINUATION_PERIOD, Period);
                end
                else
                begin
                  edtSinuationBasePeriod.Text := FormatFloat('0.00', v.PeriodSinuation);
                  frmTacticalDisplay.addStatus('Sinuation Invalid Periode Value');
                end;
              end
              else
              begin
                edtSinuationBasePeriod.Text := FormatFloat('0.00', v.PeriodSinuation);
                frmTacticalDisplay.addStatus('Sinuation Invalid Periode Value');
              end;

            end;
        3 : begin
              //Amplitudo Sinuation
              if TryStrToFloat(edtSinuationAmplitude.Text, Amplitudo) then
              begin
                if Amplitudo > 0 then
                begin
                  SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                    CORD_TYPE_SINUATION_AMPLITUDO, Amplitudo);
                end
                else
                begin
                  edtSinuationAmplitude.Text := FormatFloat('0.00', v.AmplitudoSinuation);
                  frmTacticalDisplay.addStatus('Sinuation Invalid Amplitudo Value');
                end;
              end
              else
              begin
                edtSinuationAmplitude.Text := FormatFloat('0.00', v.AmplitudoSinuation);
                frmTacticalDisplay.addStatus('Sinuation Invalid Amplitudo Value');
              end;
            end;
        4 : begin
              //Speed Sinuation
              Speed := StrToFloat(edtSinuationOrderedgroundSpeed.Text);

              if (v.FuelRemaining <= 0 ) and (v.UnitMotion.FData.Endurance_Type = 0) then
              begin
                if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                  frmTacticalDisplay.addStatus(v.TrackLabel+' Out of Fuel')
                else
                  frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Out of Fuel');

                Exit;
              end;

              if (v.Mover.MaxSpeed < Abs(Speed) ) then
              begin
                edtSinuationOrderedgroundSpeed.Text := FloatToStr(v.Mover.MaxSpeed);

                if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                  frmTacticalDisplay.addStatus(v.TrackLabel+' Over Speed = '
                                               + FloatToStr(Speed))
                else
                  frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Over Speed = '
                                               + FloatToStr(Speed));

                Speed := v.Mover.MaxSpeed;     //mk test
              end
              else if (Abs(Speed) < v.Mover.MinSpeed) then //choco
              begin
                edtSinuationOrderedgroundSpeed.Text := FloatToStr(v.Mover.MinSpeed);

                if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                  frmTacticalDisplay.addStatus(v.TrackLabel + ' MIN SPEED')
                else
                  frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber) + ' MIN SPEED');

                Speed := v.Mover.MinSpeed;
              end;

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                                CORD_TYPE_SPEED, Speed);
            end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.edtStandoffDistanceShadowKeyPress(
          Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  v : TT3Vehicle;
  distance : Double;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(edtStandoffDistanceShadow.Text, distance);

    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
       v := FControlled as TT3Vehicle;

       //v.ShadowDistance := distance;
       SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                        CORD_TYPE_SHADOW_DISTANCE, distance);
    end;
  end;
end;

procedure TfmPlatformGuidance.edtStationOrderedAltitudeKeyPress(Sender: TObject;
  var Key: Char);
var
  ValKey : set of AnsiChar;
  OrderAltitude, Altitude: double;
  v: TT3Vehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    Altitude := 0;

    case TEdit(Sender).Tag of
      1 :
      begin
        TryStrToFloat(edtStationOrderedAltitude.Text, OrderAltitude);
        Altitude := OrderAltitude * C_Feet_To_Meter
      end;
      2 :
      begin
        TryStrToFloat(edtStationOrderedDepth.Text, OrderAltitude);
        Altitude := OrderAltitude;
      end;
    end;

    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      v := FControlled as TT3Vehicle;

      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                      CORD_TYPE_ALTITUDE, Altitude);
    end;
  end;
end;

procedure TfmPlatformGuidance.edtStraightLineOrderedGroundSpeedKeyPress(
          Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  Speed : double;
  v : TT3Vehicle;
  i : Integer;
  ctrlObj : TObject;
  rec : TRecCmdMultiMode;
begin
  ValKey := [#45, #48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      if Assigned(GrpVehicle) then
      begin
        case TEdit(Sender).Tag of
          1 : TryStrToFloat(edtStraightLineOrderedGroundSpeed.Text, Speed);
          2 : TryStrToFloat(edtEngageOrderedGroundSpeed.Text, Speed);
        end;

        rec.GroupID := GrpVehicle.GroupID;
        StrToChar(GrpVehicle.GroupName, rec.GroupName);
        rec.aAction := Byte(C_SPEED);
        rec.CountVehicle := GrpVehicle.CountVe - 1;
        rec.Param := Speed;
        simMgrClient.netSend_CmdMultiMode(rec);
      end
      else
      begin
        v := FControlled as TT3Vehicle;

        case TEdit(Sender).Tag of
          1 : TryStrToFloat(edtStraightLineOrderedGroundSpeed.Text, Speed);
          2 : TryStrToFloat(edtEngageOrderedGroundSpeed.Text, Speed);
        end;

        if frmTacticalDisplay.ControlEmbarkedPlatform then
        begin
          if Assigned(frmLaunchPlaform) then
          begin
            frmLaunchPlaform.EmbarkedSpeed := Speed;
            exit;
          end;
        end;

        if (v.FuelRemaining <= 0 ) and (v.UnitMotion.FData.Endurance_Type = 0) then
        begin
          if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            frmTacticalDisplay.addStatus(v.TrackLabel + ' Out of Fuel')
          else
            frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+ ' Out of Fuel');
          Exit;
        end;

        if (Abs(Speed) > v.Mover.MaxSpeed) then
        begin
          edtStraightLineOrderedGroundSpeed.Text := FloatToStr(v.Mover.MaxSpeed);

          if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            frmTacticalDisplay.addStatus(v.TrackLabel+' Over Speed = '+FloatToStr(Speed))
          else
            frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Over Speed = '+FloatToStr(Speed));

          Speed := v.Mover.MaxSpeed;     //mk test
        end
        else if (Abs(Speed) < v.Mover.MinSpeed) then //choco
        begin
          edtStraightLineOrderedGroundSpeed.Text := FloatToStr(v.Mover.MinSpeed);

          if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            frmTacticalDisplay.addStatus(v.TrackLabel + ' MIN SPEED')
          else
            frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber) + ' MIN SPEED');

          Speed := v.Mover.MinSpeed;
        end;

         //------------ send record speed straightline ------------------//
         //v.OrderedSpeed := Speed;
         SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                          CORD_TYPE_SPEED, Speed);
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.edtStraightLineOrderedHeadingKeyPress(
          Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  heading: double;
  v: TT3Vehicle;

  i : Integer;
  ctrlObj : TObject;
  rec : TRecCmdMultiMode;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(edtStraightLineOrderedHeading.Text, heading);

	  if heading > 360 then
    begin
      heading := 0;
    end;

    if Assigned(FControlled) and (FControlled is TT3Vehicle) then
    begin
      if Assigned(GrpVehicle) then
      begin
        rec.GroupID := GrpVehicle.GroupID;
        StrToChar(GrpVehicle.GroupName, rec.GroupName);
        rec.aAction := Byte(C_COURSE);
        rec.CountVehicle := GrpVehicle.CountVe - 1;
        rec.Param := heading;
        simMgrClient.netSend_CmdMultiMode(rec);
      end
      else
      begin
        if FControlled is TT3Vehicle then
        begin
          v := FControlled as TT3Vehicle;
          //v.OrderedHeading := heading;

          SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                            CORD_TYPE_COURSE, heading);
          Application.ProcessMessages;
          Sleep(1000);
        end;
      end;
    end;


    if heading > 180 then
      whHeading.Position := Round(heading - 180)
    else
      whHeading.Position := Round(heading + 180);
  end;
end;

procedure TfmPlatformGuidance.edtZigZagBaseCourseKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  Course, Period, Amplitudo, Speed : Double;
  v : TT3Vehicle;
begin
  inherited;

  ValKey := [#45, #48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if FControlled is TT3Vehicle then
    begin
      v := FControlled as TT3Vehicle;

      case TEdit(sender).Tag of
        1 : begin
              //Zigzag Course
              Course := StrToFloat(edtZigZagBaseCourse.Text);
              if Course > 360 then
              begin
                Course := 0;
              end;

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
                CORD_ID_MOVE, CORD_TYPE_COURSE, Course);
            end;
        2 : begin
              //Period Zigzag
              if TryStrToFloat(edtZigZagPeriod.Text, Period) then
              begin
                if Period > 0 then
                begin
                  SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
                    CORD_ID_MOVE, CORD_TYPE_ZIGZAG_PERIOD, Period);
                end
                else
                begin
                  edtZigZagPeriod.Text := FormatFloat('0.00', v.PeriodZigzag);
                  frmTacticalDisplay.addStatus('Zigzag Invalid Periode Value');
                end;
              end
              else
              begin
                edtZigZagPeriod.Text := FormatFloat('0.00', v.PeriodZigzag);
                frmTacticalDisplay.addStatus('Zigzag Invalid Periode Value');
              end;
            end;
        3 : begin
              //Amplitudo Zigzaq
              if TryStrToFloat(edtZigZagAmplitude.Text, Amplitudo) then
              begin
                if Amplitudo > 0 then
                begin
                  SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
                    CORD_ID_MOVE, CORD_TYPE_ZIGZAG_AMPLITUDO, Amplitudo);
                end
                else
                begin
                  edtZigZagAmplitude.Text := FormatFloat('0.00', v.AmplitudoZigzag);
                  frmTacticalDisplay.addStatus('Zigzag Invalid Amplitudo Value');
                end;
              end
              else
              begin
                edtZigZagAmplitude.Text := FormatFloat('0.00', v.AmplitudoZigzag);
                frmTacticalDisplay.addStatus('Zigzag Invalid Amplitudo Value');
              end;

            end;
        4 : begin
              //Speed Zigzaq
              Speed := StrToFloat(edtZigZagOrderedGroundSpeed.Text);

              if (v.FuelRemaining <= 0 ) and (v.UnitMotion.FData.Endurance_Type = 0) then
              begin
                if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                  frmTacticalDisplay.addStatus(v.TrackLabel+' Out of Fuel')
                else
                  frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Out of Fuel');

                Exit;
              end;

              if (v.Mover.MaxSpeed < Abs(Speed) ) then
              begin
                edtZigZagOrderedGroundSpeed.Text := FloatToStr(v.Mover.MaxSpeed);

                if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                  frmTacticalDisplay.addStatus(v.TrackLabel+' Over Speed = '
                                               + FloatToStr(Speed))
                else
                  frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber)+' Over Speed = '
                                               + FloatToStr(Speed));

                Speed := v.Mover.MaxSpeed;     //mk test
              end
              else if (Abs(Speed) < v.Mover.MinSpeed) then //choco
              begin
                edtZigZagOrderedGroundSpeed.Text := FloatToStr(v.Mover.MinSpeed);

                if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                  frmTacticalDisplay.addStatus(v.TrackLabel + ' MIN SPEED')
                else
                  frmTacticalDisplay.addStatus(IntToStr(v.TrackNumber) + ' MIN SPEED');

                Speed := v.Mover.MinSpeed;
              end;

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
                            CORD_ID_MOVE, CORD_TYPE_SPEED, Speed);
            end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.InitCreate(sender: TForm);
var
  v : TT3Vehicle;
begin
  FControlled := nil;

  mnStraightLine1.Tag             :=  Byte(vgtStraightLine);
  mnHelm1.Tag                     :=  Byte(vgtHelm);
  mnCircle.Tag                    :=  Byte(vgtCircle);
  mnStation.Tag                   :=  Byte(vgtStation);
  mnZigzag1.Tag                   :=  Byte(vgtZigzag);
  mnSinuation1.Tag                :=  Byte(vgtSinuation);
  mnFormation2.Tag                :=  Byte(vgtFormation);
  mnEvasion1.Tag                  :=  Byte(vgtEvasion);
  mnWaypoint1.Tag                 :=  Byte(vgtWaypoint);
  mnOutrun1.Tag                   :=  Byte(vgtOutrun);
  mnEngagement1.Tag               := Byte(vgtEngagement);
  mnShadow1.Tag                   := Byte(vgtShadow);
  mnReturntoBase1.Tag             := Byte(vgtReturnToBase);
  mnPersonelGudance1.Tag          := Byte(vgtPersonelGuidance);

  FATabGuidance[Byte(vgtStraightLine)].Caption        := 'Straight Line';
  FATabGuidance[Byte(vgtStraightLine)].GBX            := grbStraightLine;
  FATabGuidance[Byte(vgtStraightLine)].InitGuideType  := Byte(vgtStraightLine);

  FATabGuidance[Byte(vgtHelm)].Caption                := 'Helm';
  FATabGuidance[Byte(vgtHelm)].GBX                    := grbHelm;
  FATabGuidance[Byte(vgtHelm)].InitGuideType          := Byte(vgtHelm);

  FATabGuidance[Byte(vgtCircle)].Caption              := 'Circle';
  FATabGuidance[Byte(vgtCircle)].GBX                  := grpCircle;
  FATabGuidance[Byte(vgtCircle)].InitGuideType        := Byte(vgtCircle);

  FATabGuidance[Byte(vgtStation)].Caption             := 'Station';
  FATabGuidance[Byte(vgtStation)].GBX                 := grpStation;
  FATabGuidance[Byte(vgtStation)].InitGuideType       := Byte(vgtStation);

  FATabGuidance[Byte(vgtZigzag)].Caption              := 'Zigzag';
  FATabGuidance[Byte(vgtZigzag)].GBX                  := grbZigZag;
  FATabGuidance[Byte(vgtZigzag)].InitGuideType        := Byte(vgtZigzag);

  FATabGuidance[Byte(vgtSinuation)].Caption           := 'Sinuation';
  FATabGuidance[Byte(vgtSinuation)].GBX               := grbSinuation;
  FATabGuidance[Byte(vgtSinuation)].InitGuideType     := Byte(vgtSinuation);

  FATabGuidance[Byte(vgtFormation)].Caption           := 'Formation';
  FATabGuidance[Byte(vgtFormation)].GBX               := grbFormation;
  FATabGuidance[Byte(vgtFormation)].InitGuideType     := Byte(vgtFormation);

  FATabGuidance[Byte(vgtEvasion)].Caption             := 'Evasion';
  FATabGuidance[Byte(vgtEvasion)].GBX                 := grbEvasion;
  FATabGuidance[Byte(vgtEvasion)].InitGuideType       := Byte(vgtEvasion);

  FATabGuidance[Byte(vgtWaypoint)].Caption            := 'Waypoint';
  FATabGuidance[Byte(vgtWaypoint)].GBX                := gbWaypoint;
  FATabGuidance[Byte(vgtWaypoint)].InitGuideType      := Byte(vgtWaypoint);

  FATabGuidance[Byte(vgtOutrun)].Caption              := 'Outrun';
  FATabGuidance[Byte(vgtOutrun)].GBX                  := grbOutrun;
  FATabGuidance[Byte(vgtOutrun)].InitGuideType        := Byte(vgtOutrun);

  FATabGuidance[Byte(vgtEngagement)].Caption          := 'Engagement';
  FATabGuidance[Byte(vgtEngagement)].GBX              := grbEngagement;
  FATabGuidance[Byte(vgtEngagement)].InitGuideType    := Byte(vgtEngagement);

  FATabGuidance[Byte(vgtShadow)].Caption              := 'Shadow';
  FATabGuidance[Byte(vgtShadow)].GBX                  := grbShadow;
  FATabGuidance[Byte(vgtShadow)].InitGuideType        := Byte(vgtShadow);

  FATabGuidance[Byte(vgtReturnToBase)].Caption        := 'Return to Base';
  FATabGuidance[Byte(vgtReturnToBase)].GBX            := grbReturnToBase;
  FATabGuidance[Byte(vgtReturnToBase)].InitGuideType  := Byte(vgtReturnToBase);

  FATabGuidance[Byte(vgtPersonelGuidance)].Caption        := 'Personel Guidance';
  FATabGuidance[Byte(vgtPersonelGuidance)].GBX            := grpPersonelGuidance;
  FATabGuidance[Byte(vgtPersonelGuidance)].InitGuideType  := Byte(vgtPersonelGuidance);

  //  mnHelm1
  DisplayTab(byte(vgtStraightLine));
  FFirst := true;

  FPlatformMultiSelectList := TList.Create;
end;

procedure TfmPlatformGuidance.btnCircleDirectionClick(Sender: TObject);
var
  pos: TPoint;
begin
  GetCursorPos(pos);
  pmCircleDirection.Popup(pos.X, pos.Y);
end;

procedure TfmPlatformGuidance.btnCircleModeClick(Sender: TObject);
var
  pos: TPoint;
begin
  GetCursorPos(pos);
  pmCircleMode.Popup(pos.X, pos.Y);
end;

procedure TfmPlatformGuidance.btnQuickFormationClick(Sender: TObject);
var
  v : TT3Vehicle;
  i, j : integer;

  fm : TFormationRefine;
  fa : TClassFormation_Assignment;
  pi : TT3PlatformInstance;
  BearingLead : Double;
  ptForm, ptLead : t2DPoint;
begin
  inherited;
  if Assigned(FControlled) and (FControlled is TT3Vehicle) then
  begin
    v := FControlled as TT3Vehicle;

    for i := 0 to SimMgrClient.Scenario.Formation_List_rev.Count - 1 do
    begin
      fm := SimMgrClient.Scenario.Formation_List_rev.get(I);
      if fm.FFormation_Def.Formation_Leader = TT3Vehicle(v).InstanceIndex then
      begin
        for j := 0 to fm.Count - 1 do
        begin

          fa := fm.get(j);
          pi := simMgrClient.FindT3PlatformByID(fa.Platform_Instance_Index);

          if Assigned(pi) then
          begin
            ptLead.X := TT3Vehicle(pi).LeaderPlatform.PosX;
            ptLead.Y := TT3Vehicle(pi).LeaderPlatform.PosY;

            if TT3Vehicle(pi).FormationState = 0 then
              BearingLead := ValidateDegree(TT3Vehicle(pi).LeaderPlatform.heading +
                             TT3Vehicle(pi).FormationBearing)
            else
              BearingLead := TT3Vehicle(pi).FormationBearing;

            {Mencari titik dlm formasi : ptForm}
            FindPoint(ptLead, ptForm, TT3Vehicle(pi).FormationRange, BearingLead);

            simMgrClient.netSend_CmdPlatform_Move(pi.InstanceIndex,
                                          CORD_ID_REPOS, ptForm.X, ptForm.Y, 0);
            SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                          CORD_HEADING_FORMATION, TT3Vehicle(pi).LeaderPlatform.heading);
            SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                          CORD_SPEED_FORMATION, TT3Vehicle(pi).LeaderPlatform.Speed);
          end;
        end;
      end;
    end;
  end;


end;

procedure TfmPlatformGuidance.btnStationAnchorPositionClick(Sender: TObject);
//var
//  bearing : Double;
begin
  inherited;

  VSimMap.FMap.CurrentTool := mtDeployPosition;
end;

procedure TfmPlatformGuidance.btnWaypointClick(Sender: TObject);
begin
  if Assigned(FControlled) and not Assigned(frmWaypointEditor) then
  begin
    frmWaypointEditor := TfrmWaypointEditor.Create(nil);
    frmWaypointEditor.HookedPlatform := TT3PlatformInstance(FControlled);
    frmWaypointEditor.Show;
  end;
end;

procedure TfmPlatformGuidance.chkStationDriftClick(Sender: TObject);
begin
  inherited;

  if not Assigned(FControlled) or not (FControlled is TT3Vehicle) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is not defined'); //mk
    Exit;
  end;

  if chkStationDrift.Checked then
  begin
    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex, CORD_ID_MOVE,
                  CORD_TYPE_STATION_DRIFT, 1);
  end
  else
  begin
    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex, CORD_ID_MOVE,
                  CORD_TYPE_STATION_DRIFT, 0);
  end;

end;

procedure TfmPlatformGuidance.clearPlatformMultiSelectList;
begin
  inherited;
  FPlatformMultiSelectList.Clear;
end;

procedure TfmPlatformGuidance.Clockwise1Click(Sender: TObject);
var
  v: TT3Vehicle;
begin
  edtCircleDirection.Text := 'Clockwise';

  if Assigned(FControlled) and (FControlled is TT3Vehicle) then
  begin
    v := FControlled as TT3Vehicle;

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
      CORD_ID_MOVE, CORD_TYPE_COURSE, 90);
  end;
end;

procedure TfmPlatformGuidance.Counterclockwise1Click(Sender: TObject);
var
  v: TT3Vehicle;
begin
  edtCircleDirection.Text := 'Counter-clockwise';

  if Assigned(FControlled) and (FControlled is TT3Vehicle) then
  begin
    v := FControlled as TT3Vehicle;

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
      CORD_ID_MOVE, CORD_TYPE_COURSE, -90);
  end;
end;

procedure TfmPlatformGuidance.DisplayTab(const i: byte);
begin
  FActiveTab  := i;
  FATabGuidance[i].GBX.BringToFront;
  edGuidance.Text := FATabGuidance[i].Caption;
  FFirst := True;

  if Assigned(FControlled) then
  begin
    if FControlled is TT3Vehicle then
    begin
      if (TT3Vehicle(FControlled).Altitude > 0)
         or (TT3Vehicle(FControlled).PlatformDomain = vhdAir) then
      begin
        pnlCoverAltitudeReturnToBase.Visible := false;
      end
      else
        pnlCoverAltitudeReturnToBase.Visible := true;
    end;
  end;
end;

procedure TfmPlatformGuidance.mnGuidanceClick(Sender: TObject);
var
  guideType : TVehicleGuidanceType;
  v : TT3Vehicle;
  track : TT3PlatformInstance;
  heading : Double;
  head: double;
  //I,J: Integer;
  //formation : TList;
  //form      : TFormation;
  //p: TT3Vehicle;

  i : Integer;
  ctrlObj : TObject;
begin
  if Assigned(FControlled) then
  begin
    if Assigned(FPlatformMultiSelectList) then
    begin
      if FPlatformMultiSelectList.Count = 0 then
      begin
        if FControlled is TT3Vehicle then
        begin

          v := FControlled as TT3Vehicle;
          FActiveTab := TComponent(Sender).Tag;
          guideType  := TVehicleGuidanceType(FATabGuidance[FActiveTab].InitGuideType);

          if guideType <> vgtFormation then
          begin
            if v.isFormationLeader then
            begin
              TryStrToFloat(FloatToStr(v.Heading), heading);
             // v.OrderedHeading := heading;

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                               CORD_TYPE_COURSE, heading);

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                               CORD_TYPE_SETFORMATION,
                                               0);
            end;
          end;

          if guideType = vgtStraightLine then
          begin
            if Assigned(FControlled) and (FControlled is TT3Vehicle) then
            begin
    //          v := FControlled as TT3Vehicle;

              TryStrToFloat(FloatToStr(v.Heading), heading);
              //v.OrderedHeading := heading;

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                               CORD_TYPE_COURSE, heading);
            end;
          end;

          if guideType = vgtHelm then
          begin
            if Assigned(FControlled) and (FControlled is TT3Vehicle) then
            begin
    //          v := FControlled as TT3Vehicle;

              head:= 0;
             // v.FirstHeading := head;

              if (head > 0)then
                //v.OrderedHeading := head
              else
               // v.OrderedHeading := (360 - (-1 * head));

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                               CORD_TYPE_COURSE, head);
            end;
          end;

          if guideType = vgtShadow then
          begin
            track := nil;

            if Assigned(focused_platform) then
            begin
              if focused_platform is TT3DetectedTrack then
              begin
                track := TT3DetectedTrack(focused_platform).TrackObject as TT3PlatformInstance;
                edtTrackToShadow.Text := IntToStr(TT3DetectedTrack(focused_platform).TrackNumber);
              end
              else if focused_platform is TT3PlatformInstance then
              begin
                track := focused_platform as TT3PlatformInstance;
                edtTrackToShadow.Text := TT3PlatformInstance(focused_platform).TrackLabel;
              end;

              if Assigned(track) then
              begin
                SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                        CORD_TYPE_SHADOW_TRACK, track.InstanceIndex);
              end;
            end;
          end;

          if guideType = vgtCircle then
          begin
            case (v.Circle_mode) of
              1 :
                begin
                  edtCircleMode.Text := 'Position';
                  pnlTrack.Visible   := false;
                  pnlPosition.Visible:= true;

                  edtCircleOnPositionPosition.Text := formatDM_longitude(v.CenterCirclePointX)
                                      + ' '+ formatDM_latitude(v.CenterCirclePointY);
                end;
              2 :
                begin
                  edtCircleMode.Text := 'Track';
                  pnlTrack.Visible   := true;
                  pnlPosition.Visible:= false;

                  if v.CircleTrack <> nil then
                  begin
                    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                      edtCircleOnTrackTrack.Text := v.CircleTrack.Track_ID
                    else
                      edtCircleOnTrackTrack.Text := IntToStr(v.CircleTrack.TrackNumber);

                    edtCircleOnTrackBearing.Text := FormatFloat('0.00', v.CircleBearing);

                    case v.Circle_bearing_state of
                      1: lblCircleDegree.Caption  := 'degrees T';
                      2: lblCircleDegree.Caption  := 'degrees R';
                    end;

                    edtCircleOnTrackRange.Text   := FormatFloat('0.00', v.CircleRange);

                    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                      CORD_TYPE_CIRCLE_TRACK, v.CircleTrack.InstanceIndex);
                  end;
                end;
            end;

            if v.CircleRadius <= 0 then
              v.CircleRadius := 1;

            edtCircleRadius.Text  := FormatFloat('0.0', v.CircleRadius);

            SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
              CORD_TYPE_CIRCLE_RADIUS, v.CircleRadius);

            if v.CircleDirection = 90 then
              edtCircleDirection.Text := 'Clockwise'
            else
            if v.CircleDirection = -90 then
              edtCircleDirection.Text := 'Counter-clockwise';

            edtCircleOrderedGroundSpeed.Text := FloatToStr(v.OrderedSpeed);
          end;

          if guideType = vgtEvasion then
            sbTrackToEvade.Click;

          if guideType = vgtOutrun then
            sbTrackToOutrun.Click;

          if guideType = vgtEngagement then
            sbEngageTrackToEngage.Click;

          if guideType = vgtFormation then
          begin
            btnQuickFormation.Visible := False;
            if v.isFormationLeader then
            begin
              btnQuickFormation.Visible := True;
            end;

            TryStrToFloat(FloatToStr(v.Heading), heading);
           // v.OrderedHeading := heading;

            SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                             CORD_TYPE_COURSE, heading);

            SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                                     CORD_TYPE_SETFORMATION,
                                                     1);
          end;

          if guideType = vgtStation then
          begin
            case (v.StationMode) of
              1 :
                begin
                  edtOnTrackAnchorMode.Text := 'Position';
                  pnlStationTrack.Visible   := false;
                  pnlStationPosition.Visible:= true;

                  edtStationPosition.Text := formatDM_longitude(v.StationPostX)
                                      + ' '+ formatDM_latitude(v.StationPostY);

                  if v.StationDrift then
                    chkStationDrift.Checked := True
                  else
                    chkStationDrift.Checked := False;

                  SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                      CORD_TYPE_CIRCLE_MODE, 1);
                end;
              2 :
                begin
                  edtOnTrackAnchorTrack.Text := 'Track';
                  pnlStationTrack.Visible   := true;
                  pnlStationPosition.Visible:= false;

                  if v.StationTrack <> nil then
                  begin
                    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                      edtOnTrackAnchorTrack.Text := v.StationTrack.Track_ID
                    else
                      edtOnTrackAnchorTrack.Text := IntToStr(v.StationTrack.TrackNumber);

                    edtOnTrackAnchorBearing.Text := FormatFloat('000', v.StationBearing);

                    case v.StationBearing_state of
                      1: lblStationBearingState.Caption  := 'degrees T';
                      2: lblStationBearingState.Caption  := 'degrees R';
                    end;

                    edtOnTrackAnchorRange.Text   := FormatFloat('000', v.StationRange);

                    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                      CORD_TYPE_STATION_MODE, 2);

                    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                      CORD_TYPE_STATION_TRACK, v.StationTrack.InstanceIndex);
                  end;
                end;
            end;

            edtStationOrderedAltitude.Text  := FormatAltitude(v.OrderedAltitude / C_Feet_To_Meter);
            edtStationOrderedDepth.Text     := FormatAltitude(v.OrderedAltitude);

            edtCircleOrderedGroundSpeed.Text := FloatToStr(v.OrderedSpeed);
            Position1Click(Sender);
          end;

          if guideType = vgtPersonelGuidance then
          begin
            if Assigned(FControlled) and (FControlled is TT3Vehicle) then
            begin

              TryStrToFloat(FloatToStr(v.Heading), heading);
              v.OrderedHeading := heading;

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                               CORD_TYPE_COURSE, heading);
            end;
          end;

          SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_ACTIVATION,
                                           byte(guideType), 0.0);

          DisplayTab(FActiveTab);
        end;
      end
      else
      begin
        FActiveTab := TComponent(Sender).Tag;
        guideType  := TVehicleGuidanceType(FATabGuidance[FActiveTab].InitGuideType);
        DisplayTab(FActiveTab);

        for I := 0 to FPlatformMultiSelectList.Count - 1 do
        begin
          ctrlObj := FPlatformMultiSelectList.Items[i];
          if ctrlObj is TT3Vehicle then
          begin
            v := ctrlObj as TT3Vehicle;
            if guideType = vgtStraightLine then
            begin
              TryStrToFloat(FloatToStr(v.Heading), heading);
              //v.OrderedHeading := heading;

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                               CORD_TYPE_COURSE, heading);
              Application.ProcessMessages;
              Sleep(1000);
            end;

            if guideType = vgtHelm then
            begin
              head:= 0;
              v.FirstHeading := head;

              if (head > 0)then
               // v.OrderedHeading := head
              else
               // v.OrderedHeading := (360 - (-1 * head));

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                                 CORD_TYPE_COURSE, head);
              Application.ProcessMessages;
              Sleep(1000);
            end;

            SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_ACTIVATION,
                                             byte(guideType), 0.0);

          end;
        end;

      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.mnZigzag1Click(Sender: TObject);
begin
  inherited;
  //x
end;

procedure TfmPlatformGuidance.Short1Click(Sender: TObject);
var
  v : TT3Vehicle;
begin
  inherited;

  if Assigned(FControlled) and (FControlled is TT3Vehicle) then
  begin
    v := FControlled as TT3Vehicle;

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
        CORD_ID_ACTIVATION, byte(vgtZigzag) , 1);
  end;
end;

procedure TfmPlatformGuidance.Long1Click(Sender: TObject);
var
  v : TT3Vehicle;
begin
  inherited;

  if Assigned(FControlled) and (FControlled is TT3Vehicle) then
  begin
    v := FControlled as TT3Vehicle;

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
        CORD_ID_ACTIVATION, byte(vgtZigzag) , 2);
  end;
end;

procedure TfmPlatformGuidance.VeryLong1Click(Sender: TObject);
var
  v : TT3Vehicle;
begin
  inherited;

  if Assigned(FControlled) and (FControlled is TT3Vehicle) then
  begin
    v := FControlled as TT3Vehicle;

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
        CORD_ID_ACTIVATION, byte(vgtZigzag) , 3);
  end;
end;

procedure TfmPlatformGuidance.PersonelFormationMode(Sender: TObject);
var
  i : Integer;
  sim : TSimMgr_Client;
  v : TT3Vehicle;
  ctrlObj : TObject;
begin
  if Assigned(FPlatformMultiSelectList) then
  begin
    if FPlatformMultiSelectList.Count = 0 then
    begin
      if Assigned(FControlled) and (FControlled is TT3Vehicle) then
      begin
        v := FControlled as TT3Vehicle;

        if FActiveTab = Byte(vgtPersonelGuidance) then
        begin
          if TMenuItem(Sender).Name = 'column1' then
          begin
            v.FormationMode := fColumn;
            edtPersonelFormationOrdered.Text := fColumns;
          end;
          if TMenuItem(Sender).Name = 'stagCol1' then
          begin
            v.FormationMode := fStagColumn;
            edtPersonelFormationOrdered.Text := fStagColumns;
          end;
          if TMenuItem(Sender).Name = 'wedge1' then
          begin
            v.FormationMode := fWedge;
            edtPersonelFormationOrdered.Text := fWedges;
          end;
          if TMenuItem(Sender).Name = 'echLeft1' then
          begin
            v.FormationMode := fEchLeft;
            edtPersonelFormationOrdered.Text := fEchLefts;
          end;
          if TMenuItem(Sender).Name = 'echRight1' then
          begin
            v.FormationMode := fEchRight;
            edtPersonelFormationOrdered.Text := fEchRights;
          end;
          if TMenuItem(Sender).Name = 'vee1' then
          begin
            v.FormationMode := fVee;
            edtPersonelFormationOrdered.Text := fVees;
          end;
          if TMenuItem(Sender).Name = 'line1' then
          begin
            v.FormationMode := fLine;
            edtPersonelFormationOrdered.Text := fLines;
          end;
          if TMenuItem(Sender).Name = 'file1' then
          begin
            v.FormationMode := fFile;
            edtPersonelFormationOrdered.Text := fFiles;
          end;
          if TMenuItem(Sender).Name = 'diamond1' then
          begin
            v.FormationMode := fDiamond;
            edtPersonelFormationOrdered.Text := fDiamonds;
          end;

          sim.netSend_CmdPersonelMove(simMgrClient.SessionID, v.InstanceIndex,
            v.Heading, v.MoveMode, v.FormationMode);

          SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
              CORD_TYPE_PERSONEL_FORMATION, v.FormationMode);
        end;
      end;
    end
    else
    begin
      for I := 0 to FPlatformMultiSelectList.Count - 1 do
      begin
        ctrlObj := FPlatformMultiSelectList.Items[i];
        if ctrlObj is TT3Vehicle then
        begin
          v := ctrlObj as TT3Vehicle;

          if  v.PlatformDomain <> vhdGrpPersonel   then
            Continue;

          if FActiveTab = Byte(vgtPersonelGuidance) then
          begin
            if TMenuItem(Sender).Name = 'column1' then
            begin
              v.FormationMode := fColumn;
              edtPersonelFormationOrdered.Text := fColumns;
            end;
            if TMenuItem(Sender).Name = 'stagCol1' then
            begin
              v.FormationMode := fStagColumn;
              edtPersonelFormationOrdered.Text := fStagColumns;
            end;
            if TMenuItem(Sender).Name = 'wedge1' then
            begin
              v.FormationMode := fWedge;
              edtPersonelFormationOrdered.Text := fWedges;
            end;
            if TMenuItem(Sender).Name = 'echLeft1' then
            begin
              v.FormationMode := fEchLeft;
              edtPersonelFormationOrdered.Text := fEchLefts;
            end;
            if TMenuItem(Sender).Name = 'echRight1' then
            begin
              v.FormationMode := fEchRight;
              edtPersonelFormationOrdered.Text := fEchRights;
            end;
            if TMenuItem(Sender).Name = 'vee1' then
            begin
              v.FormationMode := fVee;
              edtPersonelFormationOrdered.Text := fVees;
            end;
            if TMenuItem(Sender).Name = 'line1' then
            begin
              v.FormationMode := fLine;
              edtPersonelFormationOrdered.Text := fLines;
            end;
            if TMenuItem(Sender).Name = 'file1' then
            begin
              v.FormationMode := fFile;
              edtPersonelFormationOrdered.Text := fFiles;
            end;
            if TMenuItem(Sender).Name = 'diamond1' then
            begin
              v.FormationMode := fDiamond;
              edtPersonelFormationOrdered.Text := fDiamonds;
            end;

            sim.netSend_CmdPersonelMove(simMgrClient.SessionID, v.InstanceIndex,
              v.Heading, v.MoveMode, v.FormationMode);

            Application.ProcessMessages;
            Sleep(1000);

            SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
              CORD_TYPE_PERSONEL_FORMATION, v.FormationMode);
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.PersonelGuidanceMode(Sender: TObject);
var
  v : TT3Vehicle;
  speedPersonel : Double;
  i : Integer;
  sim : TSimMgr_Client;
  ctrlObj : TObject;
begin
  if Assigned(FPlatformMultiSelectList) then
  begin
    if FPlatformMultiSelectList.Count = 0 then
    begin
      if Assigned(FControlled) and (FControlled is TT3Vehicle) then
      begin
        v := FControlled as TT3Vehicle;

        if FActiveTab = Byte(vgtPersonelGuidance) then
        begin
          if TMenuItem(Sender).Name = 'walk1' then
          begin
            v.MoveMode := pWalk;

            edtPersonelGuidanceOrderedSpeed.Text := pWalks;
          end;
          if TMenuItem(Sender).Name = 'run1' then
          begin
            v.MoveMode := pRun;

            edtPersonelGuidanceOrderedSpeed.Text := pRuns;
          end;
          if TMenuItem(Sender).Name = 'Stop1' then
          begin
            v.MoveMode := pStop;

            edtPersonelGuidanceOrderedSpeed.Text := pStops;
          end;
          if TMenuItem(Sender).Name = 'Swim1' then
          begin
            edtPersonelGuidanceOrderedSpeed.Text := pSwims;
          end;

          sim.netSend_CmdPersonelMove(simMgrClient.SessionID, v.InstanceIndex,
            v.Heading, v.MoveMode, v.FormationMode);
		  
		  sim.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                CORD_TYPE_SPEED, v.MoveMode);
        end;
      end;

    end
    else
    begin
      for I := 0 to FPlatformMultiSelectList.Count - 1 do
      begin
        ctrlObj := FPlatformMultiSelectList.Items[i];

        if ctrlObj is TT3Vehicle then
        begin
          v := ctrlObj as TT3Vehicle;

          if  v.PlatformDomain <> vhdGrpPersonel   then
            Continue;
          if FActiveTab = Byte(vgtPersonelGuidance) then
          begin
            if TMenuItem(Sender).Name = 'walk1' then
            begin
              v.MoveMode := pWalk;

              edtPersonelGuidanceOrderedSpeed.Text := pWalks;
            end;
            if TMenuItem(Sender).Name = 'run1' then
            begin
              v.MoveMode := pRun;

              edtPersonelGuidanceOrderedSpeed.Text := pRuns;
            end;
            if TMenuItem(Sender).Name = 'Stop1' then
            begin
              v.MoveMode := pStop;

              edtPersonelGuidanceOrderedSpeed.Text := pStops;
            end;
            if TMenuItem(Sender).Name = 'Swim1' then
            begin
              edtPersonelGuidanceOrderedSpeed.Text := pSwims;
            end;

            sim.netSend_CmdPersonelMove(simMgrClient.SessionID, v.InstanceIndex,
              v.Heading, v.MoveMode, v.FormationMode);

            Application.ProcessMessages;
            Sleep(1000);

            sim.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                CORD_TYPE_SPEED, v.MoveMode);
          end;

        end;
      end;

      
    end;
  end;

end;

procedure TfmPlatformGuidance.Position1Click(Sender: TObject);
var
  v: TT3Vehicle;
begin
  if Assigned(FControlled) and (FControlled is TT3Vehicle) then
  begin
    v := FControlled as TT3Vehicle;

    if FActiveTab = Byte(vgtCircle) then
    begin
      edtCircleMode.Text  := 'Position';
      pnlPosition.Visible := true;
      pnlTrack.Visible    := false;

      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                  CORD_TYPE_CIRCLE_MODE, 1);
    end
    else if FActiveTab = Byte(vgtStation) then
    begin
      edtOnTrackAnchorMode.Text  := 'Position';
      pnlStationPosition.Visible := true;
      pnlStationTrack.Visible    := false;

      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                  CORD_TYPE_STATION_MODE, 1);

//      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
//                  CORD_TYPE_STATION_STOP, 0);
    end;
  end;
end;

procedure TfmPlatformGuidance.SetControlledObject(ctrlObj: TObject);
var
  i   : integer;
begin
  inherited;

  FFirst := true;

  if FControlled is TT3Vehicle then
  begin
    i :=  Byte(TVehicle_Definition(TT3Vehicle(FControlled).UnitDefinition)
          .GuidanceType);
    //DisplayTab(i);   ***comment and added by bebe

    PanelPlatformGuidance.Enabled := True;
    SpeedButton2.Enabled  := True;
    UpdatemnGuidance(i);
  end
  else
  begin
    PanelPlatformGuidance.Enabled := False;
    SpeedButton2.Enabled  := False;
  end;
end;

procedure TfmPlatformGuidance.SpeedButton2Click(Sender: TObject);
var
  pos: TPoint;
  I : Integer;
  formation : TFormation;
  fm : TFormationRefine;
  //form      : TFormation;
  //p: TT3Vehicle;
begin
  if Assigned(focused_platform) and Assigned(FControlled) then
  begin
    if TT3PlatformInstance(focused_platform).InstanceIndex
        = TT3PlatformInstance(FControlled).InstanceIndex then
    begin
      mnEvasion1.Enabled := False;
      //mnEngagement1.Enabled := False;
      mnOutrun1.Enabled := False;
      mnShadow1.Enabled := False;
    end
    else
    begin
      mnEvasion1.Enabled := True;
      //mnEngagement1.Enabled := True;
      mnOutrun1.Enabled := True;
      mnShadow1.Enabled := True;
    end;

    if (TT3PlatformInstance(FControlled).PlatformDomain = vhdAir) or
       (TT3PlatformInstance(FControlled).PlatformDomain = vhdSubsurface) then
    begin
      mnStation.Enabled := True;
    end
    else
      mnStation.Enabled := False;

    if FControlled is TT3Vehicle then
    begin
      if simMgrClient.Scenario.Formation_List_rev.PlatformIsLeader(TT3Vehicle(FControlled).InstanceIndex) then
        mnFormation2.Enabled := True
      else
        mnFormation2.Enabled := False;
    end;

    if (TT3PlatformInstance(FControlled).PlatformDomain = vhdGrpPersonel) then
    begin
      mnStraightLine1.Enabled := False;
      mnHelm1.Enabled := False;
      mnCircle.Enabled := False;
      mnStation.Enabled := False;
      mnZigzag1.Enabled := False;
      mnSinuation1.Enabled := False;
      mnEvasion1.Enabled := False;
      mnWaypoint1.Enabled := False;
      mnOutrun1.Enabled := False;
      mnShadow1.Enabled := False;
      mnReturntoBase1.Enabled := False;

      mnPersonelGudance1.Enabled := True;
    end
    else
    begin
      mnStraightLine1.Enabled := True;
      mnHelm1.Enabled := True;
      mnCircle.Enabled := True;
      mnStation.Enabled := True;
      mnZigzag1.Enabled := True;
      mnSinuation1.Enabled := True;
      mnEvasion1.Enabled := True;
      mnWaypoint1.Enabled := True;
      mnOutrun1.Enabled := True;
      mnShadow1.Enabled := True;
      mnReturntoBase1.Enabled := True;

      mnPersonelGudance1.Enabled := False;
    end;


    if Assigned(GrpVehicle) then
    begin
      mnStraightLine1.Enabled := True;
      mnHelm1.Enabled := False;
      mnCircle.Enabled := False;
      mnStation.Enabled := False;
      mnZigzag1.Enabled := False;
      mnSinuation1.Enabled := False;
      mnEvasion1.Enabled := False;
      mnWaypoint1.Enabled := False;
      mnOutrun1.Enabled := False;
      mnShadow1.Enabled := False;
      mnReturntoBase1.Enabled := False;

      mnPersonelGudance1.Enabled := False;
    end;
  end;

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
    SetReturnToBaseOption;

  GetCursorPos(pos);
  pmGuidance.Popup(pos.X, pos.Y);
end;

procedure TfmPlatformGuidance.track1Click(Sender: TObject);
var
  v: TT3Vehicle;
  track : TT3PlatformInstance;
  bearing : Double;
begin
  if not Assigned(FControlled) or not (FControlled is TT3Vehicle) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is not defined'); //mk
    Exit;
  end;

  v := TT3Vehicle(FControlled);

  if FActiveTab = Byte(vgtCircle) then
  begin
    edtCircleMode.Text  := 'Track';
    pnlPosition.Visible := False;
    pnlTrack.Visible    := True;

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                CORD_TYPE_CIRCLE_MODE, 2);
  end
  else if FActiveTab = Byte(vgtStation) then
  begin
    edtOnTrackAnchorMode.Text  := 'Track';
    pnlStationPosition.Visible := False;
    pnlStationTrack.Visible    := True;

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                CORD_TYPE_STATION_MODE, 2);

//    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
//                CORD_TYPE_STATION_STOP, 0);
  end;

  if not Assigned(focused_platform) then
  begin
    frmTacticalDisplay.addStatus('Target is not selected'); //mk
    Exit;
  end;

  track := TT3PlatformInstance(focused_platform);

  if v.InstanceIndex = track.InstanceIndex then
  begin
    frmTacticalDisplay.addStatus('Own platform can not be target');
    Exit;
  end;

  if focused_platform is TT3DetectedTrack then
  begin
    track := TT3DetectedTrack(focused_platform).TrackObject as TT3PlatformInstance;
  end
  else if focused_platform is TT3PlatformInstance then
  begin
    track := focused_platform as TT3PlatformInstance;
  end
  else
  begin
    frmTacticalDisplay.addStatus('Target is not suitable'); //mk
    Exit;
  end;

  if FActiveTab = Byte(vgtCircle) then
  begin
    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex, CORD_ID_MOVE,
      CORD_TYPE_CIRCLE_TRACK, track.InstanceIndex);
  end
  else if FActiveTab = Byte(vgtStation) then
  begin
    bearing := CalcBearing(TT3Vehicle(FControlled).PosX,
                 TT3Vehicle(FControlled).PosY, track.PosX, track.PosY);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
      CORD_ID_MOVE, CORD_TYPE_COURSE, bearing);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
      CORD_ID_MOVE, CORD_TYPE_SPEED, TT3Vehicle(FControlled).Mover.MaxSpeed);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex, CORD_ID_MOVE,
      CORD_TYPE_STATION_TRACK, track.InstanceIndex);
  end;
end;

procedure TfmPlatformGuidance.UpdateForm;
begin
  inherited;
  Refresh_VisibleTab;
end;

procedure TfmPlatformGuidance.SetReturnToBaseOption;
var
  I,J: Integer; //add andi_29032012
  p : TSimObject;
  mn : TMenuItem;
  v : TT3Vehicle;    //add andi_29032012
  vEmbark : TT3EmbarkedVehicle;  //add andi_29032012
begin
  if mnReturntoBase1.Count > 0 then
  begin
    mnReturntoBase1.Clear;
  end;

  if focused_platform is TT3Vehicle then
  begin
    v := TT3Vehicle(focused_platform);

    with simMgrClient do
    begin
      for I := 0 to SimPlatforms.itemCount - 1 do
      begin
        p := SimPlatforms.getObject(I);
        if p is TT3Vehicle then
        begin
          if TT3Vehicle(p).EmbarkedVehicles.Count > 0 then
          begin
            //====add andi_29032012
            for  j := 0 to TT3Vehicle(p).EmbarkedVehicles.Count - 1 do
            begin
              vEmbark:=TT3Vehicle(p).EmbarkedVehicles[j];
              if (vEmbark.EmbarkedVehicle.Hosted_Vehicle_Index) = (v.VehicleDefinition.FData.Vehicle_Index) then
              begin
                mn := TMenuItem.Create(nil);
                mn.Caption := TT3Vehicle(p).InstanceName;
                mn.Tag := TT3Vehicle(p).InstanceIndex;
                mn.OnClick := ReturnToBaseClick;
                mnReturntoBase1.Add(mn);
                Break;
              end
              else Continue;
            end;
          end
          else
           Continue;//===end andi_29032012
        end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.ReturnToBaseClick(Sender: TObject);
begin
  if Assigned(FControlled) and (FControlled is TT3PlatformInstance) then
  begin
    //activate return to base
    SimMgrClient.netSend_CmdPlatform(TT3PlatformInstance(FControlled).InstanceIndex,
            CORD_ID_ACTIVATION, byte(vgtReturnToBase) , 0.0);

    // ngirim base kapalnya... mau kembali kemana dia?
    SimMgrClient.netSend_CmdPlatform(TT3PlatformInstance(FControlled).InstanceIndex,
              CORD_ID_MOVE ,CORD_TYPE_RTB_BASEVEHICLE, TMenuItem(Sender).Tag);

    Self.focused_platform := simMgrClient.FindT3PlatformByID(TMenuItem(Sender).Tag);
  end;
end;

procedure TfmPlatformGuidance.Refresh_VisibleTab();
begin
  if Assigned(FControlled) and (FControlled is TT3PlatformInstance) then
  begin
    if not TT3PlatformInstance(FControlled).Initialized then
      exit;

//    if FControlled is TT3Vehicle then
//      if Byte(TT3Vehicle(FControlled).GuidanceType) <> Byte(FActiveTab) then
//        Exit;

    case FActiveTab of
      Byte(vgtStraightLine) : Refresh_StraightLineTab(true);
      Byte(vgtHelm)         : Refresh_HelmTab;
      Byte(vgtCircle)       : Refresh_CircleTab;
      Byte(vgtZigzag)       : Refresh_ZigzagTab;
      Byte(vgtSinuation)    : Refresh_SinuationTab;
      Byte(vgtEvasion)      : Refresh_EvasionTab;
      Byte(vgtWaypoint)     : Refresh_WaypointTab;
      Byte(vgtOutrun)       : Refresh_OutRunTab;
      Byte(vgtEngagement)   : Refresh_EngagementTab(false);
      Byte(vgtShadow)       : Refresh_ShadowTab;
      Byte(vgtReturnToBase) : Refresh_ReturnToBaseTab;
      Byte(vgtStation)      : Refresh_StationTab;
      Byte(vgtFormation)    : Refresh_FormationTab;
      Byte(vgtPersonelGuidance): Refresh_PersonelGuidanceTab(True);
    end;
  end
  else if Assigned(GrpVehicle) then
  begin
    Refresh_StraightLineTab(true);
  end;
end;

procedure TfmPlatformGuidance.Refresh_WaypointTab;
  function FormatNumber(val : integer) : string;
  var tmp : string;
  begin
    tmp := IntToStr(val);
    if Length(tmp) < 2 then tmp := '0' + tmp;
    result := tmp;
  end;
var
  range : double;
  timeToGo : integer;
begin
  if (FControlled = nil) then
    exit;

  if (FControlled is TT3Vehicle) then
  begin
    with TT3Vehicle(FControlled) do
    begin
      if FFirst then
      begin
        FFirst := False;
        edtWaypointOrderedGroundSpeed.Text := FormatSpeed(OrderedSpeed);
      end;

      if Assigned(Waypoints.NextWaypoint) then
      begin
        lbName.Caption        := 'Waypoint ' + IntToStr(Waypoints.NextWaypoint.FData.Scripted_Event_Index);
        lblLongitude.Caption  := formatDMS_long(Waypoints.NextWaypoint.FData.Waypoint_Longitude);
        lblLatitude.Caption   := formatDMS_latt(Waypoints.NextWaypoint.FData.Waypoint_Latitude);
        lbGroundSpeed.Caption := FormatSpeed(Waypoints.NextWaypoint.FData.Speed);

        range := CalcRange(getPositionX, getPositionY, Waypoints.NextWaypoint.FData.Waypoint_Longitude,
                           Waypoints.NextWaypoint.FData.Waypoint_Latitude);

        lbDistance.Caption    := FormatFloat('000.0', range);


        if Speed > 0 then
        begin
          range := range + CalcRange(PosX,PosY,
            Waypoints.NextWaypoint.FData.Waypoint_Longitude,
            Waypoints.NextWaypoint.FData.Waypoint_Latitude);

          timeToGo := Ceil((range / Speed) * 3600);

          lbEta.Caption := FormatDateTime('ddhhnnss',
            IncSecond(simMgrClient.GameTIME, timeToGo)) + 'Z' +
            FormatDateTime('mmmyyyy', IncSecond(simMgrClient.GameTIME, timeToGo));
        end
        else
          lbEta.Caption := '---';
      end
      else
      begin
        lbName.Caption        := '---';
        lblLongitude.Caption  := '---';
        lblLatitude.Caption   := '---';
        lbGroundSpeed.Caption := '0.0';
        lbDistance.Caption    := '000';
        lbEta.Caption         := '---';
      end;

      lbActualGroundWaypoint.Caption  := FormatSpeed(Speed);
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_ZigzagTab;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    with TT3Vehicle(FControlled) do
    begin
      lblZigZagActualGroundSpeed.Caption := FormatSpeed(Speed);
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_SinuationTab;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    with TT3Vehicle(FControlled) do
    begin
      lblSinuationActualGroundSpeed.Caption := FormatSpeed(Speed);
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_StationTab;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    with TT3Vehicle(FControlled) do
    begin
      lblStationActualAltitude.Caption := FormatAltitude(Altitude / C_Feet_To_Meter);
      lblStationActualDepth.Caption    := FormatAltitude(Altitude);

      if FFirst then
      begin
        FFirst := False;
        case StationMode of
          1 :
          begin
            pnlStationPosition.BringToFront;
            edtStationPosition.Text := formatDM_longitude(StationPostX) + ' ' + formatDM_latitude(StationPostY);
          end;
          2 :
          begin
            pnlStationTrack.BringToFront;
            edtOnTrackAnchorTrack.Text
          end;
        end;

        case TVehicle_Definition(UnitDefinition).FData.Platform_Domain of
          0 :  //air
          begin
            pnlStationAltitude.Visible := True;
            pnlStationDepth.Visible    := false;

            edtStationOrderedAltitude.Text  := FormatAltitude(OrderedAltitude / C_Feet_To_Meter);
          end;
          2 : //Subsurface
          begin
            pnlStationAltitude.Visible := false;
            pnlStationDepth.Visible    := True;

            edtStationOrderedDepth.Text     := FormatAltitude(OrderedAltitude);
          end;
          1,3 :
          begin
            pnlStationAltitude.Visible := false;
            pnlStationDepth.Visible    := false;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.Relative1Click(Sender: TObject);
var
  v: TT3Vehicle;
begin
  if Assigned(FControlled) and (FControlled is TT3Vehicle) then
  begin
    v := FControlled as TT3Vehicle;

    if FActiveTab = Byte(vgtCircle) then
    begin
      lblCircleDegree.Caption := 'degrees R';
      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                    CORD_TYPE_CIRCLE_BEARING_STATE, 2);
    end
    else if FActiveTab = Byte(vgtStation) then
    begin
      lblStationBearingState.Caption := 'degrees R';
      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                    CORD_TYPE_STATION_BEARING_STATE, 2);
    end;

  end;
end;

procedure TfmPlatformGuidance.RemoveListGuidance(ctrlObj: TObject);
begin
  if not(Assigned(ctrlObj)) then
    Exit;

  if FControlled = ctrlObj then
  begin
    PanelPlatformGuidance.Enabled := False;
    SpeedButton2.Enabled := False;

    focused_platform := nil;
  end;
end;

procedure TfmPlatformGuidance.True1Click(Sender: TObject);
var
  v: TT3Vehicle;
begin
  if Assigned(FControlled) and (FControlled is TT3Vehicle) then
  begin
    v := FControlled as TT3Vehicle;

    if FActiveTab = Byte(vgtCircle) then
    begin
      lblCircleDegree.Caption  := 'degrees T';
      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                  CORD_TYPE_CIRCLE_BEARING_STATE, 1);
    end
    else if FActiveTab = Byte(vgtStation) then
    begin
      lblStationBearingState.Caption  := 'degrees T';
      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                  CORD_TYPE_STATION_BEARING_STATE, 1);
    end;
  end;
end;

procedure TfmPlatformGuidance.SetMapPositionX(const Value: double);
var
  bearing : Double;
begin
  if not Assigned(FControlled) or not (FControlled is TT3Vehicle) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is not defined'); //mk
    Exit;
  end;

  FMapPositionX := Value;
  if FActiveTab = Byte(vgtCircle) then
  begin
    edtCircleOnPositionPosition.Text := formatDM_longitude(FMapPositionX) + '  '
                                        + formatDM_latitude(FMapPositionY);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
            CORD_ID_MOVE, CORD_TYPE_CIRCLE_CENTER_X, FMapPositionX);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
            CORD_ID_MOVE, CORD_TYPE_CIRCLE_CENTER_Y, FMapPositionY);
  end
  else if FActiveTab = Byte(vgtStation) then
  begin
    edtStationPosition.Text := formatDM_longitude(FMapPositionX) + '  '
                               + formatDM_latitude(FMapPositionY);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
            CORD_ID_MOVE, CORD_TYPE_STATION_CENTER_X, FMapPositionX);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
            CORD_ID_MOVE, CORD_TYPE_STATION_CENTER_Y, FMapPositionY);

    bearing := CalcBearing(TT3Vehicle(FControlled).PosX,
                 TT3Vehicle(FControlled).PosY, FMapPositionX, FMapPositionY);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
          CORD_ID_MOVE, CORD_TYPE_COURSE, bearing);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
      CORD_ID_MOVE, CORD_TYPE_SPEED, TT3Vehicle(FControlled).Mover.MaxSpeed);
  end;
end;

procedure TfmPlatformGuidance.SetMapPositionY(const Value: double);
var
  bearing : Double;
begin
  if not Assigned(FControlled) or not (FControlled is TT3Vehicle) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is not defined'); //mk
    Exit;
  end;

  FMapPositionY := Value;
  if FActiveTab = Byte(vgtCircle) then
  begin
    edtCircleOnPositionPosition.Text := formatDM_longitude(FMapPositionX) + '  '
                                        + formatDM_latitude(FMapPositionY);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
            CORD_ID_MOVE, CORD_TYPE_CIRCLE_CENTER_X, FMapPositionX);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
            CORD_ID_MOVE, CORD_TYPE_CIRCLE_CENTER_Y, FMapPositionY);
  end
  else if FActiveTab = Byte(vgtStation) then
  begin
    edtStationPosition.Text := formatDM_longitude(FMapPositionX) + '  '
                               + formatDM_latitude(FMapPositionY);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
            CORD_ID_MOVE, CORD_TYPE_STATION_CENTER_X, FMapPositionX);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
            CORD_ID_MOVE, CORD_TYPE_STATION_CENTER_Y, FMapPositionY);

    bearing := CalcBearing(TT3Vehicle(FControlled).PosX,
                 TT3Vehicle(FControlled).PosY, FMapPositionX, FMapPositionY);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
          CORD_ID_MOVE, CORD_TYPE_COURSE, bearing);

    SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
      CORD_ID_MOVE, CORD_TYPE_SPEED, TT3Vehicle(FControlled).Mover.MaxSpeed);
  end;
end;

procedure TfmPlatformGuidance.SetPlatformMultiSelectList(ctrlObj: TObject);
begin
  inherited;
  if Assigned(FPlatformMultiSelectList) then
  begin
    FPlatformMultiSelectList.Add(ctrlObj);
  end;
end;

procedure TfmPlatformGuidance.sbCircleOnPositionPositionClick(Sender: TObject);
begin
  inherited;

  VSimMap.FMap.CurrentTool := mtDeployPosition;
end;

procedure TfmPlatformGuidance.sbCircleOnTrackBearingClick(Sender: TObject);
var
  pos: TPoint;
begin
  GetCursorPos(pos);
  pmCircleBearingDegree.Popup(pos.X, pos.Y);
end;

procedure TfmPlatformGuidance.sbCircleOnTrackTrackClick(Sender: TObject);
var
  track : TT3PlatformInstance;
begin
  if (Assigned(FControlled)) and (FControlled is TT3Vehicle) then
  begin
    if Assigned(focused_platform) then
    begin
      if focused_platform is TT3DetectedTrack then
      begin
        track := TT3DetectedTrack(focused_platform).TrackObject as TT3PlatformInstance;
      end
      else if focused_platform is TT3PlatformInstance then
      begin
        track := focused_platform as TT3PlatformInstance;
      end
      else
      begin
        frmTacticalDisplay.addStatus('Target is not suitable'); //mk
        Exit;
      end;

      if TT3Vehicle(FControlled).InstanceIndex = track.InstanceIndex then
      begin
        frmTacticalDisplay.addStatus('Own platform can not be target');
        Exit;
      end;

      SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
        CORD_ID_MOVE, CORD_TYPE_CIRCLE_TRACK, track.InstanceIndex);
    end
    else frmTacticalDisplay.addStatus('Target is not selected'); //mk
  end
  else
  begin
    frmTacticalDisplay.addStatus('Controlled platform is not defined');
    exit;
  end;
end;

procedure TfmPlatformGuidance.sbEngageTrackToEngageClick(Sender: TObject);
var
  v : TT3Vehicle;
  target : TT3PlatformInstance;
  bearing, range : Double;
begin
  inherited;

  if not Assigned(FControlled) or not (FControlled is TT3Vehicle) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    Exit;
  end;

  if not Assigned(focused_platform) then
  begin
    frmTacticalDisplay.addStatus('Target not selected'); //mk
    Exit;
  end
  else if focused_platform is TT3NonRealVehicle then
  begin
    frmTacticalDisplay.addStatus('Cant Targeting Non RT Platform');
    Exit;
  end;

  v := TT3Vehicle(FControlled);

  target := TT3PlatformInstance(focused_platform);

  if v.InstanceIndex = target.InstanceIndex then
  begin
    frmTacticalDisplay.addStatus('Own platform can not targeted');
    Exit;
  end;

  bearing := CalcBearing(v.PosX, v.PosY, target.PosX, target.PosY);
  range := CalcRange(v.PosX, v.PosY, target.PosX, target.PosY);

  SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
    CORD_TYPE_ENGAGE_TRACK, target.InstanceIndex);

  SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
    CORD_TYPE_COURSE, bearing);

  SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
    CORD_TYPE_ENGAGE_DISTANCE, (range * 0.8));
end;

procedure TfmPlatformGuidance.sbOnTrackAnchorTrackClick(Sender: TObject);
var
  track : TT3PlatformInstance;
  bearing : Double;
begin
  if (Assigned(FControlled)) and (FControlled is TT3Vehicle) then
  begin
    if Assigned(focused_platform) then
    begin
      if focused_platform is TT3DetectedTrack then
      begin
        track := TT3DetectedTrack(focused_platform).TrackObject as TT3PlatformInstance;
      end
      else if focused_platform is TT3PlatformInstance then
      begin
        track := focused_platform as TT3PlatformInstance;
      end
      else
      begin
        frmTacticalDisplay.addStatus('Target is not suitable'); //mk
        Exit;
      end;

      if TT3Vehicle(FControlled).InstanceIndex = track.InstanceIndex then
      begin
        frmTacticalDisplay.addStatus('Own platform can not be target');
        Exit;
      end;

      bearing := CalcBearing(TT3Vehicle(FControlled).PosX,
                 TT3Vehicle(FControlled).PosY, track.PosX, track.PosY);

      SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
        CORD_ID_MOVE, CORD_TYPE_COURSE, bearing);

      SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
        CORD_ID_MOVE, CORD_TYPE_SPEED, TT3Vehicle(FControlled).Mover.MaxSpeed);

      SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex,
        CORD_ID_MOVE, CORD_TYPE_STATION_TRACK, track.InstanceIndex);
    end
    else frmTacticalDisplay.addStatus('Target is not selected'); //mk
  end
  else
  begin
    frmTacticalDisplay.addStatus('Controlled platform is not defined');
    exit;
  end;
end;

procedure TfmPlatformGuidance.sbPersonalGuidanceModeClick(Sender: TObject);
var
  pos : TPoint;
begin
  GetCursorPos(pos);
  pmPersonalGuidance.Popup(pos.X, pos.Y);
end;

procedure TfmPlatformGuidance.sbPersonelFormationModeClick(Sender: TObject);
var
  Pos : TPoint;
begin
  GetCursorPos(pos);
  pmPersonalFormation.Popup(Pos.X, Pos.Y);
end;

procedure TfmPlatformGuidance.sbTrackToEvadeClick(Sender: TObject);
var
  sObject : TSimObject;
  v : TT3Vehicle;
  target : TT3PlatformInstance;
  detectedBySensor : Boolean;
  i : Integer;
  bearing, randBearing : Double;
begin
  inherited;

  if not Assigned(FControlled) or not (FControlled is TT3Vehicle) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    Exit;
  end;

  if not Assigned(focused_platform) then
  begin
    frmTacticalDisplay.addStatus('Target not selected'); //mk
    Exit;
  end
  else if focused_platform is TT3NonRealVehicle then
  begin
    frmTacticalDisplay.addStatus('Cant Targeting Non RT Platform');
    Exit;
  end;

  v := TT3Vehicle(FControlled);

  target := TT3PlatformInstance(focused_platform);

  if v.InstanceIndex = target.InstanceIndex then
  begin
    frmTacticalDisplay.addStatus('Own platform can not targeted');
    Exit;
  end;

  //choco : make sure that track selected is registered as DetectedTrack
  detectedBySensor := False;

  if simMgrClient.IsController or simMgrClient.ISWasdal then
    detectedBySensor := True
  else
  begin
    for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
    begin
      sObject := simMgrClient.SimDetectedTrackList.getObject(i);

      if TT3DetectedTrack(sObject).TrackObject.InstanceIndex = target.InstanceIndex then
      begin
        detectedBySensor := True;
        Break;
      end;
    end;
  end;

  if detectedBySensor then
  begin
    bearing := CalcBearing(target.PosX, target.PosY, v.PosX, v.PosY);
    randBearing := Random * 90;

    if Boolean(Random(2)) then
      bearing := bearing - randBearing
    else
      bearing := bearing + randBearing;

    if bearing > 360 then
      bearing := bearing - 360
    else if bearing < 0 then
      bearing := bearing + 360;

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
      CORD_TYPE_COURSE, bearing);

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
      CORD_TYPE_SPEED, v.Mover.MaxSpeed);

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
      CORD_TYPE_EVASION_TRACK, target.InstanceIndex);
  end;
end;

procedure TfmPlatformGuidance.sbTrackToOutrunClick(Sender: TObject);
var
  sObject : TSimObject;
  v : TT3Vehicle;
  target : TT3PlatformInstance;
  detectedBySensor : Boolean;
  i : Integer;
  bearing : Double;
begin
  inherited;

  if not Assigned(FControlled) or not (FControlled is TT3Vehicle) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    Exit;
  end;

  if not Assigned(focused_platform) then
  begin
    frmTacticalDisplay.addStatus('Target not selected'); //mk
    Exit;
  end
  else if focused_platform is TT3NonRealVehicle then
  begin
    frmTacticalDisplay.addStatus('Cant Targeting Non RT Platform');
    Exit;
  end;

  v := TT3Vehicle(FControlled);

  target := TT3PlatformInstance(focused_platform);

  if v.InstanceIndex = target.InstanceIndex then
  begin
    frmTacticalDisplay.addStatus('Own platform can not targeted');
    Exit;
  end;

  //choco : make sure that track selected is registered as DetectedTrack
  detectedBySensor := False;

  if simMgrClient.IsController or simMgrClient.ISWasdal then
    detectedBySensor := True
  else
  begin
    for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
    begin
      sObject := simMgrClient.SimDetectedTrackList.getObject(i);

      if TT3DetectedTrack(sObject).TrackObject.InstanceIndex = target.InstanceIndex then
      begin
        detectedBySensor := True;
        Break;
      end;
    end;
  end;

  if detectedBySensor then
  begin
    bearing := CalcBearing(target.PosX, target.PosY, v.PosX, v.PosY);

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
      CORD_TYPE_COURSE, bearing);

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
      CORD_TYPE_SPEED, v.Mover.MaxSpeed);

    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
      CORD_TYPE_OUTRUN_TRACK, target.InstanceIndex);
  end;
end;

procedure TfmPlatformGuidance.sbTrackToshadowClick(Sender: TObject);
var
  track : TT3PlatformInstance;
begin
  if (Assigned(FControlled)) and (FControlled is TT3Vehicle) then
  begin
    if Assigned(focused_platform) then
    begin
      if focused_platform is TT3DetectedTrack then
      begin
        track := TT3DetectedTrack(focused_platform).TrackObject as TT3PlatformInstance;
        edtTrackToShadow.Text := IntToStr(TT3DetectedTrack(focused_platform).TrackNumber);
      end
      else if focused_platform is TT3PlatformInstance then
      begin
        track := focused_platform as TT3PlatformInstance;
        edtTrackToShadow.Text := TT3PlatformInstance(focused_platform).TrackLabel;
      end
      else
      begin
        frmTacticalDisplay.addStatus('Target not suitable'); //mk
        Exit;
      end;

      SimMgrClient.netSend_CmdPlatform(TT3Vehicle(FControlled).InstanceIndex, CORD_ID_MOVE,
        CORD_TYPE_SHADOW_TRACK, track.InstanceIndex);
    end
    else frmTacticalDisplay.addStatus('Target not selected'); //mk
  end
  else
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined');
    exit;
  end;
end;

procedure TfmPlatformGuidance.SetFocusedPlatform(pi: TT3PlatformInstance);
begin
  focused_platform := pi;
end;

procedure TfmPlatformGuidance.Refresh_HelmTab;
var
  //v : TT3Vehicle;
  turnrate : Double;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin

    with TT3Vehicle(FControlled) do
    begin
      turnrate := HelmDegree * UnitMotion.FData.Tight_Turn_Rate/ UnitMotion.FData.Max_Helm_Angle;

      lbActualHelmAngle.Caption     := FormatCourse((FirstHeading));
      lblHelmActualTurnRate.Caption := FormatFloat('000.0', abs(turnrate));
      lblHelmActualHeading.Caption  := FormatCourse(Heading);
      lblHelmActualCourse.Caption   := FormatCourse(Course);

      lblHelmActualGroundSpeed.Caption:= FormatSpeed(Speed);
      lblActuaAltitudeHelm.Caption    := FormatAltitude(Altitude / C_Feet_To_Meter);
      Label20.Caption                 := FormatAltitude(Altitude);

      if FFirst then
      begin
        FFirst := false;

        edtHelmOrderedGroundSpeed.Text:= FormatSpeed(OrderedSpeed);
        edOrderAltitude.Text          := FormatAltitude(OrderedAltitude / C_Feet_To_Meter);
        edtHelmOrderedDepth.Text      := FormatAltitude(OrderedAltitude);

        if FirstHeading > 0 then
        begin
          edtOrderedHelmAngle.Text  := IntToStr(round(FirstHeading));
          wheelHelmAngle.Position   := Round(FirstHeading + 180);
        end
        else
        begin
          edtOrderedHelmAngle.Text  := IntToStr(round(FirstHeading));
          wheelHelmAngle.Position   := Round(180 - (-1 * FirstHeading));
        end;
      // --------------------------------------------------------------

        case TVehicle_Definition(UnitDefinition).FData.Platform_Domain of
          0 :
            begin
              panel1.Visible := false;
              panel2.Visible := true;
            end;
          1:
            begin
              panel1.Visible := false;
              panel2.Visible := false;
            end;
          2:
            begin
              panel1.Visible := true;
              panel2.Visible := false;
            end;
          3:
            begin
              panel1.Visible := false;
              panel2.Visible := false;
            end;
        end;
      end;
//      if FirstHeading > 0 then
//      begin
//        lbActualHelmAngle.Caption     := FormatCourse(FirstHeading + 180);{(TT3Vehicle(FControlled).OrderedHeading);}
//        edtOrderedHelmAngle.Text  := IntToStr(round(FirstHeading));
//        wheelHelmAngle.Position   := Round(FirstHeading + 180);
//      end
//      else
//      begin
//        edtOrderedHelmAngle.Text  := IntToStr(round(FirstHeading));
//        wheelHelmAngle.Position   := Round(180 - (-1 * FirstHeading));
//      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_CircleTab;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    with TT3Vehicle(FControlled) do
    begin
      lblCircleActualGroundSpeed.Caption  := FormatSpeed(Speed);
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_ShadowTab;
var
  dt : TSimObject;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    with TT3Vehicle(FControlled) do
    begin
      lblShadowActualGroundSpeed.Caption := FormatSpeed(Speed);
      lblActShadowAltitude.Caption       := FormatAltitude(Altitude / C_Feet_To_Meter);
      lblActShadowDepth.Caption          := FormatAltitude(Altitude);

      if Assigned(ShadowedVehicle) then begin
        if simMgrClient.isInstructor or simMgrClient.ISWasdal then
          edtTrackToShadow.Text  := ShadowedVehicle.Track_ID
        else
        begin
          dt := simMgrClient.findDetectedTrack(ShadowedVehicle);

          if Assigned(dt) then
            edtTrackToShadow.Text := FormatTrackNumber(TT3DetectedTrack(dt).TrackNumber)
          else
          begin
            edtTrackToShadow.Text := FormatTrackNumber(TT3PlatformInstance(ShadowedVehicle).TrackNumber);
          end;
        end;
      end;

      if FFirst then
      begin
        FFirst := false;
        edtShadowOrdeeredGroundSpeed.Text := FormatSpeed(OrderedSpeed);
        edtOrdShadowAltitude.Text         := FormatAltitude(OrderedAltitude * C_Meter_To_Feet);
        edtOrdShadowDepth.Text            := FormatAltitude(OrderedAltitude);
        edtStandoffDistanceShadow.Text    := FormatFloat('0.00', ShadowDistance);

        case TVehicle_Definition(UnitDefinition).FData.Platform_Domain of
          0 :
            begin
              // Result := 'Air';
              panShadowAltitude.Visible := True;
              panShadowDepth.Visible    := False;
            end;
          1:
            begin
              // Result := 'Surface';
              panShadowAltitude.Visible := False;
              panShadowDepth.Visible    := False;
            end;
          2:
            begin
              // Result := 'Subsurface';
              panShadowAltitude.Visible := False;
              panShadowDepth.Visible    := True;
            end;
          3:
            begin
              // Result := 'Land';
              panShadowAltitude.Visible := False;
              panShadowDepth.Visible    := False;
            end;
          4:
            begin
              //result := Amphibi
              panShadowAltitude.Visible := False;
              panShadowDepth.Visible    := True;
            end;
        else
          begin
            panShadowAltitude.Visible := False;
            panShadowDepth.Visible    := False;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_ReturnToBaseTab;
var
  vParent : TT3PlatformInstance;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    with TT3Vehicle(FControlled) do
    begin
      if Assigned(focused_platform) then
      begin
        if focused_platform is TT3PlatformInstance then
        begin
          vParent := focused_platform as TT3PlatformInstance;
          lblReturnToBaseDestinationBase.Caption := vParent.InstanceName;
        end;
      end;

      lblReturnToBaseActualGroundSpeed.Caption  := FormatSpeed(Speed);
      lblReturnToBaseActualAltitude.Caption := FormatAltitude(Altitude);
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_StraightLineTab(const first: Boolean);
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    if Assigned(GrpVehicle) then
    begin
      lblStraightLineActualHeading.Caption    := FormatCourse(GrpVehicle.Course);
      lblStraightLineActuaCourse.Caption      := FormatCourse(GrpVehicle.Course);
      lblStraightLineActualGroundSpeed.Caption:= FormatSpeed(GrpVehicle.Speed);
      if FFirst then
      begin
        FFirst := false;
        edtStraightLineOrderedHeading.Text    := FormatCourse(GrpVehicle.Course);
        edtStraightLineOrderedGroundSpeed.Text:= FormatSpeed(GrpVehicle.Speed);

        whHeading.OnChange := nil;
        if GrpVehicle.Course > 180 then
          whHeading.Position := Round(GrpVehicle.Course - 180)     //  Round(Course - 180)
        else
          whHeading.Position := Round(GrpVehicle.Course + 180);    //  Round(Course + 180);

        whHeading.OnChange := whHeadingChange;
      end;
    end
    else
    begin
      with TT3Vehicle(FControlled) do
      begin
        lblStraightLineActualHeading.Caption    := FormatCourse(Heading);
        lblStraightLineActuaCourse.Caption      := FormatCourse(Course);
        lblStraightLineActualGroundSpeed.Caption:= FormatSpeed(Speed);
        lblActualAltitude.Caption               := FormatAltitude(Altitude / C_Feet_To_Meter);
        lbl2.Caption                            := FormatAltitude(Altitude);

        if FFirst then
        begin
          FFirst := false;

          edtStraightLineOrderedGroundSpeed.Text:= FormatSpeed(OrderedSpeed);
          edtStraightLineOrderedHeading.Text    := FormatCourse(OrderedHeading); //lblStraightLineActualHeading.Caption;
          edOrderAltitude.Text                  := FormatAltitude(OrderedAltitude / C_Feet_To_Meter);
          edt1.Text                             := FormatAltitude(OrderedAltitude);

          whHeading.OnChange := nil;
          if Heading > 180 then
            whHeading.Position := Round(Course - 180)     //  Round(Course - 180)
          else
            whHeading.Position := Round(Course + 180);    //  Round(Course + 180);

          whHeading.OnChange := whHeadingChange;

          case TVehicle_Definition(UnitDefinition).FData.Platform_Domain of
            0 :
              begin
                // Result := 'Air';
                panAltitude.Visible := True;
                panDepth.Visible    := False;
              end;
            1:
              begin
                // Result := 'Surface';
                panAltitude.Visible := False;
                panDepth.Visible    := False;
              end;
            2:
              begin
                // Result := 'Subsurface';
                panAltitude.Visible := False;
                panDepth.Visible    := True;
              end;
            3:
              begin
                // Result := 'Land';
                panAltitude.Visible := False;
                panDepth.Visible    := False;
              end;
            4:
              begin
                //result := Amphibi
                panAltitude.Visible := False;
                panDepth.Visible    := False;
              end;
          else
            begin
              panAltitude.Visible := False;
              panDepth.Visible    := False;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_EngagementTab(const first: Boolean);
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    with TT3Vehicle(FControlled) do
    begin
      lblEngageActualGroundSpeed.Caption := FormatSpeed(Speed);

      case TVehicle_Definition(UnitDefinition).FData.Platform_Domain of
        0 : lblAltitudeEngagement.Caption := FormatAltitude(Altitude / C_Feet_To_Meter);
        2 : lblDeptEngagMOde.Caption      := FormatAltitude(Altitude);
      end;

      if FFirst then
      begin
        FFirst := false;
        edtEngageOrderedGroundSpeed.Text  := FormatSpeed(OrderedSpeed);
        edtAltitudeEngagement.Text        := FormatAltitude(OrderedAltitude);

        case TVehicle_Definition(UnitDefinition).FData.Platform_Domain of
          0 :
            begin
              // Result := 'Air';
              pnlAltitudeEngagement.Visible := True;
              pnlDepthEngagement.Visible    := False;
            end;
          1:
            begin
              // Result := 'Surface';
              pnlAltitudeEngagement.Visible := False;
              pnlDepthEngagement.Visible    := False;
            end;
          2:
            begin
              // Result := 'Subsurface';
              pnlAltitudeEngagement.Visible := False;
              pnlDepthEngagement.Visible    := True;
            end;
          3:
            begin
              // Result := 'Land';
              pnlAltitudeEngagement.Visible := False;
              pnlDepthEngagement.Visible    := False;
            end;
          4: //Amphibi
            begin
              pnlAltitudeEngagement.Visible := False;
              pnlDepthEngagement.Visible    := True;
            end;
        else
          begin
            panAltitude.Visible := False;
            panDepth.Visible    := False;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_EvasionTab;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    with TT3Vehicle(FControlled) do
    begin
      lblEvasionActualGroundSpeed.Caption  := FormatSpeed(Speed);

      case PlatformDomain of
        0 : //air
        begin
          Label10.Visible := True;
          StaticText20.Visible := True;
          lblEvasionActualAltitudeDepth.Visible := True;
          Label16.Visible := True;

          Label10.Caption := 'Actual Altitude';
          Label16.Caption := 'feet';

          lblEvasionActualAltitudeDepth.Caption := FormatAltitude(Altitude * C_Meter_To_Feet);
        end;
        1,3,4 : //surface, land, amphibi
        begin
          Label10.Visible := False;
          StaticText20.Visible := False;
          lblEvasionActualAltitudeDepth.Visible := False;
          Label16.Visible := False;
        end;
        2 : //sub-surface
        begin
          Label10.Visible := True;
          StaticText20.Visible := True;
          lblEvasionActualAltitudeDepth.Visible := True;
          Label16.Visible := True;

          Label10.Caption := 'Actual Depth';
          Label16.Caption := 'metres';

          lblEvasionActualAltitudeDepth.Caption := FormatAltitude(Altitude);
        end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_FormationTab;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    if TT3Vehicle(FControlled).isFormationLeader then
    begin
      frmTacticalDisplay.fmPlatformGuidance1.lblNameFormation
         .Caption := TT3Vehicle(FControlled).FormationName;
      frmTacticalDisplay.fmPlatformGuidance1.lblLeaderFormation
         .Caption := TT3Vehicle(FControlled).InstanceName;
    end
    else begin
      if Assigned(TT3Vehicle(FControlled).LeaderPlatform) then
      begin
        frmTacticalDisplay.fmPlatformGuidance1.lblNameFormation
           .Caption := TT3Vehicle(TT3Vehicle(FControlled).LeaderPlatform).FormationName;
        frmTacticalDisplay.fmPlatformGuidance1.lblLeaderFormation
           .Caption := TT3Vehicle(FControlled).LeaderPlatform.InstanceName;
      end else
      begin
        frmTacticalDisplay.fmPlatformGuidance1.lblNameFormation
           .Caption := '---';
        frmTacticalDisplay.fmPlatformGuidance1.lblLeaderFormation
           .Caption := '---';
      end;
    end;

    frmTacticalDisplay.fmPlatformGuidance1.lblBearingFormation
         .Caption := FormatCourse(TT3Vehicle(FControlled).FormationBearing);
    frmTacticalDisplay.fmPlatformGuidance1.lblRangeFormation
         .Caption := FormatFloat('0.00', TT3Vehicle(FControlled).FormationRange);

    case TVehicle_Definition(TT3Vehicle(FControlled).UnitDefinition)
         .FData.Platform_Domain of
      0 :  //air
      begin
        pnlAltitude.Visible := True;
        pnlDepth.Visible    := false;

        labelFormationAltitude.Caption  := FormatAltitude(TT3Vehicle(FControlled)
            .Altitude / C_Feet_To_Meter);
      end;
      2 : //Subsurface
      begin
        pnlAltitude.Visible := false;
        pnlDepth.Visible    := True;

        labelFormationDepth.Caption     := FormatAltitude(TT3Vehicle(FControlled).Altitude);
      end
      else
      begin
        pnlAltitude.Visible := false;
        pnlDepth.Visible    := false;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_OutRunTab;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    with TT3Vehicle(FControlled) do
    begin
      lblOutrunActualGroundSpeed.Caption  := FormatSpeed(Speed);

      case PlatformDomain of
        0 : //air
        begin
          Label23.Visible := True;
          StaticText21.Visible := True;
          lblOutrunAltitudeDepth.Visible := True;
          Label29.Visible := True;

          Label23.Caption := 'Actual Altitude';
          Label29.Caption := 'feet';

          lblOutrunAltitudeDepth.Caption := FormatAltitude(Altitude * C_Meter_To_Feet);
        end;
        1,3,4 : //surface, land, amphibi
        begin
          Label23.Visible := False;
          StaticText21.Visible := False;
          lblOutrunAltitudeDepth.Visible := False;
          Label29.Visible := False;
        end;
        2 : //sub-surface
        begin
          Label23.Visible := True;
          StaticText21.Visible := True;
          lblOutrunAltitudeDepth.Visible := True;
          Label29.Visible := True;

          Label23.Caption := 'Actual Depth';
          Label29.Caption := 'metres';

          lblOutrunAltitudeDepth.Caption := FormatAltitude(Altitude);
        end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_PersonelGuidanceTab(const first: Boolean);
function GetText(indx : Byte): string;
begin
  case indx of
    fColumn     : Result := fColumns;
    fStagColumn : Result := fStagColumns;
    fWedge      : Result := fWedges;
    fEchLeft    : Result := fEchLefts;
    fEchRight   : Result := fEchRights;
    fVee        : Result := fVees;
    fLine       : Result := fLines;
    fFile       : Result := fFiles;
    fDiamond    : Result := fDiamonds;
  end;
end;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle)  then
  begin
    with TT3Vehicle(FControlled) do
    begin
      if FFirst then
      begin
        FFirst := False;

        edtPersonelGuidanceOrderedHeading.Text := FormatCourse(OrderedHeading);

        case TT3Vehicle(FControlled).MoveMode of
          pWalk : edtPersonelGuidanceOrderedSpeed.Text := pWalks;
          pRun  : edtPersonelGuidanceOrderedSpeed.Text := pRuns;
          pStop : edtPersonelGuidanceOrderedSpeed.Text := pStops;
          else
            edtPersonelGuidanceOrderedSpeed.Text := pSwims;
        end;

        edtPersonelFormationOrdered.Text := GetText(TT3Vehicle(FControlled).FormationMode);

        whHeadingPersonel.OnChange := nil;

        if Heading > 180 then
        begin
          whHeadingPersonel.Position := Round(Course - 180);
        end
        else
          whHeadingPersonel.Position := Round(Course + 180);

        whHeadingPersonel.OnChange := whHeadingPersonelChange;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.whHeadingChange(Sender: TObject);
var
  newheading : integer;
begin
  if whHeading.Position < 180 then
    newheading := (180 + whHeading.Position)
  else
    newheading := (whHeading.Position - 180);

  edtStraightLineOrderedHeading.Text := IntToStr(newheading);
end;

procedure TfmPlatformGuidance.whHeadingMouseUp(Sender: TObject;
          Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  newheading : integer;
  v : TT3Vehicle;
  i : Integer;
  ctrlObj : TObject;
  rec : TRecCmdMultiMode;
begin
  if whHeading.Position < 180 then
    newheading := (180 + whHeading.Position)
  else
    newheading := (whHeading.Position - 180);

  if frmTacticalDisplay.ControlEmbarkedPlatform then
  begin
    if Assigned(frmLaunchPlaform) then
    begin
      frmLaunchPlaform.EmbarkedHeading := newheading;
      exit;
    end;
  end;

  if Assigned(FControlled) and (FControlled is TT3Vehicle) then
  begin
    if Assigned(GrpVehicle) then
    begin
      rec.GroupID := GrpVehicle.GroupID;
      StrToChar(GrpVehicle.GroupName, rec.GroupName);
      rec.aAction := Byte(C_COURSE);
      rec.CountVehicle := GrpVehicle.CountVe - 1;
      rec.Param := newheading;
      simMgrClient.netSend_CmdMultiMode(rec);
    end
    else
    begin
      if FControlled is TT3Vehicle then
      begin
        v := FControlled as TT3Vehicle;
        v.OrderedHeading := newheading;
        SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
          CORD_ID_MOVE, CORD_TYPE_COURSE, newheading);
        Application.ProcessMessages;
        Sleep(1000);
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.whHeadingPersonelChange(Sender: TObject);
var
  newheading : integer;
begin
  if whHeadingPersonel.Position < 180 then
    newheading := (180 + whHeadingPersonel.Position)
  else
    newheading := (whHeadingPersonel.Position - 180);

  edtPersonelGuidanceOrderedHeading.Text := IntToStr(newheading);
end;

procedure TfmPlatformGuidance.whHeadingPersonelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  newheading : integer;
  v : TT3Vehicle;
  i : Integer;
  ctrlObj : TObject;
begin
  if whHeadingPersonel.Position < 180 then
    newheading := (180 + whHeadingPersonel.Position)
  else
    newheading := (whHeadingPersonel.Position - 180);

  if frmTacticalDisplay.ControlEmbarkedPlatform then
  begin
    if Assigned(frmLaunchPlaform) then
    begin
      frmLaunchPlaform.EmbarkedHeading := newheading;
      exit;
    end;
  end;

  if Assigned(FControlled) and (FControlled is TT3Vehicle) then
  begin
    if Assigned(FPlatformMultiSelectList) then
    begin
      if FPlatformMultiSelectList.Count = 0 then
      begin
        v := FControlled as TT3Vehicle;

        TT3Vehicle(FControlled).OrderedHeading := newheading;

        SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
          CORD_ID_MOVE, CORD_TYPE_COURSE, newheading);
      end
      else
      begin
        for I := 0 to FPlatformMultiSelectList.Count - 1 do
        begin
          ctrlObj := FPlatformMultiSelectList.Items[i];
          if ctrlObj is TT3Vehicle then
          begin
            v := ctrlObj as TT3Vehicle;
            v.OrderedHeading := newheading;
            SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
            CORD_ID_MOVE, CORD_TYPE_COURSE, newheading);
            Application.ProcessMessages;
            Sleep(1000);
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.UpdatemnGuidance(Sender: byte);
var
  guideType : TVehicleGuidanceType;
  v : TT3Vehicle;
begin
  FActiveTab := Sender;
  DisplayTab(FActiveTab);

  if FControlled <> nil then
  begin
    guideType := TVehicleGuidanceType(FATabGuidance[FActiveTab].InitGuideType);

    if FControlled is TT3Vehicle then
    begin
      v := FControlled as TT3Vehicle;
      TVehicle_Definition(v.UnitDefinition).GuidanceType := guideType;

      if guideType = vgtWaypoint then
        v.Waypoints.Enabled := true
      else
        v.Waypoints.Enabled := false;

      if guideType = vgtEvasion then
        lblEvasionActualGroundSpeed.Caption := FormatSpeed(v.Speed);

      if guideType = vgtZigzag then
      begin
        edtZigZagBaseCourse.Text            := IntToStr(round(v.OrderedZigzag));
        edtZigZagOrderedGroundSpeed.Text    := FloatToStr(v.OrderedSpeed);
        lblZigZagActualGroundSpeed.Caption  := FormatSpeed(v.Speed);
        edtZigZagPeriod.Text                := FormatFloat('0.00', v.PeriodZigzag);
        edtZigZagAmplitude.Text             := FormatFloat('0.00', v.AmplitudoZigzag);
      end;

      if guideType = vgtSinuation then
      begin
        edtSinuationBaseCourse.Text          := IntToStr(round(v.OrderedSinuation));
        edtSinuationOrderedgroundSpeed.Text  := FloatToStr(v.OrderedSpeed);
        lblSinuationActualGroundSpeed.Caption:= FormatSpeed(v.Speed);
        edtSinuationBasePeriod.Text          := FormatFloat('0.00', v.PeriodSinuation);
        edtSinuationAmplitude.Text           := FormatFloat('0.00', v.AmplitudoSinuation);
      end;

      if guideType = vgtCircle then
      begin
        case (v.Circle_mode) of
          1 :
            begin
              edtCircleMode.Text := 'Position';
              pnlTrack.Visible   := false;
              pnlPosition.Visible:= true;
              edtCircleOnPositionPosition.Text := formatDM_longitude(v.CenterCirclePointX)+
                                    ' ' + formatDM_latitude(v.CenterCirclePointY);
            end;
          2 :
            begin
              edtCircleMode.Text := 'Track';
              pnlTrack.Visible   := true;
              pnlPosition.Visible:= false;

              if v.CircleTrack <> nil then
              begin
                if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                  edtCircleOnTrackTrack.Text := v.CircleTrack.Track_ID
                else
                  edtCircleOnTrackTrack.Text := IntToStr(v.CircleTrack.TrackNumber);

                edtCircleOnTrackBearing.Text := FormatFloat('0.00', v.CircleBearing);

                case v.Circle_bearing_state of
                  1: lblCircleDegree.Caption  := 'degrees T';
                  2: lblCircleDegree.Caption  := 'degrees R';
                end;

                edtCircleOnTrackRange.Text   := FormatFloat('0.00', v.CircleRange);

                SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,
                  CORD_ID_MOVE ,CORD_TYPE_CIRCLE_TRACK, v.CircleTrack.InstanceIndex);
              end;
            end;
        end;

        edtCircleRadius.Text  := FormatFloat('0.0', v.CircleRadius);

        if v.CircleDirection = 90 then
          edtCircleDirection.Text := 'Clockwise'
        else
        if v.CircleDirection = -90 then
          edtCircleDirection.Text := 'Counter-clockwise';

        edtCircleOrderedGroundSpeed.Text := FloatToStr(v.OrderedSpeed);
      end;

      if guideType = vgtStation then
      begin
        case (v.StationMode) of
          1 :
            begin
              edtOnTrackAnchorMode.Text := 'Position';
              pnlStationTrack.Visible   := false;
              pnlStationPosition.Visible:= true;

              edtStationPosition.Text := formatDM_longitude(v.StationPostX)
                                  + ' '+ formatDM_latitude(v.StationPostY);

              if v.StationDrift then
                chkStationDrift.Checked := True
              else
                chkStationDrift.Checked := False;
            end;
          2 :
            begin
              edtOnTrackAnchorTrack.Text := 'Track';
              pnlStationTrack.Visible   := true;
              pnlStationPosition.Visible:= false;

              if v.StationTrack <> nil then
              begin
                if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                  edtOnTrackAnchorTrack.Text := v.StationTrack.Track_ID
                else
                  edtOnTrackAnchorTrack.Text := IntToStr(v.StationTrack.TrackNumber);

                edtOnTrackAnchorBearing.Text := FormatFloat('000', v.StationBearing);

                case v.StationBearing_state of
                  1: lblStationBearingState.Caption  := 'degrees T';
                  2: lblStationBearingState.Caption  := 'degrees R';
                end;

                edtOnTrackAnchorRange.Text   := FormatFloat('000', v.StationRange);

                SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                  CORD_TYPE_STATION_TRACK, v.StationTrack.InstanceIndex);
              end;
            end;
        end;

        edtStationOrderedAltitude.Text  := FormatAltitude(v.OrderedAltitude / C_Feet_To_Meter);
        edtStationOrderedDepth.Text     := FormatAltitude(v.OrderedAltitude);
      end;

      if guideType = vgtFormation then
      begin
        btnQuickFormation.Visible := False;
        if v.isFormationLeader then begin
          frmTacticalDisplay.fmPlatformGuidance1.lblNameFormation
             .Caption := v.FormationName;
          frmTacticalDisplay.fmPlatformGuidance1.lblLeaderFormation
             .Caption := v.InstanceName;
          btnQuickFormation.Visible := True;
        end
        else begin
          if Assigned(v.LeaderPlatform) then
          begin
            frmTacticalDisplay.fmPlatformGuidance1.lblNameFormation
               .Caption := TT3Vehicle(v.LeaderPlatform).FormationName;
            frmTacticalDisplay.fmPlatformGuidance1.lblLeaderFormation
               .Caption := v.LeaderPlatform.InstanceName;
          end
          else
          begin
            frmTacticalDisplay.fmPlatformGuidance1.lblNameFormation
               .Caption := '---';
            frmTacticalDisplay.fmPlatformGuidance1.lblLeaderFormation
               .Caption := '---';
          end;
        end;

        frmTacticalDisplay.fmPlatformGuidance1.lblBearingFormation
             .Caption := FormatCourse(v.FormationBearing);
        frmTacticalDisplay.fmPlatformGuidance1.lblRangeFormation
             .Caption := FormatFloat('0.00', v.FormationRange);
      end;
    end;
  end;
end;

//-yeni
Procedure TfmPlatformGuidance.wheelHelmAngleChange(Sender: TObject);
var
  newheading: integer;
  max_angle : single;
  left : Boolean;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    with TT3Vehicle(FControlled) do
    begin
      max_angle := UnitMotion.FData.Max_Helm_Angle;
      if wheelHelmAngle.Position < 180 then  //sebelah kiri
      begin
        newheading := (180 - wheelHelmAngle.Position);
        Label134.Caption := 'degrees Port';
        left := True;
      end
      else //sebelah kanan
      begin
        newheading := (wheelHelmAngle.Position - 180);
        Label134.Caption := 'degrees Starboard';
        left := False;
      end;

      if(newheading > max_angle)then
        begin
          edtOrderedHelmAngle.Text := FloatToStr(max_angle);
          if(label134.Caption = 'degrees Port')then
            wheelHelmAngle.Position := (180 - round(max_angle))
          else
            wheelHelmAngle.Position := (180 + round(max_angle)) ;
        end
      else
      begin
        if left then
          edtOrderedHelmAngle.Text := IntToStr(newheading) // 04/ 04/ 2012
        else
          edtOrderedHelmAngle.Text := IntToStr(newheading);
      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.wheelHelmAngleMouseUp(Sender: TObject;
          Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  v : TT3Vehicle;
  newheading : Double;
  max_angle, min_angle : single;
  i : Integer;
  ctrlObj : TObject;
begin
  if (FControlled <> nil) and (FControlled is TT3Vehicle) then
  begin
    if Assigned(FPlatformMultiSelectList) then
    begin
      if FPlatformMultiSelectList.Count = 0 then
      begin
        v := FControlled as TT3Vehicle;

        with TT3Vehicle(FControlled) do
        begin
          max_angle := UnitMotion.FData.Max_Helm_Angle;
          min_angle := - UnitMotion.FData.Max_Helm_Angle;

          {Putar ke Kiri}
          if wheelHelmAngle.Position < 180 then
          begin
            newheading := -1 * (180 - wheelHelmAngle.Position);

            if newheading <  min_angle then
              newheading := min_angle
            else
              newheading := newheading;
          end
          {Putar ke Kanan}
          else
          begin
            newheading := (wheelHelmAngle.Position - 180);

            if newheading > max_angle then
              newheading := max_angle
            else
              newheading := newheading;
          end;

          SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                          CORD_TYPE_COURSE, newheading);
        end;
      end
      else
      begin
        for I := 0 to FPlatformMultiSelectList.Count - 1 do
        begin
          ctrlObj := FPlatformMultiSelectList.Items[i];
          if ctrlObj is TT3Vehicle then
          begin
            v := ctrlObj as TT3Vehicle;
            with v do
            begin
              max_angle := UnitMotion.FData.Max_Helm_Angle;
              min_angle := - UnitMotion.FData.Max_Helm_Angle;

              {Putar ke Kiri}
              if wheelHelmAngle.Position < 180 then
              begin
                newheading := -1 * (180 - wheelHelmAngle.Position);

                if newheading <  min_angle then
                  newheading := min_angle
                else
                  newheading := newheading;
              end
              {Putar ke Kanan}
              else
              begin
                newheading := (wheelHelmAngle.Position - 180);

                if newheading > max_angle then
                  newheading := max_angle
                else
                  newheading := newheading;
              end;

              SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE,
                                              CORD_TYPE_COURSE, newheading);
              Application.ProcessMessages;
              Sleep(1000);
            end;
          end;
        end;
      end;
    end;
  end;
end;

end.
