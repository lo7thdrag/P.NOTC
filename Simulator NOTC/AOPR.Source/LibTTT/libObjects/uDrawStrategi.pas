 unit uDrawStrategi;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin, OleCtrls,
  uMapXHandler, uBaseCoordSystem, math, {TeCanvas,} ColorGrd, tttData,
  uMainStrategi, uMainPlottingShape, uPlottingRecord,
  uRecord, uFormula, uDataTypes, uCoordConvertor;
type

  TPlottingContainer = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  protected

  public
    Flag               : Boolean;
    FList              : TList;
    FFormula           : TFormula;
    PlotTemplate       : TMainPlottingTemplate;
    FNameOfStream      : string;
    constructor Create;
    destructor Destroy; override;

    function GetPlotting(IdPlotting: Integer): TMainPlottingShape;

    function SelectPlot(pos : TPoint; var IdSelectedPlotting: Integer; var state: Boolean):Boolean;
    procedure Clear;
    procedure Draw(FCanvas: TCanvas);

    procedure RefreshPlot;
    procedure ReposProperty (x, y : Integer);
    procedure SelectProperty (pos : TPoint; Group : string; IsInstruktur : Boolean);
    procedure AddPlotting(Plotting : TMainPlottingShape);
    procedure ShowStreamData(aName : string ; aStream : TStream; plotting : TMainPlottingTemplate);
    procedure SaveStreamData(aStream : TStream ; aIndex : Integer);
    property Converter : TCoordConverter read FConverter write SetConverter;

  end;

implementation


constructor TPlottingContainer.Create;
begin
  FList := TList.Create;
end;

destructor TPlottingContainer.Destroy;
begin
  FList.Free;
end;

procedure TPlottingContainer.AddPlotting(Plotting : TMainPlottingShape);
begin
  FList.Add(Plotting);
end;

procedure TPlottingContainer.Clear;
begin
  FList.Clear;
end;

procedure TPlottingContainer.Draw(FCanvas: TCanvas);
var
  i : Integer;
  Plotting : TMainPlottingShape;
begin
  for i := 0 to FList.Count - 1 do
  begin
    Plotting := FList[i];
    if Plotting.IsCreate  then
    begin
      Plotting.Draw(FCanvas);
    end;
  end;
end;

function TPlottingContainer.GetPlotting(IdPlotting: Integer): TMainPlottingShape;
var
  i : Integer;
  temp : TMainPlottingShape;

begin
  Result := nil;

  for i := 0 to FList.Count - 1 do
  begin
    temp := TMainPlottingShape(FList.Items[i]);

    if temp.PlottingId = IdPlotting then
    begin
      Result := temp;
    end;
  end;
end;

procedure TPlottingContainer.RefreshPlot;
var
  i : Integer;
  item : TMainPlottingShape;
begin
  for i := 0 to FList.Count - 1 do
  begin
    item := FList.Items[i];

    item.isRepostProperty := False;
    item.isRepostPlot := False;

    if item is TPanahPlotting then
    begin
      TPanahPlotting(item).isPostEnd := False
    end;
  end;
end;

procedure TPlottingContainer.SaveStreamData(aStream: TStream ; aIndex : Integer);
var
  i, j    : Integer;
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

  plot := FList[aIndex];
  if plot is TIntelijenPlotting then
  begin
    intel := TIntelijenPlotting(plot);
    IntelData.Force := intel.Identity;
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
    LogData.Force := log.Identity;
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
    RadarData.Force := radar.Identity;
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
    BaseData.Force := base.Identity;
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
    PanahData.Force := panah.Identity;
    PanahData.PostCenter := panah.postCenter;
    PanahData.PostEnd := panah.postEnd;

    PanahData.header.id := plPanah;
    PanahData.header.Size := SizeOf(TRecPanah);
    PanahData.header.Exclude := panah.Name;

    aStream.Write(PanahData, SizeOf(TRecPanah));
  end;

end;

function TPlottingContainer.SelectPlot(pos : TPoint; var IdSelectedPlotting: Integer; var state: Boolean):Boolean;
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
    if item.IsCreate then
    begin
      Converter.ConvertToScreen(item.postCenter.X, item.postCenter.Y, cx, cy);

      rect.Left    := cx-19;
      rect.Top     := cy-19;
      rect.Right   := cx+19;
      rect.Bottom  := cy+19;

      if ptToArea(rect, ptPos) then
      begin
        item.isSelected := True;
        state := item.isShow;
        Result := True;
        IdSelectedPlotting := item.PlottingId;
        Exit;
      end;
    end;
  end;
end;

procedure TPlottingContainer.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

