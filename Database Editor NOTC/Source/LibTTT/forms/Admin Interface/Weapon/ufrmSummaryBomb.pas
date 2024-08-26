unit ufrmSummaryBomb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Weapon, tttData;

type
  TfrmSummaryBomb = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    ImgBackgroundForm: TImage;
    Label1: TLabel;
    pnl1Title: TPanel;
    txtClass: TLabel;
    edtClass: TEdit;
    pnl2ControlPage: TPanel;
    PageControl1: TPageControl;
    tsGeneral: TTabSheet;
    lblType: TLabel;
    cbbType: TComboBox;
    grpLethality: TGroupBox;
    mnlbl9: TLabel;
    mnlbl8: TLabel;
    edtLethality: TEdit;
    trckbrLethality: TTrackBar;
    grpTarget: TGroupBox;
    chkAntiSurface: TCheckBox;
    chkAntiSubSurface: TCheckBox;
    chkAntiLand: TCheckBox;
    chkAntiAmphibious: TCheckBox;
    grpRange: TGroupBox;
    mnlbl4: TLabel;
    lblMaxRange: TLabel;
    mnlbl5: TLabel;
    lblMinRange: TLabel;
    edtRangeMin: TEdit;
    edtRangeMax: TEdit;
    grbPOH: TGroupBox;
    btnEditPOH: TButton;
    tsNotes: TTabSheet;
    mmoNotes: TMemo;
    ImgHeader: TImage;
    chkLaunchFromRocket: TCheckBox;

    procedure FormShow(Sender: TObject);

    //Global
    function GetNumberOfKoma(s : string): Boolean;
    procedure edtNumeralKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxDataChange(Sender: TObject);
    procedure CheckBoxDataClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure ValidationFormatInput();

    //General
    procedure trckbrGeneralChange(Sender: TObject);
    procedure edtGeneralChange(Sender: TObject);
    procedure btnEditPOHClick(Sender: TObject);

    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);

  private
    FSelectedBomb : TBomb_Definition;

    function CekInput: Boolean;
    procedure UpdateBombData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedBomb : TBomb_Definition read FSelectedBomb
      write FSelectedBomb;
  end;

var
  frmSummaryBomb: TfrmSummaryBomb;

implementation

uses
   uDataModuleTTT, uProbabilityGraph, ufrmBombPOHGraphic {, ufrmAvailableWeapon, uBombDoublePickList,
  tttData};

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSummaryBomb.FormShow(Sender: TObject);
begin
  tsGeneral.Show;
  UpdateBombData;

  with FSelectedBomb.FData do
    btnApply.Enabled := Bomb_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryBomb.btnOkClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummaryBomb.btnApplyClick(Sender: TObject);
begin

  with FSelectedBomb do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    ValidationFormatInput;

    {$REGION ' General '}
    LastName := edtClass.Text;
    FData.Bomb_Identifier := edtClass.Text;

    FData.Bomb_Type := cbbType.ItemIndex;

    FData.Anti_Sur_Capable := Ord(chkAntiSurface.Checked);
    FData.Anti_SubSur_Capable := Ord(chkAntiSubSurface.Checked);
    FData.Anti_Land_Capable := Ord(chkAntiLand.Checked);
    FData.Anti_Amphibious_Capable := Ord(chkAntiAmphibious.Checked);
    FData.Rocket_Launcher := ord(chkLaunchFromRocket.Checked);

    FData.Min_Range := StrToFloat(edtRangeMin.Text);
    FData.Max_Range := StrToFloat(edtRangeMax.Text);

    FData.Lethality := trckbrLethality.Position;
    {$ENDREGION}

    {$REGION ' Notes '}
    FNote.Notes := mmoNotes.Text;
    {$ENDREGION}

    if FData.Bomb_Index = 0 then
    begin
      if dmTTT.InsertBombDef(FData) then
      begin
        dmTTT.InsertNoteStorage(14, FData.Bomb_Index, FNote);
        ShowMessage('Data has been saved');
      end;
    end
    else
    begin
      if dmTTT.UpdateBombDef(FData) then
      begin
        dmTTT.UpdateNoteStorage(FData.Bomb_Index, FNote);
        ShowMessage('Data has been updated');
      end;
    end;
  end;

  UpdateBombData;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummaryBomb.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummaryBomb.btnEditPOHClick(Sender: TObject);
begin
//  fProbabilityGraph := TProbabilityGraph.Create(Self); // FORM LAMA
  frmBombPOHGraphic := TfrmBombPOHGraphic.Create(Self); // FORM BARU
  try
    with frmBombPOHGraphic do
    begin
      ProbabilityGraph := pgBomb;
      SelectedProbObj := FSelectedBomb;
      ShowModal;
    end;
    AfterClose := frmBombPOHGraphic.AfterClose;
  finally
    frmBombPOHGraphic.Free;
  end;

  btnCancel.Enabled := not AfterClose;
  btnApply.Enabled := AfterClose;

