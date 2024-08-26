unit uBaseCoordSystem;
{  system coordinate cartesian, polar,  degree - radian
}

interface

uses

  Windows, uDataTypes;

type
  TPointBOL = record
     x, y : Double;
   end;

//==============================================================================
  function trueDistance(const x1, y1, x2, y2: double): double;
    { desc : menghitung jarak antara 2 titik di lingkaran besar.
      input: Koordinat long lat 2 titik
      ouput: jarak (nautical miles)

    }
  function CalcRange(const x1, y1, x2, y2: double): Double;
   { Euclid distance }

  function CalcBearing(const x1, y1, x2, y2: double): Double;
  { arc tan}

  {Point Form Leader}
  procedure FindPoint(postCont: t2DPoint; var postValue : t2DPoint; vr, vb: Double);

  procedure CalcForward(const x1, y1, aDist, aCourse: double; var x2, y2: double);

  { Direction Conversion }
  function ConvCartesian_To_Compass(const degree: double): double;
  function ConvCompass_To_Cartesian(const degree: double): double;
  function ConvCustomAngleStart(const degree,startAngle: Double):Double;

  {Kompas direction}
  function DegComp_IsBeetwen(const aDegTes: double;
    const aDeg1, aDeg2: double): boolean;

  {Prince}
  function ptToLine(const ptFrom, ptTo, pt: t2DPoint): Boolean;
  function ptToArea(const rect : TRect ; pt: t2DPoint): Boolean;
  function ptToCircle(const cent, pt: t2DPoint; r : Double): Boolean;
  function ptToArc(const cent, pt: t2DPoint; r1, r2 : Double; sA, eA : Integer): Boolean;

  function ptToLineDistance(const ptFrom, ptTo, pt: t2DPoint): double;
  function ValidateDegree(const degreeOrg: double): double;


 { ToString conversion - formatting }
  function formatDMS_long(const x: double): string;
  function formatDMS_latt(const y: double): string;

  {UTM and MGRS convert function} //dng
  procedure ConvDegree_To_UTM_and_MGRS(const latitude, longitude : Double; var resultUTM, resultMGRS : string); // dng

  //aldy
  function formatDM_longitude(const x: double): string;
  function formatDM_latitude(const y: double): string;

  function dmsToLong(const s: string): Double;
  function dmsToLatt(const s: string): Double;
  //aldy
  function dmToLongitude(const s: string): Double;
  function dmToLatitude(const s: string): Double;

  function FormatTrackNumber(const i: integer): string;

  function FormatCourse(const d: double): string; overload;
  function FormatCourse(const d: single): string; overload;

  function FormatSpeed(const d: double): string;

  function FormatAltitude(const s: single): string;
  procedure RangeBearingToCoord(const r, b: double; var mx, my : double);

  function LatGridToDiffY(const s: string): Double;
  function LongGridToDiffX(const s: string): Double;

  function LatValidation(const s: string): Boolean;
  function LongValidation(const s: string): Boolean;

  function TimeToSecond(const aTimeStr: string; var aSecond: Integer): Boolean;
  function SecondToTime(const aSecond: Integer; var aTimeStr: string): Boolean;
  function DecimalToOctal(const aValue: Integer): string;
  function OctalToDecimal(const aValue: string): Integer;

const

  C_Degree_To_NauticalMile = 60.0;
  C_NauticalMile_To_Degree = 1.0 /60.0;
  C_NauticalMile_To_Metre  = 1852.0;
  C_NauticalMile_To_Feet = 6076.11549;
  C_NauticalMile_To_Yards = 2025.37183;
  C_Feet_To_Meter = 0.3048;
  C_Meter_To_Feet = 3.281;
  C_Meter_To_NauticalMile = 1 / C_NauticalMile_To_Metre;
  C_Meter_To_Degree = C_Meter_To_NauticalMile * C_NauticalMile_To_Degree;
  C_Degree_To_Meter = 111319.49081869110446433493412896;
  C_Degree_To_Feet = C_Degree_To_NauticalMile * C_NauticalMile_To_Feet;
  C_MS_To_KNOTS = 1.9438449412;
  C_Gravitasi = 9.807;
  C_KNOTS_To_MS = 0.5144444;



implementation

uses
  Math, SysUtils , uStringFunc;

//==============================================================================
{ Direction Conversion }

