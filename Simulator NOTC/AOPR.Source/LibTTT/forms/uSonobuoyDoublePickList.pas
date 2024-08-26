unit uSonobuoyDoublePickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfSonobuoyDoublePickList = class(TForm)
    btnAdd: TButton;
    btnCancel: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lbAllMissile: TListBox;
    lbMissileSel: TListBox;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    shp1: TShape;
    btnEditMount: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditMountClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sList : Tlist;
    ssList : Tlist;
    id_sonobuoy : string;
    procedure getSonobuoy;
    procedure getDataSonobuoy;
  end;

var
  fSonobuoyDoublePickList: TfSonobuoyDoublePickList;

implementation

uses
  uDataModuleTTT, uSimDBEditor, uSonobuoyWindow, uDBAsset_Sonobuoy,
  uVehicleAttributeWindow, uSonobuoyMount;

{$R *.dfm}

procedure TfSonobuoyDoublePickList.btnAddClick(Sender: TObject);
begin
  if lbAllMissile.ItemIndex <> -1 then
  begin
    SonobuoyWindowForm.sonobuoyobject := sList[lbAllMissile.ItemIndex];
    with SonobuoyWindowForm.sonobuoyobject do
    begin
      FData.Instance_Identifier := FDef.Class_Identifier;
      FData.Instance_Type := FDef.Sonobuoy_Type;
      FData.Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
      FData.Sonobuoy_Index := FDef.Sonobuoy_Index;
      FData.Quantity := 0;
      FData.Sonar_Instance_Index := FDef.Sonar_Index;
    end;
    dmTTT.InsertSonobuoy_On_Board(IntToStr(SonobuoyWindowForm.sonobuoyobject.FData.Sonobuoy_Instance_Index), SonobuoyWindowForm.sonobuoyobject);
    SElf.FormShow(Sender);
  end;
end;

procedure TfSonobuoyDoublePickList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfSonobuoyDoublePickList.btnCopyClick(Sender: TObject);
begin
  SonobuoyWindowForm.isCopy := True;
  getDataSonobuoy;
end;

procedure TfSonobuoyDoublePickList.getDataSonobuoy;
begin
  if lbAllMissile.ItemIndex <> -1 then
      SonobuoyWindowForm.sonobuoyobject := sList[lbAllMissile.ItemIndex];
  id_sonobuoy := lbTempIdAll.Items.Strings[lbAllMissile.ItemIndex];
  SonobuoyWindowForm.isNew := false;
  SonobuoyWindowForm.Show;
end;

procedure TfSonobuoyDoublePickList.btnEditClick(Sender: TObject);
begin
  SonobuoyWindowForm.isCopy := False;
  getDataSonobuoy;
end;

procedure TfSonobuoyDoublePickList.btnEditMountClick(Sender: TObject);
begin
  if lbMissileSel.ItemIndex <> -1 then
  begin
    SonobuoyMountForm.sono := ssList[lbMissileSel.ItemIndex];
    SonobuoyMountForm.Show;
  end;
end;

procedure TfSonobuoyDoublePickList.btnNewClick(Sender: TObject);
begin
  SonobuoyWindowForm.isNew := true;
  SonobuoyWindowForm.Show;
end;

procedure TfSonobuoyDoublePickList.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfSonobuoyDoublePickList.btnRemoveClick(Sender: TObject);
begin
  if lbMissileSel.ItemIndex <> -1 then
  begin
    dmTTT.DeleteSonobuoy_On_Board(lbTempIdSel.Items[lbMissileSel.ItemIndex], SonobuoyMountForm.sono);
    Self.FormShow(Sender);
  end;

end;

procedure TfSonobuoyDoublePickList.FormCreate(Sender: TObject);
begin
  sList := Tlist.Create;
  ssList := TList.Create;
end;

procedure TfSonobuoyDoublePickList.FormShow(Sender: TObject);
begin
  getSonobuoy;
end;

procedure TfSonobuoyDoublePickList.getSonobuoy;
Var
  I : Integer;
begin
  lbAllMissile.Clear;
  lbMissileSel.Clear;
  lbTempIdAll.Clear;
  lbTempIdSel.Clear;

  uSimDBEditor.getAllSonobuoy(0,slist,SonobuoyWindowForm.sonobuoyobject);
  dmTTT.getAllSonobuoy_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, 0, ssList);

  for I := 0 to sList.Count - 1 do begin
    lbAllMissile.Items.Add(TSonobuoy_On_Board(sList[i]).FDef.Class_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TSonobuoy_On_Board(sList[i]).FDef.Sonobuoy_Index));
  end;

  for I := 0 to ssList.Count - 1 do
  begin
    lbMissileSel.Items.Add(TSonobuoy_On_Board(ssList[I]).FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TSonobuoy_On_Board(ssList[I]).FData.Sonobuoy_Instance_Index));
  end;
end;

end.
