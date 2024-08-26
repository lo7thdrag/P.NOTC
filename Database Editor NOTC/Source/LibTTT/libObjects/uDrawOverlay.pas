unit uDrawOverlay;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin, OleCtrls,
  uMapXHandler, uBaseCoordSystem, math, {TeCanvas,} ColorGrd,
  uMainOverlay,uMainStaticShape, uMainDynamicShape, uCoordConvertor, tttData,
  uRecord, uFormula, uDataTypes;
type
  TDrawOverlay = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  protected

  public
    StaticList : TList; {Container overlay static}
    DynamicList : TList; {Container overlay dynamic}
    FList         : TList;
    FFormula      : TFormula;
    FSelectedDraw : TMainOverlayTemplate;
    StateOverlay : Integer;

    constructor Create;
    destructor Destroy; override;

    procedure Clear;
    procedure DrawAll(FCanvas: TCanvas; Map1: TMap);

    procedure SaveStreamDataDynamic(AStream: TStream);
    procedure SaveStreamDataStatic(AStream: TStream);

    procedure ShowStreamDataDynamic(AStream: TStream);
    procedure ShowStreamDataStatic(AStream: TStream);

    procedure SelectShapeStatic (var IdSelected : Integer; pos : TPoint);
    procedure SelectShapeDynamic (var IdSelected : Integer; pos : TPoint);
    function lineTypeChoice (linetype :TPenStyle): String;

    procedure FindPoint(postCont: t2DPoint; var postValue : t2DPoint; vd, vi: Double);

    procedure BringToFront(idx : integer);
    procedure SendToBack(idx : integer);

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

  TDrawRuler = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  protected

  public
    postStart : t2DPoint;
    postEnd : t2DPoint;
    IsVisible : Boolean;

    constructor Create;
    destructor Destroy; override;

    procedure Clear;
    procedure Draw(FCanvas: TCanvas);

    property Converter : TCoordConverter read FConverter write SetConverter;
  end;
implementation
uses
  ufrmOverlayEditor, uObjectVisuals;

constructor TDrawOverlay.Create;
begin
  FList := TList.Create;
  StaticList := TList.Create;
  DynamicList := TList.Create;
end;

destructor TDrawOverlay.Destroy;
begin
  FList.Free;
  StaticList.Free;
  DynamicList.Free;
end;

procedure TDrawOverlay.BringToFront(idx : integer);
var
  TextDynamic ,tempTextDynamic : TTextDynamic;
  LineDynamic,tempLineDynamic : TLineDynamic;
  RectDynamic,tempRectDynamic : TRectangleDynamic;
  CircleDynamic,tempCircleDynamic : TCircleDynamic;
  EllipseDynamic,tempEllipseDynamic : TEllipseDynamic;
  ArcDynamic,tempArcDynamic : TArcDynamic;
  SectorDynamic,tempSectorDynamic : TSectorDynamic ;
  GridDynamic,tempGridDynamic : TGridDynamic;
  PolygonDynamic,tempPolygonDynamic : TPolygonDynamic;
  itemD        : TMainDynamicShape;

  TextStatic,tempTextStatic : TTextStatic;
  LineStatic,tempLineStatic : TLineStatic;
  RectStatic,tempRectStatic : TRectangleStatic;
  CircleStatic,tempCircleStatic : TCircleStatic;
  EllipseStatic,tempEllipseStatic : TEllipseStatic;
  ArcStatic,tempArcStatic : TArcStatic;
  SectorStatic,tempSectorStatic : TSectorStatic ;
  GridStatic,tempGridStatic : TGridStatic;
  PolygonStatic,tempPolygonStatic : TPolygonStatic;
  itemS        : TMainStaticShape;

  i : Integer;
  li : TListItem;
  Point : TDotDynamic;
  PointS : TDotStatic;

begin
  if StateOverlay = osDynamic then
  begin
    itemD := DynamicList[idx];

    if itemD is TTextDynamic then
    begin
      TextDynamic := TTextDynamic(itemD);

      tempTextDynamic := TTextDynamic.Create(Converter);

      tempTextDynamic.ParentPos.X := TextDynamic.ParentPos.X;
      tempTextDynamic.ParentPos.Y := TextDynamic.ParentPos.Y;

      tempTextDynamic.postStart.Range := TextDynamic.postStart.Range;
      tempTextDynamic.postStart.Bearing := TextDynamic.postStart.Bearing;
      tempTextDynamic.size := TextDynamic.size;
      tempTextDynamic.words := TextDynamic.words;
      tempTextDynamic.Color := TextDynamic.Color;

      DynamicList.Delete(idx);
      DynamicList.Add(tempTextDynamic);
    end
    else if itemD is TLineDynamic then
    begin
      LineDynamic := TLineDynamic(itemD);
      tempLineDynamic := TLineDynamic.Create(Converter);

      tempLineDynamic.ParentPos.X := LineDynamic.ParentPos.X;
      tempLineDynamic.ParentPos.Y := LineDynamic.ParentPos.Y;
      tempLineDynamic.PostStart.Bearing := LineDynamic.PostStart.Bearing;
      tempLineDynamic.PostStart.Range := LineDynamic.PostStart.Range;
      tempLineDynamic.PostEnd.Bearing := LineDynamic.PostEnd.Bearing;
      tempLineDynamic.PostEnd.Range := LineDynamic.PostEnd.Range;
      tempLineDynamic.Color := LineDynamic.Color;
      tempLineDynamic.lineType := LineDynamic.lineType;
      tempLineDynamic.weight := LineDynamic.weight;

      DynamicList.Delete(idx);
      DynamicList.Add(tempLineDynamic);
    end
    else if itemD is TRectangleDynamic then
    begin
      RectDynamic := TRectangleDynamic(itemD);
      tempRectDynamic := TRectangleDynamic.Create(Converter);

      tempRectDynamic.ParentPos.X := RectDynamic.ParentPos.X;
      tempRectDynamic.ParentPos.Y := RectDynamic.ParentPos.Y;

      tempRectDynamic.PostStart.Bearing := RectDynamic.PostStart.Bearing;
      tempRectDynamic.PostStart.Range := RectDynamic.PostStart.Range;
      tempRectDynamic.PostEnd.Bearing := RectDynamic.PostEnd.Bearing;
      tempRectDynamic.PostEnd.Range := RectDynamic.PostEnd.Range;
      tempRectDynamic.Color := RectDynamic.Color;

      DynamicList.Delete(idx);
      DynamicList.Add(tempRectDynamic);
    end
    else if itemD is TCircleDynamic then
    begin
      CircleDynamic := TCircleDynamic(itemD);
      tempCircleDynamic := TCircleDynamic.Create(Converter);

      tempCircleDynamic.ParentPos.X := CircleDynamic.ParentPos.X ;
      tempCircleDynamic.ParentPos.Y := CircleDynamic.ParentPos.Y ;

      tempCircleDynamic.postCenter.Bearing := CircleDynamic.postCenter.Bearing;
      tempCircleDynamic.postCenter.Range := CircleDynamic.postCenter.Range;
      tempCircleDynamic.Radius := CircleDynamic.Radius;
      tempCircleDynamic.Color := CircleDynamic.Color;

      if CircleDynamic.BrushStyle = bsClear  then
      begin
        tempCircleDynamic.BrushStyle := bsClear;
      end
      else
      begin
        tempCircleDynamic.BrushStyle := bsSolid;
        tempCircleDynamic.ColorFill := CircleDynamic.ColorFill;
      end;

      tempCircleDynamic.LineType := CircleDynamic.LineType ;
      tempCircleDynamic.Weight := CircleDynamic.Weight;

      DynamicList.Delete(idx);
      DynamicList.Add(tempCircleDynamic);
    end
    else if itemD is TEllipseDynamic then
    begin
      EllipseDynamic := TEllipseDynamic(itemD);
      tempEllipseDynamic := TEllipseDynamic.Create(Converter);

      tempEllipseDynamic.ParentPos.X := EllipseDynamic.ParentPos.X;
      tempEllipseDynamic.ParentPos.Y := EllipseDynamic.ParentPos.Y;

      tempEllipseDynamic.postCenter.Bearing := EllipseDynamic.postCenter.Bearing;
      tempEllipseDynamic.postCenter.Range := EllipseDynamic.postCenter.Range;
      tempEllipseDynamic.Vradius := EllipseDynamic.Vradius;
      tempEllipseDynamic.Hradius := EllipseDynamic.Hradius;
      tempEllipseDynamic.Color := EllipseDynamic.Color;

      if EllipseDynamic.BrushStyle = bsClear  then
      begin
        tempEllipseDynamic.BrushStyle := bsClear;
      end
      else
      begin
        tempEllipseDynamic.BrushStyle := bsSolid;
        tempEllipseDynamic.ColorFill := EllipseDynamic.ColorFill;
      end;

      tempEllipseDynamic.LineType := EllipseDynamic.LineType;
      tempEllipseDynamic.Weight := EllipseDynamic.Weight;

      DynamicList.Delete(idx);
      DynamicList.Add(tempEllipseDynamic);
    end
    else if itemD is TArcDynamic then
    begin
      ArcDynamic := TArcDynamic(itemD);
      tempArcDynamic := TArcDynamic.Create(Converter);

      tempArcDynamic.ParentPos.X := ArcDynamic.ParentPos.X;
      tempArcDynamic.ParentPos.Y := ArcDynamic.ParentPos.Y;
      tempArcDynamic.postCenter.Bearing := ArcDynamic.postCenter.Bearing;
      tempArcDynamic.postCenter.Range := ArcDynamic.postCenter.Range;
      tempArcDynamic.Radius := ArcDynamic.Radius;
      tempArcDynamic.StartAngle := ArcDynamic.StartAngle;
      tempArcDynamic.EndAngle := ArcDynamic.EndAngle;
      tempArcDynamic.Color := ArcDynamic.Color;
      tempArcDynamic.LineType :=  ArcDynamic.LineType;
      tempArcDynamic.Weight := ArcDynamic.Weight;

      DynamicList.Delete(idx);
      DynamicList.Add(tempArcDynamic);
    end
    else if itemD is TSectorDynamic then
    begin
      SectorDynamic := TSectorDynamic(itemD);
      tempSectorDynamic := TSectorDynamic.Create(Converter);

      tempSectorDynamic.ParentPos.X := SectorDynamic.ParentPos.X;
      tempSectorDynamic.ParentPos.Y := SectorDynamic.ParentPos.Y;
      tempSectorDynamic.postCenter.Bearing := SectorDynamic.postCenter.Bearing;
      tempSectorDynamic.postCenter.Range := SectorDynamic.postCenter.Range;
      tempSectorDynamic.Oradius := SectorDynamic.Oradius;
      tempSectorDynamic.Iradius := SectorDynamic.Iradius;
      tempSectorDynamic.StartAngle := SectorDynamic.StartAngle;
      tempSectorDynamic.EndAngle := SectorDynamic.EndAngle;
      tempSectorDynamic.Color := SectorDynamic.Color;
      tempSectorDynamic.ColorFill := SectorDynamic.ColorFill;

      tempSectorDynamic.LineType :=  SectorDynamic.LineType;
      tempSectorDynamic.Weight := SectorDynamic.Weight;

      DynamicList.Delete(idx);
      DynamicList.Add(tempSectorDynamic);
    end
    else if itemD is TGridDynamic then
    begin
      GridDynamic := TGridDynamic(itemD);
      tempGridDynamic := TGridDynamic.Create(Converter);

      tempGridDynamic.ParentPos.X := GridDynamic.ParentPos.X;
      tempGridDynamic.ParentPos.Y := GridDynamic.ParentPos.Y;

      tempGridDynamic.postCenter.Bearing := GridDynamic.postCenter.Bearing;
      tempGridDynamic.postCenter.Range := GridDynamic.postCenter.Range;
      tempGridDynamic.Height := GridDynamic.Height;
      tempGridDynamic.Width := GridDynamic.Width;
      tempGridDynamic.HCount := GridDynamic.HCount;
      tempGridDynamic.WCount := GridDynamic.WCount;
      tempGridDynamic.Rotation := GridDynamic.Rotation;
      tempGridDynamic.Color := GridDynamic.Color;

      tempGridDynamic.LineType :=  GridDynamic.LineType;
      tempGridDynamic.Weight := GridDynamic.Weight;

      DynamicList.Delete(idx);
      DynamicList.Add(tempGridDynamic);

    end
    else if itemD is TPolygonDynamic then
    begin
      PolygonDynamic := TPolygonDynamic(itemD);
      tempPolygonDynamic := TPolygonDynamic.Create(Converter);

      tempPolygonDynamic.ParentPos.X := PolygonDynamic.ParentPos.X;
      tempPolygonDynamic.ParentPos.Y := PolygonDynamic.ParentPos.Y;
      tempPolygonDynamic.Color := PolygonDynamic.Color;

      if PolygonDynamic.BrushStyle = bsClear  then
      begin
        tempPolygonDynamic.BrushStyle := bsClear;
      end
      else
      begin
        tempPolygonDynamic.BrushStyle := bsSolid;
        tempPolygonDynamic.ColorFill := PolygonDynamic.ColorFill;
      end;

      tempPolygonDynamic.LineType :=  PolygonDynamic.LineType;
      tempPolygonDynamic.Weight := PolygonDynamic.Weight;

      for i := 0 to OverlayEditorForm.lvPolyVertexD.Items.Count - 1 do
      begin
        li := OverlayEditorForm.lvPolyVertexD.Items[i];

        Point := TDotDynamic.Create;
        Point.Range   := StrToFloat(li.SubItems[0]);
        Point.Bearing := StrToInt(li.SubItems[1]);

        tempPolygonDynamic.polyList.Add(Point);
      end;

      DynamicList.Delete(idx);
      DynamicList.Add(tempPolygonDynamic);
    end;
  end
  else
  begin
    itemS := StaticList[idx];

    if itemS is TTextStatic then
    begin
      TextStatic := TTextStatic(itemS);
      tempTextStatic := TTextStatic.Create(Converter);

      tempTextStatic.postStart.X := TextStatic.postStart.X;
      tempTextStatic.postStart.Y := TextStatic.postStart.Y;
      tempTextStatic.size := TextStatic.size;
      tempTextStatic.words := TextStatic.words;
      tempTextStatic.Color := TextStatic.Color;

      StaticList.Delete(idx);
      StaticList.Add(tempTextStatic);
    end
    else if itemS is TLineStatic then
    begin
      LineStatic := TLineStatic(itemS);
      tempLineStatic := TLineStatic.Create(Converter);

      tempLineStatic.postStart.X := LineStatic.postStart.X;
      tempLineStatic.postStart.Y := LineStatic.postStart.Y ;
      tempLineStatic.postEnd.X := LineStatic.postEnd.X;
      tempLineStatic.postEnd.Y := LineStatic.postEnd.Y;
      tempLineStatic.color := LineStatic.Color;
      tempLineStatic.lineType := LineStatic.LineType;
      tempLineStatic.weight := LineStatic.Weight;

      StaticList.Delete(idx);
      StaticList.Add(tempLineStatic);
    end
    else if itemS is TRectangleStatic then
    begin
      RectStatic := TRectangleStatic(itemS);
      tempRectStatic := TRectangleStatic.Create(Converter);

      tempRectStatic.postStart.X := RectStatic.postStart.X;
      tempRectStatic.postStart.Y := RectStatic.postStart.Y;
      tempRectStatic.postEnd.X := RectStatic.postEnd.X;
      tempRectStatic.postEnd.Y := RectStatic.postEnd.Y;
      tempRectStatic.color := RectStatic.Color;

      if RectStatic.BrushStyle = bsClear then
      begin
        tempRectStatic.BrushStyle := bsClear;
      end
      else
      begin
        tempRectStatic.BrushStyle := bsSolid;
        tempRectStatic.ColorFill := RectStatic.ColorFill;
      end;
      tempRectStatic.Weight := RectStatic.Weight ;

      StaticList.Delete(idx);
      StaticList.Add(tempRectStatic);
    end
    else if itemS is TCircleStatic then
    begin
      CircleStatic := TCircleStatic(itemS);
      tempCircleStatic := TCircleStatic.Create(Converter);

      tempCircleStatic.postCenter.X := CircleStatic.postCenter.X;
      tempCircleStatic.postCenter.Y := CircleStatic.postCenter.Y;
      tempCircleStatic.Radius := CircleStatic.Radius;
      tempCircleStatic.color := CircleStatic.Color;
      tempCircleStatic.ColorFill := CircleStatic.ColorFill;

      tempCircleStatic.LineType :=  CircleStatic.LineType;
      tempCircleStatic.Weight := CircleStatic.Weight;

      if CircleStatic.BrushStyle = bsClear  then
      begin
        tempCircleStatic.BrushStyle := bsClear;
      end
      else
      begin
        tempCircleStatic.BrushStyle := bsSolid;
        tempCircleStatic.ColorFill := CircleStatic.ColorFill;
      end;

      tempCircleStatic.LineType :=  CircleStatic.LineType;
      tempCircleStatic.Weight := CircleStatic.Weight;

      StaticList.Delete(idx);
      StaticList.Add(tempCircleStatic);
    end
    else if itemS is TEllipseStatic then
    begin
      EllipseStatic := TEllipseStatic(itemS);
      tempEllipseStatic := TEllipseStatic.Create(Converter);

      tempEllipseStatic.postCenter.X := EllipseStatic.postCenter.X;
      tempEllipseStatic.postCenter.Y :=  EllipseStatic.postCenter.Y;
      tempEllipseStatic.Hradius := EllipseStatic.Hradius;
      tempEllipseStatic.Vradius := EllipseStatic.Vradius;
      tempEllipseStatic.color := EllipseStatic.Color;

      if EllipseStatic.BrushStyle = bsClear then
      begin
        tempEllipseStatic.BrushStyle := bsClear;
      end
      else
      begin
        tempEllipseStatic.BrushStyle := bsSolid;
        tempEllipseStatic.ColorFill := EllipseStatic.ColorFill;
      end;

      tempEllipseStatic.LineType :=  EllipseStatic.LineType;
      tempEllipseStatic.Weight := EllipseStatic.Weight;

      StaticList.Delete(idx);
      StaticList.Add(tempEllipseStatic);
    end
    else if itemS is TArcStatic then
    begin
      ArcStatic := TArcStatic(itemS);
      tempArcStatic := TArcStatic.Create(Converter);

      tempArcStatic.postCenter.X := ArcStatic.postCenter.X;
      tempArcStatic.postCenter.Y := ArcStatic.postCenter.Y;
      tempArcStatic.radius := ArcStatic.radius;
      tempArcStatic.StartAngle := ArcStatic.StartAngle;
      tempArcStatic.EndAngle := ArcStatic.EndAngle;
      tempArcStatic.color := ArcStatic.Color;

      tempArcStatic.LineType :=  ArcStatic.LineType;
      tempArcStatic.Weight := ArcStatic.Weight;

      StaticList.Delete(idx);
      StaticList.Add(tempArcStatic);
    end
    else if itemS is TSectorStatic then
    begin
      SectorStatic := TSectorStatic(itemS);
      tempSectorStatic := TSectorStatic.Create(Converter);

      tempSectorStatic.postCenter.X := SectorStatic.postCenter.X;
      tempSectorStatic.postCenter.Y := SectorStatic.postCenter.Y;
      tempSectorStatic.Oradius := SectorStatic.Oradius;
      tempSectorStatic.Iradius := SectorStatic.Iradius;
      tempSectorStatic.StartAngle := SectorStatic.StartAngle;
      tempSectorStatic.EndAngle := SectorStatic.EndAngle;
      tempSectorStatic.color := SectorStatic.Color;
      tempSectorStatic.ColorFill := SectorStatic.ColorFill;

      tempSectorStatic.LineType :=  SectorStatic.LineType;
      tempSectorStatic.Weight := SectorStatic.Weight;

      StaticList.Delete(idx);
      StaticList.Add(tempSectorStatic);
    end
    else if itemS is TGridStatic then
    begin
      GridStatic := TGridStatic(itemS);
      tempGridStatic := TGridStatic.Create(Converter);

      tempGridStatic.postCenter.X := GridStatic.postCenter.X ;
      tempGridStatic.postCenter.Y := GridStatic.postCenter.Y;
      tempGridStatic.Height := GridStatic.Height;
      tempGridStatic.Width := GridStatic.Weight;
      tempGridStatic.HCount := GridStatic.HCount;
      tempGridStatic.WCount := GridStatic .WCount;
      tempGridStatic.Rotation := GridStatic.Rotation;
      tempGridStatic.color := GridStatic.Color;

      tempGridStatic.LineType :=  GridStatic.LineType;
      tempGridStatic.Weight := GridStatic.Weight;

      StaticList.Delete(idx);
      StaticList.Add(tempGridStatic);
    end
    else if itemS is TPolygonStatic then
    begin
      PolygonStatic := TPolygonStatic(itemS);
      tempPolygonStatic := TPolygonStatic.Create(Converter);
      tempPolygonStatic.Color := PolygonStatic.Color;

      if PolygonStatic.BrushStyle = bsClear then
      begin
        tempPolygonStatic.BrushStyle := bsClear;
      end
      else
      begin
        tempPolygonStatic.BrushStyle := bsSolid;
        tempPolygonStatic.ColorFill := PolygonStatic.ColorFill;
      end;

      tempPolygonStatic.Weight := PolygonStatic.Weight;

      for i := 0 to OverlayEditorForm.lvPolyVertex.Items.Count - 1 do
      begin
        li := OverlayEditorForm.lvPolyVertex.Items[i];

        PointS := TDotStatic.Create;
        PointS.X   := dmsToLong(li.SubItems[0]);
        PointS.Y := dmsToLatt(li.SubItems[1]);

        tempPolygonStatic.polyList.Add(PointS);
      end;
      StaticList.Delete(idx);
      StaticList.Add(tempPolygonStatic);
    end;
  end;
