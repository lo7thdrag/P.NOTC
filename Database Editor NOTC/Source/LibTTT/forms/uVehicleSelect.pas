unit uVehicleSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject, newClassASTT, uDBAsset_Vehicle,
  uDBAsset_Runtime_Platform_Library, ufrmAdminMainForm, uDBAsset_Logistics, uDBAsset_Transport,//dng
  uDBFormation, ufrmSummaryMotion;

type
  TfVehicleSelect = class(TForm)
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
    chkNegara: TCheckBox;
    lbl5: TLabel;
    edtSearch: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure getAllVehicle;
    procedure showVehicleSelect;
    procedure getVehicleSelect;
    procedure showRuntimeVehicle;
    procedure showRA;
    procedure btnOkClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure cbbFilterDomainChange(Sender: TObject);
    procedure cbbFilterTypeChange(Sender: TObject);
    procedure cbbFilterSensorTypeChange(Sender: TObject);
    procedure cbbFilterWeaponTypeChange(Sender: TObject);
    procedure chkDomainClick(Sender: TObject);
    procedure btnEditTrackClick(Sender: TObject);
    procedure lbAllVehicleClick(Sender: TObject);
    procedure lbRAVehicleClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure lbAllVehicleDblClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chkNegaraClick(Sender: TObject);
    procedure edtSearchKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    platform_activation : TPlatform_Activation;
    vehicle             : TVehicle_Definition;
    sList,wList : TList;


    procedure domainBehav;
    procedure getSensor;
    procedure getWeapon;
    procedure refresh;

  public
  vId,name_vId,pi_ID   : string;
  id_embFilter :string;
//  id_embarked   : string;
  vehicle_ra  :boolean;
  platform_identifier : TPlatform_Instance_Identifier;
  platform_instance   : TPlatform_Instance;
  hosted_plat         : THosted_Platform;
  id_form : Integer;
//  fromRuntime,fromFilter,fromPattern : boolean;
  platform_library_entry : TPlatform_Library_Entry;
    { Public declarations }

    procedure Filter;
  end;


var
  fVehicleSelect: TfVehicleSelect;
  allVecList,selVecList,vList   :TList;

implementation

uses uSimDBEditor,uDBAsset_GameEnvironment,ufrmSummaryResourceAllocation,
uDataModuleTTT, uResurceAllocationSelect,ufrmAvailableResourceAllocation,uInputName,ufrmAvailableVehicle,
ufrmSummaryVehicle, ufrmSummaryRuntimePlatform, ufrmSummaryPredefinedPattern, ufrmUsage,
  uSensorDoubleList, ufrmSummaryMAD, ufrmSummarySonar, ufrmSonobuoyMount,
  ufrmSummaryEOD, uWeaponDoubleList, ufrmSummaryMine, ufrmSummaryMissile,
  ufrmSummaryTorpedo, uEmbarkedSelect, ufrmGroupMemberSelection,
  ufrmSummaryLogistic, uFormationeditor, ufrmSummaryTransport;//dng

{$R *.dfm}



procedure TfVehicleSelect.Filter;
var negara, domain,tipe,sensor,weapon,embarked : string;
begin
  {titip cheat negara}
  negara := '-1';
  if chkNegara.Checked = True then
  begin
    negara := '1'
  end;

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
    if fEmbarkedSelect.vId <> '' then
      embarked := fEmbarkedSelect.vId
    else embarked := '0';
  end;

  vList.Clear;
 // dmTTT.GetVehicleBy(domain,tipe,embarked,vList);
  dmTTT.getFilterVehicle(edtSearch.Text, StrToInt(negara),StrToInt(domain),StrToInt(tipe),
  StrToInt(weapon),StrToInt(fWeaponDoubleList.idWeapon),StrToInt(sensor),
  StrToInt(fSensor.idSensor),StrToInt(embarked),vList);
  refresh;
end;

procedure TfVehicleSelect.refresh;   //dng
var
  i , j: integer;
  IsPrintable : Boolean;
  IdleftTlist, IdrightTlist : Integer;
begin
  lbAllVehicle.Items.Clear;
  lbTempIdAll.Items.Clear;

  if vList.Count <> 0 then
  begin
    for i := 0 to vList.Count - 1 do
    begin
      IdleftTlist := TVehicle_Definition(vList[i]).FData.Vehicle_Index;               // dng "perbaikan" memfilter data Tlistbox kiri ketika refresh
      IsPrintable := True;                                                            //
      for j := 0 to selVecList.Count - 1 do
      begin
        IdrightTlist := TVehicle_Definition(selVecList[j]).FData.Vehicle_Index;
        if (IdleftTlist = IdrightTlist) then
        begin
          IsPrintable := False;
          Break;
        end;
      end;
      if IsPrintable then
      begin
        lbAllVehicle.Items.Add(TVehicle_Definition(vList[i]).FData.Vehicle_Identifier);
        lbTempIdAll.Items.Add(IntToStr(TVehicle_Definition(vList[i]).FData.Vehicle_Index));
      end;
    end;
  end;
end;

procedure TfVehicleSelect.domainBehav;
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

procedure TfVehicleSelect.edtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filter;
  end;
end;

procedure TfVehicleSelect.getSensor;
begin
  case cbbFilterSensorType.ItemIndex of
//    0: dmTTT.getEO_Def(0,frmAvailableVehicle.sList,frmSummaryEOD.EOObject);
//    1: dmTTT.getESM_Def(frmAvailableVehicle.sList);
    2:
    begin
//      dmTTT.getAllIFF_Sensor_On_Board(0,1,fVehiclePicklistFilter.sList);  //
//      frmAvailableVehicle.sList.Clear;
    end;

