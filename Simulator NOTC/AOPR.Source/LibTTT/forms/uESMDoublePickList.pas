unit uESMDoublePickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfESMDoublePickList = class(TForm)
    btnAdd: TButton;
    btnCancel: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lbAllESM: TListBox;
    lbESMSel: TListBox;
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
    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pList : TList;
    spList: TList;
    procedure refresh;
    procedure setDefaulESMOnBoard;
    procedure setESMOnBoard;
    procedure getDataESM;
  end;

var
  fESMDoublePickList: TfESMDoublePickList;

implementation

uses uSimDBEditor, uDBAsset_Sensor, uDataModuleTTT, uVehicleAttributeWindow,
  uESMMount, uESMWindow;

{$R *.dfm}

procedure TfESMDoublePickList.btnAddClick(Sender: TObject);
begin
  if lbAllESM.ItemIndex <> -1 then
  begin
    //add
    setDefaulESMOnBoard;
    dmTTT.insertESM(ESMMountForm.esm);
    lbESMSel.Items.Add(lbAllESM.Items[lbAllESM.ItemIndex]);
    lbTempIdSel.Items.Add(IntToStr(ESMMountForm.esm.FData.ESM_Instance_Index));
    refresh;
  end;
end;

procedure TfESMDoublePickList.setDefaulESMOnBoard;
begin
  ESMMountForm.esm := TESM_On_Board(pList[lbAllESM.ItemIndex]);
  with ESMMountForm.esm do
  begin
    FData.Instance_Identifier := FESM_Def.Class_Identifier;
    FData.Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    FData.ESM_Index := FESM_Def.ESM_Index;
    FData.Instance_Type := 0;
  end;
end;

procedure TfESMDoublePickList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfESMDoublePickList.btnCopyClick(Sender: TObject);
begin
  fESMWindow.isCopy := True;
  getDataESM;
end;

procedure TfESMDoublePickList.btnEditClick(Sender: TObject);
begin
  fESMWindow.isCopy := False;
  getDataESM;
end;

procedure TfESMDoublePickList.getDataESM;
begin
  if lbAllESM.Selected[lbAllESM.ItemIndex] then
      fESMWindow.ESMobject := pList[lbAllESM.ItemIndex];
  fESMWindow.isNew := false;
  fESMWindow.Show;
end;

procedure TfESMDoublePickList.btnEditMountClick(Sender: TObject);
begin
  if lbESMSel.ItemIndex <> -1 then
  begin
    setESMOnBoard;
    with ESMMountForm do
    begin
      state := isEdit;
      Show;
    end;
  end;
end;

procedure TfESMDoublePickList.btnNewClick(Sender: TObject);
begin
  fESMWindow.isNew := true;
  fESMWindow.Show;
end;

procedure TfESMDoublePickList.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfESMDoublePickList.btnRemoveClick(Sender: TObject);
begin
  if lbESMSel.ItemIndex <> -1 then
  begin
    dmTTT.DeleteESM_On_Board(lbTempIdSel.Items[lbESMSel.ItemIndex], ESMMountForm.esm);
    lbESMSel.DeleteSelected;
    lbTempIdSel.ItemIndex := lbESMSel.ItemIndex;
    lbTempIdSel.DeleteSelected;
  end;
end;

procedure TfESMDoublePickList.setESMOnBoard;
begin
  ESMMountForm.esm := spList[lbESMSel.ItemIndex];
end;

procedure TfESMDoublePickList.FormCreate(Sender: TObject);
begin
  pList := TList.Create;
  spList := TList.Create;
end;

procedure TfESMDoublePickList.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfESMDoublePickList.refresh;
var i : integer;
begin

 uSimDBEditor.getAllESM_Definition(plist);
 dmTTT.getAllESM_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, 0, spList);

 lbAllESM.Clear;
 lbTempIdAll.Clear;
 lbESMSel.Clear;
 lbTempIdSel.Clear;

 for I := 0 to pList.Count - 1 do
 begin
   lbAllESM.Items.Add(TESM_On_Board(pList[I]).FESM_Def.Class_Identifier);
   lbTempIdAll.Items.Add(IntToStr(TESM_On_Board(pList[I]).FESM_Def.ESM_Index));
 end;

 for I := 0 to spList.Count - 1 do
 begin
   lbESMSel.items.Add(TESM_On_Board(spList[I]).FData.Instance_Identifier);
   lbTempIdSel.Items.Add(IntToStr(TESM_On_Board(spList[I]).FData.ESM_Instance_Index));
 end;

end;

end.
