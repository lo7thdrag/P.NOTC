unit uCharacteristicLandmass;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms,
  Dialogs, Tabs, DockTabSet, OleCtrls, ExtCtrls, //RzForms,
  ImgList, StdCtrls, ComCtrls, ToolWin, uMapXHandler, uCoordConvertor,
  uDBAssets_SubAreaEnviroDefinition, newClassASTT, uDBAsset_GameEnvironment, uDBAssetObject,
  System.ImageList;

type
  TfCharacteristicLandmass = class(TForm)
    Map1: TMap;
    pnlTestArea: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    toolbtnDecreaseScale: TToolButton;
    cbSetScale: TComboBox;
    toolbtnIncreaseScale: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ImageList1: TImageList;
    grpCursorPosition: TGroupBox;
    grpFeatureCategory: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lBearingFCenter: TLabel;
    lDistanceFCenter: TLabel;
    lPosLat: TLabel;
    lGridLat: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lPosLong: TLabel;
    lGridLong: TLabel;
    btClose: TButton;
    Button4: TButton;
    Shape1: TShape;
    grpSelectedPoint: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    lArea: TLabel;
    lbtlSelectedPosLat: TLabel;
    lbtlSelectedGridLat: TLabel;
    lbtlSelectedPosLong: TLabel;
    lbtlSelectedGridLong: TLabel;
    btnEditCharacteristic: TButton;
    ToolButton10: TToolButton;
    Label5: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    lbrbSelectedPosLatt: TLabel;
    lbrbSelectedGridLatt: TLabel;
    lbrbSelectedPosLong: TLabel;
    lbrbSelectedGridLong: TLabel;
    edtDefaults: TEdit;
    Label12: TLabel;
    btShowDefaultList: TButton;
    edtSonar: TEdit;
    btShowSonarList: TButton;
    Label15: TLabel;
    cbSonarCategory: TComboBox;
    edSonarDepth: TEdit;
    edTargetSourceLevel: TEdit;
    edTargetCrossSection: TEdit;
    edTargetDepth: TEdit;
    edPredictionRange: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    btCalculate: TButton;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    btOk: TButton;
    lbcenterx: TLabel;
    lbcentery: TLabel;
    procedure btCloseClick(Sender: TObject);
    procedure Map1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Map1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnEditCharacteristicClick(Sender: TObject);
    procedure toolbtnIncreaseScaleClick(Sender: TObject);
    procedure cbSetScaleChange(Sender: TObject);
    procedure toolbtnDecreaseScaleClick(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Map1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Map1DrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull,
      RectInvalid: IDispatch);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure Map1MapViewChanged(Sender: TObject);
    procedure setCBScale;
    procedure btShowDefaultListClick(Sender: TObject);
    procedure btShowSonarListClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure edSonarDepthKeyPress(Sender: TObject; var Key: Char);
    procedure edSonarDepthKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTargetSourceLevelKeyPress(Sender: TObject; var Key: Char);
    procedure edTargetSourceLevelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTargetCrossSectionKeyPress(Sender: TObject; var Key: Char);
    procedure edTargetCrossSectionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTargetDepthKeyPress(Sender: TObject; var Key: Char);
    procedure edTargetDepthKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPredictionRangeKeyPress(Sender: TObject; var Key: Char);
    procedure edPredictionRangeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    statePan: Boolean;
    stateSelect: Boolean;
    { Private declarations }
    function getRectangelChoose(const X, Y: Integer): TSubArea_Enviro_Definition;
    function isIntersectList(const X, Y: Integer): boolean;
    function isRectIntersect(rec : TRect): boolean;
    function GetIndexLong(const x: integer): string;
    function GetIndexLat(const y: integer): string;
    procedure GetGridIndex(const cx, cy, w: Double;var gid: TRect);


  public
    { Public declarations }
    stateDrawing : boolean;
    stateMove : boolean;
    stateDelete : boolean;
    isDown: boolean;
    FLyrDraw    : CMapXLayer;
    FCanvas     : TCanvas;
    rectangle : TRect;
    xstart, ystart, xstop, ystop: Integer;
    sonarCategoryList: Tlist;
    FMapPlatform: TSimMap;
    FCoordPlatformConv : TCoordConverter;
    rectList: TList;
    rectNewObj : TSubArea_Enviro_Definition;
    rectSelect: TSubArea_Enviro_Definition;
    getNameArea : string;
    diffXnm, diffYnm : double;
    gridLatt, gridLong,addStringX, addStringY : string;
    gPoint  : TPoint;
    //default id
    default_index: Integer;
    sonar_index: Integer;

    function SecondToTime(const s: Integer): TTime;

    procedure createGeoset;
    procedure drawAllRect;
    procedure getSubGameArea;
    procedure insertSubGameArea(var sub_Area: TSubArea_Enviro_Definition);
    procedure updateSubGameArea(id: Integer; var sub_Area: TSubArea_Enviro_Definition);
    procedure deleteSelectedSubGameArea(var sub_Area: TSubArea_Enviro_Definition);
    procedure updateAll;

    procedure load();
    procedure LoadMap(aGeoset: String);
    procedure LoadENC(ENCGeoset : string);
    procedure ScreenShot(DestBitmap : TBitmap) ;
    procedure setDefaultSubArea(subArae: TSubArea_Enviro_Definition);

  end;

var
  fCharacteristicLandmass: TfCharacteristicLandmass;
  xx: double;
  yy: double;
  rectTemp: TRect;
  b,TmpBmp:TBitmap;
  MouseIsDown,isCapturingScreen : boolean;



implementation

uses uBaseCoordSystem, uEnvironmentCharacteristicsWindow, uSimDBEditor, math, uDataModuleTTT,
  ufrmAvailableGameArea, uExerciseArea, OverbyteIcsWSocket, tttData,
  ufrmAvailableEnvironment, drawRec, ufrmSummaryEnvironment, uGameDefaultSelect,
  ufrmSONAROnBoardPickList,uScrCapture,ufCaptureRes, uDBEditSetting;

{$R *.dfm}

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure TfCharacteristicLandmass.ScreenShot(DestBitmap : TBitmap) ;
 var
   DC : HDC;
 begin
   DC := GetDC (GetDesktopWindow) ;
   try
    DestBitmap.Width := GetDeviceCaps (DC, HORZRES) ;
    DestBitmap.Height := GetDeviceCaps (DC, VERTRES) ;
    BitBlt(DestBitmap.Canvas.Handle, 0, 0, DestBitmap.Width, DestBitmap.Height, DC, 0, 0, SRCCOPY) ;
   finally
    ReleaseDC (GetDesktopWindow, DC) ;
   end;
 end;

 procedure TfCharacteristicLandmass.setDefaultSubArea(subArae: TSubArea_Enviro_Definition);
 begin
   dmTTT.GetGame_Environment_Definition(StrToInt(frmSummaryEnvironment.envi_id), EnvironmentCharacteristicsWindowForm.GameEnviroDef);
   with EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData do
   begin
      subArae.FData.Enviro_Identifier              := 'Sub-Area ' + IntToStr(rectList.Count+1);;

      subArae.FData.Wind_Speed                     := Wind_Speed;
      subArae.FData.Wind_Direction                 := Wind_Direction;
      subArae.FData.Daytime_Visual_Modifier        := Daytime_Visual_Modifier;
      subArae.FData.Nighttime_Visual_Modifier      := Nighttime_Visual_Modifier;
      subArae.FData.Daytime_Infrared_Modifier      := Daytime_Infrared_Modifier;
      subArae.FData.Nighttime_Infrared_Modifier    := Nighttime_Infrared_Modifier;
      subArae.FData.Rain_Rate                      := Rain_Rate;
      subArae.FData.Cloud_Base_Height              := Cloud_Base_Height;
      subArae.FData.Cloud_Attenuation              := Cloud_Attenuation;
      subArae.FData.Sea_State                      := Sea_State;
      subArae.FData.Ocean_Current_Speed            := Ocean_Current_Speed;
      subArae.FData.Ocean_Current_Direction        := Ocean_Current_Direction;
      subArae.FData.Thermal_Layer_Depth            := Thermal_Layer_Depth;
      subArae.FData.Sound_Velocity_Type            := Sound_Velocity_Type;
      subArae.FData.Surface_Sound_Speed            := Surface_Sound_Speed;
      subArae.FData.Layer_Sound_Speed              := Layer_Sound_Speed;
      subArae.FData.Bottom_Sound_Speed             := Bottom_Sound_Speed;
      subArae.FData.Bottomloss_Coefficient         := Bottomloss_Coefficient;
      subArae.FData.Ave_Ocean_Depth                := Ave_Ocean_Depth;
      subArae.FData.CZ_Active                      := CZ_Active;
      subArae.FData.Surface_Ducting_Active         := Surface_Ducting_Active;
      subArae.FData.Upper_Limit_Sur_Duct_Depth     := Upper_Limit_Surface_Duct_Depth;
      subArae.FData.Lower_Limit_Sur_Duct_Depth     := Lower_Limit_Surface_Duct_Depth;
      subArae.FData.Sub_Ducting_Active             := Sub_Ducting_Active;
      subArae.FData.Upper_Limit_Sub_Duct_Depth     := Upper_Limit_Sub_Duct_Depth;
      subArae.FData.Lower_Limit_Sub_Duct_Depth     := Lower_Limit_Sub_Duct_Depth;
      subArae.FData.Shipping_Rate                  := Shipping_Rate;
      subArae.FData.Shadow_Zone_Trans_Loss         := Shadow_Zone_Trans_Loss;
      subArae.FData.Atmospheric_Refract_Modifier   := Atmospheric_Refract_Modifier;
      subArae.FData.Barometric_Pressure            := Barometric_Pressure;
      subArae.FData.Air_Temperature                := Air_Temperature;
      subArae.FData.Surface_Temperature            := Surface_Temperature;

   end;
 end;

