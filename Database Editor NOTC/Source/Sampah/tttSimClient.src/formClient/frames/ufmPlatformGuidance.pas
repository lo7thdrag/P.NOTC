unit ufmPlatformGuidance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VrControls, VrWheel, StdCtrls, ExtCtrls, Buttons, Menus, 
  ufmControlled;

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
    edtEngageStandOffDistance: TEdit;
    StaticText148: TStaticText;
    edtEngageOrderedGroundSpeed: TEdit;
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
    grbCircleOnPosition: TGroupBox;
    Label164: TLabel;
    Bevel50: TBevel;
    sbCircleOnPositionMode: TSpeedButton;
    Label165: TLabel;
    sbCircleOnPositionPosition: TSpeedButton;
    Label166: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    sbCircleOnPositionDirection: TSpeedButton;
    Bevel64: TBevel;
    Label169: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    Label172: TLabel;
    lblCircleOnPositionActualGroundSpeed: TLabel;
    Label174: TLabel;
    Label175: TLabel;
    Label176: TLabel;
    Label178: TLabel;
    lblCircleOnPositionActualDepth: TLabel;
    StaticText119: TStaticText;
    edtCircleOnPositionMode: TEdit;
    StaticText120: TStaticText;
    StaticText121: TStaticText;
    edtCircleOnPositionPosition: TEdit;
    StaticText122: TStaticText;
    edtCircleOnPositionRadius: TEdit;
    StaticText123: TStaticText;
    edtCircleOnPositionDirection: TEdit;
    StaticText124: TStaticText;
    edtCircleOnPositionOrderedGroundSpeed: TEdit;
    StaticText125: TStaticText;
    StaticText126: TStaticText;
    edtCircleOnPositionOrderedDepth: TEdit;
    StaticText127: TStaticText;
    grbStationKeepingOnTrack: TGroupBox;
    Label154: TLabel;
    Bevel32: TBevel;
    sbOnTrackAnchorMode: TSpeedButton;
    Label155: TLabel;
    sbOnTrackAnchorTrack: TSpeedButton;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    sbOnTrackAnchorBearing: TSpeedButton;
    StaticText113: TStaticText;
    edtOnTrackAnchorMode: TEdit;
    StaticText114: TStaticText;
    StaticText115: TStaticText;
    edtOnTrackAnchorTrack: TEdit;
    StaticText116: TStaticText;
    edtOnTrackAnchorBearing: TEdit;
    StaticText117: TStaticText;
    edtOnTrackAnchorRange: TEdit;
    grbStationKeepingOnPosition: TGroupBox;
    Label136: TLabel;
    Bevel25: TBevel;
    sbAnchorMode: TSpeedButton;
    Label138: TLabel;
    sbAnchorPosition: TSpeedButton;
    Bevel26: TBevel;
    StaticText102: TStaticText;
    edtAnchorMode: TEdit;
    StaticText104: TStaticText;
    StaticText103: TStaticText;
    edtAnchorPosition: TEdit;
    cbxDriftWithCurrent: TCheckBox;
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
    Label98: TLabel;
    Label103: TLabel;
    lbGroundSpeed: TLabel;
    Label104: TLabel;
    lbEta: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    lbDistance: TLabel;
    lbOrderGroundWaypoint: TLabel;
    Label177: TLabel;
    Label179: TLabel;
    Label184: TLabel;
    Label188: TLabel;
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
    grbCircleOnTrack: TGroupBox;
    Label153: TLabel;
    Bevel65: TBevel;
    sbCircleOnTrackMOde: TSpeedButton;
    Label160: TLabel;
    sbCircleOnTrackTrack: TSpeedButton;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    sbCircleOnTrackDirection: TSpeedButton;
    Bevel66: TBevel;
    Label183: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    edtCircleOnTrackActualGroundSpeed: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    Label195: TLabel;
    sbCircleOnTrackBearing: TSpeedButton;
    StaticText112: TStaticText;
    edtCircleOnTrackMOde: TEdit;
    StaticText118: TStaticText;
    StaticText130: TStaticText;
    edtCircleOnTrackTrack: TEdit;
    StaticText131: TStaticText;
    edtCircleOnTrackRadius: TEdit;
    StaticText132: TStaticText;
    edtCircleOnTrackDirection: TEdit;
    StaticText133: TStaticText;
    edtCircleOnTrackOrderedGroundSpeed: TEdit;
    StaticText134: TStaticText;
    StaticText135: TStaticText;
    edtCircleOnTrackBearing: TEdit;
    StaticText136: TStaticText;
    edtCircleOnTrackRange: TEdit;
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
    mnCircleOnTrack: TMenuItem;
    mnCircleOnPosition1: TMenuItem;
    mnStationKeepingOnTrack: TMenuItem;
    mnStationKeepingOnPosition: TMenuItem;
    mnZigzag1: TMenuItem;
    mnSinuation1: TMenuItem;
    mnFormation2: TMenuItem;
    mnEvasion1: TMenuItem;
    mnWaypoint1: TMenuItem;
    mnOutrun1: TMenuItem;
    mnEngagement1: TMenuItem;
    mnShadow1: TMenuItem;
    mnReturntoBase1: TMenuItem;

    procedure whHeadingChange(Sender: TObject);
    procedure mnGuidanceClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtStraightLineOrderedHeadingKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtStraightLineOrderedGroundSpeedKeyPress(Sender: TObject;
      var Key: Char);
    procedure edOrderAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure btnWaypointClick(Sender: TObject);
  private
    { Private declarations }

    FATabGuidance: array [0 .. 15] of TRecTabGuidance;
    FControlled :  TObject;

    procedure DisplayTab(const i: byte); override;
  public
    { Public declarations }
    procedure InitCreate(sender: TForm); override;
    procedure SetControlledObject(ctrlObj: TObject); override;

    procedure Refresh_VisibleTab();

    procedure Refresh_StraightLineTab(const first: Boolean);


  end;

