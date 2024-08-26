unit uTrainingPattern;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, uMapXHandler, uCoordConvertor, {TeCanvas,} ColorGrd, RzButton, Math, uDBEditSetting, uBaseCoordSystem,
  uDBAsset_Sensor, tttData, uDBPattern, uDBAsset_Scripted, System.ImageList;

type
  TfTrainingPattern = class(TForm)
    pnlTestArea: TPanel;
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
    grpCursorPosition: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    lbBearingFOrigin: TLabel;
    lbDistanceFOrigin: TLabel;
    lGridLat: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lGridLong: TLabel;
    btClose: TButton;
    Button4: TButton;
    Shape1: TShape;
    grpSelectedPoint: TGroupBox;
    Label7: TLabel;
    Label11: TLabel;
    lbBearingSel: TLabel;
    lbtlSelectedGridLat: TLabel;
    lbtlSelectedGridLong: TLabel;
    btnEditEvents: TButton;
    ToolButton10: TToolButton;
    Label5: TLabel;
    btOk: TButton;
    lbcenterx: TLabel;
    lbcentery: TLabel;
    btn1: TToolButton;
    lb1: TLabel;
    lb2: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    lb6: TLabel;
    cbbGroundSpeed: TComboBox;
    lbDistanceSel: TLabel;
    cbbVerticalSpeed: TComboBox;
    btn2: TToolButton;
    btn3: TToolButton;
    bvl1: TBevel;
    edtAltitude: TEdit;
    lb3: TLabel;
    Map1: TMap;
    procedure FormShow(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure Map1DrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Cardinal; const RectFull,
      RectInvalid: IDispatch);
    procedure FormCreate(Sender: TObject);
    procedure Map1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Map1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure cbSetScaleChange(Sender: TObject);
    procedure Map1MapViewChanged(Sender: TObject);
    procedure toolbtnIncreaseScaleClick(Sender: TObject);
    procedure toolbtnDecreaseScaleClick(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Map1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure btnEditEventsClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure edtAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure edtAltitudeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  Const
    //r        = 200;
  private
    patternIndex        : Integer;
    FCoordPlatformConv  : TCoordConverter;
  public
    { Public declarations }

    add, arrow                     : Boolean;
    isCapturingScreen, MouseIsDown : Boolean;
    wCross, hCross                 : Integer;
    radius, r, index               : Integer;
    oriLong, oriLat                : Double;
    FLyrDraw                       : CMapXLayer;
    FCanvas                        : TCanvas;
    centX, centY                   : Integer;
    mapX, mapY                     : Double;

    TPA              : Array of TPoint;
    tempTPA          : Array of TPoint;
    fromFileTPA      : Array of TPoint;
    lengthArray, nol : Integer;
    fName            : String;
    myFile           : TextFile;

    //RecScriptedPPt : TRecScripted_Pattern_Point;
    scriptedPPt : TScripted_Pattern_Point;

    procedure spiderWeb;
    procedure addPolyline;
    procedure drawPolyline;

    procedure LoadMap(aGeoset : String);
    procedure ScreenShot(DestBitmap : TBitmap) ;
    procedure getCursorPosition(X : Single; Y : Single);

    procedure getScriptedPatternIndex;
    procedure getPatternIndex(pattern : TPredefined_Pattern);

    procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);

    function getCenterX(fMap : TMap): Double;
    function getCenterY(fMap : TMap): Double;

  end;

var
   fTrainingPattern : TfTrainingPattern;
   b, TmpBmp        : TBitmap;

implementation
{$R *.dfm}

uses uScrCapture, ufCaptureRes, ufrmSummaryPredefinedPattern, uPredefinedPatternEvents,
  uDataModuleTTT;

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType  := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure  TfTrainingPattern.getPatternIndex(pattern: TPredefined_Pattern);
begin
  patternIndex := pattern.FData.Pattern_Index;
end;

procedure TfTrainingPattern.getCursorPosition(X : Single; Y : Single);
var
    diffXnm, diffYnm, cursorLong, cursorLat, centerLong, centerLat  : double;
    gridLatt, gridLong, addStringX, addStringY : string;
    oriX, oriY : single;
    {  cursorLong/cursorLat = posisi cursor dalam degree
       centerLong/centerLat = point of center (dalam degree)
       oriX/oriY            = point of center (dalam screen)  -> single
       centerX/centerY      = point of center (dalam screen)  -> integer
    }
