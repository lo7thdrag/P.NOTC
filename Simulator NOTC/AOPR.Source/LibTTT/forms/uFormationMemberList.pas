unit uFormationMemberList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBFormation;

type
  TFormationMemberForm = class(TForm)
    lstFormationPlatform: TListBox;
    btOk: TButton;
    btCancel: TButton;
    lstFormationPlatformIndex: TListBox;
    procedure btCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure refreshFormationList;
  private
    { Private declarations }
  public
    { Public declarations }
    lstFormationIndex: TListBox;
  end;

var
  FormationMemberForm: TFormationMemberForm;
  form: TFormation;

implementation

uses
  uFormationEditorPanel;

{$R *.dfm}

procedure TFormationMemberForm.btCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormationMemberForm.btOkClick(Sender: TObject);
begin
//  if lstFormationPlatform.Selected[lstFormationPlatform.ItemIndex] then
//  begin
//    with FormationEditorPanelForm do
//    begin
//      edtLeaderIndex.Text := lstFormationPlatformIndex.Items.Strings[lstFormationPlatform.ItemIndex];
//      edtLeader.Text := lstFormationPlatform.Items.Strings[lstFormationPlatform.ItemIndex];
//    end;
//  end;
//  Self.Close;
end;

procedure TFormationMemberForm.FormShow(Sender: TObject);
begin
  //get Formation Identifier from uDataModulTTT
  refreshFormationList;
end;

procedure TFormationMemberForm.refreshFormationList;
var idForce, idClass, I:integer;
begin
//  with SimMgr do
//  begin
//    getPlatformInstance(Resource_alloc.FData.Resource_Alloc_Index,Platform_Insts,idForce,idClass);
//    lstFormationPlatform.Items.Clear;
//    lstFormationPlatformIndex.Items.Clear;
//    for I:= 0 to Platform_Insts.Count - 1 do
//    begin
//      if FormationEditorPanelForm.isSelectedIndex(TPlatform_Instance(Platform_Insts[I]).FData.Platform_Instance_Index) then
//      begin
//        lstFormationPlatform.Items.Add(TPlatform_Instance(Platform_Insts[I]).FData.Instance_Name);
//        lstFormationPlatformIndex.Items.Add(inttostr(TPlatform_Instance(Platform_Insts[I]).FData.Platform_Instance_Index));
//      end;
//    end;
//  end;
end;

end.
