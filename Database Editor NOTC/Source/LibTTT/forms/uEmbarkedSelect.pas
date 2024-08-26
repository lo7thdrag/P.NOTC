unit uEmbarkedSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject, newClassASTT, uDBAsset_Vehicle;

type
  TfEmbarkedSelect = class(TForm)
    lbRAVehicle: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TButton;
    btnClose: TButton;
    shp1: TShape;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    lbAllVehicle: TListBox;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btnEditTrack: TButton;
    grpFilter: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    chkDomain: TCheckBox;
    cbbFilterDomain: TComboBox;
    chkType: TCheckBox;
    chkSensor: TCheckBox;
    chkWeapon: TCheckBox;
    chkEmbarked: TCheckBox;
    cbbFilterType: TComboBox;
    cbbFilterSensorType: TComboBox;
    cbbFilterWeaponType: TComboBox;
    edtFilterWeaponOnBoar: TEdit;
    btn2: TButton;
    edtFilterEmbarkedPlatform: TEdit;
    btn3: TButton;
    edtFiltersensorOnBoard: TEdit;
    btn1: TButton;
    btnFilter: TButton;
    btnUsage: TButton;
    lbQuantity: TListBox;
    edtSearch: TEdit;
    lbl5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure getAllVehicle;
    procedure getVehicleSelect;
    procedure showVehicleSelect;
    procedure showVehicleSelectList;
    procedure btnOkClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnEditTrackClick(Sender: TObject);
    procedure lbAllVehicleClick(Sender: TObject);
    procedure lbRAVehicleClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure chkDomainClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure cbbFilterDomainChange(Sender: TObject);
    procedure cbbFilterTypeChange(Sender: TObject);
    procedure cbbFilterSensorTypeChange(Sender: TObject);
    procedure cbbFilterWeaponTypeChange(Sender: TObject);
    procedure edtSearchKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    platform_activation : TPlatform_Activation;
    vehicle             : TVehicle_Definition;
    procedure Filter;
    procedure getSensor;
    procedure getWeapon;
    procedure domainBehav;
    procedure refresh;

  public
  vId,name_vId,pi_ID   : string;
  id_embFilter,id_embarked   : string;
  vehicle_ra  :boolean;
  platform_identifier : TPlatform_Instance_Identifier;
  platform_instance   : TPlatform_Instance;
  hosted_plat         : THosted_Platform;
  id_form : Integer;
//  fromRuntime,fromFilter : boolean;
  edit_quantity : boolean;
//  platform_library_entry : TPlatform_Library_Entry;
    { Public declarations }
  end;

var
  fEmbarkedSelect: TfEmbarkedSelect;
  pList,vList,sList,wList   :TList;

implementation

uses uSimDBEditor,uDBAsset_GameEnvironment,ufrmSummaryResourceAllocation,
uDataModuleTTT, uResurceAllocationSelect,ufrmAvailableResourceAllocation,uInputName,ufrmAvailableVehicle,
ufrmSummaryVehicle, ufrmSummaryRuntimePlatform, ufrmSummaryPredefinedPattern, ufrmUsage,
  uWeaponDoubleList, uSensorDoubleList, uVehicleSelect,
  ufrmSummaryEOD, ufrmSummaryMAD, ufrmSummarySonar, ufrmSonobuoyMount, ufrmSummaryMine,
  ufrmSummaryMissile, ufrmSummaryTorpedo;

{$R *.dfm}


procedure TfEmbarkedSelect.btn1Click(Sender: TObject);
begin
  getSensor;
  fSensor.ShowModal;
end;

procedure TfEmbarkedSelect.getSensor;

begin
  case cbbFilterSensorType.ItemIndex of
//    0: dmTTT.getEO_Def(0,sList,frmSummaryEOD.EOObject);
    1: dmTTT.getESM_Def(sList);
    2: dmTTT.getAllIFF_Sensor_On_Board(0,1,sList);  //
//    3: dmTTT.getMAD_Def(0,sList,frmSummaryMAD.MADObject);
    4: dmTTT.GetRadar_Definition(sList);
