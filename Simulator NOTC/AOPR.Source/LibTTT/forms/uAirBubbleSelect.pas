unit uAirBubbleSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TfAirBubbleSelect = class(TForm)
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

    procedure getAirBubble;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    air_bubble  : TAir_Bubble_Mount;
    mList,pList : TList;
    air_id      : string;
  end;

var
  fAirBubbleSelect: TfAirBubbleSelect;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehicleAttributeWindow,uVehiclePicklistFilter,
uAirBubbleMounts;

procedure TfAirBubbleSelect.btn1Click(Sender: TObject);
begin
  AirBubblesMounts.air_bubble := pList[lbMissileSel.ItemIndex];
  AirBubblesMounts.Show;
end;

procedure TfAirBubbleSelect.btnAddClick(Sender: TObject);
var i    :integer;
air_name : string;
begin

   for I := 0 to lbAllMissile.Items.Count - 1 do
   begin
     if lbAllMissile.Selected[I] then
     begin
        lbMissileSel.Items.Add(lbAllMissile.Items[i]);
        lbTempIdSel.Items.Add(lbTempIdAll.Items[i]);
        air_id := lbTempIdAll.Items[i];
        air_name := lbAllMissile.Items[i];
     end;
   end;

   for I :=lbAllMissile.Items.Count - 1 downto 0 do
   if lbAllMissile.Selected[I] then
   begin
    lbAllMissile.Items.Delete(I);
    lbTempIdAll.Items.Delete(I);
   end;

   with air_bubble.FData do
   begin
      Instance_Identifier := air_name;
      if fVehiclePicklistFilter.id_vehicle <> '' then
        Vehicle_Index := StrToInt(fVehiclePicklistFilter.id_vehicle)
      else
        Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
      Air_Bubble_Index  := StrToInt(air_id);
      Instance_Type := 0;
      Bubble_Qty_On_Board := 0;
   end;

   dmTTT.insertAir_Bubble(air_bubble);
   getAirBubble;

end;

procedure TfAirBubbleSelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfAirBubbleSelect.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfAirBubbleSelect.btnRemoveClick(Sender: TObject);
var i:integer;
begin
 for I :=lbMissileSel.Count - 1 downto 0 do
 if lbMissileSel.Selected[I] then
 begin
    dmTTT.DeleteAir_Bubble_Mount(lbTempIdSel.Items[i]);
    lbMissileSel.Items.Delete(I);
 end;

end;

procedure TfAirBubbleSelect.FormCreate(Sender: TObject);
begin
  air_bubble := TAir_Bubble_Mount.Create;
  mList      := TList.Create;
  pList      := TList.Create;
end;

procedure TfAirBubbleSelect.FormShow(Sender: TObject);
begin
  getAirBubble;
end;

procedure TfAirBubbleSelect.getAirBubble;
var
  i: Integer;
begin

  lbAllMissile.Items.Clear;
  lbMissileSel.Items.Clear;
  lbTempIdAll.Items.Clear;
  lbTempIdSel.Items.Clear;
  pList.Clear;

  dmTTT.getAir_Bubble_Def(0,mList,air_bubble);

  if fVehiclePicklistFilter.id_vehicle <> '' then
    dmTTT.getAir_Buble_Mount(StrToInt(fVehiclePicklistFilter.id_vehicle),pList)
  else
    dmTTT.getAir_Buble_Mount(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index,pList);

  for i := 0 to mList.Count - 1 do
  begin

    lbAllMissile.Items.Add(TAir_Bubble_Mount(mList[i]).FAirBubble_Def.Air_Bubble_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TAir_Bubble_Mount(mList[i]).FAirBubble_Def.Air_Bubble_Index));
  end;

  for I := 0 to pList.Count - 1 do
  begin
    lbMissileSel.Items.Add(TAir_Bubble_Mount(pList[i]).FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TAir_Bubble_Mount(pList[i]).FData.Air_Bubble_Instance_Index));
  end;
end;


end.
