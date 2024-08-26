unit uMissileSingleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfMissileSingle = class(TForm)
    lbTempId: TListBox;
    lbMissile: TListBox;
    btnClose: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnRemove: TButton;
    btnUsage: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure refresh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMissileSingle: TfMissileSingle;
  mList : TList;

implementation

{$R *.dfm}

uses uSimDBEditor, uDBAsset_Weapon, uDataModuleTTT;



procedure TfMissileSingle.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfMissileSingle.btnCopyClick(Sender: TObject);
begin
  if lbMissile.Selected[lbMissile.ItemIndex] then
  begin
   // uSimDBEditor.getAllMissile(StrToInt(lbMissile.Items.Strings[lbMissile.ItemIndex]), MotionHorizontalForm.motionCharacteristic);
   // MotionHorizontalForm.motionCharacteristic.FData.Motion_Identifier := 'Copy Of ' + lbMotions.Items.Strings[lbMotions.ItemIndex];

   // dmTTT.insertMissile_Def(MotionHorizontalForm.motionCharacteristic);
   refresh;
  end;
end;

procedure TfMissileSingle.btnEditClick(Sender: TObject);
begin
  if lbMissile.Selected[lbMissile.ItemIndex] then
  begin
   { MotionHorizontalForm.isNew := false;
    MotionHorizontalForm.idMotion := StrToInt(lbIdMotions.Items.Strings[lbMotions.ItemIndex]);
    MotionHorizontalForm.refresh;
    MotionHorizontalForm.Show;   }
  end;
end;

procedure TfMissileSingle.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
end;

procedure TfMissileSingle.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfMissileSingle.refresh;
var
 I: Integer;
begin

  uSimDBEditor.getAllMissile(0,mList,);

  lbMissile.Clear;
  lbTempId.Clear;
  for I := 0 to mList.Count - 1 do
  begin
    lbMissile.Items.Add(TMissile_On_Board(mList[I]).FDef.Class_Identifier);
    lbTempId.Items.Add(IntToStr(TMissile_On_Board(mList[I]).FDef.Missile_Index));
  end;

end;

end.
