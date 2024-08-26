unit uVehicleAttributeWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, uDBAssetObject,uDBAsset_Vehicle;

type
  TfVehicleAttributeWindow = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtClass: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    pgc: TPageControl;
    tsGeneral: TTabSheet;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtName: TEdit;
    btnAdd: TButton;
    btnRemove: TButton;
    cbbCategory: TComboBox;
    cbbType: TComboBox;
    cbbDetectabilityType: TComboBox;
    grbCapabilities: TGroupBox;
    cbxNavigation: TCheckBox;
    cbxBarrier: TCheckBox;
    grbCommunication: TGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    cbxHFLink: TCheckBox;
    cbxUHFLink: TCheckBox;
    cbxHFVoice: TCheckBox;
    cbxUHFVoice: TCheckBox;
    cbxSatcom: TCheckBox;
    cbxUnderwater: TCheckBox;
    cbxHFMessageHandling: TCheckBox;
    cbxUHFMessageHandling: TCheckBox;
    cbxSATCOMMessageHAndling: TCheckBox;
    edtAntennaHeight: TEdit;
    edtAntennaAboveWater: TEdit;
    edtMaxCom: TEdit;
    grpDamage: TGroupBox;
    lbl10: TLabel;
    lbl11: TLabel;
    trckbDamage: TTrackBar;
    edtDamage: TEdit;
    lstName: TListBox;
    tsPhysical: TTabSheet;
    tsCharacteristic: TTabSheet;
    tsPOH: TTabSheet;
    tsAssets: TTabSheet;
    tsPeriscope: TTabSheet;
    tsNotes: TTabSheet;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtLengthDimension: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtWidthDimension: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtHeightDimension: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edtEngagementRangeDimension: TEdit;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edtDraftDimension: TEdit;
    Label25: TLabel;
    Bevel1: TBevel;
    Label20: TLabel;
    edtMotionCharacterictic: TEdit;
    sbSearchMotion: TSpeedButton;
    Bevel2: TBevel;
    Label21: TLabel;
    grbRadarPhysical: TGroupBox;
    Label22: TLabel;
    edtFrontRadarPhysical: TEdit;
    cbFrontRadarPhysical: TComboBox;
    Label26: TLabel;
    edtSideRadarPhysical: TEdit;
    cbSideRadarPhysical: TComboBox;
    grbAcousticPhysical: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    edtFrontAcousticPhysical: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    grbVisualPhysical: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    edtFrontVisualPhysical: TEdit;
    edtSideVisualPhysical: TEdit;
    grbInfraredPhysical: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    edtFrontInfraredPhysical: TEdit;
    edtSideInfraredPhysical: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    grbMagneticPhysical: TGroupBox;
    edtMagneticPhysical: TEdit;
    Bevel3: TBevel;
    grbAcousticIntensityPhysical: TGroupBox;
    Label39: TLabel;
    edtMinSpeedAcousticPhysical: TEdit;
    Label40: TLabel;
    edtBelowCavitationAcousticPhysical: TEdit;
    Label41: TLabel;
    edtAboveCavitationAcousticPhysical: TEdit;
    Label42: TLabel;
    edtMaxSpeedAcousticPhysical: TEdit;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    edtCavitationSpeedAcousticPhysical: TEdit;
    Label52: TLabel;
    Label53: TLabel;
    grpNotes: TGroupBox;
    redtNotes: TRichEdit;
    Bevel4: TBevel;
    Label61: TLabel;
    grpPeriscope: TGroupBox;
    Label57: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label58: TLabel;
    edtMaxOperatPeriscope: TEdit;
    edtHighAbovePeriscope: TEdit;
    grpRadar: TGroupBox;
    Label62: TLabel;
    Label65: TLabel;
    edtFontRadar: TEdit;
    edtSideRadar: TEdit;
    cbxFontRadar: TComboBox;
    cbxSideRadar: TComboBox;
    grpInfrared: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    edtFontInfrared: TEdit;
    edtSideInfrared: TEdit;
    grpVisual: TGroupBox;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    edtFontVisual: TEdit;
    edtSideVisual: TEdit;
    grpSensor: TGroupBox;
    btnRadar: TButton;
    btnMAD: TButton;
    btnESM: TButton;
    btnSonar: TButton;
    btnElectroOpticalDetector: TButton;
    btnIFF: TButton;
    btnVisualDetector: TButton;
    btnSonobuoy: TButton;
    grpWeapons: TGroupBox;
    btnMissiles: TButton;
    btnTorpedos: TButton;
    btnMines: TButton;
    btnGuns: TButton;
    btnBomb_DepthCharges: TButton;
    grpCountermeasures: TGroupBox;
    btnRadarJummer: TButton;
    btnAirBubble: TButton;
    btnAccousticDecoy: TButton;
    btnDefensiveJummer: TButton;
    btnTowedJummer_Decoy: TButton;
    btnFloatingDecoy: TButton;
    btnChaff: TButton;
    grpBasing: TGroupBox;
    btnEmbarkedPlatforms: TButton;
    btnHelicopterLimitations: TButton;
    cmbBasingType: TComboBox;
    grpReadyingTime: TGroupBox;
    labelRefuel: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    edtRefuelTime: TEdit;
    edtLaunchAlertTime: TEdit;
    grbAirDropLimitation: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    edtMaxDropAltitude: TEdit;
    edtMinDropAltitude: TEdit;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    edtMaxDropSpeed: TEdit;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    grbFlowNoiseFactors: TGroupBox;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    edtHullMounted: TEdit;
    edtTowedArray: TEdit;
    grbSonobuoyCapable: TGroupBox;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    edtMaxNumbToMOnitor: TEdit;
    edtMaxDeployAltitude: TEdit;
    edtMinDeployAltitude: TEdit;
    cbxSonobuoyCapable: TCheckBox;
    Label89: TLabel;
    Label90: TLabel;
    Label93: TLabel;
    edtMaxDeploySpeed: TEdit;
    grbMissile: TGroupBox;
    Label100: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    edtAntiRadiationMissile: TEdit;
    edtInfraredHomingMissile: TEdit;
    edtSemiActiveMissile: TEdit;
    Label108: TLabel;
    Label109: TLabel;
    edtTerminalActiveMissile: TEdit;
    TrackBarAntiRadiationMissile: TTrackBar;
    TrackBarInfraredHomingMissile: TTrackBar;
    TrackBarSemiActiveMissile: TTrackBar;
    TrackBarTerminalActiveMissile: TTrackBar;
    Label110: TLabel;
    Label128: TLabel;
    grbTorpedo: TGroupBox;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    edtActiveAcousticTorpedo: TEdit;
    edtPassiveAcousticTorpedo: TEdit;
    edtActivePassiveAcousticTorpedo: TEdit;
    edtWireGuidedTorpedo: TEdit;
    TrackBarActiveAcousticTorpedo: TTrackBar;
    TrackBarPassiveAcousticTorpedo: TTrackBar;
    TrackBarActivePassiveAcousticTorpedo: TTrackBar;
    TrackBarWireGuidedTorpedo: TTrackBar;
    grbMine: TGroupBox;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    edtAcousticMine: TEdit;
    edtImpactMine: TEdit;
    edtMagneticMine: TEdit;
    edtPressureMine: TEdit;
    TrackBarAcousticMine: TTrackBar;
    TrackBarImpactMine: TTrackBar;
    TrackBarMagneticMine: TTrackBar;
    TrackBarPressureMine: TTrackBar;
    Label132: TLabel;
    Label133: TLabel;
    edtWakeHomingTorpedo: TEdit;
    TrackBarWakeHomingTorpedo: TTrackBar;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    edtFrontSidePhysical: TEdit;
    cbbDomain: TComboBox;
    lbl12: TLabel;
    lbNameId: TListBox;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure trckbDamageChange(Sender: TObject);
    procedure TrackBarAntiRadiationMissileChange(Sender: TObject);
    procedure TrackBarInfraredHomingMissileChange(Sender: TObject);
    procedure TrackBarSemiActiveMissileChange(Sender: TObject);
    procedure TrackBarTerminalActiveMissileChange(Sender: TObject);
    procedure TrackBarActiveAcousticTorpedoChange(Sender: TObject);
    procedure TrackBarPassiveAcousticTorpedoChange(Sender: TObject);
    procedure TrackBarActivePassiveAcousticTorpedoChange(Sender: TObject);
    procedure TrackBarWakeHomingTorpedoChange(Sender: TObject);
    procedure TrackBarWireGuidedTorpedoChange(Sender: TObject);
    procedure TrackBarAcousticMineChange(Sender: TObject);
    procedure TrackBarImpactMineChange(Sender: TObject);
    procedure TrackBarMagneticMineChange(Sender: TObject);
    procedure TrackBarPressureMineChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbDomainChange(Sender: TObject);
    procedure sbSearchMotionClick(Sender: TObject);
    procedure getData;
    procedure btnApplyClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure getRefresh;
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEmbarkedPlatformsClick(Sender: TObject);
    procedure cbxSonobuoyCapableClick(Sender: TObject);
    procedure btnRadarClick(Sender: TObject);
    procedure btnMADClick(Sender: TObject);
    procedure btnESMClick(Sender: TObject);
    procedure btnSonarClick(Sender: TObject);
    procedure btnElectroOpticalDetectorClick(Sender: TObject);
    procedure btnIFFClick(Sender: TObject);
    procedure btnVisualDetectorClick(Sender: TObject);
    procedure btnSonobuoyClick(Sender: TObject);
    procedure btnMissilesClick(Sender: TObject);
    procedure btnTorpedosClick(Sender: TObject);
    procedure btnMinesClick(Sender: TObject);
    procedure btnGunsClick(Sender: TObject);
    procedure btnBomb_DepthChargesClick(Sender: TObject);
    procedure btnRadarJummerClick(Sender: TObject);
    procedure btnAirBubbleClick(Sender: TObject);
    procedure btnAccousticDecoyClick(Sender: TObject);
    procedure btnDefensiveJummerClick(Sender: TObject);
    procedure btnTowedJummer_DecoyClick(Sender: TObject);
    procedure btnFloatingDecoyClick(Sender: TObject);
    procedure btnChaffClick(Sender: TObject);
   

  private
    { Private declarations }
  public
    { Public declarations }
    vehicle : TVehicle_Definition;
    iList : TList;
    isNew,isCopy,fromVehicle   : Boolean;
  end;