//    5: dmTTT.getSonar_Def(0,sList,frmSummarySonar.sonarObject);
//    6: dmTTT.getAllSonobuoy(0,0,slist,frmSonobuoyMount.sono);
    7: dmTTT.getAllVisual_Sensor_On_Board(0,1,sList); //
  end;
end;

procedure TfEmbarkedSelect.btn2Click(Sender: TObject);
begin
  getWeapon;
  fWeaponDoubleList.ShowModal;
end;

procedure TfEmbarkedSelect.btn3Click(Sender: TObject);
begin
  if edtFilterEmbarkedPlatform.Text = '[None]' then
     fVehicleSelect.vId := '';

  id_embFilter := fVehicleSelect.vId;
  fVehicleSelect.id_form := fromFilter;
  fVehicleSelect.ShowModal;
end;

procedure TfEmbarkedSelect.getWeapon;

begin
//  case cbbFilterWeaponType.ItemIndex of
//    0: dmTTT.getAllMine(0,wList,frmSummaryMine.mine);
//    1: dmTTT.getAllMissile(0,wList,frmSummaryMissile.missile);
//    2: dmTTT.getAllTorpedo(0,wList,frmSummaryTorpedo.torpedo);
//  end;
end;

procedure TfEmbarkedSelect.btnAddClick(Sender: TObject);
var
  I: Integer;
begin
  if lbAllVehicle.ItemIndex <> -1 then
  begin
    if id_form = fromFilter then
    begin
        vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];

        showVehicleSelect;
    end
    //  else if id_form = fromRuntime then
    //  begin
    //    platform_library_entry := TPlatform_Library_Entry.Create;
    //    with platform_library_entry.FData do
    //    begin
    //      Library_Index := fRuntimePlatform.platform_library_index;
    //      Platform_Type := 1;
    //      Vehicle_Index := StrToInt(lbTempIdAll.Items[lbAllVehicle.ItemIndex]);
    //      dmTTT.InsertPlatform_Library_Entry(platform_library_entry);
    //
    //      getRuntimeVehicle;
    //
    //  end
    else if id_form = fromVehicle then
    begin
      for I := 0 to selVecList.Count - 1 do
      begin
        if THosted_Platform(selVecList[I]).FVehicle.Vehicle_Identifier =
           TVehicle_Definition(vList[lbAllVehicle.ItemIndex]).FData.Vehicle_Identifier then
        begin
          ShowMessage('This platform has already been added');
          Exit;
        end;
      end;

      fInputName.hostRec := THosted_Platform.Create;
      fInputName.hostRec.FVehicle := TVehicle_Definition(vList[lbAllVehicle.ItemIndex]).FData;
      with fInputName.hostRec do
      begin
//        if frmAvailableVehicle.id_vehicle <> '' then
//          FData.Vehicle_Index := StrToInt(frmAvailableVehicle.id_vehicle)
//        else if fVehicleSelect.vId <> '' then
//          FData.Vehicle_Index := StrToInt(fVehicleSelect.vId)
//        else
//          FData.Vehicle_index := frmSummaryVehicle.vehicle.FData.Vehicle_Index;
        FData.Hosted_Vehicle_Index := StrToInt(lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex]);
        FData.Quantity   := 0;
      end;
      edit_quantity := false;
      fInputName.show_from := fromVehicle;
      fInputName.ShowModal;
    end;
  end;

end;

procedure TfEmbarkedSelect.btnCloseClick(Sender: TObject);
begin
//  frmAvailableVehicle.edtFilterEmbarkedPlatform.Text := '[None]';
  Close;
  btnEdit.Enabled := false;
  btnCopy.Enabled := false;
  btnAdd.Enabled := false;
  btnUsage.Enabled := false;
  btnEditTrack.Enabled := false;
  btnRemove.Enabled := false;
  if id_form = fromFilter then
    vId := fVehicleSelect.id_embFilter;
end;

procedure TfEmbarkedSelect.btnCopyClick(Sender: TObject);
begin
  if lbAllVehicle.ItemIndex <> -1 then
  begin
    vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
    dmTTT.GetVehicle_Definition(StrToInt(lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex]),vehicle);
    with frmSummaryVehicle do begin
      edtClass.Text     := 'Copy Of ' + lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
      vehicle_ra        := True;
