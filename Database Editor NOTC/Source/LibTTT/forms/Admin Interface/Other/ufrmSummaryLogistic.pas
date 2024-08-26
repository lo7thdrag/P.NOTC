unit ufrmSummaryLogistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBAsset_Logistics, ufrmAvailableLogistic, uDBAssetObject,
  {RzBckgnd,} Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmSummaryLogistic = class(TForm)
    pnl2ControlPage: TPanel;
    PageControl1: TPageControl;
    tsGeneral: TTabSheet;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    Label2: TLabel;
    edtPA: TEdit;
    edtBA: TEdit;
    edtTA: TEdit;
    ImgBackgroundForm: TImage;
    ImgHeader: TImage;
    btnOK: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    pnl1Title: TPanel;
    txtClass: TLabel;
    edtClass: TEdit;
    Label1: TLabel;
    lblMaxAltitudeDiff: TLabel;
    edtMaxAltitudeDiff: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtMaxRange: TEdit;
    Label10: TLabel;
    GroupBox2: TGroupBox;
    lbl6: TLabel;
    lbl20: TLabel;
    lbl16: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtML: TEdit;
    edtAT: TEdit;
    edtFood: TEdit;
    GroupBox3: TGroupBox;
    lbl7: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lbl21: TLabel;
    lbl23: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label13: TLabel;
    edtAT_Consumption: TEdit;
    edtML_Consumption: TEdit;
    edtFood_Consumption: TEdit;
    grbTranferRate: TGroupBox;
    lbl8: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl18: TLabel;
    lbl5: TLabel;
    lbl13: TLabel;
    lbl19: TLabel;
    lbl24: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    Label21: TLabel;
    lbl22: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl29: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl15: TLabel;
    lbl17: TLabel;
    edtLubricantsTrS: TEdit;
    edtFreshWaterTrS: TEdit;
    edtFoodTrS: TEdit;
    edtFuelTrS: TEdit;
    chTransferCapability: TCheckBox;

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
    procedure chTransferCapabilityClick(Sender: TObject);

  private
    FSelectedLogistic : TLogistics;

    function CekInput: Boolean;
    procedure UpdateLogisticData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedLogistic : TLogistics read FSelectedLogistic write FSelectedLogistic;
  end;

var
  frmSummaryLogistic: TfrmSummaryLogistic;

implementation

{$R *.dfm}

uses
  uDataModuleTTT;

{$REGION ' Form Handle '}

procedure TfrmSummaryLogistic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmSummaryLogistic.FormShow(Sender: TObject);
begin
  tsGeneral.Show;
  UpdateLogisticData;

  with FSelectedLogistic.FData do
    btnApply.Enabled := Logistic_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryLogistic.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummaryLogistic.btnApplyClick(Sender: TObject);
begin
  with FSelectedLogistic do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    ValidationFormatInput;

    {$REGION ' General '}
    FData.Logistic_Identifier := edtClass.Text;

    FData.Max_Transfer_Range := StrToFloat(edtMaxRange.Text);
    FData.Max_Transfer_Altitude_Difference := StrToFloat(edtMaxAltitudeDiff.Text);

    FData.PA := StrToInt(edtPA.Text);
    FData.BA := StrToInt(edtBA.Text);
    FData.TA := StrToInt(edtTA.Text);

    FData.Max_Ration_Capacity := StrToFloat(edtFood.Text);
    FData.Max_Lubricants_Capacity := StrToFloat(edtML.Text);
    FData.Max_Freshwater_Capacity := StrToFloat(edtAT.Text);

    FData.Lubricants_Consumption := StrToFloat(edtML_Consumption.Text);
    FData.Freshwater_Consumption := StrToFloat(edtAT_Consumption.Text);
    FData.Ration_Consumption := StrToFloat(edtFood_Consumption.Text);

    FData.Tranferable_Logistic := chTransferCapability.Checked;

    FData.Fuel_TrS := StrToFloat(edtFuelTrS.Text);
    FData.Lubricant_TrS := StrToFloat(edtLubricantsTrS.Text);
    FData.Freshwater_TrS := StrToFloat(edtFreshWaterTrS.Text);
    FData.Ration_TrS := StrToFloat(edtFoodTrS.Text);
    {$ENDREGION}

    if FData.Logistic_Index = 0 then
    begin
      if dmTTT.InsertLogisticDef(FData) then
      begin
        ShowMessage('Data has been saved');
      end;
    end
    else
    begin
      if dmTTT.UpdateLogisticDef(FData) then
      begin
        ShowMessage('Data has been updated');
      end;
    end;
  end;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummaryLogistic.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummaryLogistic.UpdateLogisticData;
begin
  with FSelectedLogistic do
  begin
    if FData.Logistic_Index = 0 then
      edtClass.Text := '(Unnamed)'
    else
      edtClass.Text := FData.Logistic_Identifier;

    {$REGION ' General '}
    LastName := edtClass.Text;

    edtMaxRange.Text := FormatFloat('0.00',FData.Max_Transfer_Range);
    edtMaxAltitudeDiff.Text := FormatFloat('0',FData.Max_Transfer_Altitude_Difference);

    edtPA.Text := inttostr(FData.PA);
    edtBA.Text := IntToStr(FData.BA);
    edtTA.Text := IntToStr(FData.TA);

    edtML.Text := FormatFloat('0.00',FData.Max_Lubricants_Capacity);
    edtAT.Text := FormatFloat('0.00',FData.Max_Freshwater_Capacity);
    edtFood.Text := FormatFloat('0.00',FData.Max_Ration_Capacity);

    edtML_Consumption.Text := FormatFloat('0.00',FData.Lubricants_Consumption);
    edtAT_Consumption.Text := FormatFloat('0.00',FData.Freshwater_Consumption);
    edtFood_Consumption.Text := FormatFloat('0.00',FData.Ration_Consumption);

    chTransferCapability.Checked := FData.Tranferable_Logistic;

    edtFuelTrS.Text := FormatFloat('0.00', FData.Fuel_TrS);
    edtLubricantsTrS.Text := FormatFloat('0.00', FData.Lubricant_TrS);
    edtFreshWaterTrS.Text := FormatFloat('0.00', FData.Freshwater_TrS);
    edtFoodTrS.Text := FormatFloat('0.00', FData.Ration_TrS);
    {$ENDREGION}
  end;
end;

function TfrmSummaryLogistic.CekInput: Boolean;
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
  if (dmTTT.GetLogisticDef(edtClass.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedLogistic.FData.Logistic_Index= 0 then
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

procedure TfrmSummaryLogistic.chTransferCapabilityClick(Sender: TObject);
begin
  grbTranferRate.Enabled := chTransferCapability.Checked;

  if not chTransferCapability.Checked then
  begin
    edtLubricantsTrS.Text := '0.00';
    edtFuelTrS.Text := '0.00';
    edtFreshWaterTrS.Text := '0.00';
    edtFoodTrS.Text := '0.00';
  end;

  btnApply.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Filter Input '}

function TfrmSummaryLogistic.GetNumberOfKoma(s: string): Boolean;
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

procedure TfrmSummaryLogistic.edtNumeralKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmSummaryLogistic.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryLogistic.ValidationFormatInput;
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