procedure TPlottingContainer.ShowStreamData(aName : string ; aStream: TStream;
  plotting: TMainPlottingTemplate);
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
  aStream.Position := 0;
  lastPos := aStream.Position;
  {fajar : Add record to flist}
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

          IntelDraw.Identity := IntelData.Force;
          IntelDraw.postCenter := IntelData.PostCenter;
          IntelDraw.TableProp := IntelData.PostCenter;
          IntelDraw.Name := aName;
          IntelDraw.Force := 0;
          IntelDraw.Time := 0;
          IntelDraw.Tipe := plIntelijen;
          IntelDraw.isShow := true;
          IntelDraw.isRepostPlot := False;
          IntelDraw.isRepostProperty := False;
          IntelDraw.IsCreate := False;
          FList.Add(IntelDraw);
        end;
        plLogistic:
        begin
          aStream.Read(LogData, SizeOf(LogData));
          LogDraw := TLogisticPlotting.create(Converter);
          LogDraw.Identity := LogData.Force;
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
          LogDraw.Name := aName;
          LogDraw.Force := 0;
          LogDraw.Time := 0;
          LogDraw.Tipe := plLogistic;
          LogDraw.isShow := true;
          LogDraw.isRepostPlot := False;
          LogDraw.isRepostProperty := False;
          LogDraw.IsCreate := False;
          FList.Add(LogDraw);
        end;
        plRadar:
         begin
          aStream.Read(RadarData, SizeOf(RadarData));
          RadarDraw := TRadarPlotting.create(Converter);
          RadarDraw.Identity := RadarData.Force;
          RadarDraw.postCenter := RadarData.PostCenter;
          RadarDraw.Radius := RadarData.Radius;
          RadarDraw.Name := aName;
          RadarDraw.Force := 0;
          RadarDraw.Time := 0;
          RadarDraw.Tipe := plRadar;
          RadarDraw.isShow := true;
          RadarDraw.isRepostPlot := False;
          RadarDraw.isRepostProperty := False;
          RadarDraw.IsCreate := False;
          FList.Add(RadarDraw);
        end;
        plPangkalan :
        begin
          aStream.Read(BaseData, SizeOf(BaseData));
          BaseDraw := TPangkalanPlotting.create(Converter);
          BaseDraw.Identity := BaseData.Force;
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
          BaseDraw.Name := aName;
          BaseDraw.Force := 0;
          BaseDraw.Time := 0;
          BaseDraw.Tipe := plPangkalan;
          BaseDraw.isShow := true;
          BaseDraw.isRepostPlot := False;
          BaseDraw.isRepostProperty := False;
          BaseDraw.IsCreate := False;
          FList.Add(BaseDraw);
        end;
        plPanah:
        begin
          aStream.Read(ArrowData, SizeOf(ArrowData));
          ArrowDraw := TPanahPlotting.create(Converter);
          ArrowDraw.Identity := IntelData.Force;
          ArrowDraw.postCenter := ArrowData.PostCenter;
          ArrowDraw.postEnd := ArrowData.PostEnd;
          ArrowDraw.Name := aName;
          ArrowDraw.Force := 0;
          ArrowDraw.Time := 0;
          ArrowDraw.Tipe := plPanah;
          ArrowDraw.isShow := true;
          ArrowDraw.isRepostPlot := False;
          ArrowDraw.isRepostProperty := False;
          ArrowDraw.IsCreate := False;
          FList.Add(ArrowDraw);
        end;
      end;
    end;
    lastPos := AStream.Position;
  end;
end;

procedure TPlottingContainer.ReposProperty(x, y : Integer);
var
  i : Integer;
  mx, my : Double;
  item : TMainPlottingShape;
begin
  for i := 0 to FList.Count - 1 do
  begin
    item := FList.Items[i];
    if item.IsCreate then
    begin
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
end;

procedure TPlottingContainer.SelectProperty(pos : TPoint; Group : string; IsInstruktur : Boolean);
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
    if item.IsCreate then
    begin
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
        if item.Group = Group then
        begin
          item.isRepostPlot := True;
          Exit;
        end
        else
        begin
          if (IsInstruktur) and (item.Group = 'Controller') then
          begin
            item.isRepostPlot := True;
            Exit;
          end;
          ShowMessage('You don''t have permission to edit this plotting');
          Exit;
        end;
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
          if (IsInstruktur) and (item.Group = 'Controller') then
          begin
            TPanahPlotting(item).isPostEnd:= True;
             Exit;
          end
          else
          begin
            ShowMessage('You don''t have permission to edit this plotting');
            Exit;
          end;

        end;
      end;
    end;
  end;
end;

end.