end;

procedure TDrawOverlay.Clear;
begin
  FList.Clear;
  StaticList.Clear;
  DynamicList.Clear;
end;

procedure TDrawOverlay.DrawAll(FCanvas: TCanvas; Map1: TMap);
var
  I    : Integer;
  itemDynamic : TMainDynamicShape;
  itemStatic : TMainStaticShape;
begin
  for I := 0 to StaticList.Count - 1 do
  begin
    itemStatic := StaticList[I];
    itemStatic.Draw(FCanvas);
  end;

  for I := 0 to DynamicList.Count - 1 do
  begin
    itemDynamic := DynamicList[I];
    itemDynamic.RangeOffset := 0;
    itemDynamic.BearingOffset := 0;
    itemDynamic.RotationOffset := 0;
    itemDynamic.Orientation := 0;
    itemDynamic.Draw(FCanvas);
  end;
end;

procedure TDrawOverlay.FindPoint(postCont: t2DPoint; var postValue: t2DPoint; vd, vi: Double);
var
  dx, dy : Double;
begin
  RangeBearingToCoord(vd, vi, dx, dy);
  postValue.X := postCont.X + dx;
  postValue.Y := postCont.Y + dy;
end;

function TDrawOverlay.lineTypeChoice(linetype: TPenStyle): String;
begin
case linetype of
    TPenStyle(psSolid) :
      begin
        Result := 'Solid' ;
        OverlayEditorForm.cbbDashesPen.ItemIndex := 0;
      end;
    TPenStyle(psDash):
      begin
        Result := 'Dash';
        OverlayEditorForm.cbbDashesPen.ItemIndex := 1;
      end;
    TPenStyle(psDot):
      begin
        Result := 'Dot';
        OverlayEditorForm.cbbDashesPen.ItemIndex := 2;
      end;
    TPenStyle(psDashDot):
      begin
        Result := 'Dash Dot';
        OverlayEditorForm.cbbDashesPen.ItemIndex := 3;
      end;
    TPenStyle(psDashDotDot):
      begin
        Result := 'Dash Dot Dot';
        OverlayEditorForm.cbbDashesPen.ItemIndex := 4;
      end;
  end;
end;

procedure TDrawOverlay.SaveStreamDataDynamic(AStream: TStream);
var
  i, j : Integer;

  HeaderData  : TFileHeader;
  TextData    : TTextRecord;
  LineData    : TLineRecord;
  RectData    : TRectRecord;
  ArcData     : TArcRecord;
  CircleData  : TCircleRecord;
  EllipseData : TEllipseRecord;
  SectorData  : TSectorRecord;
  GridData    : TGridRecord;
  PolygonData : TPolygonRecord;

  TextShape       : TTextDynamic;
  LineShape       : TLineDynamic;
  RectangleShape  : TRectangleDynamic;
  CircleShape     : TCircleDynamic;
  EllipseShape    : TEllipseDynamic;
  ArcShape        : TArcDynamic;
  SectorShape     : TSectorDynamic;
  GridShape       : TGridDynamic;
  PolygonShape    : TPolygonDynamic;
  point           : TDotDynamic;
  item            : TMainDynamicShape;
begin
  AStream.Position := 0;

  for i := 0 to DynamicList.Count - 1 do
  begin
    item := DynamicList[i];

    if item is TTextDynamic then
    begin
      TextShape := TTextDynamic(item);

      TextData.postStart       := FFormula.RangeBearingTop2D(TextShape.postStart);
      TextData.size            := TextShape.size;
      TextData.words           := TextShape.words;
      TextData.color           := TextShape.color;
      TextData.isSelected      := TextShape.isSelected;

      TextData.header.ID       := ovText;
      TextData.header.Exclude  := 'Text';
      TextData.header.Size     := sizeof(TTextRecord);

      AStream.Write(TextData, SizeOf(TTextRecord));
    end
    else if item is TLineDynamic then
    begin
      LineShape := TLineDynamic(item);

      LineData.postStart       := FFormula.RangeBearingTop2D(LineShape.postStart);
      LineData.postEnd         := FFormula.RangeBearingTop2D(LineShape.postEnd);
      LineData.color           := LineShape.color;
      LineData.isSelected      := LineShape.isSelected;
      LineData.weight          := LineShape.weight;
      LineData.lineType        := LineShape.lineType;

      LineData.header.ID       := ovLine;
      LineData.header.Exclude  := 'Line';
      LineData.header.Size     := sizeof(TLineRecord);

      AStream.Write(LineData, SizeOf(TLineRecord));
    end
    else if item is TRectangleDynamic then
    begin
      RectangleShape := TRectangleDynamic(item);

      RectData.postStart       := FFormula.RangeBearingTop2D(RectangleShape.postStart);
      RectData.postEnd         := FFormula.RangeBearingTop2D(RectangleShape.postEnd);
      RectData.color           := RectangleShape.color;
      RectData.isSelected      := RectangleShape.isSelected;
      RectData.weight          := RectangleShape.Weight;
      RectData.lineType        := RectangleShape.LineType;
      RectData.brushStyle      := RectangleShape.BrushStyle;
      RectData.fillColor       := RectangleShape.ColorFill;

      RectData.header.ID       := ovRectangle;
      RectData.header.Exclude  := 'Rectangle';
      RectData.header.Size     := sizeof(TRectRecord);

      AStream.Write(RectData, SizeOf(TRectRecord));
    end
    else if item is TCircleDynamic then
    begin
      CircleShape := TCircleDynamic(item);

      CircleData.postCenter      := FFormula.RangeBearingTop2D(CircleShape.postCenter);
      CircleData.radius          := CircleShape.radius;
      CircleData.color           := CircleShape.color;
      CircleData.isSelected      := CircleShape.isSelected;
      CircleData.weight          := CircleShape.Weight;
      CircleData.lineType        := CircleShape.LineType;
      CircleData.fillColor       := CircleShape.ColorFill;
      CircleData.brushStyle      := CircleShape.BrushStyle;

      CircleData.header.ID       := ovCircle;
      CircleData.header.Exclude  := 'Circle';
      CircleData.header.Size     := sizeof(TCircleRecord);

      AStream.Write(CircleData, SizeOf(TCircleRecord));
    end
    else if item is TEllipseDynamic then
    begin
      EllipseShape := TEllipseDynamic(item);

      EllipseData.postCenter      := FFormula.RangeBearingTop2D(EllipseShape.postCenter);
      EllipseData.Hradius         := EllipseShape.Hradius;
      EllipseData.Vradius         := EllipseShape.Vradius;
      EllipseData.color           := EllipseShape.color;
      EllipseData.isSelected      := EllipseShape.isSelected;
      EllipseData.weight          := EllipseShape.Weight;
      EllipseData.lineType        := EllipseShape.LineType;
      EllipseData.brushStyle      := EllipseShape.BrushStyle;
      EllipseData.fillColor       := EllipseShape.ColorFill;

      EllipseData.header.ID       := ovEllipse;
      EllipseData.header.Exclude  := 'Ellipse';
      EllipseData.header.Size     := sizeof(TEllipseRecord);

      AStream.Write(EllipseData, SizeOf(TEllipseRecord));
    end
    else if item is TArcDynamic then
    begin
      ArcShape := TArcDynamic(item);

      ArcData.postCenter      := FFormula.RangeBearingTop2D(ArcShape.postCenter);
      ArcData.radius          := ArcShape.radius;
      ArcData.startAngle      := ArcShape.startAngle;
      ArcData.endAngle        := ArcShape.endAngle;
      ArcData.color           := ArcShape.color;
      ArcData.isSelected      := ArcShape.isSelected;
      ArcData.weight          := ArcShape.Weight;
      ArcData.lineType        := ArcShape.LineType;

      ArcData.header.ID       := ovArc;
      ArcData.header.Exclude  := 'Arc';
      ArcData.header.Size     := sizeof(TArcRecord);

      AStream.Write(ArcData, SizeOf(TArcRecord));
    end
    else if item is TSectorDynamic then
    begin
      SectorShape := TSectorDynamic(item);

      SectorData.postCenter      := FFormula.RangeBearingTop2D(SectorShape.postCenter);
      SectorData.Oradius         := SectorShape.Oradius;
      SectorData.Iradius         := SectorShape.Iradius;
      SectorData.startAngle      := SectorShape.startAngle;
      SectorData.endAngle        := SectorShape.endAngle;
      SectorData.color           := SectorShape.color;
      SectorData.isSelected      := SectorShape.isSelected;
      SectorData.weight          := SectorShape.Weight;
      SectorData.lineType        := SectorShape.LineType;
      SectorData.brushStyle      := SectorShape.BrushStyle;
      SectorData.fillColor       := SectorShape.ColorFill;

      SectorData.header.ID       := ovSector;
      SectorData.header.Exclude  := 'Sector';
      SectorData.header.Size     := sizeof(TSectorRecord);

      AStream.Write(SectorData, SizeOf(TSectorRecord));
    end
    else if item is TGridDynamic then
    begin
      GridShape := TGridDynamic(item);

      GridData.postCenter      := FFormula.RangeBearingTop2D(GridShape.postCenter);
      GridData.HCount          := GridShape.HCount;
      GridData.WCount          := GridShape.WCount;
      GridData.Height          := GridShape.Height;
      GridData.Width           := GridShape.Width;
      GridData.Rotation        := GridShape.Rotation;
      GridData.color           := GridShape.color;
      GridData.isSelected      := GridShape.isSelected;
      GridData.weight          := GridShape.Weight;
      GridData.lineType        := GridShape.LineType;

      GridData.header.ID       := ovGrid;
      GridData.header.Exclude  := 'Grid';
      GridData.header.Size     := sizeof(TGridRecord);

      AStream.Write(GridData, SizeOf(TGridRecord));
    end
    else if item is TPolygonDynamic then
    begin
      PolygonShape := TPolygonDynamic(item);

