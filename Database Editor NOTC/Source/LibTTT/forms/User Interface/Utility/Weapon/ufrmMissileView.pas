unit uFrmMissileView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, uDBAsset_Weapon, uSimContainers, tttData,
  uDBAsset_MotionCharacteristics;

type
  TfrmMissileView = class(TForm)
    ImgBackground: TImage;
    Label4: TLabel;
    ImgBackgroundList: TImage;
    lstMissile: TListBox;
    Label2: TLabel;
    lblName: TLabel;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    pnlTabNotes: TPanel;
    pnlTabSeekerSettings: TPanel;
    Image4: TImage;
    Label49: TLabel;
    Label69: TLabel;
    edtRangeTARH: TLabel;
    Label93: TLabel;
    edtECCMMissileType: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    edtECMDeto: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label90: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    edtPulseWidthTerminalTARH: TLabel;
    Label159: TLabel;
    edtECMDetect: TLabel;
    Panel16: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtIRCMDeto: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtIRCMDetect: TLabel;
    Panel1: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    edtScanRateTerminalTARH: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtTransmitterPowerTerminalTARH: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label84: TLabel;
    Label100: TLabel;
    Label149: TLabel;
    edtFreqTerminalTARH: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    edtPulseRepTerminalTARH: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label18: TLabel;
    Panel2: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    edtLowerLimitReceivedFreqTARH: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edtUpperLimitReceivedFreqTARH: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    pnlTabPOH: TPanel;
    Image1: TImage;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Panel4: TPanel;
    mmoNotes: TEdit;
    trckbrAntiRadiationMissile: TTrackBar;
    trckbrInfraredMissile: TTrackBar;
    trckbrSARHMissile: TTrackBar;
    trckbrTARHMissile: TTrackBar;
    Label6: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    edtInfraredMissile: TLabel;
    edtAntiRadiationMissile: TLabel;
    edtSARHMissile: TLabel;
    edtTARHMissile: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    pnlTabPhysical: TPanel;
    Image2: TImage;
    Label21: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    edtMotionCharMissile: TLabel;
    Label28: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label56: TLabel;
    edtLengthDimensions: TLabel;
    edtWidthDimensions: TLabel;
    edtHeightDimensions: TLabel;
    edtEngagementRangeDimensions: TLabel;
    edtFrontRadarPhysical: TLabel;
    edtSideRadarPhysical: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    edtRangeBooster: TLabel;
    edtBoxWidthBooster: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    edtFrontInfraredPhysical: TLabel;
    edtSideInfraredPhysical: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Panel3: TPanel;
    Panel5: TPanel;
    chkBoosterSeparation: TCheckBox;
    Panel7: TPanel;
    Panel8: TPanel;
    Label85: TLabel;
    Label86: TLabel;
    edtBoxHeightBooster: TLabel;
    Label88: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    edtFrontVisualPhysical: TLabel;
    edtSideVisualPhysical: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    Panel10: TPanel;
    pnlTabGeneral: TPanel;
    Label60: TLabel;
    Label65: TLabel;
    edtMethod: TLabel;
    Label87: TLabel;
    Label89: TLabel;
    edtInitialCS: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    edtPrimaryTargetDomain: TLabel;
    Label94: TLabel;
    lblProbabilityOfHit: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label102: TLabel;
    lblLethality: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    chkAntiSurface: TCheckBox;
    chkAntiSubsurface: TCheckBox;
    Panel11: TPanel;
    Panel13: TPanel;
    trckbrProbabilityofHit: TTrackBar;
    Panel14: TPanel;
    trckbrLethality: TTrackBar;
    chkAntiLand: TCheckBox;
    chkAntiAmphibious: TCheckBox;
    chkAntiAir: TCheckBox;
    chkSeaStateModelling: TCheckBox;
    Label108: TLabel;
    Label109: TLabel;
    edtDetectabilityType: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    chkHybridTorpedoDefinition: TCheckBox;
    Panel17: TPanel;
    Label123: TLabel;
    Panel18: TPanel;
    chkTypeA: TCheckBox;
    chkTypeB: TCheckBox;
    chkTypeC: TCheckBox;
    Label91: TLabel;
    Label92: TLabel;
    Label101: TLabel;
    edtMaxAltitudeDiff: TLabel;
    Label103: TLabel;
    Panel12: TPanel;
    Label112: TLabel;
    lblDamageSustainability: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Panel15: TPanel;
    trckbrDamageSustainability: TTrackBar;
    pnlTabGuidance: TPanel;
    Image5: TImage;
    Label104: TLabel;
    Label105: TLabel;
    edtPrimaryLaunchGuidance: TLabel;
    Label122: TLabel;
    edtSecondaryLaunchGuidance: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label129: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    edtAzimuthSeekerDetectionGuidance: TLabel;
    Label135: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    edtRangeSeekerTurnGuidance: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    edtMaxFiringGuidance: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    edtDefaultCruiseGuidance: TLabel;
    Label153: TLabel;
    Label158: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    edtRangeSeekerDetectionGuidance: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    edtElevationSeekerDetectionGuidance: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    edtMaxRangeGuide: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    edtMinRangeGuide: TLabel;
    Label176: TLabel;
    Label177: TLabel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Label178: TLabel;
    edtPursuitLaunchGuidance: TLabel;
    Label180: TLabel;
    chkRangeSeekerTurnGuidance: TCheckBox;
    Label141: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label130: TLabel;
    edtStartRangeTerminalGuidance: TLabel;
    Label187: TLabel;
    edtAltitudeTerminalGuidance: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    edtPeriodTerminalGuidance: TLabel;
    Label193: TLabel;
    edtAmplitudeTerminalGuidance: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    edtCapabilityTerminalGuidance: TLabel;
    chkTerminalAcqGuidance: TCheckBox;
    Panel19: TPanel;
    Label201: TLabel;
    edtCommandAltitudeGuidance: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    chkWaypointUserGuidance: TCheckBox;
    Panel24: TPanel;
    edtmaxNumWaypointGuidance: TLabel;
    Label203: TLabel;
    Label204: TLabel;
    Label208: TLabel;
    edtMinFinalWaypointGuidance: TLabel;
    Label210: TLabel;
    Label211: TLabel;
    chkFlyOutRequired: TCheckBox;
    Panel6: TPanel;
    Label142: TLabel;
    Label143: TLabel;
    edtAltitudeFlyGuide: TLabel;
    Label182: TLabel;
    Label183: TLabel;
    edtRangeFlyGuide: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Image3: TImage;
    Panel25: TPanel;
    edtMidCourseUpdateMode: TLabel;
    Label121: TLabel;
    edtHybridTorpedoDef: TLabel;
    lblsearch: TLabel;
    edtbomblist: TEdit;
    imgImgBtnBack: TImage;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure ImgBtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);


  private
    FTargetDomainList : TStringList;
    FSelectedHybrid : THybrid_On_Board;

    FSetWeaponCategory : TStringList;
    tabIndex, tabMax : Integer;
    FMissileList : TList;
    FSelectedMissile : TMissile_On_Board;

   function SetWeaponCategory(aValue : Integer): string;



  public
    { Public declarations }

   procedure UpdateMotionData;
   procedure UpdatePrimaryTargetDomainItems(Sender: TObject);
   procedure UpdateHybridData;

   procedure UpdateTabPage;
   procedure UpdateMissileList;
   procedure UpdateMissileData;


  end;

