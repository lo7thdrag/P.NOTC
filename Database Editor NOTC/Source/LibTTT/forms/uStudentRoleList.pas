unit uStudentRoleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject;

type
  TfStudentRole = class(TForm)
    shp1: TShape;
    lbAllStudent: TListBox;
    lbStudentSel: TListBox;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    btnAdd: TButton;
    lbTempIdAll: TListBox;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    lbTempIdSel: TListBox;
    btn1: TButton;
    procedure getStudentRole;
    procedure showStudentRole;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure lbAllStudentDblClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    student_list  : TStudent_Role_List;
  public
    { Public declarations }
    listId        : string;
    isNew         : Boolean;
  end;

var
  fStudentRole  : TfStudentRole;
  pList         : TList;


implementation

{$R *.dfm}

uses uDataModuleTTT, ufrmSummaryStudentRole, ufrmSummaryResourceAllocation, ufrmAvailableResourceAllocation,
  ufrmUsage;

procedure TfStudentRole.btnAddClick(Sender: TObject);

begin
  if lbAllStudent.ItemIndex <> -1 then
  begin
    frmSummaryResourceAllocation.idStuRole := lbTempIdAll.Items[lbAllStudent.ItemIndex];

    showStudentRole;
  end;
end;

procedure TfStudentRole.btnCancelClick(Sender: TObject);
begin
  frmSummaryResourceAllocation.idStuRole := IntToStr(frmSummaryResourceAllocation.ra.FData.Role_List_Index);
  Close;
end;

procedure TfStudentRole.btnCopyClick(Sender: TObject);
begin
  listId := lbTempIdAll.Items.Strings[lbAllStudent.ItemIndex];
  isNew   := True;
  with frmSummaryStudentRole do begin
    edtName.Text := 'Copy of ' + lbAllStudent.Items.Strings[lbAllStudent.ItemIndex];
    ShowModal;
  end;
end;

procedure TfStudentRole.btnEditClick(Sender: TObject);

begin
  if lbAllStudent.ItemIndex = -1 then
    Exit
  else begin
    listId := lbTempIdAll.Items.Strings[lbAllStudent.ItemIndex];
    isNew := False;
    with frmSummaryStudentRole do begin
      edtName.Text := lbAllStudent.Items.Strings[lbAllStudent.ItemIndex];
      ShowModal;
    end;
  end;
end;

procedure TfStudentRole.btnNewClick(Sender: TObject);
begin
  isNew   := True;
  with frmSummaryStudentRole do begin
    edtName.Text  := '';
    ShowModal;
  end;
end;

procedure TfStudentRole.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfStudentRole.btnRemoveClick(Sender: TObject);
var
    warning: Integer;
begin
 if lbStudentSel.ItemIndex <> -1 then
 begin
  warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);
  if warning = mrOK then
  begin
    frmSummaryResourceAllocation.idStuRole := '';
    showStudentRole;
  end;
 end;
end;

procedure TfStudentRole.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmSummaryResourceAllocation.edtNameChange(Sender);
end;

procedure TfStudentRole.FormCreate(Sender: TObject);
begin
  pList        := TList.Create;
  student_list := TStudent_Role_List.Create;
end;

procedure TfStudentRole.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
if GetKeyState(VK_ESCAPE)< 0 then
  begin
    case Msg.CharCode of
     VK_ESCAPE:
     begin
       btnOk.Click;
     end;
    end;
  end;
end;

procedure TfStudentRole.FormShow(Sender: TObject);
begin
  getStudentRole;
end;

procedure TfStudentRole.getStudentRole;
var
sList : TList;
begin
  sList := TList.Create;

//get all student role name
 dmTTT.GetStudent_Role_List(0,pList,student_list);

 showStudentRole;
end;

procedure TfStudentRole.showStudentRole;
var i : integer;
sList : TList;
begin
 lbAllStudent.Items.Clear;
 lbTempIdAll.Items.Clear;
 lbStudentSel.Items.Clear;
 lbTempIdSel.Items.Clear;

 for I := 0 to pList.Count - 1 do
 begin
  if frmSummaryResourceAllocation.idStuRole = IntToStr(TStudent_Role_List(pList[i]).FData.Role_List_Index) then
  begin
    lbStudentSel.Items.Add(TStudent_Role_List(pList[i]).FData.Role_List_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TStudent_Role_List(pList[i]).FData.Role_List_Index));
  end
  else begin
    lbAllStudent.Items.Add(TStudent_Role_List(pList[i]).FData.Role_List_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TStudent_Role_List(pList[i]).FData.Role_List_Index));
  end;
 end;
end;

procedure TfStudentRole.lbAllStudentDblClick(Sender: TObject);
begin
  btnAdd.Click;
end;

end.