//      SetLength(PolygonData.postStart, PolygonShape.polyList.Count);
      for j := 0 to PolygonShape.polyList.Count - 1 do
      begin
        point := PolygonShape.polyList.Items[j];

        PolygonData.postStart[j].X := point.Range;
        PolygonData.postStart[j].Y := point.Bearing;
      end;

      PolygonData.LengthArray     := j;
      PolygonData.color           := PolygonShape.color;
      PolygonData.isSelected      := PolygonShape.isSelected;
      PolygonData.weight          := PolygonShape.Weight;
      PolygonData.lineType        := PolygonShape.LineType;
      PolygonData.brushStyle      := PolygonShape.BrushStyle;
      PolygonData.fillColor       := PolygonShape.ColorFill;

      PolygonData.header.ID       := ovPolygon;
      PolygonData.header.Exclude  := 'Polygon';
      PolygonData.header.Size     := sizeof(TPolygonRecord) +
                                     sizeOf(t2DPoint)* length(PolygonData.postStart);

      AStream.Write(PolygonData, SizeOf(TPolygonRecord));

      for j := 0 to PolygonShape.polyList.Count - 1 do
      begin
         AStream.Write(PolygonData.postStart[j].X, SizeOf(tempPos));
         AStream.Write(PolygonData.postStart[j].Y, SizeOf(tempPos));
      end;
    end;
  end;
end;

procedure TDrawOverlay.SaveStreamDataStatic(AStream: TStream);
var
  i, j : Integer;

  HeaderData  : TFileHeader;
  TextData    : TTextRecord;
  LineData    : TLineRecord;
  RectData    : TRectRecord;
  ArcData     : TArcRecord;
  CircleData  : TCircleRecord;
  EllipseData : TEllipseRecord;
  SectorData  : TSectorRecord;
  GridData    : TGridRecord;
  PolygonData : TPolygonRecord;

  TextShape       : TTextStatic;
  LineShape       : TLineStatic;
  RectangleShape  : TRectangleStatic;
  CircleShape     : TCircleStatic;
  EllipseShape    : TEllipseStatic;
  ArcShape        : TArcStatic;
  SectorShape     : TSectorStatic;
  GridShape       : TGridStatic;
  PolygonShape    : TPolygonStatic;
  point           : TDotStatic;
  item            : TMainStaticShape;
begin
  AStream.Position := 0;

  for i := 0 to StaticList.Count - 1 do
  begin
    item := StaticList[i];

    if item is TTextStatic then
    begin
      TextShape := TTextStatic(item);

      TextData.postStart       := TextShape.postStart;
      TextData.size            := TextShape.size;
      TextData.words           := TextShape.words;
      TextData.color           := TextShape.color;
      TextData.isSelected      := TextShape.isSelected;

      TextData.header.ID       := ovText;
      TextData.header.Exclude  := 'Text';
      TextData.header.Size     := sizeof(TTextRecord);

      AStream.Write(TextData, SizeOf(TTextRecord));
    end
    else if item is TLineStatic then
    begin
      LineShape := TLineStatic(item);

      LineData.postStart       := LineShape.postStart;
      LineData.postEnd         := LineShape.postEnd;
      LineData.color           := LineShape.color;
      LineData.isSelected      := LineShape.isSelected;
      LineData.weight          := LineShape.Weight;
      LineData.lineType        := LineShape.LineType;

      LineData.header.ID       := ovLine;
      LineData.header.Exclude  := 'Line';
      LineData.header.Size     := sizeof(TLineRecord);

      AStream.Write(LineData, SizeOf(TLineRecord));
    end
    else if item is TRectangleStatic then
    begin
      RectangleShape := TRectangleStatic(item);

      RectData.postStart       := RectangleShape.postStart;
      RectData.postEnd         := RectangleShape.postEnd;
      RectData.color           := RectangleShape.color;
      RectData.isSelected      := RectangleShape.isSelected;
      RectData.weight          := RectangleShape.Weight;
      RectData.lineType        := RectangleShape.LineType;
      RectData.brushStyle      := RectangleShape.BrushStyle;
      RectData.fillColor       := RectangleShape.ColorFill;

      RectData.header.ID       := ovRectangle;
      RectData.header.Exclude  := 'Rectangle';
      RectData.header.Size     := sizeof(TRectRecord);

      AStream.Write(RectData, SizeOf(TRectRecord));
    end
    else if item is TCircleStatic then
    begin
      CircleShape := TCircleStatic(item);

      CircleData.postCenter     := CircleShape.postCenter;
      CircleData.radius         := CircleShape.radius;
      CircleData.color          := CircleShape.color;
      CircleData.isSelected     := CircleShape.isSelected;
      CircleData.weight         := CircleShape.Weight;
      CircleData.lineType       := CircleShape.LineType;
      CircleData.brushStyle     := CircleShape.BrushStyle;
      CircleData.fillColor      := CircleShape.ColorFill;

      CircleData.header.ID      := ovCircle;
      CircleData.header.Exclude := 'Circle';
      CircleData.header.Size    := sizeof(TCircleRecord);

      AStream.Write(CircleData, SizeOf(TCircleRecord));
    end
    else if item is TEllipseStatic then
    begin
      EllipseShape := TEllipseStatic(item);

      EllipseData.postCenter     := EllipseShape.postCenter;
      EllipseData.Hradius        := EllipseShape.Hradius;
      EllipseData.Vradius        := EllipseShape.Vradius;
      EllipseData.color          := EllipseShape.color;
      EllipseData.isSelected     := EllipseShape.isSelected;
      EllipseData.weight         := EllipseShape.Weight;
      EllipseData.lineType       := EllipseShape.LineType;
      EllipseData.brushStyle     := EllipseShape.BrushStyle;
      EllipseData.fillColor      := EllipseShape.ColorFill;

      EllipseData.header.ID       := ovEllipse;
      EllipseData.header.Exclude  := 'Ellipse';
      EllipseData.header.Size     := sizeof(TEllipseRecord);

      AStream.Write(EllipseData, SizeOf(TEllipseRecord));
    end
    else if item is TArcStatic then
    begin
      ArcShape := TArcStatic(item);

      ArcData.postCenter      := ArcShape.postCenter;
      ArcData.radius          := ArcShape.radius;
      ArcData.startAngle      := ArcShape.startAngle;
      ArcData.endAngle        := ArcShape.endAngle;
      ArcData.color           := ArcShape.color;
      ArcData.isSelected      := ArcShape.isSelected;
      ArcData.weight          := ArcShape.Weight;
      ArcData.lineType        := ArcShape.LineType;

      ArcData.header.ID       := ovArc;
      ArcData.header.Exclude  := 'Arc';
      ArcData.header.Size     := sizeof(TArcRecord);

      AStream.Write(ArcData, SizeOf(TArcRecord));
    end
    else if item is TSectorStatic then
    begin
      SectorShape := TSectorStatic(item);

      SectorData.postCenter      := SectorShape.postCenter;
      SectorData.Oradius         := SectorShape.Oradius;
      SectorData.Iradius         := SectorShape.Iradius;
      SectorData.startAngle      := SectorShape.startAngle;
      SectorData.endAngle        := SectorShape.endAngle;
      SectorData.color           := SectorShape.color;
      SectorData.isSelected      := SectorShape.isSelected;
      SectorData.weight          := SectorShape.Weight;
      SectorData.lineType        := SectorShape.LineType;
      SectorData.brushStyle      := SectorShape.BrushStyle;
      SectorData.fillColor       := SectorShape.ColorFill;

      SectorData.header.ID       := ovSector;
      SectorData.header.Exclude  := 'Sector';
      SectorData.header.Size     := sizeof(TSectorRecord);

      AStream.Write(SectorData, SizeOf(TSectorRecord));
    end
    else if item is TGridStatic then
    begin
      GridShape := TGridStatic(item);

      GridData.postCenter      := GridShape.postCenter;
      GridData.HCount          := GridShape.HCount;
      GridData.WCount          := GridShape.WCount;
      GridData.Height          := GridShape.Height;
      GridData.Width           := GridShape.Width;
      GridData.Rotation        := GridShape.Rotation;
      GridData.color           := GridShape.color;
      GridData.isSelected      := GridShape.isSelected;
      GridData.weight          := GridShape.Weight;
      GridData.lineType        := GridShape.LineType;

      GridData.header.ID       := ovGrid;
      GridData.header.Exclude  := 'Grid';
      GridData.header.Size     := sizeof(TGridRecord);

      AStream.Write(GridData, SizeOf(TGridRecord));
    end
    else if item is TPolygonStatic then
    begin
      PolygonShape := TPolygonStatic(item);

//      SetLength(PolygonData.postStart, PolygonShape.polyList.Count);
      for j := 0 to PolygonShape.polyList.Count - 1 do
      begin
        point := PolygonShape.polyList.Items[j];

        PolygonData.postStart[j].X := point.X;
        PolygonData.postStart[j].Y := point.Y;
      end;

      PolygonData.LengthArray     := j;
      PolygonData.color           := PolygonShape.color;
      PolygonData.isSelected      := PolygonShape.isSelected;
      PolygonData.weight          := PolygonShape.Weight;
      PolygonData.lineType        := PolygonShape.LineType;
      PolygonData.brushStyle      := PolygonShape.BrushStyle;
      PolygonData.fillColor       := PolygonShape.ColorFill;

      PolygonData.header.ID       := ovPolygon;
      PolygonData.header.Exclude  := 'Polygon';
      PolygonData.header.Size     := sizeof(TPolygonRecord) +
                                     sizeOf(t2DPoint)* length(PolygonData.postStart);

      AStream.Write(PolygonData, SizeOf(TPolygonRecord));

      for j := 0 to PolygonShape.polyList.Count - 1 do
      begin
         AStream.Write(PolygonData.postStart[j].X, SizeOf(tempPos));
         AStream.Write(PolygonData.postStart[j].Y, SizeOf(tempPos));
      end;
    end;
  end;
end;

procedure TDrawOverlay.SelectShapeDynamic(var IdSelected: Integer; pos: TPoint);
var
  i, j, k, Hr,Vr, r,
  x1, x2, x3, x4, x5,
  y1, y2, y3, y4, y5 : Integer;

  Idx, Idy, Odx, Ody,
  RCenterToPoint, BCenterToPoint,
  RKiAts, RKaAts, RKiBwh, RKaBwh,
  BKiAts, BKaAts, BKiBwh, BKaBwh : Double;

  IptS, IptE, OptS, OptE, ptCen, ptPos : t2DPoint;

  rect1, rect2, rect3, rect4 : TRect;

  OText       : TTextDynamic;
  OLine       : TLineDynamic;
  ORectangle  : TRectangleDynamic;
  OCircle     : TCircleDynamic;
  OEllipse    : TEllipseDynamic;
  OArc        : TArcDynamic;
  OSector     : TSectorDynamic;
  OGrid       : TGridDynamic;
  OPolygon    : TPolygonDynamic;
  item        : TMainDynamicShape;

  polyPoint : Array of TPoint;
  point : TDotDynamic;

  IsFind : Boolean;
  BOffset, BSShape, BEShape : Double;
  pOffset, pSShape, pEShape,
  pParent :  t2DPoint;
  widthLine : Integer;
  countList : Integer;
begin
  for i := 0 to DynamicList.Count-1 do
  begin
    item := DynamicList[i];
    item.isSelected := False;
  end;

  IsFind := False;
  StateOverlay := osDynamic;

  for countList:= (DynamicList.Count - 1) downto 0 do
  begin
    ptPos := FFormula.PointTo2D(pos.X, pos.Y);

    item := DynamicList[countList];
    if item is TTextDynamic then
    begin
      OText := TTextDynamic(item);

      with OText do
      begin
        BOffset := ValidateDegree(BearingOffset);
        BSShape := postStart.Bearing + RotationOffset;

        FindPoint(ParentPos, pOffset, RangeOffset, BOffset);   {Point offset from Ship}
        FindPoint(pOffset, pSShape, postStart.Range, BSShape); {Shape from Point offset}

        Converter.ConvertToScreen(pSShape.X, pSShape.Y, x1, y1);
        rect1 := FFormula.checkText(x1, y1, OText.Size, OText.words);

        if ptToArea(rect1, ptPos) then
        begin
          IsFind := True;
          OText.isSelected := true;

          OverlayEditorForm.edtTextRange.Text     := FloatToStr(postStart.Range);
          OverlayEditorForm.edtTextBearing.Text   := FloatToStr(postStart.Bearing);
          OverlayEditorForm.edtTextFieldD.Text    := words;
//          OverlayEditorForm.txtColorSelect.color  := OText.Color;
//          OverlayEditorForm.txtFillColor.Color := OText.Color;
//          OverlayEditorForm.pnlNoFill.Visible := False;

          OverlayEditorForm.cbbTextSizeD.Text     := IntToStr(OText.size);

          OverlayEditorForm.ShapeType := ovText;
          OverlayEditorForm.lblShape.Caption := 'Text';
          OverlayEditorForm.grpTextD.BringToFront;
          OverlayEditorForm.pnlPenEditing.Visible := False;
          OverlayEditorForm.btnFill.Enabled := False;
          OverlayEditorForm.btnOutline.Enabled := True;

          IdSelected := countList;
          break;
        end;

      end;
    end;

    if item is TLineDynamic then
    begin
      OLine := TLineDynamic(item);

      with OLine do
      begin
        BOffset := ValidateDegree(BearingOffset);

        BSShape := postStart.Bearing + RotationOffset;
        BEShape := postEnd.Bearing + RotationOffset;

        FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}
        FindPoint(pOffset, pSShape, postStart.Range, BSShape);  {Shape from Point offset}
        FindPoint(pOffset, pEShape, postEnd.Range, BEShape);    {Shape from Point offset}

        Converter.ConvertToScreen(pSShape.X, pSShape.Y, x1, y1);
        Converter.ConvertToScreen(pEShape.X, pEShape.Y, x2, y2);

        IptS  := FFormula.PointTo2D(x1, y1);
        IptE  := FFormula.PointTo2D(x2, y2);

        if ptToLine(IptS,IptE,ptPos) then
        begin
          IsFind := True;
          OLine.isSelected := true;

          OverlayEditorForm.edtLineStartRange.Text    := FloatToStr(postStart.Range);
          OverlayEditorForm.edtLineStartBearing.Text  := FloatToStr(postStart.Bearing);
          OverlayEditorForm.edtLineEndRange.Text      := FloatToStr(postEnd.Range);
          OverlayEditorForm.edtLineEndBearing.Text    := FloatToStr(postEnd.Bearing);
