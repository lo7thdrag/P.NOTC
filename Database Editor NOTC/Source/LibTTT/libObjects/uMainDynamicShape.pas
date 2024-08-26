unit uMainDynamicShape;

interface

uses
  Windows, Graphics, Math,SysUtils, Classes, uFormula,
  uBaseCoordSystem, uCoordConvertor, uDataTypes, uGameData_TTT, uLibSettingTTT, tttData;

type

  TMainDynamicShape = class
  private
    FColor: Integer;
    FSelected: Boolean;
    FConverter: TCoordConverter;
    FColorFill: Integer;
    FLineType: TPenStyle;
    FWeight: Integer;
    FBrushStyle: TBrushStyle;

    procedure SetColor(const Value: Integer);

    procedure SetSelected(const Value: Boolean);
    procedure SetConverter(const Value: TCoordConverter);
    procedure SetColorFill(const Value: Integer);
    procedure SetLineType(const Value: TPenStyle);
    procedure SetWeight(const Value: Integer);

  public
    FFormula : TFormula;
    RangeOffset   : Double;
    BearingOffset : Double;
    RotationOffset: Double;
    Orientation   : Byte; {0: Relative; 1: True}

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    procedure FindPoint(postCont: t2DPoint; var postValue : t2DPoint; vd, vi: Double);
    procedure Clear;
    procedure Draw(aCnv: TCanvas); virtual;

    property Color : Integer read FColor write SetColor;
    property isSelected : Boolean read FSelected write SetSelected;
    property Converter : TCoordConverter read FConverter write SetConverter;
    property ColorFill : Integer read FColorFill write SetColorFill;
    property LineType : TPenStyle read FLineType write SetLineType;
    property Weight : Integer read FWeight write SetWeight;
    Property BrushStyle : TBrushStyle read FBrushStyle write FBrushStyle;
  end;

  TTextDynamic = class(TMainDynamicShape)
  public
    ParentPos : t2DPoint;
    postStart : tRangeBearingPoint;
    size : Integer;
    words : String;

    procedure Draw(aCnv: TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;
  end;

  TLineDynamic = class(TMainDynamicShape)
  public
    ParentPos : t2DPoint;
    postStart : tRangeBearingPoint;
    postEnd : tRangeBearingPoint;
    lineType : TPenStyle;
    weight : Integer ;

    procedure Draw(aCnv: TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;
  end;

  TRectangleDynamic = class(TMainDynamicShape)
  public
    ParentPos : t2DPoint;
    postStart : tRangeBearingPoint;
    postEnd : tRangeBearingPoint;

    procedure Draw(aCnv : TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy ; override;
  end;

  TCircleDynamic = class(TMainDynamicShape)
  public
    ParentPos : t2DPoint;
    postCenter : tRangeBearingPoint;
    radius : Double;

    procedure Draw(aCnv : TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy ; override;
  end;

  TEllipseDynamic = class(TMainDynamicShape)
  public
    ParentPos : t2DPoint;
    postCenter : tRangeBearingPoint;
    Hradius, Vradius : Double;

    procedure Draw(aCnv : TCanvas); override;
    
    constructor Create(cvt : TCoordConverter);
    destructor Destroy ; override;
  end;

  TArcDynamic = class(TMainDynamicShape)
  public
    ParentPos : t2DPoint;
    postCenter : tRangeBearingPoint;
    radius : Double;
    StartAngle, EndAngle : Integer;

    procedure Draw(aCnv : TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy ; override;
  end;

  TSectorDynamic = class(TMainDynamicShape)
  public
    ParentPos : t2DPoint;
    postCenter : tRangeBearingPoint;
    Oradius, Iradius : Double;
    StartAngle, EndAngle : Integer;

    procedure Draw(aCnv : TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy ; override;
  end;

  TGridDynamic = class(TMainDynamicShape)
  public
    ParentPos : t2DPoint;
    postCenter : tRangeBearingPoint;
    HCount, WCount, Rotation : Integer;
    Height, Width : Double;

    procedure Draw(aCnv : TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy ; override;
  end;

  TPolygonDynamic = class(TMainDynamicShape)
  public
    ParentPos : t2DPoint;
    polyPoint : Array of TPoint;
    polyList : TList;

    procedure Draw(aCnv : TCanvas); override;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy ; override;
  end;

  TDotDynamic = class
  public
    Range, Bearing : Double;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TMainDynamicShape }

procedure TMainDynamicShape.Clear;
begin

end;

constructor TMainDynamicShape.create;
begin
//  Parent := nil;
  FConverter := cvt;
end;

destructor TMainDynamicShape.destroy;
begin
  inherited;
end;

procedure TMainDynamicShape.Draw(aCnv: TCanvas);
begin

end;

procedure TMainDynamicShape.FindPoint(postCont: t2DPoint; var postValue: t2DPoint; vd, vi: Double);
var
  dx, dy : Double;
begin
  RangeBearingToCoord(vd, vi, dx, dy);
  postValue.X := postCont.X + dx;
  postValue.Y := postCont.Y + dy;
end;

procedure TMainDynamicShape.SetColor(const Value: Integer);
begin
  FColor := Value;
end;

procedure TMainDynamicShape.SetColorFill(const Value: Integer);
begin
  FColorFill := Value;
end;

procedure TMainDynamicShape.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

procedure TMainDynamicShape.SetLineType(const Value: TPenStyle);
begin
  FLineType := Value;
end;

procedure TMainDynamicShape.SetSelected(const Value: Boolean);
begin
  FSelected := Value;
end;

procedure TMainDynamicShape.SetWeight(const Value: Integer);
begin
  FWeight := Value;
end;


{ TTextDynamic }

constructor TTextDynamic.create;
begin
  inherited;
end;

destructor TTextDynamic.destroy;
begin

  inherited;
end;

procedure TTextDynamic.Draw(aCnv: TCanvas);
var
  sx, sy : Integer;
  BOffset, BShape : Double;

  pOffset, pShape,
  pParent :  t2DPoint;
begin
  inherited;

  case Orientation of
    0 : BOffset := ValidateDegree(BearingOffset);
    1 : BOffset := ValidateDegree(BearingOffset);
  end;

  BShape := postStart.Bearing + RotationOffset;

  FindPoint(ParentPos, pOffset, RangeOffset, BOffset);   {Point offset from Ship}
  FindPoint(pOffset, pShape, postStart.Range, BShape); {Shape from Point offset}

  Converter.ConvertToScreen(pShape.X, pShape.Y, sx, sy);

  with aCnv do
  begin
    Brush.Style := bsClear;

    Font.Color := Color;
    Font.Size := size;

    if isSelected then
     Font.Color  := clGray;

    TextOut(sx, sy, words);

    {font dinormalkan lagi}
    Font.Size := 10;
  end;

end;

{ TLineDynamic }

constructor TLineDynamic.create;
begin
  inherited;

end;

destructor TLineDynamic.destroy;
begin

  inherited;
end;

procedure TLineDynamic.Draw(aCnv: TCanvas);
var
  sx, sy, ex, ey : Integer;
  BOffset, BSShape, BEShape : Double;

  pOffset, pSShape, pEShape,
  pParent :  t2DPoint;
begin
  inherited;


  case Orientation of
    0 : BOffset := ValidateDegree( BearingOffset);
    1 : BOffset := ValidateDegree(BearingOffset);
  end;

  BSShape := postStart.Bearing + RotationOffset;
  BEShape := postEnd.Bearing + RotationOffset;

  FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}
  FindPoint(pOffset, pSShape, postStart.Range, BSShape);  {Shape from Point offset}
  FindPoint(pOffset, pEShape, postEnd.Range, BEShape);    {Shape from Point offset}

  Converter.ConvertToScreen(pSShape.X, pSShape.Y, sx, sy);
  Converter.ConvertToScreen(pEShape.X, pEShape.Y, ex, ey);

  with aCnv do
  begin
    Brush.Style := bsClear;

    Pen.Width := weight;
    Pen.Style := lineType;
    Pen.Color := Color;

    if isSelected then
     Pen.color   := clGray;

    MoveTo(sx, sy); LineTo(ex, ey);
  end;
end;

{ TRectangleDynamic }

constructor TRectangleDynamic.create;
begin
  inherited;

end;

destructor TRectangleDynamic.destroy;
begin

  inherited;
end;

procedure TRectangleDynamic.Draw(aCnv: TCanvas);
var
  Isx, Isy, Iex, Iey,
  Osx, Osy, Oex, Oey : Integer;

  pOffset, pParent,
  IStart, IEnd, OStart, OEnd, Cent  : t2DPoint;

  Rx, Ry,
  BOffset, BSShape, BEShape,
  RCenterToPoint, BCenterToPoint,
  RKiAts, RKaAts, RKiBwh, RKaBwh,
  BKiAts, BKaAts, BKiBwh, BKaBwh : Double;
begin
  inherited;

  case Orientation of
    0 : BOffset := ValidateDegree(BearingOffset);
    1 : BOffset := ValidateDegree(BearingOffset);
  end;

  FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}

  BSShape := postStart.Bearing + RotationOffset;
  BEShape := postEnd.Bearing + RotationOffset;

  FindPoint(pOffset, IStart, postStart.Range, BSShape);
  FindPoint(pOffset, OEnd, postEnd.Range, BEShape);

  Rx := CalcRange(IStart.X, IStart.Y, OEnd.X, IStart.Y);
  Ry := CalcRange(IStart.X, IStart.Y, IStart.X, OEnd.Y);

  RCenterToPoint  := CalcRange(IStart.X, IStart.Y, OEnd.X, OEnd.Y)/2;
  BCenterToPoint  := CalcBearing(IStart.X, IStart.Y, OEnd.X, OEnd.Y);

  //Point Center
  FindPoint(IStart, Cent, RCenterToPoint, BCenterToPoint);

  //Point Kiri Atas
  IStart.X := Cent.X - (Rx/60/2);
  IStart.Y := Cent.Y + (Ry/60/2);

  //Point Kanan Atas
  IEnd.X := Cent.X + (Rx/60/2);
  IEnd.Y := Cent.Y + (Ry/60/2);

  //Point Kanan Bawah
  OEnd.X := Cent.X + (Rx/60/2);
  OEnd.Y := Cent.Y - (Ry/60/2);

  //Point Kiri Bawah
  OStart.X := Cent.X - (Rx/60/2);
  OStart.Y := Cent.Y - (Ry/60/2);

  BKiAts  := CalcBearing(Cent.X, Cent.Y, IStart.X, IStart.Y);
  BKaAts  := CalcBearing(Cent.X, Cent.Y, IEnd.X, IEnd.Y);
  BKaBwh  := CalcBearing(Cent.X, Cent.Y, OEnd.X, OEnd.Y);
  BKiBwh  := CalcBearing(Cent.X, Cent.Y, OStart.X, OStart.Y);

  RKiAts  := CalcRange(Cent.X, Cent.Y, IStart.X, IStart.Y);
  RKaAts  := CalcRange(Cent.X, Cent.Y, IEnd.X, IEnd.Y);
  RKaBwh  := CalcRange(Cent.X, Cent.Y, OEnd.X, OEnd.Y);
  RKiBwh  := CalcRange(Cent.X, Cent.Y, OStart.X, OStart.Y);

  FindPoint(Cent, IStart, RKiAts, BKiAts);
  FindPoint(Cent, IEnd, RKaAts, BKaAts);
  FindPoint(Cent, OEnd, RKaBwh, BKaBwh);
  FindPoint(Cent, OStart, RKiBwh, BKiBwh);

  Converter.ConvertToScreen(IStart.X,  IStart.Y,  Isx, Isy);
  Converter.ConvertToScreen(IEnd.X,    IEnd.Y,    Iex, Iey);
  Converter.ConvertToScreen(OEnd.X,    OEnd.Y,    Oex, Oey);
  Converter.ConvertToScreen(OStart.X,  OStart.Y,  Osx, Osy);

  with aCnv do
  begin
    if isSelected  then
      Pen.Color:= clGray
    else

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

    MoveTo(Isx, Isy); LineTo(Iex, Iey);
    MoveTo(Iex, Iey); LineTo(Oex, Oey);
    MoveTo(Oex, Oey); LineTo(Osx, Osy);
    MoveTo(Osx, Osy); LineTo(Isx, Isy);

  end;
end;

{ TCircleDynamic }

constructor TCircleDynamic.create;
begin
  inherited;

end;

destructor TCircleDynamic.destroy;
begin

  inherited;
end;

procedure TCircleDynamic.Draw(aCnv: TCanvas);
var
  point : TRect;
  cx, cy, ex, ey, r: Integer;
  dx, dy, BOffset, BShape : Double;
  pOffset, pShape, pParent : t2DPoint;
  bmp : TBitmap;
begin
  inherited;

  case Orientation of
    0 : BOffset := ValidateDegree( BearingOffset);
    1 : BOffset := ValidateDegree(BearingOffset);
  end;

  FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}

  BShape := postCenter.Bearing + RotationOffset;
  FindPoint(pOffset, pShape, postCenter.Range, BShape);    {Shape from Point offset}

  dx := pShape.X + radius/60;
  dy := pShape.Y;

  Converter.ConvertToScreen(pShape.X, pShape.Y, cx, cy);
  Converter.ConvertToScreen(dx, dy, ex, ey);

  r := Abs(cx - ex);

  point.Left    := cx - r;
  point.Top     := cy - r;
  point.Right   := cx + r;
  point.Bottom  := cy + r;

  with aCnv do
  begin

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
      Brush.Style := BrushStyle;
    end
    else
    begin
      Brush.Style := BrushStyle;
      Brush.Color := ColorFill;
    end;

    if isSelected then
      Pen.color   := clGray;

    Ellipse(point.Left, point.Top, point.Right, point.Bottom);
  end;
end;

{ TEllipseDynamic }

constructor TEllipseDynamic.create;
begin
  inherited;
end;

destructor TEllipseDynamic.destroy;
begin

  inherited;
end;

procedure TEllipseDynamic.Draw(aCnv: TCanvas);
var
  point : TRect;
  cx, cy, ex, ey, Hr, Vr: Integer;
  dx, dy, BOffset, BShape : Double;
  pOffset, pShape, pParent : t2DPoint;
  bmp : TBitmap;
begin
  inherited;

  case Orientation of
    0 : BOffset := ValidateDegree(BearingOffset);
    1 : BOffset := ValidateDegree(BearingOffset);
  end;

  FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}

  BShape := postCenter.Bearing + RotationOffset;
  FindPoint(pOffset, pShape, postCenter.Range, BShape);    {Shape from Point offset}

  dx := pShape.X + Hradius/60;
  dy := pShape.Y + Vradius/60;

  Converter.ConvertToScreen(pShape.X, pShape.Y, cx, cy);
  Converter.ConvertToScreen(dx, dy, ex, ey);

  Hr := Abs(cx - ex);
  Vr := Abs(cy - ey);

  point.Left    := cx - Hr;
  point.Top     := cy - Vr;
  point.Right   := cx + Hr;
  point.Bottom  := cy + Vr;

  with aCnv do
  begin

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
     Pen.color   := clGray;

    Ellipse(point.Left, point.Top, point.Right, point.Bottom);
  end;

end;

{ TArcDynamic }

constructor TArcDynamic.create;
begin
  inherited;

end;

destructor TArcDynamic.destroy;
begin

  inherited;
end;

procedure TArcDynamic.Draw(aCnv: TCanvas);
var
  point : TRect;
  cx, cy, sx, sy,
  ex, ey, tx, ty, r: Integer;
  dx, dy, BOffset, BShape : Double;
  StartPoint, EndPoint,
  pOffset, pShape, pParent : t2DPoint;
  bmp : TBitmap;
begin
  inherited;
  case Orientation of
    0 : BOffset := ValidateDegree(BearingOffset);
    1 : BOffset := ValidateDegree(BearingOffset);
  end;

  BShape := postCenter.Bearing + RotationOffset;

  FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}
  FindPoint(pOffset, pShape, postCenter.Range, BShape);   {Shape from Point offset}
  FindPoint(pShape, StartPoint, radius, StartAngle);      {Start Angle}
  FindPoint(pShape, EndPoint, radius, EndAngle);          {End Angle}

  dx := pShape.X + radius/60;
  dy := pShape.Y ;

  Converter.ConvertToScreen(pShape.X, pShape.Y, cx, cy);
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
//    if BrushStyle = bsClear then

//      begin

//        Brush.Style := BrushStyle
//      end

//    else

//      begin

//        Brush.Style := BrushStyle;
//        Brush.Color := ColorFill;
//      end;

    if isSelected then
     Pen.color   := clGray;

    Arc(point.Left, point.Top, point.Right, point.Bottom, ex, ey, sx, sy);
  end;
end;

{ TSectorDynamic }

constructor TSectorDynamic.create;
begin
  inherited;

end;

destructor TSectorDynamic.destroy;
begin

  inherited;
end;

procedure TSectorDynamic.Draw(aCnv: TCanvas);
var
  Ipoint, Opoint : TRect;
  cx, cy,
  Isx, Isy, Iex, Iey,
  Osx, Osy, Oex, Oey,
  tx, ty, rIn, rOut  : Integer;

  Idx, Idy, Odx, Ody,
  BOffset, BShape : Double;

  pOffset, pShape, pParent : t2DPoint;
  IStartPoint, IEndPoint : t2DPoint;
  OStartPoint, OEndPoint : t2DPoint;
  bmp : TBitmap;
begin
  inherited;

  case Orientation of
    0 : BOffset := ValidateDegree(BearingOffset);
    1 : BOffset := ValidateDegree(BearingOffset);
  end;

  BShape := postCenter.Bearing + RotationOffset;

  FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}
  FindPoint(pOffset, pShape, postCenter.Range, BShape);   {Shape from Point offset}

  FindPoint(pShape, IStartPoint, Iradius, StartAngle);    {Start Angle}
  FindPoint(pShape, IEndPoint, Iradius, EndAngle);        {End Angle}

  FindPoint(pShape, OStartPoint, Oradius, StartAngle);    {Start Angle}
  FindPoint(pShape, OEndPoint, Oradius, EndAngle);        {End Angle}

  Idx := pShape.X + Iradius/60;
  Idy := pShape.Y;

  Odx := pShape.X + Oradius/60;
  Ody := pShape.Y;

  Converter.ConvertToScreen(pShape.X, pShape.Y, cx, cy);
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