begin
    oriX := centX;                 // convert to single //
    oriY := centY;

    Map1.ConvertCoord(X, Y,  cursorLong, cursorLat, miScreenToMap);
    Map1.Convertcoord(oriX, oriY, centerLong, centerLat, miScreenToMap);

    lbBearingFOrigin.Caption  := FormatFloat('0.00', CalcBearing(Map1.CenterX, MAp1.CenterY, cursorLong, cursorLat));
    lbDistanceFOrigin.Caption := FormatFloat('0.00', FCoordPlatformConv.Distance_nmi(Map1.CenterX, MAp1.CenterY, cursorLong, cursorLat));

    diffYnm := (abs(cursorLat  - centerLat))  * 60;
    diffXnm := (abs(cursorLong - centerLong)) * 60;

    if Y < centY then addStringY := 'S'
    else addStringY := 'N';

    if X < centX then addStringX := 'W'
    else addStringX := 'E';

    gridLatt          := FormatFloat('0.00', diffYnm);
    gridLong          := FormatFloat('0.00', diffXnm);
    lGridLat.Caption  := gridLatt + ' nm ' + addStringY;
    lGridLong.Caption := gridLong + ' nm ' + addStringX;
end;

procedure TfTrainingPattern.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfTrainingPattern.btnEditEventsClick(Sender: TObject);
begin
  //getScripted;
  uPredefinedPatternEvents.EditEvents.ShowModal;
end;

procedure TfTrainingPattern.getScriptedPatternIndex;
begin
  scriptedPPt.fdata.Pattern_Index := patternIndex;
  scriptedPPt.FData.Point_Number  := 0;
  scriptedPPt.fdata.Heading       := 0;
  scriptedPPt.fdata.Range         := 0;

  if cbbGroundSpeed.Text = 'Minimum' then
     scriptedPPt.fdata.Speed := 0
  else if cbbGroundSpeed.Text = 'Cruise' then
     scriptedPPt.fdata.Speed := 1
  else if cbbGroundSpeed.Text = 'High' then
     scriptedPPt.fdata.Speed := 2
  else if cbbGroundSpeed.Text = 'Maximum' then
     scriptedPPt.fdata.Speed := 3;

  scriptedPPt.fdata.Altitude                := strtofloat(edtAltitude.Text);

  if cbbVerticalSpeed.Text = 'Maximum Climb' then
     scriptedPPt.fdata.Vert_Speed := 0
  else if cbbVerticalSpeed.Text = 'Normal Climb' then
     scriptedPPt.fdata.Vert_Speed := 1
  else if cbbVerticalSpeed.Text = 'Level' then
     scriptedPPt.fdata.Vert_Speed := 2
  else if cbbVerticalSpeed.Text = 'Normal Descent' then
     scriptedPPt.fdata.Vert_Speed := 3
  else if cbbVerticalSpeed.Text = 'Maximum Descent' then
     scriptedPPt.fdata.Vert_Speed := 4;

  scriptedPPt.fdata.Time_Waypoint           := 0;
  scriptedPPt.fdata.Time_2_Waypoint         := 0;
  scriptedPPt.fdata.HF_Datalink_Activate    := 0;
  scriptedPPt.fdata.UHF_Datalink_Activate   := 0;
  scriptedPPt.fdata.Sonobuoy_Instance_Index := 0;
  scriptedPPt.fdata.Deploy_Sonobuoys        := 0;
  scriptedPPt.fdata.Sonobuoy_Spacing        := 0;
  scriptedPPt.fdata.Num_Sonobuoys_2_Drop    := 0;
  scriptedPPt.fdata.Sonobuoy_Depth          := 0;
  scriptedPPt.fdata.Jammer_Control          := 0;
  scriptedPPt.fdata.Remove_from_Game        := 0;
end;

procedure TfTrainingPattern.btOkClick(Sender: TObject);
begin
  getScriptedPatternIndex;
  dmTTT.InsertScripted_Pattern_Point(scriptedPPt);
  Close;
end;

procedure TfTrainingPattern.ScreenShot(DestBitmap : TBitmap) ;
 var
   DC : HDC;
 begin
   DC := GetDC (GetDesktopWindow) ;
   try
      DestBitmap.Width  := GetDeviceCaps (DC, HORZRES) ;
      DestBitmap.Height := GetDeviceCaps (DC, VERTRES) ;
      BitBlt(DestBitmap.Canvas.Handle, 0, 0, DestBitmap.Width, DestBitmap.Height, DC, 0, 0, SRCCOPY) ;
   finally
      ReleaseDC (GetDesktopWindow, DC) ;
   end;
 end;

