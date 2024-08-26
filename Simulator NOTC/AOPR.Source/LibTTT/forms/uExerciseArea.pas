unit uExerciseArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_GameEnvironment,
  uCoordConvertor;

type
  TExerciseAreaForm = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    PageControl1: TPageControl;
    General: TTabSheet;
    Occulting: TTabSheet;
    grbCentre: TGroupBox;
    lblLatitude: TStaticText;
    lblLongitude: TStaticText;
    edtLatitude: TEdit;
    edtLongitude: TEdit;
    grbDimensions: TGroupBox;
    lblMaximum: TStaticText;
    edtMaximum: TEdit;
    btnSelectGame: TButton;
    cbUseCoastlines: TCheckBox;
    Panel1: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    btnImportLandmassData: TButton;
    btnEditLandmassData: TButton;
    lblnm: TStaticText;
    Memo1: TMemo;
    btnPreprocess: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnImportLandmassDataClick(Sender: TObject);
    procedure btnEditLandmassDataClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnSelectGameClick(Sender: TObject);
    procedure cbUseCoastlinesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    FCoordPlatformConv : TCoordConverter;
    procedure insert();
    procedure update();
  public
    isNew : boolean;
    isENC : boolean;
    isCopy  : Boolean;
    gameEnv: TGame_Environment_Definition;
    idGameArea: Integer;
    areaList : Tlist;
    sizePeta : integer;
    procedure getGameArea;
    procedure setZoomENC();
    { Public declarations }
  end;

var
  ExerciseAreaForm: TExerciseAreaForm;

implementation

{$R *.dfm}
uses uDataModuleTTT, uGameAreaList,uSimDBEditor, uGeographicalFeatureImport,
  uLandmassEditor,drawrec, uEnvironment, uBaseCoordSystem, uGameAreaSelection;

procedure TExerciseAreaForm.btnApplyClick(Sender: TObject);
var
  rec : TGame_Environment_Definition;
  fileSource, fileDest, fileDestDynamic, nameGeoset : string;
begin
  if strtoint(edtMaximum.Text) > 2500 then
  begin
  //ShowMessage('Width Must Be Less Than 2500 nm');
  edtMaximum.Text := '2500';
  end
  else
  if isNew then
  begin
    insert;
    isNew := false;
  end
  else
  begin
    update;
  end;

  btnSelectGame.Enabled := true;
  cbUseCoastlines.Enabled := true;
  fGameAreaList.refresh;

  nameGeoset := gameEnv.FGameArea.Game_Area_Identifier;
  if isENC = true then
  begin
        fileSource := 'mapsea\IndonesiaBaru.gst';
        fileDest := 'mapsea\'+nameGeoset+'.gst';
        fileDestDynamic := GeographicalFeatureImportForm.getBrowsePath + '\' + nameGeoset+'.gst';
        //fileDestDynamic := GeographicalFeatureImportForm.edtLibrary.Text + '\' + nameGeoset+'.gst';
        CopyFile(PChar(fileSource), PChar(fileDest), False);
        CopyFile(PChar(fileSource), PChar(fileDestDynamic), False);
  end
  else
  begin
        fileSource := 'map\result.gst';
        fileDest := 'game_area\'+nameGeoset+'\'+nameGeoset+'.gst';
        fileDestDynamic := GeographicalFeatureImportForm.getBrowsePath + '\' + nameGeoset + '\' + nameGeoset +'.gst';
        //fileDestDynamic := GeographicalFeatureImportForm.edtLibrary.Text + '\' + nameGeoset + '\' + nameGeoset +'.gst';
        CopyFile(PChar(fileSource), PChar(fileDest), False);
        CopyFile(PChar(fileSource), PChar(fileDestDynamic), False);
  end;

  {fileSource := 'map\result.gst';
  fileDest := 'game_area\'+nameGeoset+'.gst';
  CopyFile(PChar(fileSource), PChar(fileDest), False);}
end;