procedure TfCharacteristicLandmass.GetGridIndex(const cx, cy, w: Double;
        var gid: TRect);
var i: integer;
    halfW: double;
begin
  halfW := 0.5 * w;

  i := Floor((cx - halfW + 180.0) / 10.0) + 1;
  gid.Left    := EnsureRange(i, 1, 36);

  i:=  Ceil((cx + halfW + 180.0) / 10.0) ;
  gid.Right   :=  EnsureRange(i, 1, 36);

  i := Floor ((90.0-(cy + halfW )) / 10.0)  ;
  gid.Top     :=  EnsureRange(i, 0, 17);

  i := Floor((90.0-(cy - halfW )) / 10.0) ;
  gid.Bottom  :=  EnsureRange(i, 0, 17);
end;

function GetIndexLong(const x: integer): string;
var i: integer;
begin
  i := EnsureRange(x, 1, 36);
  Result := Format('%2d', [i]);
end;

function GetIndexLatt(const y: integer): string;
var i: integer;
begin
  i := EnsureRange(y, 0, 17);
  Result := Char(Ord('A') + Y)
end;

procedure TfCharacteristicLandmass.load();
var i, j, k, lCount: integer;
    r: TRect;
    sX, sY, p, fName, lName: string;
    ssLayer : TStrings;
//    ii, jj, kk : integer;
    widthNM : integer;
begin
  map1.Geoset := '';
  //lbxFile.Clear;

  p := ExtractFilePath(Application.ExeName);

  ssLayer := TStringList.Create;
  //ssLayer.LoadFromFile(p + 'layers.cfg');
  ssLayer.LoadFromFile(p + 'ConfigureLayer.txt');

  p := p + 'game_area\cells\';

  GetGridIndex(fEditGameCenter.GCx, fEditGameCenter.GCy, fEditGameCenter.Gwidth, r);

  lCount := 1;
  for k := 0 to ssLayer.Count - 1 do begin

    for j := r.Top to r.Bottom do begin
      sY := GetIndexLatt(j);
      for i := r.Left to  r.Right do begin
        sX := GetIndexLong(i);

        lName := ssLayer[k] + '_'   + sY + '_' + sX + '.tab';
        fName := p + lName;
        if FileExists(fName) then begin
          //lbxFile.Items.Add(lName);
          map1.Layers.Add(fName, lCount);

          inc(lCount);
        end;
      end;
    end;
  end;

  //fName := ExtractFilePath(Application.ExeName) + 'map\' + edGstName.Text + '.gst';
  widthNM := strtoint(ExerciseAreaForm.edtMaximum.Text);
  map1.ZoomTo(widthNM, fEditGameCenter.GCx, fEditGameCenter.GCy); //62
  fName := ExtractFilePath(Application.ExeName) + 'game_area\' + getNameArea + '.gst';
  //Map1.SaveMapAsGeoset(edGstName.Text, fname );
  map1.SaveMapAsGeoset('getNameArea', fname );
  ssLayer.Free;

end;

function TfCharacteristicLandmass.SecondToTime(const s: Integer): TTime;
var
  h: Double;
begin
  h := s / 3600;
  Result := h / 24;
end;

procedure TfCharacteristicLandmass.btnEditCharacteristicClick(Sender: TObject);
var
  t: TTime;
begin
  //insertSubGameArea(rectSelect);
  if rectSelect <> nil then
  begin
    with EnvironmentCharacteristicsWindowForm do
    begin
      with rectSelect.FData do
      begin
      Caption := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Enviro_Identifier;
      edtName.Text := lArea.Caption;
      edtSpeed.Text := FloatToStr(rectSelect.FData.Ocean_Current_Speed);
      edtDirection.Text := FloatToStr(rectSelect.FData.Ocean_Current_Direction);
      edtUpperLimitSurfaceDucting.Text:= FloatToStr(rectSelect.FData.Upper_Limit_Sur_Duct_Depth);
      edtLowerLimitSurfaceDucting.Text := FloatToStr(rectSelect.FData.Lower_Limit_Sur_Duct_Depth);
      edtDepthOfThermalLayer.Text := FloatToStr(rectSelect.FData.Thermal_Layer_Depth);
      edtSeaState.Text := FloatToStr(rectSelect.FData.Sea_State);
      edtBottomLossCoeff.Text := FloatToStr(rectSelect.FData.Bottomloss_Coefficient);
      edtSurfaceTemperature.Text := FloatToStr(rectSelect.FData.Surface_Temperature);
      edtAverageOceanDepth.Text := '6';
      edtShadowZone.Text := FloatToStr(rectSelect.FData.Shadow_Zone_Trans_Loss);
      edtSurface.Text := '3400';
      edtLayer.Text := '3000';
      edtBottom.Text := '3500';
      edtUpperLimitSubsurfaceDucting.Text := FloatToStr(rectSelect.FData.Upper_Limit_Sub_Duct_Depth);
      edtLowerLimitSubsurfaceDucting.Text := FloatToStr(rectSelect.FData.Lower_Limit_Sub_Duct_Depth);

      //edtRangeInterval.Text := FloatToStr(rectSelect.FData.Cloud_Base_Height);  //blum tahu
      //edtWidthOfFirstCZ.Text := FloatToStr(rectSelect.FData.Wind_Speed); //blum tahu
      //edtFirstCZSignalIncrease.Text := FloatToStr(rectSelect.FData.Wind_Speed); //blum tahu
      //edtAttenuation.Text := FloatToStr(rectSelect.FData.Cloud_Attenuation);   //blum tahu
      //edtMaxSonarTarget.Text := FloatToStr(rectSelect.FData.Wind_Speed);  //blum tahu

      edtPositionTopLeft1.Text := formatDM_longitude(rectSelect.FData.X_Position_1);
      edtPositionTopLeft2.Text := formatDM_latitude(rectSelect.FData.Y_Position_1);
      edtGridTopLeft1.Text := FormatFloat('0.000', rectSelect.FData.X_Position_1);
      edtGridTopLeft2.Text := FormatFloat('0.000', rectSelect.FData.Y_Position_1);
      edtPositionBottomRight1.Text := formatDM_longitude(rectSelect.FData.X_Position_2);
      edtPositionBottomRight2.Text := formatDM_latitude(rectSelect.FData.Y_Position_2);
      edtGridBottomRight1.Text := FormatFloat('0.000', rectSelect.FData.X_Position_2);
      edtGridBottomRight2.Text := FormatFloat('0.000', rectSelect.FData.Y_Position_2);
      edtAtmospheric.Text := '100';
      edtDayVis.Text := '100';
      edtNightVis.Text := '80';
      edtNightInfra.Text := '80';
      edtDayInfra.Text := '100';
      edtAttenRainRate.Text := FloatToStr(rectSelect.FData.Rain_Rate);
      edtAttenCloud.Text := FloatToStr(rectSelect.FData.Cloud_Attenuation);
      edtAirTemp.Text := '20';
      edtBarometricPressure.Text := '17.5';
      edtCloudBaseHeight.Text := '100';
      edtAboveSpeed.Text := FloatToStr(rectSelect.FData.Wind_Speed); // blum tahu
      edtAboveDirection.Text := FloatToStr(rectSelect.FData.Wind_Direction); // blum tahu
      rw.Degree := rectSelect.FData.Wind_Direction;
      rw1.Degree := rectSelect.FData.Ocean_Current_Direction;
      {
      edtAboveHFStart.Text := FloatToStr(rectSelect.FData.Wind_Speed); //blum tahu
      edtAboveHFEnd.Text := FloatToStr(rectSelect.FData.Wind_Speed); //blum tahu
      }
