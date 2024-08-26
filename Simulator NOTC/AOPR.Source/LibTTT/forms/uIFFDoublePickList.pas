unit uIFFDoublePickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfIFFDoublePickList = class(TForm)
    btnAdd: TButton;
    btnCancel: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lbAllIFF: TListBox;
    lbIFFSel: TListBox;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    shp1: TShape;
    btnEditMount: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iList : TList;
    procedure refresh;
  end;

var
  fIFFDoublePickList: TfIFFDoublePickList;

implementation

uses
  uDataModuleTTT, uVehicleAttributeWindow, uDBAsset_Sensor;

{$R *.dfm}

procedure TfIFFDoublePickList.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfIFFDoublePickList.refresh;
var
  I: Integer;
begin
  dmTTT.getAllIFF_Sensor_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, 0, iList);

  lbAllIFF.Clear;
  lbTempIdAll.Clear;
  lbIFFSel.Clear;
  lbTempIdSel.Clear;

  for I := 0 to iList.Count - 1 do
  begin
    lbIFFSel.Items.Add(TIFF_Sensor_On_Board(iList[I]).FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TIFF_Sensor_On_Board(iList).FData.IFF_Instance_Index));
  end;

end;

end.
