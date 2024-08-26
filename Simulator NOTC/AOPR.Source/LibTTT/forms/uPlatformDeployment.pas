unit uPlatformDeployment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, OleCtrls, MapXLib_TLB, ExtCtrls,
  uMapXHandler, uCoordConvertor, uDataModuleTTT, newClassASTT, uDBAssetObject,
  uDBAsset_GameEnvironment, StrUtils, ToolWin, ImgList, uObjectVisuals, uDBAsset_Deploy;

type
  TSymbolsProp = class

  public
    bmp : TBitmapSymbol;
    Fplatform : TPlatform_Instance;
    x, y : double;
    course, helmAngle, altitude : single;
    commandCourse : single;
    commandGround : byte;
    {}
    verti, hori : single;
    patternInstIndex, guidanceTarget : integer;
    angularOffset, targetRange : single;
    anchorLatt, anchorLong, anchorCartesianX, anchorCartesianY : single;
    radiusOfTravel, dynamicCircRangeOffset : single;
    directionOfTravel, dynamicCircAngleOffset : byte;
    circleLatt, circleLong : double;
    circleX, circleY : single;
    zigzagLegType, waypointTermination : byte;
    periodDistance, amplitudeDistance : single;
    {}
    groundSpeed, verticalSpeed, guidanceType : byte;
    instanceNames : string;
    color : TColor;
    idPlatform, platformDomain, forcePlatform : integer;
    procedure LoadBitmapSymbols(nameBitmap : string; warna : integer);
    constructor firstBmp (file_bitmap : String);
  end;

  TfPlatformDeploytment = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    HookContactInfoTraineeDisplay: TPageControl;
    tsHook: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    StaticText1: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText25: TStaticText;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    StaticText31: TStaticText;
    StaticText33: TStaticText;
    StaticText34: TStaticText;
    StaticText35: TStaticText;
    StaticText36: TStaticText;
    tsDetails: TTabSheet;
    tsDetection: TTabSheet;
    Label22: TLabel;
    lAltitude: TLabel;
    dtpActivationTime: TDateTimePicker;
    edLatPosition: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    edLongPosition: TEdit;
    edHorz: TEdit;
    Label6: TLabel;
    edVert: TEdit;
    Label8: TLabel;
    btnApproximatePosition: TSpeedButton;
    edCourse: TEdit;
    edHelmAngle: TEdit;
    cbGroundSpeed: TComboBox;
    edAltitude: TEdit;
    cbVerticalSpeed: TComboBox;
    StaticText6: TStaticText;
    StaticText16: TStaticText;
    btnIFFActivation: TButton;
    btnRemove: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    btnEditFormaions: TButton;
    btnScreenCapture: TButton;
    edAltitudeDepth: TEdit;
    cbLateralGuid: TComboBox;
    Map1: TMap;
    edPlatform: TEdit;
    Panel2: TPanel;
    grbCircleOnTrackGuidance: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    spTarget_CircleOnTrackGuidance: TSpeedButton;
    lblRangeOffset: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    lblDirection: TLabel;
    lblRadius: TLabel;
    lblnmm: TLabel;
    Label29: TLabel;
    edtTarget_CircleOnTrackGuidance: TEdit;
    edtRadius_CircleOnTrackGuidance: TEdit;
    cbxAbsoluteOffsetAngle_CircleOnTrackGuidance: TCheckBox;
    cmbDirection_CircleOnTrackGuidance: TComboBox;
    cmbGroundSpeed_CircleOnTrackGuidance: TComboBox;
    edtRangeOffset_CircleOnTrackGuidance: TEdit;
    edtAngleOffset_CircleOnTrackGuidance: TEdit;
    grbSinuateGuidance: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    lbldegreesT: TLabel;
    edtPeriod_SinuateGuidance: TEdit;
    cmbGroundSpeed_SinuateGuidance: TComboBox;
    edtAmplitude_SinuateGuidance: TEdit;
    edtBaseCourse_SinuateGuidance: TEdit;
    grbShadowGuidance: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    spbtnTarget_ShadowGuidance: TSpeedButton;
    edtTargetRange_ShadowGuidance: TEdit;
    edtTarget_ShadowGuidance: TEdit;
    grbEngagementGuidance: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    spbtnTarget_EngagementGuidance: TSpeedButton;
    edtTargetRange_EngagementGuidance: TEdit;
    edtTarget_EngagementGuidance: TEdit;
    grbEvasionGuidance: TGroupBox;
    Label51: TLabel;
    spbtnTarget_EvasionGuidance: TSpeedButton;
    edtTarget_EvasionGuidance: TEdit;
    grbOutRunGuidance: TGroupBox;
    Label52: TLabel;
    spbtnTarget_OutRunGuidance: TSpeedButton;
    edtTarget_OutRunGuidance: TEdit;
    grbWayPointGuidance: TGroupBox;
    Label2: TLabel;
    spbtnTarget_WayPointGuidance: TSpeedButton;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Bevel1: TBevel;
    Label56: TLabel;
    Bevel2: TBevel;
    edtTarget_WayPointGuidance: TEdit;
    cmbType_WayPointGuidance: TComboBox;
    edtRadius_WayPointGuidance: TEdit;
    btnEditWaypoints_WayPointGuidance: TButton;
    grbStraightGuidance: TGroupBox;
    lblCourse: TLabel;
    lblGroundSpeed: TLabel;
    Label57: TLabel;
    edtCourse_StraightGuidance: TEdit;
    cmbGroundSpeed_StraightGuidance: TComboBox;
    grbPatternOnSelfGuidance: TGroupBox;
    lblPredefined: TLabel;
    lblAngular: TLabel;
    spbtnAngularOffset_PatternOnSelfGuidance: TSpeedButton;
    Label5: TLabel;
    edtPredefinedPattern_PatternOnSelfGuidance: TEdit;
    edtAngularOffset_PatternOnSelfGuidance: TEdit;
    grbPatternOnPointGuidance: TGroupBox;
    Label12: TLabel;
    spbtnPredefinedPattern_PatternOnPointGuidance: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    lbl1: TLabel;
    Label15: TLabel;
    spbtnAnchorPosition_PatternOnPointGuidance: TSpeedButton;
    edtPredefinedPattern_PatternOnPointGuidance: TEdit;
    edtAngularOffset_PatternOnPointGuidance: TEdit;
    edtLatAnchor_PatternOnPointGuidance: TEdit;
    edtLongAnchor_PatternOnPointGuidance: TEdit;
    edtYanchor_PatternOnPointGuidance: TEdit;
    edtXanchor_PatternOnPointGuidance: TEdit;
    grbCircleOnPointGuidance: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    lblCentreGrid: TLabel;
    spbtnCentrePosition_CircleOnPointGuidance: TSpeedButton;
    edtRadius_CircleOnPointGuidance: TEdit;
    cmbDirection_CircleOnPointGuidance: TComboBox;
    cmbGroundSpeed_CircleOnPointGuidance: TComboBox;
    edtCentreLat_CircleOnPointGuidance: TEdit;
    edtCentreLong_CircleOnPointGuidance: TEdit;
    edtCentreY_CircleOnPointGuidance: TEdit;
    edtCentreX_CircleOnPointGuidance: TEdit;
    grbHelmGuidance: TGroupBox;
    lblHelm: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtHelmAngle_HelmGuidance: TEdit;
    cmbGroundSpeed_HelmGuidance: TComboBox;
    grbZigZagGuidance: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    lblAmplitude: TLabel;
    lblPeriod: TLabel;
    lblLegLength: TLabel;
    lblBaseCourse: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    edtPeriod_ZigZagGuidance: TEdit;
    cmbGroundSpeed_ZigZagGuidance: TComboBox;
    edtAmplitude_ZigZagGuidance: TEdit;
    edtBaseCourse_ZigZagGuidance: TEdit;
    cmbLegLength_ZigZagGuidance: TComboBox;
    grbStationKeepOnTrackGuidance: TGroupBox;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    lblNM: TLabel;
    lblDegrees: TLabel;
    lblTArgetRange: TLabel;
    lblAngleOffset: TLabel;
    edtTarget_StationKeepOnTrackGuidance: TEdit;
    edtTargetRange_StationKeepOnTrackGuidance: TEdit;
    edtAngleOffset_StationKeepOnTrackGuidance: TEdit;
    cbxAbsoluteOffsiteAngle_StationKeepOnTrackGuidance: TCheckBox;
    grbReturnToBaseGuidance: TGroupBox;
    Label18: TLabel;
    lblBase: TLabel;
    spbtnBase_ReturnToBaseGuidance: TSpeedButton;
    edtBase_ReturnToBaseGuidance: TEdit;
    cmbGroundSpeed_ReturnToBaseGuidance: TComboBox;
    grbPatternOnTargetGuidance: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    spbtnPredefinedPattern_PatternOnTargetGuidance: TSpeedButton;
    spbtnTarget_PatternOnTargetGuidance: TSpeedButton;
    LblAngularOffset: TLabel;
    Label58: TLabel;
    edtPredefinedPattern_PatternOnTargetGuidance: TEdit;
    edtTarget_PatternOnTargetGuidance: TEdit;
    edtAngularOffset_PatternOnTargetGuidance: TEdit;
    grbStationKeepOnPositionGuidance: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    spbtnAnchorPosition_StationKeepOnPositionGuidance: TSpeedButton;
    edtAnchorLat_StationKeepOnPositionGuidance: TEdit;
    cbxDriftsOnCurrent_StationKeepOnPositionGuidance: TCheckBox;
    edtAnchorLong_StationKeepOnPositionGuidance: TEdit;
    edtAnchorY_StationKeepOnPositionGuidance: TEdit;
    edtAnchorX_StationKeepOnPositionGuidance: TEdit;
    grbDefaultKosong: TGroupBox;
    Panel1: TPanel;
    platformPanel: TPanel;
    currentCursor: TPanel;
    grpCursorPosition: TGroupBox;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    lBearingFCenter: TLabel;
    lDistanceFCenter: TLabel;
    lPosLat: TLabel;
    lGridLat: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    lPosLong: TLabel;
    lGridLong: TLabel;
    lbcenterx: TLabel;
    lbcentery: TLabel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label65: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    lbHookedName: TLabel;
    lbHookedPosLat: TLabel;
    lbHookedGridLat: TLabel;
    Label73: TLabel;
    lbHookedPosLong: TLabel;
    lbHookedGridLong: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton9: TToolButton;
    toolbtnDecreaseScale: TToolButton;
    cbSetScale: TComboBox;
    toolbtnIncreaseScale: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton10: TToolButton;
    panelToolBar: TPanel;
    ImageList1: TImageList;
    ToolButton3: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cbLateralGuidChange(Sender: TObject);
    procedure btnEditWaypoints_WayPointGuidanceClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnApproximatePositionClick(Sender: TObject);
    procedure Map1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure btnEditFormaionsClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnScreenCaptureClick(Sender: TObject);
    procedure Map1DrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Cardinal; const RectFull,
      RectInvalid: IDispatch);
    procedure Map1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Map1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure cbSetScaleChange(Sender: TObject);
    procedure Map1MapViewChanged(Sender: TObject);
    procedure toolbtnDecreaseScaleClick(Sender: TObject);
    procedure toolbtnIncreaseScaleClick(Sender: TObject);
    procedure Map1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);

  private
    { Private declarations }
    isApproximatedClicked: boolean;
    FMapPlatform: TSimMap;
    FCoordPlatformConv : TCoordConverter;

