unit ufrmAvailableSonobuoy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uSimContainers,
  uDBAsset_Sonobuoy;

type
  TfrmAvailableSonobuoy = class(TForm)
    lbSonobuoy: TListBox;
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
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ImgBtnBackClick(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);


  private
    FUpdateList : Boolean;
    FSonobuoyList : TList;
    FSelectedSonobuoy : TSonobuoy_On_Board;

    procedure UpdateSonobuoyList;

  end;

var
  frmAvailableSonobuoy: TfrmAvailableSonobuoy;

implementation


uses
   uDataModuleTTT, ufrmSummarySonobuoy, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableSonobuoy.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmAvailableSonobuoy.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FSonobuoyList);
  Action := cafree;
end;

procedure TfrmAvailableSonobuoy.FormCreate(Sender: TObject);
begin
  FSonobuoyList := TList.Create;
end;

procedure TfrmAvailableSonobuoy.FormShow(Sender: TObject);
begin
  UpdateSonobuoyList;
end;

procedure TfrmAvailableSonobuoy.ImgBtnBackClick(Sender: TObject);
begin

end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableSonobuoy.btnNewClick(Sender: TObject);
begin
  frmSummarySonobuoy := TfrmSummarySonobuoy.Create(Self);
  try
    with frmSummarySonobuoy do
    begin
      SelectedSonobuoy := TSonobuoy_On_Board.Create;
      ShowModal;
      SelectedSonobuoy.Free;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummarySonobuoy.Free;
  end;

  if FUpdateList then
    UpdateSonobuoyList;
end;

procedure TfrmAvailableSonobuoy.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
begin
  if lbSonobuoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Sonobuoy... !');
    Exit;
  end;

  with FSelectedSonobuoy do
  begin
    newClassName := FDef.Class_Identifier + ' - Copy';

    count := dmTTT.GetSonobuoyDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FDef.Class_Identifier := newClassName;

    dmTTT.InsertSonobuoyDef(FDef);
    dmTTT.InsertNoteStorage(6, FDef.Sonobuoy_Index, FNote);
  end;

  UpdateSonobuoyList;
end;

procedure TfrmAvailableSonobuoy.btnEditClick(Sender: TObject);
begin
   if lbSonobuoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Sonobuoy... !');
    Exit;
  end;

  frmSummarySonobuoy := TfrmSummarySonobuoy.Create(Self);
  try
    with frmSummarySonobuoy do
    begin
      SelectedSonobuoy := FSelectedSonobuoy;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummarySonobuoy.Free;
  end;

  if FUpdateList then
    UpdateSonobuoyList;
end;

procedure TfrmAvailableSonobuoy.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList: TList;

begin
 if lbSonobuoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Sonobuoy... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedSonobuoy.FDef do
    begin
      tempList := TList.Create;

      {Pengecekan Relasi Dengan Resource Allocation}
     if dmTTT.GetPlatformInstanceAtResourceAllocation(4, Sonobuoy_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some resource allocation');
        FreeItemsAndFreeList(tempList);
        Exit;
      end;

      {Pengecekan Relasi Dengan Runtime Platform Library}
      if dmTTT.GetPlatformAtPlatformLibraryEntry(7, Sonobuoy_Index, tempList) > 0then
      begin
        ShowMessage('Cannot delete, because is already in used by some Runtime Platform Library');
        FreeItemsAndFreeList(tempList);
        Exit;
      end;
      FreeItemsAndFreeList(tempList);

      {Pengecekan Relasi Dengan Tabel On Board}
      if dmTTT.GetSensor_On_Board_By_Index(8, Sonobuoy_Index) then
      begin
        ShowMessage('Cannot delete, because is already in used by some vehicles');
        Exit;
      end;

      dmTTT.DeleteNoteStorage(6, Sonobuoy_Index);

      if dmTTT.DeleteSonobuoyDef(Sonobuoy_Index) then
        ShowMessage('Data has been deleted');

    end;

    UpdateSonobuoyList;
  end;
end;

procedure TfrmAvailableSonobuoy.btnUsageClick(Sender: TObject);
begin
  if lbSonobuoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Sonobuoy... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedSonobuoy.FDef.Sonobuoy_Index;
      name_usage := FSelectedSonobuoy.FDef.Class_Identifier;
      usage_title := 'On Board Vehicle:';
      UIndex := 6;

      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
end;

procedure TfrmAvailableSonobuoy.edtCheatKeyPress(Sender: TObject;
  var Key: Char);
  var
  i : Integer;
  sonobuoy : TSonobuoy_On_Board;
begin
  if Key = #13 then
  begin
 lbSonobuoy.Items.Clear;

  dmTTT.GetfilterSonobuoyDef(FSonobuoyList,edtcheat.Text);
    for i := 0 to  FSonobuoyList.Count - 1 do
    begin
   sonobuoy := FSonobuoyList.Items[i];
    lbSonobuoy.Items.AddObject(sonobuoy.FDef.Class_Identifier, sonobuoy);
    end;
  end;
end;
procedure TfrmAvailableSonobuoy.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableSonobuoy.lbSingleClick(Sender: TObject);
begin
  if lbSonobuoy.ItemIndex = -1 then
    Exit;

  FSelectedSonobuoy := TSonobuoy_On_Board(lbSonobuoy.Items.Objects[lbSonobuoy.ItemIndex]);
end;

procedure TfrmAvailableSonobuoy.UpdateSonobuoyList;
var
  i : Integer;
  sonobuoy : TSonobuoy_On_Board;
begin
  lbSonobuoy.Items.Clear;

  dmTTT.GetAllSonobuoyDef(FSonobuoyList);

  for i := 0 to FSonobuoyList.Count - 1 do
  begin
    sonobuoy := FSonobuoyList.Items[i];
    lbSonobuoy.Items.AddObject(sonobuoy.FDef.Class_Identifier, sonobuoy);
  end;
end;

{$ENDREGION}

end.
