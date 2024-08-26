unit ufrmAvailableBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,Vcl.ExtCtrls,
  uDBAsset_Base;

type
  TfrmAvailableBase = class(TForm)
    lstBase: TListBox;
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

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtbaselistKeyPress(Sender: TObject; var Key: Char);
//    procedure edtbaselistChange(Sender: TObject);

  private
    FUpdateList : Boolean;
    FBaseList : TList;
    FSelectedBase : TBase;

    procedure UpdateBaseList;
  end;

var
  frmAvailableBase: TfrmAvailableBase;

implementation

uses
  uDataModuleTTT, ufrmSummaryBase, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableBase.FormCreate(Sender: TObject);
begin
  FBaseList := TList.Create;
end;

procedure TfrmAvailableBase.FormShow(Sender: TObject);
begin
  UpdateBaseList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableBase.btnNewClick(Sender: TObject);
begin
  frmSummaryBase := TfrmSummaryBase.Create(Self);
  try
    with frmSummaryBase do
    begin
      SelectedBase := TBase.Create;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryBase.Free;
  end;

  if FUpdateList then
    UpdateBaseList;
end;

procedure TfrmAvailableBase.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableBase.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
begin
  if lstBase.ItemIndex = -1 then
  begin
    ShowMessage('Select Base Data ... !');
    Exit;
  end;

  with FSelectedBase do
  begin
    newClassName := FData.Base_Identifier + ' - Copy';

    count := dmTTT.GetBaseDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FData.Base_Identifier := newClassName;

    dmTTT.InsertBaseDef(FData);
  end;

  UpdateBaseList;
end;

procedure TfrmAvailableBase.btnEditClick(Sender: TObject);
begin
  if lstBase.ItemIndex = -1 then
  begin
    ShowMessage('Select Base Data... !');
    Exit;
  end;

  frmSummaryBase := TfrmSummaryBase.Create(Self);
  try
    with frmSummaryBase do
    begin
      SelectedBase := FSelectedBase;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryBase.Free;
  end;

  if FUpdateList then
    UpdateBaseList;
end;

procedure TfrmAvailableBase.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList : TList;

begin
  if lstBase.ItemIndex = -1 then
  begin
    ShowMessage('Select Base Data ... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this Base Data ?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    tempList := TList.Create;
    with FSelectedBase.FData do
    begin
      {Pengecekan Relasi Dengan Tabel Resource Allocation}
      if dmTTT.GetBaseAtResourceAllocation(Base_Index,tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by Resource Allocation');
        tempList.Destroy;
        Exit;
      end;
      tempList.Destroy;

      if dmTTT.DeleteBaseDef(Base_Index) then
      begin
        ShowMessage('Data has been deleted');
      end;

    end;
  end;

  UpdateBaseList;
end;

procedure TfrmAvailableBase.btnUsageClick(Sender: TObject);
begin
  if lstBase.ItemIndex = -1 then
  begin
    ShowMessage('Select Base Data ... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedBase.FData.Base_Index;
      name_usage  := FSelectedBase.FData.Base_Identifier;
      UIndex  := 40;
      usage_title := 'Scenario :';
      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
  
end;



procedure TfrmAvailableBase.edtbaselistKeyPress(Sender: TObject; var Key: Char);

var
  i : Integer;
 base : Tbase;

begin
  if Key = #13 then
  begin
    lstBase.Items.Clear;

    dmTTT.GetfilterBaseDef(FBaseList,edtCheat.Text);

    for i := 0 to FBaseList.Count - 1 do
    begin
      base := FBaseList.Items[i];
      lstBase.Items.AddObject(base.FData.Base_Identifier, base);
    end;
  end;
end;

procedure TfrmAvailableBase.lbSingleClick(Sender: TObject);
begin
  if lstBase.ItemIndex = -1 then
    Exit;

  FSelectedBase := TBase(lstBase.Items.Objects[lstBase.ItemIndex]);
end;

procedure TfrmAvailableBase.UpdateBaseList;
var
  i : Integer;
  base : TBase;
begin
  lstBase.Items.Clear;

  dmTTT.GetAllBaseDef(FBaseList);

  for i := 0 to FBaseList.Count - 1 do
  begin
    base := FBaseList.Items[i];
    lstBase.Items.AddObject(base.FData.Base_Identifier, base);
  end;
end;

{$ENDREGION}


end.