//      frmAvailableVehicle.Vehicle_Def;
//      isNew             := True;
//      isCopy            := True;
      ShowModal;
    end;

  end;
end;

procedure TfEmbarkedSelect.btnEditClick(Sender: TObject);
begin
  if lbAllVehicle.ItemIndex <> -1 then
  begin
    vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
    frmSummaryVehicle := frmSummaryVehicle.Create(Self);
    with frmSummaryVehicle do begin
      edtClass.Text     := lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
      vehicle_ra        := True;
//      frmAvailableVehicle.id_vehicle := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
//      frmAvailableVehicle.Vehicle_Def;
//      isNew             := False;
//      vehicle_id        := StrToInt(vId);
      ShowModal;
    end;
  end;
end;

procedure TfEmbarkedSelect.btnEditTrackClick(Sender: TObject);
begin
  if lbRAVehicle.ItemIndex <> -1 then
  begin
    with fInputName do begin
      //edtQuantity.Clear;
//      fInputName.edtQuantity.Text  := lbQuantity.Items.Strings[lbRAVehicle.ItemIndex];
      edit_quantity := true;
      show_from := fromVehicle;
      hostRec := THosted_Platform(selVecList[lbRAVehicle.ItemIndex]);
      ShowModal;
    end;
  end;
end;

procedure TfEmbarkedSelect.btnFilterClick(Sender: TObject);
begin
   if btnFilter.Caption = '>> Filter' then
   begin
    btnFilter.Caption := '<< Filter';
    fEmbarkedSelect.Height := 743;
   end
   else if btnFilter.Caption = '<< Filter' then
   begin
     btnFilter.Caption := '>> Filter';
     fEmbarkedSelect.Height := 440;
   end;
end;

procedure TfEmbarkedSelect.btnNewClick(Sender: TObject);
begin
  with frmSummaryVehicle do begin
//    isNew := true;
    lbRAVehicle.Items.Clear;
    lbTempIdSel.Items.Clear;
    edtClass.Text                         := '';
//    edtName.Text                          := '';
    edtAntennaHeight.Text                 := '';
    edtAntennaAboveWater.Text             := '';
    edtMaxCom.Text                        := '';
//    edtDamage.Text                        := '';
    edtLengthDimension.Text               := '';
    edtWidthDimension.Text                := '';
    edtHeightDimension.Text               := '';
    edtEngagementRangeDimension.Text      := '';
    edtDraftDimension.Text                := '';
    edtMotionCharacterictic.Text          := '[None]';
    edtFrontRadarPhysical.Text            := '';
    edtSideRadarPhysical.Text             := '';
    edtFrontAcousticPhysical.Text         := '';
    edtFrontVisualPhysical.Text                := '';
    edtSideVisualPhysical.Text            := '';
    edtFrontInfraredPhysical.Text         := '';
    edtSideInfraredPhysical.Text          := '';
//    edtFontRadar.Text                     := '';
    edtSideRadar.Text                     := '';
    edtMagneticPhysical.Text              := '';
    edtMinSpeedAcousticPhysical.Text      := '';
    edtBelowCavitationAcousticPhysical.Text := '';
    edtAboveCavitationAcousticPhysical.Text := '';
    edtMaxSpeedAcousticPhysical.Text        := '';
    edtCavitationSpeedAcousticPhysical.Text := '';
    edtMaxOperatPeriscope.Text              := '';
    edtHighAbovePeriscope.Text              := '';
//    edtFontInfrared.Text                    := '';
    edtSideInfrared.Text                    := '';
//    edtFontVisual.Text                      := '';
    edtSideVisual.Text                      := '';
    edtRefuelTime.Text                      := '';
    edtLaunchAlertTime.Text                 := '';
    edtMaxDropAltitude.Text                 := '';
    edtMinDropAltitude.Text                 := '';
    edtMaxDropSpeed.Text                    := '';
    edtHullMounted.Text                     := '';
    edtTowedArray.Text                      := '';
    edtMaxNumbToMOnitor.Text                := '';
    edtMaxDeployAltitude.Text               := '';
    edtMinDeployAltitude.Text               := '';
    edtMaxDeploySpeed.Text                  := '';
    edtAntiRadiationMissile.Text            := '';
    edtInfraredHomingMissile.Text           := '';
    edtSemiActiveMissile.Text               := '';
    edtTerminalActiveMissile.Text           := '';
    edtActiveAcousticTorpedo.Text           := '';
    edtPassiveAcousticTorpedo.Text          := '';
    edtActivePassiveAcousticTorpedo.Text    := '';
    edtWireGuidedTorpedo.Text               := '';
    edtAcousticMine.Text                    := '';
    edtImpactMine.Text                      := '';
    edtMagneticMine.Text                    := '';
    edtPressureMine.Text                    := '';
    edtWakeHomingTorpedo.Text               := '';