//          frmOverlayEditor.txtColorSelect.color  := OLine.Color;
//          frmOverlayEditor.txtFillColor.Color := OLine.Color;
//          frmOverlayEditor.pnlNoFill.Visible := False;

          OverlayEditorForm.ShapeType := ovLine;
          OverlayEditorForm.lblShape.Caption := 'Line';
          OverlayEditorForm.grpLineD.BringToFront;

          OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(OLine.LineType);

          OverlayEditorForm.cbbWeightPen.Text := IntToStr(OLine.weight);

          OverlayEditorForm.pnlPenEditing.Visible := True;
          OverlayEditorForm.btnFill.Enabled := False;
          OverlayEditorForm.btnOutline.Enabled := True;
          IdSelected := countList;
          break;
        end;
      end;
    end;

    if item is TRectangleDynamic then
    begin
      ORectangle := TRectangleDynamic(item);

      with ORectangle do
      begin
        BOffset := ValidateDegree(BearingOffset);

        FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}

        BSShape := postStart.Bearing + RotationOffset;
        BEShape := postEnd.Bearing + RotationOffset;

        FindPoint(pOffset, IptS, postStart.Range, BSShape);
        FindPoint(pOffset, OptE, postEnd.Range, BEShape);

        Idx := CalcRange(IptS.X, IptS.Y, OptE.X, IptS.Y);
        Idy := CalcRange(IptS.X, IptS.Y, IptS.X, OptE.Y);

        RCenterToPoint  := CalcRange(IptS.X, IptS.Y, OptE.X, OptE.Y)/2;
        BCenterToPoint  := CalcBearing(IptS.X, IptS.Y, OptE.X, OptE.Y);

        //Point Center
        FindPoint(IptS, ptCen, RCenterToPoint, BCenterToPoint);

        //Point Kiri Atas
        IptS.X := ptCen.X - (Idx/60/2);
        IptS.Y := ptCen.Y + (Idy/60/2);

        //Point Kanan Bawah
        OptE.X := ptCen.X + (Idx/60/2);
        OptE.Y := ptCen.Y - (Idy/60/2);

        Converter.ConvertToScreen(IptS.X, IptS.Y, x1, y1);
        Converter.ConvertToScreen(OptE.X, OptE.Y, x2, y2);

        rect1.Left    := x1;
        rect1.Top     := Y1;
        rect1.Right   := x2;
        rect1.Bottom  := Y2;

        rect2 := FFormula.checkXYPosition(rect1.Left, rect1.Top, rect1.Right, rect1.Bottom);

        if ptToArea(rect2, ptPos) then
        begin
          IsFind := True;
          ORectangle.isSelected := True;

          OverlayEditorForm.edtRecStartRange.Text   := FloatToStr(postStart.Range);
          OverlayEditorForm.edtRecStartBearing.Text := FloatToStr(postStart.Bearing);
          OverlayEditorForm.edtRecEndRange.Text     := FloatToStr(postEnd.Range);
          OverlayEditorForm.edtRecEndBearing.Text   := FloatToStr(postEnd.Bearing);
//          OverlayEditorForm.txtColorSelect.color    := ORectangle.color;

          OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(ORectangle.LineType);

          OverlayEditorForm.cbbWeightPen.Text := IntToStr(ORectangle.weight);
          if ORectangle.BrushStyle = bsClear then
          begin
//            frmOverlayEditor.pnlNoFill.Visible := True;
//            FisNoFill := True;
          end
          else
          begin
//            frmOverlayEditor.txtFillColor.Color := ORectangle.ColorFill;
//            frmOverlayEditor.pnlNoFill.Visible := False;
//            FisNoFill := False;
          end;

          OverlayEditorForm.ShapeType := ovRectangle;
          OverlayEditorForm.lblShape.Caption := 'Rectangle';
          OverlayEditorForm.grpRectangleD.BringToFront;
          OverlayEditorForm.pnlPenEditing.Visible := True;
          OverlayEditorForm.btnFill.Enabled := False;
          OverlayEditorForm.btnOutline.Enabled := True;
          IdSelected := countList;
          break;
        end;
      end;
    end;

    if item is TCircleDynamic then
    begin
      OCircle := TCircleDynamic(item);
      with OCircle do
      begin
        BOffset := ValidateDegree(BearingOffset);
        BSShape := postCenter.Bearing + RotationOffset;

        FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}
        FindPoint(pOffset, pSShape, postCenter.Range, BSShape);    {Shape from Point offset}

        Converter.ConvertToMap(pos.X, pos.Y, ptPos.X, ptPos.Y);

        if ptToCircle(pSShape, ptPos, radius) then
        begin
          IsFind := True;
          OCircle.isSelected := true;

          OverlayEditorForm.edtCircleRange.Text   := FloatToStr(postCenter.Range);
          OverlayEditorForm.edtCircleBearing.Text := FloatToStr(postCenter.Bearing);
          OverlayEditorForm.edtCircleRadiusD.Text := FloatToStr(radius);
//          frmOverlayEditor.txtColorSelect.color  := OCircle.color;

          OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(OCircle.LineType);

          OverlayEditorForm.cbbWeightPen.Text := IntToStr(OCircle.weight);

          if OCircle.BrushStyle = bsClear then
          begin
//           frmOverlayEditor.pnlNoFill.Visible := True;
//           FisNoFill := True;
          end
          else
          begin
//            frmOverlayEditor.txtFillColor.Color := OCircle.ColorFill;
//            frmOverlayEditor.pnlNoFill.Visible := False;
//            FisNoFill := False;
          end;

          OverlayEditorForm.ShapeType := ovCircle;
          OverlayEditorForm.lblShape.Caption := 'Circle';
          OverlayEditorForm.pnlPenEditing.Visible := True;
          OverlayEditorForm.btnFill.Enabled := True;
          OverlayEditorForm.btnOutline.Enabled := True;
          OverlayEditorForm.grpCircleD.BringToFront;
          OverlayEditorForm.grpCircleD.Visible := True;
          IdSelected := countList;
          break;
        end;
      end;
    end;

    if item is TEllipseDynamic then
    begin
      OEllipse := TEllipseDynamic(item);

      with OEllipse do
      begin
        BOffset := ValidateDegree(BearingOffset);
        BSShape := postCenter.Bearing + RotationOffset;

        FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}
        FindPoint(pOffset, pSShape, postCenter.Range, BSShape);    {Shape from Point offset}

        Idx := pSShape.X + Hradius/60;
        Idy := pSShape.Y + Vradius/60;

        Converter.ConvertToScreen(pSShape.X, pSShape.Y, x1, y1);
        Converter.ConvertToScreen(Idx, Idy, x2, y2);

        Hr := Abs(x1 - x2);
        Vr := Abs(y1 - y2);

        rect1.Left    := x1 - Hr;
        rect1.Top     := Y1 - Vr;
        rect1.Right   := x1 + Hr;
        rect1.Bottom  := Y1 + Vr;

        rect2 := FFormula.checkXYPosition(rect1.Left, rect1.Top, rect1.Right, rect1.Bottom);

        if ptToArea(rect2, ptPos) then
        begin
          IsFind := True;
          OEllipse.isSelected := true;

          OverlayEditorForm.edtEllipseRange.Text        := FloatToStr(postCenter.Range);
          OverlayEditorForm.edtEllipseBearing.Text      := FloatToStr(postCenter.Bearing);
          OverlayEditorForm.edtEllipseHorizontalD.Text  := FloatToStr(OEllipse.Hradius);
          OverlayEditorForm.edtEllipseVerticalD.Text  := FloatToStr(OEllipse.Vradius);
//          frmOverlayEditor.txtColorSelect.color  := OEllipse.color;

          OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(OEllipse.LineType);

          OverlayEditorForm.cbbWeightPen.Text := IntToStr(OEllipse.weight);

          if OEllipse.BrushStyle = bsClear then
          begin
//            OverlayEditorForm.pnlNoFill.Visible := True;
//            FisNoFill := True;
          end
          else
          begin
//            OverlayEditorForm.txtFillColor.Color := OEllipse.ColorFill;
//            OverlayEditorForm.pnlNoFill.Visible := False;
//            FisNoFill := False;
          end;

          OverlayEditorForm.ShapeType := ovEllipse;
          OverlayEditorForm.lblShape.Caption := 'Ellipse';
          OverlayEditorForm.grpEllipseD.BringToFront;
          OverlayEditorForm.pnlPenEditing.Visible := True;
          OverlayEditorForm.btnFill.Enabled := True;
          OverlayEditorForm.btnOutline.Enabled := True;

          IdSelected := countList;
          break;
        end;
      end;
    end;

    if item is TArcDynamic then
    begin
      OArc := TArcDynamic(item);
      with OArc do
      begin
        BOffset := ValidateDegree(BearingOffset);
        BSShape := postCenter.Bearing + RotationOffset;

        FindPoint(ParentPos, pOffset, RangeOffset, BOffset);    {Point offset from Ship}
        FindPoint(pOffset, pSShape, postCenter.Range, BSShape); {Shape from Point offset}

        Converter.ConvertToMap(pos.X, pos.Y, ptPos.X, ptPos.Y);

        if ptToArc(pSShape, ptPos, OArc.radius, OArc.radius, OArc.StartAngle, OArc.EndAngle) then
        begin
          IsFind := True;
          OArc.isSelected  := true;

          OverlayEditorForm.edtArcRange.Text        := FloatToStr(postCenter.Range);
          OverlayEditorForm.edtArcBearing.Text      := FloatToStr(postCenter.Bearing);
          OverlayEditorForm.edtArcRadiusD.Text      := FloatToStr(radius);
          OverlayEditorForm.edtArcStartAngleD.Text  := FloatToStr(StartAngle);
          OverlayEditorForm.edtArcEndAngleD.Text    := FloatToStr(EndAngle);
//          frmOverlayEditor.txtColorSelect.color  := OArc.color;

          OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(OArc.LineType);

          OverlayEditorForm.cbbWeightPen.Text := IntToStr(OArc.weight);
          OverlayEditorForm.ShapeType := ovArc;
          OverlayEditorForm.lblShape.Caption := 'Arc';
          OverlayEditorForm.grpArcD.BringToFront;
          OverlayEditorForm.pnlPenEditing.Visible := True;
          OverlayEditorForm.btnFill.Enabled := False;
          OverlayEditorForm.btnOutline.Enabled := True;
          IdSelected := countList;
          break;
        end;
      end;
    end;

    if item is TSectorDynamic then
    begin
      OSector := TSectorDynamic(item);
      with OSector do
      begin
        BOffset := ValidateDegree(BearingOffset);
        BSShape := postCenter.Bearing + RotationOffset;

        FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}
        FindPoint(pOffset, pSShape, postCenter.Range, BSShape);   {Shape from Point offset}

        Converter.ConvertToMap(pos.X, pos.Y, ptPos.X, ptPos.Y);

        if ptToArc(pSShape, ptPos, OSector.Iradius, OSector.Oradius, OSector.StartAngle, OSector.EndAngle) then
        begin
          IsFind := True;
          OSector.isSelected  := true;

          OverlayEditorForm.edtSectorRange.Text       := FloatToStr(postCenter.Range);
          OverlayEditorForm.edtSectorBearing.Text     := FloatToStr(postCenter.Bearing);
          OverlayEditorForm.edtSectorInnerD.Text      := FloatToStr(Iradius);
          OverlayEditorForm.edtSectorOuterD.Text      := FloatToStr(Oradius);
          OverlayEditorForm.edtSectorStartAngleD.Text := FloatToStr(StartAngle);
          OverlayEditorForm.edtSectorEndAngleD.Text   := FloatToStr(EndAngle);
//          frmOverlayEditor.txtColorSelect.color  := OSector.color;

          OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(OSector.LineType);

          OverlayEditorForm.cbbWeightPen.Text := IntToStr(OSector.weight);

          if OSector.BrushStyle = bsClear then
          begin
//            frmOverlayEditor.pnlNoFill.Visible := True;
//            FisNoFill := True;
          end
          else
          begin
//            frmOverlayEditor.txtFillColor.Color := OSector.ColorFill;
//            frmOverlayEditor.pnlNoFill.Visible := False;
//            FisNoFill := False;
          end;

          OverlayEditorForm.ShapeType := ovSector;
          OverlayEditorForm.lblShape.Caption := 'Sector';
          OverlayEditorForm.grpSectorD.BringToFront;
          OverlayEditorForm.pnlPenEditing.Visible := True;
          OverlayEditorForm.btnFill.Enabled := False;
          OverlayEditorForm.btnOutline.Enabled := True;
          IdSelected := countList;
          break;
        end;
      end;
    end;

    if item is TGridDynamic then
    begin
      OGrid := TGridDynamic(item);
      with OGrid do
      begin
        BOffset := ValidateDegree(BearingOffset);

        BSShape := postCenter.Bearing + RotationOffset;

        FindPoint(ParentPos, pOffset, RangeOffset, BOffset);      {Point offset from Ship}
        FindPoint(pOffset, pSShape, postCenter.Range, BSShape);   {Shape from Point offset}

        //Point Kiri Atas
        IptS.X := pSShape.X - ((Width/60)*(WCount/2));
        IptS.Y := pSShape.Y + ((Height/60)*(HCount)/2);

        //Point Kanan Bawah
        OptE.X := pSShape.X + ((Width/60)*(WCount/2));
        OptE.Y := pSShape.Y - ((Height/60)*(HCount)/2);

        BKiAts  := CalcBearing(pSShape.X, pSShape.Y, IptS.X, IptS.Y);
        BKaBwh  := CalcBearing(pSShape.X, pSShape.Y, OptE.X, OptE.Y);

        RKiAts  := CalcRange(pSShape.X, pSShape.Y, IptS.X, IptS.Y);
        RKaBwh  := CalcRange(pSShape.X, pSShape.Y, OptE.X, OptE.Y);

        FindPoint(pSShape, IptS, RKiAts, BKiAts + Rotation);
        FindPoint(pSShape, OptE, RKaBwh, BKaBwh + Rotation);

        Converter.ConvertToScreen(IptS.X, IptS.Y, x1, y1);
        Converter.ConvertToScreen(OptE.X, OptE.Y, x3, y3);

        rect1.Left    := x1;
        rect1.Top     := Y1;
        rect1.Right   := x3;
        rect1.Bottom  := Y3;

        rect2 := FFormula.checkXYPosition(rect1.Left, rect1.Top, rect1.Right, rect1.Bottom);

        if ptToArea(rect2, ptPos) then
        begin
          IsFind := True;
          OGrid.isSelected := true;

          OverlayEditorForm.edtTableRange.Text        := FloatToStr(postCenter.Range);
          OverlayEditorForm.edtTableBearing.Text      := FloatToStr(postCenter.Bearing);
          OverlayEditorForm.edtTableColumnD.Text      := FloatToStr(OGrid.HCount);
          OverlayEditorForm.edtTableRowD.Text         := FloatToStr(OGrid.WCount);
          OverlayEditorForm.edtTableHeightD.Text      := FloatToStr(OGrid.Height);
          OverlayEditorForm.edtTableWidthD.Text       := FloatToStr(OGrid.Width);
          OverlayEditorForm.edtRotationAngleD.Text    := FloatToStr(OGrid.Rotation);