//    3: dmTTT.getMAD_Def(0,frmAvailableVehicle.sList,frmSummaryMAD.MADObject);
//    4: dmTTT.GetRadar_Definition(frmAvailableVehicle.sList);
//    5: dmTTT.getSonar_Def(0,frmAvailableVehicle.sList,frmSummarySonar.sonarObject);
//    6: dmTTT.getAllSonobuoy(0,0,frmAvailableVehicle.slist,frmSonobuoyMount.sono);
    7:
    begin
//      dmTTT.getAllVisual_Sensor_On_Board(0,1,fVehiclePicklistFilter.sList); //
//      frmAvailableVehicle.sList.Clear;
    end;
  end;

//  frmAvailableVehicle.cbbFilterSensorType.ItemIndex := cbbFilterSensorType.ItemIndex;


end;

procedure TfVehicleSelect.getWeapon;
begin
//  case cbbFilterWeaponType.ItemIndex of
//    0: dmTTT.getAllMine(0,frmAvailableVehicle.wList,frmSummaryMine.mine);
//    1: dmTTT.getAllMissile(0,frmAvailableVehicle.wList,frmSummaryMissile.missile);
//    2: dmTTT.getAllTorpedo(0,frmAvailableVehicle.wList,frmSummaryTorpedo.torpedo);
//  end;

//  frmAvailableVehicle.cbbFilterWeaponType.ItemIndex := cbbFilterWeaponType.ItemIndex;
end;

procedure TfVehicleSelect.btn1Click(Sender: TObject);
begin
  getSensor;
  fSensor.ShowModal;
end;

procedure TfVehicleSelect.btn2Click(Sender: TObject);
begin
  getWeapon;
  fWeaponDoubleList.ShowModal;
end;

procedure TfVehicleSelect.btn3Click(Sender: TObject);
begin
  if edtFilterEmbarkedPlatform.Text = '[None]' then
     fEmbarkedSelect.vId := '';

  id_embFilter := fEmbarkedSelect.vId;
  fEmbarkedSelect.id_form := fromFilter;
  fEmbarkedSelect.ShowModal;
end;

procedure TfVehicleSelect.btnAddClick(Sender: TObject);

begin
  if id_form = fromRuntime then
  begin
    if lbAllVehicle.ItemIndex <> -1 then
    begin

      platform_library_entry := TPlatform_Library_Entry.Create;
      with platform_library_entry.FData do
      begin
//        Library_Index := frmSummaryRuntimePlatform.platform_library_index;
        Platform_Type := 1;
        Vehicle_Index := StrToInt(lbTempIdAll.Items[lbAllVehicle.ItemIndex]);

        dmTTT.InsertPlatform_Library_Entry(platform_library_entry);
      end;


      showRuntimeVehicle;
    end;
  end
  else if (id_form = fromPattern) or (id_form = fromFilter) then
  begin
    if lbAllVehicle.ItemIndex <> -1 then
    begin
      vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];

      showVehicleSelect;
    end;
  end
  else if id_form = fromVehicle then
  begin
    fInputName.show_from := fromVehicle;
    fInputName.ShowModal;
  end
  else if id_form <> fromVehicle then
  begin
    vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
    name_vId  := '';
    pi_ID     := '';
    fInputName.edtTrackId.Text  := 'NULL';
    frmSummaryResourceAllocation.ra_index := 1;
    fInputName.edtQuantity.Hide;
    fInputName.lbl3.Hide;
    fInputName.show_from := 0;
    fInputName.ownInc := fInputName.ownInc + 1;
    fInputName.ShowModal;
  end;

end;

procedure TfVehicleSelect.btnCloseClick(Sender: TObject);
begin
//  frmAvailableVehicle.edtFilterEmbarkedPlatform.Text := '[None]';
  Close;
//  btnEdit.Enabled := false;
//  btnCopy.Enabled := false;
  btnAdd.Enabled := false;
  btnUsage.Enabled := false;
  btnEditTrack.Enabled := false;
  btnRemove.Enabled := false;
//  if id_form = fromPattern then
//    vId := IntToStr(frmSummaryPredefinedPattern.vehicle.FData.Vehicle_Index)
//  else if id_form = fromFilter then
//    vId := frmAvailableVehicle.id_embFilter;
end;

procedure TfVehicleSelect.btnCopyClick(Sender: TObject);
begin
  if lbAllVehicle.ItemIndex <> -1 then
  begin
    vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
    dmTTT.GetVehicle_Definition(StrToInt(lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex]),vehicle);
    with frmSummaryVehicle do begin
      edtClass.Text     := 'Copy Of ' + lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
      vehicle_ra        := True;
//      frmAvailableVehicle.id_vehicle := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
//      dmTTT.GetVehicle_Definition(StrToInt(frmAvailableVehicle.id_vehicle), frmSummaryVehicle.vehicle);
//      frmAvailableVehicle.getDataVehicle;
//      isNew             := True;
//      isCopy            := True;
      ShowModal;
    end;

  end;
end;

procedure TfVehicleSelect.btnEditClick(Sender: TObject);
begin
  if lbAllVehicle.ItemIndex <> -1 then
  begin
    vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
    with frmSummaryVehicle do begin
//      isCopy := False;
//      isNew             := False;
//      edtClass.Text     := lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
      vehicle_ra        := True;
//      frmAvailableVehicle.id_vehicle := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
//      dmTTT.GetVehicle_Definition(StrToInt(frmAvailableVehicle.id_vehicle), frmSummaryVehicle.vehicle);
//      fVehiclePicklistFilter.Vehicle_Def;
//      frmAvailableVehicle.getDataVehicle;

//      vehicle_id        := StrToInt(vId);
//      EnableButton;
      ShowModal;
    end;
  end;
end;

procedure TfVehicleSelect.btnEditTrackClick(Sender: TObject);
var
  I : Integer;
  aPlatIns :TPlatform_Instance;

