unit uMainPlottingShape;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, uMapXHandler, uCoordConvertor,
  uLibSettingTTT, tttData, uBaseCoordSystem, uGameData_TTT,
  {TeCanvas,} ColorGrd, uDataTypes, uObjectVisuals, uSnapshotData;

type

  TVehicleOnBase = class
  public
    Name : string;
    Quantity : Integer;
    Simbol : string;
    IndexTaktisSymbol : Integer;
    constructor create;
    destructor Destroy; override;

    function GetSnapshotData : _SS_TVehicleOnBase;
  end;

  TLogisticOnBase = class
  public
    Name : string;
    Status : string;

    constructor create;
    destructor Destroy; override;

    function GetSnapshotData : _SS_TLogisticOnBase;
  end;

  TIntelijenInfo = class
  public
    Info : string;

    constructor create;
    destructor Destroy; override;

    function GetSnapshotData : _SS_TIntelijenInfo;
  end;

  TMainPlottingShape = class
  private
    FPlottingId : Integer;
    FName : string;
    FGroup : string;
    FIdentity : Integer;
    FTipe: Integer;
    FTime : TDateTime;
    FForce : Integer;
    FRole : Byte;
    FRoleName : string;

    FConverter: TCoordConverter;

    function SetTempHuruf(Huruf : TFont; id : Byte): TFont;

    procedure changeBitmapColor(bmp: TBitmap; clr: TColor);

    procedure SetLineProp(var gx: Integer;  x, gx1, gx2: Integer);
    procedure SetName(const Value: string);
    procedure SetGroup(const Value: string);
    procedure SetTipe(const Value: Integer);
    procedure SetTime(const Value : TDateTime);
    procedure SetForce(const Value : Integer);

//    procedure SetCubicle(const Value: Integer);
    procedure SetConverter(const Value: TCoordConverter);
    procedure SetStyleHuruf(iCvs: TCanvas; iStyle: TFontStyle; iSize, iColor: Integer; iName: string);
    procedure drawObjek(FCanvas: TCanvas; id, x, y : Integer);

  public
    postCenter  : t2DPoint;
    TableProp   : t2DPoint;
    isRepostProperty  : Boolean;
    isRepostPlot  : Boolean;
    isShow      : Boolean;
    isSelected  : Boolean;
    IsCreate : Boolean;
    FTempHuruf  : TFont;
    isSedangdiEdit : Boolean;

    constructor create(cvt : TCoordConverter);
    destructor Destroy; override;

    function PackingName(OldName : string): string;
    function PackingQty(OldQty : Integer): string;
    function PackingInfo(OldStatus : string): string;
    function GetSnapshotData : _SS_TMainPlotting; virtual;

    procedure Draw(FCanvas: TCanvas); virtual;

    property PlottingId : Integer read FPlottingId write FPlottingId;
    property Name   : string read FName write SetName;
    property Identity : Integer read FIdentity write FIdentity;
    property Group  : string read FGroup write SetGroup;
    property Tipe   : Integer read FTipe write SetTipe;
    property Time   : TDateTime read FTime write SetTime;
    property Force  : Integer  read FForce write FForce;
    property Role   : Byte read FRole write FRole;
    property RoleName : string read FRoleName write FRoleName;

    property Converter : TCoordConverter read FConverter write SetConverter;
  end;

  TIntelijenPlotting = class (TMainPlottingShape)
  public
    InfoList   : TList;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;

    function GetSnapshotData : _SS_TMainPlotting;

    procedure Draw(FCanvas: TCanvas); override;
  end;

  TLogisticPlotting = class (TMainPlottingShape)
  public
    LogisticList   : TList;

    function GetSnapshotData : _SS_TMainPlotting;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas); override;

  end;

  TPangkalanPlotting = class (TMainPlottingShape)
  public
    VehiclesList   : TList;
    idTaktis : Integer;


    function GetSnapshotData : _SS_TMainPlotting;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas); override;
  end;

  TRadarPlotting = class (TMainPlottingShape)
  public
    Radius : Double;

    function GetSnapshotData : _SS_TMainPlotting;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas); override;
  end;

  TPanahPlotting = class (TMainPlottingShape)
  public
    postEnd  : t2DPoint;
    isPostEnd : Boolean;

    function GetSnapshotData : _SS_TMainPlotting;

    constructor Create(cvt : TCoordConverter);
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas); override;
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
  isSedangdiEdit := False;
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
  lengthName : Integer;
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
    changeBitmapColor(bmp, Identity);

    x1 := x - (bmp.Width div 2);
    y1 := y - (bmp.Height div 2);

    Draw(x1, y1, bmp);

    {draw name}
    if not isShow then
    begin
      lengthName := (length(Name) div 2) * 8;
      SetStyleHuruf(FCanvas, fsBold, 10, Identity, 'Maiandra GD');
      TextOut(round(x-lengthName), round(y + (bmp.Height/2)), Name);
    end;

    bmp.Free;
  end;
end;

function TMainPlottingShape.GetSnapshotData: _SS_TMainPlotting;
var
  ssTemp : _SS_TMainPlotting;
