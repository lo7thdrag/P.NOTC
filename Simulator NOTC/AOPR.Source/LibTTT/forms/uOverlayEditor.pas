unit uOverlayEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, MapXLib_TLB, uMapXHandler, uCoordConvertor,
  uDBAsset_GameEnvironment, TeCanvas, ColorGrd;

type
  {Object Drawing}
  TDrawingObj = class abstract
  public
    col : TColor;
    text : String;
    radius : Double;
    StartPoint : TPoint;
    EndPoint : TPoint;
    CenterPoint : Double;
    FMap : TMap;
    featurelayer : CMapXFeatureFactory;
    lyrMyLayer: Variant;
    canvas : TCanvas;
    procedure drawing; virtual; abstract;
  end;


  TLineObj = class(TDrawingObj)
    startPointX : double;
    startPointY : double;
    endPointX : double;
    endPointY : double;
    procedure drawing; override;
  end;

  TArcObj = class(TDrawingObj)
    centerPointX : double;
    centerPointY : double;
    startAngle : double;
    endAngle : double;
    radius : double;
    procedure drawing; override;
  end;

  TCircleObj = class(TDrawingObj)
    centerPointX : double;
    centerPointY : double;
    radius : double;
    procedure drawing; override;
  end;

  TEllipseObj = class(TDrawingObj)
    centerPointX : double;
    centerPointY : double;
    majorAxis : double;
    minorAxis : double;
    procedure drawing; override;
  end;

  TGridObj = class(TDrawingObj)
    centerPointX : double;
    centerPointY : double;
    cellWidth : double;
    cellHeight : double;
    column : Integer;
    Row : Integer;
    rotationAngle : double;
    procedure drawing; override;
  end;

  TPolygonObj = class(TDrawingObj)
    listPoints : TList;
    pointCollection : Variant;
    procedure drawing; override;
  end;

  TRectangelObj = class(TDrawingObj)
    startPointX : double;
    startPointY : double;
    endPointX : double;
    endPointY : double;
    procedure drawing; override;
  end;

  TSectorObj = class(TDrawingObj)
    centerPointX : double;
    centerPointY : double;
    startAngle : double;
    endAngle : double;
    innerRadius : double;
    outerRadius : double;
    procedure drawing; override;
  end;

  TTextObj = class(TDrawingObj)
    startPointX : double;
    startPointY : double;
    color : TColor;
    text : string;
    size : integer;
    procedure drawing; override;
  end;

  {}

  TPointObj = class
     fFeature : Variant;
     sName : String;
     iSpeed : Integer;
     dHeading : Double;
     posx : Double;
     posY : Double;
     objType: SmallInt;
  end;



  TOverlayEditorForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    grbCursorPosition: TGroupBox;
    BearingCursorPosition: TStaticText;
    lblDegreesTBearing: TStaticText;
    lblBearing: TLabel;
    DistanceCursorPosition: TStaticText;
    lblnmDistance: TStaticText;
    lblDistance: TLabel;
    PositionCursorPosition: TStaticText;
    lbSlPosition: TLabel;
    GridCursorPosition: TStaticText;
    lblnmSGrid: TLabel;
    lblWPosition: TLabel;
    lblnmWGrid: TLabel;
    grbDrawingTool: TGroupBox;
    bntDraw1: TSpeedButton;
    grbColour: TGroupBox;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    gbText: TGroupBox;
    btnDraw2: TSpeedButton;
    btnDraw3: TSpeedButton;
    btnDrawText: TSpeedButton;
    btnDraw5: TSpeedButton;
    btnDraw4: TSpeedButton;
    btnDraw6: TSpeedButton;
    btnDraw7: TSpeedButton;
    btnDraw8: TSpeedButton;
    btnColour4: TSpeedButton;
    btnColour1: TSpeedButton;
    btnColour2: TSpeedButton;
    btnColour3: TSpeedButton;
    btnColour8: TSpeedButton;
    btnColour5: TSpeedButton;
    btnColour6: TSpeedButton;
    btnColour7: TSpeedButton;
    btnTextSize3: TSpeedButton;
    btnTextSize1: TSpeedButton;
    btnTextSize2: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    toolbtnDecreaseScale: TToolButton;
    cbSetScale: TComboBox;
    toolbtnIncreaseScale: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ImageList1: TImageList;
    ToolButton3: TToolButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Map1: TMap;
    ImageDrawingTools: TImageList;
    ImageList2: TImageList;
    gbSector: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    gbCenterPointSector: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    edtBearingFromCenterSector: TEdit;
    edtDistanceFromCenterSector: TEdit;
    edtStartAngleSector: TEdit;
    edtEndAngleSector: TEdit;
    edtInnerRadius: TEdit;
    edtOuterRadius: TEdit;
    btnScreenCapture: TButton;
    gbCircle: TGroupBox;
    Label13: TLabel;
    Label17: TLabel;
    GroupBox4: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edtBearingFromCenterCircle: TEdit;
    edtDistanceFromCenterCircle: TEdit;
    edtRadiusCircle: TEdit;
    gbLine: TGroupBox;
    gbStartPoint: TGroupBox;
    Label16: TLabel;
    Label18: TLabel;
    edtStartPosLat: TEdit;
    edtStartGridLat: TEdit;
    edtStartPosLong: TEdit;
    edtStartGridLong: TEdit;
    gbEndPoint: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    edtEndPosLat: TEdit;
    edtEndGridLat: TEdit;
    edtEndPosLong: TEdit;
    edtEndGridLong: TEdit;
    gbArc: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    edtCenterPosLat: TEdit;
    edtCenterGridLat: TEdit;
    edtCenterPosLong: TEdit;
    edtCenterGridLong: TEdit;
    edtArcStartAngle: TEdit;
    edtArcEndAngle: TEdit;
    edtArcRadius: TEdit;
    gbGrid: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Label35: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    GroupBox5: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    edtGridPosLat: TEdit;
    edtGridGLat: TEdit;
    edtGridPosLong: TEdit;
    edtGridGLong: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    gbRectangle: TGroupBox;
    GroupBox6: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    edtRectStartPosLat: TEdit;
    edtRectStartGridLat: TEdit;
    edtRectStartPosLong: TEdit;
    edtRectStartGridLong: TEdit;
    GroupBox7: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    edtRectEndPosLat: TEdit;
    edtRectEndGridLat: TEdit;
    edtRectEndPosLong: TEdit;
    edtRectEndGridLong: TEdit;
    SpeedButton1: TSpeedButton;
    colorChoose: TColorGrid;
    pnlColorSelect: TPanel;
    colorPanel: TPanel;
    gbPolygon: TGroupBox;
    GroupBox1: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    edtPolygonPosLat: TEdit;
    edtPolygonGridLat: TEdit;
    edtPolygonPosLong: TEdit;
    edtPolygonGridLong: TEdit;
    GroupBox3: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    edtTextPosLAt: TEdit;
    edtTextGridLat: TEdit;
    edtTextPosLong: TEdit;
    edtTextGridLong: TEdit;
    Label49: TLabel;
    edtText: TEdit;
    Label50: TLabel;
    gbEllipse: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    GroupBox9: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    edtEllipseBearing: TEdit;
    edtEllipseDistance: TEdit;
    edtMajorAxis: TEdit;
    Label57: TLabel;
    edtMinorAxis: TEdit;
    Label58: TLabel;
    ToolButton4: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure Map1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Map1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Map1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Map1DrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Cardinal;
      const RectFull, RectInvalid: IDispatch);
    procedure Map1MapViewChanged(Sender: TObject);
    procedure cbSetScaleChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure toolbtnDecreaseScaleClick(Sender: TObject);
    procedure toolbtnIncreaseScaleClick(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure colorChooseChange(Sender: TObject);
    procedure bntDraw1Click(Sender: TObject);
    procedure btnDraw2Click(Sender: TObject);
    procedure btnDraw3Click(Sender: TObject);
    procedure btnDraw4Click(Sender: TObject);
    procedure btnDraw5Click(Sender: TObject);
    procedure btnDraw6Click(Sender: TObject);
    procedure btnDraw7Click(Sender: TObject);
    procedure btnDraw8Click(Sender: TObject);
    procedure btnDrawTextClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnScreenCaptureClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure btnTextSize1Click(Sender: TObject);
    procedure btnTextSize2Click(Sender: TObject);
    procedure btnTextSize3Click(Sender: TObject);
  private
    { Private declarations }
    statePan: Boolean;
    stateSelect: Boolean;
  public
    { Public declarations }
    FMapPlatform: TSimMap;
    FCoordPlatformConv: TCoordConverter;
    //diffXnm, diffYnm: double;
    //gridLatt, gridLong, addStringX, addStringY: string;

    // game area overlay
    OverlayGameEnviroDef: TGame_Environment_Definition;

    // state
    stateDrawing: Boolean;
    stateMove: Boolean;
    stateDelete: Boolean;

    //state tool drawing
    DrawTool : Integer;

    // map canvas
    FCanvas: TCanvas;
    FLyrDraw: CMapXLayer;
    FInsertionLayer : CMapXLayer;

    fFtrFactory : CMapXFeatureFactory; //aldy
    sCaptureLayer : CMapXLayer;
    pointCollection : Variant;

    //draw
    FNewDrawing : Variant;
    pItem : Variant;

    //Group Object
    listLine : TList;
    listArc : TList;
    listGrid : TList;
    listCircle : TList;
    listEllipse : TList;
    listPolygon : TList;
    listRectangle : TList;
    listSector : TList;
    listText : TList;

    //temp object
    lineTemp : TLineObj;
    rectTemp : TRectangelObj;
    sectorTemp : TSectorObj;
    circleTemp : TCircleObj;
    ellipseTemp : TEllipseObj;
    textTemp : TTextObj;
    arcTemp : TArcObj;
    polygonTemp : TPolygonObj;
    gridTemp : TGridObj;

    MouseIsDown, isCapturingScreen    : Boolean;

    {added by me}
    drawLine, drawRect, drawTextEdit, drawCircle, drawEllipse : boolean;
    pressDown : boolean;
    rec : TRect;
    startX, startY, endX, endY, H, W : integer;
    sizeText, bigMidSmall : integer;
    tempText : String;

    procedure loadENC(name: String);
    procedure setCBScale;
    procedure createGeoset;
    procedure LoadMap(aGeoset: String);
    procedure ScreenShot(DestBitmap : TBitmap);
    procedure SaveToGeoset;
  end;


var
  OverlayEditorForm: TOverlayEditorForm;
  xx: double;
  yy: double;
  b,TmpBmp:TBitmap;


  objectDrawing : TDrawingObj;

const
  LINE = 1;
  ARC = 2;
  GRID = 3;
  RECTANGLE = 4;
  POLYGON =5;
  CIRCLE = 6;
  ELLIPSE = 7;
  SECTOR = 8;
  ALPHA = 9;


implementation

uses uBaseCoordSystem, math, uOverlay, ComObj, uScrCapture, ufCaptureRes;
{$R *.dfm}
{draw Obj}


procedure TLineObj.drawing;
var pointCollection : Variant;
  pItemStart: Variant;
  pItemENd : Variant;
  fNewLine : Variant;
  fMapSymbol : Variant;
begin
  pointCollection := CoPoints.Create;
  pItemStart := CreateOleObject('MapX.Point.4');
  pItemEnd := CreateOleObject('MapX.Point.4');

  pItemStart.Set(startPointX, startPointY);
  pItemEnd.Set(endPointX, endPointY);

  pointCollection.add(pItemStart);
  PointCollection.add(pItemEnd);

  fNewLine := featurelayer.CreateLine(pointCollection, FMap.DefaultStyle);
  fMapSymbol := lyrMyLayer.AddFeature(fNewLine);
end;

procedure TRectangelObj.drawing;
var
  pointCollection : Variant;
  pItemStart: Variant;
  pItemENd : Variant;
  pItemStartLeft : Variant;
  pItemStartDown : Variant;
  fNewRect : Variant;
  fMapSymbol : Variant;
begin
  pointCollection := CoPoints.Create;
  pItemStart := CreateOleObject('MapX.Point.4');
  pItemStartLeft := CreateOleObject('MapX.Point.4');
  pItemEnd := CreateOleObject('MapX.Point.4');
  pItemStartDown := CreateOleObject('MapX.Point.4');

  pItemStart.Set(startPointX, startPointY);
  pointCollection.add(pItemStart);
  fNewRect := featurelayer.CreateLine(pointCollection, Fmap.DefaultStyle);

  pItemStartLeft.Set(endPointX, startPointY);
  pointCollection.add(pItemStartLeft);
  fNewRect := featurelayer.CreateLine(pointCollection, Fmap.DefaultStyle);
  fMapSymbol := lyrMyLayer.AddFeature(fNewRect);

  pItemEnd.Set(endPointX, endPointY);
  PointCollection.add(pItemEnd);
  fNewRect := featurelayer.CreateLine(pointCollection, Fmap.DefaultStyle);
  fMapSymbol := lyrMyLayer.AddFeature(fNewRect);

  pItemStartDown.Set(startPointX, endPointY);
  pointCollection.add(pItemStartDown);
  fMapSymbol := lyrMyLayer.AddFeature(fNewRect);

  fNewRect := featurelayer.CreateRegion(pointCollection, Fmap.DefaultStyle);


  fMapSymbol := lyrMyLayer.AddFeature(fNewRect);
end;

procedure TGridObj.drawing;
begin
  //
end;

procedure TArcObj.drawing;
begin
  //
end;

procedure TPolygonObj.drawing;
var
  pItem: Variant;
  fNewLine : Variant;
  fMapSymbol : Variant;
begin
  pointCollection := CoPoints.Create;
  pItem := CreateOleObject('MapX.Point.4');

  fNewLine := featurelayer.CreateLine(pointCollection, FMap.DefaultStyle);
  fMapSymbol := lyrMyLayer.AddFeature(fNewLine);
end;

procedure TSectorObj.drawing;
begin
  //
end;

procedure TCircleObj.drawing;
var
  pItem: Variant;
  fNewCircle : Variant;
begin
  pItem := CreateOleObject('MapX.Point.4');
  pItem.Set(centerPointX, centerPointY);

  fNewCircle := featurelayer.CreateCircularRegion(1, pItem, radius, 1, 1, FMap.DefaultStyle);
end;

procedure TEllipseObj.drawing;
var
  pItem: Variant;
  fNewEllipse : Variant;
begin
  pItem := CreateOleObject('MapX.Point.4');
  pItem.Set(centerPointX, centerPointY);

end;

procedure TTextObj.drawing;
var
  pItem: Variant;
  fNewText : Variant;
  fMapSymbol : Variant;
  MyFont : TFont;
begin
  pItem := CreateOleObject('MapX.Point.4');
  pItem.set(startPointX, startPointY);
  //set color
  {setting font}
  MyFont := TFont.Create;
  OleFontToFont(Fmap.DefaultStyle.SymbolFont, MyFont);
  MyFont.Size := size;
  MyFont.Color := color;
  FMap.DefaultStyle.SymbolFontColor := color;
  {end setting}
  fNewText := featurelayer.CreateText(pItem, text, miPositionTL, FMap.DefaultStyle);
  fMapSymbol := lyrMyLayer.AddFeature(fNewText);
end;

{end draw Obj}

procedure TOverlayEditorForm.FormCreate(Sender: TObject);
begin
  Map1.DoubleBuffered := true;
  FMapPlatform := TSimMap.Create(Map1);
  FCoordPlatformConv := TCoordConverter.Create;
  FCoordPlatformConv.FMap := Map1;
  OverlayGameEnviroDef := TGame_Environment_Definition.Create;

  FMapPlatform.FMap.OnMouseMove := Map1MouseMove;
  FMapPlatform.FMap.OnMouseDown := Map1MouseDown;
  FMapPlatform.FMap.OnMouseUp := Map1MouseUp;
  FMapPlatform.FMap.OnDrawUserLayer := Map1DrawUserLayer;

  FCanvas := TCanvas.Create;

  // default state all false
  stateDrawing := false;
  stateMove := false;
  stateDelete := false;

  //List object
  listLine := TList.Create;
  listArc := TList.Create;
  listGrid := TList.Create;
  listCircle := TList.Create;
  listEllipse := TList.Create;
  listPolygon := TList.Create;
  listRectangle := TList.Create;
  listSector := TList.Create;
  listText := TList.Create;

  //temp Object
  lineTemp := TLineObj.Create;
  arcTemp := TArcObj.Create;
  gridTemp := TGridObj.Create;
  circleTemp := TCircleObj.Create;
  ellipseTemp := TEllipseObj.Create;
  polygonTemp := TPolygonObj.Create;
  rectTemp := TRectangelObj.Create;
  sectorTemp := TSectorObj.Create;
  textTemp := TTextObj.Create;

  Map1.CurrentTool := miArrowTool;
  //TransparentColorValue := clMaroon;
end;

procedure TOverlayEditorForm.FormShow(Sender: TObject);
begin
  fFtrFactory := Map1.FeatureFactory;
  Map1.DefaultStyle.RegionBackColor := TransparentColorValue;
  {
  with fOverlay.game_area_def.FGameArea do
  begin
    Map1.CenterX := Game_Centre_Long;
    Map1.CenterY := Game_Centre_Lat;
  end;
  }
end;

procedure TOverlayEditorForm.Map1DrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Cardinal;
  const RectFull, RectInvalid: IDispatch);
