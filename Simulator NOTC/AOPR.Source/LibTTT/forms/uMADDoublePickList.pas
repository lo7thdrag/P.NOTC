unit uMADDoublePickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfMADDoublePickList = class(TForm)
    btnAdd: TButton;
    btnCancel: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lbAllMAD: TListBox;
    lbMADSel: TListBox;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    shp1: TShape;
    btnEditMount: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditMountClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    public sList : TList;
    public ssList : TList;
    id_mad : String;
    procedure getMAD;
    procedure setDefaultMADOnBoard;
    procedure MAD_Def;
  end;

var
  fMADDoublePickList: TfMADDoublePickList;

implementation

uses
  uMADWindow, uDataModuleTTT, uDBAsset_Sensor, uVehicleAttributeWindow, uMAD;

{$R *.dfm}
procedure TfMADDoublePickList.btnAddClick(Sender: TObject);
begin
  if lbAllMAD.ItemIndex <> -1 then
  begin
    if not Assigned(MADMount.MAD) then
    begin
      MADMount.MAD := TMAD_Sensor_On_Board.Create;
    end;
    setDefaultMADOnBoard;
    dmTTT.insertMAD(MADMount.MAD);
    lbMADSel.Items.Add(lbAllMAD.Items[lbAllMAD.ItemIndex]);
    lbTempIdSel.Items.Add(IntToStr(MADMount.MAD.FData.MAD_Instance_Index));
    Refresh;
  end;
end;

procedure TfMADDoublePickList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfMADDoublePickList.btnEditClick(Sender: TObject);
begin
  MADForm.isCopy := False;
  id_mad  := lbTempIdAll.Items.Strings[lbAllMAD.ItemIndex];
  MAD_Def;
  MADForm.Show;
end;

procedure TfMADDoublePickList.btnEditMountClick(Sender: TObject);
begin
  if lbMADSel.ItemIndex <> -1 then
  begin
    MADMount.MAD := ssList[lbMADSel.ItemIndex];
    with MADMount do
    begin
       state := isEdit;
       Show;
    end;
  end;
end;

procedure TfMADDoublePickList.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfMADDoublePickList.btnRemoveClick(Sender: TObject);
begin
  if lbMADSel.ItemIndex <> -1 then
  begin
    dmTTT.DeleteMAD_Sensor_On_Board(lbTempIdSel.Items[lbMADSel.ItemIndex], MADMount.MAD);
    lbMADSel.DeleteSelected;
    lbTempIdSel.ItemIndex := lbMADSel.ItemIndex;
    lbTempIdSel.DeleteSelected;
  end;
end;

procedure TfMADDoublePickList.FormCreate(Sender: TObject);
begin
  sList := TList.Create;
  ssList := TList.Create;
end;

procedure TfMADDoublePickList.FormShow(Sender: TObject);
begin
  getMAD;
end;

procedure TfMADDoublePickList.getMAD;
var i:integer;
begin
 dmTTT.getMAD_Def(0,sList,MADForm.MADObject);
 dmTTT.getAllMAD_Sensor_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, 0, ssList);

 lbAllMAD.Items.Clear;
 lbTempIdAll.Items.Clear;

 for i := 0 to sList.Count - 1 do
 begin
    lbAllMAD.Items.Add(TMAD_Sensor_On_Board(sList[I]).FMAD_Def.Class_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TMAD_Sensor_On_Board(sList[I]).FMAD_Def.MAD_Index));
 end;

 for I := 0 to ssList.Count - 1 do
 begin
   lbMADSel.Items.Add(TMAD_Sensor_On_Board(ssList[I]).FData.Instance_Identifier);
   lbTempIdSel.Items.Add(IntToStr(TMAD_Sensor_On_Board(ssList[I]).FData.MAD_Instance_Index));
 end;
end;

procedure TfMADDoublePickList.setDefaultMADOnBoard;
begin
  MADMount.MAD := TMAD_Sensor_On_Board(sList[lbAllMAD.ItemIndex]);
  with MADMount.MAD do
  begin
    FData.Instance_Identifier := FMAD_Def.Class_Identifier;
    FData.Instance_Type := 0;
    FData.Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    FData.MAD_Index := FMAD_Def.MAD_Index;
    FData.Antenna_Height := 0;
  end;
end;

procedure TfMADDoublePickList.MAD_Def;
var i:integer;
begin

  dmTTT.getMAD_Def(StrToInt(id_mad),sList,MADForm.MADObject);

  for I := 0 to sList.Count - 1 do
  begin
    with MADForm do begin
      if isCopy then
      begin
        edtClass.Text              := 'Copy of ' + TMAD_Sensor_On_Board(sList[i]).FMAD_Def.Class_Identifier;
        isNew := True;
      end
      else
        edtClass.Text              := TMAD_Sensor_On_Board(sList[i]).FMAD_Def.Class_Identifier;
      edtBaselineDetection.Text  := FloatToStr(TMAD_Sensor_On_Board(sList[i]).FMAD_Def.Baseline_Detect_Range);
      edtAssociatedCross.Text    := FloatToStr(TMAD_Sensor_On_Board(sList[i]).FMAD_Def.Known_Cross_Section);
    end;

  end;
end;

end.