//    procedure MoveGameCenter(const x, y: integer); overload;
//    procedure MoveGameCenter(); overload;
//    procedure UpdateGameCenter();
//    procedure GetGridIndex(const cx, cy, w: Double;
//        var gid: TRect);
  public
    //
    Scenario : TScenario_Definition;
    ResourceAllocation : TResource_Allocation;
    GameEnvi : TGame_Environment_Definition;
    Deployment : TAsset_Deployment;
    platformSelect : TPlatform_Instance;
    platformPropSelected : TSymbolsProp;
    FLyrDraw : CMapXLayer;
    //
    gPoint  : TPoint;
    isCapturingScreen, MouseIsDown : Boolean;
    FCanvas : TCanvas;
    sCaptureLayer : CMapXLayer;
    objlist, recycleList : TList;
    //
    GCx, GCy: Double;
    Gwidth  : Double;
    gRect : TRect;
    move : boolean;

    //platform List
    platformList: TList;
    platformObj : TBitmapSymbol;

    diffXnm, diffYnm : double;
    gridLatt, gridLong,addStringX, addStringY : string;

    //state
    statePan: Boolean;
    stateSelect: Boolean;
    stateDrawing : boolean;
    stateMove : boolean;
    stateDelete : boolean;

    //
    xPoint, yPoint : single;
    xIntPoint, yIntPoint : integer;
    bmp : TBitmapSymbol;
    bmpSelected : TBitmapSymbol;
    patchBmp : string;
    List : TList;

    //tool = select
    selectTool : Boolean;
    byList : Boolean;
    posX, posY : integer;
    castX, castY : single;
    currentX, currentY, arrowFlag, arrowFlag2 : integer;
    setAs : boolean;
    setColor : Array [0..100] of integer;

    { Public declarations }
//   procedure updatePlatformData;
   procedure loadENC(name: String);
   procedure LoadMap(aGeoset: String);
   procedure createGeoset(getNameArea : string);
   procedure savetoRecord;
   procedure saveLateralToRecord;
   procedure ScreenShot(DestBitmap : TBitmap);
   procedure drawPlatform(plat : TPlatform_Instance);
   procedure DrawAllBitmap;
   procedure LoadPlatformInstanceAct;
   procedure setCBScale;
   procedure coloringByMouse;
   function getPlatformSelectedByID : TSymbolsProp;
   //procedure UpdateGameCenter;
   //procedure MoveGameCenter;
  end;



var
  fPlatformDeploytment: TfPlatformDeploytment;
  //idFocusedPlatform : integer;
  xx: double;
  yy: double;
  dataModuleTTT: TdmTTT;
  b,TmpBmp : TBitmap;

implementation

uses uPlatformDeploymentPickList,uSimDBEditor,
  uWaypointEditorPanel, uFormationeditor, uBaseCoordSystem, uEnvironment, uExerciseArea, drawRec,
  ufScenario, uScrCapture, ufCaptureRes, Math, uResurceAllocationSelect,
  uDBAsset_Vehicle;

{$R *.dfm}

constructor TSymbolsProp.firstBmp (file_bitmap : String);
begin
  bmp := TBitmapSymbol.Create;
  Self.bmp.LoadBitmap(file_bitmap, clRed);
  bmp.ConvertCoord(VConvertor);
  Fplatform := TPlatform_Instance.Create;
end;

procedure TSymbolsProp.LoadBitmapSymbols (nameBitmap : string; warna : integer);
begin
   Self.bmp.LoadBitmap(nameBitmap, warna);
end;

procedure TfPlatformDeploytment.BitBtn1Click(Sender: TObject);
begin
    byList := true;
    PlatformDeploymentPickListForm.show;
end;

