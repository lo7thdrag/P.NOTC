unit uDBAsset_GameEnvironment;

interface

uses

 tttData,Classes,math, uCalculationEnvi,  uDBAssets_SubAreaEnviroDefinition,
  uDBAssetObject, uCoordConvertor;

type

  TGame_Environment_Definition = class(TEnvi)
  private
    FCOnverter: TCoordConverter;
    max_power_scale_area : integer;

    procedure SetCOnverter(const Value: TCoordConverter);
  public
    FData         : TRecGame_Environment_Definition;
    FGameArea     : TRecGame_Area_Definition;
    FGlobal_Conv  : TRecGlobal_Convergence_Zone ;

    CalculateEnvi : CalculationEnvironment;

    FOverlay      : TList;
    FSubArea      : TList; //of TSubArea_Enviro_Definition  //tambahan aldy

    constructor Create;
    destructor Destroy;override;

    procedure calculateMaxPowerScaleArea;
    procedure getVisual(var daytime: Double; var nighttime: Double;
              var sunrise: Double; var sunset: Double);
    procedure getCalc_EnviEffect(TrackDomain: Integer; ship_course: Double;
              ship_speed: Double; temp : Boolean; var Course: Double; var Speed: Double);

    function getMaxPOwerScaleArea:integer;
    function checkSubArea(Longitude : Double; Latitude: Double): TSubArea_Enviro_Definition;
    function get_DX(TrackDomain: Integer; deltaT: double): Double;
    function get_DY(TrackDomain: Integer; deltaT: double): Double;
    //    function get_DZ(deltaT: double): Double;
    function  convertSpeed(Value : Double): Double;
    function msToKnots(Value : Double): Double;

    property COnverter : TCoordConverter read FCOnverter write SetCOnverter;
  end;

  TOverlay_Definition = class
  public
    FData : TRecOverlay_Definition;
  end;

  TShape_Definition = class
  public
    FData : TRec_OverlayShape;
  end;

implementation
uses Windows;

const
   c_msToKnots = 1.942615;

{ TGame_Environment_Definition }

constructor TGame_Environment_Definition.Create;
begin
   FOverlay      := TList.Create;
   FSubArea      := TList.Create;
   CalculateEnvi := CalculationEnvironment.Create;
end;

destructor TGame_Environment_Definition.Destroy;
begin
  FOverlay.Free;
  CalculateEnvi.Free;
  inherited;
end;

procedure TGame_Environment_Definition.calculateMaxPowerScaleArea;
var area_length:extended;
    power:integer;
begin
 power := 10;
 area_length := FGameArea.Game_X_Dimension; //ambil x dan y sama saja
 if area_length<>0 then
  power := trunc(log2(area_length))+1;

 max_power_scale_area := power;

end;

function TGame_Environment_Definition.getMaxPOwerScaleArea;
begin
 result := max_power_scale_area;
end;

function  TGame_Environment_Definition.checkSubArea(Longitude : Double; Latitude: Double): TSubArea_Enviro_Definition;
var
  I: Integer;
  pt : TPoint;
  point_X, point_Y  : Integer;
  tempSubArea : TSubArea_Enviro_Definition;
begin
   Result := nil;
   if FSubArea.Count < 1 then
      Exit;

   Converter.ConvertToScreen(Longitude, Latitude, point_X, point_Y);
   pt.X := point_X;
   pt.Y := point_Y;
   for I := 0 to FSubArea.Count - 1 do
   begin
       tempSubArea := FSubarea.Items[I];
       if PtInRect(tempSubArea.FRect, pt) then
       begin
         Result := tempSubArea;
         Break;
       end;
   end;
end;

procedure TGame_Environment_Definition.getVisual(var daytime: Double; var nighttime: Double;
var sunrise: Double; var sunset: Double);
begin
   daytime   := FData.Daytime_Visual_Modifier;
   nighttime := FData.Nighttime_Visual_Modifier;
   sunrise   := FData.Sunrise;
   sunset    := FData.Sunset;
end;

procedure TGame_Environment_Definition.getCalc_EnviEffect(TrackDomain: Integer; ship_course: Double; ship_speed: Double;
temp: Boolean; var Course: Double; var Speed: Double);
var
   envSpeed, envCourse : double;
