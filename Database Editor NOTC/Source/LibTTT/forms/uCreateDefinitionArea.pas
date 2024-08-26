unit uCreateDefinitionArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, OleCtrls, uDBAsset_GameEnvironment, ImgList,
  ToolWin, MapXLib_TLB, ExtCtrls, ufrmAdminMainForm, uDBEditSetting, ComCtrls, Math,
  FMTBcd, {DBTables,} DB, SqlExpr, uCoordConvertor, uBaseCoordSystem,
  System.ImageList;

type
  TCreateDefinitionArea = class(TForm)
    grp_ListGameArea: TGroupBox;
    chklst_ListGameArea: TCheckListBox;
    grp_SelectedGameArea: TGroupBox;
    btn_Up: TButton;
    btn_Down: TButton;
    pnl_Border: TPanel;
    mp_SelectedGameArea: TMap;
    lst_idGameArea: TListBox;
    lst_SelectedArea: TListBox;
    image_button: TImageList;
    pnl_Top: TPanel;
    tlb_Button: TToolBar;
    btn_Cursor: TToolButton;
    btn_HandTool: TToolButton;
    btn_ZoomIn: TToolButton;
    btn_ZoomOut: TToolButton;
    btn_SetDef: TButton;
    lbl_DefinitionName: TLabel;
    edt_DefinitionName: TEdit;
    btn_OK: TButton;
    btn_Cancel: TButton;
    chk_SeeMap: TCheckBox;
    btn_Center: TToolButton;
    lbl_Zoom: TLabel;
    lbl_ZoomValue: TLabel;

    procedure refresh();
    procedure Load_Map(NameArea : string);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chklst_ListGameAreaClickCheck(Sender: TObject);
    procedure btn_ZoomInClick(Sender: TObject);
    procedure btn_ZoomOutClick(Sender: TObject);
    procedure btn_CursorClick(Sender: TObject);
    procedure btn_HandToolClick(Sender: TObject);
    procedure lst_SelectedAreaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SetDefClick(Sender: TObject);
    procedure mp_SelectedGameAreaDrawUserLayer(ASender: TObject;
      const Layer: IDispatch; hOutputDC, hAttributeDC: Cardinal; const RectFull,
      RectInvalid: IDispatch);
    procedure mp_SelectedGameAreaMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure btn_UpClick(Sender: TObject);
    procedure btn_DownClick(Sender: TObject);
    procedure chk_SeeMapClick(Sender: TObject);
    procedure mp_SelectedGameAreaMapViewChanged(Sender: TObject);
    procedure btn_CenterClick(Sender: TObject);

  private
    ListGameArea : TList;
    FMouseDown : Boolean;
    FS_PointX,FS_PointY, FE_PointX,FE_PointY : Double;
    S_XPoint, S_YPoint, E_XPoint, E_YPoint  : Integer;
    FCanvas : TCanvas;
    FConverter : TCoordConverter;
    FCursor : Boolean;
    FIndexAreaSelected : Integer;
    LastZoom : Double;
    LastCenterX, LastCenterY : Double;

    procedure Insert;
    procedure GetDefArea(FSelectedArea : string);
    procedure ClearAll;
    procedure ToolBar(const FToolbar: string);

  public
    { Public declarations }
    GameAreaIndex : Integer;
    FBtnSetDef : Boolean;
    FListDefinitionArea : TStringList;
    ListDefSelected : TStringList;
    FSelectedArea : string;
    Game_Environment : TGame_Environment_Definition;
    FCenterX, FCenterY : Double;
    ID_GameArea : Integer;
    FActive : string;

    // Long Lat when map mouse down

    FLongitude, FLattitude : Double;

    function GetDefList(LookFor, Sentence: string; var Value : string): Boolean;
    function FindMarker(const LookingFor : string; var Mark : string): Boolean;
    procedure Action(BtnActive : string);
  end;

var
  CreateDefinitionArea: TCreateDefinitionArea;

implementation

{$R *.dfm}

uses
  uExerciseArea, uSimDBEditor, uChooseMap, uMapXHandler, uFormDefinition,
  uGameAreaDefinition;

const
  CMin_Z = 0;
  CMax_z = 14;

procedure TCreateDefinitionArea.btn_ZoomOutClick(Sender: TObject);
begin
  ToolBar('ZoomOut');
end;