var
  fVehicleAttributeWindow: TfVehicleAttributeWindow;
  vList :TList;
  pi_ident :TPlatform_Instance_Identifier;


implementation

{$R *.dfm}
uses uDataModuleTTT,uVehiclePicklistFilter,uMotionDoubleList,
uMotion, uVehicleSelect, UfRadarDoublePickList, uMADDoublePickList,
  uESMDoublePickList, uSonarDoubleList, uEODoublePickList, uIFFDoublePickList,
  uVDDoublePickList, uSonobuoyDoublePickList, uMissileSelect, uTorpedoSelect,
  uMineSelect, uGunSelect, uBombDoublePickList, uRadarJammerSelect,
  uAirBubbleSelect, uAccousticDecoySelect, uDefensiveJammerSelect,
  uTJDecoySelect, uFloatingDecoySelect, uChaffSelect, uSonobuoySinglePickList,
  uSonobuoySelect, uIFFMount, uVisualDetectorMount;

procedure TfVehicleAttributeWindow.btnAccousticDecoyClick(Sender: TObject);
begin
  fAccousticDeploySelect.Show;
end;

procedure TfVehicleAttributeWindow.btnAddClick(Sender: TObject);
begin

  if fVehicleSelect.vehicle_ra then
    pi_ident := fVehicleSelect.platform_identifier
  else if fVehiclePicklistFilter.fromVehicle then
    pi_ident := fVehiclePicklistFilter.pi_identifier;

  with pi_ident.FData do begin
    if fVehicleSelect.vehicle_ra then
      Vehicle_Index := StrToInt(fVehicleSelect.vId)
    else
      Vehicle_Index := StrToInt(fVehiclePicklistFilter.id_vehicle);

    Instance_Identifier := edtName.Text;
  end;

  dmTTT.InsertPlatform_Instance_Identifier(pi_ident);

  if fVehicleSelect.vehicle_ra then
    dmTTT.GetPlatform_Instance_Identifier(StrToInt(fVehicleSelect.vId),'',vList,pi_ident)
  else
    dmTTT.GetPlatform_Instance_Identifier(StrToInt(fVehiclePicklistFilter.id_vehicle),'',vList,pi_ident);

  getRefresh;
