unit uWeaponDoubleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfWeaponDoubleList = class(TForm)
    shp1: TShape;
    lbAllWeapon: TListBox;
    lbWeaponSel: TListBox;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempIdAll: TListBox;
    btnAdd: TButton;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure getAllWeapon;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idWeapon  : string;
  end;

var
  fWeaponDoubleList: TfWeaponDoubleList;

implementation

{$R *.dfm}
uses uVehiclePicklistFilter,uDataModuleTTT,uDBAsset_Weapon;

procedure TfWeaponDoubleList.btnAddClick(Sender: TObject);
var i :integer;
begin
  for I := 0 to lbAllWeapon.Items.Count - 1 do
   if lbAllWeapon.Selected[I] then
   begin
    if lbWeaponSel.Count = 0 then
      begin
        lbWeaponSel.Items.Clear;
        lbWeaponSel.Items.Add(lbAllWeapon.Items[I]);
        idWeapon :=lbTempIdAll.Items[I];
      end
    else begin
      lbWeaponSel.Items.Add(lbAllWeapon.Items[i]);
      lbAllWeapon.Items.Add(lbWeaponSel.Items[0]);
      //lbWeaponSel.Items.Delete(0);
      idWeapon :=lbTempIdAll.Items[I];
    end;
   end;

 for I :=lbAllWeapon.Items.Count - 1 downto 0 do
   if lbAllWeapon.Selected[I] then
   begin
    lbAllWeapon.Items.Delete(I);
    lbTempIdAll.Items.Delete(I);
   end;

end;

procedure TfWeaponDoubleList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfWeaponDoubleList.btnOkClick(Sender: TObject);
begin
  //idWeapon := lbTempIdAll.Items.Strings[lbAllWeapon.ItemIndex];
  fVehiclePicklistFilter.edtFilterWeaponOnBoar.Text := lbWeaponSel.Items.Strings[0];
  Close;
  fVehiclePicklistFilter.getWeapon;
end;

procedure TfWeaponDoubleList.btnRemoveClick(Sender: TObject);
var i:integer;
begin
  for I := 0 to lbWeaponSel.Items.Count - 1 do
   if lbWeaponSel.Selected[I] then
   begin
    lbAllWeapon.Items.Add(lbWeaponSel.Items[I]);
    lbTempIdAll.Items.Add(idWeapon);
   end;

 for I :=lbWeaponSel.Items.Count - 1 downto 0 do
   if lbWeaponSel.Selected[I] then
   begin
    lbWeaponSel.Items.Delete(I);
    idWeapon := '';
   end;

end;

procedure TfWeaponDoubleList.FormShow(Sender: TObject);
begin
  getAllWeapon;
end;

procedure TfWeaponDoubleList.getAllWeapon;
var i:integer;
begin
  lbAllWeapon.Items.Clear;
  lbTempIdAll.Items.Clear;


 for i := 0 to fVehiclePicklistFilter.wList.Count - 1 do
 begin
    if fVehiclePicklistFilter.cbbFilterWeaponType.ItemIndex = 0 then
    begin
      lbAllWeapon.Items.Add(TMine_On_Board(fVehiclePicklistFilter.wList[i]).FData.Instance_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TMine_On_Board(fVehiclePicklistFilter.wList[i]).FData.Mine_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterWeaponType.ItemIndex = 1 then
    begin
      lbAllWeapon.Items.Add(TMissile_On_Board(fVehiclePicklistFilter.wList[i]).FData.Instance_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TMissile_On_Board(fVehiclePicklistFilter.wList[i]).FData.Missile_Index));
    end
    else begin
      lbAllWeapon.Items.Add(TTorpedo_On_Board(fVehiclePicklistFilter.wList[i]).FData.Instance_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TTorpedo_On_Board(fVehiclePicklistFilter.wList[i]).FData.Torpedo_Index));
    end

 end;

end;

end.