procedure TCreateDefinitionArea.btn_SetDefClick(Sender: TObject);
begin
  FBtnSetDef := True;

  if lst_SelectedArea.ItemIndex >= 0 then
  begin
    if FormDefinition.FListCheckValueArea[FIndexAreaSelected] = '0' then
      FormDefinition.Show
    else
    begin
      FormDefinition.FObjArea := True;
      lst_SelectedArea.OnClick(lst_SelectedArea);
      FormDefinition.Show;
    end;
  end;
end;

procedure TCreateDefinitionArea.btn_UpClick(Sender: TObject);
begin
  lst_SelectedArea.Items.Exchange(lst_SelectedArea.ItemIndex, lst_SelectedArea.ItemIndex-1);
end;

procedure TCreateDefinitionArea.btn_CancelClick(Sender: TObject);
begin
  edt_DefinitionName.Text := '';
  lst_SelectedArea.Clear;
  FormDefinition.FListDefArea.Clear;
  Close;
end;

procedure TCreateDefinitionArea.btn_CenterClick(Sender: TObject);
begin
  ToolBar('Center');
end;

procedure TCreateDefinitionArea.btn_CursorClick(Sender: TObject);
begin
  ToolBar('Cursor');
end;

procedure TCreateDefinitionArea.btn_DownClick(Sender: TObject);
begin
  lst_SelectedArea.Items.Exchange(lst_SelectedArea.ItemIndex, lst_SelectedArea.ItemIndex+1);
end;

procedure TCreateDefinitionArea.btn_HandToolClick(Sender: TObject);
begin
  ToolBar('HandTool');
end;

procedure TCreateDefinitionArea.btn_OKClick(Sender: TObject);
var
  MyDirectory : string;
  MFile : TextFile;
  FileName : string;
  I, TotalCopy : Integer;
  Available : Boolean;
begin
  MyDirectory := vAppDBSetting.MapDefGame;

  if DirectoryExists(MyDirectory) = False then
    CreateDir(MyDirectory);

  if edt_DefinitionName.Text = '' then
    ShowMessage('Definition name is empty!')
  else
  begin
    DefinitionArea.CheckDefName(edt_DefinitionName.Text, Available);

    if (Available = True) and (FActive <> 'Edit') then
      ShowMessage('This name has been used!')
    else
    begin
      FileName := MyDirectory + '\Def_' + edt_DefinitionName.Text + '.txt';

      if FActive = 'Copy' then
      begin
        AssignFile(MFile, FileName);
        Rewrite(MFile);

        for I := 0 to ListDefSelected.Count - 1 do
          Writeln(MFile, ListDefSelected[I]);

        CloseFile(MFile);
      end
      else if FActive = 'Edit' then
      begin
        AssignFile(MFile, FileName);
        Rewrite(MFile);

        if FileExists(FileName) then
        begin
          DeleteFile(FileName);

          for I := 0 to FormDefinition.FListDefArea.Count - 1 do
          begin
            Writeln(MFile, FormDefinition.FListDefArea[I]);
          end;
            CloseFile(MFile);
        end;
      end
      else
      begin
        if (FormDefinition.FListDefArea.Count = 0) or
          (lst_SelectedArea.Count <> FormDefinition.FListDefArea.Count)  then
        begin
          ShowMessage('Definition Area is Empty!');
          Exit;
        end
        else
        begin
          AssignFile(MFile, FileName);
          Rewrite(MFile);

          for I := 0 to FormDefinition.FListDefArea.Count - 1 do
          begin
            Writeln(MFile, FormDefinition.FListDefArea[I]);
          end;
            CloseFile(MFile);
        end;
      end;

      DefinitionArea.RefreshDef;

      edt_DefinitionName.Text := '';
      lst_SelectedArea.Clear;
      FormDefinition.FListDefArea.Clear;

      Close;
    end;
  end;
end;

procedure TCreateDefinitionArea.btn_ZoomInClick(Sender: TObject);
begin
  ToolBar('ZoomIn');
end;

procedure TCreateDefinitionArea.chklst_ListGameAreaClickCheck(Sender: TObject);
var
  I, J, FValue : Integer;
  SelectArea : string;
