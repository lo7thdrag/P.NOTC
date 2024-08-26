unit uVehiclePicklistFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_Vehicle, uDBAssetObject;

type
  TfVehiclePicklistFilter = class(TForm)
    pnl1: TPanel;
    lbTempId: TListBox;
    btnNew: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnRemove: TButton;
    btnUsage: TButton;
    btnClose: TButton;
    grpFilter: TGroupBox;
    chkDomain: TCheckBox;
    cbbFilterDomain: TComboBox;
    chkType: TCheckBox;
    chkSensor: TCheckBox;
    chkWeapon: TCheckBox;
    chkEmbarked: TCheckBox;
    cbbFilterType: TComboBox;
    cbbFilterSensorType: TComboBox;
    lbl1: TLabel;
    edtFiltersensorOnBoard: TEdit;
    lbl2: TLabel;
    btn1: TButton;
    cbbFilterWeaponType: TComboBox;
    lbl3: TLabel;
    lbl4: TLabel;
    edtFilterWeaponOnBoar: TEdit;
    btn2: TButton;
    edtFilterEmbarkedPlatform: TEdit;
    btn3: TButton;
    lbTempIdAll: TListBox;
    lbAllVehicle: TListBox;
    btnFilter: TButton;
    procedure getVehicle;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure Vehicle_Def;
    procedure FormCreate(Sender: TObject);
    procedure Filter;
    procedure refresh;
    procedure getSensor;
    procedure getWeapon;
    procedure getEmbarked;
    procedure cbbFilterDomainChange(Sender: TObject);
    procedure cbbFilterTypeChange(Sender: TObject);
    procedure cbbFilterSensorTypeChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure cbbFilterWeaponTypeChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure chkDomainClick(Sender: TObject);
    procedure chkTypeClick(Sender: TObject);
    procedure chkSensorClick(Sender: TObject);
    procedure chkWeaponClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure getNew;
    procedure chkEmbarkedClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);

  private
    { Private declarations }
    vehicle : TVehicle_Definition;
    procedure getDataVehicle;
  public
    { Public declarations }
    id_vehicle  : string;
    sList,wList  : TList;
    isNew,isCopy,fromVehicle,forEmbarked : Boolean;
    pi_identifier : TPlatform_Instance_Identifier;

  end;

var
  fVehiclePicklistFilter: TfVehiclePicklistFilter;
  vList,nList : TList;


implementation

{$R *.dfm}
uses uSimDBEditor, uResurceAllocationSelect,uVehicleAttributeWindow,
  uDataModuleTTT,uMotion,uSensorDoublelist,uWeaponDoubleList,uDBAsset_Sensor,
  uDBAsset_Radar, uDBAsset_Sonar, uDBAsset_Sonobuoy ,uDBAsset_Weapon,
  uVehicleSelect;

procedure TfVehiclePicklistFilter.btn1Click(Sender: TObject);
begin
  fSensor.Show;
end;

procedure TfVehiclePicklistFilter.btn2Click(Sender: TObject);
begin
  fWeaponDoubleList.Show;
end;

procedure TfVehiclePicklistFilter.btn3Click(Sender: TObject);
begin
  forEmbarked := True;
  fVehicleSelect.Show;
end;

procedure TfVehiclePicklistFilter.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfVehiclePicklistFilter.btnCopyClick(Sender: TObject);
begin
  fVehicleAttributeWindow.isCopy := True;
  getDataVehicle;
end;

procedure TfVehiclePicklistFilter.btnEditClick(Sender: TObject);
begin
  fVehicleAttributeWindow.isCopy := False;
  fVehicleAttributeWindow.isNew := False;
  fromVehicle := True;
  getDataVehicle;
  fVehicleAttributeWindow.vehicle := TVehicle_Definition(vList[0]);
end;

procedure TfVehiclePicklistFilter.getDataVehicle;
begin
  id_vehicle  := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
  with fVehicleAttributeWindow do begin
    if isCopy then
    begin
      edtClass.Text := 'Copy of '+ lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
      isNew := True;
    end
    else
      edtClass.Text := lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
  end;
  Vehicle_Def;
  fVehicleAttributeWindow.Show;
end;