//      edtSunrise.Text := FloatToStr(GameEnviroDef.FData.Sunrise); //blum tahu
//      edtSunset.Text := FloatToStr(GameEnviroDef.FData.Sunset); //blum tahu
//      edtTwilight.Text := FloatToStr(GameEnviroDef.FData.Period_of_Twilight); //blum tahu

      t := SecondToTime(GameEnviroDef.FData.Sunrise);
      edtSunrise.Text := FormatDateTime('hh:nn:ss', IntToDateTime(GameEnviroDef.FData.Sunrise));
      t := SecondToTime(GameEnviroDef.FData.Sunset);
      edtSunset.Text := FormatDateTime('hh:nn:ss', IntToDateTime(GameEnviroDef.FData.Sunset));
      t := SecondToTime(GameEnviroDef.FData.Period_of_Twilight);
      edtTwilight.Text := FormatDateTime('hh:nn:ss', IntToDateTime(GameEnviroDef.FData.Period_of_Twilight));

      edtRangeInterval.Text := '0000';
      edtWidthOfFirstCZ.Text := '0000';
      edtFirstCZSignalIncrease.Text := '0000';
      edtAttenuation.Text := '0000';
      edtMaxSonarTarget.Text := '0000';

       if Sound_Velocity_Type = 0 then
         lbSoundVelocity.Caption := 'Positive'
      else if Sound_Velocity_Type = 1 then
         lbSoundVelocity.Caption := 'Negative'
      else if Sound_Velocity_Type = 2 then
         lbSoundVelocity.Caption := 'Positive over negative'
      else if Sound_Velocity_Type = 3 then
         lbSoundVelocity.Caption := 'Negative over positive';
      Sound_Velocity_Type         := GameEnviroDef.FData.Sound_Velocity_Type;

      {
      edTargetSourceLevel.Text := FloatToStr(rectSelect.FData.Wind_Speed); //blum tahu
      edTargetCrossSection.Text := FloatToStr(rectSelect.FData.Wind_Speed);
      edTargetDepth.Text := FloatToStr(rectSelect.FData.Wind_Speed);
      }
      //combo box
      cbxShippingRate.ItemIndex := rectSelect.FData.Shipping_Rate;
      if rectSelect.FData.Surface_Ducting_Active = 1 then
      begin
        cbSurfaceDucting.Checked := true;
      end
      else
      begin
        cbSurfaceDucting.Checked := false;
      end;

      if rectSelect.FData.Sub_Ducting_Active = 1 then
      begin
        cbSubsurfaceDucting.Checked := true;
      end
      else
      begin
        cbSubsurfaceDucting.Checked := false;
      end;

      if rectSelect.FData.CZ_Active = 1 then
      begin
        cbCoverageZones.Checked := true;
      end
      else
      begin
        cbCoverageZones.Checked := false;
      end;
      if HF_Black_Hole = 1 then
      begin
         cbHFTransmission.Checked := true
      end
      else
      begin
        cbHFTransmission.Checked := false;
      end;
      end;
    end;
  end
  else
  begin
    with EnvironmentCharacteristicsWindowForm do
    begin
      dmTTT.GetGame_Environment_Definition(StrToInt(frmSummaryEnvironment.envi_id), EnvironmentCharacteristicsWindowForm.GameEnviroDef);

      with EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData do
      begin
      Caption := lArea.Caption;
      edtName.Text := 'Global Environment ' + EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Enviro_Identifier;
      edtSpeed.Text := FloatToStr(Ocean_Current_Speed);
      edtDirection.Text := FloatToStr(Ocean_Current_Direction);
      edtUpperLimitSurfaceDucting.Text:= FloatToStr(Upper_Limit_Surface_Duct_Depth);
      edtLowerLimitSurfaceDucting.Text := FloatToStr(Lower_Limit_Surface_Duct_Depth);
      edtDepthOfThermalLayer.Text := FloatToStr(Thermal_Layer_Depth);
      edtSeaState.Text := FormatFloat('1',Sea_State);
      edtBottomLossCoeff.Text := FloatToStr(Bottomloss_Coefficient);
      edtSurfaceTemperature.Text := FloatToStr(Surface_Temperature);
      edtAverageOceanDepth.Text := '6';
      edtShadowZone.Text := FloatToStr(Shadow_Zone_Trans_Loss);
      edtSurface.Text := '3400';
      edtLayer.Text := '3000';
      edtBottom.Text := '3500';
      edtUpperLimitSubsurfaceDucting.Text := FloatToStr(Upper_Limit_Sub_Duct_Depth);
      edtLowerLimitSubsurfaceDucting.Text := FloatToStr(Lower_Limit_Sub_Duct_Depth);

      edtRangeInterval.Text := FloatToStr(Cloud_Base_Height);  //blum tahu
      //edtWidthOfFirstCZ.Text := FloatToStr(Wind_Speed); //blum tahu
      //edtFirstCZSignalIncrease.Text := FloatToStr(Wind_Speed); //blum tahu
      edtAttenuation.Text := FloatToStr(Cloud_Attenuation);   //blum tahu
      //edtMaxSonarTarget.Text := FloatToStr(Wind_Speed);  //blum tahu

      edtPositionTopLeft1.Text := formatDM_longitude((Map1.CenterX) - (map1.Width div 2));
      edtPositionTopLeft2.Text := formatDM_latitude((Map1.CenterY) - (map1.Height div 2));
      edtGridTopLeft1.Text := FormatFloat('0.000',(Map1.CenterX) - (map1.Width div 2));
      edtGridTopLeft2.Text := FormatFloat('0.000', (Map1.CenterY) - (map1.Height div 2));
      edtPositionBottomRight1.Text := formatDM_longitude((Map1.CenterX) + (map1.Width div 2));
      edtPositionBottomRight2.Text := formatDM_latitude((Map1.CenterY) + (map1.Height div 2));
      edtGridBottomRight1.Text := FormatFloat('0.000', (Map1.CenterX) + (map1.Width div 2));
      edtGridBottomRight2.Text := FormatFloat('0.000', (Map1.CenterY) + (map1.Height div 2));
      edtAtmospheric.Text := '100';
      edtDayVis.Text := '100';
      edtNightVis.Text := '80';
      edtNightInfra.Text := '80';
      edtDayInfra.Text := '100';
      edtAttenRainRate.Text := FloatToStr(Rain_Rate);
      edtAttenCloud.Text := FloatToStr(Cloud_Attenuation);
      edtAirTemp.Text := '20';
      edtBarometricPressure.Text := FloatToStr(Barometric_Pressure);
      edtCloudBaseHeight.Text := '100';
      edtAboveSpeed.Text := FloatToStr(Wind_Speed); // blum tahu
      edtAboveDirection.Text := FloatToStr(Wind_Direction); // blum tahu
      rw.Degree := Wind_Direction;
      rw1.Degree := Ocean_Current_Direction;
      edtAboveHFStart.Text := FloatToStr(Start_HF_Range_Gap); //blum tahu
      edtAboveHFEnd.Text := FloatToStr(End_HF_Range_Gap); //blum tahu
