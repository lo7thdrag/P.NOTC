unit uFrmSubSurfaceView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, uDBAsset_Vehicle, uDBAssetObject, uSimContainers, tttData,
  uDBAsset_MotionCharacteristics;

type
  TfrmSubSurfaceView = class(TForm)
    ImgBackgroundList: TImage;
    lstSubSurface: TListBox;
    ImgBackground: TImage;
    Label4: TLabel;
    Label2: TLabel;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    lblName: TLabel;
    pnlTabAssets: TPanel;
    Image6: TImage;
    Label49: TLabel;
    Label6: TLabel;
    Label62: TLabel;
    btnAssetAccousticDecoy: TButton;
    btnAssetAirBubble: TButton;
    btnAssetBombs: TButton;
    btnAssetChaff: TButton;
    btnAssetEOD: TButton;
    btnAssetESM: TButton;
    btnAssetFloatingDecoy: TButton;
    btnAssetGuns: TButton;
    btnAssetIFF: TButton;
    btnAssetInfraredDecoy: TButton;
    btnAssetMAD: TButton;
    btnAssetMines: TButton;
    btnAssetMissiles: TButton;
    btnAssetRadar: TButton;
    btnAssetRadarNoiseJammer: TButton;
    btnAssetSelfDefensiveJammer: TButton;
    btnAssetSonar: TButton;
    btnAssetSonobuoy: TButton;
    btnAssetTorpedoes: TButton;
    btnAssetTowedJammer: TButton;
    btnAssetVisualDetector: TButton;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    pnlTabChar: TPanel;
    Image4: TImage;
    Label8: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtMaxDropAltitude: TLabel;
    edtMinDropAltitude: TLabel;
    edtMaxDropSpeed: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label41: TLabel;
    edtMaxNumbToMonitor: TLabel;
    edtMaxDeployAltitude: TLabel;
    edtMinDeployAltitude: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    edtMaxDeploySpeed: TLabel;
    Label63: TLabel;
    Label59: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    edtHullMounted: TLabel;
    edtTowedArray: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Panel1: TPanel;
    Panel4: TPanel;
    chkSonobuoyCapable: TCheckBox;
    Panel3: TPanel;
    pnlTabGeneral: TPanel;
    Image2: TImage;
    Label16: TLabel;
    Label26: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label28: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtDomain: TLabel;
    Label38: TLabel;
    edtCategory: TLabel;
    Label43: TLabel;
    edtDetectabilityType: TLabel;
    Label37: TLabel;
    Label12: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    edtAntennaHeight: TLabel;
    Label47: TLabel;
    edtMaxCom: TLabel;
    Label51: TLabel;
    edtAntennaAboveWater: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    Label58: TLabel;
    Label23: TLabel;
    Label44: TLabel;
    edtType: TLabel;
    Label121: TLabel;
    Label143: TLabel;
    edtQuantityGroupPersonal: TLabel;
    Label36: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    lblDamageSustainability: TLabel;
    Label55: TLabel;
    Label57: TLabel;
    Panel2: TPanel;
    chkBarrier: TCheckBox;
    chkNavigation: TCheckBox;
    chkUHFVoice: TCheckBox;
    chkHFLink: TCheckBox;
    chkHFVoice: TCheckBox;
    chkUHFLink: TCheckBox;
    Panel5: TPanel;
    chkUHFMessageHandling: TCheckBox;
    chkHFMessageHandling: TCheckBox;
    chkSATCOMMessageHAndling: TCheckBox;
    chkUnderwater: TCheckBox;
    chkSatcom: TCheckBox;
    Panel22: TPanel;
    trckbrDamageSustainability: TTrackBar;
    pnlTabModel: TPanel;
    Image1: TImage;
    lblNamaKapal: TLabel;
    ImgModel: TImage;
    ImgBtnPreviousModel: TImage;
    ImgBtnNextModel: TImage;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    pnlTabPeriscope: TPanel;
    Image7: TImage;
    Label106: TLabel;
    Label107: TLabel;
    Label7: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    edtFrontRadar: TLabel;
    Label120: TLabel;
    edtSideRadar: TLabel;
    Label122: TLabel;
    edtFrontInfrared: TLabel;
    Label124: TLabel;
    edtSideInfrared: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    edtSideVisual: TLabel;
    Label130: TLabel;
    edtFrontVisual: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    edtMaxOperatPeriscope: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    edtHighAbovePeriscope: TLabel;
    Label141: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    pnlTabPhysical: TPanel;
    Image3: TImage;
    Label1: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    edtMotionCharacterictic: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    edtLengthDimension: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label119: TLabel;
    edtWidthDimension: TLabel;
    Label123: TLabel;
    Label140: TLabel;
    Label142: TLabel;
    edtEngagementRangeDimension: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    edtHeightDimension: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    edtWeightDimension: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    edtDraftDimension: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    edtMinSpeedAcousticPhysical: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    Label166: TLabel;
    edtMaxSpeedAcousticPhysical: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    edtCavitationSpeedAcousticPhysical: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    edtBelowCavitationAcousticPhysical: TLabel;
    Label176: TLabel;
    Label177: TLabel;
    Label178: TLabel;
    edtAboveCavitationAcousticPhysical: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    Label182: TLabel;
    Label183: TLabel;
    edtFrontRadarPhysical: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    edtSideRadarPhysical: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    edtFrontAcousticPhysical: TLabel;
    Label194: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    edtSideAcousticPhysical: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    Label200: TLabel;
    Label201: TLabel;
    edtFrontVisualPhysical: TLabel;
    Label203: TLabel;
    Label204: TLabel;
    Label205: TLabel;
    edtSideVisualPhysical: TLabel;
    Label207: TLabel;
    Label208: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    edtFrontInfraredPhysical: TLabel;
    Label212: TLabel;
    Label213: TLabel;
    Label214: TLabel;
    edtSideInfraredPhysical: TLabel;
    Label216: TLabel;
    Label217: TLabel;
    edtMagneticPhysical: TLabel;
    Label15: TLabel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel23: TPanel;
    pnlTabPOH: TPanel;
    Image5: TImage;
    Label5: TLabel;
    Label66: TLabel;
    Label69: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    lblActiveAcousticTorpedo: TLabel;
    lblPassiveAcousticTorpedo: TLabel;
    lblActivePassiveAcousticTorpedo: TLabel;
    lblWakeHomingTorpedo: TLabel;
    lblWireGuidedTorpedo: TLabel;
    lblAntiRadiationMissile: TLabel;
    lblInfraredMissile: TLabel;
    lblSemiActiveMissile: TLabel;
    lblTerminalActiveMissile: TLabel;
    lblAcousticMine: TLabel;
    lblImpactMine: TLabel;
    lblMagneticMine: TLabel;
    lblPressureMine: TLabel;
    trckbrWakeHomingTorpedo: TTrackBar;
    trckbrWireGuidedTorpedo: TTrackBar;
    trckbrActivePassiveAcousticTorpedo: TTrackBar;
    trckbrPassiveAcousticTorpedo: TTrackBar;
    trckbrActiveAcousticTorpedo: TTrackBar;
    trckbrPressureMine: TTrackBar;
    trckbrMagneticMine: TTrackBar;
    trckbrImpactMine: TTrackBar;
    trckbrAcousticMine: TTrackBar;
    trckbrInfraredMissile: TTrackBar;
    trckbrSemiActiveMissile: TTrackBar;
    trckbrTerminalActiveMissile: TTrackBar;
    trckbrAntiRadiationMissile: TTrackBar;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    lblsearch: TLabel;
    edtCheat: TEdit;
    cbGangwayFront: TCheckBox;
    cbGangwayRear: TCheckBox;
    cbGangwayPort: TCheckBox;
    cbGangwayStarboard: TCheckBox;
    ImgBtnBack: TImage;
    procedure ImgBtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure ImgBtnPreviousModelClick(Sender: TObject);
    procedure ImgBtnNextModelClick(Sender: TObject);
    procedure UpdateCbbCategoryItems;
    procedure UpdateCbbTypeItems;
    procedure btnAssetClick(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    tabIndex, tabMax, modelIndex, modelIndexMax : Integer;
    FPlatInstList : TList;
    FSubSurfaceVehicleList : TList;
    FSelectedSubSurfaceVehicle : TVehicle_Definition;
  public
    { Public declarations }

    procedure UpdateTabPage;
    procedure UpdateModelPanel;
    procedure UpdateSubSurfaceVehicleList;
    procedure UpdateSubSurfaceVehicleData;
    procedure UpdateMotionData;

    procedure UpdatePIIdentData;
  end;

var
  frmSubSurfaceView: TfrmSubSurfaceView;

implementation

uses
uDataModuleTTT, ufrmAssetDetail;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSubSurfaceView.btnAssetClick(Sender: TObject);
begin
  if Assigned (FSelectedSubSurfaceVehicle) then
  begin
    frmAssetDetail := TfrmAssetDetail.Create(Self);
    try
      with frmAssetDetail do
      begin
        SelectedVehicle := FSelectedSubSurfaceVehicle;
        ButtonTag := TButton(Sender).Tag;
        ShowModal;
      end;

    finally
      frmAssetDetail.Free;
    end;
  end;
end;

procedure TfrmSubSurfaceView.edtCheatKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
  subsurfacevehicle : TVehicle_Definition;
begin
  if Key = #13 then
  begin

  lstSubSurface.Items.Clear;

  dmTTT.GetFilterVehicleDef(FSubSurfaceVehicleList, edtCheat.Text);
    for i := 0 to FSubSurfaceVehicleList.Count - 1 do
    begin
 subsurfacevehicle := FSubSurfaceVehicleList.Items[i];
    lstSubSurface.Items.AddObject(subsurfacevehicle.FData.Vehicle_Identifier, subsurfacevehicle);
    end;
  end;
end;

procedure TfrmSubSurfaceView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FSubSurfaceVehicleList);

  Action := cafree;
