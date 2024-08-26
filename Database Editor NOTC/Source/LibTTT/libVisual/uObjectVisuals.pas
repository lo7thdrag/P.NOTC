unit uObjectVisuals;

interface

uses
  Windows, Graphics, uSimVisuals, uCoordConvertor, uDataTypes, tttData,
  GdiPlus, GDIPAPI, GDIPOBJ ;

type

//------------------------------------------------------------------------------

  TTextVisual = class(TDrawElement)
  public
    Text : string;
  public

    constructor Create;
    procedure Draw(aCanvas: TCanvas); override;
  end;

  TLineVisual = class(TDrawElement)
  private
    FRange, FBearing : double;
    once : boolean;
    procedure SetBearing(const Value: double);
    procedure SetRange(const Value: double);
  public
    sx1,sy1,sx2,sy2 : integer;
    X1, Y1{, X2, Y2} : double;
    LineStyles : TPenStyle;
    constructor Create;
    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure Draw(aCanvas: TCanvas); override;
    function isPointOnLine(X,Y : double) : boolean;

    property Range    : double read FRange write SetRange;
    property Bearing  : double read FBearing write SetBearing;
    property IsOnce   : Boolean read once write once;
  end;

//------------------------------------------------------------------------------
  TSpeedVectorVisual = class(TDrawElement)
  protected
    ptL,
    ptR,
    ptH : TPoint;
  public
    Course  : single; // compas, 0 -  360
    Speed   : single;  // knot
    Ratio   : single;

    constructor Create;
    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure Draw(aCanvas: TCanvas); override;
  end;

//------------------------------------------------------------------------------

  TBitmapSymbol = class(TDrawElement)
  private
    FBSize: integer;
    FBmpOrg: TBitmap;
    FBmp, FBmpColor: TBitmap;
    FBitmapName : string;
    function getBMPHeight: integer;
    function getBMPWidth: integer;
    procedure SetFColor(const Value: TColor); override;

  public
    FDegr : Integer;
    constructor Create;
    destructor Destroy; override;


    procedure Draw(aCnv: TCanvas); override;
    procedure LoadBitmap(fName: string; color: TColor);
    property BitmapWidth  : integer read getBMPWidth;
    property BitmapHeigth : integer read getBMPHeight;
    procedure ReloadBitmap;overload;
    procedure ReloadBitmap(clr : TColor);overload;
  end;

//------------------------------------------------------------------------------

// circle view for radar range / weapon range
  TRangeVisual = class(TDrawElement)
  private
    FRects : TRect;
    FRanges: integer;

  public
    constructor Create;
    destructor Destroy; override;

    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure Draw(aCanvas: TCanvas); override;
  public
    LineStyles : TPenStyle;

    mX, mY: Double;
    Range : Single;        // nautical miles
  end;

  TRectVisual = class(TDrawElement)
  private
     FRects : TRect;
  public
    LineStyles : TPenStyle;
    FStartPoint, FEndPoint : TPoint;

    constructor create;
    destructor Destroy; override;

    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure Draw(aCanvas: TCanvas); override;
  end;

  TTargetVisual = class(TDrawElement)
  private
     FCircle : TRect;
  public
    LineStyles : TPenStyle;
    FPoint : TPoint;

    constructor create;
    destructor Destroy; override;

    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure Draw(aCanvas: TCanvas); override;
  end;

//------------------------------------------------------------------------------
  TRangeRingsVisual = class(TDrawElement)
  private
    FRects : array of TRect;
    FRangeInterval: integer;
    FNumOfRanges   : integer;

    procedure SetNumOfRange(const i: integer);
    procedure SetRangeInterval(const Value: integer);
  public
    constructor Create;
    destructor Destroy; override;

    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure Draw(aCanvas: TCanvas); override;
  public
    mX, mY: Double;
    Interval : Single;        // nautical miles
    property  RangeNum: Integer read FNumOfRanges write SetNumOfRange;    //

  end;

  TSwapLineVisual = class (TDrawElement)
  private
    FHeading : double;
    FRanges: single;
    FAngle: single;
    FRelativeAngle: double;
    FPoint : t2DPoint;
    procedure SetAngle(const Value: single);
    procedure SetRelativeAngle(const Value: double);
    function getRelativeAngle : double;
  public
    mX, mY: Double;
    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure Draw(aCanvas: TCanvas); override;
    property Ranges : single read FRanges write FRanges;
    property Angle : single  read FAngle write SetAngle;
    property Heading : double read FHeading write FHeading;
    property RelativeAngle : double  read getRelativeAngle;
  end;

