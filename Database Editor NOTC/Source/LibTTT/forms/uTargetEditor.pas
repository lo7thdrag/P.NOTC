unit uTargetEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, uDBAssetObject, ImgList, uDBAsset_Vehicle,
  System.ImageList;

type
  TfrmTargetEditor = class(TForm)
    cbbClass: TComboBox;
    edtTrackID: TEdit;
    lbl1: TLabel;
    lvTargetList: TListView;
    btnRemove: TButton;
    pnl1: TPanel;
    pnl2: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtPosition: TEdit;
    btnPosition: TButton;
    btnAdd: TButton;
    btnClose: TButton;
    imgTarget: TImage;
    btnUpdate: TButton;
    ImageList1: TImageList;
    cbbType: TComboBox;
    lbl4: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnPositionClick(Sender: TObject);
    procedure lvTargetListClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbClassChange(Sender: TObject);
    procedure edtTrackIDChange(Sender: TObject);
  private
    { Private declarations }
    TargetPlatform : TPlatform_Instance;
    aListOfTarget : TList;
    aListIdentIndex : TList;
    procedure ClearAllDate;
    procedure GetTarget;
    procedure getCbbList;
    procedure upperCase(sender:TObject);
    procedure EnableButton(aStatus : Boolean);
    function CekInvalidName(name : string): Boolean;
    function CekInvalidUpdateName(id : Integer; name : string): Boolean;
    function CekInvalidType(id : Integer): Boolean;
    function CekInvalidUpdateType(id, idType : Integer): Boolean;


  public
    { Public declarations }
    TargetList : TList;
    TargetLong : Double;
    TargetLatt : Double;
    CartesianX : integer;
    CartesianY : integer;

    procedure OnAddTarget(X, Y : Integer; Long,Lat : double);
  end;

var
  frmTargetEditor: TfrmTargetEditor;

implementation

uses uDataModuleTTT, uBaseCoordSystem, ufrmAdminMainForm, ufrmSummaryResourceAllocation, uVectorVisual
     {,uPlatformDeployment}, MapXLib_TLB;

{$R *.dfm}

procedure TfrmTargetEditor.btnAddClick(Sender: TObject);
var
  id : integer;
begin
  if edtTrackID.Text = '' then
  begin
    ShowMessage('Invalid name...');
    Exit;
  end;

  if CekInvalidName(edtTrackID.Text) then
  begin
    ShowMessage('name is already existed...');
    Exit;
  end;

  if CekInvalidType(dmTTT.getInstance_Ident_Index(dmTTT.GetIDVecTarget(cbbClass.Text), cbbType.Text)) then
  begin
    ShowMessage('type is already existed...');
    Exit;
  end;


  //=========================
  TargetPlatform := TPlatform_Instance.Create;
  with TargetPlatform.FData do
  begin
    Resource_Alloc_Index := 0;
    Platform_Instance_Index := 0;
    Vehicle_Index         := dmTTT.GetIDVecTarget(cbbClass.Text);
    Instance_Name         := cbbType.Text;
    Platform_Type         := 1;       //type of vehicle
    Track_ID              := edtTrackID.Text;
    Force_Designation     := 1;       //red

    Instance_Ident_Index := dmTTT.getInstance_Ident_Index(Vehicle_Index, cbbType.Text);
  end;

  with TargetPlatform.FActivation do
  begin
    Init_Position_Latitude := TargetLatt;
    Init_Position_Longitude := TargetLong;
    Init_Position_Cartesian_X := CartesianX;
    Init_Position_Cartesian_Y := CartesianY;
  end;

  TargetList.Add(TargetPlatform);

  ClearAllDate;
//  getCbbList;
  GetTarget;

end;

procedure TfrmTargetEditor.btnCloseClick(Sender: TObject);
begin
  frmTargetEditor.Close;
end;

procedure TfrmTargetEditor.btnPositionClick(Sender: TObject);
begin
  frmAdminMainForm.Map1.CurrentTool := TOOL_ADD_TARGET;
end;

