unit ufmWeapon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ufmControlled, Menus,
  uSimObjects,
  uDBAssetObject, uDBAsset_Weapon, uGameData_TTT, tttData;

type
  TfmWeapon = class(TfmControlled)
    PanelTacticalWeapons: TPanel;
    grbWakeHomingTorpedos: TGroupBox;
    Label400: TLabel;
    lblWakeHomingStatus: TLabel;
    Label418: TLabel;
    lblWakeHomingQuantity: TLabel;
    Label420: TLabel;
    Bevel82: TBevel;
    Label421: TLabel;
    Label422: TLabel;
    Bevel84: TBevel;
    Label423: TLabel;
    Label425: TLabel;
    Label429: TLabel;
    lblWakeHomingTargetIdentity: TLabel;
    Label431: TLabel;
    Label435: TLabel;
    Label436: TLabel;
    lbWakeHomingTargetTarget: TLabel;
    Label440: TLabel;
    Label441: TLabel;
    Label442: TLabel;
    Bevel86: TBevel;
    Label443: TLabel;
    Bevel87: TBevel;
    Label444: TLabel;
    btnWakeHomingTargetTrack: TSpeedButton;
    sbWakeHomingDisplayRangeShow: TSpeedButton;
    sbWakeHomingDisplayRangeHide: TSpeedButton;
    sbWakeHomingDisplayBlindShow: TSpeedButton;
    sbWakeHomingDisplayBlindHide: TSpeedButton;
    edtWakeHomingTargetTrack: TEdit;
    btnWakeHomingLaunch: TButton;
    edtWakeHomingControlSalvo: TEdit;
    editWakeHomingTargetLaunch: TEdit;
    editWakeHomingTargetSeeker: TEdit;
    btnWakeHomingTargetSeekerDefault: TButton;
    grbWireGuidedTorpedo: TGroupBox;
    Label326: TLabel;
    lblWireGuidedTorpedoStatus: TLabel;
    Label372: TLabel;
    lblWireGuidedTorpedoQuantity: TLabel;
    Label401: TLabel;
    Bevel81: TBevel;
    Label402: TLabel;
    Label404: TLabel;
    Bevel83: TBevel;
    Label408: TLabel;
    Label417: TLabel;
    Label424: TLabel;
    lblWireGuidedTorpedoTargetIdentity: TLabel;
    Label426: TLabel;
    Label427: TLabel;
    Label428: TLabel;
    lblWireGuidedTorpedoTargetCourse: TLabel;
    lblWireGuidedTorpedoTargetGround: TLabel;
    lblWireGuidedTorpedoTargetDepth: TLabel;
    Label432: TLabel;
    Label433: TLabel;
    Label434: TLabel;
    Bevel85: TBevel;
    btnlWireGuidedTorpedoTargetTrack: TSpeedButton;
    sblWireGuidedTorpedoDisplayRangeShow: TSpeedButton;
    sblWireGuidedTorpedodDisplayRangeHide: TSpeedButton;
    sblWireGuidedTorpedoDisplayBlindShow: TSpeedButton;
    sblWireGuidedTorpedoDisplayBlindHide: TSpeedButton;
    editlWireGuidedTorpedoTargetTrack: TEdit;
    btnlWireGuidedTorpedoLaunch: TButton;
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
    Label430: TLabel;
    lblStatusStraightRunningTorpedos: TLabel;
    Label438: TLabel;
    lbStraightRunningTorpedosQuantity: TLabel;
    Label445: TLabel;
    Bevel88: TBevel;
    Label446: TLabel;
    Label447: TLabel;
    Bevel89: TBevel;
    Label448: TLabel;
    Label449: TLabel;
    Label450: TLabel;
    lbStraightRunningTorpedosTargetIdentity: TLabel;
    Label452: TLabel;
    Label453: TLabel;
    Label454: TLabel;
    lbStraightRunningTorpedosTargetCourse: TLabel;
    Label456: TLabel;
    Label457: TLabel;
    Label458: TLabel;
    Bevel90: TBevel;
    lbStraightRunningTorpedosTargetGround: TLabel;
    lbStraightRunningTorpedosTargetDepth: TLabel;
    btnStraightRunningTorpedosTargetTrack: TSpeedButton;
    sbStraightRunningTorpedosDisplayRangeShow: TSpeedButton;
    sbStraightRunningTorpedosDisplayRangeHide: TSpeedButton;
    sbStraightRunningTorpedosDisplayBlindShow: TSpeedButton;
    sbStraightRunningTorpedosDisplayBlindHide: TSpeedButton;
    edtStraightRunningTorpedosTargetTrack: TEdit;
    btnStraightRunningTorpedosLaunch: TButton;
    grbMines: TGroupBox;
    Label272: TLabel;
    lblStatusMines: TLabel;
    Label288: TLabel;
    lbMinesQuantity: TLabel;
    Label291: TLabel;
    Bevel58: TBevel;
    Label292: TLabel;
    Bevel61: TBevel;
    editMinesControlSalvo: TEdit;
    btnMinesDeploy: TButton;
    grbHybridMissile: TGroupBox;
    Label24: TLabel;
    lblHybridMissileStatus: TLabel;
    Label38: TLabel;
    lblHybridMissileQuantity: TLabel;
    Label40: TLabel;
    Bevel7: TBevel;
    Label41: TLabel;
    Label42: TLabel;
    Bevel8: TBevel;
    Label43: TLabel;
    Label44: TLabel;
    Bevel9: TBevel;
    Label45: TLabel;
    Bevel10: TBevel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    btnSearchHybridMissileTargetTrack: TSpeedButton;
    btnAddHybridMissileTargetAimpoint: TSpeedButton;
    sbHybridMissileDisplayRangeShow: TSpeedButton;
    sbHybridMissileDisplayRangeHide: TSpeedButton;
    sbHybridMissileDisplayBlindZonesShow: TSpeedButton;
    sbHybridMissileDisplayBlindZonesHide: TSpeedButton;
    edtHybridMissileControlSalvoSize: TEdit;
    btnHybridMissileLaunch: TButton;
    rdoHybridMissileTargetTrack: TRadioButton;
    rdoHybridMissileTargetAimpoint: TRadioButton;
    rdoHybridMissileTargetBearing: TRadioButton;
    edtHybridMissiletargetTrack: TEdit;
    edtHybridMissiletargetAimpoint: TEdit;
    edtHybridMissiletargetBearing: TEdit;
    btnBringToHookHybridMissileTargetBearing: TButton;
    edtHybridMissileControlCruiseAltitude: TEdit;
    edtHybridMissileControlSeekerRange: TEdit;
    btnDefaultHybridMissileControlCruiseAltitude: TButton;
    btnDefaultHybridMissileControlSeekerRange: TButton;
    grbBombDepthCharge: TGroupBox;
    Label475: TLabel;
    lblBombStatus: TLabel;
    Label485: TLabel;
    lbBombQuantity: TLabel;
    Label487: TLabel;
    Bevel102: TBevel;
    Label490: TLabel;
    Label491: TLabel;
    Bevel104: TBevel;
    Label492: TLabel;
    Bevel105: TBevel;
    Label493: TLabel;
    Label495: TLabel;
    Bevel106: TBevel;
    btnBombTarget: TSpeedButton;
    sbBombDisplayRangeShow: TSpeedButton;
    sbBombDisplayRangeHide: TSpeedButton;
    editBombControlSalvo: TEdit;
    btnBombDrop: TButton;
    editBombTargetTrack: TEdit;
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
    Label36: TLabel;
    lblAirDroppedStatus: TLabel;
    Label53: TLabel;
    lblAirDroppedQuantity: TLabel;
    Label81: TLabel;
    Bevel11: TBevel;
    Label82: TLabel;
    Label83: TLabel;
    Bevel12: TBevel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    lblAirDproppedTargetForce: TLabel;
    Bevel13: TBevel;
    Label89: TLabel;
    Bevel14: TBevel;
    Label90: TLabel;
    Label94: TLabel;
    Label96: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    btnAirDroppesTargetTrack: TSpeedButton;
    Label102: TLabel;
    lblAirDproppedTargetCourse: TLabel;
    Label109: TLabel;
    lblAirDproppedTargetGroundSpeed: TLabel;
    Label111: TLabel;
    lblAirDproppedTargetDepth: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label113: TLabel;
    Bevel15: TBevel;
    Label117: TLabel;
    Label118: TLabel;
    sbAirDroppesDisplayRangeShow: TSpeedButton;
    sbAirDroppesDisplayRangeHide: TSpeedButton;
    sbAirDroppesDisplayBilndZonesShow: TSpeedButton;
    sbAirDropeedBilndZonesHide: TSpeedButton;
    edtAirDroppedTargetTrack: TEdit;
    btnAirDroppedLaunch: TButton;
    edtAirDroppedControlSearchRadius: TEdit;
    edtAirDroppedControlSearchDepth: TEdit;
    edtAirDroppedControlSearchCeiling: TEdit;
    btnDefaultAirDroppedControlSearchCeiling: TButton;
    btnDefaultAirDroppedSearchDepth: TButton;
    edtAirDroppedLaunchBearing: TEdit;
    cbAirDroppedUseLaunchPlatformHeading: TCheckBox;
    btnPlanAirDroppedTorpedo: TButton;
    btnCancelAirDroppedTorpedo: TButton;
    grbAcousticTorpedo: TGroupBox;
    Label325: TLabel;
    Bevel67: TBevel;
    lblAcousticTorpedoStatus: TLabel;
    Label328: TLabel;
    lblAcousticTorpedoQuantity: TLabel;
    Label330: TLabel;
    Bevel68: TBevel;
    Label331: TLabel;
    Label332: TLabel;
    Bevel69: TBevel;
    Label333: TLabel;
    Bevel70: TBevel;
    Label336: TLabel;
    Label337: TLabel;
    Label338: TLabel;
    Label339: TLabel;
    Label340: TLabel;
    Label341: TLabel;
    Label342: TLabel;
    Label343: TLabel;
    Label344: TLabel;
    Label345: TLabel;
    Label346: TLabel;
    Label347: TLabel;
    btnControlComboFiringMode: TSpeedButton;
    btnControlComboRunOut: TSpeedButton;
    btnControlComboGyro: TSpeedButton;
    Label21: TLabel;
    btnSearchTarget: TSpeedButton;
    Label39: TLabel;
    sbAccousticDisplayRangeShow: TSpeedButton;
    sbAccousticDisplayRangeHide: TSpeedButton;
    sbDisplayBlindZonesShow: TSpeedButton;
    sbDisplayBlindZonesHide: TSpeedButton;
    editTargetTrack: TEdit;
    btnAcousticTorpedoPlan: TButton;
    btnAcousticTorpedoLaunch: TButton;
    btnAcousticTorpedoCancel: TButton;
    editControlFiring: TEdit;
    editControlRunOut: TEdit;
    editControlSearchRadius: TEdit;
    editControlSearchDepth: TEdit;
    editControlSafety: TEdit;
    edittControlSeeker: TEdit;
    editControlGyro: TEdit;
    btnControlControlRunAdvised: TButton;
    btnControlSearchRadius: TButton;
    btnControlSearchDepth: TButton;
    btnControlSafety: TButton;
    btnControlSeeker: TButton;
    btntControlGyroAdvised: TButton;
    btnControlTube1: TButton;
    btnControlTube2: TButton;
    btnControlTube3: TButton;
    btnControlTube4: TButton;
    btnTargetDetails: TButton;
    grbSurfaceToAirMissile: TGroupBox;
    Label269: TLabel;
    Bevel54: TBevel;
    lblSurfaceToAirStatus: TLabel;
    Label271: TLabel;
    lbSurfaceToAirStatusQuantity: TLabel;
    Label273: TLabel;
    Bevel55: TBevel;
    Label274: TLabel;
    Label275: TLabel;
    Bevel56: TBevel;
    Label276: TLabel;
    Label277: TLabel;
    Label278: TLabel;
    Label279: TLabel;
    Label280: TLabel;
    Label281: TLabel;
    Label282: TLabel;
    Label283: TLabel;
    Label284: TLabel;
    Bevel57: TBevel;
    Label285: TLabel;
    Label286: TLabel;
    lbSurfaceToAirCourse: TLabel;
    lbSurfaceToAirGround: TLabel;
    lbSurfaceToAirAltitude: TLabel;
    lbSurfaceToAirStatus: TLabel;
    lbSurfaceToAirTimeToWait: TLabel;
    lbSurfaceToAirTimeToIntercept: TLabel;
    Label311: TLabel;
    Label312: TLabel;
    Label313: TLabel;
    Label316: TLabel;
    Label317: TLabel;
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
    grbGunEngagementCIWS: TGroupBox;
    ScrollBox8: TScrollBox;
    Label468: TLabel;
    lblCIWSStatus: TLabel;
    Label474: TLabel;
    lbCIWSQuantity: TLabel;
    Label477: TLabel;
    Bevel99: TBevel;
    Label478: TLabel;
    Label479: TLabel;
    Bevel100: TBevel;
    Label480: TLabel;
    Bevel101: TBevel;
    Label481: TLabel;
    Label482: TLabel;
    Label483: TLabel;
    Label488: TLabel;
    Label489: TLabel;
    Bevel103: TBevel;
    btnCIWSTargetTrack: TSpeedButton;
    sbCIWSControlModeAuto: TSpeedButton;
    sbCIWSControlModeManual: TSpeedButton;
    sbCIWSControlSalvoCont: TSpeedButton;
    sbCIWSControlSalvoSalvo: TSpeedButton;
    sbCIWSControlDisplayRangeShow: TSpeedButton;
    sbCIWSControlDisplayRangeHide: TSpeedButton;
    sbCIWSControlDisplayBlindZonesShow: TSpeedButton;
    sbCIWSControlDisplayBlindZonesHide: TSpeedButton;
    editCIWSControlSalvoSize: TEdit;
    btnCIWSCease: TButton;
    editCIWSTargetTrack: TEdit;
    btnCIWSFire: TButton;
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
    Label413: TLabel;
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
    btnSurfaceToSurfaceMissileLauncher1: TButton;
    btnSurfaceToSurfaceMissileLauncher2: TButton;
    btnSurfaceToSurfaceMissileLauncher3: TButton;
    btnSurfaceToSurfaceMissileLauncher4: TButton;
    btnSurfaceToSurfaceMissileTargetTrackDetails: TButton;
    btnSurfaceToSurfaceMissileWaypointsCancel: TButton;
    btnSurfaceToSurfaceMissileWaypointsApply: TButton;
    btnSurfaceToSurfaceMissileWaypointsDelete: TButton;
    btnSurfaceToSurfaceMissileWaypointsAdd: TButton;
    btnSurfaceToSurfaceMissileWaypointsEdit: TButton;
    grbGunEngagementAutomaticManualMode: TGroupBox;
    ScrollBox7: TScrollBox;
    Label315: TLabel;
    lblGunEngagementStatus: TLabel;
    Label335: TLabel;
    lbGunEngagementQuantity: TLabel;
    Label349: TLabel;
    Bevel63: TBevel;
    Label350: TLabel;
    Label351: TLabel;
    Bevel71: TBevel;
    Label352: TLabel;
    Bevel73: TBevel;
    Label353: TLabel;
    Label354: TLabel;
    Label355: TLabel;
    Label356: TLabel;
    Label357: TLabel;
    Label358: TLabel;
    Label363: TLabel;
    Label359: TLabel;
    Label360: TLabel;
    Bevel95: TBevel;
    Label361: TLabel;
    Label362: TLabel;
    Bevel96: TBevel;
    btnTargetSearch: TSpeedButton;
    sbControlModeAuto: TSpeedButton;
    sbControlModeManual: TSpeedButton;
    sbControlModeChaff: TSpeedButton;
    sbControlSalvoModeCont: TSpeedButton;
    sbControlSalvoModeSalvo: TSpeedButton;
    sbGunEngagementDisplayRangeShow: TSpeedButton;
    sbGunEngagementDisplayRangeHide: TSpeedButton;
    sbGunEngagementDisplayBlindShow: TSpeedButton;
    sbGunEngagementDisplayBlindHide: TSpeedButton;
    sbGunEngagementDisplayInterceptShow: TSpeedButton;
    sbGunEngagementDisplayInterceptHide: TSpeedButton;
    editControlSalvoSize: TEdit;
    btnGunEngagementAssign: TButton;
    btnGunEngagementCease: TButton;
    btnGunEngagementBreak: TButton;
    editGunEngagementTargetTrack: TEdit;
    editAutofireIntercept: TEdit;
    editAutofireThreshold: TEdit;
    btnGunEngagementFire: TButton;
    PanelWeaponChoices: TPanel;
    btnWeapon: TSpeedButton;
    edtWeaponName: TEdit;
    pmenuWeapon: TPopupMenu;
    procedure btnWeaponClick(Sender: TObject);
    procedure btnGunControlClick(Sender: TObject);
    procedure btnTargetSearchClick(Sender: TObject);
    procedure editControlSalvoSizeKeyPress(Sender: TObject; var Key: Char);
    procedure btnChaffClick(Sender: TObject);
    procedure sbGunICWSClick(Sender: TObject);
    procedure btnSurfaceToSurfaceClick(Sender: TObject);
  private
      focused_weapon: TSimObject;
      focused_platform: TSimObject;


      procedure OnWeaponItemSelected(Sender: TObject);
      procedure DisplayTab(const i: byte); override;

      procedure UpdateWpnSurfaceToAirMissileTab(Sender: TObject);
      procedure UpdateMissileSurfaceToSurfaceTab(Sender: TObject);
      procedure UpdateTacticalMissileTab(Sender: TObject);
      procedure UpdateTorpedoStraightGuidanceTab(Sender: TObject);
      procedure UpdateTorpedoWakeHomingTab(Sender: TObject);
      procedure UpdateTorpedoWireGuidedTab(Sender: TObject);
      procedure UpdateTorpedoTacticalTab(Sender: TObject);
      procedure UpdateTorpedoAirDroppedTab(Sender: TObject);
      procedure UpdateTorpedoAcousticTab(Sender: TObject);
      procedure UpdateGunCIWSTab(Sender: TObject);
      procedure UpdateGunChaffTab(Sender: TObject);
      procedure UpdateGunAutoManualTab(Sender: TObject);
      procedure UpdateBombDepthChargeTab(Sender: TObject);
      procedure UpdateMinesTab(Sender: TObject);

  public
    FAGroupBox: array [TWeapoonCategory] of TGroupBox;
    { Public declarations }

    procedure InitCreate(sender: TForm); override;

    procedure Refresh_VisibleTab;

    procedure RefreshPlatformWeaponsTab (pi: TPlatform_Instance);

    procedure SetFocusedPlatform(pi: TPlatform_Instance);
  end;

