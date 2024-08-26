unit uDBAsset_Base;

interface

uses  tttData, Windows, uCoordConvertor, Classes, uBaseCoordSystem, uDataTypes,
      Graphics, uLibSettingTTT, uFormula;

type
  TBase = class
  public
    FData     : TRecBaseDefinition;
    FPlatform_Embark_Library : TList;
    FScenario : TRecScenario_Definition;
  end;

  TVehicle_On_Base = class
  public
    FData     : TRecVehicle_On_Base;
    FBaseDef  : TRecBaseDefinition;
  end;

  TResource_Base_Mapping = class
  private
    FConverter: TCoordConverter;

    procedure SetConverter(const Value: TCoordConverter);

  public
    FData : TRecResource_Base_Mapping;
    FResource_Allocation : TRecResource_Allocation;

    constructor Create;
    destructor Destroy; override;

    procedure Draw(FCanvas: TCanvas);
    procedure changeBaseBitmapColor(basebmp: TBitmap; basecolor: TColor);

    property Converter : TCoordConverter read FConverter write SetConverter;
  end;

  TBase_Location = class
  public
    FDAta     : TRecBase_Location;
  end;

  TPersonel_Embark_Library = class
  public
    FData     : TRecPersonel_Mapping;
  end;

  TDrawBase = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  public
    ListBase    : TList;
    FFormula    : TFormula;
//    Radius    : Double;

    constructor Create;
    destructor Destroy; override;

    procedure Draw(FCanvas: TCanvas);

    property Converter : TCoordConverter read FConverter write SetConverter;
  end;

  TDefaultEmbark = class
  public
    FData : TRecDefault_Embark;
  end;
implementation

{ TDrawBase }

procedure TResource_Base_Mapping.changeBaseBitmapColor(basebmp: TBitmap; basecolor: TColor);
type
  TArrayByte = array[0..255] of Byte;
  PAByte = ^TArrayByte;
var
  i, j: Integer;
  pB: PAByte;
  hPal: HPALETTE;
  dClr, bClr : Byte;
begin
  basebmp.PixelFormat := pf8bit;
  hPal := basebmp.Palette;
  bClr := GetNearestPaletteIndex(hPal, clBlack);
  dClr := GetNearestPaletteIndex(hPal, basecolor);

  for j := 0 to basebmp.Height - 1 do
  begin
    pB := basebmp.ScanLine[j];
    for i := 0 to basebmp.Width - 1 do
    begin
      if pB[i] = bClr then
        pB[i] := dClr;
    end;
  end;
end;

constructor TDrawBase.Create;
begin
  ListBase := TList.Create;
end;

destructor TDrawBase.Destroy;
begin
  ListBase.Free;
  inherited;
end;

procedure TDrawBase.Draw(FCanvas: TCanvas);
var
  i: Integer;
  item: TResource_Base_Mapping;
begin
  for i := 0 to ListBase.Count - 1 do
  begin
    item := ListBase[i];
    item.Converter := Converter;
    item.Draw(FCanvas);
  end;
end;

procedure TDrawBase.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

{ TResource_Embark_Library_Mapping }

constructor TResource_Base_Mapping.Create;
begin

end;

destructor TResource_Base_Mapping.Destroy;
begin

  inherited;
end;

procedure TResource_Base_Mapping.Draw(FCanvas: TCanvas);
var
  cx, cy, ex, ey, r: Integer;
  dx, dy, baseradius: Double;
  basepoint : TRect;
  basebmp : TBitmap;
  basecenter : t2DPoint;
  basecolor : TColor;
begin
  basecenter.X := FData.Longitude;
  basecenter.Y := FData.Latitude;
  baseradius   := FData.Base_Radius;

  dx := basecenter.X + baseradius/60;
  dy := basecenter.Y;

  Converter.ConvertToScreen(basecenter.X, basecenter.Y, cx, cy);
  Converter.ConvertToScreen(dx, dy, ex, ey);

  r := Abs(cx - ex);

  basepoint.Left    := cx - r;
  basepoint.Top     := cy - r;
  basepoint.Right   := cx + r;
  basepoint.Bottom  := cy + r;

  with FCanvas do
  begin
    basebmp := TBitmap.Create;

    case FData.force of
      1: basecolor := clRed;
      3: basecolor := clBlue;
    end;

    Pen.Style := psDot;
    Pen.Color := basecolor;
    Brush.Style := bsClear;

//    Ellipse(basepoint.Left, basepoint.Top, basepoint.Right, basepoint.Bottom);
    Arc((basepoint.Left),(basepoint.Top),(basepoint.Right),(basepoint.Bottom),
      (basepoint.Left+Round(basepoint.Right/2)),(basepoint.Top),
      (basepoint.Left+Round(basepoint.Right/2)),(basepoint.Top)); {dipakai untuk menghindari fill}

    if FData.Base_TypeBase = 0 then
      basebmp.LoadFromFile('data\Bitmap\' + pctBaseAU + '.bmp')
    else
      basebmp.LoadFromFile('data\Bitmap\' + pctBaseAL + '.bmp');

    ex := cx - (basebmp.Width div 2);
    ey := cy - (basebmp.Height div 2);

    changeBaseBitmapColor(basebmp, basecolor);

    Draw(ex, ey, basebmp);

    Font.Color := basecolor;
    TextOut(Round(cx), Round(cy + (basebmp.Height)),FData.Base_Identifier);
  basebmp.Free;
  end;
end;

procedure TResource_Base_Mapping.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

end.
