unit uMLayerSelect;

interface

uses
  Types, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, MapXLib_TLB, ExtCtrls, CheckLst, StrUtils,
  uDBAsset_GameEnvironment, ImgList, ComCtrls, ToolWin, uCoordConvertor, Buttons,
  SpeedButtonImage, OleServer, System.ImageList;

type
  TMLayerSelect = class(TForm)
    PanelLeft: TPanel;
    btnSAVE: TButton;
    btnCancel: TButton;
    grp1: TGroupBox;
    LayersList: TCheckListBox;
    btnUP: TButton;
    btnDOWN: TButton;
    txtName: TStaticText;
    mpLayer: TMap;
    PanelTop: TPanel;
    toolbar2: TToolBar;
    ToolButtonNormal: TToolButton;
    ToolButtonPan: TToolButton;
    ToolButtonDecreaseScale: TToolButton;
    cbbSetScale: TComboBox;
    ToolButtonIncreaseScale: TToolButton;
    ToolButtonZoom: TToolButton;
    ToolButtonDragFilter: TToolButton;
    ImageList1: TImageList;
    ToolButtonLayerControl: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    btnZoomOut: TToolButton;
    lblName: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ToolButtonLayerControlClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure LayersListClickCheck(Sender: TObject);
    procedure cbbSetScaleChange(Sender: TObject);
    procedure mpLayerMapViewChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButtonNormalClick(Sender: TObject);
    procedure ToolButtonPanClick(Sender: TObject);
    procedure ToolButtonDecreaseScaleClick(Sender: TObject);
    procedure ToolButtonIncreaseScaleClick(Sender: TObject);
    procedure ToolButtonZoomClick(Sender: TObject);
    procedure ToolButtonDragFilterClick(Sender: TObject);
    procedure btnTOPClick(Sender: TObject);
    procedure btnDOWNClick(Sender: TObject);
    procedure btnSAVEClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
  private
    { Private declarations }
     mapGeo : string;
    procedure Load_MAP_(geoSet : string);
  public
    { Public declarations }
    FLyrDraw : CMapXLayer;
    mapTemp : TMap;

    path_mapLayers : string;

    tempList : TStringList;
    LstLayerFrmEncSelect : TStringList;
    ListMapLayers : TStringList;

    procedure FillTheList(lst : TStringList);
  end;

var
  MLayerSelect: TMLayerSelect;

implementation

uses
  uMapXHandler, uDataModuleTTT, uDBEditSetting, uSimDBEditor, ufrmAvailableGameArea,
  uExerciseArea, uBaseCoordSystem, uChooseMap;

{$R *.dfm}

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

{ TMLayerSelect }

procedure TMLayerSelect.btnCancelClick(Sender: TObject);
begin
  Self.Close;

  LayersList.Clear;
  lblName.Caption := '';
end;

procedure TMLayerSelect.btnDOWNClick(Sender: TObject);
var
  I : Integer;
  x,y : Integer;
begin
  if LayersList.ItemIndex = LayersList.Count - 1 then
    Exit;

  for I := LayersList.Count - 1 downto 0  do
  begin
    if TListBox(LayersList).MultiSelect then
    begin
      if LayersList.Selected[I] then
      begin
        LayersList.ItemIndex := I;

        if LayersList.Items.Strings[I] = 'LYR_DRAW' then
          Exit;

        x := LayersList.ItemIndex;

        y := x + 1;

        LayersList.Items.Exchange(x, y);
        tempList.Exchange(x-1,y-1);
        mpLayer.Layers.Move(x+1, y+1);
      end;
    end;
  end;

  TListBox(LayersList).Selected[y] := True;
end;

procedure TMLayerSelect.btnSAVEClick(Sender: TObject);
var
  files : string;
  I, J, K : Integer;
  indx, mtype : string;
  indxSr3, indxSr4, s1, s2 : string;
  lyrList : TStringList;
  myfile : TextFile;
  dirP : string;
  fileDest : string;
begin
  lyrList := TStringList.Create;

  try
//    mapTemp := TMap.Create(self);
//
//    mapTemp.Geoset := '';
//    mapTemp.Refresh;

//    for J := 0 to tempList.Count - 1 do
//    begin
//      if SeparateString(tempList.Strings[J], '\', indx, mtype) then
//      begin
//        if SeparateString(indx, '_', indxSr3, indxSr4) then
//        begin
//          for I := 0 to LayersList.Count - 1 do
//          begin
//            if SeparateString(indx, '.', s1, s2) then
//            begin
//              if s1 = LayersList.Items.Strings[I]  then
//              begin
//                if LayersList.Checked[I] then
//                begin
//                  mpLayer.Layers.Item(J+1).Visible := True;
//                end
//                else
//                begin
//                  mpLayer.Layers.Item(J+1).Visible := False;
//                end;
//              end;
//            end;
//          end;

