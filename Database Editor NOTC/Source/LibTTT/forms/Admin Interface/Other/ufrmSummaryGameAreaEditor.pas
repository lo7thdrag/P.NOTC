unit ufrmSummaryGameAreaEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.OleCtrls, MapXLib_TLB, Vcl.CheckLst,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  uDBAsset_GameEnvironment, uCoordConvertor, uDBEditSetting, ufrmPickPoint, uBaseCoordSystem;

type

  E_MapCursor = (mcSelect, mcMultiSelect, mcZoom, mcGameCenter, mcPan);

  TfrmSummaryGameAreaEditor = class(TForm)
    ImgBackground: TImage;
    pnlMap: TPanel;
    ENCMap: TMap;
    chklstArea: TCheckListBox;
    pnlSearch: TPanel;
    lblSearch: TStaticText;
    edtSearch: TEdit;
    btnIncrease: TImage;
    cbbScale: TComboBox;
    Image7: TImage;
    btnDecrease: TImage;
    btnSelect: TImage;
    btnZoom: TImage;
    btnCenterOnGameCenter: TImage;
    btnPan: TImage;
    lblName: TStaticText;
    edtName: TEdit;
    btnOk: TImage;
    btnCancel: TImage;
    ProgressBar1: TProgressBar;
    pnlCursorPosition: TPanel;
    grbCursorPosition: TGroupBox;
    lblBearing: TLabel;
    lblDistance: TLabel;
    lbSlPosition: TLabel;
    lblWPosition: TLabel;
    lbl47: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbScaleChange(Sender: TObject);
    procedure ENCMapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
    procedure ENCMapMapViewChanged(Sender: TObject);
    procedure ENCMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ENCMapMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ENCMapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chklstAreaClickCheck(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure btnIncreaseClick(Sender: TObject);
    procedure btnDecreaseClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnZoomClick(Sender: TObject);
    procedure btnCenterOnGameCenterClick(Sender: TObject);
    procedure btnPanClick(Sender: TObject);

  private
    FSelectedGameArea : TGame_Environment_Definition;

    FListMapIndex : TStringList;
    FListFiltered : TStringList;
    FIsMouseDown : Boolean;

    startX, startY, endX, endY : Single;
    squareLeftLong, squareTopLatt, squareRightLong, squareBottomLatt : Double;

    FSelectionStartX, FSelectionStartY : single;
    FSelectionEndX, FSelectionEndY : single;

    FSelectionRectStart : TPoint;
    FSelectionRectEnd : TPoint;

    FCanvas : TCanvas;
    FConverter : TCoordConverter;
    FLyrDraw : CMapXLayer;
    FMap1 : TMap;

    FMapCursor : E_MapCursor;

    procedure LoadList;
    procedure SetChecked;
    procedure SetMapArea;
    procedure DrawCheckedLayer;
    procedure SelectionArea;
    procedure CreateGeosetFile;
    procedure UpdateGeosetFile;
    procedure DeleteGameAreaDirectory(const aPathName, aFileName: string);

    procedure LoadENC(ENCGeoset: string);
    procedure LoadNormalButtonImage;

  public
    xx, yy : Double;
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    procedure getGridCursorPos;

    function CekInput: Boolean;

    function GetGridLatt(yCursorPoint: Double): string;
    function GetGridLong(xCursorPoint: Double): string;

    property SelectedGameArea : TGame_Environment_Definition read FSelectedGameArea write FSelectedGameArea;
  end;

const
  DIMENSION = 1024;

var
  frmSummaryGameAreaEditor: TfrmSummaryGameAreaEditor;

implementation

uses
  uDataModuleTTT;
{$R *.dfm}

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).VType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

function SeparateString(const s: string; del: char; var s1, s2: string): boolean;
var
  i, l: integer;
begin
  result := false;
  l := Length(s);
  i := Pos(del, s);

  if (l < 2) or (i < 1) then
    Exit;

  s1 := Copy(s, 1, i - 1);
  s2 := Copy(s, i + 1, l - i);

  s1 := Trim(s1);
  s2 := Trim(s2);
  result := (s1 <> '') and (s2 <> '');
end;


{$REGION ' Form Handle '}

procedure TfrmSummaryGameAreaEditor.FormCreate(Sender: TObject);
var
  itemMaxWidth, i, itemWidth : Integer;