//    edtFrontSidePhysical.Text               := '';
    ShowModal;
  end;
end;

procedure TfEmbarkedSelect.btnOkClick(Sender: TObject);
var i:integer;
id : string;
begin
  if id_form = fromFilter then
  begin
    if vId <> '' then
    begin
      fVehicleSelect.edtFilterEmbarkedPlatform.Text := lbRAVehicle.Items.Strings[0];
//      frmAvailableVehicle.edtFilterEmbarkedPlatform.Text := lbRAVehicle.Items.Strings[0];
    end
    else
    begin
      fVehicleSelect.edtFilterEmbarkedPlatform.Text := '[None]';
//      frmAvailableVehicle.edtFilterEmbarkedPlatform.Text := '[None]';
    end;

    fVehicleSelect.Filter;
//    frmAvailableVehicle.Filter;
    Close;
  end
  else if id_form = fromVehicle then
    begin
//      frmSummaryVehicle.embarkedList.Clear;
//      for I := 0 to selVecList.Count - 1 do
//      begin
//        frmSummaryVehicle.embarkedList.Add(THosted_Platform(selVecList[I]));
//      end;
      Close;
    end
  else begin
//    if frmAvailableVehicle.id_vehicle <> '' then
//      dmTTT.DeleteHosted_PlatformByVehicle(frmAvailableVehicle.id_vehicle)
//    else if StrToInt(vId) <> 0 then
//      dmTTT.DeleteHosted_PlatformByVehicle(vId)
//    else
//      dmTTT.DeleteHosted_PlatformByVehicle(IntToStr(frmSummaryVehicle.vehicle.FData.Vehicle_Index));

    for I := 0 to lbRAVehicle.Count - 1 do
    begin
      id_embarked := lbTempIdSel.Items.Strings[i];
      with hosted_plat.FData do begin
//        if frmAvailableVehicle.id_vehicle <> '' then
//          Vehicle_Index         := StrToInt(frmAvailableVehicle.id_vehicle)
//        else if StrToInt(vId) <> 0 then
//          Vehicle_Index         := StrToInt(vId)
//        else
//          Vehicle_Index         := frmSummaryVehicle.vehicle.FData.Vehicle_Index;
        Hosted_Vehicle_Index  := StrToInt(id_embarked);
        if lbQuantity.Items.Strings[i] <> '' then
          Quantity           := StrToInt(lbQuantity.Items.Strings[i])
        else
          Quantity              := 0;
      end;
//      if frmAvailableVehicle.id_vehicle <> '' then
//        id := frmAvailableVehicle.id_vehicle
//      else if StrToInt(vId) <> 0 then
//        id := vId
//      else
//        id := IntToStr(frmSummaryVehicle.vehicle.FData.Vehicle_Index) ;

      dmTTT.insertHosted_Platform(hosted_plat);
    end;
    Close;
  end;
end;

procedure TfEmbarkedSelect.btnRemoveClick(Sender: TObject);

begin
  if lbRAVehicle.ItemIndex <> -1 then
  begin
    if (id_form = fromPattern) or (id_form = fromFilter) then
    begin
      vId := '';
      showVehicleSelect;
    end
    else begin
      selVecList.Delete(lbRAVehicle.ItemIndex);
      showVehicleSelectList;
    end;
  end;
end;

procedure TfEmbarkedSelect.btnUsageClick(Sender: TObject);
begin
  if lbRAVehicle.ItemIndex <> -1 then begin
//    if (not fromRuntime) then
//    begin
      with frmUsage do begin
        UId := TPlatform_Instance(pList[lbRAVehicle.ItemIndex]).FData.Vehicle_Index;
        name_usage  := lbRAVehicle.Items.Strings[lbRAVehicle.ItemIndex];
        UIndex  := 25;
        usage_title := 'Scenario:';
        ShowModal;
      end;
