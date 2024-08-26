unit uCameraData;

interface

  function FormatDMS_Long(const aX: Double): string;
  function FormatDMS_Latt(const aY: Double): string;
  function FormatDM_Long(const aX: Double): string;
  function FormatDM_Latt(const aY: Double): string;

  procedure SplitDegreeMinuteSecond(const aLL: Double; var d, m, s: Double);
  procedure SplitDegreeMinute(const aLL: Double; var d, m: Double);

implementation

uses
  SysUtils;

function FormatDMS_Long(const aX: Double): string;
var
  absLongLat, degree, minute, second : Double;
begin
  absLongLat := Abs(aX);

  if absLongLat > 180.0 then
    absLongLat := 180.0;

  SplitDegreeMinuteSecond(absLongLat, degree, minute, second);

  Result := FormatFloat('000', degree) + '° ' +
    FormatFloat('00', minute) + ''' ' +
    FormatFloat('00.0', second) + '"';

  if aX < 0 then
    Result := Result + 'W'
  else
    Result := Result + 'E'
end;

function FormatDMS_Latt(const aY: Double): string;
var
  absLongLat, degree, minute, second : Double;
begin
  absLongLat := Abs(aY);

  if absLongLat > 90.0 then
    absLongLat := 90.0;

  SplitDegreeMinuteSecond(absLongLat, degree, minute, second);

  Result := FormatFloat('00', degree) + '° ' +
    FormatFloat('00', minute) + ''' ' +
    FormatFloat('00.0', second) + '" ';

  if aY < 0 then
    Result := Result + 'S'
  else
    Result := Result + 'N';
end;

function FormatDM_Long(const aX: Double): string;
var
  absLongLat, degree, minute : Double;
begin
  absLongLat := Abs(aX);

  if absLongLat > 180.0 then
    absLongLat := 180.0;

  SplitDegreeMinute(absLongLat, Degree, Minute);

  Result := FormatFloat('000', Degree) + '° ' +
    FormatFloat('00.000', Minute) + ''' ';

  if aX < 0 then
    Result := Result + 'W'
  else
    Result := Result + 'E'
end;

function FormatDM_Latt(const aY: Double): string;
var
  absLongLat, degree, minute : Double;
begin
  absLongLat := Abs(aY);

  if absLongLat > 90.0 then
    absLongLat := 90.0;

  SplitDegreeMinute(absLongLat, Degree, Minute);

  Result := FormatFloat('000', Degree) + '° ' +
    FormatFloat('00.000', Minute) + ''' ';

  if aY < 0 then
    Result := Result + 'S'
  else
    Result := Result + 'N';
end;

procedure SplitDegreeMinuteSecond(const aLL: Double; var d, m, s: Double);
var
  minSec: Double;
begin
  d := Trunc(aLL);
  minSec := Frac(aLL) * 60.0;
  m := Trunc(minSec);
  s := Frac(minSec) * 60.0;
end;

procedure SplitDegreeMinute(const aLL: Double; var d, m: Double);
var
  minSec: Double;
begin
  d := Trunc(aLL);
  minSec := Frac(aLL) * 60.0;
  m := minSec;
end;

end.