//      edtSunrise.Text := TimeToStr(Sunrise); //blum tahu
//      edtSunset.Text := TimeToStr(Sunset); //blum tahu
//      edtTwilight.Text := FloatToStr(Period_of_Twilight); //blum tahu
      t := SecondToTime(Sunrise);
      edtSunrise.Text := FormatDateTime('hh:nn:ss', IntToDateTime(Sunrise));
      t := SecondToTime(Sunset);
      edtSunset.Text := FormatDateTime('hh:nn:ss', IntToDateTime(Sunset));
      t := SecondToTime(Period_of_Twilight);
      edtTwilight.Text := FormatDateTime('hh:nn:ss', IntToDateTime(Period_of_Twilight));
      {
      edTargetSourceLevel.Text := FloatToStr(Wind_Speed); //blum tahu
      edTargetCrossSection.Text := FloatToStr(Wind_Speed);
      edTargetDepth.Text := FloatToStr(Wind_Speed);
      }

      edtRangeInterval.Text := '0000';
      edtWidthOfFirstCZ.Text := '0000';
      edtFirstCZSignalIncrease.Text := '0000';
      edtAttenuation.Text := '0000';
      edtMaxSonarTarget.Text := '0000';

      //combo box
      cbxShippingRate.ItemIndex := Shipping_Rate;
      if Surface_Ducting_Active = 1 then
      begin
        cbSurfaceDucting.Checked := true;
      end
      else
      begin
        cbSurfaceDucting.Checked := false;
      end;

      if Sub_Ducting_Active = 1 then
      begin
        cbSubsurfaceDucting.Checked := true;
      end
      else
      begin
        cbSubsurfaceDucting.Checked := false;
      end;

      if CZ_Active = 1 then
      begin
        cbCoverageZones.Checked := true;
        with GameEnviroDef.FGlobal_Conv do
        begin
           EnvironmentCharacteristicsWindowForm.edtRangeInterval.Text := FloatToStr(Occurance_Range);
           EnvironmentCharacteristicsWindowForm.edtWidthOfFirstCZ.Text := FloatToStr(Width);
           EnvironmentCharacteristicsWindowForm.edtFirstCZSignalIncrease.Text := FloatToStr(Increase_per_CZ);
           EnvironmentCharacteristicsWindowForm.edtAttenuation.Text := FloatToStr(Signal_Reduction_Term);
           EnvironmentCharacteristicsWindowForm.edtMaxSonarTarget.Text := FloatToStr(Max_Sonar_Depth);
        end;
      end
      else
      begin
        cbCoverageZones.Checked := false;
        with GameEnviroDef.FGlobal_Conv do
        begin
           EnvironmentCharacteristicsWindowForm.edtRangeInterval.Text := '';
           EnvironmentCharacteristicsWindowForm.edtWidthOfFirstCZ.Text := '';
           EnvironmentCharacteristicsWindowForm.edtFirstCZSignalIncrease.Text := '';
           EnvironmentCharacteristicsWindowForm.edtAttenuation.Text := '';
           EnvironmentCharacteristicsWindowForm.edtMaxSonarTarget.Text := '';
        end;
      end;

      {if HF_Black_Hole = 1 then
      begin
        cbHFTransmission.Checked := True;
      end;    }
      end;
    end;
  end;
  EnvironmentCharacteristicsWindowForm.ShowModal;
end;

procedure TfCharacteristicLandmass.btOkClick(Sender: TObject);
begin
  //updateAll;
  Close;
  frmSummaryEnvironment.btnApply.Enabled := False;
  frmSummaryEnvironment.btnOK.Enabled := True;
end;

procedure TfCharacteristicLandmass.btShowDefaultListClick(Sender: TObject);
begin
  //default
  fGameDefaults.fromCharacteristic := true;
  fGameDefaults.fromResaourceAlloc := false;
  fGameDefaults.ShowModal;
end;

procedure TfCharacteristicLandmass.btShowSonarListClick(Sender: TObject);
begin
  //sonar
//  frmSonarOnBoardPickList.id_form := fromCharacteristic;
//  frmSonarOnBoardPickList.ShowModal;
end;

procedure TfCharacteristicLandmass.Button4Click(Sender: TObject);
begin
    stateDrawing := false;
    stateMove := false;
    stateDelete := false;
    b := TBitmap.Create;
    ScreenShot(b);
    isCapturingScreen := true;
    fScrCapture.Image1.Picture.Assign(b);
end;

procedure TfCharacteristicLandmass.btCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfCharacteristicLandmass.cbSetScaleChange(Sender: TObject);
var z : Double;
    s : string;
begin
  Map1.OnMapViewChanged := nil;
  if cbSetScale.ItemIndex < 0  then Exit;

  //if (cbSetScale.ItemIndex<=5) then
  if (cbSetScale.ItemIndex <= 500) then
  begin
   s := cbSetScale.Items[cbSetScale.ItemIndex];
   try
     z := StrToFloat(s);
     Map1.ZoomTo(z, Map1.CenterX, Map1.CenterY);
   finally

   end;
  end
  else cbSetScale.ItemIndex := cbSetScale.ItemIndex -1 ;
  Map1.OnMapViewChanged := Map1MapViewChanged;
end;

procedure TfCharacteristicLandmass.setCBScale;
var
  widthNM : integer;
    limitWidth : Array[0..15] of double;
    arrayTemp : Array[0..30] of double;
    arrayStringTemp : Array[0..30] of String;
    resultTemp : Array[0..30] of String;
    a, b : integer;
begin
  widthNM := floor(EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_X_Dimension);

  //isi combo box
  cbSetScale.Clear;
  //widthNM := strtoint(ExerciseAreaForm.edtMaximum.Text);

  limitWidth[0] := 0.125;
  limitWidth[1] := 0.25;
  limitWidth[2] := 0.5;
  limitWidth[3] := 1;
  limitWidth[4] := 2;
  limitWidth[5] := 4;
  limitWidth[6] := 8;
  limitWidth[7] := 16;
  limitWidth[8] := 32;
  limitWidth[9] := 64;
  limitWidth[10] := 128;
  limitWidth[11] := 256;
  limitWidth[12] := 512;
  limitWidth[13] := 1024;
  limitWidth[14] := 2048;
  limitWidth[15] := 2500;

  a := 0;
  while limitWidth[a] < widthNm do
  begin
    arrayTemp[a] := limitWidth[a];
    a := a+1;
  end;
  arrayTemp[a] := widthNm;

  for b := 0 to a do
      arrayStringTemp[b] := floattostr(arrayTemp[b]);

  for b := 0 to a do
  begin
      resultTemp[b] := arrayStringTemp[b];
      cbSetScale.Items.Add(resultTemp[b]);
  end;
end;

procedure TfCharacteristicLandmass.FormActivate(Sender: TObject);
begin
  Map1.Refresh;
end;

procedure TfCharacteristicLandmass.FormCreate(Sender: TObject);
begin
  sonarCategoryList := TList.Create;
  rectList := TList.Create;
  //Map1.DoubleBuffered := true;
  FMapPlatform := TSimMap.Create(Map1);
  FCoordPlatformConv := TCoordConverter.Create;

  FMapPlatform.FMap.OnMouseMove := Map1MouseMove;
  FMapPlatform.FMap.OnMouseDown := Map1MouseDown;
  FMapPlatform.FMap.OnMouseUp := Map1MouseUp;
  FMapPlatform.FMap.OnDrawUserLayer := Map1DrawUserLayer;

  FCanvas := TCanvas.Create;

  //default state all false
  stateDrawing := false;
  stateMove := false;
  stateDelete := false;

  Map1.CurrentTool := miArrowTool;
end;

procedure TfCharacteristicLandmass.FormShow(Sender: TObject);
begin
  {
  with SIMMgr do
  begin
    GetGame_Environment_Definition(StrToInt(EnvironmentForm.envi_id), EnvironmentCharacteristicsWindowForm.GameEnviroDef);
  end;
  }
 // dmTTT.GetGame_Area_DefByID(EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index, EnvironmentCharacteristicsWindowForm.GameEnviroDef);

  //createGeoset;
  FCoordPlatformConv.FMap := Self.Map1;
  //FMapPlatform.LoadMap(ExtractFilePath(Application.ExeName) + 'map\Envi.gst');
  Self.getSubGameArea;
  Map1.CurrentTool  := miArrowTool;
  Map1.MousePointer := miCrossCursor;
  stateMove := true;
  Map1.Refresh;
  Map1.Repaint;