begin
  FValue := 0;

  for I := 0 to chklst_ListGameArea.Count - 1 do
  begin
    SelectArea := chklst_ListGameArea.Items.Strings[i];

    if chklst_ListGameArea.Checked[i] then
    begin
      if lst_SelectedArea.Count <> 0 then
      begin
        for J := 0 to lst_SelectedArea.Count - 1 do
        begin
          if lst_SelectedArea.Items.Strings[J] =  SelectArea then
            FValue := (FValue + 1)
          else
            FValue := (FValue + 0);
        end;

        if FValue = 0 then
        begin
          lst_SelectedArea.Items.Add(SelectArea);
          FormDefinition.FListCheckValueArea.Add('0');
        end;

        FValue := 0;
      end
      else
      begin
        lst_SelectedArea.Items.Add(SelectArea);
        FormDefinition.FListCheckValueArea.Add('0');
      end
    end
    else
    begin
      for J := 0 to lst_SelectedArea.Count - 1  do
      begin
        if lst_SelectedArea.Items.Strings[J] = SelectArea then
        begin
          if (FActive = 'Edit') and (FormDefinition.FListCheckValueArea[J] = '1') then
          begin
            ListDefSelected.Delete(J);
            FormDefinition.FListDefArea.Delete(J);
            FormDefinition.FCountOriArea := ListDefSelected.Count;
          end;

          lst_SelectedArea.Items.Delete(J);
          FormDefinition.FListCheckValueArea.Delete(J);
          Break;
        end;
      end;
    end;
  end;

  if chk_SeeMap.Checked then
  begin
    btn_Up.Enabled := False;
    btn_Down.Enabled := False;
  end
  else
  begin
    btn_Up.Enabled := True;
    btn_Down.Enabled := True;
  end;
end;


procedure TCreateDefinitionArea.chk_SeeMapClick(Sender: TObject);
begin
  lst_SelectedArea.OnClick(lst_SelectedArea);
  btn_Up.Enabled := False;
  btn_Down.Enabled := False;
end;

procedure TCreateDefinitionArea.ClearAll;
begin
  ListGameArea.Clear;
  ListDefSelected.Clear;
  chk_SeeMap.Checked := False;
  btn_Up.Enabled := False;
  btn_Down.Enabled := False;
  btn_SetDef.Enabled := False;

  FormDefinition.FObjArea := False;

  FListDefinitionArea.Clear;
  FormDefinition.FListDefArea.Clear;
  FormDefinition.FListCheckValueArea.Clear;
  FormDefinition.btn_Close.Enabled := True;
  FormDefinition.Close;
  lst_SelectedArea.Clear;

  FActive := '';
  S_XPoint := 0;
  S_YPoint := 0;
  E_XPoint := 0;
  E_YPoint := 0;

  FS_PointX := 0;
  FS_PointY := 0;
  FE_PointX := 0;
  FE_PointY := 0;

  refresh;
end;

procedure TCreateDefinitionArea.Action(BtnActive : string);
var
  I, J, NumberCopy, index, Warning : Integer;
  FArea, Directory, FDefSelected, FSelectedArea, a : string;