//    end;
  end;
end;

procedure TfEmbarkedSelect.Filter;
var negara, domain,tipe,sensor,weapon,embarked : string;
begin
  {titip cheat negara}
  negara := '-1';

  domain := '-1';
  if chkDomain.Checked = True then
  begin
    case cbbFilterDomain.ItemIndex of
      0: domain := '1';
      1: domain := '2';
      2: domain := '0';
      3: domain := '3';
      4: domain := '4';
    end;
  end;

 tipe := '-1';
  if chkType.Checked = True then
  begin
    if cbbFilterType.Text = 'Other' then
      tipe := '0'
    else if cbbFilterType.Text = 'Fixed Wing,Strike/Bomber' then
      tipe := '1'
    else if cbbFilterType.Text = 'Fixed Wing,ASW/MP' then
      tipe := '2'
    else if cbbFilterType.Text = 'Fixed Wing,EW' then
      tipe := '3'
    else if cbbFilterType.Text = 'Rotary Wing,Attack' then
      tipe := '4'
    else if cbbFilterType.Text = 'Fixed-Surveillance/AEW' then
      tipe := '5'
    else if cbbFilterType.Text = 'Rotary Wing,ASW' then
      tipe := '6'
    else if cbbFilterType.Text = 'Fixed-Reconnaissance' then
      tipe := '7'
    else if cbbFilterType.Text = 'Seaplane' then
      tipe := '8'
    else if cbbFilterType.Text = 'Missile' then
      tipe := '9'
    else if cbbFilterType.Text = 'Aircraft Carrier(CV/CVN)' then
      tipe := '10'
    else if cbbFilterType.Text = 'Cruiser,Guided Missile(CG/CGN)' then
      tipe := '11'
    else if cbbFilterType.Text = 'Destroyer,Guided Missile(DDG)' then
      tipe := '12'
    else if cbbFilterType.Text = 'Frigate,Guided Missile(FFG)' then
      tipe := '13'
    else if cbbFilterType.Text = 'Destroyer(DD)' then
      tipe := '14'
    else if cbbFilterType.Text = 'Frigate(FF)' then
      tipe := '15'
    else if cbbFilterType.Text = 'Mine Warfare' then
      tipe := '16'
    else if cbbFilterType.Text = 'Patrol Craft(PT/PTG)' then
      tipe := '17'
    else if cbbFilterType.Text = 'Merchant' then
      tipe := '18'
    else if cbbFilterType.Text = 'Auxiliary' then
      tipe := '19'
    else if cbbFilterType.Text = 'Fixed Wing,Fighter' then
      tipe := '20'
    else if cbbFilterType.Text = 'Nuclear,Ballistic Missile(SSBN)' then
      tipe := '21'
    else if cbbFilterType.Text = 'Utility Vessel' then
      tipe := '22'
    else if cbbFilterType.Text = 'Nuclear,Attack(SSN)' then
      tipe := '23'
    else if cbbFilterType.Text = 'Nuclear,Guided Missile(SSGN)' then
      tipe := '24'
    else if cbbFilterType.Text = 'Diesel,Attack(SSK)' then
      tipe := '25'
    else if cbbFilterType.Text = 'Diesel,Guided Missile(SSG)' then
      tipe := '26'
    else if cbbFilterType.Text = 'Battery,Surface-to-Air-Missile' then
      tipe := '27'
    else if cbbFilterType.Text = 'Battery,Coastal Defence Missile' then
      tipe := '28'
    else if cbbFilterType.Text = 'Battery,Coastal Defence Gun' then
      tipe := '29'
    else if cbbFilterType.Text = 'Airfield' then
      tipe := '30'
    else if cbbFilterType.Text = 'Platoon,Armour' then
      tipe := '31'
    else if cbbFilterType.Text = 'Platoon,Infantry' then
      tipe := '32'
    else if cbbFilterType.Text = 'Platoon,Artilery' then
      tipe := '33'
    else if cbbFilterType.Text = 'Port' then
      tipe := '34'
    else if cbbFilterType.Text = 'Special Craft' then
      tipe := '35'
    else if cbbFilterType.Text = 'Other' then
      tipe := '40'
    else if cbbFilterType.Text = 'Amphibious Warfare' then
      tipe := '41'
    else if cbbFilterType.Text = 'Rotary Wing-Surveillance/AEW' then
      tipe := '45'
    else if cbbFilterType.Text = '' then
      tipe := tipe
    else
      tipe := '46';
  end;

  sensor := '-1';
  if chkSensor.Checked = True then
    sensor := IntToStr(cbbFilterSensorType.ItemIndex);

  weapon := '-1';
  if chkWeapon.Checked = True then
    weapon := IntToStr(cbbFilterWeaponType.ItemIndex);

  if fWeaponDoubleList.idWeapon = '' then
    fWeaponDoubleList.idWeapon := '-1';

  if fSensor.idSensor = '' then
    fSensor.idSensor := '-1';

  embarked := '-1';
  if chkEmbarked.Checked = True then
  begin
    if fVehicleSelect.vId <> '' then
      embarked := fVehicleSelect.vId
    else embarked := '0';
  end;

  vList.Clear;
 // dmTTT.GetVehicleBy(domain,tipe,embarked,vList);
  dmTTT.getFilterVehicle(edtSearch.Text, StrToInt(negara),StrToInt(domain),StrToInt(tipe),
  StrToInt(weapon),StrToInt(fWeaponDoubleList.idWeapon),StrToInt(sensor),
  StrToInt(fSensor.idSensor),StrToInt(embarked),vList);
  refresh;