implementation
{$R *.dfm}

uses
  uSimMgr_Client;


var
  rMis: TRecCmd_LaunchMissile;
  rGun: TRecCmd_GunFire;


  function DeleteAmpersand(Value: string): string;
  var
    i: integer;
    found: Boolean;
  begin
    i := -1;
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

procedure TfmWeapon.InitCreate(sender: TForm);
begin
  inherited;

  FAGroupBox[wcMissileAirToSurfaceSubsurface]               := nil ;
  FAGroupBox[wcMissileSurfaceSubsurfaceToSurfaceSubsurface] := grbSurfaceToSurfaceMissile ;
  FAGroupBox[wcMissileSurfaceSubsurfaceToAir]               := grbSurfaceToAirMissile;
  FAGroupBox[wcMissileAirToAir]                             := nil ;
  FAGroupBox[wcMissileLandAttack]                           := nil ;

  FAGroupBox[wcTorpedoStraigth]         := grbStraightRunningTorpedos ;
  FAGroupBox[wcTorpedoActiveAcoustic]   := nil ;
  FAGroupBox[wcTorpedoPassiveAcoustic]  := nil ;
  FAGroupBox[wcTorpedoWireGuided]       := grbWireGuidedTorpedo;
  FAGroupBox[wcTorpedoWakeHoming]       := grbWakeHomingTorpedos ;
  FAGroupBox[wcTorpedoActivePassive]    := nil ;

  FAGroupBox[wcMine]      := grbMines ;

  FAGroupBox[wcGunCIWS]   := grbGunEngagementCIWS ;
  FAGroupBox[wcGunGun]    := grbGunEngagementAutomaticManualMode ;
  FAGroupBox[wcGunRocket] := grbGunEngagementChaffMode ; // kok iso ?
  FAGroupBox[wcBomb]      := grbBombDepthCharge;

