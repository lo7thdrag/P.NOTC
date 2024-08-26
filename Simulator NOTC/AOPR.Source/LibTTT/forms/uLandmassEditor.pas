unit uLandmassEditor;

interface

uses
  MapXLib_TLB,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tabs, DockTabSet, OleCtrls,  ExtCtrls, //RzForms,
  ImgList, StdCtrls, ComCtrls, ToolWin,  uMapXHandler, uCoordConvertor;

type
  TfLandmassEditor = class(TForm)
    mapLandMass: TMap;
    pnlTestArea: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    toolbtnDecreaseScale: TToolButton;
    cbSetScale: TComboBox;
    toolbtnIncreaseScale: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ImageList1: TImageList;
    grpCursorPosition: TGroupBox;
    grpFeatureCategory: TGroupBox;
    gprContourIntersectionChecking: TGroupBox;
    lbFeatureCategory: TListBox;
    ckFeatureSelection: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lBearingFCenter: TLabel;
    lDistanceFCenter: TLabel;
    lPosLat: TLabel;
    lGridLat: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lPosLong: TLabel;
    lGridLong: TLabel;
    btnCheckInternalIntersections: TButton;
    btnDeleteAll: TButton;
    btnCheckIntersectionWithOtherContours: TButton;
    btnClearErrorIndications: TButton;
    ckDisplayShading: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    btnScrCapture: TButton;
    Shape1: TShape;
    grpSelectedPoint: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lFeatureCategory: TLabel;
    lSelectedPosLat: TLabel;
    lSelectedGridLat: TLabel;
    lSelectedElevationLat: TLabel;
    lSelectedPosLong: TLabel;
    lSelectedGridLong: TLabel;
    lSelectedElevationLong: TLabel;
    btnEditCharacteristic: TButton;
    ToolButton10: TToolButton;
    procedure Button2Click(Sender: TObject);
    procedure mapLandMassMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure mapLandMassMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbFeatureCategoryClick(Sender: TObject);
    procedure btnEditCharacteristicClick(Sender: TObject);
    procedure toolbtnIncreaseScaleClick(Sender: TObject);
    procedure cbSetScaleChange(Sender: TObject);
    procedure toolbtnDecreaseScaleClick(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnScrCaptureClick(Sender: TObject);
    procedure ScreenShot(DestBitmap : TBitmap) ;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mapLandMassMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton2Click(Sender: TObject);
    //procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
	procedure mapLandMassDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Cardinal; const RectFull,
      RectInvalid: IDispatch);
	procedure UpdateGameCenter(X,Y:Integer);
    procedure mapLandMassMapViewChanged(Sender: TObject);
    procedure getPointGameCenter();
  private
    { Private declarations }
  public
    { Public declarations }
    //FMapPlatform: TSimMap;
    FCoordPlatformConv : TCoordConverter;
    //drawing
    gRect : TRect;
    pLeft, pTop, pRight, pBottom : integer;
    //state
    stateDrawing : boolean;
    statePan : boolean;
    stateDelete : boolean;
    stateSelect : boolean;

    diffXnm, diffYnm : double;
    gridLatt, gridLong,addStringX, addStringY : string;
    FCanvas : TCanvas;
    FLyrDraw    : CMapXLayer;
    objlist, recycleList : TList;
    gPoint  : TPoint;
    MouseIsDown, isCapturingScreen    : Boolean;
	  click : boolean;
    pointCollection : Variant;
    selectedPoint : boolean;
    fFtrFactory : Variant; //aldy

    fFtrCivilAirport : Variant;
    fFtrMilitaryAirport : Variant;
    fFtrWrecks : Variant;

    sCaptureLayer : CMapXLayer;
    procedure GetGridIndex(const cx, cy, w: Double;
        var gid: TRect);
    //procedure updateListPointObj;

    procedure load();
    procedure LoadENC(ENCGeoset: String);
    procedure createGeoset(getNameArea : string);

  end;

type
  TPointObj = class
     fFeature : Variant;
     sName : String;
     iSpeed : Integer;
     dHeading : Double;
     posx : Double;
     posY : Double;
     objType: SmallInt;
  end;

const
  PLOT_VEHICLE_TOOL = 1;
  VEHICLE_LIMIT = 100;
  BRIDGES_OVERPASSES_VIADUCTS = 108;
  CIVILIAN_AIRPORTS  = 87;
  COASTLINES = 108;
  DEPTH_CONTOURS = 108;
  ELEVATION_CONTOURS = 108;
  MILITARY_AIRPORTS = 53;
  PIPELINES = 108;
  PLATFORMS = 80;
  POLITICAL_BOUNDARIES = 108;
  POPULATED_PLACES = 60;
  RAILROADS = 108;
  RIVERS_STREAMS_CANALS = 108;
  ROADS = 108;
  WRECKS = 198;

var
  fLandmassEditor: TfLandmassEditor;
  xx: double;
  yy: double;

  b,TmpBmp:TBitmap;

  {}

  fArray: Array[0..VEHICLE_LIMIT] of TPointObj;

  lyrMyLayer: Variant;

  //lyrCivilAirport, lyrMilitaryAirport, lyrWreck : Variant;

  st: Variant;
  iPointObjCount: Integer;
  iCarNum: Integer;

implementation

uses uBaseCoordSystem, uEnvironmentCharacteristicsWindow, drawRec, Math,
      uScrCapture, ufCaptureRes, uExerciseArea, uDataModuleTTT, uGeographicalFeatureImport,
      ComObj, StrUtils;

{$R *.dfm}

procedure TfLandmassEditor.btnEditCharacteristicClick(Sender: TObject);
begin
  EnvironmentCharacteristicsWindowForm.Show;
end;

procedure TfLandmassEditor.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfLandmassEditor.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfLandmassEditor.ScreenShot(DestBitmap : TBitmap) ;
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

procedure TfLandmassEditor.btnScrCaptureClick(Sender: TObject);
begin

 b := TBitmap.Create;
 ScreenShot(b) ;
 isCapturingScreen := true;
 fScrCapture.Image1.Picture.Assign(b);

end;

procedure TfLandmassEditor.cbSetScaleChange(Sender: TObject);
var z : Double;
    s : string;