end;

procedure TfrmSubSurfaceView.FormCreate(Sender: TObject);
begin
  FSubSurfaceVehicleList := TList.Create;
end;

procedure TfrmSubSurfaceView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 7;

  modelIndex := 0;
  modelIndexMax := 0;

  UpdateTabPage;
  UpdateSubSurfaceVehicleList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSubSurfaceView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSubSurfaceView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmSubSurfaceView.ImgBtnNextModelClick(Sender: TObject);
begin
  modelIndex := modelIndex + 1;

  UpdateModelPanel
end;

procedure TfrmSubSurfaceView.ImgBtnPreviousModelClick(Sender: TObject);
begin
  modelIndex := modelIndex - 1;
  UpdateModelPanel
end;

procedure TfrmSubSurfaceView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmSubSurfaceView.lbSingleClick(Sender: TObject);
begin
  if lstSubSurface.ItemIndex = -1 then
    Exit;

  FSelectedSubSurfaceVehicle := TVehicle_Definition(lstSubSurface.Items.Objects[lstSubSurface.ItemIndex]);

  UpdateSubSurfaceVehicleData;
end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmSubSurfaceView.UpdateSubSurfaceVehicleData;
var
  i : Integer;
  piIdent : TPlatform_Instance_Identifier;
  hostPlatList : TList;
  hostPlat : THosted_Platform;
  timeStr : string;