end;

procedure TfmWeapon.SetFocusedPlatform(pi: TPlatform_Instance);
begin
  focused_platform := pi;


end;

procedure TfmWeapon.btnChaffClick(Sender: TObject);
begin
  if not Assigned(focused_weapon) then
    exit;
  if focused_weapon.ClassType <> TGun_Definition then
    exit;
  with TGun_Definition(focused_weapon) do
  begin
    case TSpeedButton(Sender).Tag of
      1:
        begin
          Mode := 1;
          btnChaffFire.Enabled := false;
          btnChaffCeaseFire.Enabled := true;
          rGun.ControlMode := Mode;
        end;
      2:
        begin
          Mode := 2;
          btnChaffFire.Enabled := true;
          btnChaffCeaseFire.Enabled := false;
          rGun.ControlMode := Mode;
        end;
      3:
        begin
          Mode := 3;
          btnChaffFire.Enabled := true;
          btnChaffCeaseFire.Enabled := false;
          rGun.ControlMode := Mode;
        end;
      4:
        ShowRange := true;
      5:
        ShowRange := false;
      6:
        ShowBlind := true;
      7:
        ShowBlind := false;
    end;
  end;

end;

procedure TfmWeapon.btnGunControlClick(Sender: TObject);
begin
  if not Assigned(focused_weapon) then
    exit;
  if focused_weapon.ClassType <> TGun_Definition then
    exit;

  with TGun_Definition(focused_weapon) do
  begin
    rGun.GunID := FData.Gun_Index;
    if Sender.ClassType = TSpeedButton then
      case TSpeedButton(Sender).Tag of
        1:
          begin
            Mode := 1;
            btnGunEngagementFire.Enabled := false;
            btnGunEngagementCease.Enabled := true;
            btnGunEngagementAssign.Enabled := true;
            btnGunEngagementBreak.Enabled := true;
            btnTargetSearch.Enabled := false;
            rGun.ControlMode := Mode;
          end;
        2:
          begin
            Mode := 2;
            btnGunEngagementFire.Enabled := true;
            btnGunEngagementCease.Enabled := false;
            btnGunEngagementAssign.Enabled := false;
            btnGunEngagementBreak.Enabled := false;
            btnTargetSearch.Enabled := true;
            rGun.ControlMode := Mode;
          end;
        3:
          begin
            Mode := 3;
            btnGunEngagementFire.Enabled := true;
            btnGunEngagementCease.Enabled := false;
            btnGunEngagementAssign.Enabled := false;
            btnGunEngagementBreak.Enabled := false;
            btnTargetSearch.Enabled := true;
            rGun.ControlMode := Mode;
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
          ShowRange := true;
        7:
          ShowRange := false;
        8:
          ShowBlind := true;
        9:
          ShowBlind := false;
      end;

    if Sender.ClassType = TButton then
      case TButton(Sender).Tag of
        // 1 : assign
        // 2 : break
        // 3 : fire
        // 4 : cease

        3:
          begin
            Shoot;
            lbGunEngagementQuantity.Caption := IntToStr(Capacity);

            SimMgrClient.netSend_CmdGunFire(rGun);
          end;
      end;
  end;

