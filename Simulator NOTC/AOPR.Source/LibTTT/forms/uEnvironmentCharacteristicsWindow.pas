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
    Panel5: TPanel;
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
    procedure edtAboveDirectionEnter(Sender: TObject);
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

  private
    { Private declarations }
    procedure RotWheelDegreChange(Sender: TObject);
    procedure RotWheelDegreOCChange(Sender: TObject);
    procedure update;
  public
    { Public declarations }
    GameEnviroDef : TGame_Environment_Definition;
    rw,rw1 : TRotWheel;
    procedure updateSubGameArea(id: Integer; var sub_Area: TSubArea_Enviro_Definition);
  end;

var
  EnvironmentCharacteristicsWindowForm: TEnvironmentCharacteristicsWindowForm;

implementation

{$R *.dfm}

uses  uEnvironment,uFEnvironmentSelection, uDataModuleTTT,
  uCharacteristicLandmass;

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
  rw.Degree := StrToFloat(edtAboveDirection.Text);
  rw1.Degree := StrToFloat(edtDirection.Text);
  update;
end;

procedure TEnvironmentCharacteristicsWindowForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TEnvironmentCharacteristicsWindowForm.btnOKClick(Sender: TObject);
begin
  update;
  Close;
end;

procedure TEnvironmentCharacteristicsWindowForm.Button1Click(
  Sender: TObject);
begin
  lbSoundVelocity.Alignment := taCenter;
  lbSoundVelocity.Caption := 'Positive';
end;

procedure TEnvironmentCharacteristicsWindowForm.Button2Click(
  Sender: TObject);
begin
  lbSoundVelocity.Alignment := taCenter;
  lbSoundVelocity.Caption := 'Negative';
end;

procedure TEnvironmentCharacteristicsWindowForm.Button3Click(
  Sender: TObject);
begin
  lbSoundVelocity.Alignment := taCenter;
  lbSoundVelocity.Caption := 'Positive over negative';
end;

procedure TEnvironmentCharacteristicsWindowForm.Button4Click(
  Sender: TObject);
begin
  lbSoundVelocity.Alignment := taCenter;
  lbSoundVelocity.Caption := 'Negative over positive';
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAboveDirectionEnter(
  Sender: TObject);
var d: double;
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

procedure TEnvironmentCharacteristicsWindowForm.edtAtmosphericChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trackAtmospheric.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAttenCloudChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trckbrAttenCloud.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtAttenRainRateChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trckbrAttenRainRate.Position := StrToInt((Sender as TEdit).Text);;
end;

procedure TEnvironmentCharacteristicsWindowForm.edtBottomLossCoeffChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trackBottomLossCoeff.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDayInfraChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trbDaytimeInfra.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtDayVisChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trbDaytimeVisual.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtNightInfraChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trbNighttimeInfra.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtNightVisChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trbNighttimeVisual.Position := StrToInt((Sender as TEdit).Text);
end;

procedure TEnvironmentCharacteristicsWindowForm.edtSeaStateChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
  trackSeaState.Position := StrToInt((Sender as TEdit).Text);
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
  }

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

procedure TEnvironmentCharacteristicsWindowForm.update;
var sunr, suns : String;
    myDate : TDateTime;
    myHour, myMin, mySec, myMilli : Word;
    jam, menit, detik, midetik : integer;
