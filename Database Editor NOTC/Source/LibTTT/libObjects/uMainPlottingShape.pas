unit uMainPlottingShape;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, uMapXHandler, uCoordConvertor,
  uLibSettingTTT, tttData, uBaseCoordSystem, uGameData_TTT,
  {TeCanvas,} ColorGrd, uDataTypes, uObjectVisuals;

type

  TVehicleOnBase = class
  public
    Name        : string;
    Quantity    : Integer;
    Simbol      : string;
    IndexTaktis : Integer;

    constructor create;
    destructor Destroy; override;
  end;

  TLogisticOnBase = class
  public
    Name    : string;
    Status  : string;

    constructor create;
    destructor Destroy; override;
  end;

  TIntelijenInfo = class
  public
    Info : string;

    constructor create;
    destructor Destroy; override;
  end;

  TMainPlottingShape = class
  private
    FName     : string;
    FGroup    : string;
    FTipe     : Integer;
    FConverter: TCoordConverter;

    function SetTempHuruf(Huruf : TFont; id : Byte): TFont;

    procedure changeBitmapColor(bmp: TBitmap; clr: TColor);

    procedure SetLineProp(var gx: Integer;  x, gx1, gx2: Integer);
    procedure SetName(const Value: string);
    procedure SetGroup(const Value: string);
    procedure SetTipe(const Value: Integer);

    procedure SetConverter(const Value: TCoordConverter);
    procedure SetStyleHuruf(iCvs: TCanvas; iStyle: TFontStyle; iSize, iColor: Integer; iName: string);
    procedure drawObjek(FCanvas: TCanvas; id, x, y : Integer);

  public
    postCenter  : t2DPoint;
    TableProp   : t2DPoint;
    color       : Integer;
    isRepostProperty  : Boolean;
    isRepostPlot      : Boolean;
    isShow      : Boolean;
    isSelected  : Boolean;
    posend      : Boolean;

    FTempHuruf  : TFont;

    function PackingName(OldName : string): string;
    function PackingQty(OldQty : Integer): string;
    function PackingInfo(OldStatus : string): string;

    constructor create(cvt : TCoordConverter);
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas); virtual;

    property Name   : string read FName write SetName;
    property Group  : string read FGroup write SetGroup;
    property Tipe   : Integer read FTipe write SetTipe;
    property Converter : TCoordConverter read FConverter write SetConverter;
  end;

  TIntelijenPlotting = class (TMainPlottingShape)
  public
    InfoList  : TList;
    mmo       : TMemo;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas); override;
  end;

  TLogisticPlotting = class (TMainPlottingShape)
  public
    LogisticList   : TList;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas); override;

  end;

  TPangkalanPlotting = class (TMainPlottingShape)
  public
    VehiclesList    : TList;
    FontTaktisIndex : Integer;
    idTaktis        : Integer;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas); override;
  end;

  TRadarPlotting = class (TMainPlottingShape)
  public
    Radius : Double;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas); override;
  end;

  TPanahPlotting = class (TMainPlottingShape)
  public
    postEnd   : t2DPoint;
    isPostEnd : Boolean;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas); override;
  end;
  TFlagPoint = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  public
    Post : t2DPoint;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy;
    procedure Draw(aCnv : TCanvas);

    property Converter : TCoordConverter read FConverter write SetConverter;
  end;

implementation

procedure TMainPlottingShape.changeBitmapColor(bmp: TBitmap; clr: TColor);
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

constructor TMainPlottingShape.create;
begin
  FTempHuruf := TFont.Create;
end;

destructor TMainPlottingShape.destroy;
begin

end;

procedure TMainPlottingShape.Draw(FCanvas: TCanvas);
begin
  FCanvas.Pen.Style := psSolid;
end;

procedure TMainPlottingShape.drawObjek(FCanvas: TCanvas; id, x, y: Integer);
var
  x1, y1 : Integer;
  bmp : TBitmap;

