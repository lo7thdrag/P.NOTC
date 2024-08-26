unit uDynamicOverlay;

interface

uses
  Windows, Graphics, Math,SysUtils, Classes,
  uT3Unit, uBaseCoordSystem, uCoordConvertor, uDataTypes, uGameData_TTT;

type
  TDynamicOverlay = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);
  public
    Parent                : TT3PlatformInstance;
    NameTemplt            : string;
    NoTrack               : Integer;
    Color                 : Integer;
    Rotasi                : Integer;
    Bearing               : string;
    BearingAsli1,
    BearingAsli2,
    RangeAsli1, RangeAsli2: Double;
    isSelected            : Boolean;

    constructor Create(cvt : TCoordConverter); virtual;
    destructor Destroy ; override;
    procedure Draw(aCnv : TCanvas); virtual;
    property Converter : TCoordConverter read FConverter write SetConverter;

  end;

  TDynamicOverText = class(TDynamicOverlay)
  private

  public
    Size            : Byte;
    Word            : string;
    BearingStart,
    RangeStart      : Double;

    constructor Create(cvt : TCoordConverter); override;
    destructor Destroy ; override;
    procedure Draw(aCnv : TCanvas); override;

  end;

  TDynamicOverLine = class(TDynamicOverlay)
  private

  public
    BearingStart,
    BearingEnd,
    RangeStart,
    RangeEnd      : Double;

    constructor Create(cvt : TCoordConverter); override;
    destructor Destroy ; override;
    procedure Draw(aCnv : TCanvas); override;

  end;

  TDynamicOverRectangle = class(TDynamicOverlay)
  private

  public
    RangeKiriAtas, RangeKananAtas,
    RangeKiriBawah, RangeKananBawah,
    BearingKiriAtas, BearingKananAtas,
    BearingKiriBawah, BearingKananBawah,
    BearingParenttoCenter, LengthParentToCenter : Double;

    constructor Create(cvt : TCoordConverter); override;
    destructor Destroy ; override;
    procedure Draw(aCnv : TCanvas); override;

  end;

  TDynamicOverPolygon = class(TDynamicOverlay)
  private

  public
    Vertex : uGameData_TTT.MyArray;
    Count  : Integer;
    RelatifHeadingStart : Double;
    RelatifLengthStart  : Double;
    RelatifHeadingEnd   : Double;
    RelatifLengthEnd    : Double;

    constructor Create(cvt : TCoordConverter); override;
    destructor Destroy ; override;
    procedure Draw(aCnv : TCanvas); override;

  end;

  TDynamicOverTable = class(TDynamicOverlay)
  private

  public
    column, row                         : Integer;
    cellHeight, cellWidth, {angle,}
    RangeKiriAtas, RangeKananAtas,
    RangeKiriBawah, RangeKananBawah,
    BearingKiriAtas, BearingKananAtas,
    BearingKiriBawah, BearingKananBawah : Double;

    constructor Create(cvt : TCoordConverter); override;
    destructor Destroy ; override;
    procedure Draw(aCnv : TCanvas); override;

  end;

  TDynamicOverArc = class(TDynamicOverlay)
  private

  public
    sArcAngle, eArcAngle : Integer;
    ArcRadius : Double;
    constructor Create(cvt : TCoordConverter); override;
    destructor Destroy ; override;
    procedure Draw(aCnv : TCanvas); override;

  end;

  TDynamicOverSector = class(TDynamicOverlay)
  private

  public
    sSecAngle, eSecAngle : Integer;
    SecRadiusIn, SecRadiusOut : Double;
    constructor Create(cvt : TCoordConverter); override;
    destructor Destroy ; override;
    procedure Draw(aCnv : TCanvas); override;

  end;

  TDynamicOverCircle = class(TDynamicOverlay)
  private

  public
    CircleRadius : Double;
    constructor Create(cvt : TCoordConverter); override;
    destructor Destroy ; override;
    procedure Draw(aCnv : TCanvas); override;

  end;

  TDynamicOverEllipse = class(TDynamicOverlay)
  private

  public
    Horizontal, Vertical : Double;
    procedure RotatePts(var pts: array of TPoint;origin: TPoint; radians: single);
    procedure DrawRotatedEllipse(canvas: TCanvas;rec: TRect; degrees: integer);
    constructor Create(cvt : TCoordConverter); override;
    destructor Destroy ; override;
    procedure Draw(aCnv : TCanvas); override;

  end;

implementation

{ TDynamicOverlay }

constructor TDynamicOverlay.create;
begin
  Parent := nil;
  FConverter := cvt;
end;

destructor TDynamicOverlay.destroy;
begin
  inherited;
end;

procedure TDynamicOverlay.Draw(aCnv: TCanvas);
begin

end;

procedure TDynamicOverlay.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

{ TDynamicOverRectangle }

constructor TDynamicOverRectangle.create;
begin
  inherited;

end;

destructor TDynamicOverRectangle.destroy;
begin

  inherited;
end;

procedure TDynamicOverRectangle.Draw(aCnv: TCanvas);
var
  PosX, PosY,

  RelatifHeading,
  RelatifHeading1, RelatifHeading2,
  RelatifHeading3, RelatifHeading4 : Double;

  RecCenter,
  RecPoint1, RecPoint2,
  RecPoint3, RecPoint4  : t2DPoint;

  tRecPoint,
  tRecPoint1,tRecPoint2,
  tRecPoint3,tRecPoint4 : tPoint;

