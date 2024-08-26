unit uFormationAddRemMembers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uDBFormation, uGameData_TTT, tttData;

type
  TfrmFormationAddRemMembers = class(TForm)
    lvAvailable: TListView;
    lvMembers: TListView;
    bvl1: TBevel;
    btnClose: TButton;
    btnAdd: TButton;
    btnRemove: TButton;
    lb1: TLabel;
    Label1: TLabel;
    btnEdit: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure lvAvailableSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvMembersSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    ActiveFormation : TFormationRefine;
//    procedure SetformSelected(const Value: TFormation);
    procedure EmptyRec(var rec : TRecEditFormation);
    procedure RefreshList;
    { Private declarations }

  public
//    property formSelected : TFormation read FformSelected write SetformSelected;
    //FormSelected   : TFormation;
    FmSelected   : TFormationRefine;

    procedure UpdateDataList(formation : TFormationRefine);
    { Public declarations }
  end;

var
  frmFormationAddRemMembers: TfrmFormationAddRemMembers;

implementation

uses uSimMgr_Client, uT3Vehicle, uSimObjects, uFormationMembersDetail,
  ufTacticalDisplay;

{$R *.dfm}

procedure TfrmFormationAddRemMembers.btnAddClick(Sender: TObject);
var
  veTarget : TT3Vehicle;
  lv : TListItem;
begin
  if lvAvailable.ItemIndex <> -1 then
  begin
    if lvMembers.Items.Count > 50 then
      Exit;

    lv  := lvAvailable.Items[lvAvailable.ItemIndex];
    if not(Assigned(lv.Data)) then
      Exit;

    veTarget := TT3Vehicle(lv.Data);

    if not(Assigned(veTarget)) then
      Exit;

    if not Assigned(frmFormationMembersDetail) then
      frmFormationMembersDetail := TfrmFormationMembersDetail.Create(self);

    frmFormationMembersDetail.FormationSelectedID := FmSelected.FFormation_Def.Formation_Index;
    frmFormationMembersDetail.VeMembers    := veTarget;
    frmFormationMembersDetail.isAddMembers := True;
    frmFormationMembersDetail.ShowModal;
  end
  else
  begin
    frmTacticalDisplay.addStatus('No Selected Platform Available');
  end;
end;

procedure TfrmFormationAddRemMembers.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFormationAddRemMembers.btnEditClick(Sender: TObject);
var
  veTarget : TT3Vehicle;
  lv : TListItem;
begin
  if lvMembers.ItemIndex <> -1 then
  begin
    lv  := lvMembers.Items[lvMembers.ItemIndex];
    if not(Assigned(lv)) then
      Exit;

    veTarget := TT3Vehicle(lv.Data);

    if not(Assigned(veTarget)) then
      Exit;

    if not Assigned(frmFormationMembersDetail) then
      frmFormationMembersDetail := TfrmFormationMembersDetail.Create(self);

    frmFormationMembersDetail.FormationSelectedID := FmSelected.FFormation_Def.Formation_Index;
    frmFormationMembersDetail.VeMembers    := veTarget;
    frmFormationMembersDetail.isAddMembers := False;
    frmFormationMembersDetail.ShowModal;
  end
  else
  begin
    frmTacticalDisplay.addStatus('No Selected Platform Members');
  end;
end;

procedure TfrmFormationAddRemMembers.btnRemoveClick(Sender: TObject);
var
  veTarget : TT3Vehicle;
  lv : TListItem;
  rec : TRecEditFormation;
begin
  if lvMembers.ItemIndex <> -1 then
  begin
    lv  := lvMembers.Items[lvMembers.ItemIndex];
    if not(Assigned(lv)) then
      Exit;

    veTarget := TT3Vehicle(lv.Data);

    if not(Assigned(veTarget)) then
      Exit;

    EmptyRec(rec);

    rec.OrderID         := CORD_ID_RemoveMember;
    rec.FormationID     := FmSelected.FFormation_Def.Formation_Index;
    rec.FormationName   := FmSelected.FFormation_Def.Formation_Identifier;
    rec.FormationLeader := FmSelected.FFormation_Def.Formation_Leader;
    rec.MemberId        := veTarget.InstanceIndex;

    simMgrClient.netSend_CmdEditFormation(rec);
  end
  else
  begin
    frmTacticalDisplay.addStatus('No Selected Platform Members');
  end;
