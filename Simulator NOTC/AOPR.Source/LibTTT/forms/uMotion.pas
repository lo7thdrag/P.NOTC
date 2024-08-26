unit uMotion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_MotionCharacteristics;

type
  TMotionHorizontalForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    lblType: TStaticText;
    cbxType: TComboBox;
    PageControl1: TPageControl;
    Horizontal: TTabSheet;
    Vertical: TTabSheet;
    Endurance: TTabSheet;
    lblMinGroundSpeed: TStaticText;
    edtMinGroundSpeed: TEdit;
    lblKnotsMinGroundSpeed: TStaticText;
    lblCruiseGroundSpeed: TStaticText;
    edtCruiseGroundSpeed: TEdit;
    lblKnotsCruiseGroundSpeed: TStaticText;
    lblHighGroundSpeed: TStaticText;
    edtHighGroundSpeed: TEdit;
    lblMaxGroundSpeed: TStaticText;
    edtMaxGroundSpeed: TEdit;
    lblKnotsMaxGroundSpeed: TStaticText;
    lblAcceleration: TStaticText;
    edtAcceleration: TEdit;
    lblKnotsAcceleration: TStaticText;
    lblDeceleration: TStaticText;
    edtDeceleration: TEdit;
    lblKnotsDeceleration: TStaticText;
    lblStandardTurnRate: TStaticText;
    edtStandardTurnRate: TEdit;
    lblDegStandardTurnRate: TStaticText;
    lblTightTurnRate: TStaticText;
    edtTightTurnRate: TEdit;
    lblDegTightTurnRate: TStaticText;
    lblMaxHelmAngle: TStaticText;
    edtMaxHelmAngle: TEdit;
    lblDegreesMaxHelmAngle: TStaticText;
    lblHelmAngleRate: TStaticText;
    edtHelmAngleRate: TEdit;
    lblDegHelmAngleRate: TStaticText;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    lblKnotsHighgroundSpeed: TStaticText;
    lblMaxAltitude: TStaticText;
    edtMaxAltitude: TEdit;
    lblMetresMaxAltitude: TStaticText;
    lblMaxDepth: TStaticText;
    edtMaxDepth: TEdit;
    lblMetresMaxDepth: TStaticText;
    lblNormalClimbRate: TStaticText;
    edtNormalClimbRate: TEdit;
    lblFeetNormalClimbRate: TStaticText;
    lblMaxClimbRate: TStaticText;
    edtMaxClimbRate: TEdit;
    lblFeetMaxClimbRate: TStaticText;
    lblNormalDescentRate: TStaticText;
    edtNormalDescentRate: TEdit;
    lblFeetNormalDescentRate: TStaticText;
    lblMaxDescentRate: TStaticText;
    edtMaxDescentRate: TEdit;
    lblFeetMaxDescentRate: TStaticText;
    lblVerticalAcceleration: TStaticText;
    edtVerticalAcceleration: TEdit;
    lblFeetVerticalAcceleration: TStaticText;
    lblEnduranceType: TStaticText;
    cbxEnduranceType: TComboBox;
    grbFuel: TGroupBox;
    lblUnits: TStaticText;
    cbxUnits: TComboBox;
    lblMaxFuelCapacity: TStaticText;
    edtMaxFuelCapacity: TEdit;
    lblFuelConsumptionPerHour: TStaticText;
    lblMinimum: TStaticText;
    edtMinimum: TEdit;
    lblCruise: TStaticText;
    edtCruise: TEdit;
    lblHigh: TStaticText;
    edtHigh: TEdit;
    lblMaximum: TStaticText;
    edtMaximum: TEdit;
    grbEnduranceTime: TGroupBox;
    edtEnduranceTime: TEdit;
    lblEnduranceTime: TStaticText;
    grbMaxEffectiveRange: TGroupBox;
    edtMaxEffectiveRange: TEdit;
    lblnmMaxEffectiveRange: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure getMotionCharacteristic(id : Integer);
    procedure insert;
    procedure update;
  public
    { Public declarations }
    motionCharacteristic : TMotion_Characteristics;
    idMotion: Integer;
    isNew,isCopy: boolean;
    procedure refresh;
    procedure clear;
  end;

var
  MotionHorizontalForm: TMotionHorizontalForm;

