unit uVehicleSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject, newClassASTT, uDBAsset_Vehicle,
  uDBAsset_Runtime_Platform_Library;

type
  TfVehicleSelect = class(TForm)
    lbRAVehicle: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
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
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure getRAVehicle;
    procedure getRuntimeVehicle;
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
    procedure chkTypeClick(Sender: TObject);
    procedure chkSensorClick(Sender: TObject);
    procedure chkWeaponClick(Sender: TObject);
    procedure btnEditTrackClick(Sender: TObject);
    procedure chkEmbarkedClick(Sender: TObject);

  private
    { Private declarations }
    platform_activation : TPlatform_Activation;
    vehicle             : TVehicle_Definition;


  public
  vId   : string;
  vehicle_ra  :boolean;
  platform_identifier : TPlatform_Instance_Identifier;
  platform_instance   : TPlatform_Instance;
  hosted_plat         : THosted_Platform;
  fromRuntime         : boolean;
  platform_library_entry : TPlatform_Library_Entry;
    { Public declarations }
  end;

var
  fVehicleSelect: TfVehicleSelect;
  pList,vList   :TList;
  id_embarked   : string;

implementation

uses uSimDBEditor,uDBAsset_GameEnvironment,uResourceAllocation,
uDataModuleTTT, uResurceAllocationSelect,uRAList,uInputName,uVehiclePickListFilter,
uVehicleAttributeWindow, uRuntimePlatform, uPredefinedPattern;

{$R *.dfm}


procedure TfVehicleSelect.btnAddClick(Sender: TObject);
begin
  if fromRuntime then
  begin
    platform_library_entry := TPlatform_Library_Entry.Create;
    with platform_library_entry.FData do
    begin
      Library_Index := fRuntimePlatform.platform_library_index;
      Platform_Type := 1;
      Vehicle_Index := StrToInt(lbTempIdAll.Items[lbAllVehicle.ItemIndex]);
      dmTTT.InsertPlatform_Library_Entry(platform_library_entry);

      lbRAVehicle.Items.Add(lbAllVehicle.Items[lbAllVehicle.ItemIndex]);
      lbTempIdSel.Items.Add(lbTempIdAll.Items[lbAllVehicle.ItemIndex]);
    end;
  end
  else if fVehicleAttributeWindow.fromVehicle then
  begin
    fInputName.Show;
  end
  else if fPredefinedPattern.fromPattern or fVehiclePicklistFilter.forEmbarked then
  begin
    lbRAVehicle.Items.Add(lbAllVehicle.Items[lbAllVehicle.ItemIndex]);
    lbTempIdSel.Items.Add(lbTempIdAll.Items[lbAllVehicle.ItemIndex]);

  end
  else if fVehicleAttributeWindow.fromVehicle = False then
  begin
    vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
    ResourceAllocationForm.ra_index  := 1;
    fInputName.edtQuantity.Hide;
    fInputName.lbl3.Hide;
    fInputName.Show;
  end;

end;

procedure TfVehicleSelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfVehicleSelect.btnCopyClick(Sender: TObject);
begin
  if lbAllVehicle.ItemIndex <> -1 then
  begin
    vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
    dmTTT.GetVehicle_Definition(StrToInt(lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex]),vehicle);
    with fVehicleAttributeWindow do begin
      edtClass.Text     := 'Copy Of ' + lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
      vehicle_ra        := True;
      fVehiclePicklistFilter.Vehicle_Def;
      isNew             := False;
      Show;
    end;

    Close;
  end;


  vehicle.FData.Vehicle_Identifier := 'Copy Of ' + lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
  //dmTTT.insertVehicle_Def(vehicle);

  //getRAVehicle;
end;

procedure TfVehicleSelect.btnEditClick(Sender: TObject);
begin
  if lbAllVehicle.ItemIndex <> -1 then
  begin
    vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
    with fVehicleAttributeWindow do begin
      edtClass.Text     := lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
      vehicle_ra        := True;
      fVehiclePicklistFilter.Vehicle_Def;
      isNew             := False;
      Show;
    end;

    Close;
  end;
end;

procedure TfVehicleSelect.btnEditTrackClick(Sender: TObject);
begin
  if lbRAVehicle.ItemIndex <> -1 then
  begin
    vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
    with fVehicleAttributeWindow do begin
      edtClass.Text     := lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
      vehicle_ra        := True;
      fVehiclePicklistFilter.Vehicle_Def;
      isNew             := False;
      Show;
    end;

    Close;
  end;
end;

procedure TfVehicleSelect.btnFilterClick(Sender: TObject);
begin
   if btnFilter.Caption = '>> Filter' then
   begin
    btnFilter.Caption := '<< Filter';
    fVehicleSelect.Height := 700;
   end
   else if btnFilter.Caption = '<< Filter' then
   begin
     btnFilter.Caption := '>> Filter';
     fVehicleSelect.Height := 440;
   end;
