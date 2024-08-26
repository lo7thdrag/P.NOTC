unit ufrmAvailableTowedJammerDecoy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uSimContainers,
  uDBAsset_Countermeasure;

type
  TfrmAvailableTowedJammerDecoy = class(TForm)
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    lstTowedJammerDecoy: TListBox;
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
    procedure edttowedjammerdecoyKeyPress(Sender: TObject; var Key: Char);



  private
    FUpdateList : Boolean;
    FTowedJammerDecoyList : TList;
    FSelectedTowedJammerDecoy : TTowed_Jammer_Decoy_On_Board;

    procedure UpdateTowedJammerDecoyList;

  end;

var
  frmAvailableTowedJammerDecoy: TfrmAvailableTowedJammerDecoy;

implementation

uses
  uDataModuleTTT, ufrmSummaryTowedJammerDecoy, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableTowedJammerDecoy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FTowedJammerDecoyList);
  Action := cafree;
end;

procedure TfrmAvailableTowedJammerDecoy.FormCreate(Sender: TObject);
begin
  FTowedJammerDecoyList := TList.Create;
end;

procedure TfrmAvailableTowedJammerDecoy.FormShow(Sender: TObject);
begin
  UpdateTowedJammerDecoyList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableTowedJammerDecoy.btnNewClick(Sender: TObject);
begin
  frmSummaryTowedJammerDecoy := TfrmSummaryTowedJammerDecoy.Create(Self);
  try
    with frmSummaryTowedJammerDecoy do
    begin
      SelectedTowedJammerDecoy := TTowed_Jammer_Decoy_On_Board.Create;
      ShowModal;
      SelectedTowedJammerDecoy.Free;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryTowedJammerDecoy.Free;
  end;

  if FUpdateList then
    UpdateTowedJammerDecoyList;
end;

procedure TfrmAvailableTowedJammerDecoy.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableTowedJammerDecoy.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
begin
  if lstTowedJammerDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Towed Jammer Decoy... !');
    Exit;
  end;

  with FSelectedTowedJammerDecoy do
  begin
    newClassName := FDef.Towed_Decoy_Identifier + ' - Copy';

    count := dmTTT.GetTowedJammerDecoyDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FDef.Towed_Decoy_Identifier := newClassName;

    dmTTT.InsertTowedJammerDef(FDef);
    dmTTT.InsertNoteStorage(17, FDef.Towed_Decoy_Index, FNote);
  end;

  UpdateTowedJammerDecoyList;
end;

procedure TfrmAvailableTowedJammerDecoy.btnEditClick(Sender: TObject);
begin
  if lstTowedJammerDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Towed Jammer Decoy... !');
    Exit;
  end;

  frmSummaryTowedJammerDecoy := TfrmSummaryTowedJammerDecoy.Create(Self);
  try
    with frmSummaryTowedJammerDecoy do
    begin
      SelectedTowedJammerDecoy := FSelectedTowedJammerDecoy;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryTowedJammerDecoy.Free;
  end;

  if FUpdateList then
    UpdateTowedJammerDecoyList;
end;

procedure TfrmAvailableTowedJammerDecoy.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
begin
  if lstTowedJammerDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Towed Jammer Decoy... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedTowedJammerDecoy.FDef do
    begin
      if dmTTT.GetCountermeasure_On_Board_By_Index(7, Towed_Decoy_Index) then
      begin
        ShowMessage('Cannot delete, because is already in used by some Vehicles');
        Exit;
      end;

      dmTTT.DeleteNoteStorage(17, Towed_Decoy_Index);

      if dmTTT.DeleteTowedJammerDef(Towed_Decoy_Index) then
        ShowMessage('Data has been deleted');
    end;

    UpdateTowedJammerDecoyList;
  end;
end;

procedure TfrmAvailableTowedJammerDecoy.btnUsageClick(Sender: TObject);
begin
  if lstTowedJammerDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Towed Jammer Decoy... !');
    Exit;
  end;

   frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedTowedJammerDecoy.FDef.Towed_Decoy_Index;
      name_usage := FSelectedTowedJammerDecoy.FDef.Towed_Decoy_Identifier;
      usage_title := 'On Board Vehicle:';
      UIndex := 17;

    ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
  
end;

procedure TfrmAvailableTowedJammerDecoy.edttowedjammerdecoyKeyPress(Sender: TObject;
  var Key: Char);
  var
  i : Integer;
  towedjammerdecoy : TTowed_Jammer_Decoy_On_Board;
begin
  if Key = #13 then
  begin
  lstTowedJammerDecoy.Items.Clear;

  dmTTT.GetfilterTowedJammerDecoyDef(FTowedJammerDecoyList,edtCheat.Text);

    for i := 0 to FTowedJammerDecoyList.Count - 1 do
    begin
  towedjammerdecoy := FTowedJammerDecoyList.Items[i];
    lstTowedJammerDecoy.Items.AddObject(towedjammerdecoy.FDef.Towed_Decoy_Identifier, towedjammerdecoy);
    end;
  end;
end;
procedure TfrmAvailableTowedJammerDecoy.lbSingleClick(Sender: TObject);
begin
  if lstTowedJammerDecoy.ItemIndex = -1 then
    Exit;

  FSelectedTowedJammerDecoy := TTowed_Jammer_Decoy_On_Board(lstTowedJammerDecoy.Items.Objects[lstTowedJammerDecoy.ItemIndex]);
end;

procedure TfrmAvailableTowedJammerDecoy.UpdateTowedJammerDecoyList;
var
  i : Integer;
  towedjammerdecoy : TTowed_Jammer_Decoy_On_Board;
begin
  lstTowedJammerDecoy.Items.Clear;

  dmTTT.GetAllTowedJammerDecoyDef(FTowedJammerDecoyList);

  for i := 0 to FTowedJammerDecoyList.Count - 1 do
  begin
    towedjammerdecoy := FTowedJammerDecoyList.Items[i];
    lstTowedJammerDecoy.Items.AddObject(towedjammerdecoy.FDef.Towed_Decoy_Identifier, towedjammerdecoy);
  end;
end;

{$ENDREGION}

end.
