unit uGeographicalFeatureImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ShellAPI, ShlObj;

type
  TGeographicalFeatureImportForm = class(TForm)
    Panel1: TPanel;
    btnClose: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    grbImportSource: TGroupBox;
    grbLibrary: TGroupBox;
    cbImportSource: TComboBox;
    edtLibrary: TEdit;
    grbImportFilters: TGroupBox;
    cbCoastline: TCheckBox;
    grbDepthContours: TGroupBox;
    cb10mDepthCountours: TCheckBox;
    cb20mDepthCountours: TCheckBox;
    cb40mDepthCountours: TCheckBox;
    cb60mDepthCountours: TCheckBox;
    cb80mDepthCountours: TCheckBox;
    cb100mDepthCountours: TCheckBox;
    cb140mDepthCountours: TCheckBox;
    cb160mDepthCountours: TCheckBox;
    cb180mDepthCountours: TCheckBox;
    cb200mDepthCountours: TCheckBox;
    cb300mDepthCountours: TCheckBox;
    cb400mDepthCountours: TCheckBox;
    cb500mDepthCountours: TCheckBox;
    cb700mDepthCountours: TCheckBox;
    cb1000mDepthCountours: TCheckBox;
    cbBelow1000mDepthCountours: TCheckBox;
    grbElevationContours: TGroupBox;
    cb100ftElevationContours: TCheckBox;
    cb200ftElevationContours: TCheckBox;
    cb500ftElevationContours: TCheckBox;
    cb1000ftElevationContours: TCheckBox;
    cb1500ftElevationContours: TCheckBox;
    cb2000ftElevationContours: TCheckBox;
    cb3000ftElevationContours: TCheckBox;
    cb5000ftElevationContours: TCheckBox;
    cb7000ftElevationContours: TCheckBox;
    cb10000ftElevationContours: TCheckBox;
    cbAbove10000ftElevationContours: TCheckBox;
    grbPopulatedPlaces: TGroupBox;
    cbPointsPopulatedPlaces: TCheckBox;
    cbAreasPopulatedPlaces: TCheckBox;
    grbAirports: TGroupBox;
    cbMilitaryAirports: TCheckBox;
    cbCivilianAirports: TCheckBox;
    cbOtherAirports: TCheckBox;
    grbRailroads: TGroupBox;
    cbPrimaryRailroads: TCheckBox;
    cbSecondaryRailroads: TCheckBox;
    grbRoads: TGroupBox;
    cbPrimaryRoads: TCheckBox;
    cbSecondaryRoads: TCheckBox;
    cbPoliticalBoundaries: TCheckBox;
    cbWrecks: TCheckBox;
    cbPipelines: TCheckBox;
    cbPlatforms: TCheckBox;
    grbScaleFactor: TGroupBox;
    trackScaleFactor: TTrackBar;
    edtScaleFactor: TEdit;
    cbDepthContours: TCheckBox;
    cbElevationContours: TCheckBox;
    cbPopulatedPlaces: TCheckBox;
    cbAirports: TCheckBox;
    cbrRilroads: TCheckBox;
    cbRoads: TCheckBox;
    lbl1ScaleFactor: TStaticText;
    lbl10ScaleFactor: TStaticText;
    cb120mDepthCountours: TCheckBox;
    Button1: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cbDepthContoursClick(Sender: TObject);
    procedure cbElevationContoursClick(Sender: TObject);
    procedure cbPopulatedPlacesClick(Sender: TObject);
    procedure cbAirportsClick(Sender: TObject);
    procedure cbrRilroadsClick(Sender: TObject);
    procedure cbRoadsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbImportSourceChange(Sender: TObject);
    procedure trackScaleFactorChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ENC : boolean;
    coastl, depthl, contourl, mispopp, builtupa : boolean;
    aerofacpmil, aerofacpciv, aerofacpot : boolean;
    railrdlprim, railrdlsec, roadlprim, roadlsec : boolean;
    polbnda, pipel, oceansea, wreck : boolean;
    sFolder : string;
    getBrowsePath : string;
    function BrowseDialog(const Flag: integer): string;
  end;

var
  GeographicalFeatureImportForm: TGeographicalFeatureImportForm;

implementation

uses
  uExerciseArea, uDataModuleTTT, FileCtrl, uGameAreaList, uLandmassEditor;

{$R *.dfm}

procedure TGeographicalFeatureImportForm.btnCloseClick(Sender: TObject);
var
   stringConverter, p, pDynamic: string;
   myWideCharPtr : PWideChar;