begin
  if lbRAVehicle.ItemIndex <> -1 then
  begin
    if id_form = fromVehicle then
    begin
      vId := IntToStr(TPlatform_Instance(selVecList[lbRAVehicle.ItemIndex]).FData.Vehicle_Index);
      name_vId  := lbRAVehicle.Items.Strings[lbRAVehicle.ItemIndex];
      pi_ID     := lbTempIdSel.Items.Strings[lbRAVehicle.ItemIndex];
      fInputName.edtTrackId.Text  := TPlatform_Instance(selVecList[lbRAVehicle.ItemIndex]).FData.Track_ID;
      frmSummaryResourceAllocation.ra_index  := 1;
      fInputName.edtQuantity.Hide;
      fInputName.lbl3.Hide;
      fInputName.ShowModal;
    end
    else if id_form = fromRA then
    begin
      {Prince: }
      for I := 0 to fInputName.PlatformVecList.Count - 1 do
      begin
        aPlatIns := TPlatform_Instance(fInputName.PlatformVecList.Items[i]);
        if lbRAVehicle.Items.Strings[lbRAVehicle.ItemIndex] = aPlatIns.FData.Instance_Name then
        begin
          vId := IntToStr(aPlatIns.FData.Vehicle_Index);
          name_vId  := lbRAVehicle.Items.Strings[lbRAVehicle.ItemIndex];
          pi_ID     := lbTempIdSel.Items.Strings[lbRAVehicle.ItemIndex];
          fInputName.edtTrackId.Text  := TPlatform_Instance(aPlatIns).FData.Track_ID;
          frmSummaryResourceAllocation.ra_index  := 1;
          fInputName.edtQuantity.Hide;
          fInputName.lbl3.Hide;
          fInputName.ShowModal;
          break;
        end;
      end;

//      vId := IntToStr(TPlatform_Instance(fInputName.PlatformVecList[lbRAVehicle.ItemIndex]).FData.Vehicle_Index);
//      name_vId  := lbRAVehicle.Items.Strings[lbRAVehicle.ItemIndex];
//      pi_ID     := lbTempIdSel.Items.Strings[lbRAVehicle.ItemIndex];
//      fInputName.edtTrackId.Text  := TPlatform_Instance(fInputName.PlatformVecList[lbRAVehicle.ItemIndex]).FData.Track_ID;
//      ResourceAllocationForm.ra_index  := 1;
//      fInputName.edtQuantity.Hide;
//      fInputName.lbl3.Hide;
//      fInputName.ShowModal;
    end
    else begin
      vId := lbTempIdSel.Items.Strings[lbRAVehicle.ItemIndex];
      with frmSummaryVehicle do begin
        edtClass.Text     := lbRAVehicle.Items.Strings[lbRAVehicle.ItemIndex];
        vehicle_ra        := True;
//        frmAvailableVehicle.Vehicle_Def;
//        isNew             := False;
        ShowModal;
      end;
    end;
  end
  else
    ShowMessage('Select List first');
end;

procedure TfVehicleSelect.btnFilterClick(Sender: TObject);
begin
   if btnFilter.Caption = '>> Filter' then
   begin
    btnFilter.Caption := '<< Filter';
    fVehicleSelect.Height := 743;
   end
   else if btnFilter.Caption = '<< Filter' then
   begin
     btnFilter.Caption := '>> Filter';
     fVehicleSelect.Height := 435;
   end;
end;

procedure TfVehicleSelect.btnNewClick(Sender: TObject);
var
  i : Integer;
begin
  with frmSummaryVehicle do begin
//    isNew := true;
    lbRAVehicle.Items.Clear;
    lbTempIdSel.Items.Clear;

    pgc.Pages[0].Show;
    edtClass.Clear;
//    edtName.Clear;
    edtMotionCharacterictic.Clear;

//    cbbCategory.Items.Clear;
//    cbbType.Items.Clear;
//    cbxFontRadar.Items.Clear;
//    cbxSideRadar.Items.Clear;

//    cbxNavigation.Checked := False;
//    cbxBarrier.Checked := False;
//    cbxHFLink.Checked := False;
//    cbxUHFLink.Checked := False;
//    cbxHFVoice.Checked := False;
//    cbxUHFVoice.Checked := False;
//    cbxSatcom.Checked := False;
//    cbxUnderwater.Checked := False;
//    cbxHFMessageHandling.Checked := False;
//    cbxUHFMessageHandling.Checked := False;
//    cbxSATCOMMessageHAndling.Checked := False;
//    cbxSonobuoyCapable.Checked  := False;
//
//    lstName.Items.Clear;
//    lbNameId.Items.Clear;

//    redtNotes.Clear;

    btnRadar.Enabled    := False;
    btnMAD.Enabled      := False;
    btnESM.Enabled      := False;
    btnSonar.Enabled    := False;
    btnElectroOpticalDetector.Enabled    := False;
    btnIFF.Enabled      := False;
    btnVisualDetector.Enabled    := False;
    btnSonobuoy.Enabled          := False;
    btnMissiles.Enabled          := False;
    btnTorpedos.Enabled          := False;
    btnGuns.Enabled              := False;
    btnMines.Enabled             := False;
    btnBomb_DepthCharges.Enabled := False;
    btnRadarJummer.Enabled       := False;
    btnAirBubble.Enabled         := False;
    btnTowedJummer_Decoy.Enabled := False;
    btnFloatingDecoy.Enabled     := False;
    btnChaff.Enabled             := False;
    btnInfraredDecoy.Enabled     := False;
    btnEmbarkedPlatforms.Enabled := False;
    btnAccousticDecoy.Enabled    := False;
    btnDefensiveJummer.Enabled   := False;


    //=============General===============================
    //tsGeneral
