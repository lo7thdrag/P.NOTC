unit uT3Common;

interface

uses Graphics, tttData, uDataModuleTTT, uDataTypes, uBaseCoordSystem;

  //symbol untuk tampilan di controller
  function getCorrectSymbol(const domain: Integer; const platform_type: Integer; const force: Integer; var color: TColor): string;

  function getPlatformTypeSymbolFileName(const aPlatformType: integer): string;

  // symbol untuk tampilan di cubicle;
  function getColorFromIdentity(const aIdent: integer): TColor;
  function getIdentStr(val : integer): string;
  function getDetectedSymbolFileName(const aDomain, aIdent: integer): string;
  //function getPendingSymbol(const platform_type: integer): string;

  function getDomain(val : integer): string;
  function getIdentifier(Index : integer; IdClass : TClass) : string;
  function getTrackTypeStr(val: integer): string;

  procedure CalcHitPredition(
     const tRange, tBearing, tSpeed, tCourse: double;
     const pSpeed: double;
     var hRange, hBearing, hTime, hSpeed: double);

  procedure CalcHitPredictionWithWaypoint(
    const tSpeed, tCourse, tLengthWaypoint: Double;
    const tPositionX, tPositionY : Double;
    const pSpeed: Double;
    var fPositionX, fPositionY : Double);

  procedure CalcBOLRangeDestruck(
    const tBearing : Double;
    const tSeekerOnRange : Double;
    const tShipPositionX, tShiposiotionY : Double;
    const tRangeBOL, tDegreeBOL, tDistanceBOL, tStartBOL_X, tStartBOL_Y : Double;
    var fPointBOL1, fPointBOL2, fPointBOL3, fPointBOL4, fPointEndBol, fPointStartBol : t2DPoint);

  function PointInPoligon_Double(
    const tPoint1_X, tPoint1_Y, tPoint2_X, tPoint2_Y : Double;
    const tPoint3_X, tPoint3_Y, tPoint4_X, tPoint4_Y : Double;
    const tTargetPoint_X, tTargetPoint_Y : double): Boolean;

  function PointInPoligonLangLot(tPoint : t2DPoint; tPointPol1, tPointPol2, tPointPol3, tPointPol4 : t2DPoint): Boolean;

  function CheckInBearingCourseBOL(ptFrom, Pt : t2DPoint; Length, Bearing : Double): Boolean;

  function CheckQuadran(aX, aY : Double): Byte;  overload;
  function CheckQuadran(X1, X2, Y1, Y2 : Double): Byte; overload;

  function InsideAngleOfView(aCourse, aViewAngle, aBearing : double):boolean;

  function TimeStringToSecond(const ts:string):integer;
  function SecondToTimeString(Sec: Integer): string;




implementation

uses uDBAsset_Vehicle, Math, Classes, SysUtils, Windows;

// 00:00:00 --> second
function TimeStringToSecond(const ts:string):integer;
var
  l : TStrings;
  h,m,s: integer;
begin
  Result := 0;
  l := TStringList.Create;
  l.Delimiter     := ':';
  l.DelimitedText := ts;

  if l.Count <> 3 then exit;

  h := 0;m := 0;s := 0;

  TryStrToInt(trim(l[0]),h);
  TryStrToInt(trim(l[1]),m);
  TryStrToInt(trim(l[2]),s);

  result := (h  * 3600) + (m * 60) + s;

end;

function SecondToTimeString(Sec: Integer): string;
var
   H, M, S: string;
   ZH, ZM, ZS: Integer;
begin
   ZH := Sec div 3600;
   ZM := Sec div 60 - ZH * 60;
   ZS := Sec - (ZH * 3600 + ZM * 60) ;
   H := IntToStr(ZH) ;
   M := IntToStr(ZM) ;
   S := IntToStr(ZS) ;

   if Length(H) <= 1 then H := '0' + H;
   if Length(M) <= 1 then M := '0' + M;
   if Length(S) <= 1 then S := '0' + S;

   Result := H + ':' + M + ':' + S;
end;

function InsideAngleOfView(aCourse, aViewAngle, aBearing : double):boolean;
var
  minAngle, maxAngle : double;
  isInside : boolean;
