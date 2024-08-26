unit ufTacticalDisplay;

interface

uses

  Tlhelp32, ShellAPI,MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uTMapTouch2,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, OleCtrls, Menus,
  ToolWin, ImgList, uDBAssetObject, uDBScenario,
  ActnMan, uSimObjects, tttData, uT3GroupList,
  VrControls, uLaunchPlatform,
  ufmWeapon, ufmCounterMeasure, ufmFireControl, ufmEMCON, ufmLogisticCalculation,
  uGameData_TTT, uT3Unit, uT3Vehicle, uDBAsset_Vehicle, ufLog, uT3Weapon,
  uT3Missile, uT3Torpedo, uOverlayTemplateEditor, uSettingCoordinate,
  uT3DetectedTrack, VrAnalog, uT3CounterMeasure, uT3MissileDetail,
  uT3MissileEnvironment, uLogisticCalculation,
  uMainStrategi, uLogisticChange, uDrawOverlay, ufmMapWindow, ufmSensor,
  ufmPlatformGuidance, ufmControlled, ufmOwnShip,
  uChangeSonobuoyDepth, uChangeSonobuoyEndurance, uTransferSonobuoy,
  uChangeTorpedoDepth, uChangeTorpedoCourse,  uRotateMonitor,
  uSlidingTrans, Keyboard, ufmTimeOfRaid,inifiles, Printers,

  //wasdal ui
  ufrmRight, ufrmTop, ufrmViewWasdal, ufrmLaunchRPCount, uDataModuleTTT, uDBAsset_Runtime_Platform_Library,

  //plotter ui
  ufrmRightToolsPlotter, ufrmLeftToolsPlotter, ufrmTopPlotter,

  ufrmGunAutoManual, VrWheel, uT3GroupVehicle, frmGroupName, RzButton, jpeg,
  System.ImageList, Vcl.Imaging.pngimage, RzBmpBtn;


type

  TTrackBar = class(ComCtrls.TTrackBar)
  private
    FSelectValueSymbol : Boolean;
  protected
    property OnMouseDown;
    property OnMouseUp;
  end;

  TfrmTacticalDisplay = class(TForm)
    btnhelp : TToolButton;
    btnSeparator6: TToolButton;
    btnSeparator1: TToolButton;
    btn6 : TToolButton;
    btn7 : TToolButton;

    pnlTop: TPanel;
    pnlLeft: TPanel;
    pnlBottom: TPanel;
    MainMenu1: TMainMenu;
    View1: TMenuItem;
    Display1: TMenuItem;
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
    Tools1: TMenuItem;
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
    lbFormation: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    StaticText1: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
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
    btnFullScreen: TToolButton;
    ToolButton2: TToolButton;
    btnDecreaseScale: TToolButton;
    btnIncreaseScale: TToolButton;
    btnZoom: TToolButton;
    btnCentreOnHook: TToolButton;
    btnCentreOnGameCentre: TToolButton;
    btnSeparator3: TToolButton;
    btnPan: TToolButton;
    btnFilterRangeRings: TToolButton;
    btnRangeRingsOnHook: TToolButton;
    btnHookPrevious: TToolButton;
    btnHookNext: TToolButton;
    btnAddToTrackTable: TToolButton;
    btnSeparator4: TToolButton;
    btnRemoveFromTrackTable: TToolButton;
    btnAssumeControlOfHook: TToolButton;
    btnSeparator5: TToolButton;
    btnEdit: TToolButton;
    btnTrackHistory: TToolButton;
    btnSeparator7: TToolButton;
    cbAssumeControl: TComboBox;
    btnToolAddMine: TToolButton;
    btnRemoveSonobuoy: TToolButton;
    btnSeparator8: TToolButton;
    btnTransferSonobuoy: TToolButton;
    btnGameFreeze: TToolButton;
    btnStartGame: TToolButton;
    btnDoubleSpeed: TToolButton;
    btnMonitorStudent: TToolButton;
    btnAnnotate: TToolButton;
    btnSnapshot: TToolButton;
    btnAddPlatform: TToolButton;
    btnRemovePlatformOrTrack: TToolButton;
    btnFilterCursor: TToolButton;
    btnAnchorCursor: TToolButton;
    btnOptions: TToolButton;
    btnContents: TToolButton;
    btnMerge: TToolButton;
    btnSplit: TToolButton;
    Panel1: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    lbCourseHooked: TLabel;
    lbSpeedHooked: TLabel;
    Label60: TLabel;
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
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label35: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    btnSeparator2: TToolButton;
    StaticText25: TStaticText;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    StaticText30: TStaticText;
    StaticText31: TStaticText;
    StaticText32: TStaticText;
    StaticText33: TStaticText;
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
    fmOwnShip1: TfmOwnShip;
    fmPlatformGuidance1: TfmPlatformGuidance;
    fmWeapon1: TfmWeapon;
    fmCounterMeasure1: TfmCounterMeasure;
    fmFireControl1: TfmFireControl;
    fmSensor1: TfmSensor;
    pmPopupMenu1: TPopupMenu;
    mniStandardPoint1: TMenuItem;
    mniAir1: TMenuItem;
    mniSurface1: TMenuItem;
    mniSubsurface1: TMenuItem;
    mniLand1: TMenuItem;
    mniNewStandardBearing1: TMenuItem;
    mniAir2: TMenuItem;
    mniSurface2: TMenuItem;
    mniSubsurface2: TMenuItem;
    mniLand2: TMenuItem;
    mniGeneral1: TMenuItem;
    mniNewStandard1: TMenuItem;
    mniAir3: TMenuItem;
    mniSurface3: TMenuItem;
    mniSubsurface3: TMenuItem;
    mniLand3: TMenuItem;
    N1: TMenuItem;
    mniNewSpecialPointGeneral1: TMenuItem;
    mniGeneral2: TMenuItem;
    mniBouy1: TMenuItem;
    mniDatalinkReferencePoint1: TMenuItem;
    mniDesse1: TMenuItem;
    mniESM1: TMenuItem;
    mniGroundZero1: TMenuItem;
    mniManInWater1: TMenuItem;
    mniMaritimeHeadquarter1: TMenuItem;
    mniMineHazard1: TMenuItem;
    mniNavigationalHazard1: TMenuItem;
    mniOilRig1: TMenuItem;
    mniStation1: TMenuItem;
    mniTracticalGridOriginal1: TMenuItem;
    mniNewSpecialPointAir1: TMenuItem;
    mniAirGeneral1: TMenuItem;
    mniAirborneEarlyWarning1: TMenuItem;
    mniBullseye1: TMenuItem;
    mniCombatAirPatrol1: TMenuItem;
    mniDitchedAircraft1: TMenuItem;
    mniGate1: TMenuItem;
    mniNewSpecialPointASW1: TMenuItem;
    mniASWGeneral1: TMenuItem;
    mniBriefContact1: TMenuItem;
    mniDatum1: TMenuItem;
    mniKingpin1: TMenuItem;
    mniRiser1: TMenuItem;
    mniSearchCentre1: TMenuItem;
    mniSinker1: TMenuItem;
    mniWeaponEntryPoint1: TMenuItem;
    mniWreck1: TMenuItem;
    N2: TMenuItem;
    mniConvertRTtoNRT1: TMenuItem;
    N3: TMenuItem;
    mniCharacteristic1: TMenuItem;
    mniDomain1: TMenuItem;
    mniAir4: TMenuItem;
    mniSurface4: TMenuItem;
    mniSubsurface4: TMenuItem;
    mniLand4: TMenuItem;
    mniGeneral4: TMenuItem;
    mniIdentity1: TMenuItem;
    mniPending1: TMenuItem;
    mniUnknowns1: TMenuItem;
    mniAssumedFriend1: TMenuItem;
    mniFriend1: TMenuItem;
    mniNeutral1: TMenuItem;
    mniSuspect1: TMenuItem;
    mniHostile1: TMenuItem;
    mniPlatformType1: TMenuItem;
    mniAircraftCarrier1: TMenuItem;
    mniAmphibius1: TMenuItem;
    mniAuxiliary1: TMenuItem;
    mniChaff1: TMenuItem;
    mniCruiserGuidedMissileCGCGN1: TMenuItem;
    mniDestroyer1: TMenuItem;
    mniDestroyerGuidedMissle1: TMenuItem;
    mniFrigateFF1: TMenuItem;
    mniFrigateGuidedMissleFFG1: TMenuItem;
    mniInfra1: TMenuItem;
    mniJammerDecoy1: TMenuItem;
    mniMerchant1: TMenuItem;
    mniPropulsionType1: TMenuItem;
    N5: TMenuItem;
    mniEdit1: TMenuItem;
    mniMerge1: TMenuItem;
    mniSplit1: TMenuItem;
    mniDatalink1: TMenuItem;
    mniTo1: TMenuItem;
    mniFrom1: TMenuItem;
    mniTrackNumber1: TMenuItem;
    mniAutomatic1: TMenuItem;
    mniManual1: TMenuItem;
    mniTrackHistory1: TMenuItem;
    mniIntiate1: TMenuItem;
    mniBreakAllFireControl1: TMenuItem;
    mniClearRing1: TMenuItem;
    mniRemove1: TMenuItem;
    N10: TMenuItem;
    mniCentre1: TMenuItem;
    mniRangeRing1: TMenuItem;
    mniTrackTable1: TMenuItem;
    mniAdd1: TMenuItem;
    mniRemove2: TMenuItem;
    mniAnchor1: TMenuItem;
    imglistPM: TImageList;
    mniMainwarfare1: TMenuItem;
    mniPatrolCraftPTPTG1: TMenuItem;
    mniUtilityVessel1: TMenuItem;
    mniOther1: TMenuItem;
    lb3: TStaticText;
    lbDamage: TLabel;
    lb7: TStaticText;
    lb8: TLabel;
    VrAnalogClock1: TVrAnalogClock;
    Image1: TImage;
    imgListButton: TImageList;
    Label10: TLabel;
    Label21: TLabel;
    pnlStatusRed: TPanel;
    pnlStatusYellow: TPanel;
    Pending1: TMenuItem;
    Unknown1: TMenuItem;
    AssumedFriend1: TMenuItem;
    Friend1: TMenuItem;
    Neutral1: TMenuItem;
    Suspect1: TMenuItem;
    Hostile1: TMenuItem;
    AircraftCarrierCVCVN1: TMenuItem;
    AmphibiousWarfare1: TMenuItem;
    Auxiliary1: TMenuItem;
    Chaff1: TMenuItem;
    CruiserGuidedMissileCGCGN1: TMenuItem;
    Destroyer1: TMenuItem;
    DestroyerGuidedMissileDOG1: TMenuItem;
    FrigateFF1: TMenuItem;
    FrigateGuidedMissileFFG1: TMenuItem;
    InfraredDecoy1: TMenuItem;
    JammerDecoy1: TMenuItem;
    Merchant1: TMenuItem;
    MainWarfare1: TMenuItem;
    PatrolCraftPTPTG1: TMenuItem;
    UtilityVessel1: TMenuItem;
    Other1: TMenuItem;
    mniSonobuoys: TMenuItem;
    Platform1: TMenuItem;
    mniOperatingMode: TMenuItem;
    mniDepth: TMenuItem;
    mniEndurance: TMenuItem;
    N12: TMenuItem;
    mniMonitor: TMenuItem;
    N13: TMenuItem;
    mniDestroy: TMenuItem;
    Active1: TMenuItem;
    Passive1: TMenuItem;
    Off1: TMenuItem;
    Add2: TMenuItem;
    Remove3: TMenuItem;
    ransfer1: TMenuItem;
    Label22: TLabel;
    tmMove: TTimer;
    pnlInfoDepth: TPanel;
    StaticText23: TStaticText;
    StaticText22: TStaticText;
    mniTorpedo: TMenuItem;
    mniTorpedoCourse: TMenuItem;
    mniTorpedoDepth: TMenuItem;
    btnMultiMode: TToolButton;
    btnSelectPlatform: TToolButton;
    Logistic1: TMenuItem;
    SettingStrategies1: TMenuItem;
    btnSeparator9: TToolButton;
    btnAirMap: TToolButton;
    btnLandMap: TToolButton;
    btnSeaMap: TToolButton;
    btnLayerTool: TToolButton;
    btnInfoTool: TToolButton;
    btnCom: TToolButton;
    btnToolBtnSlide: TToolButton;
    fmEMCON1: TfmEMCON;
    btnLogistic: TToolButton;
    btnPlotting: TToolButton;
    ImageList3: TImageList;
    pmOverlayEdit: TPopupMenu;
    mniControl: TMenuItem;
    mnitoFront: TMenuItem;
    mnitoBack: TMenuItem;
    MenuItem1: TMenuItem;
    mniDelete: TMenuItem;
    Panel3: TPanel;
    toolbar4: TToolBar;
    btnCentreOnGameCentre2D: TToolButton;
    btnPan2D: TToolButton;
    btnFilterRangeRings2D: TToolButton;
    btnAirMap_2D: TToolButton;
    btnLandMap_2D: TToolButton;
    btnSeaMap_2D: TToolButton;
    btnLayerTool2D: TToolButton;
    btnInfo2D: TToolButton;
    PlatformView1: TMenuItem;
    acticalInfoSet1: TMenuItem;
    mniRamp1: TMenuItem;
    Open: TMenuItem;
    Close: TMenuItem;
    btnTacticalSymbolViewMode: TToolButton;
    btnTacticalInfoSet: TToolButton;
    btnTacticalSymbolViewMode2D: TToolButton;
    btnTacticalInfoSet2D: TToolButton;
    btnSeparator10: TToolButton;
    btnOverlay: TToolButton;
    pmPlotting  : TPopupMenu;
    miPlottingEdit: TMenuItem;
    miPlottingShow: TMenuItem;
    N15: TMenuItem;
    miPlottingNew: TMenuItem;
    miPlottingDelete: TMenuItem;
    btnSparator12: TToolButton;
    mniChangeCourse1: TMenuItem;
    btnBrowse: TToolButton;
    btnTimeOfRaid: TToolButton;
    btnMinimap: TToolButton;

//    File1: TMenuItem;
//    Saveasplotting1: TMenuItem;
//    Saveasplottingtodatabase1: TMenuItem;
//    Saveasplottingtoscenario1: TMenuItem;


    pmbase: TPopupMenu;
    miSHowBase: TMenuItem;
    File1: TMenuItem;
    SaveAsPlotting1: TMenuItem;
    SaveAsToDatabase1: TMenuItem;
    SaveAsToScenario1: TMenuItem;
    mniSavescenario1: TMenuItem;
    mniSaveScenarioAs1: TMenuItem;
    SaveAsOverlay1: TMenuItem;
    SaveAsOverlaytoDatabase1: TMenuItem;
    SaveAsOverlaytoScenario1: TMenuItem;
    btnZoom2D: TToolButton;
    btnIncreaseScale2D: TToolButton;
    btnPin2d: TToolButton;
    btnDecreaseScale2d: TToolButton;
    cbSetScale2D: TComboBox;
    btn16: TToolButton;
    btnVwTote2d: TToolButton;
    btnSparator13: TToolButton;
    btnSparator14: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton20: TToolButton;
    btnSparator15: TToolButton;
    btnMiniMap2D: TToolButton;
    pnlRight: TPanel;
    btnCameraCtrlView2D: TToolButton;
    lvPlatformlist: TListView;
    Label23: TLabel;
    btnTrackHistory2D: TToolButton;
    btnBrowse2D: TToolButton;
    btnDDay2D: TToolButton;
    btnOverlay2D: TToolButton;
    btnCentreOnHook2D: TToolButton;
    btn20: TToolButton;
    btnPlotting2D: TToolButton;
    Label24: TLabel;
    bvl1: TBevel;
    lbl1: TLabel;
    lblUTM: TLabel;
    lblMGRS: TLabel;
    mniReleasePlatform1: TMenuItem;
    btnCamFree: TSpeedButton;
    btnCamAttach: TSpeedButton;
    btnCamLookAt: TSpeedButton;
    lblTerrain: TLabel;
    cbbTerrain: TComboBox;
    lblLatitude: TLabel;
    lblLongitude: TLabel;
    btnTrackPos: TSpeedButton;
    edtLongitude: TEdit;
    edtLatitude: TEdit;
    btnNormalVision: TSpeedButton;
    btnNightVision: TSpeedButton;
    grpPositionFromPlatform: TGroupBox;
    vrwhlPositionAzimuth: TVrWheel;
    lblPositionAzimuth: TLabel;
    lblPositionRange: TLabel;
    bvlPosition: TBevel;
    lblPositionElevation: TLabel;
    lblMaxPositionElevation: TLabel;
    lblMinPositionElevation: TLabel;
    lblMaxPositionRange: TLabel;
    lblMinPositionRange: TLabel;
    trckbrPositionRange: TTrackBar;
    edtPositionAzimuth: TEdit;
    edtPositionRange: TEdit;
    trckbrPositionElevation: TTrackBar;
    edtPositionElevation: TEdit;
    chkControlCam: TCheckBox;
    pmSymbolTaktis: TPopupMenu;
    mniStaticSymbol: TMenuItem;
    mniDinamicSymbol: TMenuItem;
    mniDimension: TMenuItem;
    lvTrackTable: TListView;
    lvTrackControl: TListView;
    pmTrackControl: TPopupMenu;
    Delete1: TMenuItem;
    ViewMember1: TMenuItem;
    DynamicviewMenBar: TMenuItem;
    StatciviewMenBar: TMenuItem;
    DimensionMenBar: TMenuItem;
    btnSeparator11: TToolButton;
    Game1: TMenuItem;
    Freeze: TMenuItem;
    StandardSpeed: TMenuItem;
    GotoTime: TMenuItem;
    N16: TMenuItem;
    Snapshot: TMenuItem;
    Standard: TMenuItem;
    DoubleCurrent1: TMenuItem;
    MonitorStudent: TMenuItem;
    DDay1: TMenuItem;
    Options: TMenuItem;
    N17: TMenuItem;
    Map: TMenuItem;
    mnFullScreen1: TMenuItem;
    Scale1: TMenuItem;
    Centre1: TMenuItem;
    RangeRings1: TMenuItem;
    Increase1: TMenuItem;
    Decrease1: TMenuItem;
    Zoom1: TMenuItem;
    OnHookedTrack2: TMenuItem;
    OnGameCentre1: TMenuItem;
    Pan1: TMenuItem;
    Settings2: TMenuItem;
    FilterRange1: TMenuItem;
    OnHookedTrack1: TMenuItem;
    N14: TMenuItem;
    MiniMap1: TMenuItem;
    MapTemplate1: TMenuItem;
    GameArea1: TMenuItem;
    GameArea2: TMenuItem;
    GameArea3: TMenuItem;
    LayerTool1: TMenuItem;
    BrowseMap1: TMenuItem;
    Cursor2: TMenuItem;
    Filter1: TMenuItem;
    Anchor2: TMenuItem;
    Multiselect1: TMenuItem;
    AddMine1: TMenuItem;
    RuntimePlatform1: TMenuItem;
    Toolbars1: TMenuItem;
    N19: TMenuItem;
    dlgPnt1: TPrintDialog;
    mniPrintCurrentMap1: TMenuItem;
    pnlMenubar: TPanel;
    btnRangeRingsOnHook2D: TToolButton;
    btnSs: TToolButton;
    btnSs2D: TToolButton;
    pnlHook: TPanel;
    pnlDetails: TPanel;
    pnlDetection: TPanel;
    pnlIFF: TPanel;
    ImageList5: TImageList;
    pnlpgcControl: TPanel;
    pnlTabTrackTable: TPanel;
    pnlTabTrackControl: TPanel;
    pnlTrackTable: TPanel;
    pnlTrackControl: TPanel;
    pnlHookContactInfoTraineeDisplay: TPanel;
    pnlTabHook: TPanel;
    pnlTabDetails: TPanel;
    pnlTabDetection: TPanel;
    pnlTabIFF: TPanel;
    pnlContentIFF: TPanel;
    pnlContentHook: TPanel;
    pnlContentDetails: TPanel;
    pnlContentDetection: TPanel;
    pnlTacticalDisplayControlPanel: TPanel;
    pnlTabOwnShip: TPanel;
    imgOwnShip: TImage;
    pnlTabPlatformGuidance: TPanel;
    imgPlatformGuidance: TImage;
    pnlTabWeapon: TPanel;
    imgWeapon: TImage;
    pnlTabCounterMeasure: TPanel;
    imgCounterMeasure: TImage;
    pnlTabEMCON: TPanel;
    imgEMCON: TImage;
    pnlTabFireControl: TPanel;
    imgFireControl: TImage;
    pnlTabSensor: TPanel;
    imgSensor: TImage;
    pnlOwnShip: TPanel;
    pnlWeapon: TPanel;
    pnlSensor: TPanel;
    pnlPlatformGuidance: TPanel;
    pnlFireControl: TPanel;
    pnlEMCON: TPanel;
    pnlCounterMeasure: TPanel;
    pnlTabPlatform: TPanel;
    pnlTabPosition: TPanel;
    pnlPlatform: TPanel;
    pnlPosition: TPanel;
    pnlMap: TPanel;
    txt1: TStaticText;
    lb5: TStaticText;
    lbAltitude: TLabel;
    lb4: TLabel;
    btnRuller: TToolButton;
    lbl2: TLabel;
    lbl3: TLabel;
    ImageList4: TImageList;

//    ToolBtnComm: TToolButton;

    procedure FormCreate(Sender: TObject);
    procedure lvTrackTableSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnPanClick(Sender: TObject);
    procedure cbSetScaleChange(Sender: TObject);
    procedure tbtnScaleDecreaseClick(Sender: TObject);
    procedure tbtnScaleIncreaseClick(Sender: TObject);
    procedure btnCentreOnHookClick(Sender: TObject);
    procedure OnHookedTrack2Click(Sender: TObject);
    procedure Settings2Click(Sender: TObject);
    procedure History2Click(Sender: TObject);
    procedure btnFullScreenClick(Sender: TObject);
    procedure hideBottomPanel(Sender: TObject);
    procedure CentreOnGameCentreClick(Sender: TObject);
    procedure Select1Click(Sender: TObject);
    procedure btnHookPreviousClick(Sender: TObject);
    procedure btnHookNextClick(Sender: TObject);
    procedure btnAddToTrackTableClick(Sender: TObject);
    procedure btnRemoveFromTrackTableClick(Sender: TObject);
    procedure btnFilterCursorClick(Sender: TObject);
    procedure btnAnchorCursorClick(Sender: TObject);
    procedure btnFilterRangeRingsClick(Sender: TObject);
    procedure btnRangeRingsOnHookClick(Sender: TObject);
    procedure btnZoomClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure cbAssumeControlChange(Sender: TObject);
    procedure btnTrackHistoryClick(Sender: TObject);
    procedure OnVisualShowClick(Sender: TObject);
    procedure btnAddPlatformClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MapViewChanged(Sender: TObject);
    procedure btnAssumeControlOfHookClick(Sender: TObject);
    procedure btnStartGameClick(Sender: TObject);
    procedure btnGameFreezeClick(Sender: TObject);
    procedure btnDoubleSpeedClick(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure fmPlatformGuidance1whHeadingChange(Sender: TObject);
    procedure fmPlatformGuidance1edtStraightLineOrderedHeadingKeyPress
      (Sender: TObject; var Key: Char);
    procedure fmPlatformGuidance1edtStraightLineOrderedGroundSpeedKeyPress
      (Sender: TObject; var Key: Char);
    procedure fmPlatformGuidance1edOrderAltitudeKeyPress(Sender: TObject;
      var Key: Char);
    procedure fmPlatformGuidance1btnWaypointClick(Sender: TObject);
    procedure fmPlatformGuidance1SpeedButton2Click(Sender: TObject);
    procedure fmOwnShip1btnLaunchClick(Sender: TObject);
    procedure btnRemovePlatformOrTrackClick(Sender: TObject);
    procedure fmPlatformGuidance1mnWaypoint1Click(Sender: TObject);
    procedure fmPlatformGuidance1mnCircleOnTrackClick(Sender: TObject);
    procedure OnRadarBtnClick(Sender: TObject);
    procedure OnSonarBtnClick(Sender: TObject);
    procedure OnSoonobuoyBtnClick(Sender: TObject);
    procedure fmWeapon1btnSurfaceToSurfaceMissileTargetTrackClick
      (Sender: TObject);
    procedure btnMADOnClick(Sender: TObject);
    procedure btnEOOnClick(Sender: TObject);
    procedure btnESMOnClick(Sender: TObject);
    procedure btnFireControlOnClick(Sender: TObject);
    procedure fmSensor1sbIFFInterrogatorControlModeOnClick(Sender: TObject);
    procedure fmSensor1cbbtnIFFInterrogatorMode1Click(Sender: TObject);
    procedure fmSensor1edtIFFInterrogatorMode1KeyPress(Sender: TObject;
      var Key: Char);
    procedure fmWeapon1btnSurfaceToAirTargetTrackClick(Sender: TObject);
    procedure fmWeapon1btnlWireGuidedTorpedoTargetTrackClick(Sender: TObject);
    procedure fmWeapon1btnWakeHomingTargetTrackClick(Sender: TObject);
    procedure fmWeapon1btnAirDroppesTargetTrackClick(Sender: TObject);
    procedure fmWeapon1btnDefaultAirDroppedSearchDepthClick(Sender: TObject);
    procedure fmWeapon1btnBombTargetClick(Sender: TObject);
    procedure fmWeapon1btnCIWSTargetTrackClick(Sender: TObject);
    procedure fmWeapon1btnMinesDeployClick(Sender: TObject);
    procedure fmWeapon1btnSurfaceToSurfaceMissileTargetTrackDetailsClick
      (Sender: TObject);
    procedure Tactical1Click(Sender: TObject);
    procedure Tote1Click(Sender: TObject);
    procedure btnGunCIWSOnCLick(Sender: TObject);
    procedure fmWeapon1btnTargetSearchClick(Sender: TObject);
    procedure fmWeapon1sbStraightRunningTorpedosDisplayRangeShowClick
      (Sender: TObject);
    procedure btnSnapshotClick(Sender: TObject);
    procedure mniCentre1Click(Sender: TObject);
    procedure mniRangeRing1Click(Sender: TObject);
    procedure mniAnchor1Click(Sender: TObject);
    procedure mniRemove1Click(Sender: TObject);
    procedure mniAir4Click(Sender: TObject);
    procedure mniSurface4Click(Sender: TObject);
    procedure mniSubsurface4Click(Sender: TObject);
    procedure mniLand4Click(Sender: TObject);
    procedure mniGeneral4Click(Sender: TObject);
    procedure mniPending1Click(Sender: TObject);
    procedure mniUnknowns1Click(Sender: TObject);
    procedure mniAssumedFriend1Click(Sender: TObject);
    procedure mniFriend1Click(Sender: TObject);
    procedure mniNeutral1Click(Sender: TObject);
    procedure mniSuspect1Click(Sender: TObject);
    procedure mniHostile1Click(Sender: TObject);
    procedure mniAircraftCarrier1Click(Sender: TObject);
    procedure mniAmphibius1Click(Sender: TObject);
    procedure mniAuxiliary1Click(Sender: TObject);
    procedure mniChaff1Click(Sender: TObject);
    procedure mniCruiserGuidedMissileCGCGN1Click(Sender: TObject);
    procedure mniDestroyer1Click(Sender: TObject);
    procedure mniDestroyerGuidedMissle1Click(Sender: TObject);
    procedure mniFrigateFF1Click(Sender: TObject);
    procedure mniFrigateGuidedMissleFFG1Click(Sender: TObject);
    procedure mniInfra1Click(Sender: TObject);
    procedure mniJammerDecoy1Click(Sender: TObject);
    procedure mniMerchant1Click(Sender: TObject);
    procedure mniMainwarfare1Click(Sender: TObject);
    procedure mniPatrolCraftPTPTG1Click(Sender: TObject);
    procedure mniUtilityVessel1Click(Sender: TObject);
    procedure mniOther1Click(Sender: TObject);
//    procedure mniEdit1Click(Sender: TObject);
    procedure mniManual1Click(Sender: TObject);
    procedure mniAir1Click(Sender: TObject);
    procedure mniMerge1Click(Sender: TObject);
    procedure mniSurface1Click(Sender: TObject);
    procedure mniSubsurface1Click(Sender: TObject);
    procedure mniLand1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure mniAir3Click(Sender: TObject);
    procedure mniSurface3Click(Sender: TObject);
    procedure mniSubsurface3Click(Sender: TObject);
    procedure mniLand3Click(Sender: TObject);
    procedure mniBouy1Click(Sender: TObject);
    procedure mniGeneral2Click(Sender: TObject);
    procedure mniDatalinkReferencePoint1Click(Sender: TObject);
    procedure mniDesse1Click(Sender: TObject);
    procedure mniESM1Click(Sender: TObject);
    procedure mniGroundZero1Click(Sender: TObject);
    procedure mniManInWater1Click(Sender: TObject);
    procedure mniMaritimeHeadquarter1Click(Sender: TObject);
    procedure mniMineHazard1Click(Sender: TObject);
    procedure mniNavigationalHazard1Click(Sender: TObject);
    procedure mniOilRig1Click(Sender: TObject);
    procedure mniStation1Click(Sender: TObject);
    procedure mniTracticalGridOriginal1Click(Sender: TObject);
    procedure mniAirGeneral1Click(Sender: TObject);
    procedure mniAirborneEarlyWarning1Click(Sender: TObject);
    procedure mniBullseye1Click(Sender: TObject);
    procedure mniCombatAirPatrol1Click(Sender: TObject);
    procedure mniDitchedAircraft1Click(Sender: TObject);
    procedure mniGate1Click(Sender: TObject);
    procedure mniASWGeneral1Click(Sender: TObject);
    procedure mniBriefContact1Click(Sender: TObject);
    procedure mniDatum1Click(Sender: TObject);
    procedure mniKingpin1Click(Sender: TObject);
    procedure mniRiser1Click(Sender: TObject);
    procedure mniSearchCentre1Click(Sender: TObject);
    procedure mniSinker1Click(Sender: TObject);
    procedure mniWeaponEntryPoint1Click(Sender: TObject);
    procedure mniWreck1Click(Sender: TObject);
    procedure mniAir2Click(Sender: TObject);
    procedure mniSurface2Click(Sender: TObject);
    procedure mniSubsurface2Click(Sender: TObject);
    procedure mniLand2Click(Sender: TObject);
    procedure mniGeneral1Click(Sender: TObject);
    procedure btnMonitorStudentClick(Sender: TObject);
    procedure mniAdd1Click(Sender: TObject);
    procedure mniRemove2Click(Sender: TObject);
//    procedure Overlays1Click(Sender: TObject);
    procedure mniAutomatic1Click(Sender: TObject);
    procedure fmWeapon1btnWeaponClick(Sender: TObject);
    procedure fmPlatformGuidance1mnHelm1Click(Sender: TObject);
    procedure fmPlatformGuidance1mnStraightLine1Click(Sender: TObject);
    procedure fmPlatformGuidance1mnCircleOnPosition1Click(Sender: TObject);
    procedure fmPlatformGuidance1mnZigzag1Click(Sender: TObject);
    procedure fmPlatformGuidance1mnSinuation1Click(Sender: TObject);
    procedure fmWeapon1sbChaffBlindZoneShowClick(Sender: TObject);
    procedure fmWeapon1btntControlGyroAdvisedClick(Sender: TObject);
    procedure fmWeapon1btnAcousticTorpedoLaunchClick(Sender: TObject);
    procedure fmSensor1sbESMSensorDisplayBlindZoneHideClick(Sender: TObject);
    procedure fmCounterMeasure1btnSurfaceChaffLaunchClick(Sender: TObject);
    procedure fmSensor1sbESMSensorControlModeOnClick(Sender: TObject);
    procedure fmWeapon1pnlLaunch1Click(Sender: TObject);
    procedure fmWeapon1pnlLaunch2Click(Sender: TObject);
    procedure fmWeapon1pnlLaunch3Click(Sender: TObject);
    procedure fmWeapon1pnlLaunch4Click(Sender: TObject);
    procedure fmFireControl1btnSearchFireControlAssetsTargetClick(
      Sender: TObject);
    procedure btnMergeClick(Sender: TObject);
    procedure btnSplitClick(Sender: TObject);
    procedure TacticalDisplayControlPanelChange(Sender: TObject);
	procedure Filters1Click(Sender: TObject);
    procedure fmPlatformGuidance1edtOrderedHelmAngleKeyPress(Sender: TObject;
      var Key: Char);
    procedure fmPlatformGuidance1edtHelmOrderedGroundSpeedKeyPress(
      Sender: TObject; var Key: Char);
    procedure History1Click(Sender: TObject);
    procedure fmFireControl1lstFireControlAssetsAssignedTracksSelectItem(
      Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure fmWeapon1btnSurfaceToSurfaceMissileLauncherMoreClick(
      Sender: TObject);
    procedure fmOwnShip1btnLandPlatformClick(Sender: TObject);
    procedure fmPlatformGuidance1sbTrackToEvadeClick(Sender: TObject);
    procedure fmPlatformGuidance1mnEvasion1Click(Sender: TObject);
    procedure pnlStatusRedClick(Sender: TObject);
    procedure pnlStatusYellowClick(Sender: TObject);
    procedure fmPlatformGuidance1mnShadow1Click(Sender: TObject);
    procedure fmPlatformGuidance1sbCircleOnTrackTrackClick(Sender: TObject);
    procedure fmPlatformGuidance1sbEngageTrackToEngageClick(Sender: TObject);
    procedure fmPlatformGuidance1edtTrackToEngageKeyPress(Sender: TObject;
      var Key: Char);
    procedure fmPlatformGuidance1edtEngageStandOffDistanceKeyPress(
      Sender: TObject; var Key: Char);
    procedure fmPlatformGuidance1mnEngagement1Click(Sender: TObject);
    procedure fmPlatformGuidance1mnOutrun1Click(Sender: TObject);
    procedure fmPlatformGuidance1sbTrackToOutrunClick(Sender: TObject);
    procedure fmPlatformGuidance1Short1Click(Sender: TObject);
    procedure fmPlatformGuidance1Long1Click(Sender: TObject);
    procedure fmPlatformGuidance1VeryLong1Click(Sender: TObject);
    procedure fmPlatformGuidance1edtZigZagBaseCourseKeyPress(Sender: TObject;
      var Key: Char);
    procedure fmEMCON1cbEmconSearchRadarClick(Sender: TObject);
    procedure fmSensor1btnIFFInterrogatorTrackSearchClick(Sender: TObject);
    procedure fmSensor1sbIFFTransponderControlModeOnClick(Sender: TObject);
    procedure fmSensor1sbIFFTransponderControlModeOffClick(Sender: TObject);
    procedure fmSensor1sbIFFInterrogatorControlModeOffClick(Sender: TObject);
    procedure Formation1Click(Sender: TObject);
//    procedure LogisticClick(Sender: TObject);
//    procedure SettingStrategiClick(Sender: TObject);
    procedure Opotions1Click(Sender: TObject);
//    procedure Remove2Click(Sender: TObject);
    procedure fmWeapon1SpeedButton2Click(Sender: TObject);
    procedure fmCounterMeasure1btnAirBubbleDeployClick(Sender: TObject);
    procedure fmWeapon1btnTacticalMissileTargetTrackClick(Sender: TObject);
    procedure fmWeapon1btnStraightRunningTorpedosLaunchClick(Sender: TObject);
//    function KillTask(ExeFileName: string): Integer;
    procedure fmCounterMeasure1sbRadarJammingControlActivationOnClick(
      Sender: TObject);
    procedure fmCounterMeasure1sbRadarJammingControlActivationOffClick(
      Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
//    procedure OnGameCentre1Click(Sender: TObject);
//    procedure Pan1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure Next1Click(Sender: TObject);
    procedure MErge1Click(Sender: TObject);
    procedure Automatic1Click(Sender: TObject);
    procedure Manual1Click(Sender: TObject);
    procedure ClearforHookedTracks1Click(Sender: TObject);
    procedure ClearforAllTracks1Click(Sender: TObject);
//    procedure Anchor1Click(Sender: TObject);
    procedure Origin1Click(Sender: TObject);
    procedure fmWeapon1btnLaunchAPGClick(Sender: TObject);
    procedure Previous1Click(Sender: TObject);
    procedure Split1Click(Sender: TObject);
    procedure mniDepthClick(Sender: TObject);
    procedure mniEnduranceClick(Sender: TObject);
    procedure ransfer1Click(Sender: TObject);
    procedure tmMoveTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mniSplit1Click(Sender: TObject);
    procedure fmEMCON1sbEmconAllSystemsAllSilentClick(Sender: TObject);
    procedure fmEMCON1sbEmconAllSystemsClearAllClick(Sender: TObject);
    procedure fmCounterMeasure1btnFloatingDecoyDeployClick(Sender: TObject);
    procedure fmCounterMeasure1btnChaffAirboneDeployClick(Sender: TObject);
    procedure Track1Click(Sender: TObject);
    procedure mniTorpedoDepthClick(Sender: TObject);
    procedure mniTorpedoCourseClick(Sender: TObject);
    procedure fmCounterMeasure1btnSurfaceChaffTypeClick(Sender: TObject);
    procedure fmCounterMeasure1btnSurfaceChaffLauncherClick(Sender: TObject);
    procedure fmCounterMeasure1btnSurfaceChaffAbortClick(Sender: TObject);
    procedure fmCounterMeasure1btnSurfaceChaffCopyClick(Sender: TObject);
    procedure fmCounterMeasure1ckSurfaceChaffEnabledClick(Sender: TObject);
    procedure fmCounterMeasure1edtSurfaceChaffBloomRangeKeyPress(
      Sender: TObject; var Key: Char);
    procedure fmCounterMeasure1edtSurfaceChaffBloomAltitudeKeyPress(
      Sender: TObject; var Key: Char);
    procedure fmCounterMeasure1edtSurfaceChaffSalvoSizeKeyPress(Sender: TObject;
      var Key: Char);
    procedure fmCounterMeasure1edtSurfaceChaffDelayKeyPress(Sender: TObject;
      var Key: Char);
    procedure fmCounterMeasure1ckSurfaceChaffSeductionEnabledClick(
      Sender: TObject);
    procedure fmCounterMeasure1btnSDJammerTargetClick(Sender: TObject);
    procedure fmCounterMeasure1btnRadarJammingModeSelectedTrackTrackClick(
      Sender: TObject);
    procedure fmPlatformGuidance1sbOnTrackAnchorModeClick(Sender: TObject);
    procedure fmPlatformGuidance1sbOnTrackAnchorTrackClick(Sender: TObject);
    procedure fmPlatformGuidance1btnCircleModeClick(Sender: TObject);
    procedure fmPlatformGuidance1sbCircleOnPositionPositionClick(
      Sender: TObject);
    procedure fmPlatformGuidance1btnStationAnchorPositionClick(Sender: TObject);
    procedure fmWeapon1btnAddHybridMissileTargetAimpointClick(Sender: TObject);
    procedure btnMultiModeClick(Sender: TObject);
    procedure fmPlatformGuidance1PersonelGudance1Click(Sender: TObject);
    procedure fmPlatformGuidance1whHeadingPersonelChange(Sender: TObject);
    procedure fmPlatformGuidance1edtPersonelGuidanceOrderedHeadingKeyPress(
      Sender: TObject; var Key: Char);
    procedure fmPlatformGuidance1sbPersonalGuidanceModeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelectPlatformClick(Sender: TObject);
    procedure ToolBtnRotateMonitorClick(Sender: TObject);
    procedure StatusBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnAirMapClick(Sender: TObject);
    procedure btnLandMapClick(Sender: TObject);
    procedure btnSeaMapClick(Sender: TObject);
    procedure btnLayerToolClick(Sender: TObject);
    procedure btnInfoToolClick(Sender: TObject);
    procedure btnToolBtnSlideClick(Sender: TObject);
//    procedure fmLogisticCalculation1btnAddLogClick(Sender: TObject);
//    procedure fmLogisticCalculation1btnFirstPointLogClick(Sender: TObject);
//    procedure fmLogisticCalculation1btnSecondPointLogClick(Sender: TObject);
    procedure btnLogisticClick(Sender: TObject);
    procedure fmLogisticCalculation1lvTemplateOnShipSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);
    procedure fmLogisticCalculation1btnUseTemplateClick(Sender: TObject);
    procedure btnPlottingClick(Sender: TObject);
    procedure btnComClick(Sender: TObject);
    procedure mniDeleteClick(Sender: TObject);
    procedure PlatformView1Click(Sender: TObject);
    procedure acticalInfoSet1Click(Sender: TObject);
    procedure GotoTime1Click(Sender: TObject);
//    procedure btnFilterRangeRings2DClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure ToolButton45Click(Sender: TObject);
    procedure ToolButton48Click(Sender: TObject);
//    procedure btnAirMap_2DClick(Sender: TObject);
    procedure ToolButtonAirClick(Sender: TObject);
//    procedure btnLandMap_2DClick(Sender: TObject);
    procedure ToolButtonLandClick(Sender: TObject);
//    procedure btnSeaMap_2DClick(Sender: TObject);
    procedure ToolButtonSeaClick(Sender: TObject);
//    procedure btnInfo2DClick(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton38Click(Sender: TObject);
    procedure miPlottingEditClick(Sender: TObject);
    procedure miPlottingNewClick(Sender: TObject);
    procedure miPlottingDeleteClick(Sender: TObject);
    procedure miPlottingShowClick(Sender: TObject);
    procedure ToolButton49Click(Sender: TObject);
    procedure ToolButton51Click(Sender: TObject);
    procedure fmPlatformGuidance1btnQuickFormationClick(Sender: TObject);
    procedure fmPlatformGuidance1mnFormation2Click(Sender: TObject);
    procedure mniChangeCourse1Click(Sender: TObject);
    procedure btnToolAddMineClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnTimeOfRaidClick(Sender: TObject);
    procedure btnMinimapClick(Sender: TObject);
    procedure mnitoFrontClick(Sender: TObject);
    procedure mnitoBackClick(Sender: TObject);
    procedure fmWeapon1btnPositionClick(Sender: TObject);

    procedure miSHowBaseClick(Sender: TObject);
    procedure SaveAsToDatabase1Click(Sender: TObject);
    procedure SaveAsToScenario1Click(Sender: TObject);
    procedure mniSavescenario1Click(Sender: TObject);
    procedure mniSaveScenarioAs1Click(Sender: TObject);
    procedure SaveAsOverlaytoDatabase1Click(Sender: TObject);
    procedure SaveAsOverlaytoScenario1Click(Sender: TObject);
    procedure btnPin2dClick(Sender: TObject);
    procedure btnVwTote2dClick(Sender: TObject);
    procedure cbSetScale2DChange(Sender: TObject);
//    procedure btnMiniMap2DClick(Sender: TObject);
    procedure btnCameraCtrlView2DClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure fmWeapon1btnBombDisplayRangeShowClick(Sender: TObject);
    procedure fmOwnShip1btnRangeLandingClick(Sender: TObject);
    procedure mniReleasePlatform1Click(Sender: TObject);
    procedure lvPlatformlistSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure chkControlCamClick(Sender: TObject);
    procedure cbbTerrainChange(Sender: TObject);
    procedure btnCamFreeClick(Sender: TObject);
    procedure btnCamAttachClick(Sender: TObject);
    procedure btnCamLookAtClick(Sender: TObject);
    procedure vrwhlPositionAzimuthChange(Sender: TObject);
    procedure vrwhlPositionAzimuthMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure trckbrPositionRangeChange(Sender: TObject);
    procedure trckbrPositionRangeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPositionRangeExit(Sender: TObject);
    procedure edtPositionRangeKeyPress(Sender: TObject; var Key: Char);
    procedure edtPositionAzimuthExit(Sender: TObject);
    procedure edtPositionAzimuthKeyPress(Sender: TObject; var Key: Char);
    procedure trckbrPositionElevationChange(Sender: TObject);
    procedure trckbrPositionElevationKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNormalVisionClick(Sender: TObject);
    procedure btnNightVisionClick(Sender: TObject);
    procedure btnTrackPosClick(Sender: TObject);
    procedure mniStaticSymbolClick(Sender: TObject);
    procedure mniDinamicSymbolClick(Sender: TObject);
    procedure mniDimensionClick(Sender: TObject);
    procedure btnTacticalSymbolViewModeClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure ViewMember1Click(Sender: TObject);
    procedure lvTrackControlSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure edtPositionElevationExit(Sender: TObject);
    procedure edtPositionElevationKeyPress(Sender: TObject; var Key: Char);
//    procedure DynamicviewMenBarClick(Sender: TObject);
//    procedure StatciviewMenBarClick(Sender: TObject);
//    procedure DimensionMenBarClick(Sender: TObject);
    procedure mniPrintCurrentMap1Click(Sender: TObject);
    procedure pnlMenubarClick(Sender: TObject);
    procedure toolbar4MouseLeave(Sender: TObject);
    procedure pnlMenubarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnDDay2DClick(Sender: TObject);
    procedure btnOverlayClick(Sender: TObject);

    procedure TBPositionRangeMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure TBPositionRangeMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure TBPositionElevationMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure TBPositionElevationMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);

//    procedure ToolBtnCommClick(Sender: TObject);
    procedure edtFormKeyPress(Sender: TObject; var Key: Char);
    procedure takeSS(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure TTButtonClick(Sender: TObject);
    procedure THButtonClick(Sender: TObject);
    procedure TDCPButtonClick(Sender: TObject);
//    procedure pnlRightClick(Sender: TObject);
    procedure ViewTargetTabClick(Sender: TObject);
    procedure fmWeapon1pnlLaunch6Click(Sender: TObject);
    procedure fmWeapon1pnlLaunch5Click(Sender: TObject);
    procedure fmWeapon1pnlLaunch7Click(Sender: TObject);
    procedure fmWeapon1pnlLaunch8Click(Sender: TObject);
    procedure fmWeapon1btnWGLaunchClick(Sender: TObject);
    procedure btnRullerClick(Sender: TObject);

  private
    { Private declarations }
    isFullScreen: Boolean;
    isSelectedPIReadyOnMoving: Boolean;
    FIndexTrack : integer;
    FLastPos : TPoint;
    FMinimapFocusRect : TRect;

    function FindTrackListByMember(const arg: string): TListItem;

    procedure AddTrackPlatform(Sender: TObject); // for Controller;
    procedure UpdateTrackListData;
    procedure UpdatePanelTop(Sender: TObject);
    //procedure UpdateOwnShipData(Sender: TObject);
    procedure LaunchNRPPlatformObserve(domain, typePoint: Integer; symbolstr: Char; id: Integer);
    procedure clearPopRightClick;
    procedure MinimapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);

  private

    isFirstUpdate: Boolean; // ini sementara untuk update data platform pertama kali
    isOnAnchorLine: Boolean;
    isOnESMLine: Boolean;
//    FOnUpdateAsset: TNotifyEvent;
    FLeftMouseDown: Boolean;
    FBeginDrag: Boolean;

    mptLast, mptDown, mptCenter, mptMove : TPoint;

    // aldy
    newPoint: TPoint;
    esmSelected  : TT3ESMTrack;
    // new version
    FControlEmbarkedPlatform: Boolean;
    FObjectAssignedByGun : TSimObject;
    TrackLists : TThreadList;

    //procedure InitOleVariant(var TheVar: OleVariant);
    //function OutsideRegion(x, y: double): Boolean;
    procedure ShowPlottingOnTime(gtime : TDateTime);
    procedure SetControlEmbarkedPlatform(const Value: Boolean);
    procedure InitTabHookedInfo;
    procedure DisplayTabHooked(Sender: TObject);
    procedure DisplayTabDetail(Sender: TObject);
    procedure DisplayTabDetection(Sender: TObject);
    procedure DisplayTabIFF(Sender: TObject);

    procedure SetupWasdalUI;
    procedure SetupPlotterUI;
  public
    // move to public, use by wasdal UI
    FLastMapCenterX, FLastMapCenterY : double;
    FAnchorFilterEnabled: Boolean;
    isMultiMode : Boolean;

    // unk membedakan geser dengan edit overlay
    overlayeditpopup : Boolean;

    IdSelectShape : Integer;

    { Public declarations }
    focusedTrack: TSimObject;
    focusedRBLW : TSimObject;
    anchorTrack : TSimObject;
    RBLWPointX , RBLWPointY : Double;
    statusR_List,statusY_List : TList;
    infoBalloon : TObject;

    Map1 : TMapXTouch;
//    MiniMap : TMapXTouch;

    DrawOverlay : TOverlayTemplateContainer;
    FRangeRingOnHook: Boolean;
    FHookOnPlatform: Boolean;
    isStatusMerge: Boolean;

    FBlendHidden : Boolean;
    FIsShowed : Boolean;

    startMoveX : Integer;
    startMoveY : Integer;
    endMoveX : Double;
    endMoveY : Double;

    // move to public, use by wasdal UI
    procedure SetWeaponTargetObject(obj: TSimObject);
    procedure SetFCTargetObjectobj (obj : TSimObject);

    procedure GetNameAndClass(const obj: TSimObject; var n, c: string);
    procedure Initialize;

    procedure CreatSimMapX;

    procedure UpdateTabHooked(pi: TT3PlatformInstance);
    procedure UpdateRangeRingsPos(Sender : TObject);
//    procedure RemoveFromTargetedRefTrack(Sender : TObject);
    procedure SetRoleClient(rc: Integer);
    procedure SetControlledPlatform(pit: TT3PlatformInstance);
    procedure SetControlledFormMode(aReadOnly : boolean);
    procedure SetHookedPlatformInfo(pit: TT3PlatformInstance);
    procedure SetSelectedTrack(track: TSimObject);
    procedure UnSelectAllPlatformTrack;
    procedure UnSelectAllNRPlatformTrack;
    procedure UnselectAllDetectedTrack;
    procedure UnSelectAllRBLWPointTrack;
    procedure UnSelectAllBOlWPointTrack;
    procedure setDefaultInterface(userLevel: word);
    procedure UpdateFormData(Sender: TObject);
    procedure UpdateGameTime(Sender: TObject);
    procedure UpdateCenter(Sender: TObject);
    procedure UpdateHookedInfo(Sender: TObject);
    procedure RemoveFromTrackList(Sender: TObject);
    procedure Refresh_AssumeControl;
    procedure RefreshLogistikList;

    procedure MapToolUsed(ASender: TObject; ToolNum: Smallint;
              X1, Y1, X2, Y2, Distance: double; Shift, Ctrl: WordBool;
          var EnableDefault: WordBool);
    procedure MapMouseMove(Sender: TObject; Shift: TShiftState; x, y: Integer);
    procedure MapMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; x, y: Integer);
    procedure MapMouseUp(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; x, y: Integer);

    procedure MapKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure MapMouseDouble(Sender: TObject);
    procedure MapMouseSingle(Sender: TObject);
    procedure MapMouseExit(Sender: TObject);

    procedure setPopUpPropItem(obj: TSimObject);
    procedure setMainMenuItem(obj: TSimObject);   //add
    procedure setShowMainMenuItem(obj: TSimObject); //add
    procedure DisplayGameTime(const gSpeed: single; const gTime: TDateTime);
    procedure Be_A_FullMap(const full: Boolean);
    procedure Set_WasdalFullMap(const fullMap: Boolean);
    procedure Set_DoubleBufferd(const doubleBuffered: Boolean);
    procedure UpdatePlatformProperties(plat : TSimObject; dom, ident, typ: integer);
    procedure SetObjectAssignedByGun(value : TSimObject);

    procedure setFreePopup;
    procedure setHookPopup;
    procedure updateStatus;
    procedure addStatus(status: String);
    procedure updateStatus_Yellow;
    procedure addStatus_Yellow(status: String);
    procedure RefreshTracks;
    procedure RemoveListandForm(ctrlObj: TObject);
    procedure OnCollision(Track, CollisionTrack : string);
    procedure OnUpdateStateServer(msg: string);
    procedure UpdateControlledPlatform;
    procedure UpdateGroupControl(grp : T3GroupVehicle; Action : Byte);

    procedure execPDF(Sender : TObject);

    function setFocusedESMTrack(isDown : Boolean; mx, my : Double) : Boolean;
    function IsFireControlActivated : Boolean; //cek apakah fire ada salah satu fire control yang aktif
    function DeleteAmpersand(value : string):string;

    property ControlEmbarkedPlatform : Boolean read FControlEmbarkedPlatform
       write SetControlEmbarkedPlatform;
    property  SelectedEsm: TT3ESMTrack read esmSelected;
    property ObjectAssignedByGun : TSimObject read FObjectAssignedByGun
      write SetObjectAssignedByGun;
  end;

  TStatus = class
    public
    state : String;
  end;
var
  frmTacticalDisplay: TfrmTacticalDisplay;

implementation

uses
  Math,
  uSimMgr_Client, uT3SimManager, uBaseCoordSystem,
  uPictureCentreControl, uTrackHistory,

  uCoordConvertor, uMapXHandler, uPictureFilter,
  uDBAsset_Weapon, uRPLibrary, uT3Common, ufToteDisplay, ufEditRealTimeTrack, ufChangeTrackNumber,
  uDBAsset_GameEnvironment, uDBCubicles, ufMergeTracks, ufEditNonRealTimeTrack, uRemoteHost ,
  uLibSettingTTT, uGamePlayType, DateUtils, uT3Radar, uDataTypes, uT3Gun,
  uFormationEditorForm, uT3Sonar, uT3OtherSensor, ufrmNGSGunSetup,
  uT3Sonobuoy, uSnapshotDLG, ufmDetailPlan, uT3HybridOnVehicle, uT3Visual, uWaypointEditor, uStrategiEditor,
  uT3Mine, uShipTacticalInfo, uGotoTime, ufrmTrackDetails, ufrmPlatformInfo,
  ufrmGuidance, ufrmRadar, ufrmWeapon, ufrmLogistic, ufrmEMCON, ufrmFireControl,
  ufrmC, ufrmPlatformTools, ufrmGeneraPfTools, ufDeployMine,
  uBrowseMap, uRuler, uObjectVisuals, uDrawStrategi, uMainPlottingShape, uSaveAsPlotting, newClassASTT,
  uDBAsset_Deploy, uDBAsset_Cubicle, uSaveAsOverlay;

{$R *.dfm}

const
  CMin_Z = 0;
  CMax_Z = 14;

Function DecToOct(Inp : String): String;

Var
  HasilBagi,SisaBagi : Integer;
  Oct,Oktal : String;
  i : integer;
  Des : integer;
Begin
  Oct := '';
  Oktal := '';
  Des:= StrToInt(inp);
  Repeat
  SisaBagi := des Mod 8;
  Oct:= Oct + intToStr(SisaBagi);
  HasilBagi := Des Div 8;
  des:= HasilBagi;
  Until HasilBagi = 0;

  For I := length (Oct) Downto 1 Do
  Begin
  Oktal := Oktal+ Oct[i];
  End;
  Result:= Oktal;
End;

procedure EnableComposited(WinControl:TWinControl);
var
  i:Integer;
  NewExStyle:DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for I := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

//procedure TfrmTacticalDisplay.InitOleVariant(var TheVar: OleVariant);
//begin
//  TVarData(TheVar).vType := varError;
//  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
//end;

procedure TfrmTacticalDisplay.InitTabHookedInfo;
begin
  //?Hook
  lbTrackHook.Caption := 'Unknown';
  lbNameHook.Caption := 'Unknown';
  lbClassHook.Caption := 'Unknown';
  lbPositionHook1.Caption := '---';
  lbPositionHook2.Caption := '---';
  lbCourseHook.Caption := '---';
  lbGround.Caption := '---';
  lbAltitude.Caption := '---';
//  lbDepth.Caption := '---';
  lbBearingHook.Caption := '---';
  lbRangeHook.Caption := '---';

  // Details
  lbTrackDetails.Caption := 'Unknown';
  lbNameDetails.Caption  := 'Unknown';
  lbClassDetails.Caption := 'Unknown';
  lbTypeDetails.Caption  := 'Unknown';
  lbDomain.Caption       := 'Unknown';
  lbIdentifier.Caption   := 'Unknown';

  // Detection
  lbTrackDetection.Caption := 'Unknown';
  lbNameDetection.Caption  := 'Unknown';
  lbClassDetection.Caption := 'Unknown';

  // IFF
  lbTrackIff.Caption := 'Unknown';
  lbNameIff.Caption  := 'Unknown';
  lbClassIff.Caption := 'Unknown';
end;

function ZoomIndexToScale(const i: Integer): double;
begin
  if i < -3 then
    result := 0.125
  else if i > 14 then
    result := 2500.0
  else
    result := Power(2.0, (i - 3));
end;

function FindClosestZoomIndex(const z: double): Integer;
var
  i: Integer;
begin
  if z >= 2500 then
    result := CMax_Z
  else if z <= 0.125 then
    result := CMin_Z
  else
  begin
    i := Round(Log2(z));
    result := i + 3;
  end;
end;

function FixMapZoom(z: double): double;
begin
  if z >= 1.0 then
    result := Round(z)
  else
    result := 0.001 * Round(z * 1000);
end;

procedure TfrmTacticalDisplay.Be_A_FullMap(const full: Boolean);
begin
  pnlLeft.Visible := NOT full;

  if full then
  begin
    WindowState := wsMaximized;
    BorderStyle := bsNone;
  end
  else
  begin
    WindowState := wsNormal;
    BorderStyle := bsSingle;
  end;
end;

procedure TfrmTacticalDisplay.ClearforAllTracks1Click(Sender: TObject);
begin
  mniStandardPoint1.Visible := false;
  mniNewStandardBearing1.Visible := false;
  mniNewStandard1.Visible := false;

  mniNewSpecialPointGeneral1.Visible := false;
  mniNewSpecialPointAir1.Visible := false;
  mniNewSpecialPointASW1.Visible := false;

  mniConvertRTtoNRT1.Visible := false;
  mniCharacteristic1.Visible := false;
  mniMerge1.Visible := False;
  mniSplit1.Visible := false;
  mniDatalink1.Visible := false;
  mniTrackNumber1.Visible := false;
  mniTrackHistory1.Visible := false;
  mniIntiate1.Visible := false;
  mniBreakAllFireControl1.Visible := false;
  mniClearRing1.Visible := false;
  mniRemove1.Visible := false;

  mniCentre1.Visible := false;
  mniRangeRing1.Visible := false;
  mniTrackTable1.Visible := false;
  mniAnchor1.Visible := false;
  mniRamp1.Visible := False;

  N1.Visible := false;
  N2.Visible := false;
  N3.Visible := false;
  N10.Visible := false;
end;

procedure TfrmTacticalDisplay.ClearforHookedTracks1Click(Sender: TObject);
begin
  if Assigned(focusedTrack) and (focusedTrack is TT3Unit) then
    VSimMap.SetMapCenter(TT3Unit(focusedTrack).getPositionX,
      TT3Unit(focusedTrack).getPositionY);
end;

function TfrmTacticalDisplay.IsFireControlActivated : Boolean;
var
  ve : TT3Vehicle;
  dev: TT3DeviceUnit;
  radar: TT3Radar;
  I: Integer;
begin
  Result := False;

  if not Assigned(simMgrClient.ControlledPlatform) then
    Exit;

  if not (simMgrClient.ControlledPlatform is TT3Vehicle) then
    Exit;

  ve := simMgrClient.ControlledPlatform as TT3Vehicle;
  for I := 0 to ve.Devices.Count - 1 do
  begin
    dev := ve.Devices[I];
    if dev is TT3Radar then
    begin
      radar := dev as TT3Radar;
      if radar.RadarDefinition.FDef.Num_FCR_Channels > 0 then
      begin
        if radar.OperationalStatus = sopOn then
        begin
          Result := True;
          Exit;
        end;
      end;
    end;
  end;
end;

// Tambahan Prince : Fungsi untuk membunuh file exe mapstub
//function TfrmTacticalDisplay.KillTask(ExeFileName: string): Integer;
//const
//  PROCESS_TERMINATE = $0001;
//var
//  ContinueLoop: BOOL;
//  FSnapshotHandle: THandle;
//  FProcessEntry32: TProcessEntry32;
//begin
//  Result := 0;
//  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
//  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
//  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
//
//  while Integer(ContinueLoop) <> 0 do
//  begin
//    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
//      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
//      UpperCase(ExeFileName))) then
//      Result := Integer(TerminateProcess(
//                        OpenProcess(PROCESS_TERMINATE,
//                                    BOOL(0),
//                                    FProcessEntry32.th32ProcessID),
//                                    0));
//     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
//  end;
//  CloseHandle(FSnapshotHandle);
//end;

function TfrmTacticalDisplay.setFocusedESMTrack
         (isDown : Boolean; mx, my : Double): Boolean;
var
  foundESM : boolean;
  I, J : Integer;
  sObject : TSimObject;
  esmObj : TT3ESMTrack;
begin
  Result := False;

  if not isDown then
    Exit;

  foundESM := false;
  for I := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
  begin
    sObject := simMgrClient.SimDetectedTrackList.getObject(I);
    if sObject is TT3DetectedTrack then
    begin
      for J := 0 to TT3DetectedTrack(sObject).ESMTracks.Count - 1 do
      begin
        esmObj := TT3DetectedTrack(sObject).ESMTracks[J];
        esmObj.IsSelected := false;

        if foundESM then
        begin
          Break;
        end;

        isOnESMLine := esmObj.isPointOnESMLine(mx, my);
        if isOnESMLine then
        begin
          //jika ditemukan garis esm unselect detected sebelunnya
          UnselectAllDetectedTrack;
          UnSelectAllRBLWPointTrack;
          UnSelectAllBOLWPointTrack;
          UnSelectAllPlatformTrack;
          UnSelectAllNRPlatformTrack;

          esmSelected := esmObj;
          esmSelected.IsSelected := true;
          focusedTrack := esmSelected;
          foundESM := true;
          Break;
        end;
      end;
    end;
  end;

  if not foundESM then
    esmSelected := nil;

  Result := foundESM;
end;

procedure TfrmTacticalDisplay.UpdatePanelTop(Sender: TObject);
begin
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    btnMerge.Enabled := False;
  end
  else
  begin
    if Sender is TT3PlatformInstance then
    begin
      btnMerge.Enabled := False;
    end
    else if Sender is TT3DetectedTrack then
    begin
      if Assigned(TT3DetectedTrack(Sender).MergedESM) then
        btnMerge.Enabled := False
      else
      begin
        btnMerge.Enabled := True;
      end;
    end
    else if Sender is TT3ESMTrack then
    begin
      if TT3ESMTrack(Sender).IsMerged  then
        btnMerge.Enabled := False
      else
        btnMerge.Enabled := True;
    end
    else
    begin
      btnMerge.Enabled := False;
    end;
  end;
end;

procedure TfrmTacticalDisplay.UpdatePlatformProperties(plat : TSimObject; dom, ident, typ: integer);
var
  rec : TRecCmd_Platform_SET_PROPERTY;
  recESM : TRecCmd_ESM_SET_PROPERTY;
  recNRP : TRecCmd_NRP_SET_PROPERTY;
  oid : Integer;
begin
  if plat = nil then
    exit;

  if plat is TT3NonRealVehicle then
  begin
    oid := -1;

    if dom <> -1 then
      oid := NRP_ID_TRACKDOMAIN;

    if ident <> -1 then
      oid := NRP_ID_TRACKIDENT;

    if typ <> -1 then
      oid := NRP_ID_SYMBOLTYPE;

    if oid <> -1 then
    begin
      recNRP.PlatfomID := TT3NonRealVehicle(plat).InstanceIndex;
      recNRP.OrderID := oid;
      recNRP.domain := dom;//vhdAir;

      case dom of
        vhdAir        : recNRP.symbol := '`';
        vhdSurface, vhdAmphibious    : recNRP.symbol := '4';
        vhdSubsurface : recNRP.symbol := '8';
        vhdLand       : recNRP.symbol := '=';
        vhdWreck      : recNRP.symbol := 'w';
        vhdGeneral    : recNRP.symbol := 'q';
      end;

      recNRP.identity := ident;
      recNRP.platformType := typ;

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
        recNRP.GrpID := 0
      else
        recNRP.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;

      recNRP.TypeNRP := TT3NonRealVehicle(plat).NRPType;

      simMgrClient.netSend_CmdNRP_CHANGE_PROPERTY(recNRP);
      Exit;
    end;
  end
  else if plat is TT3PlatformInstance then
  begin
    rec.PlatfomID := TT3PlatformInstance(plat).InstanceIndex;
  end
  else if plat is TT3DetectedTrack then
  begin
    rec.PlatfomID := TT3DetectedTrack(plat).TrackObject.InstanceIndex;
  end
  else if plat is TT3ESMTrack then  //sementara gni dlu y
  begin
    recESM.PlatfomID := TT3DetectedTrack(plat.Parent).TrackObject.InstanceIndex;
    recESM.Tracknumber := TT3ESMTrack(plat).TrackNumber;
    recESM.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;
    recESM.domain := dom;
    recESM.identity := ident;

    simMgrClient.netSend_CmdESM_CHANGE_PROPERTY(recESM);
    Exit;
  end;

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
    rec.GrpID := 0
  else
    rec.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;

  rec.domain := dom;
  rec.identity := ident;
  rec.platformType := typ;
  simMgrClient.netSend_CmdPlatform_CHANGE_PROPERTY(rec);

  if plat <> nil then
  begin
    if plat is TT3PlatformInstance then
      TT3PlatformInstance(plat).Selected := false
    else if plat is TT3DetectedTrack then
      TT3DetectedTrack(plat).Selected := false;
  end;
end;

procedure TfrmTacticalDisplay.UpdateRangeRingsPos(Sender: TObject);
begin
  simMgrClient.RangeRing.mX := TT3Vehicle(Sender).getPositionX;
  simMgrClient.RangeRing.mY := TT3Vehicle(Sender).getPositionY;
end;

procedure TfrmTacticalDisplay.SetObjectAssignedByGun(value : TSimObject);
begin
  FObjectAssignedByGun := value;

  SetFCTargetObjectobj(FObjectAssignedByGun);
  SetWeaponTargetObject(FObjectAssignedByGun);
end;

procedure TfrmTacticalDisplay.setFreePopup;
begin
  clearPopRightClick;
  mniStandardPoint1.Enabled := true;
  mniStandardPoint1.Visible := true;

  mniNewStandardBearing1.Visible := true;
  mniNewStandardBearing1.Enabled := true;

  mniNewStandard1.Enabled := true;
  mniNewStandard1.Visible := true;

  mniNewSpecialPointGeneral1.Enabled := true;
  mniNewSpecialPointAir1.Enabled := true;
  mniNewSpecialPointASW1.Enabled := true;

  mniNewSpecialPointGeneral1.Visible := true;
  mniNewSpecialPointAir1.Visible := true;
  mniNewSpecialPointASW1.Visible := true;

  N1.Enabled := true;
  N1.Visible := true;
end;

procedure TfrmTacticalDisplay.SetHookedPlatformInfo(pit: TT3PlatformInstance);
begin
  if not Assigned(simMgrClient) then
    exit;

  if Assigned(pit) then     //mk
  begin
    focusedTrack := pit;
    fmOwnShip1.SetControlledObject(pit);
    fmSensor1.SetControlledObject(pit);
    fmWeapon1.SetControlledObject(pit);
    fmFireControl1.SetControlledObject(pit);
    fmCounterMeasure1.SetControlledObject(pit);
    fmEMCON1.SetControlledObject(pit);
//    fmLogisticCalculation1.SetControlledObject(pit);

    // wasdal UI
    if simMgrClient.ISWasdal then
    begin
      if Assigned(frmPlatformInfo)  then
        frmPlatformInfo.fmOwnShip1.SetControlledObject(pit);

      if Assigned(frmGuidance)  then
        frmGuidance.fmPlatformGuidance1.SetControlledObject(pit);

      if Assigned(frmSensor)  then
        frmSensor.fmSensor1.SetControlledObject(pit);

      if Assigned(frmWeapon)  then
        frmWeapon.fmWeapon1.SetControlledObject(pit);

      if Assigned(frmCM)  then
        frmCM.fmCounterMeasure1.SetControlledObject(pit);

      if Assigned(frmFCR)  then
        frmFCR.fmFireControl1.SetControlledObject(pit);

      if Assigned(frmLogistic)  then
        frmLogistic.fmLogisticCalculation1.SetControlledObject(pit);

      if Assigned(frmEMCON)  then
        frmEMCON.fmEMCON1.SetControlledObject(pit);

    end
    else
    begin
      fmPlatformGuidance1.SetControlledObject(pit);
    end;
  end;
end;

procedure TfrmTacticalDisplay.setHookPopup;
begin
  clearPopRightClick;
  mniStandardPoint1.Enabled := true;
  mniStandardPoint1.Visible := true;

  mniNewStandardBearing1.Visible := true;
  mniNewStandardBearing1.Enabled := true;

  mniNewStandard1.Enabled := true;
  mniNewStandard1.Visible := true;

  mniNewSpecialPointGeneral1.Enabled := true;
  mniNewSpecialPointAir1.Enabled := true;
  mniNewSpecialPointASW1.Enabled := true;

  mniNewSpecialPointGeneral1.Visible := true;
  mniNewSpecialPointAir1.Visible := true;
  mniNewSpecialPointASW1.Visible := true;

  N1.Enabled := true;
  N1.Visible := true;

//  mniTorpedo.Enabled := true;
//  mniTorpedo.Visible := true;
//  mniSonobuoys.Enabled := true;
//  mniSonobuoys.Visible := true;
//  mniConvertRTtoNRT1.Visible := true;

  mniCharacteristic1.Visible := true;
  mniMerge1.Visible := true;
  mniSplit1.Visible := true;
  mniTrackNumber1.Visible := true;
  mniTrackHistory1.Visible := true;
  mniRemove1.Visible := true;

  if Assigned(focusedTrack) then
  begin
    if focusedTrack is TT3Vehicle then
    begin
      if (TT3Vehicle(focusedTrack).VehicleDefinition.FData.GangwayPosition <> 3) and not (focusedTrack is TT3NonRealVehicle) then
        mniRamp1.Visible := True;
    end;
  end;

//  mniDatalink1.Visible := true;
//  mniTrackTable1.Visible := true;
//  mniIntiate1.Visible := true;
//  mniBreakAllFireControl1.Visible := true;
//  mniClearRing1.Visible := true;

//  mniCentre1.Visible := true;
//  mniRangeRing1.Visible := true;
//  mniAnchor1.Visible := true;
//  mniRamp1.Visible := False;

  N2.Visible := true;
  N3.Visible := true;
  N10.Visible := true;
end;

procedure TfrmTacticalDisplay.btnMergeClick(Sender: TObject);
begin
  if Assigned(esmSelected) then
  begin
    if not Assigned(frmMergeTracks) then
      frmMergeTracks := TfrmMergeTracks.Create(self);

    frmMergeTracks.ControlledTrack := esmSelected;
    frmMergeTracks.Show;
  end
  else
  if Assigned(focusedTrack) then
  begin
    if focusedTrack is TT3DetectedTrack then
    begin
      if not Assigned(frmMergeTracks) then
        frmMergeTracks := TfrmMergeTracks.Create(self);

      frmMergeTracks.ControlledTrack := focusedTrack;
      frmMergeTracks.Show;
    end;
  end;
end;

procedure TfrmTacticalDisplay.btnSplitClick(Sender: TObject);
var
  track : TT3DetectedTrack;
  rec : TRecCmd_MergeTrack;
begin
  if not Assigned(focusedTrack) then
    Exit;

  if focusedTrack is TT3DetectedTrack then
  begin
    track := focusedTrack as TT3DetectedTrack;

    if Assigned(track.MergedESM) then
    begin
      rec.EsmTrackNumber := StrToInt(track.MergedESM.TrackNumber);
      rec.DetectedTrackNumber := track.TrackObject.InstanceIndex;
      rec.OrderMerge := false;

      simMgrClient.netSend_Cmd_MergeTrack(rec);
    end
    else
    begin
      addStatus('Not assign Merge Track');
    end;
  end
  else
  begin
    addStatus('Not assign Focus Track');
  end;
end;

procedure TfrmTacticalDisplay.btnPin2dClick(Sender: TObject);
begin
  if btnPin2d.Down then
  begin
    pnlBottom.Show;
    Panel1.Show;
    Panel3.Show;

    toolbar4.OnMouseLeave := nil;
    pnlMenubar.OnMouseMove := nil;
  end
  else
  begin
    pnlBottom.Hide;
    Panel1.Hide;
    Panel3.Hide;

    FIsShowed := False;

    toolbar4.OnMouseLeave := toolbar4MouseLeave;
    pnlMenubar.OnMouseMove := pnlMenubarMouseMove;
  end;
end;

procedure TfrmTacticalDisplay.btnVwTote2dClick(Sender: TObject);
begin
  VSlidingTrans.ShowHideBtnProc;
end;

//procedure TfrmTacticalDisplay.btnMiniMap2DClick(Sender: TObject);
//begin
//  MiniMap.Visible := btnMiniMap2D.Down;
//end;

procedure TfrmTacticalDisplay.btnCameraCtrlView2DClick(Sender: TObject);
var
  aObject: TSimObject;
  i,j : Integer;
  name: string;
  li : TListItem;
begin
  if btnCameraCtrlView2D.Down then
  begin
    pnlRight.Show;

//    lvPlatformlist.Items.Clear;
//    lvPlatformlist.Clear;
//
//    for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//    begin
//      aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//      if not Assigned(aObject) then
//          Continue;
//
//      if not(TT3PlatformInstance(aObject).UnitGroup) then
//        Continue;
//
//      if (aObject.FreeMe) then
//        Continue;
//
//      if aObject is TT3Vehicle then
//      begin
//          name := TT3PlatformInstance(aObject).InstanceName;
//          li  := lvPlatformlist.Items.Add;
//
//          with li do
//          begin
//            Caption := name;
//          end;
//      end;
//    end;
  end
  else
  begin
    pnlRight.Hide;
  end;
end;

procedure TfrmTacticalDisplay.btn9Click(Sender: TObject);
var
  rec : TRecCmd_SelectPlatformToRemove;
  buttonSelected : Integer;
begin
  if Assigned(focusedTrack) then        //mk
  begin
    buttonSelected := 1;

    if focusedTrack is TT3NonRealVehicle then
    begin
      buttonSelected := MessageDlg('Do you really want to remove platform '
                        + IntToStr(TT3NonRealVehicle(focusedTrack).TrackNumber), mtConfirmation,
                        [mbYes,mbNo], 0);
    end;

    if buttonSelected = mrNo then
      Exit;

    if focusedTrack is TT3NonRealVehicle then
    begin
      rec.SessionID := simMgrClient.SessionID;
      rec.PlatfomID := TT3NonRealVehicle(focusedTrack).InstanceIndex;
      rec.isNRPlatform := true;

      simMgrClient.netSend_CmdRemovePlatfromByOperator(rec);
      frmTacticalDisplay.Refresh_AssumeControl;
    end;
  end;
end;

procedure TfrmTacticalDisplay.btnAirMapClick(Sender: TObject);
begin
  {jika diakses melalui menubar}
  if Sender is TMenuItem then
  begin
    if GameArea1.Checked then
      Exit;

    if btnAirMap.Down then
      btnAirMap.Down := False
    else
      btnAirMap.Down := True;
  end;

  {Set menubar item}
  GameArea1.Checked := True;

  {Uncheck menubar item}
  GameArea2.Checked := False;
  GameArea3.Checked := False;

  {Release button lain}
  btnLandMap.Down := False;
  btnLandMap_2D.Down := False;
  btnSeaMap.Down := False;
  btnSeaMap_2D.Down := False;

  simMgrClient.SwitchMap(1);
end;

procedure TfrmTacticalDisplay.btnBrowseClick(Sender: TObject);
begin
  frmBrowseMap.Show;
end;

procedure TfrmTacticalDisplay.btnCamAttachClick(Sender: TObject);
var
  rec : TRec_CameraController;
begin
  grpPositionFromPlatform.Visible := TSpeedButton(Sender).Tag = 2;

  rec.cmd := CORD_ID_CAMCON_MODE;
  rec.valueInt := TSpeedButton(Sender).Tag;

  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.btnCamFreeClick(Sender: TObject);
var
  rec : TRec_CameraController;
begin
//  vrwhlPositionAzimuth.Enabled := TSpeedButton(Sender).Tag = 2;
//  edtPositionAzimuth.Enabled := TSpeedButton(Sender).Tag = 2;
//  trckbrPositionRange.Enabled := TSpeedButton(Sender).Tag = 2;
//  edtPositionRange.Enabled := TSpeedButton(Sender).Tag = 2;
//  trckbrPositionElevation.Enabled := TSpeedButton(Sender).Tag = 2;
//  edtPositionElevation.Enabled := TSpeedButton(Sender).Tag = 2;
//  tsPosition.Enabled := TSpeedButton(Sender).Tag = 1;

  grpPositionFromPlatform.Visible := TSpeedButton(Sender).Tag = 2;

  rec.cmd := CORD_ID_CAMCON_MODE;
  rec.valueInt := TSpeedButton(Sender).Tag;

  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.btnCamLookAtClick(Sender: TObject);
var
  rec : TRec_CameraController;
begin
  grpPositionFromPlatform.Visible := TSpeedButton(Sender).Tag = 2;

  rec.cmd := CORD_ID_CAMCON_MODE;
  rec.valueInt := TSpeedButton(Sender).Tag;

  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.btnDDay2DClick(Sender: TObject);
begin
//  if Sender is TMenuItem then
//  begin
//    if btnDDay2D.Down then
//      btnDDay2D.Down := False
//    else
//      btnDDay2D.Down := True;
//  end;
//
//  if (btnDDay2D.Down) then
//  begin
//    fmTimeOfRaid.Show;
//  end
//  else
//  begin
//    fmTimeOfRaid.Hide;
//  end;
end;

procedure TfrmTacticalDisplay.btnEOOnClick(Sender: TObject);
begin
  fmSensor1.sbElectroOpticalSensorOnClick(Sender);
end;

procedure TfrmTacticalDisplay.btnESMOnClick(Sender: TObject);
begin
  fmSensor1.sbESMSensorControlModeClick(Sender);
end;

procedure TfrmTacticalDisplay.btnFireControlOnClick(Sender: TObject);
begin
  if (Sender is TButton) and (TButton(Sender).Tag = 4) then
    ObjectAssignedByGun := fmFireControl1.Focused_Platform
  else
    ObjectAssignedByGun := nil;

  fmFireControl1.btnFCROnClick(Sender);
end;

procedure TfrmTacticalDisplay.btnGunCIWSOnCLick(Sender: TObject);
begin
  if (Sender is TSpeedButton) and (TSpeedButton(Sender).Tag = 9)
  and (Assigned(focusedTrack)) then     //mk
    SetWeaponTargetObject(focusedTrack);

  fmWeapon1.sbGunICWSClick(Sender);
end;

procedure TfrmTacticalDisplay.btnInfoToolClick(Sender: TObject);
begin
  if btnInfoTool.Down or btnInfo2D.Down then
    VSimMap.FMap.CurrentTool := mtLayerInfo
  else
    VSimMap.FMap.CurrentTool := miSelectTool;
end;

procedure TfrmTacticalDisplay.btnLandMapClick(Sender: TObject);
begin
  {Jika diakses dari menubar}
  if Sender is TMenuItem then
  begin
    if GameArea2.Checked then
      Exit;

    if btnLandMap.Down then
      btnLandMap.Down := False
    else
      btnLandMap.Down := True;
  end;

  {Set menu bar item}
  GameArea2.Checked := True;

  {Uncheck menubar item}
  GameArea1.Checked := False;
  GameArea3.Checked := False;

  {Release button lain}
  btnAirMap.Down := False;
  btnAirMap_2D.Down := False;
  btnSeaMap.Down := False;
  btnSeaMap_2D.Down := False;

  simMgrClient.SwitchMap(2);
end;

procedure TfrmTacticalDisplay.btnLayerToolClick(Sender: TObject);
var
  vHelpFile, vHelpID : OleVariant;
begin
  VSimMap.FMap.Layers.LayersDlg(vHelpFile, vHelpID);
end;

procedure TfrmTacticalDisplay.btnLogisticClick(Sender: TObject);
begin
  fmLogisticTamplate.Show;
end;

procedure TfrmTacticalDisplay.btnMADOnClick(Sender: TObject);
begin
  fmSensor1.sbAnomalyDetectorOnClick(Sender);
end;

procedure TfrmTacticalDisplay.btnMinimapClick(Sender: TObject);
begin
  {Jika diakses melalui menbar}
  if Sender is TMenuItem then
  begin
    if btnMinimap.Down then
      btnMinimap.Down := False
    else
      btnMinimap.Down := True;
  end;

  {Cek apakah dari formviewer}
//  if TToolButton(Sender).Name = 'btnMinimap' then
//    MiniMap.Visible := btnMinimap.Down
//  else if TToolButton(Sender).Name = 'btnMiniMap2D' then
//    MiniMap.Visible := btnMinimap2D.Down;
end;

procedure TfrmTacticalDisplay.btnMultiModeClick(Sender: TObject);
var
  pi : TT3PlatformInstance;
  i : Integer;
  rec : TRecCmdMultiMode;
begin
  if Sender is TMenuItem then
  begin
    if btnMultiMode.Down then
      btnMultiMode.Down := False
    else
      btnMultiMode.Down := True;
  end;

  if btnMultiMode.Down then
  begin
    isMultiMode := True;
    Map1.CurrentTool := mtMultiMode;
    Map1.OnPlatformSelected := True;
    if btnZoom.Down then
    begin
      btnZoom.Down := False;
      Zoom1.Checked := False;
    end;
    if btnPan.Down then
    begin
      btnPan.Down := False;
      Pan1.Checked := False;
    end;

  end
  else
  begin
    isMultiMode := False;
    Map1.CurrentTool := mtSelectObject;
    UnSelectAllPlatformTrack;
    fmPlatformGuidance1.clearPlatformMultiSelectList;


    if simMgrClient.ISWasdal then
      if Assigned(frmGuidance) then
        frmGuidance.fmPlatformGuidance1.clearPlatformMultiSelectList;

//    rec.GroupID := 0;
//    rec.CubicleGroup := 0;
//    rec.aAction := C_CLEAR;
//    simMgrClient.netSend_CmdMultiMode(rec);

    for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do begin
      pi := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;
      if pi.Controlled then
       pi.Selected := True;
    end;

    Map1.OnPlatformSelected := False;
  end;

end;

procedure TfrmTacticalDisplay.btnNightVisionClick(Sender: TObject);
var
  rec : TRec_CameraController;
begin
  rec.cmd := CORD_ID_CAMCON_VISION;
  rec.valueInt := TSpeedButton(Sender).Tag;

  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.btnNormalVisionClick(Sender: TObject);
var
  rec : TRec_CameraController;
begin
  rec.cmd := CORD_ID_CAMCON_VISION;
  rec.valueInt := TSpeedButton(Sender).Tag;

  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.btnPlottingClick(Sender: TObject);
begin
  frmStrategiEditor.Show;
end;

procedure TfrmTacticalDisplay.btnSeaMapClick(Sender: TObject);
begin
  {Jika diakses melalui menubar}
  if Sender is TMenuItem then
  begin
    if GameArea3.Checked then
      Exit;

    if btnSeaMap.Down then
      btnSeaMap.Down := False
    else
      btnSeaMap.Down := True;
  end;

  {Set menubar item}
  GameArea3.Checked := True;

  {Uncheck menubar item}
  GameArea1.Checked := False;
  GameArea2.Checked := False;

  {Release Button lain}
  btnAirMap.Down := False;
  btnAirMap_2D.Down := False;
  btnLandMap.Down := False;
  btnLandMap_2D.Down := False;

  simMgrClient.SwitchMap(3);
end;

procedure TfrmTacticalDisplay.btnTacticalSymbolViewModeClick(Sender: TObject);
var
  pos : TPoint;
begin
  GetCursorPos(pos);
  pmSymbolTaktis.Popup(pos.X, pos.Y);
end;

procedure TfrmTacticalDisplay.btnTimeOfRaidClick(Sender: TObject);
begin

  if Sender is TMenuItem then
  begin
    if btnTimeOfRaid.Down then
      btnTimeOfRaid.Down := False
    else
      btnTimeOfRaid.Down := True;
  end;

  if (btnTimeOfRaid.Down) or (btnDDay2D.Down) then
  begin
    fmTimeOfRaid.Show;
  end
  else
  begin
    fmTimeOfRaid.Hide;
  end;

end;

procedure TfrmTacticalDisplay.btnToolAddMineClick(Sender: TObject);
begin
  if not Assigned(frmDeployMine) then
    frmDeployMine := TfrmDeployMine.Create(Self);

  frmDeployMine.Show;
end;

procedure TfrmTacticalDisplay.btnToolBtnSlideClick(Sender: TObject);
begin
  VSlidingTrans.ShowHideBtnProc;
end;

procedure TfrmTacticalDisplay.btnTrackPosClick(Sender: TObject);
var
  rec : TRec_CameraController;
begin
  rec.cmd := CORD_ID_CAMCON_TRACK_POS;
  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.cbAssumeControlChange(Sender: TObject);
var
  aObject: TSimObject;
begin
  aObject := TSimObject(cbAssumeControl.Items.Objects[cbAssumeControl.ItemIndex]);

  if aObject <> nil then
  begin
    if aObject is TT3Unit then
      TT3Unit(aObject).Selected := true
    else if aObject is TT3DetectedTrack then
      TT3DetectedTrack(aObject).Selected := true;

//    THButtonClick.OnClick(pnlTabHook);

    Map1.Repaint;
  end;

  DisplayTabHooked(cbAssumeControl.Items.Objects[cbAssumeControl.ItemIndex]);
end;


procedure TfrmTacticalDisplay.cbSetScale2DChange(Sender: TObject);
var
  z: double;
  s: string;
  i: Integer;
  rrVis: Boolean;
begin
  if (cbSetScale2D.ItemIndex < 0) then
    exit;

  s := cbSetScale2D.Items[cbSetScale2D.ItemIndex];
  try
    z := StrToFloat(s);
    VSimMap.SetMapZoom(z * 2);
    lblRangeScale.Caption := cbSetScale2D.Text;
  finally

  end;
end;

procedure TfrmTacticalDisplay.cbbTerrainChange(Sender: TObject);
var
  rec : TRec_SwitchTerrain;
begin
  rec.TerrainID := cbbTerrain.ItemIndex;
  simMgrClient.netSend_SwitchTerrain(rec);
end;

procedure TfrmTacticalDisplay.Formation1Click(Sender: TObject);
begin
  if not Assigned(frmFormationEditor) then
    frmFormationEditor := TfrmFormationEditor.Create(self);

  frmFormationEditor.Show;
end;

procedure TfrmTacticalDisplay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  UnregisterTouchWindow(Self.Handle);
end;

//procedure TfrmTacticalDisplay.LogisticClick(Sender: TObject);
//begin
//  fmLogisticTamplate.Show;
//end;

procedure TfrmTacticalDisplay.FormCreate(Sender: TObject);
var
  i: Integer;
  z: double;

  setting : TIniFile;
  tempString1 ,tempString2, tempString3,tempString4, tempString5 : TStrings;
  k,l : Integer;
  readPath : string;
  subHelp : TMenuItem;
begin
  //Disable All Floating Point Exceptions
  SetExceptionMask(exAllArithmeticExceptions);

  FBlendHidden := False;

  pnlMap.Align := alClient;

  Map1 := TMapXTouch.Create(Self);
  Map1.Parent := pnlMap;
  Map1.Align := alClient;
  Map1.Visible := True;
  Map1.DoubleBuffered := False;

  frmTacticalDisplay.DoubleBuffered := False;
  pnlMap.DoubleBuffered := False;

  if not Map1.WinXP then
    RegisterTouchWindow(Map1.Handle, 0);

  EnableComposited(pnlMap);
  EnableComposited(Panel1);
  EnableComposited(pnlLeft);
  EnableComposited(pnlTacticalDisplayControlPanel);

//  MiniMap := TMapXTouch.Create(Self);
//  MiniMap.Parent := Self;
//  MiniMap.Align := alNone;
//  MiniMap.Visible := False;
//  MiniMap.Height := 200;
//  MiniMap.Width := 300;
////  MiniMap.DoubleBuffered := True;
//  MiniMap.DoubleBuffered := False;
//  MiniMap.OnDrawUserLayer := MinimapDrawUserLayer;


//  EnableComposited(MiniMap);

//  Map1.DoubleBuffered :=
  fmOwnShip1.InitCreate(self);
  fmPlatformGuidance1.InitCreate(self);
  fmSensor1.InitCreate(self);

  fmWeapon1.InitCreate(self);
  fmCounterMeasure1.InitCreate(self);
  fmFireControl1.InitCreate(self);
  fmEMCON1.InitCreate(self);
//  fmLogisticCalculation1.InitCreate(Self);

//  FOnUpdateAsset := nil;
//  FOnUpdateAsset := UpdateOwnShipData;

  lvTrackTable.DoubleBuffered := true;
  FAnchorFilterEnabled := false;

  FControlEmbarkedPlatform := false;
  isSelectedPIReadyOnMoving := false;

  width := Screen.Monitors[vGameDataSetting.TacticalScreen].width;
  height := Screen.Monitors[vGameDataSetting.TacticalScreen].height;
  left := Screen.Monitors[vGameDataSetting.TacticalScreen].left;
  top := Screen.Monitors[vGameDataSetting.TacticalScreen].top;

  FormStyle := fsStayOnTop;

  ToolBar1.Width := Width;

  isFirstUpdate := true;
  isFullScreen := false;
  isOnAnchorLine := false;
  isMultiMode := False;


  cbSetScale.Items.Clear;
  cbSetScale2D.Items.Clear;

  toolbar4.OnMouseLeave := nil;
  pnlMenubar.OnMouseMove := nil;

  for i := CMin_Z to CMax_Z do
  begin
    z := ZoomIndexToScale(i);
    cbSetScale.Items.Add(FloatToStr(z));
    cbSetScale2D.Items.Add(FloatToStr(z));
  end;
  // cbSetScale.ItemIndex := 8;
  // cbSetScaleChange(cbSetScale);


  lblRangeScale.Caption := cbSetScale.Text;

  lvTrackTable.SortType := stText;
//  TacticalDisplayControlPanel.TabIndex := 0;

  StatusBar1.DoubleBuffered := true;
  FHookOnPlatform := false;

  StatusBar1.Panels[9].Text := 'FROZEN';
  StatusBar1.Repaint;

  StatusBar1.Panels[12].Text := '';
  StatusBar1.Repaint;

  statusR_List := TList.Create;
  statusY_List := TList.Create;

  FLastMapCenterX := 0;
  FLastMapCenterY := 0;

  FIndexTrack := 0;

  TrackLists := TThreadList.Create;


//  if not Assigned(frmFormationEditor) then
//    frmFormationEditor := TfrmFormationEditor.Create(self);

  //create help dynamic
  setting := TIniFile.Create('D:\_Deni W\AOPR\AOPR - Ver. KOLAT\AOPR.bin\Setting.ini');
  tempString1 := TStringList.Create;

  setting.ReadSection('Help',tempString1);


  for k := 0 to tempString1.Count - 1 do begin
    subHelp := TMenuItem.Create(self);
    subHelp.Caption := setting.ReadString('Help',tempString1[k],'Default');
    Help1.Insert(k,subHelp);
    Help1.Items[k].Tag := 0;
    Help1.Items[k].OnClick := execPDF;
  end;

  pnlTabCounterMeasure.Visible := True;
  pnlCounterMeasure.Visible := True;

  {Camera Controller}
  trckbrPositionRange.FSelectValueSymbol := False;
  trckbrPositionRange.OnMouseDown := TBPositionRangeMouseDown;
  trckbrPositionRange.OnMouseUp := TBPositionRangeMouseUp;

  trckbrPositionElevation.FSelectValueSymbol := False;
  trckbrPositionElevation.OnMouseDown := TBPositionElevationMouseDown;
  trckbrPositionElevation.OnMouseUp := TBPositionElevationMouseUp;

  Self.OnKeyPress := edtFormKeyPress;

  Show;
end;

procedure TfrmTacticalDisplay.Initialize;
var
  i : Integer;
begin
  width := Screen.Monitors[vGameDataSetting.TacticalScreen].width;
  height := Screen.Monitors[vGameDataSetting.TacticalScreen].height;
  left := Screen.Monitors[vGameDataSetting.TacticalScreen].left;
  top := Screen.Monitors[vGameDataSetting.TacticalScreen].top;

  if Length(vTerrainArea.Area) > 0 then
  begin
    for i := 0 to Length(vTerrainArea.Area) -1 do
    begin
      cbbTerrain.Items.Add(vTerrainArea.Area[i]);
    end;
    cbbTerrain.Text := vTerrainArea.Area[0];
    cbbTerrain.ItemIndex := 0;
  end;
end;

procedure TfrmTacticalDisplay.FormDestroy(Sender: TObject);
begin
  Map1.Disconnect;

  TrackLists.Clear;
  TrackLists.Free;
end;

procedure TfrmTacticalDisplay.MapKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  v : TT3Vehicle;
  mx, my : Double;
begin
  if simMgrClient.ISInstructor then
  begin
    if Assigned(simMgrClient.ControlledPlatform) then
    begin
      if simMgrClient.ControlledPlatform is TT3Vehicle then
      begin
        v := TT3Vehicle(simMgrClient.ControlledPlatform);
        mx := v.getPositionX;
        my := v.getPositionY;
        if ssShift in Shift then
        begin
          if (key = 65) or (key = 68) or (key = 87) or (key = 83) then
          begin
            case key of
              65 : mx := v.getPositionX - 0.00001;
              68 : mx := v.getPositionX + 0.00001;
              87 : my := v.getPositionY + 0.00001;
              83 : my := v.getPositionY - 0.00001;
            end;

            simMgrClient.netSend_CmdPlatform_Move(v.InstanceIndex,
                        CORD_ID_REPOS, mx, my, 0);
          end;

          simMgrClient.netSend_CmdPlatform_Move(v.InstanceIndex,
                        CORD_ID_REPOS, mx, my, 0);
        end
        else
        begin
          if (key = 65) or (key = 68) or (key = 87) or (key = 83) then
          begin
            case key of
              65 : mx := v.getPositionX - 0.00002;
              68 : mx := v.getPositionX + 0.00002;
              87 : my := v.getPositionY + 0.00002;
              83 : my := v.getPositionY - 0.00002;
            end;

            simMgrClient.netSend_CmdPlatform_Move(v.InstanceIndex,
                        CORD_ID_REPOS, mx, my, 0);
          end;
        end;
      end;
    end;
  end;


end;

procedure TfrmTacticalDisplay.FormShow(Sender: TObject);
begin
  // Be_A_FullMap(false);
  if vGameDataSetting.GamePlayMode.GameType = byte(gpmReplay) then
     if btnStartGame.Visible = true then
        btnStartGameClick(Self);
  statusR_List.Clear;
  statusY_List.Clear;

  if focusedTrack <> nil then
    TT3PlatformInstance(focusedTrack).Selected := True;
end;

procedure TfrmTacticalDisplay.History1Click(Sender: TObject);
begin
  if not Assigned(fTrackHistory) then
    fTrackHistory := TfTrackHistory.Create(self);

  fTrackHistory.Show;
end;

procedure TfrmTacticalDisplay.History2Click(Sender: TObject);
begin
//  if not Assigned(fTrackHistory) then
//    fTrackHistory := TfTrackHistory.Create(self);
//
//  fTrackHistory.Show;
  if focusedTrack <> nil then
  begin
    if focusedTrack is TT3Vehicle then
    begin
      TT3Vehicle(focusedTrack).ShowTrails := not TT3Vehicle(focusedTrack)
        .ShowTrails;
      History2.Checked := TT3Vehicle(focusedTrack).ShowTrails;
      btnTrackHistory.Down := TT3Vehicle(focusedTrack).ShowTrails;
    end
    else if focusedTrack is TT3DetectedTrack then
    begin
      TT3DetectedTrack(focusedTrack).ShowTrails := not TT3DetectedTrack
        (focusedTrack).ShowTrails;
      History2.Checked := TT3DetectedTrack(focusedTrack).ShowTrails;
      btnTrackHistory.Down := TT3DetectedTrack(focusedTrack).ShowTrails;

    end;
  end;
end;

procedure TfrmTacticalDisplay.updateStatus_Yellow;
begin
  if statusY_List.Count > 0 then
  begin
    pnlStatusYellow.Visible := true;
    pnlStatusYellow.Caption := TStatus(statusY_List[statusY_List.Count-1]).state;
  end
  else
    pnlStatusYellow.Visible := false;
end;

procedure TfrmTacticalDisplay.updateStatus;
begin
  if statusR_List.Count > 0 then
  begin
    pnlStatusRed.Visible := true;
    pnlStatusYellow.Visible := true;
    pnlStatusRed.Caption := TStatus(statusR_List[statusR_List.Count-1]).state;
  end
  else
  begin
    pnlStatusRed.Visible  := false;
    if statusY_List.Count <= 0 then
      pnlStatusYellow.Visible := false

  end;
end;

procedure TfrmTacticalDisplay.addStatus_Yellow(status: String);
var status_state : TStatus;
begin
  status_state  := TStatus.Create;
  status_state.state := status;
  statusY_List.Add(status_state);
  updateStatus_Yellow;
end;

procedure TfrmTacticalDisplay.acticalInfoSet1Click(Sender: TObject);
begin
  if not Assigned(frmTacticalInfoSet) then
    frmTacticalInfoSet := TfrmTacticalInfoSet.Create(Self);

  frmTacticalInfoSet.Show;
end;

procedure TfrmTacticalDisplay.Add1Click(Sender: TObject);
begin
  if focusedTrack <> nil then
  begin
    AddTrackPlatform(focusedTrack);
  end;
end;

procedure TfrmTacticalDisplay.Remove1Click(Sender: TObject);
begin
  if Assigned(focusedTrack) then
    RemoveFromTrackList(focusedTrack);
end;

procedure TfrmTacticalDisplay.addStatus(status: String);
var status_state : TStatus;
begin
  status_state  := TStatus.Create;
  status_state.state := status;
  statusR_List.Add(status_state);
  updateStatus;
end;

procedure TfrmTacticalDisplay.lvPlatformlistSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  aObject : TSimObject;
  i : Integer;
  rec : TRec_CameraController;
begin
  if not Assigned(Item.Data) then
    Exit;

  aobject := item.Data;

  if aObject <> nil then
  begin
    try
      if aObject is TT3PlatformInstance then
        TT3PlatformInstance(aObject).Selected := Selected;

      if Selected then
      begin
        simMgrClient.MyCenterHookedPlatfom := focusedTrack;
        VSimMap.SetMapCenter(simMgrClient.MyCenterHookedPlatfom.getPositionX,
              simMgrClient.MyCenterHookedPlatfom.getPositionY);
        FLastMapCenterY := simMgrClient.MyCenterHookedPlatfom.getPositionY;
        FLastMapCenterX := simMgrClient.MyCenterHookedPlatfom.getPositionX;

        Map1.Repaint;
      end;

      if (chkControlCam.Checked) and (Selected = True) then
      begin
        rec.cmd := CORD_ID_CAMCON_SHOW_PLATFORM;
        rec.valueInt := TT3PlatformInstance(aObject).InstanceIndex;

        simMgrClient.netSend_CameraController(rec);
      end;
    except
      focusedTrack := nil;
      simMgrClient.MyCenterHookedPlatfom := nil;
    end;
  end;
end;

procedure TfrmTacticalDisplay.lvTrackControlSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  GrpVehicle : T3GroupVehicle;
  i : Integer;
  pi : TT3PlatformInstance;
begin
  UnSelectAllPlatformTrack;

  if Selected then
  begin
    GrpVehicle := T3GroupVehicle(item.Data);

    fmPlatformGuidance1.GrpVehicle := GrpVehicle;

//    fmPlatformGuidance1.DisplayTab(byte(vgtStraightLine));

    for i := 0 to GrpVehicle.CountVe - 1 do
    begin
      pi := TT3PlatformInstance(GrpVehicle.GetVehicle(i));
      pi.Selected := True;
    end;
  end
  else
  begin
    if Assigned(Item.Data) then
    begin
      GrpVehicle := T3GroupVehicle(item.Data);

      for i := 0 to GrpVehicle.CountVe - 1 do
      begin
        pi := TT3PlatformInstance(GrpVehicle.GetVehicle(i));
        pi.Selected := False;
      end;
    end;
  end;
end;


procedure TfrmTacticalDisplay.lvTrackTableSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  obj: TObject;
begin
  if Item = nil then
    exit;

  obj := Item.Data;
  if obj is TT3DetectedTrack then (obj as TT3DetectedTrack)
    .Selected := true
  else if obj is TT3PlatformInstance then (obj as TT3PlatformInstance)
    .Selected := true;

  Map1.Repaint;
end;

procedure TfrmTacticalDisplay.Manual1Click(Sender: TObject);
begin
  if not(focusedTrack is TT3DetectedTrack)
     and not(focusedTrack.Equals(esmSelected))
     and not (focusedTrack is TT3NonRealVehicle) then
    Exit;

  if not Assigned(frmChangeTrackNumber) then
    frmChangeTrackNumber := TfrmChangeTrackNumber.Create(self);

  frmChangeTrackNumber.Data := focusedTrack;
  frmChangeTrackNumber.Show;
end;

procedure TfrmTacticalDisplay.MapMouseSingle(Sender: TObject);
var
  pt: TPoint;
  mx, my: double;
  posX1, posY1, RangeGun: Double;
  isInsideBlindzoneGun : Boolean;
begin
  GetCursorPos(pt);
  pt := Map1.ScreenToClient(pt);

  simMgrClient.Converter.ConvertToMap(pt.x, pt.y, mx, my);

  case Map1.CurrentTool of
    mtSelectObject:
      begin

      end;
    mtDeployMine:
      begin
        if (Assigned(frmDeployMine)) and (frmDeployMine.Visible) then
          begin
            frmDeployMine.MapPositionX := mx;
            frmDeployMine.MapPositionY := my;
          end;
        Map1.CurrentTool := mtSelectObject;
        btnZoom.Down := False;
        if btnPan.Down then
        begin
          btnPan.Down := False;
          Pan1.Checked := False;
        end;
      end;
    mtDeployPosition:
      begin
        if (Assigned(frmRPLibrary)) and (frmRPLibrary.Visible) then
        begin
          frmRPLibrary.MapPositionX := mx;
          frmRPLibrary.MapPositionY := my;
        end
        else if (Assigned(frmlaunchCountRP)) and (frmlaunchCountRP.Visible) then
        begin
          frmlaunchCountRP.MapPositionX := mx;
          frmlaunchCountRP.MapPositionY := my;
        end
        else
        if (Assigned(frmEditNonRealTimeTrack)) and (frmEditNonRealTimeTrack.Visible) then
        begin
          with frmEditNonRealTimeTrack do
          begin
            MapPositionX := mx;
            MapPositionY := my;

            edtposLong.Text := formatDMS_long(mx);
            edtposLat.Text := formatDMS_latt(my);

            edtNRBPosLong.Text := formatDMS_long(mx);
            edtNRBPosLat.Text := formatDMS_latt(my);

            edtAOPPosLong.Text := formatDMS_long(mx);
            edtAOPPosLat.Text := formatDMS_latt(my);

            edtNRSPosLong.Text := formatDMS_long(mx);
            edtNRSPosLat.Text := formatDMS_latt(my);
          end;
        end
        else
        if ((Assigned(fmPlatformGuidance1)) and (fmPlatformGuidance1.Visible)
           and (fmPlatformGuidance1.grpCircle.Visible)
           and (fmPlatformGuidance1.grpStation.Visible))
           then
        begin
          fmPlatformGuidance1.MapPositionX := mx;
          fmPlatformGuidance1.MapPositionY := my;
        end
        else
        if ((Assigned(fmWeapon1)) and (fmWeapon1.Visible)
            and (fmWeapon1.grbGunEngagementAutomaticManualMode.Visible)) then
        begin
          fmWeapon1.MapPositionX := mx;
          fmWeapon1.MapPositionY := my;
        end;


        {wasdal UI}
        if simMgrClient.ISWasdal then
        begin
          if Assigned(frmGuidance) and (frmGuidance.fmPlatformGuidance1.Visible)
             and (frmGuidance.fmPlatformGuidance1.grpCircle.Visible)
             and (frmGuidance.fmPlatformGuidance1.grpStation.Visible)
             then
          begin
            frmGuidance.fmPlatformGuidance1.MapPositionX := mx;
            frmGuidance.fmPlatformGuidance1.MapPositionY := my;
          end
          else
          if Assigned(frmWeapon) and (frmWeapon.fmWeapon1.Visible)
              and (frmWeapon.fmWeapon1.grbGunEngagementAutomaticManualMode.Visible)
             then
          begin
            frmWeapon.fmWeapon1.MapPositionX := mx;
            frmWeapon.fmWeapon1.MapPositionY := my;
          end;
        end;


        Map1.CurrentTool := mtSelectObject;
        btnZoom.Down := False;
        if btnPan.Down then
        begin
          btnPan.Down := False;
          Pan1.Checked := False;
        end;
      end;
    {nando added}
    mtAimpoint :
      begin
        {wasdal UI}
        if simMgrClient.ISWasdal and assigned(frmWeapon) then
        begin
          if frmWeapon.fmWeapon1.focused_weapon is TT3HybridOnVehicle then begin

            frmWeapon.fmWeapon1.edtHybridMissiletargetAimpoint.Text :=
               formatDMS_long(mx) + ' ' + formatDMS_latt(my);

            TT3HybridOnVehicle(frmWeapon.fmWeapon1.focused_weapon).Aimpoint_Movement.PositionX := mx;
            TT3HybridOnVehicle(frmWeapon.fmWeapon1.focused_weapon).Aimpoint_Movement.PositionY := my;

          end else begin

            frmWeapon.fmWeapon1.editTacticalMissileTargetAimpoint.Text :=
               formatDMS_long(mx) + ' ' + formatDMS_latt(my);

            frmWeapon.fmWeapon1.TacticalMissileAimpointSet(Mx, MY);
          end;
        end else
        begin
          if fmWeapon1.focused_weapon is TT3HybridOnVehicle then begin

            fmWeapon1.edtHybridMissiletargetAimpoint.Text :=
               formatDMS_long(mx) + ' ' + formatDMS_latt(my);

            TT3HybridOnVehicle(fmWeapon1.focused_weapon).Aimpoint_Movement.PositionX := mx;
            TT3HybridOnVehicle(fmWeapon1.focused_weapon).Aimpoint_Movement.PositionY := my;

          end else begin

            fmWeapon1.editTacticalMissileTargetAimpoint.Text :=
               formatDMS_long(mx) + ' ' + formatDMS_latt(my);

            fmWeapon1.TacticalMissileAimpointSet(Mx, MY);
          end;
        end;
        Map1.CurrentTool := mtSelectObject;
        btnZoom.Down := False;
        if btnPan.Down then
        begin
          btnPan.Down := False;
          Pan1.Checked := False;
        end;
      end;
    mtDeployChaff :
      begin
        {wasdal UI}
        if simMgrClient.ISWasdal and assigned(frmWeapon) then
          frmWeapon.fmWeapon1.MapPosition(mx,my)
        else
          fmWeapon1.MapPosition(mx,my);
      end;
    mtDeployNGS :         //mk add
      begin
        if (Assigned(frmNGSGunSetup)) and (frmNGSGunSetup.Visible) then
        begin
          if (Assigned(frmNGSGunSetup.Weapon)) and (frmNGSGunSetup.Weapon is TT3GunOnVehicle) then
          begin
            posX1 := TT3PlatformInstance(TT3GunOnVehicle(frmNGSGunSetup.Weapon).Parent).PosX;
            posY1 := TT3PlatformInstance(TT3GunOnVehicle(frmNGSGunSetup.Weapon).Parent).PosY;
            RangeGun :=  CalcRange(posX1, posY1, mx, my);
            isInsideBlindzoneGun := TT3GunOnVehicle(frmNGSGunSetup.Weapon).InsideBlindZonePos(mx, my);

            if (RangeGun > TT3GunOnVehicle(frmNGSGunSetup.Weapon).GunDefinition.FData.Max_Range)
                or isInsideBlindzoneGun then
            begin
              frmNGSGunSetup.btnApply.Enabled    := False;

              MessageDlg('Target Point in blindzone or out of range!', mtWarning, [mbOK], 0);
              exit;
            end
            else
            begin
              frmNGSGunSetup.MapPositionX := mx;
              frmNGSGunSetup.MapPositionY := my;
              frmNGSGunSetup.SetBearingNGS(mx, my);
              frmNGSGunSetup.AddFlag(0);

              simMgrClient.TargetPoint.PosX := mx;
              simMgrClient.TargetPoint.PosY := my;

              frmNGSGunSetup.btnApply.Enabled    := True;
            end;
          end;
        end
      end;

      mtRocketBomb :
      begin
        if (Assigned(fmWeapon1)) and (fmWeapon1.Visible) then
        begin
          fmWeapon1.MapPosition(mx,my);
          fmWeapon1.AddFlag(0);

//
//          simMgrClient.TargetPoint.PosX := mx;
//          simMgrClient.TargetPoint.PosY := my;
        end;
      end;
  end;

  // tambahan ryu
  if assigned(focusedTrack)  then
  begin
    fmWeapon1.focused_platform := focusedTrack;
    fmPlatformGuidance1.focused_platform  := focusedTrack;

    {wasdal UI}
    if simMgrClient.ISWasdal then
    begin
      if Assigned(frmGuidance) then
        frmGuidance.fmPlatformGuidance1.focused_platform  := focusedTrack;

      if Assigned(frmWeapon) then
        frmWeapon.fmWeapon1.focused_platform  := focusedTrack;
    end;

    {Prince}
    fmOverlayEditor.TrackPlatform  := focusedTrack;
  end
  else if not assigned(focusedTrack) then
  begin
    fmWeapon1.focused_platform := nil;
    fmPlatformGuidance1.focused_platform  := nil;

    {wasdal UI}
    if simMgrClient.ISWasdal then
    begin
      if Assigned(frmGuidance) then
        frmGuidance.fmPlatformGuidance1.focused_platform  := nil;
      if Assigned(frmWeapon) then
        frmWeapon.fmWeapon1.focused_platform  := nil;
    end;

    fmOverlayEditor.TrackPlatform  := focusedTrack;
  end;
end;

procedure TfrmTacticalDisplay.MapMouseDouble(Sender: TObject);
var
  pt: TPoint;
  aObject: TSimObject;
  x, y: double;
  pi : TT3PlatformInstance;
  bObject : TT3PlatformInstance;
  SunoBoy : TT3Sonobuoy;
  I: Integer;
  rec : TRec_ControlledShip;
begin
  GetCursorPos(pt);
  pt := Map1.ScreenToClient(pt);

  simMgrClient.Converter.ConvertToMap(pt.x, pt.y, x, y);

  aObject := simMgrClient.FindNearestTrack(x, y, 15); //edit andik suneo

  if (aObject <> nil) and (aObject is TT3PlatformInstance) then
  begin
    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
    begin
      if aObject is TT3NonRealVehicle then
      begin
        TT3NonRealVehicle(aObject).Selected := true;
        Map1.Repaint;

      end
      else if aObject is TT3PlatformInstance then
      begin
        pi := TT3PlatformInstance(aObject);
        if pi.UnitGroup then
        begin
          if simMgrClient.ISWasdal then
          begin
            UpdateControlledPlatform;

            if TT3Vehicle(pi).Vehicle_Control.Controlled = False then
            begin
              rec.PlatformID := simMgrClient.PIDControlledPlatform;
              rec.Controlled := False;
              rec.ControlledName := '';
              simMgrClient.netSend_cmd_ControlledShip(rec);

              rec.PlatformID := pi.InstanceIndex;
              rec.Controlled := True;
              simMgrClient.PIDControlledPlatform := pi.InstanceIndex;

              simMgrClient.netSend_cmd_ControlledShip(rec);

              pi.Controlled := true;
              pi.Selected   := true;

              simMgrClient.netSend_VoipControlledChanged(pi.InstanceIndex);
            end
            else
            begin
              if TT3Vehicle(pi).Vehicle_Control.Control_Name <> simMgrClient.ConsoleName then
                addStatus(pi.Track_ID + ' Controlled by ' + TT3Vehicle(pi).Vehicle_Control.Control_Name);
            end;
          end
          else
          begin
            pi.Controlled := true;
            pi.Selected   := true;
            fmPlatformGuidance1.GrpVehicle := nil;

            simMgrClient.netSend_VoipControlledChanged(pi.InstanceIndex);
          end;

          //check all sunoboy
          for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
          begin
            bObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));

            if bObject Is TT3Sonobuoy then
            begin
              SunoBoy := TT3Sonobuoy(bObject);
              SunoBoy.Gambar := false;

              if SunoBoy.ParentIndex = TT3PlatformInstance(pi).InstanceIndex then
              begin
                SunoBoy.Gambar := True;
              end;

            end;
          end;

          Map1.Repaint;
        end;
      end;
    end
    else
    begin
      if aObject is TT3NonRealVehicle then
      begin
        TT3NonRealVehicle(aObject).Selected := true;
        Map1.Repaint;
      end
      else if aObject is TT3DetectedTrack then
      begin
        TT3DetectedTrack(aObject).Selected := true;
        Map1.Repaint;
      end
      else if aObject is TT3PlatformInstance then
      begin
        pi := TT3PlatformInstance(aObject);
        if pi.UnitGroup then
        begin
          UpdateControlledPlatform;
          if TT3Vehicle(pi).Vehicle_Control.Controlled = False then
          begin
            rec.PlatformID := simMgrClient.PIDControlledPlatform;
            rec.Controlled := False;
            rec.ControlledName := '';
            simMgrClient.netSend_cmd_ControlledShip(rec);

            rec.PlatformID := pi.InstanceIndex;
            rec.Controlled := True;
            simMgrClient.PIDControlledPlatform := pi.InstanceIndex;

            simMgrClient.netSend_cmd_ControlledShip(rec);

            pi.Controlled := true;
            pi.Selected   := true;

            fmPlatformGuidance1.GrpVehicle := nil;
            simMgrClient.netSend_VoipControlledChanged(pi.InstanceIndex);
          end
          else
          begin
            if TT3Vehicle(pi).Vehicle_Control.Control_Name <> simMgrClient.ConsoleName then
              addStatus(pi.Track_ID + ' Controlled by ' + TT3Vehicle(pi).Vehicle_Control.Control_Name);
          end;

          Map1.Repaint;
        end;
      end;
    end;
  end;

  {Prince}
//  simMgrClient.DrawStrategiTemplate.ShowPlot(pt);

  clearPopRightClick;
  pmPopupMenu1.Popup(0,0);

  Cursor := crDefault;
end;

procedure TfrmTacticalDisplay.MapMouseExit(Sender: TObject);
begin
  lbLongitude.Caption := '---';
  lbLatitude.Caption := '---';
end;

procedure TfrmTacticalDisplay.MapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; x, y: Integer);
var
  i, IdPlotting : Integer;
  mx, my, mx2, my2: Double;
  newCourseTemp : Double;
  valTemp : string;
  stateTemp : Boolean;

  pos: TPoint;
  objTemp, obj2Temp: TObject;
  simObjTemp : TSimObject;

  base : TMainPlottingTemplate;
  shape : TMainPlottingShape;

  rec : TRecCmdMultiMode;
begin
  {Get point }
  simMgrClient.Converter.ConvertToMap(x, y, mx, my);
  GetCursorPos(pos);

  if Map1.CurrentTool = mtMultiMode then
  begin
   mptDown.X := x;
   mptDown.Y := Y;
  end;

  simMgrClient.Converter.ConvertToScreen(mx, my, pos.X, pos.Y);

  {$REGION ' Select Object '}
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    {$REGION ' Select Object di Instruktur dan Wasdal '}
    objTemp := simMgrClient.FindNearestTrack(mx, my, 15);

    if objTemp = nil then
      objTemp := simMgrClient.FindNearestRBLWaypointTrack(mx, my, 15);

    if objTemp = nil then
      objTemp := simMgrClient.FindNearestBOLWaypointTrack(mx, my, 15);

    {$ENDREGION}
  end
  else
  begin
    {$REGION ' Select Object di Operator '}
    objTemp := simMgrClient.FindNearestDetectedTrack(mx, my, 15);

    if objTemp = nil then
      objTemp := simMgrClient.FindNearestTrack(mx, my, 15);

    if objTemp = nil then
      objTemp := simMgrClient.FindNearestRBLWaypointTrack(mx, my, 15);

    if objTemp = nil then
      objTemp := simMgrClient.FindNearestBOLWaypointTrack(mx, my, 15);

    {$ENDREGION}
  end;
  {$ENDREGION}

  case Button of

    {$REGION ' Mouse down klik kiri '}
    mbLeft :
    begin
      FLeftMouseDown := true;


      if (ssShift in Shift) then
      begin
        {$REGION ' Mouse down klik kiri + key Shift '}
        if not Assigned(frmlaunchCountRP) then
          frmlaunchCountRP := TfrmlaunchCountRP.Create(Self);

          frmlaunchCountRP.Show;
        {$ENDREGION}
      end
      else if (ssCtrl in Shift) then
      begin
        {$REGION ' Mouse down klik kiri + key Ctrl '}
        {Wasdal UI}
        if simMgrClient.ISWasdal and Assigned(frmGuidance) then
        begin
          if Assigned(frmGuidance.lvTrackControl.Selected) then
          begin
            simMgrClient.Converter.ConvertToMap(x, y, mx2, my2);

            if Assigned(lvTrackControl.Selected) then
            begin
              if Assigned(lvTrackControl.Selected.Data) then
              begin
                rec.GroupID := T3GroupVehicle(frmGuidance.lvTrackControl.Selected.Data).GroupID;
                rec.CountVehicle := T3GroupVehicle(frmGuidance.lvTrackControl.Selected.Data).CountVe - 1;
                rec.aAction := Byte(C_MOVE);
                rec.X := mx2;
                rec.Y := my2;

                simMgrClient.netSend_CmdMultiMode(rec);
              end;
            end;

            mptCenter.X := x;
            mptCenter.Y := y;
          end;
        end
        else  if simMgrClient.ISInstructor then
        begin
          simMgrClient.Converter.ConvertToMap(x, y, mx2, my2);

          if Assigned(lvTrackControl.Selected) then
          begin
            if Assigned(lvTrackControl.Selected.Data) then
            begin
              rec.GroupID := T3GroupVehicle(lvTrackControl.Selected.Data).GroupID;
              rec.CountVehicle := T3GroupVehicle(lvTrackControl.Selected.Data).CountVe - 1;
              rec.aAction := Byte(C_MOVE);
              rec.X := mx2;
              rec.Y := my2;

              simMgrClient.netSend_CmdMultiMode(rec);
            end;
          end;

          mptCenter.X := x;
          mptCenter.Y := y;
        end;
        {$ENDREGION}
      end
      else
      begin
        {$REGION ' Mouse down klik kiri saja '}

        {$REGION ' Belum Tahu Fungsinya '}
        lvTrackControl.Selected := nil;
        fmPlatformGuidance1.GrpVehicle := nil;

        if simMgrClient.ISWasdal and Assigned(frmGuidance) then
        begin
          frmGuidance.lvTrackControl.Selected := nil;
          frmGuidance.fmPlatformGuidance1.GrpVehicle := nil;
          fmPlatformGuidance1.GrpVehicle := nil;
        end;
        {$ENDREGION}

        case Map1.CurrentTool of
          mtSelectObject :
          begin

            {$REGION ' Select Info Balloon '}
            infoBalloon := simMgrClient.FindNearestInfoBalloon(X, Y);
            {$ENDREGION}

            if not Assigned(infoBalloon) then
            begin

              {$REGION ' Find Object Selected '}
              if objTemp <> nil then
              begin
                focusedTrack := nil;

                // unselect all track
                UnSelectAllRBLWPointTrack;
                UnSelectAllBOLWPointTrack;
                UnSelectAllPlatformTrack;
                UnSelectAllNRPlatformTrack;
                UnselectAllDetectedTrack;

                fmPlatformGuidance1.clearPlatformMultiSelectList;

                {Wasdal UI}
                if simMgrClient.ISWasdal then
                begin
                  if Assigned(frmGuidance) then
                    frmGuidance.fmPlatformGuidance1.clearPlatformMultiSelectList;
                end;

                if objTemp is TPointVehicleMissileRBLW then
                  TPointVehicleMissileRBLW(objTemp).Selected := True
                else
                if objTemp is TPointVehicleMissileBOLW then
                  TPointVehicleMissileBOLW(objTemp).Selected := True
                else
                if objTemp is TT3PlatformInstance then
                  TT3PlatformInstance(objTemp).Selected := true
                else
                if objTemp is TT3DetectedTrack then
                  TT3DetectedTrack(objTemp).Selected := true;

                focusedTrack := TSimObject(objTemp);

                if Assigned(focusedTrack) then
                begin
                  if ((focusedTrack is TT3PlatformInstance) or (focusedTrack is TT3NonRealVehicle)) then
                  begin
                    if Assigned(tmMove) then
                      tmMove.Enabled := true;
                  end;

                  // wasdal view
                  if simMgrClient.ISWasdal then
                  begin
                    for i := 0 to frmTop.cbAssumeControl.Items.Count - 1 do
                    begin
                      obj2Temp := frmTop.cbAssumeControl.Items.Objects[i];

                      if focusedTrack = obj2Temp then
                        break;
                    end;

                    frmTop.cbAssumeControl.ItemIndex := i;
                  end
                  else
                  begin
                    for i := 0 to cbAssumeControl.Items.Count - 1 do
                    begin
                      obj2Temp := cbAssumeControl.Items.Objects[i];

                      if focusedTrack = obj2Temp then
                        break;
                    end;

                    cbAssumeControl.ItemIndex := i;
                  end;
                end;
              end;
              {$ENDREGION}

              {$REGION ' Find ESM Selected '}
              if (focusedTrack <> nil) then
              begin
                if (focusedTrack is TT3Vehicle) and not(focusedTrack is TT3NonRealVehicle) then
                begin
                  for i := 0 to simMgrClient.SimDevices.itemCount - 1 do
                  begin
                    simObjTemp := simMgrClient.SimDevices.getObject(i);
                    if (simObjTemp is TT3ESMTrack) then
                    begin
                       if (TT3ESMTrack(simObjTemp).TextVisual.Center.X = mx) and (TT3ESMTrack(simObjTemp).TextVisual.Center.Y = my) then
                       begin
                          TT3ESMTrack(simObjTemp).TextVisual.Color := clYellow;
                       end;
                    end;
                  end;
                end;
              end;
              {$ENDREGION}

              {$REGION ' Find Plotting Selected '}
              simMgrClient.SimPlotting.SelectProperty(pos,simMgrClient.ConsoleName, simMgrClient.ISInstructor);
              {$ENDREGION}

            end;
          end;
          mtEditOverlayStatic :
          begin
            {$REGION ' Select Overlay Static '}
//            simMgrClient.Converter.ConvertToScreen(mx, my, pos.X, pos.Y);
            fmOverlayEditor.SelectShape(pos)
            {$ENDREGION}

          end;
          mtEditLogistic :
          begin
            {$REGION ' Add next point Logistic Calculation '}
            with fmLogisticTamplate do
            begin
              TempX1 := mx;
              TempY1 := my;

              if btnFirstPointLog.down then
              begin
                edtFirstPosX.Text := formatDMS_long(mx);
                edtFirstPosY.Text := formatDMS_latt(my);
                AddFlag(0);
              end
              else if btnSecondPointLog.down then
              begin
                edtSecondPosX.Text := formatDMS_long(mx);
                edtSecondPosY.Text := formatDMS_latt(my);
                AddFlag(1);
              end;
            end;
            {$ENDREGION}

          end;
          mtAddOverlay :
          begin
            {$REGION ' Add Overlay '}
            fmOverlayEditor.PostX := mx;
            fmOverlayEditor.PostY := my;
            fmOverlayEditor.FillEditText;

            if fmOverlayEditor.ShapeType = ovPolygon then
            begin
              if fmOverlayEditor.SpeedButton10.Down then
              begin
                if fmOverlayEditor.lvPolyVertex.Items.Count + 1 > 12 then
                begin
                  ShowMessage('The number of points exceeds the maximum polygon point (13 points) ');
                  Exit;
                end;

                fmOverlayEditor.GbrFlagPoint(mx, my);

                with fmOverlayEditor.lvPolyVertex.Items.Add do
                begin
                  SubItems.Add(formatDMS_long(mx));
                  SubItems.Add(formatDMS_latt(my));
                end;

                fmOverlayEditor.RefreshLvPolyVertexList(1);
              end;
            end
            else
            begin
              fmOverlayEditor.GbrFlagPoint(mx, my);

              Map1.CurrentTool := mtSelectObject;
              btnZoom.Down := False;
              if btnPan.Down then
              begin
                btnPan.Down := False;
                Pan1.Checked := False;
              end;
            end;
            {$ENDREGION}

          end;
          mtAddLogistic :
          begin
            {$REGION ' Add first point Logistic Calculation '}
            fmLogisticTamplate.TempX1 := mx;
            fmLogisticTamplate.TempY1 := my;
            fmLogisticTamplate.AddRoute;
            {$ENDREGION}

          end;
          mtAddPlotting :
          begin
           {$REGION ' Add Position Plotting '}
            with frmStrategiEditor do
            begin
              xTemp := mx;
              yTemp := my;

              case flagBtn of
                0:
                begin
                  edtBasePosX.Text := formatDMS_long(mx);
                  edtBasePosY.Text := formatDMS_latt(my);
                  AddFlag(0);
                end;
                1:
                begin
                  edtEndPosX.Text := formatDMS_long(mx);
                  edtEndPosY.Text := formatDMS_latt(my);
                  AddFlag(1);
                end;

              end;
            end;

            Map1.CurrentTool := mtSelectObject;

            btnZoom.Down := False;

            if btnPan.Down then
            begin
              btnPan.Down := False;
              Pan1.Checked := False;
            end;
            {$ENDREGION}

          end;
          mtRuler :
          begin
            {$REGION ' Ruller '}
            {untuk convert dari map ke screen }

            if objTemp <> nil then
            begin
              fmPlatformGuidance1.clearPlatformMultiSelectList;

              if simMgrClient.ISWasdal then
              begin
                if Assigned(frmGuidance) then
                  frmGuidance.fmPlatformGuidance1.clearPlatformMultiSelectList;
              end;

              if objTemp is TT3PlatformInstance then
              begin
                if frmRuler.IsStart then     {object yg terpilih untuk koordinat awal}
                begin
                  frmRuler.IsSVisible := True;
                  frmRuler.SRulerTrack := TT3PlatformInstance(objTemp);

                  TT3PlatformInstance(objTemp).Selected := True;

                end
                else if frmRuler.IsEnd then   {object yg terpilih untuk koordinat akhir}
                begin
                  frmRuler.IsEVisible := True;
                  frmRuler.ERulerTrack := TT3PlatformInstance(objTemp);

                  TT3PlatformInstance(objTemp).Selected := True;

                end;
              end
              else
              begin
                if frmRuler.IsStart then      {koordianat awal bukan object}
                begin
                  frmRuler.StartPosX := mx;
                  frmRuler.StartPosY := my;
                  frmRuler.STempX := frmRuler.StartPosX;
                  frmRuler.STempY := frmRuler.StartPosY
                end
                else if frmRuler.IsEnd then    {koordinat akhir bukan object}
                begin
                  frmRuler.EndPosX := mx;
                  frmRuler.EndPosY := my;
                  frmRuler.ETempX := frmRuler.StartPosX;
                  frmRuler.ETempY := frmRuler.StartPosY
                end;
              end;

              frmRuler.IsSelected := True;

              if Assigned(tmMove) then
                tmMove.Enabled := False;
            end
            else
            begin
              if frmRuler.IsStart then      {parameter berasal dari start atau end}
                frmRuler.IsSVisible := False;
              if frmRuler.IsEnd then
                frmRuler.IsEVisible := False;

              if not frmRuler.IsSVisible and  not frmRuler.IsEVisible then
                frmRuler.IsSelected := False;   {filter bila semua bukan object}

              UnSelectAllPlatformTrack;

              fmPlatformGuidance1.clearPlatformMultiSelectList;

              if simMgrClient.ISWasdal then
              begin
                if Assigned(frmGuidance) then
                  frmGuidance.fmPlatformGuidance1.clearPlatformMultiSelectList;
              end;

              if frmRuler.IsStart then      {koordianat awal bukan object}
              begin
                frmRuler.StartPosX := mx;
                frmRuler.StartPosY := my;
                frmRuler.STempX := frmRuler.StartPosX;
                frmRuler.STempY := frmRuler.StartPosY
              end
              else if frmRuler.IsEnd then    {koordinat akhir bukan object}
              begin
                frmRuler.EndPosX := mx;
                frmRuler.EndPosY := my;
                frmRuler.ETempX := frmRuler.StartPosX;
                frmRuler.ETempY := frmRuler.StartPosY
              end;
              frmRuler.FillEditText;
            end;
            {$ENDREGION}

          end;
          mtCameraPosition :
          begin
            {$REGION ' Select Camera Position '}
            simMgrClient.netSend_CmdCameraTrackPos(my, mx);
            Map1.CurrentTool := mtSelectObject;
            btnZoom.Down := False;
            if btnPan.Down then
            begin
              btnPan.Down := False;
              Pan1.Checked := False;
            end;
            {$ENDREGION}

          end;
        end;

        {$REGION ' Anchor '}
        if FAnchorFilterEnabled and Assigned(anchorTrack) then
        begin
          isOnAnchorLine := simMgrClient.LineVisual.isPointOnLine(mx, my);
          if isOnAnchorLine {and (not (anchorTrack is TT3NonRealVehicle))} then
          begin
            Map1.CurrentTool := mtAnchorTool;

            simMgrClient.LineVisual.Range := CalcRange(anchorTrack.getPositionX,anchorTrack.getPositionY, mx, my);
            simMgrClient.LineVisual.Bearing := CalcBearing(anchorTrack.getPositionX, anchorTrack.getPositionY, mx, my);
          end;
        end;
        {$ENDREGION}

        {$ENDREGION}

      end;
    end;
    {$ENDREGION}

    {$REGION ' Mouse down klik kanan '}
    mbRight :
    begin
      if (ssShift in Shift) then
      begin

        {$REGION ' Mouse down klik kanan + key Shift '}
        if Assigned(lvTrackControl.Selected) then
        begin
          if (simMgrClient.ISInstructor) or (simMgrClient.ISWasdal and Assigned(frmGuidance)) then
          begin
            repeat
              valTemp := InputBox('Change Course', 'New Course: ', '0');
            until valTemp <> '';

            try

              newCourseTemp := StrToFloat(valTemp);
              newCourseTemp := ValidateDegree(newCourseTemp);

              if (simMgrClient.ISWasdal and Assigned(frmGuidance)) then
              begin
                if Assigned(frmGuidance.lvTrackControl.Selected) then
                begin
                  rec.GroupID := T3GroupVehicle(frmGuidance.lvTrackControl.Selected.Data).GroupID;
                  rec.CountVehicle := T3GroupVehicle(frmGuidance.lvTrackControl.Selected.Data).CountVe - 1;
                  rec.aAction := Byte(C_HEADING);
                  rec.param := newCourseTemp;
                  rec.X := mx2;
                  rec.Y := my2;

                  simMgrClient.netSend_CmdMultiMode(rec);
                end;
              end
              else
              begin
                if Assigned(lvTrackControl.Selected) then
                begin
                  rec.GroupID := T3GroupVehicle(lvTrackControl.Selected.Data).GroupID;
                  rec.CountVehicle := T3GroupVehicle(lvTrackControl.Selected.Data).CountVe - 1;
                  rec.aAction := Byte(C_HEADING);
                  rec.param := newCourseTemp;
                  rec.X := mx2;
                  rec.Y := my2;

                  simMgrClient.netSend_CmdMultiMode(rec);
                end;
              end;

            except
              on E : Exception do
                MessageDlg('invalid course!!',mtError, mbOKCancel, 0);
            end;
          end;
        end
        {$ENDREGION}

      end
      else
      begin

        {$REGION ' Mouse down klik kanan saja '}
        case Map1.CurrentTool of
          mtSelectObject :
          begin
            {$REGION ' Select Object '}

            {$REGION ' Show pop up plotting '}
            if simMgrClient.SimPlotting.SelectPlot(pos, IdPlotting, stateTemp) then
            begin
              frmStrategiEditor.SelectedPlottingId := IdPlotting;

              if stateTemp then
                miPlottingShow.Caption := '&Hide'
              else
                miPlottingShow.Caption := '&Show';

              pmPlotting.Popup(pos.X, pos.Y);
              Exit;
            end;
            {$ENDREGION}

            {$REGION ' Show pop up base '}
            if simMgrClient.SimPlatformBase.SelectBase(pos, stateTemp) then
            begin
              if stateTemp then
                miSHowBase.Caption := 'Hide'
              else
                miSHowBase.Caption := 'Show';

              pmbase.Popup(pos.X, pos.Y);
              Exit;
            end;
            {$ENDREGION}

            // set new point for new NRT Platform
            newPoint.x := x;
            newPoint.y := y;

            if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            begin
              {$REGION ' Instructor/ Wasdal Section '}
              if objTemp <> nil then
              begin
                {$REGION ' Yang di hook TT3PlatformInstance '}
                if objTemp is TT3PlatformInstance then
                begin
                  TT3PlatformInstance(objTemp).Selected := true;
                  focusedTrack := TT3PlatformInstance(objTemp);

                  setPopUpPropItem(TSimObject(focusedTrack));
                  setHookPopup;

                  mniMerge1.Enabled := False;
                  mniSplit1.Enabled := False;
                  mniIntiate1.Enabled := False;

                  if focusedTrack is TT3Sonobuoy then
                  begin
                    {$REGION ' Sonobuoy Section '}
                    {Ketika klik kanan sonobuoy yg lain di hiden}
                    mniCharacteristic1.Visible  := False;
                    mniDatalink1.Visible        := False;
                    mniTrackNumber1.Visible     := False;
                    mniTrackHistory1.Visible    := False;
                    mniBreakAllFireControl1.Visible := False;
                    mniClearRing1.Visible       := False;
                    {$ENDREGION}
                  end
                  else if focusedTrack is TT3Torpedo then
                  begin
                    {$REGION ' Torpedo Section '}
                    {Ketika klik kanan Torpedo Wire Guided}
                    mniCharacteristic1.Visible  := False;
                    mniDatalink1.Visible        := False;
                    mniTrackNumber1.Visible     := False;
                    mniTrackHistory1.Visible    := False;
                    mniBreakAllFireControl1.Visible := False;
                    mniClearRing1.Visible       := False;
                    {$ENDREGION}
                  end
                  else if focusedTrack is TT3NonRealVehicle then
                  begin
                    {$REGION ' NonRealVehicle Section '}
                    mniCharacteristic1.Enabled := true;
                    mniDomain1.Enabled := true;
                    mniPlatformType1.Enabled   := true;
                    mniTrackTable1.Visible := true;
                    mniChangeCourse1.Visible := False;
                    mniReleasePlatform1.Visible := False;
                    {$ENDREGION}
                  end
                  else
                  begin
                    {$REGION ' Other Section '}
                    mniCharacteristic1.Enabled := false;
                    mniDomain1.Enabled := false;
                    mniPlatformType1.Enabled   := false;
                    mniTrackNumber1.Visible := false;
                    mniChangeCourse1.Visible := false;
                    mniReleasePlatform1.Visible := false;
                    mniTrackTable1.Visible := False;
                    {$ENDREGION}
                  end;
                end;
                {$ENDREGION}
              end
              else
              begin
                setFreePopup;
              end;

              pmPopupMenu1.Popup(pos.X, pos.Y);
              {$ENDREGION}
            end
            else
            begin
              {$REGION ' Operator Section '}
              if objTemp <> nil then
              begin
                if objTemp is TT3PlatformInstance then
                begin
                  {$REGION ' Yang di hook TT3PlatformInstance '}
                  TT3PlatformInstance(objTemp).Selected := true;
                  focusedTrack := TT3PlatformInstance(objTemp);

                  setPopUpPropItem(TSimObject(focusedTrack));
                  setHookPopup;

                  mniMerge1.Enabled := False;
                  mniSplit1.Enabled := False;
                  mniIntiate1.Visible := False;

                  if focusedTrack is TT3Sonobuoy then
                  begin
                    {$REGION ' Sonobuoy Section '}
                    {Ketika klik kanan sonobuoy yg lain di hiden}
                    mniCharacteristic1.Visible  := False;
                    mniMerge1.Visible           := False;
                    mniSplit1.Visible           := False;
                    mniDatalink1.Visible        := False;
                    mniTrackNumber1.Visible     := False;
                    mniTrackHistory1.Visible    := False;
                    mniBreakAllFireControl1.Visible := False;
                    mniClearRing1.Visible       := False;
                    {$ENDREGION}
                  end
                  else if focusedTrack is TT3Torpedo then
                  begin
                    {$REGION ' Torpedo Section '}
                    {Ketika klik kanan Torpedo Wire Guided}
                    mniCharacteristic1.Visible  := False;
                    mniDatalink1.Visible        := False;
                    mniTrackNumber1.Visible     := False;
                    mniTrackHistory1.Visible    := False;
                    mniBreakAllFireControl1.Visible := False;
                    mniClearRing1.Visible       := False;
                    {$ENDREGION}
                  end
                  else if focusedTrack is TT3NonRealVehicle then
                  begin
                    {$REGION ' NonRealVehicle Section '}
                    mniCharacteristic1.Enabled := true;
                    mniDomain1.Enabled := true;
                    mniPlatformType1.Enabled   := true;
                    mniTrackTable1.Visible := True;
                    mniBreakAllFireControl1.Enabled := false;
                    {$ENDREGION}
                  end
                  else if focusedTrack is TT3Vehicle then
                  begin
                    {$REGION ' Vehicle Section '}
                    mniCharacteristic1.Enabled := false;
                    mniTrackNumber1.Enabled := false;
                    mniTrackTable1.Visible := True;
                    {$ENDREGION}
                  end;

                  pmPopupMenu1.Popup(pos.x, pos.y);

                  {$ENDREGION}
                end
                else if objTemp is TT3DetectedTrack then
                begin
                  {$REGION ' Yang di hook TT3DetectedTrack '}
                  { tambahan dari Aldy : tambahkan show pop menu ketika yg hooked }
                  // focusedTrack := simMgrClient.FindNearestTrack(mx, my, 10);
                  if TT3DetectedTrack(objTemp).Selected <> true then   //add andik
                    TT3DetectedTrack(objTemp).Selected := true;

                  focusedTrack := TT3DetectedTrack(objTemp);
                  setHookPopup;

                  if Assigned(focusedTrack) then
                  begin
                    if focusedTrack is TSimObject then
                    begin
                      setPopUpPropItem(TSimObject(focusedTrack));
                    end;

                    mniCharacteristic1.Enabled := true;
                    mniDomain1.Enabled := false;
                    mniPlatformType1.Enabled   := false;

                    if TT3DetectedTrack(focusedTrack).MergedESM = nil then
                    begin
                      mniMerge1.Enabled := true;
                      mniSplit1.Enabled := false;
                    end
                    else
                    begin
                      mniMerge1.Enabled := false;
                      mniSplit1.Enabled := true;
                    end;

                    mniIntiate1.Enabled := false;
                    mniBreakAllFireControl1.Enabled := false;
                    mniTrackNumber1.Enabled := true;
                    mniTrackTable1.Visible := True;

                  end
                  else
                  begin
                    // jika tidak hooked
                    { disable characteristic }
                    mniCharacteristic1.Enabled := false;
                    mniMerge1.Enabled := False;
                    mniSplit1.Enabled := false;
                    mniMerge1.Enabled := false;
                    mniSplit1.Enabled := false;
                    mniIntiate1.Enabled := false;
                    mniBreakAllFireControl1.Enabled := false;
                    mniTrackTable1.Visible := False;
                  end;

                  pmPopupMenu1.Popup(pos.x, pos.y);

                  {$ENDREGION}
                end
                else
                begin
                  {$REGION ' Tidak ada yang di hook '}
                  mniCharacteristic1.Enabled := false;
                  mniMerge1.Enabled := False;
                  mniSplit1.Enabled := false;
                  mniMerge1.Enabled := false;
                  mniSplit1.Enabled := false;
                  mniIntiate1.Enabled := false;
                  mniBreakAllFireControl1.Enabled := false;
                  {$ENDREGION}
                end;

              end
              else
              begin
                if Assigned(esmSelected) then
                begin
                  setHookPopup;
                  focusedTrack := esmSelected;

                  if focusedTrack is TSimObject then
                  begin
                    setPopUpPropItem(TSimObject(focusedTrack));
                  end;

                  mniCharacteristic1.Enabled := true;
                  mniDomain1.Enabled := true;
                  mniPlatformType1.Enabled   := false;
                  mniTrackNumber1.Enabled := true;

                  mniMerge1.Enabled := true;
                  mniSplit1.Enabled := false;
                  mniBreakAllFireControl1.Enabled := false;
                end
                else
                begin
                  setFreePopup;
                end;

                pmPopupMenu1.Popup(pos.x, pos.y);
              end;
              {$ENDREGION}
            end;

            {$ENDREGION}
          end;
          mtEditOverlayStatic, mtEditOverlayDynamic:
          begin
            {$REGION ' Show pop up overlay '}
            if fmOverlayEditor.IsEditObject then
            begin
//              if overlayeditpopup then
//              begin
                pmOverlayEdit.Popup(pos.X, pos.Y);
                Exit;
//              end;
            end;
            {$ENDREGION}
          end;
        end;
        {$ENDREGION}
      end;
    end;
    {$ENDREGION}

  end;

  if setFocusedESMTrack(FLeftMouseDown, mx, my) then
  begin
    //unselect obj sebelunnya
    if objTemp <> nil then
    begin
      if objTemp is TPointVehicleMissileRBLW then
        TPointVehicleMissileRBLW(objTemp).Selected := False
      else
      if objTemp is TPointVehicleMissileBOLW then
        TPointVehicleMissileBOLW(objTemp).Selected := False
      else
      if objTemp is TT3PlatformInstance then
        TT3PlatformInstance(objTemp).Selected := False
      else if objTemp is TT3DetectedTrack then
        TT3DetectedTrack(objTemp).Selected := False;
    end;
  end;

  if Assigned (focusedTrack) then
  begin
    if focusedTrack is TT3DetectedTrack then      //set btn split top panel
    begin
      if Assigned(TT3DetectedTrack(focusedTrack).MergedESM) then
      begin
        btnSplit.Enabled := True;
        isStatusMerge := True;
      end
      else
      begin
        btnSplit.Enabled := False;
        isStatusMerge := False;
      end;
    end;
  end;

  RBLWPointX := mx;
  RBLWPointY := my;

  startMoveX := X;
  startMoveY := Y;
end;

procedure TfrmTacticalDisplay.MapMouseMove(Sender: TObject; Shift: TShiftState;
  x, y: Integer);
var
  r, b, mx, my, long, lat : Double;
  sX, sY, offsetX, offsetY : Integer;
  pX, pY : Extended;
  PointRBLW : TPointVehicleMissileRBLW;
  PointBOLW : TPointVehicleMissileBOLW;
  balloon : TPlatformInfoBalloon;
  hasilUTM, hasilMGRS : string;   //dng
begin
  simMgrClient.Converter.ConvertToMap(x, y, mx, my);
  lbLongitude.Caption := formatDMS_long(mx);
  lbLatitude.Caption := formatDMS_latt(my);

     //==== dng utm and mgrs ===//
  ConvDegree_To_UTM_and_MGRS(my, mx, hasilUTM, hasilMGRS);

  lblUTM.Caption := hasilUTM;
  lblMGRS.Caption := hasilMGRS;

  {ruler mode}
//  if FLeftMouseDown and (Map1.CurrentTool = mtRuler) then
//  begin
//    frmRuler.EndPositionX := mx;
//    frmRuler.EndPositionY := my;
//    frmRuler.FillEditText;

//    r := CalcRange(simMgrClient.LineVisual.X1, simMgrClient.LineVisual.Y1, mx, my);
//    b := CalcBearing(simMgrClient.LineVisual.X1, simMgrClient.LineVisual.Y1, mx, my);

//    simMgrClient.LineVisual.Range := r;
//    simMgrClient.LineVisual.Bearing := b;
//  end;

  if FAnchorFilterEnabled {and FLeftMouseDown} then
  begin
//    if isOnAnchorLine and Assigned(anchorTrack) and (Map1.CurrentTool = mtAnchorTool) then
//    begin
      if Assigned(anchorTrack) then
      begin
        r := CalcRange(anchorTrack.getPositionX, anchorTrack.getPositionY, mx, my);
        b := CalcBearing(anchorTrack.getPositionX, anchorTrack.getPositionY, mx, my);
        simMgrClient.LineVisual.Range := r;
        simMgrClient.LineVisual.Bearing := b;

        lbRangeAnchor.Caption := FormatFloat('00.00', r);//FormatSpeed(r);
        lbBearingAnchor.Caption := FormatCourse(b);
      end;
//    end;
  end;

//  if (focusedTrack <> nil) and (focusedTrack is TT3NonRealVehicle) and FLeftMouseDown then
//  begin
//    if isOnAnchorLine and Assigned(focusedTrack) and
//      (Map1.CurrentTool = mtAnchorTool) then
//    begin
//      r := CalcRange(focusedTrack.getPositionX, focusedTrack.getPositionY, mx,
//        my);
//      b := CalcBearing(focusedTrack.getPositionX, focusedTrack.getPositionY, mx,
//        my);
//      TT3NonRealVehicle(focusedTrack).LineVisual.Range := r;
//      TT3NonRealVehicle(focusedTrack).LineVisual.Bearing := b;

//      lbRangeAnchor.Caption := FormatSpeed(r);
//      lbBearingAnchor.Caption := FormatCourse(b);
//    end;
//  end;

  long := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Long;
  lat := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Lat;

  simMgrClient.Converter.ConvertToScreen(long, lat, sX, sY);

  //kX := x - sX;
  //kY := y - sY;
  pX := CalcMove(mx, long);
  pY := CalcMove(my, lat);

  lbX.Caption := FormatFloat('0.00', Abs(pX));
  lbY.Caption := FormatFloat('0.00', Abs(pY));

  if (pX >= 0) and (pY >=0) then begin
    lbColor.Caption := 'White ';  //kuadran 1
  end;
  if (pX <= 0) and (pY >=0) then begin
    lbColor.Caption := 'Red ';   //kuadran 2
  end;
  if (pX < 0) and (pY < 0) then begin
    lbColor.Caption := 'Green '; //kuadran 3
  end;
  if (pX >= 0) and (pY <= 0) then begin
    lbColor.Caption := 'Blue ';  //kuadran 4
  end;

  if FLeftMouseDown and (Map1.CurrentTool = mtSelectObject) and
     (focusedTrack <> nil) and ((focusedTrack is TPointVehicleMissileRBLW) or
     (focusedTrack is TPointVehicleMissileBOLW)) then
  begin
    if (focusedTrack is TPointVehicleMissileRBLW) and
      TPointVehicleMissileRBLW(focusedTrack).IsEdit and
      Assigned(simMgrClient.ControlledPlatform) then
    begin
      PointRBLW := TPointVehicleMissileRBLW(focusedTrack);

      simMgrClient.MovePlatformLine.X1 := PointRBLW.PointRBLW_X1;
      simMgrClient.MovePlatformLine.Y1 := PointRBLW.PointRBLW_Y1;
      r := CalcRange(PointRBLW.PointRBLW_X1,PointRBLW.PointRBLW_Y1,mx,my);
      b := CalcBearing(PointRBLW.PointRBLW_X1,PointRBLW.PointRBLW_Y1,mx,my);
      simMgrClient.MovePlatformLine.Range := r;
      simMgrClient.MovePlatformLine.Bearing := b;
      simMgrClient.MovePlatformLine.IsOnce := False;
      simMgrClient.MovePlatformLine.Visible := True;

      if (PointRBLW.PointRBLW_X1 <> mx) or (PointRBLW.PointRBLW_Y1 <> my) then
        PointRBLW.IsChange := True;
    end
    else if (focusedTrack is TPointVehicleMissileBOLW) and
      TPointVehicleMissileBOLW(focusedTrack).IsEdit and
      Assigned(simMgrClient.ControlledPlatform) then
    begin
      PointBOLW := TPointVehicleMissileBOLW(focusedTrack);

      simMgrClient.MovePlatformLine.X1 := PointBOLW.PointBOLW_X1;
      simMgrClient.MovePlatformLine.Y1 := PointBOLW.PointBOLW_Y1;
      r := CalcRange(PointBOLW.PointBOLW_X1, PointBOLW.PointBOLW_Y1, mx, my);
      b := CalcBearing(PointBOLW.PointBOLW_Y1, PointBOLW.PointBOLW_Y1, mx, my);
      simMgrClient.MovePlatformLine.Range := r;
      simMgrClient.MovePlatformLine.Bearing := b;
      simMgrClient.MovePlatformLine.IsOnce := False;
      simMgrClient.MovePlatformLine.Visible := True;

      if (PointBOLW.PointBOLW_X1 <> mx) or (PointBOLW.PointBOLW_Y1 <> my) then
        PointBOLW.IsChange := True;
    end;

    FBeginDrag := true;
  end;

  if FLeftMouseDown and (Map1.CurrentTool = mtSelectObject)
    and (simMgrClient.ISInstructor or simMgrClient.ISWasdal) and (focusedTrack <> nil) and TT3Unit
    (focusedTrack).IsRepositioning then
  begin
    //choco : di MouseMove dilarang Reposisi

    if Assigned(focusedTrack) then
    begin
      simMgrClient.MovePlatformLine.X1 := focusedTrack.PosX;
      simMgrClient.MovePlatformLine.Y1 := focusedTrack.PosY;
      r := CalcRange(focusedTrack.PosX,focusedTrack.PosY,mx,my);
      b := CalcBearing(focusedTrack.PosX,focusedTrack.PosY,mx,my);
      simMgrClient.MovePlatformLine.Range := r;
      simMgrClient.MovePlatformLine.Bearing := b;
      simMgrClient.MovePlatformLine.IsOnce := False;
      simMgrClient.MovePlatformLine.Visible := True;
    end;

    FBeginDrag := true;
  end
  else if FLeftMouseDown and (Map1.CurrentTool = mtSelectObject)
    and not (simMgrClient.ISInstructor or simMgrClient.ISWasdal) and (focusedTrack <> nil) and TT3Unit
    (focusedTrack).IsRepositioning then
  begin
     if (focusedTrack is TT3NonRealVehicle) {and (focusedTrack is TT3DetectedTrack)} then
     begin
        TT3NonRealVehicle(focusedTrack).RepositionTo(mx, my);
        FBeginDrag := true;
     end;
  end;

  if FLeftMouseDown and (Map1.CurrentTool = mtSelectObject) then
  begin
    simMgrClient.SimPlotting.ReposProperty(x, y);
  end;

  if FLeftMouseDown and Assigned(infoBalloon) then
  begin
    balloon := TPlatformInfoBalloon(infoBalloon);
    balloon.DragBalloon(X - FLastPos.X, Y - FLastPos.Y);
  end;

  FLastPos.X := X;
  FLastPos.Y := Y;
end;

procedure TfrmTacticalDisplay.MapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, y: Integer);
var
  IsChange : Boolean;
  mx, my, range, bearing, newX, newY: Double;
  sx, sy, ex, ey : Double;
  NRPGroupID : Integer;
  RecSyncRBLW : TrecSinc_RBLW;
  RecSyncBOLW : TrecSinc_BOLW;
  PointRBLW : TPointVehicleMissileRBLW;
  PointBOLW : TPointVehicleMissileBOLW;

  MaxPointIndexOnThisLauncher : Integer;
  WaypointOwner : TT3Vehicle;
  MissOnVehicle : TT3MissilesOnVehicle;

  i : integer;
  pi : TT3PlatformInstance;
  pt : TPoint;

  r: TRect;
  countSelect : Byte;

  recMap: TRec_MapData;
  rec : TRecCmdMultiMode;
  f : Boolean;
  aobj : T3GroupVehicle;
begin
  simMgrClient.Converter.ConvertToMap(x, y, mx, my);

  isOnAnchorLine := false;

  if Assigned(tmMove) then
    tmMove.Enabled := false;

  if FLeftMouseDown then
  begin

    {$REGION ' Multi Mode Section '}
    if isMultiMode then
    begin
      countSelect := 0;
      mptLast.X := x;
      mptLast.Y := y;

      mptCenter.X := Round(mptDown.X + ((mptLast.X - mptDown.X)/2));
      mptCenter.Y := Round(mptDown.Y + ((mptLast.Y - mptDown.Y)/2));

      r.Left    := min(mptDown.X, mptLast.X);
      r.Right   := max(mptDown.X, mptLast.X);
      r.top     := min(mptDown.Y, mptLast.Y);
      r.Bottom  := max(mptDown.Y, mptLast.Y);

      UnSelectAllPlatformTrack;

      {Wasdal UI}
      if simMgrClient.ISWasdal and Assigned(frmGuidance) then
      begin
        frmGuidance.fmPlatformGuidance1.clearPlatformMultiSelectList;

        if focusedTrack is TT3PlatformInstance then begin
          frmGuidance.fmPlatformGuidance1.SetControlledObject(frmTacticalDisplay.focusedTrack);
          frmGuidance.Show;
        end;
      end;

      fmPlatformGuidance1.clearPlatformMultiSelectList;

  //    rec.GroupID := 0;
  //    rec.CubicleGroup := 0;
  //    rec.aAction := C_CLEAR;
  //    simMgrClient.netSend_CmdMultiMode(rec);

      for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do begin
        pi := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;
        simMgrClient.Converter.ConvertToScreen(pi.getPositionX, pi.getPositionY, pt.X, pt.Y);
        if PtInRect(r,pt) then
        begin
          TT3PlatformInstance(pi).Selected := True;

          {Wasdal UI}
          if simMgrClient.ISWasdal and Assigned(frmGuidance) then
            frmGuidance.fmPlatformGuidance1.SetPlatformMultiSelectList(pi);
          fmPlatformGuidance1.SetPlatformMultiSelectList(pi);

          //simMgrClient.netSend_CmdMultiMode(TT3Unit(pi).InstanceIndex, C_ADD, 0, 0);
          if (simMgrClient.ISInstructor) or (simMgrClient.IsWasdal) then
          begin
            if (countSelect <= (Length(rec.PlatformID) - 1)) and (not (pi as TT3Vehicle).IsGrouped) then
            begin
              rec.PlatformID[countSelect] := pi.InstanceIndex;
              countSelect := countSelect + 1;
            end;
          end
          else
          begin
            if (countSelect <= (Length(rec.PlatformID) - 1)) and (not (pi as TT3Vehicle).IsGrouped) and
               (TT3Vehicle(pi).UnitGroup) then
            begin
              rec.PlatformID[countSelect] := pi.InstanceIndex;
              countSelect := countSelect + 1;
            end;
          end;
        end;
      end;

      if countSelect = 0 then
      begin
        for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do begin
          pi := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;
          if pi.Controlled then
           pi.Selected := True;
        end;

        isMultiMode := False;
        Map1.CurrentTool := mtSelectObject;
        btnZoom.Down := False;
        if btnPan.Down then
        begin
          btnPan.Down := False;
          Pan1.Checked := False;
        end;
      end
      else
      begin
        if frmGroupName1.Showing then
          frmGroupName1.Close;

        frmGroupName1.Tag := 0;
        frmGroupName1.Caption := 'Group Name';
        frmGroupName1.Initilaize(nil);
        frmGroupName1.ShowModal;

        if frmGroupName1.btn = mbOK then
        begin
          f := False;

          if (simMgrClient.ISInstructor) or (simMgrClient.IsWasdal) then
          begin
            if simMgrClient.ListPlatformSelect.Count > 0 then
            begin
              for i := 0 to simMgrClient.ListPlatformSelect.Count - 1 do
              begin
                aobj := simMgrClient.ListPlatformSelect.Items[i];

                if (aobj.GroupName = frmGroupName1.GroupName) then
                begin
                  f := True;
                  Break;
                end;
              end;
            end;
          end
          else
          begin
            if simMgrClient.ListPlatformSelect.Count > 0 then
            begin
              for i := 0 to simMgrClient.ListPlatformSelect.Count - 1 do
              begin
                aobj := simMgrClient.ListPlatformSelect.Items[i];

                if (aobj.GroupName = frmGroupName1.GroupName) and
                   (aobj.CubicleGroupID = simMgrClient.FMyCubGroup.FData.Group_Index) then
                begin
                  f := True;
                  Break;
                end;
              end;
            end;
          end;

          if f = False then
          begin
            rec.GroupID := 0;
            StrToChar(frmGroupName1.GroupName, rec.GroupName);
            rec.aAction := Byte(C_ADD);
            rec.CountVehicle := countSelect;
            simMgrClient.netSend_CmdMultiMode(rec);
          end
          else
            MessageDlg('Name Already Exist !', mtInformation, [mbOK], 0);

          btnMultiMode.Down := False;
          isMultiMode := False;
          Map1.CurrentTool := mtSelectObject;
          btnZoom.Down := False;
          if btnPan.Down then
          begin
            btnPan.Down := False;
            Pan1.Checked := False;
          end;

          if Assigned(frmGeneralPfTools) then
          begin
            frmPlatformTools.btnMultiModes.Down := False;
          end;
        end
        else
        begin
          UnSelectAllPlatformTrack;
          btnMultiMode.Down := False;
          isMultiMode := False;
          Map1.CurrentTool := mtSelectObject;
          btnZoom.Down := False;
          if btnPan.Down then
          begin
            btnPan.Down := False;
            Pan1.Checked := False;
          end;

          if Assigned(frmGeneralPfTools) then
          begin
            frmPlatformTools.btnMultiModes.Down := False;
          end;
        end;
      end;

    end;
    {$ENDREGION}

    {$REGION ' Other Section '}
    case Map1.CurrentTool of
      mtSelectObject :
      begin
        if focusedTrack <> nil then
        begin
          if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
          begin
            {$REGION ' Instruktur & Wasdal Section '}
            NRPGroupID := 0;
            if focusedTrack is TT3Unit then
              TT3Unit(focusedTrack).EndReposition;

            if (TT3Unit(focusedTrack).Selected or (focusedTrack is TT3NonRealVehicle)) and FBeginDrag then
            begin
              // send setiap selesai repos
              simMgrClient.netSend_CmdPlatform_Move(TT3Unit(focusedTrack).InstanceIndex, CORD_ID_REPOS, mx, my, NRPGroupID);
              FBeginDrag := false;
            end;

            TT3PlatformInstance(focusedTrack).isSkipDraw := False;
            simMgrClient.MovePlatformLine.Visible := False;
            {$ENDREGION}
          end
          else
          begin
            {$REGION ' Operator Section '}
            NRPGroupID := simMgrClient.FMyCubGroup.FData.Group_Index;
            if focusedTrack is TT3Unit then
              TT3Unit(focusedTrack).EndReposition;

            if (focusedTrack is TT3NonRealVehicle) and (FBeginDrag) then
            begin
             // send setiap selesai repos
              simMgrClient.netSend_CmdPlatform_Move(TT3Unit(focusedTrack).InstanceIndex, CORD_ID_REPOS, mx, my, NRPGroupID);
              FBeginDrag := false;
            end;

            simMgrClient.MovePlatformLine.Visible := False;
            {$ENDREGION}
          end;

          {$REGION ' Missile Section '}
          if (focusedTrack is TPointVehicleMissileRBLW) and
            TPointVehicleMissileRBLW(focusedTrack).IsEdit and
            Assigned(simMgrClient.ControlledPlatform) then
          begin
            PointRBLW := TPointVehicleMissileRBLW(focusedTrack);

            WaypointOwner := TT3Vehicle(simMgrClient.ControlledPlatform);

            // ini klo wasdal gmn??
            MissOnVehicle := TT3MissilesOnVehicle(WaypointOwner.getWeapon(fmWeapon1.edtWeaponName.Text));

            MaxPointIndexOnThisLauncher := fmWeapon1.CheckIDRBLW(PointRBLW.LauncherIndex) - 1;

            if PointRBLW.IndexPoint = MaxPointIndexOnThisLauncher then
            begin
              range := CalcRange(TT3PlatformInstance(MissOnVehicle.TargetObject).PosX,
                                 TT3PlatformInstance(MissOnVehicle.TargetObject).PosY,mx,my);

              bearing := CalcBearing(TT3PlatformInstance(MissOnVehicle.TargetObject).PosX,
                                     TT3PlatformInstance(MissOnVehicle.TargetObject).PosY,mx,my);

              if range < MissOnVehicle.MissileDefinition.FDef.Min_Final_Leg_Length then
              begin
                RangeBearingToCoord(MissOnVehicle.MissileDefinition.FDef.Min_Final_Leg_Length,bearing,newX,newY);
                mx := TT3PlatformInstance(MissOnVehicle.TargetObject).PosX + newX;
                my := TT3PlatformInstance(MissOnVehicle.TargetObject).PosY + newY;
              end;
            end;

            if PointRBLW.IsOriginal then
            begin
              with RecSyncRBLW do
              begin
                cmd := 9;
                PlatformID := simMgrClient.ControlledPlatform.InstanceIndex;
                WeaponIndex := MissOnVehicle.InstanceIndex;
                WeaponName := MissOnVehicle.InstanceName;
                RBLWIndex := PointRBLW.IndexPoint;
                RBLWLauncherIndex := PointRBLW.LauncherIndex;
                RBLW_PointX := PointRBLW.PointRBLW_X1;
                RBLW_POintY := PointRBLW.PointRBLW_Y1;
                Action := waMove;
              end;
              simMgrClient.netSend_CmdSyncRBLW(RecSyncRBLW);
            end;

            with RecSyncRBLW do
            begin
              cmd := 4;
              PlatformID := simMgrClient.ControlledPlatform.InstanceIndex;
              WeaponIndex := MissOnVehicle.InstanceIndex;
              WeaponName := MissOnVehicle.InstanceName;
              RBLWIndex := PointRBLW.IndexPoint;
              RBLWLauncherIndex := PointRBLW.LauncherIndex;
              RBLW_PointX := mx;
              RBLW_POintY := my;
            end;
            simMgrClient.netSend_CmdSyncRBLW(RecSyncRBLW);
          end
          else if (focusedTrack is TPointVehicleMissileBOLW) and
            TPointVehicleMissileBOLW(focusedTrack).IsEdit and
            Assigned(simMgrClient.ControlledPlatform) then
          begin
            PointBOLW := TPointVehicleMissileBOLW(focusedTrack);

            WaypointOwner := TT3Vehicle(simMgrClient.ControlledPlatform);
            MissOnVehicle := TT3MissilesOnVehicle(WaypointOwner.getWeapon(fmWeapon1.edtWeaponName.Text));

            MaxPointIndexOnThisLauncher := fmWeapon1.CheckIDBOLW(PointBOLW.LauncherIndex) - 1;

            if PointBOLW.IndexPoint = MaxPointIndexOnThisLauncher then
            begin
              range := CalcRange(TT3PlatformInstance(MissOnVehicle.TargetObject).PosX,
                                 TT3PlatformInstance(MissOnVehicle.TargetObject).PosY,mx,my);

              bearing := CalcBearing(TT3PlatformInstance(MissOnVehicle.TargetObject).PosX,
                                     TT3PlatformInstance(MissOnVehicle.TargetObject).PosY,mx,my);

              if range < MissOnVehicle.MissileDefinition.FDef.Min_Final_Leg_Length then
              begin
                RangeBearingToCoord(MissOnVehicle.MissileDefinition.FDef.Min_Final_Leg_Length,bearing,newX,newY);
                mx := TT3PlatformInstance(MissOnVehicle.TargetObject).PosX + newX;
                my := TT3PlatformInstance(MissOnVehicle.TargetObject).PosY + newY;
              end;
            end;

            if PointBOLW.IsOriginal then
            begin
              with RecSyncBOLW do
              begin
                cmd := 9;
                PlatformID := simMgrClient.ControlledPlatform.InstanceIndex;
                WeaponIndex := MissOnVehicle.InstanceIndex;
                WeaponName := MissOnVehicle.InstanceName;
                BOLWIndex := PointBOLW.IndexPoint;
                BOLWLauncherIndex := PointBOLW.LauncherIndex;
                BOLW_PointX := PointBOLW.PointBOLW_X1;
                BOLW_PointY := PointBOLW.PointBOLW_Y1;
                Action := waMove;
              end;
              simMgrClient.netSend_CmdSyncBOLW(RecSyncBOLW);
            end;

            with RecSyncBOLW do
            begin
              cmd := 4;
              PlatformID := simMgrClient.ControlledPlatform.InstanceIndex;
              WeaponIndex := MissOnVehicle.InstanceIndex;
              WeaponName := MissOnVehicle.InstanceName;
              BOLWIndex := PointBOLW.IndexPoint;
              BOLWLauncherIndex := PointBOLW.LauncherIndex;
              BOLW_PointX := mx;
              BOLW_PointY := my;
            end;
            simMgrClient.netSend_CmdSyncBOLW(RecSyncBOLW);
          end;

          IsChange := False;

          if focusedTrack is TPointVehicleMissileRBLW then
          begin
            //IsEdit := TPointVehicleMissileRBLW(focusedTrack).IsEdit;
            IsChange := TPointVehicleMissileRBLW(focusedTrack).IsChange;
          end
          else if focusedTrack is TPointVehicleMissileBOLW then
          begin
            //IsEdit := TPointVehicleMissileBOLW(focusedTrack).IsEdit;
            IsChange := TPointVehicleMissileBOLW(focusedTrack).IsChange;
          end;

          if (focusedTrack is TPointVehicleMissileRBLW) or (focusedTrack is TPointVehicleMissileBOLW) then
          begin
            {if IsEdit then
            begin
              fmWeapon1.btnSurfaceToSurfaceMissileWaypointsEdit.Enabled   := False;
              fmWeapon1.btnSurfaceToSurfaceMissileWaypointsAdd.Enabled    := True;
              fmWeapon1.btnSurfaceToSurfaceMissileWaypointsDelete.Enabled := True;
            end
            else
            begin
              fmWeapon1.btnSurfaceToSurfaceMissileWaypointsEdit.Enabled   := True;
              fmWeapon1.btnSurfaceToSurfaceMissileWaypointsAdd.Enabled    := False;
              fmWeapon1.btnSurfaceToSurfaceMissileWaypointsDelete.Enabled := False;
            end;}

            if IsChange then
            begin
              fmWeapon1.btnSurfaceToSurfaceMissileWaypointsApply.Enabled := True;
              fmWeapon1.btnSurfaceToSurfaceMissileWaypointsCancel.Enabled := True;
            end
            else
            begin
              fmWeapon1.btnSurfaceToSurfaceMissileWaypointsApply.Enabled := False;
              fmWeapon1.btnSurfaceToSurfaceMissileWaypointsCancel.Enabled := False;
            end;
          end;
          {$ENDREGION}

        end;

        {$REGION ' Plotting Section '}
        frmStrategiEditor.Repost;
        simMgrClient.SimPlotting.RefreshPlot;
        {$ENDREGION}

      end;
      mtRuler :
      begin
        {$REGION ' Ruler Section '}
        if (frmRuler.IsSelected) then
        begin
          if Assigned(tmMove) then
            tmMove.Enabled := True;
        end;
        {$ENDREGION}
      end;
      mtEditOverlayStatic :
      begin
        {$REGION ' Edit Overlay Static Section '}
        if fmOverlayEditor.isMoveOverlay then
        begin
          simMgrClient.Converter.ConvertToMap(startMoveX, startMoveY, sx, sy);
          simMgrClient.Converter.ConvertToMap(x, y, ex, ey);

          fmOverlayEditor.ReposOverlayStatic(sx, sy, ex, ey);
        end
        else
          Exit;
        {$ENDREGION}
      end;
      mtEditOverlayDynamic :
      begin
        {$REGION ' Edit Overlay Dynamic Section '}
        if fmOverlayEditor.isMoveOverlay then
        begin
          simMgrClient.SimOverlayTemplate.reposOverlayDynamic(startMoveX, startMoveY, x, y);

          fmOverlayEditor.lblShape.Caption := '---';
          fmOverlayEditor.grpNoneD.BringToFront;
          fmOverlayEditor.grpNone.BringToFront;

          fmOverlayEditor.cbbDashesPen.Enabled := True;
          fmOverlayEditor.cbbWeightPen.Enabled := True;

          fmOverlayEditor.btnObjectDelete.Enabled := False;
          fmOverlayEditor.btnObjectApply.Enabled := False;
        end;
        {$ENDREGION}
      end;

    end;
    {$ENDREGION}
  end;

  FLeftMouseDown := false;
end;

procedure TfrmTacticalDisplay.setMainMenuItem(obj: TSimObject);
begin
  // set properti mainMenuItem
  if obj = nil then exit;

  {unchecked all mainMenu items}
  A1.Checked := false;
  Surface1.Checked := false;
  Subsurface1.Checked := false;
  Land1.Checked := false;
  General1.Checked := false;

  Pending1.Checked := false;
  Unknown1.Checked := false;
  AssumedFriend1.Checked := false;
  Friend1.Checked := false;
  Neutral1.Checked := false;
  Suspect1.Checked := false;
  Hostile1.Checked := false;

  AircraftCarrierCVCVN1.Checked := false;
  AmphibiousWarfare1.Checked := false;
  Auxiliary1.Checked := false;
  Chaff1.Checked := false;
  CruiserGuidedMissileCGCGN1.Checked := false;
  Destroyer1.Checked := false;
  DestroyerGuidedMissileDOG1.Checked := false;
  FrigateFF1.Checked := false;
  FrigateGuidedMissileFFG1.Checked := false;
  InfraredDecoy1.Checked := false;
  JammerDecoy1.Checked := false;
  Merchant1.Checked := false;
  MainWarfare1.Checked := false;
  PatrolCraftPTPTG1.Checked := false;
  UtilityVessel1.Checked := false;
  Other1.Checked := false;
  {end unchecked mainMenu items}

  //checked target menu
  if obj is TT3PlatformInstance then
  begin
    case TT3PlatformInstance(obj).PlatformDomain of
      vhdAir:
        A1.Checked := true;
      vhdSurface:
        Surface1.Checked := true;
      vhdSubsurface:
        Subsurface1.Checked := true;
      vhdLand:
        Land1.Checked := true;
      vhdGeneral:
        General1.Checked := true;
    end;

    case TT3Vehicle(obj).PlatformType of
      vhtAirCarrier:
        AircraftCarrierCVCVN1.Checked := true;
      vhtAmphibious:
        AmphibiousWarfare1.Checked := true;
      vhtAuxiliary:
        Auxiliary1.Checked := true;
      // vhtchaff
      vhtCruiseGuided:
        CruiserGuidedMissileCGCGN1.Checked := true;
      vhtDestroyer:
        Destroyer1.Checked := true;
      vhtDestroGuided:
        DestroyerGuidedMissileDOG1.Checked := true;
      vhtFrigate:
        FrigateFF1.Checked := true;
      vhtFrigatGuided:
        FrigateGuidedMissileFFG1.Checked := true;
      // vhtInfraredDecoy
      // vhtJammerDecoy
      vhtMerchant:
        Merchant1.Checked := true;
      // vhtMainWarefare
      vhtPatrolCraft:
        PatrolCraftPTPTG1.Checked := true;
      vhtUtilityVess:
        UtilityVessel1.Checked := true;
      vhtOther:
        Other1.Checked := true;
    else
      Other1.Checked := true;
    end;

    case TT3Vehicle(obj).TrackIdent of
      piPending:
        Pending1.Checked := true;
      piUnknown:
        Unknown1.Checked := true;
      piAssumedFriend:
        AssumedFriend1.Checked := true;
      piFriend:
        Friend1.Checked := true;
      piNeutral:
        Neutral1.Checked := true;
      piSuspect:
        Suspect1.Checked := true;
      piHostile:
        Hostile1.Checked := true;
    end;
  end
  else if obj is TT3DetectedTrack then
  begin
    case TT3DetectedTrack(obj).TrackDomain of
      vhdAir:
        A1.Checked := true;
      vhdSurface:
        Surface1.Checked := true;
      vhdSubsurface:
        Subsurface1.Checked := true;
      vhdLand:
        Land1.Checked := true;
      vhdGeneral:
        General1.Checked := true;
    end;

    case TT3DetectedTrack(obj).TrackType of
      vhtAirCarrier:
        AircraftCarrierCVCVN1.Checked := true;
      vhtAmphibious:
        AmphibiousWarfare1.Checked := true;
      vhtAuxiliary:
        Auxiliary1.Checked := true;
      // vhtchaff
      vhtCruiseGuided:
        CruiserGuidedMissileCGCGN1.Checked := true;
      vhtDestroyer:
        Destroyer1.Checked := true;
      vhtDestroGuided:
        DestroyerGuidedMissileDOG1.Checked := true;
      vhtFrigate:
        FrigateFF1.Checked := true;
      vhtFrigatGuided:
        FrigateGuidedMissileFFG1.Checked := true;
      // vhtInfraredDecoy
      // vhtJammerDecoy
      vhtMerchant:
        Merchant1.Checked := true;
      // vhtMainWarefare
      vhtPatrolCraft:
        PatrolCraftPTPTG1.Checked := true;
      vhtUtilityVess:
        UtilityVessel1.Checked := true;
      vhtOther:
        Other1.Checked := true;
    else
      Other1.Checked := true;
    end;

    case TT3DetectedTrack(obj).TrackIdent of
      piPending:
        Pending1.Checked := true;
      piUnknown:
        Unknown1.Checked := true;
      piAssumedFriend:
        AssumedFriend1.Checked := true;
      piFriend:
        Friend1.Checked := true;
      piNeutral:
        Neutral1.Checked := true;
      piSuspect:
        Suspect1.Checked := true;
      piHostile:
        Hostile1.Checked := true;
    end;
  end
  else if obj is TT3ESMTrack then
  begin
    case TT3ESMTrack(obj).TrackDomain of
      vhdAir:
        A1.Checked := true;
      vhdSurface:
        Surface1.Checked := true;
      vhdSubsurface:
        Subsurface1.Checked := true;
      vhdLand:
        Land1.Checked := true;
      vhdGeneral:
        General1.Checked := true;
    end;

    Other1.Checked := true;

    case TT3ESMTrack(obj).TrackIdent of
      piPending:
        Pending1.Checked := true;
      piUnknown:
        Unknown1.Checked := true;
      piAssumedFriend:
        AssumedFriend1.Checked := true;
      piFriend:
        Friend1.Checked := true;
      piNeutral:
        Neutral1.Checked := true;
      piSuspect:
        Suspect1.Checked := true;
      piHostile:
        Hostile1.Checked := true;
    end;
  end;
end;

procedure TfrmTacticalDisplay.setShowMainMenuItem(obj: TSimObject);
begin
  // show main menu item or not
  if obj = nil then exit;

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    if obj is TT3NonRealVehicle then begin
      Characteristics1.Enabled := true;
      Domain1.Enabled := true;
      PlatformType1.Enabled := true;

      Number1.Enabled := true;
    end else
    begin
      Characteristics1.Enabled := false;
      Domain1.Enabled := false;
      PlatformType1.Enabled := false;

      Number1.Enabled := false;
    end;

    MErge1.Enabled := false;
    Split1.Enabled := false;
    Remove2.Enabled:= True;
  end
  else
  begin
    if obj is TT3PlatformInstance then
    begin
      if obj is TT3NonRealVehicle then begin
        Characteristics1.Enabled := true;
        Domain1.Enabled := true;
        PlatformType1.Enabled := true;

        Number1.Enabled := true;
        Remove2.Enabled:= True;
      end
      else begin
        Characteristics1.Enabled := false;
        Domain1.Enabled := false;
        PlatformType1.Enabled := false;

        Number1.Enabled := false;
        Remove2.Enabled:= false;
      end;

      MErge1.Enabled := false;
      Split1.Enabled := false;
    end
    else if obj is TT3DetectedTrack then
    begin
      Characteristics1.Enabled := true;
      Domain1.Enabled := false;
      PlatformType1.Enabled := false;

      Number1.Enabled := true;
      Remove2.Enabled:= false;

      if TT3DetectedTrack(obj).MergedESM = nil then
      begin
        MErge1.Enabled := true;
        Split1.Enabled := false;
      end
      else
      begin
        MErge1.Enabled := false;
        Split1.Enabled := true;
      end;
    end
    else if obj is TT3ESMTrack then
    begin
      Characteristics1.Enabled := true;
      Domain1.Enabled := true;
      PlatformType1.Enabled := false;
      Remove2.Enabled:= false;

      Number1.Enabled := true;
      MErge1.Enabled  := true;
      Split1.Enabled  := false;
    end
    else
    begin
      Characteristics1.Enabled := false;
      Domain1.Enabled := false;
      PlatformType1.Enabled := false;
      Remove2.Enabled:= false;

      Number1.Enabled := false;
      MErge1.Enabled  := false;
      Split1.Enabled  := false;
    end;
  end;
end;

procedure TfrmTacticalDisplay.setPopUpPropItem(obj: TSimObject);
begin
  // set properti menuItem
  if obj = nil then
    exit;

  { unchecked all menu items }
  mniAir4.Checked := false;
  mniSurface4.Checked := false;
  mniSubsurface4.Checked := false;
  mniLand4.Checked := false;
  mniGeneral4.Checked := false;

  mniPending1.Checked := false;
  mniUnknowns1.Checked := false;
  mniAssumedFriend1.Checked := false;
  mniFriend1.Checked := false;
  mniNeutral1.Checked := false;
  mniSuspect1.Checked := false;
  mniHostile1.Checked := false;

  mniAircraftCarrier1.Checked := false;
  mniAmphibius1.Checked := false;
  mniAuxiliary1.Checked := false;
  mniChaff1.Checked := false;
  mniCruiserGuidedMissileCGCGN1.Checked := false;
  mniDestroyer1.Checked := false;
  mniDestroyerGuidedMissle1.Checked := false;
  mniFrigateFF1.Checked := false;
  mniFrigateGuidedMissleFFG1.Checked := false;
  mniInfra1.Checked := false;
  mniJammerDecoy1.Checked := false;
  mniMerchant1.Checked := false;
  mniMainwarfare1.Checked := false;
  mniPatrolCraftPTPTG1.Checked := false;
  mniUtilityVessel1.Checked := false;
  mniOther1.Checked := false;
  { end unchecked all }

  if obj is TT3PlatformInstance then
  begin
    case TT3PlatformInstance(obj).PlatformDomain of
      vhdAir:
        mniAir4.Checked := true;
      vhdSurface:
        mniSurface4.Checked := true;
      vhdSubsurface:
        mniSubsurface4.Checked := true;
      vhdLand:
        mniLand4.Checked := true;
      vhdGeneral:
        mniGeneral4.Checked := true;
    end;

    case TT3Vehicle(obj).PlatformType of
      vhtAirCarrier:
        mniAircraftCarrier1.Checked := true;
      vhtAmphibious:
        mniAmphibius1.Checked := true;
      vhtAuxiliary:
        mniAuxiliary1.Checked := true;
      // vhtchaff
      vhtCruiseGuided:
        mniCruiserGuidedMissileCGCGN1.Checked := true;
      vhtDestroyer:
        mniDestroyer1.Checked := true;
      vhtDestroGuided:
        mniDestroyerGuidedMissle1.Checked := true;
      vhtFrigate:
        mniFrigateFF1.Checked := true;
      vhtFrigatGuided:
        mniFrigateGuidedMissleFFG1.Checked := true;
      // vhtInfraredDecoy
      // vhtJammerDecoy
      vhtMerchant:
        mniMerchant1.Checked := true;
      // vhtMainWarefare
      vhtPatrolCraft:
        mniPatrolCraftPTPTG1.Checked := true;
      vhtUtilityVess:
        mniUtilityVessel1.Checked := true;
      vhtOther:
        mniOther1.Checked := true;
    else
      mniOther1.Checked := true;
    end;

    case TT3Vehicle(obj).TrackIdent of
      piPending:
        mniPending1.Checked := true;
      piUnknown:
        mniUnknowns1.Checked := true;
      piAssumedFriend:
        mniAssumedFriend1.Checked := true;
      piFriend:
        mniFriend1.Checked := true;
      piNeutral:
        mniNeutral1.Checked := true;
      piSuspect:
        mniSuspect1.Checked := true;
      piHostile:
        mniHostile1.Checked := true;
    end;
  end
  else if obj is TT3DetectedTrack then
  begin
    case TT3DetectedTrack(obj).TrackDomain of
      vhdAir:
        mniAir4.Checked := true;
      vhdSurface:
        mniSurface4.Checked := true;
      vhdSubsurface:
        mniSubsurface4.Checked := true;
      vhdLand:
        mniLand4.Checked := true;
      vhdGeneral:
        mniGeneral4.Checked := true;
    end;

    case TT3DetectedTrack(obj).TrackType of
      vhtAirCarrier:
        mniAircraftCarrier1.Checked := true;
      vhtAmphibious:
        mniAmphibius1.Checked := true;
      vhtAuxiliary:
        mniAuxiliary1.Checked := true;
      // vhtchaff
      vhtCruiseGuided:
        mniCruiserGuidedMissileCGCGN1.Checked := true;
      vhtDestroyer:
        mniDestroyer1.Checked := true;
      vhtDestroGuided:
        mniDestroyerGuidedMissle1.Checked := true;
      vhtFrigate:
        mniFrigateFF1.Checked := true;
      vhtFrigatGuided:
        mniFrigateGuidedMissleFFG1.Checked := true;
      // vhtInfraredDecoy
      // vhtJammerDecoy
      vhtMerchant:
        mniMerchant1.Checked := true;
      // vhtMainWarefare
      vhtPatrolCraft:
        mniPatrolCraftPTPTG1.Checked := true;
      vhtUtilityVess:
        mniUtilityVessel1.Checked := true;
      vhtOther:
        mniOther1.Checked := true;
    else
      mniOther1.Checked := true;
    end;

    case TT3DetectedTrack(obj).TrackIdent of
      piPending:
        mniPending1.Checked := true;
      piUnknown:
        mniUnknowns1.Checked := true;
      piAssumedFriend:
        mniAssumedFriend1.Checked := true;
      piFriend:
        mniFriend1.Checked := true;
      piNeutral:
        mniNeutral1.Checked := true;
      piSuspect:
        mniSuspect1.Checked := true;
      piHostile:
        mniHostile1.Checked := true;
    end;
  end
  else if obj is TT3ESMTrack then
  begin
    case TT3ESMTrack(obj).TrackDomain of
      vhdAir:
        mniAir4.Checked := true;
      vhdSurface:
        mniSurface4.Checked := true;
      vhdSubsurface:
        mniSubsurface4.Checked := true;
      vhdLand:
        mniLand4.Checked := true;
      vhdGeneral:
        mniGeneral4.Checked := true;
    end;

    mniOther1.Checked := true;

    case TT3ESMTrack(obj).TrackIdent of
      piPending:
        mniPending1.Checked := true;
      piUnknown:
        mniUnknowns1.Checked := true;
      piAssumedFriend:
        mniAssumedFriend1.Checked := true;
      piFriend:
        mniFriend1.Checked := true;
      piNeutral:
        mniNeutral1.Checked := true;
      piSuspect:
        mniSuspect1.Checked := true;
      piHostile:
        mniHostile1.Checked := true;
    end;
  end;
end;

procedure TfrmTacticalDisplay.MapToolUsed(ASender: TObject; ToolNum: Smallint;
  X1, Y1, X2, Y2, Distance: double; Shift, Ctrl: WordBool;
  var EnableDefault: WordBool);
begin
  { if toolNum = miZoomInTool then begin
    z :=  FixMapZoom(VSimMap.FMap.Zoom);
    cbSetScale.Text       := FloatToStr(z);
    lblRangeScale.Caption := cbSetScale.Text;
    end;
  }
end;

procedure TfrmTacticalDisplay.OnCollision(Track, CollisionTrack: string);
begin
//  ShowMessage('Track : ' + Track + 'Collision with : ' + CollisionTrack);
end;

//procedure TfrmTacticalDisplay.OnGameCentre1Click(Sender: TObject);
//var
//  long, lat: double;
//begin
//
//  OnHookedTrack2.Checked := False;
////  OnGameCentre1.Checked := True;    //tidak perlu di centang
////  Pan1.Checked := False;
//
//  if Sender is TMenuItem then
//  begin
//    if btnCentreOnGameCentre.Down then
//      btnCentreOnGameCentre.Down := False
//    else
//    begin
////      ToolBtnCentreOnGameCentre.Down := True;     //tidak perlu tertekan
//      if btnCentreOnHook.Down then
//        FHookOnPlatform := not FHookOnPlatform;
//      btnCentreOnHook.Down := False;
////      ToolBtnPan.Down := False;
//      StatusBar1.Panels[0].Text := TMenuItem(Sender).Hint;
//    end;
//  end;
//  long := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Long;
//  lat := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Lat;
//  VSimMap.SetMapCenter(long, lat);
//end;

procedure TfrmTacticalDisplay.OnHookedTrack2Click(Sender: TObject);
begin
  OnGameCentre1.Checked := False;
  Pan1.Checked := False;
  FHookOnPlatform := not FHookOnPlatform;
  if Sender is TMenuItem then
  begin
    if btnCentreOnHook.Down then
    begin
      btnCentreOnHook.Down := False;
      OnHookedTrack2.Checked := False;
    end
    else
    begin
      btnCentreOnHook.Down := True;
      btnCentreOnGameCentre.Down := False;
//      btnPan.Down := False;
      StatusBar1.Panels[0].Text := TMenuItem(Sender).Hint;
      OnHookedTrack2.Checked := True;
//      if Assigned(focusedTrack) and (focusedTrack is TT3Unit) then
//      begin
//        VSimMap.SetMapCenter(TT3Unit(focusedTrack).getPositionX,
//          TT3Unit(focusedTrack).getPositionY);
//        FLastMapCenterY := TT3Unit(focusedTrack).getPositionY;
//        FLastMapCenterX := TT3Unit(focusedTrack).getPositionX;
//      end;
      if FHookOnPlatform then
      begin
        try
          simMgrClient.MyCenterHookedPlatfom := focusedTrack;

          VSimMap.SetMapCenter(simMgrClient.MyCenterHookedPlatfom.getPositionX,
                simMgrClient.MyCenterHookedPlatfom.getPositionY);
          FLastMapCenterY := simMgrClient.MyCenterHookedPlatfom.getPositionY;
          FLastMapCenterX := simMgrClient.MyCenterHookedPlatfom.getPositionX;
          OnHookedTrack2.Checked := True;
          Pan1.Checked := False;
          btnPan.Down := False;
          Map1.CurrentTool := mtSelectObject;
        except
          focusedTrack := nil;
          simMgrClient.MyCenterHookedPlatfom := nil;
        end;
      end
    end;
  end;

end;

procedure TfrmTacticalDisplay.OnRadarBtnClick(Sender: TObject);
begin
  fmSensor1.sbSearchRadarClick(Sender);
end;

procedure TfrmTacticalDisplay.OnSonarBtnClick(Sender: TObject);
begin
  fmSensor1.sbSonarClick(Sender);
end;

procedure TfrmTacticalDisplay.OnSoonobuoyBtnClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmSensor1.btnSonobuoyControlDeployClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.OnUpdateStateServer(msg: string);
begin
  StatusBar1.Panels[12].Text := msg;
end;

procedure TfrmTacticalDisplay.OnVisualShowClick(Sender: TObject);
begin
  fmSensor1.sbVisualSensorClick(Sender);
end;

procedure TfrmTacticalDisplay.Opotions1Click(Sender: TObject);
begin
  if focusedTrack <> nil then
  begin
    Map1.CurrentTool := mtAnchorTool;
    fSettingCoordinate.Show;
  end;

  if Map1.CurrentTool = mtAnchorTool then
    Map1.CurrentTool := mtSelectObject;
end;

procedure TfrmTacticalDisplay.Origin1Click(Sender: TObject);
begin
  // LaunchNRPSpecialPlatform(vhdGeneral, pctTacticalGridorigin);
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciTacticalGridorigin, piPending);
end;

//function TfrmTacticalDisplay.OutsideRegion(x, y: double): Boolean;
//var
//  Rect: TRect;
//  pt: TPoint;
//  cx, cy: Integer;
//begin
//  simMgrClient.Converter.ConvertToScreen(x, y, pt.x, pt.y);

//  cx := Map1.width div 2;
//  cy := Map1.height div 2;

//  Rect.left := cx - 30;
//  Rect.top := cy - 30;
//  Rect.Right := cx + 30;
//  Rect.Bottom := cy + 30;

//  result := not PtInRect(Rect, pt);
//end;

//procedure TfrmTacticalDisplay.Overlays1Click(Sender: TObject);
//begin
//    fmOverlayEditor.Show;
//end;

procedure TfrmTacticalDisplay.PlatformView1Click(Sender: TObject);
begin
//  simMgrClient.PlatformViewMode := not simMgrClient.PlatformViewMode;
//  PlatformView1.Checked := simMgrClient.PlatformViewMode;
end;
procedure TfrmTacticalDisplay.pnlMenubarClick(Sender: TObject);
begin
  FIsShowed := True;
end;

procedure TfrmTacticalDisplay.pnlMenubarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel3.Show;
end;

procedure TfrmTacticalDisplay.pnlStatusRedClick(Sender: TObject);
var
  CmdStatus : TStatus;
begin
  if statusR_List.Count > 0 then
  begin
    CmdStatus := TStatus(statusR_List.Items[statusR_List.Count-1]);
    if LowerCase(CmdStatus.state) = 'receive message' then
    begin
      frmToteDisplay.gbMessageHandlingSystem.BringToFront;
      frmToteDisplay.pnlTabReceived.Color := RGB(44, 127, 161);
      frmToteDisplay.pnlContentReceived.BringToFront;
      frmToteDisplay.pnlTabReceived.Tag := 1;
      frmToteDisplay.pnlTabDraft.Tag := 0;
      frmToteDisplay.pnlTabDraft.Color := RGB(29, 81, 103);
      frmToteDisplay.pnlTabSent.Tag := 0;
      frmToteDisplay.pnlTabSent.Color := RGB(29, 81, 103);

//      frmToteDisplay.pcReceived.ActivePageIndex := 0;
    end;

    statusR_List.Delete(statusR_List.Count-1);
    updateStatus;
  end;
end;

procedure TfrmTacticalDisplay.pnlStatusYellowClick(Sender: TObject);
begin
  if statusY_List.Count > 0 then
  begin
    statusY_List.Delete(statusY_List.Count-1);
    updateStatus_Yellow;
  end;
end;



procedure TfrmTacticalDisplay.Previous1Click(Sender: TObject);
var
  index: Integer;
  aObject: TSimObject;
begin
  if cbAssumeControl.Items.Count <= 0 then
    exit;

  index := cbAssumeControl.ItemIndex;
  if index = 0 then
    index := cbAssumeControl.Items.Count - 1
  else
    index := index - 1;

  cbAssumeControl.ItemIndex := index;
  aObject := cbAssumeControl.Items.Objects[index] as TSimObject;

  if aObject <> nil then
  begin
    if aObject is TT3Unit then
      TT3Unit(aObject).Selected := true
    else if aObject is TT3DetectedTrack then
      TT3DetectedTrack(aObject).Selected := true;

    Map1.Repaint;
  end;
end;

procedure TfrmTacticalDisplay.ransfer1Click(Sender: TObject);
var
  aObject : TSimObject;
  pi        : TT3PlatformInstance;
begin
  if not Assigned(focusedTrack) then
    Exit;

  if not Assigned(fTransferSonobuoy) then
    fTransferSonobuoy := TfTransferSonobuoy.Create(self);

  aObject := focusedTrack;
  pi := simMgrClient.FindT3PlatformByID(TT3Sonobuoy(TT3PlatformInstance(aObject)).ParentIndex);

  if (Assigned(pi)) and (aObject is TT3PlatformInstance) then
  begin
    fTransferSonobuoy.lbTransferTrack.Caption    := TT3PlatformInstance(aObject).Track_ID;
    fTransferSonobuoy.lbParentCurrent.Caption    := pi.InstanceName;
    fTransferSonobuoy.lbIdTransfer.Caption       := IntToStr(TT3PlatformInstance(aObject).InstanceIndex);
  end

  else if aObject is TT3DetectedTrack then
  begin
    fTransferSonobuoy.lbTransferTrack.Caption := IntToStr(TT3DetectedTrack(aObject).TrackNumber);
  end;

  fTransferSonobuoy.Show;
end;

procedure TfrmTacticalDisplay.SaveAsOverlaytoDatabase1Click(Sender: TObject);
begin
  frmSaveAsOverlay.stateSave := 0;
  frmSaveAsOverlay.Show;
end;

procedure TfrmTacticalDisplay.SaveAsOverlaytoScenario1Click(Sender: TObject);
begin
  frmSaveAsOverlay.stateSave := 1;
  frmSaveAsOverlay.Show;
end;

procedure TfrmTacticalDisplay.SaveAsToDatabase1Click(Sender: TObject);
begin
  if simMgrClient.ISInstructor then
  begin
    fmSaveAsPlot.pnlScenario.Visible := false;
    fmSaveAsPlot.FSaveToDatabase := True;
    fmSaveAsPlot.lvSaveAsPlot.Height := 300;
    fmSaveAsPlot.Show;
  end
  else
    ShowMessage('You don''t have permission to save this plotting');
end;

procedure TfrmTacticalDisplay.SaveAsToScenario1Click(Sender: TObject);
begin
  if simMgrClient.ISInstructor then
  begin
    fmSaveAsPlot.pnlScenario.Visible := True;
    fmSaveAsPlot.FSaveToDatabase := False;
    fmSaveAsPlot.lvSaveAsPlot.Height := 150;
    fmSaveAsPlot.Show;
  end
  else
    ShowMessage('You don''t have permission to save this plotting');
end;

procedure TfrmTacticalDisplay.Select1Click(Sender: TObject);
begin
  Map1.CurrentTool := mtSelectObject;
end;

procedure TfrmTacticalDisplay.SetControlledFormMode(aReadOnly: boolean);
begin
  if aReadOnly then begin
    fmOwnShip1.ReadOnlyMode;
    fmPlatformGuidance1.ReadOnlyMode;
    fmSensor1.ReadOnlyMode;
    fmWeapon1.ReadOnlyMode;
    fmFireControl1.ReadOnlyMode;
    fmCounterMeasure1.ReadOnlyMode;
    fmEMCON1.ReadOnlyMode;
//    fmLogisticCalculation1.ReadOnlyMode;

    { wasdal UI }
    if simMgrClient.ISWasdal then
    begin
      if Assigned(frmPlatformInfo) then
        frmPlatformInfo.fmOwnShip1.ReadOnlyMode;

      if Assigned(frmGuidance) then
        frmGuidance.fmPlatformGuidance1.ReadOnlyMode;

      if Assigned(frmSensor) then
        frmSensor.fmSensor1.ReadOnlyMode;

      if Assigned(frmWeapon) then
        frmWeapon.fmWeapon1.ReadOnlyMode;

      if Assigned(frmFCR) then
        frmFCR.fmFireControl1.ReadOnlyMode;

      if Assigned(frmCM) then
        frmCM.fmCounterMeasure1.ReadOnlyMode;

      if Assigned(frmEMCON)  then
        frmEMCON.fmEMCON1.ReadOnlyMode;

      if Assigned(frmLogistic)  then
        frmLogistic.fmLogisticCalculation1.ReadOnlyMode;

    end;
  end else begin
    fmOwnShip1.UnReadOnlyMode;
    fmPlatformGuidance1.UnReadOnlyMode;
    fmSensor1.UnReadOnlyMode;
    fmWeapon1.UnReadOnlyMode;
    fmFireControl1.UnReadOnlyMode;
    fmCounterMeasure1.UnReadOnlyMode;
    fmEMCON1.UnReadOnlyMode;
//    fmLogisticCalculation1.UnReadOnlyMode;

    { wasdal UI }
    if simMgrClient.ISWasdal then
    begin
      if Assigned(frmPlatformInfo) then
        frmPlatformInfo.fmOwnShip1.UnReadOnlyMode;

      if Assigned(frmGuidance) then
        frmGuidance.fmPlatformGuidance1.UnReadOnlyMode;

      if Assigned(frmSensor) then
        frmSensor.fmSensor1.UnReadOnlyMode;

      if Assigned(frmWeapon) then
        frmWeapon.fmWeapon1.UnReadOnlyMode;

      if Assigned(frmFCR) then
        frmFCR.fmFireControl1.UnReadOnlyMode;

      if Assigned(frmCM) then
        frmCM.fmCounterMeasure1.UnReadOnlyMode;

      if Assigned(frmEMCON)  then
        frmEMCON.fmEMCON1.UnReadOnlyMode;

      if Assigned(frmLogistic)  then
        frmLogistic.fmLogisticCalculation1.UnReadOnlyMode;

    end;
  end;
end;

procedure TfrmTacticalDisplay.SetControlledPlatform(pit: TT3PlatformInstance);
begin
  if Assigned(simMgrClient.ControlledPlatform) then
  begin
    if simMgrClient.ControlledPlatform <> pit then
    begin
      if Assigned(simMgrClient.ControlledPlatform) then
        if simMgrClient.ControlledPlatform.Controlled then
          simMgrClient.ControlledPlatform.Controlled := False;

      FHookOnPlatform := False;
      btnCentreOnHook.Down := FHookOnPlatform;
    end;
  end;

  if Assigned(focusedTrack) then
  begin
    if focusedTrack is TT3PlatformInstance then
      TT3PlatformInstance(focusedTrack).Selected := false
    else if focusedTrack is TT3DetectedTrack then
      TT3DetectedTrack(focusedTrack).Selected := false
  end;

  if Assigned(pit) then     //mk
  begin
    simMgrClient.ControlledPlatform := pit;
    focusedTrack := pit;

    TT3Unit(focusedTrack).Selected := true;

    fmOwnShip1.SetControlledObject(pit);
    fmPlatformGuidance1.SetControlledObject(pit);
    fmSensor1.SetControlledObject(pit);
    fmWeapon1.SetControlledObject(pit);
    fmFireControl1.SetControlledObject(pit);
    fmCounterMeasure1.SetControlledObject(pit);
    fmEMCON1.SetControlledObject(pit);
//    fmLogisticCalculation1.SetControlledObject(pit);

    {Wasdal UI}
    if simMgrClient.ISWasdal then
    begin
      if Assigned(frmPlatformInfo) then
        frmPlatformInfo.fmOwnShip1.SetControlledObject(pit);
      if Assigned(frmGuidance) then
      begin
        frmGuidance.fmPlatformGuidance1.SetControlledObject(pit);
        frmGuidance.SetControlledObject(pit);
      end;

      if Assigned(frmSensor) then
      begin
        frmSensor.fmSensor1.SetControlledObject(pit);
        frmSensor.SetControlledObject(pit);
      end;

      if Assigned(frmWeapon) then
      begin
        frmWeapon.fmWeapon1.SetControlledObject(pit);
        frmWeapon.SetControlledObject(pit);
      end;

      if Assigned(frmFCR) then
      begin
        frmFCR.fmFireControl1.SetControlledObject(pit);
        frmFCR.SetControlledObject(pit);
      end;

      if Assigned(frmCM) then
      begin
        frmCM.fmCounterMeasure1.SetControlledObject(pit);
        frmCM.SetControlledObject(pit);
      end;

      if Assigned(frmLogistic)  then
        frmLogistic.fmLogisticCalculation1.SetControlledObject(pit);

      if Assigned(frmEMCON)  then
      begin
        frmEMCON.fmEMCON1.SetControlledObject(pit);
        frmEMCON.SetControlledObject(pit);
      end;

      if assigned(frmPlatformTools) then
        if pit is TT3Vehicle then
          frmPlatformTools.btnTrackHistory.Down := TT3Vehicle(focusedTrack).ShowTrails;

      if Assigned(frmGeneralPfTools) then
      begin
        if pit is TT3Vehicle then
          frmGeneralPfTools.ShowVehicleToolButton := True
        else
          frmGeneralPfTools.ShowVehicleToolButton := False
      end;

    end;
  end;


  Caption := 'Tactical Display - ' + simMgrClient.Scenario.ScenarioName +
    ' - ' + pit.InstanceName + ' on ' + simMgrClient.CubicleName + ' - ' +
    simMgrClient.ConsoleName + ' V ' + simMgrClient.Version;
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

procedure TfrmTacticalDisplay.SetRoleClient(rc: Integer);
begin
  case rc of
    crpInstruktur:
      begin
        if simMgrClient.ISWasdal then
        begin
          SetupWasdalUI;
        end
        else
        begin
          if vMapSetting.FormPlotter then
          begin
            SetupPlotterUI;
          end
          else if vMapSetting.FormViewer then
          begin
            BorderStyle := bsNone;
            pnlTop.Hide;
            pnlLeft.Hide;

            File1.Visible := False;
            Game1.Visible := False;
            View1.Visible := False;
            Map.Visible := False;
            Hook1.Visible := False;
            Tools1.Visible := False;
            Track1.Visible := False;
            Help1.Visible := False;
          end
          else
          begin
            {Button tidak kepake}
            btnInfoTool.Hide;
            btnSelectPlatform.Hide;
            btnToolBtnSlide.Hide;
            btnCom.Hide;
            btn6.Hide;
            btn7.Hide;
            btnTransferSonobuoy.Hide;
            btnRemoveSonobuoy.Hide;
            btnContents.Hide;
            btnAnnotate.Hide;
            btnMerge.Hide;
            btnSplit.Hide;
            Panel3.Hide;
            pnlMenubar.Hide;
          end;
        end;

        fmPlatformGuidance1.mnReturntoBase1.Enabled := True;

        if simMgrClient.ISWasdal and Assigned(frmGuidance) then
          frmGuidance.fmPlatformGuidance1.mnReturntoBase1.Enabled := True;

        if not Assigned(fTransferSonobuoy) then
          fTransferSonobuoy := TfTransferSonobuoy.Create(self);
        fTransferSonobuoy.btnSonobuoyControlCombo.Enabled := True;

        cbAssumeControl.Items.Clear;
        GotoTime.Visible := True;
      end;
    crpCubicle:
      begin
        {Hide Menu}
        File1.Visible := False;
        Game1.Visible := False;

        {Hide Sub Menu}
        MonitorStudent.Visible := False;
        AddMine1.Visible := False;
        RuntimePlatform1.Visible := False;
        SettingStrategies1.Visible := False;

        {Hide Button Shortcut}
        History1.Visible := False;
        btnGameFreeze.Hide;
        btnStartGame.Hide;
        btnDoubleSpeed.Hide;
        btnSnapshot.Hide;
        btnMonitorStudent.Hide;
        btnSeparator8.Hide;

        btnToolAddMine.Hide;
        btnAddPlatform.Hide;
        btnPlotting.Hide;
        btnRemovePlatformOrTrack.Hide;

        {Button tidak kepake}
        btnInfoTool.Hide;
        btnSelectPlatform.Hide;
        btnToolBtnSlide.Hide;
        btnCom.Hide;
        btn6.Hide;
        btn7.Hide;
        btnTransferSonobuoy.Hide;
        btnRemoveSonobuoy.Hide;
        btnContents.Hide;
        btnAnnotate.Hide;
        btnMerge.Hide;
        btnSplit.Hide;
        Panel3.Hide;
        pnlMenubar.Hide;

        {filter click kanan plotting}
        miPlottingNew.Visible := False;
        miPlottingEdit.Visible := False;
        miPlottingDelete.Visible := False;

        if simMgrClient.ISWasdal and Assigned(frmGuidance) then
          frmGuidance.fmPlatformGuidance1.mnReturntoBase1.Enabled := False;

        fmPlatformGuidance1.mnReturntoBase1.Enabled := False;

        if not Assigned(fTransferSonobuoy) then
          fTransferSonobuoy := TfTransferSonobuoy.Create(self);
        fTransferSonobuoy.btnSonobuoyControlCombo.Enabled := False;
      end;
  end;

  Refresh_AssumeControl;
end;

procedure TfrmTacticalDisplay.SetSelectedTrack(track: TSimObject);
begin
  if Assigned(track) then      //mk
  begin
    if (focusedTrack is TT3PlatformInstance) and (focusedTrack <> track) and
        (lvTrackControl.Selected = nil) and not(isMultiMode)then
    begin
      if (simMgrClient.IsWasdal)  and
        (Assigned(frmGuidance)) then
      begin
        if frmGuidance.lvTrackControl.Selected = nil then
        begin
          if (TT3PlatformInstance(focusedTrack).Selected) then
          begin
            if (focusedTrack is TT3PlatformInstance) then
            begin
              TT3PlatformInstance(focusedTrack).Selected := false;
            end
            else
            begin
              if (focusedTrack is TT3DetectedTrack) then
                TT3DetectedTrack(focusedTrack).Selected := false;
            end;
          end;
        end;
      end
      else
      begin
        if (TT3PlatformInstance(focusedTrack).Selected) then
        begin
          if (focusedTrack is TT3PlatformInstance) then
          begin
            TT3PlatformInstance(focusedTrack).Selected := false;
          end
          else
          begin
            if (focusedTrack is TT3DetectedTrack) then
              TT3DetectedTrack(focusedTrack).Selected := false;
          end;
        end;
      end;
    end;

    focusedTrack := track;
    if (focusedTrack is TT3Vehicle) then
    begin
      btnTrackHistory.Down := TT3Vehicle(focusedTrack).ShowTrails;
      btnTrackHistory2D.Down := TT3Vehicle(focusedTrack).ShowTrails;
      History2.Checked := TT3Vehicle(focusedTrack).ShowTrails;
    end
    else if (focusedTrack is TT3DetectedTrack) then
    begin
      btnTrackHistory.Down := TT3DetectedTrack(focusedTrack).ShowTrails;
      btnTrackHistory2D.Down := TT3DetectedTrack(focusedTrack).ShowTrails;
      History2.Checked := TT3DetectedTrack(focusedTrack).ShowTrails;
    end
    else
    begin
      btnTrackHistory.Down := false;
      btnTrackHistory2D.Down := False;
      History2.Checked := False;
    end;

  end;
end;

procedure TfrmTacticalDisplay.Settings1Click(Sender: TObject);
begin
  if focusedTrack <> nil then
  begin
    Map1.CurrentTool := mtAnchorTool;
    fSettingCoordinate.Show;
  end;

  if Map1.CurrentTool = mtAnchorTool then
    Map1.CurrentTool := mtSelectObject;
end;

procedure TfrmTacticalDisplay.Settings2Click(Sender: TObject);
begin
  if not Assigned(fPictureCentreSettings) then
    fPictureCentreSettings := TfPictureCentreSettings.Create(self);

  fPictureCentreSettings.FormStyle := fsStayOnTop;
  fPictureCentreSettings.Show;
end;

//procedure TfrmTacticalDisplay.SettingStrategiClick(Sender: TObject);
//begin
//  if not Assigned(frmLogisticTransfer) then
//    frmStrategiEditor := TfrmStrategiEditor.Create(self);
//
//  frmLogisticTransfer.UpdateTabIdShip;
//  frmStrategiEditor.Show;
//end;

procedure TfrmTacticalDisplay.Split1Click(Sender: TObject);
var
  track : TT3DetectedTrack;
  rec : TRecCmd_MergeTrack;
begin
  if not Assigned(focusedTrack) then
    Exit;

  if focusedTrack is TT3DetectedTrack then
  begin
    track := focusedTrack as TT3DetectedTrack;
    if Assigned(track.MergedESM) then
    begin
      rec.EsmTrackNumber := StrToInt(track.MergedESM.TrackNumber);
      rec.DetectedTrackNumber := track.TrackObject.InstanceIndex;
      rec.OrderMerge := false;

      simMgrClient.netSend_Cmd_MergeTrack(rec);
      {
      track.MergedESM.IsMerged := false;
      track.MergedESM := nil;
      }
    end;
  end;
end;

procedure TfrmTacticalDisplay.SetWeaponTargetObject(obj: TSimObject);
var
  aObject: TObject;
begin
  if Assigned(obj) then
  begin
    if obj <> nil then    //mk
    begin
      if not(Assigned(focusedTrack)) or (focusedTrack <> obj) then
      begin
        focusedTrack := nil;

        // unselect all track
        UnSelectAllRBLWPointTrack;
        UnSelectAllBOLWPointTrack;
        UnSelectAllPlatformTrack;
        UnSelectAllNRPlatformTrack;
        UnselectAllDetectedTrack;

        if obj is TT3PlatformInstance then
          TT3PlatformInstance(obj).Selected := true
        else
        if obj is TT3DetectedTrack then
          TT3DetectedTrack(obj).Selected := true;

        focusedTrack := obj;
      end;

      if Assigned(focusedTrack) then begin
        if focusedTrack is TT3PlatformInstance then
          fmWeapon1.SetFocusedPlatform(TT3PlatformInstance(focusedTrack))
        else if focusedTrack is TT3DetectedTrack then
        begin
          aObject := TT3DetectedTrack(focusedTrack).TrackObject;
          if Assigned(aObject) then
            fmWeapon1.SetFocusedPlatform(TT3PlatformInstance(aObject))
        end;
      end;
    end;
  end;
end;

procedure TfrmTacticalDisplay.Set_DoubleBufferd(const doubleBuffered: Boolean);
begin
  Map1.DoubleBuffered := doubleBuffered;
end;

procedure TfrmTacticalDisplay.Set_WasdalFullMap(const fullMap: Boolean);
begin
  if fullMap then
  begin
    View1.Visible := False;
    Hook1.Visible := False;
    Track1.Visible := False;
    Tools1.Visible := False;
    Help1.Visible := False;

    pnlTop.Hide;
  end;
end;

procedure TfrmTacticalDisplay.ShowPlottingOnTime(gtime : TDateTime);
var
  i : Integer;
  timeshow : TDateTime;
  hh, nn ,ss, ms : word;
  Plotting    : TMainPlottingShape;
  DifTime : TDateTime;
  TimeNow ,TimeLast : Double;
begin
  {Fajar : Show plotting appropriate with datetime }
  for i := 0 to simMgrClient.SimPlotting.FList.Count -1 do
  begin
    Plotting := simMgrClient.SimPlotting.FList.Items[i];
    if Plotting.IsCreate = false then
    begin
      TimeNow := StrToDateTime(formatdatetime('dd/mm/yyyy hh:nn:ss',gtime));
      TimeLast := StrToDateTime(formatdatetime('dd/mm/yyyy hh:nn:ss',Plotting.Time));
      timeshow := Plotting.Time;
      DifTime := gtime - timeshow;
      DecodeTime(DifTime, hh, nn, ss, ms);
      if (Int(hh) = 0) and (Int(nn) = 0) and (Int(ss) = 01) then
      begin
//        Plotting.IsCreate := True;
//        frmStrategiEditor.RefreshLTemplate;
      end
      else if TimeNow > TimeLast then
      begin
//        Plotting.IsCreate := True;
//        frmStrategiEditor.RefreshLTemplate;
      end;
    end;
  end;
end;

procedure TfrmTacticalDisplay.SetFCTargetObjectobj(obj : TSimObject);
var
  aObject : TObject;
begin
  if obj <> nil then      //mk
  begin
    if obj is TT3PlatformInstance then
       fmFireControl1.SetFocusedPlatform(TT3PlatformInstance(obj))
    else if obj is TT3DetectedTrack then
    begin
      aObject := TT3DetectedTrack(obj).TrackObject;
      if Assigned(aObject) then
        fmFireControl1.SetFocusedPlatform(TT3PlatformInstance(aObject));
    end;

    // wasdal UI
    if simMgrClient.ISWasdal then
    begin
      if Assigned(frmFCR) then
      begin
        if obj is TT3PlatformInstance then
           frmFCR.fmFireControl1.SetFocusedPlatform(TT3PlatformInstance(obj))
        else if obj is TT3DetectedTrack then
        begin
          aObject := TT3DetectedTrack(obj).TrackObject;
          if Assigned(aObject) then
            frmFCR.fmFireControl1.SetFocusedPlatform(TT3PlatformInstance(aObject));
        end;
      end;
    end;
  end;
end;

//procedure TfrmTacticalDisplay.StatciviewMenBarClick(Sender: TObject);
//begin
//  DynamicviewMenBar.Checked := False;
//  DimensionMenBar.Checked := False;
//  StatciviewMenBar.Checked := True;
//  mniDinamic.Checked := DynamicviewMenBar.Checked;
//  mniDimension.Checked := DimensionMenBar.Checked;
//  mniStatic.Checked := StatciviewMenBar.Checked;
//
//  simMgrClient.TacticalDinamicSymbol := DynamicviewMenBar.Checked;
//  simMgrClient.PlatformViewMode := DimensionMenBar.Checked;
//  simMgrClient.TacticalStaticSymbol := StatciviewMenBar.Checked;
//end;

procedure TfrmTacticalDisplay.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
  I: Integer;
  wpn: TT3Weapon;
  gunfire: Boolean;
  Emcon: Boolean;
  jamming: Boolean;
  EmconCat : TEMCON_Category;
begin
  case Panel.Index of
    4 : //emcon
      begin
        Emcon := False;
        if Assigned(simMgrClient.ControlledPlatform) then
        begin
          for I := 0 to TT3Vehicle(simMgrClient.ControlledPlatform).ListEMCON.Count - 1 do
          begin
            EmconCat := TT3Vehicle(simMgrClient.ControlledPlatform).ListEMCON.Items[i];

            if TEMCON_ChekBoxStatus(EmconCat.Mode) = Checked then
            begin
              Emcon := True;
              Break;
            end;
          end;
        end;

        if Emcon then
        begin
          if simMgrClient.ISWasdal then
          begin
//            StatusBar1.Canvas.Brush.Color := clMoneyGreen;
            StatusBar1.Canvas.Brush.Color := StringToColor('$005B4216');
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
            Panel.Bevel := pbLowered;
            StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
          end
          else
          begin
            StatusBar1.Canvas.Brush.Color := clBtnFace;
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
            Panel.Bevel := pbLowered;
            StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
          end;
        end
        else
        begin
          if simMgrClient.ISWasdal then
          begin
//            StatusBar1.Canvas.Brush.Color := clMoneyGreen;
            StatusBar1.Canvas.Brush.Color := StringToColor('$005B4216');
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
            Panel.Bevel := pbLowered;
          end
          else
          begin
            StatusBar1.Canvas.Brush.Color := clBtnFace;
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
            Panel.Bevel := pbLowered;
          end;
        end;
      end;
    5 : //jamming
      begin
        jamming := False;

        if Assigned(simMgrClient.ControlledPlatform) then
        begin
          jamming := simMgrClient.ControlledPlatform.VehicleOnJamming.Count <> 0
        end;

        if jamming then
        begin
          StatusBar1.Canvas.Brush.Color := clYellow;
          StatusBar1.Canvas.FillRect(Rect);
          StatusBar1.Font.Color := clBlack;
          Panel.Bevel := pbLowered;
          StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
        end
        else
        begin
          if simMgrClient.ISWasdal then
          begin
//            StatusBar1.Canvas.Brush.Color := clMoneyGreen;
            StatusBar1.Canvas.Brush.Color := StringToColor('$005B4216');
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
            Panel.Bevel := pbLowered;
          end
          else
          begin
            StatusBar1.Canvas.Brush.Color := clBtnFace;
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
            Panel.Bevel := pbLowered;
          end;
        end;
      end;
    6 : //Gun Fire
      begin
        gunfire := False;
        if Assigned(simMgrClient.ControlledPlatform) then
        begin
          for I := 0 to TT3Vehicle(simMgrClient.ControlledPlatform).Weapons.Count - 1 do
          begin
            wpn := TT3Weapon(TT3Vehicle(simMgrClient.ControlledPlatform).Weapons.Items[i]);
            if wpn is TT3GunOnVehicle then
            begin
              if wpn.WeaponStatus = wsFiring then
              begin
                gunfire := True;
                Break;
              end;
            end;
          end;

          if gunfire then
          begin
            StatusBar1.Canvas.Brush.Color := clYellow;
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
            StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
          end
          else
          begin
            if simMgrClient.ISWasdal then
            begin
//              StatusBar1.Canvas.Brush.Color := clMoneyGreen;
              StatusBar1.Canvas.Brush.Color := StringToColor('$005B4216');
              StatusBar1.Canvas.FillRect(Rect);
              StatusBar1.Font.Color := clBlack;
            end
            else
            begin
              StatusBar1.Canvas.Brush.Color := clBtnFace;
              StatusBar1.Canvas.FillRect(Rect);
              StatusBar1.Font.Color := clBlack;
            end;
          end;
        end;
      end;
    7 : //Fire Control
      begin
        if Assigned(simMgrClient.ControlledPlatform) then
        begin
          if simMgrClient.ControlledPlatform.LockFCR then
          begin
            StatusBar1.Canvas.Brush.Color := clRed;
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
            StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
          end
          else
          begin
            if simMgrClient.ISWasdal then
            begin
//              StatusBar1.Canvas.Brush.Color := clMoneyGreen;
              StatusBar1.Canvas.Brush.Color := StringToColor('$005B4216');
              StatusBar1.Canvas.FillRect(Rect);
              StatusBar1.Font.Color := clBlack;
            end
            else
            begin
              StatusBar1.Canvas.Brush.Color := clBtnFace;
              StatusBar1.Canvas.FillRect(Rect);
              StatusBar1.Font.Color := clBlack;
            end;
          end;
        end;
      end;
    9 : //State Game
      begin
        if Panel.Text = 'FROZEN' then
        begin
          StatusBar1.Canvas.Brush.Color := clRed;
          StatusBar1.Canvas.FillRect(Rect);
          StatusBar1.Font.Color := clBlack;
        end
        else if Panel.Text = '1 X' then
        begin
          if simMgrClient.ISWasdal then
          begin
//            StatusBar1.Canvas.Brush.Color := clMoneyGreen;
            StatusBar1.Canvas.Brush.Color := StringToColor('$005B4216');
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
          end
          else
          begin
            StatusBar1.Canvas.Brush.Color := clBtnFace;
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
          end;
        end
        else
        begin
          StatusBar1.Canvas.Brush.Color := clYellow;
          StatusBar1.Canvas.FillRect(Rect);
          StatusBar1.Font.Color := clBlack;

        end;

        StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
      end;
    12: //Server Stat
      begin
        if Panel.Text = 'Please wait ...' then
        begin
          StatusBar1.Canvas.Brush.Color := clRed;
          StatusBar1.Canvas.FillRect(Rect);
          StatusBar1.Font.Color := clBlack;
        end
        else if Panel.Text = '' then
        begin
          if simMgrClient.ISWasdal then
          begin
//            StatusBar1.Canvas.Brush.Color := clMoneyGreen;
            StatusBar1.Canvas.Brush.Color := StringToColor('$005B4216');
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
          end
          else
          begin
            StatusBar1.Canvas.Brush.Color := clBtnFace;
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
          end;
        end;

        StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
      end;
  end;
end;

procedure TfrmTacticalDisplay.StatusBar1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  VSlidingTrans.ShowHideBtnProc;
end;

procedure TfrmTacticalDisplay.Tactical1Click(Sender: TObject);
begin
  Show;
end;

procedure TfrmTacticalDisplay.TacticalDisplayControlPanelChange(
  Sender: TObject);
begin
//x
end;

procedure TfrmTacticalDisplay.takeSS(Sender: TObject);
const
  FullWindow = False; {False = windowed, True = fullscreen}
var
  hWind : HWND;
  dc : HDC;
  bmp : TBitmap;
  jpg : TJPEGImage;
  FileName : string;
  rect : TRect;
  width, height : Integer;
begin
  try
    Application.ProcessMessages;
    hWind := GetForegroundWindow;

    if FullWindow then
    begin
      GetWindowRect(hWind, rect);
      dc := GetDC(hWind);
    end
    else
    begin
      Windows.GetClientRect(hWind, rect);
      dc := GetDC(hWind);
    end;

    try
      width := rect.Right - rect.Left;
      height := rect.Bottom - rect.Top;

      bmp := TBitmap.Create;
      jpg := TJPEGImage.Create;

      try
        bmp.Height := height;
        bmp.Width := width;
        BitBlt(bmp.Canvas.Handle, 0, 0, width, height, dc, 0, 0, SRCCOPY);
        jpg.Assign(bmp);
        FileName := 'SS_'+simMgrClient.Scenario.ScenarioName+
        FormatDateTime('_yyyy-mm-dd_hh-mm-ss', Now());
        if not DirectoryExists('data\screenshot') then
          CreateDir('data\screenshot');

        jpg.SaveToFile(Format('data\screenshot\%s.jpg', [FileName]));
      finally
        bmp.Free;
        jpg.Free;
      end;
    finally
      ReleaseDC(hWind, dc);
    end;
  finally

  end;
end;

procedure TfrmTacticalDisplay.TBPositionElevationMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  trckbrPositionElevation.FSelectValueSymbol := (X >= 11) and (X <= 161) and
    (Y >= 2) and (Y <= 21);
end;

procedure TfrmTacticalDisplay.TBPositionElevationMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  rec : TRec_CameraController;
begin
  if trckbrPositionElevation.FSelectValueSymbol then
  begin
    rec.cmd := CORD_ID_CAMCON_POS_ELEVATION;
    rec.valueInt := trckbrPositionElevation.Position;

    simMgrClient.netSend_CameraController(rec);
  end;

  trckbrPositionElevation.FSelectValueSymbol := False;
end;

procedure TfrmTacticalDisplay.TBPositionRangeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  trckbrPositionRange.FSelectValueSymbol := (X >= 11) and (X <= 161) and
    (Y >= 2) and (Y <= 21);
end;

procedure TfrmTacticalDisplay.TBPositionRangeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  rec : TRec_CameraController;
begin
  if trckbrPositionRange.FSelectValueSymbol then
  begin
    rec.cmd := CORD_ID_CAMCON_POS_RANGE;
    rec.valueInt := trckbrPositionRange.Position;

    simMgrClient.netSend_CameraController(rec);
  end;

  trckbrPositionRange.FSelectValueSymbol := False;
end;

procedure TfrmTacticalDisplay.btnAddPlatformClick(Sender: TObject);
begin
  if not Assigned(frmRPLibrary) then
    frmRPLibrary := TfrmRPLibrary.Create(self);

  frmRPLibrary.SetUpGroupAndForce;
  frmRPLibrary.btnLaunch.Enabled := False;
  frmRPLibrary.Show;
end;

procedure TfrmTacticalDisplay.btnAddToTrackTableClick(Sender: TObject);
begin
  if focusedTrack <> nil then
  begin
    AddTrackPlatform(focusedTrack);
  end;
end;

procedure TfrmTacticalDisplay.btnAnchorCursorClick(Sender: TObject);
begin
  if focusedTrack = nil then
    Exit;

  anchorTrack := focusedTrack;

  if anchorTrack is TT3PlatformInstance then
  begin
    simMgrClient.LineVisual.X1 := TT3PlatformInstance(anchorTrack).getPositionX;
    simMgrClient.LineVisual.Y1 := TT3PlatformInstance(anchorTrack).getPositionY;
  end
  else if anchorTrack is TT3DetectedTrack then
  begin
    simMgrClient.LineVisual.X1 := TT3DetectedTrack(anchorTrack).getPositionX;
    simMgrClient.LineVisual.Y1 := TT3DetectedTrack(anchorTrack).getPositionY;
  end;
end;

procedure TfrmTacticalDisplay.btnAssumeControlOfHookClick(Sender: TObject);
var
  rec : TRec_ControlledShip;
begin
  if (focusedTrack <> nil) and (focusedTrack is TT3PlatformInstance) then
  begin
    if focusedTrack is TT3NonRealVehicle then
      Exit;

    if simMgrClient.ISWasdal then
    begin
      UpdateControlledPlatform;
      fmPlatformGuidance1.GrpVehicle := nil;

      if TT3Vehicle(focusedTrack).Vehicle_Control.Controlled = False then
      begin
        rec.PlatformID := simMgrClient.PIDControlledPlatform;
        rec.Controlled := False;
        rec.ControlledName := '';
        simMgrClient.netSend_cmd_ControlledShip(rec);

        rec.PlatformID := TT3PlatformInstance(focusedTrack).InstanceIndex;
        rec.Controlled := True;
        simMgrClient.PIDControlledPlatform := TT3PlatformInstance(focusedTrack).InstanceIndex;

        simMgrClient.netSend_cmd_ControlledShip(rec);

        if focusedTrack is TT3PlatformInstance then
              if TT3PlatformInstance(focusedTrack).Controlled <> True then
                TT3PlatformInstance(focusedTrack).Controlled := true;
      end
      else
      begin
        if TT3Vehicle(focusedTrack).Vehicle_Control.Control_Name <> simMgrClient.ConsoleName then
          addStatus(TT3Vehicle(focusedTrack).Track_ID + ' Controlled by ' + TT3Vehicle(focusedTrack).Vehicle_Control.Control_Name);
      end;
    end
    else
    begin
      if simMgrClient.ISInstructor then
      begin
        if focusedTrack is TT3PlatformInstance then
          if TT3PlatformInstance(focusedTrack).Controlled <> True then
            TT3PlatformInstance(focusedTrack).Controlled := true;
      end
      else
      begin
//        UpdateControlledPlatform;

//        if TT3Vehicle(focusedTrack).Vehicle_Control.Controlled = False then
//        begin
//          rec.PlatformID := simMgrClient.PIDControlledPlatform;
//          rec.Controlled := False;
//          rec.ControlledName := '';
//          simMgrClient.netSend_cmd_ControlledShip(rec);
//
//          rec.PlatformID := TT3PlatformInstance(focusedTrack).InstanceIndex;
//          rec.Controlled := True;
//          simMgrClient.PIDControlledPlatform := TT3PlatformInstance(focusedTrack).InstanceIndex;
//
//          simMgrClient.netSend_cmd_ControlledShip(rec);

          if focusedTrack is TT3PlatformInstance then
            if TT3PlatformInstance(focusedTrack).Controlled <> True then
                  TT3PlatformInstance(focusedTrack).Controlled := true;
//        end
//        else
//        begin
//          if TT3Vehicle(focusedTrack).Vehicle_Control.Control_Name <> simMgrClient.ConsoleName then
//            addStatus(TT3Vehicle(focusedTrack).Track_ID + ' Controlled by ' + TT3Vehicle(focusedTrack).Vehicle_Control.Control_Name);
//        end;
      end;
    end;

    Map1.Repaint;
  end;
end;

procedure TfrmTacticalDisplay.CentreOnGameCentreClick(Sender: TObject);
var
  long, lat: double;
begin
  {Set posisi map}
  long := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Long;
  lat := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Lat;
  VSimMap.SetMapCenter(long, lat);

  if btnCentreOnHook.Down or btnCentreOnHook2D.Down then           // mubdi - mengembalikan centeronhook
  begin                                                            // button yang tertahan
    FHookOnPlatform := not FHookOnPlatform;

    {Relase button lain}
    btnCentreOnHook.Down := FHookOnPlatform;
    btnCentreOnHook2D.Down := FHookOnPlatform;

    {uncheck menubar item}
    OnHookedTrack2.Checked := FHookOnPlatform;
  end;

  {Set stastusbar}
  if Sender is TToolButton then
    StatusBar1.Panels[0].Text := TToolButton(Sender).Hint
  else if Sender is TMenuItem then
    StatusBar1.Panels[0].Text := TMenuItem(Sender).Hint;
end;

procedure TfrmTacticalDisplay.btnCentreOnHookClick(Sender: TObject);
begin
  {jika diakses melalui menubar}
  if Sender is TMenuItem then
  begin
    if btnCentreOnHook.Down then
      btnCentreOnHook.Down := False
    else
      btnCentreOnHook.Down := True;
  end;

  {cek target jika tidak ada stop}
  if focusedTrack = nil then   //mk
    exit;

  {Set status target yang terpilih dan set pressed button}
  FHookOnPlatform := not FHookOnPlatform;
  btnCentreOnHook.Down := FHookOnPlatform;

  {Set check menubar}
  OnHookedTrack2.Checked := FHookOnPlatform;

  if FHookOnPlatform then
  begin
    try
      simMgrClient.MyCenterHookedPlatfom := focusedTrack;
      {pindah pusat map ke posisi target}
      VSimMap.SetMapCenter(simMgrClient.MyCenterHookedPlatfom.getPositionX,
            simMgrClient.MyCenterHookedPlatfom.getPositionY);
      {update posisi layar}
      FLastMapCenterY := simMgrClient.MyCenterHookedPlatfom.getPositionY;
      FLastMapCenterX := simMgrClient.MyCenterHookedPlatfom.getPositionX;

      {Uncheck menubar item}
      Pan1.Checked := False;
      Zoom1.Checked := False;

      {Relase button lain}
      btnPan.Down := False;
      btnPan2D.Down := False;
      btnZoom.Down := False;
      btnZoom2D.Down := False;

      {Set cursor}
      Map1.CurrentTool := mtSelectObject;
    except
      focusedTrack := nil;
      simMgrClient.MyCenterHookedPlatfom := nil;
    end;
  end
  else
  begin
    simMgrClient.MyCenterHookedPlatfom := nil;

    {Uncheck menubar item}
    OnHookedTrack2.Checked := False;
  end;

  {Set Statusbar}
  if Sender is TMenuItem then
  begin
    StatusBar1.Panels[0].Text := TMenuItem(Sender).Hint
  end
  else
    StatusBar1.Panels[0].Text := TToolButton(Sender).Hint;
end;

//procedure TfrmTacticalDisplay.ToolBtnCommClick(Sender: TObject);
//begin
////  ShellExecute(Handle, 'open', 'D:\NOPR\NOPR.bin\GC.exe', nil, nil, SW_SHOWNORMAL);
//end;

procedure TfrmTacticalDisplay.btnEditClick(Sender: TObject);
begin
  if focusedTrack = nil then
    exit;

  if frmEditNonRealTimeTrack.Showing then
  begin
    frmEditNonRealTimeTrack.Close;
  end;

  if (focusedTrack is TT3NonRealVehicle) then
  begin
    frmEditNonRealTimeTrack.Data := focusedTrack as TT3NonRealVehicle;
  end
  else if (focusedTrack is TT3DetectedTrack) then
  begin
    frmEditNonRealTimeTrack.Data := focusedTrack as TT3DetectedTrack;         //mk
  end
  else if focusedTrack is TT3ESMTrack then
  begin
    frmEditNonRealTimeTrack.Data := focusedTrack as TT3ESMTrack;
  end
  else if (focusedTrack is TT3Vehicle) then
  begin
    frmEditNonRealTimeTrack.Data := focusedTrack as TT3Vehicle;
  end;

  frmEditNonRealTimeTrack.Show;
end;

procedure TfrmTacticalDisplay.tbtnScaleIncreaseClick(Sender: TObject);
// : zoom in
var
  i: Integer;
  z, zNow: double;
begin
  zNow := FixMapZoom(0.5 * VSimMap.FMap.Zoom);
  i := FindClosestZoomIndex(zNow);
  z := ZoomIndexToScale(i);

  if z >= zNow then
    i := i - 1;
  if i < 0 then
    i := 0;
  if i > CMax_Z then
    i := CMax_Z;

  // do the zoom out
  cbSetScale.ItemIndex := i;
  cbSetScaleChange(cbSetScale);

  cbSetScale2D.ItemIndex := i;
  cbSetScale2DChange(cbSetScale2D);

  if Sender is TToolButton then
    StatusBar1.Panels[0].Text := TToolButton(Sender).Hint
  else if Sender is TMenuItem then
    StatusBar1.Panels[0].Text := TMenuItem(Sender).Hint;

end;

procedure TfrmTacticalDisplay.tbtnScaleDecreaseClick(Sender: TObject);
var
  i: Integer; // zoom out
  z, zNow: double;
begin
  zNow := FixMapZoom(0.5 * VSimMap.FMap.Zoom);
  i := FindClosestZoomIndex(zNow);
  z := ZoomIndexToScale(i);

  if z <= zNow then
    i := i + 1;
  if i < 0 then
    i := 0;
  if i > CMax_Z then
    i := CMax_Z;

  // do the zoom in
  cbSetScale.ItemIndex := i;
  cbSetScaleChange(cbSetScale);

  cbSetScale2D.ItemIndex := i;
  cbSetScale2DChange(cbSetScale2D);

  if Sender is TToolButton then
    StatusBar1.Panels[0].Text := TToolButton(Sender).Hint
  else if Sender is TMenuItem then
    StatusBar1.Panels[0].Text := TMenuItem(Sender).Hint;

end;

procedure TfrmTacticalDisplay.btnFilterCursorClick(Sender: TObject);
begin
  FAnchorFilterEnabled := not FAnchorFilterEnabled;

  btnFilterCursor.Down := FAnchorFilterEnabled;
  simMgrClient.LineVisual.Visible := FAnchorFilterEnabled;

  {Menetralkan cursor}
  if FAnchorFilterEnabled then
  begin
    Map1.CurrentTool := mtSelectObject;
    btnZoom.Down := False;
    btnPan.Down := False;
  end
  else
  begin
    if btnZoom.Down then
      Map1.CurrentTool := miZoomInTool
    else if btnPan.Down then
      Map1.CurrentTool := miCenterTool
    else
      Map1.CurrentTool := mtSelectObject;
  end;
end;

procedure TfrmTacticalDisplay.btnFilterRangeRingsClick(Sender: TObject);
var
  i: Integer;
  rrVis: Boolean;
  z: double;
begin
  {Set menubar item}
  if FilterRange1.Checked = True then
  begin
    FilterRange1.Checked := False;
    mniRangeRing1.Checked := False
  end
  else
  begin
    FilterRange1.Checked := True;
    mniRangeRing1.Checked := True;
  end;

  {Jika diakases melalui menubar}
  if Sender is TMenuItem then
  begin
    if btnFilterRangeRings.Down then
      btnFilterRangeRings.Down := False
    else
      btnFilterRangeRings.Down := True;
  end;

  if TToolButton(Sender).Name = 'btnFilterRangeRings' then
    rrVis := btnFilterRangeRings.Down
  else if TToolButton(Sender).Name = 'btnFilterRangeRings2D' then
    rrVis := btnFilterRangeRings2D.Down
  else if TToolButton(Sender).Name = 'FilterRange1' then
    rrVis := FilterRange1.Checked
  else if TToolButton(Sender).Name = 'mniRangeRing1' then
    rrVis := mniRangeRing1.Checked;

  if rrVis then
  begin
    z := FixMapZoom(VSimMap.FMap.Zoom);
    i := FindClosestZoomIndex(z);
    z := ZoomIndexToScale(i);
    simMgrClient.RangeRing.Interval := 0.125 * z;
  end;

  if Assigned(focusedTrack) then
    simMgrClient.MyRingHookedPlatfom := focusedTrack;

  if Assigned(simMgrClient.MyRingHookedPlatfom)then
  begin
    simMgrClient.RangeRing.mX := Map1.CenterX;
    simMgrClient.RangeRing.mY := Map1.CenterY;
    simMgrClient.RangeRing.Visible := rrVis;
  end;

  {Set statusbar}
  if Sender is TToolButton then
    StatusBar1.Panels[0].Text := TToolButton(Sender).Hint
  else if Sender is TMenuItem then
    StatusBar1.Panels[0].Text := TMenuItem(Sender).Hint;
end;

procedure TfrmTacticalDisplay.btnStartGameClick(Sender: TObject);
var
  r: TRecCmd_GameCtrl;
begin
  if (not simMgrClient.ISInstructor) or (vMapSetting.FormViewer)  then
    Exit;

  r.GameCtrl := CORD_ID_start;
  r.GameSpeed := 1.0;
  r.SessionID := simMgrClient.SessionID;

  if simMgrClient.IsFinish3DData = True then
  simMgrClient.netSend_CmdGameControl(r);

  // Tambahan Prince : memanggil fungsi killtask   //mk
  {try
    KillTask('tttMapStub.exe');
  finally
    ShellExecute(Application.Handle, 'open', 'tttMapStub.exe', nil, nil, SW_HIDE);
  end; }

  //// untuk replay
  if TGamePlayType(vGameDataSetting.GamePlayMode.GameType) = gpmReplay then
  begin
    inc(simMgrClient.InitFirstReplay);
    if simMgrClient.InitFirstReplay < 1 then
    begin
      simMgrClient.SimDetectedTrackList.ClearAndRemove;
      simMgrClient.ResetScenario;
      simMgrClient.LoadScenarioID(vGameDataSetting);
    end;
  end;
end;

procedure TfrmTacticalDisplay.tmMoveTimer(Sender: TObject);
begin
  if Assigned(focusedTrack) then
  begin
    if not TT3PlatformInstance(focusedTrack).IsRepositioning then
      TT3PlatformInstance(focusedTrack).BeginReposition;
  end;

  if simMgrClient.DrawRuler.IsVisible then
  begin
    {mengambil koordinat object untuk koordiant akhir ruler}
    if Assigned(frmRuler.ERulerTrack) then
    begin
      if frmRuler.IsEVisible then
      begin
        frmRuler.EndPosX := TT3PlatformInstance(frmRuler.ERulerTrack).getPositionX;
        frmRuler.EndPosY := TT3PlatformInstance(frmRuler.ERulerTrack).getPositionY;
      end;
    end
    else
    begin
      frmRuler.StartPosX := frmRuler.ETempX;
      frmRuler.StartPosY := frmRuler.ETempY;
    end;

    {mengambil koordinat object untuk koordinat awal ruler}
    if Assigned(frmRuler.SRulerTrack) then
    begin
       if frmRuler.IsSVisible then
      begin
        frmRuler.StartPosX := TT3PlatformInstance(frmRuler.SRulerTrack).GetPositionX;
        frmRuler.StartPosY := TT3PlatformInstance(frmRuler.SRulerTrack).GetPositionY;
      end;
    end
    else
    begin
      frmRuler.StartPosX := frmRuler.STempX;
      frmRuler.StartPosY := frmRuler.STempY;
    end;

    frmRuler.FillEditText;

    Map1.Repaint;
  end;
end;

procedure TfrmTacticalDisplay.toolbar4MouseLeave(Sender: TObject);
begin
  if FIsShowed then
  begin
    Panel3.Show;
    FIsShowed := False;
  end
  else
    Panel3.Hide;
end;

procedure TfrmTacticalDisplay.btnGameFreezeClick(Sender: TObject);
var
  r: TRecCmd_GameCtrl;
begin
  if (not simMgrClient.ISInstructor) or (vMapSetting.FormViewer) then
    Exit;
  r.GameCtrl := CORD_ID_pause;
  r.GameSpeed := 0.0;
  r.SessionID := simMgrClient.SessionID;
  simMgrClient.netSend_CmdGameControl(r);
end;

procedure TfrmTacticalDisplay.btnDoubleSpeedClick(Sender: TObject);
var
  r: TRecCmd_GameCtrl;
  gs: double;
begin
  if (not simMgrClient.ISInstructor) or (vMapSetting.FormViewer) then
    Exit;
  if simMgrClient.GameSpeed >= 1.0 then
  begin
    gs := Round(simMgrClient.GameSpeed);
    if abs(gs) < 0.0001 then // nol
      gs := 1.0
    else
    begin
      gs := 2.0 * gs;
      if gs > 32.0 then
        exit;
    end;

    r.GameCtrl := CORD_ID_game_speed;
    r.GameSpeed := gs;
    r.SessionID := simMgrClient.SessionID;

    simMgrClient.netSend_CmdGameControl(r);
  end;
end;

procedure TfrmTacticalDisplay.btnMonitorStudentClick(Sender: TObject);
var
  pForm: TfrmRemoteHost;

  prmIp       : string ;
  prmColor    : byte ;
  prmControl  : boolean ;

  i     : integer ;
  sIP   : string;
  con   :  TConsoleInfo;
begin
  //// remote
  pForm := TfrmRemoteHost.Create(Self);

  simMgrClient.GetALLConsoleInfo;
  pForm.ComboBox1.Items.Clear;
  for I := 0 to simMgrClient.FAllConsoleInfo.Count - 1 do begin
     con:= simMgrClient.FAllConsoleInfo.Objects[i] as TConsoleInfo;
     pForm.ComboBox1.Items.Add(con.ConsoleName);
  end;
  if pForm.ComboBox1.Items.Count > 0 then pForm.ComboBox1.ItemIndex := 0 ;

  if (pForm.ShowModal = mrOk) then
  begin
    if (Length(pForm.ComboBox1.Text) > 0) then
    begin

      sIP :='';
      for I := 0 to simMgrClient.FAllConsoleInfo.Count - 1 do begin
       con:= simMgrClient.FAllConsoleInfo.Objects[i] as TConsoleInfo;
       if UpperCase (con.ConsoleName) = UpperCase( pForm.ComboBox1.Text) then
       begin
          sIP := con.IPAddress;
          Break;
       end;
      end;

      prmIp := sIP ;
      prmColor := pForm.rg1.ItemIndex ;
      prmControl := False;
      simMgrClient.netSend_CmdRemote( prmIp ,prmColor, prmControl, REMOTE_STATE_TRUE );

    end;
  end;

  pForm.Free;
end;

procedure TfrmTacticalDisplay.btnHookNextClick(Sender: TObject);
var
  aObject : TSimObject;
  iObject : TObject;
  i : Integer;
begin
  try
    if TrackLists.LockList.Count > 0 then
    begin
      with TrackLists.LockList do
      begin
        aObject := Items[FIndexTrack];
        if aObject <> nil then
        begin
          if aObject is TT3PlatformInstance then
          begin
            focusedTrack := nil;

            // unselect all track
            UnSelectAllRBLWPointTrack;
            UnSelectAllBOLWPointTrack;
            UnSelectAllPlatformTrack;
            UnSelectAllNRPlatformTrack;
            UnselectAllDetectedTrack;

            TT3PlatformInstance(aObject).Selected := true;
            focusedTrack := TSimObject(aObject);

            for i := 0 to cbAssumeControl.Items.Count - 1 do
            begin
              iObject := cbAssumeControl.Items.Objects[i];

              if focusedTrack = iObject then
                break;
            end;

            cbAssumeControl.ItemIndex := i;

            Map1.Repaint;
          end
          else
          if aObject is TT3DetectedTrack then
          begin
            if Assigned(TT3DetectedTrack(aObject).TrackObject)
               and (not(TT3DetectedTrack(aObject).FreeMe)) then
            begin
              if TT3DetectedTrack(aObject).TrackObject is TT3PlatformInstance then
              begin
                focusedTrack := nil;

                // unselect all track
                UnSelectAllRBLWPointTrack;
                UnSelectAllBOLWPointTrack;
                UnSelectAllPlatformTrack;
                UnSelectAllNRPlatformTrack;
                UnselectAllDetectedTrack;

                TT3DetectedTrack(aObject).Selected := true;

                focusedTrack := TSimObject(aObject);
                Map1.Repaint;
              end;
            end;
          end;
        end;

        FIndexTrack := FIndexTrack + 1;

        if FIndexTrack > Count - 1 then
          FIndexTrack := 0;
      end;
    end
    else
        FIndexTrack := 0;
  finally
    TrackLists.UnlockList;
  end;
end;

procedure TfrmTacticalDisplay.btnHookPreviousClick(Sender: TObject);
var
  aObject : TSimObject;
  iObject : TObject;
  i : Integer;
begin
  try
    if TrackLists.LockList.Count > 0 then
    begin
      with TrackLists.LockList do
      begin
        aObject := Items[FIndexTrack];

        if aObject <> nil then
        begin
          if aObject is TT3PlatformInstance then
          begin
            focusedTrack := nil;

            // unselect all track
            UnSelectAllRBLWPointTrack;
            UnSelectAllBOLWPointTrack;
            UnSelectAllPlatformTrack;
            UnSelectAllNRPlatformTrack;
            UnselectAllDetectedTrack;

            TT3PlatformInstance(aObject).Selected := true;
            focusedTrack := TSimObject(aObject);

            for i := 0 to cbAssumeControl.Items.Count - 1 do
            begin
              iObject := cbAssumeControl.Items.Objects[i];

              if focusedTrack = iObject then
                break;
            end;
            cbAssumeControl.ItemIndex := i;

            Map1.Repaint;
          end
          else
          if aObject is TT3DetectedTrack then
          begin
            if Assigned(TT3DetectedTrack(aObject).TrackObject) then
            begin
              if TT3DetectedTrack(aObject).TrackObject is TT3PlatformInstance
                 and (not(TT3DetectedTrack(aObject).FreeMe)) then
              begin
                focusedTrack := nil;

                // unselect all track
                UnSelectAllRBLWPointTrack;
                UnSelectAllBOLWPointTrack;
                UnSelectAllPlatformTrack;
                UnSelectAllNRPlatformTrack;
                UnselectAllDetectedTrack;

                TT3DetectedTrack(aObject).Selected := true;

                focusedTrack := TSimObject(aObject);
                Map1.Repaint;
              end;
            end;
          end;
        end;

        FIndexTrack := FIndexTrack - 1;

        if FIndexTrack < 0 then
          FIndexTrack := Count - 1;
      end;
    end
    else
      FIndexTrack := 0;
  finally
    TrackLists.UnlockList;
  end;
end;

procedure TfrmTacticalDisplay.btnOptionsClick(Sender: TObject);
begin
  if (Sender is TMenuItem){ or (Sender = nil)} then
  begin
    if btnOptions.Down then
      btnOptions.Down := False
    else
      btnOptions.Down := True;
  end;

  if (btnOptions.Down) then
  begin
    fSettingCoordinate.Show;
  end
  else
  begin
    fSettingCoordinate.Hide;
  end;

//  if focusedTrack <> nil then
//  begin
//    Map1.CurrentTool := mtAnchorTool;
//    fSettingCoordinate.Show;
//  end;

  if Map1.CurrentTool = mtAnchorTool then
    Map1.CurrentTool := mtSelectObject;
end;

procedure TfrmTacticalDisplay.btnOverlayClick(Sender: TObject);
begin
  fmOverlayEditor.Show;
end;

procedure TfrmTacticalDisplay.btnPanClick(Sender: TObject);
begin
  {jk diacces lewat menu bar}
  if Sender is TMenuItem then
  begin
    if btnPan.Down then
      btnPan.Down := False
    else
      btnPan.Down := True;
  end;

  if (btnPan.Down) or (btnPan2D.Down) then
  begin
    {Set cursor}
    Map1.CurrentTool := miCenterTool;

    {Set check menu bar}
    Pan1.Checked := True;

    {Release button lain}
    btnZoom.Down := False;
    btnZoom2D.Down := False;

    btnMultiMode.Down := False;

    if btnCentreOnHook.Down or btnCentreOnHook2D.Down then
      FHookOnPlatform := not FHookOnPlatform;

    btnCentreOnHook.Down := False;
    btnCentreOnHook2D.Down := False;

    {Uncheck menu item}
    OnHookedTrack2.Checked := False;
    Zoom1.Checked := False;

    {Set statusbar}
    if Sender is TToolButton then
      StatusBar1.Panels[0].Text := TToolButton(Sender).Hint
    else if Sender is TMenuItem then
      StatusBar1.Panels[0].Text := TMenuItem(Sender).Hint;
  end
  else
  begin
    {Set cursor}
    Map1.CurrentTool := mtSelectObject;

    {Set statusbar}
    StatusBar1.Panels[0].Text := 'Select';

    {Uncheck menu item}
    Pan1.Checked := False;
  end;
end;

procedure TfrmTacticalDisplay.btnRangeRingsOnHookClick(Sender: TObject);
begin
  {Set menubar item}
  if OnHookedTrack1.Checked = True then
    OnHookedTrack1.Checked := False
  else
    OnHookedTrack1.Checked := True;

  {Jika diakses melalui menubar}
  if Sender is TMenuItem then
  begin
    if btnRangeRingsOnHook.Down then
      btnRangeRingsOnHook.Down := False
    else
      btnRangeRingsOnHook.Down := True;
  end;

  {Cek apakah dari formviewer}
  if TToolButton(Sender).Name = 'btnRangeRingsOnHook' then
    FRangeRingOnHook := btnRangeRingsOnHook.Down
  else if TToolButton(Sender).Name = 'btnRangeRingsOnHook2D' then
    FRangeRingOnHook := btnRangeRingsOnHook2D.Down
  else if TToolButton(Sender).Name = 'OnHookedTrack1' then
    FRangeRingOnHook := OnHookedTrack1.Checked;

  if FRangeRingOnHook then
    simMgrClient.MyRingHookedPlatfom := focusedTrack;

  if FRangeRingOnHook and (simMgrClient.MyRingHookedPlatfom <> nil) then
  begin
    simMgrClient.RangeRing.mx := simMgrClient.MyRingHookedPlatfom.getPositionX;
    simMgrClient.RangeRing.my := simMgrClient.MyRingHookedPlatfom.getPositionY;
  end;

  {Set statusbar}
  if Sender is TToolButton then
    StatusBar1.Panels[0].Text := TToolButton(Sender).Hint
  else if Sender is TMenuItem then
    StatusBar1.Panels[0].Text := TMenuItem(Sender).Hint;
end;

procedure TfrmTacticalDisplay.btnRemoveFromTrackTableClick(Sender: TObject);
begin
  if Assigned(focusedTrack) then
    RemoveFromTrackList(focusedTrack);
end;

procedure TfrmTacticalDisplay.btnRemovePlatformOrTrackClick
  (Sender: TObject);
var
  rec : TRecCmd_SelectPlatformToRemove;
  buttonSelected : Integer;
  i : Integer;
  dev: TSimObject;
  objPlatform : TSimObject;
begin
  if Assigned(focusedTrack) then
  begin
    buttonSelected := 1;

    if focusedTrack is TT3PlatformInstance then
		begin
	      if focusedTrack is TT3NonRealVehicle then
	        buttonSelected := MessageDlg('Do you really want to remove platform '
                            +IntToStr(TT3NonRealVehicle(focusedTrack).TrackNumber),
                            mtConfirmation, [mbYes,mbNo], 0)
        else
        begin
          if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
	          buttonSelected := MessageDlg('Do you really want to remove platform '
                              +TT3PlatformInstance(focusedTrack).InstanceName,
                              mtConfirmation, [mbYes,mbNo], 0);
        end;
		end
    else
    if focusedTrack is TT3DetectedTrack then
      buttonSelected := MessageDlg('Do you really want to remove platform '
                        +IntToStr(TT3DetectedTrack(focusedTrack).TrackNumber),
                        mtConfirmation, [mbYes,mbNo], 0);

    if (buttonSelected = mrNo) or (buttonSelected = 2) then
      Exit;

    rec.SessionID := simMgrClient.SessionID;
    if focusedTrack is TT3PlatformInstance then
    begin
      rec.PlatfomID := TT3PlatformInstance(focusedTrack).InstanceIndex;

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      begin
        if focusedTrack is TT3NonRealVehicle then
        begin
          rec.isNRPlatform := true;
          simMgrClient.netSend_CmdRemovePlatfromByOperator(rec);
        end
        else
        begin
          for i := 0 to simMgrClient.SimDevices.itemCount - 1 do     //mk
          begin
            dev := simMgrClient.SimDevices.getObject(i);
            if (dev is TT3Radar) then
            begin
              if (TT3Radar(dev).RadarDefinition.FDef.Num_FCR_Channels > 0) then
              begin
                objPlatform := simMgrClient.FindT3PlatformByID(rec.PlatfomID);
                objPlatform.IsAssigned := false;

                if TT3Radar(dev).AssignedTrack <> nil then
                begin
                  if TT3Radar(dev).AssignedTrack.Count > 0 then
                  begin
                    TT3Radar(dev).AssignedTrack.Remove(focusedTrack);
                    frmTacticalDisplay.fmFireControl1.SetControlledObject(TT3Radar(dev).Parent);
                    frmTacticalDisplay.fmFireControl1.RefreshAssignTrack(dev as TT3Radar);

                    // wasdal UI
                    if simMgrClient.ISWasdal then
                    begin
                      if Assigned(frmFCR) then
                      begin
                        frmFCR.fmFireControl1.SetControlledObject(TT3Radar(dev).Parent);
                        frmFCR.fmFireControl1.RefreshAssignTrack(dev as TT3Radar);
                      end;
                    end;

                  end;
                end;
              end;
            end;
          end;

          rec.isNRPlatform := false;
          rec.IdAction := 1; {titipan buat bedakan dengan landing, biar g usah ngubah plug in 3D}
          simMgrClient.netSend_CmdRemovePlatfromByOperator(rec);
        end;
	    end
      else if focusedTrack is TT3NonRealVehicle then
      begin
        rec.isNRPlatform := true;
        simMgrClient.netSend_CmdRemovePlatfromByOperator(rec);
      end
      else
        addStatus('Cant delete platform!');
    end
    else
      addStatus('Cant delete platform!');

    frmTacticalDisplay.Refresh_AssumeControl;
  end;
end;

procedure TfrmTacticalDisplay.btnRullerClick(Sender: TObject);
begin
  frmRuler.Show
end;

procedure TfrmTacticalDisplay.ToolBtnRotateMonitorClick(Sender: TObject);
begin
//  if ToolButton11.Down then
//  begin
//    frmRotateMonitor.BtnSelectMode(3);
//    ToolButtonBtn11.Down := True;
//  end
//  else
//  begin
//    frmRotateMonitor.BtnSelectMode(1);
//    ToolButtonBtn11.Down := False;
//  end;
end;

procedure TfrmTacticalDisplay.btnSelectPlatformClick(Sender: TObject);
begin
  if btnSelectPlatform.Down then
  begin
    if (focusedTrack <> nil) and (focusedTrack is TT3PlatformInstance) then
    begin
      if focusedTrack is TT3NonRealVehicle then
        Exit;

      Map1.OnPlatformSelected := True;

      Map1.Repaint;
    end;
  end
  else
    Map1.OnPlatformSelected := False;
end;

procedure TfrmTacticalDisplay.btnSnapshotClick(Sender: TObject);
var
  r : TRecCommandSnapshot ;
begin ;
  // snapshot
  if focusedTrack <> nil then     //mk
  begin
    if not Assigned(frmSnapshotDLG) then
    begin
      frmSnapshotDLG := TfrmSnapshotDLG.Create(self);
    end;

    frmSnapshotDLG.Edit1.MaxLength := 10;

    r.OrderID := CPID_CMD_SNAPSHOT_SAVE ;
    if frmSnapshotDLG.SendSnaphotMessage then
    begin
      r.SnapshotName := AnsiUpperCase(frmSnapshotDLG.Edit1.Text) ;
      simMgrClient.netSend_CmdSnapshot(r);
    end;
  end;
end;

procedure TfrmTacticalDisplay.btnTrackHistoryClick(Sender: TObject);
begin
  if focusedTrack = nil then
    Exit;

  if focusedTrack is TT3Vehicle then
  begin
    TT3Vehicle(focusedTrack).ShowTrails := not TT3Vehicle(focusedTrack).ShowTrails;

    {Set button}
    btnTrackHistory.Down := TT3Vehicle(focusedTrack).ShowTrails;
    btnTrackHistory2D.Down := TT3Vehicle(focusedTrack).ShowTrails;

    {Set menu bar}
    History2.Checked := TT3Vehicle(focusedTrack).ShowTrails;
  end
  else if focusedTrack is TT3DetectedTrack then
  begin
    TT3DetectedTrack(focusedTrack).ShowTrails := not TT3DetectedTrack(focusedTrack).ShowTrails;

    {Set button}
    btnTrackHistory.Down := TT3DetectedTrack(focusedTrack).ShowTrails;
    btnTrackHistory2D.Down := TT3DetectedTrack(focusedTrack).ShowTrails;

    {Set menu bar}
    History2.Checked := TT3DetectedTrack(focusedTrack).ShowTrails;
  end;
end;

procedure TfrmTacticalDisplay.btnZoomClick(Sender: TObject);
begin
  {jk diacces lewat menu bar}
  if Sender is TMenuItem then
  begin
    if btnZoom.Down then
      btnZoom.Down := False
    else
      btnZoom.Down := True;
  end;

  if (btnZoom.Down) or (btnZoom2D.Down) then
  begin
    {Set cursor}
    Map1.CurrentTool := miZoomInTool;

    {Set check menu bar}
    Zoom1.Checked := True;

    {Release button lain}
    btnPan.Down := False;
    btnPan2D.Down := False;

    btnMultiMode.Down := False;

    if btnCentreOnHook.Down then
      FHookOnPlatform := not FHookOnPlatform;

    btnCentreOnHook.Down := False;
    btnCentreOnHook2D.Down := False;

    {Uncheck menu item}
    OnHookedTrack2.Checked := False;
    Pan1.Checked := False;

    {Set statusbar}
    if Sender is TToolButton then
      StatusBar1.Panels[0].Text := TToolButton(Sender).Hint
    else if Sender is TMenuItem then
      StatusBar1.Panels[0].Text := TMenuItem(Sender).Hint;
  end
  else
  begin
    {Set cursor}
    Map1.CurrentTool := mtSelectObject;

    {Set statusbar}
    StatusBar1.Panels[0].Text := 'Select';

    {Uncheck menu item}
    Zoom1.Checked := False;
  end;
end;

procedure TfrmTacticalDisplay.ToolButton10Click(Sender: TObject);
begin
//  if ToolButton10.Down then
//  begin
//    if (focusedTrack <> nil) and (focusedTrack is TT3PlatformInstance) then
//    begin
//      if focusedTrack is TT3NonRealVehicle then
//        Exit;
//
//      Map1.OnPlatformSelected := True;
//
//      Map1.Repaint;
//    end;
//
//    ToolButtonBtn10.Down := True;
//  end
//  else
//  begin
//    Map1.OnPlatformSelected := False;
//
//    ToolButtonBtn10.Down := False;
//  end;
end;

//procedure TfrmTacticalDisplay.btnAirMap_2DClick(Sender: TObject);
//begin
//  btnLandMap_2D.Down := False;
//  btnSeaMap_2D.Down := False;
//  btnAirMap_2D.Down := True;
//
//  simMgrClient.SwitchMap(1);
//end;

//procedure TfrmTacticalDisplay.btnLandMap_2DClick(Sender: TObject);
//begin
//  btnAirMap_2D.Down := False;
//  btnSeaMap_2D.Down := False;
//  btnLandMap_2D.Down := True;
//
//  simMgrClient.SwitchMap(2);
//end;

//procedure TfrmTacticalDisplay.btnSeaMap_2DClick(Sender: TObject);
//begin
//  btnAirMap_2D.Down := False;
//  btnLandMap_2D.Down := False;
//  btnSeaMap_2D.Down := True;
//
//  simMgrClient.SwitchMap(3);
//end;

//procedure TfrmTacticalDisplay.btnInfo2DClick(Sender: TObject);
//begin
//  if btnInfo2D.Down then
//  begin
//    VSimMap.FMap.CurrentTool := mtLayerInfo;
//  end
//  else
//  begin
//    VSimMap.FMap.CurrentTool := miSelectTool;
//  end;
//end;

procedure TfrmTacticalDisplay.ToolButton38Click(Sender: TObject);
var
  pi : TT3PlatformInstance;
  i : Integer;
begin
//  if ToolButton38.Down then
//  begin
//    isMultiMode := True;
//    Map1.CurrentTool := mtMultiMode;
//    Map1.OnPlatformSelected := True;
//
//    ToolButton41.Down := True;
//  end
//  else
//  begin
//    isMultiMode := False;
//    Map1.CurrentTool := mtSelectObject;
//    UnSelectAllPlatformTrack;
//
//    if simMgrClient.ISWasdal and Assigned(frmGuidance) then
//      frmGuidance.fmPlatformGuidance1.clearPlatformMultiSelectList;
//
//    fmPlatformGuidance1.clearPlatformMultiSelectList;
//
//    simMgrClient.netSend_CmdMultiMode(0, C_CLEAR,0,0);
//
//    for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do begin
//      pi := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;
//      if pi.Controlled then
//       pi.Selected := True;
//    end;
//
//    Map1.OnPlatformSelected := False;
//
//    ToolButton41.Down := False;
//  end;
end;

procedure TfrmTacticalDisplay.ToolButton45Click(Sender: TObject);
begin
  if focusedTrack = nil then   //mk
    exit;

  FHookOnPlatform := not FHookOnPlatform;

  if FHookOnPlatform then
  begin
    try
      simMgrClient.MyCenterHookedPlatfom := focusedTrack;

      VSimMap.SetMapCenter(simMgrClient.MyCenterHookedPlatfom.getPositionX,
            simMgrClient.MyCenterHookedPlatfom.getPositionY);
      FLastMapCenterY := simMgrClient.MyCenterHookedPlatfom.getPositionY;
      FLastMapCenterX := simMgrClient.MyCenterHookedPlatfom.getPositionX;
    except
      focusedTrack := nil;
      simMgrClient.MyCenterHookedPlatfom := nil;
    end;
  end
  else
  begin
    simMgrClient.MyCenterHookedPlatfom := nil;
  end;

  StatusBar1.Panels[0].Text := TToolButton(Sender).Hint;
end;

procedure TfrmTacticalDisplay.ToolButton48Click(Sender: TObject);
begin
  if focusedTrack = nil then   //mk
    exit;

  FHookOnPlatform := not FHookOnPlatform;

  if FHookOnPlatform then
  begin
    try
      simMgrClient.MyCenterHookedPlatfom := focusedTrack;

      VSimMap.SetMapCenter(simMgrClient.MyCenterHookedPlatfom.getPositionX,
            simMgrClient.MyCenterHookedPlatfom.getPositionY);
      FLastMapCenterY := simMgrClient.MyCenterHookedPlatfom.getPositionY;
      FLastMapCenterX := simMgrClient.MyCenterHookedPlatfom.getPositionX;
    except
      focusedTrack := nil;
      simMgrClient.MyCenterHookedPlatfom := nil;
    end;
  end
  else
  begin
    simMgrClient.MyCenterHookedPlatfom := nil;
  end;

  StatusBar1.Panels[0].Text := TToolButton(Sender).Hint;
end;

procedure TfrmTacticalDisplay.ToolButton49Click(Sender: TObject);
begin
  frmStrategiEditor.Show;
end;

//procedure TfrmTacticalDisplay.btnFilterRangeRings2DClick(Sender: TObject);
//var
//  i: Integer;
//  rrVis: Boolean;
//  z: double;
//begin
//  rrVis := btnFilterRangeRings2D.Down;
//
//  // toolBtnFilterRangeRings.Down := FRangeRingVisible;
//  if rrVis then
//  begin
//    z := FixMapZoom(VSimMap.FMap.Zoom);
//    i := FindClosestZoomIndex(z);
//    z := ZoomIndexToScale(i);
//    simMgrClient.RangeRing.Interval := 0.125 * z;
//  end;
//
//  if Assigned(focusedTrack) then
//    simMgrClient.MyRingHookedPlatfom := focusedTrack;
//
//  if Assigned(simMgrClient.MyRingHookedPlatfom)then
//  begin
//    simMgrClient.RangeRing.mX := simMgrClient.MyRingHookedPlatfom.getPositionX;
//    simMgrClient.RangeRing.mY := simMgrClient.MyRingHookedPlatfom.getPositionY;
//    simMgrClient.RangeRing.Visible := rrVis;
//  end;
//
//  StatusBar1.Panels[0].Text := TToolButton(Sender).Hint;
//end;

procedure TfrmTacticalDisplay.ToolButton51Click(Sender: TObject);
begin
  frmStrategiEditor.Show;
end;

procedure TfrmTacticalDisplay.ToolButton5Click(Sender: TObject);
begin
  Map1.CurrentTool   := miArrowTool;
  Map1.MousePointer  := mtSelectObject;

  StatusBar1.Panels[0].Text := 'Select';
end;

procedure TfrmTacticalDisplay.ToolButtonAirClick(Sender: TObject);
begin
  btnLandMap_2D.Down := False;
  btnSeaMap_2D.Down := False;
  btnAirMap_2D.Down := True;

  simMgrClient.lastZoom := Map1.Zoom;
  simMgrClient.MapCenter_X := Map1.CenterX;
  simMgrClient.MapCenter_Y := Map1.CenterY;

  simMgrClient.SwitchMap(1);
end;

procedure TfrmTacticalDisplay.btnComClick(Sender: TObject);
var
  down : Boolean;
  hdl: THandle;
begin
  down := btnCom.Down;

  if down then
  begin
    hdl := FindWindow(nil, 'Phone');
    SetForegroundWindow(hdl);
  end;
end;

procedure TfrmTacticalDisplay.ToolButtonLandClick(Sender: TObject);
begin
  btnAirMap_2D.Down := False;
  btnSeaMap_2D.Down := False;
  btnLandMap_2D.Down := True;

  simMgrClient.lastZoom := Map1.Zoom;
  simMgrClient.MapCenter_X := Map1.CenterX;
  simMgrClient.MapCenter_Y := Map1.CenterY;

  simMgrClient.SwitchMap(2);
end;

procedure TfrmTacticalDisplay.ToolButtonSeaClick(Sender: TObject);
begin
  btnAirMap_2D.Down := False;
  btnLandMap_2D.Down := False;
  btnSeaMap_2D.Down := True;

  simMgrClient.lastZoom := Map1.Zoom;
  simMgrClient.MapCenter_X := Map1.CenterX;
  simMgrClient.MapCenter_Y := Map1.CenterY;

  simMgrClient.SwitchMap(3);
end;

procedure TfrmTacticalDisplay.Tote1Click(Sender: TObject);
begin
  frmToteDisplay.Show;
end;

procedure TfrmTacticalDisplay.Track1Click(Sender: TObject);
begin
  if Assigned(focusedTrack) then begin
    setMainMenuItem(TSimObject(focusedTrack));
    setShowMainMenuItem(TSimObject(focusedTrack));
  end;
end;

procedure TfrmTacticalDisplay.trckbrPositionElevationChange(Sender: TObject);
begin
  edtPositionElevation.Text := IntToStr(trckbrPositionElevation.Position);
end;

procedure TfrmTacticalDisplay.trckbrPositionElevationKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  rec : TRec_CameraController;
begin
  rec.cmd := CORD_ID_CAMCON_POS_ELEVATION;
  rec.valueInt := trckbrPositionElevation.Position;

  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.trckbrPositionRangeChange(Sender: TObject);
begin
  edtPositionRange.Text := IntToStr(trckbrPositionRange.Position);
end;


procedure TfrmTacticalDisplay.trckbrPositionRangeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  rec : TRec_CameraController;
begin
  rec.cmd := CORD_ID_CAMCON_POS_RANGE;
  rec.valueInt := trckbrPositionRange.Position;

  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.btnFullScreenClick(Sender: TObject);
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

procedure TfrmTacticalDisplay.hideBottomPanel(Sender: TObject);
begin
  if not isFullScreen then
  begin
    pnlBottom.Visible := true;
    isFullScreen := true;
  end
  else
  begin
     pnlBottom.Visible := false;
     isFullScreen := false;
  end

end;

procedure TfrmTacticalDisplay.UpdateFormData(Sender: TObject);
var
  i: Integer;
  ActivePanel: Tpanel;
  PanelTag: Integer;
  pi: TT3PlatformInstance;
  ge: TGame_Environment_Definition;
begin // ini procedure update yg dipanggil dari sim client
  ge := (simMgrClient).GameEnvironment;
  pi := nil;

  if Assigned(anchorTrack) then
  begin
    simMgrClient.LineVisual.X1 := anchorTrack.getPositionX;
    simMgrClient.LineVisual.Y1 := anchorTrack.getPositionY;
  end;

  UpdateTrackListData;

  if (simMgrClient.ControlledPlatform <> nil)
    and(simMgrClient.ControlledPlatform is TT3PlatformInstance) then
  begin
    if imgOwnShip.Tag = 1 then i := 0;
    if imgPlatformGuidance.Tag = 1 then i := 1;
    if imgCounterMeasure.Tag = 1 then i := 4;
    if imgWeapon.Tag = 1 then i := 3;
    if imgSensor.Tag = 1 then i := 2;
    if imgEMCON.Tag = 1 then i := 6;
    if imgFireControl.Tag = 1 then i := 5;

    pi := TT3PlatformInstance(simMgrClient.ControlledPlatform);
//    i := TacticalDisplayControlPanel.ActivePageIndex;

    if i = 1 then
      TT3Vehicle(simMgrClient.ControlledPlatform).Waypoints.IsOpenGuidanceTab := True
    else
      TT3Vehicle(simMgrClient.ControlledPlatform).Waypoints.IsOpenGuidanceTab := False;

    case i of
      0:
        fmOwnShip1.Refresh_OwnShipTab(pi);
      1:
        fmPlatformGuidance1.Refresh_VisibleTab();
      2:
        fmSensor1.Refresh_VisibleTab();
      3:
        fmWeapon1.Refresh_VisibleTab;
    end;

    { wasdal UI }
    if simMgrClient.ISWasdal then
    begin
      if Assigned(frmPlatformInfo) then
        frmPlatformInfo.fmOwnShip1.Refresh_OwnShipTab(pi);
      if Assigned(frmGuidance) then
        frmGuidance.fmPlatformGuidance1.Refresh_VisibleTab;
      if Assigned(frmSensor) then
        frmSensor.fmSensor1.Refresh_VisibleTab;
      if Assigned(frmWeapon) then
        frmWeapon.fmWeapon1.Refresh_VisibleTab;
    end;
  end;

  if FAnchorFilterEnabled then
  begin
    lbRangeAnchor.Caption := FormatFloat('00.00', simMgrClient.LineVisual.Range);//FormatSpeed(simMgrClient.LineVisual.Range);
    lbBearingAnchor.Caption := FormatCourse(simMgrClient.LineVisual.Bearing);
  end
  else if (Assigned(focusedTrack)) and (focusedTrack is TT3NonRealVehicle) then
  begin
    if (TT3NonRealVehicle(focusedTrack).NRPType = nrpBearing) then
    begin
      lbRangeAnchor.Caption := FormatFloat('00.00', TT3NonRealVehicle(focusedTrack).LineVisual.Range);//FormatSpeed(TT3NonRealVehicle(focusedTrack).LineVisual.Range);
      lbBearingAnchor.Caption := FormatCourse(TT3NonRealVehicle(focusedTrack).LineVisual.Bearing);
    end;
  end
  else
  begin
    lbRangeAnchor.Caption := '---';
    lbBearingAnchor.Caption := '---';
  end;

//  lbRangeRings.Caption := FormatFloat('00.000', FormatCourse(simMgrClient.RangeRing.Interval));
  lbRangeRings.Caption := FormatFloat('00.000', simMgrClient.RangeRing.Interval);

  if pi <> nil then
  begin
    // Tambahan : Prince
    if pi.PlatformDomain = vhdAir then
      begin
        Label10.Caption := FormatCourse(pi.Course);
        Label21.Caption := FormatSpeed(pi.Speed);

        frmToteDisplay.lblWindRelativeSpeed.Caption :=
          FormatCourse(TT3Vehicle(simMgrClient.ControlledPlatform).SpeedEnvi * C_KnotsToMeterPerSecond);
        frmToteDisplay.lblWindRelativeDirection.Caption :=
          FormatCourse(TT3Vehicle(simMgrClient.ControlledPlatform).CourseEnvi);

        lbCourseHooked.Caption := FormatCourse(pi.Course);;
        lbSpeedHooked.Caption := FormatCourse(pi.Course);;
      end
    else if (pi.PlatformDomain = vhdSubsurface) and (pi.Altitude <> 0) then
      begin
        lbCourseHooked.Caption := FormatCourse(pi.Course);
        lbSpeedHooked.Caption := FormatSpeed(pi.Speed);

        frmToteDisplay.lblWindRelativeSpeed.Caption     := '---';
        frmToteDisplay.lblWindRelativeDirection.Caption := '---';

        Label10.Caption := '---';
        Label21.Caption := '---';
      end
    else if (pi.PlatformDomain = vhdAmphibious) and (pi.Altitude <> 0) then
      begin
        lbCourseHooked.Caption := FormatCourse(pi.Course);
        lbSpeedHooked.Caption := FormatSpeed(pi.Speed);
      end
    else
    begin
      lbCourseHooked.Caption := FormatCourse(pi.Course);
      lbSpeedHooked.Caption := FormatSpeed(pi.Speed);

      frmToteDisplay.lblWindRelativeSpeed.Caption     := '---';
      frmToteDisplay.lblWindRelativeDirection.Caption := '---';

      Label10.Caption := FormatCourse(ge.FData.Wind_Direction);
      Label21.Caption := FormatSpeed(ge.FData.Wind_Speed);
    end;
  end
  else
  begin
    lbCourseHooked.Caption := '---';
    lbSpeedHooked.Caption := '---';
  end;

  if focusedTrack <> nil then begin
    UpdateHookedInfo(focusedTrack);
    UpdatePanelTop(focusedTrack); //refresh btn merge di top panel

    if simMgrClient.ISWasdal and Assigned(frmTrackInfo) then
      frmTrackInfo.DisplayTab(focusedTrack);
  end
  else
  begin
    InitTabHookedInfo;
    btnMerge.Enabled := False;
  end;
end;

procedure TfrmTacticalDisplay.UpdateGameTime(Sender: TObject);
var
  I : Integer;
  v : TT3Vehicle;
  embark : TT3EmbarkedVehicle;
  li : TlistItem; //mk
  j: Integer;
begin
  DisplayGameTime(simMgrClient.GameSpeed, simMgrClient.GameTIME);
  frmToteDisplay.UpdateTimeMissile;

  if Assigned(frmWaypointEditor) then
    frmWaypointEditor.UpdateArrivalTime;

  //aldy
  if Assigned(frmToteDisplay.lvPlatforms.Selected) then
  begin
    li := frmToteDisplay.lvPlatforms.Selected;    //mk
    v := li.Data;

    if Assigned(v) then
    begin
      if Assigned(v.EmbarkedVehicles) then
      begin
        for I := 0 to v.EmbarkedVehicles.Count - 1 do
        begin
          embark := v.EmbarkedVehicles.Items[I];

          if Assigned(embark.OnEmbarkedTimer) then
            embark.OnEmbarkedTimer(embark, 1, 10);

          if Assigned(embark.OnEmbarkedReadyTimer) then
            embark.OnEmbarkedReadyTimer(embark, 1, 60);
        end;
      end;
    end;
  end;
end;

procedure TfrmTacticalDisplay.UpdateGroupControl(grp : T3GroupVehicle; Action : Byte);
var
  i : Integer;
  obj : T3GroupVehicle;
  li : TListItem;
begin
  case (Action) of
    C_ADD :
    begin
      if Assigned(grp) then
      begin
        if simMgrClient.ISInstructor or ((simMgrClient.IsWasdal) and (Assigned(frmGuidance)))then
        begin
          if grp.CubicleGroupID = 0 then
          begin
            if Assigned(frmGuidance) then
            begin
              li := frmGuidance.lvTrackControl.Items.Add;
              li.Caption := grp.GroupName;
              li.SubItems.Add(FormatSpeed(grp.Course));
              li.SubItems.Add(FormatSpeed(grp.Speed));
              li.Data := grp;

              li := lvTrackControl.Items.Add;
              li.Caption := grp.GroupName;
              li.SubItems.Add(FormatSpeed(grp.Course));
              li.SubItems.Add(FormatSpeed(grp.Speed));
              li.Data := grp;
            end
            else
            begin
              li := lvTrackControl.Items.Add;
              li.Caption := grp.GroupName;
              li.SubItems.Add(FormatSpeed(grp.Course));
              li.SubItems.Add(FormatSpeed(grp.Speed));
              li.Data := grp;
            end;
          end;
        end
        else
        begin
          if grp.CubicleGroupID = simMgrClient.FMyCubGroup.FData.Group_Index then
          begin
            li := lvTrackControl.Items.Add;
            li.Caption := grp.GroupName;
            li.SubItems.Add(FormatSpeed(grp.Course));
            li.SubItems.Add(FormatSpeed(grp.Speed));
            li.Data := grp;
          end;
        end;
      end;
    end;
    C_DELETE :
    begin
      if simMgrClient.ISInstructor or ((simMgrClient.IsWasdal) and (Assigned(frmGuidance)))then
      begin
        if Assigned(frmGuidance) then
        begin
          for i := 0 to frmGuidance.lvTrackControl.Items.Count - 1 do
          begin
            li := frmGuidance.lvTrackControl.Items[i];
            obj := T3GroupVehicle(li.Data);
            if obj.GroupID = grp.GroupID then
            begin
              li.Delete;
              Break;
            end;
          end;

          for i := 0 to lvTrackControl.Items.Count - 1 do
          begin
            li := lvTrackControl.Items[i];
            obj := T3GroupVehicle(li.Data);
            if obj.GroupID = grp.GroupID then
            begin
              li.Delete;
              Break;
            end;
          end;
        end
        else
        begin
          for i := 0 to lvTrackControl.Items.Count - 1 do
          begin
            li := lvTrackControl.Items[i];
            obj := T3GroupVehicle(li.Data);
            if obj.GroupID = grp.GroupID then
            begin
              li.Delete;
              Break;
            end;
          end;
        end;
      end
      else
      begin
        for i := 0 to lvTrackControl.Items.Count - 1 do
        begin
          li := lvTrackControl.Items[i];
          obj := T3GroupVehicle(li.Data);
          if obj.GroupID = grp.GroupID then
          begin
            li.Delete;
            Break;
          end;
        end;
      end;
    end;
    C_SPEED :
    begin
      if simMgrClient.ISInstructor or ((simMgrClient.IsWasdal) and (Assigned(frmGuidance)))then
      begin
        if Assigned(frmGuidance) then
        begin
          for i := 0 to frmGuidance.lvTrackControl.Items.Count - 1 do
          begin
            li := frmGuidance.lvTrackControl.Items[i];
            obj := T3GroupVehicle(li.Data);
            if obj.GroupID = grp.GroupID then
            begin
              li.SubItems[1] := FormatSpeed(grp.Speed);
              Break;
            end;
          end;

          for i := 0 to lvTrackControl.Items.Count - 1 do
          begin
            li := lvTrackControl.Items[i];
            obj := T3GroupVehicle(li.Data);
            if obj.GroupID = grp.GroupID then
            begin
              li.SubItems[1] := FormatSpeed(grp.Speed);
              Break;
            end;
          end;
        end
        else
        begin
          for i := 0 to lvTrackControl.Items.Count - 1 do
          begin
            li := lvTrackControl.Items[i];
            obj := T3GroupVehicle(li.Data);
            if obj.GroupID = grp.GroupID then
            begin
              li.SubItems[1] := FormatSpeed(grp.Speed);
              Break;
            end;
          end;
        end;
      end
      else
      begin
        for i := 0 to lvTrackControl.Items.Count - 1 do
        begin
          li := lvTrackControl.Items[i];
          obj := T3GroupVehicle(li.Data);
          if obj.GroupID = grp.GroupID then
          begin
            li.SubItems[1] := FormatSpeed(grp.Speed);
            Break;
          end;
        end;
      end;
    end;
    C_COURSE :
    begin
      if simMgrClient.ISInstructor or ((simMgrClient.IsWasdal) and (Assigned(frmGuidance)))then
      begin
        if Assigned(frmGuidance) then
        begin
          for i := 0 to frmGuidance.lvTrackControl.Items.Count - 1 do
          begin
            li := frmGuidance.lvTrackControl.Items[i];
            obj := T3GroupVehicle(li.Data);
            if obj.GroupID = grp.GroupID then
            begin
              li.SubItems[0] := FormatSpeed(grp.Course);
              Break;
            end;
          end;

          for i := 0 to lvTrackControl.Items.Count - 1 do
          begin
            li := lvTrackControl.Items[i];
            obj := T3GroupVehicle(li.Data);
            if obj.GroupID = grp.GroupID then
            begin
              li.SubItems[0] := FormatSpeed(grp.Course);
              Break;
            end;
          end;
        end
        else
        begin
          for i := 0 to lvTrackControl.Items.Count - 1 do
          begin
            li := lvTrackControl.Items[i];
            obj := T3GroupVehicle(li.Data);
            if obj.GroupID = grp.GroupID then
            begin
              li.SubItems[0] := FormatSpeed(grp.Course);
              Break;
            end;
          end;
        end;
      end
      else
      begin
        for i := 0 to lvTrackControl.Items.Count - 1 do
        begin
          li := lvTrackControl.Items[i];
          obj := T3GroupVehicle(li.Data);
          if obj.GroupID = grp.GroupID then
          begin
            li.SubItems[0] := FormatSpeed(grp.Course);
            Break;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmTacticalDisplay.UnselectAllDetectedTrack;
var
  i, j : integer;
  dt : TT3DetectedTrack;
  esmObj : TT3ESMTrack;
begin
  for I := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
  begin
    dt := simMgrClient.SimDetectedTrackList.getObject(i) as TT3DetectedTrack;
    dt.Selected := false;

    for j := 0 to dt.ESMTracks.Count - 1 do
    begin
      esmObj := dt.ESMTracks[j];
      esmObj.IsSelected := False;
    end;
  end;
end;

procedure TfrmTacticalDisplay.UnSelectAllBOlWPointTrack;
var
  i : integer;
  pi : TPointVehicleMissileBOLW;
begin
  for i := 0 to simMgrClient.SimPointBOLW_VehicleMissile.itemCount - 1 do
  begin
    pi := simMgrClient.SimPointBOLW_VehicleMissile.getObject(i) as TPointVehicleMissileBOLW;
    if pi.Selected then
      pi.Selected := False;
  end;
end;

procedure TfrmTacticalDisplay.UnSelectAllRBLWPointTrack;
var
  i : integer;
  pi : TPointVehicleMissileRBLW;
begin
  for i := 0 to simMgrClient.SimPointRBLW_VehicleMissile.itemCount - 1 do
  begin
    pi := simMgrClient.SimPointRBLW_VehicleMissile.getObject(i) as TPointVehicleMissileRBLW;
    if pi.Selected then
      pi.Selected := False;
  end;
end;

procedure TfrmTacticalDisplay.UnSelectAllNRPlatformTrack;
var
  i : integer;
  pi : TT3PlatformInstance;
begin
  for I := 0 to simMgrClient.simNonRealPlatform.itemCount - 1 do begin
    pi := simMgrClient.simNonRealPlatform.getObject(i) as TT3PlatformInstance;
      pi.Selected := false;
  end;

end;

procedure TfrmTacticalDisplay.UnSelectAllPlatformTrack;
var
  i : integer;
  pi : TT3PlatformInstance;
begin
  for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do begin
    pi := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;
      pi.Selected := false;
  end;
end;

procedure TfrmTacticalDisplay.UpdateCenter(Sender: TObject);
var
  range : double;
begin
  if FHookOnPlatform and Assigned(simMgrClient.MyCenterHookedPlatfom) then
  begin
    range := CalcRange(FLastMapCenterX,FLastMapCenterY,
              simMgrClient.MyCenterHookedPlatfom.PosX,
              simMgrClient.MyCenterHookedPlatfom.PosY);
    range := range * C_NauticalMile_To_Metre;

    // default update center ketika dR = 100 meter
    if range > 10 then begin
      FLastMapCenterX := simMgrClient.MyCenterHookedPlatfom.PosX;
      FLastMapCenterY := simMgrClient.MyCenterHookedPlatfom.PosY;

      VSimMap.SetMapCenter(FLastMapCenterX,FLastMapCenterY);
    end;
  end;

  if Assigned(simMgrClient.MyRingHookedPlatfom) then
  begin
    if FRangeRingOnHook then
    begin
      simMgrClient.RangeRing.mx := simMgrClient.MyRingHookedPlatfom.getPositionX;
      simMgrClient.RangeRing.my := simMgrClient.MyRingHookedPlatfom.getPositionY;
    end
    else
    begin
      simMgrClient.RangeRing.mx := Map1.CenterX;
      simMgrClient.RangeRing.my := Map1.CenterY;
    end;
  end;
end;

procedure TfrmTacticalDisplay.UpdateControlledPlatform;
var
  obj : TSimObject;
  v : TT3Vehicle;
  i : Integer;
  rec : TRec_ControlledShip;
begin
  if not Assigned(focusedTrack) then
    Exit;

  for i := 0 to simMgrClient.SimPlatforms.itemCount -1 do
  begin
    obj := simMgrClient.SimPlatforms.getObject(i);

    if obj is TT3Vehicle then
    begin
      v := TT3Vehicle(obj);
      if AnsiCompareStr(v.Vehicle_Control.Control_Name, simMgrClient.ConsoleName) = 0 then
      begin
        if v.InstanceIndex <> TT3Vehicle(focusedTrack).InstanceIndex then
        begin
          if (v.Vehicle_Control.Controlled) and (not TT3Vehicle(focusedTrack).Vehicle_Control.Controlled)then
          begin
            rec.PlatformID := v.InstanceIndex;
            rec.Controlled := False;
            rec.ControlledName := '';
            simMgrClient.netSend_cmd_ControlledShip(rec);
          end;
          Break;
        end;
      end;
    end;
  end;
end;

procedure TfrmTacticalDisplay.GetNameAndClass(const obj: TSimObject;
  var n, c: string);
var
  det: TT3DetectedTrack;
  fd: byte;
  v: TT3Vehicle;
begin
  if not Assigned(obj) then   //mk
    Exit;

  det := TT3DetectedTrack(obj);
  if not simMgrClient.ISInstructor or not simMgrClient.ISWasdal then
  begin
    fd := simMgrClient.FMyCubGroup.FData.Force_Designation;

    if det.TrackObject is TT3PlatformInstance then
    begin
      if det.TrackObject is TT3Vehicle then
      begin
        v := det.TrackObject as TT3Vehicle;
        if fd = TT3PlatformInstance(det.TrackObject).Force_Designation then
        begin
          n := v.InstanceName;
          c := TVehicle_Definition(v.UnitDefinition).FData.Vehicle_Identifier;
        end
        else
        begin
          n := 'Unknown';
          c := 'Unknown';
        end;
      end
      else
      begin
        if fd = TT3PlatformInstance(det.TrackObject).Force_Designation then
        begin
          n := TT3PlatformInstance(det.TrackObject).InstanceName;
          c := TT3PlatformInstance(det.TrackObject).InstanceClass;
        end
        else
        begin
          n := 'Unknown';
          c := 'Unknown';
        end;
      end;
    end;
  end;
end;

procedure TfrmTacticalDisplay.GotoTime1Click(Sender: TObject);
var
  i, j : Integer;
  simObj : TSimObject;
  objVehicle : TT3Vehicle;
  embList : TList;
begin
  for i := 0 to SimManager.SimPlatforms.itemCount - 1 do
  begin
    simObj := SimManager.SimPlatforms.getObject(i);
    if simObj is TT3Torpedo then
    begin
      ShowMessage('There are torpedo(s) still launch');
      Exit;
    end;
    if simObj is TT3Missile then
    begin
      ShowMessage('Theere are missile(s) still launch');
      Exit;
    end;
    if simObj is TT3Vehicle then
    begin
      objVehicle := TT3Vehicle(simObj);
      if (objVehicle.DestinationStateLog = lsProcess) or objVehicle.isTransferFromBase then
      begin
        ShowMessage('There are logistics transfer in progress');
        Exit;
      end;
      if objVehicle.cekDisembarkProses then
      begin
        ShowMessage('There are Embark/Disembark in progress');
        Exit;
      end;
//      embList := objVehicle.TransportedList;
//      for j := 0 to embList.Count - 1 do
//      begin
//        if TT3TransportedInstance(embList.Items[j]).Status < 2 then
//        begin
//          ShowMessage('There are Embark/Disembark in progress');
//          Exit;
//        end;
//      end;
    end;
  end;

  if not Assigned(frmGotoTime) then
    frmGotoTime := TfrmGotoTime.Create(Self);

  frmGotoTime.Show;
end;

procedure TfrmTacticalDisplay.DisplayTabHooked(Sender: TObject);
var
  v: TT3PlatformInstance;
  ct: TT3PlatformInstance;
  det: TT3DetectedTrack;
  d, b, long, lat: double;
  pY, pX: Extended;
  idCoordinat: Integer;
  esm: TT3ESMTrack;
  hasilUTM, hasilMGRS : string;   //dng
  largeLtr, smallLtr, horizontalNumb, verticalNumb, horzPoint, vertPoint : string;
begin
  v := nil;
  det := nil;
  idCoordinat := fSettingCoordinate.IdCoordinat;

  if Assigned(sender) then     //mk
  begin
    if Sender is TT3PlatformInstance then
      v := TT3PlatformInstance(Sender)
    else
    if Sender is TT3DetectedTrack then
    begin
      det := TT3DetectedTrack(Sender);

      if Assigned(det.MergedESM) then
      begin
        lbTrackHook.Caption:= (det.MergedESM.TrackNumber);
        lbNameHook.Caption := TT3PlatformInstance(det.MergedESM.TrackObject).InstanceName;
        lbClassHook.Caption:= TT3Radar(det.MergedESM.TrackObject).
                               RadarDefinition.FDef.Radar_Emitter;
        lbBearingHook.Caption := FormatFloat('000.0', det.MergedESM.Bearing);

        StaticText6.Caption := 'Origin';
        lbPositionHook1.Caption := formatDMS_long(det.MergedESM.DetectBy.PosX);
        lbPositionHook2.Caption := formatDMS_latt(det.MergedESM.DetectBy.PosY);

        Exit;
      end;

      v := TT3PlatformInstance(det.TrackObject);
    end
    else if Sender is TT3ESMTrack then
    begin
      esm := TT3ESMTrack(Sender);

      if esm.DetailedDetectionShowedESM.Track_ID then
        lbTrackHook.Caption      := esm.TrackNumber
      else
        lbTrackHook.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Name_Data_Capability then
        lbNameHook.Caption      := TT3PlatformInstance(esm.TrackObject).InstanceName
      else
        lbNameHook.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Class_Data_Capability then
        lbClassHook.Caption      := TT3Radar(esm.TrackObject).RadarDefinition.FDef.Radar_Emitter
      else
        lbClassHook.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Bearing_Data_Capability then
        lbBearingHook.Caption      := FormatFloat('000.0', esm.Bearing)
      else
        lbBearingHook.Caption      := '---';

      StaticText6.Caption := 'Origin';
      lbPositionHook1.Caption := formatDMS_long(TT3ESMTrack(sender).DetectBy.PosX);
      lbPositionHook2.Caption := formatDMS_latt(TT3ESMTrack(sender).DetectBy.PosY);

      Exit;
    end;
  end;

  b := 0;
  d := 0;

  if v <> nil then
  begin
    if simMgrClient.ControlledPlatform <> nil then
    begin
      ct := TT3PlatformInstance(simMgrClient.ControlledPlatform);
      b := CalcBearing(ct.getPositionX, ct.getPositionY, v.getPositionX,
           v.getPositionY);
      d := CalcRange(ct.getPositionX, ct.getPositionY, v.getPositionX,
           v.getPositionY);
    end;
  end;

  if det <> nil then
  begin
    if det.TrackObject is TT3DeviceUnit then
    begin
      v := det.TrackObject.Parent as TT3PlatformInstance;
    end
    else if det.TrackObject is TT3PlatformInstance then
    begin
      v := det.TrackObject as TT3PlatformInstance;
    end;

    if (det.TrackDomain = vhdSubsurface) then
    begin
      lb5.Caption := 'Depth';
      lb4.Caption := 'meter';

      if v.Altitude <> 0 then
        lbAltitude.Caption    := FormatAltitude(v.Altitude)
      else
        lbAltitude.Caption := '0'; // 05/ 04/ 2012
    end
    else
    begin
      lb5.Caption := 'Altitude';
      lb4.Caption := 'feet';

      if v.Altitude <> 0 then
       lbAltitude.Caption    := FormatAltitude(v.Altitude * C_Meter_To_Feet)
      else
       lbAltitude.Caption := '0'; // 05/ 04/ 2012
    end;

    if Assigned(v) then
    begin
//      if det.IsDetailViewed then
//      begin
        if det.DetailedDetectionShowed.Plat_Name_Recog_Capability then
        begin
//          lbNameHook.Caption      := v.InstanceName;
          lbNameHook.Caption      := det.TrackName;
        end
        else
        begin
//          lbNameHook.Caption      := 'Unknown';
          lbNameHook.Caption      := det.TrackName;
        end;

        if det.DetailedDetectionShowed.Plat_Class_Recog_Capability then
        begin
//          lbClassHook.Caption     := v.InstanceClass;
          lbClassHook.Caption      := det.TrackClass;
        end
        else
        begin
//          lbClassHook.Caption     := 'Unknown';
          lbClassHook.Caption      := det.TrackClass;
        end;

        if det.DetailedDetectionShowed.Heading_Data_Capability then
          lbCourseHook.Caption    := FormatCourse(v.Course)
        else
          lbCourseHook.Caption    := '---';

        if det.DetailedDetectionShowed.Ground_Speed_Data_Capability then
          lbGround.Caption        := FormatSpeed(v.Speed)
        else
          lbGround.Caption        := '---';

        if det.DetailedDetectionShowed.Altitude_Data_Capability then
        begin
          if (det.TrackDomain = vhdSubsurface) then
          begin
            lb5.Caption := 'Depth';
            lb4.Caption := 'meter';

            if v.Altitude <> 0 then
              lbAltitude.Caption    := FormatAltitude(v.Altitude)
            else
              lbAltitude.Caption := '0';
          end
          else
          begin
            lb5.Caption := 'Altitude';
            lb4.Caption := 'feet';

            if v.Altitude <> 0 then
             lbAltitude.Caption    := FormatAltitude(v.Altitude * C_Meter_To_Feet)
            else
             lbAltitude.Caption := '0';
          end;
        end
        else
          lbAltitude.Caption    := '---';
//      end;

      if det.DetailedDetectionShowed.Track_ID then
        lbTrackHook.Caption := FormatTrackNumber(det.trackNumber)
      else
        lbTrackHook.Caption   := 'Unknown';
    end
    else
    begin
      lbNameHook.Caption := 'Unknown';
      lbClassHook.Caption := 'Unknown';
    end;

    lbFormation.Caption     := '---';
    if Assigned(v) then
    begin
      lbDamage.Caption        := IntToStr(100 - Round(v.HealthPercent)) + '%';
    end;
  end
  else
  begin
    if Assigned(v) then
    begin
      if v is TT3NonRealVehicle then
        lbTrackHook.Caption := IntToStr(v.TrackNumber)
      else
        lbTrackHook.Caption := v.Track_ID;

      lbNameHook.Caption := v.InstanceName;

      if v is TT3Vehicle then
        lbClassHook.Caption := TVehicle_Definition(v.UnitDefinition)
          .FData.Vehicle_Identifier;

      if v is TT3Missile then
        lbClassHook.Caption := TMissile_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Torpedo then
        lbClassHook.Caption := TTorpedo_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Chaff then lbClassHook.Caption := 'Chaff';

      if v is TT3AirBubble then lbClassHook.Caption := 'Air Bubble';

      if v is TT3Decoy then lbClassHook.Caption := 'Decoy';

      if v is TT3Sonobuoy then lbClassHook.Caption := 'Sonobuoy';

      if v is TT3Mine then lbClassHook.Caption := 'Mine';

      if (v.PlatformDomain = vhdSubsurface) then
      begin
        lb5.Caption := 'Depth';
        lb4.Caption := 'meter';

        if v.Altitude <> 0 then
          lbAltitude.Caption    := FormatAltitude(v.Altitude)
        else
          lbAltitude.Caption := '0'; // 05/ 04/ 2012
      end
      else
      begin
        lb5.Caption := 'Altitude';
        lb4.Caption := 'feet';

        if v.Altitude <> 0 then
         lbAltitude.Caption    := FormatAltitude(v.Altitude * C_Meter_To_Feet)
        else
         lbAltitude.Caption := '0'; // 05/ 04/ 2012
      end;

      lbCourseHook.Caption    := FormatCourse(v.Course);
      lbGround.Caption        := FormatSpeed(v.Speed);
      lbFormation.Caption     := '---';

      lbDamage.Caption        := IntToStr(100 - Round(v.HealthPercent)) + '%';
    end;
  end;

  long := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Long;
  lat := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Lat;
  StaticText6.Caption := 'Position';

  case idCoordinat of
    1:
    begin
      if Assigned(v) then
      begin
        lbPositionHook1.Caption := formatDMS_long(v.getPositionX);
        lbPositionHook2.Caption := formatDMS_latt(v.getPositionY);
      end;
    end;
    2:
    begin
      pX := CalcMove(v.getPositionX, long);
      pY := CalcMove(v.getPositionY, lat);

      if (pX >= 0) and (pY >=0) then
      begin
        lbPositionHook1.Caption := 'White ' + FormatFloat('0.00', Abs(pX));  //kuadran 1
      end;
      if (pX <= 0) and (pY >=0) then
      begin
        lbPositionHook1.Caption := 'Red ' + FormatFloat('0.00', Abs(pX));   //kuadran 2
      end;
      if (pX < 0) and (pY < 0) then
      begin
        lbPositionHook1.Caption := 'Green ' + FormatFloat('0.00', Abs(pX)); //kuadran 3
      end;
      if (pX >= 0) and (pY <= 0) then
      begin
        lbPositionHook1.Caption := 'Blue ' + FormatFloat('0.00', Abs(pX));  //kuadran 4
      end;

      lbPositionHook2.Caption := FormatFloat('0.00', Abs(pY));
    end;
    3:
    begin
      if Assigned(v) then
      begin
        lbPositionHook1.Caption := ConvDegree_To_Georef(v.getPositionX, v.getPositionY);
      end;
    end;
    4:
    begin
      begin
        ConvDegree_To_UTM_and_MGRS(lat, long, hasilUTM, hasilMGRS);
        lbPositionHook1.Caption := hasilUTM ;   //dng
        lbPositionHook2.Caption := '';

      end;
    end;
    5:
    begin
        ConvDegree_To_UTM_and_MGRS(lat, long, hasilUTM, hasilMGRS);
        lbPositionHook1.Caption := hasilMGRS ;   //dng
        lbPositionHook2.Caption := '';
    end;
    6:
    begin
      if Assigned(v) then
      begin
        VSimMap.GetValLayerKarvak(v.getPositionX, v.getPositionY, largeLtr, smallLtr, horizontalNumb, verticalNumb);
        ConvDegree_To_Karvak(v.getPositionX, v.getPositionY, horzPoint, vertPoint);
        lbPositionHook1.Caption :=  largeLtr+horizontalNumb + horzPoint + verticalNumb + vertPoint;
        lbPositionHook2.Caption := '';
      end;
    end;
  end;

  lbBearingHook.Caption   := FormatCourse(b); ;
  lbRangeHook.Caption     := FormatFloat('000.00', d);
end;

procedure TfrmTacticalDisplay.DisplayTabDetail(Sender: TObject);
var
  v: TT3PlatformInstance;
  det: TT3DetectedTrack;
  dName, dClass: string;
  esm: TT3ESMTrack;
begin
  v := nil;
  det := nil;

  if Assigned(Sender) then
  begin
    if Sender is TT3PlatformInstance then
      v := TT3PlatformInstance(Sender)
    else
    if Sender is TT3DetectedTrack then
    begin
      {$REGION ' Detected Track '}
      det := TT3DetectedTrack(Sender);

      if Assigned(det.MergedESM) then
      begin
        lbMergeStatus.Caption := 'Merged';
        lbTrackDetails.Caption := (det.MergedESM.TrackNumber);
        lbNameDetails.Caption := TT3PlatformInstance(det.MergedESM.TrackObject).InstanceName;
        lbClassDetails.Caption := TT3Radar(det.MergedESM.TrackObject).RadarDefinition.FDef.Radar_Emitter;
        lbTypeDetails.Caption := 'Other';
        lbDoppler.Caption := '[None]';
        lbTrackType.Caption := 'Real Time Bearing Track';

        if TT3ESMTrack(Sender).IsMerged then
          lbMergeStatus.Caption := 'Merged'
        else
          lbMergeStatus.Caption := 'Not Merged';

        Exit;
      end
      else
        lbMergeStatus.Caption := 'Not Merged';

      v := TT3PlatformInstance(det.TrackObject);
      {$ENDREGION}
    end
    else if Sender is TT3ESMTrack then
    begin
      {$REGION ' ESM Track '}
      esm := TT3ESMTrack(Sender);

      if esm.DetailedDetectionShowedESM.Track_ID then
        lbTrackDetails.Caption      := esm.TrackNumber
      else
        lbTrackDetails.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Name_Data_Capability then
        lbNameDetails.Caption      := TT3PlatformInstance(esm.TrackObject).InstanceName
      else
        lbNameDetails.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Class_Data_Capability then
        lbClassDetails.Caption      := TT3Radar(esm.TrackObject).RadarDefinition.FDef.Radar_Emitter
      else
        lbClassDetails.Caption      := 'Unknown';

      lbIdentifier.Caption  := getIdentStr(esm.TrackIdent);
      lbDomain.Caption      := getDomain(esm.TrackDomain);
      lbTypeDetails.Caption := 'Other';
      lbDoppler.Caption     := '[None]';
      lbTrackType.Caption   := 'Real Time Bearing Track';

      if esm.IsMerged then
        lbMergeStatus.Caption := 'Merged'
      else
        lbMergeStatus.Caption := 'Not Merged';

      Exit;

      {$ENDREGION}
    end;

    if v = nil then
      exit;

    if det <> nil then
    begin
      {$REGION ' Jk yg di hook detected track '}
      GetNameAndClass(det, dName, dClass);

      lbTrackDetails.Caption := FormatTrackNumber(det.trackNumber);
      lbNameDetails.Caption  := det.TrackName;
      lbClassDetails.Caption := det.TrackClass;
      lbTypeDetails.Caption := 'Unknown';

      {$REGION ' Kodingan Lama '}
      if det.IsDetailViewed then
      begin
//        if det.DetailedDetectionShowed.Track_ID then
//          lbTrackDetails.Caption := FormatTrackNumber(det.trackNumber)
//        else
//          lbTrackDetails.Caption   := 'Unknown';
//
//        if det.DetailedDetectionShowed.Plat_Name_Recog_Capability then
//        begin
//          lbNameDetails.Caption      := v.InstanceName;
//        end
//        else
//        begin
//          lbNameDetails.Caption      := 'Unknown';
//        end;
//
//        if det.DetailedDetectionShowed.Plat_Class_Recog_Capability then
//        begin
//          lbClassDetails.Caption     := v.InstanceClass;
//        end
//        else
//        begin
//          lbClassDetails.Caption     := 'Unknown';
//        end;
//
//        if det.DetailedDetectionShowed.Plat_Type_Recog_Capability then
////          lbTypeDetails.Caption := getVehicleTypestr(det.TrackDomain, det.track, det.TrackType)  //no category on det track, ask mas Hambali
//            lbTypeDetails.Caption := 'Unknown'
//        else
//          lbTypeDetails.Caption := 'Unknown';

      end;
      {$ENDREGION}

      lbIdentifier.Caption  := getIdentStr(det.TrackIdent);
      lbDomain.Caption      := getDomain(det.TrackDomain);
      lbTrackType.Caption   := 'Real Time Point Track';
      {$ENDREGION}
    end
    else
    begin
      {$REGION ' Jk yg di hook selain detected track  '}
      if v is TT3NonRealVehicle then
      begin
        lbTrackDetails.Caption := IntToStr(v.TrackNumber);
        lbTypeDetails.Caption  := 'Other';
        lbIdentifier.Caption    := getIdentStr(v.TrackIdent);
        lbDomain.Caption        := getDomain(v.TrackDomain);
        lbTrackType.Caption     := getNRTrackTypeStr(TT3NonRealVehicle(v).NRPType);
      end
      else
      begin
        lbTrackDetails.Caption := v.Track_ID;
        lbTypeDetails.Caption := getVehicleTypestr(v.PlatformDomain, v.PlatformCategory, v.PlatformType);

        case v.Force_Designation of
          1 : lbIdentifier.Caption := 'Red Force';
          2 : lbIdentifier.Caption := 'Yellow Force';
          3 : lbIdentifier.Caption := 'Blue Force';
          4 : lbIdentifier.Caption := 'Green Force';
          5 : lbIdentifier.Caption := 'White Force';
          6 : lbIdentifier.Caption := 'Black Force';
        else
          lbIdentifier.Caption := 'White Force';
        end;

        lbDomain.Caption    := getDomain(v.PlatformDomain);
        lbTrackType.Caption := 'Real Time Point Track';
      end;

      lbNameDetails.Caption   := v.InstanceName;
      lbClassDetails.Caption  := v.InstanceClass;

      if v is TT3Missile then lbClassDetails.Caption := TMissile_On_Board(v.UnitDefinition).FDef.Class_Identifier;

      if v is TT3Torpedo then lbClassDetails.Caption := TTorpedo_On_Board(v.UnitDefinition).FDef.Class_Identifier;

      if v is TT3Chaff then lbClassDetails.Caption := 'Chaff';

      if v is TT3AirBubble then lbClassDetails.Caption := 'Air Bubble';

      if v is TT3Decoy then lbClassDetails.Caption := 'Decoy';

      if v is TT3Sonobuoy then lbClassDetails.Caption := 'Sonobuoy';

      if v is TT3Mine then lbClassDetails.Caption := 'Mine';
      {$ENDREGION}
    end;
  end;
end;

procedure TfrmTacticalDisplay.DisplayTabDetection(Sender: TObject);
var
  v: TT3PlatformInstance;
  dName, dClass: string;
  det: TT3DetectedTrack;
  //dev : TSimObject;
  esm: TT3ESMTrack;
begin
  v := nil;
  det := nil;

  if Assigned(Sender) then
  begin
    if Sender is TT3PlatformInstance then
      v := TT3PlatformInstance(Sender);

    if Sender is TT3DetectedTrack then
    begin
      {$REGION ' Detected Track '}
      det := TT3DetectedTrack(Sender);

      if Assigned(det.MergedESM) then
      begin
        lbTrackDetection.Caption := (det.MergedESM.TrackNumber);
        lbNameDetection.Caption := TT3PlatformInstance(det.MergedESM.TrackObject).InstanceName;
        lbClassDetection.Caption := TT3Radar(det.MergedESM.TrackObject).RadarDefinition.FDef.Radar_Emitter;
        lbFirstDetected.Caption := FormatDateTime('ddhhnn', det.MergedESM.FirstDetected)
        + 'Z ' + FormatDateTime(' mmm yyyy', det.MergedESM.FirstDetected);
        lbLastDetected.Caption := FormatDateTime('ddhhnn', det.MergedESM.LastDetected)
        + 'Z ' + FormatDateTime(' mmm yyyy', det.MergedESM.LastDetected);
        lbDetectionDetectionType.Caption := 'Merged Track';
        Exit;
      end;

      v := TT3PlatformInstance(det.TrackObject);
      {$ENDREGION}
    end
    else if Sender is TT3ESMTrack then
    begin
      {$REGION ' ESM Track '}
      esm := TT3ESMTrack(Sender);

      if esm.DetailedDetectionShowedESM.Track_ID then
        lbTrackDetection.Caption      := esm.TrackNumber
      else
        lbTrackDetection.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Name_Data_Capability then
        lbNameDetection.Caption      := TT3PlatformInstance(esm.TrackObject).InstanceName
      else
        lbNameDetection.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Class_Data_Capability then
        lbClassDetection.Caption      := TT3Radar(esm.TrackObject).RadarDefinition.FDef.Radar_Emitter
      else
        lbClassDetection.Caption      := 'Unknown';

      lbFirstDetected.Caption := FormatDateTime('ddhhnn', esm.FirstDetected)
            + 'Z ' + FormatDateTime(' mmm yyyy', esm.FirstDetected);
      lbLastDetected.Caption := FormatDateTime('ddhhnn', esm.LastDetected)
            + 'Z ' + FormatDateTime(' mmm yyyy', esm.LastDetected);
      lbDetectionDetectionType.Caption := 'ESM';

      Exit;
      {$ENDREGION}
    end;

    if v = nil then
      exit;

    if det <> nil then
    begin
      {$REGION ' Jk yg di hook detected track '}
      GetNameAndClass(det, dName, dClass);

      lbTrackDetection.Caption := FormatTrackNumber(det.trackNumber);
      lbNameDetection.Caption  := det.TrackName;
      lbClassDetection.Caption := det.TrackClass;

      {$REGION '  Kodingan Lama '}
      if det.IsDetailViewed then
      begin
//        if det.DetailedDetectionShowed.Track_ID then
//          lbTrackDetection.Caption := FormatTrackNumber(det.trackNumber)
//        else
//          lbTrackDetection.Caption  := 'Unknown';
//
//        if det.DetailedDetectionShowed.Plat_Name_Recog_Capability then
//        begin
//          lbNameDetection.Caption  := det.TrackName;//v.InstanceName;
//        end
//        else
//        begin
//          lbNameDetection.Caption  := 'Unknown';
//        end;
//
//        if det.DetailedDetectionShowed.Plat_Class_Recog_Capability then
//        begin
//          lbClassDetection.Caption := det.TrackClass;//v.InstanceClass;
//        end
//        else
//        begin
//          lbClassDetection.Caption := 'Unknown';
//        end;

//          lbNameDetection.Caption   := TT3DeviceUnit(det.TrackDetectedBy.Items[0]).InstanceName;
//          dev := det.TrackDetectedBy.Items[0];
//          if dev is TT3Visual then
//            lbClassDetection.Caption := 'Visual Sensor'
//          else
//          if dev is TT3Radar then
//            lbClassDetection.Caption := TT3Radar(dev).RadarDefinition.FDef.Radar_Emitter
//          else
//          if dev is TT3Sonar then
//            case (TT3Sonar(dev).SonarCategory) of
//              scHMS : lbClassDetection.Caption     := scsHMS;
//              scVDS : lbClassDetection.Caption     := scsVDS;
//              scTAS : lbClassDetection.Caption     := scsTAS;
//              scDipping : lbClassDetection.Caption := scsDipping;
//              scSonobuoy : lbClassDetection.Caption:= scsSonobuoy;
//            end
//          else
//          if dev is TT3EOSensor then
//            case (TT3EOSensor(dev).EODefinition.FData.Instance_Type) of
//              Byte(eocOptical) : lbClassDetection.Caption     := eocsOptical;
//              Byte(eocLaserSensor) : lbClassDetection.Caption := eocsLaserSensor;
//              Byte(eocInfrared) : lbClassDetection.Caption    := eocsInfrared;
//            end
//          else
//            lbClassDetection.Caption := TT3DeviceUnit(det.TrackDetectedBy.Items[0]).InstanceClass;
      end;
      {$ENDREGION}

      {$ENDREGION}
    end
    else
    begin
      {$REGION ' Jk yg di hook selain detected track  '}
      if v is TT3NonRealVehicle then
        lbTrackDetection.Caption := IntToStr(v.TrackNumber)
      else
        lbTrackDetection.Caption := v.Track_ID;

      lbNameDetection.Caption := v.InstanceName;
      lbClassDetection.Caption := v.InstanceClass;

      if v is TT3Missile then lbClassDetection.Caption := TMissile_On_Board(v.UnitDefinition).FDef.Class_Identifier;

      if v is TT3Torpedo then lbClassDetection.Caption := TTorpedo_On_Board(v.UnitDefinition).FDef.Class_Identifier;

      if v is TT3Chaff then lbClassDetection.Caption := 'Chaff';

      if v is TT3AirBubble then lbClassDetection.Caption := 'Air Bubble';

      if v is TT3Decoy then lbClassDetection.Caption := 'Decoy';

      if v is TT3Sonobuoy then lbClassDetection.Caption := 'Sonobuoy';

      if v is TT3Mine then lbClassDetection.Caption := 'Mine';

      {$ENDREGION}
    end;
  end;
end;

procedure TfrmTacticalDisplay.DisplayTabIFF(Sender: TObject);
var
  v: TT3PlatformInstance;
  det: TT3DetectedTrack;
  SensorDevice: TT3DeviceUnit;
  i: Integer;
  SensorIFF: TT3IFFSensor;
  esm: TT3ESMTrack;
begin
  v := nil;
  det := nil;

  if Assigned(Sender) then   //mk
  begin
    if Sender is TT3PlatformInstance then
      v := TT3PlatformInstance(Sender);

    if Sender is TT3DetectedTrack then
    begin
      {$REGION ' Detected Track '}
      det := TT3DetectedTrack(Sender);
      v := TT3PlatformInstance(det.TrackObject);
      {$ENDREGION}
    end
    else if Sender is TT3ESMTrack then
    begin
      {$REGION ' ESM Track '}
      esm := TT3ESMTrack(Sender);

      if esm.DetailedDetectionShowedESM.Track_ID then
        lbTrackIff.Caption      := esm.TrackNumber
      else
        lbTrackIff.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Name_Data_Capability then
        lbNameIff.Caption      := TT3PlatformInstance(esm.TrackObject).InstanceName
      else
        lbNameIff.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Class_Data_Capability then
        lbClassIff.Caption      := TT3Radar(esm.TrackObject).RadarDefinition.FDef.Radar_Emitter
      else
        lbClassIff.Caption      := 'Unknown';

      exit;
      {$ENDREGION}
    end;

    if v = nil then
      exit;

    if det <> nil then
    begin
      {$REGION ' Jk yg di hook detected track '}
      lbTrackIff.Caption := FormatTrackNumber(det.trackNumber);
      lbNameIff.Caption  := det.TrackName;
      lbClassIff.Caption := det.TrackClass;

      {$REGION '  Kodingan Lama '}
//      if det.DetailedDetectionShowed.Track_ID then
//        lbTrackIff.Caption := FormatTrackNumber(det.trackNumber)
//      else
//        lbTrackIff.Caption := 'Unknown';
//
//      if det.DetailedDetectionShowed.Plat_Name_Recog_Capability then
//      begin
//        lbNameIff.Caption  := v.InstanceName;
//      end
//      else
//      begin
//        lbNameIff.Caption  := 'Unknown';
//      end;
//
//      if det.DetailedDetectionShowed.Plat_Class_Recog_Capability then
//      begin
//        lbClassIff.Caption := v.InstanceClass;
//      end
//      else
//      begin
//        lbClassIff.Caption := 'Unknown';
//      end;
      {$ENDREGION}

      lbMode1Iff.Caption := det.TransMode1Detected;
      lbMode2Iff.Caption := det.TransMode2Detected;
      lbMode3Iff.Caption := det.TransMode3Detected;
      lbMode3CIff.Caption := det.TransMode3CDetected;

      if det.TransMode1Detected = '' then
      lbMode1Iff.Caption := '---';

      if det.TransMode2Detected = '' then
      lbMode2Iff.Caption := '---';

      if det.TransMode3Detected = '' then
      lbMode3Iff.Caption := '---';

      if det.TransMode3CDetected = '' then
      lbMode3CIff.Caption := '---';
      {$ENDREGION}
    end
    else
    begin
      {$REGION ' Jk yg di hook selain detected track  '}
      if v is TT3NonRealVehicle then
      begin
        lbTrackIff.Caption := IntToStr(v.TrackNumber);
      end
      else
      begin
        lbTrackIff.Caption := v.Track_ID;
      end;

      lbNameIff.Caption := v.InstanceName;
      lbClassIff.Caption := v.InstanceClass;

      if v is TT3Missile then
        lbClassIff.Caption := TMissile_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Torpedo then
        lbClassIff.Caption := TTorpedo_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Chaff then lbClassIff.Caption := 'Chaff';

      if v is TT3AirBubble then lbClassIff.Caption := 'Air Bubble';

      if v is TT3Decoy then lbClassIff.Caption := 'Decoy';

      if v is TT3Sonobuoy then lbClassIff.Caption := 'Sonobuoy';

      if v is TT3Mine then lbClassIff.Caption := 'Mine';

      if v is TT3Vehicle then
      begin
        for i := 0 to TT3Vehicle(v).Devices.Count -1 do
        begin
          SensorDevice := TT3DeviceUnit(TT3Vehicle(v).Devices.Items[i]);

          if SensorDevice is TT3IFFSensor then
          begin
            SensorIFF := TT3IFFSensor(SensorDevice);

            lbMode3CIff.Caption := '---';
            if SensorIFF.TransponderOperateStatus = sopon then
              begin
                if SensorIFF.TransponderMode1Enabled then
                  lbMode1Iff.Caption := DecToOct(IntToStr(SensorIFF.TransponderMode1))
                else
                  lbMode1Iff.Caption := '---';
                if SensorIFF.TransponderMode2Enabled then
                  lbMode2Iff.Caption := DecToOct(IntToStr(SensorIFF.TransponderMode2))
                else
                  lbMode2Iff.Caption := '---';
                if SensorIFF.TransponderMode3Enabled then
                  lbMode3Iff.Caption := DecToOct(IntToStr(SensorIFF.TransponderMode3))
                else
                  lbMode3Iff.Caption := '---';
                end
            else
            begin
              lbMode1Iff.Caption  :='---';
              lbMode2Iff.Caption  := '---';
              lbMode3Iff.Caption  := '---';
              lbMode3CIff.Caption := '---';
            end;
          end;
        end;
      end;
      {$ENDREGION}
    end;
  end;
end;

//procedure TfrmTacticalDisplay.DynamicviewMenBarClick(Sender: TObject);
//begin
//  DynamicviewMenBar.Checked := True;
//  DimensionMenBar.Checked := False;
//  StatciviewMenBar.Checked := False;
//  mniDinamic.Checked := DynamicviewMenBar.Checked;
//  mniDimension.Checked := DimensionMenBar.Checked;
//  mniStatic.Checked := StatciviewMenBar.Checked;
//
//  simMgrClient.TacticalDinamicSymbol := DynamicviewMenBar.Checked;
//  simMgrClient.PlatformViewMode := DimensionMenBar.Checked;
//  simMgrClient.TacticalStaticSymbol := StatciviewMenBar.Checked;
//
//end;

procedure TfrmTacticalDisplay.edtFormKeyPress(Sender: TObject; var Key: Char);
var
  key1 : Char;
begin
  key1 := Key;

  if Assigned(simMgrClient.OnLogStr) then
    simMgrClient.OnLogStr('TfrmTacticalDisplay.edtFormKeyPress', 'coba keypressed form');
end;

procedure TfrmTacticalDisplay.edtPositionAzimuthExit(Sender: TObject);
var
  azimuth : Integer;
  rec : TRec_CameraController;
begin
  azimuth := StrToInt(edtPositionAzimuth.Text);

  if azimuth >= 360 then
    azimuth := 0;

  if azimuth < 180 then
    vrwhlPositionAzimuth.Position := azimuth + 180
  else
    vrwhlPositionAzimuth.Position := azimuth - 180;

  rec.cmd := CORD_ID_CAMCON_POS_AZIMUTH;
  rec.valueInt := azimuth;

  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.edtPositionAzimuthKeyPress(Sender: TObject;
  var Key: Char);
var
  azimuth : Integer;
  rec : TRec_CameraController;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    azimuth := StrToInt(edtPositionAzimuth.Text);

    if azimuth >= 360 then
      azimuth := 0;

    if azimuth < 180 then
      vrwhlPositionAzimuth.Position := azimuth + 180
    else
      vrwhlPositionAzimuth.Position := azimuth - 180;

    rec.cmd := CORD_ID_CAMCON_POS_AZIMUTH;
    rec.valueInt := azimuth;

    simMgrClient.netSend_CameraController(rec);
  end;
end;

procedure TfrmTacticalDisplay.edtPositionElevationExit(Sender: TObject);
var
  range : Integer;
  rec : TRec_CameraController;
begin
    range := StrToInt(edtPositionElevation.Text);

  if range < trckbrPositionElevation.Min then
    range := trckbrPositionElevation.Min
  else if range > trckbrPositionElevation.Max then
    range := trckbrPositionElevation.Max;

  trckbrPositionElevation.Position := range;

  rec.cmd := CORD_ID_CAMCON_POS_ELEVATION;
  rec.valueInt := range;

  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.edtPositionElevationKeyPress(Sender: TObject;
  var Key: Char);
var
  rec : TRec_CameraController;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin

    rec.valueInt := StrToInt(edtPositionElevation.Text);

    if rec.valueInt < trckbrPositionElevation.Min then
      rec.valueInt := trckbrPositionElevation.Min
    else if rec.valueInt > trckbrPositionElevation.Max then
      rec.valueInt := trckbrPositionElevation.Max;

    trckbrPositionElevation.Position := rec.valueInt;

    rec.cmd := CORD_ID_CAMCON_POS_ELEVATION;
    rec.valueInt := StrToInt(edtPositionElevation.Text);



    simMgrClient.netSend_CameraController(rec);
  end;
end;

procedure TfrmTacticalDisplay.edtPositionRangeExit(Sender: TObject);
var
  range : Integer;
  rec : TRec_CameraController;
begin
  range := StrToInt(edtPositionRange.Text);

  if range < trckbrPositionRange.Min then
    range := trckbrPositionRange.Min
  else if range > trckbrPositionRange.Max then
    range := trckbrPositionRange.Max;

  trckbrPositionRange.Position := range;

  rec.cmd := CORD_ID_CAMCON_POS_RANGE;
  rec.valueInt := range;

  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.edtPositionRangeKeyPress(Sender: TObject;
  var Key: Char);
var
  range : Integer;
  rec : TRec_CameraController;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    range := StrToInt(edtPositionRange.Text);

    if range < trckbrPositionRange.Min then
      range := trckbrPositionRange.Min
    else if range > trckbrPositionRange.Max then
      range := trckbrPositionRange.Max;

    trckbrPositionRange.Position := range;

    rec.cmd := CORD_ID_CAMCON_POS_RANGE;
    rec.valueInt := range;

    simMgrClient.netSend_CameraController(rec);
  end;
end;

procedure TfrmTacticalDisplay.execPDF(Sender: TObject);
var
  readPath : string;
  setting : TIniFile;
  tempString1 : TStringList;
begin
  if not (Sender is TMenuItem) then Exit;

  setting := TIniFile.Create('D:\_Deni W\AOPR\AOPR - Ver. KOLAT\AOPR.bin\Setting.ini');

  tempString1 := TStringList.Create;

  setting.ReadSection('helppath',tempString1);

  if TMenuItem(Sender).Tag = 0 then
    readPath := setting.ReadString('helppath',DeleteAmpersand(TMenuItem(Sender).Caption),'default')
  else  if TMenuItem(Sender).Tag = 1 then
    readPath := setting.ReadString('helppath',DeleteAmpersand(TMenuItem(Sender).Caption),'default')
  else if TMenuItem(Sender).Tag = 2 then
    readPath := setting.ReadString('helppath',DeleteAmpersand(TMenuItem(Sender).Caption),'default');

  ShellExecute(handle,'open',PChar(readPath),'','',1);
  setting.Free;
end;

//fix this later!
procedure TfrmTacticalDisplay.UpdateHookedInfo(Sender: TObject);
begin
  InitTabHookedInfo;

  if not Assigned(Sender) then
    exit;

  if pnlTabHook.Tag = 1 then
    DisplayTabHooked(Sender);

  if pnlTabDetails.Tag = 1 then
    DisplayTabDetail(Sender);

  if pnlTabDetection.Tag = 1 then
    DisplayTabDetection(Sender);

  if pnlTabIFF.Tag = 1 then
    DisplayTabIFF(Sender);

//  if HookContactInfoTraineeDisplay.ActivePage = tsHook then
//    DisplayTabHooked(Sender);
//
//  if HookContactInfoTraineeDisplay.ActivePage = tsDetails then
//    DisplayTabDetail(Sender);
//
//  if HookContactInfoTraineeDisplay.ActivePage = tsDetection then
//    DisplayTabDetection(Sender);
//
//  if HookContactInfoTraineeDisplay.ActivePage = tsIFF then
//    DisplayTabIFF(Sender);
end;

//procedure TfrmTacticalDisplay.UpdateOwnShipData(Sender: TObject);
//var
//  pi: TT3PlatformInstance;
//begin
//  if simMgrClient.ControlledPlatform = nil then
//    exit;
////
//  pi := TT3PlatformInstance(simMgrClient.ControlledPlatform);
////
//  fmOwnShip1.Refresh_OwnShipTab(pi);
////
//  if pi.PlatformDomain = vhdAir then
//    begin
//      Label10.Caption := FormatCourse(pi.Course);
//      Label21.Caption := FormatSpeed(pi.Speed);
//    end
//  else
//  begin
//    lbCourseHooked.Caption := FormatCourse(pi.Course);
//    lbSpeedHooked.Caption := FormatSpeed(pi.Speed);
//  end;
//end;

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
    VSimMap.SetMapZoom(z * 2);
    lblRangeScale.Caption := cbSetScale.Text;
  finally

  end;
end;

procedure TfrmTacticalDisplay.chkControlCamClick(Sender: TObject);
begin
  if chkControlCam.Checked then
  begin
    btnCamFree.Enabled := True;
    btnCamAttach.Enabled := True;
    btnCamLookAt.Enabled := True;

    if btnCamAttach.Down then
      grpPositionFromPlatform.Visible := True
    else
      grpPositionFromPlatform.Visible := False
  end
  else
  begin
    btnCamFree.Enabled := False;
    btnCamAttach.Enabled := False;
    btnCamLookAt.Enabled := False;
    grpPositionFromPlatform.Visible := False
  end;
end;

procedure TfrmTacticalDisplay.Filters1Click(Sender: TObject);
begin
  if not Assigned(fPictureFilter) then
    fPictureFilter := TfPictureFilter.Create(self);

  fPictureFilter.Show;
end;

function TfrmTacticalDisplay.FindTrackListByMember(const arg: string)
  : TListItem;
var
  i: Integer;
  f: Boolean;
  li: TListItem;
begin
  result := nil;
  li := nil;
  f := false;
  i := 0;

  while not f and (i < lvTrackTable.Items.Count) do
  begin
    li := lvTrackTable.Items.Item[i];

    f := SameText(li.SubItems[0], arg);

    Inc(i);
  end;

  if f then
    result := li;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1btnAirBubbleDeployClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmCounterMeasure1.btnAirBubbleDeployClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1btnChaffAirboneDeployClick(
  Sender: TObject);
begin
  fmCounterMeasure1.btnChaffAirboneDeployClick(Sender);

end;

procedure TfrmTacticalDisplay.fmCounterMeasure1btnFloatingDecoyDeployClick(
  Sender: TObject);
begin
  fmCounterMeasure1.btnFloatingDecoyDeployClick(Sender);

end;

procedure TfrmTacticalDisplay.fmCounterMeasure1btnRadarJammingModeSelectedTrackTrackClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then begin
        fmCounterMeasure1.focused_platform :=
          TT3PlatformInstance(TT3DetectedTrack(focusedTrack).TrackObject);
      end
      else if focusedTrack is TT3PlatformInstance then begin
        fmCounterMeasure1.focused_platform := focusedTrack;
      end;
    end;

    fmCounterMeasure1.btnRadarJammingModeSelectedTrackTrackClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1btnSDJammerTargetClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then begin
        fmCounterMeasure1.focused_platform :=
          TT3PlatformInstance(TT3DetectedTrack(focusedTrack).TrackObject);
      end
      else if focusedTrack is TT3PlatformInstance then begin
        fmCounterMeasure1.focused_platform := focusedTrack;
      end;
    end;

    fmCounterMeasure1.btnSDJammerTargetClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1btnSurfaceChaffAbortClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmCounterMeasure1.btnSurfaceChaffOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1btnSurfaceChaffCopyClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmCounterMeasure1.btnSurfaceChaffOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1btnSurfaceChaffLaunchClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmCounterMeasure1.btnSurfaceChaffOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1btnSurfaceChaffLauncherClick(
  Sender: TObject);
begin
  if Assigned(Sender) then
  begin
    fmCounterMeasure1.btnSurfaceChaffOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1btnSurfaceChaffTypeClick(
  Sender: TObject);
begin
  if Assigned(Sender) then
  begin
    fmCounterMeasure1.btnSurfaceChaffOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1ckSurfaceChaffEnabledClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmCounterMeasure1.ckSurfaceChaffEnabledClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1ckSurfaceChaffSeductionEnabledClick(
  Sender: TObject);
begin
  if Assigned(Sender) then
  begin
//    fmCounterMeasure1.
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1edtSurfaceChaffBloomAltitudeKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Assigned(Sender) then
  begin
    fmCounterMeasure1.OnSurfaceChaffKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1edtSurfaceChaffBloomRangeKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Assigned(Sender)then
  begin
    fmCounterMeasure1.OnSurfaceChaffKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1edtSurfaceChaffDelayKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Assigned(Sender) then
  begin
    fmCounterMeasure1.OnSurfaceChaffKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1edtSurfaceChaffSalvoSizeKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Assigned(Sender) then
  begin
    fmCounterMeasure1.OnSurfaceChaffKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1sbRadarJammingControlActivationOffClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmCounterMeasure1.btnRadarNoiseJammerOnClick(sender);
  end;
end;

procedure TfrmTacticalDisplay.fmCounterMeasure1sbRadarJammingControlActivationOnClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmCounterMeasure1.btnRadarNoiseJammerOnClick(sender);
  end;
end;

procedure TfrmTacticalDisplay.fmEMCON1cbEmconSearchRadarClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmEMCON1.cbEmconSearchRadarClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmEMCON1sbEmconAllSystemsAllSilentClick(
  Sender: TObject);
begin
  fmEMCON1.sbEmconAllClick(Sender);
end;

procedure TfrmTacticalDisplay.fmEMCON1sbEmconAllSystemsClearAllClick(
  Sender: TObject);
begin
  fmEMCON1.sbEmconAllClick(Sender);

end;

procedure TfrmTacticalDisplay.fmFireControl1btnSearchFireControlAssetsTargetClick(
  Sender: TObject);
begin
  SetFCTargetObjectobj(focusedTrack);
  SetWeaponTargetObject(focusedTrack);

  if Assigned(Sender)then
  begin
    fmFireControl1.btnSearchFireControlAssetsTargetClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmFireControl1lstFireControlAssetsAssignedTracksSelectItem(
  Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  if Assigned(Sender)then
  begin
    fmFireControl1.lstFireControlAssetsAssignedTracksSelectItem(Sender,Item, Selected);

    if Assigned(fmFireControl1.Focused_Platform) then
      ObjectAssignedByGun := fmFireControl1.Focused_Platform;
  end;
end;

//procedure TfrmTacticalDisplay.fmLogisticCalculation1btnAddLogClick(
//  Sender: TObject);
//begin
//  fmLogisticCalculation1.ButtonHandle(Sender);
//end;

//procedure TfrmTacticalDisplay.fmLogisticCalculation1btnFirstPointLogClick(
//  Sender: TObject);
//begin
//  fmLogisticCalculation1.btnFirstPointLogClick(Sender);
//end;

//procedure TfrmTacticalDisplay.fmLogisticCalculation1btnSecondPointLogClick(
//  Sender: TObject);
//begin
//  fmLogisticCalculation1.btnSecondPointLogClick(Sender);
//end;

procedure TfrmTacticalDisplay.fmLogisticCalculation1btnUseTemplateClick(
  Sender: TObject);
begin
//  fmLogisticCalculation1.ButtonHandleFormMiror(sender);
end;

procedure TfrmTacticalDisplay.fmLogisticCalculation1lvTemplateOnShipSelectItem(
  Sender: TObject; Item: TListItem; Selected: Boolean);
begin
//  fmLogisticCalculation1.ShipSelectItem(Sender,Item,Selected);
end;

procedure TfrmTacticalDisplay.fmOwnShip1btnLandPlatformClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmOwnShip1.btnLandPlatformClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmOwnShip1btnLaunchClick(Sender: TObject);
begin
  if Assigned(simMgrClient.ControlledPlatform) then
  begin
    if not Assigned(frmLaunchPlaform) then
      frmLaunchPlaform := TfrmLaunchPlaform.Create(self);

    frmLaunchPlaform.PlatformInst := TT3PlatformInstance(simMgrClient.ControlledPlatform);
    frmLaunchPlaform.FormStyle := fsStayOnTop;
    frmLaunchPlaform.Show;
  end;
end;

procedure TfrmTacticalDisplay.fmOwnShip1btnRangeLandingClick(Sender: TObject);
begin
  fmOwnShip1.btnRangeLandingClick(Sender);

end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1btnCircleModeClick(
  Sender: TObject);
begin
  fmPlatformGuidance1.btnCircleModeClick(Sender);

end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1btnQuickFormationClick(
  Sender: TObject);
begin
  fmPlatformGuidance1.btnQuickFormationClick(Sender);

end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1btnStationAnchorPositionClick(
  Sender: TObject);
begin
  fmPlatformGuidance1.btnStationAnchorPositionClick(Sender);

end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1btnWaypointClick
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.btnWaypointClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1edOrderAltitudeKeyPress
  (Sender: TObject; var Key: Char);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.edOrderAltitudeKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1edtEngageStandOffDistanceKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.edtEngageStandOffDistanceKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1edtHelmOrderedGroundSpeedKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.edtHelmOrderedGroundSpeedKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1edtOrderedHelmAngleKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.edtOrderedHelmAngleKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1edtPersonelGuidanceOrderedHeadingKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Assigned(Sender) then
  begin
    fmPlatformGuidance1.edtPersonelGuidanceOrderedHeadingKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.
  fmPlatformGuidance1edtStraightLineOrderedGroundSpeedKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.edtStraightLineOrderedGroundSpeedKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.
  fmPlatformGuidance1edtStraightLineOrderedHeadingKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.edtStraightLineOrderedHeadingKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1edtTrackToEngageKeyPress(
  Sender: TObject; var Key: Char);
begin
   // fmPlatformGuidance1.edtEngageStandOffDistanceKeyPress(Sender, Key);
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1edtZigZagBaseCourseKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.edtZigZagBaseCourseKeyPress(Sender, Key);
  End;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1Long1Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.Long1Click(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1mnCircleOnPosition1Click(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1mnCircleOnTrackClick
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1mnEngagement1Click(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then
        fmPlatformGuidance1.SetFocusedPlatform(TT3DetectedTrack(focusedTrack).TrackObject as TT3PlatformInstance)
      else if focusedTrack is TT3PlatformInstance then
        fmPlatformGuidance1.focused_platform := focusedTrack;
    end;

    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;


procedure TfrmTacticalDisplay.fmPlatformGuidance1mnEvasion1Click(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then
        fmPlatformGuidance1.SetFocusedPlatform(TT3DetectedTrack(focusedTrack).TrackObject as TT3PlatformInstance)
      else if focusedTrack is TT3PlatformInstance then
        fmPlatformGuidance1.focused_platform := focusedTrack;
    end;

    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1mnFormation2Click(
  Sender: TObject);
begin
  fmPlatformGuidance1.mnGuidanceClick(Sender);
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1mnHelm1Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1mnOutrun1Click(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then
        fmPlatformGuidance1.SetFocusedPlatform(TT3DetectedTrack(focusedTrack).TrackObject as TT3PlatformInstance)
      else if focusedTrack is TT3PlatformInstance then
        fmPlatformGuidance1.focused_platform := focusedTrack;
    end;

    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;

{procedure TfrmTacticalDisplay.fmPlatformGuidance1mnOutrun1Click(
  Sender: TObject);
begin
  fmPlatformGuidance1.mnGuidanceClick(Sender);
  if Assigned(focusedTrack) then
  begin
    if focusedTrack is TT3DetectedTrack then
      fmPlatformGuidance1.SetFocusedPlatform(TT3DetectedTrack(focusedTrack).TrackObject as TT3PlatformInstance)
    else if focusedTrack is TT3PlatformInstance then
      fmPlatformGuidance1.focused_platform := focusedTrack;
  end;

  fmPlatformGuidance1.mnGuidanceClick(Sender);

end; }

procedure TfrmTacticalDisplay.fmPlatformGuidance1mnShadow1Click(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then
        fmPlatformGuidance1.SetFocusedPlatform(TT3DetectedTrack(focusedTrack).TrackObject as TT3PlatformInstance)
      else if focusedTrack is TT3PlatformInstance then
        fmPlatformGuidance1.focused_platform := focusedTrack;
    end;

    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1mnSinuation1Click(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;

{procedure TfrmTacticalDisplay.fmPlatformGuidance1mnStationKeepingOnPositionClick(
  Sender: TObject);
begin
  fmPlatformGuidance1.mnGuidanceClick(Sender);

end;  }

procedure TfrmTacticalDisplay.fmPlatformGuidance1mnStraightLine1Click(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1mnWaypoint1Click
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1mnZigzag1Click(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1PersonelGudance1Click(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.mnGuidanceClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1sbCircleOnPositionPositionClick(
  Sender: TObject);
begin
  fmPlatformGuidance1.sbCircleOnPositionPositionClick(Sender);

end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1sbCircleOnTrackTrackClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then
        fmPlatformGuidance1.SetFocusedPlatform((focusedTrack as TT3DetectedTrack).TrackObject as TT3PlatformInstance)
      else if focusedTrack is TT3PlatformInstance then
        fmPlatformGuidance1.SetFocusedPlatform(focusedTrack as TT3PlatformInstance);
    end;

    fmPlatformGuidance1.sbCircleOnTrackTrackClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1sbEngageTrackToEngageClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then
        fmPlatformGuidance1.SetFocusedPlatform(TT3DetectedTrack(focusedTrack).TrackObject as TT3PlatformInstance)
      else if focusedTrack is TT3PlatformInstance then
        fmPlatformGuidance1.focused_platform := focusedTrack;
    end;

    fmPlatformGuidance1.sbEngageTrackToEngageClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1sbOnTrackAnchorModeClick(
  Sender: TObject);
begin
  fmPlatformGuidance1.btnCircleModeClick(Sender);

end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1sbOnTrackAnchorTrackClick(
  Sender: TObject);
begin
  fmPlatformGuidance1.sbOnTrackAnchorTrackClick(Sender);

end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1sbPersonalGuidanceModeClick(
  Sender: TObject);
begin
  fmPlatformGuidance1.sbPersonalGuidanceModeClick(Sender);
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1sbTrackToEvadeClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then
        fmPlatformGuidance1.SetFocusedPlatform(TT3DetectedTrack(focusedTrack).TrackObject as TT3PlatformInstance)
      else if focusedTrack is TT3PlatformInstance then
        fmPlatformGuidance1.focused_platform := focusedTrack;
    end;

    fmPlatformGuidance1.sbTrackToEvadeClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1sbTrackToOutrunClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then
        fmPlatformGuidance1.SetFocusedPlatform(TT3DetectedTrack(focusedTrack).TrackObject as TT3PlatformInstance)
      else if focusedTrack is TT3PlatformInstance then
        fmPlatformGuidance1.focused_platform := focusedTrack;
    end;

    fmPlatformGuidance1.sbTrackToOutrunClick(Sender);
  end;
end;

{procedure TfrmTacticalDisplay.fmPlatformGuidance1sbTrackToOutrunClick(
  Sender: TObject);
begin
  fmPlatformGuidance1.sbTrackToOutrunClick(Sender);
if Assigned(focusedTrack) then
  begin
    if focusedTrack is TT3DetectedTrack then
      fmPlatformGuidance1.SetFocusedPlatform(TT3DetectedTrack(focusedTrack).TrackObject as TT3PlatformInstance)
    else if focusedTrack is TT3PlatformInstance then
      fmPlatformGuidance1.focused_platform := focusedTrack;
  end;


  fmPlatformGuidance1.sbTrackToOutrunClick(Sender);

end; }

procedure TfrmTacticalDisplay.fmPlatformGuidance1Short1Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.Short1Click(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1SpeedButton2Click
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then
      begin
        fmPlatformGuidance1.SetFocusedPlatform(TT3DetectedTrack(focusedTrack).TrackObject as TT3PlatformInstance);
      end
      else if focusedTrack is TT3PlatformInstance then
      begin
        fmPlatformGuidance1.focused_platform := focusedTrack;
      end;

      fmPlatformGuidance1.PanelPlatformGuidance.Enabled := True;
      fmPlatformGuidance1.SpeedButton2Click(Sender);
    end
    else
    begin
      fmPlatformGuidance1.PanelPlatformGuidance.Enabled := False;
    end;
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1VeryLong1Click(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.VeryLong1Click(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1whHeadingChange
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmPlatformGuidance1.whHeadingChange(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmPlatformGuidance1whHeadingPersonelChange(
  Sender: TObject);
begin
  if Assigned(Sender) then
  begin
    fmPlatformGuidance1.whHeadingPersonelChange(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmSensor1btnIFFInterrogatorTrackSearchClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3DetectedTrack then
        fmSensor1.SetFocusedPlatform(TT3DetectedTrack(focusedTrack).TrackObject as TT3PlatformInstance)
      else if focusedTrack is TT3PlatformInstance then
        fmSensor1.focused_platform := focusedTrack;
    end;

    fmSensor1.btnIFFInterrogatorTrackSearchClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmSensor1cbbtnIFFInterrogatorMode1Click
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmSensor1.OnIFFCheckedClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmSensor1edtIFFInterrogatorMode1KeyPress
  (Sender: TObject; var Key: Char);
begin
  if Assigned(Sender)then
  begin
    fmSensor1.edtInterrogatorOnKeyPress(Sender, Key);
  end;
end;

procedure TfrmTacticalDisplay.fmSensor1sbESMSensorControlModeOnClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmSensor1.sbESMSensorControlModeClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmSensor1sbESMSensorDisplayBlindZoneHideClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmSensor1.sbESMSensorControlModeClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmSensor1sbIFFInterrogatorControlModeOffClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmSensor1.btnIFFOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmSensor1sbIFFInterrogatorControlModeOnClick
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmSensor1.btnIFFOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmSensor1sbIFFTransponderControlModeOffClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmSensor1.btnIFFOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmSensor1sbIFFTransponderControlModeOnClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmSensor1.btnIFFOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnAcousticTorpedoLaunchClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.btnAcousticTorpedoOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnAddHybridMissileTargetAimpointClick(
  Sender: TObject);
begin
  fmWeapon1.OnHybridMissileClick(Sender);

end;

procedure TfrmTacticalDisplay.fmWeapon1btnAirDroppesTargetTrackClick
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if (Sender is TSpeedButton) and (TSpeedButton(Sender).Tag = 5) then
      SetWeaponTargetObject(focusedTrack);

    fmWeapon1.btnAirDroppedTorpedoOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnBombDisplayRangeShowClick(
  Sender: TObject);
begin
  fmWeapon1.btnBombOnClick(Sender);

end;

procedure TfrmTacticalDisplay.fmWeapon1btnBombTargetClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if (Sender is TSpeedButton) and (TSpeedButton(Sender).Tag = 1) then
      SetWeaponTargetObject(focusedTrack);

    fmWeapon1.btnBombOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnCIWSTargetTrackClick(Sender: TObject);
begin
  if (Sender is TSpeedButton) then
    SetWeaponTargetObject(focusedTrack);
end;

procedure TfrmTacticalDisplay.fmWeapon1btnDefaultAirDroppedSearchDepthClick
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if (Sender is TSpeedButton) and (TSpeedButton(Sender).Tag = 5) then
      SetWeaponTargetObject(focusedTrack);

    fmWeapon1.btnAirDroppedTorpedoOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnLaunchAPGClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.btnActivePasiveTorpedoOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnlWireGuidedTorpedoTargetTrackClick
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if (Sender is TSpeedButton) and (TSpeedButton(Sender).Tag = 1) then
      SetWeaponTargetObject(focusedTrack);

    fmWeapon1.btnWireGuidedTorpedoOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnMinesDeployClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.btnMinesDeployClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnPositionClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.btnPositionClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnStraightRunningTorpedosLaunchClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.btnStraightTorpedoOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnSurfaceToAirTargetTrackClick
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if (Sender is TSpeedButton) and (TSpeedButton(Sender).Tag = 5) then
      SetWeaponTargetObject(focusedTrack);

    fmWeapon1.btnSurfaceToAirOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnSurfaceToSurfaceMissileLauncherMoreClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.btnSurfaceToSurfaceMissileLauncherMoreClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.
  fmWeapon1btnSurfaceToSurfaceMissileTargetTrackClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if (Sender is TSpeedButton) and (TSpeedButton(Sender).Tag = 3) then
      SetWeaponTargetObject(focusedTrack);

    fmWeapon1.btnSurfaceToSurfaceClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.
  fmWeapon1btnSurfaceToSurfaceMissileTargetTrackDetailsClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.btnSurfaceToSurfaceMissileTargetTrackDetailsClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnTacticalMissileTargetTrackClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    SetWeaponTargetObject(focusedTrack);
    fmWeapon1.btnTacticalMissileTargetTrackClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnTargetSearchClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if not IsFireControlActivated then
    begin
      pnlStatusRed.Caption := 'FCR have to be ON';
      Exit;
    end;

    if (Sender is TSpeedButton) and (TSpeedButton(Sender).Tag = 10) then
    begin
      SetWeaponTargetObject(focusedTrack);
      SetFCTargetObjectobj(focusedTrack);
    end
    else if (Sender is TButton) and (TButton(Sender).Tag = 1) then
      ObjectAssignedByGun := fmWeapon1.focused_platform
    else
      ObjectAssignedByGun := nil;

    fmWeapon1.btnGunControlClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btntControlGyroAdvisedClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.btnAcousticTorpedoOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnWakeHomingTargetTrackClick
  (Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if (Sender is TSpeedButton) and (TSpeedButton(Sender).Tag = 1) then
      SetWeaponTargetObject(focusedTrack);

    fmWeapon1.btnWakeHomingTorpedoOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnWeaponClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.btnWeaponClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1btnWGLaunchClick(Sender: TObject);
begin
  fmWeapon1.btnWireGuidedTorpedoOnClick(Sender);

end;

procedure TfrmTacticalDisplay.fmWeapon1pnlLaunch1Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.pnlLaunch1Click(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1pnlLaunch2Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.pnlLaunch1Click(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1pnlLaunch3Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.pnlLaunch1Click(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1pnlLaunch4Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.pnlLaunch1Click(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1pnlLaunch5Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.pnlLaunch1Click(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1pnlLaunch6Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.pnlLaunch1Click(Sender);
  end;

end;

procedure TfrmTacticalDisplay.fmWeapon1pnlLaunch7Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.pnlLaunch1Click(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1pnlLaunch8Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.pnlLaunch1Click(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1sbChaffBlindZoneShowClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.btnChaffClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.
  fmWeapon1sbStraightRunningTorpedosDisplayRangeShowClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if (Sender is TSpeedButton) and (TSpeedButton(Sender).Tag = 5) then
      SetWeaponTargetObject(focusedTrack);

    fmWeapon1.btnStraightTorpedoOnClick(Sender);
  end;
end;

procedure TfrmTacticalDisplay.fmWeapon1SpeedButton2Click(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmWeapon1.SpeedButton2Click(Sender);
  end;
end;

procedure TfrmTacticalDisplay.MapViewChanged(Sender: TObject);
var
  i : Integer;
  z, zCapt, LT_Long, LT_Latt, BR_Long, BR_Latt, cX, cY : double;
  sX, sY : Single;
  ltPoint, rbPoint : TPoint;
begin
  z := FixMapZoom(Map1.Zoom);

  sX := 0;
  sY := 0;

  zCapt := 0.5 * z;
  cbSetScale.Text := FloatToStr(zCapt);
  cbSetScale2D.Text := FloatToStr(zCapt);

  if simMgrClient.iswasdal then
    if Assigned(frmTop) then
      frmTop.cbSetScale.Text := FloatToStr(zCapt);

  lblRangeScale.Caption := cbSetScale.Text;

  i := FindClosestZoomIndex(zCapt);

  btnIncreaseScale.Enabled := i > 0;
  btnDecreaseScale.Enabled := i < CMax_Z;

  if btnFilterRangeRings.Down or btnFilterRangeRings2D.Down then
  begin
    i := FindClosestZoomIndex(zCapt);
    z := ZoomIndexToScale(i);
    simMgrClient.RangeRing.Interval := 0.25 * z;
  end;

  //Draw Rectangle on Minimap
  simMgrClient.Converter.ConvertToMap(Map1.Left, Map1.Top, LT_Long, LT_Latt);
  simMgrClient.Converter.ConvertToMap(Map1.Width, Map1.Height, BR_Long, BR_Latt);
  cX := Map1.CenterX;
  cY := Map1.CenterY;

  if Map1.Zoom <= 128 then
  begin
//    MiniMap.ConvertCoord(sX, sY, cX, cY, miMapToScreen);
    ltPoint := Point(Round(sX)- 4, Round(sY) - 3);
    rbPoint := Point(Round(sX) + 4, Round(sY) + 3);
  end
  else
  begin
//    MiniMap.ConvertCoord(sX, sY, LT_Long, LT_Latt, miMapToScreen);
    ltPoint := Point(Round(sX), Round(sY));
//    MiniMap.ConvertCoord(sX, sY, BR_Long, BR_Latt, miMapToScreen);
    rbPoint := Point(Round(sX), Round(sY));
  end;

  FMinimapFocusRect.TopLeft := ltPoint;
  FMinimapFocusRect.BottomRight := rbPoint;

//  MiniMap.Top := Map1.Top + (Map1.Height - MiniMap.Height);
//  MiniMap.Left := Map1.Left + (Map1.Width - MiniMap.Width);
//  MiniMap.Repaint;

  // Check MapViewChange

  simMgrClient.lastZoom := Map1.Zoom;
  simMgrClient.MapCenter_X := Map1.CenterX;
  simMgrClient.MapCenter_Y := Map1.CenterY;

  {tidak memakai pilihan map}
//  if btnAirMap.Down then
//    simMgrClient.ChangeMap(1);

//  if btnLandMap.Down then
//    simMgrClient.ChangeMap(2);
//
//  if btnSeaMap.Down then
//    simMgrClient.ChangeMap(3);
end;

procedure TfrmTacticalDisplay.MErge1Click(Sender: TObject);
begin
  if not Assigned(esmSelected) then
    exit;

  if not Assigned(frmMergeTracks) then
    frmMergeTracks := TfrmMergeTracks.Create(self);

  if Assigned(esmSelected) then
    frmMergeTracks.ControlledTrack := esmSelected
  else if Assigned(focusedTrack) then
  begin
    if focusedTrack is TT3DetectedTrack then
      frmMergeTracks.ControlledTrack := focusedTrack;
  end;

  frmMergeTracks.Show;
end;

procedure TfrmTacticalDisplay.MinimapDrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull,
  RectInvalid: IDispatch);
begin
//  with MiniMap.MiniCanvas do
//  begin
//    Handle := hOutputDC;
//
//    Pen.Color := clRed;
//    Pen.Style := psSolid;
//    Pen.Width := 2;
//    Brush.Style := bsClear;
//
//    Rectangle(FMinimapFocusRect);
//
//    Pen.Color := clBlack;
//    Pen.Width := 4;
//    Rectangle(0, 0, MiniMap.Width, MiniMap.Height);
//  end;
end;

procedure TfrmTacticalDisplay.miPlottingDeleteClick(Sender: TObject);
begin
//  frmStrategiEditor.SelectTemplate;
//  frmStrategiEditor.btnDelete.Click;
end;

procedure TfrmTacticalDisplay.miPlottingEditClick(Sender: TObject);
begin
//  frmStrategiEditor.SelectTemplate;
//  frmStrategiEditor.btnEdit.Click;
end;

procedure TfrmTacticalDisplay.miPlottingNewClick(Sender: TObject);
begin
  frmStrategiEditor.Show;
  frmStrategiEditor.btnNew.Click;
end;

procedure TfrmTacticalDisplay.miPlottingShowClick(Sender: TObject);
begin
//  frmStrategiEditor.SelectTemplate;
  frmStrategiEditor.ShowPropTemplate;
end;

procedure TfrmTacticalDisplay.miSHowBaseClick(Sender: TObject);
begin
  simMgrClient.SimPlatformBase.ShowBase;
end;

procedure TfrmTacticalDisplay.mniAdd1Click(Sender: TObject);
begin
  btnAddToTrackTableClick(Self);
end;

procedure TfrmTacticalDisplay.mniAir1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdAir, nrpPoint, pciAir, piPending);
end;

procedure TfrmTacticalDisplay.mniAir2Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdAir, nrpBearing, pciSubSurface, piPending);
end;

procedure TfrmTacticalDisplay.mniAir3Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdAir, nrpArea, pciAir, piPending);
end;

procedure TfrmTacticalDisplay.mniAir4Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, vhdAir, -1, -1);
end;

procedure TfrmTacticalDisplay.mniAirborneEarlyWarning1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdAir, nrpSpecial, pciAirborneEarlyWarning, piPending);
end;

procedure TfrmTacticalDisplay.mniAircraftCarrier1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtAirCarrier);
end;

procedure TfrmTacticalDisplay.mniAirGeneral1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdAir, nrpSpecial, pciAir, piPending);
end;

procedure TfrmTacticalDisplay.mniAmphibius1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtAmphibious);
end;

procedure TfrmTacticalDisplay.mniAnchor1Click(Sender: TObject);
begin
  btnAnchorCursorClick(self);
end;

procedure TfrmTacticalDisplay.mniAssumedFriend1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, piAssumedFriend, -1);
end;

procedure TfrmTacticalDisplay.mniASWGeneral1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdSurface, nrpSpecial, pciAswGeneral, piPending);
end;

procedure TfrmTacticalDisplay.mniAutomatic1Click(Sender: TObject);
var
  rec : TRecCmd_Platform_CHANGE_TRACKNUMBER;
begin
  if focusedTrack = nil then   //mk
    exit;

  rec.PlatfomID := TT3DetectedTrack(focusedTrack).TrackObject.InstanceIndex;
  rec.TrackID   := TT3DetectedTrack(focusedTrack).TrackNumber;
  rec.newTrackNumber := 0;
  //ShowMessage('new track ' + IntToStr(rec.newTrackNumber) + 'text' + edtNewTrackNumber.Text);
  simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
end;

procedure TfrmTacticalDisplay.mniAuxiliary1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtAuxiliary);
end;

procedure TfrmTacticalDisplay.mniBouy1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciBuoy, piPending);
end;

procedure TfrmTacticalDisplay.mniBriefContact1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdSurface, nrpSpecial, pciBriefContact, piPending );
end;

procedure TfrmTacticalDisplay.mniBullseye1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdAir, nrpSpecial, pciBullseye, piPending);
end;

procedure TfrmTacticalDisplay.mniCentre1Click(Sender: TObject);
begin
  btnCentreOnHookClick(self);
end;

procedure TfrmTacticalDisplay.mniChaff1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtOther);
end;

procedure TfrmTacticalDisplay.mniChangeCourse1Click(Sender: TObject);
var
  value : string;
  newCourse : Integer;
begin

  repeat
    value := InputBox('Change Course', 'New Course: ', '0');
  until value <> '';

  try
    newCourse := StrToInt(value);

    if newCourse > 360 then
      newCourse := 360
    else if newCourse < 0 then
      newCourse := 0;

    if Assigned(focusedTrack) then
    begin
      if focusedTrack is TT3PlatformInstance then
      begin
        if focusedTrack is TT3Vehicle then
        begin

          SimMgrClient.netSend_CmdPlatform(TT3Vehicle(focusedTrack).InstanceIndex, CORD_ID_MOVE,
                                                CORD_SET_HEADING, newCourse);

        end;

      end;
    end;

  except
    on E : Exception do
      MessageDlg('invalid course!!',mtError, mbOKCancel, 0);
  end;


end;

procedure TfrmTacticalDisplay.mniCombatAirPatrol1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdAir, nrpSpecial, pciCombatAirPatrol, piPending);
end;

procedure TfrmTacticalDisplay.mniCruiserGuidedMissileCGCGN1Click
  (Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtCruiseGuided);
end;

procedure TfrmTacticalDisplay.mniDatalinkReferencePoint1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciDataLinkReferencePoint, piPending);
end;

procedure TfrmTacticalDisplay.mniDatum1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdSurface, nrpSpecial, pciDatum, piPending);
end;

procedure TfrmTacticalDisplay.mniDeleteClick(Sender: TObject);
begin
  fmOverlayEditor.Deleted;
//  fmOverlayEditor.btnSelect.Click;
end;

procedure TfrmTacticalDisplay.mniDepthClick(Sender: TObject);
var
  aObject : TSimObject;
begin
  if not Assigned(focusedTrack) then
    Exit;

  if not Assigned(fChangeSonobuoyDepth) then
    fChangeSonobuoyDepth := TfChangeSonobuoyDepth.Create(self);

  aObject := focusedTrack;
  if aObject is TT3PlatformInstance then
  begin
    fChangeSonobuoyDepth.lbtrack.Caption    := TT3PlatformInstance(aObject).Track_ID;
    fChangeSonobuoyDepth.lbDepth.Caption    := FormatAltitude(TT3PlatformInstance(aObject).Altitude);
    fChangeSonobuoyDepth.Label1.Caption     := IntToStr(TT3PlatformInstance(aObject).InstanceIndex);
    fChangeSonobuoyDepth.edtNewDepth.Text   := '';
  end
  else if aObject is TT3DetectedTrack then
  begin
    fChangeSonobuoyDepth.lbtrack.Caption := IntToStr(TT3DetectedTrack(aObject).TrackNumber);
    fChangeSonobuoyDepth.lbDepth.Caption := '---';
    fChangeSonobuoyDepth.edtNewDepth.Text   := '';
  end;

  fChangeSonobuoyDepth.Show;
end;

procedure TfrmTacticalDisplay.mniDesse1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciDistressedVessel, piPending);
end;

procedure TfrmTacticalDisplay.mniDestroyer1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtDestroyer);
end;

procedure TfrmTacticalDisplay.mniDestroyerGuidedMissle1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtDestroGuided);
end;

procedure TfrmTacticalDisplay.mniDimensionClick(Sender: TObject);
begin
  {Check menu item}
  mniDimension.Checked := True;
  DimensionMenBar.Checked := True;

  {Uncheck menu item}
  mniDinamicSymbol.Checked := False;
  mniStaticSymbol.Checked  := False;
  DynamicviewMenBar.Checked := False;
  StatciviewMenBar.Checked := False;

  simMgrClient.PlatformViewMode := True;
  simMgrClient.TacticalDinamicSymbol := False;
  simMgrClient.TacticalStaticSymbol := False;
end;

procedure TfrmTacticalDisplay.mniStaticSymbolClick(Sender: TObject);
begin
  {Check menu item}
  mniStaticSymbol.Checked := True;
  StatciviewMenBar.Checked := True;

  {Uncheck menu item}
  mniDimension.Checked := False;
  mniDinamicSymbol.Checked := False;
  DynamicviewMenBar.Checked := False;
  DimensionMenBar.Checked := False;

  {Set setting}
  simMgrClient.TacticalDinamicSymbol := False;
  simMgrClient.TacticalStaticSymbol := True;
  simMgrClient.PlatformViewMode := False;
end;

procedure TfrmTacticalDisplay.mniDitchedAircraft1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdAir, nrpSpecial, pciDitchedAirCraft, piPending);
end;

//procedure TfrmTacticalDisplay.mniEdit1Click(Sender: TObject);
//begin
//  if focusedTrack = nil then exit;
//
//  if (focusedTrack is TT3NonRealVehicle) then
//  begin
//    if not Assigned(frmEditNonRealTimeTrack) then     //dng > set condition to show frmEditNonRealTimeTrack
//      frmEditNonRealTimeTrack := frmEditNonRealTimeTrack.Create(self);
//
//    frmEditNonRealTimeTrack.Data := focusedTrack as TT3NonRealVehicle;
//    frmEditNonRealTimeTrack.Show;
//  end                                                 //
//  else if (focusedTrack is TT3DetectedTrack) then
//  begin
//    if not Assigned(frmEditRealTimeTrack) then
//      frmEditRealTimeTrack := TfrmEditRealTimeTrack.Create(self);
//
//    frmEditRealTimeTrack.Data := focusedTrack as TT3DetectedTrack;         //mk
//    frmEditRealTimeTrack.Show;
//  end
//  else if focusedTrack is TT3ESMTrack then
//  begin
//    if not Assigned(frmEditRealTimeTrack) then
//      frmEditRealTimeTrack := TfrmEditRealTimeTrack.Create(self);
//
//    frmEditRealTimeTrack.Data := focusedTrack as TT3ESMTrack;
//    frmEditRealTimeTrack.Show;
//  end
//  else if (focusedTrack is TT3Vehicle) then
//  begin
//    if not Assigned(frmEditRealTimeTrack) then
//      frmEditRealTimeTrack := TfrmEditRealTimeTrack.Create(self);
//
//    frmEditRealTimeTrack.Data := focusedTrack as TT3Vehicle;
//    frmEditRealTimeTrack.Show;
//  end;
//end;

procedure TfrmTacticalDisplay.mniEnduranceClick(Sender: TObject);
var
  aObject : TSimObject;
begin
  if not Assigned(focusedTrack) then
    Exit;

  if not Assigned(fChangeSonobuoyEndurance) then
    fChangeSonobuoyEndurance := TfChangeSonobuoyEndurance.Create(self);

  aObject := focusedTrack;
  if aObject is TT3PlatformInstance then
  begin
    fChangeSonobuoyEndurance.lbEnduranceTrack.Caption    := TT3PlatformInstance(aObject).Track_ID;
    fChangeSonobuoyEndurance.lbEnduranceCurrent.Caption  := IntToStr(TT3Sonobuoy(TT3PlatformInstance(aObject)).OrderEndurance);
    fChangeSonobuoyEndurance.lbIndex.Caption             := IntToStr(TT3PlatformInstance(aObject).InstanceIndex)
  end
  else if aObject is TT3DetectedTrack then
  begin
    fChangeSonobuoyEndurance.lbEnduranceTrack.Caption := IntToStr(TT3DetectedTrack(aObject).TrackNumber);
  end;

  fChangeSonobuoyEndurance.Show;
end;

procedure TfrmTacticalDisplay.mniESM1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciEsmEcmFix, piPending);
end;

procedure TfrmTacticalDisplay.mniFriend1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, piFriend, -1);
end;

procedure TfrmTacticalDisplay.mniFrigateFF1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtFrigate);
end;

procedure TfrmTacticalDisplay.mniFrigateGuidedMissleFFG1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtFrigatGuided);
end;

procedure TfrmTacticalDisplay.mniGate1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdAir, nrpSpecial, pciGate, piPending);
end;

procedure TfrmTacticalDisplay.mniGeneral1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpBearing, pciSubSurface, piPending);
end;

procedure TfrmTacticalDisplay.mniGeneral2Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciGeneral, piPending);
end;

procedure TfrmTacticalDisplay.mniGeneral4Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, vhdGeneral, -1, -1);
end;

procedure TfrmTacticalDisplay.mniGroundZero1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciGroundZero, piPending);
end;

procedure TfrmTacticalDisplay.mniHostile1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, piHostile, -1);
end;

procedure TfrmTacticalDisplay.mniInfra1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtOther);
end;

procedure TfrmTacticalDisplay.mniJammerDecoy1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtOther);
end;

procedure TfrmTacticalDisplay.mniKingpin1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdSurface, nrpSpecial, pciKingpin, piPending);
end;

procedure TfrmTacticalDisplay.mniLand1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdLand, nrpPoint, pciLand, piPending);
end;

procedure TfrmTacticalDisplay.mniLand2Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdLand, nrpBearing, pciSubSurface, piPending);
end;

procedure TfrmTacticalDisplay.mniLand3Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdLand, nrpArea, pciLand, piPending);
end;

procedure TfrmTacticalDisplay.mniLand4Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, vhdLand, -1, -1);
end;

procedure TfrmTacticalDisplay.mniMainwarfare1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtOther);
end;

procedure TfrmTacticalDisplay.mniManInWater1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciManInWater, piPending);
end;

procedure TfrmTacticalDisplay.mniManual1Click(Sender: TObject);
begin
  if not(focusedTrack is TT3DetectedTrack) And not (focusedTrack.Equals(esmSelected)) and not (focusedTrack is TT3NonRealVehicle) then
    Exit;

  if not Assigned(frmChangeTrackNumber) then
    frmChangeTrackNumber := TfrmChangeTrackNumber.Create(self);

  frmChangeTrackNumber.Data := focusedTrack;
  frmChangeTrackNumber.Show;
end;

procedure TfrmTacticalDisplay.mniMaritimeHeadquarter1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciMaritimeHeadquarters, piPending);
end;

procedure TfrmTacticalDisplay.mniMerchant1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtMerchant);
end;

procedure TfrmTacticalDisplay.mniMerge1Click(Sender: TObject);
begin
  if not Assigned(esmSelected) then
    exit;

  if not Assigned(frmMergeTracks) then
    frmMergeTracks := TfrmMergeTracks.Create(self);

  if Assigned(esmSelected) then
    frmMergeTracks.ControlledTrack := esmSelected
  else if Assigned(focusedTrack) then
  begin
    if focusedTrack is TT3DetectedTrack then
      frmMergeTracks.ControlledTrack := focusedTrack;
  end;

  frmMergeTracks.Show;
end;

procedure TfrmTacticalDisplay.mniMineHazard1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciMine, piPending);
end;

procedure TfrmTacticalDisplay.mniNavigationalHazard1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciNavigationHazard, piPending);
end;

procedure TfrmTacticalDisplay.mniNeutral1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, piNeutral, -1);
end;

procedure TfrmTacticalDisplay.mniOilRig1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciOilRig, piPending );
end;

procedure TfrmTacticalDisplay.mniOther1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtOther);
end;

procedure TfrmTacticalDisplay.mniPatrolCraftPTPTG1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtPatrolCraft);
end;

procedure TfrmTacticalDisplay.mniPending1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, piPending, -1);
end;

procedure TfrmTacticalDisplay.mniPrintCurrentMap1Click(Sender: TObject);
var
  PixelsX, PixelsY: integer;
  LeftSpace, TopSpace: integer;
  R: TRect;
begin
  with dlgPnt1 do
  begin
    if execute then
    begin
      pnlTop.Visible := False;
      pnlBottom.Visible := False;
      pnlLeft.Visible := False;

      File1.Visible := False;
      Game1.Visible := False;
      View1.Visible := False;
      Map.Visible := False;
      Hook1.Visible := False;
      Tools1.Visible := False;
      Track1.Visible := False;
      Help1.Visible := False;

//karena alClient margin tidak bisa di set ulang
//      {get pixels per inch}
//      PixelsX := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
//      PixelsY := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
//      {get non-printable margins}
//      LeftSpace := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETX);
//      TopSpace := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETY);
//      {1' margin all around}
//      R.Left := Round(PixelsX * 1) - LeftSpace;
//      R.Right := Round(PixelsX * 7.5) - LeftSpace;
//      R.Top := Round(PixelsY * 1) - TopSpace;
//      R.Bottom := Round(PixelsY * 10) - TopSpace;

//      Map1.BoundsRect := R;
//      frmTacticalDisplay.BoundsRect := R;

      printer.Title := frmTacticalDisplay.Caption;
      Printer.Orientation := poLandscape;
      PrintScale := poPrintToFit;

      Print;
    end;
  end;

  pnlTop.Visible := True;
  pnlBottom.Visible := True;
  pnlLeft.Visible := True;

  File1.Visible := True;
  Game1.Visible := True;
  View1.Visible := True;
  Map.Visible := True;
  Hook1.Visible := True;
  Tools1.Visible := True;
  Track1.Visible := True;
  Help1.Visible := True;
end;

procedure TfrmTacticalDisplay.mniRangeRing1Click(Sender: TObject);
begin
  btnRangeRingsOnHookClick(Self);
end;

procedure TfrmTacticalDisplay.mniReleasePlatform1Click(Sender: TObject);
var
  rec : TRec_ControlledShip;
  v : TT3Vehicle;
begin
  v := TT3Vehicle(focusedTrack);
  if AnsiCompareStr(v.Vehicle_Control.Control_Name, simMgrClient.ConsoleName) = 0 then
  begin
    if v.Vehicle_Control.Controlled then
    begin
      rec.PlatformID := v.InstanceIndex;
      rec.Controlled := False;
      rec.ControlledName := '';
      simMgrClient.netSend_cmd_ControlledShip(rec);
    end;
  end;
end;

procedure TfrmTacticalDisplay.mniRemove1Click(Sender: TObject);
begin
  btnRemovePlatformOrTrackClick(self);
end;

procedure TfrmTacticalDisplay.mniRemove2Click(Sender: TObject);
begin
  btnRemoveFromTrackTableClick(Self);
end;

procedure TfrmTacticalDisplay.mniRiser1Click(Sender: TObject);
begin
  // LaunchNRPSpecialPlatform(vhdSurface, pctRiser);
  LaunchNRPPlatformObserve(vhdSurface, nrpSpecial, pciRiser, piPending);
end;

procedure TfrmTacticalDisplay.mniSavescenario1Click(Sender: TObject);
var
  i, X, Y : Integer;
  pi : TT3PlatformInstance;
  Long, Lat, course: double;
begin
  for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
  begin
    pi := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;
    if pi.UnitActivation.Platform_Event_Index <> 0 then
    begin
      simMgrClient.Converter.ConvertToScreen(pi.PosX, pi.PosY, X, Y);
      Long := pi.getPositionX;
      Lat := pi.getPositionY;
      course := pi.Course;
      dmTTT.UpdatePlatformActClient(lat, long, Course, pi.Altitude, X, Y, Pi.UnitActivation.Platform_Event_Index);
    end;
  end;
  ShowMessage('Scenario has been saved');
end;

procedure TfrmTacticalDisplay.mniSaveScenarioAs1Click(Sender: TObject);
var
  i, j, k, X, Y  : integer;
  SceName : string;
  recRA, recRAOverlay, recRAPlotting: TResource_Allocation;
  recRPL: TRuntime_Platform_Library;
  recGE : TGame_Environment_Definition;
  recPI : TPlatform_Instance;
  recSD : TScenario_Definition;
  Deployment : TAsset_Deployment;
  TempID : array of array of Integer;
  idArray, idNewPlatform : Integer;
  pi : TT3PlatformInstance;
  grp : T3CubicleGroup;
  recCubGroup : TCubicle_Group;
  recCubGroupAssg : TCubicle_Group_Assignment;
  grm : T3CubicleGroupMember;
  IDGroup : integer;
  isPiIdMatch : Boolean;
begin
  repeat
    if not inputquery('Save as scenario', 'Please type your new scenario name', SceName)then
    begin
      ShowMessage('User cancelled the dialog');
      exit;
    end;
  until SceName <> '';

  j := 0;
  for i := 1 to Length(SceName) do
  begin
    if SceName[i] in ['\', '/', '.', '"', ':','*','?','<','>','|'] then
      j := j + 1;
  end;
  if j = 0 then
  begin
    if dmTTT.CekScenarioNameAlreadyExist(SceName) then
    begin
      MessageDlg('The name of Scenario is already exist, Please choose another name.',mtError,mbOKCancel,0);
      Exit;
    end;
  end
  else
  begin
    ShowMessage('The name must not contain any of the following character: '+
     #13 +'\/ . " : * ? < > | .');
    Exit;
  end;

//======================CAME ENVIRONMENT========================================
  recGE := TGame_Environment_Definition.Create;
  recGE := simMgrClient.Scenario.GameEnvironment;
  recGE.FData.Game_Enviro_Identifier := SceName;
  dmTTT.insertGame_Environment_Def(recGE);


//======================RESOURCE ALOCATION======================================
  recRA := TResource_Allocation.Create;
  recRA := simMgrClient.Scenario.ResourceAllocation;
  recRA.FData.Allocation_Identifier := SceName;
  recRA.FData.Game_Enviro_Index := recGE.FData.Game_Enviro_Index;
  dmTTT.insertResource(recRA);

//======================OVERLAY=================================================
  recRAOverlay := TResource_Allocation.Create;
  for I := 0 to simMgrClient.Scenario.OverlayListFromDB.Count - 1 do
  begin
    recRAOverlay := TResource_Allocation(simMgrClient.Scenario.OverlayListFromDB.Items[i]);
    recRAOverlay.FData.Resource_Alloc_Index := recRA.FData.Resource_Alloc_Index;
    dmTTT.insert_Resource_Overlay_Mapping(recRAOverlay);
  end;

//======================PLOTTING================================================
  recRAPlotting := TResource_Allocation.Create;
  for I := 0 to simMgrClient.Scenario.PlottingListFromDB.Count - 1 do
  begin
    recRAPlotting := TResource_Allocation(simMgrClient.Scenario.PlottingListFromDB.Items[i]);
    recRAPlotting.FPlotting.Resource_Alloc_Index := recRA.FData.Resource_Alloc_Index;
    dmTTT.InsertPlottingMapping(recRAPlotting);
  end;

//======================RUNTIME PLATFORM LIBRARY================================
  recRPL := TRuntime_Platform_Library.Create;
  for I := 0 to simMgrClient.Scenario.RPLListFromDB.Count - 1 do
  begin
    recRPL := TRuntime_Platform_Library(simMgrClient.Scenario.RPLListFromDB.Items[i]);
    dmTTT.InsertRuntime_Platform_LibraryByResourceAlloc(IntToStr(recRA.FData.Resource_Alloc_Index), recRPL);
  end;

//======================PLATFORM INSTANCE=======================================
  recPI := TPlatform_Instance.Create;
  for I := 0 to simMgrClient.Scenario.PlatformInstanceListFromDB.Count - 1 do
  begin
    SetLength(TempID, simMgrClient.Scenario.PlatformInstanceListFromDB.Count, 2);
    recPI := TPlatform_Instance(simMgrClient.Scenario.PlatformInstanceListFromDB.Items[i]);
    TempID[i , 0] := recPI.FData.Platform_Instance_Index;
    recPI.FData.Resource_Alloc_Index := recRA.FData.Resource_Alloc_Index;
    idNewPlatform := dmTTT.insertPlatformInstance(recPI,1);
    TempID[i , 1] := idNewPlatform;
  end;

//======================SCENARIO================================================
  recSD := TScenario_Definition.Create;
  recSD := simMgrClient.Scenario.ScenarioDefinition;
  recSD.FData.Resource_Alloc_Index := recRA.FData.Resource_Alloc_Index;
  recSD.FData.Scenario_Identifier := SceName;
  recSD.FData.Scenario_Code := 0;
  dmTTT.insertScenario(recSD);

  Deployment := TAsset_Deployment.Create;
  dmTTT.GetAssetDeployment(recSD.FData.Scenario_Index, Deployment);


//======================PLATFORM ACTIVATION=====================================
  recPI := TPlatform_Instance.Create;
  for I := 0 to simMgrClient.Scenario.PlatformInstanceListFromDB.Count - 1 do
  begin
    recPI := TPlatform_Instance(simMgrClient.Scenario.PlatformInstanceListFromDB.Items[i]);
    recPI.FActivation.Deployment_Index := Deployment.FData.Deployment_Index;
    for j := 0 to simMgrClient.Scenario.PlatformInstanceListFromDB.Count - 1 do
    begin
      if recPI.FData.Platform_Instance_Index = TempID[j,0] then
      begin
        idArray := j;
        Break;
      end;
    end;
    recPI.FActivation.Platform_Instance_Index := TempID[idArray,1];

    //ini digunakan untuk mendapatkan posisi terakhir platform
    for j := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
    begin
      pi := simMgrClient.SimPlatforms.getObject(j) as TT3PlatformInstance;
      if pi.InstanceIndex = recPI.FData.Platform_Instance_Index then
      begin
        simMgrClient.Converter.ConvertToScreen(pi.PosX, pi.PosY, X, Y);
        recPI.FActivation.Init_Position_Longitude := pi.getPositionX;
        recPI.FActivation.Init_Position_Latitude := pi.getPositionY;
        recPI.FActivation.Init_Course := pi.Course;
        recPI.FActivation.Init_Position_Cartesian_X := X;
        recPI.FActivation.Init_Position_Cartesian_Y := Y;
        recPI.FActivation.Init_Altitude := pi.Altitude;
        break;
      end;
    end;
    dmTTT.InsertPlatform_Activation(recPI);
  end;


//======================GROUP===================================================
  recCubGroup := TCubicle_Group.Create;
  for I := 0 to simMgrClient.Scenario.CubiclesGroupsListFromDB.Count - 1 do
  begin
    grp  := simMgrClient.Scenario.CubiclesGroupsListFromDB.Items[i] as T3CubicleGroup;
    if grp <> nil then
    begin
      dmTTT.GetT3GroupMember(grp.FData.Group_Index, grp.FSList);
      if grp.Count > 0 then
      begin
        grp.FData.Deployment_Index := Deployment.FData.Deployment_Index;
        with recCubGroup.FData do
        begin
          Group_Index        := grp.FData.Group_Index;
          Deployment_Index   := Deployment.FData.Deployment_Index;;
          Group_Identifier   := grp.FData.Group_Identifier;
          Force_Designation  := grp.FData.Force_Designation;
          Tracks_Block       := grp.FData.Tracks_Block;
          Track_Block_Start  := grp.FData.Track_Block_Start;
          Track_Block_End    := grp.FData.Track_Block_End;
          Zulu_Zulu          := grp.FData.Zulu_Zulu;
        end;
        IDGroup := dmTTT.insertCubicle_Groups(recCubGroup);
        for j := 0 to grp.Count - 1 do
        begin
          isPiIdMatch := False;
          recCubGroupAssg := TCubicle_Group_Assignment.Create;
          grm := grp.Items[j] as T3CubicleGroupMember;
          if grm = nil then
            continue;

          for k := 0 to simMgrClient.Scenario.PlatformInstanceListFromDB.Count - 1 do
          begin
            if grm.FData.Platform_Instance_Index = TempID[k,0] then
            begin
              idArray := k;
              isPiIdMatch := True;
              Break;
            end;
          end;

          with recCubGroupAssg.FCubicle do
          begin
            if isPiIdMatch then
              Platform_Instance_Index  := TempID[idArray,1]
            else
              Platform_Instance_Index := grm.FData.Platform_Instance_Index;
            Group_Index              := IDGroup;
            Command_Priority         := grm.FData.Command_Priority;
            Deployment_Index         := Deployment.FData.Deployment_Index;
          end;
          dmTTT.InsertCubicle_Group_Assignment(recCubGroupAssg);
        end;
      end;
    end;
  end;

  ShowMessage('New scenario has been saved');
end;

procedure TfrmTacticalDisplay.mniSearchCentre1Click(Sender: TObject);
begin
  // LaunchNRPSpecialPlatform(vhdSurface, pctSearchCenter);
  LaunchNRPPlatformObserve(vhdSurface, nrpSpecial, pciSearchCenter, piPending);
end;

procedure TfrmTacticalDisplay.mniSinker1Click(Sender: TObject);
begin
  // LaunchNRPSpecialPlatform(vhdSurface, pctSinker);
  LaunchNRPPlatformObserve(vhdSurface, nrpSpecial, pciSinker, piPending);
end;

procedure TfrmTacticalDisplay.mniSplit1Click(Sender: TObject);
begin
  btnSplitClick(Self);
end;

procedure TfrmTacticalDisplay.mniDinamicSymbolClick(Sender: TObject);
begin
  {Check menu item}
  mniDinamicSymbol.Checked := True;
  DynamicviewMenBar.Checked := True;

  {Uncheck menu item}
  mniDimension.Checked := False;
  mniStaticSymbol.Checked := False;
  DimensionMenBar.Checked := False;
  StatciviewMenBar.Checked := False;

  {Set setting}
  simMgrClient.TacticalDinamicSymbol := True;
  simMgrClient.TacticalStaticSymbol := False;
  simMgrClient.PlatformViewMode := False;

  if simMgrClient.isFirstDraw then
  begin
    simMgrClient.ControlledPlatform.Selected := True;
    simMgrClient.isFirstDraw := false;
  end;

end;

procedure TfrmTacticalDisplay.mniStation1Click(Sender: TObject);
begin
  // LaunchNRPSpecialPlatform(vhdGeneral, pctStation);
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciStation, piPending);
end;

procedure TfrmTacticalDisplay.mniSubsurface1Click(Sender: TObject);
begin
  // LaunchNRPlatform(vhdSubsurface);
  LaunchNRPPlatformObserve(vhdSubsurface, nrpPoint, pciSubSurface, piPending);
end;

procedure TfrmTacticalDisplay.mniSubsurface2Click(Sender: TObject);
begin
  // LaunchNRPBearingPlatform(vhdSubsurface);
  LaunchNRPPlatformObserve(vhdSubsurface, nrpBearing, pciSubSurface, piPending);
end;

procedure TfrmTacticalDisplay.mniSubsurface3Click(Sender: TObject);
begin
  // LaunchNRPlatform(vhdSubsurface);
  LaunchNRPPlatformObserve(vhdSubsurface, nrpArea, pciSubSurface, piPending);
end;

procedure TfrmTacticalDisplay.mniSubsurface4Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, vhdSubsurface, -1, -1);
end;

procedure TfrmTacticalDisplay.LaunchNRPPlatformObserve(domain, typePoint: Integer; symbolstr: Char; id: Integer);
var
  rSend: TRecCmd_LaunchNonRP;
  dbX, dbY: double;
begin
  simMgrClient.Converter.ConvertToMap(newPoint.x, newPoint.y, dbX, dbY);

  with rSend do
  begin
    NRPPlatformID := 0;
    NewPlatformID := 0;

    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      NRPGroupID := 0
    else
      NRPGroupID := simMgrClient.FMyCubGroup.FData.Group_Index;

    TrackIdent := '-';
    TrackDomain := domain;
    Identity := id;
    InstanceName := 'Unknown';
    PointType := typePoint;
    pX := dbX;
    pY := dbY;
    pZ := 0;
    symbol := symbolstr;
    LastUpdateTime := DateTimeToStr(now);
  end;

  simMgrClient.netSend_CmdLaunchNonRP(rSend);
end;

procedure TfrmTacticalDisplay.clearPopRightClick;
begin
  mniStandardPoint1.Visible := false;
  mniNewStandardBearing1.Visible := false;
  mniNewStandard1.Visible := false;

  mniNewSpecialPointGeneral1.Visible := false;
  mniNewSpecialPointAir1.Visible := false;
  mniNewSpecialPointASW1.Visible := false;

  mniCharacteristic1.Visible := false;
  mniMerge1.Visible := False;
  mniSplit1.Visible := false;
  mniTrackNumber1.Visible := false;
  mniTrackHistory1.Visible := false;
  mniRemove1.Visible := false;

  mniDatalink1.Visible := false;
  mniIntiate1.Visible := false;
  mniBreakAllFireControl1.Visible := false;
  mniClearRing1.Visible := false;

  mniCentre1.Visible := false;
  mniRangeRing1.Visible := false;
  mniTrackTable1.Visible := false;
  mniAnchor1.Visible := false;

  mniChangeCourse1.Visible := false;
  mniReleasePlatform1.Visible := False;
  mniRamp1.Visible := False;

  N1.Visible := false;
  N2.Visible := false;
  N3.Visible := false;
  N10.Visible := false;
end;

procedure TfrmTacticalDisplay.Close1Click(Sender: TObject);
var
  rec : TRecCmd_RampController;
begin
  rec.PlatformID := TT3PlatformInstance(focusedTrack).InstanceIndex;
  rec.RampState := Byte(CORD_ID_CLOSE);

  if focusedTrack is TT3Vehicle then
    rec.RampID := TT3Vehicle(focusedTrack).VehicleDefinition.FData.GangwayPosition;

  simMgrClient.netSend_cmdRampController(rec);
end;

procedure TfrmTacticalDisplay.Contents1Click(Sender: TObject);
begin
  if not DirectoryExists('data\contents') then
          CreateDir('data\contents');
  ShellExecute(Application.Handle, 'explore', 'data\contents', nil, nil, SW_NORMAL);
end;

procedure TfrmTacticalDisplay.Open1Click(Sender: TObject);
var
  rec : TRecCmd_RampController;
begin
  rec.PlatformID := TT3PlatformInstance(focusedTrack).InstanceIndex;
  rec.RampState := Byte(CORD_ID_OPEN);

  if focusedTrack is TT3Vehicle then
    rec.RampID := TT3Vehicle(focusedTrack).VehicleDefinition.FData.GangwayPosition;

  simMgrClient.netSend_cmdRampController(rec);
end;

procedure TfrmTacticalDisplay.CreatSimMapX;
begin
  VSimMap.FMap.Parent := Self;
  VSimMap.FMap.Align := alClient;
  VSimMap.FMap.Visible := True;

  Map1 := VSimMap.FMap;
  Map1.DoubleBuffered := False;

  if not Map1.WinXP then
    RegisterTouchWindow(VSimMap.FMap.Handle, 0);
end;

procedure TfrmTacticalDisplay.mniSurface1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdSurface, nrpPoint, pciSurface, piPending);
end;

procedure TfrmTacticalDisplay.mniSurface2Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdSurface, nrpBearing, pciSubSurface, piPending);
end;

procedure TfrmTacticalDisplay.mniSurface3Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdSurface, nrpArea, pciSurface, piPending);
end;

procedure TfrmTacticalDisplay.mniSurface4Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, vhdSurface, -1, -1);
end;

procedure TfrmTacticalDisplay.mniSuspect1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, piSuspect, -1);
end;

procedure TfrmTacticalDisplay.mnitoBackClick(Sender: TObject);
begin
  fmOverlayEditor.ChangePosition(5);
end;

procedure TfrmTacticalDisplay.mnitoFrontClick(Sender: TObject);
begin
  fmOverlayEditor.ChangePosition(4);
end;

procedure TfrmTacticalDisplay.mniTorpedoCourseClick(Sender: TObject);
var
  aObject : TSimObject;
begin
  if not Assigned(focusedTrack) then
    Exit;

  if not Assigned(fChangeTorpedoCourse) then
    fChangeTorpedoCourse := TfChangeTorpedoCourse.Create(self);

  aObject := focusedTrack;
  if aObject is TT3PlatformInstance then
  begin
    fChangeTorpedoCourse.lbltrack.Caption := TT3PlatformInstance(aObject).Track_ID;
    fChangeTorpedoCourse.lblCourse.Caption := FormatCourse(TT3PlatformInstance(aObject).Course);
    fChangeTorpedoCourse.lblInstanceIndex.Caption := IntToStr(TT3PlatformInstance(aObject).InstanceIndex);
    fChangeTorpedoCourse.EdtNewCourse.Text := '';
  end;

  fChangeTorpedoCourse.Show;
end;

procedure TfrmTacticalDisplay.mniTorpedoDepthClick(Sender: TObject);
var
  aObject : TSimObject;
begin
  if not Assigned(focusedTrack) then
    Exit;

  if not Assigned(fChangeTorpedoDepth) then
    fChangeTorpedoDepth := TfChangeTorpedoDepth.Create(self);

  aObject := focusedTrack;
  if aObject is TT3PlatformInstance then
  begin
    fChangeTorpedoDepth.lbltrack.Caption := TT3PlatformInstance(aObject).Track_ID;
    fChangeTorpedoDepth.lblDepth.Caption := FormatAltitude(TT3PlatformInstance(aObject).Altitude);
    fChangeTorpedoDepth.lblInstanceIndex.Caption := IntToStr(TT3PlatformInstance(aObject).InstanceIndex);
    fChangeTorpedoDepth.EdtNewDepth.Text := '';
  end;

  fChangeTorpedoDepth.Show;
end;

procedure TfrmTacticalDisplay.mniTracticalGridOriginal1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdGeneral, nrpSpecial, pciTacticalGridorigin, piPending);
end;

procedure TfrmTacticalDisplay.mniUnknowns1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, piUnknown, -1);
end;

procedure TfrmTacticalDisplay.mniUtilityVessel1Click(Sender: TObject);
begin
  UpdatePlatformProperties(focusedTrack, -1, -1, vhtUtilityVess);
end;

procedure TfrmTacticalDisplay.mniWeaponEntryPoint1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdSurface, nrpSpecial, pciWeaponEntryPoint, piPending);
end;

procedure TfrmTacticalDisplay.mniWreck1Click(Sender: TObject);
begin
  LaunchNRPPlatformObserve(vhdSurface, nrpSpecial, pciWreck, piPending);
end;

procedure TfrmTacticalDisplay.Next1Click(Sender: TObject);
var
  index: Integer;
  aObject: TSimObject;
begin
  if cbAssumeControl.Items.Count <= 0 then
    exit;

  index := cbAssumeControl.ItemIndex;
  if index = cbAssumeControl.Items.Count - 1 then
    index := 0
  else
    index := index + 1;

  cbAssumeControl.ItemIndex := index;
  aObject := cbAssumeControl.Items.Objects[index] as TSimObject;

  if aObject <> nil then
  begin
    if aObject is TT3Unit then
      TT3Unit(aObject).Selected := true
    else if aObject is TT3DetectedTrack then
      TT3DetectedTrack(aObject).Selected := true;

    Map1.Repaint;
  end;
end;

procedure TfrmTacticalDisplay.AddTrackPlatform(Sender: TObject);
var
  sTrackNum, sDomain, sIdent: string;
  li: TListItem;
  pi: TT3PlatformInstance;
  det: TT3DetectedTrack;
begin
  pi := nil;

  if Sender is TT3DetectedTrack then
  begin
    det := Sender as TT3DetectedTrack;

    if Assigned(det.TrackObject) then
    begin
      if det.TrackObject is TT3DeviceUnit then
        pi := det.TrackObject.Parent as TT3PlatformInstance
      else
        pi := det.TrackObject as TT3PlatformInstance;
    end;

    sTrackNum := FormatTrackNumber(det.trackNumber);
    sDomain := getDomain(det.TrackDomain);
    sIdent  := getIdentStr(det.TrackIdent);
  end
  else if (Sender is TT3PlatformInstance) then
  begin
    pi := Sender as TT3PlatformInstance;

    if pi is TT3NonRealVehicle then
    begin
      sTrackNum := IntToStr(TT3PlatformInstance(pi).TrackNumber);
      sDomain   := getDomain(TT3PlatformInstance(pi).TrackDomain);
      sIdent := getIdentStr(TT3PlatformInstance(pi).TrackIdent);
    end
    else
    begin
      sTrackNum := pi.TrackLabel;
      sDomain   := getDomain(TVehicle_Definition(TT3Vehicle(pi).UnitDefinition).FData.Platform_Domain);
      sIdent := getIdentStr(pi.Force_Designation);
    end;
  end;

  if pi <> nil then
  begin
    li := FindTrackListByMember(sTrackNum);
    if li = nil then
    begin
      li := lvTrackTable.Items.Add;

      li.Caption := sDomain;
      li.SubItems.Add(sTrackNum);
      li.SubItems.Add(sIdent);
      li.SubItems.Add(FormatCourse(pi.Course));
      li.SubItems.Add(FormatSpeed(pi.Speed));

      if sDomain = 'Air' then
      begin
        li.SubItems.Add(FormatAltitude(pi.Altitude * C_Meter_To_Feet));
        li.SubItems.Add(' ');
      end
      else
      begin
        li.SubItems.Add(' ');
        li.SubItems.Add(FormatAltitude(pi.Altitude));
      end;
//      else
//      begin
//
//      end;
//
//      if pi.Altitude >= 0 then
//      begin
//        li.SubItems.Add(FormatAltitude(pi.Altitude));
//        li.SubItems.Add(' ');
//      end
//      else
//      begin
//        li.SubItems.Add(' ');
//        li.SubItems.Add(FormatAltitude(pi.Altitude));
//      end;

      li.Data := Sender;
    end
    else
    begin
      // sudah ada.
      li.Caption := sDomain;
      li.SubItems[0] := sTrackNum;
      li.SubItems[1] := sIdent;
      li.SubItems[2] := FormatCourse(pi.Course);
      li.SubItems[3] := FormatSpeed(pi.Speed);

      if sDomain = 'Air' then
      begin
        li.SubItems[4] := FormatAltitude(pi.Altitude * C_Meter_To_Feet);
        li.SubItems[5] := ' ';
      end
      else
      begin
        li.SubItems[4] := ' ';
        li.SubItems[5] := FormatAltitude(pi.Altitude);
      end;
    end;
  end;
end;

//procedure TfrmTacticalDisplay.Anchor1Click(Sender: TObject);
//begin
//  btnAnchorCursorClick(self);
//end;

procedure TfrmTacticalDisplay.Automatic1Click(Sender: TObject);
var
  rec : TRecCmd_Platform_CHANGE_TRACKNUMBER;
begin
  if focusedTrack = nil then   //mk
    exit;

  rec.PlatfomID := TT3DetectedTrack(focusedTrack).TrackObject.InstanceIndex;
  rec.TrackID   := TT3DetectedTrack(focusedTrack).TrackNumber;
  rec.newTrackNumber := 0;
    //ShowMessage('new track ' + IntToStr(rec.newTrackNumber) + 'text' + edtNewTrackNumber.Text);
  simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
end;

procedure TfrmTacticalDisplay.UpdateTabHooked(pi: TT3PlatformInstance);
var
  SelectVehicle, ve : TT3Vehicle;
begin
  if not Assigned(focusedTrack) then
    Exit;

  if focusedTrack is TT3Vehicle then
  begin
    SelectVehicle := TT3Vehicle(focusedTrack);

    if pi is TT3Vehicle then
    begin
      ve := TT3Vehicle(pi);

      if SelectVehicle = ve then
      begin
        lbDamage.Caption := IntToStr(100 - Round(ve.HealthPercent)) + '%';
      end;
    end;
  end;
end;

procedure TfrmTacticalDisplay.UpdateTrackListData;
var
  i: Integer;
  li: TListItem;
  sTrackNum, sDomain, sIdent: string;
  pi: TT3PlatformInstance;
  det: TT3DetectedTrack;
  obj: TObject;
begin
  for i := lvTrackTable.Items.Count - 1 downto 0 do
  begin
    pi := nil;
    li := lvTrackTable.Items[i];
    obj := li.Data;

    if obj = nil then
    begin
      lvTrackTable.items.Delete(i);
      Continue;
    end;

    if obj is TT3DetectedTrack then
    begin
      det := obj as TT3DetectedTrack;
      sTrackNum := FormatTrackNumber(det.trackNumber);
      sDomain := getDomain(det.TrackDomain);
      sIdent := getIdentStr(det.TrackIdent);

      if Assigned(det.TrackObject) then
      begin
        if det.TrackObject is TT3DeviceUnit then
          pi := det.TrackObject.Parent as TT3PlatformInstance
        else
          pi := det.TrackObject as TT3PlatformInstance;
      end;
    end
    else if obj is TT3PlatformInstance then
    begin
      pi := obj as TT3PlatformInstance;

      if pi is TT3NonRealVehicle then
      begin
        sTrackNum := IntToStr(TT3PlatformInstance(pi).TrackNumber);
        sDomain   := getDomain(TT3PlatformInstance(pi).TrackDomain);
        sIdent := getIdentStr(TT3PlatformInstance(pi).TrackIdent);
      end
      else
      begin
        sTrackNum := pi.TrackLabel;
        sDomain   := getDomain(TVehicle_Definition(TT3Vehicle(pi).UnitDefinition).FData.Platform_Domain);
        sIdent := getIdentStr(pi.Force_Designation);
      end;
    end;

    if Assigned(pi) then
    begin
      li.Caption := sDomain;

      li.SubItems[0] := sTrackNum;
      li.SubItems[1] := sIdent;
      li.SubItems[2] := FormatCourse(pi.Course);
      li.SubItems[3] := FormatSpeed(pi.Speed);

      if sDomain = 'Air' then
      begin
        li.SubItems[4] := FormatAltitude(pi.Altitude * C_Meter_To_Feet);
        li.SubItems[5] := ' ';
      end
      else
      begin
        li.SubItems[4] := ' ';
        li.SubItems[5] := FormatAltitude(pi.Altitude);
      end;
    end;
  end;
end;

procedure TfrmTacticalDisplay.ViewMember1Click(Sender: TObject);
begin
  if Assigned(lvTrackControl.Selected) then
  begin
    frmGroupName1.Tag := 1;
    frmGroupName1.Caption := 'List Platform on Group : ' + T3GroupVehicle(lvTrackControl.Selected.Data).GroupName;
    frmGroupName1.Initilaize(lvTrackControl.Selected.Data);
    frmGroupName1.Show;
  end;
end;

procedure TfrmTacticalDisplay.vrwhlPositionAzimuthChange(Sender: TObject);
var
  azimuth : Integer;
begin
  if vrwhlPositionAzimuth.Position < 180 then
    azimuth := (180 + vrwhlPositionAzimuth.Position)
  else
    azimuth := (vrwhlPositionAzimuth.Position - 180);

  edtPositionAzimuth.Text := IntToStr(azimuth);
end;

procedure TfrmTacticalDisplay.vrwhlPositionAzimuthMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  rec : TRec_CameraController;
begin
  rec.cmd := CORD_ID_CAMCON_POS_AZIMUTH;
  rec.valueInt := StrToInt(edtPositionAzimuth.Text);

  simMgrClient.netSend_CameraController(rec);
end;

procedure TfrmTacticalDisplay.RefreshLogistikList;
begin
//  fmLogisticCalculation1.RefreshLTemplate;

  if simMgrClient.ISInstructor and Assigned(frmLogistic) then
    frmLogistic.fmLogisticCalculation1.RefreshLTemplate;
end;

procedure TfrmTacticalDisplay.RefreshTracks;
var
  i : integer;
  obj : TObject;
begin
  try
    with TrackLists.LockList do begin
      Clear;

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do begin
          obj := simMgrClient.SimPlatforms.getObject(i);
          Add(obj);
        end
      else begin
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do begin
          obj := simMgrClient.SimPlatforms.getObject(i);
          if TT3PlatformInstance(obj).UnitGroup then
            Add(obj);
        end;
        for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do begin
          obj := simMgrClient.SimDetectedTrackList.getObject(i);
          Add(obj);
        end
      end;
    end;
  finally
    TrackLists.UnlockList
  end;

end;

procedure TfrmTacticalDisplay.Refresh_AssumeControl;
var
  i,j: Integer;
  aObject: TSimObject;
  name: string;
  index: Integer;
  li : TListItem;
begin
  cbAssumeControl.Items.Clear;
  cbAssumeControl.Clear;

  lvPlatformlist.Items.Clear;
  lvPlatformlist.Clear;

  if simMgrClient.ISWasdal then
  begin
    frmTop.cbAssumeControl.Items.Clear;
    frmTop.cbAssumeControl.Clear;
  end;

  index := 0;
  RefreshTracks;

  for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
  begin
    aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
    if not Assigned(aObject) then
      continue;

    // untuk menampilkan hanya satu force saja
//    if simMgrClient.MyForceDesignation <> -1 then
//      if TT3PlatformInstance(aObject).Force_Designation
//        <> simMgrClient.MyForceDesignation then
//          continue;

    if not(TT3PlatformInstance(aObject).UnitGroup) then
       Continue;

    if (aObject.FreeMe) then
       Continue;

    if aObject is TT3Vehicle then      //mk
    begin

      name := TT3PlatformInstance(aObject).InstanceName;

      if TT3Vehicle(aObject).StateTransport then
       Continue;

      cbAssumeControl.Items.AddObject(name, aObject);

      li  := lvPlatformlist.Items.Add;

      with li do
      begin
        Caption := name;
        li.Data := aObject;
      end;

      if simMgrClient.ISWasdal then
        frmTop.cbAssumeControl.Items.AddObject(name, aObject);

      if (simMgrClient.ControlledPlatform <> nil) and
        (simMgrClient.ControlledPlatform = aObject) then
      begin
        //cari index nya di cbAssumeControl
        for j := 0 to cbAssumeControl.Items.Count - 1 do
        begin
          if TT3PlatformInstance(cbAssumeControl.Items.Objects[j])
            = simMgrClient.ControlledPlatform then
            index := j;
        end;
      end;
    end;
  end;

  for i := 0 to simMgrClient.SimWeapons.itemCount - 1 do
  begin
    aObject := TT3PlatformInstance(simMgrClient.SimWeapons.getObject(i));
    if not Assigned(aObject) then
      continue;

    // untuk menampilkan hanya satu force saja
    if simMgrClient.MyForceDesignation <> -1 then
      if TT3PlatformInstance(aObject).Force_Designation
        <> simMgrClient.MyForceDesignation then
          continue;

    name := TT3PlatformInstance(aObject).InstanceName;

    if aObject is TT3Vehicle then      //mk
    begin
      if {(not Assigned(aObject.Parent)) and}
        (TT3PlatformInstance(aObject).UnitGroup) and not(aObject.FreeMe) then
      begin
        cbAssumeControl.Items.AddObject(name, aObject);
        if simMgrClient.ISWasdal then
          frmTop.cbAssumeControl.Items.AddObject(name, aObject);
      end;
    end;
  end;

  {for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do      //mk
  begin
    aObject := TT3DetectedTrack(simMgrClient.SimDetectedTrackList.getObject(i));
    if not Assigned(aObject) then continue;
    name := 'T' + IntToStr(TT3DetectedTrack(aObject).trackNumber);
    cbAssumeControl.Items.AddObject(name, aObject);
  end;}

  if cbAssumeControl.Items.Count > 0 then
  begin
    cbAssumeControl.ItemIndex := index;
    if simMgrClient.ISWasdal then
      frmtop.cbAssumeControl.ItemIndex := index;
  end;
end;

//procedure TfrmTacticalDisplay.Remove2Click(Sender: TObject);
//var
//  rec : TRecCmd_SelectPlatformToRemove;
//  buttonSelected : Integer;
//  i : Integer;
//  dev: TSimObject;
//  objPlatform : TSimObject;
//begin
//  btnRemovePlatformOrTrackClick(self);

  {if Assigned(focusedTrack) then
  begin
    if focusedTrack is TT3PlatformInstance then
      buttonSelected := MessageDlg('Do you really want to remove platform ' + TT3PlatformInstance(focusedTrack).InstanceName, mtConfirmation,
                              [mbYes,mbNo], 0)
    else if focusedTrack is TT3DetectedTrack then
      buttonSelected := MessageDlg('Do you really want to remove platform ' + IntToStr(TT3DetectedTrack(focusedTrack).TrackNumber), mtConfirmation,
                              [mbYes,mbNo], 0);

    if buttonSelected = mrNo then
      Exit;

    rec.SessionID := simMgrClient.SessionID;
    if focusedTrack is TT3PlatformInstance then
    begin
      rec.PlatfomID := TT3PlatformInstance(focusedTrack).InstanceIndex;

      if simMgrClient.ISInstructor then
      begin
		    for i := 0 to simMgrClient.SimDevices.itemCount - 1 do     //mk
        begin
          dev := simMgrClient.SimDevices.getObject(i);
          if (dev is TT3Radar) then
          begin
            if (TT3Radar(dev).RadarDefinition.FDef.Num_FCR_Channels > 0) then
            begin
              objPlatform := simMgrClient.FindT3PlatformByID(rec.PlatfomID);
              objPlatform.IsAssigned := false;

              if TT3Radar(dev).AssignedTrack.Count > 0 then
              begin
                TT3Radar(dev).AssignedTrack.Remove(focusedTrack);
                frmTacticalDisplay.fmFireControl1.SetControlledObject(TT3Radar(dev).Parent);
                frmTacticalDisplay.fmFireControl1.RefreshAssignTrack(dev as TT3Radar);
              end;
            end;
          end;
        end;

        simMgrClient.netSend_CmdRemovePlatfromByOperator(rec);
      end
      else
      begin
        if focusedTrack is TT3NonRealVehicle then
        begin
          simMgrClient.netSend_CmdRemovePlatfromByOperator(rec);
        end;
      end;
    end;

    frmTacticalDisplay.Refresh_AssumeControl;
  end;  }
//end;

//procedure TfrmTacticalDisplay.RemoveFromTargetedRefTrack(Sender: TObject);
//var
//  i : integer;
//  aObj, tgt : TSimObject;
//begin

//  // weapon
//  for I := 0 to simMgrClient.SimWeapons.itemCount - 1 do begin
//    aObj := simMgrClient.SimWeapons.getObject(i);
//    if not Assigned(aObj) then continue;
//    if (aObj is TT3Weapon) then begin
//      tgt := TT3Weapon(aObj).TargetObject;
//      if Assigned(tgt) and (tgt = Sender) then begin
//        TT3Weapon(aObj).TargetObject := nil;
//      end;
//    end;
//  end;

//  // weapon
//  for I := 0 to simMgrClient.SimDevices.itemCount - 1 do begin
//    aObj := simMgrClient.SimDevices.getObject(i);
//    if not Assigned(aObj) then continue;
//    if (aObj is TT3Weapon) then begin
//      tgt := TT3Weapon(aObj).TargetObject;
//      if Assigned(tgt) and (tgt = Sender) then begin
//        TT3Weapon(aObj).TargetObject := nil;
//      end;
//    end;
//  end;

//  { //comment by Aldy -> error-nya inaccessible value
//  for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do begin
//    aObj := simMgrClient.SimPlatforms.getObject(i);
//    if Assigned(aObj) then
//      if (aObj is TT3Weapon) then begin
//        if Assigned(TT3Weapon(aObj).TargetObject) then
//        begin
//          tgt := TT3Weapon(aObj).TargetObject;
//          if Assigned(tgt) and (tgt = Sender) then begin
//            TT3Weapon(aObj).TargetObject := nil;
//          end;
//        end;
//      end;
//  end;
//  }
//end;

procedure TfrmTacticalDisplay.RemoveFromTrackList(Sender: TObject);
var
  s : string;
  li : TListItem;
  det : TT3DetectedTrack;
  pi : TT3PlatformInstance;
begin
  if Sender is TT3DetectedTrack then
  begin
    det := Sender as TT3DetectedTrack;
    s := FormatTrackNumber(det.trackNumber);
  end
  else
  if (Sender is TT3PlatformInstance) then
  begin
    pi := Sender as TT3PlatformInstance;

    if pi is TT3NonRealVehicle then
    begin
      s := IntToStr(TT3PlatformInstance(pi).TrackNumber);
    end
    else
    begin
      s := pi.TrackLabel;
    end;
  end;

  li := FindTrackListByMember(s);
  if li <> nil then
    li.Delete;
end;

procedure TfrmTacticalDisplay.RemoveListandForm(ctrlObj: TObject);
begin
  if not(Assigned(ctrlObj)) then
    Exit;

  fmOwnShip1.RemoveListOwnShip(ctrlObj);
  fmPlatformGuidance1.RemoveListGuidance(ctrlObj);
  fmSensor1.RemoveListSensor(ctrlObj);
  fmWeapon1.RemoveListWeapon(ctrlObj);
  fmFireControl1.RemoveListFC(ctrlObj);
  fmCounterMeasure1.RemoveListCounterMeasure(ctrlObj);
  fmEMCON1.RemoveListEMCON(ctrlObj);
//  fmLogisticCalculation1.RemoveListLogistic(ctrlObj);

  { wasdal UI }
  if simMgrClient.ISWasdal then
  begin
    if Assigned(frmPlatformInfo) then
      frmPlatformInfo.fmOwnShip1.RemoveListOwnShip(ctrlObj);

    if Assigned(frmGuidance) then
      frmGuidance.fmPlatformGuidance1.RemoveListGuidance(ctrlObj);

    if Assigned(frmSensor) then
      frmSensor.fmSensor1.RemoveListSensor(ctrlObj);

    if Assigned(frmWeapon) then
      frmWeapon.fmWeapon1.RemoveListWeapon(ctrlObj);

    if Assigned(frmFCR) then
      frmFCR.fmFireControl1.RemoveListFC(ctrlObj);

    if Assigned(frmCM) then
      frmCM.fmCounterMeasure1.RemoveListCounterMeasure(ctrlObj);

    if Assigned(frmLogistic) then
      frmLogistic.fmLogisticCalculation1.RemoveListLogistic(ctrlObj);

    if Assigned(frmEMCON) then
      frmEMCON.fmEMCON1.RemoveListEMCON(ctrlObj);
  end;
end;

procedure TfrmTacticalDisplay.Delete1Click(Sender: TObject);
var
  rec : TRecCmdMultiMode;
begin
  rec.GroupID := T3GroupVehicle(lvTrackControl.Selected.Data).GroupID;
  StrToChar(T3GroupVehicle(lvTrackControl.Selected.Data).GroupName, rec.GroupName);
  rec.aAction := Byte(C_DELETE);
  simMgrClient.netSend_CmdMultiMode(rec);
end;

function TfrmTacticalDisplay.DeleteAmpersand(value: string): string;
var
  i : Integer;
  found : Boolean;
begin
  i := -1;
  found := False;

  for i := 0 to Length(Value) - 1 do
  begin
    if value[i] = '&' then
    begin
      found := true;
      Break;
    end;
  end;

  if found then
  Delete(value,i,1);
  Result := value;
end;

//procedure TfrmTacticalDisplay.DimensionMenBarClick(Sender: TObject);
//begin
//  DynamicviewMenBar.Checked := False;
//  DimensionMenBar.Checked := True;
//  StatciviewMenBar.Checked := False;
//  mniDinamic.Checked := DynamicviewMenBar.Checked;
//  mniDimension.Checked := DimensionMenBar.Checked;
//  mniStatic.Checked := StatciviewMenBar.Checked;
//
//  simMgrClient.PlatformViewMode := DimensionMenBar.Checked;
//  simMgrClient.TacticalDinamicSymbol :=DynamicviewMenBar.Checked;
//  simMgrClient.TacticalStaticSymbol := StatciviewMenBar.Checked
//end;

procedure TfrmTacticalDisplay.DisplayGameTime(const gSpeed: single;
    const gTime: TDateTime);
var
  i: Integer;
  Selisih, AfterInvasionDay : TDateTime;
  Day,Hour,Min,Sec,MSec : Word;
  FScenario : TT3DBScenario;
begin
  if abs(gSpeed) < 0.000001 then
  begin
    StatusBar1.Panels[9].Text := 'FROZEN';
    StatusBar1.Repaint;
  end
  else
  begin
    if gSpeed < 1 then
    begin
      i := Round(1.0 / gSpeed);
      StatusBar1.Panels[9].Text := '1/' + IntToStr(i) + ' X';
    end
    else
      StatusBar1.Panels[9].Text := IntToStr(Round(gSpeed)) + ' X';

  end;

  StatusBar1.Panels[10].Text := FormatDateTime('ddhhnnss', gTime)
    + 'Z' + FormatDateTime('mmmyyyy', gTime);

    //selisih waktu
  Selisih := gTime - simMgrClient.Scenario.ResourceAllocation.FData.Game_Start_Time;

  Day := Round(Int(Selisih));
  DecodeTime(Selisih,Hour,Min,Sec,MSec);

  {Prince}
//  AfterInvasionDay := gTime - simMgrClient.RemainingDay;
  fmTimeOfRaid.updateTime(gTime, simMgrClient.RemainingDay);
  ShowPlottingOnTime(gTime);
  StatusBar1.Panels[11].Text := Format('%d Day %d Hour %d Minute %d Seconds',[Day,Hour,Min,Sec,MSec]);

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
    StatusBar1.Panels[1].Text := 'Entities = ' + IntToStr(simMgrClient.SimPlatforms.itemCount) ;

  StatusBar1.Repaint;

end;

//UI Instruktur//

procedure TfrmTacticalDisplay.TTButtonClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: Tpanel;
begin
  panel := Sender as Tpanel;
  PanelTag := panel.Tag;

  if panel = pnlTabTrackTable then
  begin
    if PanelTag = 0 then
    begin
      pnlTabTrackTable.Color := RGB(44, 127, 161);
      pnlTrackTable.BringToFront;
      pnlTabTrackTable.Tag := 1;
      pnlTabTrackControl.Tag := 0;
      pnlTabTrackControl.Color := RGB(29, 81, 103);
    end;
  end;

  if panel = pnlTabTrackControl then
  begin
    if PanelTag = 0 then
    begin
      pnlTabTrackControl.Color := RGB(44, 127, 161);
      pnlTrackControl.BringToFront;
      pnlTabTrackControl.Tag := 1;
      pnlTabTrackTable.Tag := 0;
      pnlTabTrackTable.Color := RGB(29, 81, 103);
    end;
  end;
end;

procedure TfrmTacticalDisplay.THButtonClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: Tpanel;
begin
  panel := Sender as Tpanel;
  PanelTag := panel.Tag;

  if panel = pnlTabHook then
  begin
    if PanelTag = 0 then
    begin
      pnlTabHook.Color := RGB(44, 127, 161);
      pnlContentHook.BringToFront;
      pnlTabHook.Tag := 1;
      pnlTabDetails.Tag := 0;
      pnlTabDetection.Tag := 0;
      pnlTabIFF.Tag := 0;
      pnlTabDetails.Color := RGB(29, 81, 103);
      pnlTabDetection.Color := RGB(29, 81, 103);
      pnlTabIFF.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabDetails then
  begin
    if PanelTag = 0 then
    begin
      pnlTabDetails.Color := RGB(44, 127, 161);
      pnlContentDetails.BringToFront;
      pnlTabDetails.Tag := 1;
      pnlTabHook.Tag := 0;
      pnlTabDetection.Tag := 0;
      pnlTabIFF.Tag := 0;
      pnlTabHook.Color := RGB(29, 81, 103);
      pnlTabDetection.Color := RGB(29, 81, 103);
      pnlTabIFF.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabDetection then
  begin
    if PanelTag = 0 then
    begin
      pnlTabDetection.Color := RGB(44, 127, 161);
      pnlContentDetection.BringToFront;
      pnlTabDetection.Tag := 1;
      pnlTabHook.Tag := 0;
      pnlTabDetails.Tag := 0;
      pnlTabIFF.Tag := 0;
      pnlTabHook.Color := RGB(29, 81, 103);
      pnlTabDetails.Color := RGB(29, 81, 103);
      pnlTabIFF.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabIFF then
  begin
    if PanelTag = 0 then
    begin
      pnlTabIFF.Color := RGB(44, 127, 161);
      pnlContentIFF.BringToFront;
      pnlTabIFF.Tag := 1;
      pnlTabDetails.Tag := 0;
      pnlTabHook.Tag := 0;
      pnlTabDetection.Tag := 0;
      pnlTabDetails.Color := RGB(29, 81, 103);
      pnlTabDetection.Color := RGB(29, 81, 103);
      pnlTabHook.Color := RGB(29, 81, 103);
    end;
  end;
end;


procedure TfrmTacticalDisplay.TDCPButtonClick(Sender: TObject);
var
  ImgTag: integer;
  Image: Timage;
begin
  Image := Sender as Timage;
  ImgTag := Image.Tag;

  if Image = imgOwnShip then
  begin
    if ImgTag = 0 then
    begin
      pnlTabOwnShip.Color := RGB(44, 127, 161);
      pnlOwnShip.BringToFront;
      imgOwnShip.Tag := 1;
      imgPlatformGuidance.Tag := 0;
      imgCounterMeasure.Tag := 0;
      imgWeapon.Tag := 0;
      imgSensor.Tag := 0;
      imgEMCON.Tag := 0;
      imgFireControl.Tag := 0;
      pnlTabPlatformGuidance.Color := RGB(29, 81, 103);
      pnlTabCounterMeasure.Color := RGB(29, 81, 103);
      pnlTabWeapon.Color := RGB(29, 81, 103);
      pnlTabSensor.Color := RGB(29, 81, 103);
      pnlTabEMCON.Color := RGB(29, 81, 103);
      pnlTabFireControl.Color := RGB(29, 81, 103);
    end;
  end

  else if Image = imgPlatformGuidance then
  begin
    if ImgTag = 0 then
    begin
      pnlTabPlatformGuidance.Color := RGB(44, 127, 161);
      pnlPlatformGuidance.BringToFront;
      imgPlatformGuidance.Tag := 1;
      imgOwnShip.Tag := 0;
      imgCounterMeasure.Tag := 0;
      imgWeapon.Tag := 0;
      imgSensor.Tag := 0;
      imgEMCON.Tag := 0;
      imgFireControl.Tag := 0;
      pnlTabOwnShip.Color := RGB(29, 81, 103);
      pnlTabCounterMeasure.Color := RGB(29, 81, 103);
      pnlTabWeapon.Color := RGB(29, 81, 103);
      pnlTabSensor.Color := RGB(29, 81, 103);
      pnlTabEMCON.Color := RGB(29, 81, 103);
      pnlTabFireControl.Color := RGB(29, 81, 103);
    end;
  end

  else if Image = imgCounterMeasure then
  begin
    if ImgTag = 0 then
    begin
      pnlTabCounterMeasure.Color := RGB(44, 127, 161);
      pnlCounterMeasure.BringToFront;
      imgCounterMeasure.Tag := 1;
      imgPlatformGuidance.Tag := 0;
      imgOwnShip.Tag := 0;
      imgWeapon.Tag := 0;
      imgSensor.Tag := 0;
      imgEMCON.Tag := 0;
      imgFireControl.Tag := 0;
      pnlTabOwnShip.Color := RGB(29, 81, 103);
      pnlTabPlatformGuidance.Color := RGB(29, 81, 103);
      pnlTabWeapon.Color := RGB(29, 81, 103);
      pnlTabSensor.Color := RGB(29, 81, 103);
      pnlTabEMCON.Color := RGB(29, 81, 103);
      pnlTabFireControl.Color := RGB(29, 81, 103);
    end;
  end

  else if Image = imgWeapon then
  begin
    if ImgTag = 0 then
    begin
      pnlTabWeapon.Color := RGB(44, 127, 161);
      pnlWeapon.BringToFront;
      imgWeapon.Tag := 1;
      imgPlatformGuidance.Tag := 0;
      imgCounterMeasure.Tag := 0;
      imgOwnShip.Tag := 0;
      imgSensor.Tag := 0;
      imgEMCON.Tag := 0;
      imgFireControl.Tag := 0;
      pnlTabOwnShip.Color := RGB(29, 81, 103);
      pnlTabCounterMeasure.Color := RGB(29, 81, 103);
      pnlTabPlatformGuidance.Color := RGB(29, 81, 103);
      pnlTabSensor.Color := RGB(29, 81, 103);
      pnlTabEMCON.Color := RGB(29, 81, 103);
      pnlTabFireControl.Color := RGB(29, 81, 103);
    end;
  end

  else if Image = imgSensor then
  begin
    if ImgTag = 0 then
    begin
      pnlTabSensor.Color := RGB(44, 127, 161);
      pnlSensor.BringToFront;
      imgSensor.Tag := 1;
      imgPlatformGuidance.Tag := 0;
      imgCounterMeasure.Tag := 0;
      imgWeapon.Tag := 0;
      imgOwnShip.Tag := 0;
      imgEMCON.Tag := 0;
      imgFireControl.Tag := 0;
      pnlTabOwnShip.Color := RGB(29, 81, 103);
      pnlTabCounterMeasure.Color := RGB(29, 81, 103);
      pnlTabWeapon.Color := RGB(29, 81, 103);
      pnlTabPlatformGuidance.Color := RGB(29, 81, 103);
      pnlTabEMCON.Color := RGB(29, 81, 103);
      pnlTabFireControl.Color := RGB(29, 81, 103);
    end;
  end

  else if Image = imgEMCON then
  begin
    if ImgTag = 0 then
    begin
      pnlTabEMCON.Color := RGB(44, 127, 161);
      pnlEMCON.BringToFront;
      imgEMCON.Tag := 1;
      imgPlatformGuidance.Tag := 0;
      imgCounterMeasure.Tag := 0;
      imgWeapon.Tag := 0;
      imgSensor.Tag := 0;
      imgOwnShip.Tag := 0;
      imgFireControl.Tag := 0;
      pnlTabOwnShip.Color := RGB(29, 81, 103);
      pnlTabCounterMeasure.Color := RGB(29, 81, 103);
      pnlTabWeapon.Color := RGB(29, 81, 103);
      pnlTabSensor.Color := RGB(29, 81, 103);
      pnlTabPlatformGuidance.Color := RGB(29, 81, 103);
      pnlTabFireControl.Color := RGB(29, 81, 103);
    end;
  end

  else if Image = imgFireControl then
  begin
    if ImgTag = 0 then
    begin
      pnlTabFireControl.Color := RGB(44, 127, 161);
      pnlFireControl.BringToFront;
      imgFireControl.Tag := 1;
      imgPlatformGuidance.Tag := 0;
      imgCounterMeasure.Tag := 0;
      imgWeapon.Tag := 0;
      imgSensor.Tag := 0;
      imgEMCON.Tag := 0;
      imgOwnShip.Tag := 0;
      pnlTabOwnShip.Color := RGB(29, 81, 103);
      pnlTabCounterMeasure.Color := RGB(29, 81, 103);
      pnlTabWeapon.Color := RGB(29, 81, 103);
      pnlTabSensor.Color := RGB(29, 81, 103);
      pnlTabEMCON.Color := RGB(29, 81, 103);
      pnlTabPlatformGuidance.Color := RGB(29, 81, 103);
    end;
  end
end;

procedure TfrmTacticalDisplay.ViewTargetTabClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: Tpanel;
begin
  panel := Sender as Tpanel;
  PanelTag := panel.Tag;

  if panel = pnlTabPlatform then
  begin
    if PanelTag = 0 then
    begin
      pnlTabPlatform.Color := RGB(44, 127, 161);
      pnlPlatform.BringToFront;
      pnlTabPlatform.Tag := 1;
      pnlTabPosition.Tag := 0;
      pnlTabPosition.Color := RGB(29, 81, 103);
    end;
  end;

  if panel = pnlTabPosition then
  begin
    if PanelTag = 0 then
    begin
      pnlTabPosition.Color := RGB(44, 127, 161);
      pnlPosition.BringToFront;
      pnlTabPosition.Tag := 1;
      pnlTabPlatform.Tag := 0;
      pnlTabPlatform.Color := RGB(29, 81, 103);
    end;
  end;
end;

procedure TfrmTacticalDisplay.SetupPlotterUI;
begin
  pnlTop.Hide;
  pnlLeft.Hide;
  Panel3.Hide;
  pnlMenubar.Hide;

  StatusBar1.Visible := False;
  pnlStatusRed.Visible := False;
  pnlStatusYellow.Visible := False;
  Label22.Visible := False;

  frmTopPlotter := TfrmTopPlotter.Create(nil);
  frmTopPlotter.Parent := Self;
//  frmRightToolsPlotter.align := alRight;
  frmTopPlotter.pnlContent.Visible := False;
  frmTopPlotter.Left := Screen.Width - 27;
  frmTopPlotter.Show;

  frmRightToolsPlotter := TfrmRightToolsPlotter.Create(nil);
  frmRightToolsPlotter.Parent := Self;
//  frmRightToolsPlotter.align := alRight;
  frmRightToolsPlotter.pnlContent.Visible := False;
  frmRightToolsPlotter.Left := 1;
  frmRightToolsPlotter.Show;

  frmLeftToolsPlotter := TfrmLeftToolsPlotter.Create(nil);
  frmLeftToolsPlotter.Parent := Self;
//  frmLeftToolsPlotter.align := alLeft;
  frmLeftToolsPlotter.pnlContent.Visible := False;
  frmLeftToolsPlotter.Left := 1;
  frmLeftToolsPlotter.Show;

  Menu := nil;

  // default full screen
  btnFullScreenClick(nil);

  Panel1.Color := StringToColor('$005B4216');
  Panel1.Font.Color := clBtnFace;

  pnlBottom.Color := StringToColor('$005B4216');

  pnlBottom.BevelInner := bvNone;
  pnlBottom.BevelKind := bkNone;
  pnlBottom.BevelOuter := bvNone;
end;

procedure TfrmTacticalDisplay.SetupWasdalUI;
begin
  pnlTop.Hide;
  pnlLeft.Hide;
  Panel3.Hide;
  pnlMenubar.Hide;

  frmRight := TfrmRight.Create(nil);
  frmRight.Parent := Self;
  frmRight.align := alRight;
  frmRight.Show;

  frmTop := TfrmTop.Create(nil);
  frmTop.Parent := Self;
  frmTop.align := alTop;
  frmTop.Show;

  Menu := nil;

  // default full screen
  btnFullScreenClick(nil);

  if vMapSetting.FormWasdal then
  begin
//    frmTop.btnRotate.Visible := true;
    frmViewWasdal.btnRotateScreen.Visible := true;
  end
  else
  begin
//    frmTop.btnRotate.Visible := false;
    frmViewWasdal.btnRotateScreen.Visible := false;
  end;

  // change color
//  Panel1.Color := clMoneyGreen;
  Panel1.Color := StringToColor('$005B4216');
  Panel1.Font.Color := clBtnFace;
//  StatusBar1.Color := clMoneyGreen;
  StatusBar1.Color := StringToColor('$005B4216');
//  pnlBottom.Color := clMoneyGreen;
  pnlBottom.Color := StringToColor('$005B4216');

  pnlBottom.BevelInner := bvNone;
  pnlBottom.BevelKind := bkNone;
  pnlBottom.BevelOuter := bvNone;

end;

//==== END ==//

end.