begin
    if not Assigned(FCanvas) then
      Exit;
    FCanvas.Handle := hOutputDC;

    if drawLine then
    begin
        FCanvas.MoveTo(startX, startY);
        FCanvas.LineTo(endX, endY);
        FCanvas.Pen.Color := colorChoose.ForegroundColor;
    end;

    if drawRect then
    begin
       FCanvas.Rectangle(startX, startY, endX, endY);
       //FCanvas.Rectangle(rec);
       FCanvas.Pen.Color := colorChoose.ForegroundColor;
       Fcanvas.Brush.Style := bsClear;
    end;

    if drawCircle then
    begin
       FCanvas.Ellipse(startX, startY, endX, endY);
       FCanvas.Pen.Color := colorChoose.ForegroundColor;
       Fcanvas.Brush.Style := bsClear;
    end;

    if drawEllipse then
    begin
       FCanvas.Ellipse(startX, startY, endX, endY);
       FCanvas.Pen.Color := colorChoose.ForegroundColor;
       Fcanvas.Brush.Style := bsClear;
    end;

    if drawTextEdit then
    begin
        FCanvas.TextOut(startX, startY, tempText);
        FCanvas.Font.Color := colorChoose.ForegroundColor;

        if bigMidSmall = 1 then
           FCanvas.Font.Size := 27
        else if bigMidSmall = 2 then
           FCanvas.Font.Size := 17
        else if bigMidSmall = 3 then
           FCanvas.Font.Size := 7
        else
           FCanvas.Font.Size := 12;
        Fcanvas.Brush.Style := bsClear;
    end;
