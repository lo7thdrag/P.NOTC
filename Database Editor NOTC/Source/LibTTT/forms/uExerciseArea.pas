unit uExerciseArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_GameEnvironment,
  uCoordConvertor, ShellAPI;

type
  TExerciseAreaForm = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    edtName: TEdit;
    PageControl1: TPageControl;
    General: TTabSheet;
    Occulting: TTabSheet;
    grbCentre: TGroupBox;
    edtLatitude: TEdit;
    edtLongitude: TEdit;
    grbDimensions: TGroupBox;
    edtMaximum: TEdit;
    btnSelectGame: TButton;
    cbUseCoastlines: TCheckBox;
    Panel1: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    btnImportLandmassData: TButton;
    btnEditLandmassData: TButton;
    Memo1: TMemo;
    btnPreprocess: TButton;
    lbl1: TLabel;
    lblLatitude: TLabel;
    lblLongitude: TLabel;
    lblMaximum: TLabel;
    lbl2: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure btnImportLandmassDataClick(Sender: TObject);
    procedure btnEditLandmassDataClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnSelectGameClick(Sender: TObject);
    procedure cbUseCoastlinesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtMaximumKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaximumKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    FCoordPlatformConv : TCoordConverter;
    procedure insert();
    procedure ExerciseAreaupdate();
  public
    isSelectedGameCentre : Boolean;
    lastGameAreaName : string;
//    isCopied : Boolean;

    isNew, isCopy, isEdit : boolean;
    isENC : boolean;
    idGameArea : Integer;
    sizePeta : Integer;
    areaList : Tlist;
    gameEnv: TGame_Environment_Definition;
    inx1, inx2, inx3 : Integer;

    procedure getGameArea;
    procedure setZoomENC();
    procedure SHCopyFile(hWndOwner: HWND; const SourceFile, TargetFile: string);
    function CopyDir(const fromDir, toDir: string): Boolean;
    { Public declarations }
  end;

var
  ExerciseAreaForm: TExerciseAreaForm;

implementation

{$R *.dfm}
uses uDataModuleTTT, ufrmAvailableGameArea,uSimDBEditor, uGeographicalFeatureImport,
  uLandmassEditor,drawrec, ufrmSummaryEnvironment, uBaseCoordSystem, uGameAreaSelection, uDBEditSetting;

procedure TExerciseAreaForm.btnApplyClick(Sender: TObject);
var
  fileSource, fileDest, fileDestDynamic, nameGeoset : string;
begin
try
  {if strtoint(edtMaximum.Text) > 2500 then
  begin
    edtMaximum.Text := '2500';
  end
  else}

  if isNew then
  begin
    insert;
    isNew := false;
  end
  else
  begin
    ExerciseAreaupdate;
  end;

  {btnSelectGame.Enabled   := true;
  cbUseCoastlines.Enabled := true;
  fGameAreaList.refresh;

  nameGeoset      := gameEnv.FGameArea.Game_Area_Identifier;
  fileSource      := vAppDBSetting.MapSourcePathVECT + '\result.gst';
  fileDest        := vAppDBSetting.MapDestPathVECT + '\'+nameGeoset+'\'+nameGeoset+'.gst';
  fileDestDynamic := GeographicalFeatureImportForm.getBrowsePath + '\' + nameGeoset + '\' + nameGeoset +'.gst';
  CopyFile(PChar(fileSource), PChar(fileDest), False);
  CopyFile(PChar(fileSource), PChar(fileDestDynamic), False);

  if isSelectedGameCentre then
   if GeographicalFeatureImportForm.marker = False then
      ShowMessage('Choose Import Landmass Data First');  }
except
  MessageDlg('The name of Game Area is already exits, Please choose another name...',mtWarning,mbOKCancel,0);
end;
end;

procedure TExerciseAreaForm.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TExerciseAreaForm.setZoomENC();
var
   limitWidth      : Array[0..15] of double;
   arrayTemp       : Array[0..30] of double;
   arrayStringTemp : Array[0..30] of String;
   resultTemp      : Array[0..30] of String;
   a, b            : integer;
   widthNM         : integer;
begin
    uLandmassEditor.fLandmassEditor.cbSetScale.Clear;
    widthNM := strtoint(ExerciseAreaForm.edtMaximum.Text);

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
  nameOfMap : string;
   tempString : string;
begin
   with fLandmassEditor do
   begin
     btnEditCharacteristic.Visible := false;

