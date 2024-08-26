unit uObjectVisuals;

interface

uses
  Windows, Graphics, uSimVisuals, uCoordConvertor ;

type

//------------------------------------------------------------------------------

  TCharVisual = class(TDrawElement)
  public
    procedure Draw(aCanvas: TCanvas); override;
  end;

//------------------------------------------------------------------------------
  TEllipseVisual = class(TDrawElement)
  public
    procedure Draw(aCanvas: TCanvas); override;
  end;

//------------------------------------------------------------------------------
  TLineVisual = class(TDrawElement)
  public
    procedure Draw(aCanvas: TCanvas); override;
  end;

//------------------------------------------------------------------------------
  TTextVisual = class(TDrawElement)
  public
    Text : string;

  public

    constructor Create;
    procedure Draw(aCanvas: TCanvas); override;
  end;

//------------------------------------------------------------------------------
  TCompoundVisual = class(TDrawElement)
  public
    procedure Draw(aCanvas: TCanvas); override;
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
  TShipVisual = class(TDrawElement)
  public
    X, Y : Double;

  public
    constructor Create;

    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure Draw(aCanvas: TCanvas); override;
  end;


  TRangeRingsVisual = class(TDrawElement)
    private
      FRects : array of TRect;
      FRangeInterval: integer;
      FNumOfRanges   : integer;

      procedure SetRangeInterval(const Value: integer);
    public
      constructor Create;
      destructor Destroy; override;

      procedure ConvertCoord(cvt: TCoordConverter); override;
      procedure Draw(aCanvas: TCanvas); override;
    public
      property RangeInterval: Integer read FRangeInterval write SetRangeInterval;
    end;


implementation

uses
  Math,  uBaseCoordSystem;
{ TCharVisual }

procedure TCharVisual.Draw(aCanvas: TCanvas);
begin
  inherited;

end;

{ TEllipseVisual }

procedure TEllipseVisual.Draw(aCanvas: TCanvas);
begin
  inherited;

end;

{ TLineVisual }

procedure TLineVisual.Draw(aCanvas: TCanvas);
begin
  inherited;

end;

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
{ TCompoundVisual }

procedure TCompoundVisual.Draw(aCanvas: TCanvas);
begin
  inherited;

end;

{ TSpeedVectorVisual }
procedure TSpeedVectorVisual.ConvertCoord(cvt: TCoordConverter);
const
    CSPEED_VECTOR_WIDTH = 8.0;
    CMin_Length = 4;

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

  //Calculate SpeedVector Coordinate
  SinCos(headEast, SinA, CosA);

  ptH.X :=  Round(Center.X + spdKnots * CosA);
  ptH.Y :=  Round(Center.Y - spdKnots * sinA);

end;

constructor TSpeedVectorVisual.Create;
begin
  Ratio := 0.5;

end;

procedure TSpeedVectorVisual.Draw(aCanvas: TCanvas);
var r: TRect;
begin
  inherited;

  with aCanvas do begin
    Pen.Color := Color;
    Pen.Width := 1;
    Pen.Style := psSolid;

    r := ptToRect(Center.X, Center.Y , 3, 3);
    Arc(r.Left, r.Top, r.Right, r.Bottom, 0,0,0,0);

    MoveTo(Center.X, Center.Y);
    LineTo(ptH.X, ptH.Y);
  end;

end;

{ TShipVisual }
constructor TShipVisual.Create;
begin
  inherited;


end;

procedure TShipVisual.ConvertCoord(cvt: TCoordConverter);
begin
  inherited;

end;


procedure TShipVisual.Draw(aCanvas: TCanvas);
begin
  inherited;

end;

{ TRangeRing }


constructor TRangeRingsVisual.Create;
begin
  FNumOfRanges := 4;
  SetLength(FRects, FNumOfRanges);

  SetRangeInterval(50); // nautical miles
end;

destructor TRangeRingsVisual.Destroy;
begin

  inherited;
end;

procedure TRangeRingsVisual.ConvertCoord(cvt: TCoordConverter);
var i : integer;
   r : integer;
begin
  inherited;

  for i := 0 to FNumOfRanges-1 do begin
    r := FRangeInterval * (i +1);

    FRects[i].Left   := Center.X - r;
    FRects[i].Top    := Center.Y - r;
    FRects[i].Right  := Center.X + r;
    FRects[i].Bottom := Center.Y + r;
  end;

end;

procedure TRangeRingsVisual.Draw(aCanvas: TCanvas);
var i : integer;
begin
  inherited;

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


end.