procedure RangeBearingToCoord(const r, b: double; var mx, my : double);
var dRad  : extended;
    sinx, cosx: extended;
    range : double;
begin  // return *relatif* coord to radar center
  range := r * C_NauticalMile_To_Degree;

  dRad := C_DegToRad * ConvCompass_To_Cartesian(b);
  SinCos(dRad, sinx, cosx);

  mx := range * cosx;
  my := range * sinx;
end;

function ConvCustomAngleStart(const degree,startAngle: Double):Double;
begin
  result := startAngle - degree;
  if result < 0.0 then result := result + 360.0;
end;
function ConvCartesian_To_Compass(const degree: double): double;
begin
  // input : derajat (0..360) dari sumbu X, CCW, cartesian
  // output: derajat (0..360) dari utara,   CW, kompas

  result := 90.0 - degree;
  if result < 0.0 then result := result + 360.0;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function ConvCompass_To_Cartesian(const degree: double): double;
begin
  // input : derajat (0..360) dari utara,   CW, kompas
  // output: derajat (0..360) dari sumbu X, CCW, cartesian

  result := 90.0 - degree;
  if result < 0.0 then result := result + 360.0;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function DegComp_IsBeetwen(const aDegTes: double;
  const aDeg1, aDeg2: double): boolean;
{compass direction}
var
  d1, d2: double;
begin
  d1 := (aDegTes - aDeg1);
  if d1 < 0.0 then d1 := d1 + 360.0;
//  while d1 < 0.0 do d1 := d1+ 360.0;

  d2 := (aDeg2 - aDeg1);
  if d2 < 0.0 then d2 := d2 + 360.0;
//  while d2 < 0.0 do d2 := d2+ 360.0;

  result := d1 < d2;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function IsDegreeDestAtLeft(const src, dest: double): boolean;
{ Cartesian }
{ return true jika dest dikiri (CCW) src, cartesian, east = 0 }
var
  back: double;
begin
  back := ValidateRange(dest - src, 360.0);
  result := (back - 180.0) < 0.0;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function trueDistance(const x1, y1, x2, y2: double): double;
const
  R = 3438.147;
begin
  result := ArcCos(sin(y1) * sin(y2) + cos(y1) * cos(y2) *
    cos(x2 - x1)) * R;
end;

function CalcRange(const x1, y1, x2, y2: double): Double;
var
  dx, dy: Extended;
begin
   {input dec degree, output nautical mile, }
  dx := (x2 - x1) * C_Degree_To_NauticalMile;
  dy := (y2 - y1) * C_Degree_To_NauticalMile;

  result := sqrt(sqr(dx) + sqr(dy));
end;

function CalcBearing(const x1, y1, x2, y2: double): Double;
var
  dx, dy, bearing: Extended;
begin
   {input dec degree, output Compass Coord }
  dx := (x2 - x1);
  dy := (y2 - y1);
  bearing := RadToDeg(ArcTan2(dy, dx));
  result := ConvCartesian_To_Compass(bearing);
end;

//==============================================================================
procedure CalcForward(const x1, y1, aDist, aCourse: double; var x2, y2: double);
{ x1, y1 : long lat degree
  aDist  : nautical Miles
  aDir   : Compas;
}
var dir : Double;
begin
  dir := DegToRad(90 - aCourse);

  X2 := X1 + C_NauticalMile_To_Degree * aDist * Cos(dir);
  Y2 := Y1 + C_NauticalMile_To_Degree * aDist * Sin(dir);

end;
//==============================================================================

procedure FindPoint(postCont: t2DPoint; var postValue : t2DPoint; vr, vb: Double);
var
  dx, dy : Double;
begin
  RangeBearingToCoord(vr, vb, dx, dy);
  postValue.X := postCont.X + dx;
  postValue.Y := postCont.Y + dy;
end;

procedure SplitDegreeMinuteSecond(const dd: double; var d, m, s: double);
var
  absLongLat: double;
  MinDet: double;
begin
  absLongLat := abs(dd);
  d := Trunc(absLongLat);
  MinDet := Frac(absLongLat) * 60.0;
  m := Trunc(MinDet);
  s := Frac(MinDet) * 60.0;
end;

procedure SplitDegreeMinute(const dd: double; var d, m: double);
var
  absLongLat: double;
  MinDet: double;
