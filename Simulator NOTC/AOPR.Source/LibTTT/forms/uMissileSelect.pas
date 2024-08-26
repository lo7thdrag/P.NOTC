unit uMissileSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,uDBAsset_Weapon;

type
  TfMissileSelect = class(TForm)
    lbAllMissile: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    shp1: TShape;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    lbMissileSel: TListBox;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btn1: TButton;
    procedure getRAMissile;
    procedure getRuntimeMissile;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);

  private

    { Private declarations }
  public
    { Public declarations }
    missile_id : string;
    pList: TList;
    isCopy : boolean;
    isNew : boolean;
    missile    : TMissile_On_Board;
    fromRuntime : boolean;

  end;

var
  fMissileSelect: TfMissileSelect;

  idSelect      : string;

implementation

uses uSimDBEditor, uResurceAllocationSelect, uResourceAllocation,
uInputName,{uSimMgr_Client,}uDBAssetObject,uDataModuleTTT,ufDBEditor,
uRAList, uMissileSummary, uWeaponSingleList, uVehicleAttributeWindow,
uMissileMountForm, uVehiclePicklistFilter;

{$R *.dfm}

procedure TfMissileSelect.btn1Click(Sender: TObject);
var i,id:integer;
begin
  if fVehicleAttributeWindow.fromVehicle then
  begin
    MissileMountForm.missile_fitted := pList[lbMissileSel.ItemIndex];
    MissileMountForm.Show;
  end;
end;

procedure TfMissileSelect.btnAddClick(Sender: TObject);
Var i:integer;
missile_name : string;
begin

  if fVehicleAttributeWindow.fromVehicle then
  begin

    for I := 0 to lbAllMissile.Items.Count - 1 do
   begin
     if lbAllMissile.Selected[I] then
     begin
        lbMissileSel.Items.Add(lbAllMissile.Items[i]);
        lbTempIdSel.Items.Add(lbTempIdAll.Items[i]);
        missile_id := lbTempIdAll.Items[i];
        missile_name := lbAllMissile.Items[i];
     end;
   end;

   for I :=lbAllMissile.Items.Count - 1 downto 0 do
   if lbAllMissile.Selected[I] then
   begin
    lbAllMissile.Items.Delete(I);
    lbTempIdAll.Items.Delete(I);
   end;

   with missile.FData do
   begin
      Instance_Identifier := missile_name;
      if fVehiclePicklistFilter.id_vehicle <> '' then
        Vehicle_Index := StrToInt(fVehiclePicklistFilter.id_vehicle)
      else
        Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
      Missile_Index := StrToInt(missile_id);
      Instance_Type := 0;
      Mount_Type    := 0;
      Quantity      := 0;
   end;

   dmTTT.InsertFitted_Weapon_On_Board(IntToStr(missile.FData.Missile_Index),1,missile.FData);
   getRAMissile;
  end
  else
  begin
    ResourceAllocationForm.ra_index  := 2;
    fInputName.Show;
  end;
end;

procedure TfMissileSelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfMissileSelect.btnCopyClick(Sender: TObject);
begin
  fMissileSummary.isCopy := True;
  fWeaponSingle.Definition;
  fMissileSummary.Show;
end;

procedure TfMissileSelect.btnEditClick(Sender: TObject);
begin
  missile_id := lbTempIdAll.Items.Strings[lbAllMissile.ItemIndex];

  with fMissileSummary do begin
    edtClassMissile.Text := lbAllMissile.Items.Strings[lbAllMissile.ItemIndex];
    fWeaponSingle.Definition;
    Show;
  end;

  Close;
end;

procedure TfMissileSelect.btnNewClick(Sender: TObject);
begin
  fDBEditor.index := 1;
  fWeaponSingle.NewDefinition;
end;

procedure TfMissileSelect.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfMissileSelect.btnRemoveClick(Sender: TObject);
var rec:TPlatform_Instance;
i:integer;
begin
  idSelect := lbTempIdSel.Items.Strings[lbMissileSel.ItemIndex];

  for I := lbMissileSel.Count - 1 downto 0 do
  if lbMissileSel.Selected[I] then
  begin
    lbMissileSel.Items.Delete(I);
    if fVehicleAttributeWindow.fromVehicle then
      dmTTT.DeleteFitted_Weapon_On_Board(lbTempIdSel.Items[i])
    else
      dmTTT.deletePlatformInstance(lbTempIdSel.Items[i]);
    getRAMissile;
  end;
 
end;


procedure TfMissileSelect.FormCreate(Sender: TObject);
begin
  missile := TMissile_On_Board.Create;
  pList   := Tlist.Create;
  mList   := TList.Create;
end;

procedure TfMissileSelect.FormShow(Sender: TObject);
begin
   if fromRuntime then
   begin
      getRuntimeMissile;
   end
   else
   begin
      getRAMissile;
   end;
end;

procedure TfMissileSelect.getRAMissile;
var i   : integer;
    s   : string;
begin

//get all vehicle name
 uSimDBEditor.getAllMissile(0,mList,missile);
 if fRAList.RA_id <> '' then
  uSimDBEditor.getRA(1,StrToInt(fRAList.RA_id),ResourceAllocationForm.force,pList);

 if fVehicleAttributeWindow.fromVehicle then
 begin
   if fVehiclePicklistFilter.id_vehicle <> '' then
      dmTTT.getMissile_OnBoard_Distinct(StrToInt(fVehiclePicklistFilter.id_vehicle),pList)
   else
      dmTTT.getMissile_OnBoard_Distinct(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index,pList);
 end;

 lbAllMissile.Items.Clear;
 lbMissileSel.Items.Clear;
 lbTempIdAll.Items.Clear;
 lbTempIdSel.Items.Clear;

   for I := 0 to mList.Count - 1 do
   begin
    lbAllMissile.Items.Add(TMissile_On_Board(mList[i]).FDef.Class_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TMissile_On_Board(mList[i]).FDef.Missile_Index));
   end;

   if fRAList.RA_id <> '' then
   begin
     for I := 0 to pList.Count - 1 do begin
      lbMissileSel.Items.Add(TMissile_On_Board(pList[i]).FPI.FData.Instance_Name);
      lbTempIdSel.Items.Add(IntToStr(TMissile_On_Board(pList[i]).FPI.FData.Missile_Index));
     end;
   end
   else if fVehicleAttributeWindow.fromVehicle then
   begin
     for I := 0 to pList.Count - 1 do begin
      lbMissileSel.Items.Add(TMissile_On_Board(pList[i]).FData.Instance_Identifier);
      lbTempIdSel.Items.Add(IntToStr(TMissile_On_Board(pList[i]).FData.Fitted_Weap_Index));
     end;
   end;
end;

procedure TfMissileSelect.getRuntimeMissile;
begin
  lbAllMissile.Items.Clear;
  lbMissileSel.Items.Clear;
  lbTempIdAll.Items.Clear;
  lbTempIdSel.Items.Clear;

end;


end.