//------------------------------------------------------------------------------
  TBlindZoneVisual = class(TDrawElement)
  private
    FHeading : double;
    FAngles : array [0..1] of single;
    FRanges: single;
    FStartPoint, FEndPoint : t2DPoint;
    FRects : TRect;
    FRelativeStartAngle: double;
    FRelativeEndAngle : double;
    FSx, FSy, FEx, FEy : double;

    function getAngle(index : integer) : single;
    procedure setAngle(index : integer; angle : single);
    function getRelativeAngle(index : integer) : double;
  public
    mX, mY: Double;
    constructor Create;
    destructor Destroy; override;

    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure Draw(aCanvas: TCanvas); override;
    property Ranges : single read FRanges write FRanges;
    property StartAngle : single index 0 read getAngle write setAngle;
    property EndAngle : single index 1 read getAngle write setAngle;
    property Heading : double read FHeading write FHeading;
    property RelativeStartAngle : double index 1 read getRelativeAngle;
    property RelativeEndAngle : double index 0 read getRelativeAngle;

  end;

//------------------------------------------------------------------------------
  THistoryVisual  = class(TDrawElement)
  private
    FTrailCapacity   : Word;
    FTrailCount      : Word;
    FTrails          : array of t2DPoint;
    FPixelTrails     : array of TPoint;

  public
    VisibleCount     : integer;
    Selected         : boolean;

    constructor Create;
    destructor Destroy; override;

    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure Draw(aCanvas: TCanvas); override;

    procedure AddPoint(dX, dY: double);
    procedure ClearHistory;
  end;

  TTacticalSymbol = class (TDrawElement)
  private
    FSymbol       : TBitmapSymbol;
    FSpeedVector  : TSpeedVectorVisual;
    FSelected     : boolean;
    FText         : TTextVisual;
    FColorSelected : TColor;
    FControlled   : booLEan;

    procedure SetSpeedVector(const Value: TSpeedVectorVisual);
    procedure SetSymbol(const Value: TBitmapSymbol);
    procedure SetSelected(const Value: boolean);
    procedure SetText(const Value: TTextVisual);
    procedure SetControlled(const Value: boolean);
  public
    constructor Create;
    destructor Destroy; override;

    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure Draw(aCanvas: TCanvas); override;

    property Symbol         : TBitmapSymbol read FSymbol;
    property SpeedVector    : TSpeedVectorVisual read FSpeedVector;
    property Selected       : boolean read FSelected write FSelected ;
    property Controlled     : boolean read FControlled write SetControlled;
    property TextVisual     : TTextVisual  read FText;
  end;

  TTacticalSymbolVisual = class(TDrawElement)
  public
    CharSymbol : Char;
  public

    constructor Create;
    procedure Draw(aCanvas: TCanvas); override;
  end;

implementation

uses
  Math, Types, uBaseCoordSystem;

{ TTextVisual }
constructor TTextVisual.Create;
begin
  inherited;
  Offset.X := 20;
  Offset.Y := 0;
end;

procedure TTextVisual.Draw(aCanvas: TCanvas);
begin
  with aCanvas do begin
    Pen.Color := Color;
    Pen.Width := 1;
    Pen.Style := psDot;

    Font.Name := 'Courier';
    Font.Size := 8;
    Font.Color := Color;
    SetBkMode(aCanvas.Handle, TRANSPARENT);

    TextOut(Center.X + Offset.X, Center.Y + Offset.Y , Text);
  end;
end;


{ TSpeedVectorVisual }
procedure TSpeedVectorVisual.ConvertCoord(cvt: TCoordConverter);
const
    CSPEED_VECTOR_WIDTH = 8.0;
    CMin_Length = 15;

var headEast, spdKnots : double;
    sinA, cosA: extended;
begin
  headEast := DegToRad( ConvCompass_To_Cartesian(Course));

  if Speed > 2000 then
      spdKnots := 2000
  else
      spdKnots := CMin_Length + sqrt(abs(Speed)) * Ratio;

  if Speed < 0 then   //  kapal mundur
    spdKnots := - spdKnots;

  if Speed = 0 then spdKnots := 0;

  //Calculate SpeedVector Coordinate
  SinCos(headEast, SinA, CosA);

  ptH.X :=  Round(Center.X + spdKnots * CosA);
  ptH.Y :=  Round(Center.Y - spdKnots * sinA);

