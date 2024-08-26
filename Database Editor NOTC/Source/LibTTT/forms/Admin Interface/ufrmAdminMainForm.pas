unit ufrmAdminMainForm;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, VrControls, VrWheel, ExtCtrls,
  OleCtrls, Buttons, SpeedButtonImage, Math,

  uDBAsset_GameEnvironment, uDBAssetObject,
   uCoordConvertor, uBaseCoordSystem,
  ufrmGroupMemberSelection, uDBAsset_Logistics, uDBAsset_Runtime_Platform_Library,
  tttData, uDataTypes, uObjectVisuals, uDBAsset_Base, ufrmGroupPersonel,
  uWaypointWindow, ufrmSummaryWaypoint,ufrmTransportPickList, uTargetEditor,
  System.ImageList;

const
  TOOL_DISTANCE = 100;
  TOOL_MULTISELECT = 101;
  TOOL_POSITION = 102;
  TOOL_EDIT_WAYPOINT = 103;
  TOOL_ADD_WAYPOINT = 104;
  TOOL_ADD_TARGET = 105;
  TOOL_MOVE_PLATFORM = 106;

type
  TStateToolButton = (sHand, sArrow, sZoomIn, sZoomOut, sCenter, sAirMap, sLandMap, sSeaMap, sRuler, sMulti, sPlatformView, sMove);
  TPortSelect = (sSangattaENC, sSitubondoENC, sSangattaVector, sSitubondoVector, sOtherPort, aJawaBali);

  TfrmAdminMainForm = class(TForm)
    MainMenu1: TMainMenu;
    Exercise1: TMenuItem;
    Platforms1: TMenuItem;
    Sensors1: TMenuItem;
    Weapons1: TMenuItem;
    Countermeasures1: TMenuItem;
    Other1: TMenuItem;
    Options1: TMenuItem;
    Shutdown1: TMenuItem;
    Help1: TMenuItem;
    Scenario1: TMenuItem;
    ResourceAllocation1: TMenuItem;
    Environment1: TMenuItem;
    GameArea1: TMenuItem;
    Vehicle1: TMenuItem;
    Motion1: TMenuItem;
    Radar1: TMenuItem;
    Sonar1: TMenuItem;
    ESM1: TMenuItem;
    ElectroOpticalDetector1: TMenuItem;
    MAD1: TMenuItem;
    Sonobuoy1: TMenuItem;
    Missile1: TMenuItem;
    orpedo1: TMenuItem;
    Mine1: TMenuItem;
    Gun1: TMenuItem;
    Bomb1: TMenuItem;
    AcousticDecoy1: TMenuItem;
    AirBubble1: TMenuItem;
    Chaff1: TMenuItem;
    FloatingDecoy1: TMenuItem;
    SelfDefensiveJammer1: TMenuItem;
    owedJammerDecoy1: TMenuItem;
    RadarNoiseJammer1: TMenuItem;
    RuntimePlatformLibrary1: TMenuItem;
    GraphicalOverlays1: TMenuItem;
    x1: TMenuItem;
    GameDefaults1: TMenuItem;
    SNRvsPODCurve1: TMenuItem;
    EmbarkLibrary1: TMenuItem;
    DisplayDimensionsinfeet1: TMenuItem;
    DisplayDimensionsinmetres1: TMenuItem;
    ShutdownDatabaseEditor1: TMenuItem;
    AboutDatabaseEditor1: TMenuItem;
    InfraredDecoy1: TMenuItem;
    Map1: TMap;
    grpForcePlatforms: TGroupBox;
    rbRedPlatforms: TRadioButton;
    rbAmberPlatforms: TRadioButton;
    rbBluePlatforms: TRadioButton;
    rbGreenPlatforms: TRadioButton;
    rbNoPlatforms: TRadioButton;
    grpPlatforms: TGroupBox;
    btnVehicle: TButton;
    btnWaypoint: TButton;
    btnDeploy: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    lvPlatform: TListView;
    grpSelect: TGroupBox;
    lbl2: TLabel;
    edtLatPosition: TEdit;
    lbl3: TLabel;
    edtLongPosition: TEdit;
    edtCourse: TEdit;
    edtAltitude: TEdit;
    grpGroup: TGroupBox;
    rgforce: TRadioGroup;
    lbl1: TLabel;
    btnGroups: TButton;
    btn1: TButton;
    btn2: TButton;
    grpInfo: TGroupBox;
    lblPlatformName: TLabel;
    pnlEnvi: TPanel;
    btnOkEnvi: TButton;
    bvl1: TBevel;
    lbl4: TLabel;
    lbl8: TLabel;
    lblLongitude: TLabel;
    lblLatitude: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lblX: TLabel;
    lblY: TLabel;
    cbbGroundSpeed: TComboBox;
    grpDeployAndFormation: TGroupBox;
    btnFormation: TButton;
    btnIdentIndex: TButton;
    btnLogistics: TButton;
    btnRuntimePlatformLibraries: TButton;
    lbl20: TLabel;
    cbbThemes: TComboBox;
    {sknmngr1: TsSkinManager; }
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl10: TLabel;
    lbl19: TLabel;
    lbl13: TLabel;
    btnSeaMap: TSpeedButtonImage;
    btnLandMap: TSpeedButtonImage;
    btnAirMap: TSpeedButtonImage;
    btnZoomOut: TSpeedButtonImage;
    btnZoomIn: TSpeedButtonImage;
    bvl3: TBevel;
    btnCenter: TSpeedButtonImage;
    btnArrow: TSpeedButtonImage;
    btnHand: TSpeedButtonImage;
    mniAdministrator1: TMenuItem;
    mniUserAdministrator1: TMenuItem;
    mniRegion1: TMenuItem;
    mniPort2: TMenuItem;
    mniBeach1: TMenuItem;
    mnibay1: TMenuItem;
    btnRuler: TSpeedButtonImage;
    lbl22: TLabel;
    btn4: TButton;
    grpSce: TGroupBox;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl6: TLabel;
    lbl9: TLabel;
    lbl21: TLabel;
    lbl23: TLabel;
    edtScenarioName: TEdit;
    edtStartTime: TEdit;
    btnEnvi: TButton;
    btnEditScenario: TButton;
    btnMapMode1: TButton;
    cbbPort: TComboBox;
    edtMapMode1: TEdit;
    dtpDate: TDateTimePicker;
    dtpTime: TDateTimePicker;
    edtMapMode2: TEdit;
    btnMapMode2: TButton;
    lbl24: TLabel;
    edtMapMode3: TEdit;
    btnMapMode3: TButton;
    btnMulti: TSpeedButtonImage;
    btnOverlay: TButton;
    Label1: TLabel;
    dtpDDay: TDateTimePicker;
    btnBase: TButton;
    dtpJamJ: TDateTimePicker;
    Personel1: TMenuItem;
    btnPlatformView: TSpeedButtonImage;
    grpTool: TGroupBox;
    pnlLeft: TPanel;
    pnlButtom: TPanel;
    ScrollBar1: TScrollBar;
    Plotting1: TMenuItem;
    btn3: TButton;
    ScrollBar2: TScrollBar;
    GameReport1: TMenuItem;
    GameArea2: TMenuItem;
    mniWaypoint1: TMenuItem;
    lblShowActivation: TLabel;
    pnlDetailActivation: TPanel;
    lblHideActivation: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblPlatformNameDetail: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label32: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label29: TLabel;
    Label33: TLabel;
    Label37: TLabel;
    edtLatPositionDetail: TEdit;
    edtLongPositionDetail: TEdit;
    edtCourseDetail: TEdit;
    edtAltitudeDetail: TEdit;
    cbbGroundSpeedDetail: TComboBox;
    edtFuelRemaining: TEdit;
    edtLubricantsRemaining: TEdit;
    edtFreshwaterRemaining: TEdit;
    edtWaterRemaining: TEdit;
    edtFoodRemaining: TEdit;
    GroupBox2: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    lvEmbarkPlatformSelected: TListView;
    ListView1: TListView;
    tvPersonel: TTreeView;
    Label36: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    btnDetailEmbarkPlatform: TButton;
    btnAddEmbarkDetail: TButton;
    Label2: TLabel;
	grp_Long: TGroupBox;
    lbl_CenterX: TLabel;
    lbl_CenterY: TLabel;
    lbl_ValueCenterX: TLabel;
    lbl_ValueCenterY: TLabel;
    lbl_Zoom: TLabel;
    lbl_ZoomValue: TLabel;
    lblUTM: TLabel;
    lblMGRS: TLabel;
    bvlX: TBevel;
    lbl25: TLabel;
    lbl26: TLabel;
    btnTarget: TButton;
    PopupMenu1: TPopupMenu;
    Hand1: TMenuItem;
    Arrow1: TMenuItem;
    Center1: TMenuItem;
    ZoomIn1: TMenuItem;
    ZoomOut1: TMenuItem;
    Ruler1: TMenuItem;
    MultiSelect1: TMenuItem;
    TacticalView1: TMenuItem;
    ImageList1: TImageList;
    btnMove: TSpeedButtonImage;
    Move1: TMenuItem;
    mniView1: TMenuItem;
    mniStaticSymbolMode1: TMenuItem;
    mniDinamicViewMode1: TMenuItem;
    mniDimensionSymbolMode1: TMenuItem;
    mniLogistics1: TMenuItem;
    mniTransport1: TMenuItem;
    Panel1: TPanel;
    procedure Scenario1Click(Sender: TObject);
    procedure ResourceAllocation1Click(Sender: TObject);
    procedure Environment1Click(Sender: TObject);
    procedure GameArea1Click(Sender: TObject);
    procedure Vehicle1Click(Sender: TObject);
    procedure Satellite1Click(Sender: TObject);
    procedure ShutdownDatabaseEditor1Click(Sender: TObject);
    procedure Motion1Click(Sender: TObject);
    procedure Radar1Click(Sender: TObject);
    procedure Sonar1Click(Sender: TObject);
   	procedure ESM1Click(Sender: TObject);
    procedure ElectroOpticalDetector1Click(Sender: TObject);
    procedure MAD1Click(Sender: TObject);
    procedure Sonobuoy1Click(Sender: TObject);
    procedure Missile1Click(Sender: TObject);
    procedure orpedo1Click(Sender: TObject);
    procedure Mine1Click(Sender: TObject);
    procedure Gun1Click(Sender: TObject);
    procedure Bomb1Click(Sender: TObject);
    procedure AcousticDecoy1Click(Sender: TObject);
    procedure AirBubble1Click(Sender: TObject);
    procedure Chaff1Click(Sender: TObject);
    procedure FloatingDecoy1Click(Sender: TObject);
    procedure SelfDefensiveJammer1Click(Sender: TObject);
    procedure owedJammerDecoy1Click(Sender: TObject);
    procedure RadarNoiseJammer1Click(Sender: TObject);
    procedure PredefinedPatterns1Click(Sender: TObject);
    procedure RuntimePlatformLibrary1Click(Sender: TObject);
    procedure RadarActivationIntervals1Click(Sender: TObject);
    procedure GraphicalOverlays1Click(Sender: TObject);
    procedure x1Click(Sender: TObject);
    procedure GameDefaults1Click(Sender: TObject);
    procedure SNRvsPODCurve1Click(Sender: TObject);
    procedure ReportEditor1Click(Sender: TObject);
    procedure EmbarkLibrary1Click(Sender: TObject);
    procedure InfraredDecoy1Click(Sender: TObject);
    procedure DisplayDimensionsinfeet1Click(Sender: TObject);
    procedure DisplayDimensionsinmetres1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AboutDatabaseEditor1Click(Sender: TObject);
    procedure cbbPortChange(Sender: TObject);
    procedure btnVehicleClick(Sender: TObject);
    procedure btnDeployClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnGroupsClick(Sender: TObject);
    procedure btnEnviClick(Sender: TObject);
    procedure btnOkEnviClick(Sender: TObject);
    procedure Map1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure lvPlatformClick(Sender: TObject);
    procedure Map1DrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Cardinal; const RectFull,
      RectInvalid: IDispatch);
    procedure Map1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn1Click(Sender: TObject);
    procedure edtCourseKeyPress(Sender: TObject; var Key: Char);
    procedure edtAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure cbbGroundSpeedChange(Sender: TObject);
    procedure btnEditScenarioClick(Sender: TObject);
    procedure lvPlatformCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btnFormationClick(Sender: TObject);
    procedure btnIdentIndexClick(Sender: TObject);
    procedure mniLogistics1Click(Sender: TObject);
    procedure btnLogisticsClick(Sender: TObject);
    procedure btnRuntimePlatformLibrariesClick(Sender: TObject);
    procedure btnMapMode1Click(Sender: TObject);
    procedure cbbThemesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniUserAdministrator1Click(Sender: TObject);
    procedure mniPort2Click(Sender: TObject);
    procedure mniBeach1Click(Sender: TObject);
    procedure mnibay1Click(Sender: TObject);
    procedure Map1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtLongPositionKeyPress(Sender: TObject; var Key: Char);
    procedure btnOverlayClick(Sender: TObject);
    procedure btnBaseClick(Sender: TObject);
    procedure ReportViewer1Click(Sender: TObject);
    procedure Personel1Click(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure Plotting1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure ScrollBar2Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure GameReport1Click(Sender: TObject);
    procedure GameArea2Click(Sender: TObject);
    procedure mniWaypoint1Click(Sender: TObject);
    procedure btnWaypointClick(Sender: TObject);
    procedure lvPlatformSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure EmbarkCapability1Click(Sender: TObject);
    procedure btnDetailEmbarkPlatformClick(Sender: TObject);
    procedure lblHideActivationClick(Sender: TObject);
    procedure lblShowActivationClick(Sender: TObject);
    procedure edtLongPositionDetailKeyPress(Sender: TObject; var Key: Char);
    procedure cbbGroundSpeedDetailChange(Sender: TObject);
    procedure btnAddEmbarkDetailClick(Sender: TObject);
    procedure edtFuelRemainingKeyPress(Sender: TObject; var Key: Char);
    procedure edtLubricantsRemainingKeyPress(Sender: TObject; var Key: Char);
    procedure edtFreshwaterRemainingKeyPress(Sender: TObject; var Key: Char);
    procedure edtWaterRemainingKeyPress(Sender: TObject; var Key: Char);
    procedure edtFoodRemainingKeyPress(Sender: TObject; var Key: Char);
    procedure Label2Click(Sender: TObject);
    procedure Map1MapViewChanged(Sender: TObject);
    procedure btnAirMapClick(Sender: TObject);
    procedure btnLandMapClick(Sender: TObject);
    procedure btnSeaMapClick(Sender: TObject);
    procedure btnTargetClick(Sender: TObject);
    procedure ZoomIn1Click(Sender: TObject);
    procedure ZoomOut1Click(Sender: TObject);
    procedure Normal1Click(Sender: TObject);
    procedure DistanceRuler1Click(Sender: TObject);
    procedure Hand1Click(Sender: TObject);
    procedure Arrow1Click(Sender: TObject);
    procedure Center1Click(Sender: TObject);
    procedure Ruler1Click(Sender: TObject);
    procedure MultiSelect1Click(Sender: TObject);
    procedure TacticalView1Click(Sender: TObject);
    procedure Move1Click(Sender: TObject);
    procedure mniStaticSymbolMode1Click(Sender: TObject);

  private
    { Private declarations }
    FToolSelected  : TStateToolButton;
    FPortSelect : TPortSelect;

    { ImList For Tool Button }
    ImListCenter,
    ImListZoomOut,
    ImListZoomIn,
    ImListArrow,
    ImListHand,
    ImListAirMap,
    ImListLandMap,
    ImListSeaMap,
    ImListRuler,
    ImListMulti,
    ImgListPlatformView, ImgListMove : TImageList;
    FCanvas : TCanvas;

    xPoint, yPoint : single;
    xIntPoint, yIntPoint : integer;
    FCoordPlatformConv : TCoordConverter;

    IsDown, IsInRect : Boolean;
    aRuler : TLineVisual;
    aMoveObj : TLineVisual; //rio
    aWaypointCoor : TPoint;
    aMultiSelect : TRectVisual;
    aTargetVisual : TTargetVisual;
    ListPlatformSelect : TList;
    ptMoveStart, ptMoveEnd, ptStartInit : TPoint;
    RectMulti : TRect;
    PlatformViewMode : Boolean;
    lastPosition, lastPositionButtom : Integer;
    game_envi : TGame_Environment_Definition;

    FModeTag : Byte;

     function FindNearestPlatform(const px, py: double;
      const maxDist: integer): TPlatform_Instance;
     procedure ForceChoose;
     procedure ForceChooseGroup;
     procedure SetEventhandler;
     procedure SetButtonImage;


     procedure SelectShip(aPlat_inst : TPlatform_Instance);

     procedure EnableGuidance(aStat : Boolean);
     procedure ArrangeForm;
     procedure refreshMultiMode;



  public
    { Public declarations }
    isApproximatedClicked: boolean;
    isBasePosition: boolean;
    CurrentCenterX, CurrentCenterY, CurrentZoom : Double;

    index : integer;
    fromDBeditor :boolean;
    FLyrDraw    : CMapXLayer;
    ra: TResource_Allocation;
    isNew : Boolean;

    inFlag : Byte;
    isModeWaypoint : Boolean;
    showWaypoint : Boolean;

    LastArea : string;
    LastZoom : Double;
    LastCenterX, LastCenterY : Double;
    isOk : Boolean;

    GameEnviroDefList : TList; //menampung TGame_Environment_Definition;
    ResourceAllocationList: TList; // menampung TResource_Allocation;
    PlatformInstList : TList; //menampung TPlatform_Instance;
    ScenarioDefinitionList : TList; //TScenario_Definition;
    PlatformActivationList: TList; //TRecPlatform_Activation; (platformInstance.FData.FActivation)

    FListFileMode_Map1 : TStringList;   { To Move Area Definition from .txt file to List }
    FListFileMode_Map2 : TStringList;
    FListFileMode_Map3 : TStringList;

    FListTotalValue : TStringList;

    FList_IDArea_Map1 : TStringList;
    FList_IDArea_Map2 : TStringList;
    FList_IDArea_Map3 : TStringList;

    FList_NameArea_Map1 : TStringList;
    FList_NameArea_Map2 : TStringList;
    FList_NameArea_Map3 : TStringList;

    FListName : TStringList;
    FListFile: TStringList;
    FListID : TStringList;

    DrawBaseEmbark : TDrawBase;

    procedure saveResource;
    procedure ClearAllDataScenario;
    procedure LoadMap(aGeoset: String; aArea: TRecGame_Area_Definition);
    procedure OnClick_ToolButton(sender : TObject);
    procedure SetDefaultMapTool;
    function GetInput(s : string): Boolean;

    function FindMark(const LookingFor: string; var Mark: string): Boolean;
    function GetValue(LookFor, Sentence: string; var Value: string): Boolean;

    function CheckZoomArea(DataArea : string; var ZoomValue: Integer): Boolean;
    function CheckPosArea(DataArea : string; var PosValue: Integer): Boolean;
    function CheckQualifyArea(FListFile :TStringList; OnMap : Integer; var OutputArea : string): string;
    function GetDefaultDef(FListFile: TStringList; OnMap: Integer;
      var FListID: TStringList; var FListName: TStringList; var FArea: string): string;


  end;

const
  ENVI_index = 1;
  RA_index = 2;
//  PI_index = 3;
  SCE_index = 4;

var
  frmAdminMainForm: TfrmAdminMainForm;

implementation

uses
  ufrmSummaryScenario,ufrmAvailableScenario,uResurceAllocationSelect,ufrmAvailableEnvironment,
  ufrmAvailableGameArea, uVehicleSelect, uSatelliteList, ufrmAvailableMotion, ufrmAvailableRadar,
  ufrmAvailableVehicle, ufrmAvailableESM,ufrmAvailableSonar, ufrmAvailableEOD, ufrmAvailableMAD,
  uWeaponSingleList, ufrmAvailableSonobuoy,
  ufrmAvailableResourceAllocation, uSonobuoySelect, ShellAPI, uDBEditSetting,
  ufrmSummaryResourceAllocation, ufrmTorpedoOnBoardPickList, ufrmMineOnBoardPickList, ufrmMissileOnBoardPickList, uSatelliteSelect,
  uDataModuleTTT, uEnvironmentCharacteristicsWindow,
  uSimDBEditor, uInputName, ufrmGroupSelect, uSimMgr_Client,
  uFormationeditor, uDBFormation, ufrmAvailableLogistic, ufrmSummaryLogistic, ufrmOverlayResourceAllocationPickList,
  ufrmRPLResourceAllocationPickList, ufrmBaseResourceAllocationPickList, ufmEmbarkPositionInput, uExerciseArea,
  uLogin, uAdministrator, uPelabuhan, uBeach, uTeluk, ufrmPlottingResourceAllocationPickList,
  uGameReport, uDBAsset_Cubicle, ufrmWaypointResourceAllocationPickList, uGameAreaDefinition, uGeographicalFeatureImport,
  ufmDefaultEmbark,

  //ufrmAvailableVehicle, ufrmAvailableSatellite, ufrmAvailableMotion,

//  ufrmAvailableRadar, ufrmAvailableSonar,ufrmAvailableESM, ufrmAvailableEOD,
//  ufrmAvailableSonobuoy,ufrmAvailableMAD,

  ufrmAvailableMissile, ufrmAvailableTorpedo,ufrmAvailableMine, ufrmAvailableGun,
  ufrmAvailableBomb

//  ufrmAvailableAcousticDecoy, ufrmAvailableAirBubble, ufrmAvailableChaff,
//  ufrmAvailableInfraredDecoy, ufrmAvailableFloatingDecoy, ufrmAvailableSelfDefensiveJammer,
//  ufrmAvailableTowedJammerDecoy, ufrmAvailableRadarNoiseJammer,

//  ufrmAvailableRuntimePlatformLibrary, ufrmAvailablePredifinedPattern,
//  ufrmAvailableRadarActivationIntervals,  ufrmAvailableGrapicalOverlay, ufrmAvailableStudentRoles,
//  ufrmAvailableGameDefaults, ufrmAvailableSNRvsPODCurve
    ;



{$R *.dfm}
//==============================================================================


 procedure ConvLL_To_DMS(LL: Double; var D, M, S: Integer);
  var T: double;
  begin
    LL := abs(LL);
    D := Floor(LL);
    T := (LL - D) * 60;
    M := Floor(T);
    T := (T - M) * 60;
    S := Floor(T);
  end;

function ConvLL_To_Str(LL: Double; cType: Char): string;
  var Dir: char;
    D, M, S: integer;
  begin
    ConvLL_To_DMS(LL, D, M, S);
    Dir := 'W';
    case cType of
      '0':
        if LL < 0 then
          Dir := 'W'
        else
          Dir := 'E';
      '1':
        if LL < 0 then
          Dir := 'S'
        else
          Dir := 'N';
    end;
    Result := IntToStr(Abs(D)) + '° ' + FormatFloat('00', M) + ''' ' + FormatFloat('00', S) + '" ' + Dir;
  end;

function compareByForce(Item1, Item2: Pointer): Integer;   // fungsi ini masih salah, JANGAN DIPAKAI DULU!!!
  var
  platform1, platform2 : TPlatform_Instance;
begin
  // We start by viewing the object pointers as TCustomer objects
  platform1 := TPlatform_Instance(Item1);
   platform1 := TPlatform_Instance(Item1);
  platform2 := TPlatform_Instance(Item2);

  // Now compare by string
  if  (platform1.FData.Force_Designation > platform2.FData.Force_Designation) then
    Result := 1
  else if platform1.FData.Force_Designation = platform2.FData.Force_Designation then
    Result := 0
  else
    Result := -1;
end;

function compareByName(Item1, Item2: Pointer): Integer;  // fungsi ini masih salah, JANGAN DIPAKAI DULU!!!
  var
  platform1, platform2 : TPlatform_Instance;
begin
  // We start by viewing the object pointers as TCustomer objects
  platform1 := TPlatform_Instance(Item1);
  platform2 := TPlatform_Instance(Item2);

  if platform1.FData.Force_Designation = platform2.FData.Force_Designation then
  begin
    if platform1.FData.Instance_Name > platform2.FData.Instance_Name then
     Result := 1
    else if platform1.FData.Instance_Name = platform2.FData.Instance_Name then
     result := 0
    else
      result := -1;
  end
  else
    Result := 1;
end;

//==============================================================================

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure TfrmAdminMainForm.ESM1Click(Sender: TObject);
begin
 frmAvailableESM.ShowModal;
end;

function TfrmAdminMainForm.FindMark(const LookingFor: string;
  var Mark: string): Boolean;
begin
    if LookingFor = 'Area_' then
    Mark := '\X1_'
  else if LookingFor = 'X1_' then
    Mark := '\Y1_'
  else if LookingFor = 'X2_' then
    Mark := '\Y2_'
  else if LookingFor = 'Y1_' then
    Mark := '\X2_'
  else if LookingFor = 'Y2_' then
    Mark := '\InZoom_'
  else if LookingFor = 'InZoom_' then
    Mark := '\OutZoom_'
  else
    Mark := '#';
end;

function TfrmAdminMainForm.GetValue(LookFor, Sentence: string;
  var Value: string): Boolean;
var
  IndexSeparate1, IndexSeparate2, IndexSeparate3 : Integer;
  Marker, FData : string;
  LData : Integer;
begin
  IndexSeparate1 := Pos(LookFor, Sentence);
  if IndexSeparate1 > 0 then
  begin
    FindMark(LookFor, Marker);
    IndexSeparate2 := Pos(Marker, Sentence);
    FData := Copy(Sentence, IndexSeparate1, (IndexSeparate2 - IndexSeparate1));

    LData := Length(FData);
    IndexSeparate3 := Pos('_', FData);
    Value := Copy(FData, IndexSeparate3 + 1, LData);
    Value := Trim(Value);
  end
  else
    Value := '0';

  Result := (Value <> '');
end;

function TfrmAdminMainForm.CheckZoomArea(DataArea: string; var ZoomValue: Integer): Boolean;
var
  FZoomIn, FZoomOut : string;
begin
  LastZoom := Map1.Zoom;

  GetValue('InZoom_', DataArea, FZoomIn);
  GetValue('OutZoom', DataArea, FZoomOut);

  if (LastZoom >= StrToFloat(FZoomIn)) and (LastZoom <= StrToFloat(FZoomOut)) then
    ZoomValue := 1
  else
    ZoomValue := 0;

  Result := (ZoomValue <> 0);
end;

function TfrmAdminMainForm.CheckPosArea(DataArea: string; var PosValue: Integer): Boolean;
var
  FX1, FY1, FX2, FY2, FArea: string;
  CenterMapX, CenterMapY: Double;
begin
  CenterMapX := Map1.CenterX;
  CenterMapY := Map1.CenterY;

  GetValue('X1_', DataArea, FX1);
  GetValue('Y1_', DataArea, FY1);
  GetValue('X2_', DataArea, FX2);
  GetValue('Y2_', DataArea, FY2);

  if (CenterMapX >= StrToFloat(FX1)) and (CenterMapY <= StrToFloat(FY1)) and
    (CenterMapX <= StrToFloat(FX2)) and (CenterMapY >= StrToFloat(FY2)) then
    PosValue := 2
  else
    PosValue := 0;

  Result :=(PosValue <> 0);
end;

function TfrmAdminMainForm.CheckQualifyArea(FListFile : TStringList; OnMap : Integer;
  var OutputArea: string): string;
var
  I, J, FZoomValue, FPosValue, TotalValue : Integer;
  DefaultValue,FArea : string;
begin
  FListTotalValue.Clear;
  DefaultValue := 'Area_Indonesia-Background\X1_91.5837777777778\' +
      'Y1_16.5468333333333\X2_148.513888888889\Y2_-20.7428888888889\InZoom_0.125\OutZoom_8192#';

  if FListFile.Count = 0 then
  begin
    OutputArea := 'Indonesia-Background';
    FListFile.Add(DefaultValue);

    for I := 0 to DefinitionArea.lst_DBGameAreaIdentifier.Count - 1 do
    begin
      if FArea = DefinitionArea.lst_DBGameAreaIdentifier.Items.Strings[I] then
      begin
        FListID.Add(DefinitionArea.lst_DBIdGameArea.Items.Strings[I]);
        FListName.Add(DefinitionArea.lst_DBGameAreaIdentifier.Items.Strings[I]);
        Break;
      end
    else
      Continue;
    end;
      if FListID.Count > 0 then
      begin
        if OnMap = 1 then
          ExerciseAreaForm.inx1 := StrToInt(FListID[0]);
        if OnMap = 2 then
          ExerciseAreaForm.inx2 := StrToInt(FListID[0]);
        if OnMap = 3 then
          ExerciseAreaForm.inx3 := StrToInt(FListID[0]);
      end;
    end
  else
  begin
    for I := 0 to FListFile.Count - 1 do
    begin
      CheckZoomArea(FListFile[I], FZoomValue);
      CheckPosArea(FListFile[I], FPosValue);
      TotalValue := FZoomValue + FPosValue;
      FListTotalValue.Add(IntToStr(TotalValue));
    end;

    for J := 3 downto 0 do
    begin
      if OutputArea = '' then
      begin
        for I := 0 to FListTotalValue.Count - 1 do
        begin
          if FListTotalValue[I] = IntToStr(J) then
          begin
            GetValue('Area_', FListFile[I], OutputArea);
            if OnMap = 1 then
            begin
              if FList_IDArea_Map1.Count > 0 then
                ExerciseAreaForm.inx1 := StrToInt(FList_IDArea_Map1[I]);
            end;
            if OnMap = 2 then
            begin
              if FList_IDArea_Map2.Count > 0 then
                ExerciseAreaForm.inx2 := StrToInt(FList_IDArea_Map2[I]);
            end;
            if OnMap = 3 then
            begin
              if FList_IDArea_Map3.Count > 0 then
                ExerciseAreaForm.inx3 := StrToInt(FList_IDArea_Map3[I]);
            end;
            Break;
          end
          else
            Continue;
        end;
      end
      else
        Break;
    end;
  end;

   FListTotalValue.Clear;
end;

function TfrmAdminMainForm.GetDefaultDef(FListFile: TStringList; OnMap: Integer;
  var FListID: TStringList; var FListName: TStringList; var FArea : string): string;
var
  DirDefault, Area, dirP : string;
  I : Integer;
  MFile : TextFile;
  DefaultValue, FileName, ValueFileName : string;
  Game_Index : Integer;
  SourceCopy, DestCopy : string;
begin
  FListFile.Clear;
  FListID.Clear;
  FListName.Clear;

  FArea := 'Indonesia-Background';

  DefaultValue := 'Area_Indonesia-Background\X1_91.5837777777778\' +
    'Y1_16.5468333333333\X2_148.513888888889\Y2_-20.7428888888889\InZoom_0.125\OutZoom_8192#';

  FListFile.Add(DefaultValue);

//  ValueFileName := 'indonesia-Background\_MAP_OTHER';
//  SourceCopy := vAppDBSetting.MapTypePath +
//    '\_MAP_OTHER\indonesia-Background\indonesia-Background.gst';
//
//  DestCopy := vAppDBSetting.MapGSTGame +
//    '\Indonesia-Background\Indonesia-Background.gst';

  // check default game area

//  dirP := vAppDBSetting.MapGSTGame + '\' + FArea;
//  FileName := dirP + '\' + FArea + '.txt';

//  if DirectoryExists(dirP) = False then
//  begin
//    CreateDir(dirP);
//
//    AssignFile(MFile, FileName);
//    Rewrite(MFile);
//    Writeln(MFile, ValueFileName);
//    CloseFile(MFile);
//  end;

//  dmTTT.GetGame_Area_Def_ByIdentifier(FArea, game_envi);

//  if game_envi.FGameArea.Game_Area_Index = 0 then
//  begin
//    GeographicalFeatureImportForm.GetDataFlag;
//    CopyFile(PChar(SourceCopy), PChar(DestCopy), False);
//
//    with game_envi.FGameArea do
//    begin
//      Game_Area_Identifier := FArea;
//      Game_Centre_Long := Map1.CenterX;
//      Game_Centre_Lat := Map1.CenterY;
//      Game_X_Dimension         := 0;
//      Game_Y_Dimension         := 0;
//      Use_Real_World           := 0;
//      Use_Artificial_Landmass  := 0;
//      Detail_Map               := '';
//    end;
//
//    dmTTT.insertGame_Area_Def(game_envi);
//
//    DefinitionArea.RefreshDef;
//  end;

  for I := 0 to DefinitionArea.lst_DBGameAreaIdentifier.Count - 1 do
  begin
    if FArea = DefinitionArea.lst_DBGameAreaIdentifier.Items.Strings[I] then
    begin
      FListID.Add(DefinitionArea.lst_DBIdGameArea.Items.Strings[I]);
      FListName.Add(DefinitionArea.lst_DBGameAreaIdentifier.Items.Strings[I]);
      Break;
    end
    else
      Continue;
  end;

  if OnMap = 1 then
    ExerciseAreaForm.inx1 := StrToInt(FListID[0]);
  if OnMap = 2 then
    ExerciseAreaForm.inx2 := StrToInt(FListID[0]);
  if OnMap = 3 then
    ExerciseAreaForm.inx3 := StrToInt(FListID[0]);
end;


function TfrmAdminMainForm.FindNearestPlatform(const px, py: double;
  const maxDist: integer): TPlatform_Instance;
var i, c: Integer;
    pi : TPlatform_Instance;
    rr : Integer;
    m, r: double;
    ctx, cty: integer;
    ptx, pty: integer;
begin
  I := 0;

  c := SIMMgr.Platform_Insts.Count;
//  c := fPlatformDeploytment.List.Count;

  //create converter
    FCoordPlatformConv := TCoordConverter.Create;
    //set mapnya
    FCoordPlatformConv.FMap := Map1;


  FCoordPlatformConv.ConvertToScreen(px, py, ctx, cty);
  m := 1000000.0;
  result := nil;


  for i := 0 to SIMMgr.Platform_Insts.Count - 1 do begin

    pi := SIMMgr.Platform_Insts.Items[i];
    FCoordPlatformConv.ConvertToScreen(pi.FActivation.Init_Position_Longitude, pi.FActivation.Init_Position_Latitude, ptx, pty);

    try
	    rr := sqr(ptX - ctx) + sqr(ptY - ctY);
	    if rr <= 0 then
	      r := 10000
	    else
	      r := Sqrt(rr);
    except
      r := 10000;
    end;


    if (r < m) and (r < maxDist) then begin
      m := r;
      result := pi;
    end;
  end;
end;

procedure TfrmAdminMainForm.FloatingDecoy1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 4;
//  fCountermeasureSingle.ShowModal;
end;

procedure TfrmAdminMainForm.ForceChoose;
begin
  if rbRedPlatforms.Checked = true then
    begin
      frmSummaryResourceAllocation.force := 1;
    end
  else if rbAmberPlatforms.Checked = true then
    begin
      frmSummaryResourceAllocation.force := 2;
    end
  else if rbBluePlatforms.Checked = true then
    begin
      frmSummaryResourceAllocation.force :=3;
    end
  else if rbGreenPlatforms.Checked = true then
    begin
      frmSummaryResourceAllocation.force := 4;
    end
  else if rbNoPlatforms.Checked = true then
  begin
    frmSummaryResourceAllocation.force := 5;
  end;
end;

procedure TfrmAdminMainForm.ForceChooseGroup;
begin
//  case rgforce.ItemIndex of
    {0: frmScenario.force := 1;       //red
    1: frmScenario.force := 2;       //yelolow
    2: frmScenario.force := 3;       //blue
    3: frmScenario.force := 4;       //green
    4: frmScenario.force := 5;       //no force
    5: frmScenario.force := 6;       //NTDS   }

//    0: frmSummaryScenario.force := 3;       //blue
//    1: frmSummaryScenario.force := 1;       //red
//    2: frmSummaryScenario.force := 2;       //yelolow
//    3: frmSummaryScenario.force := 4;       //green
//    4: frmSummaryScenario.force := 5;       //no force
    //5: frmScenario.force := 6;       //NTDS

//  end;
end;

procedure TfrmAdminMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearAllDataScenario;
  Application.Terminate;
//  frmLogin.Show;
end;

procedure TfrmAdminMainForm.FormCreate(Sender: TObject);
begin
  game_envi := TGame_Environment_Definition.Create;
  ra := TResource_Allocation.Create;
  SetEventhandler;
  SetButtonImage;
  FCanvas := TCanvas.Create;

  GameEnviroDefList := TList.Create;
  ResourceAllocationList := TList.Create;
  PlatformInstList := TList.Create;
  ScenarioDefinitionList := TList.Create;
  PlatformActivationList := TList.Create;

  FListFileMode_Map1 := TStringList.Create;
  FListFileMode_Map2 := TStringList.Create;
  FListFileMode_Map3 := TStringList.Create;

  FListID := TStringList.Create;
  FListTotalValue := TStringList.Create;
  FListFile:= TStringList.Create;
  FListName := TStringList.Create;

  FList_IDArea_Map1 := TStringList.Create;
  FList_IDArea_Map2 := TStringList.Create;
  FList_IDArea_Map3 := TStringList.Create;

  FList_NameArea_Map1 := TStringList.Create;
  FList_NameArea_Map2 := TStringList.Create;
  FList_NameArea_Map3 := TStringList.Create;

  FCoordPlatformConv := TCoordConverter.Create;
  FCoordPlatformConv.FMap := Map1;

  DrawBaseEmbark := TDrawBase.Create;
  DrawBaseEmbark.Converter := FCoordPlatformConv;

  isNew := true;
  isModeWaypoint := False;
  showWaypoint := False;

  aRuler := TLineVisual.Create;
  aMoveObj := TLineVisual.Create; //rio.
  aMultiSelect := TRectVisual.create;
  aTargetVisual := TTargetVisual.create;
  ListPlatformSelect := TList.Create;

end;

procedure TfrmAdminMainForm.FormDestroy(Sender: TObject);
begin
  ImListCenter.free;
  ImListZoomOut.free;
  ImListZoomIn.free;
  ImListArrow.free;
  ImListHand.free;
  ImListAirMap.Free;
  ImListLandMap.Free;
  ImListSeaMap.Free;
  ImListRuler.Free;
  ListPlatformSelect.Free;
end;

procedure TfrmAdminMainForm.FormShow(Sender: TObject);
var
  aGeoset : string;
begin
  isOk := False;
  DisplayDimensionsinfeet1.Checked := True;
  DisplayDimensionsinmetres1.Checked := False;

//  edtStartTime.Text := formatdatetime('dd/mm/yyyy hh:nn:ss', now);

  dtpDate.Date := Now;
  dtpTime.Time := Now;
  dtpDDay.Date := now;

  {sknmngr1.SkinDirectory := vAppDBSetting.SkinPath;
  cbbThemes.ItemIndex := 15;
  sknmngr1.SkinName := 'WLM'; }

  {nanti dulu}
//  with frmEnvi do
//  begin
//    Hide;
//    Left := 0;
//    Top := 0;
//    BorderStyle := bsNone;
//    ParentColor := True;
//    Parent := pnlEnvi;
//    Align := alNone;
//    Show;
//  end;
//
//  PlatformViewMode := False;
//
//  IsDown := false;
//  IsInRect := False;
//  RectMulti.Left := 0;
//  RectMulti.Top := 0;
//  RectMulti.Right := 0;
//  RectMulti.Bottom := 0;
//
//  cbbPort.ItemIndex := 0;
////  aGeoset := vAppDBSetting.MapDestPathVECT + '\' +'sangata'+'\'+'sangata.gst';
//  aGeoset := vAppDBSetting.MapDefView + '\Indonesia\' +'Indonesia2.gst';
//  dmTTT.GetGame_Area_DefByID(0, ExerciseAreaForm.gameEnv);
//  LoadMap(aGeoset, ExerciseAreaForm.gameEnv.FGameArea);
//  frmAvailableGameArea.flagIsNew := false;
//  if grpSelect.Enabled then
//  begin
//    EnableGuidance(false);
//  end;
//  pnlDetailActivation.Left := 1000;
//
//  ArrangeForm;

end;

procedure TfrmAdminMainForm.ShutdownDatabaseEditor1Click(Sender: TObject);
var warning : Integer;
begin
  warning := MessageDlg('Shutdown Database Editor?',mtWarning,[mbYes,mbNo],0);
  if warning = mrYes then
  begin
    try
      ClearAllDataScenario;
      Application.Terminate;

//      Self.Close;
//      frmLogin.Show;
    finally
//      free;
    end;
  end;
end;

procedure TfrmAdminMainForm.SNRvsPODCurve1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 7;
end;

procedure TfrmAdminMainForm.Sonar1Click(Sender: TObject);
begin
  frmAvailableSonar.ShowModal;
end;

procedure TfrmAdminMainForm.Sonobuoy1Click(Sender: TObject);
begin
  frmAvailableSonobuoy.ShowModal;
end;

procedure TfrmAdminMainForm.Vehicle1Click(Sender: TObject);
begin
  {
   if idRASelected = '' then
   begin
     ShowMessage('No Resource Allocation Selected, Please Select One First');
     Exit;
   end;
   fVehicleSelect.Show;
   }
   frmAvailableVehicle.ShowModal;
end;

procedure TfrmAdminMainForm.x1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 5;
  frmAdminMainForm.fromDBeditor := True;
end;

procedure TfrmAdminMainForm.ZoomIn1Click(Sender: TObject);
begin
  OnClick_ToolButton(btnZoomIn);
end;

procedure TfrmAdminMainForm.ZoomOut1Click(Sender: TObject);
begin
  OnClick_ToolButton(btnZoomOut);
end;

procedure TfrmAdminMainForm.AboutDatabaseEditor1Click(Sender: TObject);
begin
   shellexecute(handle,'open','D:\TTT\help\Vol 6.pdf','','',1);
end;

procedure TfrmAdminMainForm.AcousticDecoy1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 1;
//  fCountermeasureSingle.ShowModal;
end;

procedure TfrmAdminMainForm.TacticalView1Click(Sender: TObject);
begin
  OnClick_ToolButton(btnPlatformView);
end;

procedure TfrmAdminMainForm.AirBubble1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 2;
//  fCountermeasureSingle.ShowModal;
end;

procedure TfrmAdminMainForm.ArrangeForm;
var
  aTotal, aJarakAtas, aJarakTengah : Integer;
begin
  aTotal :=  grpDeployAndFormation.Height + grpPlatforms.Height + grpSce.Height;
  if pnlLeft.Height > aTotal then
  begin
    aJarakAtas := Round((pnlLeft.Height - aTotal) / 6);
    aJarakTengah := Round(((pnlLeft.Height - aTotal) - aJarakAtas) / 3);

    grpDeployAndFormation.top := pnlButtom.Top - grpDeployAndFormation.Height - aJarakTengah;
    grpSelect.Top := grpDeployAndFormation.top;
    grpGroup.Top := grpSelect.Top + grpSelect.Height + 5;

    pnlDetailActivation.Top := grpSelect.Top;

    grpPlatforms.Top := grpDeployAndFormation.top - grpPlatforms.Height - aJarakTengah;
    grpForcePlatforms.Top := grpPlatforms.Top;

    grpSce.Top := grpPlatforms.Top - grpSce.Height - aJarakTengah;
  end
  else
  begin
    ScrollBar1.Visible := True;
    ScrollBar1.Max := (aTotal - pnlLeft.Height) + 40;
    ScrollBar1.Position := 0;
    lastPosition := 0;
  end;

  if 1524 > Monitor.Width then
  begin
    ScrollBar2.Visible := True;
    ScrollBar2.Max := (1524 - Monitor.Width) + 40;
    ScrollBar2.Position := 0;
    lastPositionButtom := 0;
  end;

end;

procedure TfrmAdminMainForm.Arrow1Click(Sender: TObject);
begin
  OnClick_ToolButton(btnArrow);
end;

procedure TfrmAdminMainForm.Bomb1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 5;
  frmAdminMainForm.fromDBeditor := True;
  fWeaponSingle.ShowModal;
end;

procedure TfrmAdminMainForm.btn1Click(Sender: TObject);
begin
  Map1.Repaint;
end;

procedure TfrmAdminMainForm.btn3Click(Sender: TObject);
begin
  ForceChoose;
  fmPlottingResourceAllocationPickList.ShowModal;
end;

procedure TfrmAdminMainForm.btnAddEmbarkDetailClick(Sender: TObject);
begin
  {Panggil form add embark disini}
  frmDefaultEmbark.Show;
end;

procedure TfrmAdminMainForm.btnAirMapClick(Sender: TObject);
begin
  inFlag := 1;
  btnMapMode1.Enabled := True;
  btnMapMode2.Enabled := False;
  btnMapMode3.Enabled := False;
end;

procedure TfrmAdminMainForm.btnBaseClick(Sender: TObject);
var
  aResourceAllocation : TResource_Allocation;
begin
  ForceChoose;
  {if not Isnew then
  begin
    fmEmbarkLibraryPickList.ResId := ResourceAllocationForm.ra_id;

    dmTTT.GetResource_Embark_Library(fmEmbarkLibraryPickList.ResId,
      fmEmbarkLibraryPickList.BaseSelectedList);
  end;}
  if frmBaseResourceAllocationPickList.Showing then
    frmBaseResourceAllocationPickList.Close;

//  fmBaseResourceAllocationPickList.Backup;
  frmBaseResourceAllocationPickList.ShowModal;
end;

procedure TfrmAdminMainForm.btnMapMode1Click(Sender: TObject);
begin
  inFlag := TButton(Sender).Tag;
  DefinitionArea.ShowModal;
end;

procedure TfrmAdminMainForm.btnIdentIndexClick(Sender: TObject);
var
  recPI : TList;
  aPI : TPlatform_Instance;
  i : Integer;
  InstanceIdent : Integer;
begin
  recPI := TList.Create;

  dmTTT.GetPlatformIdentIndex(recPI);
  for I := 0 to recPI.Count - 1 do
  begin
    aPI := TPlatform_Instance(recPI.Items[i]);
    InstanceIdent := dmTTT.GetIdentIndex(aPI);
    dmTTT.UpdateIdentIndex(aPI, InstanceIdent);
  end;

  recPI.Free;
end;

procedure TfrmAdminMainForm.btnLandMapClick(Sender: TObject);
begin
  inFlag := 2;
  btnMapMode1.Enabled := False;
  btnMapMode2.Enabled := True;
  btnMapMode3.Enabled := False;
end;

procedure TfrmAdminMainForm.btnLogisticsClick(Sender: TObject);
var
 aPI : TPlatform_Instance;
begin
  aPI := TPlatform_Instance.Create;
  aPI := TPlatform_Instance(lvPlatform.Selected.Data);
//  frmSummaryLogistic.show_from := fromMain;
//  frmSummaryLogistic.IDPlatformLogistics := aPI.FData.Platform_Instance_Index;
//  frmSummaryLogistic.ClearData;
//  frmSummaryLogistic.getData(aPI.FData.Platform_Instance_Index, aPI.FData.Instance_Name);
  frmSummaryLogistic.ShowModal;
end;

procedure TfrmAdminMainForm.btnCancelClick(Sender: TObject);
var
  aGeoset : string;
begin
  ClearAllDataScenario;
//  Close;
//  fmPlottingResourceAllocationPickList.PlotListOK.Clear;
  aGeoset := vAppDBSetting.MapDefView + '\Indonesia\' +'Indonesia2.gst';
  dmTTT.GetGame_Area_DefByID(0, ExerciseAreaForm.gameEnv);
  LoadMap(aGeoset, ExerciseAreaForm.gameEnv.FGameArea);

  Map1.Repaint;
end;

procedure TfrmAdminMainForm.btnDeployClick(Sender: TObject);   ///Procedure ini sudah tidak digunakan
var
  nameOfMap, ENCGeoset : string;
  i, idPlatInst, IDRA : Integer;
  val: Double;
  val_int: Integer;
  aPlatformInst, aPlatformInstTemp : TPlatform_Instance;
begin

  {game area}
  //>>sudah default ditentukan pada saat pemilihan port
//==============================================================================

  {environment}
  with EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData do
  begin
    if cbbPort.Text = 'sangata' then
    begin
       Game_Area_Index             := 1312; //sudah ditentukan didatabase
       EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Area_Index    := 1312;
    end
    else if cbbPort.Text = 'situbondo'  then
    begin
      Game_Area_Index             := 1316;
      EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Area_Index    := 1316;
    end;

    Game_Enviro_Identifier := edtScenarioName.Text;
//    if TryStrToFloat(frmEnvi.edtWindSpeed.Text,val) then Wind_Speed := val;
//    if TryStrToFloat(frmEnvi.edtWindDirection.Text,val) then Wind_Direction := val;
//    if TryStrToFloat(frmEnvi.edtOceanSpeed.Text,val) then Ocean_Current_Speed := val;
//    if TryStrToFloat(frmEnvi.edtOceanDirection.Text,val) then Ocean_Current_Direction := val;
//
//    if TryStrToFloat(frmEnvi.edtDayVis.Text,val) then Daytime_Visual_Modifier     := val;
//    if TryStrToFloat(frmEnvi.edtNightVis.Text,val) then Nighttime_Visual_Modifier   := val;
//    if TryStrToInt(frmEnvi.edtRainRate.Text,val_int) then Rain_Rate := val_int;
//    if TryStrToInt(frmEnvi.edtSeaState.Text,val_int) then Sea_State := val_int;

  end;
  with SIMMgr do
  begin
    EnvironmentCharacteristicsWindowForm.GameEnviroDef := insertGameEnvironment(EnvironmentCharacteristicsWindowForm.GameEnviroDef);
  end;
//==============================================================================

{resource allocation}

//if new
  with ra.FData do begin
    Allocation_Identifier  := edtScenarioName.Text;
    Game_Enviro_Index      := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Enviro_Index;
    Defaults_Index         := 19; //hardcore dulu
    Role_List_Index        := 104; //hardcore dulu
    Game_Start_Time        := StrToDateTime(edtStartTime.Text);
  end;

  dmTTT.insertResource(ra);

  SIMMgr.Platform_Insts.Clear;
  //input platform
  if Assigned(fInputName.PlatformVecList) then
  begin
    for I := 0 to fInputName.PlatformVecList.Count - 1 do
    begin
      aPlatformInst := TPlatform_Instance(fInputName.PlatformVecList.Items[i]);
      aPlatformInst.FData.Resource_Alloc_Index := ra.FData.Resource_Alloc_Index;
//      dmTTT.insertPlatformInstance(aPlatformInst,1);
      dmTTT.getMaxIDPlatformInstance(idPlatInst);
      aPlatformInst.FData.Platform_Instance_Index := idPlatInst;
      SIMMgr.Platform_Insts.Add(aPlatformInst);
    end;

//    fInputName.PlatformVecList.Clear;
  end;

  dmTTT.GetMaxResource_Allocation(IDRA);
//  frmSummaryScenario.Scenario.FData.Resource_Alloc_Index := IDRA;
//==============================================================================

 //save scenario dulu
//  frmSummaryScenario.Scenario.FData.Scenario_Identifier := edtScenarioName.Text;
//  insertScenario(frmSummaryScenario.scenario);
//  frmSummaryScenario.id_scenario := IntToStr(frmSummaryScenario.scenario.FData.Scenario_Index);
//  frmSummaryScenario.selectedScenario := frmSummaryScenario.scenario.FData.Scenario_Index;
//  frmSummaryScenario.id_resourceAlloc := frmSummaryScenario.scenario.FData.Resource_Alloc_Index;
////==============================================================================
//
//
//  dmTTT.GetScenario(frmSummaryScenario.selectedScenario, frmSummaryScenario.Scenario);
//  dmTTT.GetResourceAlloc(frmSummaryScenario.Scenario.FData.Resource_Alloc_Index, frmSummaryScenario.ResourceAllocation);
//  dmTTT.GetGame_Environment_Definition(frmSummaryScenario.ResourceAllocation.FData.Game_Enviro_Index, frmSummaryScenario.GameEnvi);
//  dmTTT.GetGame_Area_DefByID(frmSummaryScenario.GameEnvi.FData.Game_Area_Index, frmSummaryScenario.GameEnvi);
//  dmTTT.GetAssetDeployment(frmSummaryScenario.selectedScenario, fPlatformDeploytment.Deployment);
//  fPlatformDeploytment.deploy_id := fPlatformDeploytment.Deployment.FData.Deployment_Index;
//  fPlatformDeploytment.ra_id     := frmSummaryScenario.Scenario.FData.Resource_Alloc_Index;
//
//
//
//  nameOfMap := frmSummaryScenario.GameEnvi.FGameArea.Game_Area_Identifier;
//  frmSummaryScenario.widthGameArea := frmSummaryScenario.GameEnvi.FGameArea.Game_X_Dimension;
//  frmSummaryScenario.centreLong :=  frmSummaryScenario.GameEnvi.FGameArea.Game_Centre_Long;
//  frmSummaryScenario.centreLatt := frmSummaryScenario.GameEnvi.FGameArea.Game_Centre_Lat;


  //getAvailablePlatform;

//  fPlatformDeploytment.createGeoset(nameOfMap);
//  uPlatformDeployment.fPlatformDeploytment.setCBScale;
//  uPlatformDeployment.fPlatformDeploytment.cbSetScale.ItemIndex :=
//  uPlatformDeployment.fPlatformDeploytment.cbSetScale.Items.Count - 1;
//  uPlatformDeployment.fPlatformDeploytment.cbSetScaleChange(Sender);
//  uPlatformDeployment.fPlatformDeploytment.cbSetScale.Text :=
//  uPlatformDeployment.fPlatformDeploytment.cbSetScale.Items.Strings[uPlatformDeployment.fPlatformDeploytment.cbSetScale.Items.Count - 1];
//
//
//  fPlatformDeploytment.LoadPlatformInstanceAct;
//  fPlatformDeploytment.ShowModal;

  //=================================
end;

procedure TfrmAdminMainForm.btnDetailEmbarkPlatformClick(Sender: TObject);
begin
  if btnDetailEmbarkPlatform.Caption = 'Show Embark Platform' then
  begin
    pnlDetailActivation.Width := 506;
    btnDetailEmbarkPlatform.Caption := 'Hide Embark Platform';
  end
  else
  begin
    pnlDetailActivation.Width := 232;
    btnDetailEmbarkPlatform.Caption := 'Show Embark Platform';
  end;
end;

procedure TfrmAdminMainForm.btnEditScenarioClick(Sender: TObject);
begin
//  frmEditScenario.showModal;
end;

procedure TfrmAdminMainForm.btnEnviClick(Sender: TObject);
begin
//  pnlEnvi.Visible := True;
  if pnlEnvi.Visible then
    pnlEnvi.Visible := False
  else
    pnlEnvi.Visible := true;
end;

procedure TfrmAdminMainForm.btnFormationClick(Sender: TObject);
begin
  FormationEditorForm.ShowModal;
end;

procedure TfrmAdminMainForm.btnGroupsClick(Sender: TObject);
var
  aGameEnviroDef : TGame_Environment_Definition;
  aResourceAllocation: TResource_Allocation;
  aPlatformInst : TPlatform_Instance;
  aScenarioDefinition : TScenario_Definition;

  i, idPlatInst : Integer;
begin

  {frmScenario.id_scenario := IntToStr(frmScenario.scenario.FData.Scenario_Index);
  frmScenario.selectedScenario := frmScenario.scenario.FData.Scenario_Index;
  frmScenario.id_resourceAlloc := frmScenario.scenario.FData.Resource_Alloc_Index;
//==============================================================================

  dmTTT.GetScenario(frmScenario.selectedScenario, frmScenario.Scenario);
  dmTTT.GetResourceAlloc(frmScenario.Scenario.FData.Resource_Alloc_Index, frmScenario.ResourceAllocation);
  dmTTT.GetGame_Environment_Definition(frmScenario.ResourceAllocation.FData.Game_Enviro_Index, frmScenario.GameEnvi);
  dmTTT.GetGame_Area_DefByID(frmScenario.GameEnvi.FData.Game_Area_Index, frmScenario.GameEnvi);
  dmTTT.GetAssetDeployment(frmScenario.selectedScenario, fPlatformDeploytment.Deployment);
  fPlatformDeploytment.deploy_id := fPlatformDeploytment.Deployment.FData.Deployment_Index;
  fPlatformDeploytment.ra_id     := frmScenario.Scenario.FData.Resource_Alloc_Index;

//  nameOfMap := frmScenario.GameEnvi.FGameArea.Game_Area_Identifier;
  frmScenario.widthGameArea := frmScenario.GameEnvi.FGameArea.Game_X_Dimension;
  frmScenario.centreLong :=  frmScenario.GameEnvi.FGameArea.Game_Centre_Long;
  frmScenario.centreLatt := frmScenario.GameEnvi.FGameArea.Game_Centre_Lat; }

  ForceChooseGroup;
  frmGroupSelect.ShowModal;
end;

procedure TfrmAdminMainForm.btnOKClick(Sender: TObject);
var
  aGameEnviroDef : TGame_Environment_Definition;
  aResourceAllocation: TResource_Allocation;
  rec_rplib: TRuntime_Platform_Library;
  rec_wpLib : TWaypoint_Def;
  rec_tgtlib : TPlatform_Instance;
  aPlatformInst : TPlatform_Instance;
  aScenarioDefinition : TScenario_Definition;
  aCubicle_Group_Assignment, aCubicle_Group_AssignmentTmp : TCubicle_Group_Assignment;
  aFormationDef, aFormationAssign : TFormation;
  aLogistics, aLogisticsTmp : TLogistics;
  aResourceEmbark : TResource_Base_Mapping;

  i, j, idPlatInst, idCubGroup, groupIDMin, val_int, FormationIndexTemp : Integer;
  val: Double;

  aGeoset : string;
  DummyList : TList;

  DeleteID_DeployIndex : Integer;
  DeleteID_RAIndex : integer;
  DeleteID_envIndex : Integer;
  mList, PI_List, PE_List : TList;
  cubicle : TCubicle_Group;
  rec_RA : TResource_Allocation;
begin
  isOk:= True;

  try
  {Cek apakah platform sudah dideploy(asumsi longitude&latitude tidak 0)}
    for i := 0 to PlatformInstList.Count - 1 do
    begin
      if (TPlatform_Instance(PlatformInstList.Items[i]).FActivation.Init_Position_Longitude = 0) and
        (TPlatform_Instance(PlatformInstList.Items[i]).FActivation.Init_Position_Latitude = 0) then
      begin
        ShowMessage(TPlatform_Instance(PlatformInstList.Items[i]).FData.
          Instance_Name + ' not yet deployed');
        Exit;
      end;
    end;
  {game area}
  //sudah default ditentukan pada saat pemilihan port

    DeleteID_DeployIndex := 0;
    DeleteID_RAIndex := 0;
    DeleteID_envIndex := 0;

    if edtScenarioName.Text = '' then
    begin
  //    ShowMessage('invalid scenario name');
      MessageDlg('Invalid scenario name, Please choose another name.',mtError,mbOKCancel,0);
      Exit;
    end;

    if isNew then
    begin
      if dmTTT.CekScenarioNameAlreadyExist(edtScenarioName.Text) then
      begin
        MessageDlg('The name of Scenario is already exist, Please choose another name.',mtError,mbOKCancel,0);
        Exit;
      end;
    end;

  {environment}
    //ambil game envi default dulu
  //  dmTTT.GetGame_Environment_Definition_By_Identifier('Default', EnvironmentCharacteristicsWindowForm.GameEnviroDef);

    with EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData do
    begin
      if FList_IDArea_Map1.Count > 0 then
        Game_Area_Index   := StrToInt(FList_IDArea_Map1[0])
      else
        Game_Area_Index := 1;    // set default game area kosong

      if FList_IDArea_Map2.Count > 0 then
        Game_Area_Index_2 := StrToInt(FList_IDArea_Map2[0])
      else
        Game_Area_Index_2 := 0;

      if FList_IDArea_Map3.Count > 0 then
        Game_Area_Index_3 := StrToInt(FList_IDArea_Map3[0])
      else
        Game_Area_Index_3 := 0;

      Game_Def_1 := edtMapMode1.Text;
      Game_Def_2 := edtMapMode2.Text;
      Game_Def_3 := edtMapMode3.Text;

      Game_Enviro_Identifier := edtScenarioName.Text;
//      if TryStrToFloat(frmEnvi.edtWindSpeed.Text,val) then Wind_Speed := val;
//      if TryStrToFloat(frmEnvi.edtWindDirection.Text,val) then Wind_Direction := val;
//      if TryStrToFloat(frmEnvi.edtOceanSpeed.Text,val) then Ocean_Current_Speed := val;
//      if TryStrToFloat(frmEnvi.edtOceanDirection.Text,val) then Ocean_Current_Direction := val;
//
//      if TryStrToFloat(frmEnvi.edtDayVis.Text,val) then Daytime_Visual_Modifier     := val;
//      if TryStrToFloat(frmEnvi.edtNightVis.Text,val) then Nighttime_Visual_Modifier   := val;
//      if TryStrToInt(frmEnvi.edtRainRate.Text,val_int) then Rain_Rate := val_int;
//      if TryStrToInt(frmEnvi.edtSeaState.Text,val_int) then Sea_State := val_int;
      Atmospheric_Refract_Modifier := 100;

    end;
    with SIMMgr do
    begin
      if Assigned(GameEnviroDefList) then
      begin
        if isNew then
        begin
          GameEnviroDefList.Clear;
          GameEnviroDefList.Add(EnvironmentCharacteristicsWindowForm.GameEnviroDef);
        end
        else
        begin
          with TGame_Environment_Definition(GameEnviroDefList.Items[0]).FData do
          begin
            Game_Def_1 := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Def_1;
            Game_Def_2 := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Def_2;
            Game_Def_3 := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Def_3;
            Game_Area_Index := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index;
            Game_Area_Index_2 := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index_2;
            Game_Area_Index_3 := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index_3;
            Game_Enviro_Identifier := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Enviro_Identifier;
            Wind_Speed := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Wind_Speed;
            Wind_Direction := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Wind_Direction;
            Ocean_Current_Speed := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Ocean_Current_Speed;
            Ocean_Current_Direction := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Ocean_Current_Direction;
            Daytime_Visual_Modifier := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Daytime_Visual_Modifier;
            Nighttime_Visual_Modifier := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Nighttime_Visual_Modifier;
            Rain_Rate := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Rain_Rate;
            Sea_State := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Sea_State;
            Atmospheric_Refract_Modifier := 100;
          end;
        end;
      end;
    end;
  //==============================================================================

  {resource allocation}

    with ra.FData do begin
      Allocation_Identifier  := edtScenarioName.Text;
      Game_Enviro_Index      := ENVI_index; //EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Enviro_Index;
      Defaults_Index         := 19; //hardcore dulu >>indonesia demo 2
      Role_List_Index        := 104; //hardcore dulu  >> SIGMA
      Game_Start_Time        := StrToDateTime(formatdatetime('dd/mm/yyyy', dtpDate.Date)+' '+formatdatetime('hh:nn:ss', dtpTime.Time));
      D_Day                  := StrToDateTime(formatdatetime('dd/mm/yyyy', dtpDDay.Date)+' '+formatdatetime('hh:nn:ss', dtpJamJ.Time));

    end;

    if Assigned(ResourceAllocationList) then
    begin
      if isNew then
      begin
        ResourceAllocationList.Clear;
        ResourceAllocationList.Add(ra);
      end
      else
      begin
        with TResource_Allocation(ResourceAllocationList.Items[0]).FData do
        begin
          Allocation_Identifier := ra.FData.Allocation_Identifier;
          Defaults_Index := ra.FData.Defaults_Index;
          Role_List_Index := ra.FData.Role_List_Index;
          Game_Start_Time := ra.FData.Game_Start_Time;
          D_Day           := ra.FData.D_Day;
        end;
      end;
    end;

   //untuk sata platfotm/vehicle disimpan pada procedure save resource yang dipanggil pada saat save vehicle

  {scenario}
//    frmSummaryScenario.Scenario.FData.Scenario_Identifier := edtScenarioName.Text;
//
//    if Assigned(ScenarioDefinitionList) then
//    begin
//      if isNew then
//      begin
//        ScenarioDefinitionList.Clear;
//        ScenarioDefinitionList.Add(frmSummaryScenario.Scenario);
//      end
//      else
//      begin
//        with TScenario_Definition(ScenarioDefinitionList.Items[0]).FData do
//        begin
//          Scenario_Identifier := frmSummaryScenario.Scenario.FData.Scenario_Identifier;
//        end;
//      end;
//    end;

  //===============INSERT TO DATABASE=============================================
    aGameEnviroDef := TGame_Environment_Definition(GameEnviroDefList.Items[0]);
    if isNew then
      dmTTT.insertGame_Environment_Def(aGameEnviroDef)
    else
      dmTTT.updateGame_Environment_Def(aGameEnviroDef, IntToStr(aGameEnviroDef.FData.Game_Enviro_Index));

    DeleteID_envIndex := aGameEnviroDef.FData.Game_Enviro_Index;

    aResourceAllocation := TResource_Allocation(ResourceAllocationList.Items[0]);
    aResourceAllocation.FData.Game_Enviro_Index := aGameEnviroDef.FData.Game_Enviro_Index;
    if isNew then
      dmTTT.insertResource(aResourceAllocation)
    else
      dmTTT.updateResource(aResourceAllocation, IntToStr(aResourceAllocation.FData.Resource_Alloc_Index));

  //========= OVERLAY ================
    dmTTT.deleteAll_Resource_Overlay_Mapping(IntToStr(aResourceAllocation.FData.Resource_Alloc_Index));
//    for i := 0 to frmOverlayResourceAllocationPickList.ListInScenario.Count - 1 do
//    begin
//      with aResourceAllocation do
//      begin
//        FOverlay.Overlay_Index := TResource_Allocation(frmOverlayResourceAllocationPickList.ListInScenario[i]).FOverlay.Overlay_Index;
//        FResource_Overlay.Force_Designation := TResource_Allocation(frmOverlayResourceAllocationPickList.ListInScenario[i]).FResource_Overlay.Force_Designation;
//      end;
//      dmTTT.insert_Resource_Overlay_Mapping(aResourceAllocation);
//    end;

  //============= PLOTTING ================
    dmTTT.DeleteAll_Resource_Plotting_mapping(IntToStr(aResourceAllocation.FData.Resource_Alloc_Index));
//    for i := 0 to fmPlottingResourceAllocationPickList.PlotListOK.Count - 1 do
//    begin
//      with aResourceAllocation do
//      begin
//        FPlotting.Plotting_Index := TResource_Allocation(fmPlottingResourceAllocationPickList.PlotListOK[i]).FPlotting.Plotting_Index;
//        FPlotting.Plotting_Name := TResource_Allocation(fmPlottingResourceAllocationPickList.PlotListOK[i]).FPlotting.Plotting_Name;
//        FPlotting.Date := TResource_Allocation(fmPlottingResourceAllocationPickList.PlotListOK[i]).FPlotting.Date;
//        FPlotting.Force := TResource_Allocation(fmPlottingResourceAllocationPickList.PlotListOK[i]).FPlotting.Force;
//      end;
//      dmTTT.InsertPlottingMapping(aResourceAllocation);
//    end;
//    fmPlottingResourceAllocationPickList.PlotListOK.Clear;

  //========= RPL ====================
    dmTTT.DeleteAllResource_Library_Mapping(IntToStr(aResourceAllocation.FData.Resource_Alloc_Index));
    rec_rplib := TRuntime_Platform_Library.Create;

//    for I := 0 to frmRPLResourceAllocationPickList.RArplList.Count - 1 do
//    begin
//      rec_rplib := TRuntime_Platform_Library(frmRPLResourceAllocationPickList.RArplList[I]);
//      dmTTT.InsertRuntime_Platform_LibraryByResourceAlloc(IntToStr(aResourceAllocation.FData.Resource_Alloc_Index),rec_rplib);
//    end;

    //add RPL Default >> digunakan untuk multi deploy
    if not (dmTTT.CekRuntimeDefault(aResourceAllocation.FData.Resource_Alloc_Index)) then
    begin
      rec_rplib := TRuntime_Platform_Library.Create;
      DummyList := TList.Create;
      dmTTT.GetRuntime_Platform_Library(1,DummyList,rec_rplib);
      dmTTT.InsertRuntime_Platform_LibraryByResourceAlloc(IntToStr(aResourceAllocation.FData.Resource_Alloc_Index),rec_rplib);
    end;

  //======Waypoint===============================
    dmTTT.DeleteAllResource_Waypoint_Mapping(IntToStr(aResourceAllocation.FData.Resource_Alloc_Index));
    rec_wplib := TWaypoint_Def.Create;

//    for I := 0 to frmWaypointResourceAllocationPickList.RAWaypointList.Count - 1 do
//    begin
//      rec_wplib := TWaypoint_Def(frmWaypointResourceAllocationPickList.RAWaypointList[I]);
//      dmTTT.InsertWaypointByResourceAlloc(IntToStr(aResourceAllocation.FData.Resource_Alloc_Index),rec_wplib );
//    end;





  //====== Platform Instance ======================
    for I := 0 to PlatformInstList.Count - 1 do
    begin
      aPlatformInst := TPlatform_Instance(PlatformInstList.Items[i]);
      aPlatformInst.FData.Resource_Alloc_Index := aResourceAllocation.FData.Resource_Alloc_Index;
      if isNew then
      begin
//        dmTTT.insertPlatformInstance(aPlatformInst,1);
        dmTTT.getMaxIDPlatformInstance(idPlatInst);
//        for j := 0 to frmGroupMemberSelection.CubGroupAssignmentList.Count - 1 do
//        begin
//          aCubicle_Group_AssignmentTmp := TCubicle_Group_Assignment(frmGroupMemberSelection.CubGroupAssignmentList.Items[j]);
//          if aCubicle_Group_AssignmentTmp.FCubicle.Platform_Instance_Index =
//             aPlatformInst.FData.Platform_Instance_Index then
//          begin
//            aCubicle_Group_AssignmentTmp.FCubicle.Platform_Instance_Index := idPlatInst;
//
//            break;
//          end;
//        end;

        for j := 0 to FormationEditorForm.FormationDefList.Count - 1 do    //update platform instance index
        begin
          aformationDef := TFormation(FormationEditorForm.FormationDefList.Items[j]);
          if aformationDef.FFormation_Def.Formation_Leader =
             aPlatformInst.FData.Platform_Instance_Index then
          begin
            aformationDef.FFormation_Def.Formation_Leader := idPlatInst;
            break;
          end;
        end;

        for j := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do     //update platform instance index
        begin
          aFormationAssign := FormationEditorForm.FormationAssignmentList.Items[j];
          if aFormationAssign.FForm_Assign.Platform_Instance_Index =
             aPlatformInst.FData.Platform_Instance_Index then
          begin
            aFormationAssign.FForm_Assign.Platform_Instance_Index := idPlatInst;
          end;
        end;

        {for j := 0 to frmLogistics.LogisticsList.Count - 1 do
        begin
          aLogistics := TLogistics(frmLogistics.LogisticsList.Items[j]);
          if aLogistics.FPlatformLogistics.Platform_Instance_Index =
             aPlatformInst.FData.Platform_Instance_Index then
          begin
            aLogistics.FPlatformLogistics.Platform_Instance_Index := idPlatInst;
          end;
        end; }


//        TSymbolsProp(fPlatformDeploytment.List[i]).Fplatform.FData.Platform_Instance_Index := idPlatInst;
      end
      else
      begin

  //      if aPlatformInst.FData.Platform_Instance_Index < 100 then  //anggapan bahwa tambahanan tidak lebih dari 100  >> ini masih kurang benar
        if not(dmTTT.CekPlatformAlreadyExist(aPlatformInst)) then
        begin
//          dmTTT.insertPlatformInstance(aPlatformInst,1);
          dmTTT.getMaxIDPlatformInstance(idPlatInst);
//          for j := 0 to frmGroupMemberSelection.CubGroupAssignmentList.Count - 1 do
//          begin
//            aCubicle_Group_AssignmentTmp := TCubicle_Group_Assignment(frmGroupMemberSelection.CubGroupAssignmentList.Items[j]);
//            if aCubicle_Group_AssignmentTmp.FCubicle.Platform_Instance_Index =
//               aPlatformInst.FData.Platform_Instance_Index then
//            begin
//              aCubicle_Group_AssignmentTmp.FCubicle.Platform_Instance_Index := idPlatInst;
//              break;
//            end;
//          end;

          for j := 0 to FormationEditorForm.FormationDefList.Count - 1 do    //update platform instance index
          begin
            aformationDef := TFormation(FormationEditorForm.FormationDefList.Items[j]);
            if aformationDef.FFormation_Def.Formation_Leader =
               aPlatformInst.FData.Platform_Instance_Index then
            begin
              aformationDef.FFormation_Def.Formation_Leader := idPlatInst;
              break;
            end;
          end;

          for j := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do     //update platform instance index
          begin
            aFormationAssign := FormationEditorForm.FormationAssignmentList.Items[j];
            if aFormationAssign.FForm_Assign.Platform_Instance_Index =
               aPlatformInst.FData.Platform_Instance_Index then
            begin
              aFormationAssign.FForm_Assign.Platform_Instance_Index := idPlatInst;
            end;
          end;

          {for j := 0 to frmLogistics.LogisticsList.Count - 1 do
          begin
            aLogistics := TLogistics(frmLogistics.LogisticsList.Items[j]);
            if aLogistics.FPlatformLogistics.Platform_Instance_Index =
               aPlatformInst.FData.Platform_Instance_Index then
            begin
              aLogistics.FPlatformLogistics.Platform_Instance_Index := idPlatInst;
            end;
          end;}

//          TSymbolsProp(fPlatformDeploytment.List[i]).Fplatform.FData.Platform_Instance_Index := idPlatInst;
        end
        else
          dmTTT.updatePlatformInst(1, aPlatformInst, IntToStr(aPlatformInst.FData.Platform_Instance_Index));
      end;
    end;

  //==========================-LOGISTICS-================

   { for I := 0 to frmLogistics.LogisticsList.Count - 1 do
    begin
      aLogistics := TLogistics(frmLogistics.LogisticsList.Items[i]);
      if dmTTT.GetPlatform_Logistics(aLogistics.FPlatformLogistics.Platform_Instance_Index, aLogisticsTmp) then
      begin
        dmTTT.UpdatePlatformLogistics(aLogistics);
      end
      else
      begin
       dmTTT.insertPlatformLogistics(aLogistics);
      end;
    end; }

    aScenarioDefinition := TScenario_Definition(ScenarioDefinitionList.Items[0]);
    aScenarioDefinition.FData.Resource_Alloc_Index := aResourceAllocation.FData.Resource_Alloc_Index;
    aScenarioDefinition.FData.Scenario_Code := 0; //sce DBEditor di set 0, sce Voip di set 1
    if isNew then
      insertScenario(aScenarioDefinition)
    else
      updateScenario(aScenarioDefinition,IntToStr(aScenarioDefinition.FData.Scenario_Index));

//    dmTTT.GetAssetDeployment(aScenarioDefinition.FData.Scenario_Index, fPlatformDeploytment.Deployment);

//    frmSummaryScenario.Scenario.FData.Scenario_Index := aScenarioDefinition.FData.Scenario_Index;

//    DeleteID_DeployIndex := fPlatformDeploytment.Deployment.FData.Deployment_Index;
//    DeleteID_RAIndex := aScenarioDefinition.FData.Resource_Alloc_Index;

//    for I := 0 to fPlatformDeploytment.List.Count - 1 do
//    begin
//      if (TSymbolsProp(fPlatformDeploytment.List[I]).x <> 0) AND (TSymbolsProp(fPlatformDeploytment.List[I]).y <> 0) then
//      begin
//        if (TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FActivation.Platform_Event_Index = 0) or (isNew) then
//        begin
//          with TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FActivation do
//          begin
//            Deployment_Index := fPlatformDeploytment.Deployment.FData.Deployment_Index;
//            Platform_Instance_Index := TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FData.Platform_Instance_Index;
//          end;
//          dmTTT.InsertPlatform_Activation(TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform);
//        end
//        else
//        begin
//          dmTTT.updatePlatformAct(TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform,
//                                               TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FActivation.Platform_Event_Index);
//        end;
//      end;
//    end;

    //====== T A R G E T ===============================

    rec_tgtlib := TPlatform_Instance.Create;
    for I := 0 to frmTargetEditor.TargetList.Count - 1 do
    begin
      rec_tgtlib := TPlatform_Instance(frmTargetEditor.TargetList[I]);
      rec_tgtlib.FData.Resource_Alloc_Index := aResourceAllocation.FData.Resource_Alloc_Index;

      if rec_tgtlib.FData.Platform_Instance_Index = 0 then  //berarti baru
      begin
//        dmTTT.insertPlatformInstance(rec_tgtlib,1);
        dmTTT.getMaxIDPlatformInstance(idPlatInst);

//        rec_tgtlib.FActivation.Deployment_Index := fPlatformDeploytment.Deployment.FData.Deployment_Index;
        rec_tgtlib.FActivation.Platform_Instance_Index := idPlatInst;
        dmTTT.InsertPlatform_Activation(rec_tgtlib);
      end
      else
      begin
        dmTTT.updatePlatformInst(1, rec_tgtlib, IntToStr(rec_tgtlib.FData.Platform_Instance_Index));
        dmTTT.updatePlatformAct(rec_tgtlib, rec_tgtlib.FActivation.Platform_Event_Index);
      end;
    end;


  //=====FORMATION===================
    if isNew then
    begin
      for I := 0 to FormationEditorForm.FormationDefList.Count - 1 do
      begin
        aformationDef := TFormation(FormationEditorForm.FormationDefList.Items[i]);
        FormationIndexTemp := aformationDef.FFormation_Def.Formation_Index;
//        aFormationDef.FFormation_Def.Deployment_Index := fPlatformDeploytment.Deployment.FData.Deployment_Index;//update deploy index

        dmTTT.insertFormation_Def(aformationDef);
        for j := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
        begin
          aFormationAssign := FormationEditorForm.FormationAssignmentList.Items[j];
          if aFormationAssign.FForm_Assign.Formation_Index = FormationIndexTemp then
          begin
            aFormationAssign.FForm_Assign.Formation_Index := aformationDef.FFormation_Def.Formation_Index;
            dmTTT.insertFormation_Assign(aFormationAssign);
          end;
        end;
      end;
    end
    else
    begin
      for I := 0 to FormationEditorForm.FormationDefList.Count - 1 do
      begin
        aformationDef := TFormation(FormationEditorForm.FormationDefList.Items[i]);
        FormationIndexTemp := aformationDef.FFormation_Def.Formation_Index;
//        aFormationDef.FFormation_Def.Deployment_Index := fPlatformDeploytment.Deployment.FData.Deployment_Index;//update deploy index

  //      if aFormationDef.FFormation_Def.Formation_Index < 100 then  // anggapan kurang dari 100
        if not (dmTTT.CekFormationAlreadyExist(aFormationDef)) then   //jika belum ada
        begin
          dmTTT.insertFormation_Def(aformationDef);
          for j := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
          begin
            aFormationAssign := FormationEditorForm.FormationAssignmentList.Items[j];
            if aFormationAssign.FForm_Assign.Formation_Index = FormationIndexTemp then
            begin
              aFormationAssign.FForm_Assign.Formation_Index := aformationDef.FFormation_Def.Formation_Index;
              dmTTT.insertFormation_Assign(aFormationAssign);
            end;
          end;
        end
        else
        begin
          dmTTT.updateFormation_Def(aformationDef, IntToStr(aFormationDef.FFormation_Def.Deployment_Index));
          for j := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
          begin
            aFormationAssign := FormationEditorForm.FormationAssignmentList.Items[j];
            if aFormationAssign.FForm_Assign.Formation_Index = FormationIndexTemp then
            begin
              // cek apa sudah ada di formationAssignmen
              if dmTTT.CekMemberAlreadyExist(aFormationAssign) then  //jika sudah ada
              begin
                dmTTT.updateFormation_Assign(aFormationAssign, IntToStr(aFormationAssign.FForm_Assign.Formation_Index),
                  IntToStr(aFormationAssign.FForm_Assign.Platform_Instance_Index));
              end
              else
              begin
                dmTTT.insertFormation_Assign(aFormationAssign);
              end;
            end;
          end;
        end;

      end;

    end;

  //================================


    //====== GROUP =============
    groupIDMin := 0;

//    for I := 0 to frmGroupSelect.CubicleGroupList.Count - 1 do
//    begin
//      aCubicle_Group_Assignment := TCubicle_Group_Assignment(frmGroupSelect.CubicleGroupList.Items[i]);
//      aCubicle_Group_Assignment.Cubicle_Group.FData.Deployment_Index := fPlatformDeploytment.Deployment.FData.Deployment_Index;
//
//  //    if aCubicle_Group_Assignment.Cubicle_Group.FData.Group_Index < 100 then     //cubicle group gak perlu update
//                                                                                   //untuk penambahan cubicle group baru
//      if not(dmTTT.CekCubicleGroupAlreadyExist(aCubicle_Group_Assignment.Cubicle_Group)) then
//      begin
//        dmTTT.insertCubicle_Groups(aCubicle_Group_Assignment.Cubicle_Group);
//
//        dmTTT.getMaxCubicle_Group(idCubGroup);
//
//        if groupIDMin = 0 then          //groupIDMin digunakan sebagai batas awal kondisi insert cubGrbAss new
//          groupIDMin := idCubGroup;
//
//        for j := 0 to fGroupMemberSelection.CubGroupAssignmentList.Count - 1 do   //buat ngisi group index pada Cubicle_Group_Assignment
//        begin
//          aCubicle_Group_AssignmentTmp := TCubicle_Group_Assignment(fGroupMemberSelection.CubGroupAssignmentList.Items[j]);
//          if aCubicle_Group_Assignment.Cubicle_Group.FData.Group_Index =
//             aCubicle_Group_AssignmentTmp.FCubicle.Group_Index then
//          begin
//            aCubicle_Group_AssignmentTmp.FCubicle.Group_Index := idCubGroup;
//          end;
//        end;
//      end
//      else
//      begin
//        dmTTT.updateCubicle_Groups(aCubicle_Group_Assignment.Cubicle_Group, IntToStr(aCubicle_Group_Assignment.Cubicle_Group.FData.Group_Index));
//         //
//      end;
//    end;

//    for i := 0 to frmGroupMemberSelection.CubGroupAssignmentList.Count - 1 do
//    begin
//      if (TCubicle_Group_Assignment(frmGroupMemberSelection.CubGroupAssignmentList.Items[i]).FCubicle.Group_Index >= groupIDMin) and
//         (groupIDMin <> 0) then
//      begin
//        aCubicle_Group_AssignmentTmp := TCubicle_Group_Assignment(frmGroupMemberSelection.CubGroupAssignmentList.Items[i]);
//        aCubicle_Group_AssignmentTmp.FCubicle.Deployment_Index := fPlatformDeploytment.Deployment.FData.Deployment_Index;
//        dmTTT.InsertCubicle_Group_Assignment(aCubicle_Group_AssignmentTmp);
//      end
//      else
//      begin
//        // cek apakah platform sudah ada dalam group
//        aCubicle_Group_AssignmentTmp := TCubicle_Group_Assignment(frmGroupMemberSelection.CubGroupAssignmentList.Items[i]);
//        if not (dmTTT.CekPlatformAlreadyInsertInGroupAssignment(aCubicle_Group_AssignmentTmp)) then // true = sudah terisi, false = belum ada
//        begin
//          aCubicle_Group_AssignmentTmp.FCubicle.Deployment_Index := fPlatformDeploytment.Deployment.FData.Deployment_Index;
//          dmTTT.InsertCubicle_Group_Assignment(aCubicle_Group_AssignmentTmp);
//        end;
//      end;
//    end;
   //========= Embark Library ================
    dmTTT.DeleteAllResource_Embark_Library_Mapping(IntToStr(aResourceAllocation.FData.Resource_Alloc_Index));
//    for i := 0 to fmBaseResourceAllocationPickList.BaseSelectedList.Count - 1 do
//    begin
//
//      aResourceEmbark := TResource_Base_Mapping(fmBaseResourceAllocationPickList.BaseSelectedList[i]);
//      dmTTT.InsertResource_Embark_Library(IntToStr(aResourceAllocation.FData.Resource_Alloc_Index),aResourceEmbark);
//    end;

    ShowMessage('Scenario has been saved');

  except

    on E : Exception do
    begin
      if isNew then
      begin
        //================delete scenario============================
        if DeleteID_DeployIndex <> 0 then
        begin
          mList := TList.Create;
          cubicle := TCubicle_Group.Create;
          dmTTT.getAllCubicle_Groups(DeleteID_DeployIndex, 0, mList, cubicle);
          for I := 0 to MList.Count - 1 do
          begin
            dmTTT.deleteCubicle_Group(IntToStr(TCubicle_Group(mList[I]).FData.Group_Index));
          end;
          mList.Clear;
          dmTTT.deleteAllLink_Part(IntToStr(DeleteID_DeployIndex));
          dmTTT.deleteAllLink_Def(IntToStr(DeleteID_DeployIndex));
          dmTTT.getFormationDefinition(DeleteID_DeployIndex, mList);
          for I := 0 to mList.Count - 1 do
          begin
            dmTTT.deleteAllFormation_Assign(IntToStr(TFormation(mList[I]).FFormation_Def.Formation_Index));
            dmTTT.deleteFormation_Def(IntToStr(TFormation(mList[I]).FFormation_Def.Formation_Index));
          end;
          dmTTT.deletePlatformActivationByDeploy(IntToStr(DeleteID_DeployIndex));
          dmTTT.DeleteAsset_Deployment_Definition(IntToStr(DeleteID_DeployIndex));
          dmTTT.DeleteScenario_Definition(IntToStr(DeleteID_DeployIndex));
        end;

        //================Delete Resource Allocation=====================
        if DeleteID_RAIndex <> 0 then
        begin
          PI_List := TList.Create;
          dmTTT.getAllPlatFormInstance(DeleteID_RAIndex,PI_List);
          for I := 0 to PI_List.Count - 1 do
          begin
            with TPlatform_Instance(PI_List[I]).FData do begin
              dmTTT.DeleteFormationDefinition_ByLeader(IntToStr(Platform_Instance_Index));
              dmTTT.deleteFormation_AssignByPI_Index(IntToStr(Platform_Instance_Index));
              dmTTT.DeleteCubicle_Group_Assignment(Platform_Instance_Index);
              dmTTT.deletePlatform_ActivationByIndex(IntToStr(Platform_Instance_Index));
//              dmTTT.deletePlatformInstance(IntToStr(Platform_Instance_Index));
              dmTTT.deletePlatformLogistics(Platform_Instance_Index);
            end;
          end;
          dmTTT.DeleteAllResource_Library_Mapping(IntToStr(DeleteID_RAIndex));
          dmTTT.DeleteAllReference_Point(IntToStr(DeleteID_RAIndex));
          dmTTT.DeleteAllResource_Pattern_Mapping(IntToStr(DeleteID_RAIndex));
          dmTTT.deleteAll_Resource_Overlay_Mapping(IntToStr(DeleteID_RAIndex));
          dmTTT.DeleteAllResource_Interval_List_Mapping(IntToStr(DeleteID_RAIndex));
          dmTTT.DeleteAllExternal_Communication_Channel(IntToStr(DeleteID_RAIndex));
          dmTTT.updateScenario_ByRA('1',IntToStr(DeleteID_RAIndex));
          dmTTT.DeleteResource_Allocation(IntToStr(DeleteID_RAIndex));
          dmTTT.DeleteAllResource_Embark_Library_Mapping(IntToStr(DeleteID_RAIndex));
        end;

        //========Delete Envi=======================
        if DeleteID_envIndex <> 0 then
        begin
          PE_List := TList.Create;
          dmTTT.GetResourceAllocation_ByEnvi(DeleteID_envIndex,PE_List);
          for I := 0 to PE_List.Count - 1 do   //jika ada envi yang digunakan pada resourceAllocation, maka envi resource diganti default(Game_Enviro_Index := 1)
          begin
            rec_RA := TResource_Allocation.Create;
            rec_RA := TResource_Allocation(PE_List[I]);
            rec_RA.FData.Game_Enviro_Index := 1;
            dmTTT.updateResource(rec_RA,IntToStr(rec_RA.FData.Resource_Alloc_Index));
          end;
          PE_List.Clear;
          dmTTT.deleteGame_Environment_Def(DeleteID_envIndex);
        end;
      end;

      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  end;

  ClearAllDataScenario;
//
  aGeoset := vAppDBSetting.MapDefView + '\Indonesia\' +'Indonesia2.gst';
//  aGeoset := vAppDBSetting.MapGSTGame + '\STBD\' + 'STBD.gst';
  dmTTT.GetGame_Area_DefByID(0, ExerciseAreaForm.gameEnv);
  LoadMap(aGeoset, ExerciseAreaForm.gameEnv.FGameArea);

  Map1.Repaint;
end;

procedure TfrmAdminMainForm.ClearAllDataScenario;
begin
  isNew := True; //kembali pada kondisi awal
  fInputName.PlatformVecList.Clear;
  SIMMgr.Platform_Insts.Clear;
  GameEnviroDefList.Clear;
  ResourceAllocationList.Clear;
  PlatformInstList.Clear;
  fInputName.PlatformVecList.Clear;
  SIMMgr.Platform_Insts.Clear;
  ScenarioDefinitionList.Clear;
//  fPlatformDeploytment.List.Clear;
//  frmSummaryLogistic.LogisticsList.Clear;
  frmSummaryResourceAllocation.ra_id := 0;
//  frmRPLResourceAllocationPickList.RArplList.Clear;
//  frmOverlayResourceAllocationPickList.ListInScenario.Clear;
//  fmBaseResourceAllocationPickList.BaseSelectedList.Clear;
//  fmBaseResourceAllocationPickList.PersonelSelected.Clear;

  //================ clear form =============

  edtScenarioName.Text := '';
//  edtStartTime.Text := formatdatetime('dd/mm/yyyy hh:nn:ss', now);
  dtpDate.Date := now;
  dtpDDay.Date := now;
  dtpTime.Time := now;
  lvPlatform.Clear;

  edtMapMode1.Text := '';
  edtMapMode2.Text := '';
  edtMapMode3.Text := '';
  ExerciseAreaForm.gameEnv := TGame_Environment_Definition.Create;

  EnvironmentCharacteristicsWindowForm.GameEnviroDef := TGame_Environment_Definition.Create;
  ExerciseAreaForm.inx1 := 0;
  ExerciseAreaForm.inx2 := 0;
  ExerciseAreaForm.inx3 := 0;

  EnableGuidance(false);

  //============clear formation==============
  if Assigned(FormationEditorForm.FormationDefList) then
    FormationEditorForm.FormationDefList.Clear ;

  if Assigned(FormationEditorForm.FormationAssignmentList) then
    FormationEditorForm.FormationAssignmentList.Clear;


  //============= clear group ==========
//  frmGroupSelect.CubicleGroupList.Clear;
//  frmGroupMemberSelection.CubGroupAssignmentList.Clear;

  frmTargetEditor.TargetList.Clear;

  {
  fInputName.PlatformVecList.free;
  SIMMgr.Platform_Insts.free;
  GameEnviroDefList.free;
  ResourceAllocationList.free;
  PlatformInstList.free;
  fInputName.PlatformVecList.free;
  SIMMgr.Platform_Insts.free;
  ScenarioDefinitionList.free;
  fPlatformDeploytment.List.free;
  FormationEditorForm.FormationDefList.Free ;
  FormationEditorForm.FormationAssignmentList.Free;
  fGroupMemberSelection.CubGroupAssignmentList.Free;  }

  isApproximatedClicked := False;
  pnlDetailActivation.Left := 1000;
  Map1.MousePointer := miDefaultCursor;
  SetDefaultMapTool;
end;



procedure TfrmAdminMainForm.btnOkEnviClick(Sender: TObject);
begin
  pnlEnvi.Visible := False;
end;

procedure TfrmAdminMainForm.btnOverlayClick(Sender: TObject);
begin
  ForceChoose;
  frmOverlayResourceAllocationPickList.ShowModal;
end;

procedure TfrmAdminMainForm.btnRuntimePlatformLibrariesClick(Sender: TObject);
begin
  frmRPLResourceAllocationPickList.ShowModal;
end;

procedure TfrmAdminMainForm.btnSeaMapClick(Sender: TObject);
begin
  inFlag := 3;
  btnMapMode1.Enabled := False;
  btnMapMode2.Enabled := False;
  btnMapMode3.Enabled := True;
end;

procedure TfrmAdminMainForm.btnTargetClick(Sender: TObject);
begin
  frmTargetEditor.Show;
end;

procedure TfrmAdminMainForm.btnVehicleClick(Sender: TObject);

begin
  ForceChoose;
  fVehicleSelect.id_form := fromRA;

  if not isNew then
  begin
    frmSummaryResourceAllocation.ra := TResource_Allocation(ResourceAllocationList.Items[0]);
  end;

  fVehicleSelect.ShowModal;
end;

procedure TfrmAdminMainForm.btnWaypointClick(Sender: TObject);
begin
  frmWaypointResourceAllocationPickList.ShowModal;
end;

procedure TfrmAdminMainForm.cbbGroundSpeedChange(Sender: TObject);
begin
//  TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Ground_Speed := cbbGroundSpeed.ItemIndex;
  cbbGroundSpeedDetail.ItemIndex := cbbGroundSpeed.ItemIndex;
end;

procedure TfrmAdminMainForm.cbbGroundSpeedDetailChange(Sender: TObject);
begin
//  TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Ground_Speed := cbbGroundSpeedDetail.ItemIndex;
  cbbGroundSpeed.ItemIndex := cbbGroundSpeedDetail.ItemIndex;
end;

procedure TfrmAdminMainForm.cbbPortChange(Sender: TObject);
var
    aGeoset : string;
begin
//  if cbbPort.Text = 'Sangatta Vector' then
//  begin
//    aGeoset := vAppDBSetting.MapDestPathVECT + '\' +'sangata'+'\'+'sangata.gst';
//    LoadMap(aGeoset, sSangattaVector);
//    fGameAreaList.flagIsNew := false;
//  end
//  else if cbbPort.Text = 'Situbondo Vector' then
//  begin
//    aGeoset := vAppDBSetting.MapDestPathVECT + '\' +'situbondo'+'\'+'situbondo.gst';
//    LoadMap(aGeoset, sSitubondoVector);
//    fGameAreaList.flagIsNew := false;
//  end
//  else if cbbPort.Text = 'Sangatta ENC' then
//  begin
//    {aGeoset := vAppDBSetting.MapDestPathENC + '\'+'ASSANGATTA.gst';
//    LoadMap(aGeoset, sSangattaENC);
//    fGameAreaList.flagIsNew := false; }
//    aGeoset := vAppDBSetting.MapDestPathENC + '\'+'SelatMakasar.gst';
//    LoadMap(aGeoset, sSangattaENC);
//    fGameAreaList.flagIsNew := false;
//  end
//  else if cbbPort.Text = 'Situbondo ENC' then
//  begin
//    aGeoset := vAppDBSetting.MapDestPathENC + '\'+'ASSTBD.gst';
//    LoadMap(aGeoset, sSitubondoENC);
//    fGameAreaList.flagIsNew := false;
//  end
//  else
//  begin
//    aGeoset := vAppDBSetting.MapDestPathENC + '\'+'JawaBali.gst';
//    LoadMap(aGeoset, sOtherPort);
//    fGameAreaList.flagIsNew := false;
//  end;

end;

procedure TfrmAdminMainForm.cbbThemesChange(Sender: TObject);
begin
  //sknmngr1.SkinName := cbbThemes.Text;
end;

procedure TfrmAdminMainForm.Center1Click(Sender: TObject);
begin
  OnClick_ToolButton(btnCenter);
end;

procedure TfrmAdminMainForm.Chaff1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 3;
//  fCountermeasureSingle.ShowModal;
end;

procedure TfrmAdminMainForm.DisplayDimensionsinfeet1Click(Sender: TObject);
begin
  DisplayDimensionsinfeet1.Checked := True;
  DisplayDimensionsinmetres1.Checked := False;
end;

procedure TfrmAdminMainForm.DisplayDimensionsinmetres1Click(Sender: TObject);
begin
  DisplayDimensionsinfeet1.Checked := False;
  DisplayDimensionsinmetres1.Checked := True;
end;

procedure TfrmAdminMainForm.DistanceRuler1Click(Sender: TObject);
begin
  OnClick_ToolButton(btnRuler);
end;

procedure TfrmAdminMainForm.edtAltitudeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetInput(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if key = #13 then
  begin
//    TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Altitude :=
//    StrToFloat((Sender as TEdit).Text);
//    edtAltitude.Text := FormatFloat('0.00', TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Altitude);
//    edtAltitudeDetail.Text := FormatFloat('0.00', TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Altitude);
  end;
end;

procedure TfrmAdminMainForm.edtCourseKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
//  aObj : TSymbolsProp;
begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetInput(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if key = #13 then
  begin
//    if Map1.CurrentTool = TOOL_MULTISELECT then
//    begin
//      if Assigned(ListPlatformSelect) then
//      begin
//        for I := 0 to ListPlatformSelect.Count - 1 do
//        begin
//          aObj := TSymbolsProp(ListPlatformSelect.Items[i]);
//          aObj.Fplatform.FActivation.Init_Course := StrToFloat((Sender as TEdit).Text);
//        end;
//      end;
//      edtCourse.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Course);
//      edtCourseDetail.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Course);
//    end
//    else
//    begin
//      TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Course :=
//      StrToFloat((Sender as TEdit).Text);
//      edtCourse.Text := FormatFloat('0.00', TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Course);
//      edtCourseDetail.Text := FormatFloat('0.00', TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Course);
//    end;
//    Map1.Repaint;
  end;
end;

procedure TfrmAdminMainForm.edtLubricantsRemainingKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
//  aObj : TSymbolsProp;
  logValue : Double;

begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetInput(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if key = #13 then
  begin
    logValue := StrToFloat((Sender as TEdit).Text);

    if Map1.CurrentTool = TOOL_MULTISELECT then
    begin
      if Assigned(ListPlatformSelect) then
      begin
        for I := 0 to ListPlatformSelect.Count - 1 do
        begin
//          aObj := TSymbolsProp(ListPlatformSelect.Items[i]);
//
//          if (logValue > aObj.Fplatform.Logistic.FData.ML) then
//            logValue := aObj.Fplatform.Logistic.FData.ML;
//
//          aObj.Fplatform.FActivation.Init_Lubricants := logValue;
        end;
      end;
//      edtLubricantsRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Lubricants);
    end
    else
    begin
//      aObj := TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]);

//      if (logValue > aObj.Fplatform.Logistic.FData.ML) then
//        logValue := aObj.Fplatform.Logistic.FData.ML;
//
//      aObj.Fplatform.FActivation.Init_Lubricants := logValue;
//      edtLubricantsRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Lubricants);
    end;
  end;
end;

procedure TfrmAdminMainForm.edtWaterRemainingKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
//  aObj : TSymbolsProp;
  logValue : Double;

begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetInput(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if key = #13 then
  begin
    logValue := StrToFloat((Sender as TEdit).Text);

    if Map1.CurrentTool = TOOL_MULTISELECT then
    begin
      if Assigned(ListPlatformSelect) then
      begin
        for I := 0 to ListPlatformSelect.Count - 1 do
        begin
//          aObj := TSymbolsProp(ListPlatformSelect.Items[i]);
//
//          if (logValue > aObj.Fplatform.Logistic.FData.Water) then
//            logValue := aObj.Fplatform.Logistic.FData.Water;
//
//          aObj.Fplatform.FActivation.Init_Water := logValue;
        end;
//        edtWaterRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Water);
      end
    end
    else
    begin
//      aObj := TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]);
//
//      if (logValue > aObj.Fplatform.Logistic.FData.Water) then
//        logValue := aObj.Fplatform.Logistic.FData.Water;
//
//      aObj.Fplatform.FActivation.Init_Water := logValue;
//      edtWaterRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Water);
    end;
  end;
end;

procedure TfrmAdminMainForm.edtFoodRemainingKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
//  aObj : TSymbolsProp;
  logValue : Double;

begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetInput(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if key = #13 then
  begin
    logValue := StrToFloat((Sender as TEdit).Text);

    if Map1.CurrentTool = TOOL_MULTISELECT then
    begin
      if Assigned(ListPlatformSelect) then
      begin
        for I := 0 to ListPlatformSelect.Count - 1 do
        begin
//          aObj := TSymbolsProp(ListPlatformSelect.Items[i]);
//
//          if (logValue > aObj.Fplatform.Logistic.FData.Food) then
//            logValue := aObj.Fplatform.Logistic.FData.Food;
//
//          aObj.Fplatform.FActivation.Init_Food := logValue;
        end;
//        edtFoodRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Food);
      end
    end
    else
    begin
//      aObj := TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]);
//
//      if (logValue > aObj.Fplatform.Logistic.FData.Food) then
//        logValue := aObj.Fplatform.Logistic.FData.Food;
//
//      aObj.Fplatform.FActivation.Init_Food := logValue;
//      edtFoodRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Food);
    end;
  end;
end;

procedure TfrmAdminMainForm.edtFreshwaterRemainingKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
//  aObj : TSymbolsProp;
  logValue : Double;

begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetInput(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if key = #13 then
  begin
    logValue := StrToFloat((Sender as TEdit).Text);

    if Map1.CurrentTool = TOOL_MULTISELECT then
    begin
      if Assigned(ListPlatformSelect) then
      begin
        for I := 0 to ListPlatformSelect.Count - 1 do
        begin
//          aObj := TSymbolsProp(ListPlatformSelect.Items[i]);
//
//          if (logValue > aObj.Fplatform.Logistic.FData.AT) then
//            logValue := aObj.Fplatform.Logistic.FData.AT;
//
//          aObj.Fplatform.FActivation.Init_Freshwater := logValue;
        end;
//        edtFreshwaterRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Freshwater);
      end
    end
    else
    begin
//      aObj := TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]);
//
//      if (logValue > aObj.Fplatform.Logistic.FData.AT) then
//        logValue := aObj.Fplatform.Logistic.FData.AT;
//
//      aObj.Fplatform.FActivation.Init_Freshwater := logValue;
//      edtFreshwaterRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Freshwater);
    end;
  end;
end;

procedure TfrmAdminMainForm.edtFuelRemainingKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
//  aObj : TSymbolsProp;
  logValue : Double;

begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetInput(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if key = #13 then
  begin
    logValue := StrToFloat((Sender as TEdit).Text);

    if Map1.CurrentTool = TOOL_MULTISELECT then
    begin
      if Assigned(ListPlatformSelect) then
      begin
        for I := 0 to ListPlatformSelect.Count - 1 do
        begin
//          aObj := TSymbolsProp(ListPlatformSelect.Items[i]);
//
//          if logValue > aObj.Fplatform.Motion.FData.Max_Fuel_Capacity then
//            logValue := aObj.Fplatform.Motion.FData.Max_Fuel_Capacity;
//
//          aObj.Fplatform.FActivation.Init_Fuel := logValue;
        end;
      end;
//      edtFuelRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Fuel);
    end
    else
    begin
//      aObj := TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]);
//
//      if (logValue > aObj.Fplatform.Motion.FData.Max_Fuel_Capacity) then
//        logValue := aObj.Fplatform.Motion.FData.Max_Fuel_Capacity;
//
//      aObj.Fplatform.FActivation.Init_Fuel := logValue;
//      edtFuelRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Fuel);
    end;
  end;
end;

procedure TfrmAdminMainForm.edtLongPositionDetailKeyPress(Sender: TObject; var Key: Char);
var
  lat, long : double;
  X, Y : Integer;
begin
  if key = #13 then
  begin
    if (isApproximatedClicked) then
    begin
      //create converter
      FCoordPlatformConv := TCoordConverter.Create;
      //set mapnya
      FCoordPlatformConv.FMap := Map1;
      try
        long := dmsToLong(edtLongPositionDetail.Text);
        lat := dmsToLatt(edtLatPositionDetail.Text);

        edtLongPosition.Text := edtLongPositionDetail.Text;
        edtLatPosition.Text := edtLatPositionDetail.Text;

        FCoordPlatformConv.ConvertToScreen(long, lat, x, y);

//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).x := long;
//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).y := lat;
//
//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Latitude := lat;
//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Longitude := long;
//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Cartesian_X := X;
//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Cartesian_Y := Y;
        Map1.Repaint;
      except
        on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;

    end;
  end;
end;

procedure TfrmAdminMainForm.edtLongPositionKeyPress(Sender: TObject; var Key: Char);
var
  lat, long : double;
  X, Y : Integer;
begin
  if key = #13 then
  begin
    if (isApproximatedClicked) then
    begin
      //create converter
      FCoordPlatformConv := TCoordConverter.Create;
      //set mapnya
      FCoordPlatformConv.FMap := Map1;
      try
        long := dmsToLong(edtLongPosition.Text);
        lat := dmsToLatt(edtLatPosition.Text);

        edtLongPositionDetail.Text := edtLongPosition.Text;
        edtLatPositionDetail.Text := edtLatPosition.Text;

        FCoordPlatformConv.ConvertToScreen(long, lat, x, y);

//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).x := long;
//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).y := lat;
//
//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Latitude := lat;
//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Longitude := long;
//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Cartesian_X := X;
//        TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Cartesian_Y := Y;
        Map1.Repaint;
      except
        on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;

    end;
  end;
end;

procedure TfrmAdminMainForm.ElectroOpticalDetector1Click(Sender: TObject);
begin
  frmAvailableEOD.ShowModal;
end;

procedure TfrmAdminMainForm.Environment1Click(Sender: TObject);
begin
  frmAvailableEnvironment.ShowModal;
end;

procedure TfrmAdminMainForm.GameArea1Click(Sender: TObject);
begin
  frmAvailableGameArea.ShowModal;
end;

procedure TfrmAdminMainForm.GameArea2Click(Sender: TObject);
begin
  inFlag := TButton(Sender).Tag;
  frmAvailableGameArea.ShowModal;
end;

procedure TfrmAdminMainForm.GameDefaults1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 6;
  frmAdminMainForm.fromDBeditor := True;
end;

procedure TfrmAdminMainForm.GameReport1Click(Sender: TObject);
begin
  frmGameReport.Show;
end;

function TfrmAdminMainForm.GetInput(s: string): Boolean;
var
  a, i : Integer;
begin
  Result := False;
  a := 0;

  for i := 1 to length(s) do
  begin
    if s[i] = '.' then
      a := a + 1;
  end;

  if a > 0 then
    Result := True;
end;

procedure TfrmAdminMainForm.GraphicalOverlays1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 4;
end;

procedure TfrmAdminMainForm.Gun1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 4;
  frmAdminMainForm.fromDBeditor := True;
  fWeaponSingle.ShowModal;
end;

procedure TfrmAdminMainForm.Hand1Click(Sender: TObject);
begin
  OnClick_ToolButton(btnHand);
end;

procedure TfrmAdminMainForm.InfraredDecoy1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 8;
//  fCountermeasureSingle.ShowModal;
end;

procedure TfrmAdminMainForm.Label2Click(Sender: TObject);
//var
//  aObj : TSymbolsProp;
begin
//  aObj := TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]);
//
//  dmTTT.GetMotion_Characteristics(aObj.Fplatform.Vehicle.FData.Motion_Characteristics, aObj.Fplatform.Motion);
//
//  if aObj.Fplatform.Motion.FData.Endurance_Type <> 0  then
//  begin
//    aObj.Fplatform.FActivation.Init_Fuel := aObj.Fplatform.Motion.FData.Max_Fuel_Capacity;
//    edtFuelRemaining.Text := 'Unlimited';
//  end
//  else
//  begin
//    aObj.Fplatform.FActivation.Init_Fuel := aObj.Fplatform.Motion.FData.Max_Fuel_Capacity;
//    edtFuelRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Fuel);
//  end;
//
//  aObj.Fplatform.FActivation.Init_Lubricants := aObj.Fplatform.Logistic.FData.ML;
//  edtLubricantsRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Lubricants);
//
//  aObj.Fplatform.FActivation.Init_Freshwater := aObj.Fplatform.Logistic.FData.AT;
//  edtFreshwaterRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Freshwater);
//
//  aObj.Fplatform.FActivation.Init_Water := aObj.Fplatform.Logistic.FData.Water;
//  edtWaterRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Water);
//
//  aObj.Fplatform.FActivation.Init_Food := aObj.Fplatform.Logistic.FData.Food;
//  edtFoodRemaining.Text := FormatFloat('0.00', aObj.Fplatform.FActivation.Init_Food);
end;

procedure TfrmAdminMainForm.lblHideActivationClick(Sender: TObject);
begin
  pnlDetailActivation.Left := 1000;
end;

procedure TfrmAdminMainForm.lblShowActivationClick(Sender: TObject);
begin
  pnlDetailActivation.Left := 7;
  pnlDetailActivation.Width := 232;
  btnDetailEmbarkPlatform.Caption := 'Show Embark Platform';
end;

procedure TfrmAdminMainForm.EnableGuidance(aStat : Boolean);
var
  i : Integer;
  ChildControl: TControl;
begin
  if aStat then
  begin
    grpSelect.Enabled := True;
    for I := 0 to grpSelect.ControlCount  - 1 do
    begin
      ChildControl:= grpSelect.Controls[I];
      ChildControl.Enabled := true;
    end;

    {Details...}
    GroupBox1.Enabled := True;
    GroupBox2.Enabled := True;

    for I := 0 to GroupBox1.ControlCount  - 1 do
    begin
      ChildControl:= GroupBox1.Controls[I];
      ChildControl.Enabled := true;
    end;

    for I := 0 to GroupBox2.ControlCount  - 1 do
    begin
      ChildControl:= GroupBox2.Controls[I];
      ChildControl.Enabled := true;
    end;
  end
  else
  begin
    lblPlatformName.Caption := 'No Ship Selected';
    edtLatPosition.Text := formatDMS_latt(0);
    edtLongPosition.Text := formatDMS_long(0);
    edtCourse.Text := FormatFloat('0.00', 0);
    edtAltitude.Text :=FormatFloat('0.00', 0);
    edtAltitude.Enabled := False;
    lbl16.Caption := 'Altitude/Depth';

    for I := 0 to grpSelect.ControlCount  - 1 do
    begin
      ChildControl:= grpSelect.Controls[I];
      ChildControl.Enabled := false;
    end;
    grpSelect.Enabled := False;

    {Details...}
    lblPlatformNameDetail.Caption := 'No Ship Selected';
    edtLatPositionDetail.Text := formatDMS_latt(0);
    edtLongPositionDetail.Text := formatDMS_long(0);
    edtCourseDetail.Text := FormatFloat('0.00', 0);
    edtAltitudeDetail.Text :=FormatFloat('0.00', 0);
    edtAltitudeDetail.Enabled := False;
    Label32.Caption := 'Altitude/Depth';

    for I := 0 to GroupBox1.ControlCount  - 1 do
    begin
      ChildControl:= GroupBox1.Controls[I];
      ChildControl.Enabled := false;
    end;

    for I := 0 to GroupBox1.ControlCount  - 1 do
    begin
      ChildControl:= GroupBox1.Controls[I];
      ChildControl.Enabled := false;
    end;
    GroupBox1.Enabled := False;
    GroupBox2.Enabled := False;
  end;

end;

procedure TfrmAdminMainForm.LoadMap(aGeoset: String; aArea: TRecGame_Area_Definition);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if Map1 = nil then
    Exit;
  InitOleVariant(z);
  Map1.Layers.RemoveAll;

  if FileExists(aGeoset) then
    Map1.Geoset := aGeoset
  else
    Map1.Geoset := vAppDBSetting.MapDefView + '\Indonesia\' +'Indonesia2.gst';

  if aGeoset <> '' then
  begin
//    for i := 1 to Map1.Layers.Count do
//    begin
//      Map1.Layers.Item(i).Selectable := false;
//      Map1.Layers.Item(i).Editable  := False;
//    end;
//
//    mInfo := CoLayerInfo.Create;
//    mInfo.type_ := miLayerInfoTypeUserDraw;
//    mInfo.AddParameter('Name', 'LYR_DRAW');
//    FLyrDraw := Map1.Layers.Add(mInfo, 1);
//
//    Map1.Layers.AnimationLayer := FLyrDraw;
//    Map1.MapUnit := miUnitNauticalMile;

  end;
//  FMap.BackColor := RGB(192, 224, 255);
//  Map1.BackColor := clSkyBlue;
  Map1.BackColor := RGB(192, 224, 255);
  if aArea.Game_Area_Index <> 0 then
  begin
    if aArea.Game_Centre_Long <> 0 then
    begin
      Map1.Zoom := aArea.Game_X_Dimension;
      Map1.CenterX := aArea.Game_Centre_Long;
      Map1.CenterY := aArea.Game_Centre_Lat;
    end;
  end;


//  if aArea.Game_Area_Index <> 0 then
//  begin
//    if isFirstViewMap then
//    begin
//      Map1.Zoom := aArea.Game_X_Dimension;
//      Map1.CenterX := aArea.Game_Centre_Long;
//      Map1.CenterY := aArea.Game_Centre_Lat;
//      isFirstViewMap := False;
//      CurrentCenterX := Map1.CenterX;
//      CurrentCenterY := Map1.CenterY;
//      CurrentZoom := Map1.Zoom;
//    end
//    else
//    begin
//      Map1.CenterX := CurrentCenterX;
//      Map1.CenterY := CurrentCenterY;
//      Map1.Zoom := CurrentZoom;
//    end;
//  end
//  else
//  begin
//    if isFirstViewMap then
//    begin
//      Map1.Zoom := 2800;
//      Map1.CenterX := 118;
//      Map1.CenterY := -1.026647;
//      isFirstViewMap := False;
//      CurrentCenterX := Map1.CenterX;
//      CurrentCenterY := Map1.CenterY;
//      CurrentZoom := Map1.Zoom;
//    end
//    else
//    begin
//      Map1.CenterX := CurrentCenterX;
//      Map1.CenterY := CurrentCenterY;
//      Map1.Zoom := CurrentZoom;
//    end;
//  end;

end;



procedure TfrmAdminMainForm.SelectShip(aPlat_inst: TPlatform_Instance);
var
  i : Integer;
  aPi : TPlatform_Instance;
begin
  lvPlatform.Selected := nil;
  if lvPlatform.Items.Count = 0 then
    exit;

  for I := 0 to lvPlatform.Items.Count - 1 do
  begin
    aPI := TPlatform_Instance(lvPlatform.Items[i].Data);

    if aPi.FData.Platform_Instance_Index = aPlat_inst.FData.Platform_Instance_Index then
    begin
      lvPlatform.Selected := lvPlatform.Items[i];
      lvPlatform.Items[i].Selected := True;
      lvPlatform.SetFocus;
//      fPlatformDeploytment.platformSelect := aPlat_inst;
//      fPlatformDeploytment.indexFocusedPaltform := fPlatformDeploytment.getIndexByID(aPlat_inst.FData.Platform_Instance_Index);
      lvPlatformClick(lvPlatform);
      isApproximatedClicked := false;
      if btnArrow.ImageIndex = 1 then
      begin
        OnClick_ToolButton(btnArrow);
      end
      else if btnMove.ImageIndex = 1 then
      begin
        OnClick_ToolButton(btnMove);
      end;
      btnRuler.Hint := 'show ruler';
      
    end;

  end;
end;

procedure TfrmAdminMainForm.lvPlatformClick(Sender: TObject);
var
  lat, long : double;
  aPI : TPlatform_Instance;
  VecID : Integer;
begin
  if lvPlatform.Selected = nil then
  begin
    if grpSelect.Enabled then
    begin
      EnableGuidance(false);
    end;
//    fPlatformDeploytment.indexFocusedPaltform := fPlatformDeploytment.getIndexByID(0);
    OnClick_ToolButton(btnArrow);
    Map1.Repaint;
    Exit;
  end;

  if ListPlatformSelect.Count > 0 then
    refreshMultiMode;

  if not grpSelect.Enabled then
  begin
    EnableGuidance(True);
  end;

//  aPI := TPlatform_Instance.Create;
  aPI := TPlatform_Instance(lvPlatform.Selected.Data);

//  fPlatformDeploytment.platformSelect := aPI;

  idFocusedPlatform := aPI.FData.Platform_Instance_Index;
  lblPlatformName.Caption := aPI.FData.Instance_Name;
  lblPlatformNameDetail.Caption := aPI.FData.Instance_Name;

  VecID := aPI.Vehicle.FData.Platform_Domain;//dmTTT.GetDomainFromVehicleID(aPI.FData.Vehicle_Index);
//  dmTTT.GetMotion_Characteristics(aPI.Vehicle.FData.Motion_Characteristics, aPI.Motion);


  if (VecID = 0) then
  begin
    edtAltitude.Enabled := True;
    lbl16.Caption := 'Altitude';
    lbl16.Enabled := True;

    edtAltitudeDetail.Enabled := True;
    Label32.Caption := 'Altitude';
    Label32.Enabled := True;
  end
  else if VecID = 2 then
  begin
    edtAltitude.Enabled := True;
    lbl16.Caption := 'Depth';
    lbl16.Enabled := True;

    edtAltitudeDetail.Enabled := True;
    Label32.Caption := 'Depth';
    Label32.Enabled := True;
  end
  else
  begin
    edtAltitude.Enabled := False;
    lbl16.Caption := 'Altitude/Depth';
    lbl16.Enabled := false;

    edtAltitudeDetail.Enabled := False;
    Label32.Caption := 'Altitude/Depth';
    Label32.Enabled := false;
  end;

  with aPI.FActivation do
  begin
    edtLatPosition.Text := formatDMS_latt(Init_Position_Latitude);
    edtLongPosition.Text := formatDMS_long(Init_Position_Longitude);
    edtCourse.Text := FormatFloat('0.00', Init_Course);
    cbbGroundSpeed.ItemIndex := Init_Ground_Speed;//FormatFloat('0.000', Init_Ground_Speed);
    edtAltitude.Text := FormatFloat('0.00', Init_Altitude);

    edtLatPositionDetail.Text := formatDMS_latt(Init_Position_Latitude);
    edtLongPositionDetail.Text := formatDMS_long(Init_Position_Longitude);
    edtCourseDetail.Text := FormatFloat('0.00', Init_Course);
    cbbGroundSpeedDetail.ItemIndex := Init_Ground_Speed;//FormatFloat('0.000', Init_Ground_Speed);
    edtAltitudeDetail.Text := FormatFloat('0.00', Init_Altitude);

    if aPI.Motion.FData.Endurance_Type <> 0 then
    begin
      edtFuelRemaining.Text := 'Unlimited';
      edtFuelRemaining.Enabled := False;
    end
    else
    begin
      edtFuelRemaining.Text := FormatFloat('0.00', Init_Fuel);
      edtFuelRemaining.Enabled := True;
    end;

    edtLubricantsRemaining.Text := FormatFloat('0.00', Init_Lubricants);
    edtFreshwaterRemaining.Text := FormatFloat('0.00', Init_Freshwater);
    edtWaterRemaining.Text := FormatFloat('0.00', Init_Water);
    edtFoodRemaining.Text := FormatFloat('0.00', Init_Food);
  end;

  if not isApproximatedClicked then
  begin
    isApproximatedClicked := true;
    Map1.CurrentTool := miArrowTool;
    Map1.MousePointer := miCrossCursor;
  end;

  lat := dmsToLatt(edtLatPosition.Text);
  long := dmsToLong(edtLongPosition.Text);

  Map1.ConvertCoord(xPoint, yPoint, long, lat, miMapToScreen);
  xIntPoint := Round(xPoint);
  yIntPoint := Round(yPoint);

//  fPlatformDeploytment.indexFocusedPaltform := fPlatformDeploytment.getIndexByID(idFocusedPlatform);

//  Map1.Repaint;

end;

procedure TfrmAdminMainForm.lvPlatformCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  i : Integer;
  aPi : TPlatform_Instance;
begin
  {for I := 0 to Sender.Items.Count - 1 do
  begin
    aPi := TPlatform_Instance.Create;
    aPi := TPlatform_Instance(Sender.Items[i].Data);
    if Item.Index = i then
    begin
      case aPi.FData.Force_Designation of
        1 : Sender.Canvas.font.Color := clRed;
        2 : Sender.Canvas.font.Color := clYellow;
        3 : Sender.Canvas.font.Color := clBlue;
        4 : Sender.Canvas.font.Color := clGreen;
        5 : Sender.Canvas.font.Color := clWhite;
        6 : Sender.Canvas.font.Color := clBlack;
      end;
    end;

  end; }
end;

procedure TfrmAdminMainForm.lvPlatformSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  aPI : TPlatform_Instance;
  VecID : Integer;
begin
  if lvPlatform.Selected = nil then
  begin
    EnableGuidance(false);
//    fPlatformDeploytment.indexFocusedPaltform := fPlatformDeploytment.getIndexByID(0);
    Map1.Repaint;
    Exit;
  end;

  EnableGuidance(True);

  aPI := TPlatform_Instance.Create;
  aPI := TPlatform_Instance(lvPlatform.Selected.Data);

//  fPlatformDeploytment.platformSelect := aPI;

  idFocusedPlatform := aPI.FData.Platform_Instance_Index;
  lblPlatformName.Caption := aPI.FData.Instance_Name;
  lblPlatformNameDetail.Caption := aPI.FData.Instance_Name;


  VecID := dmTTT.GetDomainFromVehicleID(aPI.FData.Vehicle_Index);
  dmTTT.GetMotion_Characteristics(aPI.Vehicle.FData.Motion_Characteristics, aPI.Motion);

  if (VecID = 0) then
  begin
    edtAltitude.Enabled := True;
    lbl16.Caption := 'Altitude';
    lbl16.Enabled := True;

    edtAltitudeDetail.Enabled := True;
    Label32.Caption := 'Altitude';
    Label32.Enabled := True;
  end
  else if VecID = 2 then
  begin
    edtAltitude.Enabled := True;
    lbl16.Caption := 'Depth';
    lbl16.Enabled := True;

    edtAltitudeDetail.Enabled := True;
    Label32.Caption := 'Depth';
    Label32.Enabled := True;
  end
  else
  begin
    edtAltitude.Enabled := False;
    lbl16.Caption := 'Altitude/Depth';
    lbl16.Enabled := false;

    edtAltitudeDetail.Enabled := False;
    Label32.Caption := 'Altitude/Depth';
    Label32.Enabled := false;
  end;

  with aPI.FActivation do
  begin
    edtLatPosition.Text := formatDMS_latt(Init_Position_Latitude);
    edtLongPosition.Text := formatDMS_long(Init_Position_Longitude);
    edtCourse.Text := FormatFloat('0.00', Init_Course);
    cbbGroundSpeed.ItemIndex := Init_Ground_Speed;//FormatFloat('0.000', Init_Ground_Speed);
    edtAltitude.Text := FormatFloat('0.00', Init_Altitude);

    edtLatPositionDetail.Text := formatDMS_latt(Init_Position_Latitude);
    edtLongPositionDetail.Text := formatDMS_long(Init_Position_Longitude);
    edtCourseDetail.Text := FormatFloat('0.00', Init_Course);
    cbbGroundSpeedDetail.ItemIndex := Init_Ground_Speed;//FormatFloat('0.000', Init_Ground_Speed);
    edtAltitudeDetail.Text := FormatFloat('0.00', Init_Altitude);

    if aPI.Motion.FData.Endurance_Type <> 0 then
    begin
      edtFuelRemaining.Text := 'Unlimited';
      edtFuelRemaining.Enabled := False;
    end
    else
    begin
      edtFuelRemaining.Text := FormatFloat('0.00', Init_Fuel);
      edtFuelRemaining.Enabled := True;
    end;

    edtLubricantsRemaining.Text := FormatFloat('0.00', Init_Lubricants);
    edtFreshwaterRemaining.Text := FormatFloat('0.00', Init_Freshwater );
    edtWaterRemaining.Text := FormatFloat('0.00', Init_Water);
    edtFoodRemaining.Text := FormatFloat('0.00', Init_Food);

  end;

//  fPlatformDeploytment.indexFocusedPaltform := fPlatformDeploytment.getIndexByID(idFocusedPlatform);

end;
procedure TfrmAdminMainForm.MAD1Click(Sender: TObject);
begin
  frmAvailableMAD.ShowModal;
end;

procedure TfrmAdminMainForm.Map1DrawUserLayer(ASender: TObject; const Layer: IDispatch;
  hOutputDC, hAttributeDC: Cardinal; const RectFull, RectInvalid: IDispatch);
var
  I, J, cx, cy, ex, ey, r : integer;
  aWaypointData : TWaypoint_Data;
  xWPPoint, yWPPoint, xTarget, yTarget : Single;  //untuk draw waypoint
  intWPPointX, intWPPointY : Integer;
  recbase : TResource_Base_Mapping;

  wp_def : TWaypoint_Def;
  wp_data : TWaypoint_Data;
  wp_DataList : TList;
  Target_Def : TPlatform_Instance;

  plColor : TColor;
  strPath : string;
begin
   if not Assigned(FCanvas) then
    Exit;
    FCanvas.Handle := hOutputDC;


    //FCanvas.Pen.Color := clGreen;
    FCanvas.Pen.Color := RGB(200, 240, 100);
    FCanvas.Pen.Width := 1;

    //create symbols  (set positions for each symbol)
//    for I := 0 to fPlatformDeploytment.List.Count - 1 do
//    begin
//      if not Assigned(TSymbolsProp(fPlatformDeploytment.List[I]).bmp) then
//        TSymbolsProp(fPlatformDeploytment.List[I]).bmp := TBitmapSymbol.Create;
//
//      case TSymbolsProp(fPlatformDeploytment.List[I]).forcePlatform of
//        1 : TSymbolsProp(fPlatformDeploytment.List[I]).color := clRed;
//        2 : TSymbolsProp(fPlatformDeploytment.List[I]).color := clYellow;
//        3 : TSymbolsProp(fPlatformDeploytment.List[I]).color := clBlue;
//        4 : TSymbolsProp(fPlatformDeploytment.List[I]).color := clGreen;
//        5 : TSymbolsProp(fPlatformDeploytment.List[I]).color := clWhite;
//        6 : TSymbolsProp(fPlatformDeploytment.List[I]).color := clBlack;
//      end;
//
//       if TSymbolsProp(fPlatformDeploytment.List[I]).isSelected then
//         TSymbolsProp(fPlatformDeploytment.List[I]).color := RGB(255, 191, 128);

//       TSymbolsProp(fPlatformDeploytment.List[I]).LoadBitmapSymbols(TSymbolsProp(fPlatformDeploytment.List[I]).patchBmp, TSymbolsProp(fPlatformDeploytment.List[I]).color);
//       TSymbolsProp(fPlatformDeploytment.List[I]).bmp.ConvertCoord(VConvertor);

//       if (TSymbolsProp(fPlatformDeploytment.List[I]).x = 0) AND (TSymbolsProp(fPlatformDeploytment.List[I]).y = 0) then
//       begin
////         Map1.ConvertCoord(xPoint, yPoint, frmSummaryScenario.centreLong, frmSummaryScenario.centreLatt, miMapToScreen);
//         xIntPoint := Round(xPoint);
//         yIntPoint := Round(yPoint);
////         TSymbolsProp(fPlatformDeploytment.List[I]).bmp.Center.X := xIntPoint;
////         TSymbolsProp(fPlatformDeploytment.List[I]).bmp.Center.Y := yIntPoint;
//
//       end
//       else
//       begin
//         Map1.ConvertCoord(xPoint, yPoint, TSymbolsProp(fPlatformDeploytment.List[I]).x, TSymbolsProp(fPlatformDeploytment.List[I]).y, miMapToScreen);
//         xIntPoint := Round(xPoint);
//         yIntPoint := Round(yPoint);
//         TSymbolsProp(fPlatformDeploytment.List[I]).bmp.Center.X := xIntPoint;
//         TSymbolsProp(fPlatformDeploytment.List[I]).bmp.Center.Y := yIntPoint;
//
//         case TSymbolsProp(fPlatformDeploytment.List[I]).forcePlatform of
//          1 :
//            begin
//              FCanvas.Font.Color := clRed;
//              FCanvas.Pen.Color := clRed;
//
//              TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Color := clRed;
//            end;
//          2 :
//            begin
//              FCanvas.Font.Color := clYellow;
//              FCanvas.Pen.Color := clYellow;
//
//              TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Color := clYellow;
//            end;
//          3 :
//            begin
//              FCanvas.Font.Color := clBlue;
//              FCanvas.Pen.Color := clBlue;
//
//              TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Color := clBlue;
//            end;
//          4 :
//            begin
//              FCanvas.Font.Color := clGreen;
//              FCanvas.Pen.Color := clGreen;
//
//              TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Color := clGreen;
//            end;
//          5 :
//            begin
//              FCanvas.Font.Color := clWhite;
//              FCanvas.Pen.Color := clWhite;
//
//              TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Color := RGB(250,250,250){clWhite};
//            end;
//          6 :
//            begin
//              FCanvas.Font.Color := clBlack;
//              FCanvas.Pen.Color := clBlack;
//
//              TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Color := clBlack;
//            end;
//         end;
//
//         case FModeTag of
//           0:
//           begin
//             FCanvas.Font.Color := TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Color;
//             FCanvas.Font.Name := TSymbolsProp(fPlatformDeploytment.List[I]).FontTaktis.FData.FONT_NAME;
//             FCanvas.Font.Size := 24;
//             FCanvas.Font.Style := [fsBold];
//             SetBkMode(FCanvas.Handle, TRANSPARENT);
//             FCanvas.TextOut(xIntPoint - 13,
//                             yIntPoint - 20,
//                             Char(TSymbolsProp(fPlatformDeploytment.List[I]).FontTaktis.FData.FONT_INDEX));
//           end;
//           1:
//           begin
//             plColor := TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Color;
//
//             strPath := ExtractFilePath(Application.ExeName) + 'data\TacticalSymbol\TAKTIS TNI AL\SEMUA TANDA TAKTIS\'+
//                          TSymbolsProp(fPlatformDeploytment.List[I]).FontTaktis.FData.KETERANGAN+'.bmp';
//
////             if TSymbolsProp(fPlatformDeploytment.List[I]).bmp.BitmapWidth = 32 then
//              TSymbolsProp(fPlatformDeploytment.List[I]).bmp.LoadBitmap(strPath, plColor);
//
//
//             TSymbolsProp(fPlatformDeploytment.List[I]).bmp.FDegr := Round(TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FActivation.Init_Course);
//             TSymbolsProp(fPlatformDeploytment.List[I]).bmp.Draw(FCanvas);
//           end;
//           2:
//           begin
//             FCoordPlatformConv := TCoordConverter.Create;
//             FCoordPlatformConv.FMap := Map1;
//
//             TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Course :=
//             TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FActivation.Init_Course;
//             TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.DimWidth :=
//             TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.Vehicle.FData.Width;
//             TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.DimLength :=
//             TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.Vehicle.FData.Length;
//
//             TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Center.X := xIntPoint;
//             TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Center.Y := yIntPoint;
//
//             TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.ConvertCoord(FCoordPlatformConv);
//
//             TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FVectorSymbol.Draw(FCanvas);
//           end;
//         end;
//
//         FCanvas.Font.Name := 'Courier';
//         FCanvas.Font.Size := 8;
//         FCanvas.Pen.Width := 1;
//         FCanvas.Pen.Style := psDot;
//         SetBkMode(FCanvas.Handle, TRANSPARENT);
//         FCanvas.TextOut(xIntPoint + 10,
//                       yIntPoint + 10,
//                       TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FData.Track_ID);
//
////          TSymbolsProp(fPlatformDeploytment.List[I]).bmp.Draw(FCanvas);
//       end;
//    end;


  if Assigned(frmTargetEditor.TargetList) then
  begin
   Target_Def := TPlatform_Instance.Create;
    if frmTargetEditor.TargetList.Count > 0 then
    begin
      for i := 0 to frmTargetEditor.TargetList.Count - 1 do
      begin
        aTargetVisual := TTargetVisual.create;
        Target_Def := TPlatform_Instance(frmTargetEditor.TargetList.Items[i]);
        Map1.ConvertCoord(xTarget, yTarget, Target_Def.FActivation.Init_Position_Longitude, Target_Def.FActivation.Init_Position_Latitude, miMapToScreen);
        aTargetVisual.FPoint.X := Round(xTarget);
        aTargetVisual.FPoint.Y := Round(yTarget);
        aTargetVisual.Draw(FCanvas);
      end;
    end;
  end;

  if (Map1.CurrentTool = miZoomInTool) or (Map1.CurrentTool = miZoomOutTool) then
  begin
    CurrentCenterX := Map1.CenterX;
    CurrentCenterY := Map1.CenterY;
    CurrentZoom := Map1.Zoom;
  end;

  if Map1.CurrentTool = TOOL_DISTANCE then
  begin
    FCanvas.Pen.Width := 1;
    FCanvas.Pen.Style := psDot;
    FCanvas.Font.Name := 'Times New Roman';
    FCanvas.Font.Size := 7;
    FCanvas.Font.Color := clRed;
    aRuler.Draw(FCanvas);
    SetBkMode(FCanvas.Handle, TRANSPARENT);
    FCanvas.TextOut(aRuler.sx1 + (round((aRuler.sx2 - aRuler.sx1)/2)) + 3,
                      aRuler.sy1 + (round((aRuler.sy2 - aRuler.sy1)/2)),
                       'Range   : '+floatToStr(aRuler.Range) + ' nm');

    FCanvas.TextOut(aRuler.sx1 + (round((aRuler.sx2 - aRuler.sx1)/2)) + 3,
                      aRuler.sy1 + (round((aRuler.sy2 - aRuler.sy1)/2)) + 13,
                       'Bearing : '+floattostr(aRuler.Bearing)+ '°');
  end
  else if Map1.CurrentTool = TOOL_MULTISELECT then
  begin
    FCanvas.Pen.Width := 1;
    FCanvas.Pen.Color := clWhite;
    FCanvas.Pen.Style := psSolid;
    FCanvas.Brush.Style := bsClear;

    aMultiSelect.Draw(FCanvas);
  end
  else if Map1.CurrentTool = TOOL_MOVE_PLATFORM then
  begin
  //rio
    FCanvas.Pen.Width := 1;
    FCanvas.Pen.Style := psDot;
    FCanvas.Font.Color := clBlack;
    aMoveObj.Draw(FCanvas);
    SetBkMode(FCanvas.Handle, TRANSPARENT);
  end;

  if isModeWaypoint then
  begin
    FCanvas.Pen.Width := 1;
    FCanvas.Pen.Style := psSolid;
    FCanvas.Pen.Color := clWhite;
    FCanvas.Font.Name := 'Courier';
    FCanvas.Brush.Style := bsClear;
    FCanvas.Font.Size := 12;
    FCanvas.Font.Color := clGray;

//    if frmSummaryWaypoint.ListWpData.Count > 1 then
//    begin
//      for I := 0 to frmSummaryWaypoint.ListWpData.Count - 2 do
//      begin
//        aWaypointData := TWaypoint_Data(frmSummaryWaypoint.ListWpData.Items[i]);
//        Map1.ConvertCoord(xWPPoint, yWPPoint, aWaypointData.FData.Waypoint_Longitude, aWaypointData.FData.Waypoint_Latitude, miMapToScreen);
//        intWPPointX := Round(xWPPoint);
//        intWPPointY := Round(yWPPoint);
//        FCanvas.MoveTo(intWPPointX, intWPPointY);
//
//        aWaypointData := TWaypoint_Data(frmSummaryWaypoint.ListWpData.Items[i+1]);
//        Map1.ConvertCoord(xWPPoint, yWPPoint, aWaypointData.FData.Waypoint_Longitude, aWaypointData.FData.Waypoint_Latitude, miMapToScreen);
//        intWPPointX := Round(xWPPoint);
//        intWPPointY := Round(yWPPoint);
//        FCanvas.LineTo(intWPPointX, intWPPointY);
//      end;
//    end;
//
//    for I := 0 to frmSummaryWaypoint.ListWpData.Count - 1 do
//    begin
//      aWaypointData := TWaypoint_Data(frmSummaryWaypoint.ListWpData.Items[i]);
//      Map1.ConvertCoord(xWPPoint, yWPPoint, aWaypointData.FData.Waypoint_Longitude, aWaypointData.FData.Waypoint_Latitude, miMapToScreen);
//      intWPPointX := Round(xWPPoint);
//      intWPPointY := Round(yWPPoint);
//      FCanvas.TextOut(intWPPointX, intWPPointY,IntToStr(i+1));
//    end;
  end;

  if showWaypoint then
  begin
    FCanvas.Pen.Width := 1;
    FCanvas.Pen.Style := psSolid;
    FCanvas.Pen.Color := clWhite;
    FCanvas.Font.Name := 'Courier';
    FCanvas.Brush.Style := bsClear;
    FCanvas.Font.Size := 12;
    FCanvas.Font.Color := clGray;

    for I := 0 to frmWaypointWindow.WaypointList.Count - 1 do
    begin
      wp_def := TWaypoint_Def.Create;
      wp_DataList := TList.Create;
      wp_def := TWaypoint_Def(frmWaypointWindow.WaypointList.Items[i]);
      if wp_def.isShow then
      begin
        dmTTT.getWaypointDataByID(wp_def.FData.Waypoint_Index, wp_DataList);
        if wp_DataList.Count > 0 then
        begin
          for J := 0 to wp_DataList.Count - 2 do
          begin
            wp_data := TWaypoint_Data.Create;

            wp_data := TWaypoint_Data(wp_DataList.Items[j]);
            Map1.ConvertCoord(xWPPoint, yWPPoint, wp_data.FData.Waypoint_Longitude, wp_data.FData.Waypoint_Latitude, miMapToScreen);
            intWPPointX := Round(xWPPoint);
            intWPPointY := Round(yWPPoint);
            if j = 0 then
            begin
              FCanvas.TextOut(intWPPointX, intWPPointY,IntToStr(j+1) +' '+wp_def.FData.Waypoint_Name);
            end
            else
            begin
              FCanvas.TextOut(intWPPointX, intWPPointY,IntToStr(j+1));
            end;
            FCanvas.MoveTo(intWPPointX, intWPPointY);

            wp_data := TWaypoint_Data(wp_DataList.Items[j+1]);
            Map1.ConvertCoord(xWPPoint, yWPPoint, wp_data.FData.Waypoint_Longitude, wp_data.FData.Waypoint_Latitude, miMapToScreen);
            intWPPointX := Round(xWPPoint);
            intWPPointY := Round(yWPPoint);
            FCanvas.LineTo(intWPPointX, intWPPointY);

            if j = wp_DataList.Count - 2 then
            begin
              FCanvas.TextOut(intWPPointX, intWPPointY,IntToStr(j+2));
            end;
          end;
        end;
      end;
    end;
  end;


  {base}
  DrawBaseEmbark.ListBase.Clear;
//  if fmBaseResourceAllocationPickList.BaseSelectedList.Count > 0 then
//  begin
//    for i := 0 to fmBaseResourceAllocationPickList.BaseSelectedList.Count - 1 do
//    begin
//      recbase := TResource_Base_Mapping(fmBaseResourceAllocationPickList.
//        BaseSelectedList.Items[i]);
//      DrawBaseEmbark.ListBase.Add(recbase);
//    end;
//  end;
//  DrawBaseEmbark.ListBase := fmEmbarkLibraryPickList.BaseSelectedList;
  FCanvas.Brush.Style := bsClear;
//  for i := 0 to fmBaseResourceAllocationPickList.BaseSelectedList.Count - 1 do
//  begin
//    DrawBaseEmbark.Radius := TResource_Embark_Library_Mapping(fmEmbarkLibraryPickList.BaseSelectedList[i]).
//      FData.Embark_Library_Radius;
//    DrawBaseEmbark.Draw(FCanvas);
//
//  end;
end;

procedure TfrmAdminMainForm.Map1MapViewChanged(Sender: TObject);
var
  aGeoset, NewArea : string;
  dx,dy: Single;
  Mx, My : Double;
  S_MapPointX, S_MapPointY, E_MapPointX, E_MapPointY : Double;
  StartPointX, StartPointY, EndPointX, EndPointY : Single;
  I,J, FindIndex : Integer;
  FZoomValue, FPosValue, FTotalValue : Integer;
begin
  Mx := Map1.CenterX;
  My := Map1.CenterY;
  Map1.ConvertCoord(dx, dy, Mx, My, miMapToScreen);

//  StartPointX := dx - (Round(Map1.Width/2));
//  StartPointY := dy - (Round(Map1.Height/2));
//  EndPointX := dx + (Round(Map1.Width/2));
//  EndPointY := dy + (Round(Map1.Height/2));

  Map1.ConvertCoord(StartPointX, StartPointY, S_MapPointX, S_MapPointY, miScreenToMap);

  LastZoom := Map1.Zoom;
  LastCenterX := Map1.CenterX;
  LastCenterY := Map1.CenterY;

  lbl_ValueCenterX.Caption := Format('%2.8f', [Map1.CenterX]);
  lbl_ValueCenterY.Caption := Format('%2.8f', [Map1.CenterY]);
  lbl_ZoomValue.Caption := FormatFloat('0.00', LastZoom);

  if (FToolSelected = sAirMap) or (inFlag = 1) then
  begin
    if edtMapMode1.Text = '' then
      GetDefaultDef(FListFileMode_Map1, 1, FList_IDArea_Map1, FList_NameArea_Map1, NewArea)
    else
      CheckQualifyArea(FListFileMode_Map1, 1, NewArea);

    if NewArea = LastArea then
      Exit
    else
    begin
      if NewArea = '' then
        ShowMessage('File Not Found!')
      else
      begin
        aGeoset := vAppDBSetting.MapGSTGame + '\' + NewArea + '\' + NewArea + '.gst';
        dmTTT.GetGame_Area_DefByID(ExerciseAreaForm.inx1, ExerciseAreaForm.gameEnv);

        if isOk = False then
        begin
          LoadMap(aGeoset, ExerciseAreaForm.gameEnv.FGameArea);
          Map1.Zoom := LastZoom;
          Map1.CenterX := LastCenterX;
          Map1.CenterY := LastCenterY;
          LastArea := NewArea;
        end
        else
          Exit;
      end;
    end;
  end
  else if (FToolSelected = sLandMap) or (inFlag = 2) then
  begin
    if edtMapMode2.Text = '' then
      GetDefaultDef(FListFileMode_Map2, 2, FList_IDArea_Map2, FList_NameArea_Map2, NewArea)
    else
      CheckQualifyArea(FListFileMode_Map2, 2, NewArea);

    if NewArea = LastArea then
      Exit
    else
    begin
      if NewArea = '' then
        ShowMessage('File Not Found!')
      else
      begin
        aGeoset := vAppDBSetting.MapGSTGame + '\' + NewArea + '\' + NewArea + '.gst';
        dmTTT.GetGame_Area_DefByID(ExerciseAreaForm.inx2, ExerciseAreaForm.gameEnv);

        if isOk = False then
        begin
          LoadMap(aGeoset, ExerciseAreaForm.gameEnv.FGameArea);
          Map1.Zoom := LastZoom;
          Map1.CenterX := LastCenterX;
          Map1.CenterY := LastCenterY;
          LastArea := NewArea;
        end
        else
          Exit;
      end;
    end;
  end
  else if (FToolSelected = sSeaMap) or (inFlag = 3) then
  begin
    if edtMapMode3.Text = '' then
      GetDefaultDef(FListFileMode_Map3, 3, FList_IDArea_Map3, FList_NameArea_Map3, NewArea)
    else
      CheckQualifyArea(FListFileMode_Map3, 3, NewArea);

    if NewArea = LastArea then
      Exit
    else
    begin
      if NewArea = '' then
        ShowMessage('File Not Found!')
      else
      begin
        aGeoset := vAppDBSetting.MapGSTGame + '\' + NewArea + '\' + NewArea + '.gst';
        dmTTT.GetGame_Area_DefByID(ExerciseAreaForm.inx3, ExerciseAreaForm.gameEnv);

        if isOk = False then
        begin
          LoadMap(aGeoset, ExerciseAreaForm.gameEnv.FGameArea);
          Map1.Zoom := LastZoom;
          Map1.CenterX := LastCenterX;
          Map1.CenterY := LastCenterY;
          LastArea := NewArea;
        end
        else
          Exit;
      end;
    end;
  end;
end;

procedure TfrmAdminMainForm.Map1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  lat, long : double;
  aObj : TPlatform_Instance;
  mX, mY : Double;
  sX, sY : Single;
  pt : TPoint;
begin
  if Button = mbRight then
  begin
    OnClick_ToolButton(btnArrow);
    btnRuler.Hint := 'show ruler';

    if ssCtrl in Shift then
    begin
      PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
    end;
//    Map1.Repaint;
    //=========================
  end
  else
  begin
    if lvPlatform.Selected = nil then
    begin
      lblPlatformName.Caption := 'No Ship Selected';
      lblPlatformNameDetail.Caption := 'No Ship Selected';
    end;
    if not (isApproximatedClicked) then
    begin
      if Map1.CurrentTool = miArrowTool then
      begin
        //create converter
        FCoordPlatformConv := TCoordConverter.Create;
        //set mapnya
        FCoordPlatformConv.FMap := Map1;
        FCoordPlatformConv.ConvertToMap(X, Y, long, lat);
        aObj := FindNearestPlatform(long, lat, 30);
        if aObj <> nil then
        begin
          SelectShip(aObj);
          
          Map1.Repaint;
        end
        else
        begin
          if grpSelect.Enabled then
          begin
            EnableGuidance(false);
          end;
//          fPlatformDeploytment.indexFocusedPaltform := fPlatformDeploytment.getIndexByID(0);
          Map1.Repaint;
        end;
      end
      else if Map1.CurrentTool = TOOL_DISTANCE  then
      begin
        aRuler := TLineVisual.Create;

        aRuler.sx1 := x;
        aRuler.sy1 := y;

        FCoordPlatformConv := TCoordConverter.Create;
        //set mapnya
        FCoordPlatformConv.FMap := Map1;
        FCoordPlatformConv.ConvertToMap(X, Y, long, lat);
        aObj := FindNearestPlatform(long, lat, 30);
        if aObj <> nil then
        begin
          mX := aObj.FActivation.Init_Position_Longitude;
          mY := aObj.FActivation.Init_Position_Latitude;

          Map1.ConvertCoord(sx, sY, mx, my, miMapToScreen);

          aRuler.sx1  := Round(sx);
          aRuler.sy1  := Round(sy);
        end;

        IsDown := True;

      end
      else if Map1.CurrentTool = TOOL_MULTISELECT then
      begin
        pt.X := x;
        pt.Y := y;
        if not PtInRect(RectMulti,pt) then
        begin
          ListPlatformSelect := TList.Create;;

          aMultiSelect := TRectVisual.create;

          aMultiSelect.FStartPoint.X := x;
          aMultiSelect.FStartPoint.Y := y;

          aMultiSelect.FEndPoint.X := X;
          aMultiSelect.FEndPoint.Y := Y;

          RectMulti.Left := x;
          RectMulti.Top := y;
          RectMulti.Right := x;
          RectMulti.Bottom := y;

          IsInRect := False;
        end
        else
        begin
          IsInRect := True;
          ptMoveStart.X := x;
          ptMoveStart.Y := y;

          ptMoveEnd.X := x;
          ptMoveEnd.Y := y;

          ptStartInit.X := x;
          ptStartInit.Y := y;

        end;

        IsDown := True;
        Map1.Repaint;
      end
      else if Map1.CurrentTool = TOOL_MOVE_PLATFORM then
      begin
        //create converter
        FCoordPlatformConv := TCoordConverter.Create;
        //set mapnya
        FCoordPlatformConv.FMap := Map1;
        FCoordPlatformConv.ConvertToMap(X, Y, long, lat);
        aObj := FindNearestPlatform(long, lat, 15);
        if aObj <> nil then
        begin
          
          SelectShip(aObj);
          aMoveObj := TLineVisual.Create;
          FCoordPlatformConv := TCoordConverter.Create;
          //set mapnya
          FCoordPlatformConv.FMap := Map1;
          FCoordPlatformConv.ConvertToMap(X, Y, long, lat);
          aObj := FindNearestPlatform(long, lat, 30);
          if aObj <> nil then
          begin
            mX := aObj.FActivation.Init_Position_Longitude;
            mY := aObj.FActivation.Init_Position_Latitude;

            Map1.ConvertCoord(sx, sY, mx, my, miMapToScreen);

            aMoveObj.sx1  := Round(sx);
            aMoveObj.sy1  := Round(sy);
          end;

          IsDown := True;
          Map1.Repaint;
        end
        else
        begin
          if grpSelect.Enabled then
          begin
            EnableGuidance(false);
          end;
//          fPlatformDeploytment.indexFocusedPaltform := fPlatformDeploytment.getIndexByID(0);
          Map1.Repaint;
        end;
      end
      else if Map1.CurrentTool = TOOL_EDIT_WAYPOINT then
      begin
        FCoordPlatformConv := TCoordConverter.Create;
        //set mapnya
        FCoordPlatformConv.FMap := Map1;
        FCoordPlatformConv.ConvertToMap(X, Y, long, lat);
//        frmSummaryWaypoint.OnEditWaypoint(Long,Lat);
        aWaypointCoor.X := X;
        aWaypointCoor.Y := Y;
        map1.Repaint;
      end
      else if  Map1.CurrentTool = TOOL_ADD_WAYPOINT then
      begin
        FCoordPlatformConv := TCoordConverter.Create;
        //set mapnya
        FCoordPlatformConv.FMap := Map1;
        FCoordPlatformConv.ConvertToMap(X, Y, long, lat);
//        frmSummaryWaypoint.OnAddWaypoint(Long,Lat);

        aWaypointCoor.X := X;
        aWaypointCoor.Y := Y;
        map1.Repaint;
      end
      else if  Map1.CurrentTool = TOOL_ADD_TARGET then
      begin
        FCoordPlatformConv := TCoordConverter.Create;
        //set mapnya
        FCoordPlatformConv.FMap := Map1;
        FCoordPlatformConv.ConvertToMap(X, Y, long, lat);

        frmTargetEditor.OnAddTarget(X,Y,Long,Lat);
        Map1.Repaint;
      end

    end;
  end;


//  FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);

  if (isApproximatedClicked) and (Button <> mbRight) then
  begin
    //create converter
    if not Assigned(FCoordPlatformConv) then
      FCoordPlatformConv := TCoordConverter.Create;

    //set mapnya
    FCoordPlatformConv.FMap := Map1;

    FCoordPlatformConv.ConvertToMap(X, Y, long, lat);

    edtLatPosition.Text := formatDMS_latt(lat);
    edtLongPosition.Text := formatDMS_long(long);

    edtLatPositionDetail.Text := formatDMS_latt(lat);
    edtLongPositionDetail.Text := formatDMS_long(long);

//    TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).x := long;
//    TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).y := lat;
//
//    TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Latitude := lat;
//    TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Longitude := long;
//    TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Cartesian_X := X;
//    TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]).Fplatform.FActivation.Init_Position_Cartesian_Y := Y;

//    lvPlatform.OnClick(lvPlatform.Items[lvPlatform.Selected.Index]);
//    lvPlatform.SetFocus;

   //Map1.Repaint;
   //================= dng ===============// refresh clicked platform (change to normal cursor)
//    OnClick_ToolButton(btnArrow);
    Map1.CurrentTool := miArrowTool;
    Map1.Repaint;
   //======================================================//
  end;

  {Prince}
  if (isBasePosition) and (Button <> mbRight) then
  begin
    FCoordPlatformConv := TCoordConverter.Create;
    FCoordPlatformConv.FMap := Map1;

    FCoordPlatformConv.ConvertToMap(X, Y, long, lat);

//    isBasePosition := False;
    fmEmbarkPositionInput.edtPosLat.Text := formatDMS_latt(lat);
    fmEmbarkPositionInput.edtPosLong.Text := formatDMS_long(long);
    fmEmbarkPositionInput.Show;
  end;


end;

procedure TfrmAdminMainForm.Map1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  mx, my: double;
  sx, sy: single;
  z: double;
  s: string;

  mx1, my1, mx2, my2 : Double;
  sx1, sy1, sx2, sy2 : Single;

  hasilUTM, hasilMGRS : string;   //dng

  i, j : Integer;
//  aObj : TSymbolsProp;
begin
  if map1.Geoset = '' then exit;
  sx := x;
  sy := y;

  map1.ConvertCoord(sx, sy, mx, my, miScreenToMap);

  lblLongitude.Caption := formatDMS_long(mx);
  lblLatitude.Caption := formatDMS_latt(my);

         //==== dng utm and mgrs ===//
  ConvDegree_To_UTM_and_MGRS(my, mx, hasilUTM, hasilMGRS);
  lblUTM.Caption := hasilUTM;
  lblMGRS.Caption := hasilMGRS;

  lblX.Caption := Format('%2.8f', [mx]);
  lblY.Caption := Format('%2.8f', [my]);

  if Map1.CurrentTool = TOOL_DISTANCE  then
  begin
    if IsDown then
    begin
      if not Assigned(FCanvas) then
      Exit;

      aRuler.sx2 := x;
      aRuler.sy2 := y;

      sx1 := aRuler.sx1;
      sy1 := aRuler.sy1;
      sx2 := aRuler.sx2;
      sy2 := aRuler.sy2;

      map1.ConvertCoord(sx1, sy1, mx1, my1, miScreenToMap);
      map1.ConvertCoord(sx2, sy2, mx2, my2, miScreenToMap);


      aRuler.Range := StrToFloat(FormatFloat('0.00',CalcRange(mx1, my1, mx2, my2)));
      aRuler.Bearing := StrToFloat(FormatFloat('0.00',CalcBearing(mx1, my1, mx2, my2)));


      aRuler.Visible := True;
      aRuler.LineStyles := psSolid;
      aRuler.Color := clRed;
      Map1.Repaint;
    end;
  end
  else if Map1.CurrentTool = TOOL_MULTISELECT then
  begin
    if IsDown then
    begin
      if not Assigned(FCanvas) then
      Exit;

      if not IsInRect then
      begin
        aMultiSelect.FEndPoint.X := X;
        aMultiSelect.FEndPoint.Y := Y;

        RectMulti.Right := x;
        RectMulti.Bottom := y;

      end
      else
      begin
        ptMoveEnd.X := x;
        ptMoveEnd.Y := y;

        aMultiSelect.FStartPoint.X := RectMulti.Left + (ptMoveEnd.X - ptMoveStart.X);
        aMultiSelect.FStartPoint.Y := RectMulti.Top + (ptMoveEnd.Y - ptMoveStart.Y);
        aMultiSelect.FEndPoint.X := RectMulti.Right + (ptMoveEnd.X - ptMoveStart.X);
        aMultiSelect.FEndPoint.Y := RectMulti.Bottom + (ptMoveEnd.Y - ptMoveStart.Y);

        for I := 0 to ListPlatformSelect.Count - 1 do
        begin
//          aObj := TSymbolsProp(ListPlatformSelect.Items[i]);

          sx1 := ptStartInit.X;
          sy1 := ptStartInit.Y;

          sx2 := ptMoveEnd.X;
          sy2 := ptMoveEnd.Y;

          Map1.ConvertCoord(sx1, sy1, mx1, my1, miScreenToMap);
          Map1.ConvertCoord(sx2, sy2, mx2, my2, miScreenToMap);

//          aObj.x := aObj.Fplatform.FActivation.Init_Position_Longitude + (mx2 - mx1);
//          aObj.Y := aObj.Fplatform.FActivation.Init_Position_Latitude + (my2 - my1);
//
//          aObj.Fplatform.FActivation.Init_Position_Longitude :=  aObj.x;
//          aObj.Fplatform.FActivation.Init_Position_Latitude := aObj.y;
//
//          Map1.ConvertCoord(sx, sy, aObj.x, aObj.y, miMapToScreen);
//
//          aObj.Fplatform.FActivation.Init_Position_Cartesian_X := sx;
//          aObj.Fplatform.FActivation.Init_Position_Cartesian_Y := sy;

        end;

        ptStartInit.X := X;
        ptStartInit.Y := Y;

      end;
      aMultiSelect.Visible := True;
      aMultiSelect.LineStyles := psSolid;
      aMultiSelect.Color := clBlue;
      Map1.Repaint;

    end;
  end
  //tambahan rio.
  else if Map1.CurrentTool = TOOL_MOVE_PLATFORM then
  begin

    if IsDown then
    begin
      if not Assigned(FCanvas) then
      Exit;

      aMoveObj.sx2 := x;
      aMoveObj.sy2 := y;

      aMoveObj.Visible := True;
      aMoveObj.LineStyles := psSolid;
      aMoveObj.Color := clBlack;
      Map1.Repaint;
    end;
  end;

end;

procedure TfrmAdminMainForm.Map1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   lat, long : double;
   aObj : TPlatform_Instance;
   mX, mY : Double;
   sX, sY : Single;
   mx1, my1, mx2, my2 : Double;
   sx1, sy1, sx2, sy2 : Single;
   aRect : TRect;
   pt : TPoint;
   i : integer;
//   aSmblObj : TSymbolsProp;
begin
  if Map1.CurrentTool = TOOL_DISTANCE  then
  begin
    if IsDown then
    begin
      aRuler.sx2 := x;
      aRuler.sy2 := y;

      FCoordPlatformConv := TCoordConverter.Create;
      //set mapnya
      FCoordPlatformConv.FMap := Map1;
      FCoordPlatformConv.ConvertToMap(X, Y, long, lat);
      aObj := FindNearestPlatform(long, lat, 30);
      if aObj <> nil then
      begin
        mX := aObj.FActivation.Init_Position_Longitude;
        mY := aObj.FActivation.Init_Position_Latitude;

        Map1.ConvertCoord(sx, sY, mx, my, miMapToScreen);

        aRuler.sx2  := Round(sx);
        aRuler.sy2  := Round(sy);

      end;

      sx1 := aRuler.sx1;
      sy1 := aRuler.sy1;
      sx2 := aRuler.sx2;
      sy2 := aRuler.sy2;

      map1.ConvertCoord(sx1, sy1, mx1, my1, miScreenToMap);
      map1.ConvertCoord(sx2, sy2, mx2, my2, miScreenToMap);


      aRuler.Range := StrToFloat(FormatFloat('0.00',CalcRange(mx1, my1, mx2, my2)));
      aRuler.Bearing := StrToFloat(FormatFloat('0.00',CalcBearing(mx1, my1, mx2, my2)));

      Map1.Repaint;
      IsDown := false;
    end;
  end
  else if Map1.CurrentTool = TOOL_MULTISELECT then
  begin
    if IsDown then
    begin
      if not IsInRect then
      begin
        aMultiSelect.FEndPoint.X := X;
        aMultiSelect.FEndPoint.Y := Y;

        RectMulti.Right := x;
        RectMulti.Bottom := y;

        aRect.Left := aMultiSelect.FStartPoint.X;
        aRect.Top  := aMultiSelect.FStartPoint.Y;
        aRect.Right := aMultiSelect.FEndPoint.X;
        aRect.Bottom := aMultiSelect.FEndPoint.Y;

        if Assigned(ListPlatformSelect) then
        begin
          ListPlatformSelect.Clear;
//          for i := 0 to fPlatformDeploytment.List.count{SIMMgr.Platform_Insts.Count} - 1 do
//          begin
//
//            aSmblObj := TSymbolsProp(fPlatformDeploytment.List.Items[i]);{SIMMgr.Platform_Insts.Items[i];}
//            mX := aSmblObj.Fplatform.FActivation.Init_Position_Longitude;
//            mY := aSmblObj.Fplatform.FActivation.Init_Position_Latitude;
//
//            Map1.ConvertCoord(sx, sy, mx, my, miMapToScreen);
//            pt.X := Round(sx);
//            pt.Y := Round(sy);
//
//            if PtInRect(aRect, pt) then
//            begin
//              ListPlatformSelect.Add(aSmblObj);
//            end;
//          end;
        end;
      end
      else
      begin
        RectMulti.Left := aMultiSelect.FStartPoint.X;
        RectMulti.Top := aMultiSelect.FStartPoint.Y;
        RectMulti.Right := aMultiSelect.FEndPoint.X;
        RectMulti.Bottom := aMultiSelect.FEndPoint.Y;
      end;


      IsDown := false;
    end;
  end
  //rio
  else if Map1.CurrentTool = TOOL_MOVE_PLATFORM then
  begin
    if IsDown then
    begin
      aMoveObj.sx2 := x;
      aMoveObj.sy2 := y;
      aMoveObj.Visible := False;

//      aSmblObj := TSymbolsProp(fPlatformDeploytment.List[fPlatformDeploytment.indexFocusedPaltform]);

      FCoordPlatformConv.ConvertToMap(X, Y, long, lat);
      edtLatPosition.Text := formatDMS_latt(lat);
      edtLongPosition.Text := formatDMS_long(long);
      edtLatPositionDetail.Text := formatDMS_latt(lat);
      edtLongPositionDetail.Text := formatDMS_long(long);
//      aSmblObj.x := long;
//      aSmblObj.y := lat;
//      aSmblObj.Fplatform.FActivation.Init_Position_Latitude := lat;
//      aSmblObj.Fplatform.FActivation.Init_Position_Longitude := long;
//      aSmblObj.Fplatform.FActivation.Init_Position_Cartesian_X := X;
//      aSmblObj.Fplatform.FActivation.Init_Position_Cartesian_Y := Y;

      IsDown := false;
      aMoveObj.Visible := false;

      Map1.Repaint;
    end;
  end;
end;

procedure TfrmAdminMainForm.Mine1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 3;
  frmAdminMainForm.fromDBeditor := True;
  fWeaponSingle.ShowModal;
end;

procedure TfrmAdminMainForm.Missile1Click(Sender: TObject);
begin
//  frmAdminMainForm.index := 1;
//  frmAdminMainForm.fromDBeditor := True;
//  fWeaponSingle.ShowModal;

  if not Assigned(frmAvailableMissile) then
    frmAvailableMissile := TfrmAvailableMissile.Create(self);

  frmAvailableMissile.Show;
end;

procedure TfrmAdminMainForm.mnibay1Click(Sender: TObject);
begin
  frmTeluk.ShowModal;
end;

procedure TfrmAdminMainForm.mniBeach1Click(Sender: TObject);
begin
  frmBeach.ShowModal;
end;

procedure TfrmAdminMainForm.mniStaticSymbolMode1Click(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    0:
    begin
      mniStaticSymbolMode1.Checked := True;
      mniDinamicViewMode1.Checked := False;
      mniDimensionSymbolMode1.Checked := False;
      btnPlatformView.Hint := 'Static View';
    end;
    1:
    begin
      mniStaticSymbolMode1.Checked := False;
      mniDinamicViewMode1.Checked := True;
      mniDimensionSymbolMode1.Checked := False;
      btnPlatformView.Hint := 'Dynamic View';
    end;
    2:
    begin
      mniStaticSymbolMode1.Checked := False;
      mniDinamicViewMode1.Checked := False;
      mniDimensionSymbolMode1.Checked := True;
      btnPlatformView.Hint := 'Platform View';
    end;
  end;

  FModeTag := TMenuItem(Sender).Tag;
  Map1.Repaint;
end;

procedure TfrmAdminMainForm.mniLogistics1Click(Sender: TObject);
begin
//  frmAvailableLogistic.LogisticsID := 0;
//  frmAvailableLogistic.show_from := fromMain;
//  frmAvailableLogistic.ShowModal;
end;

procedure TfrmAdminMainForm.mniPort2Click(Sender: TObject);
begin
  frmPelabuhan.ShowModal;
end;

procedure TfrmAdminMainForm.mniUserAdministrator1Click(Sender: TObject);
begin
  frmAdministrator.ShowModal;
end;

procedure TfrmAdminMainForm.mniWaypoint1Click(Sender: TObject);
begin
  frmWaypointWindow.show;
end;

procedure TfrmAdminMainForm.Motion1Click(Sender: TObject);
begin
  frmAvailablemotion.ShowModal;
end;

procedure TfrmAdminMainForm.Move1Click(Sender: TObject);
begin
  OnClick_ToolButton(btnMove);
end;

procedure TfrmAdminMainForm.MultiSelect1Click(Sender: TObject);
begin
  OnClick_ToolButton(btnMulti);
end;

procedure TfrmAdminMainForm.Normal1Click(Sender: TObject);
begin
  OnClick_ToolButton(btnArrow);
end;

procedure TfrmAdminMainForm.OnClick_ToolButton(sender: TObject);
var
  aGeoset, FArea : string;
  aGameArea : TRecGame_Area_Definition;
//  LastZoom : Double;
  I, J, TotalValue, FZoomValue, FPosValue : Integer;
begin
//  LastZoom := Map1.Zoom;
//  Map1.CenterX := LastCenterX;
//  Map1.CenterY := LastCenterY;

//  frmSummaryWaypoint.btnAdd.Down := False;
  aGameArea.Game_Area_Index := 0;
  FToolSelected    := TStateToolButton(TComponent(sender).Tag);
  Map1.CurrentTool := miArrowTool;
  Map1.MousePointer := miDefaultCursor;
  isApproximatedClicked := False;

  btnHand.ImageIndex    := 0;
  btnArrow.ImageIndex   := 0;
  btnZoomIn.ImageIndex  := 0;
  btnZoomOut.ImageIndex := 0;
  btnCenter.ImageIndex  := 0;
  btnRuler.ImageIndex   := 0;
  btnMulti.ImageIndex   := 0;
  btnPlatformView.ImageIndex := 0;
  btnMove.ImageIndex := 0;

  refreshMultiMode;

  case FToolSelected of
    sHand:
    begin
      btnHand.ImageIndex  := 1;
      Map1.CurrentTool    := miPanTool;
      btnRuler.Hint := 'show ruler';

    end;
    sMove:
    begin
      btnMove.ImageIndex  := 1;
      Map1.CurrentTool    := TOOL_MOVE_PLATFORM;

      btnRuler.Hint       := 'show ruler';
    end;
    sArrow:
    begin
      btnArrow.ImageIndex := 1;
      Map1.CurrentTool    := miArrowTool;
      btnRuler.Hint := 'show ruler';

    end;
    sZoomIn:
    begin
      btnZoomIn.ImageIndex := 1;
      Map1.CurrentTool     := miZoomInTool;
      btnRuler.Hint := 'show ruler';

    end;
    sZoomOut:
    begin
      btnZoomOut.ImageIndex := 1;
      Map1.CurrentTool      := miZoomOutTool;
      btnRuler.Hint := 'show ruler';

    end;
    sCenter:
    begin
      btnCenter.ImageIndex := 1;
      Map1.CurrentTool     := miCenterTool;
      btnRuler.Hint := 'show ruler';

    end;
    sAirMap:
    begin
      inFlag := 1;

      btnAirMap.ImageIndex := 1;
      btnArrow.ImageIndex := 1;
      btnLandMap.ImageIndex := 0;
      btnSeaMap.ImageIndex  := 0;
      Map1.CurrentTool     := miArrowTool;

      if edtMapMode1.Text = '' then
        GetDefaultDef(FListFileMode_Map1, 1, FList_IDArea_Map1, FList_NameArea_Map1, FArea)
      else
        CheckQualifyArea(FListFileMode_Map1, 1, FArea);

      LastArea := FArea;

      if FArea = '' then
        ShowMessage('File Not Found!')
      else
      begin
        aGeoset := vAppDBSetting.MapGSTGame + '\' + FArea + '\' + FArea + '.gst';
        dmTTT.GetGame_Area_DefByID(ExerciseAreaForm.inx1, ExerciseAreaForm.gameEnv);
        LoadMap(aGeoset, ExerciseAreaForm.gameEnv.FGameArea);

        Map1.Zoom := LastZoom;
        Map1.CenterX := LastCenterX;
        Map1.CenterY := LastCenterY;
      end;
    end;
    sLandMap:
    begin
      inFlag := 2;

      btnLandMap.ImageIndex := 1;
      btnArrow.ImageIndex := 1;
      btnAirMap.ImageIndex  := 0;
      btnSeaMap.ImageIndex  := 0;
      Map1.CurrentTool     := miArrowTool;

      if edtMapMode2.Text = '' then
        GetDefaultDef(FListFileMode_Map2, 2, FList_IDArea_Map2, FList_NameArea_Map2, FArea)
      else
        CheckQualifyArea(FListFileMode_Map2, 2, FArea);

      LastArea := FArea;

      if FArea = '' then
        ShowMessage('File Not Found!')
      else
      begin
        aGeoset := vAppDBSetting.MapGSTGame + '\' + FArea + '\' + FArea + '.gst';
        dmTTT.GetGame_Area_DefByID(ExerciseAreaForm.inx2, ExerciseAreaForm.gameEnv);
        LoadMap(aGeoset, ExerciseAreaForm.gameEnv.FGameArea);

        Map1.Zoom := LastZoom;
        Map1.CenterX := LastCenterX;
        Map1.CenterY := LastCenterY;
      end;
    end;
    sSeaMap:
    begin
      inFlag := 3;

      btnSeaMap.ImageIndex := 1;
      btnArrow.ImageIndex := 1;
      btnAirMap.ImageIndex  := 0;
      btnLandMap.ImageIndex := 0;
      Map1.CurrentTool     := miArrowTool;

      if edtMapMode3.Text = '' then
        GetDefaultDef(FListFileMode_Map3, 3, FList_IDArea_Map3, FList_NameArea_Map3, FArea)
      else
        CheckQualifyArea(FListFileMode_Map3, 3, FArea);

      LastArea := FArea;

      if FArea = '' then
        ShowMessage('File Not Found!')
      else
      begin
        aGeoset := vAppDBSetting.MapGSTGame + '\' + FArea + '\' + FArea + '.gst';
        dmTTT.GetGame_Area_DefByID(ExerciseAreaForm.inx3, ExerciseAreaForm.gameEnv);
        LoadMap(aGeoset, ExerciseAreaForm.gameEnv.FGameArea);

        Map1.Zoom := LastZoom;
        Map1.CenterX := LastCenterX;
        Map1.CenterY := LastCenterY;
      end;
    end;
    sRuler:
    begin
      if btnRuler.Hint = 'show ruler' then
      begin
        btnRuler.ImageIndex  := 1;
        btnRuler.Hint := 'hide ruler';
        Map1.CurrentTool := TOOL_DISTANCE;

      end
      else
      begin
        btnRuler.ImageIndex  := 0;
        btnArrow.ImageIndex := 1;
        btnRuler.Hint := 'show ruler';

        Map1.CurrentTool := miArrowTool;
        aRuler.Visible := False;
        Map1.Repaint;
      end;
    end;
    sMulti:
    begin
      btnMulti.ImageIndex := 1;
      Map1.CurrentTool := TOOL_MULTISELECT;
      btnRuler.Hint := 'show ruler';

    end;
    sPlatformView:
    begin
      mniStaticSymbolMode1.Checked := False;
      mniDinamicViewMode1.Checked := False;
      mniDimensionSymbolMode1.Checked := False;

      if btnPlatformView.Hint = 'Static View' then
      begin
        btnPlatformView.ImageIndex := 1;
        btnPlatformView.Hint := 'Dynamic View';
        PlatformViewMode := False;
        FModeTag := 1;
         mniDinamicViewMode1.Checked := True;
      end
      else if btnPlatformView.Hint = 'Dynamic View' then
      begin
        btnPlatformView.ImageIndex := 2;
        btnPlatformView.Hint := 'Platform View';
        PlatformViewMode := True;
        FModeTag := 2;
        mniDimensionSymbolMode1.Checked := True;
      end
      else
      begin
        btnPlatformView.ImageIndex := 0;
        btnPlatformView.Hint := 'Static View';
        PlatformViewMode := False;
        FModeTag := 0;
        mniStaticSymbolMode1.Checked := True;
      end;

      Map1.CurrentTool := miArrowTool;
      btnRuler.Hint := 'show ruler';

      Map1.Repaint;
    end;
  end;

end;

procedure TfrmAdminMainForm.orpedo1Click(Sender: TObject);
begin
//  frmAdminMainForm.index := 2;
//  frmAdminMainForm.fromDBeditor := True;
//  fWeaponSingle.ShowModal;

  if not Assigned(frmAvailableTorpedo) then
    frmAvailableTorpedo := TfrmAvailableTorpedo.Create(self);

  frmAvailableTorpedo.Show;
end;

procedure TfrmAdminMainForm.owedJammerDecoy1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 6;
//  fCountermeasureSingle.ShowModal;
end;

procedure TfrmAdminMainForm.Personel1Click(Sender: TObject);
begin
  fmGroupPersonel.Show;
end;

procedure TfrmAdminMainForm.Plotting1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 11;
end;

procedure TfrmAdminMainForm.PredefinedPatterns1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 2;
end;

procedure TfrmAdminMainForm.Radar1Click(Sender: TObject);
begin
 frmAvailableRadar.ShowModal;
end;

procedure TfrmAdminMainForm.RadarActivationIntervals1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 3;
end;

procedure TfrmAdminMainForm.RadarNoiseJammer1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 7;
//  fCountermeasureSingle.ShowModal;
end;

procedure TfrmAdminMainForm.refreshMultiMode;
begin
  //=== refresh MultiMode ===
  ListPlatformSelect.Clear;
  IsInRect := False;
  RectMulti.Left := 0;
  RectMulti.Top := 0;
  RectMulti.Right := 0;
  RectMulti.Bottom := 0;
  aMultiSelect.FStartPoint.X := 0;
  aMultiSelect.FStartPoint.Y := 0;
  aMultiSelect.FEndPoint.X := 0;
  aMultiSelect.FEndPoint.Y := 0;
end;

procedure TfrmAdminMainForm.ReportEditor1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 8;
end;

procedure TfrmAdminMainForm.ReportViewer1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 9;
end;

procedure TfrmAdminMainForm.EmbarkCapability1Click(Sender: TObject);
begin
//  frmTransportPickList.PageFrom := 0 ; // main
//  frmTransportPickList.ShowModal;
end;

procedure TfrmAdminMainForm.EmbarkLibrary1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 10;
end;

procedure TfrmAdminMainForm.ResourceAllocation1Click(Sender: TObject);
begin
 frmAvailableResourceAllocation.ShowModal;
end;

procedure TfrmAdminMainForm.Ruler1Click(Sender: TObject);
begin
  OnClick_ToolButton(btnRuler);
end;

procedure TfrmAdminMainForm.RuntimePlatformLibrary1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 1;
  frmAdminMainForm.fromDBeditor := True;
end;

procedure TfrmAdminMainForm.Satellite1Click(Sender: TObject);
begin
  SatelliteListForm.ShowModal;
end;

procedure TfrmAdminMainForm.saveResource; // procedure ini digunakan untuk menyimpan data platform saja
var
  i, IDRA : Integer;
  aPlatformInst : TPlatform_Instance;
  aForce : string;
begin
  SIMMgr.Platform_Insts.Clear;
  lvPlatform.Clear;

  if Assigned(fInputName.PlatformVecList) then
  begin
    PlatformInstList.Clear;

    for I := 0 to fInputName.PlatformVecList.Count - 1 do
    begin
      aPlatformInst := TPlatform_Instance(fInputName.PlatformVecList.Items[i]);

      if isNew then
        aPlatformInst.FData.Resource_Alloc_Index := RA_index
      else
      begin
        aPlatformInst.FData.Resource_Alloc_Index :=
        TResource_Allocation(ResourceAllocationList.Items[0]).FData.Resource_Alloc_Index;
      end;

      if Assigned(PlatformInstList) then
      begin
        PlatformInstList.Add(aPlatformInst);
      end;

      SIMMgr.Platform_Insts.Add(aPlatformInst);

    end;

//     SIMMgr.Platform_Insts.Sort(compareByForce);  //sorting
//    SIMMgr.Platform_Insts.Sort(compareByName);  //sorting
    for I := 0 to SIMMgr.Platform_Insts.Count - 1 do
    begin
      with lvPlatform.Items.Add do
      begin
        Data := SIMMgr.Platform_Insts.Items[i];
        Caption := IntToStr(i + 1);
        SubItems.Add(TPlatform_Instance(SIMMgr.Platform_Insts.Items[i]).FData.Instance_Name);
        SubItems.Add(TPlatform_Instance(SIMMgr.Platform_Insts.Items[i]).FData.Track_ID);
        case TPlatform_Instance(SIMMgr.Platform_Insts.Items[i]).FData.Force_Designation of
          1 : aForce := 'Red';
          2 : aForce := 'Yellow';
          3 : aForce := 'Blue';
          4 : aForce := 'Green';
          5 : aForce := 'White';
          6 : aForce := 'No Force';
        end;

        SubItems.Add(aForce);
      end;
    end;

  end;
  if isNew then
  begin
    dmTTT.GetMaxResource_Allocation(IDRA); // gak jadi dipakai ^_^
//    frmSummaryScenario.Scenario.FData.Resource_Alloc_Index := RA_index;//IDRA;
  end;
//==============================================================================

//  fPlatformDeploytment.LoadPlatformInstanceAct;

end;

procedure TfrmAdminMainForm.Scenario1Click(Sender: TObject);
begin
 frmAvailableScenario.showModal;
end;

procedure TfrmAdminMainForm.ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  pnlLeft.ScrollBy(0, lastPosition - ScrollPos);

  lastPosition := ScrollPos;

end;

procedure TfrmAdminMainForm.ScrollBar2Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  pnlButtom.ScrollBy(lastPositionButtom - ScrollPos, 0);

  lastPositionButtom := ScrollPos;
end;

procedure TfrmAdminMainForm.SelfDefensiveJammer1Click(Sender: TObject);
begin
  frmAdminMainForm.index := 5;
//  fCountermeasureSingle.ShowModal;
end;

procedure TfrmAdminMainForm.SetButtonImage;
var
  Bmap    : TBitmap;
  strPath : string;
begin
  strPath := '.\data\Image DBEditor\Tools\';


  { Tool Button }
  { Zoom Center}
  ImListCenter := TImageList.Create(nil);
  ImListCenter.Width  := btnCenter.Width;
  ImListCenter.Height := btnCenter.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_06.bmp');
  finally
    ImListCenter.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_06_down.bmp');
  finally
    ImListCenter.Add(Bmap, nil);
    Bmap.Free;
  end;
  btnCenter.ImageList  := ImListCenter;
  btnCenter.ImageIndex := 0;


  { Zoom Out}
  ImListZoomOut := TImageList.Create(nil);
  ImListZoomOut.Width  := btnZoomOut.Width;
  ImListZoomOut.Height := btnZoomOut.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_03.bmp');
  finally
    ImListZoomOut.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_03_down.bmp');
  finally
    ImListZoomOut.Add(Bmap, nil);
    Bmap.Free;
  end;
  btnZoomOut.ImageList  := ImListZoomOut;
  btnZoomOut.ImageIndex := 0;

  { Zoom In}
  ImListZoomIn := TImageList.Create(nil);
  ImListZoomIn.Width  := btnZoomIn.Width;
  ImListZoomIn.Height := btnZoomIn.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_04.bmp');
  finally
    ImListZoomIn.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_04_down.bmp');
  finally
    ImListZoomIn.Add(Bmap, nil);
    Bmap.Free;
  end;
  btnZoomIn.ImageList  := ImListZoomIn;
  btnZoomIn.ImageIndex := 0;

  { Select Arrow }
  ImListArrow := TImageList.Create(nil);
  ImListArrow.Width  := btnArrow.Width;
  ImListArrow.Height := btnArrow.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_01.bmp');
  finally
    ImListArrow.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_01_down.bmp');
  finally
    ImListArrow.Add(Bmap, nil);
    Bmap.Free;
  end;
  btnArrow.ImageList  := ImListArrow;
  btnArrow.ImageIndex := 0;

  { Hand }
  ImListHand := TImageList.Create(nil);
  ImListHand.Width  := btnHand.Width;
  ImListHand.Height := btnHand.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_02.bmp');
  finally
    ImListHand.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_02_down.bmp');
  finally
    ImListHand.Add(Bmap, nil);
    Bmap.Free;
  end;
  btnHand.ImageList  := ImListHand;
  btnHand.ImageIndex := 0;

  { AirMap }
  ImListAirMap := TImageList.Create(nil);
  ImListAirMap.Width  := btnAirMap.Width;
  ImListAirMap.Height := btnAirMap.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + '23_on.bmp');
  finally
    ImListAirMap.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + '23_Down.bmp');
  finally
    ImListAirMap.Add(Bmap, nil);
    Bmap.Free;
  end;
  btnAirMap.ImageList  := ImListAirMap;
  btnAirMap.ImageIndex := 0;

  { LandMap }
  ImListLandMap := TImageList.Create(nil);
  ImListLandMap.Width  := btnLandMap.Width;
  ImListLandMap.Height := btnLandMap.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + '24_on.bmp');
  finally
    ImListLandMap.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + '24_Down.bmp');
  finally
    ImListLandMap.Add(Bmap, nil);
    Bmap.Free;
  end;
  btnLandMap.ImageList  := ImListLandMap;
  btnLandMap.ImageIndex := 0;

  { SeaMap }
  ImListSeaMap := TImageList.Create(nil);
  ImListSeaMap.Width  := btnSeaMap.Width;
  ImListSeaMap.Height := btnSeaMap.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + '25_on.bmp');
  finally
    ImListSeaMap.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + '25_Down.bmp');
  finally
    ImListSeaMap.Add(Bmap, nil);
    Bmap.Free;
  end;
  btnSeaMap.ImageList  := ImListSeaMap;
  btnSeaMap.ImageIndex := 0;


  { Ruler }
  ImListRuler := TImageList.Create(nil);
  ImListRuler.Width  := btnRuler.Width;
  ImListRuler.Height := btnRuler.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_10.bmp');
  finally
    ImListRuler.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_10_down.bmp');
  finally
    ImListRuler.Add(Bmap, nil);
    Bmap.Free;
  end;
  btnRuler.ImageList  := ImListRuler;
  btnRuler.ImageIndex := 0;


  {multi}
  ImListMulti := TImageList.Create(nil);
  ImListMulti.Width := btnMulti.Width;
  ImListMulti.Height := btnMulti.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_11.bmp');
  finally
    ImListMulti.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_11_down.bmp');
  finally
    ImListMulti.Add(Bmap, nil);
    Bmap.Free;
  end;
  btnMulti.ImageList := ImListMulti;
  btnMulti.ImageIndex := 0;

  {move}
  ImgListMove := TImageList.Create(nil);
  ImgListMove.Width := btnMove.Width;
  ImgListMove.Height := btnMove.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_13.bmp');
  finally
    ImgListMove.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_13_down.bmp');
  finally
    ImgListMove.Add(Bmap, nil);
    Bmap.Free;
  end;
  btnMove.ImageList := ImgListMove;
  btnMove.ImageIndex := 0;

  {platform view}
  ImgListPlatformView := TImageList.Create(nil);
  ImgListPlatformView.Width := btnPlatformView.Width;
  ImgListPlatformView.Height := btnPlatformView.Height;
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_12.bmp');
  finally
    ImgListPlatformView.Add(Bmap, nil);
    Bmap.Free;
  end;
//==================ini sementara, nunggu gambar dari mas didik dulu============
  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_12.bmp');
  finally
    ImgListPlatformView.Add(Bmap, nil);
    Bmap.Free;
  end;

  try
    Bmap := TBitmap.Create;
    Bmap.LoadFromFile(strPath + 'button tool_12.bmp');
  finally
    ImgListPlatformView.Add(Bmap, nil);
    Bmap.Free;
  end;
//==============================================================================
  btnPlatformView.ImageList := ImgListPlatformView;
  btnPlatformView.ImageIndex := 0;

  {setDefault to Select Hand }
  SetDefaultMapTool;
end;

procedure TfrmAdminMainForm.SetDefaultMapTool;
begin
  btnCenter.ImageIndex   := 0;
  btnZoomOut.ImageIndex  := 0;
  btnZoomIn.ImageIndex   := 0;
  btnArrow.ImageIndex    := 0;
  btnHand.ImageIndex     := 0;
  btnAirMap.ImageIndex   := 1;
  btnLandMap.ImageIndex  := 0;
  btnSeaMap.ImageIndex   := 0;
  btnRuler.ImageIndex    := 0;
  btnMulti.ImageIndex    := 0;
  btnPlatformView.ImageIndex := 0;

  btnHand.ImageIndex  := 1;
  FToolSelected       := sHand;
  map1.CurrentTool    := miPanTool;

end;

procedure TfrmAdminMainForm.SetEventhandler;
begin
   { Tool Button }
  Map1.CreateCustomTool(TOOL_POSITION, miToolTypePoint, miCrossCursor, miCrossCursor);
  Map1.CreateCustomTool(TOOL_DISTANCE, miToolTypePoint, miCrossCursor, miCrossCursor);
  Map1.CreateCustomTool(TOOL_MULTISELECT, miToolTypePoint, miSelectCursor, miSelectCursor);
  Map1.CreateCustomTool(TOOL_EDIT_WAYPOINT, miToolTypePoint, miCrossCursor, miCrossCursor);
  Map1.CreateCustomTool(TOOL_ADD_WAYPOINT, miToolTypePoint, miCrossCursor, miCrossCursor);
  Map1.CreateCustomTool(TOOL_ADD_TARGET, miToolTypePoint, miCrossCursor, miCrossCursor);
  Map1.CreateCustomTool(TOOL_MOVE_PLATFORM, miToolTypePoint, miSelectPlusCursor, miSelectPlusCursor);

  btnHand.Tag           := 0;
  btnArrow.Tag          := 1;
  btnZoomIn.Tag         := 2;
  btnZoomOut.Tag        := 3;
  btnCenter.Tag         := 4;
  btnAirMap.Tag         := 5;
  btnLandMap.Tag        := 6;
  btnSeaMap.Tag         := 7;
  btnRuler.Tag          := 8;
  btnMulti.Tag          := 9;
  btnPlatformView.Tag   := 10;
  btnMove.Tag           := 11;

  btnHand.OnClick       := OnClick_ToolButton;
  btnArrow.OnClick      := OnClick_ToolButton;
  btnZoomIn.OnClick     := OnClick_ToolButton;
  btnZoomOut.OnClick    := OnClick_ToolButton;
  btnCenter.OnClick     := OnClick_ToolButton;
  btnAirMap.OnClick     := OnClick_ToolButton;
  btnLandMap.OnClick    := OnClick_ToolButton;
  btnSeaMap.OnClick     := OnClick_ToolButton;
  btnRuler.OnClick      := OnClick_ToolButton;
  btnMulti.OnClick      := OnClick_ToolButton;
  btnPlatformView.OnClick := OnClick_ToolButton;
  btnMove.OnClick         := OnClick_ToolButton;
end;
end.