begin
  with ExerciseAreaForm.gameEnv.FGameArea do
  begin
     if cbImportSource.ItemIndex = 0 then
     begin
        Use_Real_World := 1;
     end
     else if cbImportSource.ItemIndex = 1 then
     begin
        Use_Artificial_Landmass := 1;
     end;
  end;

  dmTTT.updateGame_Area_Def(ExerciseAreaForm.gameEnv, IntToStr(ExerciseAreaForm.gameEnv.FGameArea.Game_Area_Index));
  if ENC = false then
      ShowMessage('Remember To Check Browse Path');

  //create new folder at \T3.bin\game_area\name_game_area   and (M):\game_area\name_game_area
  //create new folder at M:\game_area\name_game_area
  p := ExtractFilePath(Application.ExeName);
  p := p + 'game_area\';
  pDynamic := GeographicalFeatureImportForm.getBrowsePath + '\';
  //pDynamic := GeographicalFeatureImportForm.edtLibrary.Text + '\';
  //pDynamic := GeographicalFeatureImportForm.sFolder + '\';

  if DirectoryExists(p + ExerciseAreaForm.edtName.Text) AND DirectoryExists(pDynamic + ExerciseAreaForm.edtName.Text) then
  begin
        stringConverter := p + ExerciseAreaForm.edtName.Text;
        myWideCharPtr := Addr(stringConverter[1]);
        RemoveDirectory(myWideCharPtr);
        CreateDir(p + ExerciseAreaForm.edtName.Text);

        stringConverter := pDynamic + ExerciseAreaForm.edtName.Text;
        myWideCharPtr := Addr(stringConverter[1]);
        RemoveDirectory(myWideCharPtr);
        CreateDir(pDynamic + ExerciseAreaForm.edtName.Text);
  end
  else
  begin
        CreateDir(p + ExerciseAreaForm.edtName.Text);
        CreateDir(pDynamic + ExerciseAreaForm.edtName.Text);
  end;
  CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\');
  CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\');

  //create sub folder at \T3.bin\game_area\name_game_area\cells\layers_name
  if GeographicalFeatureImportForm.coastl = true then
  begin
        CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\coastl');
        CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\coastl');
  end;
  if GeographicalFeatureImportForm.depthl = true then
  begin
        CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\depthl');
        CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\depthl');
  end;
  if GeographicalFeatureImportForm.contourl = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\contourl');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\contourl');
  end;
  if GeographicalFeatureImportForm.mispopp = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\mispopp');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\mispopp');
  end;
  if GeographicalFeatureImportForm.builtupa = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\builtupa');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\builtupa');
  end;
  if GeographicalFeatureImportForm.aerofacpmil = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\aerofacpmil');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\aerofacpmil');
  end;
  if GeographicalFeatureImportForm.aerofacpciv = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\aerofacpciv');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\aerofacpciv');
  end;
  if GeographicalFeatureImportForm.aerofacpot = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\aerofacpot');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\aerofacpot');
  end;
  if GeographicalFeatureImportForm.railrdlprim = true then
  begin
     CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\railrdlprim');
     CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\railrdlprim');
  end;
  if GeographicalFeatureImportForm.railrdlsec = true then
  begin
     CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\railrdlsec');
     CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\railrdlsec');
  end;
  if GeographicalFeatureImportForm.roadlprim = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\roadlprim');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\roadlprim');
  end;
  if GeographicalFeatureImportForm.roadlsec = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\roadlsec');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\roadlsec');
  end;
  if GeographicalFeatureImportForm.pipel = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\pipel');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\pipel');
  end;
  if GeographicalFeatureImportForm.polbnda = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\polbnda');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\polbnda');
  end;
  if GeographicalFeatureImportForm.oceansea = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\oceansea');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\oceansea');
  end;
  if GeographicalFeatureImportForm.wreck = true then
  begin
       CreateDir(p + ExerciseAreaForm.edtName.Text + '\cells\wreck');
       CreateDir(pDynamic + ExerciseAreaForm.edtName.Text + '\cells\wreck');
  end;
  fLandmassEditor.load();


  Self.Close;
end;

procedure TGeographicalFeatureImportForm.btnOKClick(Sender: TObject);
var
    myFile : TextFile;
    flag, param, i, j, assign : integer;
    tempFlag : Array [1..30] of integer;
    tempString : Array [1..30] of string;
    resultString : Array [1..30] of string;