end;

procedure TOverlayEditorForm.Map1MapViewChanged(Sender: TObject);
var
  tempZoom: double;
  index: Integer;
  test: string;
begin
  if Map1.CurrentTool = miZoomInTool then
  begin
    if Map1.Zoom <= 0.125 then
      tempZoom := 0.125;
    if (Map1.Zoom > 0.125) AND (Map1.Zoom < 1) then
      tempZoom := Map1.Zoom;
    if (Map1.Zoom >= 1) AND (Map1.Zoom <= 2500) then
      tempZoom := round(Map1.Zoom);
    if Map1.Zoom > 2500 then
      tempZoom := 2500;

    Map1.OnMapViewChanged := nil;
    Map1.ZoomTo(tempZoom, Map1.CenterX, Map1.CenterY);

    if (Map1.Zoom > 0.125) AND (Map1.Zoom < 0.25) then
    begin
      cbSetScale.Text := FormatFloat('0.000', tempZoom);
    end
    else if (map1.Zoom >= 0.25) AND (map1.Zoom < 0.5) then
    begin
         cbSetScale.Text := FormatFloat('0.00', tempZoom);
    end
    else if (map1.Zoom >= 0.5) AND (map1.Zoom < 1) then
    begin
         cbSetScale.Text := FormatFloat('0.0', tempZoom);
    end
    else
      cbSetScale.Text := floattostr(tempZoom);
    Map1.OnMapViewChanged := Map1MapViewChanged;
  end;