//     if ufrmAvailableGameArea.frmAvailableGameArea.flagIsNew = true then
//     begin
//       tempString := vAppDBSetting.MapDestPathVECT + '\' + ExerciseAreaForm.edtName.Text + '\' + ExerciseAreaForm.edtName.Text + '.gst';
//       if FileExists(tempString) then
//       begin
//         createGeoset(ExerciseAreaForm.edtName.Text);
//         setZoomENC;
//         btnCheckInternalIntersections.Enabled         := true;
//         btnCheckIntersectionWithOtherContours.Enabled := true;
//         btnClearErrorIndications.Enabled              := true;
//         btnDeleteAll.Enabled                          := true;
//         ToolButton2.Enabled                           := true;
//       end
//       else
//       begin
//         ShowMessage('Please Apply Before Edit Landmass Data');
//         Exit;
//       end;
//     end
//     else
//     begin
//       dmTTT.GetGame_Area_DefByID(GameEnv.FData.Game_Area_Index, GameEnv);
//       nameOfMap := GameEnv.FGameArea.Game_Area_Identifier;
//
//       createGeoset(nameOfMap);
//       setZoomENC;
//       btnCheckInternalIntersections.Enabled         := true;
//       btnCheckIntersectionWithOtherContours.Enabled := true;
//       btnClearErrorIndications.Enabled              := true;
//       btnDeleteAll.Enabled                          := true;
//       ToolButton2.Enabled                           := true;
//     end;
     cbSetScale.ItemIndex := fLandmassEditor.cbSetScale.Items.Count-1;
     cbSetScaleChange(Sender);
     ShowModal;
   end;
end;

procedure TExerciseAreaForm.btnImportLandmassDataClick(Sender: TObject);
begin
//  if frmAvailableGameArea.flagIsCopy then
//  begin
//    GeographicalFeatureImportForm.GetDataFlag;
//  end
//  else
//  with GeographicalFeatureImportForm do
//  begin
//    coastl       := false;
//    depthl       := false;
//    contourl     := false;
//    mispopp      := false;
//    builtupa     := false;
//    aerofacpmil  := false;
//    aerofacpciv  := false;
//    aerofacpot   := false;
//    railrdlprim  := false;
//    railrdlsec   := false;
//    roadlprim    := false;
//    roadlsec     := false;
//    polbnda      := false;
//    pipel        := false;
//    oceansea     := false;
//    wreck        := false;
//    ShowModal;
//  end;
end;