begin
  with FCanvas do
  begin
    Pen.Style := psSolid;
    Brush.Style := bsClear;

    {draw lambang}
    bmp := TBitmap.Create;
    case id of
      0, 1:
      begin
        bmp.Transparent := true;
        bmp.LoadFromFile(vSymbolSetting.ImgPath + pctLogisticPoint + '.bmp');
      end;
      2: bmp.LoadFromFile(vSymbolSetting.ImgPath + pctBaseRadar + '.bmp');
      3: bmp.LoadFromFile(vSymbolSetting.ImgPath + pctBaseAL + '.bmp');
      4:
      begin
        bmp.Transparent := true;
        bmp.LoadFromFile(vSymbolSetting.ImgPath + pctPanah + '.bmp');
      end;
    end;
    changeBitmapColor(bmp, color);

    x1 := x - (bmp.Width div 2);
    y1 := y - (bmp.Height div 2);

    Draw(x1, y1, bmp);
    bmp.Free;

    {draw name}
    SetStyleHuruf(FCanvas, fsBold, 10, color, 'Maiandra GD');
    TextOut(round(x), round(y + (bmp.Height/2)), Name);
  end;
end;

function TMainPlottingShape.PackingInfo(OldStatus: string): string;
var
  s, i : Integer;
begin
  Result := OldStatus;

  s := Length(OldStatus);
  if s < 40 then
  begin
    for i := s to 39 do
    begin
      Result := Result + ' ';
    end;
  end;
end;

function TMainPlottingShape.PackingName(OldName: string): string;
var
  s, i : Integer;
begin
  Result := OldName;

  s := Length(OldName);
  if s < 16 then
  begin
    for i := s to 20 do
    begin
      Result := Result + ' ';
    end;
  end;
end;

function TMainPlottingShape.PackingQty(OldQty : Integer): string;
var
  NewQty : Double;
begin
  Result := IntToStr(OldQty);

  if OldQty > 999 then
  begin
    NewQty := OldQty div 1000;
    OldQty := Round(NewQty);
    Result := IntToStr(OldQty) + 'K';
  end;
end;

function TMainPlottingShape.SetTempHuruf(Huruf : TFont; id : Byte): TFont;
begin
  case id of
    0:
    begin
      FTempHuruf.Style  := Huruf.Style;
      FTempHuruf.Name   := Huruf.Name;
      FTempHuruf.Size   := Huruf.Size;
      FTempHuruf.Color  := Huruf.Color;
    end;
    1:
    begin
      Huruf.Style := FTempHuruf.Style;
      Huruf.Name  := FTempHuruf.Name;
      Huruf.Size  := FTempHuruf.Size;
      Huruf.Color := FTempHuruf.Color;
    end;
  end;

  Result := Huruf;
end;

procedure TMainPlottingShape.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

procedure TMainPlottingShape.SetLineProp(var gx: Integer;  x, gx1, gx2: Integer);
var
  range1, range2 : Integer;

begin
  range1 := Abs(x - (gx1));
  range2 := Abs(x - (gx2));

  if range1 < range2 then
    gx := gx1
  else
    gx := gx2;
end;

procedure TMainPlottingShape.SetStyleHuruf(iCvs: TCanvas; iStyle: TFontStyle; iSize,
  iColor: Integer; iName: string);
begin
  with iCvs do
  begin
    Brush.Style := bsClear;
    Font.Style  := [iStyle];

    if iStyle <> fsBold then
      Font.Style  := [];

    Font.Size   := iSize;
    Font.Color  := iColor;
    Font.Name   := iName;
  end;
end;

procedure TMainPlottingShape.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TMainPlottingShape.SetGroup(const Value: string);
begin
  FGroup := Value;
end;

procedure TMainPlottingShape.SetTipe(const Value: Integer);
begin
  FTipe := Value;
end;

constructor TPangkalanPlotting.create;
begin
  inherited;
  VehiclesList := TList.Create;
  FConverter := cvt;
end;

destructor TPangkalanPlotting.Destroy;
begin
  VehiclesList.Free;
  inherited;
end;

procedure TPangkalanPlotting.Draw(FCanvas: TCanvas);
var
  i, x, y, cx, cy, gx, jml : Integer;
  vehicleOnBase : TVehicleOnBase;
  Point : array of TPoint;
