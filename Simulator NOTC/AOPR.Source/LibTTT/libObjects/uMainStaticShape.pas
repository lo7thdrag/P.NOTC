 unit uMainStaticShape;

interface

uses
  {MapXLib_TLB,} Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin, uRecord, uFormula,
  OleCtrls, uMapXHandler, uCoordConvertor, uGameData_TTT, uBaseCoordSystem, uLibSettingTTT,
  tttData, {TeCanvas,} ColorGrd, uDataTypes, uBaseShape, uSnapshotData;

type

  TMainStaticShape = class(TBaseShape)
  private
    FShapeType : Integer;
    FColor: Integer;
    FSelected: Boolean;
    FConverter: TCoordConverter;
    FColorFill: Integer;
    FLineType: TPenStyle;
    FWeight: Integer;
    FBrushStyle: TBrushStyle;

    procedure SetColor(const Value: Integer);

    procedure SetSelected(const Value: Boolean);
    procedure SetConverter(const Value: TCoordConverter); protected

    procedure SetColorFill(const Value: Integer);
    procedure SetLineType(const Value: TPenStyle);
    procedure SetWeight(const Value: Integer); protected

  public
    FFormula : TFormula;
    isReposOverlay : Boolean;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    function GetSnapshotData : _SS_TMainStaticShape; virtual;

    procedure Clear;
    procedure Draw(aCnv: TCanvas); virtual;
    procedure normalized(aCnv : TCanvas);

    property ShapeType : Integer read FShapeType write FShapeType;
    property Color : Integer read FColor write SetColor;
    property isSelected : Boolean read FSelected write SetSelected;
    property Converter : TCoordConverter read FConverter write SetConverter;
    property ColorFill : Integer read FColorFill write SetColorFill;
    property LineType : TPenStyle read FLineType write SetLineType;
    property Weight : Integer read FWeight write SetWeight;
    property BrushStyle : TBrushStyle read FBrushStyle write FBrushStyle;

  end;

  TTextStatic = class(TMainStaticShape)
  public
    postStart : t2DPoint;
    size : Integer;
    words : String;

    procedure Draw(aCnv: TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    function GetSnapshotData : _SS_TMainStaticShape; override;
  end;

  TLineStatic = class(TMainStaticShape)
  public
    postStart : t2DPoint;
    postEnd : t2DPoint;

    procedure Draw(aCnv: TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    function GetSnapshotData : _SS_TMainStaticShape; override;
  end;

  TRectangleStatic = class(TMainStaticShape)
  public
    postStart : t2DPoint;
    postEnd : t2DPoint;

    procedure Draw(aCnv: TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    function GetSnapshotData : _SS_TMainStaticShape; override;
  end;

  TCircleStatic = class(TMainStaticShape)
  public
    postCenter : t2DPoint;
    radius : Double;

    procedure Draw(aCnv: TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    function GetSnapshotData : _SS_TMainStaticShape; override;
  end;

  TEllipseStatic = class(TMainStaticShape)
  public
    postCenter : t2DPoint;
    Hradius, Vradius : Double;

    procedure Draw(aCnv: TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    function GetSnapshotData : _SS_TMainStaticShape; override;
  end;

  TArcStatic = class(TMainStaticShape)
  public
    postCenter : t2DPoint;
    radius : Double;
    StartAngle, EndAngle : Integer;

    procedure Draw(aCnv: TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    function GetSnapshotData : _SS_TMainStaticShape; override;
  end;

  TSectorStatic = class(TMainStaticShape)
  public
    postCenter : t2DPoint;
    Oradius, Iradius : Double;
    StartAngle, EndAngle : Integer;

    procedure Draw(aCnv: TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    function GetSnapshotData : _SS_TMainStaticShape; override;
  end;

  TGridStatic = class(TMainStaticShape)
  public
    postCenter : t2DPoint;
    HCount, WCount, Rotation : Integer;
    Height, Width : Double;

    procedure Draw(aCnv: TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    function GetSnapshotData : _SS_TMainStaticShape; override;
  end;

  TPolygonStatic = class(TMainStaticShape)
  public
    polyList : TList;

    procedure Draw(aCnv: TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    function GetSnapshotData : _SS_TMainStaticShape; override;
  end;

  TDotStatic = class
  public
    X, Y : Double;
    constructor Create;
    destructor Destroy; override;
  end;

  TFlagPoint = class
  private
    FPointId : Integer;
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  public
    Post : t2DPoint;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy;
    procedure Draw(aCnv : TCanvas);

    property PointId : Integer read FPointId write FPointId;
    property Converter : TCoordConverter read FConverter write SetConverter;
  end;

implementation

{ TMainShape }

procedure TMainStaticShape.Clear;
begin

end;

constructor TMainStaticShape.Create(cvt: TCoordConverter);
begin
  FConverter := cvt;
end;

destructor TMainStaticShape.Destroy;
begin

  inherited;
end;

procedure TMainStaticShape.Draw(aCnv: TCanvas);
begin

end;

function TMainStaticShape.GetSnapshotData: _SS_TMainStaticShape;
var
  SS : _SS_TMainStaticShape;
begin
  SS.color := FColor;
  SS.ColorFill := FColorFill;
  SS.LineType := FLineType;
  SS.Weight := FWeight;
  SS.BrushStyle := FBrushStyle;

  Result := SS;
end;

procedure TMainStaticShape.normalized(aCnv: TCanvas);
begin
  with aCnv do
  begin
    Pen.Color := clBlack;
    Pen.Width := 1;
    Pen.Style := psSolid;
  end;
end;

procedure TMainStaticShape.SetColor(const Value: Integer);
begin
  FColor := Value;
end;

procedure TMainStaticShape.SetColorFill(const Value: Integer);
begin
  FColorFill := Value;
end;

procedure TMainStaticShape.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

procedure TMainStaticShape.SetLineType(const Value: TPenStyle);
begin
  FLineType := Value;
end;

procedure TMainStaticShape.SetSelected(const Value: Boolean);
begin
  FSelected := Value;
end;

procedure TMainStaticShape.SetWeight(const Value: Integer);
begin
  FWeight := Value;
end;

{ TTextShape }

constructor TTextStatic.Create(cvt : TCoordConverter);
begin
  inherited;

  FShapeType := ovText;
end;

destructor TTextStatic.Destroy;
begin

  inherited;
end;

procedure TTextStatic.Draw(aCnv: TCanvas);
var
  sx, sy: Integer;
begin
  inherited;

  with aCnv do
  begin
    Converter.ConvertToScreen(postStart.X, postStart.Y, sx, sy);

    Brush.Style := bsClear;

    Font.Color := Color;
    Font.Size := size;

    if isSelected then
     Font.Color  := clWhite;

    TextOut(sx, sy, words);

    {font dinormalkan lagi}
    Font.Size := 10;
  end;
end;

function TTextStatic.GetSnapshotData: _SS_TMainStaticShape;
var
  SS : _SS_TMainStaticShape;
begin
  SS := inherited;

  SS.ShapeType := FShapeType;
  SS.postStart := postStart;
  SS.size := size;
  SS.words := words;

  Result := SS;
end;

{ TLineShape }

constructor TLineStatic.Create(cvt: TCoordConverter);
begin
  inherited;
  FShapeType := ovLine;
end;

destructor TLineStatic.Destroy;
begin
  inherited;
end;

procedure TLineStatic.Draw(aCnv: TCanvas);
var
  sx, sy, ex, ey: Integer;
begin
  inherited;

  Converter.ConvertToScreen(postStart.X, postStart.Y, sx, sy);
  Converter.ConvertToScreen(postEnd.X, postEnd.Y, ex, ey);

  with aCnv do
  begin
    Brush.Style := bsClear;
    Pen.Width := Weight;
    Pen.Style := LineType;
    Pen.Color := Color;

    if isSelected then
     Pen.color   := clWhite;

    MoveTo(sx, sy);
    LineTo(ex, ey);
  end;
  normalized(aCnv);
end;

function TLineStatic.GetSnapshotData: _SS_TMainStaticShape;
var
  SS : _SS_TMainStaticShape;
begin
  SS := inherited;

  SS.ShapeType := FShapeType;
  SS.postStart := postStart;
  SS.postEnd := postEnd;

  Result := SS;
end;

{ TRectangleShape }

constructor TRectangleStatic.Create(cvt: TCoordConverter);
begin
  inherited;
  FShapeType := ovRectangle;
end;

destructor TRectangleStatic.Destroy;
begin
  inherited;
end;

procedure TRectangleStatic.Draw(aCnv: TCanvas);
var
  sx, sy, ex, ey: Integer;
begin
  inherited;

  Converter.ConvertToScreen(postStart.X, postStart.Y, sx, sy);
  Converter.ConvertToScreen(postEnd.X, postEnd.Y, ex, ey);

  with aCnv do
  begin
    Pen.Color := Color;
    Pen.Width := Weight;
    Pen.Style := LineType;

    if BrushStyle = bsClear then
    begin
      Brush.Style := BrushStyle
    end
    else
    begin
      Brush.Style := BrushStyle;
      Brush.Color := ColorFill;
    end;

    if isSelected then
     Pen.color   := clWhite;

    Rectangle(sx, sy, ex, ey);
  end;
  normalized(aCnv);
end;

function TRectangleStatic.GetSnapshotData: _SS_TMainStaticShape;
var
  SS : _SS_TMainStaticShape;
begin
  SS := inherited;

  SS.ShapeType := FShapeType;
  SS.postStart := postStart;
  SS.postEnd := postEnd;

  Result := SS;
end;

{ TCircleShape }

constructor TCircleStatic.Create(cvt: TCoordConverter);
begin
  inherited;
  FShapeType := ovCircle;
end;

destructor TCircleStatic.Destroy;
begin

  inherited;
end;

procedure TCircleStatic.Draw(aCnv: TCanvas);
var
  cx, cy, ex, ey, r: Integer;
  dx, dy : Double;
  point : TRect;
  bmp : TBitmap;
begin
  inherited;

  dx := postCenter.X + radius/60;
  dy := postCenter.Y;

  Converter.ConvertToScreen(postCenter.X, postCenter.Y, cx, cy);
  Converter.ConvertToScreen(dx, dy, ex, ey);

  r := Abs(cx - ex);

  point.Left    := cx - r;
  point.Top     := cy - r;
  point.Right   := cx + r;
  point.Bottom  := cy + r;

  with aCnv do
  begin
    Brush.Style := bsClear;

    bmp := TBitmap.Create;
    bmp.Transparent := true;
    bmp.LoadFromFile(vSymbolSetting.ImgPath + pctFlagPoint + '.bmp');

    cx := cx - (bmp.Width div 2);
    cy := cy - (bmp.Height div 2);

    Draw(cx, cy, bmp);
    bmp.Free;

    Pen.Color := Color;
    Pen.Width := Weight;
    Pen.Style := LineType;

    if BrushStyle = bsClear then
    begin
      Brush.Style := BrushStyle
    end
    else
    begin
      Brush.Style := BrushStyle;
      Brush.Color := ColorFill;
    end;

    if isSelected then
     Pen.color   := clWhite;

    Ellipse(point.Left, point.Top, point.Right, point.Bottom);

    {untuk menormalkan pen yg tidak diset}
    Pen.Width:=1;
  end;
  normalized(aCnv);
end;

function TCircleStatic.GetSnapshotData: _SS_TMainStaticShape;
var
  SS : _SS_TMainStaticShape;
begin
  SS := inherited;

  SS.ShapeType := FShapeType;
  SS.postStart := postCenter;
  SS.Radius1 := radius;

  Result := SS;
end;

{ TEllipseShape }

constructor TEllipseStatic.Create(cvt: TCoordConverter);
begin
  inherited;
  FShapeType := ovEllipse;
end;

destructor TEllipseStatic.Destroy;
begin

  inherited;
end;

procedure TEllipseStatic.Draw(aCnv: TCanvas);
var
  cx, cy, ex, ey, Hr, Vr: Integer;
  dx, dy : Double;
  point : TRect;
  bmp : TBitmap;
begin
  inherited;

  dx := postCenter.X + Hradius/60;
  dy := postCenter.Y + Vradius/60;

  Converter.ConvertToScreen(postCenter.X, postCenter.Y, cx, cy);
  Converter.ConvertToScreen(dx, dy, ex, ey);

  Hr := Abs(cx - ex);
  Vr := Abs(cy - ey);

  point.Left    := cx - Hr;
  point.Top     := cy - Vr;
  point.Right   := cx + Hr;
  point.Bottom  := cy + Vr;

  with aCnv do
  begin
    Brush.Style := bsClear;

    bmp := TBitmap.Create;
    bmp.Transparent := true;
    bmp.LoadFromFile(vSymbolSetting.ImgPath + pctFlagPoint + '.bmp');

    cx := cx - (bmp.Width div 2);
    cy := cy - (bmp.Height div 2);

    Draw(cx, cy, bmp);
    bmp.Free;

    Pen.Color := Color;
    Pen.Width := Weight;
    Pen.Style := LineType;

    if BrushStyle = bsClear then
    begin
      Brush.Style := BrushStyle
    end
    else
    begin
      Brush.Style := BrushStyle;
      Brush.Color := ColorFill;
    end;

    if isSelected then
     Pen.color   := clWhite;

    Ellipse(point.Left, point.Top, point.Right, point.Bottom);

    {untuk menormalkan pen yg tidak diset}
    Pen.Width:=1;
  end;
  normalized(aCnv);
end;

function TEllipseStatic.GetSnapshotData: _SS_TMainStaticShape;
var
  SS : _SS_TMainStaticShape;
begin
  SS := inherited;

  SS.ShapeType := FShapeType;
  SS.postStart := postCenter;
  SS.Radius1 := Hradius;
  SS.Radius2 := Vradius;

  Result := SS;
end;

{ TArcShape }

constructor TArcStatic.Create(cvt: TCoordConverter);
begin
  inherited;
  FShapeType := ovArc;
end;

destructor TArcStatic.Destroy;
begin

  inherited;
end;

procedure TArcStatic.Draw(aCnv: TCanvas);
var
  cx, cy, sx, sy, ex, ey,
  tx, ty, r: Integer;
  dx, dy : Double;
  StartPoint, EndPoint  :  t2DPoint;
  point : TRect;
  bmp : TBitmap;
begin
  inherited;

  FindPoint(postCenter, StartPoint, radius, StartAngle);  {Start Angle}
  FindPoint(postCenter, EndPoint, radius, EndAngle);      {End Angle}

  dx := postCenter.X + radius/60;
  dy := postCenter.Y ;

  Converter.ConvertToScreen(postCenter.X, postCenter.Y, cx, cy);
  Converter.ConvertToScreen(StartPoint.X, StartPoint.Y, sx, sy);
  Converter.ConvertToScreen(EndPoint.X, EndPoint.Y, ex, ey);

  Converter.ConvertToScreen(dx, dy, tx, ty);
  r := Abs(cx - tx);

  point.Left    := cx - r;
  point.Top     := cy - r;
  point.Right   := cx + r;
  point.Bottom  := cy + r;

  with aCnv do
  begin
    Brush.Style := bsClear;

    bmp := TBitmap.Create;
    bmp.Transparent := true;
    bmp.LoadFromFile(vSymbolSetting.ImgPath + pctFlagPoint + '.bmp');

    cx := cx - (bmp.Width div 2);
    cy := cy - (bmp.Height div 2);

    Draw(cx, cy, bmp);
    bmp.Free;

    Pen.Color := Color;
    Pen.Width := Weight;
    Pen.Style := LineType;

    Brush.Style := bsClear;

    if isSelected then
     Pen.color   := clWhite;

    Arc(point.Left, point.Top, point.Right, point.Bottom, ex, ey, sx, sy);

    {untuk menormalkan pen yg tidak diset}
    Pen.Width:=1;
  end;
  normalized(aCnv);
end;

function TArcStatic.GetSnapshotData: _SS_TMainStaticShape;
var
  SS : _SS_TMainStaticShape;
begin
  SS := inherited;

  SS.ShapeType := FShapeType;
  SS.postStart := postCenter;
  SS.Radius1 := radius;
  SS.StartAngle := StartAngle;
  SS.EndAngle := EndAngle;

  Result := SS;
end;

{ TSectorShape }

constructor TSectorStatic.Create(cvt: TCoordConverter);
begin
  inherited;
  FShapeType := ovSector;
end;

destructor TSectorStatic.Destroy;
begin

  inherited;
end;

procedure TSectorStatic.Draw(aCnv: TCanvas);
var
  cx, cy,
  Isx, Isy, Iex, Iey,
  Osx, Osy, Oex, Oey,
  tx, ty, rIn, rOut  : Integer;
  Idx, Idy, Odx, Ody : Double;
  IStartPoint, IEndPoint : t2DPoint;
  OStartPoint, OEndPoint : t2DPoint;
  Ipoint, Opoint : TRect;
  bmp : TBitmap;
begin
  inherited;

  FindPoint(postCenter, IStartPoint, Iradius, StartAngle);  {Start Angle}
  FindPoint(postCenter, IEndPoint, Iradius, EndAngle);      {End Angle}

  FindPoint(postCenter, OStartPoint, Oradius, StartAngle);  {Start Angle}
  FindPoint(postCenter, OEndPoint, Oradius, EndAngle);      {End Angle}

  Idx := postCenter.X + Iradius/60;
  Idy := postCenter.Y;

  Odx := postCenter.X + Oradius/60;
  Ody := postCenter.Y;

  Converter.ConvertToScreen(postCenter.X, postCenter.Y, cx, cy);
  Converter.ConvertToScreen(IStartPoint.X, IStartPoint.Y, Isx, Isy);
  Converter.ConvertToScreen(IEndPoint.X, IEndPoint.Y, Iex, Iey);
  Converter.ConvertToScreen(Idx, Idy, tx, ty);

  rIn := Abs(cx - tx);
  Ipoint.Left    := cx - rIn;
  Ipoint.Top     := cy - rIn;
  Ipoint.Right   := cx + rIn;
  Ipoint.Bottom  := cy + rIn;

  Converter.ConvertToScreen(OStartPoint.X, OStartPoint.Y, Osx, Osy);
  Converter.ConvertToScreen(OEndPoint.X, OEndPoint.Y, Oex, Oey);
  Converter.ConvertToScreen(Odx, Ody, tx, ty);

  rOut := Abs(cx - tx);
  Opoint.Left    := cx - rOut;
  Opoint.Top     := cy - rOut;
  Opoint.Right   := cx + rOut;
  Opoint.Bottom  := cy + rOut;

  with aCnv do
  begin
    Brush.Style := bsClear;

    bmp := TBitmap.Create;
    bmp.Transparent := true;
    bmp.LoadFromFile(vSymbolSetting.ImgPath + pctFlagPoint + '.bmp');

    cx := cx - (bmp.Width div 2);
    cy := cy - (bmp.Height div 2);

    Draw(cx, cy, bmp);
    bmp.Free;

    Pen.Color := Color;
    Pen.Width := Weight;
    Pen.Style := LineType;

    Brush.Style := bsClear;

    if isSelected then
     Pen.color   := clWhite;

    Arc(Ipoint.Left, Ipoint.Top, Ipoint.Right, Ipoint.Bottom, Iex, Iey, Isx, Isy);
    Arc(Opoint.Left, Opoint.Top, Opoint.Right, Opoint.Bottom, Oex, Oey, Osx, Osy);
    MoveTo(Iex, Iey); LineTo(Oex, Oey);
    MoveTo(Isx, Isy); LineTo(Osx, Osy);

    {untuk menormalkan pen yg tidak diset}
    Pen.Width:=1;
  end;
  normalized(aCnv);
end;

function TSectorStatic.GetSnapshotData: _SS_TMainStaticShape;
var
  SS : _SS_TMainStaticShape;
begin
  SS := inherited;

  SS.ShapeType := FShapeType;
  SS.postStart := postCenter;
  SS.Radius1 := Oradius;
  SS.Radius2 := Iradius;
  SS.StartAngle := StartAngle;
  SS.EndAngle := EndAngle;

  Result := SS;
end;

{ TGridShape }

constructor TGridStatic.Create(cvt: TCoordConverter);
begin
  inherited;
  FShapeType := ovGrid;
end;

destructor TGridStatic.Destroy;
begin

  inherited;
end;

procedure TGridStatic.Draw(aCnv: TCanvas);
var
  i,
  Isx, Isy, Iex, Iey,
  Osx, Osy, Oex, Oey : Integer;

  TempX, TempY,
  Idx, Idy, Odx, Ody : Double;

  IStart, IEnd, OStart, OEnd,
  Row1, Row2, Row3, Row4,
  Col1, Col2, Col3, Col4  : t2DPoint;

  NewBearing, NewRange,
  RKiAts, RKaAts, RKiBwh, RKaBwh,
  BKiAts, BKaAts, BKiBwh, BKaBwh : Double;

begin
  inherited;

  //Point Kiri Atas
  IStart.X := postCenter.X - ((Width/60)*(WCount/2));
  IStart.Y := postCenter.Y + ((Height/60)*(HCount)/2);

  //Point Kanan Atas
  IEnd.X := postCenter.X + ((Width/60)*(WCount/2));
  IEnd.Y := postCenter.Y + ((Height/60)*(HCount)/2);

  //Point Kanan Bawah
  OStart.X := postCenter.X + ((Width/60)*(WCount/2));
  OStart.Y := postCenter.Y - ((Height/60)*(HCount)/2);

  //Point Kiri Bawah
  OEnd.X := postCenter.X - ((Width/60)*(WCount/2));
  OEnd.Y := postCenter.Y - ((Height/60)*(HCount)/2);

  BKiAts   := CalcBearing(postCenter.X, postCenter.Y, IStart.X, IStart.Y);
  BKaAts  := CalcBearing(postCenter.X, postCenter.Y, IEnd.X, IEnd.Y);
  BKaBwh := CalcBearing(postCenter.X, postCenter.Y, OStart.X, OStart.Y);
  BKiBwh  := CalcBearing(postCenter.X, postCenter.Y, OEnd.X, OEnd.Y);

  RKiAts     := CalcRange(postCenter.X, postCenter.Y, IStart.X, IStart.Y);
  RKaAts    := CalcRange(postCenter.X, postCenter.Y, IEnd.X, IEnd.Y);
  RKaBwh   := CalcRange(postCenter.X, postCenter.Y, OStart.X, OStart.Y);
  RKiBwh    := CalcRange(postCenter.X, postCenter.Y, OEnd.X, OEnd.Y);

  FindPoint(postCenter, IStart, RKiAts, BKiAts + Rotation);
  FindPoint(postCenter, IEnd, RKaAts, BKaAts + Rotation);
  FindPoint(postCenter, OStart, RKaBwh, BKaBwh + Rotation);
  FindPoint(postCenter, OEnd, RKiBwh, BKiBwh + Rotation);

  // Point 1
  Row1 := IStart;
  Col1 := IStart;

  // Point 2
  Row2 := IEnd;
  Col2 := IEnd;

  // Point 3
  Row3 := OEnd;
  Col3 := OEnd;

  // Point 4
  Row4 := OStart;
  Col4 := OStart;

  Converter.ConvertToScreen(IStart.X,  IStart.Y,  Isx, Isy);
  Converter.ConvertToScreen(IEnd.X,    IEnd.Y,    Iex, Iey);
  Converter.ConvertToScreen(OStart.X,  OStart.Y,  Osx, Osy);
  Converter.ConvertToScreen(OEnd.X,    OEnd.Y,    Oex, Oey);

  with aCnv do
  begin
    Pen.Color := Color;
    Pen.Width := Weight;
    Pen.Style := LineType;

    Brush.Style := bsClear;

    if isSelected then
     Pen.color   := clWhite;

    MoveTo(Isx, Isy); LineTo(Iex, Iey);
  end;

  for i := 1 to HCount do // loop for baris
  begin
    // Point 3
    TempX := Row1.X;
    TempY := Row1.Y - (Height / 60);

    NewBearing := CalcBearing(Row1.X, Row1.Y, TempX, TempY);
    NewRange := CalcRange(Row1.X, Row1.Y, TempX, TempY);
    FindPoint(Row1, Row3, NewRange, NewBearing + Rotation);

    // Point 4
    TempX := Row2.X;
    TempY := Row2.Y - (Height / 60);

    NewBearing := CalcBearing(Row2.X, Row2.Y, TempX, TempY);
    NewRange := CalcRange(Row2.X, Row2.Y, TempX, TempY);
    FindPoint(Row2, Row4, NewRange, NewBearing + Rotation);

    Converter.ConvertToScreen(Row1.X, Row1.Y, Isx, Isy);
    Converter.ConvertToScreen(Row2.X, Row2.Y, Iex, Iey);
    Converter.ConvertToScreen(Row3.X, Row3.Y, Osx, Osy);
    Converter.ConvertToScreen(Row4.X, Row4.Y, Oex, Oey);

    with aCnv do
    begin
      MoveTo(Isx, Isy); LineTo(Osx, Osy);
      MoveTo(Osx, Osy); LineTo(Oex, Oey);
      MoveTo(Iex, Iey); LineTo(Oex, Oey);
    end;

    Row1.X := Row3.X;
    Row1.Y := Row3.Y;
    Row2.X := Row4.X;
    Row2.Y := Row4.Y;
  end;

  for i := 1 to WCount do // loop for kolom
  begin
    // Point 2
    TempX := Col1.X + (Width / 60);
    TempY := Col1.Y;

    NewBearing := CalcBearing(Col1.X, Col1.Y, TempX, TempY);
    NewRange := CalcRange(Col1.X, Col1.Y, TempX, TempY);
    FindPoint(Col1, Col2, NewRange, NewBearing + Rotation);

    // Point 4
    TempX := Col3.X + (Width / 60);
    TempY := Col3.Y;

    NewBearing := CalcBearing(Col3.X, Col3.Y, TempX, TempY);
    NewRange := CalcRange(Col3.X, Col3.Y, TempX, TempY);
    FindPoint(Col3, Col4, NewRange, NewBearing + Rotation);

    Converter.ConvertToScreen(Col1.X, Col1.Y, Isx, Isy);
    Converter.ConvertToScreen(Col2.X, Col2.Y, Iex, Iey);
    Converter.ConvertToScreen(Col3.X, Col3.Y, Osx, Osy);
    Converter.ConvertToScreen(Col4.X, Col4.Y, Oex, Oey);

    with aCnv do
    begin
      MoveTo(Isx, Isy); LineTo(Iex, Iey);
      MoveTo(Iex, Iey); LineTo(Oex, Oey);
      MoveTo(Osx, Osy); LineTo(Oex, Oey);
    end;

    Col1.X := Col2.X;
    Col1.Y := Col2.Y;
    Col3.X := Col4.X;
    Col3.Y := Col4.Y;
  end;
  normalized(aCnv);
end;

function TGridStatic.GetSnapshotData: _SS_TMainStaticShape;
var
  SS : _SS_TMainStaticShape;
begin
  SS := inherited;

  SS.ShapeType := FShapeType;
  SS.postStart := postCenter;
  SS.Kolom := HCount;
  SS.Baris := WCount;
  SS.Rotasi := Rotation;
  SS.Radius1 := Height;
  SS.Radius2 := Width;

  Result := SS;
end;

{ TOPolygonShape }

constructor TPolygonStatic.Create(cvt: TCoordConverter);
begin
  inherited;
  FShapeType := ovPolygon;
  polyList := TList.Create;
end;

destructor TPolygonStatic.Destroy;
begin
  inherited;
  polyList.Free;
end;

procedure TPolygonStatic.Draw(aCnv: TCanvas);
var
  i,
  Isx, Isy : Integer;
  point : TDotStatic;
  polyPoint : Array of TPoint;
begin
  inherited;
  SetLength(polyPoint, polyList.Count);

  for i := 0 to polyList.Count - 1 do
  begin
    point := polyList.Items[i];

    Converter.ConvertToScreen(point.X, point.Y, Isx, Isy);
    polyPoint[i].x := Isx;
    polyPoint[i].y := Isy;
  end;

  with aCnv do
  begin
    Pen.Color := Color;
    Pen.Width := Weight;
    Pen.Style := LineType;

    if BrushStyle = bsClear then
      Brush.Style := BrushStyle
    else
    begin
      Brush.Style := BrushStyle;;
      Brush.Color := ColorFill;
    end;

    if isSelected then
     Pen.color   := clWhite;

    Polygon(polyPoint);
  end;
  normalized(aCnv);
end;

function TPolygonStatic.GetSnapshotData: _SS_TMainStaticShape;
var
  i : Integer;
  point : TDotStatic;
  SS : _SS_TMainStaticShape;
begin
  SS := inherited;

  SS.ShapeType := FShapeType;
  for i := 0 to polyList.Count - 1 do
  begin
    point := polyList.Items[i];

    SS.PolyPoint[i].X := point.X;
    SS.PolyPoint[i].Y := point.Y;
  end;

  Result := SS;
end;

{ TDotStatic }

constructor TDotStatic.Create;
begin

end;

destructor TDotStatic.Destroy;
begin

  inherited;
end;

{ TFlagPoint }

constructor TFlagPoint.Create(cvt: TCoordConverter);
begin
  FConverter := cvt;
end;

destructor TFlagPoint.Destroy;
begin

end;

procedure TFlagPoint.Draw(aCnv: TCanvas);
var
  x, y : Integer;
  bmp : TBitmap;
begin
  with aCnv do
  begin
    Converter.ConvertToScreen(Post.X, Post.Y, x, y);

    Brush.Style := bsClear;
    Pen.Style := psSolid;

    bmp := TBitmap.Create;
    bmp.Transparent := true;
    bmp.LoadFromFile(vSymbolSetting.ImgPath + pctFlagPoint + '.bmp');

    x := x - (bmp.Width div 2);
    y := y - (bmp.Height div 2);

    Draw(x, y, bmp);
    bmp.Free;

    {untuk menormalkan pen yg tidak diset}
    Pen.Width:=1;
  end;
end;

procedure TFlagPoint.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

end.
