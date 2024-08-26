unit uSonobuoySelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,uDBAsset_Sonobuoy, uDBAsset_Runtime_Platform_Library;

type
  TfSonobuoySelect = class(TForm)
    lbAllSonobuoy: TListBox;
    btnAdd: TButton;
    shp1: TShape;
    btnRemove: TButton;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    btnClose: TButton;
    lbSonobuoySel: TListBox;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btnEditMount: TButton;
    btnUsage: TButton;
    btnFilter: TButton;
    btn1: TButton;
    procedure getRASonobuoy;
    procedure getRuntimeSonobuoy;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure lbAllSonobuoyClick(Sender: TObject);
    procedure lbSonobuoySelClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditMountClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure lbAllSonobuoyDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    fromAssetVehicle, fromRuntime : boolean;
    sonobuoy_id,name_sID,pi_ID : string;
    sonobuoy    : TSonobuoy_On_Board;
    platform_library_entry : TPlatform_Library_Entry;
    show_from : Integer;
  end;

var
  fSonobuoySelect   : TfSonobuoySelect;
  sList,pList,tempList : TList;
  idSelect    : string;

implementation

{$R *.dfm}
uses uDataModuleTTT, uSimDBEditor, uResurceAllocationSelect,uSensorDoubleList,
  ufrmSummaryResourceAllocation,uDBAssetObject, uInputName,ufrmAvailableResourceAllocation, ufrmSummarySonobuoy,
  ufrmAdminMainForm, ufrmSummaryVehicle, ufrmSummaryRuntimePlatform, ufrmUsage;

procedure TfSonobuoySelect.getRASonobuoy;
var i   : integer;
begin
 sList.Clear;
 pList.Clear;
//get all vehicle name
 if fromAssetVehicle then
 begin
//   dmTTT.getAllSonobuoy_On_Board(frmSummaryVehicle.vehicle.FData.Vehicle_Index, 0, sList);
   //cleare
   lbAllSonobuoy.Clear;
   lbTempIdAll.Clear;

   for I := 0 to sList.Count - 1 do
   begin
     lbAllSonobuoy.Items.Add(TSonobuoy_On_Board(sList[I]).FData.Instance_Identifier);
     lbTempIdAll.Items.Add(IntToStr(TSonobuoy_On_Board(sList).FData.Sonobuoy_Instance_Index));
   end;

 end
 else
 begin
   uSimDBEditor.getAllSonobuoy(0,0,sList,sonobuoy);
   if frmAvailableResourceAllocation.RA_id <> '' then
      uSimDBEditor.getRA(3,StrToInt(frmAvailableResourceAllocation.RA_id),frmSummaryResourceAllocation.force,pList);

   lbAllSonobuoy.Items.Clear;
   lbSonobuoySel.Items.Clear;
   lbTempIdAll.Items.Clear;
   lbTempIdSel.Items.Clear;

    for I := 0 to sList.Count - 1 do
    begin
        lbAllSonobuoy.Items.Add(TSonobuoy_On_Board(sList[i]).FDef.Class_Identifier);
        lbTempIdAll.Items.Add(IntToStr(TSonobuoy_On_Board(sList[i]).FDef.Sonobuoy_Index));
    end;

    for I := 0 to pList.Count - 1 do begin
      lbSonobuoySel.Items.Add(TSonobuoy_On_Board(pList[i]).FPI.Instance_Name);
      lbTempIdSel.Items.Add(IntToStr(TSonobuoy_On_Board(pList[i]).FPI.Platform_Instance_Index));
    end;
 end;

end;

procedure TfSonobuoySelect.getRuntimeSonobuoy;
var
  I,k,count : Integer;
begin
  count := 0;
  lbAllSonobuoy.Items.Clear;
  lbSonobuoySel.Items.Clear;
  lbTempIdAll.Items.Clear;
  lbTempIdSel.Items.Clear;
  pList.Clear;
  sList.Clear;

//  dmTTT.getSonobuoyByLibrary(frmSummaryRuntimePlatform.platform_library_index,pList);
  for I := 0 to pList.Count - 1 do
  begin
    lbSonobuoySel.Items.Add(TSonobuoy_On_Board(pList[i]).FDef.Class_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TSonobuoy_On_Board(pList[i]).FDef.Sonobuoy_Index));
  end;

  uSimDBEditor.getAllSonobuoy(0,0,sList,sonobuoy);

  for I := 0 to sList.Count - 1 do
  begin
    count := 0;
    for k := 0 to pList.Count - 1 do
    begin
      if TSonobuoy_On_Board(sList[i]).FDef.Sonobuoy_Index <> TSonobuoy_On_Board(pList[k]).FDef.Sonobuoy_Index then
        count := count + 1;
    end;
    if count = pList.Count then
    begin
      lbAllSonobuoy.Items.Add(TSonobuoy_On_Board(sList[i]).FDef.Class_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TSonobuoy_On_Board(sList[i]).FDef.Sonobuoy_Index));
    end;
  end;
end;


procedure TfSonobuoySelect.lbAllSonobuoyClick(Sender: TObject);
begin
 if lbAllSonobuoy.ItemIndex <> -1 then
 begin
   btnEdit.Enabled := true;
   btnCopy.Enabled := true;
   btnAdd.Enabled := true;
 end;
end;

procedure TfSonobuoySelect.lbAllSonobuoyDblClick(Sender: TObject);
begin
  btnAdd.Click;
end;

procedure TfSonobuoySelect.lbSonobuoySelClick(Sender: TObject);
begin
  if lbSonobuoySel.ItemIndex <> -1 then
  begin
    if not fromRuntime then btnEditMount.Enabled := true;
    btnRemove.Enabled := true;
    btnUsage.Enabled  := true;
  end;