procedure TfVehiclePicklistFilter.Vehicle_Def;
var I,p: Integer;
begin

  if fVehicleSelect.vehicle_ra then
    uSimDBEditor.getAllVehicles(vList,StrToInt(fVehicleSelect.vId),vehicle)
  else
    uSimDBEditor.getAllVehicles(vList,StrToInt(id_vehicle),vehicle);

  with fVehicleAttributeWindow do begin
    for i := 0 to vList.Count-1 do begin

      if fVehicleSelect.vehicle_ra then
        dmTTT.GetPlatform_Instance_Identifier(StrToInt(fVehicleSelect.vId),'',nList,pi_identifier)
      else
        dmTTT.GetPlatform_Instance_Identifier(StrToInt(id_vehicle),'',nList,pi_identifier);

      edtName.Clear;
      lstName.Items.Clear;
      lbNameId.Items.Clear;

      for p := 0 to nList.Count - 1 do
      begin
        lstName.Items.Add(TPlatform_Instance_Identifier(nList[p]).FData.Instance_Identifier );
        lbNameId.Items.Add(IntToStr(TPlatform_Instance_Identifier(nList[p]).FData.Instance_Ident_Index));
      end;

      if (TVehicle_Definition(vList[i]).FData.Platform_Domain)= 0 then
        cbbDomain.Text := 'Air'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Domain)= 1 then
        cbbDomain.Text := 'Surface'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Domain)= 2 then
        cbbDomain.Text := 'Subsurface'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Domain)= 2 then
        cbbDomain.Text := 'Land'
      else begin
        cbbDomain.Text := 'Amphibious';
      end;

      if (TVehicle_Definition(vList[i]).FData.Platform_Category)= 0 then
        cbbCategory.Text := 'Other'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Category) = 1 then
        cbbCategory.Text := 'Combatant'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Category) = 2 then
        cbbCategory.Text := 'Non-Combatant'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Category) = 3 then
        cbbCategory.Text := 'Non-Naval'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Category) = 4 then
        cbbCategory.Text := 'Submarine'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Category) = 5 then
        cbbCategory.Text := 'Weapon'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Category) = 6 then
        cbbCategory.Text := 'Non-Submarine'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Category) = 7 then
        cbbCategory.Text := 'Military'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Category) = 8 then
        cbbCategory.Text := 'Civilian'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Category) = 9 then
        cbbCategory.Text := 'Weapon'
      else begin
        cbbCategory.Text := 'Amphibious';
      end;
    
      if (TVehicle_Definition(vList[i]).FData.Platform_Type)= 0 then
        cbbType.Text := 'Fixed Wing,Fighter'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 1 then
        cbbType.Text := 'Fixed Wing,Strike/Bomber'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 2 then
        cbbType.Text := 'Fixed Wing,ASW/MP'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 3 then
        cbbType.Text := 'Fixed Wing,EW'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 4 then
        cbbType.Text := 'Rotary Wing,Attack'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 5 then
        cbbType.Text := 'Rotary Wing,ASW'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 6 then
        cbbType.Text := 'Fixed-Surveillance/AEW'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 7 then
        cbbType.Text := 'Fixed-Reconnaissance'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 8 then
        cbbType.Text := 'Seaplane'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 9 then
        cbbType.Text := 'Missile'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 10 then
        cbbType.Text := 'Aircraft Carrier(CV/CVN)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 11 then
        cbbType.Text := 'Cruiser,Guided Missile(CG/CGN)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 12 then
        cbbType.Text := 'Destroyer,Guided Missile(DDG)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 13 then
        cbbType.Text := 'Frigate,Guided Missile(FFG)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 14 then
        cbbType.Text := 'Destroyer(DD)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 15 then
        cbbType.Text := 'Frigate(FF)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 16 then
        cbbType.Text := 'Mine Warfare'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 17 then
        cbbType.Text := 'Patrol Craft(PT/PTG)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 18 then
        cbbType.Text := 'Merchant'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 19 then
        cbbType.Text := 'Utility Vessel'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 20 then
        cbbType.Text := 'Other'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 21 then
        cbbType.Text := 'Nuclear,Ballistic Missile(SSBN)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 22 then
        cbbType.Text := 'Auxiliary'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 23 then
        cbbType.Text := 'Nuclear,Attack(SSN)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 24 then
        cbbType.Text := 'Nuclear,Guided Missile(SSGN)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 25 then
        cbbType.Text := 'Diesel,Attack(SSK)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 26 then
        cbbType.Text := 'Diesel,Guided Missile(SSG)'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 27 then
        cbbType.Text := 'Battery,Surface-to-Air-Missile'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 28 then
        cbbType.Text := 'Battery,Coastal Defence Missile'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 29 then
        cbbType.Text := 'Battery,Coastal Defence Gun'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 30 then
        cbbType.Text := 'Airfield'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 31 then
        cbbType.Text := 'Platoon,Armour'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 32 then
        cbbType.Text := 'Platoon,Infantry'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 33 then
        fVehicleAttributeWindow.cbbType.Text := 'Platoon,Artilery'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 34 then
        cbbType.Text := 'Port'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 35 then
        cbbType.Text := 'Special Craft'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 40 then
        cbbType.Text := 'Other'
        else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 41 then
        cbbType.Text := 'Amphibious Warfare'
      else if (TVehicle_Definition(vList[i]).FData.Platform_Type) = 45 then
        cbbType.Text := 'Rotary Wing-Surveillance/AEW'
      else begin
        cbbType.Text := 'Rotary Wing-Reconnaissance';
      end;

      if (TVehicle_Definition(vList[i]).FData.Detectability_Type) = 0 then
        cbbDetectabilityType.Text := 'Normal Detection'
      else if (TVehicle_Definition(vList[i]).FData.Detectability_Type) = 1 then
        cbbDetectabilityType.Text := 'Undetectable'
      else if (TVehicle_Definition(vList[i]).FData.Detectability_Type) = 2 then
        cbbDetectabilityType.Text := 'Passive Detection'
      else begin
        cbbDetectabilityType.Text := 'Always Visible';
      end;

      if TVehicle_Definition(vList[i]).FData.Chaff_Capability then
        cbxBarrier.Checked := True
      else begin
        cbxBarrier.Checked := False;
      end;

      if TVehicle_Definition(vList[i]).FData.Nav_Light_Capable then
        cbxNavigation.Checked := True
      else begin
        cbxNavigation.Checked := False;
      end;

      if TVehicle_Definition(vList[i]).FData.HF_Link_Capable then
        cbxHFLink.Checked := True
      else begin
        cbxHFLink.Checked := False;
      end;

      if TVehicle_Definition(vList[i]).FData.UHF_Link_Capable then
        cbxUHFLink.Checked := True
      else begin
        cbxUHFLink.Checked:= False;
      end;

      if TVehicle_Definition(vList[i]).FData.HF_Voice_Capable then
        cbxHFVoice.Checked := True
      else begin
        cbxHFVoice.Checked:= False;
      end;

      if TVehicle_Definition(vList[i]).FData.UHF_Voice_Capable then
        cbxUHFVoice.Checked := True
      else begin
        cbxUHFVoice.Checked:= False;
      end;

      if TVehicle_Definition(vList[i]).FData.SATCOM_Voice_Capable then
        cbxSatcom.Checked := True
      else begin
        cbxSatcom.Checked:= False;
      end;

      if TVehicle_Definition(vList[i]).FData.UWT_Voice_Capable then
        cbxUnderwater.Checked := True
      else begin
        cbxUnderwater.Checked:= False;
      end;

      if TVehicle_Definition(vList[i]).FData.HF_MHS_Capable then
        cbxHFMessageHandling.Checked := True
      else begin
        cbxHFMessageHandling.Checked:= False;
      end;

      if TVehicle_Definition(vList[i]).FData.UHF_MHS_Capable then
        cbxUHFMessageHandling.Checked := True
      else begin
        cbxUHFMessageHandling.Checked:= False;
      end;

      if TVehicle_Definition(vList[i]).FData.SATCOM_MHS_Capable then
        cbxSATCOMMessageHAndling.Checked := True
      else begin
        cbxSATCOMMessageHAndling.Checked:= False;
      end;

      if TVehicle_Definition(vList[i]).FData.Sonobuoy_Capable then
        cbxSonobuoyCapable.Checked := True
      else begin
        cbxSonobuoyCapable.Checked:= False;
      end;

      if TVehicle_Definition(vList[i]).FData.Plat_Basing_Capability then
        cmbBasingType.Items.Text := 'None'
      else
        cmbBasingType.Items.Text := 'Rotary' ;{
      else if TVehicle_Definition(vList[i]).FData.Plat_Basing_Capability = 2 then
        cmbBasingType.Items.Text := 'Rotary and Fixed'
      else if TVehicle_Definition(vList[i]).FData.Plat_Basing_Capability = 3 then
        cmbBasingType.Items.Text := 'Surface and Subsurface'
      else if TVehicle_Definition(vList[i]).FData.Plat_Basing_Capability = 4 then
        cmbBasingType.Items.Text := 'Surface, Subsurface, and Rotary'
      else if TVehicle_Definition(vList[i]).FData.Plat_Basing_Capability = 5 then
        cmbBasingType.Items.Text := 'All';  }


      edtAntennaHeight.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Rel_Comm_Antenna_Height);
      edtAntennaAboveWater.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Sub_Comm_Antenna_Height);
      edtMaxCom.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Max_Comm_Operating_Depth);
      edtDamage.Text := IntToStr(TVehicle_Definition(vList[i]).FData.Damage_Capacity);
      trckbDamage.Position  := Round(TVehicle_Definition(vList[i]).FData.Damage_Capacity);
      edtLengthDimension.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Length);
      edtWidthDimension.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Width);
      edtHeightDimension.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Height);
      edtEngagementRangeDimension.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Engagement_Range);
      edtDraftDimension.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Draft);

      dmTTT.GetMotion_Characteristics(TVehicle_Definition(vList[i]).FData.Motion_Characteristics,MotionHorizontalForm.motionCharacteristic);
      edtMotionCharacterictic.Text := MotionHorizontalForm.motionCharacteristic.FData.Motion_Identifier;

      edtFrontRadarPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Front_Radar_Cross);
      edtSideRadarPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Side_Radar_Cross);
      edtFrontAcousticPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Front_Acoustic_Cross);
      edtFrontSidePhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Side_Acoustic_Cross);
      edtFrontVisualPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Front_Visual_EO_Cross);
      edtSideVisualPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Side_Visual_EO_Cross);
      edtFrontInfraredPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Front_Infrared_Cross);
      edtSideInfraredPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Side_Infrared_Cross);
      edtMagneticPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Magnetic_Cross);
      edtMinSpeedAcousticPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.LSpeed_Acoustic_Intens);
      edtBelowCavitationAcousticPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Below_Cav_Acoustic_Intens);
      edtAboveCavitationAcousticPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Above_Cav_Acoustic_Intens);
      edtMaxSpeedAcousticPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.HSpeed_Acoustic_Intens);
      edtCavitationSpeedAcousticPhysical.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Cavitation_Speed_Switch);
      edtMaxDropAltitude.Text := IntToStr(TVehicle_Definition(vList[i]).FData.Air_Drop_Torpedo_Max_Altitude);
      edtMinDropAltitude.Text := IntToStr(TVehicle_Definition(vList[i]).FData.Air_Drop_Torpedo_Min_Altitude);
      edtMaxDropSpeed.Text := IntToStr(TVehicle_Definition(vList[i]).FData.Air_Drop_Torpedo_Max_Speed);
      edtHullMounted.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.HMS_Noise_Reduction_Factor);
      edtTowedArray.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.TAS_Noise_Reduction_Factor);
      edtMaxNumbToMonitor.Text := IntToStr(TVehicle_Definition(vList[i]).FData.Max_Sonobuoys_To_Monitor);
      edtMaxDeployAltitude.Text := IntToStr(TVehicle_Definition(vList[i]).FData.Sonobuoy_Deploy_Max_Altitude);
      edtMinDeployAltitude.Text := IntToStr(TVehicle_Definition(vList[i]).FData.Sonobuoy_Deploy_Min_Altitude);
      edtMaxDeploySpeed.Text := IntToStr(TVehicle_Definition(vList[i]).FData.Sonobuoy_Deploy_Max_Speed);

      edtAntiRadiationMissile.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.AR_POH_Modifier);
      TrackBarAntiRadiationMissile.Position := Round(TVehicle_Definition(vList[i]).FData.AR_POH_Modifier);

      edtInfraredHomingMissile.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.IR_POH_Modifier);
      TrackBarInfraredHomingMissile.Position := Round(TVehicle_Definition(vList[i]).FData.IR_POH_Modifier);

      edtSemiActiveMissile.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.SARH_POH_Modifier);
      TrackBarSemiActiveMissile.Position := Round(TVehicle_Definition(vList[i]).FData.SARH_POH_Modifier);

      edtTerminalActiveMissile.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.TARH_POH_Modifier);
      TrackBarTerminalActiveMissile.Position := Round(TVehicle_Definition(vList[i]).FData.TARH_POH_Modifier);

      edtActiveAcousticTorpedo.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Active_Acoustic_Tor_POH_Mod);
      TrackBarActiveAcousticTorpedo.Position := Round(TVehicle_Definition(vList[i]).FData.Active_Acoustic_Tor_POH_Mod);

      edtPassiveAcousticTorpedo.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Passive_Acoustic_Tor_POH_Mod);
      TrackBarPassiveAcousticTorpedo.Position := Round(TVehicle_Definition(vList[i]).FData.Passive_Acoustic_Tor_POH_Mod);

      edtActivePassiveAcousticTorpedo.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Active_Passive_Tor_POH_Mod);
      TrackBarActivePassiveAcousticTorpedo.Position := Round(TVehicle_Definition(vList[i]).FData.Active_Passive_Tor_POH_Mod);

      edtWakeHomingTorpedo.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Wake_Home_POH_Modifier);
      TrackBarWakeHomingTorpedo.Position := Round(TVehicle_Definition(vList[i]).FData.Wake_Home_POH_Modifier);

      edtWireGuidedTorpedo.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Wire_Guide_POH_Modifier);
      TrackBarWireGuidedTorpedo.Position := Round(TVehicle_Definition(vList[i]).FData.Wire_Guide_POH_Modifier);

      edtAcousticMine.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Acoustic_Mine_POH_Modifier);
      TrackBarAcousticMine.Position := Round(TVehicle_Definition(vList[i]).FData.Acoustic_Mine_POH_Modifier);
      edtImpactMine.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Impact_Mine_POH_Modifier);
      TrackBarImpactMine.Position := Round(TVehicle_Definition(vList[i]).FData.Impact_Mine_POH_Modifier);
      edtMagneticMine.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Mag_Mine_POH_Modifier);
      TrackBarMagneticMine.Position := Round(TVehicle_Definition(vList[i]).FData.Mag_Mine_POH_Modifier);
      edtPressureMine.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Press_Mine_POH_Modifier);
      TrackBarPressureMine.Position := Round(TVehicle_Definition(vList[i]).FData.Press_Mine_POH_Modifier);

      edtRefuelTime.Text := FormatDateTime('hh:nn:ss',IntToDateTime(TVehicle_Definition(vList[i]).FData.Readying_Time));
      edtLaunchAlertTime.Text := TimeToStr(TVehicle_Definition(vList[i]).FData.Alert_State_Time);

      edtMaxOperatPeriscope.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Periscope_Depth);
      edtHighAbovePeriscope.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Periscope_Height_Above_Water);
      edtFontRadar.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Periscope_Front_Radar_Xsection);
      edtSideRadar.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Periscope_Side_Radar_Xsection);
      edtFontInfrared.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Periscope_Front_IR_Xsection);
      edtSideInfrared.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Periscope_Side_IR_Xsection);
      edtFontVisual.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Periscope_Front_Vis_Xsection);
      edtSideVisual.Text := FloatToStr(TVehicle_Definition(vList[i]).FData.Periscope_Side_Vis_Xsection);
    end;
  end;