end;

constructor TSpeedVectorVisual.Create;
begin
  Ratio := 0.5;
  Color  := clGray;
end;

procedure TSpeedVectorVisual.Draw(aCanvas: TCanvas);
var r: TRect;
begin
  inherited;

  with aCanvas do begin
    Pen.Color := Color;
    Pen.Width := 2;
    Pen.Style := psSolid;

    r := ptToRect(Center.X, Center.Y , 3, 3);
    Arc(r.Left, r.Top, r.Right, r.Bottom, 0,0,0,0);

    MoveTo(Center.X, Center.Y);
    LineTo(ptH.X, ptH.Y);
  end;


end;

{ TBitmapSymbol }

constructor TBitmapSymbol.Create;
begin
  FBSize := 32;

  Color := clBlue;
  FBmpOrg := TBitmap.Create;
  with FBmpOrg do begin
    PixelFormat := pf24Bit;

    Width  := FBSize;
    Height := FBSize;
    TransparentMode := tmFixed;
    TransparentColor := RGB(255, 255, 255);
    Transparent := true;
  end;

  FBmp := TBitmap.Create;
  with FBmp do begin
    PixelFormat := pf24bit;
    Width  := FBmpOrg.Width;
    Height := FBmpOrg.Height;
  end;

  FBmpColor := TBitmap.Create;
  with FBmpColor do begin
    PixelFormat := pf24bit;
    Width  := FBmpOrg.Width;
    Height := FBmpOrg.Height;
  end;


end;

destructor TBitmapSymbol.Destroy;
begin
  with FBmp do begin
    Dormant;
    FreeImage;
    ReleaseHandle;
    Free;
  end;

  FBmpOrg.Free;
  FBmpColor.Free;

  inherited;
end;

procedure TBitmapSymbol.Draw(aCnv: TCanvas);
  procedure RotateBitmapGDIP(Bmp: TBitmap; Degs: Integer; BkColor: TColor);
  var
    Tmp: TGPBitmap;
    Matrix: TGPMatrix;
    C: Single;
    S: Single;
    NewSize: TSize;
    Graphs: TGPGraphics;
    P: TGPPointF;
  begin
    Matrix := TGPMatrix.Create;

    try
      C := Cos(DegToRad(45));
      S := Sin(DegToRad(45));
      NewSize.cx := Round(Bmp.Width * Abs(C) + Bmp.Height * Abs(S));
      NewSize.cy := Round(Bmp.Width * Abs(S) + Bmp.Height * Abs(C));
      Bmp.Width := NewSize.cx;
      Bmp.Height := NewSize.cy;

      Tmp := TGPBitmap.Create(Bmp.Handle, Bmp.Palette);

      Matrix.RotateAt(Degs, MakePoint(0.5 * Bmp.Width, 0.5 * Bmp.Height));
      Graphs := TGPGraphics.Create(Bmp.Canvas.Handle);
      try
        Graphs.Clear(ColorRefToARGB(ColorToRGB(BkColor)));
        Graphs.SetTransform(Matrix);
        Graphs.DrawImage(Tmp, (Cardinal(Bmp.Width) - Tmp.GetWidth) div 2,
          (Cardinal(Bmp.Height) - Tmp.GetHeight) div 2);
      finally
        Graphs.Free;
      end;
    finally
      Matrix.Free;
      Tmp.Free;
    end;
  end;
var
  h: integer;
begin
  inherited;
  h := FBmp.Width shr 1;

  FBmp.TransparentColor := clWhite;
  FBmp.Transparent := True;

  RotateBitmapGDIP(FBmp, FDegr, FBmp.TransparentColor);

  aCnv.Draw(Center.X - h, Center.Y - h, FBmp);
end;

function TBitmapSymbol.getBMPHeight: integer;
begin
  result := FBmp.Height;
end;

function TBitmapSymbol.getBMPWidth: integer;
begin
  result := FBmp.Width;
end;

