unit ufrmAvailableStudentRole;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, uDBAssetObject;

type
  TfrmAvailableStudentRole = class(TForm)
    lstStudentRole: TListBox;
    btnCopy: TImage;
    btnDelete: TImage;
    btnEdit: TImage;
    btnNew: TImage;
    btnUsage: TImage;
    ImgBackground: TImage;
    ImgBtnBack: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    Image1: TImage;
    edtstudentrolelist: TEdit;
    lblsearch: TLabel;

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
    procedure ImgBackgroundClick(Sender: TObject);
    procedure edtstudentrolelistKeyPress(Sender: TObject; var Key: Char);

  private
    FUpdateList : Boolean;
    FStudentRoleList : TList;
    FSelectedStudentRoles : TStudent_Role_List;

    procedure UpdateStudentRoleList;
    procedure CopyStudentRoleDefinition(const aStudentRoleIndex, aNewStudentRoleIndex: Integer);
  end;

var
  frmAvailableStudentRole: TfrmAvailableStudentRole;

implementation

uses
  uDataModuleTTT, ufrmSummaryStudentRole, ufrmUsage;
{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableStudentRole.FormActivate(Sender: TObject);
begin
//  WindowState := wsMaximized;
end;

procedure TfrmAvailableStudentRole.FormCreate(Sender: TObject);
begin
  FStudentRoleList := TList.Create;
end;

procedure TfrmAvailableStudentRole.FormShow(Sender: TObject);
begin
  UpdateStudentRoleList;
end;

procedure TfrmAvailableStudentRole.ImgBackgroundClick(Sender: TObject);
begin

end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableStudentRole.btnNewClick(Sender: TObject);
begin
  frmSummaryStudentRole := TfrmSummaryStudentRole.Create(Self);
  try
    with frmSummaryStudentRole do
    begin
      SelectedStudentRoleList := TStudent_Role_List.Create;
      ShowModal;

      SelectedStudentRoleList.Free;
    end;
  finally
    frmSummaryStudentRole.Free;
  end;

  if FUpdateList then
    UpdateStudentRoleList;
end;

procedure TfrmAvailableStudentRole.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAvailableStudentRole.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count, parentIndex : Integer;
begin
  if lstStudentRole.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo... !');
    Exit;
  end;

  with FSelectedStudentRoles do
  begin
    parentIndex := FData.Role_List_Index;
    newClassName := FData.Role_List_Identifier + ' - Copy';

    count := dmTTT.GetStudentRoleList(newClassName);

    if count > 0 then
    newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FData.Role_List_Identifier := newClassName;

    dmTTT.InsertStudentRoleList(FData);
       CopyStudentRoleDefinition(parentIndex, FData.Role_List_Index);
  end;

  UpdateStudentRoleList;
end;

procedure TfrmAvailableStudentRole.btnEditClick(Sender: TObject);
begin
  if lstStudentRole.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo... !');
    Exit;
  end;

  frmSummaryStudentRole:= TfrmSummaryStudentRole.Create(Self);
  try
    with frmSummaryStudentRole do
    begin
      SelectedStudentRoleList := TStudent_Role_List(FSelectedStudentRoles);
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryStudentRole.Free;
  end;

  if FUpdateList then
    UpdateStudentRoleList;
end;

procedure TfrmAvailableStudentRole.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList: TList;

begin
  if lstStudentRole.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    tempList := TList.Create;


    with FSelectedStudentRoles.FData do
    begin
      {Pengecekan Student Role utama tidak bisa dihapus}
      if Role_List_Index = 25 then
      begin
        ShowMessage('Cannot delete default Student Role');
        tempList.Free;
        Exit;
      end;

      {Pengecekan Relasi Dengan Resource Allocation}
      if dmTTT.GetStudentRoleAtResourceAllocation(Role_List_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already used by some Resource Allocation');
        tempList.Free;
        Exit;
      end;
      tempList.Free;

      dmTTT.DeleteStudentRoleDef(1, Role_List_Index);

      if dmTTT.DeleteStudentRoleList(Role_List_Index) then
        ShowMessage('Data has been deleted');
    end;

    UpdateStudentRoleList;
  end;
end;

procedure TfrmAvailableStudentRole.btnUsageClick(Sender: TObject);
begin
  if lstStudentRole.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedStudentRoles.FData.Role_List_Index;
      name_usage := FSelectedStudentRoles.FData.Role_List_Identifier;
      UIndex := 39;

      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;

end;

procedure TfrmAvailableStudentRole.lbSingleClick(Sender: TObject);
begin
  if lstStudentRole.ItemIndex = -1 then
    Exit;
  FSelectedStudentRoles := TStudent_Role_List(lstStudentRole.Items.Objects[lstStudentRole.ItemIndex]);
end;

procedure TfrmAvailableStudentRole.UpdateStudentRoleList;
var
  i : Integer;
  studentroles : TStudent_Role_List;
begin
  lstStudentRole.Clear;
  dmTTT.GetStudentRoleList(FStudentRoleList);

  for i := 0 to FStudentRoleList.Count - 1 do
  begin
    studentroles := FStudentRoleList.Items[i];
    lstStudentRole.Items.AddObject(studentroles.FData.Role_List_Identifier,studentroles);
  end;
end;

procedure TfrmAvailableStudentRole.CopyStudentRoleDefinition( const aStudentRoleIndex, aNewStudentRoleIndex: Integer);
var
  studentRoleList : TList;
  i : Integer;
  studentRoleDef : TStudent_Role_Definition;
begin
  studentRoleList := TList.Create;

  dmTTT.GetStudentRoleDef(aStudentRoleIndex, studentRoleList);

  for i := 0 to studentRoleList.Count - 1 do
  begin
    studentRoleDef := studentRoleList.Items[i];
//
    with studentRoleDef do
    begin
      FData.Role_List_Index := aNewStudentRoleIndex;

      dmTTT.InsertStudentRoleDef(FData);
    end;
  end;

  for i := 0 to studentRoleList.Count - 1 do
  begin
    studentRoleDef := studentRoleList.Items[i];
    studentRoleDef.Free;
  end;

  studentRoleList.Free;
end;

procedure TfrmAvailableStudentRole.edtstudentrolelistKeyPress(Sender: TObject;
  var Key: Char);
  var
 i : Integer;
 studentRoleList : TList;
  studentroles : TStudent_Role_List;
begin
  if Key = #13 then
  begin


   studentRoleList := TList.Create;

//     dmTTT.GetfilterStudentRoleList(FStudentRoleList,edtstudentrolelist.text);
    for i := 0 to FStudentRoleList.Count - 1 do
    begin
    studentroles := FStudentRoleList.Items[i];
    lstStudentRole.Items.AddObject(studentroles.FData.Role_List_Identifier,studentroles);
    end;
  end;
end;

{$ENDREGION}

end.