end;

procedure TfVehicleAttributeWindow.getRefresh;
var p:integer;
begin
  p := vList.Count-1;

  lstName.Items.Add(TPlatform_Instance_Identifier(vList[p]).FData.Instance_Identifier );

end;

procedure TfVehicleAttributeWindow.btnAirBubbleClick(Sender: TObject);
begin
  fAirBubbleSelect.Show;
end;

procedure TfVehicleAttributeWindow.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    getData;
    dmTTT.insertVehicle_Def(vehicle);
    isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateVehicle_Def(vehicle,IntToStr(vehicle.FData.Vehicle_Index));
  end;
end;


procedure TfVehicleAttributeWindow.btnBomb_DepthChargesClick(
  Sender: TObject);
begin
  fromVehicle := True;
  fBombDoublePickList.Show;
end;

procedure TfVehicleAttributeWindow.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfVehicleAttributeWindow.btnChaffClick(Sender: TObject);
begin
  fChaffSelect.Show;
end;

procedure TfVehicleAttributeWindow.btnDefensiveJummerClick(
  Sender: TObject);
begin
  fDefensiveJammerSelect.Show;
end;

procedure TfVehicleAttributeWindow.btnElectroOpticalDetectorClick(
  Sender: TObject);
begin
  fEODoublePickList.Show;
end;

procedure TfVehicleAttributeWindow.btnEmbarkedPlatformsClick(Sender: TObject);
begin
  fromVehicle := True;
  fVehicleSelect.Show;
end;

procedure TfVehicleAttributeWindow.btnESMClick(Sender: TObject);
begin
  fESMDoublePickList.Show;
end;

procedure TfVehicleAttributeWindow.btnFloatingDecoyClick(Sender: TObject);
begin
  fFloatingDecoySelect.Show;
end;

procedure TfVehicleAttributeWindow.btnGunsClick(Sender: TObject);
begin
  fromVehicle := True;
  fGunSelect.Show;
end;

procedure TfVehicleAttributeWindow.btnIFFClick(Sender: TObject);
begin
  //set nilai iff
  dmTTT.getAllIFF_Sensor_On_Board(vehicle.FData.Vehicle_Index, 0, iList);
  with IFFMountForm do
  begin
    if iList.Count <> 0 then
    begin
      iff := iList[0];

      IFFMountForm.Show;
    end;
  end;