begin
  for I := 0 to DefinitionArea.lst_DefinitionArea.Count - 1 do
  begin
    if DefinitionArea.lst_DefinitionArea.Selected[I] then
    begin
      FDefSelected := DefinitionArea.lst_DefinitionArea.Items.Strings[I];
      Directory := vAppDBSetting.MapDefGame + '\Def_' + FDefSelected + '.txt';
      Break;
    end;
  end;

  if BtnActive = 'New' then
  begin
    lst_SelectedArea.Enabled := True;
    chk_SeeMap.Enabled := True;
    FormDefinition.btn_Close.Enabled := True;
    ShowModal;
  end
  else if BtnActive = 'Edit' then
  begin
    FActive := 'Edit';

    if FileExists(Directory) then
    begin
      ListDefSelected.LoadFromFile(Directory);
      FormDefinition.FListDefArea.LoadFromFile(Directory);
      FormDefinition.FCountOriArea := ListDefSelected.Count;
    end;

    refresh;

    for I := 0 to ListDefSelected.Count - 1 do
    begin
      GetDefList('Area_', ListDefSelected[I], FArea);
      lst_SelectedArea.Items.Add(FArea);
      FormDefinition.FListCheckValueArea.Add('1');

      for J := 0 to chklst_ListGameArea.Count - 1 do
      begin
        a := chklst_ListGameArea.Items.Strings[J];
        if chklst_ListGameArea.Items.Strings[J] = FArea then
        begin
          chklst_ListGameArea.Checked[J]:= True;
          Break;
        end;
      end;
    end;

    edt_DefinitionName.Text := FDefSelected;
    edt_DefinitionName.Enabled := False;
    lst_SelectedArea.Enabled := True;
    chk_SeeMap.Enabled := True;
    btn_SetDef.Enabled := True;
    ShowModal;
  end
  else if BtnActive = 'Remove' then
  begin
    Warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);

    if Warning = mrOk then
    begin
      uSimDBEditor.getGameEnviByGameDef(FDefSelected, Game_Environment);

      if Game_Environment.FData.Game_Enviro_Identifier = '' then
      begin
        if FileExists(Directory) then
          DeleteFile(Directory);
      end
      else
      begin
        ShowMessage('This definition area has been used by ' +
          Game_Environment.FData.Game_Enviro_Identifier);

        Game_Environment.Free;
      end;

      DefinitionArea.RefreshDef;
    end;
  end
  else if BtnActive = 'Copy' then
  begin
    FActive := 'Copy';

    if FileExists(Directory) then
      ListDefSelected.LoadFromFile(Directory);

    refresh;

    for I := 0 to ListDefSelected.Count - 1 do
    begin
      GetDefList('Area_', ListDefSelected[I], FArea);
      lst_SelectedArea.Items.Add(FArea);
      FormDefinition.FListCheckValueArea.Add('1');

      for J := 0 to chklst_ListGameArea.Count - 1 do
      begin
        a := chklst_ListGameArea.Items.Strings[J];
        if chklst_ListGameArea.Items.Strings[J] = FArea then
        begin
          chklst_ListGameArea.Checked[J]:= True;
          Break;
        end;
      end;
    end;

    index := Pos('- Copy', FDefSelected);
    if index = 0 then
       DefinitionArea.CheckNumberCopy(FDefSelected, NumberCopy)
    else
    begin
       FSelectedArea := Copy(FDefSelected, 1, index-1);
       DefinitionArea.CheckNumberCopy(FSelectedArea, NumberCopy);
    end;

    if (index = 0) and (NumberCopy = 1) then
      edt_DefinitionName.Text := FDefSelected + '- Copy'
    else if (index = 0) and (NumberCopy > 1) then
      edt_DefinitionName.Text := FDefSelected + '- Copy(' + IntToStr(NumberCopy) + ')'
    else
      edt_DefinitionName.Text := FSelectedArea+ '- Copy(' + IntToStr(NumberCopy) + ')';

     ShowModal;
  end;

  lst_SelectedArea.Enabled := False;
  edt_DefinitionName.Enabled := True;

  chk_SeeMap.Enabled := False;
  btn_Up.Enabled := False;
  btn_Down.Enabled := False;
  btn_SetDef.Enabled := False;
end;

function TCreateDefinitionArea.FindMarker(const LookingFor: string;
  var Mark: string): Boolean;
begin
    if LookingFor = 'Area_' then
    Mark := '\X1_'
  else if LookingFor = 'X1_' then
    Mark := '\Y1_'
  else if LookingFor = 'X2_' then
    Mark := '\Y2_'
  else if LookingFor = 'Y1_' then
    Mark := '\X2_'
  else if LookingFor = 'Y2_' then
    Mark := '\InZoom_'
  else if LookingFor = 'InZoom_' then
    Mark := '\OutZoom_'
  else
    Mark := '#';
end;

procedure TCreateDefinitionArea.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ClearAll;
end;

procedure TCreateDefinitionArea.FormCreate(Sender: TObject);
var
  I : Integer;
  z : Double;
begin
  ListGameArea := TList.Create;
  Game_Environment := TGame_Environment_Definition.Create;
  FCanvas := TCanvas.Create;
  FConverter := TCoordConverter.Create;
  FListDefinitionArea := TStringList.Create;
  ListDefSelected := TStringList.Create;
end;

procedure TCreateDefinitionArea.FormShow(Sender: TObject);
var
  mInfo : CMapXLayerInfo;
  mLayer : CMapXLayer;