procedure TfrmTargetEditor.btnRemoveClick(Sender: TObject);
var
  aPi : TPlatform_Instance;
begin
  if lvTargetList.Selected = nil then
  begin
    ShowMessage('Select target first');
    Exit;
  end;

  aPi := TPlatform_Instance(lvTargetList.Selected.Data);

  if aPi.FData.Platform_Instance_Index <> 0 then
  begin
    dmTTT.deletePlatform_ActivationByIndex(IntToStr(aPi.FData.Platform_Instance_Index));
//    dmTTT.deletePlatformInstance(IntToStr(aPi.FData.Platform_Instance_Index));
  end;

  TargetList.Delete(lvTargetList.Selected.Index);
  ClearAllDate;
//  getCbbList;
  GetTarget;
  EnableButton(True);
end;

procedure TfrmTargetEditor.btnUpdateClick(Sender: TObject);
begin

  if edtTrackID.Text = '' then
  begin
    ShowMessage('Invalid name...');
    Exit;
  end;

  if CekInvalidUpdateName(lvTargetList.Selected.Index, edtTrackID.Text) then
  begin
    ShowMessage('name is already existed...');
    Exit;
  end;

  if CekInvalidUpdateType(lvTargetList.Selected.Index, dmTTT.getInstance_Ident_Index(dmTTT.GetIDVecTarget(cbbClass.Text), cbbType.Text)) then
  begin
    ShowMessage('type is already existed...');
    Exit;
  end;

  with TargetPlatform.FData do   //yang diupdate hanya sebagian data saja, yang lain tetap
  begin
    Vehicle_Index         := dmTTT.GetIDVecTarget(cbbClass.Text);
    Instance_Name         := cbbType.Text;
    Track_ID              := edtTrackID.Text;

    Instance_Ident_Index := dmTTT.getInstance_Ident_Index(Vehicle_Index, cbbType.Text);

  end;

  with TargetPlatform.FActivation do
  begin
    Init_Position_Latitude := TargetLatt;
    Init_Position_Longitude := TargetLong;
    Init_Position_Cartesian_X := CartesianX;
    Init_Position_Cartesian_Y := CartesianY;
  end;

  ClearAllDate;
//  getCbbList;
  GetTarget;
  EnableButton(True);
end;

procedure TfrmTargetEditor.cbbClassChange(Sender: TObject);
var
  vId : Integer;
  aListIdentIndex : TList;
  i : Integer;
  strPath : string;
begin
  vId := dmTTT.getVecIndexFromIdent(cbbClass.Text);
  aListIdentIndex := TList.Create;
  dmTTT.GetTargetIdentifierFromClass(vId, aListIdentIndex);
  cbbType.Items.Clear;
  for I := 0 to aListIdentIndex.Count - 1 do
  begin
    cbbType.Items.Add(TPlatform_Instance_Identifier(aListIdentIndex.Items[i]).FData.Instance_Identifier)
  end;
  cbbType.ItemIndex := 0;

  strPath := '.\data\Image DBEditor\Target\';
  if Assigned(aListIdentIndex.Items[0]) then    //ambil salah satu
    imgTarget.Picture.LoadFromFile(strPath + TPlatform_Instance_Identifier(aListIdentIndex.Items[0]).FData.vbs_class_name + '.jpg');
end;

function TfrmTargetEditor.CekInvalidName(name: string): Boolean;
var
  i : Integer;
begin
  Result := false;
  for I := 0 to TargetList.Count - 1 do
  begin
    if name = TPlatform_Instance(TargetList.Items[i]).FData.Track_ID then
    begin
      Result := True;
      Exit;
    end;
  end;

end;

function TfrmTargetEditor.CekInvalidType(id: Integer): Boolean;
var
  i : Integer;
begin
  Result := false;
  for I := 0 to TargetList.Count - 1 do
  begin
    if id = TPlatform_Instance(TargetList.Items[i]).FData.Instance_Ident_Index then
    begin
      Result := True;
      Exit;
    end;
  end;

end;

function TfrmTargetEditor.CekInvalidUpdateName(id : integer; name: string): Boolean;
var
  i : Integer;