procedure TfTrainingPattern.Button4Click(Sender: TObject);
begin
 b := TBitmap.Create;
 ScreenShot(b) ;
 isCapturingScreen := true;
 fScrCapture.Image1.Picture.Assign(b);
 Map1.MousePointer := miCrossCursor;
end;

procedure TfTrainingPattern.cbSetScaleChange(Sender: TObject);
var z : Double;
    s : string;
begin
  Map1.OnMapViewChanged := nil;
  if cbSetScale.ItemIndex < 0  then Exit;

  if (cbSetScale.ItemIndex <= 500) then
  begin
   s := cbSetScale.Items[cbSetScale.ItemIndex];
   try
     z := StrToFloat(s);
     map1.ZoomTo(z, Map1.CenterX, Map1.CenterY);
   finally

   end;
  end
  else cbSetScale.ItemIndex := cbSetScale.ItemIndex -1 ;
  Map1.OnMapViewChanged := Map1MapViewChanged;
end;

procedure TfTrainingPattern.LoadMap(aGeoset: String);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
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
      Map1.Layers.Item(i).Editable  := False;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := Map1.Layers.Add(mInfo, 1);

    Map1.Layers.AnimationLayer := FLyrDraw;
    Map1.MapUnit := miUnitNauticalMile;
  end;
  //FMap.BackColor := RGB(192, 224, 255);
  Map1.BackColor := RGB(0, 0, 0);
end;

procedure TfTrainingPattern.spiderWeb;
var
  I, X, Y, smallRange    : Integer;
  sX, sY                 : Single;
  radiusNm, radiusDegree : Double;
  tempX, tempY           : Double;
begin
  //radius := 200;

  // radiusnya dalam nm
  radiusNm     := 1660;
  radiusDegree := radiusNm / 60;

  tempX := mapX - radiusDegree;
  tempY := mapY - radiusDegree;

  Map1.ConvertCoord(sX, sY, tempX, tempY, miMapToScreen);
  X := Round(sX);
  Y := Round(sY);

  radius     := abs(centX - X);
  r          := radius;
  smallRange := round(radius / 4);

  FCanvas.Pen.color   := clBlack;

  for I := 0 to 3 do
  begin
      FCanvas.Ellipse(centX - radius, centY - radius, centX + radius, centY + radius);
      radius     := radius - smallRange;
      //radius := radius - 50;
  end;

  // plus line
  with FCanvas do
  begin
      MoveTo(centX, centY - r);
      LineTo(centX, centY + r);
      MoveTo(centX - r, centY);
      LineTo(centX + r, centY);
  end;

  // cross line
  wCross := round(cos(DegToRad(45)) * r);
  hCross := round(sin(DegToRad(45)) * r);

  with FCanvas do
  begin
      MoveTo(centX - wCross, centY - hCross);
      LineTo(centX + wCross, centY + hCross);
      MoveTo(centX + wCross, centY - hCross);
      LineTo(centX - wCross, centY + hCross);
  end;
end;

procedure TfTrainingPattern.toolbtnDecreaseScaleClick(Sender: TObject);
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

procedure TfTrainingPattern.toolbtnIncreaseScaleClick(Sender: TObject);
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

procedure TfTrainingPattern.addPolyline;
begin
  FCanvas.Pen.color   := clRed;

  if nol > 0 then
  begin
     FCanvas.Polyline(TPA);
  end;

  {if index = 0 then
  begin
     // Do nothing
  end
  else if index = 1 then
  begin
     FCanvas.MoveTo(TPA[0].X, TPA[0].Y);
     FCanvas.LineTo(TPA[index].X, TPA[index].Y);
  end
  else if index > 1 then
  begin
     for J := 0 to index - 1 do
     begin
         temp := J + 1;
         FCanvas.MoveTo(TPA[J].X, TPA[J].Y);
         FCanvas.LineTo(TPA[temp].X, TPA[temp].Y);
     end;
  end;   }
end;

procedure TfTrainingPattern.drawPolyline;
begin
  FCanvas.Pen.color   := clRed;

  //if nol2 > 0 then
     //FCanvas.Polyline(tempTPA);
     FCanvas.Polyline(fromFileTPA);
