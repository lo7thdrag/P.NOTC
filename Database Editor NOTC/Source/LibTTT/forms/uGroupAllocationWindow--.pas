unit uGroupAllocationWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ExtCtrls, ComCtrls, uDBAssetObject
  , newClassASTT, uDBAsset_Deploy;

type
  TGroupAllocationWindowForm = class(TForm)
    pnl1: TPanel;
    lblName: TLabel;
    lblZuluZulu: TLabel;
    lblForce: TLabel;
    edtName: TEdit;
    edtZuluZulu: TEdit;
    edtForce: TEdit;
    pnl2: TPanel;
    grbTrackBlockRange: TGroupBox;
    lblStart: TLabel;
    lblEnd: TLabel;
    edtStart: TEdit;
    edtEnd: TEdit;
    grbMembers: TGroupBox;
    grbExternalComm: TGroupBox;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    btnBrowse: TSpeedButton;
    btnAddMembers: TButton;
    btnRemoveMembers: TButton;
    btnMoveUpMembers: TButton;
    btnMoveDownMembers: TButton;
    btnAddExternalComm: TButton;
    btnRemoveExternalComm: TButton;
    btnMoveUpExternalComm: TButton;
    btnMoveDownExternalComm: TButton;
    lstMembers: TListView;
    lstExternallComm: TListView;
    procedure btnAddMembersClick(Sender: TObject);
    procedure btnRemoveMembersClick(Sender: TObject);
    procedure btnMoveUpMembersClick(Sender: TObject);
    procedure btnMoveDownMembersClick(Sender: TObject);
    procedure ExchangeItems(lv: TListView; const i, j: Integer);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRemoveExternalCommClick(Sender: TObject);
    procedure btnMoveUpExternalCommClick(Sender: TObject);
    procedure btnMoveDownExternalCommClick(Sender: TObject);
    procedure btnAddExternalCommClick(Sender: TObject);
    constructor Create();
    procedure lstMembersChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lstMembersClick(Sender: TObject);
    procedure lstExternallCommClick(Sender: TObject);
    procedure lstExternallCommChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure getGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
    pi : TPlatform_Instance;
    function FindTrackListByMember(const arg: string;const index:integer;var list: TListView): TListItem;
    procedure getData;
  public
    { Public declarations }
    isNew,isCopy : Boolean;
    index        : integer;
    communication    : TExternal_Communication_Channel;
    asset_deployment : TAsset_Deployment;
    cubicle          : TCubicle_Group_Assignment;
  end;

var
  GroupAllocationWindowForm: TGroupAllocationWindowForm;
  cList,comList,excomList  : TList;

implementation

uses uAddMember, uAddExCompChannel, ufScenario,uPlatformDeployment,
uDataModuleTTT, uGroupSelect, uGroupMemberSelection, uDBAsset_Cubicle;

{$R *.dfm}

constructor TGroupAllocationWindowForm.Create;
begin
  //if count member dan chanel o atau 1, maka disable move up and down
 if(Self.lstMembers.Items.Count <= 1)
 then
 begin
    Self.btnMoveUpMembers.Enabled := false;
    Self.btnMoveDownMembers.Enabled := false;
 end;

 if(Self.lstExternallComm.Items.Count <= 1)
 then
 begin
   Self.btnMoveUpExternalComm.Enabled := false;
   Self.btnMoveDownExternalComm.Enabled := false;
 end;
end;

procedure TGroupAllocationWindowForm.btnAddExternalCommClick(Sender: TObject);
begin
 {
  AddExCompChannelForm.Left := (Screen.Width-Width) div 2 ;
  AddExCompChannelForm.Top := (Screen.Height) div 2;

  AddExCompChannelForm.MemberName.Text := '';
  AddExCompChannelForm.ChannelName.Text := '';
  AddExCompChannelForm.verLabel.Caption := '';

  AddExCompChannelForm.Show;
 }
 index  := 2;
 fGroupMemberSelection.Show;
end;

procedure TGroupAllocationWindowForm.btnAddMembersClick(Sender: TObject);
begin
 { AddMemberForm.Left := (Screen.Width-Width) div 2;
  AddMemberForm.Top := (Screen.Height) div 2;
  //bersihkan tulisan2
  AddMemberForm.verLabel.Caption := '';
  AddMemberForm.MemberName.Text := '';

  AddMemberForm.Show;   }
  index := 1;
  fGroupMemberSelection.Show;
end;

