unit uGunSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uDBAsset_Weapon;

type
  TfGunSelect = class(TForm)
    btnAdd: TButton;
    btnCancel: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lbAllGun: TListBox;
    lbGunSel: TListBox;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    shp1: TShape;
    btn1: TButton;

    procedure getGun;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    { Private declarations }
    mList,gList :TList;
  public
    { Public declarations }
    gun : TGun_Definition;
    gun_id : string;
  end;

var
  fGunSelect: TfGunSelect;

implementation

{$R *.dfm}

uses uDataModuleTTT,uVehicleAttributeWindow, uVehiclePicklistFilter, uGunMount;

procedure TfGunSelect.btn1Click(Sender: TObject);
begin
   if fVehicleAttributeWindow.fromVehicle then
  begin
    GunMountForm.gun := TGun_Definition(gList[lbGunSel.ItemIndex]);
    GunMountForm.Show;
  end;

end;

procedure TfGunSelect.btnAddClick(Sender: TObject);
var i:integer;
gun_name : String;
begin
  if fVehicleAttributeWindow.fromVehicle then
  begin
    for I := 0 to lbAllGun.Items.Count - 1 do
    if lbAllGun.Selected[I] then
    begin
      lbGunSel.Items.Add(lbAllGun.Items[i]);
      lbTempIdSel.Items.Add(lbTempIdAll.Items[0]);
      gun_id := lbTempIdAll.Items[i];
      gun_name := lbAllGun.Items[i];
    end;

    for I :=lbAllGun.Items.Count - 1 downto 0 do
    if lbAllGun.Selected[I] then
    begin
      lbAllGun.Items.Delete(I);
      lbTempIdAll.Items.Delete(I);
    end;

    with gun.FPoint.FData do begin
      Instance_Identifier := gun_name;
      if fVehiclePicklistFilter.id_vehicle <> '' then
        Vehicle_Index := StrToInt(fVehiclePicklistFilter.id_vehicle)
      else
        Vehicle_index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;

      Gun_Index     := StrToInt(gun_id);
      Instance_Type := 0;
      Mount_Type    := 0;
      Quantity      := 0;
    end;

    dmTTT.InsertPoint_Effect_On_Board(IntToStr(gun.FPoint.FData.Gun_Index),1,gun.FPoint);
    getGun;
  end
  else
  begin
    for I := 0 to lbAllGun.Items.Count - 1 do
    if lbAllGun.Selected[I] then
    begin
      if lbGunSel.Count = 0 then
      begin
        lbGunSel.Items.Clear;
        lbGunSel.Items.Add(lbAllGun.Items[I]);
      end
      else begin
        lbGunSel.Items.Add(lbAllGun.Items[i]);
        lbAllGun.Items.Add(lbGunSel.Items[0]);
        lbGunSel.Items.Delete(0);
      end;
    end;

    for I :=lbAllGun.Items.Count - 1 downto 0 do
    if lbAllGun.Selected[I] then
    begin
      lbAllGun.Items.Delete(I);
      lbTempIdAll.Items.Delete(I);
    end;
  end;
end;

procedure TfGunSelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfGunSelect.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfGunSelect.btnRemoveClick(Sender: TObject);
var i:integer;
begin
  for I :=lbGunSel.Count - 1 downto 0 do
  if lbGunSel.Selected[I] then
  begin
    dmTTT.DeletePoint_Effect_On_Board(lbTempIdSel.Items[i]);
    lbGunSel.Items.Delete(I);
  end;
end;

procedure TfGunSelect.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
  gList := TList.Create;
  gun   := TGun_Definition.Create;
end;

procedure TfGunSelect.FormShow(Sender: TObject);
begin
  getGun;
end;

procedure TfGunSelect.getGun;
var
  I: Integer;
begin

  lbAllGun.Items.Clear;
  lbGunSel.Items.Clear;
  lbTempIdAll.Items.Clear;
  lbTempIdSel.Items.Clear;
  gList.Clear;

  dmTTT.GetGun(0,mList,gun);

  if fVehiclePicklistFilter.id_vehicle <> '' then
    dmTTT.GetGun_OnBoard(StrToInt(fVehiclePicklistFilter.id_vehicle),gList)
  else
    dmTTT.GetGun_OnBoard(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index,gList);

  for I := 0 to mList.Count - 1 do
  begin
    lbAllGun.Items.Add(TGun_Definition(mList[i]).FData.Gun_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TGun_Definition(mList[i]).FData.Gun_Index));
  end;

  for i := 0 to gList.Count - 1 do
  begin
    lbGunSel.Items.Add(TGun_Definition(gList[i]).FPoint.FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TGun_Definition(gList[i]).FPoint.FData.Point_Effect_Index));
  end;

end;


end.
