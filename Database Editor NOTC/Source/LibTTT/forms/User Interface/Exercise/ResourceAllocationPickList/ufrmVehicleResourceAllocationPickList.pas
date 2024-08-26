unit ufrmVehicleResourceAllocationPickList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  uDBAssetObject, uDBAsset_Vehicle, uDBAsset_Deploy;
type
  TfrmVehicleResourceAllocationPickList = class(TForm)
    btnAdd: TImage;
    btnClose: TImage;
    btnEdit: TImage;
    btnRemove: TImage;
    ImgBackgroundAvailable: TImage;
    ImgBackgroundForm: TImage;
    ImgBackgroundOnBoard: TImage;
    ImgHeaderAvailable: TImage;
    ImgHeaderOnBoard: TImage;
    Label1: TLabel;
    Label2: TLabel;
    lbAllVehicleDef: TListBox;
    lbAllVehicleOnScenario: TListBox;
    edtCheat: TEdit;
    Label3: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbAllVehicleDefClick(Sender: TObject);
    procedure lbAllVehicleOnScenarioClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);

  private
    FSelectedForce : Integer;

    FAllVehicleDefList : TList;
    FAllVehicleOnRAList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedPlatformInstance : TPlatform_Instance;
    FResourceAllocation : TResource_Allocation;
    FAssetDeployment : TAsset_Deployment;

    procedure UpdateVehicleList;

  public
    isNoCancel : Boolean;
    property ResourceAllocation : TResource_Allocation read FResourceAllocation write FResourceAllocation;
    property AssetDeployment : TAsset_Deployment read FAssetDeployment write FAssetDeployment;
    property SelectedForce : Integer read FSelectedForce write FSelectedForce;
  end;

var
  frmVehicleResourceAllocationPickList: TfrmVehicleResourceAllocationPickList;

implementation

uses
  uDataModuleTTT, ufrmResourceAllocationInputName, uVehicleList;


{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmVehicleResourceAllocationPickList.FormCreate(Sender: TObject);
begin
  FAllVehicleDefList := TList.Create;
  FAllVehicleOnRAList := TList.Create;
end;

procedure TfrmVehicleResourceAllocationPickList.FormShow(Sender: TObject);
begin
  isNoCancel := False;
  UpdateVehicleList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmVehicleResourceAllocationPickList.btnAddClick(Sender: TObject);
begin
  if lbAllVehicleDef.ItemIndex = -1 then
    Exit;

  frmResourceAllocationInputName := TfrmResourceAllocationInputName.Create(Self);
  try
    with frmResourceAllocationInputName do
    begin
      ResourceAllocation := FResourceAllocation;
      Vehicle := FSelectedVehicle;
      Force := FSelectedForce;

      PlatformInstance := TPlatform_Instance.Create;

      ShowModal;

      if isUpdate then
        UpdateVehicleList;

      isNoCancel := True;
    end;
  finally
    frmResourceAllocationInputName.Free;
  end;
end;

procedure TfrmVehicleResourceAllocationPickList.btnEditClick(Sender: TObject);
begin
  if lbAllVehicleOnScenario.ItemIndex = -1 then
    Exit;

  frmResourceAllocationInputName := TfrmResourceAllocationInputName.Create(Self);
  try
    with frmResourceAllocationInputName do
    begin
      ResourceAllocation := FResourceAllocation;
      PlatformInstance := FSelectedPlatformInstance;
      Force := FSelectedForce;

      Vehicle := TVehicle_Definition.Create;
      Vehicle.FData.Vehicle_Index := FSelectedPlatformInstance.FData.Vehicle_Index;

      ShowModal;

      if isUpdate then
        UpdateVehicleList;

      isNoCancel := True;
    end;
  finally
    frmResourceAllocationInputName.Free;
  end;
end;

procedure TfrmVehicleResourceAllocationPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllVehicleOnScenario.ItemIndex = -1 then
    Exit;

  {Delete relasi Cubicle group}
  dmTTT.DeleteCubicleGroupAssignment(3, FSelectedPlatformInstance.FData.Platform_Instance_Index);

  {Delete relasi Platform Activation}
  if dmTTT.DeletePlatformActivation(2, FSelectedPlatformInstance.FData.Platform_Instance_Index)then
  begin
    dmTTT.UpdateHostIdPlatformActivation(FAssetDeployment.FData.Deployment_Index, FSelectedPlatformInstance.FData.Platform_Instance_Index);
    isNoCancel := True;
  end;

  if dmTTT.DeletePlatformInstance(2, FSelectedPlatformInstance.FData.Platform_Instance_Index)then
    isNoCancel := True;

  UpdateVehicleList;
end;

procedure TfrmVehicleResourceAllocationPickList.edtCheatKeyPress(
  Sender: TObject; var Key: Char);
var
  i : Integer;
  vehicle : TVehicle_Definition;
begin
  if Key = #13 then
  begin
    lbAllVehicleDef.Items.Clear;

    dmTTT.GetFilterVehicleDef(FAllVehicleDefList, edtCheat.text);

    for i := 0 to FAllVehicleDefList.Count - 1 do
    begin
      vehicle := FAllVehicleDefList.Items[i];
      lbAllVehicleDef.Items.AddObject(vehicle.FData.Vehicle_Identifier, vehicle);
    end;
  end;
end;

procedure TfrmVehicleResourceAllocationPickList.btnCloseClick(Sender: TObject);
begin
 Close
end;

procedure TfrmVehicleResourceAllocationPickList.lbAllVehicleDefClick(Sender: TObject);
begin
 if lbAllVehicleDef.ItemIndex = -1 then
    Exit;

  FSelectedVehicle := TVehicle_Definition(lbAllVehicleDef.Items.Objects[lbAllVehicleDef.ItemIndex]);
end;

procedure TfrmVehicleResourceAllocationPickList.lbAllVehicleOnScenarioClick(Sender: TObject);
begin
 if lbAllVehicleOnScenario.ItemIndex = -1 then
    Exit;

  FSelectedPlatformInstance := TPlatform_Instance(lbAllVehicleOnScenario.Items.Objects[lbAllVehicleOnScenario.ItemIndex]);
end;

procedure TfrmVehicleResourceAllocationPickList.UpdateVehicleList;
var
  i, j : Integer;
  Vehicle : TVehicle_Definition;
  platInst : TPlatform_Instance;
  found : Boolean;
begin
  lbAllVehicleDef.Items.Clear;
  lbAllVehicleOnScenario.Items.Clear;

  dmTTT.GetAllVehicleDef(FAllVehicleDefList);
  dmTTT.GetPlatformInstance(FResourceAllocation.FData.Resource_Alloc_Index, 1, FSelectedForce, FAllVehicleOnRAList);

  for i := 0 to FAllVehicleDefList.Count - 1 do
  begin
    Vehicle := FAllVehicleDefList.Items[i];

    lbAllVehicleDef.Items.AddObject(Vehicle.FData.Vehicle_Identifier, Vehicle);
  end;

  for j := 0 to FAllVehicleOnRAList.Count - 1 do
  begin
    platInst := FAllVehicleOnRAList.Items[j];

    lbAllVehicleOnScenario.Items.AddObject(platInst.FData.Instance_Name, platInst)
  end;
end;

{$ENDREGION}

end.