//    for I := PIList.Count - 1 downto 0 do
//    begin
//      PIList.Delete(i);
//    end;

    pgc.Pages[0].Show;

    edtClass.Text                         := '[None]';
//    edtName.Text                          := '';
//    PIList.Clear;
//    lbNameId.Clear;
//    cbbDomain.ItemIndex := 0;
//    cbbCategory.ItemIndex := 0;
//    cbbType.ItemIndex := 0;
//    cbbDetectabilityType.ItemIndex := 0;
//    edtQuantityGroupPersonal.Text         := '0';
//    edtAntennaHeight.Text                 := '0';
//    edtAntennaAboveWater.Text             := '0';
//    edtMaxCom.Text                        := '0';
//    edtDamage.Text                        := '0';
//    trckbDamage.Position := 0;

    //================Physical===========================
    edtLengthDimension.Text               := '0';
    edtWidthDimension.Text                := '0';
    edtHeightDimension.Text               := '0';
    edtEngagementRangeDimension.Text      := '0';
    edtDraftDimension.Text                := '0';

//    id_motion := 605;

    edtMotionCharacterictic.Text := '[None]';
//    if dmTTT.GetMotion_Characteristics(id_motion,frmSummaryMotion.motionCharacteristic) then
//    begin
//      edtMotionCharacterictic.Text := frmSummaryMotion.motionCharacteristic.FData.Motion_Identifier;
//    end;

//    cbbGangwayPosition.ItemIndex := 0;

    edtFrontRadarPhysical.Text            := '0';
    edtSideRadarPhysical.Text             := '0';
    edtFrontAcousticPhysical.Text         := '0';
//    edtFrontSidePhysical.Text             := '0';
    edtFrontVisualPhysical.Text           := '0';
    edtSideVisualPhysical.Text            := '0';
    edtFrontInfraredPhysical.Text         := '0';
    edtSideInfraredPhysical.Text          := '0';
//    edtFontRadar.Text                     := '0';
    edtSideRadar.Text                     := '0';
    edtMagneticPhysical.Text              := '0';
    edtMinSpeedAcousticPhysical.Text      := '0';
    edtBelowCavitationAcousticPhysical.Text := '0';
    edtAboveCavitationAcousticPhysical.Text := '0';
    edtMaxSpeedAcousticPhysical.Text        := '0';
    edtCavitationSpeedAcousticPhysical.Text := '0';

    //======================Characteristic==============
    edtMaxDropAltitude.Text                 := '0';
    edtMinDropAltitude.Text                 := '0';
    edtMaxDropSpeed.Text                    := '0';
    edtHullMounted.Text                     := '0';
    edtTowedArray.Text                      := '0';
    edtMaxNumbToMOnitor.Text                := '0';
    edtMaxDeployAltitude.Text               := '0';
    edtMinDeployAltitude.Text               := '0';
    edtMaxDeploySpeed.Text                  := '0';
    edtFontID.Text                          := '247';
    cbbFontType.ItemIndex := 0;
    lblFontTaktis.Font.Name := 'TAKTIS_AL';
    lblFontTaktis.Font.Size := 30;
    lblFontTaktis.Font.Style := [fsBold];
    lblFontTaktis.Caption := Char(59);
    lblKeteranganSymbol.Caption := 'Kapal Perusak Kawal (PK).';
    edtSymbolID.Text                        := '0';
    edtVBSClassName.Text                    := '';
    //edtTacticalSymbol.Text                  := '';
    //======================POH Modifier================
    edtAntiRadiationMissile.Text            := '0';
    edtInfraredHomingMissile.Text           := '0';
    edtSemiActiveMissile.Text               := '0';
    edtTerminalActiveMissile.Text           := '0';
    edtActiveAcousticTorpedo.Text           := '0';
    edtPassiveAcousticTorpedo.Text          := '0';
    edtActivePassiveAcousticTorpedo.Text    := '0';
    edtWakeHomingTorpedo.Text               := '0';
    edtWireGuidedTorpedo.Text               := '0';
    edtAcousticMine.Text                    := '0';
    edtImpactMine.Text                      := '0';
    edtMagneticMine.Text                    := '0';
    edtPressureMine.Text                    := '0';

//    TrackBarAntiRadiationMissile.Position            := 0;
//    TrackBarInfraredHomingMissile.Position           := 0;
//    TrackBarSemiActiveMissile.Position               := 0;
//    TrackBarTerminalActiveMissile.Position           := 0;
//    TrackBarActiveAcousticTorpedo.Position           := 0;
//    TrackBarPassiveAcousticTorpedo.Position          := 0;
//    TrackBarActivePassiveAcousticTorpedo.Position    := 0;
//    TrackBarWakeHomingTorpedo.Position               := 0;
//    TrackBarWireGuidedTorpedo.Position               := 0;
//    TrackBarAcousticMine.Position                    := 0;
//    TrackBarImpactMine.Position                      := 0;
//    TrackBarMagneticMine.Position                    := 0;
//    TrackBarPressureMine.Position                    := 0;

    //======================Assets============================
    edtRefuelTime.Text                      := '0';
    edtLaunchAlertTime.Text                 := '0';

//    id_DefaultLogistics := 26;// default Empty
    edtDefaultLogistics.Text := '[None]';
//    if dmTTT.GetDefault_Logistics(id_DefaultLogistics, frmSummaryLogistic.LogisticsData) then
//    begin
//      edtDefaultLogistics.Text := frmSummaryLogistic.LogisticsData.FData.Logistics_Identifier;
//    end;

//    id_PlatformCapability := 26;// default capability is Empty dng
    edtDefaultCarryingCap.Text := '[None]';
//    if dmTTT.getPlatform_Capability(id_PlatformCapability,frmSummaryTransport.CapabilityData) then
//    begin
//      edtDefaultCarryingCap.Text := frmSummaryTransport.CapabilityData.FData.Transport_Identifier;
//    end;