begin
  inherited;
  SetTempHuruf(FCanvas.Font, 0);
  Converter.ConvertToScreen(postCenter.X, postCenter.Y, x, y);
  drawObjek(FCanvas, plPangkalan, x, y);
  Converter.ConvertToScreen(TableProp.X, TableProp.Y, cx, cy);

  with FCanvas do
  begin

    if isShow then
    begin
      {Table}
      Pen.Color := color;
      Pen.Style := psDash;
      SetLineProp(gx, x, Round(cx+50), Round(cx+300));
      Brush.Color := color;
      SetLength(Point, 3);
      Point[0].X := x;
      Point[0].Y := y;
      Point[1].X := gx;
      Point[1].Y := cy-50;
      Point[2].X := gx;
      Point[2].Y := cy-30;
      Polygon(Point);

      Pen.Style := psSolid;
      Brush.Color := clWhite;
      Rectangle(cx+50, cy-50, cx+300, cy +((VehiclesList.Count-1)*16));
      MoveTo(cx+220, cy-50); LineTo(cx+220, cy +((VehiclesList.Count-1)*16));
      MoveTo(cx+250, cy-50); LineTo(cx+250, cy +((VehiclesList.Count-1)*16));

      {Header Table}
      SetStyleHuruf(FCanvas, fsBold, 12, clWhite, 'Maiandra GD');
      Brush.Color := color;
      jml := TextWidth(Name);
      Rectangle(cx+50, cy-50, cx+300, cy-30);
      TextOut(cx + Round(((350-jml)/2)), cy-50, Name);

      {Isi Table}

      for I := 0 to VehiclesList.Count - 1 do
      begin
        vehicleOnBase := VehiclesList[i];
        SetStyleHuruf(FCanvas, fsItalic, 10, color, 'Courier New');
        TextOut(cx+60, cy-25, PackingName(vehicleOnBase.Name));
        TextOut(cx+225, cy-25, PackingQty(vehicleOnBase.Quantity));
        SetStyleHuruf(FCanvas, fsBold, 15, color, 'TAKTIS_AL');
        TextOut(cx+255, cy-28, (vehicleOnBase.Simbol));

        cy:= cy + 16;
      end;
    end;
    Font := SetTempHuruf(Font, 1);
  end;
end;

{ TBaseRadar }

constructor TRadarPlotting.Create(cvt: TCoordConverter);
begin
  inherited;
  FConverter := cvt;
end;

destructor TRadarPlotting.Destroy;
begin
  inherited;
end;

procedure TRadarPlotting.Draw(FCanvas: TCanvas);
var
  cx, cy, ex, ey, r: Integer;
  dx, dy : Double;
  point : TRect;
begin
  inherited;
  SetTempHuruf(FCanvas.Font, 0);
  dx := postCenter.X + radius/60;
  dy := postCenter.Y;

  Converter.ConvertToScreen(postCenter.X, postCenter.Y, cx, cy);
  Converter.ConvertToScreen(dx, dy, ex, ey);

  r := Abs(cx - ex);

  point.Left    := cx - r;
  point.Top     := cy - r;
  point.Right   := cx + r;
  point.Bottom  := cy + r;

  drawObjek(FCanvas, plRadar, cx, cy);

  with FCanvas do
  begin
    Brush.Style := bsClear;

    Pen.Style := psSolid;
    Pen.Color := Color;

    Brush.Color := clGray;
    Brush.Style := bsDiagCross;

    {draw range radar}
    if isShow then
      Ellipse(point.Left, point.Top, point.Right, point.Bottom);

    drawObjek(FCanvas, plRadar, cx, cy);

    Font := SetTempHuruf(Font, 1);
  end;
end;

{ TVehicleOnBaseContainer }

constructor TVehicleOnBase.create;
begin

end;

destructor TVehicleOnBase.Destroy;
begin
  inherited;
end;

{ TIntelijenPlotting }

constructor TIntelijenPlotting.Create(cvt: TCoordConverter);
begin
  inherited;
  FConverter := cvt;
  InfoList := TList.Create;