//          frmOverlayEditor.txtColorSelect.color  := OGrid.color;

          OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(OGrid.LineType);

          OverlayEditorForm.cbbWeightPen.Text := IntToStr(OGrid.weight);

          OverlayEditorForm.ShapeType := ovGrid;
          OverlayEditorForm.lblShape.Caption := 'Grid';
          OverlayEditorForm.grpGridD.BringToFront;
          OverlayEditorForm.pnlPenEditing.Visible := True;
          OverlayEditorForm.btnFill.Enabled := False;
          OverlayEditorForm.btnOutline.Enabled := True;
          IdSelected := countList;
          break;
        end;
      end;
    end;

    if item is TPolygonDynamic then
    begin
      OPolygon := TPolygonDynamic(item);
      with OPolygon do
      begin
        BOffset := ValidateDegree(BearingOffset);

        FindPoint(ParentPos, pOffset, RangeOffset, BOffset);   {Point offset from Ship}

        SetLength(polyPoint, polyList.Count);

        for j := 0 to polyList.Count - 1 do
        begin
          point := polyList.Items[j];

          BSShape := point.Bearing + RotationOffset;
          FindPoint(pOffset, pSShape, point.Range, BSShape); {Shape from Point offset}

          Converter.ConvertToScreen(pSShape.X, pSShape.Y, x1, y1);
          polyPoint[j].x := x1;
          polyPoint[j].y := y1;
        end;

        for j := 0 to polyList.Count - 1 do
        begin
          rect1 := FFormula.assignRect(polyPoint[j].x, polyPoint[j].y);

          if ptToArea(rect1, ptPos) then
          begin
            IsFind := True;
            OPolygon.isSelected := true;

            OverlayEditorForm.lvPolyVertexD.Clear;

            for k := 0 to polyList.Count - 1 do
            begin
              point := polyList.Items[k];

              with OverlayEditorForm.lvPolyVertexD.Items.Add do
              begin
                SubItems.Add(FloatToStr(point.Range));
                SubItems.Add(FloatToStr(point.Bearing));
              end;
            end;

            OverlayEditorForm.lvPolyVertexD.Items.BeginUpdate;
            try
             for k := 0 to OverlayEditorForm.lvPolyVertexD.Items.Count-1 do
               OverlayEditorForm.lvPolyVertexD.Items.Item[k].Caption:=IntToStr(k+1);
            finally
              OverlayEditorForm.lvPolyVertexD.Items.EndUpdate;
            end;
//            frmOverlayEditor.txtColorSelect.color  := OPolygon.color;

            OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(OPolygon.LineType);

            OverlayEditorForm.cbbWeightPen.Text := IntToStr(OPolygon.weight);

            if OPolygon.BrushStyle = bsClear then
            begin
//              frmOverlayEditor.pnlNoFill.Visible := True;
//              FisNoFill := True;
            end
            else
            begin
//              frmOverlayEditor.txtFillColor.Color := OPolygon.ColorFill;
//              frmOverlayEditor.pnlNoFill.Visible := False;
//              FisNoFill := False;
            end;

            OverlayEditorForm.ShapeType := ovPolygon;
            OverlayEditorForm.lblShape.Caption := 'Polygon';
            OverlayEditorForm.grpPolygonD.BringToFront;
            OverlayEditorForm.pnlPenEditing.Visible := True;
            OverlayEditorForm.btnFill.Enabled := True;
            OverlayEditorForm.btnOutline.Enabled := True;
            IdSelected := countList;
            break;
          end;
        end;
      end;
       if IsFind then
          Break;
    end;
  end;

  if IsFind then
  begin
    with OverlayEditorForm do
    begin
      btnDelete.Enabled := True;
      btnApply.Enabled := True;
      pnlDynamic.Visible := True;
      IdAction := 2;

      if OverlayEditorForm.btnPan.Down = true then
      begin
        OverlayEditorForm.Map1.CurrentTool := miSelectTool;
        OverlayEditorForm.Map1.MousePointer := miDefaultCursor;
        OverlayEditorForm.btnPan.Down := false;
        OverlayEditorForm.LoadNormalButtonImage;
      end;
    end;
  end
  else
  begin
    with OverlayEditorForm do
    begin
      lblShape.Caption := '---';
      pnlStatic.Visible := False;
      pnlDynamic.Visible := False;
      IdAction := 1;

      if OverlayEditorForm.btnPan.Down = false then
      begin
        OverlayEditorForm.RefreshMousePointer;
        OverlayEditorForm.btnSelect.OnClick(btnSelect);
        OverlayEditorForm.btnDelete.Enabled := false;
      end;
    end;
  end;
end;

procedure TDrawOverlay.SelectShapeStatic(var IdSelected: Integer; pos: TPoint);
var
  i, j, k, Hr,Vr, r,
  x1, x2, x3, x4, x5,
  y1, y2, y3, y4, y5 : Integer;

  Idx, Idy, Odx, Ody,
  RKiAts, RKaAts, RKiBwh, RKaBwh,
  BKiAts, BKaAts, BKiBwh, BKaBwh : Double;

  IptS, IptE, OptS, OptE, ptPos : t2DPoint;

  rect1, rect2, rect3, rect4 : TRect;

  SText       : TTextStatic;
  SLine       : TLineStatic;
  SRectangle  : TRectangleStatic;
  SCircle     : TCircleStatic;
  SEllipse    : TEllipseStatic;
  SArc        : TArcStatic;
  SSector     : TSectorStatic;
  SGrid       : TGridStatic;
  SPolygon    : TPolygonStatic;
  item        : TMainStaticShape;

  polyPoint : Array of TPoint;
  point : TDotStatic;

  IsFind : Boolean;
  IsEdit : Boolean;
  countList : Integer;

begin
  //fungsi unk me-resset selected
  for i := 0 to StaticList.Count - 1 do
  begin
    item := StaticList[i];
    item.isSelected := False;
  end;

  IsFind := False;
  StateOverlay := osStatic;

  for countList := StaticList.Count-1 downto 0 do
  begin
    ptPos := FFormula.PointTo2D(pos.X, pos.Y);

    item := StaticList[countList];

    {$REGION ' Text Section '}
    if item is TTextStatic then
    begin
      SText := TTextStatic(item);

      Converter.ConvertToScreen(SText.postStart.X, SText.postStart.Y, x1, y1);
      rect1 := FFormula.checkText(x1, y1, SText.Size, SText.words);

      if ptToArea(rect1, ptPos) then
      begin
        IsFind := True;

        OverlayEditorForm.RefreshMousePointer;
        OverlayEditorForm.LoadPanelText;

        OverlayEditorForm.ShapeType := ovText;
        OverlayEditorForm.edtTextPosLat.Text  := formatDMS_latt(SText.postStart.Y);
        OverlayEditorForm.edtTextPosLong.Text := formatDMS_long(SText.postStart.X);
        OverlayEditorForm.cbbTextSize.Text    := IntToStr(SText.size);
        OverlayEditorForm.edtTextField.Text   := SText.words;
        OverlayEditorForm.pnlOutline.color    := SText.Color;
        SText.isSelected := true;

        IdSelected := countList;
        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Line Section '}
    if item is TLineStatic then
    begin
      SLine := TLineStatic(item);

      Converter.ConvertToScreen(SLine.postStart.X, SLine.postStart.Y, x1, y1);
      Converter.ConvertToScreen(SLine.postEnd.X, SLine.postEnd.Y, x2, y2 );

      IptS  := FFormula.PointTo2D(x1, y1);
      IptE  := FFormula.PointTo2D(x2, y2);

      if ptToLine(IptS,IptE,ptPos) then
      begin
        IsFind := True;
        SLine.isSelected := true;

        OverlayEditorForm.RefreshMousePointer;
        OverlayEditorForm.LoadPanelLine;

        OverlayEditorForm.ShapeType := ovLine;
        OverlayEditorForm.edtLineStartPosLat.Text := formatDMS_latt(SLine.postStart.Y);
        OverlayEditorForm.edtLineStartPosLong.Text := formatDMS_long(SLine.postStart.X);
        OverlayEditorForm.edtLineEndPosLat.Text := formatDMS_latt(SLine.postEnd.Y);
        OverlayEditorForm.edtLineEndPosLong.Text := formatDMS_long(SLine.postEnd.X);
        OverlayEditorForm.pnlOutline.color := SLine.Color;
        OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(SLine.LineType);
        OverlayEditorForm.cbbWeightPen.Text := IntToStr(SLine.weight);

        IdSelected := countList;
        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Rectangle Section '}
    if item is TRectangleStatic then
    begin
      SRectangle := TRectangleStatic(item);

      Converter.ConvertToScreen(SRectangle.postStart.X, SRectangle.postStart.Y, x1, y1);
      Converter.ConvertToScreen(SRectangle.postEnd.X, SRectangle.postEnd.Y, x2, y2 );

      rect1.Left    := x1;
      rect1.Top     := Y1;
      rect1.Right   := x2;
      rect1.Bottom  := Y2;

      rect2 := FFormula.checkXYPosition(rect1.Left, rect1.Top, rect1.Right, rect1.Bottom);

      if ptToArea(rect2, ptPos) then
      begin
        IsFind := True;
        SRectangle.isSelected := true;

        OverlayEditorForm.RefreshMousePointer;
        OverlayEditorForm.LoadPanelRectangle;

        OverlayEditorForm.ShapeType := ovRectangle;
        OverlayEditorForm.edtRectStartPosLong.Text  := formatDMS_long(SRectangle.postStart.X);
        OverlayEditorForm.edtRectStartPosLat.Text   := formatDMS_latt(SRectangle.postStart.Y);
        OverlayEditorForm.edtRectEndPosLong.Text    := formatDMS_long(SRectangle.postEnd.X);
        OverlayEditorForm.edtRectEndPosLat.Text     := formatDMS_latt(SRectangle.postEnd.Y);
        OverlayEditorForm.pnlOutline.color          := SRectangle.color;

        OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(SRectangle.LineType);
        OverlayEditorForm.cbbWeightPen.Text := IntToStr(SRectangle.weight);

        if SRectangle.BrushStyle = bsClear then
        begin
          OverlayEditorForm.SetNoFill(True);
        end
        else
        begin
          OverlayEditorForm.SetNoFill(False);
          OverlayEditorForm.PnlFill.Color := SRectangle.ColorFill;
        end;

        IdSelected := countList;
        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Circle Section '}
    if item is TCircleStatic then
    begin
      SCircle := TCircleStatic(item);

      Converter.ConvertToMap(pos.X, pos.Y, ptPos.X, ptPos.Y);

      if ptToCircle(SCircle.postCenter, ptPos, SCircle.radius) then
      begin
        IsFind := True;
        SCircle.isSelected := True;

        OverlayEditorForm.RefreshMousePointer;
        OverlayEditorForm.LoadPanelCircle;

        OverlayEditorForm.ShapeType := ovCircle;
        OverlayEditorForm.edtCirclePosLong.Text := formatDMS_long(SCircle.postCenter.X);
        OverlayEditorForm.edtCirclePosLat.Text := formatDMS_latt(SCircle.postCenter.Y);
        OverlayEditorForm.edtCircleRadius.Text := FloatToStr(SCircle.radius);
        OverlayEditorForm.pnlOutline.color := SCircle.color;

        OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(SCircle.LineType);
        OverlayEditorForm.cbbWeightPen.Text := IntToStr(SCircle.weight);

        if SCircle.BrushStyle = bsClear then
        begin
          OverlayEditorForm.SetNoFill(True);
        end
        else
        begin
          OverlayEditorForm.SetNoFill(False);
          OverlayEditorForm.pnlFill.Color := SCircle.ColorFill;
        end;

        IdSelected := countList;
        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Ellipse Section '}
    if item is TEllipseStatic then
    begin
      SEllipse := TEllipseStatic(item);

      Idx := SEllipse.postCenter.X + SEllipse.Hradius/60;
      Idy := SEllipse.postCenter.Y + SEllipse.Vradius/60;

      Converter.ConvertToScreen(SEllipse.postCenter.X, SEllipse.postCenter.Y, x1, y1);
      Converter.ConvertToScreen(Idx, Idy, x2, y2);

      Hr := Abs(x1 - x2);
      Vr := Abs(y1 - y2);

      rect1.Left    := x1 - Hr;
      rect1.Top     := Y1 - Vr;
      rect1.Right   := x1 + Hr;
      rect1.Bottom  := Y1 + Vr;

      rect2 := FFormula.checkXYPosition(rect1.Left, rect1.Top, rect1.Right, rect1.Bottom);

      if ptToArea(rect2, ptPos) then
      begin
        IsFind := True;
        SEllipse.isSelected := true;

        OverlayEditorForm.RefreshMousePointer;
        OverlayEditorForm.LoadPanelEllipse;

        OverlayEditorForm.ShapeType := ovEllipse;
        OverlayEditorForm.edtEllipsePosLong.Text := formatDMS_long(SEllipse.postCenter.X);
        OverlayEditorForm.edtEllipsePosLat.Text  := formatDMS_latt(SEllipse.postCenter.Y);
        OverlayEditorForm.edtHorizontal.Text := FloatToStr(SEllipse.Hradius);
        OverlayEditorForm.edtVertical.Text := FloatToStr(SEllipse.Vradius);
        OverlayEditorForm.pnlOutline.color := SEllipse.color;

        OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(SEllipse.LineType);
        OverlayEditorForm.cbbWeightPen.Text := IntToStr(SEllipse.weight);

        if SEllipse.BrushStyle = bsClear then
        begin
          OverlayEditorForm.SetNoFill(True);
        end
        else
        begin
          OverlayEditorForm.SetNoFill(False);
          OverlayEditorForm.pnlFill.Color := SEllipse.ColorFill;
        end;

        IdSelected := countList;
        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Arc Section '}
    if item is TArcStatic then
    begin
      SArc := TArcStatic(item);

      Converter.ConvertToMap(pos.X, pos.Y, ptPos.X, ptPos.Y);

      if ptToArc(SArc.postCenter, ptPos, SArc.radius, SArc.radius, SArc.StartAngle, SArc.EndAngle) then
      begin
        IsFind := True;
        SArc.isSelected  := true;

        OverlayEditorForm.RefreshMousePointer;
        OverlayEditorForm.LoadPanelArc;

        OverlayEditorForm.ShapeType := ovArc;
        OverlayEditorForm.edtArcPosLong.Text := formatDMS_long(SArc.postCenter.X);
        OverlayEditorForm.edtArcPosLat.Text := formatDMS_latt(SArc.postCenter.Y);
        OverlayEditorForm.edtArcRadius.Text := FloatToStr(SArc.radius);
        OverlayEditorForm.edtArcStartAngle.Text := IntToStr(SArc.StartAngle);
        OverlayEditorForm.edtArcEndAngle.Text := IntToStr(SArc.EndAngle);
        OverlayEditorForm.pnlOutline.color := SArc.color;
        OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(SArc.LineType);
        OverlayEditorForm.cbbWeightPen.Text := IntToStr(SArc.weight);

        IdSelected := countList;
        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Sector Section '}
    if item is TSectorStatic then
    begin
      SSector := TSectorStatic(item);

      Converter.ConvertToMap(pos.X, pos.Y, ptPos.X, ptPos.Y);

      if ptToArc(SSector.postCenter, ptPos, SSector.Iradius, SSector.Oradius, SSector.StartAngle, SSector.EndAngle) then
      begin
        IsFind := True;
        SSector.isSelected  := true;

        OverlayEditorForm.RefreshMousePointer;
        OverlayEditorForm.LoadPanelSector;

        OverlayEditorForm.ShapeType := ovSector;
        OverlayEditorForm.edtSectorPosLong.Text := formatDMS_long(SSector.postCenter.X);
        OverlayEditorForm.edtSectorPosLat.Text := formatDMS_latt(SSector.postCenter.Y);
        OverlayEditorForm.edtSectorStartAngle.Text  := IntToStr(SSector.StartAngle);
        OverlayEditorForm.edtSectorEndAngle.Text    := IntToStr(SSector.EndAngle);
        OverlayEditorForm.edtSectorInner.Text  := FloatToStr(SSector.Iradius);
        OverlayEditorForm.edtSectorOuter.Text  := FloatToStr(SSector.Oradius);
        OverlayEditorForm.pnlOutline.color :=  SSector.color;


        OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(SSector.LineType);
        OverlayEditorForm.cbbWeightPen.Text := IntToStr(SSector.weight);

        IdSelected := countList;
        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Grid Section '}
    if item is TGridStatic then
    begin
      SGrid := TGridStatic(item);

      //Point Kiri Atas
      IptS.X := SGrid.postCenter.X - ((SGrid.Width/60)*(SGrid.WCount/2));
      IptS.Y := SGrid.postCenter.Y + ((SGrid.Height/60)*(SGrid.HCount)/2);

      //Point Kanan Bawah
      OptE.X := SGrid.postCenter.X + ((SGrid.Width/60)*(SGrid.WCount/2));
      OptE.Y := SGrid.postCenter.Y - ((SGrid.Height/60)*(SGrid.HCount)/2);

      BKiAts   := CalcBearing(SGrid.postCenter.X, SGrid.postCenter.Y, IptS.X, IptS.Y);
      BKaBwh := CalcBearing(SGrid.postCenter.X, SGrid.postCenter.Y, OptE.X, OptE.Y);

      RKiAts     := CalcRange(SGrid.postCenter.X, SGrid.postCenter.Y, IptS.X, IptS.Y);
      RKaBwh   := CalcRange(SGrid.postCenter.X, SGrid.postCenter.Y, OptE.X, OptE.Y);

      FindPoint(SGrid.postCenter, IptS, RKiAts, BKiAts + SGrid.Rotation);
      FindPoint(SGrid.postCenter, OptE, RKaBwh, BKaBwh + SGrid.Rotation);

      Converter.ConvertToScreen(IptS.X, IptS.Y, x1, y1);
      Converter.ConvertToScreen(OptE.X, OptE.Y, x3, y3);

      rect1.Left    := x1;
      rect1.Top     := Y1;
      rect1.Right   := x3;
      rect1.Bottom  := Y3;

      rect2 := FFormula.checkXYPosition(rect1.Left, rect1.Top, rect1.Right, rect1.Bottom);

      if ptToArea(rect2, ptPos) then
      begin
        IsFind := True;
        SGrid.isSelected := true;

        OverlayEditorForm.RefreshMousePointer;
        OverlayEditorForm.LoadPanelGrid;

        OverlayEditorForm.ShapeType := ovGrid;
        OverlayEditorForm.edtTablePosLong.Text := formatDMS_long(SGrid.postCenter.X);
        OverlayEditorForm.edtTablePosLat.Text := formatDMS_latt(SGrid.postCenter.Y);
        OverlayEditorForm.edtTableWidth.Text := FloatToStr(SGrid.Width);
        OverlayEditorForm.edtTableHeight.Text := FloatToStr(SGrid.Height);
        OverlayEditorForm.edtTableColumn.Text := IntToStr(SGrid.HCount);
        OverlayEditorForm.edtTableRow.Text  := IntToStr(SGrid.WCount);
        OverlayEditorForm.edtTableRotationAngle.Text := IntToStr(SGrid.Rotation);
        OverlayEditorForm.pnlOutline.color := SGrid.color;


        OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(SGrid.LineType);
        OverlayEditorForm.cbbWeightPen.Text := IntToStr(SGrid.weight);

        IdSelected := countList;
        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Polygon Section '}
    if item is TPolygonStatic then
    begin
      SPolygon := TPolygonStatic(item);

      SetLength(polyPoint, SPolygon.polyList.Count);

      for j := 0 to SPolygon.polyList.Count - 1 do
      begin
        point := SPolygon.polyList.Items[j];

        Converter.ConvertToScreen(point.X, point.Y, x1, y1);
        polyPoint[j].x := x1;
        polyPoint[j].y := y1;
      end;

      for j := 0 to SPolygon.polyList.Count - 1 do
      begin
        rect1 := FFormula.assignRect(polyPoint[j].x, polyPoint[j].y);

        if ptToArea(rect1, ptPos) then
        begin
          IsFind := True;
          SPolygon.isSelected := True;

          OverlayEditorForm.RefreshMousePointer;
          OverlayEditorForm.LoadPanelPolygon;

          OverlayEditorForm.lvPolyVertex.Clear;
          OverlayEditorForm.ShapeType := ovPolygon;

          for k := 0 to SPolygon.polyList.Count - 1 do
          begin
            point := SPolygon.polyList.Items[k];

            with OverlayEditorForm.lvPolyVertex.Items.Add do
            begin
              SubItems.Add(formatDMS_long(point.X));
              SubItems.Add(formatDMS_latt(point.Y));
            end;
          end;

          OverlayEditorForm.lvPolyVertex.Items.BeginUpdate;
          try
           for k := 0 to OverlayEditorForm.lvPolyVertex.Items.Count-1 do
             OverlayEditorForm.lvPolyVertex.Items.Item[k].Caption:=IntToStr(k+1);
          finally
            OverlayEditorForm.lvPolyVertex.Items.EndUpdate;
          end;
          OverlayEditorForm.pnlOutline.color := SPolygon.color;

          OverlayEditorForm.cbbDashesPen.Text :=  lineTypeChoice(SPolygon.LineType);
          OverlayEditorForm.cbbWeightPen.Text := IntToStr(SPolygon.weight);

          if SPolygon.BrushStyle = bsClear then
          begin
            OverlayEditorForm.SetNoFill(True);
          end
          else
          begin
            OverlayEditorForm.SetNoFill(False);
            OverlayEditorForm.pnlFill.Color := SPolygon.ColorFill;
          end;

          IdSelected := countList;
          break;
        end;
      end;

      if IsFind then
          Break;
    end;
    {$ENDREGION}

  end;

  if IsFind then
  begin
    with OverlayEditorForm do
    begin
      btnDelete.Enabled := True;
      btnApply.Enabled := True;
      pnlStatic.Visible := True;
      IdAction := 2;

      if OverlayEditorForm.btnPan.Down = true then
      begin
        OverlayEditorForm.Map1.CurrentTool := miSelectTool;
        OverlayEditorForm.Map1.MousePointer := miDefaultCursor;
        OverlayEditorForm.btnPan.Down := false;
        OverlayEditorForm.LoadNormalButtonImage;
      end;
    end;
  end
  else
  begin
    with OverlayEditorForm do
    begin
      lblShape.Caption := '---';
      pnlStatic.Visible := False;
      pnlDynamic.Visible := False;
      IdAction := 1;

      if OverlayEditorForm.btnPan.Down = false then
      begin
        OverlayEditorForm.RefreshMousePointer;
        OverlayEditorForm.btnSelect.OnClick(btnSelect);
        OverlayEditorForm.btnDelete.Enabled := false;
      end;
    end;
  end;