implementation

uses uSimDBEditor, uMotionSingleList;

{$R *.dfm}

procedure TMotionHorizontalForm.getMotionCharacteristic(id : Integer);
begin
    uSimDBEditor.getMotion_Characteristics(id, motionCharacteristic);

    with motionCharacteristic do
    begin
      if isCopy then
        edtName.Text := 'Copy of ' + Fdata.Motion_Identifier
      else
        edtName.Text := Fdata.Motion_Identifier;

      edtMinGroundSpeed.Text := FloatToStr(Fdata.Min_Ground_Speed);
      edtCruiseGroundSpeed.Text := FloatToStr(Fdata.Cruise_Ground_Speed);
      edtHighGroundSpeed.Text := FloatToStr(Fdata.High_Ground_Speed);
      edtMaxGroundSpeed.Text := FloatToStr(Fdata.Max_Ground_Speed);
      edtAcceleration.Text := FloatToStr(Fdata.Acceleration);
      edtDeceleration.Text := FloatToStr(FData.Deceleration);
      edtStandardTurnRate.Text := FloatToStr(FData.Standard_Turn_Rate);
      edtTightTurnRate.Text := FloatToStr(Fdata.Tight_Turn_Rate);
      edtMaxHelmAngle.Text := FloatToStr(Fdata.Max_Helm_Angle);
      edtHelmAngleRate.Text := FloatToStr(Fdata.Helm_Angle_Rate);
      edtMaxAltitude.Text := FloatToStr(Fdata.Max_Altitude);
      edtMaxDepth.Text := FloatToStr(Fdata.Max_Depth);
      edtNormalClimbRate.Text := FloatToStr(Fdata.Normal_Climb_Rate);
      edtMaxClimbRate.Text := FloatToStr(Fdata.Max_Climb_Rate);
      edtNormalDescentRate.Text := FloatToStr(Fdata.Normal_Descent_Rate);
      edtMaxDescentRate.Text := FloatToStr(Fdata.Max_Descent_Rate);
      edtVerticalAcceleration.Text := FloatToStr(Fdata.Vertical_Accel);
      edtMaxFuelCapacity.Text := FloatToStr(Fdata.Max_Fuel_Capacity);
      edtMinimum.Text := FloatToStr(Fdata.Min_Speed_Fuel_Consume);
      edtCruise.Text := FloattoStr(FData.Cruise_Speed_Fuel_Consume);
      edtHigh.Text := FloatToStr(Fdata.High_Speed_Fuel_Consume);
      edtMaximum.Text := FloatToStr(Fdata.Max_Speed_Fuel_Consume);
      edtEnduranceTime.Text := FloatToStr(Fdata.Endurance_Time);
      edtMaxEffectiveRange.Text := FloatToStr(Fdata.Max_Effective_Range);

      if FData.Motion_Type = 0 then
        cbxType.Text := 'Mobile'
      else if FData.Motion_Type = 1 then
        cbxType.Text := 'Fixed'
      else if FData.Motion_Type = 2 then
        cbxType.Text := 'Drift-Current';

      if FData.Endurance_Type = 0 then
        cbxEnduranceType.Text := 'Fuel'
      else if FData.Endurance_Type = 1 then
        cbxEnduranceType.Text := 'Time'
      else if FData.Endurance_Type = 2 then
        cbxEnduranceType.Text := 'Range'
      else if FData.Endurance_Type = 3 then
        cbxEnduranceType.Text := 'Unlimited';

      if FData.Fuel_Unit_Type = 0 then
        cbxUnits.Text := 'cubic metres'
      else if FData.Fuel_Unit_Type = 1 then
        cbxUnits.Text := 'US Gallons'
      else if FData.Fuel_Unit_Type = 2 then
        cbxUnits.Text := 'pounds'
      else if FData.Fuel_Unit_Type = 3 then
        cbxUnits.Text := 'kilograms'
      else if FData.Fuel_Unit_Type = 4 then
        cbxUnits.Text := 'litres'
      else if FData.Fuel_Unit_Type = 5 then
        cbxUnits.Text := 'metris tonnes';

    end;
end;

procedure TMotionHorizontalForm.refresh;
begin
  getMotionCharacteristic(idMotion);
end;