end;

procedure TfVehicleAttributeWindow.btnMADClick(Sender: TObject);
begin
  fMADDoublePickList.Show;
end;

procedure TfVehicleAttributeWindow.btnMinesClick(Sender: TObject);
begin
  fromVehicle := True;
  fMine.Show;
end;

procedure TfVehicleAttributeWindow.btnMissilesClick(Sender: TObject);
begin
  fromVehicle := True;
  fMissileSelect.Show;
end;

procedure TfVehicleAttributeWindow.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  
end;

procedure TfVehicleAttributeWindow.btnRadarClick(Sender: TObject);
begin
  fRadarDoublePickList.Show;
end;

procedure TfVehicleAttributeWindow.btnRadarJummerClick(Sender: TObject);
begin
  fRadarJammerSelect.Show;
end;

procedure TfVehicleAttributeWindow.btnRemoveClick(Sender: TObject);
var i:integer;
begin
  for I := lstName.Count - 1 downto 0 do begin
   if lstName.Selected[I] then
   begin
    dmTTT.DeletePlatform_Instance_Identifier(lbNameId.Items[i]);
    lstName.Items.Delete(I);
   end;
  end;
end;

procedure TfVehicleAttributeWindow.btnSonarClick(Sender: TObject);
begin
   with fSonarDoubleList do
   begin
    fromVehicle := true;
    fromCharacteristic := false;
    fromSonobuoy := false;
   end;

   fSonarDoubleList.Show;
end;

procedure TfVehicleAttributeWindow.btnSonobuoyClick(Sender: TObject);
begin
  fSonobuoyDoublePickList.Show;
end;

procedure TfVehicleAttributeWindow.btnTorpedosClick(Sender: TObject);
begin
  fromVehicle := True;
  fTorpedo.Show;
end;

procedure TfVehicleAttributeWindow.btnTowedJummer_DecoyClick(
  Sender: TObject);
begin
  fTJDecoySelect.Show;
end;

procedure TfVehicleAttributeWindow.btnVisualDetectorClick(Sender: TObject);
begin
  dmTTT.getAllVisual_Sensor_On_Board(vehicle.FData.Vehicle_Index, 0, pList);
  with VisualDetectorMountForm do
  begin
    if pList.Count <> 0 then
    begin
      vd := pList[0]
    end;
    Show;
  end;
end;