begin
  inherited;

  //Center
  if Bearing = 'R' then
    RelatifHeading := ValidateDegree(Parent.Heading + BearingParenttoCenter)
  else
    RelatifHeading := ValidateDegree(BearingParenttoCenter);
  RangeBearingToCoord(LengthParentToCenter, RelatifHeading, PosX, PosY);
  PosX := PosX + Parent.PosX;
  PosY := PosY + Parent.PosY;
  RecCenter.X := PosX;
  RecCenter.Y := PosY;

  //Point 1
  if Bearing = 'R' then
    RelatifHeading1 := ValidateDegree(Parent.Heading + BearingKiriAtas)
  else
    RelatifHeading1 := ValidateDegree(BearingKiriAtas);
  RangeBearingToCoord(RangeKiriAtas, RelatifHeading1, PosX, PosY);
  RecPoint1.X := PosX + Parent.PosX;
  RecPoint1.Y := PosY + Parent.PosY;

  //Point 2
  if Bearing = 'R' then
    RelatifHeading2 := ValidateDegree(Parent.Heading + BearingKananAtas)
  else
    RelatifHeading2 := ValidateDegree(BearingKananAtas);
  RangeBearingToCoord(RangeKananAtas, RelatifHeading2, PosX, PosY);
  RecPoint2.X := PosX + Parent.PosX;
  RecPoint2.Y := PosY + Parent.PosY;

  //Point 3
  if Bearing = 'R' then
    RelatifHeading3 := ValidateDegree(Parent.Heading + BearingKiriBawah)
  else
    RelatifHeading3 := ValidateDegree(BearingKiriBawah);
  RangeBearingToCoord(RangeKiriBawah, RelatifHeading3, PosX, PosY);
  RecPoint3.X := PosX + Parent.PosX;
  RecPoint3.Y := PosY + Parent.PosY;

  //Point 4
  if Bearing = 'R' then
    RelatifHeading4 := ValidateDegree(Parent.Heading + BearingKananBawah)
  else
    RelatifHeading4 := ValidateDegree(BearingKananBawah);
  RangeBearingToCoord(RangeKananBawah, RelatifHeading4, PosX, PosY);
  RecPoint4.X := PosX + Parent.PosX;
  RecPoint4.Y := PosY + Parent.PosY;

  Converter.ConvertToScreen(RecCenter.X, RecCenter.Y, tRecPoint.X, tRecPoint.Y);
  Converter.ConvertToScreen(RecPoint1.X, RecPoint1.Y, tRecPoint1.X, tRecPoint1.Y);
  Converter.ConvertToScreen(RecPoint2.X, RecPoint2.Y, tRecPoint2.X, tRecPoint2.Y);
  Converter.ConvertToScreen(RecPoint3.X, RecPoint3.Y, tRecPoint3.X, tRecPoint3.Y);
  Converter.ConvertToScreen(RecPoint4.X, RecPoint4.Y, tRecPoint4.X, tRecPoint4.Y);

  with aCnv do
  begin
    if isSelected  then
      Pen.Color:= clWhite
    else
      Pen.Color := Color;

    Pen.Style := psSolid;
    Pen.Width := 1;

    MoveTo(tRecPoint1.X, tRecPoint1.Y);
    LineTo(tRecPoint3.X, tRecPoint3.Y);

    MoveTo(tRecPoint1.X, tRecPoint1.Y);
    LineTo(tRecPoint2.X, tRecPoint2.Y);

    MoveTo(tRecPoint3.X, tRecPoint3.Y);
    LineTo(tRecPoint4.X, tRecPoint4.Y);

    MoveTo(tRecPoint2.X, tRecPoint2.Y);
    LineTo(tRecPoint4.X, tRecPoint4.Y);

    Brush.Style := bsClear;
  end;
end;

{ TDynamicOverArc }

constructor TDynamicOverArc.create;
begin
  inherited;

end;

destructor TDynamicOverArc.destroy;
begin

  inherited;
end;

procedure TDynamicOverArc.Draw(aCnv: TCanvas);
var
  FRects      : TRect;

  r, tdX, tdY : integer;

  dX, dY, PosX, PosY,
  RelatifHeading, RelatifHeading2 : Double;

  RecCenter,
  RecPoint1,
  RecPoint2  :  t2DPoint;

  tRecCenter,
  tRecPoint1,
  tRecPoint2 : tPoint;