end;

procedure TfEmbarkedSelect.refresh;
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

procedure TfEmbarkedSelect.cbbFilterDomainChange(Sender: TObject);
begin
  domainBehav;
  if chkDomain.Checked = true then
    chkDomainClick(Sender);
end;

procedure TfEmbarkedSelect.cbbFilterSensorTypeChange(Sender: TObject);
begin
  edtFiltersensorOnBoard.Text := '[None]';
  fSensor.lbsensorSel.Clear;
  Filter;
end;

procedure TfEmbarkedSelect.cbbFilterTypeChange(Sender: TObject);
begin
  if chkType.Checked = true then
    chkDomainClick(Sender);
end;

procedure TfEmbarkedSelect.cbbFilterWeaponTypeChange(Sender: TObject);
begin
  edtFilterWeaponOnBoar.Text := '[None]';
  fWeaponDoubleList.lbWeaponSel.Clear;
  Filter;
end;

procedure TfEmbarkedSelect.domainBehav;
begin
  if cbbFilterDomain.ItemIndex = 0 then
    begin
      cbbFilterType.Items.Clear;
      cbbFilterType.Items.Add('Frigate,Guided Missile(FFG)');
      cbbFilterType.Items.Add('Destroyer,Guided Missile(DDG)');
      cbbFilterType.Items.Add('Cruiser,Guided Missile(CG/CGN)');
      cbbFilterType.Items.Add('Aircraft Carrier(CV/CVN)');
      cbbFilterType.Items.Add('Patrol Craft(PT/PTG)');
      cbbFilterType.Items.Add('Mine Warfare');
      cbbFilterType.Items.Add('Auxiliary');
      cbbFilterType.Items.Add('Merchant');
      cbbFilterType.Items.Add('Utility Vessel');
      cbbFilterType.Items.Add('Destroyer(DD)');
      cbbFilterType.Items.Add('Frigate(FF)');
      cbbFilterType.Items.Add('Amphibious Warfare');
      cbbFilterType.Items.Add('Other');
    end
  else if cbbFilterDomain.ItemIndex = 1 then
    begin
      cbbFilterType.Items.Clear;
      cbbFilterType.Items.Add('Diesel,Attack(SSK)');
      cbbFilterType.Items.Add('Nuclear,Attack(SSN)');
      cbbFilterType.Items.Add('Nuclear,Guided Missile(SSGN)');
      cbbFilterType.Items.Add('Diesel,Guided Missile(SSG)');
      cbbFilterType.Items.Add('Nuclear,Ballistic Missile(SSBN)');
      cbbFilterType.Items.Add('Other');
    end
  else if cbbFilterDomain.ItemIndex = 2 then
    begin
      cbbFilterType.Items.Clear;
      cbbFilterType.Items.Add('Fixed Wing,Fighter');
      cbbFilterType.Items.Add('Fixed Wing,Strike/Bomber');
      cbbFilterType.Items.Add('Fixed Wing,ASW/MP');
      cbbFilterType.Items.Add('Rotary Wing,ASW');
      cbbFilterType.Items.Add('Rotary Wing,Attack');
      cbbFilterType.Items.Add('Fixed Wing,EW');
      cbbFilterType.Items.Add('Fixed-Surveillance/AEW');
      cbbFilterType.Items.Add('Fixed-Reconnaissance');
      cbbFilterType.Items.Add('Rotary Wing-Surveillance/AEW');
      cbbFilterType.Items.Add('Rotary Wing-Reconnaissance');
      cbbFilterType.Items.Add('Seaplane');
      cbbFilterType.Items.Add('Missile');
      cbbFilterType.Items.Add('Other');
    end
  else
  begin
      cbbFilterType.Items.Clear;
      cbbFilterType.Items.Add('Platoon,Armour');
      cbbFilterType.Items.Add('Platoon,Infantry');
      cbbFilterType.Items.Add('Battery,Anti-aircraft Artillery');
      cbbFilterType.Items.Add('Battery,Surface-to-Air Missile');
      cbbFilterType.Items.Add('Battery,Coastal Defence Missile');
      cbbFilterType.Items.Add('Battery,Coastal Defence Gun');
      cbbFilterType.Items.Add('Airfield');
      cbbFilterType.Items.Add('Port');
      cbbFilterType.Items.Add('Other');
  end;

  cbbFilterType.ItemIndex := 0;
