unit uDBAsset_Capability;

interface

uses
  tttData,Classes, System.Types,
  System.UITypes,
  Vcl.Graphics,
  Math, WinApi.Windows, uDataTypes;

type
  TTransport = class
  public
     FData : TRecTransport ;
     procedure Clone(obj : TTransport);
  end;
  TPolygon = array of t2DPoint;

  // ------------------------------------------------------------------------------
  TMyShape = class
  private
    FCenter: t2DPoint;
    FWidth, FHeight, FVelocity, FIndex, FIDMemberShip: Integer;
    FHeading, FAngleRad, FCosAngle, FSinAngle, FTurnRate, FTargetHeading: Double; // Controls how fast the object
    FColor: TColor;
    FBorderColor: TColor;
    FNameMemberShip, FClassMemberShip, FStateMemberShip: string;

    procedure SetCenterX(AValue: Integer);
    procedure SetCenterY(AValue: Integer);
    function GetCenterX: Integer;
    function GetCenterY: Integer;

  public
    ShapePolygon: TPolygon;

    constructor Create(Width, Height, Velocity, X, Y: Integer; Heading: Double);
    destructor Destroy; override;

    procedure DefinePolygon;
    procedure Draw(ACanvas: TCanvas);

    function isPointInside(APoint: TPoint): Boolean;
    function isCollideWithBorder(BorderRect: TRect; var posTepi: Integer): Boolean;
    function isCollideWithAnotherPolygon(AnotherPolygon: TPolygon): Boolean;

    property Center: t2DPoint read FCenter write FCenter;
    property X: Integer read GetCenterX write SetCenterX;
    property Y: Integer read GetCenterY write SetCenterY;
    property Width: Integer read FWidth write FWidth;
    property Height: Integer read FHeight write FHeight;

    property Velocity: Integer read FVelocity write FVelocity;
    property Heading: Double read FHeading write FHeading;

    property AngleRad: Double read FAngleRad write FAngleRad;
    property CosAngle: Double read FCosAngle write FCosAngle;
    property SinAngle: Double read FSinAngle write FSinAngle;
    property TurnRate: Double read FTurnRate write FTurnRate;
    property TargetHeading: Double read FTargetHeading write FTargetHeading;

    property Index: Integer read FIndex write FIndex;
    property IDMemberShip: Integer read FIDMemberShip write FIDMemberShip;
    property NameMemberShip: string read FNameMemberShip write FNameMemberShip;
    property ClassMemberShip: string read FClassMemberShip write FClassMemberShip;
    property StateMemberShip: string read FStateMemberShip write FStateMemberShip;

    property Color: TColor read FColor write FColor;
    property BorderColor: TColor read FBorderColor write FBorderColor;
  end;

  // ------------------------------------------------------------------------------

  function Point2D(APoint: TPoint): t2DPoint; overload;
  function Point2D(X, Y: Integer): t2DPoint; overload;
  function Point2DToPoint(APoint: t2DPoint): TPoint;

  function RotatePointAroundAPoint(APoint: t2DPoint; Center: t2DPoint; CosVal, SinVal: Double): t2DPoint;
  function PointInPolygon(const p: t2DPoint; const polygon: array of t2DPoint): Boolean;
  function PointInsideScreenBounds(Point: t2DPoint; ScreenRect: TRect): Boolean;
  function PolygonsCollide(Polygon1, Polygon2: TPolygon): Boolean;
  function PolygonCollidesWithScreenBounds(Polygon: TPolygon; ScreenRect: TRect; var posTepi: Integer): Boolean;
  function CalculateEdgeNormal(A, B: t2DPoint): t2DPoint;
  function DotProduct(A, B: t2DPoint): Double;

  procedure ProjectPolygon(Polygon: TPolygon; Axis: t2DPoint; out Min, Max: Double);

implementation

{ TCapability_Charateristics }

procedure TTransport.Clone(obj: TTransport);
begin
  obj.FData := FData;