begin
  absLongLat := abs(dd);
  d := Trunc(absLongLat);
  MinDet := Frac(absLongLat) * 60.0;
  m := MinDet;
  {
  s := Frac(MinDet) * 60.0;
  }
end;

//==============================================================================

function formatDMS_long(const x: double): string;
var
  absLongLat: double;
  Degree, Minute, Second: double;
begin
  absLongLat := abs(x);
  if absLongLat > 180.0 then absLongLat := 180.0;
  SplitDegreeMinuteSecond(absLongLat, Degree, Minute, Second);

  Result := FormatFloat('000', Degree) + '° ' +
    FormatFloat('00', Minute) + ''' ' +
    FormatFloat('00.0', second) + '" ';
  if x < 0 then
    Result := Result + 'W'
  else
    Result := Result + 'E'
end;

//==============================================================================

function formatDMS_latt(const y: double): string;
var
  absLongLat: double;
  Degree, Minute, Second: double;
begin
  absLongLat := abs(y);
  if absLongLat > 90.0 then absLongLat := 90.0;
  SplitDegreeMinuteSecond(absLongLat, Degree, Minute, Second);

  Result := FormatFloat('00', Degree) + '° ' +
    FormatFloat('00', Minute) + ''' ' +
    FormatFloat('00.0', second) + '" ';

  if y < 0 then
    Result := Result + 'S'
  else
    Result := Result + 'N';
end;

function formatDM_longitude(const x: double): string;
var
  absLongLat: double;
  Degree, Minute: double;
begin
  absLongLat := abs(x);
  if absLongLat > 180.0 then absLongLat := 180.0;
  SplitDegreeMinute(absLongLat, Degree, Minute);

  Result := FormatFloat('000', Degree) + '° ' +
    FormatFloat('00.000', Minute) + ''' ' {+
    FormatFloat('00.0', second) + '" '};
  if x < 0 then
    Result := Result + 'W'
  else
    Result := Result + 'E'
end;

function formatDM_latitude(const y: double): string;
var
  absLongLat: double;
  Degree, Minute: double;
begin
  absLongLat := abs(y);
  if absLongLat > 90.0 then absLongLat := 90.0;
  SplitDegreeMinute(absLongLat, Degree, Minute);

  Result := FormatFloat('00', Degree) + '° ' +
    FormatFloat('00.000', Minute) + ''' ' {+
    FormatFloat('00.0', second) + '" '};

  if y < 0 then
    Result := Result + 'S'
  else
    Result := Result + 'N';
end;

function dmsToLong(const s: string): Double;
var
  d, m: Integer;
  sec: double;
  str: string;
begin
  Result := 0.0;
  if length(s) < 16 then exit;
    //    1234567890123456
    //    114° 57' 37.6" E

  str := Copy(s, 1, 3);
  d := ConvertStringToInt(str);

  str := Copy(s, 6, 2);
  M := ConvertStringToInt(str);

  str := Copy(s, 10, 4);
  sec := ConvertStringToFloat(str);

  result := d + (m / 60.0) + (sec / 3600.0);

  if s[16] = 'W' then
    result := -result;
end;

function dmsToLatt(const s: string): Double;
var
  d, m: Integer;
  sec: double;
  str: string;
begin
  Result := 0.0;

  if length(s) < 15 then exit;
    // 123456789012345
    // 07° 52' 34.2" S

  str := Copy(s, 1, 2);
  d := ConvertStringToInt(str);

  str := Copy(s, 5, 2);
  M := ConvertStringToInt(str);

  str := Copy(s, 9, 4);
  sec := ConvertStringToFloat(str);

  result := d + (m / 60.0) + (sec / 3600.0);

  if s[15] = 'S' then
    result := -result;

end;

procedure ConvDegree_To_UTM_and_MGRS(const latitude, longitude : Double; var resultUTM, resultMGRS : string);  // dng
var
  // =============== UTM ============= //
   a : Integer;
  lat, Long, longo, b, f, f1, rm, k0, e, e2, n, rho, nu, p  : Double;
  merA, merB, merC, merD, merE, merS : Double;
  K1, K2, K3, K4, K5 : Double;
  isNorting, isEasting : Boolean;
  AbsLatitude, AbsLongitude: Double;

  n1, n2, n3, n4, n5, T, C, A0 : Double ;
  Degree, Minute, Second: double;
  // ================ result ============== //
  Zona,EastingV,NortingV,ZonaLat : Double ;
  latzone,Hemisphere : string;

  //=============== MGRS ===============//
  aSet, blok, per100rblat, per1jtlongitude, blokdua, digitlong, jenisdigitlong : Integer;
  hasilHurufPertama, hasilhurufkedua : integer;
  PraHasilN,PraHasilE,HasilN,HasilE, Digraph1,Digraph2 : string;