begin
  mapLandMass.OnMapViewChanged := nil;
  if cbSetScale.ItemIndex < 0  then Exit;

  //if (cbSetScale.ItemIndex<=5) then
  if (cbSetScale.ItemIndex <= 500) then
  begin
   s := cbSetScale.Items[cbSetScale.ItemIndex];
   try
     z := StrToFloat(s);
     mapLandMass.ZoomTo(z, mapLandMass.CenterX, mapLandMass.CenterY);
   finally

   end;
  end
  else cbSetScale.ItemIndex := cbSetScale.ItemIndex -1 ;
  mapLandMass.OnMapViewChanged := mapLandMassMapViewChanged;
end;

procedure TfLandmassEditor.GetGridIndex(const cx, cy, w: Double;
        var gid: TRect);
var i: integer;
    halfW: double;
begin
  halfW := 0.5 * w;

  i := Floor((cx - halfW + 180.0) / 10.0) + 1;
  gid.Left    := EnsureRange(i, 1, 36);

  i:=  Ceil((cx + halfW + 180.0) / 10.0) ;
  gid.Right   :=  EnsureRange(i, 1, 36);

  i := Floor ((90.0-(cy + halfW )) / 10.0)  ;
  gid.Top     :=  EnsureRange(i, 0, 17);

  i := Floor((90.0-(cy - halfW )) / 10.0) ;
  gid.Bottom  :=  EnsureRange(i, 0, 17);
end;

function GetIndexLong(const x: integer): string;
var i: integer;
begin
  i := EnsureRange(x, 1, 36);
  Result := Format('%2d', [i]);
end;

function GetIndexLatt(const y: integer): string;
var i: integer;
begin
  i := EnsureRange(y, 0, 17);
  Result := Char(Ord('A') + Y)
end;

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure TfLandmassEditor.createGeoset(getNameArea : string);
var
  aGeoset: string;
begin
  // getNameArea := OverlayGameEnviroDef.FGameArea.Game_Area_Identifier;
  //getNameArea := fOverlay.edtArea.Text;
  // aGeoset := ExtractFilePath(Application.ExeName) + 'game_area\part1.gst';
  //aGeoset := ExtractFilePath(Application.ExeName) + 'game_area\' + getNameArea + '\' + getNameArea + '.gst';
  aGeoset := 'M:\game_area\' + getNameArea + '\' + getNameArea + '.gst';
  LoadENC(aGeoset);
end;

procedure TfLandmassEditor.LoadENC(ENCGeoset : string);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if mapLandMass = nil then
    Exit;
  InitOleVariant(z);
  mapLandMass.Layers.RemoveAll;

  mapLandMass.Geoset := ENCGeoset;

  if ENCGeoset <> '' then
  begin
    for i := 1 to mapLandMass.Layers.Count do
    begin
      mapLandMass.Layers.Item(i).Selectable := false;
      mapLandMass.Layers.Item(i).Editable  := False;
//      FMap.Layers.Item(i).AutoLabel := True;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := mapLandMass.Layers.Add(mInfo, 1);

    mapLandMass.Layers.AnimationLayer := FLyrDraw;
    mapLandMass.MapUnit := miUnitNauticalMile;
  end;

  mapLandMass.BackColor := RGB(192, 224, 255);
end;

procedure TfLandmassEditor.load();
var i, j, k, lCount: integer;
    r: TRect;
    sX, sY, p, pDynamic, fName, fNameDynammic, lName: string;
    ssLayer : TStrings;
    //ssLayerDyn : TStrings;
    mInfo: CMapXLayerInfo;

    widthNM : integer;
    limitWidth : Array[0..15] of double;
    arrayTemp : Array[0..30] of double;
    arrayStringTemp : Array[0..30] of String;
    resultTemp : Array[0..30] of String;
    a, b : integer;
    unusedVt: OleVariant;
    MyFont: TFont;
    fileSource, fileDest, fileSourceDyn, fileDestDyn : string;

    fileSourceDat, fileSourceId, fileSourceMap : string;
    fileSourceDatDyn, fileSourceIdDyn, fileSourceMapDyn : string;

    fileDestDat, fileDestId, fileDestMap : string;
    fileDestDatDyn, fileDestIdDyn, fileDestMapDyn : string;

    dotDat, dotId, dotMap : string;
    dotDatDyn, dotIdDyn, dotMapDyn : string;
