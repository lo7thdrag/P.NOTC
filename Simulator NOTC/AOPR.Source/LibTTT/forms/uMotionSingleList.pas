unit uMotionSingleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmotionSingleList = class(TForm)
    lbMotions: TListBox;
    grpFilter: TGroupBox;
    btNew: TButton;
    btCopy: TButton;
    btEdit: TButton;
    btRemove: TButton;
    btUsage: TButton;
    btClose: TButton;
    btFilter: TButton;
    lbIdMotions: TListBox;
    cbUsage: TCheckBox;
    cbxUsedBy: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure refresh;
    procedure btNewClick(Sender: TObject);
    procedure btFilterClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
  private
    { Private declarations }
    procedure getDataMotion;
  public
    { Public declarations }
    mList: TList;
  end;

var
  fmotionSingleList: TfmotionSingleList;

implementation

uses uSimDBEditor, uDBAsset_MotionCharacteristics, uMotion;

{$R *.dfm}

procedure TfmotionSingleList.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmotionSingleList.btCopyClick(Sender: TObject);
begin
  MotionHorizontalForm.isCopy := True;
  getDataMotion;
end;

procedure TfmotionSingleList.btEditClick(Sender: TObject);
begin
   MotionHorizontalForm.isCopy := False;
   getDataMotion;
end;

procedure TfmotionSingleList.getDataMotion;
begin
  if lbMotions.Selected[lbMotions.ItemIndex] then
  begin
    with MotionHorizontalForm do begin
      isNew := false;
      idMotion := StrToInt(lbIdMotions.Items.Strings[lbMotions.ItemIndex]);
      if isCopy then
      begin
        edtName.Text := 'Copy of '+ lbMotions.Items.Strings[lbMotions.ItemIndex];
        isNew := True;
      end
      else
        edtName.Text := lbMotions.Items.Strings[lbMotions.ItemIndex];

      refresh;
      Show;
    end;
  end;
end;

procedure TfmotionSingleList.btFilterClick(Sender: TObject);
begin
  if btFilter.Caption = 'Filter >>' then
  begin
    btFilter.Caption := '<< Filter';
    Self.Height := 590;
  end
  else if btFilter.Caption =  '<< Filter' then
  begin
    btFilter.Caption := 'Filter >>';
    Self.Height := 512;
  end;
end;

procedure TfmotionSingleList.btNewClick(Sender: TObject);
begin
  MotionHorizontalForm.clear;
  MotionHorizontalForm.isNew := true;
  MotionHorizontalForm.Show;
end;

procedure TfmotionSingleList.btRemoveClick(Sender: TObject);
begin
  if lbMotions.Selected[lbMotions.ItemIndex] then
  begin
    uSimDBEditor.deleteMotion(StrToInt(lbIdMotions.Items.Strings[lbMotions.ItemIndex]));
  end;
  refresh;
end;

procedure TfmotionSingleList.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
end;

procedure TfmotionSingleList.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfmotionSingleList.refresh;
var
 I: Integer;
begin
  //
  uSimDBEditor.getAllMotion_Characteristics(mList);

  lbMotions.Clear;
  lbIdMotions.Clear;
  for I := 0 to mList.Count - 1 do
  begin
    lbMotions.Items.Add(TMotion_Characteristics(mList[I]).FData.Motion_Identifier);
    lbIdMotions.Items.Add(IntToStr(TMotion_Characteristics(mList[I]).FData.Motion_Index));
  end;

end;

end.