end;

procedure TfVehiclePicklistFilter.getNew;
begin

  with fVehicleAttributeWindow do begin
    edtClass.Text := '';
    edtName.Text  := '';
    edtAntennaHeight.Text := '';
    edtAntennaAboveWater.Text := '';
    edtMaxCom.Text := '';
    edtDamage.Text := '';
    edtLengthDimension.Text := '';
    edtWidthDimension.Text := '';
    edtHeightDimension.Text := '';
    edtEngagementRangeDimension.Text := '';
    edtDraftDimension.Text := '';
    edtMotionCharacterictic.Text := '';
    edtFrontRadarPhysical.Text := '';
    edtSideRadarPhysical.Text := '';
    edtFrontAcousticPhysical.Text := '';
    edtFrontSidePhysical.Text := '';
    edtFrontVisualPhysical.Text := '';
    edtSideVisualPhysical.Text := '';
    edtFrontInfraredPhysical.Text := '';
    edtSideInfraredPhysical.Text := '';
    edtMagneticPhysical.Text := '';
    edtMinSpeedAcousticPhysical.Text := '';
    edtBelowCavitationAcousticPhysical.Text := '';
    edtAboveCavitationAcousticPhysical.Text := '';
    edtMaxSpeedAcousticPhysical.Text := '';
    edtCavitationSpeedAcousticPhysical.Text := '';
    edtMaxDropAltitude.Text := '';
    edtMinDropAltitude.Text := '';
    edtMaxDropSpeed.Text := '';
    edtHullMounted.Text := '';
    edtTowedArray.Text := '';
    edtMaxNumbToMonitor.Text := '';
    edtMaxDeployAltitude.Text := '';
    edtMinDeployAltitude.Text := '';
    edtMaxDeploySpeed.Text := '';
    edtAntiRadiationMissile.Text := '';
    edtInfraredHomingMissile.Text := '';
    edtSemiActiveMissile.Text := '';
    edtTerminalActiveMissile.Text := '';
    edtActiveAcousticTorpedo.Text := '';
    edtPassiveAcousticTorpedo.Text := '';
    edtActivePassiveAcousticTorpedo.Text := '';
    edtWakeHomingTorpedo.Text := '';
    edtWireGuidedTorpedo.Text := '';
    edtAcousticMine.Text := '';
    edtImpactMine.Text := '';
    edtMagneticMine.Text := '';
    edtPressureMine.Text := '';
    edtRefuelTime.Text := '';
    edtLaunchAlertTime.Text := '';
    edtMaxOperatPeriscope.Text := '';
    edtHighAbovePeriscope.Text := '';
    edtFontRadar.Text := '';
    edtSideRadar.Text := '';
    edtFontInfrared.Text := '';
    edtSideInfrared.Text := '';
    edtFontVisual.Text := '';
    edtSideVisual.Text := '';

    cbbCategory.Items.Clear;
    cbbType.Items.Clear;
    cbxFontRadar.Items.Clear;
    cbxSideRadar.Items.Clear;

    cbxNavigation.Checked := False;
    cbxBarrier.Checked := False;
    cbxHFLink.Checked := False;
    cbxUHFLink.Checked := False;
    cbxHFVoice.Checked := False;
    cbxUHFVoice.Checked := False;
    cbxSatcom.Checked := False;
    cbxUnderwater.Checked := False;
    cbxHFMessageHandling.Checked := False;
    cbxUHFMessageHandling.Checked := False;
    cbxSATCOMMessageHAndling.Checked := False;
    cbxSonobuoyCapable.Checked  := False;
    lstName.Items.Clear;
    lbNameId.Items.Clear;

    redtNotes.Clear;

    Show;


  end;