begin
    mapLandMass.Geoset := '';
    //lbxFile.Clear;

    p := ExtractFilePath(Application.ExeName);
    //pDynamic := GeographicalFeatureImportForm.sFolder;

    ssLayer := TStringList.Create;
    //ssLayer.LoadFromFile(p + 'layers.cfg');
    ssLayer.LoadFromFile(p + 'ConfigureLayer.txt');

    p := p + 'map\cells\';
    //pDynamic := pDynamic + '\map\cells\';

    GetGridIndex(fEditGameCenter.GCx, fEditGameCenter.GCy, fEditGameCenter.Gwidth, r);

    lCount := 1;
    for k := 0 to ssLayer.Count - 1 do begin

      for j := r.Top to r.Bottom do begin
        sY := GetIndexLatt(j);
        for i := r.Left to  r.Right do begin
          sX := GetIndexLong(i);

          lName := ssLayer[k] + '_'   + sY + '_' + sX + '.tab';
          dotId := ssLayer[k] + '_'   + sY + '_' + sX + '.id';
          dotDat := ssLayer[k] + '_'   + sY + '_' + sX + '.dat';
          dotMap := ssLayer[k] + '_'   + sY + '_' + sX + '.map';
          fName := p + lName;
          //fNameDynammic := pDynamic + lname;
          if FileExists(fName) then begin
            //lbxFile.Items.Add(lName);
            {}
            fileSource := fName;
            fileDest := ExtractFilePath(Application.ExeName) + 'game_area\' + ExerciseAreaForm.edtName.Text + '\cells\' + lName;
            CopyFile(PChar(fileSource), PChar(fileDest), False);

            fileSourceDyn := fName;
            fileDestDyn := GeographicalFeatureImportForm.getBrowsePath + '\' + ExerciseAreaForm.edtName.Text + '\cells\' + lName;
            //fileDestDyn := GeographicalFeatureImportForm.edtLibrary.Text + '\' + ExerciseAreaForm.edtName.Text + '\cells\' + lName;
            CopyFile(PChar(fileSourceDyn), PChar(fileDestDyn), False);

            {}
            fileSourceId := p + dotId;
            fileDestId := ExtractFilePath(Application.ExeName) + 'game_area\' + ExerciseAreaForm.edtName.Text + '\cells\' + dotId;
            CopyFile(PChar(fileSourceId), PChar(fileDestId), False);

            fileSourceIdDyn := p + dotId;
            fileDestIdDyn := GeographicalFeatureImportForm.getBrowsePath + '\' + ExerciseAreaForm.edtName.Text + '\cells\' + dotId;
            //fileDestIdDyn := GeographicalFeatureImportForm.edtLibrary.Text + '\' + ExerciseAreaForm.edtName.Text + '\cells\' + dotId;
            CopyFile(PChar(fileSourceIdDyn), PChar(fileDestIdDyn), False);

            {}
            fileSourceDat := p + dotDat;
            fileDestDat := ExtractFilePath(Application.ExeName) + 'game_area\' + ExerciseAreaForm.edtName.Text + '\cells\' + dotDat;
            CopyFile(PChar(fileSourceDat), PChar(fileDestDat), False);

            fileSourceDatDyn := p + dotDat;
            fileDestDatDyn := GeographicalFeatureImportForm.getBrowsePath + '\' + ExerciseAreaForm.edtName.Text + '\cells\' + dotDat;
            //fileDestDatDyn := GeographicalFeatureImportForm.edtLibrary.Text + '\' + ExerciseAreaForm.edtName.Text + '\cells\' + dotDat;
            CopyFile(PChar(fileSourceDatDyn), PChar(fileDestDatDyn), False);

            {}
            fileSourceMap := p + dotMap;
            fileDestMap := ExtractFilePath(Application.ExeName) + 'game_area\' + ExerciseAreaForm.edtName.Text + '\cells\' + dotMap;
            CopyFile(PChar(fileSourceMap), PChar(fileDestMap), False);

            fileSourceMapDyn := p + dotMap;
            fileDestMapDyn := GeographicalFeatureImportForm.getBrowsePath + '\' + ExerciseAreaForm.edtName.Text + '\cells\' + dotMap;
            //fileDestMapDyn := GeographicalFeatureImportForm.edtLibrary.Text + '\' + ExerciseAreaForm.edtName.Text + '\cells\' + dotMap;
            CopyFile(PChar(fileSourceMapDyn), PChar(fileDestMapDyn), False);

            mapLandMass.Layers.Add(fName, lCount);

            inc(lCount);
          end;
        end;
      end;
    end;

    widthNM := strtoint(ExerciseAreaForm.edtMaximum.Text);
    mapLandMass.ZoomTo(widthNM, fEditGameCenter.GCx, fEditGameCenter.GCy); //62
    //fName := ExtractFilePath(Application.ExeName) + 'map\' + edGstName.Text + '.gst';
    fName := ExtractFilePath(Application.ExeName) + 'map\' + 'result' + '.gst';
    //Map1.SaveMapAsGeoset(edGstName.Text, fname );
    mapLandMass.SaveMapAsGeoset('result', fname );
    ssLayer.Free;

  //isi combo box
  cbSetScale.Clear;
  //widthNM := strtoint(ExerciseAreaForm.edtMaximum.Text);

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
  while limitWidth[a] < widthNm do
  begin
    arrayTemp[a] := limitWidth[a];
    a := a+1;
  end;
  arrayTemp[a] := widthNm;

  for b := 0 to a do
      arrayStringTemp[b] := floattostr(arrayTemp[b]);

  for b := 0 to a do
  begin
      resultTemp[b] := arrayStringTemp[b];
      cbSetScale.Items.Add(resultTemp[b]);
  end;

// ini user layernya aldy rec.
     TVarData(unusedVt).vType := varError;
     TVarData(unusedVt).vError := DISP_E_PARAMNOTFOUND;
     // Add car layer and make it an animation layer
     lyrMyLayer := mapLandMass.Layers.CreateLayer('Features', unusedVt, 1, unusedVt, unusedVt);
     mapLandMass.Layers.AnimationLayer := mapLandMass.Layers.Item(lyrMyLayer.name);

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'Capture');
    sCaptureLayer :=  mapLandMass.Layers.Add(mInfo, 1);
    mapLandMass.Layers.AnimationLayer := sCaptureLayer;


     // Create custom tool to be used to plot vehicles
     mapLandMass.CreateCustomTool(PLOT_VEHICLE_TOOL, miToolTypePoint, miSizeCursor, miSizeCursor, miSizeCursor, unusedVt);

     MyFont := TFont.Create;
     OleFontToFont(mapLandMass.DefaultStyle.SymbolFont, MyFont);
     MyFont.Size := 12;
     MyFont.Name := 'MapSym-En-Air';
     MyFont.Color := clRed;

     mapLandMass.DefaultStyle.SymbolFontColor := clYellow;

     mapLandMass.DefaultStyle.LineColor := clWhite;
     mapLandMass.DefaultStyle.LineWidth := 1;
     mapLandMass.DefaultStyle.SymbolCharacter := 80;


     {}
     pointCollection := CoPoints.Create;
     {}
//:)
end;

procedure TfLandmassEditor.FormCreate(Sender: TObject);
begin
  //mapLandMass.BackColor := RGB(255, 255, 255);
  mapLandMass.BackColor := clSkyBlue;
  mapLandMass.DoubleBuffered := true;

  FCanvas := TCanvas.Create;

  //FMapPlatform := TSimMap.Create(mapLandMass);

  FCoordPlatformConv := TCoordConverter.Create;
  FCoordPlatformConv.FMap := mapLandMass;

  //FMapPlatform.LoadMap(ExtractFilePath(Application.ExeName) + 'mapsea\mapdata.gst'); }
  {
  FMapPlatform.FMap.OnMouseMove := mapLandMassMouseMove;
  FMapPlatform.FMap.OnMouseDown := mapLandMassMouseDown;
  FMapPlatform.FMap.OnMouseUp   := mapLandMassMouseUp;
  FMapPlatform.FMap.OnToolUsed := mapLandMass.OnToolUsed;
  }
  //create List

  objList := TList.Create;
  recycleList := TList.Create;