end;

procedure TfEmbarkedSelect.edtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filter;
  end;
end;

procedure TfEmbarkedSelect.chkDomainClick(Sender: TObject);
begin
  Filter;
end;

procedure TfEmbarkedSelect.FormCreate(Sender: TObject);
begin
  platform_identifier := TPlatform_Instance_Identifier.Create;
  platform_instance   := TPlatform_Instance.Create;
  platform_activation := TPlatform_Activation.Create;
  vehicle             := TVehicle_Definition.Create;
  hosted_plat         := THosted_Platform.Create;
  pList               := TList.Create;
  vList               := TList.Create;
  sList               := TList.Create;
  wList               := TList.Create;
end;

procedure TfEmbarkedSelect.FormShow(Sender: TObject);
begin
  cbbFilterDomain.ItemIndex := 0;
  cbbFilterType.ItemIndex   := 0;
  cbbFilterSensorType.ItemIndex := 0;
  cbbFilterWeaponType.ItemIndex := 0;
  edtFiltersensorOnBoard.Text := '[None]';
  edtFilterWeaponOnBoar.Text  := '[None]';
  edtFilterEmbarkedPlatform.Text:= '[None]';
  chkDomain.Checked := False;
  chkType.Checked := false;
  chkSensor.Checked := False;
  chkWeapon.Checked := false;
  chkEmbarked.Checked := false;
  btnFilter.Caption := '>> Filter';
  edtSearch.Text := '';
  Height := 440;
  domainBehav;


  btnUsage.Enabled := True;
  btnEditTrack.Enabled := True;
  btn3.Enabled := True;

  getAllVehicle;
end;

procedure TfEmbarkedSelect.getAllVehicle;
begin
  allVecList.Clear;

  uSimDBEditor.getAllVehicles(allVecList,0,vehicle);

  getVehicleSelect;
end;

procedure TfEmbarkedSelect.getVehicleSelect;
var I: Integer;
begin
  if id_form = fromFilter then
  begin
    btnUsage.Enabled := False;
    btnEditTrack.Enabled := False;
    btn3.Enabled := False;
  end;
  if id_form = fromVehicle then
  begin
    lbAllVehicle.Items.Clear;
    lbTempIdAll.Items.Clear;

    for I := 0 to allVecList.Count - 1 do
    begin
      vList.Add(TVehicle_Definition(allVecList[I]));
      lbAllVehicle.Items.Add(TVehicle_Definition(allVecList[i]).FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TVehicle_Definition(allVecList[i]).FData.Vehicle_Index));
    end;
    showVehicleSelectList;
  end
  else showVehicleSelect;
