unit ufrmAvailableTransport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uDBAsset_Transport;

type
  TfrmAvailableTransport = class(TForm)
    lstTransport: TListBox;
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
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
    procedure edttransportlistKeyPress(Sender: TObject; var Key: Char);


  private
    FUpdateList : Boolean;
    FTransportList : TList;
    FSelectedTransport : TTransport;

    procedure UpdateTransportList;
  public
    { Public declarations }
  end;

var
  frmAvailableTransport: TfrmAvailableTransport;

implementation

uses
  uDataModuleTTT, ufrmSummaryTransport, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableTransport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmAvailableTransport.FormCreate(Sender: TObject);
begin
  FTransportList := TList.Create;
end;

procedure TfrmAvailableTransport.FormShow(Sender: TObject);
begin
  UpdateTransportList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableTransport.btnNewClick(Sender: TObject);
begin
  frmSummaryTransport := TfrmSummaryTransport.Create(Self);
  try
    with frmSummaryTransport do
    begin
      SelectedTransport := TTransport.Create;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryTransport.Free;
  end;

  if FUpdateList then
    UpdateTransportList;
end;

procedure TfrmAvailableTransport.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAvailableTransport.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
begin
  if lstTransport.ItemIndex = -1 then
  begin
    ShowMessage('Select Transport Data ... !');
    Exit;
  end;

  with FSelectedTransport do
  begin
    newClassName := FData.Transport_Identifier + ' - Copy';

    count := dmTTT.GetTransportDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FData.Transport_Identifier := newClassName;

    dmTTT.InsertTransportDef(FData);
  end;

  UpdateTransportList;
end;

procedure TfrmAvailableTransport.btnEditClick(Sender: TObject);
begin
  if lstTransport.ItemIndex = -1 then
  begin
    ShowMessage('Select Transport Data ... !');
    Exit;
  end;

  frmSummaryTransport := TfrmSummaryTransport.Create(Self);
  try
    with frmSummaryTransport do
    begin
      SelectedTransport := FSelectedTransport;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryTransport.Free;
  end;

  if FUpdateList then
    UpdateTransportList;
end;

procedure TfrmAvailableTransport.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList: TList;

begin
  if lstTransport.ItemIndex = -1 then
  begin
    ShowMessage('Select Transport Data ... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this Transport Data ?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedTransport.FData do
    begin
      tempList := TList.Create;

      {Pengecekan Relasi Dengan Tabel Vehicle Definition}
      if dmTTT.GetTransportAtVehicle(Transport_Index,tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by Vehicle Definition');
        tempList.Destroy;
        Exit;
      end;
      tempList.Destroy;

      if dmTTT.DeleteTransportDef(Transport_Index) then
      begin
        ShowMessage('Data has been deleted');
      end;

    end;

    UpdateTransportList;
  end;
end;

procedure TfrmAvailableTransport.btnUsageClick(Sender: TObject);
begin
  if lstTransport.ItemIndex = -1 then
  begin
    ShowMessage('Select Transport Data ... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedTransport.FData.Transport_Index;
      name_usage := FSelectedTransport.FData.Transport_Identifier;
      UIndex := 42;

      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
  
end;

procedure TfrmAvailableTransport.edttransportlistKeyPress(Sender: TObject;
  var Key: Char);

  var
  i : Integer;
 transport: TTransport;
begin
  if Key = #13 then
  begin


   lstTransport.Items.Clear;

  dmTTT.GetfilterTransportDef(FTransportList,edtCheat.Text);
    for i := 0 to FTransportList.Count - 1 do
    begin
  transport := FTransportList.Items[i];
    lstTransport.Items.AddObject(Transport.FData.Transport_Identifier, transport);
    end;
  end;
end;

procedure TfrmAvailableTransport.lbSingleClick(Sender: TObject);
begin
  if lstTransport.ItemIndex = -1 then
    Exit;
  FSelectedTransport := TTransport(lstTransport.Items.Objects[lstTransport.ItemIndex]);
end;

procedure TfrmAvailableTransport.UpdateTransportList;
var
  i : Integer;
 transport: TTransport;

begin
  lstTransport.Items.Clear;

  dmTTT.GetAllTransportDef(FTransportList);

  for i := 0 to FTransportList.Count - 1 do
  begin
    transport := FTransportList.Items[i];
    lstTransport.Items.AddObject(Transport.FData.Transport_Identifier, transport);
  end;
end;

{$ENDREGION}

end.