end;

procedure TfLandmassEditor.FormDestroy(Sender: TObject);
begin
  //FMapPlatform.Destroy;
end;

procedure TfLandmassEditor.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if isCapturingScreen then
 begin

  with fscrCapture do
  begin
   PDown.X := X;
   PDown.Y := Y;
   PActually.X := x;
   PActually.Y := Y;
   MouseIsDown := TRUE;
   Canvas.DrawFocusRect(Rect(x, y, x, y));


   Image1.Picture.Bitmap.Assign(b) ;
   Image1.Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, PActually.x, PActually.y));
   TmpBmp := TBitmap.Create;

   with TmpBmp do
   begin
     Width := Round(abs(PActually.x - PDown.x));
     Height := Round(abs(PActually.y - PDown.y));
     BitBlt(Canvas.Handle, 0, 0, Width, Height, Image1.Canvas.Handle, PDown.x,
     PDown.y, SRCCOPY);
     Image1.AutoSize := TRUE;
     Image1.Picture.Bitmap.Assign(TmpBmp);

     with fscrCapture do
     begin
      Image1.Picture.Bitmap.Assign(b) ;
      Image1.Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, PActually.x, PActually.y));
      TmpBmp := TBitmap.Create;
      with TmpBmp do
      begin
        Width := Round(abs(PActually.x - PDown.x));
        Height := Round(abs(PActually.y - PDown.y));
        BitBlt(Canvas.Handle, 0, 0, Width, Height, Image1.Canvas.Handle, PDown.x,
         PDown.y, SRCCOPY);
        fCaptureRes.imgCaptureResult.AutoSize := TRUE;
        fCaptureRes.imgCaptureResult.Picture.Bitmap.Assign(TmpBmp);

        fCaptureRes.Show;
        isCapturingScreen := false;
      end
     end
   end
  end;
 end;
end;

procedure TfLandmassEditor.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if isCapturingScreen then
 begin
  if MouseIsDown then
  begin
   with fscrCapture do
   begin
    //Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, PActually.x,PActually.y));
    PActually.X := x;
    PActually.Y := y;
    //Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, x, y));
    UpdateGameCenter(X,Y);
    mapLandMass.Repaint;
   end;
  end;
 end;
end;

procedure TfLandmassEditor.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 with fscrCapture do
 begin
  Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, PActually.x, PActually.y));
  Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, x, y));
  PActually.X := x;
  PActually.Y := y;
  MouseIsDown := FALSE;
 end;
end;

procedure TfLandmassEditor.FormShow(Sender: TObject);
begin
  ToolButton1Click(Sender);
  // Create standAlone feature object
  // add feature
  fFtrFactory := mapLandMass.FeatureFactory;

  fFtrCivilAirport := mapLandMass.FeatureFactory;
  fFtrMilitaryAirport := mapLandMass.FeatureFactory;
  fFtrWrecks := mapLandMass.FeatureFactory;

  mapLandMass.DefaultStyle.RegionBackColor := TransparentColorValue;

end;

procedure TfLandmassEditor.lbFeatureCategoryClick(Sender: TObject);
var
    MyFont: TFont;
begin
  if lbFeatureCategory.Selected[lbFeatureCategory.ItemIndex] then
  begin
    lFeatureCategory.Caption := lbFeatureCategory.items.Strings[lbFeatureCategory.ItemIndex];

    case lbFeatureCategory.ItemIndex of

    0:
    begin
      mapLandMass.DefaultStyle.SymbolCharacter := BRIDGES_OVERPASSES_VIADUCTS;
    end;
    1:
    begin
      MyFont := TFont.Create;
      OleFontToFont(mapLandMass.DefaultStyle.SymbolFont, MyFont);
      MyFont.Size := 15;
      MyFont.Name := 'MapInfo Transportation';

      mapLandMass.DefaultStyle.SymbolFontColor := clBlack;

      mapLandMass.DefaultStyle.LineColor := clWhite;
      mapLandMass.DefaultStyle.LineWidth := 5;
      mapLandMass.DefaultStyle.SymbolCharacter := 87;

      mapLandMass.DefaultStyle.SymbolCharacter := CIVILIAN_AIRPORTS;
    end;
    2:
    begin
      mapLandMass.DefaultStyle.SymbolCharacter := COASTLINES;
    end;
    3:
    begin
      mapLandMass.DefaultStyle.SymbolCharacter := DEPTH_CONTOURS;
    end;
    4:
    begin
      mapLandMass.DefaultStyle.SymbolCharacter := ELEVATION_CONTOURS;
    end;
    5:
    begin
      MyFont := TFont.Create;
      OleFontToFont(mapLandMass.DefaultStyle.SymbolFont, MyFont);
      MyFont.Size := 15;
      MyFont.Name := 'Map Symbols';

      mapLandMass.DefaultStyle.SymbolFontColor := clBlack;

      mapLandMass.DefaultStyle.LineColor := clWhite;
      mapLandMass.DefaultStyle.LineWidth := 5;
      mapLandMass.DefaultStyle.SymbolCharacter := 53;

      mapLandMass.DefaultStyle.SymbolCharacter := MILITARY_AIRPORTS;
    end;
    6:
    begin
      mapLandMass.DefaultStyle.SymbolCharacter := PIPELINES;
    end;
    7:
    begin
      MyFont := TFont.Create;
      OleFontToFont(mapLandMass.DefaultStyle.SymbolFont, MyFont);
      MyFont.Size := 15;
      MyFont.Name := 'MapSym-EN-Air';

      mapLandMass.DefaultStyle.SymbolFontColor := clBlack;

      mapLandMass.DefaultStyle.LineColor := clWhite;
      mapLandMass.DefaultStyle.LineWidth := 5;
      mapLandMass.DefaultStyle.SymbolCharacter := 80;

      mapLandMass.DefaultStyle.SymbolCharacter := PLATFORMS;
    end;
    8:
    begin
      mapLandMass.DefaultStyle.SymbolCharacter := POLITICAL_BOUNDARIES;
    end;
    9:
    begin
      MyFont := TFont.Create;
      OleFontToFont(mapLandMass.DefaultStyle.SymbolFont, MyFont);
      MyFont.Size := 15;
      MyFont.Name := 'Map Symbols';

      mapLandMass.DefaultStyle.SymbolFontColor := clBlack;

      mapLandMass.DefaultStyle.LineColor := clWhite;
      mapLandMass.DefaultStyle.LineWidth := 5;
      mapLandMass.DefaultStyle.SymbolCharacter := 60;

      mapLandMass.DefaultStyle.SymbolCharacter := POPULATED_PLACES ;
    end;
    10:
    begin
      mapLandMass.DefaultStyle.SymbolCharacter := RAILROADS;
    end;
    11:
    begin
      mapLandMass.DefaultStyle.SymbolCharacter := RIVERS_STREAMS_CANALS;
    end;
    12:
    begin
      mapLandMass.DefaultStyle.SymbolCharacter := ROADS;
    end;
    13:
    begin
       MyFont := TFont.Create;
       OleFontToFont(mapLandMass.DefaultStyle.SymbolFont, MyFont);
       MyFont.Size := 20;
       MyFont.Name := 'MapSym-En-Sea';

       mapLandMass.DefaultStyle.SymbolFontColor := clBlack;

       mapLandMass.DefaultStyle.LineColor := clWhite;
       mapLandMass.DefaultStyle.LineWidth := 5;
       mapLandMass.DefaultStyle.SymbolCharacter := 198;

       mapLandMass.DefaultStyle.SymbolCharacter := WRECKS;
    end;
    end;

  end;