var
  frmMissileView: TfrmMissileView;

implementation

uses
uDataModuleTTT ;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmMissileView.edtCheatKeyPress(Sender: TObject; var Key: Char);
 var
   i : Integer;
  missile : TMissile_On_Board;
begin
  if Key = #13 then
  begin

lstMissile.Items.Clear;

  dmTTT.GetfilterMissileDef(FMissileList,edtbomblist.text);
    for i := 0 to FMissileList.Count - 1 do
    begin
    missile := FMissileList.Items[i];
    lstMissile.Items.AddObject(missile.FDef.Class_Identifier, missile);
    end;
  end;
end;

procedure TfrmMissileView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FMissileList);

  FSelectedHybrid.Free;

  Action := cafree;
end;

procedure TfrmMissileView.FormCreate(Sender: TObject);
begin
FMissileList := TList.Create;
FTargetDomainList := TStringList.Create;
end;

procedure TfrmMissileView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 5;

  UpdateTabPage;
  UpdateMissileList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmMissileView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMissileView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmMissileView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmMissileView.lbSingleClick(Sender: TObject);
begin
  if lstMissile.ItemIndex = -1 then
    Exit;

  FSelectedMissile := TMissile_On_Board(lstMissile.Items.Objects[lstMissile.ItemIndex]);

  UpdateMissileData;
end;

procedure TfrmMissileView.Panel9Click(Sender: TObject);
begin