begin
  with FSelectedSubSurfaceVehicle do
  begin
//    if FData.Vehicle_Index = 0 then
//      edtClass.Text := '(Unnamed)'
//    else
//      edtClass.Text := FData.Vehicle_Identifier;

    lblName.Caption := FData.Vehicle_Identifier;

    {$REGION ' General '}

    case FData.Platform_Domain of
      Ord(vhdAir) : edtDomain.Caption := vhdsAir;
      Ord(vhdSurface) : edtDomain.Caption := vhdsSurface;
      Ord(vhdSubsurface) : edtDomain.Caption := vhdsSubsurface;
      Ord(vhdLand) : edtDomain.Caption := vhdsLand;
      Ord(vhdAmphibious) : edtDomain.Caption := vhdsAmphibious;
      Ord(vhdWreck) : edtDomain.Caption := vhdsWreck;
      Ord(vhdGeneral) : edtDomain.Caption := vhdsGeneral;
      Ord(vhdGrpPersonel) : edtDomain.Caption := vhdsGrpPersonel;
      Ord(vhdTarget) : edtDomain.Caption := vhdsTarget;
    end;

    UpdateCbbCategoryItems;

    case FData.Detectability_Type of
      Ord(dtNormalDetection) : edtDetectabilityType.Caption := dtsNormalDetection;
      Ord(dtUndetectable) : edtDetectabilityType.Caption := dtsUndetectable;
      Ord(dtPassiveDetection) : edtDetectabilityType.Caption := dtsPassiveDetection;
      Ord(dtAlwaysVisible) : edtDetectabilityType.Caption := dtsAlwaysVisible;
    end;

    chkBarrier.Checked := FData.Chaff_Capability;
    chkNavigation.Checked := FData.Nav_Light_Capable;

    chkHFLink.Checked := FData.HF_Link_Capable;
    chkUHFLink.Checked := FData.UHF_Link_Capable;
    chkHFVoice.Checked := FData.HF_Voice_Capable;
    chkUHFVoice.Checked := FData.UHF_Voice_Capable;
    chkSatcom.Checked := FData.SATCOM_Voice_Capable;
    chkUnderwater.Checked := FData.UWT_Voice_Capable;
    chkHFMessageHandling.Checked := FData.HF_MHS_Capable;
    chkUHFMessageHandling.Checked := FData.UHF_MHS_Capable;
    chkSATCOMMessageHAndling.Checked := FData.SATCOM_MHS_Capable;

    edtAntennaHeight.Caption := FormatFloat('0', FData.Rel_Comm_Antenna_Height);
    edtAntennaAboveWater.Caption := FormatFloat('0', FData.Sub_Comm_Antenna_Height);
    edtMaxCom.Caption := FormatFloat('0', FData.Max_Comm_Operating_Depth);

    trckbrDamageSustainability.Position := FData.Damage_Capacity;
    lblDamageSustainability.Caption := IntToStr(FData.Damage_Capacity);
    {$ENDREGION}

    {$REGION ' Model '}
    modelIndex := 0;
    if modelIndex = 0 then
      ImgBtnPreviousModel.Visible := false;
      ImgBtnNextModel.Visible := true;

    UpdatePIIdentData;

    {$ENDREGION}

    {$REGION ' Physical '}
    UpdateMotionData;

    edtLengthDimension.Caption := FormatFloat('0', FData.Length);
    edtWidthDimension.Caption := FormatFloat('0', FData.Width);
    edtHeightDimension.Caption := FormatFloat('0', FData.Height);
    edtEngagementRangeDimension.Caption := FormatFloat('0', FData.Engagement_Range);
    edtDraftDimension.Caption := FormatFloat('0', FData.Draft);

    edtMinSpeedAcousticPhysical.Caption := FormatFloat('0.0', FData.LSpeed_Acoustic_Intens);
    edtBelowCavitationAcousticPhysical.Caption := FormatFloat('0.0', FData.Below_Cav_Acoustic_Intens);
    edtAboveCavitationAcousticPhysical.Caption := FormatFloat('0.0', FData.Above_Cav_Acoustic_Intens);
    edtMaxSpeedAcousticPhysical.Caption := FormatFloat('0.0', FData.HSpeed_Acoustic_Intens);
    edtCavitationSpeedAcousticPhysical.Caption := FormatFloat('0.00', FData.Cavitation_Speed_Switch);

    edtFrontRadarPhysical.Caption := FormatFloat('0.00', FData.Front_Radar_Cross);
    edtSideRadarPhysical.Caption := FormatFloat('0.00', FData.Side_Radar_Cross);

    edtFrontAcousticPhysical.Caption := FormatFloat('0.00', FData.Front_Acoustic_Cross);
    edtSideAcousticPhysical.Caption := FormatFloat('0.00', FData.Side_Acoustic_Cross);

    edtFrontVisualPhysical.Caption := FormatFloat('0.0', FData.Front_Visual_EO_Cross);
    edtSideVisualPhysical.Caption := FormatFloat('0.0', FData.Side_Visual_EO_Cross);

    edtFrontInfraredPhysical.Caption := FormatFloat('0.0', FData.Front_Infrared_Cross);
    edtSideInfraredPhysical.Caption := FormatFloat('0.0', FData.Side_Infrared_Cross);

    edtMagneticPhysical.Caption := FormatFloat('0.00', FData.Magnetic_Cross);
    {$ENDREGION}

    {$REGION ' Characteristic '}
    edtMaxDropAltitude.Caption := IntToStr(FData.Air_Drop_Torpedo_Max_Altitude);
    edtMinDropAltitude.Caption := IntToStr(FData.Air_Drop_Torpedo_Min_Altitude);
    edtMaxDropSpeed.Caption := IntToStr(FData.Air_Drop_Torpedo_Max_Speed);

    edtHullMounted.Caption := FormatFloat('0.0', FData.HMS_Noise_Reduction_Factor);
    edtTowedArray.Caption := FormatFloat('0.0', FData.TAS_Noise_Reduction_Factor);

    edtMaxNumbToMOnitor.Caption := IntToStr(FData.Max_Sonobuoys_To_Monitor);
    edtMaxDeployAltitude.Caption := IntToStr(FData.Sonobuoy_Deploy_Max_Altitude);
    edtMinDeployAltitude.Caption := IntToStr(FData.Sonobuoy_Deploy_Min_Altitude);
    edtMaxDeploySpeed.Caption := IntToStr(FData.Sonobuoy_Deploy_Max_Speed);
    {$ENDREGION}

    {$REGION ' POH modifier '}
    trckbrAntiRadiationMissile.Position := Round(FData.AR_POH_Modifier * 100);
    lblAntiRadiationMissile.Caption := trckbrAntiRadiationMissile.Position.ToString;
    trckbrInfraredMissile.Position := Round(FData.IR_POH_Modifier * 100);
    lblInfraredMissile.Caption := trckbrInfraredMissile.Position.ToString;
    trckbrSemiActiveMissile.Position := Round(FData.SARH_POH_Modifier * 100);
    lblSemiActiveMissile.Caption := trckbrSemiActiveMissile.Position.ToString;
    trckbrTerminalActiveMissile.Position := Round(FData.TARH_POH_Modifier * 100);
    lblTerminalActiveMissile.Caption := trckbrTerminalActiveMissile.Position.ToString;

    trckbrActiveAcousticTorpedo.Position := Round(FData.Active_Acoustic_Tor_POH_Mod * 100);
    lblActiveAcousticTorpedo.Caption := trckbrActiveAcousticTorpedo.Position.ToString;
    trckbrPassiveAcousticTorpedo.Position := Round(FData.Passive_Acoustic_Tor_POH_Mod * 100);
    lblPassiveAcousticTorpedo.Caption := trckbrPassiveAcousticTorpedo.Position.ToString;
    trckbrActivePassiveAcousticTorpedo.Position := Round(FData.Active_Passive_Tor_POH_Mod * 100);
    lblActivePassiveAcousticTorpedo.Caption := trckbrActivePassiveAcousticTorpedo.Position.ToString;
    trckbrWakeHomingTorpedo.Position := Round(FData.Wake_Home_POH_Modifier * 100);
    lblWakeHomingTorpedo.Caption := trckbrWakeHomingTorpedo.Position.ToString;
    trckbrWireGuidedTorpedo.Position := Round(FData.Wire_Guide_POH_Modifier * 100);
    lblWireGuidedTorpedo.Caption := trckbrWireGuidedTorpedo.Position.ToString;

    trckbrAcousticMine.Position := Round(FData.Acoustic_Mine_POH_Modifier * 100);
    lblAcousticMine.Caption := trckbrAcousticMine.Position.ToString;
    trckbrImpactMine.Position := Round(FData.Impact_Mine_POH_Modifier * 100);
    lblImpactMine.Caption := trckbrImpactMine.Position.ToString;
    trckbrMagneticMine.Position := Round(FData.Mag_Mine_POH_Modifier * 100);
    lblMagneticMine.Caption := trckbrMagneticMine.Position.ToString;
    trckbrPressureMine.Position := Round(FData.Press_Mine_POH_Modifier * 100);
    lblPressureMine.Caption := trckbrPressureMine.Position.ToString;
    {$ENDREGION}

    {$REGION ' Assets '}
