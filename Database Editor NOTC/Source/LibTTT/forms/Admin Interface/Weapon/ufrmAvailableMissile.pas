unit ufrmAvailableMissile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uDBAsset_Weapon, uSimContainers;

type
  TfrmAvailableMissile = class(TForm)
    Image1: TImage;
    btnCopy: TImage;
    btnDelete: TImage;
    btnEdit: TImage;
    btnNew: TImage;
    btnUsage: TImage;
    Label2: TLabel;
    lstMissile: TListBox;
    Image5: TImage;
    Image3: TImage;
    edtCheat: TEdit;
    lbl_search: TLabel;
    imgImgBtnBack: TImage;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);

  private
    FUpdateList : Boolean;
    FMissileList : TList;
    FSelectedMissile : TMissile_On_Board;
    FSelectedHybrid : THybrid_On_Board;

    procedure UpdateMissileList;
  end;

var
  frmAvailableMissile: TfrmAvailableMissile;

implementation

uses
  uDataModuleTTT, ufrmSummaryMissile, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableMissile.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FMissileList);
  Action := caFree;
end;

procedure TfrmAvailableMissile.FormCreate(Sender: TObject);
begin
  FMissileList := TList.Create;
end;

procedure TfrmAvailableMissile.FormShow(Sender: TObject);
begin
  UpdateMissileList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableMissile.btnNewClick(Sender: TObject);
begin

  frmSummaryMissile := TfrmSummaryMissile.Create(Self);
  try
    with frmSummaryMissile do
    begin
      SelectedMissile := TMissile_On_Board.Create;
      ShowModal;
      SelectedMissile.Free;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryMissile.Free;
  end;

  if FUpdateList then
    UpdateMissileList;
end;

procedure TfrmAvailableMissile.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableMissile.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
  idMissileTemp : Integer;

begin
  if lstMissile.ItemIndex = -1 then
  begin
    ShowMessage('Select Missile... !');
    Exit;
  end;

  with FSelectedMissile do
  begin
    idMissileTemp := FDef.Missile_Index;
    newClassName := FDef.Class_Identifier + ' - Copy';

    count := dmTTT.GetMissileDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FDef.Class_Identifier := newClassName;

    dmTTT.InsertMissileDef(FDef);
    dmTTT.InsertNoteStorage(2, FDef.Missile_Index, FNote);

    {Insert data hybrid}
    if dmTTT.GetHybridDef(idMissileTemp, FSelectedHybrid) then
    begin
      FSelectedHybrid.FMissile_Def.Missile_Index := FDef.Missile_Index;

      if (FData.Hybrid_Index = 0) and (FSelectedHybrid.FTorpedo_Def.Torpedo_Index <> 0)then
        dmTTT.insertHybrid(FSelectedHybrid)
    end;

  end;

  UpdateMissileList;
end;

procedure TfrmAvailableMissile.btnEditClick(Sender: TObject);
begin

  if lstMissile.ItemIndex = -1 then
  begin
    ShowMessage('Select Missile Data ... !');
    Exit;
  end;

  frmSummaryMissile := TfrmSummaryMissile.Create(Self);
  try
    with frmSummaryMissile do
    begin
      SelectedMissile := FSelectedMissile;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryMissile.Free;
  end;

  if FUpdateList then
    UpdateMissileList;
end;

procedure TfrmAvailableMissile.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList: TList;

begin
  if lstMissile.ItemIndex = -1 then
  begin
    ShowMessage('Select Missile... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedMissile.FDef do
    begin
      tempList := TList.Create;

      {Pengecekan Relasi Dengan Resource Allocation}
      if dmTTT.GetPlatformInstanceAtResourceAllocation(2, Missile_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some resource allocation');
        tempList.Free;
        Exit;
      end;

      {Pengecekan Relasi Dengan Runtime Platform Library}
      if dmTTT.GetPlatformAtPlatformLibraryEntry(2, Missile_Index, tempList) > 0then
      begin
        ShowMessage('Cannot delete, because is already in used by some Runtime Platform Library');
        tempList.Free;
        Exit;
      end;

      {Pengecekan Relasi Dengan Tabel On Board}
      if dmTTT.GetFittedWeaponAtVehicleOnBoard(7, Missile_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some vehicles');
        tempList.Free;
        Exit;
      end;
      tempList.Free;

      dmTTT.deleteHybrid(Missile_Index);

      dmTTT.DeleteNoteStorage(2, Missile_Index);

      if dmTTT.DeleteMissileDef(Missile_Index) then
        ShowMessage('Data has been deleted');

    end;

    UpdateMissileList;
  end;
end;

procedure TfrmAvailableMissile.btnUsageClick(Sender: TObject);
begin
  if lstMissile.ItemIndex = -1 then
  begin
    ShowMessage('Select Missile... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedMissile.FDef.Missile_Index;
      name_usage := FSelectedMissile.FDef.Class_Identifier;
      usage_title := 'On Board Vehicle : ';
      UIndex := 7;

      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;

end;

procedure TfrmAvailableMissile.edtCheatKeyPress(Sender: TObject; var Key: Char);
 var
   i : Integer;
  missile : TMissile_On_Board;
begin
  if Key = #13 then
  begin

lstMissile.Items.Clear;

  dmTTT.GetfilterMissileDef(FMissileList,edtCheat.text);
    for i := 0 to FMissileList.Count - 1 do
    begin
    missile := FMissileList.Items[i];
    lstMissile.Items.AddObject(missile.FDef.Class_Identifier, missile);
    end;
  end;
end;
procedure TfrmAvailableMissile.lbSingleClick(Sender: TObject);
begin
  if lstMissile.ItemIndex = -1 then
    Exit;

  FSelectedMissile := TMissile_On_Board(lstMissile.Items.Objects[lstMissile.ItemIndex]);
end;

procedure TfrmAvailableMissile.UpdateMissileList;
var
  i : Integer;
  missile : TMissile_On_Board;

begin
  lstMissile.Items.Clear;

  dmTTT.GetAllMissileDef(FMissileList);

  for i := 0 to FMissileList.Count - 1 do
  begin
    missile := FMissileList.Items[i];
    lstMissile.Items.AddObject(missile.FDef.Class_Identifier, missile);
  end;
end;

{$ENDREGION}

end.