begin
  minAngle := aCourse - (aViewAngle / 2);
  maxAngle := aCourse + (aViewAngle / 2);

  if minAngle < 0 then
    isInside := (360 + minAngle) <= aBearing
  else begin
    isInside := (minAngle <= aBearing) and (aBearing <= maxAngle);
  end;

  result := isInside;
end;

function CheckQuadran(aX, aY : Double): Byte;  overload;
begin
  Result:= 1;
  if (aX<0) and (aY>0) then
    Result:= 2
  else if (aX<0) and (aY<0) then
    Result:= 3
  else if (aX>0) and (aY<0) then
    Result:= 4
end;

function CheckQuadran(X1, X2, Y1, Y2 : Double): Byte; overload;
var
  ConstMZero : Double;
begin
  Result := 0;
  ConstMZero := -0.001;

  if (X2 <> X1) and (Y2 <> Y1) then
  begin
    Result :=  CheckQuadran((X2 - X1), ((Y2 - Y1)));
  end
  else
  if (X2 = X1) then
  begin
    Result :=  CheckQuadran(ConstMZero, ((Y2 - Y1)))
  end
  else
  if (Y2 = Y1) then
  begin
    Result := CheckQuadran((X2 - X1), ConstMZero)
  end;
end;

function PointInPoligon_Double(
    const tPoint1_X, tPoint1_Y, tPoint2_X, tPoint2_Y : Double;
    const tPoint3_X, tPoint3_Y, tPoint4_X, tPoint4_Y : Double;
    const tTargetPoint_X, tTargetPoint_Y : double): Boolean;
begin
   Result := True;
end;

function PointInPoligonLangLot(tPoint : t2DPoint; tPointPol1, tPointPol2, tPointPol3, tPointPol4 : t2DPoint): Boolean;
var
  i,j : integer;
  Poligon : array[0..3] of t2DPoint;

  npol : integer;
begin
  result := false;

  Poligon[0] := tPointPol1;
  Poligon[1] := tPointPol2;
  Poligon[2] := tPointPol3;
  Poligon[3] := tPointPol4;

  npol := length(Poligon);
  for i := 0 to npol - 1 do begin
    j := (i + 1) mod npol;
    if ((((Poligon[i].Y <= tPoint.Y) and (tPoint.Y < Poligon[j].Y)) or
         ((Poligon[j].Y <= tPoint.Y) and (tPoint.Y < Poligon[i].Y))) and
        (tPoint.X < (Poligon[j].X - Poligon[i].X) * (tPoint.Y - Poligon[i].Y) /
                    (Poligon[j].Y - Poligon[i].Y) + Poligon[i].X)) then
      Result := not Result;
  end;
end;

function CheckInBearingCourseBOL(ptFrom, Pt : t2DPoint; Length, Bearing : Double): Boolean;
var
  ptToTarget   : t2DPoint;
begin
  RangeBearingToCoord(Length, Bearing, ptToTarget.X, ptToTarget.Y);
  ptToTarget.X := ptToTarget.X + ptFrom.X;
  ptToTarget.Y := ptToTarget.Y + ptFrom.Y;

  if ptToLineDistance(ptFrom, ptToTarget, Pt) < 3 then
    Result := True
  else
    Result := False;
end;

procedure CalcBOLRangeDestruck(
    const tBearing : Double;
    const tSeekerOnRange : Double;
    const tShipPositionX, tShiposiotionY : Double;
    const tRangeBOL, tDegreeBOL, tDistanceBOL, tStartBOL_X, tStartBOL_Y : Double;
    var fPointBOL1, fPointBOL2, fPointBOL3, fPointBOL4, fPointEndBol, fPointStartBol : t2DPoint);
var
  DistanceBOL : Double;
  DistanceAchieved : Double;
  DistanceStarBOLToSeeker : Double;

  EndBOL_X, EndBOL_Y : Double;
  StartSeekerX, StartSeekerY : Double;

  //Bolw Range Refrence
  ReferenceDistanceBOL : Double;
  DegreeP1, DegreeP2, DegreeP3, DegreeP4 : Double;
  DegreeToP1, DegreeToP2, DegreeToP3, DegreeToP4 : Double;
  DistanceToP1, DistanceToP2, DistanceToP3, DistanceToP4 : Double;