procedure TfPlatformDeploytment.saveLateralToRecord;
begin
  with platformSelect.FActivation do
  begin

    //save the lateral tab yg sedang active (inFront)
   case cbLateralGuid.ItemIndex of
   0:
    begin
    //grbStraightGuidance.BringToFront;
    Init_Command_Course := strToFLoat(edtCourse_StraightGuidance.Text);
    Init_Command_Ground := cmbGroundSpeed_StraightGuidance.ItemIndex;
    end;
   1:
    begin
    //grbPatternOnSelfGuidance.BringToFront;
    Pattern_Instance_Index := StrToInt(edtPredefinedPattern_PatternOnSelfGuidance.Text);
    Angular_Offset := strToFloat(edtAngularOffset_PatternOnSelfGuidance.Text);
    end;
   2:
    begin
    //grbPatternOnTargetGuidance.BringToFront;
    Pattern_Instance_Index := strToInt(edtPredefinedPattern_PatternOnTargetGuidance.Text);
    Guidance_Target := strToInt(edtTarget_PatternOnTargetGuidance.Text);
    Angular_Offset := strToFloat(edtAngularOffset_PatternOnTargetGuidance.Text);
    end;
   3:
    begin
    //grbPatternOnPointGuidance.BringToFront;
    Pattern_Instance_Index := strToInt(edtPredefinedPattern_PatternOnPointGuidance.Text);
    Angular_Offset := strToFloat(edtAngularOffset_PatternOnPointGuidance.Text);
    Anchor_Latitude := strToFloat(edtLatAnchor_PatternOnPointGuidance.Text);
    Anchor_Longitude := strToFloat(edtLongAnchor_PatternOnPointGuidance.Text);
    Anchor_Cartesian_X := strToFloat(edtXanchor_PatternOnPointGuidance.Text);
    Anchor_Cartesian_Y := strToFloat(edtYanchor_PatternOnPointGuidance.Text);
    end;
   4:
    begin
    //grbHelmGuidance.BringToFront;
    Init_Helm_Angle := strToFloat(edtHelmAngle_HelmGuidance.Text);
    Init_Ground_Speed := cmbGroundSpeed_HelmGuidance.ItemIndex;
    end;
   5:
    begin
    //grbReturnToBaseGuidance.BringToFront;
      Init_Ground_Speed := cmbGroundSpeed_ReturnToBaseGuidance.ItemIndex;
      Target_Range := strToFloat(edtBase_ReturnToBaseGuidance.Text);
    end;
   6:
    begin
    //grbStationKeepOnTrackGuidance.BringToFront;
      Guidance_Target := strToInt(edtTarget_StationKeepOnTrackGuidance.Text);
      Target_Range := strToFloat(edtTargetRange_StationKeepOnTrackGuidance.Text);

      //always true blm tahu ngambil dari mana
      //cbxAbsoluteOffsiteAngle_StationKeepOnTrackGuidance.Checked := true;
    end;
   7:
    begin
    //grbStationKeepOnPositionGuidance.BringToFront;
      Anchor_Latitude := strToFloat(edtAnchorLat_StationKeepOnPositionGuidance.Text);
      Anchor_Longitude := strToFloat(edtAnchorLong_StationKeepOnPositionGuidance.Text);
      Anchor_Cartesian_X := strToFloat(edtAnchorX_StationKeepOnPositionGuidance.Text);
      Anchor_Cartesian_Y := strToFloat(edtAnchorY_StationKeepOnPositionGuidance.Text);

      //always true blm tahu ngambil dari mana
      //cbxDriftsOnCurrent_StationKeepOnPositionGuidance.Checked := true;
    end;
   8:
    begin
    //grbCircleOnTrackGuidance.BringToFront;
      Guidance_Target := strToInt(edtTarget_CircleOnTrackGuidance.Text);
      Radius_of_Travel := strToFloat(edtRadius_CircleOnTrackGuidance.Text);
      Direction_of_Travel := cmbDirection_CircleOnTrackGuidance.ItemIndex;
      Init_Ground_Speed := cmbGroundSpeed_CircleOnTrackGuidance.ItemIndex;
      Dynamic_Circle_Range_Offset := strToFloat(edtRangeOffset_CircleOnTrackGuidance.Text);
      Dynamic_Circle_Angle_Offset := StrToInt(edtAngleOffset_CircleOnTrackGuidance.Text);

      //always true blm tahu ngambil dari mana
      //cbxAbsoluteOffsetAngle_CircleOnTrackGuidance.Checked := true;
    end;
   9:
    begin
    //grbCircleOnPointGuidance.BringToFront;
      Circle_Latitude := strToFloat(edtCentreLat_CircleOnPointGuidance.Text);
      Circle_Longitude := strToFloat(edtCentreLong_CircleOnPointGuidance.Text);
      Circle_X := strToFloat(edtCentreX_CircleOnPointGuidance.Text);
      Circle_Y := strToFloat(edtCentreY_CircleOnPointGuidance.Text);
      Radius_of_Travel := strToFloat(edtRadius_CircleOnPointGuidance.Text);
      Direction_of_Travel := cmbDirection_CircleOnPointGuidance.ItemIndex;
      Init_Ground_Speed := cmbGroundSpeed_CircleOnPointGuidance.ItemIndex;
    end;
   10:
    begin
    //grbZigZagGuidance.BringToFront;
      Zig_Zag_Leg_Type := cmbLegLength_ZigZagGuidance.ItemIndex;
      Init_Course := strToFloat(edtBaseCourse_ZigZagGuidance.Text);
      Period_Distance := strToFloat(edtPeriod_ZigZagGuidance.Text);
      Amplitude_Distance := strToFloat(edtAmplitude_ZigZagGuidance.Text);
      Init_Ground_Speed := cmbGroundSpeed_ZigZagGuidance.ItemIndex;
    end;
   11:
    begin
    //grbSinuateGuidance.BringToFront;
      Init_Course := strToFloat(edtBaseCourse_SinuateGuidance.Text);
      Period_Distance := strToFloat(edtPeriod_SinuateGuidance.Text);
      Amplitude_Distance := strToFloat(edtAmplitude_SinuateGuidance.Text);
      Init_Ground_Speed := cmbGroundSpeed_SinuateGuidance.ItemIndex;
    end;
   12:
    begin
    //grbShadowGuidance.BringToFront;
      Guidance_Target := strToInt(edtTarget_ShadowGuidance.Text);
      Target_Range := strToFloat(edtTargetRange_ShadowGuidance.Text);
    end;
   13:
    begin
    //grbEngagementGuidance.BringToFront;
      Guidance_Target := strToInt(edtTarget_EngagementGuidance.Text);
      Target_Range := strToFloat(edtTargetRange_EngagementGuidance.Text);
    end;
   14:
    begin
    //grbEvasionGuidance.BringToFront;
      Guidance_Target := strToInt(edtTarget_EvasionGuidance.Text);
    end;
   15:
    begin
    //grbOutRunGuidance.BringToFront;
      Guidance_Target := strToInt(edtTarget_OutRunGuidance.Text);
    end;
   16:
    begin
    //grbWayPointGuidance.BringToFront;
      Waypoint_Termination := cmbType_WayPointGuidance.ItemIndex;
      Radius_of_Travel := strToFloat(edtRadius_WayPointGuidance.Text);
      Guidance_Target := strToInt(edtTarget_WayPointGuidance.Text);
    end;
  end;
  end;
end;

procedure TfPlatformDeploytment.savetoRecord;
begin
  with platformSelect.FActivation do
  begin
   //save the initial tab
   Init_Position_Latitude := dmToLatitude(edLatPosition.Text);
   Init_Position_Longitude := dmToLongitude(edLongPosition.Text);
   Init_Position_Cartesian_X := StrToFloat(edVert.text);
   Init_Position_Cartesian_Y := StrToFloat(edHorz.Text);
   Init_Course := StrToFloat(edCourse.Text);
   Init_Helm_Angle := StrToFloat(edHelmAngle.Text);
   Init_Ground_Speed:= cbGroundSpeed.ItemIndex;
   Init_Altitude := StrToFloat(edAltitude.Text);
   Init_Vertical_Speed := cbVerticalSpeed.ItemIndex;
  end;

end;

procedure TfPlatformDeploytment.btnApplyClick(Sender: TObject);
begin
 if idFocusedPlatform <> 0 then
   begin
   savetoRecord;
   saveLateralToRecord;
   if platformSelect.FActivation.Platform_Event_Index = 0 then
   begin
      with platformSelect.FActivation do
      begin
        dmTTT.GetAssetDeployment(frmScenario.Scenario.FData.Scenario_Index, Deployment);
        Deployment_Index := Deployment.FData.Deployment_Index;
        Platform_Instance_Index := platformSelect.FData.Platform_Instance_Index;
      end;

      dmTTT.InsertPlatform_Activation(platformSelect);
   end
   else
   begin
   dmTTT.updatePlatformAct(platformSelect, platformSelect.FActivation.Platform_Event_Index);
   end;
 end;
 LoadPlatformInstanceAct;
 Map1.Repaint;
 Map1.Refresh;
 isApproximatedClicked := false;
 //updatePlatformInstance(platformSelect);
end;

procedure TfPlatformDeploytment.btnApproximatePositionClick(Sender: TObject);
var
    lat, long : double;
begin
    isApproximatedClicked := true;
    Map1.MousePointer := miCrossCursor;

    { set symbols }
    //get point position platform
    lat := dmsToLatt(edLatPosition.Text);
    long := dmToLongitude(edLongPosition.Text);

    fPlatformDeploytment.Map1.ConvertCoord(xPoint, yPoint, long, lat, miMapToScreen);
    xIntPoint := Round(xPoint);
    yIntPoint := Round(yPoint);

  //  Map1.Repaint;
end;

procedure TfPlatformDeploytment.btnCancelClick(Sender: TObject);
begin
    Self.Close;
end;

procedure TfPlatformDeploytment.btnEditFormaionsClick(Sender: TObject);
begin
    FormationEditorForm.Show;
end;

procedure TfPlatformDeploytment.btnEditWaypoints_WayPointGuidanceClick(
  Sender: TObject);
begin
  WaypointEditorPanelForm.Show;
end;

procedure TfPlatformDeploytment.btnOKClick(Sender: TObject);
begin
  if platformSelect.FActivation.Platform_Event_Index = 0 then
 begin
    with platformSelect.FActivation do
    begin
      dmTTT.GetAssetDeployment(frmScenario.Scenario.FData.Scenario_Index, Deployment);
      Deployment_Index := Deployment.FData.Deployment_Index;
      Platform_Instance_Index := platformSelect.FData.Platform_Instance_Index;
    end;
    if platformSelect.FActivation.Platform_Event_Index <> 0 then
    begin
      dmTTT.InsertPlatform_Activation(platformSelect);
    end;
 end
 else
 begin
 dmTTT.updatePlatformAct(platformSelect, platformSelect.FActivation.Platform_Event_Index);
 end;
 Close;
