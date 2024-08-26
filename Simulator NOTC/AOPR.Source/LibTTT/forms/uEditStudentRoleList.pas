unit uEditStudentRoleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject;

type
  TfEditRoleList = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtStudent: TEdit;
    lbStudent: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    lbTempId: TListBox;
    procedure FormShow(Sender: TObject);
    procedure getStudent;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  fEditRoleList: TfEditRoleList;
  sList        : TList;
implementation

{$R *.dfm}

uses uDataModuleTTT, uStudentRoleList, uStudentRoleListWindow, uOtherSingleList,
ufDBEditor;

procedure TfEditRoleList.btnAddClick(Sender: TObject);
var i:integer;
begin
  lbStudent.Items.Add(edtStudent.Text);
  sList.Add(lbStudent);

  with student_def.FData do begin
    for I := 0 to lbStudent.Count - 1 do begin
      Role_Identifier       := lbStudent.Items[i];
      if fStudentRole.listId <> '' then
        Role_List_Index       := StrToInt(fStudentRole.listId)
      else if fDBEditor.fromDBeditor then
        Role_List_Index       := StrToInt(fOtherSingle.id)
      else
      begin
        dmTTT.GetMaxRecStudent_Role_List(fStudentRoleListWindow.student_list);
        Role_List_Index     := fStudentRoleListWindow.student_list.FData.Role_List_Index;
      end;
    end;
    dmTTT.insertStudent_Def(student_def);
  end;
end;

procedure TfEditRoleList.btnRemoveClick(Sender: TObject);
var i:integer;
begin

  for I := 0 to lbStudent.Count - 1 do begin
    if lbStudent.Selected[i] then begin
      lbStudent.Items.Delete(i);
      getStudent;
      dmTTT.DeleteStudent_Role_Definition(lbTempId.Items[i]);
    end;
  end;
  getStudent;
end;

procedure TfEditRoleList.FormCreate(Sender: TObject);
begin
  slist         := TList.Create;

end;

procedure TfEditRoleList.FormShow(Sender: TObject);
begin
  Caption := fStudentRoleListWindow.edtName.Text;
  getStudent;
end;

procedure TfEditRoleList.getStudent;
var i:integer;
begin

  slist.Clear;
  lbStudent.Clear;
  lbTempId.Clear;

  if fStudentRole.listId <> '' then
    dmTTT.GetStudent_Role_Definition(0,StrToInt(fStudentRole.listId),sList,student_def)
  else
    dmTTT.GetStudent_Role_Definition(0,StrToInt(fOtherSingle.id),sList,student_def);

  for I := 0 to sList.Count - 1 do begin
    lbStudent.Items.Add(TStudent_Role_Definition(sList[i]).FData.Role_Identifier);
    lbTempId.Items.Add(IntToStr(TStudent_Role_Definition(sList[i]).FData.Student_Role_Index));
  end;

end;

end.