begin
  case TrackDomain of
    vhdAir:
    begin
      if temp then
      begin
        envSpeed  := 0;
        envCourse := 0;
      end
      else
      begin
        envSpeed  := FData.Wind_Speed;
        envCourse := FData.Wind_Direction;
      end;

      CalculateEnvi.getCurrent_EnviEffect(ship_course, envCourse, ship_speed, envSpeed, Course, Speed);
    end;
    vhdSurface, vhdSubsurface:
    begin
      envSpeed  := FData.Ocean_Current_Speed;
      envCourse := FData.Ocean_Current_Direction;

      CalculateEnvi.getCurrent_EnviEffect(ship_course, envCourse, ship_speed, envSpeed, Course, Speed);
    end;
    vhdLand:
    begin
      envSpeed  := 0;
      envCourse := 0;
//      if temp then
//      begin
//        envSpeed  := 0;
//        envCourse := 0;
//      end
//      else
//      begin
//        envSpeed  := FData.Wind_Speed;
//        envCourse := FData.Wind_Direction;
//      end;

      CalculateEnvi.getCurrent_EnviEffect(ship_course, envCourse, ship_speed, envSpeed, Course, Speed);
    end;
    vhdAmphibious :
    begin
      if temp then
      begin
        envSpeed  := 0;
        envCourse := 0;
      end
      else
      begin
        envSpeed  := FData.Ocean_Current_Speed;
        envCourse := FData.Ocean_Current_Direction;
      end;

      CalculateEnvi.getCurrent_EnviEffect(ship_course, envCourse, ship_speed, envSpeed, Course, Speed);
    end;
  end;
end;

function TGame_Environment_Definition.get_DX(TrackDomain: Integer; deltaT: double): Double;
var
   temp : double;
begin
   Result := 0;
   if TrackDomain = 0 then                             // domain = air
     if FData.Wind_Speed <> 0 then
     begin
       temp   := convertSpeed(FData.Wind_Speed);
       Result := temp*cos(DegToRad(90-FData.Wind_Direction))*deltaT;
     end;

   if (TrackDomain = 1) OR (TrackDomain = 2) then      // domain surface / subsurface
     if FData.Ocean_Current_Speed <> 0 then
     begin
       temp   := convertSpeed(FData.Ocean_Current_Speed);
       Result := temp*cos(DegToRad(90-FData.Ocean_Current_Direction))*deltaT;
     end;

   if TrackDomain = 3 then                             // domain land
      Result := 0;

   //cek disini
   if TrackDomain = 7 then                             // domain personel
      Result := temp*cos(DegToRad(90-0))*deltaT;
end;

function TGame_Environment_Definition.get_DY(TrackDomain: Integer; deltaT: double): Double;
var
   temp : double;
begin
   Result := 0;
   if TrackDomain = 0 then                            // domain = air
     if FData.Wind_Speed <> 0 then
     begin
       temp   := convertSpeed(FData.Wind_Speed);
       Result := temp*sin(DegToRad(90-FData.Wind_Direction))*deltaT;
     end;

   if (TrackDomain = 1) OR (TrackDomain = 2) then    // domain surface / subsurface
     if FData.Ocean_Current_Speed <> 0 then
     begin
       temp   := convertSpeed(FData.Ocean_Current_Speed);
       Result := temp*sin(DegToRad(90-FData.Ocean_Current_Direction))*deltaT;
     end;

   if TrackDomain = 3 then                          // domain land
      Result := 0;

   //cek disini
   if TrackDomain = 7 then                             // domain Personal group
      Result := temp*sin(DegToRad(90-0))*deltaT;
end;

//function TGame_Environment_Definition.get_DZ(deltaT: Double): Double;
//var
//   temp, tempInKnots : double;
//begin
//   tempInKnots := msToKnots(FData.Wind_Speed);
//   temp        := convertSpeed(tempInKnots);
//   Result      := temp*sin(DegToRad(90-tempInKnots))*deltaT;
//end;

function  TGame_Environment_Definition.convertSpeed(Value : Double): Double;
begin
  Result := (1.0 / 60.0) * Value * (1 / 3600.0);
end;

function TGame_Environment_Definition.msToKnots(value : Double): Double;
begin
  Result := c_msToKnots * Value;
end;

procedure TGame_Environment_Definition.SetCOnverter(
  const Value: TCoordConverter);
begin
  FCOnverter := Value;
end;

end.
