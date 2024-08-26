unit uEnvironmentCharacteristicsWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_GameEnvironment, urotWheel,
  uDBAssets_SubAreaEnviroDefinition, Buttons;

type
  TEnvironmentCharacteristicsWindowForm = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    PageControl1: TPageControl;
    SurfaceAndSubsurface: TTabSheet;
    ConvergenceZones: TTabSheet;
    Boundaries: TTabSheet;
    grbOceanCurrent: TGroupBox;
    grbSoundVelocity: TGroupBox;
    grbSurfaceDucting: TGroupBox;
    lblSpeed: TStaticText;
    lblDirection: TStaticText;
    edtSpeed: TEdit;
    edtDirection: TEdit;
    lblKnots: TStaticText;
    lblDeg: TStaticText;
    lbSoundVelocity: TStaticText;
    lblUpperLimitSurface: TStaticText;
    lblLowerLimitSurface: TStaticText;
    edtUpperLimitSurfaceDucting: TEdit;
    edtLowerLimitSurfaceDucting: TEdit;
    lblFeetUpperSurfaceDucting: TStaticText;
    lblFeetLowerSurfaceDucting: TStaticText;
    grbSubsurfaceDucting: TGroupBox;
    grbSpeedOfSound: TGroupBox;
    lblShippingRate: TStaticText;
    cbxShippingRate: TComboBox;
    lblDepthOfThermalLayer: TStaticText;
    edtDepthOfThermalLayer: TEdit;
    lblFeet: TStaticText;
    lblSeaState: TStaticText;
    trackSeaState: TTrackBar;
    edtSeaState: TEdit;
    lblStillSeaState: TStaticText;
    lblHeavySeaState: TStaticText;
    lblBottomLossCoeff: TStaticText;
    trackBottomLossCoeff: TTrackBar;
    edtBottomLossCoeff: TEdit;
    lbl1BottomLossCoeff: TStaticText;
    lbl9BottomLossCoeff: TStaticText;
    lblSurfaceTemperature: TStaticText;
    edtSurfaceTemperature: TEdit;
    lblDegC: TStaticText;
    lblAverageOceanDepth: TStaticText;
    edtAverageOceanDepth: TEdit;
    lblFeetAverageOceanDepth: TStaticText;
    lblShadowZone: TStaticText;
    edtShadowZone: TEdit;
    lblDBShadowZone: TStaticText;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    AboveWater: TTabSheet;
    lblSurface: TStaticText;
    edtSurface: TEdit;
    lblFeetPerSec1: TStaticText;
    lblLayer: TStaticText;
    edtLayer: TEdit;
    lblFeetPerSec2: TStaticText;
    lblBottom: TStaticText;
    edtBottom: TEdit;
    lblFeetPerSec3: TStaticText;
    cbSurfaceDucting: TCheckBox;
    cbSubsurfaceDucting: TCheckBox;
    lblUpperLimitSubsurface: TStaticText;
    lblLowerLimitSubsurface: TStaticText;
    edtUpperLimitSubsurfaceDucting: TEdit;
    edtLowerLimitSubsurfaceDucting: TEdit;
    lblFeetUpperSubsurfaceDucting: TStaticText;
    lblFeetLowerSubsurfaceDucting: TStaticText;
    grbCoverageZones: TGroupBox;
    lblRangeInterval: TStaticText;
    lblWidthOfFirstCZ: TStaticText;
    edtRangeInterval: TEdit;
    edtWidthOfFirstCZ: TEdit;
    lbnmRange: TStaticText;
    lblnmWidth: TStaticText;
    cbCoverageZones: TCheckBox;
    lblFirstCZSignal: TStaticText;
    lblAttenuation: TStaticText;
    edtFirstCZSignalIncrease: TEdit;
    edtAttenuation: TEdit;
    lbdBFirstCZ: TStaticText;
    lbldBAttenuation: TStaticText;
    lblMaxSonarTarget: TStaticText;
    edtMaxSonarTarget: TEdit;
    lblFeetMaxSonarTarget: TStaticText;
    grbTopLeft: TGroupBox;
    GroupBox2: TGroupBox;
    grbAtmospheric: TGroupBox;
    grbCommunicationEffects: TGroupBox;
    lblPositionTopLeft: TStaticText;
    edtPositionTopLeft1: TEdit;
    edtPositionTopLeft2: TEdit;
    lblGridTopLeft: TStaticText;
    edtGridTopLeft1: TEdit;
    edtGridTopLeft2: TEdit;
    edtPositionBottomRight1: TEdit;
    edtPositionBottomRight2: TEdit;
    lblGridBottomRight: TStaticText;
    edtGridBottomRight1: TEdit;
    edtGridBottomRight2: TEdit;
    trackAtmospheric: TTrackBar;
    edtAtmospheric: TEdit;
    lbl1Atmospheric: TStaticText;
    lbl100Atmospheric: TStaticText;
    grbLegendTrackAtmospheric: TGroupBox;
    lblLegend1: TStaticText;
    lblLegend2: TStaticText;
    lblLegend3: TStaticText;
    cbHFTransmission: TCheckBox;
    lblPositionBottomRight: TStaticText;
    grp2: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    edtDayVis: TEdit;
    edtNightVis: TEdit;
    trbDaytimeVisual: TTrackBar;
    trbNighttimeVisual: TTrackBar;
    trbDaytimeInfra: TTrackBar;
    trbNighttimeInfra: TTrackBar;
    edtNightInfra: TEdit;
    edtDayInfra: TEdit;
    grp3: TGroupBox;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    edtAttenRainRate: TEdit;
    edtAttenCloud: TEdit;
    trckbrAttenRainRate: TTrackBar;
    trckbrAttenCloud: TTrackBar;
    edtAirTemp: TEdit;
    edtBarometricPressure: TEdit;
    edtCloudBaseHeight: TEdit;
    grp1: TGroupBox;
    txt1: TStaticText;
    txt2: TStaticText;
    edtAboveSpeed: TEdit;
    edtAboveDirection: TEdit;
    txt3: TStaticText;
    txt4: TStaticText;
    grp4: TGroupBox;
    txt5: TStaticText;
    txt6: TStaticText;
    edtAboveHFStart: TEdit;
    edtAboveHFEnd: TEdit;
    txt7: TStaticText;
    txt8: TStaticText;
    txt9: TStaticText;
    txt10: TStaticText;
    edtSunrise: TEdit;
    edtSunset: TEdit;
    edtTwilight: TEdit;
    pnWheel: TPanel;
    pnlOC: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel4: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure trbDaytimeVisualChange(Sender: TObject);
    procedure trbNighttimeVisualChange(Sender: TObject);
    procedure trbDaytimeInfraChange(Sender: TObject);
    procedure trbNighttimeInfraChange(Sender: TObject);
    procedure trckbrAttenRainRateChange(Sender: TObject);
    procedure trckbrAttenCloudChange(Sender: TObject);
    procedure trackSeaStateChange(Sender: TObject);
    procedure trackBottomLossCoeffChange(Sender: TObject);
    procedure trackAtmosphericChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure edtDayVisChange(Sender: TObject);
    procedure edtNightVisChange(Sender: TObject);
    procedure edtDayInfraChange(Sender: TObject);
    procedure edtNightInfraChange(Sender: TObject);
    procedure edtAttenRainRateChange(Sender: TObject);
    procedure edtAttenCloudChange(Sender: TObject);
    procedure edtSeaStateChange(Sender: TObject);
    procedure edtBottomLossCoeffChange(Sender: TObject);
    procedure edtAtmosphericChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure edtAboveDirectionExit(Sender: TObject);
    procedure edtAboveDirectionKeyPress(Sender: TObject; var Key: Char);
    procedure edtDirectionExit(Sender: TObject);
    procedure edtDirectionKeyPress(Sender: TObject; var Key: Char);
    procedure edtAboveSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure edtAboveSpeedKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAboveHFStartKeyPress(Sender: TObject; var Key: Char);
    procedure edtAboveHFStartKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAboveHFEndKeyPress(Sender: TObject; var Key: Char);
    procedure edtAboveHFEndKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDayVisKeyPress(Sender: TObject; var Key: Char);
    procedure edtDayVisKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNightVisKeyPress(Sender: TObject; var Key: Char);
    procedure edtNightVisKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDayInfraKeyPress(Sender: TObject; var Key: Char);
    procedure edtDayInfraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNightInfraKeyPress(Sender: TObject; var Key: Char);
    procedure edtNightInfraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAttenRainRateKeyPress(Sender: TObject; var Key: Char);
    procedure edtAttenRainRateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAttenCloudKeyPress(Sender: TObject; var Key: Char);
    procedure edtAttenCloudKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBarometricPressureKeyPress(Sender: TObject; var Key: Char);
    procedure edtBarometricPressureKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAirTempKeyPress(Sender: TObject; var Key: Char);
    procedure edtAirTempKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCloudBaseHeightKeyPress(Sender: TObject; var Key: Char);
    procedure edtCloudBaseHeightKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure edtSpeedKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtDepthOfThermalLayerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDepthOfThermalLayerKeyPress(Sender: TObject; var Key: Char);
    procedure edtSurfaceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSurfaceKeyPress(Sender: TObject; var Key: Char);
    procedure edtLayerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLayerKeyPress(Sender: TObject; var Key: Char);
    procedure edtBottomKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBottomKeyPress(Sender: TObject; var Key: Char);
    procedure edtUpperLimitSurfaceDuctingKeyown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUpperLimitSurfaceDuctingKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtLowerLimitSurfaceDuctingKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLowerLimitSurfaceDuctingKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtUpperLimitSubsurfaceDuctingKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtUpperLimitSubsurfaceDuctingKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtSeaStateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSeaStateKeyPress(Sender: TObject; var Key: Char);
    procedure edtBottomLossCoeffKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBottomLossCoeffKeyPress(Sender: TObject; var Key: Char);
    procedure edtDepthOfThermalLayerKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSurfaceKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLayerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBottomKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUpperLimitSurfaceDuctingKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLowerLimitSurfaceDuctingKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUpperLimitSubsurfaceDuctingKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtLowerLimitSubsurfaceDuctingKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtLowerLimitSubsurfaceDuctingKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtSeaStateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBottomLossCoeffKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSurfaceTemperatureKeyPress(Sender: TObject; var Key: Char);
    procedure edtSurfaceTemperatureKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAverageOceanDepthKeyPress(Sender: TObject; var Key: Char);
    procedure edtAverageOceanDepthKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtShadowZoneKeyPress(Sender: TObject; var Key: Char);
    procedure edtShadowZoneKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRangeIntervalKeyPress(Sender: TObject; var Key: Char);
    procedure edtRangeIntervalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtWidthOfFirstCZKeyPress(Sender: TObject; var Key: Char);
    procedure edtWidthOfFirstCZKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFirstCZSignalIncreaseKeyPress(Sender: TObject; var Key: Char);
    procedure edtFirstCZSignalIncreaseKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAttenuationKeyPress(Sender: TObject; var Key: Char);
    procedure edtAttenuationKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaxSonarTargetKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxSonarTargetKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAtmosphericKeyPress(Sender: TObject; var Key: Char);
    procedure edtAtmosphericKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAboveDirectionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDirectionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure getData;
    procedure cbCoverageZonesClick(Sender: TObject);

  private
    { Private declarations }
    procedure RotWheelDegreChange(Sender: TObject);
    procedure RotWheelDegreOCChange(Sender: TObject);
    procedure EnvironmentCharacteristicsupdate;
    procedure EnvironmentGlobalCharacteristicsupdate;
  public
    { Public declarations }
    GameEnviroDef : TGame_Environment_Definition;
    sub_Area_envi : TSubArea_Enviro_Definition;
    sub_Area      : TSubArea_Enviro_Definition;
    id            : Integer;

    rw,rw1 : TRotWheel;
    procedure updateSubGameArea(id: Integer; var sub_Area: TSubArea_Enviro_Definition);
