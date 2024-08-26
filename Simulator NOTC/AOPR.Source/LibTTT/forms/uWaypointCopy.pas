unit uWaypointCopy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uSimMgr_Client, uT3Unit;

type
  TfrmWaypointCopy = class(TForm)
    lvPlatform: TListView;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure lvPlatformSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FHookedPlatform: TT3PlatformInstance;
    FFocused : TObject;
    FCopyMode: Byte; // 1: Copy from other Platform 2: Copy from Template
    procedure SetHookedPlatform(const Value: TT3PlatformInstance);
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateTableCopyWP;
    procedure RefreshTableCopy;

    property HookedPlatform : TT3PlatformInstance read FHookedPlatform write SetHookedPlatform;
    property CopyMode : Byte read FCopyMode write FCopyMode;
  end;

var
  frmWaypointCopy: TfrmWaypointCopy;

implementation

uses uSimObjects, uT3Vehicle, tttData, uGameData_TTT, uDBAsset_Scripted;

{$R *.dfm}

procedure TfrmWaypointCopy.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmWaypointCopy.btnOKClick(Sender: TObject);
var
  RecSend : TrecSinc_Waypoint;
  ve : TT3Vehicle;
  i : Integer;
  obj : TObject;
  FFocusedBehav : TScripted_Behav_Definition;
  wp : TScripted_Waypoint_Data;
begin
  if Assigned(FFocused) then
  begin
    if CopyMode = 1 then
    begin
      ve := TT3Vehicle(FFocused);

      with RecSend do
      begin
        Scripted_Event_Index := 0;
        index := 0;
        Cmd := 0;
        Mode := 12;
        Waypoint_Latitude := 0;
        Waypoint_Longitude := 0;
        Speed := 0;

        Altitude := 0;
        CheckArrival := False;
        TimeArrival := 0;
        platformID := FHookedPlatform.InstanceIndex;
        PlatformIDCopy := ve.InstanceIndex;
        //platformName := 0;
        StartMode := 0;
        StartAt := simMgrClient.GameTIME;
        simMgrClient.netSend_CmdSyncWaypoint(RecSend);
      end;
    end
    else
    begin
      wp := TScripted_Waypoint_Data(FFocused);

      with RecSend do
      begin
        Scripted_Event_Index := 0;
        index := 0;
        Cmd := 0;
        Mode := 13;
        Waypoint_Latitude := 0;
        Waypoint_Longitude := 0;
        Speed := 0;

        Altitude := 0;
        CheckArrival := False;
        TimeArrival := 0;
        platformID := FHookedPlatform.InstanceIndex;
        PlatformIDCopy := wp.Waypoint_Index;
        //platformName := 0;
        StartMode := 0;
        StartAt := simMgrClient.GameTIME;
        simMgrClient.netSend_CmdSyncWaypoint(RecSend);
      end;
    end;
  end;

  Close;
end;

procedure TfrmWaypointCopy.FormCreate(Sender: TObject);
begin
  FCopyMode := 1;
end;

procedure TfrmWaypointCopy.lvPlatformSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  FFocused := Item.Data;
end;

procedure TfrmWaypointCopy.RefreshTableCopy;
var
  i : Integer;
  li : TListItem;
  ve : TT3Vehicle;
begin
  if CopyMode = 1 then
  begin
    for i := lvPlatform.Items.Count - 1 downto 0 do
    begin
      li := lvPlatform.Items[i];

      if Assigned(li.Data) then
      begin
        ve := TT3Vehicle(li.Data);

        if ve.VehicleDefinition.GuidanceType <> vgtWaypoint then
        begin
          li.Delete;
        end;
      end;
    end;
  end;
end;

procedure TfrmWaypointCopy.SetHookedPlatform(const Value: TT3PlatformInstance);
begin
  FHookedPlatform := Value;
end;

procedure TfrmWaypointCopy.UpdateTableCopyWP;
var
  ve : TT3Vehicle;
  i : Integer;
  obj : TObject;
  wp : TScripted_Waypoint_Data;
  li : TListItem;
begin
  lvPlatform.Clear;
  if CopyMode = 1 then
  begin
    for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
    begin
      obj := simMgrClient.SimPlatforms.getObject(i);

      if Assigned(obj) then
      begin
        if obj is TT3Vehicle then
        begin
          ve := TT3Vehicle(obj);
          if ve.InstanceIndex <> FHookedPlatform.InstanceIndex then
          begin
            if ve.VehicleDefinition.GuidanceType = vgtWaypoint then
            begin
              li := lvPlatform.Items.Add;
              li.Caption := ve.InstanceName;
              li.Data := obj;
            end;
          end;
        end;
      end;
    end;
  end
  else if CopyMode = 2 then
  begin
    if simMgrClient.Scenario.WaypointListFromDB.Count > 0 then
    begin
      for i := 0 to simMgrClient.Scenario.WaypointListFromDB.Count - 1 do
      begin
        obj := simMgrClient.Scenario.WaypointListFromDB[i];

        if Assigned(obj) then
        begin
          wp := TScripted_Waypoint_Data(obj);

          li := lvPlatform.Items.Add;
          li.Caption := wp.Waypoint_Name;
          li.Data := obj;
        end;
      end;
    end;
  end;
end;

end.
