unit uSensorDoubleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfSensor = class(TForm)
    lbAllSensor: TListBox;
    lbsensorSel: TListBox;
    shp1: TShape;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempIdAll: TListBox;
    btnAdd: TButton;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;

    procedure getAllSensor;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idSensor : string;
  end;

var
  fSensor: TfSensor;


implementation

{$R *.dfm}

uses uDBAsset_Sensor,uDataModuleTTT,uVehiclePicklistFilter,uDBAsset_Radar,
uDBAsset_Sonobuoy,uDBAsset_Sonar;

procedure TfSensor.btnAddClick(Sender: TObject);
var i :integer;
begin
  for I := 0 to lbAllSensor.Items.Count - 1 do
   if lbAllSensor.Selected[I] then
   begin
    if lbsensorSel.Count = 0 then
      begin
        lbsensorSel.Items.Clear;
        lbsensorSel.Items.Add(lbAllSensor.Items[I]);
        idSensor :=lbTempIdAll.Items[I];
      end
    else begin
      lbsensorSel.Items.Add(lbAllSensor.Items[i]);
      lbAllSensor.Items.Add(lbsensorSel.Items[0]);
      lbsensorSel.Items.Delete(0);
      idSensor :=lbTempIdAll.Items[I];
    end;
   end;

 for I :=lbAllSensor.Items.Count - 1 downto 0 do
   if lbAllSensor.Selected[I] then
   begin
    lbAllSensor.Items.Delete(I);
    lbTempIdAll.Items.Delete(I);
   end;

end;

procedure TfSensor.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfSensor.btnOkClick(Sender: TObject);
begin
  idSensor := lbTempIdAll.Items.Strings[lbsensorSel.ItemIndex];
  fVehiclePicklistFilter.edtFiltersensorOnBoard.Text := lbsensorSel.Items.Strings[lbsensorSel.ItemIndex];
  Close;
  fVehiclePicklistFilter.getSensor;
end;

procedure TfSensor.btnRemoveClick(Sender: TObject);
var i:integer;
begin
  for I := 0 to lbsensorSel.Items.Count - 1 do
   if lbsensorSel.Selected[I] then
   begin
    lbAllSensor.Items.Add(lbsensorSel.Items[I]);
    lbTempIdAll.Items.Add(idSensor);
   end;

 for I :=lbsensorSel.Items.Count - 1 downto 0 do
   if lbsensorSel.Selected[I] then
   begin
    lbsensorSel.Items.Delete(I);
    idSensor := '';
   end;
end;

procedure TfSensor.FormShow(Sender: TObject);
begin
  getAllSensor;
end;

procedure TfSensor.getAllSensor;
var i:integer;
begin
  lbAllSensor.Items.Clear;
  lbTempIdAll.Items.Clear;

 for i := 0 to fVehiclePicklistFilter.sList.Count - 1 do
 begin
    if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 0 then
    begin
      lbAllSensor.Items.Add(TEO_On_Board(fVehiclePicklistFilter.sList[i]).FData.Instance_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TEO_On_Board(fVehiclePicklistFilter.sList[i]).FData.EO_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 1 then
    begin
      lbAllSensor.Items.Add(TESM_On_Board(fVehiclePicklistFilter.sList[i]).FData.Instance_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TESM_On_Board(fVehiclePicklistFilter.sList[i]).FData.ESM_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 2 then
    begin
      lbAllSensor.Items.Add(TIFF_Sensor_On_Board(fVehiclePicklistFilter.sList[i]).FData.Instance_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TIFF_Sensor_On_Board(fVehiclePicklistFilter.sList[i]).FData.IFF_Instance_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 3 then
    begin
      lbAllSensor.Items.Add(TMAD_Sensor_On_Board(fVehiclePicklistFilter.sList[i]).FData.Instance_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TMAD_Sensor_On_Board(fVehiclePicklistFilter.sList[i]).FData.MAD_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 4 then
    begin
      lbAllSensor.Items.Add(TRadar_On_Board(fVehiclePicklistFilter.sList[i]).FData.Instance_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TRadar_On_Board(fVehiclePicklistFilter.sList[i]).FData.Radar_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 5 then
    begin
      lbAllSensor.Items.Add(TSonar_On_Board(fVehiclePicklistFilter.sList[i]).FData.Instance_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TSonar_On_Board(fVehiclePicklistFilter.sList[i]).FData.Sonar_Index));
    end
    else if fVehiclePicklistFilter.cbbFilterSensorType.ItemIndex = 6 then
    begin
      lbAllSensor.Items.Add(TSonobuoy_On_Board(fVehiclePicklistFilter.sList[i]).FData.Instance_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TSonobuoy_On_Board(fVehiclePicklistFilter.sList[i]).FData.Sonobuoy_Index));
    end
    else begin
      lbAllSensor.Items.Add(TVisual_Sensor_On_Board(fVehiclePicklistFilter.sList[i]).FData.Instance_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TVisual_Sensor_On_Board(fVehiclePicklistFilter.sList[i]).FData.Vehicle_Index));
    end;
 end;
end;

end.