end;

{ TMyShape }

constructor TMyShape.Create(Width, Height, Velocity, X, Y: Integer; Heading: Double);
begin
  inherited Create;
  SetLength(ShapePolygon, 5);

  //Init Object properties
  FWidth := Width;
  FHeight := Height;

  FCenter.X := X;
  FCenter.Y := Y;

  FVelocity := Velocity;
  FHeading := Heading;
  FTargetHeading := Heading;
  FTurnRate := 3.0;

  FAngleRad:= DegToRad(90 - FHeading);
  FCosAngle:= Cos(FAngleRad);
  FSinAngle:= Sin(FAngleRad);

  DefinePolygon; // Set the polygon points

  FBorderColor := clBlue;
  FColor := clBlue;
//  FColor := RGB(Random(256), Random(256), Random(256));
end;

procedure TMyShape.DefinePolygon;
var
  i: Integer;
begin
  ShapePolygon[0].X:= Center.X - FHeight div 2;
  ShapePolygon[0].Y:= Center.Y - FWidth div 2;

  ShapePolygon[1].X:= (Center.X + FHeight div 2) - (FHeight div 4);
  ShapePolygon[1].Y:= Center.Y - FWidth div 2;

  ShapePolygon[2].X:= Center.X + FHeight div 2; // titik depan spawn bawah
  ShapePolygon[2].Y:= Center.Y;

  ShapePolygon[3].X:= (Center.X + FHeight div 2) - (FHeight div 4);
  ShapePolygon[3].Y:= Center.Y + FWidth div 2;

  ShapePolygon[4].X:= Center.X - FHeight div 2;
  ShapePolygon[4].Y:= Center.Y + FWidth div 2;

  for i := Low(ShapePolygon) to High(ShapePolygon) do
  begin
    ShapePolygon[i]:= RotatePointAroundAPoint(ShapePolygon[i], FCenter, FCosAngle, FSinAngle);
  end;
end;

destructor TMyShape.Destroy;
begin
  SetLength(ShapePolygon, 0);
  inherited;
end;

procedure TMyShape.SetCenterX(AValue: Integer);
begin
  FCenter.X:= AValue;
end;

procedure TMyShape.SetCenterY(AValue: Integer);
begin
  FCenter.Y:= AValue;
end;

function TMyShape.GetCenterX: Integer;
begin
  Result:= Round(FCenter.X);
end;

function TMyShape.GetCenterY: Integer;
begin
  Result:= Round(FCenter.Y);
end;

function TMyShape.isPointInside(APoint: TPoint): Boolean;
begin
  Result:= PointInPolygon(Point2D(APoint), ShapePolygon);
end;

function TMyShape.isCollideWithBorder(BorderRect: TRect; var posTepi: Integer): Boolean;
begin
  Result:= PolygonCollidesWithScreenBounds(ShapePolygon, BorderRect, posTepi);
end;

function TMyShape.isCollideWithAnotherPolygon(AnotherPolygon: TPolygon): Boolean;
begin
  Result:= PolygonsCollide(ShapePolygon, AnotherPolygon);
end;

procedure TMyShape.Draw(ACanvas: TCanvas);
var
  randomColor: TColor;
  ap2: array[0..4] of TPoint;
  i: Integer;
begin
  ACanvas.Pen.Color := FBorderColor;
  ACanvas.Pen.Width := 3;

  { random warna shape }
  ACanvas.Brush.Color := FColor;
  ACanvas.Brush.Style := bsSolid;

  DefinePolygon;

  for i := Low(ShapePolygon) to High(ShapePolygon) do
  begin
    ap2[i].X:= Round(ShapePolygon[i].X);
    ap2[i].Y:= Round(ShapePolygon[i].Y);
  end;

  ACanvas.Polygon(ap2);
end;

function Point2D(APoint: TPoint): t2DPoint;
begin
  Result.X:= APoint.X;
  Result.Y:= APoint.Y;
end;