begin
  inherited;

 //Center
  if Bearing = 'R' then
    RelatifHeading := ValidateDegree(Parent.Heading + BearingAsli1)
  else
    RelatifHeading := ValidateDegree(BearingAsli1);

  RangeBearingToCoord(RangeAsli1, RelatifHeading, PosX, PosY);
  RecCenter.X := PosX + Parent.PosX;
  RecCenter.Y := PosY + Parent.PosY;

  //Point 1
  if Bearing = 'R' then
    RelatifHeading2 := ValidateDegree(Parent.Heading + eArcAngle)
  else
    RelatifHeading2 := ValidateDegree(eArcAngle);

  RangeBearingToCoord(ArcRadius, RelatifHeading2, PosX, PosY);
  RecPoint1.X := PosX + RecCenter.X;
  RecPoint1.Y := PosY + RecCenter.Y;

  //Point 2
  if Bearing = 'R' then
    RelatifHeading2 := ValidateDegree(Parent.Heading + sArcAngle)
  else
    RelatifHeading2 := ValidateDegree(sArcAngle);

  RangeBearingToCoord(ArcRadius, RelatifHeading2, PosX, PosY);
  RecPoint2.X := PosX + RecCenter.X;
  RecPoint2.Y := PosY + RecCenter.Y;

  dX := RecCenter.X + ArcRadius/60;
  dY := RecCenter.Y;

  Converter.ConvertToScreen(RecCenter.X, RecCenter.Y, tRecCenter.X, tRecCenter.Y);
  Converter.ConvertToScreen(RecPoint1.X, RecPoint1.Y, tRecPoint1.X, tRecPoint1.Y);
  Converter.ConvertToScreen(RecPoint2.X, RecPoint2.Y, tRecPoint2.X, tRecPoint2.Y);
  Converter.ConvertToScreen(dX, dY, tdX, tdY);

  r := Abs(tdX - tRecCenter.X);

  FRects.Top     := tRecCenter.Y - r;
  FRects.Left    := tRecCenter.X - r;
  FRects.Bottom  := tRecCenter.Y + r;
  FRects.Right   := tRecCenter.X + r;

  with aCnv do
  begin
    if isSelected  then
      Pen.Color:= clWhite
    else
      Pen.Color := Color;

    Pen.Style := psSolid;

    Arc(FRects.Left,FRects.Top,FRects.Right,FRects.Bottom,
        Round(tRecPoint2.X),Round(tRecPoint2.Y),
        Round(tRecPoint1.X),Round(tRecPoint1.Y));

    Brush.Style := bsClear;
  end;

end;

{ TDynamicOverLine }

constructor TDynamicOverLine.create;
begin
  inherited;

end;

destructor TDynamicOverLine.destroy;
begin

  inherited;
end;

procedure TDynamicOverLine.Draw(aCnv: TCanvas);
var
  PosX, PosY,
  RelatifHeadingStart, RelatifHeadingEnd : Double;

  RecPoint1,
  RecPoint2 : t2DPoint;

  tRecPoint1,
  tRecPoint2 : tPoint;
begin
  inherited;

  if Bearing = 'R' then
  begin
    RelatifHeadingStart := ValidateDegree(Parent.Heading + BearingStart);
    RelatifHeadingEnd   := ValidateDegree(Parent.Heading + BearingEnd);
  end
  else
  begin
    RelatifHeadingStart := ValidateDegree(BearingStart);
    RelatifHeadingEnd   := ValidateDegree(BearingEnd);
  end;

  //Point 1
  RangeBearingToCoord(RangeStart, RelatifHeadingStart, PosX, PosY);
  RecPoint1.X := PosX + Parent.PosX;
  RecPoint1.Y := PosY + Parent.PosY;

  //Point 2
  RangeBearingToCoord(RangeEnd, RelatifHeadingEnd, PosX, PosY);
  RecPoint2.X := PosX + Parent.PosX;
  RecPoint2.Y := PosY + Parent.PosY;

  Converter.ConvertToScreen(RecPoint1.X, RecPoint1.Y, tRecPoint1.X, tRecPoint1.Y);
  Converter.ConvertToScreen(RecPoint2.X, RecPoint2.Y, tRecPoint2.X, tRecPoint2.Y);

  with aCnv do
  begin
    if isSelected  then
      Pen.Color:= clWhite
    else
      Pen.Color := Color;

    Pen.Style := psSolid;
    Pen.Width := 1;

    MoveTo(tRecPoint1.X, tRecPoint1.Y);
    LineTo(tRecPoint2.X, tRecPoint2.Y);

    Brush.Style := bsClear;
  end;
end;

{ TDynamicOverCircle }

constructor TDynamicOverCircle.create;
begin
  inherited;

end;

destructor TDynamicOverCircle.destroy;
begin

  inherited;
end;

procedure TDynamicOverCircle.Draw(aCnv: TCanvas);
var
  FRects          : TRect;
  r, tdX, tdY     : integer;
  RecCenter       : t2DPoint;
  tRecPoint1      : tPoint;
  dX, dY,
  PosX, PosY,
  RelatifHeading  : Double;


begin
  inherited;

  //Center
  if Bearing = 'R' then
    RelatifHeading := ValidateDegree(Parent.Heading + BearingAsli1)
  else
    RelatifHeading := ValidateDegree(BearingAsli1);
  RangeBearingToCoord(RangeAsli1, RelatifHeading, PosX, PosY);
  RecCenter.X := PosX + Parent.PosX;
  RecCenter.Y := PosY + Parent.PosY;

  dX := RecCenter.X + CircleRadius/60;
  dY := RecCenter.Y;

  Converter.ConvertToScreen(RecCenter.X, RecCenter.Y, tRecPoint1.X, tRecPoint1.Y);
  Converter.ConvertToScreen(dX, dY, tdX, tdY);

  r := Abs(tdX - tRecPoint1.X);

  FRects.Top     := tRecPoint1.Y - r;
  FRects.Left    := tRecPoint1.X - r;
  FRects.Bottom  := tRecPoint1.Y + r;
  FRects.Right   := tRecPoint1.X + r;

  with aCnv do
  begin
    if isSelected  then
      Pen.Color:= clWhite
    else
      Pen.Color := Color;

    Pen.Style := psSolid;

    Ellipse(FRects.Left,FRects.Top,FRects.Right,FRects.Bottom);

    Brush.Style := bsClear;
  end;