end;

procedure TfCharacteristicLandmass.Map1DrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer;
  const RectFull, RectInvalid: IDispatch);
var I : Integer;
begin
  if not Assigned(FCanvas) then
    Exit;
    FCanvas.Handle := hOutputDC;

    FCanvas.Pen.Color := clWhite;
    //FCanvas.Pen.Mode := pmMask;
    FCanvas.Pen.Width := 2;
    FCanvas.Brush.Style := bsClear;

    if stateDrawing and isDown then
      FCanvas.Rectangle(rectangle);
    //gambar kotak
    for I := 0 to rectList.Count - 1 do
    begin
      with TSubArea_Enviro_Definition(rectList[I]) do
      begin
        FCoordPlatformConv.ConvertToScreen(FData.X_Position_1, FData.Y_Position_1, FRect.Left, FRect.Top);
        FCoordPlatformConv.ConvertToScreen(FData.X_Position_2, FData.Y_Position_2, FRect.Right, FRect.Bottom);
        FCanvas.Rectangle(FRect);
      end;
    end;

    // warna kuning pada selected rectangle
    if rectSelect <> nil then
    begin
      FCanvas.Pen.Color := clYellow;
      FCoordPlatformConv.ConvertToScreen(rectSelect.FData.X_Position_1, rectSelect.FData.Y_Position_1, rectSelect.FRect.Left, rectSelect.FRect.Top);
      FCoordPlatformConv.ConvertToScreen(rectSelect.FData.X_Position_2, rectSelect.FData.Y_Position_2, rectSelect.FRect.Right, rectSelect.FRect.Bottom);
      FCanvas.Rectangle(rectSelect.FRect);
    end;

    FCanvas.Brush.Style := bsSolid;


  if isCapturingScreen then begin
      FCanvas.Pen.Color := RGB(255, 255, 255);
      FCanvas.Pen.Width := 1;
      FCanvas.Pen.Mode  := pmCopy;
      FCanvas.Brush.Style := bsClear;

        if MouseIsDown then begin
          FCanvas.MoveTo(gPoint.X, 0);

          FCanvas.Rectangle(fScrCapture.PDown.X, fScrCapture.PDown.Y, gPoint.X, gPoint.Y  );

          FCanvas.TextOut(gPoint.X+10,gPoint.Y-20, 'width:'+inttostr(gPoint.X-fscrCapture.PDown.X)+
          ',height:'+inttostr(gPoint.Y-fscrcapture.PDown.Y)+';('+inttostr(pnlTestArea.Width+gPoint.X)+','+IntToStr(gPoint.Y)+')');
        end
        else begin
          FCanvas.MoveTo(gPoint.X, 0);
          FCanvas.LineTo(gPoint.X, Height);

          FCanvas.MoveTo(0, gPoint.Y);
          FCanvas.LineTo(Width, gPoint.Y);
          FCanvas.TextOut(gPoint.X+10,gPoint.Y-20, IntToStr(pnlTestArea.Width+gPoint.X)+','+IntToStr(gPoint.Y));
        end;

    end;

end;

procedure TfCharacteristicLandmass.Map1MapViewChanged(Sender: TObject);
var
      tempZoom : double;
begin
      if Map1.CurrentTool = miZoomInTool then
      begin
         if Map1.Zoom <= 0.125 then tempZoom := 0.125;
         if (Map1.Zoom > 0.125) AND (Map1.Zoom < 1) then tempZoom := Map1.Zoom;
         if (Map1.Zoom >= 1) AND (Map1.Zoom <= 2500) then tempZoom := round(Map1.Zoom);
         if Map1.Zoom > 2500 then tempZoom := 2500;

         Map1.OnMapViewChanged := nil;
         Map1.ZoomTo(tempZoom, Map1.CenterX, Map1.CenterY);

         if (Map1.Zoom > 0.125) AND (Map1.Zoom < 0.25) then
         begin
               cbSetScale.Text := FormatFloat('0.000', tempZoom);
         end
         else if (map1.Zoom >= 0.25) AND (map1.Zoom < 0.5) then
         begin
               cbSetScale.Text := FormatFloat('0.00', tempZoom);
         end
         else if (map1.Zoom >= 0.5) AND (map1.Zoom < 1) then
         begin
               cbSetScale.Text := FormatFloat('0.0', tempZoom);
         end
         else
               cbSetScale.Text := floattostr(tempZoom);
         Map1.OnMapViewChanged := Map1MapViewChanged;
      end;

end;

procedure TfCharacteristicLandmass.Map1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  xxx: double;
  yyy: double;
  mapHeight: Double;
  mapWidth: Double;
  delete: Integer;
  yCursorPoint, xCursorPoint, yCenter, xCenter, diffXStart, diffYStart, diffXStop, diffYStop : double;
begin
  FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);
  xxx := X;
  yyy := Y;

  if statePan then
  begin
    Map1.CenterX := xx;
    Map1.CenterY := yy;

    //up button
    ToolButton14.Click;
  end;

  if stateDrawing then
  begin
    xstart := X;
    xstop := X;
    ystart := Y;
    ystop := Y;
    FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);
    lbtlSelectedPosLat.Caption := formatDM_latitude(yy);
    lbtlSelectedPosLong.Caption := formatDM_longitude(xx);
    lbtlSelectedGridLat.Caption := FormatFloat('0.00', yy);
    lbtlSelectedGridLong.Caption := FormatFloat('0.00', xx);

    isDown := true;
  end;

  if stateMove then
  begin
    rectSelect := getRectangelChoose(X, Y);

    if rectSelect <> nil then
    begin
      FCoordPlatformConv.ConvertToMap(rectSelect.FRect.TopLeft.X, rectSelect.FRect.TopLeft.Y, xx, yy);
      FCoordPlatformConv.ConvertToMap(rectSelect.FRect.BottomRight.X, rectSelect.FRect.BottomRight.Y, xxx, yyy);

      lArea.Caption := rectSelect.FData.Enviro_Identifier;

      with EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea do
      begin
      yCenter := Game_Centre_Lat;
      xCenter := Game_Centre_Long;

      diffYStart := abs(yy - Game_Centre_Lat);
      diffXStart := abs(xx - Game_Centre_Long);

      diffYStop := abs(yyy - Game_Centre_Lat);
      diffXStop := abs(xxx - Game_Centre_Long);

      diffYnm := diffYStart * 60;
      diffXnm := diffXStart * 60;

      lbtlSelectedPosLat.Caption := formatDM_latitude(yy);
      lbtlSelectedPosLong.Caption := formatDM_longitude(xx);
      lbtlSelectedGridLat.Caption := FormatFloat('0.00', diffYnm);
      lbtlSelectedGridLong.Caption := FormatFloat('0.00', diffXnm);

      diffYnm := diffYStop * 60;
      diffXnm := diffXStop * 60;

      lbrbSelectedPosLatt.Caption := formatDM_latitude(yyy);
      lbrbSelectedPosLong.Caption := formatDM_longitude(xxx);
      lbrbSelectedGridLatt.Caption := FormatFloat('0.00', diffYnm);
      lbrbSelectedGridLong.Caption := FormatFloat('0.00', diffXnm);
      end;
    end
    else
    begin

      with EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea do
      begin

        lArea.Caption := '(Global-Environment)';

        yCursorPoint := yy;
        xCursorPoint := xx;

        yCenter := Game_Centre_Lat;
        xCenter := Game_Centre_Long;

        diffYStart := abs(Game_Centre_Lat - yCenter/60);
        diffXStart := abs(Game_Centre_Long - xCenter/60);

        diffYStop := abs(Game_Centre_Lat + yCenter/60);
        diffXStop := abs(Game_Centre_Long + xCenter/60);

        diffYnm := diffYStart * 60;
        diffXnm := diffXStart * 60;

        lbtlSelectedPosLat.Caption := '-';
        lbtlSelectedPosLong.Caption := '-';
        lbtlSelectedGridLat.Caption := '-';
        lbtlSelectedGridLong.Caption := '-';

        diffYnm := diffYStop * 60;
        diffXnm := diffXStop * 60;

        lbrbSelectedPosLatt.Caption := '-';
        lbrbSelectedPosLong.Caption := '-';
        lbrbSelectedGridLatt.Caption := '-';
        lbrbSelectedGridLong.Caption := '-';

        {
        lbtlSelectedPosLat.Caption := formatDM_latitude(Game_Centre_Lat - (Game_Y_Dimension / 120));
        lbtlSelectedPosLong.Caption := formatDM_longitude(Game_Centre_Long - (Game_X_Dimension / 120));
        lbtlSelectedGridLat.Caption := FormatFloat('0.00', diffYStart);
        lbtlSelectedGridLong.Caption := FormatFloat('0.00', diffXStart);

        diffYnm := diffYStop * 60;
        diffXnm := diffXStop * 60;

        lbrbSelectedPosLatt.Caption := formatDM_latitude(Game_Centre_Lat + (Game_X_Dimension / 120));
        lbrbSelectedPosLong.Caption := formatDM_longitude(Game_Centre_Long + (Game_X_Dimension / 120));
        lbrbSelectedGridLatt.Caption := FormatFloat('0.00', diffYStop);
        lbrbSelectedGridLong.Caption := FormatFloat('0.00', diffXStop);
        }
      end;
    end;
  end;

  if stateDelete then
  begin
    if isIntersectList(X, Y) then
    begin
      rectSelect := getRectangelChoose(X, Y);

      delete := MessageDlg('Do You Really Want To Delete This Sub-Area',mtConfirmation,
                              [mbYes,mbCancel], 0);
      if delete = mrYes then
      begin
        deleteSelectedSubGameArea(rectSelect);
        rectList.Delete(rectList.IndexOf(rectSelect));
      end;
    end;
    rectSelect := nil;
    Map1.Repaint;
  end;

  if isCapturingScreen then
  with fscrCapture do
  begin
   PDown.X := X;
   PDown.Y := Y;
   PActually.X := X;
   PActually.Y := Y;
   MouseIsDown := TRUE;
   Canvas.DrawFocusRect(Rect(x, y, x, y));
  end;

  gPoint.X := X;
  gPoint.Y := Y;

  Map1.Repaint;