function Point2D(X, Y: Integer): t2DPoint;
begin
  Result.X:= X;
  Result.Y:= Y;
end;

function Point2DToPoint(APoint: t2DPoint): TPoint;
begin
  Result.X:= Round(APoint.X);
  Result.Y:= Round(APoint.Y);
end;

function RotatePointAroundAPoint(APoint: t2DPoint; Center: t2DPoint; CosVal, SinVal: Double): t2DPoint;
var
  TempPoint: t2DPoint;
  RotatedPoint: t2DPoint;
begin
  // Step 1
  TempPoint.X := APoint.X - Center.X;
  TempPoint.Y := APoint.Y - Center.Y;
  // Step 2
  RotatedPoint.X := Round(TempPoint.X * CosVal + TempPoint.Y * SinVal);
  RotatedPoint.Y := Round(TempPoint.Y * CosVal - TempPoint.X * SinVal);
  // Step 3
  Result.X := RotatedPoint.X + Center.X;
  Result.Y := RotatedPoint.Y + Center.Y;
end;

{ dari isPointInside, function untuk
    cek apakah titik object ada di
      titik Polygon pertama }
function PointInPolygon(const p: t2DPoint; const polygon: array of t2DPoint): Boolean;
var
  isInside: Boolean;
  minX, maxX, minY, maxY: Double;
  n, i, j: Integer;
  q: t2DPoint;
  delta: Double;
begin
  minX := polygon[0].X;
  maxX := polygon[0].X;
  minY := polygon[0].Y;
  maxY := polygon[0].Y;

  for n := 1 to High(polygon) do
  begin
    q := polygon[n];
    minX := Min(q.X, minX);
    maxX := Max(q.X, maxX);
    minY := Min(q.Y, minY);
    maxY := Max(q.Y, maxY);
  end;

  if (p.X < minX) or (p.X > maxX) or (p.Y < minY) or (p.Y > maxY) then
  begin
    Result := False;
    Exit;
  end;

  isInside := True;

  j := High(polygon);
  for i := 0 to High(polygon) do
  begin
    delta:= (polygon[j].Y- polygon[i].Y);
    if (delta <> 0) then
    begin
      if (polygon[i].Y > p.Y) <> (polygon[j].Y > p.Y) and
         (p.X < (polygon[j].X - polygon[i].X) *
         (p.Y - polygon[i].Y) / delta + polygon[i].X) then
      begin
        isInside := not isInside;
      end;
    end
    else begin
      if (polygon[i].Y > p.Y) <> (polygon[j].Y > p.Y) and
         (p.X < (polygon[j].X - polygon[i].X) *
         (p.Y - polygon[i].Y) + polygon[i].X) then
      begin
        isInside := not isInside;
      end;
    end;
    j := i;
  end;

  Result := isInside;
end;

{ calculate the dot product of two vectors as needed in your collision detection code }
function DotProduct(A, B: t2DPoint): Double;
begin
  Result := A.X * B.X + A.Y * B.Y;
end;

{ project a polygon onto an axis (represented by a normal vector) and return the minimum and maximum projection values }
procedure ProjectPolygon(Polygon: TPolygon; Axis: t2DPoint; out Min, Max: Double);
var
  DotProductVal: Double;
  Point: t2DPoint;
  i: Integer;
begin
  Min := DotProduct(Polygon[0], Axis);
  Max := Min;

  for i := 1 to High(Polygon) do
  begin
    DotProductVal := DotProduct(Polygon[i], Axis);
    if DotProductVal < Min then
      Min := DotProductVal
    else if DotProductVal > Max then
      Max := DotProductVal;
  end;
end;

{ function to calculate the normal vector of an edge.
    The normal vector is perpendicular to the edge
        and is needed for the SAT method }
function CalculateEdgeNormal(A, B: t2DPoint): t2DPoint;
begin
  Result.X := B.Y - A.Y;
  Result.Y := A.X - B.X;
end;

