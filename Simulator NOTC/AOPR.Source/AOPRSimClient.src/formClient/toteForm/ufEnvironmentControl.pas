unit ufEnvironmentControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, uDBAsset_GameEnvironment,
  uRotWheel;

type
  TfEnvironmentControl = class(TForm)
    gbEnvironmentControl: TPanel;
    Panel16: TPanel;
    Panel22: TPanel;
    Panel54: TPanel;
    lvEnviroArea: TListView;
    Panel23: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Button40: TButton;
    Button41: TButton;
    Panel92: TPanel;
    pcEnvironmentControl: TPageControl;
    tsAboveWater: TTabSheet;
    GroupBox6: TGroupBox;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    lblEnviCtrlSunrise: TLabel;
    Label173: TLabel;
    lblEnviCtrlSunset: TLabel;
    Label175: TLabel;
    lblEnviCtrlPeriodTwilight: TLabel;
    edtDayVis: TEdit;
    edtNightVis: TEdit;
    trbDaytimeVisual: TTrackBar;
    trbNighttimeVisual: TTrackBar;
    trbDaytimeInfra: TTrackBar;
    trbNighttimeInfra: TTrackBar;
    edtNightInfra: TEdit;
    edtDayInfra: TEdit;
    GroupBox7: TGroupBox;
    Label177: TLabel;
    Label178: TLabel;
    Label179: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    Label182: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    edtAttenRainRate: TEdit;
    edtAttenCloud: TEdit;
    trbAttenRainRate: TTrackBar;
    trbAttenCloud: TTrackBar;
    edtAirTemp: TEdit;
    edtBarometricPressure: TEdit;
    edtCloudBaseHeight: TEdit;
    GroupBox8: TGroupBox;
    Label185: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label192: TLabel;
    edtAtmRefract: TEdit;
    trbAtmRefract: TTrackBar;
    GroupBox5: TGroupBox;
    Label163: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    Label166: TLabel;
    edtWindDir: TEdit;
    edtWindSpeed: TEdit;
    pnWheelAbove: TPanel;
    tsSurface: TTabSheet;
    Label194: TLabel;
    Label195: TLabel;
    Label188: TLabel;
    Label212: TLabel;
    Label213: TLabel;
    Label214: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    Label217: TLabel;
    Label218: TLabel;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label223: TLabel;
    GroupBox11: TGroupBox;
    Label158: TLabel;
    Label191: TLabel;
    Label193: TLabel;
    Label196: TLabel;
    edtOceanCurrentDirection: TEdit;
    edtOceanCurrentSpeed: TEdit;
    pnlWheelSurface: TPanel;
    cbxShippingRate: TComboBox;
    edtDepthTermalLayer: TEdit;
    GroupBox12: TGroupBox;
    Label197: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    Label200: TLabel;
    Label201: TLabel;
    Label202: TLabel;
    edtSpeedOfSoundSurface: TEdit;
    edtSpeedOfSoundlayer: TEdit;
    edtSpeedOfSoundBottom: TEdit;
    GroupBox2: TGroupBox;
    Label203: TLabel;
    SpeedButton25: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    GroupBox13: TGroupBox;
    Label204: TLabel;
    Label205: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    edtSurfaceDuctLow: TEdit;
    edtSurfaceDuctUp: TEdit;
    GroupBox14: TGroupBox;
    Label208: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    Label211: TLabel;
    edtSubSurfaceDuctLow: TEdit;
    edtSubSurfaceDuctUp: TEdit;
    trbSeaState: TTrackBar;
    edtSeaState: TEdit;
    edtBottomLost: TEdit;
    trbBottomLost: TTrackBar;
    edtShadowZone: TEdit;
    edtAvgOceanDepth: TEdit;
    edtSurfaceTemperatur: TEdit;
    cbxConvergenceZone: TCheckBox;
    tsBoundary: TTabSheet;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    procedure lvEnviroAreaSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
    ge : TGame_Environment_Definition;
    rw, rw1: TRotWheel;
  public
    { Public declarations }
    procedure setGE(envi : TGame_Environment_Definition);
    procedure DisplayEnvironMentControl;
    procedure RotWheelAboveDegreeChange(sender: TObject);
    procedure RotWheelSurfaceChange(sender: TObject);
    procedure setWheel;
    function getGE : TGame_Environment_Definition;
  end;

var
  fEnvironmentControl: TfEnvironmentControl;

implementation

uses
  uSimMgr_Client, uDBAssets_SubAreaEnviroDefinition, uBaseCoordSystem;

{$R *.dfm}

procedure TfEnvironmentControl.setGE(envi: TGame_Environment_Definition);
begin
  ge := envi;
end;

procedure TfEnvironmentControl.DisplayEnvironMentControl;
var
  li: TListItem;
  i: Integer;