end;

procedure TfmWeapon.btnSurfaceToSurfaceClick(Sender: TObject);
var
  missile: TMissile_On_Board;
  myTrackId, targetTrackId: string;
begin

  if focused_weapon = nil then
    exit;

  if focused_weapon.ClassType <> TMissile_On_Board then
    exit;

  missile := TMissile_On_Board(focused_weapon);

  if Sender.ClassType = TSpeedButton then
    case TSpeedButton(Sender).Tag of
      1:
        missile.ShowRange := true;
      2:
        missile.ShowRange := false;
      3:
        begin
          if Assigned(FControlled) then
            myTrackId := TPlatform_Instance(FControlled).TrackID;

          rMis.ParentPlatformID := TPlatform_Instance(FControlled)
            .FData.Platform_Instance_Index;

          if Assigned(focused_platform) then
          begin
            targetTrackId := TPlatform_Instance(focused_platform).TrackID;

            rMis.TargetPlatformID := TPlatform_Instance(focused_platform)
              .FData.Platform_Instance_Index

          end
          else
            rMis.TargetPlatformID := 0;

          if myTrackId <> targetTrackId then
          begin
            editSurfaceToSurfaceMissileTargetTrack.Text := targetTrackId;
            btnSurfaceToSurfacePlan.Enabled := true;
            missile.TargetObject := focused_platform;
          end;

          rMis.ParentPlatformID := TPlatform_Instance(FControlled)
            .FData.Platform_Instance_Index;
          rMis.MissileID := missile.FData.Fitted_Weap_Index;

        end;
    end;

  if Sender.ClassType = TButton then
    case TButton(Sender).Tag of
      1:
        begin
          missile.Planned := true;
        end;
      2:
        begin
          btnSurfaceToSurfacePlan.Enabled := false;
        end;
      3:
        begin
          SimMgrClient.netSend_CmdLaunch_Missile(rMis);
          missile.Launched := true;
        end;
    end;
  //