begin

 // ======== UTM formula ======== //
//===step 1====
  if latitude < 0 then
    isNorting := false
  else
    isNorting := True;

  if longitude < 0 then
    isEasting := False
  else
    isEasting := True;

    AbsLongitude := Abs(longitude);
  if AbsLongitude > 180.0 then AbsLongitude := 180.0;
    SplitDegreeMinuteSecond(AbsLongitude, Degree, Minute, Second);

    Long := ((Degree) + (Minute) / 60 + (Second) / 3600) * 2 * PI / 360;


  AbsLatitude := Abs(latitude);
  if AbsLatitude > 90.0 then AbsLatitude := 90.0;
    SplitDegreeMinuteSecond(AbsLatitude, Degree, Minute, Second);

    lat := ((Degree) + (Minute) / 60 + (Second) / 3600) * 2 * PI / 360;

  If isNorting Then
    lat := lat
  Else
    lat := -1 * lat ;

  If isEasting Then
    long := long
  Else
    long := -1 * long ;



 //=====step 2====
  a := 6378137 ;
  b  := A - A / 298.2572 ;// 6356752.3142;
  f :=  1/298.257223563;
  f1 := 1/f;

  k0 := 0.9996;
  e := Sqrt(1-power(b,2)/ power(a,2));
  e2 := e * e / (1 - e * e);
  n := (a - b) / ( a + b);
  rho := (a * (1 - power(e,2))) / (power(( 1 - power((e * sin(lat)),2)),(3/2)));
  nu := a / (power(( 1 - power((e * sin(lat)),2)),(1/2)));

  //set hemisphere
  if isNorting = True then
  Hemisphere := 'N'
  else
  Hemisphere := 'S';

  //get zona
  if isEasting then
    Zona := Trunc((longitude / 6) + 31)
  else
    Zona := Trunc((180 + longitude) / 6) + 1;

  if isNorting then
    zonaLat := Trunc((latitude / 8) + 11)
  else
    ZonaLat := Trunc((80 + latitude) / 8) + 1;

  // get zona for utm and lat zone for mgrs
  if (ZonaLat > 6) and (ZonaLat <= 11)then
    latzone := Char(66 + Round(ZonaLat) + 1)
  else if (ZonaLat > 11) then
    latzone := Char(66 + Round(ZonaLat) + 2)
  else
    latzone := Char(66 + Round(ZonaLat));

  n1 := (A - b) / (A + b);
  n2 := n1 * n1;
  n3 := n2 * n1;
  n4 := n3 * n1;
  n5 := n4 * n1;

  longo := DegtoRad(((Zona - 1) * 6) - 180 + 3);

  p := long - longo;
  merA := A * (1 - n1 + (5 / 4) * (n2 - n3) + (81 / 64) * (n4 - n5));
  merB := (3 * A * n1 / 2) * (1 - n1 + (7 / 8) * (n2 - n3) + (55 / 64) * (n4 - n5));
  merC := (15 * A * n2 / 16) * (1 - n1 + (3 / 4) * (n2 - n3));
  merD := (35 * A * n3 / 48) * (1 - n1 + (11 / 16) * n2);
  merE := (315 * A * n4 / 512) * (1 - n1);

  merS := (merA * lat) - (merB * Sin(2 * lat)) + (merC * Sin(4 * lat)) - (merD * Sin(6 * lat)) + (merE * Sin(8 * lat));

  K1 := merS * k0;
  K2 := k0 * nu * sin(lat) * cos(lat)/2;
  K3 := (k0 * nu * sin(lat) * power(cos(lat),3) / 24) * (5 - power(tan(lat),2) + 9 * e2 * power(cos(lat),2) + 4 * power(e2,2)* power(cos(lat),4));
  k4 := k0 * nu * cos(lat);
  k5 := (k0 * nu * power(cos(lat),3) / 6) * (1 - power(tan(lat),2) + e2 * power(cos(lat),2));

   // get norting & easting

  EastingV :=  K1 + k2 * power(p,2) + K3 * power(p,4);    //
  NortingV := 500000 + (K4 * p + K5 * power(p,3));      //

  If lat < 0 Then
    EastingV := 10000000 + EastingV
  Else
    EastingV := EastingV ;

  // ========== MGRS ==========//
  // rubah ke string dulu
  PraHasilN := FloatToStr(Trunc(NortingV));
  PraHasilE := FloatToStr(Trunc(EastingV));
  // == ambil karakter tertentu untuk MGRS ==//
  // edt7.Text := FloatToStr(Zona);   // get long zone
  HasilN := Copy (PraHasilN,2,5); // get lat mgrs
  if (Length(PraHasilE) > 6) then // get long mgrs, but jika 7 digit(juta) / 6 digit(ratusan)
  begin
    HasilE := Copy (PraHasilE,3,5);
    digitlong := 7;  // panjang digit
  end
  else
  HasilE := Copy(PraHasilE,2,5);
  digitlong := 6;  // pannjang digit


  // == set div Digraph/huruf pertama ==//
  aSet := (Round(zona) mod 6);  //sisa pembagian yang dibagi 6
  if aSet = 0 then  // jika habis dibagi 6
  aSet := 6;  // maka termasuk zona 6

  blok := aSet mod 3;
  if blok = 0 then
  blok := 3;

  per100rblat := (Round(NortingV) div 100000) + (8*(blok-1));

  if ( per100rblat > 8) and ( per100rblat < 15 )then
    hasilHurufPertama := (per100rblat + 64 + 1)     // iki lek menyentuh huruf i
  else if ( per100rblat >= 15 ) then
    hasilHurufPertama := (per100rblat + 64 + 2)    // iki lek menyentuh huruf o
  else
    hasilHurufPertama := (per100rblat + 64); // iki asline

  Digraph1 := Char(hasilHurufPertama);        // === get digraph 1