procedure TExerciseAreaForm.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TExerciseAreaForm.setZoomENC();
var
   limitWidth : Array[0..15] of double;
   arrayTemp : Array[0..30] of double;
   arrayStringTemp : Array[0..30] of String;
   resultTemp : Array[0..30] of String;
   a, b : integer;
   widthNM : integer;
begin
        //isi combo box
        uLandmassEditor.fLandmassEditor.cbSetScale.Clear;
        widthNM := strtoint(ExerciseAreaForm.edtMaximum.Text);

        {limitWidth[0] := 0.1;
        limitWidth[1] := 0.2;
        limitWidth[2] := 0.5;
        limitWidth[3] := 1;
        limitWidth[4] := 2;
        limitWidth[5] := 5;
        limitWidth[6] := 10;
        limitWidth[7] := 20;
        limitWidth[8] := 50;
        limitWidth[9] := 100;
        limitWidth[10] := 200;
        limitWidth[11] := 500;
        limitWidth[12] := 1000;
        limitWidth[13] := 1500;
        limitWidth[14] := 2000;
        limitWidth[15] := 2500;   }

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
            uLandmassEditor.fLandmassEditor.cbSetScale.Items.Add(resultTemp[b]);
        end;
end;

procedure TExerciseAreaForm.btnEditLandmassDataClick(Sender: TObject);
var
   //isENC : boolean;
   ENCGeoset, stringConverter, p, pDynamic,nameOfMap : string;
   myWideCharPtr : PWideChar;
{   limitWidth : Array[0..15] of double;
   arrayTemp : Array[0..30] of double;
   arrayStringTemp : Array[0..30] of String;
   resultTemp : Array[0..30] of String;
   a, b : integer;
   widthNM : integer;}