end;

procedure TfmWeapon.btnTargetSearchClick(Sender: TObject);
var
  pi: TPlatform_Instance;
begin
  if focused_platform = nil then
  begin
    rGun.TargetPlatformID := 0;
    exit;
  end;

  if focused_platform.ClassType <> TPlatform_Instance then
    exit;
  if focused_weapon = nil then
    exit;
  if focused_weapon.ClassType <> TGun_Definition then
    exit;

  editGunEngagementTargetTrack.Text := TPlatform_Instance(focused_platform)
    .TrackID;

  pi := TPlatform_Instance(focused_platform);
  TGun_Definition(focused_weapon).TargetObject := pi;
  rGun.TargetPlatformID := pi.FData.Platform_Instance_Index

end;

procedure TfmWeapon.btnWeaponClick(Sender: TObject);
var pt: TPoint;
begin
  GetCursorPos(pt);

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

procedure TfmWeapon.editControlSalvoSizeKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfmWeapon.OnWeaponItemSelected(Sender: TObject);
var
  pi: TPlatform_Instance;
  weaponName: String;
  wc : TWeapoonCategory;
begin
  weaponName := TMenuItem(Sender).Caption;
  weaponName := DeleteAmpersand(weaponName);
  edtWeaponName.Text := weaponName;

  pi := TPlatform_Instance(FControlled);

  rGun.ParentPlatformID := pi.FData.Platform_Instance_Index;

  wc :=  pi.defineWeaponType(weaponName);

  DisplayTab(Byte(wc));

  case wc of
    wcMissileSurfaceSubsurfaceToAir:
      UpdateWpnSurfaceToAirMissileTab(pi.findWeapon(weaponName));
    wcMissileSurfaceSubsurfaceToSurfaceSubsurface:
      UpdateMissileSurfaceToSurfaceTab(pi.findWeapon(weaponName));
    wcMissileAirToSurfaceSubsurface:
      ;
    wcMissileAirToAir:
      ;
    wcMissileLandAttack:
      ;
    wcTorpedoStraigth:
      UpdateTorpedoStraightGuidanceTab(pi.findWeapon(weaponName));
    wcTorpedoWireGuided:
      UpdateTorpedoWireGuidedTab(pi.findWeapon(weaponName));
    wcTorpedoWakeHoming:
      UpdateTorpedoWakeHomingTab(pi.findWeapon(weaponName));
    wcTorpedoActiveAcoustic:
      ;
    wcTorpedoPassiveAcoustic:
      ;
    wcTorpedoActivePassive:
      ;
    wcMine:
      UpdateMinesTab(pi.findWeapon(weaponName));
    wcGunCIWS:
      UpdateGunCIWSTab(pi.findWeapon(weaponName));
    wcGunGun:
      UpdateGunAutoManualTab(pi.findWeapon(weaponName));
    wcGunRocket:
      UpdateGunChaffTab(pi.findWeapon(weaponName));
    wcBomb:
      UpdateBombDepthChargeTab(pi.findWeapon(weaponName));
  end;

