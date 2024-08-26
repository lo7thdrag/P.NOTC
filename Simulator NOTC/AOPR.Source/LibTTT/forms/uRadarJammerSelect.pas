unit uRadarJammerSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TfRadarJammerSelect = class(TForm)
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
    procedure btn1Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    jammer : TJammer_On_Board;
    mList,pList : TList;
    jammer_id : string;
  end;

var
  fRadarJammerSelect: TfRadarJammerSelect;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehicleAttributeWindow,uVehiclePicklistFilter, uRadarJammerMount;

procedure TfRadarJammerSelect.btn1Click(Sender: TObject);
begin
   RadarJammerMountForm.jammer := pList[lbMissileSel.ItemIndex];
   RadarJammerMountForm.Show;
end;


procedure TfRadarJammerSelect.btnAddClick(Sender: TObject);
var i :integer;
jammer_name : string;
begin
  for I := 0 to lbAllMissile.Items.Count - 1 do
  begin
    if lbAllMissile.Selected[I] then
    begin
      lbMissileSel.Items.Add(lbAllMissile.Items[i]);
      lbTempIdSel.Items.Add(lbTempIdAll.Items[i]);
      jammer_id := lbTempIdAll.Items[i];
      jammer_name := lbAllMissile.Items[i];
    end;
  end;

  for I :=lbAllMissile.Items.Count - 1 downto 0 do
  if lbAllMissile.Selected[I] then
  begin
    lbAllMissile.Items.Delete(I);
    lbTempIdAll.Items.Delete(I);
  end;

  with jammer.FData do
  begin
    Instance_Identifier := jammer_name;
    if fVehiclePicklistFilter.id_vehicle <> '' then
       Vehicle_Index := StrToInt(fVehiclePicklistFilter.id_vehicle)
    else
       Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    Jammer_Index   := StrToInt(jammer_id);
    Instance_Type  := 0;
    Antenna_Height := 0;
  end;

   dmTTT.insertJammer(jammer);
   getData;
end;

procedure TfRadarJammerSelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfRadarJammerSelect.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfRadarJammerSelect.btnRemoveClick(Sender: TObject);
var i:integer;
begin
  for I :=lbMissileSel.Count - 1 downto 0 do
 if lbMissileSel.Selected[I] then
 begin
    dmTTT.DeleteAir_Bubble_Mount(lbTempIdSel.Items[i]);
    lbMissileSel.Items.Delete(I);
 end;
end;

procedure TfRadarJammerSelect.FormCreate(Sender: TObject);
begin
  jammer := TJammer_On_Board.Create;
  mList  := TList.Create;
  pList  := TList.Create;;
end;

procedure TfRadarJammerSelect.FormShow(Sender: TObject);
begin
  getData;
end;

procedure TfRadarJammerSelect.getData;
var
  i: Integer;
begin

  lbAllMissile.Items.Clear;
  lbMissileSel.Items.Clear;
  lbTempIdAll.Items.Clear;
  lbTempIdSel.Items.Clear;
  pList.Clear;

  dmTTT.getJammer_Def(0,mList);

  if fVehiclePicklistFilter.id_vehicle <> '' then
    dmTTT.getJammer_OnBoard_Distinct(StrToInt(fVehiclePicklistFilter.id_vehicle),pList)
  else
    dmTTT.getJammer_OnBoard_Distinct(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index,pList);

  for i := 0 to mList.Count - 1 do
  begin
    lbAllMissile.Items.Add(TJammer_On_Board(mList[i]).FDef.Jammer_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TJammer_On_Board(mList[i]).FDef.Jammer_Index));
  end;

  for I := 0 to pList.Count - 1 do
  begin
    lbMissileSel.Items.Add(TJammer_On_Board(pList[i]).FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TJammer_On_Board(pList[i]).FData.Jammer_Instance_Index));
  end;
end;

end.
