unit ufrmGroupSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBAssetObject, ufrmGroupMemberSelection, uDBAsset_Deploy,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmGroupSelect = class(TForm)
    lstGroup: TListBox;
    btnDelete: TImage;
    btnEdit: TImage;
    btnNew: TImage;
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    ImgBtnBack: TImage;
    Label2: TLabel;
    lblForce: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);

    procedure btnCloseClick(Sender: TObject);

  private
    FUpdateList : Boolean;

    FSelectedForce : Integer;
    FSelectedCubicleGroup : TCubicle_Group_Assignment;
    FSelectedScenario : TScenario_Definition;
    FSelectedResourceAlloc : TResource_Allocation;
    FSelectedAssetDeployment : TAsset_Deployment;

    FCubicleGroupList : TList;

    procedure UpdateGroupList;

  public
    property SelectedScenario : TScenario_Definition read FSelectedScenario write FSelectedScenario;
    property SelectedResourceAlloc : TResource_Allocation read FSelectedResourceAlloc write FSelectedResourceAlloc;
    property SelectedAssetDeployment : TAsset_Deployment read FSelectedAssetDeployment write FSelectedAssetDeployment;
    property SelectedForce : Integer read FSelectedForce write FSelectedForce;
  end;


var
  frmGroupSelect: TfrmGroupSelect;

implementation

{$R *.dfm}

uses
 uDataModuleTTT, ufmGroupAllocation ;

 {$REGION ' Form Handle '}

procedure TfrmGroupSelect.FormCreate(Sender: TObject);
begin
  FCubicleGroupList := TList.Create;
end;

procedure TfrmGroupSelect.FormShow(Sender: TObject);
begin

  case FSelectedForce of
    1: lblForce.Caption := ' Force : Red';
    3: lblForce.Caption := ' Force : Blue';
  end;

  UpdateGroupList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmGroupSelect.btnNewClick(Sender: TObject);
begin
  frmGroupAllocation := TfrmGroupAllocation.Create(Self);
  try
    with frmGroupAllocation do
    begin
      CubicleGroup := TCubicle_Group_Assignment.Create;
      SelectedScenario := FSelectedScenario;
      SelectedResourceAlloc := FSelectedResourceAlloc;

      with CubicleGroup.FData do
      begin
        Deployment_Index := FSelectedAssetDeployment.FData.Deployment_Index;
        Force_Designation := FSelectedForce;
        Track_Block_Start := (FCubicleGroupList.Count + 1) * 1000;
        Track_Block_End := (FCubicleGroupList.Count + 1) * 1000 + 999;
      end;

      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmGroupAllocation.Free;
  end;

  if FUpdateList then
    UpdateGroupList;
end;

procedure TfrmGroupSelect.btnEditClick(Sender: TObject);
begin
  if lstGroup.ItemIndex = -1 then
  begin
    ShowMessage('Select List... !');
    Exit;
  end;

  frmGroupAllocation := TfrmGroupAllocation.Create(Self);
  try
    with frmGroupAllocation do
    begin
      CubicleGroup := FSelectedCubicleGroup;
      SelectedResourceAlloc := FSelectedResourceAlloc;
      SelectedScenario := FSelectedScenario;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmGroupAllocation.Free;
  end;

  if FUpdateList then
    UpdateGroupList;
end;

procedure TfrmGroupSelect.btnRemoveClick(Sender: TObject);
var
  warning: Integer;
begin
  if lstGroup.ItemIndex = -1 then
  begin
    ShowMessage('Select Cubicle Group !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this Cubicle Group?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedCubicleGroup.FData do
    begin
      dmTTT.DeleteCubicleGroupAssignment(2, Group_Index);
      dmTTT.DeleteCubicleGroupChannelAssignment(2, Group_Index);
      dmTTT.DeleteCubicleGroup(2, Group_Index);
    end;

    UpdateGroupList;
  end;
end;

procedure TfrmGroupSelect.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGroupSelect.lbSingleClick(Sender: TObject);
begin
  if lstGroup.ItemIndex = -1 then
    Exit;

  FSelectedCubicleGroup := TCubicle_Group_Assignment(lstGroup.Items.Objects[lstGroup.ItemIndex]);
end;

procedure TfrmGroupSelect.UpdateGroupList;
var
  i : Integer;
  cubGroup : TCubicle_Group_Assignment;
begin
  lstGroup.Items.Clear;

  dmTTT.GetCubicleGroup(FSelectedAssetDeployment.FData.Deployment_Index, FSelectedForce, FCubicleGroupList);

  for i := 0 to FCubicleGroupList.Count - 1 do
  begin
    cubGroup := FCubicleGroupList.Items[i];
    lstGroup.Items.AddObject(cubGroup.FData.Group_Identifier, cubGroup);
  end;
end;

{$ENDREGION}
end.