end;

procedure TfmWeapon.RefreshPlatformWeaponsTab
  (pi: TPlatform_Instance);
  function IfExistItem(mnu: TPopupMenu; Caption: string): Boolean;
  var
    i: integer;
    Item: TMenuItem;
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

var
  i: integer;
  wpn: TObject;
  Item: TMenuItem;
begin
  pmenuWeapon.Items.Clear;

  // missiles
  if (pi.Vehicle.Missiles <> nil) then
    for i := 0 to pi.Vehicle.Missiles.Count - 1 do
    begin
      wpn := pi.Vehicle.Missiles[i];
      if not IfExistItem(pmenuWeapon, TMissile_On_Board(wpn)
          .FData.Instance_Identifier) then
      begin
        Item := TMenuItem.Create(self);

        Item.OnClick := OnWeaponItemSelected;

        Item.Caption := TMissile_On_Board(wpn).FData.Instance_Identifier;
        pmenuWeapon.Items.Add(Item);
      end;
    end;

  // torpedoes
  if (pi.Vehicle.Torpedos <> nil) then
    for i := 0 to pi.Vehicle.Torpedos.Count - 1 do
    begin
      wpn := pi.Vehicle.Torpedos[i];
      if not IfExistItem(pmenuWeapon, TTorpedo_On_Board(wpn)
          .FData.Instance_Identifier) then
      begin
        Item := TMenuItem.Create(self);

        Item.OnClick := OnWeaponItemSelected;

        Item.Caption := TTorpedo_On_Board(wpn).FData.Instance_Identifier;
        pmenuWeapon.Items.Add(Item);
      end;
    end;

  // mines
  if (pi.Vehicle.Mines <> nil) then
    for i := 0 to pi.Vehicle.Mines.Count - 1 do
    begin
      wpn := pi.Vehicle.Mines[i];
      if not IfExistItem(pmenuWeapon, TMine_On_Board(wpn)
          .FData.Instance_Identifier) then
      begin
        Item := TMenuItem.Create(self);

        Item.OnClick := OnWeaponItemSelected;

        Item.Caption := TMine_On_Board(wpn).FData.Instance_Identifier;
        pmenuWeapon.Items.Add(Item);
      end;
    end;

  // gun
  if (pi.Vehicle.Guns <> nil) then
    for i := 0 to pi.Vehicle.Guns.Count - 1 do
    begin
      wpn := pi.Vehicle.Guns[i];
      if not IfExistItem(pmenuWeapon, TGun_Definition(wpn)
          .FData.Gun_Identifier) then
      begin
        Item := TMenuItem.Create(self);
        Item.OnClick := OnWeaponItemSelected;
        Item.Caption := TGun_Definition(wpn).FData.Gun_Identifier;
        pmenuWeapon.Items.Add(Item);
      end;
    end;

  // Bomb
  if (pi.Vehicle.Bombs <> nil) then
    for i := 0 to pi.Vehicle.Bombs.Count - 1 do
    begin
      wpn := pi.Vehicle.Bombs[i];
      if not IfExistItem(pmenuWeapon, TBomb_Definition(wpn)
          .FData.Bomb_Identifier) then
      begin
        Item := TMenuItem.Create(self);
        Item.OnClick := OnWeaponItemSelected;
        Item.Caption := TBomb_Definition(wpn).FData.Bomb_Identifier;
        pmenuWeapon.Items.Add(Item);
      end;
    end;