//    UpdateVehicleAssetTools;

//    hostPlatList := TList.Create;
//    dmTTT.GetHostedPlatform(FSelectedVehicle.FData.Vehicle_Index, hostPlatList);

//    cbbBasingType.ItemIndex := GetBasingType(hostPlatList);

//    for i := hostPlatList.Count - 1 downto 0 do
//    begin
//      hostPlat := hostPlatList.Items[i];
//      hostPlat.Free;
//    end;
//
//    hostPlatList.Free;

//    SecondToTime(FData.Readying_Time, timeStr);
//    edtRefuelTime.Text := timeStr;

//    SecondToTime(Round(FData.Alert_State_Time), timeStr);
//    edtLaunchAlertTime.Text := timeStr;

    {$ENDREGION}

    {$REGION ' Periscope '}
    edtMaxOperatPeriscope.Caption := FormatFloat('0', FData.Periscope_Depth);
    edtHighAbovePeriscope.Caption := FormatFloat('0', FData.Periscope_Height_Above_Water);
    edtFrontRadar.Caption := FormatFloat('0.00', FData.Periscope_Front_Radar_Xsection);
    edtSideRadar.Caption := FormatFloat('0.00', FData.Periscope_Side_Radar_Xsection);
    edtFrontInfrared.Caption := FormatFloat('0.0', FData.Periscope_Front_IR_Xsection);
    edtSideInfrared.Caption := FormatFloat('0.0', FData.Periscope_Side_IR_Xsection);
    edtFrontVisual.Caption := FormatFloat('0.0', FData.Periscope_Front_Vis_Xsection);
    edtSideVisual.Caption := FormatFloat('0.0', FData.Periscope_Side_Vis_Xsection);
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmSubSurfaceView.UpdateSubSurfaceVehicleList;
var
  i : Integer;
  subsurfacevehicle : TVehicle_Definition;