begin
  //BOL have 4 Point of Destruck (P1, P2, P3, P4) -> Poligon;

  DistanceAchieved := CalcRange(tShipPositionX, tShiposiotionY, tStartBOL_X, tStartBOL_Y);
  DistanceBOL      := tRangeBOL - DistanceAchieved;

  RangeBearingToCoord(DistanceBOL, tBearing, EndBOL_X, EndBOL_Y);
  EndBOL_X := EndBOL_X + tStartBOL_X;
  EndBOL_Y := EndBOL_Y + tStartBOL_Y;

  fPointEndBol.X := EndBOL_X;
  fPointEndBol.Y := EndBOL_Y;

  //DistanceStarBOLToSeeker := 0.1 * DistanceBOL;
  if DistanceAchieved > 0 then
  begin
     if DistanceAchieved >= tSeekerOnRange then
       DistanceStarBOLToSeeker := 1
     else
       DistanceStarBOLToSeeker := tSeekerOnRange - DistanceAchieved + 1;
  end
  else
    DistanceStarBOLToSeeker := tSeekerOnRange;

  RangeBearingToCoord(DistanceStarBOLToSeeker, tBearing, fPointStartBol.X , fPointStartBol.Y);
  fPointStartBol.X := tStartBOL_X + fPointStartBol.X;
  fPointStartBol.Y := tStartBOL_Y + fPointStartBol.Y;

  if (tDegreeBOL <> 0) and (tDistanceBOL = 0) then  //Bolw Reference Degree
  begin
    //Calc P1 in BOl
    DegreeToP1   := tBearing - tDegreeBOL;
    DistanceToP1 := DistanceStarBOLToSeeker/Cos(DegToRad(tDegreeBOL));

    RangeBearingToCoord(DistanceToP1, DegreeToP1, fPointBOL1.X, fPointBOL1.Y);
    fPointBOL1.X := tStartBOL_X + fPointBOL1.X;
    fPointBOL1.Y := tStartBOL_Y + fPointBOL1.Y;

    //Calc P2 in BOl
    DegreeToP2   := tBearing + tDegreeBOL;
    DistanceToP2 := DistanceStarBOLToSeeker/Cos(DegToRad(tDegreeBOL));

    RangeBearingToCoord(DistanceToP2, DegreeToP2, fPointBOL2.X, fPointBOL2.Y);
    fPointBOL2.X := tStartBOL_X + fPointBOL2.X;
    fPointBOL2.Y := tStartBOL_Y + fPointBOL2.Y;

    //Calc P3 in BOl
    ReferenceDistanceBOL := Tan(DegToRad(tDegreeBOL))*DistanceStarBOLToSeeker;
    DegreeP3     := RadToDeg(ArcTan(ReferenceDistanceBOL/DistanceBOL));
    DegreeToP3   := tBearing - DegreeP3;
    DistanceToP3 := ReferenceDistanceBOL/sin(DegToRad(DegreeP3));

    RangeBearingToCoord(DistanceToP3, DegreeToP3, fPointBOL3.X, fPointBOL3.Y);
    fPointBOL3.X := tStartBOL_X + fPointBOL3.X;
    fPointBOL3.Y := tStartBOL_Y + fPointBOL3.Y;

    //Calc P4 in BOL
    ReferenceDistanceBOL := Tan(DegToRad(tDegreeBOL))*DistanceStarBOLToSeeker;
    DegreeP4     := RadToDeg(ArcTan(ReferenceDistanceBOL/DistanceBOL));
    DegreeToP4   := tBearing + DegreeP4;
    DistanceToP4 := ReferenceDistanceBOL/sin(DegToRad(DegreeP4));

    RangeBearingToCoord(DistanceToP4, DegreeToP4, fPointBOL4.X, fPointBOL4.Y);
    fPointBOL4.X := tStartBOL_X + fPointBOL4.X;
    fPointBOL4.Y := tStartBOL_Y + fPointBOL4.Y;
  end
  else
  if (tDistanceBOL <> 0) and (tDegreeBOL = 0) then  //Bolw Reference Range
  begin
    //Calc P1 in BOL
    DegreeP1     := RadToDeg(ArcTan(tDistanceBOL/DistanceStarBOLToSeeker));
    DegreeToP1   := tBearing - DegreeP1;
    DistanceToP1 := tDistanceBOL/sin(DegToRad(DegreeP1));

    RangeBearingToCoord(DistanceToP1, DegreeToP1, fPointBOL1.X, fPointBOL1.Y);
    fPointBOL1.X := tStartBOL_X + fPointBOL1.X;
    fPointBOL1.Y := tStartBOL_Y + fPointBOL1.Y;

    //Calc P2 in BOL
    DegreeP2     := RadToDeg(ArcTan(tDistanceBOL/DistanceStarBOLToSeeker));
    DegreeToP2   := tBearing + DegreeP2;
    DistanceToP2 := tDistanceBOL/sin(DegToRad(DegreeP2));

    RangeBearingToCoord(DistanceToP2, DegreeToP2, fPointBOL2.X, fPointBOL2.Y);
    fPointBOL2.X := tStartBOL_X + fPointBOL2.X;
    fPointBOL2.Y := tStartBOL_Y + fPointBOL2.Y;

    //Calc P3 in BOL
    DegreeP3     := RadToDeg(ArcTan(tDistanceBOL/DistanceBOL));
    DegreeToP3   := tBearing - DegreeP3;
    DistanceToP3 := tDistanceBOL/sin(DegToRad(DegreeP3));

    RangeBearingToCoord(DistanceToP3, DegreeToP3, fPointBOL3.X, fPointBOL3.Y);
    fPointBOL3.X := tStartBOL_X + fPointBOL3.X;
    fPointBOL3.Y := tStartBOL_Y + fPointBOL3.Y;

    //Calc P4 in BOL
    DegreeP4     := RadToDeg(ArcTan(tDistanceBOL/DistanceBOL));
    DegreeToP4   := tBearing + DegreeP4;
    DistanceToP4 := tDistanceBOL/sin(DegToRad(DegreeP4));

    RangeBearingToCoord(DistanceToP4, DegreeToP4, fPointBOL4.X, fPointBOL4.Y);
    fPointBOL4.X := tStartBOL_X + fPointBOL4.X;
    fPointBOL4.Y := tStartBOL_Y + fPointBOL4.Y;
  end;
