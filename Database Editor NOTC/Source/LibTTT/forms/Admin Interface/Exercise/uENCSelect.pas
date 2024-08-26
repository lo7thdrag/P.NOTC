unit uENCSelect;

interface

uses
  Types, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, MapXLib_TLB, ExtCtrls, CheckLst, StrUtils,
  uDBAsset_GameEnvironment, ImgList, ComCtrls, ToolWin, uCoordConvertor, Buttons,
  SpeedButtonImage, ShellAPI, System.ImageList;

type
  TENCSelect = class(TForm)
    pnlLeft: TPanel;
    ENCmap: TMap;
    btnOk: TButton;
    btnCancel: TButton;
    ImageList1: TImageList;
    grpName: TGroupBox;
    pnlTop: TPanel;
    ToolBar1: TToolBar;
    btnNormal: TToolButton;
    btnPan: TToolButton;
    toolbtnDecreaseScale: TToolButton;
    cbSetScale: TComboBox;
    toolbtnIncreaseScale: TToolButton;
    btnZoom: TToolButton;
    btnDragFilter: TToolButton;
    btnFilter: TToolButton;
    GroupBox2: TGroupBox;
    areaList: TCheckListBox;
    edtSearch: TEdit;
    lblSearch: TStaticText;
    cbbMapType: TComboBox;
    txtMapType: TStaticText;
    grp1: TGroupBox;
    selectedAreaList: TCheckListBox;
    txtName: TStaticText;
    edtName: TEdit;
    btnUP: TButton;
    btnDOWN: TButton;
    btn1: TButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    btnZoomOut: TToolButton;
//    Label1: TLabel;
//    edtLatt: TEdit;
//    Label2: TLabel;
//    Label3: TLabel;
//    edtLong: TEdit;
//    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure getData;
    procedure btnPanClick(Sender: TObject);
    procedure btnZoomClick(Sender: TObject);
    procedure toolbtnIncreaseScaleClick(Sender: TObject);
    procedure cbSetScaleChange(Sender: TObject);
    procedure toolbtnDecreaseScaleClick(Sender: TObject);
    procedure ENCmapMapViewChanged(Sender: TObject);
    procedure btnNormalClick(Sender: TObject);
    procedure ENCmapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure areaListMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
//    procedure areaListClickCheck(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnDragFilterClick(Sender: TObject);
    procedure ENCmapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Cardinal; const RectFull,
      RectInvalid: IDispatch);
    procedure ENCmapMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ENCmapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure areaListClickCheck(Sender: TObject);
    procedure cbbMapTypeChange(Sender: TObject);
    procedure selectedAreaListClickCheck(Sender: TObject);
    procedure SpeedButtonImageClick(Sender: TObject);
    procedure SpeedButtonImage61Click(Sender: TObject);
    procedure btnUPClick(Sender: TObject);
    procedure btnDOWNClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnZoomOutClick(Sender: TObject);
  const
//    DIMENSION = 2048;
    DIMENSION = 1024;
  private
    { Private declarations }
    tempName : array of string;

    isDown : Boolean;

    startX, startY, endX, endY : Single;
    squareLeftLong, squareTopLatt, squareRightLong, squareBottomLatt : Double;

    procedure selectionArea;
    procedure defaultButton;

    procedure showAllList(mtype: string);
    procedure fillAreaList;

    procedure selectedArea;
    procedure selectRedArea;

    {get map type}
    procedure GetSubDirectories(const dir : string; list : TStrings);
  public
    { Public declarations }

    isCopy, isEdit : Boolean;
    lastGameAreaName    : string;

    keywords            : string;

    FCanvas             : TCanvas;
    FLyrDraw            : CMapXLayer;
    coverage            : string;
    coverageAreas       : Array[1..300] of string;
    tandai              : array[1..300] of integer;
    map1                : TMap;
    Xcenter, Ycenter    : double;
    game_envi           : TGame_Environment_Definition;
    idGameArea          : Integer;
    FCoordPlatformConv  : TCoordConverter;

    ListFiltered : TStringList;
    ListMapIndex : TStringList;
    ListPrint    : TStringList;
    ListSelectedArea : TStringList;
    ListMapType  : TStringList;

    List_id, List_details : TStringList;

    path_mapIndex, path_confLayerENC, path_mapLayers : string;
    strConfLayerENC : string;

    { long, latt when map mouse down }
    Longitude, Lattitude : Double;

    procedure defaultPath;

    procedure loadENC(ENCGeoset : string);
    procedure load_MAP_(Geoset : string);
    procedure insert;
    procedure update;
    procedure setChecked;
    procedure drawCheckedLayer;

    procedure loadList;

    procedure Split (const Delimiter: Char; Input: string; const Strings: TStrings) ;
    function CopyDir(const fromDir, toDir: string): Boolean;
  end;

var
  ENCSelect: TENCSelect;

implementation

uses
  uMapXHandler, uDataModuleTTT, uDBEditSetting, uSimDBEditor, ufrmAvailableGameArea,
  uExerciseArea, uBaseCoordSystem, uMLayerSelect;

{$R *.dfm}

procedure TENCSelect.defaultPath;
begin
  path_mapIndex     := vAppDBSetting.MapENC + '\' + 'mapindex.ini';
  path_confLayerENC := ExtractFilePath(Application.ExeName) + '\ConfigureLayerENC.txt';
  strConfLayerENC   := 'ConfigureLayerENC.txt';
end;

procedure TENCSelect.defaultButton;
begin
  btnNormal.Down            := false;
  btnPan.Down               := false;
  toolbtnDecreaseScale.Down := False;
  toolbtnIncreaseScale.Down := false;
  btnZoom.Down              := False;
  btnDragFilter.Down        := false;
  btnFilter.Down            := False;
end;

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

function SeparateString(const s: string; del: char; var s1, s2: string): boolean;
var
  i, l: integer;
begin
  result := false;
  l := Length(s);
  i := Pos(del, s);
  if (l < 2) or (i < 1) then exit;

  s1 := Copy(s, 1, i - 1);
  s2 := Copy(s, i + 1, l - i);

  s1 := Trim(s1);
  s2 := Trim(s2);
  result := (s1 <> '') and (s2 <> '');