//          files := vAppDBSetting.MapTypePath + '\' + mtype + '\' + indxSr3 + '\' + indx;
//          mpLayer.Layers.Add(files,J+1);
//          s1 := mpLayer.Layers.Item(J+1).Name;
//        end;
//      end;
//    end;

    dirP := vAppDBSetting.MapGSTGame + '\' + lblName.Caption + '\';

//    if FileExists(dirP + lblName.Caption + '_Layers.txt') then
//    begin
//      DeleteFile(dirP + lblName.Caption + '_Layers.txt');
//
//      AssignFile(myFile, dirP +'\'+ lblName.Caption + '_Layers.txt');
//      ReWrite(myFile);
//      for I := 0 to lyrList.Count - 1 do
//        Writeln(myFile, lyrList[I]);
//      CloseFile(myFile);
//    end
//    else
//    begin
//      AssignFile(myFile, dirP +'\'+ lblName.Caption + '_Layers.txt');
//      ReWrite(myFile);
//      for I := 0 to lyrList.Count - 1 do
//        Writeln(myFile, lyrList[I]);
//      CloseFile(myFile);
//    end;

    files := vAppDBSetting.MapGSTGame + '\' + lblName.Caption + '\' + lblName.Caption + '.gst';

    if FileExists(files) then
    begin
      DeleteFile(files);
      mpLayer.SaveMapAsGeoset('final', files);
    end
    else
    begin
      mpLayer.SaveMapAsGeoset('final', files);
    end;

    LayersList.Clear;

    Close;
  except
    MessageDlg('Try Again',mtWarning,mbOKCancel,0);
  end;
end;

procedure TMLayerSelect.btnTOPClick(Sender: TObject);
var
 I : Integer;
 x,y : Integer;
begin
  if LayersList.ItemIndex = 0 then
    Exit;

  for I := 0 to LayersList.Count - 1 do
  begin
    if TListBox(LayersList).MultiSelect then
    begin
      if LayersList.Selected[I] then
      begin
        LayersList.ItemIndex := I;

        x := LayersList.ItemIndex;

        y := x - 1;

        if (LayersList.Items.Strings[I] = 'LYR_DRAW') or (y = 0) then
          Exit;

        LayersList.Items.Exchange(x, y);
        tempList.Exchange(x-1,y-1);
        mpLayer.Layers.Move(x+1, y+1);
      end;
    end;
  end;

  TListBox(LayersList).Selected[y] := True;
end;

procedure TMLayerSelect.btnZoomOutClick(Sender: TObject);
begin
  ToolButtonNormal.Down        := false;
  ToolButtonPan.Down           := false;
  ToolButtonDecreaseScale.Down := false;
  ToolButtonIncreaseScale.Down := false;
  ToolButtonZoom.Down          := false;
  btnZoomOut.Down              := True;
  ToolButtonDragFilter.Down    := false;

  if btnZoomOut.Down then
  begin
    mpLayer.CurrentTool  := miZoomOutTool;
    mpLayer.MousePointer := miZoomOutCursor;
  end;
end;

procedure TMLayerSelect.cbbSetScaleChange(Sender: TObject);
var z : Double;
    s : string;
begin
  mpLayer.OnMapViewChanged := nil;
  if cbbSetScale.ItemIndex < 0  then Exit;

  if (cbbSetScale.ItemIndex <= 500) then
  begin
   s := cbbSetScale.Items[cbbSetScale.ItemIndex];
   try
     z := StrToFloat(s);
     mpLayer.ZoomTo(z, mpLayer.CenterX, mpLayer.CenterY);
   finally

   end;
  end
  else cbbSetScale.ItemIndex := cbbSetScale.ItemIndex -1 ;
  mpLayer.OnMapViewChanged := mpLayerMapViewChanged;
end;

procedure TMLayerSelect.FillTheList(lst: TStringList);
var
  I : Integer;
  indx,mtype : string;
  sr : TSearchRec;
  dir : string;
  str : string;