end;

procedure CalcHitPredictionWithWaypoint(
    const tSpeed, tCourse, tLengthWaypoint: Double;
    const tPositionX, tPositionY : Double;
    const pSpeed: Double;
    var fPositionX, fPositionY : Double);
var
  TMissileToHitLastWaypoint : Double;
  SpeedMissile, TargetSpeed, TargetCourse : Double;

  lengthWaypoint : Double;
  tHour   : Double;

  ProbabilityTargetToward : Double;

  PosX, PosY : Double;
  PosXTemp, PosYTemp : Double;

  dRad  : extended;
  sinx, cosx: extended;
  range : double;
begin
  TargetSpeed    := tSpeed;
  TargetCourse   := tCourse;
  lengthWaypoint := tLengthWaypoint;
  SpeedMissile   := pSpeed;

  TMissileToHitLastWaypoint := lengthWaypoint / SpeedMissile;
  tHour   := TMissileToHitLastWaypoint;        //In Hour

  ProbabilityTargetToward := TargetSpeed * tHour; // ==> Range in Naucticale mile

  range := ProbabilityTargetToward * C_NauticalMile_To_Degree;
  dRad := C_DegToRad * ConvCompass_To_Cartesian(TargetCourse);
  SinCos(dRad, sinx, cosx);
  PosXTemp := range * cosx;
  PosYTemp := range * sinx;

  PosX := tPositionX + PosXTemp;
  PosY := tPositionY + PosYTemp;

  fPositionX := PosX;
  fPositionY := PosY;

end;

procedure CalcHitPredition(
   const tRange, tBearing, tSpeed, tCourse: double;
   const pSpeed: double;
   var hRange, hBearing, hTime, hSpeed: double);
var vR : double;
    dA, dB, dC : double;
    sinA, sinB, sinC : double;
