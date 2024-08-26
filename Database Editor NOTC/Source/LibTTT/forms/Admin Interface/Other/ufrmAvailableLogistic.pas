unit ufrmAvailableLogistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uDBAsset_Logistics, uDBAssetObject,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmAvailableLogistic = class(TForm)
    ImgBackground: TImage;
    Label2: TLabel;
    ImgBackgroungList: TImage;
    lbLogistic: TListBox;
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
    procedure edtloglistKeyPress(Sender: TObject; var Key: Char);

  private
    FUpdateList : Boolean;
    FLogisticList : TList;
    FSelectedLogistic : TLogistics;

    procedure UpdateLogisticList;
  end;

var
  frmAvailableLogistic: TfrmAvailableLogistic;

implementation

{$R *.dfm}

uses
  uDataModuleTTT, ufrmSummaryLogistic, ufrmUsage;

{$REGION ' Form Handle '}

procedure TfrmAvailableLogistic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmAvailableLogistic.FormCreate(Sender: TObject);
begin
  FLogisticList := TList.Create;
end;

procedure TfrmAvailableLogistic.FormShow(Sender: TObject);
begin
  UpdateLogisticList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableLogistic.btnNewClick(Sender: TObject);
begin
  frmSummaryLogistic := TfrmSummaryLogistic.Create(Self);
  try
    with frmSummaryLogistic do
    begin
      SelectedLogistic := TLogistics.Create;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryLogistic.Free;
  end;

  if FUpdateList then
    UpdateLogisticList;
end;

procedure TfrmAvailableLogistic.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableLogistic.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
begin
  if lbLogistic.ItemIndex = -1 then
  begin
    ShowMessage('Select Logistic Data... !');
    Exit;
  end;

  with FSelectedLogistic do
  begin
    newClassName := FData.Logistic_Identifier + ' - Copy';

    count := dmTTT.GetLogisticDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FData.Logistic_Identifier := newClassName;

    dmTTT.InsertLogisticDef(FData);
  end;

  UpdateLogisticList;
end;

procedure TfrmAvailableLogistic.btnEditClick(Sender: TObject);
begin
  if lbLogistic.ItemIndex = -1 then
  begin
    ShowMessage('Select Logistic Data... !');
    Exit;
  end;

  frmSummaryLogistic := TfrmSummaryLogistic.Create(Self);
  try
    with frmSummaryLogistic do
    begin
      SelectedLogistic := FSelectedLogistic;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryLogistic.Free;
  end;

  if FUpdateList then
    UpdateLogisticList;
end;

procedure TfrmAvailableLogistic.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList : TList;

begin
  if lbLogistic.ItemIndex = -1 then
  begin
    ShowMessage('Select Logistic Data ... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this Logistic data ?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    tempList := TList.Create;
    with FSelectedLogistic.FData do
    begin
      {Pengecekan Relasi Dengan Tabel Vehicle Definition}
      if dmTTT.GetLogisticAtVehicle(Logistic_Index,tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by Vehicle Definition');
        tempList.Destroy;
        Exit;
      end;
      tempList.Destroy;

      if dmTTT.DeleteLogisticDef(Logistic_Index) then
      begin
        ShowMessage('Data has been deleted');
      end;

    end;
  end;

  UpdateLogisticList;
end;

procedure TfrmAvailableLogistic.btnUsageClick(Sender: TObject);
begin
  if lbLogistic.ItemIndex = -1 then
  begin
    ShowMessage('Select Logistic Data... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedLogistic.FData.Logistic_Index;
      name_usage  := FSelectedLogistic.FData.Logistic_Identifier;
      UIndex  := 39;
      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
  
end;



procedure TfrmAvailableLogistic.edtloglistKeyPress(Sender: TObject;
  var Key: Char);
  var
   i : Integer;
logistic : TLogistics;
begin
  if Key = #13 then
  begin
    lbLogistic.Items.Clear;

    dmTTT.GetfilterLogisticDef(FLogisticList,edtCheat.Text);

    for i := 0 to FLogisticList.Count - 1 do
    begin
  logistic := TLogistics(FLogisticList.Items[i]);
    lbLogistic.Items.AddObject(logistic.FData.Logistic_Identifier, logistic);
    end;
  end;
end;

procedure TfrmAvailableLogistic.lbSingleClick(Sender: TObject);
begin
  if lbLogistic.ItemIndex = -1 then
    Exit;

  FSelectedLogistic := TLogistics(lbLogistic.Items.Objects[lbLogistic.ItemIndex]);
end;

procedure TfrmAvailableLogistic.UpdateLogisticList;
var
  i : Integer;
  logistic : TLogistics;
begin
  lbLogistic.Items.Clear;

  dmTTT.GetAllLogisticDef(FLogisticList);

  for i := 0 to FLogisticList.Count - 1 do
  begin
    logistic := TLogistics(FLogisticList.Items[i]);
    lbLogistic.Items.AddObject(logistic.FData.Logistic_Identifier, logistic);
  end;
end;

{$ENDREGION}

end.
