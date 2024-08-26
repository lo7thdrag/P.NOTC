unit uGameAreaDefinition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBEditSetting;

type
  TDefinitionArea = class(TForm)
    lst_DefinitionArea: TListBox;
    btn_New: TButton;
    btn_Copy: TButton;
    btn_Edit: TButton;
    btn_Remove: TButton;
    btn_Pick: TButton;
    btn_Close: TButton;
    lst_DBIdGameArea: TListBox;
    lst_DBGameAreaIdentifier: TListBox;
    procedure btn_NewClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lst_DefinitionAreaClick(Sender: TObject);
    procedure btn_PickClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_EditClick(Sender: TObject);
    procedure btn_RemoveClick(Sender: TObject);
    procedure btn_CopyClick(Sender: TObject);

  private
    { Private declarations }
    SR : TSearchRec;
    ListFile : TStrings;
    ListDefinition : TList;
    ListDBGameAreaDefinition : TList;
    Path : string;

  public
    { Public declarations }
    FPick : Boolean;
    GameDef1, GameDef2, GameDef3 : Integer;
    GameDefIndex : Integer;
    BtnActive : string;

    procedure RefreshDef;
    function CheckDefName(const DefName : string; var Available : Boolean): Boolean;
    function CheckNumberCopy(const DefName : string; var Number : Integer): Integer;
    function GetValueDef(const Directory : string; var FListFile,
      FListID, FListName : TStringList): string;
  end;

var
  DefinitionArea: TDefinitionArea;

implementation

{$R *.dfm}

uses
  uCreateDefinitionArea, uChooseMap, ufrmAdminMainForm, uSimDBEditor, uDBAsset_GameEnvironment,
  uExerciseArea;

procedure TDefinitionArea.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TDefinitionArea.btn_CopyClick(Sender: TObject);
begin
  CreateDefinitionArea.Action('Copy');
end;

procedure TDefinitionArea.btn_EditClick(Sender: TObject);
begin
  CreateDefinitionArea.Action('Edit');
end;

procedure TDefinitionArea.btn_NewClick(Sender: TObject);
begin
  CreateDefinitionArea.Action('New');
end;

procedure TDefinitionArea.btn_PickClick(Sender: TObject);
var
  I,J : Integer;
  FDefName, text, Area : string;
  MyFile : TextFile;
  Directory : string;
begin
  for I := 0 to lst_DefinitionArea.Count - 1 do
  begin
    if FDefName = '' then
    begin
      if lst_DefinitionArea.Selected[I] then
        FDefName := lst_DefinitionArea.Items.Strings[I];
        Directory := vAppDBSetting.MapDefGame + '\Def_' + FDefName + '.txt';
    end
    else
      Break;
  end;

  frmAdminMainForm.Map1.Layers.RemoveAll;

  case frmAdminMainForm.inFlag of
    1 :
    begin
      frmAdminMainForm.edtMapMode1.Text := FDefName;

      GetValueDef(Directory, frmAdminMainForm.FListFileMode_Map1,
        frmAdminMainForm.FList_IDArea_Map1, frmAdminMainForm.FList_NameArea_Map1);

      frmAdminMainForm.OnClick_ToolButton(frmAdminMainForm.btnAirMap);
    end;
    2 :
    begin
      frmAdminMainForm.edtMapMode2.Text := FDefName;

      GetValueDef(Directory, frmAdminMainForm.FListFileMode_Map2,
        frmAdminMainForm.FList_IDArea_Map2, frmAdminMainForm.FList_NameArea_Map2);

      frmAdminMainForm.OnClick_ToolButton(frmAdminMainForm.btnLandMap);
    end;
    3 :
    begin
      frmAdminMainForm.edtMapMode3.Text := FDefName;

      GetValueDef(Directory, frmAdminMainForm.FListFileMode_Map3,
        frmAdminMainForm.FList_IDArea_Map3, frmAdminMainForm.FList_NameArea_Map3);

      frmAdminMainForm.OnClick_ToolButton(frmAdminMainForm.btnSeaMap);
    end;
  end;

  Close;
end;

procedure TDefinitionArea.btn_RemoveClick(Sender: TObject);
begin
  CreateDefinitionArea.Action('Remove');
end;

function TDefinitionArea.CheckDefName(const DefName: string;
  var Available: Boolean): Boolean;
var
  I, IndexTxt: Integer;
  FileName: string;