begin
  FListMapIndex := TStringList.Create;
  FListFiltered := TStringList.Create;
  FCanvas := TCanvas.Create;
  FConverter := TCoordConverter.Create;
  FMap1 := TMap.Create(Self);

  FListMapIndex.LoadFromFile(vAppDBSetting.MapENC + '\' + 'mapindex.ini');
  chklstArea.Items := FListMapIndex;

  //Set Checklist Area Width
  itemMaxWidth := 0;
  for i := 0 to chklstArea.Items.Count - 1 do
  begin
    itemWidth := chklstArea.Canvas.TextWidth(chklstArea.Items.Strings[i]);

    if itemWidth > itemMaxWidth then
      itemMaxWidth := itemWidth;
  end;
  SendMessage(chklstArea.Handle, LB_SETHORIZONTALEXTENT, itemMaxWidth + 20, 0);
end;

procedure TfrmSummaryGameAreaEditor.FormShow(Sender: TObject);
var
  i, itemMaxWidth, itemWidth : Integer;
  sourceCopy, destCopy : string;
begin
  LoadENC(vAppDBSetting.MapSourceGeosetENC);
  FConverter.FMap := ENCmap;

  btnSelectClick(nil);
  cbbScale.ItemIndex := cbbScale.Items.Count - 1;
  cbbScaleChange(cbbScale);

  with FSelectedGameArea.FGameArea do
  begin
    if Game_Area_Index = 0 then
      edtName.Text := '(Unnamed)'
    else
      edtName.Text := Game_Area_Identifier;

    LastName := edtName.Text;
  end;

  edtSearch.Text := '';

  ProgressBar1.Visible := True;

  ProgressBar1.Position := 0;
  for i := 0 to Random(80) do
    ProgressBar1.Position := i;

  LoadList;
  chklstArea.Items := FListMapIndex;
  SetChecked;
  SetMapArea;
  ProgressBar1.Position := 90;
  DrawCheckedLayer;

  ProgressBar1.Position := 100;
  ProgressBar1.Visible := False;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryGameAreaEditor.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSummaryGameAreaEditor.btnOkClick(Sender: TObject);
begin
  with FSelectedGameArea do
  begin
    if not CekInput  then
      Exit;

    if (FGameArea.Game_Centre_Lat = 0) or (FGameArea.Game_Centre_Long = 0) then
    begin
      ShowMessage('Game Center has not been set.');
      Exit;
    end;

    FGameArea.Game_Area_Identifier := edtName.Text;
    FGameArea.Game_X_Dimension := DIMENSION;
    FGameArea.Game_Y_Dimension := DIMENSION;
    FGameArea.Use_Real_World := 0;
    FGameArea.Use_Artificial_Landmass := 0;
    FGameArea.Detail_Map := 'ENC';

    {Buat Game Area Baru}
    if FGameArea.Game_Area_Index = 0 then
    begin
      dmTTT.InsertGameAreaDef(FGameArea);
      CreateGeosetFile;
    end
    {Update Game Area}
    else
    begin
      dmTTT.UpdateGameAreaDef(FGameArea);
      UpdateGeosetFile;
    end;
  end;

  AfterClose := True;
  Close;
end;

function TfrmSummaryGameAreaEditor.CekInput: Boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtName.Text = '')then
  begin
    ShowMessage('Please insert class name');
    Exit;
  end;

  {Jika berisi spasi semua}
  if Copy(edtName.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtName.Text);
    numSpace := 0;

    for i := 1 to chkSpace do
    begin
      if edtName.Text[i] = #32 then
      numSpace := numSpace + 1;
    end;

    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  {Jika Class Name sudah ada}
  if (dmTTT.GetGameAreaDef(edtName.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedGameArea.FGameArea.Game_Area_Index = 0 then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end
    else if LastName <> edtName.Text then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfrmSummaryGameAreaEditor.chklstAreaClickCheck(Sender: TObject);
var
  layerStr, layerID, layerName : string;
  i, foundIndex : Integer;
  layer : CMapXLayer;
begin
  layerStr := chklstArea.Items[chklstArea.ItemIndex];
  SeparateString(layerStr, '=', layerID, layerName);

  if FListFiltered.Find(layerID, foundIndex) then
    FListFiltered.Delete(foundIndex)
  else
    FListFiltered.Add(layerID);

  SetMapArea;

//  FListFiltered.Sort;
//
//  for i := 1 to ENCmap.Layers.Count do
//  begin
//    layer := ENCmap.Layers.Item(i);
//
//    if (layer.Name = 'Indonesia_Coastline_Darat') or (layer.Name = 'LYR_DRAW') then
//      Continue;
//
//    SeparateString(layer.Name, '_', layerID, layerName);
//
//    if FListFiltered.Find(layerID, foundIndex) then
//    begin
//      layer.OverrideStyle := True;
//      layer.Style.RegionColor := clRed;
//    end
//    else
//      layer.OverrideStyle := False;
//  end;
end;

{$ENDREGION}

{$REGION ' ToolBar Handle '}

procedure TfrmSummaryGameAreaEditor.btnIncreaseClick(Sender: TObject);
begin
  if cbbScale.ItemIndex = 0 then
    Exit;

  cbbScale.ItemIndex := cbbScale.ItemIndex - 1;
  cbbScaleChange(cbbScale);
end;

procedure TfrmSummaryGameAreaEditor.btnDecreaseClick(Sender: TObject);
begin
  if cbbScale.ItemIndex = 16 then
    Exit;

  cbbScale.ItemIndex := cbbScale.ItemIndex + 1;
  cbbScaleChange(cbbScale);
end;

procedure TfrmSummaryGameAreaEditor.cbbScaleChange(Sender: TObject);
var
  z : Double;
  s : string;
begin
  ENCmap.OnMapViewChanged := nil;

  if cbbScale.ItemIndex < 0  then Exit;

  if (cbbScale.ItemIndex <= 500) then
  begin
   s := cbbScale.Items[cbbScale.ItemIndex];
   try
     z := StrToFloat(s);
     ENCmap.ZoomTo(z, ENCmap.CenterX, ENCmap.CenterY);
   finally

   end;
  end
  else cbbScale.ItemIndex := cbbScale.ItemIndex -1 ;
//  ENCmap.OnMapViewChanged := ENCmapMapViewChanged;
end;

procedure TfrmSummaryGameAreaEditor.btnSelectClick(Sender: TObject);
begin
  LoadNormalButtonImage;
  FMapCursor := mcSelect;

  ENCmap.CurrentTool := miSelectTool;
  ENCmap.MousePointer := miDefaultCursor;

  btnSelect.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnCursor_Select.PNG');
end;

procedure TfrmSummaryGameAreaEditor.btnZoomClick(Sender: TObject);
begin
  LoadNormalButtonImage;
  FMapCursor := mcZoom;

  ENCmap.CurrentTool := miZoomInTool;
  ENCmap.MousePointer := miZoomInCursor;

  btnZoom.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnZoomIn_Select.PNG');
end;

procedure TfrmSummaryGameAreaEditor.btnCenterOnGameCenterClick(Sender: TObject);
begin
  LoadNormalButtonImage;
  FMapCursor := mcGameCenter;

  ENCmap.CurrentTool := miArrowTool;
  ENCmap.MousePointer := miCrossCursor;

  btnCenterOnGameCenter.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnCenterOnHook_Select.PNG');
end;

procedure TfrmSummaryGameAreaEditor.btnPanClick(Sender: TObject);
begin
  LoadNormalButtonImage;
  FMapCursor := mcPan;

  ENCmap.CurrentTool := miPanTool;
  ENCmap.MousePointer := miPanCursor;

  btnPan.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnMove_Select.PNG');
end;

procedure TfrmSummaryGameAreaEditor.LoadNormalButtonImage;
begin
  btnSelect.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnCursor_Normal.PNG');
  btnZoom.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnZoomIn_Normal.PNG');
  btnCenterOnGameCenter.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnCenterOnHook_Normal.PNG');
  btnPan.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnMove_Normal.PNG');
end;

{$ENDREGION}

{$REGION ' Map Handle '}

procedure TfrmSummaryGameAreaEditor.SelectionArea;
var
  startX, startY, endX, endY,
  i, foundIndex : Integer;
  startLat, startLong, endLat, endLong : Double;
  layer : CMapXLayer;
  layerID, layerName : string;
begin

  {$REGION ' Validation Point Cursor '}
  if FSelectionStartX < FSelectionEndX then
  begin
    startX := Round(FSelectionStartX);
    endX := Round(FSelectionEndX);
  end
  else
  begin
    startX := Round(FSelectionEndX);
    endX := Round(FSelectionStartX);
  end;

  if FSelectionStartY < FSelectionEndY then
  begin
    startY := Round(FSelectionStartY);
    endY := Round(FSelectionEndY);
  end
  else
  begin
    startY := Round(FSelectionEndY);
    endY := Round(FSelectionStartY);
  end;

  FConverter.ConvertToMap(startX, startY, startLong, startLat);
  FConverter.ConvertToMap(endX, endY, endLong, endLat);

  {$ENDREGION}

  {$REGION ' Select Area '}

  for i := 1 to ENCmap.Layers.Count do
  begin
    layer := ENCmap.Layers.Item(i);

    if (layer.Name = 'Indonesia_Coastline_Darat') or (layer.Name = 'LYR_DRAW') or (layer.Name = 'ID2000_land')then
      Continue;

    if FMapCursor = mcSelect then
    begin
      {$REGION ' Select Single Area '}
      if (startLong >= layer.Bounds.XMin) and (startLat <= layer.Bounds.YMax) and
        (endLong <= layer.Bounds.XMax) and (endLat >= layer.Bounds.YMin) then
      begin
        SeparateString(layer.Name, '_', layerID, layerName);

        if FListFiltered.Find(layerID, foundIndex) then
          FListFiltered.Delete(foundIndex)
        else
          FListFiltered.Add(layerID);
      end;
      {$ENDREGION}
    end
    else if FMapCursor = mcMultiSelect then
    begin
      {$REGION ' Select Multi Area '}
      if (layer.Bounds.XMin >= startLong) and (layer.Bounds.YMax <= startLat) and
        (layer.Bounds.XMax <= endLong) and (layer.Bounds.YMin >= endLat) then
      begin
        SeparateString(layer.Name, '_', layerID, layerName);

        if FListFiltered.Find(layerID, foundIndex) then
        begin
          FListFiltered.Delete(foundIndex);
//          layer.OverrideStyle := False;
        end
        else
        begin
          FListFiltered.Add(layerID);
//          layer.OverrideStyle := True;
//          layer.Style.RegionColor := clRed;
        end;
      end;
      {$ENDREGION}
    end;
  end;

  {$ENDREGION}

  SetChecked;
  SetMapArea;
end;

procedure TfrmSummaryGameAreaEditor.SetChecked;
var
  i, j : Integer;
  layerStr, layerID, layerName : string;
  checked : Boolean;
begin
  for i := 0 to chklstArea.Count - 1 do
  begin
    layerStr := chklstArea.Items[i];
    SeparateString(layerStr, '=', layerID, layerName);

    checked := False;
    for j := 0 to FListFiltered.Count - 1 do
    begin
      if FListFiltered[j] = layerID then
      begin
        checked := True;
        Break;
      end;
    end;

    chklstArea.Checked[i] := checked;
  end;
end;

procedure TfrmSummaryGameAreaEditor.SetMapArea;
var
  i, foundIndex : Integer;
  layerID, layerName : string;
  layer : CMapXLayer;
begin
  FListFiltered.Sort;

  for i := 1 to ENCmap.Layers.Count do
  begin
    layer := ENCmap.Layers.Item(i);

    if (layer.Name = 'Indonesia_Coastline_Darat') or (layer.Name = 'LYR_DRAW') then
      Continue;

    SeparateString(layer.Name, '_', layerID, layerName);

    if FListFiltered.Find(layerID, foundIndex) then
    begin
      layer.OverrideStyle := True;
      layer.Style.RegionColor := clRed;
    end
    else
      layer.OverrideStyle := False;
  end;
end;

procedure TfrmSummaryGameAreaEditor.UpdateGeosetFile;
var
  MapDirPath : string;
begin
  MapDirPath := vAppDBSetting.MapGSTGame + '\' + LastName;
  DeleteGameAreaDirectory(MapDirPath, MapDirPath);
  CreateGeosetFile;
end;

procedure TfrmSummaryGameAreaEditor.CreateGeosetFile;
var
  myFile : TextFile;
  i, j : Integer;
  fileSource, fileDest : string;
  dirP   : string;

  indx   : string;
  mtype  : string;
  ProgressPos : Integer;

begin
  AssignFile(myFile, 'ConfigureLayerENC.txt');
  ReWrite(myFile);

  for i := 0 to FListFiltered.Count - 1 do
    Writeln(myFile, FListFiltered[i]);

  CloseFile(myFile);

  dirP := vAppDBSetting.MapGSTGame + '\' + edtName.Text;
  CreateDir(dirP);

  fileSource := ExtractFilePath(ParamStr(0)) + '\ConfigureLayerENC.txt';
  fileDest := dirP + '\' + edtName.Text + '.txt';

  CopyFile(PChar(fileSource), PChar(fileDest), False);

  FMap1.Layers.RemoveAll;

  ProgressBar1.Visible := True;
  ProgressBar1.Position := 0;

  if FListFiltered.Count > 0 then
    ProgressPos := Round(100/FListFiltered.Count)
  else
  begin
    for j := 0 to Random(80) do
      ProgressBar1.Position := j;
  end;

  {Memaksa memberi background indonesia}
  fileDest := vAppDBSetting.Pattern;
  FMap1.Layers.AddGeoSetLayers(fileDest);

  for i := 0 to FListFiltered.Count - 1 do
  begin
    if SeparateString(FListFiltered.Strings[I], '\', indx, mtype)then
    begin
      fileDest := vAppDBSetting.MapTypePath + '\' + mtype + '\' + indx + '\' + indx + '.gst';
    end
    else
    begin
      fileDest := vAppDBSetting.MapTypePath + '\_MAP_ENC\' + FListFiltered[i] + '\' + FListFiltered[i] + '.gst';
    end;

    FMap1.Layers.AddGeoSetLayers(fileDest);

    ProgressBar1.Position := ProgressBar1.Position + ProgressPos;
  end;

  fileDest := dirP + '\' + edtName.Text + '.gst';
  FMap1.SaveMapAsGeoset('final', fileDest);

  ProgressBar1.Position := 100;
  ProgressBar1.Visible := False;
end;

procedure TfrmSummaryGameAreaEditor.DeleteGameAreaDirectory(const aPathName, aFileName: string);
var
  F : TSearchRec;
begin
  if FindFirst(aFileName + '*.*', faAnyFile, F) = 0 then
  begin
    try
      repeat
        if (F.Attr and faDirectory <> 0) then
        begin
          if (F.Name <> '.') and (F.Name <> '..') then
            DeleteGameAreaDirectory(aPathName, aFileName + '\' + F.Name);
        end
        else
          DeleteFile(aPathName + '\' + F.Name);
      until FindNext(F) <> 0;
    finally
      FindClose(F);
    end;

    RemoveDir(aPathName);
  end;
end;

procedure TfrmSummaryGameAreaEditor.DrawCheckedLayer;
var
  i, j : Integer;
  layer : CMapXLayer;
  layerID, layerName : string;
begin
  for i := 1 to ENCmap.Layers.Count do
  begin
    layer := ENCmap.Layers.Item(i);

    if (layer.Name = 'Indonesia_Coastline_Darat') or
      (layer.Name = 'LYR_DRAW') then
      Continue;

    if SeparateString(layer.Name, '_', layerID, layerName) then
    begin
      for j := 0 to FListFiltered.Count - 1 do
      begin
        if FListFiltered[j] = layerID then
        begin
          layer.OverrideStyle := True;
          layer.Style.RegionColor := clRed;
        end;
      end;
    end;
  end;
end;

procedure TfrmSummaryGameAreaEditor.edtSearchKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
  str_details, str_id : string;
begin
  if Key = #13 then
  begin
    chklstArea.Items.Clear;

    if edtSearch.Text = '' then
      chklstArea.Items := FListMapIndex
    else
    begin
      for i := 0 to FListMapIndex.Count - 1 do
      begin
        if Pos(edtSearch.Text, FListMapIndex[i]) <> 0 then
          chklstArea.Items.Add(FListMapIndex[i]);
      end;
    end;
    SetChecked;
  end;
end;

procedure TfrmSummaryGameAreaEditor.ENCMapDrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull,
  RectInvalid: IDispatch);
begin
  with FCanvas do
  begin
    Handle := hOutputDC;

    if FIsMouseDown then
    begin
      Pen.Color := clYellow;
      Pen.Width := 3;
      Brush.Style := bsClear;
      Rectangle(Round(FSelectionStartX), Round(FSelectionStartY), Round(FSelectionEndX), Round(FSelectionEndY));
//      Rectangle(FSelectionStartX, FSelectionStartY), Round(FSelectionEndX), Round(FSelectionEndY));
    end;
  end;
end;

procedure TfrmSummaryGameAreaEditor.ENCMapMapViewChanged(Sender: TObject);
var
  tempZoom : double;
begin
  if (ENCmap.CurrentTool = miZoomInTool)  or (ENCmap.CurrentTool = miZoomOutTool) then
  begin
     if ENCmap.Zoom <= 0.125 then tempZoom := 0.125;
     if (ENCmap.Zoom > 0.125) AND (ENCmap.Zoom < 1) then tempZoom := ENCmap.Zoom;
     if (ENCmap.Zoom >= 1) AND (ENCmap.Zoom <= 2500) then tempZoom := round(ENCmap.Zoom);
     if ENCmap.Zoom > 2500 then tempZoom := 2500;

     ENCmap.OnMapViewChanged := nil;
     ENCmap.ZoomTo(tempZoom, ENCmap.CenterX, ENCmap.CenterY);

     if (ENCmap.Zoom > 0.125) AND (ENCmap.Zoom < 0.25) then
     begin
       cbbScale.Text := FormatFloat('0.000', tempZoom);
     end
     else if (ENCmap.Zoom >= 0.25) AND (ENCmap.Zoom < 0.5) then
     begin
       cbbScale.Text := FormatFloat('0.00', tempZoom);
     end
     else if (ENCmap.Zoom >= 0.5) AND (ENCmap.Zoom < 1) then
     begin
       cbbScale.Text := FormatFloat('0.0', tempZoom);
     end
     else
       cbbScale.Text := floattostr(tempZoom);

     ENCmap.OnMapViewChanged := ENCmapMapViewChanged;
  end;
end;

procedure TfrmSummaryGameAreaEditor.ENCMapMouseDown(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  castX, castY : single;
  i : Integer;
  layer : CMapXLayer;
begin

  {$Region ' Select '}
  if FMapCursor = mcSelect then
  begin
    FSelectionStartX := X;
    FSelectionStartY := Y;
    FSelectionEndX := X;
    FSelectionEndY := Y;
  end;
  {$ENDREGION}

  {$Region ' Multiselect '}
  if FMapCursor = mcMultiSelect then
  begin
    FIsMouseDown := True;

    FListFiltered.Clear;

    FSelectionStartX := X;
    FSelectionStartY := Y;
    FSelectionEndX := X;
    FSelectionEndY := Y;

//    for i := 1 to ENCmap.Layers.Count do
//    begin
//      layer := ENCmap.Layers.Item(i);
//
//      if (layer.Name = 'Indonesia_Coastline_Darat') or (layer.Name = 'LYR_DRAW') then
//        Continue;
//
//      layer.OverrideStyle := False;
//    end;
//
//    ENCmap.Repaint;
  end;
  {$ENDREGION}

  {$Region ' Set Game Center '}

  if FMapCursor = mcGameCenter then
  begin

    FConverter.ConvertToMap(X, Y, FSelectedGameArea.FGameArea.Game_Centre_Long, FSelectedGameArea.FGameArea.Game_Centre_Lat);

    with pickpoint do
    begin
      edtlattitude.Text := formatDMS_latt(FSelectedGameArea.FGameArea.Game_Centre_Lat);
      edtlongtitude.Text := formatDMS_long(FSelectedGameArea.FGameArea.Game_Centre_Long);

      Show;

      if not isCancel then
      begin
        FSelectedGameArea.FGameArea.Game_Centre_Lat := dmsToLatt(edtlattitude.Text);
        FSelectedGameArea.FGameArea.Game_Centre_Long := dmsToLong(edtlongtitude.Text);
      end;
    end;
  end;
  {$ENDREGION}
end;

procedure TfrmSummaryGameAreaEditor.ENCMapMouseMove(Sender: TObject;Shift: TShiftState; X, Y: Integer);
var
  centerX, centerY : Double;

begin
//  if (FMapCursor = mcMultiSelect) and FIsMouseDown then
//  begin
//    FSelectionEndX := X;
//    FSelectionEndY := Y;
//
//    ENCmap.Repaint;
//  end;

  FConverter.ConvertToMap(X, Y, xx, yy);

  centerX := FSelectedGameArea.FGameArea.Game_Centre_Long;
  centerY := FSelectedGameArea.FGameArea.Game_Centre_Lat;


  lblBearing.Caption := FormatFloat('0.00', CalcBearing(centerX, centerY, xx, yy));
  lblDistance.Caption := FormatFloat('0.00',CalcRange(centerX, centerY, xx, yy));
  getGridCursorPos;

end;

procedure TfrmSummaryGameAreaEditor.getGridCursorPos;
var
  yCursorPoint, xCursorPoint, yCenter, xCenter, diffX, diffY: Double;
  diffXnm, diffYnm: Double;
  gridLatt, gridLong, addStringX, addStringY: string;
begin
  yCursorPoint := yy;
  xCursorPoint := xx;

  yCenter := ENCMap.CenterX;
  xCenter := ENCMap.CenterY;

  diffY := Abs(yCursorPoint - yCenter);
  diffX := Abs(xCursorPoint - xCenter);

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

  lbSlPosition.Caption := formatDMS_latt(yy);
  lblWPosition.Caption := formatDMS_long(xx);

  gridLatt := FormatFloat('0.00', diffYnm);
  gridLong := FormatFloat('0.00', diffXnm);
end;

function TfrmSummaryGameAreaEditor.GetGridLatt(yCursorPoint: Double): string;
var
  yCenter, diffY, diffYnm: Double;
  gridLatt, addStringY: string;
begin
  // yCenter  := ufrmSummaryOverlay.frmSummaryOverlay.GameArea.FGameArea.Game_Centre_Lat;
  diffY := Abs(yCursorPoint - yCenter);
  diffYnm := diffY * 60;
  if yCursorPoint < yCenter then
    addStringY := 'S'
  else
    addStringY := 'N';
  gridLatt := FormatFloat('0.00', diffYnm);
  Result := gridLatt + ' nm ' + addStringY;
end;

function TfrmSummaryGameAreaEditor.GetGridLong(xCursorPoint: Double): string;
var
  xCenter, diffX, diffXnm: Double;
  gridLong, addStringX: string;
begin
  // xCenter := ufrmSummaryOverlay.frmSummaryOverlay.GameArea.FGameArea.Game_Centre_Long;
  diffX := Abs(xCursorPoint - xCenter);
  diffXnm := diffX * 60;
  if xCursorPoint < xCenter then
    addStringX := 'W'
  else
    addStringX := 'E';
  gridLong := FormatFloat('0.00', diffXnm);
  Result := gridLong + ' nm ' + addStringX;;
end;

procedure TfrmSummaryGameAreaEditor.ENCMapMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FMapCursor = mcSelect then
  begin
    SelectionArea;
    ENCmap.Repaint;
  end;

  if (FMapCursor = mcMultiSelect) and FIsMouseDown then
  begin
    FIsMouseDown := False;
//    FSelectionRectEnd := Point(X, Y);
    FSelectionEndX := X;
    FSelectionEndY := Y;
    SelectionArea;
    ENCmap.Repaint;
  end;
end;

procedure TfrmSummaryGameAreaEditor.LoadENC(ENCGeoset: string);
var
  z : OleVariant;
  i : Integer;
  mInfo : CMapXLayerInfo;
begin
  if ENCmap = nil then
    Exit;

  InitOleVariant(z);
  ENCmap.Layers.RemoveAll;
  ENCmap.Geoset := ENCGeoset;

  if ENCGeoset <> '' then
  begin
    for i := 1 to ENCmap.Layers.Count do
    begin
      ENCmap.Layers.Item(i).Selectable := False;
      ENCmap.Layers.Item(i).Editable := False;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := ENCmap.Layers.Add(mInfo, 1);

    ENCmap.Layers.AnimationLayer := FLyrDraw;
    ENCmap.MapUnit := miUnitNauticalMile;
  end;

  ENCmap.BackColor := RGB(192, 224, 255);
end;

{$ENDREGION}

{$REGION ' File Handle '}

procedure TfrmSummaryGameAreaEditor.LoadList;
var
  pathConFile, nameGameArea : string;
begin
  FListFiltered.Clear;

  if Assigned(FSelectedGameArea) then
  begin
    nameGameArea := FSelectedGameArea.FGameArea.Game_Area_Identifier;
    pathConFile := vAppDBSetting.MapGSTGame + '\' + nameGameArea;

//    nameGameArea := FSelectedGameArea.FGameArea.Game_Area_Identifier + '\' + FSelectedGameArea.FGameArea.Game_Area_Identifier + '.txt';

    if FileExists(pathConFile + '\' + nameGameArea  + '.txt') then
      FListFiltered.LoadFromFile(pathConFile + '\' + nameGameArea  + '.txt');
  end;
end;

{$ENDREGION}

end.
