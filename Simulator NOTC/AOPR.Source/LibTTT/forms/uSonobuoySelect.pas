unit uSonobuoySelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,uDBAsset_Sonobuoy;

type
  TfSonobuoy = class(TForm)
    lbAllSonobuoy: TListBox;
    btnAdd: TButton;
    shp1: TShape;
    btnRemove: TButton;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    btnOk: TButton;
    btnCancel: TButton;
    lbSonobuoySel: TListBox;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btnEditMount: TButton;
    procedure getRASonobuoy;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    fromAssetVehicle : boolean;
    sonobuoy_id : string;
    sonobuoy    : TSonobuoy_On_Board;
  end;

var
  fSonobuoy   : TfSonobuoy;
  sList,pList : TList;
  idSelect    : string;

implementation

{$R *.dfm}
uses uDataModuleTTT, uSimDBEditor, uResurceAllocationSelect,uSensorDoubleList,
  uResourceAllocation,uDBAssetObject, uInputName,uRAList, uSonobuoyWindow,
  ufDBEditor, uVehicleAttributeWindow;

procedure TfSonobuoy.getRASonobuoy;
var i   : integer;
    s   : string;

begin

//get all vehicle name
 if fromAssetVehicle then
 begin
   dmTTT.getAllSonobuoy_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, 0, sList);
   //cleare
   lbAllSonobuoy.Clear;
   lbTempIdAll.Clear;

   for I := 0 to sList.Count - 1 do
   begin
     lbAllSonobuoy.Items.Add(TSonobuoy_On_Board(sList[I]).FData.Instance_Identifier);
     lbTempIdAll.Items.Add(IntToStr(TSonobuoy_On_Board(sList).FData.Sonobuoy_Instance_Index));
   end;

 end
 else
 begin
   uSimDBEditor.getAllSonobuoy(0,sList,sonobuoy);
   if fRAList.RA_id <> '' then
      uSimDBEditor.getRA(3,StrToInt(fRAList.RA_id),ResourceAllocationForm.force,pList);


   lbAllSonobuoy.Items.Clear;
   lbSonobuoySel.Items.Clear;
   lbTempIdAll.Items.Clear;
   lbTempIdSel.Items.Clear;

    for I := 0 to sList.Count - 1 do
    begin
        lbAllSonobuoy.Items.Add(TSonobuoy_On_Board(sList[i]).FDef.Class_Identifier);
        lbTempIdAll.Items.Add(IntToStr(TSonobuoy_On_Board(sList[i]).FDef.Sonobuoy_Index));
    end;

    for I := 0 to pList.Count - 1 do begin
      lbSonobuoySel.Items.Add(TSonobuoy_On_Board(pList[i]).FPI.Instance_Name);
      lbTempIdSel.Items.Add(IntToStr(TSonobuoy_On_Board(pList[i]).FPI.Sonobuoy_Index));
    end;
 end;

end;

procedure TfSonobuoy.btnAddClick(Sender: TObject);
begin
  sonobuoy_id := lbTempIdAll.Items.Strings[lbAllSonobuoy.ItemIndex];
  ResourceAllocationForm.ra_index  := 4;
  fInputName.Show;
end;

procedure TfSonobuoy.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfSonobuoy.btnEditClick(Sender: TObject);
begin
  sonobuoy_id := lbTempIdAll.Items.Strings[lbAllSonobuoy.ItemIndex];
  with SonobuoyWindowForm do begin
    edtName.Text := lbAllSonobuoy.Items.Strings[lbAllSonobuoy.ItemIndex];
    //fSensor.;
    Show;
  end;

  Close;
end;

procedure TfSonobuoy.btnNewClick(Sender: TObject);
begin
  {fDBEditor.index := 1;
  fSonobuoy.NewDefinition; }
end;

procedure TfSonobuoy.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfSonobuoy.btnRemoveClick(Sender: TObject);
var rec:TPlatform_Instance;
i:integer;
begin
  idSelect := lbTempIdSel.Items.Strings[lbSonobuoySel.ItemIndex];

  for I :=0 to lbSonobuoySel.Count - 1 do
  if lbSonobuoySel.Selected[I] then
  begin
    lbSonobuoySel.Items.Delete(I);
    dmTTT.deletePlatformInstance(lbTempIdSel.Items[i]);
  end;
end;

procedure TfSonobuoy.FormShow(Sender: TObject);
begin
  getRASonobuoy;
end;

procedure TfSonobuoy.FormCreate(Sender: TObject);
begin
  pList   := Tlist.Create;
  sList   := TList.Create;
  sonobuoy    := TSonobuoy_On_Board.Create;
end;

end.