begin
  { a : target speed
    b : relatif speed.
    c : torpedo speed
  } if  abs(pSpeed) < 0.00000001 then exit;

   dC := 180 - (tBearing - tCourse);
   sinC := sin(DegToRad(dC));
   sinA := (tSpeed * sinC)/ pSpeed;
   dA := RadToDeg(ArcSin(sinA));
   dB := 180 - dC - dA;
   sinB := Sin(DegToRad(dB));

   if  abs(sinC) < 0.00000001 then begin
      vR := pSpeed + tSpeed * cos(DegToRad(dC));
   end
   else begin
      vR := (pSpeed * sinB) / sinC;
   end;

   hBearing := tCourse + dB;
   if abs(vR) < 0.00000001 then begin
     hTime  := 99999.99;  //  tidak terkejar
     hRange := 99999.99;  //
   end
   else begin
     hTime := tRange / vR;      //menit
     hRange := hTime * pSpeed;
   end;

   hSpeed := Vr;
end;

function getIdentifier(Index : integer; IdClass : TClass) : string;
var
  vehicle : TVehicle_Definition;
begin
  if IdClass = TVehicle_Definition then begin
    vehicle := nil;
    dmTTT.GetVehicle_Definition(Index,vehicle);
    result := vehicle.FData.Vehicle_Identifier;
    vehicle.Free;
  end;
end;

function getDomain(val : integer): string;
begin
  if val = 0 then
    Result := 'Air';
  if val = 1 then
    Result := 'Surface';
  if val = 2 then
    Result := 'Subsurface';
  if val = 3 then
    Result := 'Land';
  if val = 4 then
    Result := 'General';
end;

function getCorrectSymbol(const domain: Integer; const platform_type: Integer; const force: Integer; var color: TColor): string;
var
  platformName, forceName, symbolBMP, postfix: string;
begin
  symbolBMP := '';
  {
  case platform_type of
    vhtFighter       : symbolBMP := pctAir + postfix ;
    vhtStrikeBomber  : symbolBMP := pctAir + postfix ;
    vhtFixed         : symbolBMP := pctFixedWing + postfix ;
    vhtFixedEW       : symbolBMP := pctFixedWing + postfix ;
    vhtRotaryAttack  : symbolBMP := pctRotaryWing + postfix ;
    vhtRotaryASW     : symbolBMP := pctRotaryWing + postfix ;
    vhtFixedSurv     : symbolBMP := pctFixedWing + postfix ;
    vhtFixedRec      : symbolBMP := pctFixedWing + postfix ;
    vhtSeaPlane      : symbolBMP := pctSurface + postfix ;
    vhtMissile       : symbolBMP := pctMissile + postfix ;
    vhtAirCarrier    : symbolBMP := pctAir + postfix ;
    vhtCruiseGuided  : symbolBMP := pctSurface + postfix ;
    vhtDestroGuided  : symbolBMP := pctSurface + postfix ;
    vhtFrigatGuided  : symbolBMP := pctSurface + postfix ;
    vhtDestroyer     : symbolBMP := pctSurface + postfix    ;
    vhtFrigate       : symbolBMP := pctSurface + postfix      ;
    vhtMineWarfare   : symbolBMP := pctSurface + postfix  ;
    vhtPatrolCraft   : symbolBMP := pctSurface + postfix  ;
    vhtMerchant      : symbolBMP := pctSurface + postfix     ;
    vhtUtilityVess   : symbolBMP := pctSurface + postfix  ;
    vhtSurfOther     : symbolBMP := pctSurface + postfix    ;
    //vhtNuclearBalis : symbolBMP := pctSurface + postfix ;
    //vhtAuxiliary    : symbolBMP := pctSurface + postfix ;
    vhtNuclearAtt    : symbolBMP := pctSubSurface + postfix   ;
    vhtNuclearGuided : symbolBMP := pctSubSurface + postfix;
    vhtDieselAttack  : symbolBMP := pctSubSurface + postfix ;
    vhtDieselGuided  : symbolBMP := pctSubSurface + postfix ;
    vhtBaterySurf    : symbolBMP := pctBatterySam + postfix ;
    vhtBateryMissile : symbolBMP := pctBatterySam + postfix ;
    vhtBateryGun     : symbolBMP := pctBatterySam + postfix ;
    vhtAirfield      : symbolBMP := pctAirfield + postfix     ;
    vhtPlatoonArm    : symbolBMP := pctArmour + postfix  ;
    vhtPlatoonInf    : symbolBMP := pctInfantry + postfix  ;
    vhtBatteryArt    : symbolBMP := pctBatteryAaa + postfix ;
    vhtPort          : symbolBMP := pctPort + postfix ;
    vhtSpecialCraft  : symbolBMP := pctSurface + postfix ;
//    vhtOther         : symbolBMP := pctSurface + postfix ;
    //vhtAmphibious    : symbolBMP := pctSurface + postfix ;
    vhtRotarySurv    : symbolBMP := pctRotaryWing + postfix ;
    vhtRotaryRec     : symbolBMP := pctRotaryWing + postfix ;
  else
    symbolBMP := pctGeneral;
  end;
  }

  if (force = 1) and (domain <> vhdLand) then
    postfix := pfHostile
  else
    postfix := pfFriend;

  case domain of
    vhdAir :
      begin
        case platform_type of
          vhtRotaryRec : symbolBMP := pctRotaryWing + postfix;
          vhtFixedRec : symbolBMP := pctFixedWing + postfix;
          else
            symbolBMP := pctAir + postfix;
        end;
      end;
    vhdSurface : symbolBMP := pctSurface + postfix;
    vhdSubsurface : symbolBMP := pctSubSurface + postfix;
    vhdLand   : symbolBMP := pctLand + postfix;
    vhdGeneral : symbolBMP := pctGeneral + postfix;
    vhdWreck : symbolBMP := pctWreck;
  end;

  case force of
    1 : color := clRed;
    2 : color := clYellow;
    3 : color := clBlue;
    4 : color := clGreen;
    5 : color := clwhite;
    6 : color := clBlack;
   else
	 color := clwhite;
  end;

  result := symbolBMP;