end;

procedure TfCharacteristicLandmass.Map1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
  yCursorPoint, xCursorPoint, yCenter, xCenter, diffX, diffY : double;
begin
    FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);
   //bearing -> diambilkan dari mana? sementara dari distance meter

    //lbcenterx.Caption := FloatToStr(xx);
    //lbcentery.Caption := FloatToStr(yy);
    lBearingFCenter.Caption := FormatFloat('0.00',CalcBearing(Map1.CenterX, MAp1.CenterY, xx, yy));
    lDistanceFCenter.Caption := FormatFloat('0.00', FCoordPlatformConv.Distance_nmi(Map1.CenterX, MAp1.CenterY, xx, yy));

    //lGridLat.Caption := FormatFloat('0.00', yy);
    //lGridLong.Caption := FormatFloat('0.00', xx);

    //lPosLat.Caption := formatDMS_latt(yy);
    //lPosLong.Caption := formatDMS_long(xx);

    //////////////////////////////////////////////////////get grid cursor position
    yCursorPoint := yy;
    xCursorPoint := xx;

    yCenter := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Centre_Lat;
    xCenter := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Centre_Long;

    diffY := abs(yCursorPoint - yCenter);
    diffX := abs(xCursorPoint - xCenter);

    diffYnm := diffY * 60;
    diffXnm := diffX * 60;

    if yCursorPoint < yCenter then addStringY := 'S'
    else addStringY := 'N';

    if xCursorPoint < xCenter then addStringX := 'W'
    else addStringX := 'E';

    lPosLat.Caption := formatDM_latitude(yy);
    lPosLong.Caption := formatDM_longitude(xx);

    gridLatt := FormatFloat('0.00',diffYnm);
    gridLong := FormatFloat('0.00',diffXnm);
    lGridLat.Caption := gridLatt + ' nm ' + addStringY;
    lGridLong.Caption := gridLong + ' nm ' + addStringX;
  if isDown then
  begin
    if stateDrawing then
    begin
      rectangle.Left := xstart;
      rectangle.Top :=  ystart;
      rectangle.Right := X;
      rectangle.Bottom := Y;

//    if ((isIntersectList(X, Y)) or (isRectIntersect(rectangle))) then
      if isRectIntersect(rectangle) or isIntersectList(X, Y) then
      begin
      // nilai posisi rectangle akhir tetap
        X:= xstop;
        Y:= ystop;
        FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);
      end
      else
      begin
       //nilai point rectangle akhir dilanjutkan
        xstop := X;
        ystop := Y;
      end;

      rectangle.Left := xstart;
      rectangle.Top :=  ystart;
      rectangle.Right := xstop;
      rectangle.Bottom := ystop;

      //FCanvas.FrameRect(rectangle);
      Map1.Repaint;
    end;

    if stateMove then
    begin

    end;



  //lPosLat.Caption := floattostr(diffY);
  //lPosLong.Caption := floattostr(diffX);

  end;

  if isCapturingScreen then begin
    gPoint.X := X;
    gPoint.Y := Y;
    if MouseIsDown then  begin
      with fscrCapture do begin

      //UpdateGameCenter(X,Y);
      //mapLandMass.Repaint;

      //Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, PActually.x,PActually.y));
      PActually.X := x;
      PActually.Y := y;
      //Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, x, y));
      end;
    end;
    map1.Repaint;
  end;
end;

procedure TfCharacteristicLandmass.Map1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  xxx: double;
  yyy: double;
  temp: Integer;
begin
  xxx := X;
  yyy := Y;
  //Map1.ConvertCoord(xxx, yyy, xx, yy, miScreenToMap);
  //stateDrawing := false;

  if statePan then
  begin
    statePan := false;
    stateSelect := true;
    stateMove := true;
    Map1.CurrentTool := miPanTool;
    Map1.MousePointer := miCrossCursor;
  end;

  if stateDrawing then
  begin
    //tambah ke list
    rectNewObj := TSubArea_Enviro_Definition.Create;

    if xstart > xstop then
    begin
      temp := xstart;
      xstart := xstop;
      xstop := temp;
    end;

    if ystart > ystop then
    begin
      temp := ystart;
      ystart := ystop;
      ystop := temp;
    end;

    FCoordPlatformConv.ConvertToMap(xstart, ystart, xx, yy);
    FCoordPlatformConv.ConvertToMap(xstop, ystop, xxx, yyy);

    rectangle.Left := xstart;
    rectangle.Top := ystart;
    rectangle.Right := xstop;
    rectangle.Bottom := ystop;

    rectNewObj.FRect := rectangle;

    //
    lbtlSelectedPosLat.Caption := formatDM_latitude(yy);
    lbtlSelectedPosLong.Caption := formatDM_longitude(xx);
    lbtlSelectedGridLat.Caption := FormatFloat('0.00', yy);
    lbtlSelectedGridLong.Caption := FormatFloat('0.00', xx);
    lbrbSelectedPosLatt.Caption := formatDM_latitude(yyy);
    lbrbSelectedPosLong.Caption := formatDM_longitude(xxx);
    lbrbSelectedGridLatt.Caption := FormatFloat('0.00', yyy);
    lbrbSelectedGridLong.Caption := FormatFloat('0.00', xxx);

    with rectNewObj.FData do
      begin
        //Enviro_Index                   := StrToInt(EnvironmentForm.envi_id);
        Enviro_Identifier              := 'Sub-Area ' + IntToStr(rectList.Count+1);
        Game_Enviro_Index              := StrToInt(frmSummaryEnvironment.envi_id);
        X_Position_1                   := xx;
        Y_Position_1                   := yy;
        X_Position_2                   := xxx;
        Y_Position_2                   := yyy;
        Latitude_1                     := yy;
        Longitude_1                    := xx;
        Latitude_2                     := yyy;
        Longitude_2                    := xxx;
      end;

    stateDrawing := false; //set drawing false
    Map1.CurrentTool := miArrowTool;
    rectList.Add(rectNewObj);

    rectSelect := rectNewObj;
    lArea.Caption := rectSelect.FData.Enviro_Identifier;
    insertSubGameArea(rectSelect);

    //perubahan cursor map
    Map1.CurrentTool := miArrowTool;
    rectList.Clear;
    getSubGameArea;

  end;

  if stateMove then
  begin
    if isIntersectList(X, Y) then
    begin
      rectSelect := getRectangelChoose(X, Y);
    end
    else
    begin
      exit;
    end;

    with rectSelect.FRect do
    begin
    {
      //get panjang
      panjang := Right - Left;
      lebar := Bottom - Top;

      Left := floor(xx - (panjang / 2));
      Right := floor(xx + (panjang / 2));
      Top := floor(yy - (lebar / 2));
      Bottom := floor(yy + (lebar / 2));
    }
    end;

  end;

  //drawAllRect;
  isdown := false;
  //Map1.Repaint;

 if isCapturingScreen then
 begin

  with fscrCapture do
  begin

   PActually.X := x;
   PActually.Y := Y;
   MouseIsDown := TRUE;

   TmpBmp := TBitmap.Create;

   with TmpBmp do
   begin
     Width := Round(abs(PActually.x - PDown.x));
     Height := Round(abs(PActually.y - PDown.y));
     BitBlt(TmpBmp.Canvas.Handle, 0, 0, Width, Height, fScrCapture.Image1.Canvas.Handle, map1.Left+ PDown.x,
     PDown.y, SRCCOPY);
     fCaptureRes.imgCaptureResult.AutoSize := false;
     fCaptureRes.imgCaptureResult.Picture.Bitmap.Assign(TmpBmp);
     fCaptureRes.Width := Width+10;
     fCaptureRes.Height := Height+fCaptureRes.panel3.height+10;
     fCaptureRes.ShowModal;

     if  fCaptureRes.recapture then  fCaptureRes.recapture:= false
     else isCapturingScreen := false;
     MouseIsDown :=false;
   end;

  end;

 end;
 gPoint.X := X;
 gPoint.Y := Y;
 map1.Repaint;