begin
  ssTemp.PlottingId := PlottingId;
  ssTemp.Name := Name;
  ssTemp.Identity := Identity;
  ssTemp.Tipe := Tipe;
  ssTemp.Time := Time;
  ssTemp.Force := Force;
  ssTemp.Role := Role;
  ssTemp.RoleName := RoleName;
  ssTemp.postCenter := postCenter;

  Result := ssTemp;
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

procedure TMainPlottingShape.SetForce(const Value: Integer);
begin
  FForce := Value;
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

procedure TMainPlottingShape.SetTime(const Value: TDateTime);
begin
  FTime := Value;
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
  inherited;
  VehiclesList.Free;
end;

procedure TPangkalanPlotting.Draw(FCanvas: TCanvas);
var
  i, x, y, cx, cy, gx, lengthName : Integer;
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
      Pen.Color := Identity;
      Pen.Style := psSolid;

      {$REGION ' Menggambar callout dari titik ke table '}
      SetLineProp(gx, x, Round(cx+50), Round(cx+300));
      Brush.Color := Identity;
      SetLength(Point, 3);
      Point[0].X := x;
      Point[0].Y := y;
      Point[1].X := gx;
      Point[1].Y := cy-50;
      Point[2].X := gx;
      Point[2].Y := cy-30;
      Polygon(Point);
      {$ENDREGION}

      Pen.Style := psSolid;

      {$REGION ' Background Table '}
      Brush.Color := clWhite;
      Rectangle(cx+50, cy-50, cx+300, cy +((VehiclesList.Count-1)*16));
      MoveTo(cx+220, cy-50); LineTo(cx+220, cy +((VehiclesList.Count-1)*16));
      MoveTo(cx+260, cy-50); LineTo(cx+260, cy +((VehiclesList.Count-1)*16));
      {$ENDREGION}

      {$REGION ' Header Table '}
      lengthName := (length(Name) div 2) * 11;

      SetStyleHuruf(FCanvas, fsBold, 12, clWhite, 'Maiandra GD');
      Brush.Color := Identity;
      Rectangle(cx+50, cy-50, cx+300, cy-30);
      TextOut(round(cx + (180 - lengthName)), cy-50, Name);
      {$ENDREGION}

      {$REGION ' Isi Table '}
      for I := 0 to VehiclesList.Count - 1 do
      begin
        vehicleOnBase := VehiclesList[i];
        SetStyleHuruf(FCanvas, fsItalic, 10, Identity, 'Courier New');
        TextOut(cx+60, cy-25, PackingName(vehicleOnBase.Name));
        TextOut(cx+230, cy-25, PackingQty(vehicleOnBase.Quantity));

        SetStyleHuruf(FCanvas, fsBold, 15, Identity, 'TAKTIS_AL');
        TextOut(cx+270, cy-26,((vehicleOnBase.Simbol)));

        cy:= cy + 16;
      end;
      {$ENDREGION}

    end;
    Font := SetTempHuruf(Font, 1);
  end;
end;

function TPangkalanPlotting.GetSnapshotData: _SS_TMainPlotting;
var
  ssTemp : _SS_TMainPlotting;
begin
  ssTemp := inherited;

  Result := ssTemp;
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
    Pen.Color := Identity;

    Brush.Color := clGray;
    Brush.Style := bsDiagCross;

    {draw range radar}
    if isShow then
      Ellipse(point.Left, point.Top, point.Right, point.Bottom);

    drawObjek(FCanvas, plRadar, cx, cy);

    Font := SetTempHuruf(Font, 1);
  end;
end;

function TRadarPlotting.GetSnapshotData: _SS_TMainPlotting;
var
  ssTemp : _SS_TMainPlotting;

begin
  ssTemp := inherited;

  ssTemp.Radius := Radius;

  Result := ssTemp;
end;

{ TVehicleOnBaseContainer }

constructor TVehicleOnBase.create;
begin

end;

destructor TVehicleOnBase.Destroy;
begin

  inherited;
end;

function TVehicleOnBase.GetSnapshotData: _SS_TVehicleOnBase;
var
  ssVehicleOnBaseTemp : _SS_TVehicleOnBase;