end;

procedure TfLandmassEditor.getPointGameCenter();
var
  savePointLeft, savePointTop, savePointRight, savePointBottom : single;
  GCx, GCy: Double;
  Gwidth  : Double;
  sx, sy: Single;
  dx, dy, halfW: Double;
  v: Double;
begin
  GCx := dmToLongitude(uExerciseArea.ExerciseAreaForm.edtLongitude.Text);
  GCy := dmToLatitude(uExerciseArea.ExerciseAreaForm.edtLatitude.Text);

  if TryStrToFloat(uExerciseArea.ExerciseAreaForm.edtMaximum.Text, v) then
    Gwidth := v / 60.0;

   //uExerciseArea.ExerciseAreaForm.edtLongitude.Text := formatDMS_long(GCx);
   //uExerciseArea.ExerciseAreaForm.edtLatitude.Text := formatDMS_latt(GCy);
   //Gwidth := strtofloat(uExerciseArea.ExerciseAreaForm.edtMaximum.Text);

    halfW := 0.5 * Gwidth;
    mapLandMass.ConvertCoord(sx, sy, GCx, GCy, miMapToScreen);

    gPoint.X := Round(sx);
    gPoint.Y := Round(sy);

    dx := GCx - halfW;
    dy := GCy - halfW;

    mapLandMass.ConvertCoord(sx, sy, dx, dy, miMapToScreen);
    gRect.Left := Round(sx);
    gRect.Top  := Round(sy);

    dx := GCx + halfW;
    dy := GCy + halfW;

    mapLandMass.ConvertCoord(sx, sy, dx, dy, miMapToScreen);
    gRect.Right := Round(sx);
    gRect.Bottom  := Round(sy);

    pLeft   := gRect.Left;
    pTop    := gRect.Top;
    pRight  := gRect.Right;
    pBottom := gRect.Bottom;

    {savePointLeft := gRect.Left;
    savePointTop := gRect.Top;
    savePointRight := gRect.Right;
    savePointBottom := gRect.Bottom;  }
end;

procedure TfLandmassEditor.mapLandMassDrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Cardinal; const RectFull,
  RectInvalid: IDispatch);
begin
  if not Assigned(FCanvas) then
    Exit;
  FCanvas.Handle := hOutputDC;

{  FCanvas.Pen.Width := 5;
  FCanvas.Pen.Color := RGB(100, 240, 0);
  FCanvas.Brush.Style := bsClear;
  FCanvas.Rectangle(pLeft, pTop, pRight, pBottom);
  FCanvas.Brush.Style := bsSolid;
  FCanvas.Pen.Width := 2;  }

  if isCapturingScreen then begin
      FCanvas.Pen.Color := RGB(255, 255, 255);
      FCanvas.Pen.Width := 1;
      //FCanvas.Pen.Mode := pmMask;
      FCanvas.Pen.Mode := pmCopy;
      FCanvas.Brush.Style := bsClear;
      //FCanvas.Brush.Style := bsSolid;

        if MouseIsDown then begin
          FCanvas.MoveTo(gPoint.X, 0);
          //FCanvas.Brush.Color := clNone;
          FCanvas.Rectangle(fScrCapture.PDown.X, fScrCapture.PDown.Y, gPoint.X, gPoint.Y  );
    //    FCanvas.FrameRect();
    //    FCanvas.Ellipse(gPoint.X - 10 , gPoint.Y - 10,
    //        gPoint.X + 10 , gPoint.Y + 10);
          FCanvas.TextOut(gPoint.X+10,gPoint.Y-20, 'width:'+inttostr(gPoint.X-fscrCapture.PDown.X)+
          ',height:'+inttostr(gPoint.Y-fscrcapture.PDown.Y)+';('+inttostr(pnlTestArea.Width+gPoint.X)+','+IntToStr(gPoint.Y)+')');
        end
        else begin
          FCanvas.MoveTo(gPoint.X, 0);
          FCanvas.LineTo(gPoint.X, mapLandMass.Height);

          FCanvas.MoveTo(0, gPoint.Y);
          FCanvas.LineTo(mapLandMass.Width, gPoint.Y);
    //    FCanvas.Brush.Color := clLime;
    //    FCanvas.Ellipse(gPoint.X - 10 , gPoint.Y - 10,
    //    gPoint.X + 10 , gPoint.Y + 10);
         FCanvas.TextOut(gPoint.X+10,gPoint.Y-20, IntToStr(pnlTestArea.Width+gPoint.X)+','+IntToStr(gPoint.Y));
        end;

    end;
end;

procedure TfLandmassEditor.mapLandMassMapViewChanged(Sender: TObject);
var
      tempZoom : double;
      index : integer;
      test : string;