procedure TfVehicleAttributeWindow.getData;
var tReady: integer;
begin
  with vehicle.FData do begin
   // Vehicle_Index                       := ;
    Vehicle_Identifier         := edtClass.Text;

    if cbbDomain.Text = 'Air' then
       Platform_Domain := 0
    else if cbbDomain.Text = 'Surface' then
      Platform_Domain := 1
    else if cbbDomain.Text = 'Subsurface' then
      Platform_Domain := 2
    else if cbbDomain.Text = 'Land' then
      Platform_Domain := 3
    else if cbbDomain.Text = 'Amphibious' then
      Platform_Domain := 4
    else if cbbDomain.Text = '' then
      Platform_Domain := Platform_Domain;


    if cbbCategory.Text = 'Other' then
      Platform_Category := 0
    else if cbbCategory.Text = 'Combatant' then
      Platform_Category := 1
    else if cbbCategory.Text = 'Non-Combatant' then
      Platform_Category := 2
    else if cbbCategory.Text = 'Non-Naval' then
      Platform_Category := 3
    else if cbbCategory.Text = 'Submarine' then
      Platform_Category := 4
    else if cbbCategory.Text = 'Weapon' then
      Platform_Category := 5
    else if cbbCategory.Text = 'Non-Submarine' then
      Platform_Category := 6
    else if cbbCategory.Text = 'Military' then
      Platform_Category := 7
    else if cbbCategory.Text = 'Civilian' then
      Platform_Category := 8
    else if cbbCategory.Text = 'Weapon' then
      Platform_Category := 9
    else if cbbCategory.Text = '' then
      Platform_Category := Platform_Category
    else begin
      Platform_Category := 10;
    end;


    if cbbType.Text = 'Fixed Wing,Fighter' then
      Platform_Type := 0
    else if cbbType.Text = 'Fixed Wing,Strike/Bomber' then
      Platform_Type := 1
    else if cbbType.Text = 'Fixed Wing,ASW/MP' then
      Platform_Type := 2
    else if cbbType.Text = 'Fixed Wing,EW' then
      Platform_Type := 3
    else if cbbType.Text = 'Rotary Wing,Attack' then
      Platform_Type := 4
    else if cbbType.Text = 'Rotary Wing,ASW' then
      Platform_Type := 5
    else if cbbType.Text = 'Fixed-Surveillance/AEW' then
      Platform_Type := 6
    else if cbbType.Text = 'Fixed-Reconnaissance' then
      Platform_Type := 7
    else if cbbType.Text = 'Seaplane' then
      Platform_Type := 8
    else if cbbType.Text = 'Missile' then
      Platform_Type := 9
    else if cbbType.Text = 'Aircraft Carrier(CV/CVN)' then
      Platform_Type := 10
    else if cbbType.Text = 'Cruiser,Guided Missile(CG/CGN)' then
      Platform_Type := 11
    else if cbbType.Text = 'Destroyer,Guided Missile(DDG)' then
      Platform_Type := 12
    else if cbbType.Text = 'Frigate,Guided Missile(FFG)' then
      Platform_Type := 13
    else if cbbType.Text = 'Destroyer(DD)' then
      Platform_Type := 14
    else if cbbType.Text = 'Frigate(FF)' then
      Platform_Type := 15
    else if cbbType.Text = 'Mine Warfare' then
      Platform_Type := 16
    else if cbbType.Text = 'Patrol Craft(PT/PTG)' then
      Platform_Type := 17
    else if cbbType.Text = 'Merchant' then
      Platform_Type := 18
    else if cbbType.Text = 'Utility Vessel' then
      Platform_Type := 19
    else if cbbType.Text = 'Other' then
      Platform_Type := 20
    else if cbbType.Text = 'Nuclear,Ballistic Missile(SSBN)' then
      Platform_Type := 21
    else if cbbType.Text = 'Auxiliary' then
      Platform_Type := 22
    else if cbbType.Text = 'Nuclear,Attack(SSN)' then
      Platform_Type := 23
    else if cbbType.Text = 'Nuclear,Guided Missile(SSGN)' then
      Platform_Type := 24
    else if cbbType.Text = 'Diesel,Attack(SSK)' then
      Platform_Type := 25
    else if cbbType.Text = 'Diesel,Guided Missile(SSG)' then
      Platform_Type := 26
    else if cbbType.Text = 'Battery,Surface-to-Air-Missile' then
      Platform_Type := 27
    else if cbbType.Text = 'Battery,Coastal Defence Missile' then
      Platform_Type := 28
    else if cbbType.Text = 'Battery,Coastal Defence Gun' then
      Platform_Type := 29
    else if cbbType.Text = 'Airfield' then
      Platform_Type := 30
    else if cbbType.Text = 'Platoon,Armour' then
      Platform_Type := 31
    else if cbbType.Text = 'Platoon,Infantry' then
      Platform_Type := 32
    else if cbbType.Text = 'Platoon,Artilery' then
      Platform_Type := 33
    else if cbbType.Text = 'Port' then
      Platform_Type := 34
    else if cbbType.Text = 'Special Craft' then
      Platform_Type := 35
    else if cbbType.Text = 'Other' then
      Platform_Type := 40
    else if cbbType.Text = 'Amphibious Warfare' then
      Platform_Type := 41
    else if cbbType.Text = 'Rotary Wing-Surveillance/AEW' then
      Platform_Type := 45
    else if cbbType.Text = '' then
      Platform_Type := Platform_Type
    else begin
      Platform_Type := 46;
    end;

     if cbbDetectabilityType.Text = 'Normal Detection' then
      Detectability_Type := 0
    else if cbbDetectabilityType.Text = 'Undetectable' then
      Detectability_Type := 1
    else if cbbDetectabilityType.Text = 'Passive Detection' then
      Detectability_Type := 1
    else if cbbDetectabilityType.Text = 'Always Visible' then
      Detectability_Type := 1
    else if cbbDetectabilityType.Text = '' then
      Detectability_Type := Detectability_Type;

    if fMotionDouble.mId <> '' then
      Motion_Characteristics              := StrToInt(fMotionDouble.mId)
    else
      Motion_Characteristics  := Motion_Characteristics;
    Length                              := StrToFloat(edtLengthDimension.Text);
    Width                               := StrToFloat(edtWidthDimension.Text);
    Height                              := StrToFloat(edtHeightDimension.Text);
    Draft                               := StrToFloat(edtDraftDimension.Text);
    Front_Radar_Cross                   := StrToFloat(edtFrontRadarPhysical.Text);
    Side_Radar_Cross                    := StrToFloat(edtSideRadarPhysical.Text);
    Front_Acoustic_Cross                := StrToFloat(edtFrontAcousticPhysical.Text);
    Side_Acoustic_Cross                 := StrToFloat(edtFrontSidePhysical.Text);
    Magnetic_Cross                      := StrToFloat(edtMagneticPhysical.Text);
    Front_Visual_EO_Cross               := StrToFloat(edtFrontVisualPhysical.Text);
    Side_Visual_EO_Cross                := StrToFloat(edtSideVisualPhysical.Text);
    Front_Infrared_Cross                := StrToFloat(edtFrontInfraredPhysical.Text);
    Side_Infrared_Cross                 := StrToFloat(edtSideInfraredPhysical.Text);
    LSpeed_Acoustic_Intens              := StrToFloat(edtMinSpeedAcousticPhysical.Text);
    Below_Cav_Acoustic_Intens           := StrToFloat(edtBelowCavitationAcousticPhysical.Text);
    Above_Cav_Acoustic_Intens           := StrToFloat(edtAboveCavitationAcousticPhysical.Text);
    HSpeed_Acoustic_Intens              := StrToFloat(edtMaxSpeedAcousticPhysical.Text);
    Cavitation_Speed_Switch             := StrToFloat(edtCavitationSpeedAcousticPhysical.Text);
    Time_of_Weapon_Impact               := 0;
    Chaff_Seduction_Capable             := False;
    Seduction_Mode_Prob                 := 0;
    Min_Delay_Between_Chaff_Rounds      := 0;
    Max_Chaff_Salvo_Size                := 0;
    SARH_POH_Modifier                   := StrToFloat(edtSemiActiveMissile.Text);
    CG_POH_Modifier                     := 0;
    TARH_POH_Modifier                   := StrToFloat(edtTerminalActiveMissile.Text);
    IR_POH_Modifier                     := StrToFloat(edtInfraredHomingMissile.Text);
    AR_POH_Modifier                     := StrToFloat(edtAntiRadiationMissile.Text);
    Active_Acoustic_Tor_POH_Mod         := StrToFloat(edtActiveAcousticTorpedo.Text);
    Passive_Acoustic_Tor_POH_Mod        := StrToFloat(edtPassiveAcousticTorpedo.Text);
    Active_Passive_Tor_POH_Mod          := StrToFloat(edtActivePassiveAcousticTorpedo.Text);
    Wake_Home_POH_Modifier              := StrToFloat(edtWakeHomingTorpedo.Text);
    Wire_Guide_POH_Modifier             := StrToFloat(edtWireGuidedTorpedo.Text);
    Mag_Mine_POH_Modifier               := StrToFloat(edtMagneticMine.Text);
    Press_Mine_POH_Modifier             := StrToFloat(edtPressureMine.Text);
    Impact_Mine_POH_Modifier            := StrToFloat(edtImpactMine.Text);
    Acoustic_Mine_POH_Modifier          := StrToFloat(edtAcousticMine.Text);
    Sub_Comm_Antenna_Height             := StrToFloat(edtAntennaAboveWater.Text);
    Rel_Comm_Antenna_Height             := StrToFloat(edtAntennaHeight.Text);
    Max_Comm_Operating_Depth            := StrToFloat(edtMaxCom.Text);

    if cbxHFLink.Checked then
      HF_Link_Capable := True
    else
      HF_Link_Capable := False;

    if cbxUHFLink.Checked then
      UHF_Link_Capable := True
    else
      UHF_Link_Capable := False;

    if cbxHFVoice.Checked then
      HF_Voice_Capable  := True
    else
      HF_Voice_Capable := False;

    if cbxUHFVoice.Checked then
      UHF_Voice_Capable := True
    else
      UHF_Voice_Capable := False;

    if cbxSatcom.Checked then
      SATCOM_Voice_Capable := True
    else
      SATCOM_Voice_Capable := False;

    if cbxUnderwater.Checked then
      UWT_Voice_Capable := True
    else
      UWT_Voice_Capable := False;

    if cbxHFMessageHandling.Checked then
      HF_MHS_Capable := True
    else
      HF_MHS_Capable := False;

    if cbxUHFMessageHandling.Checked then
      UHF_MHS_Capable := True
    else
      UHF_MHS_Capable := False;

    if cbxSATCOMMessageHAndling.Checked then
      SATCOM_MHS_Capable := True
    else
      SATCOM_MHS_Capable := False;

    if cbxBarrier.Checked then
      Chaff_Capability := True
    else
      Chaff_Capability := False;

    if cbxSonobuoyCapable.Checked then
    begin
      Sonobuoy_Capable := True;
      Max_Sonobuoys_To_Monitor            := StrToInt(edtMaxNumbToMOnitor.Text);
      Sonobuoy_Deploy_Max_Altitude        := StrToInt(edtMaxDeployAltitude.Text);
      Sonobuoy_Deploy_Min_Altitude        := StrToInt(edtMinDeployAltitude.Text);
      Sonobuoy_Deploy_Max_Speed           := StrToInt(edtMaxDeploySpeed.Text);
    end
    else
    begin
      Sonobuoy_Capable := False;
      Max_Sonobuoys_To_Monitor     := 0;
      Sonobuoy_Deploy_Max_Altitude := 0;
      Sonobuoy_Deploy_Min_Altitude := 0;
      Sonobuoy_Deploy_Max_Speed    := 0;
    end;

    if cbxNavigation.Checked then
      Nav_Light_Capable := True
    else
      Nav_Light_Capable := False;

    VHF_Voice_Capable                   := False;
    Damage_Capacity                     := StrToInt(edtDamage.Text);
    tReady := DateTimeToInt(StrToDateTime(edtRefuelTime.Text));
    if tReady > 32767 then
      tReady := 32767;
    Readying_Time                       := tReady;
    Periscope_Depth                     := StrToFloat(edtMaxOperatPeriscope.Text);
    Periscope_Height_Above_Water        := StrToFloat(edtHighAbovePeriscope.Text);
    Periscope_Front_Radar_Xsection      := StrToFloat(edtFontRadar.Text);
    Periscope_Side_Radar_Xsection       := StrToFloat(edtSideRadar.Text);
    Periscope_Front_Vis_Xsection        := StrToFloat(edtFontVisual.Text);
    Periscope_Side_Vis_Xsection         := StrToFloat(edtSideVisual.Text);
    Periscope_Front_IR_Xsection         := StrToFloat(edtFontInfrared.Text);
    Periscope_Side_IR_Xsection          := StrToFloat(edtSideInfrared.Text);
    Engagement_Range                    := StrToFloat(edtEngagementRangeDimension.Text);
    Auto_Air_Defense_Capable            := False;
    Alert_State_Time                    := StrToDateTime(edtLaunchAlertTime.Text);

    if cbbDetectabilityType.Text = 'Normal Detection' then
      Detectability_Type := 0
    else if cbbDetectabilityType.Text = 'Undetectable' then
      Detectability_Type := 1
    else if cbbDetectabilityType.Text = 'Passive Detection' then
      Detectability_Type := 2
    else begin
      Detectability_Type := 3;
    end;


    Air_Drop_Torpedo_Max_Altitude       := StrToInt(edtMaxDropAltitude.Text);
    Air_Drop_Torpedo_Min_Altitude       := StrToInt(edtMinDropAltitude.Text);
    Air_Drop_Torpedo_Max_Speed          := StrToInt(edtMaxDropSpeed.Text);
    TMA_Rate_Factor                     := 0;
    HMS_Noise_Reduction_Factor          := StrToFloat(edtHullMounted.Text);
    TAS_Noise_Reduction_Factor          := StrToFloat(edtTowedArray.Text);
    Infrared_Decoy_Capable              := False;
    HF_Mid_Course_Update_Capable        := False;
    UHF_Mid_Course_Update_Capable       := False;

  end;
