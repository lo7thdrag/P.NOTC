unit ufrmAvailableGun;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uDBAsset_Weapon, uSimContainers;

type
  TfrmAvailableGun = class(TForm)
    lstGun: TListBox;
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
    procedure CheatClick(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);

  private
    FUpdateList : Boolean;
    FGunList : TList;
    FSelectedGun : TGun_Definition;

    procedure CopyTargetCurve(idGun, targetType : integer);
    procedure UpdateGunList;

  end;

var
  frmAvailableGun: TfrmAvailableGun;

implementation

uses
  uDataModuleTTT, ufrmSummaryGun, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableGun.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FGunList);
  Action := cafree;
end;

procedure TfrmAvailableGun.FormCreate(Sender: TObject);
begin
  FGunList := TList.Create;
end;

procedure TfrmAvailableGun.FormShow(Sender: TObject);
begin
  UpdateGunList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableGun.btnNewClick(Sender: TObject);
begin
  frmSummaryGun := TfrmSummaryGun.Create(Self);
  try
    with frmSummaryGun do
    begin
      SelectedGun := TGun_Definition.Create;
      ShowModal;
      SelectedGun.Free;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryGun.Free;
  end;

  if FUpdateList then
    UpdateGunList;
end;

procedure TfrmAvailableGun.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAvailableGun.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
  idTemp : Integer;

begin
  if lstGun.ItemIndex = -1 then
  begin
    ShowMessage('Select Gun Data ... !');
    Exit;
  end;

  with FSelectedGun do
  begin
    newClassName := FData.Gun_Identifier + ' - Copy';

    count := dmTTT.GetGunDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FData.Gun_Identifier := newClassName;
    idTemp :=FData.Gun_Index;

    dmTTT.InsertGunDef(FData);
    dmTTT.InsertNoteStorage(13, FData.Gun_Index, FNote);

    {Copy Target Curve}
    CopyTargetCurve(idTemp, 1);
    CopyTargetCurve(idTemp, 2);
  end;

  UpdateGunList;
end;

procedure TfrmAvailableGun.btnEditClick(Sender: TObject);
begin
  if lstGun.ItemIndex = -1 then
    Exit;

  frmSummaryGun := TfrmSummaryGun.Create(Self);
  try
    with frmSummaryGun do
    begin
      SelectedGun := TGun_Definition.Create;
      SelectedGun := FSelectedGun;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryGun.Free;
  end;

  if FUpdateList then
    UpdateGunList;
end;

procedure TfrmAvailableGun.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList: TList;

begin
  if lstGun.ItemIndex = -1 then
  begin
    ShowMessage('Select Gun Data ... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedGun.FData do
    begin
      tempList := TList.Create;

      {Pengecekan Relasi Dengan Tabel On Board}
      if dmTTT.GetPointEffectAtVehicleOnBoard(10, Gun_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some vehicles');
        tempList.Free;
        Exit;
      end;
      tempList.Free;

      {Catatan : Seharusnya ada tambahan menghapus data di Tabel Gun_POH_vs_Range}
      dmTTT.DeleteGunPOHvsRange(1, Gun_Index);

      dmTTT.DeleteNoteStorage(13, Gun_Index);

      if dmTTT.DeleteGunDef(Gun_Index) then
        ShowMessage('Data has been deleted');

    end;

    UpdateGunList;
  end;
end;

procedure TfrmAvailableGun.btnUsageClick(Sender: TObject);
begin
  if lstGun.ItemIndex = -1 then
    Exit;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedGun.FData.Gun_Index;
      name_usage := FSelectedGun.FData.Gun_Identifier;
      usage_title := 'On Board Vehicle:';
      UIndex := 10;

      ShowModal;
    end;

  finally
    frmUsage.Free;
  end;

end;

procedure TfrmAvailableGun.lbSingleClick(Sender: TObject);
begin
  if lstGun.ItemIndex = -1 then
    Exit;

  FSelectedGun := TGun_Definition(lstGun.Items.Objects[lstGun.ItemIndex]);
end;

procedure TfrmAvailableGun.CheatClick(Sender: TObject);
begin
  edtCheat.Visible := not edtCheat.Visible;
end;

procedure TfrmAvailableGun.CopyTargetCurve(idGun, targetType: integer);
var
  i : Integer;
  PointList : TList;
  data : TGun_Definition;

begin
  with FSelectedGun do
  begin
    PointList := TList.Create;

    if dmTTT.GetGunPOHvsRange(idGun, targetType, PointList) > 0 then
    begin
      for i := 0 to PointList.Count - 1 do
      begin
        data := PointList.Items[i];
        data.FGun_POH.Gun_Index := FData.Gun_Index;
        data.FGun_POH.Target_Type := targetType;
        dmTTT.InsertGunPOHvsRange(data.FGun_POH)
      end;
    end;

    PointList.Destroy;
  end;
end;

procedure TfrmAvailableGun.edtCheatKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
  gun : TGun_Definition;
begin
  if Key = #13 then
  begin
    lstGun.Items.Clear;

    dmTTT.GetFilterGunDef(FGunList, edtCheat.text);

    for i := 0 to FGunList.Count - 1 do
    begin
      gun := FGunList.Items[i];
      lstGun.Items.AddObject(gun.FData.Gun_Identifier, gun);
    end;
  end;
end;

procedure TfrmAvailableGun.UpdateGunList;
var
  i : Integer;
  gun : TGun_Definition;

begin
  lstGun.Items.Clear;

  dmTTT.GetAllGunDef(FGunList);

  for i := 0 to FGunList.Count - 1 do
  begin
    gun := FGunList.Items[i];
    lstGun.Items.AddObject(gun.FData.Gun_Identifier, gun);
  end;
end;

{$ENDREGION}

end.