end;


procedure TfVehiclePicklistFilter.btnFilterClick(Sender: TObject);
begin
  if btnFilter.Caption = '>> Filter' then
   begin
    btnFilter.Caption := '<< Filter';
    fVehiclePicklistFilter.Height := 645;
   end
  else if btnFilter.Caption = '<< Filter' then
  begin
   btnFilter.Caption := '>> Filter';
   fVehiclePicklistFilter.Height := 390;
  end;
end;

procedure TfVehiclePicklistFilter.btnNewClick(Sender: TObject);
var p:integer;
begin
  fVehicleAttributeWindow.isCopy := False;
  fVehicleAttributeWindow.isNew := True;
  getNew;
end;

procedure TfVehiclePicklistFilter.btnRemoveClick(Sender: TObject);
begin
  dmTTT.deleteVehicle(StrToInt(lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex]));
  getVehicle;
end;

procedure TfVehiclePicklistFilter.cbbFilterDomainChange(Sender: TObject);
begin
  Filter;
end;

procedure TfVehiclePicklistFilter.cbbFilterSensorTypeChange(Sender: TObject);
begin
  Filter;
end;

procedure TfVehiclePicklistFilter.cbbFilterTypeChange(Sender: TObject);
begin
  Filter;
end;

procedure TfVehiclePicklistFilter.cbbFilterWeaponTypeChange(Sender: TObject);
begin
  Filter;