end;

{ TDynamicOverEllipse }

constructor TDynamicOverEllipse.create;
begin
  inherited;
end;

destructor TDynamicOverEllipse.destroy;
begin

  inherited;
end;

procedure TDynamicOverEllipse.Draw(aCnv: TCanvas);
var
  FRects              : TRect;
  RecCenter           : t2DPoint;
  tRecCenter          : tPoint;
  r1, r2, tdX, tdY    : integer;
  dX, dY, PosX, PosY,
  RelatifHeading      : Double;

begin
  inherited;
  //Center
  if Bearing = 'R' then
    RelatifHeading := ValidateDegree(Parent.Heading + BearingAsli1)
  else
    RelatifHeading := ValidateDegree(BearingAsli1);

  RangeBearingToCoord(RangeAsli1, RelatifHeading, PosX, PosY);
  RecCenter.X := PosX + Parent.PosX;
  RecCenter.Y := PosY + Parent.PosY;

  dX := RecCenter.X + (Horizontal/2)/60;
  dY := RecCenter.Y + (Vertical/2)/60;

  Converter.ConvertToScreen(RecCenter.X, RecCenter.Y, tRecCenter.X, tRecCenter.Y);
  Converter.ConvertToScreen(dX, dY, tdX, tdY);

  r1 := Abs(tdX - tRecCenter.X);
  r2 := Abs(tdY - tRecCenter.Y);

  FRects.Top     := tRecCenter.Y - r2;
  FRects.Left    := tRecCenter.X - r1;
  FRects.Bottom  := tRecCenter.Y + r2;
  FRects.Right   := tRecCenter.X + r1;

  with aCnv do
  begin
    if isSelected  then
      Pen.Color:= clWhite
    else
      Pen.Color := Color;

    Pen.Style := psSolid;
//    Ellipse(FRects.Left,FRects.Top,FRects.Right,FRects.Bottom);
    DrawRotatedEllipse(aCnv, FRects, Round(Parent.Heading + Rotasi));
    Brush.Style := bsClear;
  end;

end;

procedure TDynamicOverEllipse.DrawRotatedEllipse(canvas: TCanvas; rec: TRect;
  degrees: integer);
const
  //Magic constant = 2/3*(sqrt(2)-1)
  offset_const: single = 0.27614237;
var
  midx, midy, offx, offy: integer;
  pts: array [0..12] of TPoint;
  radians: single;
begin
  degrees := degrees mod 360;
  if degrees < 0 then inc(degrees, 360);
  radians := degrees *pi / 180;

  //if there's no rotation, use the standard Windows function
  if radians = 0 then
    canvas.Ellipse(rec)
  else
  begin
    with rec do
    begin
      dec(right); dec(bottom); //empirically this seems better
      midx := (right + left) div 2;
      midy := (bottom + top) div 2;
      offx := round((right - left) * offset_const);
      offy := round((bottom - top) * offset_const);
      pts[0]  := Point(left, midy);
      pts[1]  := Point(left, midy - offy);
      pts[2]  := Point(midx - offx, top);
      pts[3]  := Point(midx, top);
      pts[4]  := Point(midx + offx, top);
      pts[5]  := Point(right, midy - offy);
      pts[6]  := Point(right, midy);
      pts[7]  := Point(right, midy + offy);
      pts[8]  := Point(midx + offx, bottom);
      pts[9]  := Point(midx, bottom);
      pts[10] := Point(midx - offx, bottom);
      pts[11] := Point(left, midy + offy);
      pts[12] := pts[0];
      //rotate all points about the ellipse center ...
      RotatePts(pts, Point(midx,midy), radians);
    end;
    with canvas do
    begin
      beginPath(Handle);
      canvas.PolyBezier(pts);
      EndPath(Handle);
      if canvas.Brush.Style = bsClear then
        StrokePath(Handle)
      else
        StrokeAndFillPath(Handle);
    end;
  end;
end;

procedure TDynamicOverEllipse.RotatePts(var pts: array of TPoint; origin: TPoint; radians: single);
var
  i,x,y: integer;
  cosAng, sinAng: single;
begin
  cosAng := cos(radians);
  sinAng := sin(radians);
  for i := low(pts) to high(pts) do
  begin
    x := pts[i].X - origin.X;
    y := pts[i].Y - origin.Y;
    pts[i].X := round((x * cosAng) - (y * sinAng)) + origin.X;
    pts[i].Y := round((x * sinAng) + (y * cosAng)) + origin.Y;
  end;
end;

{ TDynamicOverSector }

constructor TDynamicOverSector.create;
begin
  inherited;

end;

destructor TDynamicOverSector.destroy;
begin

  inherited;
end;

procedure TDynamicOverSector.Draw(aCnv: TCanvas);
var
  FRectsIn, FRectsOut : TRect;

  rIn, rOut, tdXIn, tdYIn, tdXOut, tdYOut  : integer;

  dXIn, dYIn, dXOut, dYOut, PosX, PosY,
  RelatifHeading, RelatifHeading2 : Double;

  RecCenter,  RecPoint1, RecPoint2,
  RecPoint3, RecPoint4  :  t2DPoint;

  tRecCenter, tRecPoint1, tRecPoint2,
  tRecPoint3, tRecPoint4 : tPoint;
