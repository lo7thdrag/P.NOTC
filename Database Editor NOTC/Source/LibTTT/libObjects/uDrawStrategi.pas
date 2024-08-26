 unit uDrawStrategi;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin, OleCtrls,
  uMapXHandler, uBaseCoordSystem, math, {TeCanvas,} ColorGrd,
  uMainStrategi, uMainPlottingShape, uPlottingRecord, tttData,
  uRecord, uFormula, uDataTypes, uCoordConvertor;
type

  TDrawStrategi = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  protected

  public
    FList       : TList;
    FFormula    : TFormula;
    edtcolor    : Integer;
    FChangeName : Boolean;
    FNewName    : string;
    constructor Create;
    destructor Destroy; override;

    function SelectPlot(pos : TPoint):Boolean;
    procedure Clear;
    procedure Draw(FCanvas: TCanvas);
    procedure RefreshPlot;
    procedure ReposProperty (x, y : Integer);
    procedure SelectProperty (pos : TPoint);
    procedure AddPlotting(Plotting : TMainPlottingShape);
    procedure SaveStreamData(aStream : TStream);
    procedure ShowStreamData(aStream : TStream);
    property Converter : TCoordConverter read FConverter write SetConverter;
  end;
  TDrawFlagPoint = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  protected

  public
    FList              : TList;

    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Draw(FCanvas: TCanvas);
    property Converter : TCoordConverter read FConverter write SetConverter;
  end;

implementation

constructor TDrawStrategi.Create;
begin
  FList := TList.Create;
end;

destructor TDrawStrategi.Destroy;
begin
  FList.Free;
end;

procedure TDrawStrategi.AddPlotting(Plotting : TMainPlottingShape);
begin
  FList.Add(Plotting);
end;

procedure TDrawStrategi.Clear;
begin
  FList.Clear;
end;

procedure TDrawStrategi.Draw(FCanvas: TCanvas);
var
  i : Integer;
  Plotting : TMainPlottingShape;
begin
  for i := 0 to FList.Count - 1 do
  begin
    Plotting := FList[i];
    Plotting.isShow := True;
    Plotting.Draw(FCanvas);
  end;
end;

procedure TDrawStrategi.RefreshPlot;
var
  i: Integer;
  item : TMainPlottingShape;
begin
  for i := 0 to FList.Count - 1 do
  begin
    item := FList.Items[i];
    item.isRepostProperty := False;
    item.isRepostPlot := False;
    item.posend := False;
    if item is TPanahPlotting then
    begin
      TPanahPlotting(item).isPostEnd := False
    end;
  end;
end;

procedure TDrawStrategi.SaveStreamData(aStream: TStream);
var
  i, j,k    : Integer;
  IntelData : TRecIntelegen;
  LogData   : TRecLogistic;
  BaseData  : TRecBase;
  RadarData : TRecRadar;
  PanahData : TRecPanah;
  intel     : TIntelijenPlotting;
  log       : TLogisticPlotting;
  base      : TPangkalanPlotting;
  panah     : TPanahPlotting;
  radar     : TRadarPlotting;
  plot      : TMainPlottingShape;
