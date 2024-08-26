unit ufrmAvailableSNRvsPOD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uSimContainers, newClassASTT;

type
  TfrmAvailableSNRvsPOD = class(TForm)
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    lstSNRvsPOD: TListBox;
    Image1: TImage;
    lbl_search: TLabel;
    edtCheat: TEdit;
    btnNew: TImage;
    btnCopy: TImage;
    btnEdit: TImage;
    btnUsage: TImage;
    btnDelete: TImage;
    imgImgBtnBack: TImage;

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
    procedure edtsnrpodlistKeyPress(Sender: TObject; var Key: Char);

  private
    FUpdateList : Boolean;
    FSNRvsPODList : TList;
    FSelectedSNRvsPOD : TPOD_vs_SNR_Curve_Definition;

    procedure UpdateSNRvsPODList;
    procedure CopyPODvsSNRPoint(const aDefaultIndex, aNewDefaultIndex: Integer);
  end;

var
  frmAvailableSNRvsPOD: TfrmAvailableSNRvsPOD;

implementation

uses
  uDataModuleTTT, ufrmSummarySnrVsPod, ufrmUsage;
{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableSNRvsPOD.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FSNRvsPODList);
  Action := cafree;
end;

procedure TfrmAvailableSNRvsPOD.FormCreate(Sender: TObject);
begin
  FSNRvsPODList := TList.Create;
end;

procedure TfrmAvailableSNRvsPOD.FormShow(Sender: TObject);
begin
  UpdateSNRvsPODList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableSNRvsPOD.btnNewClick(Sender: TObject);
begin
  frmSummarySnrVsPod := TfrmSummarySnrVsPod.Create(Self);
  try
    with frmSummarySnrVsPod do
    begin
      SelectedSNRvsPOD := TPOD_vs_SNR_Curve_Definition.Create;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummarySnrVsPod.Free;
  end;

  if FUpdateList then
    UpdateSNRvsPODList;
end;

procedure TfrmAvailableSNRvsPOD.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count, parentIndex : Integer;
begin
  if lstSNRvsPOD.ItemIndex = -1 then
  begin
    ShowMessage('Select SNRvsPOD Data... !');
    Exit;
  end;

  with FSelectedSNRvsPOD do
  begin
    parentIndex := FData.Curve_Definition_Index;
    newClassName := FData.Curve_Definition_Identifier + ' - Copy';

    count := dmTTT.GetPODvsSNRCurveDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FData.Curve_Definition_Identifier := newClassName;

    dmTTT.InsertPODvsSNRCurveDef(FData);
    CopyPODvsSNRPoint(parentIndex, FData.Curve_Definition_Index);
  end;

  UpdateSNRvsPODList;
end;

procedure TfrmAvailableSNRvsPOD.btnEditClick(Sender: TObject);
begin
  if lstSNRvsPOD.ItemIndex = -1 then
  begin
    ShowMessage('Select SNRvsPOD Data... !');
    Exit;
  end;

  frmSummarySnrVsPod := TfrmSummarySnrVsPod.Create(Self);
  try
    with frmSummarySnrVsPod do
    begin
      SelectedSNRvsPOD := FSelectedSNRvsPOD;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummarySnrVsPod.Free;
  end;

  if FUpdateList then
    UpdateSNRvsPODList;
end;

procedure TfrmAvailableSNRvsPOD.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList: TList;

begin
  if lstSNRvsPOD.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedSNRvsPOD.FData do
    begin
      tempList := TList.Create;

      if dmTTT.GetRadarByPOD_vs_SNR(Curve_Definition_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already used by some Radar Definition');
        tempList.Free;
        Exit;
      end;

      if dmTTT.GetSonarByPOD_vs_SNR(Curve_Definition_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already used by some Sonar Definition');
        tempList.Free;
        Exit;
      end;
      tempList.Free;

      dmTTT.DeletePODvsSNRCurvePoint(1, Curve_Definition_Index);

      if dmTTT.DeletePODvsSNRCurveDef(Curve_Definition_Index) then
        ShowMessage('Data has been deleted');

    end;

    UpdateSNRvsPODList;
  end;
end;

procedure TfrmAvailableSNRvsPOD.btnUsageClick(Sender: TObject);
begin
  if lstSNRvsPOD.ItemIndex = -1 then
  begin
    ShowMessage('Select SNRvsPOD Data... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedSNRvsPOD.FData.Curve_Definition_Index;
      name_usage := FSelectedSNRvsPOD.FData.Curve_Definition_Identifier;
      UIndex := 38;

      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
  
end;

procedure TfrmAvailableSNRvsPOD.CopyPODvsSNRPoint(const aDefaultIndex, aNewDefaultIndex: Integer);
var
  PODvsSNRPointList : TList;
  i : Integer;
  PODvsSNRPoint : TPOD_vs_SNR_Point;
begin
  PODvsSNRPointList := TList.Create;

  dmTTT.GetPODvsSNRCurvePoint(aDefaultIndex, PODvsSNRPointList);

  for i := 0 to PODvsSNRPointList.Count - 1 do
  begin
    PODvsSNRPoint := PODvsSNRPointList.Items[i];

    with PODvsSNRPoint do
    begin
      FData.Curve_Definition_Index := aNewDefaultIndex;

      dmTTT.InsertPODvsSNRCurvePoint(FData);
    end;
  end;

  for i := 0 to PODvsSNRPointList.Count - 1 do
  begin
    PODvsSNRPoint := PODvsSNRPointList.Items[i];
    PODvsSNRPoint.Free;
  end;

  PODvsSNRPointList.Free;
end;

procedure TfrmAvailableSNRvsPOD.edtsnrpodlistKeyPress(Sender: TObject;
  var Key: Char);
  var
  i : Integer;
  snrvspod : TPOD_vs_SNR_Curve_Definition;
begin
  if Key = #13 then
  begin


   lstSNRvsPOD.Items.Clear;

    dmTTT.GetfilterPODvsSNRCurveDef(FSNRvsPODList,edtCheat.text);
    for i := 0 to FSNRvsPODList.Count - 1 do
    begin
   snrvspod := FSNRvsPODList.Items[i];
    lstSNRvsPOD.Items.AddObject(snrvspod.FData.Curve_Definition_Identifier, snrvspod);
    end;
  end;
end;

procedure TfrmAvailableSNRvsPOD.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAvailableSNRvsPOD.lbSingleClick(Sender: TObject);
begin
  if lstSNRvsPOD.ItemIndex = -1 then
    Exit;
  FSelectedSNRvsPOD := TPOD_vs_SNR_Curve_Definition(lstSNRvsPOD.Items.Objects[lstSNRvsPOD.ItemIndex]);
end;

procedure TfrmAvailableSNRvsPOD.UpdateSNRvsPODList;
var
  i : Integer;
  snrvspod : TPOD_vs_SNR_Curve_Definition;

begin
  lstSNRvsPOD.Items.Clear;

  dmTTT.GetAllPODvsSNRCurveDef(FSNRvsPODList);

  for i := 0 to FSNRvsPODList.Count - 1 do
  begin
    snrvspod := FSNRvsPODList.Items[i];
    lstSNRvsPOD.Items.AddObject(snrvspod.FData.Curve_Definition_Identifier, snrvspod);
  end;
end;

{$ENDREGION}

end.