begin
  inherited;

  //Center
  if Bearing = 'R' then
    RelatifHeading := ValidateDegree(Parent.Heading + BearingAsli1)
  else
    RelatifHeading := ValidateDegree(BearingAsli1);

  RangeBearingToCoord(RangeAsli1, RelatifHeading, PosX, PosY);
  RecCenter.X := PosX + Parent.PosX;
  RecCenter.Y := PosY + Parent.PosY;

  //Point 1
  if Bearing = 'R' then
    RelatifHeading2 := ValidateDegree(Parent.Heading + eSecAngle)
  else
    RelatifHeading2 := ValidateDegree(eSecAngle);
  RangeBearingToCoord(SecRadiusIn, RelatifHeading2, PosX, PosY);
  RecPoint1.X := PosX + RecCenter.X;
  RecPoint1.Y := PosY + RecCenter.Y;

  //Point 2
  if Bearing = 'R' then
    RelatifHeading2 := ValidateDegree(Parent.Heading + sSecAngle)
  else
    RelatifHeading2 := ValidateDegree(sSecAngle);
  RangeBearingToCoord(SecRadiusIn, RelatifHeading2, PosX, PosY);
  RecPoint2.X := PosX + RecCenter.X;
  RecPoint2.Y := PosY + RecCenter.Y;

  //Point 3
  if Bearing = 'R' then
    RelatifHeading2 := ValidateDegree(Parent.Heading + eSecAngle)
  else
    RelatifHeading2 := ValidateDegree(eSecAngle);
  RangeBearingToCoord(SecRadiusOut, RelatifHeading2, PosX, PosY);
  RecPoint3.X := PosX + RecCenter.X;
  RecPoint3.Y := PosY + RecCenter.Y;

  //Point 4
  if Bearing = 'R' then
    RelatifHeading2 := ValidateDegree(Parent.Heading + sSecAngle)
  else
    RelatifHeading2 := ValidateDegree(sSecAngle);
  RangeBearingToCoord(SecRadiusOut, RelatifHeading2, PosX, PosY);
  RecPoint4.X := PosX + RecCenter.X;
  RecPoint4.Y := PosY + RecCenter.Y;

  dXIn := RecCenter.X + SecRadiusIn/60;
  dYIn := RecCenter.Y;
  dXOut := RecCenter.X + SecRadiusOut/60;
  dYOut := RecCenter.Y;

  Converter.ConvertToScreen(RecCenter.X, RecCenter.Y, tRecCenter.X, tRecCenter.Y);
  Converter.ConvertToScreen(RecPoint1.X, RecPoint1.Y, tRecPoint1.X, tRecPoint1.Y);
  Converter.ConvertToScreen(RecPoint2.X, RecPoint2.Y, tRecPoint2.X, tRecPoint2.Y);
  Converter.ConvertToScreen(RecPoint3.X, RecPoint3.Y, tRecPoint3.X, tRecPoint3.Y);
  Converter.ConvertToScreen(RecPoint4.X, RecPoint4.Y, tRecPoint4.X, tRecPoint4.Y);
  Converter.ConvertToScreen(dXIn, dYIn, tdXIn, tdYIn);
  Converter.ConvertToScreen(dXOut, dYOut, tdXOut, tdYOut);

  rIn  := Abs(tdXIn - tRecCenter.X);
  rOut := Abs(tdXOut - tRecCenter.X);

  FRectsIn.Top     := tRecCenter.Y - rIn;
  FRectsIn.Left    := tRecCenter.X - rIn;
  FRectsIn.Bottom  := tRecCenter.Y + rIn;
  FRectsIn.Right   := tRecCenter.X + rIn;

  FRectsOut.Top     := tRecCenter.Y - rOut;
  FRectsOut.Left    := tRecCenter.X - rOut;
  FRectsOut.Bottom  := tRecCenter.Y + rOut;
  FRectsOut.Right   := tRecCenter.X + rOut;

  with aCnv do
  begin
    if isSelected  then
      Pen.Color:= clWhite
    else
      Pen.Color := Color;

    Pen.Style := psSolid;

    MoveTo(tRecPoint3.X, tRecPoint3.Y);
    LineTo(tRecPoint1.X, tRecPoint1.Y);

    MoveTo(tRecPoint2.X, tRecPoint2.Y);
    LineTo(tRecPoint4.X, tRecPoint4.Y);

    Arc(FRectsIn.Left,FRectsIn.Top,FRectsIn.Right,FRectsIn.Bottom,
        Round(tRecPoint2.X),Round(tRecPoint2.Y),
        Round(tRecPoint1.X),Round(tRecPoint1.Y));
    Arc(FRectsOut.Left,FRectsOut.Top,FRectsOut.Right,FRectsOut.Bottom,
        Round(tRecPoint4.X),Round(tRecPoint4.Y),
        Round(tRecPoint3.X),Round(tRecPoint3.Y));

    Brush.Style := bsClear;
  end;

end;

{ TDynamicOverText }

constructor TDynamicOverText.create;
begin
  inherited;
end;

destructor TDynamicOverText.destroy;
begin

  inherited;
end;