end;

procedure TfCharacteristicLandmass.toolbtnDecreaseScaleClick(Sender: TObject);
begin
  if  cbSetScale.ItemIndex > 0 then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex  - 1;
    toolbtnIncreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if cbsetscale.ItemIndex = 0 then
   toolbtnDecreaseScale.Enabled := false
  else
   toolbtnDecreaseScale.Enabled := true;
end;

procedure TfCharacteristicLandmass.toolbtnIncreaseScaleClick(Sender: TObject);
begin
  if  (cbSetScale.ItemIndex<= 500) then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex + 1;
    toolbtnDecreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if (cbSetScale.ItemIndex = 0) then //sampai batas akhir  //10
   toolbtnIncreaseScale.Enabled := true //false
  else
    toolbtnIncreaseScale.Enabled := true;
end;

procedure TfCharacteristicLandmass.ToolButton10Click(Sender: TObject);
begin
  if (EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Centre_Long <> 0) and (EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Centre_Lat <> 0) then
  begin
    Map1.CenterX := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Centre_Long;
    Map1.CenterY := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Centre_Lat;
  end;
end;

procedure TfCharacteristicLandmass.ToolButton13Click(Sender: TObject);
begin
    Map1.CurrentTool := miZoomInTool;
    Map1.MousePointer := miZoomInCursor;
end;

procedure TfCharacteristicLandmass.ToolButton14Click(Sender: TObject);
begin
    statePan := true;
    stateDrawing := false;
    stateDelete := false;
    stateSelect := false;
    Map1.CurrentTool := miArrowTool;
    Map1.MousePointer := miCenterCursor;
end;

procedure TfCharacteristicLandmass.ToolButton1Click(Sender: TObject);
begin
  Map1.CurrentTool := miArrowTool;

{  if isCapturingScreen then
  begin
        stateDrawing := false;
        stateMove := false;
        stateDelete := false;
  end
  else
  begin  }
        stateMove := true;
        stateDrawing := false;
        stateDelete := false;
  //end;
end;

procedure TfCharacteristicLandmass.ToolButton2Click(Sender: TObject);
begin
  //Map1.CurrentTool := miAddPointTool;
  stateDrawing := true;
  stateMove := false;
  stateDelete := false;

end;

procedure TfCharacteristicLandmass.ToolButton6Click(Sender: TObject);
begin
  stateDrawing := false;
  stateMove := false;
  stateDelete := true;
end;

procedure TfCharacteristicLandmass.drawAllRect;
var
  I : Integer;
begin
  for I := 0 to rectList.Count - 1 do
  begin
    FCanvas.FrameRect(TSubArea_Enviro_Definition(rectList[I]).FRect);

  end;
  Map1.Repaint;
end;

procedure TfCharacteristicLandmass.edPredictionRangeKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edPredictionRange.Text := FormatFloat('0.00', StrToFloat(edPredictionRange.Text));
end;


procedure TfCharacteristicLandmass.edPredictionRangeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edPredictionRange.Text = '' then
    Exit;

   if (StrToFloat(edPredictionRange.Text) > 84000)  then
    begin
      ShowMessage('Incorrect value');
      edPredictionRange.Text := '84000';
    //  edPredictionRange.Text := FormatFloat('0.00', StrToFloat(edPredictionRange.Text));
    end;
end;

procedure TfCharacteristicLandmass.edSonarDepthKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edSonarDepth.Text := FormatFloat('0.00', StrToFloat(edSonarDepth.Text));
end;


procedure TfCharacteristicLandmass.edSonarDepthKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edSonarDepth.Text = '' then
    Exit;

   if (StrToFloat(edSonarDepth.Text) > 500000)  then
    begin
      ShowMessage('Incorrect value');
      edSonarDepth.Text := '500000';
    //  edSonarDepth.Text := FormatFloat('0.00', StrToFloat(edSonarDepth.Text));
    end;
end;

procedure TfCharacteristicLandmass.edTargetCrossSectionKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edTargetCrossSection.Text := FormatFloat('0.00', StrToFloat(edTargetCrossSection.Text));
end;

procedure TfCharacteristicLandmass.edTargetCrossSectionKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edTargetCrossSection.Text = '' then
    Exit;

   if (StrToFloat(edTargetCrossSection.Text) > 89500)  then
    begin
      ShowMessage('Incorrect value');
      edTargetCrossSection.Text := '89500';
    //  edTargetCrossSection.Text := FormatFloat('0.00', StrToFloat(edTargetCrossSection.Text));
    end;
end;

procedure TfCharacteristicLandmass.edTargetDepthKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edTargetDepth.Text := FormatFloat('0.00', StrToFloat(edTargetDepth.Text));
end;

procedure TfCharacteristicLandmass.edTargetDepthKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edTargetDepth.Text = '' then
    Exit;

   if (StrToFloat(edTargetDepth.Text) > 900000)  then
    begin
      ShowMessage('Incorrect value');
      edTargetDepth.Text := '900000';
    //  edTargetDepth.Text := FormatFloat('0.00', StrToFloat(edTargetDepth.Text));
    end;
end;

procedure TfCharacteristicLandmass.edTargetSourceLevelKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edTargetSourceLevel.Text := FormatFloat('0.00', StrToFloat(edTargetSourceLevel.Text));
end;

procedure TfCharacteristicLandmass.edTargetSourceLevelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edTargetSourceLevel.Text = '' then
    Exit;

   if (StrToFloat(edTargetSourceLevel.Text) > 50000)  then
    begin
      ShowMessage('Incorrect value');
      edTargetSourceLevel.Text := '50000';
    //  edTargetSourceLevel.Text := FormatFloat('0.00', StrToFloat(edTargetSourceLevel.Text));
    end;
end;

function TfCharacteristicLandmass.getRectangelChoose(const X, Y: Integer): TSubArea_Enviro_Definition;
var
  I : Integer;
  pt : TPoint;
