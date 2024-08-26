unit uT3SonarCD;

interface

uses Classes, SysUtils;

type
  { class for sonar curve definition }
  TT3Sonar_Curve_Def = class
  private
    lDefinition : TList;
  public
    constructor Create;
    destructor Destroy; override;

    function getProbDetection(aSNRRatio : double) : double;
    function getSNRRatio(aProb : double) : double;
    function getMaxSNRRatio : double;
    procedure addData(aSNRRatio, aProb : double);
  end;

implementation

type
  TSNRCurveItem = record
    ProbOfDetection : double;
    SNRRatio : double;
  end;

function Interpolate (aX, aX1, aY1, aX2, aY2 : double ) : double;
begin
  result := (((aX - aX1) * aY2) + ((aX2 - aX) * aY1)) / (aX2 - aX1);
end;

{ TT3Sonar_Curve_Def }

procedure TT3Sonar_Curve_Def.addData(aSNRRatio, aProb: double);
var
  pNew,pItem : ^TSNRCurveItem;
  i : integer;
begin
  New(pNew);
  pNew^.SNRRatio := aSNRRatio;
  pNew^.ProbOfDetection := aProb;

  if lDefinition.Count = 0 then lDefinition.Add(pNew);

  for I := 0 to lDefinition.Count - 1 do begin
    pItem := lDefinition.Items[i];

    if (pNew^.SNRRatio > pItem^.SNRRatio)  then begin
      lDefinition.Insert(lDefinition.Count,pNew);
      break;
    end;
  end;
end;

constructor TT3Sonar_Curve_Def.Create;
begin
  lDefinition := TList.Create;
end;

destructor TT3Sonar_Curve_Def.Destroy;
var
  pItem : ^TSNRCurveItem;
  i : integer;
begin
  for i := lDefinition.Count - 1 downto 0 do begin
    pitem := lDefinition.Items[i];
    Dispose(pItem);
  end;

  lDefinition.Free;
end;

function TT3Sonar_Curve_Def.getMaxSNRRatio: double;
var
  i : integer;
  pItem : ^TSNRCurveItem;
  ratio : double;
begin
  ratio := 0;
  for i := 0 to lDefinition.Count - 1 do begin
    pitem := lDefinition.Items[i];

    if ratio < pitem^.SNRRatio then ratio := pitem^.SNRRatio;
  end;

  result := ratio;
end;

function TT3Sonar_Curve_Def.getProbDetection(aSNRRatio: double): double;
var
  i : integer;
  pItem, pItem2 : ^TSNRCurveItem;
  found : Boolean;
begin
  result := 0;
  found := False;
  pitem := nil;

  for i := 0 to lDefinition.Count - 1 do
  begin
    pitem := lDefinition.Items[i];
    found := False;

    if aSNRRatio > pitem^.SNRRatio then
      continue
    else
    begin
      found := True;
      break;
    end;
  end;

  if lDefinition.Count = 1 then
    raise Exception.Create('Curve Definition only have 1 data.');

  if found then
  begin
    if (i = 0) or (i = lDefinition.Count - 1) then
    begin
      if Assigned(pitem) then
        result := pitem^.ProbOfDetection ;
    end
    else
    begin
      pItem2 := lDefinition.Items[i-1];

      if Assigned(pitem) then
        result := Interpolate(aSNRRatio, pItem2^.SNRRatio,
                              pItem2^.ProbOfDetection,
                              pItem^.SNRRatio, pItem^.ProbOfDetection)
    end;
  end
  else
  begin
    pItem2 := lDefinition.Items[lDefinition.Count - 1];
    Result := pItem2.ProbOfDetection;
  end;
end;

function TT3Sonar_Curve_Def.getSNRRatio(aProb: double): double;
var
  i : integer;
  pItem, pItem2 : ^TSNRCurveItem;
begin
  result := 0;
  pitem := nil;

  for i := 0 to lDefinition.Count - 1 do
  begin
    pitem := lDefinition.Items[i];
    if aProb > pitem^.ProbOfDetection then
      continue
    else
      break;
  end;

  if lDefinition.Count = 1 then
    raise Exception.Create('Curve Definition only have 1 data.');

  if (i = 0) or (i = lDefinition.Count - 1) then
  begin
    if Assigned(pitem) then
      result := pitem^.SNRRatio;
  end
  else
  begin
    pItem2 := lDefinition.Items[i-1];

    if Assigned(pitem) then
      result := Interpolate(aProb,pItem2^.ProbOfDetection,pItem2^.SNRRatio,
                            pItem^.ProbOfDetection,pItem^.SNRRatio);
  end;
end;

end.