end;

procedure TfrmSummaryBomb.trckbrGeneralChange(Sender: TObject);
begin
  edtLethality.Text := IntToStr(TTrackBar(Sender).Position);
end;

procedure TfrmSummaryBomb.edtGeneralChange(Sender: TObject);
begin
  if TEdit(Sender).Text = '' then
    TEdit(Sender).Text := '0';

  if (StrToInt(TEdit(Sender).Text) > 100000) then
    TEdit(Sender).Text := '100000';

  trckbrLethality.Position := StrToInt(TEdit(Sender).Text);

  btnApply.Enabled := True;
end;

procedure TfrmSummaryBomb.UpdateBombData;
begin
  with FSelectedBomb do
  begin
    if FData.Bomb_Index = 0 then
      edtClass.Text := '(Unnamed)'
    else
      edtClass.Text := FData.Bomb_Identifier;

    {$REGION ' General '}
    LastName := edtClass.Text;
    cbbType.ItemIndex := FData.Bomb_Type;
    chkLaunchFromRocket.Checked := Boolean(FData.Rocket_Launcher);

    chkAntiSurface.Checked := Boolean(FData.Anti_Sur_Capable);
    chkAntiSubSurface.Checked := Boolean(FData.Anti_SubSur_Capable);
    chkAntiLand.Checked := Boolean(FData.Anti_Land_Capable);
    chkAntiAmphibious.Checked := Boolean(FData.Anti_Amphibious_Capable);

    edtRangeMin.Text := FormatFloat('0.00', FData.Min_Range);
    edtRangeMax.Text := FormatFloat('0.00', FData.Max_Range);

    btnEditPOH.Enabled := FData.Bomb_Index <> 0;

    trckbrLethality.Position := FData.Lethality;
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}
  end;
end;

function TfrmSummaryBomb.CekInput: Boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtClass.Text = '')then
  begin
    ShowMessage('Please insert class name');
    Exit;
  end;

  {Jika berisi spasi semua}
  if Copy(edtClass.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtClass.Text);
    numSpace := 0;

    for i := 1 to chkSpace do
    begin
      if edtClass.Text[i] = #32 then
      numSpace := numSpace + 1;
    end;

    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  {Jika Class Name sudah ada}
  if (dmTTT.GetBombDef(edtClass.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedBomb.FData.Bomb_Index = 0 then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end
    else if LastName <> edtClass.Text then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  Result := True;
end;

{$ENDREGION}

{$REGION ' Filter Input '}

function TfrmSummaryBomb.GetNumberOfKoma(s: string): Boolean;
var
  a, i : Integer;
begin
  Result := False;
  a := 0;

  for i := 1 to length(s) do
  begin
    if s[i] = '.' then
      a := a + 1;
  end;

  if a > 0 then
    Result := True;
end;

procedure TfrmSummaryBomb.edtNumeralKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetNumberOfKoma(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if Key = #13 then
  begin
    if TEdit(Sender).Text = '' then
      TEdit(Sender).Text := '0';

    value := StrToFloat(TEdit(Sender).Text);

    case TEdit(Sender).Tag of
      0: TEdit(Sender).Text := FormatFloat('0', value);
      1: TEdit(Sender).Text := FormatFloat('0.0', value);
      2: TEdit(Sender).Text := FormatFloat('0.00', value);
      3: TEdit(Sender).Text := FormatFloat('0.000', value);
    end;

    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryBomb.CheckBoxDataClick(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryBomb.ComboBoxDataChange(Sender: TObject);
begin
  if TComboBox(Sender).ItemIndex = -1 then
    TComboBox(Sender).ItemIndex := 0;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryBomb.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryBomb.ValidationFormatInput;
var
  i: Integer;
  value : Double;

begin
  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then
    begin
      if TEdit(Components[i]).Tag = 4 then
        continue;

      if TEdit(Components[i]).Text = '' then
        TEdit(Components[i]).Text := '0';

      value := StrToFloat(TEdit(Components[i]).Text);

      case TEdit(Components[i]).Tag of
        0: TEdit(Components[i]).Text := FormatFloat('0', value);
        1: TEdit(Components[i]).Text := FormatFloat('0.0', value);
        2: TEdit(Components[i]).Text := FormatFloat('0.00', value);
        3: TEdit(Components[i]).Text := FormatFloat('0.000', value);
      end;
    end;
  end;
end;

{$ENDREGION}

end.