end;

procedure TDrawOverlay.SendToBack(idx : integer);
var
  a : Integer;
  i : Integer;
  li : TListItem;
  Point : TDotDynamic;
  PointS : TDotStatic;
  compPolygonStatic : TPolygonStatic;
  compPolygonDynamic : TPolygonDynamic;
  lvPolyVertexD: TListView;
  lvPolyVertex : TListView;
  consList : Integer;

  TextDynamic, tempTextDynamic : TTextDynamic;
  LineDynamic, tempLineDynamic : TLineDynamic;
  RectDynamic, tempRectDynamic : TRectangleDynamic;
  CircleDynamic,tempCircleDynamic : TCircleDynamic;
  EllipseDynamic, tempEllipseDynamic : TEllipseDynamic;
  ArcDynamic, tempArcDynamic : TArcDynamic;
  SectorDynamic, tempSectorDynamic : TSectorDynamic ;
  GridDynamic, tempGridDynamic : TGridDynamic;
  PolygonDynamic, tempPolygonDynamic : TPolygonDynamic;
  itemD        : TMainDynamicShape;

  TextStatic, tempTextStatic : TTextStatic;
  LineStatic, tempLineStatic : TLineStatic;
  RectStatic, tempRectStatic : TRectangleStatic;
  CircleStatic,tempCircleStatic : TCircleStatic;
  EllipseStatic, tempEllipseStatic : TEllipseStatic;
  ArcStatic, tempArcStatic : TArcStatic;
  SectorStatic, tempSectorStatic : TSectorStatic ;
  GridStatic, tempGridStatic : TGridStatic;
  PolygonStatic, tempPolygonStatic : TPolygonStatic;
  itemStatic : TMainStaticShape;

