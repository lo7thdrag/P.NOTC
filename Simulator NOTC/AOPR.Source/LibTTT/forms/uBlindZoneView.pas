unit uBlindZoneView;

interface

uses
  Windows, SysUtils, Classes, Controls, Graphics;

type

  TZoneSector = class
  private
    FRSize : integer;
    FCt, FPt : TPoint;
    FPt3, FPt4:  TPoint;

  private
    FDegree: double;
    FHalfAngleWidth: double;
    FStartAngle,
    FEndAngle      : double;

    function getDegree(const Index: Integer): double;
    procedure setDegree(const Index: Integer; const Value: double);

    function getAngle(const Index: Integer): double;
    procedure setAngle(const Index: Integer; const Value: double);

    procedure UpdateDegree; // by center and width;

  public
    constructor Create;
    procedure Draw(aCnv: TCanvas; const r: TRect);

  public
    property Degree: double     index 1 read getDegree write setDegree;   //CenterDegree
    property AngleWidth: double index 2 read getDegree write setDegree;

    property StartAngle: double index 1 read getAngle write setAngle;
    property EndAngle: double   index 2 read getAngle write setAngle;

  end;

  TBlindZoneView = class(TGraphicControl)
  private
    FVisible: boolean;
    FEnableDrag: boolean;
    FOnZoneChange: TNotifyEvent;
    function getZoneCount: integer;

    function getSectorAtDegree(const d: double): TZoneSector;
  protected
    FRSize: integer;
    FPt: TPoint;
    FDRect : TRect;
    FDrag  : boolean;
    FDragZone : TZoneSector;
//    FOnDegreeChange: TNotifyEvent;

    FZoneList : TList;
    FZone  : TZoneSector;


    procedure Resize; override;
    procedure SetSize;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;

  published


  public
    { Public declarations }
    constructor Create(aOwner: TComponent);
    destructor Destroy; override;

    procedure Paint; override;

    function AddZone: TZoneSector;
    procedure DeleteZone(const i: integer);
    procedure ClearZone;

    function GetZone(i: integer): TZoneSector;
    property Zones[i: integer]:TZoneSector read getZone;

{    property OnDegreeChange: TNotifyEvent read FOnDegreeChange
      write FOnDegreeChange;
}
    property OnClick;
    property Visible: boolean read FVisible write FVisible;
    property Count: integer read getZoneCount;

    property EnableDrag: boolean read FEnableDrag write FEnableDrag;
    property OnZoneChange: TNotifyEvent read FOnZoneChange write FOnZoneChange;


  end;

//procedure Register;

implementation
{
procedure Register;
begin
  RegisterComponents('Samples', [TRotWheel]);
end;
}
{ TRotWheel }

uses
  Math;

const
    C_Pi   = Pi;
    C_2Pi = 2.0 * C_Pi;

function ConvertDegree(const s: double): double;
begin
  result := 90.0 - s;
  if result < 0 then
    result := result + 360.0;
end;

function ValidateRadiant(const aRad: double): double;
// make sure result is in 0.. 2Pi;
begin
  result := aRad - (Floor(aRad / C_2Pi)* C_2Pi);
end;

function ValidateDegree(const degreeOrg: double): double;
begin
  result := degreeOrg - (Floor(degreeOrg / 360.0)* 360.0);
end;

function IsClockWise(const d1, d2: double): boolean;
// coord cartesian, radian
// return true is d2 is clockwise from d1
var d3: double;
begin
  d3 := ValidateRadiant(d2 - d1);
  result := (d3 - C_Pi) > 0.0;
end;

//==============================================================================

constructor TZoneSector.Create;
begin
  inherited;
  AngleWidth  := 60.0;
  Degree      := 0.0;

end;

function TZoneSector.getDegree(const Index: Integer): double;
begin
  case index of
    1: result := ConvertDegree(RadToDeg(FDegree));
    2: result := RadToDeg( 2.0 *  FHalfAngleWidth);
  end;
end;


procedure TZoneSector.setDegree(const Index: Integer; const Value: double);
begin
  case index of
    1: FDegree :=  DegToRad(ConvertDegree(Value));
    2: FHalfAngleWidth := DegToRad(0.5 * abs(Value));
  end;

  FStartAngle := FDegree + FHalfAngleWidth;
  FEndAngle   := FDegree - FHalfAngleWidth;

  UpdateDegree;
end;

procedure TZoneSector.UpdateDegree;
var sn, cs : extended;
    d1, d2, d3: extended;
begin
  SinCos(FDegree, sn, cs);

  FPt.X := FCt.X +  Round((FRSize ) * cs);
  FPt.Y := FCt.Y -  Round((FRSize ) * sn);

  d2 := FStartAngle;
  d1 := FEndAngle;

  SinCos(d1, sn, cs);
  FPt3.X := FCt.X +  Round((FRSize ) * cs);
  FPt3.Y := FCt.Y -  Round((FRSize ) * sn);

  SinCos(d2, sn, cs);
  FPt4.X := FCt.X +  Round((FRSize ) * cs);
  FPt4.Y := FCt.Y -  Round((FRSize ) * sn);


{  if Assigned(FOnDegreeChange) then
    FOnDegreeChange(self);}
end;


function TZoneSector.getAngle(const Index: Integer): double;
begin
  case Index of
    1: result := ConvertDegree(ValidateDegree(RadToDeg(FStartAngle)));
    2: result := ConvertDegree(ValidateDegree(RadToDeg(FEndAngle)));
  end;
end;

procedure TZoneSector.setAngle(const Index: Integer;
  const Value: double);
