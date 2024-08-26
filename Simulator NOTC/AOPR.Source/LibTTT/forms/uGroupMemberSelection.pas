unit uGroupMemberSelection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject, newClassASTT;

type
  TfGroupMemberSelection = class(TForm)
    shp1: TShape;
    lbAllMember: TListBox;
    lbMemberSel: TListBox;
    btnRemove: TButton;
    btnAdd: TButton;
    shp2: TShape;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    pnl1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure getGroupMember;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    pi      : TPlatform_Instance;
    { Public declarations }
    idGroup : string;
  end;

var
  fGroupMemberSelection: TfGroupMemberSelection;
  groupList,commList,channel   : TList;
  external_comm        : TExternal_Communication_Channel;

implementation

{$R *.dfm}

uses uDataModuleTTT, uResurceAllocationSelect, ufScenario,
uGroupAllocationWindow,  uGroupSelect, uAvailableScenario, uDBAsset_Cubicle;


procedure TfGroupMemberSelection.btnAddClick(Sender: TObject);
var
  I: Integer;
begin

  for I := 0 to lbAllMember.Items.Count - 1 do
  begin
    if lbAllMember.Selected[i] then
    begin
      if lbMemberSel.Count = 0 then
      begin
        lbMemberSel.Items.Clear;
        lbMemberSel.Items.Add(lbAllMember.Items[I]);
        lbTempIdSel.Items.Add(lbTempIdAll.Items[i]);
        idGroup :=lbTempIdAll.Items[I];
      end
      else
      begin
        lbMemberSel.Items.Add(lbAllMember.Items[i]);
        lbTempIdSel.Items.Add(lbTempIdAll.Items[i]);
        idGroup :=lbTempIdAll.Items[I];
      end;
    end;
  end;

  for I :=lbAllMember.Items.Count - 1 downto 0 do
  if lbAllMember.Selected[I] then
  begin
    lbAllMember.Items.Delete(I);
    lbTempIdAll.Items.Delete(I);
  end;

end;

procedure TfGroupMemberSelection.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfGroupMemberSelection.btnOkClick(Sender: TObject);
var I,id,cId :integer;
gList : TList;
begin

  if GroupAllocationWindowForm.index = 1 then
  begin
    if frmScenario.id_scenario <> '' then
      dmTTT.GetAssetDeployment(StrToInt(frmScenario.id_scenario),GroupAllocationWindowForm.asset_deployment);

    with cubicle.FCubicle do begin
      for I := 0 to lbMemberSel.Items.Count - 1 do
      begin
        Platform_Instance_Index := StrToInt(lbTempIdSel.Items[i]);

        if fGroupSelect.idGroup <> '' then
          Group_Index           := StrToInt(fGroupSelect.idGroup)
        else
        begin
          dmTTT.getMaxCubicle_Group(id);
          Group_Index           := id;
        end;
        Deployment_Index        := GroupAllocationWindowForm.asset_deployment.FData.Deployment_Index;

          dmTTT.InsertCubicle_Group_Assignment(cubicle);
      end;
    end;
  end;

  if GroupAllocationWindowForm.index = 2 then
  begin

    with cubicle.FChannel do begin
      for I := 0 to lbMemberSel.Items.Count - 1 do
      begin
        Comms_Channel_Index := StrToInt(lbTempIdSel.Items[i]);
        if fGroupSelect.idGroup <> '' then
          Group_Index           := StrToInt(fGroupSelect.idGroup)
        else
        begin
          dmTTT.getMaxCubicle_Group(id);
          Group_Index         := id;
        end;
        Channel_Slot          := i;

        gList := TList.Create;
        if dmTTT.GetCubicle_Group_Channel_Assgnmnt(Group_Index,cubicle.FChannel.Comms_Channel_Index,3,gList) then
          dmTTT.UpdateCubicle_Group_Channel_Assgnmnt(IntToStr(cubicle.FChannel.Comms_Channel_Index),cubicle)
        else
          dmTTT.InsertCubicle_Group_Channel_Assgnmnt(cubicle);
      end;
    end;
  end;
  Close;
  with GroupAllocationWindowForm do begin
    getGroup;
  end;
end;

