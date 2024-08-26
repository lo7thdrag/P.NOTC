unit ufrmSummaryEnvironment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, ExtCtrls, tttData, newClassASTT;

type
  TfrmSummaryEnvironment = class(TForm)
    Panel1: TPanel;
    pnl1: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    lblName: TStaticText;
    edtName: TEdit;
    PageControl1: TPageControl;
    General: TTabSheet;
    lblArea: TStaticText;
    edtArea: TEdit;
    btnBrowse: TSpeedButton;
    btnEditCharacteristics: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnEditCharacteristicsClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure insert;
    procedure insertConverge_Zone;
    procedure EnvironmentFormupdate;
    procedure btnApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtAreaChange(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    envi_id: string;
    finalAreaSelect : string;
    isNew, isENCmap, isCopy : boolean;

    id_game_area: string;
    enviGameAreaFile : TextFile;

    procedure getEnvironment;
    { Public declarations }
  end;

var
  frmSummaryEnvironment: TfrmSummaryEnvironment;
  eList : TList;

implementation

{$R *.dfm}
uses uGameAreaselection,uEnvironmentCharacteristicsWindow,uDBAsset_GameEnvironment,
usimDBEditor,ufrmAvailableEnvironment, uLandmassEditor, uCharacteristicLandmass,
  drawRec, uExerciseArea, uDataModuleTTT, uEnvironmentSelect, uDBEditSetting;

procedure TfrmSummaryEnvironment.btnApplyClick(Sender: TObject);
begin

  if isNew then
  begin
  try
    insert;
    isNew := False;
    btnEditCharacteristics.Enabled := true;
    getEnvironment;
    envi_id := IntToStr(EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Enviro_Index);
    id_game_area := IntToStr(EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index);
    btnOK.Enabled := True;
  except
    MessageDlg('The name of Game Environment is already exits, Please choose Game area First...',mtWarning,mbOKCancel,0);
  end;
  end
  else
  begin
    update;
    btnOK.Enabled := True;
  end;

end;

procedure TfrmSummaryEnvironment.btnBrowseClick(Sender: TObject);
begin
  fGameAreaSelection.fromEnviro := true;
  fGameAreaSelection.fromOverlay := false;
  fGameAreaSelection.ShowModal;
end;

procedure TfrmSummaryEnvironment.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSummaryEnvironment.getEnvironment;
var i : Integer;
begin
  //eList := TList.Create;
  //uSimDBEditor.getEnvironments(eList);
  with SIMMgr do
  begin
    GetGame_Environment_Definition(StrToInt(envi_id), EnvironmentCharacteristicsWindowForm.GameEnviroDef);
  end;

  with EnvironmentCharacteristicsWindowForm.GameEnviroDef do
  begin
    EnvironmentCharacteristicsWindowForm.edtName.Text := FData.Game_Enviro_Identifier;
    EnvironmentCharacteristicsWindowForm.edtAboveSpeed.Text := FloatToStr(FData.Wind_Speed);
    EnvironmentCharacteristicsWindowForm.edtAboveDirection.Text := FloatToStr(FData.Wind_Direction);
    EnvironmentCharacteristicsWindowForm.edtAboveHFStart.Text := FloatToStr(FData.Start_HF_Range_Gap);
    EnvironmentCharacteristicsWindowForm.edtAboveHFEnd.Text := FloatToStr(FData.End_HF_Range_Gap);
    EnvironmentCharacteristicsWindowForm.edtDayVis.Text := FloatToStr(FData.Daytime_Visual_Modifier);
    EnvironmentCharacteristicsWindowForm.edtNightVis.Text := FloatToStr(FData.Nighttime_Visual_Modifier);
    EnvironmentCharacteristicsWindowForm.edtDayInfra.Text := FloatToStr(FData.Daytime_Infrared_Modifier);
    EnvironmentCharacteristicsWindowForm.edtNightInfra.Text := FloatToStr(FData.Nighttime_Infrared_Modifier);
    EnvironmentCharacteristicsWindowForm.edtSunrise.Text := IntToStr(FData.Sunrise);
    EnvironmentCharacteristicsWindowForm.edtSunset.Text := IntToStr(FData.Sunset);
    EnvironmentCharacteristicsWindowForm.edtTwilight.Text := IntToStr(FData.Period_of_Twilight);
    EnvironmentCharacteristicsWindowForm.edtAttenRainRate.Text := IntToStr(FData.Rain_Rate);
    EnvironmentCharacteristicsWindowForm.edtAttenCloud.Text := IntToStr(FData.Cloud_Attenuation);
    EnvironmentCharacteristicsWindowForm.edtBarometricPressure.Text := FloatToStr(FData.Barometric_Pressure);
    EnvironmentCharacteristicsWindowForm.edtAirTemp.Text := FloatToStr(FData.Air_Temperature);
    EnvironmentCharacteristicsWindowForm.edtCloudBaseHeight.Text := FloatToStr(FData.Cloud_Base_Height);
    EnvironmentCharacteristicsWindowForm.edtSpeed.Text  := FloatToStr(FData.Ocean_Current_Speed);
    EnvironmentCharacteristicsWindowForm.edtDirection.Text := FloatToStr(FData.Ocean_Current_Direction);
    EnvironmentCharacteristicsWindowForm.cbxShippingRate.Text := IntToStr(FData.Shipping_Rate);
    EnvironmentCharacteristicsWindowForm.edtDepthOfThermalLayer.Text := FloatToStr(FData.Thermal_Layer_Depth);
    EnvironmentCharacteristicsWindowForm.edtSurface.Text := FloatToStr(FData.Surface_Sound_Speed);
    EnvironmentCharacteristicsWindowForm.edtLayer.Text := FloatToStr(FData.Layer_Sound_Speed);
    EnvironmentCharacteristicsWindowForm.edtBottom.Text := FloatToStr(FData.Bottom_Sound_Speed);
    EnvironmentCharacteristicsWindowForm.edtUpperLimitSurfaceDucting.Text := FloatToStr(FData.Upper_Limit_Surface_Duct_Depth);
    EnvironmentCharacteristicsWindowForm.edtLowerLimitSurfaceDucting.Text := FloatToStr(FData.Lower_Limit_Surface_Duct_Depth);
    EnvironmentCharacteristicsWindowForm.edtUpperLimitSubsurfaceDucting.Text := FloatToStr(FData.Upper_Limit_Sub_Duct_Depth);
    EnvironmentCharacteristicsWindowForm.edtLowerLimitSubsurfaceDucting.Text := FloatToStr(FData.Lower_Limit_Sub_Duct_Depth);
    EnvironmentCharacteristicsWindowForm.edtSeaState.Text := IntToStr(FData.Sea_State);
    EnvironmentCharacteristicsWindowForm.edtBottomLossCoeff.Text := IntToStr(FData.Bottomloss_Coefficient);
    EnvironmentCharacteristicsWindowForm.edtSurfaceTemperature.Text := FloatToStr(FData.Surface_Temperature);
    EnvironmentCharacteristicsWindowForm.edtAverageOceanDepth.Text := FloatToStr(FData.Ave_Ocean_Depth);
    EnvironmentCharacteristicsWindowForm.edtShadowZone.Text := FloatToStr(FData.Shadow_Zone_Trans_Loss);

//=====================================CENDOL PERBAIKAN=====================================
//    EnvironmentCharacteristicsWindowForm.edtRangeInterval.Text := FloatToStr(TGlobal_Convergence_Zone(eList[i]).FData.Occurance_Range);
//    EnvironmentCharacteristicsWindowForm.edtWidthOfFirstCZ.Text := FloatToStr(TGlobal_Convergence_Zone(eList[i]).FData.Width);
//    EnvironmentCharacteristicsWindowForm.edtFirstCZSignalIncrease.Text := FloatToStr(TGlobal_Convergence_Zone(eList[i]).FData.Signal_Reduction_Term);
//    EnvironmentCharacteristicsWindowForm.edtAttenuation.Text := FloatToStr(TGlobal_Convergence_Zone(eList[i]).FData.Increase_per_CZ);
//    EnvironmentCharacteristicsWindowForm.edtMaxSonarTarget.Text := FloatToStr(TGlobal_Convergence_Zone(eList[i]).FData.Max_Sonar_Depth);
//================================================================================================

    {EnvironmentCharacteristicsWindowForm.edtRangeInterval.Text := TGlobal_Convergence_Zone(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtWidthOfFirstCZ.Text := TGame_Environment_Definition(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtFirstCZSignalIncrease.Text := TGame_Environment_Definition(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtAttenuation.Text := TGame_Environment_Definition(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtMaxSonarTarget.Text := TGame_Environment_Definition(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtPositionTopLeft1.Text := TGame_Environment_Definition(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtPositionTopLeft2.Text := TGame_Environment_Definition(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtGridTopLeft1.Text     := TGame_Environment_Definition(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtGridTopLeft2.Text     := TGame_Environment_Definition(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtPositionBottomRight1.Text := TGame_Environment_Definition(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtPositionBottomRight2.Text := TGame_Environment_Definition(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtGridBottomRight1.Text := TGame_Environment_Definition(eList[i]).FData.
    EnvironmentCharacteristicsWindowForm.edtGridBottomRight2.Text := TGame_Environment_Definition(eList[i]).FData.
    }
    EnvironmentCharacteristicsWindowForm.edtAtmospheric.Text  := FloatToStr(FData.Atmospheric_Refract_Modifier);
    EnvironmentCharacteristicsWindowForm.trackAtmospheric.Position := Round(FData.Atmospheric_Refract_Modifier);

    if (FData.CZ_Active)= 1 then
      EnvironmentCharacteristicsWindowForm.cbCoverageZones.Checked := true
    else begin
      EnvironmentCharacteristicsWindowForm.cbCoverageZones.Checked := false;
    end;

    if (FData.Surface_Ducting_Active)= 1 then
      EnvironmentCharacteristicsWindowForm.cbSurfaceDucting.Checked := true
    else begin
      EnvironmentCharacteristicsWindowForm.cbSurfaceDucting.Checked := false;
    end;

    if (FData.Sub_Ducting_Active)= 1 then
      EnvironmentCharacteristicsWindowForm.cbSubsurfaceDucting.Checked := true
    else begin
      EnvironmentCharacteristicsWindowForm.cbSubsurfaceDucting.Checked := false;
    end;

    if (FData.Shipping_Rate)= 0 then
      EnvironmentCharacteristicsWindowForm.cbxShippingRate.Text := 'Distant'
    else if (FData.Shipping_Rate)= 1 then
      EnvironmentCharacteristicsWindowForm.cbxShippingRate.Text := 'Low'
    else if (FData.Shipping_Rate)= 2 then
      EnvironmentCharacteristicsWindowForm.cbxShippingRate.Text := 'Medium'
    else begin
      EnvironmentCharacteristicsWindowForm.cbxShippingRate.Text := 'High';
    end;
  end;


end;

procedure TfrmSummaryEnvironment.btnEditCharacteristicsClick(Sender: TObject);
var
  ENCGeoset, nameGameArea : string;
begin
  getEnvironment;

  fCharacteristicLandmass.Caption := Self.edtArea.Text;
  dmTTT.GetGame_Area_DefByID(EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index, EnvironmentCharacteristicsWindowForm.GameEnviroDef);

  with fCharacteristicLandmass do
  begin
    if EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Detail_Map = 'ENC' then
    begin
         Map1.Geoset := '';
         nameGameArea := edtArea.Text;
         ENCGeoset := vAppDBSetting.MapDestPathENC + '\' + nameGameArea + '.gst';
         LoadENC(ENCGeoset);

         if (ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Long <> 0) and (ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Lat <> 0) then
         begin
            Map1.CenterX := ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Long;
            Map1.CenterY := ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Lat;
         end;
         dmTTT.GetGame_Area_DefByID(EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index, EnvironmentCharacteristicsWindowForm.GameEnviroDef);
         setCBScale;
         cbSetScale.ItemIndex := cbSetScale.Items.Count - 1;
         cbSetScaleChange(Sender);
         cbSetScale.Text := cbSetScale.Items.Strings[cbSetScale.ItemIndex];
    end
    else
    begin
          fCharacteristicLandmass.createGeoset();
          dmTTT.GetGame_Area_DefByID(EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index, EnvironmentCharacteristicsWindowForm.GameEnviroDef);
          setCBScale;
          cbSetScale.ItemIndex := cbSetScale.Items.Count - 1;
          cbSetScaleChange(Sender);
          cbSetScale.Text := cbSetScale.Items.Strings[cbSetScale.ItemIndex];
    end;
    ShowModal;
  end;
end;

procedure TfrmSummaryEnvironment.btnOKClick(Sender: TObject);
begin

  if isNew then
  begin
    insert;
  end
  else
  begin
    //update
    EnvironmentFormupdate;
  end;
  btnEditCharacteristics.Enabled := true;
  if fEnvironmentSelect.fromRA then
     fEnvironmentSelect.getEnvi
  else
  begin
    frmAvailableEnvironment.showEnvi;
  end;
  //finalAreaSelect := EnvironmentForm.edtArea.Text;

  //temporary safe which game area is used
  AssignFile(enviGameAreaFile, 'enviGameAreaFile.txt');
  ReWrite(enviGameAreaFile);
  WriteLn(enviGameAreaFile, edtArea.Text );
  CloseFile(enviGameAreaFile);
  Close;
end;


procedure TfrmSummaryEnvironment.edtAreaChange(Sender: TObject);
begin
  if (edtArea.Text = '(None)') or (isnew) then
  begin
    btnEditCharacteristics.Enabled := false;
  end
  else
  begin
    btnEditCharacteristics.Enabled := true;
  end;
  edtNameChange(Sender);
end;

procedure TfrmSummaryEnvironment.edtNameChange(Sender: TObject);
begin
  btnApply.Enabled  := true;
end;

procedure TfrmSummaryEnvironment.FormShow(Sender: TObject);
begin
  if (edtArea.Text = '[None]') or (isNew) then
  begin
    btnEditCharacteristics.Enabled := false;
    btnApply.Enabled := True;
    dmTTT.GetGame_Environment_Definition_By_Identifier('Default', EnvironmentCharacteristicsWindowForm.GameEnviroDef);
  end
  else
  begin
    btnEditCharacteristics.Enabled := True;
    btnApply.Enabled := True;
  end;

  if isCopy then
  begin
    btnEditCharacteristics.Enabled := True;
//  dmTTT.GetGame_Environment_Definition_By_Identifier('Default', EnvironmentCharacteristicsWindowForm.GameEnviroDef);
  end
  else
  begin
    btnEditCharacteristics.Enabled := True;
    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryEnvironment.insert;
begin
  dmTTT.GetGame_Environment_Definition_By_Identifier('Default', EnvironmentCharacteristicsWindowForm.GameEnviroDef);
  //EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Enviro_Index := Random(1000);
  with EnvironmentCharacteristicsWindowForm.GameEnviroDef do
  begin
    FData.Game_Enviro_Identifier := edtName.Text;
    FData.Game_Area_Index        := StrToInt(id_game_area);
    FGameArea.Game_Area_Index    := StrToInt(id_game_area);

    with SIMMgr do
    begin
      EnvironmentCharacteristicsWindowForm.GameEnviroDef := insertGameEnvironment(EnvironmentCharacteristicsWindowForm.GameEnviroDef);
      envi_id := IntToStr(EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Enviro_Index);
      FGlobal_Conv.Game_Enviro_Index := StrToInt(frmSummaryEnvironment.envi_id);
      insertConverge_Zone;
    end;
  end;
end;

procedure TfrmSummaryEnvironment.insertConverge_Zone;
var  rec_global : TGlobal_Convergence_Zone;
begin
  //insert converge zone by null value first
  //set value
  //rec_global := TGlobal_Convergence_Zone.Create;
  with EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGlobal_Conv do
  begin
    Game_Enviro_Index := StrToInt(envi_id);
    Occurance_Range := 0;
    Width := 0;
    Signal_Reduction_Term := 0;
    Increase_per_CZ := 0;
    Max_Sonar_Depth := 0;
  end;
//  dmTTT.InsertGlobal_Convergence_Zone(rec_global);
end;

procedure TfrmSummaryEnvironment.EnvironmentFormupdate;
begin
  getEnvironment;
  EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Enviro_Identifier := edtName.Text;
  EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index := StrToInt(id_game_area);
  EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Area_Index := StrToInt(id_game_area);
  uSimDBEditor.updateGameEnvironment(
  EnvironmentCharacteristicsWindowForm.GameEnviroDef, frmSummaryEnvironment.envi_id);
end;

end.