end;

function getColorFromIdentity(const aIdent: integer): TColor;
begin
  Result := 0;
  case aIdent of
    piPending          : result := RGB(255,255,254) ;
    piUnknown          : result := RGB(255,255,254) ;
    piAssumedFriend    : result := clBlue  ;
    piFriend           : result := clBlue  ;
    piNeutral          : result := clGreen ;
    piSuspect          : result := clRed   ;
    piHostile          : result := clRed   ;
  end;
end;

function getIdentStr(val : integer): string;
begin
  case val of
    piPending           : result := 'Pending';
    piUnknown           : result := 'Unknown';
    piAssumedFriend     : result := 'AssumedFriend';
    piFriend            : result := 'Friend';
    piNeutral           : result := 'Neutral';
    piSuspect           : result := 'Suspect';
    piHostile           : result := 'Hostile';
  else
    result := 'Pending';
  end;
end;

function getDetectedSymbolFileName(const aDomain, aIdent: integer): string;
var sDom, sIdent : string;
begin
  sDom := 'Surface';
  case aDomain of
    vhdAir        : sDom := 'Air';
    vhdSurface    : sDom := 'Surface';
    vhdSubsurface : sDom := 'Subsurface';
    vhdLand       : sDom := 'Land';
    vhdGeneral    : sDom := 'Surface';
  end;
  sIdent := 'Pending';
  case aIdent of
    piPending           : sIdent := 'Pending';
    piUnknown           : sIdent := 'Unknown';
    piAssumedFriend     : sIdent := 'AssumedFriend';
    piFriend            : sIdent := 'Friend';
    piNeutral           : sIdent := 'Neutral';
    piSuspect           : sIdent := 'Suspect';
    piHostile           : sIdent := 'Hostile';
  end;
  result := sDom + sIdent + '.bmp';
end;

