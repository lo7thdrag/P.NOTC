unit ufrmAvailableMAD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uSimContainers,
  uDBAsset_Sensor;

type
  TfrmAvailableMAD = class(TForm)
    lbMAD: TListBox;
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
    FMADList : TList;
    FSelectedMAD : TMAD_On_Board;

    procedure UpdateMADList;
  end;

var
  frmAvailableMAD: TfrmAvailableMAD;
  sList : TList;
  isCopy : Boolean;

implementation

uses
   uDataModuleTTT, ufrmSummaryMAD, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableMAD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FMADList);
  Action := cafree;
end;

procedure TfrmAvailableMAD.FormCreate(Sender: TObject);
begin
  FMADList := TList.Create;
end;

procedure TfrmAvailableMAD.FormShow(Sender: TObject);
begin
  UpdateMADList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableMAD.btnNewClick(Sender: TObject);
begin
  frmSummaryMAD := TfrmSummaryMAD.Create(Self);
  try
    with frmSummaryMAD do
    begin
      SelectedMAD := TMAD_On_Board.Create;
      ShowModal;
      SelectedMAD.Free;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryMAD.Free;
  end;

  if FUpdateList then
    UpdateMADList;
end;

procedure TfrmAvailableMAD.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
begin
  if lbMAD.ItemIndex = -1 then
  begin
    ShowMessage('Select MAD... !');
    Exit;
  end;

  with FSelectedMAD do
  begin
    newClassName := FMAD_Def.Class_Identifier + ' - Copy';

    count := dmTTT.GetMADDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FMAD_Def.Class_Identifier := newClassName;

    dmTTT.InsertMADDef(FMAD_Def);
    dmTTT.InsertNoteStorage(11, FMAD_Def.MAD_Index, FNote);
  end;

  UpdateMADList;
end;

procedure TfrmAvailableMAD.btnEditClick(Sender: TObject);
begin
  if lbMAD.ItemIndex = -1 then
  begin
    ShowMessage('Select MAD... !');
    Exit;
  end;

  frmSummaryMAD := TfrmSummaryMAD.Create(Self);
  try
    with frmSummaryMAD do
    begin
      SelectedMAD := FSelectedMAD;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryMAD.Free;
  end;

  if FUpdateList then
    UpdateMADList;
end;

procedure TfrmAvailableMAD.btnDeleteClick(Sender: TObject);
var
  warning: Integer;
begin
  if lbMAD.ItemIndex = -1 then
  begin
    ShowMessage('Select MAD... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedMAD.FMAD_Def do
    begin
      {Pengecekan Relasi Dengan Tabel On Board}
      if dmTTT.GetSensor_On_Board_By_Index(2, MAD_Index) then
      begin
        ShowMessage('Cannot delete, because is already in used by some vehicles');
        Exit;
      end;

      dmTTT.DeleteNoteStorage(11, MAD_Index);

      if dmTTT.DeleteMADDef(MAD_Index) then
        ShowMessage('Data has been deleted');

    end;

    UpdateMADList;
  end;
end;

procedure TfrmAvailableMAD.btnUsageClick(Sender: TObject);
begin
  if lbMAD.ItemIndex = -1 then
  begin
    ShowMessage('Select MAD... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedMAD.FMAD_Def.MAD_Index;
      name_usage := FSelectedMAD.FMAD_Def.Class_Identifier;
      UIndex := 5;
      usage_title := 'On Board Vehicle:';

    ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
  
end;

procedure TfrmAvailableMAD.edtCheatKeyPress(Sender: TObject; var Key: Char);
  var
  i : Integer;
  mad : TMAD_On_Board;
begin
  if Key = #13 then
  begin
  lbMAD.Items.Clear;

  dmTTT.GetfilterMADDef(FMADList,edtCheat.Text);
    for i := 0 to FMADList.Count - 1 do
    begin
  mad := FMADList.Items[i];
    lbMAD.Items.AddObject(mad.FMAD_Def.Class_Identifier, mad);
    end;
  end;
end;

procedure TfrmAvailableMAD.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAvailableMAD.lbSingleClick(Sender: TObject);
begin
  if lbMAD.ItemIndex = -1 then
    Exit;

  FSelectedMAD := TMAD_On_Board(lbMAD.Items.Objects[lbMAD.ItemIndex]);
end;

 procedure TfrmAvailableMAD.UpdateMADList;
var
  i : Integer;
  mad : TMAD_On_Board;
begin
  lbMAD.Items.Clear;

  dmTTT.GetAllMADDef(FMADList);

  for i := 0 to FMADList.Count - 1 do
  begin
    mad := FMADList.Items[i];
    lbMAD.Items.AddObject(mad.FMAD_Def.Class_Identifier, mad);
  end;
end;

{$ENDREGION}



end.
