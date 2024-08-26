unit uBaseCoordSystem;

interface

uses

  Windows, Classes;

type
  TPointBOL = record
     x, y : Double;
   end;

//=============================================================================

 { ToString conversion - formatting }
  function AnsiCharArrayToString(const Arr: array of AnsiChar): string;
  procedure StringToAnsiCharArray(const Str: string; var Arr: array of AnsiChar);
  procedure StringToFixedLengthAnsiCharArray(const Str: string; var Arr: array of AnsiChar);
  function formatDMS_long(const x: double): string;
  function formatDMS_latt(const y: double): string;

  procedure SplitDegreeMinuteSecond(const dd: double; var d, m, s: double);


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

  C_Personel_Weight = 0.08; //ton

  CKEY1 = 53761;
  CKEY2 = 32618;


implementation

uses
  Math, SysUtils;


function AnsiCharArrayToString(const Arr: array of AnsiChar): string;
var
  Len: Integer;
begin
  Len := 0;
  while (Len < Length(Arr)) and (Arr[Len] <> #0) do
    Inc(Len);

  SetString(Result, PAnsiChar(@Arr[0]), Len);
end;


procedure StringToAnsiCharArray(const Str: string; var Arr: array of AnsiChar);
begin
  Move(Str[1], Arr[0], Length(Str) * SizeOf(AnsiChar));
end;

procedure StringToFixedLengthAnsiCharArray(const Str: string; var Arr: array of AnsiChar);
var
  Len: Integer;
begin
  Len := Length(Str);

  if Len > 60 then
    Len := 60;

  Move(Str[1], Arr[0], Len * SizeOf(AnsiChar));
  FillChar(Arr[Len], (60 - Len) * SizeOf(AnsiChar), 0);
end;



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

//==============================================================================
function ValidateDegree(const degreeOrg: double): double;
begin
  result := degreeOrg - (Floor(degreeOrg / 360.0) * 360.0);
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

//==============================================================================

end.