end;

procedure TfVehicleSelect.btnNewClick(Sender: TObject);
begin
  with fVehicleAttributeWindow do begin
    isNew := true;
    lbRAVehicle.Items.Clear;
    lbTempIdSel.Items.Clear;
    edtClass.Text                         := '';
    edtName.Text                          := '';
    edtAntennaHeight.Text                 := '';
    edtAntennaAboveWater.Text             := '';
    edtMaxCom.Text                        := '';
    edtDamage.Text                        := '';
    edtLengthDimension.Text               := '';
    edtWidthDimension.Text                := '';
    edtHeightDimension.Text               := '';
    edtEngagementRangeDimension.Text      := '';
    edtDraftDimension.Text                := '';
    edtMotionCharacterictic.Text          := '';
    edtFrontRadarPhysical.Text            := '';
    edtSideRadarPhysical.Text             := '';
    edtFrontAcousticPhysical.Text         := '';
    edtFrontVisualPhysical.Text                := '';
    edtSideVisualPhysical.Text            := '';
    edtFrontInfraredPhysical.Text         := '';
    edtSideInfraredPhysical.Text          := '';
    edtFontRadar.Text                     := '';
    edtSideRadar.Text                     := '';
    edtMagneticPhysical.Text              := '';
    edtMinSpeedAcousticPhysical.Text      := '';
    edtBelowCavitationAcousticPhysical.Text := '';
    edtAboveCavitationAcousticPhysical.Text := '';
    edtMaxSpeedAcousticPhysical.Text        := '';
    edtCavitationSpeedAcousticPhysical.Text := '';
    edtMaxOperatPeriscope.Text              := '';
    edtHighAbovePeriscope.Text              := '';
    edtFontInfrared.Text                    := '';
    edtSideInfrared.Text                    := '';
    edtFontVisual.Text                      := '';
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
    edtFrontSidePhysical.Text               := '';
    Show;
  end;
end;

procedure TfVehicleSelect.btnOkClick(Sender: TObject);
var i:integer;
id : string;
begin

  if fVehicleAttributeWindow.fromVehicle then
  begin
    for I := 0 to lbRAVehicle.Count - 1 do
    begin
      id_embarked := lbTempIdSel.Items.Strings[i];
      with hosted_plat.FData do begin
        if fVehiclePicklistFilter.id_vehicle <> '' then
          Vehicle_Index         := StrToInt(fVehiclePicklistFilter.id_vehicle)
        else
          Vehicle_Index         := StrToInt(vId);
        Hosted_Vehicle_Index  := StrToInt(id_embarked);
        if fInputName.edtQuantity.Text = '' then
          Quantity           := 0
        else
          Quantity              := StrToInt(fInputName.edtQuantity.Text);
      end;
      if fVehiclePicklistFilter.id_vehicle <> '' then
         id := fVehiclePicklistFilter.id_vehicle
      else
         id := vId;
      if dmTTT.GetHosted_Platform (StrToInt(id),StrToInt(id_embarked),pList) = False then
        dmTTT.insertHosted_Platform(hosted_plat);
    end;
    Close;
  end
  else if fPredefinedPattern.fromPattern then
  begin
    vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
    fPredefinedPattern.edt1.Text := lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
    Close;
  end
  else if fVehiclePicklistFilter.forEmbarked then
  begin
    vId := lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex];
    fVehiclePicklistFilter.edtFilterEmbarkedPlatform.Text := lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex];
    Close;
    fVehiclePicklistFilter.getEmbarked;
  end
  else
    Close;
end;

procedure TfVehicleSelect.btnRemoveClick(Sender: TObject);
var i:integer;
begin

  for I := 0 to lbRAVehicle.Count - 1 do begin
   if lbRAVehicle.Selected[I] then
   begin
   { if dmTTT.GetPlatform_ActivationByPlatformInstance(StrToInt(lbTempIdSel.Items[i]),platform_activation) > null then
      ShowMessage('The data can not be delete')
    else begin  }
    //end;
    if fVehicleAttributeWindow.fromVehicle then
      dmTTT.deleteHosted_Platform(lbTempIdSel.Items[i])
    else
      dmTTT.deletePlatformInstance(lbTempIdSel.Items[i]);

    lbRAVehicle.Items.Delete(I);


   end;
  end;
  //getRAVehicle;
end;



procedure TfVehicleSelect.cbbFilterDomainChange(Sender: TObject);
begin
  fVehiclePicklistFilter.Filter;
end;

procedure TfVehicleSelect.cbbFilterSensorTypeChange(Sender: TObject);
begin
  fVehiclePicklistFilter.Filter;
end;

procedure TfVehicleSelect.cbbFilterTypeChange(Sender: TObject);
begin
  fVehiclePicklistFilter.Filter;