// == set div Digraph/angka kedua == //

  if (aSet mod 2 = 0) then //jika blok 2 genap
    blokdua := 69
  else      // ganjil
    blokdua := 64;

  if digitlong = 6 then // deteksi jumlah digit
  jenisdigitlong := 100000   // 6 digit
  else
  jenisdigitlong := 1000000;  // 7 digit

  per1jtlongitude := ((Round(EastingV) mod 1000000) div 100000);//div jenisdigitlong);

  if EastingV > 1000000 then
  begin
    if (Round(EastingV) div 1000000) = 9 then
      per1jtlongitude := per1jtlongitude + 10;
  end;

  hasilhurufkedua := (per1jtlongitude + blokdua + 1);

  if blokdua = 69 then
  begin
    if ( per1jtlongitude > 2) and ( per1jtlongitude < 9 )then
      hasilhurufkedua := (hasilhurufkedua + 1)     // iki lek menyentuh huruf i
    else if ( per1jtlongitude >= 9 ) then
      hasilhurufkedua := (hasilhurufkedua + 2)    // iki lek menyentuh huruf o
    else
      hasilhurufkedua := hasilhurufkedua; // iki asline

  end
  else
  begin
    if ( per1jtlongitude > 7) and ( per1jtlongitude < 14 )then
      hasilhurufkedua := (hasilhurufkedua + 1)     // iki lek menyentuh huruf i
    else if ( per1jtlongitude >= 14 ) then
      hasilhurufkedua := (hasilhurufkedua + 2)    // iki lek menyentuh huruf o
    else
      hasilhurufkedua := hasilhurufkedua; // iki asline
  end;

  if hasilhurufkedua > 86 then
    hasilhurufkedua := hasilhurufkedua - 22;

    Digraph2 := char(hasilhurufkedua);       // get digraph 2


  //====  hasil konversi

  resultUTM  := FloatToStr(Round(Zona)) + Hemisphere +' '+ FormatFloat('0',NortingV) +' '+ FormatFloat('0',EastingV);//hasil UTM
  resultMGRS := FloatToStr(Round(Zona)) + latzone + Digraph1 + Digraph2 +  HasilN + HasilE ;
end;

function dmToLongitude(const s: string): Double;
var
  d: Integer;
  m : double;
  sec: double;
  str: string;
