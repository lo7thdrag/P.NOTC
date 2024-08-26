unit ufrmGroupAllocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ExtCtrls, ComCtrls, Vcl.Imaging.pngimage,
  newClassASTT, uDBAsset_Deploy, uDBAssetObject, uSimContainers;

type
  TfrmGroupAllocation = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    ImgBackgroundForm: TImage;
    ImgHeader: TImage;
    Label1: TLabel;
    edtForce: TEdit;
    edtName: TEdit;
    grbExternalComm: TGroupBox;
    btnAddExternalComm: TButton;
    btnRemoveExternalComm: TButton;
    btnMoveUpExternalComm: TButton;
    btnMoveDownExternalComm: TButton;
    lstExternallComm: TListView;
    grbMembers: TGroupBox;
    btnAddMembers: TButton;
    btnRemoveMembers: TButton;
    btnMoveUpMembers: TButton;
    btnMoveDownMembers: TButton;
    lstMembers: TListView;
    grbTrackBlockRange: TGroupBox;
    lblStart: TLabel;
    lblEnd: TLabel;
    edtStart: TEdit;
    edtEnd: TEdit;
    lblForce: TLabel;
    lblName: TLabel;

    procedure edtChange(Sender: TObject);

    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure btnAddMembersClick(Sender: TObject);
    procedure btnRemoveMembersClick(Sender: TObject);
    procedure btnMoveUpMembersClick(Sender: TObject);
    procedure btnMoveDownMembersClick(Sender: TObject);

    procedure btnAddExternalCommClick(Sender: TObject);
    procedure btnRemoveExternalCommClick(Sender: TObject);
    procedure btnMoveUpExternalCommClick(Sender: TObject);
    procedure btnMoveDownExternalCommClick(Sender: TObject);

    procedure lstMembersClick(Sender: TObject);
    procedure lstExternallCommClick(Sender: TObject);

    procedure btnOKClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

    procedure ExchangeItems(lv: TListView; const i, j: Integer);

  private
    FMemberList : TList;

    FSelectedScenario : TScenario_Definition;
    FSelectedResourceAlloc : TResource_Allocation;
    FCubicleGroup : TCubicle_Group_Assignment;

    FSelectedCubicleOnMember : TCubicle_Group_Assignment;

    function CekInput : Boolean;
    procedure UpdateGroupData;
    procedure UpdateCubicleMemberList;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedScenario : TScenario_Definition read FSelectedScenario write FSelectedScenario;
    property SelectedResourceAlloc : TResource_Allocation read FSelectedResourceAlloc write FSelectedResourceAlloc;
    property CubicleGroup : TCubicle_Group_Assignment read FCubicleGroup write FCubicleGroup;

  end;

var
  frmGroupAllocation : TfrmGroupAllocation;

implementation

uses
   uDataModuleTTT, ufrmGroupMemberSelection;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmGroupAllocation.FormCreate(Sender: TObject);
begin
  FMemberList := TList.Create;
end;

procedure TfrmGroupAllocation.FormDestroy(Sender: TObject);
begin
  FreeItemsAndFreeList(FMemberList);
end;

procedure TfrmGroupAllocation.FormShow(Sender: TObject);
begin
  UpdateGroupData;

  with FCubicleGroup.FData do
    btnApply.Enabled := Group_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmGroupAllocation.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmGroupAllocation.btnApplyClick(Sender: TObject);
var
  cubGroup : TCubicle_Group_Assignment;
begin
  with FCubicleGroup do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    LastName := edtName.Text;
    FData.Group_Identifier := edtName.Text;

    if FData.Group_Index = 0 then
    begin
      dmTTT.InsertCubicleGroup(FData);
    end
    else
      dmTTT.UpdateCubicleGroup(FData);
  end;

  UpdateGroupData;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmGroupAllocation.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGroupAllocation.btnAddMembersClick(Sender: TObject);