end;

procedure TENCSelect.areaListClickCheck(Sender: TObject);
var
  I, J, K : Integer;
  total : Integer;
  flagAdd : Boolean;

  lyr : CMapXLayer;
  s1, s2 : string;
begin
  total   := ListFiltered.Count;
  flagAdd := False;

  for I := 0 to areaList.Count - 1 do
  begin
    if areaList.Checked[I] then
    begin
      for J := 0 to List_details.Count - 1 do
      begin
        if areaList.Items.Strings[I] = List_details[J] then
        begin
          if total = 0 then
          begin
            ListFiltered.Add(List_id[J]);
            ListMapType.Add(cbbMapType.Text);
          end
          else
          begin
            for K := 0 to total - 1 do
            begin
              if List_id[J] <> ListFiltered[K] then
              begin
                flagAdd := True;
              end
              else
              begin
                flagAdd := False;

                Break;
              end;
            end;

            if flagAdd then
            begin
              ListFiltered.Add(List_id[J]);
              ListMapType.Add(cbbMapType.Text);
            end;
          end;
        end;
      end;
    end
    else
    begin
      total := ListFiltered.Count;
      for J := 0 to List_details.Count - 1 do
      begin
        if areaList.Items.Strings[I] = List_details[J] then
        begin
          for K := 0 to total - 1 do
          begin
            if List_id[J] = ListFiltered[K] then
            begin
              ListFiltered.Delete(K);
              ListMapType.Delete(K);
              Break;
            end;
          end;
        end;
      end;
    end;
  end;

  // Modified and added by sidami
  selectRedArea;
  selectedArea;
end;

procedure TENCSelect.areaListMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
//  var lstIndex : Integer ;
begin
//   with areaList do
//   begin
//     lstIndex := SendMessage(Handle, LB_ITEMFROMPOINT, 0, MakeLParam(x,y)) ;
//     if (lstIndex >= 0) and (lstIndex <= Items.Count) then
//       Hint := tempName[lstIndex]{Items.Strings[lstIndex] }
//     else
//       Hint := ''
//   end;
end;

//procedure TENCSelect.areaListClickCheck(Sender: TObject);
//var
//  myFile : TextFile;
//  lyr    : CMapXLayer;
//
//  i, j, m{, n} : Integer;
//  fileData   : TStringList;
//  str_details, str_id : string;
//
//	pathConFile, nameGameArea, st : string;
//  ssLayer : TStringList;
//
////  {, teList2} : TStringList;
//  founded : array of Boolean;
//  isAvailable : array of Boolean;
//begin
//
//  ListChecked.Clear;
////  teList2 := TStringList.Create;
//
//  { ConfigureLayerENC.txt }
//  coverage := '_area_coverage';
//  AssignFile(myFile, strConfLayerENC);
//  ReWrite(myFile);
//
//  fileData := TStringList.Create;
//  fileData.LoadFromFile(path_mapIndex);
//
//  if uGameAreaList.fGameAreaList.flagIsNew = false then
//  begin
//    pathConFile  := vAppDBSetting.MapDestPathENC + '\';
//    ssLayer      := TStringList.Create;
//    nameGameArea := fGameAreaList.lbScenarioList.Items.Strings[fGameAreaList.lbScenarioList.ItemIndex] + '.txt';
//    if FileExists(pathConFile + nameGameArea) then
//      ssLayer.LoadFromFile(pathConFile + nameGameArea)
//    else
//      Exit;
//  end;
//
//  for I := 0 to areaList.Items.Count - 1 do
//  begin
//    if areaList.Checked[i] then
//    begin
//      for j := 0 to fileData.Count - 1 do
//      begin
//        SeparateString(fileData[j], '=', str_details, str_id);
//        if str_details = areaList.Items.Strings[i] then
//        begin
//          for m := 1 to ENCmap.Layers.Count do
//          begin
//            if str_id + coverage = ENCmap.Layers.Item(m).Name then
//            begin
//              ENCmap.Layers.Item(m).OverrideStyle := true;
//              lyr := ENCmap.Layers.Item(m);
//              lyr.Style.RegionColor := clRed;
////              lyr.Bounds.YMin
////              Writeln(myFile, str_id);
//              ListChecked.Add(str_id);
//            end;
//          end;
//        end;
//      end;
//    end
//    else
//    begin
//      for j := 0 to fileData.Count - 1 do
//      begin
//        SeparateString(fileData[j], '=', str_details, str_id);
//        if str_details = areaList.Items.Strings[i] then
//        begin
//          for m := 1 to ENCmap.Layers.Count do
//          begin
//            if str_id + coverage = ENCmap.Layers.Item(m).Name then
//            begin
//              ENCmap.Layers.Item(m).OverrideStyle := false;
//              lyr := ENCmap.Layers.Item(m);
//            end;
//          end;
//        end;
//      end;
//    end;
//  end;
//
//  if uGameAreaList.fGameAreaList.flagIsNew then
//  begin
//    for I := 0 to ListChecked.Count - 1 do
//      Writeln(myFile, ListChecked[I]);
//  end;
//
//  if uGameAreaList.fGameAreaList.flagIsNew = false then
//  begin
//    SetLength(founded, ListChecked.Count);
//    for I := 0 to ListChecked.Count - 1 do
//      founded[I] := false;
//
//    for I := 0 to ListChecked.Count - 1 do
//    begin
//      for J := 0 to ssLayer.Count - 1 do
//      begin
//        if ListChecked[I] = ssLayer[J] then
//        begin
//          founded[I] := True;
//          Break;
//        end;
//      end;
//    end;
//
//    for I := 0 to ListChecked.Count - 1 do
//      if not founded[I] then
//        Writeln(myFile, ListChecked[I]);
//
//    SetLength(isAvailable, ssLayer.Count);
//    for I := 0 to ssLayer.Count - 1 do
//    begin
//      for J := 0 to ListChecked.Count - 1 do
//      begin
//        if ssLayer[I] = ListChecked[J] then
//          isAvailable[I] := True;
//      end;
//    end;
//
//    for I := 0 to ssLayer.Count - 1 do
//    begin
//      if isAvailable[I] then
//        Writeln(myFile, ssLayer[I]);
//    end;
//  end;
//
//  CloseFile(myFile);
//end;