procedure TBitmapSymbol.LoadBitmap(fName: string; color: TColor);
begin
  FBitmapName := fName;
  FBmpOrg.LoadFromFile(fName);

  FBmpColor.Width := FBmpOrg.Width;
  FBmpColor.Height := FBmpOrg.Height;

  with FBmpColor.Canvas do begin
    Brush.Color := color;
    Pen.Color   := color;
    Pen.Width   := 2;
    FillRect(Rect(0,0, FBmpColor.Width, FBmpColor.Height));
  end;


  FBmp.Width  := FBmpOrg.Width;
  FBmp.Height := FBmpOrg.Height;

  FBmp.Canvas.Draw(0,0, FBmpOrg);
  FBmp.Canvas.CopyMode := cmSrcPaint;
  FBmp.Canvas.Draw(0,0, FBmpColor);

  FBmp.TransparentColor := clWhite;

end;


procedure TBitmapSymbol.ReloadBitmap(clr: TColor);
begin
  LoadBitmap(FBitmapName,clr);
end;

procedure TBitmapSymbol.ReloadBitmap;
begin
  LoadBitmap(FBitmapName,Self.Color);
end;

procedure TBitmapSymbol.SetFColor(const Value: TColor);
begin
  inherited;
end;

{ TRangeRing }

constructor TRangeRingsVisual.Create;
begin
  FNumOfRanges := 4;
  SetLength(FRects, FNumOfRanges);

  mX := 0.0;
  mY := 0.0;
  Interval  := 0.5; // nautical miles
  RangeNum  := 4;

end;

destructor TRangeRingsVisual.Destroy;
begin

  inherited;
end;

procedure TRangeRingsVisual.SetNumOfRange(const i: integer);
begin
  FNumOfRanges := i;
  SetLength(FRects, FNumOfRanges);

end;

procedure TRangeRingsVisual.ConvertCoord(cvt: TCoordConverter);
var i : integer;
    r : integer;
    rDegree: double;
    dx, dy: double;
    pt : TPoint;
begin
  inherited;
  cvt.ConvertToScreen(mx, my, Center.X, Center.Y);

  if abs(Interval) < 0.0000001 then exit;

  rDegree := Interval * C_NauticalMile_To_Degree;
  dx := mX + rDegree;
  dy := mY;

  cvt.ConvertToScreen(dx, dy, pt.X, pt.Y );

  r := Abs(pt.X - Center.X);
  for i := 0 to FNumOfRanges-1 do begin

    FRects[i].Left   := Center.X - r * (i + 1);
    FRects[i].Top    := Center.Y - r * (i + 1);
    FRects[i].Right  := Center.X + r * (i + 1);
    FRects[i].Bottom := Center.Y + r * (i + 1);
  end;

end;

procedure TRangeRingsVisual.Draw(aCanvas: TCanvas);
var i : integer;
begin
  inherited;

  if not visible then exit;
  
  for i := 0 to FNumOfRanges-1 do begin
    aCanvas.Pen.Color := Color;
    aCanvas.Pen.Style := psSolid;
    aCanvas.Arc(FRects[i].Left, FRects[i].Top , FRects[i].Right , FRects[i].Bottom,
     0, 0, 0, 0);
  end;
end;

procedure TRangeRingsVisual.SetRangeInterval(const Value: integer);
var i : integer;
begin
  FRangeInterval := Value;

  for i := 0 to FNumOfRanges-1 do begin
    FRects[i].Left   := Center.X - FRangeInterval ;
    FRects[i].Top    := Center.Y - FRangeInterval;
    FRects[i].Right  := Center.X + FRangeInterval;
    FRects[i].Bottom := Center.Y + FRangeInterval;
  end;

end;

{ TRangeVisual }
{ color blue radar, green sonar, red weapon

}

constructor TRangeVisual.Create;
begin
  inherited;

  Color := clBlue;
  LineStyles := psDot;

end;

destructor TRangeVisual.Destroy;
begin

  inherited;
end;

procedure TRangeVisual.ConvertCoord(cvt: TCoordConverter);
var
    r : integer;
    rDegree: double;
    dx, dy: double;
    pt : TPoint;
begin
  inherited;

  cvt.ConvertToScreen(mx, my, Center.X, Center.Y);

  if abs(Range) < 0.0000001 then exit;

  rDegree := Range * C_NauticalMile_To_Degree;
  dx := mX + rDegree;
  dy := mY;

  cvt.ConvertToScreen(dx, dy, pt.X, pt.Y);
  r := Abs(pt.X - Center.X);

  FRects.Left   := Center.X - r;
  FRects.Top    := Center.Y - r;
  FRects.Right  := Center.X + r;
  FRects.Bottom := Center.Y + r;

end;