begin
  lstSubSurface.Items.Clear;

  dmTTT.GetFilterVehicleDefByDomain(FSubSurfaceVehicleList, Ord(vhdSubsurface));

  for i := 0 to FSubSurfaceVehicleList.Count - 1 do
  begin
    subsurfacevehicle := FSubSurfaceVehicleList.Items[i];
    lstSubSurface.Items.AddObject(subsurfacevehicle.FData.Vehicle_Identifier, subsurfacevehicle);
  end;
end;

procedure TfrmSubSurfaceView.UpdateMotionData;
var
  motion : TMotion_Characteristics;
begin
  with FSelectedSubSurfaceVehicle.FData do
  begin
    dmTTT.GetMotionCharacteristicDef(Motion_Characteristics, motion);

    if Assigned(motion) then
      edtMotionCharacterictic.Caption := motion.FData.Motion_Identifier
    else
      edtMotionCharacterictic.Caption := 'none';

    motion.Free;
  end;
end;

procedure TfrmSubSurfaceView.UpdateCbbCategoryItems;
begin
  with FSelectedSubSurfaceVehicle do
  begin
    case FData.Platform_Domain of
    0: //Air
    begin
      case FData.Platform_Category of
        Ord(vhcAirMilittary) : edtCategory.Caption := vhcsAirMilittary;
        Ord(vhcAirCivilian) : edtCategory.Caption := vhcsAirCivilian;
        Ord(vhcAirOther) : edtCategory.Caption := vhcsAirOther;
      end;

      UpdateCbbTypeItems;
    end;
    1: //Surface
    begin
      case FData.Platform_Category of
        Ord(vhcSurfaceCombatant) : edtCategory.Caption := vhcsSurfaceCombatant;
        Ord(vhcSurfaceNonCombat) : edtCategory.Caption := vhcsSurfaceNonCombat;
        Ord(vhcSurfaceNonNaval) : edtCategory.Caption := vhcsSurfaceNonNaval;
        Ord(vhcSurfaceOther) : edtCategory.Caption := vhcsSurfaceOther;
      end;

      UpdateCbbTypeItems;
    end;
    2: //Subsurface
    begin
      case FData.Platform_Category of
        Ord(vhcSubsurfaceSubmarine) : edtCategory.Caption := vhcsSubsurfaceSubmarine;
        Ord(vhcSubsurfaceOther) : edtCategory.Caption := vhcsSubsurfaceOther;
      end;

      UpdateCbbTypeItems;
    end;
    3: //Land
    begin
      case FData.Platform_Category of
        Ord(vhcLandArmoured) : edtCategory.Caption := vhcsLandArmoured;
        Ord(vhcLandTransport) : edtCategory.Caption := vhcsLandTransport;
        Ord(vhcLandInfantry) : edtCategory.Caption := vhcsLandInfantry;
        Ord(vhcLandArtillery) : edtCategory.Caption := vhcsLandArtillery;
        Ord(vhcLandOther) : edtCategory.Caption := vhcsLandOther;
      end;

      UpdateCbbTypeItems;
    end;
    4: //Amphibious
    begin
      case FData.Platform_Category of
        Ord(vhcAmphibiousAmphibious) : edtCategory.Caption := vhcsAmphibiousAmphibious;
        Ord(vhcAmphibiousOther) : edtCategory.Caption := vhcsAmphibiousOther;
      end;

      UpdateCbbTypeItems;
    end;
  end;
  end;