end;

procedure TOverlayEditorForm.Map1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    I : integer;
    mapStartX, mapStartY, mapEndX, mapEndY : double;
    textX, textY : double;
    sX, sY, eX, eY : single;
    txtX, txtY : single;
    xCenter, yCenter, xCursorPoint, yCursorPoint, diffY, diffX, diffYnm, diffXnm : double;
    gridLatt, gridLong, addStringX, addStringY: string;
begin
  FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);
  pressDown := true;

  if statePan then
  begin
    Map1.CenterX := xx;
    Map1.CenterY := yy;

    statePan := false;
    Map1.CurrentTool := miArrowTool;
    Map1.MousePointer := miCrossCursor;
  end;

  if drawLine then
  begin
       startX := X;
       startY := Y;
       endX := X;
       endY := Y;

       sX := startX; sY := startY;
       eX := endX; eY := endY;
       Map1.ConvertCoord(sX, sY, mapStartX, mapStartY, miScreenToMap);
       Map1.ConvertCoord(eX, eY, mapEndX, mapEndY, miScreenToMap);
       edtStartPosLong.Text := formatDM_longitude(mapStartX);
       edtStartPosLat.Text := formatDM_latitude(mapStartY);
       edtEndPosLong.Text := formatDM_longitude(mapEndX);
       edtEndPosLat.Text := formatDM_latitude(mapEndY);

       //get grid cursor position
       yCursorPoint := mapStartY;
       xCursorPoint := mapStartX;
       yCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Lat;
       xCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Long;
       diffY := abs(yCursorPoint - yCenter);
       diffX := abs(xCursorPoint - xCenter);
       diffYnm := diffY * 60;  diffXnm := diffX * 60;

       if yCursorPoint < yCenter then
         addStringY := 'S'
       else
         addStringY := 'N';
       if xCursorPoint < xCenter then
         addStringX := 'W'
       else
         addStringX := 'E';

       gridLatt := FormatFloat('0.00', diffYnm);
       gridLong := FormatFloat('0.00', diffXnm);
       edtStartGridLat.Text := gridLatt + ' nm ' + addStringY;
       edtStartGridLong.Text := gridLong + ' nm ' + addStringX;
       edtEndGridLat.Text := gridLatt + ' nm ' + addStringY;
       edtEndGridLong.Text := gridLong + ' nm ' + addStringX;
       map1.repaint;
  end;

  if drawRect then
  begin
       startX := X;
       startY := Y;
       endX := X;
       endY := Y;

       sX := startX; sY := startY;
       eX := endX; eY := endY;
       Map1.ConvertCoord(sX, sY, mapStartX, mapStartY, miScreenToMap);
       Map1.ConvertCoord(eX, eY, mapEndX, mapEndY, miScreenToMap);
       edtRectStartPosLong.Text := formatDM_longitude(mapStartX);
       edtRectStartPosLat.Text := formatDM_latitude(mapStartY);
       edtRectEndPosLong.Text := formatDM_longitude(mapEndX);
       edtRectEndPosLat.Text := formatDM_latitude(mapEndY);

       //get grid cursor position
       yCursorPoint := mapStartY;
       xCursorPoint := mapStartX;
       yCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Lat;
       xCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Long;
       diffY := abs(yCursorPoint - yCenter);
       diffX := abs(xCursorPoint - xCenter);
       diffYnm := diffY * 60;  diffXnm := diffX * 60;

       if yCursorPoint < yCenter then
         addStringY := 'S'
       else
         addStringY := 'N';
       if xCursorPoint < xCenter then
         addStringX := 'W'
       else
         addStringX := 'E';

       gridLatt := FormatFloat('0.00', diffYnm);
       gridLong := FormatFloat('0.00', diffXnm);
       edtRectStartGridLat.Text := gridLatt + ' nm ' + addStringY;
       edtRectStartGridLong.Text := gridLong + ' nm ' + addStringX;
       edtRectEndGridLat.Text := gridLatt + ' nm ' + addStringY;
       edtRectEndGridLong.Text := gridLong + ' nm ' + addStringX;

       map1.repaint;
  end;

  if drawCircle then
  begin
       startX := X;
       startY := Y;
       endX := X;
       endY := Y;
       Map1.Repaint;
  end;

  if drawEllipse then
  begin
       startX := X;
       startY := Y;
       endX := X;
       endY := Y;
       {if (startX = 0) AND (startY = 0) then
           begin
               startX := X;
               startY := Y;
           end;

       if (startX <> 0) AND (startY <> 0) then
           begin
               endX := X;
               endY := Y;
           end; }
      Map1.Repaint;
  end;

  if drawTextEdit then
  begin
      startX := X; startY := Y;
      txtX := startX; txtY := startY;

      Map1.ConvertCoord(txtX, txtY, textX, textY, miScreenToMap);
      edtTextPosLong.Text := formatDM_longitude(textX);
      edtTextPosLAt.Text := formatDM_latitude(textY);

      //get grid cursor position
      yCursorPoint := textY;
      xCursorPoint := textX;
      yCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Lat;
      xCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Long;
      diffY := abs(yCursorPoint - yCenter);
      diffX := abs(xCursorPoint - xCenter);
      diffYnm := diffY * 60;  diffXnm := diffX * 60;

      if yCursorPoint < yCenter then
        addStringY := 'S'
      else
        addStringY := 'N';
      if xCursorPoint < xCenter then
        addStringX := 'W'
      else
        addStringX := 'E';

      gridLatt := FormatFloat('0.00', diffYnm);
      gridLong := FormatFloat('0.00', diffXnm);
      edtTextGridLat.Text := gridLatt + ' nm ' + addStringY;
      edtTextGridLong.Text := gridLong + ' nm ' + addStringX;
      map1.repaint;
  end;

  if stateDrawing then
  begin
    pItem := CreateOleObject('MapX.Point.4');
    pItem.Set(xx, yy);
    if DrawTool = LINE then
    begin
       //set value line
       with lineTemp do
       begin
          startPointX := xx;
          startPointY := yy;
          endPointX := xx;
          endPointY := yy;
          //map1.Repaint;
       end;
    end
    else if DrawTool = ARC then
    begin

    end
    else if DrawTool = GRID then
    begin

    end
    else if DrawTool = RECTANGLE then
    begin
      with rectTemp do
       begin
          startPointX := xx;
          startPointY := yy;
          endPointX := xx;
          endPointY := yy;
       end;
    end
    else if DrawTool = POLYGON then
    begin

    end
    else if DrawTool = CIRCLE then
    begin

    end
    else if DrawTool = ELLIPSE then
    begin

    end
    else if DrawTool = SECTOR then
    begin

    end
    else if DrawTool = ALPHA then
    begin
       with textTemp do
       begin
         color := colorChoose.ForegroundColor;
         startPointX := xx;
         startPointY := yy;
         text := 'none';
         size := 12;
       end;
    end;
  end;

  if stateMove then
  begin

  end;

  if stateDelete then
  begin

  end;

  if isCapturingScreen then
  with fscrCapture do
  begin
   PDown.X := X;
   PDown.Y := Y;
   PActually.X := X;
   PActually.Y := Y;
   MouseIsDown := TRUE;
   Canvas.DrawFocusRect(RECT(x, y, x, y));
  end;