begin
  Result := false;
  for I := 0 to TargetList.Count - 1 do
  begin
    if id = i then
      continue
    else
    begin
      if name = TPlatform_Instance(TargetList.Items[i]).FData.Track_ID then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;

end;

function TfrmTargetEditor.CekInvalidUpdateType(id, idType: Integer): Boolean;
var
  i : Integer;
begin
  Result := false;
  for I := 0 to TargetList.Count - 1 do
  begin
    if id = i then
      continue
    else
    begin
      if idType = TPlatform_Instance(TargetList.Items[i]).FData.Instance_Ident_Index then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;

end;

procedure TfrmTargetEditor.ClearAllDate;
begin
  edtTrackID.Text := '';
  edtPosition.Text := formatDMS_long(0) + ' , ' + formatDMS_latt(0);
  frmAdminMainForm.OnClick_ToolButton(frmAdminMainForm.btnArrow);
end;

procedure TfrmTargetEditor.edtTrackIDChange(Sender: TObject);
begin
  upperCase(Sender);
end;

procedure TfrmTargetEditor.EnableButton(aStatus: Boolean);
begin
  if aStatus then  //jika new
  begin
    btnAdd.Enabled := True;
    btnUpdate.Enabled := False;
  end
  else
  begin
    btnAdd.Enabled := false;
    btnUpdate.Enabled := true;
  end;
end;

procedure TfrmTargetEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  fDBEditor.OnClick_ToolButton(fDBEditor.btnArrow);
  frmAdminMainForm.Map1.CurrentTool := miArrowTool;
end;

procedure TfrmTargetEditor.FormCreate(Sender: TObject);
begin
  TargetList := TList.Create;
  aListOfTarget := TList.Create;
  aListIdentIndex := TList.Create;
end;

procedure TfrmTargetEditor.FormDestroy(Sender: TObject);
var
  i : integer;
  obj : TObject;
begin
  for I := TargetList.Count - 1 downto 0 do
  begin
    obj := TargetList.Items[i];
    obj.Free;
  end;

  TargetList.Clear;
  TargetList.Free;
  TargetList := nil;
end;

procedure TfrmTargetEditor.FormShow(Sender: TObject);
begin
  ClearAllDate;
  getCbbList;
  GetTarget;
  EnableButton(True);
//  ImageList1.GetBitmap(0, imgTarget.Picture.Bitmap);
  Left := frmAdminMainForm.Map1.Left + 4;
  Top := frmAdminMainForm.Map1.Top + 39;
end;

procedure TfrmTargetEditor.getCbbList;   //digunakan untuk mendapatkan list target dari vec_def
var
  i : Integer;
  strPath : string;
begin
  if aListOfTarget.Count = 0 then
  begin
    dmTTT.GetTargetListFromVec_Def(aListOfTarget);
  end;

  cbbClass.Items.Clear;
  for I := 0 to aListOfTarget.Count - 1 do
  begin
    cbbClass.Items.Add(TVehicle_Definition(aListOfTarget.Items[i]).FData.Vehicle_Identifier);
  end;
  cbbClass.ItemIndex := 0;

  if aListIdentIndex.Count = 0 then
  begin
    if aListOfTarget.Count > 0 then
      dmTTT.GetTargetIdentifierFromClass(TVehicle_Definition(aListOfTarget.Items[0]).FData.Vehicle_Index, aListIdentIndex);  //ambil list yang pertama saja
  end;

  cbbType.Items.Clear;
  for I := 0 to aListIdentIndex.Count - 1 do
  begin
    cbbType.Items.Add(TPlatform_Instance_Identifier(aListIdentIndex.Items[i]).FData.Instance_Identifier)
  end;
  cbbType.ItemIndex := 0;

  strPath := '.\data\Image DBEditor\Target\';
  if aListIdentIndex.Count > 0 then
  begin
    if Assigned(aListIdentIndex.Items[0]) then    //ambil salah satu
      imgTarget.Picture.LoadFromFile(strPath + TPlatform_Instance_Identifier(aListIdentIndex.Items[0]).FData.vbs_class_name + '.jpg');
  end;