begin
  mp_SelectedGameArea.Geoset := vAppDBSetting.MapDefView + '\_MAP_OTHER\Indonesia.gst';;
  mInfo := CoLayerInfo.Create;
  mInfo.type_ := miLayerInfoTypeUserDraw;
  mInfo.AddParameter('Name', 'LYR_DRAW');
  mLayer := mp_SelectedGameArea.Layers.Add(mInfo, 1);
  mp_SelectedGameArea.Layers.AnimationLayer := mLayer;
  mp_SelectedGameArea.MapUnit := miUnitNauticalMile;

  FConverter.FMap := mp_SelectedGameArea;

  if (FActive <> 'Edit') and (FActive <> 'Copy') then
    refresh;

  if FActive = 'Copy' then
  begin
    lst_SelectedArea.Enabled := False;
    edt_DefinitionName.Enabled := True;
  end
  else if FActive = 'Edit' then
  begin
    lst_SelectedArea.Enabled := True;
    edt_DefinitionName.Enabled := False;
    btn_SetDef.Enabled := False;
  end
  else if FActive = 'New' then
  begin
    lst_SelectedArea.Enabled := True;
    edt_DefinitionName.Enabled := True;
  end;

  if FormDefinition.FObjArea = True then
    FormDefinition.Show;
end;

procedure TCreateDefinitionArea.GetDefArea(FSelectedArea: string);
var
  I : Integer;
  FArea, FX1, FY1, FX2, FY2, FZoomIn, FZoomOut, FData : string;
  FIndexZoomIn, FIndexZoomOut : Integer;
begin
  for I := 0 to ListDefSelected.Count - 1 do
  begin
    FData := ListDefSelected[I];
    GetDefList('Area_', FData, FArea);
    if FArea = FSelectedArea then
    begin
      GetDefList('X1_', FData, FX1);
      GetDefList('Y1_', FData, FY1);
      GetDefList('X2_', FData, FX2);
      GetDefList('Y2_', FData, FY2);
      GetDefList('InZoom_', FData, FZoomIn);
      GetDefList('OutZoom_', FData, FZoomOut);

      FormDefinition.FS_MapX := StrToFloat(FX1);
      FormDefinition.FS_MapY := StrToFloat(FY1);
      FormDefinition.FE_MapX := StrToFloat(FX2);
      FormDefinition.FE_MapY := StrToFloat(FY2);
      FormDefinition.edt_ZoomMinValue.Text := FZoomIn;
      FormDefinition.edt_ZoomMaxValue.Text := FZoomOut;

      FormDefinition.FBtnActive := 3;
      FormDefinition.btn_PStart.Down := False;
      FormDefinition.btn_PEnd.Down := False;
      FormDefinition.Fill_Longlat;

      FS_PointX := StrToFloat(FX1);
      FS_PointY := StrToFloat(FY1);
      FE_PointX := StrToFloat(FX2);
      FE_PointY := StrToFloat(FY2);
      FormDefinition.FObjArea := True;
      Break;
    end;
  end;
end;

function TCreateDefinitionArea.GetDefList(LookFor, Sentence: string;
  var Value: string): Boolean;
var
  IndexSeparate1, IndexSeparate2, IndexSeparate3 : Integer;
  Marker, FData : string;
  LData : Integer;
begin
  IndexSeparate1 := Pos(LookFor, Sentence);
  if IndexSeparate1 > 0 then
  begin
    FindMarker(LookFor, Marker);
    IndexSeparate2 := Pos(Marker, Sentence);
    FData := Copy(Sentence, IndexSeparate1, (IndexSeparate2 - IndexSeparate1));

    LData := Length(FData);
    IndexSeparate3 := Pos('_', FData);
    Value := Copy(FData, IndexSeparate3 + 1, LData);
    Value := Trim(Value);
  end
  else
    Value := '0';

  Result := (Value <> '');
end;

procedure TCreateDefinitionArea.Insert;
begin
  with Game_Environment.FGameArea do // Insert to database Game_Area_Definition
  begin
    FCenterX := FLongitude;
    FCenterY := FLattitude;

    Detail_Map := '';
    Game_Area_Identifier := edt_DefinitionName.Text;
    Game_Centre_Long := FCenterX;
    Game_Centre_Lat := FCenterY;
    Game_X_Dimension := mp_SelectedGameArea.Zoom;
    Game_Y_Dimension := mp_SelectedGameArea.Zoom;

    with SIMMgr do
    begin
      ID_GameArea := insertGameAreaDef(Game_Environment);
      Game_Environment.FGameArea.Game_Area_Index := ID_GameArea;
    end;
  end;
end;

procedure TCreateDefinitionArea.Load_Map(NameArea: string);
var
  mInfo : CMapXLayerInfo;
  mLayer : CMapXLayer;
