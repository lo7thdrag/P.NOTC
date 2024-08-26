unit ufrmAvailableESM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uSimContainers,
  uDBAsset_Sensor;

type
  TfrmAvailableESM = class(TForm)
    lbESM: TListBox;
    Image1: TImage;
    Label2: TLabel;
    Image5: TImage;
    Image3: TImage;
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
    FESMList : TList;
    FSelectedESM : TESM_On_Board;

    procedure UpdateESMList;
  end;

var
  frmAvailableESM: TfrmAvailableESM;

implementation

uses
  uDataModuleTTT, ufrmSummaryESM, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableESM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FESMList);
  Action := cafree;
end;

procedure TfrmAvailableESM.FormCreate(Sender: TObject);
begin
  FESMList := Tlist.Create;
end;

procedure TfrmAvailableESM.FormShow(Sender: TObject);
begin
  UpdateESMList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableESM.btnNewClick(Sender: TObject);
begin
  frmSummaryESM := TfrmSummaryESM.Create(Self);
  try
    with frmSummaryESM do
    begin
      SelectedESM := TESM_On_Board.Create;
      ShowModal;
      SelectedESM.Free;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryESM.Free;
  end;

  if FUpdateList then
    UpdateESMList;
end;

procedure TfrmAvailableESM.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
begin
  if lbESM.ItemIndex = -1 then
  begin
    ShowMessage('Select ESM... !');
    Exit;
  end;

  with FSelectedESM do
  begin
    newClassName := FESM_Def.Class_Identifier + ' - Copy';

    count := dmTTT.GetESMDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FESM_Def.Class_Identifier := newClassName;

    dmTTT.InsertESMDef(FESM_Def);
    dmTTT.InsertNoteStorage(10, FESM_Def.ESM_Index, FNote);
  end;

  UpdateESMList;
end;

procedure TfrmAvailableESM.btnEditClick(Sender: TObject);
begin
  if lbESM.ItemIndex = -1 then
  begin
    ShowMessage('Select ESM... !');
    Exit;
  end;

  frmSummaryESM := TfrmSummaryESM.Create(Self);
  try
    with frmSummaryESM do
    begin
      SelectedESM := FSelectedESM;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryESM.Free;
  end;

  if FUpdateList then
    UpdateESMList;
end;

procedure TfrmAvailableESM.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
begin
  if lbESM.ItemIndex = -1 then
  begin
    ShowMessage('Select ESM... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedESM.FESM_Def do
    begin

      {Pengecekan Relasi Dengan Tabel On Board}
      if dmTTT.GetSensor_On_Board_By_Index(3, ESM_Index) then
      begin
        ShowMessage('Cannot delete, because is already in used by some vehicles');
        Exit;
      end;

      dmTTT.DeleteNoteStorage(10, ESM_Index);

      if dmTTT.DeleteESMDef(ESM_Index) then
        ShowMessage('Data has been deleted');

    end;

    UpdateESMList;
  end;
end;

procedure TfrmAvailableESM.btnUsageClick(Sender: TObject);
begin
  if lbESM.ItemIndex = -1 then
  begin
    ShowMessage('Select ESM... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedESM.FESM_Def.ESM_Index;
      name_usage := FSelectedESM.FESM_Def.Class_Identifier;
      UIndex := 3;
      usage_title := 'On Board Vehicle:';
      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
 
end;

procedure TfrmAvailableESM.edtCheatKeyPress(Sender: TObject; var Key: Char);
  var
  i : Integer;
  esm : TESM_On_Board;
begin
  if Key = #13 then
  begin

  lbESM.Items.Clear;
//
  dmTTT.GetfilterESMDef(FESMList,edtCheat.Text);
    for i := 0 to FESMList.Count - 1 do
    begin
  esm := FESMList.Items[i];
    lbESM.Items.AddObject(esm.FESM_Def.Class_Identifier, esm);
    end;
  end;
end;

procedure TfrmAvailableESM.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAvailableESM.lbSingleClick(Sender: TObject);
begin
  if lbESM.ItemIndex = -1 then
    Exit;

  FSelectedESM := TESM_On_Board(lbESM.Items.Objects[lbESM.ItemIndex]);
end;

procedure TfrmAvailableESM.UpdateESMList;
var
  i : Integer;
  esm : TESM_On_Board;
begin
  lbESM.Items.Clear;

  dmTTT.GetAllESMDef(FESMList);

  for i := 0 to FESMList.Count - 1 do
  begin
    esm := FESMList.Items[i];
    lbESM.Items.AddObject(esm.FESM_Def.Class_Identifier, esm);
  end;
end;

{$ENDREGION}

end.
