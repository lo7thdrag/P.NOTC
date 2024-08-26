unit ufToteDisplay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, ExtCtrls, Grids, Buttons, uDBAssetObject,
  XMLIntf, msxmldom, XMLDoc, urotWheel, ImgList,commctrl, uDBAsset_Vehicle, Math,

  uGuidance, uDataTypes, uNetUDPnode, tttData, uGameData_TTT,
  newClassASTT, uNewMessage, uLibSettingTTT, uCommTTT, Mask,
  uT3Listener, uT3DataLink, uT3Missile, uT3Vehicle, uT3Unit
  ,uT3MissileDetail, uT3DetectedTrack, uEventSummary, uDBAsset_Embark_Library,
  uBrigadePersonel,
  uSlidingTrans, ufrmWeapon, uDataModuleTTT,uMainLogisticTemplate,ufmLogisticCalculation,
  System.ImageList, RzBmpBtn, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg{,
  frxClass};

type
  TStCombobox = class (TComboBox)
  public
    ListItem: TListItem;
  end;


  TGridCracker = Class( TStringgrid );

   TRec_Time_Row = class
    time : TTime;
    row  : Integer;
    isAir: boolean;

    {nando for DTOT}
    WeaponName    : string;
    WeaponIndex   : Integer;
    OwnShipIndex  : Integer;
    TargetIndex   : Integer;
    isLaunched    : Boolean;
    launcherIndex : Integer;
  end;

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
    CategoryPanelStatusOp: TCategoryPanel;
    CategoryPanelWeaponOp: TCategoryPanel;
    CategoryPanelCommOp: TCategoryPanel;
    CategoryPanelManagementOp: TCategoryPanel;
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
    Panel67: TPanel;
    Panel68: TPanel;
    sgAvailableInChannel: TStringGrid;
    Panel41: TPanel;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Panel42: TPanel;
    Panel69: TPanel;
    Label149: TLabel;
    Edit7: TEdit;
    Panel70: TPanel;
    Label151: TLabel;
    Panel71: TPanel;
    Panel72: TPanel;
    Label152: TLabel;
    Panel73: TPanel;
    sgInChannel: TStringGrid;
    gbCommunicationsChannelDefinition: TPanel;
    Panel9: TPanel;
    Panel24: TPanel;
    sgCommChannelDef: TStringGrid;
    gbCommunicationsChannelMapping: TPanel;
    Panel10: TPanel;
    Panel35: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Label129: TLabel;
    SpeedButton13: TSpeedButton;
    edtGroupName: TEdit;
    Panel59: TPanel;
    Label130: TLabel;
    Panel36: TPanel;
    Button25: TButton;
    Button26: TButton;
    Panel37: TPanel;
    Panel60: TPanel;
    Label131: TLabel;
    Panel62: TPanel;
    gbCommunicationsInterference: TPanel;
    Panel11: TPanel;
    Panel32: TPanel;
    Panel53: TPanel;
    sgComInInjection: TStringGrid;
    Label133: TLabel;
    Bevel11: TBevel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    tbNoise: TTrackBar;
    tbJamming: TTrackBar;
    tbMHStones: TTrackBar;
    gbCubicleGroups: TPanel;
    Panel15: TPanel;
    Panel38: TPanel;
    Panel64: TPanel;
    Panel39: TPanel;
    Panel63: TPanel;
    tvCubicleGroups: TTreeView;
    Label157: TLabel;
    sgResponsibilityControllers: TStringGrid;
    Button36: TButton;
    Button37: TButton;
    gbDatalinkControl: TPanel;
    Panel12: TPanel;
    Panel29: TPanel;
    Panel93: TPanel;
    Label141: TLabel;
    Label144: TLabel;
    Label148: TLabel;
    edtDatalink: TEdit;
    edtDLForce: TEdit;
    edtDLBand: TEdit;
    Panel94: TPanel;
    Label142: TLabel;
    Panel95: TPanel;
    Panel30: TPanel;
    Button27: TButton;
    Button28: TButton;
    Panel31: TPanel;
    Panel96: TPanel;
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
    btnApplyEnvi: TButton;
    btnCancelEnvi: TButton;
    Panel92: TPanel;
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
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    gbMessageHandlingSystem: TPanel;
    Panel8: TPanel;
    Panel25: TPanel;
    Panel74: TPanel;
    Panel78: TPanel;
    Panel82: TPanel;
    gbPlatformRemovalSummary: TPanel;
    Panel6: TPanel;
    Panel28: TPanel;
    Panel90: TPanel;
    gbPlatformStatus: TPanel;
    pnlHeaderPlatformStatus: TPanel;
    pnlPlatformLeft: TPanel;
    tvEmbarkedPlatforms: TTreeView;
    pnlPlatforms: TPanel;
    btSelectHookedPlatform: TButton;
    btHookSelectedPlatform: TButton;
    pnlPlatformRight: TPanel;
    gbSensorOverride: TPanel;
    Panel17: TPanel;
    Panel33: TPanel;
    Panel18: TPanel;
    Label224: TLabel;
    Label225: TLabel;
    SpeedButton28: TSpeedButton;
    Label226: TLabel;
    edtDetectionStatus: TEdit;
    cbInhibitESMbearing: TCheckBox;
    cbInhibitSonarBearing: TCheckBox;
    btnInhibitAllESM: TButton;
    btnInhibitSonar: TButton;
    btnSelectHookedPlatform: TButton;
    btnSelectControlledPlatform: TButton;
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
    lvPlatformRemovalSum: TListView;
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
    btSetTimeApply: TButton;
    btnSetXML: TButton;
    btnGetXML: TButton;
    Image1: TImage;
    pmWeapon: TPopupMenu;
    pmCountermeasure: TPopupMenu;
    pmState: TPopupMenu;
    pmEmbarked: TPopupMenu;
    dam1: TMenuItem;
    Damage2: TMenuItem;
    Repair2: TMenuItem;
    SetAvailableQuantity1: TMenuItem;
    Repair1: TMenuItem;
    SetAvailableQuantity2: TMenuItem;
    gbPercentage: TGroupBox;
    gbDistance: TGroupBox;
    edtDistance: TEdit;
    btSetDistanceApply: TButton;
    btSetPercentage: TButton;
    edtPercentage: TEdit;
    gbGuidanceCommand: TGroupBox;
    rbRealistic: TRadioButton;
    rbDirect: TRadioButton;
    gbProbability: TGroupBox;
    rbNormal: TRadioButton;
    rbAlways: TRadioButton;
    rbNever: TRadioButton;
    gbMergedTracksStatus: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    Panel50: TPanel;
    Label3: TLabel;
    Panel51: TPanel;
    btAdd: TButton;
    btRemove: TButton;
    Panel52: TPanel;
    Panel86: TPanel;
    Label4: TLabel;
    Panel88: TPanel;
    Panel91: TPanel;
    Button1: TButton;
    gbEmitterStatus: TPanel;
    Panel98: TPanel;
    Panel99: TPanel;
    sgEmitters: TStringGrid;
    Panel100: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbTrack: TLabel;
    lbName: TLabel;
    lbBearing: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    CategoryPanelStatusCub: TCategoryPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btEmitterStatus: TSpeedButton;
    btnMergedTrack: TSpeedButton;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CategoryPanelWeaponCub: TCategoryPanel;
    Label8: TLabel;
    SpeedButton5: TSpeedButton;
    Label12: TLabel;
    SpeedButton6: TSpeedButton;
    CategoryPanelCommCub: TCategoryPanel;
    Label14: TLabel;
    SpeedButton8: TSpeedButton;
    Label18: TLabel;
    SpeedButton10: TSpeedButton;
    btnDataLinkStatus: TSpeedButton;
    Label19: TLabel;
    Panel20: TPanel;
    Panel49: TPanel;
    Panel75: TPanel;
    mmoMessage: TMemo;
    btnNew: TButton;
    btnRemove: TButton;
    btnReply: TButton;
    btnForward: TButton;
    btnSend: TButton;
    btnEdit: TButton;
    btnPrint: TButton;
    lvReceive: TListView;
    lvSent: TListView;
    lvDraft: TListView;
    ImageList1: TImageList;
    lvSensorOverride: TListView;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Panel19: TPanel;
    ilSensor: TImageList;
    ilWeapon: TImageList;
    ImageList2: TImageList;
    ilCountermeasure: TImageList;
    pmDetectionStatus: TPopupMenu;
    Normal1: TMenuItem;
    AlwaysDetected1: TMenuItem;
    Detectedbypassivesensoronly1: TMenuItem;
    NeverDetected1: TMenuItem;
    PopupMenu1: TPopupMenu;
    pmCubicleGroup: TPopupMenu;
    edtWeaponQuantity: TEdit;
    Setquantity1: TMenuItem;
    Setreadyingtime1: TMenuItem;
    pmDLForce: TPopupMenu;
    pmDLBand: TPopupMenu;
    HF1: TMenuItem;
    UHFVHF1: TMenuItem;
    lvIn: TListView;
    lvOut: TListView;
    LbRoomIn: TListBox;
    LbIn: TListBox;
    LbRoomOut: TListBox;
    LbOut: TListBox;
    lvRecordIn: TListView;
    lvRecordOut: TListView;
    cbbJam: TComboBox;
    btnNoiseCg: TButton;
    btnJamCg: TButton;
    btnMHTCg: TButton;
    pmPlatformLV: TPopupMenu;
    Repair3: TMenuItem;
    edtState: TEdit;
    edtSetTime: TMaskEdit;
    TimerEngage: TTimer;
    TimerLaunch: TTimer;
    lvParticipatingUnits: TListView;
    lvEligibleUnits: TListView;
    ILDataLink: TImageList;
    btnStopDataLink: TSpeedButton;
    btnPlayDataLink: TSpeedButton;
    pmDataLink: TPopupMenu;
    DataLink11: TMenuItem;
    DataLink21: TMenuItem;
    Datalink31: TMenuItem;
    ForceRed1: TMenuItem;
    ForceYellow1: TMenuItem;
    ForceBlue1: TMenuItem;
    ForceGreen1: TMenuItem;
    NoForce1: TMenuItem;
    ForceBlack1: TMenuItem;
    gbDataLinkStatus: TPanel;
    pnlDS2: TPanel;
    pnlDS8: TPanel;
    pnlDS9: TPanel;
    pnlDS10: TPanel;
    lblDS5: TLabel;
    lvDS2: TListView;
    lblDSStatus: TLabel;
    lbDSBand: TLabel;
    lbDSStatusValue: TLabel;
    lbDSBandValue: TLabel;
    btnLaunch: TButton;
    lvMergedTrack: TListView;
    lvMergedTrackComponent: TListView;
    btnDatalink: TBitBtn;
    btnDatalinkForce: TBitBtn;
    btnDatalinkBand: TBitBtn;
    cbbBand: TComboBox;
    RepairAll1: TMenuItem;
    pmLogisticPlatformstate: TPopupMenu;
    CategoryViewTacticalWas: TCategoryPanel;
    btnChangeDisplay: TSpeedButton;
    Label400: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    btnembarkasi: TButton;
    Panel76: TPanel;
    Panel77: TPanel;
    Panel79: TPanel;
    ListView1: TListView;
    gbEventSummary: TPanel;
    pnl_test2: TPanel;
    pnl_test3: TPanel;
    lvEventSummary: TListView;
    lblEventSummary: TLabel;
    btnEventSummary: TSpeedButton;
    gbTransport: TPanel;
    pnlTransportLeft: TPanel;
    pnl11: TPanel;
    lbl13: TLabel;
    lvPlatformEmbarkDisembark: TListView;
    btnEmbarkDisembark: TSpeedButton;
    lblEmbarkDisembark: TLabel;
    pnlPangkalan: TPanel;
    pnlPlatform: TPanel;
    pnlBase: TPanel;
    Label63: TLabel;
    Label64: TLabel;
    lblBaseName: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    lblLongitude: TLabel;
    lblLatitude: TLabel;
    Label26: TLabel;
    pnlPlatformOnBase: TPanel;
    lvPlatformOnBase: TListView;
    pnlPersonelOnbase: TPanel;
    pnlPersonel: TPanel;
    Label25: TLabel;
    tvPersonelOnBase: TTreeView;
    pnlbtnembark: TPanel;
    btnEmbark: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label20: TLabel;
    btntakeoffbase: TSpeedButton;
    cbbBase: TComboBox;
    btnLogisticStatus: TSpeedButton;
    Label21: TLabel;
    gbLogisticStatus: TPanel;
    pmIdShip: TPopupMenu;
    pnlHeaderLogisticsStatus: TPanel;
    pnlPlatformList: TPanel;
    pnlListPlatform: TPanel;
    lvPlatformLogistic: TListView;
    Label284: TLabel;
    Label323: TLabel;
    Label324: TLabel;
    SpeedButton11: TSpeedButton;
    Label31: TLabel;
    SpeedButton12: TSpeedButton;
    Label70: TLabel;
    Label59: TLabel;
    lblForce: TLabel;
    Panel84: TPanel;
    btnEmbarkPersonel: TSpeedButton;
    pnlLogisticBottom: TPanel;
    pnlLogisticCalculation: TPanel;
    pnlLogisticEstimation: TPanel;
    Panel105: TPanel;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    lblShipLogisticCalculation: TLabel;
    Label231: TLabel;
    lblRouteLogisticCalculation: TLabel;
    Panel106: TPanel;
    Panel103: TPanel;
    lvDetailsRouteWPLogistic: TListView;
    pnlTemplateWaypoint: TPanel;
    Label227: TLabel;
    btnCalculateLogistic: TSpeedButton;
    lvLogisticRoute: TListView;
    pnlTransferLogistic: TPanel;
    Label250: TLabel;
    Panel80: TPanel;
    lblFuelLog: TLabel;
    lblMLLog: TLabel;
    lblATLog: TLabel;
    lblWaterLog: TLabel;
    lblFoodLog: TLabel;
    lblJarakLog: TLabel;
    lblWaktuLog: TLabel;
    btnPrintSum: TButton;
//    frxRprtSumm: TfrxReport;
//    frxUsrdtstSumm: TfrxUserDataSet;
    pmLogistikChange: TPopupMenu;
    miLogisticChange: TMenuItem;
    pnlpcReceived: TPanel;
    pnlTabMessage: TPanel;
    pnlTabReceived: TPanel;
    pnlTabSent: TPanel;
    pnlTabDraft: TPanel;
    pnlContentMessage: TPanel;
    pnlContentSent: TPanel;
    pnlContentDraft: TPanel;
    pnlContentReceived: TPanel;
    pnlCommTab: TPanel;
    pnlTabInjection: TPanel;
    pnlTabVolume: TPanel;
    pnlInjection: TPanel;
    pnlVolume: TPanel;
    pnlAudioTab: TPanel;
    pnlExternal: TPanel;
    pnlInternal: TPanel;
    pnlTabExternal: TPanel;
    pnlTabInternal: TPanel;
    pnlTabCubicle: TPanel;
    pnlContentPlatform: TPanel;
    pnlContentResponsibility: TPanel;
    pnlTabPlatform: TPanel;
    pnlTabResponsibility: TPanel;
    Panel85: TPanel;
    pnlAboveWater: TPanel;
    pnlBoundaries: TPanel;
    pnlSurfaceAndSub: TPanel;
    pnlTabEnvironment: TPanel;
    pnlTabAboveWater: TPanel;
    pnlTabSurfaceAndSub: TPanel;
    pnlTabBoundaries: TPanel;
    Label37: TLabel;
    Label56: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label93: TLabel;
    pnlSparatorVer1: TPanel;
    edtEmbarkQuantity: TEdit;
    pnlHeaderTransportStatus: TPanel;
    pnlTransportRight: TPanel;
    pnlInfoKapal: TPanel;
    pnlSparator1: TPanel;
    pnlAmphibiousPlatform: TPanel;
    Label23: TLabel;
    pnlLabelAmphibious: TPanel;
    Label36: TLabel;
    Label50: TLabel;
    lblMaxSpaceHull: TLabel;
    Label41: TLabel;
    Label51: TLabel;
    lblFreeSpaceHull: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    lblCurrentWeightHull: TLabel;
    pnlbtndisembark: TPanel;
    btnAmphibiousLandDisembark: TSpeedButton;
    btnAmphibiousLandDisembarkWith: TSpeedButton;
    lvAmphibiousandLandCarried: TListView;
    pnlSparator2: TPanel;
    pnlPersonelPlatform: TPanel;
    Label24: TLabel;
    tvPersonelCarried: TTreeView;
    Panel81: TPanel;
    Label55: TLabel;
    Label58: TLabel;
    lblMaxCapacityPersonel: TLabel;
    Label145: TLabel;
    Label147: TLabel;
    lblFreeCapacityPersonel: TLabel;
    Label160: TLabel;
    Label172: TLabel;
    lblCurrentWeightPersonel: TLabel;
    pnlPersonelBtn: TPanel;
    btnPersonelDebarkasi: TSpeedButton;
    btnPersonelDebarkasiWith: TSpeedButton;
    lvPersonelCarried: TListView;
    pnlVerSparator2: TPanel;
    pnlSparator4: TPanel;
    pnlPlatformDetails: TPanel;
    lbClass: TLabel;
    lblMaxWeight: TLabel;
    lblTotalWeight: TLabel;
    lblVehicleName: TLabel;
    btnTransportEmbarkasi: TSpeedButton;
    pnlLogisticRight: TPanel;
    pnlNearestBases: TPanel;
    Label29: TLabel;
    pnlNearestPlatform: TPanel;
    Label32: TLabel;
    pnlLogisticPlatform: TPanel;
    Label45: TLabel;
    lvLogisticPlatform: TListView;
    lvNearestbase: TListView;
    lvNearestPlatform: TListView;
    pnlChangeLogistic: TPanel;
    lblJenisLogistic: TLabel;
    btnChangeLogistic: TButton;
    edtLogistic: TEdit;
    pnlHeaderPlatform: TPanel;
    Label159: TLabel;
    pnlStatusTransfer: TPanel;
    Label30: TLabel;
    lvStatusTransfer: TListView;
    Panel104: TPanel;
    btnStandby: TButton;
    Panel102: TPanel;
    btnTransferBase: TButton;
    Panel107: TPanel;
    btnTransferPlatform: TButton;
    pnlButtonRefresh: TPanel;
    btnRefresh: TButton;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    pnlRampStatus: TPanel;
    lbl11: TLabel;
    pnlRampDetails: TPanel;
    pnlRampStarboard: TPanel;
    lbl12: TLabel;
    pnlRampStarboardLeft: TPanel;
    pnlRampStarboardRight: TPanel;
    pnlRampStarboardUp: TPanel;
    pnlRampStarboardDoor: TPanel;
    pnlRampStarboardImage: TPanel;
    btnStarboardRamp: TButton;
    pnlRampPort: TPanel;
    lbl14: TLabel;
    pnlRampPortImage: TPanel;
    pnlRampPortLeft: TPanel;
    pnlRampPortRight: TPanel;
    pnlRampPortUp: TPanel;
    pnlRampPortDoor: TPanel;
    btnPortRamp: TButton;
    pnlRampBack: TPanel;
    lbl15: TLabel;
    pnlRampBackImage: TPanel;
    pnlRampBackLeft: TPanel;
    pnlRampBackRight: TPanel;
    pnlRampBackUp: TPanel;
    pnlRampBackDoor: TPanel;
    btnBackRamp: TButton;
    pnlRampFront: TPanel;
    lbl16: TLabel;
    pnlRampFrontImage: TPanel;
    pnlRampFrontLeft: TPanel;
    pnlRampFrontRight: TPanel;
    pnlRampFrontUp: TPanel;
    pnlRampFrontDoor: TPanel;
    btnFrontRamp: TButton;
    pnlEmbarkStatus: TPanel;
    lbl17: TLabel;
    lbl18: TLabel;
    lblHostPlatform: TLabel;
    lblHostPlatformClass: TLabel;
    lbl21: TLabel;
    lblPlatformEmbarkStatus: TLabel;
    btnHullView: TButton;
    btnStopPlatform: TButton;
    btnStopBase: TButton;
    lblDisembarkStatus: TLabel;
    Label27: TLabel;
    btnMemberTakeOff: TButton;
    btnMemberDisembark: TButton;
    pnlLandingCraftPlatform: TPanel;
    Label28: TLabel;
    TreeView1: TTreeView;
    Panel34: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label54: TLabel;
    Label65: TLabel;
    Panel101: TPanel;
    btnLandingCraftDisembark: TSpeedButton;
    btnLandingCraftDisembarkWith: TSpeedButton;
    lvLandingCraftCarried: TListView;
    pnlSparator3: TPanel;
    lblMorePersonel: TLabel;
    lblMoreCraft: TLabel;
    pnlEnvi: TPanel;
    pnlRain: TPanel;
    pnlCloud: TPanel;
    pnlSeaState: TPanel;
    pnlVisibility: TPanel;
    pnlAthmosper: TPanel;
    pnlWind: TPanel;
    pnlOceanCurr: TPanel;
    ListRain: TImageList;
    lblRain: TLabel;
    ListCloud: TImageList;
    ListSeaState: TImageList;
    lblCloud: TLabel;
    lblSea: TLabel;
    lblVisibility: TLabel;
    lblAtmos: TLabel;
    lblWind: TLabel;
    lblOcean: TLabel;
    pnlindic: TPanel;
    pnlindicocean: TPanel;
    lblSunny: TLabel;
    lblLight: TLabel;
    lblHeavy: TLabel;
    btnSunny: TRzBmpButton;
    btnLightRain: TRzBmpButton;
    btnHeavyRain: TRzBmpButton;
    btnNoFog: TRzBmpButton;
    btnSlightFog: TRzBmpButton;
    btnfog: TRzBmpButton;
    btnVeryFog: TRzBmpButton;
    lblnofog: TLabel;
    lblSlightFog: TLabel;
    lblfogg: TLabel;
    lblveryfog: TLabel;
    btnSea1: TRzBmpButton;
    btnSea2: TRzBmpButton;
    btnSea3: TRzBmpButton;
    btnSea4: TRzBmpButton;
    btnSea5: TRzBmpButton;
    btnSea6: TRzBmpButton;
    btnSea7: TRzBmpButton;
    btnSea8: TRzBmpButton;
    pnlAirPlatform: TPanel;
    Label22: TLabel;
    pnlLabelAirPlatform: TPanel;
    Label35: TLabel;
    Label53: TLabel;
    lblMaxCapacityHanger: TLabel;
    Label38: TLabel;
    Label52: TLabel;
    lblFreeCapacityHanger: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    lblCurrentWeightHanger: TLabel;
    pnlBtnTakeOff: TPanel;
    btnTakeoff: TSpeedButton;
    lblMoreAir: TLabel;
    lvAirCarried: TListView;
    btnOpenHullView: TButton;


    lblState1: TLabel;
    lblState2: TLabel;
    lblState3: TLabel;
    lblState4: TLabel;
    lblState5: TLabel;
    lblState6: TLabel;
    lblState7: TLabel;
    lblState8: TLabel;
    lblMoreAmphibi: TLabel;
    ScrollBox1: TScrollBox;
    tmrEnviDisplay: TTimer;
    gbEnvironmentStatus: TPanel;
    pnl1: TPanel;
    pnlEnviStatus: TPanel;
    pnlEnvironmentDisplay: TPanel;
    imgSunDisplay: TImage;
    imgRainStateDisplay: TImage;
    pnlStateDisplay: TPanel;
    imgBgState: TImage;
    imgRainState: TImage;
    imgCloudState: TImage;
    imgSeaState: TImage;
    lblRainRate: TLabel;
    lblRainRateDesc: TLabel;
    lblCloudAtten: TLabel;
    lblCloudAttenDesc: TLabel;
    lblSeaStat: TLabel;
    lblSeaStatDesc: TLabel;
    pnlOceanWind: TPanel;
    pnlWindDisplay: TPanel;
    imgWindIndicator: TImage;
    imgWindDirection: TImage;
    imgWindSpeed: TImage;
    imgWindNeedle: TImage;
    lblWindDirection: TLabel;
    lblWindSpeed: TLabel;
    lblDirectionWindTrue: TLabel;
    lblSpeedWIndTrue: TLabel;
    pnlOceandDisplay: TPanel;
    imgOceanDirection: TImage;
    imgOceanIndicator: TImage;
    imgOceanNeedle: TImage;
    imgOceanSpeed: TImage;
    lbl20: TLabel;
    lbl22: TLabel;
    lblOceanCurrentDirection: TLabel;
    lblOceanCurrentSpeed: TLabel;
    pnlOtherIndicator: TPanel;
    imgBackgroundOther: TImage;
    lblDaytimeInfrared: TLabel;
    lblDayVisual: TLabel;
    lblNightimeInfrared: TLabel;
    lblNightimeVisual: TLabel;
    lblAtmosphere: TLabel;
    lblAthmospher: TLabel;
    lblNightTimeInfra: TLabel;
    lblDaytimeInfra: TLabel;
    lblNightTimeVisual: TLabel;
    lblDaytimeVisual: TLabel;
    pnlRainDisplay: TPanel;
    imgRainDisplay: TImage;
    imgSeaStateDisplay: TImage;
    pnl2: TPanel;
    pnlWindTrue: TPanel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    pnl3: TPanel;
    pnlRainRate: TPanel;
    lblAttenuationFactorsRain: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    lblAttenuationFactorsCloud: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    pnlOceanCurrent: TPanel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    pnlVisibilityFactor: TPanel;
    lbl35: TLabel;
    lblVisibilityFactorsnfrared: TLabel;
    lbl36: TLabel;
    lblVisibilityactorsTime: TLabel;
    lbl37: TLabel;
    lblVisibilityFactorsElectroOptical: TLabel;
    lbl38: TLabel;
    pnlVisible: TPanel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    pnlAtmosphere: TPanel;
    lbl44: TLabel;
    lbl19: TLabel;
    pnlSea: TPanel;
    lbl45: TLabel;
    lblSeaState: TLabel;
    lbl46: TLabel;
    lbl47: TLabel;
    lblSurfaceTemp: TLabel;
    lbl48: TLabel;
    pnlCloudAtt: TPanel;
    lbl49: TLabel;
    lblCloudAttenuation: TLabel;
    lbl50: TLabel;
    pnl4: TPanel;
    lbl51: TLabel;
    lblSoundVelocityProfile: TLabel;
    lbl52: TLabel;
    lblSoundVelocityLayer: TLabel;
    lbl53: TLabel;
    lbl54: TLabel;
    lblSoundVelocityAverageBottom: TLabel;
    lbl55: TLabel;
    lbl56: TLabel;
    pnlOther: TPanel;
    lbl57: TLabel;
    lblOtherAirTemp: TLabel;
    lbl58: TLabel;
    lbl59: TLabel;
    lblOtherBarometric: TLabel;
    lbl60: TLabel;
    lbl61: TLabel;
    pnlWinRelative: TPanel;
    lblWindRelativeSpeed: TLabel;
    lbl62: TLabel;
    lbl63: TLabel;
    lbl64: TLabel;
    lblWindRelativeDirection: TLabel;
    lbl65: TLabel;
    lbl66: TLabel;
    lblMoreLogisticCalculation: TLabel;
    pnlHeaderLogistic: TPanel;
    pnlRightSparator1: TPanel;
    Label81: TLabel;
    pnlHeaderStatusTransfer: TPanel;
    pnlRightSparator2: TPanel;
    pnlRightSparator3: TPanel;
    pnlHeaderNearestPlatform: TPanel;
    Panel2: TPanel;
    pnlSideBar: TPanel;
    pnlRightBorder: TPanel;
    pnlContent: TPanel;
    pnlStatusCub: TPanel;
    btnPlatformCub: TSpeedButton;
    btnLogisticCub: TSpeedButton;
    btnTransportCub: TSpeedButton;
    btnEnviCub: TSpeedButton;
    btnEmitterCub: TSpeedButton;
    lblEnviCub: TLabel;
    lblEmitterCub: TLabel;
    lblLogisticCub: TLabel;
    lblPlatformCub: TLabel;
    lblTransportCub: TLabel;
    pnlBottomSep2: TPanel;
    pnlStatusOp: TPanel;
    btnPlatformOp: TSpeedButton;
    btnLogisticOp: TSpeedButton;
    btnTransportOp: TSpeedButton;
    btnEnvironmentOp: TSpeedButton;
    btnEventOp: TSpeedButton;
    lblPlatformOp: TLabel;
    lblLogisticOp: TLabel;
    lblTransportOp: TLabel;
    lblEnviOp: TLabel;
    lblEventOp: TLabel;
    pnlBottomSep: TPanel;
    pnlTopSide: TPanel;
    btnAOTC: TSpeedButton;
    lblAOTC: TLabel;
    pnlSeparator1: TPanel;
    pnlWeaponCub: TPanel;
    btnSAMCub: TSpeedButton;
    btnSSMCub: TSpeedButton;
    lblSSMCub: TLabel;
    lblSAMCub: TLabel;
    Panel3: TPanel;
    pnlWeaponOp: TPanel;
    btnSAMOp: TSpeedButton;
    btnSSMOp: TSpeedButton;
    lblSSMOp: TLabel;
    lblSAMOp: TLabel;
    Panel110: TPanel;
    pnlCommunicationOp: TPanel;
    btnMessageOp: TSpeedButton;
    btnCommDefOp: TSpeedButton;
    btnCommMapOp: TSpeedButton;
    btnCommInterOp: TSpeedButton;
    btnDatalinkOp: TSpeedButton;
    lblMessageOp: TLabel;
    lblCommDefOp: TLabel;
    lblCommMapOp: TLabel;
    lblCommInterOp: TLabel;
    lblDatalinkOp: TLabel;
    btnAudioOp: TSpeedButton;
    lblAudioOp: TLabel;
    Panel21: TPanel;
    pnlCommunicationCub: TPanel;
    btnMessageCub: TSpeedButton;
    btnCommMapCub: TSpeedButton;
    btnDatalinkCub: TSpeedButton;
    lblMessageCub: TLabel;
    lblCommMapCub: TLabel;
    lblDatalinkCub: TLabel;
    Panel83: TPanel;
    pnlManagement: TPanel;
    btnCubicle: TSpeedButton;
    btnEnviControl: TSpeedButton;
    lblEnviControl: TLabel;
    lblCubicle: TLabel;
    pnl5: TPanel;
    pnlView: TPanel;
    btnView: TSpeedButton;
    lblView: TLabel;
    btnDetailBase: TButton;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    ScrollBox4: TScrollBox;
    ScrollBox5: TScrollBox;
    ScrollBox6: TScrollBox;
    lblCrew: TLabel;


    // pnlRightUp: TPanel;
    // pnlRightBottom: TPanel;
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
    procedure pmSensorChange(sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure pmStateChange(sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure pmLogisticChange(sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure pmCountermeasureChange(sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure pmWeaponChange(sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure pmEmbarkedChange(sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure tvSettingsClick(sender: TObject);
    procedure cbSetEnDisClick(sender: TObject);
    procedure btSetTimeApplyClick(sender: TObject);
    procedure btSetDistanceApplyClick(sender: TObject);
    procedure btSetPercentageClick(sender: TObject);
    procedure rbNormalClick(sender: TObject);
    procedure rbAlwaysClick(sender: TObject);
    procedure rbNeverClick(sender: TObject);
    procedure rbRealisticClick(sender: TObject);
    procedure rbDirectClick(sender: TObject);
    procedure btHookSelectedPlatformClick(sender: TObject);
    procedure btSelectHookedPlatformClick(sender: TObject);
    procedure damage1Click(sender: TObject);
    procedure fixed1Click(sender: TObject);
    procedure dam1Click(sender: TObject);
    procedure Repair1Click(sender: TObject);
    procedure SetAvailableQuantity2Click(sender: TObject);
    procedure Damage2Click(sender: TObject);
    procedure Repair2Click(sender: TObject);
    procedure SetAvailableQuantity1Click(sender: TObject);
    procedure tvWeaponsMouseDown(sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvCountermeasuresMouseDown(sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvEmbarkedPlatformsMouseDown(sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lvSystemStateMouseDown(sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btEmitterStatusClick(sender: TObject);
    procedure btnMergedTrackClick(sender: TObject);

    procedure StatusOperationClick(sender: TObject);
    procedure StatusPercentageClick(sender: TObject);
    procedure StatusEnableClick(sender: TObject);
    procedure StatusPendingClick(sender: TObject);
    procedure StatusDisableClick(sender: TObject);
    procedure lvPlatformsCustomDrawItem(sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure FormDestroy(sender: TObject);
    procedure sgCommChannelDefDrawCell(sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnNewClick(sender: TObject);
    procedure btnEditClick(sender: TObject);
    procedure btnSendClick(sender: TObject);
    procedure btnReplyClick(sender: TObject);
    procedure btnForwardClick(sender: TObject);
    procedure btnPrintClick(sender: TObject);
    procedure lvSentClick(sender: TObject);
    procedure lvDraftClick(sender: TObject);
    procedure lvReceiveClick(sender: TObject);
    procedure DetectabilityClick(Sender: TObject);
    procedure tvCubicleGroupsMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Label14Click(Sender: TObject);
    procedure edtWeaponQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmbarkQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure Setquantity1Click(Sender: TObject);
    procedure Inactive1Click(Sender: TObject);
    procedure HF1Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure sgCommChannelDefClick(Sender: TObject);
    procedure sgComInInjectionSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbbJamChange(Sender: TObject);
    procedure Repair3Click(Sender: TObject);
    procedure lvPlatformsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtStateKeyPress(Sender: TObject; var Key: Char);
    procedure TimerEngageTimer(Sender: TObject);
    procedure TimerLaunchTimer(Sender: TObject);
    procedure btnApplyEnviClick(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure btnStopDataLinkClick(Sender: TObject);
    procedure btnPlayDataLinkClick(Sender: TObject);
    procedure DataLink11Click(Sender: TObject);
    procedure ForceRed1Click(Sender: TObject);
    procedure btnDataLinkStatusClick(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    procedure sgSurfacetoSurfaceSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure edtOceanCurrentDirectionKeyPress(Sender: TObject; var Key: Char);
    procedure edtOceanCurrentSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure tvWeaponsKeyPress(Sender: TObject; var Key: Char);
    procedure tvWeaponsEdited(Sender: TObject; Node: TTreeNode;
      var S: string);
    procedure tvEmbarkedPlatformsEdited(Sender: TObject; Node: TTreeNode;
      var S: string);
    procedure edtWindDirKeyPress(Sender: TObject; var Key: Char);
    procedure edtWindSpeedKeyPress(Sender: TObject; var Key: Char);

	procedure Setreadyingtime1Click(Sender: TObject);

	procedure edtDayVisKeyPress(Sender: TObject; var Key: Char);
    procedure edtNightVisKeyPress(Sender: TObject; var Key: Char);
    procedure trbSeaStateChange(Sender: TObject);
    procedure trbBottomLostChange(Sender: TObject);
    procedure btnAbortSurfaceToSurfaceClick(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure lvRecordInCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lvRecordOutCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure btnDatalinkForceMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDatalinkMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDatalinkBandMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnRemoveClick(Sender: TObject);
    procedure sgCommChannelDefKeyPress(Sender: TObject; var Key: Char);
    procedure lvInCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lvOutCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure sgCommChannelDefSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbbBandChange(Sender: TObject);
    procedure lvParticipatingUnitsEdited(Sender: TObject; Item: TListItem;
      var S: string);
    procedure RepairAll1Click(Sender: TObject);
    procedure SoundVelocityClick(Sender: TObject);
    procedure edtDayInfraKeyPress(Sender: TObject; var Key: Char);
    procedure edtNightInfraKeyPress(Sender: TObject; var Key: Char);
    procedure cbxShippingRateChange(Sender: TObject);
    procedure lvSensorOverrideSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure SpeedButton28Click(Sender: TObject);

    procedure OnKeyPress(Sender: TObject; var Key: Char);
    procedure edtAttenRainRateKeyPress(Sender: TObject; var Key: Char);
    procedure btnChangeDisplayClick(Sender: TObject);
    procedure edtWindDirExit(Sender: TObject);
    procedure edtWindSpeedExit(Sender: TObject);
    procedure edtDayVisExit(Sender: TObject);
    procedure edtNightVisExit(Sender: TObject);
    procedure edtDayInfraExit(Sender: TObject);
    procedure edtNightInfraExit(Sender: TObject);
    procedure edtAttenRainRateExit(Sender: TObject);
    procedure edtAttenCloudKeyPress(Sender: TObject; var Key: Char);
    procedure edtAttenCloudExit(Sender: TObject);
    procedure edtBarometricPressureKeyPress(Sender: TObject; var Key: Char);
    procedure edtBarometricPressureExit(Sender: TObject);
    procedure edtAirTempKeyPress(Sender: TObject; var Key: Char);
    procedure edtAirTempExit(Sender: TObject);
    procedure edtCloudBaseHeightKeyPress(Sender: TObject; var Key: Char);
    procedure edtCloudBaseHeightExit(Sender: TObject);
    procedure edtAtmRefractKeyPress(Sender: TObject; var Key: Char);
    procedure edtAtmRefractExit(Sender: TObject);
    procedure btnCancelEnviClick(Sender: TObject);
    procedure edtSeaStateKeyPress(Sender: TObject; var Key: Char);
    procedure edtSeaStateExit(Sender: TObject);
    procedure edtBottomLostKeyPress(Sender: TObject; var Key: Char);
    procedure edtBottomLostExit(Sender: TObject);
    procedure btnEventSummaryClick(Sender: TObject);
    procedure btnEmbarkDisembarkClick(Sender: TObject);

    procedure btnLogisticStatusClick(Sender: TObject);
    procedure btnIdShipClick(Sender: TObject);
    procedure refresShipSource(trackShipSelected : String);
    procedure edtExsportKeyPress(Sender: TObject; var Key: Char);

    procedure tvPersonelOnBaseEdited(Sender: TObject; Node: TTreeNode; var S: string);
    procedure tvPersonelOnBaseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnEmbarkPersonelClick(Sender: TObject);
    procedure btnTakeOffFromBaseClick(Sender: TObject);

    procedure btnPrintSumClick(Sender: TObject);
    procedure frxRprtSummGetValue(const VarName: string; var Value: Variant);

    {$REGION ' Logistic Form method '}
    function cekTransfer(var flag : integer; idx: Integer): Boolean;
    procedure chkFuelExportClick(Sender: TObject);
    procedure chkFuelImportClick(Sender: TObject);
    procedure btnBaseTransferClick(Sender: TObject);
    procedure btnCalculateLogisticClick(Sender: TObject);
    procedure btnShipTransferClick(Sender: TObject);
    procedure miLogisticChangeClick(Sender: TObject);
    procedure lvLogisticRouteSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvBaseImportSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvPlatformLogisticMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lvShipDestinationTransferSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvPlatformLogisticSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvStatusTransferSelectItem(Sender: TObject; Item: TListItem;Selected: Boolean);
    procedure btnTransferLogisticClick(Sender: TObject);
    procedure btnStopLogisticClick(Sender: TObject);
    procedure lblMoreLogisticCalculationClick(Sender: TObject);

    {$ENDREGION}

    {$REGION ' Transport Form method '}
    procedure lvPlatformEmbarkDisembarkSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvAirCarriedSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvAmphibiousandLandCarriedSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure tvPersonelCarriedMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure lvPlatformOnBaseSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);

    procedure btnTakeOffClick(Sender: TObject);
    procedure btnMemberTakeOffClick(Sender: TObject);
    procedure btnAmphibiousLandDisembarkClick(Sender: TObject);

    procedure btnRampHandleClick(Sender: TObject);
    function RampAnimation(Ramp: Integer): Boolean;

    procedure btnAmphibiousLandDisembarkWithClick(Sender: TObject);
    procedure btnPersonelDebarkasiWithClick(Sender: TObject);
    procedure btnEmbarkClick(Sender: TObject);

    procedure tvPersonelCarriedEdited(Sender: TObject; Node: TTreeNode; var S: string);
    procedure cbbBaseChange(Sender: TObject);
    procedure cbbBaseKeyPress(Sender: TObject; var Key: Char);
    procedure LogisticTabClick(Sender: TObject);
    procedure TabMessageHandlingClick(Sender: TObject);
    procedure pnlCommTabClick(Sender: TObject);
    procedure AudioTabClick(Sender: TObject);
    procedure TabCubicleClick(Sender: TObject);
    procedure TabEnvironmentClick(Sender: TObject);
    procedure lvPersonelCarriedSelectItem(Sender: TObject; Item: TListItem;Selected: Boolean);
//    procedure pnldpnClick(Sender: TObject);
    procedure btnTransportEmbarkasiClick(Sender: TObject);
    procedure lvLogisticPlatformSelectItem(Sender: TObject; Item: TListItem;Selected: Boolean);
    procedure edtLogisticKeyPress(Sender: TObject; var Key: Char);
    procedure btnChangeLogisticClick(Sender: TObject);
    procedure btnStandbyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
	procedure btnRefreshClick(Sender: TObject);
    procedure btnPersonelDebarkasiClick(Sender: TObject);
    procedure btnMemberDisembarkClick(Sender: TObject);
    procedure lblMoreAirClick(Sender: TObject);
    procedure lblMorePersonelClick(Sender: TObject);
    procedure lblMoreCraftClick(Sender: TObject);
    procedure lblMoreAmphibiClick(Sender: TObject);
    procedure lvLandingCraftCarriedSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnLandingCraftDisembarkClick(Sender: TObject);
    procedure btnEnviClick(Sender: TObject);
    procedure tmrEnviDisplayTimer(Sender: TObject);
    procedure pnlSideBarMouseEnter(Sender: TObject);
    procedure pnlSideBarMouseLeave(Sender: TObject);
    procedure pnlRightBorderMouseEnter(Sender: TObject);
    procedure SidebarToggleClick(Sender: TObject);
    procedure SidebarButtonClick(Sender: TObject);
    procedure btnDetailLogisticClick(Sender: TObject);

    {$ENDREGION}

  private

    tagState : Integer;

    FSelectedDataLink : TT3DataLink;
    {nando add}
    TempDefCom : string;
    CheckBoxTrue: TBitmap;
    CheckBoxFalse: TBitmap;
    //Pop Up For Group
    PopUpMenu : TPopUpMenu;
    ItemPopUp : TMenuItem;
    //Copy Pop Up For Group
    CpPopUpMenu : TPopupMenu;
    CpItemPopUp : TMenuItem;

    FLastPlatform : TT3PlatformInstance;
    //FFlagIn: Boolean;

    procedure CommunicationCheckBox(acol, arow, state: Integer);

    //Pop Up
    procedure ClickItemPopUp(Sender : TObject);
    procedure ClickCpItemPopUp(Sender : TObject);

    procedure AdjustComponentDisplayPosition;

    function CekMaxCapacity(var flag : integer):Boolean;
    function FindTrackListPlatformByMember(const arg: string): TListItem;
    function GetNumberOfKoma(s : string): Boolean;

    Procedure GetComChannel;
    procedure ObjectCommunicationDestroy;

    function lvSystemState_getRow(const row: integer; const caption : string):
      TListItem;
    procedure changeGameSettingValue(index : integer; const new: String);
    procedure changeWreckTimeRemoval(Value : integer);

    procedure onEmbarkedTimer(Sender : TObject; QueueNumber : integer; Counter : integer);
    procedure onEmbarkedToReadyingTime(Sender : TObject; QueueNumber : Integer; Counter : Integer);
    procedure onEmbarkedUpdateState(Sender : TObject);
    procedure unAssignedAllEmbarkedTimerEvent(node : TTreeNode);

    procedure sendWindDir;
    procedure sendWindSpeed;
    procedure sendOceanCurDir;
    procedure sendOceanCurSpeed;
    procedure sendDayTimeVis;
    procedure sendNightTimeVis;

    //kirim semua data envi
    procedure SendAllEnviAboveWater;
    procedure SendAllEnviDataSurfaceSubsurface;

    procedure applyEnviAboveWater;
    procedure applyEnviSurfaceSubsurface;

    procedure AddAssetListener(aPF : TT3PlatformInstance);
    procedure RemoveAssetListener(aPF : TT3PlatformInstance);
    procedure OnPropertyIntChange(Sender : TObject;Props : TPropsID; Value : Integer);
    procedure OnPropertyDblChange(Sender : TObject;Props : TPropsID; Value : Double);
    procedure OnPropertyBoolChange(Sender : TObject;Props : TPropsID; Value : Boolean);
//    procedure OnPropertyByteChange(Sender : TObject;Props : TPropsID; Value : Byte); Sementara dipindah ke public
    procedure OnPropertyMissLauncher(Sender : TObject;Launcher : TObject;Value : integer);
    procedure OnPropertyTorpLauncher(Sender : TObject;Launcher : TObject;Value : integer);

    procedure OnPlatformGroupChange(Sender: TObject);

    procedure SetDefaultWidthForStringGridMissileEngagement;
    procedure OnStatusDLComboBoxChange(Sender: TObject);

    procedure InitialDatalinkRec(var rec : TRecCmd_DataLink;datalink : TT3Datalink);
    function cekPangkalan(posShip: t2DPoint;
      var ShipLog: TT3PlatformInstance): Boolean;

    procedure SetPanelLeftToteDisplayForWasdal;
    procedure refreshShipTransfer(trackShipSelected: String);

public
    sgSurToSurEditedRow, sgSurToAirEditedRow: Integer;

    rw, rw1: TRotWheel;     // untuk sync

    IdSelectedWaypointLogistic : Integer;

    //Embark_Library : TBaseEmbarkLibrary;

    StartDTOT : TTime;

    indexDtot : Integer;
    SgSSMissileSelectedCell : Integer;

    {Prince}
    TempX1, TempY1, TempX2, TempY2 : Double;

    {$REGION ' Logistic Variabel '}
    LogisticItemID : Integer;   {Id jenis logistic}
    LogisticActionID : Integer; {0: AsDestStateLogistic; 1:AsSourceStateLogistic}
    LogisticStateID : Integer;  {0: Idle; 1: Standby; 2: Process}
    LogisticHoseID : Integer;   {0: Port; 1:Starboard}

    LogisticSelectedPlatform : TT3PlatformInstance;
    LogisticSelectedID  : Integer;
    LogisticSuppliedID  : Integer;
    LogisticBaseID      : Integer;

    {$ENDREGION}

    {$REGION ' Transport Variabel '}
    isSender            : Boolean; {variabel penanda jeda pengiriman paket, entah sy gak tahu maksudnya}
    isSenderPersonel    : Boolean;
    hoverNode           : TTreeNode;

    TransportHostShipID : Integer;
    TransportMemberShipID : Integer;

    RampaHostShipID : Integer;

//    TransportedOnShipSelected : TT3TransportedInstance;
    PersonelOnShipSelected    : TPersonel;

    TransportedOnBaseID       : Integer;
    TransportedOnBaseSelected : TPlatform_Embark_Library;
    PersonelOnBaseSelected    : TPersonel;

    LandingPlatformID   : Integer;
    LandingPlatformName : string;

    SumWeight           : Double;
    SumSpace            : Double;

    BaseTransport       : TPlatformBase;

    RecDisembark        : TRecCmd_Embark;
    RecDisembarkPersonel: TRecCmd_DisembarkPersonelTemporary;

    RecEmbark           : TRecCmd_Transport;
    RecEmbarkPersonel   : TRecCmd_EmbarkPersonelTemporary;

    RecTakeOffFromBase  : TRecCmd_LaunchRP; {paket take off dari pangkalan menggunakan RPL, biar gak pake buat paket baru di plug in 3D}

    {$ENDREGION}

    {aldy}
    ToteSelectedPlatform : TT3PlatformInstance;
    SensorOverrideSelectedPlatform : TT3PlatformInstance;

    timeEngage: TTime;
    timeFlight: TTIme;

    timeInt : Integer;
    timeIntEngage : Integer;

    listTimeEngage : Tlist;
    listTimeLaunch : TList;
    mList : TList;

    indexWeapon : Integer;

    MissileLaunchList : TMissileHaveLaunch;

    FBlendHidden : Boolean;
    fmLogisticWPCalculation : TfmLogisticCalculation;

    procedure Initialize;

    procedure ObjectCommunicationCreate(sender: TObject);

    procedure UpdateTrackList(sender: TObject);
    function FindTrackListSensorByMember(const arg: string): TListItem;

    {Prince}
    function GetInput(s : string): Boolean;

//    procedure UpdateFormVehicle;

//    procedure RefreshPlatformSensors(PfList: TPlatform_Instance);
//    procedure RefreshPlatformWeapons(PfList: TPlatform_Instance);
//    procedure RefreshPlatformCountermeasures(PfList: TPlatform_Instance);
//    procedure RefreshEmbarkedPlatform(PfList: TPlatform_Instance);
    procedure SetSelectedPlatform(track : TT3PlatformInstance);

    procedure DisplayEnvironMentControl;
    procedure RefreshCubicle_Platform(cubList: Tlist);
    procedure TreeToXML(tv: TTreeView);
    procedure XMLToTree(tv: TTreeView; XMLDoc: TXMLDocument);
    procedure DOMShow(ATree: TTreeView; Anode: IXMLNode; tNode: TTreeNode);
    procedure RotWheelAboveDegreeChange(sender: TObject);
    procedure RotWheelSurfaceChange(sender: TObject);
    procedure setWheel;
    procedure setGroupListToDataLinkCombo;
    procedure GroupDataLinkClick(Sender : TObject);

    procedure setDefaultHeaderMissile;
    procedure setHeaderEmitter;
    procedure setHeaderDataLinkControl;
    procedure setHeaderMergedTrack;
    procedure setHeaderMessageHandling;
    procedure setHeaderAudioRecord;
    procedure setHeaderCommChannelDef;
    procedure setHeaderCommChannelMap;
    procedure setHeaderCommInInjection;
    procedure UpdateMessageHandling(const MessageValue : TRecSendMessage);

    procedure setRoleClient(rc: Integer);

    procedure changeValueTreeSettingItems(node: TTreeNode; const new: String);
    function getValueTreeSettingItems(node: TTreeNode): String;
    function getValueNodeSettingItems(node: TTreeNode): String;
    function getSettingIdentifierItem: String;
    Function NewNode(tr: TTreeView; pNode: TTreeNode;
      Const sNodeText: String): TTreeNode;
    Function FindText(tr: TTreeView; const SearchText: string): TTreeNode;
    Function FindAdd(tr: TTreeView; Const SearchText, sNodeText: string)
      : TTreeNode;
    // Procedure FormTreeView(Tree: TTreeView; Const tblName: String);

    procedure OnWeaponEngaged(Sender, Target: TObject ; Launcher : Integer);
    procedure OnWeaponLaunched(Sender, Target: TObject);
    procedure OnPlatformDestroy(Sender: TObject); overload;
    procedure OnPlatformDestroy(Sender: TObject; Target:string); overload;

    procedure OnPropertyByteChange(Sender : TObject;Props : TPropsID; Value : Byte);

    procedure UpdateTimeMissile;
    procedure RefreshChannelMapping(aGroupName : string);

    procedure CountDownTimeEngage(grid : TStringGrid; value: String);
    procedure CountDownTimeFlight(grid : TStringGrid; value: String);
    procedure UpdateCellGrid(var grid : TStringGrid ; row, column : Integer ; value : String);
    function GetRowGrid(Sender, Target : String; grid: TStringGrid): Integer;

    procedure OnStateValueChange(sender : TListView);
    procedure showEmbarkQuantity(sender : TObject);
    procedure StatusClick(sender: TObject);
    procedure RefreshPlatformList;

    procedure WriteEventSummary;

//    procedure UpdateDamageWeapon

    procedure UpdateSystemState(sender: TObject;const dmgType: TDamageItemType);
    procedure UpdateDevicesState(sender: TObject; const dmgtype: TDamageItemType);

    procedure updateInfoTree(PropID : TPropsID; IntVal : integer;
                             BoolVal : Boolean; DoubleVal : double;
                             ByteVal : Byte);

    //update vehicle
    procedure UpdateVehicle(sender : TT3Vehicle);

    procedure UpdateSensorVehicle(sender : TT3Vehicle);
    procedure UpdateWeaponVehicle(sender : TT3Vehicle);
    procedure UpdateCountermeasureVehicle(sender : TT3Vehicle);
    procedure UpdateStatusVehicle(sender : TT3Vehicle);

    procedure UpdateEmbarkVehicle(sender : TT3Vehicle);
    procedure setUpTreeWeapons(Weapons : TList);

    {data link}
    procedure SetDataLink(subject : TT3DataLink);
    procedure SetDataLinkView;

     {nando DTOT}
    procedure SetMissileRBLW(OwnShip, TargetShip, Missile : TObject;
              TimeEng, TimeLaunch : Double; isLaunch : Boolean; launcherIndex : integer
              ;WeaponName : string);

    procedure ClearAllSurfaceToSurfaceList(pi : TT3PlatformInstance);
    procedure ClearAllSurfaceToAirList(pi : TT3PlatformInstance);
    procedure ClearAllWaitingMissile(pi : TT3PlatformInstance);

    procedure SetTimerMissileLauch(veh : TT3Vehicle);

    procedure settimeDTOT;

    procedure OnweaponEngageWaypoint(pi : TT3PlatformInstance; Sender, Target : TObject; Distance : Double;
              FiringAngle, FiringLauncher : integer; TimeforMissileEngage, TimeforMissileFlight : Double);

    // farah
    procedure countCurrentEffect;

    //added by choco
    procedure PostKey(key: Word; const shift: TShiftState; specialkey: Boolean) ;

    procedure SetupTvCubicleGroup;

    {Nando}
    procedure ReceiveGameSpeedForRecording(Cmd : TRecCmd_GameCtrl);

    {set wasdal UI}
    procedure SetupWasdalUI;

    procedure DrawSeaNeedle(Degree:Double; Image:TCanvas);
    function RotatePointAroundAPoint(APoint: Tpoint; Center: Tpoint; CosVal, SinVal: Double): Tpoint;

    {$REGION ' Logistic Public Method '}
    procedure ResetLogisticPanel(val : Boolean);
    procedure UpdateLogisticToteDisplay (sender : TT3Vehicle);

    procedure RefreshStatusLogistic(sender : TT3Vehicle);
    procedure RefreshShipLogistic(sender : TT3Vehicle);
    procedure RefreshNearestBaseLogistic(sender : TT3Vehicle);
    procedure RefreshNearestPlatformLogistic(sender : TT3Vehicle);

//    procedure RefreshShipDestinationLogistic(idx : Integer);
//    procedure RefreshBaseLogistic(idx : Integer);
    procedure RefreshRouteLogistic(idx : Integer);
    procedure RefreshPanelSize;

    //procedure RefreshAirCarriedTransport(idx : Integer);

    procedure LogisticWPCalculation;
    procedure cekSpeed(ship : TT3Vehicle; iSpeed : Double; var ConsPerHour : Double);
    {$ENDREGION}

    {$REGION ' Transport Public Method '}
//    procedure onLaunchEmbark(rec : TRecCmd_Embark);
    procedure onLaunchDebarkPersonel(rec : TRecCmd_DisembarkPersonelTemporary);

    procedure ResetTransportPanel;
    procedure UpdateTransportToteDisplay(sender : TT3Vehicle);

    procedure RefreshAirCarriedTransport(HostShipID : Integer);
    procedure RefreshAmphibhiousLandCarriedTransport(HostShipID : Integer);
    procedure RefreshPersonelCarriedTransport(HostShipID : Integer);
    procedure RefreshLandingCraftCarriedTransport(HostShipID : Integer);
    procedure RefreshTransportBaseList;
    procedure RefreshTransportBaseData;
    procedure DisableBtnTransportOnBase;
    procedure DisableBtnTransportOnShip;

    function CekChild(list : TList; LevelChild: Integer): Boolean;
    {$ENDREGION}

    {sidebar UI}

    procedure SmoothResizeFormTo(const ToSize: integer);
    procedure DisablePrevious;
    procedure RefreshEnvironment;

    public
      LastButton : Integer;
  end;

const
  tagOverallDamage  = 0;
  tagHelm           = 1;
  tagPropulsion     = 2;
  tagSpeed          = 3;
  tagFuelRemaining  = 4;
  tagFuelLeakage    = 5;
  tagCommunications = 6;

  NON_DATALINK      = 0;
  DATALINK          = 1;
  EU_DAMAGE         = 2;
  EU_DIFFBAND       = 3;

  C_TAG_LOGFUEL   = 0;
  C_TAG_LOGML     = 1;
  C_TAG_LOGAT     = 2;
  C_TAG_LOGFOOD   = 3;
  C_TAG_LOGWATER  = 4;

var
  frmToteDisplay: TfrmToteDisplay;
  rMis: TRecCmd_LaunchMissile;
  lastQuantity, countLauncherOn : Integer;

implementation

uses
  ufTacticalDisplay, uSimMgr_Client, uBaseCoordSystem,
  uDBAsset_GameEnvironment, uDBAsset_Countermeasure,
  uDBScenario, uDBAsset_Cubicle,

  uDBAssets_SubAreaEnviroDefinition, uT3Radar, uT3Sonar,
  uT3Sensor, uT3Weapon, StrUtils, uT3OtherSensor, uDBCubicles,
  uSimObjects, uT3Gun, uT3Mine, uT3Torpedo,
  uT3Bomb, uT3SimManager, uT3CounterMeasure, uT3Visual, DateUtils,
  uT3Common, uT3HybridOnVehicle, ufmInputTrackId, uGameSetting,
  ufmDisembarkWith, uLogisticChange, ufTransportEmbarkasi, ufrmKeyboard, ufrmPlatformBaseDetail;

function DeleteAmpersand(Value: string): string;
var
  i: integer;
  found: Boolean;
begin
  //i := -1;
  found := false;

  for i := 0 to Length(Value) - 1 do  begin
    if Value[i] = '&' then
    begin
      found := true;
      break;
    end;
  end;

  if found then
    Delete(Value, i, 1);

  result := Value;
end;

{$R *.dfm}

{$REGION ' Tote Display Menu And Sub Menu '}

procedure TfrmToteDisplay.btnPlatformStatusClick(sender: TObject);
begin
  gbPlatformStatus.BringToFront;

  RefreshPlatformList;

  tmrEnviDisplay.Enabled := False;

// membuat double selecteed trackx.. maaf tak cendol (mm)
//  if Assigned(simMgrClient.ControlledPlatform) then
//    simMgrClient.ControlledPlatform.Selected := True;
end;

procedure TfrmToteDisplay.btnLogisticStatusClick(Sender: TObject);
begin

  gbLogisticStatus.BringToFront;

  pnlListPlatform.Height := 927;
  pnlLogisticPlatform.Height := 200;
  pnlStatusTransfer.Height := 184;
  pnlNearestPlatform.Height := 230;
  pnlNearestBases.Height := 245;

//  {$REGION ' Setting Panel Logistic Right'}
//  pnlNearestBases.Height := pnlLogisticRight.Height - (34 + 200 + 10 + 184 + 10 + 230+10);
//  Panel102.Height := 38;
//  Label29.Height := 30;
//  {$ENDREGION}
//
//  {$REGION ' Setting Panel Platform List'}
//  pnlListPlatform.Height := pnlPlatformList.Height - 48;
//  {$ENDREGION}

  RefreshPlatformList;
  ResetLogisticPanel(False);
  tmrEnviDisplay.Enabled := False;
end;

procedure TfrmToteDisplay.btnEmbarkDisembarkClick(Sender: TObject);
begin
  TransportHostShipID := 0;

  gbTransport.BringToFront;

//  pnlPangkalan.Visible := simMgrClient.IsController;

  RefreshPlatformList;
  ResetTransportPanel;
  RefreshTransportBaseList;
  tmrEnviDisplay.Enabled := False;
end;

procedure TfrmToteDisplay.btnEnviroStatusClick(sender: TObject);
var
  ge: TGame_Environment_Definition;
  StrTime:string;
  SecondTime : Integer;
  Fogstate: string;
  Rainstate: Integer;
  Seastate: Integer;
begin
  gbEnvironmentStatus.BringToFront;
  ge := (simMgrClient).GameEnvironment;

//  Label111.Caption := Char(176) + 'C';
//  Label108.Caption := Char(176) + 'C';

  with ge.FData do
  begin
    lblSpeedWIndTrue.Caption              := FormatSpeed(Wind_Speed);
    lblDirectionWindTrue.Caption          := FormatCourse(Wind_Direction);
 //   lblAttenuationFactorsRain.Caption     := IntToStr(Rain_Rate);
//    lblAttenuationFactorsCloud.Caption    := IntToStr(Cloud_Attenuation);

    lblDayVisual.Caption                  := FormatFloat('0.00', Daytime_Visual_Modifier) + '%';
    lblNightimeVisual.Caption             := FormatFloat('0.00', Nighttime_Visual_Modifier) + '%';
    lblDaytimeInfrared.Caption            := FormatFloat('0.00', Daytime_Infrared_Modifier) + '%';
    lblNightimeInfrared.Caption           := FormatFloat('0.00', Nighttime_Infrared_Modifier) + '%';

    lblAtmosphere.Caption                 := FormatFloat('0.00', Atmospheric_Refract_Modifier) + '%';
    lblCloudAttenuation.Caption           := IntToStr(Cloud_Attenuation);

    lblSeaState.Caption                   := IntToStr(Sea_State);
    lblSurfaceTemp.Caption                := FormatFloat('0.00', Surface_Temperature) + 'C';

	  lblAttenuationFactorsRain.Caption 	  := IntToStr(Rain_Rate);
    lblAttenuationFactorsCloud.Caption    := FormatFloat('0.00', Cloud_Base_Height);
//    lblWindRelativeDirection.Caption := FormatFloat('0.00', TT3Vehicle(controlle).CourseEnvi);
//    lblWindRelativeSpeed.Caption := FormatFloat('0.00', TT3Vehicle(controlle).SpeedEnvi);

    // lblVisibilityactorsTime.Caption :=
    // lblVisibilityFactorsElectroOptical
    // lblVisibilityFactorsnfrared
    StrTime := FormatDateTime('HH:NN:SS', simMgrClient.GameTIME);
    SecondTime := TimeStringToSecond(StrTime);

    if (SecondTime >= Sunrise) and (SecondTime <= Sunset) then
    begin
      lblVisibilityactorsTime.Caption := 'DayTime';
      lblVisibilityFactorsElectroOptical.Caption := FormatFloat('0.00', Daytime_Visual_Modifier) + '%';
      lblVisibilityFactorsnfrared.Caption := FormatFloat('0.00', Daytime_Infrared_Modifier) + '%';
    end
    else
    begin
      lblVisibilityactorsTime.Caption := 'NightTime';
      lblVisibilityFactorsElectroOptical.Caption := FormatFloat('0.00', Nighttime_Visual_Modifier) + '%';
      lblVisibilityFactorsnfrared.Caption := FormatFloat('0.00', Nighttime_Infrared_Modifier) + '%';
    end;

    lblOtherAirTemp.Caption               := FormatFloat('00.0', Air_Temperature);
    lblOtherBarometric.Caption            := FormatFloat('000.0', Barometric_Pressure);
    lblOceanCurrentSpeed.Caption          := FormatFloat('00.0', Ocean_Current_Speed);
    lblOceanCurrentDirection.Caption      := FormatFloat('000.0', Ocean_Current_Direction);

    case Sound_Velocity_Type of
      0 :
        begin
          lblSoundVelocityProfile.Caption := 'Positive';
        end;
      1 :
        begin
          lblSoundVelocityProfile.Caption := 'Negative';
        end;
      2 :
        begin
          lblSoundVelocityProfile.Caption := 'Positive over negative';
        end;
      3 :
        begin
          lblSoundVelocityProfile.Caption := 'Negative over positive';
        end;
    end;

//    lblSoundVelocityProfile.Caption       := IntToStr(Sound_Velocity_Type);
    lblSoundVelocityLayer.Caption         := FormatFloat('0.0', Thermal_Layer_Depth);
    lblSoundVelocityAverageBottom.Caption := FormatFloat('0.0', Ave_Ocean_Depth);

    case Sea_State of
      0 :
      begin
        lblSeaStatDesc.Caption           := 'Calm (glassy)';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\1_Sea.png');
      end;
      1 :
      begin
        lblSeaStatDesc.Caption           := 'Calm (rippled)';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\2_Sea.png');
      end;
      2 :
      begin
        lblSeaStatDesc.Caption           := 'Smooth (wavelets)';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\3_Sea.png');
      end;
      3 :
      begin
        lblSeaStatDesc.Caption           := 'Slight';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\4_Sea.png');
      end;
      4 :
      begin
        lblSeaStatDesc.Caption           := 'Moderate';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\5_Sea.png');
      end;
      5 :
      begin
        lblSeaStatDesc.Caption           := 'Rough';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\6_Sea.png');
      end;
      6 :
      begin
        lblSeaStatDesc.Caption           := 'Very rough';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\7_Sea.png');
      end;
      7 :
      begin
        lblSeaStatDesc.Caption           := 'High';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\8_Sea.png');
      end;
      8 :
      begin
        lblSeaStatDesc.Caption           := 'Very high';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\8_Sea.png');
      end;
      9,10 :
      begin
        lblSeaStatDesc.Caption        := 'Phenomenal';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\8_Sea.png');
      end;
    end;

    case Rain_Rate of
      0 :
      begin
        lblRainRateDesc.Caption     := 'Sunny';
        imgRainState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\1_Rain.png');
        imgSunDisplay.Visible := True;
        pnlEnvironmentDisplay.Color := $00FFFDDD;
        pnlRainDisplay.Color := $00FFFDDD;
        imgRainDisplay.Visible := False;
      end;
      1 :
      begin
        lblRainRateDesc.Caption     := 'Light Rain';
        imgRainState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\2_Rain.png');
        imgSunDisplay.Visible := True;
        pnlEnvironmentDisplay.Color := $00BAB9A5;
        pnlRainDisplay.Color := $00BAB9A5;
        imgRainDisplay.Visible := True;
      end;
      2 :
      begin
        lblRainRateDesc.Caption     := 'Heavy Rain';
        imgRainState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\3_Rain.png');
        imgSunDisplay.Visible := False;
        pnlEnvironmentDisplay.Color := $00969585;
        pnlRainDisplay.Color := $00969585;
        imgRainDisplay.Visible := True;
      end;
    end;

    case Cloud_Attenuation of
      0 :
      begin
        lblCloudAttenDesc.Caption     := 'No Fog';
        imgCloudState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\1_Cloud.png');
        Fogstate:= 'FOG1';
        if Rain_Rate = 0 then
        begin
          pnlEnvironmentDisplay.Color := $00FFFDDD;
          pnlRainDisplay.Color := $00FFFDDD;
        end
        else if Rain_Rate = 1 then
        begin
          pnlEnvironmentDisplay.Color := $00BAB9A5;
          pnlRainDisplay.Color := $00BAB9A5;
        end
        else if Rain_Rate = 2 then
        begin
          pnlEnvironmentDisplay.Color := $00969585;
          pnlRainDisplay.Color := $00969585;
        end;
      end;
      1 :
      begin
        lblCloudAttenDesc.Caption     := 'Slightly Foggy';
        imgCloudState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\2_Cloud.png');
        Fogstate:= 'FOG2';
        if Rain_Rate = 0 then
        begin
          pnlEnvironmentDisplay.Color := $00F2F1DC;
          pnlRainDisplay.Color := $00F2F1DC;
        end
        else if Rain_Rate = 1 then
        begin
          pnlEnvironmentDisplay.Color := $00C5C4B7;
          pnlRainDisplay.Color := $00C5C4B7;
        end
        else if Rain_Rate = 2 then
        begin
          pnlEnvironmentDisplay.Color := $00AEADA3;
          pnlRainDisplay.Color := $00AEADA3;
        end;
      end;
      2 :
      begin
        lblCloudAttenDesc.Caption     := 'Foggy';
        imgCloudState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\3_Cloud.png');
        Fogstate:= 'FOG2';
        if Rain_Rate = 0 then
        begin
          pnlEnvironmentDisplay.Color := $00E8E7DA;
          pnlRainDisplay.Color := $00E8E7DA;
        end
        else if Rain_Rate = 1 then
        begin
          pnlEnvironmentDisplay.Color := $00CCCCC4;
          pnlRainDisplay.Color := $00CCCCC4;
        end
        else if Rain_Rate = 2 then
        begin
          pnlEnvironmentDisplay.Color := $00BEBEB7;
          pnlRainDisplay.Color := $00BEBEB7;
        end;
      end;
      3 :
      begin
        lblCloudAttenDesc.Caption     := 'Very Foggy';
        imgCloudState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\4_Cloud.png');
        Fogstate:= 'FOG3';
        if Rain_Rate = 0 then
        begin
          pnlEnvironmentDisplay.Color := $00DEDED9;
          pnlRainDisplay.Color := $00DEDED9;
        end
        else if Rain_Rate = 1 then
        begin
          pnlEnvironmentDisplay.Color := $00D4D4D1;
          pnlRainDisplay.Color := $00D4D4D1;
        end
        else if Rain_Rate = 2 then
        begin
          pnlEnvironmentDisplay.Color := $00CECECC;
          pnlRainDisplay.Color := $00CECECC;
        end;
      end;
    end;

//    lblSeaState.Caption                   := IntToStr(Sea_State);
    lblSurfaceTemp.Caption                := FormatFloat('0.0', Surface_Temperature);

    //lOAD FOR DISPLAY
    imgRainStateDisplay.Picture.LoadFromFile('data\Image Interface\Tote\' + Fogstate + '\cloud\' + (Rain_Rate + 1).ToString + '.png');
    imgSeaStateDisplay.Picture.LoadFromFile('data\Image Interface\Tote\' + Fogstate + '\wave\' + (Sea_State + 1).ToString + '.png');
    imgRainDisplay.Picture.LoadFromFile('data\Image Interface\Tote\' + Fogstate + '\Rain\' + (Rain_Rate + 1).ToString + '.png');
    imgSunDisplay.Picture.LoadFromFile('data\Image Interface\Tote\' + Fogstate + '\Sun\' + '1.png');
  end;

//  SetImageAlpha(img1,200);
  DrawSeaNeedle(StrToFloat(lblOceanCurrentDirection.Caption), imgOceanNeedle.Canvas);
  DrawSeaNeedle(StrToFloat(lblDirectionWindTrue.Caption), imgWindNeedle.Canvas);
  tmrEnviDisplay.Enabled := True;
end;

procedure TfrmToteDisplay.btnEventSummaryClick(Sender: TObject);
begin
  tmrEnviDisplay.Enabled := False;
  gbEventSummary.BringToFront;
  lvEventSummary.Columns[0].Width := 20;
  lvEventSummary.Columns[1].Width := 150;
  lvEventSummary.Columns[2].Width := 250;
  lvEventSummary.Columns[3].Width := 500;
end;

procedure TfrmToteDisplay.btnPlatformRemovalClick(sender: TObject);
begin
  gbPlatformRemovalSummary.BringToFront;
  tmrEnviDisplay.Enabled := False;
end;

procedure TfrmToteDisplay.btEmitterStatusClick(sender: TObject);
var
  aObject: TSimObject;
begin
  tmrEnviDisplay.Enabled := False;
  gbEmitterStatus.BringToFront;
  if frmTacticalDisplay.cbAssumeControl.ItemIndex = -1 then
  begin
    Exit;
  end;

  aObject := TSimObject(frmTacticalDisplay.cbAssumeControl.Items.Objects
      [frmTacticalDisplay.cbAssumeControl.ItemIndex]);
  if aObject = nil then
  begin
    lbName.Caption := 'No selected';
    lbTrack.Caption := 'No Track Selected';
    lbBearing.Caption := 'No Bearing';
  end
  else if aObject is TT3Vehicle then
  begin
    lbName.Caption := TT3Vehicle(aObject).InstanceName;
    lbTrack.Caption := TT3Vehicle(aObject).Track_ID;
    lbBearing.Caption := FormatCourse(TT3Vehicle(aObject).Course);
  end;
end;

procedure TfrmToteDisplay.btnSurfaceToAirClick(sender: TObject);
begin
  gbSurfaceToAir.BringToFront;
  tmrEnviDisplay.Enabled := False;
end;

procedure TfrmToteDisplay.btnSurfaceToSurfaceClick(sender: TObject);
begin
  gbSurfaceToSurface.BringToFront;
  tmrEnviDisplay.Enabled := False;
end;

procedure TfrmToteDisplay.btnMessageHandlingClick(sender: TObject);
begin
  gbMessageHandlingSystem.BringToFront;
  tmrEnviDisplay.Enabled := False;
end;

procedure TfrmToteDisplay.btnCommDefinitionClick(sender: TObject);
begin
  gbCommunicationsChannelDefinition.BringToFront;
  tmrEnviDisplay.Enabled := False;
end;

procedure TfrmToteDisplay.btnCommMappingClick(sender: TObject);
begin
   gbCommunicationsChannelMapping.BringToFront;
  tmrEnviDisplay.Enabled := False;
  //gbCommunicationsChannelDefinition.BringToFront;
end;

procedure TfrmToteDisplay.btnCommInterfeceneClick(sender: TObject);
begin
  gbCommunicationsInterference.BringToFront;
  tmrEnviDisplay.Enabled := False;
end;

procedure TfrmToteDisplay.btnDatalinkControlClick(sender: TObject);
begin
  tmrEnviDisplay.Enabled := False;
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    if Assigned(FSelectedDataLink) then
      SetDataLink(FSelectedDataLink);
    gbDatalinkControl.BringToFront;
  end
  else
  begin
    SetDataLinkView;
    gbDataLinkStatus.BringToFront;
  end;
end;

procedure TfrmToteDisplay.btnAudioRecordClick(sender: TObject);
begin
  gbAudioRecordTracks.BringToFront;
  tmrEnviDisplay.Enabled := False;
end;

procedure TfrmToteDisplay.btnCubicleGroupsClick(sender: TObject);
var
  i : Integer;
  li : TListItem;
  grp : T3CubicleGroup;
begin
  tmrEnviDisplay.Enabled := False;
  gbCubicleGroups.BringToFront;
  lvCubicle.Items.Clear;

  with simMgrClient do
  begin
    for i := 0 to CubAssignList.Count - 1 do
    begin
      grp := T3CubicleGroup(CubAssignList.Items[i]);
      if grp = nil then
        continue;

      if grp.FData.Group_Identifier = 'Controller' then
        Continue;

      if grp.FData.Group_Identifier = 'Unassigned Group' then
        Continue;

      if grp.FData.Group_Identifier = 'PELAKU' then
        Continue;

      if grp.FData.Group_Identifier = 'VBS' then
        Continue;

      li := lvCubicle.Items.Add;
      li.Caption := T3CubicleGroup(CubAssignList.Items[i]).FData.Group_Identifier;
      li.SubItems.Add(IntToStr(T3CubicleGroup(CubAssignList.Items[i]).FData.Group_Index));
      li.SubItems.Add(IntToStr(T3CubicleGroup(CubAssignList.Items[i]).FData.Force_Designation));
      li.SubItems.Add(grp.CubicleName);
      li.Data := T3CubicleGroup(CubAssignList.Items[i]);
    end;
  end;

  SetupTvCubicleGroup;
end;

procedure TfrmToteDisplay.btnEnviroControlClick(sender: TObject);
begin
  tmrEnviDisplay.Enabled := False;
  gbEnvironmentControl.BringToFront;
  DisplayEnvironMentControl;


  Label183.Caption := Char(176) + 'C';
  Label222.Caption := Char(176) + 'C';
end;

procedure TfrmToteDisplay.btnSensorOverrideClick(sender: TObject);
var
  li : TListItem;
  s, forceColor : string;
  pi : TT3PlatformInstance;
  i : Integer;
begin
  gbSensorOverride.BringToFront;
  lvSensorOverride.Items.Clear;

  with simMgrClient do
  begin
    for i := 0 to SimPlatforms.itemCount - 1 do
    begin
      pi := TT3PlatformInstance(SimPlatforms.getObject(i));

	    if not Assigned(pi) then
        Continue;

      s := TT3PlatformInstance(pi).InstanceName;

      case TT3PlatformInstance(pi).Force_Designation of
        1:
        begin
          lvSensorOverride.Canvas.Brush.Color := clRed;
          forceColor := 'Red';
        end;
        2:
        begin
          lvSensorOverride.Canvas.Brush.Color := clYellow;
          forceColor := 'Yellow';
        end;
        3:
        begin
          lvSensorOverride.Canvas.Brush.Color := clBlue;
          forceColor := 'Blue';
        end;
        4:
        begin
          lvSensorOverride.Canvas.Brush.Color := clGreen;
          forceColor := 'Green';
        end;
        5:
        begin
          lvSensorOverride.Canvas.Brush.Color := clWhite;
          forceColor := 'No Force';
        end;
        6:
        begin
          lvSensorOverride.Canvas.Brush.Color := clBlack;
          forceColor := 'Black';
        end;
      else
        lvSensorOverride.Canvas.Brush.Color := clBlack;
      end;

      if TT3PlatformInstance(pi).UnitGroup and not TT3PlatformInstance(pi).FreeMe then
      begin
        li := lvSensorOverride.Items.Add;
        li.Caption := '';
        li.SubItems.Add(TT3PlatformInstance(pi).InstanceClass);
        li.SubItems.Add(TT3PlatformInstance(pi).InstanceName);
        li.SubItems.Add(TT3PlatformInstance(pi).TrackLabel);
        li.SubItems.Add(forceColor);
        li.StateIndex := TT3PlatformInstance(pi).Force_Designation;
        li.Data := pi;
      end;
    end;
  end;

  if lvSensorOverride.Items.Count > 0 then
    lvSensorOverride.ItemIndex := 0
  else
    lvSensorOverride.ItemIndex := -1;
end;

procedure TfrmToteDisplay.Label156Click(sender: TObject);
begin
  gbSettings.BringToFront;
end;

procedure TfrmToteDisplay.lblMoreAirClick(Sender: TObject);
begin
  if pnlAirPlatform.Height < 111 then
  begin
    if lvAirCarried.Items.Count = 0 then
      pnlAirPlatform.Height := 200
    else
    begin
      pnlAirPlatform.Height := 175 + (lvAirCarried.Items.Count * 20)
    end;
    lblMoreAir.Caption := 'Less >>';
  end
  else
  begin
    pnlAirPlatform.Height := 110;
    lblMoreAir.Caption := 'More >>';
  end;

end;

procedure TfrmToteDisplay.lblMoreCraftClick(Sender: TObject);
begin
  if pnlLandingCraftPlatform.Height <111 then
  begin
    if lvLandingCraftCarried.Items.Count = 0 then
      pnlLandingCraftPlatform.Height := 200
    else
    begin
      pnlLandingCraftPlatform.Height := 175 + (lvLandingCraftCarried.Items.Count * 20)
    end;
    lblMoreCraft.Caption := 'Less >>';
  end
  else
  begin
     pnlLandingCraftPlatform.Height := 110;
     lblMoreCraft.Caption := 'More >>';
  end;
end;

procedure TfrmToteDisplay.lblMoreAmphibiClick(Sender: TObject);
begin
  if pnlAmphibiousPlatform.Height < 156 then
  begin
    if lvAmphibiousandLandCarried.Items.Count = 0 then
      pnlAmphibiousPlatform.Height := 220
    else
    begin
      pnlAmphibiousPlatform.Height := 210 + (lvAmphibiousandLandCarried.Items.Count * 20)
    end;
    lblMoreAmphibi.Caption := 'Less >>';
  end
  else
  begin
     pnlAmphibiousPlatform.Height := 155;
     lblMoreAmphibi.Caption := 'More >>';
  end;
end;

procedure TfrmToteDisplay.lblMorePersonelClick(Sender: TObject);
begin
  if pnlPersonelPlatform.Height <111 then
  begin
    if lvPersonelCarried.Items.Count = 0 then
      pnlPersonelPlatform.Height := 200
    else
    begin
      pnlPersonelPlatform.Height := 175 + (lvPersonelCarried.Items.Count * 20)
    end;
    lblMorePersonel.Caption := 'Less >>';
  end
  else
  begin
     pnlPersonelPlatform.Height := 110;
     lblMorePersonel.Caption := 'More >>';
  end;
end;

procedure TfrmToteDisplay.btnChangeDisplayClick(Sender: TObject);
begin
  VSlidingTrans.ShowHideBtnProc;
//  frmTacticalDisplay.Be_A_FullMap(True);
//  frmTacticalDisplay.Be_A_FullMap(False);
end;

procedure TfrmToteDisplay.btnChangeLogisticClick(Sender: TObject);
var
  flag : Integer;
  recLogistic : TRecCmd_Change_Logistic;

begin
  if LogisticSelectedPlatform = nil then
    Exit;

  if CekMaxCapacity(flag) then
  begin
    recLogistic.PlatfomID := LogisticSelectedPlatform.InstanceIndex;
    recLogistic.ModeTransferID   := 2;
    recLogistic.ItemID    := LogisticItemID;

    case LogisticItemID of
      liFuel : recLogistic.vFuel := StrToFloat(edtLogistic.Text);
      liLubricants : recLogistic.vLubricants := StrToFloat(edtLogistic.Text);
      liWater : recLogistic.vWater := StrToFloat(edtLogistic.Text);
      liFood : recLogistic.vFood := StrToFloat(edtLogistic.Text);
    end;

    simMgrClient.netSend_Cmd_Change_Logistic(recLogistic);

    ShowMessage('Proces...');
  end
  else
  begin
    case flag of
      1 : ShowMessage('Incorrect data input');
    end;
  end;
end;

{$ENDREGION}

function findLVItem(LV : TListView;aCaption:string):TListItem;
var
  lvItem :  TListITem;
begin
  lvItem := LV.FindCaption(0,      // StartIndex: Integer;
                          aCaption,   // Search string: string;
                          True,   // Partial,
                          True,   // Inclusive
                          False); // Wrap  : boolean;
  result := lvItem;
end;

function GetNodeByData(ATree : TTreeView; AValue:TObject): TTreeNode;
var
    Node: TTreeNode;
begin
  Result := nil;

  if ATree.Items.Count = 0 then Exit;

  Node := ATree.Items[0];
  while Node <> nil do
  begin
    if Avalue.Equals(Node.Data) then
    //if Node.Data = AValue then
    begin
      Result := Node;
      Break;
    end;

    Node := Node.GetNext;
  end;
end;

function SecondToTime(const s: Integer): TTime;
var
  h: Double;
begin
  h := s / 3600;
  Result := h / 24;
end;

function GetItemByObjectData(hItem : TTreeNode;Data : TObject) : TTreeNode ;
var
  hItemFound, hItemChild : TTreeNode;
begin
  // Not found.
  Result := nil;

  // If hItem is NULL, start search from root item.
  if (hItem = nil) then exit;
  //if (hItem.SelectedIndex = 0) then exit;

  while (hItem <> nil) do
  begin
    // Did we find it?
    if (hItem.Data = Data) then
    begin
       Result := hItem;
       Exit;
    end;

    // Check whether we have child items.
    if (hitem.HasChildren) then
    begin
      // Recursively traverse child items.

      hItemChild := hitem.getFirstChild;
      hItemFound := GetItemByObjectData(hItemChild, Data);

      // Did we find it?
      if (hItemFound <> nil) then
       begin
          Result :=  hItemFound;
          Exit;
       end;
    end;

    // Go to next sibling item.
    hItem := hItem.getNextSibling;
  end;
end;

function GetItemByIndex(hItem : TTreeNode;index : integer) : TTreeNode ;
var
  hItemFound, hItemChild : TTreeNode;
begin
  // Not found.
  Result := nil;

  // If hItem is NULL, start search from root item.
  if (hItem = nil) then exit;
  //if (hItem.SelectedIndex = 0) then exit;

  while (hItem <> nil) do
  begin
    // Did we find it?
    if (hItem.SelectedIndex = index) then
    begin
      Result := hItem;
      Exit;
    end;

    // Check whether we have child items.
    if (hitem.HasChildren) then
    begin
      // Recursively traverse child items.

      hItemChild := hitem.getFirstChild;
      hItemFound := GetItemByIndex(hItemChild, index);

      // Did we find it?
      if (hItemFound <> nil) then
       begin
          Result :=  hItemFound;
          Exit;
       end;
    end;

    // Go to next sibling item.
    hItem := hItem.getNextSibling;
  end;
end;

function searchIndexTreeView(t : TTreeNode; const Index : integer; var found : boolean) : TTreeNode;
var
  //i : integer;
  node : TTreeNode;
begin
  if t.HasChildren then 
  begin
    node := t.getFirstChild;
    result := searchIndexTreeView(node,Index,found);
    Exit;
  end;

  result := nil;
end;

procedure TfrmToteDisplay.SetMissileRBLW(OwnShip, TargetShip, Missile : TObject;
  TimeEng, TimeLaunch : Double; isLaunch : Boolean; launcherIndex : integer
  ;WeaponName : string);
var
  recEngage    : TRec_Time_Row;
  rec          : TRec_Time_Row;
  i, EmptyRow  : Integer;

  wc: String;

  MissileIndex : Integer;
  ShipIndex    : Integer;
  TargetIndex  : Integer;
begin
  EmptyRow := 0;

  case TT3Weapon(Missile).WeaponCategory of
    wcMissileAirToSurfaceSubsurface:
      wc := 'Missile Air To Surface Subsurface';
    wcMissileSurfaceSubsurfaceToAir:
      wc := 'Missile Surface Subsurface To Air';
    wcMissileSurfaceSubsurfaceToSurfaceSubsurface:
      wc := 'Missile Surface/Subsurface To Surface/Subsurface';
    wcMissileAirToAir:
      wc := 'Missile Air To Air';
    wcMissileLandAttack:
      wc := 'Missile Land Attack';
    wcTorpedoStraigth:
      wc := 'Torpedo Staigth';
    wcTorpedoActiveAcoustic:
      wc := 'Torpedo Active Acoustic';
    wcTorpedoPassiveAcoustic:
      wc := 'Torpedo Passive Acoustic';
    wcTorpedoWireGuided:
      wc := 'Torpedo Wire Guided';
    wcTorpedoWakeHoming:
      wc := 'Torpedo Wake Homing';
    wcTorpedoActivePassive:
      wc := 'Torpedo Active Passive';
    wcMine:
      wc := 'Mine';
    wcGunCIWS:
      wc := 'Gun CIWS';
    wcGunGun:
      wc := 'Gun';
    wcGunRocket:
      wc := 'Gun Rocket';
    wcBomb:
      wc := 'Bomb';
  end;

  for i := 0 to sgSurfacetoSurface.RowCount - 1 do
  begin
    if sgSurfacetoSurface.Cells[0, i] = '' then
    begin
      emptyRow := i;
      break;
    end;
  end;

  if (OwnShip is TT3Vehicle) and (TargetShip is TT3PlatformInstance) and (Missile is TT3MissilesOnVehicle) then
  begin
    MissileIndex := TT3MissilesOnVehicle(Missile).InstanceIndex;
    ShipIndex    := TT3Vehicle(ownship).InstanceIndex;
    TargetIndex  := TT3PlatformInstance(TargetShip).InstanceIndex;

    rec := TRec_Time_Row.Create;
    recEngage := TRec_Time_Row.Create;

    recEngage.row  := EmptyRow;
    recEngage.WeaponIndex   := MissileIndex;
    recEngage.OwnShipIndex  := ShipIndex;
    recEngage.TargetIndex   := TargetIndex;
    recEngage.launcherIndex := launcherIndex;
    recEngage.WeaponName    := WeaponName;

    rec.row  := EmptyRow;
    rec.WeaponIndex   := MissileIndex;
    rec.OwnShipIndex  := ShipIndex;
    rec.TargetIndex   := TargetIndex;
    rec.isLaunched    := isLaunch;
    rec.launcherIndex := launcherIndex;
    rec.WeaponName    := WeaponName;

    timeEngage := TimeOf(simMgrClient.GameTIME) + TimeOf(TimeEng / (3600*24));
    recEngage.time := timeEngage;
    timeFlight := TimeOf(simMgrClient.GameTIME) + TimeOf(TimeLaunch / (3600*24));
    rec.time := timeFlight;
    rec.isLaunched   := isLaunch;

    with sgSurfacetoSurface do
    begin
      Cells[0, emptyRow] := TT3MissilesOnVehicle(Missile).InstanceName;

      Cells[1, emptyRow] := (TT3MissilesOnVehicle(Missile).InstanceName);
      Cells[2, emptyRow] := wc;
      Cells[3, emptyRow] := (TT3PlatformInstance(TargetShip).InstanceName);
      Cells[4, emptyRow] := 'Launched';
      Cells[5, emptyRow] := FloatToStr(TT3PlatformInstance(TargetShip).Course);
      Cells[6, emptyRow] := FormatDateTime('hh : mm : ss',
        timeEngage);
      Cells[7, emptyRow] := FormatDateTime('hh : mm : ss',
        timeFlight);
    end;

    listTimeEngage.Add(recEngage);
    listTimeLaunch.Add(rec);
  end;
end;

procedure TfrmToteDisplay.SetPanelLeftToteDisplayForWasdal;
begin
  {category panel comm op}
  btnAudioRecord.Height    := 24;
  btnCommDefinition.Height := 24;
  btnCommInterfecene.Height:= 24;
  btnCommMapping.Height    := 24;
  btnDatalinkControl.Height:= 24;

  Label123.Font.Size := 10;
  Label124.Font.Size := 10;
  Label125.Font.Size := 10;
  Label126.Font.Size := 10;
  Label127.Font.Size := 10;
  Label128.Font.Size := 10;

    {message handling system}
    lvReceive.Font.Size:= 10;
    lvSent.Font.Size   := 10;
    lvDraft.Font.Size  := 10;

    {communication definition}
    sgCommChannelDef.Font.Size;
    sgComInInjection.Font.Size;

    {communication channel mapping}
    lvIn.Font.Size  := 10;
    lvout.Font.Size := 10;

    {datalink control}
    lvEligibleUnits.Font.Size := 10;
    lvParticipatingUnits.Font.Size := 10;
    Label141.Font.Size := 10;
    Label144.Font.Size := 10;
    Label148.Font.Size := 10;
    Label142.Font.Size := 10;
    Label143.Font.Size := 10;

    {audio record track}
    lvRecordIn.Font.Size  := 10;
    lvRecordOut.Font.Size := 10;
    label149.Font.Size := 10;
    Label150.Font.Size := 10;
    label151.Font.Size := 10;

  {category panel management op}
  btnCubicleGroups.Height := 24;
  btnEnviroControl.Height := 24;
  btnSensorOverride.Height:= 24;
  btnSetting.Height       := 24;

  label1.Font.Size   := 10;
  label153.Font.Size := 10;
  label155.Font.Size := 10;
  label156.Font.Size := 10;

    {cubicle groups}
     lvCubicle.Font.Size := 10;
     tvCubicleGroups.Font.Size := 10;

    {environment control}
    lvEnviroArea.Font.Size := 10;
//    pcEnvironmentControl.Font.Size := 10;

    {sensor override/error terms}
    lvSensorOverride.Font.Size := 10;
    Panel19.Font.Size := 10;

    {settings}
    tvSettings.Font.Size := 10;

  {category panel status op}
  btnEnviroStatus.Height    := 24;
  btnPlatformRemoval.Height := 24;
  btnPlatformStatus.Height  := 24;
  btnWeaponEngagement.Height:= 24;
  btnEventSummary.Height    := 24;

  Label71.Font.Size := 10;
  Label72.Font.Size := 10;
  Label73.Font.Size := 10;
  Label74.Font.Size := 10;
  lblEventSummary.Font.Size := 10;

    {platform form}
    pnlPlatformLeft.Font.Size  := 10;
    pnlPlatformRight.Font.Size := 10;
    btHookSelectedPlatform.Width := 145;
    btSelectHookedPlatform.Width := 145;

    {weapon engagement summary}
    lvWeaponEngagement.Font.Size := 10;

    {platform removal}
    lvPlatformRemovalSum.Font.Size := 10;

  {category panel weapon op}
  btnSurfaceToAir.Height    := 24;
  btnSurfaceToSurface.Height:= 24;

  label122.Font.Size:= 10;
  Label88.Font.Size := 10;
end;

procedure TfrmToteDisplay.Setquantity1Click(Sender: TObject);
begin
  showEmbarkQuantity(sender);
end;

procedure TfrmToteDisplay.Setreadyingtime1Click(Sender: TObject);
begin
  if Assigned(tvEmbarkedPlatforms.Selected) then
  begin
    tvEmbarkedPlatforms.ReadOnly := false;
    tvEmbarkedPlatforms.Selected.Focused := true;
    tvEmbarkedPlatforms.Selected.EditText;
  end;
end;

procedure TfrmToteDisplay.btnMergedTrackClick(sender: TObject);
begin
  gbMergedTracksStatus.BringToFront;

end;

procedure TfrmToteDisplay.btnDatalinkBandMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos : TPoint;
begin
  if Button = mbLeft then
  begin
    GetCursorPos(pos);
    pmDLBand.Popup(pos.X, pos.Y);
  end;
end;

procedure TfrmToteDisplay.btnDatalinkForceMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos : TPoint;
begin
  if Button = mbLeft then
  begin
    GetCursorPos(pos);
    //setGroupListToDataLinkCombo;
    pmDLForce.Popup(pos.X, pos.Y);
  end;
end;

procedure TfrmToteDisplay.btnDatalinkMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos : TPoint;
begin
  if Button = mbLeft then
  begin
    GetCursorPos(pos);
    pmDataLink.Popup(pos.X, pos.Y);
  end;
end;

procedure TfrmToteDisplay.btHookSelectedPlatformClick(sender: TObject);
var
  index, I : integer;
begin
  if lvPlatforms.ItemIndex = -1 then
    Exit;

  if CategoryPanelStatusOp.Enabled then
  begin
    frmTacticalDisplay.cbAssumeControl.ItemIndex := lvPlatforms.ItemIndex;
    frmTacticalDisplay.cbAssumeControlChange(self);

    if (frmTacticalDisplay.focusedTrack <> nil) and
      (frmTacticalDisplay.focusedTrack is TT3PlatformInstance) then
    begin
      if TT3PlatformInstance(frmTacticalDisplay.focusedTrack).Controlled <> True then
        TT3PlatformInstance(frmTacticalDisplay.focusedTrack).Controlled := true;

      frmTacticalDisplay.Map1.Repaint;
    end;

    lvPlatforms.SetFocus;
  end
  else
  begin
    index := 0;

    for I := 0 to frmTacticalDisplay.cbAssumeControl.Items.Count - 1 do
    begin
      if TT3PlatformInstance(frmTacticalDisplay.cbAssumeControl.Items.Objects[I]).InstanceIndex = TT3PlatformInstance(lvPlatforms.Selected.Data).InstanceIndex then
      begin
        index := i;
        break;
      end;
    end;

    frmTacticalDisplay.cbAssumeControl.ItemIndex := index;
    frmTacticalDisplay.cbAssumeControlChange(self);

    if (frmTacticalDisplay.focusedTrack <> nil) and
      (frmTacticalDisplay.focusedTrack is TT3PlatformInstance) then
    begin
      if TT3PlatformInstance(frmTacticalDisplay.focusedTrack).Controlled <> True then
        TT3PlatformInstance(frmTacticalDisplay.focusedTrack).Controlled := true;

      frmTacticalDisplay.Map1.Repaint;
    end;

    lvPlatforms.SetFocus;
  end;
end;

procedure TfrmToteDisplay.btnAbortSurfaceToSurfaceClick(Sender: TObject);
var
  i, DTOTCount : Integer;
  //ListDTOT : TMissileHaveLaunch;
  RecSend   : TrecSinc_RBLW;
  mov : TT3MissilesOnVehicle;
  //vehicle : TT3Vehicle;
  //LauncherOn : TFitted_Weap_Launcher_On_Board;
begin
  i := 0;

  if Assigned(simMgrClient.ControlledPlatform) then
  begin
    DTOTCount := TT3Vehicle(simMgrClient.ControlledPlatform).MissileWaittoLaunch.Count;
    if (indexDtot < DTOTCount) and (i <> -1) then
    begin

      if simMgrClient.ISWasdal and Assigned(frmWeapon) then
      begin
        mov := TT3MissilesOnVehicle(frmWeapon.fmWeapon1.focused_weapon);

        if not Assigned(mov) then
          Exit;

        //Sincron
        with RecSend do
        begin
          cmd := 13;
          PlatformID := simMgrClient.ControlledPlatform.InstanceIndex;
          WeaponIndex := mov.InstanceIndex;
          WeaponName := mov.InstanceName;
          RBLWIndex := i;
          RBLWLauncherIndex := StrToInt(sgSurfacetoSurface.Cells[1, SgSSMissileSelectedCell]);
        end;
        simMgrClient.netSend_CmdSyncRBLW(RecSend);

        TT3Vehicle(simMgrClient.ControlledPlatform).MissileWaittoLaunch.Delete(indexDtot);

        if TT3Vehicle(simMgrClient.ControlledPlatform).MissileWaittoLaunch.Count <= 0 then
          mov.PreLaunched := False;

        ClearAllSurfaceToSurfaceList(simMgrClient.ControlledPlatform);

        with frmWeapon.fmWeapon1 do
        begin
        end;

        btnLaunch.Enabled := False;
        btnAbortSurfaceToSurface.Enabled := False;

      end
      else
      begin

        mov := TT3MissilesOnVehicle(frmTacticalDisplay.fmWeapon1.focused_weapon);

        //Sincron
        with RecSend do
        begin
          cmd := 13;
          PlatformID := simMgrClient.ControlledPlatform.InstanceIndex;
          WeaponIndex := mov.InstanceIndex;
          WeaponName := mov.InstanceName;
          RBLWIndex := i;
          RBLWLauncherIndex := StrToInt(sgSurfacetoSurface.Cells[1, SgSSMissileSelectedCell]);
        end;
        simMgrClient.netSend_CmdSyncRBLW(RecSend);

        TT3Vehicle(simMgrClient.ControlledPlatform).MissileWaittoLaunch.Delete(indexDtot);

        if TT3Vehicle(simMgrClient.ControlledPlatform).MissileWaittoLaunch.Count <= 0 then
          mov.PreLaunched := False;

        ClearAllSurfaceToSurfaceList(simMgrClient.ControlledPlatform);

        with frmTacticalDisplay.fmWeapon1 do
        begin
  //        if LauncherOn.FData.Launcher_Type > 8 then       //objeckx blm di create
  //          FRippleCountArray[LauncherOn.FData.Launcher_Type-9] := False
  //        else
  //          FRippleCountArray[LauncherOn.FData.Launcher_Type-1] := False;
        end;

        btnLaunch.Enabled := False;
        btnAbortSurfaceToSurface.Enabled := False;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.btnPlayDataLinkClick(Sender: TObject);
var
  rec : TRecCmd_DataLink;
  dlID : Integer;
begin
  if lvParticipatingUnits.Items.Count <= 0 then
    Exit;

  btnStopDataLink.Down := true;
  btnPlayDataLink.Down := false;


  if ContainsStr(edtDatalink.Text, '1') then
    dlID := 1
  else if ContainsStr(edtDatalink.Text, '2') then
    dlID := 2
  else if ContainsStr(edtDatalink.Text, '3') then
    dlID := 3
  else
    exit;

  InitialDatalinkRec(rec,simMgrClient.DataLinkManager.getDatalink(dlID));

  rec.OrderDL := odlPlay;
  simMgrClient.netSend_Cmd_DataLink(rec);
end;

function TfrmToteDisplay.FindTrackListPlatformByMember(const arg: string)
  : TListItem;
var
  i: Integer;
  f: Boolean;
  li: TListItem;
begin
  Result := nil;
  li := nil;

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

function TfrmToteDisplay.FindTrackListSensorByMember(const arg: string)
  : TListItem;
var
  i: Integer;
  f: Boolean;
  li: TListItem;
begin
  Result := nil;
  li := nil;

  f := False;
  i := 0;
  while not f and (i < lvSensors.Items.Count) do
  begin
    li := lvSensors.Items.Item[i];

    //f := False;
    // f := SameText(li.Caption, arg);
    f := SameText(li.SubItems[0], arg);

    Inc(i);
  end;

  if f then
    Result := li;
end;

procedure TfrmToteDisplay.fixed1Click(sender: TObject);
begin
  if (lvSensors.Selected = nil) or (lvSensors.ItemIndex = -1) then
    Exit;

  with simMgrClient do
  begin
     TT3Sensor(lvSensors.Selected.Data).OperationalStatus := sopOff;
  end;

  lvPlatformsSelectItem(lvPlatforms, lvPlatforms.Selected, True);
  lvPlatforms.Selected.Focused := true;
  Invalidate;
  UpdateSensorVehicle(TT3Vehicle(lvPlatforms.Selected.Data));
end;

procedure TfrmToteDisplay.UpdateTrackList(sender: TObject);
//var
//  i: Integer;
//  pi: TPlatform_Instance;
begin
  { if sender = nil then
    Exit;

    with (simMgrClient) do begin
    for I := 0 to Platforms.ChildCount - 1 do begin

    SpeedButton1Click(Platforms.Childs[i]);
    end;
    end;}
end;

{procedure TfrmToteDisplay.RefreshPlatformSensors(PfList: TPlatform_Instance);
var
  i: Integer;
begin
  lvSensors.Items.Clear;

end;
}(*
procedure TfrmToteDisplay.RefreshPlatformWeapons(PfList: TPlatform_Instance);
var
  i: Integer;
  mis: TMissile_Definition;
  torp: TTorpedo_Definition;
begin

  tvWeapons.Items.Clear;

  // missiles
  if (PfList.Vehicle.Missiles <> nil) and (PfList.Vehicle.Missiles.Count > 0)
    then
  begin
    for i := 0 to PfList.Vehicle.Missiles.Count - 1 do
    begin
      mis := PfList.Vehicle.Missiles[i];
      tvWeapons.Items.Add(nil, mis.FData.Class_Identifier);
    end;
  end;

  // torpedoes
  if (PfList.Vehicle.Torpedos <> nil) and (PfList.Vehicle.Torpedos.Count <> 0)
    then
  begin
    for i := 0 to PfList.Vehicle.Torpedos.Count - 1 do
    begin
      torp := PfList.Vehicle.Torpedos[i];
      tvWeapons.Items.Add(nil, torp.FData.Class_Identifier);
    end;
  end;

  // Mines
  if (PfList.Vehicle.Mines <> nil) and (PfList.Vehicle.Mines.Count <> 0) then
  begin
    for i := 0 to PfList.Vehicle.Mines.Count - 1 do
    begin
      tvWeapons.Items.Add(nil,
        TMine_Definition(PfList.Vehicle.Mines[i]).FData.Mine_Identifier);
    end;
  end;
  {
    if (PfList.Vehicle.Hybrids <> nil) then
    for I := 0 to PfList.Vehicle.Hybrids.Count - 1 do
    begin
    tvWeapons.Items.Add(nil, IntToStr(THybrid_Definition(PfList.Vehicle.Hybrids[I]).FData.Hybrid_Index));
    end;
    }

  // Bombs
  if (PfList.Vehicle.Bombs <> nil) and (PfList.Vehicle.Bombs.Count <> 0) then
  begin
    for i := 0 to PfList.Vehicle.Bombs.Count - 1 do
    begin
      tvWeapons.Items.Add(nil,
        TBomb_Definition(PfList.Vehicle.Bombs[i]).FData.Bomb_Identifier);
    end;
  end;

  // GUns
  if (PfList.Vehicle.Guns <> nil) and (PfList.Vehicle.Guns.Count <> 0) then
  begin
    for i := 0 to PfList.Vehicle.Guns.Count - 1 do
    begin
      tvWeapons.Items.Add(nil,
        TGun_Definition(PfList.Vehicle.Guns[i]).FData.Gun_Identifier);
    end;
  end;

end;
*)

procedure TfrmToteDisplay.Repair1Click(sender: TObject);
var
  node : TTreeNode;
  stats : Byte;
begin
  if (tvWeapons.Selected = nil) and not (tvWeapons.Selected.Parent = nil ) then
    Exit;

  node := tvWeapons.Selected;
  stats := Byte(wsAvailable);

  if not Assigned(ToteSelectedPlatform) then
    Exit;

  if not(Assigned(TT3PlatformInstance(node.Data))) then Exit;

  SimMgrClient.netSend_CmdSetStatus(ToteSelectedPlatform.InstanceIndex,
      TT3PlatformInstance(node.Data).InstanceIndex,
      CORD_ID_QUANTITY, CORD_TYPE_WEAPON, stats);

  lvPlatformsSelectItem(lvPlatforms, lvPlatforms.Selected, True);
  lvPlatforms.Selected.Focused := true;
  Invalidate;
end;

procedure TfrmToteDisplay.Repair2Click(sender: TObject);
begin
  if tvCountermeasures.Selected = nil then
    Exit;

    with simMgrClient do
    begin
      if TT3CounterMeasure(tvCountermeasures.Selected.Data).ClassName = 'TT3ChaffLauncher' then
      TT3CounterMeasure(tvCountermeasures.Selected.Data).Status := esAvailable
      else
      TT3CounterMeasure(tvCountermeasures.Selected.Data).Status := esOff;
    end;
    lvPlatformsSelectItem(lvPlatforms, lvPlatforms.Selected, True);
    lvPlatforms.Selected.Focused := true;
    Invalidate;
    UpdateCountermeasureVehicle(TT3Vehicle(lvPlatforms.Selected.Data));
end;

procedure TfrmToteDisplay.Repair3Click(Sender: TObject);
var
  rec : TRecCmd_Platform_Repair;
begin
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin

  if (lvPlatforms.Selected = nil) then
    exit;

  with simMgrClient do
  begin
    rec.PlatfomID     := TT3PlatformInstance(lvPlatforms.Selected.Data).InstanceIndex;
    rec.HealthPercent := 100.0;
    rec.Health        := TT3PlatformInstance(lvPlatforms.Selected.Data).DamageStatus.DamageCapacity;
    rec.nDormant      := False;

    netSend_CmdPlatform_Repair(rec);
    //TT3PlatformInstance(lvPlatforms.Selected.Data).Health := 100.0;
    //TT3PlatformInstance(lvPlatforms.Selected.Data).HealthPercent := 100.0;
  end;

  lvPlatformsSelectItem(lvPlatforms, lvPlatforms.Selected, True);
  lvPlatforms.Selected.Focused := true;
  Invalidate;
  end;
end;

procedure TfrmToteDisplay.RepairAll1Click(Sender: TObject);
var
  rec : TRecCmd_Platform_Repair;
  I: Integer;
  obj:TSimObject;
begin
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal  then
  begin

  if (lvPlatforms.Selected = nil) then
    exit;

    for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
    begin
      obj := simMgrClient.SimPlatforms.getObject(i);

      if TT3PlatformInstance(obj).Dormant = True then
      begin
        with simMgrClient do
        begin
          rec.PlatfomID     := TT3PlatformInstance(obj).InstanceIndex;
          rec.HealthPercent := 100.0;
          rec.Health        := TT3PlatformInstance(obj).DamageStatus.DamageCapacity;
          rec.nDormant      := False;

          netSend_CmdPlatform_Repair(rec);
          //TT3PlatformInstance(lvPlatforms.Selected.Data).Health := 100.0;
          //TT3PlatformInstance(lvPlatforms.Selected.Data).HealthPercent := 100.0;
        end;
      end;
    end;
  end;
end;

{procedure TfrmToteDisplay.RefreshPlatformCountermeasures
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
  if (PfList.Vehicle.Acoustic_Decoys <> nil) and
    (PfList.Vehicle.Acoustic_Decoys.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Accoustic Decoy');
    for i := 0 to PfList.Vehicle.Acoustic_Decoys.Count - 1 do
    begin
      ac_decoy := PfList.Vehicle.Acoustic_Decoys[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Accoustic Decoy'),
        ac_decoy.FData.Instance_Identifier + ' - ' + IntToStr
          (ac_decoy.FData.Quantity));
    end;
  end;

  // air bubble
  if (PfList.Vehicle.Air_Bubble_Mount <> nil) and
    (PfList.Vehicle.Air_Bubble_Mount.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Air Bubble Mount');
    for i := 0 to PfList.Vehicle.Air_Bubble_Mount.Count - 1 do
    begin
      bubble := PfList.Vehicle.Air_Bubble_Mount[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.FieldAddress
          ('Air Bubble Mount'),
        bubble.FData.Instance_Identifier + ' - ' + IntToStr
          (bubble.FData.Bubble_Qty_On_Board));
    end;
  end;

  // chaff
  if (PfList.Vehicle.Chaffs <> nil) and (PfList.Vehicle.Chaffs.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Chaff');
    for i := 0 to PfList.Vehicle.Chaffs.Count - 1 do
    begin
      chaff := PfList.Vehicle.Chaffs[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Chaff'), chaff.FData.Instance_Identifier + ' - ' + IntToStr
          (chaff.FData.Chaff_Qty_On_Board));
    end;
  end;

  // chaff launcher
  if (PfList.Vehicle.Chaff_Launchers <> nil) and
    (PfList.Vehicle.Chaff_Launchers.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Chaff Launcher');
    for i := 0 to PfList.Vehicle.Chaff_Launchers.Count - 1 do
    begin
      chaff_launch := PfList.Vehicle.Chaff_Launchers[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Chaff Launcher'),
        '- ' + IntToStr(chaff_launch.FData.Launcher_Number));
    end;
  end;

  // defensive jammer
  if (PfList.Vehicle.Defensive_Jammers <> nil) and
    (PfList.Vehicle.Defensive_Jammers.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Defensive Jammer');
    for i := 0 to PfList.Vehicle.Defensive_Jammers.Count - 1 do
    begin
      def_jam := PfList.Vehicle.Defensive_Jammers[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Defensive Jammer'), def_jam.FData.Instance_Identifier + ' - 1');
    end;
  end;

  // floating decoy
  if (PfList.Vehicle.Floating_Decoys <> nil) and
    (PfList.Vehicle.Floating_Decoys.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Floating Decoy');
    for i := 0 to PfList.Vehicle.Floating_Decoys.Count - 1 do
    begin
      float_decoy := PfList.Vehicle.Floating_Decoys[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Floating Decoy'),
        float_decoy.FData.Instance_Identifier + ' - ' + IntToStr
          (float_decoy.FData.Quantity));
    end;
  end;

  // infrared decoy
  if (PfList.Vehicle.Infrared_Decoys <> nil) and
    (PfList.Vehicle.Infrared_Decoys.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Infrared_Decoy');
    for i := 0 to PfList.Vehicle.Infrared_Decoys.Count - 1 do
    begin
      infra_decoy := PfList.Vehicle.Infrared_Decoys[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Infrared_Decoy'),
        infra_decoy.FData.Instance_Identifier + ' - ' + IntToStr
          (infra_decoy.FData.Infrared_Decoy_Qty_On_Board));
    end;
  end;

  // jammer
  if (PfList.Vehicle.Jammers <> nil) and (PfList.Vehicle.Jammers.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Jammers');
    for i := 0 to PfList.Vehicle.Jammers.Count - 1 do
    begin
      jammer := PfList.Vehicle.Jammers[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Jammers'), jammer.FData.Instance_Identifier + ' - 1');
    end;
  end;

  // point effect
  if (PfList.Vehicle.Point_Effects <> nil) and
    (PfList.Vehicle.Point_Effects.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Point Effect');
    for i := 0 to PfList.Vehicle.Point_Effects.Count - 1 do
    begin
      point := PfList.Vehicle.Point_Effects[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Point Effect'), point.FData.Instance_Identifier + ' - ' + IntToStr
          (point.FData.Quantity));
    end;
  end;

  // towed jammer
  if (PfList.Vehicle.Towed_Jammer_Decoys <> nil) and
    (PfList.Vehicle.Towed_Jammer_Decoys.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Towed Jammer Decoy');
    for i := 0 to PfList.Vehicle.Towed_Jammer_Decoys.Count - 1 do
    begin
      towed_jam := PfList.Vehicle.Towed_Jammer_Decoys[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Towed Jammer Decoy'),
        towed_jam.FData.Instance_Identifier + ' - ' + IntToStr
          (towed_jam.FData.Quantity));
    end;
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
}

procedure TfrmToteDisplay.btnSetXMLClick(sender: TObject);
begin
  TreeToXML(self.tvSettings);
end;

procedure TfrmToteDisplay.btnStandbyClick(Sender: TObject);
var
  flag : Integer;
  rec : TRecCmd_State_Logistic;

begin
  if LogisticSelectedPlatform = nil then
    Exit;

  rec.PlatfomID := LogisticSelectedPlatform.InstanceIndex;
  rec.ActionID  := LogisticActionID;
  rec.HoseID    := LogisticHoseID;

  if btnStandby.Caption = 'Standby' then
    rec.StateID := 1
  else if btnStandby.Caption = 'Idle' then
    rec.StateID := 0;

  simMgrClient.netSend_Cmd_State_Logistic(rec);
end;

procedure TfrmToteDisplay.btnStopDataLinkClick(Sender: TObject);
var
  rec : TRecCmd_DataLink;
begin
  if lvParticipatingUnits.Items.Count <= 0 then
    Exit;

  btnStopDataLink.Down := true;
  btnPlayDataLink.Down := false;

  if ContainsStr(edtDatalink.Text, '1') then
    rec.DataLinkID := 1
  else if ContainsStr(edtDatalink.Text, '2') then
    rec.DataLinkID := 2
  else if ContainsStr(edtDatalink.Text, '3') then
    rec.DataLinkID := 3
  else
    Exit;

  rec.OrderDL := odlStop;
  simMgrClient.netSend_Cmd_DataLink(rec);
end;

procedure TfrmToteDisplay.btnGetXMLClick(sender: TObject);
var
  XMLDoc: TXMLDocument;
  //temp: string;
  //i: Integer;
begin
  XMLDoc := TXMLDocument.Create(nil);

  // ShowMessage(temp);
  XMLToTree(tvSettings, XMLDoc);
  tvSettings.AutoExpand := False;
  tvSettings.Items[0].Expand(true);
end;

procedure TfrmToteDisplay.btnIdShipClick(Sender: TObject);
var
  Pos : TPoint;
begin
  inherited;
  GetCursorPos(pos);
  pmIdShip.Popup(Pos.X,Pos.y);
end;

procedure TfrmToteDisplay.btnWeaponEngagementClick(sender: TObject);
begin
  gbWeaponEngagementsSUmmary.BringToFront;
  lvWeaponEngagement.Columns[0].Width := 200;
  lvWeaponEngagement.Columns[1].Width := 200;
  lvWeaponEngagement.Columns[2].Width := 200;
  lvWeaponEngagement.Columns[3].Width := 200;
  lvWeaponEngagement.Columns[4].Width := 200;
end;

procedure TfrmToteDisplay.btSetTimeApplyClick(sender: TObject);
begin
  if tvSettings.Selected = nil then
    Exit;

  //changeValueTreeSettingItems(tvSettings.Selected, edtSetTime.Text);

  if tvSettings.Selected.SelectedIndex = 0 then exit;

  changeGameSettingValue(tvSettings.Selected.SelectedIndex,edtSetTime.Text);
end;

procedure TfrmToteDisplay.Button25Click(Sender: TObject);
var
  i,j,k : integer;
  AddChannel : TRecModifComm;
  ChannelMapping : TChannelMapping;
  aExternalCom : TExternal_Communication_Channel;
begin
  for i := 0 to lvIn.Items.Count - 1 do
  begin
    if lvIn.Items[i].Selected then
    begin
      for j := 0 to simMgrClient.ListComChannel.Count - 1 do
      begin
        ChannelMapping := TChannelMapping(simMgrClient.ListComChannel.Items[j]);
        if LowerCase(ChannelMapping.GroupName) = LowerCase(edtGroupName.Text) then
        begin
          for k := 0 to ChannelMapping.ListComChannelAvailable.Count - 1 do
          begin
            aExternalCom := TExternal_Communication_Channel(ChannelMapping.ListComChannelAvailable.items[k]);
            if aExternalCom.FData.Channel_Number = StrToInt(lvIn.Items[i].Caption) then
            begin
              AddChannel.GroupID := ChannelMapping.GroupID;
              AddChannel.Channel_Number := aExternalCom.FData.Channel_Number;
              AddChannel.Channel_Ident := aExternalCom.FData.Channel_Identifier;
              AddChannel.Channel_Code := aExternalCom.FData.Channel_Code;
              AddChannel.Channel_Frek := aExternalCom.FData.Channel_Freq;
              AddChannel.Channel_band := aExternalCom.FData.Comms_Band;
              case aExternalCom.FData.Channel_Security  of
                0 : AddChannel.Channel_Security := false;
                1 : AddChannel.Channel_Security := true;
              end;
              AddChannel.Channel_intfr := aExternalCom.FData.Channel_Interference;
              AddChannel.ModifStat := mcsAdd;

              SimMgrClient.netSend_ModifyCommunication(AddChannel);
              Sleep(10);

              Break;
            end;
          end;
          Break;
        end;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.Button26Click(Sender: TObject);
var
  i,j,k : integer;
  RemoveChannel : TRecModifComm;
  ChannelMapping : TChannelMapping;
  aExternalCom : TExternal_Communication_Channel;
begin
  for i := 0 to lvOut.Items.Count - 1 do
  begin
    if lvOut.Items[i].Selected then
    begin
      for j := 0 to simMgrClient.ListComChannel.Count - 1 do
      begin
        ChannelMapping := TChannelMapping(simMgrClient.ListComChannel.Items[j]);
        if LowerCase(ChannelMapping.GroupName) = LowerCase(edtGroupName.Text) then
        begin
          for k := 0 to ChannelMapping.ListComChannelMapping.Count - 1 do
          begin
            aExternalCom := TExternal_Communication_Channel(ChannelMapping.ListComChannelMapping.items[k]);
            if aExternalCom.FData.Channel_Number = StrToInt(lvOut.Items[i].Caption) then
            begin
              RemoveChannel.GroupID := ChannelMapping.GroupID;
              RemoveChannel.Channel_Number := aExternalCom.FData.Channel_Number;
              RemoveChannel.Channel_Ident := aExternalCom.FData.Channel_Identifier;
              RemoveChannel.Channel_Code := aExternalCom.FData.Channel_Code;
              RemoveChannel.Channel_Frek := aExternalCom.FData.Channel_Freq;
              RemoveChannel.Channel_band := aExternalCom.FData.Comms_Band;
              case aExternalCom.FData.Channel_Security  of
                0 : RemoveChannel.Channel_Security := false;
                1 : RemoveChannel.Channel_Security := true;
              end;
              RemoveChannel.Channel_intfr := aExternalCom.FData.Channel_Interference;
              RemoveChannel.ModifStat := mcsRemove;

              SimMgrClient.netSend_ModifyCommunication(RemoveChannel);
              Sleep(10);

              Break;
            end;
          end;
          Break;
        end;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.Button27Click(Sender: TObject);
var
  I: Integer;
  li : TListItem;
  item : TT3DLEligibleUnitItem;
  rec : TRecCmd_DataLink;
begin
  if lvEligibleUnits.Items.Count <= 0 then
    Exit;

  if lvEligibleUnits.Selected = nil then
    Exit;

  //mekanisme penambahan pada list participant
  for I := 0 to lvEligibleUnits.Items.Count - 1 do
  begin
    li := lvEligibleUnits.Items[I];
    if li.Selected then //jika diselect
    begin
      item := li.Data;

      rec.platformID := item.EUPlatform.InstanceIndex;

      if ContainsStr(edtDatalink.Text, '1') then
        rec.DataLinkID := 1
      else if ContainsStr(edtDatalink.Text, '2') then
        rec.DataLinkID := 2
      else if ContainsStr(edtDatalink.Text, '3') then
        rec.DataLinkID := 3;

      rec.OrderDL := odlAdd;

      simMgrClient.netSend_Cmd_DataLink(rec);
    end;
  end;

  //mekanisme penghapusan setelah pemindahan;
  lvEligibleUnits.DeleteSelected;
end;

procedure TfrmToteDisplay.Button28Click(Sender: TObject);
var
  I : Integer;
  li : TListItem;
  rec,recOffline : TRecCmd_DataLink;
  item : TT3DLParticipatingUnitItem;
begin
  if lvParticipatingUnits.Items.Count <= 0 then
    Exit;
  if lvParticipatingUnits.Selected = nil then
    Exit;

  //mekanisme penambahan pada list participant
  for I := 0 to lvParticipatingUnits.Items.Count - 1 do
  begin
    li := lvParticipatingUnits.Items[I];
    if li.Selected then //jika diselect
    begin
      item := li.Data;
      rec.platformID := item.PUPlatform.InstanceIndex;

      if ContainsStr(edtDatalink.Text, '1') then
        rec.DataLinkID := 1
      else if ContainsStr(edtDatalink.Text, '2') then
        rec.DataLinkID := 2
      else if ContainsStr(edtDatalink.Text, '3') then
        rec.DataLinkID := 3;

      if item.PUNetCenter then begin
        InitialDatalinkRec(recOffline,simMgrClient.DataLinkManager.getDatalink(rec.DataLinkID));

        recOffline.OrderDL := odlStop;
        simMgrClient.netSend_Cmd_DataLink(recOffline);
      end;

      rec.OrderDL := odlRemove;
      simMgrClient.netSend_Cmd_DataLink(rec);
    end;
  end;
end;

procedure TfrmToteDisplay.Button31Click(Sender: TObject);
var
  item : TT3DLParticipatingUnitItem;
  rec : TRecCmd_DataLink;
begin
  if lvParticipatingUnits.Selected = nil then
    Exit;

  item := lvParticipatingUnits.Selected.Data;
  rec.platformID := item.PUPlatform.InstanceIndex;

  if ContainsStr(edtDatalink.Text, '1') then
    rec.DataLinkID := 1
  else if ContainsStr(edtDatalink.Text, '2') then
    rec.DataLinkID := 2
  else if ContainsStr(edtDatalink.Text, '3') then
    rec.DataLinkID := 3;

  rec.OrderDL := odlActivate;

  simMgrClient.netSend_Cmd_DataLink(rec);
end;

procedure TfrmToteDisplay.Button32Click(Sender: TObject);
var
  RecSend : TRecRecordVoice;
  GameInterval : Double;
begin
  //add to Track
  if lvRecordIn.Selected <> nil then
  begin
    with lvRecordOut.Items.Add do
    begin
      Caption := lvRecordIn.Selected.Caption;
      SubItems.Add(lvRecordIn.Selected.SubItems[0]);
      SubItems.Add(lvRecordIn.Selected.SubItems[1]);
    end;

    GameInterval := simMgrClient.GameTIME - simMgrClient.MainVTime.DateTimeOffset;
    GameInterval := Round(GameInterval * 24 * 3600) * 1000 { In Millisecond 1000x};

    With RecSend do
    begin
      ControllerID  := simMgrClient.ConsoleName;
      ChannelID     := StrToInt(lvRecordIn.Selected.Caption);
      ChannelName   := lvRecordIn.Selected.SubItems[0];
      ChannelCode   := lvRecordIn.Selected.SubItems[1];
      ModifStat     := 1;
      TimeInterval  := GameInterval;
    end;

    if simMgrClient.GameSPEED = 1.0 then
      simMgrClient.netSend_CmdRecordAudio(RecSend);

    lvRecordIn.Selected.Delete;
  end;
end;

procedure TfrmToteDisplay.Button33Click(Sender: TObject);
var
  RecSend : TRecRecordVoice;
  GameInterval : Double;
begin
  //remove from track
  if lvRecordOut.Selected <> nil then
  begin
    with lvRecordIn.Items.Add do
    begin
      Caption := lvRecordOut.Selected.Caption;
      SubItems.Add(lvRecordOut.Selected.SubItems[0]);
      SubItems.Add(lvRecordOut.Selected.SubItems[1]);
    end;

    GameInterval := simMgrClient.GameTIME - simMgrClient.MainVTime.DateTimeOffset;
    GameInterval := Round(GameInterval * 24 * 3600) * 1000 { In Millisecond 1000x};

    With RecSend do
    begin
      ControllerID  := simMgrClient.ConsoleName;
      ChannelID     := StrToInt(lvRecordOut.Selected.Caption);
      ChannelName   := lvRecordOut.Selected.SubItems[0];
      ChannelCode   := lvRecordOut.Selected.SubItems[1];
      ModifStat     := 2;
      TimeInterval  := GameInterval;
    end;
    simMgrClient.netSend_CmdRecordAudio(RecSend);

    lvRecordOut.Selected.Delete;
  end;
end;

procedure TfrmToteDisplay.countCurrentEffect;
{var
  v : TT3Vehicle;  }
begin
  {
  OceanCurrentDirection := strtofloat(edtOceanCurrentDirection.Text);
  OceanCurrentSpeed     := strtofloat(edtOceanCurrentSpeed.Text);

  if OceanCurrentSpeed = 0 then
    isOceanCurrentEffect := False
  else
  begin
    isOceanCurrentEffect := True;

    v := simMgrClient.ControlledPlatform as TT3Vehicle;

    v.fCalculationEnvironment.OceanCurrentDirection := OceanCurrentDirection;
    v.fCalculationEnvironment.OceanCurrentSpeed := OceanCurrentSpeed;

    //CurrentHeading := v.getRecentDirectionShip(OrderedHeading, OceanCurrentDirection, OrderedSpeed, OceanCurrentSpeed);
    CurrentSpeed   := v.getRecentSpeedShip(OrderedHeading, OceanCurrentDirection, OrderedSpeed, OceanCurrentSpeed);
    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE, CORD_TYPE_COURSE, CurrentHeading);
    SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE, CORD_TYPE_SPEED, CurrentSpeed);
  end;
  }
end;

procedure TfrmToteDisplay.sendWindDir;
var
  Wind_Direction : Double;
  rec: TrecSinc_Envi;
  env : TEnvi;
begin
   TryStrToFloat(edtWindDir.Text, Wind_Direction);
   edtWindDir.Text := ' ';
   with rec do
   begin
     rec.Envi_Chance := 2;
     if lvEnviroArea.ItemIndex <> -1 then
       rec.Envi_Type := lvEnviroArea.ItemIndex
     else
       rec.Envi_Type := 0;

     rec.Value       := Wind_Direction;
   end;

   if Assigned(lvEnviroArea.Selected) then
   begin
     env := lvEnviroArea.Selected.Data;

     if env is TSubArea_Enviro_Definition then
      rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
     else
      rec.Sub_EnviID := 0;
   end;

   simMgrClient.netSend_CmdSyncEnvi(rec);
end;

procedure TfrmToteDisplay.sendWindSpeed;
var
  Wind_Speed : Double;
  rec: TrecSinc_Envi;
  env : TEnvi;
begin
   TryStrToFloat(edtWindSpeed.Text, Wind_Speed);
   edtWindSpeed.Text := ' ';
   with rec do
   begin
     rec.Envi_Chance := 1;
     if lvEnviroArea.ItemIndex <> -1 then
       rec.Envi_Type := lvEnviroArea.ItemIndex
     else
       rec.Envi_Type := 0;

     rec.Value       := Wind_Speed;

   end;

   if Assigned(lvEnviroArea.Selected) then
   begin
     env := lvEnviroArea.Selected.Data;

     if env is TSubArea_Enviro_Definition then
      rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
     else
      rec.Sub_EnviID := 0;
   end;

   simMgrClient.netSend_CmdSyncEnvi(rec);
end;

procedure TfrmToteDisplay.sendDayTimeVis;
var
  dayVis: Double;
  rec: TrecSinc_Envi;
  env : TEnvi;
begin
   TryStrToFloat(edtDayVis.Text, dayVis);
   edtDayVis.Text := ' ';
   with rec do
   begin
     rec.Envi_Chance := 3;
     if lvEnviroArea.ItemIndex <> -1 then
       rec.Envi_Type := lvEnviroArea.ItemIndex
     else
       rec.Envi_Type := 0;

     rec.Value       := dayVis;
   end;

   if Assigned(lvEnviroArea.Selected) then
   begin
     env := lvEnviroArea.Selected.Data;

     if env is TSubArea_Enviro_Definition then
      rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
     else
      rec.Sub_EnviID := 0;
   end;

   simMgrClient.netSend_CmdSyncEnvi(rec);
end;

procedure TfrmToteDisplay.sendNightTimeVis;
var
  nightVis: Double;
  rec: TrecSinc_Envi;
  env : TEnvi;
begin
   TryStrToFloat(edtNightVis.Text, nightVis);
   edtNightVis.Text := ' ';
   with rec do
   begin
     rec.Envi_Chance := 4;
     if lvEnviroArea.ItemIndex <> -1 then
       rec.Envi_Type := lvEnviroArea.ItemIndex
     else
       rec.Envi_Type := 0;

     rec.Value       := nightVis;

   end;

   if Assigned(lvEnviroArea.Selected) then
   begin
     env := lvEnviroArea.Selected.Data;

     if env is TSubArea_Enviro_Definition then
      rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
     else
      rec.Sub_EnviID := 0;
   end;

   simMgrClient.netSend_CmdSyncEnvi(rec);
end;

procedure TfrmToteDisplay.sendOceanCurDir;
var
  OceanCurrent_Direction : Double;
  rec: TrecSinc_Envi;
  env : TEnvi;
begin
   TryStrToFloat(edtOceanCurrentDirection.Text, OceanCurrent_Direction);
   edtOceanCurrentDirection.Text := ' ';
   with rec do
   begin
     rec.Envi_Chance := 15;
     if lvEnviroArea.ItemIndex <> -1 then
       rec.Envi_Type := lvEnviroArea.ItemIndex
     else
       rec.Envi_Type := 0;

     rec.Value       := OceanCurrent_Direction;

   end;

   if Assigned(lvEnviroArea.Selected) then
   begin
     env := lvEnviroArea.Selected.Data;

     if env is TSubArea_Enviro_Definition then
      rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
     else
      rec.Sub_EnviID := 0;
   end;

   simMgrClient.netSend_CmdSyncEnvi(rec);
end;

procedure TfrmToteDisplay.sendOceanCurSpeed;
var
  OceanCurrent_Speed : Double;
  rec: TrecSinc_Envi;
  env : TEnvi;
begin
   TryStrToFloat(edtOceanCurrentSpeed.Text, OceanCurrent_Speed);
   edtOceanCurrentSpeed.Text := ' ';
   with rec do
   begin
     rec.Envi_Chance := 14;

     if lvEnviroArea.ItemIndex <> -1 then
       rec.Envi_Type := lvEnviroArea.ItemIndex
     else
       rec.Envi_Type := 0;

     rec.Value       := OceanCurrent_Speed;

   end;

   if Assigned(lvEnviroArea.Selected) then
   begin
     env := lvEnviroArea.Selected.Data;

     if env is TSubArea_Enviro_Definition then
      rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
     else
      rec.Sub_EnviID := 0;
   end;

   simMgrClient.netSend_CmdSyncEnvi(rec);
end;

procedure TfrmToteDisplay.SendAllEnviAboveWater;
var
  rec : TrecSinc_Envi;
  env : TEnvi;
  ValueData : Double;
begin
  with rec do
  begin
    if Assigned(lvEnviroArea.Selected) then
    begin
      env := lvEnviroArea.Selected.Data;

      if env is TSubArea_Enviro_Definition then
        Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
      else
        Sub_EnviID := 0;
    end;

    if lvEnviroArea.ItemIndex <> -1 then
      Envi_Type := lvEnviroArea.ItemIndex
    else
      Envi_Type := 0;
  end;

  //---------------set envi wind direction--------------------//
  if TryStrToFloat(edtWindDir.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Wind_Direction <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Wind_Direction;
      Value := Round(rw.Degree);
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi wind speed--------------------//
  if TryStrToFloat(edtWindSpeed.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Wind_Speed <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Wind_Speed;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi day time visual--------------------//
  if TryStrToFloat(edtDayVis.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Daytime_Visual_Modifier <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Daytime_Visual_Modifier;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi night time visual--------------------//
  if TryStrToFloat(edtNightVis.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Nighttime_Visual_Modifier <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Nighttime_Visual_Modifier;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi day time infrared--------------------//
  if TryStrToFloat(edtDayInfra.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Daytime_Infrared_Modifier <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Daytime_Infrared_Modifier;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi night time infrared--------------------//
  if TryStrToFloat(edtNightInfra.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Nighttime_Infrared_Modifier <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Nighttime_Infrared_Modifier;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi rain rate--------------------//
  if TryStrToFloat(edtAttenRainRate.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Rain_Rate <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Rain_Rate;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi cloud attenuation--------------------//
  if TryStrToFloat(edtAttenCloud.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Cloud_Attenuation <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Cloud_Attenuation;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi Barometric preasure--------------------//
  if TryStrToFloat(edtBarometricPressure.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Barometric_Pressure <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Barometric_Pressure;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi Air Temperature--------------------//
  if TryStrToFloat(edtAirTemp.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Air_Temperature <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Air_Temperature;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envvi cloud base height--------------------//
  if TryStrToFloat(edtCloudBaseHeight.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Cloud_Base_Height <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Cloud_Base_Height;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi atmospheric refraction--------------------//
  if TryStrToFloat(edtAtmRefract.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Atmospheric_Refract_Modifier <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Atmospheric_Refract_Modifier;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
end;

procedure TfrmToteDisplay.SendAllEnviDataSurfaceSubsurface;
var
  rec : TrecSinc_Envi;
  env : TEnvi;
  ValueData : Double;
  ValueInt : Integer;
begin
  with rec do
  begin
    if Assigned(lvEnviroArea.Selected) then
    begin
      env := lvEnviroArea.Selected.Data;

      if env is TSubArea_Enviro_Definition then
        Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
      else
        Sub_EnviID := 0;
    end;

    if lvEnviroArea.ItemIndex <> -1 then
      Envi_Type := lvEnviroArea.ItemIndex
    else
      Envi_Type := 0;
  end;

  //---------------set envi ocean current direction--------------------//
  if TryStrToFloat(edtOceanCurrentDirection.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Ocean_Current_Direction <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Ocean_Current_Direction;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi ocean current speed--------------------//
  if TryStrToFloat(edtOceanCurrentSpeed.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Ocean_Current_Speed <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Ocean_Current_Speed;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi shiping rate--------------------//
  if simMgrClient.GameEnvironment.FData.Shipping_Rate <> cbxShippingRate.ItemIndex then
  begin
    with rec do
    begin
      Envi_Chance := E_Shipping_Rate;
      Value := cbxShippingRate.ItemIndex;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi depht of thermal layer--------------------//
  if TryStrToFloat(edtDepthTermalLayer.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Thermal_Layer_Depth <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Thermal_Layer_Depth;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi speed of sound surface--------------------//
  if TryStrToFloat(edtSpeedOfSoundSurface.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Surface_Sound_Speed <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Surface_Sound_Speed;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi speed of sound layer--------------------//
  if TryStrToFloat(edtSpeedOfSoundlayer.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Layer_Sound_Speed <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Layer_Sound_Speed;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi speed of sound bottom--------------------//
  if TryStrToFloat(edtSpeedOfSoundBottom.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Bottom_Sound_Speed <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Bottom_Sound_Speed;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi upper limit surface ducting--------------------//
  if TryStrToFloat(edtSurfaceDuctUp.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Upper_Limit_Surface_Duct_Depth <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Upper_Limit_Surface_Duct_Depth;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi lower limit surface ducting--------------------//
  if TryStrToFloat(edtSurfaceDuctLow.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Lower_Limit_Surface_Duct_Depth <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Lower_Limit_Surface_Duct_Depth;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi upper limit subsurface ducting--------------------//
  if TryStrToFloat(edtSubSurfaceDuctUp.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Upper_Limit_Sub_Duct_Depth <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Upper_Limit_Sub_Duct_Depth;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi lower limit subsurface ducting--------------------//
  if TryStrToFloat(edtSubSurfaceDuctLow.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Lower_Limit_Sub_Duct_Depth <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Lower_Limit_Sub_Duct_Depth;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi sea state--------------------//
  if TryStrToInt(edtSeaState.Text, ValueInt) and
    (simMgrClient.GameEnvironment.FData.Sea_State <> ValueInt) then
  begin
    with rec do
    begin
      Envi_Chance := E_Sea_State;
      Value := ValueInt;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi bottom loss coefficient--------------------//
  if TryStrToFloat(edtBottomLost.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Bottomloss_Coefficient <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Bottomloss_Coefficient;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi surface temperature--------------------//
  if TryStrToFloat(edtSurfaceTemperatur.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Surface_Temperature <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Surface_Temperature;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi average ocean depth--------------------//
  if TryStrToFloat(edtAvgOceanDepth.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Ave_Ocean_Depth <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Ave_Ocean_Depth;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
  //---------------set envi shadow zone transmision loss--------------------//
  if TryStrToFloat(edtShadowZone.Text, ValueData) and
    (simMgrClient.GameEnvironment.FData.Shadow_Zone_Trans_Loss <> ValueData) then
  begin
    with rec do
    begin
      Envi_Chance := E_Shadow_Zone_Trans_Loss;
      Value := ValueData;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
end;

procedure TfrmToteDisplay.applyEnviAboveWater;
begin
  SendAllEnviAboveWater;
end;

procedure TfrmToteDisplay.applyEnviSurfaceSubsurface;
begin
  SendAllEnviDataSurfaceSubsurface;
end;

procedure TfrmToteDisplay.btnApplyEnviClick(Sender: TObject);
begin
  applyEnviAboveWater;
  applyEnviSurfaceSubsurface;
end;

procedure TfrmToteDisplay.btSelectHookedPlatformClick(sender: TObject);
var
  I, Index : Integer;
begin
  Index := 0;

  if CategoryPanelStatusOp.Enabled then
  begin
    if frmTacticalDisplay.cbAssumeControl.ItemIndex <> 0 then
    begin
      lvPlatforms.ItemIndex := frmTacticalDisplay.cbAssumeControl.ItemIndex;
      lvPlatforms.SetFocus;
    end
    else
    begin
      for I := 0 to lvPlatforms.Items.Count - 1 do
      begin
        if TT3PlatformInstance(lvPlatforms.Items[I].Data).InstanceIndex = TT3PlatformInstance(frmTacticalDisplay.cbAssumeControl.Items.Objects[frmTacticalDisplay.cbAssumeControl.ItemIndex]).InstanceIndex then
        begin
          Index := I;
          break;
        end;
      end;

      lvPlatforms.ItemIndex := Index;
      lvPlatforms.SetFocus;
    end;
  end;
end;

procedure TfrmToteDisplay.btSetDistanceApplyClick(sender: TObject);
begin
  if tvSettings.Selected = nil then
    Exit;

  //changeValueTreeSettingItems(tvSettings.Selected, edtDistance.Text);
  changeGameSettingValue(tvSettings.Selected.SelectedIndex,edtDistance.Text);
end;

procedure TfrmToteDisplay.btSetPercentageClick(sender: TObject);
begin
  if tvSettings.Selected = nil then
    Exit;

  //changeValueTreeSettingItems(tvSettings.Selected, edtPercentage.Text);
  changeGameSettingValue(tvSettings.Selected.SelectedIndex,edtPercentage.Text);
end;

procedure TfrmToteDisplay.btnCancelEnviClick(Sender: TObject);
begin
// v
end;

procedure TfrmToteDisplay.ForceRed1Click(Sender: TObject);
var
  forceColor : string;
  rec : TRecCmd_DataLink;
begin
  if Trim(edtDatalink.Text) = '' then Exit;

  case TMenuItem(Sender).Tag of
    1:
      begin
        forceColor := 'Force Red';
      end;
    2:
      begin
        forceColor := 'Force Yellow';
      end;
    3:
      begin
        forceColor := 'Force Blue';
      end;
    4:
      begin
        forceColor := 'Force Green';
      end;
    5:
      begin
        forceColor := 'No Force';
      end;
    6:
      begin
        forceColor := 'Force Black';
      end;
  end;

  edtDLForce.Text := forceColor;

  if ContainsStr(edtDatalink.Text, '1') then
    rec.DataLinkID := 1
  else if ContainsStr(edtDatalink.Text, '2') then
    rec.DataLinkID := 2
  else if ContainsStr(edtDatalink.Text, '3') then
    rec.DataLinkID := 3;

  rec.Force := TMenuItem(Sender).Tag;
  rec.OrderDL := odlForce;

  simMgrClient.netSend_Cmd_DataLink(rec);

end;

procedure TfrmToteDisplay.FormActivate(Sender: TObject);
begin
  if not Assigned(frmKeyboard) then
    Exit;
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmToteDisplay.FormCreate(sender: TObject);
var
  i: Integer;
  obj : TSimObject;
begin
  // DoubleBuffered := True;
  StatusBar1.Color := RGB(43, 44, 47);

  if Screen.MonitorCount > 1 then
    i := 1
  else
    i := 0;

  DefaultMonitor := dmDesktop;

  Width := Screen.Monitors[vGameDataSetting.ToteScreen].Width;
  Height := Screen.Monitors[vGameDataSetting.ToteScreen].Height;
  Left := Screen.Monitors[vGameDataSetting.ToteScreen].Left;
  Top := Screen.Monitors[vGameDataSetting.ToteScreen].Top;

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

  setWheel;
  setDefaultHeaderMissile;
  SetDefaultWidthForStringGridMissileEngagement;
  tvSettings.Items[0].Expand(true);

  pnlPlatSensor.Height := 300;
  pnlPlatWeapon.Height := 300;

  { setting header pada string grid }
  setHeaderEmitter;
  setHeaderDataLinkControl;
  setHeaderMergedTrack;
  setHeaderMessageHandling;
  setHeaderAudioRecord;

  setHeaderCommInInjection;

  listTimeEngage := TList.Create;
  listTimeLaunch := TList.Create;

  PopUpMenu := TPopupMenu.Create(nil);
  CpPopUpMenu := TPopupMenu.Create(nil);

  AdjustComponentDisplayPosition;
  Show;
  Repaint;

  frmTacticalDisplay.FormStyle := fsNormal;

  //=============
//  FAssetListenerList := TList.Create;
  FLastPlatform := nil;
  lvEventSummary.StateImages := ImageList1;
  lvPlatformEmbarkDisembark.StateImages := ImageList1;

  mList := TList.Create;

  isSender := False;
  isSenderPersonel := False;

  PersonelOnBaseSelected := TPersonel.Create;
  PersonelOnShipSelected := TPersonel.Create;

  LandingPlatformID := 160;
  LandingPlatformName := 'LCU';
  LastButton := 1;


end;

procedure TfrmToteDisplay.Initialize;
var
  i: Integer;
  obj : TSimObject;
  node : TTreeNode;
  str : string;
begin
  if Screen.MonitorCount > 1 then
  begin
    Width := Screen.Monitors[vGameDataSetting.ToteScreen].Width;
    Height := Screen.Monitors[vGameDataSetting.ToteScreen].Height;
    Left := Screen.Monitors[vGameDataSetting.ToteScreen].Left;
    Top := Screen.Monitors[vGameDataSetting.ToteScreen].Top;
  end
  else
  begin
    Width := Screen.Monitors[0].Width;
    Height := Screen.Monitors[0].Height;
    Left := Screen.Monitors[0].Left;
    Top := Screen.Monitors[0].Top;
  end;


  for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
  begin
    obj := simMgrClient.SimPlatforms.getObject(i);
    if obj is TT3Vehicle then
    begin
      if TT3Vehicle(obj).DormantTime > 0 then
      begin

        if tvSettings.Items.Count <= 0 then exit;

        node := GetItemByIndex(tvSettings.Items.Item[0],GSID_WRECKTIME);
        if node <> nil then
        begin
          str := getValueNodeSettingItems(node);
          node.Text := ReplaceStr(node.Text, str, SecondToTimeString(TT3Vehicle(obj).DormantTime));
        end;
//          node,SecondToTimeString(Value));
        Break;
      end;
    end;
  end;

  // responsive for wasdal samping
  if not ContainsText(simMgrClient.ConsoleName, 'Wasdal') then pnlSideBar.Width := 302
  else if ContainsText(simMgrClient.ConsoleName, 'Tengah') then pnlSideBar.Width := 302
  else begin
    pnlEnvironmentDisplay.Height := pnlEnvironmentDisplay.Height - 85;
    pnlEnvironmentDisplay.Width := 1332;
    pnlRainDisplay.Height := pnlRainDisplay.Height - 85;
    pnlRainDisplay.Width := 1332;
    imgSeaStateDisplay.Top := imgSeaStateDisplay.Top - 85;
    pnlStateDisplay.Top := pnlStateDisplay.Top - 85;
    pnlStateDisplay.Height := 135;
    pnlStateDisplay.Width := 1332;
    imgCloudState.Height := imgCloudState.Height -15;
    imgRainState.Height := imgRainState.Height -15;
    imgSeaState.Height := imgSeaState.Height -15;
    imgCloudState.Width := imgCloudState.Width -15;
    imgRainState.Width := imgRainState.Width -15;
    imgSeaState.Width := imgSeaState.Width -15;
    imgCloudState.Left := imgCloudState.Left -56;
    imgSeaState.Left := imgSeaState.Left -112;
    lblCloudAtten.Left := lblCloudAtten.Left - 56;
    lblCloudAttenDesc.Left := lblCloudAttenDesc.Left -56;
    lblSeaStat.Left := lblSeaStat.Left - 112;
    lblSeaStatDesc.Left := lblSeaStatDesc.Left -112;
    lblCloudAtten.Top := lblCloudAtten.Top - 7;
    lblCloudAttenDesc.Top := lblCloudAttenDesc.Top -7;
    lblSeaStat.Top := lblSeaStat.Top - 7;
    lblSeaStatDesc.Top := lblSeaStatDesc.Top -7;
    pnlOceanWind.Top := pnlOceanWind.Top - 100;
    imgWindDirection.Left := imgWindDirection.Left - 56;
    imgWindSpeed.Left := imgWindSpeed.Left - 56;
    lblWindDirection.Left := lblWindDirection.Left - 56;
    lblWindSpeed.Left := lblWindSpeed.Left - 56;
    lblDirectionWindTrue.Left := lblDirectionWindTrue.Left - 56;
    lblSpeedWIndTrue.Left := lblSpeedWIndTrue.Left - 56;
    imgOceanIndicator.Left := imgOceanIndicator.Left - 56;
    imgOceanNeedle.Left := imgOceanNeedle.Left - 56;
    pnlWindDisplay.Width := pnlWindDisplay.Width - 56;
    pnlOtherIndicator.Top := pnlOtherIndicator.Top - 125;
    pnlOtherIndicator.Left := 310;
    pnlPlatSensor.Height := 320;
    imgBgState.Picture.LoadFromFile('data\Image Interface\Tote\State\Small.png');
  end;
end;

procedure TfrmToteDisplay.FormDestroy(sender: TObject);
begin
  ObjectCommunicationDestroy;
  if Assigned (ToteSelectedPlatform) then
    RemoveAssetListener(ToteSelectedPlatform);
//  FAssetListenerList.Free;
end;

procedure TfrmToteDisplay.FormResize(sender: TObject);
begin
  // AdjustComponentDisplayPosition;
end;

procedure TfrmToteDisplay.frxRprtSummGetValue(const VarName: string;
  var Value: Variant);
//var
//  shp : TfrxShapeView;
//  mem : TfrxMemoView;
begin
//  if CompareText(VarName, 'elementF') = 0 then
//  begin
//    Value := lvEventSummary.Items[frxUsrdtstSumm.RecNo].Caption;
//    shp := frxRprtSumm.FindObject('Shape1') as TfrxShapeView;
////    mem := frxRprtSumm.FindObject('Memo1') as TfrxMemoView;
//    {mewarnai rectangle}
//    if lvEventSummary.Items.Item[frxUsrdtstSumm.RecNo].Caption = 'Black' then
//      shp.Color := clBlack
//    else if lvEventSummary.Items.Item[frxUsrdtstSumm.RecNo].Caption = 'Red' then
//      shp.Color := clRed
//    else if lvEventSummary.Items.Item[frxUsrdtstSumm.RecNo].Caption = 'Yellow' then
//      shp.Color := clYellow
//    else if lvEventSummary.Items.Item[frxUsrdtstSumm.RecNo].Caption = 'Blue' then
//      shp.Color := clBlue
//    else if lvEventSummary.Items.Item[frxUsrdtstSumm.RecNo].Caption = 'Green' then
//      shp.Color := clLime
//    else if lvEventSummary.Items.Item[frxUsrdtstSumm.RecNo].Caption = 'White' then
//      shp.Color := clWhite;
//
//  end;
//  if CompareText(VarName, 'elementT') = 0 then
//    Value := lvEventSummary.Items[frxUsrdtstSumm.RecNo].SubItems[0];
//  if CompareText(VarName, 'elementP') = 0 then
//    Value := lvEventSummary.Items[frxUsrdtstSumm.RecNo].SubItems[1];
//  if CompareText(VarName, 'elementA') = 0 then
//    Value := lvEventSummary.Items[frxUsrdtstSumm.RecNo].SubItems[2];
end;

procedure TfrmToteDisplay.Label14Click(Sender: TObject);
begin
  gbCommunicationsChannelDefinition.BringToFront;
  tmrEnviDisplay.Enabled := False;
end;

procedure TfrmToteDisplay.lvParticipatingUnitsEdited(Sender: TObject;
  Item: TListItem; var S: string);
//var
//  oldS : String;
//  idxDataLink : integer;
//  datalink : TT3DataLink;
//  aValue : Integer;
//  iData : TT3DLParticipatingUnitItem;
begin
//  oldS := S;
//  if ContainsStr(edtDatalink.Text, '1') then
//    idxDataLink := 1
//  else if ContainsStr(edtDatalink.Text, '2') then
//    idxDataLink := 2
//  else if ContainsStr(edtDatalink.Text, '3') then
//    idxDataLink := 3;
//  iData := Item.Data;

//  datalink := simMgrClient.DataLinkManager.getDatalink(idxDataLink);
//  if ASsigned(datalink) then
//  begin
//    if TryStrToInt(S,aValue) then begin
//      if aValue > 0 then
//        if not datalink.ParticipatingUnitNumberExist(aValue) then begin
//          datalink.SetParticipatingUnitNumber(iData.PUPlatform,aValue);
//          SetDataLink(datalink);
//        end;
//    end
//    else
//      S := oldS;
//  end;

end;

procedure TfrmToteDisplay.lvPlatformsCustomDrawItem(sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if (lvPlatforms.ItemIndex <> -1) or (lvPlatforms.Selected = Item) then
  begin
    Canvas.Brush.Color := clGray;
  end;
end;

procedure TfrmToteDisplay.lvPlatformsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos : TPoint;
  I, index : Integer;
begin

  if (lvPlatforms.Selected = nil) or (lvPlatforms.ItemIndex = -1)then
  begin
    if Assigned(simMgrClient.ControlledPlatform) then
    begin
      simMgrClient.ControlledPlatform.Selected := True;
      Exit;
    end;
  end;

  for I := 0 to frmTacticalDisplay.cbAssumeControl.Items.Count - 1 do
  begin
    if Assigned(lvPlatforms.Selected) and (TT3PlatformInstance(frmTacticalDisplay.cbAssumeControl.Items.Objects[I]).InstanceIndex = TT3PlatformInstance(lvPlatforms.Selected.Data).InstanceIndex) then
    begin
      index := I;
      frmTacticalDisplay.cbAssumeControl.ItemIndex := index;
      frmTacticalDisplay.cbAssumeControlChange(self);
      frmTacticalDisplay.Map1.Repaint;
      Break;
    end;
    if Assigned(lvPlatformEmbarkDisembark.Selected) and (TT3PlatformInstance(frmTacticalDisplay.cbAssumeControl.Items.Objects[I]).InstanceIndex = TT3PlatformInstance(lvPlatformEmbarkDisembark.Selected.Data).InstanceIndex) then
    begin
      index := I;
      frmTacticalDisplay.cbAssumeControl.ItemIndex := index;
      frmTacticalDisplay.cbAssumeControlChange(self);
      frmTacticalDisplay.Map1.Repaint;
      Break;
    end;
  end;

  if not simMgrClient.ISInstructor or not simMgrClient.ISWasdal then Exit;

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then begin
    GetCursorPos(pos);
    if (Button = mbRight) and (lvPlatforms.Selected <> nil){ or (lvPlatformEmbarkDisembark.Selected <> nil)} then
    begin
      pmPlatformLV.Popup(pos.X, pos.Y);
    end;
  end;
end;

procedure TfrmToteDisplay.StatusOperationClick(sender: TObject);
begin

  lvSystemState.Selected.SubItems[0] := 'Operation';
end;

procedure TfrmToteDisplay.StatusPercentageClick(sender: TObject);
begin

  lvSystemState.Selected.Focused := true;
end;

procedure TfrmToteDisplay.StatusEnableClick(sender: TObject);
begin

  lvSystemState.Selected.SubItems[0] := 'On';
end;

procedure TfrmToteDisplay.StatusPendingClick(sender: TObject);
begin

  lvSystemState.Selected.SubItems[0] := 'Pending';
end;

procedure TfrmToteDisplay.btnDataLinkStatusClick(Sender: TObject);
begin
  lvDS2.Clear;
end;

procedure TfrmToteDisplay.btnDetailLogisticClick(Sender: TObject);
begin
  frmPlatformBaseDetail.BaseId := LogisticBaseID;
  frmPlatformBaseDetail.ShowModal;
end;

procedure TfrmToteDisplay.SoundVelocityClick(Sender: TObject);
var
  rec: TrecSinc_Envi;
  env : TEnvi;
begin
  case TButton(Sender).Tag of
    0 :
      begin
//        Label203.Alignment := taCenter;
//        Label203.Caption := 'Positive';

        with rec do
        begin
          rec.Envi_Chance := E_Sound_Velocity_Type;

          if lvEnviroArea.ItemIndex <> -1 then
            rec.Envi_Type := lvEnviroArea.ItemIndex
          else
            rec.Envi_Type := 0;

          rec.Value       := 0;

        end;

        if Assigned(lvEnviroArea.Selected) then
        begin
         env := lvEnviroArea.Selected.Data;

          if env is TSubArea_Enviro_Definition then
            rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
          else
            rec.Sub_EnviID := 0;
        end;

        simMgrClient.netSend_CmdSyncEnvi(rec);
      end;
    1 :
      begin
//        Label203.Alignment := taCenter;
//        Label203.Caption := 'Negative';

        with rec do
        begin
          rec.Envi_Chance := E_Sound_Velocity_Type;

          if lvEnviroArea.ItemIndex <> -1 then
            rec.Envi_Type := lvEnviroArea.ItemIndex
          else
            rec.Envi_Type := 0;

          rec.Value       := 1;

        end;

        if Assigned(lvEnviroArea.Selected) then
        begin
         env := lvEnviroArea.Selected.Data;

          if env is TSubArea_Enviro_Definition then
            rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
          else
            rec.Sub_EnviID := 0;
        end;

        simMgrClient.netSend_CmdSyncEnvi(rec);
      end;
    2 :
      begin
//        Label203.Alignment := taCenter;
//        Label203.Caption := 'Positive over negative';

        with rec do
        begin
          rec.Envi_Chance := E_Sound_Velocity_Type;

          if lvEnviroArea.ItemIndex <> -1 then
            rec.Envi_Type := lvEnviroArea.ItemIndex
          else
            rec.Envi_Type := 0;

          rec.Value       := 2;

        end;

        if Assigned(lvEnviroArea.Selected) then
        begin
         env := lvEnviroArea.Selected.Data;

          if env is TSubArea_Enviro_Definition then
            rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
          else
            rec.Sub_EnviID := 0;
        end;

        simMgrClient.netSend_CmdSyncEnvi(rec);
      end;
    3 :
      begin
//        Label203.Alignment := taCenter;
//        Label203.Caption := 'Negative over positive';

        with rec do
        begin
          rec.Envi_Chance := E_Sound_Velocity_Type;

          if lvEnviroArea.ItemIndex <> -1 then
            rec.Envi_Type := lvEnviroArea.ItemIndex
          else
            rec.Envi_Type := 0;

          rec.Value       := 3;

        end;

        if Assigned(lvEnviroArea.Selected) then
        begin
         env := lvEnviroArea.Selected.Data;

          if env is TSubArea_Enviro_Definition then
            rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
          else
            rec.Sub_EnviID := 0;
        end;

        simMgrClient.netSend_CmdSyncEnvi(rec);
      end;
  end;

//   with rec do
//   begin
//     rec.Envi_Chance := 15;
//     if lvEnviroArea.ItemIndex <> -1 then
//       rec.Envi_Type := lvEnviroArea.ItemIndex
//     else
//       rec.Envi_Type := 0;

//     rec.Value       := OceanCurrent_Direction;

//   end;

//   if Assigned(lvEnviroArea.Selected) then
//   begin
//     env := lvEnviroArea.Selected.Data;

//     if env is TSubArea_Enviro_Definition then
//      rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
//     else
//      rec.Sub_EnviID := 0;
//   end;

//   simMgrClient.netSend_CmdSyncEnvi(rec);
end;

procedure TfrmToteDisplay.SpeedButton13Click(Sender: TObject);
var
  P : TPoint;
begin
  GetCursorPos(p);
  PopUpMenu.Popup(p.x, p.y);
end;

procedure TfrmToteDisplay.SpeedButton14Click(Sender: TObject);
var
  P : Tpoint;
begin
  if edtGroupName.Text <> '' then
  begin
    GetCursorPos(p);
    CpPopUpMenu.Popup(p.x, p.y);
  end;
end;

procedure TfrmToteDisplay.SpeedButton28Click(Sender: TObject);
var
  pos : TPoint;
begin
  GetCursorPos(pos);
  pmDetectionStatus.Popup(pos.X, pos.Y);
end;

procedure TfrmToteDisplay.StatusDisableClick(sender: TObject);
begin
  lvSystemState.Selected.SubItems[0] := 'Off';
end;

procedure TfrmToteDisplay.lvPlatformsSelectItem(sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if (Item = nil) or (item.Data = nil) then
    Exit;

  if Assigned(ToteSelectedPlatform) and (ToteSelectedPlatform = Item.Data)  then
    exit;

  FLastPlatform := ToteSelectedPlatform;
  ToteSelectedPlatform := Item.Data;

  //------- remove asset listener first for old vehicle
  RemoveAssetListener(FLastPlatform);
  //-------

  UpdateVehicle(Item.Data);

  //------- then add asset listener for new one
  AddAssetListener(ToteSelectedPlatform);
  //-------

//  btnembarkasi.Visible := True;
end;

procedure TfrmToteDisplay.lvSensorOverrideSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Item.Selected then
  begin
    SensorOverrideSelectedPlatform := TT3PlatformInstance(Item.Data);

    case SensorOverrideSelectedPlatform.DetectabilityType of
      dtNormalDetection:
      begin
        edtDetectionStatus.Text := 'Normal';
      end;
      dtUndetectable:
      begin
        edtDetectionStatus.Text := 'Never Detected';
      end;
      dtPassiveDetection:
      begin
        edtDetectionStatus.Text := 'Detected by passive sensor only';
      end;
      dtAlwaysVisible:
      begin
        edtDetectionStatus.Text := 'Always Detected';
      end;
    end;
  end
  else
  begin
    SensorOverrideSelectedPlatform := nil;
    edtDetectionStatus.Text := '';
  end;
end;

procedure TfrmToteDisplay.lvSensorsMouseDown(sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos: TPoint;
begin
  // klik kanan
  if CategoryPanelStatusOp.Enabled then
  begin
    if (lvSensors.Selected = nil) or (lvSensors.ItemIndex = -1) then
      Exit;

    GetCursorPos(pos);
    if (Button = mbRight) then
    begin
      if TT3Sensor(lvSensors.Selected.Data).OperationalStatus = sopDamage then
        begin
          damage1.Enabled := False;
          fixed1.Enabled := True;
        end
        else
        begin
          damage1.Enabled := True;
          fixed1.Enabled := False;
        end;
      pmSensor.Popup(pos.X, pos.Y);
    end;
  end;
end;

procedure TfrmToteDisplay.OnStateValueChange(sender : TListView);
begin
  if CategoryPanelStatusOp.Enabled then
  begin
    if (lvSystemState.Selected = nil) or (lvSystemState.ItemIndex = -1) then
      Exit;

    // if percentage status
    if (TListView(sender).Selected.Caption = 'Overall Damage') or
      (TListView(sender).Selected.Caption = 'Speed') or
      (TListView(sender).Selected.Caption = 'Fuel Remaining') then
    begin
      //x
    end
    // if operational status
    else if (TListView(sender).Selected.Caption = 'Helm') or
      (TListView(sender).Selected.Caption = 'Propulsion') or
      (TListView(sender).Selected.Caption = 'Communications') then
    begin
      if TListView(sender).Selected.SubItems[0] = 'Propulsion' then
      begin
        TListView(sender).Selected.SubItems[0] := 'Communications';
      end
      else
        TListView(sender).Selected.SubItems[0] := 'Propulsion';
    end
    // if enable/disable
    else if (TListView(sender).Selected.Caption = 'Fuel Leakage') then
    begin
    if TListView(sender).Selected.SubItems[0] = 'No' then
      begin
        TListView(sender).Selected.SubItems[0] := 'Yes';
      end
      else
        TListView(sender).Selected.SubItems[0] := 'No';
    end;
  end;
end;

procedure TfrmToteDisplay.setUpTreeWeapons(weapons: Tlist);
const
  TORPEDO = 0;
  MISSILE = 1;
  MINE = 2;
  GUN = 3;
  BOMB = 4;
var
  tn, temp: TTreeNode;
  i, j: Integer;
  status : String;

  MissileLauncher : TFitted_Weap_Launcher_On_Board;
  launcherNumber : integer;
  //QuantityTote : integer;
begin
  // clear Tree
  tvWeapons.Items.Clear;
  // setup tree
  if Assigned(weapons) then
  begin
    for i := 0 to weapons.Count - 1 do
    begin
      tn := TTreeNode.Create(tvWeapons.Items);
      // GUN
      case TT3Weapon(weapons[I]).WeaponStatus of
        wsAvailable : status := 'Available';
        wsUnavailable : status := 'Unavailable';
        wsDamaged : status := 'Damage';
        wsTooHigh : status := 'Too High';
      end;

      if (TT3Weapon(weapons.Items[i]) is TT3GunOnVehicle) then
      begin
        tn.Text := TT3GunOnVehicle(weapons.Items[i]).InstanceName + ' : ' + status;
        tn.StateIndex := 3;
        tn.Data := TT3GunOnVehicle(weapons.Items[i]);
        tvWeapons.Items.AddObject(nil, tn.Text, tn.Data);

        temp := TTreeNode.Create(tvWeapons.Items);
        temp.Text := IntToStr(TT3GunOnVehicle(tn.Data).Quantity);
        temp := FindText(tvWeapons, tn.Text);

        if temp.HasChildren then
          temp := temp.getNextSibling;

        tvWeapons.Items.AddChildObject(temp,
          IntToStr(TT3GunOnVehicle(tn.Data).Quantity), tn.Data);
      end
      // MISSILE
      else if (TT3Weapon(weapons.Items[i]) is TT3MissilesOnVehicle) then
      begin
        tn.Text := TT3MissilesOnVehicle(weapons.Items[i]).InstanceName + ' : ' + status;
        tn.StateIndex := 1;
        tn.Data := TT3MissilesOnVehicle(weapons.Items[i]);
        tvWeapons.Items.AddObject(nil,
          (tn.Text + ' : ' + IntToStr(TT3MissilesOnVehicle(tn.Data).Quantity)),
          tn.Data);

        for j := 0 to TT3MissilesOnVehicle(weapons.Items[i]).MissileDefinition.FLaunchs.Count - 1 do
        begin
          MissileLauncher := TFitted_Weap_Launcher_On_Board(TT3MissilesOnVehicle(weapons.Items[i]).MissileDefinition.FLaunchs.Items[j]);

          temp      := TTreeNode.Create(tvWeapons.Items);
          temp.Data := MissileLauncher;

          if MissileLauncher.FData.Launcher_Type > 8 then
            launcherNumber :=  MissileLauncher.FData.Launcher_Type - 8
          else
            launcherNumber := MissileLauncher.FData.Launcher_Type;

          temp.Text := 'Launcher ' + IntToStr(launcherNumber);

          //Parent
          temp      := FindText(tvWeapons, tn.Text + ' : '
                       + IntToStr(TT3MissilesOnVehicle(tn.Data).Quantity));

          //Child
          tvWeapons.Items.AddChild(temp, 'Launcher '
                                   + IntToStr(launcherNumber) + ' : '
                                   + IntToStr(MissileLauncher.FData.Launcher_Qty));
        end;

        //Parent
        //temp      := FindText(tvWeapons, tn.Text + ' : '
                     //+ IntToStr(TT3MissilesOnVehicle(tn.Data).Quantity));
      end
      // TORPEDO
      else if (TT3Weapon(weapons.Items[i]) is TT3TorpedoesOnVehicle) then
      begin
        tn.Text := TT3TorpedoesOnVehicle(weapons.Items[i]).InstanceName + ' : ' + status;
        tn.StateIndex := 0;
        tn.Data := TT3TorpedoesOnVehicle(weapons.Items[i]);
        tvWeapons.Items.AddObject(nil, tn.Text + ' : ' + IntToStr
            (TT3TorpedoesOnVehicle(tn.Data).Quantity), tn.Data);

        for j := 0 to TT3TorpedoesOnVehicle(weapons.Items[i]).Quantity - 1 do
        begin
          temp := TTreeNode.Create(tvWeapons.Items);
          temp.Text := 'Launcher ' + IntToStr(j + 1);
          temp := FindText(tvWeapons,
            tn.Text + ' : ' + IntToStr(TT3TorpedoesOnVehicle(tn.Data).Quantity));
          tvWeapons.Items.AddChild(temp, 'Launcher ' + IntToStr(j + 1));
          // FindAdd(tvWeapons, tn.Text, 'Launcher ' + IntToStr(j+1));
        end;
      end
      // BOMB
      else if (TT3Weapon(weapons.Items[i]) is TT3BombONVehicle) then
      begin
        tn.Text := TT3BombONVehicle(weapons.Items[i]).InstanceName + ' : ' + status;
        tn.StateIndex := 4;
        tn.Data := TT3BombONVehicle(weapons.Items[i]);
        tvWeapons.Items.AddObject(nil, tn.Text, tn.Data);

        temp := TTreeNode.Create(tvWeapons.Items);
        temp.Text := IntToStr(TT3BombONVehicle(tn.Data).Quantity);
        temp := FindText(tvWeapons, tn.Text);

        if temp.HasChildren then
          temp := temp.getNextSibling;

        tvWeapons.Items.AddChildObject(temp,
          IntToStr(TT3BombONVehicle(tn.Data).Quantity), tn.Data);
      end
      // MINE
      else if (TT3Weapon(weapons.Items[i]) is TT3MineOnVehicle) then
      begin
        tn.Text := TT3MineOnVehicle(weapons.Items[i]).InstanceName + ' : ' + status;
        tn.StateIndex := 2;
        tn.Data := TT3MineOnVehicle(weapons.Items[i]);
        tvWeapons.Items.AddObject(nil, tn.Text, tn.Data);

        temp := TTreeNode.Create(tvWeapons.Items);
        temp.Text := IntToStr(TT3MineOnVehicle(tn.Data).Quantity);
        temp := FindText(tvWeapons, tn.Text);

        if temp.HasChildren then
          temp := temp.getNextSibling;

        tvWeapons.Items.AddChildObject(temp,
          IntToStr(TT3MineOnVehicle(tn.Data).Quantity), tn.Data);
      end;
    end;
  end;

  // expand all
  tvWeapons.FullExpand;
end;

procedure TfrmToteDisplay.showEmbarkQuantity(sender : TObject);
begin
  if tvEmbarkedPlatforms.Selected = nil then
    Exit;

  tvEmbarkedPlatforms.ReadOnly := false;
  tvEmbarkedPlatforms.Selected.Focused := true;
  tvEmbarkedPlatforms.Selected.EditText;
  {
  edtEmbarkQuantity.Enabled := true;
  edtEmbarkQuantity.Visible := true;

  edtEmbarkQuantity.Text := IntToStr(TT3EmbarkedVehicle(tvEmbarkedPlatforms.Selected.Data).Quantity);
  }
end;

procedure TfrmToteDisplay.lvSystemStateMouseDown(sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos: TPoint;
  Item: TMenuItem;
  li: TListItem;
  ve: TT3Vehicle;
  u  : TT3Unit;
begin
  if CategoryPanelStatusOp.Enabled then
  begin
    if (lvSystemState.Selected = nil) or (lvSystemState.ItemIndex = -1) then
      Exit;

    GetCursorPos(pos);
    pmState.Items.Clear;

    // if percentage status
    if (TListView(sender).Selected.Caption = 'Overall Damage')  then
    begin
      Item := TMenuItem.Create(self);
      item.Tag := tagOverallDamage;
      Item.Caption := 'Set ' + TListView(sender).Selected.Caption;
      item.OnClick := Self.StatusClick;
      pmState.Items.Add(Item);
    end
    else if (TListView(sender).Selected.Caption = 'Speed') then
    begin
      Item := TMenuItem.Create(self);
      item.Tag := tagSpeed;
      Item.Caption := 'Set ' + TListView(sender).Selected.Caption;
      item.OnClick := Self.StatusClick;
      pmState.Items.Add(Item);
    end
    else if (TListView(sender).Selected.Caption = 'Fuel Remaining') then
    begin
      Item := TMenuItem.Create(self);
      item.Tag := tagFuelRemaining;
      Item.Caption := 'Set ' + TListView(sender).Selected.Caption;
      item.OnClick := Self.StatusClick;
      pmState.Items.Add(Item);
    end
    // if operational status
    else if (TListView(sender).Selected.Caption = 'Helm') or
      (TListView(sender).Selected.Caption = 'Propulsion') or
      (TListView(sender).Selected.Caption = 'Communications') then
    begin
      Item := TMenuItem.Create(self);
      if TListView(sender).Selected.Caption = 'Helm' then
        item.Tag := tagHelm
      else if (TListView(sender).Selected.Caption = 'Propulsion') then
        item.Tag := tagPropulsion
      else if (TListView(sender).Selected.Caption = 'Communications') then
        item.Tag := tagCommunications;

      Item.Caption := 'Operational';
      item.OnClick := Self.StatusClick;
      pmState.Items.Add(Item);

      Item := TMenuItem.Create(self);
      if TListView(sender).Selected.Caption = 'Helm' then
        item.Tag := tagHelm
      else if (TListView(sender).Selected.Caption = 'Propulsion') then
        item.Tag := tagPropulsion
      else if (TListView(sender).Selected.Caption = 'Communications') then
        item.Tag := tagCommunications;

      Item.Caption := 'Pending';
      item.OnClick := Self.StatusClick;
      pmState.Items.Add(Item);

      if lvPlatforms.Selected = nil then exit;

      li := lvPlatforms.Selected;

      u := li.Data;
//      if sender <> u then
//        exit;

      if not (u is TT3Vehicle) then
        exit;

      ve := li.Data;

      if TListView(sender).Selected.Caption = 'Helm' then
      begin
        if not ve.DamageHelm then
        begin
          pmState.Items[0].Enabled := False;
          pmState.Items[1].Enabled := True;
        end
        else if ve.DamageHelm then
        begin
          pmState.Items[0].Enabled := True;
          pmState.Items[1].Enabled := False;
        end;
      end
      else if (TListView(sender).Selected.Caption = 'Propulsion') then
      begin
        if not ve.DamagePropulsion then
        begin
          pmState.Items[0].Enabled := False;
          pmState.Items[1].Enabled := True;
        end
        else if ve.DamagePropulsion then
        begin
          pmState.Items[0].Enabled := True;
          pmState.Items[1].Enabled := False;
        end;
      end
      else if (TListView(sender).Selected.Caption = 'Communications') then
      begin
        if not ve.DamageComm then
        begin
          pmState.Items[0].Enabled := False;
          pmState.Items[1].Enabled := True;
        end
        else if ve.DamageComm then
        begin
          pmState.Items[0].Enabled := True;
          pmState.Items[1].Enabled := False;
        end;
      end;

    end
    // if enable/disable
    else if (TListView(sender).Selected.Caption = 'Fuel Leakage') then
    begin
      Item := TMenuItem.Create(self);
      item.Tag := tagFuelLeakage;
      Item.Caption := 'Enable';
      item.OnClick := Self.StatusClick;
      pmState.Items.Add(Item);

      Item := TMenuItem.Create(self);
      item.Tag := tagFuelLeakage;
      Item.Caption := 'Disable';
      item.OnClick := Self.StatusClick;
      pmState.Items.Add(Item);

      if lvPlatforms.Selected = nil then exit;

      li := lvPlatforms.Selected;

      u := li.Data;

      if not (u is TT3Vehicle) then
        exit;

      ve := li.Data;

      if ve.FuelLeakage then
      begin
        pmState.Items[0].Enabled := False;
        pmState.Items[1].Enabled := True;
      end
      else if not ve.FuelLeakage then
      begin
        pmState.Items[0].Enabled := True;
        pmState.Items[1].Enabled := False;
      end;
    end;

    if Button = mbRight then
    begin
      pmState.Popup(pos.X, pos.Y);
    end;
  end;
end;

procedure TfrmToteDisplay.pmCountermeasureChange(sender: TObject;
  Source: TMenuItem; Rebuild: Boolean);
begin
  // x
end;

procedure TfrmToteDisplay.pmEmbarkedChange(sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  //x
end;

procedure TfrmToteDisplay.pmLogisticChange(sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
//x
end;

procedure TfrmToteDisplay.pmSensorChange(sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  // set object yg diselect
  // lvSensors.Selected.SubItems.Text := pmSensor.Items.ToString;
  inherited;
  // if Assigned(frmTacticalDisplay.fmSensor1.focused_sensor) and (frmTacticalDisplay.fmSensor1.focused_sensor.ClassType = TT3IFFSensor)
  // then
  // begin
  // with TT3IFFSensor(frmTacticalDisplay.fmSensor1.focused_sensor) do
  // begin
  // case TSpeedButton(Sender).Tag of
  // 1: InterrogatorOperateStatus := sopOn;
  // 2: InterrogatorOperateStatus := sopOff;
  // 3: TransponderOperateStatus  := sopOn;
  // 4: TransponderOperateStatus  := sopOff;
  // end;
  // end;
  // end;
end;

procedure TfrmToteDisplay.pmStateChange(sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  //x
end;

procedure TfrmToteDisplay.pmWeaponChange(sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  //x
end;

procedure TfrmToteDisplay.PostKey(key: Word; const shift: TShiftState;
  specialkey: Boolean);
type
   TShiftKeyInfo = record
     shift: Byte ;
     vkey: Byte ;
   end;
   ByteSet = set of 0..7 ;
const
   shiftkeys: array [1..3] of TShiftKeyInfo =
     ((shift: Ord(ssCtrl) ; vkey: VK_CONTROL),
     (shift: Ord(ssShift) ; vkey: VK_SHIFT),
     (shift: Ord(ssAlt) ; vkey: VK_MENU)) ;
var
   flag: DWORD;
   bShift: ByteSet absolute shift;
   j: Integer;
begin
  for j := 1 to 3 do
  begin
    if shiftkeys[j].shift in bShift then
      keybd_event(shiftkeys[j].vkey, MapVirtualKey(shiftkeys[j].vkey, 0), 0, 0) ;
  end;
  if specialkey then
    flag := KEYEVENTF_EXTENDEDKEY
  else
    flag := 0;

  keybd_event(key, MapvirtualKey(key, 0), flag, 0) ;
  flag := flag or KEYEVENTF_KEYUP;
  keybd_event(key, MapvirtualKey(key, 0), flag, 0) ;

  for j := 3 downto 1 do
  begin
    if shiftkeys[j].shift in bShift then
      keybd_event(shiftkeys[j].vkey, MapVirtualKey(shiftkeys[j].vkey, 0), KEYEVENTF_KEYUP, 0) ;
  end;
end;

procedure TfrmToteDisplay.rbAlwaysClick(sender: TObject);
begin
  rbNormal.Checked := False;
  rbAlways.Checked := true;
  rbNever.Checked := False;

  if tvSettings.Selected = nil then
    Exit;

  //changeValueTreeSettingItems(tvSettings.Selected, 'Always kill if hit');
  changeGameSettingValue(tvSettings.Selected.SelectedIndex,'Always kill if hit');
end;

procedure TfrmToteDisplay.rbDirectClick(sender: TObject);
begin
  rbRealistic.Checked := False;
  rbDirect.Checked := true;

  if tvSettings.Selected = nil then
    Exit;

  //changeValueTreeSettingItems(tvSettings.Selected, 'Direct');
  changeGameSettingValue(tvSettings.Selected.SelectedIndex,'Direct');
end;

procedure TfrmToteDisplay.rbNeverClick(sender: TObject);
begin
  rbNormal.Checked := False;
  rbAlways.Checked := False;
  rbNever.Checked := true;

  if tvSettings.Selected = nil then
    Exit;

  //changeValueTreeSettingItems(tvSettings.Selected, 'Never kill if hit');
  changeGameSettingValue(tvSettings.Selected.SelectedIndex,'Never kill if hit');
end;

procedure TfrmToteDisplay.rbNormalClick(sender: TObject);
begin
  rbNormal.Checked := true;
  rbAlways.Checked := False;
  rbNever.Checked := False;

  if tvSettings.Selected = nil then
    Exit;

  //changeValueTreeSettingItems(tvSettings.Selected, 'Normal');
  changeGameSettingValue(tvSettings.Selected.SelectedIndex,'Normal');
end;

procedure TfrmToteDisplay.rbRealisticClick(sender: TObject);
begin
  rbRealistic.Checked := true;
  rbDirect.Checked := False;

  if tvSettings.Selected = nil then
    Exit;

  //changeValueTreeSettingItems(tvSettings.Selected, 'Realistic');
  changeGameSettingValue(tvSettings.Selected.SelectedIndex,'Realistic');
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
  w, h: Integer;
  //c: TComponent;
  //gb: TGroupBox;
begin
  // gbPlatformStatus.members
  pnlPlatformRight.Width := gbPlatformStatus.Width div 3;
  if pnlPlatformRight.Height < 740 then
    h := (pnlPlatformRight.Height - 10) div 4
  else
    h := 220;

  pnlPlatSystemState.Height := h;
  pnlPlatCounterMeasure.Height := h - 30;
//  pnlPlatCounterMeasure.Height := h;
//  pnlPlatEmbarked.Height := h;

  btHookSelectedPlatform.Left := pnlPlatformLeft.Width -
    btHookSelectedPlatform.Width - 16;
  btSelectHookedPlatform.Left := btHookSelectedPlatform.Left -
    btSelectHookedPlatform.Width - 8;

  w := lvPlatforms.Width;
  lvPlatforms.Column[0].Width := Round(0.3 * w);
  lvPlatforms.Column[1].Width := Round(0.2 * w);
  lvPlatforms.Column[2].Width := Round(0.1 * w);
  lvPlatforms.Column[3].Width := Round(0.1 * w);

  w := lvSensors.Width;
  lvSensors.Column[0].Width := Round(0.6 * w);
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

procedure TfrmToteDisplay.TimerEngageTimer(Sender: TObject);
var
  timeString: String;
  hInt, mInt, sInt : Word;
  time : TDateTime;
begin
  if timeIntEngage > 3600 then
    Exit;

  //timeFlight := timeFlight - 1;
  Dec(timeIntEngage);
  hInt := timeIntEngage div 3600;
  mInt := timeIntEngage div 60;
  sInt := timeIntEngage - (hInt * 3600) - (mInt * 60);

  time := EncodeTime(hInt, mInt, sInt, 0);

  timeString := FormatDateTime('hh:mm:ss', time);
  //CountDownTimeFlight(sgSurfacetoAir, timeString);
  if sgSurToSurEditedRow <> 0 then
    sgSurfacetoSurface.Cells[6, sgSurToSurEditedRow] := timeString;
  if sgSurToAirEditedRow <> 0 then
    sgSurfacetoSurface.Cells[6, sgSurToAirEditedRow] := timeString;
  // ketika waktusisa bernilai 0, timer dimatikan
  if (timeIntEngage <= 0) then
  begin
    TimerEngage.Enabled := False;
  end
end;

procedure TfrmToteDisplay.TimerLaunchTimer(Sender: TObject);
var
  timeString: String;
  hInt, mInt, sInt : Word;
  time : TDateTime;
begin
  if timeInt > 3600 then
    Exit;

  //timeFlight := timeFlight - 1;
  Dec(timeInt);
  hInt := timeInt div 3600;
  mInt := timeInt div 60;
  sInt := timeInt - (hInt * 3600) - (mInt * 60);

  time := EncodeTime(hInt, mInt, sInt, 0);

  timeString := FormatDateTime('hh:mm:ss', time);
  //CountDownTimeFlight(sgSurfacetoAir, timeString);
  if sgSurToSurEditedRow <> 0 then
    sgSurfacetoSurface.Cells[7, sgSurToSurEditedRow] := timeString;
  if sgSurToAirEditedRow <> 0 then
    sgSurfacetoSurface.Cells[7, sgSurToAirEditedRow] := timeString;

  // ketika waktusisa bernilai 0, timer dimatikan
  if (timeInt <= 0) then
  begin
    TimerLaunch.Enabled := False;
  end
end;

procedure TfrmToteDisplay.btnLandingCraftDisembarkClick(Sender: TObject);
var
  HostShip : TT3PlatformInstance;
  MemberShip : TT3Vehicle;

  RecTransport : TRecCmd_Transport;
  tempRamp : TRamp;

begin

  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(HostShip) then
    Exit;

  if HostShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang diangkut '}
  MemberShip := TT3Vehicle(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportMemberShipID));

  if MemberShip = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan Status rampa '}
  if (MemberShip.VehicleDefinition.FData.VBS_Class_Name = 'Def_Transport_Ship_(LCU)') or
  (MemberShip.VehicleDefinition.FData.VBS_Class_Name = 'LCU') then
  begin
    tempRamp := TT3Vehicle(HostShip).RampList[2];
    if not tempRamp.State then
    begin
      MessageDlg('Rampa Belakang Belum Tebuka', mtInformation, [mbOK], 0);
      Exit;
    end;

    RecTransport.InitSpeed  := -2;
    RecTransport.RampID  := 2;
    RecTransport.InitCourse := HostShip.Course;
  end
  else
  begin
    RecTransport.InitSpeed  := 2;
    RecTransport.InitCourse := HostShip.Course;
  end;
  {$ENDREGION}

  {$REGION ' Mengirim Paket '}
  RecTransport.OrderID := CORD_ID_disembark;
  RecTransport.HostPlatformID := HostShip.InstanceIndex;
  RecTransport.MemberPlatformID := MemberShip.InstanceIndex;

  RecTransport.MemberPlatformName := MemberShip.InstanceName;
  RecTransport.TrackID := TT3Vehicle(MemberShip).Track_ID;
  RecTransport.StateTransport := False;

  RecTransport.MemberPlatform3DName := TT3Vehicle(MemberShip).VehicleDefinition.FData.VBS_Class_Name;
  RecTransport.MemberDomain := MemberShip.PlatformDomain;
  RecTransport.TurnRate := TT3Vehicle(MemberShip).UnitMotion.FData.Standard_Turn_Rate;
  RecTransport.DiveRate := TT3Vehicle(MemberShip).UnitMotion.FData.Vertical_Accel;

  RecTransport.InitAltitude  := 0;

  simMgrClient.netSend_CmdTransport(RecTransport);
  {$ENDREGION}

  btnLandingCraftDisembark.Enabled := False;
end;

procedure TfrmToteDisplay.btnLaunchClick(Sender: TObject);
var
  i, LauncherID : Integer;
  ListDTOT : TMissileHaveLaunch;

  recsend : TrecSinc_RBLW;
  mov : TT3MissilesOnVehicle;
  vehicle : TT3Vehicle;
  LauncherOn : TFitted_Weap_Launcher_On_Board;
begin
  i := 0;

  if Assigned(simMgrClient.ControlledPlatform) then
  begin
    if (indexDtot < TT3Vehicle(simMgrClient.ControlledPlatform).MissileWaittoLaunch.Count)
        and (i <> -1) then
    begin
      ListDTOT := TT3Vehicle(simMgrClient.ControlledPlatform).MissileWaittoLaunch[indexDtot];
      ListDTOT.isHaveLaunch := True;
      btnLaunch.Enabled := False;

      with recsend do
      begin
        cmd := 5;
        PlatformID := ListDTOT.parentShipIndex;
        WeaponIndex := ListDTOT.MissileIndex;
        WeaponName := ListDTOT.MissileName;
        LauncherNumber := ListDTOT.LauncherNumber;
        launchDelay := 0;
      end;
      simMgrClient.netSend_CmdSyncRBLW(RecSend);
      Sleep(100);

      rMis.ParentPlatformID := ListDTOT.parentShipIndex;
      rMis.MissileID        := ListDTOT.MissileIndex;
      rMis.TargetPlatformID := ListDTOT.TargetShipIndex;
      LauncherID := StrToInt(sgSurfacetoSurface.Cells[1,SgSSMissileSelectedCell]);
      rMis.LauncherID       := LauncherID;

      vehicle := TT3Vehicle(simMgrClient.ControlledPlatform);
      mov := vehicle.getWeapon(ListDTOT.MissileIndex, TT3MissilesOnVehicle) as TT3MissilesOnVehicle;
      LauncherOn := mov.GetLauncherByID(LauncherID);

      if (mov.Quantity <= mov.MissileDefinition.FLaunchs.Count) and (mov.Quantity > 0) then
      begin
        simMgrClient.netSend_CmdSetLauncherQty(vehicle.InstanceIndex,
          mov.InstanceIndex, LauncherOn.FData.Launcher_Type, (LauncherOn.FData.Launcher_Qty - 1));
        Sleep(100);
        SimMgrClient.netSend_CmdLaunch_Missile(rMis);
        Sleep(100);
        SimMgrClient.netSend_CmdSetQuantity(vehicle.InstanceIndex,
           mov.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (mov.Quantity - 1));
        Sleep(100);
      end
      else if mov.Quantity > 0 then
      begin
        SimMgrClient.netSend_CmdSetQuantity(vehicle.InstanceIndex,
           mov.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (mov.Quantity - 1));
        Sleep(100);
        SimMgrClient.netSend_CmdLaunch_Missile(rMis);
      end;

      with frmTacticalDisplay.fmWeapon1 do
      begin
        if LauncherOn.FData.Launcher_Type > 8 then
          FRippleCountArray[LauncherOn.FData.Launcher_Type-9] := False
        else
          FRippleCountArray[LauncherOn.FData.Launcher_Type-1] := False;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.trbAtmRefractChange(sender: TObject);
begin
  edtAtmRefract.Text := IntToStr(trbAtmRefract.Position);
end;

procedure TfrmToteDisplay.trbAttenCloudChange(sender: TObject);
var
 state : Integer;
begin
  state := trbAttenCloud.Position;
  edtAttenCloud.Text := IntToStr(state);
end;

procedure TfrmToteDisplay.trbAttenRainRateChange(sender: TObject);
var
 state : Integer;
begin
  state := trbAttenRainRate.Position;
  edtAttenRainRate.Text := IntToStr(state);
end;

procedure TfrmToteDisplay.trbBottomLostChange(Sender: TObject);
begin
  edtBottomLost.Text := IntToStr(trbBottomLost.Position);
end;

procedure TfrmToteDisplay.trbDaytimeInfraChange(sender: TObject);
begin
  edtDayInfra.Text := IntToStr(trbDaytimeInfra.Position);
end;

procedure TfrmToteDisplay.trbDaytimeVisualChange(sender: TObject);
begin
  edtDayVis.Text := IntToStr(trbDaytimeVisual.Position);
end;

procedure TfrmToteDisplay.trbNighttimeInfraChange(sender: TObject);
begin
  edtNightInfra.Text := IntToStr(trbNighttimeInfra.Position);
end;

procedure TfrmToteDisplay.trbNighttimeVisualChange(sender: TObject);
begin
  edtNightVis.Text := IntToStr(trbNighttimeVisual.Position);
end;

procedure TfrmToteDisplay.trbSeaStateChange(Sender: TObject);
var
 state : Integer;
begin
  state := trbSeaState.Position;
  edtSeaState.Text := IntToStr(state);
end;

procedure TfrmToteDisplay.Damage2Click(sender: TObject);
begin
  if tvCountermeasures.Selected = nil then
    Exit;

  with simMgrClient do
  begin
    TT3CounterMeasure(tvCountermeasures.Selected.Data).Status := esDamaged;
  end;
  lvPlatformsSelectItem(lvPlatforms, lvPlatforms.Selected, True);
  lvPlatforms.Selected.Focused := true;
  invalidate;
  UpdateCountermeasureVehicle(TT3Vehicle(lvPlatforms.Selected.Data));
end;

procedure TfrmToteDisplay.DataLink11Click(Sender: TObject);
begin
  edtDatalink.Text := 'Datalink ' + IntToStr(TMenuItem(Sender).Tag);
  FSelectedDataLink := simMgrClient.DataLinkManager.getDatalink(TMenuItem(Sender).Tag);
  SetDataLink(FSelectedDataLink);
end;

procedure TfrmToteDisplay.DetectabilityClick(Sender: TObject);
var
  rec : TRecDetectability;
begin
  if not Assigned(SensorOverrideSelectedPlatform) then
    Exit;

  rec.PlatformID := SensorOverrideSelectedPlatform.InstanceIndex;
  rec.DetectType := TMenuItem(Sender).Tag;

  simMgrClient.netSend_CmdDetectabilityChange(rec);
end;

procedure TfrmToteDisplay.SetSelectedPlatform(track : TT3PlatformInstance);
var
  I: Integer;
  lv : TListItem;
begin
  for I := 0 to lvPlatforms.Items.Count - 1 do
  begin
    lv := lvPlatforms.Items[I];

    if lv.Data = track then
    begin
      lvPlatforms.Items[I].Selected := True;
    end;
  end;
end;

procedure TfrmToteDisplay.DisplayEnvironMentControl;
var
  li: TListItem;
  ge: TGame_Environment_Definition;
  i: Integer;
begin
  lvEnviroArea.Columns[0].Width := lvEnviroArea.Width - 10;
  ge := (simMgrClient).GameEnvironment;

  // while  do

  lvEnviroArea.Clear;
  li := lvEnviroArea.Items.Add;
  li.Caption := 'Default Game Area';
  li.Data := ge;
  // tambahan dari Aldy sub-area
  if ((simMgrClient).GameEnvironment.FSubArea <> nil) and
    ((simMgrClient).GameEnvironment.FSubArea.Count > 0) then
  begin
    for i := 0 to (simMgrClient).GameEnvironment.FSubArea.Count - 1 do
    begin
      li := lvEnviroArea.Items.Add;
      li.Caption := TSubArea_Enviro_Definition
        ((simMgrClient).GameEnvironment.FSubArea[i]).FData.Enviro_Identifier;
      li.Data := TSubArea_Enviro_Definition
        ((simMgrClient).GameEnvironment.FSubArea[i]);
    end;
  end;

  lvEnviroArea.ItemIndex := 0;
  lvEnviroAreaSelectItem(self.lvEnviroArea, lvEnviroArea.Selected, true);

  // if first item then add default

end;

procedure TfrmToteDisplay.ReceiveGameSpeedForRecording(Cmd: TRecCmd_GameCtrl);
var
  i : integer;
  GameInterval : Double;
  RecSend      : TRecRecordVoice;
begin
  GameInterval := simMgrClient.GameTIME - simMgrClient.MainVTime.DateTimeOffset;
  GameInterval := Round(GameInterval * 24 * 3600) * 1000 { In Millisecond 1000x};

  case cmd.GameCtrl of
    CORD_ID_start :
    begin
      RecSend.ControllerID  := simMgrClient.ConsoleName;
      RecSend.ChannelName   := '';
      RecSend.ChannelCode   := '';
      RecSend.ModifStat     := 3;
      RecSend.TimeInterval  := GameInterval;
      simMgrClient.netSend_CmdRecordAudio(RecSend);
      Sleep(100);

      { Start or Resume Recording }
      for i := 0 to lvRecordOut.Items.Count - 1 do
      begin
        RecSend.ControllerID  := simMgrClient.ConsoleName;
        RecSend.ChannelID     := StrToInt(lvRecordOut.Items[i].Caption);
        RecSend.ChannelName   := lvRecordOut.Items[i].SubItems[0];
        RecSend.ChannelCode   := lvRecordOut.Items[i].SubItems[1];
        RecSend.ModifStat     := 1;
        RecSend.TimeInterval  := GameInterval;
        simMgrClient.netSend_CmdRecordAudio(RecSend);
        Sleep(100);
      end;
    end;

    CORD_ID_pause, CORD_ID_game_speed :
    begin
      { Stop or Pause Recording }
      RecSend.ControllerID  := simMgrClient.ConsoleName;
      RecSend.ChannelName   := '';
      RecSend.ChannelCode   := '';
      RecSend.ModifStat     := 3;
      RecSend.TimeInterval  := GameInterval;
      simMgrClient.netSend_CmdRecordAudio(RecSend);
    end;
  end;
end;

procedure TfrmToteDisplay.RefreshCubicle_Platform(cubList: Tlist);
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
      Exit;
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
  XMLDoc.Active := true;
  iNode := XMLDoc.AddChild('tree2xml');
  iNode.Attributes['app'] := ParamStr(0);

  tn := tv.TopItem;
  while tn <> nil do
  begin
    ProcessTreeItem(tn, iNode);

    tn := tn.getNextSibling;
  end;

  XMLDoc.SaveToFile(ChangeFileExt('setting', '.XML'));

  //XMLDoc := nil;
end;

procedure TfrmToteDisplay.tvCountermeasuresMouseDown(sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos: TPoint;
begin
  if CategoryPanelStatusOp.Enabled then
  begin
    if tvCountermeasures.Selected = nil then
      Exit;

    GetCursorPos(pos);

    if Button = mbRight then
    begin
      tvCountermeasures.Selected := tvCountermeasures.GetNodeAt(x, y);

      if tvCountermeasures.Selected <> nil then
      begin
        if TT3CounterMeasure(tvCountermeasures.Selected.Data).Status = esDamaged then
          begin
            Damage2.Enabled := False;
            Repair2.Enabled := True;
          end
        else if TT3CounterMeasure(tvCountermeasures.Selected.Data).Status = esUnavailable then
          begin
            Damage2.Enabled := False;
            Repair2.Enabled := False;
          end
        else
          begin
            Damage2.Enabled := True;
            Repair2.Enabled := False;
          end;
      end;

      pmCountermeasure.Popup(pos.X, pos.Y);
    end;
  end;

end;

procedure TfrmToteDisplay.tvCubicleGroupsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos : TPoint;
  I : Integer;
  menu : TMenuItem;
  Obj  : TSimObject;
  Pi : TPlatform_Instance;
  Pa : TT3PlatformInstance;
  cub : T3CubicleGroup;
  printTemp, printControllerTemp : Boolean;

begin
  if tvCubicleGroups.Selected = nil then
    Exit;

  pmCubicleGroup.Items.Clear;

  Obj := tvCubicleGroups.Selected.Data;

  //choco
  if (Button = mbRight) and (tvCubicleGroups.Selected.Level = 2) then
  begin
    if Assigned(Obj) then
    begin
      Pa := TT3PlatformInstance(obj);

      if Assigned(Pi) then
      begin
        //get Name All Group
        GetCursorPos(pos);

        with simMgrClient do
        begin
          printControllerTemp := False;
          for i := 0 to CubAssignList.Count - 1 do
          begin
            printTemp := False;

            cub := CubAssignList.Items[i] as T3CubicleGroup;

            if not Assigned(cub) then
              Continue;

//            if (cub.FData.Group_Identifier = 'Controller') or
//              (cub.FData.Force_Designation <> pi.FData.Force_Designation {FMyCubGroup.FData.Force_Designation}) then
//              Continue;

            if cub.FData.Group_Identifier = 'Controller' then
            begin
              if not printControllerTemp then
              begin
                printControllerTemp := True;
                printTemp := True
              end;
            end
            else if cub.FData.Group_Identifier = 'Unassigned Group' then
              printTemp := True
            else
            begin
              if (cub.FData.Force_Designation = Pa.Force_Designation) then
                printTemp := True
            end;

            if printTemp = True then
            begin
              menu := TMenuItem.Create(Self);
              menu.Caption := cub.FData.Group_Identifier;
              menu.OnClick := OnPlatformGroupChange;
              pmCubicleGroup.Items.Add(menu);
            end;
          end;
        end;

        pmCubicleGroup.Popup(pos.X, pos.Y);
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.tvEmbarkedPlatformsEdited(Sender: TObject;
  Node: TTreeNode; var S: string);
var
  value : string;
  iValue : Integer;
  embarkNode : TTreeNode;
  startTag, endTag : string;
  startPos, endPos : Integer;
  time : TDateTime;
  hour , min, sec, mSec : Word;
begin
  embarkNode := Node.Parent;

  if not Assigned(ToteSelectedPlatform) then
    Exit;

  if ContainsStr(S, 'Available') then
  begin
    value := AnsiRightStr(S, 2);
    TryStrToInt(value, iValue);

    SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
        TT3EmbarkedVehicle(embarkNode.Data).EmbarkedVehicle.Hosted_Vehicle_Index,
        CORD_ID_QUANTITY, CORD_TYPE_EMBARK, iValue);
  end
  else if ContainsStr(S, 'Ready') then
  begin
    startTag := '[';
    endTag   := ']';
    startPos := Pos(startTag, S) + 1;
    endPos := Pos(endTag, S);

    value := Copy(S, startPos, endPos - startPos);
    time := StrToDateTime(value);
    DecodeTime(time, hour , min, sec, mSec);

    iValue := sec;
    iValue := iValue + (min * 60);
    iValue := iValue + (hour * 3600);

    SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
        TT3EmbarkedVehicle(embarkNode.Data).EmbarkedVehicle.Hosted_Vehicle_Index,
        CORD_ID_READYING_TIME, CORD_TYPE_EMBARK, iValue);
  end;

  tvEmbarkedPlatforms.ReadOnly := true;
end;

procedure TfrmToteDisplay.tvEmbarkedPlatformsMouseDown(sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos: TPoint;
  //menu: TMenuItem;
  hoverNode: TTreeNode;
begin

  if CategoryPanelStatusOp.Enabled then
  begin
    if tvEmbarkedPlatforms.Selected = nil then
      Exit;

    GetCursorPos(pos);
    if (Button = mbRight) then
    begin
      hoverNode := tvEmbarkedPlatforms.GetNodeAt(X, Y) ;
      if Assigned(hoverNode) then begin

        if hoverNode.StateIndex = 0 then begin
          pmEmbarked.Items[0].Enabled := false;
          pmEmbarked.Items[1].Enabled := true;
        end;

        if hoverNode.StateIndex = 1 then begin
          pmEmbarked.Items[0].Enabled := true;
          pmEmbarked.Items[1].Enabled := false;
        end;

        if (hoverNode.StateIndex = 2) or (hoverNode.StateIndex = 3) then begin
          pmEmbarked.Items[0].Enabled := false;
          pmEmbarked.Items[1].Enabled := true;
        end;

        pmEmbarked.Popup(pos.X, pos.Y);
      end;

    end;
  end;
end;

procedure TfrmToteDisplay.tvSettingsClick(sender: TObject);
var
  str, temp, Caption: string;
begin
  if TTreeView(sender).Selected <> nil then
  begin
    str := getValueTreeSettingItems(nil);
    if ContainsStr(str, ':') then
    begin
      Caption := getSettingIdentifierItem;
      gbSetTime.Caption := 'Change ' + Caption + ' setting';
      gbSetTime.BringToFront;
      edtSetTime.Text := str;
    end
    else if ContainsStr(str, '%') then
    begin
      Caption := getSettingIdentifierItem;
      gbPercentage.Caption := 'Change ' + Caption + ' setting';
      gbPercentage.BringToFront;
      edtPercentage.Text := str;
    end
    else if (ContainsStr(str, 'Enable') or ContainsStr(str, 'Disable')) then
    begin
      Caption := getSettingIdentifierItem;
      gbSetEnDis.Caption := 'Change ' + Caption + ' setting';
      gbSetEnDis.BringToFront;
      if ContainsStr(str, 'Enable') then
      begin
        cbSetEnDis.Checked := true;
      end
      else
      begin
        cbSetEnDis.Checked := False;
      end;
    end
    else if (ContainsStr(str, 'kill') or ContainsStr(str, 'Normal')) then
    begin
      Caption := getSettingIdentifierItem;
      gbProbability.Caption := 'Change ' + Caption + ' setting';
      gbProbability.BringToFront;
      temp := getValueTreeSettingItems(nil);
      if ContainsStr(temp, 'Normal') then
      begin
        rbNormal.Checked := true;
        rbAlways.Checked := False;
        rbNever.Checked := False;
      end
      else if ContainsStr(temp, 'Always') then
      begin
        rbNormal.Checked := False;
        rbAlways.Checked := true;
        rbNever.Checked := False;
      end
      else if ContainsStr(temp, 'Never') then
      begin
        rbNormal.Checked := False;
        rbAlways.Checked := False;
        rbNever.Checked := true;
      end;
    end
    else if (ContainsStr(str, 'Realistic') or ContainsStr(str, 'Direct')) then
    begin
      Caption := getSettingIdentifierItem;
      gbGuidanceCommand.Caption := 'Change ' + Caption + ' setting';
      gbGuidanceCommand.BringToFront;
      if ContainsStr(str, 'Realistic') then
      begin
        rbRealistic.Checked := true;
        rbDirect.Checked := False;
      end
      else if ContainsStr(str, 'Direct') then
      begin
        rbRealistic.Checked := False;
        rbDirect.Checked := true;
      end;
    end
    else
    begin
      Caption := getSettingIdentifierItem;
      gbDistance.Caption := 'Change ' + Caption + ' setting';
      gbDistance.BringToFront;
      edtDistance.Text := str;
    end;
  end;
end;

procedure TfrmToteDisplay.tvWeaponsEdited(Sender: TObject; Node: TTreeNode;
  var S: string);
var
  value, selectedLauncher, txt : string;
  iValue, iLauncherQuantity, iQuantity, idx, i, j, tmpLauncherQty : Integer;
  cnode,parent : TTreeNode;
  launcher : TFitted_Weap_Launcher_On_Board;
  idLauncher : Byte;
begin
  if Assigned(Node.Parent) then
  begin
    if not tvWeapons.IsEditing then
    begin
      if not Assigned(ToteSelectedPlatform) then
        Exit;

      // ========= GUN QUANTITY SETTING ==========
      if TT3PlatformInstance(Node.Parent.Data) is TT3GunOnVehicle then
      begin
        value:= S;
        TryStrToInt(value, iQuantity);
        SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
          TT3GunOnVehicle(Node.Parent.Data).InstanceIndex {GunDefinition.FPoint.FData.Point_Effect_Index},
          CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iQuantity,
          TT3GunOnVehicle(Node.Parent.Data).InstanceName);
      end
      // ========= MISSILE QUANTITY SETTING ==========
      else if TT3PlatformInstance(Node.Parent.Data) is TT3MissilesOnVehicle then
      begin
        idLauncher := 0;
        launcher   := nil;
        parent := Node.Parent;

        for j := 0 to TT3MissilesOnVehicle(Node.Parent.Data).MissileDefinition.FLaunchs.Count - 1 do
        begin
          launcher := TT3MissilesOnVehicle(Node.Parent.Data).MissileDefinition.FLaunchs.Items[j];
          if j = tvWeapons.Selected.Index then
          begin
            idLauncher := launcher.FData.Launcher_Type;
            Break;
          end;
        end;

        idx := LastDelimiter(':', S);
        value := Copy(S, idx + 2, length(S) - idx +1);
        TryStrToInt(value, iQuantity);

        if Assigned(launcher) then
        begin
          if iQuantity > launcher.FData.Launcher_Max_Qty then
          begin
            iQuantity := lastQuantity;
          end
          else if iQuantity < 0 then //coco 04052012
          begin
            iQuantity := 0;
          end;

          SimMgrClient.netSend_CmdSetLauncherQty(ToteSelectedPlatform.InstanceIndex,
            TT3MissilesOnVehicle(parent.Data).InstanceIndex,
            idLauncher, iQuantity);

          txt := parent.Text;
          idx := LastDelimiter(':', txt);
          value := Copy(txt, idx + 2, length(txt) - idx +1);
          TryStrToInt(value, iValue);

          if iValue > TT3MissilesOnVehicle(parent.Data).MissileDefinition.FLaunchs.Count then
          begin
            SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
              TT3MissilesOnVehicle(parent.Data).InstanceIndex,
              CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iValue - (iQuantity - lastQuantity),
              TT3MissilesOnVehicle(parent.Data).InstanceName);
          end
          else
          begin
            SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
              TT3MissilesOnVehicle(parent.Data).InstanceIndex,
              CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iValue + (iQuantity - lastQuantity),
              TT3MissilesOnVehicle(parent.Data).InstanceName);
          end;
        end;
      end
      // ========= TORPEDO QUANTITY SETTING ==========
      else if TT3PlatformInstance(Node.Parent.Data) is TT3TorpedoesOnVehicle then
      begin
        idLauncher := 0;
        launcher   := nil;
        parent := Node.Parent;

        for j := 0 to TT3TorpedoesOnVehicle(Node.Parent.Data).TorpedoDefinition.FLaunchs.Count - 1 do
        begin
          launcher := TT3TorpedoesOnVehicle(Node.Parent.Data).TorpedoDefinition.FLaunchs.Items[j];
          if j = tvWeapons.Selected.Index then
          begin
            idLauncher := launcher.FData.Launcher_Type;
            Break;
          end;
        end;

        idx := LastDelimiter(':', S);
        value := Copy(S, idx + 2, length(S) - idx +1);
        TryStrToInt(value, iQuantity);

        if Assigned(launcher) then
        begin
          if iQuantity > launcher.FData.Launcher_Max_Qty then
          begin
            iQuantity := launcher.FData.Launcher_Max_Qty;
          end
          else if iQuantity < 0 then
          begin
            iQuantity := 0;
          end;

          SimMgrClient.netSend_CmdSetLauncherQty(ToteSelectedPlatform.InstanceIndex,
            TT3TorpedoesOnVehicle(parent.Data).InstanceIndex,
            idLauncher, iQuantity);

          txt := parent.Text;
          idx := LastDelimiter(':', txt);
          value := Copy(txt, idx + 2, length(txt) - idx +1);
          TryStrToInt(value, iValue);

          if iValue > TT3TorpedoesOnVehicle(parent.Data).TorpedoDefinition.FLaunchs.Count then
          begin
            SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
              TT3TorpedoesOnVehicle(parent.Data).InstanceIndex,
              CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iValue - (iQuantity - lastQuantity),
              TT3TorpedoesOnVehicle(parent.Data).InstanceName);
          end
          else
          begin
            SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
              TT3TorpedoesOnVehicle(parent.Data).InstanceIndex,
              CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iValue + (iQuantity - lastQuantity),
              TT3TorpedoesOnVehicle(parent.Data).InstanceName);
          end;
        end;
      end
      // ========= MINE QUANTITY SETTING ==========
      else if TT3PlatformInstance(Node.Parent.Data) is TT3MineOnVehicle then begin
//        idx := LastDelimiter(':', S);
//        value := Copy(S, idx + 2, length(S) - idx +1);
        value:= S;
        TryStrToInt(value, iQuantity);

        SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
          TT3MineOnVehicle(Node.Parent.Data).InstanceIndex,
          CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iQuantity,
          TT3MineOnVehicle(Node.Parent.Data).InstanceName);
      end
      // ========= BOMB QUANTITY SETTING ==========
      else if TT3PlatformInstance(Node.Parent.Data) is TT3BombONVehicle then begin
        //idx := LastDelimiter(':', S);
        //value := Copy(S, idx + 2, length(S) - idx +1);
        value:= S;
        TryStrToInt(value, iQuantity);

        SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
          TT3BombONVehicle(Node.Parent.Data).InstanceIndex,
          CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iQuantity,
          TT3BombONVehicle(Node.Parent.Data).InstanceName);
      end
      //========= HYBRID QUANTITY SETTING ==========
      else if TT3PlatformInstance(Node.Parent.Data) is TT3HybridOnVehicle then begin
        //idx := LastDelimiter(':', S);
        //value := Copy(S, idx + 2, length(S) - idx +1);
        value:= S;
        TryStrToInt(value, iQuantity);

        SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
          TT3HybridOnVehicle(Node.Parent.Data).InstanceIndex,
          CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iQuantity,
          TT3HybridOnVehicle(Node.Parent.Data).InstanceName);
      end;
    end;
  end
  else
  begin
    if not Assigned(ToteSelectedPlatform) then
      Exit;

    cnode := tvWeapons.Selected;
    if TT3Unit(cnode.Data) is TT3GunOnVehicle then exit;

    idx := LastDelimiter(':', S);
    value := Copy(S, idx + 2, length(S) - idx +1);
    TryStrToInt(value, iValue);

    countLauncherOn := 0;

    // ========= MISSILE QUANTITY SETTING ==========
    if TT3Unit(Node.Data)is TT3MissilesOnVehicle then begin

      for i := 0 to TT3MissilesOnVehicle(cnode.Data).MissileDefinition.FLaunchs.Count - 1 do
      begin
        launcher := TT3MissilesOnVehicle(cnode.Data).MissileDefinition.FLaunchs.Items[i];

        if launcher.FData.Launcher_Qty > 0 then
          countLauncherOn := countLauncherOn + 1;
      end;

      if (iValue < lastQuantity) and (iValue < countLauncherOn)  then
      begin
        for i := TT3MissilesOnVehicle(cnode.Data).MissileDefinition.FLaunchs.Count - 1 downto 0 do
        begin
          launcher := TT3MissilesOnVehicle(cnode.Data).MissileDefinition.FLaunchs.Items[i];

          if launcher.FData.Launcher_Qty > 0 then
          begin
            if (launcher.FData.Launcher_Qty - (countLauncherOn-iValue)) < 0 then
            begin
              SimMgrClient.netSend_CmdSetLauncherQty(ToteSelectedPlatform.InstanceIndex,
                TT3MissilesOnVehicle(cnode.Data).InstanceIndex,
                launcher.FData.Launcher_Type, 0);

              countLauncherOn := countLauncherOn - launcher.FData.Launcher_Qty;
            end
            else
            begin
              SimMgrClient.netSend_CmdSetLauncherQty(ToteSelectedPlatform.InstanceIndex,
                TT3MissilesOnVehicle(cnode.Data).InstanceIndex,
                launcher.FData.Launcher_Type, launcher.FData.Launcher_Qty - (countLauncherOn-iValue));

              countLauncherOn := countLauncherOn - launcher.FData.Launcher_Qty;
            end;
          end;

          if countLauncherOn = iValue then
            Break;
        end;
      end;												//coco 04052012

      SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
        TT3MissilesOnVehicle(cnode.Data).InstanceIndex,
        CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iValue,
        TT3MissilesOnVehicle(cnode.Data).InstanceName);
    end

    // ========= TORPEDO QUANTITY SETTING ==========
    else if TT3Unit(Node.Data) is TT3TorpedoesOnVehicle then begin
      for i := 0 to TT3TorpedoesOnVehicle(cnode.Data).TorpedoDefinition.FLaunchs.Count - 1 do
      begin
        launcher := TT3TorpedoesOnVehicle(cnode.Data).TorpedoDefinition.FLaunchs.Items[i];

        if launcher.FData.Launcher_Qty > 0 then
          countLauncherOn := countLauncherOn + 1;
      end;

      if (iValue < lastQuantity) and (iValue < countLauncherOn)  then
      begin
        for i := TT3TorpedoesOnVehicle(cnode.Data).TorpedoDefinition.FLaunchs.Count - 1 downto 0 do
        begin
          launcher := TT3TorpedoesOnVehicle(cnode.Data).TorpedoDefinition.FLaunchs.Items[i];

          if launcher.FData.Launcher_Qty > 0 then
          begin
            if (launcher.FData.Launcher_Qty - (countLauncherOn-iValue)) < 0 then
            begin
              SimMgrClient.netSend_CmdSetLauncherQty(ToteSelectedPlatform.InstanceIndex,
                TT3TorpedoesOnVehicle(cnode.Data).InstanceIndex,
                launcher.FData.Launcher_Type, 0);

              countLauncherOn := countLauncherOn - launcher.FData.Launcher_Qty;
            end
            else
            begin
              SimMgrClient.netSend_CmdSetLauncherQty(ToteSelectedPlatform.InstanceIndex,
                TT3TorpedoesOnVehicle(cnode.Data).InstanceIndex,
                launcher.FData.Launcher_Type, launcher.FData.Launcher_Qty - (countLauncherOn-iValue));

              countLauncherOn := countLauncherOn - launcher.FData.Launcher_Qty;
            end;
          end;

          if countLauncherOn = iValue then
            Break;
        end;
      end;

      SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
        TT3TorpedoesOnVehicle(cnode.Data).InstanceIndex,
        CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iValue,
        TT3TorpedoesOnVehicle(cnode.Data).InstanceName);
    end
    // ========= MINE QUANTITY SETTING ==========
    else if TT3Unit(Node.Data) is TT3MineOnVehicle then begin
      idx := LastDelimiter(':', S);
      value := Copy(S, idx + 2, length(S) - idx +1);
      TryStrToInt(value, iQuantity);

      SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
        TT3MineOnVehicle(cnode.Data).InstanceIndex,
        CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iQuantity,
        TT3MineOnVehicle(cnode.Data).InstanceName);
    end
    // ========= BOMB QUANTITY SETTING ==========
    else if TT3Unit(Node.Data) is TT3BombONVehicle then begin
      idx := LastDelimiter(':', S);
      value := Copy(S, idx + 2, length(S) - idx +1);
      TryStrToInt(value, iQuantity);

      SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
        TT3BombONVehicle(cnode.Data).InstanceIndex,
        CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iQuantity,
        TT3BombONVehicle(cnode.Data).InstanceName);
    end
    //========= HYBRID QUANTITY SETTING ==========
    else if TT3PlatformInstance(Node.Parent.Data) is TT3HybridOnVehicle then begin
      //idx := LastDelimiter(':', S);
      //value := Copy(S, idx + 2, length(S) - idx +1);
      value:= S;
      TryStrToInt(value, iQuantity);

      SimMgrClient.netSend_CmdSetQuantity(ToteSelectedPlatform.InstanceIndex,
        TT3HybridOnVehicle(Node.Parent.Data).InstanceIndex,
        CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iQuantity,
        TT3HybridOnVehicle(Node.Parent.Data).InstanceName);
    end;
  end;
end;

procedure TfrmToteDisplay.tvWeaponsKeyPress(Sender: TObject;
  var Key: Char);
var
  node : TTreeNode;
  value : string;
  iValue : Integer;
//  process : boolean;
begin
  if not Assigned(tvWeapons.Selected) then
    Exit;
  if not (Key = #13) then
    Exit;

  node := tvWeapons.Selected.Parent;

  if Assigned(node) then
  begin
    if not tvWeapons.IsEditing then
    begin
      value:= AnsiRightStr(tvWeapons.Selected.Text, 3);
      TryStrToInt(value, iValue);
      //      process := true;
    end;
  end
  else
  begin
    //node := tvWeapons.Selected;

    value:= AnsiRightStr(tvWeapons.Selected.Text, 3);
    TryStrToInt(value, iValue);
    //    process := true;
  end;

//  if process then
//    SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(lvPlatforms.Selected.Data).InstanceIndex,
//      TT3Unit(Node.Data).InstanceIndex,
//      CORD_ID_QUANTITY, CORD_TYPE_WEAPON, iValue,
//      TT3Unit(Node.Data).InstanceName);
end;

procedure TfrmToteDisplay.tvWeaponsMouseDown(sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos: TPoint;
begin
  if CategoryPanelStatusOp.Enabled then
  begin
    if tvWeapons.Selected = nil then
      Exit;

    GetCursorPos(pos);

    if Button = mbRight then
    begin
      tvWeapons.Selected := tvWeapons.GetNodeAt(x, y);

      if tvWeapons.Selected <> nil then
      begin
        if tvWeapons.Selected.Parent <> nil then
        begin
          dam1.Enabled := False;
          Repair1.Enabled := False;
        end
        else
        begin
          if TT3Weapon(tvWeapons.Selected.Data).WeaponStatus = wsDamaged then
          begin
            dam1.Enabled := False;
            Repair1.Enabled := True;
          end
          else if TT3Weapon(tvWeapons.Selected.Data).WeaponStatus = wsUnavailable then
          begin
            dam1.Enabled := False;
            Repair1.Enabled := False;
          end
          else
          begin
            dam1.Enabled := True;
            Repair1.Enabled := False;
          end;
        end;

        pmWeapon.Popup(pos.X, pos.Y);
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.XMLToTree(tv: TTreeView; XMLDoc: TXMLDocument);
var
  iNode: IXMLNode;
  //temp: String;
  procedure ProcessNode(node: IXMLNode; tn: TTreeNode);
  var
    cNode: IXMLNode;
  begin
    if node = nil then
      Exit;
    with node do
    begin
      tn := tv.Items.AddChild(tn, Attributes['text']);
      tn.ImageIndex := Integer(Attributes['imageIndex']);
      tn.StateIndex := Integer(Attributes['stateIndex']);
    end;
    cNode := node.ChildNodes.First;
    while cNode <> nil do
    begin
      ProcessNode(cNode, tn);
      cNode := cNode.NextSibling;
    end;
  end;

(* ProcessNode *)
begin
  tv.Items.Clear;
  // XMLDoc.FileName := ChangeFileExt('setting', '.XML');
  XMLDoc.LoadFromFile('setting.XML');
  XMLDoc.AfterConstruction;
  XMLDoc.Active := true;
  iNode := XMLDoc.DocumentElement.ChildNodes.First;

  while iNode <> nil do
  begin
    ProcessNode(iNode, nil);
    iNode := iNode.NextSibling;
  end;

  XMLDoc.Active := False;
end;

procedure TfrmToteDisplay.DOMShow(ATree: TTreeView; Anode: IXMLNode;
  tNode: TTreeNode);
var
  i: Integer;
  NTNode: TTreeNode;
  NText: string;
  AttrNode: IXMLNode;
begin
  if not(Anode.NodeType = ntElement) then
    Exit;

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

procedure TfrmToteDisplay.edtAirTempExit(Sender: TObject);
var
  value : Double;
begin
  if not TryStrToFloat(edtAirTemp.Text, value) then
    Exit;

  edtAirTemp.Text := FormatFloat('0.0', value);
end;

procedure TfrmToteDisplay.edtAirTempKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToFloat(edtAirTemp.Text, value) then
      Exit;

    edtAirTemp.Text := FormatFloat('0.0', value);
  end;
end;

procedure TfrmToteDisplay.edtAtmRefractExit(Sender: TObject);
var
  value : Integer;
begin
  if not TryStrToInt(edtAtmRefract.Text, value) then
    Exit;

  if value > trbAtmRefract.Max then
    value := trbAtmRefract.Max;

  trbAtmRefract.Position := value;
end;

procedure TfrmToteDisplay.edtAtmRefractKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToInt(edtAtmRefract.Text, value) then
      Exit;

    if value > trbAtmRefract.Max then
      value := trbAtmRefract.Max;

    trbAtmRefract.Position := value;
  end;
end;

procedure TfrmToteDisplay.edtAttenCloudExit(Sender: TObject);
var
  value : Integer;
begin
  if not TryStrToInt(edtAttenCloud.Text, value) then
    Exit;

  if value > trbAttenCloud.Max then
    value := trbAttenCloud.Max;

  trbAttenCloud.Position := value;
end;

procedure TfrmToteDisplay.edtAttenCloudKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToInt(edtAttenCloud.Text, value) then
      Exit;

    if value > trbAttenCloud.Max then
      value := trbAttenCloud.Max;

    trbAttenCloud.Position := value;
  end;
end;

procedure TfrmToteDisplay.edtAttenRainRateExit(Sender: TObject);
var
  value : Integer;
begin
  if not TryStrToInt(edtAttenRainRate.Text, value) then
    Exit;

  if value > trbAttenRainRate.Max then
    value := trbAttenRainRate.Max;

  trbAttenRainRate.Position := value;
end;

procedure TfrmToteDisplay.edtAttenRainRateKeyPress(Sender: TObject;
  var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToInt(edtAttenRainRate.Text, value) then
      Exit;

    if value > trbAttenRainRate.Max then
      value := trbAttenRainRate.Max;

    trbAttenRainRate.Position := value;
  end;
end;

procedure TfrmToteDisplay.edtBarometricPressureExit(Sender: TObject);
begin
//
end;

procedure TfrmToteDisplay.edtBarometricPressureKeyPress(Sender: TObject;
  var Key: Char);
begin
//
end;

procedure TfrmToteDisplay.edtBottomLostExit(Sender: TObject);
var
  value : Integer;
begin
  if not TryStrToInt(edtBottomLost.Text, value) then
    Exit;

  if value > trbBottomLost.Max then
    value := trbBottomLost.Max;

  trbBottomLost.Position := value;
end;

procedure TfrmToteDisplay.edtBottomLostKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToInt(edtBottomLost.Text, value) then
      Exit;

    if value > trbBottomLost.Max then
      value := trbBottomLost.Max;

    trbBottomLost.Position := value;
  end;
end;

procedure TfrmToteDisplay.edtCloudBaseHeightExit(Sender: TObject);
begin
//
end;

procedure TfrmToteDisplay.edtCloudBaseHeightKeyPress(Sender: TObject;
  var Key: Char);
begin
//
end;

procedure TfrmToteDisplay.edtDayInfraExit(Sender: TObject);
var
  value : Integer;
begin
  if not TryStrToInt(edtDayInfra.Text, value) then
    Exit;

  if value > trbDaytimeInfra.Max then
    value := trbDaytimeInfra.Max;

  trbDaytimeInfra.Position := value;
end;

procedure TfrmToteDisplay.edtDayInfraKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToInt(edtDayInfra.Text, value) then
      Exit;

    if value > trbDaytimeInfra.Max then
      value := trbDaytimeInfra.Max;

    trbDaytimeInfra.Position := value;
  end;
end;

procedure TfrmToteDisplay.edtDayVisExit(Sender: TObject);
var
  value : Integer;
begin
  if not TryStrToInt(edtDayVis.Text, value) then
    Exit;

  if value > trbDaytimeVisual.Max then
    value := trbDaytimeVisual.Max;

  trbDaytimeVisual.Position := value;
end;

procedure TfrmToteDisplay.edtDayVisKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToInt(edtDayVis.Text, value) then
      Exit;

    if value > trbDaytimeVisual.Max then
      value := trbDaytimeVisual.Max;

    trbDaytimeVisual.Position := value;
  end;
end;

procedure TfrmToteDisplay.edtEmbarkQuantityKeyPress(Sender: TObject;
      var Key: Char);
begin
  if Key = #13 then
  begin
    SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(lvPlatforms.Selected.Data).InstanceIndex,
        TT3EmbarkedVehicle(tvEmbarkedPlatforms.Selected.Data).EmbarkedVehicle.Hosted_Vehicle_Index,
        CORD_ID_QUANTITY, CORD_TYPE_EMBARK, StrToInt(edtEmbarkQuantity.Text));

    lvPlatforms.Selected.Focused := true;
    lvPlatformsSelectItem(lvPlatforms, lvPlatforms.Selected, True);
    edtEmbarkQuantity.Visible := false;
  end;
end;

procedure TfrmToteDisplay.edtExsportKeyPress(Sender: TObject; var Key: Char);
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
end;

procedure TfrmToteDisplay.edtLogisticKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetNumberOfKoma(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;
end;

procedure TfrmToteDisplay.edtNightInfraExit(Sender: TObject);
var
  value : Integer;
begin
  if not TryStrToInt(edtNightInfra.Text, value) then
    Exit;

  if value > trbNighttimeInfra.Max then
    value := trbNighttimeInfra.Max;

  trbNighttimeInfra.Position := value;
end;

procedure TfrmToteDisplay.edtNightInfraKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToInt(edtNightInfra.Text, value) then
      Exit;

    if value > trbNighttimeInfra.Max then
      value := trbNighttimeInfra.Max;

    trbNighttimeInfra.Position := value;
  end;
end;

procedure TfrmToteDisplay.edtNightVisExit(Sender: TObject);
var
  value : Integer;
begin
  if not TryStrToInt(edtNightVis.Text, value) then
    Exit;

  if value > trbNighttimeVisual.Max then
    value := trbNighttimeVisual.Max;

  trbNighttimeVisual.Position := value;
end;

procedure TfrmToteDisplay.edtNightVisKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToInt(edtNightVis.Text, value) then
      Exit;

    if value > trbNighttimeVisual.Max then
      value := trbNighttimeVisual.Max;

    trbNighttimeVisual.Position := value;
  end;
end;

procedure TfrmToteDisplay.edtOceanCurrentDirectionKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  OceanCurrent_Direction : Double;
  rec: TrecSinc_Envi;
  env : TEnvi;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(edtOceanCurrentDirection.Text, OceanCurrent_Direction);
    edtOceanCurrentDirection.Text := ' ';

    with rec do
    begin
      rec.Envi_Chance := 15;

      if lvEnviroArea.ItemIndex <> -1 then
        rec.Envi_Type := lvEnviroArea.ItemIndex
      else
        rec.Envi_Type := 0;

      rec.Value       := OceanCurrent_Direction;
    end;

    if Assigned(lvEnviroArea.Selected) then
    begin
      env := lvEnviroArea.Selected.Data;

      if env is TSubArea_Enviro_Definition then
        rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
      else
        rec.Sub_EnviID := 0;
    end;

    simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
end;

procedure TfrmToteDisplay.edtOceanCurrentSpeedKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  OceanCurrent_Speed : Double;
  rec: TrecSinc_Envi;
  env : TEnvi;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
     TryStrToFloat(edtOceanCurrentSpeed.Text, OceanCurrent_Speed);
     edtOceanCurrentSpeed.Text := ' ';

     with rec do
     begin
       rec.Envi_Chance := 14;

       if lvEnviroArea.ItemIndex <> -1 then
         rec.Envi_Type := lvEnviroArea.ItemIndex
       else
         rec.Envi_Type := 0;

       rec.Value       := OceanCurrent_Speed;
     end;

     if Assigned(lvEnviroArea.Selected) then
     begin
       env := lvEnviroArea.Selected.Data;

       if env is TSubArea_Enviro_Definition then
          rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
       else
          rec.Sub_EnviID := 0;
     end;

     simMgrClient.netSend_CmdSyncEnvi(rec);
  end;
end;

procedure TfrmToteDisplay.edtSeaStateExit(Sender: TObject);
var
  value : Integer;
begin
  if not TryStrToInt(edtSeaState.Text, value) then
    Exit;

  if value > trbSeaState.Max then
    value := trbSeaState.Max;

  trbSeaState.Position := value;
end;

procedure TfrmToteDisplay.edtSeaStateKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToInt(edtSeaState.Text, value) then
      Exit;

    if value > trbSeaState.Max then
      value := trbSeaState.Max;

    trbSeaState.Position := value;

    applyEnviAboveWater;
    applyEnviSurfaceSubsurface;
  end;
end;

procedure TfrmToteDisplay.edtStateKeyPress(Sender: TObject; var Key: Char);
var
  value: Single;
  rec : TRecCmd_Platform_Repair;
  recState : TRecCmd_Change_SystemState;
  tObj     : TSimObject;
  platInstance  : TT3PlatformInstance;
begin
  if edtState.Text = '' then
    Exit;

  if TryStrToFloat(edtState.Text, value) then
  begin
    if Key = #13 then
    begin
      if value < 0 then
        value := 0;

      if value > 100 then
        value := 100;

      tObj := lvPlatforms.Selected.Data;
      if Assigned(tObj) and (tObj is TT3PlatformInstance) then
      begin
       platInstance := TT3PlatformInstance(tObj);

        if tagState = tagOverallDamage then
        begin
          rec.PlatfomID := platInstance.InstanceIndex;
          rec.HealthPercent := 100 - value;
          rec.Health  :=  (rec.HealthPercent/100)*(platInstance.DamageStatus.DamageCapacity);

          if rec.HealthPercent <= 0 then
            rec.nDormant := True
          else
            rec.nDormant := False;

          simMgrClient.netSend_CmdPlatform_Repair(rec);
          edtState.Visible := false;
        end
        else if tagState = tagFuelRemaining then
        begin
          if Assigned(platInstance.UnitMotion) then begin
            if platInstance.UnitMotion.FData.Endurance_Type = 0 then
            begin
              recState.PlatfomID := platInstance.InstanceIndex;
              recState.StateID := tagFuelRemaining;
              recState.nValue := (value/100) * (platInstance.FuelCapacity);

              simMgrClient.netSend_Cmd_Change_SystemState(recState);
              edtState.Visible := false;
            end
            else
            begin
              frmTacticalDisplay.addStatus('Fuel type is UNLIMITED');
              edtState.Visible := false;
            end;
          end;
        end
        else if tagState = tagSpeed then
        begin
          recState.PlatfomID := platInstance.InstanceIndex;
          recState.StateID := tagSpeed;
          recState.nValue := value;//(value/100) * TT3Vehicle(tobj).DamagePercentSpeed;

          simMgrClient.netSend_Cmd_Change_SystemState(recState);
          edtState.Visible := False;
        end;
      end;
    end;
  end
  else
    ShowMessage('Non Integer Input');
end;

procedure TfrmToteDisplay.edtWeaponQuantityKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if TT3Weapon(tvWeapons.Selected.Data) is TT3GunOnVehicle then
    begin
      //TT3GunOnVehicle(tvWeapons.Selected.Data).Quantity := StrToInt(edtWeaponQuantity.Text);

      SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(lvPlatforms.Selected.Data).InstanceIndex,
        TT3PlatformInstance(tvWeapons.Selected.Data).InstanceIndex,
        CORD_ID_QUANTITY, CORD_TYPE_WEAPON, StrToInt(edtWeaponQuantity.Text));
    end
    else if TT3Weapon(tvWeapons.Selected.Data) is TT3MissilesOnVehicle then
    begin
      //TT3MissilesOnVehicle(tvWeapons.Selected.Data).Quantity := StrToInt(edtWeaponQuantity.Text);

      SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(lvPlatforms.Selected.Data).InstanceIndex,
        TT3PlatformInstance(tvWeapons.Selected.Data).InstanceIndex,
        CORD_ID_QUANTITY, CORD_TYPE_WEAPON, StrToInt(edtWeaponQuantity.Text));
    end
    else if TT3Weapon(tvWeapons.Selected.Data) is TT3TorpedoesOnVehicle then
    begin
      //TT3TorpedoesOnVehicle(tvWeapons.Selected.Data).Quantity := StrToInt(edtWeaponQuantity.Text);

      SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(lvPlatforms.Selected.Data).InstanceIndex,
        TT3PlatformInstance(tvWeapons.Selected.Data).InstanceIndex,
        CORD_ID_QUANTITY, CORD_TYPE_WEAPON, StrToInt(edtWeaponQuantity.Text));
    end
    else if TT3Weapon(tvWeapons.Selected.Data) is TT3MineOnVehicle then
    begin
      //TT3MineOnVehicle(tvWeapons.Selected.Data).Quantity := StrToInt(edtWeaponQuantity.Text);

      SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(lvPlatforms.Selected.Data).InstanceIndex,
        TT3PlatformInstance(tvWeapons.Selected.Data).InstanceIndex,
        CORD_ID_QUANTITY, CORD_TYPE_WEAPON, StrToInt(edtWeaponQuantity.Text));
    end
    else if TT3Weapon(tvWeapons.Selected.Data) is TT3BombONVehicle then
    begin
      //TT3BombONVehicle(tvWeapons.Selected.Data).Quantity := StrToInt(edtWeaponQuantity.Text);

      SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(lvPlatforms.Selected.Data).InstanceIndex,
        TT3PlatformInstance(tvWeapons.Selected.Data).InstanceIndex,
        CORD_ID_QUANTITY, CORD_TYPE_WEAPON, StrToInt(edtWeaponQuantity.Text));
    end;

    lvPlatforms.Selected.Focused := true;
    lvPlatformsSelectItem(lvPlatforms, lvPlatforms.Selected, True);
    edtWeaponQuantity.Visible := false;
  end;
end;

procedure TfrmToteDisplay.edtWindDirExit(Sender: TObject);
var
  value : Double;
begin
  if not TryStrToFloat(edtWindDir.Text, value) then
    Exit;

  if value >= 360 then
    value := 0;

  rw.Degree := value;
end;

procedure TfrmToteDisplay.edtWindDirKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToFloat(edtWindDir.Text, value) then
      Exit;

    if value >= 360 then
      value := 0;

    rw.Degree := value;
  end;
end;

procedure TfrmToteDisplay.edtWindSpeedExit(Sender: TObject);
var
  value : Double;
begin
  if not TryStrToFloat(edtWindSpeed.Text, value) then
    Exit;

  edtWindSpeed.Text := FormatFloat('0.0', value);
end;

procedure TfrmToteDisplay.edtWindSpeedKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
    if not TryStrToFloat(edtWindSpeed.Text, value) then
      Exit;

    edtWindSpeed.Text := FormatFloat('0.0', value);
  end;
end;

procedure TfrmToteDisplay.RotWheelAboveDegreeChange(sender: TObject);
begin
  edtWindDir.Text := FormatFloat('000', rw.Degree);
end;

procedure TfrmToteDisplay.RotWheelSurfaceChange(sender: TObject);
begin
  edtOceanCurrentDirection.Text := FormatFloat('000', rw1.Degree);
end;

procedure TfrmToteDisplay.SetAvailableQuantity1Click(sender: TObject);
begin
  if tvCountermeasures.Selected = nil then
    Exit;
  tvCountermeasures.Selected.Focused := true;
end;

procedure TfrmToteDisplay.SetAvailableQuantity2Click(sender: TObject);
var
  idx, i  : Integer;
  value, S : string;
begin
  if (tvWeapons.Selected = nil) then
    Exit;

  if tvWeapons.Selected.Parent = nil then
  begin
    if (TT3Weapon(tvWeapons.Selected.Data) is TT3GunOnVehicle) or
       (TT3Weapon(tvWeapons.Selected.Data) is TT3BombONVehicle) or
       (TT3Weapon(tvWeapons.Selected.Data) is TT3MineONVehicle) or
       (TT3Weapon(tvWeapons.Selected.Data) is TT3HybridOnVehicle) then
    begin
      tvWeapons.Selected.getFirstChild.EditText;
      value := tvWeapons.Selected.getFirstChild.Text;
    end
    else
    begin
      tvWeapons.Selected.EditText;
      S := tvWeapons.Selected.Text;
      idx := LastDelimiter(':', S);
      value := Copy(S, idx + 2, length(S) - idx +1);
    end;
  end
  else
  begin
    if (TT3Weapon(tvWeapons.Selected.Parent.Data) is TT3GunOnVehicle) or
       (TT3Weapon(tvWeapons.Selected.Parent.Data) is TT3BombONVehicle) or
       (TT3Weapon(tvWeapons.Selected.Parent.Data) is TT3MineONVehicle) or
       (TT3Weapon(tvWeapons.Selected.Data) is TT3HybridOnVehicle) then
    begin
      tvWeapons.Selected.EditText;
      value := tvWeapons.Selected.Text;
    end
    else
    begin
      tvWeapons.Selected.EditText;
      S := tvWeapons.Selected.Text;
      idx := LastDelimiter(':', S);
      value := Copy(S, idx + 2, length(S) - idx +1);
    end;
  end;

  lastQuantity := StrToInt(value);

  PostKey(VK_RIGHT, [], False);
  for I := 0 to Length(value) - 1 do
    PostKey(VK_LEFT, [ssShift], False);
end;

procedure TfrmToteDisplay.setWheel;
begin
  rw := TRotWheel.Create(self);
  rw.Parent := pnWheelAbove;
  rw.Left := 0;
  rw.Top := 0;
  rw.Width := pnWheelAbove.Width;
  rw.Height := pnWheelAbove.Height;
  rw.OnDegreeChange := RotWheelAboveDegreeChange;

  rw1 := TRotWheel.Create(self);
  rw1.Parent := pnlWheelSurface;
  rw1.Left := 0;
  rw1.Top := 0;
  rw1.Width := pnlWheelSurface.Width;
  rw1.Height := pnlWheelSurface.Height;
  rw1.OnDegreeChange := RotWheelSurfaceChange;
end;

procedure TfrmToteDisplay.setGroupListToDataLinkCombo;
var
  mi : TMenuItem;
  I: Integer;
  cubGroup : T3CubicleGroup;
  forceColor : String;
begin
  pmDLForce.Items.Clear;

  for I := 0 to simMgrClient.CubAssignList.Count - 1 do
  begin
    cubGroup := simMgrClient.CubAssignList.Items[I] as T3CubicleGroup;
	  if not(Assigned(cubGroup)) then
      Continue;

    mi := TMenuItem.Create(pmDLForce);
    case cubGroup.FData.Force_Designation of
      1:
        begin
          forceColor := 'Red';
        end;
      2:
        begin
          forceColor := 'Yellow';
        end;
      3:
        begin
          forceColor := 'Blue';
        end;
      4:
        begin
          forceColor := 'Green';
        end;
      5:
        begin
          forceColor := 'No Force';
        end;
      6:
        begin
          forceColor := 'Black';
        end;
    end;

    mi.Caption := forceColor;
    mi.Tag := cubGroup.FData.Force_Designation;
    mi.Hint := forceColor;
    mi.OnClick := GroupDataLinkClick;

    pmDLForce.Items.Add(mi);
  end;
end;

procedure TfrmToteDisplay.GroupDataLinkClick(Sender : TObject);
var
  //cubGroup : T3CubicleGroup;
  //groupMember : T3CubicleGroupMember;
  I : Integer;
  aPlatform : TT3PlatformInstance;
  li : TListItem;
begin
  if not (Sender is TMenuItem) then
    Exit;

  edtDLForce.Text := TMenuItem(Sender).Hint;

  //cubGroup := simMgrClient.CubAssignList.GetGroupByID(TMenuItem(Sender).Tag) as T3CubicleGroup;
  //clear List
  lvEligibleUnits.Clear;

  for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
  begin
    aPlatform := simMgrClient.SimPlatforms.getObject(I) as TT3PlatformInstance;
    if aPlatform is TT3NonRealVehicle then
      Break;

    if aPlatform.Force_Designation = TMenuItem(Sender).Tag then
    begin
      li := lvEligibleUnits.Items.Add;
      li.StateIndex := NON_DATALINK;
      li.ImageIndex := NON_DATALINK;
      li.Caption := aPlatform.InstanceName;
      li.Data := aPlatform;
    end;

  end;

  {
  for I := 0 to cubGroup.FSList.Count - 1 do
  begin
    groupMember := cubGroup.Items[I] as T3CubicleGroupMember;
    aPlatform := simMgrClient.FindT3PlatformByID(groupMember.FData.Platform_Instance_Index);

    //tambahkan platform ke List
    li := lvEligibleUnits.Items.Add;
    li.Caption := aPlatform.InstanceName;
    li.Data := aPlatform;

  end;
  }
end;

procedure TfrmToteDisplay.setDefaultHeaderMissile;
begin
  // set Surface to surface
  with sgSurfacetoSurface do
  begin
    Cells[0, 0] := 'Weapon';
    Cells[1, 0] := 'Cell';
    Cells[2, 0] := 'Status';
    Cells[3, 0] := 'Target';
    Cells[4, 0] := 'Engage Mode';
    Cells[5, 0] := 'Firing Angle';
    Cells[6, 0] := 'Time Until Launch';
    Cells[7, 0] := 'Time Of Flight';
  end;

  // set surface to air
  with sgSurfacetoAir do
  begin
    Cells[0, 0] := 'Launching Platform Name';
    Cells[1, 0] := 'SAM Mount(designation)';
    Cells[2, 0] := 'Target Track Number';
    Cells[3, 0] := 'Target Course';
    Cells[4, 0] := 'Target Ground Speed';
    Cells[5, 0] := 'Target Altitude';
    Cells[6, 0] := 'Time To Wait';
    Cells[7, 0] := 'Time To Intercept';
  end;
end;

procedure TfrmToteDisplay.SetDefaultWidthForStringGridMissileEngagement;
//var
//  i : Integer;
begin
  // set Surface to surface
  with sgSurfacetoSurface do
  begin
    ColWidths[0] := 350;
    ColWidths[1] := 100;
    ColWidths[2] := 100;
    ColWidths[3] := 200;
    ColWidths[4] := 100;
    ColWidths[5] := 100;
    ColWidths[6] := 150;
    ColWidths[7] := 150;
  end;

  // set surface to air
  with sgSurfacetoAir do
  begin
    ColWidths[0] := 330;
    ColWidths[1] := 120;
    ColWidths[2] := 120;
    ColWidths[3] := 200;
    ColWidths[4] := 120;
    ColWidths[5] := 100;
    ColWidths[6] := 150;
    ColWidths[7] := 150;
  end;
end;

procedure TfrmToteDisplay.setHeaderEmitter;
begin
  with sgEmitters do
  begin
    Cells[0, 0] := '';
    Cells[1, 0] := 'Name';
    Cells[2, 0] := 'Type';
    Cells[3, 0] := 'Spot Number';
    Cells[4, 0] := 'Confidence Level';
    Cells[5, 0] := 'First Detected';
    Cells[6, 0] := 'Last Detected';
  end;
end;

procedure TfrmToteDisplay.setHeaderDataLinkControl;
begin

end;

procedure TfrmToteDisplay.setHeaderMergedTrack;
begin

end;

procedure TfrmToteDisplay.setHeaderMessageHandling;
begin
  {
    with sgMessageSent do
    begin
    Cells[0, 0] := 'To';
    Cells[1, 0] := 'Subject';
    Cells[2, 0] := 'Priority';
    end;

    with sgMessageReceived do
    begin
    Cells[0, 0] := 'To';
    Cells[1, 0] := 'Subject';
    Cells[2, 0] := 'Priority';
    end;

    with sgMessageDraft do
    begin
    Cells[0, 0] := 'To';
    Cells[1, 0] := 'Subject';
    Cells[2, 0] := 'Priority';
    end;
    }
end;

procedure TfrmToteDisplay.setHeaderAudioRecord;
begin
  {
  with sgAvailableExChannel do
  begin
    Cells[0, 0] := 'Channel';
    Cells[1, 0] := 'Name';
    Cells[2, 0] := 'Code';
  end;

  with sgInChannel do
  begin
    Cells[0, 0] := 'Cubicle';
    Cells[1, 0] := 'Position';
  end;

  with sgExChannel do
  begin
    Cells[0, 0] := 'Channel';
    Cells[1, 0] := 'Name';
    Cells[2, 0] := 'Code';
  end;

  with sgAvailableInChannel do
  begin
    Cells[0, 0] := 'Cubicle';
    Cells[1, 0] := 'Position';
  end;
  }
end;

procedure TfrmToteDisplay.setHeaderCommChannelDef;
begin
  with sgCommChannelDef do
  begin
    Cells[0, 0] := 'Enabled';
    Cells[1, 0] := 'Channel';
    Cells[2, 0] := 'Name';
    Cells[3, 0] := 'Code';
    Cells[4, 0] := 'Band';
    Cells[5, 0] := 'Frequency[MHz]';
    Cells[6, 0] := 'Secure';
  end;
end;

procedure TfrmToteDisplay.setHeaderCommChannelMap;
begin
{
  with sgAvailableChannel do
  begin
    Cells[0, 0] := 'Channel';
    Cells[1, 0] := 'Name';
    Cells[2, 0] := 'Code';
  end;

  with sgMappedChannel do
  begin
    Cells[0, 0] := 'Channel';
    Cells[1, 0] := 'Name';
    Cells[2, 0] := 'Code';
    Cells[3, 0] := 'CCT Button';
  end;
 }
end;

procedure TfrmToteDisplay.setHeaderCommInInjection;
begin
  with sgComInInjection do
  begin
    Cells[0, 0] := 'Channel';
    Cells[1, 0] := 'Name';
    Cells[2, 0] := 'Code';
    Cells[3, 0] := 'Sound Effects';
    Cells[4, 0] := 'Record/Replay Interference';
  end;
end;

procedure TfrmToteDisplay.setRoleClient(rc: Integer);
begin
  // instruktur
  if rc = crpInstruktur then
  begin
	  CategoryPanelStatusOp.Enabled := true;
    CategoryPanelStatusOp.Visible := true;
    CategoryPanelWeaponOp.Enabled := false; //sementara dihide
    CategoryPanelWeaponOp.Visible := false; //sementara dihide
    CategoryPanelCommOp.Enabled := false;
    CategoryPanelCommOp.Visible := false;
    CategoryPanelManagementOp.Enabled := true;
    CategoryPanelManagementOp.Visible := true;

    CategoryPanelStatusCub.Enabled := False;
    CategoryPanelStatusCub.Visible := False;
    CategoryPanelWeaponCub.Enabled := False;
    CategoryPanelWeaponCub.Visible := False;
    CategoryPanelCommCub.Enabled := False;
    CategoryPanelCommCub.Visible := False;

//    if vMapSetting.FormViewer then
//    begin
      CategoryViewTacticalWas.Enabled := True;
      CategoryViewTacticalWas.Visible := True;
//    end
//    else
//    begin
//      CategoryViewTacticalWas.Enabled := False;      //dng set tactical button view, visible for all users
//      CategoryViewTacticalWas.Visible := False;
//    end;

    //new ui

    pnlStatusOp.Visible := True;
    pnlManagement.Visible := True;
    pnlView.Visible := True;

    if simMgrClient.ISWasdal then
    begin
      SetPanelLeftToteDisplayForWasdal;

      View1.Visible := False;
      Hook1.Visible := False;
      rack1.Visible := False;
      ools1.Visible := False;
      Help1.Visible := False;

      CategoryViewTacticalWas.Enabled := True;
      CategoryViewTacticalWas.Visible := False;

      SetupWasdalUI;
    end;
  end
  // cubicle
  else if rc = crpCubicle then
  begin
    CategoryPanelStatusOp.Enabled := False;
    CategoryPanelStatusOp.Visible := False;
    CategoryPanelWeaponOp.Enabled := False;
    CategoryPanelWeaponOp.Visible := False;
    CategoryPanelCommOp.Enabled := False;
    CategoryPanelCommOp.Visible := False;
    CategoryPanelManagementOp.Enabled := False;
    CategoryPanelManagementOp.Visible := False;

    CategoryPanelStatusCub.Enabled := true;
    CategoryPanelStatusCub.Visible := true;
    CategoryPanelWeaponCub.Enabled := false;   //sementara dihide
    CategoryPanelWeaponCub.Visible := false;   //sementara dihide
    CategoryPanelCommCub.Enabled := false;
    CategoryPanelCommCub.Visible := false;

//    CategoryViewTacticalWas.Enabled := False;
//    CategoryViewTacticalWas.Visible := False;

    CategoryViewTacticalWas.Enabled := True;
    CategoryViewTacticalWas.Visible := True;

    //new ui
    pnlStatusCub.Visible := True;
    pnlView.Visible := True;

  end;
end;

procedure TfrmToteDisplay.settimeDTOT;
begin
  StartDTOT := TimeOf(simMgrClient.GameTIME);
end;

procedure TfrmToteDisplay.SetTimerMissileLauch(veh : TT3Vehicle);
begin

end;

procedure TfrmToteDisplay.cbSetEnDisClick(sender: TObject);
begin
  if tvSettings.Selected = nil then
    Exit;

  if cbSetEnDis.Checked then
  begin
    changeGameSettingValue(tvSettings.Selected.SelectedIndex,'Enable');
    //changeValueTreeSettingItems(tvSettings.Selected, 'Enable');
  end
  else
  begin
    changeGameSettingValue(tvSettings.Selected.SelectedIndex,'Disable');
    //changeValueTreeSettingItems(tvSettings.Selected, 'Disable');
  end;
end;

procedure TfrmToteDisplay.cbxShippingRateChange(Sender: TObject);
var
  rec: TrecSinc_Envi;
  env : TEnvi;
begin
  //---------------set envvi Shadow Zone Transmision Loss--------------------//
   with rec do
   begin
     rec.Envi_Chance := E_Shipping_Rate;

     if lvEnviroArea.ItemIndex <> -1 then
       rec.Envi_Type := lvEnviroArea.ItemIndex
     else
       rec.Envi_Type := 0;

     rec.Value       := cbxShippingRate.ItemIndex;

   end;

   if Assigned(lvEnviroArea.Selected) then
   begin
     env := lvEnviroArea.Selected.Data;

     if env is TSubArea_Enviro_Definition then
      rec.Sub_EnviID := TSubArea_Enviro_Definition(env).FData.Enviro_Index
     else
      rec.Sub_EnviID := 0;
   end;

   simMgrClient.netSend_CmdSyncEnvi(rec);
end;

function TfrmToteDisplay.CekMaxCapacity(var flag: integer): Boolean;
var
  velueTemp : Double;
begin
  result := False;

  flag := 1;
  {$REGION ' Validasi format inputan '}
  if not TryStrToFloat(edtLogistic.Text, velueTemp) then
    exit;
  {$ENDREGION}

  flag := 2;
  {$REGION ' Validasi batas maksimum inputan '}
  case LogisticItemID of
    liFuel :
    begin
      if LogisticSelectedPlatform.FuelCapacity < velueTemp then
      begin
        ShowMessage('Over maximum capacity, Fuel maximum capacity is ' + FormatFloat('0.00', LogisticSelectedPlatform.FuelCapacity) + ' m3');
        exit;
      end;
    end;
    liLubricants :
    begin
      if LogisticSelectedPlatform.MLCapacity < velueTemp then
      begin
        ShowMessage('Over maximum capacity, Lubricants maximum capacity is ' + FormatFloat('0.00', LogisticSelectedPlatform.MLCapacity) + ' m3');
        exit;
      end;
    end;
    liWater :
    begin
      if LogisticSelectedPlatform.ATCapacity < velueTemp then
      begin
        ShowMessage('Over maximum capacity, Water maximum capacity is ' + FormatFloat('0.00', LogisticSelectedPlatform.WaterCapacity) + ' m3');
        exit;
      end;
    end;
    liFood :
    begin
      if LogisticSelectedPlatform.FoodCapacity < velueTemp then
      begin
        ShowMessage('Over maximum capacity, Food maximum capacity is ' + FormatFloat('0.00', LogisticSelectedPlatform.FoodCapacity) + ' ton');
        exit;
      end;
    end;
  end;
  {$ENDREGION}

  result := True;
end;

function TfrmToteDisplay.cekPangkalan(posShip : t2DPoint; var ShipLog: TT3PlatformInstance): Boolean;
var
  i : Integer;
  pi: TT3PlatformInstance;
  range, range1 : Double;
begin
  Result := False;

  with simMgrClient do
  begin
    for i := 0 to SimPlatforms.itemCount - 1 do
    begin
      pi := TT3PlatformInstance(SimPlatforms.getObject(i));
      if not(Assigned(pi)) then Continue;

      if (pi is TT3Vehicle) then
      begin
        if TVehicle_Definition(pi.UnitDefinition).FData.Platform_Domain = vhdLand then
        begin
          range := CalcRange(posShip.X, posShip.Y, TT3Vehicle(pi).PosX, TT3Vehicle(pi).PosY);

          if range < range1 then
          begin
            range1 := range;
            Result := True;
            ShipLog := pi;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.changeGameSettingValue(index: integer;
  const new: String);
var
  rgs : TRecCmd_GameSetting;
begin

  rgs.SessionID := simMgrClient.SessionID;
  rgs.Index     := index;

  case index of
    GSID_AUTOREMOVEPF, GSID_RPTAIRBUBBLERMV,
    GSID_RPTCHAFFRMV, GSID_RPTSONOBUOYRMV,
    GSID_AIRCRAFTCOLLTERRAIN, GSID_COASTLINECOLL,
    GSID_SimplifiedSensor, GSID_CanLaunchAircraft,
    GSID_LaunchRestrictions, GSID_TidalStreamEffects,
    GSID_WindEffects, GSID_RecordReplayInterf,
    GSID_ControllerSoundEff, GSID_InterfSoundEffects,
    GSID_AutomaticSensorId, GSID_ChaffAttenuation,
    GSID_AutomaticSonarTarget, GSID_EODatalink_1,
    GSID_EODatalink_2, GSID_EODatalink_3, GSID_ESMDatalink_1,
    GSID_ESMDatalink_2,GSID_ESMDatalink_3,GSID_IFFDatalink_1,
    GSID_IFFDatalink_2, GSID_IFFDatalink_3, GSID_RadarDatalink_1,
    GSID_RadarDatalink_2,GSID_RadarDatalink_3,GSID_SonarDatalink_1,
    GSID_SonarDatalink_2,GSID_SonarDatalink_3, GSID_IFFFilter,
    GSID_LandmassOcculting,GSID_ProcessSensorBZ,
    GSID_AcTorpedoDecoySetup, GSID_AntiSurfaceWarEng,
    GSID_AntiSubsurfaceWarEng, GSID_ProcessWeaponBZ:
      begin
        if new = 'Disable' then
          rgs.ValBoolean := false
        else
          rgs.ValBoolean := true;
      end;

    GSID_GuidanceCommand :
      begin
        if new = 'Realistic' then
          rgs.ValByte := 0
        else
          rgs.ValByte := 1;
      end;

    GSID_PROBOFKILL   :
      begin
        if new = 'Normal' then
          rgs.ValByte := 0
        else
        if new = 'Always kill if hit' then
          rgs.ValByte := 1
        else
          rgs.ValByte := 2
      end;

    GSID_WRECKTIME, GSID_FLASHTransmission, GSID_IMMEDTransmission,
    GSID_PRIORITYTransmission, GSID_RoutineTransmission,
    GSID_AcBearingDispLost,GSID_AcBearingDropTrack,
    GSID_AirDropTrack, GSID_AirDispLost,
    GSID_ESMBearingDropTrack, GSID_ESMBearingDispLost,
    GSID_SubsurfaceDropTrack, GSID_SubsurfaceDispLost,
    GSID_SurfaceLandDropTrack, GSID_SurfaceLandDispLost,
    GSID_VisualVisDetectF :
      begin
        rgs.ValInteger := TimeStringToSecond(new);
      end;

    GSID_CubicalGroupClutter :
      begin
        TryStrToFloat(new,rgs.ValDouble);
      end;

  end;

  if rgs.Index > 0 then
    SimMgrClient.netSend_GameSetting(rgs);

end;

procedure TfrmToteDisplay.changeValueTreeSettingItems(node: TTreeNode;
  const new: String);
var
  //s: String;
  temp: String;
begin
  if node <> nil then
  begin
    temp := getValueTreeSettingItems(node);
    node.Text := ReplaceStr(node.Text, temp, new);
  end;
end;

procedure TfrmToteDisplay.changeWreckTimeRemoval(Value: integer);
var node : TTreeNode;
begin
  if tvSettings.Items.Count <= 0 then exit;

  node := GetItemByIndex(tvSettings.Items.Item[0],GSID_WRECKTIME);
  if node <> nil then
    changeValueTreeSettingItems(node,SecondToTimeString(Value));

end;

procedure TfrmToteDisplay.dam1Click(sender: TObject);
var
  node : TTreeNode;
  stats : Byte;
begin
  if (tvWeapons.Selected = nil) and not (tvWeapons.Selected.Parent = nil ) then
    Exit;

  node := tvWeapons.Selected;
  stats := Byte(wsDamaged);

  if not Assigned(ToteSelectedPlatform) then
    Exit;

  SimMgrClient.netSend_CmdSetStatus(ToteSelectedPlatform.InstanceIndex,
      TT3PlatformInstance(node.Data).InstanceIndex,
      CORD_ID_QUANTITY, CORD_TYPE_WEAPON, stats);

  lvPlatformsSelectItem(lvPlatforms, lvPlatforms.Selected, True);
  lvPlatforms.Selected.Focused := true;
  Invalidate;
end;

procedure TfrmToteDisplay.damage1Click(sender: TObject);
//var
  //index : Integer;
  //ve : TT3Vehicle;
begin
  if (lvSensors.Selected = nil) or (lvSensors.ItemIndex = -1) then
    Exit;

  // TT3Sensor(lvSensors.Selected.Data).OperationalStatus := sopDamage;
  //index := TT3Sensor(TT3Vehicle(lvPlatforms.Selected.Data).Devices.Items
  //    [lvSensors.ItemIndex]).InstanceIndex;
  with simMgrClient do
  begin
    TT3Sensor(lvSensors.Selected.Data).OperationalStatus := sopDamage;
  end;
  lvPlatformsSelectItem(lvPlatforms, lvPlatforms.Selected, True);
  lvPlatforms.Selected.Focused := true;
  Invalidate;
  UpdateSensorVehicle(TT3Vehicle(lvPlatforms.Selected.Data));
end;

function TfrmToteDisplay.getValueNodeSettingItems(node: TTreeNode): String;
var
  str: String;
  return: String;
  start, ending: Integer;
begin
  str := node.Text;
  ending := Length(str);
  start := pos('[', str) + 1;
  return := Copy(str, start, ending - start);
  Result := return;
end;

function TfrmToteDisplay.getValueTreeSettingItems(node: TTreeNode): String;
var
  str: String;
  return: String;
  start, ending: Integer;
begin
  if Assigned(tvSettings.Selected) then
    str := tvSettings.Selected.Text
  else
  begin
    if Assigned(node) then
      str := node.Text;
  end;

  ending := Length(str);
  start := pos('[', str) + 1;
  return := Copy(str, start, ending - start);
  Result := return;
end;

procedure TfrmToteDisplay.HF1Click(Sender: TObject);
var
  rec : TRecCmd_DataLink;
begin
  if Trim(edtDatalink.Text) = '' then exit;

  if ContainsStr(edtDatalink.Text, '1') then
    rec.DataLinkID := 1
  else if ContainsStr(edtDatalink.Text, '2') then
    rec.DataLinkID := 2
  else if ContainsStr(edtDatalink.Text, '3') then
    rec.DataLinkID := 3;

  case TMenuItem(Sender).Tag of
    1 :
    begin
      rec.Band    := dlbHF;
      edtDLBand.Text := 'HF';
    end;
    2 :
    begin
      rec.Band    := dlbUVHF;
      edtDLBand.Text := 'UHF/VHF';
    end;
  end;

  rec.OrderDL := odlBand;
  simMgrClient.netSend_Cmd_DataLink(rec);
end;

procedure TfrmToteDisplay.Inactive1Click(Sender: TObject);
begin
  //sementra
  edtDLForce.Text := 'Inactive';
end;

procedure TfrmToteDisplay.InitialDatalinkRec(var rec: TRecCmd_DataLink;datalink : TT3Datalink);
  procedure InitialArrInt(var arr : array of Integer);
  var
    i : integer;
  begin
    for i := 0 to Length(arr) - 1 do
      arr[i] := 0;

  end;
begin

  with rec do
  begin
    DataLinkID  := datalink.IDLink;
    Force       := datalink.GroupForce;
    Band        := datalink.BandType;
    PUStatus    := 0;
    platformID  := 0;
    PooledPUID  := 0;
    OrderDL     := 0;

    InitialArrInt(PooledTracksID);
  end;
end;

function TfrmToteDisplay.getSettingIdentifierItem;
var
  str: String;
  return: String;
  ending: Integer;
begin
  str := tvSettings.Selected.Text;
  ending := pos('[', str);
  return := Copy(str, 0, ending - 1);
  Result := return;
end;

{ ________________________________________________ }

function TfrmToteDisplay.NewNode(tr: TTreeView; pNode: TTreeNode;
  Const sNodeText: String): TTreeNode;
begin
  if pNode = nil then
  begin
    Result := tr.Items.Add(nil, sNodeText)
  end
  else
  begin
    Result := tr.Items.AddChild(pNode, sNodeText);
  end;
end;

{ ________________________________________________ }
function TfrmToteDisplay.FindText(tr: TTreeView;
  Const SearchText: string): TTreeNode;
var
  i, StartIndex: Integer;
begin
  Result := nil;
  if tr.Items.Count = 0 then
    Exit;

  // ini sing nggarai error trus klo didebug
  {try
    StartIndex := tr.Selected.absoluteindex except StartIndex := 0
  end;}

  if Assigned(tr.Selected) then
    StartIndex := tr.Selected.absoluteindex
  else
    StartIndex := 0;

  for i := StartIndex to tr.Items.Count - 1 do
    if UpperCase(Trim(tr.Items[i].Text)) = UpperCase(Trim(SearchText)) then
    begin
      Result := tr.Items[i];
      Exit;
    end;
  for i := 0 to StartIndex do
    if UpperCase(Trim(tr.Items[i].Text)) = UpperCase(Trim(SearchText)) then
    begin
      Result := tr.Items[i];
      Exit;
    end;
end;
{ ________________________________________________ }

function TfrmToteDisplay.FindAdd(tr: TTreeView;
  Const SearchText, sNodeText: string): TTreeNode;
begin
  Result := NewNode(tr, FindText(tr, SearchText), sNodeText);
end;
{ ________________________________________________ }

procedure TfrmToteDisplay.SetupTvCubicleGroup;
var
  found       : Boolean;
  i, j, k     : Integer;
  lbl         : string;
  grp         : T3CubicleGroup;
  grm         : T3CubicleGroupMember;
  tn, tnItem  : TTreeNode;
  pi          : TPlatform_Instance;
  pa : TT3PlatformInstance;
  printTemp : Boolean;
begin
  tvCubicleGroups.Items.Clear;

  with simMgrClient do
  begin
    tn := tvCubicleGroups.Items.GetFirstNode;
    tn := tvCubicleGroups.Items.AddChild(tn, 'Cubicle Groups');

    printTemp := False;
    for i := 0 to CubAssignList.Count - 1 do
    begin
      grp := T3CubicleGroup(CubAssignList.Items[i]);

      if grp = nil then
        continue;

      if uppercase(grp.FData.Group_Identifier) = 'VBS' then
        Continue;

      if uppercase(grp.FData.Group_Identifier) = 'PELAKU' then
        Continue;

      if grp.FData.Group_Identifier = 'Controller' then
      begin
        if not printTemp then
          printTemp := True
        else
          Continue;
      end;

      // set Treeview Cublicles---------------------------------------
      if grp.CubicleName = '' then
        lbl := IntToStr(grp.FData.Group_Index) + ' - ' + grp.FData.Group_Identifier
      else
        lbl := IntToStr(grp.FData.Group_Index) + ' - ' + grp.FData.Group_Identifier + ' - ' + grp.CubicleName;

      tnItem := tvCubicleGroups.Items.AddChildObject(tn, lbl, grp);

      for j := 0 to grp.Count - 1 do
      begin
        grm := T3CubicleGroupMember(grp.Items[j]);
        if grm = nil then
          continue;

        k := 0;
        found := False;
        pi := nil;
        pa := nil;

        if Assigned(VScenario.PlatformInstanceListFromDB) then
        begin
          while not found and (k < SimPlatforms.itemCount) do
          begin
            pa := TT3PlatformInstance(SimPlatforms.getObject(k));

            if not pa.FreeMe then
              found := grm.FData.Platform_Instance_Index = pa.InstanceIndex;

            Inc(k);
          end;

          if found then
            tvCubicleGroups.Items.AddChildObject(tnItem, pa.InstanceName, pa);
        end;
      end;
    end;
  end;

  tvCubicleGroups.FullExpand;
end;

procedure TfrmToteDisplay.SetupWasdalUI;
begin
  CategoryPanelCommOp.Visible := False;
  CategoryPanelCommCub.Visible:= False;
  CategoryPanelManagementOp.Visible := False;
  pnlManagement.Visible := False;
  CategoryPanelStatusOp.Visible := False;

//  CategoryPanelStatusWas.Visible := True;
//  CategoryViewTacticalWas2.Visible := True;
//  CategoryPanelGroup1.Width := 120;
end;

procedure TfrmToteDisplay.OnWeaponEngaged(Sender, Target: TObject; Launcher : Integer);
var
  li: TListItem;
  emptyRow, i: Integer;
  wc, FiringModeStr: String;
  time : TDateTime;
  rec : TRec_Time_Row;

  Distance : Double;
  Timeflight : Double;
  mov : TT3MissilesOnVehicle;
  LaunchObj : TFitted_Weap_Launcher_On_Board;

  sObject : TSimObject;
  trackNum : string;
begin
  if not Assigned(Sender) then exit;

  time := simMgrClient.GameTIME;
  li := lvWeaponEngagement.Items.Add;
  { Time, Launching Platform, Weapon Class, Target Platform, Engagement }
  li.Caption := FormatDateTime('hh : mm : ss', time);
  li.SubItems.Add(TT3Weapon(sender).InstanceName);

  case TT3Weapon(sender).WeaponCategory of
    wcMissileAirToSurfaceSubsurface:
      wc := 'Missile Air To Surface Subsurface';
    wcMissileSurfaceSubsurfaceToAir:
      wc := 'Missile Surface Subsurface To Air';
    wcMissileSurfaceSubsurfaceToSurfaceSubsurface:
      wc := 'Missile Surface/Subsurface To Surface/Subsurface';
    wcMissileAirToAir:
      wc := 'Missile Air To Air';
    wcMissileLandAttack:
      wc := 'Missile Land Attack';
    wcTorpedoStraigth:
      wc := 'Torpedo Straigth';
    wcTorpedoActiveAcoustic:
      wc := 'Torpedo Active Acoustic';
    wcTorpedoPassiveAcoustic:
      wc := 'Torpedo Passive Acoustic';
    wcTorpedoWireGuided:
      wc := 'Torpedo Wire Guided';
    wcTorpedoWakeHoming:
      wc := 'Torpedo Wake Homing';
    wcTorpedoActivePassive:
      wc := 'Torpedo Active Passive';
    wcTorpedoAirDropped:
      wc := 'Torpedo Air Dropped';
    wcMine:
      wc := 'Mine';
    wcGunCIWS:
      wc := 'Gun CIWS';
    wcGunGun:
      wc := 'Gun';
    wcGunRocket:
      wc := 'Gun Rocket';
    wcBomb:
      wc := 'Bomb';
  end;

  li.SubItems.Add(wc);
  li.SubItems.Add(TT3PlatformInstance(Target).InstanceName);
  li.SubItems.Add('Engaged');
  li.Data := TT3PlatformInstance(sender);

  //if sender is TT3Missile then
  if sender is TT3MissilesOnVehicle then
  begin
    rec := TRec_Time_Row.Create;
    sgSurToSurEditedRow := 0;
    sgSurToAirEditedRow := 0;

    // add data Surface to air
    if TT3Vehicle(Target).PlatformDomain = 0 then
    begin
      rec.isAir := true;
//      gbSurfaceToAir.BringToFront;
      emptyRow := 0;

      for i := 0 to sgSurfacetoAir.RowCount - 1 do
      begin
        if sgSurfacetoAir.Cells[0, i] = '' then
        begin
          emptyRow := i;
          break;
        end;
      end;

      if TT3Missile(sender).PredictionEngageTime = 0 then
         TT3Missile(sender).PredictionEngageTime := TT3Missile(sender).LaunchDelay / (3600*24);

      timeEngage := TimeOf(simMgrClient.GameTIME) + TimeOf(TT3Missile(sender).PredictionEngageTime);
      rec.time := timeEngage;

      sObject := simMgrClient.findDetectedTrack(TT3Missile(Sender).TargetObject);
      if Assigned(sObject) then
        trackNum := FormatTrackNumber(TT3DetectedTrack(sObject).TrackNumber)
      else
        trackNum := TT3PlatformInstance(TT3Missile(Sender).TargetObject).TrackLabel;

      with sgSurfacetoAir do
      begin
        Cells[0, emptyRow] := TT3Missile(sender).InstanceName;
        sgSurfacetoAir.Cells[1, emptyRow] := 'SAM Mount(designation)';
        sgSurfacetoAir.Cells[2, emptyRow] := '' + trackNum;
        sgSurfacetoAir.Cells[3, emptyRow] := FloatToStr
          (TT3PlatformInstance(Target).Course);
        sgSurfacetoAir.Cells[4, emptyRow] := FloatToStr
          (TT3PlatformInstance(Target).Speed);
        sgSurfacetoAir.Cells[5, emptyRow] := IntToStr
          (Round(TT3PlatformInstance(Target).Altitude / C_Feet_To_Meter));
        sgSurfacetoAir.Cells[6, emptyRow] := SecondToTimeString(TT3MissilesOnVehicle(sender).
                                              LaunchDelay);
//        sgSurfacetoAir.Cells[6, emptyRow] := FormatDateTime('hh : mm : ss',
//          timeof(TT3MissilesOnVehicle(sender).LaunchDelay / (3600*24)));

        Distance := CalcRange(TT3MissilesOnVehicle(sender).getPositionX, TT3MissilesOnVehicle(sender).getPositionY
                              ,TT3PlatformInstance(Target).getPositionX, TT3PlatformInstance(Target).getPositionY);
        Timeflight := (Distance / TT3MissilesOnVehicle(sender).UnitMotion.FData.Max_Ground_Speed)*3600;

        Cells[7, emptyRow] := FormatDateTime('hh : mm : ss',
          timeof((Timeflight) / (3600*24)));

        sgSurToAirEditedRow := emptyRow;
        rec.row := sgSurToAirEditedRow;
      end;
    end
    // add data Surface to Surface
    else
    begin
      emptyRow := 0;
      rec.isAir := false;
//      gbSurfaceToSurface.BringToFront;     sementara dihide

      for i := 0 to sgSurfacetoSurface.RowCount - 1 do
      begin
        if sgSurfacetoSurface.Cells[0, i] = '' then
        begin
          emptyRow := i;
          break;
        end;
      end;

      {hanya untuk hard code}
      if TT3Missile(sender).PredictionEngageTime = 0 then
         TT3Missile(sender).PredictionEngageTime := TT3Missile(sender).LaunchDelay / (3600*24);

//      timeEngage := TimeOf(simMgrClient.GameTIME) + TimeOf(FloatToDateTime(TT3Missile(sender).PredictionEngageTime));
      timeEngage := TimeOf(simMgrClient.GameTIME) + TimeOf(TT3Missile(sender).PredictionEngageTime);
      rec.time := timeEngage;

      LaunchObj := nil;
      mov := TT3MissilesOnVehicle(sender);
      for i := 0 to mov.MissileDefinition.FLaunchs.Count - 1 do
      begin
        LaunchObj := TFitted_Weap_Launcher_On_Board(mov.MissileDefinition.FLaunchs.Items[i]);
        if LaunchObj.FData.Launcher_Type > 8 then
        begin
          if (LaunchObj.FData.Launcher_Type-8) = (Launcher) then
            Break;
        end
        else
        begin
          if LaunchObj.FData.Launcher_Type = (Launcher) then
            Break;
        end;
      end;

      case mov.FiringMode of
        mfmRBL  : FiringModeStr := 'RBL';
        mfmBOL  : FiringModeStr := 'BOL';
      end;

      Distance := CalcRange(mov.getPositionX, mov.getPositionY,
                  TT3PlatformInstance(Target).getPositionX, TT3PlatformInstance(Target).getPositionY);
      Timeflight := (Distance / mov.UnitMotion.FData.Max_Ground_Speed)*3600;

      with sgSurfacetoSurface do
      begin
        Cells[0, emptyRow] := mov.InstanceName;
        Cells[1, emptyRow] := IntToStr(Launcher);
        Cells[2, emptyRow] := 'Planned';
        Cells[3, emptyRow] := (TT3PlatformInstance(Target).InstanceName);
        Cells[4, emptyRow] := FiringModeStr;

        if Assigned(LaunchObj) then
          Cells[5, emptyRow] := IntToStr(LaunchObj.FData.Launcher_Angle)
        else
          Cells[5, emptyRow] := '0';

        Cells[6, emptyRow] := FormatDateTime('hh : mm : ss', timeof(mov.LaunchDelay / (3600*24)));
        Cells[7, emptyRow] := FormatDateTime('hh : mm : ss', timeof((Timeflight) / (3600*24)));
      end;

      sgSurToSurEditedRow := emptyRow;
      rec.row := sgSurToSurEditedRow;
    end;
  end;
end;

procedure TfrmToteDisplay.sgSurfacetoSurfaceSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  i : Integer;
  ListDTOT : TMissileHaveLaunch;
begin
  btnLaunch.Enabled := False;
  btnAbortSurfaceToSurface.Enabled := False;
  //i := -1;

  if (sgSurfacetoSurface.Cells[4, ARow] = 'DTOT') and
     (sgSurfacetoSurface.Cells[6, ARow] = '00 : 00 : 00') then
  begin
    if Assigned(simMgrClient.ControlledPlatform)
      and (TT3Vehicle(simMgrClient.ControlledPlatform).MissileWaittoLaunch.Count > 0) then
    begin
      for i := 0 to TT3Vehicle(simMgrClient.ControlledPlatform)
          .MissileWaittoLaunch.Count - 1 do
      begin
        ListDTOT := TMissileHaveLaunch(TT3Vehicle(simMgrClient.ControlledPlatform)
                    .MissileWaittoLaunch[i]);
        if (ListDTOT.EngageMode = 'DTOT') and not ListDTOT.isHaveLaunch
          and (ListDTOT.LauncherNumber = StrToInt(sgSurfacetoSurface.Cells[1, ARow])) then
        begin
          indexDtot := i;
          SgSSMissileSelectedCell := ARow;
        end;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.OnweaponEngageWaypoint(pi : TT3PlatformInstance; Sender, Target: TObject;
  Distance: Double; FiringAngle, FiringLauncher : integer; TimeforMissileEngage, TimeforMissileFlight : Double);
var
  i, emptyrow : Integer;
  wc, FiringModeStr : string;
  mov : TT3MissilesOnVehicle;
  LaunchObj : TFitted_Weap_Launcher_On_Board;
  TimeFlight : Double;
  //ListMissile : TMissileHaveLaunch;
  //count : Integer;

  TimeTemp : TTime;
begin
  if Sender is TT3MissilesOnVehicle then
  begin
    mov := TT3MissilesOnVehicle(Sender);
    emptyRow := 0;

//    gbSurfaceToSurface.BringToFront;     sementara dihide
    for i := 0 to sgSurfacetoSurface.RowCount - 1 do
    begin
      if sgSurfacetoSurface.Cells[0, i] = '' then
      begin
        emptyRow := i;
        break;
      end;
    end;

    LaunchObj := nil;
    if Assigned(mov.MissileDefinition.FLaunchs) then
    begin
      for i := 0 to mov.MissileDefinition.FLaunchs.Count - 1 do
      begin
        LaunchObj := TFitted_Weap_Launcher_On_Board(mov.MissileDefinition.FLaunchs.Items[i]);
        if LaunchObj.FData.Launcher_Type > 8 then
        begin
          if (LaunchObj.FData.Launcher_Type-8) = (FiringLauncher) then
            Break;
        end
        else
        begin
          if LaunchObj.FData.Launcher_Type = (FiringLauncher) then
            Break;
        end;
      end;
    end;

    TimeFlight := (Distance / mov.UnitMotion.FData.Max_Ground_Speed) * 3600;

    case mov.Engagement of
      meRipple  : FiringModeStr := 'Ripple';
      meSTOT    : FiringModeStr := 'STOT';
      meDTOT    : FiringModeStr := 'DTOT';
    end;

    with sgSurfacetoSurface do
    begin
      Cells[0, emptyRow] := mov.InstanceName;
      Cells[1, emptyRow] := IntToStr(FiringLauncher);
      Cells[2, emptyRow] := 'Planned';
      Cells[3, emptyRow] := (TT3PlatformInstance(Target).InstanceName);
      Cells[4, emptyRow] := FiringModeStr;

      if Assigned(LaunchObj) then
        Cells[5, emptyRow] := IntToStr(LaunchObj.FData.Launcher_Angle)
      else
        Cells[5, emptyRow] := '0';

      Cells[6, emptyRow] := FormatDateTime('hh : mm : ss', timeof(mov.LaunchDelay / (3600*24)));
      Cells[7, emptyRow] := FormatDateTime('hh : mm : ss', timeof((Timeflight) / (3600*24)));
    end;

    if mov.Engagement = meDTOT then
    begin
      MissileLaunchList                       := TMissileHaveLaunch.Create;
      MissileLaunchList.isAir                 := False;
      MissileLaunchList.isLaunch              := True;
      MissileLaunchList.EngageMode            := 'DTOT';
      MissileLaunchList.LauncherNumber        := Firinglauncher;
      MissileLaunchList.isHaveLaunch          := False;
      MissileLaunchList.TimeEng               := timeof((TT3MissilesOnVehicle(sender).LaunchDelay) / (3600*24));
      MissileLaunchList.TImeFlight            := timeof((Timeflight)/ (3600*24));
      MissileLaunchList.StartTime             := TimeOf(simMgrClient.GameTIME) + timeof(TT3Missile(sender).LaunchDelay/ (3600*24));
      MissileLaunchList.launcherMissileAngle  := TT3PlatformInstance(sender).Course;
      MissileLaunchList.MissileCategory       := TT3MissilesOnVehicle(sender).WeaponCategory;
      MissileLaunchList.MissileName           := TT3MissilesOnVehicle(sender).InstanceName;
      MissileLaunchList.MissileIndex          := TT3MissilesOnVehicle(sender).InstanceIndex;
      MissileLaunchList.ParentShipName        := TT3PlatformInstance(pi).InstanceName;
      MissileLaunchList.parentShipIndex       := TT3PlatformInstance(pi).InstanceIndex;
      MissileLaunchList.TargetShipName        := TT3PlatformInstance(Target).InstanceName;
      MissileLaunchList.TargetShipIndex       := TT3PlatformInstance(Target).InstanceIndex;

      TT3Vehicle(pi).MissileWaittoLaunch.Add(MissileLaunchList);
    end;
  end;
end;

procedure TfrmToteDisplay.OnWeaponLaunched(sender, Target: TObject);
var
  li: TListItem;
  emptyRow, i, j: Integer;
  wc: String;
  time : TDateTime;
  recEngage : TRec_Time_Row;
  rec : TRec_Time_Row;
  zidd: Double;

  FlightTime : Double;
  Distance : Double;

  pi : TT3PlatformInstance;

  NextWaypointTemp : ^TRecWeaponWaypoint;
  NextWaypointTemp2 : ^TRecWeaponWaypoint;

  PositionX_Waypoint, PositionY_Waypoint : Double;
  PositionX2_Waypoint, PositionY2_Waypoint : Double;
  PositionLastX_Waypoint, PositionLastY_Waypoint : Double;

  MissileWaitList : TMissileHaveLaunch;

  sObject : TSimObject;
  trackNum : string;
begin
  if not Assigned(Sender) then exit;

  time := simMgrClient.GameTIME;

  li := lvWeaponEngagement.Items.Add;
  { Time, Launching Platform, Weapon Class, Target Platform, Engagement }
  li.Caption := FormatDateTime('hh : mm : ss', time);
  li.SubItems.Add(TT3Weapon(sender).InstanceName);

  case TT3Weapon(sender).WeaponCategory of
    wcMissileAirToSurfaceSubsurface:
      wc := 'Missile Air To Surface Subsurface';
    wcMissileSurfaceSubsurfaceToAir:
      wc := 'Missile Surface Subsurface To Air';
    wcMissileSurfaceSubsurfaceToSurfaceSubsurface:
      wc := 'Missile Surface/Subsurface To Surface/Subsurface';
    wcMissileAirToAir:
      wc := 'Missile Air To Air';
    wcMissileLandAttack:
      wc := 'Missile Land Attack';
    wcTorpedoStraigth:
      wc := 'Torpedo Staigth';
    wcTorpedoActiveAcoustic:
      wc := 'Torpedo Active Acoustic';
    wcTorpedoPassiveAcoustic:
      wc := 'Torpedo Passive Acoustic';
    wcTorpedoWireGuided:
      wc := 'Torpedo Wire Guided';
    wcTorpedoWakeHoming:
      wc := 'Torpedo Wake Homing';
    wcTorpedoActivePassive:
      wc := 'Torpedo Active Passive';
    wcTorpedoAirDropped:
      wc := 'Torpedo Air Dropped';
    wcMine:
      wc := 'Mine';
    wcGunCIWS:
      wc := 'Gun CIWS';
    wcGunGun:
      wc := 'Gun';
    wcGunRocket:
      wc := 'Gun Rocket';
    wcBomb:
      wc := 'Bomb';
  end;

  li.SubItems.Add(wc);

  if TT3PlatformInstance(Target) <> nil  then
    li.SubItems.Add(TT3PlatformInstance(Target).InstanceName);

  li.SubItems.Add('Launched');
  li.Data := TT3PlatformInstance(sender);

  if (sender is TT3Missile) then
  begin
    // add data Surface to air
    zidd := 5 / (3600*24); //TAMBAHAN SEBELUM ADA DELAY LAUNCHING

    recEngage := TRec_Time_Row.Create;
    rec := TRec_Time_Row.Create;
    sgSurToSurEditedRow := 0;
    sgSurToAirEditedRow := 0;

    {hanya untuk hard code}
    if TT3Missile(sender).PredictionEngageTime = 0 then
       TT3Missile(sender).PredictionEngageTime := TT3Missile(sender).LaunchDelay / (3600*24);

    if TT3Vehicle(target).PlatformDomain  = 0 then
    begin
      rec.isAir := true;
      recEngage.isAir := true;

//      for i := 0 to sgSurfacetoAir.RowCount - 1 do
//      begin
//        if sgSurfacetoAir.Cells[0, i] = '' then
//        begin
//          emptyRow := i;
//          break;
//        end;
//      end;

      timeEngage := TimeOf(simMgrClient.GameTIME) + TimeOf(TT3Missile(sender).PredictionEngageTime);
      recEngage.time := timeEngage;

      timeFlight := TimeOf(simMgrClient.GameTIME) + TimeOf(FloatToDateTime(TT3Missile(sender).PredictionFlightTime + zidd));
      rec.time := timeFlight;

      Distance := CalcRange(TT3Missile(sender).getPositionX, TT3Missile(sender).getPositionY
                                            ,TT3PlatformInstance(Target).getPositionX, TT3PlatformInstance(Target).getPositionY);
      flightTime := (Distance / TT3Missile(sender).UnitMotion.FData.Max_Ground_Speed)*3600;
      timeFlight := TimeOf(simMgrClient.GameTIME) + TimeOf(((flightTime + 5)/(3600*24)));
      rec.time := timeFlight;

      with sgSurfacetoAir do
      begin
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
        begin
          pi := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;

          if pi is TT3Vehicle then
          begin
            if TT3Vehicle(pi).InstanceIndex = TT3Missile(sender).ShipIndex then
            begin
              MissileLaunchList                       := TMissileHaveLaunch.Create;
              MissileLaunchList.MissileLaunch         := TT3Missile(sender);
              MissileLaunchList.isAir                 := True;
              MissileLaunchList.TimeEng               := timeEngage;
              MissileLaunchList.TImeFlight            := timeFlight;
              MissileLaunchList.FTImeFlight           := flightTime;
              MissileLaunchList.StartTime             := TimeOf(simMgrClient.GameTIME) + timeof(5/ (3600*24));;
              MissileLaunchList.isLaunch              := True;
              MissileLaunchList.launcherMissileAngle  := TT3PlatformInstance(sender).Course;
              MissileLaunchList.MissileCategory       := TT3Missile(sender).WeaponCategory;
              MissileLaunchList.MissileName           := TT3Missile(sender).InstanceName;
              MissileLaunchList.MissileIndex          := TT3Missile(sender).InstanceIndex;
              MissileLaunchList.ParentShipName        := TT3Missile(sender).ShipName;
              MissileLaunchList.parentShipIndex       := TT3Missile(sender).ShipIndex;

              sObject := simMgrClient.findDetectedTrack(TT3Missile(sender).TargetObject);
              if Assigned(sObject) then
                trackNum := FormatTrackNumber(TT3DetectedTrack(sObject).TrackNumber)
              else
                trackNum := TT3PlatformInstance(TT3Missile(sender).TargetObject).TrackLabel;

              MissileLaunchList.TargetShipName        := trackNum;
              MissileLaunchList.TargetShipIndex       := TT3Missile(sender).TargetIndex;
              MissileLaunchList.TargetCourse          := TT3Missile(sender).TargetTrackCourse;
              MissileLaunchList.TargetSpeed           := TT3Missile(sender).TargetTrackSpeed;
              MissileLaunchList.TargetAltitude        := TT3Missile(sender).TargetTrackAlt;

              TT3Vehicle(pi).MissileLaunch.Add(MissileLaunchList);
            end;
          end;
        end;
      end;
    end
    // add data Surface to Surface
    else
    begin
      case TT3Missile(sender).FiringMode of
        mfmRBL, mfmBOL :
        begin
          emptyRow := 0;
          rec.isAir := false;
          recEngage.isAir := false;

          for i := 0 to sgSurfacetoSurface.RowCount - 1 do
          begin
            if sgSurfacetoSurface.Cells[0, i] = '' then
            begin
              emptyRow := i;
              break;
            end;
          end;

          timeEngage := TimeOf(simMgrClient.GameTIME) + TimeOf(TT3Missile(sender).PredictionEngageTime);
          recEngage.time := timeEngage;

          Distance := CalcRange(TT3Missile(sender).getPositionX, TT3Missile(sender).getPositionY
                                  ,TT3PlatformInstance(Target).getPositionX, TT3PlatformInstance(Target).getPositionY);
          flightTime := (Distance / TT3Missile(sender).UnitMotion.FData.Max_Ground_Speed)*3600;
          timeFlight := TimeOf(simMgrClient.GameTIME) + TimeOf(((flightTime + 5)/(3600*24)));
          rec.time := timeFlight;

          with sgSurfacetoSurface do
          begin
            sgSurToSurEditedRow := emptyRow;

            rec.row := sgSurToSurEditedRow;
            recEngage.row := sgSurToSurEditedRow;

            listTimeLaunch.Add(rec);
            listTimeEngage.Add(recEngage);

            for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
            begin
              pi := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;

              if pi is TT3Vehicle then
              begin
                if TT3Vehicle(pi).InstanceIndex = TT3Missile(sender).ShipIndex then
                begin
                  MissileLaunchList                       := TMissileHaveLaunch.Create;
                  MissileLaunchList.MissileLaunch         := TT3Missile(sender);
                  MissileLaunchList.isAir                 := False;
                  MissileLaunchList.TimeEng               := timeEngage;
                  MissileLaunchList.TImeFlight            := timeFlight;
                  MissileLaunchList.FTImeFlight           := flightTime;
                  MissileLaunchList.StartTime             := TimeOf(simMgrClient.GameTIME) + timeof(5/ (3600*24));;
                  MissileLaunchList.isLaunch              := True;
                  MissileLaunchList.launcherMissileAngle  := TT3PlatformInstance(sender).Course;
                  MissileLaunchList.MissileCategory       := TT3Missile(sender).WeaponCategory;
                  MissileLaunchList.MissileName           := TT3Missile(sender).InstanceName;
                  MissileLaunchList.MissileIndex          := TT3Missile(sender).InstanceIndex;
                  MissileLaunchList.ParentShipName        := TT3Missile(sender).ShipName;
                  MissileLaunchList.parentShipIndex       := TT3Missile(sender).ShipIndex;
                  MissileLaunchList.TargetShipName        := TT3Missile(sender).TargetName;
                  MissileLaunchList.TargetShipIndex       := TT3Missile(sender).TargetIndex;
                  MissileLaunchList.TargetCourse          := TT3Missile(sender).TargetTrackCourse;
                  MissileLaunchList.TargetSpeed           := TT3Missile(sender).TargetTrackSpeed;
                  MissileLaunchList.TargetAltitude        := TT3Missile(sender).TargetTrackAlt;
                  MissileLaunchList.LauncherNumber        := TT3Missile(sender).LauncherNumber;

                  TT3Vehicle(pi).MissileLaunch.Add(MissileLaunchList);
                end;
              end;
            end;
          end;
        end;

        mfmRBLW :
        begin
          rec.isAir := false;
          recEngage.isAir := false;

//          for i := 0 to sgSurfacetoSurface.RowCount - 1 do
//          begin
//            if sgSurfacetoSurface.Cells[0, i] = '' then
//            begin
//              emptyRow := i;
//              break;
//            end;
//          end;

          timeEngage := TimeOf(simMgrClient.GameTIME) +  TimeOf((TT3Missile(sender).LaunchDelay/(3600*24)));
          Distance := TT3Missile(sender).DistanceToTarget;
          flightTime := (Distance / TT3Missile(sender).UnitMotion.FData.Max_Ground_Speed)*3600;
          timeFlight := TimeOf(simMgrClient.GameTIME) + TimeOf(((flightTime + TT3Missile(sender).LaunchDelay)/(3600*24)));

          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
          begin
            pi := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;

            if pi is TT3Vehicle then
            begin
              if TT3Vehicle(pi).InstanceIndex = TT3Missile(sender).ShipIndex then
              begin
                MissileLaunchList                       := TMissileHaveLaunch.Create;
                MissileLaunchList.MissileLaunch         := TT3Missile(sender);
                MissileLaunchList.isAir                 := False;
                MissileLaunchList.TimeEng               := timeEngage;
                MissileLaunchList.TImeFlight            := timeFlight;
                MissileLaunchList.FTImeFlight           := flightTime;
                MissileLaunchList.StartTime             := TimeOf(simMgrClient.GameTIME) + timeof(TT3Missile(sender).LaunchDelay/ (3600*24));
                MissileLaunchList.isLaunch              := True;
                MissileLaunchList.launcherMissileAngle  := TT3PlatformInstance(sender).Course;
                MissileLaunchList.MissileCategory       := TT3Missile(sender).WeaponCategory;
                MissileLaunchList.MissileName           := TT3Missile(sender).InstanceName;
                MissileLaunchList.MissileIndex          := TT3Missile(sender).InstanceIndex;
                MissileLaunchList.ParentShipName        := TT3Missile(sender).ShipName;
                MissileLaunchList.parentShipIndex       := TT3Missile(sender).ShipIndex;
                MissileLaunchList.TargetShipName        := TT3Missile(sender).TargetName;
                MissileLaunchList.TargetShipIndex       := TT3Missile(sender).TargetIndex;
                MissileLaunchList.LauncherNumber        := TT3Missile(sender).LauncherNumber;

                if TT3Missile(Sender).Engagement = meDTOT then
                begin
                  TT3Vehicle(pi).MissileDTOTLaunch.Add(MissileLaunchList);

                  for j := TT3Vehicle(pi).MissileWaitToLaunch.Count - 1 downto 0 do
                  begin
                    MissileWaitList := TT3Vehicle(pi).MissileWaitToLaunch.Items[j];

                    if MissileWaitList.LauncherNumber = MissileLaunchList.LauncherNumber then
                      TT3Vehicle(pi).MissileWaitToLaunch.Delete(j);
                  end;
                end
                else
                  TT3Vehicle(pi).MissileLaunch.Add(MissileLaunchList);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;
//procedure TfrmToteDisplay.Panel83Click(Sender: TObject);
//begin
//
//end;

//
//procedure TfrmToteDisplay.pnldpnClick(Sender: TObject);
//begin
//  RampaHostShipID := TPanel(Sender).Tag;
//
//  pnldpn.Color := clMedGray;
//  pnlblk.Color := clMedGray;
//  pnlkiri.Color := clMedGray;
//  pnlkanan.Color := clMedGray;
//
//  case TPanel(Sender).Tag of
//    0: pnldpn.Color := clLime;
//    1: pnlblk.Color := clLime;
//    2: pnlkiri.Color := clLime;
//    3: pnlkanan.Color := clLime;
//  end;
//end;

procedure TfrmToteDisplay.OnPlatformDestroy(sender: TObject);
var
  li: TListItem;
  //edited by choco
  reason: string;
begin
  // set platform removal //edited by choco

  if sender = nil then     //mk
    Exit;

  if Sender is TT3PlatformInstance then
  begin
    with lvPlatformRemovalSum do
    begin
      case TT3PlatformInstance(sender).reasonDestroy of
        1:
        begin
          reason := 'Deleted By User';
        end;
        2:
        begin
          reason := 'Destroyed';
        end;
        3:
        begin
          reason := 'Out Of Fuel';
        end;
        4:
        begin
          frmTacticalDisplay.addStatus(TT3PlatformInstance(sender).InstanceName + ' crashed!');
          reason := 'Crash';
        end;
        5:
        begin
          reason := 'Altitude of ' +TT3PlatformInstance(sender).InstanceName + ' = 0';
        end;
        6:
        begin
          reason := 'RCS of ' +TT3PlatformInstance(sender).InstanceName + ' is < 0';
        end
      else
        begin
          reason := 'Undefined Reason';
        end;
      end;
    end;
  end;

  li := lvPlatformRemovalSum.Items.Add;

  li.Caption := FormatDateTime('hh:nn:ss', simMgrClient.GameTIME) + ' / ' + FormatDateTime('dd mmm yyyy', simMgrClient.GameTIME);
  li.SubItems.Add(TT3PlatformInstance(sender).InstanceName);
  li.SubItems.Add(reason);
end;

procedure TfrmToteDisplay.OnPlatformGroupChange(Sender: TObject);
var
  OldFound,
  NewFound         : Boolean;
  i     : Integer;

  OldGroupStr,
  NewGroupStr   : string;

  CurrentGroup,
  OldGroup,
  NewGroup      : T3CubicleGroup;

  SelectedMember : TPlatform_Instance;
  SelectedMembera : TT3PlatformInstance;

  rec : TRecPlatformGroupChange;
begin
  OldFound := False;
  NewFound := False;
  OldGroup := nil;
  NewGroup := nil;

  OldGroupStr := T3CubicleGroup(tvCubicleGroups.Selected.Parent.Data).FData.Group_Identifier;
  NewGroupStr := TMenuItem(Sender).Caption;
  NewGroupStr := DeleteAmpersand(NewGroupStr);

//  SelectedMember := TPlatform_Instance(tvCubicleGroups.Selected.Data);
  SelectedMembera := TT3PlatformInstance(tvCubicleGroups.Selected.Data);

  if OldGroupStr = NewGroupStr then
    Exit;

  with simMgrClient do
  begin
    for i := 0 to CubAssignList.Count - 1 do
    begin
      CurrentGroup := T3CubicleGroup(CubAssignList.Items[i]);

      if CurrentGroup.FData.Group_Identifier = OldGroupStr then
      begin
        OldGroup := T3CubicleGroup(CubAssignList.Items[i]);
        OldFound := True;
      end;

      if CurrentGroup.FData.Group_Identifier = NewGroupStr then
      begin
        NewGroup := T3CubicleGroup(CubAssignList.Items[i]);
        NewFound := True;
      end;

      if OldFound and NewFound then
        Break;
    end;
  end;

  if Assigned(OldGroup) and  Assigned(NewGroup) then
  begin
    //sync
    rec.PlatformID := SelectedMembera.InstanceIndex;
    rec.OldGroupID := OldGroup.FData.Group_Index;
    rec.NewGroupID := NewGroup.FData.Group_Index;

    simMgrClient.netSend_PlatformGroupChange(rec);
  end;
end;

procedure TfrmToteDisplay.OnPlatformDestroy(sender: TObject; target:string);
var
  li: TListItem;
  //edited by choco
  reason: string;
//  berita : TEventSummary;
begin
  if sender = nil then     //mk
    Exit;

  // set platform removal //edited by choco
  with lvPlatformRemovalSum do
  begin
    case TT3PlatformInstance(sender).reasonDestroy of
      21:
        begin
          reason := 'Destroyed by';
        end;
      22:
        begin
          reason := 'Destroyed because hit';
        end;
      23:
        begin
          reason := 'Destroyed because';
        end;
    else
        begin
          reason := 'Undefined Reason';
        end;
    end;

    li := lvPlatformRemovalSum.Items.Add;

    li.Caption := FormatDateTime('hh:nn:ss', simMgrClient.GameTIME) + ' / ' + FormatDateTime('dd mmm yyyy', simMgrClient.GameTIME);
    li.SubItems.Add(TT3PlatformInstance(sender).InstanceName);
    li.SubItems.Add(reason+' '+target);

//    berita := TEventSummary.create;
//    berita.Time := simMgrClient.GameTIME;
//    berita.VehicleIdentifier := target;
//    berita.Force := 2;
//    berita.Action := 'Destroyed by ' + TT3PlatformInstance(Sender).InstanceName;
//
//    simMgrClient.SimEventSummary.Add(berita);
//    WriteEventSummary;
  end;
end;

procedure TfrmToteDisplay.UpdateTimeMissile;
var
  timeString, LaunchModeStr: string;
  time : TTime;
  temp : TTime;
  rec : TRec_Time_Row;
  i,j,k : Integer;
  UpdateMissileLaunchList, MissileDTOT : TMissileHaveLaunch;
  pi : TT3PlatformInstance;
  Vec : TT3Vehicle;
  TimeForEng : TTime;
  TimeForFlight : TTime;
  EmptyRowForTimeEngage : Integer;
  EmptyRowForTimeFlight : Integer;
  wc : string;
  obj : TObject;
begin
  if not Assigned(simMgrClient.ControlledPlatform) then  {aldy tambah}
    Exit;

  if Assigned(simMgrClient.SimPlatforms) then
  begin
    for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
    begin
      pi := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;

      if pi is TT3Vehicle then
      begin
        Vec := TT3Vehicle(pi);

        if Vec.InstanceIndex = TT3PlatformInstance(simMgrClient.ControlledPlatform).InstanceIndex then
        begin
          if Assigned(Vec.MissileLaunch) then
          begin
            for j := 0 to Vec.MissileLaunch.Count - 1 do
            begin
              obj := Vec.MissileLaunch[j];
              if not(obj is TMissileHaveLaunch) then
                Continue;

              UpdateMissileLaunchList := TMissileHaveLaunch(obj);

              if not UpdateMissileLaunchList.isAir and UpdateMissileLaunchList.isLaunch then
              begin
                with sgSurfacetoSurface do
                begin
                  Cells[0, j+1] := UpdateMissileLaunchList.MissileName;
                  Cells[1, j+1] := IntToStr(UpdateMissileLaunchList.LauncherNumber);
                  Cells[3, j+1] := UpdateMissileLaunchList.TargetShipName;

                  case UpdateMissileLaunchList.MissileLaunch.FiringMode of
                    mfmRBL  : LaunchModeStr := 'RBL';
                    mfmRBLW : begin
                                case UpdateMissileLaunchList.MissileLaunch.Engagement of
                                  meRipple : LaunchModeStr := 'Ripple';
                                  meSTOT   : LaunchModeStr := 'STOT';
                                  meDTOT   : LaunchModeStr := 'DTOT';
                                end;
                              end;
                    mfmBOL  : LaunchModeStr := 'BOL';
                    mfmBOLW  : LaunchModeStr := 'BOLW';
                  end;

                  Cells[4, j+1] := LaunchModeStr;
                  Cells[5, j+1] := FloatToStr(UpdateMissileLaunchList.launcherMissileAngle);

                  TimeForEng := UpdateMissileLaunchList.TimeEng - TimeOf(simMgrClient.GameTIME);

                  if TimeForEng >= 0 then
                  begin
                    Cells[2, j+1] := 'Pending';
                    timeString := FormatDateTime('hh : mm : ss', TimeForEng);
                    sgSurfacetoSurface.Cells[6, j+1] := timeString;

                    TimeForFlight := UpdateMissileLaunchList.TImeFlight - UpdateMissileLaunchList.StartTime;
                    timeString := FormatDateTime('hh : mm : ss', TimeForFlight);
                    sgSurfacetoSurface.Cells[7, j+1] := timeString;
                  end
                  else
                  begin
                    Cells[2, j+1] := 'Launched';
                    sgSurfacetoSurface.Cells[6, j+1] := '00 : 00 : 00';
                    TimeForFlight := UpdateMissileLaunchList.TImeFlight - TimeOf(simMgrClient.GameTIME);

                    if TimeForFlight >= 0 then
                    begin
                      timeString := FormatDateTime('hh : mm : ss', TimeForFlight);
                      sgSurfacetoSurface.Cells[7, j+1] := timeString;
                    end
                    else
                      sgSurfacetoSurface.Cells[7, j+1] := '00 : 00 : 00';
                  end;
                end;
              end
              else if UpdateMissileLaunchList.isAir and UpdateMissileLaunchList.isLaunch then
              begin
                with sgSurfacetoAir do
                begin
                  Cells[0, j+1] := UpdateMissileLaunchList.MissileName;
                  Cells[1, j+1] := 'SAM Mount(designation)';
                  Cells[2, j+1] := MissileLaunchList.TargetShipName;
                  Cells[3, j+1] := FloatToStr(UpdateMissileLaunchList.TargetCourse);
                  Cells[4, j+1] := FloatToStr(UpdateMissileLaunchList.TargetSpeed);
                  Cells[5, j+1] := IntToStr(Round(UpdateMissileLaunchList.TargetAltitude / C_Feet_To_Meter));

                  {Engage}
                  TimeForEng := UpdateMissileLaunchList.TimeEng - TimeOf(simMgrClient.GameTIME);

                  if TimeForEng >= 0 then
                  begin
                    timeString := FormatDateTime('hh : mm : ss', TimeForEng);
                    Cells[6, j+1] := timeString;

                    TimeForFlight := UpdateMissileLaunchList.TImeFlight - UpdateMissileLaunchList.StartTime;
                    timeString := FormatDateTime('hh : mm : ss', TimeForFlight);
                    Cells[7, j+1] := timeString;
                  end
                  else
                  begin
                    Cells[6, j+1] := '00 : 00 : 00';

                    {Flight}
                    TimeForFlight := UpdateMissileLaunchList.TImeFlight - TimeOf(simMgrClient.GameTIME);

                    if TimeForFlight >= 0 then
                    begin
                      timeString := FormatDateTime('hh : mm : ss', TimeForFlight);
                      Cells[7, j+1] := timeString;
                    end
                    else
                      Cells[7, j+1] := '00 : 00 : 00';
                  end;
                end;
              end;
            end;
          end;

          if vec.isReadyToCalculate then
          begin
            if Assigned(Vec.MissileWaittoLaunch) then
            begin
              for j := 0 to Vec.MissileWaittoLaunch.Count - 1 do
              begin
                obj := Vec.MissileWaittoLaunch[j];
                if not (obj is TMissileHaveLaunch) then
                  Continue;

                UpdateMissileLaunchList := TMissileHaveLaunch(obj);

                if Assigned(Vec.MissileLaunch) then
                begin
                  with sgSurfacetoSurface do
                  begin
                    Cells[0, Vec.MissileLaunch.Count+1 + j] := UpdateMissileLaunchList.MissileName;
                    Cells[1, Vec.MissileLaunch.Count+1 + j] := IntToStr(UpdateMissileLaunchList.LauncherNumber);
                    Cells[3, Vec.MissileLaunch.Count+1 + j] := UpdateMissileLaunchList.TargetShipName;
                    Cells[4, Vec.MissileLaunch.Count+1 + j] := 'DTOT';
                    Cells[5, Vec.MissileLaunch.Count+1 + j] := FloatToStr(UpdateMissileLaunchList.launcherMissileAngle);

                    {Engage}
                    TimeForEng := StartDTOT + UpdateMissileLaunchList.TimeEng - TimeOf(simMgrClient.GameTIME);
                    //MissileLaunchList.TimeEng := TimeForEng;

                    if TimeForEng >= 0 then
                    begin
                      Cells[2, Vec.MissileLaunch.Count+1 + j] := 'Pending';
                      timeString := FormatDateTime('hh : mm : ss', TimeForEng);
                      Cells[6, Vec.MissileLaunch.Count+1 + j] := timeString;
                      TimeForFlight := StartDTOT + UpdateMissileLaunchList.TImeFlight - StartDTOT;
                      timeString := FormatDateTime('hh : mm : ss', TimeForFlight);
                      Cells[7, Vec.MissileLaunch.Count+1 + j] := timeString;
                    end
                    else
                    begin
                      Cells[2, Vec.MissileLaunch.Count+1 + j] := 'Ready To Launch';
                      Cells[6, Vec.MissileLaunch.Count+1 + j] := '00 : 00 : 00';

                      TimeForFlight := UpdateMissileLaunchList.TImeFlight;
                      timeString := FormatDateTime('hh : mm : ss', TimeForFlight);
                      Cells[7,  Vec.MissileLaunch.Count+1 + j] := timeString;

                      if (Row = Vec.MissileLaunch.Count+1+j) then
                      begin
                        btnLaunch.Enabled := True;
                        btnAbortSurfaceToSurface.Enabled := True;
                        SgSSMissileSelectedCell := Row;
                      end;
                    end;
                  end;
                end;
              end;
            end;

            if Assigned(Vec.MissileDTOTLaunch)then
            begin
              for j := 0 to Vec.MissileDTOTLaunch.Count - 1 do
              begin
                obj := Vec.MissileDTOTLaunch[j];
                if not (obj is TMissileHaveLaunch) then
                  Continue;

                UpdateMissileLaunchList := TMissileHaveLaunch(obj);

                if Assigned(Vec.MissileLaunch) and Assigned(Vec.MissileWaittoLaunch) then
                begin
                  with sgSurfacetoSurface do
                  begin
                    Cells[0, Vec.MissileLaunch.Count+1 + j + Vec.MissileWaittoLaunch.Count] := UpdateMissileLaunchList.MissileName;
                    Cells[1, Vec.MissileLaunch.Count+1 + j + Vec.MissileWaittoLaunch.Count] := IntToStr(UpdateMissileLaunchList.LauncherNumber);
                    Cells[2, Vec.MissileLaunch.Count+1 + j + Vec.MissileWaittoLaunch.Count] := 'Launched';
                    Cells[3, Vec.MissileLaunch.Count+1 + j + Vec.MissileWaittoLaunch.Count] := UpdateMissileLaunchList.TargetShipName;
                    Cells[4, Vec.MissileLaunch.Count+1 + j + Vec.MissileWaittoLaunch.Count] := 'DTOT';
                    Cells[5, Vec.MissileLaunch.Count+1 + j + Vec.MissileWaittoLaunch.Count] := FloatToStr(UpdateMissileLaunchList.launcherMissileAngle);
                    Cells[6, Vec.MissileLaunch.Count+1 + j + Vec.MissileWaittoLaunch.Count] := '00 : 00 : 00';

                    TimeForFlight := UpdateMissileLaunchList.TImeFlight - TimeOf(simMgrClient.GameTIME);

                    if TimeForFlight >= 0 then
                    begin
                      timeString := FormatDateTime('hh : mm : ss', TimeForFlight);
                      Cells[7, Vec.MissileLaunch.Count+1 + j + Vec.MissileWaittoLaunch.Count] := timeString;
                    end
                    else
                      Cells[7, Vec.MissileLaunch.Count+1 + j + Vec.MissileWaittoLaunch.Count] := '00 : 00 : 00';

                    if (Row = Vec.MissileLaunch.Count+1+j+Vec.MissileWaittoLaunch.Count) then
                    begin
                      btnLaunch.Enabled := False;
                      btnAbortSurfaceToSurface.Enabled := False;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.ClearAllSurfaceToAirList(pi: TT3PlatformInstance);
var
  i, j : Integer;
  ListMissile : TMissileHaveLaunch;

  Count : Integer;
begin
  Count := 0;

  if pi is TT3Vehicle then
  begin
    if not TT3Vehicle(pi).isReadyToCalculate then
    begin
      TT3Vehicle(pi).MissileWaittoLaunch.Clear;
      TT3Vehicle(pi).isReadyToCalculate := false;
    end;
    for i := 0 to TT3Vehicle(pi).MissileLaunch.Count - 1 do
    begin
      ListMissile := TMissileHaveLaunch(TT3Vehicle(pi).MissileLaunch[i]);

      if ListMissile.isAir and ListMissile.isLaunch then
      begin
        Count := Count + 1;
      end;
    end;
  end;

  for i := 0 to sgSurfacetoAir.RowCount - 1 do
  begin
    if i+1 <= count then Continue;

    for j := 0 to sgSurfacetoAir.ColCount - 1 do
    begin
      sgSurfacetoAir.Cells[j, i+1] := '';
    end;
  end;
end;

procedure TfrmToteDisplay.ClearAllSurfaceToSurfaceList(pi : TT3PlatformInstance);
var
  i, j : Integer;
  ListMissile : TMissileHaveLaunch;

  Count : Integer;
begin
  Count := 0;

  if pi is TT3Vehicle then
  begin

    if not TT3Vehicle(pi).isReadyToCalculate then
    begin
      TT3Vehicle(pi).MissileWaittoLaunch.Clear;
      TT3Vehicle(pi).isReadyToCalculate := false;
    end;
    for i := 0 to TT3Vehicle(pi).MissileLaunch.Count - 1 do
    begin
      ListMissile := TMissileHaveLaunch(TT3Vehicle(pi).MissileLaunch[i]);

      if not ListMissile.isAir and ListMissile.isLaunch then
      begin
        Count := Count + 1;
      end;
    end;

  end;

  for i := 0 to sgSurfacetoSurface.RowCount - 1 do
  begin
    if i+1 <= count then Continue;

    for j := 0 to sgSurfacetoSurface.ColCount - 1 do
    begin
      sgSurfacetoSurface.Cells[j, i+1] := '';
    end;
  end;
end;

procedure TfrmToteDisplay.ClearAllWaitingMissile(pi: TT3PlatformInstance);
begin
  TT3Vehicle(pi).MissileWaittoLaunch.Clear;
  TT3Vehicle(pi).isReadyToCalculate := false;
end;

procedure TfrmToteDisplay.RefreshChannelMapping(aGroupName : string);
var
  i,j,aIdRow : integer;
  ChannelMapping : TChannelMapping;
  aExternalCom : TExternal_Communication_Channel;
begin
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    for i := 0 to simMgrClient.ListComChannel.Count - 1 do
    begin
      ChannelMapping := TChannelMapping(simMgrClient.ListComChannel.items[i]);
      if LowerCase(ChannelMapping.GroupName) = LowerCase(aGroupName) then
      begin
        edtGroupName.Text := ChannelMapping.GroupName;

        lvIn.Items.Clear;
        lvOut.Items.Clear;

        //Mapping
        for j := 0 to ChannelMapping.ListComChannelMapping.Count - 1 do
        begin
          aExternalCom := TExternal_Communication_Channel(ChannelMapping.ListComChannelMapping.Items[j]);

          with lvOut.Items.Add do
          begin
            Caption := IntToStr(aExternalCom.FData.Channel_Number);
            SubItems.Add(aExternalCom.FData.Channel_Identifier);
            SubItems.Add(aExternalCom.FData.Channel_Code);
          end;
        end;
        //Available
        for j := 0 to ChannelMapping.ListComChannelAvailable.Count - 1 do
        begin
          aExternalCom := TExternal_Communication_Channel(ChannelMapping.ListComChannelAvailable.Items[j]);

          with lvIn.Items.Add do
          begin
            Caption := IntToStr(aExternalCom.FData.Channel_Number);
            SubItems.Add(aExternalCom.FData.Channel_Identifier);
            SubItems.Add(aExternalCom.FData.Channel_Code);
          end;
        end;
        Break;
      end;
    end;

    for i := 0 to simMgrClient.ListComChannel.Count - 1 do
    begin
      ChannelMapping := TChannelMapping(simMgrClient.ListComChannel.items[i]);
      if ChannelMapping.GroupID = 0 then
      begin
        for j := 0 to sgComInInjection.RowCount - 1 do
        begin
          sgComInInjection.Cells[0, j+1] := '';
          sgComInInjection.Cells[1, j+1] := '';
          sgComInInjection.Cells[2, j+1] := '';
          sgComInInjection.Cells[3, j+1] := '';
        end;

        for j := 0 to ChannelMapping.ListComChannelAvailable.Count - 1 do
        begin
          aExternalCom := TExternal_Communication_Channel(
                          ChannelMapping.ListComChannelAvailable.Items[j]);

          aIdRow := j+1;

          sgComInInjection.Cells[0, aIdRow] := IntToStr(aExternalCom.FData.Channel_Number);
          sgComInInjection.Cells[1, aIdRow] := aExternalCom.FData.Channel_Identifier;
          sgComInInjection.Cells[2, aIdRow] := aExternalCom.FData.Channel_Code;

          case aExternalCom.FData.Channel_Interference of
            mcsClear : sgComInInjection.Cells[3, aIdRow] := 'Clear';
            mcsJamming : sgComInInjection.Cells[3, aIdRow] := 'Jamming';
            mcsNoise : sgComInInjection.Cells[3, aIdRow] := 'Noise';
            mcsTones : sgComInInjection.Cells[3, aIdRow] := 'MHTones';
          end;
        end;

        for j := 0 to ChannelMapping.ListComChannelMapping.Count - 1 do
        begin
          aExternalCom := TExternal_Communication_Channel(
                          ChannelMapping.ListComChannelMapping.Items[j]);

          aIdRow := ChannelMapping.ListComChannelAvailable.Count+j+1;

          sgComInInjection.Cells[0, aIdRow] := IntToStr(aExternalCom.FData.Channel_Number);
          sgComInInjection.Cells[1, aIdRow] := aExternalCom.FData.Channel_Identifier;
          sgComInInjection.Cells[2, aIdRow] := aExternalCom.FData.Channel_Code;

          case aExternalCom.FData.Channel_Interference of
            mcsClear : sgComInInjection.Cells[3, aIdRow] := 'Clear';
            mcsJamming : sgComInInjection.Cells[3, aIdRow] := 'Jamming';
            mcsNoise : sgComInInjection.Cells[3, aIdRow] := 'Noise';
            mcsTones : sgComInInjection.Cells[3, aIdRow] := 'MHTones';
          end;
        end;
      end;
    end;
  end
  else
  begin
    for i := 0 to simMgrClient.ListComChannel.Count - 1 do
    begin
      ChannelMapping := TChannelMapping(simMgrClient.ListComChannel.items[i]);
      if LowerCase(ChannelMapping.GroupName) =
         LowerCase(simMgrClient.FMyCubGroup.FData.Group_Identifier)
      then
      begin
        for j := 0 to sgCommChannelDef.RowCount - 1 do
        begin
          with sgCommChannelDef do
          begin
            Objects[0, j+1] := TObject(0);
            Cells[2, j+1] := '';
            Cells[3, j+1] := '';
            Cells[4, j+1] := 'VHF/UHF';
            Cells[5, j+1] := '300';
            Objects[6, j+1] := TObject(0);
          end;
        end;

        for j := 0 to ChannelMapping.ListComChannelMapping.Count - 1 do
        begin
          aExternalCom := TExternal_Communication_Channel(
                          ChannelMapping.ListComChannelMapping.Items[j]);
          aIdRow := aExternalCom.FData.Channel_Number + 1;

          with sgCommChannelDef do
          begin
            Objects[0, aIdRow] := TObject(1);
            Cells[2, aIdRow] := aExternalCom.FData.Channel_Identifier;
            Cells[3, aIdRow] := aExternalCom.FData.Channel_Code;

            case aExternalCom.FData.Comms_Band of
              0 : Cells[4, aIdRow] := 'HF';
              1 : Cells[4, aIdRow] := 'VHF/UHF';
              2 : Cells[4, aIdRow] := 'SATCOM';
              3 : Cells[4, aIdRow] := 'UWT';
              4 : Cells[4, aIdRow] := 'FM';
            end;

            Cells[5, aIdRow] := FloatToStr(aExternalCom.FData.Channel_Freq);

            case aExternalCom.FData.Channel_Security of
              0 : Objects[6, aIdRow] := TObject(0);
              1 : Objects[6, aIdRow] := TObject(1);
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.ClickCpItemPopUp(Sender: TObject);
var
  i,j : integer;
  ChannelMapping : TChannelMapping;
  aCpGroupName : string;

  aGroupID : integer;
  aGroupName : string;

  aExternalCom : TExternal_Communication_Channel;
  RemoveChannel : TRecModifComm;
  AddChannel : TRecModifComm;
begin
  if Sender is TMenuItem then
  begin
    aGroupID := -1;
    aGroupName := edtGroupName.Text;
    aCpGroupName := DeleteAmpersand(TMenuItem(sender).Caption);

    for i := 0 to simMgrClient.ListComChannel.Count - 1 do
    begin
      ChannelMapping := TChannelMapping(simMgrClient.ListComChannel.Items[i]);

      if LowerCase(ChannelMapping.GroupName) = LowerCase(aGroupName) then
      begin
        aGroupID := ChannelMapping.GroupID;

        if aGroupID <> -1 then
        begin
          for j := 0 to ChannelMapping.ListComChannelMapping.Count - 1 do
          begin
            aExternalCom := TExternal_Communication_Channel(ChannelMapping.ListComChannelMapping.items[j]);

            RemoveChannel.GroupID := ChannelMapping.GroupID;
            RemoveChannel.Channel_Number := aExternalCom.FData.Channel_Number;
            RemoveChannel.Channel_Ident := aExternalCom.FData.Channel_Identifier;
            RemoveChannel.Channel_Code := aExternalCom.FData.Channel_Code;
            RemoveChannel.Channel_Frek := aExternalCom.FData.Channel_Freq;
            RemoveChannel.Channel_band := aExternalCom.FData.Comms_Band;
            case aExternalCom.FData.Channel_Security  of
              0 : RemoveChannel.Channel_Security := false;
              1 : RemoveChannel.Channel_Security := true;
            end;
            RemoveChannel.ModifStat := mcsRemove;

            SimMgrClient.netSend_ModifyCommunication(RemoveChannel);
            Sleep(10);
          end;
        end;

        Break;
      end;
    end;

    if aGroupID <> -1 then
    begin
      for i := 0 to simMgrClient.ListComChannel.Count - 1 do
      begin
        ChannelMapping := TChannelMapping(simMgrClient.ListComChannel.Items[i]);

        if LowerCase(ChannelMapping.GroupName) = LowerCase(aCpGroupName) then
        begin
          if aGroupID <> -1 then
          begin
            for j := 0 to ChannelMapping.ListComChannelMapping.Count - 1 do
            begin
              aExternalCom := TExternal_Communication_Channel(ChannelMapping.ListComChannelMapping.items[j]);

              AddChannel.GroupID := aGroupID;
              AddChannel.Channel_Number := aExternalCom.FData.Channel_Number;
              AddChannel.Channel_Ident := aExternalCom.FData.Channel_Identifier;
              AddChannel.Channel_Code := aExternalCom.FData.Channel_Code;
              AddChannel.Channel_Frek := aExternalCom.FData.Channel_Freq;
              AddChannel.Channel_band := aExternalCom.FData.Comms_Band;
              case aExternalCom.FData.Channel_Security  of
                0 : AddChannel.Channel_Security := false;
                1 : AddChannel.Channel_Security := true;
              end;
              AddChannel.ModifStat := mcsAdd;

              SimMgrClient.netSend_ModifyCommunication(AddChannel);
              Sleep(10);
            end;
          end;

          Break;
        end;
      end;
    end;

    RefreshChannelMapping(DeleteAmpersand(aGroupName));
  end;
end;

procedure TfrmToteDisplay.ClickItemPopUp(Sender: TObject);
var
  GroupName : string;
begin
  if Sender is TMenuItem then
  begin
    GroupName := DeleteAmpersand(TMenuItem(sender).Caption);
    RefreshChannelMapping(DeleteAmpersand(GroupName));
  end;
end;

procedure TfrmToteDisplay.CountDownTimeEngage(grid : TStringGrid; value: String);
begin
  if grid.Name = 'sgSurfacetoAir' then
    UpdateCellGrid(grid, sgSurToAirEditedRow, 6, value)
  else if grid.Name = 'sgSurfacetoSurface' then
    UpdateCellGrid(grid, sgSurToSurEditedRow, 6, value);
end;

procedure TfrmToteDisplay.CountDownTimeFlight(grid : TStringGrid; value: String);
begin
  if grid.Name = 'sgSurfacetoAir' then
    UpdateCellGrid(grid, sgSurToAirEditedRow, 7, value)
  else if grid.Name = 'sgSurfacetoSurface' then
    UpdateCellGrid(grid, sgSurToSurEditedRow, 7, value);
end;

procedure TfrmToteDisplay.UpdateCellGrid(var grid : TStringGrid; row, column : Integer; value : String);
begin
  grid.Cells[column, row] := value;
end;

procedure TfrmToteDisplay.UpdateCountermeasureVehicle(sender: TT3Vehicle);
var
  i         : Integer;
  ecmstatus : string;
  tn        : TTreeNode;
  //ve        : TT3Vehicle;
  du        : TT3DeviceUnit;
  counter   : TT3CounterMeasure;
begin
  if not Assigned(sender) then
    Exit;

  tvCountermeasures.Items.Clear;

  if Assigned(sender.Devices) then
  begin
    tn := TTreeNode.Create(tvCountermeasures.Items);

    for i := 0 to sender.Devices.Count - 1 do
    begin
      du := sender.Devices.Items[i];

      if du is TT3CounterMeasure then
      begin
        counter := TT3CounterMeasure(du);

        case counter.Status of
          esAvailable:
            ecmStatus := 'Available';
          esUnavailable:
            ecmStatus := 'Unavailable';
          esLaunchingChaff:
            ecmStatus := 'Launching Chaff';
          esDamaged:
            ecmStatus := 'Damaged';
          esOn:
            ecmStatus := 'On';
          esOff:
            ecmStatus := 'Off';
          esEMCON:
            ecmStatus := 'EMCON';
          esAutomatic:
            ecmStatus := 'Automatic';
          esManual:
            ecmStatus := 'Manual';
          esDeployed:
            ecmStatus := 'Deployed';
          esStowed:
            ecmStatus := 'Stowed';
        end;

        tn.Text := counter.InstanceName + ' : ' + ecmstatus;
        tvCountermeasures.Items.AddChildObject(tn, tn.Text, counter);
      end;
    end;
  end;
end;

function TfrmToteDisplay.GetRowGrid(Sender, Target : String; grid: TStringGrid): Integer;
var
  //ro : Integer;
  I: Integer;
begin
  Result := 0;

  if grid.RowCount < 0 then
    Exit;

  Result := -1;
  for I := 0 to grid.RowCount - 1 do
  begin
    if (grid.Cells[0, I] = Sender) and (grid.Cells[3, I] = Target) then
    begin
       Result := I;
    end;
  end;
end;

procedure TfrmToteDisplay.lvEnviroAreaSelectItem(sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  ge: TGame_Environment_Definition;
  se: TSubArea_Enviro_Definition;
  t: TTime;
begin

  if Item = nil then
    Exit;
  if not Assigned(Item.Data) then
    Exit;
  if not Selected then
    Exit;
  // if first item then
  if (sender as TListView).Selected.Index = 0 then
  begin
    ge := Item.Data;

    with ge.FData do
    begin
      edtWindDir.Text := FormatCourse(Wind_Direction);
      edtWindSpeed.Text := FormatSpeed(Wind_Speed);

      trbDaytimeVisual.Position := Round(Daytime_Visual_Modifier * (100.0/100.0));
      trbDaytimeInfra.Position := Round(Daytime_Infrared_Modifier * (100.0/100.0));
      trbNighttimeVisual.Position := Round(Nighttime_Visual_Modifier * (100.0/100.0));
      trbNighttimeInfra.Position := Round(Nighttime_Infrared_Modifier * (100.0/100.0));

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

      edtOceanCurrentDirection.Text := FormatFloat('00.0',
        ge.FData.Ocean_Current_Direction);
      edtOceanCurrentSpeed.Text := FormatFloat('00.0',
        ge.FData.Ocean_Current_Speed);

      edtDepthTermalLayer.Text := FormatFloat('00.0',
        ge.FData.Thermal_Layer_Depth);

      cbxShippingRate.ItemHeight := Shipping_Rate;

      edtSpeedOfSoundSurface.Text := FloatToStr(ge.FData.Surface_Sound_Speed);
      edtSpeedOfSoundlayer.Text := FloatToStr(ge.FData.Layer_Sound_Speed);
      edtSpeedOfSoundBottom.Text := FloatToStr(ge.FData.Bottom_Sound_Speed);

      edtSurfaceDuctUp.Text := FloatToStr(Upper_Limit_Surface_Duct_Depth);
      edtSurfaceDuctLow.Text := FloatToStr(Lower_Limit_Surface_Duct_Depth);

      edtSubSurfaceDuctUp.Text := FloatToStr(Upper_Limit_Sub_Duct_Depth);
      edtSubSurfaceDuctLow.Text := FloatToStr(Lower_Limit_Sub_Duct_Depth);

      trbSeaState.SetTick(Sea_State);
      edtSeaState.Text := IntToStr(Sea_State);
      trbSeaState.Position := Sea_State;

      trbBottomLost.SetTick(Bottomloss_Coefficient);
      edtBottomLost.Text := IntToStr(Bottomloss_Coefficient);
      trbBottomLost.Position := Bottomloss_Coefficient;

      edtSurfaceTemperatur.Text := FloatToStr(Surface_Temperature);
      edtAvgOceanDepth.Text := FloatToStr(Ave_Ocean_Depth);
      edtShadowZone.Text := FloatToStr(Shadow_Zone_Trans_Loss);

      edtAttenRainRate.Text := IntToStr(Rain_Rate);
      trbAttenRainRate.SetTick(Rain_Rate);

      edtAttenCloud.Text := IntToStr(Cloud_Attenuation);
      trbAttenCloud.SetTick(Cloud_Attenuation);

      simMgrClient.SubEnviArea.isVisible := False;
    end;
  end
  else
  begin
    se := Item.Data;

    with se.FData do
    begin
      edtWindDir.Text := FormatCourse(Wind_Direction);
      edtWindSpeed.Text := FormatSpeed(Wind_Speed);

      trbDaytimeVisual.Position := Round(Daytime_Visual_Modifier * 100.0);
      trbDaytimeInfra.Position := Round(Daytime_Infrared_Modifier * 100.0);
      trbNighttimeVisual.Position := Round(Nighttime_Visual_Modifier * 100.0);
      trbNighttimeInfra.Position := Round(Nighttime_Infrared_Modifier * 100.0);
      {
        t := SecondToTime(Sunrise);
        lblEnviCtrlSunrise.Caption := FormatDateTime('hh : nn : ss', t);

        t := SecondToTime(Sunset);
        lblEnviCtrlSunset.Caption := FormatDateTime('hh : nn : ss', t);
        t := SecondToTime(Period_of_Twilight);
        lblEnviCtrlPeriodTwilight.Caption := FormatDateTime('hh : nn : ss', t);
        }
      trbAttenRainRate.Position := Rain_Rate;
      trbAttenCloud.Position := Cloud_Attenuation;

      edtBarometricPressure.Text := FormatFloat('000.0', Barometric_Pressure);
      edtAirTemp.Text := FormatFloat('00.0', Air_Temperature);
      edtCloudBaseHeight.Text := FormatFloat('0000.0', Cloud_Base_Height);

      trbAtmRefract.Position := Round(Atmospheric_Refract_Modifier);

      edtOceanCurrentDirection.Text := FormatFloat('00.0',
        Ocean_Current_Direction);
      edtOceanCurrentSpeed.Text := FormatFloat('00.0', Ocean_Current_Speed);

      edtDepthTermalLayer.Text := FormatFloat('00.0', Thermal_Layer_Depth);

      cbxShippingRate.ItemHeight := Shipping_Rate;

      edtSpeedOfSoundSurface.Text := FloatToStr(se.FData.Surface_Sound_Speed);
      edtSpeedOfSoundlayer.Text := FloatToStr(se.FData.Layer_Sound_Speed);
      edtSpeedOfSoundBottom.Text := FloatToStr(se.FData.Bottom_Sound_Speed);

      edtSurfaceDuctUp.Text := FloatToStr(Upper_Limit_Sur_Duct_Depth);
      edtSurfaceDuctLow.Text := FloatToStr(Lower_Limit_Sur_Duct_Depth);

      edtSubSurfaceDuctUp.Text := FloatToStr(Upper_Limit_Sub_Duct_Depth);
      edtSubSurfaceDuctLow.Text := FloatToStr(Lower_Limit_Sub_Duct_Depth);

      trbSeaState.SetTick(Sea_State);
      edtSeaState.Text := IntToStr(Sea_State);
      trbSeaState.Position := Sea_State;

      trbBottomLost.SetTick(Bottomloss_Coefficient);
      edtBottomLost.Text := IntToStr(Bottomloss_Coefficient);
      trbBottomLost.Position := Bottomloss_Coefficient;

      edtSurfaceTemperatur.Text := FloatToStr(Surface_Temperature);
      edtAvgOceanDepth.Text := FloatToStr(Ave_Ocean_Depth);
      edtShadowZone.Text := FloatToStr(Shadow_Zone_Trans_Loss);

      edtAttenRainRate.Text := IntToStr(Rain_Rate);
      trbAttenRainRate.SetTick(Rain_Rate);

      edtAttenCloud.Text := IntToStr(Cloud_Attenuation);
      trbAttenCloud.SetTick(Cloud_Attenuation);

      //draw area sub envi
      simMgrClient.SubEnviArea.X1 := X_Position_1;
      simMgrClient.SubEnviArea.Y1 := Y_Position_1;
      simMgrClient.SubEnviArea.X2 := X_Position_2;
      simMgrClient.SubEnviArea.Y2 := Y_Position_2;
      simMgrClient.SubEnviArea.isVisible  := True;

    end;
  end;

  rw1.Degree := StrToFloat(edtOceanCurrentDirection.Text);
  rw.Degree := StrToFloat(edtWindDir.Text);

end;

procedure TfrmToteDisplay.lvInCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  intItem1,
  intItem2: Integer;
begin
  intItem1 := StrToInt(item1.Caption);
  intItem2 := StrToInt(item2.Caption);

  if intItem1 < intItem2 then
    Compare := -1
  else
  if intItem1 > intItem2 then
    Compare := 1
  else
    Compare := 0;
end;

procedure TfrmToteDisplay.lvOutCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  intItem1,
  intItem2: Integer;
begin
  intItem1 := StrToInt(item1.Caption);
  intItem2 := StrToInt(item2.Caption);

  if intItem1 < intItem2 then
    Compare := -1
  else
  if intItem1 > intItem2 then
    Compare := 1
  else
    Compare := 0;
end;

// ========================Communication================================
procedure TfrmToteDisplay.ObjectCommunicationCreate;
var
  CheckBoxChannel: TBitmap;
begin
  btnRemove.Enabled := False;
  btnReply.Enabled := False;
  btnForward.Enabled := False;
  btnSend.Enabled := False;
  btnEdit.Enabled := False;

  CheckBoxChannel := TBitmap.Create;
  CheckBoxTrue := TBitmap.Create;
  CheckBoxFalse := TBitmap.Create;

  try
    CheckBoxChannel.handle := LoadBitmap(0, PChar(OBM_CHECKBOXES));
    With CheckBoxFalse Do
    Begin
      Width := CheckBoxChannel.Width div 4;
      Height := CheckBoxChannel.Height div 3;
      Canvas.copyrect(Canvas.cliprect, CheckBoxChannel.Canvas, Canvas.cliprect);
    End;
    With CheckBoxTrue Do
    Begin
      Width := CheckBoxChannel.Width div 4;
      Height := CheckBoxChannel.Height div 3;
      Canvas.copyrect(Canvas.cliprect, CheckBoxChannel.Canvas,
        Rect(Width, 0, 2 * Width, Height));
    End;
  finally
    CheckBoxChannel.free
  end;

  GetComChannel;
end;

procedure TfrmToteDisplay.ObjectCommunicationDestroy;
begin
  PopUpMenu.Free;
  CpPopUpMenu.Free;
  CheckBoxTrue.free;
  CheckBoxFalse.free;
end;

procedure TfrmToteDisplay.onEmbarkedTimer(Sender: TObject; QueueNumber,
  Counter: integer);
var
  node : TTreeNode;
  embarked : TT3EmbarkedVehicle;
  queueEmb : TQueuedEmbarkedLaunch;
  cntStr : string;
  i : integer;
  recLaunch : TRecCmd_Embark;

  str : string;
begin
  { update informasi timer pada tree embarked platform }
  if tvEmbarkedPlatforms.Items.Count <= 0 then exit;
  if not (Sender is TT3EmbarkedVehicle) then exit;

  node := GetItemByObjectData(tvEmbarkedPlatforms.Items.Item[0],Sender);
  if not Assigned(node) then exit;

  embarked := TT3EmbarkedVehicle(Sender);
  if embarked.getQueueCount  <= 0 then exit;

  for I := 0 to embarked.getQueueCount - 1 do begin
    queueEmb := embarked.getQueueItem(i);

    if queueEmb = nil then Continue;
    if queueEmb.HasLaunch then Continue;

    if queueEmb.ReadyToLaunch then begin
      cntStr := '';

      //untuk launch embark platform setelah selesai countdown
      recLaunch.QueueNum  := queueEmb.QueueNumber;
      recLaunch.SessionID := simMgrClient.SessionID;
      recLaunch.ParentPlatformID := TT3PlatformInstance(embarked.Parent).InstanceIndex;
      recLaunch.EmbarkPlatformID := queueEmb.InstanceIndexEmbark;
      recLaunch.Hosted_Index     := 0;
      recLaunch.Quantity         := 0;
      StrToChar('', recLaunch.LaunchName);
      StrToChar(queueEmb.TrackID, recLaunch.TrackIdent);
      recLaunch.InitSpeed        := 0;
      recLaunch.InitCourse       := 0;
      recLaunch.InitAltitude     := 0;
      recLaunch.InitX            := embarked.Parent.getPositionX;
      recLaunch.InitY            := embarked.Parent.getPositionY;
      recLaunch.InitZ            := embarked.Parent.getPositionZ;
      recLaunch.GrpID            := simMgrClient.FMyCubGroup.FData.Group_Index;

      recLaunch.OrderID := CORD_ID_LAUNCH;
      simMgrClient.netSend_CmdLaunch_Embark(recLaunch);

      case queueEmb.ReadyToLaunch of
        True : str := 'True';
        False : str := 'False';
      end;

      queueEmb.HasLaunch := True;

      simMgrClient.Log('TfrmToteDisplay.onEmbarkedTimer',
        'Tote Send Launch platform : ' + queueEmb.TrackID + ' ReadyToLaunch : ' + str);

      continue;
    end;

    cntStr := cntStr + '[' + SecondToTimeString(Round(queueEmb.ReadyingTime)) + ']';

    if i <> embarked.getQueueCount - 1 then
      cntStr := cntStr + ',';
  end;

  node.Text := embarked.EmbarkedIdentifier + ' ' + cntStr;

end;

procedure TfrmToteDisplay.onEmbarkedToReadyingTime(Sender : TObject; QueueNumber : Integer; Counter : Integer);
var
  node : TTreeNode;
  embarked : TT3EmbarkedVehicle;
  queueEmb : TQueuedEmbarkedLaunch;
  cntStr : string;
  i : integer;
  r : TRecCmd_Embark_Landing;
begin
  { update informasi timer pada tree embarked platform }
  if tvEmbarkedPlatforms.Items.Count <= 0 then exit;
  if not (Sender is TT3EmbarkedVehicle) then exit;

  node := GetItemByObjectData(tvEmbarkedPlatforms.Items.Item[0],Sender);

  if not Assigned(node) then exit;

  if not node.HasChildren then Exit;

  node := node.Item[1];

  if not Assigned(node) then exit;

  embarked := TT3EmbarkedVehicle(Sender);

  if embarked.getQueueLandCount  <= 0 then exit;

  for I := 0 to embarked.getQueueLandCount - 1 do begin
    queueEmb := embarked.getQueueLandItem(i);

    if queueEmb = nil then Continue;
    if queueEmb.HasLaunch then Continue;

    if queueEmb.ReadyToLaunch then begin
      cntStr := '';

      r.ParentPlatformID := TT3Vehicle(embarked.Parent).InstanceIndex;
      r.EmbarkPlatformID := 0;
      r.OrderID := CORD_FINISH_READYING;
      r.IndexEmbark := embarked.IndexEmbark;
      r.IndexLanding := queueEmb.QueueNumber;
      r.InitSpeed := 0;
      r.InitCourse := 0;
      r.InitAltitude := 0;

      simMgrClient.netSend_Cmd_Embark_Land(r);

      queueEmb.HasLaunch := True;
//      embarked.removeQueueLandItem(queueEmb);
//      embarked.Quantity := embarked.Quantity + 1;

      continue;
    end;

    if (i <> embarked.getQueueLandCount - 1) and (cntStr <> '') then
      cntStr := cntStr + ',';

    cntStr :=  cntStr + '[' + SecondToTimeString(Round(queueEmb.ReadyingTime)) + ']';

  end;


//  if embarked.Readying <= 0 then
//  begin
//    if embarked.TempReadying <> -1 then
//      cntStr := cntStr + '[' + SecondToTimeString(Round(embarked.TempReadying)) + ']'
//    else
//      cntStr := cntStr + '[' + SecondToTimeString(0) + ']'
//  end
//  else
//    cntStr := cntStr + '[' + SecondToTimeString(Round(embarked.Readying)) + ']';

  node.Text := 'Readying : ' + cntStr;
end;

procedure TfrmToteDisplay.onEmbarkedUpdateState(Sender: TObject);
var
  node, child : TTreeNode;
  embarked : TT3EmbarkedVehicle;
  j, i : Integer;
  queueEmb : TQueuedEmbarkedLaunch;
  str, countstr : string;
  cntStr : string;
begin
  { update state readying, launch alert di treeview item }
  if tvEmbarkedPlatforms.Items.Count <= 0 then exit;
  if not (Sender is TT3EmbarkedVehicle) then exit;

  node := GetItemByObjectData(tvEmbarkedPlatforms.Items.Item[0],Sender);
  if not Assigned(node) then exit;

  embarked := TT3EmbarkedVehicle(Sender);

  if embarked.getQueueCount  <= 0 then
    node.Text := embarked.EmbarkedIdentifier
  else
  begin
    for I := 0 to embarked.getQueueCount - 1 do begin
      queueEmb := embarked.getQueueItem(i);

      if queueEmb = nil then Continue;
      if queueEmb.HasLaunch then Continue;

      if queueEmb.ReadyToLaunch then begin
        cntStr := '';
        continue;
      end;

      cntStr := cntStr + '[' + SecondToTimeString(Round(queueEmb.ReadyingTime)) + ']';

      if i <> embarked.getQueueCount - 1 then
        cntStr := cntStr + ',';
    end;

    node.Text := embarked.EmbarkedIdentifier + ' ' + cntStr;
  end;

  if node.HasChildren then begin
    child := node.getFirstChild;

    while child <> nil do begin

      case child.StateIndex of
        // Quantity
        1 : child.Text := 'Available : ' + IntToStr(embarked.Quantity) ;
        // Readying
        2 :
          begin
            if embarked.getQueueLandCount <= 0 then
              str := 'Readying : '+ SecondToTimeString(Round(0))
            else
            begin
              if embarked.getQueueLandCount  <= 0 then exit;
              for j := 0 to embarked.getQueueLandCount - 1 do begin
                queueEmb := embarked.getQueueLandItem(j);

                countstr := countstr + '[' + SecondToTimeString(Round(queueEmb.ReadyingTime)) + ']';

                if j <> embarked.getQueueLandCount - 1 then
                  countstr := countstr + ',';
              end;

              str := 'Readying : '+ countstr;
            end;

            child.Text := str;
          end;
        // Launch alert
        3 : child.Text := 'Launch Alert : ' + IntToStr(embarked.LaunchAlert) ;
      end;

      child := child.getNextSibling;
    end;
  end;
end;

procedure TfrmToteDisplay.OnKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  value: Integer;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;
end;

procedure TfrmToteDisplay.onLaunchDebarkPersonel(
  rec: TRecCmd_DisembarkPersonelTemporary);
begin
  {Mengirim Paket}
  rec.OrderID := CORD_ID_LAUNCH;
  {----------------}
  if isSenderPersonel then
  begin
    isSenderPersonel := False;
    Sleep(500);
    simMgrClient.netSend_CmdDDisembarkPersonelTemporary(rec);
  end;
end;

procedure TfrmToteDisplay.StatusClick(sender: TObject);
var
  recState : TRecCmd_Change_SystemState;
  tObj     : TSimObject;
  platInstance  : TT3PlatformInstance;
begin
  if lvPlatforms.Selected <> nil then
  begin
    edtState.Tag := TMenuItem(sender).Tag;
    tagState     := edtState.Tag;

    if tagState = tagOverallDamage then
    begin
      edtState.Text := IntToStr(TT3Vehicle(lvPlatforms.Selected.Data).DamageOverall);
      edtState.Visible := true;
    end
    else if tagState = tagHelm then
    begin
      tObj := lvPlatforms.Selected.Data;
      if Assigned(tObj) and (tObj is TT3PlatformInstance) then
      begin
        platInstance := TT3PlatformInstance(tObj);
        recState.PlatfomID := platInstance.InstanceIndex;
        recState.StateID := tagHelm;
        if TMenuItem(sender).Caption = '&Operational' then
        begin
          recState.nValue := 0;
        end
        else if TMenuItem(sender).Caption = '&Pending' then
        begin
          recState.nValue := 1;
        end;

        simMgrClient.netSend_Cmd_Change_SystemState(recState);
      end;
//         TT3Vehicle(tObj).DamageHelm
    end
    else if tagState = tagPropulsion then
    begin
      tObj := lvPlatforms.Selected.Data;
      if Assigned(tObj) and (tObj is TT3PlatformInstance) then
      begin
        platInstance := TT3PlatformInstance(tObj);
        recState.PlatfomID := platInstance.InstanceIndex;
        recState.StateID := tagPropulsion;
        if TMenuItem(sender).Caption = '&Operational' then
        begin
          recState.nValue := 0;
        end
        else if TMenuItem(sender).Caption = '&Pending' then
        begin
          recState.nValue := 1;
        end;

        simMgrClient.netSend_Cmd_Change_SystemState(recState);
      end;
    end
    else if tagState = tagSpeed then
    begin
      edtState.Text := IntToStr(TT3Vehicle(lvPlatforms.Selected.Data).DamagePercentSpeed);
      edtState.Visible := True;
    end
    else if tagState = tagFuelRemaining then
    begin
      edtState.Text := FloatToStr(Round(TT3Vehicle(lvPlatforms.Selected.Data).FuelPercentage));
      edtState.Visible := true;
    end
    else if tagState = tagFuelLeakage then
    begin
      tObj := lvPlatforms.Selected.Data;
      if Assigned(tObj) and (tObj is TT3PlatformInstance) then
      begin
        platInstance := TT3PlatformInstance(tObj);
        recState.PlatfomID := platInstance.InstanceIndex;
        recState.StateID := tagFuelLeakage;
        if TMenuItem(sender).Caption = '&Disable' then
        begin
          recState.nValue := 0;
        end
        else if TMenuItem(sender).Caption = '&Enable' then
        begin
          recState.nValue := 1;
        end;

        simMgrClient.netSend_Cmd_Change_SystemState(recState);
      end;
    end
    else if tagState = tagCommunications then
    begin
      tObj := lvPlatforms.Selected.Data;
      if Assigned(tObj) and (tObj is TT3PlatformInstance) then
      begin
        platInstance := TT3PlatformInstance(tObj);
        recState.PlatfomID := platInstance.InstanceIndex;
        recState.StateID := tagCommunications;
        if TMenuItem(sender).Caption = '&Operational' then
        begin
          recState.nValue := 0;
        end
        else if TMenuItem(sender).Caption = '&Pending' then
        begin
          recState.nValue := 1;
        end;

        simMgrClient.netSend_Cmd_Change_SystemState(recState);
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.RefreshPlatformList;
var
  s: string;
  li, li2, li3: TListItem;
  pi: TT3PlatformInstance;
  i : Integer;
  forceColor: String;

begin
  lvPlatforms.Items.Clear;
  lvPlatformEmbarkDisembark.Items.Clear;
  lvPlatformLogistic.Items.Clear;

  with simMgrClient do
  begin

    {$REGION ' Instruktur & Wasdal Section '}
    if IsController or ISWasdal then
    begin
      for i := 0 to SimPlatforms.itemCount - 1 do
      begin
        pi := TT3PlatformInstance(SimPlatforms.getObject(i));
		    if not(Assigned(pi)) then Continue;

        s := pi.InstanceName;

        case pi.Force_Designation of
          fcRed:
          begin
            lvPlatforms.Canvas.Brush.Color := clRed;
            forceColor := 'Red';
            lvPlatformEmbarkDisembark.Canvas.Brush.Color := clRed;
          end;
          fcBlue:
          begin
            lvPlatforms.Canvas.Brush.Color := clBlue;
            forceColor := 'Blue';
            lvPlatformEmbarkDisembark.Canvas.Brush.Color := clBlue;
          end;
          fcNoForce:
          begin
            lvPlatforms.Canvas.Brush.Color := clBlack;
            forceColor := 'No Force';
            lvPlatformEmbarkDisembark.Canvas.Brush.Color := clBlack;
          end;
        else
          lvPlatforms.Canvas.Brush.Color := clBlack;
          forceColor := 'Black'; //mk
          lvPlatformEmbarkDisembark.Canvas.Brush.Color := clBlack;
        end;

        if pi is TT3Vehicle then     //mk
        begin
          if ((TT3PlatformInstance(pi).UnitGroup) and not(pi.FreeMe)) then
          begin
            li := lvPlatforms.Items.Add;
            li.Caption := pi.InstanceClass;
            li.SubItems.Add(pi.InstanceName);
            li.SubItems.Add(pi.Track_ID);
            li.SubItems.Add(forceColor);
            li.StateIndex := pi.Force_Designation;
            li.Data := pi;

            {untuk menampilkan di halaman embark/disembark}
            li2 := lvPlatformEmbarkDisembark.Items.Add;
            li2.Caption := pi.InstanceName;
            li2.SubItems.Add(pi.InstanceClass);
            li2.SubItems.Add(pi.Track_ID);
            li2.StateIndex := pi.Force_Designation;
            li2.Data := pi;

            {untuk menampilkan di halaman logistic}
            li3 := lvPlatformLogistic.Items.Add;
            li3.Caption := pi.InstanceClass;
            li3.SubItems.Add(pi.InstanceName);
            li3.SubItems.Add(pi.Track_ID);
            li3.SubItems.Add(forceColor);
            li3.StateIndex := pi.Force_Designation;
            li3.Data := pi;
          end;
        end;
      end;
    end
    {$ENDREGION}

    {$REGION ' Operator Section '}
    else
    begin
      for i := 0 to SimPlatforms.itemCount - 1 do
      begin

        pi := TT3PlatformInstance(SimPlatforms.getObject(i));

        if not(Assigned(pi)) then
          Continue;

        if simMgrClient.MyForceDesignation = -1 then
          break
        else
        begin
          if simMgrClient.MyForceDesignation <> pi.Force_Designation then
            continue;
        end;

        case pi.Force_Designation of
          fcRed:
          begin
            lvPlatforms.Canvas.Brush.Color := clRed;
            forceColor := 'Red';
            lvPlatformEmbarkDisembark.Canvas.Brush.Color := clRed;
          end;
          fcBlue:
          begin
            lvPlatforms.Canvas.Brush.Color := clBlue;
            forceColor := 'Blue';
            lvPlatformEmbarkDisembark.Canvas.Brush.Color := clBlue;
          end;
          fcNoForce:
          begin
            lvPlatforms.Canvas.Brush.Color := clBlack;
            forceColor := 'No Force';
            lvPlatformEmbarkDisembark.Canvas.Brush.Color := clBlack;
          end;
        else
          lvPlatforms.Canvas.Brush.Color := clBlack;
          forceColor := 'Black'; //mk
          lvPlatformEmbarkDisembark.Canvas.Brush.Color := clBlack;
        end;

        if pi is TT3Vehicle then     //mk
        begin
          if (TT3PlatformInstance(pi).UnitGroup) and (not(pi.FreeMe)) then
          begin
            li := lvPlatforms.Items.Add;
            li.Caption := pi.InstanceClass;
            li.SubItems.Add(pi.InstanceName);
            li.SubItems.Add(IntToStr(pi.TrackNumber));
            li.SubItems.Add(forceColor);
            li.StateIndex := pi.Force_Designation;
            li.Data := pi;

            {untuk menampilkan di halaman embark/disembark}
            li2 := lvPlatformEmbarkDisembark.Items.Add;
            li2.Caption := pi.InstanceName;
            li2.SubItems.Add(pi.InstanceClass);
            li2.SubItems.Add(IntToStr(pi.TrackNumber));
            li2.StateIndex := pi.Force_Designation;
            li2.Data := pi;

            {untuk menampilkan di halaman logistic}
            li3 := lvPlatformLogistic.Items.Add;
            li3.Caption := pi.InstanceClass;
            li3.SubItems.Add(pi.InstanceName);
            li3.SubItems.Add(IntToStr(pi.TrackNumber));
            li3.SubItems.Add(forceColor);
            li3.StateIndex := pi.Force_Designation;
            li3.Data := pi;
          end;
        end;
      end;
    end;
    {$ENDREGION}

  end;
end;

procedure TfrmToteDisplay.refreshShipTransfer(trackShipSelected: String);
begin

end;

procedure TfrmToteDisplay.refresShipSource(trackShipSelected : String);
var
  range : Double;
  itemSelected,itemCompare : TT3PlatformInstance;
  i : Integer;
  pi : TT3PlatformInstance;
begin
  for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
  begin
    pi := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));

    if pi is TT3Vehicle then
    begin
      if trackShipSelected = Pi.Track_ID  then
      begin
        itemSelected := Pi;
//        lblTrackShipSource.Caption := pi.Track_ID ;
//        lblNameShipSource.Caption := pi.InstanceName;
//        lblClassShipSource.Caption := pi.InstanceClass;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.sgCommChannelDefSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if not simMgrClient.ISInstructor or not simMgrClient.ISWasdal then Exit;

  with sgCommChannelDef do
  begin
    if (Objects[0, ARow] <> Tobject(0)) and (aRow <> 0) and (ACol = 4) then
    begin
      R := sgCommChannelDef.CellRect(ACol, aRow);
      R.Left := R.Left + sgCommChannelDef.Left;
      R.Right := R.Right + sgCommChannelDef.Left;
      R.Top := R.Top + sgCommChannelDef.Top;
      R.Bottom := R.Bottom + sgCommChannelDef.Top;

      with cbbBand do
      begin
        Left := R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;

        ItemIndex := Items.IndexOf(sgCommChannelDef.Cells[aCol, aRow]);
        Visible := True;
        SetFocus;
      end;
      CanSelect := True;
    end
    else
      cbbBand.Visible := False;
  end;
end;

procedure TfrmToteDisplay.sgComInInjectionSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  with sgComInInjection do
  begin
    if (Cells[0, ARow] <> '') and (aRow <> 0) and (ACol = 3) then
    begin
      R := sgComInInjection.CellRect(ACol, aRow);
      R.Left := R.Left + sgComInInjection.Left;
      R.Right := R.Right + sgComInInjection.Left;
      R.Top := R.Top + sgComInInjection.Top;
      R.Bottom := R.Bottom + sgComInInjection.Top;

      with cbbJam do
      begin
        Left := R.Left + 1;
        Top := R.Top + 1;
        Width := (R.Right + 1) - R.Left;
        Height := (R.Bottom + 1) - R.Top;

        ItemIndex := Items.IndexOf(sgComInInjection.Cells[aCol, aRow]);
        Visible := True;
        SetFocus;
      end;
      CanSelect := True;
    end
    else
      cbbJam.Visible := False;
  end;
end;

procedure TfrmToteDisplay.cbbBandChange(Sender: TObject);
var
  intRow : Integer;
  RecSend : TRecModifComm;
begin
  if not simMgrClient.ISInstructor or not simMgrClient.ISWasdal then Exit;

  intRow := sgCommChannelDef.Row;

  if cbbBand.ItemIndex <> -1 then
  begin
    if Assigned(sgCommChannelDef.Objects[0, intRow]) then
    begin
      RecSend.GroupID := -1;
      RecSend.Channel_Number := intRow - 1;
      RecSend.Channel_Ident := '';
      RecSend.Channel_Code := '';
      RecSend.Channel_Frek := 0;
      RecSend.Channel_band := cbbBand.ItemIndex;
      RecSend.Channel_Security := false;
      RecSend.Channel_intfr := mcsClear;
      RecSend.ModifStat := mcsChangeBand;
      simMgrClient.netSend_ModifyCommunication(RecSend);
    end;
  end;
end;

procedure TfrmToteDisplay.cbbJamChange(Sender: TObject);
var
  intRow : Integer;
  RecSend : TRecModifComm;
begin
  intRow := sgComInInjection.Row;

  if cbbJam.ItemIndex <> -1 then
  begin
    RecSend.GroupID := -1;
    RecSend.Channel_Number := StrToInt(sgComInInjection.Cells[0, intRow]);
    RecSend.Channel_Ident := '';
    RecSend.Channel_Code := '';
    RecSend.Channel_Frek := 0;
    RecSend.Channel_band := 0;
    RecSend.Channel_Security := false;

    case cbbJam.ItemIndex of
      0 : RecSend.Channel_intfr := mcsClear;
      1 : RecSend.Channel_intfr := mcsJamming;
      2 : RecSend.Channel_intfr := mcsNoise;
      3 : RecSend.Channel_intfr := mcsTones;
    end;

    RecSend.ModifStat := mcsInterference;
    simMgrClient.netSend_ModifyCommunication(RecSend);
  end;
end;

procedure TfrmToteDisplay.CommunicationCheckBox(acol, arow, state: Integer);
var
  RecSend : TRecModifComm;
  ComFreq : Double;
begin
  if state = 0 then
  begin
    if Assigned(sgCommChannelDef.Objects[acol, arow]) then
    begin
      RecSend.Channel_Number := arow - 1;
      RecSend.GroupID := -1;
      RecSend.Channel_Ident := '';
      RecSend.Channel_Code := '';
      RecSend.Channel_Frek := 0;
      RecSend.Channel_band := 0;
      RecSend.Channel_Security := False;
      RecSend.Channel_intfr := mcsClear;
      RecSend.ModifStat := mcsOff;
      simMgrClient.netSend_ModifyCommunication(RecSend);
    end
    else
    begin
      RecSend.GroupID := -1;
      RecSend.Channel_Number := aRow - 1;

      //Channel Ident
      if sgCommChannelDef.Cells[2, arow] = '' then
        RecSend.Channel_Ident := 'Channel-' + IntToStr(RecSend.Channel_Number + 1)
      else
        RecSend.Channel_Ident := sgCommChannelDef.Cells[2, arow];

      //Channel Code
      if sgCommChannelDef.Cells[3, arow] = '' then
        RecSend.Channel_Code := 'Ch-' + IntToStr(RecSend.Channel_Number + 1)
      else
        RecSend.Channel_Code := sgCommChannelDef.Cells[3, arow];

      //Channel Band
      if sgCommChannelDef.Cells[4, arow] = 'HF' then RecSend.Channel_band := 0
      else if sgCommChannelDef.Cells[4, arow] = 'VHF/UHF' then RecSend.Channel_band := 1
      else if sgCommChannelDef.Cells[4, arow] = 'SATCOM' then RecSend.Channel_band := 2
      else if sgCommChannelDef.Cells[4, arow] = 'UWT' then RecSend.Channel_band := 3
      else if sgCommChannelDef.Cells[4, arow] = 'FM' then RecSend.Channel_band := 4;

      //Channel Freq
      if TryStrToFloat(sgCommChannelDef.Cells[5, arow], ComFreq) then
        RecSend.Channel_Frek := ComFreq
      else
        RecSend.Channel_Frek := 300;

      //Channel Security
      if Assigned(sgCommChannelDef.Objects[6, arow]) then
        RecSend.Channel_Security := True
      else
        RecSend.Channel_Security := False;

      RecSend.Channel_intfr := mcsClear;
      RecSend.ModifStat := mcsCreate;
      simMgrClient.netSend_ModifyCommunication(RecSend);
    end;
  end
  else
  if state = 1 then
  begin
    if Assigned(sgCommChannelDef.Objects[0, arow]) then
    begin
      if Assigned(sgCommChannelDef.Objects[acol, arow]) then
      begin
        RecSend.Channel_Number := arow - 1;
        RecSend.GroupID := -1;
        RecSend.Channel_Ident := '';
        RecSend.Channel_Code := '';
        RecSend.Channel_Frek := 0;
        RecSend.Channel_band := 0;
        RecSend.Channel_Security := False;
        RecSend.Channel_intfr := mcsClear;
        RecSend.ModifStat := mcsChangeSecure;
        simMgrClient.netSend_ModifyCommunication(RecSend);
      end
      else
      begin
        RecSend.Channel_Number := arow - 1;
        RecSend.GroupID := -1;
        RecSend.Channel_Ident := '';
        RecSend.Channel_Code := '';
        RecSend.Channel_Frek := 0;
        RecSend.Channel_band := 0;
        RecSend.Channel_Security := true;
        RecSend.Channel_intfr := mcsClear;
        RecSend.ModifStat := mcsChangeSecure;
        simMgrClient.netSend_ModifyCommunication(RecSend);
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.sgCommChannelDefKeyPress(Sender: TObject;
  var Key: Char);
var
  pt : TPoint;
  grid : TStringgrid;
  aCol, aRow : Integer;
  ChannelFreq : Double;
  RecSend : TRecModifComm;
begin
  if not simMgrClient.ISInstructor or not simMgrClient.ISWasdal then Exit;
  if key = #13 then
  begin
    GetCursorPos( pt );
    grid := Sender As TStringgrid;
    pt:= grid.ScreenToClient( pt );
    grid.MouseToCell( pt.x, pt.y, aCol, aRow );

    if ((aCol = 2) or (aCol = 3) or (aCol = 5)) and (aRow >= grid.fixedRows) then
    begin
      if Assigned(grid.Objects[0, aRow]) then
      begin
        if grid.Cells[aCol, aRow] <> TempDefCom then
        begin
          RecSend.GroupID := -1;
          RecSend.Channel_Number := aRow - 1;
          RecSend.Channel_Ident := grid.Cells[2, aRow];
          RecSend.Channel_Code := grid.Cells[3, aRow];
          if TryStrToFloat(grid.Cells[5, aRow], ChannelFreq) then
            RecSend.Channel_Frek := ChannelFreq
          else
            RecSend.Channel_Frek := 300;
          RecSend.Channel_band := 0;
          RecSend.Channel_Security := false;
          RecSend.ModifStat := mcsChangeLabel;
          simMgrClient.netSend_ModifyCommunication(RecSend);

          grid.Cells[aCol, aRow] := TempDefCom
        end;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.sgCommChannelDefClick(Sender: TObject);
var
  pt : TPoint;
  grid: TStringgrid;
  aCol, aRow: Integer;
begin
  if not simMgrClient.ISInstructor or not simMgrClient.ISWasdal then Exit;

  GetCursorPos( pt );
  grid := Sender As TStringgrid;
  pt:= grid.ScreenToClient( pt );
  grid.MouseToCell( pt.x, pt.y, aCol, aRow );

  if (aCol = 0) and (aRow >= grid.fixedRows) Then
  begin
    CommunicationCheckBox(aCol, aRow, 0);
  end
  else
  If (aCol = 6) and (aRow >= grid.fixedRows) Then
  begin
    CommunicationCheckBox( aCol, aRow, 1 );
  end;

  With Sender as TStringgrid Do
  begin
    If (ACol = 0) or (ACol = 1) or (ACol = 4) or (ACol = 6 )   Then
      Options := Options - [ goediting ]
    else
    begin
      with sgCommChannelDef do
      begin
        if Objects[0, ARow] = TObject(1) then
        begin
          Options := Options + [ goediting ];
          TempDefCom := Cells[ACol, aRow];
        end;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.sgCommChannelDefDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
const
   AlignFlags: array [TAlignment] of Integer =
   (DT_LEFT or DT_VCENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
    DT_RIGHT or DT_VCENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
    DT_CENTER or DT_VCENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX);
var
  Grid: TStringgrid;
begin
  If not ( gdFixed In State ) and (aCol = 0) Then
  Begin
    grid:= Sender As TStringgrid;
    With grid.Canvas Do
    Begin
      brush.color := clWindow;
      Fillrect( rect );
      If Assigned(grid.Objects[aCol, aRow]) Then
        Draw( (rect.right + rect.left - CheckBoxTrue.width) div 2,
              (rect.bottom + rect.top - CheckBoxTrue.height) div 2,
              CheckBoxTrue )
      Else
        Draw( (rect.right + rect.left - CheckBoxFalse.width) div 2,
              (rect.bottom + rect.top - CheckBoxFalse.height) div 2,
              CheckBoxFalse )
    End;
  End;

  If not ( gdFixed In State ) and (aCol = 6) Then
  Begin
    grid:= Sender As TStringgrid;
    With grid.Canvas Do
    Begin
      brush.color := clWindow;
      Fillrect( rect );
      If Assigned(grid.Objects[aCol, aRow]) Then
        Draw( (rect.right + rect.left - CheckBoxTrue.width) div 2,
              (rect.bottom + rect.top - CheckBoxTrue.height) div 2,
              CheckBoxTrue )
      Else
        Draw( (rect.right + rect.left - CheckBoxFalse.width) div 2,
              (rect.bottom + rect.top - CheckBoxFalse.height) div 2,
              CheckBoxFalse )
    End;
  End;
end;

procedure TfrmToteDisplay.GetComChannel;
var
  i,j,k,l : Integer;
  AExternalCom,
  ATempExternalCom :  TExternal_Communication_Channel;
  aComChannel : TChannelMapping;

  cubChannel : TT3CubicleChanel;
  aIdRow : integer;
  isFound : Boolean;
begin
  //Default Value for Channel Definition
  with sgCommChannelDef do
  begin
    Cells[0, 0] := 'Enable';
    Cells[1, 0] := 'Channel';
    Cells[2, 0] := 'Name';
    Cells[3, 0] := 'Code';
    Cells[4, 0] := 'Band';
    Cells[5, 0] := 'Frequency (MHz)';
    Cells[6, 0] := 'Secure';
  end;

  with sgComInInjection do
  begin
    Cells[0, 0] := 'Channel';
    Cells[1, 0] := 'Name';
    Cells[2, 0] := 'Code';
    Cells[3, 0] := 'Sound Effect';
  end;

  for i := 0 to sgCommChannelDef.RowCount do
  begin
    sgCommChannelDef.Cells[1, i + 1] := IntToStr(i); // Channel Number
    sgCommChannelDef.Cells[4, i + 1] := 'VHF/UHF';   // Channel Band
    sgCommChannelDef.Cells[5, i + 1] := '300';       // Channel Frekuensi
  end;

  //Add All Member to List
  for j := 0 to simMgrClient.Scenario.CubChanelList.Count - 1 do
  begin
    cubChannel := TT3CubicleChanel(simMgrClient.Scenario.CubChanelList.Items[j]);

    aComChannel := TChannelMapping.create;
    aComChannel.GroupID := cubChannel.GroupID;
    aComChannel.GroupName := cubChannel.GroupName;

    //Create Pop Up Menu Select and Copy
    //Select
    CpItemPopUp := TMenuItem.Create(CpPopUpMenu);
    CpItemPopUp.Caption := cubChannel.GroupName;
    CpItemPopUp.Tag := cubChannel.GroupID;
    CpItemPopUp.OnClick := ClickCpItemPopUp;
    CpPopUpMenu.Items.Add(CpItemPopUp);
    //Copy
    ItemPopUp := TMenuItem.Create(PopUpMenu);
    ItemPopUp.Caption := cubChannel.GroupName;
    ItemPopUp.Tag := cubChannel.GroupID;
    ItemPopUp.OnClick := ClickItemPopUp;
    PopUpMenu.Items.Add(ItemPopUp);

    for l := 0 to simMgrClient.Scenario.ExCom.Count - 1 do
    begin
      AExternalCom := TExternal_Communication_Channel(simMgrClient.Scenario.ExCom[l]);
      isFound := false;

      for k := 0 to cubChannel.ListExternalChannel.Count - 1 do
      begin
        ATempExternalCom := TExternal_Communication_Channel(cubChannel.ListExternalChannel.Items[k]);

        if AExternalCom.FData.Channel_Number = ATempExternalCom.FData.Channel_Number then
        begin
          isFound := True;
          Break;
        end;
      end;

      if isFound then
      begin
        //addList Communication Mapping
        AExternalCom.FData.Channel_Interference := mcsClear;
        aComChannel.AddtoChannelMapping(AExternalCom.FData);
      end
      else
      begin
        //addList Communication Available
        AExternalCom.FData.Channel_Interference := mcsClear;
        aComChannel.AddtoChannelAvailable(AExternalCom.FData);
      end;
    end;

    simMgrClient.ListComChannel.add(aComChannel);
  end;

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    for i := 0 to simMgrClient.Scenario.CubChanelList.Count - 1 do
    begin
      cubChannel := TT3CubicleChanel(simMgrClient.Scenario.CubChanelList.Items[i]);
      if cubChannel.GroupID = 0 then
      begin
        for j := 0 to sgCommChannelDef.RowCount do
        begin
          sgCommChannelDef.Cells[1, j + 1] := IntToStr(j); // Channel Number
          sgCommChannelDef.Cells[4, j + 1] := 'VHF/UHF';   // Channel Band
          sgCommChannelDef.Cells[5, j + 1] := '300';       // Channel Frekuensi
        end;

        //Fill in Stringgrid channel definition in Intruktur
        for j := 0 to cubChannel.ListExternalChannel.Count - 1 do
        begin
          AExternalCom := TExternal_Communication_Channel(simMgrClient.Scenario.ExCom[j]);
          aIdRow := AExternalCom.FData.Channel_Number + 1;

          sgCommChannelDef.Cells[2, aIdRow] := AExternalCom.FData.Channel_Identifier;
          sgCommChannelDef.Cells[3, aIdRow] := AExternalCom.FData.Channel_Code;

          sgComInInjection.Cells[0, aIdRow] := IntToStr(AExternalCom.FData.Channel_Number);
          sgComInInjection.Cells[1, aIdRow] := AExternalCom.FData.Channel_Identifier;
          sgComInInjection.Cells[2, aIdRow] := AExternalCom.FData.Channel_Code;
          sgComInInjection.Cells[3, aIdRow] := 'Clear';

          case AExternalCom.FData.Comms_Band of
            0 : sgCommChannelDef.Cells[4, aIdRow] := 'HF';
            1 : sgCommChannelDef.Cells[4, aIdRow] := 'VHF/UHF';
            2 : sgCommChannelDef.Cells[4, aIdRow] := 'SATCOM';
            3 : sgCommChannelDef.Cells[4, aIdRow] := 'UWT';
            4 : sgCommChannelDef.Cells[4, aIdRow] := 'FM';
          end;

          with sgCommChannelDef do
          begin
            Objects[0, aIdRow] := TObject(1);

            case AExternalCom.FData.Channel_Security of
              0 : Objects[6, aIdRow] := TObject(0);
              1 : Objects[6, aIdRow] := TObject(1);
            end;
          end;

          with lvOut.Items.Add do
          begin
            Caption := IntToStr(AExternalCom.FData.Channel_Number);
            SubItems.Add(AExternalCom.FData.Channel_Identifier);
            SubItems.Add(AExternalCom.FData.Channel_Code);
          end;
        end;

        Break;
      end;
    end;

    edtGroupName.Text := 'Controller';
    //Jamming
    tbNoise.Min := 0;
    tbNoise.Max := 1000;
    tbJamming.Min := 0;
    tbJamming.Max := 1000;
    tbMHStones.Min := 0;
    tbMHStones.Max := 1000;
  end
  else
  begin
    if not Assigned(simMgrClient.FMyCubGroup) then exit;

    for i := 0 to simMgrClient.Scenario.CubChanelList.Count - 1 do
    begin
      cubChannel := simMgrClient.Scenario.CubChanelList.Items[i];
      if cubChannel.GroupID = simMgrClient.FMyCubGroup.FData.Group_Index then
      begin
        for j := 0 to cubChannel.ListExternalChannel.Count - 1 do
        begin
          AExternalCom := TExternal_Communication_Channel(cubChannel.ListExternalChannel.Items[j]);
          aIdRow := AExternalCom.FData.Channel_Number + 1;

          sgCommChannelDef.Objects[0, aIdRow] := TObject(1);
          sgCommChannelDef.Cells[2, aIdRow] := AExternalCom.FData.Channel_Identifier;
          sgCommChannelDef.Cells[3, aIdRow] := AExternalCom.FData.Channel_Code;

          case AExternalCom.FData.Comms_Band of
            0 : sgCommChannelDef.Cells[4, aIdRow] := 'HF';
            1 : sgCommChannelDef.Cells[4, aIdRow] := 'VHF/UHF';
            2 : sgCommChannelDef.Cells[4, aIdRow] := 'SATCOM';
            3 : sgCommChannelDef.Cells[4, aIdRow] := 'UWT';
            4 : sgCommChannelDef.Cells[4, aIdRow] := 'FM';
          end;

          case AExternalCom.FData.Channel_Security of
            0 : sgCommChannelDef.Objects[6, aIdRow] := TObject(0);
            1 : sgCommChannelDef.Objects[6, aIdRow] := TObject(1);
          end;
        end;
      end;
    end;
  end;
end;

function TfrmToteDisplay.GetInput(s: string): Boolean;
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

function TfrmToteDisplay.GetNumberOfKoma(s: string): Boolean;
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

procedure TfrmToteDisplay.btnNewClick(sender: TObject);
begin
  if not Assigned(fNewMessage) then
    fNewMessage := TfNewMessage.Create(self);

  fNewMessage.isNew := true;
  fNewMessage.ShowModal;
end;

procedure TfrmToteDisplay.btnEditClick(sender: TObject);
var
  MessageHandling : TMessageHandling;
  RecSendMessage : TRecSendMessage;
begin
  if Assigned(fNewMessage) then
    fNewMessage.Close;

  if lvDraft.Selected <> nil then
  begin
    if lvDraft.Selected.Data <> nil then
    begin
      MessageHandling := TMessageHandling(lvDraft.Selected.Data);

      if not Assigned(fNewMessage) then
        fNewMessage := TfNewMessage.Create(self);

      fNewMessage.isNew := False;
      fNewMessage.mmoDisplay.Lines.Clear;
      fNewMessage.edtTo.Text := MessageHandling.FData.RecipientList;
      fNewMessage.edtSubject.Text := MessageHandling.FData.Subject;
      fNewMessage.cbbPrior.ItemIndex := MessageHandling.FData.Priority;
      fNewMessage.mmoDisplay.Lines.Add(MessageHandling.FData.MessageHandling);
      
      MessageHandling.FData.OrderID := 2;
      MessageHandling.FData.Messagetype := 4;
      RecSendMessage := MessageHandling.FData;

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
        MessageHandling.FData.SendFrom := 0
      else
        MessageHandling.FData.SendFrom := simMgrClient.FMyCubGroup.FData.Group_Index;

      simMgrClient.netSend_MessageHandling(RecSendMessage);

      fNewMessage.Show;
    end;
  end;
end;

procedure TfrmToteDisplay.btnSendClick(sender: TObject);
var
  i,j : integer;
  MessageHandling : TMessageHandling;
  RecSendMessage: TRecSendMessage;

  SendToCub : TStrings;
  grp : T3CubicleGroup;
begin
  if lvDraft.Selected <> nil then
  begin
    if lvDraft.Selected.Data <> nil then
    begin
      MessageHandling := TMessageHandling(lvDraft.Selected.Data);

      SendToCub := TStringList.Create;
      SendToCub.Delimiter := ';';
      SendToCub.DelimitedText := MessageHandling.FData.RecipientList;
      
      RecSendMessage.RecipientList := SendToCub.DelimitedText;
      RecSendMessage.OrderID := 0;

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
        RecSendMessage.SendFrom := 0
      else
        RecSendMessage.SendFrom := simMgrClient.FMyCubGroup.FData.Group_Index;

      RecSendMessage.Subject := MessageHandling.FData.Subject;
      RecSendMessage.Priority := MessageHandling.FData.Priority;
      RecSendMessage.Band := MessageHandling.FData.band;
      RecSendMessage.MessageHandling := MessageHandling.FData.MessageHandling;
      RecSendMessage.Messagetype := 0;
      simMgrClient.netSend_MessageHandling(RecSendMessage);

      //Add to Queue Message -> Send after time is ready
      for i := 0 to SendToCub.Count - 1 do
      begin
        RecSendMessage.Sendto := 0;

        for j := 0 to simMgrClient.Scenario.CubiclesGroupsListFromDB.Count - 1 do
        begin
          grp := simMgrClient.Scenario.CubiclesGroupsListFromDB.Items[j] as T3CubicleGroup;
          if grp <> nil then
          begin
            if LowerCase(SendToCub[i]) = 'controller' then
            begin
              RecSendMessage.Sendto := 0;
              Break;
            end
            else
            if LowerCase(grp.FData.Group_Identifier) = LowerCase(SendToCub[i]) then
            begin
              RecSendMessage.Sendto := grp.FData.Group_Index;
              Break;
            end;
          end;
        end;

        RecSendMessage.RecipientList := SendToCub.DelimitedText;
        RecSendMessage.OrderID := 0;
        RecSendMessage.SendFrom := simMgrClient.FMyCubGroup.FData.Group_Index;
        RecSendMessage.Subject := MessageHandling.FData.Subject;
        RecSendMessage.Priority := MessageHandling.FData.Priority;
        RecSendMessage.Band := MessageHandling.FData.band;
        RecSendMessage.MessageHandling := MessageHandling.FData.MessageHandling;
        RecSendMessage.Messagetype := 2;
        simMgrClient.AddListQueueMessage(RecSendMessage);
      end;

      //Add to Queue Message -> Send after time is ready -> for controller
      RecSendMessage.RecipientList := SendToCub.DelimitedText;
      RecSendMessage.OrderID := 0;

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
        RecSendMessage.SendFrom := 0
      else
        RecSendMessage.SendFrom := simMgrClient.FMyCubGroup.FData.Group_Index;

      RecSendMessage.Subject := MessageHandling.FData.Subject;
      RecSendMessage.Priority := MessageHandling.FData.Priority;
      RecSendMessage.Band := MessageHandling.FData.band;
      RecSendMessage.MessageHandling := MessageHandling.FData.MessageHandling;
      RecSendMessage.Messagetype := 3;
      simMgrClient.AddListQueueMessage(RecSendMessage);

      if Assigned(SendToCub) then
      begin
        SendToCub.Clear;
        SendToCub.Free;
      end;

      
      MessageHandling.FData.OrderID := 2;
      MessageHandling.FData.Messagetype := 4;
      RecSendMessage := MessageHandling.FData;
      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
        MessageHandling.FData.SendFrom := 0
      else
        MessageHandling.FData.SendFrom := simMgrClient.FMyCubGroup.FData.Group_Index;

      simMgrClient.netSend_MessageHandling(RecSendMessage);
    end;
  end;
end;

procedure TfrmToteDisplay.btnRefreshClick(Sender: TObject);
begin
  if Assigned(LogisticSelectedPlatform) then
  begin
    {Refresh logistic panel}
    UpdateLogisticToteDisplay(TT3Vehicle(LogisticSelectedPlatform));
  end;
end;

procedure TfrmToteDisplay.btnRemoveClick(Sender: TObject);
var
  MessageHandling : TMessageHandling;
  RecSendMessage : TRecSendMessage;
begin
  if lvReceive.Selected <> nil then
  begin
    if lvReceive.Selected.Data <> nil then
    begin
      MessageHandling := TMessageHandling(lvReceive.Selected.Data);
      MessageHandling.FData.OrderID := 1;
      MessageHandling.FData.Messagetype := 4;

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
        MessageHandling.FData.SendFrom := 0
      else
        MessageHandling.FData.SendFrom := simMgrClient.FMyCubGroup.FData.Group_Index;

      RecSendMessage := MessageHandling.FData;

      simMgrClient.netSend_MessageHandling(RecSendMessage);
    end;
  end
  else
  if lvDraft.Selected <> nil then
  begin
    if lvDraft.Selected.Data <> nil then
    begin
      MessageHandling := TMessageHandling(lvDraft.Selected.Data);
      MessageHandling.FData.OrderID := 2;
      MessageHandling.FData.Messagetype := 4;
      RecSendMessage := MessageHandling.FData;

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
        MessageHandling.FData.SendFrom := 0
      else
        MessageHandling.FData.SendFrom := simMgrClient.FMyCubGroup.FData.Group_Index;

      simMgrClient.netSend_MessageHandling(RecSendMessage);
    end;
  end
  else
  if lvSent.Selected <> nil then
  begin
    if lvSent.Selected.Data <> nil then
    begin
      MessageHandling := TMessageHandling(lvSent.Selected.Data);
      MessageHandling.FData.OrderID := 3;
      MessageHandling.FData.Messagetype := 4;
      RecSendMessage := MessageHandling.FData;

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
        MessageHandling.FData.SendFrom := 0
      else
        MessageHandling.FData.SendFrom := simMgrClient.FMyCubGroup.FData.Group_Index;

      simMgrClient.netSend_MessageHandling(RecSendMessage);
    end;
  end;
end;

procedure TfrmToteDisplay.btnReplyClick(sender: TObject);
var
  i : integer;
  MessageHandling : TMessageHandling;
  grp : T3CubicleGroup;
begin
  if Assigned(fNewMessage) then
    fNewMessage.Close;

  if lvReceive.Selected <> nil then
  begin
    if lvReceive.Selected.Data <> nil then
    begin
      MessageHandling := TMessageHandling(lvReceive.Selected.Data);

      if not Assigned(fNewMessage) then
        fNewMessage := TfNewMessage.Create(self);

      fNewMessage.isNew := False;
      fNewMessage.mmoDisplay.Lines.Clear;

      if MessageHandling.FData.SendFrom = 0 then
      begin
        fNewMessage.edtTo.Text := 'Controller';
      end
      else
      begin
        for i := 0 to simMgrClient.Scenario.CubiclesGroupsListFromDB.Count - 1 do
        begin
          grp := simMgrClient.Scenario.CubiclesGroupsListFromDB.items[i] as T3CubicleGroup;
          if grp.FData.Group_Index = MessageHandling.FData.SendFrom then
          begin
            fNewMessage.edtTo.Text := grp.FData.Group_Identifier;
          end;
        end;
      end;

      fNewMessage.cbbPrior.ItemIndex := MessageHandling.FData.Priority;
      fNewMessage.mmoDisplay.Lines.Add('-------------------------------------');
      fNewMessage.mmoDisplay.Lines.Add(MessageHandling.FData.MessageHandling);
      fNewMessage.mmoDisplay.Lines.Add('-------------------------------------');

      fNewMessage.Show;
    end;
  end;
end;

procedure TfrmToteDisplay.btnForwardClick(sender: TObject);
var
  MessageHandling : TMessageHandling;
begin
  if Assigned(fNewMessage) then
    fNewMessage.Close;

  if lvReceive.Selected <> nil then
  begin
    if lvReceive.Selected.Data <> nil then
    begin
      MessageHandling := TMessageHandling(lvReceive.Selected.Data);

      if not Assigned(fNewMessage) then
        fNewMessage := TfNewMessage.Create(self);

      fNewMessage.isNew := False;
      fNewMessage.mmoDisplay.Lines.Clear;

      fNewMessage.edtTo.Text := ' ';
      fNewMessage.cbbPrior.ItemIndex := MessageHandling.FData.Priority;
      fNewMessage.mmoDisplay.Lines.Add('-------------------------------------');
      fNewMessage.mmoDisplay.Lines.Add(MessageHandling.FData.MessageHandling);
      fNewMessage.mmoDisplay.Lines.Add('-------------------------------------');

      fNewMessage.Show;
    end;
  end;
end;

procedure TfrmToteDisplay.btnPrintClick(sender: TObject);
begin
  // x
end;

procedure TfrmToteDisplay.btnPrintSumClick(Sender: TObject);
var
  i : Integer;
  lvItemStr : string;
  li : TListItem;
//  memo : TfrxMemoView;
//  reportComponent : TfrxComponent;
begin
//  reportComponent := frxRprtSumm.FindObject('Memo1');
//  if reportComponent is TfrxMemoView then
//  begin
//    memo := reportComponent as TfrxMemoView;
//
//
//    frxUsrdtstSumm.RangeEnd := reCount;
//    frxUsrdtstSumm.RangeEndCount := lvEventSummary.Items.Count;
//    frxRprtSumm.ShowReport();
//  end;
end;

procedure TfrmToteDisplay.lvSentClick(sender: TObject);
var
  MessageHandling : TMessageHandling;
begin
  btnReply.Enabled := false;
  btnForward.Enabled := false;
  btnRemove.Enabled := false;
  btnSend.Enabled := false;
  btnEdit.Enabled := false;
  btnPrint.Enabled := false;

  if lvSent.Selected <> nil then
  begin
    if lvsent.Selected.Data <> nil then
    begin
      btnRemove.Enabled := true;

      lvReceive.Selected := nil;
      lvDraft.Selected := nil;

      MessageHandling := TMessageHandling(lvSent.Selected.Data);
      mmoMessage.Lines.Clear;

      mmoMessage.Lines.Add('To : ' + MessageHandling.FData.RecipientList);
      mmoMessage.Lines.Add('Subject : ' + MessageHandling.FData.Subject);

      case MessageHandling.FData.Priority of
        0 : mmoMessage.Lines.Add('Priority : ' + 'FLASH');
        1 : mmoMessage.Lines.Add('Priority : ' + 'IMMED');
        2 : mmoMessage.Lines.Add('Priority : ' + 'PRIORITY');
        3 : mmoMessage.Lines.Add('Priority : ' + 'ROUTINE');
      end;

      mmoMessage.Lines.Add('Original Message : ');
      mmoMessage.Lines.Add(MessageHandling.FData.MessageHandling);
    end;
  end;
end;

procedure TfrmToteDisplay.lvDraftClick(sender: TObject);
var
  i : integer;
  MessageHandling : TMessageHandling;
  grp : T3CubicleGroup;
begin
  btnReply.Enabled := false;
  btnForward.Enabled := false;
  btnRemove.Enabled := false;
  btnSend.Enabled := false;
  btnEdit.Enabled := false;
  btnPrint.Enabled := false;

  if lvDraft.Selected <> nil then
  begin
    if lvDraft.Selected.Data <> nil then
    begin
      btnRemove.Enabled := true;
      btnSend.Enabled := true;
      btnEdit.Enabled := true;

      lvSent.Selected := nil;
      lvReceive.Selected := nil;

      MessageHandling := TMessageHandling(lvDraft.Selected.Data);
      mmoMessage.Lines.Clear;

      if MessageHandling.FData.SendFrom = 0 then
        mmoMessage.Lines.Add('From ' + 'Controller')

      else
      begin
        for i := 0 to simMgrClient.Scenario.CubiclesGroupsListFromDB.Count - 1 do
        begin
          grp := simMgrClient.Scenario.CubiclesGroupsListFromDB.items[i] as T3CubicleGroup;
          if grp <> nil then begin
            if grp.FData.Group_Index = MessageHandling.FData.SendFrom then
            begin
              mmoMessage.Lines.Add('From ' + grp.FData.Group_Identifier);
              Break;
            end;
          end;
        end;
      end;

      mmoMessage.Lines.Add('To : ' + MessageHandling.FData.RecipientList);
      mmoMessage.Lines.Add('');
      mmoMessage.Lines.Add('Subject : ' + MessageHandling.FData.Subject);

      case MessageHandling.FData.Priority of
        0 : mmoMessage.Lines.Add('Priority : ' + 'FLASH');
        1 : mmoMessage.Lines.Add('Priority : ' + 'IMMED');
        2 : mmoMessage.Lines.Add('Priority : ' + 'PRIORITY');
        3 : mmoMessage.Lines.Add('Priority : ' + 'ROUTINE');
      end;

      mmoMessage.Lines.Add('Original Message : ');
      mmoMessage.Lines.Add(MessageHandling.FData.MessageHandling);
    end;
  end
end;

procedure TfrmToteDisplay.lvReceiveClick(sender: TObject);
var
  i : integer;
  MessageHandling : TMessageHandling;
  grp : T3CubicleGroup;
begin
  btnReply.Enabled := false;
  btnForward.Enabled := false;
  btnRemove.Enabled := false;
  btnSend.Enabled := false;
  btnEdit.Enabled := false;
  btnPrint.Enabled := false;

  if lvReceive.Selected <> nil then
  begin
    if lvReceive.Selected.Data <> nil then
    begin
      btnReply.Enabled := true;
      btnForward.Enabled := true;
      btnRemove.Enabled := true;

      lvSent.Selected := nil;
      lvDraft.Selected := nil;

      MessageHandling := TMessageHandling(lvReceive.Selected.Data);
      mmoMessage.Lines.Clear;

      if MessageHandling.FData.SendFrom = 0 then
        mmoMessage.Lines.Add('From ' + 'Controller')
      else
      begin
        for i := 0 to simMgrClient.Scenario.CubiclesGroupsListFromDB.Count - 1 do
        begin
          grp := simMgrClient.Scenario.CubiclesGroupsListFromDB.items[i] as T3CubicleGroup;
          if grp <> nil then
          begin
            if grp.FData.Group_Index = MessageHandling.FData.SendFrom then
            begin
              mmoMessage.Lines.Add('From ' + grp.FData.Group_Identifier);
              Break;
            end;
          end;
        end;
      end;

      mmoMessage.Lines.Add('Subject : ' + MessageHandling.FData.Subject);

      case MessageHandling.FData.Priority of
        0 : mmoMessage.Lines.Add('Priority : ' + 'FLASH');
        1 : mmoMessage.Lines.Add('Priority : ' + 'IMMED');
        2 : mmoMessage.Lines.Add('Priority : ' + 'PRIORITY');
        3 : mmoMessage.Lines.Add('Priority : ' + 'ROUTINE');
      end;

      mmoMessage.Lines.Add('Original Message : ');
      mmoMessage.Lines.Add(MessageHandling.FData.MessageHandling);

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      begin
        mmoMessage.Lines.Add('');
        mmoMessage.Lines.Add('To : ' + MessageHandling.FData.RecipientList);
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.lvRecordInCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
   intItem1,
   intItem2: Integer;
begin
   intItem1 := StrToInt(Item1.Caption);
   intItem2 := StrToInt(Item2.Caption);

   if intItem1 < intItem2 then
     Compare := -1
   else
   if intItem1 > intItem2 then
     Compare := 1
   else
     Compare := 0;
end;

procedure TfrmToteDisplay.lvRecordOutCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
   intItem1,
   intItem2: Integer;
begin
   intItem1 := StrToInt(Item1.Caption);
   intItem2 := StrToInt(Item2.Caption);

   if intItem1 < intItem2 then
     Compare := -1
   else
   if intItem1 > intItem2 then
     Compare := 1
   else
     Compare := 0;
end;

procedure TfrmToteDisplay.unAssignedAllEmbarkedTimerEvent(node : TTreeNode);
var
  hItemChild : TTreeNode;
begin
  if (node = nil) then exit;

  while (node <> nil) do
  begin
    if Assigned(node.Data) then
    begin
      try
        TT3EmbarkedVehicle(node.Data).OnEmbarkedTimer := nil;
      finally

      end;
    end;

    // Check whether we have child items.
    if (node.HasChildren) then
    begin
      // Recursively traverse child items.
      hItemChild := node.getFirstChild;
      unAssignedAllEmbarkedTimerEvent(hItemChild);
    end;

    // Go to next sibling item.
    node := node.getNextSibling;
  end;
end;

function TfrmToteDisplay.lvSystemState_getRow(const row: integer;
  const caption : string): TListItem;

begin
  if lvSystemState.Items.Count <= row then
    result := lvSystemState.Items.Add
  else
    result := lvSystemState.Items[row];

  result.Caption := Caption;

  if result.SubItems.Count < 1 then
    result.SubItems.add('');
end;

procedure TfrmToteDisplay.UpdateMessageHandling(
  const MessageValue: TRecSendMessage);
begin
  //do stuff update here
end;

procedure TfrmToteDisplay.UpdateSensorVehicle(sender: TT3Vehicle);
var
  i       : Integer;
  li      : TListItem;
  //ve      : TT3Vehicle;
  du      : TT3DeviceUnit;
  sensor  : TT3Sensor;
begin
  if not Assigned(sender) then
    Exit;

  lvSensors.Items.Clear;

  if Assigned(sender.Devices) then
  begin
    for i := 0 to sender.Devices.Count - 1 do
    begin
      du := sender.Devices.Items[i];

      if du is TT3Sensor then
      begin
        sensor := TT3Sensor(du);

        li := lvSensors.Items.Add;

        if sensor is TT3Radar then
          li.StateIndex := 1
        else if sensor is TT3Sonar then
          li.StateIndex := 0
        else if sensor is TT3Visual then
          li.StateIndex := 2
        else if sensor is TT3MADSensor then
          li.StateIndex := 4
        else if sensor is TT3ESMSensor then
          li.StateIndex := 3
        else if sensor is TT3EOSensor then
          li.StateIndex := 4
        else if sensor is TT3IFFSensor then
          li.StateIndex := 5
        else
          li.StateIndex := 0;

        if sensor.EmconOperationalStatus = EmconOff then
        begin
          case sensor.OperationalStatus of
            sopOff, sopOffIFF:
              li.SubItems.Add('Off');
            sopOn:
              li.SubItems.Add('On');
            sopDamage:
              li.SubItems.Add('Damaged');
            sopTooDeep:
              li.SubItems.Add('Too Deep');
            sopEMCON:
              li.SubItems.Add('EMCON');
            sopActive:
              li.SubItems.Add('Active');
            sopPassive:
              li.SubItems.Add('Passive');
            sopTooFast:
              li.SubItems.Add('Too Fast');
            sopDeploying:
              li.SubItems.Add('Deploying');
            sopDeployed:
              li.SubItems.Add('Deployed');
            sopStowing:
              li.SubItems.Add('Stowing');
            sopStowed:
              li.SubItems.Add('Stowed');
          end;
        end
        else
          li.SubItems.Add('EMCON');

        li.Caption := sensor.InstanceName;
        li.Data := sensor;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.UpdateStatusVehicle(sender: TT3Vehicle);
var
  li      : TListItem;
  //ve      : TT3Vehicle;
begin
  if not Assigned(sender) then
    Exit;

  lvSystemState.Items.Clear;

  //Overall Damage
  li := lvSystemState.Items.Add;
  li.Data := TT3PlatformInstance(sender);
  li.Caption := 'Overall Damage';
  li.SubItems.Add(IntToStr(sender.DamageOverall) + ' %');

  //Helm
  li := lvSystemState.Items.Add;
  li.Data := TT3PlatformInstance(sender);
  li.Caption := 'Helm';
  if sender.DamageHelm then
    li.SubItems.Add('Damage')
  else
    li.SubItems.Add('Operational');

  //Propultion
  li := lvSystemState.Items.Add;
  li.Data := TT3PlatformInstance(sender);
  li.Caption := 'Propulsion';
  if sender.DamagePropulsion then
    li.SubItems.Add('Damage')
  else
    li.SubItems.Add('Operational');

  //Speed
  li := lvSystemState.Items.Add;
  li.Data := TT3PlatformInstance(sender);
  li.Caption := 'Speed';
  li.SubItems.Add(IntToStr(sender.DamagePercentSpeed)  +' %');

  //Fuel Remaining
  li := lvSystemState.Items.Add;
  li.Data := TT3PlatformInstance(sender);
  li.Caption := 'Fuel Remaining';
  li.SubItems.Add(FloatToStr(Round(sender.FuelPercentage)) + ' %');

  //Fuel Leakage
  li := lvSystemState.Items.Add;
  li.Data := TT3PlatformInstance(sender);
  li.Caption := 'Fuel Leakage';
  if sender.FuelLeakage then
    li.SubItems.Add('Yes')
  else
    li.SubItems.Add('No');

  //Communication
//  li := lvSystemState.Items.Add;
//  li.Data := TT3PlatformInstance(sender);
//  li.Caption := 'Communications';
//  if sender.DamageComm then
//    li.SubItems.Add('Damage')
//  else
//    li.SubItems.Add('Operational');
end;

procedure TfrmToteDisplay.UpdateSystemState(sender: TObject; const dmgType: TDamageItemType);
var li: TListItem;
    ve : TT3Vehicle;
    u  : TT3Unit;
    i : integer;
    temp : TTreeNode;
begin
  if lvPlatforms.Selected = nil then exit;

  li := lvPlatforms.Selected;

  u := li.Data;
  if sender <> u then
    exit;

  if not (u is TT3Vehicle) then
    exit;

  ve := li.Data;

  // ---- overall damage ---
  li := lvSystemState_getRow(0, 'Overall Damage');
  li.Data         := TT3PlatformInstance(ve);
  li.SubItems[0]  := IntToStr( ve.DamageOverall) + ' %';

  // ---- helm ---
  li := lvSystemState_getRow(1, 'Helm');
  li.Data := TT3PlatformInstance(ve);
  if ve.DamageHelm then
    li.SubItems[0] := 'Damage'
  else
    li.SubItems[0] := 'Operational';

  // ---- Propulsion -------
  li := lvSystemState_getRow(2, 'Propulsion');
  li.Data := TT3PlatformInstance(ve);
  if ve.DamagePropulsion then
     li.SubItems.Add('Damage')
  else
    li.SubItems.Add('Operational');

  // ---- speed -------
  //  li := lvSystemState_getRow(, '');
  li := lvSystemState_getRow(3, 'Speed');
  li.Data := TT3PlatformInstance(ve);
  li.SubItems[0]:= IntToStr(ve.DamagePercentSpeed)  + ' %';

  // ---- Fuel Remaining -------
  li := lvSystemState_getRow(4 , 'Fuel Remaining');
  li.Data := TT3PlatformInstance(ve);
  li.SubItems[0] := IntToStr(Round(TT3PlatformInstance(ve).HealthPercent)) + ' %';

  // ---- Fuel Leakage -------
  li := lvSystemState_getRow(5 , 'Fuel Leakage');
  li.Data := TT3PlatformInstance(ve);
  if ve.FuelLeakage then
    li.SubItems[0] := 'Yes'
  else
    li.SubItems[0] := 'No';

  // ---- Comunication -------
  li := lvSystemState_getRow(6 , 'Communications');
  li.Data := TT3PlatformInstance(ve);

  if ve.DamageComm then
    li.SubItems[0]:= 'Damage'
  else
    li.SubItems[0] := 'Operational';

  // ---- Embarked Platforms -------
  tvEmbarkedPlatforms.Items.Clear;

  if Assigned(ve.EmbarkedVehicles) then
  begin
    for i := 0 to ve.EmbarkedVehicles.Count - 1 do
    begin
      with ve do
      begin
        temp := TTreeNode.Create(tvEmbarkedPlatforms.Items);
        temp.Text := (TT3EmbarkedVehicle(EmbarkedVehicles[i])
            .EmbarkedIdentifier);
        temp.StateIndex := 0;
        tvEmbarkedPlatforms.Items.InsertNode(temp, nil, temp.Text,
          TT3EmbarkedVehicle(EmbarkedVehicles[i]));
        temp := FindText(tvEmbarkedPlatforms,
          TT3EmbarkedVehicle(EmbarkedVehicles[i]).EmbarkedIdentifier);
        tvEmbarkedPlatforms.Items.AddChildFirst(temp,
          'Quantity : ' + IntToStr(TT3EmbarkedVehicle(EmbarkedVehicles[i]).Quantity));
        tvEmbarkedPlatforms.Items.AddChild(temp, 'Readying Time : ' + '2');
      end;
    end;
  end;

  //UpdateDevicesState(sender, dmgType);
end;

procedure TfrmToteDisplay.UpdateDevicesState(sender: TObject; const dmgtype: TDamageItemType);
var li: TListItem;
    ve : TT3Vehicle;
    u  : TT3Unit;
    I : Integer;
    tn, temp : TTreeNode;
    ecmstatus : string;
begin
  if lvPlatforms.Selected = nil then exit;

  li := lvPlatforms.Selected;
  u := li.Data;
  if sender <> u then
    exit;

  if not (u is TT3Vehicle) then
    exit;

  ve := u as TT3Vehicle;

  // sensors
  //lvSensors.Items.Clear;
  tvCountermeasures.Items.Clear;
  if Assigned(ve.Devices) then
  begin
    for i := 0 to ve.Devices.Count - 1 do
    begin
      with TT3Vehicle(ve) do
      begin
        if (TT3DeviceUnit(Devices[i]) is TT3Sensor) then
        begin
          //li := lvSensors.Items.Add;
          //li.Caption := TT3DeviceUnit(Devices[i]).InstanceName;
          li := findLVItem(lvSensors,TT3DeviceUnit(Devices[i]).InstanceName);

          if (TT3DeviceUnit(Devices[i]) is TT3Radar) then
          begin
            li.StateIndex := 1;
          end
          else if (TT3DeviceUnit(Devices[i]) is TT3Sonar) then
          begin
            li.StateIndex := 0;
          end
          else if (TT3DeviceUnit(Devices[i]) is TT3Visual) then
          begin
            li.StateIndex := 2;
          end
          else if (TT3DeviceUnit(Devices[i]) is TT3MADSensor) then
          begin
            li.StateIndex := 4;
          end
          else if (TT3DeviceUnit(Devices[i]) is TT3ESMSensor) then
          begin
            li.StateIndex := 3;
          end
          else if (TT3DeviceUnit(Devices[i]) is TT3EOSensor) then
          begin
            li.StateIndex := 4;
          end
          else if (TT3DeviceUnit(Devices[i]) is TT3IFFSensor) then
          begin
            li.StateIndex := 5;
          end
          else
          begin
            li.StateIndex := 0;
          end;

          case TT3Sensor(Devices[i]).OperationalStatus of
            sopOff, sopOffIFF:
              li.SubItems[0] := 'Off';
              //li.SubItems.Add('Off');
            sopOn:
              li.SubItems[0] := 'On';
              //li.SubItems.Add('On');
            sopDamage:
              li.SubItems[0] := 'Damaged';
              //li.SubItems.Add('Damaged');
            sopTooDeep:
              li.SubItems[0] := 'Too Deep';
              //li.SubItems.Add('Too Deep');
            sopEMCON:
              li.SubItems[0] := 'EMCON';
              //li.SubItems.Add('EMCON');
            sopActive:
              li.SubItems[0] := 'Active';
              //li.SubItems.Add('Active');
            sopPassive:
              li.SubItems[0] := 'Passive';
              //li.SubItems.Add('Passive');
            sopTooFast:
              li.SubItems[0] := 'Too Fast';
              //li.SubItems.Add('Too Fast');
            //------------------------------  //17042012 mk
            sopDeploying:
              li.SubItems[0] := 'Deploying';
              //li.SubItems.Add('Deploying');
            sopDeployed:
              li.SubItems[0] := 'Deployed';
              //li.SubItems.Add('Deployed');
            sopStowing:
              li.SubItems[0] := 'Stowing';
              //li.SubItems.Add('Stowing');
            sopStowed:
              li.SubItems[0] := 'Stowed';
              //li.SubItems.Add('Stowed');
            //------------------------------  //17042012 mk
          end;
          li.Data := TT3Sensor(TT3Sensor(Devices[I]));
        end
        //countermeasure
        else if (TT3DeviceUnit(Devices[i]) is TT3CounterMeasure) then
        begin
          tn := TTreeNode.Create(tvCountermeasures.Items);

          if (TT3CounterMeasure(Devices.Items[i]) is TT3ChaffOnVehicle) then
            tn.StateIndex := 1
          else if (TT3CounterMeasure(Devices.Items[i])
              is TT3AcousticDecoyOnVehicle) then
            tn.StateIndex := 2
          else
            tn.StateIndex := 0;

          case TT3CounterMeasure(Devices.Items[i]).Status of
            esAvailable:
              ecmStatus := 'Available';
            esUnavailable:
              ecmStatus := 'Unavailable';
            esLaunchingChaff:
              ecmStatus := 'Launching Chaff';
            esDamaged:
              ecmStatus := 'Damage';
            esOn:
              ecmStatus := 'On';
            esOff:
              ecmStatus := 'Off';
            esEMCON:
              ecmStatus := 'EMCON';
            esAutomatic:
              ecmStatus := 'Automatic';
            esManual:
              ecmStatus := 'Manual';
            esDeployed:
              ecmStatus := 'Deployed';
            esStowed:
              ecmStatus := 'Stowed';
          end;

          tn.Text := TT3CounterMeasure(Devices.Items[I]).InstanceName + ' : ' + ecmStatus;
          tn.Data := TT3CounterMeasure(Devices.Items[i]);

          tvCountermeasures.Items.AddObject(nil, tn.Text, tn.Data);
          temp := FindText(tvCountermeasures, tn.Text);

          tvCountermeasures.Items.AddChild(temp, ecmStatus);
        end;
      end;
    end;
  end;

  // weapons
  UpdateWeaponVehicle(ve);

  // coutermeasure
  {
    tvCountermeasures.Items.Clear;
    for I := 0 to ve.Devices.Count - 1 do
    begin
    if (ve.Devices[I] is TT3countermeasure) then
    begin
    tvCountermeasures.Items.AddChild(nil, TT3CounterMeasure(ve.Devices[I]).InstanceName + '-' + IntToStr(TT3CounterMeasure(ve.Devices[I]).Status))
    end;
    end;
    }

  // embark platform
  tvEmbarkedPlatforms.Items.Clear;
  if Assigned(ve.EmbarkedVehicles) then
  begin
    for i := 0 to ve.EmbarkedVehicles.Count - 1 do
    begin
      with ve do
      begin
        temp := TTreeNode.Create(tvEmbarkedPlatforms.Items);
        temp.Text := (TT3EmbarkedVehicle(EmbarkedVehicles[i])
            .EmbarkedIdentifier);
        temp.StateIndex := 0;
        tvEmbarkedPlatforms.Items.InsertNode(temp, nil, temp.Text,
          TT3EmbarkedVehicle(EmbarkedVehicles[i]));
        temp := FindText(tvEmbarkedPlatforms,
          TT3EmbarkedVehicle(EmbarkedVehicles[i]).EmbarkedIdentifier);
        tvEmbarkedPlatforms.Items.AddChildFirst(temp,
          'Quantity : ' + IntToStr
            (TT3EmbarkedVehicle(EmbarkedVehicles[i]).Quantity)
          );
        tvEmbarkedPlatforms.Items.AddChild(temp, 'Readying Time : ' + '2');
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.updateInfoTree(PropID: TPropsID; IntVal: integer;
  BoolVal : Boolean; DoubleVal: double; ByteVal: Byte);
begin
  case PropID of
    psChaffAttenuationOnRadar : ;
    psChaffRemovalEvent       : ;
    psSonobuoyRemovalEvent    : ;
    psBubbleRemovalEvent      : ;
    psTimeRemoveWreck         : changeWreckTimeRemoval(IntVal);
    psCoastlineCollision      : ;
    psAircraftTerrainColl     : ;
    psTidalStreamEffectToShip : ;
    psWindEffectToAircraft    : ;
    psSimplifySensorCheck     : ;
    psProbabilityOfKill       : ;
    psGuidanceCommand         : ;
    psStudentLaunchRestriction: ;
    psStudentCanLaunchAirCraft: ;
    psLandmassOcculting       : ;
    psSensorBlindZone         : ;
    psVisualVisibility        : ;
    psAutomaticSensorIdentity : ;
    psAirTrackLostContactTime : ;
    psESMTrackLostContactTime : ;
    psAirTrackDropTime        : ;
    psSurfaceTrackDropTime    : ;
    psSubsurfaceTrackDropTime : ;
    psESMTrackDropTime        : ;
    psAcousticTrackDropTime   : ;
    psSurfaceTrackLostContactTime   : ;
    psSubSurfaceTrackLostContatTime : ;
    psAcousticTrackLostContactTimer : ;
    psAutomaticRemovePlatformOutsideArea: ;
  end;
end;

procedure TfrmToteDisplay.UpdateVehicle(sender: TT3Vehicle);
begin
  if not Assigned(sender) then
    Exit;

  // --  clear embarked timer event first
  if tvEmbarkedPlatforms.Items.count > 0 then
    unAssignedAllEmbarkedTimerEvent(tvEmbarkedPlatforms.items.Item[0]);

  UpdateSensorVehicle(sender);
  UpdateWeaponVehicle(sender);
  //  setUpTreeWeapons(sender.Weapons);
  UpdateCountermeasureVehicle(sender);
  UpdateStatusVehicle(sender);
  UpdateEmbarkVehicle(sender);

  {Prince titipan}
  UpdateTransportToteDisplay(sender);
  UpdateLogisticToteDisplay(sender);
end;

procedure TfrmToteDisplay.UpdateWeaponVehicle(sender : TT3Vehicle);
const
  TORPEDO = 0;
  MISSILE = 1;
  MINE = 2;
  GUN = 3;
  BOMB = 4;
var
  tnParent: TTreeNode;
  i, j: Integer;
  WeaponText,
  LauncherText, status : String;
  weapon : TT3Weapon;

  WeaponLauncher : TFitted_Weap_Launcher_On_Board;
  launcherNumber : integer;
  //QuantityTote : integer;
begin
  if not Assigned(sender) then
    Exit;

  tvWeapons.Items.Clear;

  if Assigned(sender.Weapons) then
  begin
    for i := 0 to sender.Weapons.Count - 1 do
    begin
      weapon := TT3Weapon(sender.Weapons.Items[i]);
      if not(Assigned(weapon)) then Continue;

      case weapon.WeaponStatus of
        wsAvailable   : status := 'Available';
        wsUnavailable : status := 'Unavailable';
        wsDamaged     : status := 'Damage';
        wsTooHigh     : status := 'Too High';
      end;

      // GUN
      if weapon is TT3GunOnVehicle then
      begin
        WeaponText := TT3GunOnVehicle(weapon).InstanceName + ' : ' + status;
        tnParent := tvWeapons.Items.AddObject(nil, WeaponText, TT3GunOnVehicle(weapon));
        //tnParent := tvWeapons.Items.AddObject(tnParent, WeaponText, TT3GunOnVehicle(weapon));

        tvWeapons.Items.AddChildObject(tnParent, IntToStr(TT3GunOnVehicle(weapon).Quantity), TT3GunOnVehicle(weapon));
      end
      // MISSILE
      else if weapon is TT3MissilesOnVehicle then
      begin
        WeaponText := TT3MissilesOnVehicle(weapon).InstanceName + ' : ' + status + ' : ' + IntToStr(TT3MissilesOnVehicle(weapon).Quantity);
        tnParent := tvWeapons.Items.AddObject(nil, WeaponText, TT3MissilesOnVehicle(weapon));
        //tnParent := tvWeapons.Items.AddObject(tnParent, WeaponText, TT3MissilesOnVehicle(weapon));

        if Assigned(TT3MissilesOnVehicle(weapon).MissileDefinition) then
        begin
          for j := 0 to TT3MissilesOnVehicle(weapon).MissileDefinition.FLaunchs.Count - 1 do
          begin
            WeaponLauncher := TFitted_Weap_Launcher_On_Board(TT3MissilesOnVehicle(weapon).MissileDefinition.FLaunchs.Items[j]);
            if not(Assigned(WeaponLauncher)) then Continue;

            if WeaponLauncher.FData.Launcher_Type > 8 then
              launcherNumber :=  WeaponLauncher.FData.Launcher_Type - 8
            else
              launcherNumber := WeaponLauncher.FData.Launcher_Type;

            LauncherText := 'Launcher ' + IntToStr(launcherNumber) + ' : ' + IntToStr(WeaponLauncher.FData.Launcher_Qty);

            tvWeapons.Items.AddChildObject(tnParent, LauncherText, WeaponLauncher);
          end;
        end;
      end
      // TORPEDO
      else if weapon is TT3TorpedoesOnVehicle then
      begin
        WeaponText := TT3TorpedoesOnVehicle(weapon).InstanceName + ' : ' + status + ' : ' + IntToStr(TT3TorpedoesOnVehicle(weapon).Quantity);
        tnParent := tvWeapons.Items.AddObject(nil, WeaponText, TT3TorpedoesOnVehicle(weapon));

        if Assigned(TT3TorpedoesOnVehicle(weapon).TorpedoDefinition) then
        begin
          for j := 0 to TT3TorpedoesOnVehicle(weapon).TorpedoDefinition.FLaunchs.Count - 1 do
          begin
            WeaponLauncher := TFitted_Weap_Launcher_On_Board(TT3TorpedoesOnVehicle(weapon).TorpedoDefinition.FLaunchs.Items[j]);
            if not(Assigned(WeaponLauncher)) then Continue;

            if WeaponLauncher.FData.Launcher_Type > 8 then
              launcherNumber :=  WeaponLauncher.FData.Launcher_Type - 8
            else
              launcherNumber := WeaponLauncher.FData.Launcher_Type;

            LauncherText := 'Tube ' + IntToStr(launcherNumber) + ' : ' + IntToStr(WeaponLauncher.FData.Launcher_Qty);

            tvWeapons.Items.AddChildObject(tnParent, LauncherText, WeaponLauncher);
          end;
        end;
      end
      // BOMB
      else if weapon is TT3BombONVehicle then
      begin
        WeaponText := TT3BombONVehicle(weapon).InstanceName + ' : ' + status;
        tnParent := tvWeapons.Items.AddObject(nil, WeaponText, TT3BombONVehicle(weapon));
        //tnParent := tvWeapons.Items.AddObject(tnParent, WeaponText, TT3BombONVehicle(weapon));
        tvWeapons.Items.AddChildObject(tnParent, IntToStr(TT3BombONVehicle(weapon).Quantity), TT3BombONVehicle(weapon));
      end
      // MINE
      else if weapon is TT3MineOnVehicle then
      begin
        WeaponText := TT3MineOnVehicle(weapon).InstanceName + ' : ' + status;
        tnParent := tvWeapons.Items.AddObject(nil, WeaponText, TT3MineOnVehicle(weapon));
        //tnParent := tvWeapons.Items.AddObject(tnParent, WeaponText, TT3MineOnVehicle(weapon));
        tvWeapons.Items.AddChildObject(tnParent, IntToStr(TT3MineOnVehicle(weapon).Quantity), TT3MineOnVehicle(weapon));
      end
      //Hybrid Missile
      else if weapon is TT3HybridOnVehicle then
      begin
        WeaponText := TT3HybridOnVehicle(weapon).InstanceName + ' : ' + status;
        tnParent := tvWeapons.Items.AddObject(nil, WeaponText, TT3HybridOnVehicle(weapon));
        
        tvWeapons.Items.AddChildObject(tnParent, IntToStr(TT3HybridOnVehicle(weapon).Quantity), TT3HybridOnVehicle(weapon));
      end;
    end;
  end;

  tvWeapons.FullExpand;
  if tvWeapons.Items.Count > 0 then
    tvWeapons.Select(tvWeapons.Items[0]);
end;

procedure TfrmToteDisplay.WriteEventSummary;
var
  li : TListItem;
  i : Integer;
  berita : TEventSummary;
  forceColor : string;
begin
  lvEventSummary.Clear;
  for i := 0 to simMgrClient.SimEventSummary.Count - 1 do
  begin
    berita := TEventSummary(simMgrClient.SimEventSummary.Items[i]);
    case berita.force of
          1:
            begin
              lvEventSummary.Canvas.Brush.Color := clRed;
              forceColor := 'Red';
            end;
          2:
            begin
              lvEventSummary.Canvas.Brush.Color := clYellow;
              forceColor := 'Yellow';
            end;
          3:
            begin
              lvEventSummary.Canvas.Brush.Color := clBlue;
              forceColor := 'Blue';
            end;
          4:
            begin
              lvEventSummary.Canvas.Brush.Color := clGreen;
              forceColor := 'Green';
            end;
          5:
            begin
              lvEventSummary.Canvas.Brush.Color := clWhite;
              forceColor := 'No Force';
            end;
          6:
            begin
              lvEventSummary.Canvas.Brush.Color := clBlack;
              forceColor := 'Black';
            end;
        else
          lvEventSummary.Canvas.Brush.Color := clBlack;
          forceColor := 'Black'; //mk
        end;

    li := lvEventSummary.Items.Add;
    li.Caption := forceColor;
    li.SubItems.Add(FormatDateTime('hh:nn:ss', berita.Time) + ' / ' + FormatDateTime('dd mmm yyyy', berita.Time));
    li.SubItems.Add(berita.VehicleIdentifier);
    li.SubItems.Add(berita.Action);
    li.StateIndex := berita.Force;
    li.Data := berita;

  end;
end;

procedure TfrmToteDisplay.UpdateEmbarkVehicle(sender : TT3Vehicle);
var
  ve : TT3Vehicle;
  temp, tn : TTreeNode;
  I{, j} : Integer;
  stats : string;
  {countstr,} str : string;
//  queueEmb : TQueuedEmbarkedLaunch;
begin
  if not(Assigned(sender)) then
    Exit;

  if not(sender is TT3Vehicle) then
    Exit;

  ve := TT3Vehicle(sender);

  tvEmbarkedPlatforms.Items.Clear;

  if Assigned(ve.EmbarkedVehicles) then
  begin
    for i := 0 to ve.EmbarkedVehicles.Count - 1 do
    begin
      with ve do
      begin
        temp := TTreeNode.Create(tvEmbarkedPlatforms.Items);
        temp.Data := EmbarkedVehicles[i];
        temp.Text := (TT3EmbarkedVehicle(EmbarkedVehicles[i])
            .EmbarkedIdentifier);
        temp.StateIndex := 0;
        TT3EmbarkedVehicle(EmbarkedVehicles[i]).OnEmbarkedTimer := onEmbarkedTimer;
        TT3EmbarkedVehicle(EmbarkedVehicles[i]).OnUpdateState   := onEmbarkedUpdateState;
        TT3EmbarkedVehicle(EmbarkedVehicles[i]).OnEmbarkedReadyTimer := onEmbarkedToReadyingTime;

        tvEmbarkedPlatforms.Items.InsertNode(temp, nil, temp.Text,
          TT3EmbarkedVehicle(EmbarkedVehicles[i]));
        temp := FindText(tvEmbarkedPlatforms,
          TT3EmbarkedVehicle(EmbarkedVehicles[i]).EmbarkedIdentifier);

        if HealthPercent < 30 then
          stats := 'Damaged'
        else
          stats := 'Available';

        tn := tvEmbarkedPlatforms.Items.AddChildFirst(temp,
              stats + ' : ' + IntToStr
              (TT3EmbarkedVehicle(EmbarkedVehicles[i]).Quantity));
        tn.StateIndex:= 1;

//        if TT3EmbarkedVehicle(EmbarkedVehicles[i]).getQueueLandCount <= 0 then
          str := 'Readying : '+ SecondToTimeString(Round(0));
//        else
//        begin
//          for j := 0 to TT3EmbarkedVehicle(EmbarkedVehicles[i]).getQueueLandCount - 1 do begin
//            queueEmb := TT3EmbarkedVehicle(EmbarkedVehicles[i]).getQueueLandItem(j);

//            countstr := countstr + '[' + SecondToTimeString(Round(queueEmb.ReadyingTime)) + ']';

//            if j <> TT3EmbarkedVehicle(EmbarkedVehicles[i]).getQueueLandCount - 1 then
//              countstr := countstr + ',';
//          end;

//          str := 'Readying : '+ countstr;
//        end;

        tn := tvEmbarkedPlatforms.Items.AddChild(temp, str);
        tn.StateIndex := 2;

        tn := tvEmbarkedPlatforms.Items.AddChild(temp,
              'Launch Alert : '+ IntToStr
              (TT3EmbarkedVehicle(EmbarkedVehicles[i]).LaunchAlert));
        tn.StateIndex := 3;
      end;
    end;
  end;

  tvEmbarkedPlatforms.FullExpand;
end;

procedure TfrmToteDisplay.OnStatusDLComboBoxChange(Sender : TObject);
var
  item : TT3DLParticipatingUnitItem;
  cmbStatus : TStCombobox;
  rec : TRecCmd_DataLink;
begin
  if Sender is TStCombobox then
  begin
    cmbStatus := Sender as TStCombobox;
    item := cmbstatus.ListItem.Data;

    if ContainsStr(edtDatalink.Text, '1') then
      rec.DataLinkID := 1
    else if ContainsStr(edtDatalink.Text, '2') then
      rec.DataLinkID := 2
    else if ContainsStr(edtDatalink.Text, '3') then
      rec.DataLinkID := 3;

    rec.platformID := item.PUPlatform.InstanceIndex;
    rec.OrderDL   := odlPUStatus;
    rec.PUStatus  := cmbStatus.ItemIndex;

    simMgrClient.netSend_Cmd_DataLink(rec);
  end;
end;

procedure TfrmToteDisplay.SetDataLink(subject : TT3DataLink);
var
  forceColor : string;
  I: Integer;
  li : TListItem;
  itemPU : TT3DLParticipatingUnitItem;
  itemEU : TT3DLEligibleUnitItem;
  strPU : string;
  custCbox : TStCombobox;
  Rect : TRect;
begin
  edtDatalink.Text := subject.InstanceName;

  //set Force
  case subject.GroupForce of
    1:
      begin
        forceColor := 'Force Red';
      end;
    2:
      begin
        forceColor := 'Force Yellow';
      end;
    3:
      begin
        forceColor := 'Force Blue';
      end;
    4:
      begin
        forceColor := 'Force Green';
      end;
    5:
      begin
        forceColor := 'No Force';
      end;
    6:
      begin
        forceColor := 'Force Black';
      end;
  end;

  edtDLForce.Text := forceColor;

  //set Band
  case subject.BandType of
    1 : edtDLBand.Text := 'HF';
    2 : edtDLBand.Text := 'UHF/VHF';
    else
      edtDLBand.Text := '';
  end;

  //set LV Eligible
  lvEligibleUnits.Items.Clear;
  if (Assigned(subject.EligibleUnits)) and (subject.EligibleUnits.Count > 0) then
  begin
     for I := 0 to subject.EligibleUnits.Count - 1 do
     begin
        itemEU := subject.EligibleUnits[I];
        li := lvEligibleUnits.Items.Add;
        li.Caption := itemEU.EUPlatform.InstanceName;

        case itemEU.EUStatus of
          eusDamage           : li.StateIndex := EU_DAMAGE;
          eusBandIncompatible : li.StateIndex := EU_DIFFBAND;
          eusEligible         : li.StateIndex := NON_DATALINK;
        end;

        li.Data := itemEU ;
     end;
  end;

  //set LV Participant
  for I := lvParticipatingUnits.ControlCount - 1 downto 0  do
    if lvParticipatingUnits.Controls[i] is TStCombobox then
      lvParticipatingUnits.Controls[i].Free;

  lvParticipatingUnits.Items.Clear;

  if (Assigned(subject.ParticipatingUnits)) and (subject.ParticipatingUnits.Count > 0) then
  begin
     for I := 0 to subject.ParticipatingUnits.Count - 1 do
     begin
        itemPU := subject.ParticipatingUnits[I];
        li := lvParticipatingUnits.Items.Add;

        strPU := IntToStr(itemPU.PUNumber);
        if Length(strPU) < 2 then
          strPU := '0' + strPU;

        li.Caption := strPU;
        li.SubItems.Add(itemPU.PUPlatform.InstanceName);

        case itemPU.PUStatus of
          pusTransmitReceive: li.SubItems.Add('Transmit/Receive');
          pusOff            : li.SubItems.Add('Off');
          pusReceive        : li.SubItems.Add('Receive');
        end;

        { create custom combobox }
        custCbox          := TStCombobox.Create(Self);
        custCbox.Style    := csDropDownList;
        custCbox.Visible  := True;
        custCbox.ListItem := li;
        custCbox.Parent   := lvParticipatingUnits;
        custCbox.OnChange := OnStatusDLComboBoxChange;

        Rect              := li.DisplayRect(drBounds);
        Rect.Left         := Rect.Right - lvParticipatingUnits.Columns[2].Width;
        custCbox.BoundsRect := Rect;

        custCbox.Items.Add('Transmit/Receive');
        custCbox.Items.Add('Receive');
        custCbox.Items.Add('Off');
        { end create custom combobox }

        case itemPU.PUStatus of
          pusTransmitReceive: custCbox.ItemIndex := 0;
          pusReceive        : custCbox.ItemIndex := 1;
          pusOff            : custCbox.ItemIndex := 2;
        end;

        if itemPU.PUNetCenter then
        begin
          li.StateIndex := DATALINK;
        end
        else
        begin
          li.StateIndex := NON_DATALINK;
        end;

        li.Data := itemPU;
     end;
  end;

  //set Play/Stop
  if subject.Played then
  begin
    btnPlayDataLink.Enabled := false;
    btnStopDataLink.Enabled := true;
  end
  else
  begin
    btnPlayDataLink.Enabled := true;
    btnStopDataLink.Enabled := false;
  end;
end;

procedure TfrmToteDisplay.SetDataLinkView;
var
  I: Integer;
  li : TListItem;
  item : TT3DLParticipatingUnitItem;
  subject: TT3DataLink;
  strPU : string;
begin
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
    exit;

  if not Assigned(simMgrClient.ControlledPlatform) then
  begin
    lbDSStatusValue.Caption := '---';
    lbDSBandValue.Caption   := '---';
    lvDS2.Clear;

    Exit;
  end;

  subject := simMgrClient.DataLinkManager.getDatalinkOnPU(simMgrClient.ControlledPlatform);
  if not Assigned(subject) then begin
    lbDSStatusValue.Caption := '---';
    lbDSBandValue.Caption   := '---';
    lvDS2.Clear;
  end else begin
    if subject.Played then
      lbDSStatusValue.Caption := 'Active'
    else
      lbDSStatusValue.Caption := 'Inactive';

    //set Band
    case subject.BandType of
      1 : lbDSBandValue.Caption := 'HF';
      2 : lbDSBandValue.Caption := 'UHF/VHF';
    end;

    //set LV Participant
    lvDS2.Items.Clear;
    if (Assigned(subject.ParticipatingUnits)) and (subject.ParticipatingUnits.Count > 0) then
    begin
       for I := 0 to subject.ParticipatingUnits.Count - 1 do
       begin
          item := subject.ParticipatingUnits[I];

          strPU := IntToStr(item.PUNumber);
          if Length(strPU) < 2 then
            strPU := '0' + strPU;

          li := lvDS2.Items.Add;
          li.Caption := strPU;
          li.SubItems.Add(item.PUPlatform.InstanceName);

          case item.PUStatus of
            pusTransmitReceive: li.SubItems.Add('Transmit/Receive');
            pusOff            : li.SubItems.Add('Off');
            pusReceive        : li.SubItems.Add('Receive');
          end;

          if item.PUNetCenter then
            li.StateIndex := DATALINK
          else
            li.StateIndex := NON_DATALINK;

          li.Data := item.PUPlatform ;
       end;
    end;
  end;
end;

//====================================
// listener untuk asset platform
//====================================
procedure TfrmToteDisplay.AddAssetListener(aPF : TT3PlatformInstance);
var
  i : integer;
  wpn : TT3Weapon;
  //dev : TT3DeviceUnit;
  listener : TEventListener;
begin
  if Assigned(aPF) and (aPF is TT3Vehicle) then begin

    for I := 0 to TT3Vehicle(aPf).Weapons.Count - 1 do begin
      listener := nil;
      wpn := TT3Vehicle(aPf).Weapons.Items[i];

      // listener untuk TT3GunOnVehicle
      if wpn is TT3GunOnVehicle then
        listener := TT3GunOnVehicleListener.Create;

      // listener untuk TT3MissilesOnVehicle
      if wpn is TT3MissilesOnVehicle then begin
        listener := TT3MissileOnVehicleListener.Create;
        TT3MissileOnVehicleListener(listener).OnPropertyLauncherChange := OnPropertyMissLauncher;
      end;

      // listener untuk TT3TorpedoesOnVehicle
      if wpn is TT3TorpedoesOnVehicle then
      begin
        listener := TT3TorpedoOnVehicleListener.Create;
        TT3TorpedoOnVehicleListener(listener).OnPropertyLauncherChange := OnPropertyTorpLauncher;
      end;

      // listener untuk TT3BombOnVehicle
      if wpn is TT3BombOnVehicle then
         listener := TT3BombOnVehicleListener.Create;

      // listener untuk TT3MineOnVehicle
      if wpn is TT3MineOnVehicle then
        listener := TT3MineOnVehicleListener.Create;

      if wpn is TT3HybridOnVehicle then
        listener := TT3HybridOnVehicleListener.Create;

      if Assigned(listener) then begin
        TPropertyEventListener(listener).OnPropertyIntChange := OnPropertyIntChange;
        TPropertyEventListener(listener).OnPropertyDblChange := OnPropertyDblChange;
        TPropertyEventListener(listener).OnPropertyBoolChange := OnPropertyBoolChange;
        TPropertyEventListener(listener).OnPropertyByteChange := OnPropertyByteChange;

        wpn.addListener(listener);
        listener.ListenerID := 'TOTELISTENER';
//        FAssetListenerList.Add(listener);
      end;
    end;

  end;

end;

//====================================
// hapus listener asset platform
//====================================
procedure TfrmToteDisplay.RemoveAssetListener(aPF : TT3PlatformInstance);
var
  i : integer;
  //  listener : TObject;
  wpn : TT3Weapon;
begin
  if not Assigned(aPF) then
    Exit;

  if aPF is TT3Vehicle then
  begin
    for I := 0 to TT3Vehicle(aPF).Weapons.Count - 1 do
    begin
      wpn := TT3Vehicle(aPf).Weapons.Items[i];

      if Assigned(wpn) then
        wpn.removeListener('TOTELISTENER');
    end;
  end;

//  for i := FAssetListenerList.Count - 1 downto 0 do begin
//    listener := FAssetListenerList.Items[i];
//    FreeAndNil(listener);
//    FAssetListenerList.Delete(i);
//  end;
//  FAssetListenerList.Clear;
end;

procedure TfrmToteDisplay.OnPropertyIntChange(Sender : TObject;Props : TPropsID; Value : Integer);
var
  tn : TTreeNode;
  name : string;
begin
  //======= ini untuk mengupdate item tree view weapons ===============
  if (Sender is TT3Weapon) and (Assigned(TT3Weapon(Sender).Parent)) and
    TT3PlatformInstance(TT3Weapon(Sender).Parent).Equals(ToteSelectedPlatform) then
  begin
    tn := GetNodeByData(tvWeapons,Sender);

    if Assigned(tn) then
    begin
      case Props of
        psQuantity    :
        begin
          // Jika quantity di TT3MissilesOnVehicle berubah
          if Sender is TT3MissilesOnVehicle then
          begin
            name := TT3Weapon(Sender).InstanceName;
            case TT3Weapon(Sender).WeaponStatus of
              wsAvailable   : name := name + ' : Available';
              wsUnavailable : name := name + ' : Unavailable';
              wsDamaged     : name := name + ' : Damaged';
              wsFiring      : name := name + ' : Firing';
            end;

            name := name + ' : ' + IntToStr(Value);
            tn.Text:=  name;
          end;

          // Jika quantity di TT3GunOnVehicle/TT3BombONVehicle berubah
          if (Sender is TT3GunOnVehicle) or (Sender is TT3BombONVehicle) or
             (Sender is TT3MineONVehicle) then
          begin
            tn.getFirstChild.Text := IntToStr(Value);
          end;

          // Jika quantity di TT3TorpedoesOnVehicle berubah
          if Sender is TT3TorpedoesOnVehicle then
          begin
            name := TT3Weapon(Sender).InstanceName;
            case TT3Weapon(Sender).WeaponStatus of
              wsAvailable   : name := name + ' : Available';
              wsUnavailable : name := name + ' : Unavailable';
              wsDamaged     : name := name + ' : Damaged';
              wsFiring      : name := name + ' : Firing';
            end;

            name := name + ' : ' + IntToStr(Value);
            tn.Text:=  name;

            while tn.Count > Value do
            begin
              tn.GetLastChild.Delete;
            end;
          end;

          // Jika quantity di TT3HybridOnVehicle berubah
          if Sender is TT3HybridOnVehicle then
          begin
            name := TT3Weapon(Sender).InstanceName;
            case TT3Weapon(Sender).WeaponStatus of
              wsAvailable   : name := name + ' : Available';
              wsUnavailable : name := name + ' : Unavailable';
              wsDamaged     : name := name + ' : Damaged';
              wsFiring      : name := name + ' : Firing';
            end;

  //              name := name + ' : ' + IntToStr(Value);
            tn.Text:=  name;
            tn.getFirstChild.Text := IntToStr(Value);
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.OnPropertyMissLauncher(Sender, Launcher: TObject; Value: integer);
var
  tn    : TTreeNode;
  name  : string;
  Node  : TTreeNode;
  launcherNumber : integer;
  MissileLauncher : TFitted_Weap_Launcher_On_Board;
begin
  //======= ini untuk mengupdate item tree view weapons, khusus Launcher Missile ==========

  if (Sender is TT3Weapon) and (Assigned(TT3Weapon(Sender).Parent)) and
    TT3PlatformInstance(TT3Weapon(Sender).Parent).Equals(ToteSelectedPlatform) then
  begin
    tn := GetNodeByData(tvWeapons,Sender);

    if Assigned(tn) then
    begin
      Node := tn.getFirstChild;
      MissileLauncher := TFitted_Weap_Launcher_On_Board(Launcher);

      while Node <> nil do
      begin
        if Node.Data = Launcher then
        begin
          if  MissileLauncher.FData.Launcher_Type > 8 then
            launcherNumber :=  MissileLauncher.FData.Launcher_Type - 8
          else
            launcherNumber := MissileLauncher.FData.Launcher_Type;

          name := 'Launcher ' + IntToStr(launcherNumber) + ' : ' + IntToStr(Value);
          Node.Text := name;

          Break;
        end;

        Node := Node.GetNext;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.OnPropertyTorpLauncher(Sender, Launcher: TObject; Value: integer);
var
  tn    : TTreeNode;
  name  : string;
  Node  : TTreeNode;
  launcherNumber : integer;
  TorpedoLauncher : TFitted_Weap_Launcher_On_Board;
begin
  //======= ini untuk mengupdate item tree view weapons, khusus Launcher Torpedo ==========

  if (Sender is TT3Weapon) and (Assigned(TT3Weapon(Sender).Parent)) and
    TT3PlatformInstance(TT3Weapon(Sender).Parent).Equals(ToteSelectedPlatform) then
  begin
    tn := GetNodeByData(tvWeapons,Sender);

    if Assigned(tn) then
    begin
      Node := tn.getFirstChild;
      TorpedoLauncher := TFitted_Weap_Launcher_On_Board(Launcher);

      while Node <> nil do
      begin
        if Node.Data = Launcher then
        begin
          if  TorpedoLauncher.FData.Launcher_Type > 8 then
            launcherNumber :=  TorpedoLauncher.FData.Launcher_Type - 8
          else
            launcherNumber := TorpedoLauncher.FData.Launcher_Type;

          name := 'Tube ' + IntToStr(launcherNumber) + ' : ' + IntToStr(Value);
          Node.Text := name;

          Break;
        end;

        Node := Node.GetNext;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.OnPropertyDblChange(Sender : TObject;Props : TPropsID; Value : Double);
begin

end;

procedure TfrmToteDisplay.OnPropertyBoolChange(Sender : TObject;Props : TPropsID; Value : Boolean);
begin

end;

procedure TfrmToteDisplay.OnPropertyByteChange(Sender : TObject;Props : TPropsID; Value : Byte);
var
  li  : TListItem;
  tn,node  : TTreeNode;
  name, ecmStatus : string;
begin
  //======= ini untuk mengupdate item tree view weapons ===============
  if (Sender is TT3Weapon) and (Assigned(TT3Weapon(Sender).Parent)) and
    TT3PlatformInstance(TT3Weapon(Sender).Parent).Equals(ToteSelectedPlatform) then
  begin
    tn := GetNodeByData(tvWeapons,Sender);

    if Assigned(tn) then
    begin
      case Props of
        psWeaponStatus :
        begin
          name := TT3Weapon(Sender).InstanceName;
          case TWeaponStatus(Value) of
            wsAvailable   : name := name + ' : Available';
            wsUnavailable : name := name + ' : Unavailable';
            wsDamaged     : name := name + ' : Damaged';
            wsFiring      : name := name + ' : Firing';
          end;

          if (Sender is TT3MissilesOnVehicle) or (Sender is TT3TorpedoesOnVehicle) then
            name := name + ' : ' + IntToStr(Value);

          tn.Text := name;
        end;
      end;
    end;
  end;
  //======= ini untuk mengupdate item list view sensor ===============
  if (Sender is TT3Sensor) and (Assigned(TT3Sensor(Sender).Parent)) and
    TT3PlatformInstance(TT3Sensor(Sender).Parent).Equals(ToteSelectedPlatform) then
  begin
    li := findLVItem(lvSensors,TT3Sensor(Sender).InstanceName);
    case TSensorOperationalStatus(Value) of
      sopOff, sopOffIFF      : li.SubItems[0] := 'Off';
      sopOn                  : li.SubItems[0] := 'On';
      sopDamage              : li.SubItems[0] := 'Damaged';
      sopTooDeep             : li.SubItems[0] := 'Too Deep';
      sopEMCON               : li.SubItems[0] := 'EMCON';
      sopActive              : li.SubItems[0] := 'Active';
      sopPassive             : li.SubItems[0] := 'Passive';
      sopTooFast             : li.SubItems[0] := 'Too Fast';
      sopDeploying           : li.SubItems[0] := 'Deploying';
      sopDeployed            : li.SubItems[0] := 'Deployed';
      sopStowing             : li.SubItems[0] := 'Stowing';
      sopStowed              : li.SubItems[0] := 'Stowed';
    end;
  end;

  //======= ini untuk mengupdate item tree view ecm ===============
  if (Sender is TT3CounterMeasure) and (Assigned(TT3CounterMeasure(Sender).Parent)) and
    TT3PlatformInstance(TT3CounterMeasure(Sender).Parent).Equals(ToteSelectedPlatform) then
  begin
    tn := GetNodeByData(tvCountermeasures,Sender);

    if Assigned(tn) then
    begin
      case Props of
        psCMStatus :
        begin
          name := TT3CounterMeasure(Sender).InstanceName;
          case TECMStatus(Value) of
            esAvailable     : ecmStatus := 'Available';
            esUnavailable   : ecmStatus := 'Unavailable';
            esLaunchingChaff: ecmStatus := 'Launching Chaff';
            esDamaged       : ecmStatus := 'Damage';
            esOn            : ecmStatus := 'On';
            esOff           : ecmStatus := 'Off';
            esEMCON         : ecmStatus := 'EMCON';
            esAutomatic     : ecmStatus := 'Automatic';
            esManual        : ecmStatus := 'Manual';
            esDeployed      : ecmStatus := 'Deployed';
            esStowed        : ecmStatus := 'Stowed';
          end;

          tn.Text := name + ' : ' + ecmStatus;

          node := tn.getFirstChild;
          if Assigned(node) then
            node.Text := ecmStatus;
        end;
      end;
    end;
  end;
end;
//==========================

{$REGION ' Logistic Method '}

procedure TfrmToteDisplay.btnShipTransferClick(Sender: TObject);
var
  _flag : Integer;
  _OwnShip, _DestinationShip : TT3PlatformInstance;
  recLogistic : TRecCmd_Change_Logistic;

begin
  {$REGION ' Pengecekan kapal yang mentransfer '}
  _OwnShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSelectedID));

  if _OwnShip = nil then
  begin
//    lvShipDestinationTransfer.Items.Clear;

    MessageDlg('Please re-select The transfer platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang menerima '}
  _DestinationShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSuppliedID));

  if _DestinationShip = nil then
  begin
    MessageDlg('Please re-select destination platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  if cekTransfer(_flag, 0) then
  begin
    recLogistic.PlatfomID     := _OwnShip.InstanceIndex;
    recLogistic.DestinationID := _DestinationShip.InstanceIndex;
    recLogistic.StateID       := 0;

//    recLogistic.vFuel         := StrToFloat(edtFuelTransferExsport.Text);
//    recLogistic.vLubricants   := StrToFloat(edtLubricantTransferExport.Text);
//    recLogistic.vFreshWater   := StrToFloat(edtFreshWaterTransferExport.Text);
//    recLogistic.vWater        := StrToFloat(edtWaterTransferExport.Text);
//    recLogistic.vFood         := StrToFloat(edtFoodTransferExport.Text);

    simMgrClient.netSend_Cmd_Change_Logistic(recLogistic);

    MessageDlg('Transfer Proses...', mtInformation, [mbOK], 0);

//    btnShipTransferLogistic.Enabled := False;
  end
  else
  begin
    case _flag of
      1 : MessageDlg('Incorrect data input', mtInformation, [mbOK], 0);
      2 : MessageDlg('Deficient Logistics', mtInformation, [mbOK], 0);
      3 : MessageDlg('Transfers Overload', mtInformation, [mbOK], 0);
      4 : MessageDlg('Fuel Unlimited, Don''t have ability to be transferred...', mtInformation, [mbOK], 0);
      5 : MessageDlg('Fuel Unlimited, Don''t have ability to transfer...', mtInformation, [mbOK], 0);
      6 : MessageDlg('Can''t tranfer, Platform is in transfering process', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmToteDisplay.btnBaseTransferClick(Sender: TObject);
var
  flag, i : Integer;
  recLogistic : TRecCmd_Change_Logistic;
  _OwnShip : TT3PlatformInstance;
begin

  {$REGION ' Pengecekan kapal yang menerima '}
  _OwnShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSelectedID));

  if _OwnShip = nil then
  begin
    MessageDlg('Please re-select destination platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  if cekTransfer(flag, 1) then
  begin
    recLogistic.PlatfomID     := LogisticBaseID;
    recLogistic.DestinationID := _OwnShip.InstanceIndex;
    recLogistic.StateID       := 1;

//    recLogistic.vFuel         := StrToFloat(edtFuelTransferImport.Text);
//    recLogistic.vLubricants   := StrToFloat(edtLubricantTransferImport.Text);
//    recLogistic.vFreshWater   := StrToFloat(edtFreshWaterTransferImport.Text);
//    recLogistic.vWater        := StrToFloat(edtWaterTransferImport.Text);
//    recLogistic.vFood         := StrToFloat(edtFoodTransferImport.Text);

    simMgrClient.netSend_Cmd_Change_Logistic(recLogistic);

    MessageDlg('Transfer Proses...', mtInformation, [mbOK], 0);

//    btnBaseTransfer.Enabled := False;
  end
  else
  begin
    case flag of
      1 : MessageDlg('Incorrect data input', mtInformation, [mbOK], 0);
      2 : MessageDlg('Deficient Logistics', mtInformation, [mbOK], 0);
      3 : MessageDlg('Transfers Overload', mtInformation, [mbOK], 0);
      4 : MessageDlg('Fuel Unlimited, Don''t have ability to transfer...', mtInformation, [mbOK], 0);
      5 : MessageDlg('Fuel Unlimited, Don''t have ability to be transferred...', mtInformation, [mbOK], 0);
      6 : MessageDlg('Can''t tranfer, Platform is in transfering process', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmToteDisplay.lvPlatformLogisticSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  LogisticSelectedID := 0;
  LogisticSelectedPlatform := nil;

  ResetLogisticPanel(False);

  if Selected then
  begin
    if (Item = nil) or (item.Data = nil) then
    begin
      MessageDlg('Platform data is nil, please select other platfrom', mtInformation, [mbOK], 0);
      Exit;
    end;

    LogisticSelectedPlatform := Item.Data;
    LogisticSelectedID := LogisticSelectedPlatform.InstanceIndex;

    {Refresh logistic panel}
    UpdateLogisticToteDisplay(TT3Vehicle(LogisticSelectedPlatform));
  end;
end;

procedure TfrmToteDisplay.lvShipDestinationTransferSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  suppliedShipTemp : TT3PlatformInstance;
begin
  btnTransferPlatform.Visible := False;
  btnStopPlatform.Visible := False;

  if Selected  then
  begin
    if (Item = nil) or (item.Data = nil) then
      Exit;

    suppliedShipTemp := TT3PlatformInstance(lvNearestPlatform.Selected.Data);
    LogisticSuppliedID := suppliedShipTemp.InstanceIndex;

    if LogisticSelectedPlatform.UnitLogistic.FData.Tranferable_Logistic then
      btnTransferPlatform.Visible := True;
      btnStopPlatform.Visible := True;
  end;
end;

procedure TfrmToteDisplay.lvStatusTransferSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  shipTemp : TT3Vehicle;
  hoseTemp : THose;

begin
  if Selected  then
  begin
    if (Item = nil) or (item.Data = nil) then
      Exit;

    shipTemp := TT3Vehicle(lvStatusTransfer.Selected.Data);

    case Item.Index of
      0:
      begin
        LogisticStateID := shipTemp.DestinationStateLog;
        LogisticActionID := 0;
      end;
      1:
      begin
        hoseTemp := shipTemp.HoseList[0];
        LogisticStateID := hoseTemp.State;
        LogisticHoseID := 0;
        LogisticActionID := 1;
      end;
      2:
      begin
        hoseTemp := shipTemp.HoseList[1];
        LogisticStateID := hoseTemp.State;
        LogisticHoseID := 1;
        LogisticActionID := 1;
      end;
    end;

    if LogisticStateID = 0 then
      btnStandby.Caption := 'Standby'
    else
      btnStandby.Caption := 'Idle';

  end;

  btnStandby.Visible := Selected;
end;

procedure TfrmToteDisplay.lvBaseImportSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  baseTemp : TPlatformBase;

begin
  btnTransferBase.Visible := False;
  btnStopBase.Visible := False;
  btnDetailBase.Visible := False;

  if Selected  then
  begin
    if (Item = nil) or (item.Data = nil) then
      Exit;

    if simMgrClient.IsController or simMgrClient.ISWasdal then
    begin
      baseTemp := TPlatformBase(lvNearestbase.Selected.Data);
      LogisticBaseID := baseTemp.id;
      btnTransferBase.Visible := Selected;
      btnStopBase.Visible := Selected;
      btnDetailBase.Visible := Selected;
    end;
  end;
end;

procedure TfrmToteDisplay.UpdateLogisticToteDisplay(sender: TT3Vehicle);
begin
  if not Assigned(sender) then
    Exit;

  {hanya merefresh list ketika kapal yg diselect sedang diedit}
  if LogisticSelectedID = TT3PlatformInstance(sender).InstanceIndex  then
  begin
    {Update data status}
    RefreshStatusLogistic(sender);

    {Update data logistic}
    RefreshShipLogistic(sender);

    {Update data pangkalan terdekat }
    RefreshNearestBaseLogistic(sender);

    {Mengisi List kapal terdekat}
    RefreshNearestPlatformLogistic(sender);

    {Mengisi List Rute}
    RefreshRouteLogistic(LogisticSelectedID);
  end;
end;

//procedure TfrmToteDisplay.RefreshShipDestinationLogistic(idx : Integer);
//var
//  i : Integer;
//  _range : Double;
//  _OwnShip, _DestinationShip : TT3PlatformInstance;
//  li : TListItem;
//begin
////  lvShipDestinationTransfer.Items.Clear;
//
//  _OwnShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(idx));
//
//  for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//  begin
//    _DestinationShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//
//    {bukan vehicle}
//    if not (_DestinationShip is TT3Vehicle) then
//      Continue;
//
//    {dirinya sendiri}
//    if idx = _DestinationShip.InstanceIndex then
//      Continue;
//
//    {jarak antar kapal 0.25 nm}
//    _range :=  CalcRange(_OwnShip.PosX,_OwnShip.posY,_DestinationShip.PosX,_DestinationShip.posY);
//    if _range > 0.25 then
//      Continue;
//
//    {Force sama}
//    if _OwnShip.Force_Designation <> _DestinationShip.Force_Designation then
//      Continue;
//
//    if _DestinationShip.FreeMe then
//      Continue;
//
//    {$REGION ' Memasukkan data kedalam list item '}
////    li := lvShipDestinationTransfer.Items.Add;
////    li.Caption := _DestinationShip.InstanceName;
////
////    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
////      li.SubItems.Add(_DestinationShip.Track_ID)
////    else
////      li.SubItems.Add(IntToStr(_DestinationShip.TrackNumber));
////
////    li.Data := _DestinationShip;
//    {$ENDREGION}
//
//  end;
//end;

procedure TfrmToteDisplay.RefreshStatusLogistic(sender: TT3Vehicle);
var
  i : Integer;
  li : TListItem;
  hoseTemp : THose;
begin
  if not Assigned(sender) then
    Exit;

  lvStatusTransfer.Items.Clear;

  {$REGION ' Memasukkan data kedalam list item '}
  {Status transfer dari kapal lain/ pangkalan}
  li := lvStatusTransfer.Items.Add;
  li.Caption := 'Transfer State ';
  case sender.DestinationStateLog of
    lsIdle : li.SubItems.Add (' Idle ');
    lsStandby : li.SubItems.Add (' Standby ');
    lsProcess : li.SubItems.Add (' Process ');
  end;
  li.Data := TT3PlatformInstance(sender);

  {Status transfer dari kapal lain/ pangkalan}
  for i := 0 to sender.HoseList.Count-1 do
  begin
    hoseTemp := sender.HoseList[i];

    if not hoseTemp.Available then
      Continue;

    li := lvStatusTransfer.Items.Add;

    case hoseTemp.HoseID of
      0 : li.Caption := ('Port Hose');
      1 : li.Caption := 'Starboard Hose';
    end;

    case hoseTemp.State of
      lsIdle : li.SubItems.Add (' Idle ');
      lsStandby : li.SubItems.Add (' Standby ');
      lsProcess : li.SubItems.Add (' Process ');
    end;

    li.Data := TT3PlatformInstance(sender);
  end;
  {$ENDREGION}
end;

procedure TfrmToteDisplay.RefreshShipLogistic(sender : TT3Vehicle);
var
  li      : TListItem;

begin
  if not Assigned(sender) then
    Exit;

  lvLogisticPlatform.Items.Clear;

  {$REGION ' Fuel '}
  li := lvLogisticPlatform.Items.Add;
  li.Data := TT3PlatformInstance(sender);
  li.Caption := 'Fuel';

  case TT3PlatformInstance(sender).UnitMotion.FData.Endurance_Type of
    byte(entFuel):
    begin
      li.SubItems.Add(FormatFloat('#,##0.00',TT3PlatformInstance(sender).FuelCapacity) + ' m3');
//      li.SubItems.Add('m3');
      li.SubItems.Add(FormatFloat('#,##0.00',TT3PlatformInstance(sender).FuelRemaining)+ ' m3');
//      li.SubItems.Add('m3');
    end;
    byte(entTime):
    begin
      li.SubItems.Add('Time');
      li.SubItems.Add('Time');
    end;
    byte(entRange):
    begin
      li.SubItems.Add('Range');
      li.SubItems.Add('Range');
    end;
    byte(entUnlimited):
    begin
      li.SubItems.Add('Unlimited');
      li.SubItems.Add('Unlimited');
    end;
  end;
  {$ENDREGION}

  {$REGION ' Lubricants '}
  li := lvLogisticPlatform.Items.Add;
  li.Data := TT3PlatformInstance(sender);
  li.Caption := 'Lubricants';

  li.SubItems.Add(FormatFloat('#,##0.00',TT3PlatformInstance(sender).MLCapacity) + ' m3');
//  li.SubItems.Add('m3');
  li.SubItems.Add(FormatFloat('#,##0.00',TT3PlatformInstance(sender).MLRemaining) + ' m3');
//  li.SubItems.Add('m3');
  {$ENDREGION}

  {$REGION ' Water '}
  li := lvLogisticPlatform.Items.Add;
  li.Data := TT3PlatformInstance(sender);
  li.Caption := 'Water';

  li.SubItems.Add(FormatFloat('#,##0.00',TT3PlatformInstance(sender).ATCapacity) + ' m3');
//  li.SubItems.Add('m3');
  li.SubItems.Add(FormatFloat('#,##0.00',TT3PlatformInstance(sender).ATRemaining) + ' m3');
//  li.SubItems.Add('m3');
  {$ENDREGION}

  {$REGION ' Food '}
  li := lvLogisticPlatform.Items.Add;
  li.Data := TT3PlatformInstance(sender);
  li.Caption := 'Food';

  li.SubItems.Add(FormatFloat('#,##0.00',TT3PlatformInstance(sender).FoodCapacity) + ' ton');
//  li.SubItems.Add('ton');
  li.SubItems.Add(FormatFloat('#,##0.00',TT3PlatformInstance(sender).FoodRemaining) + ' ton');
//  li.SubItems.Add('ton');
  {$ENDREGION}

end;

procedure TfrmToteDisplay.RefreshNearestBaseLogistic(sender : TT3Vehicle);
var
  i : Integer;
  rangeTemp : Double;
  baseTemp : TPlatformBase;
  shipTemp : TT3PlatformInstance;
  li : TListItem;

begin
  if not Assigned(sender) then
    Exit;

  lvNearestbase.Items.Clear;

  shipTemp := TT3PlatformInstance(sender);
  for i := 0 to simMgrClient.SimPlatformBase.ListBase.Count - 1 do
  begin
    baseTemp := TPlatformBase(simMgrClient.SimPlatformBase.ListBase.Items[i]);

    {jarak kapal dan pangkalan lebih besar dari radius pangkalan nm}
    rangeTemp :=  CalcRange(shipTemp.PosX,shipTemp.posY,baseTemp.Longitude,baseTemp.Latitude);
    if rangeTemp > baseTemp.Radius then
      Continue;

    {Force sama}
    if shipTemp.Force_Designation <> baseTemp.force then
      Continue;

    {$REGION ' Memasukkan data kedalam list item '}
    li := lvNearestbase.Items.Add;
    li.Caption := baseTemp.identifier;
    li.SubItems.Add (FloatToStr(baseTemp.Radius) + ' nm');
    li.Data := baseTemp;
    {$ENDREGION}
  end;
end;

procedure TfrmToteDisplay.RefreshNearestPlatformLogistic(sender: TT3Vehicle);
var
  i : Integer;
  rangeTemp : Double;
  shipTemp, otherShipTemp : TT3PlatformInstance;
  li : TListItem;

begin
  if not Assigned(sender) then
    Exit;

  lvNearestPlatform.Items.Clear;

  shipTemp := TT3PlatformInstance(sender);
  for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
  begin
    otherShipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));

    {bukan vehicle}
    if not (otherShipTemp is TT3Vehicle) then
      Continue;

    {dirinya sendiri}
    if shipTemp.InstanceIndex = otherShipTemp.InstanceIndex then
      Continue;

    {jarak antar kapal 0.1 nm}
    rangeTemp :=  CalcRange(shipTemp.PosX,shipTemp.posY,otherShipTemp.PosX,otherShipTemp.posY);
    if rangeTemp > 0.1 then
      Continue;

    {Force sama}
    if shipTemp.Force_Designation <> otherShipTemp.Force_Designation then
      Continue;

    if otherShipTemp.FreeMe then
      Continue;

    {Sedang dalam transport}
    if TT3Vehicle(otherShipTemp).StateTransport then
      Continue;

    {Induk yang membawa}
    if TT3Vehicle(shipTemp).HostIdTransport = otherShipTemp.InstanceIndex then
      Continue;

    {$REGION ' Memasukkan data kedalam list item '}
    li := lvNearestPlatform.Items.Add;
    li.Caption := otherShipTemp.InstanceName;

    case TT3Vehicle(otherShipTemp).DestinationStateLog of
      lsIdle : li.SubItems.Add (' Idle ');
      lsStandby : li.SubItems.Add (' Standby ');
      lsProcess : li.SubItems.Add (' Process ');
    end;
    li.Data := otherShipTemp;
    {$ENDREGION}

  end;
end;

procedure TfrmToteDisplay.RefreshRouteLogistic(idx : Integer);
var
  i : Integer;
  shipingRouteTemp : TMainShipingRoute;
  shipTemp : TT3PlatformInstance;
  li : TListItem;
begin

  lvLogisticRoute.Items.Clear;
  lvDetailsRouteWPLogistic.Items.Clear;

  shipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(idx));

//  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
//  begin
    for i := 0 to simMgrClient.SimShipingRoute.FList.Count - 1 do
    begin
      shipingRouteTemp := simMgrClient.SimShipingRoute.FList.Items[i];
      if shipTemp.Force_Designation = shipingRouteTemp.Force then
      begin
        li := lvLogisticRoute.Items.Add;
        li.SubItems.Add(shipingRouteTemp.Name);
        li.Data := shipingRouteTemp;
//        lvLogisticRoute.Items.Add.SubItems.Add(shipingRouteTemp.Name);
//        lvLogisticRoute.ad
      end;
    end;
//  end
//  else
//  begin
//    for I := 0 to simMgrClient.SimShipingRoute.FList.Count - 1 do
//    begin
//      shipingRouteTemp := simMgrClient.SimShipingRoute.FList.Items[i];
//      if simMgrClient.FMyCubGroup.FData.Force_Designation = shipingRouteTemp.Force then
//      begin
//        lvLogisticRoute.Items.Add.SubItems.Add(shipingRouteTemp.Name);
//      end;
//    end;
//  end;
end;

procedure TfrmToteDisplay.RefreshPanelSize;
begin
//  {$REGION ' Setting Panel Platform List'}
//  pnlListPlatform.Height := pnlPlatformList.Height - pnlButtonRefresh.Height;
//  {$ENDREGION}

//  {$REGION ' Setting More Logistic Bottom'}
//  pnlLogisticBottom.Height := 34;
//  lblMoreLogisticCalculation.Caption := 'More >>';
//  {$ENDREGION}

//  pnlListPlatform.Height := 927;
//  pnlLogisticPlatform.Height := 200;
//  pnlStatusTransfer.Height := 184;
//  pnlNearestPlatform.Height := 230;
//  pnlNearestBases.Height := 245;

//  lblMoreLogisticCalculationClick(nil);
end;
procedure TfrmToteDisplay.ResetLogisticPanel(val : Boolean);
begin
  btnStandby.Visible := val;
  lblJenisLogistic.Visible := val;
  edtLogistic.Visible := val;
  btnChangeLogistic.Visible := val;
  btnTransferBase.Visible := val;
  btnStopBase.Visible := val;
  btnDetailBase.Visible := val;
  btnTransferPlatform.Visible := val;
  btnStopPlatform.Visible := val;

  {Calculation}
  lblShipLogisticCalculation.Caption := '---';
  lblRouteLogisticCalculation.Caption := '---';

  lblJarakLog.Caption := '---';
  lblWaktuLog.Caption := '---';
  lblFuelLog.Caption := '---';
  lblMLLog.Caption := '---';
  lblATLog.Caption := '---';
  lblFoodLog.Caption := '---';
  lblWaterLog.Caption := '---';

//  lvBaseImport.Items.Clear;
//  lvShipDestinationTransfer.Items.Clear;
  lvLogisticRoute.Items.Clear;
  lvDetailsRouteWPLogistic.Items.Clear;

//  btnBaseTransfer.Enabled := False;
//  btnShipTransferLogistic.Enabled := False;
  btnCalculateLogistic.Enabled := False;
end;

function TfrmToteDisplay.cekTransfer(var flag : integer; idx: Integer): Boolean;
var
  i : Integer;
  _Fuel, _ML, _AT, _Food, _Water : Double;
  _Base : TPlatformBase;
  _OwnShip, _DestinationShip : TT3PlatformInstance;
begin
  result := False;

  _OwnShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSelectedID));

  case idx of
    0 :
    begin
      _DestinationShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSuppliedID));

      flag := 1;
      {$REGION ' Incorrect data input '}
//      if not TryStrToFloat(edtFuelTransferExsport.Text, _Fuel) then exit;
//      if not TryStrToFloat(edtLubricantTransferExport.Text, _ML) then exit;
//      if not TryStrToFloat(edtFreshWaterTransferExport.Text, _AT) then exit;
//      if not TryStrToFloat(edtFoodTransferExport.Text, _Food) then exit;
//      if not TryStrToFloat(edtWaterTransferExport.Text, _Water) then exit;
      {$ENDREGION}

      flag := 4;
      {$REGION ' Fuel Unlimited, Don''t have ability to transfer '}
      if (_DestinationShip.UnitMotion.FData.Endurance_Type <> 0) and (_Fuel > 0) then Exit;
      {$ENDREGION}

      flag := 5;
      {$REGION ' Fuel Unlimited, Don''t have ability to be transferred '}
      if (_OwnShip.UnitMotion.FData.Endurance_Type <> 0) and (_Fuel > 0) then Exit;
      {$ENDREGION}

      flag := 2;
      {$REGION ' Deficient Logistics '}
      if _OwnShip.FuelRemaining < _Fuel then exit;
      if _OwnShip.MLRemaining < _ML then exit;
      if _OwnShip.ATRemaining < _AT then exit;
      if _OwnShip.FoodRemaining < _Food then exit;
      if _OwnShip.WaterRemaining < _Water then exit;
      {$ENDREGION}

      flag := 3;
      {$REGION ' Transfers Overload '}
      if (_DestinationShip.FuelRemaining + _Fuel) > _DestinationShip.FuelCapacity then exit;
      if (_DestinationShip.MLRemaining + _ML) > _DestinationShip.MLCapacity then exit;
      if (_DestinationShip.ATRemaining + _AT) > _DestinationShip.ATCapacity then exit;
      if (_DestinationShip.FoodRemaining + _Food) > _DestinationShip.FoodCapacity then exit;
      if (_DestinationShip.WaterRemaining + _Water) > _DestinationShip.WaterCapacity then exit;
      {$ENDREGION}

      flag := 6;
      {$REGION ' Sedang melakukan transfer ' }
      if ((TT3Vehicle(_DestinationShip).DestinationStateLog = lsProcess) or (TT3Vehicle(_DestinationShip).isTransferFromBase)) then
        exit;
      {$ENDREGION}

      result := True;
    end;
    1 :
    begin
      for I := 0 to VScenario.BaseListFromDB.Count - 1 do
      begin
        _Base := TPlatformBase(VScenario.BaseListFromDB.Items[i]);

        if _Base.id =  LogisticBaseID then
          Break
        else
          _Base := nil;
      end;

      flag := 1;
      {$REGION ' Incorrect data input '}
//      if not TryStrToFloat(edtFuelTransferImport.Text, _Fuel) then exit;
//      if not TryStrToFloat(edtLubricantTransferImport.Text, _ML) then exit;
//      if not TryStrToFloat(edtFreshWaterTransferImport.Text, _AT) then exit;
//      if not TryStrToFloat(edtFoodTransferImport.Text, _Food) then exit;
//      if not TryStrToFloat(edtWaterTransferImport.Text, _Water) then exit;
      {$ENDREGION}

      flag := 4;
      {$REGION ' Fuel Unlimited, Don''t have ability to transfer '}
      if (_OwnShip.UnitMotion.FData.Endurance_Type <> 0) and (_Fuel > 0) then Exit;
      {$ENDREGION}

      flag := 2;
      {$REGION ' Deficient Logistics '}
      if _Base.Fuel < _Fuel then exit;
      if _Base.Lubricants < _ML then exit;
      if _Base.FreshWater < _AT then exit;
      if _Base.Food < _Food then exit;
      if _Base.Water < _Water then exit;
      {$ENDREGION}

      flag := 3;
      {$REGION ' Transfers Overload '}
      if (_OwnShip.FuelRemaining + _Fuel) > _OwnShip.FuelCapacity then exit;
      if (_OwnShip.MLRemaining + _ML) > _OwnShip.MLCapacity then exit;
      if (_OwnShip.ATRemaining + _AT) > _OwnShip.ATCapacity then exit;
      if (_OwnShip.FoodRemaining + _Food) > _OwnShip.FoodCapacity then exit;
      if (_OwnShip.WaterRemaining + _Water) > _OwnShip.WaterCapacity then exit;
      {$ENDREGION}

      flag := 6;
      {$REGION ' Sedang melakukan transfer ' }
      if ((TT3Vehicle(_OwnShip).DestinationStateLog = lsProcess) or (TT3Vehicle(_OwnShip).isTransferFromBase)) then
        exit;
      {$ENDREGION}

      result := True;
    end;
  end;
end;

procedure TfrmToteDisplay.chkFuelImportClick(Sender: TObject);
begin
//  case TCheckBox(Sender).Tag of
//    5 :
//    begin
//      edtFuelTransferImport.Text := '0';
//      edtFuelTransferImport.Enabled := False;
//      if chkFuelImport.Checked then
//        edtFuelTransferImport.Enabled := True
//    end;
//    6 :
//    begin
//      edtLubricantTransferImport.Text := '0';
//      edtLubricantTransferImport.Enabled := False;
//      if chkLubricantsImport.Checked then
//        edtLubricantTransferImport.Enabled := True
//    end;
//    7 :
//    begin
//      edtFreshWaterTransferImport.Text := '0';
//      edtFreshWaterTransferImport.Enabled := False;
//      if chkFreshWaterImport.Checked then
//        edtFreshWaterTransferImport.Enabled := True
//    end;
//    8 :
//    begin
//      edtWaterTransferImport.Text := '0';
//      edtWaterTransferImport.Enabled := False;
//      if chkWaterImport.Checked then
//        edtWaterTransferImport.Enabled := True
//    end;
//    9 :
//    begin
//      edtFoodTransferImport.Text := '0';
//      edtFoodTransferImport.Enabled := False;
//      if chkFoodImport.Checked then
//        edtFoodTransferImport.Enabled := True
//    end;
//  end;
end;

procedure TfrmToteDisplay.chkFuelExportClick(Sender: TObject);
begin
//  case TCheckBox(Sender).Tag of
//    0 :
//    begin
//      edtFuelTransferExsport.Text := '0';
//      edtFuelTransferExsport.Enabled := False;
//      if chkFuelExport.Checked then
//        edtFuelTransferExsport.Enabled := True
//    end;
//    1 :
//    begin
//      edtLubricantTransferExport.Text := '0';
//      edtLubricantTransferExport.Enabled := False;
//      if chkLubricantsExport.Checked then
//        edtLubricantTransferExport.Enabled := True
//    end;
//    2 :
//    begin
//      edtFreshWaterTransferExport.Text := '0';
//      edtFreshWaterTransferExport.Enabled := False;
//      if chkFreshWaterExport.Checked then
//        edtFreshWaterTransferExport.Enabled := True
//    end;
//    3 :
//    begin
//      edtWaterTransferExport.Text := '0';
//      edtWaterTransferExport.Enabled := False;
//      if chkWaterExport.Checked then
//        edtWaterTransferExport.Enabled := True
//    end;
//    4 :
//    begin
//      edtFoodTransferExport.Text := '0';
//      edtFoodTransferExport.Enabled := False;
//      if chkFoodExport.Checked then
//        edtFoodTransferExport.Enabled := True
//    end;
//  end;
end;

procedure TfrmToteDisplay.btnCalculateLogisticClick(Sender: TObject);
begin
  LogisticWPCalculation;
end;

procedure TfrmToteDisplay.lvLandingCraftCarriedSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  HostShip : TT3PlatformInstance;
begin
  {$REGION ' Reset button '}
  DisableBtnTransportOnShip;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(HostShip) then
    Exit;

  if HostShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  if Selected then
  begin
    TransportMemberShipID := StrToInt(lvLandingCraftCarried.Selected.Caption);
    btnLandingCraftDisembark.Enabled := True;
  end
end;

procedure TfrmToteDisplay.lvLogisticPlatformSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin

  if Selected then
  begin
    if (Item = nil) or (item.Data = nil) then
      Exit;

    if simMgrClient.IsController or simMgrClient.ISWasdal then
    begin
      edtLogistic.Text := '0';
      lblJenisLogistic.Caption := item.Caption + ' : ';

      lblJenisLogistic.Visible := Selected;
      edtLogistic.Visible := Selected;
      btnChangeLogistic.Visible := Selected;

      LogisticItemID := Item.Index;
    end;
  end;
end;

procedure TfrmToteDisplay.lvLogisticRouteSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  i, j : Integer;
  _LogistiRoute : TPointRoute;
  _LogisticTemplate : TMainShipingRoute;
begin
  if (Item = nil) or (item.Data = nil) then
    Exit;

  btnCalculateLogistic.Enabled := False;

  {semua template diset normal dulu}
  for i := 0 to simMgrClient.SimShipingRoute.FList.Count - 1 do
  begin
    _LogisticTemplate := simMgrClient.SimShipingRoute.FList.Items[i];
    for j := 0 to _LogisticTemplate.FList.Count - 1 do
    begin
      _LogistiRoute := _LogisticTemplate.FList[j];
      _LogistiRoute.isSelected := False;
    end;
  end;

  if Selected and (lvPlatformLogistic.ItemIndex <> -1)then
  begin
    _LogisticTemplate := Item.Data;
    IdSelectedWaypointLogistic := _LogisticTemplate.ShipingRouteId;

    {yang diselect dibuat bergaris}
//    _LogisticTemplate := simMgrClient.SimShipingRoute.FList.Items[lvLogisticRoute.Selected.Index];
    for i := 0 to _LogisticTemplate.FList.Count - 1 do
    begin
      _LogistiRoute := _LogisticTemplate.FList[i];
      _LogistiRoute.isSelected := True;
    end;
    btnCalculateLogistic.Enabled := True;
  end
  else
  begin
    lvDetailsRouteWPLogistic.Items.Clear;

    lblShipLogisticCalculation.Caption := '---';
    lblRouteLogisticCalculation.Caption := '---';

    lblJarakLog.Caption := '---';
    lblWaktuLog.Caption := '---';
    lblFuelLog.Caption  := '---';
    lblMLLog.Caption    := '---';
    lblATLog.Caption    := '---';
    lblFoodLog.Caption  := '---';
    lblWaterLog.Caption := '---';
  end;
end;

// NEW UI Procedure
procedure TfrmToteDisplay.LogisticTabClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: Tpanel;
begin
  panel := Sender as Tpanel;
  PanelTag := panel.Tag;

//  if panel = pnlTabExport then
//  begin
//    if PanelTag = 0 then
//    begin
//      pnlTabExport.Color := RGB(44, 127, 161);
//      pnlExport.BringToFront;
//      pnlTabExport.Tag := 1;
//      pnlTabImport.Tag := 0;
//      pnlTabImport.Color := RGB(29, 81, 103);
//    end;
//  end;
//
//  if panel = pnlTabImport then
//  begin
//    if PanelTag = 0 then
//    begin
//      pnlTabImport.Color := RGB(44, 127, 161);
//      pnlImport.BringToFront;
//      pnlTabImport.Tag := 1;
//      pnlTabExport.Tag := 0;
//      pnlTabExport.Color := RGB(29, 81, 103);
//    end;
//  end;
end;

procedure TfrmToteDisplay.TabMessageHandlingClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: Tpanel;
begin
  panel := Sender as Tpanel;
  PanelTag := panel.Tag;

  if panel = pnlTabDraft then
  begin
    if PanelTag = 0 then
    begin
      pnlTabDraft.Color := RGB(44, 127, 161);
      pnlContentDraft.BringToFront;
      pnlTabDraft.Tag := 1;
      pnlTabReceived.Tag := 0;
      pnlTabReceived.Color := RGB(29, 81, 103);
      pnlTabSent.Tag := 0;
      pnlTabSent.Color := RGB(29, 81, 103);
    end;
  end;

  if panel = pnlTabReceived then
  begin
    if PanelTag = 0 then
    begin
      pnlTabReceived.Color := RGB(44, 127, 161);
      pnlContentReceived.BringToFront;
      pnlTabReceived.Tag := 1;
      pnlTabDraft.Tag := 0;
      pnlTabDraft.Color := RGB(29, 81, 103);
      pnlTabSent.Tag := 0;
      pnlTabSent.Color := RGB(29, 81, 103);
    end;
  end;

  if panel = pnlTabSent then
  begin
    if PanelTag = 0 then
    begin
      pnlTabSent.Color := RGB(44, 127, 161);
      pnlContentSent.BringToFront;
      pnlTabSent.Tag := 1;
      pnlTabDraft.Tag := 0;
      pnlTabDraft.Color := RGB(29, 81, 103);
      pnlTabReceived.Tag := 0;
      pnlTabReceived.Color := RGB(29, 81, 103);
    end;
  end;
end;

procedure TfrmToteDisplay.pnlCommTabClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: Tpanel;
begin
  panel := Sender as Tpanel;
  PanelTag := panel.Tag;

  if panel = pnlTabInjection then
  begin
    if PanelTag = 0 then
    begin
      pnlTabInjection.Color := RGB(44, 127, 161);
      pnlInjection.BringToFront;
      pnlTabInjection.Tag := 1;
      pnlTabVolume.Tag := 0;
      pnlTabVolume.Color := RGB(29, 81, 103);
    end;
  end;

  if panel = pnlTabVolume then
  begin
    if PanelTag = 0 then
    begin
      pnlTabVolume.Color := RGB(44, 127, 161);
      pnlVolume.BringToFront;
      pnlTabVolume.Tag := 1;
      pnlTabInjection.Tag := 0;
      pnlTabInjection.Color := RGB(29, 81, 103);
    end;
  end;
end;


procedure TfrmToteDisplay.pnlRightBorderMouseEnter(Sender: TObject);
begin
  if pnlSideBar.Tag = 0 then
  begin
    SmoothResizeFormTo(302);
    pnlSideBar.Tag := 1;
  end
  else if pnlSideBar.Tag = 1 then
  begin
    SmoothResizeFormTo(52);
    pnlSideBar.Tag := 0;
  end;
end;

procedure TfrmToteDisplay.pnlSideBarMouseEnter(Sender: TObject);
begin
  pnlSideBar.Width := 202;
  pnlBottomSep.Width := 198;
  pnlBottomSep2.Width := 198;
end;

procedure TfrmToteDisplay.pnlSideBarMouseLeave(Sender: TObject);
begin
  pnlSideBar.Width := 52;
  pnlBottomSep.Width := 48;
  pnlBottomSep2.Width := 48;
end;

procedure TfrmToteDisplay.AudioTabClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: Tpanel;
begin
  panel := Sender as Tpanel;
  PanelTag := panel.Tag;

  if panel = pnlTabExternal then
  begin
    if PanelTag = 0 then
    begin
      pnlTabExternal.Color := RGB(44, 127, 161);
      pnlExternal.BringToFront;
      pnlTabExternal.Tag := 1;
      pnlTabInternal.Tag := 0;
      pnlTabInternal.Color := RGB(29, 81, 103);
    end;
  end;

  if panel = pnlTabInternal then
  begin
    if PanelTag = 0 then
    begin
      pnlTabInternal.Color := RGB(44, 127, 161);
      pnlInternal.BringToFront;
      pnlTabInternal.Tag := 1;
      pnlTabExternal.Tag := 0;
      pnlTabExternal.Color := RGB(29, 81, 103);
    end;
  end;
end;

procedure TfrmToteDisplay.TabCubicleClick(Sender: TObject);
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
      pnlContentPlatform.BringToFront;
      pnlTabPlatform.Tag := 1;
      pnlTabResponsibility.Tag := 0;
      pnlTabResponsibility.Color := RGB(29, 81, 103);
    end;
  end;

  if panel = pnlTabResponsibility then
  begin
    if PanelTag = 0 then
    begin
      pnlTabResponsibility.Color := RGB(44, 127, 161);
      pnlContentResponsibility.BringToFront;
      pnlTabResponsibility.Tag := 1;
      pnlTabPlatform.Tag := 0;
      pnlTabPlatform.Color := RGB(29, 81, 103);
    end;
  end;
end;

procedure TfrmToteDisplay.TabEnvironmentClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: Tpanel;
begin
  panel := Sender as Tpanel;
  PanelTag := panel.Tag;

  if panel = pnlTabAboveWater then
  begin
    if PanelTag = 0 then
    begin
      pnlTabAboveWater.Color := RGB(44, 127, 161);
      pnlAboveWater.BringToFront;
      pnlTabAboveWater.Tag := 1;
      pnlTabSurfaceAndSub.Tag := 0;
      pnlTabSurfaceAndSub.Color := RGB(29, 81, 103);
      pnlTabBoundaries.Tag := 0;
      pnlTabBoundaries.Color := RGB(29, 81, 103);
    end;
  end;

  if panel = pnlTabSurfaceAndSub then
  begin
    if PanelTag = 0 then
    begin
      pnlTabSurfaceAndSub.Color := RGB(44, 127, 161);
      pnlSurfaceAndSub.BringToFront;
      pnlTabSurfaceAndSub.Tag := 1;
      pnlTabAboveWater.Tag := 0;
      pnlTabAboveWater.Color := RGB(29, 81, 103);
      pnlTabBoundaries.Tag := 0;
      pnlTabBoundaries.Color := RGB(29, 81, 103);
    end;
  end;

  if panel = pnlTabBoundaries then
  begin
    if PanelTag = 0 then
    begin
      pnlTabBoundaries.Color := RGB(44, 127, 161);
      pnlBoundaries.BringToFront;
      pnlTabBoundaries.Tag := 1;
      pnlTabSurfaceAndSub.Tag := 0;
      pnlTabSurfaceAndSub.Color := RGB(29, 81, 103);
      pnlTabAboveWater.Tag := 0;
      pnlTabAboveWater.Color := RGB(29, 81, 103);
    end;
  end;
end;

//   End
procedure TfrmToteDisplay.LogisticWPCalculation;
var
  i, j : Integer;
  _LogistiRoute : TPointRoute;
  _LogisticTemplate : TMainShipingRoute;

  _inHours, _inMenit : Integer;
  _jarak, _waktu, _consPerHour, _SecondToHours, _LogRange, _LogWaktuTempuh,
  _LogFuel, _LogML, _LogAT, _LogFood, _LogWater,
  _Fuel, _ML, _AT, _Food, _Water : Double;

  _Pa, _Ba, _Ta : Integer;
  _FuelCons, _MlCons, _ATCons, _WaterCons, _FoodCons : Double;

  li : TListItem;

  _OwnShip : TT3PlatformInstance;
begin

  lvDetailsRouteWPLogistic.Clear;

  {$REGION ' Pengecekan kapal yang dipilih '}
  _OwnShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSelectedID));

  if _OwnShip = nil then
  begin
    MessageDlg('Please re-select The platfrom', mtInformation, [mbOK], 0);
    Exit
  end
  else
  begin
    with TT3Vehicle(_OwnShip).UnitLogistic.FData do
    begin
      _Pa := PA;
      _Ba := BA;
      _Ta := TA;
      _MlCons := Lubricants_Consumption;
      _ATCons := Freshwater_Consumption;
      _WaterCons := Water_Consumption;
      _FoodCons := Ration_Consumption;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan rute yang dipilih '}
  if lvLogisticRoute.ItemIndex = -1 then
  begin
    MessageDlg('Please re-select route', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  if simMgrClient.SimShipingRoute.FList.Count > 0 then
  begin
    _jarak := 0; _waktu := 0;
    _Fuel := 0; _ML := 0; _AT := 0; _Food := 0; _Water := 0;

//    _LogisticTemplate := simMgrClient.SimShipingRoute.FList.Items[lvLogisticRoute.Selected.Index];
    _LogisticTemplate := simMgrClient.SimShipingRoute.GetShipingRoute(IdSelectedWaypointLogistic);

    if Assigned(_LogisticTemplate) then
    begin
      for i := 0 to _LogisticTemplate.FList.Count - 1 do
      begin
        _LogistiRoute := _LogisticTemplate.FList[i];

        {jarak yg ditempuh}
        _LogRange := CalcRange(_LogistiRoute.PosAwal.X,_LogistiRoute.PosAwal.Y, _LogistiRoute.PosAkhir.X,
                              _LogistiRoute.PosAkhir.Y);

        {waktu yg ditempuh}
        _LogWaktuTempuh := ((_LogRange * C_NauticalMile_To_Metre) / (_LogistiRoute.Speed/C_MS_To_KNOTS))/3600;
        _SecondToHours := _LogWaktuTempuh * 60;
        _inHours := Round(_SecondToHours) div 60;
        _inMenit := Round(_SecondToHours) mod 60;

        {Fuel}
        cekSpeed(TT3Vehicle(_OwnShip), _LogistiRoute.Speed, _consPerHour);
        _LogFuel := _LogWaktuTempuh * _consPerHour {m3};


        {Lubricants}
        _LogML := _LogWaktuTempuh * _MlCons; {m3}

        {Fresh Water}
        _LogAT := _LogWaktuTempuh * _ATCons; {m3}

        {Water}
        _LogWater := (_LogWaktuTempuh/24) * _WaterCons * (_LogistiRoute.Personel + _Pa + _Ba + _Ta);  {/24jam/ personel};

        {Food}
        _LogFood := (_LogWaktuTempuh/24) * _FoodCons * (_LogistiRoute.Personel + _Pa + _Ba + _Ta);  {/24jam/ personel}

        with lvDetailsRouteWPLogistic.Items.Add do
        begin
          SubItems.Add('WP ' + IntToStr(_LogistiRoute.PointId) + '-' + IntToStr(_LogistiRoute.PointId+1));
          SubItems.Add(IntToStr(_LogistiRoute.Personel + _Pa + _Ba + _Ta));
          SubItems.Add(FloatToStr(_LogistiRoute.Speed));
          SubItems.Add(FormatFloat('0.00',_LogRange));
          SubItems.Add(FloatToStr(Round(_inHours)) + ':' + FormatFloat('00',_inMenit));
          SubItems.Add(FormatFloat('0.00',_LogFuel) + ' m3');
          SubItems.Add(FormatFloat('0.00',_LogML) + ' m3');
          SubItems.Add(FormatFloat('0.00',_LogAT) + ' m3');
          SubItems.Add(FormatFloat('0.00',_LogWater) + ' m3');
          SubItems.Add(FormatFloat('0.00',_LogFood) + ' ton');

          _jarak  := _jarak + _LogRange;
          _waktu  := _waktu + _LogWaktuTempuh;
          _Fuel  := _Fuel + _LogFuel;
          _ML    := _ML + _LogML;
          _AT    := _AT + _LogAT;
          _Food  := _Food + _LogFood;
          _Water := _Water + _LogWater;
        end;
      end;

      _SecondToHours := _waktu * 60;
      _inHours := Round(_SecondToHours) div 60;
      _inMenit := Round(_SecondToHours) mod 60;

      lblShipLogisticCalculation.Caption := _OwnShip.InstanceName;
      lblCrew.Caption := IntToStr(_Pa + _Ba + _Ta) + ' Personel ';
      lblRouteLogisticCalculation.Caption := '- ' + _LogisticTemplate.Name + ' Route Details : ';

      lblJarakLog.Caption := FormatFloat('0.00',_jarak)+ ' nm  ';
      lblWaktuLog.Caption := (FloatToStr(Round(_inHours)) + ':' + (FormatFloat('00',_inMenit)));
      lblFuelLog.Caption := FormatFloat('0.00',_Fuel)+ ' m3  ';
      lblMLLog.Caption := FormatFloat('0.00',_ML)+ ' m3  ';
      lblATLog.Caption :=FormatFloat('0.00',_AT)+ ' m3  ';
      lblFoodLog.Caption := FormatFloat('0.00',_Food) + ' ton  ';
      lblWaterLog.Caption := FormatFloat('0.00',_Water) + ' m3  ';
    end;
  end;
end;

procedure TfrmToteDisplay.cekSpeed(ship : TT3Vehicle; iSpeed: Double; var ConsPerHour: Double);
begin
  ConsPerHour := 0;

  with ship.UnitMotion.FData do
  begin
    if (iSpeed >= Min_Ground_Speed) and (iSpeed < Cruise_Ground_Speed) then
      ConsPerHour := Min_Speed_Fuel_Consume
    else if (iSpeed >= Cruise_Ground_Speed) and (iSpeed < High_Ground_Speed) then
      ConsPerHour := Cruise_Speed_Fuel_Consume
    else if (iSpeed >= High_Ground_Speed) and (iSpeed < Max_Ground_Speed) then
      ConsPerHour := High_Speed_Fuel_Consume
    else if (iSpeed >= Max_Ground_Speed) then
      ConsPerHour := Max_Speed_Fuel_Consume;
  end;
end;

procedure TfrmToteDisplay.lvPlatformLogisticMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
  pos : TPoint;
begin
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    GetCursorPos(pos);
    if (Button = mbRight) and (lvPlatformLogistic.Selected <> nil)then
    begin
      pmLogistikChange.Popup(pos.X, pos.Y);
    end;
  end;
end;

procedure TfrmToteDisplay.miLogisticChangeClick(Sender: TObject);
var
  _OwnShip : TT3PlatformInstance;
begin
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal  then
  begin

    {$REGION ' Pengecekan kapal yang dipilih '}
    _OwnShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSelectedID));

    if _OwnShip = nil then
    begin
      MessageDlg('Please re-select platfrom', mtInformation, [mbOK], 0);
      exit ;
    end;
    {$ENDREGION}

    if not Assigned(frmLogisticChange) then
      frmLogisticChange := TfrmLogisticChange.Create(self);

    frmLogisticChange.supplierShipID := LogisticSelectedID;
    frmLogisticChange.UpdateTabIdShip;
    frmLogisticChange.Show;
  end;
end;

{$ENDREGION}

{$REGION ' Transport Method '}

procedure TfrmToteDisplay.lvPlatformEmbarkDisembarkSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  shipSelectedTemp  : TT3PlatformInstance;
begin
  shipSelectedTemp := nil;
  TransportHostShipID := 0;

  ResetTransportPanel;

  if Selected then
  begin
    if (Item = nil) or (item.Data = nil) then
    begin
      MessageDlg('Platform data is nil, please select other platfrom', mtInformation, [mbOK], 0);
      Exit;
    end;

    shipSelectedTemp := Item.Data;
    TransportHostShipID := shipSelectedTemp.InstanceIndex;

    UpdateTransportToteDisplay(TT3Vehicle(shipSelectedTemp));
  end;
end;

procedure TfrmToteDisplay.ResetTransportPanel;
begin
  lblVehicleName.Caption  := '---';
  lbClass.Caption         := '---';

  lblMaxWeight.Caption    := '---';
  lblTotalWeight.Caption  := '---';

  {$REGION ' Air Platform Carried Section'}
  lblMaxCapacityHanger.Caption := '---';
  lblFreeCapacityHanger.Caption := '---';
  lblCurrentWeightHanger.Caption := '---';
  lvAirCarried.Items.Clear;
  {$ENDREGION}

  {$REGION ' Personel Platform Carried Section'}
  lblMaxCapacityPersonel.Caption := '---';
  lblFreeCapacityPersonel.Caption := '---';
  lblCurrentWeightPersonel.Caption := '---';
  lvPersonelCarried.Items.Clear;
  {$ENDREGION}

  {$REGION ' Land Craft Platform Carried Section'}
  {$ENDREGION}

  {$REGION ' Amphibious & Land Platform Carried Section'}
  lblMaxSpaceHull.Caption := '---';
  lblFreeSpaceHull.Caption := '---';
  lblCurrentWeightHull.Caption := '---';
  lvAmphibiousandLandCarried.Items.Clear;
  {$ENDREGION}

  DisableBtnTransportOnShip;
end;

procedure TfrmToteDisplay.UpdateTransportToteDisplay(sender: TT3Vehicle);
var
  i : Integer;
  rampTemp : TRamp;
  isHaveRampTemp: Boolean;
  hostShipTemp: TT3PlatformInstance;

begin
  if not Assigned(sender) then
    Exit;

  {hanya merefresh list ketika kapal yg diselect sedang diedit}
  if TransportHostShipID = TT3PlatformInstance(sender).InstanceIndex  then
  begin

    {$REGION ' Panel setting air platform '}
    if not sender.UnitCapability.FData.Hangar_Unit_Carried then
    begin
      pnlSparator1.Height := 0;
      pnlAirPlatform.Height := 0;
    end
    else
    begin
      pnlSparator1.Height := 10;
      pnlAirPlatform.Height := 110;
      lblMoreAir.Caption := 'More >>';
    end;
    {$ENDREGION}

    {$REGION ' Panel setting personel platform '}
    Label24.Height := 30;
    if sender.UnitCapability.FData.Personnel_Unit_Carried = False then
    begin
      pnlSparator2.Height := 0;
      pnlPersonelPlatform.Height := 0
    end
    else
    begin
      pnlSparator2.Height := 10;
      pnlPersonelPlatform.Height := 110;
      lblMorePersonel.Caption := 'More >>';
    end;
    {$ENDREGION}

    {$REGION ' Panel setting landing craft platform '}
    Label28.Height := 30;
    pnlSparator3.Height := 10;
    pnlLandingCraftPlatform.Height := 110;
    lblMoreCraft.Caption := 'More >>';
    {$ENDREGION}

    {$REGION ' Panel setting amphibious dan land platform '}
    Label23.Height := 30;
    if not sender.UnitCapability.FData.Deck_Unit_Carried then
    begin
      pnlSparator4.Height := 0;
      pnlAmphibiousPlatform.Height := 0
//      pnlAmphibiousPlatform.Visible := False
    end
    else
    begin
      pnlSparator4.Height := 10;
      pnlAmphibiousPlatform.Height := 155;
      lblMoreAmphibi.Caption := 'More >>';
//      pnlAmphibiousPlatform.Visible := True;
    end;
    {$ENDREGION}

    {$REGION ' Paltform Info '}
    lblVehicleName.Caption := TT3PlatformInstance(sender).InstanceName;
    lbClass.Caption := TT3PlatformInstance(sender).InstanceClass;

    lblMaxWeight.Caption := FormatFloat('0.##',(TT3Vehicle(sender).UnitCapability.FData.Max_Hangar_Weight + TT3Vehicle(sender).UnitCapability.FData.Max_Deck_Weight +
                                               (TT3Vehicle(sender).UnitCapability.FData.Max_Personnel_Capacity * 0.7)));

    lblTotalWeight.Caption := FormatFloat('0.##',(TT3Vehicle(sender).CurrentHanggarWeight +
                                                  TT3Vehicle(sender).CurrentHullWeight + TT3Vehicle(sender).CurrentPersonelWeight));

    {$REGION ' Capability Rampa '}
    pnlRampFront.Visible := TT3Vehicle(sender).VehicleDefinition.FData.FrontGangway;
    pnlRampBack.Visible := TT3Vehicle(sender).VehicleDefinition.FData.RearGangway;
    pnlRampPort.Visible := TT3Vehicle(sender).VehicleDefinition.FData.PortGangway;
    pnlRampStarboard.Visible := TT3Vehicle(sender).VehicleDefinition.FData.StarBoardGangway;

    isHaveRampTemp:= False;
    if pnlRampFront.Visible or pnlRampBack.Visible then isHaveRampTemp:= True;
    {$ENDREGION}

    {$REGION ' State Rampa '}
    for i := 0 to TT3Vehicle(sender).RampList.Count-1 do
    begin
      rampTemp := TT3Vehicle(sender).RampList[i];

      case i of
        0: {Depan}
        begin
          if rampTemp.State then
          begin
            pnlRampFrontDoor.Color := clLime;
            pnlRampFrontUp.Color := clLime;
            pnlRampFrontLeft.Color := clLime;
            pnlRampFrontRight.Color := clLime;
            btnFrontRamp.Caption := 'Close';
            pnlRampFrontDoor.Top := 82;
          end
          else
          begin
            pnlRampFrontDoor.Color := clRed;
            pnlRampFrontUp.Color := clRed;
            pnlRampFrontLeft.Color := clRed;
            pnlRampFrontRight.Color := clRed;
            btnFrontRamp.Caption := 'Open';
            pnlRampFrontDoor.Top := 25;
          end;
        end;
        1: {Kanan}
        begin
          if rampTemp.State then
          begin
            pnlRampStarboardDoor.Color := clLime;
            pnlRampStarboardUp.Color := clLime;
            pnlRampStarboardLeft.Color := clLime;
            pnlRampStarboardRight.Color := clLime;
            btnStarboardRamp.Caption := 'Close';
            pnlRampStarboardDoor.Top := 82;
          end
          else
          begin
            pnlRampStarboardDoor.Color := clRed;
            pnlRampStarboardUp.Color := clRed;
            pnlRampStarboardLeft.Color := clRed;
            pnlRampStarboardRight.Color := clRed;
            btnStarboardRamp.Caption := 'Open';
            pnlRampStarboardDoor.Top := 25;
          end;
        end;
        2: {Belakang}
        begin
          if rampTemp.State then
          begin
            pnlRampBackDoor.Color := clLime;
            pnlRampBackUp.Color := clLime;
            pnlRampBackLeft.Color := clLime;
            pnlRampBackRight.Color := clLime;
            btnBackRamp.Caption := 'Close';
            pnlRampBackDoor.Top := 82;
          end
          else
          begin
            pnlRampBackDoor.Color := clRed;
            pnlRampBackUp.Color := clRed;
            pnlRampBackLeft.Color := clRed;
            pnlRampBackRight.Color := clRed;
            btnBackRamp.Caption := 'Open';
            pnlRampBackDoor.Top := 25;
          end;
        end;
        3: {Kiri}
        begin
          if rampTemp.State then
          begin
            pnlRampPortDoor.Color := clLime;
            pnlRampPortUp.Color := clLime;
            pnlRampPortLeft.Color := clLime;
            pnlRampPortRight.Color := clLime;
            btnPortRamp.Caption := 'Close';
            pnlRampPortDoor.Top := 82;
          end
          else
          begin
            pnlRampPortDoor.Color := clRed;
            pnlRampPortUp.Color := clRed;
            pnlRampPortLeft.Color := clRed;
            pnlRampPortRight.Color := clRed;
            btnPortRamp.Caption := 'Open';
            pnlRampPortDoor.Top := 25;
          end;
        end;
      end;
    end;

    {$ENDREGION}

    {$REGION 'Show panel platform detail'}
    pnlRampStatus.Visible := False;
    pnlEmbarkStatus.Visible := False;
    pnlPlatformDetails.Height := 105;
    pnlInfoKapal.Height := 280;

    if (not sender.StateTransport) and (isHaveRampTemp) then
    begin
      pnlRampStatus.Visible := True;
      pnlEmbarkStatus.Visible := False;
    end
    else if sender.StateTransport then
    begin
      hostShipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(sender.HostIdTransport));
      if not Assigned(hostShipTemp) then
        Exit;
      pnlRampStatus.Visible := False;
      pnlEmbarkStatus.Visible := True;

      lblHostPlatform.Caption := hostShipTemp.InstanceName;
      lblHostPlatformClass.Caption := hostShipTemp.InstanceClass;

      case sender.MemberLoadState of
        0:  lblPlatformEmbarkStatus.Caption := 'Queue';
        1:  lblPlatformEmbarkStatus.Caption := 'Embark Process';
        2:  lblPlatformEmbarkStatus.Caption := 'Standby';
        3:  lblPlatformEmbarkStatus.Caption := 'Ready';
      end;

      case sender.PlatformDomain of
        vhdAir:
        begin
          btnHullView.Visible := False;
          btnMemberTakeOff.Visible := True;
          btnMemberDisembark.Visible := False;
        end;
        vhdSurface, vhdSubsurface :
        begin
          btnHullView.Visible := False;
          btnMemberTakeOff.Visible := False;
          btnMemberDisembark.Visible := True;
        end;
        vhdLand:
        begin
          if (sender.PlatformCategory = 2) and (sender.PlatformType = 0) then
          begin
            btnHullView.Visible := False;
            btnMemberTakeOff.Visible := False;
            btnMemberDisembark.Visible := True;
          end
          else
          begin
            btnHullView.Visible := True;
            btnMemberTakeOff.Visible := False;
            btnMemberDisembark.Visible := False;
          end;
        end;
        vhdAmphibious:
        begin
          btnHullView.Visible := True;
          btnMemberTakeOff.Visible := False;
          btnMemberDisembark.Visible := False;
        end;
      end;
    end
    else
    begin
      pnlPlatformDetails.Height := 130;
      pnlInfoKapal.Height := 130;
    end;

    {$ENDREGION}

    DisableBtnTransportOnShip;

//    fmInputTrackId.Vehicle  := sender;
    btnEmbark.Enabled       := False;
    btnTransportEmbarkasi.Enabled := False;
    {$ENDREGION}

    {Mengisi list platform Air}
    RefreshAirCarriedTransport(TransportHostShipID);

    {Mengisi list personel}
    RefreshPersonelCarriedTransport(TransportHostShipID);

    {Mengisi list landing craft}
    RefreshLandingCraftCarriedTransport(TransportHostShipID);

    {Mengisi list AmphibiousLand}
    RefreshAmphibhiousLandCarriedTransport(TransportHostShipID);
  end;

  RefreshTransportBaseData;
end;

procedure TfrmToteDisplay.RefreshAirCarriedTransport(HostShipID: Integer);
var
  i : Integer;
  hostShipTemp : TT3Vehicle;
  memberShipTemp : TT3Vehicle;

begin
  lvAirCarried.Items.Clear;

  hostShipTemp := TT3Vehicle(simMgrClient.SimPlatforms.getObjectByInstanceIndex(HostShipID));

  if not Assigned (hostShipTemp) then
    Exit;

  {$REGION ' Header Info '}
  lblMaxCapacityHanger.Caption := IntToStr(hostShipTemp.UnitCapability.FData.Max_Hangar_Capacity);
  lblFreeCapacityHanger.Caption := IntToStr(hostShipTemp.UnitCapability.FData.Max_Hangar_Capacity - hostShipTemp.CurrentHanggarCapacity) ;
  lblCurrentWeightHanger.Caption := FormatFloat('0.##',hostShipTemp.CurrentHanggarWeight) + ' Ton';
  {$ENDREGION}

  for i := 0 to hostShipTemp.MemberTransportList.Count - 1 do
  begin
    memberShipTemp := TT3Vehicle(hostShipTemp).MemberTransportList.Items[i];

    if memberShipTemp.PlatformDomain <> vhdAir then
      Continue;

    {$REGION ' Memasukkan data kedalam list item '}
    with lvAirCarried.Items.Add do
    begin
      Caption := IntToStr(memberShipTemp.InstanceIndex);
      SubItems.Add(memberShipTemp.InstanceName);
      SubItems.Add(memberShipTemp.Track_ID);
      SubItems.Add(FormatFloat('0.##',memberShipTemp.SumCurrentWeight));

      case memberShipTemp.MemberLoadState of
        0 : SubItems.Add('Queue');
        1 : SubItems.Add('Embark Process');
        2 : SubItems.Add('Standby');
        3 : SubItems.Add('Ready');
      end;
    end;
    {$ENDREGION}

  end;
end;

procedure TfrmToteDisplay.RefreshPersonelCarriedTransport(HostShipID: Integer);
var
  i : Integer;
  hostShipTemp  : TT3Vehicle;
  memberShipTemp : TT3Vehicle;

begin
  lvPersonelCarried.Items.Clear;

  hostShipTemp := TT3Vehicle(simMgrClient.SimPlatforms.getObjectByInstanceIndex(HostShipID));

  if not Assigned(hostShipTemp) then
    Exit;

  {$REGION ' Header Info '}
  lblMaxCapacityPersonel.Caption := IntToStr(hostShipTemp.UnitCapability.FData.Max_Personnel_Capacity);
  lblFreeCapacityPersonel.Caption := IntToStr(hostShipTemp.UnitCapability.FData.Max_Personnel_Capacity - hostShipTemp.CurrentPersonelCapacity);
  lblCurrentWeightPersonel.Caption := FormatFloat('0.##',hostShipTemp.CurrentPersonelWeight) + ' Ton';
  {$ENDREGION}

  for i := 0 to TT3Vehicle(hostShipTemp).MemberTransportList.Count - 1 do
  begin
    memberShipTemp := TT3Vehicle(hostShipTemp).MemberTransportList.Items[i];

    if (memberShipTemp.PlatformDomain <>  vhdLand) then
      Continue;

    if (memberShipTemp.PlatformCategory <>  2) then
      Continue;

    if (memberShipTemp.PlatformType <>  0) then
      Continue;

    {$REGION ' Memasukkan data kedalam list item '}
    with lvPersonelCarried.Items.Add do
    begin
      Caption := IntToStr(memberShipTemp.InstanceIndex);
      SubItems.Add(memberShipTemp.InstanceName);
      SubItems.Add(memberShipTemp.Track_ID);
      SubItems.Add(FormatFloat('0.##',memberShipTemp.SumCurrentWeight));

      case memberShipTemp.MemberLoadState of
        0 : SubItems.Add('Queue');
        1 : SubItems.Add('Embark Process');
        2 : SubItems.Add('Standby');
        3 : SubItems.Add('Ready');
      end;
    end;
    {$ENDREGION}
  end;
end;

procedure TfrmToteDisplay.RefreshAmphibhiousLandCarriedTransport(HostShipID: Integer);
var
  i : Integer;
  hostShipTemp :  TT3PlatformInstance;
//  hostShipTemp : TT3Vehicle;
  memberShipTemp : TT3Vehicle;
  WideScale : Double;

  maxSpaceHullTemp : Double;

begin
  lvAmphibiousandLandCarried.Items.Clear;

//  hostShipTemp := TT3Vehicle(simMgrClient.SimPlatforms.getObjectByInstanceIndex(HostShipID));
  hostShipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(HostShipID));

  if not Assigned(hostShipTemp) then
    Exit;

  {$REGION ' Header Info '}
  maxSpaceHullTemp := hostShipTemp.UnitCapability.FData.Deck_Width * hostShipTemp.UnitCapability.FData.Deck_Length;
  lblMaxSpaceHull.Caption     := FormatFloat('0.##',maxSpaceHullTemp) + ' Feet²';
  lblFreeSpaceHull.Caption := FormatFloat('0.##',maxSpaceHullTemp - TT3Vehicle(hostShipTemp).CurrentHullSpace) + ' Feet²';
  lblCurrentWeightHull.Caption := FormatFloat('0.##',TT3Vehicle(hostShipTemp).CurrentHullWeight) + ' Ton';
  {$ENDREGION}

  for i := 0 to TT3Vehicle(hostShipTemp).MemberTransportList.Count - 1 do
  begin
    memberShipTemp := TT3Vehicle(hostShipTemp).MemberTransportList.Items[i];

    if (memberShipTemp.PlatformDomain = vhdAir) then
      Continue;

    if (memberShipTemp.PlatformDomain =  vhdSurface) then
      Continue;

    if (memberShipTemp.PlatformDomain =  vhdSubsurface) then
      Continue;

    if (memberShipTemp.PlatformDomain =  vhdLand) and (memberShipTemp.PlatformCategory =  2) and (memberShipTemp.PlatformType =  0) then
      Continue;

    {$REGION ' Memasukkan data kedalam list item '}
    with lvAmphibiousandLandCarried.Items.Add do
    begin
      Caption := IntToStr(memberShipTemp.InstanceIndex);
      SubItems.Add(memberShipTemp.InstanceName);
      SubItems.Add(memberShipTemp.Track_ID);
      SubItems.Add(FormatFloat('0.##',memberShipTemp.SumCurrentWeight));

      WideScale := (memberShipTemp.VehicleDefinition.FData.Length * memberShipTemp.VehicleDefinition.FData.Width );
      SubItems.Add(FormatFloat('0.##', WideScale));

      case memberShipTemp.MemberLoadState of
        0 : SubItems.Add('Queue');
        1 : SubItems.Add('Embark Process');
        2 : SubItems.Add('Standby');
        3 : SubItems.Add('Ready');
      end;
    end;
    {$ENDREGION}
  end;
end;

procedure TfrmToteDisplay.RefreshLandingCraftCarriedTransport(HostShipID: Integer);
var
  i : Integer;
  HostShip : TT3PlatformInstance;
  tempTransport : TT3Vehicle;

begin
  lvLandingCraftCarried.Items.Clear;

  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(HostShipID));

  if not Assigned(HostShip) then
    Exit;

  for i := 0 to TT3Vehicle(HostShip).MemberTransportList.Count - 1 do
  begin
    tempTransport := TT3Vehicle(HostShip).MemberTransportList.Items[i];

    if (tempTransport.PlatformDomain = vhdAir) then
      Continue;

    if (tempTransport.PlatformDomain =  vhdLand) then
      Continue;

    if (tempTransport.PlatformDomain =  vhdAmphibious) then
      Continue;

    {$REGION ' Memasukkan data kedalam list item '}
    with lvLandingCraftCarried.Items.Add do
    begin
      Caption := IntToStr(tempTransport.InstanceIndex);
      SubItems.Add(tempTransport.InstanceName);
      SubItems.Add(tempTransport.Track_ID);
      SubItems.Add(FormatFloat('0.##',tempTransport.SumCurrentWeight));

      case tempTransport.MemberLoadState of
        0 : SubItems.Add('Queue');
        1 : SubItems.Add('Embark Process');
        2 : SubItems.Add('Standby');
        3 : SubItems.Add('Ready');
      end;
    end;
    {$ENDREGION}
  end;
end;

procedure TfrmToteDisplay.lvAirCarriedSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  HostShip : TT3PlatformInstance;
begin
  {$REGION ' Reset button '}
  DisableBtnTransportOnShip;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));
  if not Assigned(HostShip) then
    Exit;

  if HostShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  if Selected then
  begin
    TransportMemberShipID := StrToInt(lvAirCarried.Selected.Caption);
    btnTakeoff.Enabled := True;
  end
end;

procedure TfrmToteDisplay.lvAmphibiousandLandCarriedSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  HostShip : TT3PlatformInstance;
  TempPlatform : TT3Vehicle;
begin
  {$REGION ' Reset button '}
  DisableBtnTransportOnShip;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(HostShip) then
    Exit;

  if HostShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  if Selected then
  begin
    TransportMemberShipID := StrToInt(lvAmphibiousandLandCarried.Selected.Caption);
    TempPlatform := TT3Vehicle(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportMemberShipID));

    if TempPlatform.isInDisembarkArea then
    begin
      case TempPlatform.MemberPosDisembark of
        0: lblDisembarkStatus.Caption := 'Platform is in front ramp disembark area';
        1: lblDisembarkStatus.Caption := 'Platform is in starboard ramp disembark area';
        2: lblDisembarkStatus.Caption := 'Platform is in back ramp disembark area';
        3: lblDisembarkStatus.Caption := 'Platform is in port ramp disembark area';
      end;

      btnAmphibiousLandDisembark.Enabled := True;
      btnAmphibiousLandDisembarkWith.Enabled := True;
    end
    else
    begin
      lblDisembarkStatus.Caption := 'Platform is not in disembark area';
      btnAmphibiousLandDisembark.Enabled := False;
      btnAmphibiousLandDisembarkWith.Enabled := False;
    end;
  end
  else
  begin
    lblDisembarkStatus.Caption := 'No selected platform';
    btnAmphibiousLandDisembark.Enabled := False;
    btnAmphibiousLandDisembarkWith.Enabled := False;
  end;

  btnTransportEmbarkasi.Enabled := True;
end;

procedure TfrmToteDisplay.lvPersonelCarriedSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  HostShip : TT3PlatformInstance;
begin
  {$REGION ' Reset button '}
  DisableBtnTransportOnShip;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(HostShip) then
    Exit;

  if HostShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  if Selected then
  begin
    TransportMemberShipID := StrToInt(lvPersonelCarried.Selected.Caption);
    btnPersonelDebarkasi.Enabled := True;
  end;
end;

procedure TfrmToteDisplay.tvPersonelCarriedMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, j                : Integer;
  _PersonelQuantity   : Integer;
  _PersonelWeight     : Double;

  _OwnShip            : TT3PlatformInstance;
  _Platoon            : TPlatoon;
  _Group              : TGroup;

begin
  {$REGION ' Reset button '}
  DisableBtnTransportOnShip;

  btnPersonelDebarkasiWith.Caption := 'Disembark with';
  fmDisembarkWith.lvDisembarkWithPf.Items.Clear;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  _OwnShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

   if not Assigned(_OwnShip) then
    Exit;

  if _OwnShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan tree view yang dipilih '}
  if tvPersonelCarried.Selected = nil then
    Exit;
  {$ENDREGION}

  if Button = mbLeft then
  begin
    {$REGION ' Pengecekan filter level orbat personel yang dipilih '}
    hoverNode:= tvPersonelCarried.GetNodeAt(X, Y);
    if not Assigned (hoverNode) then
    begin
      MessageDlg('Please re-select group personel', mtInformation, [mbOK], 0);
      Exit;
    end;
    {$ENDREGION}

    {$REGION ' Pengecekan jumlah personel yg dikeluarkan '}

    _PersonelQuantity := 0;
    PersonelOnShipSelected := nil;

    case TOrbatLevel(hoverNode.Level) of
      {$REGION ' Jk yg diselect Brigade and Batalyon Section '}
      olBrigade, olBatalyon :
      begin
        exit;
      end;
      {$ENDREGION}

      {$REGION ' Jk yg diselect Kompi Section '}
      olKompi :
      begin
        PersonelOnShipSelected  := TKompi(hoverNode.Data);
        for i := 0 to TKompi(PersonelOnShipSelected).PlatoonList.Count - 1 do
        begin
          _Platoon := TKompi(PersonelOnShipSelected).PlatoonList[i];
          for j := 0 to _Platoon.GroupList.Count - 1 do
          begin
            _Group := _Platoon.GroupList[j];
            _PersonelQuantity := _PersonelQuantity + _Group.Quantity;
          end;
        end;
      end;
      {$ENDREGION}

      {$REGION ' Jk yg diselect Platoon Section '}
      olPlatoon :
      begin
        PersonelOnShipSelected  := TPlatoon(hoverNode.Data);
        for i := 0 to TPlatoon(PersonelOnShipSelected).GroupList.Count - 1 do
        begin
          _Group := TPlatoon(PersonelOnShipSelected).GroupList[i];
          _PersonelQuantity := _PersonelQuantity + _Group.Quantity;
        end;
      end;
      {$ENDREGION}

      {$REGION ' Jk yg diselect Group Section '}
      olGroup :
      begin
        PersonelOnShipSelected  := TGroup(hoverNode.Data);
        _PersonelQuantity := TGroup(PersonelOnBaseSelected).Quantity;

        btnPersonelDebarkasi.Enabled := True;

        if not TT3Vehicle(_OwnShip).FromEmbarkWith then
          btnPersonelDebarkasiWith.Enabled := True;
      end;
      {$ENDREGION}
    end;

    PersonelOnShipSelected.selected := True;
    {$ENDREGION}

    {$REGION ' Pengecekan total berat personel yg dikeluarkan '}
    _PersonelWeight := (_PersonelQuantity * C_Personel_Weight);
    {$ENDREGION}

    {$REGION ' Code u/ disembark with, sementara tidak dipake dulu'}
//    j := 0;
//    for i := 0 to lvAmphibiousandLandCarried.Items.Count - 1 do
//    begin
//      {cari kapasitas personel dan berat target}
//      PfOnVehicle := TT3Vehicle(_OwnShip).TransportedList.Items[i];
//      targetpf := SimManager.Scenario.GetPiRuntimePlatform(PfOnVehicle.IdxVehicle);
//      TargetedCap := targetpf.Capability.FData.Max_Personnel_Capacity;
//      TargetedWeightCap := (targetpf.Capability.FData.Max_Hangar_Weight) +
//        (targetpf.Capability.FData.Max_Deck_Weight) +
//        (targetpf.Capability.FData.Max_Personnel_Capacity * C_Personel_Weight);
//
//      {Cek apakah kapasitas dan beratnya memenuhi}
//      if (_PersonelQuantity <= TargetedCap) and (_PersonelWeight <= TargetedWeightCap) then
//      begin
//        {isi daftar platform yang dapat dimasuki}
//        with fmDisembarkWith.lvDisembarkWithPf.Items.Add do
//        begin
//          j := j + 1;
//          Caption := IntToStr(j);
//          SubItems.Add(PfOnVehicle.Identifier);
//          SubItems.Add(PfOnVehicle.TrackID);
//        end;
//      end;
//    end;
    {$ENDREGION}
  end;
end;

procedure TfrmToteDisplay.btnTakeOffClick(Sender: TObject);
var
  HostShip : TT3PlatformInstance;
  MemberShip : TT3PlatformInstance;

  RecTransport : TRecCmd_Transport;

begin

  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(HostShip) then
    Exit;

  if HostShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang diangkut '}
  MemberShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportMemberShipID));

  if MemberShip = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Mengirim Paket '}
  RecTransport.OrderID := CORD_ID_disembark;
  RecTransport.HostPlatformID := HostShip.InstanceIndex;
  RecTransport.MemberPlatformID := MemberShip.InstanceIndex;

  RecTransport.MemberPlatformName := MemberShip.InstanceName;
  RecTransport.TrackID := TT3Vehicle(MemberShip).Track_ID;
  RecTransport.StateTransport := False;

  RecTransport.MemberPlatform3DName := TT3Vehicle(MemberShip).VehicleDefinition.FData.VBS_Class_Name;
  RecTransport.MemberDomain := MemberShip.PlatformDomain;
  RecTransport.TurnRate := TT3Vehicle(MemberShip).UnitMotion.FData.Standard_Turn_Rate;
  RecTransport.DiveRate := TT3Vehicle(MemberShip).UnitMotion.FData.Vertical_Accel;
  RecTransport.InitSpeed  := 0;
  RecTransport.InitAltitude  := 25;
  RecTransport.InitCourse := HostShip.Course;

  simMgrClient.netSend_CmdTransport(RecTransport);
  {$ENDREGION}

  btnTakeoff.Enabled := False;
end;

procedure TfrmToteDisplay.btnMemberDisembarkClick(Sender: TObject);
var
  hostShipTemp : TT3PlatformInstance;
  memberShipTemp : TT3PlatformInstance;

  RecTransport : TRecCmd_Transport;
  tempRamp : TRamp;

  isHaveRampTemp : Boolean;
  i : Integer;
begin

  {$REGION ' Pengecekan kapal yang diangkut '}
  memberShipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(memberShipTemp) then
    Exit;

  if memberShipTemp = nil then
  begin
    MessageDlg('Please re-select The Group Personel', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  hostShipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TT3Vehicle(memberShipTemp).HostIdTransport));

  if not Assigned(hostShipTemp) then
    Exit;

  if hostShipTemp = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan Perlakuan berdasarkan kebutuhan '}
  if (memberShipTemp.PlatformDomain = vhdSurface) or  (memberShipTemp.PlatformDomain = vhdSubsurface) then
  begin
    if (TT3Vehicle(memberShipTemp).VehicleDefinition.FData.VBS_Class_Name = 'Def_Transport_Ship_(LCU)') or
    (TT3Vehicle(memberShipTemp).VehicleDefinition.FData.VBS_Class_Name = 'LCU') then
    begin
      {$REGION ' LCU Process '}
      tempRamp := TT3Vehicle(hostShipTemp).RampList[2];
      if not tempRamp.State then
      begin
        MessageDlg('Rampa Belakang Belum Tebuka', mtInformation, [mbOK], 0);
        Exit;
      end;

      RecTransport.InitSpeed  := -2;
      RecTransport.RampID  := 2;
      RecTransport.InitCourse := hostShipTemp.Course;
      {$ENDREGION}
    end
    else
    begin
      RecTransport.InitSpeed  := 2;
      RecTransport.InitCourse := hostShipTemp.Course;
    end;
  end
  else if memberShipTemp.PlatformDomain = vhdAir then
  begin
    {$REGION ' Take Off Process '}
    RecTransport.InitSpeed  := 0;
    RecTransport.InitAltitude  := 25;
    RecTransport.InitCourse := hostShipTemp.Course;
    {$ENDREGION}
  end
  else if (memberShipTemp.PlatformDomain = vhdLand) or (memberShipTemp.PlatformDomain = vhdAmphibious) then
  begin
    {$REGION ' State Rampa '}
    isHaveRampTemp := False;
    for i := 0 to TT3Vehicle(hostShipTemp).RampList.Count-1 do
    begin
      tempRamp := TT3Vehicle(hostShipTemp).RampList[i];

      if tempRamp.Available then
      begin
        isHaveRampTemp := tempRamp.Available;
        Break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Pengecekan Status rampa '}
    case TT3Vehicle(memberShipTemp).MemberPosDisembark of
      0: {Depan}
      begin
        tempRamp := TT3Vehicle(hostShipTemp).RampList[0];
        if not tempRamp.State then
        begin
          MessageDlg('Rampa Depan Belum Tebuka', mtInformation, [mbOK], 0);
          Exit;
        end;
      end;
      1: {Kanan}
      begin
        tempRamp := TT3Vehicle(hostShipTemp).RampList[1];
        if not tempRamp.State then
        begin
          MessageDlg('Rampa Kanan Belum Tebuka', mtInformation, [mbOK], 0);
          Exit;
        end;
      end;
      2: {Belakang}
      begin
        tempRamp := TT3Vehicle(hostShipTemp).RampList[2];
        if not tempRamp.State then
        begin
          MessageDlg('Rampa Belakang Belum Tebuka', mtInformation, [mbOK], 0);
          Exit;
        end;
      end;
      3: {Kiri}
      begin
        tempRamp := TT3Vehicle(hostShipTemp).RampList[3];
        if not tempRamp.State then
        begin
          MessageDlg('Rampa Kiri Belum Tebuka', mtInformation, [mbOK], 0);
          Exit;
        end;
      end;
    end;
    {$ENDREGION}

    RecTransport.RampID  := TT3Vehicle(memberShipTemp).MemberPosDisembark;

    {$REGION ' Penentuan arah keluar '}
    case RecTransport.RampID of
      0 : RecTransport.InitCourse := hostShipTemp.Course;
      1 : RecTransport.InitCourse := ValidateDegree(hostShipTemp.Course + 90);
      2 : RecTransport.InitCourse := ValidateDegree(hostShipTemp.Course + 180);
      3 : RecTransport.InitCourse := ValidateDegree(hostShipTemp.Course + 270);
    end;
    {$ENDREGION}

    RecTransport.InitSpeed  := 2;
    RecTransport.InitAltitude  := 0;
  end
  else
  begin
    RecTransport.InitSpeed  := 2;
    RecTransport.InitCourse := hostShipTemp.Course;
  end;
  {$ENDREGION}

  {$REGION ' Mengirim Paket '}
  RecTransport.OrderID := CORD_ID_disembark;
  RecTransport.HostPlatformID := hostShipTemp.InstanceIndex;
  RecTransport.MemberPlatformID := memberShipTemp.InstanceIndex;

  RecTransport.MemberPlatformName := memberShipTemp.InstanceName;
  RecTransport.TrackID := TT3Vehicle(memberShipTemp).Track_ID;
  RecTransport.StateTransport := False;

  RecTransport.MemberPlatform3DName := TT3Vehicle(memberShipTemp).VehicleDefinition.FData.VBS_Class_Name;
  RecTransport.MemberDomain := memberShipTemp.PlatformDomain;
  RecTransport.TurnRate := TT3Vehicle(memberShipTemp).UnitMotion.FData.Standard_Turn_Rate;
  RecTransport.DiveRate := TT3Vehicle(memberShipTemp).UnitMotion.FData.Vertical_Accel;

  simMgrClient.netSend_CmdTransport(RecTransport);
  {$ENDREGION}

  btnMemberDisembark.Visible := False;

end;

procedure TfrmToteDisplay.btnMemberTakeOffClick(Sender: TObject);
var
  hostShipTemp : TT3PlatformInstance;
  memberShipTemp : TT3PlatformInstance;

  RecTransport : TRecCmd_Transport;

begin

  {$REGION ' Pengecekan kapal yang diangkut '}
  memberShipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(memberShipTemp) then
    Exit;

  if memberShipTemp = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  hostShipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TT3Vehicle(memberShipTemp).HostIdTransport));

  if not Assigned(hostShipTemp) then
    Exit;

  if hostShipTemp = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Mengirim Paket '}
  RecTransport.OrderID := CORD_ID_disembark;
  RecTransport.HostPlatformID := hostShipTemp.InstanceIndex;
  RecTransport.MemberPlatformID := memberShipTemp.InstanceIndex;

  RecTransport.MemberPlatformName := memberShipTemp.InstanceName;
  RecTransport.TrackID := TT3Vehicle(memberShipTemp).Track_ID;
  RecTransport.StateTransport := False;

  RecTransport.MemberPlatform3DName := TT3Vehicle(memberShipTemp).VehicleDefinition.FData.VBS_Class_Name;
  RecTransport.MemberDomain := memberShipTemp.PlatformDomain;
  RecTransport.TurnRate := TT3Vehicle(memberShipTemp).UnitMotion.FData.Standard_Turn_Rate;
  RecTransport.DiveRate := TT3Vehicle(memberShipTemp).UnitMotion.FData.Vertical_Accel;
  RecTransport.InitSpeed  := 0;
  RecTransport.InitAltitude  := 25;
  RecTransport.InitCourse := hostShipTemp.Course;

  simMgrClient.netSend_CmdTransport(RecTransport);
  {$ENDREGION}

  btnTakeoff.Visible := False;
end;

procedure TfrmToteDisplay.btnAmphibiousLandDisembarkClick(Sender: TObject);
var
  HostShip : TT3PlatformInstance;
  MemberShip : TT3Vehicle;

  RecTransport : TRecCmd_Transport;
  tempRamp : TRamp;

begin

  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(HostShip) then
    Exit;

  if HostShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang diangkut '}
  MemberShip := TT3Vehicle(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportMemberShipID));

  if MemberShip = nil then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan Status rampa '}

  case MemberShip.MemberPosDisembark of
    0: {Depan}
    begin
      tempRamp := TT3Vehicle(HostShip).RampList[0];
      if not tempRamp.State then
      begin
        MessageDlg('Rampa Depan Belum Tebuka', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    1: {Kanan}
    begin
      tempRamp := TT3Vehicle(HostShip).RampList[1];
      if not tempRamp.State then
      begin
        MessageDlg('Rampa Kanan Belum Tebuka', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    2: {Belakang}
    begin
      tempRamp := TT3Vehicle(HostShip).RampList[2];
      if not tempRamp.State then
      begin
        MessageDlg('Rampa Belakang Belum Tebuka', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    3: {Kiri}
    begin
      tempRamp := TT3Vehicle(HostShip).RampList[3];
      if not tempRamp.State then
      begin
        MessageDlg('Rampa Kiri Belum Tebuka', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Mengirim Paket '}
  RecTransport.OrderID := CORD_ID_disembark;
  RecTransport.HostPlatformID := HostShip.InstanceIndex;
  RecTransport.MemberPlatformID := MemberShip.InstanceIndex;

  RecTransport.MemberPlatformName := MemberShip.InstanceName;
  RecTransport.TrackID := TT3Vehicle(MemberShip).Track_ID;
  RecTransport.StateTransport := False;

  RecTransport.MemberPlatform3DName := TT3Vehicle(MemberShip).VehicleDefinition.FData.VBS_Class_Name;
  RecTransport.MemberDomain := MemberShip.PlatformDomain;
  RecTransport.TurnRate := TT3Vehicle(MemberShip).UnitMotion.FData.Standard_Turn_Rate;
  RecTransport.DiveRate := TT3Vehicle(MemberShip).UnitMotion.FData.Vertical_Accel;
  RecTransport.InitSpeed  := 2;
  RecTransport.InitAltitude  := 0;
  RecTransport.RampID  := TT3Vehicle(MemberShip).MemberPosDisembark;

  {$REGION ' Penentuan arah keluar '}
  case RecTransport.RampID of
    0 : RecTransport.InitCourse := HostShip.Course;
    1 : RecTransport.InitCourse := ValidateDegree(HostShip.Course + 90);
    2 : RecTransport.InitCourse := ValidateDegree(HostShip.Course + 180);
    3 : RecTransport.InitCourse := ValidateDegree(HostShip.Course + 270);
  end;
  {$ENDREGION}

  simMgrClient.netSend_CmdTransport(RecTransport);
  {$ENDREGION}

  btnAmphibiousLandDisembark.Enabled := False;
end;

procedure TfrmToteDisplay.btnAmphibiousLandDisembarkWithClick(Sender: TObject);
begin
  fmDisembarkWith := TfmDisembarkWith.Create(Self);
  try
    with fmDisembarkWith do
    begin
      OldHostPlatform := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));
      MemberPlatform := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportMemberShipID));
      ShowModal;
    end;
  finally
    fmDisembarkWith.Free;
  end;
end;

procedure TfrmToteDisplay.btnPersonelDebarkasiClick(Sender: TObject);
var
  i : Integer;
  rampTemp : TRamp;
  hostShipTemp : TT3PlatformInstance;
  memberShipTemp : TT3Vehicle;
  isHaveRampTemp : Boolean;
  RecTransport : TRecCmd_Transport;
begin

  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  hostShipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(hostShipTemp) then
    Exit;

  if hostShipTemp = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan pemilihan personel '}
  memberShipTemp := TT3Vehicle(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportMemberShipID));
  if memberShipTemp = nil then
  begin
    MessageDlg('Please re-select The Group Personel', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' State Rampa '}
  isHaveRampTemp := False;
  for i := 0 to TT3Vehicle(hostShipTemp).RampList.Count-1 do
  begin
    rampTemp := TT3Vehicle(hostShipTemp).RampList[i];

    if rampTemp.Available then
    begin
      isHaveRampTemp := rampTemp.Available;
      Break;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan Status rampa '}

  if isHaveRampTemp then
  begin
    case memberShipTemp.MemberPosDisembark of
      0: {Depan}
      begin
        rampTemp := TT3Vehicle(hostShipTemp).RampList[0];
        if not rampTemp.State then
        begin
          MessageDlg('Rampa Depan Belum Tebuka', mtInformation, [mbOK], 0);
          Exit;
        end;
      end;
      1: {Kanan}
      begin
        rampTemp := TT3Vehicle(hostShipTemp).RampList[1];
        if not rampTemp.State then
        begin
          MessageDlg('Rampa Kanan Belum Tebuka', mtInformation, [mbOK], 0);
          Exit;
        end;
      end;
      2: {Belakang}
      begin
        rampTemp := TT3Vehicle(hostShipTemp).RampList[2];
        if not rampTemp.State then
        begin
          MessageDlg('Rampa Belakang Belum Tebuka', mtInformation, [mbOK], 0);
          Exit;
        end;
      end;
      3: {Kiri}
      begin
        rampTemp := TT3Vehicle(hostShipTemp).RampList[3];
        if not rampTemp.State then
        begin
          MessageDlg('Rampa Kiri Belum Tebuka', mtInformation, [mbOK], 0);
          Exit;
        end;
      end;
    end;

    RecTransport.RampID  := TT3Vehicle(memberShipTemp).MemberPosDisembark;

    {$REGION ' Penentuan arah keluar '}
    case RecTransport.RampID of
      0 : RecTransport.InitCourse := hostShipTemp.Course;
      1 : RecTransport.InitCourse := ValidateDegree(hostShipTemp.Course + 90);
      2 : RecTransport.InitCourse := ValidateDegree(hostShipTemp.Course + 180);
      3 : RecTransport.InitCourse := ValidateDegree(hostShipTemp.Course + 270);
    end;
    {$ENDREGION}

  end
  else
  begin
    RecTransport.RampID  := 0;
    RecTransport.InitCourse := hostShipTemp.Course;
  end;
  {$ENDREGION}

  {$REGION ' Mengirim Paket '}
  RecTransport.OrderID := CORD_ID_disembark;
  RecTransport.HostPlatformID := hostShipTemp.InstanceIndex;
  RecTransport.MemberPlatformID := memberShipTemp.InstanceIndex;

  RecTransport.MemberPlatformName := memberShipTemp.InstanceName;
  RecTransport.TrackID := TT3Vehicle(memberShipTemp).Track_ID;
  RecTransport.StateTransport := False;

  RecTransport.MemberPlatform3DName := TT3Vehicle(memberShipTemp).VehicleDefinition.FData.VBS_Class_Name;
  RecTransport.MemberDomain := memberShipTemp.PlatformDomain;
  RecTransport.TurnRate := TT3Vehicle(memberShipTemp).UnitMotion.FData.Standard_Turn_Rate;
  RecTransport.DiveRate := TT3Vehicle(memberShipTemp).UnitMotion.FData.Vertical_Accel;
  RecTransport.InitSpeed  := 2;
  RecTransport.InitAltitude  := 0;

  simMgrClient.netSend_CmdTransport(RecTransport);
  {$ENDREGION}

  btnPersonelDebarkasi.Enabled := False;

end;

procedure TfrmToteDisplay.btnPersonelDebarkasiWithClick(Sender: TObject);
var
  hostShipTemp : TT3PlatformInstance;
begin
  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  hostShipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(hostShipTemp) then
    Exit;

  if hostShipTemp = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan pemilihan personel '}
  if PersonelOnShipSelected = nil then
  begin
    MessageDlg('Please re-select The Group Personel', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Setting button Disembark With '}
  if btnPersonelDebarkasiWith.Caption = 'Disembark with' then
  begin
    btnPersonelDebarkasiWith.Caption := 'OK';
    btnPersonelDebarkasi.Enabled := False;

    Exit;
  end
  else
  begin
    btnPersonelDebarkasiWith.Caption := 'Disembark with';
  end;
  {$ENDREGION}

  {$REGION ' Mengirim Paket '}
  RecDisembark.SessionID        := simMgrClient.SessionID;
  RecDisembark.ParentPlatformID := hostShipTemp.InstanceIndex;
  RecDisembark.EmbarkPlatformID := 0;
  RecDisembark.IDPlatformClass  := LandingPlatformID;
  RecDisembark.Hosted_Index     := 0;

  StrToChar(LandingPlatformName, RecDisembark.LaunchName);
  StrToChar(LandingPlatformName, RecDisembark.TrackIdent);

  RecDisembark.QueueNum         := TransportMemberShipID-1;
  RecDisembark.GrpID            := simMgrClient.FMyCubGroup.FData.Group_Index;

  {Pinjem variabel}
  RecDisembark.Quantity         := 101; {100: u/disembark; 101: disembarkwith}
  RecDisembark.Quantity_Group_Personal := PersonelOnShipSelected.Id; {u/ id group personel yg di disembark}

  {$REGION ' Penentuan arah keluar '}
  case TT3Vehicle(ToteSelectedPlatform).VehicleDefinition.FData.GangwayPosition of
    0 : //front Door
      begin
        RecDisembark.InitCourse := ToteSelectedPlatform.Course;
        RecDisembark.InitSpeed  := 2;
      end;
    1 : //Back Door
      begin
        RecDisembark.InitCourse := ValidateDegree(ToteSelectedPlatform.Course + 180);
        RecDisembark.InitSpeed  := 2;
      end;
  end;
  {$ENDREGION}

  RecDisembark.OrderID := CORD_ID_INITIATE;

  simMgrClient.netSend_CmdDisembarkTransport(RecDisembark);
  {$ENDREGION}

  btnPersonelDebarkasiWith.Enabled := False;
  isSender := True;
end;

//procedure TfrmToteDisplay.onLaunchEmbark(rec: TRecCmd_Embark);
//begin
//  rec.OrderID := CORD_ID_LAUNCH;
//
//  if isSender then
//  begin
//    isSender := False;
//    Sleep(500);
//    simMgrClient.netSend_CmdDisembarkTransport(rec);
//  end;
//end;

procedure TfrmToteDisplay.btnRampHandleClick(Sender: TObject);
var
  HostShip      : TT3PlatformInstance;
  _RecTransport : TRecCmd_RampController;

  tempRamp : TRamp;

begin
  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(HostShip) then
    Exit;

  if HostShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  _RecTransport.PlatformID  := HostShip.InstanceIndex;
  _RecTransport.RampID := TButton(Sender).Tag;

  tempRamp := TT3Vehicle(HostShip).RampList[TButton(Sender).Tag];

  RampAnimation(TButton(Sender).Tag);

  if tempRamp.State then
    _RecTransport.RampState := Byte(CORD_ID_CLOSE)
  else
    _RecTransport.RampState := Byte(CORD_ID_OPEN);

  simMgrClient.netSend_cmdRampController(_RecTransport);
end;

procedure TfrmToteDisplay.btnEnviClick(Sender: TObject);
var
  button : TRzBmpButton;
  tag :  Integer;
begin
  button := Sender as TRzBmpButton;
  tag := button.Tag;

  if not button.Down then button.Down := True;


  case tag of
    1: trbAttenCloud.Position := 0;
    2: trbAttenCloud.Position := 1;
    3: trbAttenCloud.Position := 2;
    4: trbAttenCloud.Position := 3;
    5: trbAttenRainRate.Position := 0;
    6: trbAttenRainRate.Position := 1;
    7: trbAttenRainRate.Position := 2;
    8: trbSeaState.Position := 0;
    9: trbSeaState.Position := 1;
    10: trbSeaState.Position := 2;
    11: trbSeaState.Position := 3;
    12: trbSeaState.Position := 4;
    13: trbSeaState.Position := 5;
    14: trbSeaState.Position := 6;
    15: trbSeaState.Position := 7;
  end;
end;

function TfrmToteDisplay.RampAnimation(Ramp: Integer): Boolean;
var
  HostShip      : TT3PlatformInstance;
  tempRamp: TRamp;
begin
  Result:= False;
  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(HostShip) then
    Exit;

  if HostShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  tempRamp := TT3Vehicle(HostShip).RampList[Ramp];

  case Ramp of
    0:
    begin
      if tempRamp.State then
      begin
        while pnlRampFrontDoor.Top <> 25 do
        begin
          pnlRampFrontDoor.Top := pnlRampFrontDoor.Top - 19;
          Sleep(300);
        end;
        Result:= True;
      end
      else
      begin
        while pnlRampFrontDoor.Top <> 82 do
        begin
          pnlRampFrontDoor.Top := pnlRampFrontDoor.Top + 19;
          Sleep(300);
        end;
        Result:= True;
      end;
    end;
    1:
    begin
      if tempRamp.State then
      begin
        while pnlRampStarboardDoor.Top <> 25 do
        begin
          pnlRampStarboardDoor.Top := pnlRampStarboardDoor.Top - 19;
          Sleep(300);
        end;
        Result:= True;
      end
      else
      begin
        while pnlRampStarboardDoor.Top <> 82 do
        begin
          pnlRampStarboardDoor.Top := pnlRampStarboardDoor.Top + 19;
          Sleep(300);
        end;
        Result:= True;
      end;
    end;
    2:
    begin
      if tempRamp.State then
      begin
        while pnlRampBackDoor.Top <> 25 do
        begin
          pnlRampBackDoor.Top := pnlRampBackDoor.Top - 19;
          Sleep(300);
        end;
        Result:= True;
      end
      else
      begin
        while pnlRampBackDoor.Top <> 82 do
        begin
          pnlRampBackDoor.Top := pnlRampBackDoor.Top + 19;
          Sleep(300);
        end;
        Result:= True;
      end;
    end;
    3:
    begin
      if tempRamp.State then
      begin
        while pnlRampPortDoor.Top <> 25 do
        begin
          pnlRampPortDoor.Top := pnlRampPortDoor.Top - 19;
          Sleep(300);
        end;
        Result:= True;
      end
      else
      begin
        while pnlRampPortDoor.Top <> 82 do
        begin
          pnlRampPortDoor.Top := pnlRampPortDoor.Top + 19;
          Sleep(300);
        end;
        Result:= True;
      end;
    end;
  end;
end;

procedure TfrmToteDisplay.btnEmbarkClick(Sender: TObject);
var
  _UsedSpace        : Double;
  _TotalDayaAngkut  : Double;
  _RangeShipAndBase : Double;
  HostShip          : TT3PlatformInstance;

begin
  {$REGION ' Pengecekan kapal yang mengangkut '}
  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(HostShip) then
    Exit;

  if HostShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang diangkut '}
  if TransportedOnBaseSelected = nil then
  begin
    MessageDlg('Please re-select platform on base', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Setting form InputTrackID '}
  with fmInputTrackId do
  begin
    edtName.Text      := TransportedOnBaseSelected.FData.Vehicle_Identifier;
    lblWeight.Caption := FormatFloat('0.00',TransportedOnBaseSelected.FData.Weight);
    lblWidth.Caption  := FormatFloat('0.00',TransportedOnBaseSelected.FData.Width * C_Feet_To_Meter);
    lblLength.Caption := FormatFloat('0.00',TransportedOnBaseSelected.FData.Length * C_Feet_To_Meter);

    btnCancel.Top := 136;
    btnOk.Top := 136;
    Height := 194;
    lblGroup.Visible  := False;
    lstGroup.Visible  := False;
    Label6.Visible    := False;

    if not btnOk.Enabled then
      btnOk.Enabled := True;
  end;
  {$ENDREGION}

  if fmInputTrackId.ShowModal = mrOk then
  begin
    {$REGION ' Pengecekan jarak kapal dgn pangkalan '}
    _RangeShipAndBase := CalcRange(BaseTransport.Longitude, BaseTransport.Latitude, HostShip.PosX, HostShip.PosY);

    if BaseTransport.Radius < _RangeShipAndBase then
    begin
      MessageDlg('Distance must be less than ' + FloatToStr(BaseTransport.Radius) + ' nm from base', mtInformation, [mbOK], 0);
      Exit;
    end;
    {$ENDREGION}

    {$REGION ' Pengecekan Force kapal yang mengangkut dgn pangkalan '}
    if BaseTransport.force <> HostShip.Force_Designation then
    begin
      MessageDlg('Personel must be in the same force with base ', mtInformation, [mbOK], 0);
      Exit;
    end;
    {$ENDREGION}

    {$REGION ' Pengecekan jumlah kapal dipangkalan '}
    if TransportedOnBaseSelected.FData.Quantity < 1 then
    begin
      MessageDlg('There is no more ' + TransportedOnBaseSelected.FData.Vehicle_Identifier + ' in the base', mtInformation, [mbOK], 0);
      Exit;
    end;
    {$ENDREGION}

    {$REGION ' Pengecekan daya angkut total, kapal pengangkut '}
    _TotalDayaAngkut := TT3Vehicle(HostShip).CurrentHanggarWeight + TT3Vehicle(HostShip).CurrentHullWeight +
                        TT3Vehicle(HostShip).CurrentPersonelWeight;

    if TransportedOnBaseSelected.FData.Weight > _TotalDayaAngkut then
    begin
      MessageDlg('Already exceed maximum weight limit', mtInformation, [mbOK], 0);
      Exit;
    end;
    {$ENDREGION}

    {$REGION ' Pengecekan sesuai capability kapal pengangkut '}
    if TransportedOnBaseSelected.FData.Domain = vhdAir then
    begin
      _UsedSpace := (TransportedOnBaseSelected.FData.Length * C_Feet_To_Meter) * (TransportedOnBaseSelected.FData.Width * C_Feet_To_Meter);

      {$REGION ' Pengecekan kapasitas maksimal air carried '}
      if TT3Vehicle(HostShip).CurrentHanggarCapacity < 1 then
      begin
        MessageDlg('Already exceed maximum air capacity', mtInformation, [mbOK], 0);
        Exit;
      end;
      {$ENDREGION}

      case TransportedOnBaseSelected.FData.PlatformType of

        {$REGION ' Pengecekan kemampuan mengangkut fixed wing '}
        0 :
        begin
          if TT3Vehicle(HostShip).UnitCapability.FData.FixedWing_Carried = False then
          begin
            MessageDlg('Embarkation capability is not support for fixed wing', mtInformation, [mbOK], 0);
            Exit;
          end;
        end;
        {$ENDREGION}

        {$REGION ' Pengecekan kemampuan mengangkut heli '}
        1:
        begin
          if TT3Vehicle(HostShip).UnitCapability.FData.Rotary_Carried = False then
          begin
            MessageDlg('Embarkation capability is not support for rotary', mtInformation, [mbOK], 0);
            Exit;
          end;
        end;
        {$ENDREGION}

      end;
    end
    else
    begin

      {$REGION ' Pengecekan kemampuan mengankut kapal lain '}
      if TT3Vehicle(HostShip).VehicleDefinition.FData.GangwayPosition = 3 then
      begin
        MessageDlg('Don''t have transport capability ', mtInformation, [mbOK], 0);
        Exit;
      end
      else
      begin
//        if (not TT3Vehicle(HostShip).isRampOpen) then
//        begin
//          MessageDlg('Please open ramp', mtInformation, [mbOK], 0);
//          Exit;
//        end;
      end;
      {$ENDREGION}

      {$REGION ' Pengecekan kapasitas maksimal Amphibious and Land Carried '}
      _UsedSpace := (TransportedOnBaseSelected.FData.Length * C_Feet_To_Meter) * (TransportedOnBaseSelected.FData.Width * C_Feet_To_Meter);
      if TT3Vehicle(HostShip).CurrentHullSpace < _UsedSpace then
      begin
        MessageDlg('There is not enough space ', mtInformation, [mbOK], 0);
        Exit;
      end;
      {$ENDREGION}
    end;
    {$ENDREGION}

    {$REGION ' Mengirim Paket '}
    RecEmbark.HostPlatformID  := HostShip.InstanceIndex;
    RecEmbark.BaseIdentifier    := BaseTransport.identifier;
    RecEmbark.MemberPlatformID        := TransportedOnBaseSelected.FData.Vehicle_Index;

    RecEmbark.MemberPlatformName  := fmInputTrackId.edtName.Text;
    RecEmbark.TrackID           := fmInputTrackId.edtTrackId.Text;

//    RecEmbark.Domain            := TransportedOnBaseSelected.FData.Domain;
//    RecEmbark.Weight            := TransportedOnBaseSelected.FData.Weight;
//    RecEmbark.WideScale         := _UsedSpace;
//    RecEmbark.ReEmbarkPlatformID:= 0; {0 : penanda dr pangkalan ke kapal; <>0 : penanda reembark}

    simMgrClient.netSend_CmdTransport(RecEmbark);
    {$ENDREGION}
  end;

  DisableBtnTransportOnBase;
end;

procedure TfrmToteDisplay.btnEmbarkPersonelClick(Sender: TObject);
var
  i, j      : Integer;

  _PersonelQuantity : Integer;
  _SumPersonelWeight: Double;
  _TotalDayaAngkut  : Double;
  _RangeShipAndBase : Double;
  _OwnShip          : TT3PlatformInstance;
  _Platoon          : TPlatoon;
  _Group            : TGroup;

begin
  {$REGION ' Pengecekan kapal yang mengangkut '}
  _OwnShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if not Assigned(_OwnShip) then
    Exit;

  if _OwnShip = nil then
  begin
    ResetTransportPanel;

    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan personel yang diangkut '}
  if tvPersonelOnBase.Selected = nil then
  begin
    MessageDlg('Please re-select The personel', mtInformation, [mbOK], 0);
    Exit;
  end;

  if not Assigned (hoverNode) then
  begin
    MessageDlg('Please re-select The personel', mtInformation, [mbOK], 0);
    Exit;
  end;

  _PersonelQuantity := 0;
  case hoverNode.Level of
    0 :
    begin
      ShowMessage('Can not embark all of brigade...');
      Exit;
    end;
    1 :
    begin
      ShowMessage('Can not embark all of batalyon...');
      Exit;
    end;
    2:
      begin
        for i := 0 to TKompi(PersonelOnBaseSelected).PlatoonList.Count - 1 do
        begin
          _Platoon := TKompi(PersonelOnBaseSelected).PlatoonList[i];
          for j := 0 to _Platoon.GroupList.Count - 1 do
          begin
            _Group := _Platoon.GroupList[j];
            _PersonelQuantity := _PersonelQuantity + _Group.Quantity;
          end;
        end;
      end;
    3:
      begin
        for i := 0 to TPlatoon(PersonelOnBaseSelected).GroupList.Count - 1 do
        begin
          _Group := TPlatoon(PersonelOnBaseSelected).GroupList[i];
          _PersonelQuantity := _PersonelQuantity + _Group.Quantity;
        end;
      end;
    4:
      begin
        _PersonelQuantity := TGroup(PersonelOnBaseSelected).Quantity;
      end;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan Force kapal yang mengangkut dgn pangkalan '}
  if BaseTransport.force <> _OwnShip.Force_Designation then
  begin
    MessageDlg('Personel must be in the same force with base ', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan jarak kapal dgn pangkalan '}
  _RangeShipAndBase := CalcRange(BaseTransport.Longitude, BaseTransport.Latitude, _OwnShip.PosX, _OwnShip.PosY);

  if BaseTransport.Radius < _RangeShipAndBase then
  begin
    MessageDlg('Distance must be less than ' + FloatToStr(BaseTransport.Radius) + ' nm from base', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kemampuan mengangkut personel '}
  if TT3Vehicle(_OwnShip).UnitCapability.FData.Personnel_Unit_Carried = False then
  begin
    MessageDlg('Embarkation capability is not support for personel', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan daya angkut total, kapal pengangkut '}
  _TotalDayaAngkut := TT3Vehicle(_OwnShip).CurrentHanggarWeight + TT3Vehicle(_OwnShip).CurrentHullWeight +
                      TT3Vehicle(_OwnShip).CurrentPersonelWeight;

  _SumPersonelWeight := (_PersonelQuantity * 0.08);

  if _SumPersonelWeight > _TotalDayaAngkut then
  begin
    MessageDlg('Already exceed maximum weight limit', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapasitas maksimal personel '}
  if TT3Vehicle(_OwnShip).CurrentPersonelCapacity < _PersonelQuantity then
  begin
    MessageDlg('Already exceed maximum personel capacity', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Mengirim Paket '}
  RecEmbarkPersonel.ParentPlatformID  := _OwnShip.InstanceIndex;
  RecEmbarkPersonel.BaseIdentifier    := BaseTransport.identifier;
  RecEmbarkPersonel.LevelID           := hoverNode.Level;
  RecEmbarkPersonel.SelectedIdentifier:= PersonelOnBaseSelected.Identifier;
  RecEmbarkPersonel.BrigadeIdentifier := PersonelOnBaseSelected.ChildFromBrigade;
  RecEmbarkPersonel.BatalyonIdentifier:= PersonelOnBaseSelected.ChildFromBatalyon;
  RecEmbarkPersonel.KompiIdentifier   := PersonelOnBaseSelected.ChildFromKompi;
  RecEmbarkPersonel.PlatoonIdentifier := PersonelOnBaseSelected.ChildFromPleton;

  simMgrClient.netSend_CmdDEmbarkPersonelTemporary(RecEmbarkPersonel);
  {$ENDREGION}

  DisableBtnTransportOnBase;
end;

procedure TfrmToteDisplay.btnTakeOffFromBaseClick(Sender: TObject);
var
  i : Integer;
  _ForceCubicle : Integer;
  _GroupCubicle : T3CubicleGroup;
begin
  {$REGION ' Pengecekan platform yang take off '}
  if TransportedOnBaseSelected = nil then
  begin
    MessageDlg('Please re-select platform on base', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan jumlah kapal dipangkalan '}
  if TransportedOnBaseSelected.FData.Quantity < 1 then
  begin
    MessageDlg('There is no more ' + TransportedOnBaseSelected.FData.Vehicle_Identifier + ' in the base', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Setting form InputTrackID '}
  with fmInputTrackId do
  begin
    edtName.Text      := TransportedOnBaseSelected.FData.Vehicle_Identifier;
    lblWeight.Caption := FormatFloat('0.00',TransportedOnBaseSelected.FData.Weight);
    lblWidth.Caption  := FormatFloat('0.00',TransportedOnBaseSelected.FData.Width * C_Feet_To_Meter);
    lblLength.Caption := FormatFloat('0.00',TransportedOnBaseSelected.FData.Length * C_Feet_To_Meter);

    btnCancel.Top := 136;
    btnOk.Top := 136;
    Height := 194;

    lblGroup.Visible  := SimManager.IsController;
    lstGroup.Visible  := SimManager.IsController;
    Label6.Visible    := SimManager.IsController;

    if SimManager.IsController then
    begin
      btnCancel.Top := 242;
      btnOk.Top := 242;
      Height := 300;

      lstGroup.Clear;

      for i := 0 to VScenario.CubiclesGroupsListFromDB.Count - 1 do
      begin
        _GroupCubicle := VScenario.CubiclesGroupsListFromDB.Items[i] as T3CubicleGroup;
        if _GroupCubicle = nil then
          Continue;

        _ForceCubicle := _GroupCubicle.FData.Force_Designation;
        if _ForceCubicle = BaseTransport.force then
          lstGroup.AddItem(_GroupCubicle.FData.Group_Identifier, _GroupCubicle);
      end;

      btnOk.Enabled := False;
    end
  end;
  {$ENDREGION}

  if fmInputTrackId.ShowModal = mrOk then
  begin
    {$REGION ' Pengecekan jumlah kapal dipangkalan '}
    if TransportedOnBaseSelected.FData.Quantity < 1 then
    begin
      MessageDlg('There is no more ' + TransportedOnBaseSelected.FData.Vehicle_Identifier + ' in the base', mtInformation, [mbOK], 0);
      Exit;
    end;
    {$ENDREGION}

    {$REGION ' Mengirim Paket '}
    RecTakeOffFromBase.RPPlatformID   := TransportedOnBaseSelected.FData.Vehicle_Index;
    RecTakeOffFromBase.NewPlatformID  := 0;

    if SimManager.IsController then
      RecTakeOffFromBase.RPGroupID := fmInputTrackId.grpId
    else
      RecTakeOffFromBase.RPGroupID := simMgrClient.FMyCubGroup.FData.Group_Index;

    StrToChar(fmInputTrackId.edtName.Text, RecTakeOffFromBase.InstanceName);
    StrToChar(fmInputTrackId.edtTrackId.Text, RecTakeOffFromBase.TrackIdent);

    RecTakeOffFromBase.IDPlatformName := 0;
    RecTakeOffFromBase.IDPlatformClass := 0;

    StrToChar('', RecTakeOffFromBase.namePlatform);
    StrToChar('', RecTakeOffFromBase.nameClass);
    StrToChar('', RecTakeOffFromBase.VBSClassName);

    RecTakeOffFromBase.pX := BaseTransport.Longitude;
    RecTakeOffFromBase.pY := BaseTransport.Latitude;

    {cek tipe helicopter}
    if TransportedOnBaseSelected.FData.PlatformType = 1 then
      RecTakeOffFromBase.PSpeed := 1
    else
      RecTakeOffFromBase.PSpeed := 500;

    RecTakeOffFromBase.PAltitude  := 500 * C_Feet_To_Meter;
    RecTakeOffFromBase.PHeading   := 0;

    RecTakeOffFromBase.ForceDesignation   := BaseTransport.force;
    RecTakeOffFromBase.OrderID            := CORD_ID_LAUNCH_SINGLE_RUNTIME_PLATFORM;

    {Variabel ini tak pinjem, biar gak pake ngerubah paket di plug in}
    RecTakeOffFromBase.MaxRowIndex := 123;
    RecTakeOffFromBase.MaxColumnIndex := BaseTransport.id;

    simMgrClient.netSend_CmdLaunchRP(RecTakeOffFromBase);
    {$ENDREGION}
  end;

  DisableBtnTransportOnBase;

  isSender := True;
end;

procedure TfrmToteDisplay.btnTransferLogisticClick(Sender: TObject);
var
  shipTemp : TT3PlatformInstance;
  targetTemp : TT3PlatformInstance;
begin

  case TButton(Sender).Tag of

    {$REGION ' Antar Kapal '}
    0: {antar kapal}
    begin

      {$REGION ' Pengecekan kapal yang dipilih '}
      shipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSelectedID));

      if shipTemp = nil then
      begin
        MessageDlg('Please re-select platfrom', mtInformation, [mbOK], 0);
        exit ;
      end;
      {$ENDREGION}

      {$REGION ' Pengecekan kapal yang akan ditransfer '}
      targetTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSuppliedID));

      case TT3Vehicle(targetTemp).DestinationStateLog of
        0:
        begin
          MessageDlg('Ship is not ready to transfer', mtInformation, [mbOK], 0);
          exit ;
        end;
        2:
        begin
          MessageDlg('The ship is in the process of being transferred', mtInformation, [mbOK], 0);
          exit ;
        end;
      end;
      {$ENDREGION}

      if not Assigned(frmLogisticChange) then
        frmLogisticChange := TfrmLogisticChange.Create(self);

      with frmLogisticChange do
      begin
        pnlHose.Height := 40;
        frmLogisticChange.Height := 260;

        supplierShipID := LogisticSelectedID;
        targetShipID := LogisticSuppliedID;
        ModeTransferID := 0;
        UpdateTabIdShip;

        if simMgrClient.ISWasdal then
          Show
        else
          ShowModal;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Dari Pangkalan '}
    1: {dengan pangkalan}
    begin
      if simMgrClient.ISInstructor or simMgrClient.ISWasdal  then
      begin
        {$REGION ' Pengecekan kapal yang akan ditransfer '}
        targetTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSelectedID));

        if Assigned (targetTemp) then
        begin
          case TT3Vehicle(targetTemp).DestinationStateLog of
            0:
            begin
              MessageDlg('Ship is not ready to transfer', mtInformation, [mbOK], 0);
              exit ;
            end;
            2:
            begin
              MessageDlg('The ship is in the process of being transferred', mtInformation, [mbOK], 0);
              exit ;
            end;
          end;
          {$ENDREGION}

          if not Assigned(frmLogisticChange) then
            frmLogisticChange := TfrmLogisticChange.Create(self);

          with frmLogisticChange do
          begin
            pnlHose.Height := 0;
            frmLogisticChange.Height := 217;

            baseID := LogisticBaseID;
            targetShipID := LogisticSelectedID;
            ModeTransferID := 1;
            UpdateTabIdShip;

            if simMgrClient.IsWasdal then
              Show
            else
              ShowModal;
          end;
        end;
      end;
    end;
    {$ENDREGION}
  end;

end;

procedure TfrmToteDisplay.btnStopLogisticClick(Sender: TObject);
var
  flag : Integer;
  recLogistic : TRecCmd_Change_Logistic;
  shipTemp : TT3PlatformInstance;
  targetTemp : TT3PlatformInstance;

begin
  case TButton(Sender).Tag of

    {$REGION ' Antar Kapal '}
    0: {antar kapal}
    begin
      {$REGION ' Pengecekan kapal yang dipilih '}
      shipTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSelectedID));

      if shipTemp = nil then
      begin
        MessageDlg('Please re-select platfrom', mtInformation, [mbOK], 0);
        exit ;
      end;
      {$ENDREGION}

      {$REGION ' Pengecekan kapal yang akan ditransfer '}
      targetTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSuppliedID));
      if targetTemp = nil then
      begin
        MessageDlg('Please re-select target platfrom', mtInformation, [mbOK], 0);
        exit ;
      end;

      if TT3Vehicle(targetTemp).DestinationStateLog <> 2 then
        exit ;
      {$ENDREGION}

      recLogistic.PlatfomID  := LogisticSelectedID;
      recLogistic.HoseID := TT3Vehicle(targetTemp).HoseUseID;
      recLogistic.ModeTransferID:= 0;
      recLogistic.DestinationID := LogisticSuppliedID;

    end;
    {$ENDREGION}

    {$REGION ' Dari Pangkalan '}
    1: {dengan pangkalan}
    begin
      {$REGION ' Pengecekan kapal yang akan ditransfer '}
      targetTemp := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(LogisticSelectedID));
      if targetTemp = nil then
      begin
        MessageDlg('Please re-select target platfrom', mtInformation, [mbOK], 0);
        exit ;
      end;

      if TT3Vehicle(targetTemp).DestinationStateLog <> 2 then
        exit ;
      {$ENDREGION}

      recLogistic.PlatfomID  := LogisticBaseID;
      recLogistic.ModeTransferID := 1;
      recLogistic.DestinationID := LogisticSelectedID;

    end;
    {$ENDREGION}
  end;

  recLogistic.StateID := lsStandby;

  simMgrClient.netSend_Cmd_Change_Logistic(recLogistic);
end;

procedure TfrmToteDisplay.lblMoreLogisticCalculationClick(Sender: TObject);
begin

  if pnlLogisticBottom.Height < 35 then
  begin
    pnlLogisticBottom.Height := 588;
    lblMoreLogisticCalculation.Caption := 'Less >>';

    pnlListPlatform.Height := 388;
    pnlLogisticPlatform.Height := 80;
    pnlStatusTransfer.Height := 80;
    pnlNearestPlatform.Height := 80;
    pnlNearestBases.Height := 80;

  end
  else
  begin
    pnlLogisticBottom.Height := 34;
    lblMoreLogisticCalculation.Caption := 'More >>';

    pnlListPlatform.Height := 927;
    pnlLogisticPlatform.Height := 200;
    pnlStatusTransfer.Height := 184;
    pnlNearestPlatform.Height := 230;
    pnlNearestBases.Height := 245;

  end;

//  ShowMessage(FloatToStr(gbLogisticStatus.Height));
end;

procedure TfrmToteDisplay.btnTransportEmbarkasiClick(Sender: TObject);
var
  trnsprtEmbark: TfrmTransportEmbarkasi;
  _ShipSelected: TT3PlatformInstance;
  tempVehicle: TT3Vehicle;
begin
  _ShipSelected := nil;

  if TransportHostShipID = 0 then
    exit;

  trnsprtEmbark := TfrmTransportEmbarkasi.Create(Self);

  tempVehicle := TT3Vehicle(simMgrClient.SimPlatforms.getObjectByInstanceIndex(TransportHostShipID));

  if tempVehicle.StateTransport then
  begin
    trnsprtEmbark.HostShipID := tempVehicle.HostIdTransport;
    trnsprtEmbark.ControlerShipID := TransportHostShipID;
    trnsprtEmbark.isAsHost := False;
  end
  else
  begin
    trnsprtEmbark.HostShipID := TransportHostShipID;
    trnsprtEmbark.isAsHost := True;
  end;

  try
    trnsprtEmbark.ShowModal;
  finally
    trnsprtEmbark.Free;
  end;

  RefreshAmphibhiousLandCarriedTransport(TransportHostShipID);
end;

procedure TfrmToteDisplay.tvPersonelCarriedEdited(Sender: TObject; Node: TTreeNode; var S: string);
begin
  tvPersonelCarried.ReadOnly := True;
end;

procedure TfrmToteDisplay.RefreshTransportBaseList;
var
  i : Integer;
  _Base : TPlatformBase;
begin
  {$REGION ' Reset base data '}
  lvPlatformOnBase.Clear;
  tvPersonelOnBase.Items.Clear;

  cbbBase.Items.Clear;
  cbbBase.Clear;

  lblBaseName.Caption   := '---';
  lblLongitude.Caption  := '---';
  lblLatitude.Caption   := '---';
//  lblForce.Font.Color   := clNone;
  lblForce.Caption      := '---';

  btntakeoffbase.Enabled := False;
  btnEmbark.Enabled := False;
  {$ENDREGION}

  {$REGION ' Memasukkan List base ke dalam combobox '}
  {Memasukkan list pangkalan ke combo box dari semua force, karena dia instruktur}
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    for i := 0 to VScenario.BaseListFromDB.Count - 1 do
    begin
      _Base := TPlatformBase(VScenario.BaseListFromDB.Items[i]);
      cbbBase.AddItem(_Base.identifier, _Base);
    end;
  end
  {Memasukkan list pangkalan ke combo box sesuai forcenya}
  else
  begin
    for i  := 0 to VScenario.BaseListFromDB.Count - 1 do
    begin
      _Base := TPlatformBase(VScenario.BaseListFromDB.Items[i]);
      if simMgrClient.MyForceDesignation = _Base.force then
        cbbBase.AddItem(_Base.identifier, _Base);
    end;
  end;
  {$ENDREGION}
end;

procedure TfrmToteDisplay.cbbBaseChange(Sender: TObject);
begin
  {$REGION ' Reset base data '}
  lvPlatformOnBase.Clear;
  tvPersonelOnBase.Items.Clear;

  btnEmbark.Enabled         := False;
  btntakeoffbase.Enabled    := False;
  btnEmbarkPersonel.Enabled := False;

  DisableBtnTransportOnShip;
  {$ENDREGION}

  BaseTransport := nil;
  BaseTransport := TPlatformBase(cbbBase.Items.Objects[cbbBase.ItemIndex]);

  RefreshTransportBaseData;
end;

procedure TfrmToteDisplay.cbbBaseKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
  Exit;
end;

procedure TfrmToteDisplay.RefreshTransportBaseData;
var
  i,j,k,l,m,n : Integer;
  _PlatformOnBase : TPlatform_Embark_Library;

  _TnBrigade, _TnBatalyon, _TnKompi, _TnPlatoon, _TnGroup: TTreeNode;

  _Personel : TPersonel;
  _Brigade  : TBrigade;
  _Batalyon : TBatalyon;
  _Kompi    : TKompi;
  _Platoon  : TPlatoon;
  _Group    : TGroup;

begin
  if BaseTransport <> nil then
  begin
    lvPlatformOnBase.Clear;
    tvPersonelOnBase.Items.Clear;

    {$REGION ' Base Info '}
    lblBaseName.Caption := BaseTransport.identifier;
    lblLongitude.Caption := formatDMS_long(BaseTransport.Longitude);
    lblLatitude.Caption := formatDMS_latt(BaseTransport.Latitude);
    case BaseTransport.force of
      1: lblForce.Caption := 'Red';
      2: lblForce.Caption := 'Yellow';
      3: lblForce.Caption := 'Blue';
      4: lblForce.Caption := 'Green';
      5: lblForce.Caption := 'No Force';
      6: lblForce.Caption := 'Black';
    end;
    {$ENDREGION}

    {$REGION ' Platform On Base '}
    for i := 0 to BaseTransport.ListVehicle.Count - 1 do
    begin
      _PlatformOnBase := TPlatform_Embark_Library(BaseTransport.ListVehicle.Items[i]);
      with lvPlatformOnBase.Items.Add do
      begin
        Caption := IntToStr(i + 1);
        SubItems.Add(_PlatformOnBase.FData.Vehicle_Identifier);
        SubItems.Add(IntToStr(_PlatformOnBase.FData.Quantity));
        SubItems.Add(FormatFloat('0.##',_PlatformOnBase.FData.Weight) + ' Ton');
        SubItems.Add(FormatFloat('0.##',_PlatformOnBase.FData.Width * C_Feet_To_Meter) + ' M');
        SubItems.Add(FormatFloat('0.##',_PlatformOnBase.FData.Length * C_Feet_To_Meter) + ' M');
      end;
    end;
    {$ENDREGION}

    {$REGION ' Personel On Base '}
    for i := 0 to BaseTransport.ListPersonel.Count - 1 do
    begin
      _Brigade  := TBrigade(BaseTransport.ListPersonel.Items[i]);

      if not CekChild(_Brigade.BatalyonList, 1) then
        Continue;

      _TnBrigade := tvPersonelOnBase.Items.Add(nil, TPersonel(_Brigade).Identifier);
      _TnBrigade.Data := _Brigade;

      {Load brigade disini, mendapat nilai balik list batalyon}
      for k := 0 to _Brigade.BatalyonList.Count-1 do
      begin
        _Batalyon := _Brigade.BatalyonList.Items[k];

        if not CekChild(_Batalyon.KompiList, 2) then
          Continue;

        _TnBatalyon := tvPersonelOnBase.Items.AddChild(_TnBrigade, TPersonel(_Batalyon).Identifier);
        _TnBatalyon.Data := _Batalyon;

        {Load batalyon disini, mendapat nilai balik list kompi}
        for l := 0 to _Batalyon.KompiList.Count-1 do
        begin
          _Kompi := _Batalyon.KompiList.Items[l];

          if not CekChild(_Kompi.PlatoonList, 3) then
            Continue;

          _TnKompi := tvPersonelOnBase.Items.AddChild(_TnBatalyon, TPersonel(_Kompi).Identifier);
          _TnKompi.Data := _Kompi;

          {Load Kompi disini, mendapat nilai balik list platoon}
          for m := 0 to _Kompi.PlatoonList.Count-1 do
          begin
            _Platoon := _Kompi.PlatoonList.Items[m];

            if _Platoon.GroupList.Count <= 0 then
              Continue;

            _TnPlatoon := tvPersonelOnBase.Items.AddChild( _TnKompi, TPersonel(_Platoon).Identifier);
            _TnPlatoon.Data := _Platoon;

            {Load Platoon disini, mendapat nilai balik list group}
            for n := 0 to _Platoon.GroupList.Count-1 do
            begin
              _Group := _Platoon.GroupList.Items[n];
              _TnGroup := tvPersonelOnBase.Items.AddChild(_TnPlatoon, TPersonel(_Group).Identifier);
              _TnGroup.Data := _Group;
            end;
          end;
        end;
      end;
    end;
    {$ENDREGION}
  end;
end;

procedure TfrmToteDisplay.lvPlatformOnBaseSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  {$REGION ' Reset button '}
  DisableBtnTransportOnBase;
  DisableBtnTransportOnShip;
  {$ENDREGION}

  {$REGION ' Pengecekan pangkalan yang mengeluarkan '}
  if BaseTransport = nil then
  begin

    {$REGION ' Reset base data '}
    lvPlatformOnBase.Clear;
    tvPersonelOnBase.Items.Clear;

    btnEmbark.Enabled         := False;
    btntakeoffbase.Enabled    := False;
    btnEmbarkPersonel.Enabled := False;
    {$ENDREGION}

    MessageDlg('Please re-select The base', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  if Selected then
  begin
    TransportedOnBaseSelected := nil;

    TransportedOnBaseID := StrToInt(lvPlatformOnBase.Selected.Caption) - 1;
    TransportedOnBaseSelected := TPlatform_Embark_Library(BaseTransport.ListVehicle.Items[TransportedOnBaseID]);

    if TransportedOnBaseSelected = nil then
    begin
      MessageDlg('Please re-select platform on base', mtInformation, [mbOK], 0);
      Exit;
    end;

    btnEmbark.Enabled       := True;

    {Kalo domain air, bisa langsung take off tanpa kriteria embark}
    if TransportedOnBaseSelected.FData.Domain = vhdAir then
      btntakeoffbase.Enabled := True;
  end
end;

procedure TfrmToteDisplay.tvPersonelOnBaseMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  {$REGION ' Reset button '}
  DisableBtnTransportOnBase;
  DisableBtnTransportOnShip;
  {$ENDREGION}

  {$REGION ' Pengecekan pangkalan yang mengeluarkan '}
  if BaseTransport = nil then
  begin

    {$REGION ' Reset base data '}
    lvPlatformOnBase.Clear;
    tvPersonelOnBase.Items.Clear;

    btnEmbark.Enabled         := False;
    btntakeoffbase.Enabled    := False;
    btnEmbarkPersonel.Enabled := False;
    {$ENDREGION}

    MessageDlg('Please re-select The base', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan tree view yang dipilih '}
  if tvPersonelOnBase.Selected = nil then
    Exit;
  {$ENDREGION}

  if Button = mbLeft then
  begin
    {$REGION ' Pengecekan filter level orbat personel yang dipilih '}
    hoverNode:= tvPersonelOnBase.GetNodeAt(X, Y);
    if not Assigned (hoverNode) then
    begin
      MessageDlg('Please re-select group personel', mtInformation, [mbOK], 0);
      Exit;
    end;
    {$ENDREGION}

    PersonelOnBaseSelected := nil;
    case hoverNode.Level of
      0 : PersonelOnBaseSelected  := TBrigade(hoverNode.Data);
      1 : PersonelOnBaseSelected  := TBatalyon(hoverNode.Data);
      2 : PersonelOnBaseSelected  := TKompi(hoverNode.Data);
      3 : PersonelOnBaseSelected  := TPlatoon(hoverNode.Data);
      4 : PersonelOnBaseSelected  := TGroup(hoverNode.Data);
    end;

    btnEmbarkPersonel.Enabled := true;
  end;
end;

procedure TfrmToteDisplay.tvPersonelOnBaseEdited(Sender: TObject; Node: TTreeNode; var S: string);
begin
  tvPersonelOnBase.ReadOnly := True;
end;

procedure TfrmToteDisplay.DisableBtnTransportOnShip;
begin
  btnTakeoff.Enabled := False;

  btnPersonelDebarkasi.Enabled      := False;
  btnPersonelDebarkasiWith.Enabled  := False;

  btnLandingCraftDisembark.Enabled := False;
  btnLandingCraftDisembarkWith.Enabled := False;

  btnAmphibiousLandDisembark.Enabled      := False;
  btnAmphibiousLandDisembarkWith.Enabled  := False;

end;

procedure TfrmToteDisplay.DisableBtnTransportOnBase;
begin
  btnEmbark.Enabled       := False;
  btntakeoffbase.Enabled  := False;

  btnEmbarkPersonel.Enabled := False;
end;

function TfrmToteDisplay.CekChild(list : TList; LevelChild: Integer): Boolean;
var
  i, j, k, l, m : Integer;
  BrigadeOnShip : TBrigade;
  BatalyonOnShip: TBatalyon;
  KompiOnship   : TKompi;
  PlatoonOnship : TPlatoon;

begin
  Result := False;

  case LevelChild of
    1 :
    begin
      for i := 0 to list.Count - 1 do
      begin
        BatalyonOnShip  := TBatalyon(list.Items[i]);

        for j := 0 to BatalyonOnShip.KompiList.Count - 1 do
        begin
          KompiOnship  := TKompi(BatalyonOnShip.KompiList.Items[j]);

          for k := 0 to KompiOnship.PlatoonList.Count - 1 do
          begin
            PlatoonOnship  := TPlatoon(KompiOnship.PlatoonList.Items[k]);

            if PlatoonOnship.GroupList.Count > 0 then
            begin
              Result := True;
              Break;
            end;
          end;
        end;
      end;
    end;
    2 :
    begin
      for i := 0 to list.Count - 1 do
      begin
        KompiOnship  := TKompi(list.Items[i]);

        for j := 0 to KompiOnship.PlatoonList.Count - 1 do
        begin
          PlatoonOnship  := TPlatoon(KompiOnship.PlatoonList.Items[j]);

          if PlatoonOnship.GroupList.Count > 0 then
          begin
            Result := True;
            Break;
          end;
        end;
      end;
    end;
    3 :
    begin
      for i := 0 to list.Count - 1 do
      begin
        PlatoonOnship  := TPlatoon(list.Items[i]);

        if PlatoonOnship.GroupList.Count > 0 then
        begin
          Result := True;
          Break;
        end;
      end;
    end;
  end;
end;

{$ENDREGION}

{$REGION 'Envi Status UI'}
procedure TfrmToteDisplay.DrawSeaNeedle(Degree:Double; Image:TCanvas);
var
  ShapePolygon: array [0..8] of Tpoint;
  i : Integer;
  Center : Tpoint;
  AngleRad : Double;
  CosAngle : Double;
  SinAngle : Double;
begin
  Center.X := 75;
  Center.Y := 75;

  AngleRad := DegToRad(0 - Degree);
  CosAngle := Cos(AngleRad);
  SinAngle := Sin(AngleRad);

  Image.Brush.Color := RGB(18, 20, 27);
  Image.Brush.Style := bsSolid;
  Image.FillRect(ClientRect);

  Image.Pen.Width := 1;
  Image.Pen.Color := RGB(151, 152, 156);
  Image.Brush.Color := RGB(151, 152, 156);
  Image.Ellipse(65, 65, 85, 85);

  Image.Pen.Color := RGB(71, 15, 18);
  Image.Pen.Width := 2;

  Image.Brush.Color := RGB(169, 24, 24);;
  Image.Brush.Style := bsSolid;

  ShapePolygon[0].X:= 68;
  ShapePolygon[0].Y:= 111;

  ShapePolygon[1].X:= 70;
  ShapePolygon[1].Y:= 97;

  ShapePolygon[2].X:= 70;
  ShapePolygon[2].Y:= 51;

  ShapePolygon[3].X:= 67;
  ShapePolygon[3].Y:= 31;

  ShapePolygon[4].X:= 75;
  ShapePolygon[4].Y:= 0;

  ShapePolygon[5].X:= 82;
  ShapePolygon[5].Y:= 31;

  ShapePolygon[6].X:= 79;
  ShapePolygon[6].Y:= 51;

  ShapePolygon[7].X:= 79;
  ShapePolygon[7].Y:= 97;

  ShapePolygon[8].X:= 81;
  ShapePolygon[8].Y:= 111;

  for i := Low(ShapePolygon) to High(ShapePolygon) do
  begin
    ShapePolygon[i]:= RotatePointAroundAPoint(ShapePolygon[i], Center, CosAngle, SinAngle);
  end;

  Image.Polygon(ShapePolygon);
end;

function TfrmToteDisplay.RotatePointAroundAPoint(APoint: Tpoint; Center: Tpoint; CosVal, SinVal: Double): Tpoint;
var
  TempPoint: Tpoint;
  RotatedPoint: Tpoint;
begin
  // Step 1
  TempPoint.X := APoint.X - Center.X;
  TempPoint.Y := APoint.Y - Center.Y;
  // Step 2
  RotatedPoint.X := Round(TempPoint.X * CosVal + TempPoint.Y * SinVal);
  RotatedPoint.Y := Round(TempPoint.Y * CosVal - TempPoint.X * SinVal);
  // Step 3
  Result.X := RotatedPoint.X + Center.X;
  Result.Y := RotatedPoint.Y + Center.Y;
end;


procedure TfrmToteDisplay.tmrEnviDisplayTimer(Sender: TObject);
begin
  if imgSeaStateDisplay.Left <> -1200 then imgSeaStateDisplay.Left := imgSeaStateDisplay.Left - 1
  else if imgSeaStateDisplay.Left = -1200 then imgSeaStateDisplay.Left := 0;

  if imgRainStateDisplay.Left <> -1200 then imgRainStateDisplay.Left := imgRainStateDisplay.Left - 1
  else if imgRainStateDisplay.Left = -1200 then imgRainStateDisplay.Left := 0;

  if imgRainDisplay.Left <> -250 then imgRainDisplay.Left := imgRainDisplay.Left - 1
  else if imgRainDisplay.Left = -250 then imgRainDisplay.Left := 0;

  if imgRainDisplay.Top <> 0 then imgRainDisplay.Top := imgRainDisplay.Top + 1
  else if imgRainDisplay.Top = 0 then imgRainDisplay.Top := -250;
end;

procedure TfrmToteDisplay.SidebarButtonClick(Sender: TObject);
var
  Tag : Integer;
  button : TSpeedButton;
  Labels : TLabel;
begin
  if Sender is TSpeedButton then
  begin
    button := sender as TSpeedButton;
    Tag := button.Tag;
  end
  else if Sender is TLabel then
  begin
    Labels := sender as TLabel;
    Tag := Labels.Tag;
  end;

  case Tag of
    1:
    begin
      DisablePrevious;
      lblPlatformOp.Font.Color := $00FAFAFA;
      lblPlatformCub.Font.Color := $00FAFAFA;
//    gbPlatformStatus.BringToFront;
      btnPlatformStatus.Click;
      LastButton := 1;
    end;
    2:
    begin
      DisablePrevious;
      lblLogisticOp.Font.Color := $00FAFAFA;
      lblLogisticCub.Font.Color := $00FAFAFA;
//      gbLogisticStatus.BringToFront;
      btnLogisticStatus.Click;
      LastButton := 2;
    end;
    3:
    begin
      DisablePrevious;
      lblTransportOp.Font.Color := $00FAFAFA;
      lblTransportCub.Font.Color := $00FAFAFA;
//      gbTransport.BringToFront;
      LastButton := 3;
      btnEmbarkDisembark.Click;
    end;
    4:
    begin
      DisablePrevious;
      lblEnviOp.Font.Color := $00FAFAFA;
      lblEnviCub.Font.Color := $00FAFAFA;
//      gbEnvironmentStatus.BringToFront;
      btnEnviroStatus.Click;
      LastButton := 4;
    end;
    5:
    begin
      DisablePrevious;
      lblEventOp.Font.Color := $00FAFAFA;
//      gbEventSummary.BringToFront;
      btnEventSummary.Click;
      LastButton := 5;
    end;
    6:
    begin
      DisablePrevious;
      lblEmitterCub.Font.Color := $00FAFAFA;
//      gbEmitterStatus.BringToFront;
      btEmitterStatus.Click;
      LastButton := 6;
    end;
    7:
    begin
      DisablePrevious;
      lblCubicle.Font.Color := $00FAFAFA;
//      gbCubicleGroups.BringToFront;
      btnCubicleGroups.Click;
      LastButton := 7;
    end;
    8:
    begin
      DisablePrevious;
      lblEnviControl.Font.Color := $00FAFAFA;
//      gbEnvironmentControl.BringToFront;
      btnEnviroControl.Click;
      LastButton := 8;
    end;
    9:
    begin
      DisablePrevious;
      VSlidingTrans.ShowHideBtnProc;
      lblView.Font.Color := $00FAFAFA;
      LastButton := 9;
    end;
  end;
end;

procedure TfrmToteDisplay.DisablePrevious;
begin
  case LastButton of
    1:
    begin
      lblPlatformOp.Font.Color := $00C3B8A3;
      lblPlatformCub.Font.Color := $00C3B8A3;
    end;
    2:
    begin
      lblLogisticOp.Font.Color := $00C3B8A3;
      lblLogisticCub.Font.Color := $00C3B8A3;
    end;
    3:
    begin
      lblTransportOp.Font.Color := $00C3B8A3;
      lblTransportCub.Font.Color := $00C3B8A3;
    end;
    4:
    begin
      lblEnviOp.Font.Color := $00C3B8A3;
      lblEnviCub.Font.Color := $00C3B8A3;
    end;
    5:
    begin
      lblEventOp.Font.Color := $00C3B8A3;
    end;
    6:
    begin
      lblEmitterCub.Font.Color := $00C3B8A3;
    end;
    7:
    begin
      lblCubicle.Font.Color := $00C3B8A3;
    end;
    8:
    begin
      lblEnviControl.Font.Color := $00C3B8A3;
    end;
    9:
    begin
      lblView.Font.Color := $00C3B8A3;
    end;
  end;
end;

procedure TfrmToteDisplay.RefreshEnvironment;
var
  ge: TGame_Environment_Definition;
  StrTime:string;
  SecondTime : Integer;
  Fogstate: string;
  Rainstate: Integer;
  Seastate: Integer;
begin
  gbEnvironmentStatus.BringToFront;
  ge := (simMgrClient).GameEnvironment;

//  Label111.Caption := Char(176) + 'C';
//  Label108.Caption := Char(176) + 'C';

  with ge.FData do
  begin
    lblSpeedWIndTrue.Caption              := FormatSpeed(Wind_Speed);
    lblDirectionWindTrue.Caption          := FormatCourse(Wind_Direction);
 //   lblAttenuationFactorsRain.Caption     := IntToStr(Rain_Rate);
//    lblAttenuationFactorsCloud.Caption    := IntToStr(Cloud_Attenuation);

    lblDayVisual.Caption                  := FormatFloat('0.00', Daytime_Visual_Modifier) + '%';
    lblNightimeVisual.Caption             := FormatFloat('0.00', Nighttime_Visual_Modifier) + '%';
    lblDaytimeInfrared.Caption            := FormatFloat('0.00', Daytime_Infrared_Modifier) + '%';
    lblNightimeInfrared.Caption           := FormatFloat('0.00', Nighttime_Infrared_Modifier) + '%';

    lblAtmosphere.Caption                 := FormatFloat('0.00', Atmospheric_Refract_Modifier) + '%';
    lblCloudAttenuation.Caption           := IntToStr(Cloud_Attenuation);

    lblSeaState.Caption                   := IntToStr(Sea_State);
    lblSurfaceTemp.Caption                := FormatFloat('0.00', Surface_Temperature) + 'C';

	  lblAttenuationFactorsRain.Caption 	  := IntToStr(Rain_Rate);
    lblAttenuationFactorsCloud.Caption    := FormatFloat('0.00', Cloud_Base_Height);
//    lblWindRelativeDirection.Caption := FormatFloat('0.00', TT3Vehicle(controlle).CourseEnvi);
//    lblWindRelativeSpeed.Caption := FormatFloat('0.00', TT3Vehicle(controlle).SpeedEnvi);

    // lblVisibilityactorsTime.Caption :=
    // lblVisibilityFactorsElectroOptical
    // lblVisibilityFactorsnfrared
    StrTime := FormatDateTime('HH:NN:SS', simMgrClient.GameTIME);
    SecondTime := TimeStringToSecond(StrTime);

    if (SecondTime >= Sunrise) and (SecondTime <= Sunset) then
    begin
      lblVisibilityactorsTime.Caption := 'DayTime';
      lblVisibilityFactorsElectroOptical.Caption := FormatFloat('0.00', Daytime_Visual_Modifier) + '%';
      lblVisibilityFactorsnfrared.Caption := FormatFloat('0.00', Daytime_Infrared_Modifier) + '%';
    end
    else
    begin
      lblVisibilityactorsTime.Caption := 'NightTime';
      lblVisibilityFactorsElectroOptical.Caption := FormatFloat('0.00', Nighttime_Visual_Modifier) + '%';
      lblVisibilityFactorsnfrared.Caption := FormatFloat('0.00', Nighttime_Infrared_Modifier) + '%';
    end;

    lblOtherAirTemp.Caption               := FormatFloat('00.0', Air_Temperature);
    lblOtherBarometric.Caption            := FormatFloat('000.0', Barometric_Pressure);
    lblOceanCurrentSpeed.Caption          := FormatFloat('00.0', Ocean_Current_Speed);
    lblOceanCurrentDirection.Caption      := FormatFloat('000.0', Ocean_Current_Direction);

    case Sound_Velocity_Type of
      0 :
        begin
          lblSoundVelocityProfile.Caption := 'Positive';
        end;
      1 :
        begin
          lblSoundVelocityProfile.Caption := 'Negative';
        end;
      2 :
        begin
          lblSoundVelocityProfile.Caption := 'Positive over negative';
        end;
      3 :
        begin
          lblSoundVelocityProfile.Caption := 'Negative over positive';
        end;
    end;

//    lblSoundVelocityProfile.Caption       := IntToStr(Sound_Velocity_Type);
    lblSoundVelocityLayer.Caption         := FormatFloat('0.0', Thermal_Layer_Depth);
    lblSoundVelocityAverageBottom.Caption := FormatFloat('0.0', Ave_Ocean_Depth);

    case Sea_State of
      0 :
      begin
        lblSeaStatDesc.Caption           := 'Calm (glassy)';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\1_Sea.png');
      end;
      1 :
      begin
        lblSeaStatDesc.Caption           := 'Calm (rippled)';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\2_Sea.png');
      end;
      2 :
      begin
        lblSeaStatDesc.Caption           := 'Smooth (wavelets)';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\3_Sea.png');
      end;
      3 :
      begin
        lblSeaStatDesc.Caption           := 'Slight';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\4_Sea.png');
      end;
      4 :
      begin
        lblSeaStatDesc.Caption           := 'Moderate';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\5_Sea.png');
      end;
      5 :
      begin
        lblSeaStatDesc.Caption           := 'Rough';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\6_Sea.png');
      end;
      6 :
      begin
        lblSeaStatDesc.Caption           := 'Very rough';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\7_Sea.png');
      end;
      7 :
      begin
        lblSeaStatDesc.Caption           := 'High';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\8_Sea.png');
      end;
      8 :
      begin
        lblSeaStatDesc.Caption           := 'Very high';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\8_Sea.png');
      end;
      9,10 :
      begin
        lblSeaStatDesc.Caption        := 'Phenomenal';
        imgSeaState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\8_Sea.png');
      end;
    end;

    case Rain_Rate of
      0 :
      begin
        lblRainRateDesc.Caption     := 'Sunny';
        imgRainState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\1_Rain.png');
        imgSunDisplay.Visible := True;
        pnlEnvironmentDisplay.Color := $00FFFDDD;
        pnlRainDisplay.Color := $00FFFDDD;
        imgRainDisplay.Visible := False;
      end;
      1 :
      begin
        lblRainRateDesc.Caption     := 'Light Rain';
        imgRainState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\2_Rain.png');
        imgSunDisplay.Visible := True;
        pnlEnvironmentDisplay.Color := $00BAB9A5;
        pnlRainDisplay.Color := $00BAB9A5;
        imgRainDisplay.Visible := True;
      end;
      2 :
      begin
        lblRainRateDesc.Caption     := 'Heavy Rain';
        imgRainState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\3_Rain.png');
        imgSunDisplay.Visible := False;
        pnlEnvironmentDisplay.Color := $00969585;
        pnlRainDisplay.Color := $00969585;
        imgRainDisplay.Visible := True;
      end;
    end;

    case Cloud_Attenuation of
      0 :
      begin
        lblCloudAttenDesc.Caption     := 'No Fog';
        imgCloudState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\1_Cloud.png');
        Fogstate:= 'FOG1';
        if Rain_Rate = 0 then
        begin
          pnlEnvironmentDisplay.Color := $00FFFDDD;
          pnlRainDisplay.Color := $00FFFDDD;
        end
        else if Rain_Rate = 1 then
        begin
          pnlEnvironmentDisplay.Color := $00BAB9A5;
          pnlRainDisplay.Color := $00BAB9A5;
        end
        else if Rain_Rate = 2 then
        begin
          pnlEnvironmentDisplay.Color := $00969585;
          pnlRainDisplay.Color := $00969585;
        end;
      end;
      1 :
      begin
        lblCloudAttenDesc.Caption     := 'Slightly Foggy';
        imgCloudState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\2_Cloud.png');
        Fogstate:= 'FOG2';
        if Rain_Rate = 0 then
        begin
          pnlEnvironmentDisplay.Color := $00F2F1DC;
          pnlRainDisplay.Color := $00F2F1DC;
        end
        else if Rain_Rate = 1 then
        begin
          pnlEnvironmentDisplay.Color := $00C5C4B7;
          pnlRainDisplay.Color := $00C5C4B7;
        end
        else if Rain_Rate = 2 then
        begin
          pnlEnvironmentDisplay.Color := $00AEADA3;
          pnlRainDisplay.Color := $00AEADA3;
        end;
      end;
      2 :
      begin
        lblCloudAttenDesc.Caption     := 'Foggy';
        imgCloudState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\3_Cloud.png');
        Fogstate:= 'FOG2';
        if Rain_Rate = 0 then
        begin
          pnlEnvironmentDisplay.Color := $00E8E7DA;
          pnlRainDisplay.Color := $00E8E7DA;
        end
        else if Rain_Rate = 1 then
        begin
          pnlEnvironmentDisplay.Color := $00CCCCC4;
          pnlRainDisplay.Color := $00CCCCC4;
        end
        else if Rain_Rate = 2 then
        begin
          pnlEnvironmentDisplay.Color := $00BEBEB7;
          pnlRainDisplay.Color := $00BEBEB7;
        end;
      end;
      3 :
      begin
        lblCloudAttenDesc.Caption     := 'Very Foggy';
        imgCloudState.Picture.LoadFromFile('data\Image Interface\Tote\MiniPic\4_Cloud.png');
        Fogstate:= 'FOG3';
        if Rain_Rate = 0 then
        begin
          pnlEnvironmentDisplay.Color := $00DEDED9;
          pnlRainDisplay.Color := $00DEDED9;
        end
        else if Rain_Rate = 1 then
        begin
          pnlEnvironmentDisplay.Color := $00D4D4D1;
          pnlRainDisplay.Color := $00D4D4D1;
        end
        else if Rain_Rate = 2 then
        begin
          pnlEnvironmentDisplay.Color := $00CECECC;
          pnlRainDisplay.Color := $00CECECC;
        end;
      end;
    end;

//    lblSeaState.Caption                   := IntToStr(Sea_State);
    lblSurfaceTemp.Caption                := FormatFloat('0.0', Surface_Temperature);

    //lOAD FOR DISPLAY
    imgRainStateDisplay.Picture.LoadFromFile('data\Image Interface\Tote\' + Fogstate + '\cloud\' + (Rain_Rate + 1).ToString + '.png');
    imgSeaStateDisplay.Picture.LoadFromFile('data\Image Interface\Tote\' + Fogstate + '\wave\' + (Sea_State + 1).ToString + '.png');
    imgRainDisplay.Picture.LoadFromFile('data\Image Interface\Tote\' + Fogstate + '\Rain\' + (Rain_Rate + 1).ToString + '.png');
    imgSunDisplay.Picture.LoadFromFile('data\Image Interface\Tote\' + Fogstate + '\Sun\' + '1.png');
  end;

//  SetImageAlpha(img1,200);
  DrawSeaNeedle(StrToFloat(lblOceanCurrentDirection.Caption), imgOceanNeedle.Canvas);
  DrawSeaNeedle(StrToFloat(lblDirectionWindTrue.Caption), imgWindNeedle.Canvas);
  tmrEnviDisplay.Enabled := True;
end;

procedure TfrmToteDisplay.SidebarToggleClick(Sender: TObject);
begin
  if pnlSideBar.Tag = 0 then
  begin
    pnlSideBar.Width := 302;
    pnlSideBar.Tag := 1;
  end
  else if pnlSideBar.Tag = 1 then
  begin
    pnlSideBar.Width := 52;
    pnlSideBar.Tag := 0;
  end
end;

procedure TfrmToteDisplay.SmoothResizeFormTo(const ToSize: integer);
var
  CurrentHeight: integer;
  Step: integer;
begin
  while pnlSideBar.Width <> ToSize do
  begin
    CurrentHeight := pnlSideBar.Width;

    // this is the trick which both accelerates initially then
    // decelerates as the form reaches its target size
    Step := (ToSize - CurrentHeight) div 3;

    // this allows for both collapse and expand by using Absolute
    // calculated value
    if (Step = 0) and (Abs(ToSize - CurrentHeight) > 0) then
    begin
      Step := ToSize - CurrentHeight;
      Sleep(50); // adjust for smoothness
    end;

    if Step <> 0 then
    begin
      pnlSideBar.Width := pnlSideBar.Width + Step;
      sleep(50); // adjust for smoothness
    end;
  end;
end;

{$ENDREGION}
end.