end;


procedure TfVehicleAttributeWindow.cbbDomainChange(Sender: TObject);
begin
  if cbbDomain.ItemIndex = 0 then
    begin
      cbbCategory.Items.Clear;
      cbbCategory.Items.Add('Combatant');
      cbbCategory.Items.Add('Non-Combatant');
      cbbCategory.Items.Add('Non-Naval');
      cbbCategory.Items.Add('Other');
      cbbType.Items.Clear;
      cbbType.Items.Add('Frigate,Guided Missile(FFG)');
      cbbType.Items.Add('Destroyer,Guided Missile(DDG)');
      cbbType.Items.Add('Cruiser,Guided Missile(CG/CGN)');
      cbbType.Items.Add('Aircraft Carrier(CV/CVN)');
      cbbType.Items.Add('Patrol Craft(PT/PTG)');
      cbbType.Items.Add('Mine Warfare');
      cbbType.Items.Add('Auxiliary');
      cbbType.Items.Add('Merchant');
      cbbType.Items.Add('Utility Vessel');
      cbbType.Items.Add('Destroyer(DD)');
      cbbType.Items.Add('Frigate(FF)');
      cbbType.Items.Add('Amphibious Warfare');
      cbbType.Items.Add('Other');
    end
  else if cbbDomain.ItemIndex = 1 then
    begin
      cbbCategory.Items.Clear;
      cbbCategory.Items.Add('Submarine');
      cbbCategory.Items.Add('Weapon');
      cbbCategory.Items.Add('Non-Submarine');
      cbbCategory.Items.Add('Other');
      cbbType.Items.Clear;
      cbbType.Items.Add('Diesel,Attack(SSK)');
      cbbType.Items.Add('Nuclear,Attack(SSN)');
      cbbType.Items.Add('Nuclear,Guided Missile(SSGN)');
      cbbType.Items.Add('Diesel,Guided Missile(SSG)');
      cbbType.Items.Add('Nuclear,Ballistic Missile(SSBN)');
      cbbType.Items.Add('Other');
    end
  else if cbbDomain.ItemIndex = 2 then
    begin
      cbbCategory.Items.Clear;
      cbbCategory.Items.Add('Military');
      cbbCategory.Items.Add('Weapon');
      cbbCategory.Items.Add('Civilian');
      cbbCategory.Items.Add('Other');
      cbbType.Items.Clear;
      cbbType.Items.Add('Fixed Wing,Fighter');
      cbbType.Items.Add('Fixed Wing,Strike/Bomber');
      cbbType.Items.Add('Fixed Wing,ASW/MP');
      cbbType.Items.Add('Rotary Wing,ASW');
      cbbType.Items.Add('Rotary Wing,Attack');
      cbbType.Items.Add('Fixed Wing,EW');
      cbbType.Items.Add('Fixed-Surveillance/AEW');
      cbbType.Items.Add('Fixed-Reconnaissance');
      cbbType.Items.Add('Rotary Wing-Surveillance/AEW');
      cbbType.Items.Add('Rotary Wing-Reconnaissance');
      cbbType.Items.Add('Seaplane');
      cbbType.Items.Add('Missile');
      cbbType.Items.Add('Other');
    end
  else begin
      cbbCategory.Items.Clear;
      cbbCategory.Items.Add('Amphibious');
      cbbType.Items.Clear;
      cbbType.Items.Add('Platoon,Armour');
      cbbType.Items.Add('Platoon,Infantry');
      cbbType.Items.Add('Battery,Anti-aircraft Artillery');
      cbbType.Items.Add('Battery,Surface-to-Air Missile');
      cbbType.Items.Add('Battery,Coastal Defence Missile');
      cbbType.Items.Add('Battery,Coastal Defence Gun');
      cbbType.Items.Add('Airfield');
      cbbType.Items.Add('Port');
      cbbType.Items.Add('Other');
    end;