//    iList    := TList.Create;
//    PIList   := TList.Create;
//    embarkedList := TList.Create;
//    //==============SENSOR============//
//    radarList:= TList.Create;
//    MADList  := TList.Create;
//    ESMList  := TList.Create;
//    SNRList  := TList.Create;
//    EOList   := TList.Create;
//    IFFList  :=  TList.Create;
//    VISList  :=  TList.Create;
//    SONOList :=  TList.Create;
//    //==========WEAPON================//
//    MISSLList  :=  TList.Create;
//    GUNList    :=  TList.Create;
//    TORPList   :=  TList.Create;
//    BOMList    :=  TList.Create;
//    MINEList   :=  TList.Create;
//    //========Countermessure=========//
//    RadarJamList :=  TList.Create;
//    AirBubList   :=  TList.Create;
//    AcoustDecList:=  TList.Create;
//    DefJamList   :=  TList.Create;
//    TowedJamList :=  TList.Create;
//    FloatDecList :=  TList.Create;
//    ChaffList    :=  TList.Create;
//    InfraDecList :=  TList.Create;

    //=====================Periscope=========================
    edtMaxOperatPeriscope.Text              := '0';
    edtHighAbovePeriscope.Text              := '0';
//    edtFontInfrared.Text                    := '0';
//    edtSideInfrared.Text                    := '0';
//    edtFontVisual.Text                      := '0';
//    edtSideVisual.Text                      := '0';
//    edtFontRadar.Text                       := '0';
//    edtSideRadar.Text                       := '0';
//    cbxFontRadar.ItemIndex := 0;
//    cbxSideRadar.ItemIndex := 0;
//
//    //====================Note================================
//    redtNotes.Clear;

    ShowModal;
  end;
end;

procedure TfVehicleSelect.btnOkClick(Sender: TObject);
var i:integer;
    aPI : TPlatform_Instance;
begin
  if id_form = fromRuntime then
  begin
   { dmTTT.DeletePlatform_Library_Entry(0,fRuntimePlatform.platform_library_index,0);
    for I := 0 to selVecList.Count - 1 do
    begin
      platform_library_entry := TPlatform_Library_Entry.Create;

      with platform_library_entry.FData do
      begin
        Library_Index := fRuntimePlatform.platform_library_index;
        Platform_Type := 1;
        Vehicle_Index := TVehicle_Definition(selVecList[I]).FData.Vehicle_Index;

        dmTTT.InsertPlatform_Library_Entry(platform_library_entry);
      end;
    end;  }
  end
  else if id_form = fromPattern then
  begin
    if vId <> '' then
      frmSummaryPredefinedPattern.edt1.Text := lbRAVehicle.Items.Strings[0]
    else frmSummaryPredefinedPattern.edt1.Text := '[None]';
  end
  else if id_form = fromFilter then
  begin
//    if vId <> '' then
//      frmAvailableVehicle.edtFilterEmbarkedPlatform.Text := lbRAVehicle.Items.Strings[0]
//    else frmAvailableVehicle.edtFilterEmbarkedPlatform.Text := '[None]';
//    frmAvailableVehicle.chkEmbarkedClick(Sender);
  end
  else if id_form = fromRA then
  begin
//    for I := 0 to fInputName.PlatformVecList.Count - 1 do
//    begin
//      aPI := TPlatform_Instance(fInputName.PlatformVecList.Items[i]);
//
//      with fDBEditor.lvPlatform.Items.Add do
//      begin
//        Data := aPI;
//        Caption := aPI.FData.Instance_Name;
//      end;
//    end;

    frmAdminMainForm.saveResource;

  end;

  Close;

 {
  if fVehicleAttributeWindow.fromVehicle then
  begin
    for I := 0 to lbRAVehicle.Count - 1 do
    begin
      id_embarked := lbTempIdSel.Items.Strings[i];
      with hosted_plat.FData do begin
        if fVehiclePicklistFilter.id_vehicle <> '' then
          Vehicle_Index         := StrToInt(fVehiclePicklistFilter.id_vehicle)
        else if StrToInt(vId) <> 0 then
          Vehicle_Index         := StrToInt(vId)
        else
          Vehicle_Index         := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
        Hosted_Vehicle_Index  := StrToInt(id_embarked);
        if fInputName.edtQuantity.Text = '' then
          Quantity           := 0
        else
          Quantity              := StrToInt(fInputName.edtQuantity.Text);
      end;
      if fVehiclePicklistFilter.id_vehicle <> '' then
        id := fVehiclePicklistFilter.id_vehicle
      else if StrToInt(vId) <> 0 then
        id := vId
      else
        id := IntToStr(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index) ;
      if dmTTT.GetHosted_Platform (StrToInt(id),StrToInt(id_embarked),pList) <> -1 then
        dmTTT.insertHosted_Platform(hosted_plat);
    end;
    Close;
  end;   }
end;

procedure TfVehicleSelect.btnRemoveClick(Sender: TObject);
var
    warning, i, j, k, IndexDel: Integer;
begin

  if lbRAVehicle.ItemIndex <> -1 then
  begin
    warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);
    if warning = mrOk then
    begin
      {Prince : looping dan properties multiselectnya tak cendol dulu}
//      for k := 0 to lbRAVehicle.SelCount - 1 do
//      begin
        if id_form = fromRuntime then
        begin