end;

procedure TfrmTargetEditor.GetTarget;
var
  i : integer;
begin
  lvTargetList.Clear;

  for I := 0 to TargetList.Count - 1 do
  begin
     with lvTargetList.Items.Add do
    begin
      Data := TargetList.Items[i];
      Caption := IntToStr(i + 1);
      SubItems.Add(TPlatform_Instance(TargetList.Items[i]).FData.Instance_Name);
      SubItems.Add(TPlatform_Instance(TargetList.Items[i]).FData.Track_ID);
    end;
  end;

  frmAdminMainForm.Map1.Repaint;
end;

procedure TfrmTargetEditor.lvTargetListClick(Sender: TObject);
var
  i : Integer;
  aIdentifier : string;
  aListIdentIndex : TList;
  V_identifier : string;
  strPath : string;
begin
  if lvTargetList.Selected = nil then
  begin
    EnableButton(True);
    ClearAllDate;
   // getCbbList;
  end
  else
  begin
    EnableButton(False);

    TargetPlatform := TPlatform_Instance(lvTargetList.Selected.Data);

    with TargetPlatform.FData do
    begin
      edtTrackID.Text := Track_ID;
      V_identifier := dmTTT.GetVehicleIdentifierByID(Vehicle_Index);
      for I := 0 to cbbClass.Items.Count - 1 do
      begin
        if V_identifier = cbbClass.Items[i] then
          cbbClass.ItemIndex := i;
      end;

      aListIdentIndex := TList.Create;
      dmTTT.GetTargetIdentifierFromClass(Vehicle_Index, aListIdentIndex);
      cbbType.Items.Clear;
      for I := 0 to aListIdentIndex.Count - 1 do
      begin
        cbbType.Items.Add(TPlatform_Instance_Identifier(aListIdentIndex.Items[i]).FData.Instance_Identifier)
      end;

      aIdentifier := dmTTT.GetIdentifierById(Instance_Ident_Index);
      for I := 0 to cbbType.Items.Count - 1 do
      begin
        if aIdentifier = cbbType.Items[i] then
          cbbType.ItemIndex := i;
      end;
//      ImageList1.GetBitmap(cbbType.ItemIndex, imgTarget.Picture.Bitmap);
//      imgTarget.Invalidate; // Refresh image
    end;

    with TargetPlatform.FActivation do
    begin
      TargetLatt := Init_Position_Latitude;
      TargetLong := Init_Position_Longitude;
      CartesianX := Round(Init_Position_Cartesian_X);
      CartesianY := Round(Init_Position_Cartesian_Y);
      edtPosition.Text := formatDMS_long(Init_Position_Longitude) + ' , ' + formatDMS_latt(Init_Position_Latitude);
    end;

    strPath := '.\data\Image DBEditor\Target\';
    if Assigned(aListIdentIndex.Items[0]) then    //ambil salah satu
      imgTarget.Picture.LoadFromFile(strPath + TPlatform_Instance_Identifier(aListIdentIndex.Items[0]).FData.vbs_class_name + '.jpg');

  end;

end;

procedure TfrmTargetEditor.OnAddTarget(X, Y : Integer; Long, Lat: double);
begin
  TargetLong := Long;
  TargetLatt := Lat;
  CartesianX := X;
  CartesianY := Y;

  edtPosition.Text := formatDMS_long(Long) + ' , ' + formatDMS_latt(Lat);
end;

procedure TfrmTargetEditor.upperCase(sender: TObject);
var
  sebelumUp : TNotifyEvent; //mengeset variabel yang dibutuhkan
  dimulaiUp: Integer;
begin
  with (Sender as TEdit) do
  begin
    sebelumUp := OnChange; //assign var sebelumUp seperti onChange
    OnChange := nil;
    dimulaiUp := SelStart;

    SelStart := SelStart - 1;
    SelLength := 1;
    SelText := AnsiUpperCase (SelText);

    OnChange := sebelumUp;
    SelStart := dimulaiUp;
  end;
end;

end.