begin
    { flag = 1  ===> symbol
      flag = 2  ===> line
      flag = 3  ===> region
    }

    AssignFile(myFile, 'ConfigureLayer.txt');
    ReWrite(myFile);

    i := 1;

    if cbCoastline.Checked = true then
    begin
          flag := 2;
          tempFlag[i] := flag;
          tempString[i] := 'coastl\coastl';
          coastl := true;
          i := i+1;
    end;

    if cbDepthContours.Checked = true then
    begin
          flag := 2;
          tempFlag[i] := flag;
          tempString[i] := 'depthl\depthl';
          depthl := true;
          i := i+1;
    end;

    if cbElevationContours.Checked = true then
    begin
          flag := 2;
          tempFlag[i] := flag;
          tempString[i] := 'contourl\contourl';
          contourl := true;
          i := i+1;
    end;

    if cbPopulatedPlaces.Checked = true then
    begin
        if cbPointsPopulatedPlaces.Checked = true then
        begin
              flag := 1;
              tempFlag[i] := flag;
              tempString[i] := 'mispopp\mispopp';
              mispopp := true;
              i := i+1;
        end;
        if cbAreasPopulatedPlaces.Checked = true then
        begin
              flag := 3;
              tempFlag[i] := flag;
              tempString[i] := 'builtupa\builtupa';
              builtupa := true;
              i := i+1;
        end;
    end;

    if cbAirports.Checked = true then
    begin
              if cbMilitaryAirports.Checked = true then
              begin
                  flag := 1;
                  tempFlag[i] := flag;
                  tempString[i] := 'aerofacpmil\aerofacpmil';
                  aerofacpmil := true;
                  i := i+1;
              end;
              if cbCivilianAirports.Checked = true then
              begin
                  flag := 1;
                  tempFlag[i] := flag;
                  tempString[i] := 'aerofacpciv\aerofacpciv';
                  aerofacpciv := true;
                  i := i+1;
              end;
              if cbOtherAirports.Checked = true then
              begin
                  flag := 1;
                  tempFlag[i] := flag;
                  tempString[i] := 'aerofacpot\aerofacpot';
                  aerofacpot := true;
                  i := i+1;
              end;
    end;
    if cbrRilRoads.Checked = true then
    begin
              if cbPrimaryRailroads.Checked = true then
              begin
                  flag := 2;
                  tempFlag[i] := flag;
                  tempString[i] := 'railrdlprim\railrdlprim';
                  railrdlprim := true;
                  i := i+1;
              end;
              if cbSecondaryRailroads.Checked = true then
              begin
                  flag := 2;
                  tempFlag[i] := flag;
                  tempString[i] := 'railrdlsec\railrdlsec';
                  railrdlsec := true;
                  i := i+1;
              end;
    end;
    if cbRoads.Checked = true then
    begin
              if cbPrimaryRoads.Checked = true then
              begin
                  flag := 2;
                  tempFlag[i] := flag;
                  tempString[i] := 'roadlprim\roadlprim';
                  roadlprim := true;
                  i := i+1;
              end;
              if cbSecondaryRoads.Checked = true then
              begin
                  flag := 2;
                  tempFlag[i] := flag;
                  tempString[i] := 'roadlsec\roadlsec';
                  roadlsec := true;
                  i := i+1;
              end;
    end;

    if cbPoliticalBoundaries.Checked = true then
    begin
              flag := 3;
              tempFlag[i] := flag;
              tempString[i] := 'polbnda\polbnda';
              polbnda := polbnda;
              i := i+1;
    end;

    if cbPipelines.Checked = true then
    begin
              flag := 2;
              tempFlag[i] := flag;
              tempString[i] := 'pipel\pipel';
              pipel := true;
              i := i+1;
    end;

    if cbWrecks.Checked = true then
    begin
              flag := 1;
              tempFlag[i] := flag;
              tempString[i] := 'wreck\wreck';
              wreck := true;
              i := i+1;
    end;

    assign := i;

    param := 1;
    flag := 1;

    for i := 1 to 3 do
    begin
        for j := 1 to assign-1 do
        begin
          if tempFlag[j] = flag then
          begin
             resultString[param] := tempString[j];
             param := param + 1;
          end;
        end;
        flag := flag + 1;
    end;

    for j := 1 to assign-1 do
    begin
      Writeln(myFile, resultString[j]);
    end;

    WriteLn(myFile, 'polbnda\polbnda');
    WriteLn(myFile, 'oceansea\oceansea');

    polbnda := true;
    oceansea := true;

    CloseFile(myFile);


    if assign > 1 then
        Showmessage('Features Has Imported')
    else
    begin
        if ENC = true then Showmessage('ENC Has Imported')
        else
           Showmessage('No Features Imported');
    end;
    getBrowsePath := edtLibrary.Text;