end;

procedure TfrmFormationAddRemMembers.EmptyRec(var rec: TRecEditFormation);
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

procedure TfrmFormationAddRemMembers.FormCreate(Sender: TObject);
begin
  ActiveFormation := nil;
end;

procedure TfrmFormationAddRemMembers.FormShow(Sender: TObject);
begin
  RefreshList;
end;

procedure TfrmFormationAddRemMembers.lvAvailableSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if lvAvailable.ItemIndex <> -1 then
  begin
    btnAdd.Enabled := True;
    btnRemove.Enabled := False;
    btnEdit.Enabled := False;
  end
  else
  begin
    btnAdd.Enabled := False;
    btnRemove.Enabled := False;
    btnEdit.Enabled := False;
  end;
end;

procedure TfrmFormationAddRemMembers.lvMembersSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if lvMembers.ItemIndex <> -1 then
  begin
    btnAdd.Enabled := False;
    btnRemove.Enabled := True;
    btnEdit.Enabled := True;
  end
  else
  begin
    btnAdd.Enabled := False;
    btnRemove.Enabled := False;
    btnEdit.Enabled := False;
  end;
end;

procedure TfrmFormationAddRemMembers.RefreshList;
begin
  UpdateDataList(FmSelected);
end;

procedure TfrmFormationAddRemMembers.UpdateDataList(formation : TFormationRefine);
var
  ve, fMember: TT3Vehicle;
  lv : TListItem;
  form1, form2 : TFormation;
  i, j, n : Integer;
  objPlat : TSimObject;
  found : Boolean;
  member : TClassFormation_Assignment;
begin
  lvAvailable.Items.Clear;
  ve := nil;

  if Assigned(formation) then
  begin
    for i := 0 to simmgrclient.SimPlatforms.itemCount - 1 do
    begin
      objPlat := Simmgrclient.SimPlatforms.getObject(i);

      // vehicle apa bukan?
      if objPlat is TT3Vehicle then
        ve := TT3Vehicle(objPlat)
      else
      begin
        Continue;
      end;

      // force destinasi sama apa g?
      if ve.Force_Designation <> formation.FFormation_Def.Force_Designation then
        Continue;

      // leader bukan available vehicle
      if ve.InstanceIndex = formation.FFormation_Def.Formation_Leader then
        Continue;

      // apa sudah jadi member atau leader di formasi lain
      if simMgrClient.Scenario.Formation_List_rev.PlatformExistInFormation(ve.InstanceIndex) then
        continue;

      // apa sudah jad member??
      found := formation.MemberExist(ve.InstanceIndex);

      if not(found) then
      begin
        lv         := lvAvailable.Items.Add;
        lv.Caption := ve.InstanceName;
        lv.Data    := ve;
      end;
    end;

    lvMembers.Items.Clear;
    for i := 0 to formation.Count - 1 do
    begin
      member := formation.get(I);
      fMember := simmgrclient.FindT3PlatformByID(member.Platform_Instance_Index) as TT3Vehicle;

      if Assigned(fMember) then
      begin
        lv         := lvMembers.Items.Add;
        lv.Caption := fMember.InstanceName;
        lv.Data    := fMember;
      end;
    end;

    ActiveFormation := formation;

  end
  else
  begin
    frmTacticalDisplay.addStatus('Selected Formation not assigned ');
  end;
end;

//procedure TfrmFormationAddRemMembers.SetformSelected(const Value: TFormation);
//begin
//  FformSelected := Value;
//
//  RefreshList;
//end;

end.
