unit ufrmSummaryMotion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Mask, Vcl.Imaging.pngimage,
  uDBAsset_MotionCharacteristics, uBaseCoordSystem;

type
  TfrmSummaryMotion = class(TForm)
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
    tsHorizontal: TTabSheet;
    grpIRCM: TGroupBox;
    lblMinGroundSpeed: TLabel;
    lblCruiseGroundSpeed: TLabel;
    lblHighGroundSpeed: TLabel;
    lblMaxGroundSpeed: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtMinGroundSpeed: TEdit;
    edtCruiseGroundSpeed: TEdit;
    edtHighGroundSpeed: TEdit;
    edtMaxGroundSpeed: TEdit;
    GroupBox1: TGroupBox;
    lblStandardTurnRate: TLabel;
    lblTightTurnRate: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtTightTurnRate: TEdit;
    edtStandardTurnRate: TEdit;
    GroupBox2: TGroupBox;
    lblMaxHelmAngle: TLabel;
    lblHelmAngleRate: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtMaxHelmAngle: TEdit;
    edtHelmAngleRate: TEdit;
    GroupBox3: TGroupBox;
    lblDeceleration: TLabel;
    lblAcceleration: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtAcceleration: TEdit;
    edtDeceleration: TEdit;
    tsVertical: TTabSheet;
    lblMaxAltitude: TLabel;
    lblMaxDepth: TLabel;
    lblVerticalAcceleration: TLabel;
    Label30: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    edtVerticalAcceleration: TEdit;
    edtMaxDepth: TEdit;
    edtMaxAltitude: TEdit;
    GroupBox4: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    lblNormalDescentRate: TLabel;
    lblMaxDescentRate: TLabel;
    edtMaxDescentRate: TEdit;
    edtNormalDescentRate: TEdit;
    GroupBox5: TGroupBox;
    lblMaxClimbRate: TLabel;
    lblNormalClimbRate: TLabel;
    Label34: TLabel;
    Label33: TLabel;
    edtNormalClimbRate: TEdit;
    edtMaxClimbRate: TEdit;
    tsEndurance: TTabSheet;
    Label2: TLabel;
    grbFuel: TGroupBox;
    lblMaxFuelCapacity: TLabel;
    lblFuelConsumptionPerHour: TLabel;
    lblMinimum: TLabel;
    lblCruise: TLabel;
    lblHigh: TLabel;
    lblMaximum: TLabel;
    lblUnits: TLabel;
    cbbUnits: TComboBox;
    edtMaxFuelCapacity: TEdit;
    edtMinimum: TEdit;
    edtCruise: TEdit;
    edtHigh: TEdit;
    edtMaximum: TEdit;
    grbEnduranceTime: TGroupBox;
    Label14: TLabel;
    lbl16: TLabel;
    medtEnduranceTime: TMaskEdit;
    grbMaxEffectiveRange: TGroupBox;
    lblnmMaxEffectiveRange: TLabel;
    Label15: TLabel;
    edtMaxEffectiveRange: TEdit;
    cbxEnduranceType: TComboBox;
    lblTypeHorizontal: TLabel;
    CbbType: TComboBox;
    ImgHeader: TImage;

    procedure FormShow(Sender: TObject);

    //Global
    function GetNumberOfKoma(s : string): Boolean;
    procedure edtNumeralKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxDataChange(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure ValidationFormatInput();

    //Endurance
    procedure cbxEnduranceTypeChange(Sender: TObject);

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CbbTypeChange(Sender: TObject);

  private
    FSelectedMotion : TMotion_Characteristics;

    function CekInput: Boolean;
    procedure UpdateMotionData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedMotion : TMotion_Characteristics read FSelectedMotion
      write FSelectedMotion;
  end;

var
  frmSummaryMotion: TfrmSummaryMotion;

implementation

uses
   uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSummaryMotion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmSummaryMotion.FormShow(Sender: TObject);
begin
  tsHorizontal.Show;
  UpdateMotionData;

  with FSelectedMotion.FData do
    btnApply.Enabled := Motion_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryMotion.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummaryMotion.CbbTypeChange(Sender: TObject);
begin
  if TComboBox(Sender).ItemIndex = -1 then
    TComboBox(Sender).ItemIndex := 0;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryMotion.btnApplyClick(Sender: TObject);
var
  second : Integer;

begin

  with FSelectedMotion do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    ValidationFormatInput;

    {$REGION ' Horizontal '}
    LastName := edtClass.Text;
    FData.Motion_Identifier := edtClass.Text;
    FData.Motion_Type := cbbType.ItemIndex;
    FData.Min_Ground_Speed := StrToFloat(edtMinGroundSpeed.Text);
    FData.Cruise_Ground_Speed := StrToFloat(edtCruiseGroundSpeed.Text);
    FData.High_Ground_Speed := StrToFloat(edtHighGroundSpeed.Text);
    FData.Max_Ground_Speed := StrToFloat(edtMaxGroundSpeed.Text);

    FData.Acceleration := StrToFloat(edtAcceleration.Text);
    FData.Deceleration := StrToFloat(edtDeceleration.Text);

    FData.Standard_Turn_Rate := StrToFloat(edtStandardTurnRate.Text);
    FData.Tight_Turn_Rate := StrToFloat(edtTightTurnRate.Text);

    FData.Max_Helm_Angle := StrToFloat(edtMaxHelmAngle.Text);
    FData.Helm_Angle_Rate := StrToFloat(edtHelmAngleRate.Text);
    {$ENDREGION}

    {$REGION ' Vertical '}
    FData.Max_Altitude := StrToFloat(edtMaxAltitude.Text);
    FData.Max_Depth := StrToFloat(edtMaxDepth.Text);
    FData.Vertical_Accel := StrToFloat(edtVerticalAcceleration.Text);

    FData.Normal_Descent_Rate := StrToFloat(edtNormalDescentRate.Text);
    FData.Max_Descent_Rate := StrToFloat(edtMaxDescentRate.Text);

    FData.Normal_Climb_Rate := StrToFloat(edtNormalClimbRate.Text);
    FData.Max_Climb_Rate := StrToFloat(edtMaxClimbRate.Text);
    {$ENDREGION}

    {$REGION ' Endurance '}
    FData.Endurance_Type := cbxEnduranceType.ItemIndex;

    FData.Max_Fuel_Capacity := StrToFloat(edtMaxFuelCapacity.Text);
    FData.Min_Speed_Fuel_Consume := StrToFloat(edtMinimum.Text);
    FData.High_Speed_Fuel_Consume := StrToFloat(edtHigh.Text);
    FData.Cruise_Speed_Fuel_Consume := StrToFloat(edtCruise.Text);
    FData.Max_Speed_Fuel_Consume := StrToFloat(edtMaximum.Text);
    FData.Fuel_Unit_Type := cbbUnits.ItemIndex;

    TimeToSecond(medtEnduranceTime.Text, second);
    FData.Endurance_Time := second;

    FData.Max_Effective_Range := StrToFloat(edtMaxEffectiveRange.Text);
    {$ENDREGION}

    if FData.Motion_Index = 0 then
    begin
      if dmTTT.InsertMotionCharacteristicDef(FData) then
        ShowMessage('Data has been saved');
    end
    else
    begin
      if dmTTT.UpdateMotionCharacteristicDef(FData) then
        ShowMessage('Data has been updated');
    end;
  end;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummaryMotion.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummaryMotion.cbxEnduranceTypeChange(Sender: TObject);
var
  timeStr : string;

begin
  grbFuel.Enabled := (cbxEnduranceType.ItemIndex = 0);
  grbEnduranceTime.Enabled := (cbxEnduranceType.ItemIndex = 1);
  grbMaxEffectiveRange.Enabled := (cbxEnduranceType.ItemIndex = 2);

  case cbxEnduranceType.ItemIndex of
    0:
    begin
      cbbUnits.ItemIndex := 0;

      SecondToTime(0, timeStr);
      medtEnduranceTime.Text := timeStr;

      edtMaxEffectiveRange.Text := '0.00';
    end;
    1:
    begin
      edtMaxFuelCapacity.Text := '0.00';
      edtMinimum.Text := '0.00';
      edtMaximum.Text := '0.00';
      edtCruise.Text := '0.00';
      edtHigh.Text := '0.00';
      cbbUnits.ItemIndex := -1;

      edtMaxEffectiveRange.Text := '0.00';
    end;
    2:
    begin
      edtMaxFuelCapacity.Text := '0.00';
      edtMinimum.Text := '0.00';
      edtMaximum.Text := '0.00';
      edtCruise.Text := '0.00';
      edtHigh.Text := '0.00';
      cbbUnits.ItemIndex := -1;

      SecondToTime(0, timeStr);
      medtEnduranceTime.Text := timeStr;
    end;
    3:
    begin
      edtMaxFuelCapacity.Text := '0.00';
      edtMinimum.Text := '0.00';
      edtMaximum.Text := '0.00';
      edtCruise.Text := '0.00';
      edtHigh.Text := '0.00';
      cbbUnits.ItemIndex := -1;

      SecondToTime(0, timeStr);
      medtEnduranceTime.Text := timeStr;

      edtMaxEffectiveRange.Text := '0.00';
    end;
  end;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryMotion.UpdateMotionData;
var
  timeStr : string;
begin
  with FSelectedMotion.FData do
  begin
    if Motion_Index = 0 then
      edtClass.Text := '(Unnamed)'
    else
      edtClass.Text := Motion_Identifier;

    {$REGION ' Horizontal '}
    LastName := edtClass.Text;
    cbbType.ItemIndex := Motion_Type;
    edtMinGroundSpeed.Text := FormatFloat('0.00', Min_Ground_Speed);
    edtCruiseGroundSpeed.Text := FormatFloat('0.00', Cruise_Ground_Speed);
    edtHighGroundSpeed.Text := FormatFloat('0.00', High_Ground_Speed);
    edtMaxGroundSpeed.Text := FormatFloat('0.00', Max_Ground_Speed);

    edtAcceleration.Text := FormatFloat('0.00', Acceleration);
    edtDeceleration.Text := FormatFloat('0.00', Deceleration);

    edtStandardTurnRate.Text := FormatFloat('0.0', Standard_Turn_Rate);
    edtTightTurnRate.Text := FormatFloat('0.0', Tight_Turn_Rate);

    edtMaxHelmAngle.Text := FormatFloat('0', Max_Helm_Angle);
    edtHelmAngleRate.Text := FormatFloat('0.0', Helm_Angle_Rate);
    {$ENDREGION}

    {$REGION ' Vertical '}
    edtMaxAltitude.Text := FormatFloat('0.0', Max_Altitude);
    edtMaxDepth.Text := FormatFloat('0.0', Max_Depth);
    edtVerticalAcceleration.Text := FormatFloat('0.00', Vertical_Accel);

    edtNormalClimbRate.Text := FormatFloat('0.00', Normal_Climb_Rate);
    edtMaxClimbRate.Text := FormatFloat('0.00', Max_Climb_Rate);

    edtNormalDescentRate.Text := FormatFloat('0.00', Normal_Descent_Rate);
    edtMaxDescentRate.Text := FormatFloat('0.00', Max_Descent_Rate);
    {$ENDREGION}

    {$REGION ' Endurance '}
    cbxEnduranceType.ItemIndex := Endurance_Type;
    cbxEnduranceType.OnChange(nil);

    edtMaxFuelCapacity.Text := FormatFloat('0.00', Max_Fuel_Capacity);
    edtMinimum.Text := FormatFloat('0.00', Min_Speed_Fuel_Consume);
    edtHigh.Text := FormatFloat('0.00', High_Speed_Fuel_Consume);
    edtCruise.Text := FormatFloat('0.00', Cruise_Speed_Fuel_Consume);
    edtMaximum.Text := FormatFloat('0.00', Max_Speed_Fuel_Consume);
    cbbUnits.ItemIndex := Fuel_Unit_Type;

    SecondToTime(Endurance_Time, timeStr);
    medtEnduranceTime.Text := timeStr;

    edtMaxEffectiveRange.Text := FormatFloat('0.00', Max_Effective_Range);
    {$ENDREGION}
  end;
end;

function TfrmSummaryMotion.CekInput: Boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtClass.Text = '') or (edtClass.Text = ' ') then
  begin
    ShowMessage('Please use another class name');
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
  if (dmTTT.GetMotionCharacteristicDef(edtClass.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedMotion.FData.Motion_Index= 0 then
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

function TfrmSummaryMotion.GetNumberOfKoma(s: string): Boolean;
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

procedure TfrmSummaryMotion.edtNumeralKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmSummaryMotion.ComboBoxDataChange(Sender: TObject);
begin
  if TComboBox(Sender).ItemIndex = -1 then
    TComboBox(Sender).ItemIndex := 0;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryMotion.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryMotion.ValidationFormatInput;
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