end;

procedure TfTrainingPattern.edtAltitudeKeyPress(Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAltitude.Text := FormatFloat('0.00', StrToFloat(edtAltitude.Text));
end;

procedure TfTrainingPattern.edtAltitudeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edtAltitude.Text = '' then
    Exit;

   if (StrToFloat(edtAltitude.Text) > 5000)  then
    begin
      ShowMessage('Incorrect value');
      edtAltitude.Text := '5000';
    //  edtAltitude.Text := FormatFloat('0.00', StrToFloat(edtAltitude.Text));
    end;
end;

procedure TfTrainingPattern.Map1DrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Cardinal; const RectFull,
  RectInvalid: IDispatch);
begin
  if not Assigned(FCanvas) then
    Exit;
  FCanvas.Handle      := hOutputDC;
  FCanvas.Brush.Style := bsClear;
  FCanvas.Pen.Width   := 2;

  spiderWeb;
  addPolyline;

  drawPolyline;
end;

procedure TfTrainingPattern.Map1MapViewChanged(Sender: TObject);
var
      tempZoom : double;
begin
      if Map1.CurrentTool = miZoomInTool then
      begin
         if Map1.Zoom <= 0.125 then tempZoom := 0.125;
         if (Map1.Zoom > 0.125) AND (Map1.Zoom < 1) then tempZoom := Map1.Zoom;
         if (Map1.Zoom >= 1) AND (Map1.Zoom <= 2500) then tempZoom := round(Map1.Zoom);
         if Map1.Zoom > 2500 then tempZoom := 2500;

         Map1.OnMapViewChanged := nil;
         Map1.ZoomTo(tempZoom, Map1.CenterX, Map1.CenterY);

         if (Map1.Zoom > 0.125) AND (Map1.Zoom < 0.25) then
         begin
               cbSetScale.Text := FormatFloat('0.000', tempZoom);
         end
         else if (Map1.Zoom >= 0.25) AND (Map1.Zoom < 0.5) then
         begin
               cbSetScale.Text := FormatFloat('0.00', tempZoom);
         end
         else if (Map1.Zoom >= 0.5) AND (Map1.Zoom < 1) then
         begin
               cbSetScale.Text := FormatFloat('0.0', tempZoom);
         end
         else
               cbSetScale.Text := floattostr(tempZoom);
         Map1.OnMapViewChanged := Map1MapViewChanged;
      end;
end;

procedure TfTrainingPattern.Map1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if add then
  begin
      SetLength(TPA, lengthArray);
      if index = 0 then
      begin
         TPA[index].X := X;
         TPA[index].Y := Y;
         nol := index;
         inc(index);
      end
      else if index >= 1 then
      begin
         TPA[index].X := X;
         TPA[index].Y := Y;
         inc(nol);
         Map1.Repaint;
         inc(index);
      end;
      inc(lengthArray);
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
end;

procedure TfTrainingPattern.Map1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  xPos, yPos : Single;
begin
  xPos := X;
  yPos := Y;
  getCursorPosition(xPos, yPos);

  if isCapturingScreen then begin
    if MouseIsDown then  begin
      with fscrCapture do begin
      //Map1.Repaint;

      //Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, PActually.x,PActually.y));
      PActually.X := x;
      PActually.Y := y;
      //Canvas.DrawFocusRect(Rect(PDown.x, PDown.y, x, y));
      end;
    end;
    Map1.Repaint;
  end;
end;

procedure TfTrainingPattern.Map1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
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
end;

function TfTrainingPattern.getCenterX(fMap : TMap): Double;
begin
  Result := fMap.CenterX;
end;

function TfTrainingPattern.getCenterY(fMap : TMap): Double;
begin
  Result := fMap.CenterY;
end;

procedure TfTrainingPattern.FormCreate(Sender: TObject);
begin
  FCanvas                 := TCanvas.Create;
  FCoordPlatformConv      := TCoordConverter.Create;
  FCoordPlatformConv.FMap := Map1;
  //myList                  := TList.Create;
  //myIFF                   := TIFF_Sensor_On_Board.Create;
  scriptedPPt             := TScripted_Pattern_Point.create;
end;

