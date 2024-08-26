unit uAccousticDecoySelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TfAccousticDeploySelect = class(TForm)
    shp1: TShape;
    lbAllMissile: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    lbMissileSel: TListBox;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btn1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure getData;
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    accoustic : TAcoustic_Decoy_On_Board;
    mList,pList : TList;
    acc_id      : string;
  end;

var
  fAccousticDeploySelect: TfAccousticDeploySelect;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehicleAttributeWindow,uVehiclePicklistFilter,
uAccousticDecoyMount;

procedure TfAccousticDeploySelect.btn1Click(Sender: TObject);
begin
  AccousticDecoy.accoustic := pList[lbMissileSel.ItemIndex];
  AccousticDecoy.Show;
end;

procedure TfAccousticDeploySelect.btnAddClick(Sender: TObject);
var i:integer;
acc_name : string;
begin
  for I := 0 to lbAllMissile.Items.Count - 1 do
  begin
    if lbAllMissile.Selected[I] then
    begin
      lbMissileSel.Items.Add(lbAllMissile.Items[i]);
      lbTempIdSel.Items.Add(lbTempIdAll.Items[i]);
      acc_id := lbTempIdAll.Items[i];
      acc_name := lbAllMissile.Items[i];
    end;
  end;

  for I :=lbAllMissile.Items.Count - 1 downto 0 do
  if lbAllMissile.Selected[I] then
  begin
    lbAllMissile.Items.Delete(I);
    lbTempIdAll.Items.Delete(I);
  end;

  with accoustic.FData do
  begin
    Instance_Identifier := acc_name;
    if fVehiclePicklistFilter.id_vehicle <> '' then
       Vehicle_Index := StrToInt(fVehiclePicklistFilter.id_vehicle)
    else
       Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    Decoy_Index   := StrToInt(acc_id);
    Quantity      := 0;
    Instance_Type := 0;
  end;

   dmTTT.InsertAcoustic_Decoy_On_Board(accoustic);
   getData;
end;

procedure TfAccousticDeploySelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfAccousticDeploySelect.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfAccousticDeploySelect.btnRemoveClick(Sender: TObject);
var i:integer;
begin
  for I :=lbMissileSel.Count - 1 downto 0 do
 if lbMissileSel.Selected[I] then
 begin
    dmTTT.DeleteAcoustic_Decoy_On_Board(lbTempIdSel.Items[i]);
    lbMissileSel.Items.Delete(I);
 end;
end;

procedure TfAccousticDeploySelect.FormCreate(Sender: TObject);
begin
  accoustic := TAcoustic_Decoy_On_Board.Create;
  mList      := TList.Create;
  pList      := TList.Create;
end;

procedure TfAccousticDeploySelect.FormShow(Sender: TObject);
begin
  getData;
end;

procedure TfAccousticDeploySelect.getData;
var
  i: Integer;
begin

  lbAllMissile.Items.Clear;
  lbMissileSel.Items.Clear;
  lbTempIdAll.Items.Clear;
  lbTempIdSel.Items.Clear;
  pList.Clear;

  dmTTT.getAccoustic_Decoy(0,mList,accoustic);

  if fVehiclePicklistFilter.id_vehicle <> '' then
    dmTTT.getAccoustic_Decoy_On_Board(StrToInt(fVehiclePicklistFilter.id_vehicle),pList)
  else
    dmTTT.getAccoustic_Decoy_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index,pList);

  for i := 0 to mList.Count - 1 do
  begin
    lbAllMissile.Items.Add(TAcoustic_Decoy_On_Board(mList[i]).FAccousticDecoy_Def.Decoy_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TAcoustic_Decoy_On_Board(mList[i]).FAccousticDecoy_Def.Decoy_Index));
  end;

  for I := 0 to pList.Count - 1 do
  begin
    lbMissileSel.Items.Add(TAcoustic_Decoy_On_Board(pList[i]).FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TAcoustic_Decoy_On_Board(pList[i]).FData.Acoustic_Instance_Index));
  end;
end;


end.