begin
  Result := 0.0;
  //if length(s) < 16 then exit;
    //    1234567890123456
    //    114° 57' 37.6" E
  //115° 03.229' E

  str := Copy(s, 1, 3);
  d := ConvertStringToInt(str);

  str := Copy(s, 6, 6);
  m := StrToFloat(str);
  {
  str := Copy(s, 10, 4);
  sec := ConvertStringToFloat(str);
  }
  result := d + (m / 60.0) {+ (sec / 3600.0)};

  if s[14] = 'W' then
    result := -result;
end;

function dmToLatitude(const s: string): Double;
var
  d: Integer;
  m : double;
  sec: double;
  str: string;
begin
  Result := 0.0;
  //if length(s) < 16 then exit;
    //    1234567890123456
    //    114° 57' 37.6" E
  //00° 08.093' S
  //

  str := Copy(s, 1, 2);
  d := ConvertStringToInt(str);

  str := Copy(s, 5, 6);
  M := StrToFloat(str);
  {
  str := Copy(s, 10, 4);
  sec := ConvertStringToFloat(str);
  }
  result := d + (m / 60.0) {+ (sec / 3600.0)};

  if s[13] = 'S' then
    result := -result;
end;

//==============================================================================
function ValidateDegree(const degreeOrg: double): double;
begin
  result := degreeOrg - (Floor(degreeOrg / 360.0) * 360.0);
end;

//==============================================================================

function ptToArc(const cent, pt: t2DPoint; r1, r2 : Double; sA, eA : Integer): Boolean;
var
  range, bearing,
  rin, rOut : Double;
begin
  Result := False;

  if r1 > r2 then
  begin
    rin := r2;  rOut := r1;
    r1 := rin;  r2 := rOut;
  end;

  if sA > eA then
    eA := eA + 360;

  range := CalcRange(cent.X, cent.Y, pt.X, pt.Y);
  bearing := CalcBearing(cent.X, cent.Y, pt.X, pt.Y);

  if (range >= r1 - 0.2) and (range <= r2 + 0.2 ) then
  begin
    if (sA <= bearing) and (bearing <= eA)  then
      Result := True;
  end;

end;

function ptToCircle(const cent, pt: t2DPoint; r : Double): Boolean;
var
  range : Double;
begin
  Result := False;

  range := CalcRange(cent.X, cent.Y, pt.X, pt.Y);

  if range <= r then
    Result := True;

end;

function ptToArea(const rect : TRect ; pt: t2DPoint): Boolean;
begin
  Result := False;
  if ((pt.X >= rect.Left) AND (pt.X <= rect.Right)) then
  begin
    if ((pt.Y >= rect.Top) AND (pt.Y <= rect.Bottom)) then
    begin
      Result := True;
    end;
  end;
end;

function ptToLine(const ptFrom, ptTo, pt: t2DPoint): Boolean;
var
  dxGaris, dyGaris, dx, dy, dr,
  lineToPtx, LineToPty : double;
  m, c: double;
begin
  Result := False;

  dxGaris := (ptTo.x - ptFrom.x);
  if dxGaris = 0 then //==||==> vertikal line
  begin
    if (abs(pt.x - ptFrom.x)) < 2 then
    begin
      if (ptTo.y - ptFrom.y) < 0 then
      begin
        if (ptTo.y < pt.y) and (pt.y < ptFrom.y) then
          Result := True;
      end
      else
      begin
        if (ptTo.y > pt.y) and (pt.y > ptFrom.y) then
          Result := True;
      end;
    end;
    exit;
  end;

  dyGaris := (ptTo.y - ptFrom.y);
  if dyGaris = 0 then //==__==> horizontal Line
  begin
    if (abs(pt.y - ptFrom.y)) < 2 then
    begin
      if (ptTo.x - ptFrom.x) < 0 then
      begin
        if (ptTo.x < pt.x) and (pt.x < ptFrom.x) then
          Result := True;
      end
      else
      begin
        if (ptTo.x > pt.x) and (pt.x > ptFrom.x) then
          Result := True;
      end;
    end;
    exit;
  end;

  {gradien oleh 2 titik}
  m := dyGaris / dxGaris;

  {constanta diketahui dari salah satu titik pd garis}
  c := ptFrom.y - (m * ptFrom.x);

  {pers garis lurus y = mx+c}
  dy := (m * pt.x + c) - pt.y;

  {pers garis lurus x = (y-c)/m}
  dx := ((pt.y - c) / m) - pt.x;

  dr := sqrt(dx * dx + dy * dy);

  if dr = 0 then
  begin
    Exit;
  end
  else
  begin
    if (abs(dx * dy / dr)) < 2 then
    begin
      if (ptTo.x - ptFrom.x) < 0 then
      begin
        if (ptTo.x < pt.x) and (pt.x < ptFrom.x) then
          Result := True;
      end
      else
      begin
        if (ptTo.x > pt.x) and (pt.x > ptFrom.x) then
          Result := True;
      end;
    end;
    exit;
  end;