procedure TMotionHorizontalForm.FormCreate(Sender: TObject);
begin
  motionCharacteristic := TMotion_Characteristics.Create;
end;

procedure TMotionHorizontalForm.FormShow(Sender: TObject);
begin
  //
end;

procedure TMotionHorizontalForm.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    insert;
    isNew := false;
   // fmotionSingleList.refresh;
  end
  else
  begin
    update;
  end;
end;

procedure TMotionHorizontalForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMotionHorizontalForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fMotionSingleList.refresh;
end;

procedure TMotionHorizontalForm.clear;
begin
  with motionCharacteristic do
    begin
      edtName.Text := '';
      cbxType.Text := '';
      edtMinGroundSpeed.Text := '';
      edtCruiseGroundSpeed.Text := '';
      edtHighGroundSpeed.Text := '';
      edtMaxGroundSpeed.Text := '';
      edtAcceleration.Text := '';
      edtDeceleration.Text := '';
      edtStandardTurnRate.Text := '';
      edtTightTurnRate.Text := '';
      edtMaxHelmAngle.Text := '';
      edtHelmAngleRate.Text := '';
      edtMaxAltitude.Text := '';
      edtMaxDepth.Text := '';
      edtNormalClimbRate.Text := '';
      edtMaxClimbRate.Text := '';
      edtNormalDescentRate.Text := '';
      edtMaxDescentRate.Text := '';
      edtVerticalAcceleration.Text := '';
      edtMaxFuelCapacity.Text := '';
      edtMinimum.Text := '';
      edtCruise.Text := '';
      edtHigh.Text := '';
      edtMaximum.Text := '';
      edtEnduranceTime.Text := '';
      edtMaxEffectiveRange.Text := '';
      cbxEnduranceType.Text := '';
      cbxUnits.Text := '';
    end;
end;

procedure TMotionHorizontalForm.insert;
begin
  //
  with motionCharacteristic.FData do
  begin
    Motion_Identifier := edtName.Text;
    Motion_Type := cbxType.ItemIndex;
    Max_Altitude := StrToFloat(edtMaxAltitude.Text);
    Max_Depth := StrToFloat(edtMaxDepth.Text);
    Min_Ground_Speed := StrToFloat(edtMinGroundSpeed.Text);
    Cruise_Ground_Speed := StrToFloat(edtCruiseGroundSpeed.Text);
    High_Ground_Speed := StrToFloat(edtHighGroundSpeed.Text);
    Max_Ground_Speed := StrToFloat(edtMaxGroundSpeed.Text);
    Acceleration := StrToFloat(edtAcceleration.Text);
    Deceleration := StrToFloat(edtDeceleration.Text);
    Normal_Climb_Rate := StrToFloat(edtNormalClimbRate.Text);
    Max_Climb_Rate := StrToFloat(edtMaxClimbRate.Text);
    Normal_Descent_Rate := StrToFloat(edtNormalDescentRate.Text);
    Max_Descent_Rate := StrToFloat(edtMaxDescentRate.Text);
    Vertical_Accel := StrToFloat(edtVerticalAcceleration.Text);
    Standard_Turn_Rate := StrToFloat(edtStandardTurnRate.Text);
    Tight_Turn_Rate := StrToFloat(edtTightTurnRate.Text);
    Max_Helm_Angle := StrToFloat(edtMaxHelmAngle.Text);
    Helm_Angle_Rate := StrToFloat(edtHelmAngleRate.Text);
    //Speed_Reduce_In_Turn := StrToFloat(edt);
    //Time_To_Reduce_Speed := StrToFloat(edt);
    //Min_Speed_To_Reduce := StrToFloat(edtmin);
    //Rate_of_Turn_Rate_Chg := StrToFloat();
    //Min_Pitch_Angle := StrToFloat(edtMinimum.Text);
    //Max_Pitch_Angle := StrToFloat();
    //Max_Roll_Angle := StrToFloat();

    if cbxEnduranceType.Text = 'Fuel' then
      Endurance_Type := 0
    else if cbxEnduranceType.Text = 'Time' then
      Endurance_Type := 1
    else if cbxEnduranceType.Text = 'Range' then
      Endurance_Type := 2
    else if cbxEnduranceType.Text = 'Unlimited' then
      Endurance_Type := 3;

    Endurance_Time := StrToInt(edtEnduranceTime.Text);
    Max_Effective_Range := StrToFloat(edtMaxEffectiveRange.Text);

    if cbxUnits.Text = 'cubic metres' then
      Fuel_Unit_Type := 0
    else if cbxUnits.Text = 'US gallons' then
      Fuel_Unit_Type := 1
    else if cbxUnits.Text = 'pounds' then
      Fuel_Unit_Type := 2
    else if cbxUnits.Text = 'kilograms' then
      Fuel_Unit_Type := 3
    else if cbxUnits.Text = 'litres' then
      Fuel_Unit_Type := 4
    else if cbxUnits.Text = 'metric tonnes' then
      Fuel_Unit_Type := 5;

    Max_Fuel_Capacity := StrToFloat(edtMaxFuelCapacity.Text);
    Min_Speed_Fuel_Consume := StrToFloat(edtMinimum.Text);
    Cruise_Speed_Fuel_Consume := StrToFloat(edtCruise.Text);
    High_Speed_Fuel_Consume := StrToFloat(edtHigh.Text);
    //Max_Speed_Fuel_Consume := StrToFloat(edt);
  end;

  uSimDBEditor.insertMotion(motionCharacteristic);