end;


procedure TfmWeapon.Refresh_VisibleTab;
begin
  //

end;

procedure TfmWeapon.sbGunICWSClick(Sender: TObject);
begin
if not Assigned(focused_weapon) then
    exit;
  if focused_weapon.ClassType <> TGun_Definition then
    exit;

  with TGun_Definition(focused_weapon) do
  begin
    case TSpeedButton(Sender).Tag of
      1:
        begin
          Mode := 1;
          btnCIWSFire.Enabled := false;
          btnCIWSTargetTrack.Enabled := false;
          btnCIWSCease.Enabled := true;

          rGun.ControlMode := Mode;
        end;
      2:
        begin
          Mode := 2;
          btnCIWSFire.Enabled := true;
          btnCIWSTargetTrack.Enabled := true;
          btnCIWSCease.Enabled := false;

          rGun.ControlMode := Mode;
        end;
      3:
        begin
          SalvoMode := 1;
          rGun.SalvoMode := SalvoMode;
        end;

      4:
        begin
          SalvoMode := 2;
          rGun.SalvoMode := SalvoMode;
        end;
      5:
        ShowRange := true;
      6:
        ShowRange := false;
      7:
        ShowBlind := true;
      8:
        ShowBlind := false;
    end;
  end;
end;

procedure TfmWeapon.UpdateWpnSurfaceToAirMissileTab(Sender: TObject);
var
  wpn: TMissile_On_Board;
begin

  if (Sender <> nil) then
  begin
    with TMissile_On_Board(Sender) do
    begin
      lblSurfaceToAirStatus.Caption := IntToStr(FData.Quantity);
      // lbSurfaceToAirTimeToWait.Caption := FDef.
    end;
  end;
end;

procedure TfmWeapon.UpdateMissileSurfaceToSurfaceTab(Sender: TObject);
begin

  if Sender = nil then
    exit;
  if Sender.ClassType <> TMissile_On_Board then
    exit;
  focused_weapon := TMissile_On_Board(Sender);

  if TMissile_On_Board(Sender).ShowRange then
    sbSurfaceToSurfaceMissileDisplayRangeShow.Down := true
  else
    sbSurfaceToSurfaceMissileDisplayRangeHide.Down := true;

  with TMissile_On_Board(Sender).FData do
  begin
    lbSurfaceToSurfaceMissileQuantity.Caption := IntToStr(Quantity);
  end;

  with TMissile_On_Board(Sender).FLaunch do
  begin
  end;
end;

procedure TfmWeapon.UpdateTacticalMissileTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  with TMissile_On_Board(Sender) do
  begin

  end;

end;