begin
  mp_SelectedGameArea.Geoset := vAppDBSetting.MapGSTGame + '\' + NameArea + '\' + NameArea + '.gst';
  mInfo := CoLayerInfo.Create;
  mInfo.type_ := miLayerInfoTypeUserDraw;
  mInfo.AddParameter('Name', 'LYR_DRAW');
  mLayer := mp_SelectedGameArea.Layers.Add(mInfo, 1);
  mp_SelectedGameArea.Layers.AnimationLayer := mLayer;
  mp_SelectedGameArea.MapUnit := miUnitNauticalMile;
end;

procedure TCreateDefinitionArea.lst_SelectedAreaClick(Sender: TObject);
var
  I, J: Integer;
  FData, Directory: string;
  FArea, FX1, FY1, FX2, FY2, FZoomIn, FZoomOut : string;
  FIndexZoomIn, FIndexZoomOut : Integer;
  FListDef : TStringList;
begin
  if chk_SeeMap.Checked then
  begin
    uSimDBEditor.getGameArea(IntToStr(ExerciseAreaForm.idGameArea),
      ExerciseAreaForm.areaList, ExerciseAreaForm.gameEnv);

    for i := 0 to lst_SelectedArea.Count - 1 do
    begin
      if lst_SelectedArea.Selected[i] then
      begin
        FSelectedArea := lst_SelectedArea.Items.Strings[i];
        FormDefinition.Caption := FSelectedArea;
        FormDefinition.FIndex := i;
        FIndexAreaSelected := i;

        Load_Map(lst_SelectedArea.Items.Strings[i]);

        mp_SelectedGameArea.Zoom := LastZoom;
        mp_SelectedGameArea.CenterX := LastCenterX;
        mp_SelectedGameArea.CenterY := LastCenterY;

        if FActive = 'Edit' then
          GetDefArea(FSelectedArea)
        else
        begin
          for J := 0 to FormDefinition.FListDefArea.Count - 1 do
          begin
          FData := FormDefinition.FListDefArea[J];
          GetDefList('Area_', FData, FArea);

            if FArea = FSelectedArea then
            begin
              FormDefinition.FNewData := FData;
              FormDefinition.FIndexNewdata := J;
              GetDefList('X1_', FData, FX1);
              GetDefList('Y1_', FData, FY1);
              GetDefList('X2_', FData, FX2);
              GetDefList('Y2_', FData, FY2);
              GetDefList('InZoom_', FData, FZoomIn);
              GetDefList('OutZoom_', FData, FZoomOut);

              FormDefinition.FS_MapX := StrToFloat(FX1);
              FormDefinition.FS_MapY := StrToFloat(FY1);
              FormDefinition.FE_MapX := StrToFloat(FX2);
              FormDefinition.FE_MapY := StrToFloat(FY2);
              FormDefinition.edt_ZoomMinValue.Text := FZoomIn;
              FormDefinition.edt_ZoomMaxValue.Text := FZoomOut;

              FormDefinition.FBtnActive := 3;
              FormDefinition.btn_PStart.Down := False;
              FormDefinition.btn_PEnd.Down := False;
              FormDefinition.Fill_Longlat;

              FS_PointX := StrToFloat(FX1);
              FS_PointY := StrToFloat(FY1);
              FE_PointX := StrToFloat(FX2);
              FE_PointY := StrToFloat(FY2);
              FormDefinition.FObjArea := True;
              mp_SelectedGameArea.Repaint;
              Break;
            end;
          end;
        end;
        btn_SetDef.Enabled := True;
        Break;
      end;
    end;
    btn_Up.Enabled := False;
    btn_Down.Enabled := False;
  end
  else
  begin
    btn_Up.Enabled := True;
    btn_Down.Enabled := True;
  end;

end;

procedure TCreateDefinitionArea.mp_SelectedGameAreaMapViewChanged(
  Sender: TObject);
begin
  lbl_ZoomValue.Caption := FloatToStr(mp_SelectedGameArea.Zoom);

  LastZoom := mp_SelectedGameArea.Zoom;
  LastCenterX := mp_SelectedGameArea.CenterX;
  LastCenterY := mp_SelectedGameArea.CenterY;

  if FBtnSetDef = True then
    FormDefinition.Show;
end;