end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmMissileView.UpdateMissileData;
var
  hybrid : THybrid_On_Board;
  motion : TMotion_Characteristics;
begin
  with FSelectedMissile do
  begin

    lblName.Caption := FDef.Class_Identifier;

    {$REGION ' General '}
    case FDef.Launch_Method of
      Ord(mMissileAimpoint) : edtMethod.Caption := msMissileAimpoint;
      Ord(mMissileBearing) : edtMethod.Caption := msMissileBearing;
      Ord(mMissileOr) : edtMethod.Caption := msMissileOr;
      Ord(mMissileDirect) : edtMethod.Caption := msMissileDirect;
    end;

    case FDef.Launch_Speed of
      Ord(icsMissileMinimum) : edtInitialCS.Caption := icssMissileMinimum;
      Ord(icsMissileCruise) : edtInitialCS.Caption := icssMissileCruise;
      Ord(icsMissileHigh) : edtInitialCS.Caption := icssMissileHigh;
      Ord(icsMissileMaximum) : edtInitialCS.Caption := icssMissileMaximum;
    end;

    chkTypeA.Checked := Boolean(FDef.Home_On_Jam_Type_A_Capable);
    chkTypeB.Checked := Boolean(FDef.Home_On_Jam_Type_B_Capable);
    chkTypeC.Checked := Boolean(FDef.Home_On_Jam_Type_C_Capable);

    chkAntiAir.Checked := Boolean(FDef.Anti_Air_Capable);
    chkAntiSubsurface.Checked := Boolean(FDef.Anti_SubSur_Capable);
    chkAntiSurface.Checked := Boolean(FDef.Anti_Sur_Capable);
    chkAntiLand.Checked := Boolean(FDef.Anti_Land_Capable);
    chkSeaStateModelling.Checked := Boolean(FDef.Sea_State_Modelling_Capable);
    chkAntiAmphibious.Checked := Boolean(FDef.Anti_Amphibious_Capable);

    UpdatePrimaryTargetDomainItems(nil);
   // edtPrimaryTargetDomain.Caption := FtargetDomainList[FDef.Primary_Target_Domain];
    edtPrimaryTargetDomain.Caption := SetWeaponCategory(FDef.Primary_Target_Domain);

    chkHybridTorpedoDefinition.Checked := dmTTT.GetHybridDef(FDef.Missile_Index, FSelectedHybrid);
    UpdateHybridData;

    edtMaxAltitudeDiff.Caption := FormatFloat('0', FDef.Max_Target_Altitude_Delta);

    case FDef.Detectability_Type of
      Ord(dtMissileNormalDet) : edtDetectabilityType.Caption := dtsMissileNormalDet;
      Ord(dtMissileUndetectable) : edtDetectabilityType.Caption := dtsMissileUndetectable;
      Ord(dtMissilePassiveDet) : edtDetectabilityType.Caption := dtsMissilePassiveDet;
      Ord(dtMissileAlwaysVis) : edtDetectabilityType.Caption := dtsMissileAlwaysVis;
    end;

    case FDef.Mid_Course_Update_Mode of
      Ord(mcMissileSwitch) : edtMidCourseUpdateMode.Caption := mcsMissileSwitch;
      Ord(mcMissileChange) : edtMidCourseUpdateMode.Caption := mcsMissileChange;
      Ord(mcMissileNone) : edtMidCourseUpdateMode.Caption := mcsMissileNone;
      Ord(mcMissileHF) : edtMidCourseUpdateMode.Caption := mcsMissileHF;
      Ord(mcMissileUHF) : edtMidCourseUpdateMode.Caption := mcsMissileUHF;
      Ord(mcMissileSATCOM) : edtMidCourseUpdateMode.Caption := mcsMissileSATCOM;
    end;

    trckbrLethality.Position := FDef.Lethality;
    lblLethality.Caption := trckbrLethality.Position.ToString;

    trckbrDamageSustainability.Position := FDef.Damage_Capacity;
    lblDamageSustainability.Caption := trckbrDamageSustainability.Position.ToString;

    trckbrProbabilityOfHit.Position := Round(FDef.Prob_of_Hit * 100);
    lblProbabilityOfHit.Caption := trckbrProbabilityOfHit.Position.ToString;

    {$ENDREGION}

    {$REGION ' Physical '}
    UpdateMotionData;

    edtLengthDimensions.Caption := FormatFloat('0', FDef.Length);
    edtWidthDimensions.Caption := FormatFloat('0', FDef.Width);
    edtHeightDimensions.Caption := FormatFloat('0', FDef.Height);
    edtEngagementRangeDimensions.Caption := FormatFloat('0', FDef.Engagement_Range);

    edtFrontRadarPhysical.Caption := FormatFloat('0.00', FDef.Front_Radar_Cross);
    edtSideRadarPhysical.Caption := FormatFloat('0.00', FDef.Side_Radar_Cross);

    chkBoosterSeparation.Checked := Boolean(FDef.Booster_Separation_Required);;

    edtRangeBooster.Caption := FormatFloat('0.00', FDef.Booster_Separation_Range);
    edtBoxWidthBooster.Caption := FormatFloat('0.00', FDef.Booster_Separation_Box_Width);
    edtBoxHeightBooster.Caption := FormatFloat('0.00', FDef.Booster_Separation_Box_Length);


    edtFrontVisualPhysical.Caption := FormatFloat('0.00', FDef.Front_Visual_Cross);
    edtSideVisualPhysical.Caption := FormatFloat('0.00', FDef.Side_Visual_Cross);
    edtFrontInfraredPhysical.Caption := FormatFloat('0.00', FDef.Front_Infrared_Cross);
    edtSideInfraredPhysical.Caption := FormatFloat('0.00', FDef.Side_Infrared_Cross);
    {$ENDREGION}

    {$REGION ' POH Modifier '}

    trckbrAntiRadiationMissile.Position := Round(FDef.AR_POH_Modifier * 100);
    edtAntiRadiationMissile.Caption := trckbrAntiRadiationMissile.Position.ToString;

    trckbrInfraredMissile.Position := Round(FDef.IR_POH_Modifier * 100);
    edtInfraredMissile.Caption := trckbrInfraredMissile.Position.ToString;

    trckbrTARHMissile.Position := Round(FDef.TARH_POH_Modifier * 100);
    edtTARHMissile.Caption := trckbrTARHMissile.Position.ToString;

    trckbrSARHMissile.Position := Round(FDef.SARH_POH_Modifier * 100);
    edtSARHMissile.Caption := trckbrSARHMissile.Position.ToString;

    {$ENDREGION}

    {$REGION ' Guidance '}
    case FDef.Primary_Guide_Type of
      Ord(prMissileSemiActive) : edtPrimaryLaunchGuidance.Caption := prsMissileSemiActive;
      Ord(prMissileTerminal) : edtPrimaryLaunchGuidance.Caption := prsMissileTerminal;
      Ord(prMissileInfrared) : edtPrimaryLaunchGuidance.Caption := prsMissileInfrared;
      Ord(prMissileAntiRad) : edtPrimaryLaunchGuidance.Caption := prsMissileAntiRad;
      Ord(prMissileStraight) : edtPrimaryLaunchGuidance.Caption := prsMissileStraight;
      Ord(prMissileHybrid) : edtPrimaryLaunchGuidance.Caption := prsMissileHybrid;
    end;

    case FDef.Secondary_Guide_Type of
      Ord(secMissileNone) : edtSecondaryLaunchGuidance.Caption := secsMissileNone;
      Ord(secMissileInfrared) : edtSecondaryLaunchGuidance.Caption := secsMissileInfrared;
      Ord(secMissileAntiRad) : edtSecondaryLaunchGuidance.Caption := secsMissileAntiRad;
    end;

    case FDef.Pursuit_Guide_Type of
      Ord(purMissileLead) : edtPursuitLaunchGuidance.Caption := pursMissileLead;
      Ord(purMissilePure) : edtPursuitLaunchGuidance.Caption := pursMissilePure;
    end;

    edtMinRangeGuide.Caption := FormatFloat('0.00', FDef.Min_Range);
    edtMaxRangeGuide.Caption := FormatFloat('0.00', FDef.Max_Range);

    chkFlyOutRequired.Checked := Boolean(FDef.Fly_Out_Required);
    edtRangeFlyGuide.Caption := FormatFloat('0.00', FDef.Fly_Out_Range);
    edtAltitudeFlyGuide.Caption := FormatFloat('0.00', FDef.Fly_Out_Altitude);

    case FDef.Terminal_Guidance_Capability of
      Ord(capMissileNone):
      begin
        edtCapabilityTerminalGuidance.Caption := capsMissileNone;

        edtStartRangeTerminalGuidance.Caption := FormatFloat('0.00', 0);
        edtAltitudeTerminalGuidance.Caption := FormatFloat('0', FDef.Terminal_Pop_Up_Altitude);
        edtPeriodTerminalGuidance.Caption := FormatFloat('0.00', FDef.Terminal_Sinuation_Period);
        edtAmplitudeTerminalGuidance.Caption := FormatFloat('0.0', FDef.Terminal_Sinuation_Amplitude);
      end;
      Ord(capMissilePopup):
      begin
        edtCapabilityTerminalGuidance.Caption := capsMissilePopup;

        edtStartRangeTerminalGuidance.Caption := FormatFloat('0.00', FDef.Terminal_Pop_Up_Range);
        edtAltitudeTerminalGuidance.Caption := FormatFloat('0', FDef.Terminal_Pop_Up_Altitude);
        edtPeriodTerminalGuidance.Caption := 'null';
        edtPeriodTerminalGuidance.Enabled := false;
        edtAmplitudeTerminalGuidance.Caption := 'null';
        edtAmplitudeTerminalGuidance.Enabled := false;
      end;
      Ord(capMissileSinuation):
      begin
        edtCapabilityTerminalGuidance.Caption := capsMissileSinuation;

        edtStartRangeTerminalGuidance.Caption := FormatFloat('0.00', FDef.Terminal_Sinuation_Start_Range);
        edtAltitudeTerminalGuidance.Caption := 'null';
        edtAltitudeTerminalGuidance.Enabled := false;
        edtPeriodTerminalGuidance.Caption := FormatFloat('0.00', FDef.Terminal_Sinuation_Period);
        edtAmplitudeTerminalGuidance.Caption := FormatFloat('0.0', FDef.Terminal_Sinuation_Amplitude);
      end;
    end;

    edtRangeSeekerTurnGuidance.Caption := FormatFloat('0.00', FDef.Seeker_TurnOn_Range);
    chkRangeSeekerTurnGuidance.Checked := Boolean(FDef.Fixed_Seeker_Turn_On_Range);

    edtRangeSeekerDetectionGuidance.Caption := FormatFloat('0.00', FDef.Term_Guide_Range);
    edtAzimuthSeekerDetectionGuidance.Caption := FormatFloat('0.0', FDef.Term_Guide_Azimuth);
    edtElevationSeekerDetectionGuidance.Caption := FormatFloat('0.0', FDef.Term_Guide_Elevation);

    chkTerminalAcqGuidance.Checked := Boolean(FDef.Terminal_Altitude_Required);
    edtCommandAltitudeGuidance.Caption := FormatFloat('0', FDef.Terminal_Acquisition_Altitude);

    chkWaypointUserGuidance.Checked := Boolean(FDef.Wpt_Capable);
    edtmaxNumWaypointGuidance.Caption := IntToStr(FDef.Max_Num_Wpts);
    edtMinFinalWaypointGuidance.Caption := FormatFloat('0.0', FDef.Min_Final_Leg_Length);

    edtMaxFiringGuidance.Caption := FormatFloat('0.00', FDef.Max_Firing_Depth);
    edtDefaultCruiseGuidance.Caption := FormatFloat('0', FDef.Default_Altitude);
    {$ENDREGION}

    {$REGION ' Seeker Setting '}
    edtRangeTARH.Caption := IntToStr(FDef.Spot_Number);

    case FDef.ECCM_Type of
      0: edtECCMMissileType.Caption := eccmsMissileA;
      1: edtECCMMissileType.Caption := eccmsMissileB;
      2: edtECCMMissileType.Caption := eccmsMissileC;
    end;

    case FDef.ECM_Detonation of
      0: edtECMDeto.Caption := detosECMMissileNoResponse;
      1: edtECMDeto.Caption := detosECMMissileOnChaff;
    end;

    case FDef.ECM_Detection of
      0: edtECMDetect.Caption := detectsECMMissileChaff;
      1: edtECMDetect.Caption := detectsECMMissileNoChaff;
    end;

    case FDef.IRCM_Detonation of
      0: edtIRCMDeto.Caption := detosIRCMMissileNoResponse;
      1: edtIRCMDeto.Caption := detosIRCMMissileOnChaff;
    end;

    case FDef.IRCM_Detection of
      0: edtIRCMDetect.Caption := detectsIRCMMissileChaff;
      1: edtIRCMDetect.Caption := detectsIRCMMissileNoChaff;
    end;

    edtFreqTerminalTARH.Caption := FormatFloat('0.000', FDef.Transmitted_Frequency);
    edtPulseRepTerminalTARH.Caption := FormatFloat('0.000', FDef.Pulse_Rep_Freq);
    edtPulseWidthTerminalTARH.Caption := FormatFloat('0.00', FDef.Pulse_Width);
    edtScanRateTerminalTARH.Caption := FormatFloat('0.00', FDef.Scan_Rate);
    edtTransmitterPowerTerminalTARH.Caption := FormatFloat('0.00', FDef.Xmit_Power);

    edtUpperLimitReceivedFreqTARH.Caption := FormatFloat('0.000', FDef.Upper_Received_Freq);
    edtLowerLimitReceivedFreqTARH.Caption := FormatFloat('0.000', FDef.Lower_Received_Freq);

    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmMissileView.UpdateMissileList;
