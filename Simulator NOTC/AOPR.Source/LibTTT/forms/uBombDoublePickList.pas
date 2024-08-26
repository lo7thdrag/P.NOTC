unit uBombDoublePickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uDBAsset_Weapon;

type
  TfBombDoublePickList = class(TForm)
    btnAdd: TButton;
    btnCancel: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lbAllBomb: TListBox;
    lbBombSel: TListBox;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    shp1: TShape;
    btn1: TButton;

    procedure getBomb;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    { Private declarations }
    mList,bList : TList;
  public
    { Public declarations }
    bomb : TBomb_Definition;
  end;

var
  fBombDoublePickList: TfBombDoublePickList;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehiclePicklistFilter, uVehicleAttributeWindow, uBombDepthChargeMount;

procedure TfBombDoublePickList.btn1Click(Sender: TObject);
begin
  if fVehicleAttributeWindow.fromVehicle then
  begin
    BombDepthChargeMountForm.bomb := bList[lbBombSel.ItemIndex];
    BombDepthChargeMountForm.Show;
  end;

end;

procedure TfBombDoublePickList.btnAddClick(Sender: TObject);
var i:integer;
bomb_id,bomb_name : string;
begin
  if fVehicleAttributeWindow.fromVehicle then
  begin
    for I := 0 to lbAllBomb.Items.Count - 1 do
    if lbAllBomb.Selected[I] then
    begin
      lbBombSel.Items.Add(lbAllBomb.Items[i]);
      bomb_id := lbTempIdAll.Items[i];
      bomb_name := lbAllBomb.Items[i];
    end;

    for I :=lbAllBomb.Items.Count - 1 downto 0 do
    if lbAllBomb.Selected[I] then
    begin
      lbAllBomb.Items.Delete(I);
      lbTempIdAll.Items.Delete(I);
    end;

    with bomb.FPoint.FData do begin
      Instance_Identifier := bomb_name;
      if fVehiclePicklistFilter.id_vehicle <> '' then
        Vehicle_Index := StrToInt(fVehiclePicklistFilter.id_vehicle)
      else
        Vehicle_index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;

      Bomb_Index     := StrToInt(bomb_id);
      Instance_Type := 0;
      Mount_Type    := 0;
      Quantity      := 0;
    end;

    dmTTT.InsertPoint_Effect_On_Board(IntToStr(bomb.FPoint.FData.Bomb_Index),2,bomb.FPoint);
    getBomb;
  end
  else
  begin
    for I := 0 to lbAllBomb.Items.Count - 1 do
    if lbAllBomb.Selected[I] then
    begin
      if lbBombSel.Count = 0 then
      begin
        lbBombSel.Items.Clear;
        lbBombSel.Items.Add(lbAllBomb.Items[I]);
      end
      else begin
        lbBombSel.Items.Add(lbAllBomb.Items[i]);
        lbAllBomb.Items.Add(lbBombSel.Items[0]);
        lbBombSel.Items.Delete(0);
      end;
    end;

    for I :=lbAllBomb.Items.Count - 1 downto 0 do
    if lbAllBomb.Selected[I] then
    begin
      lbAllBomb.Items.Delete(I);
      lbTempIdAll.Items.Delete(I);
    end;
  end;
end;

procedure TfBombDoublePickList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfBombDoublePickList.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfBombDoublePickList.btnRemoveClick(Sender: TObject);
var i:integer;
begin
  for I :=lbBombSel.Count - 1 downto 0 do
  if lbBombSel.Selected[I] then
  begin
    dmTTT.DeletePoint_Effect_On_Board(lbTempIdSel.Items[i]);
    lbBombSel.Items.Delete(I);
  end;

end;

procedure TfBombDoublePickList.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
  bList := TList.Create;
  bomb  := TBomb_Definition.Create;
end;

procedure TfBombDoublePickList.FormShow(Sender: TObject);
begin
  getBomb;
end;

procedure TfBombDoublePickList.getBomb;
var
  I: Integer;
begin

  lbAllBomb.Items.Clear;
  lbBombSel.Items.Clear;
  lbTempIdAll.Items.Clear;
  lbTempIdSel.Items.Clear;
  bList.Clear;

  dmTTT.GetBomb(0,mList,bomb);

  if fVehiclePicklistFilter.id_vehicle <> '' then
    dmTTT.GetBomb_OnBoard(StrToInt(fVehiclePicklistFilter.id_vehicle),bList)
  else
    dmTTT.GetBomb_OnBoard(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index,bList);

  for I := 0 to mList.Count - 1 do
  begin
    lbAllBomb.Items.Add(TBomb_Definition(mList[i]).FData.Bomb_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TBomb_Definition(mList[i]).FData.Bomb_Index));
  end;

  for I := 0 to bList.Count - 1 do
  begin
    lbBombSel.Items.Add(TBomb_Definition(bList[i]).FPoint.FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TBomb_Definition(bList[i]).FPoint.FData.Point_Effect_Index));
  end;


end;


end.