begin
   fLandmassEditor.btnEditCharacteristic.Visible := false;

   if uGameAreaList.fGameAreaList.flagIsNew = true then
   begin
        isENC := uGeographicalFeatureImport.GeographicalFeatureImportForm.ENC;
        if isENC = true then
        begin
             fLandmassEditor.mapLandMass.Geoset := '';
             ENCGeoset := ExtractFilePath(Application.ExeName) + 'mapsea\IndonesiaBaru.gst';
             fLandmassEditor.LoadENC(ENCGeoset);
             if (ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Long <> 0) and (ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Lat <> 0) then
             begin
                fLandmassEditor.mapLandMass.CenterX := ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Long;
                fLandmassEditor.mapLandMass.CenterY := ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Lat;
             end;
             setZoomENC();

             fLandmassEditor.ckFeatureSelection.Enabled := false;
             fLandmassEditor.lbFeatureCategory.Enabled := false;
             fLandmassEditor.btnCheckInternalIntersections.Enabled := false;
             fLandmassEditor.btnCheckIntersectionWithOtherContours.Enabled := false;
             fLandmassEditor.btnClearErrorIndications.Enabled := false;
             fLandmassEditor.btnDeleteAll.Enabled := false;
             fLandmassEditor.ToolButton2.Enabled := false;
        end
        else
        begin
             //create new folder at \T3.bin\game_area\name_game_area   and (M):\game_area\name_game_area
             //create new folder at M:\game_area\name_game_area
{             p := ExtractFilePath(Application.ExeName);
             p := p + 'game_area\';
             pDynamic := GeographicalFeatureImportForm.getBrowsePath + '\';                                  }
             //pDynamic := GeographicalFeatureImportForm.edtLibrary.Text + '\';
             //pDynamic := GeographicalFeatureImportForm.sFolder + '\';

{             if DirectoryExists(p + edtName.Text) AND DirectoryExists(pDynamic + edtName.Text) then
             begin
                  stringConverter := p + edtName.Text;
                  myWideCharPtr := Addr(stringConverter[1]);
                  RemoveDirectory(myWideCharPtr);
                  CreateDir(p + edtName.Text);

                  stringConverter := pDynamic + edtName.Text;
                  myWideCharPtr := Addr(stringConverter[1]);
                  RemoveDirectory(myWideCharPtr);
                  CreateDir(pDynamic + edtName.Text);
             end
             else
             begin
                  CreateDir(p + edtName.Text);
                  CreateDir(pDynamic + edtName.Text);
             end;
             CreateDir(p + edtName.Text + '\cells\');
             CreateDir(pDynamic + edtName.Text + '\cells\');

             //create sub folder at \T3.bin\game_area\name_game_area\cells\layers_name
             if GeographicalFeatureImportForm.coastl = true then
             begin
                  CreateDir(p + edtName.Text + '\cells\coastl');
                  CreateDir(pDynamic + edtName.Text + '\cells\coastl');
             end;
             if GeographicalFeatureImportForm.depthl = true then
             begin
                  CreateDir(p + edtName.Text + '\cells\depthl');
                  CreateDir(pDynamic + edtName.Text + '\cells\depthl');
             end;
             if GeographicalFeatureImportForm.contourl = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\contourl');
                 CreateDir(pDynamic + edtName.Text + '\cells\contourl');
             end;
             if GeographicalFeatureImportForm.mispopp = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\mispopp');
                 CreateDir(pDynamic + edtName.Text + '\cells\mispopp');
             end;
             if GeographicalFeatureImportForm.builtupa = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\builtupa');
                 CreateDir(pDynamic + edtName.Text + '\cells\builtupa');
             end;
             if GeographicalFeatureImportForm.aerofacpmil = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\aerofacpmil');
                 CreateDir(pDynamic + edtName.Text + '\cells\aerofacpmil');
             end;
             if GeographicalFeatureImportForm.aerofacpciv = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\aerofacpciv');
                 CreateDir(pDynamic + edtName.Text + '\cells\aerofacpciv');
             end;
             if GeographicalFeatureImportForm.aerofacpot = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\aerofacpot');
                 CreateDir(pDynamic + edtName.Text + '\cells\aerofacpot');
             end;
             if GeographicalFeatureImportForm.railrdlprim = true then
             begin
               CreateDir(p + edtName.Text + '\cells\railrdlprim');
               CreateDir(pDynamic + edtName.Text + '\cells\railrdlprim');
             end;
             if GeographicalFeatureImportForm.railrdlsec = true then
             begin
               CreateDir(p + edtName.Text + '\cells\railrdlsec');
               CreateDir(pDynamic + edtName.Text + '\cells\railrdlsec');
             end;
             if GeographicalFeatureImportForm.roadlprim = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\roadlprim');
                 CreateDir(pDynamic + edtName.Text + '\cells\roadlprim');
             end;
             if GeographicalFeatureImportForm.roadlsec = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\roadlsec');
                 CreateDir(pDynamic + edtName.Text + '\cells\roadlsec');
             end;
             if GeographicalFeatureImportForm.pipel = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\pipel');
                 CreateDir(pDynamic + edtName.Text + '\cells\pipel');
             end;
             if GeographicalFeatureImportForm.polbnda = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\polbnda');
                 CreateDir(pDynamic + edtName.Text + '\cells\polbnda');
             end;
             if GeographicalFeatureImportForm.oceansea = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\oceansea');
                 CreateDir(pDynamic + edtName.Text + '\cells\oceansea');
             end;
             if GeographicalFeatureImportForm.wreck = true then
             begin
                 CreateDir(p + edtName.Text + '\cells\wreck');
                 CreateDir(pDynamic + edtName.Text + '\cells\wreck');
             end;
                                                                                          }
             //load map
             //fLandmassEditor.load();
             //sizePeta := strtoint(ExerciseAreaForm.edtMaximum.Text);
             //fLandmassEditor.mapLandMass.ZoomTo(sizePeta, fEditGameCenter.GCx, fEditGameCenter.GCy);
             fLandmassEditor.createGeoset(ExerciseAreaForm.edtName.Text);
             setZoomENC();
             fLandmassEditor.btnCheckInternalIntersections.Enabled := true;
             fLandmassEditor.btnCheckIntersectionWithOtherContours.Enabled := true;
             fLandmassEditor.btnClearErrorIndications.Enabled := true;
             fLandmassEditor.btnDeleteAll.Enabled := true;
             fLandmassEditor.ToolButton2.Enabled := true;
        end;
   end
   else
   begin
        dmTTT.GetGame_Area_DefByID(GameEnv.FData.Game_Area_Index, GameEnv);
        nameOfMap := GameEnv.FGameArea.Game_Area_Identifier;
        if GameEnv.FGameArea.Detail_Map = 'ENC' then
        begin
             fLandmassEditor.mapLandMass.Geoset := '';
             ENCGeoset := ExtractFilePath(Application.ExeName) + 'mapsea\IndonesiaBaru.gst';
             fLandmassEditor.LoadENC(ENCGeoset);
             if (ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Long <> 0) and (ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Lat <> 0) then
             begin
                fLandmassEditor.mapLandMass.CenterX := ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Long;
                fLandmassEditor.mapLandMass.CenterY := ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Lat;
             end;
             setZoomENC();

             fLandmassEditor.ckFeatureSelection.Enabled := false;
             fLandmassEditor.lbFeatureCategory.Enabled := false;
             fLandmassEditor.btnCheckInternalIntersections.Enabled := false;
             fLandmassEditor.btnCheckIntersectionWithOtherContours.Enabled := false;
             fLandmassEditor.btnClearErrorIndications.Enabled := false;
             fLandmassEditor.btnDeleteAll.Enabled := false;
             fLandmassEditor.ToolButton2.Enabled := false;
        end
        else
        begin
             //load map
             //sizePeta := strtoint(ExerciseAreaForm.edtMaximum.Text);
             //fLandmassEditor.mapLandMass.ZoomTo(sizePeta, fEditGameCenter.GCx, fEditGameCenter.GCy);
             fLandmassEditor.createGeoset(nameOfMap);
             setZoomENC();
             fLandmassEditor.btnCheckInternalIntersections.Enabled := true;
             fLandmassEditor.btnCheckIntersectionWithOtherContours.Enabled := true;
             fLandmassEditor.btnClearErrorIndications.Enabled := true;
             fLandmassEditor.btnDeleteAll.Enabled := true;
             fLandmassEditor.ToolButton2.Enabled := true;
        end;
   end;
  //fLandmassEditor.getPointGameCenter();
  //fLandmassEditor.mapLandMass.Repaint();
  fLandmassEditor.cbSetScale.ItemIndex := fLandmassEditor.cbSetScale.Items.Count-1;
  fLandmassEditor.cbSetScaleChange(Sender);
  fLandmassEditor.Show;
end;

procedure TExerciseAreaForm.btnImportLandmassDataClick(Sender: TObject);
begin
  GeographicalFeatureImportForm.coastl:= false;
  GeographicalFeatureImportForm.depthl:= false;
  GeographicalFeatureImportForm.contourl:= false;
  GeographicalFeatureImportForm.mispopp:= false;
  GeographicalFeatureImportForm.builtupa:= false;
  GeographicalFeatureImportForm.aerofacpmil:= false;
  GeographicalFeatureImportForm.aerofacpciv:= false;
  GeographicalFeatureImportForm.aerofacpot:= false;
  GeographicalFeatureImportForm.railrdlprim:= false;
  GeographicalFeatureImportForm.railrdlsec:= false;
  GeographicalFeatureImportForm.roadlprim:= false;
  GeographicalFeatureImportForm.roadlsec:= false;
  GeographicalFeatureImportForm.polbnda:= false;
  GeographicalFeatureImportForm.pipel:= false;
  GeographicalFeatureImportForm.oceansea:= false;
  GeographicalFeatureImportForm.wreck := false;
  GeographicalFeatureImportForm.Show;
end;

procedure TExerciseAreaForm.btnOKClick(Sender: TObject);
var
  rec : TGame_Environment_Definition;
  fileSource, fileDest, fileDestDynamic, nameGeoset : string;
begin
  if isNew then
  begin
    insert;
    isNew := false;
  end
  else
  begin
    update;
  end;

  btnSelectGame.Enabled := true;
  fGameAreaList.refresh;

  nameGeoset := gameEnv.FGameArea.Game_Area_Identifier;
  if isENC = true then
  begin
        fileSource := 'mapsea\IndonesiaBaru.gst';
        fileDest := 'mapsea\'+nameGeoset+'.gst';
        fileDestDynamic := GeographicalFeatureImportForm.getBrowsePath + '\' + nameGeoset+'.gst';
        //fileDestDynamic := GeographicalFeatureImportForm.edtLibrary.Text + '\' + nameGeoset+'.gst';
        CopyFile(PChar(fileSource), PChar(fileDest), False);
        CopyFile(PChar(fileSource), PChar(fileDestDynamic), False);
  end
  else
  begin
        fileSource := 'map\result.gst';
        fileDest := 'game_area\'+nameGeoset+'\'+nameGeoset+'.gst';
        fileDestDynamic := GeographicalFeatureImportForm.getBrowsePath + '\' + nameGeoset+'\'+nameGeoset+'.gst';
        //fileDestDynamic := GeographicalFeatureImportForm.edtLibrary.Text + '\' + nameGeoset+'\'+nameGeoset+'.gst';
        CopyFile(PChar(fileSource), PChar(fileDest), False);
        CopyFile(PChar(fileSource), PChar(fileDestDynamic), False);
  end;

  uEnvironment.EnvironmentForm.isENCmap := isENC;
  Self.Close;
end;

procedure TExerciseAreaForm.btnSelectGameClick(Sender: TObject);
begin
  //fEditGameCenter.xDegree.Text := edtLatitude.Text;
  //fEditGameCenter.yDegree.Text := edtLongitude.Text;
if strtoint(edtMaximum.Text) > 2500 then
begin
ShowMessage('Width Must Be Less Than 2500 nm');
edtMaximum.Text := '2500';
end
else
begin
    if edtLatitude.Text = '' then
    begin
      fEditGameCenter.yDegree.Text := formatDM_latitude(fEditGameCenter.FMap.CenterY);
    end
    else if edtLatitude.Text <> '' then
    begin
      fEditGameCenter.yDegree.Text := edtLatitude.Text;
    end;

    if edtLongitude.Text = '' then
    begin
      fEditGameCenter.xDegree.Text := formatDM_longitude(fEditGameCenter.FMap.CenterX);
    end
    else
    begin
      fEditGameCenter.xDegree.Text := edtLongitude.Text;
    end;

    if edtMaximum.Text = '' then
    begin
      fEditGameCenter.widthEdit.Text := '1000';
    end
    else
    begin
      fEditGameCenter.widthEdit.Text := edtMaximum.Text;
    end;

      fEditGameCenter.Show;
      fEditGameCenter.ApplyClick(Sender);

      //fEditGameCenter.xDegree.Text := edtLongitude.Text;
      //fEditGameCenter.yDegree.Text := edtLatitude.Text;
      //fEditGameCenter.widthEdit.Text := edtMaximum.Text;

  //fEditGameCenter.Show;
  end;
end;

procedure TExerciseAreaForm.cbUseCoastlinesClick(Sender: TObject);
begin
  if cbUseCoastlines.Checked then
  begin
    btnEditLandmassData.Enabled := true;
    btnImportLandmassData.Enabled := true;
  end
  else
  begin
    btnEditLandmassData.Enabled := false;
    btnImportLandmassData.Enabled := false;
  end;
end;

procedure TExerciseAreaForm.FormCreate(Sender: TObject);
begin
  FCoordPlatformConv := TCoordConverter.Create;
  Self.gameEnv := TGame_Environment_Definition.Create;
end;

procedure TExerciseAreaForm.FormShow(Sender: TObject);
begin
  if isNew then
  begin
    btnApply.Enabled := true;
    btnSelectGame.Enabled := true;
    idGameArea := 0;
  end
  else
  begin
    btnSelectGame.Enabled := true;
  end;

  if cbUseCoastlines.Checked then
  begin
    btnEditLandmassData.Enabled := true;
    btnImportLandmassData.Enabled := true;
  end
  else
  begin
    btnEditLandmassData.Enabled := false;
    btnImportLandmassData.Enabled := false;
  end;
end;

procedure TExerciseAreaForm.insert();
begin
  with gameEnv.FGameArea do
  begin
    //Game_Area_Index := Random(1000);
    Game_Area_Identifier := edtName.Text;
    Game_Centre_Lat := dmToLatitude(edtLatitude.Text);
    Game_Centre_Long := dmToLongitude(edtLongitude.Text);
    Game_X_Dimension := StrToInt(edtMaximum.Text);
    Game_Y_Dimension := StrToInt(edtMaximum.Text);
    Use_Real_World := 0;
    if cbUseCoastlines.Checked then
    begin
      Use_Artificial_Landmass := 1;
    end
    else
    begin
      Use_Artificial_Landmass := 0;
    end;
    if isENC = true then Detail_Map := 'ENC'
    else Detail_Map := 'VektorMap';

    with SIMMgr do
    begin
      idGameArea := insertGameAreaDef(gameEnv);
      gameEnv.FGameArea.Game_Area_Index := idGameArea;
      //ShowMessage('SUCCEED: Inserted '+gameEnvironment.FGameArea.Game_Area_Identifier);
    end;
  end;
end;


procedure TExerciseAreaForm.update;
begin
  with gameEnv.FGameArea do
  begin
    if idGameArea <> 0 then
       gameEnv.FGameArea.Game_Area_Index := idGameArea;

    Game_Area_Identifier := edtName.Text;
    Game_Centre_Lat := dmToLatitude(edtLatitude.Text);
    Game_Centre_Long := dmToLongitude(edtLongitude.Text);
    Game_X_Dimension := StrToInt(edtMaximum.Text);
    Game_Y_Dimension := StrToInt(edtMaximum.Text);
    Use_Real_World := 0;
    if cbUseCoastlines.Checked then
    begin
      Use_Artificial_Landmass := 1;
    end
    else
    begin
      Use_Artificial_Landmass := 0;
    end;
    if isENC = true then Detail_Map := 'ENC'
    else Detail_Map := 'VektorMap';

    with SIMMgr do
    begin
      updateGameAreaDef(gameEnv, IntToStr(gameEnv.FGameArea.Game_Area_Index));
      ShowMessage('SUCCEED: Updateed '+gameEnvironment.FGameArea.Game_Area_Identifier);
    end;
  end;
end;

procedure TExerciseAreaForm.getGameArea;
begin
  uSimDBEditor.getGameArea(IntToStr(idGameArea), areaList, gameEnv);

  with gameEnv do
  begin
   // edtName.Text := gameEnv.FGameArea.Game_Area_Identifier;
   if fGameAreaList.lbScenarioList.ItemIndex > -1 then
    begin
      idGameArea  := StrToInt(fGameAreaList.lbGameId.Items.Strings[fGameAreaList.lbScenarioList.ItemIndex]);
      if isCopy then
        edtName.Text := 'Copy Of ' + fGameAreaList.lbScenarioList.Items.Strings[fGameAreaList.lbScenarioList.ItemIndex]
      else
      edtName.Text := fGameAreaList.lbScenarioList.Items.Strings[fGameAreaList.lbScenarioList.ItemIndex];
    end
    else if fGameAreaSelection.lbAllGame.ItemIndex > -1 then
    begin
      idGameArea  := StrToInt(fGameAreaSelection.lbTempIdAll.Items.Strings[fGameAreaSelection.lbAllGame.ItemIndex]);
      if isCopy then
        edtName.Text := 'Copy Of ' + fGameAreaSelection.lbAllGame.Items.Strings[fGameAreaSelection.lbAllGame.ItemIndex]
      else
      edtName.Text := fGameAreaSelection.lbAllGame.Items.Strings[fGameAreaSelection.lbAllGame.ItemIndex];

    end;
    edtLatitude.Text := formatDM_latitude(FGameArea.Game_Centre_Lat);
    edtLongitude.Text := formatDM_longitude(FGameArea.Game_Centre_Long);

    edtMaximum.Text := FloatToStr(FGameArea.Game_X_Dimension);

    if FGameArea.Use_Real_World = 0 then
    begin
      cbUseCoastlines.Checked := false;
    end
    else
    begin
      cbUseCoastlines.Checked := true;
    end;

  end;

end;

end.
