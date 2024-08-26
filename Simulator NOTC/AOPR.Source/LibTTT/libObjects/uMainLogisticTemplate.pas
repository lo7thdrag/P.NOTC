unit uMainLogisticTemplate;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, uMapXHandler, uCoordConvertor,
  uLibSettingTTT, tttData, uBaseCoordSystem, uGameData_TTT,
  {TeCanvas,} ColorGrd, uDataTypes, uObjectVisuals, uSnapshotData;

type

  TPointRoute = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  public
    PointId, Color, Personel : Integer;
    PosAwal, PosAkhir : t2DPoint;
    Range, WaktuTempuh, Speed : Double;
    isEdit, isSelected : Boolean;

    function    GetSnapshotData : _SS_TPointRoute;
    procedure changeBitmapColor(bmp: TBitmap; clr: TColor);

    constructor Create(cvt : TCoordConverter);
    destructor Destroy;
    procedure Draw(aCnv : TCanvas);

    property Converter : TCoordConverter read FConverter write SetConverter;
  end;

  TMainShipingRoute = class
  private
    FShipingRouteId : Integer;
    FName : string;
    FForce : Integer; //dng add force
    FColor : Integer;
    FConverter: TCoordConverter;

    procedure SetConverter(const Value: TCoordConverter);
    procedure SetForce(const Value: Integer);

  protected
    procedure SetName(const Value: string);
    procedure SetColor(const Value: Integer);

  public
    FList : TList;
    isShow : Boolean;

    function GetPointRoute(PointRouteId : Integer): TPointRoute;
    function GetSnapshotData : _SS_TShipingRoute;

    constructor create(cvt : TCoordConverter);
    destructor Destroy; override;

    procedure Clear;
    procedure Draw(FCanvas: TCanvas); virtual;
    procedure Save; virtual; abstract;

    procedure UnselectPointRoute;
    procedure UpdatePointRouteID;
    procedure AddRoute(ORoute : TPointRoute);
    procedure RemoveRoute(ORoute : TPointRoute);

    property ShipingRouteId : Integer read FShipingRouteId write FShipingRouteId;
    property Name : string read FName write SetName;
    property Force : Integer read FForce write SetForce;
    property Color : Integer read FColor write SetColor;
    property Converter : TCoordConverter read FConverter write SetConverter;
  end;



implementation

{ TMainLogisticTemplate }

procedure TMainShipingRoute.AddRoute(ORoute: TPointRoute);
begin
  FList.Add(ORoute);
end;

procedure TMainShipingRoute.Clear;
begin
  FList.Clear;
end;

constructor TMainShipingRoute.create(cvt: TCoordConverter);
begin
  FConverter := cvt;
  FList := TList.Create;
end;

destructor TMainShipingRoute.Destroy;
begin
  inherited;
  FList.Free;
end;

procedure TMainShipingRoute.Draw(FCanvas: TCanvas);
var
  i : Integer;
  item : TPointRoute;

begin
  if not isShow then
    Exit;

  {Draw point route}
  for i := 0 to FList.Count - 1 do
  begin
    item := FList[i];
    item.Draw(FCanvas);
  end;
end;

function TMainShipingRoute.GetPointRoute(PointRouteId: Integer): TPointRoute;
var
  i : Integer;
  item : TPointRoute;
begin
  Result := nil;
  for i := 0 to FList.Count - 1 do
  begin
    item := FList[i];

    if item.PointId = PointRouteId then
    begin
      Result := item;
      Exit;
    end;
  end;
end;

function TMainShipingRoute.GetSnapshotData: _SS_TShipingRoute;
var
  ssTemp : _SS_TShipingRoute;
begin
  ssTemp.ShipingRouteId := ShipingRouteId;
  ssTemp.Name := Name;
  ssTemp.Force := Force;
  ssTemp.Color := Color;
  ssTemp.iShow := False;

  Result := ssTemp;
end;

procedure TMainShipingRoute.RemoveRoute(ORoute: TPointRoute);
begin
  FList.Remove(ORoute);
end;

procedure TMainShipingRoute.SetColor(const Value: Integer);
begin
 FColor := Value;
end;

procedure TMainShipingRoute.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

procedure TMainShipingRoute.SetForce(const Value: Integer);
begin
  FForce := Value;
end;

procedure TMainShipingRoute.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TMainShipingRoute.UnselectPointRoute;
var
  i : Integer;
  item : TPointRoute;
begin
  for i := 0 to FList.Count - 1 do
  begin
    item := FList[i];
    item.isSelected := False;
  end;
end;

procedure TMainShipingRoute.UpdatePointRouteID;
var
  i : Integer;
  item : TPointRoute;
begin
  for i := 0 to FList.Count - 1 do
  begin
    item := FList[i];
    item.PointId := i + 1;
  end;
end;

{ TLogisticRoute }

procedure TPointRoute.changeBitmapColor(bmp: TBitmap; clr: TColor);
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

constructor TPointRoute.Create(cvt: TCoordConverter);
begin
  FConverter := cvt;
end;

destructor TPointRoute.Destroy;
begin

end;

procedure TPointRoute.Draw(aCnv: TCanvas);
var
  x, y,
  x1, y1, x2, y2 : Integer;
  bmp : TBitmap;
begin
  with aCnv do
  begin
    Converter.ConvertToScreen(PosAwal.X, PosAwal.Y, x1, y1);
    Converter.ConvertToScreen(PosAkhir.X, PosAkhir.Y, x2, y2);

    if isEdit then
    begin
      Pen.Style := psDashDot;
      Pen.Color := clBlack;

      if isSelected then
        Pen.Width := 3
      else
        Pen.Width := 1;
    end
    else
    begin
      Pen.Color := color;

      if isSelected then
        Pen.Style := psDashDot
      else
        Pen.Style := psSolid;
    end;

    Font.Color := Color;
    Font.Size := 12;
    TextOut(x1, y1+5, IntToStr(PointId));

    bmp := TBitmap.Create;
    bmp.Transparent := true;
    bmp.LoadFromFile(vSymbolSetting.ImgPath + pctLogisticPoint + '.bmp');
    changeBitmapColor(bmp, color);

    x := x1 - (bmp.Width div 2);
    y := y1 - (bmp.Height div 2);

    Draw(x, y, bmp);

    MoveTo(x1, y1);
    LineTo(x2, y2);

    Font.Color := Color;
    Font.Size := 12;
    TextOut(x2, y2+5, IntToStr(PointId+1));

    x := x2 - (bmp.Width div 2);
    y := y2 - (bmp.Height div 2);
    Draw(x, y, bmp);

    bmp.Free;

    {untuk menormalkan pen yg tidak diset}
    Pen.Width:=1;
    Font.Size := 10;
  end;
end;

function TPointRoute.GetSnapshotData: _SS_TPointRoute;
var
  ssTemp : _SS_TPointRoute;
begin
  ssTemp.PointId := PointId;
  ssTemp.Personel := Personel;
  ssTemp.Color := Color;
  ssTemp.Speed := Speed;
  ssTemp.PosAwalX := PosAwal.X;
  ssTemp.PosAwalY := PosAwal.Y;
  ssTemp.PosAkhirX := PosAkhir.X;
  ssTemp.PosAkhirY := PosAkhir.Y;

  Result := ssTemp;
end;

procedure TPointRoute.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

end.
