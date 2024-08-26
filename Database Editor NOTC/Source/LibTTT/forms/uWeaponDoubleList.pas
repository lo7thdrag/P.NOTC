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
uses ufrmAvailableVehicle, uVehicleSelect, uDataModuleTTT,uDBAsset_Weapon;

procedure TfWeaponDoubleList.btnAddClick(Sender: TObject);

begin
  if lbAllWeapon.ItemIndex <> -1 then
  begin
    lbWeaponSel.Items.Clear;
    lbWeaponSel.Items.Add(lbAllWeapon.Items[lbAllWeapon.ItemIndex]);
    idWeapon := lbTempIdAll.Items[lbAllWeapon.ItemIndex];
  end;
end;

procedure TfWeaponDoubleList.btnCancelClick(Sender: TObject);
begin
//  frmAvailableVehicle.edtFilterWeaponOnBoar.Text := '[None]';
  fVehicleSelect.edtFilterWeaponOnBoar.Text := '[None]';
  Close;
end;

procedure TfWeaponDoubleList.btnOkClick(Sender: TObject);
begin
  if lbWeaponSel.Count <> 0 then
  begin
    idWeapon := lbTempIdAll.Items.Strings[lbAllWeapon.ItemIndex];
//    frmAvailableVehicle.edtFilterWeaponOnBoar.Text := lbWeaponSel.Items.Strings[0];
    fVehicleSelect.edtFilterWeaponOnBoar.Text := lbWeaponSel.Items.Strings[0];
  end
  else begin
    idWeapon := '';
//    frmAvailableVehicle.edtFilterWeaponOnBoar.Text := '[None]';
    fVehicleSelect.edtFilterWeaponOnBoar.Text := '[None]';
  end;
  Close;
//  frmAvailableVehicle.Filter;
  fVehicleSelect.Filter;
end;

procedure TfWeaponDoubleList.btnRemoveClick(Sender: TObject);
begin
  if lbWeaponSel.ItemIndex <> -1 then
  begin
    lbWeaponSel.Clear;
  end
  else
    ShowMessage('Select List first');
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

//  for i := 0 to frmAvailableVehicle.wList.Count - 1 do
//  begin
//    if frmAvailableVehicle.cbbFilterWeaponType.ItemIndex = 0 then
//    begin
//      lbAllWeapon.Items.Add(TMine_On_Board(frmAvailableVehicle.wList[i]).FMine_Def.Mine_Identifier);
//      lbTempIdAll.Items.Add(IntToStr(TMine_On_Board(frmAvailableVehicle.wList[i]).FMine_Def.Mine_Index));
//    end
//    else if frmAvailableVehicle.cbbFilterWeaponType.ItemIndex = 1 then
//    begin
//      lbAllWeapon.Items.Add(TMissile_On_Board(frmAvailableVehicle.wList[i]).FDef.Class_Identifier);
//      lbTempIdAll.Items.Add(IntToStr(TMissile_On_Board(frmAvailableVehicle.wList[i]).FDef.Missile_Index));
//    end
//    else begin
//      lbAllWeapon.Items.Add(TTorpedo_On_Board(frmAvailableVehicle.wList[i]).FDef.Class_Identifier);
//      lbTempIdAll.Items.Add(IntToStr(TTorpedo_On_Board(frmAvailableVehicle.wList[i]).FDef.Torpedo_Index));
//    end
//
//  end;

end;

end.