procedure TCreateDefinitionArea.mp_SelectedGameAreaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  FPointx, FPointy : Double;
begin
  FMouseDown := Button = mbLeft;

  if mp_SelectedGameArea.CurrentTool = miArrowTool then
  begin
    FConverter.ConvertToMap(X, Y, FPointx, FPointy);

    if FormDefinition.FBtnActive > 0 then
    begin
      if FormDefinition.FBtnActive = 1 then
      begin
        FS_PointX := FPointx;
        FS_PointY := FPointy;
        FormDefinition.FS_MapX := FPointx;
        FormDefinition.FS_MapY := FPointy;
      end
      else
      begin
        FE_PointX := FPointx;
        FE_PointY := FPointy;
        FormDefinition.FE_MapX := FPointx;
        FormDefinition.FE_MapY := FPointy;
      end;

      FormDefinition.Fill_Longlat;
      FormDefinition.Show;
    end;
  end;
  mp_SelectedGameArea.Repaint;
end;

procedure TCreateDefinitionArea.mp_SelectedGameAreaDrawUserLayer(
  ASender: TObject; const Layer: IDispatch; hOutputDC, hAttributeDC: Cardinal;
  const RectFull, RectInvalid: IDispatch);
begin
  FConverter.ConvertToScreen(FS_PointX, FS_PointY, S_XPoint, S_YPoint);
  FConverter.ConvertToScreen(FE_PointX, FE_PointY, E_XPoint, E_YPoint);

  with FCanvas do
  begin
    Handle := hOutputDC;
    Brush.Style := bsClear;
    Pen.Color := clRed;
    Pen.Width := 3;

    if FormDefinition.FObjArea then
    begin
      if (FormDefinition.edt_X1Value.Text <> '0') and (FormDefinition.edt_X2Value.Text <> '0') then
      begin
//        Rectangle(S_XPoint, S_YPoint, E_XPoint, E_YPoint);
        MoveTo(S_XPoint, S_YPoint);
        LineTo(E_XPoint, S_YPoint);

        MoveTo(E_XPoint, S_YPoint);
        LineTo(E_XPoint, E_YPoint);

        MoveTo(E_XPoint, E_YPoint);
        LineTo(S_XPoint, E_YPoint);

        MoveTo(S_XPoint, E_YPoint);
        LineTo(S_XPoint, S_YPoint);
      end
      else if FormDefinition.FBtnActive = 1 then
        Ellipse(S_XPoint-5, S_YPoint-5, S_XPoint+5, S_YPoint+5);
    end;
  end;
end;

procedure TCreateDefinitionArea.refresh;
var
  i : Integer;
begin
  uSimDBEditor.getGameAreaList(ListGameArea);

  chklst_ListGameArea.Items.Clear;
  lst_idGameArea.Items.Clear;

  for I := 0 to ListGameArea.Count - 1 do
  begin
    chklst_ListGameArea.Items.Add(TGame_Environment_Definition
      (ListGameArea[I]).FGameArea.Game_Area_Identifier);
    lst_idGameArea.Items.Add(IntToStr(TGame_Environment_Definition
      (ListGameArea[I]).FGameArea.Game_Area_Index));
  end;
end;

procedure TCreateDefinitionArea.ToolBar(const FToolbar: string);
begin
  if FToolbar = 'Cursor' then
  begin
    mp_SelectedGameArea.CurrentTool   := miArrowTool;
    mp_SelectedGameArea.MousePointer  := crDefault;
    FCursor := True;
  end
  else if FToolbar = 'HandTool' then
  begin
    mp_SelectedGameArea.CurrentTool  := miPanTool;
    mp_SelectedGameArea.MousePointer := miPanCursor;
    FCursor := False;
  end
  else if FToolbar = 'ZoomIn' then
  begin
    mp_SelectedGameArea.CurrentTool  := miZoomInTool;
    mp_SelectedGameArea.MousePointer := miZoomInCursor;
    FCursor := False;
  end
  else if FToolbar = 'ZoomOut' then
  begin
    mp_SelectedGameArea.CurrentTool  := miZoomOutTool;
    mp_SelectedGameArea.MousePointer := miZoomOutCursor;
    FCursor := False;
  end
  else if FToolbar = 'Center' then
  begin
    mp_SelectedGameArea.CurrentTool  := miCenterTool;
    mp_SelectedGameArea.MousePointer := miCenterCursor;
    FCursor := False;
  end;

  if FBtnSetDef = True then
    FormDefinition.Show;
end;

end.