end;

procedure TfVehiclePicklistFilter.chkDomainClick(Sender: TObject);
begin
  if chkDomain.Checked = False then
    getVehicle;
end;

procedure TfVehiclePicklistFilter.chkEmbarkedClick(Sender: TObject);
begin
  if chkEmbarked.Checked = False then
    getVehicle
  else
  begin
    edtFilterEmbarkedPlatform.Enabled := True;
    btn3.Enabled := True;
  end;
end;

procedure TfVehiclePicklistFilter.chkSensorClick(Sender: TObject);
begin
  if chkSensor.Checked = False then
    getVehicle
  else
  begin
    cbbFilterSensorType.Enabled := True;
    edtFiltersensorOnBoard.Enabled := True;
    btn1.Enabled := True;
  end;
end;

procedure TfVehiclePicklistFilter.chkTypeClick(Sender: TObject);
begin
  if chkType.Checked = False then
    getVehicle;
end;

procedure TfVehiclePicklistFilter.chkWeaponClick(Sender: TObject);
begin
  if chkWeapon.Checked = False then
    getVehicle
  else
  begin
    cbbFilterWeaponType.Enabled := True;
    edtFilterWeaponOnBoar.Enabled := True;
    btn2.Enabled := True;
  end;
end;

procedure TfVehiclePicklistFilter.getEmbarked;
var i:integer;
begin
  lbAllVehicle.Items.Clear;
  lbTempIdAll.Items.Clear;
  vList.Clear;

  dmTTT.GetHosted_Platform(0,StrToInt(fVehicleSelect.vId),vList);

  for I := 0 to vList.Count - 1 do
  begin
    lbAllVehicle.Items.Add(THosted_Platform(vList[i]).FVehicle.Vehicle_Identifier);
    lbTempIdAll.Items.Add(IntToStr(THosted_Platform(vList[i]).FVehicle.Vehicle_Index));
  end;


