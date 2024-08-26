unit uDBAsset_Embark_Library;

interface

uses  tttData, Windows, uCoordConvertor, Classes, uBaseCoordSystem, uDataTypes,
      Graphics, uLibSettingTTT, uFormula;

type

  TPlatform_Embark_Library = class
    public
      FData   : TRecPlatform_Embark_Library;
  end;

  TPlatformBase = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  public
    id : Integer;
    identifier : string;
    force : Integer;
    Longitude : Double;
    Latitude : Double;
    ListVehicle : Tlist;
    ListPersonel : Tlist;
    Radius   : Double;
    TypeBase : Integer;
    isShow : Boolean;
    isSelected : Boolean;

    Fuel, Lubricants, FreshWater, Water, Food : Double; {dlm m3, kecuali food dlm ton}

    constructor Create;
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas);
    procedure changeBitmapColor(bmp: TBitmap; clr: TColor);

    property Converter : TCoordConverter read FConverter write SetConverter;
  end;

  TPlatformBaseContainer = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  protected

  public
    ListBase         : TList;
    FFormula      : TFormula;

    constructor Create;
    destructor Destroy; override;

    function SelectBase(pos : TPoint; var state: Boolean):Boolean;
    function GetPlatformBaseByID(IdBase : Integer): TPlatformBase;

    procedure ShowBase;
    procedure Clear;
    procedure Draw(FCanvas: TCanvas);

    procedure AddBase(Pangkalan : TPlatformBase);
    procedure RemoveBase(Pangkalan : TPlatformBase);

    property Converter : TCoordConverter read FConverter write SetConverter;

  end;

implementation

{ TBaseEmbarLibrary }

procedure TPlatformBase.changeBitmapColor(bmp: TBitmap; clr: TColor);
type
    TArrayByte = array[0..255] of Byte;
    PAByte = ^TArrayByte;
var i, j: Integer;
    pB : PAByte;
    hPal: HPALETTE;
    dClr, bClr : byte;
begin
  bmp.PixelFormat := pf8bit;
  hPal   := bmp.Palette;
  bClr := GetNearestPaletteIndex(hPal, clBlack);
  dClr := GetNearestPaletteIndex(hPal, clr);

  for j := 0 to bmp.Height - 1 do begin
    pb := bmp.ScanLine[j];
    for i := 0 to bmp.Width-1  do  begin
      if pB[i] = bClr then
        pB[i] := dClr;
    end;
  end;
end;

constructor TPlatformBase.Create;
begin
  ListVehicle := TList.Create;
  ListPersonel := TList.Create;

//  Fuel := 10000;
//  Lubricants := 10000;
//  FreshWater := 10000;
//  Water := 10000;
//  Food := 10000;
end;

destructor TPlatformBase.Destroy;
begin
  ListVehicle.Free;
  ListPersonel.Free;
  inherited;
end;

procedure TPlatformBase.Draw(FCanvas: TCanvas);
var
  cx, cy, ex, ey, r: Integer;
  dx, dy : Double;
  point : TRect;
  bmp : TBitmap;
  postCenter : t2DPoint;
  warna  : Integer;