end;


procedure TGeographicalFeatureImportForm.Button1Click(Sender: TObject);
var
      iFlag : integer;
begin
      iFlag :=  BIF_BROWSEINCLUDEFILES;
      sFolder := BrowseDialog(iFlag);
      {if ENC = true then
      begin
            if sFolder <> '' then
              edtLibrary.text := sFolder
            else
              edtLibrary.text := 'M:\mapsea';
      end
      else
      begin
            if sFolder <> '' then
              edtLibrary.text := sFolder
            else
              edtLibrary.text := 'M:\game_area';
      end;  }
      if sFolder <> '' then
            edtLibrary.text := sFolder
      else
      begin
        if ENC = true then
            edtLibrary.Text := 'M:\mapsea'
        else
            edtLibrary.text := 'M:\game_area';
      end;
end;

function TGeographicalFeatureImportForm.BrowseDialog(const Flag: integer): string;
var
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath : array[0..MAX_PATH] of char;
begin
  Result:='';
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  with BrowseInfo do begin
    hwndOwner := Application.Handle;
    pszDisplayName := @DisplayName;
    //lpszTitle := PChar(Title);
    ulFlags := Flag;
  end;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  if lpItemId <> nil then begin
    SHGetPathFromIDList(lpItemID, TempPath);
    Result := TempPath;
    GlobalFreePtr(lpItemID);
  end;
end;

procedure TGeographicalFeatureImportForm.cbAirportsClick(Sender: TObject);
begin
    if cbAirports.Checked = true then
    begin
        cbMilitaryAirports.Enabled := true;
        cbCivilianAirports.Enabled := true;
        cbOtherAirports.Enabled := true;
    end;
    if cbAirports.Checked = false then
    begin
        cbMilitaryAirports.Enabled := false;
        cbCivilianAirports.Enabled := false;
        cbOtherAirports.Enabled := false;
    end;

end;

procedure TGeographicalFeatureImportForm.cbDepthContoursClick(Sender: TObject);
begin
    if cbDepthContours.Checked = true then
    begin
        cb10mDepthCountours.Enabled := true;
        cb20mDepthCountours.Enabled := true;
        cb40mDepthCountours.Enabled := true;
        cb60mDepthCountours.Enabled := true;
        cb80mDepthCountours.Enabled := true;
        cb100mDepthCountours.Enabled := true;
        cb120mDepthCountours.Enabled := true;
        cb140mDepthCountours.Enabled := true;
        cb160mDepthCountours.Enabled := true;
        cb180mDepthCountours.Enabled := true;
        cb200mDepthCountours.Enabled := true;
        cb300mDepthCountours.Enabled := true;
        cb400mDepthCountours.Enabled := true;
        cb500mDepthCountours.Enabled := true;
        cb700mDepthCountours.Enabled := true;
        cb1000mDepthCountours.Enabled := true;
        cbBelow1000mDepthCountours.Enabled := true;
    end;
    if cbDepthContours.Checked = false then
    begin
        cb10mDepthCountours.Enabled := false;
        cb20mDepthCountours.Enabled := false;
        cb40mDepthCountours.Enabled := false;
        cb60mDepthCountours.Enabled := false;
        cb80mDepthCountours.Enabled := false;
        cb100mDepthCountours.Enabled := false;
        cb120mDepthCountours.Enabled := false;
        cb140mDepthCountours.Enabled := false;
        cb160mDepthCountours.Enabled := false;
        cb180mDepthCountours.Enabled := false;
        cb200mDepthCountours.Enabled := false;
        cb300mDepthCountours.Enabled := false;
        cb400mDepthCountours.Enabled := false;
        cb500mDepthCountours.Enabled := false;
        cb700mDepthCountours.Enabled := false;
        cb1000mDepthCountours.Enabled := false;
        cbBelow1000mDepthCountours.Enabled := false;
    end;

end;

procedure TGeographicalFeatureImportForm.cbElevationContoursClick(
  Sender: TObject);