end;

destructor TIntelijenPlotting.Destroy;
begin
  inherited;
  InfoList.Free;
end;

procedure TIntelijenPlotting.Draw(FCanvas: TCanvas);
var
  i, x, y, cx, cy, gx,jml, hsl : Integer;
  infoIntel : TIntelijenInfo;
  Point     : array of TPoint;
begin
  inherited;
  SetTempHuruf(FCanvas.Font, 0);
  Converter.ConvertToScreen(postCenter.X, postCenter.Y, x, y);
  drawObjek(FCanvas, plIntelijen, x, y);
  Converter.ConvertToScreen(TableProp.X, TableProp.Y, cx, cy);

  with FCanvas do
  begin
    if isShow then
    begin
      {Table}
      Pen.Color := color;
      Pen.Style := psDash;

      SetLineProp(gx, x, Round(cx+50), Round(cx+370));
      Brush.Color := color;
      SetLength(Point, 3);
      Point[0].X := x;
      Point[0].Y := y;
      Point[1].X := gx;
      Point[1].Y := cy-50;
      Point[2].X := gx;
      Point[2].Y := cy-30;
      Polygon(Point);

      Pen.Style := psSolid;
      Brush.Color := clWhite;
      Rectangle(cx+50, cy-50, cx+370, cy +((InfoList.Count-1) * 16));

      {Header Table}
      SetStyleHuruf(FCanvas, fsBold, 12, clWhite, 'Maiandra GD');
      Brush.Color := color;
      Rectangle(cx+50, cy-50, cx+370, cy - 30);
      jml := TextWidth(Name);
      hsl := 420-jml ;
      TextOut( cx +round((hsl/2.0)), cy-50, Name);

      {Isi Table}
      SetStyleHuruf(FCanvas, fsItalic, 10, color, 'Courier New');
      for I := 0 to InfoList.Count - 1 do
      begin
        infoIntel := InfoList[i];
        TextOut(cx + 60, cy-25, PackingInfo(infoIntel.Info));
        cy:= cy + 16;
      end;
    end;
    Font := SetTempHuruf(Font, 1);
  end;
end;
{ TLogisticPlotting }

constructor TLogisticPlotting.Create(cvt: TCoordConverter);
begin
  inherited;
  LogisticList := TList.Create;
  FConverter := cvt;
end;

destructor TLogisticPlotting.Destroy;
begin
  inherited;
  LogisticList.Free;
end;

procedure TLogisticPlotting.Draw(FCanvas: TCanvas);
var
  i, x, y, cx, cy, gx, jml : Integer;
  LogisticOnBase : TLogisticOnBase;
  Point          : array of TPoint;
begin
  inherited;
  SetTempHuruf(FCanvas.Font, 0);
  Converter.ConvertToScreen(postCenter.X, postCenter.Y, x, y);
  drawObjek(FCanvas, plLogistic, x, y);
  Converter.ConvertToScreen(TableProp.X, TableProp.Y, cx, cy);

  with FCanvas do
  begin
    if isShow then
    begin
      {Table}
      Pen.Color := color;
      Pen.Style := psDash;
      SetLineProp(gx, x, Round(cx+50), Round(cx+280));
      Brush.Color := color;
      SetLength(Point, 3);
      Point[0].X := x;
      Point[0].Y := y;
      Point[1].X := gx;
      Point[1].Y := cy-50;
      Point[2].X := gx;
      Point[2].Y := cy-30;
      Polygon(Point);

      Pen.Style := psSolid;
      Brush.Color := clWhite;
      Rectangle(cx+50, cy-50, cx+280, cy +((LogisticList.Count-1)*16));
      MoveTo(cx+220, cy-50); LineTo(cx+220, cy +((LogisticList.Count-1)*16));

      {Header Table}
      SetStyleHuruf(FCanvas, fsBold, 12, clWhite, 'Maiandra GD');
      Brush.Color := color;
      Rectangle(cx+50, cy-50, cx+280, cy-30);
      jml := TextWidth(Name);
      TextOut(cx + Round(((330-jml)/2)), cy-50, Name);

      {Isi Table}
      SetStyleHuruf(FCanvas, fsItalic, 10, color, 'Courier New');
      for I := 0 to LogisticList.Count - 1 do
      begin
        LogisticOnBase := LogisticList[i];
        TextOut(cx+60, cy-25, PackingName(LogisticOnBase.Name));
        TextOut(cx+225, cy-25, LogisticOnBase.Status);

        cy:= cy + 16;
      end;
    end;
    Font := SetTempHuruf(Font, 1);
  end;