end;

procedure TfrmSubSurfaceView.UpdateCbbTypeItems;
begin
  with FSelectedSubSurfaceVehicle.FData do
  begin
    {$REGION ' Air '}
    if Platform_Domain = 0 then
    begin
      case Platform_Category of
        0, 1 ,2: {Military, Civilian, Other }
        begin
          case Platform_Type of
            Ord(vhtAirFixedWing) : edtType.Caption := vhtsAirFixedWing;
            Ord(vhtAirRotaryWing) : edtType.Caption := vhtsAirRotaryWing;
            Ord(vhtAirSeaPlane) : edtType.Caption := vhtsAirSeaPlane;
            Ord(vhtAirOther) : edtType.Caption := vhtsAirOther;
          end;
        end;
      end;
    end
    {$ENDREGION}

    {$REGION ' Surface '}
    else if Platform_Domain = 1 then
    begin
      case Platform_Category of
        0: {Combatant }
        begin
          case Platform_Type of
            Ord(vhtSurfaceCombatFrigate) : edtType.Caption := vhtsSurfaceCombatFrigate;
            Ord(vhtSurfaceCombatDestroyer) : edtType.Caption := vhtsSurfaceCombatDestroyer;
            Ord(vhtSurfaceCombatKorvet) : edtType.Caption := vhtsSurfaceCombatKorvet;
            Ord(vhtSurfaceCombatAircraftCarrier) : edtType.Caption := vhtsSurfaceCombatAircraftCarrier;
            Ord(vhtSurfaceCombatPatrolCraft) : edtType.Caption := vhtsSurfaceCombatPatrolCraft;
            Ord(vhtSurfaceCombatMineWarfare) : edtType.Caption := vhtsSurfaceCombatMineWarfare;
          end;
        end;
        1: {Non-Combatant }
        begin
          case Platform_Type of
            Ord(vhtSurfaceNonCombatAuxiliary) : edtType.Caption := vhtsSurfaceNonCombatAuxiliary;
            Ord(vhtSurfaceNonCombatMerchant) : edtType.Caption := vhtsSurfaceNonCombatMerchant;
          end;
        end;
        2: {Non Naval}
        begin
          case Platform_Type of
            Ord(vhtSurfaceNonNavalPassangerShip) : edtType.Caption := vhtsSurfaceNonNavalPassangerShip;
            Ord(vhtSurfaceNonNavalCarge) : edtType.Caption := vhtsSurfaceNonNavalCarge;
            Ord(vhtSurfaceNonNavalTanker) : edtType.Caption := vhtsSurfaceNonNavalTanker;
          end;
        end;
        3: {Other }
        begin
          case Platform_Type of
            Ord(vhtSurfaceOtherOther) : edtType.Caption := vhtsSurfaceOtherOther;
          end;
        end;
      end;
    end
    {$ENDREGION}

    {$REGION ' Subsurface '}
    else if Platform_Domain = 2 then
    begin
      case Platform_Category of
        0: {Submarine }
        begin
          case Platform_Type of
            Ord(vhtSubsurfaceSubmarineDiesel) : edtType.Caption := vhtsSubsurfaceSubmarineDiesel;
            Ord(vhtSubsurfaceSubmarineNuclear) : edtType.Caption := vhtsSubsurfaceSubmarineNuclear;
          end;
        end;
        1: {Other }
        begin
          case Platform_Type of
            Ord(vhtSubsurfaceOtherOther) : edtType.Caption := vhtsSubsurfaceOtherOther;
          end;
        end;
      end;
    end
    {$ENDREGION}

    {$REGION ' Land '}
    else if Platform_Domain = 3 then
    begin
      case Platform_Category of
        0: {Armoured Vehicle }
        begin
          case Platform_Type of
            Ord(vhtLandArmourMainBattleTank) : edtType.Caption := vhtsLandArmourMainBattleTank;
            Ord(vhtLandArmourArmouredPersonelCarrier) : edtType.Caption := vhtsLandArmourArmouredPersonelCarrier;
          end;
        end;
        1: {Transport Vehicle }
        begin
          case Platform_Type of
            Ord(vhtLandTransportTruck) : edtType.Caption := vhtsLandTransportTruck;
            Ord(vhtLandTransportUtilityVehicle) : edtType.Caption := vhtsLandTransportUtilityVehicle;
          end;
        end;
        2: {Infantry }
        begin
          case Platform_Type of
            Ord(vhtLandInfantryGroupPersonel) : edtType.Caption := vhtsLandInfantryGroupPersonel;
            Ord(vhtLandInfantryOther) : edtType.Caption := vhtsLandInfantryOther;
          end;
        end;
        3: {Artillery }
        begin
          case Platform_Type of
            Ord(vhtLandArtilleryFieldArtillery) : edtType.Caption := vhtsLandArtilleryFieldArtillery;
            Ord(vhtLandArtilleryAntiAircraftArtillery) : edtType.Caption := vhtsLandArtilleryAntiAircraftArtillery;
            Ord(vhtLandArtilleryCoastalDefenseArtillery) : edtType.Caption := vhtsLandArtilleryCoastalDefenseArtillery;
            Ord(vhtLandArtilleryOther) : edtType.Caption := vhtsLandArtilleryOther;
          end;
        end;
      end;
    end
    {$ENDREGION}

    {$REGION ' Amphibious '}
    else if Platform_Domain = 4 then
    begin
      case Platform_Category of
        0: {Amphibious }
        begin
          case Platform_Type of
            Ord(vhtAmphibiousAmphibiousTank) : edtType.Caption := vhtsAmphibiousAmphibiousTank;
            Ord(vhtAmphibiousAmphibiousPersonelCarrier) : edtType.Caption := vhtsAmphibiousAmphibiousPersonelCarrier;
            Ord(vhtAmphibiousHovercraft) : edtType.Caption := vhtsAmphibiousHovercraft;
          end;
        end;
        1: {Other }
        begin
          case Platform_Type of
            Ord(vhtAmphibiousOther) : edtType.Caption := vhtsAmphibiousOther;
          end;
        end;
      end;
    end
    {$ENDREGION}
  end;

