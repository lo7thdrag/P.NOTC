unit uFormula;

interface
uses MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
     math, uMapXHandler, uCoordConvertor, uBaseCoordSystem;

  type

  TFormula = class
  public
    FCoordPlatformConv : TCoordConverter;

    function getXFromAngle (centLong: Double; sdt: Integer; radius: Double) : Double;
    function getYFromAngle (centLatt: Double; sdt: Integer; radius: Double) : Double;

    function getSectorLong (centLong: Double; sdt: Integer; radius: Double) : Double;
    function getSectorLatt (centLatt: Double; sdt: Integer; radius: Double) : Double;

    function getBearing (X : Single; Y : Single; Map1 : TMap) : String;
    function getDistance(X : Single; Y : Single; Map1 : TMap) : String;

    { function for check position }
    function assignRect(x1: Single; y1: Single): TRect;
    function checkText (x1: Single; y1: Single): TRect;
    function checkXYPosition(x1 : single; y1 : single; x2 : single; y2 : single): TRect;
  end;

implementation

function TFormula.getXFromAngle(CentLong :Double; sdt: Integer; radius: Double) : Double;
begin
  if {(sdt = 360) or }(sdt > 0) and (sdt < 90) then
  begin
    Result := centLong + (cos(DegToRad(90-sdt))*radius);
    if Result > 180 then
    begin
       Result := (Result-180) - 180;
    end;
  end
  else if (sdt > 90) and (sdt < 180) then
  begin
    Result := centLong + (cos(DegToRad(90-sdt))*radius);
    if Result > 180 then
    begin
       Result := (Result-180) - 180;
    end;
  end
  else if (sdt > 180) and (sdt < 270) then
  begin
    Result := centLong - (cos(DegToRad(90-sdt))*radius);
  end
  else if (sdt > 270) and (sdt < 360) then
  begin
    Result := centLong - (cos(DegToRad(90-sdt))*radius);
  end;

    //Result := centLong + (cos(DegToRad(90-sdt))*radius);
end;

function TFormula.getYFromAngle(Centlatt : Double; sdt: Integer; radius: Double) : Double;
begin
  if {(sdt = 360) or} (sdt = 0) and (sdt < 90) then
  begin
    Result := Centlatt + (sin(DegToRad(90-sdt))*radius);
  end
  else if (sdt > 90) and (sdt < 180) then
  begin
    Result := Centlatt - (sin(DegToRad(90-sdt))*radius);
  end
  else if (sdt > 180) and (sdt < 270) then
  begin
    Result := Centlatt - (sin(DegToRad(90-sdt))*radius);
  end
  else if (sdt > 270) and (sdt < 360) then
  begin
    Result := Centlatt + (sin(DegToRad(90-sdt))*radius);
  end;

    //Result := Centlatt - (sin(DegToRad(90-sdt))*radius);
end;

function TFormula.getSectorLong(CentLong :Double; sdt: Integer; radius: Double) : Double;
begin
  //Result := {centLong + }(cos(DegToRad(90-sdt))*radius);
  Result := centLong + (cos(DegToRad(90-sdt))*radius);
end;

function TFormula.getSectorLatt(Centlatt : Double; sdt: Integer; radius: Double) : Double;
begin
  //Result := {Centlatt - }(sin(DegToRad(90-sdt))*radius);
  Result := centLatt - (sin(DegToRad(90-sdt))*radius);
end;

function TFormula.getBearing(X : Single; Y : Single; Map1 : TMap) : String;
var
    cursorLong, cursorLat, centerLong, centerLat  : double;
    //oriX, oriY : single;
begin
    Map1.ConvertCoord(X, Y,  cursorLong, cursorLat, miScreenToMap);
    //Map1.Convertcoord(oriX, oriY, centerLong, centerLat, miScreenToMap);

    Result  := FormatFloat('0.00', CalcBearing(Map1.CenterX, MAp1.CenterY, cursorLong, cursorLat));
end;

function TFormula.getDistance(X : Single; Y : Single; Map1 : TMap) : String;
var
    cursorLong, cursorLat, centerLong, centerLat  : double;
    //oriX, oriY : single;
begin
    Map1.ConvertCoord(X, Y,  cursorLong, cursorLat, miScreenToMap);
    //Map1.Convertcoord(oriX, oriY, centerLong, centerLat, miScreenToMap);

    Result := FormatFloat('0.00', FCoordPlatformConv.Distance_nmi(Map1.CenterX, MAp1.CenterY, cursorLong, cursorLat));
end;

function TFormula.checkXYPosition(x1 : single; y1 : single; x2 : single; y2 : single): TRect;
var
  temp : single;
  rect : TRect;
begin
  if round(x2) >= round(x1) then                                   //kuadran 4
  begin
     if round(y2) >= round(y1) then
     begin        end
     else if round(y2) <= round(y1) then                           //kuadran 1
     begin
        temp := y1;
        y1   := y2;
        y2   := temp;
     end;
  end;
  if round(x2) <= round(x1) then
  begin
     if round(y2) >= round(y1) then                                //kuadran 3
     begin
        temp := x1;
        x1   := x2;
        x2   := temp;
     end
     else if round(y2) <= round(y1) then                           //kuadran 2
     begin
        temp := y1;
        y1   := y2;
        y2   := temp;

        temp := x1;
        x1   := x2;
        x2   := temp;
     end;
  end;
  rect.Left   := Round(x1);      rect.Top    := Round(y1);
  rect.Right  := Round(x2);      rect.Bottom := Round(y2);
  result      := rect;
end;

function TFormula.assignRect(x1: Single; y1: Single): TRect;
const
  RANGE       = 5;
var
  rect        :  TRect;
begin
  rect.Left   := Round(x1) - RANGE;
  rect.Top    := Round(y1) - RANGE;
  rect.Right  := Round(x1) + RANGE;
  rect.Bottom := Round(y1) + RANGE;
  result      := rect;
end;

function TFormula.checkText(x1: Single; y1: Single): TRect;
const
  RANGE       = 25;
var
  rect        :  TRect;
begin
  rect.Left   := Round(x1);
  rect.Top    := Round(y1);
  rect.Right  := Round(x1) + RANGE;
  rect.Bottom := Round(y1) + RANGE;
  result      := rect;
end;

end.