//          dmTTT.DeletePlatform_Library_Entry(1,frmSummaryRuntimePlatform.platform_library_index,
          StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);

          showRuntimeVehicle;
        end
        else if (id_form = fromPattern) or (id_form = fromFilter) then
        begin
          vId := '';
          showVehicleSelect;
        end
        else if id_form = fromRA then
        begin
          if dmTTT.GetFormation_ByPlatform(lbTempIdSel.Items[lbRAVehicle.ItemIndex]) > 0 then
          begin
            warning := MessageDlg('This vehicle is being used in a formation.'+#13#10+'Are you sure you want to delete this item?'
                      ,mtConfirmation,mbOKCancel,0);
            if warning = mrOk then
            begin
  //              if dmTTT.GetCubicle_Group_Assignment(lbTempIdSel.Items[i]) > 0 then
  //              begin
  //                warning := MessageDlg('This vehicle is being used in a formation.'+#13#10+'Are you sure you want to delete this item?'
  //                          ,mtConfirmation,mbOKCancel,0);
  //              end;

              dmTTT.DeleteFormationDefinition_ByLeader(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);
              dmTTT.deleteFormation_AssignByPI_Index(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);

              for i := FormationEditorForm.FormationAssignmentList.Count - 1 downto 0 do
              begin
                if TFormation(FormationEditorForm.FormationAssignmentList.Items[i]).FForm_Assign.Platform_Instance_Index =
                   StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]) then
                begin
                  FormationEditorForm.FormationAssignmentList.Delete(i);
                end;
              end;

              for I := 0 to FormationEditorForm.FormationDefList.Count - 1 do
              begin
                if TFormation(FormationEditorForm.FormationDefList.Items[i]).FFormation_Def.Formation_Leader =
                   StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]) then
                begin
                  for j := FormationEditorForm.FormationAssignmentList.Count - 1 downto 0 do        //hapus semua member
                  begin
                    if TFormation(FormationEditorForm.FormationAssignmentList.Items[j]).FForm_Assign.Formation_Index =
                       TFormation(FormationEditorForm.FormationDefList.Items[i]).FFormation_Def.Formation_Index then
                    begin
                      FormationEditorForm.FormationAssignmentList.Delete(j);
                    end;
                  end;

                  FormationEditorForm.FormationDefList.Delete(i);                                     //hapus formation definition
                  Break;
                end;
              end;

              {dmTTT.DeleteCubicle_Group_Assignment(StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]));
              dmTTT.deletePlatform_ActivationByIndex(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);
              dmTTT.deletePlatformInstance(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);}


              dmTTT.DeleteCubicle_Group_Assignment(StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex])); {delete untuk yang sudah ada di database}
//              for I := 0 to frmGroupMemberSelection.CubGroupAssignmentList.Count - 1 do   {delete untuk yang ada di list}
//              begin
//                if TCubicle_Group_Assignment(frmGroupMemberSelection.CubGroupAssignmentList.Items[i]).FCubicle.Platform_Instance_Index =
//                     StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]) then
//                begin
////                  fGroupMemberSelection.CubGroupAssignmentList.Delete(i);
//                  Break;
//                end
//              end;

              dmTTT.deletePlatform_ActivationByIndex(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);
//              for I := 0 to fPlatformDeploytment.List.Count - 1 do
//              begin
//                if TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FData.Platform_Instance_Index =
//                   StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]) then
//                begin
//                  fPlatformDeploytment.List.Delete(i);
//                  frmAdminMainForm.Map1.Repaint;
//                  Break;
//                end;
//              end;

//              dmTTT.deletePlatformInstance(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);
              for I := 0 to fInputName.PlatformVecList.Count - 1 do
              begin
                if TPlatform_Instance(fInputName.PlatformVecList.Items[i]).FData.Platform_Instance_Index =
                   StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]) then
                begin
                  fInputName.PlatformVecList.Delete(i);
                  Break;
                end;
              end;

              dmTTT.deletePlatformLogistics(StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]));// delete platform logisticnya juga
//              for I := 0 to frmSummaryLogistic.LogisticsList.Count - 1 do
//              begin
//                if TLogistics(frmSummaryLogistic.LogisticsList.Items[i]).FPlatformLogistics.Platform_Instance_Index =
//                   StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]) then
//                begin
//                  frmSummaryLogistic.LogisticsList.Delete(i);
//                  Break;
//                end;
//              end;

            end;
          end
          else begin
            {dmTTT.DeleteFormationDefinition_ByLeader(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);
            dmTTT.deleteFormation_AssignByPI_Index(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);
            dmTTT.DeleteCubicle_Group_Assignment(StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]));
            dmTTT.deletePlatform_ActivationByIndex(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);
            dmTTT.deletePlatformInstance(lbTempIdSel.Items[lbRAVehicle.ItemIndex]); }

              dmTTT.DeleteFormationDefinition_ByLeader(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);
              dmTTT.deleteFormation_AssignByPI_Index(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);

              {dmTTT.DeleteCubicle_Group_Assignment(StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]));
              dmTTT.deletePlatform_ActivationByIndex(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);
              dmTTT.deletePlatformInstance(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);}

              if not frmAdminMainForm.isNew then
                dmTTT.DeleteCubicle_Group_Assignment(StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex])); {delete untuk yang sudah ada di database}

//              for I := 0 to frmGroupMemberSelection.CubGroupAssignmentList.Count - 1 do   {delete untuk yang ada di list}
//              begin
//                if TCubicle_Group_Assignment(frmGroupMemberSelection.CubGroupAssignmentList.Items[i]).FCubicle.Platform_Instance_Index =
//                     StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]) then
//                begin
//                  frmGroupMemberSelection.CubGroupAssignmentList.Delete(i);
//                  Break;
//                end
//              end;

              if not frmAdminMainForm.isNew then
                dmTTT.deletePlatform_ActivationByIndex(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);

//              for I := 0 to fPlatformDeploytment.List.Count - 1 do
//              begin
//                if TSymbolsProp(fPlatformDeploytment.List[I]).Fplatform.FData.Platform_Instance_Index =
//                   StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]) then
//                begin
//                  fPlatformDeploytment.List.Delete(i);
//                  frmAdminMainForm.Map1.Repaint;
//                  Break;
//                end;
//              end;