end;

procedure TfPlatformDeploytment.btnRemoveClick(Sender: TObject);
begin
  //removeRecord
  dataModuleTTT := TdmTTT.Create(Self);
  with TPlatform_Instance(SIMMgr.Platform_Insts[PlatformDeploymentPickListForm.lbPlatforms.ItemIndex]) do
  begin
    dataModuleTTT.deletePlatformByIndex(IntToStr(FData.Platform_Instance_Index));
  end;
end;

procedure TfPlatformDeploytment.btnScreenCaptureClick(Sender: TObject);
begin
    //stateDrawing := false;
    //stateMove := false;
    //stateDelete := false;
    b := TBitmap.Create;
    ScreenShot(b);
    isCapturingScreen := true;
    fScrCapture.Image1.Picture.Assign(b);
end;

procedure TfPlatformDeploytment.ScreenShot(DestBitmap : TBitmap) ;
 var
   DC : HDC;
 begin
   DC := GetDC (GetDesktopWindow) ;
   try
    DestBitmap.Width := GetDeviceCaps (DC, HORZRES) ;
    DestBitmap.Height := GetDeviceCaps (DC, VERTRES) ;
    BitBlt(DestBitmap.Canvas.Handle, 0, 0, DestBitmap.Width, DestBitmap.Height, DC, 0, 0, SRCCOPY) ;
   finally
    ReleaseDC (GetDesktopWindow, DC) ;
   end;
 end;

procedure TfPlatformDeploytment.drawPlatform(plat : TPlatform_Instance);
begin
   with plat.FActivation do
   begin
     //
   end;
end;

procedure TfPlatformDeploytment.toolbtnDecreaseScaleClick(Sender: TObject);
begin
  if  cbSetScale.ItemIndex >  0 then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex  - 1;
    toolbtnIncreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if cbsetscale.ItemIndex = 0 then
   toolbtnDecreaseScale.Enabled := false
  else
   toolbtnDecreaseScale.Enabled := true;
end;

procedure TfPlatformDeploytment.toolbtnIncreaseScaleClick(Sender: TObject);
begin
  if  (cbSetScale.ItemIndex <= 500) then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex + 1;
    toolbtnDecreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if (cbSetScale.ItemIndex = 0) then //sampai batas akhir
   toolbtnIncreaseScale.Enabled := true
  else
    toolbtnIncreaseScale.Enabled := true;
end;

procedure TfPlatformDeploytment.ToolButton10Click(Sender: TObject);
begin
  with frmScenario.GameEnvi.FGameArea do
  begin
  if (Game_Centre_Lat <> 0) and (Game_Centre_Long <> 0)then
    begin
    Map1.CenterX := Game_Centre_Long;
    Map1.CenterY := Game_Centre_Lat;
    end;
  end;
end;

procedure TfPlatformDeploytment.ToolButton13Click(Sender: TObject);
begin
  Map1.CurrentTool := miZoomInTool;
  Map1.MousePointer := miZoomInCursor;
end;

procedure TfPlatformDeploytment.ToolButton14Click(Sender: TObject);
begin

    statePan := true;
    stateDrawing := false;
    stateDelete := false;
    stateSelect := false;

    Map1.CurrentTool := miArrowTool;
    Map1.MousePointer := miCenterCursor;
end;

procedure TfPlatformDeploytment.ToolButton1Click(Sender: TObject);
begin
  selectTool := true;
end;

procedure TfPlatformDeploytment.ToolButton3Click(Sender: TObject);
begin
  statePan := false;
  stateDrawing := false;
  stateDelete := false;
  stateSelect := true;

  {stateMove := true;
  stateDrawing := false;
  stateDelete := false;  }

  Map1.MousePointer := miCrossCursor;
  Map1.CurrentTool := miArrowTool;

  selectTool := false;
  LoadPlatformInstanceAct;
  Map1.Repaint;
end;

procedure TfPlatformDeploytment.cbLateralGuidChange(Sender: TObject);
begin
  case cbLateralGuid.ItemIndex of
   -1: grbDefaultKosong.BringToFront;
   0:
    begin
    grbStraightGuidance.BringToFront;
    end;
   1:
    begin
    grbPatternOnSelfGuidance.BringToFront;
    end;
   2:
    begin
    grbPatternOnTargetGuidance.BringToFront;
    end;
   3:
    begin
    grbPatternOnPointGuidance.BringToFront;
    end;
   4:
    begin
    grbHelmGuidance.BringToFront;
    end;
   5:
    begin
    grbReturnToBaseGuidance.BringToFront;
    end;
   6:
    begin
    grbStationKeepOnTrackGuidance.BringToFront;
    end;
   7:
    begin
    grbStationKeepOnPositionGuidance.BringToFront;
    end;
   8:
    begin
    grbCircleOnTrackGuidance.BringToFront;
    end;
   9:
    begin
    grbCircleOnPointGuidance.BringToFront;
    end;
   10:
    begin
    grbZigZagGuidance.BringToFront;
    end;
   11:
    begin
    grbSinuateGuidance.BringToFront;
    end;
   12:
    begin
    grbShadowGuidance.BringToFront;
    end;
   13:
    begin
    grbEngagementGuidance.BringToFront;
    end;
   14:
    begin
    grbEvasionGuidance.BringToFront;
    end;
   15:
    begin
    grbOutRunGuidance.BringToFront;
    end;
   16:
    begin
    grbWayPointGuidance.BringToFront;
    end;
  end;

  //jik
end;

procedure TfPlatformDeploytment.cbSetScaleChange(Sender: TObject);
var z : Double;
    s : string;
begin
  Map1.OnMapViewChanged := nil;
  if cbSetScale.ItemIndex < 0  then Exit;

  //if (cbSetScale.ItemIndex<=5) then
  if (cbSetScale.ItemIndex <= 500) then
  begin
   s := cbSetScale.Items[cbSetScale.ItemIndex];
   try
     z := StrToFloat(s);
     Map1.ZoomTo(z, Map1.CenterX, Map1.CenterY);
   finally

   end;
  end
  else cbSetScale.ItemIndex := cbSetScale.ItemIndex -1 ;
  Map1.OnMapViewChanged := Map1MapViewChanged;
end;

procedure TfPlatformDeploytment.FormActivate(Sender: TObject);
begin
  Map1.Refresh;
end;

procedure TfPlatformDeploytment.FormCreate(Sender: TObject);
begin
  Self.HookContactInfoTraineeDisplay.TabIndex := 0;
  Scenario := TScenario_Definition.Create;
  ResourceAllocation := TResource_Allocation.Create;
  platformSelect := TPlatform_Instance.Create;
  platformPropSelected := TSymbolsProp.Create;
  Deployment := TAsset_Deployment.Create;
  GameEnvi := TGame_Environment_Definition.Create;

  Map1.BackColor := clSkyBlue;
  Map1.DoubleBuffered := true;

  FCanvas := TCanvas.Create;
  platformList := TList.Create;
  platformObj := TBitmapSymbol.Create;

  FCoordPlatformConv := TCoordConverter.Create;
  FCoordPlatformConv.FMap := Map1;

  objList := TList.Create;
  recycleList := TList.Create;

  List := TList.Create;
end;

procedure TfPlatformDeploytment.FormDestroy(Sender: TObject);
begin
  if Assigned(FMapPlatform) then
    FMapPlatform.free;
end;

procedure TfPlatformDeploytment.FormShow(Sender: TObject);
begin
  Self.HookContactInfoTraineeDisplay.TabIndex := 0;

  Map1.Repaint;
end;

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure TfPlatformDeploytment.loadENC(name: String);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if Map1 = nil then
    Exit;
  InitOleVariant(z);
  Map1.Layers.RemoveAll;

  Map1.Geoset := name;

  if name <> '' then
  begin
    for i := 1 to Map1.Layers.Count do
    begin
      Map1.Layers.Item(i).Selectable := false;
      Map1.Layers.Item(i).Editable := false;
      // FMap.Layers.Item(i).AutoLabel := True;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := Map1.Layers.Add(mInfo, 1);

    Map1.Layers.AnimationLayer := FLyrDraw;
    Map1.MapUnit := miUnitNauticalMile;
  end;
  Map1.BackColor := RGB(192, 224, 255);
end;

procedure TfPlatformDeploytment.createGeoset(getNameArea : string);
var
  aGeoset: string;