function getPlatformTypeSymbolFileName(const aPlatformType: integer): string;
begin
  case aPlatformType of
    vhtFighter      ,
    vhtStrikeBomber ,
    vhtFixed        : result := 'FixedWing';            // w ident
    vhtFixedEW      : result := 'AirborneEarlyWarning'; // no ident

    vhtRotaryAttack,
    vhtRotaryASW :    result := 'RotaryWing';           // w ident

    vhtFixedSurv,
    vhtFixedRec,
    vhtSeaPlane     : result := 'FixedWing';            // w ident

    vhtMissile      : result := 'Missile';              // w ident

    vhtAirCarrier,

    vhtCruiseGuided,
    vhtDestroGuided,
    vhtFrigatGuided,
    vhtDestroyer,
    vhtFrigate,

    vhtMineWarfare,
    vhtPatrolCraft,
    vhtMerchant,
    vhtUtilityVess,
    vhtSurfOther,

    vhtNuclearBalis,
    vhtAuxiliary,
    vhtNuclearAtt,
    vhtNuclearGuided,
    vhtDieselAttack,
    vhtDieselGuided : result := 'Surface';        // w ident

    vhtBaterySurf,                                      // Battery, Surface-to-Air Missile?
    vhtBateryMissile,                                   // Battery, Coastal Defence Missile?
    vhtBateryGun        : result := 'BatterySam';     // Battery, Coastal Defence Artillery?

    vhtAirfield         : result := 'Airfield';    // w ident

    vhtPlatoonArm       : result :=  'Armour';     // w ident

    vhtPlatoonInf       : result :=  'Infantry';   // w ident

    vhtBatteryArt       : result := 'BatteryAaa';  // w ident  // Battery, Anti-Aircraft Artillery?

    vhtPort             : result := 'Port';        // w ident
    vhtSpecialCraft,
    vhtOther            : result := 'General';        // no ident
    vhtAmphibious       : result := 'Surface';
    vhtRotarySurv,
    vhtRotaryRec        : result := 'RotaryWing';
  else

  end;

end;

function getTrackTypeStr(val: integer): string;
begin
  case val  of
    vhtFighter       : result := vhtsFighter      ;
    vhtStrikeBomber  : result := vhtsStrikeBomber ;
    vhtFixed         : result := vhtsFixed        ;
    vhtFixedEW       : result := vhtsFixedEW      ;
    vhtRotaryAttack  : result := vhtsRotaryAttack ;
    vhtRotaryASW     : result := vhtsRotaryASW    ;
    vhtFixedSurv     : result := vhtsFixedSurv    ;
    vhtFixedRec      : result := vhtsFixedRec     ;
    vhtSeaPlane      : result := vhtsSeaPlane     ;
    vhtMissile       : result := vhtsMissile      ;
    vhtAirCarrier    : result := vhtsAirCarrier   ;
    vhtCruiseGuided  : result := vhtsCruiseGuided ;
    vhtDestroGuided  : result := vhtsDestroGuided ;
    vhtFrigatGuided  : result := vhtsFrigatGuided ;
    vhtDestroyer     : result := vhtsDestroyer    ;
    vhtFrigate       : result := vhtsFrigate      ;
    vhtMineWarfare   : result := vhtsMineWarfare  ;
    vhtPatrolCraft   : result := vhtsPatrolCraft  ;
    vhtMerchant      : result := vhtsMerchant     ;
    vhtUtilityVess   : result := vhtsUtilityVess  ;
    vhtSurfOther     : result := vhtsSurfOther    ;
    vhtNuclearBalis  : result := vhtsNuclearBalis ;
    vhtAuxiliary     : result := vhtsAuxiliary    ;
    vhtNuclearAtt    : result := vhtsNuclearAtt   ;
    vhtNuclearGuided : result := vhtsNuclearGuided;
    vhtDieselAttack  : result := vhtsDieselAttack ;
    vhtDieselGuided  : result := vhtsDieselGuided ;
    vhtBaterySurf    : result := vhtsBaterySurf   ;
    vhtBateryMissile : result := vhtsBateryMissile;
    vhtBateryGun     : result := vhtsBateryGun    ;
    vhtAirfield      : result := vhtsAirfield     ;
    vhtPlatoonArm    : result := vhtsPlatoonArm   ;
    vhtPlatoonInf    : result := vhtsPlatoonInf   ;
    vhtBatteryArt    : result := vhtsBatteryArt   ;
    vhtPort          : result := vhtsPort         ;
    vhtSpecialCraft  : result := vhtsSpecialCraft ;
    vhtOther         : result := vhtsOther        ;
    vhtAmphibious    : result := vhtsAmphibious   ;
    vhtRotarySurv    : result := vhtsRotarySurv   ;
    vhtRotaryRec     : result := vhtsRotaryRec    ;
  else
    result := '??';
  end;

end;

end.
