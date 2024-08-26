unit UfRadarDoublePickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfRadarDoublePickList = class(TForm)
    btnAdd: TButton;
    btnCancel: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lbAllRadar: TListBox;
    lbRadarSel: TListBox;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    shp1: TShape;
    btnEditMount: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnEditMountClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pList : TList;
    rsList : TList;
    procedure refresh;
    procedure getDataRadar;
    procedure setDefaulRadarOnBoard;
    procedure setRadarOnBoard;
  end;

var
  fRadarDoublePickList: TfRadarDoublePickList;

implementation

uses uSimDBEditor, uDBAsset_Radar, uRadarSummary, uDataModuleTTT, uRadarMount,
  uVehicleAttributeWindow;

{$R *.dfm}

procedure TfRadarDoublePickList.btnAddClick(Sender: TObject);
begin
  if lbAllRadar.ItemIndex <> -1 then
  begin
    //add
    setDefaulRadarOnBoard;
    dmTTT.InsertRadar_On_Board(IntToStr(RadarMountForm.radarBoard.FData.Radar_Instance_Index), RadarMountForm.radarBoard);
    lbRadarSel.Items.Add(lbAllRadar.Items[lbAllRadar.ItemIndex]);
    lbTempIdSel.Items.Add(IntToStr(RadarMountForm.radarBoard.FData.Radar_Instance_Index));
    refresh;
  end;

end;

procedure TfRadarDoublePickList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfRadarDoublePickList.btnCopyClick(Sender: TObject);
begin
  if lbAllRadar.ItemIndex <> -1 then
  begin
    fRadarSummary.isCopy  := True;
    getDataRadar;
  end;
end;

procedure TfRadarDoublePickList.btnEditClick(Sender: TObject);
begin
  if lbAllRadar.ItemIndex <> -1 then
  begin
    fRadarSummary.isCopy  := False;
    getDataRadar;
  end;
end;

procedure TfRadarDoublePickList.btnEditMountClick(Sender: TObject);
begin
  if lbRadarSel.ItemIndex <> -1 then
  begin
    setRadarOnBoard;
    with RadarMountForm do
    begin
      state := isEdit;
      Show;
    end;
  end;
end;

procedure TfRadarDoublePickList.getDataRadar;
begin
  if lbAllRadar.Selected[lbAllRadar.ItemIndex] then
      fRadarSummary.radarobject := pList[lbAllRadar.ItemIndex];
  fRadarSummary.isNew := false;
  fRadarSummary.Show;
  //RadarMountForm.radarBoard := TRadar_On_Board(pList[lbAllRadar.ItemIndex]);
end;

procedure TfRadarDoublePickList.setDefaulRadarOnBoard;
begin
  RadarMountForm.radarBoard := TRadar_On_Board(pList[lbAllRadar.ItemIndex]);
  with RadarMountForm.radarBoard do
  begin
    FData.Instance_Identifier := FDef.Radar_Identifier;
    FData.Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    FData.Radar_Index := FDef.Radar_Index;
    FData.Instance_Type := 0;
  end;
end;

procedure TfRadarDoublePickList.setRadarOnBoard;
begin
  RadarMountForm.radarBoard := rsList[lbRadarSel.ItemIndex];
end;

procedure TfRadarDoublePickList.btnNewClick(Sender: TObject);
begin
  fRadarSummary.isNew := true;
  fRadarSummary.Show;
end;

procedure TfRadarDoublePickList.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfRadarDoublePickList.btnRemoveClick(Sender: TObject);
begin
  if lbRadarSel.ItemIndex <> -1 then
  begin
    dmTTT.DeleteRadar_On_Board(lbTempIdSel.Items[lbRadarSel.ItemIndex], RadarMountForm.radarBoard);
    lbTempIdSel.ItemIndex := lbRadarSel.ItemIndex;
    lbRadarSel.DeleteSelected;
    lbTempIdSel.DeleteSelected;
    refresh;
  end;
end;

procedure TfRadarDoublePickList.FormCreate(Sender: TObject);
begin
  pList := TList.Create;
  rsList := TList.Create;
end;

procedure TfRadarDoublePickList.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfRadarDoublePickList.refresh;
var i : integer;
begin

 uSimDBEditor.getAllRadar_Definition(plist);
 dmTTT.getAllRadar_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, 0, rsList);

 lbAllRadar.Items.Clear;
 lbTempidAll.Items.Clear;
 lbRadarSel.Items.Clear;
 lbTempIdSel.Items.Clear;

 for I := 0 to pList.Count - 1 do begin
  lbAllRadar.Items.Add(TRadar_On_Board(pList[i]).FDef.Radar_Identifier);
  lbTempidAll.Items.Add(IntToStr(TRadar_On_Board(pList[i]).FDef.Radar_Index));
 end;

 for I := 0 to rsList.Count - 1 do
 begin
  lbRadarSel.Items.Add(TRadar_On_Board(rsList[i]).FData.Instance_Identifier);
  lbTempIdSel.Items.Add(IntToStr(TRadar_On_Board(rsList[i]).FData.Radar_Instance_Index));
 end;

end;

end.
