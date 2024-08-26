unit ufrmGroupMemberSelection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject, newClassASTT,
  Vcl.Imaging.pngimage;

type
  E_GroupMemberFormCaller = (gmfcMember, gmfcComm);

  TfrmGroupMemberSelection = class(TForm)
    lbAllMemberDef: TListBox;
    lbAllMemberOnScenario: TListBox;
    btnAdd: TImage;
    btnClose: TImage;
    btnRemove: TImage;
    ImgBackgroundAvailable: TImage;
    ImgBackgroundForm: TImage;
    ImgBackgroundOnBoard: TImage;
    ImgHeaderAvailable: TImage;
    ImgHeaderOnBoard: TImage;
    Label1: TLabel;
    Label2: TLabel;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbAllMemberDefClick(Sender: TObject);
    procedure lbAllMemberOnScenarioClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    FCaller : E_GroupMemberFormCaller;
    FSelectedResourceAlloc : TResource_Allocation;
    FSelectedCubicleGroup : TCubicle_Group_Assignment;

    FSelectedCubicleOnMember : TCubicle_Group_Assignment;

    FAllMemberDeffList : TList;
    FAllMemberOnScenarioList : TList;

    procedure UpdateGroupMemberList;
//    procedure UpdateGroupChannelList;

  public
    property Caller : E_GroupMemberFormCaller read FCaller write FCaller;
    property SelectedResourceAlloc : TResource_Allocation read FSelectedResourceAlloc write FSelectedResourceAlloc;
    property SelectedCubicleGroup : TCubicle_Group_Assignment read FSelectedCubicleGroup write FSelectedCubicleGroup;

  end;

var
  frmGroupMemberSelection: TfrmGroupMemberSelection;

implementation

{$R *.dfm}

uses
  uDataModuleTTT;

{$REGION ' Form Handle '}

procedure TfrmGroupMemberSelection.FormCreate(Sender: TObject);
begin
  FAllMemberDeffList := TList.Create;
  FAllMemberOnScenarioList := TList.Create;
end;

procedure TfrmGroupMemberSelection.FormShow(Sender: TObject);
begin
   case FCaller of
    gmfcMember:
    begin
      Caption := 'Group Member Selection';
      UpdateGroupMemberList;
    end;
    gmfcComm:
    begin
      Caption := 'Group Communication Selection';
//      UpdateGroupChannelList;
    end;
  end;;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmGroupMemberSelection.btnAddClick(Sender: TObject);
begin
  if lbAllMemberDef.ItemIndex = -1 then
    Exit;

  case FCaller of
    gmfcMember:
    begin
      with FSelectedCubicleOnMember do
      begin
        FCubicle.Platform_Instance_Index := FPlatform.Platform_Instance_Index;
        FCubicle.Group_Index := FSelectedCubicleGroup.FData.Group_Index;
        FCubicle.Command_Priority := FAllMemberOnScenarioList.Count;
        FCubicle.Deployment_Index := FSelectedCubicleGroup.FData.Deployment_Index;

        dmTTT.InsertCubicleGroupAssignment(FCubicle);
      end;

      UpdateGroupMemberList;
    end;
    gmfcComm:
    begin
//      with FSelectedCubicleOnMember do
//      begin
//        FChannel.Group_Index := FSelectedCubicleGroup.FData.Group_Index;
//        FChannel.Channel_Slot := FAllMemberOnScenarioList.Count;
//        FChannel.Comms_Channel_Index := FExComm.Comms_Channel_Index;

//        dmTTT.InsertCubicleGroupChannelAssignment(FChannel);
//      end;

//      UpdateGroupChannelList;
    end;
  end;
end;

procedure TfrmGroupMemberSelection.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGroupMemberSelection.btnRemoveClick(Sender: TObject);
begin
  if lbAllMemberOnScenario.ItemIndex = -1 then
    Exit;

  case FCaller of
    gmfcMember:
    begin
      with FSelectedCubicleOnMember.FCubicle do
        dmTTT.DeleteCubicleGroupAssignment(3, Platform_Instance_Index);

      UpdateGroupMemberList;
    end;
    gmfcComm:
    begin
//      with FSelectedCubicleOnMember.FChannel do
//        dmTTT.DeleteCubicleGroupChannelAssignment(Group_Index, Comms_Channel_Index);
//
//      UpdateGroupChannelList;
    end;
  end;
end;

procedure TfrmGroupMemberSelection.lbAllMemberDefClick(Sender: TObject);
begin
  if lbAllMemberDef.ItemIndex = -1 then
    Exit;

  FSelectedCubicleOnMember := TCubicle_Group_Assignment(lbAllMemberDef.Items.Objects[lbAllMemberDef.ItemIndex]);
end;

procedure TfrmGroupMemberSelection.lbAllMemberOnScenarioClick(Sender: TObject);
begin
  if lbAllMemberOnScenario.ItemIndex = -1 then
    Exit;

  FSelectedCubicleOnMember := TCubicle_Group_Assignment(lbAllMemberOnScenario.Items.Objects[lbAllMemberOnScenario.ItemIndex]);
end;

procedure TfrmGroupMemberSelection.UpdateGroupMemberList;
var
  i : Integer;
  cubGroup : TCubicle_Group_Assignment;
begin
  lbAllMemberDef.Items.Clear;
  lbAllMemberOnScenario.Items.Clear;

  dmTTT.GetCubicleGroupAssignmentResidu(FSelectedResourceAlloc.FData.Resource_Alloc_Index,
    FSelectedCubicleGroup.FData.Force_Designation,FSelectedCubicleGroup.FData.Deployment_Index, FAllMemberDeffList);

  dmTTT.GetCubicleGroupAssignment(FSelectedCubicleGroup.FData.Group_Index,FAllMemberOnScenarioList);

  for i := 0 to FAllMemberDeffList.Count - 1 do
  begin
    cubGroup := FAllMemberDeffList.Items[i];
    lbAllMemberDef.Items.AddObject(cubGroup.FPlatform.Instance_Name, cubGroup);
  end;

  for i := 0 to FAllMemberOnScenarioList.Count - 1 do
  begin
    cubGroup := FAllMemberOnScenarioList.Items[i];
    lbAllMemberOnScenario.Items.AddObject(cubGroup.FPlatform.Instance_Name, cubGroup);
  end;
end;

{$ENDREGION}

end.
