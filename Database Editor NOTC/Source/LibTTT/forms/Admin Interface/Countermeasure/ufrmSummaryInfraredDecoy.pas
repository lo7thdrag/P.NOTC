unit ufrmSummaryInfraredDecoy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Vcl.Imaging.pngimage, Vcl.Mask,
  uDBAsset_Countermeasure, uBaseCoordSystem;

type
  TfrmSummaryInfraredDecoy = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    ImgBackgroundForm: TImage;
    pnl1Title: TPanel;
    txtClass: TLabel;
    edtClass: TEdit;
    pnl2ControlPage: TPanel;
    PageControl1: TPageControl;
    tsGeneral: TTabSheet;
    lblMaxIRCrossSection: TLabel;
    lblBloomTime: TLabel;
    lbl1: TLabel;
    lblSustainTime: TLabel;
    lbl2: TLabel;
    lblDissipationInStillAir: TLabel;
    lbl3: TLabel;
    lblDissipationIn100: TLabel;
    lbl4: TLabel;
    lblDesectRate: TLabel;
    lbl5: TLabel;
    edtMaxIRCrossSection: TEdit;
    edtDescentRate: TEdit;
    edtBloomTime: TMaskEdit;
    edtSustainTime: TMaskEdit;
    edtDissipationInStillAir: TMaskEdit;
    edtDissipationIn100: TMaskEdit;
    tsNotes: TTabSheet;
    mmoNotes: TMemo;
    Label1: TLabel;
    ImgHeader: TImage;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    //Global
    function GetNumberOfKoma(s : string): Boolean;
    procedure edtNumeralKeyPress(Sender: TObject; var Key: Char);
    procedure edtChange(Sender: TObject);
    procedure ValidationFormatInput();

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);


  private
    FSelectedInfraredDecoy : TInfrared_Decoy_On_Board;

    function CekInput: Boolean;
    procedure UpdateInfraredDecoyData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedInfraredDecoy : TInfrared_Decoy_On_Board
      read FSelectedInfraredDecoy write FSelectedInfraredDecoy;
  end;

var
  frmSummaryInfraredDecoy: TfrmSummaryInfraredDecoy;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSummaryInfraredDecoy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmSummaryInfraredDecoy.FormShow(Sender: TObject);
begin
  tsGeneral.Show;
  UpdateInfraredDecoyData;

  with FSelectedInfraredDecoy.FInfraRedDecoy_Def do
    btnApply.Enabled := Infrared_Decoy_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryInfraredDecoy.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummaryInfraredDecoy.btnApplyClick(Sender: TObject);
var
  second : Integer;
begin
  if not CekInput then
    Exit;
  with FSelectedInfraredDecoy do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    ValidationFormatInput;

    {$REGION ' General '}
    LastName := edtClass.Text;
    FInfraRedDecoy_Def.Infrared_Decoy_Identifier := edtClass.Text;

    FInfraRedDecoy_Def.Max_Infrared_Cross := StrToFloat(edtMaxIRCrossSection.Text);

    TimeToSecond(edtBloomTime.Text, second);
    FInfraRedDecoy_Def.Bloom_Time := second;

    TimeToSecond(edtSustainTime.Text, second);
    FInfraRedDecoy_Def.Sustain_Time := second;

    TimeToSecond(edtDissipationInStillAir.Text, second);
    FInfraRedDecoy_Def.Max_Dissipation_Time := second;

    TimeToSecond(edtDissipationIn100.Text, second);
    FInfraRedDecoy_Def.Min_Dissipation_Time := second;

    FInfraRedDecoy_Def.Descent_Rate := StrToFloat(edtDescentRate.Text);

    {Catatan : Field ini tidak ada inputannya}
    FInfraRedDecoy_Def.Platform_Domain := 1;
    FInfraRedDecoy_Def.Platform_Category := 1;
    FInfraRedDecoy_Def.Platform_Type := 1;
    {$ENDREGION}

    {$REGION ' Notes '}
    FNote.Notes := mmoNotes.Text;
    {$ENDREGION}

    if FInfraRedDecoy_Def.Infrared_Decoy_Index = 0 then
    begin
      if dmTTT.InsertInfraredDecoyDef(FInfraRedDecoy_Def) then
      begin
        dmTTT.InsertNoteStorage(23, FInfraRedDecoy_Def.Infrared_Decoy_Index, FNote);
        ShowMessage('Data has been saved');
      end;
    end
    else
    begin
      if dmTTT.UpdateInfraredDecoyDef(FInfraRedDecoy_Def) then
      begin
        dmTTT.UpdateNoteStorage(FInfraRedDecoy_Def.Infrared_Decoy_Index, FNote);
        ShowMessage('Data has been updated');
      end;
    end;
  end;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummaryInfraredDecoy.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummaryInfraredDecoy.UpdateInfraredDecoyData;
var
  timeStr : string;
begin
  with FSelectedInfraredDecoy do
  begin
    if FInfraRedDecoy_Def.Infrared_Decoy_Index = 0 then
      edtClass.Text := '(Unnamed)'
    else
      edtClass.Text := FInfraRedDecoy_Def.Infrared_Decoy_Identifier;

    {$REGION ' General '}
    LastName := edtClass.Text;
    edtMaxIRCrossSection.Text := FormatFloat('0', FInfraRedDecoy_Def.Max_Infrared_Cross);

    SecondToTime(FInfraRedDecoy_Def.Bloom_Time, timeStr);
    edtBloomTime.Text := timeStr;

    SecondToTime(FInfraRedDecoy_Def.Sustain_Time, timeStr);
    edtSustainTime.Text := timeStr;

    SecondToTime(FInfraRedDecoy_Def.Max_Dissipation_Time, timeStr);
    edtDissipationInStillAir.Text := timeStr;

    SecondToTime(FInfraRedDecoy_Def.Min_Dissipation_Time, timeStr);
    edtDissipationIn100.Text := timeStr;

    edtDescentRate.Text := FormatFloat('0.00', FInfraRedDecoy_Def.Descent_Rate);
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}
  end;
end;

function TfrmSummaryInfraredDecoy.CekInput: Boolean;
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
  if (dmTTT.GetInfraredDecoyDef(edtClass.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedInfraredDecoy.FInfraRedDecoy_Def.Infrared_Decoy_Index = 0 then
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

function TfrmSummaryInfraredDecoy.GetNumberOfKoma(s: string): Boolean;
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

procedure TfrmSummaryInfraredDecoy.edtNumeralKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmSummaryInfraredDecoy.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryInfraredDecoy.ValidationFormatInput;
var
  i, j: Integer;
  value : Double;
  hStr, mStr, sStr, hmSeparator, msSeparator : string;
  h, m, s : Integer;
  aTimeStr : string;
  flag : Boolean;

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

    if Components[i] is TMaskEdit then
    begin
      aTimeStr := TMaskEdit(Components[i]).Text;
      flag := False;

      hStr := Copy(aTimeStr, 1, 2);
      TryStrToInt(hStr, h);

      mStr := Copy(aTimeStr, 4, 2);
      TryStrToInt(mStr, m);

      sStr := Copy(aTimeStr, 7, 2);
      TryStrToInt(sStr, s);

      if h > 23 then
      begin
        hStr := '23';
        flag := True;
      end;

      if m > 59 then
      begin
        mStr := '59';
        flag := True;
      end;

      if s > 59 then
      begin
        sStr := '59';
        flag := True;
      end;

      if flag then
        TMaskEdit(Components[i]).Text := hStr + ':' + mStr + ':' + sStr;

    end;
  end;
end;

{$ENDREGION}



end.