begin
  // getNameArea := OverlayGameEnviroDef.FGameArea.Game_Area_Identifier;
  //getNameArea := fOverlay.edtArea.Text;
  // aGeoset := ExtractFilePath(Application.ExeName) + 'game_area\part1.gst';
  //aGeoset := ExtractFilePath(Application.ExeName) + 'game_area\' + getNameArea + '\' + getNameArea + '.gst';
  aGeoset := 'M:\game_area\' + getNameArea + '\' + getNameArea + '.gst';
  LoadMap(aGeoset);
end;

procedure TfPlatformDeploytment.LoadMap(aGeoset: String);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
  unusedVt: OleVariant;
  MyFont: TFont;
begin
  if Map1 = nil then
    Exit;
  InitOleVariant(z);
  Map1.Layers.RemoveAll;

  Map1.Geoset := aGeoset;

  if aGeoset <> '' then
  begin
    for i := 1 to Map1.Layers.Count do
    begin
      Map1.Layers.Item(i).Selectable := false;
      Map1.Layers.Item(i).Editable := false;
      // FMap.Layers.Item(i).AutoLabel := True;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := Map1.Layers.Add(mInfo, 1);

    Map1.Layers.AnimationLayer := FLyrDraw;
    Map1.MapUnit := miUnitNauticalMile;
  end;
  // FMap.BackColor := RGB(192, 224, 255);
  Map1.BackColor := clSkyBlue;
end;



procedure TfPlatformDeploytment.Map1DblClick(Sender: TObject);
begin
  statePan := false;
  stateDrawing := false;
  stateDelete := false;
  stateSelect := true;

  Map1.MousePointer := miCrossCursor;
  Map1.CurrentTool := miArrowTool;
end;

procedure TfPlatformDeploytment.Map1DrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Cardinal; const RectFull,
  RectInvalid: IDispatch);
  var
  I : integer;
  longSelected, lattSelected : double;
  xPointSelected, yPointSelected : single;
  xIntSelected, yIntSelected : integer;
  {}
 begin
   if not Assigned(FCanvas) then
    Exit;
    FCanvas.Handle := hOutputDC;

    //FCanvas.Pen.Color := clGreen;
    FCanvas.Pen.Color := RGB(200, 240, 100);
    FCanvas.Pen.Width := 1;

    //create symbols  (set positions for each symbol)
    for I := 0 to List.Count - 1 do
    begin
           TSymbolsProp(List[I]).bmp.ConvertCoord(VConvertor);
           if (TSymbolsProp(List[I]).x = 0) AND (TSymbolsProp(List[I]).y = 0) then
           begin
                 fPlatformDeploytment.Map1.ConvertCoord(xPoint, yPoint, frmScenario.centreLong, frmScenario.centreLatt, miMapToScreen);
                 xIntPoint := Round(xPoint);
                 yIntPoint := Round(yPoint);
           end
           else
           begin
                 fPlatformDeploytment.Map1.ConvertCoord(xPoint, yPoint, TSymbolsProp(List[I]).x, TSymbolsProp(List[I]).y, miMapToScreen);
                 xIntPoint := Round(xPoint);
                 yIntPoint := Round(yPoint);
           end;
         TSymbolsProp(List[I]).bmp.Center.X := xIntPoint;
         TSymbolsProp(List[I]).bmp.Center.Y := yIntPoint;
         TSymbolsProp(List[I]).bmp.Draw(FCanvas);
    end;

    // create line plus (+)
    if isApproximatedClicked then
    begin
          FCanvas.MoveTo(currentX - 5, currentY);
          FCanvas.LineTo(currentX + 5, currentY);
          FCanvas.MoveTo(currentX, currentY + 5);
          FCanvas.LineTo(currentX, currentY - 5);
          FCanvas.Pen.Color := clBlack;
          FCanvas.Pen.Mode := pmMask;
    end;

  {if isCapturingScreen then begin
      FCanvas.Pen.Color := RGB(255, 255, 255);
      FCanvas.Pen.Width := 1;
      FCanvas.Pen.Mode := pmCopy;
      FCanvas.Brush.Style := bsClear;

        if MouseIsDown then begin
          FCanvas.MoveTo(gPoint.X, 0);

          //FCanvas.Rectangle(fScrCapture.PDown.X, fScrCapture.PDown.Y, gPoint.X, gPoint.Y  );

          FCanvas.TextOut(gPoint.X+10,gPoint.Y-20, 'width:'+inttostr(gPoint.X-fscrCapture.PDown.X)+
          ',height:'+inttostr(gPoint.Y-fscrcapture.PDown.Y)+';('+inttostr(Panel3.Width+gPoint.X)+','+IntToStr(gPoint.Y)+')');
        end
        else begin
          FCanvas.MoveTo(gPoint.X, 0);
          FCanvas.LineTo(gPoint.X, Height);

          FCanvas.MoveTo(0, gPoint.Y);
          FCanvas.LineTo(Width, gPoint.Y);
          FCanvas.TextOut(gPoint.X+10,gPoint.Y-20, IntToStr(Panel3.Width+gPoint.X)+','+IntToStr(gPoint.Y));
        end;

    end;    }
end;

procedure TfPlatformDeploytment.LoadPlatformInstanceAct;
var
  I : integer;
  symbolBmp : TSymbolsProp;
  flag : Array [0..100] of integer;
  domainArray : Array [0..100] of integer;
  indexArray : Array[0..1] of integer;
  Vehicle : TVehicle_Definition;
  stringLat , stringLong : string;
  compareLatt, compareLong : string;
  centreLatt, centreLong : double;