begin
  aStream.Position := 0;
  for k := 0 to FList.Count - 1 do
  begin
    plot := FList[k];
    if plot is TIntelijenPlotting then
    begin
      intel := TIntelijenPlotting(plot);
      IntelData.Force := intel.color;
      IntelData.PostCenter := intel.postCenter;

      for j := 0 to intel.infolist.Count - 1 do
      begin
        IntelData.Info[j]:= TIntelijenInfo(intel.infolist.Items[j]).Info;
      end;
      IntelData.LengthIntel := j;
      IntelData.header.id := plIntelijen;
      IntelData.header.Exclude := intel.Name;

      IntelData.header.Size     := sizeof(TrecIntelegen) + sizeOf(string) * j;

      aStream.Write(IntelData, SizeOf(TrecIntelegen));
       for i:= 0 to intel.infolist.Count - 1 do
      begin
        aStream.Write(IntelData.Info[i],SizeOf(string));
      end;
    end
    else if plot is TLogisticPlotting then
    begin
      log := TLogisticPlotting(plot);
      LogData.Force := log.color;
      LogData.PostCenter := log.postCenter;
      for j := 0 to log.LogisticList.Count - 1 do
      begin
        LogData.Item[j] := TLogisticOnBase(log.LogisticList.Items[j]).Name;
        LogData.Status[j] := TLogisticOnBase(log.LogisticList.Items[j]).Status;
      end;
      LogData.LengthLog := j;
      LogData.header.id := plLogistic;
      LogData.header.Size := SizeOf(TRecLogistic)+(SizeOf(string)*2) * j;
      LogData.header.Exclude := log.Name;

      aStream.Write(LogData, SizeOf(TRecLogistic));
      for i := 0 to log.LogisticList.Count - 1 do
      begin
        aStream.Write(LogData.Item[i], SizeOf(string));
        aStream.Write(LogData.Status[i], SizeOf(string));
      end;
    end
    else if plot is TRadarPlotting then
    begin
      radar:= TRadarPlotting(plot);
      RadarData.Force := radar.color;
      RadarData.PostCenter := radar.postCenter;
      RadarData.Radius := radar.Radius;

      RadarData.header.id := plRadar;
      RadarData.header.Size := SizeOf(TRecRadar);
      RadarData.header.Exclude := radar.Name;

      aStream.Write(RadarData, SizeOf(TRecRadar));
    end
    else if plot is TPangkalanPlotting then
    begin
      base := TPangkalanPlotting(plot);
      BaseData.Force := base.color;
      BaseData.IdFontTaktis := base.idTaktis;
      BaseData.PostCenter := base.postCenter;
      for j := 0 to base.VehiclesList.Count - 1 do
      begin
        BaseData.Plat[j] := TVehicleOnBase(base.VehiclesList.Items[j]).Name;
        BaseData.Qty[j] := IntToStr(TVehicleOnBase(base.VehiclesList.Items[j]).Quantity);
        BaseData.FontTaktisIndex[j] := (TVehicleOnBase(base.VehiclesList.Items[j]).Simbol);
      end;
      BaseData.LengthBase := j;
      BaseData.header.id := plPangkalan;
      BaseData.header.Size := SizeOf(TRecBase)+(SizeOf(string)*3)*j;
      BaseData.header.Exclude := base.Name;

      aStream.Write(BaseData, SizeOf(TRecBase));
      for i := 0 to base.VehiclesList.Count - 1 do
      begin
        aStream.Write(BaseData.Plat[i], SizeOf(string));
        aStream.Write(BaseData.Qty[i], SizeOf(string));
        aStream.Write(BaseData.FontTaktisIndex[i], SizeOf(string));
      end;
    end
    else if plot is TPanahPlotting then
    begin
      panah := TPanahPlotting(plot);
      PanahData.Force := panah.color;
      PanahData.PostCenter := panah.postCenter;
      PanahData.PostEnd := panah.postEnd;
      PanahData.header.id := plPanah;
      PanahData.header.Size := SizeOf(TRecPanah);
      PanahData.header.Exclude := panah.Name;

      aStream.Write(PanahData, SizeOf(TRecPanah));
    end;
  end;
end;

function TDrawStrategi.SelectPlot(pos : TPoint):Boolean;
var
  rect : TRect;
  ptPos : t2DPoint;
  i, cx, cy : Integer;
  item : TMainPlottingShape;
begin
  Result := False;

  for i := 0 to FList.Count - 1 do
  begin
    ptPos := FFormula.PointTo2D(pos.X, pos.Y);
    item := FList.Items[i];

    Converter.ConvertToScreen(item.postCenter.X, item.postCenter.Y, cx, cy);

    rect.Left    := cx-19;
    rect.Top     := cy-19;
    rect.Right   := cx+19;
    rect.Bottom  := cy+19;

    if ptToArea(rect, ptPos) then
    begin
      item.isSelected := True;
      Result := True;
      Exit;
    end;
  end;
end;

procedure TDrawStrategi.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

procedure TDrawStrategi.ShowStreamData(aStream: TStream);
var
  I : Integer;
  lastPos : int64;

  HeaderData  : TFileHeaderPlot;
  IntelData   : TRecIntelegen;
  LogData     : TRecLogistic;
  BaseData    : TRecBase;
  ArrowData   : TRecPanah;
  RadarData   : TRecRadar;

  IntelDraw   : TIntelijenPlotting;
  LogDraw     : TLogisticPlotting;
  BaseDraw    : TPangkalanPlotting;
  ArrowDraw   : TPanahPlotting;
  RadarDraw   : TRadarPlotting;

  Temp      : TIntelijenInfo;
  TempLog   : TLogisticOnBase;
  TempBase  : TVehicleOnBase;