//              if not frmAdminMainForm.isNew then
//               dmTTT.deletePlatformInstance(lbTempIdSel.Items[lbRAVehicle.ItemIndex]);

//              for I := 0 to fInputName.PlatformVecList.Count - 1 do
//              begin
//                if TPlatform_Instance(fInputName.PlatformVecList.Items[i]).FData.Platform_Instance_Index =
//                   StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]) then
//                begin
//                  fInputName.PlatformVecList.Delete(i);
//                  Break;
//                end;
//              end;

              dmTTT.deletePlatformLogistics(StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]));// delete platform logisticnya juga
//              for I := 0 to frmSummaryLogistic.LogisticsList.Count - 1 do
//              begin
//                if TLogistics(frmSummaryLogistic.LogisticsList.Items[i]).FPlatformLogistics.Platform_Instance_Index =
//                   StrToInt(lbTempIdSel.Items[lbRAVehicle.ItemIndex]) then
//                begin
//                  frmSummaryLogistic.LogisticsList.Delete(i);
//                  Break;
//                end;
//              end;

          end;
//        end;
        getAllVehicle;
      end;
    end;
  end
  else
    ShowMessage('Select List first');
end;

procedure TfVehicleSelect.btnUsageClick(Sender: TObject);
begin
  if lbRAVehicle.ItemIndex <> -1 then begin
    if id_form <> fromRuntime then
    begin
      with frmUsage do begin
//        UId := TPlatform_Instance(pList[lbRAVehicle.ItemIndex]).FData.Vehicle_Index;
        UId := TPlatform_Instance(fInputName.PlatformVecList[lbRAVehicle.ItemIndex]).FData.Vehicle_Index;
        name_usage  := lbRAVehicle.Items.Strings[lbRAVehicle.ItemIndex];
        UIndex  := 25;
        usage_title := 'Scenario:';
        ShowModal;
      end;
    end;
  end;
end;

procedure TfVehicleSelect.cbbFilterDomainChange(Sender: TObject);
begin
  domainBehav;
  if chkDomain.Checked = true then
    chkDomainClick(Sender);
end;

procedure TfVehicleSelect.cbbFilterSensorTypeChange(Sender: TObject);
begin
  edtFiltersensorOnBoard.Text := '[None]';
  fSensor.lbsensorSel.Clear;
  Filter;
end;

procedure TfVehicleSelect.cbbFilterTypeChange(Sender: TObject);
begin
  if chkType.Checked = true then
    chkDomainClick(Sender);
end;

procedure TfVehicleSelect.cbbFilterWeaponTypeChange(Sender: TObject);
begin
  edtFilterWeaponOnBoar.Text := '[None]';
  fWeaponDoubleList.lbWeaponSel.Clear;
  Filter;
end;

procedure TfVehicleSelect.chkDomainClick(Sender: TObject);
begin
  Filter;
end;

procedure TfVehicleSelect.chkNegaraClick(Sender: TObject);
begin
  Filter;
end;

procedure TfVehicleSelect.FormCreate(Sender: TObject);
begin
  platform_identifier := TPlatform_Instance_Identifier.Create;
  platform_instance   := TPlatform_Instance.Create;
  platform_activation := TPlatform_Activation.Create;
  vehicle             := TVehicle_Definition.Create;
  hosted_plat         := THosted_Platform.Create;
  allVecList          := TList.Create;
  selVecList          := TList.Create;
  vList               := TList.Create;
  sList := TList.Create;
  wList := TList.Create;
end;

procedure TfVehicleSelect.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    mbLeft: begin
        if (ssShift in Shift) then begin
          chkNegara.Visible := not chkNegara.Visible ;
        end;
      end;
  end;
end;

procedure TfVehicleSelect.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
if GetKeyState(VK_ESCAPE)< 0 then
  begin
    case Msg.CharCode of
     VK_ESCAPE:
     begin
       btnOk.Click;
     end;
    end;
  end;
end;

procedure TfVehicleSelect.FormShow(Sender: TObject);
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
  Height := 435;
  domainBehav;




//  btnUsage.Enabled := True;
//  btnEditTrack.Enabled := True;

  case id_form of
    fromRuntime:
    begin
      btnUsage.Enabled := False;
      btnEditTrack.Enabled := False;
    end;
  end;

  getAllVehicle;
end;

procedure TfVehicleSelect.getAllVehicle;
begin
  allVecList.Clear;

  uSimDBEditor.getAllVehicles(allVecList,0,vehicle);

  if id_form = fromRuntime then
    begin
      selVecList.Clear;
//      dmTTT.getVehicleByLibrary(frmSummaryRuntimePlatform.platform_library_index, selVecList);

      showRuntimeVehicle;
    end
  else if id_form = fromRA then
    begin
      selVecList.Clear;
      if frmAvailableResourceAllocation.RA_id <> '' then
        uSimDBEditor.getRAvehicle(0,StrToInt(frmAvailableResourceAllocation.RA_id),selVecList,frmSummaryResourceAllocation.force,-1)
      else begin
        uSimDBEditor.getRAvehicle(0,frmSummaryResourceAllocation.ra.FData.Resource_Alloc_Index,selVecList,
                        frmSummaryResourceAllocation.force,-1)
      end;
      showRA;
    end
  else getVehicleSelect;
end;

procedure TfVehicleSelect.showRuntimeVehicle;
var
  I,J,k, count : Integer;
  id_v,id_vsel : Integer;
  isVsel : Boolean;
begin
  lbRAVehicle.Clear;
  lbTempIdAll.Clear;
  lbTempIdSel.Clear;
  lbAllVehicle.Clear;
  vList.Clear;

