unit uMotionDoubleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,uDBAsset_MotionCharacteristics, uDBAssetObject;

type
  TfMotionDouble = class(TForm)
    lbAllMotion: TListBox;
    lbMotionSelect: TListBox;
    lbTempIdAll: TListBox;
    shp1: TShape;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    btCopy: TButton;
    btEdit: TButton;
    btNew: TButton;
    lbTempId: TListBox;

    procedure getMotion;
    procedure showMotion;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure lbAllMotionDblClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    mId : string;
    motion : TMotion_Characteristics;
    show_from : Integer;

    procedure getDataMotion;
  end;

var
  fMotionDouble: TfMotionDouble;
  pList,vList  : TList;

implementation

{$R *.dfm}
uses uSimDBEditor,ufrmSummaryMotion,ufrmSummaryVehicle,
ufrmSummaryMissile, ufrmSummaryTorpedo;

procedure TfMotionDouble.btCopyClick(Sender: TObject);
begin
//  frmSummaryMotion.isCopy := True;
//  frmSummaryMotion.fromVehicle  := True;
//  frmSummaryMotion.Horizontal.PageControl.ActivePageIndex := 0;
  getDataMotion;
end;

procedure TfMotionDouble.getDataMotion;
begin
  if lbAllMotion.Selected[lbAllMotion.ItemIndex] then
  begin
    with frmSummaryMotion do begin
//      isNew := false;
//      idMotion := StrToInt(lbTempIdAll.Items.Strings[lbAllMotion.ItemIndex]);
//      if isCopy then
//      begin
//        edtName.Text := 'Copy of '+ lbAllMotion.Items.Strings[lbAllMotion.ItemIndex];
//        isNew := True;
//      end
//      else
//        edtName.Text := lbAllMotion.Items.Strings[lbAllMotion.ItemIndex];

      refresh;
      ShowModal;
    end;
  end;
end;

procedure TfMotionDouble.btEditClick(Sender: TObject);
begin
//  frmSummaryMotion.isCopy := False;
//  frmSummaryMotion.fromVehicle  := True;
//  frmSummaryMotion.Horizontal.PageControl.ActivePageIndex := 0;
  getDataMotion;
end;

procedure TfMotionDouble.btnAddClick(Sender: TObject);
begin
  if lbAllMotion.ItemIndex <> -1 then
  begin
    lbMotionSelect.Clear;
    lbTempId.Clear;
    lbMotionSelect.Items.Add(lbAllMotion.Items.Strings[lbAllMotion.ItemIndex]);
    lbTempId.Items.Add(lbTempIdAll.Items.Strings[lbAllMotion.ItemIndex]);
    mId := lbTempIdAll.Items.Strings[lbAllMotion.ItemIndex];
    showMotion;
  end;
end;

procedure TfMotionDouble.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfMotionDouble.btNewClick(Sender: TObject);
begin
//  frmSummaryMotion.isNew := True;
//  frmSummaryMotion.GetNew;
//  frmSummaryMotion.fromVehicle  := True;
//  frmSummaryMotion.Horizontal.PageControl.ActivePageIndex := 0;
  frmSummaryMotion.ShowModal;
end;

procedure TfMotionDouble.btnOkClick(Sender: TObject);
begin
  if lbMotionSelect.Count > 0 then
  begin
    if show_from = fromVehicle then
    begin
      frmSummaryVehicle.edtMotionCharacterictic.Text := lbMotionSelect.Items.Strings[0];
//      frmSummaryVehicle.id_motion := StrToInt(mId);
    end;
    if show_from = fromMissile then
    begin
      frmSummaryMissile.edtMotionCharacteristic.Text := lbMotionSelect.Items.Strings[0];
//      frmSummaryMissile.id_motion := StrToInt(mId);
    end;
    if show_from = fromTorpedo then
    begin
//      frmSummaryTorpedo.edtMotionCharacteristic.Text := lbMotionSelect.Items.Strings[0];
//      frmSummaryTorpedo.id_motion := StrToInt(mId);
    end;
  end
  else begin
    if show_from = fromVehicle then
    begin
      frmSummaryVehicle.edtMotionCharacterictic.Text := '[None]';
//      frmSummaryVehicle.id_motion := 0;
    end;
    if show_from = fromMissile then
    begin
      frmSummaryMissile.edtMotionCharacteristic.Text := '[None]';
//      frmSummaryMissile.id_motion := 0;
    end;
    if show_from = fromTorpedo then
    begin
//      frmSummaryTorpedo.edtMotionCharacteristic.Text := '[None]';
//      frmSummaryTorpedo.id_motion := 0;
    end;
  end;

  Close;
end;

procedure TfMotionDouble.btnRemoveClick(Sender: TObject);
begin
  if lbMotionSelect.ItemIndex <> -1 then
  begin
    lbMotionSelect.Clear;
    lbTempId.Clear;
    mId := '1';
    showMotion;
  end
  else
    ShowMessage('Select List first');
end;

procedure TfMotionDouble.FormShow(Sender: TObject);
begin
  try
  getMotion;
  if show_from = fromVehicle then
    frmSummaryVehicle.edtMotionCharacterictic.Text := lbMotionSelect.Items.Strings[0];
  if show_from = fromMissile then
    frmSummaryMissile.edtMotionCharacteristic.Text:=lbMotionSelect.Items.Strings[0];
  if show_from = fromTorpedo then
//    frmSummaryTorpedo.edtMotionCharacteristic.Text:=lbMotionSelect.Items.Strings[0];
  frmSummaryMotion.cbxEnduranceType.ItemIndex := motion.FData.Endurance_Type;
//  frmSummaryMotion.cbxUnits.ItemIndex := motion.FData.Fuel_Unit_Type;
//  frmSummaryMotion.cbxType.ItemIndex := motion.FData.Motion_Type;
  Except
    ShowMessage('Please select Motion');
  end;
end;

procedure TfMotionDouble.getMotion;
begin
  pList := Tlist.Create;
  vList := TList.Create;

 lbAllMotion.Items.Clear;
 lbMotionSelect.Items.Clear;
 lbTempIdAll.Items.Clear;
 lbTempId.Items.Clear;
 pList.Clear;


//get all Motion name
 uSimDBEditor.getAllMotion_Characteristics(pList);

 if mId <> '' then
   uSimDBEditor.getMotion_Characteristics(StrToInt(mId),motion);

 showMotion;

end;

procedure TfMotionDouble.lbAllMotionDblClick(Sender: TObject);
begin
  btnAdd.Click;
end;

procedure TfMotionDouble.showMotion;
var i : integer;
begin
 lbAllMotion.Items.Clear;
 lbMotionSelect.Items.Clear;
 lbTempIdAll.Items.Clear;
 lbTempId.Items.Clear;

 for I := 0 to pList.Count - 1 do
 begin
  if mId = IntToStr(TMotion_Characteristics(pList[i]).FData.Motion_Index) then
  begin
    lbMotionSelect.Items.Add(TMotion_Characteristics(pList[i]).FData.Motion_Identifier);
    lbTempId.Items.Add(IntToStr(TMotion_Characteristics(pList[i]).FData.Motion_Index));
  end
  else begin
    lbAllMotion.Items.Add(TMotion_Characteristics(pList[i]).FData.Motion_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TMotion_Characteristics(pList[i]).FData.Motion_Index));
  end;
 end;

// if mId <> '' then
// begin
//   lbMotionSelect.Items.Add(motion.FData.Motion_Identifier);
//   lbTempId.Items.Add(IntToStr(motion.FData.Motion_Index));
// end;

end;

end.