end;

procedure TfSonobuoySelect.btnAddClick(Sender: TObject);
begin
  if lbAllSonobuoy.ItemIndex <> -1 then
  begin
    if fromRuntime then
    begin
      platform_library_entry := TPlatform_Library_Entry.Create;
      with platform_library_entry.FData do
      begin
//        Library_Index := frmSummaryRuntimePlatform.platform_library_index;
        Platform_Type := 7;
        Sonobuoy_Index := StrToInt(lbTempIdAll.Items[lbAllSonobuoy.ItemIndex]);
        dmTTT.InsertPlatform_Library_Entry(platform_library_entry);

        getRuntimeSonobuoy;
      end;
    end
    else
    begin
      sonobuoy_id := lbTempIdAll.Items.Strings[lbAllSonobuoy.ItemIndex];
      name_sID  := '';
      pi_ID     := '';
      fInputName.edtTrackId.Text  := 'NULL';
      frmSummaryResourceAllocation.ra_index  := 4;
      fInputName.edtQuantity.Hide;
      fInputName.lbl3.Hide;
      fInputName.ShowModal;
    end;
  end;
end;

procedure TfSonobuoySelect.btnCloseClick(Sender: TObject);
begin
  Close;
  btnEdit.Enabled := false;
  btnCopy.Enabled := false;
  btnAdd.Enabled := false;
  btnUsage.Enabled := false;
  btnEditMount.Enabled := false;
  btnRemove.Enabled := false;
end;

procedure TfSonobuoySelect.btnCopyClick(Sender: TObject);
begin
  sonobuoy_id := lbTempIdAll.Items.Strings[lbAllSonobuoy.ItemIndex];
  with frmSummarySonobuoy do begin
//    isDouble     := true;
//    edtName.Text := 'Copy of ' + lbAllSonobuoy.Items.Strings[lbAllSonobuoy.ItemIndex];
//    isCopy       := true;
    ShowModal;
  end;
end;

procedure TfSonobuoySelect.btnEditClick(Sender: TObject);
begin
  sonobuoy_id := lbTempIdAll.Items.Strings[lbAllSonobuoy.ItemIndex];
  with frmSummarySonobuoy do begin
//    isDouble     := true;
//    edtName.Text := lbAllSonobuoy.Items.Strings[lbAllSonobuoy.ItemIndex];
    //fSensor.;
    ShowModal;
  end;

//  Close;
end;

procedure TfSonobuoySelect.btnEditMountClick(Sender: TObject);
begin
  if lbSonobuoySel.ItemIndex <> -1 then
  begin
//    if frmSummaryVehicle.show_from <> fromVehicle then
//    begin
//      sonobuoy_id := IntToStr(TSonobuoy_On_Board(pList[lbSonobuoySel.ItemIndex]).FPI.Sonobuoy_Index);
//      name_sId  := lbSonobuoySel.Items.Strings[lbSonobuoySel.ItemIndex];
//      pi_ID     := lbTempIdSel.Items.Strings[lbSonobuoySel.ItemIndex];
//      fInputName.edtTrackId.Text  := TSonobuoy_On_Board(pList[lbSonobuoySel.ItemIndex]).FPI.Track_ID;
//      frmSummaryResourceAllocation.ra_index  := 4;
//      fInputName.edtQuantity.Hide;
//      fInputName.lbl3.Hide;
//      fInputName.ShowModal;
//    end;
  end;
end;

procedure TfSonobuoySelect.btnNewClick(Sender: TObject);
begin
//  frmSummarySonobuoy.isNew := true;
  frmSummarySonobuoy.ShowModal;
end;

procedure TfSonobuoySelect.btnRemoveClick(Sender: TObject);
var
warning: integer;
begin
  if lbSonobuoySel.ItemIndex <> -1 then
  begin
    warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);
    if warning = mrOK then
    begin
      idSelect := lbTempIdSel.Items.Strings[lbSonobuoySel.ItemIndex];

      if fromRuntime then
      begin
//        dmTTT.DeletePlatform_Library_Entry(7,frmSummaryRuntimePlatform.platform_library_index,StrToInt(lbTempIdSel.Items[lbSonobuoySel.ItemIndex]));
        getRuntimeSonobuoy;
      end
      else
      begin
        dmTTT.deletePlatform_ActivationByIndex(lbTempIdSel.Items[lbSonobuoySel.ItemIndex]);
//        dmTTT.deletePlatformInstance(lbTempIdSel.Items[lbSonobuoySel.ItemIndex]);
        getRASonobuoy;
      end;
    end;
  end;
end;

procedure TfSonobuoySelect.btnUsageClick(Sender: TObject);
begin
  if lbSonobuoySel.ItemIndex <> -1 then begin
    if (not fromRuntime) then
    begin
      with frmUsage do begin
        UId := TSonobuoy_On_Board(pList[lbSonobuoySel.ItemIndex]).FPI.Sonobuoy_Index;
        name_usage  := lbSonobuoySel.Items.Strings[lbSonobuoySel.ItemIndex];
        UIndex  := 22;
        usage_title := 'Scenario:';
        ShowModal;
      end;
    end;
  end;
end;

procedure TfSonobuoySelect.FormShow(Sender: TObject);
begin
  if fromRuntime then
    getRuntimeSonobuoy
  else getRASonobuoy;
end;

procedure TfSonobuoySelect.FormCreate(Sender: TObject);
begin
  pList   := Tlist.Create;
  sList   := TList.Create;
  sonobuoy    := TSonobuoy_On_Board.Create;
end;

end.