//  dmTTT.getVehicleByLibrary(frmSummaryRuntimePlatform.platform_library_index, selVecList);
  for I := 0 to selVecList.Count - 1 do
  begin
    lbRAVehicle.Items.Add(TVehicle_Definition(selVecList[i]).FData.Vehicle_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TVehicle_Definition(selVecList[i]).FData.Vehicle_Index));
  end;

  allVecList.Clear;
  uSimDBEditor.getAllVehicles(allVecList,0,vehicle);

  count := 0;
  for I := 0 to allVecList.Count - 1 do
  begin
    for k := 0 to selVecList.Count - 1 do
    begin
      if TVehicle_Definition(allVecList[i]).FData.Vehicle_Index <> TVehicle_Definition(selVecList[k]).FData.Vehicle_Index then
      count := count + 1;
    end;
    if count = selVecList.Count then
    begin
      lbAllVehicle.Items.Add(TVehicle_Definition(allVecList[i]).FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TVehicle_Definition(allVecList[i]).FData.Vehicle_Index));
    end;
    count := 0;
  end;

  //====

{  for I := 0 to allVecList.Count - 1 do
  begin
    id_v := TVehicle_Definition(allVecList[I]).FData.Vehicle_Index;
    isVsel := False;
    for J := 0 to selVecList.Count - 1 do
    begin
      id_vsel := TVehicle_Definition(selVecList[J]).FData.Vehicle_Index;
      if id_v = id_vsel then
      begin
        lbRAVehicle.Items.Add(TVehicle_Definition(allVecList[I]).FData.Vehicle_Identifier);
        lbTempIdSel.Items.Add(IntToStr(TVehicle_Definition(allVecList[I]).FData.Vehicle_Index));
        isVsel := True;
        Break;
      end;
    end;
    if not isVsel then
    begin
      vList.Add(TVehicle_Definition(allVecList[I]));
      lbAllVehicle.Items.Add(TVehicle_Definition(allVecList[i]).FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TVehicle_Definition(allVecList[i]).FData.Vehicle_Index));
    end;
  end;  }
end;

procedure TfVehicleSelect.showRA;
var
  I,J : Integer;
begin
  lbRAVehicle.Clear;
  lbTempIdSel.Clear;

//  lbTempIdAll.Clear;
//  lbAllVehicle.Clear;
  vList.Clear;

 { for I := 0 to allVecList.Count - 1 do    //dicendol, ikut yang proses filter aja, andik
  begin
    vList.Add(TVehicle_Definition(allVecList[I]));
    lbAllVehicle.Items.Add(TVehicle_Definition(allVecList[i]).FData.Vehicle_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TVehicle_Definition(allVecList[i]).FData.Vehicle_Index));
  end;  }

//  for J := 0 to selVecList.Count - 1 do
//  begin
//    lbRAVehicle.Items.Add(TPlatform_Instance(selVecList[J]).FData.Instance_Name);
//    lbTempIdSel.Items.Add(IntToStr(TPlatform_Instance(selVecList[J]).FData.Platform_Instance_Index));
//  end;


  for I := 0 to fInputName.PlatformVecList.Count - 1 do
  begin
    if (frmSummaryResourceAllocation.force = TPlatform_Instance(fInputName.PlatformVecList[i]).FData.Force_Designation) then
    begin
      lbRAVehicle.Items.Add(TPlatform_Instance(fInputName.PlatformVecList[i]).FData.Instance_Name);
      lbTempIdSel.Items.Add(IntToStr(TPlatform_Instance(fInputName.PlatformVecList[i]).FData.Platform_Instance_Index));
    end;
  end;

  Filter;

end;

procedure TfVehicleSelect.getVehicleSelect;
begin
  case id_form of
    fromPattern: showVehicleSelect;
    fromFilter: showVehicleSelect;
  end;
end;

procedure TfVehicleSelect.showVehicleSelect;
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


  //////////////////////////////////

 { if not fromFilter then
    lbRAVehicle.Items.Clear;
  lbTempIdSel.Items.Clear;
  pList.Clear;

 if fVehicleAttributeWindow.fromVehicle then
 begin
   if fVehiclePicklistFilter.id_vehicle <> '' then
     id := fVehiclePicklistFilter.id_vehicle
   else
     id := vId;
   dmTTT.GetHosted_Platform(StrToInt(id),0,pList);
 end;

 if fVehicleAttributeWindow.fromVehicle then
 begin
   for I := 0 to pList.Count - 1 do
   begin
      lbRAVehicle.Items.Add(THosted_Platform(pList[i]).FVehicle.Vehicle_Identifier);
      lbTempIdSel.Items.Add(IntToStr(THosted_Platform(pList[i]).FData.Slave_Index));
   end;
 end
 else
 begin
   if pList.Count = 0  then
   begin
     lbRAVehicle.Clear;
     lbTempIdSel.Clear;
   end
   else
   begin
     for I := 0 to pList.Count - 1 do
     begin
        lbRAVehicle.Items.Add(TPlatform_Instance(pList[i]).FData.Instance_Name);
        lbTempIdSel.Items.Add(IntToStr(TPlatform_Instance(pList[i]).FData.Platform_Instance_Index));
     end;
   end;
 end;    }
end;

procedure TfVehicleSelect.lbAllVehicleClick(Sender: TObject);
begin
  if lbAllVehicle.ItemIndex <> -1 then
  begin
   { btnCopy.Enabled := true;
    btnEdit.Enabled := true; }
    btnAdd.Enabled := true;
  end;
end;

procedure TfVehicleSelect.lbAllVehicleDblClick(Sender: TObject);
begin
  btnAdd.Click;
end;

procedure TfVehicleSelect.lbRAVehicleClick(Sender: TObject);
begin
  if lbRAVehicle.ItemIndex <> -1 then
  begin
    btnRemove.Enabled := true;
    btnEditTrack.Enabled  := true;
//    btnUsage.Enabled  := true;
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