procedure TDynamicOverText.Draw(aCnv: TCanvas);
var
  PosX, PosY,
  RelatifHeading : Double;

  RecPoint1  :  t2DPoint;
  tRecPoint1 : tPoint;
begin
  inherited;

  //Sudut Kiri Atas Teks
  if Bearing = 'R' then
    RelatifHeading := ValidateDegree(Parent.Heading + BearingStart)
  else
    RelatifHeading := ValidateDegree(BearingStart);

  RangeBearingToCoord(RangeStart, RelatifHeading, PosX, PosY);
  RecPoint1.X := PosX + Parent.PosX;
  RecPoint1.Y := PosY + Parent.PosY;

  Converter.ConvertToScreen(RecPoint1.X, RecPoint1.Y, tRecPoint1.X, tRecPoint1.Y);

  with aCnv do
  begin
    if isSelected  then
      Font.Color:= clWhite
    else
      Font.Color:= Color;
    Font.Size := Size;
    TextOut(tRecPoint1.X, tRecPoint1.Y, Word);
    Font.Size := 10;
    Brush.Style := bsClear;
  end;

end;

{ TDynamicOverTable }

constructor TDynamicOverTable.create;
begin
  inherited;

end;

destructor TDynamicOverTable.destroy;
begin

  inherited;
end;

procedure TDynamicOverTable.Draw(aCnv: TCanvas);
var
  i : Integer;

  TempX,TempY, PosX, PosY,
  ParentPosX, ParentPosY,

  RelatifHeading,
  RelatifHeading1, RelatifHeading2,
  RelatifHeading3, RelatifHeading4,

  RelatifHeadingRec1, RelatifLengthRec1,
  RelatifHeadingRec2, RelatifLengthRec2,
  RelatifHeadingRec3, RelatifLengthRec3,
  RelatifHeadingRec4, RelatifLengthRec4  : Double;

  RecCenter,
  RowPoint1, RowPoint2,
  RowPoint3, RowPoint4,
  ColPoint1, ColPoint2,
  ColPoint3, ColPoint4 : t2DPoint;

  tRecCenter,
  tRecPoint1,tRecPoint2,
  tRecPoint3,tRecPoint4 : tPoint;
begin
  inherited;

  ParentPosX := Parent.PosX;
  ParentPosY := Parent.PosY;

  //Center
  if Bearing = 'R' then
    RelatifHeading := ValidateDegree(Parent.Heading + BearingAsli1)
  else
    RelatifHeading := ValidateDegree(BearingAsli1);
  RangeBearingToCoord(RangeAsli1, RelatifHeading, PosX, PosY);
  PosX := PosX + ParentPosX;
  PosY := PosY + ParentPosY;
  RecCenter.X := PosX;
  RecCenter.Y := PosY;

  //Point 1
  if Bearing = 'R' then
    RelatifHeading1 := ValidateDegree(Parent.Heading + BearingKiriAtas)
  else
    RelatifHeading1 := ValidateDegree(BearingKiriAtas);
  RangeBearingToCoord(RangeKiriAtas, RelatifHeading1, PosX, PosY);
  PosX := PosX + ParentPosX;
  PosY := PosY + ParentPosY;
  RowPoint1.X := PosX;
  RowPoint1.Y := PosY;
  ColPoint1.X := PosX;
  ColPoint1.Y := PosY;

  //Point 2
  if Bearing = 'R' then
    RelatifHeading2 := ValidateDegree(Parent.Heading + BearingKananAtas)
  else
    RelatifHeading2 := ValidateDegree(BearingKananAtas);
  RangeBearingToCoord(RangeKananAtas, RelatifHeading2, PosX, PosY);
  PosX := PosX + ParentPosX;
  PosY := PosY + ParentPosY;
  RowPoint2.X := PosX;
  RowPoint2.Y := PosY;
  ColPoint2.X := PosX;
  ColPoint2.Y := PosY;

  //Point 3
  if Bearing = 'R' then
    RelatifHeading3 := ValidateDegree(Parent.Heading + BearingKiriBawah)
  else
    RelatifHeading3 := ValidateDegree(BearingKiriBawah);
  RangeBearingToCoord(RangeKiriBawah, RelatifHeading3, PosX, PosY);
  PosX := PosX + ParentPosX;
  PosY := PosY + ParentPosY;
  RowPoint3.X := PosX;
  RowPoint3.Y := PosY;
  ColPoint3.X := PosX;
  ColPoint3.Y := PosY;

  //Point 4
  if Bearing = 'R' then
    RelatifHeading4 := ValidateDegree(Parent.Heading + BearingKananBawah)
  else
    RelatifHeading4 := ValidateDegree(BearingKananBawah);
  RangeBearingToCoord(RangeKananBawah, RelatifHeading4, PosX, PosY);
  PosX := PosX + ParentPosX;
  PosY := PosY + ParentPosY;
  RowPoint4.X := PosX;
  RowPoint4.Y := PosY;
  ColPoint4.X := PosX;
  ColPoint4.Y := PosY;

  Converter.ConvertToScreen(RecCenter.X, RecCenter.Y, tRecCenter.X, tRecCenter.Y);
  Converter.ConvertToScreen(RowPoint1.X, RowPoint1.Y, tRecPoint1.X, tRecPoint1.Y);
  Converter.ConvertToScreen(RowPoint2.X, RowPoint2.Y, tRecPoint2.X, tRecPoint2.Y);
  Converter.ConvertToScreen(RowPoint3.X, RowPoint3.Y, tRecPoint3.X, tRecPoint3.Y);
  Converter.ConvertToScreen(RowPoint4.X, RowPoint4.Y, tRecPoint4.X, tRecPoint4.Y);

  with aCnv do
  begin
    if isSelected  then
      Pen.Color:= clWhite
    else
      Pen.Color := Color;

    Pen.Style := psSolid;
    Pen.Width := 1;

    MoveTo(tRecPoint1.X, tRecPoint1.Y);
    LineTo(tRecPoint2.X, tRecPoint2.Y);