begin
      if mapLandMass.CurrentTool = miZoomInTool then
      begin
         if mapLandMass.Zoom <= 0.125 then tempZoom := 0.125;
         if (mapLandMass.Zoom > 0.125) AND (mapLandMass.Zoom < 1) then tempZoom := mapLandMass.Zoom;
         if (mapLandMass.Zoom >= 1) AND (mapLandMass.Zoom <= 2500) then tempZoom := round(mapLandMass.Zoom);
         if mapLandMass.Zoom > 2500 then tempZoom := 2500;

         mapLandMass.OnMapViewChanged := nil;
         mapLandMass.ZoomTo(tempZoom, mapLandMass.CenterX, mapLandMass.CenterY);

         if (mapLandMass.Zoom > 0.125) AND (mapLandMass.Zoom < 0.25) then
         begin
               cbSetScale.Text := FormatFloat('0.000', tempZoom);
         end
         else if (mapLandMass.Zoom >= 0.25) AND (mapLandMass.Zoom < 0.5) then
         begin
               cbSetScale.Text := FormatFloat('0.00', tempZoom);
         end
         else if (mapLandMass.Zoom >= 0.5) AND (mapLandMass.Zoom < 1) then
         begin
               cbSetScale.Text := FormatFloat('0.0', tempZoom);
         end
         else
               cbSetScale.Text := floattostr(tempZoom);
         mapLandMass.OnMapViewChanged := mapLandMassMapViewChanged;
      end;
end;

procedure TfLandmassEditor.mapLandMassMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  {}
  fNewSymbol: Variant;
  fMapSymbol: Variant;
  fNewLine: Variant;
  pItem : Variant;
  tempPointObj: TPointObj;
  {}
  xxx: single;
  yyy: single;
begin
  //Map1.ConvertCoord(xxx, yyy, xx, yy, miScreenToMap);
  //getPointGameCenter();
  mapLandMass.Repaint;

  FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);
  xxx := X;
  yyy := Y;

  if selectedPoint = true then
  begin
        lSelectedGridLat.Caption := gridLatt + ' nm ' + addStringY;
        lSelectedGridLong.Caption := gridLong + ' nm ' + addStringX;

        lSelectedPosLat.Caption := formatDM_latitude(yy);
        lSelectedPosLong.Caption := formatDM_longitude(xx);
  end;

  if isCapturingScreen then
  with fscrCapture do
  begin
   PDown.X := X;
   PDown.Y := Y;
   PActually.X := X;
   PActually.Y := Y;
   MouseIsDown := TRUE;
   Canvas.DrawFocusRect(Rect(x, y, x, y));
  end;

  UpdateGameCenter(X,Y);

  if statePan then
  begin
    mapLandMass.CenterX := xx;
    mapLandMass.CenterY := yy;

    //up button
    ToolButton14.Click;
  end;

  if stateDrawing then
      begin
         if iPointObjCount <= VEHICLE_LIMIT then
            begin
              if mapLandMass.DefaultStyle.SymbolCharacter = 108 then    //garis
              begin
               // Create point object to pass to CreateSymbol
               pItem := CreateOleObject('MapX.Point.4');

               pItem.Set(xx, yy);
               pointCollection.add(pItem);

               if pointCollection.Count = 1 then
               begin
                 pointCollection.add(pItem);
               end;

               //User Feature Factory to create new Feature
               //fNewSymbol := fFtrFactory.CreateSymbol(pItem, mapLandMass.DefaultStyle);
               fNewLine := fFtrFactory.CreateRegion(pointCollection, mapLandMass.DefaultStyle);
               //mapLandMass.FeatureFactory.c

               // Add Feature to layer
               //fMapSymbol := lyrMyLayer.AddFeature(fNewSymbol);
               fMapSymbol := lyrMyLayer.AddFeature(fNewLine);

               {
               // Set form controls for newly added feature
               fArray[iPointObjCount].fFeature := fMapSymbol;
               fArray[iPointObjCount].iSpeed := 0;
               fArray[iPointObjCount].dHeading := 0;
               fArray[iPointObjCount].sName := 'Feature ' + intToStr(iPointObjCount + 1);
               }
               //set Tlist
               tempPointObj := TPointObj.Create;
               tempPointObj.fFeature := fMapSymbol;
               tempPointObj.iSpeed := 0;
               tempPointObj.dHeading := 0;
               tempPointObj.posx := xx;
               tempPointObj.posY := yy;
               tempPointObj.objType := 1;
               tempPointObj.sName := lFeatureCategory.Caption + IntToStr(objList.Count + 1);
               objList.Add(tempPointObj);

               //delete
               //lyrMyLayer.deleteFeature(fMapSymbol);

               // increase vehicle count by 1
               iPointObjCount := iPointObjCount + 1;

               // clear memory of variant variables
               VarClear(fNewSymbol);
               VarClear(fMapSymbol);
              end
              else
              begin
               // Create point object to pass to CreateSymbol
               pItem := CreateOleObject('MapX.Point.4');
               pItem.Set(xx, yy);

               //User Feature Factory to create new Feature
               fNewSymbol := fFtrFactory.CreateSymbol(pItem, mapLandMass.DefaultStyle);

               // Add Feature to layer
               fMapSymbol := lyrMyLayer.AddFeature(fNewSymbol);

               //set Tlist
               tempPointObj := TPointObj.Create;
               tempPointObj.fFeature := fMapSymbol;
               tempPointObj.iSpeed := 0;
               tempPointObj.dHeading := 0;
               tempPointObj.posx := xx;
               tempPointObj.posY := yy;
               tempPointObj.objType := 0;
               tempPointObj.sName := lFeatureCategory.Caption + IntToStr(objList.Count + 1);
               objList.Add(tempPointObj);

               // increase vehicle count by 1
               iPointObjCount := iPointObjCount + 1;

               // clear memory of variant variables
               VarClear(fNewSymbol);
               VarClear(fMapSymbol);
              end;
            end
         else
                  ShowMessage('Reached Car Limit. Limit: 10');
   end // if Statement

end;

procedure TfLandmassEditor.mapLandMassMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  xxx: single;
  yyy: single;

  yCursorPoint, xCursorPoint, yCenter, xCenter, diffX, diffY : double;
  //gridLatt, gridLong,addStringX, addStringY : string;
  //diffXnm, diffYnm : double;