procedure TRangeVisual.Draw(aCanvas: TCanvas);
begin
  inherited;
  if not Visible then
    Exit;

  aCanvas.Pen.Style := psSolid;
  aCanvas.Pen.Color := Color;
  aCanvas.Pen.Style := LineStyles;
  aCanvas.Brush.Style := bsClear;
  aCanvas.Ellipse(FRects);
  //aCanvas.Arc(FRects.Left, FRects.Top , FRects.Right , FRects.Bottom,
  // 0, 0, 0, 0);

end;

{ THistoryVisual }

constructor THistoryVisual.Create;
begin
  inherited;

  VisibleCount := 30;
  Selected := true;
  ClearHistory;
  FTrailCapacity := 50;

end;

destructor THistoryVisual.Destroy;
begin
  FTrailCount := 0;
  SetLength(FTrails, 0);
  SetLength(FPixelTrails, 0);

  inherited;
end;


procedure THistoryVisual.AddPoint(dX, dY: double);
var
  i : integer;
begin
  if FTrailCount = FTrailCapacity then begin
    for i := 0 to FTrailCount - 2 do
      FTrails[i] := FTrails[i+1];
  end else begin
    FTrailCount := FTrailCount + 1;
    SetLength(FTrails, FTrailCount);
    SetLength(FPixelTrails, FTrailCount);
  end;

  FTrails[FTrailCount-1].X := dX;
  FTrails[FTrailCount-1].Y := dY;

end;

procedure THistoryVisual.ClearHistory;
begin
  SetLength(FTrails, 0);
  SetLength(FPixelTrails, 0);
end;

procedure THistoryVisual.ConvertCoord(cvt: TCoordConverter);
var i: integer;
    dx, dy: double;
begin
  inherited;

  for i := 0 to FTrailCount-1 do begin
    dx := FTrails[i].x;
    dy := FTrails[i].y;
    cvt.ConvertToScreen(dx, dy, FPixelTrails[i].X ,  FPixelTrails[i].Y );
  end;

end;

procedure THistoryVisual.Draw(aCanvas: TCanvas);
var i: integer;
    mnTrail : integer;
    r :TRect;
    x,y : integer;

begin
  inherited;
  if not Visible then exit;
  if VisibleCount = 0 then exit;

  if VisibleCount > 0 then begin
    mnTrail := Max(0, FTrailCount-VisibleCount-2);
    with aCanvas do begin
      //Brush.Style := bsSolid;
      Brush.Color := Color;
      Pen.Color := Color;
      for i := FTrailCount-2 downto mnTrail do begin
        x := FPixelTrails[i].X;
        y := FPixelTrails[i].Y;
        r := ptToRect(x,y, 2, 2);
        FillRect(r);
      end;
    end;
  end
  else begin //-1
    with aCanvas do begin
      Brush.Color := Color;
      Pen.Color := Color;
      for i := FTrailCount-1 downto 0 do begin
        x := FPixelTrails[i].X;
        y := FPixelTrails[i].Y;
        r := ptToRect(x,y, 2, 2);
        FillRect(r);
      end
    end
  end;
end;

{ TBlindZoneVisual }

procedure TBlindZoneVisual.ConvertCoord(cvt: TCoordConverter);
var
    r : integer;
    rDegree: double;
    dx, dy: double;
    pt : TPoint;
begin
  inherited;
  if StartAngle = EndAngle then exit;

  cvt.ConvertToScreen(mx, my, Center.X, Center.Y);

  rDegree := Ranges * C_NauticalMile_To_Degree;
  dx := mX + rDegree;
  dy := mY;

  cvt.ConvertToScreen(dx, dy, pt.X, pt.Y);
  r := Abs(pt.X - Center.X) - 5 ;

  FRelativeStartAngle := StartAngle;
  FRelativeStartAngle := ConvCompass_To_Cartesian(FRelativeStartAngle);
  FRelativeStartAngle := ConvCustomAngleStart(FRelativeStartAngle,FHeading);
  FRelativeStartAngle := FRelativeStartAngle * C_DegToRad;

  FRelativeEndAngle := EndAngle;
  FRelativeEndAngle := ConvCompass_To_Cartesian(FRelativeEndAngle);
  FRelativeEndAngle := ConvCustomAngleStart(FRelativeEndAngle,FHeading);
  FRelativeEndAngle := FRelativeEndAngle * C_DegToRad;

  FEndPoint.X := Center.X + Round(Cos(FRelativeStartAngle) * r);
  FEndPoint.Y := Center.Y + Round(Sin(FRelativeStartAngle) * r);
  FStartPoint.X   := Center.X + Round(Cos(FRelativeEndAngle) * r);
  FStartPoint.Y   := Center.Y + Round(Sin(FRelativeEndAngle) * r);

  FRects.Left   := Center.X - r;
  FRects.Top    := Center.Y - r;
  FRects.Right  := Center.X + r;
  FRects.Bottom := Center.Y + r;

  cvt.ConvertToMap(Round(FStartPoint.X), Round(FStartPoint.Y), FSx, FSy);
  cvt.ConvertToMap(Round(FEndPoint.X), Round(FEndPoint.Y), FEx, FEy);