begin
  postCenter.X := Longitude;
  postCenter.Y := Latitude;

  dx := postCenter.X + radius/60;
  dy := postCenter.Y;

  Converter.ConvertToScreen(postCenter.X, postCenter.Y, cx, cy);
  Converter.ConvertToScreen(dx, dy, ex, ey);

   r := Abs(cx - ex);

  point.Left    := cx - r;
  point.Top     := cy - r;
  point.Right   := cx + r;
  point.Bottom  := cy + r;

  with FCanvas do
  begin
    {draw lambang}
    bmp := TBitmap.Create;

    case force of
      1: warna := clRed;
      2: warna := clYellow;
      3: warna := clBlue;
      4: warna := clGreen;
      5: warna := clWhite;
    end;

    {Drae radius pangkalan}
    Pen.Style := psDot;
    Pen.Color := warna;
    Brush.Style := bsClear;

    if isShow then
    begin
      Arc((point.Left),(point.Top),(point.Right),(point.Bottom), (point.Left+Round(point.Right/2)),(point.Top),
        (point.Left+Round(point.Right/2)),(point.Top)); {dipakai untuk menghindari fill}
    end;

    {Draw lambang pangkalan}
    if TypeBase = 0 then
       bmp.LoadFromFile(vSymbolSetting.ImgPath + pctBaseAU + '.bmp')
    else
       bmp.LoadFromFile(vSymbolSetting.ImgPath + pctBaseAL + '.bmp');

    ex := cx - (bmp.Width div 2);
    ey := cy - (bmp.Height div 2);

    changeBitmapColor(bmp, warna);

    Draw(ex, ey, bmp);

    {Draw nama pangkalan}
    Font.Color := warna;
    Font.Size := 12;
    Font.Name := 'Maiandra GD';
    TextOut(round(cx), round(cy + (bmp.Height)), identifier);

    bmp.Free;
  end;
end;

procedure TPlatformBase.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

{ TDrawBase }

procedure TPlatformBaseContainer.AddBase(Pangkalan: TPlatformBase);
begin
  ListBase.Add(Pangkalan);
end;

procedure TPlatformBaseContainer.Clear;
begin
  ListBase.Clear;
end;

constructor TPlatformBaseContainer.Create;
begin
  ListBase := TList.Create;
end;

destructor TPlatformBaseContainer.Destroy;
begin
  ListBase.Free;
  inherited;
end;

procedure TPlatformBaseContainer.Draw(FCanvas: TCanvas);
var
  i : Integer;
  item : TPlatformBase;
begin
  for i := 0 to ListBase.Count - 1 do
  begin
    item := ListBase[i];
    item.Converter := Converter;
    item.Draw(FCanvas);
  end;
end;

function TPlatformBaseContainer.GetPlatformBaseByID(IdBase: Integer): TPlatformBase;
var
  i : Integer;
  item : TPlatformBase;
begin
  Result := nil;

  for i := 0 to ListBase.Count - 1 do
  begin
    item := ListBase[i];

    if item.id = IdBase then
    begin
      Result := item;
      Exit;
    end;
  end;
end;

procedure TPlatformBaseContainer.RemoveBase(Pangkalan: TPlatformBase);
begin
  ListBase.Remove(Pangkalan);
end;

function TPlatformBaseContainer.SelectBase(pos: TPoint; var state: Boolean): Boolean;
var
  rect : TRect;
  ptPos : t2DPoint;
  i, j, cx, cy : Integer;
  item : TPlatformBase;
begin
  Result := False;

  for i := 0 to ListBase.Count - 1 do
  begin
    item := ListBase.Items[i];
    item.isSelected := False;
  end;

  for i := 0 to ListBase.Count - 1 do
  begin
    ptPos := FFormula.PointTo2D(pos.X, pos.Y);
    item := ListBase.Items[i];

    Converter.ConvertToScreen(item.Longitude, item.Latitude, cx, cy);

    rect.Left    := cx-19;
    rect.Top     := cy-19;
    rect.Right   := cx+19;
    rect.Bottom  := cy+19;

    if ptToArea(rect, ptPos) then
    begin
      item.isSelected := True;
      state := item.isShow;
      Result := True;
      Exit;
    end;
  end;
end;

procedure TPlatformBaseContainer.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

procedure TPlatformBaseContainer.ShowBase;
var
  i : Integer;
  item : TPlatformBase;
begin
  for i := 0 to ListBase.Count - 1 do
  begin
    item := ListBase.Items[i];

    if item.isSelected then
    begin
      if item.isShow then
        item.isShow := False
      else
        item.isShow := True;

      Exit;
    end;
  end;
end;

end.