begin
  FList.Clear;
  aStream.Position := 0;
  lastPos := aStream.Position;

  while aStream.Position < aStream.Size do
  begin
    aStream.Read(HeaderData, SizeOf(HeaderData));
    aStream.Seek(lastPos, TSeekOrigin.soBeginning);

    with HeaderData do
    begin
      case id of
        plIntelijen:
        begin
          aStream.Read(IntelData, SizeOf(IntelData));
          IntelDraw := TIntelijenPlotting.create(Converter);

          for I := 0 to IntelData.LengthIntel - 1 do
          begin
            aStream.Read(IntelData.Info[I], SizeOf(string));
            Temp := TIntelijenInfo.Create;
            Temp.Info := IntelData.Info[i];
            IntelDraw.infolist.Add(Temp);
          end;
          if True then

          if edtcolor = IntelData.Force then
            IntelDraw.color := IntelData.Force
          else
            IntelDraw.color := edtcolor;

          IntelDraw.postCenter := IntelData.PostCenter;
          IntelDraw.TableProp := IntelData.PostCenter;
          if FChangeName then
            IntelDraw.Name := FNewName
          else
            IntelDraw.Name := IntelData.header.Exclude;
          FList.Add(IntelDraw);
        end;
        plLogistic:
        begin
          aStream.Read(LogData, SizeOf(LogData));

          LogDraw := TLogisticPlotting.create(Converter);
          if edtcolor = LogData.Force then
            LogDraw.color := LogData.Force
          else
            LogDraw.color := edtcolor;
          LogDraw.postCenter := LogData.PostCenter;
          LogDraw.TableProp := LogData.PostCenter;

          for I := 0 to LogData.LengthLog - 1 do
          begin
            aStream.Read(LogData.Item[I], SizeOf(TempLog));
            aStream.Read(LogData.Status[I], SizeOf(TempLog));
            TempLog := TLogisticOnBase.Create;
            TempLog.Name := LogData.Item[I];
            TempLog.Status := LogData.Status[I];
            LogDraw.LogisticList.Add(TempLog);
          end;
          if FChangeName then
            LogDraw.Name := FNewName
          else
            LogDraw.Name := LogData.header.Exclude;
         FList.Add(LogDraw);
        end;
        plRadar:
         begin
          aStream.Read(RadarData, SizeOf(RadarData));

          RadarDraw := TRadarPlotting.create(Converter);
          if edtcolor = RadarData.Force then
            RadarDraw.color := RadarData.Force
          else
            RadarDraw.color := edtcolor;
          RadarDraw.postCenter := RadarData.PostCenter;
          RadarDraw.Radius := RadarData.Radius;
          if FChangeName then
            RadarDraw.Name := FNewName
          else
            RadarDraw.Name := RadarData.header.Exclude;
          FList.Add(RadarDraw);
        end;
        plPangkalan :
        begin
          aStream.Read(BaseData, SizeOf(BaseData));

          BaseDraw := TPangkalanPlotting.create(Converter);
          if edtcolor = BaseData.Force then
            BaseDraw.color := BaseData.Force
          else
            BaseDraw.color := edtcolor;
          BaseDraw.idTaktis := BaseData.IdFontTaktis;
          BaseDraw.postCenter := BaseData.PostCenter;
          BaseDraw.TableProp := BaseData.PostCenter;
          for I := 0 to BaseData.LengthBase - 1 do
          begin
            aStream.Read(BaseData.Plat[I], SizeOf(TempBase));
            aStream.Read(BaseData.Qty[I], SizeOf(TempBase));
            aStream.Read(BaseData.FontTaktisIndex[I], SizeOf(TempBase));
            TempBase := TVehicleOnBase.Create;
            TempBase.Name := BaseData.Plat[I];
            TempBase.Quantity := StrToInt(BaseData.Qty[I]);
            TempBase.Simbol := ((BaseData.FontTaktisIndex[I]));
            BaseDraw.VehiclesList.Add(TempBase);
          end;
          if FChangeName then
            BaseDraw.Name := FNewName
          else
            BaseDraw.Name := BaseData.header.Exclude;
          FList.Add(BaseDraw);
        end;
        plPanah:
        begin
          aStream.Read(ArrowData, SizeOf(ArrowData));

          ArrowDraw := TPanahPlotting.create(Converter);
          if edtcolor = ArrowData.Force then
            ArrowDraw.color := ArrowData.Force
          else
            ArrowDraw.color := edtcolor;
          ArrowDraw.postCenter := ArrowData.PostCenter;
          ArrowDraw.postEnd := ArrowData.PostEnd;
          if FChangeName then
            ArrowDraw.Name := FNewName
          else
            ArrowDraw.Name := ArrowData.header.Exclude;
          FList.Add(ArrowDraw);
        end;
      end;
    end;
    lastPos := AStream.Position;
  end;