end;

procedure TOverlayEditorForm.Map1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  yCursorPoint, xCursorPoint, yCenter, xCenter, diffX, diffY: double;
  diffXnm, diffYnm: double;
  gridLatt, gridLong, addStringX, addStringY: string;
      mapStartX, mapStartY, mapEndX, mapEndY : double;
          sX, sY, eX, eY : single;
begin
  FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);

  if drawLine then
  begin
     if pressDown then
     begin
         endX := X;
         endY := Y;

         eX := endX; eY := endY;
         Map1.ConvertCoord(eX, eY, mapEndX, mapEndY, miScreenToMap);
         edtEndPosLong.Text := formatDM_longitude(mapEndX);
         edtEndPosLat.Text := formatDM_latitude(mapEndY);

         //get grid cursor position
         yCursorPoint := mapEndY;
         xCursorPoint := mapEndX;
         yCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Lat;
         xCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Long;
         diffY := abs(yCursorPoint - yCenter);
         diffX := abs(xCursorPoint - xCenter);
         diffYnm := diffY * 60;  diffXnm := diffX * 60;

         if yCursorPoint < yCenter then
           addStringY := 'S'
         else
           addStringY := 'N';
         if xCursorPoint < xCenter then
           addStringX := 'W'
         else
           addStringX := 'E';

         gridLatt := FormatFloat('0.00', diffYnm);
         gridLong := FormatFloat('0.00', diffXnm);
         edtEndGridLat.Text := gridLatt + ' nm ' + addStringY;
         edtEndGridLong.Text := gridLong + ' nm ' + addStringX;

         Map1.Repaint;
     end;
  end;

  if drawRect then
  begin
     if pressDown then
     begin
         endX := X;
         endY := Y;
         //Map1.Repaint;

         eX := endX; eY := endY;
         Map1.ConvertCoord(eX, eY, mapEndX, mapEndY, miScreenToMap);
         edtRectEndPosLong.Text := formatDM_longitude(mapEndX);
         edtRectEndPosLat.Text := formatDM_latitude(mapEndY);

         //get grid cursor position
         yCursorPoint := mapEndY;
         xCursorPoint := mapEndX;
         yCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Lat;
         xCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Long;
         diffY := abs(yCursorPoint - yCenter);
         diffX := abs(xCursorPoint - xCenter);
         diffYnm := diffY * 60;  diffXnm := diffX * 60;

         if yCursorPoint < yCenter then
           addStringY := 'S'
         else
           addStringY := 'N';
         if xCursorPoint < xCenter then
           addStringX := 'W'
         else
           addStringX := 'E';

         gridLatt := FormatFloat('0.00', diffYnm);
         gridLong := FormatFloat('0.00', diffXnm);
         edtRectEndGridLat.Text := gridLatt + ' nm ' + addStringY;
         edtRectEndGridLong.Text := gridLong + ' nm ' + addStringX;
     end;
  end;

  if drawCircle then
  begin
    if pressDown then
    begin
        //get high and width
        H := abs(startY - Y);
        W := abs(startX - X);
        if H < W then
        begin
           endX := startX + H;
           endY := Y;
        end
        else
        begin
           endX := X;
           endY := startY + W;
        end;
        Map1.Repaint;
    end;
  end;

  if drawEllipse then
  begin
     if pressDown then
     begin
         endX := X;
         endY := Y;
         Map1.Repaint;
     end;
  end;

  if stateDrawing then
  begin
    if DrawTool = LINE then
    begin
       with lineTemp do
       begin
         endPointX := xx;
         endPointY := yy;
       end;
    end
    else if DrawTool = ARC then
    begin

    end
    else if DrawTool = GRID then
    begin

    end
    else if DrawTool = RECTANGLE then
    begin
       with rectTemp do
       begin
         endPointX := xx;
         endPointY := yy;
       end;
    end
    else if DrawTool = POLYGON then
    begin

    end
    else if DrawTool = CIRCLE then
    begin

    end
    else if DrawTool = ELLIPSE then
    begin

    end
    else if DrawTool = SECTOR then
    begin

    end
    else if DrawTool = ALPHA then
    begin

    end;
  end;

  if stateMove then
  begin

  end;

  if stateDelete then
  begin

  end;

  if isCapturingScreen then begin
    //UpdateGameCenter(X,Y);
    if MouseIsDown then  begin
      with fscrCapture do begin

      //UpdateGameCenter(X,Y);
      //mapLandMass.Repaint;

      //Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, PActually.x,PActually.y));
      PActually.X := x;
      PActually.Y := y;
      //Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, x, y));
      end;
    end;
    Map1.Repaint;
  end;

  // all state
  lblBearing.Caption := FormatFloat('0.00',
  CalcBearing(Map1.CenterX, Map1.CenterY, xx, yy));
  lblDistance.Caption := FormatFloat('0.00',
  FCoordPlatformConv.Distance_nmi(Map1.CenterX, Map1.CenterY, xx, yy));

  /// ///////////////////////////////////////////////////get grid cursor position
  yCursorPoint := yy;
  xCursorPoint := xx;

  yCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Lat;
  xCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Long;

  diffY := abs(yCursorPoint - yCenter);
  diffX := abs(xCursorPoint - xCenter);

  diffYnm := diffY * 60;
  diffXnm := diffX * 60;

  if yCursorPoint < yCenter then
    addStringY := 'S'
  else
    addStringY := 'N';

  if xCursorPoint < xCenter then
    addStringX := 'W'
  else
    addStringX := 'E';

  lbSlPosition.Caption := formatDM_latitude(yy);
  lblWPosition.Caption := formatDM_longitude(xx);

  gridLatt := FormatFloat('0.00', diffYnm);
  gridLong := FormatFloat('0.00', diffXnm);
  lblnmSGrid.Caption := gridLatt + ' nm ' + addStringY;
  lblnmWGrid.Caption := gridLong + ' nm ' + addStringX;
end;

procedure TOverlayEditorForm.Map1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  MyFont : TFont;
  yCursorPoint, xCursorPoint, yCenter, xCenter, diffX, diffY: double;
  diffXnm, diffYnm: double;
  gridLatt, gridLong, addStringX, addStringY: string;
  mapStartX, mapStartY, mapEndX, mapEndY : double;
  sX, sY, eX, eY : single;
