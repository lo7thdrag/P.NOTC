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
    procedure getStudentRole;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);

  private
    { Private declarations }
    student_list  : TStudent_Role_List;
  public
    { Public declarations }
    listId        : string;
    idStudent     : string;
  end;

var
  fStudentRole  : TfStudentRole;
  pList         : TList;


implementation

{$R *.dfm}

uses uDataModuleTTT, uStudentRoleListWindow, uResourceAllocation, uRAList;

procedure TfStudentRole.btnAddClick(Sender: TObject);
var i:integer;
begin
  for I := 0 to lbAllStudent.Items.Count - 1 do
   if lbAllStudent.Selected[I] then
   begin
    if lbStudentSel.Count = 0 then
      begin
        lbStudentSel.Items.Clear;
        lbStudentSel.Items.Add(lbAllStudent.Items[I]);
        idStudent :=lbTempIdAll.Items[I];
      end
    else begin
      lbStudentSel.Items.Add(lbAllStudent.Items[i]);
      lbAllStudent.Items.Add(lbStudentSel.Items[0]);
      idStudent :=lbTempIdAll.Items[I];
    end;
   end;

end;

procedure TfStudentRole.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfStudentRole.btnCopyClick(Sender: TObject);
begin
  dmTTT.GetStudent_Role_List(StrToInt(lbTempIdAll.Items.Strings[lbAllStudent.ItemIndex]),pList, student_list);
  student_list.FData.Role_List_Identifier := 'Copy Of ' + lbAllStudent.Items.Strings[lbAllStudent.ItemIndex];
  dmTTT.insertStudent_List(student_list);
  getStudentRole;
end;

procedure TfStudentRole.btnEditClick(Sender: TObject);
var i:integer;
begin
  if lbAllStudent.ItemIndex = -1 then
    Exit
  else begin
    listId := lbTempIdAll.Items.Strings[lbAllStudent.ItemIndex];
    with fStudentRoleListWindow do begin
      isNew := False;
      edtName.Text := lbAllStudent.Items.Strings[lbAllStudent.ItemIndex];
      Show;
    end;
  end;
end;

procedure TfStudentRole.btnNewClick(Sender: TObject);
begin
  with fStudentRoleListWindow do begin
    isNew         := True;
    edtName.Text  := '';
    Show;
  end;
end;

procedure TfStudentRole.btnOkClick(Sender: TObject);
begin
  if idStudent = '' then
    idStudent := lbTempIdSel.Items[0];
  Close;
end;

procedure TfStudentRole.btnRemoveClick(Sender: TObject);
var i:integer;
begin
  for I := 0 to lbStudentSel.Count - 1 do begin
   if lbStudentSel.Selected[I] then
   begin
      lbAllStudent.Items.Add(lbStudentSel.Items[i]);
      lbStudentSel.Items.Delete(I);
      getStudentRole;
   end;
  end;
end;

procedure TfStudentRole.FormCreate(Sender: TObject);
begin
  pList        := TList.Create;
  student_list := TStudent_Role_List.Create;
end;

procedure TfStudentRole.FormShow(Sender: TObject);
begin
  getStudentRole;
end;

procedure TfStudentRole.getStudentRole;
var i,j,id : integer;
sList : TList;
begin
  sList := TList.Create;

 lbAllStudent.Items.Clear;
 lbTempIdAll.Items.Clear;

//get all vehicle name
 dmTTT.GetStudent_Role_List(0,pList,student_list);

 for I := 0 to pList.Count - 1 do
 begin
    lbAllStudent.Items.Add(TStudent_Role_List(pList[i]).FData.Role_List_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TStudent_Role_List(pList[i]).FData.Role_List_Index));
 end;

 if ResourceAllocationForm.isnew = False then
 begin
   if fRAList.RA_id <> '' then
   begin
    lbStudentSel.Items.Clear;
    lbTempIdSel.Items.Clear;
    dmTTT.GetStudentRoleByResource(StrToInt(fRAList.RA_id),sList);
    for j := 0 to sList.Count - 1 do
    begin
      lbStudentSel.Items.Add(TStudent_Role_List(sList[j]).FData.Role_List_Identifier);
      lbTempIdSel.Items.Add(IntToStr(TStudent_Role_List(sList[j]).FData.Role_List_Index));
    end;
   end;
 end;
end;

end.