end;


procedure TfVehiclePicklistFilter.getSensor;
var i:integer;
begin
  lbAllVehicle.Items.Clear;
  lbTempIdAll.Items.Clear;


  case cbbFilterSensorType.ItemIndex of
      0: dmTTT.getAllEO_On_Board(0,StrToInt(fSensor.idSensor),sList);
      1: dmTTT.getAllESM_On_Board(0,StrToInt(fSensor.idSensor),sList);
      2: dmTTT.getAllIFF_Sensor_On_Board(0,StrToInt(fSensor.idSensor),sList);
      3: dmTTT.getAllMAD_Sensor_On_Board(0,StrToInt(fSensor.idSensor),sList);
      4: dmTTT.getAllRadar_On_Board(0,StrToInt(fSensor.idSensor),sList);
      5: dmTTT.getAllSonar_On_Board(0,StrToInt(fSensor.idSensor),sList);
      6: dmTTT.getAllSonobuoy_On_Board(0,StrToInt(fSensor.idSensor),sList);
      7: dmTTT.getAllVisual_Sensor_On_Board(0,StrToInt(fSensor.idSensor),sList);
  end;

 for i := 0 to sList.Count - 1 do
 begin
    if cbbFilterSensorType.ItemIndex = 0 then
    begin
      lbAllVehicle.Items.Add(TEO_On_Board(sList[i]).FVehicle.FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TEO_On_Board(sList[i]).FData.Vehicle_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 1 then
    begin
      lbAllVehicle.Items.Add(TESM_On_Board(sList[i]).FVehicle.FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TESM_On_Board(sList[i]).FData.Vehicle_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 2 then
    begin
      lbAllVehicle.Items.Add(TIFF_Sensor_On_Board(sList[i]).FVehicle.FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TIFF_Sensor_On_Board(sList[i]).FData.Vehicle_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 3 then
    begin
      lbAllVehicle.Items.Add(TMAD_Sensor_On_Board(sList[i]).FVehicle.FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TMAD_Sensor_On_Board(sList[i]).FData.Vehicle_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 4 then
    begin
      lbAllVehicle.Items.Add(TRadar_On_Board(sList[i]).FVehicle.FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TRadar_On_Board(sList[i]).FData.Vehicle_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 5 then
    begin
      lbAllVehicle.Items.Add(TSonar_On_Board(sList[i]).FVehicle.FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TSonar_On_Board(sList[i]).FData.Vehicle_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 6 then
    begin
      lbAllVehicle.Items.Add(TSonobuoy_On_Board(sList[i]).FVehicle.FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TSonobuoy_On_Board(sList[i]).FData.Vehicle_Index));
    end
    else begin
      lbAllVehicle.Items.Add(TVisual_Sensor_On_Board(sList[i]).FVehicle.FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TVisual_Sensor_On_Board(sList[i]).FData.Vehicle_Index));
    end;
 end;

end;

procedure TfVehiclePicklistFilter.getWeapon;
var i:integer;
begin
  lbAllVehicle.Items.Clear;
  lbTempIdAll.Items.Clear;


  case cbbFilterWeaponType.ItemIndex of
      0: dmTTT.getAllMines_OnBoard(0,StrToInt(fWeaponDoubleList.idWeapon),wList);
      1: dmTTT.getAllMissile_OnBoard(0,StrToInt(fWeaponDoubleList.idWeapon),wList);
      2: dmTTT.getAllTorpedo_OnBoard(0,StrToInt(fWeaponDoubleList.idWeapon),wList);
  end;

 for i := 0 to wList.Count - 1 do
 begin
    if cbbFilterWeaponType.ItemIndex = 0 then
    begin
      lbAllVehicle.Items.Add(TMine_On_Board(wList[i]).FVehicle.FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TMine_On_Board(fVehiclePicklistFilter.wList[i]).FData.Vehicle_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterWeaponType.ItemIndex = 1 then
    begin
      lbAllVehicle.Items.Add(TMissile_On_Board(wList[i]).FVehicle.FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TMissile_On_Board(wList[i]).FData.Vehicle_Index));
    end
    else begin
      lbAllVehicle.Items.Add(TTorpedo_On_Board(wList[i]).FVehicle.FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TTorpedo_On_Board(wList[i]).FData.Vehicle_Index));
    end
 end;
end;

procedure TfVehiclePicklistFilter.refresh;
var int:integer;
begin
  lbAllVehicle.Items.Clear;
  lbTempIdAll.Items.Clear;

  if vList.Count <> 0 then
  begin
    for int := 0 to vList.Count - 1 do
    begin
       lbAllVehicle.Items.Add(TVehicle_Definition(vList[int]).FData.Vehicle_Identifier);
       lbTempIdAll.Items.Add(IntToStr(TVehicle_Definition(vList[int]).FData.Vehicle_Index));
    end;
  end;
end;

procedure TfVehiclePicklistFilter.Filter;
var domain,tipe,sensor,weapon,embarked : string;
begin
  domain := '';
  if chkDomain.Checked = True then
  begin
    case cbbFilterDomain.ItemIndex of
      0: domain := '0';
      1: domain := '4';
      2: domain := '3';
      3: domain := '2';
      4: domain := '1';
    end;
  end;

  tipe := '';
  if chkType.Checked = True then
  begin
    case cbbFilterType.ItemIndex of
     0 : tipe := '13';
     1 : tipe := '12';
     2 : tipe := '11';
     3 : tipe := '10';
     4 : tipe := '17';
     5 : tipe := '16';
     6 : tipe := '22';
     7 : tipe := '18';
     8 : tipe := '19';
     9 : tipe := '14';
     10 : tipe := '15';
     11 : tipe := '41';
     12 : tipe := '20';
     13 : tipe := '25';
     14 : tipe := '23';
     15 : tipe := '24';
     16 : tipe := '26';
     17 : tipe := '21';
     18 : tipe := '0';
     19 : tipe := '1';
     20 : tipe := '2';
     21 : tipe := '5';
     22 : tipe := '4';
     23 : tipe := '3';
     24 : tipe := '6';
     25 : tipe := '7';
     26 : tipe := '45';
     27 : tipe := '46';
     28 : tipe := '8';
     29 : tipe := '9';
     30 : tipe := '31';
     31 : tipe := '32';
     32 : tipe := '33';
     33 : tipe := '27';
     34 : tipe := '28';
     35 : tipe := '29';
     36 : tipe := '30';
     37 : tipe := '34';
     38 : tipe := '35';
     39 : tipe := '40';
    end;
  end;

  sensor := '';
  if chkSensor.Checked = True then
  begin
    case cbbFilterSensorType.ItemIndex of
      0: dmTTT.getAllEO_On_Board(0,1,sList);
      1: dmTTT.getAllESM_On_Board(0,1,sList);
      2: dmTTT.getAllIFF_Sensor_On_Board(0,1,sList);
      3: dmTTT.getAllMAD_Sensor_On_Board(0,1,sList);
      4: dmTTT.getAllRadar_On_Board(0,1,sList);
      5: dmTTT.getAllSonar_On_Board(0,1,sList);
      6: dmTTT.getAllSonobuoy_On_Board(0,1,sList);
      7: dmTTT.getAllVisual_Sensor_On_Board(0,1,sList);
    end;
  end;

  weapon := '';
  if chkWeapon.Checked = True then
  begin
    case cbbFilterWeaponType.ItemIndex of
      0: dmTTT.getAllMines_OnBoard(0,1,wList);
      1: dmTTT.getAllMissile_OnBoard(0,1,wList);
      2: dmTTT.getAllTorpedo_OnBoard(0,1,wList);
    end;
  end;
  vList.Clear;
  dmTTT.GetVehicleBy(domain,tipe,weapon,vList);
  refresh;
end;

procedure TfVehiclePicklistFilter.FormCreate(Sender: TObject);
begin
  vList := Tlist.Create;
  sList := TList.Create;
  wList := TList.Create;
  nList := TList.Create;
  pi_identifier := TPlatform_Instance_Identifier.Create;
end;

procedure TfVehiclePicklistFilter.FormShow(Sender: TObject);
begin
  getVehicle;
  Height := 390;
end;

procedure TfVehiclePicklistFilter.getVehicle;
var int:integer;
begin

//get all vehicle name
 uSimDBEditor.getAllVehicles(vList,0,vehicle);

 lbAllVehicle.Items.Clear;
 lbTempIdAll.Items.Clear;

 for int := 0 to vList.Count - 1 do
 begin
    lbAllVehicle.Items.Add(TVehicle_Definition(vList[int]).FData.Vehicle_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TVehicle_Definition(vList[int]).FData.Vehicle_Index));
 end;

end;

end.