begin

  ssVehicleOnBaseTemp.Name := Name;
  ssVehicleOnBaseTemp.Quantity := Quantity;
  ssVehicleOnBaseTemp.Simbol := Simbol;

  Result := ssVehicleOnBaseTemp;
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
  i, x, y, cx, cy, gx, lengthName : Integer;
  infoIntel : TIntelijenInfo;
  Point : array of TPoint;
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
      Pen.Color := Identity;
      Pen.Style := psSolid;

      {$REGION ' Menggambar callout dari titik ke table '}
      SetLineProp(gx, x, Round(cx+50), Round(cx+370));
      Brush.Color := Identity;
      SetLength(Point, 3);
      Point[0].X := x;
      Point[0].Y := y;
      Point[1].X := gx;
      Point[1].Y := cy-50;
      Point[2].X := gx;
      Point[2].Y := cy-30;
      Polygon(Point);
      {$ENDREGION}

      Pen.Style := psSolid;

      {$REGION ' Background Table '}
      Brush.Color := clWhite;
      Rectangle(cx+50, cy-50, cx+370, cy +((InfoList.Count-1) * 16));
      {$ENDREGION}

      {$REGION ' Header Table '}
      lengthName := (length(Name) div 2) * 11;

      SetStyleHuruf(FCanvas, fsBold, 12, clWhite, 'Maiandra GD');
      Brush.Color := Identity;
      Rectangle(cx+50, cy-50, cx+370, cy - 30);
      TextOut(round(cx + (210 - lengthName)), cy-50, Name);
      {$ENDREGION}

      {$REGION ' Isi Table '}
      SetStyleHuruf(FCanvas, fsItalic, 10, Identity, 'Courier New');
      for I := 0 to InfoList.Count - 1 do
      begin
        infoIntel := InfoList[i];
        TextOut(cx+60, cy-25, PackingInfo(infoIntel.Info));
        cy:= cy + 16;
      end;
      {$ENDREGION}

    end;

    Font := SetTempHuruf(Font, 1);
  end;
end;

function TIntelijenPlotting.GetSnapshotData: _SS_TMainPlotting;
var
  ssTemp : _SS_TMainPlotting;

begin
  ssTemp := inherited;

  Result := ssTemp;
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
  i, x, y, cx, cy, gx, lengthName : Integer;
  LogisticOnBase : TLogisticOnBase;
  Point : array of TPoint;
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
      Pen.Color := Identity;
      Pen.Style := psSolid;

      {$REGION ' Menggambar callout dari titik ke table '}
      SetLineProp(gx, x, Round(cx+50), Round(cx+280));
      Brush.Color := Identity;
      SetLength(Point, 3);
      Point[0].X := x;
      Point[0].Y := y;
      Point[1].X := gx;
      Point[1].Y := cy-50;
      Point[2].X := gx;
      Point[2].Y := cy-30;
      Polygon(Point);
      {$ENDREGION}

      Pen.Style := psSolid;

      {$REGION ' Background Table '}
      Brush.Color := clWhite;
      Rectangle(cx+50, cy-50, cx+280, cy +((LogisticList.Count-1)*16));
      MoveTo(cx+220, cy-50); LineTo(cx+220, cy +((LogisticList.Count-1)*16));
      {$ENDREGION}

      {$REGION ' Header Table '}
      lengthName := (length(Name) div 2) * 11;

      SetStyleHuruf(FCanvas, fsBold, 12, clWhite, 'Maiandra GD');
      Brush.Color := Identity;
      Rectangle(cx+50, cy-50, cx+280, cy-30);
      TextOut(round(cx + (170 - lengthName)), cy-50, Name);
      {$ENDREGION}

      {$REGION ' Isi Table '}
      SetStyleHuruf(FCanvas, fsItalic, 10, Identity, 'Courier New');
      for I := 0 to LogisticList.Count - 1 do
      begin
        LogisticOnBase := LogisticList[i];
        TextOut(cx+60, cy-25, PackingName(LogisticOnBase.Name));
        TextOut(cx+225, cy-25, LogisticOnBase.Status);

        cy:= cy + 16;
      end;
      {$ENDREGION}

    end;

    Font := SetTempHuruf(Font, 1);
  end;
end;

function TLogisticPlotting.GetSnapshotData: _SS_TMainPlotting;
var
  ssTemp : _SS_TMainPlotting;

begin
  ssTemp := inherited;

  Result := ssTemp;
end;

{ TLogisticOnBase }

constructor TLogisticOnBase.create;
begin

end;

destructor TLogisticOnBase.Destroy;
begin

  inherited;
end;

function TLogisticOnBase.GetSnapshotData: _SS_TLogisticOnBase;
var
  ssLogOnBaseTemp : _SS_TLogisticOnBase;
begin

  ssLogOnBaseTemp.Name := Name;
  ssLogOnBaseTemp.Status := Status;

  Result := ssLogOnBaseTemp;
end;

{ TIntelijenInfo }

constructor TIntelijenInfo.create;
begin

end;

destructor TIntelijenInfo.Destroy;
begin

  inherited;
end;

function TIntelijenInfo.GetSnapshotData: _SS_TIntelijenInfo;
var
  ssinfoTemp : _SS_TIntelijenInfo;
begin

  ssinfoTemp.Info := Info;

  Result := ssinfoTemp;
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
      Pen.Color := Identity;

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
      changeBitmapColor(bmp, Identity);

      xe := x5 - (bmp.Width div 2);
      ye := y5 - (bmp.Height div 2);

      Draw(xe, ye, bmp);
      bmp.Free;
    end;
    Font := SetTempHuruf(Font, 1);
  end;
end;

function TPanahPlotting.GetSnapshotData: _SS_TMainPlotting;
var
  ssTemp : _SS_TMainPlotting;

begin
  ssTemp := inherited;

  ssTemp.postEnd := postEnd;

  Result := ssTemp;
end;

end.