//    function TimeToSecond(t : TTime): Integer;
  end;

var
  EnvironmentCharacteristicsWindowForm: TEnvironmentCharacteristicsWindowForm;

implementation

{$R *.dfm}

uses  ufrmSummaryEnvironment,ufrmAvailableEnvironment, uDataModuleTTT,
  uCharacteristicLandmass, tttData, newClassASTT;

procedure TEnvironmentCharacteristicsWindowForm.RotWheelDegreChange(Sender: TObject);
begin
  edtAboveDirection.Text := formatFloat('000.0', rw.Degree);
end;

procedure TEnvironmentCharacteristicsWindowForm.RotWheelDegreOCChange(Sender: TObject);
begin
 edtDirection.Text := formatFloat('000.0', rw1.Degree);
end;

procedure TEnvironmentCharacteristicsWindowForm.SpeedButton1Click(
  Sender: TObject);
begin
  lbSoundVelocity.Caption := 'Positive';
end;

procedure TEnvironmentCharacteristicsWindowForm.SpeedButton2Click(
  Sender: TObject);
begin
  lbSoundVelocity.Caption := 'Negative';
end;

procedure TEnvironmentCharacteristicsWindowForm.btnApplyClick(
  Sender: TObject);
begin
  try
    rw.Degree  := StrToFloat(edtAboveDirection.Text);
    rw1.Degree := StrToFloat(edtDirection.Text);
    EnvironmentCharacteristicsupdate;
    EnvironmentGlobalCharacteristicsupdate;
  except

  end;

 { if Button1.Tag = 2 then
  begin
    edtLayer.Text >= '230000';
    edtSurface.Text >= '230000';
    ShowMessage('Incorrect value');
  end
  else
  if Button1.Tag = 3 then
  begin
    edtSurface.Text <= '230000';
    edtLayer.Text <= '230000' ;
    ShowMessage('Incorrect value');
  end; }
end;

procedure TEnvironmentCharacteristicsWindowForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TEnvironmentCharacteristicsWindowForm.btnOKClick(Sender: TObject);
begin
  try
   btnApplyClick(Sender);
  except
   Close;
  end;
  Close;
end;

procedure TEnvironmentCharacteristicsWindowForm.Button1Click(
  Sender: TObject);