begin
     if cbElevationContours.Checked = true then
     begin
        cb100ftElevationContours.Enabled := true;
        cb200ftElevationContours.Enabled := true;
        cb500ftElevationContours.Enabled := true;
        cb1000ftElevationContours.Enabled := true;
        cb1500ftElevationContours.Enabled := true;
        cb2000ftElevationContours.Enabled := true;
        cb3000ftElevationContours.Enabled := true;
        cb5000ftElevationContours.Enabled := true;
        cb7000ftElevationContours.Enabled := true;
        cb10000ftElevationContours.Enabled := true;
        cbAbove10000ftElevationContours.Enabled := true;
     end;
     if cbElevationContours.Checked = false then
     begin
        cb100ftElevationContours.Enabled := false;
        cb200ftElevationContours.Enabled := false;
        cb500ftElevationContours.Enabled := false;
        cb1000ftElevationContours.Enabled := false;
        cb1500ftElevationContours.Enabled := false;
        cb2000ftElevationContours.Enabled := false;
        cb3000ftElevationContours.Enabled := false;
        cb5000ftElevationContours.Enabled := false;
        cb7000ftElevationContours.Enabled := false;
        cb10000ftElevationContours.Enabled := false;
        cbAbove10000ftElevationContours.Enabled := false;
     end;
end;

procedure TGeographicalFeatureImportForm.cbImportSourceChange(Sender: TObject);
var
       s : string;