//    if BrushStyle = bsClear then

//      begin

//        Brush.Style := BrushStyle
//      end

//    else

//      begin

//        Brush.Style := BrushStyle;
//        Brush.Color := ColorFill;
//      end;

    if isSelected then
     Pen.color   := clGray;

    Arc(Ipoint.Left, Ipoint.Top, Ipoint.Right, Ipoint.Bottom, Iex, Iey, Isx, Isy);
    Arc(Opoint.Left, Opoint.Top, Opoint.Right, Opoint.Bottom, Oex, Oey, Osx, Osy);
    MoveTo(Iex, Iey); LineTo(Oex, Oey);
    MoveTo(Isx, Isy); LineTo(Osx, Osy);
  end;

end;

{ TGridDynamic }

constructor TGridDynamic.create;
begin
  inherited;

end;

destructor TGridDynamic.destroy;
begin

  inherited;
end;

procedure TGridDynamic.Draw(aCnv: TCanvas);
var
  i, cx, cy,
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

  dx, dy, BOffset, BShape : Double;
  pOffset, pShape, pParent : t2DPoint;
  bmp : TBitmap;
begin
  inherited;

  case Orientation of
    0 : BOffset := ValidateDegree(BearingOffset);
    1 : BOffset := ValidateDegree(BearingOffset);
  end;

  BShape := postCenter.Bearing + RotationOffset;

  FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}
  FindPoint(pOffset, pShape, postCenter.Range, BShape);   {Shape from Point offset}

  //Point Kiri Atas
  IStart.X := pShape.X - ((Width/60)*(WCount/2));
  IStart.Y := pShape.Y + ((Height/60)*(HCount)/2);

  //Point Kanan Atas
  IEnd.X := pShape.X + ((Width/60)*(WCount/2));
  IEnd.Y := pShape.Y + ((Height/60)*(HCount)/2);

  //Point Kanan Bawah
  OStart.X := pShape.X + ((Width/60)*(WCount/2));
  OStart.Y := pShape.Y - ((Height/60)*(HCount)/2);

  //Point Kiri Bawah
  OEnd.X := pShape.X - ((Width/60)*(WCount/2));
  OEnd.Y := pShape.Y - ((Height/60)*(HCount)/2);

  BKiAts  := CalcBearing(pShape.X, pShape.Y, IStart.X, IStart.Y);
  BKaAts  := CalcBearing(pShape.X, pShape.Y, IEnd.X, IEnd.Y);
  BKaBwh  := CalcBearing(pShape.X, pShape.Y, OStart.X, OStart.Y);
  BKiBwh  := CalcBearing(pShape.X, pShape.Y, OEnd.X, OEnd.Y);

  RKiAts  := CalcRange(pShape.X, pShape.Y, IStart.X, IStart.Y);
  RKaAts  := CalcRange(pShape.X, pShape.Y, IEnd.X, IEnd.Y);
  RKaBwh  := CalcRange(pShape.X, pShape.Y, OStart.X, OStart.Y);
  RKiBwh  := CalcRange(pShape.X, pShape.Y, OEnd.X, OEnd.Y);

  FindPoint(pShape, IStart, RKiAts, BKiAts + Rotation);
  FindPoint(pShape, IEnd, RKaAts, BKaAts + Rotation);
  FindPoint(pShape, OStart, RKaBwh, BKaBwh + Rotation);
  FindPoint(pShape, OEnd, RKiBwh, BKiBwh + Rotation);

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