var
  i : Integer;
  missile : TMissile_On_Board;

begin
  lstMissile.Items.Clear;

  dmTTT.GetAllMissileDef(FMissileList);

  for i := 0 to FMissileList.Count - 1 do
  begin
    missile := FMissileList.Items[i];
    lstMissile.Items.AddObject(missile.FDef.Class_Identifier, missile);
  end;
end;

procedure TfrmMissileView.UpdateMotionData;
var
  motion : TMotion_Characteristics;
begin
  with FSelectedMissile do
  begin
    dmTTT.GetMotionCharacteristicDef(FDef.Motion_Index, motion);

    if Assigned(motion) then
      edtMotionCharMissile.Caption := motion.FData.Motion_Identifier
    else
      edtMotionCharMissile.Caption := 'none';

    motion.Free;
  end;
end;

function TfrmMissileView.SetWeaponCategory(aValue: Integer): string;
begin
  case aValue of
    Byte(wcMissileAirToSurfaceSubsurface) : Result := 'Air to Surface/Subsurface';
    Byte(wcMissileSurfaceSubsurfaceToSurfaceSubsurface) : Result := 'Surface/Subsurface to Surface/Subsurface';
    Byte(wcMissileSurfaceSubsurfaceToAir) : Result := 'Surface/Subsurface to Air';
    Byte(wcMissileAirToAir) : Result := 'Air to Air';
    Byte(wcMissileLandAttack) : Result := 'Land Attack';
  end;
