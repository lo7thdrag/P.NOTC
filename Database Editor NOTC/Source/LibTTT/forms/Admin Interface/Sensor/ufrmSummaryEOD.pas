unit ufrmSummaryEOD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Sensor;

type
  TfrmSummaryEOD = class(TForm)
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
    txtSensorType: TLabel;
    txtDetectionRange: TLabel;
    txtAssociatedCross: TLabel;
    txtMaxPossible: TLabel;
    txt1: TLabel;
    txt2: TLabel;
    txt3: TLabel;
    chkFC_Capable: TCheckBox;
    edtDetectionRange: TEdit;
    edtAssociatedCross: TEdit;
    edtMaxPossible: TEdit;
    cbbSensorType: TComboBox;
    tsNotes: TTabSheet;
    mmoNotes: TMemo;
    ImgHeader: TImage;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    //Global
    function GetNumberOfKoma(s : string): Boolean;
    procedure edtNumeralKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxDataChange(Sender: TObject);
    procedure CheckBoxDataClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure ValidationFormatInput();

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);

  private
    FSelectedEO : TEOD_On_Board;

    function CekInput: Boolean;
    procedure UpdateEOData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedEO : TEOD_On_Board read FSelectedEO write FSelectedEO;

  end;

var
  frmSummaryEOD: TfrmSummaryEOD;

implementation

uses
   uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSummaryEOD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmSummaryEOD.FormShow(Sender: TObject);
begin
  tsGeneral.Show;
  UpdateEOData;

  with FSelectedEO.FEO_Def do
    btnApply.Enabled := EO_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryEOD.btnApplyClick(Sender: TObject);
begin
  with FSelectedEO do
  begin
    if not CekInput then
     begin
      isOK := False;
      Exit;
    end;

    ValidationFormatInput;

    {$REGION ' General '}
    LastName := edtClass.Text;
    FEO_Def.Class_Identifier := edtClass.Text;
    FEO_Def.Sensor_Type := cbbSensorType.ItemIndex;
    FEO_Def.Detection_Range := StrToFloat(edtDetectionRange.Text);
    FEO_Def.Known_Cross_Section := StrToFloat(edtAssociatedCross.Text);
    FEO_Def.Max_Range := StrToFloat(edtMaxPossible.Text);
    FEO_Def.Num_FC_Channels := Ord(chkFC_Capable.Checked);
    {$ENDREGION}

    {$REGION ' Notes '}
    FNote.Notes := mmoNotes.Text;
    {$ENDREGION}

    if FEO_Def.EO_Index = 0 then
    begin
      if dmTTT.InsertEODef(FEO_Def) then
      begin
        dmTTT.InsertNoteStorage(12, FEO_Def.EO_Index, FNote);
        ShowMessage('Data has been saved');
      end;
    end
    else
    begin
      if dmTTT.UpdateEODef(FEO_Def) then
      begin
        dmTTT.UpdateNoteStorage(FEO_Def.EO_Index, FNote);
        ShowMessage('Data has been updated');
      end;
    end;
  end;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummaryEOD.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummaryEOD.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummaryEOD.UpdateEOData;
begin
  with FSelectedEO do
  begin
    if FEO_Def.EO_Index = 0 then
      edtClass.Text := '(Unnamed)'
    else
      edtClass.Text := FEO_Def.Class_Identifier;

    {$REGION ' General '}
    LastName := edtClass.Text;
    cbbSensorType.ItemIndex := FEO_Def.Sensor_Type;
    edtDetectionRange.Text := FormatFloat('0.00', FEO_Def.Detection_Range);
    edtAssociatedCross.Text := FormatFloat('0.0', FEO_Def.Known_Cross_Section);
    edtMaxPossible.Text := FormatFloat('0.00', FEO_Def.Max_Range);
    chkFC_Capable.Checked := Boolean(FEO_Def.Num_FC_Channels);
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

function TfrmSummaryEOD.CekInput: Boolean;
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
  if (dmTTT.GetEODef(edtClass.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedEO.FEO_Def.EO_Index = 0 then
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

function TfrmSummaryEOD.GetNumberOfKoma(s: string): Boolean;
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

procedure TfrmSummaryEOD.edtNumeralKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmSummaryEOD.CheckBoxDataClick(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryEOD.ComboBoxDataChange(Sender: TObject);
begin
  if TComboBox(Sender).ItemIndex = -1 then
    TComboBox(Sender).ItemIndex := 0;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryEOD.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryEOD.ValidationFormatInput;
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