end;

procedure TfVehicleAttributeWindow.cbxSonobuoyCapableClick(Sender: TObject);
begin
  if cbxSonobuoyCapable.Checked then
  begin
    edtMaxNumbToMOnitor.Enabled  := True;
    edtMaxDeployAltitude.Enabled := True;
    edtMinDeployAltitude.Enabled := True;
    edtMaxDeploySpeed.Enabled    := True;
  end
  else
  begin
    edtMaxNumbToMOnitor.Enabled  := False;
    edtMaxDeployAltitude.Enabled := False;
    edtMinDeployAltitude.Enabled := False;
    edtMaxDeploySpeed.Enabled    := False;
  end;
end;

procedure TfVehicleAttributeWindow.FormCreate(Sender: TObject);
begin
   vehicle := TVehicle_Definition.Create;
   pi_ident := TPlatform_Instance_Identifier.Create;
   iList := TList.Create;
end;

procedure TfVehicleAttributeWindow.FormShow(Sender: TObject);
begin
  trckbDamage.Min   := 0;
  trckbDamage.Max   := 100000;
  TrackBarAntiRadiationMissile.Min  := 0;
  TrackBarAntiRadiationMissile.Max  := 100;
  TrackBarInfraredHomingMissile.Min := 0;
  TrackBarInfraredHomingMissile.Max := 100;
  TrackBarSemiActiveMissile.Min     := 0;
  TrackBarSemiActiveMissile.Max     := 100;
  TrackBarTerminalActiveMissile.Min := 0;
  TrackBarTerminalActiveMissile.Max := 100;
  TrackBarActiveAcousticTorpedo.Min := 0;
  TrackBarActiveAcousticTorpedo.Max := 100;
  TrackBarPassiveAcousticTorpedo.Min:= 0;
  TrackBarPassiveAcousticTorpedo.Max:=100;
  TrackBarActivePassiveAcousticTorpedo.Min  := 0;
  TrackBarActivePassiveAcousticTorpedo.Max  := 100;
  TrackBarWireGuidedTorpedo.Min     := 0;
  TrackBarWireGuidedTorpedo.Max     := 100;
  TrackBarAcousticMine.Min          := 0;
  TrackBarAcousticMine.Max          := 100;
  TrackBarImpactMine.Min            := 0;
  TrackBarImpactMine.Max            := 100;
  TrackBarMagneticMine.Min          := 0;
  TrackBarMagneticMine.Max          := 100;
  TrackBarPressureMine.Min          := 0;
  TrackBarPressureMine.Max          := 100;
  TrackBarWakeHomingTorpedo.Min     := 0;
  TrackBarWakeHomingTorpedo.Max     := 100;