begin
  ListFile.Clear;

  if FindFirst(Path + '*', faAnyFile, SR) = 0 then
  begin
    repeat
      ListFile.Add(SR.Name);
    until FindNext(SR) <> 0;
      FindClose(SR);
  end;

  for I := 0 to ListFile.Count - 1 do
  begin
    IndexTxt := Pos('.txt', ListFile[I]);
    FileName := Copy(ListFile[I],5, IndexTxt-5);

    if (FileName = DefName) or (UpperCase(FileName) = DefName)
      or (LowerCase(FileName) = DefName)then
    begin
      Available := True;
      Break;
    end
    else
      Available := False;
  end;
end;

function TDefinitionArea.CheckNumberCopy(const DefName: string;
  var Number: Integer): Integer;
var
  indexCopy, I, IndexTxt : Integer;
  FileName : string;
  FListNumber: TStringList;
begin
  FListNumber := TStringList.Create;

  for I := 0 to lst_DefinitionArea.Count - 1 do
  begin
    IndexTxt := Pos(DefName, lst_DefinitionArea.Items.Strings[I]);
    if IndexTxt = 0 then
      Continue
    else
    begin
      FListNumber.Add('1');
      Number := FListNumber.Count;
    end;
  end;
end;

procedure TDefinitionArea.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListFile.Clear;
  ListDefinition.Clear;
end;

procedure TDefinitionArea.FormCreate(Sender: TObject);
begin
  ListFile := TStringList.Create;
  ListDefinition := TList.Create;
  ListDBGameAreaDefinition := TList.Create;
end;

procedure TDefinitionArea.FormShow(Sender: TObject);
begin
  Path := vAppDBSetting.MapDefGame + '\Def_';
  RefreshDef;
end;

function TDefinitionArea.GetValueDef(const Directory: string; var FListFile, FListID,
  FListName: TStringList): string;
var
  Area, Default : string;
  I,J : Integer;
begin
  FListFile := TStringList.Create;
  FListID := TStringList.Create;
  FListName := TStringList.Create;

  if FileExists(Directory) then
    FListFile.LoadFromFile(Directory);

  for I := 0 to FListFile.Count - 1 do
  begin
    frmAdminMainForm.GetValue('Area_', FListFile[I], Area);

    for J := 0 to lst_DBGameAreaIdentifier.Count - 1 do
    begin
      if Area = lst_DBGameAreaIdentifier.Items.Strings[J] then
      begin
        FListID.Add(lst_DBIdGameArea.Items.Strings[J]);
        FListName.Add(lst_DBGameAreaIdentifier.Items.Strings[J]);
        Break;
      end
      else
        Continue;
    end;
  end;
end;

procedure TDefinitionArea.lst_DefinitionAreaClick(Sender: TObject);
begin
  btn_Copy.Enabled   := true;
  btn_Edit.Enabled   := true;
  btn_Remove.Enabled := true;
  btn_Pick.Enabled := True;
end;

procedure TDefinitionArea.RefreshDef;
var
  I : Integer;
  LFile, IndexTxt : Integer;
  FileName : string;
begin
  lst_DefinitionArea.Items.Clear;
  ListFile.Clear;

  Path := vAppDBSetting.MapDefGame + '\Def_';

  if FindFirst(Path + '*', faAnyFile, SR) = 0 then
  begin
    repeat
      ListFile.Add(SR.Name);
    until FindNext(SR) <> 0;
      FindClose(SR);
  end;

  lst_DefinitionArea.Items.Clear;
  lst_DBIdGameArea.Items.Clear;

  for I := 0 to ListFile.Count - 1 do
  begin
    IndexTxt := Pos('.txt', ListFile[I]);
    FileName := Copy(ListFile[I],5, IndexTxt-5);
    lst_DefinitionArea.Items.Add(FileName);
  end;

  uSimDBEditor.getGameAreaList(ListDBGameAreaDefinition);

  lst_DBGameAreaIdentifier.Items.Clear;
  lst_DBIdGameArea.Items.Clear;

  for I := 0 to ListDBGameAreaDefinition.Count - 1 do
  begin
    lst_DBGameAreaIdentifier.Items.Add(TGame_Environment_Definition(ListDBGameAreaDefinition[I]).FGameArea.Game_Area_Identifier);
    lst_DBIdGameArea.Items.Add(IntToStr(TGame_Environment_Definition(ListDBGameAreaDefinition[i]).FGameArea.Game_Area_Index));
  end;
end;
end.