begin
    //stringLat := '00° 00.000' + ''' ' + 'N';
    //stringLong := '000° 00.000' + ''' ' + 'E';
    List.Clear;
    Vehicle := TVehicle_Definition.Create;
    dmTTT.getPlatFormInstance(frmScenario.Scenario.FData.Resource_Alloc_Index,0,'',SIMMgr.Platform_Insts);

    for I := 0 to SIMMgr.Platform_Insts.Count - 1 do
    begin
         flag[I] := 0;
    end;

    for I := 0 to SIMMgr.Platform_Insts.Count - 1 do
    begin
      symbolBmp := TSymbolsProp.Create;
       with symbolBmp do
       begin
          bmp := TBitmapSymbol.Create;
          Fplatform := TPlatform_Instance(SIMMgr.Platform_Insts[I]);
          dmTTT.GetPlatform_ActivationToPlatformInstance(Fplatform.FData.Platform_Instance_Index, Fplatform);
          dmTTT.GetVehicle_Definition(Fplatform.FData.Vehicle_Index, Vehicle);

          {if exist position or if not default}
          if Fplatform.FActivation.Init_Position_Longitude = 0 then
          begin
            x := GameEnvi.FGameArea.Game_Centre_Long;
          end
          else
          begin
            x := Fplatform.FActivation.Init_Position_Longitude;
          end;

          if Fplatform.FActivation.Init_Position_Latitude = 0 then
          begin
            y := GameEnvi.FGameArea.Game_Centre_Lat;
          end
          else
          begin
            y := Fplatform.FActivation.Init_Position_Latitude;
          end;

          instanceNames := Fplatform.FData.Instance_Name;
          verti := Fplatform.FActivation.Init_Position_Cartesian_Y;
          hori := Fplatform.FActivation.Init_Position_Cartesian_X;
          course := Fplatform.FActivation.Init_Course;
          helmAngle := Fplatform.FActivation.Init_Helm_Angle;
          groundSpeed := Fplatform.FActivation.Init_Ground_Speed;
          verticalSpeed := Fplatform.FActivation.Init_Vertical_Speed;
          altitude := Fplatform.FActivation.Init_Altitude;
          {}
          guidanceType := Fplatform.FActivation.Init_Guidance_Type;
          commandCourse := Fplatform.FActivation.Init_Command_Course;
          commandGround := Fplatform.FActivation.Init_Command_Ground;
          patternInstIndex := Fplatform.FActivation.Pattern_Instance_Index;
          angularOffset := Fplatform.FActivation.Angular_Offset;
          guidanceTarget := Fplatform.FActivation.Guidance_Target;
          anchorLatt := Fplatform.FActivation.Anchor_Latitude;
          anchorLong := Fplatform.FActivation.Anchor_Longitude;
          anchorCartesianX := Fplatform.FActivation.Anchor_Cartesian_X;
          anchorCartesianY := Fplatform.FActivation.Anchor_Cartesian_Y;
          targetRange := Fplatform.FActivation.Target_Range;
          radiusOfTravel := Fplatform.FActivation.Radius_of_Travel;
          directionOfTravel := Fplatform.FActivation.Direction_of_Travel;
          dynamicCircRangeOffset := Fplatform.FActivation.Dynamic_Circle_Range_Offset;
          dynamicCircAngleOffset := Fplatform.FActivation.Dynamic_Circle_Angle_Offset;
          circleLatt := Fplatform.FActivation.Circle_Latitude;
          circleLong := Fplatform.FActivation.Circle_Longitude;
          circleX := Fplatform.FActivation.Circle_X;
          circleY := Fplatform.FActivation.Circle_Y;
          zigzagLegType := Fplatform.FActivation.Zig_Zag_Leg_Type;
          periodDistance := Fplatform.FActivation.Period_Distance;
          amplitudeDistance := Fplatform.FActivation.Amplitude_Distance;
          waypointTermination := Fplatform.FActivation.Waypoint_Termination;
          {}
          idPlatform := Fplatform.FData.Platform_Instance_Index;
          platformDomain := Vehicle.FData.Platform_Domain;
          forcePlatform := Fplatform.FData.Force_Designation;

          domainArray[I] := platformDomain;
          case forcePlatform of
            1 : begin
                    symbolBmp.color := clRed;
                    flag[I] := 1;
                end;
            2 : begin
                    symbolBmp.color := clYellow;
                    flag[I] := 2;
                end;
            3 : begin
                    symbolBmp.color := clBlue;
                    flag[I] := 3;
                    end;
            4 : begin
                    symbolBmp.color := clGreen;
                    flag[I] := 4;
                end;
            5 : begin
                    symbolBmp.color := clWhite;
                    flag[I] := 5;
                end;
            6 : begin
                    symbolBmp.color := clBlack;
                    flag[I] := 6;
                end;
          end;
          if symbolBmp.Fplatform.FData.Platform_Instance_Index = idFocusedPlatform then
          begin
             symbolBmp.color := RGB(255, 191, 128);
          end;
          if selectTool then
          begin
                if I = arrowFlag then
                begin
                   symbolBmp.color := RGB(255, 191, 128);
                end;
          end;
       end;         //end with
       List.Add(symbolBmp);
    end;

    for I := 0 to List.Count - 1 do
    begin
        if I = 0 then
           indexArray[0] := flag[I]
        else
        begin
           if flag[I] <> indexArray[0] then
             indexArray[1] := flag[I];
        end;
    end;

    for I := 0 to List.Count - 1 do
    begin
       if flag[I] = indexArray[0] then
       begin
          if domainArray[I] = 0 then patchBmp := ExtractFilePath(Application.ExeName) + 'data\Bitmap\AirFriend.bmp';          //air
          if domainArray[I] = 1 then patchBmp := ExtractFilePath(Application.ExeName) + 'data\Bitmap\SurfaceFriend.bmp';      //surface
          if domainArray[I] = 2 then patchBmp := ExtractFilePath(Application.ExeName) + 'data\Bitmap\SubsurfaceFriend.bmp';   //subsurface
          if domainArray[I] = 3 then patchBmp := ExtractFilePath(Application.ExeName) + 'data\Bitmap\LandFriend.bmp';         //land
          if domainArray[I] = 4 then patchBmp := ExtractFilePath(Application.ExeName) + 'data\Bitmap\LandFriend.bmp';         //amphibious
       end;
       if flag[I] = indexArray[1] then
       begin
          if domainArray[I] = 0 then patchBmp := ExtractFilePath(Application.ExeName) + 'data\Bitmap\AirHostile.bmp';          //air
          if domainArray[I] = 1 then patchBmp := ExtractFilePath(Application.ExeName) + 'data\Bitmap\SurfaceHostile.bmp';      //surface
          if domainArray[I] = 2 then patchBmp := ExtractFilePath(Application.ExeName) + 'data\Bitmap\SubsurfaceHostile.bmp';   //subsurface
          if domainArray[I] = 3 then patchBmp := ExtractFilePath(Application.ExeName) + 'data\Bitmap\LandHostile.bmp';         //land
          if domainArray[I] = 4 then patchBmp := ExtractFilePath(Application.ExeName) + 'data\Bitmap\LandHostile.bmp';         //amphibious
       end;

       TSymbolsProp(List[I]).LoadBitmapSymbols(patchBmp, TSymbolsProp(List[I]).color);

       {compareLong := formatDM_longitude(TSymbolsProp(List[I]).x);
       compareLatt := formatDM_latitude(TSymbolsProp(List[I]).y);
       if compareLatt = stringLat then
       begin
           centreLong :=  GameEnvi.FGameArea.Game_Centre_Long;
           centreLatt := GameEnvi.FGameArea.Game_Centre_Lat;
           fPlatformDeploytment.Map1.ConvertCoord(xPoint, yPoint, centreLong, centreLatt, miMapToScreen);
           xIntPoint := Round(xPoint);
           yIntPoint := Round(yPoint);
       end
       else
       begin  }
       {
           fPlatformDeploytment.Map1.ConvertCoord(xPoint, yPoint, TSymbolsProp(List[I]).x, TSymbolsProp(List[I]).y, miMapToScreen);
           xIntPoint := Round(xPoint);
           yIntPoint := Round(yPoint);
       //end;
       TSymbolsProp(List[I]).bmp.Center.X := xIntPoint;
       TSymbolsProp(List[I]).bmp.Center.Y := yIntPoint;
       }
    end;


end;

procedure TfPlatformDeploytment.Map1MapViewChanged(Sender: TObject);
var
    tempZoom : double;
    index : integer;
    test : string;
begin
    if Map1.CurrentTool = miZoomInTool then
    begin
       if Map1.Zoom <= 0.125 then tempZoom := 0.125;
       if (Map1.Zoom > 0.125) AND (Map1.Zoom < 1) then tempZoom := Map1.Zoom;
       if (Map1.Zoom >= 1) AND (Map1.Zoom <= 2500) then tempZoom := round(Map1.Zoom);
       if Map1.Zoom > 2500 then tempZoom := 2500;

       Map1.OnMapViewChanged := nil;
       Map1.ZoomTo(tempZoom, Map1.CenterX, Map1.CenterY);

       if (Map1.Zoom > 0.125) AND (Map1.Zoom < 0.25) then
       begin
             cbSetScale.Text := FormatFloat('0.000', tempZoom);
       end
       else if (map1.Zoom >= 0.25) AND (map1.Zoom < 0.5) then
       begin
             cbSetScale.Text := FormatFloat('0.00', tempZoom);
       end
       else if (map1.Zoom >= 0.5) AND (map1.Zoom < 1) then
       begin
             cbSetScale.Text := FormatFloat('0.0', tempZoom);
       end
       else
             cbSetScale.Text := floattostr(tempZoom);
       Map1.OnMapViewChanged := Map1MapViewChanged;
    end;

end;

procedure TfPlatformDeploytment.Map1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
      latX, longY : double;
      sumPlatform, id : integer;
      I : Integer;
begin
  //Map1.Refresh;
  FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);
  if statePan then
  begin
    Map1.CenterX := xx;
    Map1.CenterY := yy;
  end;

  if isApproximatedClicked then
  begin
      //create converter
      FCoordPlatformConv := TCoordConverter.Create;
      //set mapnya
      FCoordPlatformConv.FMap := Map1;

      FCoordPlatformConv.ConvertToMap(X, Y, latX, longY);

      edVert.Text := IntToStr(X);
      edHorz.Text := IntToStr(Y);

      edLatPosition.Text := formatDM_latitude(longY);
      edLongPosition.Text := formatDM_longitude(latX);

      Map1.Repaint;
  end;

  {if isCapturingScreen then
  with fscrCapture do
  begin
       PDown.X := X;
       PDown.Y := Y;
       PActually.X := X;
       PActually.Y := Y;
       MouseIsDown := TRUE;
       Canvas.DrawFocusRect(Rect(x, y, x, y));
  end;

  gPoint.X := X;
  gPoint.Y := Y;
  }

  if selectTool then
  begin
      currentX := X;
      currentY := Y;
      coloringByMouse;
      LoadPlatformInstanceAct;
      Map1.Repaint;
  end;
end;

procedure TfPlatformDeploytment.coloringByMouse;
var
      I : integer;
      InstanceName : Array [0..100] of String;
      PlatformInstanceIndex : Array [0..100] of integer;
      ForceDesignation : Array [0..100] of integer;
      platformList : Array [0..100] of String;

      tempx, tempy : single;
      resultX, resultY, selisihScreen : integer;
      xLeft, xRight, yLeft, yRight : integer;
