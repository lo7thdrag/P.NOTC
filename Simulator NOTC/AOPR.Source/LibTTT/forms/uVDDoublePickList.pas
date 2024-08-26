unit uVDDoublePickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfVDDoublePickList = class(TForm)
    btnAdd: TButton;
    btnCancel: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lbAllVD: TListBox;
    lbVDSel: TListBox;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    shp1: TShape;
    btnEditMount: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vList : TList;
    procedure refresh;
  end;

var
  fVDDoublePickList: TfVDDoublePickList;

implementation

uses
  uDataModuleTTT, uVehicleAttributeWindow, uDBAsset_Sensor;

{$R *.dfm}

procedure TfVDDoublePickList.FormCreate(Sender: TObject);
begin
  vList := TList.Create;
end;

procedure TfVDDoublePickList.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfVDDoublePickList.refresh;
var
  I : Integer;
begin
  dmTTT.getAllVisual_Sensor_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, 0, vList);

  lbAllVD.Clear;
  lbVDSel.Clear;

  for I := 0 to vList.Count - 1 do
  begin
    lbAllVD.Items.Add(TVisual_Sensor_On_Board(vList[I]).FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TVisual_Sensor_On_Board(vList[I]).FData.Visual_Instance_Index));
  end;

end;

end.
