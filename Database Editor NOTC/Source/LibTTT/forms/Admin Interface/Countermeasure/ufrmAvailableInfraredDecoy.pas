unit ufrmAvailableInfraredDecoy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, uSimContainers,
  Vcl.ExtCtrls, uDBAsset_Countermeasure;

type
  TfrmAvailableInfraredDecoy = class(TForm)
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    lstInfraredDecoy: TListBox;
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
    procedure edtinfrareddecoyKeyPress(Sender: TObject; var Key: Char);


  private
    FUpdateList : Boolean;
    FInfraredDecoyList : TList;
    FSelectedInfraredDecoy : TInfrared_Decoy_On_Board;

    procedure UpdateInfraredDecoyList;

   end;

var
  frmAvailableInfraredDecoy: TfrmAvailableInfraredDecoy;

implementation

uses
  uDataModuleTTT, ufrmSummaryInfraredDecoy, ufrmUsage;
{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableInfraredDecoy.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FInfraredDecoyList);
  Action := cafree;
end;

procedure TfrmAvailableInfraredDecoy.FormCreate(Sender: TObject);
begin
  FInfraredDecoyList := TList.Create;
end;

procedure TfrmAvailableInfraredDecoy.FormShow(Sender: TObject);
begin
  UpdateInfraredDecoyList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableInfraredDecoy.btnNewClick(Sender: TObject);
begin
  frmSummaryInfraredDecoy := TfrmSummaryInfraredDecoy.Create(Self);
  try
    with frmSummaryInfraredDecoy do
    begin
      SelectedInfraredDecoy := TInfrared_Decoy_On_Board.Create;
      ShowModal;
      SelectedInfraredDecoy.Free;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryInfraredDecoy.Free;
  end;

  if FUpdateList then
    UpdateInfraredDecoyList;
end;

procedure TfrmAvailableInfraredDecoy.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableInfraredDecoy.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;

begin
  if lstInfraredDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Infrared Decoy... !');
    Exit;
  end;

  with FSelectedInfraredDecoy do
  begin
    newClassName := FInfraredDecoy_Def.Infrared_Decoy_Identifier + ' - Copy';

    count := dmTTT.GetInfraredDecoyDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FInfraredDecoy_Def.Infrared_Decoy_Identifier := newClassName;

    dmTTT.InsertInfraredDecoyDef(FInfraredDecoy_Def);
    dmTTT.InsertNoteStorage(23, FInfraredDecoy_Def.Infrared_Decoy_Index, FNote);
  end;

  UpdateInfraredDecoyList;
end;

procedure TfrmAvailableInfraredDecoy.btnEditClick(Sender: TObject);
begin
  if lstInfraredDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Infrared Decoy... !');
    Exit;
  end;

  frmSummaryInfraredDecoy := TfrmSummaryInfraredDecoy.Create(Self);
  try
    with frmSummaryInfraredDecoy do
    begin
      SelectedInfraredDecoy := FSelectedInfraredDecoy;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryInfraredDecoy.Free;
  end;

  if FUpdateList then
    UpdateInfraredDecoyList;
end;

procedure TfrmAvailableInfraredDecoy.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
begin
  if lstInfraredDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Infrared Decoy... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedInfraredDecoy.FInfraredDecoy_Def do
    begin
      if dmTTT.GetCountermeasure_On_Board_By_Index(4, Infrared_Decoy_Index) then
      begin
        ShowMessage('Cannot delete, because is already in used by some Vehicles');
        Exit;
      end;

      dmTTT.DeleteNoteStorage(23, Infrared_Decoy_Index);

      if dmTTT.DeleteInfraredDecoyDef(Infrared_Decoy_Index) then
        ShowMessage('Data has been deleted');
    end;

    UpdateInfraredDecoyList;
  end;
end;

procedure TfrmAvailableInfraredDecoy.btnUsageClick(Sender: TObject);
begin
  if lstInfraredDecoy.ItemIndex = -1 then
  begin
    ShowMessage('Select Infrared Decoy... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedInfraredDecoy.FInfraredDecoy_Def.Infrared_Decoy_Index;
      name_usage := FSelectedInfraredDecoy.FInfraredDecoy_Def.Infrared_Decoy_Identifier;
      usage_title := 'On Board Vehicle:';
      UIndex := 19;

      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;

end;

procedure TfrmAvailableInfraredDecoy.edtinfrareddecoyKeyPress(Sender: TObject;
  var Key: Char);
 var
  i : Integer;
  infrareddecoy : TInfrared_Decoy_On_Board;
begin
  if Key = #13 then
  begin
  lstInfraredDecoy.Items.Clear;

  dmTTT.GetfilterInfraredDecoyDef(FInfraredDecoyList,edtCheat.Text);

    for i := 0 to FInfraredDecoyList.Count - 1 do
    begin
      infrareddecoy := FInfraredDecoyList.Items[i];
    lstInfraredDecoy.Items.AddObject(infrareddecoy.FInfraredDecoy_Def.Infrared_Decoy_Identifier, infrareddecoy);
  end;
end;
end;

procedure TfrmAvailableInfraredDecoy.lbSingleClick(Sender: TObject);
begin
  if lstInfraredDecoy.ItemIndex = -1 then
    Exit;

  FSelectedInfraredDecoy := TInfrared_Decoy_On_Board(lstInfraredDecoy.Items.Objects[lstInfraredDecoy.ItemIndex]);
end;

procedure TfrmAvailableInfraredDecoy.UpdateInfraredDecoyList;
var
  i : Integer;
  infrareddecoy : TInfrared_Decoy_On_Board;
begin
  lstInfraredDecoy.Items.Clear;

  dmTTT.GetAllInfraredDecoyDef(FInfraredDecoyList);

  for i := 0 to FInfraredDecoyList.Count - 1 do
  begin
    infrareddecoy := FInfraredDecoyList.Items[i];
    lstInfraredDecoy.Items.AddObject(infrareddecoy.FInfraredDecoy_Def.Infrared_Decoy_Identifier, infrareddecoy);
  end;
end;

{$ENDREGION}

end.