begin
  lvEnviroArea.Columns[0].Width := lvEnviroArea.Width - 10;
  ge := (simMgrClient).GameEnvironment;

  // while  do

  lvEnviroArea.Clear;
  li := lvEnviroArea.Items.Add;
  li.Caption := 'Default Game Area';
  li.Data := ge;
  // tambahan dari Aldy sub-area
  if ((simMgrClient).GameEnvironment.FSubArea <> nil) and
    ((simMgrClient).GameEnvironment.FSubArea.Count > 0) then
  begin
    for i := 0 to (simMgrClient).GameEnvironment.FSubArea.Count - 1 do
    begin
      li := lvEnviroArea.Items.Add;
      li.Caption := TSubArea_Enviro_Definition
        ((simMgrClient).GameEnvironment.FSubArea[i]).FData.Enviro_Identifier;
      li.Data := TSubArea_Enviro_Definition
        ((simMgrClient).GameEnvironment.FSubArea[i]);
    end;
  end;

  lvEnviroArea.ItemIndex := 0;
  lvEnviroAreaSelectItem(Self, lvEnviroArea.Selected, true);

  // if first item then add default

end;

procedure TfEnvironmentControl.RotWheelAboveDegreeChange(sender: TObject);
begin
  edtWindDir.Text := FormatFloat('000.0', rw.Degree);
end;

procedure TfEnvironmentControl.RotWheelSurfaceChange(sender: TObject);
begin
  edtOceanCurrentDirection.Text := FormatFloat('000.0', rw1.Degree);
end;

procedure TfEnvironmentControl.setWheel;
begin
  rw := TRotWheel.Create(Self);
  rw.Parent := pnWheelAbove;
  rw.Left := 0;
  rw.Top := 0;
  rw.Width := pnWheelAbove.Width;
  rw.Height := pnWheelAbove.Height;
  rw.OnDegreeChange := RotWheelAboveDegreeChange;

  rw1 := TRotWheel.Create(Self);
  rw1.Parent := pnlWheelSurface;
  rw1.Left := 0;
  rw1.Top := 0;
  rw1.Width := pnlWheelSurface.Width;
  rw1.Height := pnlWheelSurface.Height;
  rw1.OnDegreeChange := RotWheelSurfaceChange;
end;

function TfEnvironmentControl.getGE;
begin
  result := ge;
end;

function SecondToTime(const s: Integer): TTime;
var
  h: Double;
begin
  h := s / 3600;
  Result := h / 24;
end;

procedure TfEnvironmentControl.lvEnviroAreaSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  ge: TGame_Environment_Definition;
  se: TSubArea_Enviro_Definition;
  t: TTime;
