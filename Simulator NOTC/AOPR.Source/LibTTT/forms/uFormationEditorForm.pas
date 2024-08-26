unit uFormationEditorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uT3Unit, Buttons, uDBScenario,
  uGameData_TTT, tttData;

type
  TfrmFormationEditor = class(TForm)
    spl1: TSplitter;
    btnClose: TButton;
    btnShow: TButton;
    btnAddRemove: TButton;
    btnNew: TSpeedButton;
    btnDelete: TSpeedButton;
    lb1: TLabel;
    lbLeaderFormation: TLabel;
    Bevel32: TBevel;
    lvMemberFormation: TListView;
    lvFormationAvailable: TListView;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddRemoveClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure lvFormationAvailableSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
    procedure EmptyRec(var rec : TRecEditFormation);
  public
    procedure RefreshList;
    { Public declarations }
  end;

var
  frmFormationEditor: TfrmFormationEditor;

implementation

uses
  ufTacticalDisplay, uDBFormation, uSimMgr_Client, uT3Vehicle,
  uFormationAddRemMembers, uFormationEditorPanel;

{$R *.dfm}

procedure TfrmFormationEditor.btnAddRemoveClick(Sender: TObject);
var
  lv : TListItem;
  form : TFormation;
  fm : TFormationRefine;
begin
  if lvFormationAvailable.ItemIndex <> -1 then
  begin
    lv := lvFormationAvailable.Items[lvFormationAvailable.ItemIndex];
    if not(Assigned(lv)) then
      Exit;

    fm := TFormationRefine(lv.Data);
    if not(Assigned(fm)) then
      Exit;

    if not Assigned(frmFormationAddRemMembers) then
      frmFormationAddRemMembers := TfrmFormationAddRemMembers.Create(self);

    frmFormationAddRemMembers.FmSelected := fm;
    frmFormationAddRemMembers.Show;
  end
  else
  begin
    frmTacticalDisplay.addStatus('No Selected Formation');
  end;
end;

procedure TfrmFormationEditor.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFormationEditor.btnDeleteClick(Sender: TObject);
var
  lv : TListItem;
  form : TFormation;
  rec : TRecEditFormation;
  fm : TFormationRefine;
begin
  if lvFormationAvailable.ItemIndex <> -1 then
  begin
    EmptyRec(rec);

    lv := lvFormationAvailable.Items[lvFormationAvailable.ItemIndex];
    if not(Assigned(lv)) then
      Exit;

    fm := TFormationRefine(lv.Data);
    if not(Assigned(fm)) then
      Exit;

    rec.OrderID := CORD_ID_RemoveForm;
    rec.FormationID := fm.FFormation_Def.Formation_Index;
    rec.FormationName := fm.FFormation_Def.Formation_Identifier;
    rec.FormationLeader := fm.FFormation_Def.Formation_Leader;

    simMgrClient.netSend_CmdEditFormation(rec);
  end
  else
  begin
    frmTacticalDisplay.addStatus('No Selected Formation');
  end;
end;

procedure TfrmFormationEditor.btnNewClick(Sender: TObject);
var
  leader : TT3Vehicle;
  lv : TListItem;
  form : TFormation;
  fm : TFormationRefine;
begin
  if lvFormationAvailable.ItemIndex <> -1 then
  begin
    lv := lvFormationAvailable.Items[lvFormationAvailable.ItemIndex];
    if not(Assigned(lv)) then
      Exit;

    // refine
    fm := TFormationRefine(lv.Data);
    if not(Assigned(fm)) then
      Exit;

    leader  := simmgrclient.FindT3PlatformByID(fm.FFormation_Def.Formation_Leader)
               as TT3Vehicle;
    if not(Assigned(leader)) then
      Exit;

    if not Assigned(frmFormationEditorPanelForm) then
      frmFormationEditorPanelForm := TfrmFormationEditorPanelForm.Create(self);

    frmFormationEditorPanelForm.isNew := False;
    frmFormationEditorPanelForm.idFormationSelected := fm.FFormation_Def.Formation_Index;
    frmFormationEditorPanelForm.edtName.Text := fm.FFormation_Def.Formation_Identifier;
    frmFormationEditorPanelForm.PlatformLeader := leader;
    frmFormationEditorPanelForm.Show;
  end
  else
  begin
    if simMgrClient.ControlledPlatform is TT3Vehicle then
    begin

      if not Assigned(frmFormationEditorPanelForm) then
        frmFormationEditorPanelForm := TfrmFormationEditorPanelForm.Create(self);

      frmFormationEditorPanelForm.isNew := True;
      frmFormationEditorPanelForm.idFormationSelected := 0;
      frmFormationEditorPanelForm.edtName.Text := 'New Formation 1';

      if simMgrClient.Scenario.Formation_List_rev.PlatformExistInFormation(simMgrClient.ControlledPlatform.InstanceIndex) then
        frmFormationEditorPanelForm.PlatformLeader := nil
      else
        frmFormationEditorPanelForm.PlatformLeader := TT3Vehicle(simMgrClient.ControlledPlatform);

      frmFormationEditorPanelForm.Show;
    end
    else
    begin
      frmTacticalDisplay.addStatus('Controlled platform not assigned');
    end;
  end;
end;

