unit ufrmSummaryBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_Vehicle, uBrigadePersonel, uDBAsset_Base,
  ComCtrls, Vcl.Imaging.pngimage;

type
  TfrmSummaryBase = class(TForm)
    pnl2ControlPage: TPanel;
    PageControl1: TPageControl;
    tsGeneral: TTabSheet;
    lbl2: TLabel;
    lbl6: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtRadius: TEdit;
    GroupBox1: TGroupBox;
    lblFuel: TLabel;
    lbl7: TLabel;
    lblLubricants: TLabel;
    lbl8: TLabel;
    lblFreshWater: TLabel;
    lbl9: TLabel;
    lblWater: TLabel;
    lbl10: TLabel;
    lbFood: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    Label2: TLabel;
    edtFood: TEdit;
    edtWater: TEdit;
    edtFreshWater: TEdit;
    edtLubricants: TEdit;
    edtFuel: TEdit;
    ImgBackgroundForm: TImage;
    ImgHeader: TImage;
    Label1: TLabel;
    btnVehicle: TButton;
    pnl1Title: TPanel;
    edtName: TEdit;
    lbl1: TLabel;
    btnOK: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    cbbBaseType: TComboBox;

    procedure FormShow(Sender: TObject);

    //Global
    function GetNumberOfKoma(s : string): Boolean;
    procedure edtNumeralKeyPress(Sender: TObject; var Key: Char);
    procedure edtChange(Sender: TObject);
    procedure CbbGeneralDataChange(Sender: TObject);
    procedure ValidationFormatInput();

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnVehicleClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    FSelectedBase : TBase;

    function CekInput: Boolean;
    procedure UpdateBaseData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedBase : TBase read FSelectedBase write FSelectedBase;
  end;

var
  frmSummaryBase: TfrmSummaryBase;

implementation

uses
  uDataModuleTTT, ufrmVehicleOnBasePickList ;

{$R *.dfm}


{$REGION ' Form Handle '}

procedure TfrmSummaryBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmSummaryBase.FormShow(Sender: TObject);
begin
  tsGeneral.Show;;
  UpdateBaseData;

  with FSelectedBase.FData do
    btnApply.Enabled := Base_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryBase.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummaryBase.btnVehicleClick(Sender: TObject);
begin
  frmVehicleOnBasePickList := TfrmVehicleOnBasePickList.Create(Self);
  try
    with frmVehicleOnBasePickList do
    begin
      SelectedBase := FSelectedBase;
      ShowModal;
    end;
    AfterClose := frmVehicleOnBasePickList.AfterClose;
  finally
    frmVehicleOnBasePickList.Free;
  end;

  btnCancel.Enabled := not AfterClose;
  btnApply.Enabled := AfterClose;
end;

procedure TfrmSummaryBase.btnApplyClick(Sender: TObject);
var
  second : Integer;
begin
  with FSelectedBase do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    ValidationFormatInput;

    {$REGION ' General '}
    LastName := edtName.Text;
    FData.Base_Identifier := edtName.Text;

    FData.Base_Radius := StrToFloat(edtRadius.Text);
    FData.Base_Type := cbbBaseType.ItemIndex;;
    FData.Fuel := StrToFloat(edtFuel.Text);
    FData.Lubricants := StrToFloat(edtLubricants.Text);
    FData.FreshWater := StrToFloat(edtFreshWater.Text);
    FData.Water := StrToFloat(edtWater.Text);
    FData.Food := StrToFloat(edtFood.Text);
    {$ENDREGION}

    if FData.Base_Index = 0 then
    begin
      if dmTTT.InsertBaseDef(FData) then
      begin
        ShowMessage('Data has been saved');
      end;
    end
    else
    begin
      if dmTTT.UpdateBaseDef(FData) then
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

procedure TfrmSummaryBase.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummaryBase.CbbGeneralDataChange(Sender: TObject);
begin
  if TComboBox(Sender).ItemIndex = -1 then
    TComboBox(Sender).ItemIndex := 0;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryBase.UpdateBaseData;
begin
  with FSelectedBase do
  begin
    if FData.Base_Index = 0 then
      edtName.Text := '(Unnamed)'
    else
      edtName.Text := FData.Base_Identifier;

    {$REGION ' General '}
    LastName := edtName.Text;
    edtRadius.Text := FormatFloat('0.00', FData.Base_Radius);
    cbbBaseType.ItemIndex := FData.Base_Type;
    edtFuel.Text := FormatFloat('0.0', FData.Fuel);
    edtLubricants.Text := FormatFloat('0.0', FData.Lubricants);
    edtFreshWater.Text := FormatFloat('0.0', FData.FreshWater);
    edtWater.Text := FormatFloat('0.0', FData.Water);
    edtFood.Text := FormatFloat('0.0', FData.Food);

    btnVehicle.Enabled := FData.Base_Index <> 0;
    {$ENDREGION}

  end;
end;

function TfrmSummaryBase.CekInput: Boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtName.Text = '')then
  begin
    ShowMessage('Please insert class name');
    Exit;
  end;

  {Jika berisi spasi semua}
  if Copy(edtName.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtName.Text);
    numSpace := 0;

    for i := 1 to chkSpace do
    begin
      if edtName.Text[i] = #32 then
      numSpace := numSpace + 1;
    end;

    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  {Jika Class Name sudah ada}
  if (dmTTT.GetBaseDef(edtName.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedBase.FData.Base_Index = 0 then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end
    else if LastName <> edtName.Text then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  Result := True;
end;

{$ENDREGION}

{$REGION ' Filter Input '}

function TfrmSummaryBase.GetNumberOfKoma(s: string): Boolean;
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

procedure TfrmSummaryBase.edtNumeralKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmSummaryBase.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryBase.ValidationFormatInput;
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
  end;
end;

{$ENDREGION}

end.