begin
     for I := 0 to List.Count -1 do
     begin
            Map1.ConvertCoord(tempx, tempy, TSymbolsProp(List[I]).x, TSymbolsProp(List[I]).y, miMapToScreen);
            resultX := Round(tempx);
            resultY := Round(tempy);

            selisihScreen := 7;

            //get range
            xLeft := resultX - selisihScreen;
            yLeft := resultY + selisihScreen;
            xRight := resultX + selisihScreen;
            yRight := resultY - selisihScreen;

            {if (TSymbolsProp(List[I]).x = 0) AND (TSymbolsProp(List[I]).y = 0) then
            begin
                  //pada saat platform blm di aktivasi
                   arrowFlag := I;
            end
            else
            begin }
                  if (currentX >= xLeft) AND (currentX <= xRight) then
                  begin
                      if (currentY <= yLeft) AND (currentY >= yRight) then
                      begin
                          arrowFlag := I;

                          edPlatform.Text := TSymbolsProp(List[I]).instanceNames;
                          edLongPosition.Text := formatDM_longitude(TSymbolsProp(List[I]).x);
                          edLatPosition.Text := formatDM_latitude(TSymbolsProp(List[I]).y);
                          edVert.Text := FormatFloat('0.000', TSymbolsProp(List[I]).verti);
                          edHorz.Text := FormatFloat('0.000', TSymbolsProp(List[I]).hori);
                          edCourse.Text := FormatFloat('0.000',TSymbolsProp(List[I]).course);
                          edHelmAngle.Text := FormatFloat('0.000', TSymbolsProp(List[I]).helmAngle);
                          cbGroundSpeed.ItemIndex := TSymbolsProp(List[I]).groundSpeed;
                          edAltitude.Text := FormatFloat('0.000',TSymbolsProp(List[I]).altitude);
                          cbVerticalSpeed.ItemIndex := TSymbolsProp(List[I]).verticalSpeed;

                          cbLateralGuid.ItemIndex := TSymbolsProp(List[I]).guidanceType;
                          //cbLateralGuidChange(Sender);
                          case cbLateralGuid.ItemIndex of
                           -1: grbDefaultKosong.BringToFront;
                           0:
                            begin
                            //grbStraightGuidance.BringToFront;
                            edtCourse_StraightGuidance.Text := FloatToStr(TSymbolsProp(List[I]).commandCourse);
                            cmbGroundSpeed_StraightGuidance.ItemIndex := TSymbolsProp(List[I]).commandGround;
                            end;
                           1:
                            begin
                            //grbPatternOnSelfGuidance.BringToFront;
                            edtPredefinedPattern_PatternOnSelfGuidance.Text := FloatToStr(TSymbolsProp(List[I]).patternInstIndex);
                            edtAngularOffset_PatternOnSelfGuidance.Text := FloatToStr(TSymbolsProp(List[I]).angularOffset);
                            end;
                           2:
                            begin
                            //grbPatternOnTargetGuidance.BringToFront;
                            edtPredefinedPattern_PatternOnTargetGuidance.Text := FloatToStr(TSymbolsProp(List[I]).patternInstIndex);
                            edtTarget_PatternOnTargetGuidance.Text := FloatToStr(TSymbolsProp(List[I]).guidanceTarget);
                            edtAngularOffset_PatternOnTargetGuidance.Text := FloatToStr(TSymbolsProp(List[I]).angularOffset);
                            end;
                           3:
                            begin
                            //grbPatternOnPointGuidance.BringToFront;
                            edtPredefinedPattern_PatternOnPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).patternInstIndex);
                            edtAngularOffset_PatternOnPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).angularOffset);
                            edtLatAnchor_PatternOnPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).anchorLatt);
                            edtLongAnchor_PatternOnPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).anchorLong);
                            edtXanchor_PatternOnPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).anchorCartesianX);
                            edtYanchor_PatternOnPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).anchorCartesianY);
                            end;
                           4:
                            begin
                            //grbHelmGuidance.BringToFront;
                            edtHelmAngle_HelmGuidance.Text := FloatToStr(TSymbolsProp(List[I]).helmAngle);
                            cmbGroundSpeed_HelmGuidance.ItemIndex := TSymbolsProp(List[I]).groundSpeed;
                            end;
                           5:
                            begin
                            //grbReturnToBaseGuidance.BringToFront;
                              cmbGroundSpeed_ReturnToBaseGuidance.ItemIndex := TSymbolsProp(List[I]).groundSpeed;
                              edtBase_ReturnToBaseGuidance.Text := FloatToStr(TSymbolsProp(List[I]).targetRange);
                            end;
                           6:
                            begin
                            //grbStationKeepOnTrackGuidance.BringToFront;
                              edtTarget_StationKeepOnTrackGuidance.Text := FloatToStr(TSymbolsProp(List[I]).guidanceTarget);
                              edtTargetRange_StationKeepOnTrackGuidance.Text := FloatToStr(TSymbolsProp(List[I]).targetRange);
                              //always true blm tahu ngambil dari mana
                              cbxAbsoluteOffsiteAngle_StationKeepOnTrackGuidance.Checked := true;
                            end;
                           7:
                            begin
                            //grbStationKeepOnPositionGuidance.BringToFront;
                              edtAnchorLat_StationKeepOnPositionGuidance.Text := FloatToStr(TSymbolsProp(List[I]).anchorLatt);
                              edtAnchorLong_StationKeepOnPositionGuidance.Text := FloatToStr(TSymbolsProp(List[I]).anchorLong);
                              edtAnchorX_StationKeepOnPositionGuidance.Text := FloatToStr(TSymbolsProp(List[I]).anchorCartesianX);
                              edtAnchorY_StationKeepOnPositionGuidance.Text := FloatToStr(TSymbolsProp(List[I]).anchorCartesianY);
                              //always true blm tahu ngambil dari mana
                              cbxDriftsOnCurrent_StationKeepOnPositionGuidance.Checked := true;
                            end;
                           8:
                            begin
                            //grbCircleOnTrackGuidance.BringToFront;
                              edtTarget_CircleOnTrackGuidance.Text := FloatToStr(TSymbolsProp(List[I]).guidanceTarget);
                              edtRadius_CircleOnTrackGuidance.Text := FloatToStr(TSymbolsProp(List[I]).radiusOfTravel);
                              cmbDirection_CircleOnTrackGuidance.ItemIndex := TSymbolsProp(List[I]).directionOfTravel;
                              cmbGroundSpeed_CircleOnTrackGuidance.ItemIndex := TSymbolsProp(List[I]).groundSpeed;
                              edtRangeOffset_CircleOnTrackGuidance.Text := FloatToStr(TSymbolsProp(List[I]).dynamicCircRangeOffset);
                              edtAngleOffset_CircleOnTrackGuidance.Text := FloatToStr(TSymbolsProp(List[I]).dynamicCircAngleOffset);

                              //always true blm tahu ngambil dari mana
                              cbxAbsoluteOffsetAngle_CircleOnTrackGuidance.Checked := true;
                            end;
                           9:
                            begin
                            //grbCircleOnPointGuidance.BringToFront;
                              edtCentreLat_CircleOnPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).circleLatt);
                              edtCentreLong_CircleOnPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).circleLong);
                              edtCentreX_CircleOnPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).circleX);
                              edtCentreY_CircleOnPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).circleY);
                              edtRadius_CircleOnPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).radiusOfTravel);
                              cmbDirection_CircleOnPointGuidance.ItemIndex := TSymbolsProp(List[I]).directionOfTravel;
                              cmbGroundSpeed_CircleOnPointGuidance.ItemIndex := TSymbolsProp(List[I]).groundSpeed;
                            end;
                           10:
                            begin
                            //grbZigZagGuidance.BringToFront;
                              cmbLegLength_ZigZagGuidance.ItemIndex := TSymbolsProp(List[I]).zigzagLegType;
                              edtBaseCourse_ZigZagGuidance.Text := FloatToStr(TSymbolsProp(List[I]).course);
                              edtPeriod_ZigZagGuidance.Text := FloatToStr(TSymbolsProp(List[I]).periodDistance);
                              edtAmplitude_ZigZagGuidance.Text := FloatToStr(TSymbolsProp(List[I]).amplitudeDistance);
                              cmbGroundSpeed_ZigZagGuidance.ItemIndex := TSymbolsProp(List[I]).groundSpeed;
                            end;
                           11:
                            begin
                            //grbSinuateGuidance.BringToFront;
                              edtBaseCourse_SinuateGuidance.Text := FloatToStr(TSymbolsProp(List[I]).course);
                              edtPeriod_SinuateGuidance.Text := FloatToStr(TSymbolsProp(List[I]).periodDistance);
                              edtAmplitude_SinuateGuidance.Text := FloatToStr(TSymbolsProp(List[I]).amplitudeDistance);
                              cmbGroundSpeed_SinuateGuidance.ItemIndex := TSymbolsProp(List[I]).groundSpeed;
                            end;
                           12:
                            begin
                            //grbShadowGuidance.BringToFront;
                              edtTarget_ShadowGuidance.Text := FloatToStr(TSymbolsProp(List[I]).guidanceTarget);
                              edtTargetRange_ShadowGuidance.Text := FloatToStr(TSymbolsProp(List[I]).targetRange);
                            end;
                           13:
                            begin
                            //grbEngagementGuidance.BringToFront;
                              edtTarget_EngagementGuidance.Text := FloatToStr(TSymbolsProp(List[I]).guidanceTarget);
                              edtTargetRange_EngagementGuidance.Text := FloatToStr(TSymbolsProp(List[I]).targetRange);
                            end;
                           14:
                            begin
                            //grbEvasionGuidance.BringToFront;
                              edtTarget_EvasionGuidance.Text := FloatToStr(TSymbolsProp(List[I]).guidanceTarget);
                            end;
                           15:
                            begin
                            //grbOutRunGuidance.BringToFront;
                              edtTarget_OutRunGuidance.Text := FloatToStr(TSymbolsProp(List[I]).guidanceTarget);
                            end;
                           16:
                            begin
                            //grbWayPointGuidance.BringToFront;
                              cmbType_WayPointGuidance.ItemIndex := TSymbolsProp(List[I]).waypointTermination;
                              edtRadius_WayPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).radiusOfTravel);
                              edtTarget_WayPointGuidance.Text := FloatToStr(TSymbolsProp(List[I]).guidanceTarget);
                            end;
                          end;

                      end;
                  end;
            //end;      //end else
     end;             //end for