procedure TfrmFormationEditor.btnShowClick(Sender: TObject);
begin
  if btnShow.Caption = 'Show Members >>' then
  begin
    btnShow.Caption := 'Hide Members <<';
    frmFormationEditor.Height := 470;
  end
  else if btnShow.Caption = 'Hide Members <<' then
  begin
    btnShow.Caption := 'Show Members >>';
    frmFormationEditor.Height := 300;
  end;
end;

procedure TfrmFormationEditor.EmptyRec(var rec: TRecEditFormation);
begin
  with rec do
  begin
    SessionID       := 0;
    OrderID         := 0;
    FormationID     := 0;
    FormationName   := '';
    FormationLeader := 0;
    AngelType       := 0;
    Force           := 0;
    DeploymentId    := 0;

    MemberId        := 0;
    MemberBearing   := 0;
    MemberRange     := 0;
    MemberAltitude  := 0;
  end;
end;

procedure TfrmFormationEditor.FormShow(Sender: TObject);
begin
  btnShow.Enabled       := false;
  btnAddRemove.Enabled  := false;

  if simMgrClient.IsController or simMgrClient.ISWasdal then
  begin
    btnNew.Enabled        := True;
  end
  else
  begin
    btnNew.Enabled        := False;
  end;

  btnShow.Caption := 'Show Members >>';
  frmFormationEditor.Height := 300;

  RefreshList;
end;

procedure TfrmFormationEditor.lvFormationAvailableSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  leader, fMember: TT3Vehicle;
  lv, li : TListItem;
  form, formSelect : TFormation;
  fmSelect : TFormationRefine;
  fa : TClassFormation_Assignment;
  I : Integer;
begin
  if lvFormationAvailable.ItemIndex <> -1 then
  begin
    btnShow.Enabled  := True;

    if simMgrClient.IsController or simMgrClient.ISWasdal then
    begin
      btnNew.Enabled        := True;
      btnDelete.Enabled     := True;
      btnAddRemove.Enabled  := True;
    end
    else
    begin
      btnNew.Enabled        := False;
      btnDelete.Enabled     := False;
      btnAddRemove.Enabled  := False;
    end;

    lv      := lvFormationAvailable.Items[lvFormationAvailable.ItemIndex];
    if not(Assigned(lv)) then
      Exit;

//    formSelect := TFormation(lv.Data);
//    if not(Assigned(formSelect)) then
//      Exit;

    // refine
    fmSelect := TFormationRefine(lv.Data);
    if not(Assigned(fmSelect)) then
      Exit;

    leader  := simmgrclient.FindT3PlatformByID(fmSelect.FFormation_Def.Formation_Leader)
               as TT3Vehicle;
    if not(Assigned(leader)) then
      Exit;

    lbLeaderFormation.Caption  := leader.InstanceName;
    lvMemberFormation.Items.Clear;

    for I := 0 to fmSelect.Count - 1 do
    begin

      fa := fmSelect.get(I);

      if not Assigned(fa) then
        continue;

      fMember := simmgrclient.FindT3PlatformByID(fa.Platform_Instance_Index) as TT3Vehicle;

      if Assigned(fMember) then
      begin
        li         := lvMemberFormation.Items.Add;
        li.Caption := fMember.InstanceName;
        li.SubItems.Add(FloatToStr(fa.Angle_Offset));
        li.SubItems.Add(FloatToStr(fa.Range_from_Leader));
        li.SubItems.Add(FloatToStr(fa.Altitude));
        li.Data    := fa;
      end;

//      form := TFormation(simmgrclient.Scenario.Formation_List[I]);
//      if not(Assigned(form)) then
//        Continue;
//
//      if form.FFormation_Def.Formation_Index <> TFormation(lv.Data).FFormation_Def.Formation_Index then
//        Continue;
//
//      if form.FFormation_Def.Formation_Leader = leader.InstanceIndex then
//      begin
//        fMember := simmgrclient.FindT3PlatformByID(form.FForm_Assign.Platform_Instance_Index)
//                   as TT3Vehicle;
//
//        if Assigned(fMember) then
//        begin
//          li         := lvMemberFormation.Items.Add;
//          li.Caption := fMember.InstanceName;
//          li.SubItems.Add(FloatToStr(form.FForm_Assign.Angle_Offset));
//          li.SubItems.Add(FloatToStr(form.FForm_Assign.Range_from_Leader));
//          li.SubItems.Add(FloatToStr(form.FForm_Assign.Altitude));
//          li.Data    := form;
//        end;
//
//      end;
    end;
  end
  else
  begin
    btnDelete.Enabled     := False;
    btnShow.Enabled       := False;
    btnAddRemove.Enabled  := False;

    lbLeaderFormation.Caption  := '---';
    lvMemberFormation.Items.Clear;
  end;
end;

procedure TfrmFormationEditor.RefreshList;
var
  lv : TlistItem;
  i : Integer;
  fm : TFormationRefine;
begin
  lvMemberFormation.Items.Clear;

  if lvFormationAvailable.Items.Count <> 0 then
    lvFormationAvailable.Items.Clear;

  //refine
  for i := 0 to simmgrclient.Scenario.Formation_List_rev.Count - 1 do
  begin
    lv         := lvFormationAvailable.Items.Add;
    fm         := simmgrclient.Scenario.Formation_List_rev.get(i);

    lv.Caption := fm.FFormation_Def.Formation_Identifier;
    lv.Data    := fm;
  end;

  if lvFormationAvailable.Items.Count <> 0 then
    lvFormationAvailable.ItemIndex := 0;
end;

end.
