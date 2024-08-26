unit ufrmAvailableOverlay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, newClassASTT, System.IOUtils;

type
  TfrmAvailableOverlay = class(TForm)
    lstOverlay: TListBox;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtoverlaylistKeyPress(Sender: TObject; var Key: Char);

  private
    FUpdateList : Boolean;
    FOverlayList : TList;
    FSelectedOverlay : TOverlay_Definition;

    procedure UpdateOverlayList;

  end;

var
  frmAvailableOverlay: TfrmAvailableOverlay;

implementation

uses
  uDataModuleTTT, ufrmSummaryOverlay, ufrmUsage, uDBEditSetting;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableOverlay.FormActivate(Sender: TObject);
begin
//  WindowState := wsMaximized;
end;

procedure TfrmAvailableOverlay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmAvailableOverlay.FormCreate(Sender: TObject);
begin
  FOverlayList := TList.Create;
end;

procedure TfrmAvailableOverlay.FormShow(Sender: TObject);
begin
  UpdateOverlayList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableOverlay.btnNewClick(Sender: TObject);
begin
  frmSummaryOverlay := TfrmSummaryOverlay.Create(Self);
  try
    with frmSummaryOverlay do
    begin
      SelectedOverlay := TOverlay_Definition.Create;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryOverlay.Free;
  end;

  if FUpdateList then
    UpdateOverlayList;
end;

procedure TfrmAvailableOverlay.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableOverlay.btnCopyClick(Sender: TObject);
var
  SourcePath, TargetPath : string;
  oldOverlayName, newOverlayName : string;
  count : Integer;
begin
  if lstOverlay.ItemIndex = -1 then
  begin
    ShowMessage('Select Overlay... !');
    Exit;
  end;

  with FSelectedOverlay do
  begin
    oldOverlayName := FData.Overlay_Identifier;
    newOverlayName := FData.Overlay_Identifier + ' - Copy';

    count := dmTTT.GetOverlayDef(newOverlayName);

    if count > 0 then
      newOverlayName := newOverlayName + ' (' + IntToStr(count + 1) + ')';

    FData.Overlay_Identifier := newOverlayName;
    FData.Name := newOverlayName;

    dmTTT.InsertOverlayDef(FData);

    {$REGION ' Copy file Overlay '}
    SourcePath := vAppDBSetting.OverlayPath + '\'+ oldOverlayName + '.dat' ;
    TargetPath := vAppDBSetting.OverlayPath + '\'+ newOverlayName + '.dat' ;

    CopyFile(PChar(SourcePath), PChar(TargetPath), True);
    {$ENDREGION}

  end;

  UpdateOverlayList;
end;

procedure TfrmAvailableOverlay.btnEditClick(Sender: TObject);
begin
  if lstOverlay.ItemIndex = -1 then
  begin
    ShowMessage('Select Overlay... !');
    Exit;
  end;

  frmSummaryOverlay := TfrmSummaryOverlay.Create(Self);
  try
    with frmSummaryOverlay do
    begin
      SelectedOverlay := FSelectedOverlay;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryOverlay.Free;
  end;

  if FUpdateList then
    UpdateOverlayList;
end;

procedure TfrmAvailableOverlay.btnDeleteClick(Sender: TObject);
var
  warning, i : Integer;
  tempList : TList;
begin
  if lstOverlay.ItemIndex = -1 then
  begin
    ShowMessage('Select Overlay !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this Overlay ?', mtConfirmation, mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedOverlay.FData do
    begin
      {Pengecekan Relasi Dengan Tabel Resource Allocation Definition}
      tempList := TList.Create;
      if dmTTT.GetOverlayAtResourceAllocation(Overlay_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by some Resource Allocation');
        Exit;
        tempList.Destroy;
      end;
      tempList.Destroy;

      if dmTTT.DeleteOverlayDef(Overlay_Index) then
      begin
        DeleteFile(vAppDBSetting.OverlayPath + '\' + FSelectedOverlay.FData.Name + '.dat');
        ShowMessage('Data has been deleted');
      end;
    end;

    UpdateOverlayList;
  end;
end;

procedure TfrmAvailableOverlay.btnUsageClick(Sender: TObject);
begin
  if lstOverlay.ItemIndex = -1 then
  begin
    ShowMessage('Select Overlay... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedOverlay.FData.Overlay_Index;
      name_usage := FSelectedOverlay.FData.Overlay_Identifier;
      UIndex := 35;

      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
  
end;

procedure TfrmAvailableOverlay.edtoverlaylistKeyPress(Sender: TObject;
  var Key: Char);
  var
  i : Integer;
  overlay : TOverlay_Definition;
begin
  if Key = #13 then
  begin
   lstOverlay.Items.Clear;

//
    dmTTT.GetfilterOverlayDef(FOverlayList,edtCheat.text);
    for i := 0 to FOverlayList.Count - 1 do
    begin
    overlay := FOverlayList.Items[i];
    lstOverlay.Items.AddObject(overlay.FData.Overlay_Identifier, overlay);
    end;
  end;
end;

procedure TfrmAvailableOverlay.lbSingleClick(Sender: TObject);
begin
  if lstOverlay.ItemIndex = -1 then
    Exit;
  FSelectedOverlay := TOverlay_Definition(lstOverlay.Items.Objects[lstOverlay.ItemIndex]);
end;

procedure TfrmAvailableOverlay.UpdateOverlayList;
var
  i : Integer;
  overlay : TOverlay_Definition;
begin
  lstOverlay.Items.Clear;

  dmTTT.GetAllOverlayDef(FOverlayList);

  for i := 0 to FOverlayList.Count - 1 do
  begin
    overlay := FOverlayList.Items[i];
    lstOverlay.Items.AddObject(overlay.FData.Overlay_Identifier, overlay);
  end;

end;

{$ENDREGION}


end.
