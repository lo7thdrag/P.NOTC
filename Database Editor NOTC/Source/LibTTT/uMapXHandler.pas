unit uMapXHandler;

interface

uses
  MapXLib_TLB, Windows, Classes, Graphics, Controls,
  uCoordConvertor, uSteppers, tttData ;

type

//==============================================================================
  TNotifyDraw = procedure (aCanvas: TCanvas) of object;
  TMapMouseMove = procedure (sender: TObject; Shift: TShiftState; X, Y: Integer) of object;
  TMapMouseDown = procedure (sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer) of object;
  TMapMouseUp = procedure (sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer) of object;
//==============================================================================
  TSimMap = class
  private

    FLyrDraw    : CMapXLayer;
    FCanvas     : TCanvas;
    FDrawCycler : TCycler;

    FConverter  : TCoordConverter;

    FRectZoom : TRect;
    FMouseIsDown: boolean;

//    FDrawContainer: TDrawContainers;
    FOnDrawToCanvas: TNotifyDraw;

    FOnMapChange: TNotifyEvent;
    FOnAddWayoint: TEventAddWaypoint;
    FOnToolUsed: TEventToolMapUsed;
    FOnMapMouseMove: TMapMouseMove;
    FOnMapMouseDown: TMapMouseDown;
    FOnMapMouseUp: TMapMouseUp;

    procedure CreateMapTool;
    procedure SetMapComponent;
    procedure EventOnDrawCycler(sender: TObject);
    procedure SetOnAddWayoint(const Value: TEventAddWaypoint);
    procedure SetOnToolUsed(const Value: TEventToolMapUsed);
    procedure SetOnMapMouseMove(const Value: TMapMouseMove);
    procedure SetOnMapMouseDown(const Value: TMapMouseDown);
    procedure SetOnMapMouseUp(const Value: TMapMouseUp);

  public
    FMap        : TMap;


    constructor Create(aMap: TMap);
    destructor Destroy; override;

    procedure LoadMap(aGeoset: String);
    procedure applySetting(const MapZoom: integer;
      const mX, mY: double; const Colorbg : TColor);

    procedure DrawMap;

    procedure SetMapCenter(const x, y: double);
    procedure SetMapZoom(const z: double);

    procedure MapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer;
      const RectFull, RectInvalid: IDispatch);

    procedure MapToolUsed(ASender: TObject; ToolNum: Smallint;
      X1, Y1, X2, Y2, Distance: double; Shift, Ctrl: WordBool;
      var EnableDefault: WordBool);

    procedure MapMouseDown(sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure MapMouseMove(sender: TObject; Shift: TShiftState; X, Y: Integer);

    procedure MapMouseUp(sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure MapViewChanged(Sender: TObject);

  public
    property OnDrawToCanvas: TNotifyDraw
      read FOnDrawToCanvas write FOnDrawToCanvas;

    property OnMapChange: TNotifyEvent
      read FOnMapChange write FOnMapChange;

    property OnToolUsed : TEventToolMapUsed read FOnToolUsed write SetOnToolUsed;
    property OnAddWayoint : TEventAddWaypoint read FOnAddWayoint write SetOnAddWayoint;
    property OnMapMouseMove : TMapMouseMove read FOnMapMouseMove write SetOnMapMouseMove;
    property OnMapMouseDown : TMapMouseDown  read FOnMapMouseDown write SetOnMapMouseDown;
    property OnMapMouseUp   : TMapMouseUp  read FOnMapMouseUp write SetOnMapMouseUp;
  end;


var

  VSimMap: TSimMap;



implementation

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

{ TSimMapXHandler }

procedure TSimMap.applySetting(const MapZoom: integer; const mX, mY: double;
  const Colorbg: TColor);
begin
  FMap.ZoomTo(MapZoom, mX, mY);
  FMap.BackColor := Colorbg;

end;

constructor TSimMap.Create(aMap: TMap);
begin

  FCanvas         := TCanvas.Create;
  FConverter      := TCoordConverter.Create;
  FConverter.FMap := aMap;

  // Timer FInterval := 10;
  FDrawCycler := TCycler.Create;
  FDrawCycler.Count := 10;
  FDrawCycler.Index := 0;
  FDrawCycler.OnCycle := EventOnDrawCycler;
  FDrawCycler.Enabled := True;

  FMap := aMap;

  CreateMapTool;
  SetMapComponent;

end;

destructor TSimMap.Destroy;
begin
  inherited;
  FDrawCycler.OnCycle := nil;
  FDrawCycler.Free;

  FMap := nil;
  FCanvas.Free;
  FConverter.Free;

end;

procedure TSimMap.CreateMapTool;
begin
  FMap.CreateCustomTool(mtAddWaypoint, 0, miCrossCursor, miCrossCursor);
  FMap.CreateCustomTool(mtSelectObject, 0, miSelectRectPlusCursor);
  FMap.CreateCustomTool(mtDeployPosition, 0, miCrossCursor);

  {Prince}
  FMap.CreateCustomTool(mtEditOverlay, 0, miCrossCursor);
  FMap.CreateCustomTool(mtAddOverlay, 0, miCrossCursor);
  FMap.CreateCustomTool(mtPan, 0, miCenterCursor);
  FMap.CreateCustomTool(mtNormalCursor, 0, miDefaultCursor);

  {fajar untuk plotting}
  FMap.CreateCustomTool(mtAddPlotting, 0, miCrossCursor);
  FMap.CreateCustomTool(mtEditPlotting, 0, miCrossCursor);
end;

procedure TSimMap.DrawMap;
begin
  FDrawCycler.Run;
end;

procedure TSimMap.EventOnDrawCycler(sender: TObject);
begin
   FMap.Repaint;
end;

procedure TSimMap.LoadMap(aGeoset: String);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if FMap = nil then
    Exit;
  InitOleVariant(z);
  FMap.Layers.RemoveAll;

  FMap.Geoset := aGeoset;

  if aGeoset <> '' then
  begin
    for i := 1 to FMap.Layers.Count do
    begin
      FMap.Layers.Item(i).Selectable := false;
      FMap.Layers.Item(i).Editable  := False;
//      FMap.Layers.Item(i).AutoLabel := True;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := FMap.Layers.Add(mInfo, 1);

    FMap.Layers.AnimationLayer := FLyrDraw;
    FMap.MapUnit := miUnitNauticalMile;
  end;
  FMap.BackColor := RGB(192, 224, 255);
  FConverter.FMap := FMap;
end;


procedure TSimMap.MapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
  hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
begin
  if not Assigned(FCanvas) then
    Exit;

  FCanvas.Handle := hOutputDC;

  if Assigned(FOnDrawToCanvas) then
    FOnDrawToCanvas(FCanvas);

  if FMouseIsDown then begin
    if FMap.CurrentTool = miZoomInTool then begin
       FCanvas.Brush.Color := clWhite;
       FCanvas.FrameRect(FRectZoom);
    end;
  end;

end;

procedure TSimMap.MapMouseDown(sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  mx, my: double;
begin
  FConverter.ConvertToMap(X, Y, mx, my);
  if Assigned(FOnMapMouseDown) then
    FOnMapMouseDown(sender,Button,shift,X,Y);

  FMouseIsDown := Button = mbLeft;
  if FMouseIsDown then begin
    if FMap.CurrentTool = miZoomInTool then begin
     FRectZoom.Left   := x;
     FRectZoom.Top    := y;
     FRectZoom.Right  := x;
     FRectZoom.Bottom := y;

    end;
    FMap.Repaint;

  end;

end;

procedure TSimMap.MapMouseMove(sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  mx, my: double;
begin
  FConverter.ConvertToMap(X, Y, mx, my);
  if Assigned(FOnMapMouseMove) then
    FOnMapMouseMove(sender,shift,X,Y);

  if FMouseIsDown then begin
    if FMap.CurrentTool = miZoomInTool then begin
     FRectZoom.Right  := x;
     FRectZoom.Bottom := y;
    end;
    FMap.Repaint;
  end;
end;

procedure TSimMap.MapMouseUp(sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(FOnMapMouseUp) then
    FOnMapMouseUp(sender,Button,shift,X,Y);

  if FMouseIsDown then
    FMap.Repaint;
  FMouseIsDown := false;

end;

procedure TSimMap.MapToolUsed(ASender: TObject; ToolNum: Smallint;
  X1, Y1, X2, Y2, Distance: double; Shift, Ctrl: WordBool;
  var EnableDefault: WordBool);
begin
  if Assigned(FOnToolUsed) then
    FOnToolUsed(ASender, ToolNum, X1, Y1, X2, Y2,
            Distance, Shift, Ctrl, EnableDefault);

  case ToolNum of
    mtAddWaypoint : if Assigned(FOnAddWayoint) then FOnAddWayoint(X1,Y1);
  end;
end;

procedure TSimMap.MapViewChanged(Sender: TObject);
begin
  if Assigned(FOnMapChange) then
    FOnMapChange(FMap)


end;


procedure TSimMap.SetMapComponent;
begin
  FMap.OnDrawUserLayer  := MapDrawUserLayer;
  FMap.OnMouseMove      := MapMouseMove;
  FMap.OnMouseUp        := MapMouseUp;
  FMap.OnMouseDown      := MapMouseDown;
  FMap.OnToolUsed       := MapToolUsed;
  FMap.OnMapViewChanged := MapViewChanged;

end;

procedure TSimMap.SetOnAddWayoint(const Value: TEventAddWaypoint);
begin
  FOnAddWayoint := Value;
end;

procedure TSimMap.SetOnMapMouseDown(const Value: TMapMouseDown);
begin
  FOnMapMouseDown := Value;
end;

procedure TSimMap.SetOnMapMouseMove(const Value: TMapMouseMove);
begin
  FOnMapMouseMove := Value;
end;

procedure TSimMap.SetOnMapMouseUp(const Value: TMapMouseUp);
begin
  FOnMapMouseUp := Value;
end;

procedure TSimMap.SetOnToolUsed(const Value: TEventToolMapUsed);
begin
  FOnToolUsed := Value;
end;

procedure TSimMap.SetMapCenter(const x, y: double);
begin
  FMap.ZoomTo(FMap.Zoom, X, Y);
end;

procedure TSimMap.SetMapZoom(const z: double);
begin
  FMap.ZoomTo(Z, FMap.CenterX, FMap.CenterY);
end;

end.