end;

procedure TfVehicleSelect.cbbFilterWeaponTypeChange(Sender: TObject);
begin
  fVehiclePicklistFilter.Filter;
end;

procedure TfVehicleSelect.chkDomainClick(Sender: TObject);
begin
  if chkDomain.Checked = False then
    fVehiclePicklistFilter.getVehicle;
end;

procedure TfVehicleSelect.chkEmbarkedClick(Sender: TObject);
begin
  if chkEmbarked.Checked = False then
    fVehiclePicklistFilter.getVehicle
  else
  begin
    edtFilterEmbarkedPlatform.Enabled := True;
    btn3.Enabled := True;
  end;
end;

procedure TfVehicleSelect.chkSensorClick(Sender: TObject);
begin
  if chkSensor.Checked = False then
    fVehiclePicklistFilter.getVehicle
  else
  begin
    cbbFilterSensorType.Enabled := True;
    edtFiltersensorOnBoard.Enabled := True;
    btn1.Enabled := True;
  end;
end;

procedure TfVehicleSelect.chkTypeClick(Sender: TObject);
begin
  if chkType.Checked = False then
    fVehiclePicklistFilter.getVehicle;
end;

procedure TfVehicleSelect.chkWeaponClick(Sender: TObject);
begin
  if chkWeapon.Checked = False then
    fVehiclePicklistFilter.getVehicle
  else
  begin
    cbbFilterWeaponType.Enabled := True;
    edtFilterWeaponOnBoar.Enabled := True;
    btn2.Enabled := True;
  end;
end;

procedure TfVehicleSelect.getRAVehicle;
var i : integer;
  id : string ;
begin

  if vId='' then
    vId:='0';

  lbAllVehicle.Items.Clear;
  lbRAVehicle.Items.Clear;
  lbTempIdAll.Items.Clear;
  lbTempIdSel.Items.Clear;
  pList.Clear;

//get all vehicle name
 uSimDBEditor.getAllVehicles(vList,0,vehicle);
 if fVehicleAttributeWindow.fromVehicle then
 begin
   if fVehiclePicklistFilter.id_vehicle <> '' then
     id := fVehiclePicklistFilter.id_vehicle
   else
     id := vId;
   dmTTT.GetHosted_Platform(StrToInt(id),0,pList);
 end
 else if fVehicleAttributeWindow.fromVehicle = False then
 begin
   if fRAList.RA_id <> '' then
      uSimDBEditor.getRAvehicle(0,StrToInt(fRAList.RA_id),pList,ResourceAllocationForm.force,-1)
   else begin
      id := IntToStr(ResourceAllocationForm.ra.FData.Resource_Alloc_Index);
      uSimDBEditor.getRAvehicle(0,StrToInt(id),pList,ResourceAllocationForm.force,-1)
   end;
 end;

 for I := 0 to vList.Count - 1 do
 begin
    lbAllVehicle.Items.Add(TVehicle_Definition(vList[i]).FData.Vehicle_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TVehicle_Definition(vList[i]).FData.Vehicle_Index));
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
 end;
end;

procedure TfVehicleSelect.FormCreate(Sender: TObject);
begin
  platform_identifier := TPlatform_Instance_Identifier.Create;
  platform_instance   := TPlatform_Instance.Create;
  platform_activation := TPlatform_Activation.Create;
  vehicle             := TVehicle_Definition.Create;
  hosted_plat         := THosted_Platform.Create;
  pList               := TList.Create;
  vList               := TList.Create;
end;

procedure TfVehicleSelect.FormShow(Sender: TObject);
begin
  Height := 439;
  if fromRuntime then
  begin
    getRuntimeVehicle;
  end
  else
  begin
    getRAVehicle;
  end;
end;

procedure TfVehicleSelect.getRuntimeVehicle;
var
  I : Integer;
  temp_id_ra : Integer;
begin
  lbRAVehicle.Clear;
  lbTempIdAll.Clear;
  lbTempIdSel.Clear;
  lbAllVehicle.Clear;

    uSimDBEditor.getAllVehicles(vList,0,vehicle);

   for I := 0 to vList.Count - 1 do
   begin
      lbAllVehicle.Items.Add(TVehicle_Definition(vList[i]).FData.Vehicle_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TVehicle_Definition(vList[i]).FData.Vehicle_Index));
   end;

   dmTTT.getVehicleByLibrary(fRuntimePlatform.platform_library_index, vList);
   for I := 0 to vList.Count - 1 do
   begin
      lbRAVehicle.Items.Add(TVehicle_Definition(vList[I]).FData.Vehicle_Identifier);
      lbTempIdSel.Items.Add(IntToStr(TVehicle_Definition(vList[I]).FData.Vehicle_Index));
   end;




end;

end.