procedure TGroupAllocationWindowForm.btnApplyClick(Sender: TObject);
var id:integer;
begin
  if isNew then
  begin
    getData;
    dmTTT.insertCubicle_Groups(cubicle.Cubicle_Group);
    isNew := False;
  end
  else
  begin
    getData;
    if fGroupSelect.idGroup <> '' then
      dmTTT.updateCubicle_Groups(cubicle.Cubicle_Group,fGroupSelect.idGroup)
    else
    begin
      dmTTT.getMaxCubicle_Group(id);
      dmTTT.updateCubicle_Groups(cubicle.Cubicle_Group,IntToStr(id));
    end;
  end;
end;

procedure TGroupAllocationWindowForm.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TGroupAllocationWindowForm.btnMoveDownExternalCommClick(
  Sender: TObject);
var
  Idx1, Idx2: Integer;
begin
  if(lstExternallComm.Selected.Index >= lstExternallComm.Items.Count)
  then
    btnMoveDownExternalComm.Enabled := false;

  Idx1:= lstExternallComm.Selected.Index;
  Idx2:= Idx1 + 1;
  ExchangeItems(lstExternallComm, Idx1, Idx2);
end;

procedure TGroupAllocationWindowForm.btnMoveDownMembersClick(Sender: TObject);
  //move down
  //ExcangeItems(lstMembers, 1, 2);
var
  Idx1, Idx2: Integer;
begin
  if(lstMembers.Selected.Index >= lstMembers.Items.Count)
  then
    btnMoveDownMembers.Enabled := false;
  Idx1:= lstMembers.Selected.Index;
  Idx2:= Idx1 + 1;
  ExchangeItems(lstMembers, Idx1, Idx2);

end;

procedure TGroupAllocationWindowForm.btnMoveUpExternalCommClick(
  Sender: TObject);
var
  Idx1, Idx2: Integer;
begin
  if(lstExternallComm.Selected.Index = 0)
  then
    btnMoveUpExternalComm.Enabled := false;

    Idx1:= lstExternallComm.Selected.Index;
    Idx2:= Idx1 - 1;
    ExchangeItems(lstExternallComm, Idx1, Idx2);

end;

procedure TGroupAllocationWindowForm.btnMoveUpMembersClick(Sender: TObject);
  //move up
  //ExcangeItems(lstMembers, lstMembers.Selected.Index, lstMembers.Selected.Index-1);
var
  Idx1, Idx2: Integer;
begin
  if(lstMembers.Selected.Index = 0)
  then
    btnMoveUpMembers.Enabled := false;
  Idx1:= lstMembers.Selected.Index;
  Idx2:= Idx1 - 1;
  ExchangeItems(lstMembers, Idx1, Idx2);
end;

procedure TGroupAllocationWindowForm.btnOKClick(Sender: TObject);
var id:integer;
begin
  if isNew then
  begin
    getData;
    dmTTT.insertCubicle_Groups(cubicle.Cubicle_Group);
  end
  else
  begin
    getData;
    if fGroupSelect.idGroup <> '' then
       dmTTT.updateCubicle_Groups(cubicle.Cubicle_Group,fGroupSelect.idGroup)
    else
    begin
      dmTTT.getMaxCubicle_Group(id);
      dmTTT.updateCubicle_Groups(cubicle.Cubicle_Group,IntToStr(id));
    end;
  end;
  Close;
  fGroupSelect.getCubicle;
end;

procedure TGroupAllocationWindowForm.getData;
begin
  with cubicle.Cubicle_Group.FData do begin
     if frmScenario.id_scenario <> '' then
      dmTTT.GetAssetDeployment(StrToInt(frmScenario.id_scenario),asset_deployment);
     Group_Identifier  := edtName.Text;
     Deployment_Index  := asset_deployment.FData.Deployment_Index;
     if edtForce.Text = 'Red' then
      Force_Designation := 1
     else if edtForce.Text = 'Yelllow' then
      Force_Designation := 2
     else if edtForce.Text = 'Blue' then
      Force_Designation := 3
     else if edtForce.Text = 'Green' then
      Force_Designation := 4
     else if edtForce.Text = 'No Force' then
      Force_Designation := 5
     else if edtForce.Text = 'NTDS' then
      Force_Designation := 6;

     Track_Block_Start  := StrToInt(edtStart.Text);
     Track_Block_End    := StrToInt(edtEnd.Text);
  end;

end;

procedure TGroupAllocationWindowForm.btnRemoveExternalCommClick(
  Sender: TObject);
begin
  lstExternallComm.DeleteSelected;

end;