begin
  Result := nil;
  pt.X := X;
  pt.Y := Y;
  for I := 0 to rectList.Count - 1 do
  begin
    with TSubArea_Enviro_Definition(rectList[I]) do
    begin
      if PtInRect(FRect, pt) then
      begin
        Result := rectList[I];
      end;
    end;
  end;

end;

function TfCharacteristicLandmass.isIntersectList(const X, Y: Integer): boolean;
var
  I: Integer;
  pt : TPoint;
begin
  pt.X := X;
  pt.Y := Y;

  for I := 0 to rectList.Count - 1 do
  begin
    with TSubArea_Enviro_Definition(rectList[I]) do
    begin
      if PtInRect(FRect, pt) then
      begin
        Result := true;
        Exit;
      end;

    end;
  end;

  Result := false;
end;

procedure TfCharacteristicLandmass.getSubGameArea;
begin
  rectList.Clear;
  if not ExerciseAreaForm.isNew then
  begin
    dmTTT.GetSubArea_Enviro_Definition(StrToInt(frmSummaryEnvironment.envi_id), rectList);
  end;
end;

procedure TfCharacteristicLandmass.insertSubgameArea(var sub_Area: TSubArea_Enviro_Definition);
begin
  //test:=EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Area_Index;
  with sub_Area.FData do
  begin
    Wind_Speed                     := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Wind_Speed;
    Wind_Direction                 := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Wind_Direction;
    Daytime_Visual_Modifier        := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Daytime_Visual_Modifier;
    Nighttime_Visual_Modifier      := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Nighttime_Visual_Modifier;
    Daytime_Infrared_Modifier      := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Daytime_Infrared_Modifier;
    Nighttime_Infrared_Modifier    := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Nighttime_Infrared_Modifier;
    Rain_Rate                      := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Rain_Rate;
    Cloud_Base_Height              := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Cloud_Base_Height;
    Cloud_Attenuation              := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Cloud_Attenuation;
    Sea_State                      := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Sea_State;
    Ocean_Current_Speed            := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Ocean_Current_Speed;
    Ocean_Current_Direction        := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Ocean_Current_Direction;
    Thermal_Layer_Depth            := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Thermal_Layer_Depth;
    Sound_Velocity_Type            := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Sound_Velocity_Type;
    Surface_Sound_Speed            := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Surface_Sound_Speed;
    Layer_Sound_Speed              := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Layer_Sound_Speed;
    Bottom_Sound_Speed             := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Bottom_Sound_Speed;
    Bottomloss_Coefficient         := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Bottomloss_Coefficient;
    Ave_Ocean_Depth                := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Ave_Ocean_Depth;
    CZ_Active                      := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.CZ_Active;
    Surface_Ducting_Active         := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Surface_Ducting_Active;
    Upper_Limit_Sur_Duct_Depth     := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Upper_Limit_Surface_Duct_Depth;
    Lower_Limit_Sur_Duct_Depth     := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Lower_Limit_Surface_Duct_Depth;
    Sub_Ducting_Active             := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Sub_Ducting_Active;
    Upper_Limit_Sub_Duct_Depth     := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Upper_Limit_Sub_Duct_Depth;
    Lower_Limit_Sub_Duct_Depth     := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Lower_Limit_Sub_Duct_Depth;
    Shipping_Rate                  := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Shipping_Rate;
    Shadow_Zone_Trans_Loss         := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Shadow_Zone_Trans_Loss;
    Atmospheric_Refract_Modifier   := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Atmospheric_Refract_Modifier;
    Barometric_Pressure            := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Barometric_Pressure;
    Air_Temperature                := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Air_Temperature;
    Surface_Temperature            := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Surface_Temperature;
    HF_Black_Hole                  := 1;
  end;

  dmTTT.InsertSubArea_Enviro_Definition(sub_Area);
end;

procedure TfCharacteristicLandmass.updateSubGameArea(id: Integer; var sub_Area: TSubArea_Enviro_Definition);
begin
  dmTTT.UpdateSubArea_Enviro_Definition(IntToStr(id), sub_Area);
end;

procedure TfCharacteristicLandmass.deleteSelectedSubGameArea(var sub_Area: TSubArea_Enviro_Definition);
begin
  dmTTT.DeleteSubArea_Enviro_Definition(sub_Area.FData.Enviro_Index, sub_Area.FData.Game_Enviro_Index);
end;

procedure TfCharacteristicLandmass.updateAll;
var
  I: Integer;
  sub_AreaTemp: TSubArea_Enviro_Definition;
begin
  //update sub-area
  for I := 0 to rectList.Count - 1 do
  begin
    sub_AreaTemp := TSubArea_Enviro_Definition.Create;
    sub_AreaTemp := TSubArea_Enviro_Definition(rectList[I]);
    updateSubGameArea(TSubArea_Enviro_Definition(rectList[I]).FData.Enviro_Index, sub_AreaTemp);
  end;

  //update game enviro
  dmTTT.updateGame_Environment_Def(EnvironmentCharacteristicsWindowForm.GameEnviroDef, IntToStr(EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Enviro_Index));
end;

function TfCharacteristicLandmass.isRectIntersect(rec: TRect): boolean;
var I : Integer;
  resultRect : TRect;
begin
  Result := false;
  for I := 0 to rectList.Count - 1 do
  begin
     if IntersectRect(resultRect, rec, TSubArea_Enviro_Definition(rectList[I]).FRect) then
     begin
       Result := true;
       Exit;
     end;
  end;
end;

procedure TfCharacteristicLandmass.LoadENC(ENCGeoset : string);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if Map1 = nil then
    Exit;
  InitOleVariant(z);
  Map1.Layers.RemoveAll;

  Map1.Geoset := ENCGeoset;

  if ENCGeoset <> '' then
  begin
    for i := 1 to Map1.Layers.Count do
    begin
      Map1.Layers.Item(i).Selectable := false;
      Map1.Layers.Item(i).Editable  := False;
//      FMap.Layers.Item(i).AutoLabel := True;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := Map1.Layers.Add(mInfo, 1);

    Map1.Layers.AnimationLayer := FLyrDraw;
    Map1.MapUnit := miUnitNauticalMile;
  end;
  Map1.BackColor := RGB(192, 224, 255);
end;


procedure TfCharacteristicLandmass.createGeoset;
var
    aGeoset : string;
begin
    getNameArea := ufrmSummaryEnvironment.frmSummaryEnvironment.edtArea.Text;
    //aGeoset := ExtractFilePath(Application.ExeName) + 'game_area\part1.gst';
    //aGeoset := ExtractFilePath(Application.ExeName) + 'game_area\'+getNameArea+'\'+getNameArea+'.gst';
    //aGeoset := 'M:\game_area\'+getNameArea+'\'+getNameArea+'.gst';
    aGeoset := vAppDBSetting.MapDestPathVECT + '\' +getNameArea+'\'+getNameArea+'.gst';
    LoadMap(aGeoset);
//    frmAvailableGameArea.flagIsNew := false;
end;

procedure TfCharacteristicLandmass.LoadMap(aGeoset: String);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if Map1 = nil then
    Exit;
  InitOleVariant(z);
  Map1.Layers.RemoveAll;

  Map1.Geoset := aGeoset;

  if aGeoset <> '' then
  begin
    for i := 1 to Map1.Layers.Count do
    begin
      Map1.Layers.Item(i).Selectable := false;
      Map1.Layers.Item(i).Editable  := False;
//      FMap.Layers.Item(i).AutoLabel := True;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := Map1.Layers.Add(mInfo, 1);

    Map1.Layers.AnimationLayer := FLyrDraw;
    Map1.MapUnit := miUnitNauticalMile;
  end;
  //FMap.BackColor := RGB(192, 224, 255);
  Map1.BackColor := clSkyBlue;
end;


function TfCharacteristicLandmass.GetIndexLong(const x: integer): string;
var i: integer;
begin
  i := EnsureRange(x, 1, 36);
  Result := Format('%2d', [i]);
end;

function TfCharacteristicLandmass.GetIndexLat(const y: integer): string;
var i: integer;
begin
  i := EnsureRange(y, 0, 17);
  Result := Char(Ord('A') + y)
end;

end.