end;

procedure TfrmSubSurfaceView.UpdatePIIdentData;
var
  i : Integer;
  PIIdentifer : TPlatform_Instance_Identifier;
begin
  dmTTT.GetAllPlatformInstanceIdentifier(FSelectedSubSurfaceVehicle.FData.Vehicle_Index, FPlatInstList);

  if FPlatInstList.Count > 0 then
  begin
    PIIdentifer := FPlatInstList.Items[0];
    lblNamaKapal.Caption := PIIdentifer.FData.Instance_Identifier;

    try
      ImgModel.Picture.LoadFromFile('data\Image DBEditor\Interface\' + PIIdentifer.FData.model_path + '.PNG');
    except
      ImgModel.Picture.LoadFromFile('data\Image DBEditor\Interface\NoModel.PNG');
    end;

    modelIndexMax := FPlatInstList.Count - 1;
  end;
end;

procedure TfrmSubSurfaceView.UpdateModelPanel;
var
  i : Integer;
  PIIdentifer : TPlatform_Instance_Identifier;
begin

  {$REGION ' Setting Model Panel '}
  PIIdentifer := FPlatInstList.Items[modelIndex];
  lblNamaKapal.Caption := PIIdentifer.FData.Instance_Identifier;
  ImgModel.Picture.LoadFromFile(PIIdentifer.FData.model_path);
   try
    ImgModel.Picture.LoadFromFile('data\Image DBEditor\Interface\' + PIIdentifer.FData.model_path + '.PNG');
  except
    ImgModel.Picture.LoadFromFile('data\Image DBEditor\Interface\NoModel.PNG');
  end;

  {$ENDREGION}

  {$REGION ' Setting Button Prev-Next '}
  ImgBtnPreviousModel.Visible := True;
  ImgBtnNextModel.Visible := True;

  if modelIndex = 0 then
    ImgBtnPreviousModel.Visible := false
  else if modelIndex = modelIndexMax then
    ImgBtnNextModel.Visible := false;
  {$ENDREGION}
end;

procedure TfrmSubSurfaceView.UpdateTabPage;
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
      lblTab.Caption := 'MODEL';
      pnlTabModel.BringToFront;
    end;
    2:
    begin
      lblTab.Caption := 'PHYSICAL';
      pnlTabPhysical.BringToFront;
    end;
    3:
    begin
      lblTab.Caption := 'CHARACTERISTIC';
      pnlTabChar.BringToFront;
    end;
    4:
    begin
      lblTab.Caption := 'POH MODIFIER';
      pnlTabPOH.BringToFront;
    end;
    5:
    begin
      lblTab.Caption := 'ASSETS';
      pnlTabAssets.BringToFront;
    end;
    6:
    begin
      lblTab.Caption := 'PERISCOPE';
      pnlTabPeriscope.BringToFront;
    end;
    7:
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
