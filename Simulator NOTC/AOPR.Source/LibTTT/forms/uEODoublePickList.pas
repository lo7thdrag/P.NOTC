unit uEODoublePickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfEODoublePickList = class(TForm)
    btnAdd: TButton;
    btnCancel: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lbAllEO: TListBox;
    lbEOSel: TListBox;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    shp1: TShape;
    btnEditMount: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditMountClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sList : TList;
    ssList : Tlist;
    procedure getEO;
  end;

var
  fEODoublePickList: TfEODoublePickList;

implementation

uses
  uDataModuleTTT, uElectroOpticalDetector, uDBAsset_Sensor,
  uVehicleAttributeWindow, uElectroOpticalDetectorMount;

{$R *.dfm}
procedure TfEODoublePickList.btnAddClick(Sender: TObject);
begin
  if lbAllEO.ItemIndex <> 0 then
  begin
    ElectroOpticalMountForm.eo := sList[lbAllEO.ItemIndex];
    with ElectroOpticalMountForm.eo do
    begin
      FData.Instance_Identifier := FEO_Def.Class_Identifier;
      FData.Instance_Type := FEO_Def.Sensor_Type;
      FData.Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
      FData.EO_Index := FEO_Def.EO_Index;
      FData.Antenna_Height := 0;
    end;
    dmTTT.insertEO(ElectroOpticalMountForm.eo);
    lbEOSel.Items.Add(lbAllEO.Items[lbAllEO.ItemIndex]);
    lbTempIdSel.Items.Add(IntToStr(ElectroOpticalMountForm.eo.FData.EO_Instance_Index));
    Refresh;
  end;
  Self.FormShow(Self);
end;

procedure TfEODoublePickList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfEODoublePickList.btnCopyClick(Sender: TObject);
begin
  if lbAllEO.ItemIndex <> -1 then
  begin
    ElectroOpticalForm.isCopy := True;
    ElectroOpticalForm.EOObject := ssList[lbAllEO.ItemIndex];
  end;
end;

procedure TfEODoublePickList.btnEditClick(Sender: TObject);
begin
  if lbAllEO.ItemIndex <> -1 then
  begin
    ElectroOpticalForm.isEdit := True;
    ElectroOpticalForm.EOObject := ssList[lbAllEO.ItemIndex];
  end;
end;

procedure TfEODoublePickList.btnEditMountClick(Sender: TObject);
begin
  if lbEOSel.ItemIndex <> -1 then
  begin
    ElectroOpticalMountForm.eo := ssList[lbEOSel.ItemIndex];
    ElectroOpticalMountForm.Show;
  end;
end;

procedure TfEODoublePickList.btnNewClick(Sender: TObject);
begin
  with ElectroOpticalForm do begin
    isNew := True;
    edtClass.Text            := '';
    edtMaxPossible.Text      := '';
    edtAssociatedCross.Text  := '';
    edtDetectionRange.Text   := '';
    Show;
  end;
end;

procedure TfEODoublePickList.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfEODoublePickList.btnRemoveClick(Sender: TObject);
begin
  if lbEOSel.ItemIndex <> -1 then
  begin
    dmTTT.DeleteEO_On_Board(lbTempIdSel.Items[lbEOSel.ItemIndex], ElectroOpticalMountForm.eo);
    lbTempIdSel.ItemIndex := lbEOSel.ItemIndex;
    lbEOSel.DeleteSelected;
    lbTempIdSel.DeleteSelected;
  end;
end;

procedure TfEODoublePickList.FormShow(Sender: TObject);
begin
  getEO;
end;

procedure TfEODoublePickList.getEO;
var int:integer;
    rAll, rEODef: integer;
begin

//get all sonar name
 rEODef := dmTTT.getEO_Def(0,sList,ElectroOpticalForm.EOObject);
 rAll := dmTTT.getAllEO_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index,
  0, ssList);

 lbAllEO.Items.Clear;
 lbTempIdAll.Items.Clear;
 lbEOSel.Clear;
 lbTempIdSel.Clear;

 if rEODef > 0 then
   for int := 0 to sList.Count - 1 do
   begin
      lbAllEO.Items.Add(TEO_On_Board(sList[int]).FEO_Def.Class_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TEO_On_Board(sList[int]).FEO_Def.EO_Index));
   end;

 if rAll > 0  then
   for int := 0 to ssList.Count - 1 do
   begin
      lbEOSel.Items.Add(TEO_On_Board(ssList[int]).FData.Instance_Identifier);
      lbTempIdSel.Items.Add(IntToStr(TEO_On_Board(ssList[int]).FData.EO_Instance_Index));
   end;

end;

end.
