unit uSaveWaypoint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uT3Unit, uDataModuleTTT, uSimMgr_Client, uT3Vehicle,
  uDBAsset_Scripted, tttData;

type
  TfrmSaveWaypoint = class(TForm)
    lblWpName: TLabel;
    edtWpName: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure SaveWaypointToList;
    function AddWaypointData(ListData: Tlist): Integer;
    procedure edtWpNameKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FHookedPlatform: TT3PlatformInstance;
    procedure SetHookedPlatform(const Value: TT3PlatformInstance);
    { Private declarations }
  public
    { Public declarations }
    Waypoint_Centre_Lat      : Double;
    Waypoint_Centre_Long     : Double;
    Dimension                : Single;
    property HookedPlatform : TT3PlatformInstance read FHookedPlatform write SetHookedPlatform;
  end;

var
  frmSaveWaypoint: TfrmSaveWaypoint;
  tempWPIndex : Integer;

implementation

{$R *.dfm}

{ TfrmSaveWaypoint }

procedure TfrmSaveWaypoint.btnCancelClick(Sender: TObject);
begin
  frmSaveWaypoint.Close;
end;

procedure TfrmSaveWaypoint.btnOKClick(Sender: TObject);
var
  name : string;
  obj : TObject;
  ve : TT3Vehicle;
  i, wpIndex : Integer;
  FFocusedBehav : TScripted_Behav_Definition;
  button : Integer;
begin
  name := edtWpName.Text;
  if dmTTT.CekWaypointName(name) then
  begin
    MessageDlg('The name of Waypoint is already exist, Please choose another name.',mtError, [mbOK] ,0);
    Exit;
  end;

  try
    ve := TT3Vehicle(FHookedPlatform);
    wpIndex := dmTTT.newWaypoint(simMgrClient.Scenario.ResourceAllocation.FData.Resource_Alloc_Index, name,
               Byte(ve.Waypoints.Termination), Waypoint_Centre_Lat, Waypoint_Centre_Long, Dimension);

    tempWPIndex := wpIndex;

    for i:= 0 to ve.Waypoints.Count - 1 do
    begin
      obj := ve.Waypoints.Behaviour[i];

      if Assigned(obj) then
      begin
        FFocusedBehav := TScripted_Behav_Definition(obj);
        dmTTT.WaypointData(wpIndex, FFocusedBehav.FData);
      end;
    end;

  SaveWaypointToList;
  finally
    button := MessageDlg('Waypoint ' + name + ' Successfully saved',mtCustom, [mbOK] ,0);
    if button = mrOk then
    begin
      edtWpName.Text := '';
      frmSaveWaypoint.Close;
    end;
  end;
end;

procedure TfrmSaveWaypoint.SaveWaypointToList;
var
  name : string;
  obj : TObject;
  ve : TT3Vehicle;
  i : Integer;
  TempWaypoint : TScripted_Waypoint_Data;
  TempList : TList;
begin
  name := edtWpName.Text;
  TempWaypoint := TScripted_Waypoint_Data.Create;

  if Assigned(FHookedPlatform) then
    ve := TT3Vehicle(FHookedPlatform);

  with TempWaypoint do
  begin
    Waypoint_Index := tempWPIndex;
    Waypoint_Name := name;
    Termination := Byte(ve.Waypoints.Termination);
    Waypoint_Centre_Lat :=  Waypoint_Centre_Lat;
    Waypoint_Centre_Long :=  Waypoint_Centre_Long;
    Dimension := Dimension;
    AddWaypointData(TempWaypoint.FData);
  end;

  simMgrClient.Scenario.WaypointListFromDB.Add(TempWaypoint);
end;

function TfrmSaveWaypoint.AddWaypointData(ListData : Tlist): Integer;
var
  obj : TObject;
  ve : TT3Vehicle;
  i : Integer;
  TempWaypointData : TScripted_Behav_Definition;
  TempWaypointDatax : TScripted_Behav_Definition;
begin
  ListData.Create;

  if Assigned(FHookedPlatform) then
    ve := TT3Vehicle(FHookedPlatform);

  for i:= 0 to ve.Waypoints.Count - 1 do
  begin
    obj := ve.Waypoints.Behaviour[i];

    if Assigned(obj) then
    begin
      TempWaypointDatax := TScripted_Behav_Definition(obj);
      TempWaypointData := TScripted_Behav_Definition.Create;
      with TempWaypointData.FData do
        begin
          Scripted_Event_Index := TempWaypointDatax.FData.Scripted_Event_Index;
          Number_of_Event := TempWaypointDatax.FData.Number_of_Event;
          Platform_Event_Index := TempWaypointDatax.FData.Platform_Event_Index;
          Speed := TempWaypointDatax.FData.Speed;
          Altitude := TempWaypointDatax.FData.Altitude;
          Vert_Speed := TempWaypointDatax.FData.Vert_Speed;
          Waypoint_Latitude := TempWaypointDatax.FData.Waypoint_Latitude;
          Waypoint_Longitude := TempWaypointDatax.FData.Waypoint_Longitude;
          Cartesian_Waypoint_X := TempWaypointDatax.FData.Cartesian_Waypoint_X;
          Cartesian_Waypoint_Y := TempWaypointDatax.FData.Cartesian_Waypoint_Y;
          Time_Waypoint := TempWaypointDatax.FData.Time_Waypoint;
          Time_2_Waypoint := TempWaypointDatax.FData.Time_2_Waypoint;
          HF_Datalink_Activate := TempWaypointDatax.FData.HF_Datalink_Activate;
          UHF_Datalink_Activate := TempWaypointDatax.FData.UHF_Datalink_Activate;
          Sonobuoy_Resource_Index := TempWaypointDatax.FData.Sonobuoy_Resource_Index;
          Sonobuoy_Instance_Index := TempWaypointDatax.FData.Sonobuoy_Instance_Index;
          Deploy_Sonobuoys := TempWaypointDatax.FData.Deploy_Sonobuoys;
          Sonobuoy_Spacing := TempWaypointDatax.FData.Sonobuoy_Spacing;
          Num_Sonobuoys_2_Drop := TempWaypointDatax.FData.Num_Sonobuoys_2_Drop;
          Sonobuoy_Depth := TempWaypointDatax.FData.Sonobuoy_Depth;
          Jammer_Control := TempWaypointDatax.FData.Jammer_Control;
          Remove_from_Game := TempWaypointDatax.FData.Remove_from_Game;
          StartMode := TempWaypointDatax.FData.StartMode;
          StartAt := TempWaypointDatax.FData.StartAt;
        end;

        ListData.Add(TempWaypointData);
    end;
  end;
end;

procedure TfrmSaveWaypoint.edtWpNameKeyPress(Sender: TObject; var Key: Char);
begin
  UpperCase(edtWpName.Text + edtWpName.Text);
end;

procedure TfrmSaveWaypoint.FormCreate(Sender: TObject);
begin
  Top := (Screen.Height - 30 - Height) div 2;
  Left := (Screen.Width - Width) div 2;
end;

procedure TfrmSaveWaypoint.SetHookedPlatform(const Value: TT3PlatformInstance);
begin
  FHookedPlatform := Value;
end;

end.