begin
 with GameEnviroDef.FData do begin
  case TButton(Sender).Tag of
    0 :
      begin
        lbSoundVelocity.Alignment := taCenter;
        lbSoundVelocity.Caption := 'Positive';
        edtLayer.Enabled := False;
        edtLayer.Text := '0';
        Sound_Velocity_Type := 0;
      end;
    1 :
      begin
        lbSoundVelocity.Alignment := taCenter;
        lbSoundVelocity.Caption := 'Negative';
        edtLayer.Enabled := False;
        edtLayer.Text := '0';
        Sound_Velocity_Type := 1;
      end;
    2 :
      begin
        lbSoundVelocity.Alignment := taCenter;
        lbSoundVelocity.Caption := 'Positive over negative';
        edtLayer.Enabled := True;
        Sound_Velocity_Type := 2;
      end;
    3 :
      begin
        lbSoundVelocity.Alignment := taCenter;
        lbSoundVelocity.Caption := 'Negative over positive';
        edtLayer.Enabled := True;
        Sound_Velocity_Type := 3;
      end;
  end;
 end;
end;

procedure TEnvironmentCharacteristicsWindowForm.Button2Click(
  Sender: TObject);
begin
//  lbSoundVelocity.Alignment := taCenter;
//  lbSoundVelocity.Caption := 'Negative';
//  edtLayer.Enabled := False;
//  edtLayer.Text := '0';
end;

procedure TEnvironmentCharacteristicsWindowForm.Button3Click(
  Sender: TObject);
begin
//  lbSoundVelocity.Alignment := taCenter;
//  lbSoundVelocity.Caption := 'Positive over negative';
//  edtLayer.Enabled := True;
end;

procedure TEnvironmentCharacteristicsWindowForm.Button4Click(
  Sender: TObject);
begin
//  lbSoundVelocity.Alignment := taCenter;
//  lbSoundVelocity.Caption := 'Negative over positive';
//  edtLayer.Enabled := True;
end;

procedure TEnvironmentCharacteristicsWindowForm.cbCoverageZonesClick(
  Sender: TObject);
begin
   edtRangeInterval.Enabled         := True;
   edtRangeInterval.Color           := clWindow;
   edtWidthOfFirstCZ.Enabled        := True;
   edtWidthOfFirstCZ.Color          := clWindow;
   edtFirstCZSignalIncrease.Enabled := True;
   edtFirstCZSignalIncrease.Color   := clWindow;
   edtAttenuation.Enabled           := True;
   edtAttenuation.Color             := clWindow;
   edtMaxSonarTarget.Enabled        := True;
   edtMaxSonarTarget.Color          := clWindow;
   if cbCoverageZones.Checked = False then
   begin
   edtRangeInterval.Enabled := False;
   edtWidthOfFirstCZ.Enabled := False;
   edtFirstCZSignalIncrease.Enabled := False;
   edtAttenuation.Enabled := False;
   edtMaxSonarTarget.Enabled := False;
   edtRangeInterval.Color           := clMenuBar;
   edtWidthOfFirstCZ.Color          := clMenuBar;
   edtFirstCZSignalIncrease.Color   := clMenuBar;
   edtAttenuation.Color             := clMenuBar;
   edtMaxSonarTarget.Color          := clMenuBar;
   end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAboveDirectionExit(
  Sender: TObject);