end;

function ptToLineDistance(const ptFrom, ptTo, pt: t2DPoint): double;
var
  dxGaris, dyGaris, dx, dy, dr: double;
  m, c: double;
begin
  dxGaris := (ptTo.x - ptFrom.x);
  if dxGaris = 0 then begin //==||==> vertikal line
    result := abs(pt.x - ptFrom.x);
    exit;
  end;

  dyGaris := (ptTo.y - ptFrom.y);
  if dyGaris = 0 then begin //==__==> horizontal Line
    result := abs(pt.y - ptFrom.y);
    exit;
  end;

  {gradien}
  m := dyGaris / dxGaris;

  {constanta}
  c := ptFrom.y - (m * ptFrom.x);

  {pers garis lurus y = mx+c}
  dy := (m * pt.x + c) - pt.y;

  {pers garis lurus x = (y-c)/m}
  dx := ((pt.y - c) / m) - pt.x;

  dr := sqrt(dx * dx + dy * dy);

  result := abs(dx * dy / dr);
end;

function FormatCourse(const d: double): string;
var
  i1, i2: Integer;
begin
  i1 := Trunc(Int(d)) mod 360;
  i2 := Trunc(Int(frac(d) * 10));
  result := Format('%3.3d.%1.1d', [i1, i2]);
end;

function FormatCourse(const d: single): string;
var
  i1, i2: Integer;
begin
  i1 := Floor(d) mod 360;
  i2 := Floor(frac(d) * 10);
  result := Format('%3.3d.%1.1d', [i1, i2]);
end;


function FormatSpeed(const d: double): string;
begin
  result := FormatFloat('00.0', abs(d));
end;

function FormatTrackNumber(const i: integer): string;
begin
  result := IntToStr(i);
end;

function FormatAltitude(const s: single):string;
begin
  result := FormatFloat('0000',s);
end;


function LatGridToDiffY(const s: string): Double;
var
  index : Integer;
  str, val, dir : string;
begin
  str := s;
  index := Length(str);
  dir := Copy(str, index, 1);
  Delete(str, index - 4, 5);

  if dir = 'N' then
    Result := StrToFloat(str)
  else
    Result := StrToFloat(str) * -1;
end;

function LongGridToDiffX(const s: string): Double;
var
  index : Integer;
  str, val, dir : string;
begin
  str := s;
  index := Length(str);
  dir := Copy(str, index, 1);
  Delete(str, index - 4, 5);

  if dir = 'E' then
    Result := StrToFloat(str)
  else
    Result := StrToFloat(str) * -1;
end;

function LatValidation(const s: string): Boolean;
var
  degStr, minStr, min1Str, min2Str, sStr, degSeparator, minSeparator, secSeparator : string;
  deg, min1, min2, sec: Integer;
  min : Double;