begin
  if StateOverlay = osDynamic then
  begin
    itemD := DynamicList[idx];

    if itemD is TTextDynamic then
    begin
      TextDynamic := TTextDynamic(itemD);

      tempTextDynamic := TTextDynamic.Create(Converter);
      tempTextDynamic.ParentPos.X := TextDynamic.ParentPos.X;
      tempTextDynamic.ParentPos.Y := TextDynamic.ParentPos.Y;
      tempTextDynamic.postStart.Range := TextDynamic.postStart.Range;
      tempTextDynamic.postStart.Bearing := TextDynamic.postStart.Bearing;
      tempTextDynamic.size := TextDynamic.size;
      tempTextDynamic.words := TextDynamic.words;
      tempTextDynamic.Color := TextDynamic.Color;

      DynamicList.Delete(idx);
      DynamicList.Insert(0,tempTextDynamic);
    end
    else if itemD is TLineDynamic then
    begin
      LineDynamic := TLineDynamic(itemD);

      tempLineDynamic := TLineDynamic.Create(Converter);
      tempLineDynamic.ParentPos.X := LineDynamic.ParentPos.X;
      tempLineDynamic.ParentPos.Y := LineDynamic.ParentPos.Y;
      tempLineDynamic.PostStart.Bearing := LineDynamic.PostStart.Bearing;
      tempLineDynamic.PostStart.Range := LineDynamic.PostStart.Range;
      tempLineDynamic.PostEnd.Bearing := LineDynamic.PostEnd.Bearing;
      tempLineDynamic.PostEnd.Range := LineDynamic.PostEnd.Range;
      tempLineDynamic.Color := LineDynamic.Color;
      tempLineDynamic.lineType := LineDynamic.lineType;
      tempLineDynamic.weight := LineDynamic.weight;

      DynamicList.Delete(idx);
      DynamicList.Insert(0,tempLineDynamic);
    end
    else if itemD is TRectangleDynamic then
    begin
      RectDynamic := TRectangleDynamic(itemD);

      tempRectDynamic := TRectangleDynamic.Create(Converter);
      tempRectDynamic.ParentPos.X := RectDynamic.ParentPos.X;
      tempRectDynamic.ParentPos.Y := RectDynamic.ParentPos.Y;
      tempRectDynamic.PostStart.Bearing := RectDynamic.PostStart.Bearing;
      tempRectDynamic.PostStart.Range := RectDynamic.PostStart.Range;
      tempRectDynamic.PostEnd.Bearing := RectDynamic.PostEnd.Bearing;
      tempRectDynamic.PostEnd.Range := RectDynamic.PostEnd.Range;
      tempRectDynamic.Color := RectDynamic.Color;

      if RectDynamic.BrushStyle = bsClear  then
      begin
        tempRectDynamic.BrushStyle := bsClear;
      end
      else
      begin
        tempRectDynamic.BrushStyle := bsSolid;
        tempRectDynamic.ColorFill := RectDynamic.ColorFill;
      end;

      tempRectDynamic.LineType :=  RectDynamic.LineType;
      tempRectDynamic.Weight := RectDynamic.Weight;

      DynamicList.Delete(idx);
      DynamicList.Insert(0,tempRectDynamic);
    end
    else if itemD is TCircleDynamic then
    begin
      CircleDynamic := TCircleDynamic(itemD);

      tempCircleDynamic := TCircleDynamic.Create(Converter);
      tempCircleDynamic.ParentPos.X := CircleDynamic.ParentPos.X ;
      tempCircleDynamic.ParentPos.Y := CircleDynamic.ParentPos.Y ;
      tempCircleDynamic.postCenter.Bearing := CircleDynamic.postCenter.Bearing;
      tempCircleDynamic.postCenter.Range := CircleDynamic.postCenter.Range;
      tempCircleDynamic.Radius := CircleDynamic.Radius;
      tempCircleDynamic.Color := CircleDynamic.Color;

      if CircleDynamic.BrushStyle = bsClear  then
      begin
        tempCircleDynamic.BrushStyle := bsClear;
      end
      else
      begin
        tempCircleDynamic.BrushStyle := bsSolid;
        tempCircleDynamic.ColorFill := CircleDynamic.ColorFill;
      end;

      tempCircleDynamic.LineType := CircleDynamic.LineType ;
      tempCircleDynamic.Weight := CircleDynamic.Weight;

      DynamicList.Delete(idx);
      DynamicList.Insert(0,tempCircleDynamic);
    end
    else if itemD is  TEllipseDynamic then
    begin
      EllipseDynamic := TEllipseDynamic(itemD);

      tempEllipseDynamic := TEllipseDynamic.Create(Converter);

      tempEllipseDynamic.ParentPos.X := EllipseDynamic.ParentPos.X;
      tempEllipseDynamic.ParentPos.Y := EllipseDynamic.ParentPos.Y;
      tempEllipseDynamic.postCenter.Bearing := EllipseDynamic.postCenter.Bearing;
      tempEllipseDynamic.postCenter.Range := EllipseDynamic.postCenter.Range;
      tempEllipseDynamic.Vradius := EllipseDynamic.Vradius;
      tempEllipseDynamic.Hradius := EllipseDynamic.Hradius;
      tempEllipseDynamic.Color := EllipseDynamic.Color;

      if EllipseDynamic.BrushStyle = bsClear  then
      begin
        tempEllipseDynamic.BrushStyle := bsClear;
      end
      else
      begin
        tempEllipseDynamic.BrushStyle := bsSolid;
        tempEllipseDynamic.ColorFill := EllipseDynamic.ColorFill;
      end;

      tempEllipseDynamic.LineType := EllipseDynamic.LineType;
      tempEllipseDynamic.Weight := EllipseDynamic.Weight;

      DynamicList.Delete(idx);
      DynamicList.Insert(0,tempEllipseDynamic);
    end
    else if itemD is TArcDynamic then
    begin
      ArcDynamic := TArcDynamic(itemD);

      tempArcDynamic := TArcDynamic.Create(Converter);
      tempArcDynamic.ParentPos.X := ArcDynamic.ParentPos.X;
      tempArcDynamic.ParentPos.Y := ArcDynamic.ParentPos.Y;
      tempArcDynamic.postCenter.Bearing := ArcDynamic.postCenter.Bearing;
      tempArcDynamic.postCenter.Range := ArcDynamic.postCenter.Range;
      tempArcDynamic.Radius := ArcDynamic.Radius;
      tempArcDynamic.StartAngle := ArcDynamic.StartAngle;
      tempArcDynamic.EndAngle := ArcDynamic.EndAngle;
      tempArcDynamic.Color := ArcDynamic.Color;
      tempArcDynamic.LineType :=  ArcDynamic.LineType;
      tempArcDynamic.Weight := ArcDynamic.Weight;

      DynamicList.Delete(idx);
      DynamicList.Insert(0,tempArcDynamic);
    end
    else if itemD is TSectorDynamic then
    begin
      SectorDynamic := TSectorDynamic(itemD);

      tempSectorDynamic := TSectorDynamic.Create(Converter);
      tempSectorDynamic.ParentPos.X := SectorDynamic.ParentPos.X;
      tempSectorDynamic.ParentPos.Y := SectorDynamic.ParentPos.Y;
      tempSectorDynamic.postCenter.Bearing := SectorDynamic.postCenter.Bearing;
      tempSectorDynamic.postCenter.Range := SectorDynamic.postCenter.Range;
      tempSectorDynamic.Oradius := SectorDynamic.Oradius;
      tempSectorDynamic.Iradius := SectorDynamic.Iradius;
      tempSectorDynamic.StartAngle := SectorDynamic.StartAngle;
      tempSectorDynamic.EndAngle := SectorDynamic.EndAngle;
      tempSectorDynamic.Color := SectorDynamic.Color;
      tempSectorDynamic.ColorFill := SectorDynamic.ColorFill;
      tempSectorDynamic.LineType :=  SectorDynamic.LineType;
      tempSectorDynamic.Weight := SectorDynamic.Weight;

      DynamicList.Delete(idx);
      DynamicList.Insert(0,tempSectorDynamic);
    end
    else if itemD is TGridDynamic then
    begin
      GridDynamic := TGridDynamic(itemD);

      tempGridDynamic := TGridDynamic.Create(Converter);
      tempGridDynamic.ParentPos.X := GridDynamic.ParentPos.X;
      tempGridDynamic.ParentPos.Y := GridDynamic.ParentPos.Y;
      tempGridDynamic.postCenter.Bearing := GridDynamic.postCenter.Bearing;
      tempGridDynamic.postCenter.Range := GridDynamic.postCenter.Range;
      tempGridDynamic.Height := GridDynamic.Height;
      tempGridDynamic.Width := GridDynamic.Width;
      tempGridDynamic.HCount := GridDynamic.HCount;
      tempGridDynamic.WCount := GridDynamic.WCount;
      tempGridDynamic.Rotation := GridDynamic.Rotation;
      tempGridDynamic.Color := GridDynamic.Color;
      tempGridDynamic.LineType :=  GridDynamic.LineType;
      tempGridDynamic.Weight := GridDynamic.Weight;

      DynamicList.Delete(idx);
      DynamicList.Insert(0,tempGridDynamic)
    end
    else if itemD is TPolygonDynamic then
    begin
      PolygonDynamic := TPolygonDynamic(itemD);

      tempPolygonDynamic := TPolygonDynamic.Create(Converter);
      tempPolygonDynamic.ParentPos.X := PolygonDynamic.ParentPos.X;
      tempPolygonDynamic.ParentPos.Y := PolygonDynamic.ParentPos.Y;
      tempPolygonDynamic.Color := PolygonDynamic.Color;

      if PolygonDynamic.BrushStyle = bsClear  then
        begin
          tempPolygonDynamic.BrushStyle := bsClear;
        end
      else
        begin
          tempPolygonDynamic.BrushStyle := bsSolid;
          tempPolygonDynamic.ColorFill := PolygonDynamic.ColorFill;
        end;

      tempPolygonDynamic.LineType :=  PolygonDynamic.LineType;
      tempPolygonDynamic.Weight := PolygonDynamic.Weight;

      for a := 0 to OverlayEditorForm.lvPolyVertexD.Items.Count - 1 do
      begin
        li := OverlayEditorForm.lvPolyVertexD.Items[a];

        Point := TDotDynamic.Create;
        Point.Range   := StrToFloat(li.SubItems[0]);
        Point.Bearing := StrToInt(li.SubItems[1]);
        tempPolygonDynamic.polyList.Add(Point);
      end;

      DynamicList.Delete(idx);
      DynamicList.Insert(0,tempPolygonDynamic);
    end;
  end
  else
  begin
    itemStatic :=  StaticList[idx];

    if itemStatic is TTextStatic then
      begin
        TextStatic := TTextStatic(itemStatic);

        tempTextStatic := TTextStatic.Create(Converter);
        tempTextStatic.postStart.X := TextStatic.postStart.X;
        tempTextStatic.postStart.Y := TextStatic.postStart.Y;
        tempTextStatic.size := TextStatic.size;
        tempTextStatic.words := TextStatic.words;
        tempTextStatic.Color := TextStatic.Color;

        StaticList.Delete(idx);
        StaticList.Insert(0,tempTextStatic);
      end
    else if itemStatic is TLineStatic then
      begin
        LineStatic := TLineStatic(itemStatic);

        tempLineStatic := TLineStatic.Create(Converter);
        tempLineStatic.postStart.X := LineStatic.postStart.X;
        tempLineStatic.postStart.Y := LineStatic.postStart.Y ;
        tempLineStatic.postEnd.X := LineStatic.postEnd.X;
        tempLineStatic.postEnd.Y := LineStatic.postEnd.Y;
        tempLineStatic.color := LineStatic.Color;
        tempLineStatic.lineType := LineStatic.LineType;
        tempLineStatic.weight := LineStatic.Weight;

        StaticList.Delete(idx);
        StaticList.Insert(0,tempLineStatic);
      end
    else if itemStatic is TRectangleStatic then
    begin
      RectStatic := TRectangleStatic(itemStatic);

      tempRectStatic := TRectangleStatic.Create(Converter);
      tempRectStatic.postStart.X := RectStatic.postStart.X;
      tempRectStatic.postStart.Y := RectStatic.postStart.Y;
      tempRectStatic.postEnd.X := RectStatic.postEnd.X;
      tempRectStatic.postEnd.Y := RectStatic.postEnd.Y;
      tempRectStatic.color := RectStatic.Color;

      if RectStatic.BrushStyle = bsClear then
      begin
        tempRectStatic.BrushStyle := bsClear;
      end
      else
      begin
        tempRectStatic.BrushStyle := bsSolid;
        tempRectStatic.ColorFill := RectStatic.ColorFill;
        end;
      tempRectStatic.Weight := RectStatic.Weight ;

      StaticList.Delete(idx);
      StaticList.Insert(0,tempRectStatic);
    end
    else if itemStatic is TCircleStatic then
    begin
      CircleStatic := TCircleStatic(itemStatic);

      tempCircleStatic := TCircleStatic.Create(Converter);
      tempCircleStatic.postCenter.X := CircleStatic.postCenter.X;
      tempCircleStatic.postCenter.Y := CircleStatic.postCenter.Y;
      tempCircleStatic.Radius := CircleStatic.Radius;
      tempCircleStatic.color := CircleStatic.Color;
      tempCircleStatic.ColorFill := CircleStatic.ColorFill;
      tempCircleStatic.LineType :=  CircleStatic.LineType;
      tempCircleStatic.Weight := CircleStatic.Weight;

      if CircleStatic.BrushStyle = bsClear  then
      begin
        tempCircleStatic.BrushStyle := bsClear;
      end
      else
      begin
        tempCircleStatic.BrushStyle := bsSolid;
        tempCircleStatic.ColorFill := CircleStatic.ColorFill;
        end;

      tempCircleStatic.LineType :=  CircleStatic.LineType;
      tempCircleStatic.Weight := CircleStatic.Weight;

      StaticList.Delete(idx);
      StaticList.Insert(0,tempCircleStatic);
    end
    else if itemStatic is TEllipseStatic then
    begin
      EllipseStatic := TEllipseStatic(itemStatic);

      tempEllipseStatic := TEllipseStatic.Create(Converter);
      tempEllipseStatic.postCenter.X := EllipseStatic.postCenter.X;
      tempEllipseStatic.postCenter.Y :=  EllipseStatic.postCenter.Y;
      tempEllipseStatic.Hradius := EllipseStatic.Hradius;
      tempEllipseStatic.Vradius := EllipseStatic.Vradius;
      tempEllipseStatic.color := EllipseStatic.Color;

      if EllipseStatic.BrushStyle = bsClear then
      begin
        tempEllipseStatic.BrushStyle := bsClear;
      end
      else
      begin
        tempEllipseStatic.BrushStyle := bsSolid;
        tempEllipseStatic.ColorFill := EllipseStatic.ColorFill;
      end;

      tempEllipseStatic.LineType :=  EllipseStatic.LineType;
      tempEllipseStatic.Weight := EllipseStatic.Weight;

      StaticList.Delete(idx);
      StaticList.Insert(0,tempEllipseStatic);
    end
    else if itemStatic is TArcStatic then
    begin
      ArcStatic := TArcStatic(itemStatic);

      tempArcStatic := TArcStatic.Create(Converter);
      tempArcStatic.postCenter.X := ArcStatic.postCenter.X;
      tempArcStatic.postCenter.Y := ArcStatic.postCenter.Y;
      tempArcStatic.radius := ArcStatic.radius;
      tempArcStatic.StartAngle := ArcStatic.StartAngle;
      tempArcStatic.EndAngle := ArcStatic.EndAngle;
      tempArcStatic.color := ArcStatic.Color;
      tempArcStatic.LineType :=  ArcStatic.LineType;
      tempArcStatic.Weight := ArcStatic.Weight;

      StaticList.Delete(idx);
      StaticList.Insert(0,tempArcStatic);
    end
    else if itemStatic is TSectorStatic then
    begin
      SectorStatic := TSectorStatic(itemStatic);

      tempSectorStatic := TSectorStatic.Create(Converter);
      tempSectorStatic.postCenter.X := SectorStatic.postCenter.X;
      tempSectorStatic.postCenter.Y := SectorStatic.postCenter.Y;
      tempSectorStatic.Oradius := SectorStatic.Oradius;
      tempSectorStatic.Iradius := SectorStatic.Iradius;
      tempSectorStatic.StartAngle := SectorStatic.StartAngle;
      tempSectorStatic.EndAngle := SectorStatic.EndAngle;
      tempSectorStatic.color := SectorStatic.Color;
      tempSectorStatic.ColorFill := SectorStatic.ColorFill;
      tempSectorStatic.LineType :=  SectorStatic.LineType;
      tempSectorStatic.Weight := SectorStatic.Weight;

      StaticList.Delete(idx);
      StaticList.Insert(0,tempSectorStatic);
    end
    else if itemStatic is TGridStatic then
    begin
      GridStatic := TGridStatic(itemStatic);

      tempGridStatic := TGridStatic.Create(Converter);
      tempGridStatic.postCenter.X := GridStatic.postCenter.X ;
      tempGridStatic.postCenter.Y := GridStatic.postCenter.Y;
      tempGridStatic.Height := GridStatic.Height;
      tempGridStatic.Width := GridStatic.Weight;
      tempGridStatic.HCount := GridStatic.HCount;
      tempGridStatic.WCount := GridStatic .WCount;
      tempGridStatic.Rotation := GridStatic.Rotation;
      tempGridStatic.color := GridStatic.Color;
      tempGridStatic.LineType :=  GridStatic.LineType;
      tempGridStatic.Weight := GridStatic.Weight;

      StaticList.Delete(idx);
      StaticList.Insert(0,tempGridStatic);
    end
    else if itemStatic is TPolygonStatic then
    begin
      PolygonStatic := TPolygonStatic(itemStatic);

      tempPolygonStatic := TPolygonStatic.Create(Converter);

      tempPolygonStatic.Color := PolygonStatic.Color;

      if PolygonStatic.BrushStyle = bsClear then
      begin
        tempPolygonStatic.BrushStyle := bsClear;
      end
      else
      begin
        tempPolygonStatic.BrushStyle := bsSolid;
        tempPolygonStatic.ColorFill := PolygonStatic.ColorFill;
      end;

      tempPolygonStatic.Weight := PolygonStatic.Weight;

      for i := 0 to OverlayEditorForm.lvPolyVertex.Items.Count - 1 do
      begin
        li := OverlayEditorForm.lvPolyVertex.Items[i];

        PointS := TDotStatic.Create;
        PointS.X   := dmsToLong(li.SubItems[0]);
        PointS.Y := dmsToLatt(li.SubItems[1]);

        tempPolygonStatic.polyList.Add(PointS);
       end;

      StaticList.Delete(idx);
      StaticList.Insert(0,tempPolygonStatic);
     end;
      end;
  end;

procedure TDrawOverlay.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

procedure TDrawOverlay.ShowStreamDataDynamic(AStream: TStream);
var
  I       : integer;
  lastPos : int64;

  HeaderData  : TFileHeader;
  TextData    : TTextRecord;
  LineData    : TLineRecord;
  RectData    : TRectRecord;
  ArcData     : TArcRecord;
  CircleData  : TCircleRecord;
  EllipseData : TEllipseRecord;
  SectorData  : TSectorRecord;
  GridData    : TGridRecord;
  PolygonData : TPolygonRecord;

  Point           : TDotDynamic;
  TextShape       : TTextDynamic;
  LineShape       : TLineDynamic;
  RectangleShape  : TRectangleDynamic;
  CircleShape     : TCircleDynamic;
  EllipseShape    : TEllipseDynamic;
  ArcShape        : TArcDynamic;
  SectorShape     : TSectorDynamic;
  GridShape       : TGridDynamic;
  PolygonShape    : TPolygonDynamic;
