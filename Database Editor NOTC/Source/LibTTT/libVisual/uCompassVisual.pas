unit uCompassVisual;

interface

uses
  Classes, Windows, Graphics;

type

  //kompas kotak ala ASTT
  TCompassVisual  = class
  private
    FHalfWidth, FHalfHeight : Integer;
    FWidth: Integer;
    FHeight: Integer;
    procedure setSize(const Index, Value: Integer);
  public
    ptC       : TPoint;
    Color     : TColor;
    FontColor : TColor;

    constructor Create;
    procedure DrawCompass(aCnv: TCanvas);

  public

    property Width: Integer index 1 read FWidth write setSize;
    property Height: Integer index 2 read FHeight write setSize;

 end;



implementation

  uses
    Math, SysUtils;

  type

   t2DPoint = record
     X : double;
     Y : double;
   end;


  function RoundPoint(const d: t2DPoint): TPoint;
  begin
   Result.X := Round(d.X);
   Result.Y := Round(d.Y);
  end;

  function ConvCoordPolar_To_Cartesian(const aAngleRadian, aRadius: double): t2DPoint;
  begin
    Result.x := aRadius * Cos(aAngleRadian);
    Result.y := aRadius * Sin(aAngleRadian);
  end;

  procedure TranslatePoint(const ct: TPoint; var pt: TPoint);
  begin
    pt.x := ct.X + pt.X;
    pt.y := ct.Y - pt.Y;
  end;
  function calcRect(const pt: tPoint; const r: integer): tRect;
  var d: integer;
  begin
    d := abs(r);
    Result := Rect(pt.X - d, pt.Y - d, pt.X + d, pt.Y + d)
  end;

  function makeInRange(const pt: tPoint; bx, bY: integer): TPoint;
  begin
    result := pt;
    if pt.X > bx then
       result.X :=  bx;
    if pt.X < - bx then
      result.X :=  -bx;
    if pt.y > by then
       result.y :=  by;
    if pt.y < - by then
      result.y :=  -by;
  end;

  function ValidateDegree(const degreeOrg: double): double;
  begin
    result := degreeOrg - (Floor(degreeOrg / 360.0) * 360.0);
  end;

 { TDrawCompass }
  constructor TCompassVisual.Create;
  begin
//    ptC   := Point(200,200);
    Width  := 600;
    Height := 600;
    Color :=  clBlack;
  end;



  procedure TCompassVisual.DrawCompass(aCnv: TCanvas);
  const tickwidth = 10;
        lbl_Space = 18;
        lbl_W = 10;
        lbl_H = 7;
  var i : integer;
      aDeg: double;
      iDeg : integer;
      pt, pt1, pt2, pt3: TPoint;
      r : Double;
      sz : TSize;
      s: string;
  begin
    aCnv.Pen.Color := Color;
    aCnv.Font.Color := Color;
    SetBkMode(aCnv.Handle, TRANSPARENT);

    r := Sqrt(Sqr(FHalfWidth) + Sqr(FHalfHeight)  );
    for i := 0 to 35 do begin
      aDeg := DegToRad(i * 10);
      pt1.X := ptC.X +  FHalfWidth;

      pt := RoundPoint(ConvCoordPolar_To_Cartesian(aDeg, r));
      pt1 := makeInRange(pt, FHalfWidth, FHalfHeight);
      TranslatePoint(ptC, pt1);

      pt := RoundPoint(ConvCoordPolar_To_Cartesian(aDeg, r -16));
      pt2 := makeInRange(pt, FHalfWidth -16, FHalfHeight - 16 );
      TranslatePoint(ptC, pt2);

      pt := RoundPoint(ConvCoordPolar_To_Cartesian(aDeg, r -22));
      pt3 := makeInRange(pt, FHalfWidth -22, FHalfHeight - 22 );
      TranslatePoint(ptC, pt3);

      iDeg := Round( ValidateDegree( 90 - i * 10));
      s := Format('%3d', [iDeg]);

      sz := aCnv.TextExtent(s);
      aCnv.TextOut(pt3.X - ((sz.cx + 1) div 2), (pt3.Y - ((sz.cy + 1) div 2)),
      s);

      aCnv.MoveTo (pt2.X, pt2.Y);
      aCnv.LineTo (pt1.X, pt1.Y);


    end;
  end;


  procedure TCompassVisual.setSize(const Index, Value: Integer);
  begin
    case index of
      1 : begin
        FWidth      := Value;
        FHalfWidth  := (Value + 1) div 2 ;
        ptC.X       := (Value + 1) div 2 ;
      end;
      2 : begin
        FHeight  := Value;
        FHalfHeight  := (Value + 1) div 2 ;
        ptC.Y    := (Value + 1) div 2
      end;
    end;

  end;


end.
