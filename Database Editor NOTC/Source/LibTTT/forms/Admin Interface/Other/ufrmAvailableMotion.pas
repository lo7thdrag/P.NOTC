unit ufrmAvailableMotion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uDBAsset_MotionCharacteristics;

type
  TfrmAvailablemotion = class(TForm)
    lbMotions: TListBox;
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

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtmotionlistKeyPress(Sender: TObject; var Key: Char);


  private
    FUpdateList : Boolean;
    FMotionList : TList;
    FSelectedMotion : TMotion_Characteristics;

    procedure UpdateMotionList;
  end;

var
  frmAvailablemotion: TfrmAvailablemotion;

implementation

uses
  uDataModuleTTT, ufrmSummaryMotion, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableMotion.FormActivate(Sender: TObject);
begin
//  WindowState := wsMaximized;
end;

procedure TfrmAvailablemotion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmAvailableMotion.FormCreate(Sender: TObject);
begin
  FMotionList := TList.Create;
end;

procedure TfrmAvailableMotion.FormShow(Sender: TObject);
begin
  UpdateMotionList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableMotion.btnNewClick(Sender: TObject);
begin
  frmSummaryMotion := TfrmSummaryMotion.Create(Self);
  try
    with frmSummaryMotion do
    begin
      SelectedMotion := TMotion_Characteristics.Create;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryMotion.Free;
  end;

  if FUpdateList then
    UpdateMotionList;
end;

procedure TfrmAvailablemotion.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableMotion.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
begin
  if lbMotions.ItemIndex = -1 then
  begin
    ShowMessage('Select Motion... !');
    Exit;
  end;

  with FSelectedMotion do
  begin
    newClassName := FData.Motion_Identifier + ' - Copy';

    count := dmTTT.GetMotionCharacteristicDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FData.Motion_Identifier := newClassName;

    dmTTT.InsertMotionCharacteristicDef(FData);
  end;

  UpdateMotionList;
end;

procedure TfrmAvailableMotion.btnEditClick(Sender: TObject);
begin
  if lbMotions.ItemIndex = -1 then
  begin
    ShowMessage('Select Motion... !');
    Exit;
  end;

  frmSummaryMotion := TfrmSummaryMotion.Create(Self);
  try
    with frmSummaryMotion do
    begin
      SelectedMotion := FSelectedMotion;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryMotion.Free;
  end;

  if FUpdateList then
    UpdateMotionList;
end;

procedure TfrmAvailableMotion.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList : TList;

begin
  if lbMotions.ItemIndex = -1 then
  begin
    ShowMessage('Select Motion... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this Motion ?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    tempList := TList.Create;
    with FSelectedMotion.FData do
    begin
      {Pengecekan Relasi Dengan Tabel Vehicle Definition}
      if dmTTT.GetMotionCharacteristicAtVehicleDef(Motion_Index,tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by Vehicle Definition');
        tempList.Destroy;
        Exit;
      end;

      {Catatan : Seharusnya ada Pengecekan Relasi Dengan Tabel Missile Definition}
      if dmTTT.GetMotionCharacteristicAtMissileDef(Motion_Index,tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by Missile Definition');
        tempList.Destroy;
        Exit;
      end;

      {Catatan : Seharusnya ada Pengecekan Relasi Dengan Tabel Torpedo Definition}
      if dmTTT.GetMotionCharacteristicAtTorpedoDef(Motion_Index,tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by Torpedo Definition');
        tempList.Destroy;
        Exit;
      end;
      tempList.Destroy;

      if dmTTT.DeleteMotionCharacteristicDef(Motion_Index) then
        ShowMessage('Data has been deleted');

    end;
  end;

  UpdateMotionList;
end;

procedure TfrmAvailableMotion.btnUsageClick(Sender: TObject);
begin
  if lbMotions.ItemIndex = -1 then
  begin
    ShowMessage('Select Motion... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedMotion.FData.Motion_Index;
      name_usage  := FSelectedMotion.FData.Motion_Identifier;
      UIndex  := 32;
      usage_title := 'Vehicle Class:';
      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
  
end;

procedure TfrmAvailablemotion.edtmotionlistKeyPress(Sender: TObject;
  var Key: Char);
  var
   i : Integer;
 motion : TMotion_Characteristics;
begin
  if Key = #13 then
  begin
  lbMotions.Items.Clear;


  dmTTT.GetFilterMotionDef(FMotionList,edtCheat.Text);
    for i := 0 to  FMotionList.Count - 1 do
    begin
 motion := FMotionList.Items[i];
    lbMotions.Items.AddObject(motion.FData.Motion_Identifier, motion);
    end;
  end;
end;

procedure TfrmAvailableMotion.lbSingleClick(Sender: TObject);
begin
  if lbMotions.ItemIndex = -1 then
    Exit;

  FSelectedMotion := TMotion_Characteristics(lbMotions.Items.Objects[lbMotions.ItemIndex]);
end;

procedure TfrmAvailableMotion.UpdateMotionList;
var
  i : Integer;
  motion : TMotion_Characteristics;
begin
  lbMotions.Items.Clear;

  dmTTT.GetAllMotionCharacteristicDef(FMotionList);

  for i := 0 to FMotionList.Count - 1 do
  begin
    motion := FMotionList.Items[i];
    lbMotions.Items.AddObject(motion.FData.Motion_Identifier, motion);
  end;
end;

{$ENDREGION}

end.