//    Pen.Color := clGreen;
//    MoveTo(tRecPoint1.X, tRecPoint1.Y);
//      LineTo(tRecPoint3.X, tRecPoint3.Y);

//      Pen.Color := clBlue;
//      MoveTo(tRecPoint3.X, tRecPoint3.Y);
//      LineTo(tRecPoint4.X, tRecPoint4.Y);

//      Pen.Color := clRed;
//      MoveTo(tRecPoint2.X, tRecPoint2.Y);
//      LineTo(tRecPoint4.X, tRecPoint4.Y);

    Brush.Style := bsClear;
  end;

  for i := 1 to row do  // loop for baris
  begin
    //Point 3
    TempX := RowPoint1.X;
    TempY := RowPoint1.Y - (cellHeight/60);

    RelatifHeadingRec1 := CalcBearing(RowPoint1.X, RowPoint1.Y, TempX, TempY);
    RelatifLengthRec1  := CalcRange(RowPoint1.X, RowPoint1.Y, TempX, TempY);

    if Bearing = 'R' then
      RelatifHeading := ValidateDegree(Parent.Heading + RelatifHeadingRec1 + Rotasi)
    else
      RelatifHeading := ValidateDegree(RelatifHeadingRec1 + Rotasi);
    RangeBearingToCoord(RelatifLengthRec1, RelatifHeading, PosX, PosY);
    RowPoint3.X := PosX + RowPoint1.X;
    RowPoint3.Y := PosY + RowPoint1.Y;

    //Point 4
    TempX := RowPoint2.X;
    TempY := RowPoint2.Y - (cellHeight/60);

    RelatifHeadingRec2 := CalcBearing(RowPoint2.X, RowPoint2.Y, TempX, TempY);
    RelatifLengthRec2  := CalcRange(RowPoint2.X, RowPoint2.Y, TempX, TempY);

    if Bearing = 'R' then
      RelatifHeading := ValidateDegree(Parent.Heading + RelatifHeadingRec2 + Rotasi)
    else
      RelatifHeading := ValidateDegree(RelatifHeadingRec2 + Rotasi);
    RangeBearingToCoord(RelatifLengthRec2, RelatifHeading, PosX, PosY);
    RowPoint4.X := PosX + RowPoint2.X;
    RowPoint4.Y := PosY + RowPoint2.Y;

    Converter.ConvertToScreen(RowPoint1.X, RowPoint1.Y, tRecPoint1.X, tRecPoint1.Y);
    Converter.ConvertToScreen(RowPoint2.X, RowPoint2.Y, tRecPoint2.X, tRecPoint2.Y);
    Converter.ConvertToScreen(RowPoint3.X, RowPoint3.Y, tRecPoint3.X, tRecPoint3.Y);
    Converter.ConvertToScreen(RowPoint4.X, RowPoint4.Y, tRecPoint4.X, tRecPoint4.Y);

    with aCnv do
    begin
      if isSelected  then
        Pen.Color:= clWhite
      else
        Pen.Color := Color;

      Pen.Style := psSolid;
      Pen.Width := 1;

      MoveTo(tRecPoint1.X, tRecPoint1.Y);
      LineTo(tRecPoint3.X, tRecPoint3.Y);

      MoveTo(tRecPoint3.X, tRecPoint3.Y);
      LineTo(tRecPoint4.X, tRecPoint4.Y);

      MoveTo(tRecPoint2.X, tRecPoint2.Y);
      LineTo(tRecPoint4.X, tRecPoint4.Y);

      Brush.Style := bsClear;
    end;

    RowPoint1.X := RowPoint3.X;
    RowPoint1.Y := RowPoint3.Y;
    RowPoint2.X := RowPoint4.X;
    RowPoint2.Y := RowPoint4.Y;
  end;

  for i := 1 to column do // loop for kolom
  begin
    //Point 2
    TempX := ColPoint1.X + (cellWidth/60);
    TempY := ColPoint1.Y;

    RelatifHeadingRec2 := CalcBearing(ColPoint1.X, ColPoint1.Y, TempX, TempY);
    RelatifLengthRec2  := CalcRange(ColPoint1.X, ColPoint1.Y, TempX, TempY);

    if Bearing = 'R' then
      RelatifHeading := ValidateDegree(Parent.Heading + RelatifHeadingRec2 + Rotasi)
    else
      RelatifHeading := ValidateDegree(RelatifHeadingRec2 + Rotasi);
    RangeBearingToCoord(RelatifLengthRec2, RelatifHeading, PosX, PosY);
    ColPoint2.X := PosX + ColPoint1.X;
    ColPoint2.Y := PosY + ColPoint1.Y;

    //Point 4
    TempX := ColPoint3.X + (cellWidth/60);
    TempY := ColPoint3.Y;

    RelatifHeadingRec4 := CalcBearing(ColPoint3.X, ColPoint3.Y, TempX, TempY);
    RelatifLengthRec4  := CalcRange(ColPoint3.X, ColPoint3.Y, TempX, TempY);

    if Bearing = 'R' then
      RelatifHeading := ValidateDegree(Parent.Heading + RelatifHeadingRec4 + Rotasi)
    else
      RelatifHeading := ValidateDegree(RelatifHeadingRec4 + Rotasi);
    RangeBearingToCoord(RelatifLengthRec4, RelatifHeading, PosX, PosY);
    ColPoint4.X := PosX + ColPoint3.X;
    ColPoint4.Y := PosY + ColPoint3.Y;

    Converter.ConvertToScreen(ColPoint1.X, ColPoint1.Y, tRecPoint1.X, tRecPoint1.Y);
    Converter.ConvertToScreen(ColPoint2.X, ColPoint2.Y, tRecPoint2.X, tRecPoint2.Y);
    Converter.ConvertToScreen(ColPoint3.X, ColPoint3.Y, tRecPoint3.X, tRecPoint3.Y);
    Converter.ConvertToScreen(ColPoint4.X, ColPoint4.Y, tRecPoint4.X, tRecPoint4.Y);

    with aCnv do
    begin
      if isSelected  then
        Pen.Color:= clWhite
      else
        Pen.Color := Color;

      Pen.Style := psSolid;
      Pen.Width := 1;

      MoveTo(tRecPoint1.X, tRecPoint1.Y);
      LineTo(tRecPoint2.X, tRecPoint2.Y);

      MoveTo(tRecPoint2.X, tRecPoint2.Y);
      LineTo(tRecPoint4.X, tRecPoint4.Y);

      MoveTo(tRecPoint3.X, tRecPoint3.Y);
      LineTo(tRecPoint4.X, tRecPoint4.Y);

      Brush.Style := bsClear;
    end;

    ColPoint1.X := ColPoint2.X;
    ColPoint1.Y := ColPoint2.Y;
    ColPoint3.X := ColPoint4.X;
    ColPoint3.Y := ColPoint4.Y;
  end;