end;

procedure TDrawStrategi.ReposProperty(x, y : Integer);
var
  i : Integer;
  mx, my : Double;
  item : TMainPlottingShape;
begin
  for i := 0 to FList.Count - 1 do
  begin
    item := FList.Items[i];

    if item.isRepostProperty then
    begin
      Converter.ConvertToMap(X - 150, Y + 30, mx, my);
      item.TableProp.X := mx;
      item.TableProp.Y := my;
      Exit;
    end;
    if item.isRepostPlot then
    begin
      Converter.ConvertToMap(X, Y, mx, my);
      item.postCenter.X := mx;
      item.postCenter.Y := my;
      item.TableProp.X := mx;
      item.TableProp.Y := my;
      Exit;
    end;
    if item is TPanahPlotting then
    begin
      if TPanahPlotting(item).isPostEnd then
      begin
        Converter.ConvertToMap(X, Y, mx, my);
        TPanahPlotting(item).postEnd.X := mx;
        TPanahPlotting(item).postEnd.Y := my;
        Exit;
      end;
    end;
  end;
end;

procedure TDrawStrategi.SelectProperty(pos : TPoint);
var
  rect : TRect;
  ptPos : t2DPoint;
  i, cx, cy : Integer;
  item : TMainPlottingShape;
begin
  for i := 0 to FList.Count - 1 do
  begin
    ptPos := FFormula.PointTo2D(pos.X, pos.Y);
    item := FList.Items[i];

    Converter.ConvertToScreen(item.TableProp.X, item.TableProp.Y, cx, cy);

    rect.Left    := cx+50;
    rect.Top     := cy-50;
    rect.Right   := cx+260;
    rect.Bottom  := cy-30;

    if ptToArea(rect, ptPos) then
    begin
      item.isRepostProperty := True;
      Exit;
    end;

    Converter.ConvertToScreen(item.postCenter.X, item.postCenter.Y, cx, cy);

    rect.Left    := cx-19;
    rect.Top     := cy-19;
    rect.Right   := cx+19;
    rect.Bottom  := cy+19;

    if ptToArea(rect, ptPos) then
    begin
      item.isRepostPlot := True;
      Exit;
    end;

    if item is TPanahPlotting then
    begin
      Converter.ConvertToScreen(TPanahPlotting(item).postEnd.X, TPanahPlotting(item).postEnd.Y, cx, cy);

      rect.Left    := cx-19;
      rect.Top     := cy-19;
      rect.Right   := cx+19;
      rect.Bottom  := cy+19;

      if ptToArea(rect, ptPos) then
      begin
        TPanahPlotting(item).isPostEnd := True;
        Exit;
      end;
    end;
  end;
end;

{ TDrawFlagPoint }
procedure TDrawFlagPoint.Clear;
begin
  FList.Clear;
end;

constructor TDrawFlagPoint.Create;
begin
  FList := TList.Create;
end;

destructor TDrawFlagPoint.Destroy;
begin
  inherited;
  FList.Free;
end;

procedure TDrawFlagPoint.Draw(FCanvas: TCanvas);
var
  i : Integer;
  item : TFlagPoint;
begin
  for i := 0 to FList.Count - 1 do
  begin
    item := FList[i];
    item.Draw(FCanvas);
  end;
end;

procedure TDrawFlagPoint.SetConverter(const Value: TCoordConverter);
begin
 FConverter := Value;
end;

end.
