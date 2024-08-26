unit ufrmAvailableGameArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBAsset_GameEnvironment, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uSimContainers;

type
  TfrmAvailableGameArea = class(TForm)
    lstGameArea: TListBox;
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    Image1: TImage;
    lbl_search: TLabel;
    edtCheat: TEdit;
    btnNew: TImage;
    btnCopy: TImage;
    btnEdit: TImage;
    btnUsage: TImage;
    btnDelete: TImage;
    imgImgBtnBack: TImage;
    Image2: TImage;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtgameareaKeyPress(Sender: TObject; var Key: Char);
//    procedure edtgameareaKeyPress(Sender: TObject; var Key: Char);

  private
    FUpdateList : Boolean;
    FGameAreaList : TList;
    FSelectedGameArea : TGame_Environment_Definition;

    { Private declarations }

    procedure UpdateGameAreaList;
    procedure CopyGameAreaDirectory(const aPathName, aSource, aDestination: string);
    procedure DeleteGameAreaDirectory(const aPathName, aFileName: string);
  end;

var
  frmAvailableGameArea: TfrmAvailableGameArea;

implementation

uses
  uDataModuleTTT, ufrmUsage,
  usimDBEditor, uExerciseArea, uGameAreaSelection,
  uBaseCoordSystem, uChooseMap,ufrmSummaryGameAreaEditor,{uENCSelect,} uDBEditSetting, ufrmAdminMainForm, uDBAsset_Geo;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableGameArea.FormShow(Sender: TObject);
begin
  UpdateGameAreaList;
end;

procedure TfrmAvailableGameArea.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FGameAreaList);
end;

procedure TfrmAvailableGameArea.FormCreate(Sender: TObject);
begin
  FGameAreaList := TList.Create;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableGameArea.btnNewClick(Sender: TObject);
begin
  frmSummaryGameAreaEditor := TfrmSummaryGameAreaEditor.Create(Self);
  try
    with frmSummaryGameAreaEditor do
    begin
      SelectedGameArea := TGame_Environment_Definition.Create;
      SelectedGameArea.FGameArea.Detail_Map := 'ENC';
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryGameAreaEditor.Free;
  end;

  if FUpdateList then
    UpdateGameAreaList;
end;

procedure TfrmAvailableGameArea.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableGameArea.btnCopyClick(Sender: TObject);
var
  SourcePath, TargetPath : string;
  oldAreaName, newAreaName : string;
  count : Integer;
