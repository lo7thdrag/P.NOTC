unit uGameAreaList;

interface   

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfGameAreaList = class(TForm)
    lbScenarioList: TListBox;
    btNew: TButton;
    btEdit: TButton;
    lbGameId: TListBox;
    btRemove: TButton;
    btCopy: TButton;
    btUsage: TButton;
    btClose: TButton;
    btFilter: TButton;
    procedure FormShow(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure refresh();
    procedure btCloseClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure lbScenarioListClick(Sender: TObject);
    procedure getGame;
  private
    { Private declarations }
  public
    { Public declarations }
    GameArea_Ident : string;
    flagIsNew : boolean;

  end;

var
  fGameAreaList: TfGameAreaList;

implementation

uses usimDBEditor, uDBAsset_GameEnvironment, uExerciseArea, uGameAreaSelection, uBaseCoordSystem;
{$R *.dfm}

procedure TfGameAreaList.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfGameAreaList.btCopyClick(Sender: TObject);
begin
  if lbScenarioList.Selected[lbScenarioList.ItemIndex] then
  begin
     ExerciseAreaForm.isCopy := True;
     getGame;

   {  with SIMMgr do
     begin
       insertGameAreaDef(ExerciseAreaForm.gameEnv);
     end;  }
  end;
  Self.refresh;
end;

procedure TfGameAreaList.btEditClick(Sender: TObject);
begin
   if lbScenarioList.ItemIndex = -1 then
  begin
    ShowMessage('Select Game Area First Please...');
    Exit;
  end;

  ExerciseAreaForm.isCopy := False;
  getGame;

end;

procedure TfGameAreaList.getGame;
begin

  with ExerciseAreaForm do
  begin
    isNew := False;
    btnApply.Enabled := True;
    cbUseCoastlines.Enabled := True;
    btnSelectGame.Enabled := True;
    getGameArea;

   { edtLatitude.Text := formatDM_latitude(gameEnv.FGameArea.Game_Centre_Lat);
    edtLongitude.Text := formatDM_longitude(gameEnv.FGameArea.Game_Centre_Long);
    edtMaximum.Text := FloatToStr(gameEnv.FGameArea.Game_X_Dimension); }
    Show;
  end;
  
end;

procedure TfGameAreaList.btNewClick(Sender: TObject);
begin
  flagIsNew := true;
  with ExerciseAreaForm do
  begin
    edtName.Text := '(Noname)';
    edtLatitude.Text := '00° 00.000'''+' N';
    edtLongitude.Text := '000° 00.000'''+' E';
    edtMaximum.Text := '1000';
  end;
  ExerciseAreaForm.isNew := true;
  ExerciseAreaForm.cbUseCoastlines.Enabled := false;
  ExerciseAreaForm.cbUseCoastlines.Checked := false;
  ExerciseAreaForm.btnSelectGame.Enabled := true;
  ExerciseAreaForm.Show;
end;

procedure TfGameAreaList.btRemoveClick(Sender: TObject);
var
    tempNameGameArea : string;
    tempNameENC, tempNameVector, stringConverter : string;
    p : string;
    myWideCharPtr : PWideChar;
begin
  if lbScenarioList.Selected[lbScenarioList.ItemIndex] then
  begin
    //delete game area
    p := ExtractFilePath(Application.ExeName);
    p := p + 'game_area\';

    tempNameGameArea := lbScenarioList.Items.Strings[lbScenarioList.ItemIndex];
    tempNameENC := ExtractFilePath(Application.ExeName) + 'mapsea\' + tempNameGameArea +'.gst';
    //tempNameVector := ExtractFilePath(Application.ExeName) + 'game_area\' + tempNameGameArea +'.gst';
    if FileExists(tempNameENC) then DeleteFile(tempNameENC);
    //if FileExists(tempNameVector) then DeleteFile(tempNameVector);

    if DirectoryExists(p + tempNameGameArea) then
    begin
          RemoveDir(tempNameGameArea);
    end;

    usimDBEditor.deleteGameArea(StrToInt(lbGameId.Items.Strings[lbScenarioList.ItemIndex]));
  end;

  Self.refresh;
end;


procedure TfGameAreaList.FormShow(Sender: TObject);
begin
  //setting button enable
  btNew.Enabled := true;
  btClose.Enabled := true;
  //setting button disable
  btCopy.Enabled := false;
  btEdit.Enabled := false;
  btRemove.Enabled := false;
  btUsage.Enabled := false;
  btFilter.Enabled := false;

  refresh;
end;

procedure TfGameAreaList.lbScenarioListClick(Sender: TObject);
begin
  btCopy.Enabled := true;
  btEdit.Enabled := true;
  btRemove.Enabled := true;
  btUsage.Enabled := true;
  btFilter.Enabled := false;
  ExerciseAreaForm.idGameArea := StrToInt(lbGameId.Items[(Sender as TListBox).ItemIndex]);
end;

procedure TfGameAreaList.refresh();
var gamearealist:TList;
I: integer;
begin
  gamearealist:= TList.Create;

  uSimDBEditor.getGameAreaList(gamearealist);

  lbScenarioList.Items.Clear;
  lbGameId.Items.Clear;

  for I := 0 to gamearealist.Count - 1 do
  begin
    lbscenariolist.Items.Add(TGame_Environment_Definition(gamearealist[I]).FGameArea.Game_Area_Identifier);
    lbGameId.Items.Add(IntToStr(TGame_Environment_Definition(gamearealist[i]).FGameArea.Game_Area_Index));
  end;

end;

end.