implementation

{$R *.dfm}

uses
  uDBAssetObject, uBaseCoordSystem, tttData, uWaypointEditor,
  uSimMgr_Client, uGameData_TTT;

function getTabIndex(const vgt: TVehicleGuidanceType): byte;
const CVGT: array[TVehicleGuidanceType] of byte =
( 0, 0, 1, 2, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14);
begin
  result := CVGT[vgt];
end;

procedure TfmPlatformGuidance.edOrderAltitudeKeyPress(Sender: TObject;
  var Key: Char);
var
  Altitude: double;
  pi: TPlatform_Instance;
begin

  if not(Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;
  if Key = #13 then
  begin
    TryStrToFloat(edOrderAltitude.Text, Altitude);

    if Assigned(FControlled) then
    begin
      pi := TPlatform_Instance(FControlled);
      pi.OrderedAltitude := Altitude;

      SimMgrClient.netSend_CmdPlatform(pi.FData.Platform_Instance_Index,
        CORD_ID_MOVE, CORD_TYPE_ALTITUDE, Altitude);

    end;
  end;
end;

procedure TfmPlatformGuidance.edtStraightLineOrderedGroundSpeedKeyPress(
  Sender: TObject; var Key: Char);
var
  Speed: double;
  pi: TPlatform_Instance;
begin
  if not(Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;
  if Key = #13 then
  begin
    TryStrToFloat(edtStraightLineOrderedGroundSpeed.Text, Speed);
    if Assigned(FControlled) then begin
      pi := TPlatform_Instance(FControlled);
      pi.OrderedSpeed := Speed;

      SimMgrClient.netSend_CmdPlatform(pi.FData.Platform_Instance_Index,
        CORD_ID_MOVE, CORD_TYPE_SPEED, Speed);

    end;
  end;
end;

procedure TfmPlatformGuidance.edtStraightLineOrderedHeadingKeyPress(
  Sender: TObject; var Key: Char);
var
  heading: double;
  pi: TPlatform_Instance;
begin
  if not(Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;
  if Key = #13 then
  begin
    TryStrToFloat(edtStraightLineOrderedHeading.Text, heading);

    if Assigned(FControlled) then
    begin
      pi := TPlatform_Instance(FControlled);
      pi.OrderedHeading := heading;

      SimMgrClient.netSend_CmdPlatform(pi.FData.Platform_Instance_Index,
        CORD_ID_MOVE, CORD_TYPE_COURSE, heading);
    end;

    if heading > 180 then
      whHeading.Position := Round(heading - 180)
    else
      whHeading.Position := Round(heading + 180);
  end;
end;

procedure TfmPlatformGuidance.InitCreate(sender: TForm);
begin
  //
  FControlled := nil;

  mnStraightLine1.Tag             :=  0;
  mnHelm1.Tag                     :=  1;
  mnCircleOnTrack.Tag             :=  2;
  mnCircleOnPosition1.Tag         :=  3;
  mnStationKeepingOnTrack.Tag     :=  4;
  mnStationKeepingOnPosition.Tag  :=  5;
  mnZigzag1.Tag                   :=  6;
  mnSinuation1.Tag                :=  7;
  mnFormation2.Tag                :=  8;
  mnEvasion1.Tag                  :=  9;
  mnWaypoint1.Tag                 := 10;
  mnOutrun1.Tag                   := 11;
  mnEngagement1.Tag               := 12;
  mnShadow1.Tag                   := 13;
  mnReturntoBase1.Tag             := 14;

  FATabGuidance[0].Caption        := 'Straight Line';
  FATabGuidance[0].GBX            := grbStraightLine;
  FATabGuidance[0].InitGuideType  := Byte(vgtStraightLine);

  FATabGuidance[1].Caption         := 'Helm';
  FATabGuidance[1].GBX             := grbHelm;
  FATabGuidance[1].InitGuideType   := Byte(vgtHelm);

  FATabGuidance[2].Caption         := 'Circle On Track';
  FATabGuidance[2].GBX             := grbCircleOnTrack;
  FATabGuidance[2].InitGuideType   := Byte(vgtCircle);

  FATabGuidance[3].Caption         := 'Circle On Position';
  FATabGuidance[3].GBX             := grbCircleOnPosition;
  FATabGuidance[3].InitGuideType   := Byte(vgtCircle);

  FATabGuidance[4].Caption         := 'Station Keeping On Track';
  FATabGuidance[4].GBX             := grbStationKeepingOnTrack;
  FATabGuidance[4].InitGuideType   := Byte(vgtStation);

  FATabGuidance[5].Caption         := 'Station Keeping On Position';
  FATabGuidance[5].GBX             := grbStationKeepingOnPosition;
  FATabGuidance[5].InitGuideType   := Byte(vgtStation);

  FATabGuidance[6].Caption         := 'Zigzag';
  FATabGuidance[6].GBX             := grbZigZag;
  FATabGuidance[6].InitGuideType   := Byte(vgtZigzag);

  FATabGuidance[7].Caption         := 'Sinuation';
  FATabGuidance[7].GBX             := grbSinuation;
  FATabGuidance[7].InitGuideType   := Byte(vgtSinuation);

  FATabGuidance[8].Caption         := 'Formation';
  FATabGuidance[8].GBX             := grbFormation;
  FATabGuidance[8].InitGuideType   := Byte(vgtFormation);

  FATabGuidance[9].Caption         := 'Evasion';
  FATabGuidance[9].GBX             := grbEvasion;
  FATabGuidance[9].InitGuideType   := Byte(vgtEvasion);

  FATabGuidance[10].Caption         := 'Waypoint';
  FATabGuidance[10].GBX             := gbWaypoint;
  FATabGuidance[10].InitGuideType   := Byte(vgtWaypoint);

  FATabGuidance[11].Caption         := 'Outrun';
  FATabGuidance[11].GBX             := grbOutrun;
  FATabGuidance[11].InitGuideType   := Byte(vgtOutrun);

  FATabGuidance[12].Caption         := 'Engagement';
  FATabGuidance[12].GBX             := grbEngagement;
  FATabGuidance[12].InitGuideType   := Byte(vgtEngagement);

  FATabGuidance[13].Caption         := 'Shadow';
  FATabGuidance[13].GBX             := grbShadow;
  FATabGuidance[13].InitGuideType   := Byte(vgtShadow);

  FATabGuidance[14].Caption         := 'ReturntoBase';
  FATabGuidance[14].GBX             := grbReturnToBase;
  FATabGuidance[14].InitGuideType   := Byte(vgtReturnToBase);
  //  mnHelm1
  DisplayTab(0);

end;

procedure TfmPlatformGuidance.btnWaypointClick(Sender: TObject);
var pi: TPlatform_Instance;
begin

  if FControlled <> nil then begin
    pi := TPlatform_Instance(FControlled);

    frmWaypointEditor := TfrmWaypointEditor.Create(nil);

    frmWaypointEditor.HookedPlatform := pi;
    frmWaypointEditor.Show;
  end;

end;

procedure TfmPlatformGuidance.DisplayTab(const i: byte);
begin
  FActiveTab  := i;
  FATabGuidance[i].GBX.BringToFront;
  edGuidance.Text := FATabGuidance[i].Caption;
end;

procedure TfmPlatformGuidance.mnGuidanceClick(Sender: TObject);
var pi: TPlatform_Instance;
begin
  FActiveTab := (sender as TComponent).Tag;
  DisplayTab(FActiveTab);

  if FControlled <> nil then begin
    pi := TPlatform_Instance(FControlled);

    pi.Vehicle.GuidanceType :=
      TVehicleGuidanceType(FATabGuidance[FActiveTab].InitGuideType);

    SimMgrClient.netSend_CmdPlatform(pi.FData.Platform_Instance_Index,
//       CORD_ID_ACTIVATION, pi.FActivation.Init_Guidance_Type, 0.0);
       CORD_ID_ACTIVATION, byte(pi.Vehicle.GuidanceType) , 0.0);
  end;

end;

procedure TfmPlatformGuidance.SetControlledObject(ctrlObj: TObject);
var pi : TPlatform_Instance;
       i: integer;
begin
  FControlled := ctrlObj;

  pi := TPlatform_Instance(FControlled);
  i :=  getTabIndex(pi.Vehicle.GuidanceType);
  DisplayTab(i);
end;

procedure TfmPlatformGuidance.SpeedButton2Click(Sender: TObject);
var
  pos: TPoint;
begin
  GetCursorPos(pos);
  pmGuidance.Popup(pos.X, pos.Y);
end;

procedure TfmPlatformGuidance.Refresh_VisibleTab();
begin
  case FActiveTab of
    0 : begin
      Refresh_StraightLineTab(false);
    end;
  end;
end;

procedure TfmPlatformGuidance.Refresh_StraightLineTab(const first: Boolean);
var pi : TPlatform_Instance;
begin
  if (FControlled <> nil) and  (FControlled is TPlatform_Instance) then begin
    pi :=  TPlatform_Instance(FControlled);

    with pi do  begin
      lblStraightLineActualHeading.Caption  := FormatCourse(Course);
      lblStraightLineActuaCourse.Caption    := FormatCourse(Course);

      lblStraightLineActualGroundSpeed.Caption := FormatSpeed(Speed);
      lblActualAltitude.Caption := FormatAltitude(Altitude);

      if first then   begin
        edtStraightLineOrderedGroundSpeed.Text  := FormatSpeed(OrderedSpeed);
        edtStraightLineOrderedHeading.Text      := FormatCourse(OrderedHeading);
        edOrderAltitude.Text                    := FormatAltitude(OrderedAltitude);

        whHeading.OnChange := nil;
        if Course > 180 then
          whHeading.Position := Round(Course - 180)
        else
          whHeading.Position := Round(Course + 180);
        whHeading.OnChange := whHeadingChange;

        case pi.Vehicle.FData.Platform_Domain of
          0: // Result := 'Air';
            panAltitude.Visible := true;
          1: // Result := 'Surface';
            panAltitude.Visible := false;
          2: // subSurface
            panAltitude.Visible := true;
          3: // Result := 'Land';
            panAltitude.Visible := false;
          4:
            panAltitude.Visible := true;
        end;

      end;
    end;
  end;
end;

procedure TfmPlatformGuidance.whHeadingChange(Sender: TObject);
var
  newheading: integer;
  pi: TPlatform_Instance;
begin

  if whHeading.Position < 180 then
    newheading := (180 + whHeading.Position)
  else
    newheading := (whHeading.Position - 180);

  edtStraightLineOrderedHeading.Text := IntToStr(newheading);
  if Assigned(FControlled) then begin
    pi := TPlatform_Instance(FControlled);
    pi.OrderedHeading := newheading;

    SimMgrClient.netSend_CmdPlatform(pi.FData.Platform_Instance_Index,
      CORD_ID_MOVE, CORD_TYPE_COURSE, newheading);
  end;
{  if FControlEmbarkedPlatform then
  begin
    if Assigned(frmLaunchPlaform) then
    begin
      frmLaunchPlaform.EmbarkedPlatform.OrderedHeading := newheading;

      SimMgrClient.netSend_CmdPlatform
        (frmLaunchPlaform.EmbarkedPlatform.FData.Platform_Instance_Index,
        CORD_ID_MOVE, CORD_TYPE_COURSE, newheading);
    end;
  end
  else
  if Assigned(FControlled) then
  begin
    pi := TPlatform_Instance(FControlled);
    pi.OrderedHeading := newheading;

    SimMgrClient.netSend_CmdPlatform(pi.FData.Platform_Instance_Index,
      CORD_ID_MOVE, CORD_TYPE_COURSE, newheading);
  end;
}
end;

end.