end;

procedure TfrmMissileView.UpdatePrimaryTargetDomainItems(Sender:TObject);
begin
  FTargetDomainList.Clear;
  edtPrimaryTargetDomain.Caption := 'none';

  if chkAntiSurface.Checked or chkAntiSubsurface.Checked then
  begin
    FTargetDomainList.Add('Air to Surface/Subsurface');
    FTargetDomainList.Add('Surface/Subsurface to Surface/Subsurface');
  end;

  if chkAntiAir.Checked then
  begin
    FTargetDomainList.Add('Surface/Subsurface to Air');
    FTargetDomainList.Add('Air to Air');
  end;

  if chkAntiLand.Checked then
    FTargetDomainList.Add('Land Attack');
end;

procedure TfrmMissileView.UpdateHybridData;
begin
  if FSelectedHybrid.FTorpedo_Def.Torpedo_Index = 0 then
    edtHybridTorpedoDef.Caption := 'None'
  else
    edtHybridTorpedoDef.Caption := FSelectedHybrid.FTorpedo_Def.Class_Identifier;
end;

procedure TfrmMissileView.UpdateTabPage;
begin

  {$REGION ' Setting Tab '}
  case tabIndex of
    0:
    begin
      lblTab.Caption := 'GENERAL';
      pnlTabGeneral.BringToFront;
    end;
    1:
    begin
      lblTab.Caption := 'PHYSICAL';
      pnlTabPhysical.BringToFront;
    end;
    2:
    begin
      lblTab.Caption := 'POH MODIFIER';
      pnlTabPOH.BringToFront;
    end;
    3:
    begin
      lblTab.Caption := 'GUIDANCE';
      pnlTabGuidance.BringToFront;
    end;
    4:
    begin
      lblTab.Caption := 'SEEKER SETTINGS';
      pnlTabSeekerSettings.BringToFront;
    end;
    5:
    begin
      lblTab.Caption := 'NOTE';
      pnlTabNotes.BringToFront;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Setting Button Prev-Next '}
  ImgBtnPreviousTab.Visible := True;
  ImgBtnNextTab.Visible := True;

  if tabIndex = 0 then
    ImgBtnPreviousTab.Visible := false
  else if tabIndex = tabMax then
    ImgBtnNextTab.Visible := false;
  {$ENDREGION}

end;

{$ENDREGION}

end.