end;

procedure TMotionHorizontalForm.update;
begin
  with motionCharacteristic.FData do
  begin
    Motion_Identifier := edtName.Text;
    Motion_Type := cbxType.ItemIndex;
    Max_Altitude := StrToFloat(edtMaxAltitude.Text);
    Max_Depth := StrToFloat(edtMaxDepth.Text);
    Min_Ground_Speed := StrToFloat(edtMinGroundSpeed.Text);
    Cruise_Ground_Speed := StrToFloat(edtCruiseGroundSpeed.Text);
    High_Ground_Speed := StrToFloat(edtHighGroundSpeed.Text);
    Max_Ground_Speed := StrToFloat(edtMaxGroundSpeed.Text);
    Acceleration := StrToFloat(edtAcceleration.Text);
    Deceleration := StrToFloat(edtDeceleration.Text);
    Normal_Climb_Rate := StrToFloat(edtNormalClimbRate.Text);
    Max_Climb_Rate := StrToFloat(edtMaxClimbRate.Text);
    Normal_Descent_Rate := StrToFloat(edtNormalDescentRate.Text);
    Max_Descent_Rate := StrToFloat(edtMaxDescentRate.Text);
    Vertical_Accel := StrToFloat(edtVerticalAcceleration.Text);
    Standard_Turn_Rate := StrToFloat(edtStandardTurnRate.Text);
    Tight_Turn_Rate := StrToFloat(edtTightTurnRate.Text);
    Max_Helm_Angle := StrToFloat(edtMaxHelmAngle.Text);
    Helm_Angle_Rate := StrToFloat(edtHelmAngleRate.Text);
    //Speed_Reduce_In_Turn := StrToFloat(edt);
    //Time_To_Reduce_Speed := StrToFloat(edt);
    //Min_Speed_To_Reduce := StrToFloat(edtmin);
    //Rate_of_Turn_Rate_Chg := StrToFloat();
    //Min_Pitch_Angle := StrToFloat(edtMinimum.Text);
    //Max_Pitch_Angle := StrToFloat();
    //Max_Roll_Angle := StrToFloat();
    Endurance_Type := cbxEnduranceType.ItemIndex;
    Endurance_Time := StrToInt(edtEnduranceTime.Text);
    Max_Effective_Range := StrToFloat(edtMaxEffectiveRange.Text);
    Fuel_Unit_Type := cbxUnits.ItemIndex;
    Max_Fuel_Capacity := StrToFloat(edtMaxFuelCapacity.Text);
    Min_Speed_Fuel_Consume := StrToFloat(edtMinimum.Text);
    Cruise_Speed_Fuel_Consume := StrToFloat(edtCruise.Text);
    High_Speed_Fuel_Consume := StrToFloat(edtHigh.Text);
    //Max_Speed_Fuel_Consume := StrToFloat(edt);
  end;

  uSimDBEditor.updateMotion(motionCharacteristic, IntToStr(motionCharacteristic.FData.Motion_Index));
end;

end.
