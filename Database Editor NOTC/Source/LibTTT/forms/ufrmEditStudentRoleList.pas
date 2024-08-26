unit ufrmEditStudentRoleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject, Vcl.Imaging.pngimage;

type
  TfrmEditRoleList = class(TForm)
    ImgBackgroundForm: TImage;
    ImgHeader: TImage;
    Label1: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    grbStudentRole: TGroupBox;
    lbl1: TLabel;
    edtStudent: TEdit;
    lbStudent: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    btnEdit: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure edtStudentKeyPress(Sender: TObject; var Key: Char);
    procedure lbStudentClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);

  private
    FSelectedStudentRole : TStudent_Role_List;

    FRoleDefList : TList;
    FSelectedStudentRoleDef : TStudent_Role_Definition;

    function CekInput: Boolean;
    procedure UpdateStudentRoleList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    property SelectedStudentRole : TStudent_Role_List read FSelectedStudentRole write FSelectedStudentRole;

  end;

var
  frmEditRoleList: TfrmEditRoleList;
  sList        : TList;
implementation

{$R *.dfm}

uses
  uDataModuleTTT, uStudentRoleList, ufrmSummaryStudentRole, ufrmAdminMainForm;

{$REGION ' Form Handle '}

procedure TfrmEditRoleList.FormCreate(Sender: TObject);
begin
  FRoleDefList := TList.Create;
end;

procedure TfrmEditRoleList.FormShow(Sender: TObject);
begin
  Caption := FSelectedStudentRole.FData.Role_List_Identifier;

  UpdateStudentRoleList;

  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}
procedure TfrmEditRoleList.btnAddClick(Sender: TObject);
var
  roleDef : TStudent_Role_Definition;
begin
  if not CekInput then
  begin
    Exit;
  end;

  roleDef := TStudent_Role_Definition.Create;

  with roleDef do
  begin
    FData.Role_Identifier := edtStudent.Text;
    FData.Role_List_Index := FSelectedStudentRole.FData.Role_List_Index;

    dmTTT.InsertStudentRoleDef(FData);
  end;

  roleDef.Free;

  UpdateStudentRoleList;

  btnCancel.Enabled := False;
end;

procedure TfrmEditRoleList.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmEditRoleList.btnEditClick(Sender: TObject);
begin
  if lbStudent.ItemIndex = -1 then
  begin
    ShowMessage('Select Student Role... !');
    Exit;
  end;

  if not CekInput then
  begin
    Exit;
  end;

  with FSelectedStudentRoleDef do
  begin
    FData.Role_Identifier := edtStudent.Text;

    dmTTT.UpdateStudentRoleDef(FData);
  end;

  UpdateStudentRoleList;

  AfterClose := True;
  btnCancel.Enabled := False;
end;

procedure TfrmEditRoleList.btnOKClick(Sender: TObject);
begin
  AfterClose := True;
  Close;
end;

procedure TfrmEditRoleList.btnRemoveClick(Sender: TObject);
begin
  if lbStudent.ItemIndex = -1 then
  begin
    ShowMessage('Select Student Role... !');
    Exit;
  end;

  with FSelectedStudentRoleDef.FData do
    dmTTT.DeleteStudentRoleDef(2, Student_Role_Index);

  UpdateStudentRoleList;

  btnCancel.Enabled := False;
end;

function TfrmEditRoleList.CekInput: Boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtStudent.Text = '') or (edtStudent.Text = ' ') then
  begin
    ShowMessage('Please use another class name');
    Exit;
  end;

  {Jika berisi spasi semua}
  if Copy(edtStudent.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtStudent.Text);
    numSpace := 0;

    for i := 1 to chkSpace do
    begin
      if edtStudent.Text[i] = #32 then
      numSpace := numSpace + 1;
    end;

    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfrmEditRoleList.edtStudentKeyPress(Sender: TObject; var Key: Char);
begin
  btnAdd.Enabled := True;
end;

procedure TfrmEditRoleList.lbStudentClick(Sender: TObject);
begin
  if lbStudent.ItemIndex = -1 then
    Exit;

  FSelectedStudentRoleDef := TStudent_Role_Definition(lbStudent.Items.Objects[lbStudent.ItemIndex]);
  edtStudent.Text := FSelectedStudentRoleDef.FData.Role_Identifier;

end;

procedure TfrmEditRoleList.UpdateStudentRoleList;
var
  i : Integer;
  roleDef : TStudent_Role_Definition;
begin
  edtStudent.Text := '';

  lbStudent.Items.Clear;

  dmTTT.GetStudentRoleDef(FSelectedStudentRole.FData.Role_List_Index,
    FRoleDefList);

  for i := 0 to FRoleDefList.Count - 1 do
  begin
    roleDef := FRoleDefList.Items[i];
    lbStudent.Items.AddObject(roleDef.FData.Role_Identifier, roleDef);
  end;
end;

{$ENDREGION}
end.