procedure TENCSelect.btnUPClick(Sender: TObject);
var
  i,j, indx: Integer;
  str1, str2, str3 : string;
  listtemp : TStringList;
begin
  if selectedAreaList.ItemIndex = 0 then
    Exit;

  selectedAreaList.Items.Exchange(selectedAreaList.ItemIndex, selectedAreaList.ItemIndex - 1);

  listtemp := TStringList.Create;

  for i := 0 to selectedAreaList.Count - 1 do
  begin
    str1 := selectedAreaList.Items.Strings[i];

    for j := 0 to ListSelectedArea.Count - 1 do
    begin
      if SeparateString(ListSelectedArea.Strings[j], '\', str2, str3) then
      begin
        if str2 = str1 then
        begin
          listtemp.Add(ListSelectedArea.Strings[j]);
        end;
      end;
    end;
  end;

  ListSelectedArea.Clear;

  for j := 0 to listtemp.Count - 1 do
  begin
    ListSelectedArea.Add(listtemp.Strings[j]);
  end;

end;

procedure TENCSelect.btnDOWNClick(Sender: TObject);
var
  i,j, indx: Integer;
  str1, str2, str3 : string;
  listtemp : TStringList;
begin
  if selectedAreaList.ItemIndex = selectedAreaList.Count - 1 then
    Exit;

  selectedAreaList.Items.Exchange(selectedAreaList.ItemIndex, selectedAreaList.ItemIndex + 1);

  listtemp := TStringList.Create;

  for i := 0 to selectedAreaList.Count - 1 do
  begin
    str1 := selectedAreaList.Items.Strings[i];

    for j := 0 to ListSelectedArea.Count - 1 do
    begin
      if SeparateString(ListSelectedArea.Strings[j], '\', str2, str3) then
      begin
        if str2 = str1 then
        begin
          listtemp.Add(ListSelectedArea.Strings[j]);
        end;
      end;
    end;
  end;

  ListSelectedArea.Clear;

  for j := 0 to listtemp.Count - 1 do
  begin
    ListSelectedArea.Add(listtemp.Strings[j]);
  end;

end;

procedure TENCSelect.btn1Click(Sender: TObject);
var
  I      : Integer;
  files  : string;
  dirP   : string;
  indx   : string;
  mtype  : string;
  vHelpFile, vHelpID : OleVariant;
  mapTemp : TMap;
begin
  dirP := vAppDBSetting.MapGSTGame + '\' + edtName.Text;
  try
    mapTemp := TMap.Create(self);

    mapTemp.Geoset := '';
    mapTemp.Refresh;

    for I := 0 to ListSelectedArea.Count - 1 do
    begin
      if SeparateString(ListSelectedArea.Strings[I], '\', indx, mtype)then
      begin
        if selectedAreaList.Selected[I] then
        begin
          if selectedAreaList.Items.Strings[I] = indx then
          begin
            files := vAppDBSetting.MapTypePath + '\' + mtype + '\' + indx + '\' + indx + '.gst';
            mapTemp.Layers.AddGeoSetLayers(files);

            mapTemp.DisplayCoordSys.PickCoordSys(vHelpFile, vHelpID);

            mapTemp.SaveMapAsGeoset(indx, files);

            Break;
          end;
        end;
      end;
    end;
  except
    MessageDlg('Change Another Category',mtWarning,mbOKCancel,0);
  end;

end;

procedure TENCSelect.btnCancelClick(Sender: TObject);
begin
  self.Close;

  cbbMapType.Clear;
  ListFiltered.Clear;
  ListMapType.Clear;
  selectedAreaList.Clear;
  areaList.Clear;

  isCopy := False;
//  ufrmAvailableGameArea.frmAvailableGameArea.flagIsNew := True;
end;

procedure TENCSelect.insert;
begin
  with game_envi.FGameArea do
  begin
    Xcenter := Longitude;
    Ycenter := Lattitude;

    // Modified by sidami
//    Detail_Map           := 'ENC';
    Detail_Map           := '';
    Game_Area_Identifier := edtName.Text;
    Game_Centre_Lat      := Ycenter;
    Game_Centre_Long     := Xcenter;
    Game_X_Dimension     := ENCmap.Zoom; //DIMENSION;
    Game_Y_Dimension     := ENCmap.Zoom; //DIMENSION;

    with SIMMgr do
    begin
      idGameArea := insertGameAreaDef(game_envi);
      game_envi.FGameArea.Game_Area_Index := idGameArea;
    end;
  end;
end;

procedure TENCSelect.update;
begin
  with game_envi.FGameArea do
  begin
//    if idGameArea <> 0 then
//       game_envi.FGameArea.Game_Area_Index := idGameArea
//    else
//       game_envi.FGameArea.Game_Area_Index := ufrmAvailableGameArea.frmAvailableGameArea.gameAreaIndex;

//    Longitude := dmToLongitude(edtLong.Text);
//    Lattitude := dmToLatitude(edtLatt.Text);

    Xcenter := Longitude;
    Ycenter := Lattitude;

    // Modified by sidami
//    Detail_Map           := 'ENC';
    Detail_Map           := '';
    Game_Area_Identifier := edtName.Text;
    Game_Centre_Lat      := Ycenter;
    Game_Centre_Long     := Xcenter;
    Game_X_Dimension     := ENCmap.Zoom; //DIMENSION;
    Game_Y_Dimension     := ENCmap.Zoom; //DIMENSION;

    with SIMMgr do
    begin
      updateGameAreaDef(game_envi, IntToStr(game_envi.FGameArea.Game_Area_Index));
      ShowMessage('Update Success ' + gameEnvironment.FGameArea.Game_Area_Identifier);
    end;
  end;
end;

procedure TENCSelect.btnOkClick(Sender: TObject);
var
  I      : Integer;
  files  : string;
  LstLayer: TStringList;
  dirP   : string;
  myFile : TextFile;
  mapGeo : string;
  fileDest : String;
  indx   : string;
  mtype  : string;
  sourceCopy, destCopy : string;
  flag : Boolean;
begin
  // Modified by sidami
  AssignFile(myFile, strConfLayerENC);
  ReWrite(myFile);
  for I := 0 to ListSelectedArea.Count - 1 do
    Writeln(myFile, ListSelectedArea[I] {+ '\' + ListMapType[I]});
  CloseFile(myFile);

  dirP := vAppDBSetting.MapGSTGame + '\' + edtName.Text;

  if isCopy then
  begin
    sourceCopy := vAppDBSetting.MapGSTGame + '\' + lastGameAreaName ;
    destCopy   := vAppDBSetting.MapGSTGame + '\' + edtName.Text ;

    if DirectoryExists(destCopy) then
      Exit
    else
      CreateDir(destCopy);

    CopyFile(PChar(sourceCopy + '\' + lastGameAreaName + '.gst'), PChar(destCopy + '\' + edtName.Text + '.gst'), False);
    CopyFile(PChar(sourceCopy + '\' + lastGameAreaName + '.txt'), PChar(destCopy + '\' + edtName.Text + '.txt'), False);
  end
  else
  begin
    { copy configurelayerENC.txt to nameOfGame.txt }
    if DirectoryExists(dirP) and isEdit then
    begin
      if FileExists(dirP + '\'+ edtName.Text + '.txt') then
      begin
        DeleteFile(dirP + '\'+ edtName.Text + '.txt');
        fileDest   := dirP + '\'+ edtName.Text + '.txt';
        CopyFile(PChar(path_confLayerENC), PChar(fileDest), False);
      end;
    end
    else if DirectoryExists(dirP) then
    begin
      ShowMessage('The Name already Exist, Try Another Name');
      Exit;
    end
    else
    begin
      CreateDir(dirP);

      if FileExists(dirP + '\'+ edtName.Text + '.txt') then
      begin
        DeleteFile(dirP + '\'+ edtName.Text + '.txt');
        fileDest   := dirP + '\'+ edtName.Text + '.txt';
        CopyFile(PChar(path_confLayerENC), PChar(fileDest), False);
      end
      else
      begin
        fileDest   := dirP + '\'+ edtName.Text + '.txt';
        CopyFile(PChar(path_confLayerENC), PChar(fileDest), False);
      end;
    end;

    try
      Map1 := TMap.Create(self);

      Map1.Geoset := '';
      map1.SearchPath := vAppDBSetting.MapTypePath + '\' + cbbMapType.Text;
      map1.Refresh;

      LstLayer := TStringList.Create;

      for I := ListSelectedArea.Count - 1 downto 0  do
      begin
        if SeparateString(ListSelectedArea.Strings[I], '\', indx, mtype)then
        begin
          files := vAppDBSetting.MapTypePath + '\' + mtype + '\' + indx + '\' + indx + '.gst';
          Map1.Layers.AddGeoSetLayers(files);

          LstLayer.Add(vAppDBSetting.MapTypePath + '\' + mtype + '\' + indx);
        end;
      end;

      files := dirP + '\' + edtName.Text + '.gst';
      Map1.SaveMapAsGeoset('final', files );
    except
      MessageDlg('Saving process was canceled by system. Please restart your system',mtWarning,mbOKCancel,0);
    end;
  end;

//  if ufrmAvailableGameArea.frmAvailableGameArea.flagIsNew then
//  begin
//    insert;
//  end
//  else
//    update;

  case MessageDlg('Do you want to re-arrange your map layers?',mtConfirmation,[mbYes, mbNo],0) of
    mrYes :
    begin
      MLayerSelect.lblName.Caption := edtName.Text;
      MLayerSelect.FillTheList(ListSelectedArea);
      MLayerSelect.Show;
    end;

    mrNo : Close;
  end;

  frmAvailableGameArea.refresh;

  ListFiltered.Clear;
  ListMapType.Clear;
  selectedAreaList.Clear;

  Close;
end;

procedure TENCSelect.getData;
begin
  with game_envi.FGameArea do begin
    Game_Area_Identifier  := edtName.Text;
    Detail_Map            := 'ENC';
  end;
end;

procedure TENCSelect.GetSubDirectories(const dir: string; list: TStrings);
var
  sr : TSearchRec;
  str : string;
begin
  try
    if FindFirst(IncludeTrailingPathDelimiter(dir)+'*.*', faDirectory, sr) < 0 then
      Exit
    else
    begin
      repeat
        if ((sr.Attr and faDirectory <> 0) and (sr.Name <> '.') and (sr.Name <> '..')) then
        begin
          str := LeftStr(sr.Name,5);

          if str = '_MAP_' then
            list.Add(sr.Name);
        end;

      until FindNext(sr) <> 0;
    end;
  finally
    SysUtils.FindClose(sr);
  end;

end;

procedure TENCSelect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.Close;

  cbbMapType.Clear;
  ListFiltered.Clear;
  selectedAreaList.Clear;
  areaList.Clear;

  isCopy := False;
end;

procedure TENCSelect.FormCreate(Sender: TObject);
begin
  game_envi    := TGame_Environment_Definition.Create;
  Self.Height  := 800;

  FCanvas      := TCanvas.Create;

  ListFiltered := TStringList.Create;
  ListMapIndex := TStringList.Create;
  ListPrint    := TStringList.Create;
  ListSelectedArea := TStringList.Create;
  ListMapType  := TStringList.Create;

  List_id      := TStringList.Create;
  List_details := TStringList.Create;
end;

procedure TENCSelect.edtSearchKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
  str_details, str_id : string;
begin
  if Key = #13 then
  begin
    keywords := edtSearch.Text;

    ListPrint.Clear;
    for I := 0 to ListMapIndex.Count - 1 do
    begin
      SeparateString(ListMapIndex[i], '=', str_details, str_id);

      if Pos(keywords , str_details) <> 0 then
        ListPrint.Add(str_details);
    end;
    fillAreaList;

    setChecked;

    if keywords = '' then
    begin
      showAllList(cbbMapType.Text);
      fillAreaList;
      setChecked;
    end;

//    if ufrmAvailableGameArea.frmAvailableGameArea.flagIsNew = false then
//    begin
//      setChecked;
//      drawCheckedLayer;
//    end;
  end;
end;

procedure TENCSelect.setChecked;
var
  I, J, K : integer;
begin
  if areaList.Count = 0 then
    Exit;

  for I := 0 to areaList.Count - 1 do
  begin
    for J := 0 to List_details.Count - 1 do
    begin
      if areaList.Items.Strings[I] = List_details[J] then
      begin
        for K := 0 to ListFiltered.Count - 1 do
        begin
          if List_id[J] = ListFiltered[K] then
            areaList.Checked[I] := True;
        end;
      end;
    end;
  end;

end;

procedure TENCSelect.drawCheckedLayer;
var
  I, J : integer;
  ssLayer : TStringList;
  pathConFile, nameGameArea : string;
  lyr : CMapXLayer;
  s1, s2 : string;
begin
  ssLayer      := TStringList.Create;
  pathConFile  := vAppDBSetting.MapGSTGame;
  nameGameArea := ExerciseAreaForm.gameEnv.FGameArea.Game_Area_Identifier;

  if FileExists(pathConFile + '\' + nameGameArea + '\' + nameGameArea + '.txt') then
    ssLayer.LoadFromFile(pathConFile + '\' + nameGameArea + '\' + nameGameArea + '.txt')
  else
     Exit;

  for J := 1 to ENCmap.Layers.Count do
  begin
    if ENCmap.Layers.Item(J).Name = 'layer_background' then
    begin
         // do nothing
    end
    else if ENCmap.Layers.Item(J).Name = 'LYR_DRAW' then
    begin
         // do nothing
    end
    else
    begin
      if SeparateString(ENCmap.Layers.Item(J).Name, '_', s1, s2) then
      begin
        for I := 0 to ssLayer.Count - 1 do
        begin
          if ssLayer[I] = s1 then
          begin
            ENCmap.Layers.Item(J).OverrideStyle := true;
            lyr := ENCmap.Layers.Item(J);
            lyr.Style.RegionColor := clRed;
          end;
        end;
      end;
    end;
  end;
end;

procedure TENCSelect.FormShow(Sender: TObject);
var
   sourceCopy, destCopy : String;
   I, J : Integer;
   str, indx, mtype : string;
   str_details, str_id : string;
begin
//  edtSearch.Text := '';

  // Added by sidami
  GetSubDirectories(vAppDBSetting.MapTypePath, cbbMapType.Items);
  cbbMapType.ItemIndex := 0;

  defaultPath;
  defaultButton;

//  if not ufrmAvailableGameArea.frmAvailableGameArea.flagIsNew then
//  begin
//    loadList;
//
//    for I := 0 to ListMapType.Count - 1 do
//    begin
//      str := ListMapType.Strings[I];
//
//      showAllList(str);
//
//      setChecked;
//      selectRedArea;
////      drawCheckedLayer;
//
//      selectedArea;
//    end;
//
//  end;

  if isCopy then
  begin
    loadList;

    for I := 0 to ListMapType.Count - 1 do
    begin
      str := ListMapType.Strings[I];

      showAllList(str);

      setChecked;
//      drawCheckedLayer;
      selectRedArea;

      selectedArea;
    end;
  end;

  showAllList(cbbMapType.Text);  //daftar nama area
  fillAreaList;
end;

procedure TENCSelect.loadList;
var
  pathConFile, nameGameArea : string;
  listFromGeoset : TStringList;
  I : Integer;
  indx, mtype : string;
begin
  nameGameArea   := frmAvailableGameArea.lstGameArea.Items.Strings[frmAvailableGameArea.lstGameArea.ItemIndex];
  pathConFile    := vAppDBSetting.MapGSTGame + '\' + nameGameArea;
  listFromGeoset := TStringList.Create;

  if FileExists(pathConFile + '\' + nameGameArea  + '.txt') then
    listFromGeoset.LoadFromFile(pathConFile + '\' + nameGameArea  + '.txt')
  else
    Exit;

  ListFiltered.Clear;
  ListMapType.Clear;
  ListMapIndex.Clear;

  for I := 0 to listFromGeoset.Count - 1 do
  begin
    if SeparateString(listFromGeoset.Strings[I], '\', indx, mtype) then
    begin
      ListFiltered.Add(indx);
      ListMapType.Add(mtype)
    end;
  end;
end;

procedure TENCSelect.load_MAP_(Geoset: string);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if ENCmap = nil then
    Exit;
  InitOleVariant(z);
  ENCmap.Layers.RemoveAll;

  ENCmap.Geoset := Geoset;

  if Geoset <> '' then
  begin
    for i := 1 to ENCmap.Layers.Count do
    begin
      ENCmap.Layers.Item(i).Selectable := false;
      ENCmap.Layers.Item(i).Editable   := false;
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

procedure TENCSelect.showAllList(mtype: string);
var
   I : integer;
   str_details, str_id : string;
begin
  ListPrint.Clear;
  List_id.Clear;
  List_details.Clear;

  path_mapIndex := vAppDBSetting.MapTypePath + '\' + mtype + '\' + 'mapindex.ini';

  ListMapIndex.LoadFromFile(path_mapIndex);

  for I := 0 to ListMapIndex.Count - 1 do
  begin
   SeparateString(ListMapIndex[i], '=', str_id, str_details);
   ListPrint.Add(str_details);

   List_id.Add(str_id);
   List_details.Add(str_details);
  end;
end;

procedure TENCSelect.fillAreaList;
var
  I : Integer;
  intWidth, intMaxWidth: Integer;
begin
  areaList.Clear;

  for I := 0 to ListPrint.Count - 1 do
    areaList.Items.Add(ListPrint[I]);

  { set scroll areaList }
  intMaxWidth := 0;
  for I := 0 to areaList.Items.Count-1 do
  begin
    intWidth := areaList.Canvas.TextWidth(areaList.Items.Strings[I] + 'x');
    if intMaxWidth < intWidth then
      intMaxWidth := intWidth;
  end;
  SendMessage(areaList.Handle, LB_SETHORIZONTALEXTENT, intMaxWidth, 0);
end;

procedure TENCSelect.SpeedButtonImage61Click(Sender: TObject);
begin
  if selectedAreaList.ItemIndex = selectedAreaList.Count - 1 then
    Exit;

  selectedAreaList.Items.Exchange(selectedAreaList.ItemIndex, selectedAreaList.ItemIndex + 1);
end;

procedure TENCSelect.SpeedButtonImageClick(Sender: TObject);
begin
  if selectedAreaList.ItemIndex = 0 then
    Exit;

  selectedAreaList.Items.Exchange(selectedAreaList.ItemIndex, selectedAreaList.ItemIndex - 1);
end;

procedure TENCSelect.Split (const Delimiter: Char; // delimiter charachter
                            Input: string;         // input string
                            const Strings: TStrings) ; // list of string result
begin
  Assert(Assigned(Strings)) ;
  Strings.Clear;
  Strings.Delimiter := Delimiter;
  Strings.DelimitedText := Input;
end;

procedure TENCSelect.loadENC(ENCGeoset : string);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
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
      ENCmap.Layers.Item(i).Selectable := false;
      ENCmap.Layers.Item(i).Editable   := false;
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

procedure TENCSelect.btnNormalClick(Sender: TObject);
begin
  btnNormal.Down            := True;
  btnPan.Down               := false;
  toolbtnDecreaseScale.Down := false;
  toolbtnIncreaseScale.Down := false;
  btnZoom.Down              := false;
  btnZoomOut.Down           := false;
  btnDragFilter.Down        := false;
  btnFilter.Down            := false;

  if btnNormal.Down then
  begin
    ENCmap.CurrentTool   := miArrowTool;
    ENCmap.MousePointer  := crDefault;
  end;
end;

procedure TENCSelect.btnPanClick(Sender: TObject);
begin
  btnNormal.Down            := False;
  btnPan.Down               := True;
  toolbtnDecreaseScale.Down := false;
  toolbtnIncreaseScale.Down := false;
  btnZoom.Down              := false;
  btnZoomOut.Down           := false;
  btnDragFilter.Down        := false;
  btnFilter.Down            := false;

  if btnPan.Down then
  begin
    ENCmap.CurrentTool  := miPanTool;
    ENCmap.MousePointer := miPanCursor;
  end;
end;

procedure TENCSelect.toolbtnDecreaseScaleClick(Sender: TObject);
begin
  btnNormal.Down            := False;
  btnPan.Down               := false;
  toolbtnDecreaseScale.Down := true;
  toolbtnIncreaseScale.Down := false;
  btnZoom.Down              := false;
  btnZoomOut.Down           := false;
  btnDragFilter.Down        := false;
  btnFilter.Down            := false;

  if toolbtnDecreaseScale.Down then
  begin
    ENCmap.MousePointer := miZoomInCursor;

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
end;

procedure TENCSelect.toolbtnIncreaseScaleClick(Sender: TObject);
begin
  btnNormal.Down            := False;
  btnPan.Down               := false;
  toolbtnDecreaseScale.Down := false;
  toolbtnIncreaseScale.Down := true;
  btnZoom.Down              := false;
  btnZoomOut.Down           := false;
  btnDragFilter.Down        := false;
  btnFilter.Down            := false;

  if toolbtnIncreaseScale.Down then
  begin
    ENCmap.MousePointer := miZoomOutCursor;

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
end;

procedure TENCSelect.btnZoomClick(Sender: TObject);
begin
  btnNormal.Down            := false;
  btnPan.Down               := false;
  toolbtnDecreaseScale.Down := false;
  toolbtnIncreaseScale.Down := false;
  btnZoom.Down              := true;
  btnZoomOut.Down           := false;
  btnDragFilter.Down        := false;
  btnFilter.Down            := false;

  if btnZoom.Down then
  begin
    ENCmap.CurrentTool  := miZoomInTool;
    ENCmap.MousePointer := miZoomInCursor;
  end;
end;

procedure TENCSelect.btnZoomOutClick(Sender: TObject);
begin
  btnNormal.Down            := false;
  btnPan.Down               := false;
  toolbtnDecreaseScale.Down := false;
  toolbtnIncreaseScale.Down := false;
  btnZoom.Down              := false;
  btnZoomOut.Down           := True;
  btnDragFilter.Down        := false;
  btnFilter.Down            := false;

  if btnZoomOut.Down then
  begin
    ENCmap.CurrentTool  := miZoomOutTool;
    ENCmap.MousePointer := miZoomOutCursor;
  end;
end;
procedure TENCSelect.btnDragFilterClick(Sender: TObject);
begin
  btnNormal.Down            := False;
  btnPan.Down               := false;
  toolbtnDecreaseScale.Down := false;
  toolbtnIncreaseScale.Down := false;
  btnZoom.Down              := false;
  btnZoomOut.Down           := false;
  btnDragFilter.Down        := True;
  btnFilter.Down            := false;

  if btnDragFilter.Down then
  begin
    ENCmap.CurrentTool   := miCenterTool;//miArrowTool;
    ENCmap.MousePointer  := miCrossCursor;

//    ENCmap.ZoomTo(3072, ENCmap.CenterX, ENCmap.CenterY);
  end;
end;

procedure TENCSelect.btnFilterClick(Sender: TObject);
begin
  btnNormal.Down            := False;
  btnPan.Down               := false;
  toolbtnDecreaseScale.Down := false;
  toolbtnIncreaseScale.Down := false;
  btnZoom.Down              := false;
  btnZoomOut.Down           := false;
  btnDragFilter.Down        := false;
  btnFilter.Down            := True;

  if btnFilter.Down then
  begin
    ENCmap.CurrentTool   := miArrowTool;
    ENCmap.MousePointer  := miCrossCursor;
  end;
end;

 procedure TENCSelect.cbbMapTypeChange(Sender: TObject);
var
  sr  : TSearchRec;
  dir,str : string;
begin
  path_mapIndex     := vAppDBSetting.MapTypePath + '\' + cbbMapType.Text + '\' + 'mapindex.ini';
  path_confLayerENC := ExtractFilePath(Application.ExeName) + '\ConfigureLayerENC.txt';
  strConfLayerENC   := 'ConfigureLayerENC.txt';

  defaultButton;

  ListPrint.Clear;
  List_id.Clear;
  List_details.Clear;

  showAllList(cbbMapType.Text);
  fillAreaList;

  // Modified and added by sidami
  dir := vAppDBSetting.MapDefView + '\' + cbbMapType.Text;

  try
    if FindFirst(IncludeTrailingPathDelimiter(dir)+'*.*', faDirectory, sr) = 0 then
    begin
      repeat
        str := RightStr(sr.Name,4);

        if str = '.gst' then
        begin
          sr.Name := sr.Name;

          Break;
        end;
      until FindNext(sr) <> 0;
    end;
  finally
    SysUtils.FindClose(sr);
  end;

   if cbbMapType.Text = '_MAP_ENC' then
   begin
     if sr.Name <> '' then
       load_MAP_(vAppDBSetting.MapDefView + '\' + cbbMapType.Text + '\AreaCoverage.gst')
     else
       Exit;
   end
   else
   begin
     if sr.Name <> '' then
       load_MAP_(vAppDBSetting.MapDefView + '\' + cbbMapType.Text + '\' + sr.Name)
     else
       Exit;
   end;

  setChecked;
  selectRedArea;
end;

procedure TENCSelect.cbSetScaleChange(Sender: TObject);
var z : Double;
    s : string;
begin
  ENCmap.OnMapViewChanged := nil;
  if cbSetScale.ItemIndex < 0  then Exit;

  if (cbSetScale.ItemIndex <= 500) then
  begin
   s := cbSetScale.Items[cbSetScale.ItemIndex];
   try
     z := StrToFloat(s);
     ENCmap.ZoomTo(z, ENCmap.CenterX, ENCmap.CenterY);
   finally

   end;
  end
  else cbSetScale.ItemIndex := cbSetScale.ItemIndex -1 ;
  ENCmap.OnMapViewChanged := ENCmapMapViewChanged;
end;

function TENCSelect.CopyDir(const fromDir, toDir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc  := FO_COPY;
    fFlags := FOF_FILESONLY;
    pFrom  := PChar(fromDir + #0);
    pTo    := PChar(toDir)
  end;
  Result := (0 = ShFileOperation(fos));
end;

procedure TENCSelect.ENCmapDrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Cardinal; const RectFull,
  RectInvalid: IDispatch);
begin
  if not Assigned(FCanvas) then
    Exit;
  FCanvas.Handle := hOutputDC;

  {if btnFilter.Down then
  begin
    FCanvas.Pen.color   := clYellow;
    FCanvas.Pen.Width   := 3;
    FCanvas.Brush.Style := bsClear;
    FCanvas.Rectangle(Round(startX), Round(startY), Round(endX), Round(endY));
  end; }
end;

procedure TENCSelect.ENCmapMapViewChanged(Sender: TObject);
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
           cbSetScale.Text := FormatFloat('0.000', tempZoom);
     end
     else if (ENCmap.Zoom >= 0.25) AND (ENCmap.Zoom < 0.5) then
     begin
           cbSetScale.Text := FormatFloat('0.00', tempZoom);
     end
     else if (ENCmap.Zoom >= 0.5) AND (ENCmap.Zoom < 1) then
     begin
           cbSetScale.Text := FormatFloat('0.0', tempZoom);
     end
     else
           cbSetScale.Text := floattostr(tempZoom);
     ENCmap.OnMapViewChanged := ENCmapMapViewChanged;
  end;
end;

procedure TENCSelect.ENCmapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  castX, castY : single;
  I : Integer;
  lyr : CMapXLayer;
begin
  if btnDragFilter.Down then
  begin
    castX := X;
    castY := Y;
    ENCmap.ConvertCoord(castX, castY, Longitude, Lattitude, miScreenToMap);
  end;

  if btnFilter.Down then
  begin
    isDown := True;

    startX := X;
    startY := Y;
    ENCmap.ConvertCoord(startX, startY, squareLeftLong, squareTopLatt, miScreenToMap);
    endX   := X;
    endY   := Y;
//    ENCmap.Repaint;

    ListFiltered.Clear;
    for I := 1 to ENCmap.Layers.Count do
    begin
      lyr := ENCmap.Layers.Item(I);

      if (lyr.Name <> 'layer_background') and (lyr.Name <> 'LYR_DRAW') then
        lyr.OverrideStyle := false;
    end;

    for I := 0 to areaList.Count - 1 do
      areaList.Checked[I] := false;
  end;
end;

procedure TENCSelect.ENCmapMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if btnFilter.Down then
  begin
    if isDown then
    begin
      endX := X;
      endY := Y;
//      ENCmap.Repaint;
    end;
  end;
end;

procedure TENCSelect.ENCmapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  fX, fY : single;
begin
  if btnFilter.Down then
  begin
    endX := X;
    endY := Y;
    ENCmap.ConvertCoord(endX, endY, squareRightLong, squareBottomLatt, miScreenToMap);
    ENCmap.Repaint;

    isDown := false;

    selectionArea;
    selectedArea;
  end;
end;

procedure TENCSelect.selectedArea;
var
  i,j : Integer;
  str, str1 : string;
begin
  selectedAreaList.Clear;
  ListSelectedArea.Clear;

  if ListFiltered.Count = 0 then
    Exit;

  for i := 0 to ListFiltered.Count - 1 do
  begin
    if ListFiltered.Count < 0 then
      Exit;

    if selectedAreaList.Count = 0 then
    begin
      selectedAreaList.Items.Add(ListFiltered[i]);
      selectedAreaList.Checked[i] := True;
    end
    else
    begin
      for j := 0 to selectedAreaList.Count - 1 do
      begin
        if ListFiltered.Strings[i] = selectedAreaList.Items.Strings[j] then
          Exit;
      end;

      selectedAreaList.Items.Add(ListFiltered[i]);
      selectedAreaList.Checked[i] := True;
    end;

    str := selectedAreaList.Items.Strings[i] + '\' + ListMapType.Strings[i];
    ListSelectedArea.Add(str);
  end;

  selectedAreaList.Selected[0] := True;
end;

procedure TENCSelect.selectedAreaListClickCheck(Sender: TObject);
var
  i : Integer;
  str : string;
begin
  ListSelectedArea.Clear;

  if selectedAreaList.Count = 0 then
    Exit;

  for i := 0 to selectedAreaList.Count - 1 do
  begin
    if selectedAreaList.Checked[i] then
    begin
      str := selectedAreaList.Items.Strings[i] + '\' + ListMapType.Strings[i];
      ListSelectedArea.Add(str);
    end;
  end;
end;

procedure TENCSelect.selectionArea;
var
  I, J, K : Integer;
  lyr : CMapXLayer;
  id, defaultName : string;

  isFound : Boolean;
begin
  isFound := false;

  if btnFilter.Down then
  begin
    for I := 1 to ENCmap.Layers.Count do
    begin
      lyr := ENCmap.Layers.Item(I);

      if lyr.Name = 'layer_background' then
      begin
           // do nothing
      end
      else if lyr.Name = 'LYR_DRAW' then
      begin
           // do nothing
      end
      else
      begin
//        if ((Longitude >= Double(lyr.Bounds.XMin)) and (Longitude <= Double(lyr.Bounds.XMax))) and
//           ((Lattitude >= Double(lyr.Bounds.YMin)) and (Lattitude <= Double(lyr.Bounds.YMax))) then

        if ((((lyr.Bounds.XMax >= squareLeftLong) and (lyr.Bounds.XMax <= squareRightLong))  and
           ((lyr.Bounds.YMax <= squareTopLatt) and (lyr.Bounds.YMax >= squareBottomLatt)))
           or
           (((lyr.Bounds.XMin >= squareLeftLong) and (lyr.Bounds.XMin <= squareRightLong))  and
           ((lyr.Bounds.YMin <= squareTopLatt) and (lyr.Bounds.YMin >= squareBottomLatt))))
           or
           ((((squareLeftLong >= lyr.Bounds.XMin ) and (squareLeftLong <= lyr.Bounds.XMax))  and
           ((squareTopLatt <= lyr.Bounds.YMax) and (squareTopLatt >= lyr.Bounds.YMin)))
           or
           (((squareRightLong >= lyr.Bounds.XMin) and (squareRightLong <= lyr.Bounds.XMax))  and
           ((squareBottomLatt <= lyr.Bounds.YMax) and (squareBottomLatt >= lyr.Bounds.YMin))))
           then
        begin
//          if lyr.Style.RegionColor = clRed then
//          begin
//            lyr.Style.RegionColor := clBlack;
//            lyr.OverrideStyle     := false;
//
//            SeparateString(lyr.Name, '_', id, defaultName);
//
//            for J := ListFiltered.Count -1 downto 0 do
//            begin
//              if ListFiltered[J] = id then
//              begin
//                if not isFound then
//                begin
//                  isFound := true;
//                  ListFiltered.Delete(J);
//
//                  break;
//                end;
//              end;
//            end;
//          end
//          else
//          begin

            lyr.OverrideStyle     := True;
            lyr.Style.RegionColor := clRed;

            SeparateString(lyr.Name, '_', id, defaultName);
            ListFiltered.Add(id);
            ListMapType.Add(cbbMapType.Text);
//          end;
//          Break;
        end;
      end;

      if isFound then Break;
    end;
  end;

  for I := 0 to areaList.Count - 1 do
  begin
    for J := 0 to List_details.Count - 1 do
    begin
      if areaList.Items.Strings[I] = List_details[J] then
      begin
        for K := 0 to ListFiltered.Count - 1 do
        begin
          if List_id[J] = ListFiltered[K] then
            areaList.Checked[I] := True;
        end;
      end;
    end;
  end;
end;

procedure TENCSelect.selectRedArea;
var
  I, J: Integer;
  lyr : CMapXLayer;
  s1, s2 : string;
  X1, X2 : Single;
  Y1, Y2 : Single;
  XCenter , YCenter  : Single;
begin
  X1 := 1;
  X2 := 1;
  Y1 := 1;
  Y2 := 1;
  XCenter := 1;
  YCenter := 1;

  for I := 1 to ENCmap.Layers.Count do
  begin
    if (ENCmap.Layers.Item(I).Name <> 'layer_background') and (ENCmap.Layers.Item(I).Name <> 'LYR_DRAW') then
    begin
      lyr := ENCmap.Layers.Item(I);
      lyr.OverrideStyle := False;
    end;
  end;

  for I := 1 to ENCmap.Layers.Count do
  begin
    if (ENCmap.Layers.Item(I).Name <> 'layer_background') and (ENCmap.Layers.Item(I).Name <> 'LYR_DRAW') then
    begin
      if SeparateString(ENCmap.Layers.Item(I).Name, '_', s1, s2) then
      begin
        for J := 0 to ListFiltered.Count - 1 do
        begin
          lyr := ENCmap.Layers.Item(I);

          if ListFiltered[J] = s1 then
          begin
            lyr.OverrideStyle := true;
            lyr.Style.RegionColor := clRed;

            X1 := X1;
            X2 := X2;
            Y1 := Y1;
            Y2 := Y2;
            XCenter := XCenter;
            YCenter := YCenter;

            X1 := lyr.Bounds.XMin;
            X2 := lyr.Bounds.XMax;
            Y1 := lyr.Bounds.YMin;
            Y2 := lyr.Bounds.YMax;

            XCenter := (X2 - X1)/2 ;
            Ycenter := (Y2 - Y1)/2;
          end;
        end;

//        ENCmap.ConvertCoord(XCenter, Ycenter, Longitude, Lattitude, miScreenToMap);
      end;
    end;
  end;

end;

end.