end;

{ TLogisticOnBase }

constructor TLogisticOnBase.create;
begin

end;

destructor TLogisticOnBase.Destroy;
begin
  inherited;
end;

{ TIntelijenInfo }

constructor TIntelijenInfo.create;
begin

end;

destructor TIntelijenInfo.Destroy;
begin
  inherited;
end;

{ TPanahPlotting }

constructor TPanahPlotting.Create(cvt: TCoordConverter);
begin
  inherited;
  FConverter := cvt;
end;

destructor TPanahPlotting.Destroy;
begin
  inherited;
end;

procedure TPanahPlotting.Draw(FCanvas: TCanvas);
var
  x, y : Integer;
  ROffset, BOffset : Double;

  p1, p2, p3, p4, p6, p7 : t2DPoint;
  x1, x2, x3, x4, x5, x6, x7, xe,
  y1, y2, y3, y4, y5, y6, y7, ye : Integer;

  bmp : TBitmap;
begin
  inherited;
  SetTempHuruf(FCanvas.Font, 0);

  BOffset := CalcBearing(postCenter.X, postCenter.Y, postEnd.X, postEnd.Y);
  ROffset := CalcRange(postCenter.X, postCenter.Y, postEnd.X, postEnd.Y);

  FindPoint(postCenter, p1, ROffset*0.20, ValidateDegree(BOffset-90));
  FindPoint(postCenter, p2, ROffset*0.20, ValidateDegree(BOffset+90));

  FindPoint(p1, p7, ROffset*0.75, BOffset);
  FindPoint(p2, p3, ROffset*0.75, BOffset);

  FindPoint(p7, p6, ROffset*0.30, ValidateDegree(BOffset-90));
  FindPoint(p3, p4, ROffset*0.30, ValidateDegree(BOffset+90));

  Converter.ConvertToScreen(postCenter.X, postCenter.Y, x, y);
  Converter.ConvertToScreen(p1.X, p1.Y, x1, y1);
  Converter.ConvertToScreen(p2.X, p2.Y, x2, y2);
  Converter.ConvertToScreen(p3.X, p3.Y, x3, y3);
  Converter.ConvertToScreen(p4.X, p4.Y, x4, y4);
  Converter.ConvertToScreen(postEnd.X, postEnd.Y, x5, y5);
  Converter.ConvertToScreen(p6.X, p6.Y, x6, y6);
  Converter.ConvertToScreen(p7.X, p7.Y, x7, y7);

  drawObjek(FCanvas, plPanah, x, y);

  with FCanvas do
  begin
    if isShow then
    begin
      {Table}
      Pen.Style := psSolid;
      Pen.Color := color;

      MoveTo(x1, y1); LineTo(x2, y2);
      MoveTo(x2, y2); LineTo(x3, y3);
      MoveTo(x3, y3); LineTo(x4, y4);
      MoveTo(x4, y4); LineTo(x5, y5);
      MoveTo(x5, y5); LineTo(x6, y6);
      MoveTo(x6, y6); LineTo(x7, y7);
      MoveTo(x7, y7); LineTo(x1, y1);

      {draw lambang}
      bmp := TBitmap.Create;
      bmp.Transparent := true;
      bmp.LoadFromFile(vSymbolSetting.ImgPath + pctPanah + '.bmp');
      changeBitmapColor(bmp, color);

      xe := x5 - (bmp.Width div 2);
      ye := y5 - (bmp.Height div 2);

      Draw(xe, ye, bmp);
      bmp.Free;
    end;
    Font := SetTempHuruf(Font, 1);
  end;
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


