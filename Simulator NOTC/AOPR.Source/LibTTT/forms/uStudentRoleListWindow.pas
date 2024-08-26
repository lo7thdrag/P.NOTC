unit uStudentRoleListWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject;

type
  TfStudentRoleListWindow = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtName: TEdit;
    btnEditList: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    btnOk: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure getData;
    procedure btnEditListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    isNew : Boolean;
    student_list  : TStudent_Role_List;
  end;

var
  fStudentRoleListWindow: TfStudentRoleListWindow;
  student_def           : TStudent_Role_Definition;

implementation

{$R *.dfm}
uses uDataModuleTTT,uStudentRoleList, uEditStudentRoleList, ufDBEDitor, uOtherSingleList;

procedure TfStudentRoleListWindow.btnEditListClick(Sender: TObject);
begin
  fEditRoleList.Show;
end;

procedure TfStudentRoleListWindow.btnApplyClick(Sender: TObject);
var i:integer;
begin
  if isNew then
  begin
    getData;
    dmTTT.insertStudent_List(student_list);
    isNew := False;
    btnEditList.Enabled := True;
  end
  else
  begin
    getData;

    with fEditRoleList do begin
      for I := 0 to lbStudent.Count - 1 do begin
        if lbTempId = nil then
           dmTTT.insertStudent_Def(student_def);
      end;
    end;
    dmTTT.updateStudent_List(student_list,IntToStr(student_list.FData.Role_List_Index));
  end;
end;

procedure TfStudentRoleListWindow.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfStudentRoleListWindow.btnOkClick(Sender: TObject);
var i :integer;
begin
  btnApplyClick(Sender);
  Close;
  if fDBEditor.fromDBeditor then
    fOtherSingle.refresh
  else
    fStudentRole.getStudentRole;
end;

procedure TfStudentRoleListWindow.FormCreate(Sender: TObject);
begin
  student_def   := TStudent_Role_Definition.Create;
  student_list  := TStudent_Role_List.Create;
end;

procedure TfStudentRoleListWindow.FormShow(Sender: TObject);
begin
   if isNew then
      btnEditList.Enabled := False
   else
      btnEditList.Enabled := True;
end;

procedure TfStudentRoleListWindow.getData;
var i:integer;
begin
  with student_list.FData do begin
    Role_List_Identifier  := edtName.Text;
  end;

  with fEditRoleList do begin
    with student_def.FData do begin
      for I := 0 to lbStudent.Count - 1 do begin
        Role_Identifier       := lbStudent.Items[i];
        if fStudentRole.listId <> '' then
          Role_List_Index       := StrToInt(fStudentRole.listId)
        else
        begin
          dmTTT.GetMaxRecStudent_Role_List(student_list);
          Role_List_Index     := student_list.FData.Role_List_Index;
        end;
      end;
    end;
  end;
end;

end.