begin
  if lstGameArea.ItemIndex = -1 then
  begin
    ShowMessage('Select Game Area !');
    Exit;
  end;

  with FSelectedGameArea do
  begin
    oldAreaName := FGameArea.Game_Area_Identifier;
    newAreaName := FGameArea.Game_Area_Identifier + ' - Copy';

    count := dmTTT.GetGameAreaDef(newAreaName);

    if count > 0 then
      newAreaName := newAreaName + ' (' + IntToStr(count + 1) + ')';

    FGameArea.Game_Area_Identifier := newAreaName;

    dmTTT.InsertGameAreaDef(FGameArea);

    {$REGION ' Copy file game area '}
    SourcePath := vAppDBSetting.MapGSTGame + '\' + oldAreaName;
    TargetPath := vAppDBSetting.MapGSTGame + '\' + newAreaName;

    CopyGameAreaDirectory(SourcePath, SourcePath, TargetPath);
    RenameFile(TargetPath + '\'+ oldAreaName + '.gst', TargetPath + '\'+ newAreaName + '.gst');
    RenameFile(TargetPath + '\'+ oldAreaName + '.txt', TargetPath + '\'+ newAreaName + '.txt');
    {$ENDREGION}

  end;

  UpdateGameAreaList;
end;

procedure TfrmAvailableGameArea.btnEditClick(Sender: TObject);
begin
  if lstGameArea.ItemIndex = -1 then
  begin
    ShowMessage('Select Game Area !');
    Exit;
  end;

  frmSummaryGameAreaEditor := TfrmSummaryGameAreaEditor.Create(Self);
  try
    with frmSummaryGameAreaEditor do
    begin
      SelectedGameArea := FSelectedGameArea;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryGameAreaEditor.Free;
  end;

  if FUpdateList then
    UpdateGameAreaList;
end;

procedure TfrmAvailableGameArea.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList : TList;
  MapDirPath : string;

begin
  if lstGameArea.ItemIndex = -1 then
  begin
    ShowMessage('Select Game Area !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this Game Area ?', mtConfirmation, mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedGameArea.FGameArea do
    begin
      {Pengecekan Relasi Dengan Tabel Game Environment Definition}
      tempList := TList.Create;
      if dmTTT.GetGameAreaAtEnvironment(Game_Area_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some Environment');
        Exit;
        FreeItemsAndFreeList(tempList);
      end;

      {Pengecekan Relasi Dengan Tabel Overlay Definition}
      if dmTTT.GetGameAreaAtOverlayDef(Game_Area_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some Overlay');
        Exit;
        FreeItemsAndFreeList(tempList);
      end;
      FreeItemsAndFreeList(tempList);

      MapDirPath := vAppDBSetting.MapGSTGame + '\' + Game_Area_Identifier;
      DeleteGameAreaDirectory(MapDirPath, MapDirPath);

      if dmTTT.DeleteGameAreaDef(Game_Area_Index) then
        ShowMessage('Data has been deleted');
    end;

    UpdateGameAreaList;
  end;
end;

procedure TfrmAvailableGameArea.btnUsageClick(Sender: TObject);
begin
  if lstGameArea.ItemIndex = -1 then
  begin
    ShowMessage('Select Game Area !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedGameArea.FGameArea.Game_Area_Index;
      name_usage := FSelectedGameArea.FGameArea.Game_Area_Identifier;
      UIndex := 30;
      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
end;

procedure TfrmAvailableGameArea.lbSingleClick(Sender: TObject);
begin
  if lstGameArea.ItemIndex = -1 then
    Exit;

  FSelectedGameArea := TGame_Environment_Definition(lstGameArea.Items.Objects[lstGameArea.ItemIndex]);
end;

procedure TfrmAvailableGameArea.CopyGameAreaDirectory(const aPathName, aSource, aDestination: string);
var
  F : TSearchRec;
  MapDirPath : string;
begin
  if FindFirst(aSource +  '*.*', faAnyFile, F) = 0 then
  begin
    CreateDir(aDestination);

    try
      repeat
        if (F.Attr and faDirectory <> 0) then
        begin
          if (F.Name <> '.') and (F.Name <> '..') then
          begin
            CopyGameAreaDirectory(aPathName, aSource + '\' + F.Name,
              aDestination);
          end;
        end
        else
          CopyFile(PChar(aPathName + '\' + F.Name),
            PChar(aDestination + '\' + F.Name), False);
      until FindNext(F) <> 0;
    finally
      FindClose(F);
    end;
  end;
end;

procedure TfrmAvailableGameArea.DeleteGameAreaDirectory(const aPathName, aFileName: string);
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


procedure TfrmAvailableGameArea.edtgameareaKeyPress(Sender: TObject;
  var Key: Char);
  var
  i : Integer;
  gameArea : TGame_Environment_Definition;
begin
  if Key = #13 then
  begin
    lstGameArea.Items.Clear;

    dmTTT.GetfilterGameAreadef(FGameAreaList, edtCheat.text);

    for i := 0 to FGameAreaList.Count - 1 do
    begin
      gamearea  := FGameAreaList[i];
      lstGameArea.Items.AddObject(gamearea.FGameArea.Game_Area_Identifier, gamearea);
    end;
  end;
end;

procedure TfrmAvailableGameArea.UpdateGameAreaList;
var
  i : Integer;
  gameArea : TGame_Environment_Definition;
begin
  lstGameArea.Items.Clear;

  dmTTT.GetAllGameAreaDef(FGameAreaList);

  for i := 0 to FGameAreaList.Count - 1 do
  begin
    gameArea := FGameAreaList[i];
    lstGameArea.Items.AddObject(gameArea.FGameArea.Game_Area_Identifier, gameArea);
  end;
end;

{$ENDREGION}

end.