var r, d: double;
begin

  case Index of
    1: begin
      d := EndAngle - Value;
      if d < 0 then
        d := d + 360.0;
      d := 0.5 * d;
      FHalfAngleWidth   := DegToRad( d);

      FDegree := DegToRad(90.0 - (Value + d));
      FStartAngle := FDegree + FHalfAngleWidth;
    end;

    2: begin
      d := Value - StartAngle;
      if d < 0 then
        d := d + 360.0;
      d := 0.5 * d;

      FHalfAngleWidth   := DegToRad( d);
      FDegree           := DegToRad(90.0 - (StartAngle + d));

      FEndAngle   := FDegree - FHalfAngleWidth;
    end;
  end;

  UpdateDegree;

{  if Assigned(FOnDegreeChange) then
    FOnDegreeChange(self);      }
end;


procedure TZoneSector.Draw(aCnv: TCanvas; const r: TRect);
begin
  with aCnv do begin
    Brush.Color := clBtnShadow;
    if FHalfAngleWidth > 0 then
    Pie(r.Left, r.Top, r.Right, r.Bottom,
               FPt3.X, FPt3.Y, FPt4.X,  FPt4.Y );

    MoveTo(FCt.X, FCt.Y);
    LineTo(FPt.X, FPt.Y);
  end;
end;


procedure TBlindZoneView.SetSize;
var i: integer;
    z: TZoneSector;
begin
  Fpt.X :=  (BoundsRect.Left + BoundsRect.Right  ) div 2;
  Fpt.Y :=  (BoundsRect.Top  + BoundsRect.Bottom ) div 2;

  FRSize := (Min(Width, Height) - 2 ) div 2;

  FDRect.Left   := Fpt.X - FrSize;
  FDRect.Right  := Fpt.X + FrSize;
  FDRect.Top    := Fpt.Y - FrSize;
  FDRect.Bottom := Fpt.Y + FrSize;

  for i := 0 to FZoneList.Count-1 do begin
    z := FZoneList[i];
    z.FRSize := FRSize;
    z.FCt := Fpt;
  end;
  Repaint;

end;

constructor TBlindZoneView.Create(aOwner: TComponent);
begin
  inherited;
  FVisible  := true;
  FZoneList := TList.Create;
end;

destructor TBlindZoneView.Destroy;
var i: integer;
    z: TZoneSector;
begin
  for i := 0 to FZoneList.Count-1 do begin
    z := FZoneList[i];
    z.Free;
  end;
  FZoneList.Clear;
  FZoneList.Free;

  inherited;
end;

procedure TBlindZoneView.Resize;
begin
  inherited;

  SetSize;
end;

procedure TBlindZoneView.Paint;
var i: integer;
    z: TZoneSector;
begin
  inherited;
  if not Visible  then exit;

  Canvas.Brush.Color := clBtnFace;
  Canvas.Ellipse(FDRect);

  for i := 0 to FZoneList.Count-1 do begin
    z := FZoneList[i];
    z.Draw(Canvas, FDRect);
  end;

end;

function TBlindZoneView.AddZone: TZoneSector;
begin
  FZone := TZoneSector.Create;
  FZone.FRSize  := FRSize;
  FZone.FCt     := Fpt;
  FZone.Degree     := 0;
  FZone.AngleWidth := 0;

  FZoneList.Add(FZone);
  result := FZone;
  Repaint;
end;

function TBlindZoneView.GetZone(i: integer): TZoneSector;
begin
  result := nil;
  if (i >= 0) and (i < FZoneList.Count) then begin
    result := FZoneList[i];
  end;
end;

function TBlindZoneView.getZoneCount: integer;
begin
  result := FZoneList.Count;
end;

procedure TBlindZoneView.DeleteZone(const i: integer);
var z: TZoneSector;
begin
  if (i >= 0) and (i < FZoneList.Count) then begin
    z := FZoneList[i];
    z.Free;
    FZoneList.Delete(i);
    Repaint;
  end;
end;

procedure TBlindZoneView.ClearZone;
var i: integer;
    z: TZoneSector;
begin
  for i := FZoneList.Count-1 downto 0 do begin
    z := FZoneList[i];
    z.Free;
    FZoneList.Delete(i);
  end;
  Repaint;
end;

function TBlindZoneView.getSectorAtDegree(const d: double): TZoneSector;
var i: integer;
    z: TZoneSector;
    f: boolean;
    zDif : double;
begin
  f := false;
  i := 0;
  while not f and (i < FZoneList.Count) do begin
    z := FZoneList[i];

    zDif := abs(z.Degree - d);
    f := (zDif < 5) or (zDif > 355);

    inc(i);
  end;
  if f then
    result := z
  else
    result := nil;


end;


procedure TBlindZoneView.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var sx, sy: integer;
    dist, degree: double;
begin
  if not FEnableDrag then exit;

  sx := X - FPt.X;
  sy := Y - FPt.Y;

  dist := Sqrt(sx * sx + sy * sy);
  FDrag :=  dist < FRSize;

  if FDrag then begin
    degree := ConvertDegree(RadToDeg(ArcTan2(-sy, sx)));
    FDragZone := getSectorAtDegree(degree);

    FDrag := FDragZone <> nil;

  end;


  inherited;
end;

procedure TBlindZoneView.MouseMove(Shift: TShiftState; X, Y: Integer);
var sx, sy: integer;
    d : double;
begin
  if not FEnableDrag then exit;

  if FDrag and (FDragZone <> nil) then begin

    sx := X - FPt.X;
    sy := Y - FPt.Y;
    d := ConvertDegree(RadToDeg(ArcTan2(-sy, sx)));
    FDragZone.Degree  := d;

    if Assigned(FOnZoneChange) then
      FOnZoneChange(FDragZone);

    Repaint;
  end;

  inherited;
end;

procedure TBlindZoneView.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if not FEnableDrag then exit;

  FDrag := false;
  FDragZone := nil;

  inherited;
end;


end.