procedure TGroupAllocationWindowForm.btnRemoveMembersClick(Sender: TObject);
begin
<<<<<<< uGroupAllocationWindow.pas
  dmTTT.getPlatformInstanceByName(lstMembers.Selected.SubItems[0],
  IntToStr(frmScenario.Scenario.FData.Resource_Alloc_Index),
  IntToStr(frmScenario.force),pi);
  dmTTT.DeleteCubicle_Group_Assignment(pi.FData.Platform_Instance_Index);
=======
  //dmTTT.getPlatformInstanceByName(lstMembers.Selected.SubItems[0],frmScenario.Scenario.FData.Resource_Alloc_Index,frmScenario.force,pi;
  //dmTTT.DeleteCubicle_Group_Assignment(pi.FData.Platform_Instance_Index);
>>>>>>> 1.20
  lstMembers.DeleteSelected;
  //di commit
end;

procedure TGroupAllocationWindowForm.ExchangeItems(lv: TListView; const i, j: Integer);
var
tempLI : TListItem;
begin
  lv.Items.BeginUpdate;
  try
    tempLI := TListItem.Create(lv.Items);
    tempLI.Assign(lv.Items.Item[i]);
    lv.Items.Item[i].Assign(lv.Items.Item[j]);
    lv.Items.Item[j].Assign(tempLI);
    tempLI.Free;
  finally
    lv.Items.EndUpdate;
  end;
end;


procedure TGroupAllocationWindowForm.FormCreate(Sender: TObject);
begin
  cubicle       := TCubicle_Group_Assignment.Create;
  cList         := TList.Create;
  comList       := TList.Create;
  communication := TExternal_Communication_Channel.Create;
  asset_deployment  := TAsset_Deployment.Create;
  pi            := TPlatform_Instance.Create;
end;

procedure TGroupAllocationWindowForm.FormShow(Sender: TObject);
begin
  getGroup;
end;

procedure TGroupAllocationWindowForm.getGroup;
var i,id,j:integer;
     s,t : string;
  li,list : TListItem;
  cubic  : TCubicle_Group_Assignment;
begin

  if isNew then
  begin
    lstMembers.Items.Clear;
    lstExternallComm.Items.Clear;
    edtName.Text       := '';
    edtZuluZulu.Text   := '';
    with frmScenario do begin
      if rgforce.ItemIndex = 0 then
        edtForce.Text := 'Red'
      else if rgforce.ItemIndex = 1 then
        edtForce.Text := 'Yellow'
      else if rgforce.ItemIndex = 2 then
        edtForce.Text := 'Blue'
      else if rgforce.ItemIndex = 3 then
        edtForce.Text := 'Green'
      else if rgforce.ItemIndex = 4 then
        edtForce.Text := 'No Force'
      else if rgforce.ItemIndex = 5 then
        edtForce.Text := 'NTDS';
    end;
    edtStart.Text      := '1000';
    edtEnd.Text        := '1999';
  end
  else
  begin

    cubic  := TCubicle_Group_Assignment.Create;

    if fGroupSelect.idGroup <> '' then
      dmTTT.getCubicle_GroupsByGroup(StrToInt(fGroupSelect.idGroup),cubicle.Cubicle_Group)
    else
    begin
      dmTTT.getMaxCubicle_Group(id);
      dmTTT.getCubicle_GroupsByGroup(id,cubicle.Cubicle_Group);
    end;

    with cubicle.Cubicle_Group do begin
      if isCopy then
        edtName.Text  := 'Copy of ' + FData.Group_Identifier
      else
        edtName.Text  := cubicle.Cubicle_Group.FData.Group_Identifier;
      if FData.Force_Designation = 1 then
        edtForce.Text := 'Red'
      else if FData.Force_Designation = 2 then
        edtForce.Text := 'Yellow'
      else if FData.Force_Designation = 3 then
        edtForce.Text := 'Blue'
      else if FData.Force_Designation = 4 then
        edtForce.Text := 'Green'
      else if FData.Force_Designation = 5 then
        edtForce.Text := 'No Force'
      else if FData.Force_Designation = 6 then
        edtForce.Text := 'NTDS';
      edtStart.Text   := IntToStr(FData.Track_Block_Start);
      edtEnd.Text     := IntToStr(FData.Track_Block_End);
    end;

    lstMembers.Items.Clear;
    lstExternallComm.Items.Clear;

    with cubicle do begin
      if fGroupSelect.idGroup <> '' then
        dmTTT.GetAllCubicle_Group_Assignment(StrToInt(fGroupSelect.idGroup),cList)
      else
      begin
        dmTTT.getMaxCubicle_Group(id);
        dmTTT.GetAllCubicle_Group_Assignment(id,cList);
      end;
      for i := 0 to cList.Count - 1 do
      begin
        id := TCubicle_Group_Assignment(cList[i]).FCubicle.Platform_Instance_Index;
        dmTTT.getCubicle_GroupMemberByPlatform(id,cubic);

        s     := cubic.FPlatform.Instance_Name;
        li    := FindTrackListByMember(s,0,lstMembers);

        if li = nil then begin
          li := lstMembers.Items.Add;
          li.Caption := IntToStr(i);
          li.SubItems.Add(s);
          li.Data := cubic;
        end;
      end;

      if fGroupSelect.idGroup <> '' then
        dmTTT.GetAllCubicle_Group_Channel_Assgnmnt(StrToInt(fGroupSelect.idGroup),comList)
      else
      begin
        dmTTT.getMaxCubicle_Group(id);
        dmTTT.GetAllCubicle_Group_Channel_Assgnmnt(id,comList);
      end;
      for j := 0 to comList.Count - 1 do
      begin
        id := TCubicle_Group_Assignment(comList[j]).FChannel.Comms_Channel_Index;
        dmTTT.GetExternal_Communication_Channel(excomList,'',IntToStr(id),communication);

        t     := communication.FData.Channel_Identifier;
        list  := FindTrackListByMember(t,1,lstExternallComm);

        if list = nil then begin
          list := lstExternallComm.Items.Add;
          list.Caption  := IntToStr(j);
          list.SubItems.Add(IntToStr(communication.FData.Channel_Number));
          list.SubItems.Add(communication.FData.Channel_Identifier);
          list.Data := communication;
        end;
      end;
    end;
  end;
