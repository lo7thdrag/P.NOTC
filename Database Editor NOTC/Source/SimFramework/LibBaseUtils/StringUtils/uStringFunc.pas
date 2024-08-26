unit uStringFunc;

interface

  function SeparateString(const s: string; del: char; var s1, s2: string): boolean;

  function ConvertStringToFloat(const s: string): double;
  function ConvertStringToInt(const s: string): integer;

  function LimitStr(const sNew: string; const sz: Byte=16): string;
  function MakeValidIdent(var Ident: string): Boolean;



implementation

{uses
  FAstMove;
}

uses
  SysUtils;

function SeparateString(const s: string; del: char; var s1, s2: string): boolean;
  // left and right part must exist.
var
  i, l: integer;
begin
  result := false;
  l := Length(s);
  i := Pos(del, s);
  if (l < 2) or (i < 1) then exit;

  s1 := Copy(s, 1, i - 1);
  s2 := Copy(s, i + 1, l - i);

  s1 := Trim(s1);
  s2 := Trim(s2);
  result := (s1 <> '') and (s2 <> '');

end;
{
function SaferStrToFloat(const s: string): Double;
var
  fs: TFormatSettings;
begin
  Result := 0.0;
  fs.DecimalSeparator := '.';
  try
    result := StrToFloat(s, fs);
  except
    on EConvertError do begin
      fs.DecimalSeparator := ',';
      try
        result := StrToFloat(s, fs);
      except
        on EConvertError do
          Result := 0.0;
      end;
    end;
  end;
end;
}
{function IsValidFloat(const s: string): boolean;
const CNum = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      CSign = ['+', '-'];
var l, dotCount: Integer;

begin
  result := false;
  l := Length(s);

  if l = 0 then Exit;

  if l = 1 then begin
     Result := s[1] in CNum;
  end
  else
  if l = 2 then begin
     Result := ( s[2] in CNum) and ((s[1] in CSign) or (s[2] in CNum))
  end;
  if l > 2 then begin

  end;
end;

function IsValidInteger(const s: string): boolean;
begin
  result := false;

end;
}

function ConvertStringToFloat(const s: string): double;
var
  numChar, SignChar: set of Char;
  numPoint: integer;
  i, max: integer;
  str: string;
  valid: boolean;
  fs: TFormatSettings;
begin
  result := 0.0;
  str := trim(s);
  max := Length(str);
  if max < 1 then exit;

  numChar := ['.', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  SignChar := ['-', '+'];

  if CharInSet(str[1],SignChar)then begin
  //if str[1] in SignChar then begin
    valid := max > 1;
    i := 2;
  end
  else begin
    valid := TRUE;
    i := 1;
  end;
  numPoint := 0;
  while valid and (i <= max) do begin
    valid := valid and (CharInSet(str[i],numChar));
    if str[i] = '.' then inc(numPoint);
    inc(i);
  end;
  if valid and (numPoint < 2) then begin
    fs.DecimalSeparator := '.';
    result := StrToFloat(str, fs);
  end;
end;

function ConvertStringToInt(const s: string): integer;
var
  numChar, SignChar: set of Char;
  i, max: integer;
  str: string;
  valid: boolean;
begin
  result := 0;
  str := trim(s);
  max := Length(str);
  if max < 1 then exit;

  numChar := ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  SignChar := ['-', '+'];

  if CharInSet(str[1],SignChar) then begin
    valid := max > 1;
    i := 2;
  end
  else begin
    valid := TRUE;
    i := 1;
  end;

  while valid and (i <= max) do begin
    valid := valid and (CharInSet(str[i],numChar));
    inc(i);
  end;

  if valid then
    result := StrToInt(str);
end;

function LimitStr(const sNew: string; const sz: Byte=16): string;
begin
  if Length(sNew) >= sz then
    result  := Copy(sNew, 1, sz)
  else
    Result  := sNew;
end;

function MakeValidIdent(var Ident: string): Boolean;
const
  Alpha = ['A'..'Z', 'a'..'z', '_'];
  AlphaNumeric = Alpha + ['0'..'9'];
var
  I: Integer;
begin
  Result := False;
  if (Length(Ident) = 0) or not (CharInSet(Ident[1],Alpha)) then Exit;
  for I := 2 to Length(Ident) do
   if not (CharInSet(Ident[I],AlphaNumeric)) then Ident[I] := '_';

  Result := True;
end;

end.