//    if BrushStyle = bsClear then

//      begin

//        Brush.Style := BrushStyle
//      end

//    else

//      begin

//        Brush.Style := BrushStyle;
//        Brush.Color := ColorFill;
//      end;

    if isSelected then
     Pen.color   := clGray;

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
end;

{ TDynamicOverPolygon }

constructor TPolygonDynamic.create;
begin
  inherited;
  polyList := TList.Create;
end;

destructor TPolygonDynamic.destroy;
begin
  inherited;
  polyList.Free;
end;

procedure TPolygonDynamic.Draw(aCnv: TCanvas);
var
  i : Integer;

  Isx, Isy : Integer;
  point : TDotDynamic;
  BOffset, BShape : Double;

  pOffset, pShape, pParent :  t2DPoint;
begin
  inherited;

  case Orientation of
    0 : BOffset := ValidateDegree( BearingOffset);
    1 : BOffset := ValidateDegree(BearingOffset);
  end;

  FindPoint(ParentPos, pOffset, RangeOffset, BOffset);   {Point offset from Ship}

  SetLength(polyPoint, polyList.Count);

  for i := 0 to polyList.Count - 1 do
  begin
    point := polyList.Items[i];

    BShape := point.Bearing + RotationOffset;
    FindPoint(pOffset, pShape, point.Range, BShape); {Shape from Point offset}

    Converter.ConvertToScreen(pShape.X, pShape.Y, Isx, Isy);
    polyPoint[i].x := Isx;
    polyPoint[i].y := Isy;
  end;

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
     Pen.color   := clGray;

    Polygon(polyPoint);
  end;
end;

{ TDotDynamic }

constructor TDotDynamic.Create;
begin

end;

destructor TDotDynamic.Destroy;
begin

  inherited;
end;

end.
