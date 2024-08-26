unit uBombWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uDBAsset_Weapon;

type
  TfBombWindow = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtClass: TEdit;
    btnOk: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    pnl3: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    lbl2: TLabel;
    grp1: TGroupBox;
    chkAntiSurface: TCheckBox;
    chkAntiSubSurface: TCheckBox;
    chkAntiLand: TCheckBox;
    grp2: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtRangeMin: TEdit;
    edtRangeMax: TEdit;
    grp3: TGroupBox;
    btn1: TButton;
    grp4: TGroupBox;
    trckbrLethality: TTrackBar;
    edtLethality: TEdit;
    cbbType: TComboBox;
    ts2: TTabSheet;
    mmo1: TMemo;
    lbl7: TLabel;
    lbl8: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure trckbrLethalityChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure getData;
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bomb : TBomb_Definition;
    isCopy  : Boolean;
  end;

var
  fBombWindow: TfBombWindow;

implementation

{$R *.dfm}

uses uDataModuleTTT, uWeaponSingleList;

procedure TfBombWindow.btnApplyClick(Sender: TObject);
begin
  if fWeaponSingle.isNew then
  begin
    getData;
    dmTTT.insertBomb_Def(bomb);
    fWeaponSingle.isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateBomb_Def(bomb,IntToStr(bomb.FData.Bomb_Index));
  end;
end;

procedure TfBombWindow.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfBombWindow.btnOkClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fWeaponSingle.refresh;
end;

procedure TfBombWindow.FormCreate(Sender: TObject);
begin
  bomb := TBomb_Definition.Create;
end;

procedure TfBombWindow.trckbrLethalityChange(Sender: TObject);
begin
  edtLethality.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfBombWindow.getData;
begin

  with bomb.FData do begin
    Bomb_Identifier := edtClass.Text;

    if chkAntiSurface.Checked then
      Anti_Sur_Capable := 1
    else
      Anti_Sur_Capable := 0;

    if chkAntiSubSurface.Checked then
      Anti_SubSur_Capable := 1
    else
      Anti_SubSur_Capable := 0;

    if chkAntiLand.Checked then
      Anti_Land_Capable := 1
    else
      Anti_Land_Capable := 0;

    if cbbType.ItemIndex = 0 then
      Bomb_Type := 0
    else
      Bomb_Type := 1;

    Lethality := StrToInt(edtLethality.Text);
    Min_Range := StrToFloat(edtRangeMin.Text);
    Max_Range := StrToFloat(edtRangeMax.Text);

  end;

end;

end.
