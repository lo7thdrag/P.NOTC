unit ufrmAvailableMine;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uDBAsset_Weapon, uSimContainers;

type
  TfrmAvailableMine = class(TForm)
    ImgBackgroungList: TImage;
    lblsearch: TLabel;
    ImgBackground: TImage;
    lbl_search: TLabel;
    btnNew: TImage;
    btnCopy: TImage;
    btnEdit: TImage;
    btnUsage: TImage;
    btnDelete: TImage;
    imgImgBtnBack: TImage;
    lstMine: TListBox;
    edtCheat: TEdit;
    Image2: TImage;
    Image1: TImage;
    Label2: TLabel;
    Image3: TImage;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);
    procedure ImgBackgroundClick(Sender: TObject);

  private
    FUpdateList : Boolean;
    FMineList : TList;
    FSelectedMine : TMine_On_Board;

    procedure CopyPODvsRange(idMine, targetType: integer);
    procedure UpdateMineList;

  end;

var
  frmAvailableMine: TfrmAvailableMine;

implementation

uses
  uDataModuleTTT, ufrmSummaryMine, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableMine.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FMineList);
  Action := cafree;
end;

procedure TfrmAvailableMine.FormCreate(Sender: TObject);
begin
  FMineList := TList.Create;
end;

procedure TfrmAvailableMine.FormShow(Sender: TObject);
begin
  UpdateMineList;
end;

procedure TfrmAvailableMine.ImgBackgroundClick(Sender: TObject);
begin

end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableMine.btnNewClick(Sender: TObject);
begin
  frmSummaryMine := TfrmSummaryMine.Create(Self);
  try
    with frmSummaryMine do
    begin
      SelectedMine := TMine_On_Board.Create;
      ShowModal;
      SelectedMine.Free;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryMine.Free;
  end;

  if FUpdateList then
    UpdateMineList;
end;

procedure TfrmAvailableMine.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableMine.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
  idTemp : Integer;
begin
  if lstMine.ItemIndex = -1 then
  begin
    ShowMessage('Select Mine Data... !');
    Exit;
  end;

  with FSelectedMine do
  begin
    newClassName := FMine_Def.Mine_Identifier + ' - Copy';

    count := dmTTT.GetMineDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FMine_Def.Mine_Identifier := newClassName;
    idTemp :=FMine_Def.Mine_Index;

    dmTTT.InsertMineDef(FMine_Def);
    dmTTT.InsertNoteStorage(3, FMine_Def.Mine_Index, FNote);

    {Copy Probability of Detonation Curve}
    CopyPODvsRange(idTemp, 1);

  end;

  UpdateMineList;
end;

procedure TfrmAvailableMine.btnEditClick(Sender: TObject);
begin
  if lstMine.ItemIndex = -1 then
  begin
    ShowMessage('Select Mine Data ... !');
    Exit;
  end;

  frmSummaryMine := TfrmSummaryMine.Create(Self);
  try
    with frmSummaryMine do
    begin
      SelectedMine := FSelectedMine;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryMine.Free;
  end;

  if FUpdateList then
    UpdateMineList;
end;

procedure TfrmAvailableMine.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList: TList;

begin
  if lstMine.ItemIndex = -1 then
  begin
    ShowMessage('Select Mine Data ... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedMine.FMine_Def do
    begin
      tempList := TList.Create;

      {Pengecekan Relasi Dengan Resource Allocation}
      if dmTTT.GetPlatformInstanceAtResourceAllocation(5, Mine_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some resource allocation');
        tempList.Free;
        Exit;
      end;

      {Pengecekan Relasi Dengan Runtime Platform Library}
      if dmTTT.GetPlatformAtPlatformLibraryEntry(4, Mine_Index, tempList) > 0then
      begin
        ShowMessage('Cannot delete, because is already in used by some Runtime Platform Library');
        tempList.Free;
        Exit;
      end;

      {Pengecekan Relasi Dengan Tabel On Board}
      if dmTTT.GetFittedWeaponAtVehicleOnBoard(9, Mine_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some vehicles');
        tempList.Free;
        Exit;
      end;
      tempList.Free;

      {Catatan : Seharusnya ada tambahan menghapus data di Tabel Mine_POD_vs_Range}
      dmTTT.DeleteMinePODvsRange(1, Mine_Index);

      dmTTT.DeleteNoteStorage(3, Mine_Index);

      if dmTTT.DeleteMineDef(Mine_Index) then
        ShowMessage('Data has been deleted');

    end;

    UpdateMineList;
  end;
end;

procedure TfrmAvailableMine.btnUsageClick(Sender: TObject);
begin
  if lstMine.ItemIndex = -1 then
  begin
    ShowMessage('Select Mine... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedMine.FMine_Def.Mine_Index;
      name_usage := FSelectedMine.FMine_Def.Mine_Identifier;
      usage_title := 'On Board Vehicle:';
      UIndex := 9;

      ShowModal;
    end;

  finally
    frmUsage.Free;
  end;

end;

procedure TfrmAvailableMine.lbSingleClick(Sender: TObject);
begin
  if lstMine.ItemIndex = -1 then
    Exit;

  FSelectedMine := TMine_On_Board(lstMine.Items.Objects[lstMine.ItemIndex]);
end;

procedure TfrmAvailableMine.CopyPODvsRange(idMine, targetType: integer);
var
  newClassName : string;
  count, i : Integer;
  PointList : TList;
  data : TMine_On_Board;

begin
  with FSelectedMine do
  begin
    PointList := TList.Create;

    if dmTTT.GetMinePODvsRange(idMine, targetType, PointList) > 0 then
    begin
      for i := 0 to PointList.Count - 1 do
      begin
        data := PointList.Items[i];
        data.FMine_POD.Mine_Index := FMine_Def.Mine_Index;
        dmTTT.InsertMinePODvsRange(data.FMine_POD)
      end;
    end;

    PointList.Free;
  end;
end;

procedure TfrmAvailableMine.edtCheatKeyPress(Sender: TObject; var Key: Char);
 var
  i : Integer;
  mine : TMine_On_Board;
begin
  if Key = #13 then
  begin


    lstMine.Items.Clear;

  dmTTT.GetfilterMineDef(FMineList,edtCheat.text);
    for i := 0 to FMineList.Count - 1 do
    begin
  mine := FMineList.Items[i];
   lstMine.Items.AddObject(mine.FMine_Def.Mine_Identifier, mine);
    end;
  end;
end;

procedure TfrmAvailableMine.UpdateMineList;
var
  i : Integer;
  mine : TMine_On_Board;

begin
  lstMine.Items.Clear;

  dmTTT.GetAllMineDef(FMineList);

  for i := 0 to FMineList.Count - 1 do
  begin
    mine := FMineList.Items[i];
   lstMine.Items.AddObject(mine.FMine_Def.Mine_Identifier, mine);
  end;
end;

{$ENDREGION}

end.