begin
  if (fCharacteristicLandmass.rectSelect = nil) or (edtName.Text = 'Global Environment ' + GameEnviroDef.FData.Game_Enviro_Identifier) then
  begin
    with GameEnviroDef.FData do begin
      Game_Enviro_Identifier      := EnvironmentForm.edtName.Text;
      Game_Area_Index             := GameEnviroDef.FData.Game_Area_Index;
      Wind_Speed                  := StrToFloat(edtAboveSpeed.Text);
      Wind_Direction              := StrToFloat(edtAboveDirection.Text);
      Daytime_Visual_Modifier     := StrToFloat(edtDayVis.Text);
      Nighttime_Visual_Modifier   := StrToFloat(edtNightVis.Text);
      Daytime_Infrared_Modifier   := StrToFloat(edtDayInfra.Text);
      Nighttime_Infrared_Modifier := StrToFloat(edtNightInfra.Text);

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

      Period_of_Twilight          := StrToInt(edtTwilight.Text);
      Rain_Rate                   := StrToInt(edtAttenRainRate.Text);
      Cloud_Base_Height           := StrToFloat(edtCloudBaseHeight.Text);
      Cloud_Attenuation           := StrToInt(edtAttenCloud.Text);
      Sea_State                   := StrToInt(edtSeaState.Text);
      Ocean_Current_Speed         := StrToFloat(edtSpeed.Text);
      Ocean_Current_Direction     := StrToFloat(edtDirection.Text);
      Thermal_Layer_Depth         := StrToFloat(edtDepthOfThermalLayer.Text);
      Sound_Velocity_Type         := Sound_Velocity_Type;
      Surface_Sound_Speed         := StrToFloat(edtSurface.Text);
      Layer_Sound_Speed           := StrToFloat(edtLayer.Text);
      Bottom_Sound_Speed          := StrToFloat(edtBottom.Text);
      Bottomloss_Coefficient      := StrToInt(edtBottomLossCoeff.Text);
      Ave_Ocean_Depth             := StrToFloat(edtAverageOceanDepth.Text);
      if cbCoverageZones.Checked = true then
        CZ_Active   := 1
      else begin
        CZ_Active :=0;
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

      Upper_Limit_Surface_Duct_Depth := StrToFloat(edtUpperLimitSurfaceDucting.Text);
      Lower_Limit_Surface_Duct_Depth := StrToFloat(edtLowerLimitSurfaceDucting.Text);
      Upper_Limit_Sub_Duct_Depth     := StrToFloat(edtUpperLimitSubsurfaceDucting.Text);
      Lower_Limit_Sub_Duct_Depth     := StrToFloat(edtLowerLimitSubsurfaceDucting.Text);
      Shadow_Zone_Trans_Loss         := StrToFloat(edtShadowZone.Text);
      Atmospheric_Refract_Modifier   := StrToFloat(edtAtmospheric.Text);
      Barometric_Pressure            := StrToFloat(edtBarometricPressure.Text);
      Air_Temperature                := StrToFloat(edtAirTemp.Text);
      Surface_Temperature            := StrToFloat(edtSurfaceTemperature.Text);
      Start_HF_Range_Gap             := StrToFloat(edtAboveHFEnd.Text);
      End_HF_Range_Gap               := StrToFloat(edtAboveHFEnd.Text);
    end;
    dmTTT.updateGame_Environment_Def(GameEnviroDef, IntToStr(GameEnviroDef.FData.Game_Enviro_Index));
  end
  else
  begin
    with fCharacteristicLandmass.rectSelect.FData do begin
      Game_Enviro_Index           := Game_Enviro_Index;
      Enviro_Identifier           := edtName.Text;
      Wind_Speed                  := StrToFloat(edtAboveSpeed.Text);
      Wind_Direction              := StrToFloat(edtAboveDirection.Text);
      Daytime_Visual_Modifier     := StrToFloat(edtDayVis.Text);
      Nighttime_Visual_Modifier   := StrToFloat(edtNightVis.Text);
      Daytime_Infrared_Modifier   := StrToFloat(edtDayInfra.Text);
      Nighttime_Infrared_Modifier := StrToFloat(edtNightInfra.Text);
      {
      sunrise                     := StrToInt(edtSunrise.Text);
      Sunset                      := StrToInt(edtSunset.Text);
      Period_of_Twilight          := StrToInt(edtTwilight.Text);
      }
      Rain_Rate                   := StrToInt(edtAttenRainRate.Text);
      Cloud_Base_Height           := StrToFloat(edtCloudBaseHeight.Text);
      Cloud_Attenuation           := StrToInt(edtAttenCloud.Text);
      Sea_State                   := StrToInt(edtSeaState.Text);
      Ocean_Current_Speed         := StrToFloat(edtSpeed.Text);
      Ocean_Current_Direction     := StrToFloat(edtDirection.Text);
      Thermal_Layer_Depth         := StrToFloat(edtDepthOfThermalLayer.Text);
      Sound_Velocity_Type         := Sound_Velocity_Type;
      Surface_Sound_Speed         := StrToFloat(edtSurface.Text);
      Layer_Sound_Speed           := StrToFloat(edtLayer.Text);
      Bottom_Sound_Speed          := StrToFloat(edtBottom.Text);
      Bottomloss_Coefficient      := StrToInt(edtBottomLossCoeff.Text);
      Ave_Ocean_Depth             := StrToFloat(edtAverageOceanDepth.Text);
      if cbCoverageZones.Checked = true then
        CZ_Active   := 1
      else begin
        CZ_Active :=0;
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

      Upper_Limit_Sur_Duct_Depth := StrToFloat(edtUpperLimitSurfaceDucting.Text);
      Lower_Limit_Sur_Duct_Depth := StrToFloat(edtLowerLimitSurfaceDucting.Text);
      Upper_Limit_Sub_Duct_Depth     := StrToFloat(edtUpperLimitSubsurfaceDucting.Text);
      Lower_Limit_Sub_Duct_Depth     := StrToFloat(edtLowerLimitSubsurfaceDucting.Text);
      Shadow_Zone_Trans_Loss         := StrToFloat(edtShadowZone.Text);
      Atmospheric_Refract_Modifier   := StrToFloat(edtAtmospheric.Text);
      Barometric_Pressure            := StrToFloat(edtBarometricPressure.Text);
      Air_Temperature                := StrToFloat(edtAirTemp.Text);
      Surface_Temperature            := StrToFloat(edtSurfaceTemperature.Text);
      {
      Start_HF_Range_Gap             := StrToFloat(edtAboveHFEnd.Text);
      End_HF_Range_Gap               := StrToFloat(edtAboveHFEnd.Text);
      }
    end;
    updateSubGameArea(fCharacteristicLandmass.rectSelect.FData.Enviro_Index, fCharacteristicLandmass.rectSelect);
  end;
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