begin
       s := cbImportSource.Items.Strings[cbImportSource.ItemIndex];
       if s = 'Electronic Nautical Chart' then
         begin
                  ENC := true;
                  edtLibrary.Text := 'M:\mapsea';
                  cbCoastline.Enabled := false;
                  cbDepthContours.Enabled := false;
                  cbElevationContours.Enabled := false;
                  cbPopulatedPlaces.Enabled := false;
                  cbAirports.Enabled := false;
                  cbrRilroads.Enabled := false;
                  cbRoads.Enabled := false;
                  cbPoliticalBoundaries.Enabled := false;
                  cbPipelines.Enabled := false;
                  cbWrecks.Enabled := false;
                  cbPlatforms.Enabled := false;

                  cb10mDepthCountours.Enabled := false;
                  cb20mDepthCountours.Enabled := false;
                  cb40mDepthCountours.Enabled := false;
                  cb60mDepthCountours.Enabled := false;
                  cb80mDepthCountours.Enabled := false;
                  cb100mDepthCountours.Enabled := false;
                  cb120mDepthCountours.Enabled := false;
                  cb140mDepthCountours.Enabled := false;
                  cb160mDepthCountours.Enabled := false;
                  cb180mDepthCountours.Enabled := false;
                  cb200mDepthCountours.Enabled := false;
                  cb300mDepthCountours.Enabled := false;
                  cb400mDepthCountours.Enabled := false;
                  cb500mDepthCountours.Enabled := false;
                  cb700mDepthCountours.Enabled := false;
                  cb1000mDepthCountours.Enabled := false;
                  cbBelow1000mDepthCountours.Enabled := false;
                  cb100ftElevationContours.Enabled := false;
                  cb200ftElevationContours.Enabled := false;
                  cb500ftElevationContours.Enabled := false;
                  cb1000ftElevationContours.Enabled := false;
                  cb1500ftElevationContours.Enabled := false;
                  cb2000ftElevationContours.Enabled := false;
                  cb3000ftElevationContours.Enabled := false;
                  cb5000ftElevationContours.Enabled := false;
                  cb7000ftElevationContours.Enabled := false;
                  cb10000ftElevationContours.Enabled := false;
                  cbAbove10000ftElevationContours.Enabled := false;
                  cbMilitaryAirports.Enabled := false;
                  cbCivilianAirports.Enabled := false;
                  cbOtherAirports.Enabled := false;

                  cbPointsPopulatedPlaces.Enabled := false;
                  cbAreasPopulatedPlaces.Enabled := false;
                  cbPrimaryRailroads.Enabled := false;
                  cbSecondaryRailroads.Enabled := false;
                  cbPrimaryRoads.Enabled := false;
                  cbSecondaryRoads.Enabled := false;

                  cbCoastline.Checked := false;
                  cbDepthContours.Checked := false;
                  cbElevationContours.Checked := false;
                  cbPopulatedPlaces.Checked := false;
                  cbAirports.Checked := false;
                  cbrRilroads.Checked := false;
                  cbRoads.Checked := false;
                  cbPoliticalBoundaries.Checked := false;
                  cbPipelines.Checked := false;
                  cbWrecks.Checked := false;
                  cbPlatforms.Checked := false;

                  cb10mDepthCountours.Checked := false;
                  cb20mDepthCountours.Checked := false;
                  cb40mDepthCountours.Checked := false;
                  cb60mDepthCountours.Checked := false;
                  cb80mDepthCountours.Checked := false;
                  cb100mDepthCountours.Checked := false;
                  cb120mDepthCountours.Checked := false;
                  cb140mDepthCountours.Checked := false;
                  cb160mDepthCountours.Checked := false;
                  cb180mDepthCountours.Checked := false;
                  cb200mDepthCountours.Checked := false;
                  cb300mDepthCountours.Checked := false;
                  cb400mDepthCountours.Checked := false;
                  cb500mDepthCountours.Checked := false;
                  cb700mDepthCountours.Checked := false;
                  cb1000mDepthCountours.Checked := false;
                  cbBelow1000mDepthCountours.Checked := false;
                  cb100ftElevationContours.Checked := false;
                  cb200ftElevationContours.Checked := false;
                  cb500ftElevationContours.Checked := false;
                  cb1000ftElevationContours.Checked := false;
                  cb1500ftElevationContours.Checked := false;
                  cb2000ftElevationContours.Checked := false;
                  cb3000ftElevationContours.Checked := false;
                  cb5000ftElevationContours.Checked := false;
                  cb7000ftElevationContours.Checked := false;
                  cb10000ftElevationContours.Checked := false;
                  cbAbove10000ftElevationContours.Checked := false;
                  cbMilitaryAirports.Checked := false;
                  cbCivilianAirports.Checked := false;
                  cbOtherAirports.Checked := false;

                  cbPointsPopulatedPlaces.Checked := false;
                  cbAreasPopulatedPlaces.Checked := false;
                  cbPrimaryRailroads.Checked := false;
                  cbSecondaryRailroads.Checked := false;
                  cbPrimaryRoads.Checked := false;
                  cbSecondaryRoads.Checked := false;

                  btnOK.Enabled := true;
         end
       else
       begin
              ENC := false;
              edtLibrary.Text := 'M:\game_area';
              if (cbCoastline.Checked = true) OR (cbDepthContours.Checked) OR
               (cbElevationContours.Checked) OR (cbPopulatedPlaces.Checked) OR
               (cbAirports.Checked) OR (cbrRilroads.Checked) OR (cbRoads.Checked) OR
               (cbPoliticalBoundaries.Checked) OR (cbPipelines.Checked) OR
               (cbWrecks.Checked) OR (cbPlatforms.Checked)
               then
               begin
                  if cbCoastline.Checked = true then cbCoastline.Enabled := true;
                  if cbDepthContours.Checked = true then
                  begin
                    cbDepthContours.Enabled := true;
                    cb10mDepthCountours.Enabled := true;
                    cb20mDepthCountours.Enabled := true;
                    cb40mDepthCountours.Enabled := true;
                    cb60mDepthCountours.Enabled := true;
                    cb80mDepthCountours.Enabled := true;
                    cb100mDepthCountours.Enabled := true;
                    cb120mDepthCountours.Enabled := true;
                    cb140mDepthCountours.Enabled := true;
                    cb160mDepthCountours.Enabled := true;
                    cb180mDepthCountours.Enabled := true;
                    cb200mDepthCountours.Enabled := true;
                    cb300mDepthCountours.Enabled := true;
                    cb400mDepthCountours.Enabled := true;
                    cb500mDepthCountours.Enabled := true;
                    cb700mDepthCountours.Enabled := true;
                    cb1000mDepthCountours.Enabled := true;
                  end;
                  if cbElevationContours.Checked = true then
                  begin
                    cbElevationContours.Enabled := true;
                    cb100ftElevationContours.Enabled := true;
                    cb200ftElevationContours.Enabled := true;
                    cb500ftElevationContours.Enabled := true;
                    cb1000ftElevationContours.Enabled := true;
                    cb1500ftElevationContours.Enabled := true;
                    cb2000ftElevationContours.Enabled := true;
                    cb3000ftElevationContours.Enabled := true;
                    cb5000ftElevationContours.Enabled := true;
                    cb7000ftElevationContours.Enabled := true;
                    cb10000ftElevationContours.Enabled := true;
                    cbAbove10000ftElevationContours.Enabled := true;
                  end;
                  if cbPopulatedPlaces.Checked = true then
                  begin
                     cbPopulatedPlaces.Enabled := true;
                     cbPointsPopulatedPlaces.Enabled := true;
                     cbAreasPopulatedPlaces.Enabled := true;
                  end;
                  if cbAirports.Checked = true then
                  begin
                    cbAirports.Enabled := true;
                    cbMilitaryAirports.Enabled := true;
                    cbCivilianAirports.Enabled := true;
                    cbOtherAirports.Enabled := true;
                  end;
                  if cbrRilroads.Checked = true then
                  begin
                    cbrRilroads.Enabled := true;
                    cbPrimaryRailroads.Enabled := true;
                    cbSecondaryRailroads.Enabled := true;
                  end;
                  if cbRoads.Checked = true then
                  begin
                    cbRoads.Enabled := true;
                    cbPrimaryRoads.Enabled := true;
                    cbSecondaryRoads.Enabled := true;
                  end;
                  if cbPoliticalBoundaries.Checked = true then
                  begin
                    cbPoliticalBoundaries.Enabled := true;
                  end;
                  if cbWrecks.Checked = true then
                  begin
                    cbWrecks.Enabled := true;
                  end;
                  if cbPipelines.Checked = true then
                  begin
                    cbPipelines.Enabled := true;
                  end;
                  if cbPlatforms.Checked = true then
                  begin
                    cbPlatforms.Enabled := true;
                  end;





               end
               else
               begin
                  cbCoastline.Enabled := true;
                  cbDepthContours.Enabled := true;
                  cbElevationContours.Enabled := true;
                  cbPopulatedPlaces.Enabled := true;
                  cbAirports.Enabled := true;
                  cbrRilroads.Enabled := true;
                  cbRoads.Enabled := true;
                  cbPoliticalBoundaries.Enabled := true;
                  cbPipelines.Enabled := true;
                  cbWrecks.Enabled := true;
                  cbPlatforms.Enabled := true;
                  btnOK.Enabled := true;
               end;



       end;