begin
  if Item = nil then
    exit;
  if not Assigned(Item.Data) then
    exit;
  if not Selected then
    exit;
  // if first item then
  if (sender as TListView).Selected.Index = 0 then
  begin
    ge := Item.Data;

    with ge.FData do
    begin
      edtWindDir.Text := FormatCourse(Wind_Direction);
      edtWindSpeed.Text := FormatSpeed(Wind_Speed);

      trbDaytimeVisual.Position := Round(Daytime_Visual_Modifier * 100.0);
      trbDaytimeInfra.Position := Round(Daytime_Infrared_Modifier * 100.0);
      trbNighttimeVisual.Position := Round(Nighttime_Visual_Modifier * 100.0);
      trbNighttimeInfra.Position := Round(Nighttime_Infrared_Modifier * 100.0);

      t := SecondToTime(Sunrise);
      lblEnviCtrlSunrise.Caption := FormatDateTime('hh : nn : ss', t);

      t := SecondToTime(Sunset);
      lblEnviCtrlSunset.Caption := FormatDateTime('hh : nn : ss', t);
      t := SecondToTime(Period_of_Twilight);
      lblEnviCtrlPeriodTwilight.Caption := FormatDateTime('hh : nn : ss', t);

      trbAttenRainRate.Position := Rain_Rate;
      trbAttenCloud.Position := Cloud_Attenuation;

      edtBarometricPressure.Text := FormatFloat('000.0', Barometric_Pressure);
      edtAirTemp.Text := FormatFloat('00.0', Air_Temperature);
      edtCloudBaseHeight.Text := FormatFloat('0000.0', Cloud_Base_Height);

      trbAtmRefract.Position := Round(Atmospheric_Refract_Modifier);

      edtOceanCurrentDirection.Text := FormatFloat('00.0',
        ge.FData.Ocean_Current_Direction);
      edtOceanCurrentSpeed.Text := FormatFloat('00.0',
        ge.FData.Ocean_Current_Speed);

      edtDepthTermalLayer.Text := FormatFloat('00.0',
        ge.FData.Thermal_Layer_Depth);

      cbxShippingRate.ItemHeight := Shipping_Rate;

      edtSpeedOfSoundSurface.Text := FloatToStr(ge.FData.Surface_Sound_Speed);
      edtSpeedOfSoundlayer.Text := FloatToStr(ge.FData.Layer_Sound_Speed);
      edtSpeedOfSoundBottom.Text := FloatToStr(ge.FData.Bottom_Sound_Speed);

      edtSurfaceDuctUp.Text := FloatToStr(Upper_Limit_Surface_Duct_Depth);
      edtSurfaceDuctLow.Text := FloatToStr(Lower_Limit_Surface_Duct_Depth);

      edtSubSurfaceDuctUp.Text := FloatToStr(Upper_Limit_Sub_Duct_Depth);
      edtSubSurfaceDuctLow.Text := FloatToStr(Lower_Limit_Sub_Duct_Depth);

      trbSeaState.SetTick(Sea_State);
      edtSeaState.Text := IntToStr(Sea_State);

      trbBottomLost.SetTick(Bottomloss_Coefficient);
      edtBottomLost.Text := IntToStr(Bottomloss_Coefficient);

      edtSurfaceTemperatur.Text := FloatToStr(Surface_Temperature);
      edtAvgOceanDepth.Text := FloatToStr(Ave_Ocean_Depth);
      edtShadowZone.Text := FloatToStr(Shadow_Zone_Trans_Loss);

      edtAttenRainRate.Text := IntToStr(Rain_Rate);
      trbAttenRainRate.SetTick(Rain_Rate);

      edtAttenCloud.Text := IntToStr(Cloud_Attenuation);
      trbAttenCloud.SetTick(Cloud_Attenuation);
    end;
  end
  else
  begin
    se := Item.Data;

    with se.FData do
    begin
      edtWindDir.Text := FormatCourse(Wind_Direction);
      edtWindSpeed.Text := FormatSpeed(Wind_Speed);

      trbDaytimeVisual.Position := Round(Daytime_Visual_Modifier * 100.0);
      trbDaytimeInfra.Position := Round(Daytime_Infrared_Modifier * 100.0);
      trbNighttimeVisual.Position := Round(Nighttime_Visual_Modifier * 100.0);
      trbNighttimeInfra.Position := Round(Nighttime_Infrared_Modifier * 100.0);
      {
        t := SecondToTime(Sunrise);
        lblEnviCtrlSunrise.Caption := FormatDateTime('hh : nn : ss', t);

        t := SecondToTime(Sunset);
        lblEnviCtrlSunset.Caption := FormatDateTime('hh : nn : ss', t);
        t := SecondToTime(Period_of_Twilight);
        lblEnviCtrlPeriodTwilight.Caption := FormatDateTime('hh : nn : ss', t);
        }
      trbAttenRainRate.Position := Rain_Rate;
      trbAttenCloud.Position := Cloud_Attenuation;

      edtBarometricPressure.Text := FormatFloat('000.0', Barometric_Pressure);
      edtAirTemp.Text := FormatFloat('00.0', Air_Temperature);
      edtCloudBaseHeight.Text := FormatFloat('0000.0', Cloud_Base_Height);

      trbAtmRefract.Position := Round(Atmospheric_Refract_Modifier);

      //
      edtOceanCurrentDirection.Text := FormatFloat('00.0',
        Ocean_Current_Direction);
      edtOceanCurrentSpeed.Text := FormatFloat('00.0', Ocean_Current_Speed);

      edtDepthTermalLayer.Text := FormatFloat('00.0', Thermal_Layer_Depth);

      cbxShippingRate.ItemHeight := Shipping_Rate;

      edtSpeedOfSoundSurface.Text := FloatToStr(se.FData.Surface_Sound_Speed);
      edtSpeedOfSoundlayer.Text := FloatToStr(se.FData.Layer_Sound_Speed);
      edtSpeedOfSoundBottom.Text := FloatToStr(se.FData.Bottom_Sound_Speed);

      edtSurfaceDuctUp.Text := FloatToStr(Upper_Limit_Sur_Duct_Depth);
      edtSurfaceDuctLow.Text := FloatToStr(Lower_Limit_Sur_Duct_Depth);

      edtSubSurfaceDuctUp.Text := FloatToStr(Upper_Limit_Sub_Duct_Depth);
      edtSubSurfaceDuctLow.Text := FloatToStr(Lower_Limit_Sub_Duct_Depth);

      trbSeaState.SetTick(Sea_State);
      edtSeaState.Text := IntToStr(Sea_State);

      trbBottomLost.SetTick(Bottomloss_Coefficient);
      edtBottomLost.Text := IntToStr(Bottomloss_Coefficient);

      edtSurfaceTemperatur.Text := FloatToStr(Surface_Temperature);
      edtAvgOceanDepth.Text := FloatToStr(Ave_Ocean_Depth);
      edtShadowZone.Text := FloatToStr(Shadow_Zone_Trans_Loss);

      edtAttenRainRate.Text := IntToStr(Rain_Rate);
      trbAttenRainRate.SetTick(Rain_Rate);

      edtAttenCloud.Text := IntToStr(Cloud_Attenuation);
      trbAttenCloud.SetTick(Cloud_Attenuation);
    end;
  end;

  setWheel;
end;

end.
