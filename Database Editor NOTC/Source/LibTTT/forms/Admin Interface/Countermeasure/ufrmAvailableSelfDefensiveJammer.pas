unit ufrmAvailableSelfDefensiveJammer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uSimContainers,
  uDBAsset_Countermeasure;

type
  TfrmAvailableSelfDefensiveJammer = class(TForm)
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    lstSelfDefensiveJammer: TListBox;
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
    procedure edtselfdefensivejammerKeyPress(Sender: TObject; var Key: Char);


  private
    FUpdateList : Boolean;
    FSelfDefensiveJammerList : TList;
    FSelectedSelfDefensiveJammer : TDefensive_Jammer_On_Board;

    procedure UpdateSelfDefensiveJammerList;

   end;

var
  frmAvailableSelfDefensiveJammer: TfrmAvailableSelfDefensiveJammer;

implementation

uses
  uDataModuleTTT, ufrmSummarySelfDefensiveJammer, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableSelfDefensiveJammer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FSelfDefensiveJammerList);
  Action := cafree;
end;

procedure TfrmAvailableSelfDefensiveJammer.FormCreate(Sender: TObject);
begin
  FSelfDefensiveJammerList := TList.Create;
end;

procedure TfrmAvailableSelfDefensiveJammer.FormShow(Sender: TObject);
begin
  UpdateSelfDefensiveJammerList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableSelfDefensiveJammer.btnNewClick(Sender: TObject);
begin
  frmSummarySelfDefensiveJammer := TfrmSummarySelfDefensiveJammer.Create(Self);
  try
    with frmSummarySelfDefensiveJammer do
    begin
      SelectedDefensiveJammer := TDefensive_Jammer_On_Board.Create;
      ShowModal;
      SelectedDefensiveJammer.Free;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummarySelfDefensiveJammer.Free;
  end;

  if FUpdateList then
    UpdateSelfDefensiveJammerList;
end;

procedure TfrmAvailableSelfDefensiveJammer.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableSelfDefensiveJammer.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;

begin
  if lstSelfDefensiveJammer.ItemIndex = -1 then
  begin
    ShowMessage('Select Self Defensive Jammer... !');
    Exit;
  end;

  with FSelectedSelfDefensiveJammer do
  begin
    newClassName := FDefensiveJammer_Def.Defensive_Jammer_Identifier + ' - Copy';

    count := dmTTT.GetSelfDefensiveJammerDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FDefensiveJammer_Def.Defensive_Jammer_Identifier := newClassName;

    dmTTT.InsertSelfDefensiveJammerDef(FDefensiveJammer_Def);
    dmTTT.InsertNoteStorage(16, FDefensiveJammer_Def.Defensive_Jammer_Index, FNote);
  end;

  UpdateSelfDefensiveJammerList;
end;

procedure TfrmAvailableSelfDefensiveJammer.btnEditClick(Sender: TObject);
begin
  if lstSelfDefensiveJammer.ItemIndex = -1 then
  begin
    ShowMessage('Select Self Defensive Jammer... !');
    Exit;
  end;

  frmSummarySelfDefensiveJammer := TfrmSummarySelfDefensiveJammer.Create(Self);
  try
    with frmSummarySelfDefensiveJammer do
    begin
      SelectedDefensiveJammer := FSelectedSelfDefensiveJammer;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummarySelfDefensiveJammer.Free;
  end;

  if FUpdateList then
    UpdateSelfDefensiveJammerList;
end;

procedure TfrmAvailableSelfDefensiveJammer.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
begin
  if lstSelfDefensiveJammer.ItemIndex = -1 then
  begin
    ShowMessage('Select Infrared Decoy... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedSelfDefensiveJammer.FDefensiveJammer_Def do
    begin
      if dmTTT.GetCountermeasure_On_Board_By_Index(6, Defensive_Jammer_Index) then
      begin
        ShowMessage('Cannot delete, because is already in used by some Vehicles');
        Exit;
      end;

      dmTTT.DeleteNoteStorage(16, Defensive_Jammer_Index);

      if dmTTT.DeleteSelfDefensiveJammerDef(Defensive_Jammer_Index) then
        ShowMessage('Data has been deleted');
    end;

    UpdateSelfDefensiveJammerList;
  end;
end;

procedure TfrmAvailableSelfDefensiveJammer.btnUsageClick(Sender: TObject);
begin
  if lstSelfDefensiveJammer.ItemIndex = -1 then
  begin
    ShowMessage('Select Self Defensive Jammer... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedSelfDefensiveJammer.FDefensiveJammer_Def.Defensive_Jammer_Index;
    name_usage := FSelectedSelfDefensiveJammer.FDefensiveJammer_Def.Defensive_Jammer_Identifier;
    usage_title := 'On Board Vehicle:';
    UIndex := 16;

    ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
  
end;

procedure TfrmAvailableSelfDefensiveJammer.edtselfdefensivejammerKeyPress(
  Sender: TObject; var Key: Char);
 var
  i : Integer;
  selfdefensivejammer : TDefensive_Jammer_On_Board;
begin
  if Key = #13 then
  begin
  lstSelfDefensiveJammer.Items.Clear;

  dmTTT.GetfilterSelfDefensiveJammerDef(FSelfDefensiveJammerList,edtCheat.Text);

    for i := 0 to FSelfDefensiveJammerList.Count - 1 do
    begin
    selfdefensivejammer := FSelfDefensiveJammerList.Items[i];
    lstSelfDefensiveJammer.Items.AddObject(selfdefensivejammer.FDefensiveJammer_Def.Defensive_Jammer_Identifier, selfdefensivejammer);
    end;
  end;
end;

procedure TfrmAvailableSelfDefensiveJammer.lbSingleClick(Sender: TObject);
begin
  if lstSelfDefensiveJammer.ItemIndex = -1 then
    Exit;

  FSelectedSelfDefensiveJammer := TDefensive_Jammer_On_Board(lstSelfDefensiveJammer.Items.Objects[lstSelfDefensiveJammer.ItemIndex]);
end;

procedure TfrmAvailableSelfDefensiveJammer.UpdateSelfDefensiveJammerList;
var
  i : Integer;
  selfdefensivejammer : TDefensive_Jammer_On_Board;
begin
  lstSelfDefensiveJammer.Items.Clear;

  dmTTT.GetAllSelfDefensiveJammerDef(FSelfDefensiveJammerList);

  for i := 0 to FSelfDefensiveJammerList.Count - 1 do
  begin
    selfdefensivejammer := FSelfDefensiveJammerList.Items[i];
    lstSelfDefensiveJammer.Items.AddObject(selfdefensivejammer.FDefensiveJammer_Def.Defensive_Jammer_Identifier, selfdefensivejammer);
  end;
end;

{$ENDREGION}

end.