end;

constructor TBlindZoneVisual.Create;
begin

end;

destructor TBlindZoneVisual.Destroy;
begin

  inherited;
end;

procedure TBlindZoneVisual.Draw(aCanvas: TCanvas);
begin
  inherited;

  if StartAngle = EndAngle then exit;

  {bitmap := TBitmap.Create;
  bitmap.Width  := FRects.Right - FRects.Left;
  bitmap.Height := FRects.Top - FRects.Bottom;}

  with aCanvas do begin
    //CopyRect();

    Pen.Style := psSolid;
    Pen.Color := Color;

    //Brush.Style := bsSolid;
    //Brush.Color := clBlue;

    //Ellipse(FRects);
    Arc(FRects.Left,FRects.Top,FRects.Right,FRects.Bottom,
        Round(FStartPoint.X),Round(FStartPoint.Y),
        Round(FEndPoint.X),Round(FEndPoint.Y));

    MoveTo(Center.X,Center.Y);
    LineTo(Round(FStartPoint.X),Round(FStartPoint.Y));

    MoveTo(Center.X,Center.Y);
    LineTo(Round(FEndPoint.X),Round(FEndPoint.Y));

    Brush.Style := bsClear;
  end;

end;

function TBlindZoneVisual.getAngle(index: integer): single;
begin
  result := FAngles[index];
end;

function TBlindZoneVisual.getRelativeAngle(index: integer): double;
begin
  result := 0;
  case index of
    0 : result := CalcBearing(mx,my,FSx,FSy);
    1 : result := CalcBearing(mx,my,FEx,FEy);
  end;
end;

procedure TBlindZoneVisual.setAngle(index: integer; angle: single);
begin
  FAngles[index] := angle;
end;

{ TSwapLineVisual }

procedure TSwapLineVisual.ConvertCoord(cvt: TCoordConverter);
var
    r : integer;
    rDegree: double;
    dx, dy: double;
    pt : TPoint;
begin
  inherited;
  cvt.ConvertToScreen(mx, my, Center.X, Center.Y);

  rDegree := Ranges * C_NauticalMile_To_Degree;
  dx := mX + rDegree;
  dy := mY;

  cvt.ConvertToScreen(dx, dy, pt.X, pt.Y);
  r := Abs(pt.X - Center.X) ;

  FRelativeAngle := Angle;
  FRelativeAngle := ConvCompass_To_Cartesian(FRelativeAngle);
  FRelativeAngle := ConvCustomAngleStart(FRelativeAngle,FHeading);
  FRelativeAngle := FRelativeAngle * C_DegToRad;

  FPoint.X := Center.X + Round(Cos(FRelativeAngle) * r);
  FPoint.Y := Center.Y + Round(Sin(FRelativeAngle) * r);

end;

procedure TSwapLineVisual.Draw(aCanvas: TCanvas);
begin
  inherited;

  with aCanvas do begin
    Pen.Style := psSolid;
    Pen.Color := Color;

    MoveTo(Center.X,Center.Y);
    LineTo(Round(FPoint.X),Round(FPoint.Y));

    Pen.Style := psClear;
  end;
end;

function TSwapLineVisual.getRelativeAngle: double;
begin
  Result := 0;
  // underconstruction
end;

procedure TSwapLineVisual.SetAngle(const Value: single);
begin
  FAngle := Value;
end;

procedure TSwapLineVisual.SetRelativeAngle(const Value: double);
begin
  FRelativeAngle := Value;
end;

{ TLineVisual }

procedure TLineVisual.ConvertCoord(cvt: TCoordConverter);
var
  X2, Y2 : double;
