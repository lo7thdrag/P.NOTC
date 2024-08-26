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
    lbFormationPlatformForce: TListBox;
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
  uSimDBEditor, uDBAssetObject, uFormationEditorPanel, ufrmSummaryScenario,
  uDataModuleTTT, uFormationeditor;

{$R *.dfm}

procedure TFormationMemberForm.btCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormationMemberForm.btOkClick(Sender: TObject);
var
  warning, i : integer;
  FormAssgn : TFormation;
begin
  if lstFormationPlatform.ItemIndex <> -1 then
  begin
    if (FormationEditorPanelForm.force_design <>
       StrToInt(lbFormationPlatformForce.Items.Strings[lstFormationPlatform.ItemIndex])) and
       (not (FormationEditorPanelForm.isNew)) then
    begin
      if FormationEditorForm.FormationAssignmentList.Count > 0 then
      begin
        warning := MessageDlg('Do you want to switch to other force?All members will be removed!!',mtWarning,[mbYes,mbNo],0);
        if warning = mrYes then
        begin
          for I := FormationEditorForm.FormationAssignmentList.Count - 1 downto 0 do
          begin
            FormAssgn := TFormation(FormationEditorForm.FormationAssignmentList.Items[i]);
            if FormAssgn.FForm_Assign.Formation_Index = FormationEditorPanelForm.formation_id then
            begin
              FormationEditorForm.FormationAssignmentList.Delete(i);      // delete di list
              dmTTT.deleteFormation_Assign(IntToStr(FormationEditorPanelForm.formation_id),
               IntToStr(FormAssgn.FForm_Assign.Platform_Instance_Index));  //delete juga di database
            end;
          end;
        end;
      end;
      with FormationEditorPanelForm do
      begin
        edtLeader.Text := lstFormationPlatform.Items.Strings[lstFormationPlatform.ItemIndex];
        leader_id      := StrToInt(lstFormationPlatformIndex.Items.Strings[lstFormationPlatform.ItemIndex]);
        force_design   := StrToInt(lbFormationPlatformForce.Items.Strings[lstFormationPlatform.ItemIndex]);
        case force_design of
          1: edtForce.Text  := 'Red';
          2: edtForce.Text  := 'Amber';
          3: edtForce.Text  := 'Blue';
          4: edtForce.Text  := 'Green';
          6: edtForce.Text  := 'No Force';
        end;
        grpFormationMember.Enabled := false;
        FormationEditorPanelForm.FormShow(FormationEditorPanelForm);
      end;
      Self.Close;
    end
    else
    begin
      with FormationEditorPanelForm do
       begin
      //           formation_id   := formationDef.FFormation_Def.Formation_Index;
         edtLeader.Text := lstFormationPlatform.Items.Strings[lstFormationPlatform.ItemIndex];
         leader_id      := StrToInt(lstFormationPlatformIndex.Items.Strings[lstFormationPlatform.ItemIndex]);
         force_design   := StrToInt(lbFormationPlatformForce.Items.Strings[lstFormationPlatform.ItemIndex]);
         case force_design of
           1: edtForce.Text  := 'Red';
           2: edtForce.Text  := 'Amber';
           3: edtForce.Text  := 'Blue';
           4: edtForce.Text  := 'Green';
           6: edtForce.Text  := 'No Force';
         end;
         grpFormationMember.Enabled := false;
       end;
      Self.Close;
    end;
  end;
end;

procedure TFormationMemberForm.FormShow(Sender: TObject);
begin
  //get Formation Identifier from uDataModulTTT
  refreshFormationList;
end;

procedure TFormationMemberForm.refreshFormationList;
var  I,j,k:integer;
 aObjFormationDef,aObjFormationAssign : TFormation;
 aPlat : TPlatform_Instance;
 isFoundLeader, isFoundAssign : Boolean;
begin
  lstFormationPlatform.Items.Clear;
  lstFormationPlatformIndex.Items.Clear;
  lbFormationPlatformForce.Items.Clear;
  for I:= 0 to SIMMgr.Platform_Insts.Count - 1 do
  begin
    aPlat := TPlatform_Instance(SIMMgr.Platform_Insts.Items[i]);
    isFoundLeader := False;
    isFoundAssign := False;

    //buat fungsi cek platform yang sudah digunakan
    for j := 0 to FormationEditorForm.FormationDefList.Count - 1 do
    begin
      aObjFormationDef := TFormation(FormationEditorForm.FormationDefList.Items[j]);
      if aObjFormationDef.FFormation_Def.Formation_Leader <> aPlat.FData.Platform_Instance_Index then
      begin
        isFoundLeader := False;
        Continue;
      end
      else
      begin
        isFoundLeader := True;
        Break;
      end;
    end;

    if not isFoundLeader then
    begin
      for k := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
      begin
        aObjFormationAssign := TFormation(FormationEditorForm.FormationAssignmentList.Items[k]);
        if aObjFormationAssign.FForm_Assign.Platform_Instance_Index <> aPlat.FData.Platform_Instance_Index then
        begin
          isFoundAssign := False;
          Continue;
        end
        else
        begin
          isFoundAssign := True;
          Break;
        end;
      end;
      if not isFoundAssign then
      begin
        lstFormationPlatform.Items.Add(TPlatform_Instance(SIMMgr.Platform_Insts[i]).FData.Instance_Name);
        lstFormationPlatformIndex.Items.Add(IntToStr(TPlatform_Instance(SIMMgr.Platform_Insts[i]).FData.Platform_Instance_Index));
        lbFormationPlatformForce.Items.Add(IntToStr(TPlatform_Instance(SIMMgr.Platform_Insts[i]).FData.Force_Designation));
      end;
    end;

  end;
end;

end.
