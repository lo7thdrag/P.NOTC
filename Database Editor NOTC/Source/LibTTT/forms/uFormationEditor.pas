unit uFormationeditor;

interface 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uDBFormation;

type
  TFormationEditorForm = class(TForm)
    pnlFormation: TPanel;
    btnEdit: TButton;
    btnRemove: TButton;
    btnNew: TButton;
    lstAvailable: TListBox;
    Panel1: TPanel;
    btnFilter: TButton;
    lstAvailableIndex: TListBox;
    btnClose: TButton;
    procedure refreshFormationList;
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure showData;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
//    form: TList;
  public
    { Public declarations }
    index_Selected: Integer;
    FormationIndexInc : Integer; // increment untuk menampung sementara formation index
    FormationDefList : Tlist;  // untuk menampung list Formation definition
    FormationAssignmentList : TList;
  end;

var
  FormationEditorForm: TFormationEditorForm;

  formationDef : TFormation;


implementation

uses

  uFormationEditorPanel, uSimDBEditor, uDataModuleTTT,ufrmSummaryScenario;


{$R *.dfm}

procedure TFormationEditorForm.refreshFormationList;
var
  I: Integer;
begin
//  form.Clear;
//  dmTTT.getFormationDefinition(fPlatformDeploytment.deploy_id, form);

  lstAvailable.Clear;
  lstAvailableIndex.Clear;
  for I := 0 to FormationDefList.Count - 1 do
  begin
    lstAvailable.Items.Add(TFormation(FormationDefList[I]).FFormation_Def.Formation_Identifier);
    lstAvailableIndex.Items.Add(IntToStr(TFormation(FormationDefList[I]).FFormation_Def.Formation_Index));
  end;
end;

procedure TFormationEditorForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormationEditorForm.btnEditClick(Sender: TObject);
begin
  if lstAvailable.ItemIndex <> -1 then
  begin
    with FormationEditorPanelForm do begin
      isNew := false;
      index_Selected := lstAvailable.ItemIndex;
      formation_id := TFormation(FormationDefList[index_Selected]).FFormation_Def.Formation_Index;
      edtName.Text := TFormation(FormationDefList[index_Selected]).FFormation_Def.Formation_Identifier;
      showData;
    end;
  end;
end;

procedure TFormationEditorForm.showData;
begin
  with FormationEditorPanelForm,TFormation(FormationDefList[index_Selected]) do begin
    leader_id := FFormation_Def.Formation_Leader;
    edtLeader.Text  := FPlatform_Instance.Instance_Name;
    force_design  := FFormation_Def.Force_Designation;
    case FFormation_Def.Force_Designation of
      1: edtForce.Text := 'Red';
      2: edtForce.Text := 'Amber';
      3: edtForce.Text := 'Blue';
      4: edtForce.Text := 'Green';
      6: edtForce.Text := 'No Force';
    end;
    case FFormation_Def.Angle_Type of
      0: chkAbsolute.Checked := false;
      1: chkAbsolute.Checked := true;
    end;


    cbbFormationMembers.Text := '';
    edtMemberAltitude.Text := '';
    edtMemberBearing.Text  := '';
    edtMemberRange.Text    := '';


    ShowModal;
  end;
end;

procedure TFormationEditorForm.btnFilterClick(Sender: TObject);
begin
 if btnFilter.Caption = 'Filter >>' then
 begin
 btnFilter.Caption := '<< Filter';
 end
 else if btnFilter.Caption = '<< Filter' then
 begin
 btnFilter.Caption := 'Filter >>';
 end;
end;

procedure TFormationEditorForm.btnNewClick(Sender: TObject);
begin
  FormationIndexInc := FormationIndexInc + 1;
  with FormationEditorPanelForm do begin
    isNew := true;
    edtName.Text    := '(Unnamed)';
    edtLeader.Text  := '';
    edtForce.Text   := '';
    chkAbsolute.Checked := false;
    formation_id  := 0;
    cbbFormationMembers.Items.Clear;
    cbbFormationMembers.Text := '';
    edtMemberAltitude.Text := '';
    edtMemberBearing.Text  := '';
    edtMemberRange.Text    := '';
    ShowModal;
  end;
end;

procedure TFormationEditorForm.btnRemoveClick(Sender: TObject);
var
  i : Integer;
  FormIndex : integer;
begin
 // delete formation assign dahulu kemudian formation definition

  if lstAvailable.ItemIndex <> -1 then
  begin
    dmTTT.deleteAllFormation_Assign(lstAvailableIndex.Items.Strings[lstAvailable.ItemIndex]);
    dmTTT.deleteFormation_Def(lstAvailableIndex.Items.Strings[lstAvailable.ItemIndex]);
    FormIndex := StrToInt(lstAvailableIndex.Items.Strings[lstAvailable.ItemIndex]);

    // delete list

    for I := FormationAssignmentList.Count - 1 downto 0  do
    begin
      if TFormation(FormationAssignmentList.Items[i]).FForm_Assign.Formation_Index = FormIndex then
      begin
        FormationAssignmentList.Delete(i);
      end;
    end;

    for I := 0 to FormationDefList.Count - 1 do
    begin
      if TFormation(FormationDefList.Items[i]).FFormation_Def.Formation_Index = FormIndex then
      begin
        FormationDefList.Delete(i);
        Break;
      end;
    end;

    refreshFormationList;
  end;
end;

procedure TFormationEditorForm.FormCreate(Sender: TObject);
begin
//  form  := TList.Create;
  FormationDefList := TList.Create;
  FormationAssignmentList := TList.Create;
  FormationIndexInc := 0;
end;

procedure TFormationEditorForm.FormShow(Sender: TObject);
begin
  formationDef := TFormation.Create;
  refreshFormationList;
end;

end.