begin
  FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);
  xxx := X;
  yyy := Y;

  //lGridLat.Caption := FormatFloat('0.00', xxx);
  //lGridLong.Caption := FormatFloat('0.00', yyy);

  //////////////////////////////////////////////////////get grid cursor position
  yCursorPoint := yy;
  xCursorPoint := xx;

  yCenter := fEditGameCenter.GCy;
  xCenter := fEditGameCenter.GCx;

  diffY := abs(yCursorPoint - yCenter);
  diffX := abs(xCursorPoint - xCenter);

  diffYnm := diffY * 60;
  diffXnm := diffX * 60;

  if yCursorPoint < yCenter then addStringY := 'S'
  else addStringY := 'N';

  if xCursorPoint < xCenter then addStringX := 'W'
  else addStringX := 'E';

  lPosLat.Caption := formatDM_latitude(yy);
  lPosLong.Caption := formatDM_longitude(xx);

  lDistanceFCenter.Caption := FormatFloat('0.000', CalcRange(mapLandMass.CenterX, mapLandMass.CenterY, xx, yy));
  lBearingFCenter.Caption := FormatFloat('0.000', CalcBearing(mapLandMass.CenterX, mapLandMass.CenterY, xx, yy));

  gridLatt := FormatFloat('0.00',diffYnm);
  gridLong := FormatFloat('0.00',diffXnm);
  lGridLat.Caption := gridLatt + ' nm ' + addStringY;
  lGridLong.Caption := gridLong + ' nm ' + addStringX;

  //lPosLat.Caption := floattostr(diffY);
  //lPosLong.Caption := floattostr(diffX);

  if isCapturingScreen then begin
    UpdateGameCenter(X,Y);
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
    mapLandMass.Repaint;
  end;

  //if MouseIsDown then
  //begin
      //getPointGameCenter();
      //MapLandMass.Repaint;
  //end;
end;

procedure TfLandmassEditor.UpdateGameCenter(X,Y:Integer);
begin
  gPoint.X := X;
  gPoint.Y := Y;
end;

