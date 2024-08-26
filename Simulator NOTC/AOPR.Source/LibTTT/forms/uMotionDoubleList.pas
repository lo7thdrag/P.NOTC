unit uMotionDoubleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,uDBAsset_MotionCharacteristics;

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

    procedure getMotion;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    mId : string;
    motion : TMotion_Characteristics;
    procedure getDataMotion;
  end;

var
  fMotionDouble: TfMotionDouble;
  pList,vList  : TList;

implementation

{$R *.dfm}
uses uSimDBEditor,uMotion,uVehicleAttributeWindow,
uMissileSummary;

procedure TfMotionDouble.btCopyClick(Sender: TObject);
begin
  MotionHorizontalForm.isCopy := True;
  getDataMotion;
end;

procedure TfMotionDouble.getDataMotion;
begin
  if lbAllMotion.Selected[lbAllMotion.ItemIndex] then
  begin
    with MotionHorizontalForm do begin
      isNew := false;
      idMotion := StrToInt(lbTempIdAll.Items.Strings[lbAllMotion.ItemIndex]);
      if isCopy then
      begin
        edtName.Text := 'Copy of '+ lbAllMotion.Items.Strings[lbAllMotion.ItemIndex];
        isNew := True;
      end
      else
        edtName.Text := lbAllMotion.Items.Strings[lbAllMotion.ItemIndex];

      refresh;
      Show;
    end;
  end;
end;

procedure TfMotionDouble.btEditClick(Sender: TObject);
begin
  MotionHorizontalForm.isCopy := False;
  getDataMotion;
end;

procedure TfMotionDouble.btnAddClick(Sender: TObject);
begin
  lbMotionSelect.Items.Add(lbAllMotion.Items.Strings[lbAllMotion.ItemIndex]);
  mId := lbTempIdAll.Items.Strings[lbAllMotion.ItemIndex];
end;

procedure TfMotionDouble.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfMotionDouble.btNewClick(Sender: TObject);
begin
  MotionHorizontalForm.clear;
  MotionHorizontalForm.isNew := true;
  MotionHorizontalForm.Show;
end;

procedure TfMotionDouble.btnOkClick(Sender: TObject);
begin
  if fVehicleAttributeWindow.fromVehicle then
    fVehicleAttributeWindow.edtMotionCharacterictic.Text := lbMotionSelect.Items.Strings[0]
  else if fMissileSummary.fromMissile then
    fMissileSummary.edtMotionCharacteristic.Text := lbMotionSelect.Items.Strings[0];
  Close;
end;

procedure TfMotionDouble.btnRemoveClick(Sender: TObject);
var i:integer;
begin

 for I :=0 to lbMotionSelect.Count - 1 do
 if lbMotionSelect.Selected[I] then
 begin
  lbMotionSelect.Items.Delete(I);
 end;

end;

procedure TfMotionDouble.FormShow(Sender: TObject);
begin
  getMotion;
end;

procedure TfMotionDouble.getMotion;
var i : integer;
begin
  pList := Tlist.Create;
  vList := TList.Create;

//get all Motion name
 uSimDBEditor.getAllMotion_Characteristics(pList);

{ if True then
   uSimDBEditor.getMotion_Characteristics(StrToInt(mId),MotionHorizontalForm.motionCharacteristic);
 }

 lbAllMotion.Items.Clear;
 lbMotionSelect.Items.Clear;
 lbTempIdAll.Items.Clear;

 for I := 0 to pList.Count - 1 do
 begin
    lbAllMotion.Items.Add(TMotion_Characteristics(pList[i]).FData.Motion_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TMotion_Characteristics(pList[i]).FData.Motion_Index));
 end;

end;

end.