begin
  inherited;

  cvt.ConvertToScreen(X1,Y1,sx1,sy1);

  if not once  then begin
    RangeBearingToCoord(FRange,FBearing,X2,Y2);
    X2 := X1 + X2;
    Y2 := Y1 + Y2;

    cvt.ConvertToScreen(X2,Y2,sx2,sy2);
  end else begin
    sx2 := sx1;
    sy2 := -1500;
    cvt.ConvertToMap(sx2,sy2,X2,Y2);
  end;
end;

constructor TLineVisual.Create;
begin
  once    := true;
end;

procedure TLineVisual.Draw(aCanvas: TCanvas);
begin
  inherited;

  if not Visible then exit;
  
  with aCanvas do begin
    Pen.Style := LineStyles;
    Pen.Color := Color;
    pen.Width := 1;

    MoveTo(sx1,sy1);
    LineTo(sx2,sy2);

//    Brush.Color := Color;
//    Brush.Style := bsClear;

    Rectangle(sx2-3,sy2-3,sx2+3,sy2+3);
  end;
end;

function TLineVisual.isPointOnLine(X,Y : double): boolean;
var sX,sY : integer;
  pt1,pt2,pt3 : T2dPoint;
  dist : double;
begin
  VConvertor.ConvertToScreen(X,Y,sx,sy);

  result := false;

  pt1.X := sx1;
  pt1.Y := sy1;
  pt2.X := sx2;
  pt2.Y := sy2;
  pt3.X := sx;
  pt3.Y := sy;

  dist := ptToLineDistance(pt1,pt2,pt3);

  if dist < 3 then begin
    once := false;
    result := true;
  end;
  
end;

procedure TLineVisual.SetBearing(const Value: double);
begin
  FBearing := Value;
end;

procedure TLineVisual.SetRange(const Value: double);
begin
  FRange := Value;
end;

{ TTacticalSymbol }

procedure TTacticalSymbol.ConvertCoord(cvt: TCoordConverter);
begin
  inherited;
  FSymbol.ConvertCoord(cvt);

  FSpeedVector.Center := FSymbol.Center;
  FSpeedVector.ConvertCoord(cvt);

  FText.Center := FSymbol.Center;
  FText.ConvertCoord(cvt);
end;

constructor TTacticalSymbol.Create;
begin
  FColorSelected := clrSelected;

  FSymbol       := TBitmapSymbol.Create;
  FSymbol.Color := color;

  FSpeedVector  := TSpeedVectorVisual.Create;
  FSpeedVector.Color := color;

  FText         := TTextVisual.Create;
  FText.Color   := color;

  FSelected     := false;
  FControlled   := false;
end;

destructor TTacticalSymbol.Destroy;
begin
  FSymbol.Free;
  FSpeedVector.Free;
  FText.Free;
  inherited;
end;

procedure TTacticalSymbol.Draw(aCanvas: TCanvas);
var w,h : integer;
  rect : TRect;
begin
  inherited;
  if FSelected then begin
    FSymbol.Color := FColorSelected;
    FSymbol.ReloadBitmap;
    FSymbol.Draw(aCanvas);

    FSpeedVector.Draw(aCanvas);
    FSpeedVector.Color := FColorSelected;

    FText.Draw(aCanvas);
    FText.Color := FColorSelected;

    with (aCanvas) do begin
      Pen.Style := psSolid;
      Pen.Width := 1;
      Pen.Color := FColorSelected;
      Brush.Style := bsClear;

      w := FSymbol.BitmapWidth div 2 + 5;
      h := FSymbol.BitmapHeigth div 2 + 5;
      Rectangle(FSymbol.Center.X - w,FSymbol.Center.Y - h,FSymbol.Center.X + w,FSymbol.Center.Y + h );
    end;
  end else begin
    FSymbol.Color := Color;
    FSymbol.ReloadBitmap;
    FSymbol.Draw(aCanvas);

    FSpeedVector.Draw(aCanvas);
    FSpeedVector.Color := Color;

    FText.Draw(aCanvas);
    FText.Color := Color;
  end;

  if FControlled then begin
    with (aCanvas) do begin
      Pen.Width := 1;
      pen.Style := psSolid;
      Pen.Color := clWhite;
      Brush.Style := bsClear;

      w := FSymbol.BitmapWidth div 2 + 3;
      h := FSymbol.BitmapHeigth div 2 + 3;

      //w := Max(w,h);

      rect.Left := FSymbol.Center.X - w;
      rect.Top  := FSymbol.Center.Y - h;
      rect.Right:= FSymbol.Center.X + w;
      rect.Bottom := FSymbol.Center.Y + h;

      Rectangle(rect);
    end;
  end;

