unit ufrmAvailableTorpedo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uDBAsset_Weapon, uSimContainers;

type
  TfrmAvailableTorpedo = class(TForm)
    lstTorpedo: TListBox;
    ImgBackground: TImage;
    Label2: TLabel;
    ImgBackgroungList: TImage;
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

  private
    FUpdateList : Boolean;
    FTorpedoList : TList;
    FSelectedTorpedo : TTorpedo_On_Board;

    procedure UpdateTorpedoList;
  end;

var
  frmAvailableTorpedo: TfrmAvailableTorpedo;

implementation

uses
  uDataModuleTTT, ufrmSummaryTorpedo, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableTorpedo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FTorpedoList);
  Action := cafree;
end;

procedure TfrmAvailableTorpedo.FormCreate(Sender: TObject);
begin
  FTorpedoList := TList.Create;
end;

procedure TfrmAvailableTorpedo.FormShow(Sender: TObject);
begin
  UpdateTorpedoList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableTorpedo.btnNewClick(Sender: TObject);
begin
  frmSummaryTorpedo := TfrmSummaryTorpedo.Create(Self);
  try
    with frmSummaryTorpedo do
    begin
      SelectedTorpedo := TTorpedo_On_Board.Create;
      ShowModal;
      SelectedTorpedo.Free;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryTorpedo.Free;
  end;

  if FUpdateList then
    UpdateTorpedoList;
end;

procedure TfrmAvailableTorpedo.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAvailableTorpedo.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
begin
  if lstTorpedo.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo... !');
    Exit;
  end;

  with FSelectedTorpedo do
  begin
    newClassName := FDef.Class_Identifier + ' - Copy';

    count := dmTTT.GetTorpedoDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FDef.Class_Identifier := newClassName;

    dmTTT.InsertTorpedoDef(FDef);
    dmTTT.InsertNoteStorage(4, FDef.Torpedo_Index, FNote);
  end;

  UpdateTorpedoList;
end;

procedure TfrmAvailableTorpedo.btnEditClick(Sender: TObject);
begin
  if lstTorpedo.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo Data ... !');
    Exit;
  end;

  frmSummaryTorpedo := TfrmSummaryTorpedo.Create(Self);
  try
    with frmSummaryTorpedo do
    begin
      SelectedTorpedo := FSelectedTorpedo;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryTorpedo.Free;
  end;

  if FUpdateList then
    UpdateTorpedoList;
end;

procedure TfrmAvailableTorpedo.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList: TList;

begin
  if lstTorpedo.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo Data ... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedTorpedo.FDef do
    begin
      tempList := TList.Create;

      {Pengecekan Relasi Dengan Resource Allocation}
      if dmTTT.GetPlatformInstanceAtResourceAllocation(3, Torpedo_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some resource allocation');
        tempList.Free;
        Exit;
      end;

      {Pengecekan Relasi Dengan Runtime Platform Library}
      if dmTTT.GetPlatformAtPlatformLibraryEntry(3, Torpedo_Index, tempList) > 0then
      begin
        ShowMessage('Cannot delete, because is already in used by some Runtime Platform Library');
        tempList.Free;
        Exit;
      end;

      {Pengecekan Relasi Dengan Tabel On Board}
      if dmTTT.GetFittedWeaponAtVehicleOnBoard(8, Torpedo_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some vehicles');
        tempList.Free;
        Exit;
      end;

      {Pengecekan Relasi Dengan Tabel Missile Definition}
      if dmTTT.GetTorpedoAtMissileDef(Torpedo_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some missile definition');
        tempList.Free;
        Exit;
      end;
      tempList.Free;

      dmTTT.DeleteTorpedoPOHModifier(1, Torpedo_Index);
      dmTTT.DeleteNoteStorage(4, Torpedo_Index);

      if dmTTT.DeleteTorpedoDef(Torpedo_Index) then
        ShowMessage('Data has been deleted');

    end;

    UpdateTorpedoList;
  end;
end;

procedure TfrmAvailableTorpedo.btnUsageClick(Sender: TObject);
begin
  if lstTorpedo.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedTorpedo.FDef.Torpedo_Index;
      name_usage := FSelectedTorpedo.FDef.Class_Identifier;
      usage_title := 'On Board Vehicle : ';
      UIndex := 8;

    ShowModal;
    end;

  finally
    frmUsage.Free;
  end;

end;

procedure TfrmAvailableTorpedo.edtCheatKeyPress(Sender: TObject; var Key: Char);
 var
 i : Integer;
  torpedo : TTorpedo_On_Board;
begin
  if Key = #13 then
  begin

  lstTorpedo.Items.Clear;

  dmTTT.GetfilterTorpedoDef(FTorpedoList,edtCheat.text);
    for i := 0 to FTorpedoList.Count - 1 do
    begin
      torpedo := FTorpedoList.Items[i];
    lstTorpedo.Items.AddObject(Torpedo.FDef.Class_Identifier, torpedo);
    end;
  end;
end;

procedure TfrmAvailableTorpedo.lbSingleClick(Sender: TObject);
begin
  if lstTorpedo.ItemIndex = -1 then
    Exit;
  FSelectedTorpedo := TTorpedo_On_Board(lstTorpedo.Items.Objects[lstTorpedo.ItemIndex]);
end;

procedure TfrmAvailableTorpedo.UpdateTorpedoList;
var
  i : Integer;
  torpedo : TTorpedo_On_Board;

begin
  lstTorpedo.Items.Clear;

  dmTTT.GetAllTorpedoDef(FTorpedoList);

  for i := 0 to FTorpedoList.Count - 1 do
  begin
    torpedo := FTorpedoList.Items[i];
    lstTorpedo.Items.AddObject(Torpedo.FDef.Class_Identifier, torpedo);
  end;
end;

{$ENDREGION}

end.