var d: double;
begin
  if edtAboveDirection.Text <> '' then
  begin
    try
     d := StrToFloat(edtAboveDirection.Text);
    except
     on EConvertError do begin
       edtAboveDirection.Text := '0.0';
       d := 0.0;
     end;

    end;
    rw.Degree := d;
  end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAboveDirectionKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAboveDirection.Text := FormatFloat('0.00', StrToFloat(edtAboveDirection.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAboveDirectionKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtAboveDirection.Text = '' then
    Exit;

   if (StrToFloat(edtAboveDirection.Text) > 360)  then
    begin
      ShowMessage('Incorrect value');
      edtAboveDirection.Text := '360';
    //  edtAboveDirection.Text := FormatFloat('0.00', StrToFloat(edtAboveDirection.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAboveHFEndKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAboveHFEnd.Text := FormatFloat('0.00', StrToFloat(edtAboveHFEnd.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAboveHFEndKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtAboveHFEnd.Text = '' then
    Exit;

   if (StrToFloat(edtAboveHFEnd.Text) > 760)  then
    begin
      ShowMessage('Incorrect value');
      edtAboveHFEnd.Text := '760';
    //  edtAboveHFEnd.Text := FormatFloat('0.00', StrToFloat(edtAboveHFEnd.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAboveHFStartKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAboveHFStart.Text := FormatFloat('0.00', StrToFloat(edtAboveHFStart.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAboveHFStartKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtAboveHFStart.Text = '' then
    Exit;

   if (StrToFloat(edtAboveHFStart.Text) > 570)  then
    begin
      ShowMessage('Incorrect value');
      edtAboveHFStart.Text := '570';
    //  edtAboveHFStart.Text := FormatFloat('0.00', StrToFloat(edtAboveHFStart.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAboveSpeedKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAboveSpeed.Text := FormatFloat('0.00', StrToFloat(edtAboveSpeed.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAboveSpeedKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtAboveSpeed.Text = '' then
    Exit;

   if (StrToFloat(edtAboveSpeed.Text) > 500)  then
    begin
      ShowMessage('Incorrect value');
      edtAboveSpeed.Text := '500';
    //  edtAboveSpeed.Text := FormatFloat('0.00', StrToFloat(edtAboveSpeed.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAirTempKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAirTemp.Text := FormatFloat('0.00', StrToFloat(edtAirTemp.Text));
end;


procedure TEnvironmentCharacteristicsWindowForm.edtAirTempKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtAirTemp.Text = '' then
    Exit;

   if (StrToFloat(edtAirTemp.Text) > 100)  then
    begin
      ShowMessage('Incorrect value');
      edtAirTemp.Text := '100';
    //  edtAirTemp.Text := FormatFloat('0.00', StrToFloat(edtAirTemp.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAtmosphericChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trackAtmospheric.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAtmosphericKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAtmospheric.Text := FormatFloat('0.00', StrToFloat(edtAtmospheric.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAtmosphericKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtAtmospheric.Text = '' then
    Exit;

   if (StrToFloat(edtAtmospheric.Text) > 1000)  then
    begin
      ShowMessage('Incorrect value');
      edtAtmospheric.Text := '1000';
    //  edtAtmospheric.Text := FormatFloat('0.00', StrToFloat(edtAtmospheric.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAttenCloudChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trckbrAttenCloud.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAttenCloudKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAttenCloud.Text := FormatFloat('0.00', StrToFloat(edtAttenCloud.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAttenCloudKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtAttenCloud.Text = '' then
    Exit;

   if (StrToFloat(edtAttenCloud.Text) > 6)  then
    begin
      ShowMessage('Incorrect value');
      edtAttenCloud.Text := '6';
    //  edtAttenCloud.Text := FormatFloat('0.00', StrToFloat(edtAttenCloud.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAttenRainRateChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trckbrAttenRainRate.Position := StrToInt((Sender as TEdit).Text);;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAttenRainRateKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAttenRainRate.Text := FormatFloat('0.00', StrToFloat(edtAttenRainRate.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAttenRainRateKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtAttenRainRate.Text = '' then
    Exit;

   if (StrToFloat(edtAttenRainRate.Text) > 6)  then
    begin
      ShowMessage('Incorrect value');
      edtAttenRainRate.Text := '6';
    //  edtAttenRainRate.Text := FormatFloat('0.00', StrToFloat(edtAttenRainRate.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAttenuationKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAttenuation.Text := FormatFloat('0.00', StrToFloat(edtAttenuation.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAttenuationKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtAttenuation.Text = '' then
    Exit;

   if (StrToFloat(edtAttenuation.Text) > 94500)  then
    begin
      ShowMessage('Incorrect value');
      edtAttenuation.Text := '94500';
    //  edtAttenuation.Text := FormatFloat('0.00', StrToFloat(edtAttenuation.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAverageOceanDepthKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAverageOceanDepth.Text := FormatFloat('0.00', StrToFloat(edtAverageOceanDepth.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAverageOceanDepthKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtAverageOceanDepth.Text = '' then
    Exit;

   if (StrToFloat(edtAverageOceanDepth.Text) > 88500)  then
    begin
      ShowMessage('Incorrect value');
      edtAverageOceanDepth.Text := '88500';
    //  edtAverageOceanDepth.Text := FormatFloat('0.00', StrToFloat(edtAverageOceanDepth.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtBarometricPressureKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtBarometricPressure.Text := FormatFloat('0.00', StrToFloat(edtBarometricPressure.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtBarometricPressureKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtBarometricPressure.Text = '' then
    Exit;

   if (StrToFloat(edtBarometricPressure.Text) > 50700)  then
    begin
      ShowMessage('Incorrect value');
      edtBarometricPressure.Text := '50700';
    //  edtBarometricPressure.Text := FormatFloat('0.00', StrToFloat(edtBarometricPressure.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtBottomKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  tmpFloat : Double;
begin

 // if not (Key in[#48 .. #57, #8, #13, #46]) then
 //   Key := #0;

 // if key = #13 then
  //  edtBottom.Text := FormatFloat('0.00', StrToFloat(edtBottom.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtBottomKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtBottom.Text := FormatFloat('0.00', StrToFloat(edtBottom.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtBottomKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtBottom.Text = '' then
    Exit;

   if (StrToFloat(edtBottom.Text) > 230000)  then
    begin
      ShowMessage('Incorrect value');
      edtBottom.Text := '230000';
    //  edtBottom.Text := FormatFloat('0.00', StrToFloat(edtBottom.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtBottomLossCoeffChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trackBottomLossCoeff.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtBottomLossCoeffKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  tmpFloat : Double;
begin

//  if not (Key in[#48 .. #57, #8, #13, #46]) then
//    Key := #0;
//
//  if key = #13 then
//    edtBottomLossCoeff.Text := FormatFloat('0.00', StrToFloat(edtBottomLossCoeff.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtBottomLossCoeffKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtBottomLossCoeff.Text := FormatFloat('0.00', StrToFloat(edtBottomLossCoeff.Text));
end;


procedure TEnvironmentCharacteristicsWindowForm.edtBottomLossCoeffKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtBottomLossCoeff.Text = '' then
    Exit;

   if (StrToFloat(edtBottomLossCoeff.Text) > 9)  then
    begin
      ShowMessage('Incorrect value');
      edtBottomLossCoeff.Text := '9';
    //  edtBottomLossCoeff.Text := FormatFloat('0.00', StrToFloat(edtBottomLossCoeff.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtCloudBaseHeightKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtCloudBaseHeight.Text := FormatFloat('0.00', StrToFloat(edtCloudBaseHeight.Text));
end;


procedure TEnvironmentCharacteristicsWindowForm.edtCloudBaseHeightKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtCloudBaseHeight.Text = '' then
    Exit;

   if (StrToFloat(edtCloudBaseHeight.Text) > 44500)  then
    begin
      ShowMessage('Incorrect value');
      edtCloudBaseHeight.Text := '44500';
    //  edtCloudBaseHeight.Text := FormatFloat('0.00', StrToFloat(edtCloudBaseHeight.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDayInfraChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trbDaytimeInfra.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDayInfraKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtDayInfra.Text := FormatFloat('0.00', StrToFloat(edtDayInfra.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDayInfraKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtDayInfra.Text = '' then
    Exit;

   if (StrToFloat(edtDayInfra.Text) > 100)  then
    begin
      ShowMessage('Incorrect value');
      edtDayInfra.Text := '100';
    //  edtDayInfra.Text := FormatFloat('0.00', StrToFloat(edtDayInfra.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDayVisChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trbDaytimeVisual.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDayVisKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtDayVis.Text := FormatFloat('0.00', StrToFloat(edtDayVis.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDayVisKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtDayVis.Text = '' then
    Exit;

   if (StrToFloat(edtDayVis.Text) > 100)  then
    begin
      ShowMessage('Incorrect value');
      edtDayVis.Text := '100';
    //  edtDayVis.Text := FormatFloat('0.00', StrToFloat(edtDayVis.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDepthOfThermalLayerKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  tmpFloat : Double;
begin

//  if not (Key in[#48 .. #57, #8, #13, #46]) then
//    Key := #0;
//
//  if key = #13 then
//    edtDepthOfThermalLayer.Text := FormatFloat('0.00', StrToFloat(edtDepthOfThermalLayer.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDepthOfThermalLayerKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtDepthOfThermalLayer.Text := FormatFloat('0.00', StrToFloat(edtDepthOfThermalLayer.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDepthOfThermalLayerKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtDepthOfThermalLayer.Text = '' then
    Exit;

   if (StrToFloat(edtDepthOfThermalLayer.Text) > 2000)  then
    begin
      ShowMessage('Incorrect value');
      edtDepthOfThermalLayer.Text := '2000';
    //  edtDepthOfThermalLayer.Text := FormatFloat('0.00', StrToFloat(edtDepthOfThermalLayer.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDirectionExit(
  Sender: TObject);
var d: double;
begin
  if edtDirection.Text <> '' then
  begin
    try
     d := StrToFloat(edtDirection.Text);
    except
     on EConvertError do begin
       edtDirection.Text := '0.0';
       d := 0.0;
     end;

    end;
    rw1.Degree := d;
  end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDirectionKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtDirection.Text := FormatFloat('0.00', StrToFloat(edtDirection.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDirectionKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtDirection.Text = '' then
    Exit;

   if (StrToFloat(edtDirection.Text) > 360)  then
    begin
      ShowMessage('Incorrect value');
      edtDirection.Text := '360';
    //  edtDirection.Text := FormatFloat('0.00', StrToFloat(edtDirection.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtFirstCZSignalIncreaseKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtFirstCZSignalIncrease.Text := FormatFloat('0.00', StrToFloat(edtFirstCZSignalIncrease.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtFirstCZSignalIncreaseKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtFirstCZSignalIncrease.Text = '' then
    Exit;

   if (StrToFloat(edtFirstCZSignalIncrease.Text) > 90500)  then
    begin
      ShowMessage('Incorrect value');
      edtFirstCZSignalIncrease.Text := '90500';
    //  edtFirstCZSignalIncrease.Text := FormatFloat('0.00', StrToFloat(edtFirstCZSignalIncrease.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtLayerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  tmpFloat : Double;
begin

//  if not (Key in[#48 .. #57, #8, #13, #46]) then
//    Key := #0;
//
//  if key = #13 then
//    edtLayer.Text := FormatFloat('0.00', StrToFloat(edtLayer.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtLayerKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtLayer.Text := FormatFloat('0.00', StrToFloat(edtLayer.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtLayerKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtLayer.Text = '' then
    Exit;

   if (StrToFloat(edtLayer.Text) > 230000)  then
    begin
      ShowMessage('Incorrect value');
      edtLayer.Text := '230000';
    //  edtLayer.Text := FormatFloat('0.00', StrToFloat(edtLayer.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtLowerLimitSubsurfaceDuctingKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtLowerLimitSubsurfaceDucting.Text := FormatFloat('0.00', StrToFloat(edtLowerLimitSubsurfaceDucting.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtLowerLimitSubsurfaceDuctingKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtLowerLimitSubsurfaceDucting.Text = '' then
    Exit;

   if (StrToFloat(edtLowerLimitSubsurfaceDucting.Text) > 500)  then
    begin
      ShowMessage('Incorrect value');
      edtLowerLimitSubsurfaceDucting.Text := '500';
    //  edtLowerLimitSubsurfaceDucting.Text := FormatFloat('0.00', StrToFloat(edtLowerLimitSubsurfaceDucting.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtLowerLimitSurfaceDuctingKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  tmpFloat : Double;
begin

//  if not (Key in[#48 .. #57, #8, #13, #46]) then
//    Key := #0;
//
//  if key = #13 then
//    edtLowerLimitSurfaceDucting.Text := FormatFloat('0.00', StrToFloat(edtLowerLimitSurfaceDucting.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtLowerLimitSurfaceDuctingKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtLowerLimitSurfaceDucting.Text := FormatFloat('0.00', StrToFloat(edtLowerLimitSurfaceDucting.Text));
end;


procedure TEnvironmentCharacteristicsWindowForm.edtLowerLimitSurfaceDuctingKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtLowerLimitSurfaceDucting.Text = '' then
    Exit;

   if (StrToFloat(edtLowerLimitSurfaceDucting.Text) > 50900)  then
    begin
      ShowMessage('Incorrect value');
      edtLowerLimitSurfaceDucting.Text := '50900';
    //  edtLowerLimitSurfaceDucting.Text := FormatFloat('0.00', StrToFloat(edtLowerLimitSurfaceDucting.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtMaxSonarTargetKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtMaxSonarTarget.Text := FormatFloat('0.00', StrToFloat(edtMaxSonarTarget.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtMaxSonarTargetKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtMaxSonarTarget.Text = '' then
    Exit;

   if (StrToFloat(edtMaxSonarTarget.Text) > 97500)  then
    begin
      ShowMessage('Incorrect value');
      edtMaxSonarTarget.Text := '97500';
    //  edtMaxSonarTarget.Text := FormatFloat('0.00', StrToFloat(edtMaxSonarTarget.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtNightInfraChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trbNighttimeInfra.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtNightInfraKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtNightInfra.Text := FormatFloat('0.00', StrToFloat(edtNightInfra.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtNightInfraKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtNightInfra.Text = '' then
    Exit;

   if (StrToFloat(edtNightInfra.Text) > 100)  then
    begin
      ShowMessage('Incorrect value');
      edtNightInfra.Text := '100';
    //  edtNightInfra.Text := FormatFloat('0.00', StrToFloat(edtNightInfra.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtNightVisChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trbNighttimeVisual.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtNightVisKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtNightVis.Text := FormatFloat('0.00', StrToFloat(edtNightVis.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtNightVisKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtNightVis.Text = '' then
    Exit;

   if (StrToFloat(edtNightVis.Text) > 100)  then
    begin
      ShowMessage('Incorrect value');
      edtNightVis.Text := '100';
    //  edtNightVis.Text := FormatFloat('0.00', StrToFloat(edtNightVis.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtRangeIntervalKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtRangeInterval.Text := FormatFloat('0.00', StrToFloat(edtRangeInterval.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtRangeIntervalKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtRangeInterval.Text = '' then
    Exit;

   if (StrToFloat(edtRangeInterval.Text) > 45500)  then
    begin
      ShowMessage('Incorrect value');
      edtRangeInterval.Text := '45500';
    //  edtRangeInterval.Text := FormatFloat('0.00', StrToFloat(edtRangeInterval.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtSeaStateChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trackSeaState.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtSeaStateKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  tmpFloat : Double;
begin

//  if not (Key in[#48 .. #57, #8, #13, #46]) then
//    Key := #0;
//
//  if key = #13 then
//    edtSeaState.Text := FormatFloat('0.00', StrToFloat(edtSeaState.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtSeaStateKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtSeaState.Text := FormatFloat('0.00', StrToFloat(edtSeaState.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtSeaStateKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtSeaState.Text = '' then
    Exit;

   if (StrToFloat(edtSeaState.Text) > 9)  then
    begin
      ShowMessage('Incorrect value');
      edtSeaState.Text := '9';
    //  edtSeaState.Text := FormatFloat('0.00', StrToFloat(edtSeaState.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtShadowZoneKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtShadowZone.Text := FormatFloat('0.00', StrToFloat(edtShadowZone.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtShadowZoneKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtShadowZone.Text = '' then
    Exit;

   if (StrToFloat(edtShadowZone.Text) > 33500)  then
    begin
      ShowMessage('Incorrect value');
      edtShadowZone.Text := '33500';
    //  edtShadowZone.Text := FormatFloat('0.00', StrToFloat(edtShadowZone.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtSpeedKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtSpeed.Text := FormatFloat('0.00', StrToFloat(edtSpeed.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtSpeedKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtSpeed.Text = '' then
    Exit;

   if (StrToFloat(edtSpeed.Text) > 1900)  then
    begin
      ShowMessage('Incorrect value');
      edtSpeed.Text := '1900';
    //  edtSpeed.Text := FormatFloat('0.00', StrToFloat(edtSpeed.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtSurfaceKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  tmpFloat : Double;
begin


end;

procedure TEnvironmentCharacteristicsWindowForm.edtSurfaceKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtSurface.Text := FormatFloat('0.00', StrToFloat(edtSurface.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtSurfaceKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtSurface.Text = '' then
    Exit;

   if (StrToFloat(edtSurface.Text) > 230000)  then
    begin
      ShowMessage('Incorrect value');
      edtSurface.Text := '230000';
    //  edtSurface.Text := FormatFloat('0.00', StrToFloat(edtSurface.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtSurfaceTemperatureKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtSurfaceTemperature.Text := FormatFloat('0.00', StrToFloat(edtSurfaceTemperature.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtSurfaceTemperatureKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtSurfaceTemperature.Text = '' then
    Exit;

   if (StrToFloat(edtSurfaceTemperature.Text) > 100)  then
    begin
      ShowMessage('Incorrect value');
      edtSurfaceTemperature.Text := '100';
    //  edtSurfaceTemperature.Text := FormatFloat('0.00', StrToFloat(edtSurfaceTemperature.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtUpperLimitSubsurfaceDuctingKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  tmpFloat : Double;
begin

//  if not (Key in[#48 .. #57, #8, #13, #46]) then
//    Key := #0;
//
//  if key = #13 then
//    edtUpperLimitSubsurfaceDucting.Text := FormatFloat('0.00', StrToFloat(edtUpperLimitSubsurfaceDucting.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtUpperLimitSubsurfaceDuctingKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtUpperLimitSubsurfaceDucting.Text := FormatFloat('0.00', StrToFloat(edtUpperLimitSubsurfaceDucting.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtUpperLimitSubsurfaceDuctingKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtUpperLimitSubsurfaceDucting.Text = '' then
    Exit;

   if (StrToFloat(edtUpperLimitSubsurfaceDucting.Text) > 87600)  then
    begin
      ShowMessage('Incorrect value');
      edtUpperLimitSubsurfaceDucting.Text := '87600';
    //  edtUpperLimitSubsurfaceDucting.Text := FormatFloat('0.00', StrToFloat(edtUpperLimitSubsurfaceDucting.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtUpperLimitSurfaceDuctingKeyown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  tmpFloat : Double;
begin

//  if not (Key in[#48 .. #57, #8, #13, #46]) then
//    Key := #0;
//
//  if key = #13 then
//    edtUpperLimitSurfaceDucting.Text := FormatFloat('0.00', StrToFloat(edtUpperLimitSurfaceDucting.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtUpperLimitSurfaceDuctingKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtUpperLimitSurfaceDucting.Text := FormatFloat('0.00', StrToFloat(edtUpperLimitSurfaceDucting.Text));
end;

procedure TEnvironmentCharacteristicsWindowForm.edtUpperLimitSurfaceDuctingKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtUpperLimitSurfaceDucting.Text = '' then
    Exit;

   if (StrToFloat(edtUpperLimitSurfaceDucting.Text) > 500000)  then
    begin
      ShowMessage('Incorrect value');
      edtUpperLimitSurfaceDucting.Text := '500000';
    //  edtUpperLimitSurfaceDucting.Text := FormatFloat('0.00', StrToFloat(edtUpperLimitSurfaceDucting.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtWidthOfFirstCZKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtWidthOfFirstCZ.Text := FormatFloat('0.00', StrToFloat(edtWidthOfFirstCZ.Text));
end;


procedure TEnvironmentCharacteristicsWindowForm.edtWidthOfFirstCZKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtWidthOfFirstCZ.Text = '' then
    Exit;

   if (StrToFloat(edtWidthOfFirstCZ.Text) > 88500)  then
    begin
      ShowMessage('Incorrect value');
      edtWidthOfFirstCZ.Text := '88500';
    //  edtWidthOfFirstCZ.Text := FormatFloat('0.00', StrToFloat(edtWidthOfFirstCZ.Text));
    end;
end;

procedure TEnvironmentCharacteristicsWindowForm.FormCreate(Sender: TObject);
begin
  GameEnviroDef := TGame_Environment_Definition.Create;

  rw := TRotWheel.Create(self);
  rw.Parent := pnWheel;
  rw.Left := 0;
  rw.Top := 0;
  rw.Width := pnWheel.Width;
  rw.Height := pnWheel.Height;
  rw.OnDegreeChange := RotWheelDegreChange;

  rw1 := TRotWheel.Create(self);
  rw1.Parent := pnlOC;
  rw1.Left := 0;
  rw1.Top := 0;
  rw1.Width := pnlOC.Width;
  rw1.Height := pnlOC.Height;
  rw1.OnDegreeChange := RotWheelDegreOCChange;

end;

procedure TEnvironmentCharacteristicsWindowForm.FormDestroy(Sender: TObject);
begin
  GameEnviroDef.Free;
end;

procedure TEnvironmentCharacteristicsWindowForm.FormShow(Sender: TObject);
begin
  PageControl1.Pages[0].Show;
  {
  edtName.Text := EnvironmentForm.edtName.Text;
  trbDaytimeVisual.Min          := 0;
  trbDaytimeVisual.Max          := 100;
  trbNighttimeVisual.Min        := 0;
  trbNighttimeVisual.Max        := 100;
  trbDaytimeInfra.Min           := 0;
  trbDaytimeInfra.Max           := 100;
  trckbrNighttimeInfra.Min      := 0;
  trckbrNighttimeInfra.Max      := 100;
  trckbrAttenRainRate.Min       := 0;
  trckbrAttenRainRate.Max       := 6;
  trckbrAttenCloud.Min          := 0;
  trckbrAttenCloud.Max          := 6;
  trackSeaState.Min             := 0;
  trackSeaState.Max             := 100;
  trackBottomLossCoeff.Min      := 0;
  trackBottomLossCoeff.Max      := 100;
  trackAtmospheric.Min          := 0;
  trackAtmospheric.Max          := 100;

  with GameEnviroDef.FData do begin
  if lbSoundVelocity.Text      = 'Positive' then
   Sound_Velocity_Type := 0
  else if lbSoundVelocity.Text = 'Negative' then
   Sound_Velocity_Type := 1
  else if lbSoundVelocity.Text = 'Positive over negative' then
   Sound_Velocity_Type := 2
  else if cbxShippingRate.Text = 'Negative over positive' then
   Sound_Velocity_Type := 3
  end;}

  edtSunrise.Text     := '06:00:00';
  edtSunset.Text      := '18:00:00';
  edtTwilight.Text    := '00:30:00';
end;

procedure TEnvironmentCharacteristicsWindowForm.getData;
begin
   with sub_Area_envi.FData do begin
    Daytime_Visual_Modifier        := StrToInt(edtDayVis.Text);
    Nighttime_Visual_Modifier      := StrToInt(edtNightVis.Text);
    Daytime_Infrared_Modifier      := StrToInt(edtDayInfra.Text);
    Nighttime_Infrared_Modifier    := StrToInt(edtNightInfra.Text);
    Rain_Rate                      := StrToInt(edtAttenRainRate.Text);
    Cloud_Base_Height              := StrToInt(edtCloudBaseHeight.Text);
    Cloud_Attenuation              := StrToInt(edtAttenCloud.Text);
    Sea_State                      := StrToInt(edtSeaState.Text);
    Ocean_Current_Speed            := StrToInt(edtSpeed.Text);
    Ocean_Current_Direction        := StrToInt(edtDirection.Text);
    Thermal_Layer_Depth            := StrToInt(edtDepthOfThermalLayer.Text);
//    Sound_Velocity_Type            := lbSoundVelocity.
    Surface_Sound_Speed            := StrToInt(edtSurface.Text);
    Layer_Sound_Speed              := StrToInt(edtLayer.Text);
    Bottom_Sound_Speed             := StrToInt(edtBottom.Text);
    Bottomloss_Coefficient         := StrToInt(edtBottomLossCoeff.Text);
    Ave_Ocean_Depth                := StrToInt(edtAverageOceanDepth.Text);
    CZ_Active                      := StrToInt(edtFirstCZSignalIncrease.Text);
//    Surface_Ducting_Active         := edtUpperLimitSurfaceDucting.Text;
    Upper_Limit_Sur_Duct_Depth     := StrToInt(edtUpperLimitSurfaceDucting.Text);
    Lower_Limit_Sur_Duct_Depth     := StrToInt(edtLowerLimitSurfaceDucting.Text);
//    Sub_Ducting_Active             := edtUpperLimitSubsurfaceDucting.Text;
    Upper_Limit_Sub_Duct_Depth     := StrToInt(edtUpperLimitSubsurfaceDucting.Text);
    Lower_Limit_Sub_Duct_Depth     := StrToInt(edtLowerLimitSubsurfaceDucting.Text);
//    Shipping_Rate                  := edt
    Shadow_Zone_Trans_Loss         := StrToInt(edtShadowZone.Text);
    Atmospheric_Refract_Modifier   := StrToInt(edtAtmospheric.Text);
    Barometric_Pressure            := StrToInt(edtBarometricPressure.Text);
    Air_Temperature                := StrToInt(edtAirTemp.Text);
    Surface_Temperature            := StrToInt(edtSurfaceTemperature.Text);

    if cbHFTransmission.Checked = true then
     HF_Black_Hole := 1
    else begin
     HF_Black_Hole := 0;
    end;
  end;
end;

procedure TEnvironmentCharacteristicsWindowForm.trackAtmosphericChange(
  Sender: TObject);
begin
  edtAtmospheric.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TEnvironmentCharacteristicsWindowForm.trackBottomLossCoeffChange(
  Sender: TObject);
begin
  edtBottomLossCoeff.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TEnvironmentCharacteristicsWindowForm.trackSeaStateChange(
  Sender: TObject);
begin
  edtSeaState.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TEnvironmentCharacteristicsWindowForm.trbDaytimeInfraChange(
  Sender: TObject);
begin
  edtDayInfra.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TEnvironmentCharacteristicsWindowForm.trbDaytimeVisualChange(
  Sender: TObject);
begin
  edtDayVis.Text := IntToStr((sender as TTrackBar).Position);
end;


procedure TEnvironmentCharacteristicsWindowForm.trbNighttimeVisualChange(
  Sender: TObject);
begin
  edtNightVis.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TEnvironmentCharacteristicsWindowForm.trckbrAttenCloudChange(
  Sender: TObject);
begin
  edtAttenCloud.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TEnvironmentCharacteristicsWindowForm.trckbrAttenRainRateChange(
  Sender: TObject);
begin
  edtAttenRainRate.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TEnvironmentCharacteristicsWindowForm.trbNighttimeInfraChange(
  Sender: TObject);
begin
  edtNightInfra.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TEnvironmentCharacteristicsWindowForm.updateSubGameArea(id: Integer; var sub_Area: TSubArea_Enviro_Definition);
begin
  dmTTT.UpdateSubArea_Enviro_Definition(IntToStr(id), sub_Area);
end;

//function TEnvironmentCharacteristicsWindowForm.TimeToSecond(t : TTime): Integer;
//var
//  h: Double;
//begin
//  h := s / 3600;
//  Result := h / 24;
//
//  t := t*24;
//
//end;

procedure TEnvironmentCharacteristicsWindowForm.EnvironmentCharacteristicsupdate;
var

    t : TTime;
    hour, minute, second, millisec : Word;

    val: Double;
    val_int: Integer;
    val_dtime: TDateTime;
begin

  if (fCharacteristicLandmass.rectSelect = nil) then
  begin
    with GameEnviroDef.FData do begin
      Game_Enviro_Identifier      := frmSummaryEnvironment.edtName.Text;
      Game_Area_Index             := GameEnviroDef.FData.Game_Area_Index;
      if TryStrToFloat(edtAboveSpeed.Text,val) then Wind_Speed := val;
      if TryStrToFloat(edtAboveDirection.Text,val) then Wind_Direction := val;
      if TryStrToFloat(edtDayVis.Text,val) then Daytime_Visual_Modifier     := val;
      if TryStrToFloat(edtNightVis.Text,val) then Nighttime_Visual_Modifier   := val;
      if TryStrToFloat(edtDayInfra.Text,val) then Daytime_Infrared_Modifier   := val;
      if TryStrToFloat(edtNightInfra.Text,val) then Nighttime_Infrared_Modifier := val;
      if TryStrToDateTime(edtSunrise.Text,val_dtime) then Sunrise := DateTimeToInt(val_dtime);
      if TryStrToDateTime(edtSunset.Text,val_dtime) then Sunset := DateTimeToInt(val_dtime);
      if TryStrToDateTime(edtTwilight.Text,val_dtime) then Period_of_Twilight := DateTimeToInt(val_dtime);

      {
      Sunrise                     := StrToTime(sunr);
      MyDate                      := StrToTime(suns);
      DecodeTime(myDate, myHour, myMin, mySec, myMilli);
      midetik := myMilli /60;
      mySec := mySec + midetik;
      detik := mySec / 60;
      myMin := myMin + detik;
      menit := myMin / 60;
      myHour := myHour + menit;
      jam := myHour / 60;
      }

//      t := SecondToTime(GameEnviroDef.FData.Period_of_Twilight);
//      edtTwilight.Text := FormatDateTime('hh : nn : ss', t);

      t := StrToDateTime(edtTwilight.Text);
      DecodeTime(t, hour, minute, second, millisec);
//      Period_of_Twilight          := minute*60;
//      Period_of_Twilight          := StrToInt(edtTwilight.Text);
      if TryStrToInt(edtAttenRainRate.Text,val_int) then Rain_Rate := val_int;
      if TryStrToFloat(edtCloudBaseHeight.Text,val) then Cloud_Base_Height := val;
      if TryStrToInt(edtAttenCloud.Text,val_int) then Cloud_Attenuation := val_int;
      if TryStrToInt(edtSeaState.Text,val_int) then Sea_State := val_int;
      if TryStrToFloat(edtSpeed.Text,val) then Ocean_Current_Speed := val;
      if TryStrToFloat(edtDirection.Text,val) then Ocean_Current_Direction := val;
      if TryStrToFloat(edtDepthOfThermalLayer.Text,val) then Thermal_Layer_Depth := val;
//      Sound_Velocity_Type         := Sound_Velocity_Type;
      if TryStrToFloat(edtSurface.Text,val) then Surface_Sound_Speed := val;
      if TryStrToFloat(edtLayer.Text,val) then Layer_Sound_Speed := val;
      if TryStrToFloat(edtBottom.Text,val) then Bottom_Sound_Speed := val;
      if TryStrToInt(edtBottomLossCoeff.Text,val_int) then Bottomloss_Coefficient := val_int;
      if TryStrToFloat(edtAverageOceanDepth.Text,val) then Ave_Ocean_Depth := val;

      if cbCoverageZones.Checked = true then
        CZ_Active := 1
      else begin
        CZ_Active := 0;
      end;

      if cbSurfaceDucting.Checked = true then
        Surface_Ducting_Active := 1
      else begin
        Surface_Ducting_Active :=0;
      end;

      if cbSubsurfaceDucting.Checked = true then
        Sub_Ducting_Active  := 1
      else begin
        Sub_Ducting_Active  :=0;
      end;

      if cbxShippingRate.Text = 'Distant' then
        Shipping_Rate := 0
      else if cbxShippingRate.Text = 'Low' then
        Shipping_Rate := 1
      else if cbxShippingRate.Text = 'Medium' then
        Shipping_Rate := 2
      else if cbxShippingRate.Text = 'High' then
        Shipping_Rate := 3;

      if Sound_Velocity_Type = 0 then
         lbSoundVelocity.Caption := 'Positive'
      else if Sound_Velocity_Type = 1 then
         lbSoundVelocity.Caption := 'Negative'
      else if Sound_Velocity_Type = 2 then
         lbSoundVelocity.Caption := 'Positive over negative'
      else if Sound_Velocity_Type = 3 then
         lbSoundVelocity.Caption := 'Negative over positive';

      if TryStrToFloat(edtUpperLimitSurfaceDucting.Text,val) then Upper_Limit_Surface_Duct_Depth := val;
      if TryStrToFloat(edtLowerLimitSurfaceDucting.Text,val) then Lower_Limit_Surface_Duct_Depth := val;
      if TryStrToFloat(edtUpperLimitSubsurfaceDucting.Text,val) then Upper_Limit_Sub_Duct_Depth := val;
      if TryStrToFloat(edtLowerLimitSubsurfaceDucting.Text,val) then Lower_Limit_Sub_Duct_Depth := val;
      if TryStrToFloat(edtShadowZone.Text,val) then Shadow_Zone_Trans_Loss := val;
      if TryStrToFloat(edtAtmospheric.Text,val) then Atmospheric_Refract_Modifier := val;
      if TryStrToFloat(edtBarometricPressure.Text,val) then Barometric_Pressure := val;
      if TryStrToFloat(edtAirTemp.Text,val) then Air_Temperature := val;
      if TryStrToFloat(edtSurfaceTemperature.Text,val) then Surface_Temperature := val;
      if TryStrToFloat(edtAboveHFStart.Text,val) then Start_HF_Range_Gap := val;
      if TryStrToFloat(edtAboveHFEnd.Text,val) then End_HF_Range_Gap := val;
    end;
    dmTTT.updateGame_Environment_Def(GameEnviroDef, IntToStr(GameEnviroDef.FData.Game_Enviro_Index));
  end
  else
  begin
    with fCharacteristicLandmass.rectSelect.FData do begin
      Game_Enviro_Index           := GameEnviroDef.FData.Game_Enviro_Index;
      Enviro_Identifier           := edtName.Text;
      if TryStrToFloat(edtAboveSpeed.Text,val) then Wind_Speed := val;
      if TryStrToFloat(edtAboveDirection.Text,val) then Wind_Direction := val;
      if TryStrToFloat(edtDayVis.Text,val) then Daytime_Visual_Modifier := val;
      if TryStrToFloat(edtNightVis.Text,val) then Nighttime_Visual_Modifier := val;
      if TryStrToFloat(edtDayInfra.Text,val) then Daytime_Infrared_Modifier := val;
      if TryStrToFloat(edtNightInfra.Text,val) then Nighttime_Infrared_Modifier := val;
      {
      sunrise                     := StrToInt(edtSunrise.Text);
      Sunset                      := StrToInt(edtSunset.Text);
      Period_of_Twilight          := StrToInt(edtTwilight.Text);
      }
      if TryStrToInt(edtAttenRainRate.Text,val_int) then Rain_Rate := val_int;
      if TryStrToFloat(edtCloudBaseHeight.Text,val) then Cloud_Base_Height := val;
      if TryStrToInt(edtAttenCloud.Text,val_int) then Cloud_Attenuation := val_int;
      if TryStrToInt(edtSeaState.Text,val_int) then Sea_State := val_int;
      if TryStrToFloat(edtSpeed.Text,val) then Ocean_Current_Speed := val;
      if TryStrToFloat(edtDirection.Text,val) then Ocean_Current_Direction := val;
      if TryStrToFloat(edtDepthOfThermalLayer.Text,val) then Thermal_Layer_Depth := val;
      Sound_Velocity_Type         := GameEnviroDef.FData.Sound_Velocity_Type;
      if TryStrToFloat(edtSurface.Text,val) then Surface_Sound_Speed := val;
      if TryStrToFloat(edtLayer.Text,val) then Layer_Sound_Speed := val;
      if TryStrToFloat(edtBottom.Text,val) then Bottom_Sound_Speed := val;
      if TryStrToInt(edtBottomLossCoeff.Text,val_int) then Bottomloss_Coefficient := val_int;
      if TryStrToFloat(edtAverageOceanDepth.Text,val) then Ave_Ocean_Depth := val;
      if cbCoverageZones.Checked = true then
        CZ_Active := 1
      else begin
        CZ_Active := 0;
      end;

      if cbSurfaceDucting.Checked = true then
        Surface_Ducting_Active := 1
      else begin
        Surface_Ducting_Active :=0;
      end;

      if cbSubsurfaceDucting.Checked = true then
        Sub_Ducting_Active  := 1
      else begin
        Sub_Ducting_Active  :=0;
      end;

      if cbxShippingRate.Text = 'Distant' then
        Shipping_Rate := 0
      else if cbxShippingRate.Text = 'Low' then
        Shipping_Rate := 1
      else if cbxShippingRate.Text = 'Medium' then
        Shipping_Rate := 2
      else if cbxShippingRate.Text = 'High' then
        Shipping_Rate := 3;

      if TryStrToFloat(edtUpperLimitSurfaceDucting.Text,val) then Upper_Limit_Sur_Duct_Depth := val;
      if TryStrToFloat(edtLowerLimitSurfaceDucting.Text,val) then Lower_Limit_Sur_Duct_Depth := val;
      if TryStrToFloat(edtUpperLimitSubsurfaceDucting.Text,val) then Upper_Limit_Sub_Duct_Depth := val;
      if TryStrToFloat(edtLowerLimitSubsurfaceDucting.Text,val) then Lower_Limit_Sub_Duct_Depth := val;
      if TryStrToFloat(edtShadowZone.Text,val) then Shadow_Zone_Trans_Loss := val;
      if TryStrToFloat(edtAtmospheric.Text,val) then Atmospheric_Refract_Modifier := val;
      if TryStrToFloat(edtBarometricPressure.Text,val) then Barometric_Pressure := val;
      if TryStrToFloat(edtAirTemp.Text,val) then Air_Temperature := val;
      if TryStrToFloat(edtSurfaceTemperature.Text,val) then Surface_Temperature := val;

      if cbHFTransmission.Checked = true then
        HF_Black_Hole := 1
      else begin
        HF_Black_Hole := 0;
      end;

      {
      Start_HF_Range_Gap             := StrToFloat(edtAboveHFEnd.Text);
      End_HF_Range_Gap               := StrToFloat(edtAboveHFEnd.Text);
      }
    end;
    updateSubGameArea(fCharacteristicLandmass.rectSelect.FData.Enviro_Index, fCharacteristicLandmass.rectSelect);
  end;
end;

procedure TEnvironmentCharacteristicsWindowForm.EnvironmentGlobalCharacteristicsupdate;
var
  id : string;
  rec_global : TGlobal_Convergence_Zone;
begin
  id := IntToStr(GameEnviroDef.FData.Game_Enviro_Index);

  rec_global := TGlobal_Convergence_Zone.Create;
  with rec_global.FData do begin
    Occurance_Range := StrToFloat(edtRangeInterval.Text);
    Width           := StrToFloat(edtWidthOfFirstCZ.Text);
    Signal_Reduction_Term := StrToFloat(edtFirstCZSignalIncrease.Text);
    Increase_per_CZ  := StrToFloat(edtAttenuation.Text);
    Max_Sonar_Depth  := StrToFloat(edtMaxSonarTarget.Text);
  end;
  dmTTT.updateGlobalConverge(rec_global,id);
  rec_global.Free;
end;

procedure TEnvironmentCharacteristicsWindowForm.SpeedButton3Click(
  Sender: TObject);
begin
  lbSoundVelocity.Caption := 'Positive over negative';
end;

procedure TEnvironmentCharacteristicsWindowForm.SpeedButton4Click(
  Sender: TObject);
begin
  lbSoundVelocity.Caption := 'Negative over positive';
end;

end.