begin
  frmGroupMemberSelection := TfrmGroupMemberSelection.Create(Self);
  try
    with frmGroupMemberSelection do
    begin
      Caller := gmfcMember;
      SelectedResourceAlloc := FSelectedResourceAlloc;
      SelectedCubicleGroup := FCubicleGroup;
      ShowModal;
    end;
  finally
    frmGroupMemberSelection.Free;
  end;

  btnApply.Enabled := True;
  UpdateCubicleMemberList;
end;

procedure TfrmGroupAllocation.btnRemoveMembersClick(Sender: TObject);
begin
  if lstMembers.ItemIndex = -1 then
    Exit;

  with FSelectedCubicleOnMember.FCubicle do
    dmTTT.DeleteCubicleGroupAssignment(3, Platform_Instance_Index);

  UpdateCubicleMemberList;
end;

procedure TfrmGroupAllocation.btnAddExternalCommClick(Sender: TObject);
begin
// frmGroupMemberSelection.ShowModal;
end;

procedure TfrmGroupAllocation.btnMoveDownExternalCommClick( Sender: TObject);
var
  Idx1, Idx2: Integer;
begin
  if(lstExternallComm.Selected.Index >= lstExternallComm.Items.Count)
  then
    btnMoveDownExternalComm.Enabled := false;

  Idx1:= lstExternallComm.Selected.Index;
  Idx2:= Idx1 + 1;
  ExchangeItems(lstExternallComm, Idx1, Idx2);
end;

procedure TfrmGroupAllocation.btnMoveDownMembersClick(Sender: TObject);
  //move down
  //ExcangeItems(lstMembers, 1, 2);
var
  Idx1, Idx2: Integer;
begin
  if(lstMembers.Selected.Index >= lstMembers.Items.Count)
  then
    btnMoveDownMembers.Enabled := false;
  Idx1:= lstMembers.Selected.Index;
  Idx2:= Idx1 + 1;
  ExchangeItems(lstMembers, Idx1, Idx2);

end;

procedure TfrmGroupAllocation.btnMoveUpExternalCommClick( Sender: TObject);
var
  Idx1, Idx2: Integer;
begin
  if(lstExternallComm.Selected.Index = 0)
  then
    btnMoveUpExternalComm.Enabled := false;

    Idx1:= lstExternallComm.Selected.Index;
    Idx2:= Idx1 - 1;
    ExchangeItems(lstExternallComm, Idx1, Idx2);

end;

procedure TfrmGroupAllocation.btnMoveUpMembersClick(Sender: TObject);
  //move up
  //ExcangeItems(lstMembers, lstMembers.Selected.Index, lstMembers.Selected.Index-1);
var
  Idx1, Idx2: Integer;
begin
  if(lstMembers.Selected.Index = 0) then
    btnMoveUpMembers.Enabled := false;

  Idx1:= lstMembers.Selected.Index;
  Idx2:= Idx1 - 1;
  ExchangeItems(lstMembers, Idx1, Idx2);
end;

procedure TfrmGroupAllocation.btnRemoveExternalCommClick( Sender: TObject);
begin
//
end;

function TfrmGroupAllocation.CekInput : Boolean;
var
  i, chkSpace, numSpace: Integer;
  cubGroup: TCubicle_Group_Assignment;
begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtName.Text = '')then
  begin
    ShowMessage('Please insert class name');
    Exit;
  end;

  {Jika berisi spasi semua}
  if Copy(edtName.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtName.Text);
    numSpace := 0;

    for i := 1 to chkSpace do
    begin
      if edtName.Text[i] = #32 then
      numSpace := numSpace + 1;
    end;

    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  {Jika Class Name sudah ada}
  if (dmTTT.GetCubicleGroup(FCubicleGroup.FData.Deployment_Index, edtName.Text) > 0) then
  begin
    {Jika inputan baru}
    if FCubicleGroup.FData.Group_Index = 0 then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end
    else if LastName <> edtName.Text then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  Result := True;

end;


procedure TfrmGroupAllocation.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Filter Input '}


