unit ufrmAvailableChaff;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uSimContainers,
  uDBAsset_Countermeasure;

type
  TfrmAvailableChaff = class(TForm)
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    lstChaff: TListBox;
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
    procedure edtchafflistKeyPress(Sender: TObject; var Key: Char);


  private
    FUpdateList : Boolean;
    FChaffList : TList;
    FSelectedChaff : TChaff_On_Board;

    procedure UpdateChaffList;

  end;

var
  frmAvailableChaff: TfrmAvailableChaff;

implementation

uses
  uDataModuleTTT, ufrmSummaryChaff, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableChaff.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FChaffList);
  Action := cafree;
end;

procedure TfrmAvailableChaff.FormCreate(Sender: TObject);
begin
  FChaffList := TList.Create;
end;

procedure TfrmAvailableChaff.FormShow(Sender: TObject);
begin
  UpdateChaffList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableChaff.btnNewClick(Sender: TObject);
begin
  frmSummaryChaff := TfrmSummaryChaff.Create(Self);
  try
    with frmSummaryChaff do
    begin
      SelectedChaff := TChaff_On_Board.Create;
      ShowModal;
      SelectedChaff.Free;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryChaff.Free;
  end;

  if FUpdateList then
    UpdateChaffList;
end;

procedure TfrmAvailableChaff.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableChaff.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;

begin
  if lstChaff.ItemIndex = -1 then
  begin
    ShowMessage('Select Chaff... !');
    Exit;
  end;

  with FSelectedChaff do
  begin
    newClassName := FChaff_Def.Chaff_Identifier + ' - Copy';

    count := dmTTT.GetChaffDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FChaff_Def.Chaff_Identifier := newClassName;

    dmTTT.InsertChaffDef(FChaff_Def);
    dmTTT.InsertNoteStorage(19, FChaff_Def.Chaff_Index, FNote);
  end;

  UpdateChaffList;
end;

procedure TfrmAvailableChaff.btnEditClick(Sender: TObject);
begin
  if lstChaff.ItemIndex = -1 then
  begin
    ShowMessage('Select Chaff... !');
    Exit;
  end;

  frmSummaryChaff := TfrmSummaryChaff.Create(Self);
  try
    with frmSummaryChaff do
    begin
      SelectedChaff := FSelectedChaff;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryChaff.Free;
  end;

  if FUpdateList then
    UpdateChaffList;
end;

procedure TfrmAvailableChaff.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
begin
  if lstChaff.ItemIndex = -1 then
  begin
    ShowMessage('Select Chaff... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedChaff.FChaff_Def do
    begin
      if dmTTT.GetCountermeasure_On_Board_By_Index(3, Chaff_Index) then
      begin
        ShowMessage('Cannot delete, because is already in used by some Vehicles');
        Exit;
      end;

      dmTTT.DeleteNoteStorage(19, Chaff_Index);

      if dmTTT.DeleteChaffDef(Chaff_Index) then
        ShowMessage('Data has been deleted');

    end;

    UpdateChaffList;
  end;
end;

procedure TfrmAvailableChaff.btnUsageClick(Sender: TObject);
begin
  if lstChaff.ItemIndex = -1 then
  begin
    ShowMessage('Select Chaff... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedChaff.FChaff_Def.Chaff_Index;
      name_usage := FSelectedChaff.FChaff_Def.Chaff_Identifier;
      usage_title := 'On Board Vehicle:';
      UIndex := 14;

      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;

end;

procedure TfrmAvailableChaff.edtchafflistKeyPress(Sender: TObject;
  var Key: Char);
 var
  i : Integer;
  chaff : TChaff_On_Board;
begin
  if Key = #13 then
  begin
  lstChaff.Items.Clear;

  dmTTT.GetfilterChaffDef(FChaffList,edtCheat.Text);

    for i := 0 to FChaffList.Count - 1 do
    begin
   chaff := FChaffList.Items[i];
    lstChaff.Items.AddObject(chaff.FChaff_Def.Chaff_Identifier, chaff);
  end;
end;
end;

procedure TfrmAvailableChaff.lbSingleClick(Sender: TObject);
begin
  if lstChaff.ItemIndex = -1 then
    Exit;

  FSelectedChaff := TChaff_On_Board(lstChaff.Items.Objects[lstChaff.ItemIndex]);
end;

procedure TfrmAvailableChaff.UpdateChaffList;
var
  i : Integer;
  chaff : TChaff_On_Board;
begin
  lstChaff.Items.Clear;

  dmTTT.GetAllChaffDef(FChaffList);

  for i := 0 to FChaffList.Count - 1 do
  begin
    chaff := FChaffList.Items[i];
    lstChaff.Items.AddObject(chaff.FChaff_Def.Chaff_Identifier, chaff);
  end;
end;

{$ENDREGION}

end.