end;

procedure TGeographicalFeatureImportForm.cbPopulatedPlacesClick(
  Sender: TObject);
begin
     if cbPopulatedPlaces.Checked = true then
     begin
        cbPointsPopulatedPlaces.Enabled := true;
        cbAreasPopulatedPlaces.Enabled := true;
     end;
     if cbPopulatedPlaces.Checked = false then
     begin
        cbPointsPopulatedPlaces.Enabled := false;
        cbAreasPopulatedPlaces.Enabled := false;
     end;
end;

procedure TGeographicalFeatureImportForm.cbRoadsClick(Sender: TObject);
begin
    if cbRoads.Checked = true then
    begin
       cbPrimaryRoads.Enabled := true;
       cbSecondaryRoads.Enabled := true;
    end;
    if cbRoads.Checked = false then
    begin
       cbPrimaryRoads.Enabled := false;
       cbSecondaryRoads.Enabled := false;
    end;
end;

procedure TGeographicalFeatureImportForm.cbrRilroadsClick(Sender: TObject);
begin
    if cbrRilroads.Checked = true then
    begin
       cbPrimaryRailroads.Enabled := true;
       cbSecondaryRailroads.Enabled := true;
    end;
    if cbrRilroads.Checked = false then
    begin
       cbPrimaryRailroads.Enabled := false;
       cbSecondaryRailroads.Enabled := false;
    end;
end;

procedure TGeographicalFeatureImportForm.FormCreate(Sender: TObject);
begin
    cbImportSource.Items.Add('Electronic Nautical Chart');
    cbImportSource.Items.Add('Vector Smart Level 0');
end;