begin

  if drawLine then
  begin
     endX := X;
     endY := Y;

     eX := endX; eY := endY;
     Map1.ConvertCoord(eX, eY, mapEndX, mapEndY, miScreenToMap);
     edtEndPosLong.Text := formatDM_longitude(mapEndX);
     edtEndPosLat.Text := formatDM_latitude(mapEndY);

     //get grid cursor position
     yCursorPoint := mapEndY;
     xCursorPoint := mapEndX;
     yCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Lat;
     xCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Long;
     diffY := abs(yCursorPoint - yCenter);
     diffX := abs(xCursorPoint - xCenter);
     diffYnm := diffY * 60;  diffXnm := diffX * 60;

     if yCursorPoint < yCenter then
        addStringY := 'S'
     else
        addStringY := 'N';
     if xCursorPoint < xCenter then
        addStringX := 'W'
     else
        addStringX := 'E';

     gridLatt := FormatFloat('0.00', diffYnm);
     gridLong := FormatFloat('0.00', diffXnm);
     edtEndGridLat.Text := gridLatt + ' nm ' + addStringY;
     edtEndGridLong.Text := gridLong + ' nm ' + addStringX;

     Map1.Repaint;
     pressDown := false;
  end;

  if drawRect then
  begin
     endX := X;
     endY := Y;

     eX := endX; eY := endY;
     Map1.ConvertCoord(eX, eY, mapEndX, mapEndY, miScreenToMap);
     edtRectEndPosLong.Text := formatDM_longitude(mapEndX);
     edtRectEndPosLat.Text := formatDM_latitude(mapEndY);

     //get grid cursor position
     yCursorPoint := mapEndY;
     xCursorPoint := mapEndX;
     yCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Lat;
     xCenter := fOverlay.game_area_def.FGameArea.Game_Centre_Long;
     diffY := abs(yCursorPoint - yCenter);
     diffX := abs(xCursorPoint - xCenter);
     diffYnm := diffY * 60;  diffXnm := diffX * 60;

     if yCursorPoint < yCenter then
        addStringY := 'S'
     else
        addStringY := 'N';
     if xCursorPoint < xCenter then
        addStringX := 'W'
     else
        addStringX := 'E';

     gridLatt := FormatFloat('0.00', diffYnm);
     gridLong := FormatFloat('0.00', diffXnm);
     edtRectEndGridLat.Text := gridLatt + ' nm ' + addStringY;
     edtRectEndGridLong.Text := gridLong + ' nm ' + addStringX;

     Map1.Repaint;
     pressDown := false;
  end;

  if drawCircle then
  begin
      //get high and width
      H := startY - Y;
      W := X - startX;
      if H < W then
      begin
         endX := startX + H;
         endY := Y;
      end
      else
      begin
         endX := X;
         endY := startY + W;
      end;
      Map1.Repaint;
      pressDown := false;
  end;

  if drawEllipse then
  begin
     endX := X;
     endY := Y;
     Map1.Repaint;
     pressDown := false;
  end;

  if stateDrawing then
  begin
    if DrawTool = LINE then
    begin
       with lineTemp do
       begin
         drawing;
         listLine.Add(lineTemp);
       end;
    end
    else if DrawTool = ARC then
    begin

    end
    else if DrawTool = GRID then
    begin

    end
    else if DrawTool = RECTANGLE then
    begin
       with rectTemp do
       begin
         drawing;
         listRectangle.Add(lineTemp);
       end;
    end
    else if DrawTool = POLYGON then
    begin

    end
    else if DrawTool = CIRCLE then
    begin

    end
    else if DrawTool = ELLIPSE then
    begin

    end
    else if DrawTool = SECTOR then
    begin

    end
    else if DrawTool = ALPHA then
    begin
       with textTemp do
       begin
          drawing;
          listText.Add(textTemp);
       end;
    end;
  end;

  if stateMove then
  begin

  end;

  if stateDelete then
  begin

  end;

  if isCapturingScreen then
  begin

  with fscrCapture do
  begin

   PActually.X := x;
   PActually.Y := Y;
   MouseIsDown := TRUE;

   TmpBmp := TBitmap.Create;

   with TmpBmp do
   begin
     Width := Round(abs(PActually.x - PDown.x));
     Height := Round(abs(PActually.y - PDown.y));
     BitBlt(TmpBmp.Canvas.Handle, 0, 0, Width, Height, fScrCapture.Image1.Canvas.Handle, Map1.Left+ PDown.x,
     PDown.y, SRCCOPY);
     fCaptureRes.imgCaptureResult.AutoSize := false;
     fCaptureRes.imgCaptureResult.Picture.Bitmap.Assign(TmpBmp);
     fCaptureRes.Width := Width+10;
     fCaptureRes.Height := Height+fCaptureRes.panel3.height+10;
     fCaptureRes.ShowModal;

     if  fCaptureRes.recapture then  fCaptureRes.recapture:= false
     else isCapturingScreen := false;
     MouseIsDown :=false;
   end;

  end;

 end;
 Map1.Refresh;
 Map1.Repaint;
end;

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure TOverlayEditorForm.loadENC(name: String);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if Map1 = nil then
    Exit;
  InitOleVariant(z);
  Map1.Layers.RemoveAll;

  Map1.Geoset := name;

  if name <> '' then
  begin
    for i := 1 to Map1.Layers.Count do
    begin
      Map1.Layers.Item(i).Selectable := false;
      Map1.Layers.Item(i).Editable := false;
      // FMap.Layers.Item(i).AutoLabel := True;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := Map1.Layers.Add(mInfo, 1);

    Map1.Layers.AnimationLayer := FLyrDraw;
    Map1.MapUnit := miUnitNauticalMile;
  end;
  Map1.BackColor := RGB(192, 224, 255);
end;

procedure TOverlayEditorForm.setCBScale;
var
  widthNM: Integer;
  limitWidth: Array [0 .. 15] of double;
  arrayTemp: Array [0 .. 30] of double;
  arrayStringTemp: Array [0 .. 30] of String;
  resultTemp: Array [0 .. 30] of String;
  a, b: Integer;
  unusedVt: OleVariant;
  MyFont: TFont;
begin
  widthNM := floor(fOverlay.game_area_def.FGameArea.Game_X_Dimension);
  // isi combo box
  cbSetScale.Clear;
  // widthNM := strtoint(ExerciseAreaForm.edtMaximum.Text);

  limitWidth[0] := 0.125;
  limitWidth[1] := 0.25;
  limitWidth[2] := 0.5;
  limitWidth[3] := 1;
  limitWidth[4] := 2;
  limitWidth[5] := 4;
  limitWidth[6] := 8;
  limitWidth[7] := 16;
  limitWidth[8] := 32;
  limitWidth[9] := 64;
  limitWidth[10] := 128;
  limitWidth[11] := 256;
  limitWidth[12] := 512;
  limitWidth[13] := 1024;
  limitWidth[14] := 2048;
  limitWidth[15] := 2500;

  a := 0;
  while limitWidth[a] < widthNM do
  begin
    arrayTemp[a] := limitWidth[a];
    a := a + 1;
  end;
  arrayTemp[a] := widthNM;

  for b := 0 to a do
    arrayStringTemp[b] := floattostr(arrayTemp[b]);

  for b := 0 to a do
  begin
    resultTemp[b] := arrayStringTemp[b];
    cbSetScale.Items.Add(resultTemp[b]);
  end;