procedure TfLandmassEditor.mapLandMassMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if statePan then
 begin
   statePan := false;
   stateSelect := true;
   mapLandMass.CurrentTool := miPanTool;
   mapLandMass.MousePointer := miPanCursor;
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
     BitBlt(TmpBmp.Canvas.Handle, 0, 0, Width, Height, fScrCapture.Image1.Canvas.Handle, mapLandMass.Left+ PDown.x,
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
 UpdateGameCenter(X,Y);
 mapLandMass.Repaint;
end;

procedure TfLandmassEditor.toolbtnDecreaseScaleClick(Sender: TObject);
begin
  if  cbSetScale.ItemIndex >  0 then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex  - 1;
    toolbtnIncreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if cbsetscale.ItemIndex = 0 then
   toolbtnDecreaseScale.Enabled := false
  else
   toolbtnDecreaseScale.Enabled := true;
end;

procedure TfLandmassEditor.toolbtnIncreaseScaleClick(Sender: TObject);
var gameareadimension: integer;
begin

  if  (cbSetScale.ItemIndex <= 500) then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex + 1;
    toolbtnDecreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if (cbSetScale.ItemIndex = 0) then //sampai batas akhir
   toolbtnIncreaseScale.Enabled := true
  else
    toolbtnIncreaseScale.Enabled := true;
end;

procedure TfLandmassEditor.ToolButton10Click(Sender: TObject);
begin
    if (ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Long <> 0) and (ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Lat <> 0) then
    begin
      mapLandMass.CenterX := ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Long;
      mapLandMass.CenterY := ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Lat;
    end;
end;

procedure TfLandmassEditor.ToolButton13Click(Sender: TObject);
begin
  //uncheck others
  ToolButton1.Down := false;
  ToolButton2.Down := false;
  ToolButton14.Down := false;

  if ToolButton13.Down then
  begin
    mapLandMass.CurrentTool := miZoomInTool;
    mapLandMass.MousePointer := miZoomInCursor;
  end
  else
  begin
    mapLandMass.CurrentTool := miArrowTool;
    mapLandMass.MousePointer := miCrossCursor;
    stateSelect := true;
    statePan := false;
    stateDrawing := false;
    stateDelete := false;
  end;
end;

procedure TfLandmassEditor.ToolButton14Click(Sender: TObject);
begin
  {
  if (lSelectedPosLat.Caption <> '') and (lSelectedPosLong.Caption <> '') then
  begin
    mapLandMass.CenterX := (dmsToLong(lSelectedPosLong.Caption));
    mapLandMass.CenterY := (dmsToLatt(lSelectedPosLat.Caption));
  end;
  }

  //uncheck others
  ToolButton1.Down := false;
  ToolButton2.Down := false;
  ToolButton13.Down := false;

  if ToolButton14.Down then
  begin
    statePan := true;
    stateDrawing := false;
    stateDelete := false;
    stateSelect := false;
    mapLandMass.MousePointer := miCenterCursor;
  end
  else
  begin
    statePan := false;
    stateSelect := true;
    stateDrawing := false;
    stateDelete := false;
    mapLandMass.CurrentTool := miArrowTool;
  end;

end;

procedure TfLandmassEditor.ToolButton1Click(Sender: TObject);
begin
  selectedPoint := false;
  mapLandMass.CurrentTool := miArrowTool;
  mapLandMass.MousePointer := miCrossCursor;

  //disable tool button delete all, delete, undo delete
  //ToolButton6.Enabled := false;
  //ToolButton7.Enabled := false;
  //ToolButton8.Enabled := false;

  //uncheck tb2
  ToolButton2.Down := false;
  ToolButton13.Down := false;
  ToolButton14.Down := false;

  if ToolButton1.Down then
  begin
     stateSelect := true;
     statePan := false;
     stateDelete := false;
     stateDrawing := false;
  end;

  //unselected point
  lFeatureCategory.Caption := '-';
  lSelectedGridLat.Caption := '-';
  lSelectedGridLong.Caption := '-';
  lSelectedPosLat.Caption := '-';
  lSelectedPosLong.Caption := '-';
  ckFeatureSelection.Checked := false;
  ckFeatureSelection.Enabled := false;
  lbFeatureCategory.Enabled := false;
end;

procedure TfLandmassEditor.ToolButton2Click(Sender: TObject);
begin
  selectedPoint := true;
  //uncheck other
  ToolButton1.Down := false;
  ToolButton13.Down := false;
  ToolButton14.Down := false;

  if ToolButton2.Down then
  begin
    stateSelect := false;
    statePan := false;
    stateDelete := false;
    stateDrawing := true;
    mapLandMass.MousePointer := miCrossCursor;
  end
  else
  begin
    statePan := false;
    stateDrawing := false;
    stateDelete := false;
    stateSelect := true;
    mapLandMass.MousePointer := miCrossCursor;
  end;

  ckFeatureSelection.Enabled := true;
  lbFeatureCategory.Enabled := true;
  //if ckFeatureSelection.Checked = true then lbFeatureCategory.Enabled := true;

end;

procedure TfLandmassEditor.ToolButton6Click(Sender: TObject);
begin
  //delete dari belakang
  //pidah ke list recycle sblm di delete
  if objList.Count = 0 then
    Exit;
  recycleList.Add(objList.Items[objList.Count-1]);

  //hapus gambar
  if TPointObj(objlist[objlist.Count-1]).objType = 1 then
  begin
     //pointCollection.delete(TPointObj(objlist[objlist.Count-1]).fFeature);
  end;
  lyrMyLayer.DeleteFeature(TPointObj(objlist[objlist.Count-1]).fFeature);
  objList.Delete(objlist.Count -1);
  mapLandMass.Repaint;
end;

procedure TfLandmassEditor.ToolButton7Click(Sender: TObject);
var
  I: Integer;
begin
  //delete dari belakang berulang sampai habis
  //pindah ke recycle
  for I := 0 to objList.Count - 1 do
  begin
    //hapus gambar
    ToolButton6Click(Sender);
    {
    recycleList.Add(objList.Items[objlist.Count-1]);
    lyrMyLayer.DeleteFeature(TPointObj(objlist[objlist.Count-1]).fFeature);
    }
  end;
  objList.Clear;
  mapLandMass.Repaint;
end;

procedure TfLandmassEditor.ToolButton8Click(Sender: TObject);
var
  fMapSymbol : Variant;
  fMapCivilAir, fMapMilitaryAir, fMapWrecks : Variant;
  fNewSymbol, fNewLine, fNewRegion : Variant;

  pItem : Variant;
begin
  if recycleList.Count = 0 then
  begin
    ToolButton8.Enabled := false;
    Exit;
  end
  else
  begin
    //tambahkan ke List
    objList.Add(recycleList.Items[recycleList.Count - 1]);
    {}
    if TPointObj(objlist[objlist.Count - 1]).objType = 0 then
    begin
    // Create point object to pass to CreateSymbol
         pItem := CreateOleObject('MapX.Point.4');
         pItem.Set(TPointObj(objlist[objlist.Count - 1]).posx, TPointObj(objlist[objlist.Count - 1]).posy);

         if AnsiContainsStr(TPointObj(objlist[objlist.Count - 1]).sName, 'Platform') then
         begin
           mapLandMass.DefaultStyle.SymbolCharacter := PLATFORMS;
           fNewSymbol := fFtrFactory.CreateSymbol(pItem, mapLandMass.DefaultStyle);
           fMapSymbol := lyrMyLayer.AddFeature(fNewSymbol);
           TPointObj(objlist[objlist.Count - 1]).fFeature := fMapSymbol;
         end
         else if AnsiContainsStr(TPointObj(objlist[objlist.Count - 1]).sName, 'Military') then
         begin
           mapLandMass.DefaultStyle.SymbolCharacter := MILITARY_AIRPORTS;
           fNewSymbol := fFtrMilitaryAirport.CreateSymbol(pItem, mapLandMass.DefaultStyle);
           fMapMilitaryAir := lyrMyLayer.AddFeature(fNewSymbol);
           TPointObj(objlist[objlist.Count - 1]).fFeature := fMapMilitaryAir;
         end
         else if AnsiContainsStr(TPointObj(objlist[objlist.Count - 1]).sName, 'Civilian') then
         begin
           mapLandMass.DefaultStyle.SymbolCharacter := CIVILIAN_AIRPORTS;
           fNewSymbol := fFtrCivilAirport.CreateSymbol(pItem, mapLandMass.DefaultStyle);
           fMapCivilAir := lyrMyLayer.AddFeature(fNewSymbol);
           TPointObj(objlist[objlist.Count - 1]).fFeature := fMapCivilAir;
         end
         else if AnsiContainsStr(TPointObj(objlist[objlist.Count - 1]).sName, 'Wrecks') then
         begin
           mapLandMass.DefaultStyle.SymbolCharacter := WRECKS;
           fNewSymbol := fFtrWrecks.CreateSymbol(pItem, mapLandMass.DefaultStyle);
           fMapWrecks := lyrMyLayer.AddFeature(fNewSymbol);
           TPointObj(objlist[objlist.Count - 1]).fFeature := fMapWrecks;
         end;

         //User Feature Factory to create new Feature
         //fNewSymbol := fFtrFactory.CreateSymbol(pItem, mapLandMass.DefaultStyle);

         // Add Feature to layer
         //fMapSymbol := lyrMyLayer.AddFeature(fNewSymbol);

         //TPointObj(objlist[objlist.Count - 1]).fFeature := fMapSymbol;
    end
    else if TPointObj(objlist[objlist.Count - 1]).objType = 1 then
    begin
         pItem := CreateOleObject('MapX.Point.4');
         pItem.Set(TPointObj(objlist[objlist.Count - 1]).posx, TPointObj(objlist[objlist.Count - 1]).posy);

         pointCollection.add(pItem);
               
         //User Feature Factory to create new Feature
         fNewLine := fFtrFactory.CreateRegion(pointCollection, mapLandMass.DefaultStyle);
         // Add Feature to layer
         fMapSymbol := lyrMyLayer.AddFeature(fNewLine);

         TPointObj(objlist[objlist.Count - 1]).fFeature := fMapSymbol;
    end;
    {}
    //hapus di recycle
    recycleList.Delete(recycleList.Count - 1);

  end;
  mapLandMass.Repaint;
end;

end.

