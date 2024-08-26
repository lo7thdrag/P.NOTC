unit uTorpedoSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,uDBAsset_Weapon;

type
  TfTorpedo = class(TForm)
    lbAllTorpedo: TListBox;
    shp1: TShape;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    lbTorpedoSel: TListBox;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btn1: TButton;
    procedure getRATorpedo;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
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
    torpedo_id  : string;
    torpedo     : TTorpedo_On_Board;
  end;

var
  fTorpedo    : TfTorpedo;
  pList,mList : TList;
  idSelect    : string;

implementation

uses uDataModuleTTT, uSimDBEditor, uResurceAllocationSelect,ufDBEditor,
  uResourceAllocation,uDBAssetObject, uInputName, uRAList, uTorpedoSummary,
  uWeaponSingleList, uMissileSummary,uVehiclePicklistFilter,
  uVehicleAttributeWindow, uTorpedoMounts;

{$R *.dfm}

procedure TfTorpedo.getRATorpedo;
var i   : integer;
    s   : string;

begin

//get all vehicle name
 uSimDBEditor.getAllTorpedo(0,mList,torpedo);
 if fRAList.RA_id <> '' then
    uSimDBEditor.getRA(2,StrToInt(fRAList.RA_id),ResourceAllocationForm.force,pList);

 if fVehicleAttributeWindow.fromVehicle then
 begin
   if fVehiclePicklistFilter.id_vehicle <> '' then
     dmTTT.getTorpedo_OnBoard(StrToInt(fVehiclePicklistFilter.id_vehicle),pList)
   else
     dmTTT.getTorpedo_OnBoard(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index,pList);
 end;

 lbAllTorpedo.Items.Clear;
 lbTorpedoSel.Items.Clear;
 lbTempIdAll.Items.Clear;
 lbTempIdSel.Items.Clear;

  for I := 0 to mList.Count - 1 do
  begin
      lbAllTorpedo.Items.Add(TTorpedo_On_Board(mList[i]).FDef.Class_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TTorpedo_On_Board(mList[i]).FDef.Torpedo_Index));
  end;

  if fRAList.RA_id <> '' then
  begin
    for I := 0 to pList.Count - 1 do begin
      lbTorpedoSel.Items.Add(TTorpedo_On_Board(pList[i]).FPI.FData.Instance_Name);
      lbTempIdSel.Items.Add(IntToStr(TTorpedo_On_Board(pList[i]).FPI.FData.Torpedo_Index));
    end;
  end
  else if fVehicleAttributeWindow.fromVehicle then
  begin
    for I := 0 to pList.Count - 1 do begin
      lbTorpedoSel.Items.Add(TTorpedo_On_Board(pList[i]).FData.Instance_Identifier);
      lbTempIdSel.Items.Add(IntToStr(TTorpedo_On_Board(pList[i]).FData.Fitted_Weap_Index));
    end;
  end;

end;

procedure TfTorpedo.btn1Click(Sender: TObject);
begin
  if fVehicleAttributeWindow.fromVehicle then
  begin
    TorpedoMountsForm.torpedo := pList[lbTorpedoSel.ItemIndex];
    TorpedoMountsForm.Show;
  end;
end;

procedure TfTorpedo.btnAddClick(Sender: TObject);
var i:integer;
torpedo_name : string;
begin

  if ResourceAllocationForm.fromRA then
  begin
    ResourceAllocationForm.ra_index  := 3;
    fInputName.Show;
  end
  else if fMissileSummary.fromMissile or  fVehicleAttributeWindow.fromVehicle then
  begin
    for I := 0 to lbAllTorpedo.Items.Count - 1 do
    if lbAllTorpedo.Selected[I] then
    begin
      lbTorpedoSel.Items.Add(lbAllTorpedo.Items[i]);
      if fMissileSummary.fromMissile then
        lbTempIdSel.Items.Add(lbTempIdAll.Items[0])
      else
        lbTempIdSel.Items.Add(lbTempIdAll.Items[i]);
      torpedo_id := lbTempIdAll.Items[i];
      torpedo_name := lbAllTorpedo.Items[i];
    end;

    for I :=lbAllTorpedo.Items.Count - 1 downto 0 do
    if lbAllTorpedo.Selected[I] then
    begin
      lbAllTorpedo.Items.Delete(I);
      lbTempIdAll.Items.Delete(I);
    end;

    if fVehicleAttributeWindow.fromVehicle then
    begin
      for I := 0 to lbAllTorpedo.Items.Count - 1 do
      with torpedo.FData do
      begin
       Instance_Identifier := torpedo_name;
       if fVehiclePicklistFilter.id_vehicle <> '' then
         Vehicle_Index := StrToInt(fVehiclePicklistFilter.id_vehicle)
       else
         Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
       Torpedo_Index := StrToInt(torpedo_id);
       Instance_Type := 0;
       Mount_Type    := 0;
       Quantity      := 0;

      end;

      dmTTT.InsertFitted_Weapon_On_Board(IntToStr(torpedo.FData.Torpedo_Index),2,torpedo.FData);
      getRATorpedo;
    end;
  end;

end;

procedure TfTorpedo.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfTorpedo.btnCopyClick(Sender: TObject);
begin
  uSimDBEditor.getAllTorpedo(StrToInt(lbTempIdAll.Items.Strings[lbAllTorpedo.ItemIndex]),mList,torpedo);
  torpedo.FDef.Class_Identifier:= 'Copy Of ' + lbAllTorpedo.Items.Strings[lbAllTorpedo.ItemIndex];
  dmTTT.insertTorpedo_Def(torpedo);
  getRATorpedo;
end;

procedure TfTorpedo.btnEditClick(Sender: TObject);
begin
  torpedo_id := lbTempIdAll.Items.Strings[lbAllTorpedo.ItemIndex];
  with fTorpedoSummary do begin
    edtClassTorpedo.Text := lbAllTorpedo.Items.Strings[lbAllTorpedo.ItemIndex];
    fWeaponSingle.Definition;
    Show;
  end;

  Close;
end;

procedure TfTorpedo.btnNewClick(Sender: TObject);
begin
  fDBEditor.index := 2;
  fWeaponSingle.NewDefinition;
end;

procedure TfTorpedo.btnOkClick(Sender: TObject);
begin
  if ResourceAllocationForm.fromRA then
    Close
  else if fMissileSummary.fromMissile then
    fMissileSummary.edtHybridTorpedoDef.Text := lbTorpedoSel.Items.Strings[0]
  else if fVehicleAttributeWindow.fromVehicle then
    Close;
end;

procedure TfTorpedo.btnRemoveClick(Sender: TObject);
var rec:TPlatform_Instance;
i:integer;
begin
  idSelect := lbTempIdSel.Items.Strings[lbTorpedoSel.ItemIndex];

  for I :=0 to lbTorpedoSel.Count - 1 do
  if lbTorpedoSel.Selected[I] then
  begin
    lbTorpedoSel.Items.Delete(I);
    if fVehicleAttributeWindow.fromVehicle then
      dmTTT.DeleteFitted_Weapon_On_Board(lbTempIdSel.Items[i])
    else
      dmTTT.deletePlatformInstance(lbTempIdSel.Items[i]);
    getRATorpedo;
  end;
end;


procedure TfTorpedo.FormCreate(Sender: TObject);
begin
  pList   := Tlist.Create;
  mList   := TList.Create;
  torpedo := TTorpedo_On_Board.Create;
end;

procedure TfTorpedo.FormShow(Sender: TObject);
begin
  getRATorpedo;
end;

end.