end;

procedure TfVehicleAttributeWindow.sbSearchMotionClick(Sender: TObject);
begin
  fromVehicle := True;
  fMotionDouble.Show;
end;

procedure TfVehicleAttributeWindow.TrackBarAcousticMineChange(Sender: TObject);
begin
  edtAcousticMine.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarActiveAcousticTorpedoChange(
  Sender: TObject);
begin
  edtActiveAcousticTorpedo.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarActivePassiveAcousticTorpedoChange(
  Sender: TObject);
begin
  edtActivePassiveAcousticTorpedo.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarAntiRadiationMissileChange(
  Sender: TObject);
begin
  edtAntiRadiationMissile.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarImpactMineChange(Sender: TObject);
begin
  edtImpactMine.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarInfraredHomingMissileChange(
  Sender: TObject);
begin
  edtInfraredHomingMissile.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarMagneticMineChange(Sender: TObject);
begin
  edtMagneticMine.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarPassiveAcousticTorpedoChange(
  Sender: TObject);
begin
  edtPassiveAcousticTorpedo.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarPressureMineChange(Sender: TObject);
begin
  edtPressureMine.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarSemiActiveMissileChange(
  Sender: TObject);
begin
  edtSemiActiveMissile.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarTerminalActiveMissileChange(
  Sender: TObject);
begin
  edtTerminalActiveMissile.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarWakeHomingTorpedoChange(
  Sender: TObject);
begin
  edtWakeHomingTorpedo.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.TrackBarWireGuidedTorpedoChange(
  Sender: TObject);
begin
  edtWireGuidedTorpedo.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfVehicleAttributeWindow.trckbDamageChange(Sender: TObject);
begin
  edtDamage.Text := IntToStr((sender as TTrackBar).Position);
end;

end.