procedure TGeographicalFeatureImportForm.FormShow(Sender: TObject);
begin
{    cbCoastline.Enabled := true;
    cbCoastline.Checked := false;

    cbDepthContours.Enabled := true;
    cbDepthContours.Checked := false;

    cbElevationContours.Enabled := true;
    cbElevationContours.Checked := false;

    cbPopulatedPlaces.Enabled := true;
    cbPopulatedPlaces.Checked := false;

    cbAirports.Enabled := true;
    cbAirports.Checked := false;

    cbrRilroads.Enabled := true;
    cbrRilroads.Checked := false;

    cbRoads.Enabled := true;
    cbRoads.Checked := false;

    cbPoliticalBoundaries.Enabled := true;
    cbPoliticalBoundaries.Checked := false;

    cbPipelines.Enabled := true;
    cbPipelines.Checked := false;

    cbWrecks.Enabled := true;
    cbWrecks.Checked := false;

    cbPlatforms.Enabled := true;
    cbPlatforms.Checked := false;  }

    if fGameAreaList.flagIsNew then
    begin
          if (cbCoastline.Checked = true) OR (cbDepthContours.Checked) OR
           (cbElevationContours.Checked) OR (cbPopulatedPlaces.Checked) OR
           (cbAirports.Checked) OR (cbrRilroads.Checked) OR (cbRoads.Checked) OR
           (cbPoliticalBoundaries.Checked) OR (cbPipelines.Checked) OR
           (cbWrecks.Checked) OR (cbPlatforms.Checked)
           then
           begin
              if cbCoastline.Checked = true then
              begin
                  cbCoastline.Checked := false;
                  cbCoastline.Enabled := true;
              end;
              if cbDepthContours.Checked = true then
              begin
                cbDepthContours.Checked := false;
                cbDepthContours.Enabled := true;
                cb10mDepthCountours.Enabled := true;
                cb20mDepthCountours.Enabled := true;
                cb40mDepthCountours.Enabled := true;
                cb60mDepthCountours.Enabled := true;
                cb80mDepthCountours.Enabled := true;
                cb100mDepthCountours.Enabled := true;
                cb120mDepthCountours.Enabled := true;
                cb140mDepthCountours.Enabled := true;
                cb160mDepthCountours.Enabled := true;
                cb180mDepthCountours.Enabled := true;
                cb200mDepthCountours.Enabled := true;
                cb300mDepthCountours.Enabled := true;
                cb400mDepthCountours.Enabled := true;
                cb500mDepthCountours.Enabled := true;
                cb700mDepthCountours.Enabled := true;
                cb1000mDepthCountours.Enabled := true;
              end;
              if cbElevationContours.Checked = true then
              begin
                cbElevationContours.Checked := false;
                cbElevationContours.Enabled := true;
                cb100ftElevationContours.Enabled := true;
                cb200ftElevationContours.Enabled := true;
                cb500ftElevationContours.Enabled := true;
                cb1000ftElevationContours.Enabled := true;
                cb1500ftElevationContours.Enabled := true;
                cb2000ftElevationContours.Enabled := true;
                cb3000ftElevationContours.Enabled := true;
                cb5000ftElevationContours.Enabled := true;
                cb7000ftElevationContours.Enabled := true;
                cb10000ftElevationContours.Enabled := true;
                cbAbove10000ftElevationContours.Enabled := true;
              end;
              if cbPopulatedPlaces.Checked = true then
              begin
                 cbPointsPopulatedPlaces.Checked := false;
                 cbPopulatedPlaces.Enabled := true;
                 cbPointsPopulatedPlaces.Enabled := true;
                 cbAreasPopulatedPlaces.Enabled := true;
              end;
              if cbAirports.Checked = true then
              begin
                cbAirports.Checked := false;
                cbAirports.Enabled := true;
                cbMilitaryAirports.Enabled := true;
                cbCivilianAirports.Enabled := true;
                cbOtherAirports.Enabled := true;
              end;
              if cbrRilroads.Checked = true then
              begin
                cbrRilroads.Checked := false;
                cbrRilroads.Enabled := true;
                cbPrimaryRailroads.Enabled := true;
                cbSecondaryRailroads.Enabled := true;
              end;
              if cbRoads.Checked = true then
              begin
                cbRoads.Checked := false;
                cbRoads.Enabled := true;
                cbPrimaryRoads.Enabled := true;
                cbSecondaryRoads.Enabled := true;
              end;
              if cbPoliticalBoundaries.Checked = true then
              begin
                cbPoliticalBoundaries.Checked := false;
                cbPoliticalBoundaries.Enabled := true;
              end;
              if cbWrecks.Checked = true then
              begin
                cbWrecks.Checked := false;
                cbWrecks.Enabled := true;
              end;
              if cbPipelines.Checked = true then
              begin
                cbPipelines.Checked := false;
                cbPipelines.Enabled := true;
              end;
              if cbPlatforms.Checked = true then
              begin
                cbPlatforms.Checked := false;
                cbPlatforms.Enabled := true;
              end;
           end
           else
           begin
              cbCoastline.Checked := false;
              cbCoastline.Enabled := true;
              cbDepthContours.Enabled := true;
              cbElevationContours.Enabled := true;
              cbPopulatedPlaces.Enabled := true;
              cbAirports.Enabled := true;
              cbrRilroads.Enabled := true;
              cbRoads.Enabled := true;
              cbPoliticalBoundaries.Enabled := true;
              cbPipelines.Enabled := true;
              cbWrecks.Enabled := true;
              cbPlatforms.Enabled := true;
              btnOK.Enabled := true;
           end;
    end;
end;



procedure TGeographicalFeatureImportForm.trackScaleFactorChange(
  Sender: TObject);
begin
    edtScaleFactor.Text := '1 : '+(inttostr(trackScaleFactor.Position));
end;

end.