end;

procedure GetGridIndex(const cx, cy, w: Double;
        var gid: TRect);
var i: integer;
    halfW: double;
begin
  halfW := 0.5 * w;

  i := Floor((cx - halfW + 180.0) / 10.0) + 1;
  gid.Left    := EnsureRange(i, 1, 36);

  i:=  Ceil((cx + halfW + 180.0) / 10.0) ;
  gid.Right   :=  EnsureRange(i, 1, 36);

  i := Floor ((90.0-(cy + halfW )) / 10.0)  ;
  gid.Top     :=  EnsureRange(i, 0, 17);

  i := Floor((90.0-(cy - halfW )) / 10.0) ;
  gid.Bottom  :=  EnsureRange(i, 0, 17);

end;

procedure TfPlatformDeploytment.Map1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  yCursorPoint, xCursorPoint, yCenter, xCenter, diffX, diffY : double;
begin
    FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);
   //bearing -> diambilkan dari mana? sementara dari distance meter

    //lbcenterx.Caption := FloatToStr(xx);
    //lbcentery.Caption := FloatToStr(yy);
    lBearingFCenter.Caption := FormatFloat('0.00',CalcBearing(Map1.CenterX, MAp1.CenterY, xx, yy));
    lDistanceFCenter.Caption := FormatFloat('0.00', FCoordPlatformConv.Distance_nmi(Map1.CenterX, MAp1.CenterY, xx, yy));

    //lGridLat.Caption := FormatFloat('0.00', yy);
    //lGridLong.Caption := FormatFloat('0.00', xx);

    //lPosLat.Caption := formatDMS_latt(yy);
    //lPosLong.Caption := formatDMS_long(xx);

    //////////////////////////////////////////////////////get grid cursor position
    yCursorPoint := yy;
    xCursorPoint := xx;

    yCenter := frmScenario.GameEnvi.FGameArea.Game_Centre_Lat;
    xCenter := frmScenario.GameEnvi.FGameArea.Game_Centre_Long;

    diffY := abs(yCursorPoint - yCenter);
    diffX := abs(xCursorPoint - xCenter);

    diffYnm := diffY * 60;
    diffXnm := diffX * 60;

    if yCursorPoint < yCenter then addStringY := 'S'
    else addStringY := 'N';

    if xCursorPoint < xCenter then addStringX := 'W'
    else addStringX := 'E';

    lPosLat.Caption := formatDM_latitude(yy);
    lPosLong.Caption := formatDM_longitude(xx);

    gridLatt := FormatFloat('0.00',diffYnm);
    gridLong := FormatFloat('0.00',diffXnm);
    lGridLat.Caption := gridLatt + ' nm ' + addStringY;
    lGridLong.Caption := gridLong + ' nm ' + addStringX;

    {if isCapturingScreen then
    begin
      gPoint.X := X;
      gPoint.Y := Y;
      if MouseIsDown then  begin
        with fscrCapture do begin

        //UpdateGameCenter(X,Y);
        //mapLandMass.Repaint;

        //Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, PActually.x,PActually.y));
        PActually.X := x;
        PActually.Y := y;
        //Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, x, y));
        end;
      end;
      map1.Repaint;
  end;   }

end;

procedure TfPlatformDeploytment.Map1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  I : integer;
begin
  //xxx := X;
  //yyy := Y;
  //Map1.ConvertCoord(xxx, yyy, xx, yy, miScreenToMap);
  //stateDrawing := false;

  if statePan then
  begin
    statePan := false;
    stateSelect := true;
    stateMove := true;
    Map1.CurrentTool := miPanTool;
    Map1.MousePointer := miCrossCursor;
  end;

 {if isCapturingScreen then
 begin

  with fscrCapture do
  begin

   PActually.X := x;
   PActually.Y := Y;
   MouseIsDown := TRUE;

   TmpBmp := TBitmap.Create;

   with TmpBmp do
   begin
     Width := Round(abs(PActually.x - PDown.x));
     Height := Round(abs(PActually.y - PDown.y));
     BitBlt(TmpBmp.Canvas.Handle, 0, 0, Width, Height, fScrCapture.Image1.Canvas.Handle, map1.Left+ PDown.x,
     PDown.y, SRCCOPY);
     fCaptureRes.imgCaptureResult.AutoSize := false;
     fCaptureRes.imgCaptureResult.Picture.Bitmap.Assign(TmpBmp);
     fCaptureRes.Width := Width+10;
     fCaptureRes.Height := Height+fCaptureRes.panel3.height+10;
     fCaptureRes.ShowModal;

     if  fCaptureRes.recapture then  fCaptureRes.recapture:= false
     else isCapturingScreen := false;
     MouseIsDown :=false;
   end;

  end;

 end;
 gPoint.X := X;
 gPoint.Y := Y;
 map1.Repaint;   }

end;


procedure TfPlatformDeploytment.DrawAllBitmap;
  var
    I: Integer;
  begin
     for I := 0 to platformList.Count - 1 do
     begin
        TBitmapSymbol(platformList[I]).Draw(FCanvas);
     end;
     Map1.Repaint;
  end;

procedure TfPlatformDeploytment.setCBScale;
var
  widthNM: Integer;
  limitWidth: Array [0 .. 15] of double;
  arrayTemp: Array [0 .. 30] of double;
  arrayStringTemp: Array [0 .. 30] of String;
  resultTemp: Array [0 .. 30] of String;
  a, b: Integer;
  unusedVt: OleVariant;
  MyFont: TFont;
begin
  widthNM := floor(frmScenario.widthGameArea);
  // isi combo box
  cbSetScale.Clear;

  limitWidth[0] := 0.125;
  limitWidth[1] := 0.25;
  limitWidth[2] := 0.5;
  limitWidth[3] := 1;
  limitWidth[4] := 2;
  limitWidth[5] := 4;
  limitWidth[6] := 8;
  limitWidth[7] := 16;
  limitWidth[8] := 32;
  limitWidth[9] := 64;
  limitWidth[10] := 128;
  limitWidth[11] := 256;
  limitWidth[12] := 512;
  limitWidth[13] := 1024;
  limitWidth[14] := 2048;
  limitWidth[15] := 2500;

  a := 0;
  while limitWidth[a] < widthNM do
  begin
    arrayTemp[a] := limitWidth[a];
    a := a + 1;
  end;
  arrayTemp[a] := widthNM;

  for b := 0 to a do
    arrayStringTemp[b] := floattostr(arrayTemp[b]);

  for b := 0 to a do
  begin
    resultTemp[b] := arrayStringTemp[b];
    cbSetScale.Items.Add(resultTemp[b]);
  end;
end;

function TfPlatformDeploytment.getPlatformSelectedByID : TSymbolsProp;
var
  I: Integer;
begin
    Result := nil;
    for I := 0 to List.Count - 1 do
    begin
      if TSymbolsProp(List[I]).Fplatform.FData.Platform_Instance_Index = idFocusedPlatform then
      begin
        TSymbolsProp(List[I]).color := clLime;
        TSymbolsProp(List[I]).bmp.Color := clLime;
        Result := TSymbolsProp(List[I]);

        Exit;
      end;
    end;
end;

end.
