unit ufrmAvailableAcousticDecoy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uSimContainers,
  uDBAsset_Countermeasure;

type
  TfrmAvailableAcousticDecoy = class(TForm)
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    lstAcousticDecoy: TListBox;
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
    FAcousticDecoyList : TList;
    FSelectedAcousticDecoy : TAcoustic_Decoy_On_Board;

    procedure CopyPOHModifier(idAcousticDecoy : integer);
    procedure UpdateAcousticDecoyList;

  end;

var
  frmAvailableAcousticDecoy: TfrmAvailableAcousticDecoy;

implementation

uses
  uDataModuleTTT, ufrmSummaryAcousticDecoy, ufrmUsage;
{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableAcousticDecoy.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAcousticDecoyList);
  Action := cafree;
end;

procedure TfrmAvailableAcousticDecoy.FormCreate(Sender: TObject);
begin
  FAcousticDecoyList := TList.Create;
end;

procedure TfrmAvailableAcousticDecoy.FormShow(Sender: TObject);
begin
  UpdateAcousticDecoyList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableAcousticDecoy.btnNewClick(Sender: TObject);
begin
  frmSummaryAcousticDecoy := TfrmSummaryAcousticDecoy.Create(Self);
  try
    with frmSummaryAcousticDecoy do
    begin
      SelectedAcousticDecoy := TAcoustic_Decoy_On_Board.Create;
      ShowModal;
      SelectedAcousticDecoy.Free;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryAcousticDecoy.Free;
  end;

  if FUpdateList then
    UpdateAcousticDecoyList;
end;

procedure TfrmAvailableAcousticDecoy.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
  idTemp : Integer;

begin
  if lstAcousticDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Acoustic Decoy... !');
    Exit;
  end;

  with FSelectedAcousticDecoy do
  begin
    newClassName := FAccousticDecoy_Def.Decoy_Identifier + ' - Copy';

    count := dmTTT.GetAcousticDecoyDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FAccousticDecoy_Def.Decoy_Identifier := newClassName;
    idTemp :=FAccousticDecoy_Def.Decoy_Index;

    dmTTT.InsertAcousticDecoyDef(FAccousticDecoy_Def);
    dmTTT.InsertNoteStorage(20, FAccousticDecoy_Def.Decoy_Index, FNote);

    {Copy POH Modifier}
    CopyPOHModifier(idTemp);
  end;

  UpdateAcousticDecoyList;
end;

procedure TfrmAvailableAcousticDecoy.btnEditClick(Sender: TObject);
begin
  if lstAcousticDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Acoustic Decoy... !');
    Exit;
  end;

  frmSummaryAcousticDecoy := TfrmSummaryAcousticDecoy.Create(Self);
  try
    with frmSummaryAcousticDecoy do
    begin
      SelectedAcousticDecoy := FSelectedAcousticDecoy;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryAcousticDecoy.Free;
  end;

  if FUpdateList then
    UpdateAcousticDecoyList;
end;

procedure TfrmAvailableAcousticDecoy.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
begin
  if lstAcousticDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Acoustic Decoy... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedAcousticDecoy.FAccousticDecoy_Def do
    begin
      {Pengecekan Relasi Dengan Tabel On Board}
      if dmTTT.GetCountermeasure_On_Board_By_Index(1, Decoy_Index) then
      begin
        ShowMessage('Cannot delete, because is already in used by some Vehicles');
        Exit;
      end;

      dmTTT.DeleteAcoustic_Decoy_POH_Modifier(Decoy_Index);

      dmTTT.DeleteNoteStorage(20, Decoy_Index);

      if dmTTT.DeleteAcousticDecoyDef(Decoy_Index) then
        ShowMessage('Data has been deleted');

    end;

    UpdateAcousticDecoyList;
  end;
end;

procedure TfrmAvailableAcousticDecoy.btnUsageClick(Sender: TObject);
begin
  if lstAcousticDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Acoustic Decoy... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedAcousticDecoy.FAccousticDecoy_Def.Decoy_Index;
      name_usage := FSelectedAcousticDecoy.FAccousticDecoy_Def.Decoy_Identifier;
      usage_title := 'On Board Vehicle:';
      UIndex := 12;

      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
end;

procedure TfrmAvailableAcousticDecoy.CopyPOHModifier(idAcousticDecoy: integer);
var
  i : Integer;
  PointList : TList;
  data : TAcoustic_Decoy_POH_Modifier;

begin
  with FSelectedAcousticDecoy do
  begin
    PointList := TList.Create;

    if dmTTT.GetAcousticDecoyPOHModifier(idAcousticDecoy, PointList) > 0 then
    begin
      for i := 0 to PointList.Count - 1 do
      begin
        data := PointList.Items[i];
        data.FAccousticDecoy_POH.Decoy_Index := FAccousticDecoy_Def.Decoy_Index;
        dmTTT.InsertAcoustic_Decoy_POH_Modifier(data)
      end;
    end;

    PointList.Destroy;
  end;
end;

procedure TfrmAvailableAcousticDecoy.edtCheatKeyPress(Sender: TObject;
  var Key: Char);
 var
i : Integer;
  acousticdecoy : TAcoustic_Decoy_On_Board;
begin
  if Key = #13 then
  begin
 lstAcousticDecoy.Items.Clear;

  dmTTT.GetfilterAcousticDecoyDef(FAcousticDecoyList,edtCheat.Text);

    for i := 0 to FAcousticDecoyList.count - 1 do
    begin
 acousticdecoy := FAcousticDecoyList.Items[i];
    lstAcousticDecoy.Items.AddObject(acousticdecoy.FAccousticDecoy_Def.Decoy_Identifier, acousticdecoy);
  end;
end;
end;

procedure TfrmAvailableAcousticDecoy.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAvailableAcousticDecoy.lbSingleClick(Sender: TObject);
begin
  if lstAcousticDecoy.ItemIndex = -1 then
    Exit;

  FSelectedAcousticDecoy := TAcoustic_Decoy_On_Board(lstAcousticDecoy.Items.Objects[lstAcousticDecoy.ItemIndex]);
end;

procedure TfrmAvailableAcousticDecoy.UpdateAcousticDecoyList;
var
  i : Integer;
  acousticdecoy : TAcoustic_Decoy_On_Board;
begin
  lstAcousticDecoy.Items.Clear;

  dmTTT.GetAllAcousticDecoyDef(FAcousticDecoyList);

  for i := 0 to FAcousticDecoyList.Count - 1 do
  begin
    acousticdecoy := FAcousticDecoyList.Items[i];
    lstAcousticDecoy.Items.AddObject(acousticdecoy.FAccousticDecoy_Def.Decoy_Identifier, acousticdecoy);
  end;
end;

{$ENDREGION}

end.
