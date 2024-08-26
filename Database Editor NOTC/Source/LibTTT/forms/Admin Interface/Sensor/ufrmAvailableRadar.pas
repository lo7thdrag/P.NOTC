unit ufrmAvailableRadar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uSimDBEditor, tttData, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uSimContainers, uDBAsset_Radar;

type
  TfrmAvailableRadar = class(TForm)
    lbRadars: TListBox;
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

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

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
    FRadarList : TList;
    FSelectedRadar : TRadar_On_Board;

    procedure UpdateRadarList;
  end;

var
  frmAvailableRadar: TfrmAvailableRadar;

implementation

uses
  uDataModuleTTT, ufrmSummaryRadar, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableRadar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FRadarList);
  Action := cafree;
end;

procedure TfrmAvailableRadar.FormCreate(Sender: TObject);
begin
  FRadarList := TList.Create;
end;

procedure TfrmAvailableRadar.FormShow(Sender: TObject);
begin
  UpdateRadarList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableRadar.btnNewClick(Sender: TObject);
begin
  frmSummaryRadar := TfrmSummaryRadar.Create(Self);
  try
    with frmSummaryRadar do
    begin
      SelectedRadar := TRadar_On_Board.Create;
      ShowModal;
      FUpdateList := AfterClose;
      SelectedRadar.Free;
    end;
  finally
    frmSummaryRadar.Free;
  end;

  if FUpdateList then
    UpdateRadarList;
end;

procedure TfrmAvailableRadar.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
begin
  if lbRadars.ItemIndex = -1 then
  begin
    ShowMessage('Select Radar Data ... !');
    Exit;
  end;

  with FSelectedRadar do
  begin
    newClassName := FDef.Radar_Identifier + ' - Copy';

    count := dmTTT.GetRadarDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FDef.Radar_Identifier := newClassName;

    dmTTT.InsertRadarDef(FDef);
    dmTTT.InsertNoteStorage(7, FDef.Radar_Index, FNote);
  end;

  UpdateRadarList;
end;

procedure TfrmAvailableRadar.btnEditClick(Sender: TObject);
begin
  if lbRadars.ItemIndex = -1 then
  begin
    ShowMessage('Select Radar Data ... !');
    Exit;
  end;

  frmSummaryRadar := TfrmSummaryRadar.Create(Self);
  try
    with frmSummaryRadar do
    begin
      SelectedRadar := FSelectedRadar;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryRadar.Free;
  end;

  if FUpdateList then
    UpdateRadarList;
end;

procedure TfrmAvailableRadar.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
begin
  if lbRadars.ItemIndex = -1 then
  begin
    ShowMessage('Select Radar Data ... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedRadar.FDef do
    begin

      {Pengecekan Relasi Dengan Tabel On Board}
      if dmTTT.GetSensor_On_Board_By_Index(1, Radar_Index) then
      begin
        ShowMessage('Cannot delete, because is already in used by some vehicles');
        Exit;
      end;

      {Catatan : Seharusnya ada tambahan menghapus data di Tabel Vertical Coverage}
      dmTTT.DeleteRadar_Vertical_Coverage(1, Radar_Index, 0);
      dmTTT.DeleteNoteStorage(7, Radar_Index);

      if dmTTT.DeleteRadarDef(Radar_Index) then
        ShowMessage('Data has been deleted');

    end;

    UpdateRadarList;
  end;
end;

procedure TfrmAvailableRadar.btnUsageClick(Sender: TObject);
begin
  if lbRadars.ItemIndex = -1 then
  begin
    ShowMessage('Select Radar... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedRadar.FDef.Radar_Index;
      name_usage := FSelectedRadar.FDef.Radar_Identifier;
      usage_title := 'On Board Vehicle : ';
      UIndex := 1;
      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
end;

procedure TfrmAvailableRadar.edtCheatKeyPress(Sender: TObject; var Key: Char);
  var
  i : Integer;
  radar : TRadar_On_Board;
begin
  if Key = #13 then
  begin
 lbRadars.Items.Clear;

  dmTTT.GetfilterRadarDef(FRadarList,edtCheat.Text);
    for i := 0 to FRadarList.Count - 1 do
    begin
 radar := FRadarList.Items[i];
    lbRadars.Items.AddObject(radar.FDef.Radar_Identifier, radar);
    end;
  end;
end;
procedure TfrmAvailableRadar.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableRadar.lbSingleClick(Sender: TObject);
begin
  if lbRadars.ItemIndex = -1 then
    Exit;

  FSelectedRadar := TRadar_On_Board(lbRadars.Items.Objects[lbRadars.ItemIndex]);
end;

procedure TfrmAvailableRadar.UpdateRadarList;
var
  i : Integer;
  radar : TRadar_On_Board;
begin
  lbRadars.Items.Clear;

  dmTTT.GetAllRadarDef(FRadarList);

  for i := 0 to FRadarList.Count - 1 do
  begin
    radar := FRadarList.Items[i];
    lbRadars.Items.AddObject(radar.FDef.Radar_Identifier, radar);
  end;
end;

{$ENDREGION}
end.