{ check collision antar Polygon }
function PolygonsCollide(Polygon1, Polygon2: TPolygon): Boolean;
var
  EdgeNormals1, EdgeNormals2: array of t2DPoint;
  i, j: Integer;
  Min1, Max1, Min2, Max2: Double;
begin
  Result:= False;
  // Calculate the edge normals for both polygons
  SetLength(EdgeNormals1, Length(Polygon1));
  SetLength(EdgeNormals2, Length(Polygon2));

  for i := 0 to High(Polygon1) do
    EdgeNormals1[i] := CalculateEdgeNormal(Polygon1[i], Polygon1[(i + 1) mod Length(Polygon1)]);

  for i := 0 to High(Polygon2) do
    EdgeNormals2[i] := CalculateEdgeNormal(Polygon2[i], Polygon2[(i + 1) mod Length(Polygon2)]);

  // Check for overlap on each axis
  for i := 0 to High(EdgeNormals1) do
  begin
    ProjectPolygon(Polygon1, EdgeNormals1[i], Min1, Max1);
    ProjectPolygon(Polygon2, EdgeNormals1[i], Min2, Max2);

    if (Max1 < Min2) or (Max2 < Min1) then
      Exit(False);
  end;

  for i := 0 to High(EdgeNormals2) do
  begin
    ProjectPolygon(Polygon1, EdgeNormals2[i], Min1, Max1);
    ProjectPolygon(Polygon2, EdgeNormals2[i], Min2, Max2);

    if (Max1 < Min2) or (Max2 < Min1) then
      Exit(False);
  end;

  // If no separating axis is found, the polygons are colliding
  Result := True;
end;

{ function to check if a point is inside the screen boundaries }
function PointInsideScreenBounds(Point: t2DPoint; ScreenRect: TRect): Boolean;
begin
  Result := (Point.X >= ScreenRect.Left) and (Point.X <= ScreenRect.Right) and
            (Point.Y >= ScreenRect.Top) and (Point.Y <= ScreenRect.Bottom);
end;

{ function to check if a line segment intersects with the screen boundaries }
function LineIntersectsScreenBounds(Point1, Point2: t2DPoint; ScreenRect: TRect; var posTepi: Integer): Boolean;
begin
  Result := ((Point1.X < ScreenRect.Left) and (Point2.X > ScreenRect.Left)) or
            ((Point1.X > ScreenRect.Left) and (Point2.X < ScreenRect.Left)) or
            ((Point1.X < ScreenRect.Right) and (Point2.X > ScreenRect.Right)) or
            ((Point1.X > ScreenRect.Right) and (Point2.X < ScreenRect.Right)) or
            ((Point1.Y < ScreenRect.Top) and (Point2.Y > ScreenRect.Top)) or
            ((Point1.Y > ScreenRect.Top) and (Point2.Y < ScreenRect.Top)) or
            ((Point1.Y < ScreenRect.Bottom) and (Point2.Y > ScreenRect.Bottom)) or
            ((Point1.Y > ScreenRect.Bottom) and (Point2.Y < ScreenRect.Bottom));

  if (Point2.Y <= ScreenRect.Top) then
    posTepi := 0 //atas
  else if (Point2.X >= ScreenRect.Right) then
    posTepi := 1 // kanan
  else if (Point2.Y >= ScreenRect.Bottom) then
    posTepi := 2 //bawah
  else if (Point2.X <= ScreenRect.Left) then
    posTepi := 3 //kiri
end;

{ check collision sama Form Border }
{ function to check if a polygon is colliding with the screen borders by checking each of its edges }
function PolygonCollidesWithScreenBounds(Polygon: TPolygon; ScreenRect: TRect; var posTepi: Integer): Boolean;
var
  i: Integer;
begin
  for i := 0 to High(Polygon) do
  begin
    if LineIntersectsScreenBounds(Polygon[i], Polygon[(i + 1) mod Length(Polygon)], ScreenRect, posTepi) then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

end.