end;


function TGroupAllocationWindowForm.FindTrackListByMember(const arg: string;const index:integer;
var list: TListView): TListItem;
var i: Integer;
  f  : Boolean;
  li: TListItem;
begin
  result := nil;

  f := False;
  i := 0;
  while not f and (i < list.Items.Count) do begin
    li := list.Items.Item[i];

    f := False;
    f := SameText(li.SubItems[index], arg);

    Inc(i);
  end;
  if f then
    Result := li;
end;

procedure TGroupAllocationWindowForm.lstExternallCommChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  if(Self.lstExternallComm.Items.Count <= 1)
  then
    begin
      btnMoveUpExternalComm.Enabled := false;
      btnMoveDownExternalComm.Enabled := false;
    end
  else if (Self.lstExternallComm.Items.Count > 1)
  then
    begin
      btnMoveUpExternalComm.Enabled := true;
      btnMoveDownExternalComm.Enabled := true;
    end
end;

procedure TGroupAllocationWindowForm.lstExternallCommClick(Sender: TObject);
begin
  if lstExternallComm.Selected <> nil then
  begin
  if(Self.lstExternallComm.Selected.Index = lstExternallComm.Items.Count-1)
  then
    begin
      btnMoveDownExternalComm.Enabled := false;
    end
  else if (Self.lstExternallComm.Selected.Index = 0)
  then
    begin
      btnMoveUpExternalComm.Enabled := false;
    end
  else if(Self.lstExternallComm.Items.Count >= 2)
  then
      begin
      btnMoveUpExternalComm.Enabled := true;
      btnMoveDownExternalComm.Enabled := true;
      end
  end;
end;

procedure TGroupAllocationWindowForm.lstMembersChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  if(Self.lstMembers.Items.Count <= 1)
  then
  begin
    btnMoveUpMembers.Enabled := false;
    btnMoveDownMembers.Enabled := false;
  end
  else
  begin
    btnMoveUpMembers.Enabled := true;
    btnMoveDownMembers.Enabled := true;
  end;
end;

procedure TGroupAllocationWindowForm.lstMembersClick(Sender: TObject);
begin
  if lstMembers.Selected <> nil then
  begin
  if(Self.lstMembers.Selected.Index = lstMembers.Items.Count-1)
  then
    begin
      btnMoveDownMembers.Enabled := false;
    end
  else if (Self.lstMembers.Selected.Index = 0)
  then
    begin
      btnMoveUpMembers.Enabled := false;
    end
  else
    begin
    if(Self.lstMembers.Items.Count >= 2)
      then
      begin
      btnMoveUpMembers.Enabled := true;
      btnMoveDownMembers.Enabled := true;
      end
    end;
  end
end;

end.