begin
  DynamicList.Clear;

  AStream.Position := 0;
  lastPos := AStream.Position;

  while AStream.Position < AStream.Size do
  begin
    AStream.Read(HeaderData, SizeOf(HeaderData));
    AStream.Seek(lastPos, TSeekOrigin.soBeginning);

    with HeaderData do
    begin
      case ID of
        ovText :
        begin
          AStream.Read(TextData, SizeOf(TextData));

          TextShape := TTextDynamic.Create(Converter);
          TextShape.ParentPos.X := OverlayEditorForm.Map1.CenterX;
          TextShape.ParentPos.Y := OverlayEditorForm.Map1.CenterY;
          TextShape.postStart := FFormula.p2DToRangeBearing(TextData.postStart);
          TextShape.size := TextData.Size;
          TextShape.words := TextData.Words;
          TextShape.Color := TextData.color;
          TextShape.isSelected := False;

          DynamicList.Add(TextShape)
        end;
        ovLine :
        begin
          AStream.Read(LineData, SizeOf(LineData));

          LineShape := TLineDynamic.Create(Converter);
          LineShape.ParentPos.X := OverlayEditorForm.Map1.CenterX;
          LineShape.ParentPos.Y := OverlayEditorForm.Map1.CenterY;
          LineShape.postStart := FFormula.p2DToRangeBearing(LineData.postStart);
          LineShape.postEnd := FFormula.p2DToRangeBearing(LineData.postEnd);
          LineShape.Color := LineData.color;
          LineShape.isSelected := False;
          LineShape.Weight := LineData.weight;
          LineShape.LineType := LineData.lineType;

          DynamicList.Add(LineShape)
        end;
        ovRectangle :
        begin
          AStream.Read(RectData, SizeOf(RectData));

          RectangleShape := TRectangleDynamic.Create(Converter);
          RectangleShape.ParentPos.X := OverlayEditorForm.Map1.CenterX;
          RectangleShape.ParentPos.Y := OverlayEditorForm.Map1.CenterY;
          RectangleShape.postStart := FFormula.p2DToRangeBearing(RectData.postStart);
          RectangleShape.postEnd := FFormula.p2DToRangeBearing(RectData.postEnd);
          RectangleShape.Color := RectData.color;
          RectangleShape.isSelected := False;
          RectangleShape.Weight := RectData.weight;
          RectangleShape.LineType := RectData.lineType;
          RectangleShape.BrushStyle := RectData.brushStyle;
          RectangleShape.ColorFill := RectData.fillColor;

          DynamicList.Add(RectangleShape)
        end;
        ovCircle :
        begin
          AStream.Read(CircleData, SizeOf(CircleData));

          CircleShape := TCircleDynamic.Create(Converter);
          CircleShape.ParentPos.X := OverlayEditorForm.Map1.CenterX;
          CircleShape.ParentPos.Y := OverlayEditorForm.Map1.CenterY;
          CircleShape.postCenter := FFormula.p2DToRangeBearing(CircleData.postCenter);
          CircleShape.radius := CircleData.radius;
          CircleShape.Color := CircleData.color;
          CircleShape.isSelected := False;
          CircleShape.Weight := CircleData.weight;
          CircleShape.LineType := CircleData.lineType;
          CircleShape.BrushStyle := CircleData.brushStyle;
          CircleShape.ColorFill := CircleData.fillColor;

          DynamicList.Add(CircleShape)
        end;
        ovEllipse :
        begin
          AStream.Read(EllipseData, SizeOf(EllipseData));

          EllipseShape := TEllipseDynamic.Create(Converter);
          EllipseShape.ParentPos.X := OverlayEditorForm.Map1.CenterX;
          EllipseShape.ParentPos.Y := OverlayEditorForm.Map1.CenterY;
          EllipseShape.postCenter := FFormula.p2DToRangeBearing(EllipseData.postCenter);
          EllipseShape.Hradius := EllipseData.Hradius;
          EllipseShape.Vradius := EllipseData.Vradius;
          EllipseShape.Color := EllipseData.color;
          EllipseShape.isSelected := False;
          EllipseShape.Weight := EllipseData.weight;
          EllipseShape.LineType := EllipseData.lineType;
          EllipseShape.BrushStyle := EllipseData.brushStyle;
          EllipseShape.ColorFill := EllipseData.fillColor;

          DynamicList.Add(EllipseShape)
        end;
        ovArc :
        begin
          AStream.Read(ArcData, SizeOf(ArcData));

          ArcShape := TArcDynamic.Create(Converter);
          ArcShape.ParentPos.X := OverlayEditorForm.Map1.CenterX;
          ArcShape.ParentPos.Y := OverlayEditorForm.Map1.CenterY;
          ArcShape.postCenter := FFormula.p2DToRangeBearing(ArcData.postCenter);
          ArcShape.radius := ArcData.radius;
          ArcShape.StartAngle := ArcData.startAngle;
          ArcShape.EndAngle := ArcData.endAngle;
          ArcShape.Color := ArcData.color;
          ArcShape.isSelected := False;
          ArcShape.Weight := ArcData.weight;
          ArcShape.LineType := ArcData.lineType;

          DynamicList.Add(ArcShape)
        end;
        ovSector :
        begin
          AStream.Read(SectorData, SizeOf(SectorData));

          SectorShape := TSectorDynamic.Create(Converter);
          SectorShape.ParentPos.X := OverlayEditorForm.Map1.CenterX;
          SectorShape.ParentPos.Y := OverlayEditorForm.Map1.CenterY;
          SectorShape.postCenter := FFormula.p2DToRangeBearing(SectorData.postCenter);
          SectorShape.Oradius := SectorData.Oradius;
          SectorShape.Iradius := SectorData.Iradius;
          SectorShape.StartAngle:= SectorData.StartAngle;
          SectorShape.EndAngle := SectorData.EndAngle;
          SectorShape.Color := SectorData.color;
          SectorShape.isSelected := False;
          SectorShape.Weight := SectorData.weight;
          SectorShape.LineType := SectorData.lineType;
          SectorShape.BrushStyle := SectorData.brushStyle;
          SectorShape.ColorFill := SectorData.fillColor;

          DynamicList.Add(SectorShape)
        end;
        ovGrid :
        begin
          AStream.Read(GridData, SizeOf(GridData));

          GridShape := TGridDynamic.Create(Converter);
          GridShape.ParentPos.X := OverlayEditorForm.Map1.CenterX;
          GridShape.ParentPos.Y := OverlayEditorForm.Map1.CenterY;
          GridShape.postCenter := FFormula.p2DToRangeBearing(GridData.postCenter);
          GridShape.HCount := GridData.HCount;
          GridShape.WCount := GridData.WCount;
          GridShape.Height := GridData.Height;
          GridShape.Width := GridData.Width;
          GridShape.Rotation:=GridData.Rotation;
          GridShape.Color := GridData.color;
          GridShape.isSelected := False;
          GridShape.Weight := GridData.weight;
          GridShape.LineType := GridData.lineType;
          GridShape.BrushStyle := GridData.brushStyle;

          DynamicList.Add(GridShape)
        end;
        ovPolygon :
        begin
          AStream.Read(PolygonData, SizeOf(PolygonData));

          PolygonShape := TPolygonDynamic.Create(Converter);
          PolygonShape.ParentPos.X := OverlayEditorForm.Map1.CenterX;
          PolygonShape.ParentPos.Y := OverlayEditorForm.Map1.CenterY;

//          SetLength(PolygonData.postStart, PolygonData.LengthArray);
          for I := 0 to PolygonData.LengthArray - 1 do
          begin
            AStream.Read(PolygonData.postStart[I].X, SizeOf(tempPos));
            AStream.Read(PolygonData.postStart[I].Y, SizeOf(tempPos));

            Point := TDotDynamic.Create;

            Point.Range   := PolygonData.postStart[I].X;
            Point.Bearing := PolygonData.postStart[I].Y;
            PolygonShape.polyList.Add(Point);
          end;
          PolygonShape.Color := PolygonData.color;
          PolygonShape.isSelected := False;
          PolygonShape.Weight := PolygonData.weight;
          PolygonShape.LineType := PolygonData.lineType;
          PolygonShape.BrushStyle := PolygonData.brushStyle;
          PolygonShape.ColorFill := PolygonData.fillColor;

          DynamicList.Add(PolygonShape)
        end;
      end;
    end;
    lastPos := AStream.Position;
  end;
end;

procedure TDrawOverlay.ShowStreamDataStatic(AStream: TStream);
var
  I       : integer;
  lastPos : int64;

  HeaderData  : TFileHeader;
  TextData    : TTextRecord;
  LineData    : TLineRecord;
  RectData    : TRectRecord;
  ArcData     : TArcRecord;
  CircleData  : TCircleRecord;
  EllipseData : TEllipseRecord;
  SectorData  : TSectorRecord;
  GridData    : TGridRecord;
  PolygonData : TPolygonRecord;

  Point           : TDotStatic;
  TextShape       : TTextStatic;
  LineShape       : TLineStatic;
  RectangleShape  : TRectangleStatic;
  CircleShape     : TCircleStatic;
  EllipseShape    : TEllipseStatic;
  ArcShape        : TArcStatic;
  SectorShape     : TSectorStatic;
  GridShape       : TGridStatic;
  PolygonShape    : TPolygonStatic;
begin
  StaticList.Clear;

  AStream.Position := 0;
  lastPos := AStream.Position;

  while AStream.Position < AStream.Size do
  begin

    AStream.Read(HeaderData, SizeOf(HeaderData));
    AStream.Seek(lastPos, TSeekOrigin.soBeginning);
    with HeaderData do
    begin
      case ID of
        ovText :
        begin
          AStream.Read(TextData, SizeOf(TextData));

          TextShape := TTextStatic.Create(Converter);
          TextShape.postStart := TextData.postStart;
          TextShape.size := TextData.Size;
          TextShape.words := TextData.Words;
          TextShape.Color := TextData.color;
          TextShape.isSelected := False;

          StaticList.Add(TextShape)
        end;
        ovLine :
        begin
          AStream.Read(LineData, SizeOf(LineData));

          LineShape := TLineStatic.Create(Converter);
          LineShape.postStart := LineData.postStart;
          LineShape.postEnd := LineData.postEnd;
          LineShape.Color := LineData.color;
          LineShape.isSelected := False;
          LineShape.Weight := LineData.weight;
          LineShape.LineType := LineData.lineType;

          StaticList.Add(LineShape)
        end;
        ovRectangle :
        begin
          AStream.Read(RectData, SizeOf(RectData));

          RectangleShape := TRectangleStatic.Create(Converter);
          RectangleShape.postStart := RectData.postStart;
          RectangleShape.postEnd := RectData.postEnd;
          RectangleShape.Color := RectData.color;
          RectangleShape.isSelected := False;
          RectangleShape.Weight := RectData.weight;
          RectangleShape.LineType := RectData.lineType;
          RectangleShape.BrushStyle := RectData.brushStyle;
          RectangleShape.ColorFill := RectData.fillColor;

          StaticList.Add(RectangleShape)
        end;
        ovCircle :
        begin
          AStream.Read(CircleData, SizeOf(CircleData));

          CircleShape := TCircleStatic.Create(Converter);
          CircleShape.postCenter := CircleData.postCenter;
          CircleShape.radius := CircleData.radius;
          CircleShape.Color := CircleData.color;
          CircleShape.isSelected := False;
          CircleShape.Weight := CircleData.weight;
          CircleShape.LineType := CircleData.lineType;
          CircleShape.BrushStyle := CircleData.brushStyle;
          CircleShape.ColorFill := CircleData.fillColor;

          StaticList.Add(CircleShape)
        end;
        ovEllipse :
        begin
          AStream.Read(EllipseData, SizeOf(EllipseData));

          EllipseShape := TEllipseStatic.Create(Converter);
          EllipseShape.postCenter := EllipseData.postCenter;
          EllipseShape.Hradius := EllipseData.Hradius;
          EllipseShape.Vradius := EllipseData.Vradius;
          EllipseShape.Color := EllipseData.color;
          EllipseShape.isSelected := False;
          EllipseShape.Weight := EllipseData.weight;
          EllipseShape.LineType := EllipseData.lineType;
          EllipseShape.BrushStyle := EllipseData.brushStyle;
          EllipseShape.ColorFill := EllipseData.fillColor;

          StaticList.Add(EllipseShape)
        end;
        ovArc :
        begin
          AStream.Read(ArcData, SizeOf(ArcData));

          ArcShape := TArcStatic.Create(Converter);
          ArcShape.postCenter := ArcData.postCenter;
          ArcShape.radius := ArcData.radius;
          ArcShape.StartAngle := ArcData.startAngle;
          ArcShape.EndAngle := ArcData.endAngle;
          ArcShape.Color := ArcData.color;
          ArcShape.isSelected := False;
          ArcShape.Weight := ArcData.weight;
          ArcShape.LineType := ArcData.lineType;

          StaticList.Add(ArcShape)
        end;
        ovSector :
        begin
          AStream.Read(SectorData, SizeOf(SectorData));

          SectorShape := TSectorStatic.Create(Converter);
          SectorShape.postCenter := SectorData.postCenter;
          SectorShape.Oradius := SectorData.Oradius;
          SectorShape.Iradius := SectorData.Iradius;
          SectorShape.StartAngle:= SectorData.StartAngle;
          SectorShape.EndAngle := SectorData.EndAngle;
          SectorShape.Color := SectorData.color;
          SectorShape.isSelected := False;
          SectorShape.Weight := SectorData.weight;
          SectorShape.LineType := SectorData.lineType;
          SectorShape.BrushStyle := SectorData.brushStyle;
          SectorShape.ColorFill := SectorData.fillColor;

          StaticList.Add(SectorShape)
        end;
        ovGrid :
        begin
          AStream.Read(GridData, SizeOf(GridData));

          GridShape := TGridStatic.Create(Converter);
          GridShape.postCenter := GridData.postCenter;
          GridShape.HCount := GridData.HCount;
          GridShape.WCount := GridData.WCount;
          GridShape.Height := GridData.Height;
          GridShape.Width := GridData.Width;
          GridShape.Color := GridData.color;
          GridShape.isSelected := False;
          GridShape.Weight := GridData.weight;
          GridShape.LineType := GridData.lineType;
          GridShape.BrushStyle := GridData.brushStyle;

          StaticList.Add(GridShape)
        end;
        ovPolygon :
        begin
          AStream.Read(PolygonData, SizeOf(PolygonData));

          PolygonShape := TPolygonStatic.Create(Converter);

//          SetLength(PolygonData.postStart, PolygonData.LengthArray);
          for I := 0 to PolygonData.LengthArray - 1 do
          begin
            AStream.Read(PolygonData.postStart[I].X, SizeOf(tempPos));
            AStream.Read(PolygonData.postStart[I].Y, SizeOf(tempPos));

            Point := TDotStatic.Create;
            Point.X := PolygonData.postStart[I].X;
            Point.Y := PolygonData.postStart[I].Y;
            PolygonShape.polyList.Add(Point);
          end;
          PolygonShape.Color := PolygonData.color;
          PolygonShape.isSelected := False;
          PolygonShape.Weight := PolygonData.weight;
          PolygonShape.LineType := PolygonData.lineType;
          PolygonShape.BrushStyle := PolygonData.brushStyle;
          PolygonShape.ColorFill := PolygonData.fillColor;

          StaticList.Add(PolygonShape)
        end;
      end;
    end;
    lastPos := AStream.Position;
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

{ TDrawRuler }

procedure TDrawRuler.Clear;
begin

end;

constructor TDrawRuler.Create;
begin

end;

destructor TDrawRuler.Destroy;
begin

  inherited;
end;

procedure TDrawRuler.Draw(FCanvas: TCanvas);
var
  sx, sy, ex, ey: Integer;
begin
  inherited;

  Converter.ConvertToScreen(postStart.X, postStart.Y, sx, sy);
  Converter.ConvertToScreen(postEnd.X, postEnd.Y, ex, ey);

  with FCanvas do
  begin
    Brush.Style := bsClear;

    Pen.Style := psDash;
    Pen.Width := 2;
    Pen.color := clYellow;
    if not IsVisible then
      Exit;
    MoveTo(sx, sy);
    LineTo(ex, ey);
    Pen.Color := clGreen;
    Rectangle(sx-1,sy-1,sx+1,sy+1);
    Pen.Color := clRed;
    Rectangle(ex-1,ey-1,ex+1,ey+1);
  end;
end;


procedure TDrawRuler.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

end.
