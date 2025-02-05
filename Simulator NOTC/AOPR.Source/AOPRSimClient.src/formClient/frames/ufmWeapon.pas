{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED OFF}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST OFF}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED OFF}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR OFF}
{$WARN CVT_WIDENING_STRING_LOST OFF}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
unit ufmWeapon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ufmControlled, Menus,
  uSimObjects, uGameData_TTT, tttData,
  uT3Unit, uT3Listener, ComCtrls, uT3Weapon
  ,uT3UnitContainer, uT3Sensor, VrControls, VrBlinkLed
  ,uDataTypes, uT3Radar, ufmFireControl, uMapXhandler, uDBAsset_Vehicle, ufmDetailPlan,
  uT3CounterMeasure, uCoordConvertor, DateUtils,
  uT3MissileDetail, uT3MissileEnvironment, ufmWeaponCtrl, uMainStaticShape,
  PlatformDefaultStyleActnCtrls, ActnPopup;//, ColorButton;

  {
  type
  TFlashWInfo = record
    cbSize : LongInt;
    hWnd : LongInt;
    dwFlags : LongInt;
    uCount : LongInt;
    dwTimeout : LongInt;
  end;
  }

type
  TfmWeapon = class(TfmControlled)
    PanelTacticalWeapons: TPanel;
    grbWakeHomingTorpedos: TGroupBox;
    grbWireGuidedTorpedo: TGroupBox;
    grbTacticalMissiles: TGroupBox;
    Label289: TLabel;
    lblTacticalMissileStatus: TLabel;
    Label294: TLabel;
    lblTacticalMissileStatusQuantity: TLabel;
    Label296: TLabel;
    Bevel59: TBevel;
    Label302: TLabel;
    Label304: TLabel;
    Bevel62: TBevel;
    Label486: TLabel;
    Label494: TLabel;
    Bevel107: TBevel;
    Label295: TLabel;
    Bevel60: TBevel;
    Label303: TLabel;
    Label496: TLabel;
    Label497: TLabel;
    Label498: TLabel;
    Label499: TLabel;
    Label500: TLabel;
    Bevel108: TBevel;
    btnTacticalMissileTargetTrack: TSpeedButton;
    btnTacticalMissileTargetAimpoint: TSpeedButton;
    sbTacticalMissileDisplayRangeShow: TSpeedButton;
    sbTacticalMissileDisplayRangeHide: TSpeedButton;
    sbTacticalMissileDisplayBlindShow: TSpeedButton;
    sbTacticalMissileDisplayBlindHide: TSpeedButton;
    editTacticalMissileControlSalvo: TEdit;
    btnTacticalMissileLaunch: TButton;
    rdoTacticalMissileTargetTrack: TRadioButton;
    rdoTacticalMissileTargetAimpoint: TRadioButton;
    rdoTacticalMissileTargetBearing: TRadioButton;
    editTacticalMissileTargetTrack: TEdit;
    editTacticalMissileTargetAimpoint: TEdit;
    editTacticalMissileTargetBearing: TEdit;
    btnTacticalMissileTargetBearing: TButton;
    editTacticalMissileControlCruise: TEdit;
    editTacticalMissileControlSeeker: TEdit;
    btnTacticalMissileControlCruise: TButton;
    btnTacticalMissileControlSeeker: TButton;
    btnTacticalMissileWaypointEdit: TButton;
    btnTacticalMissileWaypointAdd: TButton;
    btnTacticalMissileWaypointCancel: TButton;
    grbTacticalAcousticTorpedos: TGroupBox;
    Label439: TLabel;
    lblTacticalAcousticTorpedosStatus: TLabel;
    Label455: TLabel;
    lbTacticalAcousticTorpedosQuantity: TLabel;
    Label460: TLabel;
    Bevel91: TBevel;
    Label461: TLabel;
    Label462: TLabel;
    Bevel92: TBevel;
    Label463: TLabel;
    Label464: TLabel;
    Label465: TLabel;
    lbTacticalAcousticTorpedosTargetIdentity: TLabel;
    Bevel93: TBevel;
    Label459: TLabel;
    Bevel94: TBevel;
    Label476: TLabel;
    btnTacticalAcousticTorpedosTargetTrack: TSpeedButton;
    sbTacticalAcousticTorpedosDisplayRangeShow: TSpeedButton;
    sbTacticalAcousticTorpedosDisplayRangeHide: TSpeedButton;
    sbTacticalAcousticTorpedosDisplayBlindShow: TSpeedButton;
    sbTacticalAcousticTorpedosDisplayBlindHide: TSpeedButton;
    editTacticalAcousticTorpedosTargetTrack: TEdit;
    btnTacticalAcousticTorpedosLaunch: TButton;
    editTacticalAcousticTorpedosSalvo: TEdit;
    grbStraightRunningTorpedos: TGroupBox;
    grbMines: TGroupBox;
    Label272: TLabel;
    lblStatusMines: TLabel;
    Label288: TLabel;
    lbMinesQuantity: TLabel;
    Label291: TLabel;
    Bevel58: TBevel;
    Label292: TLabel;
    Bevel61: TBevel;
    EdtMinesDepth: TEdit;
    btnMinesDeploy: TButton;
    grbHybridMissile: TGroupBox;
    grbBombDepthCharge: TGroupBox;
    grbAirDroppedVECTAC: TGroupBox;
    Label367: TLabel;
    Bevel72: TBevel;
    Label368: TLabel;
    Label369: TLabel;
    Bevel75: TBevel;
    Label371: TLabel;
    Label375: TLabel;
    Label376: TLabel;
    Label377: TLabel;
    Label378: TLabel;
    Label379: TLabel;
    Bevel76: TBevel;
    Label380: TLabel;
    lbVectacWeaponCarrierAdviced: TLabel;
    lbVectacWeaponCarrierTime: TLabel;
    Label383: TLabel;
    Label384: TLabel;
    Label385: TLabel;
    Label386: TLabel;
    Label387: TLabel;
    Label388: TLabel;
    Label389: TLabel;
    Label390: TLabel;
    Label391: TLabel;
    Label392: TLabel;
    Label393: TLabel;
    Label394: TLabel;
    Label395: TLabel;
    Label396: TLabel;
    lbVectacWeaponExpiry: TLabel;
    Label398: TLabel;
    lbVectacTargetIdentity: TLabel;
    lbVectacTargetPropulsion: TLabel;
    lbVectacTargetDoppler: TLabel;
    lbVectacTargetCourse: TLabel;
    lbVectacTargetGround: TLabel;
    lbVectacTargetDepth: TLabel;
    btnVectacTargetTrack: TSpeedButton;
    btnVectacWeaponCarrierName: TSpeedButton;
    btnVectacWeaponName: TSpeedButton;
    btnVectacPlan: TButton;
    btnVectacConfirm: TButton;
    btnVectacCancel: TButton;
    editVectacTargetTrack: TEdit;
    editVectacWeaponCarrierName: TEdit;
    editVectacWeaponCarrierGround: TEdit;
    editVectacWeaponCarrierDrop: TEdit;
    btnVectacWeaponCarrierGround: TButton;
    btnVectacWeaponCarrierDrop: TButton;
    editVectacWeaponName: TEdit;
    grbAirDroppedTorpedo: TGroupBox;
    grbAcousticTorpedo: TGroupBox;
    grbSurfaceToAirMissile: TGroupBox;
    grbGunEngagementCIWS: TGroupBox;
    grbGunEngagementChaffMode: TGroupBox;
    ScrollBox9: TScrollBox;
    Label348: TLabel;
    Bevel97: TBevel;
    Label364: TLabel;
    Label365: TLabel;
    Label366: TLabel;
    Label466: TLabel;
    Label467: TLabel;
    lbChaffControlQuantity: TLabel;
    Label469: TLabel;
    Label470: TLabel;
    Bevel98: TBevel;
    Label471: TLabel;
    Label472: TLabel;
    btnChaffType: TSpeedButton;
    btnChaffBloomPosition: TSpeedButton;
    sbGunEngagementChaffContolAuto: TSpeedButton;
    sbGunEngagementChaffContolManual: TSpeedButton;
    sbChaffDisplayShow: TSpeedButton;
    sbChaffDisplayHide: TSpeedButton;
    sbChaffBlindZoneShow: TSpeedButton;
    sbChaffBlindZoneHide: TSpeedButton;
    sbGunEngagementChaffContolChaff: TSpeedButton;
    editChaffControlChaff: TEdit;
    editChaffControlBloomPosition: TEdit;
    editChaffControlBloomAltitude: TEdit;
    btnChaffFire: TButton;
    btnChaffCeaseFire: TButton;
    grbSurfaceToSurfaceMissile: TGroupBox;
    ScrollBox6: TScrollBox;
    Label67: TLabel;
    Bevel29: TBevel;
    lblSurfaceToSurfaceMissileStatus: TLabel;
    Label69: TLabel;
    lbSurfaceToSurfaceMissileQuantity: TLabel;
    Label75: TLabel;
    Bevel33: TBevel;
    Label76: TLabel;
    Label77: TLabel;
    Bevel74: TBevel;
    Label78: TLabel;
    Bevel77: TBevel;
    Label414: TLabel;
    Label415: TLabel;
    Label416: TLabel;
    btnSurfaceToSurfaceMissileFiring: TSpeedButton;
    btnSurfaceToSurfaceMissileEngagement: TSpeedButton;
    btnSurfaceToSurfaceMissileTargetTrack: TSpeedButton;
    Label54: TLabel;
    Bevel16: TBevel;
    sbSurfaceToSurfaceMissileDisplayRangeShow: TSpeedButton;
    sbSurfaceToSurfaceMissileDisplayRangeHide: TSpeedButton;
    editSurfaceToSurfaceMissileTargetTrack: TEdit;
    btnSurfaceToSurfacePlan: TButton;
    btnSurfaceToSurfaceLaunch: TButton;
    btnSurfaceToSurfaceCancel: TButton;
    editSurfaceToSurfaceMissileFiring: TEdit;
    editSurfaceToSurfaceMissileEngangement: TEdit;
    btnSurfaceToSurfaceMissileLauncherMore: TButton;
    btnSurfaceToSurfaceMissileTargetTrackDetails: TButton;
    grbGunEngagementAutomaticManualMode: TGroupBox;
    PanelWeaponChoices: TPanel;
    btnWeapon: TSpeedButton;
    edtWeaponName: TEdit;
    pmenuWeapon: TPopupMenu;
    pmenuFiring: TPopupMenu;
    pmenuEngagement: TPopupMenu;
    RBL1: TMenuItem;
    RBLW1: TMenuItem;
    BOL1: TMenuItem;
    BOLW1: TMenuItem;
    Ripple1: TMenuItem;
    STOT1: TMenuItem;
    DTOT1: TMenuItem;
    panSurfaceToSurfaceWp: TPanel;
    btnSurfaceToSurfaceMissileWaypointsEdit: TButton;
    btnSurfaceToSurfaceMissileWaypointsAdd: TButton;
    btnSurfaceToSurfaceMissileWaypointsDelete: TButton;
    btnSurfaceToSurfaceMissileWaypointsApply: TButton;
    btnSurfaceToSurfaceMissileWaypointsCancel: TButton;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Bevel1: TBevel;
    lblSurfaceToAirStatus: TLabel;
    Label2: TLabel;
    lbSurfaceToAirStatusQuantity: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel3: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Bevel4: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    lbSurfaceToAirCourse: TLabel;
    lbSurfaceToAirGround: TLabel;
    lbSurfaceToAirAltitude: TLabel;
    lbSurfaceToAirStatus: TLabel;
    lbSurfaceToAirTimeToWait: TLabel;
    lbSurfaceToAirTimeToIntercept: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    btnSurfaceToAirTargetTrack: TSpeedButton;
    sbSurfaceToAirDisplayRangeShow: TSpeedButton;
    sbSurfaceToAirDisplayRangeHide: TSpeedButton;
    sbSurfaceToAirDisplayBlindShow: TSpeedButton;
    sbSurfaceToAirDisplayBlindHide: TSpeedButton;
    ediSurfaceToAirSalvo: TEdit;
    editSurfaceToAirTrack: TEdit;
    btSurfaceToAirPlan: TButton;
    btSurfaceToAirLaunch: TButton;
    btSurfaceToAirCancel: TButton;
    Label84: TLabel;
    lblWGStatus: TLabel;
    Label85: TLabel;
    lblWGQuantity: TLabel;
    Label86: TLabel;
    Bevel19: TBevel;
    Label87: TLabel;
    Label88: TLabel;
    Bevel20: TBevel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    lblWGTargetIdentity: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    lblWGTargetCourse: TLabel;
    lblWGTargetSpeed: TLabel;
    lblWGTargetDepth: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Bevel21: TBevel;
    btnWGTargetTrack: TSpeedButton;
    btnWGRangeShow: TSpeedButton;
    btnWGRangeHide: TSpeedButton;
    btnWGBlindShow: TSpeedButton;
    btnWGBlindHide: TSpeedButton;
    btnWGLaunch: TButton;
    Label23: TLabel;
    lblWHStatus: TLabel;
    Label25: TLabel;
    lblWHQuantity: TLabel;
    Label26: TLabel;
    Bevel5: TBevel;
    Label27: TLabel;
    Label28: TLabel;
    Bevel6: TBevel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    lblWHTargetIdentity: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    lblWHTargetBearing: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label46: TLabel;
    Bevel17: TBevel;
    Label47: TLabel;
    Bevel18: TBevel;
    Label55: TLabel;
    btnWakeHomingTargetTrack: TSpeedButton;
    btnWHRangeShow: TSpeedButton;
    btnWHRangeHide: TSpeedButton;
    btnWHBlindShow: TSpeedButton;
    btnWHBlindHide: TSpeedButton;
    EdtWHTargetTrack: TEdit;
    btnWHLaunch: TButton;
    EdtWHSalvo: TEdit;
    EdtWHLaunchBearing: TEdit;
    EdtWHSeekerRange: TEdit;
    btnWHDefaultSeekerRange: TButton;
    TimerLaunch: TTimer;
    TimerRipple: TTimer;
    TmrSTOT: TTimer;
    tmrLaunchSTOT: TTimer;
    pnlLaunch1: TPanel;
    vbl1: TVrBlinkLed;
    pnlLaunch2: TPanel;
    vbl2: TVrBlinkLed;
    pnlLaunch3: TPanel;
    vbl3: TVrBlinkLed;
    pnlLaunch4: TPanel;
    vbl4: TVrBlinkLed;
    pnlLaunch5: TPanel;
    vbl5: TVrBlinkLed;
    pnlLaunch6: TPanel;
    vbl6: TVrBlinkLed;
    pnlLaunch7: TPanel;
    vbl7: TVrBlinkLed;
    pnlLaunch8: TPanel;
    vbl8: TVrBlinkLed;
    lblDestruckRange: TLabel;
    edtDestructRange: TEdit;
    lblCrossOverRange: TLabel;
    edtCrossOverRange: TEdit;
    lblNmCrossOverRange: TLabel;
    lblNmDestruckRange: TLabel;
    ScrollBox7: TScrollBox;
    ScrollBox13: TScrollBox;
    pmenuWpnCarrier: TPopupMenu;
    pmenuWpn: TPopupMenu;
    grbActivePasiveTorpedo: TGroupBox;
    PanelALL: TPanel;
    EdtWGTargetTrack: TEdit;
    pmTorpedoFiring: TPopupMenu;
    pmTorpedoRunOut: TPopupMenu;
    pmTorpedoGyroAngle: TPopupMenu;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btnAPGBilndHide: TSpeedButton;
    btnAPGRangeHide: TSpeedButton;
    btnAPGLaunch: TButton;
    btnAPGBilndShow: TSpeedButton;
    btnAPGRangeShow: TSpeedButton;
    btnTargetTrackAPG: TSpeedButton;
    bvl1: TBevel;
    bvl2: TBevel;
    bvl3: TBevel;
    bvl4: TBevel;
    EdtAPGTargetTrack: TEdit;
    EdtAPGSafetyCeiling: TEdit;
    EdtAPGSearchDepth: TEdit;
    EdtAPGSearchRadius: TEdit;
    EdtAPGSeekerRange: TEdit;
    lbl1: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lblAPGQuantity: TLabel;
    lblAPGStatus: TLabel;
    btnAccousticDisplayRangeHide: TSpeedButton;
    btnAccousticDisplayRangeShow: TSpeedButton;
    btnCancelAT: TButton;
    btnLaunchAT: TButton;
    btnPlanAT: TButton;
    btnControlControlRunAdvised: TButton;
    btnControlSafety: TButton;
    btnControlSearchDepth: TButton;
    btnControlSearchRadius: TButton;
    btnControlSeeker: TButton;
    btnDisplayBlindZonesHide: TSpeedButton;
    btnDisplayBlindZonesShow: TSpeedButton;
    btnFiringModeAT: TSpeedButton;
    btnGyroAngleAT: TSpeedButton;
    btnRunOutAT: TSpeedButton;
    btnSearchTarget: TSpeedButton;
    btnTargetDetails: TButton;
    btntControlGyroAdvised: TButton;
    btnTube1AT: TButton;
    btnTube2AT: TButton;
    btnTube3AT: TButton;
    btnTube4AT: TButton;
    bvl5: TBevel;
    bvl6: TBevel;
    bvl7: TBevel;
    bvl8: TBevel;
    EdtATTargetTrack: TEdit;
    EdtFiringModeAT: TEdit;
    EdtGyroAngleAT: TEdit;
    EdtRunOutAT: TEdit;
    EdtSafetyCeilingAT: TEdit;
    EdtSearchDepthAT: TEdit;
    EdtSearchRadiusAT: TEdit;
    EdtSeekerRangeAT: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl16: TLabel;
    lbl2: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl4: TLabel;
    lblAcousticTorpedoQuantity: TLabel;
    lblAcousticTorpedoStatus: TLabel;
    bvl14: TBevel;
    bvl15: TBevel;
    bvl16: TBevel;
    btnSRLaunch: TButton;
    btnSRTargetTrack: TSpeedButton;
    EdtSRTargetTrack: TEdit;
    lbl62: TLabel;
    lbl63: TLabel;
    lbl64: TLabel;
    lbl65: TLabel;
    lbl66: TLabel;
    lbl67: TLabel;
    lbl68: TLabel;
    lbl69: TLabel;
    lbl70: TLabel;
    lbl71: TLabel;
    lbl72: TLabel;
    lbl73: TLabel;
    lbl74: TLabel;
    lbl75: TLabel;
    lblSRQuantity: TLabel;
    lblSRStatus: TLabel;
    lblSRTargetCourse: TLabel;
    lblSRTargetDepth: TLabel;
    lblSRTargetSpeed: TLabel;
    lblSRTargetIdentity: TLabel;
    btnSRBlindHide: TSpeedButton;
    btnSRBlindShow: TSpeedButton;
    btnSRRangeHide: TSpeedButton;
    btnSRRangeShow: TSpeedButton;
    bvl17: TBevel;
    bvl18: TBevel;
    bvl19: TBevel;
    bvl20: TBevel;
    btnBombDrop: TButton;
    btnBombTarget: TSpeedButton;
    EdtBombControlSalvo: TEdit;
    EdtBombTargetTrack: TEdit;
    lbl76: TLabel;
    lbl77: TLabel;
    lbl78: TLabel;
    lbl79: TLabel;
    lbl80: TLabel;
    lbl81: TLabel;
    lbl82: TLabel;
    lbl83: TLabel;
    lblBombQuantity: TLabel;
    lblBombStatus: TLabel;
    btnBombDisplayRangeHide: TSpeedButton;
    btnBombDisplayRangeShow: TSpeedButton;
    lbl84: TLabel;
    ScrollBox8: TScrollBox;
    btnADBilndHide: TSpeedButton;
    btnADBilndShow: TSpeedButton;
    btnADRangeHide: TSpeedButton;
    btnADRangeShow: TSpeedButton;
    btnADTargetTrack: TSpeedButton;
    btnADDefaultSafetyCeiling: TButton;
    btnADDefaultSearchDepth: TButton;
    btnADLaunch: TButton;
    bvl10: TBevel;
    bvl11: TBevel;
    bvl12: TBevel;
    bvl13: TBevel;
    bvl9: TBevel;
    chkADLaunchWhithoutTarget: TCheckBox;
    chkADUseLaunchPlatformHeading: TCheckBox;
    EdtADTargetTrack: TEdit;
    EdtADLaunchBearing: TEdit;
    EdtADSafetyCeiling: TEdit;
    EdtADSearchDepth: TEdit;
    EdtADSearchRadius: TEdit;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    lbl46: TLabel;
    lbl47: TLabel;
    lbl48: TLabel;
    lbl49: TLabel;
    lbl50: TLabel;
    lbl51: TLabel;
    lbl52: TLabel;
    lbl53: TLabel;
    lbl54: TLabel;
    lbl55: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl58: TLabel;
    lbl59: TLabel;
    lbl60: TLabel;
    lbl61: TLabel;
    lbl85: TLabel;
    lblADQuantity: TLabel;
    lblADTargetCourse: TLabel;
    lblADTargetDepth: TLabel;
    lblADTargetForce: TLabel;
    lblADTargetSpeed: TLabel;
    lblAirDroppedStatus: TLabel;
    btn1: TButton;
    TmrAPG: TTimer;
    chkBombDropWhitoutTarget: TCheckBox;
    lbl86: TLabel;
    scrlbx1: TScrollBox;
    btnHybridMissileLaunch: TButton;
    btnHybridMissileDisplayBlindZonesHide: TSpeedButton;
    btnHybridMissileDisplayBlindZonesShow: TSpeedButton;
    lbl87: TLabel;
    lbl88: TLabel;
    btnHybridMissileDisplayRangeShow: TSpeedButton;
    btnHybridMissileDisplayRangeHide: TSpeedButton;
    lbl89: TLabel;
    bvl21: TBevel;
    lbl90: TLabel;
    lbl91: TLabel;
    lbl92: TLabel;
    lbl93: TLabel;
    bvl22: TBevel;
    edtHybridMissileControlSalvoSize: TEdit;
    edtHybridMissileControlCruiseAltitude: TEdit;
    edtHybridMissileControlSeekerRange: TEdit;
    lbl94: TLabel;
    lbl95: TLabel;
    btnDefaultHybridMissileControlSeekerRange: TButton;
    btnDefaultHybridMissileControlCruiseAltitude: TButton;
    lbl96: TLabel;
    edtHybridMissiletargetBearing: TEdit;
    rbHybridMissileTargetBearing: TRadioButton;
    rbHybridMissileTargetAimpoint: TRadioButton;
    rbHybridMissileTargetTrack: TRadioButton;
    edtHybridMissiletargetTrack: TEdit;
    edtHybridMissiletargetAimpoint: TEdit;
    btnSearchHybridMissileTargetTrack: TSpeedButton;
    btnAddHybridMissileTargetAimpoint: TSpeedButton;
    btnBringToHookHybridMissileTargetBearing: TButton;
    bvl23: TBevel;
    lbl97: TLabel;
    lblHybridMissileStatus: TLabel;
    lbl98: TLabel;
    lblHybridMissileQuantity: TLabel;
    bvl24: TBevel;
    lbl99: TLabel;
    lbl100: TLabel;
    lbl101: TLabel;
    edtRange: TEdit;
    edtCount: TEdit;
    lbl104: TLabel;
    edtTargetPosition: TEdit;
    btnPosition: TSpeedButton;
    lbl103: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label62: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label68: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label70: TLabel;
    edtBombDepth: TEdit;
    Label71: TLabel;
    procedure btnVectacClick(Sender: TObject);
    procedure btnWeaponClick(Sender: TObject);
    procedure btnGunControlClick(Sender: TObject);
    procedure editControlSalvoSizeKeyPress(Sender: TObject; var Key: Char);
    procedure btnChaffClick(Sender: TObject);
    procedure sbGunICWSClick(Sender: TObject);
    procedure btnSurfaceToSurfaceClick(Sender: TObject);
    procedure btnSurfaceToSurfaceMissileFiringClick(Sender: TObject);
    procedure OnMenuFiringClick(Sender: TObject);
    procedure btnSurfaceToSurfaceMissileEngagementClick(Sender: TObject);
    procedure OnMenuEngageClick(Sender: TObject);
    procedure btnSurfaceToAirOnClick(Sender: TObject);
    procedure ediSurfaceToAirSalvoKeyPress(Sender: TObject; var Key: Char);
    procedure btnSurfaceToSurfaceMissileTargetTrackDetailsClick(Sender: TObject);

    procedure btnStraightTorpedoOnClick(Sender: TObject);
    procedure btnWireGuidedTorpedoOnClick(Sender: TObject);
    procedure btnWakeHomingTorpedoOnClick(Sender: TObject);
    procedure btnAirDroppedTorpedoOnClick(Sender: TObject);
    procedure btnActivePasiveTorpedoOnClick(Sender: TObject);
    procedure btnAcousticTorpedoOnClick(Sender: TObject);

    procedure btnBombOnClick(Sender: TObject);
    procedure btnMinesDeployClick(Sender: TObject);
    procedure btnSurfaceToSurfaceMissileLauncher1Click(Sender: TObject);
    procedure pnlLaunch1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure TimerRippleTimer(Sender: TObject);
    procedure tmrSTOTTimer(Sender: TObject);
    procedure btntestClick(Sender: TObject);
    procedure tmrLaunchSTOTTimer(Sender: TObject);
    procedure btnSurfaceToSurfaceMissileLauncherMoreClick(Sender: TObject);
    procedure edtDestructRangeKeyPress(Sender: TObject; var Key: Char);
    procedure AngkaKeyPress(Sender: TObject; var Key: Char);
    procedure BombKeyPress(Sender: TObject; var Key: Char);
    procedure MineKeyPress(Sender: TObject; var Key: Char);

    procedure WHKeyPress(Sender: TObject; var Key: Char);
    procedure ADKeyPress(Sender: TObject; var Key: Char);
    procedure APGKeyPress(Sender: TObject; var Key: Char);

    procedure AcousticKeyPress(Sender: TObject; var Key: Char);
    procedure AcousticTubeOnClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnChaffFire1Click(Sender: TObject);
    procedure btnTacticalMissileTargetAimpointClick(Sender: TObject);
    procedure rdoTacticalMissileTargetAimpointClick(Sender: TObject);
    procedure rdoTacticalMissileTargetBearingClick(Sender: TObject);
    procedure btnTacticalMissileLaunchClick(Sender: TObject);
    procedure rdoTacticalMissileTargetTrackClick(Sender: TObject);
    procedure btnTacticalMissileTargetTrackClick(Sender: TObject);

    //procedure untuk radio button tactical missile
    procedure rdoTacticalMissileTarget(Sender: TObject);
    procedure editTacticalMissileTargetBearingKeyPress(Sender: TObject;
      var Key: Char);
    procedure sbTacticalMissileDisplayRangeShowClick(Sender: TObject);
    procedure sbTacticalMissileDisplayRangeHideClick(Sender: TObject);
    procedure sbTacticalMissileDisplayBlindShowClick(Sender: TObject);
    procedure sbTacticalMissileDisplayBlindHideClick(Sender: TObject);
    procedure btnLaunchAPGClick(Sender: TObject);
    procedure chkADUseLaunchPlatformHeadingClick(Sender: TObject);
    procedure btnFiringModeATClick(Sender: TObject);
    procedure btnRunOutATClick(Sender: TObject);
    procedure btnGyroAngleATClick(Sender: TObject);
    procedure OnHybridMissileClick(Sender: TObject);
    procedure chkADLaunchWhithoutTargetClick(Sender: TObject);
    procedure chkBombDropWhithoutTargetClick(Sender: TObject);
    procedure editVectacKeypress(Sender: TObject; var Key: Char);
    procedure btnAllLaunch(Sender: TObject);
    procedure ScrollBox6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TmrAPGTimer(Sender: TObject);
    procedure rdoTacticalMissileTrackMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnTacticalMissileTargetBearingClick(Sender: TObject);
    procedure edtCountKeyPress(Sender: TObject; var Key: Char);
    procedure edtRangeKeyPress(Sender: TObject; var Key: Char);
    procedure btnPositionClick(Sender: TObject);

    procedure WHbtn(Sender: TObject);
    procedure ADbtn(Sender: TObject);
    procedure APGbtn(Sender: TObject);

  private
      //nando
      FVisibleShowRange : Boolean;
      FVisibleShowBlind : Boolean;
      FVehiclePlatform  : TT3UnitContainer;
      strWeapon         : string;

      FLaunchCourse     : Integer;

      FRippleCount      : integer;
      FRippleTimer      : integer;
      FRippleDegreeLauncer : array[0..7] of Integer;
      FLauncherIDLastOn : Integer;
      FlauncherID       : Integer;
      FlaunchSTOT       : Integer;

      FMapPositionX: double;
      FMapPositionY: double;
      //FChaffType : string;
      //FChaffCategory : Byte;
      FisTrack : Boolean;

      // Weapon Interface Container
      WpnController : TfrmWeaponCtrl;
//      WpnIntCont : TList;
      Ffocused_platform: TSimObject;

      IDBomb : Integer;
      IDMine : integer;

      {$REGION 'Torpedo private variable'}

      strTargetID : string;
      TorpedoTarget : TT3PlatformInstance;
      {$ENDREGION}

      procedure HideRangeWeapon;
      procedure HideBlindWeapon;
      procedure SetRangeWeapon;
      procedure HideRangeSensor;
      procedure HideBlindSensor;
      procedure SetBlindWeapon;
      function CheckRadar:Boolean;
      procedure HideButtonWeaponWaypoint;
      procedure SetButtonWeaponWaypoint;
      procedure SetButtonWeaponWaypointBOLW;
	    procedure setOffLaunchers;
      procedure PrepareRBLW_STOT;
      procedure launchRBLW_STOT(id : integer);
      procedure SetToToteDisplay_STOT;
      procedure LaunchSTOTMissile;
      function CheckTimeBeetwenSTOT(id : integer): Double;
      procedure OnWeaponItemSelected(Sender: TObject);
      procedure OnTorpedoFiringClick(Sender : TObject);
      procedure onTorpedoRunOutClick(Sender : TObject);
      procedure onTorpedoGyroAngle(Sender : TObject);


      //---- coment dlu, tdk ada yg manggil ----//
      //Chaff Type
      //procedure OnChaffTypeItemSelected(Sender: TObject);
      //procedure SetChaffType(Sender: TT3PlatformInstance; Wp : TT3Weapon);
      //procedure UpdateTorpedoTacticalTab(Sender: TObject);
      //procedure UpdateTorpedoAcousticTab(Sender: TObject);
      //procedure UpdateGunChaffTab(Sender: TObject);
      //function CheckGunCapability(Sender:TT3PlatformInstance): boolean;
      //---- coment dlu, tdk ada yg manggil ----//

      procedure UpdateTab(Category : TWeapoonCategory;Sender : TObject);
      procedure UpdateWpnSurfaceToAirMissileTab(Sender: TObject);
      procedure UpdateMissileSurfaceToSurfaceTab(Sender: TObject);
      procedure UpdateTacticalMissileTab(Sender: TObject);

      procedure UpdateFiringModeText(Obj:TObject; mode : integer);
      procedure UpdateEngageText(mode : Integer);
      procedure UpdateHybridMissile(Sender : TObject);

      function BombPrelaunchCheck(target,weapon : TSimObject) : boolean;
      function BombTargetCheck(target, weapon : TSimObject) : boolean;
      function CalcDistanceTwoCoord(x1, x2, y1, y2 : Double):Double;

      procedure SetMapPositionX(const Value: double);
      procedure SetMapPositionY(const Value: double);

      {nando}
      procedure TacticalMissileControlSet(const Value : Boolean);
      procedure TacticalMissileWaypointSet(const Value : Boolean);
      procedure TacticalMissileSettarget(const Value : Boolean; Mode : integer);
      //function TacticalMissileCheckFCRadar(const Id : integer):Boolean;
      function  SelectController(weaponCat : TWeapoonCategory) : TfrmWeaponCtrl;
      procedure Setfocused_platform(const Value: TSimObject);
      procedure OnShowRange (Sender : Tobject; Value : boolean);
      procedure OnShowBlind (Sender : Tobject; Value : boolean);
      procedure GetAngleRange(const aBearing, aDifference : Double;
                var aFromBearing, aToBearing : Double);

      {$REGION ' Torpedo private method '}
      function TorpedoPrelaunchCheck() : boolean;
      function TorpedoTargetCheck() : boolean;
      function TorpedoWeaponCheck() : boolean;

      procedure DisplayButton(ButtonTag : Integer);

      {$ENDREGION}

  protected
    procedure DisplayTab(const i: byte); override;

  public
    { Public declarations }
    FRippleCountArray : Array[0..7] of boolean;
    FAGroupBox        : array [TWeapoonCategory] of TGroupBox;

    DetectedAirVehicle : TList;
    WpnIntCont         : TList;
    focused_weapon     : TSimObject;

    property focused_platform: TSimObject read Ffocused_platform
      write  Setfocused_platform;
    property MapPositionX : double read FMapPositionX write SetMapPositionX;
    property MapPositionY : double read FMapPositionY write SetMapPositionY;
    property IsTrack : Boolean read FisTrack write FisTrack;

    procedure InitCreate(sender: TForm); override;
    procedure Refresh_VisibleTab;

    procedure UpdateGunAutoManualTab(Sender: TObject);
    procedure UpdateGunCIWSTab(Sender: TObject);
    procedure UpdateBombDepthChargeTab(Sender: TObject);
    procedure UpdateMinesTab(Sender: TObject);
    procedure UpdateVectacTab(Sender: TObject);

    //nando & farid
    procedure HideAllRangeWeapon(pi: TT3PlatformInstance);
    procedure ShowRangeSelected(pi: TT3PlatformInstance);
    procedure HideAllBlindWeapon(pi: TT3PlatformInstance);
    procedure ShowBlindSelected(pi: TT3PlatformInstance);

    procedure RefreshPlatformWeaponsTab (pi: TT3PlatformInstance);
    procedure SetFocusedPlatform(pi: TSimObject);
    procedure SetControlledObject(ctrlObj: TObject); override;

    procedure OnWeaponPropertyChange(Sender : TObject);
    procedure CheckLauncherOn(pi : TT3PlatformInstance);

    function CalculateDistanceRBLW(aLauncherID : integer): Double;
    function CheckIDRBLW(aIdLauncher: Integer): Integer;
    function CheckIDBOLW(aIdLauncher: Integer): Integer;

    procedure FiringModeChange(Obj:TObject);
    procedure EngagementModeChange(Obj:TObject);
    procedure SetEditTextChaff;

    procedure UpdateTorpedoStraightGuidanceTab(Sender: TObject);
    procedure UpdateTorpedoWireGuidedTab(Sender: TObject);
    procedure UpdateTorpedoWakeHomingTab(Sender: TObject);
    procedure UpdateTorpedoAirDroppedTab(Sender: TObject);
    procedure UpdateTorpedoActivePassiveTab(Sender: TObject);
    procedure UpdateTorpedoAcousticTab(Sender: TObject);

    {nando}
    procedure TacticalMissileAimpointSet(const Mx, My : Double);

    {choco - launcher}
    procedure setThisLauncherState;
    procedure ClickThisLauncher(id : integer);
    procedure TurnOffAllLaunchers;

    procedure MapPosition(X,Y : double);

    procedure onDetectAirPlatform(pi : TT3PlatformInstance);
    procedure onWeaponCarrierClick(Sender: TObject);
    procedure onWeaponClick(Sender: TObject);
    procedure onRemoveDetectAirPlatform(pi : TT3PlatformInstance);
    procedure onVectacPlan(wpn : TList);

    procedure RemoveListWeapon(ctrlObj: TObject);

    procedure ClearFlagPoint;
    procedure AddFlag(id : integer);

    function DecimalInput(s: string; var Key: Char): Boolean;
  end;

implementation
{$R *.dfm}

uses
  uSimMgr_Client, uT3Vehicle,
  uT3Missile, uT3Torpedo, uT3Bomb, uT3Mine,
  uT3Gun, uBaseCoordSystem, ufTrackTargetDetail, ufToteDisplay,
  uDBAsset_Weapon, uDBAsset_Fitted, uT3DetectedTrack, ufTacticalDisplay, ufLog,
  uT3Common, ufSurfaceToSurfaceMissile, newClassASTT,
  ufrmGunAutoManual, ufrmGunCIWS, uT3HybridOnVehicle, Math, uDataModuleTTT;

var
  rMis: TRecCmd_LaunchMissile;
  rTor: TRecCmd_LaunchMissile;
  rBom: TRecCmd_LaunchBomb;
  rPanel : TRecTorpedoPanelWeapon;
  rPanel1 : TRecBombPanelWeapon;
  rGun: TRecCmd_GunFire;
  recVectac : TRecVectac;
  flagAPG, SalvoAPGGlobal, QuantityAPGGlobal  : Integer;

function DeleteAmpersand(Value: string): string;
var
  i: integer;
  found: Boolean;
begin
  found := false;

  for i := 0 to Length(Value) - 1 do
  begin
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

function IfExistItem(mnu: TPopupMenu; Caption: string): Boolean;
var
  i: integer;
  itemCaption: String;
begin
  result := false;

  for i := 0 to mnu.Items.Count - 1 do
  begin
    itemCaption := DeleteAmpersand(mnu.Items[i].Caption);
    if itemCaption = Caption then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TfmWeapon.InitCreate(sender: TForm);
begin
  inherited;

  FAGroupBox[wcMissileAirToSurfaceSubsurface]               := grbTacticalMissiles ;
  FAGroupBox[wcMissileSurfaceSubsurfaceToSurfaceSubsurface] := grbSurfaceToSurfaceMissile ;
  FAGroupBox[wcMissileSurfaceSubsurfaceToAir]               := grbSurfaceToAirMissile;
  FAGroupBox[wcMissileAirToAir]                             := grbTacticalMissiles ;
  FAGroupBox[wcMissileLandAttack]                           := grbTacticalMissiles ;
  FAGroupBox[wcHybrid]                                      := grbHybridMissile ;

  FAGroupBox[wcTorpedoStraigth]         := grbStraightRunningTorpedos ;
  FAGroupBox[wcTorpedoActiveAcoustic]   := grbActivePasiveTorpedo ;
  FAGroupBox[wcTorpedoPassiveAcoustic]  := grbActivePasiveTorpedo ;
  FAGroupBox[wcTorpedoWireGuided]       := grbWireGuidedTorpedo;
  FAGroupBox[wcTorpedoWakeHoming]       := grbWakeHomingTorpedos ;
  FAGroupBox[wcTorpedoAirDropped]       := grbAirDroppedTorpedo ;
  FAGroupBox[wcTorpedoActivePassive]    := grbActivePasiveTorpedo ;

  FAGroupBox[wcMine]      := grbMines ;

  FAGroupBox[wcGunCIWS]   := grbGunEngagementCIWS ;
  FAGroupBox[wcGunGun]    := grbGunEngagementAutomaticManualMode ;
  FAGroupBox[wcGunRocket] := grbGunEngagementAutomaticManualMode ; // kok iso ?
  FAGroupBox[wcBomb]      := grbBombDepthCharge;
  FAGroupBox[wcVectac]    := grbAirDroppedVECTAC;

  // ==========================================================
  WpnIntCont := TList.Create;

  WpnController := TfrmGunAutoManual.Create(nil);
  WpnController.WeaponCategory := wcGunGun;
  WpnController.Parent := grbGunEngagementAutomaticManualMode;
  WpnIntCont.Add(WpnController);

  WpnController := TfrmGunCIWS.Create(nil);
  WpnController.WeaponCategory := wcGunCIWS;
  WpnController.Parent := grbGunEngagementCIWS;
  WpnIntCont.Add(WpnController);

//  WpnController := TfrmWeaponCtrl.Create(nil);
//  WpnController.WeaponCategory := wcBomb;
//  WpnController.Parent := grbGunEngagementCIWS;
//  WpnIntCont.Add(WpnController);
  // ==========================================================

  IDBomb := 0;
  IDMine := 0;
end;

procedure TfmWeapon.LaunchSTOTMissile;
var
  i : Integer;
  Missile    : TT3MissilesOnVehicle;
  RBLWPoint  : TPointVehicleMissileRBLW;
  TimeEng    : Double;
  RecSend : TrecSinc_RBLW;
  LauncherOn : TFitted_Weap_Launcher_On_Board;
begin
  if focused_weapon is TT3MissilesOnVehicle then
    Missile    := TT3MissilesOnVehicle(focused_weapon)
  else
  begin
    frmTacticalDisplay.addStatus('No Weapon Assigned !!');
    Exit;
  end;

  FRippleCount := 0;
  if Missile.RBLW_STOTList.ListNonSort.Count > 0 then
  begin
    RBLWPoint := TPointVehicleMissileRBLW(Missile.RBLW_STOTList.ListNonSort[0]);

    for i := 0 to 7 do
    begin
      if FRippleCountArray[i] then
      begin
        rMis.LauncherID := i+1;
        FRippleCount := FRippleCount + 1;
        TimeEng := CheckTimeBeetwenSTOT(FRippleCount-1);

        if FRippleCount - 1 < Missile.RBLW_STOTList.ListNonSort.Count then
           RBLWPoint := TPointVehicleMissileRBLW(Missile.RBLW_STOTList.ListNonSort[FRippleCount-1]);

        //Sincron
        if (FControlled is TT3PlatformInstance) then
        begin
          with RecSend do
          begin
            cmd := 8;
            PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
            WeaponIndex := Missile.InstanceIndex;
            WeaponName := Missile.InstanceName;
            RBLWIndex := checkIDRBLW(i);
            RBLWLauncherIndex := i;
            LauncherNumber := RBLWPoint.LauncherIndex;
            LaunchDelay := Round(TimeEng);

            SeekerTurnOnRange := Missile.SeekerRangeTurn;
            HAFO := missile.HitMode.HAFO;
            CruiseAltitude := Missile.DefaultAltitude;

            case missile.HitMode.PopUp_Move of
              ppPopUP: PopUp := 1;
              ppSeaSkim: PopUp := 2;
            end;
          end;
          simMgrClient.netSend_CmdSyncRBLW(RecSend);

          with RecSend do
          begin
            cmd := 5;
            PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
            WeaponIndex := Missile.InstanceIndex;
            WeaponName := Missile.InstanceName;
            LauncherNumber := RBLWPoint.LauncherIndex;
            LaunchDelay := Round(TimeEng);
          end;
          simMgrClient.netSend_CmdSyncRBLW(RecSend);

          LauncherOn := missile.GetLauncherByID(i+1);
          if (missile.Quantity <= missile.MissileDefinition.FLaunchs.Count) and (missile.Quantity > 0) then
          begin
            simMgrClient.netSend_CmdSetLauncherQty(TT3PlatformInstance(FControlled).InstanceIndex,
              missile.InstanceIndex, LauncherOn.FData.Launcher_Type, (LauncherOn.FData.Launcher_Qty - 1));
            Sleep(100);

            SimMgrClient.netSend_CmdLaunch_Missile(rMis);
            Sleep(100);

            SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
               missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - FRippleCount));
            Sleep(100);
          end
          else if missile.Quantity > 0 then
          begin
            SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
               missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - FRippleCount));

            Sleep(100);
            SimMgrClient.netSend_CmdLaunch_Missile(rMis);
          end;

          FRippleCountArray[i] := False;
        end
        else
          frmTacticalDisplay.addStatus('Vehicle Sender Not Found');
      end;
    end;

    frmTacticalDisplay.addStatus('Ready To STOT for ' + IntToStr(FRippleCount) + ' Missile');
  end
  else
    frmTacticalDisplay.addStatus('No Waypoint Applied!!');
end;

procedure TfmWeapon.MapPosition(X, Y: double);
var
  Range: Double;
begin
  FMapPositionX := X;
  FMapPositionY := Y;

  if (FControlled is TT3PlatformInstance) then
  begin
    Range := CalcRange(TT3PlatformInstance(FControlled).PosX,
             TT3PlatformInstance(FControlled).PosY, X, Y);

    if WpnController is TfrmGunAutoManual then
      TfrmGunAutoManual(WpnController).SetRangeChaff(X,Y, Range)
    else    //buat bomb
    begin
      if (focused_weapon is TT3BombONVehicle) then
      begin
        if (Range < TT3BombONVehicle(focused_weapon).BombDefinition.FData.Max_Range) and
           (Range > TT3BombONVehicle(focused_weapon).BombDefinition.FData.Min_Range) then
        begin
          edtTargetPosition.Text := formatDM_longitude(FMapPositionX) + '  '
                       + formatDM_latitude(FMapPositionY);

          uT3Bomb.MapPositionX := FMapPositionX;
          uT3Bomb.MapPositionY := FMapPositionY;
          VSimMap.FMap.CurrentTool := mtSelectObject;
        end;
      end;
    end;

  end;
end;

procedure TfmWeapon.SetToToteDisplay_STOT;
var
  i : Integer;
  OwnShip    : TT3Vehicle;
  Missile    : TT3MissilesOnVehicle;
  RBLWPoint  : TPointVehicleMissileRBLW;
  TimeFlight : Double;
  TimeEng    : Double;
begin
  if (FControlled is TT3Vehicle) then
    OwnShip    := TT3Vehicle(FControlled)
  else
  begin
    frmTacticalDisplay.addStatus('Vehicle Sender Not Found');
    Exit;
  end;

  if focused_weapon is TT3MissilesOnVehicle then
    Missile    := TT3MissilesOnVehicle(focused_weapon)
  else
  begin
    frmTacticalDisplay.addStatus('No Weapon Assigned !!');
    Exit;
  end;

  TimeFlight := 0;
  if Missile.RBLW_STOTList.ListNonSort.Count > 0 then
  begin
    RBLWPoint := TPointVehicleMissileRBLW(Missile.RBLW_STOTList.ListNonSort[0]);
    TimeFlight := (RBLWPoint.DistanceToTarget/Missile.UnitMotion.FData.Max_Ground_Speed)*3600;
  end;

  FRippleCount := 0;
  for i := 0 to 7 do
  begin
    if FRippleCountArray[i] then
    begin
      TimeEng := CheckTimeBeetwenSTOT(FRippleCount);

      FRippleCount := FRippleCount + 1;

      frmToteDisplay.OnweaponEngageWaypoint(OwnShip, Missile, TT3PlatformInstance(Missile.TargetObject), 0, rmis.LaunchAngle , i+1,
                       TimeEng, TimeFlight + Missile.LaunchDelay);
    end;
  end;
end;

procedure TfmWeapon.tmrLaunchSTOTTimer(Sender: TObject);
begin
  inherited;

  launchRBLW_STOT(FlaunchSTOT);
  //ShowMessage('test');
end;

procedure TfmWeapon.tmrSTOTTimer(Sender: TObject);
begin
  inherited;

  //launchRBLW_STOT(FlaunchSTOT);
  //ShowMessage('test');
end;

function TfmWeapon.CheckTimeBeetwenSTOT(id: integer): Double;
var
  RBLWPoint, RBLWPoint2 : TPointVehicleMissileRBLW;
  Missile   : TT3MissilesOnVehicle;
  i : Integer;

  Distance1, Distance2 : Double;
  timer1, timer2 : Double;
  TimerDistance : Double;
  isFound : Boolean;
begin
  Result := 5;
  isFound := False;
  Distance1 := 0;
  Distance2 := 0;

  if focused_weapon is TT3MissilesOnVehicle then
    Missile := TT3MissilesOnVehicle(focused_weapon)
  else
  begin
    frmTacticalDisplay.addStatus('No Weapon Assigned !!');
    Exit;
  end;

  for i := id to Missile.RBLW_STOTList.ListNonSort.Count - 1 do
  begin
    RBLWPoint := TPointVehicleMissileRBLW(Missile.RBLW_STOTList.ListNonSort[i]);
    Distance1 := RBLWPoint.DistanceToTarget;

    if (i - 1) <> -1  then
    begin
      RBLWPoint2 := TPointVehicleMissileRBLW(Missile.RBLW_STOTList.ListNonSort[0]);
      Distance2 := RBLWPoint2.DistanceToTarget;

      isFound := True;
    end;

    Break;
  end;

  if isFound then
  begin
    timer1 := (Distance1 / Missile.UnitMotion.FData.Max_Ground_Speed )*3600;
    timer2 := (Distance2 / Missile.UnitMotion.FData.Max_Ground_Speed )*3600;
    TimerDistance := timer2 - timer1;

    frmLog.Memo1.Lines.Add(FloatToStr(TimerDistance) + ' Detik');
    Result := TimerDistance + Missile.LaunchDelay + 1;
  end
  else
  begin
    Result := Missile.LaunchDelay;
    frmLog.Memo1.Lines.Add('5 Detik');
  end;
end;

procedure TfmWeapon.launchRBLW_STOT(id : integer);
var
  RBLWPoint, RBLWPoint2 : TPointVehicleMissileRBLW;
  Missile   : TT3MissilesOnVehicle;
  i : Integer;

  Distance1, Distance2 : Double;
  timer1, timer2 : Double;
  TimerDistance : integer;
  isFound : Boolean;

  RecSend : TrecSinc_RBLW;
begin
  isFound := False;
  tmrLaunchSTOT.Enabled := False;
  Distance1 := 0;
  Distance2 := 0;

  if not(FControlled is TT3PlatformInstance) then
  begin
    frmTacticalDisplay.addStatus('Vehicle Sender Not Found');
    exit;
  end;

  if focused_weapon is TT3MissilesOnVehicle then
    Missile := TT3MissilesOnVehicle(focused_weapon)
  else
  begin
    frmTacticalDisplay.addStatus('No Weapon Assigned !!');
    Exit;
  end;

  RBLWPoint := nil;
  for i := id to Missile.RBLW_STOTList.ListNonSort.Count - 1 do
  begin
    RBLWPoint := TPointVehicleMissileRBLW(Missile.RBLW_STOTList.ListNonSort[i]);
    distance1 := RBLWPoint.DistanceToTarget;

    if i + 1 < Missile.RBLW_STOTList.ListNonSort.Count  then
    begin
      RBLWPoint2 := TPointVehicleMissileRBLW(Missile.RBLW_STOTList.ListNonSort[i+1]);
      Distance2 := RBLWPoint2.DistanceToTarget;

      isFound := True;
    end;

    Break;
  end;

  if isFound then
  begin
    timer1 := (distance1 / Missile.UnitMotion.FData.Max_Ground_Speed )*3600;
    timer2 := (Distance2 / Missile.UnitMotion.FData.Max_Ground_Speed )*3600;

    TimerDistance := Round(timer1 - Timer2);
    FlaunchSTOT := FlaunchSTOT + 1;

    //tmrSTOT.Interval := TimerDistance * 1000;
    //tmrSTOT.Enabled  := True;

    tmrLaunchSTOT.Interval := TimerDistance * 1000;
    tmrLaunchSTOT.Enabled := True;

    frmLog.Memo1.Lines.Add('Timer' +  FloatToStr(TimerDistance));
  end
  else
    setOffLaunchers;

  if TT3MissilesOnVehicle(focused_weapon).Quantity > 0  then
  begin
    //Sincron
    with RecSend do
    begin
      cmd := 5;
      PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
      WeaponIndex := Missile.InstanceIndex;
      WeaponName := Missile.InstanceName;
      LauncherNumber := RBLWPoint.LauncherIndex;
      LaunchDelay := Round(CheckTimeBeetwenSTOT(FRippleCount-1));
    end;
    simMgrClient.netSend_CmdSyncRBLW(RecSend);
    Sleep(100);

    simMgrClient.netSend_CmdLaunch_Missile(rMis);
  end;
end;

procedure TfmWeapon.CheckLauncherOn(pi: TT3PlatformInstance);
var
  i : Integer;
  Vehicle : TT3Vehicle;
begin
  if not (TT3PlatformInstance(pi) is TT3Vehicle) then
    Exit;

  Vehicle := TT3Vehicle(pi);

  for i := 0 to 7 do
  begin
    case i of
      0 : begin
            if Vehicle.launcherOn[i] then
            begin
              vbl1.EnableBlinking := True;
              vbl1.Palette1.Low   := clLime;
              vbl1.Palette1.High  := clred;

              //pnlLaunch1.BevelOuter := bvLowered
            end;
          end;
      1 : begin
            if Vehicle.launcherOn[i] then
            begin
              vbl2.EnableBlinking := True;
              vbl2.Palette1.Low   := clLime;
              vbl2.Palette1.High  := clred;

              //pnlLaunch2.BevelOuter := bvLowered
            end;
          end;
      2 : begin
            if Vehicle.launcherOn[i] then
            begin
              vbl3.EnableBlinking := True;
              vbl3.Palette1.Low   := clLime;
              vbl3.Palette1.High  := clred;

              //pnlLaunch3.BevelOuter := bvLowered
            end;
          end;
      3 : begin
            if Vehicle.launcherOn[i] then
            begin
              vbl4.EnableBlinking := True;
              vbl4.Palette1.Low   := clLime;
              vbl4.Palette1.High  := clred;

              //pnlLaunch4.BevelOuter := bvLowered
            end;
          end;
      4 : begin
            if Vehicle.launcherOn[i] then
            begin
              vbl5.EnableBlinking := True;
              vbl5.Palette1.Low   := clLime;
              vbl5.Palette1.High  := clred;

              //pnlLaunch5.BevelOuter := bvLowered
            end;
          end;
      5 : begin
            if Vehicle.launcherOn[i] then
            begin
              vbl6.EnableBlinking := True;
              vbl6.Palette1.Low   := clLime;
              vbl6.Palette1.High  := clred;

              //pnlLaunch6.BevelOuter := bvLowered
            end;
          end;
      6 : begin
            if Vehicle.launcherOn[i] then
            begin
              vbl7.EnableBlinking := True;
              vbl7.Palette1.Low   := clLime;
              vbl7.Palette1.High  := clred;

              //pnlLaunch7.BevelOuter := bvLowered
            end;
          end;
      7 : begin
            if Vehicle.launcherOn[i] then
            begin
              vbl8.EnableBlinking := True;
              vbl8.Palette1.Low   := clLime;
              vbl8.Palette1.High  := clred;

              //pnlLaunch8.BevelOuter := bvLowered
            end;
          end;
    end;
  end;
end;

procedure TfmWeapon.SetControlledObject(ctrlObj: TObject);
//var
//  mis : TT3MissilesOnVehicle;
begin
  inherited;

  focused_weapon := nil;
  if FControlled is TT3Vehicle then
  begin
    RefreshPlatformWeaponsTab(TT3PlatformInstance(FControlled));

    HideRangeWeapon;
    HideBlindWeapon;
    SetRangeWeapon;
    SetBlindWeapon;

	  SetThisLauncherState;

    frmToteDisplay.ClearAllSurfaceToSurfaceList(TT3PlatformInstance(FControlled));
    frmToteDisplay.ClearAllWaitingMissile(TT3PlatformInstance(FControlled));

    frmToteDisplay.ClearAllSurfaceToAirList(TT3PlatformInstance(FControlled));

    FisTrack := False;
    btnSurfaceToSurfacePlan.Enabled := False;
    btnSurfaceToSurfaceCancel.Enabled := False;
    btnSurfaceToSurfaceLaunch.Enabled := False;
    btnSurfaceToSurfaceMissileWaypointsEdit.Enabled := False;
    btnSurfaceToSurfaceMissileWaypointsAdd.Enabled := False;
    btnSurfaceToSurfaceMissileWaypointsDelete.Enabled := False;
    btnSurfaceToSurfaceMissileWaypointsApply.Enabled := False;
    btnSurfaceToSurfaceMissileWaypointsCancel.Enabled := False;

    if CheckRadar then
    begin
      HideRangeWeapon;
      HideBlindWeapon;
    end
    else
    begin
      SetRangeWeapon;
      SetBlindWeapon;
    end;

    if Assigned(focused_weapon) then
    begin
//      mis := TT3MissilesOnVehicle(focused_weapon);
//      UpdateFiringModeText(Byte(mis.FiringMode) + 1);
    end;
  end;
end;

procedure TfmWeapon.SetFocusedPlatform(pi: TSimObject);
begin
  if pi = FControlled then
    Exit;

  focused_platform := pi;
end;

procedure TfmWeapon.Setfocused_platform(const Value: TSimObject);
begin
  Ffocused_platform := Value;

  if Assigned(WpnController) then
    WpnController.PlatformTrgt := Ffocused_platform;
end;

procedure TfmWeapon.AngkaKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;
end;

procedure TfmWeapon.BombKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  value: Integer;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToInt(TEdit(Sender).Text, value);

    with TT3BombONVehicle(focused_weapon) do
    begin
      SimMgrClient.netSend_CmdBombProperty(TT3PlatformInstance(FControlled).InstanceIndex,
        InstanceIndex, InstanceName, value);
    end;
  end;
end;

procedure TfmWeapon.MineKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  value: Integer;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToInt(TEdit(Sender).Text, value);

    with TT3MineOnVehicle(focused_weapon) do
    begin
      SimMgrClient.netSend_CmdMineProperty(TT3PlatformInstance(FControlled).InstanceIndex,
        InstanceIndex, InstanceName, value);
    end;
  end;
end;

function TfmWeapon.BombPrelaunchCheck(target, weapon: TSimObject): boolean;
var
  range : double;
begin
  Result := true;

  if not(Assigned(weapon)) then
  begin
    raise Exception.Create('Weapon is not selected!!!');
    Result := false;
    exit;
  end;

  if not(Assigned(target)) then
  begin
    raise Exception.Create('Target is not selected!!!');
    Result := false;
    exit;
  end;

  with TT3BombONVehicle(weapon) do
  begin
    {---Target range check}
    range   := CalcRange(TT3PlatformInstance(FControlled).getPositionX, TT3PlatformInstance(FControlled).getPositionY,
                         target.getPositionX,target.getPositionY);

    if (range > BombDefinition.FData.Max_Range) then
    begin
       MessageDlg('Target out of range', mtInformation, [mbOK], 0);
       Result := false;
       exit;
    end;
  end;
end;

function TfmWeapon.BombTargetCheck(target, weapon: TSimObject): boolean;
var
  validTarget : boolean;
begin
  result := False;
  validTarget := False;
  if not(Assigned(weapon)) then
    exit;

  if not(Assigned(target)) then
    exit;

  {Capability Surface}
  if (TT3BombONVehicle(weapon).BombDefinition.FData.Anti_Sur_Capable = 1 ) then
  begin
    if target is TT3DetectedTrack then
      validTarget :=  (TT3PlatformInstance(TT3DetectedTrack(target).TrackObject).PlatformDomain = 1 )
    else
      validTarget :=  (TT3PlatformInstance(target).PlatformDomain = 1 );
  end
  {Capability Subsurface}
  else if (TT3BombONVehicle(weapon).BombDefinition.FData.Anti_SubSur_Capable = 1 ) then
  begin
    if target is TT3DetectedTrack then
      validTarget :=  (TT3PlatformInstance(TT3DetectedTrack(target).TrackObject).PlatformDomain = 2 )
    else
      validTarget :=  (TT3PlatformInstance(target).PlatformDomain = 2 );
  end
  {Capability Land}
  else if (TT3BombONVehicle(weapon).BombDefinition.FData.Anti_Land_Capable = 1 ) then
  begin
    if target is TT3DetectedTrack then
      validTarget :=  (TT3PlatformInstance(TT3DetectedTrack(target).TrackObject).PlatformDomain = 3 )
    else
      validTarget :=  (TT3PlatformInstance(target).PlatformDomain = 3 );
  end
  {Capability Land}
  else if (TT3BombONVehicle(weapon).BombDefinition.FData.Anti_Amphibious_Capable = 1 ) then
  begin
    if target is TT3DetectedTrack then
      validTarget :=  (TT3PlatformInstance(TT3DetectedTrack(target).TrackObject).PlatformDomain = vhdAmphibious )
    else
      validTarget :=  (TT3PlatformInstance(target).PlatformDomain = vhdAmphibious );
  end;

  result := validTarget;
end;

procedure TfmWeapon.btn1Click(Sender: TObject);
var
  mis : TT3MissilesOnVehicle;
begin
  inherited;

  mis := TT3MissilesOnVehicle(focused_weapon);
  mis.RangeRBLCircle := 0.7 * mis.RangeRBLCircle;
end;

procedure TfmWeapon.btnAllLaunch(Sender: TObject);
var
  I: Integer;
  Obj: TSimObject;
begin
  inherited;

  for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
  begin
    Obj := simMgrClient.SimPlatforms.getObject(i);

    if Obj <> nil then
    begin
      if Obj is TT3Vehicle then
      begin
        if Obj <>  FControlled then
        begin
          rMis.TargetPlatformID := TT3PlatformInstance(Obj).InstanceIndex;
          SimMgrClient.netSend_CmdLaunch_Missile(rMis);
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.chkBombDropWhithoutTargetClick(Sender: TObject);
begin
  inherited;

  if Assigned(focused_weapon) then
  begin
    if focused_weapon is TT3BombONVehicle then
    begin
      if chkBombDropWhitoutTarget.Checked = True then
      begin
        if simMgrClient.ISInstructor or simMgrClient.ISWasdal then begin
          TT3BombONVehicle(focused_weapon).NoCubicle  := 0;
        end
        else begin
          TT3BombONVehicle(focused_weapon).NoCubicle  :=
              simMgrClient.FMyCubGroup.FData.Group_Index;
        end;

        rPanel1.NoCubicle := TT3BombONVehicle(focused_weapon).NoCubicle;

        if FControlled is TT3PlatformInstance then
        begin
          rPanel1.ParentPlatformID :=
              TT3PlatformInstance(FControlled).InstanceIndex;
          rPanel1.TargetPlatformID :=
              TT3PlatformInstance(FControlled).InstanceIndex;
        end;

        rPanel1.TargetTrack := '---';

        rPanel1.ButtonLaunch := True;
        rPanel1.NoTarget := True;
        rPanel1.WeaponIndex := TT3BombONVehicle(focused_weapon).InstanceIndex;
        rPanel1.WeaponName := TT3BombONVehicle(focused_weapon).InstanceName;
        rPanel1.SalvoSize := TT3BombONVehicle(focused_weapon).SalvoSize;


        SimMgrClient.netSend_CmdBombSyncPanelWeapon(rPanel1);
      end;
    end;
  end;
end;

procedure TfmWeapon.btnBombOnClick(Sender: TObject);
var
  strParentTrackId, strParentTrackNumber,
  strTargetTrackId                          : string;

  intParentPlatformID, intNoCubicle,
  IntTargetPlatformID, intBatasBomb,
  SalvoBomb                                 : Integer;

  target                                    : TT3PlatformInstance;

  focusTarget                               : TSimObject;
  i : Integer;

begin
  inherited;
  if not simMgrClient.IsGameStart then
  begin
    frmTacticalDisplay.addStatus('Game Frozen');
    Exit;
  end;

  if focused_weapon = nil then
  begin
    frmTacticalDisplay.addStatus('Not Found Selected Weapon');
    Exit;
  end;

  if not(focused_weapon is TT3BombONVehicle) then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Not Bomb');
    Exit;
  end;

  if TT3BombONVehicle(focused_weapon).WeaponStatus = wsDamaged then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Damaged');
    Exit;
  end;

  if Sender is TSpeedButton then
  with TT3BombONVehicle(focused_weapon) do begin
    case TSpeedButton(Sender).Tag of
      2 : begin
            FVisibleShowRange := True;
            ShowRange         := True;
            ShowRangeSelected := (ShowRange and FVisibleShowRange);
            HideRangeSensor;
          end;
      3 : begin
            FVisibleShowRange := False;
            ShowRange         := False;
            ShowRangeSelected := (ShowRange and FVisibleShowRange);
          end;
      1 :
      begin
        if (chkBombDropWhitoutTarget.Checked = true) then
          Exit;

        {Ngecek Track ID self}
        if Assigned(FControlled) and (FControlled is TT3PlatformInstance) then
        begin
          strParentTrackId := TT3PlatformInstance(FControlled).Track_ID;
          strParentTrackNumber := FormatTrackNumber(TT3PlatformInstance(FControlled).TrackNumber);
          intParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
          EdtBombTargetTrack.Text := '';
        end
        else
        begin
          frmTacticalDisplay.addStatus('Controlled platform not defined');
          exit;
        end;

        {Ngecek Validasi target}
        if Assigned(focused_platform) then
        begin
          if not BombTargetCheck(focused_platform,focused_weapon) then
          begin
            frmTacticalDisplay.addStatus('Invalid target domain');
            exit;
          end;

          {Kalo yg di track Detected track}
          if focused_platform is TT3DetectedTrack then
          begin
            strTargetTrackId := TT3PlatformInstance(TT3DetectedTrack(focused_platform).TrackObject).Track_ID;
            IntTargetPlatformID := TT3PlatformInstance(TT3DetectedTrack(focused_platform).TrackObject).InstanceIndex;

            target := simMgrClient.FindT3PlatformByID(IntTargetPlatformID);
          end
          {Kalo yg di track Non Real Time}
          else if focused_platform is TT3NonRealVehicle then
          begin
            strTargetTrackId := IntToStr(TT3PlatformInstance(focused_platform).InstanceIndex);
            IntTargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;

            target := simMgrClient.FindNonRealPlatformByID(IntTargetPlatformID);
          end
          {Kalo yg di track Platform Instance}
          else
          begin
            strTargetTrackId := TT3PlatformInstance(focused_platform).Track_ID;
            IntTargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;

            target := simMgrClient.FindT3PlatformByID(IntTargetPlatformID);
          end;
        end
        else
        begin
          frmTacticalDisplay.addStatus('Target platform not defined');
          exit;
        end;

        if not Assigned(target) then exit;

        if Assigned(simMgrClient.findDetectedTrack(target)) then
          strTargetTrackId := FormatTrackNumber(TT3DetectedTrack(simMgrClient.findDetectedTrack(target)).TrackNumber)
        else
        begin
          if TT3PlatformInstance(target).TrackNumber = 0 then
            strTargetTrackId := strTargetTrackId
          else
            strTargetTrackId := FormatTrackNumber(TT3PlatformInstance(target).TrackNumber);
        end;

        if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
          intNoCubicle  := 0
        else
          intNoCubicle  := simMgrClient.FMyCubGroup.FData.Group_Index;

        if (strParentTrackId <> strTargetTrackId) and (strParentTrackNumber <> strTargetTrackId)then
        begin
          TargetObject            := focused_platform;

          {Paket Synch Panel Weapon Ketika Track Target}
          rPanel1.NoCubicle := intNoCubicle;
          rPanel1.ParentPlatformID := intParentPlatformID;
          rPanel1.TargetPlatformID := IntTargetPlatformID;
          rPanel1.WeaponIndex := InstanceIndex;
          rPanel1.WeaponName := InstanceName;
          rPanel1.TargetTrack := strTargetTrackId;
          rPanel1.SalvoSize := 1;
          rPanel1.ButtonLaunch := True;
          rPanel1.NoTarget := False;

          SimMgrClient.netSend_CmdBombSyncPanelWeapon(rPanel1);
//          Sleep(100);
          {----------------------------------------------------------------}
        end
        else
        begin
          frmTacticalDisplay.addStatus('Cannot target own platform');
          exit;
        end;
        rBom.BombOnVehicleID  := InstanceIndex;
      end;
    end;
  end;

  if Sender is TButton then
  begin
    with TT3BombONVehicle(focused_weapon) do begin
      {if (chkBombDropWhitoutTarget.Checked = false) then
      begin
        if (EdtBombTargetTrack.Text = '') or (EdtBombTargetTrack.Text = '---') then
          Exit;
      end;  }

      {focusTarget := simMgrClient.FindT3PlatformByID(TT3BombONVehicle(focused_weapon).TargetPlatformID);
      if not Assigned(focusTarget) then
        focusTarget := simMgrClient.FindNonRealPlatformByID(TT3BombONVehicle(focused_weapon).TargetPlatformID);

      if (focusTarget = nil) or (EdtBombTargetTrack.Text = '') and
          (chkBombDropWhitoutTarget.Checked = false) then
      begin
        frmTacticalDisplay.addStatus('Target is not selected!');
        exit;
      end; }

      EdtBombTargetTrack.Text:='';
      intBatasBomb := Quantity;
      SalvoBomb := StrToInt(EdtBombControlSalvo.Text);

      if {(BombPrelaunchCheck(focusTarget,focused_weapon)) and} (intBatasBomb >= SalvoBomb) then
      begin
        if (EdtBombControlSalvo.Text = '') or (SalvoBomb = 0) then
          ShowMessage('Input salvo size !')
        else
        begin
          {Paket Launch Bomb}    //andik >> selalu dibuat without target
//          if TBombType(BombDefinition.FData.Bomb_Type) = btRocket then  // tipe rocket bisa langsung salvo sekaligus
          if Boolean(BombDefinition.FData.Rocket_Launcher) then  // tipe rocket bisa langsung salvo sekaligus
          begin
            IDBomb := IDBomb + 1;
            rBom.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;//ParentPlatformID;
            rBom.TargetPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;//TargetPlatformID;
            rBom.ProjectileInstanceIndex := 0;
            rBom.SalvoSize := SalvoBomb;
            rBom.NoCubicle := NoCubicle;
            rBom.BombOnVehicleID := InstanceIndex;
            rBom.NameBombVbs := IDBomb;

            if TBombType(BombDefinition.FData.Bomb_Type) = btDepthCharge then
              rBom.Depth := StrToFloat(edtBombDepth.Text)
            else
              rBom.Depth := 0;

            rBom.BombType := Byte(btRocket);
            rBom.TargetPosX := MapPositionX;
            rBom.TargetPosY := MapPositionY;

            simMgrClient.netSend_CmdLaunchBomb(rBom);
//            Application.ProcessMessages;
//            Sleep(1000);
          end
          else      //tipe selain rocket drop satu2
          begin
            for I := 0 to SalvoBomb - 1 do
            begin
              IDBomb := IDBomb + 1;
              rBom.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;//ParentPlatformID;
              rBom.TargetPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;//TargetPlatformID;
              rBom.ProjectileInstanceIndex := 0;
              rBom.SalvoSize := 1;
              rBom.NoCubicle := NoCubicle;
              rBom.BombOnVehicleID := InstanceIndex;
              rBom.NameBombVbs := IDBomb;

              if TBombType(BombDefinition.FData.Bomb_Type) = btDepthCharge then
                rBom.Depth := StrToFloat(edtBombDepth.Text)
              else
                rBom.Depth := 0;

              rBom.BombType := BombDefinition.FData.Bomb_Type;
              rBom.TargetPosX := MapPositionX;
              rBom.TargetPosY := MapPositionY;

              simMgrClient.netSend_CmdLaunchBomb(rBom);
//              Application.ProcessMessages;
//              Sleep(1000);

            end;
          end;
          {------------------------------------------------------------------}

          {Paket Synch Panel Weapon Setelah Ditembakkan}
          rPanel1.NoCubicle := 0;
          rPanel1.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
          rPanel1.TargetPlatformID := 0;
          rPanel1.WeaponIndex := InstanceIndex;
          rPanel1.WeaponName := InstanceName;
          rPanel1.TargetTrack := '';
          rPanel1.SalvoSize := 1;
          rPanel1.NoTarget := True;//False;
          rPanel1.ButtonLaunch := True;//False;

          SimMgrClient.netSend_CmdBombSyncPanelWeapon(rPanel1);
//          Sleep(100);
          {----------------------------------------------------------------}

          SimMgrClient.netSend_CmdSetQuantity(rPanel1.ParentPlatformID, InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (Quantity - SalvoBomb));

          lblBombQuantity.Caption   := IntToStr(Quantity - SalvoBomb);
          ClearFlagPoint;
        end;
      end
      else
      begin
        if intBatasBomb < SalvoBomb then
          ShowMessage('Cek Quantity')
      end;
    end;
  end;
end;

procedure TfmWeapon.btnChaffClick(Sender: TObject);
begin
  if not Assigned(focused_weapon) then
    exit;

  if not(focused_weapon is TT3GunOnVehicle) then
    exit;

  with TT3GunOnVehicle(focused_weapon) do
  begin
    case TSpeedButton(Sender).Tag of
      1:
        begin
          ControlMode := 1;
          btnChaffFire.Enabled := false;
          btnChaffCeaseFire.Enabled := true;
          rGun.ControlMode := ControlMode;
          grbGunEngagementAutomaticManualMode.BringToFront;

          {if TT3ChaffOnVehicle(focusedECM).Quantity <= 0 then exit;
          if TT3ChaffOnVehicle(focusedECM).ChaffLaunchers.Count < TT3ChaffOnVehicle(focusedECM).Launcher then exit;

          rLauncher.StateID := 1;
          SimMgrClient.netSend_CmdLaunchChaffState(rLauncher);}
        end;
      2:
        begin
          ControlMode := 2;
          btnChaffFire.Enabled := true;
          btnChaffCeaseFire.Enabled := false;
          rGun.ControlMode := ControlMode;
          grbGunEngagementAutomaticManualMode.BringToFront;

          {if TT3ChaffOnVehicle(focusedECM).ChaffLaunchers.Count < TT3ChaffOnVehicle(focusedECM).Launcher then exit;

          rLauncher.StateID := 0;
          SimMgrClient.netSend_CmdLaunchChaffState(rLauncher); }
        end;
      3:
        begin
          ControlMode := 3;
          btnChaffFire.Enabled := true;
          btnChaffCeaseFire.Enabled := false;
          rGun.ControlMode := ControlMode;
        end;
      4:begin
          FVisibleShowRange := True;

          ShowRange := true;
          ShowRangeSelected := ShowRange and FVisibleShowRange;

          HideRangeSensor;
        end;
      5:begin
          FVisibleShowRange := False;

          ShowRange := false;
          ShowRangeSelected := ShowRange and FVisibleShowRange;
        end;
      6:begin
          FVisibleShowBlind := True;

          ShowBlind := True;
          ShowBlindSelected := ShowBlind and FVisibleShowBlind;
          HideBlindSensor;
        end;
      7:begin
          FVisibleShowBlind := False;

          ShowBlind := False;
          ShowBlindSelected := ShowBlind and FVisibleShowBlind;
        end;
    end;

    {if Sender.ClassType = TButton then
      case TButton(Sender).Tag of
        1:
          begin
            projectiles := PrepareShoot;
            projectiles.Shoot;

            lbCIWSQuantity.Caption := IntToStr(Quantity);
            SimMgrClient.netSend_CmdGunFire(rGun);

            case WeaponStatus of
              wsAvailable: lblCIWSStatus.Caption := 'Available';
              wsUnavailable: lblCIWSStatus.Caption := 'Unavailable';
              wsDamaged: lblCIWSStatus.Caption := 'Damaged';
            end;
          end;
      end;  }
  end;
end;

procedure TfmWeapon.btnChaffFire1Click(Sender: TObject);
//var
//  rLauncher     : TRecCmd_LaunchChaffState;
//  rLauncherProp : TRecCmd_ChaffLauncherProperties;
//  ecm     : TT3CounterMeasure;
//  device  : TT3DeviceUnit;
//  lc : TObject;
//  DblVal, DblVal1 : Double;
//  blind : boolean;
begin
  inherited;

  {TryStrToFloat(Edit2.Text,DblVal);
  TryStrToFloat(Edit3.Text,DblVal1);

  if DblVal > TT3GunOnVehicle(focused_weapon).GunDefinition.FData.Max_Range then
    exit;

  if TT3GunOnVehicle(focused_weapon).InsideBlindZonePos(FMapPositionX, FMapPositionY) then
    exit;

  for i := 0 to TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Count - 1 do begin
    device := TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Items[i];
    if not (device is TT3CounterMeasure) then continue;
    if device is TT3ChaffLauncher then continue;

    ecm := TT3CounterMeasure(device);
    if not (device is TT3ChaffOnVehicle) then continue;
    if (TT3ChaffOnVehicle(device).ChaffLaunchers.Count > 0) and (TT3ChaffOnVehicle(device).InstanceName = Edit1.Text) then begin
      lc := TT3ChaffOnVehicle(device).ChaffLaunchers.Items[TT3ChaffOnVehicle(device).Launcher - 1];

      rLauncherProp.ParentPlatformID := TT3PlatformInstance(TT3ChaffLauncher(lc).Parent).InstanceIndex;
      rLauncherProp.LauncherID := TT3ChaffLauncher(lc).Number;
      rLauncherProp.Delay := TT3ChaffLauncher(lc).Delay;
      rLauncherProp.SalvoSize := 1;
      rLauncherProp.BloomRange := DblVal;
      rLauncherProp.BloomAltitude := DblVal1;
      rLauncherProp.Bearing := TT3ChaffLauncher(lc).Angle;
      rLauncherProp.MapPositionX := FMapPositionX;
      rLauncherProp.MapPositionY := FMapPositionY;
      rLauncherProp.IDState := 1;

      SimMgrClient.netSend_CmdLauncherChaffProp(rLauncherProp);

      rLauncher.ParentPlatformID := TT3PlatformInstance(TT3ChaffOnVehicle(device).Parent).InstanceIndex;
      rLauncher.ChaffOnVehicleID := TT3ChaffOnVehicle(device).InstanceIndex;
      rLauncher.LauncherID       := TT3ChaffOnVehicle(device).Launcher;
      rLauncher.SessionID := simMgrClient.SessionID;
    end;


    if Sender.ClassType = TButton then
    case TButton(Sender).Tag of
      1:
        begin
          if TT3ChaffOnVehicle(device).Quantity <= 0 then exit;
          if TT3ChaffOnVehicle(device).ChaffLaunchers.Count < TT3ChaffOnVehicle(device).Launcher then exit;

          rLauncher.StateID := 1;
          SimMgrClient.netSend_CmdLaunchChaffState(rLauncher);
        end;
      2:
       begin
         if TT3ChaffOnVehicle(device).ChaffLaunchers.Count < TT3ChaffOnVehicle(device).Launcher then exit;

          rLauncher.StateID := 0;
          SimMgrClient.netSend_CmdLaunchChaffState(rLauncher);
       end;

    end;

  end; }
end;

procedure TfmWeapon.btnFiringModeATClick(Sender: TObject);
var
  Pos : TPoint;
begin
  inherited;
  GetCursorPos(pos);
  pmTorpedoFiring.Popup(pos.X, pos.Y);
end;

{ TODO 1 : Cek baris berikut, btnGunControlClick di komen dulu karena perubahan di frmweapon gun }
procedure TfmWeapon.btnGunControlClick(Sender: TObject);
{var
  pi: TT3PlatformInstance;
  myTrackId, targetTrackId: string;
  projectiles : TT3GunShoot;
  theGun: TT3GunOnVehicle;
  ve : TT3Vehicle;
  sensor : TT3Sensor;
  I,j : Integer;
  rFC : TRecCmd_FC;
  //li : TlistItem;
  fPlatform : TT3PlatformInstance;
  posX1, posX2, posY1, posY2: Double;
  isInsideBlindZone, isInsideBlindzoneGun : Boolean; }
begin
  {if focused_weapon = nil then exit;

  if focused_platform = nil then       //mk
  begin
    frmTacticalDisplay.addStatus('Target is not selected!');
    exit;
  end;

  if focused_weapon.ClassType <> TT3GunOnVehicle then exit;
  ve := TT3Vehicle(FControlled);

  if Sender is TSpeedButton then
    with TT3GunOnVehicle(focused_weapon) do
    begin
      rGun.GunID := GunDefinition.FData.Gun_Index;
      rGun.ParentPlatformID := TT3PlatformInstance(TT3GunOnVehicle(focused_weapon).Parent).InstanceIndex;

      if Sender.ClassType = TSpeedButton then
      case TSpeedButton(Sender).Tag of
        1:
        begin
          ControlMode := 1;
          btnTargetSearch.Enabled := true;
          rGun.ControlMode := ControlMode;
          ScrollBox7.BringToFront;
        end;
        2:
        begin
          ControlMode := 2;
          btnTargetSearch.Enabled := true;
          rGun.ControlMode := ControlMode;
          ScrollBox7.BringToFront;
        end;
        3:
        begin
          ControlMode := 3;
          btnTargetSearch.Enabled := true;
          rGun.ControlMode := ControlMode;
          ScrollBox13.BringToFront;
        end; // cease fire
        4:
        begin
          SalvoMode := 1;
          rGun.SalvoMode := SalvoMode;
        end;
        5:
        begin
          SalvoMode := 2;
          rGun.SalvoMode := SalvoMode;
        end;
        6:
        begin
          FVisibleShowRange := True;

          ShowRange := true;
          ShowRangeSelected := ShowRange and FVisibleShowRange;

          HideRangeSensor;
        end;
        7:
        begin
          FVisibleShowRange := False;

          ShowRange := false;
          ShowRangeSelected := ShowRange and FVisibleShowRange;
        end;
        8:
        begin
          FVisibleShowBlind := True;

          ShowBlind := true;
          ShowBlindSelected := ShowBlind and FVisibleShowBlind;
          HideBlindSensor;
        end;
        9:
        begin
          FVisibleShowBlind := False;

          ShowBlind := false;
          ShowBlindSelected := ShowBlind and FVisibleShowBlind;
        end;
        10 :
        begin
          if Assigned(FControlled) then
            myTrackId := TT3PlatformInstance(FControlled).Track_ID;

          if Assigned(focused_platform) then
          begin
            targetTrackId := TT3PlatformInstance(focused_platform).Track_ID;

            if myTrackId <> targetTrackId then
            begin
              if not CheckGunCapability(TT3PlatformInstance(focused_platform)) then exit;

              if TT3PlatformInstance(focused_platform).TrackNumber = 0 then
                editGunEngagementTargetTrack.Text := targetTrackId
              else
                editGunEngagementTargetTrack.Text := FormatTrackNumber(TT3PlatformInstance(focused_platform).TrackNumber);

              btnGunEngagementAssign.Enabled := true;
              case GunDefinition.FData.Fire_Cntl_Director_Req of
                1 : btnGunEngagementFire.Enabled := false;
                0 : btnGunEngagementFire.Enabled := True;
              end;
              //assignnya dengan menggunakan tombol assign
              //TargetObject := focused_platform;
              //rGun.TargetPlatformID := TT3PlatformInstance(TargetObject).InstanceIndex;
            end;
          end;
        end;
      end;
    end
    else if Sender.ClassType = TButton then
    begin
      if focused_platform = nil then       //mk
      begin
        frmTacticalDisplay.addStatus('Target is not selected!');
        exit;
      end;

      theGun := TT3GunOnVehicle(focused_weapon);
      rGun.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
      rGun.GunID := TT3Weapon(focused_weapon).InstanceIndex;
      rGun.TargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;
      case TButton(Sender).Tag of
        1 : //assign
          begin
            //set target
            if not Assigned(Focused_Platform) then
            Exit;


           // if TT3GunOnVehicle(focused_weapon).GunDefinition.FData.Fire_Cntl_Director_Req = 1 then
           // begin
              for I := 0 to ve.Devices.Count - 1 do
              begin
                sensor := ve.Devices.Items[i];

                if sensor is TT3Radar then
                begin
                  if (TT3Radar(sensor).RadarDefinition.FDef.Num_FCR_Channels > 0)
                       and (TT3Radar(sensor).OperationalStatus = sopOn)
                       and (TT3Radar(sensor).EmconOperationalStatus = EmconOff)then
                  begin
                     //check isExits
                    for j := 0 to TT3Radar(sensor).AssignedTrack.Count - 1 do
                    begin
					            fPlatform := TT3Radar(sensor).AssignedTrack.Items[j];    //mk+yy 10052012
                      //li := TT3Radar(sensor).AssignedTrack.Items[j];
                      //fPlatform := li.Data;

                      //if exist -> Exit
                      if fPlatform = nil then
                        continue;

                      if fPlatform.Equals(Focused_Platform) then
                        Exit;
                    end;

                    // gak bisa nambah lagi jika tlh sama atau melebihi kapasitas assignednya.
                    if TT3Radar(sensor).AssignedTrack.Count >= TT3Radar(sensor).RadarDefinition.FDef.Num_FCR_Channels then
                      Exit;

                    posX1 := TT3PlatformInstance(FControlled).PosX;
                    posY1 := TT3PlatformInstance(FControlled).PosY;
                    posX2 := TT3PlatformInstance(Focused_Platform).PosX;
                    posY2 := TT3PlatformInstance(Focused_Platform).PosY;

                    isInsideBlindZone := TT3Radar(sensor).InsideBlindZone(Focused_Platform);
                    isInsideBlindzoneGun := TT3GunOnVehicle(focused_weapon).InsideBlindZone(focused_platform);



                    rFC.PlatformParentID := TT3PlatformInstance(FControlled).InstanceIndex;
                    if Focused_Platform is TT3PlatformInstance then
                    begin
                      rFC.PlatformID := TT3PlatformInstance(Focused_Platform).InstanceIndex;
                    end
                    else if Focused_Platform is TT3DetectedTrack then
                    begin
                      rFC.PlatformID := TT3PlatformInstance(TT3DetectedTrack(Focused_Platform).TrackObject).InstanceIndex;
                    end;

                    //cek range
                    if (CalcRange(posX1, posY1, posX2, posY2) < TT3Radar(sensor).DetectionRange)
                      and (CalcRange(posX1, posY1, posX2, posY2) < theGun.GunDefinition.FData.Max_Range)
                      and not isInsideBlindZone and not isInsideBlindzoneGun then
                    begin
                      rFC.FCRadarID := TT3Radar(sensor).InstanceIndex;
                      rFC.OrderID := CORD_FC_ASSIGN;
                      simMgrClient.netSend_Cmd_FireControl(rFC);

                      TT3GunOnVehicle(focused_weapon).TargetObject := focused_platform;
                      rGun.TargetPlatformID := TT3PlatformInstance(TT3GunOnVehicle(focused_weapon).TargetObject).InstanceIndex;
          //            btnGunEngagementBreak.Enabled := true;
          //            btnGunEngagementFire.Enabled := true;
          //            btnGunEngagementCease.Enabled := true;
                      rGun.OrderID := CORD_ID_assign;
                      simMgrClient.netSend_CmdGunFire(rGun);
                    end;

                  end;
                end;
              end;
            //end
            //else
            //begin

            //end;
          end;
        2 : //break
          begin
            //TT3GunOnVehicle(focused_weapon).TargetObject := nil;
              for I := 0 to ve.Devices.Count - 1 do
              begin
                sensor := ve.Devices.Items[i];

                if sensor is TT3Radar then
                begin
                  if (TT3Radar(sensor).RadarDefinition.FDef.Num_FCR_Channels > 0) then
                  begin
                    rFC.PlatformParentID := TT3PlatformInstance(FControlled).InstanceIndex;
                    rFC.PlatformID := 0;//TT3PlatformInstance(lstFireControlAssetsAssignedTracks.Selected.Data).InstanceIndex;
                    rFC.FCRadarID := TT3Radar(sensor).InstanceIndex;
                    rFC.OrderID := CORD_FC_BREAKALL;
                    simMgrClient.netSend_Cmd_FireControl(rFC);
                    break;
                  end;
                end;
              end;

            rGun.TargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;
            //btnGunEngagementAssign.Enabled := true;
            rGun.OrderID := CORD_ID_break;
            simMgrClient.netSend_CmdGunFire(rGun);
          end;
        3: //fire
          begin
            //projectiles := TT3GunOnVehicle(focused_weapon).PrepareShoot;
            //simMgrClient.AssignWeaponEvent(projectiles);
            //projectiles.Shoot;

            rGun.OrderID  := CORD_ID_fire;
            rGun.SalvoSize := theGun.SalvoSize;
            rGun.SalvoMode := theGun.SalvoMode;
            rGun.ControlMode := theGun.ControlMode;
            rGun.GunCapacityRemain := theGun.Quantity;
            rGun.TargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;
            if rGun.TargetPlatformID = 0 then
              Exit;
//
//            case TT3GunOnVehicle(focused_weapon).SalvoMode of
//              0 :
//                begin
//                  btnGunEngagementFire.Enabled := false;
//                end;
//              1 :
//                begin
//                  btnGunEngagementFire.Enabled := True;
//                end;
//            end;
//
            SimMgrClient.netSend_CmdGunFire(rGun);
            //lbGunEngagementQuantity.Caption := IntToStr(TT3GunOnVehicle(focused_weapon).Quantity - 1);

//            case TT3GunOnVehicle(focused_weapon).WeaponStatus of
//              wsAvailable: lblGunEngagementStatus.Caption := 'Available';
//              wsUnavailable: lblGunEngagementStatus.Caption := 'Unavailable';
//              wsDamaged: lblGunEngagementStatus.Caption := 'Damaged';
//            end;
          end;
        4 : //cease
          begin
            //menghentikan tembakan : asusmsi awal dengan menghentikan assignment Gun
            TT3GunOnVehicle(focused_weapon).TargetObject := nil;
            rGun.TargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;
//
//            btnGunEngagementAssign.Enabled := true;
//            if TT3GunOnVehicle(focused_weapon).IsAssigned then
//              btnGunEngagementFire.Enabled := True
//            else
//              btnGunEngagementFire.Enabled := True;
//
            rGun.OrderID := CORD_ID_cease;
            simMgrClient.netSend_CmdGunFire(rGun);
          end;
      end;
    end;

    if TT3GunOnVehicle(focused_weapon).WeaponCategory = wcGunRocket then
      UpdateTab(wcGunRocket, focused_weapon)
    else if TT3GunOnVehicle(focused_weapon).WeaponCategory = wcGunGun then
      UpdateTab(wcGunGun, focused_weapon);
}
end;

procedure TfmWeapon.btnGyroAngleATClick(Sender: TObject);
var
  Pos : TPoint;
begin
  inherited;
  GetCursorPos(pos);
  pmTorpedoGyroAngle.Popup(pos.X, pos.Y);
end;

procedure TfmWeapon.btnLaunchAPGClick(Sender: TObject);
begin
  inherited;

end;

{procedure TfmWeapon.SetDeployedObject(const Value: TObject);
begin
  FDeployedObject := Value;
end;  }

procedure TfmWeapon.SetMapPositionX(const Value: double);
begin
  FMapPositionX := Value;
  SetEditTextChaff;
end;

procedure TfmWeapon.SetMapPositionY(const Value: double);
begin
  FMapPositionY := Value;
  SetEditTextChaff;
end;

{ TODO 1 : Cek baris berikut, SetEditTextChaff di komen dulu karena perubahan di frmweapon }
procedure TfmWeapon.SetEditTextChaff;
//var
//  v : TT3Vehicle;
//  Range : Double;
begin
//  v := TT3Vehicle(TT3PlatformInstance(FControlled));
//  Range := CalcRange(v.getPositionX, v.getPositionY , FMapPositionX, FMapPositionY);

  //Edit2.Text := FormatFloat('0.00', Range);
end;

//function TfmWeapon.CheckGunCapability(Sender: TT3PlatformInstance): boolean;
//begin
//  Result := False;
//
//  case TVehicle_Definition(Sender.UnitDefinition).FData.Platform_Domain of
//    0: //Air
//      begin
//        if TT3GunOnVehicle(focused_weapon).GunDefinition.FData.Anti_Air_Capable = 1 then
//        begin
//          Result := True;
//          FChaffCategory := 0;
//          FChaffType := 'Air';
//        end;
//      end;
//    1: //Surface
//      begin
//        if TT3GunOnVehicle(focused_weapon).GunDefinition.FData.Anti_Sur_Capable = 1 then
//        begin
//          Result := True;
//          FChaffCategory := 1;
//          FChaffType := 'Surface';
//        end;
//      end;
//    2: //Subsurface
//      begin
//        Result := True;
//      end;
//    3: //Land
//      begin
//        if TT3GunOnVehicle(focused_weapon).GunDefinition.FData.Anti_Land_Capable = 1 then
//        begin
//          Result := True;
//          FChaffCategory := 3;
//          FChaffType := 'Land';
//        end;
//      end;
//    4: //Amphibious
//      begin
//        Result := True;
//      end;
//  end;
//end;

procedure TfmWeapon.btnMinesDeployClick(Sender: TObject);
var
  batasMine : Integer;
  rec       : TRecCmd_LaunchMine;
begin
  inherited;
  if not simMgrClient.IsGameStart then
  begin
    frmTacticalDisplay.addStatus('Game Frozen');
    Exit;
  end;

  if focused_weapon = nil then
  begin
    frmTacticalDisplay.addStatus('Not Found Selected Weapon');
    Exit;
  end;

  if not(focused_weapon is TT3MineOnVehicle)then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Not Mine');
    Exit;
  end;

  if TT3MineOnVehicle(focused_weapon).WeaponStatus = wsDamaged then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Damaged');
    Exit;
  end;

  if Sender is TButton then
  begin
    with TT3MineOnVehicle(focused_weapon) do
    begin

      batasMine := Quantity;

      if (Quantity < StrToInt(edtCount.Text)) then
      begin
        ShowMessage('Jumlah mine yang disebar melebihi jumlah kuantitas!!!');
        Exit;
      end;

      if StrToInt(edtCount.Text) <= 0  then
      begin
        ShowMessage('Tentukan jumlah mine yang akan disebar!!!');
        Exit;
      end;

      if StrToInt(edtRange.Text) <= 0  then
      begin
        ShowMessage('Invalid area range!!!');
        Exit;
      end;

      if batasMine > 0 then
      begin
        if (EdtMinesDepth.Text = '')then
          ShowMessage('Data Kedalaman belum diisi')
        else
        begin
          IDMine := IDMine + 1;
          rec.ParentPlatformID  := TT3PlatformInstance(FControlled).InstanceIndex;
          rec.ProjectileInstanceIndex := 0;
          rec.NoCubicle := NoCubicle;
          rec.MineOnVehicleID := InstanceIndex;
          rec.Depth := StrToFloat(EdtMinesDepth.Text);
          rec.Range := 1;//StrToFloat(edtRange.Text);
          rec.Count := 1;//StrToInt(edtCount.Text);     //deploy yang sekarang bukan system area, tapi deploy satu-satu
          rec.NameMineVbs := IDMine;
          simMgrClient.netSend_CmdLaunchMine(rec);
          {------------------------------------------------------------------}

          SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                      InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (Quantity - StrToInt(edtCount.Text)));

          lbMinesQuantity.Caption := IntToStr(Quantity - StrToInt(edtCount.Text));
        end;
      end
      else
        ShowMessage('Cek Quantity');
    end;

  end;
end;

procedure TfmWeapon.btnPositionClick(Sender: TObject);
begin
//  inherited;
   VSimMap.FMap.CurrentTool := mtRocketBomb;
end;

procedure TfmWeapon.btnRunOutATClick(Sender: TObject);
var
  Pos : TPoint;
begin
  inherited;
  GetCursorPos(pos);
  pmTorpedoRunOut.Popup(pos.X, pos.Y);
end;

procedure TfmWeapon.btnSurfaceToAirOnClick(Sender: TObject);
var
  myTrackId, targetTrackId: string;

  Missile : TT3MissilesOnVehicle;
  RecSend : TrecSinc_RBLW;

  Distance, TimeEngaged, TimeIntercept, Range : Double;
  i, Salvo : Integer;

  RecMissileEnvi : TrecMissile_Envi;
  sObject : TSimObject;
  trackNum : string;
begin
  inherited;

  if focused_weapon = nil then exit;
  if not(focused_weapon is TT3MissilesOnVehicle) then exit;

  Missile := TT3MissilesOnVehicle(focused_weapon);

  if Missile.WeaponStatus = wsDamaged then
  begin
    frmTacticalDisplay.addStatus('Weapon Status is Damage');
    Exit;
  end;

  if Sender is TSpeedButton then
  case TSpeedButton(Sender).Tag of
    1 : begin
          FVisibleShowRange := True;
          TT3MissilesOnVehicle(focused_weapon).ShowRange := true;

          TT3MissilesOnVehicle(focused_weapon).ShowRangeSelected := FVisibleShowRange and TT3MissilesOnVehicle(focused_weapon).ShowRange;

          HideRangeSensor;
        end;
    2 : begin
          FVisibleShowRange := False;
          TT3MissilesOnVehicle(focused_weapon).ShowRange := false;

          TT3MissilesOnVehicle(focused_weapon).ShowRangeSelected := FVisibleShowRange and TT3MissilesOnVehicle(focused_weapon).ShowRange;
          HideRangeSensor;
        end;
    3 : begin
          FVisibleShowBlind := True;
          TT3MissilesOnVehicle(focused_weapon).ShowBlind := true;

          TT3MissilesOnVehicle(focused_weapon).ShowBlindSelected := FVisibleShowBlind and TT3MissilesOnVehicle(focused_weapon).ShowBlind;
          HideBlindSensor;
        end;
    4 : begin
          FVisibleShowBlind := False;
          TT3MissilesOnVehicle(focused_weapon).ShowBlind := False;

          TT3MissilesOnVehicle(focused_weapon).ShowBlindSelected := FVisibleShowBlind and TT3MissilesOnVehicle(focused_weapon).ShowBlind;
          HideBlindSensor;
        end;
    5 : begin
          if not Assigned(FControlled) then
          begin
            frmTacticalDisplay.addStatus('Vehicle Sender Not Found');
            FisTrack := False;
            Exit;
          end;
          if not Assigned(focused_platform) then
          begin
            frmTacticalDisplay.addStatus('Vehicle Target Not Found');
            rMis.TargetPlatformID := 0;
            FisTrack := False;
            Exit;
          end;
          if TT3PlatformInstance(focused_platform).PlatformDomain <> 0 then
          begin
            frmTacticalDisplay.addStatus('Target Domain Not Same With Missile');
            editSurfaceToAirTrack.Text := '';
            FisTrack := False;
            Exit;
          end;

          myTrackId := TT3PlatformInstance(FControlled).Track_ID;

          if focused_platform is TT3NonRealVehicle then
            targetTrackId := IntToStr(TT3PlatformInstance(focused_platform).TrackNumber)
          else
            targetTrackId := TT3PlatformInstance(focused_platform).Track_ID;

          sObject := simMgrClient.findDetectedTrack(focused_platform);
          if Assigned(sObject) then
            trackNum := FormatTrackNumber(TT3DetectedTrack(sObject).TrackNumber)
          else
            trackNum := TT3PlatformInstance(focused_platform).TrackLabel;

          if myTrackId <> targetTrackId then
          begin
            if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
              editSurfaceToAirTrack.Text := targetTrackId
            else
              editSurfaceToAirTrack.Text := trackNum;

            Missile.TargetObject := focused_platform;

            lbSurfaceToAirCourse.Caption  := FormatCourse(TT3Vehicle(focused_platform).Course);
            lbSurfaceToAirGround.Caption  := FormatSpeed(TT3Vehicle(focused_platform).Speed);
            lbSurfaceToAirAltitude.Caption := FormatAltitudeTrack(TT3Vehicle(focused_platform).Altitude);

            rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
            rMis.TargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;
            rMis.MissileID        := missile.InstanceIndex;

            btSurfaceToAirPlan.Enabled := True;
          end
          else
          begin
            frmTacticalDisplay.addStatus('Cant Track Own Vehicle');
            editSurfaceToSurfaceMissileTargetTrack.Text := '';
          end;
        end;
  end;

  if Sender is TButton then
  case TButton(Sender).Tag of
    1 :
      begin
        Range := CalcRange(TT3PlatformInstance(FControlled).getPositionX, TT3PlatformInstance(FControlled).getPositionY
                 ,TT3PlatformInstance(Missile.TargetObject).getPositionX, TT3PlatformInstance(Missile.TargetObject).getPositionY);

        if Range <= TMissile_On_Board(Missile.UnitDefinition).FDef.Min_Range then
        begin
          frmTacticalDisplay.addStatus('Target is to close');
        end
        else
        if Range >= TMissile_On_Board(Missile.UnitDefinition).FDef.Max_Range then
        begin
          frmTacticalDisplay.addStatus('Target is too far');
        end
        else
        if (Range > TMissile_On_Board(Missile.UnitDefinition).FDef.Min_Range) and
           (Range < TMissile_On_Board(Missile.UnitDefinition).FDef.Max_Range) then
        begin
          TT3MissilesOnVehicle(focused_weapon).Planned := true;
          btSurfaceToAirCancel.Enabled := true;
          btSurfaceToAirLaunch.Enabled := true;
          btSurfaceToAirPlan.Enabled   := false;

          Missile.RangeRBLCircle := 5;

          frmToteDisplay.OnWeaponEngaged(Missile, Missile.TargetObject, 0);

          lbSurfaceToAirStatus.Caption := 'Engaged';
          TimeEngaged := Missile.LaunchDelay;
          lbSurfaceToAirTimeToWait.Caption := FormatDateTime('hh : mm : ss',
            timeof(TimeEngaged / (3600*24)));
          Distance := CalcRange(Missile.getPositionX, Missile.getPositionY,
                          Missile.TargetObject.getPositionX, Missile.TargetObject.getPositionY);
          TimeIntercept := (Distance/Missile.UnitMotion.FData.Max_Ground_Speed)*3600;
          lbSurfaceToAirTimeToIntercept.Caption := FormatDateTime('hh : mm : ss',
            timeof(TimeIntercept / (3600*24)));
        end;
      end;
    2 :
      begin
        TT3MissilesOnVehicle(focused_weapon).Planned := False;
        btSurfaceToAirCancel.Enabled := false;
        btSurfaceToAirLaunch.Enabled := false;
        btSurfaceToAirPlan.Enabled   := true;

        frmToteDisplay.ClearAllSurfaceToAirList(TT3PlatformInstance(FControlled));
        lbSurfaceToAirStatus.Caption          := '---';
        lbSurfaceToAirTimeToWait.Caption      := '---';
        lbSurfaceToAirTimeToIntercept.Caption := '---';
      end;
    3 :
      begin
        //projectil := TT3MissilesOnVehicle(focused_weapon).PrepareLaunch;
        //simMgrClient.AssignWeaponEvent(projectil);
        //projectil.Parent     := nil;
        //TT3MissilesOnVehicle(focused_weapon).Planned := false;

//        projectil.Launched   := true;
//        projectil.Planned    := true;

        with TT3MissilesOnVehicle(focused_weapon) do
        begin
          if InsideBlindZone(focused_platform) then
          begin
            TT3MissilesOnVehicle(focused_weapon).Planned := False;
            btSurfaceToAirPlan.Enabled   := True;
            btSurfaceToAirCancel.Enabled := False;
            btSurfaceToAirLaunch.Enabled := False;
            frmTacticalDisplay.addStatus('Target In Blind Zone Area');

            Exit;
          end;
        end;

        if TryStrToInt(ediSurfaceToAirSalvo.Text, Salvo) then
        begin
          frmToteDisplay.ClearAllSurfaceToAirList(TT3PlatformInstance(FControlled));
          lbSurfaceToAirStatus.Caption          := 'Launched';
          lbSurfaceToAirTimeToWait.Caption      := '---';
          lbSurfaceToAirTimeToIntercept.Caption := '---';

          with RecMissileEnvi do
          begin
            platformID    := TT3PlatformInstance(FControlled).InstanceIndex;
            WeaponIndex   := missile.InstanceIndex;
            WeaponName    := missile.InstanceName;
            Missile_Kind  := Integer(Missile.WeaponCategory);
            MIssile_Method:= Integer(missile.FiringMode);
          end;
          simMgrClient.netSend_CmdSyncMissileEnvi(RecMissileEnvi);
          Sleep(500);

          for i := 0 to Salvo - 1 do
          begin
            if Missile.Quantity > 0 then
            begin
              with RecSend do
              begin
                cmd := 7;
                PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                WeaponIndex := Missile.InstanceIndex;
                WeaponName := Missile.InstanceName;
                LaunchDelay := Missile.LaunchDelay * (i+1);
              end;
              simMgrClient.netSend_CmdSyncRBLW(RecSend);
              Sleep(500);//Sleep(100);

              with RecSend do
              begin
                cmd := 8;
                PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                WeaponIndex := Missile.InstanceIndex;
                WeaponName := Missile.InstanceName;
                SeekerTurnOnRange := Missile.SeekerRangeTurn;
                HAFO := Missile.HitMode.HAFO;
                CruiseAltitude := TT3PlatformInstance(missile.TargetObject).getPositionZ
                  * C_Degree_To_NauticalMile *  C_NauticalMile_To_Feet;
                PopUp := 2;
              end;
              simMgrClient.netSend_CmdSyncRBLW(RecSend);
              Sleep(500);//Sleep(100);

              SimMgrClient.netSend_CmdLaunch_Missile(rMis);
              Sleep(500);

              SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                 missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - TT3MissilesOnVehicle(focused_weapon).SalvoSize));
            end;
          end;
        end;

        btSurfaceToAirCancel.Enabled := false;
        btSurfaceToAirLaunch.Enabled := false;
        btSurfaceToAirPlan.Enabled   := false;

        lbSurfaceToAirStatusQuantity.Caption := IntToStr(TT3MissilesOnVehicle(focused_weapon).Quantity);
        case TT3MissilesOnVehicle(focused_weapon).WeaponStatus of
          wsAvailable   : lblSurfaceToAirStatus.Caption   := 'Available';
          wsUnavailable : lblSurfaceToAirStatus.Caption   := 'Unavailable';
          wsDamaged     : lblSurfaceToAirStatus.Caption   := 'Damaged';
        end;

      end;
  end;
end;


function TfmWeapon.CalcDistanceTwoCoord(x1, x2, y1, y2 : Double):Double;
var
  CoordX1, CoordY1, CoordX2, CoordY2 : Double;
  Distance : Double;

  DifCoorX, DifCoorY : Double;
begin
  CoordX1 := x1;
  CoordX2 := x2;
  CoordY1 := y1;
  CoordY2 := y2;

  DifCoorX := Abs(CoordX2 - CoordX1);
  DifCoorY := Abs(CoordY2 - CoordY1);

  Distance := Sqrt(Abs((DifCoorX * DifCoorX) + (DifCoorY * DifCoorY)));

  Result := Distance;
end;

//function TfmWeapon.CheckQuadran(X1, X2, Y1, Y2: Double): Byte;
//var
//  ConstMZero : Double;
//begin
//  ConstMZero := -0.001;
//
//  Result := 0;
//  if (X2 <> X1) and (Y2 <> Y1) then
//  begin
//    Result :=  CheckQuadran((X2 - X1), ((Y2 - Y1)));
//  end
//  else
//  if (X2 = X1) then
//  begin
//    Result :=  CheckQuadran(ConstMZero, ((Y2 - Y1)))
//  end
//  else
//  if (Y2 = Y1) then
//  begin
//    Result := CheckQuadran((X2 - X1), ConstMZero)
//  end;
//end;

//function TfmWeapon.CheckQuadran(aX, aY: Double): Byte;
//begin
//  Result:= 1;
//  if (aX<0) and (aY>0) then
//    Result:= 2
//  else if (aX<0) and (aY<0) then
//    Result:= 3
//  else if (aX>0) and (aY<0) then
//    Result:= 4
//end;

//function TfmWeapon.CaclMidTarget_OwnShip(TargetX ,OwnShipX, TargetY, OwnShipY : Double): t2Dpoint;
//var
//  CoorX1, CoorY1, CoorX2, CoorY2 : Double;
//  aGradienM1 : Double;
//  DistanceTwoCoord : Double;
//  BetaDegree2 : Double;
//  ConstMZero : Double;
//  ax, ay : Double;
//  CoordMidX, CoordMidY : Double;
//begin
//  ConstMZero := -0.001;
//
//  //TargetShip Coordinat
//  CoorX1 := TargetX;
//  CoorY1 := TargetY;
//
//  //OwnShip Coordinat
//  CoorX2 := OwnShipX;
//  CoorY2 := OwnShipY;
//
//  if (CoorX2 <> CoorX1) and (CoorY2 <> CoorY1) then
//  begin
//    aGradienM1 := ((CoorY2 - CoorY1)) / (CoorX2 - CoorX1);
//  end
//  else
//  if (CoorX2 = CoorX1) then
//  begin
//    aGradienM1 := ((CoorY2 - CoorY1)) / ConstMZero;
//  end
//  else
//  if (CoorY2 = CoorY1) then
//  begin
//    aGradienM1 := ConstMZero / (CoorX2 - CoorX1);
//  end
//  else
//    aGradienM1 := 0;
//
//  //aGradienM2 := -1*(1/aGradienM1);
//  //BetaDegree := ArcTan(aGradienM2);
//  BetaDegree2 := ArcTan(aGradienM1);
//
//  DistanceTwoCoord := CalcDistanceTwoCoord(CoorX1, CoorX2, CoorY1, CoorY2);
//  ax:= Abs(((0.5 * DistanceTwoCoord)) * Cos(BetaDegree2));
//  ay:= Abs(((0.5 * DistanceTwoCoord)) * Sin(BetaDegree2));
//
//  case CheckQuadran(CoorX1, CoorX2, CoorY1, CoorY2) of
//    2 : begin
//          ax:= -1*ax;        // (Quadran 2) Cos Negatif
//        end;
//    3 : begin
//          ax:= -1*ax;        // (Quadran 3) Sin Negatif, Cos Negatif
//          ay:= -1*ay;
//        end;
//    4 : begin
//          ay:= -1*ay         // (Quadran 4) Sin Negatif
//        end;
//  end;
//
//  CoordMidX := CoorX2 - ax;
//  CoordMidY := CoorY2 - ay;
//
//  Result.X := CoordMidX;
//  Result.Y := CoordMidY;
//end;

function TfmWeapon.CalculateDistanceRBLW(aLauncherID: integer): Double;
var
  i : integer;
  MissileVehicle : TT3MissilesOnVehicle;
  RBLWPoint      : TPointVehicleMissileRBLW;

  isRBLW : Boolean;
  idRBLW, idRBLW2 : integer;

  Dist : Double;
  TempX, TempY : Double;
begin
  isRBLW  := False;
  idRBLW  := -1;
  idRBLW2 := -1;
  TempX := 0;
  TempY := 0;
  Dist    := 0;

  MissileVehicle := TT3MissilesOnVehicle(focused_weapon);

  for i := 0 to MissileVehicle.RBLW_PointList.Count - 1 do
  begin
    RBLWPoint := TPointVehicleMissileRBLW(MissileVehicle.RBLW_PointList[i]);

    if RBLWPoint.LauncherIndex = aLauncherID then
    begin
       Dist := Dist + CalcDistanceTwoCoord(TT3PlatformInstance(FControlled).getPositionX,
               RBLWPoint.PointRBLW_X1, TT3PlatformInstance(FControlled).getPositionY,
               RBLWPoint.PointRBLW_Y1);

       TempX := RBLWPoint.PointRBLW_X1;
       TempY := RBLWPoint.PointRBLW_Y1;

       idRBLW := i;
       isRBLW := True;
       break;
    end;
  end;

  if idRBLW <> -1 then
  begin
    for i := idRBLW + 1 to MissileVehicle.RBLW_PointList.Count - 1 do
    begin
      RBLWPoint := TPointVehicleMissileRBLW(MissileVehicle.RBLW_PointList[i]);

      if RBLWPoint.LauncherIndex = aLauncherID then
      begin
        Dist := Dist + CalcDistanceTwoCoord(TempX, RBLWPoint.PointRBLW_X1,
                TempY, RBLWPoint.PointRBLW_Y1);

        TempX := RBLWPoint.PointRBLW_X1;
        TempY := RBLWPoint.PointRBLW_Y1;

        idRBLW2 := i;
        Break;
      end;
    end;
  end;

  if idRBLW2 <> -1 then
  begin
    for i := idRBLW2 + 1 to MissileVehicle.RBLW_PointList.Count  - 1 do
    begin
      RBLWPoint := TPointVehicleMissileRBLW(MissileVehicle.RBLW_PointList[i]);

      if RBLWPoint.LauncherIndex = aLauncherID then
      begin
        Dist := Dist + CalcDistanceTwoCoord(TempX, RBLWPoint.PointRBLW_X1,
                TempY, RBLWPoint.PointRBLW_Y1);

        TempX := RBLWPoint.PointRBLW_X1;
        TempY := RBLWPoint.PointRBLW_Y1;

        break;
      end;
    end;
  end;

  if isRBLW then
    Dist := Dist + CalcDistanceTwoCoord(TempX, TT3PlatformInstance(MissileVehicle.TargetObject).getPositionX,
            TempY,  TT3PlatformInstance(MissileVehicle.TargetObject).getPositionY);

  Result := Dist * 60;
end;

function TfmWeapon.CheckIDBOLW(aIdLauncher: Integer): Integer;
var
  idBOLW : Integer;
  missile : TT3MissilesOnVehicle;
  pointBOLW : TPointVehicleMissileBOLW;
  i : Integer;
begin
  idBOLW := 1;

  missile := TT3MissilesOnVehicle(focused_weapon);

  for i := 0 to missile.BOLW_PointList.Count - 1 do
  begin
    pointBOLW := missile.BOLW_PointList[i];

    if pointBOLW.LauncherIndex = aIdLauncher then
      Inc(idBOLW);
  end;

  Result := idBOLW;
end;

function TfmWeapon.checkIDRBLW(aIdLauncher: integer): Integer;
var
  idRBLW : Integer;
  missile : TT3MissilesOnVehicle;
  pointRBLW : TPointVehicleMissileRBLW;
  i : Integer;
begin
  idRBLW := 1;

  missile := TT3MissilesOnVehicle(focused_weapon);

  for i := 0 to missile.RBLW_PointList.Count - 1 do
  begin
    pointRBLW := missile.RBLW_PointList[i];

    if pointRBLW.LauncherIndex = aIdLauncher then
      Inc(idRBLW);
  end;

  Result := idRBLW;
end;

procedure TfmWeapon.btnSurfaceToSurfaceClick(Sender: TObject);
var
  missile: TT3MissilesOnVehicle;
  projectil : TT3Missile;
  myTrackId, targetTrackId, trackNum: string;
  sObject : TSimObject;
  i,j,k,l, lastI: Integer;

  Dist : Double;
  PointRBLW, PointRBLW2, PointRBLWTemp, PointRBLWTemp2 : TPointVehicleMissileRBLW;
  PointBOLW, PointBOLW2 : TPointVehicleMissileBOLW;
  RecSend  : TrecSinc_RBLW;
  RecSend2 : TrecSinc_BOLW;

  RecMissileEnvi : TrecMissile_Envi;

  CountRBLW, IndexRBLW, LauncherIndexRBLW : Integer;

  ArrayRBLWOn : array[0..7] of Boolean;
  Distance : Double;

  PointBOL1, PointBOL2, PointBOL3, PointBOL4, PointEndBol , PointStartBol: t2DPoint;
  bearing, CoordBearingX, CoordBearingY : Double ;

  DistanceToTarget, Range : Double;
  LauncherIndex, NodeCount : Integer;
  LauncherOn : TFitted_Weap_Launcher_On_Board;
  FixWaypoint_X, FixWaypoint_Y : Double;
  CanTargetPlatform : Boolean;
begin
  {$REGION 'Choco - Editted'}
//  disini saya tata ulang. :D jadi kl ada masalah kapan2.. bisa jawil saya. v(^^,)v
  {$ENDREGION}

  {$REGION ' Pengecekan Ketersediaan weapon yg dipilih '}
  if focused_weapon = nil then
  begin
    frmTacticalDisplay.addStatus('Not Found Selected Weapon');
    Exit;
  end;

  if not(focused_weapon is TT3MissilesOnVehicle) then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Not Missile');
    Exit;
  end;

  if TT3MissilesOnVehicle(focused_weapon).WeaponStatus = wsDamaged then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Damaged');
    Exit;
  end;
  {$ENDREGION}

  missile := TT3MissilesOnVehicle(focused_weapon);
  rMis.SessionID := simMgrClient.SessionID;
  CanTargetPlatform := False;

  if Sender.ClassType = TSpeedButton then
  begin
    case TSpeedButton(Sender).Tag of
      //show range weapon missile
      1:
      begin
        {$REGION ' Show Range '}
        FVisibleShowRange := True;
        missile.ShowRange := True;
        missile.ShowRangeSelected := FVisibleShowRange and missile.ShowRange;
        HideRangeSensor;
        {$ENDREGION}
      end;
      //hide range weapon missile
      2:
      begin
        {$REGION ' Hide Range '}
        FVisibleShowRange := False;
        missile.ShowRange := False;
        missile.ShowRangeSelected := FVisibleShowRange and missile.ShowRange;
        {$ENDREGION}
      end;
      //set target object
      3:
      begin
        {$REGION ' Track Target '}
        if not simMgrClient.IsGameStart then
        begin
          frmTacticalDisplay.addStatus('Game Frozen');
          Exit;
        end;

        if not Assigned(FControlled) then
        begin
          frmTacticalDisplay.addStatus('Vehicle Sender Not Found');
          FisTrack := False;
          Exit;
        end;

        if not Assigned(focused_platform) then
        begin
          frmTacticalDisplay.addStatus('Vehicle Target Not Found');
          rMis.TargetPlatformID := 0;
          FisTrack := False;
          Exit;
        end;

        case TT3PlatformInstance(focused_platform).PlatformDomain of //if platformdomain = Air; 0 = Air, 1 = Surface, 2 = Subsurface
          0:
          begin
            if missile.MissileDefinition.FDef.Anti_Air_Capable = 1 then
              CanTargetPlatform := True;
          end;
          1:
          begin
            if missile.MissileDefinition.FDef.Anti_Sur_Capable = 1 then
              CanTargetPlatform := True;
          end;
          2:
          begin
            if missile.MissileDefinition.FDef.Anti_SubSur_Capable = 1 then
              CanTargetPlatform := True;
          end;
          3:
          begin
            if missile.MissileDefinition.FDef.Anti_Land_Capable = 1 then
              CanTargetPlatform := True;
          end;
          vhdAmphibious :
          begin
            if Boolean(missile.MissileDefinition.FDef.Anti_Amphibious_Capable) then
              CanTargetPlatform := True;
          end;
        end;

        if not CanTargetPlatform then
        begin
          frmTacticalDisplay.addStatus('Target Domain Not Same With Missile');
          editSurfaceToSurfaceMissileTargetTrack.Text := '';
          FisTrack := False;
          Exit;
        end;

        if missile.Planned then
        begin
          frmTacticalDisplay.addStatus('Target Has Been Planned');
          Exit;
        end;
        if not (focused_platform is TT3PlatformInstance) then
          Exit;

        myTrackId := TT3PlatformInstance(FControlled).Track_ID;

        if focused_platform is TT3NonRealVehicle then
          targetTrackId := IntToStr(TT3PlatformInstance(focused_platform).TrackNumber)
        else if focused_platform is TT3Vehicle then
          targetTrackId := TT3PlatformInstance(focused_platform).Track_ID;

        sObject := simMgrClient.findDetectedTrack(focused_platform);
        if Assigned(sObject) then
          trackNum := FormatTrackNumber(TT3DetectedTrack(sObject).TrackNumber)
        else
        begin
          trackNum := TT3PlatformInstance(focused_platform).TrackLabel;

          if trackNum = '' then trackNum := (TT3PlatformInstance(focused_platform).TrackNumber).ToString;
        end;

        if myTrackId <> targetTrackId then
        begin
          if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            editSurfaceToSurfaceMissileTargetTrack.Text := targetTrackId
          else
            editSurfaceToSurfaceMissileTargetTrack.Text := trackNum;  {ambil Track Numbernya}

          missile.TargetObject := focused_platform;
          FisTrack := True;
          //btnSurfaceToSurfacePlan.Enabled := true;
          //btnSurfaceToSurfacePlan.Enabled := true;

          rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
          rMis.TargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;
          rMis.MissileID        := missile.InstanceIndex;

          if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            rMis.NoCubicle  := 0
          else
            rMis.NoCubicle  := simMgrClient.FMyCubGroup.FData.Group_Index;
        end
        else
        begin
          frmTacticalDisplay.addStatus('Cant Track Own Vehicle');
          editSurfaceToSurfaceMissileTargetTrack.Text := '';
          FisTrack := False;
        end;

        setThisLauncherState; // sementara
        {$ENDREGION}
      end;
    end;
  end;

  if Sender.ClassType = TButton then
  begin
    if not simMgrClient.IsGameStart then
    begin
      frmTacticalDisplay.addStatus('Game Frozen');
      Exit;
    end;

    if not Assigned(FControlled) then
    begin
      frmTacticalDisplay.addStatus('Vehicle Sender Not Found');
      FisTrack := False;
      Exit;
    end;

    case TButton(Sender).Tag of
      //plan launch weapon missile
      1:
      begin
        if not (Assigned(missile.TargetObject)) then
        begin
          frmTacticalDisplay.addStatus('Target not assigned');
          Exit;
        end;

        Range := CalcRange(TT3PlatformInstance(FControlled).getPositionX,
                 TT3PlatformInstance(FControlled).getPositionY,
                 TT3PlatformInstance(missile.TargetObject).getPositionX,
                 TT3PlatformInstance(missile.TargetObject).getPositionY);

        if Range <= TMissile_On_Board(missile.UnitDefinition).FDef.Min_Range then
        begin
          frmTacticalDisplay.addStatus('Target is to close');
          setThisLauncherState;
        end
        else
        if Range >= TMissile_On_Board(missile.UnitDefinition).FDef.Max_Range then
        begin
          frmTacticalDisplay.addStatus('Target is too far');
          setThisLauncherState;
        end
        else
        if (Range > TMissile_On_Board(missile.UnitDefinition).FDef.Min_Range) and
           (Range < TMissile_On_Board(missile.UnitDefinition).FDef.Max_Range) then
        begin
          missile.Planned := True;
          missile.VehiclePlatform   := simMgrClient.SimPlatforms;
          missile.VehicleDetect     := simMgrClient.SimDetectedTrackList;

//          if simMgrClient.ISInstructor then
            missile.isControllerPlat  := simMgrClient.ISInstructor;
//          else if simMgrClient.ISWasdal then
//            missile.isControllerPlat  := simMgrClient.ISWasdal;

          missile.VehicleOnGroup    := simMgrClient.FMyCubGroup;
          missile.RangeRBLCircle    := 5;

          btnSurfaceToSurfaceMissileWaypointsEdit.Enabled := True;
          btnSurfaceToSurfaceCancel.Enabled               := True;
          btnSurfaceToSurfaceLaunch.Enabled               := True;
          btnSurfaceToSurfacePlan.Enabled                 := False;

          btnSurfaceToSurfaceMissileLauncherMore.Enabled := True;
          btnSurfaceToSurfaceMissileTargetTrackDetails.Enabled := True;

          TT3Vehicle(TT3PlatformInstance(FControlled)).isReadyToCalculate := False;

          case missile.FiringMode of
            mfmRBL, mfmBOL:
            begin
              for i := 0 to 7 do
              begin
                if FRippleCountArray[i] then
                begin
                  frmToteDisplay.ClearAllSurfaceToSurfaceList(TT3PlatformInstance(FControlled));
                  frmToteDisplay.OnWeaponEngaged(missile, missile.TargetObject, i+1);
//                  frmToteDisplay.gbSurfaceToSurface.BringToFront;  sementara dihide
                  Break;
                end;
              end;
            end;
            mfmRBLW:
            begin
              frmToteDisplay.ClearAllSurfaceToSurfaceList(TT3PlatformInstance(FControlled));
              DistanceToTarget := CalcRange(TT3PlatformInstance(FControlled).getPositionX,
                                  TT3PlatformInstance(FControlled).getPositionY,
                                  TT3PlatformInstance(missile.TargetObject).getPositionX,
                                  TT3PlatformInstance(missile.TargetObject).getPositionY);

              for i := 0 to 7 do
              begin
                if FRippleCountArray[i] then
                begin
                  frmToteDisplay.OnweaponEngageWaypoint(TT3PlatformInstance(FControlled),
                      missile, TT3PlatformInstance(missile.TargetObject),
                      DistanceToTarget, FRippleDegreeLauncer[i], i+1, 0, 0);
                end;
              end;

//              frmToteDisplay.gbSurfaceToSurface.BringToFront;    sementara dihide
            end;
          end;

          case missile.FiringMode of
            mfmRBLW :
            begin
              for i := 0 to 7 do
              begin
                if not FRippleCountArray[i] then
                  Continue;

                bearing := CalcBearing(
                  TT3PlatformInstance(missile.TargetObject).PosX,
                  TT3PlatformInstance(missile.TargetObject).PosY,
                  TT3PlatformInstance(FControlled).PosX,
                  TT3PlatformInstance(FControlled).PosY);
                RangeBearingToCoord(
                  missile.MissileDefinition.FDef.Min_Final_Leg_Length,
                  bearing, CoordBearingX, CoordBearingY);
                missile.RBLW_PointX := TT3PlatformInstance(
                  missile.TargetObject).PosX + CoordBearingX;
                missile.RBLW_PointY := TT3PlatformInstance(
                  missile.TargetObject).PosY + CoordBearingY;

                //Sincron
                with RecSend do
                begin
                  cmd := 0;
                  PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                  WeaponIndex := missile.InstanceIndex;
                  WeaponName := missile.InstanceName;
                  RBLWIndex := CheckIDRBLW(i);
                  RBLWLauncherIndex := i + 1;
                  RBLW_PointX := missile.RBLW_PointX;
                  RBLW_POintY := missile.RBLW_PointY;
                  IsAdd := False;
                end;
                simMgrClient.netSend_CmdSyncRBLW(RecSend);
              end;
            end;
            mfmBOLW:
            begin
              for i := 0 to 7 do
              begin
                if not FRippleCountArray[i] then
                  Continue;

                bearing := CalcBearing(
                  TT3PlatformInstance(missile.TargetObject).PosX,
                  TT3PlatformInstance(missile.TargetObject).PosY,
                  TT3PlatformInstance(FControlled).PosX,
                  TT3PlatformInstance(FControlled).PosY);
                RangeBearingToCoord(
                  missile.MissileDefinition.FDef.Min_Final_Leg_Length,
                  bearing, CoordBearingX, CoordBearingY);
                missile.BOLW_PointX := TT3PlatformInstance(
                  missile.TargetObject).PosX + CoordBearingX;
                missile.BOLW_PointY := TT3PlatformInstance(
                  missile.TargetObject).PosY + CoordBearingY;

                with RecSend2 do
                begin
                  cmd := 0;
                  PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                  WeaponIndex := missile.InstanceIndex;
                  WeaponName := missile.InstanceName;
                  BOLWIndex := CheckIDBOLW(i);
                  BOLWLauncherIndex := i + 1;
                  BOLW_PointX := missile.BOLW_PointX;
                  BOLW_POintY := missile.BOLW_PointY;
                  IsAdd := False;
                end;
                simMgrClient.netSend_CmdSyncBOLW(RecSend2);
              end;
            end;
          end;
        end;
      end;
      //cancle launch weapon missile
      2:
      begin
        missile.Planned := False;
        btnSurfaceToSurfaceCancel.Enabled := False;
        btnSurfaceToSurfaceLaunch.Enabled := False;
        btnSurfaceToSurfacePlan.Enabled   := False;
        setThisLauncherState;

        btnSurfaceToSurfaceMissileWaypointsEdit.Enabled     := False;
        btnSurfaceToSurfaceMissileWaypointsAdd.Enabled      := False;
        btnSurfaceToSurfaceMissileWaypointsDelete.Enabled   := False;
        btnSurfaceToSurfaceMissileWaypointsApply.Enabled    := False;
        btnSurfaceToSurfaceMissileWaypointsCancel.Enabled   := False;

        btnSurfaceToSurfaceMissileLauncherMore.Enabled := False;
        btnSurfaceToSurfaceMissileTargetTrackDetails.Enabled := False;

        frmToteDisplay.ClearAllSurfaceToSurfaceList(TT3PlatformInstance(FControlled));

        missile.DestruckRange   := missile.WeaponRange;
        missile.SeekerRangeTurn := missile.MissileDefinition.FDef.Seeker_TurnOn_Range;

        case missile.FiringMode of
          mfmRBLW:
          begin
            with RecSend do
            begin
              cmd := 3;
              PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
              WeaponIndex := missile.InstanceIndex;
              WeaponName := missile.InstanceName;
            end;
            simMgrClient.netSend_CmdSyncRBLW(RecSend);
          end;
          mfmBOLW:
          begin
            with RecSend2 do
            begin
              cmd := 3;
              PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
              WeaponIndex := missile.InstanceIndex;
              WeaponName := missile.InstanceName;
            end;
            simMgrClient.netSend_CmdSyncBOLW(RecSend2);
          end;
        end;
      end;
      //launch weapon missile
      3:
      begin
        missile.Planned := False;
        rMis.ProjectileInstanceIndex := 0;

        with RecMissileEnvi do
        begin
          platformID    := TT3PlatformInstance(FControlled).InstanceIndex;
          WeaponIndex   := missile.InstanceIndex;
          WeaponName    := missile.InstanceName;
          Missile_Kind  := Integer(missile.WeaponCategory);
          MIssile_Method:= Integer(missile.FiringMode);
          //choco : saya tambahi sintax dibawah ini agar nilai isHybrid nya tidak selalu "True"
          //soalnya kalau nilai nya true nanti di recv_sincMissileEnvi. bakal masuk ke case untuk missile Hybrid
          //dan focused_weapon yang digunakan tidak selalu bertipe Hybrid. #Access Violation karena casting gagal.
          isHybrid      := (focused_weapon is TT3HybridOnVehicle);
        end;
        simMgrClient.netSend_CmdSyncMissileEnvi(RecMissileEnvi);
        Sleep(500);//Sleep(100);

        case missile.FiringMode of
          mfmRBL:
          begin
            with RecSend do
            begin
              cmd := 8;
              PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
              WeaponIndex := missile.InstanceIndex;
              WeaponName := missile.InstanceName;
              SeekerTurnOnRange := missile.SeekerRangeTurn;
              HAFO := missile.HitMode.HAFO;
              CruiseAltitude := missile.DefaultAltitude;

              case missile.HitMode.PopUp_Move of
                ppPopUP   : PopUp := 1;
                ppSeaSkim : PopUp := 2;
              end;
            end;
            simMgrClient.netSend_CmdSyncRBLW(RecSend);
            Sleep(500);//Sleep(100);

            LauncherOn := nil;
            for i := 0 to 7 do
            begin
              if FRippleCountArray[i] then
              begin
                rMis.LauncherID := i+1;
                LauncherOn := missile.GetLauncherByID(i+1);
                Break;
              end;
            end;

            if (missile.Quantity <= missile.MissileDefinition.FLaunchs.Count) and (missile.Quantity > 0) then
            begin
              simMgrClient.netSend_CmdSetLauncherQty(TT3PlatformInstance(FControlled).InstanceIndex,
                missile.InstanceIndex, LauncherOn.FData.Launcher_Type, (LauncherOn.FData.Launcher_Qty - 1));
              Sleep(500);//Sleep(100);
              SimMgrClient.netSend_CmdLaunch_Missile(rMis);
              Sleep(500);
              SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                 missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - 1));
              Sleep(500);//Sleep(100);
            end
            else if missile.Quantity > 0 then
            begin
              SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                 missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - 1));
              Sleep(500);//Sleep(100);
              SimMgrClient.netSend_CmdLaunch_Missile(rMis);
              Sleep(500);
            end;
            setThisLauncherState;

            if Assigned(LauncherOn) then
            begin
              if LauncherOn.FData.Launcher_Type > 8 then
                FRippleCountArray[LauncherOn.FData.Launcher_Type-9] := False
              else
                FRippleCountArray[LauncherOn.FData.Launcher_Type-1] := False;
            end;
          end;
          mfmRBLW:
          begin
            case missile.Engagement of
              meRipple:
              begin
                frmToteDisplay.ClearAllSurfaceToSurfaceList(TT3PlatformInstance(FControlled));

                FRippleCount := 0;
                FRippleTimer := 0;
                TimerRipple.Enabled := False;

                FlauncherID := -1;

                for i := 0 to 7 do
                begin
                  if FRippleCountArray[i] then
                  begin
                    rMis.LauncherID := i+1;
                    FRippleCount := FRippleCount + 1;

                    if TT3MissilesOnVehicle(focused_weapon).Quantity > 0  then
                    begin
                      //Sincron
                      with RecSend do
                      begin
                        cmd := 8;
                        PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                        WeaponIndex := missile.InstanceIndex;
                        WeaponName := missile.InstanceName;
                        SeekerTurnOnRange := missile.SeekerRangeTurn;
                        HAFO := missile.HitMode.HAFO;
                        CruiseAltitude := missile.DefaultAltitude;

                        case missile.HitMode.PopUp_Move of
                          ppPopUP   : PopUp := 1;
                          ppSeaSkim : PopUp := 2;
                        end;
                      end;
                      simMgrClient.netSend_CmdSyncRBLW(RecSend);
                      Sleep(100);

                      with RecSend do
                      begin
                        cmd := 5;
                        PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                        WeaponIndex := missile.InstanceIndex;
                        WeaponName := missile.InstanceName;
                        LauncherNumber := i+1;
                        LaunchDelay := 5;
                      end;
                      simMgrClient.netSend_CmdSyncRBLW(RecSend);
                      Sleep(100);

                      LauncherOn := missile.GetLauncherByID(i+1);

                      if (missile.Quantity <= missile.MissileDefinition.FLaunchs.Count) and (missile.Quantity > 0) then
                      begin
                        simMgrClient.netSend_CmdSetLauncherQty(TT3PlatformInstance(FControlled).InstanceIndex,
                          missile.InstanceIndex, LauncherOn.FData.Launcher_Type, (LauncherOn.FData.Launcher_Qty - 1));
                        Sleep(100);
                        SimMgrClient.netSend_CmdLaunch_Missile(rMis);
                        Sleep(100);
                        SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                           missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - FRippleCount));
                        Sleep(100);
                      end
                      else if missile.Quantity > 0 then
                      begin
                        SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                           missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - FRippleCount));
                        Sleep(100);
                        SimMgrClient.netSend_CmdLaunch_Missile(rMis);
                      end;

                      FRippleCountArray[i] := False;
                    end;
                  end;
                end;

                frmTacticalDisplay.addStatus('Ready To Ripple for ' + IntToStr(FRippleCount) + ' Missile');

                setThisLauncherState;
              end;
              meSTOT:
              begin
                frmToteDisplay.ClearAllSurfaceToSurfaceList(TT3PlatformInstance(FControlled));

                FlaunchSTOT := 0;

                PrepareRBLW_STOT;
                LaunchSTOTMissile;

                setThisLauncherState;
              end;
              meDTOT:
              begin
                FRippleCount := 0;
                for i := 0 to 7 do
                begin
                  if FRippleCountArray[i] then
                    FRippleCount := FRippleCount + 1;
                end;
                frmTacticalDisplay.addStatus('Ready To DTOT for ' + IntToStr(FRippleCount) + ' Missile');

                FRippleTimer := 0;
                TimerRipple.Enabled := False;
                FlauncherID := -1;

                TT3Vehicle(TT3PlatformInstance(FControlled)).isReadyToCalculate := True;
                frmToteDisplay.ClearAllSurfaceToSurfaceList(TT3PlatformInstance(FControlled));
                frmToteDisplay.settimeDTOT;

                missile.PreLaunched := True;

                setThisLauncherState;
              end;
            end;
          end;
          mfmBOL:
          begin
            if Assigned(missile.TargetObject) and
              (missile.TargetObject is TT3PlatformInstance)then
            begin
              bearing := CalcBearing(TT3PlatformInstance(FControlled).getPositionX,
                         TT3PlatformInstance(FControlled).getPositionY,
                         TT3PlatformInstance(missile.TargetObject).getPositionX,
                         TT3PlatformInstance(missile.TargetObject).getPositionY);

              CalcBOLRangeDestruck(bearing, missile.SeekerRangeTurn,
                         TT3PlatformInstance(FControlled).getPositionX,
                         TT3PlatformInstance(FControlled).getPositionY, missile.DestruckRange, 0, 4,
                         TT3PlatformInstance(FControlled).getPositionX,
                         TT3PlatformInstance(FControlled).getPositionY, PointBOL1,
                         PointBOL2, PointBOL3, PointBOL4, PointEndBOL, PointStartBol);

              with RecSend2 do
              begin
                cmd := 8;
                BOLWIndex         := CheckIDBOLW(FLauncherIDLastOn);
                BOLWLauncherIndex := FLauncherIDLastOn;
                WeaponIndex       := missile.InstanceIndex;
                WeaponName        := missile.InstanceName;

                BOLW_PointX       := missile.BOLW_PointX;
                BOLW_POintY       := missile.BOLW_PointY;
                platformID        := TT3PlatformInstance(FControlled).InstanceIndex;
                Target_Index      := TT3PlatformInstance(missile.TargetObject).InstanceIndex;
                SeekerTurnOnRange := missile.SeekerRangeTurn;
                HAFO              := missile.HitMode.HAFO;
                CruiseAltitude    := missile.DefaultAltitude;

                case missile.HitMode.PopUp_Move of
                  ppPopUP   : PopUp := 1;
                  ppSeaSkim : PopUp := 2;
                end;
              end;
              simMgrClient.netSend_CmdSyncBOLW(RecSend2);
              Sleep(100);

              with RecSend2 do
              begin
                cmd := 7;
                BOLWIndex         := CheckIDBOLW(FLauncherIDLastOn);
                BOLWLauncherIndex := FLauncherIDLastOn;
                WeaponIndex       := missile.InstanceIndex;
                WeaponName        := missile.InstanceName;

                BOLW_Point1_X     := PointBOL1.X;
                BOLW_Point1_Y     := PointBOL1.Y;
                BOLW_Point2_X     := PointBOL2.X;
                BOLW_Point2_Y     := PointBOL2.Y;
                BOLW_Point3_X     := PointBOL3.X;
                BOLW_Point3_Y     := PointBOL3.Y;
                BOLW_Point4_X     := PointBOL4.X;
                BOLW_Point4_Y     := PointBOL4.Y;
                EndBOLW_Point_X   := PointEndBOL.X;
                EndBOLW_Point_Y   := PointEndBOL.X;
                StartBOLW_Point_X := PointStartBol.X;
                StartBOLW_Point_Y := PointStartBol.Y;
                BOLW_PointX       := missile.BOLW_PointX;
                BOLW_POintY       := missile.BOLW_PointY;
                platformID        := TT3PlatformInstance(FControlled).InstanceIndex;
                Target_Index      := TT3PlatformInstance(missile.TargetObject).InstanceIndex;
              end;

              simMgrClient.netSend_CmdSyncBOLW(RecSend2);
              Sleep(100);
            end;

            LauncherOn := nil;
            for i := 0 to 7 do
            begin
              if FRippleCountArray[i] then
              begin
                rMis.LauncherID := i+1;
                LauncherOn := missile.GetLauncherByID(i+1);
                Break;
              end;
            end;

            if (missile.Quantity <= missile.MissileDefinition.FLaunchs.Count)
               and (missile.Quantity > 0) then
            begin
              simMgrClient.netSend_CmdSetLauncherQty(TT3PlatformInstance(FControlled).InstanceIndex,
                missile.InstanceIndex, LauncherOn.FData.Launcher_Type,
                (LauncherOn.FData.Launcher_Qty - 1));
              Sleep(100);

              SimMgrClient.netSend_CmdLaunch_Missile(rMis);
              Sleep(100);

              SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                 missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON,
                 (missile.Quantity - 1));
              Sleep(100);
            end
            else if missile.Quantity > 0 then
            begin
              SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                 missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON,
                 (missile.Quantity - 1));
              Sleep(100);

              SimMgrClient.netSend_CmdLaunch_Missile(rMis);
            end;

            setThisLauncherState;
          end;
          mfmBOLW:
          begin
            if Assigned(missile.TargetObject) and
              (missile.TargetObject is TT3PlatformInstance)then
            begin
              for i := 0 to 7 do
              begin
                if not FRippleCountArray[i] then
                  Continue;

                rMis.LauncherID := i + 1;

                PointBOLW := missile.GetBOLWPointMaxIndex(i + 1);

                if not Assigned(PointBOLW) then
                  Continue;

                bearing := CalcBearing(PointBOLW.PointBOLW_X1,
                  PointBOLW.PointBOLW_Y1,
                  TT3PlatformInstance(missile.TargetObject).getPositionX,
                  TT3PlatformInstance(missile.TargetObject).getPositionY);
                CoordBearingX := TT3PlatformInstance(missile.TargetObject).getPositionX;
                CoordBearingY  := TT3PlatformInstance(missile.TargetObject).getPositionY;

                CalcBOLRangeDestruck(bearing, missile.SeekerRangeTurn,
                  PointBOLW.PointBOLW_X1, PointBOLW.PointBOLW_Y1,
                  missile.DestruckRange, 0, 4, PointBOLW.PointBOLW_X1,
                  PointBOLW.PointBOLW_Y1, PointBOL1, PointBOL2, PointBOL3,
                  PointBOL4, PointEndBOL, PointStartBol);

                with RecSend2 do
                begin
                  cmd := 8;
                  PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                  WeaponIndex := missile.InstanceIndex;
                  WeaponName := missile.InstanceName;
                  SeekerTurnOnRange := missile.SeekerRangeTurn;
                  HAFO := missile.HitMode.HAFO;
                  CruiseAltitude := missile.DefaultAltitude;

                  case missile.HitMode.PopUp_Move of
                    ppPopUP   : PopUp := 1;
                    ppSeaSkim : PopUp := 2;
                  end;
                end;
                simMgrClient.netSend_CmdSyncBOLW(RecSend2);
                Sleep(100);

                with RecSend2 do
                begin
                  cmd := 5;
                  PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                  WeaponIndex := missile.InstanceIndex;
                  WeaponName := missile.InstanceName;
                  LauncherNumber := i + 1;
                  LaunchDelay := 5;
                end;
                simMgrClient.netSend_CmdSyncBOLW(RecSend2);
                Sleep(100);

                with RecSend2 do
                begin
                  cmd := 7;
                  PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                  WeaponIndex := missile.InstanceIndex;
                  WeaponName := missile.InstanceName;

                  BOLW_Point1_X     := PointBOL1.X;
                  BOLW_Point1_Y     := PointBOL1.Y;
                  BOLW_Point2_X     := PointBOL2.X;
                  BOLW_Point2_Y     := PointBOL2.Y;
                  BOLW_Point3_X     := PointBOL3.X;
                  BOLW_Point3_Y     := PointBOL3.Y;
                  BOLW_Point4_X     := PointBOL4.X;
                  BOLW_Point4_Y     := PointBOL4.Y;
                  EndBOLW_Point_X   := PointEndBOL.X;
                  EndBOLW_Point_Y   := PointEndBOL.X;
                  StartBOLW_Point_X := PointStartBol.X;
                  StartBOLW_Point_Y := PointStartBol.Y;
                end;
                simMgrClient.netSend_CmdSyncBOLW(RecSend2);
                Sleep(100);

                LauncherOn := missile.GetLauncherByID(i+1);

                if (missile.Quantity <= missile.MissileDefinition.FLaunchs.Count) and (missile.Quantity > 0) then
                begin
                  simMgrClient.netSend_CmdSetLauncherQty(TT3PlatformInstance(FControlled).InstanceIndex,
                    missile.InstanceIndex, LauncherOn.FData.Launcher_Type, (LauncherOn.FData.Launcher_Qty - 1));
                  Sleep(100);
                  SimMgrClient.netSend_CmdLaunch_Missile(rMis);
                  Sleep(100);
                  SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                     missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - 1));
                  Sleep(100);
                end
                else if missile.Quantity > 0 then
                begin
                  SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                     missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - 1));
                  Sleep(100);
                  SimMgrClient.netSend_CmdLaunch_Missile(rMis);
                end;

                FRippleCountArray[i] := False;
              end;

              setThisLauncherState;
            end
            else
            begin
              frmTacticalDisplay.addStatus('Cant Detect bearing To Launch');
            end;
          end;
        end;

        btnSurfaceToSurfaceMissileWaypointsEdit.Enabled   := False;
        btnSurfaceToSurfaceMissileWaypointsAdd.Enabled    := False;
        btnSurfaceToSurfaceMissileWaypointsDelete.Enabled := False;
        btnSurfaceToSurfaceMissileWaypointsApply.Enabled  := False;
        btnSurfaceToSurfaceMissileWaypointsCancel.Enabled := False;

        btnSurfaceToSurfaceMissileLauncherMore.Enabled := False;
        btnSurfaceToSurfaceMissileTargetTrackDetails.Enabled := False;

        btnSurfaceToSurfaceCancel.Enabled := False;
        btnSurfaceToSurfaceLaunch.Enabled := False;
        btnSurfaceToSurfacePlan.Enabled   := False;
      end;
      10:
      begin
        // Edit Weapon Waypoint
        btnSurfaceToSurfaceMissileWaypointsEdit.Enabled   := False;
        btnSurfaceToSurfaceMissileWaypointsAdd.Enabled    := True;
        btnSurfaceToSurfaceMissileWaypointsDelete.Enabled := True;
        btnSurfaceToSurfaceMissileWaypointsApply.Enabled  := False;
        btnSurfaceToSurfaceMissileWaypointsCancel.Enabled := True;

        if Assigned(simMgrClient.ControlledPlatform) then
        begin
          case missile.FiringMode of
            mfmRBLW:
            begin
              with RecSend do
              begin
                cmd := 12;
                PlatformID := simMgrClient.ControlledPlatform.InstanceIndex;
                WeaponIndex := missile.InstanceIndex;
                WeaponName := missile.InstanceName;
              end;
              simMgrClient.netSend_CmdSyncRBLW(RecSend);
            end;
            mfmBOLW:
            begin
              with RecSend2 do
              begin
                cmd := 12;
                PlatformID := simMgrClient.ControlledPlatform.InstanceIndex;
                WeaponIndex := missile.InstanceIndex;
                WeaponName := missile.InstanceName;
              end;
              simMgrClient.netSend_CmdSyncBOLW(RecSend2);
            end;
          end;
        end;
      end;
      11:
      begin
        // Add Weapon Waypoint
        if not ((frmTacticalDisplay.focusedTrack is TPointVehicleMissileRBLW) or
          (frmTacticalDisplay.focusedTrack is TPointVehicleMissileBOLW)) then
        begin
          frmTacticalDisplay.addStatus('Select the Waypoint');
          Exit;
        end;

        btnSurfaceToSurfaceMissileWaypointsEdit.Enabled   := False;
        btnSurfaceToSurfaceMissileWaypointsAdd.Enabled    := True;
        btnSurfaceToSurfaceMissileWaypointsDelete.Enabled := True;
        btnSurfaceToSurfaceMissileWaypointsApply.Enabled  := True;
        btnSurfaceToSurfaceMissileWaypointsCancel.Enabled := True;

        case missile.FiringMode of
          mfmRBLW:
          begin
            if not Assigned(missile.TargetObject) then
            begin
              frmTacticalDisplay.addStatus('Target not assigned');
              Exit;
            end;

            PointRBLW := TPointVehicleMissileRBLW(frmTacticalDisplay.focusedTrack);
            LauncherIndexRBLW := PointRBLW.LauncherIndex;
            IndexRBLW := CheckIDRBLW(PointRBLW.LauncherIndex);

            if IndexRBLW <= missile.MissileDefinition.FDef.Max_Num_Wpts then
            begin
              PointRBLW2 := missile.GetRBLWPoint(LauncherIndexRBLW, (IndexRBLW-1));
              if PointRBLW2 = nil then
              begin
                frmTacticalDisplay.addStatus('Point RBLW not Assined!');
                Exit;
              end;

              bearing := CalcBearing(TT3PlatformInstance(missile.TargetObject).PosX,
                        TT3PlatformInstance(missile.TargetObject).PosY,
                        PointRBLW2.PointRBLW_X1,PointRBLW2.PointRBLW_Y1);

              RangeBearingToCoord(missile.MissileDefinition.FDef.Min_Final_Leg_Length,
                        bearing,FixWaypoint_X,FixWaypoint_Y);

              if Assigned(simMgrClient.ControlledPlatform) then
              begin
                with RecSend do
                begin
                  cmd := 9;
                  PlatformID := simMgrClient.ControlledPlatform.InstanceIndex;
                  WeaponIndex := missile.InstanceIndex;
                  WeaponName := missile.InstanceName;
                  RBLWIndex := IndexRBLW;
                  RBLWLauncherIndex := LauncherIndexRBLW;
                  Action := waInsert;
                end;
                simMgrClient.netSend_CmdSyncRBLW(RecSend);
              end;

              with RecSend do
              begin
                cmd := 0;
                PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                WeaponIndex := missile.InstanceIndex;
                WeaponName := missile.InstanceName;
                RBLWIndex := IndexRBLW;
                RBLWLauncherIndex := LauncherIndexRBLW;
                RBLW_PointX := TT3PlatformInstance(missile.TargetObject).PosX + FixWaypoint_X;
                RBLW_POintY := TT3PlatformInstance(missile.TargetObject).PosY + FixWaypoint_Y;
                IsAdd := True;
              end;
              simMgrClient.netSend_CmdSyncRBLW(RecSend);
            end
            else
            begin
              frmTacticalDisplay.addStatus('You Already Have '
                  + IntToStr(missile.MissileDefinition.FDef.Max_Num_Wpts)
                  + ' Waypoint in Launcher ' + IntToStr(FLauncherIDLastOn));
            end;
          end;
          mfmBOLW :
          begin
            if not Assigned(missile.TargetObject) then
            begin
              frmTacticalDisplay.addStatus('Target not assigned');
              Exit;
            end;

            PointBOLW := TPointVehicleMissileBOLW(frmTacticalDisplay.focusedTrack);
            LauncherIndexRBLW := PointBOLW.LauncherIndex;
            IndexRBLW := CheckIDBOLW(PointBOLW.LauncherIndex);

            if IndexRBLW <= missile.MissileDefinition.FDef.Max_Num_Wpts then
            begin
              PointBOLW2 := missile.GetBOLWPoint(LauncherIndexRBLW, (IndexRBLW-1));
              if PointBOLW2 = nil then
              begin
                frmTacticalDisplay.addStatus('Point RBLW not Assined!');
                Exit;
              end;

              bearing := CalcBearing(TT3PlatformInstance(missile.TargetObject).PosX,
                        TT3PlatformInstance(missile.TargetObject).PosY,
                        PointBOLW2.PointBOLW_X1,PointBOLW2.PointBOLW_Y1);

              RangeBearingToCoord(missile.MissileDefinition.FDef.Min_Final_Leg_Length,
                        bearing,FixWaypoint_X,FixWaypoint_Y);

              if Assigned(simMgrClient.ControlledPlatform) then
              begin
                with RecSend2 do
                begin
                  cmd := 9;
                  PlatformID := simMgrClient.ControlledPlatform.InstanceIndex;
                  WeaponIndex := missile.InstanceIndex;
                  WeaponName := missile.InstanceName;
                  BOLWIndex := IndexRBLW;
                  BOLWLauncherIndex := LauncherIndexRBLW;
                  Action := waInsert;
                end;
                simMgrClient.netSend_CmdSyncBOLW(RecSend2);
              end;

              with RecSend2 do
              begin
                cmd := 0;
                PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                WeaponIndex := missile.InstanceIndex;
                WeaponName := missile.InstanceName;
                BOLWIndex := IndexRBLW;
                BOLWLauncherIndex := LauncherIndexRBLW;
                BOLW_PointX := TT3PlatformInstance(missile.TargetObject).PosX + FixWaypoint_X;
                BOLW_POintY := TT3PlatformInstance(missile.TargetObject).PosY + FixWaypoint_Y;
                IsAdd := True;
              end;
              simMgrClient.netSend_CmdSyncBOLW(RecSend2);
            end
            else
            begin
              frmTacticalDisplay.addStatus('You Already Have '
                  + IntToStr(missile.MissileDefinition.FDef.Max_Num_Wpts)
                  + ' Waypoint in Launcher ' + IntToStr(FLauncherIDLastOn));
            end;
          end;
        end;
      end;
      12:
      begin
        // Delete Weapon Waypoint
        if not ((frmTacticalDisplay.focusedTrack is TPointVehicleMissileRBLW) or
               (frmTacticalDisplay.focusedTrack is TPointVehicleMissileBOLW)) then
        begin
          frmTacticalDisplay.addStatus('Select the Waypoint');
          Exit;
        end;

        btnSurfaceToSurfaceMissileWaypointsEdit.Enabled   := False;
        btnSurfaceToSurfaceMissileWaypointsAdd.Enabled    := True;
        btnSurfaceToSurfaceMissileWaypointsDelete.Enabled := True;
        btnSurfaceToSurfaceMissileWaypointsApply.Enabled  := True;
        btnSurfaceToSurfaceMissileWaypointsCancel.Enabled := True;

        case missile.FiringMode of
          mfmRBLW:
          begin
            PointRBLW := TPointVehicleMissileRBLW(frmTacticalDisplay.focusedTrack);

            CountRBLW := 0;
            for i := 0 to missile.RBLW_PointList.Count - 1 do
            begin
              PointRBLWTemp := TPointVehicleMissileRBLW(missile.RBLW_PointList[i]);
              if PointRBLWTemp.LauncherIndex = PointRBLW.LauncherIndex then
                Inc(CountRBLW);
            end;

            if CountRBLW > 1 then
            begin
              for i := 0 to missile.RBLW_PointList.Count - 1 do
              begin
                PointRBLWTemp := TPointVehicleMissileRBLW(missile.RBLW_PointList[i]);

                if PointRBLW = PointRBLWTemp then
                begin
                  with RecSend do
                  begin
                    cmd := 9;
                    PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                    WeaponIndex := missile.InstanceIndex;
                    WeaponName := missile.InstanceName;
                    RBLWIndex := PointRBLWTemp.IndexPoint;
                    RBLWLauncherIndex := PointRBLWTemp.LauncherIndex;
                    RBLW_PointX := PointRBLWTemp.PointRBLW_X1;
                    RBLW_POintY := PointRBLWTemp.PointRBLW_Y1;
                    Action := waDelete;
                  end;
                  simMgrClient.netSend_CmdSyncRBLW(RecSend);

                  with RecSend do
                  begin
                    cmd := 11;
                    PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                    WeaponIndex := missile.InstanceIndex;
                    WeaponName := missile.InstanceName;
                    RBLWIndex := PointRBLWTemp.IndexPoint;
                    RBLWLauncherIndex := PointRBLWTemp.LauncherIndex;
                  end;
                  simMgrClient.netSend_CmdSyncRBLW(RecSend);
                end;
              end;
            end
            else
            begin
              frmTacticalDisplay.addStatus('You Must Have Minimum 1 Point of RBLW');
            end;
          end;
          mfmBOLW:
          begin
            PointBOLW := TPointVehicleMissileBOLW(frmTacticalDisplay.focusedTrack);

            CountRBLW := 0;
            for i := 0 to missile.BOLW_PointList.Count - 1 do
            begin
              PointBOLW2 := missile.BOLW_PointList[i];

              if PointBOLW2.LauncherIndex = PointRBLW.LauncherIndex then
                Inc(CountRBLW);
            end;

            if CountRBLW > 1 then
            begin
              for i := 0 to missile.BOLW_PointList.Count - 1 do
              begin
                PointBOLW2 := missile.BOLW_PointList[i];

                if PointBOLW = PointBOLW2 then
                begin
                  with RecSend2 do
                  begin
                    cmd := 9;
                    PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                    WeaponIndex := missile.InstanceIndex;
                    WeaponName := missile.InstanceName;
                    BOLWIndex := PointBOLW2.IndexPoint;
                    BOLWLauncherIndex := PointBOLW2.LauncherIndex;
                    BOLW_PointX := PointBOLW2.PointBOLW_X1;
                    BOLW_POintY := PointBOLW2.PointBOLW_Y1;
                    Action := waDelete;
                  end;
                  simMgrClient.netSend_CmdSyncBOLW(RecSend2);

                  with RecSend2 do
                  begin
                    cmd := 11;
                    PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                    WeaponIndex := missile.InstanceIndex;
                    WeaponName := missile.InstanceName;
                    BOLWIndex := PointBOLW2.IndexPoint;
                    BOLWLauncherIndex := PointBOLW2.LauncherIndex;
                  end;
                  simMgrClient.netSend_CmdSyncBOLW(RecSend2);
                end;
              end;
            end;
          end;
        end;
      end;
      13:
      begin
        // Apply Weapon Waypoint

        if not (Assigned(missile.TargetObject)) then
        begin
          frmTacticalDisplay.addStatus('Target not assigned');
          Exit;
        end;

        btnSurfaceToSurfaceMissileWaypointsEdit.Enabled := True;
        btnSurfaceToSurfaceMissileWaypointsAdd.Enabled := False;
        btnSurfaceToSurfaceMissileWaypointsDelete.Enabled := False;
        btnSurfaceToSurfaceMissileWaypointsApply.Enabled := False;
        btnSurfaceToSurfaceMissileWaypointsCancel.Enabled := False;

        case missile.FiringMode of
          mfmRBLW:
          begin
            frmToteDisplay.ClearAllSurfaceToSurfaceList(TT3PlatformInstance(FControlled));

            for i := 0 to 7 do
            begin
              if FRippleCountArray[i] then
              begin
                Distance :=  CalculateDistanceRBLW(i+1);

                if Distance > missile.WeaponRange then
                begin
                  frmTacticalDisplay.addStatus('Launcher ' + IntToStr(i+1) + ' Waypoint is Out Of Range');

                  PointRBLW := missile.GetRBLWPoint(i+1);

                  with RecSend do
                  begin
                    cmd := 1;
                    PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                    WeaponIndex := missile.InstanceIndex;
                    WeaponName := missile.InstanceName;
                    RBLWIndex := PointRBLW.IndexPoint;
                    RBLWLauncherIndex := PointRBLW.LauncherIndex;
                  end;
                  simMgrClient.netSend_CmdSyncRBLW(RecSend);
                  Sleep(100);

                  case missile.Engagement of
                    meRipple:
                    begin
                      DistanceToTarget := CalcRange(TT3PlatformInstance(FControlled).getPositionX,
                                  TT3PlatformInstance(FControlled).getPositionY,
                                  TT3PlatformInstance(missile.TargetObject).getPositionX,
                                  TT3PlatformInstance(missile.TargetObject).getPositionY);

                      frmToteDisplay.OnweaponEngageWaypoint(TT3PlatformInstance(FControlled),
                                  missile, TT3PlatformInstance(missile.TargetObject),
                                  DistanceToTarget, FRippleDegreeLauncer[i], i+1, 0, 0);
                    end;
                    meSTOT:
                    begin
                      frmToteDisplay.ClearAllSurfaceToSurfaceList(TT3PlatformInstance(FControlled));
                      PrepareRBLW_STOT;
                      SetToToteDisplay_STOT;
                    end;
                    meDTOT:
                    begin
                      DistanceToTarget := CalcRange(TT3PlatformInstance(FControlled).getPositionX,
                                    TT3PlatformInstance(FControlled).getPositionY,
                                    TT3PlatformInstance(missile.TargetObject).getPositionX,
                                    TT3PlatformInstance(missile.TargetObject).getPositionY);

                      frmToteDisplay.OnweaponEngageWaypoint(TT3PlatformInstance(FControlled),
                              missile, TT3PlatformInstance(missile.TargetObject),
                              DistanceToTarget, FRippleDegreeLauncer[i], i+1, 0, 0);
                    end;
                  end;
                end
                else
                begin
                  frmTacticalDisplay.addStatus('Launcher ' + IntToStr(i+1) + ' Waypoint is Ready');

                  case missile.Engagement of
                    meRipple:
                    begin
                      frmToteDisplay.OnweaponEngageWaypoint(TT3PlatformInstance(FControlled),
                           missile, TT3PlatformInstance(missile.TargetObject),
                           Distance, FRippleDegreeLauncer[i], i+1, 0, 0);
                    end;
                    meSTOT:
                    begin
                      frmToteDisplay.ClearAllSurfaceToSurfaceList(TT3PlatformInstance(FControlled));
                      PrepareRBLW_STOT;

                      SetToToteDisplay_STOT;
                    end;
                    meDTOT:
                    begin
                      frmToteDisplay.OnweaponEngageWaypoint(TT3PlatformInstance(FControlled),
                          missile, TT3PlatformInstance(missile.TargetObject), Distance,
                          FRippleDegreeLauncer[i], i+1, 0, 0);
                    end;
                  end;
                end;
              end;
            end;

            with RecSend do
            begin
              cmd := 2;
              PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
              WeaponIndex := missile.InstanceIndex;
              WeaponName := missile.InstanceName;
            end;
            simMgrClient.netSend_CmdSyncRBLW(RecSend);
          end;
          mfmBOLW:
          begin
            with RecSend2 do
            begin
              cmd := 2;
              PlatformID   := TT3PlatformInstance(FControlled).InstanceIndex;
              WeaponIndex  := missile.InstanceIndex;
              WeaponName   := missile.InstanceName;
            end;
            simMgrClient.netSend_CmdSyncBOLW(RecSend2);

            frmTacticalDisplay.addStatus('BOLW is Ready To Inplant in Missile');
          end;
        end;
      end;
      14 :
      begin
        // Cancel Weapon Waypoint
        btnSurfaceToSurfaceMissileWaypointsEdit.Enabled := True;
        btnSurfaceToSurfaceMissileWaypointsAdd.Enabled := False;
        btnSurfaceToSurfaceMissileWaypointsDelete.Enabled := False;
        btnSurfaceToSurfaceMissileWaypointsApply.Enabled := False;
        btnSurfaceToSurfaceMissileWaypointsCancel.Enabled := False;

        case missile.FiringMode of
          mfmRBLW :
          begin
            with RecSend do
            begin
              cmd := 1;
              PlatformID  := TT3PlatformInstance(FControlled).InstanceIndex;
              WeaponIndex := missile.InstanceIndex;
              WeaponName  := missile.InstanceName;
            end;
            simMgrClient.netSend_CmdSyncRBLW(RecSend);
          end;
          mfmBOLW:
          begin
            with RecSend2 do
            begin
              cmd := 1;
              PlatformID  := TT3PlatformInstance(FControlled).InstanceIndex;
              WeaponIndex := missile.InstanceIndex;
              WeaponName  := missile.InstanceName;
            end;
            simMgrClient.netSend_CmdSyncBOLW(RecSend2);
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.PrepareRBLW_STOT;
var
  RBLWPoint : TPointVehicleMissileRBLW;
  Missile   : TT3MissilesOnVehicle;
  i,j: Integer;
begin
  Missile := TT3MissilesOnVehicle(focused_weapon);

  Missile.RBLW_STOTList.ListNonSort.Clear;
  Missile.RBLW_STOTList.ListSort.Clear;

  for i := 0 to 7 do
  begin
    if FRippleCountArray[i] then
    begin
      for j := 0 to Missile.RBLW_PointList.Count - 1 do
      begin
        RBLWPoint := TPointVehicleMissileRBLW(Missile.RBLW_PointList[j]);

        if RBLWPoint.LauncherIndex = (i+1) then
        begin
          RBLWPoint.DistanceToTarget := CalculateDistanceRBLW(RBLWPoint.LauncherIndex);

          Missile.RBLW_STOTList.ListNonSort.Add(RBLWPoint);
          Break;
        end;
      end;
    end;
  end;

  Missile.RBLW_STOTList.SortList;
end;

procedure TfmWeapon.rdoTacticalMissileTarget(Sender: TObject);
var
  r : TRecFiringModeWeapon;
  missile : TT3MissilesOnVehicle;
begin
  if focused_weapon = nil then Exit;
  if FControlled = nil then Exit;

  missile := TT3MissilesOnVehicle(focused_weapon);

  if Sender is TRadioButton then
  begin
    case TRadioButton(Sender).Tag of
      0 :
        begin
            //untuk mode target track
            r.FiringMode := Byte(mfmDirect);
        end;
      1 :
        begin
            //untuk mode target aimpoint
            r.FiringMode := Byte(mfmAimpoint);

            TacticalMissileWaypointSet(True);

            btnTacticalMissileTargetBearing.Enabled   := False;
            editTacticalMissileTargetBearing.Enabled  := False;
            editTacticalMissileTargetBearing.Color    := clBtnFace;

            btnTacticalMissileTargetAimpoint.Enabled  := True;
            editTacticalMissileTargetAimpoint.Enabled := True;
            editTacticalMissileTargetAimpoint.Color   := clWindow;

  //          missile.FiringMode    := mfmAimpoint;
        //    rMis.FiringMode := Byte(mfmAimpoint);
            rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
            rMis.TargetPlatformID := 0;
            rMis.MissileID        := missile.InstanceIndex;
        end;
      2 :
        begin
            //untuk mode target bearing
            r.FiringMode := Byte(mfmBearing);

            TacticalMissileWaypointSet(False);

            btnTacticalMissileTargetBearing.Enabled   := True;
            editTacticalMissileTargetBearing.Enabled  := True;
            editTacticalMissileTargetBearing.Color    := clWindow;

            btnTacticalMissileTargetAimpoint.Enabled  := False;
            editTacticalMissileTargetAimpoint.Enabled := False;
            editTacticalMissileTargetAimpoint.Color   := clBtnFace;
            editTacticalMissileTargetAimpoint.Text    := '';

            missile.FiringMode    := mfmBearing;
            rMis.FiringMode := Byte(mfmBearing);
            rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
            rMis.TargetPlatformID := 0;
            rMis.MissileID        := missile.InstanceIndex;
        end;
    end;
  end;

  r.PlatformID := TT3Vehicle(FControlled).InstanceIndex;
  r.MissileID  := missile.InstanceIndex;
//  r.FiringMode := Byte(mfmDirect);
  simMgrClient.netSend_CmdMissileProperties(r);

  btnTacticalMissileLaunch.Enabled := True;
end;

procedure TfmWeapon.rdoTacticalMissileTargetAimpointClick(Sender: TObject);
var
  missile : TT3MissilesOnVehicle;
begin
  inherited;
  if focused_weapon = nil then Exit;
  if FControlled = nil then Exit;

  missile := TT3MissilesOnVehicle(focused_weapon);

  if rdoTacticalMissileTargetAimpoint.Checked = True then
  begin
    TacticalMissileWaypointSet(True);

    btnTacticalMissileTargetBearing.Enabled   := False;
    editTacticalMissileTargetBearing.Enabled  := False;
    editTacticalMissileTargetBearing.Color    := clBtnFace;

    btnTacticalMissileTargetAimpoint.Enabled  := True;
    editTacticalMissileTargetAimpoint.Enabled := True;
    editTacticalMissileTargetAimpoint.Color   := clWindow;

    missile.FiringMode    := mfmAimpoint;
//    rMis.FiringMode := Byte(mfmAimpoint);
    rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
    rMis.TargetPlatformID := 0;
    rMis.MissileID        := missile.InstanceIndex;
  end;

end;

procedure TfmWeapon.rdoTacticalMissileTargetBearingClick(Sender: TObject);
var
  missile : TT3MissilesOnVehicle;
begin
  inherited;

  if focused_weapon = nil then Exit;
  if FControlled = nil then Exit;

  missile := TT3MissilesOnVehicle(focused_weapon);

  if rdoTacticalMissileTargetBearing.Checked = True then
  begin
    TacticalMissileWaypointSet(False);

    btnTacticalMissileTargetBearing.Enabled   := True;
    editTacticalMissileTargetBearing.Enabled  := True;
    editTacticalMissileTargetBearing.Color    := clWindow;

    btnTacticalMissileTargetAimpoint.Enabled  := False;
    editTacticalMissileTargetAimpoint.Enabled := False;
    editTacticalMissileTargetAimpoint.Color   := clBtnFace;
    editTacticalMissileTargetAimpoint.Text    := '';

    missile.FiringMode    := mfmBearing;
    rMis.FiringMode := Byte(mfmBearing);
    rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
    rMis.TargetPlatformID := 0;
    rMis.MissileID        := missile.InstanceIndex;
  end;

end;

procedure TfmWeapon.rdoTacticalMissileTargetTrackClick(Sender: TObject);
var
  missile : TT3MissilesOnVehicle;
  r : TRecFiringModeWeapon;
begin
  inherited;

  if focused_weapon = nil then Exit;
  if FControlled = nil then Exit;

  missile := TT3MissilesOnVehicle(focused_weapon);

  missile.FiringMode := mfmDirect;
//  rMis.FiringMode := Byte(mfmDirect);

  r.PlatformID := TT3Vehicle(FControlled).InstanceIndex;
  r.MissileID  := missile.InstanceIndex;
  r.FiringMode := Byte(mfmDirect);
  simMgrClient.netSend_CmdMissileProperties(r);
end;

procedure TfmWeapon.rdoTacticalMissileTrackMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  r : TRecFiringModeWeapon;
  missile : TT3MissilesOnVehicle;
begin
  inherited;
  if focused_weapon = nil then Exit;
  if FControlled = nil then Exit;

  missile := TT3MissilesOnVehicle(focused_weapon);

  if Sender is TRadioButton then
  begin
    case TRadioButton(Sender).Tag of
      0 :
        begin
            //untuk mode target track
            r.FiringMode := Byte(mfmDirect);
        end;
      1 :
        begin
            //untuk mode target aimpoint
            r.FiringMode := Byte(mfmAimpoint);

            TacticalMissileWaypointSet(True);

            btnTacticalMissileTargetBearing.Enabled   := False;
            editTacticalMissileTargetBearing.Enabled  := False;
            editTacticalMissileTargetBearing.Color    := clBtnFace;

            btnTacticalMissileTargetAimpoint.Enabled  := True;
            editTacticalMissileTargetAimpoint.Enabled := True;
            editTacticalMissileTargetAimpoint.Color   := clWindow;

  //          missile.FiringMode    := mfmAimpoint;
        //    rMis.FiringMode := Byte(mfmAimpoint);
            rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
            rMis.TargetPlatformID := 0;
            rMis.MissileID        := missile.InstanceIndex;
        end;
      2 :
        begin
            //untuk mode target bearing
            r.FiringMode := Byte(mfmBearing);

            TacticalMissileWaypointSet(False);

            btnTacticalMissileTargetBearing.Enabled   := True;
            editTacticalMissileTargetBearing.Enabled  := True;
            editTacticalMissileTargetBearing.Color    := clWindow;

            btnTacticalMissileTargetAimpoint.Enabled  := False;
            editTacticalMissileTargetAimpoint.Enabled := False;
            editTacticalMissileTargetAimpoint.Color   := clBtnFace;
            editTacticalMissileTargetAimpoint.Text    := '';

            missile.FiringMode    := mfmBearing;
            rMis.FiringMode := Byte(mfmBearing);
            rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
            rMis.TargetPlatformID := 0;
            rMis.MissileID        := missile.InstanceIndex;
        end;
    end;
  end;

  r.PlatformID := TT3Vehicle(FControlled).InstanceIndex;
  r.MissileID  := missile.InstanceIndex;
//  r.FiringMode := Byte(mfmDirect);
  simMgrClient.netSend_CmdMissileProperties(r);

  btnTacticalMissileLaunch.Enabled := True;
end;

procedure TfmWeapon.btnSurfaceToSurfaceMissileEngagementClick(Sender: TObject);
var pt: TPoint;
begin
  GetCursorPos(pt);

  if pmenuEngagement.Items.Count > 0 then
    pmenuEngagement.Popup(pt.X, pt.Y);
end;

procedure TfmWeapon.btnSurfaceToSurfaceMissileFiringClick(Sender: TObject);
var pt: TPoint;
begin
  GetCursorPos(pt);

  if pmenuFiring.Items.Count > 0 then
    pmenuFiring.Popup(pt.X, pt.Y);

end;

procedure TfmWeapon.btnSurfaceToSurfaceMissileLauncher1Click(
  Sender: TObject);

begin
  //TimerLaunch.Enabled := not TimerLaunch.Enabled;
  FLaunchCourse := StrToInt(TButton(Sender).Hint); //hint untuk nyimpan launcher
end;

procedure TfmWeapon.btnSurfaceToSurfaceMissileLauncherMoreClick(
  Sender: TObject);
begin
  if not simMgrClient.IsGameStart then
  begin
    frmTacticalDisplay.addStatus('Game Frozen');
    Exit;
  end;

  inherited;

  if not Assigned(frmSurfaceSurfaceMissileControl) then
    frmSurfaceSurfaceMissileControl := TfrmSurfaceSurfaceMissileControl.Create(self);

  frmSurfaceSurfaceMissileControl.MissileVehicle := TT3MissilesOnVehicle(focused_weapon);
  frmSurfaceSurfaceMissileControl.ShipOwn        := TT3PlatformInstance(FControlled);
  frmSurfaceSurfaceMissileControl.SetEnvironment(TT3PlatformInstance(FControlled),
                                      TT3MissilesOnVehicle(focused_weapon));

  frmSurfaceSurfaceMissileControl.Show;
end;

procedure TfmWeapon.btnSurfaceToSurfaceMissileTargetTrackDetailsClick(
  Sender: TObject);
var
  parent : TSimObject;
  target : TSimObject;
begin
  if not simMgrClient.IsGameStart then
  begin
    frmTacticalDisplay.addStatus('Game Frozen');
    Exit;
  end;

  inherited;

  if not Assigned(focused_weapon) then exit;

  parent := focused_weapon.Parent;
  if parent = nil then exit;

  if not (focused_weapon is TT3MissilesOnVehicle) then exit;

  target := TT3MissilesOnVehicle(focused_weapon).TargetObject;
  if target = nil then exit;  

  if not Assigned(frmDetailTrackTarget) then
    frmDetailTrackTarget := TfrmDetailTrackTarget.Create(self);

  frmDetailTrackTarget.SetDetailedTarget(parent,target);
  frmDetailTrackTarget.FormStyle := fsStayOnTop;
  frmDetailTrackTarget.Show;
end;


procedure TfmWeapon.btntestClick(Sender: TObject);
begin
  inherited;

  //TmrSTOT.Enabled := True;
  tmrLaunchSTOT.Enabled := True;
end;

procedure TfmWeapon.btnVectacClick(Sender: TObject);
var
  vehicle : TT3Vehicle;
  pt : TPoint;
  target : TT3PlatformInstance;
  vectac : TT3Vectac;
begin
  vehicle := TT3Vehicle(FControlled);
  vectac := vehicle.Weapons.Items[vehicle.LastWeaponsSelected];

  recVectac.CommanderID := vehicle.InstanceIndex;

  if Sender is TSpeedButton then
  begin
    case TSpeedButton(Sender).Tag of
      1:
      begin
        if not Assigned(FControlled) then
        begin
          frmTacticalDisplay.addStatus('Vehicle Sender Not Found');
          Exit;
        end;
        if not Assigned(focused_platform) then
        begin
          frmTacticalDisplay.addStatus('Vehicle Target Not Found');
          Exit;
        end;

        if focused_platform is TT3DetectedTrack then
          target := TT3DetectedTrack(focused_platform).TrackObject as TT3PlatformInstance
        else
          target := focused_platform as TT3PlatformInstance;

        if target.PlatformDomain <> 2 then //if Sub-surface
        begin
          frmTacticalDisplay.addStatus('Target Domain Not Same With Weapon');
          editVectacTargetTrack.Text := '';
          Exit;
        end;

        if vehicle.InstanceIndex <> target.InstanceIndex then
        begin
          recVectac.cmd := CPID_CMD_VECTAC_TRACK;
          recVectac.TargetID := target.InstanceIndex;

          simMgrClient.netSend_Vectac(recVectac);
        end
        else
        begin
          frmTacticalDisplay.addStatus('Cant Track Own Vehicle');
          editVectacTargetTrack.Text := '';
        end;
      end;
      2:
      begin
        GetCursorPos(pt);

        if pmenuWpnCarrier.Items.Count > 0 then
          pmenuWpnCarrier.Popup(pt.X, pt.Y);
      end;
      3:
      begin
        GetCursorPos(pt);

        if pmenuWpn.Items.Count > 0 then
          pmenuWpn.Popup(pt.X, pt.Y);
      end;
    end;
  end
  else if Sender is TButton then
  begin
    case TButton(Sender).Tag of
      1: //plan
      begin
        if not Assigned(vectac.WeaponCarrier) then
        begin
          frmTacticalDisplay.addStatus('No Weapon Carrier Selected');
          Exit;
        end;

        recVectac.cmd               := CPID_CMD_VECTAC_PLAN;
        recVectac.CommanderID       := vehicle.InstanceIndex;
        recVectac.CommanderGroupID  := vehicle.GroupIndex;
        recVectac.WpnCarrierID      := vectac.WeaponCarrier.InstanceIndex;
//        if simMgrClient.IsController then
          recVectac.CmdFromController := simMgrClient.IsController;
//        if simMgrClient.ISWasdal then
//          recVectac.CmdFromController := simMgrClient.ISWasdal;
        recVectac.CoordX            := vectac.Target.PosX;
        recVectac.CoordY            := vectac.Target.PosY;

        simMgrClient.netSend_Vectac(recVectac);
      end;
      2: //cancel
      begin
        recVectac.cmd           := CPID_CMD_VECTAC_CANCEL;
        recVectac.CommanderID   := vehicle.InstanceIndex;
        recVectac.CmdFromController := simMgrClient.IsController;

        simMgrClient.netSend_Vectac(recVectac);
      end;
      3: //launch
      begin
        if not Assigned(vectac.Weapon) then
          Exit;

        recVectac.cmd     := CPID_CMD_VECTAC_LAUNCH;
        recVectac.Weapon  := vectac.Weapon.InstanceIndex;
        recVectac.CmdFromController := simMgrClient.IsController;
        recVectac.ProjectileInstanceIndex := 0;

        simMgrClient.netSend_Vectac(recVectac);
      end;
    end;
  end;
end;

procedure TfmWeapon.btnWeaponClick(Sender: TObject);
var
  pt: TPoint;
  weapon : TT3Weapon;
  ve : TT3Vehicle;
  I, J : Integer;
  det : TT3DetectedTrack;
  item : TMenuItem;
begin
  GetCursorPos(pt);

  if Assigned(FControlled) then
  begin
    ve := TT3Vehicle(FControlled);

    if pmenuWeapon.Items.Count > 0 then
    begin
      for I := 0 to pmenuWeapon.Items.Count - 1 do
      begin
        item := pmenuWeapon.Items.Items[i];

        weapon := ve.getWeapon(DeleteAmpersand(item.Caption)) as TT3Weapon;

        if weapon.WeaponCategory = wcVectac then
        begin
          if not simMgrClient.ISInstructor or not simMgrClient.ISWasdal then
          begin
            Item.Visible := False;
            if simMgrClient.SimDetectedTrackList.itemCount > 0 then
            begin
              for J := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
              begin
                det := simMgrClient.SimDetectedTrackList.getObject(J) as TT3DetectedTrack;

                ve := TT3Vehicle(det.TrackObject);

                if det.TrackIdent = piFriend then
                begin
                   if det.TrackDomain = vhdAir then
                   begin
                    Item.Visible:= True;
                   end;
                end;
              end;
            end;

            if simMgrClient.SimPlatforms.itemCount > 0 then
            begin
              for J := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
              begin
                if simMgrClient.SimPlatforms.getObject(J) is TT3Vehicle then
                begin
                  ve := simMgrClient.SimPlatforms.getObject(J) as TT3Vehicle;

                  if ve.Force_Designation = TT3Vehicle(FControlled).Force_Designation then
                  begin
                     if ve.PlatformDomain = vhdAir then
                     begin
                      Item.Visible:= True;
                     end;
                  end;
                end;
              end;
            end;
      //          else
      //          begin
      //            if weapon.WeaponCategory = wcVectac then
      //              Item.Visible := False;
      //          end;
          end;
        end;
      end;
    end;
  end;

  if pmenuWeapon.Items.Count > 0 then
    pmenuWeapon.Popup(pt.X, pt.Y);
end;

procedure TfmWeapon.DisplayTab(const i: byte);
var wc : TWeapoonCategory;
begin
  inherited;
  wc := TWeapoonCategory(i);

  if FAGroupBox[wc] <> nil then begin
     FAGroupBox[wc].BringToFront;
  end;
end;

procedure TfmWeapon.ediSurfaceToAirSalvoKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  salvoSize: integer;
begin
  inherited;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if TryStrToInt(TEdit(Sender).Text, salvoSize) then
    begin
      if focused_weapon = nil then
        exit;

      if not(focused_weapon is TT3MissilesOnVehicle) then
        exit;

      TT3MissilesOnVehicle(focused_weapon).SalvoSize := salvoSize;
    end;
  end;
end;

procedure TfmWeapon.editControlSalvoSizeKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  salvo: integer;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToInt(TEdit(Sender).Text, salvo);

    if focused_weapon = nil then
      exit;

    if not(focused_weapon is TT3GunOnVehicle) then
      exit;

    TT3GunOnVehicle(focused_weapon).SalvoSize := salvo;
    rGun.SalvoSize := salvo;
  end;
end;

procedure TfmWeapon.editTacticalMissileTargetBearingKeyPress(Sender: TObject;
  var Key: Char);
var
  Bearing : Double;
  missile : TT3MissilesOnVehicle;
begin
  inherited;

  if focused_weapon = nil  then Exit;

  missile := TT3MissilesOnVehicle(focused_weapon);

  if Key = #13 then
  begin
    if TryStrToFloat(editTacticalMissileTargetBearing.Text, Bearing) then
    begin
      missile.Bearing_Movement.BearingLaunch := Bearing;
    end;
  end;
end;

procedure TfmWeapon.editVectacKeypress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
begin
  inherited;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    case TEdit(Sender).Tag of
      0 : //Weapon Carrier Speed
      begin
        recVectac.cmd := CPID_CMD_VECTAC_SPEED_CHANGE;
        recVectac.WpnCarrierSpeed := StrToFloat(TEdit(Sender).Text);
        simMgrClient.netSend_Vectac(recVectac);
      end;
      1 : //Weapon Drop Point Offset
      begin
        recVectac.cmd := CPID_CMD_VECTAC_DROP_CHANGE;
        recVectac.WeaponDropOffset := StrToFloat(TEdit(Sender).Text);
        simMgrClient.netSend_Vectac(recVectac);
      end;
    end;
  end;
end;

procedure TfmWeapon.AcousticKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  value : integer;
begin
  inherited;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToInt(TEdit(Sender).Text, value);

    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      case TEdit(sender).Tag of
        1 : SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 4, InstanceIndex, InstanceName, value / C_NauticalMile_To_Yards);
        2 : SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 5, InstanceIndex, InstanceName, value);
        3 : SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 6, InstanceIndex, InstanceName, value);
        4 : SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 7, InstanceIndex, InstanceName, value / C_NauticalMile_To_Yards);
      end;
    end;
  end;
end;

procedure TfmWeapon.AcousticTubeOnClick(Sender: TObject);
begin
  with TT3TorpedoesOnVehicle(focused_weapon) do
  begin
    case TButton(Sender).Tag of
      11 : SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 1, InstanceIndex, InstanceName, 1);
      12 : SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 1, InstanceIndex, InstanceName, 2);
      13 : SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 1, InstanceIndex, InstanceName, 3);
      14 : SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 1, InstanceIndex, InstanceName, 4);
    end;
  end;
end;

procedure TfmWeapon.edtCountKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  value: Integer;
begin
  ValKey := [#48 .. #57, #8, #13];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

end;

procedure TfmWeapon.edtDestructRangeKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  missile : TT3MissilesOnVehicle;
  tDestruckRange : Double;
begin
  inherited;
  missile := TT3MissilesOnVehicle(focused_weapon);

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    tDestruckRange := StrToFloat(edtDestructRange.Text);

    if tDestruckRange - 1 > missile.SeekerRangeTurn then
    begin
      missile.DestruckRange := tDestruckRange;
    end
    else
    if tDestruckRange > missile.WeaponRange then
    begin
      frmTacticalDisplay.addStatus('Input Reach Maximum Seeker On');
    end
    else
    begin
      frmTacticalDisplay.addStatus('Input Reach Minimum Seeker On');
    end;
  end;
end;

procedure TfmWeapon.edtRangeKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  value: Integer;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;
end;

procedure TfmWeapon.EngagementModeChange(Obj:TObject);
var
  mis : TT3MissilesOnVehicle;
begin
  if not simMgrClient.IsGameStart then
  begin
    frmTacticalDisplay.addStatus('Game Frozen');
    Exit;
  end;

  mis := TT3MissilesOnVehicle(Obj);
  updateEngageText(byte(mis.Engagement) + 1);
end;

procedure TfmWeapon.FiringModeChange(Obj:TObject);
var
  mis : TT3MissilesOnVehicle;
begin
  if not simMgrClient.IsGameStart then
  begin
    frmTacticalDisplay.addStatus('Game Frozen');
    Exit;
  end;

  mis := TT3MissilesOnVehicle(Obj);
  UpdateFiringModeText(Obj, Byte(mis.FiringMode)+ 1);

  btnSurfaceToSurfacePlan.Enabled := False;
  btnSurfaceToSurfaceCancel.Enabled := False;
  btnSurfaceToSurfaceLaunch.Enabled := False;
  btnSurfaceToSurfaceMissileWaypointsEdit.Enabled := False;
  btnSurfaceToSurfaceMissileWaypointsAdd.Enabled := False;
  btnSurfaceToSurfaceMissileWaypointsDelete.Enabled := False;
  btnSurfaceToSurfaceMissileWaypointsApply.Enabled := False;
  btnSurfaceToSurfaceMissileWaypointsCancel.Enabled := False;

  setThisLauncherState;

  mis.Planned := False;
end;

procedure TfmWeapon.GetAngleRange(const aBearing, aDifference: Double;
  var aFromBearing, aToBearing: Double);
var
  temp : Double;
begin
  aFromBearing := aBearing - aDifference;
  if aFromBearing < 0 then
    aFromBearing := aFromBearing + 360;

  aToBearing := aBearing + aDifference;
  if aToBearing > 360 then
    aToBearing := aToBearing - 360;

  if aFromBearing > aToBearing then
  begin
    temp := aFromBearing;
    aFromBearing := aToBearing;
    aToBearing := temp;
  end;
end;

procedure TfmWeapon.btnAcousticTorpedoOnClick(Sender: TObject);
var
  strParentTrackId, strParentTrackNumber,
  strTargetTrackId, strTargetGroundSpeed,
  strTargetCourse, strTargetAltitude       : string;

  intParentPlatformID, intNoCubicle,
  intTargetPlatformID, intbatasAT, intTemp : Integer;

  target      : TT3PlatformInstance;
  focusTarget : TSimObject;

  _valueFloat : Double;
begin
  inherited;

  if not simMgrClient.IsGameStart then
  begin
    frmTacticalDisplay.addStatus('Game Frozen');
    Exit;
  end;

  if focused_weapon = nil then
  begin
    frmTacticalDisplay.addStatus('Not Found Selected Weapon');
    Exit;
  end;

  if not(focused_weapon is TT3TorpedoesOnVehicle)then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Not Torpedo');
    Exit;
  end;

  if TT3TorpedoesOnVehicle(focused_weapon).WeaponStatus = wsDamaged then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Damaged');
    Exit;
  end;

  if Sender is TSpeedButton then
  begin
    {$REGION ' SpeedButton Handle '}
    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      case TSpeedButton(Sender).Tag of
        1 : begin
              FVisibleShowRange := True;
              ShowRange         := True;
              ShowRangeSelected := (ShowRange and FVisibleShowRange);
              HideRangeSensor;
            end;
        2 : begin
              FVisibleShowRange := False;
              ShowRange         := False;
              ShowRangeSelected := (ShowRange and FVisibleShowRange);
            end;
        3 : begin
              FVisibleShowBlind := True;
              ShowBlind         := True;
              ShowBlindSelected := (ShowBlind and FVisibleShowBlind);
              HideBlindSensor;
            end;
        4 : begin
              FVisibleShowBlind := False;
              ShowBlind         := False;
              ShowBlindSelected := (ShowBlind and FVisibleShowBlind);
            end;
        5 : begin
              {Ngecek Track ID self}
              if Assigned(FControlled) then
              begin
                strParentTrackId := TT3PlatformInstance(FControlled).Track_ID;
                strParentTrackNumber := FormatTrackNumber(TT3PlatformInstance(FControlled).TrackNumber);
                intParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                EdtATTargetTrack.Text := '';
              end
              else begin
                frmTacticalDisplay.addStatus('Controlled platform not defined');
                exit;
              end;

              {Ngecek Validasi target}
              if Assigned(focused_platform) then
              begin
                if not TorpedoTargetCheck() then
                begin
                  frmTacticalDisplay.addStatus('Invalid target domain');
                  exit;
                end;

                {Kalo yg di track Detected track}
                if focused_platform is TT3DetectedTrack then
                begin
                  strTargetTrackId := TT3PlatformInstance(TT3DetectedTrack(focused_platform).TrackObject).Track_ID;
                  strTargetCourse := FormatCourse(TT3PlatformInstance(TT3DetectedTrack(focused_platform).TrackObject).Course);
                  strTargetGroundSpeed := FormatSpeed(TT3PlatformInstance(TT3DetectedTrack(focused_platform).TrackObject).Speed);
                  strTargetAltitude := FormatCourse(TT3PlatformInstance(TT3DetectedTrack(focused_platform).TrackObject).Altitude);
                  IntTargetPlatformID := TT3PlatformInstance(TT3DetectedTrack(focused_platform).TrackObject).InstanceIndex;

                  target := simMgrClient.FindT3PlatformByID(IntTargetPlatformID);
                end
                {Kalo yg di track Non Real Time}
                else if focused_platform is TT3NonRealVehicle then
                begin
                  strTargetTrackId := IntToStr(TT3PlatformInstance(focused_platform).InstanceIndex);
                  strTargetCourse := FormatCourse(TT3NonRealVehicle(focused_platform).Course);
                  strTargetGroundSpeed := FormatSpeed(TT3NonRealVehicle(focused_platform).Speed);
                  strTargetAltitude := FormatCourse(TT3NonRealVehicle(focused_platform).Altitude);
                  IntTargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;

                  target := simMgrClient.FindNonRealPlatformByID(IntTargetPlatformID);
                end
                {Kalo yg di track Platform Instance}
                else
                begin
                  strTargetTrackId := TT3PlatformInstance(focused_platform).Track_ID;
                  strTargetCourse := FormatCourse(TT3PlatformInstance(focused_platform).Course);
                  strTargetGroundSpeed := FormatSpeed(TT3PlatformInstance(focused_platform).Speed);
                  strTargetAltitude := FormatCourse(TT3PlatformInstance(focused_platform).Altitude);
                  IntTargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;

                  target := simMgrClient.FindT3PlatformByID(IntTargetPlatformID);
                end;
              end
              else
              begin
                frmTacticalDisplay.addStatus('Target platform not defined');
                exit;
              end;

              if not Assigned(target) then exit;

              if Assigned(simMgrClient.findDetectedTrack(target)) then
                 strTargetTrackId := FormatTrackNumber(TT3DetectedTrack(simMgrClient.findDetectedTrack(target)).TrackNumber)
              else
              begin
                if TT3PlatformInstance(target).TrackNumber = 0 then
                  strTargetTrackId := strTargetTrackId
                else
                  strTargetTrackId := FormatTrackNumber(TT3PlatformInstance(target).TrackNumber);
              end;

              if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
                intNoCubicle  := 0
              else
                intNoCubicle  := simMgrClient.FMyCubGroup.FData.Group_Index;

              if (strParentTrackId <> strTargetTrackId) and (strParentTrackNumber <> strTargetTrackId) then
              begin
                TargetObject             := focused_platform;

                {Paket Synch Panel Weapon Ketika Track Target}
                rPanel.NoCubicle := intNoCubicle;
                rPanel.ParentPlatformID := intParentPlatformID;
                rPanel.TargetPlatformID := IntTargetPlatformID;
                rPanel.TorpType := 6;
                rPanel.WeaponIndex := InstanceIndex;
                rPanel.WeaponName := InstanceName;
                rPanel.TargetTrack := strTargetTrackId;
                rPanel.Param1 := '---';
                rPanel.Param2 := strTargetCourse;
                rPanel.Param3 := strTargetGroundSpeed;
                rPanel.Param4 := strTargetAltitude;
                rPanel.FiringMode := 1;
                rPanel.RunOut := 1;

                rPanel.SearchRadius := Round(TorpedoDefinition.FDef.Terminal_Circle_Radius);
                rPanel.SearchDepth := Round(TorpedoDefinition.FDef.Default_Depth* C_Feet_To_Meter);
                rPanel.SafetyCeiling := Round(TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth* C_Feet_To_Meter);
                rPanel.SeekerRange := Round(TorpedoDefinition.FDef.Seeker_TurnOn_Range);

                rPanel.GyroAngle := 0;
                rPanel.ButtonPlan := True;
                rPanel.ButtonLaunch := False;

                SimMgrClient.netSend_CmdTorpedoSyncPanelWeapon(rPanel);
                Sleep(100);
                {----------------------------------------------------------------}
              end
              else
              begin
                frmTacticalDisplay.addStatus('Cannot target own platform');
                exit;
              end;
            end;
      end;
    end;
    {$ENDREGION}
  end;

  if Sender is TButton then
  begin
    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      if (EdtATTargetTrack.Text = '') or (EdtATTargetTrack.Text = '---')then
        Exit;

      focusTarget := simMgrClient.FindT3PlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);
      if not Assigned(focusTarget) then
      begin
        focusTarget := simMgrClient.FindNonRealPlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);
        strTargetAltitude := FloatToStr(TT3NonRealVehicle(focusTarget).Altitude);
      end
      else
      begin
        strTargetAltitude := FloatToStr(TT3PlatformInstance(focusTarget).Altitude);
      end;

      {$REGION ' Konstanta Acoustic '}
      {(1)Tube, (2)Firing Mode, (3)RunOut Mode, (4)SearchRadius, (5)SearchDepth,
      (6)Safety Ceiling, (7)SeekerRange, (8)GyroAngle }
      {$ENDREGION}

      case TButton(Sender).Tag of
        1 :
        begin
          if TorpedoDefinition.FDef.Sinuation_Runout = 1 then
            SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 3, InstanceIndex, InstanceName, 1)
          else
            SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 3, InstanceIndex, InstanceName, 0);
        end;
        2 : {Search Radius}
        begin
          TryStrToFloat(TEdit(Sender).Text, _valueFloat);

          _valueFloat := TorpedoDefinition.FDef.Terminal_Circle_Radius;
          SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 4, InstanceIndex, InstanceName, _valueFloat);
        end;
        3 :
        begin
          intTemp := StrToInt(strTargetAltitude);
          SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 5, InstanceIndex, InstanceName, intTemp);
        end;
        4 : {Safety Ceiling}
        begin
          TryStrToFloat(TEdit(Sender).Text, _valueFloat);

          _valueFloat := TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter;
          SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 6, InstanceIndex, InstanceName, _valueFloat);
        end;
        5 : {Seeker Range}
        begin
          TryStrToFloat(TEdit(Sender).Text, _valueFloat);

          _valueFloat := TorpedoDefinition.FDef.Seeker_TurnOn_Range;
          SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 7, InstanceIndex, InstanceName, _valueFloat);
        end;
        6 :
        begin
          intTemp := 0;
          SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 8, InstanceIndex, InstanceName, intTemp);
        end;
        7 :
        begin
          if btnPlanAT.Enabled = True then
          begin
            fPlanDetail := TPlanDetail.Create(self);

            with fPlanDetail do
            begin
              lblNeme.Caption := InstanceName;
              lblTrack.Caption:= TargetTrack;
              lblCourse.Caption:= TargetCourse;
              lblSpeed.Caption := TargetGroundSpeed;
              lblDepth.Caption := TargetAltitude;
            end;

            fPlanDetail.show;
          end;
        end;
        8 :
        begin
          intTemp := 1;
          SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActiveAcoustic), 9, InstanceIndex, InstanceName, intTemp);
        end;
        9 :
        begin
          {Paket Synch Panel Weapon Setelah Ditembakkan}
          rPanel.NoCubicle := 0;
          rPanel.ParentPlatformID := ParentPlatformID;
          rPanel.TargetPlatformID := 0;
          rPanel.TorpType := 6;
          rPanel.WeaponIndex := InstanceIndex;
          rPanel.WeaponName := InstanceName;
          rPanel.TargetTrack := '---';
          rPanel.Param1 := '---';
          rPanel.Param2 := '---';
          rPanel.Param3 := '---';
          rPanel.Param4 := '---';
          rPanel.FiringMode := 1;
          rPanel.RunOut := 1;
          rPanel.SearchRadius := 0;
          rPanel.SearchDepth := 0;
          rPanel.SafetyCeiling := 0;
          rPanel.SeekerRange := 0;
          rPanel.GyroAngle := 0;
          rPanel.ButtonPlan := False;
          rPanel.ButtonLaunch := False;

          SimMgrClient.netSend_CmdTorpedoSyncPanelWeapon(rPanel);
          Sleep(100);
          {----------------------------------------------------------------}
        end;
        10:
        begin
           if (focusTarget = nil) or (EdtATTargetTrack.Text = '')then
           begin
              frmTacticalDisplay.addStatus('Target is not selected!');
              exit;
           end;

           EdtATTargetTrack.Text := '';
           intbatasAT := Quantity;

           if (TorpedoPrelaunchCheck())
              and (intbatasAT > 0) then
           begin
              if (EdtSearchRadiusAT.Text = '') or (EdtSearchDepthAT.Text = '') or
                 (EdtSafetyCeilingAT.Text = '') or (EdtSeekerRangeAT.Text = '') then
                ShowMessage('Data Torpedo belum diisi')
              else
              begin
                {Paket Launch Torpedo}
                rMis.ParentPlatformID := ParentPlatformID;
                rMis.TargetPlatformID := TargetPlatformID;
                rMis.ProjectileInstanceIndex := 0;
                rMis.NoCubicle := NoCubicle;
                rMis.MissileID := InstanceIndex;

                SimMgrClient.netSend_CmdLaunch_Torpedo(rMis);
                Sleep(100);
                {------------------------------------------------------------------}

                {Paket Synch Panel Weapon Setelah Ditembakkan}
                rPanel.NoCubicle := 0;
                rPanel.ParentPlatformID := ParentPlatformID;
                rPanel.TargetPlatformID := 0;
                rPanel.TorpType := 6;
                rPanel.WeaponIndex := InstanceIndex;
                rPanel.WeaponName := InstanceName;
                rPanel.TargetTrack := '---';
                rPanel.Param1 := '---';
                rPanel.Param2 := '---';
                rPanel.Param3 := '---';
                rPanel.Param4 := '---';
                rPanel.FiringMode := 1;
                rPanel.RunOut := 1;
                rPanel.SearchRadius := 0;
                rPanel.SearchDepth := 0;
                rPanel.SafetyCeiling := 0;
                rPanel.SeekerRange := 0;
                rPanel.GyroAngle := 0;
                rPanel.ButtonPlan := False;
                rPanel.ButtonLaunch := False;

                SimMgrClient.netSend_CmdTorpedoSyncPanelWeapon(rPanel);
                Sleep(100);
                {----------------------------------------------------------------}

                SimMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(
                   FControlled).InstanceIndex,
                InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (Quantity - 1));

                lblAcousticTorpedoQuantity.Caption  := IntToStr(Quantity-1);
                btnLaunchAT.Enabled    := false;
              end;
           end
           else
           begin
             if intbatasAT <= 0 then
              ShowMessage('Cek Quantity');
           end;
        end
      end;
    end;
  end;
end;

procedure TfmWeapon.OnHybridMissileClick(Sender: TObject);
var
  Range          : Double;
  RecMissileEnvi : TrecMissile_Envi;
  HybridMissile  : TT3HybridOnVehicle;
  rLaunchMis     : TRecCmd_LaunchMissile;
  SeekerTurnOn   : Single;
begin
  inherited;

  if (focused_weapon = nil) and
    not (focused_weapon is TT3HybridOnVehicle) then Exit;

  HybridMissile := TT3HybridOnVehicle(focused_weapon);

  if Sender is TSpeedButton then
  begin
    case TSpeedButton(Sender).Tag of
      //default seeker range
      0 :
        begin
          SeekerTurnOn := HybridMissile.HybridDefinition.FMissile_Def.Seeker_TurnOn_Range;
          edtHybridMissileControlSeekerRange.Text := FloatToStr(SeekerTurnOn);
        end;

      // aimpoint
      1 :  frmTacticalDisplay.Map1.CurrentTool := mtAimpoint;

      //default hybrid missile control cruise
      2 : edtHybridMissileControlCruiseAltitude.Text := IntToStr(HybridMissile.CruiseAltitude);

      // show range
      3 :
      begin
        FVisibleShowRange := True;
        HybridMissile.ShowRange := True;

        HybridMissile.ShowRangeSelected := FVisibleShowRange and
        HybridMissile.ShowRange;
      end;

      // hide range
      4 :
      begin
        FVisibleShowRange := False;
        HybridMissile.ShowRange := False;

        HybridMissile.ShowRangeSelected := FVisibleShowRange and HybridMissile.ShowRange;
      end;

      // show blindzone
      5 :
      begin
        FVisibleShowBlind := True;
        HybridMissile.ShowBlind := true;

        HybridMissile.ShowBlindSelected := FVisibleShowBlind and HybridMissile.ShowBlind;
      end;

      // hide blindzone
      6 :
      begin
        FVisibleShowBlind := False;
        HybridMissile.ShowBlind := False;

        HybridMissile.ShowBlindSelected := FVisibleShowBlind and HybridMissile.ShowBlind;
      end;
    end;
  end;

  if Sender is TButton then
  begin
    case TButton(Sender).tag of
      // default cruise altitude
      2 : ;

      // launch missile
      7 :
      begin
        Range := CalcRange(
                    HybridMissile.getPositionX,
                    HybridMissile.getPositionY,
                    HybridMissile.Aimpoint_Movement.PositionX,
                    HybridMissile.Aimpoint_Movement.PositionY);


        if Range <= HybridMissile.HybridDefinition.FMissile_Def.Min_Range then
          frmTacticalDisplay.addStatus('Target is too close')
        else
        if Range >= HybridMissile.HybridDefinition.FMissile_Def.Max_Range then
          frmTacticalDisplay.addStatus('Target is too far')
        else begin
          if HybridMissile.Quantity <> 0 then
          begin
            with RecMissileEnvi do
            begin
              platformID        := TT3PlatformInstance(FControlled).InstanceIndex;
              WeaponIndex       := HybridMissile.InstanceIndex;
              WeaponName        := HybridMissile.InstanceName;
              Missile_Kind      := Integer(HybridMissile.WeaponCategory);
              MIssile_Method    := -1;
              Missile_PositionX := HybridMissile.Aimpoint_Movement.PositionX;
              Missile_PositionY := HybridMissile.Aimpoint_Movement.PositionY;
              Bearing           := 0;
              isHybrid          := True;
            end;

            simMgrClient.netSend_CmdSyncMissileEnvi(RecMissileEnvi);
            sleep(100);

            rLaunchMis.Order   := CORD_ID_launch_hybrid;
            rLaunchMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
            rLaunchMis.MissileID        := HybridMissile.InstanceIndex;
            rLaunchMis.MissileName      := HybridMissile.InstanceName;
            // other set default
            rLaunchMis.TargetPlatformID := 0;
            rLaunchMis.ProjectileInstanceIndex := 0;
            rLaunchMis.FiringMode       := 0;
//            rLaunchMis.SalvoSize  = StrToInt(edtHybridMissileControlSalvoSize.Text);

            simMgrClient.netSend_CmdLaunch_Missile(rLaunchMis);

            // tombol launch didisable, enable waktu setelah terima launch dari server
            TButton(Sender).Enabled := False;
          end;
        end;
      end;
    end;
  end;

end;

procedure TfmWeapon.OnMenuEngageClick(Sender: TObject);
var
  r : TRecEngagementModeWeapon;
begin
  if (Assigned(FControlled)) and (FControlled is TT3PlatformInstance) then
  begin
    if Assigned(focused_weapon) and (focused_weapon is TT3MissilesOnVehicle) then
    begin
      with TT3MissilesOnVehicle(focused_weapon) do
      begin
        r.MissileID := InstanceIndex;

        case TMenuItem(Sender).Tag of
          1 : begin
                r.EngagementMode := Byte(meRipple);
                //Engagement := meRipple;
              end;
          2 : begin
                r.EngagementMode := Byte(meSTOT);
                //Engagement := meSTOT;
              end;
          3 : begin
                r.EngagementMode := Byte(meDTOT);
                //Engagement := meDTOT;
              end;
        end;
      end;

      r.PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
      simMgrClient.netSend_CmdMissileEngageProperties(r);
    end;
  end;
end;

procedure TfmWeapon.OnMenuFiringClick(Sender: TObject);
var
  r : TRecFiringModeWeapon;
begin
  if (Assigned(FControlled)) and (FControlled is TT3PlatformInstance) then
  begin
    if Assigned(focused_weapon) and (focused_weapon is TT3MissilesOnVehicle) then
    begin
      with TT3MissilesOnVehicle(focused_weapon) do
      begin
        r.MissileID := InstanceIndex;

        case TMenuItem(Sender).Tag of
          1 : begin
                r.FiringMode := byte(mfmRBL);
                //FiringMode := mfmRBL;
                RBLW_PointList.Clear
              end;
          2 : begin
                r.FiringMode := byte(mfmRBLW);
                //FiringMode := mfmRBLW;
                RBLW_PointList.Clear;
              end;
          3 : begin
                r.FiringMode := byte(mfmBOL);
                //FiringMode := mfmBOL;
                RBLW_PointList.Clear
              end;
          4 : begin
                r.FiringMode := byte(mfmBOLW);
                //FiringMode := mfmBOLW;
                RBLW_PointList.Clear
              end;
        end;
      end;

      r.PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
      simMgrClient.netSend_CmdMissileProperties(r);
    end;
  end;
end;

procedure TfmWeapon.onRemoveDetectAirPlatform(pi: TT3PlatformInstance);
begin
  //
end;

procedure TfmWeapon.OnShowBlind(Sender: Tobject; Value: boolean);
begin
  FVisibleShowBlind := Value;
end;

procedure TfmWeapon.OnShowRange(Sender: Tobject; Value: boolean);
begin
  FVisibleShowBlind := Value;
end;

procedure TfmWeapon.onVectacPlan(wpn : TList);
var
  item : TMenuItem;
  i : Integer;
  weapon : TT3Weapon;
begin
  pmenuWeapon.Items.Clear;

  for i := 0 to wpn.Count - 1 do
  begin
    weapon := TT3Weapon(wpn.Items[i]);
    if not ((weapon is TT3TorpedoesOnVehicle) or (weapon is TT3BombONVehicle)) then
      Continue;

    if not IfExistItem(pmenuWpn, weapon.InstanceName) then
    begin
      item := TMenuItem.Create(Self);
      item.OnClick := onWeaponClick;
      item.Caption := weapon.InstanceName;
      pmenuWpn.Items.Add(item);
    end;
  end;
end;

procedure TfmWeapon.onWeaponCarrierClick(Sender: TObject);
var
  i : Integer;
  airPlatformName : string;
  ve : TT3Vehicle;
  aTrack: TT3DetectedTrack;
  obj : TObject;
begin
  airPlatformName := DeleteAmpersand(TMenuItem(Sender).Caption);

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
    begin
      ve := simMgrClient.SimPlatforms.getObject(i) as TT3Vehicle;

      if ve.Track_ID = airPlatformName then
      begin
        recVectac.cmd := CPID_CMD_VECTAC_WPN_CARRIER;
        recVectac.WpnCarrierID := ve.InstanceIndex;
        simMgrClient.netSend_Vectac(recVectac);

        Break;
      end;
    end;
  end
  else
  begin
    for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
    begin
      obj := simMgrClient.SimPlatforms.getObject(i);

      if obj is TT3Vehicle then
      begin
        ve := TT3Vehicle(obj);

        if ve.TrackNumber = StrToInt(airPlatformName) then
        begin
          recVectac.cmd := CPID_CMD_VECTAC_WPN_CARRIER;
          recVectac.WpnCarrierID := ve.InstanceIndex;
          simMgrClient.netSend_Vectac(recVectac);

          Break;
        end;
      end;
    end;

    for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
    begin
      obj := simMgrClient.SimDetectedTrackList.getObject(i);

      if obj is TT3DetectedTrack then
      begin
        aTrack := TT3DetectedTrack(obj);

        ve := TT3Vehicle(aTrack.TrackObject);

        if IntToStr(aTrack.TrackNumber) = airPlatformName then
        begin
          recVectac.cmd := CPID_CMD_VECTAC_WPN_CARRIER;
          recVectac.WpnCarrierID := ve.InstanceIndex;
          simMgrClient.netSend_Vectac(recVectac);

          Break;
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.onWeaponClick(Sender: TObject);
var
  airPlatformWpnName : string;
  owner, wpnCarrier : TT3Vehicle;
  vectac : TT3Vectac;
  wpn : TT3Weapon;
begin
  owner := TT3Vehicle(FControlled);
  vectac := owner.Weapons.Items[owner.LastWeaponsSelected];
  wpnCarrier := vectac.WeaponCarrier as TT3Vehicle;

  airPlatformWpnName := DeleteAmpersand(TMenuItem(Sender).Caption);

  wpn := wpnCarrier.getWeapon(airPlatformWpnName) as TT3Weapon;

  if Assigned(wpn) then
  begin
    recVectac.cmd := CPID_CMD_VECTAC_WEAPON;
    recVectac.Weapon := wpn.InstanceIndex;
    simMgrClient.netSend_Vectac(recVectac);
  end;
end;

procedure TfmWeapon.OnWeaponItemSelected(Sender: TObject);
var
  i : Integer;

  _weaponName : String;
  _weapon     : TT3Weapon;
  _vehicle    : TT3Vehicle;
  _initWeapon : TObject;

  _weaponCategory : TWeapoonCategory;

  // added by nando : observed by choco
  MissileOnVehicle: TT3MissilesOnVehicle;
  Missile: TT3missile;
  PlatInstan: TT3PlatformInstance;

  MissileIndex, MissileParentIndex,
  MissileVehicleIndex, MissileVehicleParentIndex,
  MissileLauncherIndex, MissileVehicleLauncherIndex: Integer;
begin
  strWeapon := TMenuItem(Sender).Caption;
  strWeapon := DeleteAmpersand(strWeapon);

  HideAllRangeWeapon(TT3PlatformInstance(FControlled));
  ShowRangeSelected(TT3PlatformInstance(FControlled));

  HideAllBlindWeapon(TT3PlatformInstance(FControlled));
  ShowBlindSelected(TT3PlatformInstance(FControlled));

  HideRangeSensor;
  HideBlindSensor;

  _weaponName := TMenuItem(Sender).Caption;
  _weaponName := DeleteAmpersand(_weaponName);
  edtWeaponName.Text := _weaponName;

  if FControlled is TT3Vehicle then
  begin
    _vehicle := TT3Vehicle(FControlled);

    rGun.ParentPlatformID := _vehicle.InstanceIndex;
    _weaponCategory :=  _vehicle.getWeaponType(_weaponName);
    _initWeapon := _vehicle.getWeapon(_weaponName);

    {$REGION ' Jk Weapon yg dipilih torpedo active pasive '}
    if _weaponCategory = wcTorpedoActivePassive then
    begin
      if (_vehicle.PlatformDomain = vhdAir) then
          _weaponCategory := wcTorpedoAirDropped
      else
      begin
        if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
          _weaponCategory := wcTorpedoActivePassive
        else
          _weaponCategory := wcTorpedoActiveAcoustic;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Jk Weapon yg dipilih vectac '}
    if _weaponCategory = wcVectac then
      onDetectAirPlatform(_vehicle);
    {$ENDREGION}

    {$REGION ' Menampilkan form weapon yg diselect '}
    DisplayTab(Byte(_weaponCategory));
    {$ENDREGION}

    {$REGION ' Load data form weapon yg diselect '}
    UpdateTab(_weaponCategory,_initWeapon);
    {$ENDREGION}

    {$REGION ' Menandai weapon yg dipilih sebelumnya '}
    //planed = false jika ganti senja
    if _vehicle.Weapons.Count > 0 then
    begin
      _weapon := _vehicle.Weapons.Items[_vehicle.LastWeaponsSelected];

      if _weapon is TT3MissilesOnVehicle then
      begin
        TT3MissilesOnVehicle(_weapon).Planned := False;
        btnSurfaceToSurfaceMissileWaypointsEdit.Enabled := False;
      end;
    end;

    for i := 0 to _vehicle.Weapons.Count - 1 do
    begin
      _weapon := TT3Weapon(_vehicle.Weapons.Items[i]);

      if _weapon.InstanceName = _weaponName then
      begin
        _vehicle.LastWeaponsSelected := i;
        Break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Missile Section '}
    for i := 0 to 7 do
    begin
      FRippleCountArray[i] := False;
    end;

    setThisLauncherState;

    // added by nando : observed by choco
    for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
    begin
      PlatInstan := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;

      if PlatInstan is TT3missile then
      begin
        Missile := TT3missile(PlatInstan);

        if (_initWeapon is TT3MissilesOnVehicle) then
        begin
          MissileOnVehicle := TT3MissilesOnVehicle(_initWeapon);

          MissileIndex := Missile.Definition.Missile_Index;
          MissileParentIndex := Missile.ShipIndex;
          MissileLauncherIndex := Missile.LauncherIndex;
          MissileVehicleIndex := MissileOnVehicle.MissileDefinition.FDef.Missile_Index;
          MissileVehicleParentIndex := TT3PlatformInstance(FControlled).InstanceIndex;
          MissileVehicleLauncherIndex := MissileOnVehicle.MissileDefinition.FData.Fitted_Weap_Index;

          if (MissileIndex = MissileVehicleIndex) and
            (MissileParentIndex = MissileVehicleParentIndex) and
            (MissileLauncherIndex = MissileVehicleLauncherIndex) then
          begin
            Missile.isShowMode := true;
          end
          else
            Missile.isShowMode := false;
        end;
      end;
    end;
    {$ENDREGION}
  end;
end;

{ TODO 1 : Cek baris berikut, OnChaffTypeItemSelected di komen dulu karena perubahan di frmweapon }
//procedure TfmWeapon.OnChaffTypeItemSelected(Sender: TObject);
//var
//  ChaffType : String;
//  i : Integer;
//  rLauncher     : TRecCmd_LaunchChaffState;
//  rLauncherProp : TRecCmd_ChaffLauncherProperties;
//  ecm     : TT3CounterMeasure;
//  device  : TT3DeviceUnit;
//  lc : TObject;
//  DblVal, DblVal1 : Double;
//begin
//  ChaffType := TMenuItem(Sender).Caption;
//  ChaffType := DeleteAmpersand(ChaffType);
//
//  Edit1.Text := ChaffType;
//
//    for i := 0 to TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Count - 1 do begin
//      device := TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Items[i];
//      if not (device is TT3CounterMeasure) then continue;
//      if device is TT3ChaffLauncher then continue;
//
//      ecm := TT3CounterMeasure(device);
//      if not (device is TT3ChaffOnVehicle) then continue;
//
//      if not (device is TT3ChaffOnVehicle) then continue;
//
//      if (TT3ChaffOnVehicle(device).InstanceName = ChaffType) then begin
//        Label107.Caption := IntToStr(TT3ChaffOnVehicle(device).Quantity);
//      end;
//    end;
//end;

procedure TfmWeapon.onDetectAirPlatform(pi: TT3PlatformInstance);
var
  item : TMenuItem;
  i : integer;
  pfObject: TSimObject;
  objTrack : TT3Unit;
  J: Integer;
  FoundWeapon : Boolean;
  weapon : TT3Weapon;
begin
  pmenuWpnCarrier.Items.Clear;

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
    begin
      pfObject := simMgrClient.SimPlatforms.getObject(i);
      if not (pfObject is TT3Vehicle) then
        continue;

      if TT3Vehicle(pfObject).Force_Designation <> pi.Force_Designation then
        continue;

      if (TT3Vehicle(pfObject).PlatformDomain = vhdAir) then
      begin
        FoundWeapon := False;

        for J := 0 to TT3Vehicle(pfObject).Weapons.Count - 1 do
        begin
          weapon := TT3Weapon(TT3Vehicle(pfObject).Weapons.Items[J]);

          if ((weapon is TT3TorpedoesOnVehicle) or
              (weapon is TT3BombONVehicle)) then
          begin
            FoundWeapon := True;
            Break;
          end;
        end;

        if FoundWeapon then
        begin
          if not IfExistItem(pmenuWpnCarrier, TT3Vehicle(pfObject).Track_ID) then
          begin
            item := TMenuItem.Create(Self);
            item.OnClick := onWeaponCarrierClick;
            item.Caption := TT3Vehicle(pfObject).Track_ID;
            pmenuWpnCarrier.Items.Add(item);
          end;
        end;
      end;
    end;
  end
  else
  begin
    for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
    begin
      pfObject := simMgrClient.SimPlatforms.getObject(i);
      if not (pfObject is TT3Vehicle) then
        continue;

      if TT3Vehicle(pfObject).Force_Designation <> pi.Force_Designation then
        continue;

      if not simMgrClient.FMyCubGroup.IsGroupMember(TT3Vehicle(pfObject).InstanceIndex) then
        Continue;

      if (TT3Vehicle(pfObject).PlatformDomain = vhdAir) then
      begin
        if not IfExistItem(pmenuWpnCarrier, IntToStr(TT3Vehicle(pfObject).TrackNumber)) then
        begin
          item := TMenuItem.Create(Self);
          item.OnClick := onWeaponCarrierClick;
          item.Caption := IntToStr(TT3Vehicle(pfObject).TrackNumber);
          pmenuWpnCarrier.Items.Add(item);
        end;
      end;
    end;

    for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
    begin
      pfObject := simMgrClient.SimDetectedTrackList.getObject(i);
      objTrack := TT3DetectedTrack(pfObject).TrackObject;

      if not (objTrack is TT3Vehicle) then
        continue;

      if TT3Vehicle(objTrack).Force_Designation <> pi.Force_Designation then
        continue;

      if (TT3Vehicle(objTrack).PlatformDomain = vhdAir) then
      begin
        if not IfExistItem(pmenuWpnCarrier, IntToStr(TT3DetectedTrack(pfObject).TrackNumber)) then
        begin
          item := TMenuItem.Create(Self);
          item.OnClick := onWeaponCarrierClick;
          item.Caption := IntToStr(TT3DetectedTrack(pfObject).TrackNumber);
          pmenuWpnCarrier.Items.Add(item);
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.OnWeaponPropertyChange(Sender: TObject);
var
  wc : TWeapoonCategory;
begin
  if not (focused_weapon =  Sender) then exit;

  wc := TT3Weapon(Sender).WeaponCategory;
  UpdateTab(wc,Sender);
  setThisLauncherState;
end;

procedure TfmWeapon.pnlLaunch1Click(Sender: TObject);
var
  i: Integer;
  isFound : Boolean;
  mov : TT3MissilesOnVehicle;
begin
  if not simMgrClient.IsGameStart then
  begin
    frmTacticalDisplay.addStatus('Game Frozen');
    Exit;
  end;

  inherited;

  mov := TT3MissilesOnVehicle(focused_weapon);

  if Assigned(focused_platform) and
    (TT3PlatformInstance(focused_platform).PlatformDomain <> 0) and
    IsTrack and not mov.Planned then
  begin
    case mov.FiringMode of
      mfmRBl,mfmBOL:
      begin
        setThisLauncherState;

        for i := 0 to 7 do
          FRippleCountArray[i] := False;
      end;
    end;

    ClickThisLauncher(TPanel(Sender).Tag);

    if TT3PlatformInstance(FControlled) is TT3Vehicle then
    begin
      for i := 0 to 7 do
      begin
        TT3Vehicle(FControlled).launcherOn[i] := False;
      end;

      for i := 0 to 7 do
      begin
        if FRippleCountArray[i] then
        begin
          TT3Vehicle(FControlled).launcherOn[i] := True;
        end;
      end;
    end;

    isFound := False;

    for i := 0 to 7 do
    begin
      if FRippleCountArray[i] then
      begin
        isFound := True;
        Break;
      end;
    end;

    if isFound then
    begin
      if mov.FiringMode <> mfmRBLW then
        btnSurfaceToSurfacePlan.Enabled := True
      else
      begin
        btnSurfaceToSurfacePlan.Enabled := True;
      end;
    end
    else
    begin
      btnSurfaceToSurfacePlan.Enabled := False;
      btnSurfaceToSurfaceCancel.Enabled := False;
      btnSurfaceToSurfaceLaunch.Enabled := False;
      mov.Planned := False;
    end;
  end;
end;

procedure TfmWeapon.RefreshPlatformWeaponsTab(pi: TT3PlatformInstance);
var
  i : integer;

  _weaponName : string;
  _weapon     : TT3Weapon;
  _vehicle    : TT3Vehicle;
  _initWeapon : TObject;

  _weaponCategory : TWeapoonCategory;

  _item    : TMenuItem;

  // added by nando : observed by choco
  MissileOnVehicle: TT3MissilesOnVehicle;
  Missile: TT3missile;
  PlatInstan: TT3PlatformInstance;

  MissileIndex, MissileParentIndex,
  MissileVehicleIndex, MissileVehicleParentIndex,
  MissileLauncherIndex, MissileVehicleLauncherIndex : Integer;
begin

  if pi is TT3Vehicle then
  begin
    _vehicle := TT3Vehicle(pi);

    {$REGION ' Reset panel '}
    pmenuWeapon.Items.Clear;
    PanelTacticalWeapons.Visible:= _vehicle.Weapons.Count > 0;
    btnWeapon.Enabled  := _vehicle.Weapons.Count > 0;
    if not(_vehicle.Weapons.Count > 0) then
    begin
      edtWeaponName.Text := '';
      Exit;
    end;
    {$ENDREGION}

    _weapon := TT3Weapon(_vehicle.Weapons.Items[_vehicle.LastWeaponsSelected]);
    edtWeaponName.Text := _weapon.InstanceName;

    _weaponCategory := _vehicle.getWeaponType(_weapon.InstanceName);
    _initWeapon := _vehicle.getWeapon(_weapon.InstanceName);

    {$REGION ' Jk Weapon yg dipilih torpedo active pasive '}
    if _weaponCategory = wcTorpedoActivePassive then
    begin
      if (_vehicle.PlatformDomain = vhdAir) then
          _weaponCategory := wcTorpedoAirDropped
      else
      begin
        if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
          _weaponCategory := wcTorpedoActivePassive
        else
          _weaponCategory := wcTorpedoActiveAcoustic;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Jk Weapon yg dipilih vectac '}
    if _weaponCategory = wcVectac then
      onDetectAirPlatform(_vehicle);
    {$ENDREGION}

    {$REGION ' Menampilkan form weapon yg diselect '}
    DisplayTab(Byte(_weaponCategory));
    {$ENDREGION}

    {$REGION ' Load data form weapon yg diselect '}
    UpdateTab(_weaponCategory,_initWeapon);
    {$ENDREGION}

    {$REGION ' Missile Section '}
    // added by nando : observed by choco
    for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
    begin
      PlatInstan := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;

      if PlatInstan is TT3missile then
      begin
        Missile := TT3missile(PlatInstan);

        if (_initWeapon is TT3MissilesOnVehicle) then
        begin
          MissileOnVehicle := TT3MissilesOnVehicle(_initWeapon);

          MissileIndex := Missile.Definition.Missile_Index;
          MissileParentIndex := Missile.ShipIndex;
          MissileVehicleIndex := MissileOnVehicle.MissileDefinition.FDef.Missile_Index;
          MissileVehicleParentIndex := TT3PlatformInstance(FControlled).InstanceIndex;
          MissileLauncherIndex := Missile.LauncherIndex;
          MissileVehicleLauncherIndex := MissileOnVehicle.MissileDefinition.FData.Fitted_Weap_Index;;

          if (MissileIndex = MissileVehicleIndex) and
            (MissileParentIndex = MissileVehicleParentIndex) and
            (MissileLauncherIndex = MissileVehicleLauncherIndex) then
          begin
            Missile.isShowMode := true;
          end
          else
            Missile.isShowMode := false;
        end;
      end;
    end;
    {$ENDREGION}

    for I := 0 to _vehicle.Weapons.Count - 1 do
    begin
      _weapon := TT3Weapon(_vehicle.Weapons.Items[i]);
      _weaponName := _weapon.InstanceName;

      if _weaponName = '' then
      begin
        edtWeaponName.Text := _weapon.ClassName;
      end;

      if not IfExistItem(pmenuWeapon, _weaponName) then
      begin
        _item := TMenuItem.Create(self);
        _item.OnClick := OnWeaponItemSelected;
        _item.Caption := _weaponName;
        _item.Tag     := Byte(_weapon.WeaponCategory);
        pmenuWeapon.Items.Add(_item);
      end;
    end;
  end;
end;

//procedure TfmWeapon.SetChaffType(Sender: TT3PlatformInstance; Wp : TT3Weapon);
//var
//  i       : integer;
//  ecm     : TT3CounterMeasure;
//  device  : TT3DeviceUnit;
//begin
//  for i := 0 to TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Count - 1 do
//  begin
//    device := TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Items[i];
//    if not (device is TT3CounterMeasure) then continue;
//    if device is TT3ChaffLauncher then continue;
//
//    ecm := TT3CounterMeasure(device);
//    if not (ecm is TT3ChaffOnVehicle) then continue;
//
//    FChaffType := TT3ChaffOnVehicle(device).InstanceName;
//  end;
//end;

procedure TfmWeapon.HideRangeWeapon;
var
  i,j : Integer;

  AllVehicle : TT3PlatformInstance;
  VehicleWeapon : TT3Weapon;
begin
  FVehiclePlatform := simMgrClient.SimPlatforms;

  if not Assigned(FVehiclePlatform) then Exit;

  for i := 0 to FVehiclePlatform.itemCount - 1 do
  begin
    AllVehicle := TT3PlatformInstance(FVehiclePlatform.getObject(i));

    if AllVehicle is TT3Vehicle then
    begin
      for j := 0 to (AllVehicle as TT3Vehicle).Weapons.Count -1 do
      begin
        VehicleWeapon := (AllVehicle as TT3Vehicle).Weapons.Items[j];
        if VehicleWeapon is TT3Weapon then
        begin
          (VehicleWeapon as TT3Weapon).ShowRangeSelected := False;
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.HideBlindWeapon;
var
  i,j : Integer;

  AllVehicle : TT3PlatformInstance;
  VehicleWeapon : TT3Weapon;
begin
  FVehiclePlatform := simMgrClient.SimPlatforms;

  if not Assigned(FVehiclePlatform) then Exit;

  for i := 0 to FVehiclePlatform.itemCount - 1 do
  begin
    AllVehicle := TT3PlatformInstance(FVehiclePlatform.getObject(i));

    if AllVehicle is TT3Vehicle then
    begin
      for j := 0 to (AllVehicle as TT3Vehicle).Weapons.Count -1 do
      begin
        VehicleWeapon := (AllVehicle as TT3Vehicle).Weapons.Items[j];
        if VehicleWeapon is TT3Weapon then
        begin
          (VehicleWeapon as TT3Weapon).ShowBlindSelected := False;
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.HideButtonWeaponWaypoint;
begin
  label416.Visible := False;
  editSurfaceToSurfaceMissileEngangement.Visible := False;
  btnSurfaceToSurfaceMissileEngagement.Visible := False;
  Bevel16.Visible := False;

  Label54.Visible := False;
  btnSurfaceToSurfaceMissileWaypointsEdit.Visible := False;
  btnSurfaceToSurfaceMissileWaypointsAdd.Visible := False;
  btnSurfaceToSurfaceMissileWaypointsDelete.Visible := False;
  btnSurfaceToSurfaceMissileWaypointsApply.Visible := False;
  btnSurfaceToSurfaceMissileWaypointsCancel.Visible := False;
end;

procedure TfmWeapon.SetButtonWeaponWaypoint;
begin
  label416.Visible := True;
  editSurfaceToSurfaceMissileEngangement.Visible := True;
  btnSurfaceToSurfaceMissileEngagement.Visible := True;
  Bevel16.Visible := True;

  Label54.Visible := True;
  btnSurfaceToSurfaceMissileWaypointsEdit.Visible := True;
  btnSurfaceToSurfaceMissileWaypointsAdd.Visible := True;
  btnSurfaceToSurfaceMissileWaypointsDelete.Visible := True;
  btnSurfaceToSurfaceMissileWaypointsApply.Visible := True;
  btnSurfaceToSurfaceMissileWaypointsCancel.Visible := True;
end;

procedure TfmWeapon.SetButtonWeaponWaypointBOLW;
begin
  label416.Visible := False;                                    ;
  editSurfaceToSurfaceMissileEngangement.Visible := False;
  btnSurfaceToSurfaceMissileEngagement.Visible := False;
  Bevel16.Visible := True;

  Label54.Visible := True;
  btnSurfaceToSurfaceMissileWaypointsEdit.Visible := True;
  btnSurfaceToSurfaceMissileWaypointsAdd.Visible := True;
  btnSurfaceToSurfaceMissileWaypointsDelete.Visible := True;
  btnSurfaceToSurfaceMissileWaypointsApply.Visible := True;
  btnSurfaceToSurfaceMissileWaypointsCancel.Visible := True;
end;

procedure TfmWeapon.SetRangeWeapon;
var
  obj : TSimObject;
  LastWeapon, VehicleWeapon : TT3Weapon;
  i : Integer;
  ve : TT3Vehicle;
begin
  if TT3PlatformInstance(FControlled) is TT3Vehicle then
  begin
    ve := TT3Vehicle(TT3PlatformInstance(FControlled));

    if ve.Weapons.Count > 0 then
    begin
      LastWeapon := TT3Weapon(ve.Weapons.Items[ve.LastWeaponsSelected]);

      for i := 0 to ve.Weapons.Count - 1 do
      begin
        obj := ve.Weapons.Items[i];

        if obj is TT3Weapon then
        begin
          VehicleWeapon := TT3Weapon(obj);

          if (LastWeapon.InstanceIndex = VehicleWeapon.InstanceIndex)
            and (VehicleWeapon as TT3Weapon).ShowRange then
          begin
            (VehicleWeapon as TT3Weapon).ShowRangeSelected := True;
            Break;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.setThisLauncherState;
var
  i : Integer;
  launcher : TFitted_Weap_Launcher_On_Board;
begin
  if focused_weapon is TT3MissilesOnVehicle then
  begin
    for i := 0 to TT3MissilesOnVehicle(focused_weapon).MissileDefinition.FLaunchs.Count - 1 do
    begin
      launcher := TT3MissilesOnVehicle(focused_weapon).MissileDefinition.FLaunchs.Items[i];
      if launcher.FData.Launcher_Qty > 0 then
      begin
        case launcher.FData.Launcher_Type of
          1:
          begin
            vbl1.EnableBlinking := False;
            vbl1.Palette1.Low   := clLime;
            vbl1.Palette1.High  := clLime;
            pnlLaunch1.Hint     := 'Qty : ' +IntToStr(launcher.FData.Launcher_Qty)
                                   +Chr(13) + 'Angle : '
                                   +IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch1.Enabled  := True;
          end;
          2:
          begin
            vbl2.EnableBlinking := False;
            vbl2.Palette1.Low   := clLime;
            vbl2.Palette1.High  := clLime;
            pnlLaunch2.Hint     := 'Qty : ' +IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' +IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch2.Enabled  := True;
          end;
          3:
          begin
            vbl3.EnableBlinking := False;
            vbl3.Palette1.Low   := clLime;
            vbl3.Palette1.High  := clLime;
            pnlLaunch3.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch3.Enabled  := True;
          end;
          4:
          begin
            vbl4.EnableBlinking := False;
            vbl4.Palette1.Low   := clLime;
            vbl4.Palette1.High  := clLime;
            pnlLaunch4.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch4.Enabled  := True;
          end;
          5:
          begin
            vbl5.EnableBlinking := False;
            vbl5.Palette1.Low   := clLime;
            vbl5.Palette1.High  := clLime;
            pnlLaunch5.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch5.Enabled  := True;
          end;
          6:
          begin
            vbl6.EnableBlinking := False;
            vbl6.Palette1.Low   := clLime;
            vbl6.Palette1.High  := clLime;
            pnlLaunch6.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch6.Enabled  := True;
          end;
          7:
          begin
            vbl7.EnableBlinking := False;
            vbl7.Palette1.Low   := clLime;
            vbl7.Palette1.High  := clLime;
            pnlLaunch7.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch7.Enabled  := True;
          end;
          8:
          begin
            vbl8.EnableBlinking := False;
            vbl8.Palette1.Low   := clLime;
            vbl8.Palette1.High  := clLime;
            pnlLaunch8.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch8.Enabled  := True;
          end;
          9 :
          begin
            vbl1.EnableBlinking := False;
            vbl1.Palette1.Low   := clLime;
            vbl1.Palette1.High  := clLime;
            pnlLaunch1.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch1.Enabled  := True;
          end;
          10:
          begin
            vbl2.EnableBlinking := False;
            vbl2.Palette1.Low   := clLime;
            vbl2.Palette1.High  := clLime;
            pnlLaunch2.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch2.Enabled  := True;
          end;
          11:
          begin
            vbl3.EnableBlinking := False;
            vbl3.Palette1.Low   := clLime;
            vbl3.Palette1.High  := clLime;
            pnlLaunch3.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch3.Enabled  := True;
          end;
          12:
          begin
            vbl4.EnableBlinking := False;
            vbl4.Palette1.Low   := clLime;
            vbl4.Palette1.High  := clLime;
            pnlLaunch4.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch4.Enabled  := True;
          end;
          13:
          begin
            vbl5.EnableBlinking := False;
            vbl5.Palette1.Low   := clLime;
            vbl5.Palette1.High  := clLime;
            pnlLaunch5.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch5.Enabled  := True;
          end;
          14:
          begin
            vbl6.EnableBlinking := False;
            vbl6.Palette1.Low   := clLime;
            vbl6.Palette1.High  := clLime;
            pnlLaunch6.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch6.Enabled  := True;
          end;
          15:
          begin
            vbl7.EnableBlinking := False;
            vbl7.Palette1.Low   := clLime;
            vbl7.Palette1.High  := clLime;
            pnlLaunch7.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch7.Enabled  := True;
          end;
          16:
          begin
            vbl8.EnableBlinking := False;
            vbl8.Palette1.Low   := clLime;
            vbl8.Palette1.High  := clLime;
            pnlLaunch8.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch8.Enabled  := True;
          end;
        end;
      end
      else
      begin
        case launcher.FData.Launcher_Type of
          1:
          begin
            vbl1.EnableBlinking := False;
            vbl1.Palette1.Low   := clGray;
            vbl1.Palette1.High  := clGray;
            pnlLaunch1.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch1.Enabled  := False;
          end;
          2:
          begin
            vbl2.EnableBlinking := False;
            vbl2.Palette1.Low   := clGray;
            vbl2.Palette1.High  := clGray;
            pnlLaunch2.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch2.Enabled  := False;
          end;
          3:
          begin
            vbl3.EnableBlinking := False;
            vbl3.Palette1.Low   := clGray;
            vbl3.Palette1.High  := clGray;
            pnlLaunch3.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch3.Enabled  := False;
          end;
          4:
          begin
            vbl4.EnableBlinking := False;
            vbl4.Palette1.Low   := clGray;
            vbl4.Palette1.High  := clGray;
            pnlLaunch4.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch4.Enabled  := False;
          end;
          5:
          begin
            vbl5.EnableBlinking := False;
            vbl5.Palette1.Low   := clGray;
            vbl5.Palette1.High  := clGray;
            pnlLaunch5.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch5.Enabled  := False;
          end;
          6:
          begin
            vbl6.EnableBlinking := False;
            vbl6.Palette1.Low   := clGray;
            vbl6.Palette1.High  := clGray;
            pnlLaunch6.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch6.Enabled  := False;
          end;
          7:
          begin
            vbl7.EnableBlinking := False;
            vbl7.Palette1.Low   := clGray;
            vbl7.Palette1.High  := clGray;
            pnlLaunch7.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch7.Enabled  := False;
          end;
          8:
          begin
            vbl8.EnableBlinking := False;
            vbl8.Palette1.Low   := clGray;
            vbl8.Palette1.High  := clGray;
            pnlLaunch8.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch8.Enabled  := False;
          end;
          9 :
          begin
            vbl1.EnableBlinking := False;
            vbl1.Palette1.Low   := clGray;
            vbl1.Palette1.High  := clGray;
            pnlLaunch1.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch1.Enabled  := False;
          end;
          10:
          begin
            vbl2.EnableBlinking := False;
            vbl2.Palette1.Low   := clGray;
            vbl2.Palette1.High  := clGray;
            pnlLaunch2.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch2.Enabled  := False;
          end;
          11:
          begin
            vbl3.EnableBlinking := False;
            vbl3.Palette1.Low   := clGray;
            vbl3.Palette1.High  := clGray;
            pnlLaunch3.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch3.Enabled  := False;
          end;
          12:
          begin
            vbl4.EnableBlinking := False;
            vbl4.Palette1.Low   := clGray;
            vbl4.Palette1.High  := clGray;
            pnlLaunch4.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch4.Enabled  := False;
          end;
          13:
          begin
            vbl5.EnableBlinking := False;
            vbl5.Palette1.Low   := clGray;
            vbl5.Palette1.High  := clGray;
            pnlLaunch5.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch5.Enabled  := False;
          end;
          14:
          begin
            vbl6.EnableBlinking := False;
            vbl6.Palette1.Low   := clGray;
            vbl6.Palette1.High  := clGray;
            pnlLaunch6.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch6.Enabled  := False;
          end;
          15:
          begin
            vbl7.EnableBlinking := False;
            vbl7.Palette1.Low   := clGray;
            vbl7.Palette1.High  := clGray;
            pnlLaunch7.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch7.Enabled  := False;
          end;
          16:
          begin
            vbl8.EnableBlinking := False;
            vbl8.Palette1.Low   := clGray;
            vbl8.Palette1.High  := clGray;
            pnlLaunch8.Hint     := 'Qty : ' + IntToStr(launcher.FData.Launcher_Qty)
                                   + Chr(13) + 'Angle : ' + IntToStr(launcher.FData.Launcher_Angle);
            pnlLaunch8.Enabled  := False;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.ScrollBox6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  case Button of
    mbLeft: begin
        if (ssShift in Shift) then begin
          btn1.Visible := not btn1.Visible ;
        end;
      end;
  end;
end;

function TfmWeapon.SelectController(
  weaponCat: TWeapoonCategory): TfrmWeaponCtrl;
var
  I: Integer;
  wpnCtrl :TfrmWeaponCtrl;
begin
  result := nil;

  if not Assigned(WpnIntCont) then
    exit;

  // dikosongkan dulu controller yang lama
  if Assigned(WpnController) then
  begin
    WpnController.Weapon := nil;
    WpnController.PlatformCtrld := nil;
  end;

  // klo categoriny sama dengan yg lama, ga perlu nyari di list lagi
  if Assigned(WpnController) and (WpnController.WeaponCategory = weaponCat) then
  begin
    result := WpnController;
    exit;
  end;

  // assign ke controller baru
  for I := 0 to WpnIntCont.Count - 1 do
  begin
    wpnCtrl := TfrmWeaponCtrl(WpnIntCont.Items[i]);
    if (wpnCtrl.WeaponCategory = weaponCat) then begin
      result := wpnCtrl;
      break;
    end;
  end;
end;

procedure TfmWeapon.SetBlindWeapon;
var
  obj : TSimObject;
  LastWeapon, VehicleWeapon : TT3Weapon;
  i : Integer;
  ve : TT3Vehicle;
begin
  if TT3PlatformInstance(FControlled) is TT3Vehicle then
  begin
    ve := TT3Vehicle(TT3PlatformInstance(FControlled));

    if ve.Weapons.Count > 0 then
    begin
      LastWeapon := TT3Weapon(ve.Weapons.Items[ve.LastWeaponsSelected]);

      for i := 0 to ve.Weapons.Count - 1 do
      begin
        obj := ve.Weapons.Items[i];

        if obj is TT3Weapon then
        begin
          VehicleWeapon := TT3Weapon(obj);

          if (LastWeapon.InstanceIndex = VehicleWeapon.InstanceIndex)
            and (VehicleWeapon as TT3Weapon).ShowBlind then
          begin
            (VehicleWeapon as TT3Weapon).ShowBlindSelected := True;
            Break;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.HideRangeSensor;
var
  i : Integer;
  VehicleSensor : TT3DeviceUnit;
begin
  for i := 0 to (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Count - 1 do
  begin
    VehicleSensor := (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Items[i];
    if VehicleSensor is TT3Sensor then
    begin
      if (VehicleSensor as TT3Sensor).ShowRange then
      begin
        (VehicleSensor as TT3Sensor).ShowRangeSelected := False;
        //(VehicleSensor as TT3Sensor).ShowRange         := False;
      end;
    end;
  end;
end;

procedure TfmWeapon.HideBlindSensor;
var
  i : Integer;
  VehicleSensor : TT3DeviceUnit;
begin
  for i := 0 to (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Count - 1 do
  begin
    VehicleSensor := (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Items[i];
    if VehicleSensor is TT3Sensor then
    begin
      if (VehicleSensor as TT3Sensor).ShowBlindZone then
      begin
        (VehicleSensor as TT3Sensor).ShowBlindSelected := False;
        //(VehicleSensor as TT3Sensor).ShowRange         := False;
      end;
    end;
  end;
end;

function TfmWeapon.CheckRadar: Boolean;
var
  i : Integer;
  VehicleSensor : TT3DeviceUnit;
begin
  Result := False;

  for i := 0 to (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Count - 1 do
  begin
    VehicleSensor := (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Items[i];

    if VehicleSensor is TT3Sensor then
    begin
      if (VehicleSensor as TT3Sensor).ShowRange then
      begin
        Result := True;
        Break;
      end;
    end;
  end;
end;

procedure TfmWeapon.setOffLaunchers;
var
  i : Integer;
begin
  vbl1.EnableBlinking := false;
  vbl1.Palette1.Low   := clLime;
  vbl1.Palette1.High  := clLime;

  vbl2.EnableBlinking := false;
  vbl2.Palette1.Low   := clLime;
  vbl2.Palette1.High  := clLime;

  vbl3.EnableBlinking := false;
  vbl3.Palette1.Low   := clLime;
  vbl3.Palette1.High  := clLime;

  vbl4.EnableBlinking := false;
  vbl4.Palette1.Low   := clLime;
  vbl4.Palette1.High  := clLime;

  vbl5.EnableBlinking := false;
  vbl5.Palette1.Low   := clLime;
  vbl5.Palette1.High  := clLime;

  vbl6.EnableBlinking := false;
  vbl6.Palette1.Low   := clLime;
  vbl6.Palette1.High  := clLime;

  vbl7.EnableBlinking := false;
  vbl7.Palette1.Low   := clLime;
  vbl7.Palette1.High  := clLime;

  vbl8.EnableBlinking := false;
  vbl8.Palette1.Low   := clLime;
  vbl8.Palette1.High  := clLime;

  for i := 0 to 7 do
  begin
    FRippleCountArray[i] := False;
  end;

  if TT3PlatformInstance(FControlled) is TT3Vehicle then
  begin
    for i := 0 to 7 do
    begin
      TT3Vehicle(FControlled).launcherOn[i] := False;
    end;
  end;

  UpdateMissileSurfaceToSurfaceTab(focused_weapon);
end;

procedure TfmWeapon.ClearFlagPoint;
begin
  simMgrClient.DrawFlagPoint.Clear;
end;

procedure TfmWeapon.ClickThisLauncher(id : integer);
var
  i : Integer;
  LauncherAngle : Integer;
  launcher : TFitted_Weap_Launcher_On_Board;
begin
  LauncherAngle := 0;

  for I := 0 to TT3MissilesOnVehicle(focused_weapon).MissileDefinition.FLaunchs.Count - 1 do
  begin
    launcher := TT3MissilesOnVehicle(focused_weapon).MissileDefinition.FLaunchs.Items[i];
    if launcher.FData.Launcher_Type > 8 then
    begin
      if id = (launcher.FData.Launcher_Type - 8) then
      begin
        LauncherAngle := launcher.FData.Launcher_Angle;
        Break;
      end;
    end
    else
    begin
      if id = launcher.FData.Launcher_Type then
      begin
        LauncherAngle := launcher.FData.Launcher_Angle;
        Break;
      end;
    end;
  end;

//  setThisLauncherState;

  case id of
    1 :
    begin
      if vbl1.EnableBlinking = True then
        vbl1.EnableBlinking := False
      else
        vbl1.EnableBlinking := True;

      if vbl1.EnableBlinking then
        begin
          vbl1.Palette1.Low   := clLime;
          vbl1.Palette1.High  := clRed;

          FRippleCountArray[0] := True;
          FRippleDegreeLauncer[0]  := LauncherAngle;
        end
      else
      begin
        vbl1.Palette1.Low   := clLime;
        vbl1.Palette1.High  := clLime;

        FRippleCountArray[0] := False;
        FRippleDegreeLauncer[0]  := LauncherAngle;
      end;
    end;
    2 :
    begin
      if vbl2.EnableBlinking = True then
        vbl2.EnableBlinking := False
      else
        vbl2.EnableBlinking := True;

      if vbl2.EnableBlinking then
        begin
          vbl2.Palette1.Low   := clLime;
          vbl2.Palette1.High  := clRed;

          FRippleCountArray[1] := True;
          FRippleDegreeLauncer[1]  := LauncherAngle;
        end
      else
      begin
        vbl2.Palette1.Low   := clLime;
        vbl2.Palette1.High  := clLime;

        FRippleCountArray[1] := False;
        FRippleDegreeLauncer[1]  := LauncherAngle;
      end;
    end;
    3 :
    begin
      if vbl3.EnableBlinking = True then
        vbl3.EnableBlinking := False
      else
        vbl3.EnableBlinking := True;

      if vbl3.EnableBlinking then
        begin
          vbl3.Palette1.Low   := clLime;
          vbl3.Palette1.High  := clRed;

          FRippleCountArray[2] := True;
          FRippleDegreeLauncer[2]  := LauncherAngle;
        end
      else
      begin
        vbl3.Palette1.Low   := clLime;
        vbl3.Palette1.High  := clLime;

        FRippleCountArray[2] := False;
        FRippleDegreeLauncer[2]  := LauncherAngle;
      end;
    end;
    4 :
    begin
      if vbl4.EnableBlinking = True then
        vbl4.EnableBlinking := False
      else
        vbl4.EnableBlinking := True;

      if vbl4.EnableBlinking then
        begin
          vbl4.Palette1.Low   := clLime;
          vbl4.Palette1.High  := clRed;

          FRippleCountArray[3] := True;
          FRippleDegreeLauncer[3]  := LauncherAngle;
        end
      else
      begin
        vbl4.Palette1.Low   := clLime;
        vbl4.Palette1.High  := clLime;

        FRippleCountArray[3] := False;
        FRippleDegreeLauncer[3]  := LauncherAngle;
      end;
    end;
    5 :
    begin
      if vbl5.EnableBlinking = True then
        vbl5.EnableBlinking := False
      else
        vbl5.EnableBlinking := True;

      if vbl5.EnableBlinking then
        begin
          vbl5.Palette1.Low   := clLime;
          vbl5.Palette1.High  := clRed;

          FRippleCountArray[4] := True;
          FRippleDegreeLauncer[4]  := LauncherAngle;
        end
      else
      begin
        vbl5.Palette1.Low   := clLime;
        vbl5.Palette1.High  := clLime;

        FRippleCountArray[4] := False;
        FRippleDegreeLauncer[4]  := LauncherAngle;
      end;
    end;
    6 :
    begin
      if vbl6.EnableBlinking = True then
        vbl6.EnableBlinking := False
      else
        vbl6.EnableBlinking := True;

      if vbl6.EnableBlinking then
        begin
          vbl6.Palette1.Low   := clLime;
          vbl6.Palette1.High  := clRed;

          FRippleCountArray[5] := True;
          FRippleDegreeLauncer[5]  := LauncherAngle;
        end
      else
      begin
        vbl6.Palette1.Low   := clLime;
        vbl6.Palette1.High  := clLime;

        FRippleCountArray[5] := False;
        FRippleDegreeLauncer[5]  := LauncherAngle;
      end;
    end;
    7 :
    begin
      if vbl7.EnableBlinking = True then
        vbl7.EnableBlinking := False
      else
        vbl7.EnableBlinking := True;

      if vbl7.EnableBlinking then
        begin
          vbl7.Palette1.Low   := clLime;
          vbl7.Palette1.High  := clRed;

          FRippleCountArray[6] := True;
          FRippleDegreeLauncer[6]  := LauncherAngle;
        end
      else
      begin
        vbl7.Palette1.Low   := clLime;
        vbl7.Palette1.High  := clLime;

        FRippleCountArray[6] := False;
        FRippleDegreeLauncer[6]  := LauncherAngle;
      end;
    end;
    8 :
    begin
      if vbl8.EnableBlinking = True then
        vbl8.EnableBlinking := False
      else
        vbl8.EnableBlinking := True;

      if vbl8.EnableBlinking then
        begin
          vbl8.Palette1.Low   := clLime;
          vbl8.Palette1.High  := clRed;

          FRippleCountArray[7] := True;
          FRippleDegreeLauncer[7]  := LauncherAngle;
        end
      else
      begin
        vbl8.Palette1.Low   := clLime;
        vbl8.Palette1.High  := clLime;

        FRippleCountArray[7] := False;
        FRippleDegreeLauncer[7]  := LauncherAngle;
      end;
    end;
  end;

  FLauncherIDLastOn := id;
  rMis.LaunchAngle := LauncherAngle;
end;

procedure TfmWeapon.HideAllRangeWeapon(pi: TT3PlatformInstance);
var
  i : Integer;
  weapon : TT3Weapon;
  vehicle : TT3Vehicle;
begin
  if not (pi is TT3Vehicle) then exit;
    vehicle := TT3Vehicle(pi);

  if vehicle.Weapons.Count > 0 then
  begin
    for I := 0 to vehicle.Weapons.Count - 1 do
    begin
      weapon := TT3Weapon(vehicle.Weapons.Items[i]);
      //weapon.ShowRange := false;
      weapon.ShowRangeSelected := False;
    end;
  end;
end;

procedure TfmWeapon.HideAllBlindWeapon(pi: TT3PlatformInstance);
var
  i : Integer;
  weapon : TT3Weapon;
  vehicle : TT3Vehicle;
begin
  if not (pi is TT3Vehicle) then exit;
    vehicle := TT3Vehicle(pi);

  if vehicle.Weapons.Count > 0 then
  begin
    for I := 0 to vehicle.Weapons.Count - 1 do
    begin
      weapon := TT3Weapon(vehicle.Weapons.Items[i]);
      //weapon.ShowRange := false;
      weapon.ShowBlindSelected := False;
    end;
  end;
end;

procedure TfmWeapon.ShowRangeSelected(pi: TT3PlatformInstance);
var
//  itemMenu : TMenuItem;
  weapon : TT3Weapon;
  vehicle : TT3Vehicle;

  i : Integer;

  Focused_weapon  : TT3Weapon;
begin
  if not (pi is TT3Vehicle) then exit;
    vehicle := TT3Vehicle(pi);

  {itemMenu := pmenuWeapon.Items.Find(edtWeaponName.Text);
  i := pmenuWeapon.Items.IndexOf(itemMenu);
  }

  Focused_weapon := TT3Weapon(vehicle.getWeapon(strWeapon));

  for I := 0 to vehicle.Weapons.Count - 1 do
  begin
    weapon := TT3Weapon(vehicle.Weapons.Items[i]);

    if weapon = Focused_weapon then
    begin
      //weapon := TT3Weapon(vehicle.Weapons.Items[i]);
      if weapon.ShowRange then
      begin
        weapon.ShowRangeSelected := True;
      end;

      Break;
    end;
  end;
end;

procedure TfmWeapon.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  VSimMap.FMap.CurrentTool := mtDeployChaff;
end;

procedure TfmWeapon.ShowBlindSelected(pi: TT3PlatformInstance);
var
//  itemMenu : TMenuItem;
  weapon : TT3Weapon;
  vehicle : TT3Vehicle;

  i : Integer;

  Focused_weapon  : TT3Weapon;
begin
  if not (pi is TT3Vehicle) then exit;
    vehicle := TT3Vehicle(pi);

  {itemMenu := pmenuWeapon.Items.Find(edtWeaponName.Text);
  i := pmenuWeapon.Items.IndexOf(itemMenu);
  }

  Focused_weapon := TT3Weapon(vehicle.getWeapon(strWeapon));

  for I := 0 to vehicle.Weapons.Count - 1 do
  begin
    weapon := TT3Weapon(vehicle.Weapons.Items[i]);

    if weapon = Focused_weapon then
    begin
      //weapon := TT3Weapon(vehicle.Weapons.Items[i]);
      if weapon.ShowBlind then
      begin
        weapon.ShowBlindSelected := True;
      end;

      Break;
    end;
  end;
end;

procedure TfmWeapon.TimerRippleTimer(Sender: TObject);
var
  RecSend : TrecSinc_RBLW;
  i: Integer;
  launcherIndex : integer;
  missile : TT3MissilesOnVehicle;
begin
  inherited;

  missile := TT3MissilesOnVehicle(focused_weapon);

  launcherIndex := -1;
  for i := 0 to 7 do
  begin
    if FRippleCountArray[i] and (i > FlauncherID) then
    begin
       FlauncherID   := i + 1;
       launcherIndex := i + 1;
       Break;
    end;
  end;

  FRippleTimer := FRippleTimer + 1;
  if FRippleTimer <= FRippleCount then
  begin
    if TT3MissilesOnVehicle(focused_weapon).Quantity > 0  then
    begin
      //Sincron
      with RecSend do
      begin
        cmd := 5;
        PlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
        WeaponIndex := missile.InstanceIndex;
        WeaponName := missile.InstanceName;
        LauncherNumber := launcherIndex;
        LaunchDelay := 0;
      end;
      simMgrClient.netSend_CmdSyncRBLW(RecSend);
      Sleep(100);

      simMgrClient.netSend_CmdLaunch_Missile(rMis);

      frmTacticalDisplay.addStatus('Lauch Missile Number ' + IntToStr(FRippleTimer) + ' On Launcer '
                                              + IntToStr(launcherIndex));
    end
    else
    begin
      frmTacticalDisplay.addStatus('Missile Empty');
    end;
  end
  else
  begin
    setOffLaunchers;
    TimerRipple.Enabled := False;
  end;
end;

procedure TfmWeapon.TmrAPGTimer(Sender: TObject);
begin
  inherited;

  if flagAPG < SalvoAPGGlobal then
  begin
    SimMgrClient.netSend_CmdLaunch_Torpedo(rMis);
    Inc(flagAPG);
  end
  else
  begin
    TmrAPG.Enabled := False;
    SimMgrClient.netSend_CmdTorpedoSyncPanelWeapon(rPanel);
    SimMgrClient.netSend_CmdSetQuantity(rMis.ParentPlatformID, rMis.MissileID,
    CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (QuantityAPGGlobal - SalvoAPGGlobal));
  end;
end;

procedure TfmWeapon.TacticalMissileAimpointSet(const Mx, My: Double);
var
  missile : TT3MissilesOnVehicle;
//  vehicle : TT3Vehicle;
begin
  if focused_weapon = nil then Exit;
  if FControlled = nil then Exit;

//  vehicle := TT3Vehicle(FControlled);
  missile := TT3MissilesOnVehicle(focused_weapon);

  missile.Aimpoint_Movement.PositionX := Mx;
  missile.Aimpoint_Movement.PositionY := My;
end;

procedure TfmWeapon.TacticalMissileControlSet(const Value: Boolean);
begin
  label296.Visible := Value;
  label302.Visible := Value;
  label496.Visible := Value;
  label497.Visible := Value;
  label498.Visible := Value;
  label499.Visible := Value;
  bevel59.Visible  := Value;
  editTacticalMissileControlSalvo.Visible   := Value;
  editTacticalMissileControlCruise.Visible  := Value;
  editTacticalMissileControlSeeker.Visible  := Value;
  btnTacticalMissileControlCruise.Visible   := Value;
  btnTacticalMissileControlSeeker.Visible   := Value;
end;

procedure TfmWeapon.TacticalMissileSettarget(const Value: Boolean; Mode : integer);
var
  Missile : TT3MissilesOnVehicle;
begin
  if focused_weapon = nil then Exit;
  Missile := TT3MissilesOnVehicle(focused_weapon);

  case Mode of
    1 : begin
          rdoTacticalMissileTargetTrack.Enabled     := Value;
          rdoTacticalMissileTargetAimpoint.Enabled  := Value;
          rdoTacticalMissileTargetBearing.Enabled   := Value;

          editTacticalMissileTargetTrack.Enabled    := Value;
          editTacticalMissileTargetTrack.Color      := clBtnFace;
          editTacticalMissileTargetAimpoint.Enabled := Value;
          editTacticalMissileTargetAimpoint.Color   := clBtnFace;
          editTacticalMissileTargetBearing.Enabled  := Value;
          editTacticalMissileTargetBearing.Color    := clBtnFace;

          btnTacticalMissileTargetTrack.Enabled     := Value;
          btnTacticalMissileTargetAimpoint.Enabled  := Value;
          btnTacticalMissileTargetBearing.Enabled   := Value;
        end;
    2 : begin
          //Aimpoint Only Launch
          rdoTacticalMissileTargetAimpoint.Checked  := True;
          TacticalMissileWaypointSet(True);
          Missile.FiringMode := mfmAimpoint;

          rdoTacticalMissileTargetAimpoint.Enabled  := Value;
          editTacticalMissileTargetAimpoint.Enabled := Value;
          editTacticalMissileTargetAimpoint.Color   := clWindow;
          btnTacticalMissileTargetAimpoint.Enabled  := Value;
        end;
    3 : begin
          //Bearing Only Launch
          rdoTacticalMissileTargetBearing.Checked   := True;
          Missile.FiringMode := mfmBearing;

          rdoTacticalMissileTargetBearing.Enabled   := Value;
          editTacticalMissileTargetBearing.Enabled  := Value;
          editTacticalMissileTargetBearing.Color    := clWindow;
          btnTacticalMissileTargetBearing.Enabled   := Value;
        end;
    4 : begin
          //Aimpoint or Bearing Launch
          rdoTacticalMissileTargetAimpoint.Checked  := True;
          TacticalMissileWaypointSet(True);
          Missile.FiringMode := mfmAimpoint;

          rdoTacticalMissileTargetAimpoint.Enabled  := Value;
          editTacticalMissileTargetAimpoint.Enabled := Value;
          btnTacticalMissileTargetAimpoint.Enabled  := Value;
          editTacticalMissileTargetAimpoint.Color   := clWindow;
          rdoTacticalMissileTargetBearing.Enabled   := Value;
        end;
    5 : begin
          //Direct Launch
          //rdoTacticalMissileTargetTrack.Checked     := True;
          missile.FiringMode := mfmDirect;          //mk

          rdoTacticalMissileTargetTrack.Enabled     := Value;
          editTacticalMissileTargetTrack.Enabled    := Value;
          editTacticalMissileTargetTrack.Color      := clWindow;
          btnTacticalMissileTargetTrack.Enabled     := Value;
        end;
    6 : begin
          //HYbrid
          rdoTacticalMissileTargetTrack.Enabled     := Value;
          editTacticalMissileTargetTrack.Enabled    := Value;
          editTacticalMissileTargetTrack.Color      := clWindow;
          btnTacticalMissileTargetTrack.Enabled     := Value;
        end;
  end;
end;

procedure TfmWeapon.TacticalMissileWaypointSet(const Value: Boolean);
begin
  label500.Visible := Value;
  bevel108.Visible := Value;

  btnTacticalMissileWaypointEdit.Visible    := Value;
  btnTacticalMissileWaypointAdd.Visible     := Value;
  btnTacticalMissileWaypointCancel.Visible  := Value;
end;

procedure TfmWeapon.TurnOffAllLaunchers;
var
  i : Integer;
begin
  for i := 1 to 8 do
  begin
    FRippleCountArray[i-1] := False;

    case i of
      1 :
      begin
        vbl1.EnableBlinking := False;
        vbl1.Palette1.Low   := clLime;
        vbl1.Palette1.High  := clLime;
      end;
      2 :
      begin
        vbl2.EnableBlinking := False;
        vbl2.Palette1.Low   := clLime;
        vbl2.Palette1.High  := clLime;
      end;
      3 :
      begin
        vbl3.EnableBlinking := False;
        vbl3.Palette1.Low   := clLime;
        vbl3.Palette1.High  := clLime;
      end;
      4 :
      begin
        vbl4.EnableBlinking := False;
        vbl4.Palette1.Low   := clLime;
        vbl4.Palette1.High  := clLime;
      end;
      5 :
      begin
        vbl5.EnableBlinking := False;
        vbl5.Palette1.Low   := clLime;
        vbl5.Palette1.High  := clLime;
      end;
      6 :
      begin
        vbl6.EnableBlinking := False;
        vbl6.Palette1.Low   := clLime;
        vbl6.Palette1.High  := clLime;
      end;
      7 :
      begin
        vbl7.EnableBlinking := False;
        vbl7.Palette1.Low   := clLime;
        vbl7.Palette1.High  := clLime;
      end;
      8 :
      begin
        vbl8.EnableBlinking := False;
        vbl8.Palette1.Low   := clLime;
        vbl8.Palette1.High  := clLime;
      end;
    end;
  end;
end;

procedure TfmWeapon.Refresh_VisibleTab;
var
  Commander, WpnCarrier, Target : TT3Vehicle;
  Weapon : TT3Weapon;
  timeToGo : Integer;
  range, bearing, fromBearing, toBearing : Double;
  vectac : TT3Vectac;
begin
  Commander := TT3Vehicle(FControlled);

  if (Commander.Weapons.Count) > 0 then
  begin
    Weapon := TT3Weapon(Commander.Weapons.Items[TT3Vehicle(FControlled).LastWeaponsSelected]);   //cek
    btnWeapon.Enabled  := True;
    PanelTacticalWeapons.Visible := True;
  end
  else
  begin
    PanelTacticalWeapons.Visible := False;
    Exit;
  end;

  if not (Weapon is TT3Vectac) then Exit;

  vectac := Weapon as TT3Vectac;
  Target := vectac.Target as TT3Vehicle;

  if not Assigned(vectac.WeaponCarrier) then
    editVectacWeaponCarrierName.Text := '(none)';

  if not Assigned(vectac.Weapon) then
    editVectacWeaponName.Text := '(none)';

  if vectac.Tracked then
  begin
    //Target Data
    if simMgrClient.IsInstructor or simMgrClient.ISWasdal then
    begin
      case vectac.Target.Force_Designation of
        1 : lbVectacTargetIdentity.Caption := 'Red';
        2 : lbVectacTargetIdentity.Caption := 'Yellow';
        3 : lbVectacTargetIdentity.Caption := 'Blue';
        4 : lbVectacTargetIdentity.Caption := 'Green';
        5 : lbVectacTargetIdentity.Caption := 'No Force';
        6 : lbVectacTargetIdentity.Caption := 'Black';
      end;
    end
    else
    begin
      case vectac.Target.TrackIdent of
        piPending : lbVectacTargetIdentity.Caption := 'Pending';
        piUnknown : lbVectacTargetIdentity.Caption := 'Unknown';
        piAssumedFriend : lbVectacTargetIdentity.Caption := 'Assumed Friend';
        piFriend : lbVectacTargetIdentity.Caption := 'Friend';
        piNeutral : lbVectacTargetIdentity.Caption := 'Neutral';
        piSuspect : lbVectacTargetIdentity.Caption := 'Suspect';
        piHostile : lbVectacTargetIdentity.Caption := 'Hostile';
      end;
    end;

    lbVectacTargetPropulsion.Caption := 'Conventional';

    bearing := CalcBearing(Target.PosX, Target.PosY,
      vectac.Owner.PosX, vectac.Owner.PosY);

    GetAngleRange(bearing, 90, fromBearing, toBearing);

    if (vectac.Target.Heading > fromBearing) and
       (vectac.Target.Heading < toBearing) then
      lbVectacTargetDoppler.Caption := 'High'
    else
      lbVectacTargetDoppler.Caption := 'Low';

    lbVectacTargetCourse.Caption := FormatCourse(vectac.Target.Course);
    lbVectacTargetGround.Caption := FormatSpeed(vectac.Target.Speed);
    lbVectacTargetDepth.Caption := FormatAltitude(vectac.Target.Altitude);
  end
  else
  begin
    lbVectacTargetIdentity.Caption := '---';
    lbVectacTargetPropulsion.Caption := '---';
    lbVectacTargetDoppler.Caption := '---';
    lbVectacTargetCourse.Caption := '---';
    lbVectacTargetGround.Caption := '---';
    lbVectacTargetDepth.Caption := '---';
  end;

  if vectac.Planned then
  begin
    //Weapon Carrier Data
    WpnCarrier := vectac.WeaponCarrier as TT3Vehicle;

    if Assigned(WpnCarrier.Waypoints.NextWaypoint) then
    begin
      with WpnCarrier.Waypoints.NextWaypoint do
      begin
        range := CalcRange(WpnCarrier.PosX, WpnCarrier.PosY,
          FData.Waypoint_Longitude, FData.Waypoint_Latitude);

        bearing := CalcBearing(WpnCarrier.PosX, WpnCarrier.PosY,
          FData.Waypoint_Longitude, FData.Waypoint_Latitude);
      end;

      lbVectacWeaponCarrierAdviced.Caption  := FormatCourse(bearing);
    end
    else
    begin
      range := CalcRange(WpnCarrier.PosX, WpnCarrier.PosY, vectac.Longitude, vectac.Latitude);
      bearing := CalcBearing(WpnCarrier.PosX, WpnCarrier.PosY, vectac.Longitude, vectac.Latitude);
      lbVectacWeaponCarrierAdviced.Caption  := FormatCourse(bearing);
    end;

    if WpnCarrier.Speed = 0 then
      timeToGo := 0
    else
      timeToGo := Ceil((range / WpnCarrier.Speed) * 3600);

    lbVectacWeaponCarrierTime.Caption := FormatDateTime('nn:ss', IntToDateTime(timeToGo));
  end
  else
  begin
    editVectacWeaponCarrierGround.Text := '---';
    lbVectacWeaponCarrierAdviced.Caption := '---';
    editVectacWeaponCarrierDrop.Text := '---';
    lbVectacWeaponCarrierTime.Caption := '---';
    lbVectacWeaponExpiry.Caption := '---';
  end;

//  if (not vectac.ConfirmDrop) and (not vectac.Tracked)then
//  begin
//    btnVectacTargetTrack.Enabled := True;
//    btnVectacPlan.Enabled := True;
//    lbVectacWeaponExpiry.Caption := '---';
//  end
//  else
//    lbVectacWeaponExpiry.Caption := FormatDateTime('nn:ss', IntToDateTime(Ceil(vectac.ExpiredTime)));
end;

procedure TfmWeapon.RemoveListWeapon(ctrlObj: TObject);
begin
  if not(Assigned(ctrlObj)) then
    Exit;

  if FControlled = ctrlObj then
  begin
    pmenuWeapon.Items.Clear;

    btnWeapon.Enabled  := False;
    PanelTacticalWeapons.Visible  := False;

    focused_platform   := nil;
    focused_weapon     := nil;
  end;
end;

procedure TfmWeapon.sbGunICWSClick(Sender: TObject);
{var
  pi: TT3PlatformInstance;
  myTrackId, targetTrackId: string;
  projectiles : TT3GunShoot;
  theGun: TT3GunOnVehicle;}
begin
//  if not Assigned(focused_weapon) then
//    exit;
//  if focused_weapon.ClassType <> TT3GunOnVehicle then
//    exit;
//
//  theGun := TT3GunOnVehicle(focused_weapon);
//
//  if Sender is TSpeedButton then
//
//    with TT3GunOnVehicle(focused_weapon) do
//    begin
//      rGun.GunID := GunDefinition.FData.Gun_Index;
//      rGun.ParentPlatformID := TT3PlatformInstance(TT3GunOnVehicle(focused_weapon).Parent).InstanceIndex;
//      case TSpeedButton(Sender).Tag of
//        1:
//          begin
//            ControlMode := 1;
//            btnCIWSFire.Enabled := False;
//            btnCIWSTargetTrack.Enabled := true;
//            btnCIWSCease.Enabled := true;
//
//            rGun.ControlMode := ControlMode;
//          end;
//        2:
//          begin
//            ControlMode := 2;
//            btnCIWSFire.Enabled := true;
//            btnCIWSTargetTrack.Enabled := true;
//            btnCIWSCease.Enabled := false;
//
//            rGun.ControlMode := ControlMode;
//          end;
//        3:
//          begin
//            SalvoMode := 1;
//            rGun.SalvoMode := SalvoMode;
//          end;
//
//        4:
//          begin
//            SalvoMode := 2;
//            rGun.SalvoMode := SalvoMode;
//          end;
//        5:begin
//            FVisibleShowRange := True;
//            ShowRange := true;
//
//            ShowRangeSelected := FVisibleShowRange and ShowRange;
//
//            HideRangeSensor;
//          end;
//        6:begin
//            FVisibleShowRange := False;
//            ShowRange := false;
//
//            ShowRangeSelected := FVisibleShowRange and ShowRange;
//          end;
//        7: begin
//             FVisibleShowBlind := True;
//
//             ShowBlind := true;
//             ShowBlindSelected := FVisibleShowBlind and ShowBlind;
//             HideBlindWeapon;
//           end;
//        8: begin
//             FVisibleShowBlind := False;
//
//             ShowBlind := false;
//             ShowBlindSelected := FVisibleShowBlind and ShowBlind;
//           end;
//        9 :
//          begin
//            if Assigned(FControlled) then
//              myTrackId := TT3PlatformInstance(FControlled).Track_ID;
//
//            if Assigned(focused_platform) then
//            begin
//              targetTrackId := TT3PlatformInstance(focused_platform).Track_ID;
//              if myTrackId <> targetTrackId then
//              begin
//                if not CheckGunCapability(TT3PlatformInstance(focused_platform)) then exit;
//
//                editCIWSTargetTrack.Text := targetTrackId;
//                TargetObject := focused_platform;
//              end;
//            end;
//          end;
//      end;
//
//    end
//  else if Sender.ClassType = TButton then
//  begin
//    if not Assigned(focused_platform) then
//      Exit;
//
//    theGun := TT3GunOnVehicle(focused_weapon);
//    rGun.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
//    rGun.GunID := TT3Weapon(focused_weapon).InstanceIndex;
//    rGun.TargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;
//
//    case TButton(Sender).Tag of
//      1:
//        begin
//          {projectiles := PrepareShoot;
//          simMgrClient.AssignWeaponEvent(projectiles);
//          projectiles.Shoot;
//
//          lbCIWSQuantity.Caption := IntToStr(Quantity);
//
////            rGun.SalvoSize := StrToInt(editControlSalvoSize.Text);
//          SimMgrClient.netSend_CmdGunFire(rGun);  }
//
//                      //projectiles := TT3GunOnVehicle(focused_weapon).PrepareShoot;
//          //simMgrClient.AssignWeaponEvent(projectiles);
//          //projectiles.Shoot;
//
//          rGun.OrderID  := CORD_ID_fire;
//          rGun.SalvoSize := theGun.SalvoSize;
//          rGun.SalvoMode := theGun.SalvoMode;
//          rGun.ControlMode := theGun.ControlMode;
//          rGun.GunCapacityRemain := theGun.Quantity;
//          rGun.TargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;
//          if rGun.TargetPlatformID = 0 then
//            Exit;
//          {
//          case TT3GunOnVehicle(focused_weapon).SalvoMode of
//            0 :
//              begin
//                btnGunEngagementFire.Enabled := false;
//              end;
//            1 :
//              begin
//                btnGunEngagementFire.Enabled := True;
//              end;
//          end;
//          }
//
//          btnCIWSFire.Enabled := False;
//          btnCIWSCease.Enabled := True;
//          SimMgrClient.netSend_CmdGunFire(rGun);
//          //lbGunEngagementQuantity.Caption := IntToStr(TT3GunOnVehicle(focused_weapon).Quantity - 1);
//
//          {case TT3GunOnVehicle(focused_weapon).WeaponStatus of
//            wsAvailable: lblGunEngagementStatus.Caption := 'Available';
//            wsUnavailable: lblGunEngagementStatus.Caption := 'Unavailable';
//            wsDamaged: lblGunEngagementStatus.Caption := 'Damaged';
//          end; }
//
//          case TT3GunOnVehicle(focused_weapon).WeaponStatus of
//            wsAvailable: lblCIWSStatus.Caption := 'Available';
//            wsUnavailable: lblCIWSStatus.Caption := 'Unavailable';
//            wsDamaged: lblCIWSStatus.Caption := 'Damaged';
//          end;
//        end;
//      2:
//        begin
//          //menghentikan tembakan : asusmsi awal dengan menghentikan assignment Gun
//          TT3GunOnVehicle(focused_weapon).TargetObject := nil;
//          rGun.TargetPlatformID := TT3PlatformInstance(focused_platform).InstanceIndex;
//          {
//          btnGunEngagementAssign.Enabled := true;
//          if TT3GunOnVehicle(focused_weapon).IsAssigned then
//            btnGunEngagementFire.Enabled := True
//          else
//            btnGunEngagementFire.Enabled := True;
//          }
//
//          btnCIWSFire.Enabled := True;
//          btnCIWSCease.Enabled := False;
//          rGun.OrderID := CORD_ID_cease;
//          simMgrClient.netSend_CmdGunFire(rGun);
//        end;
//      end;
//  end;
//  UpdateTab(wcGunCIWS, focused_weapon);
end;

procedure TfmWeapon.sbTacticalMissileDisplayBlindHideClick(Sender: TObject);
begin
  inherited;
  FVisibleShowBlind := False;
  TT3MissilesOnVehicle(focused_weapon).ShowBlind := False;

  TT3MissilesOnVehicle(focused_weapon).ShowBlindSelected := FVisibleShowBlind and
      TT3MissilesOnVehicle(focused_weapon).ShowBlind;
end;

procedure TfmWeapon.sbTacticalMissileDisplayBlindShowClick(Sender: TObject);
begin
  inherited;
  FVisibleShowBlind := True;
  TT3MissilesOnVehicle(focused_weapon).ShowBlind := true;

  TT3MissilesOnVehicle(focused_weapon).ShowBlindSelected := FVisibleShowBlind and
      TT3MissilesOnVehicle(focused_weapon).ShowBlind;
end;

procedure TfmWeapon.sbTacticalMissileDisplayRangeHideClick(Sender: TObject);
begin
  inherited;
  FVisibleShowRange := False;
  TT3MissilesOnVehicle(focused_weapon).ShowRange := False;

  TT3MissilesOnVehicle(focused_weapon).ShowRangeSelected := FVisibleShowRange and
      TT3MissilesOnVehicle(focused_weapon).ShowRange;
end;

procedure TfmWeapon.sbTacticalMissileDisplayRangeShowClick(Sender: TObject);
begin
  inherited;
  FVisibleShowRange := True;
  TT3MissilesOnVehicle(focused_weapon).ShowRange := True;

  TT3MissilesOnVehicle(focused_weapon).ShowRangeSelected := FVisibleShowRange and
      TT3MissilesOnVehicle(focused_weapon).ShowRange;
end;

procedure TfmWeapon.UpdateWpnSurfaceToAirMissileTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  if not(Sender is TT3MissilesOnVehicle) then
    exit;

  focused_weapon := TT3MissilesOnVehicle(Sender);

  if TT3MissilesOnVehicle(Sender).ShowRange then
    sbSurfaceToAirDisplayRangeShow.Down := true
  else
    sbSurfaceToAirDisplayRangeHide.Down := true;

  if TT3MissilesOnVehicle(Sender).ShowBlind then
    sbSurfaceToAirDisplayBlindShow.Down := true
  else
    sbSurfaceToAirDisplayBlindHide.Down := true;

  if (Sender <> nil) and (Sender is TT3MissilesOnVehicle) then
  begin
    with TT3MissilesOnVehicle(Sender) do
    begin
      if Quantity > 0 then
        lblSurfaceToAirStatus.Caption := 'Available'
      else
      if Quantity = 0 then
        lblSurfaceToAirStatus.Caption := 'Unavailable';

      lbSurfaceToAirStatusQuantity.Caption := IntToStr(Quantity);

      ediSurfaceToAirSalvo.Text := IntToStr(SalvoSize);

      // lbSurfaceToAirTimeToWait.Caption := FDef.
    end;
  end;
end;

procedure TfmWeapon.UpdateMissileSurfaceToSurfaceTab(Sender: TObject);
var
  pLauncher :  TFitted_Weap_Launcher_On_Board;
  i : integer;
begin

  if Sender = nil then
    exit;

  if not(Sender is TT3MissilesOnVehicle) then
    exit;

  focused_weapon := TT3MissilesOnVehicle(Sender);

  if TT3MissilesOnVehicle(Sender).ShowRange then
    sbSurfaceToSurfaceMissileDisplayRangeShow.Down := true
  else
    sbSurfaceToSurfaceMissileDisplayRangeHide.Down := true;

  with TT3MissilesOnVehicle(Sender) do
  begin
    lbSurfaceToSurfaceMissileQuantity.Caption := IntToStr(Quantity);

    if MissileDefinition.FDef.Wpt_Capable = 1 then
    begin
      RBL1.Enabled := True;
      BOL1.Enabled := True;
      RBLW1.Enabled := True;
      BOLW1.Enabled := True;
      panSurfaceToSurfaceWp.Enabled := True;
    end
    else
    begin
      RBL1.Enabled := True;
      BOl1.Enabled := True;
      RBLW1.Enabled := False;
      BOLW1.Enabled := False;
      panSurfaceToSurfaceWp.Enabled := False;
    end;

    case FiringMode of
      mfmRBl  : begin
                  editSurfaceToSurfaceMissileFiring.Text := 'RBL';
                  HideButtonWeaponWaypoint;

                  btnSurfaceToSurfaceMissileLauncherMore.Visible := True;

                  lblDestruckRange.Visible    := False;
                  lblNmDestruckRange.Visible  := False;
                  lblCrossOverRange.Visible   := False;
                  lblNmCrossOverRange.Visible := False;
                  edtCrossOverRange.Visible   := False;
                  edtDestructRange.Visible    := False;
                end;
      mfmRBLW : begin
                  editSurfaceToSurfaceMissileFiring.Text := 'RBLW';
                  SetButtonWeaponWaypoint;

                  btnSurfaceToSurfaceMissileLauncherMore.Visible := True;

                  lblDestruckRange.Visible    := False;
                  lblNmDestruckRange.Visible  := False;
                  lblCrossOverRange.Visible   := False;
                  lblNmCrossOverRange.Visible := False;
                  edtCrossOverRange.Visible   := False;
                  edtDestructRange.Visible    := False;
                end;
      mfmBOL  : begin
                  editSurfaceToSurfaceMissileFiring.Text := 'BOL';
                  HideButtonWeaponWaypoint;

                  btnSurfaceToSurfaceMissileLauncherMore.Visible := True;

                  lblDestruckRange.Visible    := True;
                  lblNmDestruckRange.Visible  := True;
                  lblCrossOverRange.Visible   := True;
                  lblNmCrossOverRange.Visible := True;
                  edtCrossOverRange.Visible   := True;
                  edtDestructRange.Visible    := True;

                  edtDestructRange.Text := FloatToStr(TT3MissilesOnVehicle(focused_weapon).DestruckRange);
                end;
      mfmBOLW : begin
                  editSurfaceToSurfaceMissileFiring.Text := 'BOLW';
                  SetButtonWeaponWaypointBOLW;

                  btnSurfaceToSurfaceMissileLauncherMore.Visible := True;

                  lblDestruckRange.Visible    := False;
                  lblNmDestruckRange.Visible  := False;
                  lblCrossOverRange.Visible   := False;
                  lblNmCrossOverRange.Visible := False;
                  edtCrossOverRange.Visible   := False;
                  edtDestructRange.Visible    := False;

                  edtDestructRange.Text := FloatToStr(TT3MissilesOnVehicle(focused_weapon).DestruckRange);
                end;
    end;

    case Engagement of
      meRipple: editSurfaceToSurfaceMissileEngangement.Text := 'Ripple';
      meSTOT: editSurfaceToSurfaceMissileEngangement.Text := 'STOT';
      meDTOT: editSurfaceToSurfaceMissileEngangement.Text := 'DTOT';
    end;

    case WeaponStatus of
      wsAvailable   : lblSurfaceToSurfaceMissileStatus.Caption   := 'Available';
      wsUnavailable : lblSurfaceToSurfaceMissileStatus.Caption   := 'Unavailable';
      wsDamaged     : lblSurfaceToSurfaceMissileStatus.Caption   := 'Damaged';
    end;

    btnSurfaceToSurfaceMissileLauncherMore.Enabled := False;
    btnSurfaceToSurfaceMissileTargetTrackDetails.Enabled := False;

    if MissileDefinition.FLaunchs.Count > 0 then begin
      //set enable false
      pnlLaunch1.Enabled := false;
      pnlLaunch2.Enabled := false;
      pnlLaunch3.Enabled := false;
      pnlLaunch4.Enabled := false;
      pnlLaunch5.Enabled := false;
      pnlLaunch6.Enabled := false;
      pnlLaunch7.Enabled := false;
      pnlLaunch8.Enabled := false;

      vbl1.Enabled := false;
      vbl2.Enabled := false;
      vbl3.Enabled := false;
      vbl4.Enabled := false;
      vbl5.Enabled := false;
      vbl6.Enabled := false;
      vbl7.Enabled := false;
      vbl8.Enabled := false;

      //set visible
      pnlLaunch1.Visible := False;
      pnlLaunch2.Visible := False;
      pnlLaunch3.Visible := False;
      pnlLaunch4.Visible := False;
      pnlLaunch5.Visible := False;
      pnlLaunch6.Visible := False;
      pnlLaunch7.Visible := False;
      pnlLaunch8.Visible := False;

      vbl1.Visible := False;
      vbl2.Visible := False;
      vbl3.Visible := False;
      vbl4.Visible := False;
      vbl5.Visible := False;
      vbl6.Visible := False;
      vbl7.Visible := False;
      vbl8.Visible := False;

      for I := 0 to MissileDefinition.FLaunchs.Count - 1 do begin
        pLauncher := MissileDefinition.FLaunchs.Items[i];

        case pLauncher.FData.Launcher_Type of
          1 : pnlLaunch1.Visible := true;
          2 : pnlLaunch2.Visible := true;
          3 : pnlLaunch3.Visible := true;
          4 : pnlLaunch4.Visible := true;
          5 : pnlLaunch5.Visible := true;
          6 : pnlLaunch6.Visible := true;
          7 : pnlLaunch7.Visible := true;
          8 : pnlLaunch8.Visible := true;
          9 : pnlLaunch1.Visible := true;
          10 : pnlLaunch2.Visible := true;
          11 : pnlLaunch3.Visible := true;
          12 : pnlLaunch4.Visible := true;
          13 : pnlLaunch5.Visible := true;
          14 : pnlLaunch6.Visible := true;
          15 : pnlLaunch7.Visible := true;
          16 : pnlLaunch8.Visible := true;
        end;

        case pLauncher.FData.Launcher_Type of
          1 : vbl1.Visible := true;
          2 : vbl2.Visible := true;
          3 : vbl3.Visible := true;
          4 : vbl4.Visible := true;
          5 : vbl5.Visible := true;
          6 : vbl6.Visible := true;
          7 : vbl7.Visible := true;
          8 : vbl8.Visible := true;
          9 : vbl1.Visible := true;
          10 : vbl2.Visible := true;
          11 : vbl3.Visible := true;
          12 : vbl4.Visible := true;
          13 : vbl5.Visible := true;
          14 : vbl6.Visible := true;
          15 : vbl7.Visible := true;
          16 : vbl8.Visible := true;
        end;

        btnSurfaceToSurfaceCancel.Enabled := False;
        btnSurfaceToSurfaceLaunch.Enabled := False;
      end;
    end;
  end;
end;

procedure TfmWeapon.UpdateTab(Category: TWeapoonCategory; Sender: TObject);
begin
  //hide target drop point
  simMgrClient.TargetPoint.Visible := false;

  case Category of
    wcMissileSurfaceSubsurfaceToAir:
      UpdateWpnSurfaceToAirMissileTab(Sender);

    wcMissileSurfaceSubsurfaceToSurfaceSubsurface:
      UpdateMissileSurfaceToSurfaceTab(Sender);

    wcMissileAirToSurfaceSubsurface :
      UpdateTacticalMissileTab(sender);

    wcMissileAirToAir:
      UpdateTacticalMissileTab(sender);

    wcMissileLandAttack:
      UpdateTacticalMissileTab(sender);

    {Cendol Untuk testing}
    wcTorpedoStraigth:
      UpdateTorpedoStraightGuidanceTab(Sender);

    wcTorpedoWireGuided:
      UpdateTorpedoWireGuidedTab(Sender);

    wcTorpedoWakeHoming:
      UpdateTorpedoWakeHomingTab(Sender);

    wcTorpedoActiveAcoustic:
      UpdateTorpedoAcousticTab(Sender);

    wcTorpedoActivePassive:
      UpdateTorpedoActivePassiveTab(Sender);

    wcTorpedoAirDropped :
      UpdateTorpedoAirDroppedTab(Sender);

    wcMine:
      UpdateMinesTab(Sender);

    wcGunCIWS:
    begin
      //UpdateGunCIWSTab(Sender);
      WpnController := SelectController(wcGunCIWS);
      if Assigned(WpnController) then begin
        WpnController.PlatformCtrld := FControlled;
        WpnController.PlatformTrgt := focused_platform;
        WpnController.Weapon := Sender;
        WpnController.OnShowRange := OnShowRange;
        WpnController.OnShowBlind := OnShowBlind;
      end;
    end;

    wcGunGun:
    begin
      //UpdateGunAutoManualTab(Sender);
      WpnController := SelectController(wcGunGun);
      if Assigned(WpnController) then begin
        WpnController.PlatformCtrld := FControlled;
        WpnController.PlatformTrgt := focused_platform;
        WpnController.Weapon := Sender;
        WpnController.OnShowRange := OnShowRange;
        WpnController.OnShowBlind := OnShowBlind;
      end;
    end;

    wcGunRocket:
    begin
        UpdateGunAutoManualTab(Sender);
    end;

    wcBomb:
    begin
      WpnController := SelectController(wcBomb);
      if Assigned(WpnController) then begin
        WpnController.PlatformCtrld := FControlled;
        WpnController.PlatformTrgt := focused_platform;
        WpnController.Weapon := Sender;
        WpnController.OnShowRange := OnShowRange;
//        WpnController.OnShowBlind := OnShowBlind;
      end;

      UpdateBombDepthChargeTab(Sender);
    end;

    wcVectac:
      UpdateVectacTab(Sender);

    wcHybrid:
      UpdateHybridMissile(Sender);
  end;
end;

//function TfmWeapon.TacticalMissileCheckFCRadar(const Id : integer): Boolean;
//var
//  i, j : Integer;
//  Ship : TT3Vehicle;
//  TargetShipIndex : integer;
//  AssignFC        : TSimObject;
//
//  Device  : Tobject;
//  Radar   : TT3Radar;
//begin
//  Result := False;
//
//  TargetShipIndex := id;
//  Ship := TT3Vehicle(FControlled);
//
//  for i := 0 to Ship.Devices.Count - 1 do
//  begin
//    Device := TObject(Ship.Devices[i]);
//
//    if Device is TT3Radar then
//    begin
//      Radar := TT3Radar(device);
//
//      if Radar.RadarDefinition.FDef.Num_FCR_Channels > 0 then
//      begin
//        if Radar.AssignedTrack <> nil then
//        begin
//          for j := 0 to Radar.AssignedTrack.Count - 1 do
//          begin
//            AssignFC := TSimObject(Radar.AssignedTrack[j]);
//
//            if AssignFC is TT3DetectedTrack then
//            begin
//              if TT3PlatformInstance(TT3DetectedTrack(AssignFC).TrackObject).InstanceIndex = TargetShipIndex then
//              begin
//                result := True;
//                Break;
//              end;
//            end
//            else
//            if AssignFC is TT3PlatformInstance then
//            begin
//              if TT3PlatformInstance(AssignFC).InstanceIndex = TargetShipIndex then
//              begin
//                Result := True;
//                Break;
//              end;
//            end;
//          end;
//        end;
//      end;
//    end;
//  end;
//end;

procedure TfmWeapon.btnTacticalMissileLaunchClick(Sender: TObject);
var
  RecMissileEnvi : TrecMissile_Envi;
  Missile        : TT3MissilesOnVehicle;
  Range          : Double;
begin
  inherited;

  if focused_weapon = nil then Exit;
  if (FControlled = nil) or (focused_platform = nil) then Exit;

  Missile := TT3MissilesOnVehicle(focused_weapon);
  if not(Assigned(Missile)) then Exit;

  if Missile.WeaponStatus = wsDamaged then
  begin
    frmTacticalDisplay.addStatus('Weapon Status is Damage');
    Exit;
  end;


  case Missile.FiringMode  of
    mfmDirect   :
                begin
                  Range := CalcRange(TT3PlatformInstance(FControlled).getPositionX, TT3PlatformInstance(FControlled).getPositionY
                           ,TT3PlatformInstance(focused_platform).getPositionX, TT3PlatformInstance(focused_platform).getPositionY);

                  if Range <= TMissile_On_Board(Missile.UnitDefinition).FDef.Min_Range then
                  begin
                    frmTacticalDisplay.addStatus('Target is to close');
                  end
                  else
                  if Range >= TMissile_On_Board(Missile.UnitDefinition).FDef.Max_Range then
                  begin
                    frmTacticalDisplay.addStatus('Target is too far');
                  end
                  else
                  if (Range > TMissile_On_Board(Missile.UnitDefinition).FDef.Min_Range) and
                     (Range < TMissile_On_Board(Missile.UnitDefinition).FDef.Max_Range) then
                  begin
                    with RecMissileEnvi do
                    begin
                      platformID        := TT3PlatformInstance(FControlled).InstanceIndex;
                      WeaponIndex       := missile.InstanceIndex;
                      WeaponName        := missile.InstanceName;
                      isHybrid          := False;
                      Missile_Kind      := Integer(Missile.WeaponCategory);
                      MIssile_Method    := Integer(missile.FiringMode);
                      Missile_PositionX := Missile.Aimpoint_Movement.PositionX;
                      Missile_PositionY := Missile.Aimpoint_Movement.PositionY;
                      Bearing           := Missile.Bearing_Movement.BearingLaunch;
                    end;
                    simMgrClient.netSend_CmdSyncMissileEnvi(RecMissileEnvi);
                    sleep(100);


                    if Missile.Quantity > 0 then
                    begin
                      rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                      rMis.MissileID        := Missile.InstanceIndex;
                      rMis.FiringMode       := Byte(Missile.FiringMode);

                      if rdoTacticalMissileTargetBearing.Checked then
                        rMis.LaunchAngle := Round(Missile.Bearing_Movement.BearingLaunch);

                      simMgrClient.netSend_CmdLaunch_Missile(rMis);
                      simMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                        missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - 1));
                    end;
                  end;
                end;
    mfmAimpoint :
                begin
                  Range := CalcRange(TT3PlatformInstance(FControlled).getPositionX, TT3PlatformInstance(FControlled).getPositionY
                           ,Missile.Aimpoint_Movement.PositionX, Missile.Aimpoint_Movement.PositionY);

                  if Range <= TMissile_On_Board(Missile.UnitDefinition).FDef.Min_Range then
                  begin
                    frmTacticalDisplay.addStatus('Target is to close');
                  end
                  else
                  if Range >= TMissile_On_Board(Missile.UnitDefinition).FDef.Max_Range then
                  begin
                    frmTacticalDisplay.addStatus('Target is too far');
                  end
                  else
                  if (Range > TMissile_On_Board(Missile.UnitDefinition).FDef.Min_Range) and
                     (Range < TMissile_On_Board(Missile.UnitDefinition).FDef.Max_Range) then
                  begin
                    with RecMissileEnvi do
                    begin
                      platformID        := TT3PlatformInstance(FControlled).InstanceIndex;
                      WeaponIndex       := missile.InstanceIndex;
                      WeaponName        := missile.InstanceName;
                      isHybrid          := False;
                      Missile_Kind      := Integer(Missile.WeaponCategory);
                      MIssile_Method    := Integer(missile.FiringMode);
                      Missile_PositionX := Missile.Aimpoint_Movement.PositionX;
                      Missile_PositionY := Missile.Aimpoint_Movement.PositionY;
                      Bearing           := Missile.Bearing_Movement.BearingLaunch;
                    end;
                    simMgrClient.netSend_CmdSyncMissileEnvi(RecMissileEnvi);
                    sleep(100);


                    if Missile.Quantity > 0 then
                    begin
                      rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                      rMis.MissileID        := Missile.InstanceIndex;
                      rMis.FiringMode       := Byte(Missile.FiringMode);

                      if rdoTacticalMissileTargetBearing.Checked then
                        rMis.LaunchAngle := Round(Missile.Bearing_Movement.BearingLaunch);

                      simMgrClient.netSend_CmdLaunch_Missile(rMis);
                      simMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                        missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - 1));
                    end;
                  end;
                end;
    mfmBearing  :
                begin
                  with RecMissileEnvi do
                  begin
                    platformID        := TT3PlatformInstance(FControlled).InstanceIndex;
                    WeaponIndex       := missile.InstanceIndex;
                    WeaponName        := missile.InstanceName;
                    isHybrid          := False;
                    Missile_Kind      := Integer(Missile.WeaponCategory);
                    MIssile_Method    := Integer(missile.FiringMode);
                    Missile_PositionX := Missile.Aimpoint_Movement.PositionX;
                    Missile_PositionY := Missile.Aimpoint_Movement.PositionY;
                    Bearing           := Missile.Bearing_Movement.BearingLaunch;
                  end;
                  simMgrClient.netSend_CmdSyncMissileEnvi(RecMissileEnvi);
                  sleep(100);

                  if Missile.Quantity > 0 then
                  begin
                    rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
                    rMis.MissileID        := Missile.InstanceIndex;
                    rMis.FiringMode       := Byte(Missile.FiringMode);

                    if rdoTacticalMissileTargetBearing.Checked then
                      rMis.LaunchAngle := Round(Missile.Bearing_Movement.BearingLaunch);

                    simMgrClient.netSend_CmdLaunch_Missile(rMis);
                    simMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
                      missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - 1));
                  end;
                end ;
  end;

//  if Range <= TMissile_On_Board(Missile.UnitDefinition).FDef.Min_Range then
//  begin
//    frmTacticalDisplay.addStatus('Target is to close');
//  end
//  else
//  if Range >= TMissile_On_Board(Missile.UnitDefinition).FDef.Max_Range then
//  begin
//    frmTacticalDisplay.addStatus('Target is too far');
//  end
//  else
//  if (Range > TMissile_On_Board(Missile.UnitDefinition).FDef.Min_Range) and
//     (Range < TMissile_On_Board(Missile.UnitDefinition).FDef.Max_Range) then
//  begin
//    with RecMissileEnvi do
//    begin
//      platformID        := TT3PlatformInstance(FControlled).InstanceIndex;
//      WeaponIndex       := missile.InstanceIndex;
//      WeaponName        := missile.InstanceName;
//      isHybrid          := False;
//      Missile_Kind      := Integer(Missile.WeaponCategory);
//      MIssile_Method    := Integer(missile.FiringMode);
//      Missile_PositionX := Missile.Aimpoint_Movement.PositionX;
//      Missile_PositionY := Missile.Aimpoint_Movement.PositionY;
//      Bearing           := Missile.Bearing_Movement.BearingLaunch;
//    end;
//    simMgrClient.netSend_CmdSyncMissileEnvi(RecMissileEnvi);
//    sleep(100);
//
////    if Missile.FiringMode = mfmDirect then
////    begin
////      if TacticalMissileCheckFCRadar(rMis.TargetPlatformID) then
////      begin
//        if Missile.Quantity > 0 then
//        begin
//          rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
//          rMis.MissileID        := Missile.InstanceIndex;
//          rMis.FiringMode       := Byte(Missile.FiringMode);
//
//          if rdoTacticalMissileTargetBearing.Checked then
//            rMis.LaunchAngle := Round(Missile.Bearing_Movement.BearingLaunch);
//
//          simMgrClient.netSend_CmdLaunch_Missile(rMis);
//          simMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
//            missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - 1));
//        end;
//      end
//      else
//      begin
//        frmTacticalDisplay.addStatus('Target Not Assign in Fire Control');
//      end;
//    end
//    else
//    begin
//      if Missile.Quantity > 0 then
//      begin
//        rMis.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
//        rMis.MissileID        := Missile.InstanceIndex;
//        rMis.FiringMode       := Byte(Missile.FiringMode);
//
//        if rdoTacticalMissileTargetBearing.Checked then
//          rMis.LaunchAngle := Round(Missile.Bearing_Movement.BearingLaunch);
//
//        simMgrClient.netSend_CmdLaunch_Missile(rMis);
//        simMgrClient.netSend_CmdSetQuantity(TT3PlatformInstance(FControlled).InstanceIndex,
//          missile.InstanceIndex, CORD_ID_QUANTITY, CORD_TYPE_WEAPON, (missile.Quantity - 1));
//      end;
//    end;
//  end;
end;

procedure TfmWeapon.btnTacticalMissileTargetAimpointClick(Sender: TObject);
begin
  inherited;

  frmTacticalDisplay.Map1.CurrentTool := mtAimpoint;
end;

procedure TfmWeapon.btnTacticalMissileTargetBearingClick(Sender: TObject);
var
  RecMissileEnvi : TrecMissile_Envi;
  BearingMissile : Double;
  Missile        : TT3MissilesOnVehicle;
begin
  inherited;
  if focused_weapon = nil then Exit;
  if (FControlled = nil) or (focused_platform = nil) then Exit;

  Missile := TT3MissilesOnVehicle(focused_weapon);
  BearingMissile := CalcBearing(TSimObject(FControlled).PosX, TSimObject(FControlled).PosY,
              focused_platform.PosX, focused_platform.PosY);

  with RecMissileEnvi do
  begin
    platformID        := TT3PlatformInstance(FControlled).InstanceIndex;
    WeaponIndex       := missile.InstanceIndex;
    WeaponName        := missile.InstanceName;
    isHybrid          := False;
    Missile_Kind      := Integer(Missile.WeaponCategory);
    MIssile_Method    := Integer(missile.FiringMode);
    Missile_PositionX := Missile.Aimpoint_Movement.PositionX;
    Missile_PositionY := Missile.Aimpoint_Movement.PositionY;
    Bearing           := BearingMissile;
  end;
  simMgrClient.netSend_CmdSyncMissileEnvi(RecMissileEnvi);

  editTacticalMissileTargetBearing.Text := FormatFloat('0.00', BearingMissile);
end;

procedure TfmWeapon.btnTacticalMissileTargetTrackClick(Sender: TObject);
var
  OwnShip, TargetShip : TT3Vehicle;
  Missile : TT3MissilesOnVehicle;
  MyTrackId, TargetTrackId, trackNumb : string;
  //trackNumbTarget : Integer;
begin
  inherited;

  {$REGION 'Choco - Editted'}
//  di track ini saya ganti jadi demikian. soalnya kalo pake pake weaponcatagory (yg asalnya dari primary target track).
//  rasa2nya kurang tepat. ^^v
//  kl ada yg kliru bisa jawil saya.. nanti dibenahi lg.
  {$ENDREGION}

  if not Assigned(FControlled) then
  begin
    frmTacticalDisplay.addStatus('Vehicle Sender Not Found');
    rMis.TargetPlatformID := 0;
    FisTrack := False;
    Exit;
  end;

  if not Assigned(focused_weapon) then
  begin
    frmTacticalDisplay.addStatus('Weapon Not Defined');
    rMis.TargetPlatformID := 0;
    FisTrack := False;
    Exit;
  end;

  if not Assigned(focused_platform) then
  begin
    frmTacticalDisplay.addStatus('Vehicle Target Not Found');
    rMis.TargetPlatformID := 0;
    FisTrack := False;
    Exit;
  end;

  if TT3PlatformInstance(focused_platform) = TT3PlatformInstance(FControlled) then
  begin
    frmTacticalDisplay.addStatus('Cant Track Own Vehicle');
    rMis.TargetPlatformID := 0;
    FisTrack := False;
    Exit;
  end;

  if not (TT3PlatformInstance(focused_platform) is TT3Vehicle) then
  begin
    frmTacticalDisplay.addStatus('Vehicle Target Not Available');
    rMis.TargetPlatformID := 0;
    FisTrack := False;
    Exit;
  end;

  OwnShip     := TT3Vehicle(FControlled);
  TargetShip  := TT3Vehicle(focused_platform);
  Missile     := TT3MissilesOnVehicle(focused_weapon);

  with Missile.MissileDefinition.FDef do
  begin
    if ((TargetShip.VehicleDefinition.FData.Platform_Domain = 0) and (Boolean(Anti_Air_Capable))) or
       ((TargetShip.VehicleDefinition.FData.Platform_Domain = 1) and (Boolean(Anti_Sur_Capable))) or
       ((TargetShip.VehicleDefinition.FData.Platform_Domain = 2) and (Boolean(Anti_SubSur_Capable))) or
       ((TargetShip.VehicleDefinition.FData.Platform_Domain = 3) and (Boolean(Anti_Land_Capable))) or
       ((TargetShip.VehicleDefinition.FData.Platform_Domain = vhdAmphibious) and (Boolean(Anti_Amphibious_Capable))) then
    begin
      MyTrackId :=  OwnShip.Track_ID;          //mk  (track number)

      if focused_platform is TT3NonRealVehicle then
        TargetTrackId := IntToStr(TT3PlatformInstance(focused_platform).TrackNumber)
      else if focused_platform is TT3Vehicle then
        TargetTrackId := TT3PlatformInstance(focused_platform).Track_ID;

      if Assigned(simMgrClient.findDetectedTrack(focused_platform)) then
      begin
        trackNumb := FormatTrackNumber(TT3DetectedTrack(simMgrClient.findDetectedTrack(focused_platform)).TrackNumber);
        //trackNumbTarget := StrToInt(trackNumb);
        //trackNumbTarget := TargetShip.InstanceIndex;
      end
      else
      begin
        trackNumb := TT3PlatformInstance(focused_platform).TrackLabel;
        //trackNumbTarget := TargetShip.InstanceIndex;
      end;

      if MyTrackId <> TargetTrackId then
      begin
        if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
        begin
          editTacticalMissileTargetTrack.Text := TargetTrackId;
          //rMis.TargetPlatformID := TargetShip.InstanceIndex;
        end
        else
        begin
          editTacticalMissileTargetTrack.Text := trackNumb;
          //rMis.TargetPlatformID := trackNumbTarget;
        end;

        rMis.TargetPlatformID := TargetShip.InstanceIndex;
        rMis.ParentPlatformID := OwnShip.InstanceIndex;
        rMis.MissileID        := Missile.InstanceIndex;
      end
      else
      begin
        frmTacticalDisplay.addStatus('Cant Trak Own Vehicle');
        editTacticalMissileTargetTrack.Text := '';
        rMis.TargetPlatformID := 0;
        Exit;
      end;
    end
    else
    begin
      frmTacticalDisplay.addStatus('Target Domain Not Same With Missile');
      editTacticalMissileTargetTrack.Text := '';
      rMis.TargetPlatformID := 0;
      Exit;
    end;
  end;

  {case Missile.WeaponCategory of
    wcMissileAirToAir :
    begin
      //Nembak Domain di atas udara
      if TargetShip.VehicleDefinition.FData.Platform_Domain <> 0 then
      begin
        frmTacticalDisplay.addStatus('Target Domain Not Same With Missile');
        rMis.TargetPlatformID := 0;
        Exit;
      end
      else
      begin
        editTacticalMissileTargetTrack.Text := TargetShip.Track_ID;

        rMis.ParentPlatformID := OwnShip.InstanceIndex;
        rMis.TargetPlatformID := TargetShip.InstanceIndex;
        rMis.MissileID        := Missile.InstanceIndex;
      end;
    end;
    wcMissileAirToSurfaceSubsurface, wcMissileLandAttack :
    begin
      //Nembak Doamin permukaan
      if TargetShip.getPositionZ = 0 then
      begin
        editTacticalMissileTargetTrack.Text := TargetShip.Track_ID;

        rMis.ParentPlatformID := OwnShip.InstanceIndex;
        rMis.TargetPlatformID := TargetShip.InstanceIndex;
        rMis.MissileID        := Missile.InstanceIndex;
      end
      else
      begin
        frmTacticalDisplay.addStatus('Target Domain Not Same With Missile');
        rMis.TargetPlatformID := 0;
        Exit;
      end;
    end;
  end;      }
end;

procedure TfmWeapon.UpdateTacticalMissileTab(Sender: TObject);
var
  Missile : TT3MissilesOnVehicle;
begin
  if Sender = nil then
    exit;

  focused_weapon := TT3MissilesOnVehicle(Sender);
  Missile := TT3MissilesOnVehicle(sender);

  lblTacticalMissileStatusQuantity.Caption := IntToStr(Missile.Quantity);

  TacticalMissileControlSet(false);
  TacticalMissileWaypointSet(false);
  TacticalMissileSettarget(false, 1);

  editTacticalMissileTargetTrack.Text := '';
  rMis.TargetPlatformID := 0;

  TacticalMissileSettarget(True, Missile.MissileDefinition.FDef.Launch_Method + 2);

  case Missile.MissileDefinition.FDef.Primary_Guide_Type of
    0,1,2,3 : TacticalMissileControlSet(True);
    4,5 : TacticalMissileControlSet(False);
  end;
end;

procedure TfmWeapon.UpdateTorpedoAcousticTab(Sender: TObject);
var
  menuItem    : TMenuItem;
  i, j, k     : Integer;
begin
  if Sender = nil then
    exit;

  if not(Sender is TT3TorpedoesOnVehicle) then
    exit;

  focused_weapon := TT3TorpedoesOnVehicle(Sender);

  pmTorpedoFiring.Items.Clear;
  pmTorpedoRunOut.Items.Clear;
  pmTorpedoGyroAngle.Items.Clear;

  for i := 0 to 1 do
  begin
    menuItem := TMenuItem.Create(nil);

    if i = 0 then
      menuItem.Caption :='Deliberate' else
    if i = 1 then
      menuItem.Caption :='Urgent';

    menuItem.Tag     := i;
    menuItem.OnClick := onTorpedoFiringClick;
    pmTorpedoFiring.Items.Add(menuItem);
  end;

  for j := 0 to 1 do
  begin
    menuItem := TMenuItem.Create(nil);

    if j = 0 then
      menuItem.Caption :='RunOut' else
    if j = 1 then
      menuItem.Caption :='No RunOut';

    menuItem.Tag     := j;
    menuItem.OnClick := onTorpedoRunOutClick;
    pmTorpedoRunOut.Items.Add(menuItem);
  end;

  for k := 0 to 4 do
  begin
    menuItem := TMenuItem.Create(nil);

    if k = 0 then
      menuItem.Caption :='0' else
    if k = 1 then
      menuItem.Caption :='45 pt';
    if k = 2 then
      menuItem.Caption :='60 pt';
    if k = 3 then
      menuItem.Caption :='45 sb';
    if k = 4 then
      menuItem.Caption :='60 sb';

    menuItem.Tag     := k;
    menuItem.OnClick := onTorpedoGyroAngle;
    pmTorpedoGyroAngle.Items.Add(menuItem);
  end;

  with TT3TorpedoesOnVehicle(Sender) do
  begin
    if ShowRange then
      btnAccousticDisplayRangeShow.Down := True
    else
      btnAccousticDisplayRangeHide.Down := True;

    if ShowBlind then
      btnDisplayBlindZonesShow.Down := True
    else
      btnDisplayBlindZonesHide.Down := True;

    case WeaponStatus of
      wsAvailable   : lblAPGStatus.Caption   := 'Available';
      wsUnavailable : lblAPGStatus.Caption   := 'Unavailable';
      wsDamaged     : lblAPGStatus.Caption   := 'Damaged';
    end;

    lblAcousticTorpedoQuantity.Caption      := IntToStr(Quantity);
    EdtATTargetTrack.Text := TT3TorpedoesOnVehicle(Focused_weapon).TargetTrack;

    if (TT3TorpedoesOnVehicle(Focused_weapon).FiringMode = 1) then
      EdtFiringModeAT.Text := 'Deliberate'
    else
      EdtFiringModeAT.Text := 'Urgent';
    if (TT3TorpedoesOnVehicle(Focused_weapon).RunOutMode = 1) then
      EdtRunOutAT.Text := 'RunOut'
    else
      EdtRunOutAT.Text := 'No RunOut';

    EdtSearchRadiusAT.Text := FloatToStr(TT3TorpedoesOnVehicle(Focused_weapon).SearchRadius);
    EdtSearchDepthAT.Text := FloatToStr(TT3TorpedoesOnVehicle(Focused_weapon).SearchDepth);
    EdtSafetyCeilingAT.Text := FloatToStr(TT3TorpedoesOnVehicle(Focused_weapon).SafetyCeiling);
    EdtSeekerRangeAT.Text := FloatToStr(TT3TorpedoesOnVehicle(Focused_weapon).SeekerRange);
    EdtGyroAngleAT.Text := IntToStr(TT3TorpedoesOnVehicle(Focused_weapon).GyroAngle);

    btnTube1AT.Enabled := True;
    btnTube2AT.Enabled := True;
    btnTube3AT.Enabled := True;
    btnTube4AT.Enabled := True;

    case TT3TorpedoesOnVehicle(Focused_weapon).TubeOn of
      1 : btnTube1AT.Enabled := False;
      2 : btnTube2AT.Enabled := False;
      3 : btnTube3AT.Enabled := False;
      4 : btnTube4AT.Enabled := False;
    end;

    btnPlanAT.Enabled := TT3TorpedoesOnVehicle(Focused_weapon).ButtonPlan;
    btnLaunchAT.Enabled := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
  end;
end;

procedure TfmWeapon.OnTorpedoFiringClick(Sender: TObject);
begin
  with TT3TorpedoesOnVehicle(focused_weapon) do
  begin
    if TMenuItem(sender).Caption = '&Deliberate' then
      SimMgrClient.netSend_CmdTorpedoProperty(TT3PlatformInstance(FControlled).InstanceIndex, Integer(wcTorpedoActiveAcoustic), 2, InstanceIndex, InstanceName, 1)
    else
      SimMgrClient.netSend_CmdTorpedoProperty(TT3PlatformInstance(FControlled).InstanceIndex, Integer(wcTorpedoActiveAcoustic), 2, InstanceIndex, InstanceName, 0);
  end
end;

procedure TfmWeapon.onTorpedoGyroAngle(Sender: TObject);
begin
  with TT3TorpedoesOnVehicle(focused_weapon) do
  begin
    if TMenuItem(sender).Caption = '&0' then
      SimMgrClient.netSend_CmdTorpedoProperty(TT3PlatformInstance(FControlled).InstanceIndex, Integer(wcTorpedoActiveAcoustic), 8, InstanceIndex, InstanceName, 0)
    else if TMenuItem(sender).Caption = '&45 pt'  then
      SimMgrClient.netSend_CmdTorpedoProperty(TT3PlatformInstance(FControlled).InstanceIndex, Integer(wcTorpedoActiveAcoustic), 8, InstanceIndex, InstanceName, 315)
    else if TMenuItem(sender).Caption = '&60 pt'  then
      SimMgrClient.netSend_CmdTorpedoProperty(TT3PlatformInstance(FControlled).InstanceIndex, Integer(wcTorpedoActiveAcoustic), 8, InstanceIndex, InstanceName, 300)
    else if TMenuItem(sender).Caption = '4&5 sb'  then
      SimMgrClient.netSend_CmdTorpedoProperty(TT3PlatformInstance(FControlled).InstanceIndex, Integer(wcTorpedoActiveAcoustic), 8, InstanceIndex, InstanceName, 45)
    else if TMenuItem(sender).Caption = '60 &sb'  then
      SimMgrClient.netSend_CmdTorpedoProperty(TT3PlatformInstance(FControlled).InstanceIndex, Integer(wcTorpedoActiveAcoustic), 8, InstanceIndex, InstanceName, 60)
  end;
end;

procedure TfmWeapon.onTorpedoRunOutClick(Sender: TObject);
begin
  with TT3TorpedoesOnVehicle(focused_weapon) do
  begin
    if TMenuItem(sender).Caption = '&RunOut' then
      SimMgrClient.netSend_CmdTorpedoProperty(TT3PlatformInstance(FControlled).InstanceIndex, Integer(wcTorpedoActiveAcoustic), 3, InstanceIndex, InstanceName, 1)
    else
      SimMgrClient.netSend_CmdTorpedoProperty(TT3PlatformInstance(FControlled).InstanceIndex, Integer(wcTorpedoActiveAcoustic), 3, InstanceIndex, InstanceName, 0);
  end;
end;

procedure TfmWeapon.UpdateVectacTab(Sender: TObject);
var
  sObject : TSimObject;
  vectac : TT3Vectac;
begin
  if (Sender = nil) or not (Sender is TT3Vectac) then
    Exit;

  vectac := TT3Vectac(Sender);
  if vectac.Tracked then
  begin
    with frmTacticalDisplay.fmWeapon1 do
    begin
      if simMgrClient.IsController or simMgrClient.ISWasdal then
        editVectacTargetTrack.Text := vectac.Target.Track_ID
      else
      begin
        sObject := simMgrClient.findDetectedTrack(vectac.Target.InstanceIndex);

        if Assigned(sObject) then
          editVectacTargetTrack.Text := FormatTrackNumber(TT3DetectedTrack(sObject).TrackNumber)
        else
          editVectacTargetTrack.Text := FormatTrackNumber(0);
      end;
    end;
  end
  else
    editVectacTargetTrack.Text := '';

  if vectac.Planned then
  begin
    btnVectacWeaponName.Enabled := True;
    btnVectacPlan.Enabled       := False;
    btnVectacCancel.Enabled     := True;
    btnVectacConfirm.Enabled    := True;
  end
  else
  begin
    btnVectacWeaponName.Enabled := False;
    btnVectacPlan.Enabled       := True;
    btnVectacCancel.Enabled     := False;
    btnVectacConfirm.Enabled    := False;
  end;

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
    btnVectacConfirm.Caption := 'Drop'
  else
    btnVectacConfirm.Caption := 'Confirm Weapon Drop';
end;

//procedure TfmWeapon.UpdateTorpedoTacticalTab(Sender: TObject);
//begin
//  if Sender = nil then
//    exit;
//
//  with TT3Torpedo(Sender) do
//  begin
//
//  end;
//
//end;

procedure TfmWeapon.UpdateGunCIWSTab(Sender: TObject);
begin
//  if Sender = nil then
//    exit;
//  if Sender.ClassType <> TT3GunOnVehicle then
//    exit;
//  focused_weapon := TT3GunOnVehicle(Sender);
//
//  if TT3GunOnVehicle(Sender).GunDefinition.FData.Automode_Capable = 1 then
//    sbCIWSControlModeAuto.Enabled := True
//  else
//    sbCIWSControlModeAuto.Enabled := False;
//
//  with TT3GunOnVehicle(Sender) do
//  begin
//    if ShowRange then
//      sbCIWSControlDisplayRangeShow.Down := true
//    else
//      sbCIWSControlDisplayRangeHide.Down := true;
//
//    if ShowBlind then
//      sbCIWSControlDisplayBlindZonesShow.Down := true
//    else
//      sbCIWSControlDisplayBlindZonesHide.Down := true;
//
//    case ControlMode of
//      1:
//        sbCIWSControlModeAuto.Down := true;
//      2:
//        sbCIWSControlModeManual.Down := true;
//    end;
//
//    case SalvoMode of
//      1:
//        sbCIWSControlSalvoCont.Down := true;
//      2:
//        sbCIWSControlSalvoSalvo.Down := true;
//    end;
//
//    lbCIWSQuantity.Caption := IntToStr(Quantity);
//
//    if not Assigned(TargetObject) then
//      Exit;
//
//    {FIRE : CEASE}
//    if btnCIWSCease.Enabled then begin
//      //btnGunEngagementCease.Enabled := False;
//      btnCIWSFire.Enabled := False;
//    end
//    else begin
//     // btnGunEngagementCease.Enabled := true;
//      btnCIWSFire.Enabled := true;
//    end;
//
//
//    if btnCIWSFire.Enabled then begin
//      btnCIWSCease.Enabled := False;
//    end
//    else
//      btnCIWSCease.Enabled := true;
//
//    case WeaponStatus of
//      wsAvailable   : lblCIWSStatus.Caption   := 'Available';
//      wsUnavailable : lblCIWSStatus.Caption   := 'Unavailable';
//      wsDamaged     : lblCIWSStatus.Caption   := 'Damaged';
//    end;
//  end;

end;

procedure TfmWeapon.UpdateHybridMissile(Sender: TObject);
var
  sLong, sLat : string;
begin
  if Sender = nil then
    exit;

  if Sender is TT3HybridOnVehicle then begin
    focused_weapon := TT3HybridOnVehicle(Sender);

    with TT3HybridOnVehicle(Sender) do begin
      lblHybridMissileQuantity.Caption := IntToStr(Quantity);
      edtHybridMissileControlCruiseAltitude.Text := IntToStr(CruiseAltitude);

      sLong := formatDMS_long(Aimpoint_Movement.PositionX);
      sLat  := formatDMS_latt(Aimpoint_Movement.PositionY);

      edtHybridMissiletargetAimpoint.Text := sLong + ' ' + sLat;
      edtHybridMissileControlSalvoSize.Text := IntToStr(SalvoSize);
      btnHybridMissileLaunch.Enabled := True;

//      btnHybridMissileLaunch.Enabled:= True;
    end;
  end;

end;

//procedure TfmWeapon.UpdateGunChaffTab(Sender: TObject);
//begin
//  if Sender = nil then
//    exit;
//
//  if not(Sender is TT3GunOnVehicle) then
//    exit;
//
//  focused_weapon := TT3GunOnVehicle(Sender);
//
//  with TT3GunOnVehicle(Sender) do
//  begin
//    if ShowRange then
//      sbChaffDisplayShow.Down := true
//    else
//      sbChaffDisplayHide.Down := true;
//
//    if ShowBlind then
//      sbChaffBlindZoneShow.Down := true
//    else
//      sbChaffBlindZoneHide.Down := true;
//
//    case ControlMode of
//      1:
//        sbGunEngagementChaffContolAuto.Down := true;
//      2:
//        sbGunEngagementChaffContolManual.Down := true;
//      3:
//        sbGunEngagementChaffContolChaff.Down :=true;
//    end;
//
//    lbChaffControlQuantity.Caption := IntToStr(Quantity);
//    //editChaffControlBloomPosition.Text := IntToStr()
//  end;
//end;

{ TODO 1 : Cek baris berikut, UpdateGunAutoManualTab di komen dulu karena perubahan di frmweapon }
procedure TfmWeapon.UpdateGunAutoManualTab(Sender: TObject);
//var
//  i       : integer;
//  ecm     : TT3CounterMeasure;
//  device  : TT3DeviceUnit;
begin




//  if Sender = nil then
//    exit;
//
//  if Sender.ClassType = TT3GunOnVehicle then
//  begin
//    focused_weapon := TT3GunOnVehicle(Sender);
//
//    if TT3GunOnVehicle(Sender).GunDefinition.FData.Chaff_Capable_Gun = 1 then
//       sbControlModeChaff.Enabled := True
//    else
//       sbControlModeChaff.Enabled := False;
//
//    if TT3GunOnVehicle(Sender).GunDefinition.FData.Automode_Capable = 1 then
//    begin
//      sbControlModeAuto.Enabled := True;
//      SpeedButton3.Enabled := True;
//    end
//    else
//    begin
//      sbControlModeAuto.Enabled := False;
//      SpeedButton3.Enabled := False;
//    end;
//
//    if TT3GunOnVehicle(Sender).GunDefinition.FData.Fire_Cntl_Director_Req = 1 then
//    begin
//      btnGunEngagementAssign.Enabled := True;
//      btnGunEngagementBreak.Enabled := False;
//      btnGunEngagementFire.Enabled := False;
//    end
//    else
//    begin
//      btnGunEngagementAssign.Enabled := False;
//      btnGunEngagementBreak.Enabled := False;
//      btnGunEngagementFire.Enabled := True;
//    end;
//
//    with TT3GunOnVehicle(Sender) do
//    begin
//      if ShowRange then begin
//        sbGunEngagementDisplayRangeShow.Down := true;
//        SpeedButton5.Down := True;
//      end
//      else begin
//        sbGunEngagementDisplayRangeHide.Down := true;
//        SpeedButton6.Down := True;
//      end;
//
//      if ShowBlind then begin
//        sbGunEngagementDisplayBlindShow.Down := true;
//        SpeedButton7.Down := True;
//      end
//      else begin
//        sbGunEngagementDisplayBlindHide.Down := true;
//        SpeedButton8.Down := True;
//      end;
//
//      case ControlMode of
//        1:
//          begin
//            sbControlModeAuto.Down := true;
//            SpeedButton3.Down := true;
//            ScrollBox7.BringToFront;
//          end;
//        2:
//          begin
//            sbControlModeManual.Down := true;
//            SpeedButton4.Down := true;
//            ScrollBox7.BringToFront;
//          end;
//        3:
//          begin
//            sbControlModeChaff.Down := true;
//            SpeedButton9.Down := true;
//            ScrollBox13.BringToFront;
//          end;
//      end;
//
//      case SalvoMode of
//        1:
//          sbControlSalvoModeCont.Down := true;
//        2:
//          sbControlSalvoModeSalvo.Down := true;
//      end;
//
//      lbGunEngagementQuantity.Caption := IntToStr(Quantity);
//      lblQuantity.Caption := IntToStr(Quantity);
//      editControlSalvoSize.Text := IntToStr(SalvoSize);
//
//  //    if (TargetObject <> nil) and (TargetObject is TT3PlatformInstance) then
//  //      editGunEngagementTargetTrack.Text := TT3PlatformInstance(TargetObject).Track_ID
//  //    else
//  //      editGunEngagementTargetTrack.Text := '';
//
//      for i := 0 to TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Count - 1 do begin
//        device := TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Items[i];
//        if not (device is TT3CounterMeasure) then continue;
//        if device is TT3ChaffLauncher then continue;
//
//        ecm := TT3CounterMeasure(device);
//        if not (device is TT3ChaffOnVehicle) then continue;
//
//        Label107.Caption := IntToStr(TT3ChaffOnVehicle(device).Quantity);
//      end;
//
//      if (focused_platform <> nil) and (focused_platform is TT3PlatformInstance) then
//        editGunEngagementTargetTrack.Text := TT3PlatformInstance(focused_platform).Track_ID
//      else
//        editGunEngagementTargetTrack.Text := '';
//
//      case WeaponStatus of
//        wsAvailable   : lblGunEngagementStatus.Caption   := 'Available';
//        wsUnavailable : lblGunEngagementStatus.Caption   := 'Unavailable';
//        wsDamaged     : lblGunEngagementStatus.Caption   := 'Damaged';
//      end;
//
//      if GunDefinition.FData.Fire_Cntl_Director_Req = 1 then
//      begin
//        btnGunEngagementAssign.Visible := True;
//        btnGunEngagementBreak.Visible := True;
//        //btnGunEngagementFire.Enabled := False;
//      end
//      else
//      begin
//        btnGunEngagementAssign.Visible := false;
//        btnGunEngagementBreak.Visible := false;
//        //btnGunEngagementFire.Enabled := True;
//      end;
//
//      //set buttom button
//      {target assigned}
//      if not Assigned(TargetObject) then
//        Exit;
//
//      if TargetObject.Equals(focused_platform) then
//      begin
//        if TargetObject.IsAssigned then
//        begin
//          btnGunEngagementAssign.Enabled := false;
//          btnGunEngagementBreak.Enabled := True;
//        end
//        else
//        begin
//          btnGunEngagementAssign.Enabled := True;
//          btnGunEngagementBreak.Enabled := false;
//        end;
//      end
//      else
//      begin
//        if Assigned(focused_platform) then
//        begin
//          if focused_platform.IsAssigned then
//          begin
//            btnGunEngagementAssign.Enabled := false;
//            btnGunEngagementBreak.Enabled := True;
//          end
//          else
//          begin
//            btnGunEngagementAssign.Enabled := True;
//            btnGunEngagementBreak.Enabled := false;
//          end;
//        end;
//      end;
//
//      {FIRE : CEASE}
//      if btnGunEngagementAssign.Enabled then begin
//        //btnGunEngagementCease.Enabled := False;
//        btnGunEngagementFire.Enabled := False;
//      end
//      else begin
//       // btnGunEngagementCease.Enabled := true;
//        btnGunEngagementFire.Enabled := true;
//      end;
//
//
//      if btnGunEngagementFire.Enabled then begin
//        btnGunEngagementCease.Enabled := False;
//      end
//      else
//        btnGunEngagementCease.Enabled := true;
//
//    end;
//  end
//
//  //untuk set quantity chaff apabila gun digunakan untuk menembakkan chaff
//  else if Sender.ClassType = TT3ChaffOnVehicle then
//  begin
//      Label107.Caption := IntToStr(TT3ChaffOnVehicle(Sender).Quantity);
//  end;
end;

procedure TfmWeapon.UpdateBombDepthChargeTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  if not(Sender is TT3BombOnVehicle) then
    exit;

  focused_weapon := TT3BombONVehicle(Sender);
  with TT3BombONVehicle(Sender) do
  begin
    case WeaponStatus of
      wsAvailable   : lblBombStatus.Caption   := 'Available';
      wsUnavailable : lblBombStatus.Caption   := 'Unavailable';
      wsDamaged     : lblBombStatus.Caption   := 'Damaged';
    end;

    lblBombQuantity.Caption  := IntToStr(Quantity);
    edtBombControlSalvo.Text := IntToStr(SalvoSize);

    if Boolean(BombDefinition.FData.Rocket_Launcher) then
      btnBombDrop.Caption := 'Launch'
    else
      btnBombDrop.Caption := 'Drop';

    lbl103.Enabled := Boolean(BombDefinition.FData.Rocket_Launcher);
    edtTargetPosition.Enabled := Boolean(BombDefinition.FData.Rocket_Launcher);
    btnPosition.Enabled := Boolean(BombDefinition.FData.Rocket_Launcher);

    Label70.Enabled := TBombType(BombDefinition.FData.Bomb_Type) = btDepthCharge;
    edtBombDepth.Enabled := TBombType(BombDefinition.FData.Bomb_Type) = btDepthCharge;
    Label71.Enabled := TBombType(BombDefinition.FData.Bomb_Type) = btDepthCharge;

//    EdtBombControlSalvo.Enabled := True;
//    lbl80.Visible := True;
//    btnBombDisplayRangeShow.Visible := True;
//    btnBombDisplayRangeHide.Visible := True;
//    btnBombDrop.Caption := 'Launch';

   { if DropWhithoutTarget then
    begin
      chkBombDropWhitoutTarget.Checked := True;
    end
    else
    begin
      chkBombDropWhitoutTarget.Checked := False;
    end;
    btnBombDrop.Enabled := ButtonLaunch;}
  end;

//  if TBombType(TT3BombONVehicle(Sender).BombDefinition.FData.Bomb_Type) = btRocket  then
//  begin
//    lbl103.Enabled := True;
//    edtTargetPosition.Enabled := True;
//    btnPosition.Enabled := True;
//    EdtBombControlSalvo.Enabled := True;
//    lbl80.Visible := True;
//    btnBombDisplayRangeShow.Visible := True;
//    btnBombDisplayRangeHide.Visible := True;
//    btnBombDrop.Caption := 'Launch';
//
////    uT3Bomb.BombTypes := Byte(btRocket);
//  end
//  else
//  begin
//    lbl103.Enabled := False;
//    edtTargetPosition.Enabled := False;
//    btnPosition.Enabled := False;
//    EdtBombControlSalvo.Enabled := True;
//    lbl80.Visible := False;
//    btnBombDisplayRangeShow.Visible := False;
//    btnBombDisplayRangeHide.Visible := False;
//    btnBombDrop.Caption := 'Drop';
//    uT3Bomb.BombTypes := 0;
//  end;
end;

procedure TfmWeapon.UpdateMinesTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  if not(Sender is TT3MineOnVehicle) then
    exit;

  focused_weapon := TT3MineOnVehicle(Sender);

  with TT3MineOnVehicle(Sender) do
  begin
    case WeaponStatus of
      wsAvailable   : lblStatusMines.Caption   := 'Available';
      wsUnavailable : lblStatusMines.Caption   := 'Unavailable';
      wsDamaged     : lblStatusMines.Caption   := 'Damaged';
    end;

    lbMinesQuantity.Caption := IntToStr(Quantity);
    EdtMinesDepth.Text      := FloatToStr(Depth);
  end;

end;

procedure TfmWeapon.UpdateFiringModeText(Obj:TObject; mode : integer);  //mode berdasarkan tag
var
  missile : TT3MissilesOnVehicle;
begin
  missile := TT3MissilesOnVehicle(Obj);

  case mode of
    1 : begin
          editSurfaceToSurfaceMissileFiring.Text := 'RBL';
          HideButtonWeaponWaypoint;

          btnSurfaceToSurfaceMissileLauncherMore.Visible := True;

          lblDestruckRange.Visible    := False;
          lblNmDestruckRange.Visible  := False;
          lblCrossOverRange.Visible   := False;
          lblNmCrossOverRange.Visible := False;
          edtCrossOverRange.Visible   := False;
          edtDestructRange.Visible    := False;
        end;
    2 : begin
          editSurfaceToSurfaceMissileFiring.Text := 'RBLW';
          SetButtonWeaponWaypoint;

          btnSurfaceToSurfaceMissileLauncherMore.Visible := True;

          lblDestruckRange.Visible    := False;
          lblNmDestruckRange.Visible  := False;
          lblCrossOverRange.Visible   := False;
          lblNmCrossOverRange.Visible := False;
          edtCrossOverRange.Visible   := False;
          edtDestructRange.Visible    := False;
        end;
    3 : begin
          editSurfaceToSurfaceMissileFiring.Text := 'BOL';
          HideButtonWeaponWaypoint;

          btnSurfaceToSurfaceMissileLauncherMore.Visible := true;

          lblDestruckRange.Visible    := True;
          lblNmDestruckRange.Visible  := True;
          lblCrossOverRange.Visible   := True;
          lblNmCrossOverRange.Visible := True;
          edtCrossOverRange.Visible   := True;
          edtDestructRange.Visible    := True;

          edtDestructRange.Text := FloatToStr(missile.DestruckRange);
        end;
    4 : begin
          editSurfaceToSurfaceMissileFiring.Text := 'BOLW';
          SetButtonWeaponWaypointBOLW;

          btnSurfaceToSurfaceMissileLauncherMore.Visible := True;

          lblDestruckRange.Visible    := False;
          lblNmDestruckRange.Visible  := False;
          lblCrossOverRange.Visible   := False;
          lblNmCrossOverRange.Visible := False;
          edtCrossOverRange.Visible   := False;
          edtDestructRange.Visible    := False;

          edtDestructRange.Text := FloatToStr(missile.DestruckRange);
        end;
  end;
end;

procedure TfmWeapon.UpdateEngageText(mode : Integer);
begin
  case mode of
    1 : editSurfaceToSurfaceMissileEngangement.Text := 'Ripple';
    2 : editSurfaceToSurfaceMissileEngangement.Text := 'STOT';
    3 : editSurfaceToSurfaceMissileEngangement.Text := 'DTOT';
  end;
end;

function TfmWeapon.DecimalInput(s: string; var Key: Char): Boolean;
var
  a, b  : Integer;
begin
  Result := False;

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Exit;

  a := 0;
  for b := 1 to length(s) do
  begin
    if s[b] = '.' then
      a := a + 1;
  end;

  if a > 0 then
  begin
    if Key = #46 then
      Exit;
  end;

  Result := True;
end;

{$REGION ' Torpedo Method '}

procedure TfmWeapon.UpdateTorpedoStraightGuidanceTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  if not (Sender is TT3TorpedoesOnVehicle) then
    exit;

  focused_weapon := TT3TorpedoesOnVehicle(Sender);

  {$REGION ' Set Status & Quantity Weapon '}
  case TT3TorpedoesOnVehicle(Focused_weapon).WeaponStatus of
    wsAvailable   : lblSRStatus.Caption   := 'Available';
    wsUnavailable : lblSRStatus.Caption   := 'Unavailable';
    wsDamaged     : lblSRStatus.Caption   := 'Damaged';
  end;
  lblSRQuantity.Caption := IntToStr(TT3TorpedoesOnVehicle(Focused_weapon).Quantity);
  {$ENDREGION}

  {$REGION ' Load Data Weapon '}
  TT3TorpedoesOnVehicle(Focused_weapon).ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;

  edtSRTargetTrack.Text       := TT3TorpedoesOnVehicle(Focused_weapon).TargetTrack;
  lblSRTargetIdentity.Caption := TT3TorpedoesOnVehicle(Focused_weapon).TargetIdentity;
  lblSRTargetCourse.Caption   := TT3TorpedoesOnVehicle(Focused_weapon).TargetCourse;
  lblSRTargetSpeed.Caption    := TT3TorpedoesOnVehicle(Focused_weapon).TargetGroundSpeed;
  lblSRTargetDepth.Caption    := TT3TorpedoesOnVehicle(Focused_weapon).TargetAltitude;
  btnSRLaunch.Enabled         := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
  {$ENDREGION}

  {$REGION ' Set Display Buttton '}
  if TT3TorpedoesOnVehicle(Focused_weapon).ShowRange then
    btnSRRangeShow.Down := true
  else
    btnSRRangeHide.Down := true;

  if TT3TorpedoesOnVehicle(Focused_weapon).ShowBlind then
    btnSRBlindShow.Down := true
  else
    btnSRBlindHide.Down := true;
  {$ENDREGION}
end;

procedure TfmWeapon.btnStraightTorpedoOnClick(Sender: TObject);
begin
  inherited;

  if Sender is TSpeedButton then
  begin
    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      case TSpeedButton(Sender).Tag of

        {$REGION ' Range And Blindzone '}
        1, 2, 3, 4 :
        begin
          DisplayButton(TSpeedButton(Sender).Tag)
        end;
        {$ENDREGION}

        {$REGION ' Track Target '}
        5 :
        begin
          TorpedoTarget := nil;

          {$REGION ' Target belum diselect '}
          if not Assigned(focused_platform) then
          begin
            frmTacticalDisplay.addStatus('Target platform not defined');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Target harus sesuai capability '}
          if not TorpedoTargetCheck() then
          begin
            frmTacticalDisplay.addStatus('Invalid target domain');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Target tidak boleh kapal sendiri '}
          if TT3PlatformInstance(FControlled).InstanceIndex = TorpedoTarget.InstanceIndex then
          begin
            frmTacticalDisplay.addStatus('Cannot target own platform');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Set data ke mounted '}
          with TT3TorpedoesOnVehicle(focused_weapon) do
          begin
            TargetTrack       := strTargetID;
            ParentPlatformID  := TT3PlatformInstance(FControlled).InstanceIndex;
            TargetPlatformID  := TorpedoTarget.InstanceIndex;
            SalvoSize         := 1;
            TargetCourse      := FormatCourse(TorpedoTarget.Course);
            TargetGroundSpeed := FormatSpeed(TorpedoTarget.Speed);
            TargetAltitude    := FormatRange(TorpedoTarget.Altitude);
            ButtonLaunch      := True;

            if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
              NoCubicle := 0
            else
              NoCubicle := simMgrClient.FMyCubGroup.FData.Group_Index;
          end;

          {$REGION ' Load Data Weapon '}
          edtSRTargetTrack.Text       := TT3TorpedoesOnVehicle(Focused_weapon).TargetTrack;
          lblSRTargetIdentity.Caption := TT3TorpedoesOnVehicle(Focused_weapon).TargetIdentity;
          lblSRTargetCourse.Caption   := TT3TorpedoesOnVehicle(Focused_weapon).TargetCourse;
          lblSRTargetSpeed.Caption    := TT3TorpedoesOnVehicle(Focused_weapon).TargetGroundSpeed;
          lblSRTargetDepth.Caption    := TT3TorpedoesOnVehicle(Focused_weapon).TargetAltitude;
          btnSRLaunch.Enabled         := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
          {$ENDREGION}

          {$ENDREGION}

          {$REGION ' Paket Synch Panel Ketika Track Target, Koding ini diaktifkan ketika 1 cubicle > 1 console '}
          {if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            rPanel.NoCubicle := 0
          else
            rPanel.NoCubicle := simMgrClient.FMyCubGroup.FData.Group_Index;

          rPanel.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
          rPanel.TargetPlatformID := TT3PlatformInstance(target).InstanceIndex;
          rPanel.TorpType := 5;
          rPanel.WeaponIndex := InstanceIndex;
          rPanel.WeaponName := InstanceName;
          rPanel.TargetTrack := strTargetTrackId;
          rPanel.Param1 := '---';
          rPanel.Param2 := FloatToStr(TT3PlatformInstance(target).Course);
          rPanel.Param3 := FloatToStr(TT3PlatformInstance(target).Speed);
          rPanel.Param4 := FloatToStr(TT3PlatformInstance(target).Altitude);
          rPanel.ButtonLaunch := True;

          SimMgrClient.netSend_CmdTorpedoSyncPanelWeapon(rPanel);
          Sleep(100);}
          {----------------------------------------------------------------}
          {$ENDREGION}
        end;
        {$ENDREGION}

      end;
    end;
  end;

  if Sender is TButton then
  begin
    {$REGION ' Launch Torpedo '}
    TorpedoTarget := nil;
    TorpedoTarget := simMgrClient.FindT3PlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);

    if not Assigned(TorpedoTarget) then
      TorpedoTarget := simMgrClient.FindNonRealPlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);

    if TorpedoPrelaunchCheck() then
    begin
      rTor.ParentPlatformID := TT3TorpedoesOnVehicle(focused_weapon).ParentPlatformID;
      rTor.TargetPlatformID := TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID;
      rTor.NoCubicle        := TT3TorpedoesOnVehicle(focused_weapon).NoCubicle;
      rTor.MissileID        := TT3TorpedoesOnVehicle(focused_weapon).InstanceIndex;
      rTor.ProjectileInstanceIndex := 0;

      SimMgrClient.netSend_CmdLaunch_Torpedo(rTor);

      SimMgrClient.netSend_CmdSetQuantity(rTor.ParentPlatformID, rTor.MissileID, CORD_ID_QUANTITY, CORD_TYPE_WEAPON,
      (TT3TorpedoesOnVehicle(focused_weapon).Quantity - 1));
    end

    {$ENDREGION}
  end;
end;

procedure TfmWeapon.UpdateTorpedoWireGuidedTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  if not(Sender is TT3TorpedoesOnVehicle) then
    exit;

  focused_weapon := TT3TorpedoesOnVehicle(Sender);

  {$REGION ' Set Status & Quantity Weapon '}
  case TT3TorpedoesOnVehicle(Focused_weapon).WeaponStatus of
    wsAvailable   : lblWGStatus.Caption   := 'Available';
    wsUnavailable : lblWGStatus.Caption   := 'Unavailable';
    wsDamaged     : lblWGStatus.Caption   := 'Damaged';
  end;
  lblWGQuantity.Caption := IntToStr(TT3TorpedoesOnVehicle(Focused_weapon).Quantity);
  {$ENDREGION}

  {$REGION ' Load Data Weapon '}
  TT3TorpedoesOnVehicle(Focused_weapon).ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;

  EdtWGTargetTrack.Text       := TT3TorpedoesOnVehicle(Focused_weapon).TargetTrack;
  lblWGTargetIdentity.Caption := TT3TorpedoesOnVehicle(Focused_weapon).TargetIdentity;
  lblWGTargetCourse.Caption   := TT3TorpedoesOnVehicle(Focused_weapon).TargetCourse;
  lblWGTargetSpeed.Caption    := TT3TorpedoesOnVehicle(Focused_weapon).TargetGroundSpeed;
  lblWGTargetDepth.Caption    := TT3TorpedoesOnVehicle(Focused_weapon).TargetAltitude;
  btnWGLaunch.Enabled         := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
  {$ENDREGION}

  {$REGION ' Set Display Buttton '}
  if TT3TorpedoesOnVehicle(Focused_weapon).ShowRange then
    btnWGRangeShow.Down := true
  else
    btnWGRangeHide.Down := true;

  if TT3TorpedoesOnVehicle(Focused_weapon).ShowBlind then
    btnWGBlindShow.Down := true
  else
    btnWGBlindHide.Down := true;
  {$ENDREGION}

end;

procedure TfmWeapon.btnWireGuidedTorpedoOnClick(Sender: TObject);
begin
  inherited;

  if not TorpedoWeaponCheck() then
    Exit;

  if Sender is TSpeedButton then
  begin
    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      case TSpeedButton(Sender).Tag of

        {$REGION ' Range And Blindzone '}
        1, 2, 3, 4 :
        begin
          DisplayButton(TSpeedButton(Sender).Tag)
        end;
        {$ENDREGION}

        {$REGION ' Track Target '}
        5 :
        begin
          TorpedoTarget := nil;

          {$REGION ' Target belum diselect '}
          if not Assigned(focused_platform) then
          begin
            frmTacticalDisplay.addStatus('Target platform not defined');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Target harus sesuai capability '}
          if not TorpedoTargetCheck() then
          begin
            frmTacticalDisplay.addStatus('Invalid target domain');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Target tidak boleh kapal sendiri '}
          if TT3PlatformInstance(FControlled).InstanceIndex = TorpedoTarget.InstanceIndex then
          begin
            frmTacticalDisplay.addStatus('Cannot target own platform');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Set data ke mounted '}
          with TT3TorpedoesOnVehicle(focused_weapon) do
          begin
            TargetTrack       := strTargetID;
            ParentPlatformID  := TT3PlatformInstance(FControlled).InstanceIndex;
            TargetPlatformID  := TorpedoTarget.InstanceIndex;
            SalvoSize         := 1;
            TargetCourse      := FormatCourse(TorpedoTarget.Course);
            TargetGroundSpeed := FormatSpeed(TorpedoTarget.Speed);
            TargetAltitude    := FormatRange(TorpedoTarget.Altitude);
            ButtonLaunch      := True;

            if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
              NoCubicle := 0
            else
              NoCubicle := simMgrClient.FMyCubGroup.FData.Group_Index;
          end;

          {$REGION ' Load Data Weapon '}
          EdtWGTargetTrack.Text       := TT3TorpedoesOnVehicle(Focused_weapon).TargetTrack;
          lblWGTargetIdentity.Caption := TT3TorpedoesOnVehicle(Focused_weapon).TargetIdentity;
          lblWGTargetCourse.Caption   := TT3TorpedoesOnVehicle(Focused_weapon).TargetCourse;
          lblWGTargetSpeed.Caption    := TT3TorpedoesOnVehicle(Focused_weapon).TargetGroundSpeed;
          lblWGTargetDepth.Caption    := TT3TorpedoesOnVehicle(Focused_weapon).TargetAltitude;
          btnWGLaunch.Enabled         := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
          {$ENDREGION}

          {$ENDREGION}

          {$REGION ' Paket Synch Panel Ketika Track Target, Koding ini diaktifkan ketika 1 cubicle > 1 console '}
          {if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            rPanel.NoCubicle := 0
          else
            rPanel.NoCubicle := simMgrClient.FMyCubGroup.FData.Group_Index;

          rPanel.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
          rPanel.TargetPlatformID := TT3PlatformInstance(TorpedoTarget).InstanceIndex;
          rPanel.TorpType := 5;
          rPanel.WeaponIndex := InstanceIndex;
          rPanel.WeaponName := InstanceName;
          rPanel.TargetTrack := strTargetTrackId;
          rPanel.Param1 := '---';
          rPanel.Param2 := FloatToStr(TT3PlatformInstance(target).Course);
          rPanel.Param3 := FloatToStr(TT3PlatformInstance(target).Speed);
          rPanel.Param4 := FloatToStr(TT3PlatformInstance(target).Altitude);
          rPanel.ButtonLaunch := True;

          SimMgrClient.netSend_CmdTorpedoSyncPanelWeapon(rPanel);
          Sleep(100);}
          {----------------------------------------------------------------}
          {$ENDREGION}
        end;
        {$ENDREGION}

      end;
    end;
  end;

  if Sender is TButton then
  begin
    {$REGION ' Launch Torpedo '}
    TorpedoTarget := nil;
    TorpedoTarget := simMgrClient.FindT3PlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);

    if not Assigned(TorpedoTarget) then
      TorpedoTarget := simMgrClient.FindNonRealPlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);

    if TorpedoPrelaunchCheck()then
    begin
      rTor.ParentPlatformID := TT3TorpedoesOnVehicle(focused_weapon).ParentPlatformID;
      rTor.TargetPlatformID := TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID;
      rTor.NoCubicle        := TT3TorpedoesOnVehicle(focused_weapon).NoCubicle;
      rTor.MissileID        := TT3TorpedoesOnVehicle(focused_weapon).InstanceIndex;
      rTor.ProjectileInstanceIndex := 0;

      SimMgrClient.netSend_CmdLaunch_Torpedo(rTor);

      SimMgrClient.netSend_CmdSetQuantity(rTor.ParentPlatformID, rTor.MissileID, CORD_ID_QUANTITY, CORD_TYPE_WEAPON,
      (TT3TorpedoesOnVehicle(focused_weapon).Quantity - 1));
    end;
    {$ENDREGION}
  end;
end;

procedure TfmWeapon.UpdateTorpedoWakeHomingTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  if not(Sender is TT3TorpedoesOnVehicle) then
    exit;

  focused_weapon := TT3TorpedoesOnVehicle(Sender);

  {$REGION ' Set Status & Quantity Weapon '}
  case TT3TorpedoesOnVehicle(Focused_weapon).WeaponStatus of
    wsAvailable   : lblWHStatus.Caption   := 'Available';
    wsUnavailable : lblWHStatus.Caption   := 'Unavailable';
    wsDamaged     : lblWHStatus.Caption   := 'Damaged';
  end;
  lblWHQuantity.Caption := IntToStr(TT3TorpedoesOnVehicle(Focused_weapon).Quantity);
  {$ENDREGION}

  {$REGION ' Load Data Weapon '}
  TT3TorpedoesOnVehicle(Focused_weapon).ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;

  EdtWHTargetTrack.Text       := TT3TorpedoesOnVehicle(Focused_weapon).TargetTrack;
  EdtWHSalvo.Text             := IntToStr(TT3TorpedoesOnVehicle(Focused_weapon).SalvoSize);
  lblWHTargetIdentity.Caption := TT3TorpedoesOnVehicle(Focused_weapon).TargetIdentity;
  lblWHTargetBearing.Caption  := TT3TorpedoesOnVehicle(Focused_weapon).TargetBearing;
  EdtWHLaunchBearing.Text     := FormatCourse(TT3TorpedoesOnVehicle(Focused_weapon).LaunchBearing);
  EdtWHSeekerRange.Text       := FormatRange(TT3TorpedoesOnVehicle(Focused_weapon).SeekerRange);
  btnWHLaunch.Enabled         := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
  {$ENDREGION}

  {$REGION ' Set Display Buttton '}
  if TT3TorpedoesOnVehicle(Focused_weapon).ShowRange then
    btnWHRangeShow.Down := true
  else
    btnWHRangeHide.Down := true;

  if TT3TorpedoesOnVehicle(Focused_weapon).ShowBlind then
    btnWHBlindShow.Down := true
  else
    btnWHBlindHide.Down := true;
  {$ENDREGION}

end;

procedure TfmWeapon.btnWakeHomingTorpedoOnClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;

  if not TorpedoWeaponCheck() then
    Exit;

  if Sender is TSpeedButton then
  begin
    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      case TSpeedButton(Sender).Tag of

        {$REGION ' Range And Blindzone '}
        1, 2, 3, 4 :
        begin
          DisplayButton(TSpeedButton(Sender).Tag)
        end;
        {$ENDREGION}

        {$REGION ' Track Target '}
        5 :
        begin
          TorpedoTarget := nil;

          {$REGION ' Target belum diselect '}
          if not Assigned(focused_platform) then
          begin
            frmTacticalDisplay.addStatus('Target platform not defined');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Target harus sesuai capability '}
          if not TorpedoTargetCheck() then
          begin
            frmTacticalDisplay.addStatus('Invalid target domain');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Target tidak boleh kapal sendiri '}
          if TT3PlatformInstance(FControlled).InstanceIndex = TorpedoTarget.InstanceIndex then
          begin
            frmTacticalDisplay.addStatus('Cannot target own platform');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Set data ke mounted '}
          with TT3TorpedoesOnVehicle(focused_weapon) do
          begin
            TargetTrack       := strTargetID;
            ParentPlatformID  := TT3PlatformInstance(FControlled).InstanceIndex;
            TargetPlatformID  := TorpedoTarget.InstanceIndex;
            SalvoSize         := 1;
            LaunchBearing     := CalcBearing(TT3PlatformInstance(FControlled).getPositionX, TT3PlatformInstance(FControlled).getPositionY,
                                            TorpedoTarget.getPositionX, TorpedoTarget.getPositionY);
            TargetBearing     := FloatToStr(LaunchBearing);
            ButtonLaunch      := True;

            if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
              NoCubicle := 0
            else
              NoCubicle := simMgrClient.FMyCubGroup.FData.Group_Index;
          end;

          {$REGION ' Load Data Weapon '}
          EdtWHTargetTrack.Text       := TT3TorpedoesOnVehicle(Focused_weapon).TargetTrack;
          EdtWHSalvo.Text             := IntToStr(TT3TorpedoesOnVehicle(Focused_weapon).SalvoSize);
          lblWHTargetIdentity.Caption := TT3TorpedoesOnVehicle(Focused_weapon).TargetIdentity;
          lblWHTargetBearing.Caption  := TT3TorpedoesOnVehicle(Focused_weapon).TargetBearing;
          EdtWHLaunchBearing.Text     := FloatToStr(round(TT3TorpedoesOnVehicle(Focused_weapon).LaunchBearing));
          EdtWHSeekerRange.Text       := FloatToStr(TT3TorpedoesOnVehicle(Focused_weapon).SeekerRange);
          btnWHLaunch.Enabled         := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
          {$ENDREGION}

          {$ENDREGION}

          {$REGION ' Paket Synch Panel Ketika Track Target, Koding ini diaktifkan ketika 1 cubicle > 1 console '}
          {if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            rPanel.NoCubicle := 0
          else
            rPanel.NoCubicle := simMgrClient.FMyCubGroup.FData.Group_Index;

          rPanel.ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;
          rPanel.TargetPlatformID := TT3PlatformInstance(TorpedoTarget).InstanceIndex;
          rPanel.TorpType := 9;
          rPanel.WeaponIndex := InstanceIndex;
          rPanel.WeaponName := InstanceName;
          rPanel.TargetTrack := strTargetTrackId;
          rPanel.SalvoSize := 1;
          rPanel.SeekerRange := Round(TorpedoDefinition.FDef.Seeker_TurnOn_Range * C_NauticalMile_To_Yards);
          rPanel.LaunchBearing := douBearingLaunch;
          rPanel.Param1 := '---';
          rPanel.Param2 := strTargetBearing;
          rPanel.ButtonLaunch := True;

          SimMgrClient.netSend_CmdTorpedoSyncPanelWeapon(rPanel);
          Sleep(100);}
          {----------------------------------------------------------------}
          {$ENDREGION}
        end;

        {$ENDREGION}

      end;
    end;
  end;

  if Sender is TButton then
  begin
    {$REGION ' Launch Torpedo '}
    TorpedoTarget := nil;
    TorpedoTarget := simMgrClient.FindT3PlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);

    if not Assigned(TorpedoTarget) then
      TorpedoTarget := simMgrClient.FindNonRealPlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);

    if TorpedoPrelaunchCheck()then
    begin
      rTor.ParentPlatformID := TT3TorpedoesOnVehicle(focused_weapon).ParentPlatformID;
      rTor.TargetPlatformID := TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID;
      rTor.NoCubicle        := TT3TorpedoesOnVehicle(focused_weapon).NoCubicle;
      rTor.MissileID        := TT3TorpedoesOnVehicle(focused_weapon).InstanceIndex;
      rTor.ProjectileInstanceIndex := 0;

      for I := 0 to StrToInt(EdtWHSalvo.Text) - 1 do
      begin
        SimMgrClient.netSend_CmdLaunch_Torpedo(rTor);
      end;

      SimMgrClient.netSend_CmdSetQuantity(rTor.ParentPlatformID, rTor.MissileID, CORD_ID_QUANTITY, CORD_TYPE_WEAPON,
      (TT3TorpedoesOnVehicle(focused_weapon).Quantity - 1));
    end;
    {$ENDREGION}
  end;
end;

procedure TfmWeapon.UpdateTorpedoAirDroppedTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  if not(Sender is TT3TorpedoesOnVehicle) then
    exit;

  focused_weapon := TT3TorpedoesOnVehicle(Sender);

  {$REGION ' Set Status & Quantity Weapon '}
  case TT3TorpedoesOnVehicle(focused_weapon).WeaponStatus of
    wsAvailable   : lblAirDroppedStatus.Caption   := 'Available';
    wsUnavailable : lblAirDroppedStatus.Caption   := 'Unavailable';
    wsDamaged     : lblAirDroppedStatus.Caption   := 'Damaged';
    wsTooHigh     : lblAirDroppedStatus.Caption   := 'Too High';
  end;
  lblADQuantity.Caption   := IntToStr(TT3TorpedoesOnVehicle(focused_weapon).Quantity);
  {$ENDREGION}

  {$REGION ' Load Data Weapon '}
  TT3TorpedoesOnVehicle(Focused_weapon).ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;

  EdtADTargetTrack.Text     := TT3TorpedoesOnVehicle(Focused_weapon).TargetTrack;
  EdtADSearchRadius.Text    := FormatRange(TT3TorpedoesOnVehicle(Focused_weapon).SearchRadius*C_NauticalMile_To_Yards);
  EdtADSearchDepth.Text     := FormatRange(TT3TorpedoesOnVehicle(Focused_weapon).SearchDepth);
  EdtADSafetyCeiling.Text   := FormatRange(TT3TorpedoesOnVehicle(Focused_weapon).SafetyCeiling);

  lblADTargetForce.Caption  := TT3TorpedoesOnVehicle(Focused_weapon).TargetIdentity;
  lblADTargetCourse.Caption := TT3TorpedoesOnVehicle(Focused_weapon).TargetCourse;
  lblADTargetSpeed.Caption  := TT3TorpedoesOnVehicle(Focused_weapon).TargetGroundSpeed;
  lblADTargetDepth.Caption  := TT3TorpedoesOnVehicle(Focused_weapon).TargetAltitude;

  chkADUseLaunchPlatformHeading.Checked     := TT3TorpedoesOnVehicle(Focused_weapon).EnableLaunchBearing;
  chkADLaunchWhithoutTarget.Checked := TT3TorpedoesOnVehicle(Focused_weapon).LaunchWhithoutTarget;

  EdtADLaunchBearing.Enabled := TT3TorpedoesOnVehicle(Focused_weapon).EnableLaunchBearing;
  if TT3TorpedoesOnVehicle(Focused_weapon).EnableLaunchBearing then
    EdtADLaunchBearing.Text := ''
  else
    EdtADLaunchBearing.Text := IntToStr(round(TT3TorpedoesOnVehicle(Focused_weapon).LaunchBearing));

  btnADLaunch.Enabled := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
  {$ENDREGION}

  {$REGION ' Set Display Buttton '}
  if TT3TorpedoesOnVehicle(focused_weapon).ShowRange then
    btnADRangeShow.Down := true
  else
    btnADRangeHide.Down := true;

  if TT3TorpedoesOnVehicle(focused_weapon).ShowBlind then
    btnADBilndShow.Down := true
  else
    btnADBilndHide.Down := true;
  {$ENDREGION}
end;

procedure TfmWeapon.btnAirDroppedTorpedoOnClick(Sender: TObject);
begin
  inherited;

  if not TorpedoWeaponCheck() then
    Exit;

  if Sender is TSpeedButton then
  begin
    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      case TSpeedButton(Sender).Tag of

        {$REGION ' Range And Blindzone '}
        1, 2, 3, 4 :
        begin
          DisplayButton(TSpeedButton(Sender).Tag)
        end;
        {$ENDREGION}

        {$REGION ' Track Target '}
        5 :
        begin
          {$REGION ' Penembakan tanpa target '}
          if (chkADLaunchWhithoutTarget.Checked = true) then
            Exit;
          {$ENDREGION}

          TorpedoTarget := nil;

          {$REGION ' Target belum diselect '}
          if not Assigned(focused_platform) then
          begin
            frmTacticalDisplay.addStatus('Target platform not defined');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Target harus sesuai capability '}
          if not TorpedoTargetCheck() then
          begin
            frmTacticalDisplay.addStatus('Invalid target domain');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Target tidak boleh kapal sendiri '}
          if TT3PlatformInstance(FControlled).InstanceIndex = TorpedoTarget.InstanceIndex then
          begin
            frmTacticalDisplay.addStatus('Cannot target own platform');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Set data ke mounted '}
          with TT3TorpedoesOnVehicle(focused_weapon) do
          begin
            TargetTrack       := strTargetID;
            ParentPlatformID  := TT3PlatformInstance(FControlled).InstanceIndex;
            TargetPlatformID  := TorpedoTarget.InstanceIndex;
            SalvoSize         := 1;
            TargetCourse      := FormatCourse(TorpedoTarget.Course);
            TargetGroundSpeed := FormatSpeed(TorpedoTarget.Speed);
            TargetAltitude    := FormatRange(TorpedoTarget.Altitude);
            ButtonLaunch      := True;

            if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
              NoCubicle := 0
            else
              NoCubicle := simMgrClient.FMyCubGroup.FData.Group_Index;
          end;

          {$REGION ' Load Data Weapon '}
          EdtADTargetTrack.Text       := TT3TorpedoesOnVehicle(Focused_weapon).TargetTrack;
          lblADTargetCourse.Caption   := TT3TorpedoesOnVehicle(Focused_weapon).TargetCourse;
          lblADTargetSpeed.Caption    := TT3TorpedoesOnVehicle(Focused_weapon).TargetGroundSpeed;
          lblADTargetDepth.Caption    := TT3TorpedoesOnVehicle(Focused_weapon).TargetAltitude;
          btnADLaunch.Enabled         := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
          {$ENDREGION}

          {$ENDREGION}

          {$REGION ' Paket Synch Panel Ketika Track Target, Koding ini diaktifkan ketika 1 cubicle > 1 console '}
          {if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            rPanel.NoCubicle  := 0
          else
            rPanel.NoCubicle  := simMgrClient.FMyCubGroup.FData.Group_Index;

          rPanel.ParentPlatformID := intParentPlatformID;
          rPanel.TargetPlatformID := IntTargetPlatformID;
          rPanel.TorpType := 11;
          rPanel.WeaponIndex := InstanceIndex;
          rPanel.WeaponName := InstanceName;
          rPanel.TargetTrack := strTargetTrackId;
          rPanel.SearchRadius := TorpedoDefinition.FDef.Terminal_Circle_Radius;
          rPanel.SearchDepth := TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter;
          rPanel.SafetyCeiling := TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter;
          rPanel.Param1 := '---';
          rPanel.Param2 := strTargetCourse;
          rPanel.Param3 := strTargetGroundSpeed;
          rPanel.Param4 := strTargetAltitude;
          rPanel.ButtonLaunch := True;
          rPanel.NoTarget := False;

          SimMgrClient.netSend_CmdTorpedoSyncPanelWeapon(rPanel);
          Sleep(100);}
          {----------------------------------------------------------------}
          {$ENDREGION}

        end;
        {$ENDREGION}

      end;
    end;
  end;

  if Sender is TButton then
  begin
    {$REGION ' Launch Torpedo '}
    TorpedoTarget := nil;
    TorpedoTarget := simMgrClient.FindT3PlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);

    if not Assigned(TorpedoTarget) then
      TorpedoTarget := simMgrClient.FindNonRealPlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);

    if TorpedoPrelaunchCheck() or (chkADLaunchWhithoutTarget.Checked = True)then
    begin
      rTor.ParentPlatformID := TT3TorpedoesOnVehicle(focused_weapon).ParentPlatformID;
      rTor.TargetPlatformID := TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID;
      rTor.NoCubicle        := TT3TorpedoesOnVehicle(focused_weapon).NoCubicle;
      rTor.MissileID        := TT3TorpedoesOnVehicle(focused_weapon).InstanceIndex;
      rTor.ProjectileInstanceIndex := 0;

      SimMgrClient.netSend_CmdLaunch_Torpedo(rTor);

      SimMgrClient.netSend_CmdSetQuantity(rTor.ParentPlatformID, rTor.MissileID, CORD_ID_QUANTITY, CORD_TYPE_WEAPON,
      (TT3TorpedoesOnVehicle(focused_weapon).Quantity - 1));
    end;
    {$ENDREGION}
  end;
end;

procedure TfmWeapon.UpdateTorpedoActivePassiveTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  if not(Sender is TT3TorpedoesOnVehicle) then
    exit;

  focused_weapon := TT3TorpedoesOnVehicle(Sender);

  {$REGION ' Set Status & Quantity Weapon '}
  case TT3TorpedoesOnVehicle(focused_weapon).WeaponStatus of
    wsAvailable   : lblAPGStatus.Caption   := 'Available';
    wsUnavailable : lblAPGStatus.Caption   := 'Unavailable';
    wsDamaged     : lblAPGStatus.Caption   := 'Damaged';
  end;
  lblAPGQuantity.Caption   := IntToStr(TT3TorpedoesOnVehicle(focused_weapon).Quantity);
  {$ENDREGION}

  {$REGION ' Load Data Weapon '}
  TT3TorpedoesOnVehicle(Focused_weapon).ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex;

  EdtAPGTargetTrack.Text  := TT3TorpedoesOnVehicle(Focused_weapon).TargetTrack;
  EdtAPGSearchRadius.Text := FormatRange(TT3TorpedoesOnVehicle(Focused_weapon).SearchRadius * C_NauticalMile_To_Yards);
  EdtAPGSearchDepth.Text  := FormatRange(TT3TorpedoesOnVehicle(Focused_weapon).SearchDepth);
  EdtAPGSafetyCeiling.Text:= FormatRange(TT3TorpedoesOnVehicle(Focused_weapon).SafetyCeiling);
  EdtAPGSeekerRange.Text  := FormatRange(TT3TorpedoesOnVehicle(Focused_weapon).SeekerRange * C_NauticalMile_To_Yards);
  btnAPGLaunch.Enabled    := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
  {$ENDREGION}

  {$REGION ' Set Display Buttton '}
  if TT3TorpedoesOnVehicle(focused_weapon).ShowRange then
    btnAPGRangeShow.Down := true
  else
    btnAPGRangeHide.Down := true;

  if TT3TorpedoesOnVehicle(focused_weapon).ShowBlind then
    btnAPGBilndShow.Down := true
  else
    btnAPGBilndHide.Down := true;
  {$ENDREGION}
end;

procedure TfmWeapon.btnActivePasiveTorpedoOnClick(Sender: TObject);
begin
  inherited;

  if not TorpedoWeaponCheck() then
    Exit;

  if Sender is TSpeedButton then
  begin
    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      case TSpeedButton(Sender).Tag of

        {$REGION ' Range And Blindzone '}
        1, 2, 3, 4 :
        begin
          DisplayButton(TSpeedButton(Sender).Tag)
        end;
        {$ENDREGION}

        {$REGION ' Track Target '}
        5 :
        begin
          TorpedoTarget := nil;

          {$REGION ' Target belum diselect '}
          if not Assigned(focused_platform) then
          begin
            frmTacticalDisplay.addStatus('Target platform not defined');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Target harus sesuai capability '}
          if not TorpedoTargetCheck() then
          begin
            frmTacticalDisplay.addStatus('Invalid target domain');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Target tidak boleh kapal sendiri '}
          if TT3PlatformInstance(FControlled).InstanceIndex = TorpedoTarget.InstanceIndex then
          begin
            frmTacticalDisplay.addStatus('Cannot target own platform');
            exit;
          end;
          {$ENDREGION}

          {$REGION ' Set data ke mounted '}
          with TT3TorpedoesOnVehicle(focused_weapon) do
          begin
            TargetTrack       := strTargetID;
            ParentPlatformID  := TT3PlatformInstance(FControlled).InstanceIndex;
            TargetPlatformID  := TorpedoTarget.InstanceIndex;
            SalvoSize         := 1;
            ButtonLaunch      := True;

            if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
              NoCubicle := 0
            else
              NoCubicle := simMgrClient.FMyCubGroup.FData.Group_Index;
          end;

          {$REGION ' Load Data Weapon '}
          EdtAPGTargetTrack.Text      := TT3TorpedoesOnVehicle(Focused_weapon).TargetTrack;
          btnAPGLaunch.Enabled        := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
          {$ENDREGION}

          {$ENDREGION}

          {$REGION ' Paket Synch Panel Ketika Track Target, Koding ini diaktifkan ketika 1 cubicle > 1 console '}
          {if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
            rPanel.NoCubicle  := 0
          else
            rPanel.NoCubicle  := simMgrClient.FMyCubGroup.FData.Group_Index;

          rPanel.NoCubicle := intNoCubicle;
          rPanel.ParentPlatformID := intParentPlatformID;
          rPanel.TargetPlatformID := IntTargetPlatformID;
          rPanel.TorpType := 10;
          rPanel.WeaponIndex := InstanceIndex;
          rPanel.WeaponName := InstanceName;
          rPanel.TargetTrack := strTargetTrackId;
          rPanel.SalvoSize := 1;
          rPanel.SearchRadius := TorpedoDefinition.FDef.Terminal_Circle_Radius;
          rPanel.SearchDepth := TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter;
          rPanel.SafetyCeiling := TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter;
          rPanel.SeekerRange := TorpedoDefinition.FDef.Seeker_TurnOn_Range * C_NauticalMile_To_Yards;
          rPanel.ButtonLaunch := True;

          SimMgrClient.netSend_CmdTorpedoSyncPanelWeapon(rPanel);
          Sleep(100);}
          {----------------------------------------------------------------}
          {$ENDREGION}

        end
        {$ENDREGION}

      end;
    end;
  end;

  if Sender is TButton then
  begin
    {$REGION ' Launch Torpedo '}
    TorpedoTarget := nil;
    TorpedoTarget := simMgrClient.FindT3PlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);

    if not Assigned(TorpedoTarget) then
      TorpedoTarget := simMgrClient.FindNonRealPlatformByID(TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID);

    if TorpedoPrelaunchCheck()then
    begin
      rTor.ParentPlatformID := TT3TorpedoesOnVehicle(focused_weapon).ParentPlatformID;
      rTor.TargetPlatformID := TT3TorpedoesOnVehicle(focused_weapon).TargetPlatformID;
      rTor.NoCubicle        := TT3TorpedoesOnVehicle(focused_weapon).NoCubicle;
      rTor.MissileID        := TT3TorpedoesOnVehicle(focused_weapon).InstanceIndex;
      rTor.ProjectileInstanceIndex := 0;

      SimMgrClient.netSend_CmdLaunch_Torpedo(rTor);

      SimMgrClient.netSend_CmdSetQuantity(rTor.ParentPlatformID, rTor.MissileID, CORD_ID_QUANTITY, CORD_TYPE_WEAPON,
      (TT3TorpedoesOnVehicle(focused_weapon).Quantity - 1));
    end;
    {$ENDREGION}
  end;
end;

procedure TfmWeapon.WHbtn(Sender: TObject);
var
  _value  : Double;
begin
  inherited;

  with TT3TorpedoesOnVehicle(focused_weapon) do
  begin
    _value := Round(TorpedoDefinition.FDef.Seeker_TurnOn_Range * C_NauticalMile_To_Yards);
    SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoWakeHoming), 3, InstanceIndex, InstanceName, _value);
  end;
end;

procedure TfmWeapon.WHKeyPress(Sender: TObject; var Key: Char);
var
  _valueInt   : Integer;
  _valueFloat : Double;
begin
  if not DecimalInput(TEdit(sender).Text, Key) then
    Key := #0;

  if Key = #13 then
  begin
    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      case TEdit(sender).Tag of
        1 :
        begin
          TryStrToInt(TEdit(Sender).Text, _valueInt);
          SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoWakeHoming), 1, InstanceIndex, InstanceName, _valueInt);
        end;
        2 :
        begin
          TryStrToFloat(TEdit(Sender).Text, _valueFloat);
          SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoWakeHoming), 2, InstanceIndex, InstanceName, _valueInt);
        end;
        3 : {Seeker Range On}
        begin
          TryStrToFloat(TEdit(Sender).Text, _valueFloat);

          if Boolean(TorpedoDefinition.FDef.Fixed_Seeker_TurnOn_Range) then
            SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoWakeHoming), TEdit(sender).Tag, InstanceIndex, InstanceName,_valueFloat)
          else
          begin
            ShowMessage('Seeker Range Can not modified by operator ');
            TEdit(Sender).Text := FloatToStr(TorpedoDefinition.FDef.Seeker_TurnOn_Range * C_NauticalMile_To_Yards);
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.ADbtn(Sender: TObject);
var
  _value  : Double;
begin
  inherited;

  with TT3TorpedoesOnVehicle(focused_weapon) do
  begin
    case TButton(Sender).Tag of
      1 :
      begin
        _value := Round(TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter);
        SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoAirDropped), 2, InstanceIndex, InstanceName, _value);
      end;
      2 :
      begin
        _value := Round(TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter);
        SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoAirDropped), 3, InstanceIndex, InstanceName, _value);
      end;
    end;
  end;
end;

procedure TfmWeapon.AddFlag(id: integer);
var
  ObjectFlagPoint : TFlagPoint;
begin
  ObjectFlagPoint := simMgrClient.DrawFlagPoint.GetFlagPoint(id);
  if Assigned(ObjectFlagPoint)  then
  begin
    ObjectFlagPoint.Post.X := MapPositionX;
    ObjectFlagPoint.Post.Y := MapPositionY;
  end
  else
  begin
    ObjectFlagPoint := TFlagPoint.Create(simMgrClient.Converter);
    ObjectFlagPoint.PointId := id;
    ObjectFlagPoint.Post.X := MapPositionX;
    ObjectFlagPoint.Post.Y := MapPositionY;
    simMgrClient.DrawFlagPoint.FList.Add(ObjectFlagPoint);
  end;
end;

procedure TfmWeapon.ADKeyPress(Sender: TObject; var Key: Char);
var
  _valueFloat : Double;
begin
  if not DecimalInput(TEdit(sender).Text, Key) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(TEdit(Sender).Text, _valueFloat);

    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      case TEdit(sender).Tag of
        1: {Search Radius}
        begin
          if Boolean(TorpedoDefinition.FDef.Fixed_Circle_Radius) then
            SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoAirDropped), TEdit(sender).Tag,
            InstanceIndex, InstanceName,_valueFloat / C_NauticalMile_To_Yards)
          else
          begin
            ShowMessage('Search Radius Can not modified by operator ');
            TEdit(Sender).Text := FloatToStr(TorpedoDefinition.FDef.Terminal_Circle_Radius * C_NauticalMile_To_Yards);
            Exit;
          end;
        end;
        2: {Search Depth}
        begin
          if _valueFloat >  Round(TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter) then
          begin
            ShowMessage('Over maximum capability ');
            TEdit(Sender).Text := FloatToStr(TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter);
            Exit;
          end
          else
            SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoAirDropped), TEdit(sender).Tag, InstanceIndex, InstanceName,_valueFloat)
        end;
        3: {Safety Ceiling}
        begin
          if _valueFloat >  Round(TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter) then
          begin
            ShowMessage('Over maximum capability ');
            TEdit(Sender).Text := FloatToStr(TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter);
            Exit;
          end
          else
            SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoAirDropped), TEdit(sender).Tag, InstanceIndex, InstanceName,_valueFloat)
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.chkADLaunchWhithoutTargetClick(Sender: TObject);
begin
  inherited;

  {$REGION ' Game Status '}
  if not simMgrClient.IsGameStart then
  begin
    frmTacticalDisplay.addStatus('Game Frozen');
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Own Ship Status '}
  if not Assigned(FControlled) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined');
    exit;
  end;
  {$ENDREGION}

  {$REGION ' Weapon Status '}
  if focused_weapon = nil then
  begin
    frmTacticalDisplay.addStatus('Not Found Selected Weapon');
    Exit;
  end;

  if TT3TorpedoesOnVehicle(focused_weapon).WeaponStatus = wsDamaged then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Damaged');
    Exit;
  end;

  if not(focused_weapon is TT3TorpedoesOnVehicle)then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Not Torpedo');
    Exit;
  end;

  {$ENDREGION}

  {$REGION ' Reset Data Target '}
  EdtADTargetTrack.Text     := '';
  lblADTargetCourse.Caption := '---';
  lblADTargetSpeed.Caption  := '---';
  lblADTargetDepth.Caption  := '---';
  {$ENDREGION}

  if chkADLaunchWhithoutTarget.Checked = True then
  begin
    {$REGION ' Set data ke mounted '}
    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      TargetTrack       := '';
      ParentPlatformID  := TT3PlatformInstance(FControlled).InstanceIndex;
      TargetPlatformID  := TT3PlatformInstance(FControlled).InstanceIndex;
      SalvoSize         := 1;
      TargetCourse      := '---';
      TargetGroundSpeed := '---';
      TargetAltitude    := '---';
      ButtonLaunch      := True;

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
        NoCubicle := 0
      else
        NoCubicle := simMgrClient.FMyCubGroup.FData.Group_Index;

      LaunchWhithoutTarget := True;
    end;

    btnADLaunch.Enabled       := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
    btnADTargetTrack.Enabled  := False;

    {$ENDREGION}

    {$REGION ' Paket Synch Panel Ketika Track Target, Koding ini diaktifkan ketika 1 cubicle > 1 console '}
    {if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      rPanel.NoCubicle  := 0
    else
      rPanel.NoCubicle  := simMgrClient.FMyCubGroup.FData.Group_Index;

    rPanel.ParentPlatformID := ParentPlatformID;
    rPanel.TargetPlatformID := TargetPlatformID;
    rPanel.TorpType         := 11;
    rPanel.WeaponIndex      := InstanceIndex;
    rPanel.WeaponName       := InstanceName;
    rPanel.TargetTrack      := '---';
    rPanel.SearchRadius     := TorpedoDefinition.FDef.Terminal_Circle_Radius;
    rPanel.SearchDepth      := TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter;
    rPanel.SafetyCeiling    := TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter;
    rPanel.Param1           := '---';
    rPanel.Param2           := '---';
    rPanel.Param3           := '---';
    rPanel.Param4           := '---';
    rPanel.ButtonLaunch     := True;
    rPanel.NoTarget         := True;

    SimMgrClient.netSend_CmdTorpedoSyncPanelWeapon(rPanel);
    Sleep(100);}
    {----------------------------------------------------------------}
    {$ENDREGION}
  end
  else
  begin
    {$REGION ' Set data ke mounted '}
    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      TargetTrack   := '';
      ButtonLaunch  := False;
      LaunchWhithoutTarget := False;
    end;

    btnADLaunch.Enabled       := TT3TorpedoesOnVehicle(Focused_weapon).ButtonLaunch;
    btnADTargetTrack.Enabled  := True;
    {$ENDREGION}
  end;
end;

procedure TfmWeapon.chkADUseLaunchPlatformHeadingClick(Sender: TObject);
begin
  inherited;

  if not TorpedoWeaponCheck() then
    Exit;

  with TT3TorpedoesOnVehicle(focused_weapon) do
  begin
    if chkADUseLaunchPlatformHeading.Checked = True then
    begin
      SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoAirDropped), 5, InstanceIndex, InstanceName, 1);
      SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoAirDropped), 4, InstanceIndex, InstanceName, TT3PlatformInstance(FControlled).Heading);
    end
    else
    begin
      SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoAirDropped), 5, InstanceIndex, InstanceName, 0);
    end;
  end;
end;

procedure TfmWeapon.APGbtn(Sender: TObject);
var
  _value  : Double;
begin
  with TT3TorpedoesOnVehicle(focused_weapon) do
  begin
    case TButton(Sender).Tag of
      2 : _value := TorpedoDefinition.FDef.Terminal_Circle_Radius;
      3 : _value := TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter;
      4 : _value := TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter;
      5 : _value := TorpedoDefinition.FDef.Seeker_TurnOn_Range;
    end;
    SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActivePassive), TButton(Sender).Tag, InstanceIndex, InstanceName, _value);
  end;
end;

procedure TfmWeapon.APGKeyPress(Sender: TObject; var Key: Char);
var
  _valueFloat : Double;
begin
  if not DecimalInput(TEdit(sender).Text, Key) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(TEdit(Sender).Text, _valueFloat);

    with TT3TorpedoesOnVehicle(focused_weapon) do
    begin
      case TEdit(sender).Tag of
        2: {Search Radius}
        begin
          if Boolean(TorpedoDefinition.FDef.Fixed_Circle_Radius) then
            SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActivePassive), TEdit(sender).Tag, InstanceIndex, InstanceName,_valueFloat / C_NauticalMile_To_Yards)
          else
          begin
            ShowMessage('Search Radius Can not modified by operator ');
            TEdit(Sender).Text := FloatToStr(TorpedoDefinition.FDef.Terminal_Circle_Radius * C_NauticalMile_To_Yards);
            Exit;
          end;
        end;
        3: {Search Depth}
        begin
          if _valueFloat >  Round(TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter) then
          begin
            ShowMessage('Over maximum capability ');
            TEdit(Sender).Text := FloatToStr(TorpedoDefinition.FDef.Default_Depth * C_Feet_To_Meter);
            Exit;
          end
          else
            SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActivePassive), TEdit(sender).Tag, InstanceIndex, InstanceName,_valueFloat)
        end;
        4: {Safety Ceiling}
        begin
          if _valueFloat >  Round(TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter) then
          begin
            ShowMessage('Over maximum capability ');
            TEdit(Sender).Text := FloatToStr(TorpedoDefinition.FDef.Acoustic_Torp_Ceiling_Depth * C_Feet_To_Meter);
            Exit;
          end
          else
            SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActivePassive), TEdit(sender).Tag, InstanceIndex, InstanceName,_valueFloat)
        end;
        5: {Seeker Range On}
        begin
          if Boolean(TorpedoDefinition.FDef.Fixed_Seeker_TurnOn_Range) then
            SimMgrClient.netSend_CmdTorpedoProperty(ParentPlatformID, Integer(wcTorpedoActivePassive), TEdit(sender).Tag, InstanceIndex, InstanceName,_valueFloat / C_NauticalMile_To_Yards)
          else
          begin
            ShowMessage('Seeker Range Can not modified by operator ');
            TEdit(Sender).Text := FloatToStr(TorpedoDefinition.FDef.Seeker_TurnOn_Range * C_NauticalMile_To_Yards);
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmWeapon.DisplayButton(ButtonTag: Integer);
begin
  with TT3TorpedoesOnVehicle(focused_weapon) do
  begin
    case ButtonTag of
      {$REGION ' Show Range '}
      1 : begin
            FVisibleShowRange := True;
            ShowRange         := True;
            ShowRangeSelected := (ShowRange and FVisibleShowRange);
            HideRangeSensor;
          end;
      {$ENDREGION}

      {$REGION ' Hide Range '}
      2 : begin
            FVisibleShowRange := False;
            ShowRange         := False;
            ShowRangeSelected := (ShowRange and FVisibleShowRange);
          end;
      {$ENDREGION}

      {$REGION ' Show Blindzone '}
      3 : begin
            FVisibleShowBlind := True;
            ShowBlind         := True;
            ShowBlindSelected := (ShowBlind and FVisibleShowBlind);
            HideBlindSensor;
          end;
      {$ENDREGION}

      {$REGION ' Hide Blindzone '}
      4 : begin
            FVisibleShowBlind := False;
            ShowBlind         := False;
            ShowBlindSelected := (ShowBlind and FVisibleShowBlind);
          end;
      {$ENDREGION}
    end;
  end;
end;

function TfmWeapon.TorpedoTargetCheck(): boolean;
var
  _validTarget   : boolean;
  sObject : TSimObject;
  _nonRealtimeType, _targetDomain, _targetID, _weaponCapability  : Integer;

begin
  result := False;
  _validTarget := False;

  if Assigned (focused_platform)then
  begin
    {$REGION ' DetectedTrack Section '}
    if focused_platform is TT3DetectedTrack then
    begin
      sObject := simMgrClient.findDetectedTrack(focused_platform);

      if Assigned(sObject) then
        strTargetID := FormatTrackNumber(TT3DetectedTrack(sObject).TrackNumber)
      else
      begin
        strTargetID := TT3PlatformInstance(focused_platform).TrackLabel;

        if strTargetID = '' then
          strTargetID := (TT3PlatformInstance(focused_platform).TrackNumber).ToString;
      end;

      _targetID         := TT3PlatformInstance(TT3DetectedTrack(focused_platform).TrackObject).InstanceIndex;
      _targetDomain     := TT3PlatformInstance(TT3DetectedTrack(focused_platform).TrackObject).PlatformDomain;
      TorpedoTarget     := simMgrClient.FindT3PlatformByID(_targetID);
//      strTargetID       := IntToStr(TT3DetectedTrack(focused_platform).TrackNumber);
      _nonRealtimeType  := 5;{diisi nilai 5, sebagai penanda bukan nonreal vehicle}
    end
    {$ENDREGION}

    {$REGION ' NonRealVehicle Section '}
    else if focused_platform is TT3NonRealVehicle then
    begin
      sObject := simMgrClient.findDetectedTrack(focused_platform);

      if Assigned(sObject) then
        strTargetID := FormatTrackNumber(TT3DetectedTrack(sObject).TrackNumber)
      else
      begin
        strTargetID := TT3PlatformInstance(focused_platform).TrackLabel;

        if strTargetID = '' then
          strTargetID := (TT3PlatformInstance(focused_platform).TrackNumber).ToString;
      end;

      _targetDomain     := TT3PlatformInstance(focused_platform).PlatformDomain;
      TorpedoTarget     := TT3PlatformInstance(focused_platform);
//      strTargetID       := IntToStr(TT3DetectedTrack(focused_platform).TrackNumber);
      _nonRealtimeType  := TT3NonRealVehicle(focused_platform).NRPType;
    end
    {$ENDREGION}

    {$REGION ' TT3PlatformInstance Section '}
    else
    begin
      _targetDomain     := TT3PlatformInstance(focused_platform).PlatformDomain;
      TorpedoTarget     := TT3PlatformInstance(focused_platform);
      strTargetID       := TT3PlatformInstance(focused_platform).Track_ID;
      _nonRealtimeType  := 5;
    end;
    {$ENDREGION}

    if Assigned(focused_weapon) then
    begin
      _weaponCapability  := TT3TorpedoesOnVehicle(focused_weapon).TorpedoDefinition.FDef.Primary_Target_Domain;

      case TT3TorpedoesOnVehicle(focused_weapon).WeaponCategory of

        {$REGION ' Straigth, Wire Guided, Wake Homming Section '}
        wcTorpedoStraigth, wcTorpedoWireGuided, wcTorpedoWakeHoming :
        begin
          if (focused_platform is TT3NonRealVehicle) then
          begin
            if (_nonRealtimeType <> nrpPoint)then
              exit;
          end;

          case _weaponCapability of
            {any within capability, surface / subsurface}
            0 : _validTarget := (_targetDomain = 1) or (_targetDomain = 2);
            {surface domain}
            2 : _validTarget := (_targetDomain = 1);
            {subsurface domain}
            4 : _validTarget := (_targetDomain = 2);
          end;
        end;
        {$ENDREGION}

        {$REGION ' Air Drop Section '}
        wcTorpedoAirDropped :
        begin
          if (focused_platform is TT3NonRealVehicle)then
            _validTarget := True
          else
          begin
            case _weaponCapability of
              {any within capability, surface / subsurface}
              0 : _validTarget := (_targetDomain = 1) or (_targetDomain = 2);
              {surface domain}
              2 :_validTarget := (_targetDomain = 1);
              {subsurface domain}
              4 : _validTarget := (_targetDomain = 2);
            end;
          end;
        end;
        {$ENDREGION}

        {$REGION ' Yang lain Section '}

        {Passive Guided Torpedo}
        wcTorpedoPassiveAcoustic :
        begin
          if (focused_platform is TT3NonRealVehicle) then
            exit
          else
          begin
            case _weaponCapability of
              {any within capability, surface / subsurface}
              0 : _validTarget := (_targetDomain = 1) or (_targetDomain = 2);
              {surface domain}
              2 :_validTarget := (_targetDomain = 1);
              {subsurface domain}
              4 : _validTarget := (_targetDomain = 2);
            end;
          end;
        end;

        {Active Passive Torpedo}
        wcTorpedoActivePassive :
        begin
          if (focused_platform is TT3NonRealVehicle) and (not ((_nonRealtimeType = nrpPoint) or (_nonRealtimeType = nrpBearing)))then
            exit;

          case _weaponCapability of
            {any within capability, surface / subsurface}
            0 : _validTarget := (_targetDomain = 1) or (_targetDomain = 2);
            {surface domain}
            2 :_validTarget := (_targetDomain = 1);
            {subsurface domain}
            4 : _validTarget := (_targetDomain = 2);
          end;

        end;
        {$ENDREGION}
      end;
    end;
  end;

  result := _validTarget;
end;

function TfmWeapon.TorpedoWeaponCheck(): boolean;
begin
  Result := False;

  {$REGION ' Game Status '}
  if not simMgrClient.IsGameStart then
  begin
    frmTacticalDisplay.addStatus('Game Frozen');
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Own Ship Status '}
  if not Assigned(FControlled) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined');
    exit;
  end;
  {$ENDREGION}

  {$REGION ' Weapon Status '}
  if focused_weapon = nil then
  begin
    frmTacticalDisplay.addStatus('Not Found Selected Weapon');
    Exit;
  end;

  if TT3TorpedoesOnVehicle(focused_weapon).WeaponStatus = wsDamaged then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Damaged');
    Exit;
  end;

  if not(focused_weapon is TT3TorpedoesOnVehicle)then
  begin
    frmTacticalDisplay.addStatus('Selected Weapon Is Not Torpedo');
    Exit;
  end;

  {$ENDREGION}

  Result := True
end;

function TfmWeapon.TorpedoPrelaunchCheck(): boolean;
var
  id : Integer;
begin
  Result := True;

  {$REGION ' Target Tidak boleh null '}
  if not(Assigned(TorpedoTarget)) then
  begin
    frmTacticalDisplay.addStatus('Target is not selected ');
    Result := false;
    exit;
  end;
  {$ENDREGION}

  {$REGION ' Quantity harus lebi dari salvo '}
  if (TT3TorpedoesOnVehicle(focused_weapon).SalvoSize < 0) then
  begin
    frmTacticalDisplay.addStatus('Cek Salvo ');
    Result := false;
    exit;
  end;
  {$ENDREGION}

  {$REGION ' Quantity harus lebi dari salvo '}
  if (TT3TorpedoesOnVehicle(focused_weapon).Quantity < TT3TorpedoesOnVehicle(focused_weapon).SalvoSize) then
  begin
    frmTacticalDisplay.addStatus('Cek Quantity ');
    Result := false;
    exit;
  end;
  {$ENDREGION}

  case TT3TorpedoesOnVehicle(focused_weapon).WeaponCategory of

    {$REGION ' Straigth, Wire Guided, Wake Homing, Active Passive Section '}
    wcTorpedoStraigth, wcTorpedoWireGuided, wcTorpedoWakeHoming, wcTorpedoActivePassive :
    begin

      {$REGION ' Target tidak boleh diluar range'}
      if TT3TorpedoesOnVehicle(focused_weapon).OutsideRange(TorpedoTarget, id) then
      begin
        case id of
          0 : MessageDlg('Target is too close', mtInformation, [mbOK], 0);
          1 : MessageDlg('Target is too far', mtInformation, [mbOK], 0);
        end;

        result := false;
        exit;
      end;
      {$ENDREGION}

      {$REGION ' Target tidak boleh didalam blindzone '}
      if TT3TorpedoesOnVehicle(focused_weapon).InsideBlindZone(TorpedoTarget) then
      begin
        MessageDlg('Target inside blind zone area', mtInformation, [mbOK], 0);
        result := false;
        exit;
      end;
      {$ENDREGION}

    end;
    {$ENDREGION}

    {$REGION ' Air Drop & Passive Guided Section '}
    wcTorpedoAirDropped,
    wcTorpedoPassiveAcoustic :
    begin
      result := true;
      exit;
    end;
    {$ENDREGION}

  end;
end;

{$ENDREGION}

end.

