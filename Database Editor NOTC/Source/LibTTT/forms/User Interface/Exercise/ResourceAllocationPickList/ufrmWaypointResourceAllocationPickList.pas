unit ufrmWaypointResourceAllocationPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject, Vcl.Imaging.pngimage;

type
  TfrmWaypointResourceAllocationPickList = class(TForm)
    lbAllWaypoinDef: TListBox;
    lbAllWaypoinOnScenario: TListBox;
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

    procedure lbAllWaypoinDefClick(Sender: TObject);
    procedure lbAllWaypoinOnScenarioClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FSelectedForce : Integer;

    FAllWaypointDefList : TList;
    FAllWaypointOnScenarioList : TList;

    FSelectedWaypoint : TWaypoint_Def;
    FSelectedWaypointOnScenario : TResource_Waypoint_Mapping;
    FResourceAllocation : TResource_Allocation;

    procedure UpdateWaypointList;

  public
    isNoCancel : Boolean;
    property ResourceAllocation : TResource_Allocation read FResourceAllocation write FResourceAllocation;
    property SelectedForce : Integer read FSelectedForce write FSelectedForce;
  end;

var
  frmWaypointResourceAllocationPickList: TfrmWaypointResourceAllocationPickList;

implementation

uses uDataModuleTTT, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmWaypointResourceAllocationPickList.FormCreate(Sender: TObject);
begin
  FAllWaypointDefList := TList.Create;
  FAllWaypointOnScenarioList := TList.Create;
end;

procedure TfrmWaypointResourceAllocationPickList.FormShow(Sender: TObject);
begin
  isNoCancel := False;
  UpdateWaypointList
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmWaypointResourceAllocationPickList.btnAddClick(Sender: TObject);
var
  WaypointMapping : TResource_Waypoint_Mapping;
begin
  if lbAllWaypoinDef.ItemIndex = -1 then
     Exit;

  WaypointMapping := TResource_Waypoint_Mapping.Create;
  with WaypointMapping.FData do
  begin
    Resource_Alloc_Index := FResourceAllocation.FData.Resource_Alloc_Index;
    Waypoint_Index := FSelectedWaypoint.FData.Waypoint_Index;
  end;

  if dmTTT.InsertResourceWaypointMapping(WaypointMapping)then
    isNoCancel := True;

  WaypointMapping.Free;

  UpdateWaypointList
end;

procedure TfrmWaypointResourceAllocationPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllWaypoinOnScenario.ItemIndex = -1 then
     Exit;

  with FSelectedWaypointOnScenario.FData do
  begin
    if dmTTT.DeleteResourceWaypointMapping(2, ResourceAllocation.FData.Resource_Alloc_Index, Waypoint_Index) then
      isNoCancel := True;
  end;

  UpdateWaypointList;

end;

procedure TfrmWaypointResourceAllocationPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmWaypointResourceAllocationPickList.lbAllWaypoinDefClick(Sender: TObject);
begin
  if lbAllWaypoinDef.ItemIndex = -1 then
    Exit;

  FSelectedWaypoint := TWaypoint_Def(lbAllWaypoinDef.Items.Objects[lbAllWaypoinDef.ItemIndex]);
end;

procedure TfrmWaypointResourceAllocationPickList.lbAllWaypoinOnScenarioClick(Sender: TObject);
begin
  if lbAllWaypoinOnScenario.ItemIndex = -1 then
      Exit;
  FSelectedWaypointOnScenario := TResource_Waypoint_Mapping(lbAllWaypoinOnScenario.Items.Objects[lbAllWaypoinOnScenario.ItemIndex]);
end;

procedure TfrmWaypointResourceAllocationPickList.UpdateWaypointList;
var
  i, j : Integer;
  waypoint : TWaypoint_Def;
  waypointmaping : TResource_Waypoint_Mapping;
  found : Boolean;
begin
  lbAllWaypoinDef.Items.Clear;
  lbAllWaypoinOnScenario.Items.Clear;

  dmTTT.GetAllWaypointDef(FAllWaypointDefList);
  dmTTT.GetResourceWaypointMapping(FResourceAllocation.FData.Resource_Alloc_Index, FAllWaypointOnScenarioList);

  for i := 0 to FAllWaypointDefList.Count - 1 do
  begin
    waypoint := FAllWaypointDefList.Items[i];
    found := False;

    for j := 0 to FAllWaypointOnScenarioList.Count - 1 do
    begin
      waypointmaping := FAllWaypointOnScenarioList.Items[j];

      if waypoint.FData.Waypoint_Index = waypointmaping.FData.Waypoint_Index then
      begin
        found := True;
        Break;
      end;
    end;

    if found then
      lbAllWaypoinOnScenario.Items.AddObject(waypoint.FData.Waypoint_Name, waypointmaping)
    else
      lbAllWaypoinDef.Items.AddObject(waypoint.FData.Waypoint_Name, waypoint);

  end;
end;

{$ENDREGION}


end.