procedure TfTrainingPattern.Split (const Delimiter: Char; Input: string; const Strings: TStrings) ;
begin
   Assert(Assigned(Strings));
   Strings.Clear;
   Strings.Delimiter     := Delimiter;
   Strings.DelimitedText := Input;
end;

procedure TfTrainingPattern.FormShow(Sender: TObject);
var
  aGeoset, myString : string;
  sX, sY  : single;
  A       : TStringList;
  i : word;
  j, lengthTempTPA : Integer;
begin
  arrow   := true;
  add     := false;
  aGeoset := vAppDBSetting.Pattern;
  LoadMap(aGeoset);


  mapX := Map1.CenterX;
  mapY := Map1.CenterY;

  Map1.ConvertCoord(sX, sY, mapX, mapY, miMapToScreen);
  centX := Round(sX);       // awalnya 500
  centY := Round(sY);       // awalnya 350

  fName := vAppDBSetting.predefPattern + '\' + frmSummaryPredefinedPattern.edtPatternName.Text + '.dat';;
  if not FileExists(fName) then
     Exit;

  if FileExists(fName) then
  begin
      i := 0;  lengthTempTPA := 1;
      A := TStringList.Create;
      try
      begin
        AssignFile(myFile, fName);
        FileMode := fmOpenRead;
        reset(myFile);
        //seek(myfile,i);
        while not Eof(myFile) do
        begin
            Readln(myFile, myString);
            Split(',', myString, A) ;
            SetLength(tempTPA, lengthTempTPA);
            tempTPA[i].X := strtoint(A[0]);
            tempTPA[i].Y := strtoint(A[1]);
            inc(i);
            inc(lengthTempTPA);
        end;
        CloseFile(myFile);
      end;
      finally
        A.Free;
      end;
  end;

  SetLength(fromFileTPA, lengthTempTPA-2);
  for j := 0 to lengthTempTPA - 2 do
  begin
      fromFileTPA[j].X := tempTPA[j].X;
      fromFileTPA[j].Y := tempTPA[j].Y;
  end;
  Map1.Repaint;
end;

procedure TfTrainingPattern.ToolButton10Click(Sender: TObject);
begin
    if (mapX <> 0) and (mapY <> 0) then
    begin
      Map1.CenterX := mapX;
      Map1.CenterY := mapY;
    end;
end;

procedure TfTrainingPattern.ToolButton13Click(Sender: TObject);
begin
  {ToolButton1.Down  := false;
  ToolButton2.Down  := false;
  ToolButton14.Down := false; }

  {if ToolButton13.Down then
  begin
    Map1.CurrentTool   := miZoomInTool;
    Map1.MousePointer  := miZoomInCursor;
  end
  else
  begin
    Map1.CurrentTool   := miArrowTool;
    Map1.MousePointer  := miCrossCursor;
  end; }

  Map1.CurrentTool := miZoomInTool;
  Map1.MousePointer := miZoomInCursor;

end;

procedure TfTrainingPattern.ToolButton14Click(Sender: TObject);
begin
  ToolButton1.Down := false;
  ToolButton2.Down := false;
  ToolButton13.Down := false;

  if ToolButton14.Down then
  begin
    {statePan := true;
    stateDrawing := false;
    stateDelete := false;
    stateSelect := false; }
    map1.MousePointer := miCenterCursor;
  end
  else
  begin
    {statePan := false;
    stateSelect := true;
    stateDrawing := false;
    stateDelete := false;   }
    Map1.CurrentTool := miArrowTool;
  end;
end;

procedure TfTrainingPattern.ToolButton1Click(Sender: TObject);
var
  I : Integer;
  tempString : String;
begin
  AssignFile(myFile, fName);
  ReWrite(myFile);

  for I := 0 to lengthArray - 1 do
  begin
      tempString := inttostr(TPA[I].X) + ',' + inttostr(TPA[I].Y);
      Writeln(myFile, tempString);
  end;
  CloseFile(myFile);

  arrow := true;
  add   := false;

  Map1.MousePointer := miDefaultCursor;
  index := 0;
end;

procedure TfTrainingPattern.ToolButton2Click(Sender: TObject);
begin
  add         := true;
  arrow       := false;

  index       := 0;
  lengthArray := 1;
  Map1.MousePointer := miCrossCursor;

  fName := vAppDBSetting.predefPattern + '\' + frmSummaryPredefinedPattern.edtPatternName.Text + '.dat';

  if FileExists(fName) then
     DeleteFile(fName);
end;

end.