end;

procedure TOverlayEditorForm.toolbtnDecreaseScaleClick(Sender: TObject);
begin
  if cbSetScale.ItemIndex > 0 then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex - 1;
    toolbtnIncreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if cbSetScale.ItemIndex = 0 then
    toolbtnDecreaseScale.Enabled := false
  else
    toolbtnDecreaseScale.Enabled := true;
end;

procedure TOverlayEditorForm.toolbtnIncreaseScaleClick(Sender: TObject);
begin
  if (cbSetScale.ItemIndex <= 500) then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex + 1;
    toolbtnDecreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if (cbSetScale.ItemIndex = 0) then // sampai batas akhir  //10
    toolbtnIncreaseScale.Enabled := true // false
  else
    toolbtnIncreaseScale.Enabled := true;
end;

procedure TOverlayEditorForm.ToolButton13Click(Sender: TObject);
begin
  Map1.CurrentTool := miZoomInTool;
  Map1.MousePointer := miZoomInCursor;
end;

procedure TOverlayEditorForm.ToolButton14Click(Sender: TObject);
begin
  statePan := true;
  stateDrawing := false;
  stateDelete := false;
  stateSelect := false;
  Map1.CurrentTool := miArrowTool;
  Map1.MousePointer := miCenterCursor;
end;

procedure TOverlayEditorForm.ToolButton1Click(Sender: TObject);
begin
  case DrawTool of
      LINE : Map1.CurrentTool := miSelectTool;
      ARC : Map1.CurrentTool := miSelectTool;
      GRID : Map1.CurrentTool := miSelectTool;
      RECTANGLE : Map1.CurrentTool := miRectSelectTool;
      POLYGON : Map1.CurrentTool := miPolygonSelectTool;
      CIRCLE : Map1.CurrentTool := miRadiusSelectTool;
      ELLIPSE : Map1.CurrentTool := miRadiusSelectTool;
      SECTOR : Map1.CurrentTool := miRadiusSelectTool;
      ALPHA : Map1.CurrentTool := miSelectTool;
      else
      Map1.CurrentTool := miArrowTool;
  end;
  Map1.MousePointer := miCrossCursor;
  stateMove := true;
  stateDrawing := false;
  stateDelete := false;

  {added by me}
  drawLine := false;
  drawTextEdit := false;
end;

procedure TOverlayEditorForm.ToolButton2Click(Sender: TObject);
begin
      //AddOverlay := true;
      Map1.CurrentTool := miArrowTool;
      Map1.MousePointer := miCrossCursor;
      stateDrawing := true;
      stateMove := false;
      stateDelete := false;

      startX := 0;
      startY := 0;
      endX := 0;
      endY := 0;
end;

procedure TOverlayEditorForm.ToolButton4Click(Sender: TObject);
begin
  with fOverlay.game_area_def.FGameArea do
  begin
    Map1.CenterX := Game_Centre_Long;
    Map1.CenterY := Game_Centre_Lat;
  end;
end;

procedure TOverlayEditorForm.ToolButton6Click(Sender: TObject);
begin
  stateDrawing := false;
  stateMove := false;
  stateDelete := true;
end;

procedure TOverlayEditorForm.bntDraw1Click(Sender: TObject);
begin
  drawLine := true;
  drawRect := false;
  drawEllipse := false;
  drawTextEdit := false;

  DrawTool := LINE;
  Map1.CurrentTool := miSelectTool;
  gbLine.BringToFront;

  with lineTemp do
  begin
        FMap := Map1;
        featurelayer := fFtrFactory;
        lyrMyLayer := FLyrDraw;
  end;
end;

procedure TOverlayEditorForm.btnApplyClick(Sender: TObject);
begin
    //Close;
    tempText := edtText.Text;
    Map1.Repaint;
end;

procedure TOverlayEditorForm.btnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TOverlayEditorForm.btnDraw2Click(Sender: TObject);
begin
  DrawTool := ARC;
  Map1.CurrentTool := miRadiusSelectTool;
  gbArc.BringToFront;
  with arcTemp do
  begin
  FMap := Map1;
  featurelayer := fFtrFactory;
  lyrMyLayer := FLyrDraw;
  end;
end;

procedure TOverlayEditorForm.btnDraw3Click(Sender: TObject);
begin
  DrawTool := GRID;
  Map1.CurrentTool := miRectSelectTool;
  gbGrid.BringToFront;
  with gridTemp do
  begin
  FMap := Map1;
  featurelayer := fFtrFactory;
  lyrMyLayer := FLyrDraw;
  end;
end;

procedure TOverlayEditorForm.btnDraw4Click(Sender: TObject);
begin
  drawRect := true;
  drawLine := false;
  drawEllipse := false;
  drawTextEdit := false;

  DrawTool := RECTANGLE;
  Map1.CurrentTool := miRectSelectTool;
  gbRectangle.BringToFront;
  with rectTemp do
  begin
  FMap := Map1;
  featurelayer := fFtrFactory;
  lyrMyLayer := FLyrDraw;
  end;
end;

procedure TOverlayEditorForm.btnDraw5Click(Sender: TObject);
begin
  DrawTool := POLYGON;
  Map1.CurrentTool := miSelectTool;
  gbPolygon.BringToFront;
  with polygonTemp do
  begin
  FMap := Map1;
  featurelayer := fFtrFactory;
  lyrMyLayer := FLyrDraw;
  end;
end;

procedure TOverlayEditorForm.btnDraw6Click(Sender: TObject);
begin
  drawCircle := true;

  DrawTool := CIRCLE;
  Map1.CurrentTool := miRadiusSelectTool;
  gbCircle.BringToFront;
  with circleTemp do
  begin
  FMap := Map1;
  featurelayer := fFtrFactory;
  lyrMyLayer := FLyrDraw;
  end;
end;

procedure TOverlayEditorForm.btnDraw7Click(Sender: TObject);
begin
  drawEllipse := true;
  drawLine := false;
  drawRect := false;
  drawTextEdit := false;

  DrawTool := ELLIPSE;
  Map1.CurrentTool := miRadiusSelectTool;
  gbEllipse.BringToFront;
  with ellipseTemp do
  begin
      FMap := Map1;
      featurelayer := fFtrFactory;
      lyrMyLayer := FLyrDraw;
  end;
end;

procedure TOverlayEditorForm.btnDraw8Click(Sender: TObject);
begin
  DrawTool := SECTOR;
  Map1.CurrentTool := miRadiusSelectTool;
  gbSector.BringToFront;
  with sectorTemp do
  begin
  FMap := Map1;
  featurelayer := fFtrFactory;
  lyrMyLayer := FLyrDraw;
  end;
