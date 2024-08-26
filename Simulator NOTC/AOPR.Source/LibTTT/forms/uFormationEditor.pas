unit uFormationeditor;

interface 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uDBFormation;

type
  TFormationEditorForm = class(TForm)
    pnlFormation: TPanel;
    lblSelected: TLabel;
    lblAvailable: TLabel;
    lstSelected: TListBox;
    btnEdit2: TButton;
    btnRemove: TButton;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btnAdd: TButton;
    lstAvailable: TListBox;
    Panel1: TPanel;
    btnClose: TButton;
    btnFilter: TButton;
    lstAvailableIndex: TListBox;
    lstSelectedIndex: TListBox;
    procedure refreshFormationList;
    procedure clearFormationEditorPanel;
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEdit2Click(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure lstAvailableClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure sendSelectedToFormationEditor;
  private
    { Private declarations }
  public
    { Public declarations }
    indexFormationSelected: Integer;
  end;

var
  FormationEditorForm: TFormationEditorForm;
  form: TList;
  formationDef : TFormation;

implementation

uses

  uFormationEditorPanel, uSimDBEditor, uPlatformDeployment, uDataModuleTTT,ufScenario;


{$R *.dfm}

procedure TFormationEditorForm.refreshFormationList;
var
  I: Integer;
  temp: string;
begin

  with SIMMgr do
  begin


     dmTTT.getFormationDefinition(idFocusedPlatform, Formation);
     if Formation.Count <> 0 then
     begin

      form := TList.Create;
      getFormationDefinition(frmScenario.selectedScenario, form);
      temp := IntToStr(frmScenario.selectedScenario);

      lstAvailable.Clear;
      lstSelected.Clear;
      for I := 0 to form.Count - 1 do
      begin
      temp := TFormation(form[I]).FFormation_Def.Formation_Identifier;
      lstAvailable.Items.Add(temp);
      lstAvailableIndex.Items.Add(IntToStr(TFormation(form[I]).FFormation_Def.Formation_Index));
      end;
     end;
  end;
end;

procedure TFormationEditorForm.btnAddClick(Sender: TObject);
var I: Integer;
begin
  for I := 0 to lstAvailable.Items.Count - 1 do
   if lstAvailable.Selected[I] then
   begin
    // tambahkan pada Selected list
    lstSelected.Items.Add(lstAvailable.Items.Strings[lstAvailable.ItemIndex]);
    lstSelectedIndex.Items.Add(lstAvailableIndex.Items.Strings[lstAvailable.ItemIndex]);
   end;

 for I :=lstAvailable.Items.Count - 1 downto 0 do
   if lstAvailable.Selected[I] then
   begin
    lstAvailable.Items.Delete(I);
    lstAvailableIndex.Items.Delete(I);
   end;
end;

procedure TFormationEditorForm.btnCloseClick(Sender: TObject);
begin

  Self.Close;
end;

procedure TFormationEditorForm.btnEdit2Click(Sender: TObject);
begin
  if lstAvailable.Selected[lstSelected.ItemIndex] then
  begin
    FormationEditorPanelForm.btnBrowse.Enabled := true;
    FormationEditorPanelForm.grbMembers.Visible := true;
    FormationEditorPanelForm.grbMembers.Enabled := true;

    FormationEditorPanelForm.edtName.Text := lstSelected.Items.Strings[lstSelected.ItemIndex];
    FormationEditorPanelForm.Show;
  end;
  //get value Formation item selected in lstSelected
end;

procedure TFormationEditorForm.btnEditClick(Sender: TObject);
begin
  FormationEditorPanelForm.isNew := false;
  indexFormationSelected := StrToInt(lstAvailableIndex.Items.Strings[lstAvailable.ItemIndex]);
  if lstAvailable.Selected[lstAvailable.ItemIndex] then
  begin
    FormationEditorPanelForm.edtName.Text := lstAvailable.Items.Strings[lstAvailable.ItemIndex];
    FormationEditorPanelForm.idFormationSelected := lstAvailableIndex.Items.Strings[lstAvailable.ItemIndex];
    FormationEditorPanelForm.edtForce.Text := IntToStr(formationDef.FFormation_Def.Force_Designation);
    FormationEditorPanelForm.edtLeaderIndex.Text := IntToStr(formationDef.FFormation_Def.Formation_Leader);
    FormationEditorPanelForm.Show;
  end;
  //get value Formation item selected in lstAvailable

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
  FormationEditorPanelForm.isNew := true;
  FormationEditorPanelForm.Show;
end;

procedure TFormationEditorForm.btnRemoveClick(Sender: TObject);
  var I     : integer;
begin
 for I := 0 to lstSelected.Items.Count - 1 do
   if lstSelected.Selected[I] then
   begin
    lstAvailable.Items.Add(lstSelected.Items.Strings[lstSelected.ItemIndex]);
    lstAvailableIndex.Items.Add(lstSelectedIndex.Items.Strings[lstSelected.ItemIndex]);
   end;
 for I :=lstSelected.Items.Count - 1 downto 0 do
   if lstSelected.Selected[I] then
   begin
    lstSelected.Items.Delete(I);
    lstSelectedIndex.Items.Delete(I);
   end;
end;

procedure TFormationEditorForm.FormShow(Sender: TObject);
begin
  btnAdd.Enabled := false;
  formationDef := TFormation.Create;
  refreshFormationList;
end;

procedure TFormationEditorForm.lstAvailableClick(Sender: TObject);
begin
  if (lstAvailable.ItemIndex > -1) and (lstAvailable.ItemIndex < lstAvailable.Count) then
    //actifkan tombol add
    btnAdd.Enabled := true;
end;

procedure TFormationEditorForm.clearFormationEditorPanel;
begin
  with FormationEditorPanelForm do
  begin
    edtName.Text := '';
    edtForce.Text := '';
    edtAltitude.Text := '';
    edtRange.Text := '';
    edtBearing.Text := '';

    cbxTop.Text := '';
    cbAbsolute.Checked := false;
    cbxMembers.Text := '';
  end;
end;

{*send the selection to formationEditor*}
procedure TFormationEditorForm.sendSelectedToFormationEditor;
var
  I: Integer;
begin
  for I := 0 to lstSelectedIndex.Count - 1 do
  begin
    FormationEditorPanelForm.lstPlatformSelectedIndex.Items.Add(lstSelectedIndex.Items.Strings[I]);
  end;
end;

end.