end;

procedure TfEmbarkedSelect.showVehicleSelect;
var i : integer;
begin
  lbRAVehicle.Items.Clear;
  lbTempIdSel.Items.Clear;
  lbAllVehicle.Items.Clear;
  lbTempIdAll.Items.Clear;

  for I := 0 to allVecList.Count - 1 do
  begin
    if vId = IntToStr(TVehicle_Definition(allVecList[i]).FData.Vehicle_Index) then
    begin
      lbRAVehicle.Items.Add(TVehicle_Definition(allVecList[i]).FData.Vehicle_Identifier);
      lbTempIdSel.Items.Add(IntToStr(TVehicle_Definition(allVecList[i]).FData.Vehicle_Index));
    end
    else begin
      lbAllVehicle.Items.Add(TVehicle_Definition(allVecList[i]).FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TVehicle_Definition(allVecList[i]).FData.Vehicle_Index));
    end;
  end;
end;

procedure TfEmbarkedSelect.showVehicleSelectList;
var
  i : Integer;
begin
  lbRAVehicle.Items.Clear;
  lbTempIdSel.Items.Clear;
  lbQuantity.Items.Clear;

  for i := 0 to selVecList.Count - 1 do
  begin
    lbRAVehicle.Items.Add(THosted_Platform(selVecList[i]).FVehicle.Vehicle_Identifier);
    lbTempIdSel.Items.Add(IntToStr(THosted_Platform(selVecList[i]).FVehicle.Vehicle_Index));
    lbQuantity.Items.Add(IntToStr(THosted_Platform(selVecList[i]).FData.Quantity));
  end;
end;

{procedure TfEmbarkedSelect.getAllVehicle;
var
  I,k,count : Integer;
  temp_id_ra : Integer;
begin
  lbRAVehicle.Clear;
  lbTempIdAll.Clear;
  lbTempIdSel.Clear;
  lbAllVehicle.Clear;
  pList.Clear;

  if fVehicleAttributeWindow.vehicle_id <> 0 then
    dmTTT.GetHosted_Platform(fVehicleAttributeWindow.vehicle_id, 0, pList)
  else
    dmTTT.GetHosted_Platform(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, 0, pList);
  for I := 0 to pList.Count - 1 do
  begin
    lbRAVehicle.Items.Add(THosted_Platform(pList[I]).FVehicle.Vehicle_Identifier);
    lbTempIdSel.Items.Add(IntToStr(THosted_Platform(pList[I]).FData.Hosted_Vehicle_Index));
    lbQuantity.Items.Add(IntToStr(THosted_Platform(pList[I]).FData.Quantity));
  end;

  vList.Clear;

  uSimDBEditor.getAllVehicles(vList,0,vehicle);

  for I := 0 to vList.Count - 1 do
  begin
//    for k := 0 to pList.Count - 1 do
//    begin
//      if TVehicle_Definition(vList[i]).FData.Vehicle_Index = THosted_Platform(pList[k]).FData.Hosted_Vehicle_Index then
//        count := count + 1;
//    end;
//    if count = 0 then
//    begin
      lbAllVehicle.Items.Add(TVehicle_Definition(vList[i]).FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TVehicle_Definition(vList[i]).FData.Vehicle_Index));
//    end;
//    count := 0;
  end;
end; }

procedure TfEmbarkedSelect.lbAllVehicleClick(Sender: TObject);
begin
  if lbAllVehicle.ItemIndex <> -1 then
  begin
    btnCopy.Enabled := true;
    btnEdit.Enabled := true;
    btnAdd.Enabled := true;
  end;
end;

procedure TfEmbarkedSelect.lbRAVehicleClick(Sender: TObject);
begin
  if lbRAVehicle.ItemIndex <> -1 then
  begin
    btnRemove.Enabled := true;
    btnEditTrack.Enabled  := true;
    btnUsage.Enabled  := true;
    if id_form = fromRuntime then
    begin
      btnUsage.Enabled := False;
      btnEditTrack.Enabled := False;
    end
    else if id_form = fromFilter then
    begin
      btnUsage.Enabled := False;
      btnEditTrack.Enabled := False;
    end;
  end;
end;

end.