end;

{ TDynamicOverPolygon }

constructor TDynamicOverPolygon.create;
begin
  inherited;

end;

destructor TDynamicOverPolygon.destroy;
begin

  inherited;
end;

procedure TDynamicOverPolygon.Draw(aCnv: TCanvas);
var
  PosX, PosY : Double;

  RecPoint,
  RecPoint1,
  RecPoint2 : t2DPoint;

  tRecPoint1,
  tRecPoint2 : tPoint;

  i : Integer;
begin
  inherited;

  if Bearing = 'R' then
    RelatifHeadingStart := ValidateDegree(Parent.Heading + Vertex[0,2])
  else
    RelatifHeadingStart := ValidateDegree(Vertex[0,2]);

  // Titik awal
  RangeBearingToCoord(Vertex[0,1], RelatifHeadingStart, PosX, PosY);
  RecPoint.X := PosX + Parent.PosX;
  RecPoint.Y := PosY + Parent.PosY;
  RecPoint1.X := PosX + Parent.PosX;
  RecPoint1.Y := PosY + Parent.PosY;

  for i := 1 to Count - 1 do
  begin
    //Titik Selanjutnya
    if Bearing = 'R' then
      RelatifHeadingStart := ValidateDegree(Parent.Heading + Vertex[i,2])
    else
      RelatifHeadingStart := ValidateDegree(Vertex[i,2]);

    RangeBearingToCoord(Vertex[i,1], RelatifHeadingStart, PosX, PosY);
    RecPoint2.X := PosX + Parent.PosX;
    RecPoint2.Y := PosY + Parent.PosY;

    Converter.ConvertToScreen(RecPoint1.X, RecPoint1.Y, tRecPoint1.X, tRecPoint1.Y);
    Converter.ConvertToScreen(RecPoint2.X, RecPoint2.Y, tRecPoint2.X, tRecPoint2.Y);

    with aCnv do
    begin
      if isSelected  then
        Pen.Color:= clWhite
      else
        Pen.Color := Color;

      Pen.Style := psSolid;
      Pen.Width := 1;

      MoveTo(tRecPoint1.X, tRecPoint1.Y);
      LineTo(tRecPoint2.X, tRecPoint2.Y);

      Brush.Style := bsClear;
    end;

    RecPoint1.X := RecPoint2.X;
    RecPoint1.Y := RecPoint2.Y;
  end;

  Converter.ConvertToScreen(RecPoint1.X, RecPoint1.Y, tRecPoint1.X, tRecPoint1.Y);
  Converter.ConvertToScreen(RecPoint.X, RecPoint.Y, tRecPoint2.X, tRecPoint2.Y);

  with aCnv do
  begin
    if isSelected  then
      Pen.Color:= clWhite
    else
      Pen.Color := Color;

    Pen.Style := psSolid;
    Pen.Width := 1;

    MoveTo(tRecPoint1.X, tRecPoint1.Y);
    LineTo(tRecPoint2.X, tRecPoint2.Y);

    Brush.Style := bsClear;
  end;
end;

end.