begin
  Result := False;

  if Length(s) <> 13 then
    Exit;

  degStr := Copy(s, 1, 2);
  degSeparator := Copy(s, 3, 2);
  minStr := Copy(s, 5, 6);
  min1Str := Copy(s, 5, 2);
  minSeparator := Copy(s, 7, 1);
  min2Str := Copy(s, 8, 3);
  secSeparator := Copy(s, 11, 2);
  sStr := Copy(s, 13, 1);

  if not (TryStrToInt(degStr, deg) and (degSeparator = '° ') and
          TryStrToInt(min1Str, min1) and (minSeparator = '.') and
          TryStrToInt(min2Str, min2) and (secSeparator = ''' ')and
          TryStrToFloat(minStr, min)) then
  begin
    Exit;
  end;

  if not ((sStr = 'S') or (sStr = 'N')) then
    Exit;

  if deg > 90 then
  begin
    Exit;
  end
  else if deg = 90 then
  begin
    if min > 0 then
    begin
      Exit;
    end;
  end;

  if min1 > 59 then
  begin
    Exit;
  end;

  Result := True;
end;

function LongValidation(const s: string): Boolean;
var
  degStr, minStr, min1Str, min2Str, sStr, degSeparator, minSeparator, secSeparator : string;
  deg, min1, min2, sec: Integer;
  min : Double;

begin
  Result := False;

  if Length(s) <> 14 then
    Exit;

  degStr := Copy(s, 1, 3);
  degSeparator := Copy(s, 4, 2);
  minStr := Copy(s, 6, 6);
  min1Str := Copy(s, 6, 2);
  minSeparator := Copy(s, 8, 1);
  min2Str := Copy(s, 9, 3);
  secSeparator := Copy(s, 12, 2);
  sStr := Copy(s, 14, 1);

  if not (TryStrToInt(degStr, deg) and (degSeparator = '° ') and
          TryStrToInt(min1Str, min1) and (minSeparator = '.') and
          TryStrToInt(min2Str, min2) and (secSeparator = ''' ')and
          TryStrToFloat(minStr, min)) then
  begin
    Exit;
  end;

  if not ((sStr = 'E') or (sStr = 'W')) then
    Exit;

  if deg > 180 then
  begin
    Exit;
  end
  else if deg = 180 then
  begin
    if min > 0 then
    begin
      Exit;
    end;
  end;

  if min1 > 59 then
  begin
    Exit;
  end;

  Result := True;
end;


function TimeToSecond(const aTimeStr: string; var aSecond: Integer): Boolean;
var
  hStr, mStr, sStr, hmSeparator, msSeparator : string;
  h, m, s, totalSecond : Integer;
begin
  Result := False;
  aSecond := 0;

  if Length(aTimeStr) <> 8 then
  begin
//    ShowMessage('Too Short / Too Long');
    Exit;
  end;

  hStr := Copy(aTimeStr, 1, 2);
  hmSeparator := Copy(aTimeStr, 3, 1);
  mStr := Copy(aTimeStr, 4, 2);
  msSeparator := Copy(aTimeStr, 6, 1);
  sStr := Copy(aTimeStr, 7, 2);

  if not (TryStrToInt(hStr, h) and (hmSeparator = ':') and
    TryStrToInt(mStr, m) and (msSeparator = ':') and TryStrToInt(sStr, s)) then
  begin
//    ShowMessage('Invalid format');
    Exit;
  end;

  if h > 23 then
  begin
//    ShowMessage('Invalid hour value');
    Exit;
  end;

  if m > 59 then
  begin
//    ShowMessage('Invalid minute value');
    Exit;
  end;

  if s > 59 then
  begin
//    ShowMessage('Invalid second value');
    Exit;
  end;

  Result := True;
  aSecond := (h * 3600) + (m * 60) + s;
end;

function SecondToTime(const aSecond: Integer; var aTimeStr: string): Boolean;
var
  h, m, s, totalSecond : Integer;
  hStr, mStr, sStr : string;
begin
  Result := False;
  aTimeStr := '00:00:00';

  totalSecond := aSecond;

  if (totalSecond > 86399) or (totalSecond < 0) then
  begin
    Exit;
  end;

  h := totalSecond div 3600;
  totalSecond := totalSecond mod 3600;
  m := totalSecond div 60;
  s := totalSecond mod 60;

  hStr := IntToStr(h);

  if Length(hStr) < 2 then
    hStr := '0' + hStr;

  mStr := IntToStr(m);

  if Length(mStr) < 2 then
    mStr := '0' + mStr;

  sStr := IntToStr(s);

  if Length(sStr) < 2 then
    sStr := '0' + sStr;

  Result := True;
  aTimeStr := hStr + ':' + mStr + ':' + sStr;
end;

function DecimalToOctal(const aValue: Integer): string;
var
  i, value : Integer;
begin
  Result := '';
  value := aValue;

  i := 0;

  while value <> 0 do
  begin
    Result := IntToStr(value mod 8) + Result;
    value := value div 8;
  end;
end;

function OctalToDecimal(const aValue: string): Integer;
var
  i, value, pangkat : Integer;
begin
  Result := 0;
  pangkat := 0;

  for i := Length(aValue) downto 1 do
  begin
    value := StrToInt(Copy(aValue, i, 1));
    Result := Result + value * Round(Power(8, pangkat));

    Inc(pangkat);
  end;
end;

end.