procedure TExerciseAreaForm.btnOKClick(Sender: TObject);
var
  fileSource, fileDest, fileDestDynamic, nameGeoset : string;

  Long, Lati : Double;
  destFolder, sourceCopied, destCopied : string;
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
  frmAvailableGameArea.refresh;

  nameGeoset      := gameEnv.FGameArea.Game_Area_Identifier;
  fileSource      := vAppDBSetting.MapSourcePathVECT + '\result.gst';
  fileDest        := vAppDBSetting.MapDestPathVECT + '\'+nameGeoset+'\'+nameGeoset+'.gst';
  fileDestDynamic := GeographicalFeatureImportForm.getBrowsePath + '\' + nameGeoset+'\'+nameGeoset+'.gst';
  CopyFile(PChar(fileSource), PChar(fileDest), False);
  CopyFile(PChar(fileSource), PChar(fileDestDynamic), False);

  ufrmSummaryEnvironment.frmSummaryEnvironment.isENCmap := isENC;

  if isCopy then
  begin
  //     SHCopyFile(Handle, 'D:\Temp\Test\*.*', 'D:\Temp\Test2\');

      destFolder := vAppDBSetting.MapDestPathVECT + '\' + edtName.Text;
      if DirectoryExists(destFolder) then
         Exit
      else
         CreateDir(destFolder);

      CopyDir(vAppDBSetting.MapDestPathVECT+'\'+lastGameAreaName+'\cells', destFolder);

      sourceCopied := vAppDBSetting.MapDestPathVECT+'\'+lastGameAreaName+'\'+lastGameAreaName+'.gst';
      destCopied   := destFolder+'\'+edtName.Text+'.gst';
      CopyFile(PChar(sourceCopied), PChar(destCopied), False);
  end;

  Long := dmToLongitude(edtLongitude.Text);
  Lati := dmToLatitude(edtLatitude.Text);
  if (Long = 0) AND (Lati = 0) {isSelectedGameCentre} then begin
   if GeographicalFeatureImportForm.marker = False then
      ShowMessage('Choose Import Landmass Data First');
  end
  else
      Self.Close;
end;

function TExerciseAreaForm.CopyDir(const fromDir, toDir: string): Boolean;
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

procedure TExerciseAreaForm.edtMaximumKeyPress(Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtMaximum.Text := FormatFloat('0.00', StrToFloat(edtMaximum.Text));
end;

procedure TExerciseAreaForm.edtMaximumKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edtMaximum.Text = '' then
    Exit;

   if (StrToFloat(edtMaximum.Text) > 999500)  then
    begin
      ShowMessage('Incorrect value');
      edtMaximum.Text := '999500';
    //  edtBaselineDetectionGeneral.Text := FormatFloat('0.00', StrToFloat(edtBaselineDetectionGeneral.Text));
    end;
end;

procedure TExerciseAreaForm.SHCopyFile(hWndOwner: HWND; const SourceFile, TargetFile: string);
var
Info: TSHFileOpStruct;
Aborted: Bool;
begin
  Aborted := False;
  with Info do begin
    Wnd := hWndOwner;
    wFunc := FO_COPY;
    pFrom := pChar(SourceFile);
    pTo := pChar(TargetFile);
    fFlags := 0;
    fAnyOperationsAborted := Aborted;
  end;
  try
    SHFileOperation(Info);
  finally
  if Aborted then
  ; { act upon any user cancellations }
  end;
end;

procedure TExerciseAreaForm.btnSelectGameClick(Sender: TObject);
begin
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

    fEditGameCenter.ApplyClick(fEditGameCenter.apply);
    fEditGameCenter.ShowModal;

  end;
//    isSelectedGameCentre := True;
//    GeographicalFeatureImportForm.marker := False;
end;

procedure TExerciseAreaForm.cbUseCoastlinesClick(Sender: TObject);
begin
  if cbUseCoastlines.Checked then
  begin
    btnEditLandmassData.Enabled   := true;
    btnImportLandmassData.Enabled := true;
  end
  else
  begin
    btnEditLandmassData.Enabled   := false;
    btnImportLandmassData.Enabled := false;
  end;
end;

procedure TExerciseAreaForm.FormCreate(Sender: TObject);
begin
  FCoordPlatformConv := TCoordConverter.Create;
  Self.gameEnv       := TGame_Environment_Definition.Create;
end;

procedure TExerciseAreaForm.FormShow(Sender: TObject);
begin
  if isNew then
  begin
    btnApply.Enabled      := true;
    btnSelectGame.Enabled := true;
    idGameArea            := 0;
  end
  else
  begin
    btnSelectGame.Enabled         := true;
    cbUseCoastlines.Checked       := true;
    btnImportLandmassData.Enabled := true;
    btnEditLandmassData.Enabled   := true;
  end;

  if cbUseCoastlines.Checked then
  begin
    btnEditLandmassData.Enabled   := true;
    btnImportLandmassData.Enabled := true;
  end
  else
  begin
    btnEditLandmassData.Enabled   := false;
    btnImportLandmassData.Enabled := false;
  end;

  if isCopy and isEdit then begin
    cbUseCoastlines.Checked := True;
    btnEditLandmassData.Enabled   := true;
    btnImportLandmassData.Enabled := true;
  end
  else begin
    btnEditLandmassData.Enabled   := false;
    btnImportLandmassData.Enabled := false;
  end;

  PageControl1.Pages[0].Show;
end;

procedure TExerciseAreaForm.insert();
begin
  with gameEnv.FGameArea do
  begin
    Game_Area_Identifier := edtName.Text;
    Game_Centre_Lat      := dmToLatitude(edtLatitude.Text);
    Game_Centre_Long     := dmToLongitude(edtLongitude.Text);
    Game_X_Dimension     := StrToInt(edtMaximum.Text);
    Game_Y_Dimension     := StrToInt(edtMaximum.Text);
    Use_Real_World       := 0;

    if cbUseCoastlines.Checked then
      Use_Artificial_Landmass := 1
    else
      Use_Artificial_Landmass := 0;

    if isENC then
       Detail_Map := 'ENC'
    else
       Detail_Map := 'VektorMap';

    with SIMMgr do
    begin
      idGameArea := insertGameAreaDef(gameEnv);
      gameEnv.FGameArea.Game_Area_Index := idGameArea;
    end;
  end;
end;


procedure TExerciseAreaForm.ExerciseAreaupdate;
begin
  with gameEnv.FGameArea do
  begin
    if idGameArea <> 0 then
       gameEnv.FGameArea.Game_Area_Index := idGameArea;

    Game_Area_Identifier := edtName.Text;
    Game_Centre_Lat      := dmToLatitude(edtLatitude.Text);
    Game_Centre_Long     := dmToLongitude(edtLongitude.Text);
    Game_X_Dimension     := StrToInt(edtMaximum.Text);
    Game_Y_Dimension     := StrToInt(edtMaximum.Text);
    Use_Real_World       := 0;
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
//  dmTTT.getAllScenario_Definition(areaList);  ==== (wahyu)
  with gameEnv do
  begin
    if frmAvailableGameArea.lstGameArea.ItemIndex > -1 then
    begin
//      idGameArea  := StrToInt(frmAvailableGameArea.lbGameId.Items.Strings[frmAvailableGameArea.lbScenarioList.ItemIndex]);
      if isCopy then begin
        edtName.Text := 'Copy of ' + frmAvailableGameArea.lstGameArea.Items.Strings[frmAvailableGameArea.lstGameArea.ItemIndex];
        lastGameAreaName := frmAvailableGameArea.lstGameArea.Items.Strings[frmAvailableGameArea.lstGameArea.ItemIndex];
      end
      else
      edtName.Text := frmAvailableGameArea.lstGameArea.Items.Strings[frmAvailableGameArea.lstGameArea.ItemIndex];
    end
    else if fGameAreaSelection.lbAllGame.ItemIndex > -1 then
    begin
      idGameArea  := StrToInt(fGameAreaSelection.lbTempIdAll.Items.Strings[fGameAreaSelection.lbAllGame.ItemIndex]);
      if isCopy then begin
        edtName.Text := 'Copy of ' + fGameAreaSelection.lbAllGame.Items.Strings[fGameAreaSelection.lbAllGame.ItemIndex];
        lastGameAreaName := fGameAreaSelection.lbAllGame.Items.Strings[fGameAreaSelection.lbAllGame.ItemIndex];
      end
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
