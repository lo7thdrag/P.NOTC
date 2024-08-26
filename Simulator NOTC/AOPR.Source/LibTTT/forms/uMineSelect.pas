unit uMineSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, uDBAsset_Weapon;

type
  TfMine = class(TForm)
    lbAllMine: TListBox;
    btnAdd: TButton;
    shp1: TShape;
    btnRemove: TButton;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    btnOk: TButton;
    btnCancel: TButton;
    lbMineSel: TListBox;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btn1: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure getRAMine;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mine_id : string;
    mine  : TMine_On_Board;
  end;

var
  fMine: TfMine;
  mList,pList : TList;
  idSelect    : string;

implementation

{$R *.dfm}
uses uDataModuleTTT,uSimDBEditor, uResurceAllocationSelect, uWeaponSingleList,
  uResourceAllocation,uDBAssetObject, uInputName,uRAList, uMineSummary,
  ufDBEditor, uVehicleAttributeWindow, uVehiclePicklistFilter, uMineMount;


procedure TfMine.btn1Click(Sender: TObject);
begin
  if fVehicleAttributeWindow.fromVehicle then
  begin
    MineMountForm.mine := TMine_On_Board(pList[lbMineSel.ItemIndex]);
    MineMountForm.Show;
  end;
end;

procedure TfMine.btnAddClick(Sender: TObject);
var i:integer;
mine_name : string;
begin

  if fVehicleAttributeWindow.fromVehicle then
  begin
    for I := 0 to lbAllMine.Items.Count - 1 do
    if lbAllMine.Selected[I] then
    begin
      lbMineSel.Items.Add(lbAllMine.Items[i]);
      lbTempIdSel.Items.Add(lbTempIdAll.Items[0]);
      mine_id := lbTempIdAll.Items[i];
      mine_name := lbAllMine.Items[i];
    end;

    for I :=lbAllMine.Items.Count - 1 downto 0 do
    if lbAllMine.Selected[I] then
    begin
      lbAllMine.Items.Delete(I);
      lbTempIdAll.Items.Delete(I);
    end;

    with mine.FData do begin
      Instance_Identifier := mine_name;
      if fVehiclePicklistFilter.id_vehicle <> '' then
        Vehicle_Index := StrToInt(fVehiclePicklistFilter.id_vehicle)
      else
        Vehicle_index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;

      Mine_Index    := StrToInt(mine_id);
      Instance_Type := 0;
      Mount_Type    := 0;
    end;

    dmTTT.InsertFitted_Weapon_On_Board(mine_id,3,mine.FData);
    getRAMine;
  end
  else
  begin
    ResourceAllocationForm.ra_index  := 5;
    fInputName.Show;
  end;
end;

procedure TfMine.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfMine.btnCopyClick(Sender: TObject);
begin
  uSimDBEditor.getAllMine(StrToInt(lbTempIdAll.Items.Strings[lbAllMine.ItemIndex]),mList,mine);
  mine.FMine_Def.Mine_Identifier:= 'Copy Of ' + lbAllMine.Items.Strings[lbAllMine.ItemIndex];
  dmTTT.insertMine_Def(mine);
  getRAMine;
end;

procedure TfMine.btnEditClick(Sender: TObject);
begin
  mine_id := lbTempIdAll.Items.Strings[lbAllMine.ItemIndex];
  with fMineSummary do begin
    edtClassMine.Text := lbAllMine.Items.Strings[lbAllMine.ItemIndex];
    fWeaponSingle.Definition;
    Show;
  end;

  Close;
end;

procedure TfMine.btnNewClick(Sender: TObject);
begin
  fDBEditor.index := 3;
  fWeaponSingle.NewDefinition;
end;

procedure TfMine.btnOkClick(Sender: TObject);
begin
  Close;
end;


procedure TfMine.btnRemoveClick(Sender: TObject);
var rec:TPlatform_Instance;
i:integer;
begin
  idSelect := lbTempIdSel.Items.Strings[lbMineSel.ItemIndex];

  for I :=0 to lbMineSel.Count - 1 do
  if lbMineSel.Selected[I] then
  begin
    lbMineSel.Items.Delete(I);
    dmTTT.deletePlatformInstance(lbTempIdSel.Items[i]);
    getRAMine;
  end;
end;

procedure TfMine.FormCreate(Sender: TObject);
begin
  pList   := Tlist.Create;
  mList   := TList.Create;
  mine    := TMine_On_Board.Create;
end;

procedure TfMine.getRAMine;
var i   : integer;
    s   : string;

begin

//get all vehicle name
 uSimDBEditor.getAllMine(0,mList,mine);
 if fRAList.RA_id <> '' then
    uSimDBEditor.getRA(4,StrToInt(fRAList.RA_id),ResourceAllocationForm.force,pList);
 if fVehicleAttributeWindow.fromVehicle then
 begin
   if fVehiclePicklistFilter.id_vehicle <> '' then
      dmTTT.getMine_OnBoard(StrToInt(fVehiclePicklistFilter.id_vehicle),pList)
   else
      dmTTT.getMine_OnBoard(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index,pList);
 end;

 lbAllMine.Items.Clear;
 lbMineSel.Items.Clear;
 lbTempIdAll.Items.Clear;
 lbTempIdSel.Items.Clear;

  for I := 0 to mList.Count - 1 do
  begin
      lbAllMine.Items.Add(TMine_On_Board(mList[i]).FMine_Def.Mine_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TMine_On_Board(mList[i]).FMine_Def.Mine_Index));
  end;

  if fRAList.RA_id <> '' then
  begin
     for I := 0 to pList.Count - 1 do begin
      lbMineSel.Items.Add(TMine_On_Board(pList[i]).FPI.FData.Instance_Name);
      lbTempIdSel.Items.Add(IntToStr(TMine_On_Board(pList[i]).FPI.FData.Mine_Index));
     end;
  end
  else if fVehicleAttributeWindow.fromVehicle then
  begin
    for I := 0 to pList.Count - 1 do begin
      lbMineSel.Items.Add(TMine_On_Board(pList[i]).FData.Instance_Identifier);
      lbTempIdSel.Items.Add(IntToStr(TMine_On_Board(pList[i]).FData.Fitted_Weap_Index));
     end;
  end;


end;

procedure TfMine.FormShow(Sender: TObject);
begin
  getRAMine;
end;

end.