procedure TfrmGroupAllocation.lstExternallCommClick(Sender: TObject);
begin
  if lstExternallComm.Selected <> nil then
  begin
  if(Self.lstExternallComm.Selected.Index = lstExternallComm.Items.Count-1)
  then
    begin
      btnMoveDownExternalComm.Enabled := false;
    end
  else if (Self.lstExternallComm.Selected.Index = 0)
  then
    begin
      btnMoveUpExternalComm.Enabled := false;
    end
  else if(Self.lstExternallComm.Items.Count >= 2)
  then
      begin
      btnMoveUpExternalComm.Enabled := true;
      btnMoveDownExternalComm.Enabled := true;
      end
  end;
end;

procedure TfrmGroupAllocation.lstMembersClick(Sender: TObject);
begin

  if lstMembers.ItemIndex <> -1 then
    FSelectedCubicleOnMember := TCubicle_Group_Assignment(lstMembers.Items[lstMembers.ItemIndex].Data);

  btnRemoveMembers.Enabled := lstMembers.ItemIndex <> -1;
  btnMoveUpMembers.Enabled := (lstMembers.ItemIndex <> -1) and Assigned(lstMembers.Items[lstMembers.ItemIndex - 1]);
  btnMoveDownMembers.Enabled := (lstMembers.ItemIndex <> -1) and Assigned(lstMembers.Items[lstMembers.ItemIndex + 1]);
end;

procedure TfrmGroupAllocation.UpdateCubicleMemberList;
var
  i : Integer;
  cubGroup : TCubicle_Group_Assignment;
  li : TListItem;
begin
  lstMembers.Items.Clear;

  dmTTT.GetCubicleGroupAssignment(FCubicleGroup.FData.Group_Index, FMemberList);

  for i := 0 to FMemberList.Count - 1 do
  begin
    cubGroup := FMemberList.Items[i];

    li := lstMembers.Items.Add;
    li.Caption := IntToStr(i);
    li.SubItems.Add(cubGroup.FPlatform.Instance_Name);
    li.Data := cubGroup;
  end;
end;

procedure TfrmGroupAllocation.UpdateGroupData;
var
  i : Integer;
  aTrack_Block_Start : Integer;
  aArray : array of Integer;
  isEmpty : Boolean;

begin
  with FCubicleGroup.FData do
  begin
    if Group_Index = 0 then
      edtName.Text := '(Unnamed)'
    else
      edtName.Text := Group_Identifier;

    LastName := edtName.Text;

    lstMembers.Items.Clear;
    lstExternallComm.Items.Clear;

    case Force_Designation of
      1: edtForce.Text := 'Red';
      3: edtForce.Text := 'Blue';
    end;

    edtStart.Text := IntToStr(Track_Block_Start);
    edtEnd.Text := IntToStr(Track_Block_End);

    btnAddMembers.Enabled := Group_Index <> 0;
    btnRemoveMembers.Enabled := (Group_Index <> 0) and (lstMembers.ItemIndex <> -1);
    btnMoveUpMembers.Enabled := (Group_Index <> 0) and (lstMembers.ItemIndex <> -1);
    btnMoveDownMembers.Enabled := (Group_Index <> 0) and (lstMembers.ItemIndex <> -1);

    btnAddExternalComm.Enabled := Group_Index <> 0;
    btnRemoveExternalComm.Enabled := (Group_Index <> 0) and (lstMembers.ItemIndex <> -1);
    btnMoveUpExternalComm.Enabled := (Group_Index <> 0) and (lstMembers.ItemIndex <> -1);
    btnMoveDownExternalComm.Enabled := (Group_Index <> 0) and (lstMembers.ItemIndex <> -1);

    UpdateCubicleMemberList
  end;
end;

procedure TfrmGroupAllocation.ExchangeItems(lv: TListView; const i, j: Integer);
var
tempLI : TListItem;
begin
  lv.Items.BeginUpdate;
  try
    tempLI := TListItem.Create(lv.Items);
    tempLI.Assign(lv.Items.Item[i]);
    lv.Items.Item[i].Assign(lv.Items.Item[j]);
    lv.Items.Item[j].Assign(tempLI);
    tempLI.Free;
  finally
    lv.Items.EndUpdate;
  end;
end;

{$ENDREGION}

end.