end;

procedure TOverlayEditorForm.btnDrawTextClick(Sender: TObject);
begin
  drawTextEdit := true;
  tempText := 'Some Text';
  drawLine := false;
  drawRect := false;
  drawEllipse := false;

  DrawTool := ALPHA;
  Map1.CurrentTool := miSelectTool;
  gbText.BringToFront;
  with textTemp do
  begin
      FMap := Map1;
      featurelayer := fFtrFactory;
      lyrMyLayer := FLyrDraw;
  end;
end;

procedure TOverlayEditorForm.btnOKClick(Sender: TObject);
begin
SaveToGeoset;
Close;
end;

procedure TOverlayEditorForm.btnScreenCaptureClick(Sender: TObject);
begin
  b := TBitmap.Create;
  ScreenShot(b) ;
  isCapturingScreen := true;
  fScrCapture.Image1.Picture.Assign(b);
end;

procedure TOverlayEditorForm.btnTextSize1Click(Sender: TObject);
begin
  bigMidSmall := 1;
  sizeText := 27;
end;

procedure TOverlayEditorForm.btnTextSize2Click(Sender: TObject);
begin
  bigMidSmall := 2;
  sizeText := 17;
end;

procedure TOverlayEditorForm.btnTextSize3Click(Sender: TObject);
begin
  bigMidSmall := 3;
  sizeText := 7;
end;

procedure TOverlayEditorForm.cbSetScaleChange(Sender: TObject);
var
  z: double;
  s: string;
begin
  Map1.OnMapViewChanged := nil;
  if cbSetScale.ItemIndex < 0 then
    Exit;

  // if (cbSetScale.ItemIndex<=5) then
  if (cbSetScale.ItemIndex <= 500) then
  begin
    s := cbSetScale.Items[cbSetScale.ItemIndex];
    try
      z := StrToFloat(s);
      Map1.ZoomTo(z, Map1.CenterX, Map1.CenterY);
    finally

    end;
  end
  else
    cbSetScale.ItemIndex := cbSetScale.ItemIndex - 1;
  Map1.OnMapViewChanged := Map1MapViewChanged;
end;

procedure TOverlayEditorForm.colorChooseChange(Sender: TObject);
begin
      pnlColorSelect.Color := colorChoose.ForegroundColor;
      Map1.DefaultStyle.LineColor := colorChoose.ForegroundColor;
      Map1.DefaultStyle.RegionColor := TransparentColorValue;
      Map1.DefaultStyle.RegionBorderColor := colorChoose.ForegroundColor;

      {colorPanel.Color := colorChoose.BackgroundColor;
      Map1.DefaultStyle.LineColor := colorChoose.BackgroundColor;
      Map1.DefaultStyle.RegionColor := TransparentColorValue;
      Map1.DefaultStyle.RegionBorderColor := colorChoose.BackgroundColor;  }
end;

procedure TOverlayEditorForm.createGeoset;
var
  aGeoset: string;
  getNameArea: String;
begin
  // getNameArea := OverlayGameEnviroDef.FGameArea.Game_Area_Identifier;
  getNameArea := fOverlay.edtArea.Text;
  // aGeoset := ExtractFilePath(Application.ExeName) + 'game_area\part1.gst';
  //aGeoset := ExtractFilePath(Application.ExeName) + 'game_area\' + getNameArea + '\' + getNameArea + '.gst';
  aGeoset := 'M:\game_area\' + getNameArea + '\' + getNameArea + '.gst';
  LoadMap(aGeoset);
end;

procedure TOverlayEditorForm.LoadMap(aGeoset: String);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
  unusedVt: OleVariant;
  MyFont: TFont;
begin
  if Map1 = nil then
    Exit;
  InitOleVariant(z);
  Map1.Layers.RemoveAll;

  Map1.Geoset := aGeoset;

  if aGeoset <> '' then
  begin
    for i := 1 to Map1.Layers.Count do
    begin
      Map1.Layers.Item(i).Selectable := false;
      Map1.Layers.Item(i).Editable := false;
      // FMap.Layers.Item(i).AutoLabel := True;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := Map1.Layers.Add(mInfo, 1);

    Map1.Layers.AnimationLayer := FLyrDraw;
    Map1.MapUnit := miUnitNauticalMile;
  end;
  // FMap.BackColor := RGB(192, 224, 255);
  Map1.BackColor := clSkyBlue;

  // ini user layernya aldy rec.
     TVarData(unusedVt).vType := varError;
     TVarData(unusedVt).vError := DISP_E_PARAMNOTFOUND;
     // Add car layer and make it an animation layer
     FLyrDraw := Map1.Layers.CreateLayer('Features', unusedVt, 1, unusedVt, unusedVt);
     Map1.Layers.AnimationLayer := Map1.Layers.Item(FLyrDraw.name);

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'Capture');
    sCaptureLayer :=  Map1.Layers.Add(mInfo, 1);
    Map1.Layers.AnimationLayer := sCaptureLayer;

     MyFont := TFont.Create;
     OleFontToFont(Map1.DefaultStyle.SymbolFont, MyFont);
     MyFont.Size := 12;
     MyFont.Name := 'MapSym-En-Air';
     MyFont.Color := clRed;

     Map1.DefaultStyle.SymbolFontColor := clYellow;

     Map1.DefaultStyle.LineColor := clWhite;
     Map1.DefaultStyle.LineWidth := 1;
     Map1.DefaultStyle.SymbolCharacter := 80;

     {}
     pointCollection := CoPoints.Create;
     {}
end;

procedure TOverlayEditorForm.ScreenShot(DestBitmap : TBitmap) ;
 var
   DC : HDC;
 begin
   DC := GetDC (GetDesktopWindow) ;
   try
    DestBitmap.Width := GetDeviceCaps (DC, HORZRES) ;
    DestBitmap.Height := GetDeviceCaps (DC, VERTRES) ;
    BitBlt(DestBitmap.Canvas.Handle, 0, 0, DestBitmap.Width, DestBitmap.Height, DC, 0, 0, SRCCOPY) ;
   finally
    ReleaseDC (GetDesktopWindow, DC) ;
   end;
 end;

 procedure TOverlayEditorForm.SaveToGeoset;
 var
  fname : string;
begin
  //save the map overlay
  with fOverlay.game_area_def.FGameArea do
  begin
  Map1.ZoomTo(Game_X_Dimension, Game_Centre_Long, Game_Centre_Lat);
  end;
  fname := ExtractFilePath(Application.ExeName) + 'map\' + fOverlay.overlay_def.FData.Overlay_Filename + '_overlay' + '.gst';
  Map1.SaveMapAsGeoset(fOverlay.overlay_def.FData.Overlay_Filename + '_overlay', fname );
 end;

end.