begin
  if lst.Count = 0 then
    Exit;

  LstLayerFrmEncSelect.Clear;
  tempList.Clear;

  for I := 0 to lst.Count - 1 do
  begin
    LstLayerFrmEncSelect.Add(lst.Strings[I]);

    if SeparateString(LstLayerFrmEncSelect.Strings[I], '\', indx, mtype) then
    begin

      dir := vAppDBSetting.MapTypePath + '\' + mtype + '\' + indx;

      try
        if FindFirst(IncludeTrailingPathDelimiter(dir)+'*.*', faDirectory, sr) = 0 then
        begin
          repeat
            str := RightStr(sr.Name,4);

            if (str = '.tab') or (str = '.TAB') then
              tempList.Add(sr.Name + '\'+ mtype);
          until FindNext(sr) <> 0;
        end;
      finally
        SysUtils.FindClose(sr);
      end;
    end;
  end;
end;

procedure TMLayerSelect.FormCreate(Sender: TObject);
begin
  TListBox(LayersList).MultiSelect := True;

  LstLayerFrmEncSelect := TStringList.Create;
  tempList := TStringList.Create;
  ListMapLayers := TStringList.Create;
end;

procedure TMLayerSelect.FormShow(Sender: TObject);
var
  J,K : Integer;
  strFN : string;
  dirP  : string;
begin
  dirP := vAppDBSetting.MapGSTGame + '\' + lblName.Caption;

  mpLayer.Geoset := '';
  mapGeo := dirP + '\' + lblName.Caption + '.gst';

  Load_MAP_(mapGeo);
  ChooseMap.setZoomENC;

  if mapGeo <> '' then
  begin
    for J := 1 to mpLayer.Layers.Count do
    begin
      strFN := mpLayer.Layers.Item(J).Name;
      LayersList.Items.Add(strFN);

      for K := 0 to LayersList.Count - 1 do
      begin
        if LayersList.ItemIndex = 0 then
          LayersList.ItemEnabled[0] := False;

        if strFN = LayersList.Items.Strings[K] then
        begin
          LayersList.Checked[K] := mpLayer.Layers.Item(J).Visible
        end;
      end;
    end;

    LayersList.Selected[1] := True;
  end;
end;

procedure TMLayerSelect.LayersListClickCheck(Sender: TObject);
var
  I,J,K : Integer;
  str1 : WideString;
  str2 : string;
begin
  if mapGeo <> '' then
  begin
    K := mpLayer.Layers.Count;

    for I := 0 to K do
    begin
      if I = 0 then
        Continue;

      str1 := mpLayer.Layers.Item(I).Name;

      for J := 0 to LayersList.Count - 1 do
      begin
        str2 := LayersList.Items.Strings[J];

        if str1 = str2 then
        begin
          if not LayersList.Checked[J] then
            mpLayer.Layers.Item(I).Visible := False
          else
            mpLayer.Layers.Item(I).Visible := True;
        end;
      end;
    end;
  end;
end;

procedure TMLayerSelect.Load_MAP_(geoSet: string);
var
  i,j: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if mpLayer = nil then
    Exit;
  InitOleVariant(z);
  mpLayer.Layers.RemoveAll;

  mpLayer.Geoset := Geoset;

  if geoSet <> '' then
  begin
    for i := 1 to mpLayer.Layers.Count do
    begin
      mpLayer.Layers.Item(i).Selectable := false;
      mpLayer.Layers.Item(i).Editable   := false;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := mpLayer.Layers.Add(mInfo, 1);

    mpLayer.Layers.AnimationLayer := FLyrDraw;
    mpLayer.MapUnit := miUnitNauticalMile;
  end;

  mpLayer.BackColor := RGB(192, 224, 255);
end;

procedure TMLayerSelect.mpLayerMapViewChanged(Sender: TObject);
var
  tempZoom : double;
begin
  if mpLayer.CurrentTool = miZoomInTool then
  begin
     if mpLayer.Zoom <= 0.125 then tempZoom := 0.125;
     if (mpLayer.Zoom > 0.125) AND (mpLayer.Zoom < 1) then tempZoom := mpLayer.Zoom;
     if (mpLayer.Zoom >= 1) AND (mpLayer.Zoom <= 2500) then tempZoom := round(mpLayer.Zoom);
     if mpLayer.Zoom > 2500 then tempZoom := 2500;

     mpLayer.OnMapViewChanged := nil;
     mpLayer.ZoomTo(tempZoom, mpLayer.CenterX, mpLayer.CenterY);

     if (mpLayer.Zoom > 0.125) AND (mpLayer.Zoom < 0.25) then
     begin
           cbbSetScale.Text := FormatFloat('0.000', tempZoom);
     end
     else if (mpLayer.Zoom >= 0.25) AND (mpLayer.Zoom < 0.5) then
     begin
           cbbSetScale.Text := FormatFloat('0.00', tempZoom);
     end
     else if (mpLayer.Zoom >= 0.5) AND (mpLayer.Zoom < 1) then
     begin
           cbbSetScale.Text := FormatFloat('0.0', tempZoom);
     end
     else
           cbbSetScale.Text := floattostr(tempZoom);
     mpLayer.OnMapViewChanged := mpLayerMapViewChanged;
  end;
end;

procedure TMLayerSelect.ToolButtonLayerControlClick(Sender: TObject);
var
  vHelpFile, vHelpID : OleVariant;
begin
  mpLayer.Layers.LayersDlg(vHelpFile, vHelpID);
end;

procedure TMLayerSelect.ToolButtonDecreaseScaleClick(Sender: TObject);
begin
  ToolButtonNormal.Down        := False;
  ToolButtonPan.Down           := false;
  ToolButtonDecreaseScale.Down := true;
  ToolButtonIncreaseScale.Down := false;
  ToolButtonZoom.Down          := false;
  btnZoomOut.Down              := false;
  ToolButtonDragFilter.Down    := false;

  if ToolButtonDecreaseScale.Down then
  begin
    mpLayer.MousePointer := miZoomInCursor;

    if  cbbSetScale.ItemIndex >  0 then
    begin
      cbbSetScale.ItemIndex := cbbSetScale.ItemIndex  - 1;
      ToolButtonIncreaseScale.Enabled := true;
    end;

    cbbSetScaleChange(cbbSetScale);

    if cbbSetScale.ItemIndex = 0 then
     ToolButtonDecreaseScale.Enabled := false
    else
     ToolButtonDecreaseScale.Enabled := true;
  end;
end;

procedure TMLayerSelect.ToolButtonDragFilterClick(Sender: TObject);
begin
  ToolButtonNormal.Down        := False;
  ToolButtonPan.Down           := false;
  ToolButtonDecreaseScale.Down := false;
  ToolButtonIncreaseScale.Down := false;
  ToolButtonZoom.Down          := false;
  btnZoomOut.Down              := false;
  ToolButtonDragFilter.Down    := True;

  if ToolButtonDragFilter.Down then
  begin
    mpLayer.CurrentTool   := miArrowTool;
    mpLayer.MousePointer  := miCrossCursor;

    mpLayer.ZoomTo(3072, mpLayer.CenterX, mpLayer.CenterY);
  end;
end;

procedure TMLayerSelect.ToolButtonIncreaseScaleClick(Sender: TObject);
begin
  ToolButtonNormal.Down        := False;
  ToolButtonPan.Down           := false;
  ToolButtonDecreaseScale.Down := false;
  ToolButtonIncreaseScale.Down := true;
  ToolButtonZoom.Down          := false;
  btnZoomOut.Down              := false;
  ToolButtonDragFilter.Down    := false;

  if ToolButtonIncreaseScale.Down then
  begin
    mpLayer.MousePointer := miZoomOutCursor;

    if  (cbbSetScale.ItemIndex <= 500) then
    begin
      cbbSetScale.ItemIndex := cbbSetScale.ItemIndex + 1;
      ToolButtonDecreaseScale.Enabled := true;
    end;

    cbbSetScaleChange(cbbSetScale);

    if (cbbSetScale.ItemIndex = 0) then //sampai batas akhir
     ToolButtonIncreaseScale.Enabled := true
    else
     ToolButtonIncreaseScale.Enabled := true;
  end;
end;

procedure TMLayerSelect.ToolButtonNormalClick(Sender: TObject);
begin
  ToolButtonNormal.Down        := True;
  ToolButtonPan.Down           := false;
  ToolButtonDecreaseScale.Down := false;
  ToolButtonIncreaseScale.Down := false;
  ToolButtonZoom.Down          := false;
  btnZoomOut.Down              := false;
  ToolButtonDragFilter.Down    := false;

  if ToolButtonNormal.Down then
  begin
    mpLayer.CurrentTool   := miArrowTool;
    mpLayer.MousePointer  := crDefault;
  end;
end;

procedure TMLayerSelect.ToolButtonPanClick(Sender: TObject);
begin
  ToolButtonNormal.Down        := False;
  ToolButtonPan.Down           := True;
  ToolButtonDecreaseScale.Down := false;
  ToolButtonIncreaseScale.Down := false;
  ToolButtonZoom.Down          := false;
  btnZoomOut.Down              := false;
  ToolButtonDragFilter.Down    := false;

  if ToolButtonPan.Down then
  begin
    mpLayer.CurrentTool  := miPanTool;
    mpLayer.MousePointer := miPanCursor;
  end;
end;

procedure TMLayerSelect.ToolButtonZoomClick(Sender: TObject);
begin
  ToolButtonNormal.Down        := false;
  ToolButtonPan.Down           := false;
  ToolButtonDecreaseScale.Down := false;
  ToolButtonIncreaseScale.Down := false;
  ToolButtonZoom.Down          := true;
  btnZoomOut.Down              := false;
  ToolButtonDragFilter.Down    := false;

  if ToolButtonZoom.Down then
  begin
    mpLayer.CurrentTool  := miZoomInTool;
    mpLayer.MousePointer := miZoomInCursor;
  end;
end;

end.