end;

procedure TTacticalSymbol.SetControlled(const Value: boolean);
begin
  FControlled := Value;
end;

procedure TTacticalSymbol.SetSelected(const Value: boolean);
begin
  FSelected := Value;

  //if FSelected  then

end;

procedure TTacticalSymbol.SetSpeedVector(const Value: TSpeedVectorVisual);
begin
  FSpeedVector := Value;
end;

procedure TTacticalSymbol.SetSymbol(const Value: TBitmapSymbol);
begin
  FSymbol := Value;
end;

procedure TTacticalSymbol.SetText(const Value: TTextVisual);
begin
  FText := Value;
end;

{ TTacticalSymbolVisual }

constructor TTacticalSymbolVisual.Create;
begin
  inherited;
  Size := 24;
  Color := clLime;
end;

procedure TTacticalSymbolVisual.Draw(aCanvas: TCanvas);
var sz: TSize;
    hw, hh: Integer;
    pt: TPoint;

begin
  inherited;

  sz := aCanvas.TextExtent(CharSymbol);

  hw := (sz.cx + 1) shr 1;
  hh := (sz.cy + 1) shr 1;

  pt.X := Center.X - hw;
  pt.Y := Center.Y - hh;

  aCanvas.TextOut(hw, hh, CharSymbol);

end;

{ TRectVisual }

procedure TRectVisual.ConvertCoord(cvt: TCoordConverter);
begin
  inherited;

//  FRects.Left   := FStartPoint.X;
//  FRects.Top    := FStartPoint.Y;
//  FRects.Right  := FEndPoint.X;
//  FRects.Bottom := FEndPoint.Y;
end;

constructor TRectVisual.create;
begin
  inherited;

  Color := clBlue;
  LineStyles := psDot;
end;

destructor TRectVisual.Destroy;
begin

  inherited;
end;

procedure TRectVisual.Draw(aCanvas: TCanvas);
begin
  inherited;

  FRects.Left   := FStartPoint.X;
  FRects.Top    := FStartPoint.Y;
  FRects.Right  := FEndPoint.X;
  FRects.Bottom := FEndPoint.Y;
  aCanvas.Rectangle(FRects.Left, FRects.Top, FRects.Right, FRects.Bottom);
end;

{ TTargetVisual }

procedure TTargetVisual.ConvertCoord(cvt: TCoordConverter);
begin
  inherited;

end;

constructor TTargetVisual.create;
begin
  inherited;

  Color := clBlue;
  LineStyles := psSolid;
end;

destructor TTargetVisual.Destroy;
begin

  inherited;
end;

procedure TTargetVisual.Draw(aCanvas: TCanvas);
begin
    inherited;

  FCircle.Left   := FPoint.X - 5;
  FCircle.Top    := FPoint.Y - 5;
  FCircle.Right  := FPoint.X + 5;
  FCircle.Bottom := FPoint.Y + 5;
  aCanvas.Pen.Width := 1;
  aCanvas.Pen.Color := clBlue;
  aCanvas.Pen.Style := psSolid;
  aCanvas.Brush.Color := clred;
  aCanvas.Brush.Style := bsSolid;
  aCanvas.Ellipse(FCircle.Left, FCircle.Top, FCircle.Right, FCircle.Bottom);
  FCircle.Left   := FPoint.X - 7;
  FCircle.Top    := FPoint.Y - 7;
  FCircle.Right  := FPoint.X + 7;
  FCircle.Bottom := FPoint.Y + 7;
  aCanvas.Pen.Width := 1;
  aCanvas.Pen.Color := clBlue;
  aCanvas.Pen.Style := psSolid;
  aCanvas.Brush.Style := bsClear;
  aCanvas.Ellipse(FCircle.Left, FCircle.Top, FCircle.Right, FCircle.Bottom);

  aCanvas.MoveTo(FPoint.X, FPoint.y + 7);
  aCanvas.LineTo(FPoint.X, FPoint.Y - 7);

  aCanvas.MoveTo(FPoint.X + 7, FPoint.y);
  aCanvas.LineTo(FPoint.X - 7, FPoint.Y);
end;

end.