procedure TfmWeapon.UpdateTorpedoStraightGuidanceTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  with TTorpedo_On_Board(Sender) do
  begin

  end;

end;

procedure TfmWeapon.UpdateTorpedoWakeHomingTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  with TTorpedo_On_Board(Sender) do
  begin

  end;

end;

procedure TfmWeapon.UpdateTorpedoWireGuidedTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  with TTorpedo_On_Board(Sender) do
  begin

  end;

end;

procedure TfmWeapon.UpdateTorpedoTacticalTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  with TTorpedo_On_Board(Sender) do
  begin

  end;

end;

procedure TfmWeapon.UpdateTorpedoAirDroppedTab(Sender: TObject);
begin

end;

procedure TfmWeapon.UpdateTorpedoAcousticTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  with TTorpedo_On_Board(Sender) do
  begin

  end;

end;

procedure TfmWeapon.UpdateGunCIWSTab(Sender: TObject);
begin
  if Sender = nil then
    exit;
  if Sender.ClassType <> TGun_Definition then
    exit;
  focused_weapon := TGun_Definition(Sender);

  with TGun_Definition(Sender) do
  begin
    if ShowRange then
      sbCIWSControlDisplayRangeShow.Down := true
    else
      sbCIWSControlDisplayRangeHide.Down := true;

    if ShowBlind then
      sbCIWSControlDisplayBlindZonesShow.Down := true
    else
      sbCIWSControlDisplayBlindZonesHide.Down := true;

    case Mode of
      1:
        sbCIWSControlModeAuto.Down := true;
      2:
        sbCIWSControlModeManual.Down := true;
    end;

    case SalvoMode of
      1:
        sbCIWSControlSalvoCont.Down := true;
      2:
        sbCIWSControlSalvoSalvo.Down := true;
    end;

    lbCIWSQuantity.Caption := IntToStr(Capacity);
  end;

end;

procedure TfmWeapon.UpdateGunChaffTab(Sender: TObject);
begin
  if Sender = nil then
    exit;
  if Sender.ClassType <> TGun_Definition then
    exit;
  focused_weapon := TGun_Definition(Sender);

  with TGun_Definition(Sender) do
  begin
    if ShowRange then
      sbCIWSControlDisplayRangeShow.Down := true
    else
      sbCIWSControlDisplayRangeHide.Down := true;

    if ShowBlind then
      sbCIWSControlDisplayBlindZonesShow.Down := true
    else
      sbCIWSControlDisplayBlindZonesHide.Down := true;

    case Mode of
      1:
        sbCIWSControlModeAuto.Down := true;
      2:
        sbCIWSControlModeManual.Down := true;
    end;

    case SalvoMode of
      1:
        sbCIWSControlSalvoCont.Down := true;
      2:
        sbCIWSControlSalvoSalvo.Down := true;
    end;

    lbCIWSQuantity.Caption := IntToStr(Capacity);
  end;


end;

procedure TfmWeapon.UpdateGunAutoManualTab(Sender: TObject);
begin
  if Sender = nil then
    exit;
  if Sender.ClassType <> TGun_Definition then
    exit;
  focused_weapon := TGun_Definition(Sender);

  with TGun_Definition(Sender) do
  begin
    if ShowRange then
      sbGunEngagementDisplayRangeShow.Down := true
    else
      sbGunEngagementDisplayRangeHide.Down := true;

    if ShowBlind then
      sbGunEngagementDisplayBlindShow.Down := true
    else
      sbGunEngagementDisplayBlindHide.Down := true;

    case Mode of
      1:
        sbControlModeAuto.Down := true;
      2:
        sbControlModeManual.Down := true;
      3:
        sbControlModeChaff.Down := true;
    end;

    case SalvoMode of
      1:
        sbControlSalvoModeCont.Down := true;
      2:
        sbControlSalvoModeSalvo.Down := true;
    end;

    lbGunEngagementQuantity.Caption := IntToStr(Capacity);
    editControlSalvoSize.Text := IntToStr(SalvoSize);

    if TargetObject <> nil then
      editGunEngagementTargetTrack.Text := TPlatform_Instance(TargetObject)
        .TrackID
    else
      editGunEngagementTargetTrack.Text := '';
  end;

end;

procedure TfmWeapon.UpdateBombDepthChargeTab(Sender: TObject);
begin
//  grbBombDepthCharge.BringToFront;

end;

procedure TfmWeapon.UpdateMinesTab(Sender: TObject);
begin
//  grbMines.BringToFront;

end;
{
grbAcousticTorpedo
grbAirDroppedTorpedo
grbAirDroppedVECTAC
grbBombDepthCharge
grbGunEngagementAutomaticManualMode
grbGunEngagementChaffMode
grbGunEngagementCIWS
grbHybridMissile
grbMines
grbStraightRunningTorpedos
grbSurfaceToAirMissile
grbSurfaceToSurfaceMissile
grbTacticalAcousticTorpedos
grbTacticalMissiles
grbWakeHomingTorpedos
grbWireGuidedTorpedo

}

end.