procedure TfGroupMemberSelection.btnRemoveClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to lbMemberSel.Items.Count - 1 do begin
   if lbMemberSel.Selected[I] then
   begin
      lbAllMember.Items.Add(lbMemberSel.Items[i]);
      lbTempIdAll.Items.Add(lbTempIdSel.Items[i]);
      lbMemberSel.Items.Delete(I);
      lbTempIdSel.Items.Delete(I);
   end;
  end;
end;

procedure TfGroupMemberSelection.FormCreate(Sender: TObject);
begin
  commList      := TList.Create;
  groupList     := TList.Create;
  channel       := TList.Create;
  pi            := TPlatform_Instance.Create;
  external_comm := TExternal_Communication_Channel.Create;
end;

procedure TfGroupMemberSelection.FormShow(Sender: TObject);
begin
   getGroupMember;
end;

procedure TfGroupMemberSelection.getGroupMember;
var
  i,j,id: Integer;
  tempList : TList;
  deletedLeft : boolean;
begin

  lbAllMember.Items.Clear;
  lbMemberSel.Items.Clear;
  lbTempIdAll.Items.Clear;
  lbTempIdSel.Items.Clear;
  groupList.Clear;
  commList.Clear;
  channel.Clear;
  tempList := TList.Create;

  if GroupAllocationWindowForm.index = 1 then
  begin
    if frmScenario.id_scenario <> '' then
      dmTTT.GetAssetDeployment(StrToInt(frmScenario.id_scenario),GroupAllocationWindowForm.asset_deployment);
    if fResorceAllocationSelect.RA_id <> '' then
      dmTTT.getCubicle_GroupMemberResidu(GroupAllocationWindowForm.asset_deployment.FData.Deployment_Index,StrToInt(fResorceAllocationSelect.RA_id),
      frmScenario.force,groupList)
    else
      dmTTT.getCubicle_GroupMemberResidu(GroupAllocationWindowForm.asset_deployment.FData.Deployment_Index,frmScenario.Scenario.FData.Resource_Alloc_Index,
      frmScenario.force,groupList);


    for i := 0 to groupList.Count - 1 do
    begin
      id := TCubicle_Group_Assignment(groupList[i]).FPlatform.Platform_Instance_Index;
      dmTTT.getPlatformInstanceByIndex(id,pi);
      with pi do begin
        lbAllMember.Items.Add(pi.FData.Instance_Name);
        lbTempIdAll.Items.Add(IntToStr(pi.FData.Platform_Instance_Index));
      end;
    end;
  end;

  if GroupAllocationWindowForm.index = 2 then
  begin
    if fResorceAllocationSelect.RA_id <> '' then
      dmTTT.GetExternal_Communication_Channel(commList,fResorceAllocationSelect.RA_id,'',external_comm)
    else
      dmTTT.GetExternal_Communication_Channel(commList,IntToStr(frmScenario.Scenario.FData.Resource_Alloc_Index),'',external_comm);

    for i := 0 to commList.Count - 1 do
    begin
      lbAllMember.Items.Add(TExternal_Communication_Channel(commList[i]).FData.Channel_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TExternal_Communication_Channel(commList[i]).FData.Comms_Channel_Index));
    end;

    if fGroupSelect.idGroup <> '' then
      dmTTT.GetCubicle_Group_Channel_Assgnmnt(StrToInt(fGroupSelect.idGroup),0,1,channel)
    else
    begin
      dmTTT.getMaxCubicle_Group(id);
      dmTTT.GetCubicle_Group_Channel_Assgnmnt(id,0,1,channel);
    end;

    for j := 0 to channel.Count - 1 do
    begin
      id := TCubicle_Group_Assignment(channel[j]).FChannel.Comms_Channel_Index;
      dmTTT.GetExternal_Communication_Channel(tempList,'',IntToStr(id),external_comm);
      lbMemberSel.Items.Add(external_comm.FData.Channel_Identifier);
      lbTempIdSel.Items.Add(IntToStr(external_comm.FData.Comms_Channel_Index));
    end;

    //deletedLeft := False;
    for i := lbAllMember.Count - 1 downto 0 do
    begin
      deletedLeft := False;
      for j := 0 to lbMemberSel.Count - 1 do
      begin
        if (not deletedLeft) then
        begin
          if (lbAllMember.Items[i] = lbMemberSel.Items[j])  then
          begin
            lbAllMember.Items.Delete(i);
            lbTempIdAll.Items.Delete(i);
            deletedLeft := true;
          end;
        end;
      end;
    end;
  end;
end;


end.
