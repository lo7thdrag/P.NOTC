unit uWaypointEditor;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons,
  uT3Unit, uDBAsset_Scripted, Menus, tttData, ImgList, ActnList, uWaypoint,
  uT3DefensiveJammer ,uGameData_TTT, uSimObjects, uWaypointCopy,
  System.ImageList;

type
  TfrmWaypointEditor = class(TForm)
    lvWaypoint: TListView;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    edtPosition: TEdit;
    btnControlComboInterval: TSpeedButton;
    Label3: TLabel;
    edtSpeed: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    chkArrival: TCheckBox;
    edtArrival: TEdit;
    Label7: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    edtTermination: TEdit;
    btnAction: TSpeedButton;
    Bevel3: TBevel;
    btnHide: TSpeedButton;
    btnApply: TSpeedButton;
    btnCancel: TSpeedButton;
    Label9: TLabel;
    Bevel4: TBevel;
    btnDeleteAll: TSpeedButton;
    btnDelete: TSpeedButton;
    btnAdd: TSpeedButton;
    pmenuAction: TPopupMenu;
    Continueonlastheadingandgroundspeed1: TMenuItem;
    Continueonterminalheading1: TMenuItem;
    Repeatthepatternusingthecurrentpositionastheanchorpoint1: TMenuItem;
    Repeatthepatternreusingtheexistingwaypointpositions1: TMenuItem;
    Returntolaunchingbase1: TMenuItem;
    Removeplatformfromexercise1: TMenuItem;
    cktreeAsset: TTreeView;
    ImageList1: TImageList;
    Notebook1: TNotebook;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtNameWeapon: TEdit;
    edtSalvo: TEdit;
    edtTrack: TEdit;
    btnWeapon: TSpeedButton;
    btnTrack: TSpeedButton;
    pmenuWeapon: TPopupMenu;
    Action11: TMenuItem;
    Label11: TLabel;
    cbSensorState: TComboBox;
    edtAltitude: TEdit;
    edtSonoName: TEdit;
    edtSonoMode: TEdit;
    edtSonoDepth: TEdit;
    edtSonoSpacing: TEdit;
    edtSonoQty: TEdit;
    chkDeployUntilNextWpSonobuoy: TCheckBox;
    lblSonoName: TLabel;
    lblSonoMode: TLabel;
    lblSonoDepth: TLabel;
    lblSonoSpacing: TLabel;
    lblSonoQuantity: TLabel;
    lblMeter: TLabel;
    lblNoctMiles: TLabel;
    SpeedButton1: TSpeedButton;
    btnPickSonobuoy: TSpeedButton;
    btnPickMode: TSpeedButton;
    lblMineName: TLabel;
    lblDepth: TLabel;
    lblSpacing: TLabel;
    lblQuantity: TLabel;
    edtMineName: TEdit;
    edtMineDepth: TEdit;
    edtMineSpacing: TEdit;
    edtMineQty: TEdit;
    btnPickMine: TSpeedButton;
    lblMeterMine: TLabel;
    lblNmMine: TLabel;
    chkDeployUntilNextWpMine: TCheckBox;
    pmMine: TPopupMenu;
    pmSonobuoy: TPopupMenu;
    pmSonoMode: TPopupMenu;
    lblStateCM: TLabel;
    cbbCMState: TComboBox;
    cbbDatalinkState: TComboBox;
    lblDatalinkState: TLabel;
    lblStartTime: TLabel;
    dtpStartTime: TDateTimePicker;
    rgStartTime: TRadioGroup;
    Stoponlastwaypoint1: TMenuItem;
    lblStateMovement: TLabel;
    btnCopy: TSpeedButton;
    btnSave: TSpeedButton;
    pmCopyWp: TPopupMenu;
    CopyfromotherPlatform1: TMenuItem;
    CopyfromTemplate1: TMenuItem;
    chk1: TCheckBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label27: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure onWaypointEdit(Sender: TObject);
    procedure btnControlComboIntervalClick(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
    procedure edtSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure edtAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure btnActionClick(Sender: TObject);
    procedure Continueonlastheadingandgroundspeed1Click(Sender: TObject);
    procedure Continueonterminalheading1Click(Sender: TObject);
    procedure Repeatthepatternusingthecurrentpositionastheanchorpoint1Click(
      Sender: TObject);
    procedure Repeatthepatternreusingtheexistingwaypointpositions1Click(
      Sender: TObject);
    procedure Returntolaunchingbase1Click(Sender: TObject);
    procedure Removeplatformfromexercise1Click(Sender: TObject);
    procedure lvWaypointSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure cktreeAssetClick(Sender: TObject);
    procedure cktreeAssetCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure btnWeaponClick(Sender: TObject);
    procedure cbSensorStateChange(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure edtSalvoKeyPress(Sender: TObject; var Key: Char);
    procedure btnTrackClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPickSonobuoyClick(Sender: TObject);
    procedure btnPickModeClick(Sender: TObject);
    procedure btnPickMineClick(Sender: TObject);
    procedure chkDeployUntilNextWpSonobuoyClick(Sender: TObject);
    procedure edtSonoDepthKeyPress(Sender: TObject; var Key: Char);
    procedure edtSonoSpacingKeyPress(Sender: TObject; var Key: Char);
    procedure edtSonoQtyKeyPress(Sender: TObject; var Key: Char);
    procedure edtMineDepthKeyPress(Sender: TObject; var Key: Char);
    procedure edtMineSpacingKeyPress(Sender: TObject; var Key: Char);
    procedure edtMineQtyKeyPress(Sender: TObject; var Key: Char);
    procedure chkDeployUntilNextWpMineClick(Sender: TObject);
    procedure cbbCMStateChange(Sender: TObject);
    procedure chkArrivalClick(Sender: TObject);
    procedure cbbDatalinkStateChange(Sender: TObject);
    procedure rgStartTimeClick(Sender: TObject);
    procedure dtpStartTimeKeyPress(Sender: TObject; var Key: Char);
    procedure Stoponlastwaypoint1Click(Sender: TObject);
    procedure edtWaypointPositionKeyPress(Sender: TObject; var Key: Char);
    procedure btnCopyClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure CopyfromotherPlatform1Click(Sender: TObject);
    procedure CopyfromTemplate1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FHookedPlatform: TT3PlatformInstance;
    FAddMode : boolean;
    FHideEvent : boolean;
    FLastUserIndex : integer;
    FWPEvent : TObject;
    FFocusedBehav : TScripted_Behav_Definition;

    //nando
    FLastUser       : Boolean;
    idDelete        : Integer;
    FTargetPlatform : TT3PlatformInstance;

    procedure SetHookedPlatform(const Value: TT3PlatformInstance);
    procedure UpdateAssetTree;
    procedure AssetSensor;
    procedure AssetWeapon;
    procedure AssetCountermeasure;
    procedure AssetCommunication;
    procedure OnAddWaypoint(Long,Lat : double);
    procedure OnEditWaypoint(Long, Lat : Double);
    procedure OnMenuSonobuoyClick(Sender : TObject);
    procedure OnMenuSonobuoyModeClick(Sender : TObject);
    procedure OnMenuWeaponClick(Sender : TObject);
    procedure OnNodeSelected(Node : TTreeNode);
    procedure SetWPEvent(ev : TObject);
    function IsCapable(aWeapon : TObject;
             aTarget : TSimObject): Boolean;
  public
    { Public declarations }
    idLvClick       : Integer;
    idDevice        : Integer;
    TreeLevel       : Integer;
    TreeIndex       : Integer;
    TreeText        : string;

    //choco - update form ============ BEGIN ============
    procedure UpdateTableWaypoint;
    procedure UpdateGeneralInfoWaypoint;
    procedure UpdateArrivalTime;
    procedure UpdateTerminationWaypoint;
    procedure UpdateChangeStateWaypoint;

    procedure UpdateSensorEventWaypoint;
    procedure UpdateSonobuoyEventWaypoint;
    procedure UpdateWeaponEventWaypoint;
    procedure UpdateMineEventWaypoint;
    procedure UpdateCountermeasureEventWaypoint;
    procedure UpdateDatalinkEventWaypoint;
    //choco - update form ============= END =============

    procedure UpdateTableWaypointVectac(WpnCarrier : TT3PlatformInstance);
    property HookedPlatform : TT3PlatformInstance read FHookedPlatform write SetHookedPlatform;
    property LastUserIndex : Integer read FLastUserIndex write FLastUserIndex;
  end;

var
  frmWaypointEditor: TfrmWaypointEditor;

implementation

uses ufTacticalDisplay, uBaseCoordSystem, uMapXHandler,
     uT3Vehicle, uSimMgr_Client, uT3DetectedTrack,
     uT3Gun, uT3Mine, uT3Missile, uT3Torpedo, uT3Radar, uT3Sonar,
     uT3OtherSensor, uT3CounterMeasure, uT3Bomb, uT3Sonobuoy, DateUtils, Math,
  uT3RadarNoiseJammer, uSaveWaypoint, ufrmKeyboard;

{$R *.dfm}

const
  cFlatChecked  = 1;
  cFlatUnCheck  = 2;
  cRadar        = 3;
  cWeapon       = 4;
  cCounterM     = 5;
  cDataLink     = 6;

function DeleteAmpersand(Value: string): string;
var
  i: integer;
  found: Boolean;
begin
  found := false;

  for i := 0 to Length(Value) - 1 do
  begin
    if Value[i] = '&' then
    begin
      found := true;
      break;
    end;
  end;

  if found then
    Delete(Value, i, 1);
  result := Value;
end;

procedure TfrmWaypointEditor.onWaypointEdit(Sender: TObject);
var
  index : Integer;
  recSend : TrecSinc_Waypoint;
begin
  ////-nando (edited)
  case TSpeedButton(Sender).Tag of
    1 :
    begin
      if TSpeedButton(Sender).Down then
      begin
        frmTacticalDisplay.Map1.CurrentTool := mtAddWaypoint;
        FAddMode := true;
      end
      else
      begin
        frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
        FAddMode := False;
      end;
    end;
    2 :
    begin
      index := lvWaypoint.ItemIndex;

      if index >= 0 then
      begin
        if lvWaypoint.Items.Count = 1 then
        begin
          with recSend do
          begin
            Cmd := 0;
            Mode := 2;
            platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
            platformName := TT3Vehicle(FHookedPlatform).InstanceName;
          end;
          simMgrClient.netSend_CmdSyncWaypoint(RecSend);
        end
        else
        begin
          if FHookedPlatform is TT3Vehicle then
          begin
            with recSend do
            begin
              Cmd := 0;
              Mode := 1;
              WaypointIndex := idLvClick;
              platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
              platformName := TT3Vehicle(FHookedPlatform).InstanceName;
            end;
            simMgrClient.netSend_CmdSyncWaypoint(RecSend);
          end;
        end;
      end;
    end;
    3 :
    begin
      with recSend do
      begin
        Cmd := 0;
        Mode := 2;
        platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
        platformName := TT3Vehicle(FHookedPlatform).InstanceName;
      end;
      simMgrClient.netSend_CmdSyncWaypoint(RecSend);
    end;
  end;
end;

//=============================================================================
//============termintaion=============================
procedure TfrmWaypointEditor.Continueonlastheadingandgroundspeed1Click(
  Sender: TObject);
var
  recSend : TrecSinc_Waypoint;
begin
  with recSend do
  begin
    Cmd   := 0;
    Mode  := 7;
    index := 0;
    platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
    platformName := TT3Vehicle(FHookedPlatform).InstanceName;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(RecSend);
end;

procedure TfrmWaypointEditor.Continueonterminalheading1Click(Sender: TObject);
var
  recSend : TrecSinc_Waypoint;
begin
  with recSend do
  begin
    Cmd   := 0;
    Mode  := 7;
    index := 1;
    platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
    platformName := TT3Vehicle(FHookedPlatform).InstanceName;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(RecSend);
end;

procedure TfrmWaypointEditor.CopyfromotherPlatform1Click(Sender: TObject);
begin
  if not Assigned(frmWaypointCopy) then
  begin
    frmWaypointCopy := TfrmWaypointCopy.Create(nil);
    frmWaypointCopy.lvPlatform.Columns[0].Caption := 'Platform Name';
    frmWaypointCopy.CopyMode := 1;
    frmWaypointCopy.UpdateTableCopyWP;
    frmWaypointCopy.Show;
  end
  else
  begin
    frmWaypointCopy.lvPlatform.Columns[0].Caption := 'Platform Name';
    frmWaypointCopy.CopyMode := 1;
    frmWaypointCopy.UpdateTableCopyWP;
    frmWaypointCopy.Show;
  end;
end;

procedure TfrmWaypointEditor.CopyfromTemplate1Click(Sender: TObject);
begin
  if not Assigned(frmWaypointCopy) then
  begin
    frmWaypointCopy := TfrmWaypointCopy.Create(nil);
    frmWaypointCopy.CopyMode := 2;
    frmWaypointCopy.lvPlatform.Columns[0].Caption := 'Waypoint Name';
    frmWaypointCopy.UpdateTableCopyWP;
    frmWaypointCopy.Show;
  end
  else
  begin
    frmWaypointCopy.CopyMode := 2;
    frmWaypointCopy.lvPlatform.Columns[0].Caption := 'Waypoint Name';
    frmWaypointCopy.UpdateTableCopyWP;
    frmWaypointCopy.Show;
  end;
end;

procedure TfrmWaypointEditor.dtpStartTimeKeyPress(Sender: TObject;
  var Key: Char);
var
  recSend : TrecSinc_Waypoint;
begin
  if Key = #13 then
  begin
    with recSend do
    begin
      Cmd := 0;
      Mode := 11;
      WaypointIndex := idLvClick;
      platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
      platformName := TT3Vehicle(FHookedPlatform).InstanceName;
      StartAt := dtpStartTime.DateTime;
    end;
    simMgrClient.netSend_CmdSyncWaypoint(recSend);
  end;
end;

procedure TfrmWaypointEditor.Repeatthepatternusingthecurrentpositionastheanchorpoint1Click(
  Sender: TObject);
var
  recSend : TrecSinc_Waypoint;
begin
  with recSend do
  begin
    Cmd   := 0;
    Mode  := 7;
    index := 2;
    platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
    platformName := TT3Vehicle(FHookedPlatform).InstanceName;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(RecSend);
end;

procedure TfrmWaypointEditor.Repeatthepatternreusingtheexistingwaypointpositions1Click(
  Sender: TObject);
var
  recSend : TrecSinc_Waypoint;
begin
  with recSend do
  begin
    Cmd   := 0;
    Mode  := 7;
    index := 3;
    platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
    platformName := TT3Vehicle(FHookedPlatform).InstanceName;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(RecSend);
end;

procedure TfrmWaypointEditor.Returntolaunchingbase1Click(Sender: TObject);
var
  recSend : TrecSinc_Waypoint;
begin
  with recSend do
  begin
    Cmd   := 0;
    Mode  := 7;
    index := 4;
    platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
    platformName := TT3Vehicle(FHookedPlatform).InstanceName;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(RecSend);
end;

procedure TfrmWaypointEditor.rgStartTimeClick(Sender: TObject);
var
  recSend : TrecSinc_Waypoint;
begin
  dtpStartTime.Enabled := rgStartTime.ItemIndex = 1;

  with recSend do
  begin
    Cmd := 0;
    Mode := 10;
    WaypointIndex := idLvClick;
    platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
    platformName := TT3Vehicle(FHookedPlatform).InstanceName;
    StartMode := rgStartTime.ItemIndex;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(recSend);
end;

procedure TfrmWaypointEditor.Removeplatformfromexercise1Click(Sender: TObject);
var
  recSend : TrecSinc_Waypoint;
begin
  with recSend do
  begin
    Cmd   := 0;
    Mode  := 7;
    index := 5;
    platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
    platformName := TT3Vehicle(FHookedPlatform).InstanceName;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(RecSend);
end;
//===============================================================================================

procedure TfrmWaypointEditor.OnAddWaypoint(Long, Lat: double);
var
  RecSend : TrecSinc_Waypoint;
  v : TT3Vehicle;
begin
  v := TT3Vehicle(FHookedPlatform);

  with RecSend do
  begin
    Scripted_Event_Index := v.Waypoints.GetAvailableWaypointID;
    index := LastUserIndex;
    Cmd := 0;
    Mode := 0;
    Waypoint_Latitude := Lat;
    Waypoint_Longitude := Long;
    Speed := v.OrderedSpeed;
    Altitude := v.OrderedAltitude;
    CheckArrival := False;
    TimeArrival := 0;
    platformID := v.InstanceIndex;
    platformName := v.InstanceName;
    StartMode := Ord(wstmNow);
    StartAt := simMgrClient.GameTIME;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(RecSend);
end;

procedure TfrmWaypointEditor.OnEditWaypoint(Long, Lat: Double);
var
  RecSend : TrecSinc_Waypoint;
begin
  with RecSend do
  begin
    Cmd  := 0;
    Mode := 3;
    WaypointIndex := idLvClick;
    Waypoint_Latitude := Lat;
    Waypoint_Longitude := Long;
    platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(RecSend);
end;

procedure TfrmWaypointEditor.OnMenuSonobuoyClick(Sender: TObject);
var
  s : string;
  RecSend : TrecSinc_Waypoint;
  device : TObject;
begin
  s := DeleteAmpersand(TMenuItem(Sender).Caption);

  device := TT3Vehicle(FHookedPlatform).getDevice(s, TT3SonobuoyOnVehicle);

  if Assigned(FWPEvent) then
  begin
    case TWaypointEventClass(FWPEvent).FType of
      wetSonobuoy :
      begin
        with RecSend do
        begin
          Cmd := 2;
          Mode := 0;
          index := idLvClick;
          List_Index := idDevice;

          TvEventLevel := TreeLevel;
          TvEventIndex := TreeIndex;
          TvEventText := TreeText;

          platformID := TT3PlatformInstance(FHookedPlatform).InstanceIndex;
          Sonobuoy_Index := TMenuItem(Sender).Tag;

          if not Assigned(device) then
            Device_ID := 0
          else
            Device_ID := TT3Unit(device).InstanceIndex;
        end;
        simMgrClient.netSend_CmdSyncWaypoint(RecSend);
      end;
    end;
  end;
end;

procedure TfrmWaypointEditor.OnMenuSonobuoyModeClick(Sender: TObject);
var
  RecSend : TrecSinc_Waypoint;
begin
  if Assigned(FWPEvent) then
  begin
    case TWaypointEventClass(FWPEvent).FType of
      wetSonobuoy :
      begin
        with RecSend do
        begin
          Cmd := 2;
          Mode := 1;
          index := idLvClick;
          List_Index := idDevice;
          platformID := TT3PlatformInstance(FHookedPlatform).InstanceIndex;
          Sonobuoy_Mode := TMenuItem(Sender).Tag;
        end;
        simMgrClient.netSend_CmdSyncWaypoint(RecSend);
      end;
    end;
  end;
end;

procedure TfrmWaypointEditor.OnMenuWeaponClick(Sender: TObject);
var
  s : string;
  RecSend : TrecSinc_Waypoint;
  weapon : TObject;
begin
  s := DeleteAmpersand(TMenuItem(Sender).Caption);

  weapon := TT3Vehicle(FHookedPlatform).getWeapon(s);

  if Assigned(FWPEvent) then
  begin
    case TWaypointEventClass(FWPEvent).FType of
      wetWeapon1, wetWeapon2, wetWeapon3, wetWeapon4, wetWeapon5 :
      begin
        edtNameWeapon.Text := s;

        with RecSend do
        begin
          Cmd  := 3;
          Mode := 0;
          index := idLvClick;
          List_Index    := idDevice;

          TvEventLevel := TreeLevel;
          TvEventIndex := TreeIndex;
          TvEventText := TreeText;

          Weapon_Type   := TMenuItem(Sender).Tag;
          platformID    := TT3Vehicle(FHookedPlatform).InstanceIndex;
          platformName  := TT3Vehicle(FHookedPlatform).InstanceName;

          if not Assigned(weapon) then
            Weapon_ID     := 0
          else
            Weapon_ID     := TT3Unit(weapon).InstanceIndex;

          Weapon_Name   := s;
        end;
        simMgrClient.netSend_CmdSyncWaypoint(RecSend);
      end;
      wetMine :
      begin
        with RecSend do
        begin
          Cmd  := 4;
          Mode := 0;
          index := idLvClick;
          List_Index := idDevice;

          TvEventLevel := TreeLevel;
          TvEventIndex := TreeIndex;
          TvEventText := TreeText;

          platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
          Mine_Index := TMenuItem(Sender).Tag;

          if not Assigned(weapon) then
            Weapon_ID     := 0
          else
            Weapon_ID     := TT3Unit(weapon).InstanceIndex;
        end;
        simMgrClient.netSend_CmdSyncWaypoint(RecSend);
      end;
    end;
  end;
end;

procedure TfrmWaypointEditor.OnNodeSelected(Node: TTreeNode);
var
  s : string;
  targetID : Integer;
  obj : TSimObject;
begin
  if not Assigned(Node.Data) then
  begin
    Notebook1.PageIndex := 0;
    idDevice := -1;
  end
  else
  begin
    SetWPEvent(Node.Data);

    TreeLevel := Node.Level;
    TreeIndex := Node.Index;
    TreeText := Node.Text;

    case TWaypointEventClass(Node.Data).FType of
      wetRadar :
      begin
        Notebook1.PageIndex := 1;
        cbSensorState.ItemIndex := TScripted_Radar_Event(TWaypointEventClass
                                    (FWPEvent).FData).FData.Radar_Control;
        idDevice := Node.Index;
      end;
      wetSonar :
      begin
        Notebook1.PageIndex := 1;
        cbSensorState.ItemIndex := TScripted_Sonar_Event(TWaypointEventClass
                                    (FWPEvent).FData).FData.Sonar_Control;
        idDevice := Node.Index + TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Radar);
      end;
      wetIFFTransponder :
      begin
        Notebook1.PageIndex := 1;
        cbSensorState.ItemIndex := TScripted_IFF_Event(TWaypointEventClass
                                   (FWPEvent).FData).FData.IFF_Transponder_Control;
        idDevice := TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Radar) +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Sonar);
      end;
      wetIFFInterogator :
      begin
        Notebook1.PageIndex := 1;
        cbSensorState.ItemIndex := TScripted_IFF_Event(TWaypointEventClass
                                   (FWPEvent).FData).FData.IFF_Interrogator_Control;
        idDevice := TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Radar) +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Sonar) + 1;
      end;
      wetSonobuoy :
      begin
        Notebook1.PageIndex := 2;

        with TScripted_Sonobuoy_Event(TWaypointEventClass(FWPEvent).FData).FData do
        begin
          edtSonoName.Text := DeleteAmpersand(pmSonobuoy.Items[SonobuoyType].Caption);
          edtSonoMode.Text := DeleteAmpersand(pmSonoMode.Items[SonobuoyMode].Caption);
          edtSonoDepth.Text := FloatToStr(SonobuoyDepth);
          edtSonoSpacing.Text := FloatToStr(SonobuoySpacing);
          edtSonoQty.Text := IntToStr(SonobuoyQuantity);
          chkDeployUntilNextWpSonobuoy.Checked := DeploySonoUntilNextWp;
        end;

        idDevice := TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Radar) +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Sonar);

        if TT3Vehicle(FHookedPlatform).getDeviceCount(TT3IFFSensor) > 0 then
          idDevice := idDevice + 2;
      end;
      wetWeapon1, wetWeapon2, wetWeapon3, wetWeapon4, wetWeapon5 :
      begin
        Notebook1.PageIndex := 3;

        with TScripted_Weapon_Event(TWaypointEventClass(FWPEvent).FData).FData do
        begin
          s := pmenuWeapon.Items[Weapon_Type].Caption;

          edtNameWeapon.Text := DeleteAmpersand(s);
          edtSalvo.Text := IntToStr(Salvo_Size);
          targetID := TScripted_Weapon_Event(TWaypointEventClass(FWPEvent).FData)
                      .FData.Target_Index;
        end;

        if targetID <> 0 then
        begin
          obj := simMgrClient.findDetectedTrack(targetID);

          if Assigned(obj) then
            edtTrack.Text := FormatTrackNumber(TT3DetectedTrack(obj).TrackNumber)
          else
          begin
            FTargetPlatform := simMgrClient.FindT3PlatformByID(targetID);

            if Assigned(FTargetPlatform) then
              edtTrack.Text := TT3PlatformInstance(FTargetPlatform).Track_ID
            else
            begin
              FTargetPlatform := simMgrClient.FindNonRealPlatformByID(targetID);
              edtTrack.Text := TT3PlatformInstance(FTargetPlatform).TrackLabel;
            end;
          end;
        end
        else
          edtTrack.Text := '';

        idDevice := Node.Index +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Radar) +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Sonar);

        if TT3Vehicle(FHookedPlatform).getDeviceCount(TT3IFFSensor) > 0 then
          idDevice := idDevice + 2;

        if TT3Vehicle(FHookedPlatform).getDeviceCount(TT3SonobuoyOnVehicle) > 0 then
          idDevice := idDevice + 1;
      end;
      wetMine :
      begin
        Notebook1.PageIndex := 4;

        with TScripted_Mine_Event(TWaypointEventClass(FWPEvent).FData).FData do
        begin
          s := pmMine.Items[MineType].Caption;

          edtMineName.Text := DeleteAmpersand(s);
          edtMineDepth.Text := FloatToStr(MineDepth);
          edtMineSpacing.Text := FloatToStr(MineSpacing);
          edtMineQty.Text := IntToStr(MineQuantity);
          chkDeployUntilNextWpMine.Checked := DeployMineUntilNextWp;
        end;

        idDevice := Node.Index +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Radar) +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Sonar);

        if TT3Vehicle(FHookedPlatform).getDeviceCount(TT3IFFSensor) > 0 then
          idDevice := idDevice + 2;

        if TT3Vehicle(FHookedPlatform).getDeviceCount(TT3SonobuoyOnVehicle) > 0 then
          idDevice := idDevice + 1;
      end;
      wetCounterMeasure :
      begin
        Notebook1.PageIndex := 5;

        cbbCMState.ItemIndex := TScripted_Chaff_Event(TWaypointEventClass
            (FWPEvent).FData).FData.Countermeasure_Control;

        idDevice := Node.Index +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Radar) +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Sonar);

        if TT3Vehicle(FHookedPlatform).getDeviceCount(TT3IFFSensor) > 0 then
          idDevice := idDevice + 2;

        if TT3Vehicle(FHookedPlatform).getDeviceCount(TT3SonobuoyOnVehicle) > 0 then
          idDevice := idDevice + 1;

        if (TT3Vehicle(FHookedPlatform).getWeaponCount(TT3MissilesOnVehicle) > 0) or
           (TT3Vehicle(FHookedPlatform).getWeaponCount(TT3TorpedoesOnVehicle) > 0) or
           (TT3Vehicle(FHookedPlatform).getWeaponCount(TT3BombONVehicle) > 0) then
          idDevice := idDevice + 5;

        if TT3Vehicle(FHookedPlatform).getWeaponCount(TT3MineOnVehicle) > 0 then
          idDevice := idDevice + 1;
      end;
      wetComHF, wetComUHF :
      begin
        Notebook1.PageIndex := 6;

        cbbDatalinkState.ItemIndex := TScripted_Datalink_Event(TWaypointEventClass
            (FWPEvent).FData).FData.Datalink_Control;

        idDevice := Node.Index +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Radar) +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3Sonar) +
                    TT3Vehicle(FHookedPlatform).getDeviceCount(TT3RadarNoiseJammerOnVehicle);

        if TT3Vehicle(FHookedPlatform).getDeviceCount(TT3IFFSensor) > 0 then
          idDevice := idDevice + 2;

        if TT3Vehicle(FHookedPlatform).getDeviceCount(TT3SonobuoyOnVehicle) > 0 then
          idDevice := idDevice + 1;

        if (TT3Vehicle(FHookedPlatform).getWeaponCount(TT3MissilesOnVehicle) > 0) or
           (TT3Vehicle(FHookedPlatform).getWeaponCount(TT3TorpedoesOnVehicle) > 0) or
           (TT3Vehicle(FHookedPlatform).getWeaponCount(TT3BombONVehicle) > 0) then
          idDevice := idDevice + 5;

        if TT3Vehicle(FHookedPlatform).getWeaponCount(TT3MineOnVehicle) > 0 then
          idDevice := idDevice + 1;
      end;
    end;
  end;
end;

procedure TfrmWaypointEditor.AssetCommunication;
var
  AParent, nodeComm : TTreeNode;
  index : Integer;
  wpevent : TObject;
begin
  index := lvWaypoint.ItemIndex;

  if not (FHookedPlatform is TT3Vehicle) then
    Exit;

  if index < 0 then
    Exit;

  with TT3Vehicle(FHookedPlatform) do
  begin
    if VehicleDefinition.FData.HF_Link_Capable or VehicleDefinition.FData.UHF_Link_Capable then
    begin
      AParent := cktreeAsset.Items.AddChild(nil,'Datalink');
      AParent.StateIndex := cDataLink;
    end
    else
      Exit;

    if VehicleDefinition.FData.HF_Link_Capable then
    begin
      nodeComm := cktreeAsset.Items.AddChild(AParent,'HF');
      nodeComm.StateIndex := cFlatUnCheck;

      if not Waypoints.EventExistForObject(index,wetComHF,wpevent) then
        nodeComm.StateIndex := cFlatUnCheck
      else
      begin
        if TWaypointEventClass(wpevent).FEnable then
          nodeComm.StateIndex := cFlatChecked
        else
          nodeComm.StateIndex := cFlatUnCheck;
      end;

      nodeComm.Data := wpevent;
    end;

    if VehicleDefinition.FData.UHF_Link_Capable then
    begin
      nodeComm := cktreeAsset.Items.AddChild(AParent,'VHF/UHF');
      nodeComm.StateIndex := cFlatUnCheck;

      if not Waypoints.EventExistForObject(index,wetComUHF,wpevent) then
        nodeComm.StateIndex := cFlatUnCheck
      else
      begin
        if TWaypointEventClass(wpevent).FEnable then
          nodeComm.StateIndex := cFlatChecked
        else
          nodeComm.StateIndex := cFlatUnCheck;
      end;

      nodeComm.Data := wpevent;
    end;
  end;
end;

procedure TfrmWaypointEditor.AssetCountermeasure;
var
  AParent, nodeCM : TTreeNode;
  index, i : Integer;
  wpevent, device : TObject;
begin
  index := lvWaypoint.ItemIndex;

  if not (FHookedPlatform is TT3Vehicle) then
    Exit;

  if index < 0 then
    Exit;

  with TT3Vehicle(FHookedPlatform) do
  begin
    if getDeviceCount(TT3RadarNoiseJammerOnVehicle) > 0 then
    begin
      AParent := cktreeAsset.Items.AddChild(nil, 'Countermeasures');
      AParent.StateIndex := cCounterM;

      for i := 0 to Devices.Count - 1 do
      begin
        device := Devices.Items[i];

        if device is TT3RadarNoiseJammerOnVehicle then
        begin
          nodeCM := cktreeAsset.Items.AddChild(AParent,
            TT3RadarNoiseJammerOnVehicle(device).InstanceName);
          nodeCM.StateIndex := cFlatUnCheck;

          if index > -1 then
          begin
            if not Waypoints.EventExistForObject(index,wetCounterMeasure,wpevent) then
              nodeCM.StateIndex := cFlatUnCheck
            else
            begin
              if TWaypointEventClass(wpevent).FEnable then
                nodeCM.StateIndex := cFlatChecked
              else
                nodeCM.StateIndex := cFlatUnCheck;
            end;

            nodeCM.Data := wpevent;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmWaypointEditor.AssetSensor;
var
    i, index, tag : integer;
    AParent, node, nodeRadar, nodeSonar,
    nodeIFFTransp, nodeIFFIntro : TTreeNode;
    wpevent, dev : TObject;
    Item : TMenuItem;
begin
  index := lvWaypoint.ItemIndex;
  nodeRadar := nil;
  nodeSonar := nil;

  if not (FHookedPlatform is TT3Vehicle) then
    exit;

  if index < 0 then
    exit;

  with TT3Vehicle(FHookedPlatform) do
  begin
    if (getDeviceCount(TT3Radar) > 0) or
       (getDeviceCount(TT3Sonar) > 0) or
       (getDeviceCount(TT3IFFSensor) > 0) or
       (getDeviceCount(TT3SonobuoyOnVehicle) > 0) then
    begin
      Aparent := cktreeAsset.Items.AddChild(nil,'Sensor');
      Aparent.StateIndex := cRadar;
    end
    else
      Exit;

    if getDeviceCount(TT3Radar) > 0 then
    begin
      nodeRadar := cktreeAsset.Items.AddChild(Aparent,'Radar');
      nodeRadar.StateIndex := cRadar;
    end;

    if getDeviceCount(TT3Sonar) > 0 then
    begin
      nodeSonar := cktreeAsset.Items.AddChild(Aparent,'Sonar');
      nodeSonar.StateIndex := cRadar;
    end;

    for i := 0 to Devices.Count - 1 do
    begin
      dev := Devices.Items[i];

      // radar
      if dev is TT3Radar then
      begin
        if nodeRadar <> nil then
        begin
          node := cktreeAsset.Items.AddChild(nodeRadar, TT3Radar(dev).InstanceName);
          node.StateIndex := cFlatUnCheck;

          if index > -1 then
          begin
            if not Waypoints.EventExistForObject(index,dev,wpevent) then
              node.StateIndex := cFlatUnCheck
            else
            begin
              if TWaypointEventClass(wpevent).FEnable then
                node.StateIndex := cFlatChecked
              else
                node.StateIndex := cFlatUnCheck;
            end;

            node.Data := wpevent;
          end;
        end;
      end
      else // sonar
      if dev is TT3Sonar then
      begin
        if nodeSonar <> nil then
        begin
          node := cktreeAsset.Items.AddChild(nodeSonar, TT3Sonar(dev).InstanceName);
          node.StateIndex := cFlatUnCheck;

          if index > -1 then
          begin
            if not Waypoints.EventExistForObject(index,dev,wpevent) then
              node.StateIndex := cFlatUnCheck
            else
            begin
              if TWaypointEventClass(wpevent).FEnable then
                node.StateIndex := cFlatChecked
              else
                node.StateIndex := cFlatUnCheck;
            end;

            node.Data := wpevent;
          end;
        end;
      end;
    end;

    if getDeviceCount(TT3IFFSensor) > 0 then
    begin
      nodeIFFTransp := cktreeAsset.Items.AddChild(Aparent, 'IFF Transponder');
      nodeIFFTransp.StateIndex := cFlatUnCheck;

      if not Waypoints.EventExistForObject(index,wetIFFTransponder,wpevent) then
        nodeIFFTransp.StateIndex := cFlatUnCheck
      else
      begin
        if TWaypointEventClass(wpevent).FEnable then
          nodeIFFTransp.StateIndex := cFlatChecked
        else
          nodeIFFTransp.StateIndex := cFlatUnCheck;
      end;
      nodeIFFTransp.Data  := wpevent;

      nodeIFFIntro   := cktreeAsset.Items.AddChild(Aparent, 'IFF Interogator');
      nodeIFFIntro.StateIndex   := cFlatUnCheck;
      if not Waypoints.EventExistForObject(index,wetIFFInterogator,wpevent) then
        nodeIFFIntro.StateIndex   := cFlatUnCheck
      else
      begin
        if TWaypointEventClass(wpevent).FEnable then
          nodeIFFIntro.StateIndex := cFlatChecked
        else
          nodeIFFIntro.StateIndex := cFlatUnCheck;
      end;
      nodeIFFIntro.Data := wpevent;
    end;

    if getDeviceCount(TT3SonobuoyOnVehicle) > 0 then
    begin
      node := cktreeAsset.Items.AddChild(Aparent,'Sonobuoy');
      node.StateIndex := cFlatUnCheck;

      if not Waypoints.EventExistForObject(index,wetSonobuoy,wpevent) then
        node.StateIndex := cFlatUnCheck
      else
      begin
        if TWaypointEventClass(wpevent).FEnable then
          node.StateIndex := cFlatChecked
        else
          node.StateIndex := cFlatUnCheck;
      end;

      node.Data := wpevent;

      //-- add sonobuoy on vehicle
      pmSonobuoy.Items.Clear;

      Item := TMenuItem.Create(self);
      Item.OnClick := OnMenuSonobuoyClick;
      Item.Caption := 'None';
      item.Tag := 0;
      pmSonobuoy.Items.Add(item);

      tag := 1;

      for i := 0 to Devices.Count - 1 do
      begin
        dev := Devices.Items[i];

        if dev is TT3SonobuoyOnVehicle then
        begin
          Item := TMenuItem.Create(self);
          Item.OnClick := OnMenuSonobuoyClick;
          Item.Caption := TT3SonobuoyOnVehicle(dev).InstanceName;
          item.Tag := tag;
          pmSonobuoy.Items.Add(item);
          tag := tag + 1;
        end;
      end;
    end;
  end;
end;

procedure TfrmWaypointEditor.AssetWeapon;
var 
    i,j, tag, tagMine, index : integer;
    node2 : TTreeNode;
    AParent: TTreenode;
    Item : TMenuItem;
    weapon : TObject;
    wpevent : TObject;
begin
  index := lvWaypoint.ItemIndex;

  if not (FHookedPlatform is TT3Vehicle) then
    exit;

  if index < 0 then
    exit;

  with TT3Vehicle(FHookedPlatform) do
  begin
    if  Weapons.Count > 0 then
    begin
      Aparent := cktreeAsset.Items.AddChild(nil,'Weapon');
      Aparent.StateIndex := cWeapon;
    end
    else
      Exit;

    // maksimal 5 untuk senjata
    for i := 1 to 5 do
    begin
      node2 := cktreeAsset.Items.AddChild(AParent, 'Weapon ' + IntToStr(i));
      node2.StateIndex := cFlatUnCheck;

      if index > -1 then
      begin
        case i of
         1 : begin
               if Waypoints.EventExistForObject(index,wetWeapon1,wpevent) then
               begin
                 if TWaypointEventClass(wpevent).FEnable then
                    node2.StateIndex := cFlatChecked
                 else
                    node2.StateIndex := cFlatUnCheck;
               end;
             end;
         2 : begin
               if Waypoints.EventExistForObject(index,wetWeapon2,wpevent) then
               begin
                 if TWaypointEventClass(wpevent).FEnable then
                    node2.StateIndex := cFlatChecked
                 else
                    node2.StateIndex := cFlatUnCheck;
               end;
             end;
         3 : begin
               if Waypoints.EventExistForObject(index,wetWeapon3,wpevent) then
               begin
                 if TWaypointEventClass(wpevent).FEnable then
                    node2.StateIndex := cFlatChecked
                 else
                    node2.StateIndex := cFlatUnCheck;
               end;
             end;
         4 : begin
               if Waypoints.EventExistForObject(index,wetWeapon4,wpevent) then
               begin
                 if TWaypointEventClass(wpevent).FEnable then
                    node2.StateIndex := cFlatChecked
                 else
                    node2.StateIndex := cFlatUnCheck;
               end;
             end;
         5 : begin
               if Waypoints.EventExistForObject(index,wetWeapon5,wpevent) then
               begin
                 if TWaypointEventClass(wpevent).FEnable then
                    node2.StateIndex := cFlatChecked
                 else
                    node2.StateIndex := cFlatUnCheck;
               end;
             end;
        end;

        node2.Data := wpevent;
      end;
    end;

    if getWeaponCount(TT3MineOnVehicle) > 0 then
    begin
      node2 := cktreeAsset.Items.AddChild(AParent, 'Mine');
      node2.StateIndex := cFlatUnCheck;

      if Waypoints.EventExistForObject(index,wetMine,wpevent) then
      begin
        if TWaypointEventClass(wpevent).FEnable then
          node2.StateIndex := cFlatChecked
        else
          node2.StateIndex := cFlatUnCheck;
      end;

      node2.Data := wpevent;
    end;

    pmenuWeapon.Items.Clear;
    Item := TMenuItem.Create(self);
    Item.OnClick := OnMenuWeaponClick;
    Item.Caption := 'None';
    item.Tag := 0;
    pmenuWeapon.Items.Add(item);

    pmMine.Items.Clear;
    Item := TMenuItem.Create(self);
    Item.OnClick := OnMenuWeaponClick;
    Item.Caption := 'None';
    item.Tag := 0;
    pmMine.Items.Add(item);

    tag := 1;
    tagMine := 1;

    for j := 0 to Weapons.Count - 1 do
    begin
      weapon := Weapons.Items[j];

      if weapon is TT3MissilesOnVehicle then
      begin
        Item := TMenuItem.Create(self);
        Item.OnClick := OnMenuWeaponClick;
        Item.Caption := TT3MissilesOnVehicle(weapon).InstanceName;
        item.Tag := tag;
        pmenuWeapon.Items.Add(item);
        tag := tag + 1;
      end
      else
      if weapon is TT3TorpedoesOnVehicle then
      begin
        Item := TMenuItem.Create(self);
        Item.OnClick := OnMenuWeaponClick;
        Item.Caption := TT3TorpedoesOnVehicle(weapon).InstanceName;
        item.Tag := tag;
        pmenuWeapon.Items.Add(item);
        tag := tag + 1;
      end
      else
      if weapon is TT3BombONVehicle then
      begin
        Item := TMenuItem.Create(self);
        Item.OnClick := OnMenuWeaponClick;
        Item.Caption := TT3BombONVehicle(weapon).InstanceName;
        item.Tag := tag;
        pmenuWeapon.Items.Add(item);
        tag := tag + 1;
      end
      else
      if weapon is TT3GunOnVehicle then
      begin
        Item := TMenuItem.Create(self);
        Item.OnClick := OnMenuWeaponClick;
        Item.Caption := TT3GunOnVehicle(weapon).InstanceName;
        item.Tag := tag;
        pmenuWeapon.Items.Add(item);
        tag := tag + 1;
      end
      else
      if weapon is TT3MineOnVehicle then
      begin
        Item := TMenuItem.Create(self);
        Item.OnClick := OnMenuWeaponClick;
        Item.Caption := TT3MineOnVehicle(weapon).InstanceName;
        item.Tag := tagMine;
        pmMine.Items.Add(item);
        tagMine := tagMine + 1;
      end;
    end;
  end;
end;

procedure TfrmWaypointEditor.btnActionClick(Sender: TObject);
var point : TPOint;
begin
  if FHookedPlatform is TT3Vehicle then
  begin
    pmenuAction.Items[4].Enabled := False;
  end;

  GetCursorPos(point);

  if not simMgrClient.ISInstructor or not simMgrClient.ISWasdal then
    Removeplatformfromexercise1.Enabled := false
  else
    Removeplatformfromexercise1.Enabled := True;

  pmenuAction.Popup(point.X,point.Y);
end;

procedure TfrmWaypointEditor.btnApplyClick(Sender: TObject);
var
  recSend : TrecSinc_Waypoint;
begin
  with recSend do
  begin
    Cmd := 0;
    Mode := 8;
    TerminationHeading := TT3Vehicle(FHookedPlatform).Heading;
    platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
    platformName := TT3Vehicle(FHookedPlatform).InstanceName;

    case rgStartTime.ItemIndex of
      0: StartAt := 0;
      1: StartAt := dtpStartTime.DateTime;
    end;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(recSend);
  frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
  Close;
end;

procedure TfrmWaypointEditor.btnCancelClick(Sender: TObject);
var
  RecSend : TrecSinc_Waypoint;
begin
  //TT3Vehicle(FHookedPlatform).Waypoints.Clear;
  With RecSend do
  begin
    Cmd := 1;

  end;

  Close;
  frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
end;

procedure TfrmWaypointEditor.btnControlComboIntervalClick(Sender: TObject);
begin
  frmTacticalDisplay.Map1.CurrentTool := mtEditWaypoint;
end;

procedure TfrmWaypointEditor.btnCopyClick(Sender: TObject);
var point : TPOint;
begin
  if lvWaypoint.Items.Count = 0 then
  begin
    GetCursorPos(point);
    pmCopyWp.Popup(point.X,point.Y);
  end;
end;

procedure TfrmWaypointEditor.btnHideClick(Sender: TObject);
begin
  FHideEvent := not FHideEvent;

  if FHideEvent then
  begin
    Height := 319;
    btnHide.Caption := 'Show Events >>';
  end
  else
  begin
    Height := 562;
    btnHide.Caption := 'Hide Events <<';
  end;
end;

procedure TfrmWaypointEditor.btnPickMineClick(Sender: TObject);
var
  P : TPoint;
begin
  GetCursorPos(P);
  pmMine.Popup(P.X,P.Y);
end;

procedure TfrmWaypointEditor.btnPickModeClick(Sender: TObject);
var
  P : TPoint;
begin
  GetCursorPos(P);
  pmSonoMode.Popup(P.X,P.Y);
end;

procedure TfrmWaypointEditor.btnPickSonobuoyClick(Sender: TObject);
var
  P : TPoint;
begin
  GetCursorPos(P);
  pmSonobuoy.Popup(P.X,P.Y);
end;

procedure TfrmWaypointEditor.btnSaveClick(Sender: TObject);
begin
  if not Assigned(frmSaveWaypoint) then
  begin
    frmSaveWaypoint := TfrmSaveWaypoint.Create(nil);
    frmSaveWaypoint.Waypoint_Centre_Long := frmTacticalDisplay.Map1.CenterX;
    frmSaveWaypoint.Waypoint_Centre_Lat := frmTacticalDisplay.Map1.CenterY;
    frmSaveWaypoint.Dimension := frmTacticalDisplay.Map1.Zoom;
    frmSaveWaypoint.ShowModal;
  end
  else
  begin
    frmSaveWaypoint.Waypoint_Centre_Long := frmTacticalDisplay.Map1.CenterX;
    frmSaveWaypoint.Waypoint_Centre_Lat := frmTacticalDisplay.Map1.CenterY;
    frmSaveWaypoint.Dimension := frmTacticalDisplay.Map1.Zoom;
    frmSaveWaypoint.ShowModal;
  end;
end;

procedure TfrmWaypointEditor.btnWeaponClick(Sender: TObject);
var
  P:TPoint;
begin
  GetCursorPos(P);
  pmenuWeapon.Popup(P.X,P.Y);
end;

procedure TfrmWaypointEditor.cbbDatalinkStateChange(Sender: TObject);
var
  RecSend : TrecSinc_Waypoint;
begin
  if Assigned(FWPEvent) then
  begin
    with RecSend do
    begin
      Cmd  := 6;
      Mode := cbbDatalinkState.ItemIndex;
      List_Index := idDevice;
      index := idLvClick;

      TvEventLevel := TreeLevel;
      TvEventIndex := TreeIndex;
      TvEventText := TreeText;

      case TWaypointEventClass(FWPEvent).FType of
        wetComHF  : WpEventType := 1;
        wetComUHF : WpEventType := 2;
      end;

      platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
    end;
    simMgrClient.netSend_CmdSyncWaypoint(RecSend);
  end;
end;

procedure TfrmWaypointEditor.cbbCMStateChange(Sender: TObject);
var
  RecSend : TrecSinc_Waypoint;
begin
  with RecSend do
  begin
    Cmd := 5;
    Mode := cbbCMState.ItemIndex;
    index := idLvClick;
    List_Index := idDevice;

    TvEventLevel := TreeLevel;
    TvEventIndex := TreeIndex;
    TvEventText := TreeText;

    platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(RecSend);
end;

procedure TfrmWaypointEditor.cbSensorStateChange(Sender: TObject);
var
  RecSend : TrecSinc_Waypoint;
begin
  if Assigned(FWPEvent) then
  begin
    with RecSend do
    begin
      Cmd  := 1;
      Mode := cbSensorState.ItemIndex;
      List_Index := idDevice;
      index := idLvClick;

      TvEventLevel := TreeLevel;
      TvEventIndex := TreeIndex;
      TvEventText := TreeText;

      case TWaypointEventClass(FWPEvent).FType of
        wetRadar          : WpEventType := 1;
        wetSonar          : WpEventType := 2;
        wetIFFTransponder : WpEventType := 3;
        wetIFFInterogator : WpEventType := 4;
      end;

      platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
      platformName := TT3Vehicle(FHookedPlatform).InstanceName;
    end;
    simMgrClient.netSend_CmdSyncWaypoint(RecSend);
  end;
end;

function TfrmWaypointEditor.IsCapable(aWeapon: TObject;
  aTarget: TSimObject): Boolean;
var
  pi : TT3PlatformInstance;
begin
  Result := False;

  if aTarget is TT3DetectedTrack then
    pi := TT3DetectedTrack(aTarget).TrackObject as TT3PlatformInstance
  else
    pi := TT3PlatformInstance(aTarget);

  case pi.PlatformDomain of
    vhdAir : //air
    begin
      if aWeapon is TT3MissilesOnVehicle then
      begin
        if TT3MissilesOnVehicle(aWeapon).MissileDefinition.FDef.Anti_Air_Capable = 1 then
          Result := True;
      end
      else if aWeapon is TT3GunOnVehicle then
      begin
        if TT3GunOnVehicle(aWeapon).GunDefinition.FData.Anti_Air_Capable = 1 then
          Result := True;
      end;
    end;
    vhdSurface : //surface
    begin
      if aWeapon is TT3MissilesOnVehicle then
      begin
        if TT3MissilesOnVehicle(aWeapon).MissileDefinition.FDef.Anti_Sur_Capable = 1 then
          Result := True;
      end
      else if aWeapon is TT3TorpedoesOnVehicle then
      begin
        if TT3TorpedoesOnVehicle(aWeapon).TorpedoDefinition.FDef.Anti_Sur_Capable = 1 then
          Result := True;
      end
      else if aWeapon is TT3BombOnVehicle then
      begin
        if TT3BombOnVehicle(aWeapon).BombDefinition.FData.Anti_Sur_Capable = 1 then
          Result := True;
      end
      else if aWeapon is TT3GunOnVehicle then
      begin
        if TT3GunOnVehicle(aWeapon).GunDefinition.FData.Anti_Sur_Capable = 1 then
          Result := True;
      end;
    end;
    vhdSubsurface : //sub-surface
    begin
      if aWeapon is TT3MissilesOnVehicle then
      begin
        if TT3MissilesOnVehicle(aWeapon).MissileDefinition.FDef.Anti_SubSur_Capable = 1 then
          Result := True;
      end
      else if aWeapon is TT3TorpedoesOnVehicle then
      begin
        if TT3TorpedoesOnVehicle(aWeapon).TorpedoDefinition.FDef.Anti_SubSur_Capable = 1 then
          Result := True;
      end
      else if aWeapon is TT3BombOnVehicle then
      begin
        if TT3BombOnVehicle(aWeapon).BombDefinition.FData.Anti_SubSur_Capable = 1 then
          Result := True;
      end;
    end;
    vhdLand : //land
    begin
      if aWeapon is TT3MissilesOnVehicle then
      begin
        if TT3MissilesOnVehicle(aWeapon).MissileDefinition.FDef.Anti_Land_Capable = 1 then
          Result := True;
      end
      else if aWeapon is TT3BombOnVehicle then
      begin
        if TT3BombOnVehicle(aWeapon).BombDefinition.FData.Anti_Land_Capable = 1 then
          Result := True;
      end
      else if aWeapon is TT3GunOnVehicle then
      begin
        if TT3GunOnVehicle(aWeapon).GunDefinition.FData.Anti_Land_Capable = 1 then
          Result := True;
      end;
    end;
    vhdAmphibious :
    begin
      if aWeapon is TT3GunOnVehicle then
      begin
        if TT3GunOnVehicle(aWeapon).GunDefinition.FData.Anti_Amphibious_Capable = 1 then
          Result := True;
      end;
    end;
  end;
end;

procedure TfrmWaypointEditor.chkArrivalClick(Sender: TObject);
begin
//
end;

procedure TfrmWaypointEditor.chkDeployUntilNextWpMineClick(Sender: TObject);
var
  RecSend : TrecSinc_Waypoint;
begin
  if Assigned(FFocusedBehav) then
  begin
    with RecSend do
    begin
      Cmd  := 4;
      Mode := 4;
      index := idLvClick;
      List_Index := idDevice;
      platformID := TT3PlatformInstance(FHookedPlatform).InstanceIndex;
      Mine_ContinueDeploy := chkDeployUntilNextWpMine.Checked;
    end;
    simMgrClient.netSend_CmdSyncWaypoint(RecSend);
  end;
end;

procedure TfrmWaypointEditor.chkDeployUntilNextWpSonobuoyClick(Sender: TObject);
var
  RecSend : TrecSinc_Waypoint;
begin
  if Assigned(FFocusedBehav) then
  begin
    with RecSend do
    begin
      Cmd  := 2;
      Mode := 5;
      index := idLvClick;
      List_Index := idDevice;
      platformID := TT3PlatformInstance(FHookedPlatform).InstanceIndex;
      Sonobuoy_ContinueDeploy := chkDeployUntilNextWpSonobuoy.Checked;
    end;
    simMgrClient.netSend_CmdSyncWaypoint(RecSend);
  end;
end;

procedure TfrmWaypointEditor.cktreeAssetClick(Sender: TObject);
var
  P:TPoint;
begin
  GetCursorPos(P);
  P := cktreeAsset.ScreenToClient(P);

  if (htOnStateIcon in cktreeAsset.GetHitTestInfoAt(P.X,P.Y)) or
     (htOnItem in cktreeAsset.GetHitTestInfoAt(P.X,P.Y)) then
    OnNodeSelected(cktreeAsset.Selected);
end;

procedure TfrmWaypointEditor.cktreeAssetCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  AllowCollapse := false;
end;

procedure TfrmWaypointEditor.edtSalvoKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  value : Integer;
  RecSend : TrecSinc_Waypoint;
  weapon : TObject;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToInt(edtSalvo.Text, value);
    if Value <= 0 then exit;

    if Assigned(FWPEvent) then
    begin
      weapon := TT3Vehicle(FHookedPlatform).getWeapon(edtNameWeapon.Text);

      if not Assigned(weapon) then
        Exit;

      case TWaypointEventClass(FWPEvent).FType of
        wetWeapon1, wetWeapon2, wetWeapon3, wetWeapon4, wetWeapon5 :
        begin
          with RecSend do
          begin
            Cmd  := 3;
            Mode := 1;
            index := idLvClick;
            List_Index    := idDevice;
            Weapon_Type   := 0;
            platformID    := TT3Vehicle(FHookedPlatform).InstanceIndex;
            platformName  := TT3Vehicle(FHookedPlatform).InstanceName;
            // ryu
            Weapon_ID     := TT3Unit(weapon).InstanceIndex;
            Weapon_Name   := edtNameWeapon.Text;
            Salvo_Size    := Value;
          end;
          simMgrClient.netSend_CmdSyncWaypoint(RecSend);

          TScripted_Weapon_Event(TWaypointEventClass(FWPEvent).FData).FData.Salvo_Size := StrToInt(edtSalvo.Text);
        end;
      end;
    end;
  end;
end;

procedure TfrmWaypointEditor.edtSonoDepthKeyPress(Sender: TObject;
  var Key: Char);
var
  ValKey : set of AnsiChar;
  value : Double;
  RecSend : TrecSinc_Waypoint;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(edtSonoDepth.Text, value);

    if Assigned(FWPEvent) then
    begin
      with RecSend do
      begin
        Cmd  := 2;
        Mode := 2;
        index := idLvClick;
        List_Index := idDevice;
        platformID := TT3PlatformInstance(FHookedPlatform).InstanceIndex;
        Sonobuoy_Depth := value;
      end;
      simMgrClient.netSend_CmdSyncWaypoint(RecSend);
    end;
  end;
end;

procedure TfrmWaypointEditor.edtSonoQtyKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  value : Integer;
  RecSend : TrecSinc_Waypoint;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToInt(edtSonoQty.Text);

    if Assigned(FFocusedBehav) then
    begin
      with RecSend do
      begin
        Cmd  := 2;
        Mode := 4;
        index := idLvClick;
        List_Index := idDevice;
        platformID := TT3PlatformInstance(FHookedPlatform).InstanceIndex;
        Sonobuoy_Qty := value;
      end;
      simMgrClient.netSend_CmdSyncWaypoint(RecSend);
    end;
  end;
end;

procedure TfrmWaypointEditor.edtSonoSpacingKeyPress(Sender: TObject;
  var Key: Char);
var
  ValKey : set of AnsiChar;
  value : Double;
  RecSend : TrecSinc_Waypoint;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(edtSonoSpacing.Text, value);

    if Assigned(FFocusedBehav) then
    begin
      with RecSend do
      begin
        Cmd  := 2;
        Mode := 3;
        index := idLvClick;
        List_Index := idDevice;
        platformID := TT3PlatformInstance(FHookedPlatform).InstanceIndex;
        Sonobuoy_Spacing := value;
      end;
      simMgrClient.netSend_CmdSyncWaypoint(RecSend);
    end;
  end;
end;

procedure TfrmWaypointEditor.edtSpeedKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  value : double;
  RecSend : TrecSinc_Waypoint;
  v : TT3Vehicle;
begin
  ValKey := [#45,#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if idLvClick = -1 then
      Exit;

    TryStrToFloat(edtSpeed.Text, value);
    v := TT3Vehicle(FHookedPlatform);

    if Abs(value) > v.Mover.MaxSpeed then
      value := v.Mover.MaxSpeed
    else if Abs(value) < v.Mover.MinSpeed then
      value := v.Mover.MinSpeed;

    with RecSend do
    begin
      Cmd  := 0;
      Mode := 4;
      Speed := Value;
      WaypointIndex := idLvClick;
      platformID := v.InstanceIndex;
      platformName := v.InstanceName;
    end;
    simMgrClient.netSend_CmdSyncWaypoint(RecSend);
  end;
end;

procedure TfrmWaypointEditor.edtWaypointPositionKeyPress(Sender: TObject;
  var Key: Char);
var
  ValKey : set of AnsiChar;
  RecSend : TrecSinc_Waypoint;
  Long, Lat, S : string;
  idx : Integer;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    S := edtPosition.Text;
    idx := LastDelimiter(';',S);
    Long := Copy(S, 0, idx - 1);
    Lat := Copy(S, idx + 1, length(S));

    with RecSend do
    begin
      Cmd  := 0;
      Mode := 3;
      WaypointIndex := idLvClick;
      Waypoint_Latitude := dmsToLatt(Lat);
      Waypoint_Longitude := dmsToLong(Long);
      platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
    end;
    simMgrClient.netSend_CmdSyncWaypoint(RecSend);
  end;
end;

procedure TfrmWaypointEditor.edtAltitudeKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  value, NewAltitude : double;
  RecSend : TrecSinc_Waypoint;
  v : TT3Vehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if idLvClick = -1 then
      Exit;

    TryStrToFloat(edtAltitude.Text, value);
    v := TT3Vehicle(FHookedPlatform);
    NewAltitude := 0;

    case FHookedPlatform.PlatformDomain of
      0,1 : //air //surface
      begin
        NewAltitude := value * C_Feet_To_Meter;

        if NewAltitude > v.Mover.MaxAltitude then
          NewAltitude := v.Mover.MaxAltitude;
      end;
      2,3,4 : //sub-surface //land //amphibi
      begin
        NewAltitude := value;

        if NewAltitude > v.Mover.MaxDepth then
          NewAltitude := v.Mover.MaxDepth;
      end;
    end;

    with RecSend do
    begin
      Cmd  := 0;
      Mode := 5;
      Altitude := NewAltitude;
      WaypointIndex := idLvClick;
      platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
      platformName := TT3Vehicle(FHookedPlatform).InstanceName;
    end;
    simMgrClient.netSend_CmdSyncWaypoint(RecSend);
  end;
end;

procedure TfrmWaypointEditor.edtMineDepthKeyPress(Sender: TObject;
  var Key: Char);
var
  ValKey : set of AnsiChar;
  value : Double;
  RecSend : TrecSinc_Waypoint;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(edtMineDepth.Text, value);

    if Assigned(FWPEvent) then
    begin
      with RecSend do
      begin
        Cmd  := 4;
        Mode := 1;
        index := idLvClick;
        List_Index := idDevice;
        platformID := TT3PlatformInstance(FHookedPlatform).InstanceIndex;
        Mine_Depth := value;
      end;
      simMgrClient.netSend_CmdSyncWaypoint(RecSend);
    end;
  end;
end;

procedure TfrmWaypointEditor.edtMineQtyKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  value : Integer;
  RecSend : TrecSinc_Waypoint;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    value := StrToInt(edtMineQty.Text);

    if Assigned(FWPEvent) then
    begin
      with RecSend do
      begin
        Cmd  := 4;
        Mode := 3;
        index := idLvClick;
        List_Index := idDevice;
        platformID := TT3PlatformInstance(FHookedPlatform).InstanceIndex;
        Mine_Qty := value;
      end;
      simMgrClient.netSend_CmdSyncWaypoint(RecSend);
    end;
  end;
end;

procedure TfrmWaypointEditor.edtMineSpacingKeyPress(Sender: TObject;
  var Key: Char);
var
  ValKey : set of AnsiChar;
  value : Double;
  RecSend : TrecSinc_Waypoint;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(edtMineSpacing.Text, value);

    if Assigned(FWPEvent) then
    begin
      with RecSend do
      begin
        Cmd  := 4;
        Mode := 2;
        index := idLvClick;
        List_Index := idDevice;
        platformID := TT3PlatformInstance(FHookedPlatform).InstanceIndex;
        Mine_Spacing := value;
      end;
      simMgrClient.netSend_CmdSyncWaypoint(RecSend);
    end;
  end;
end;

procedure TfrmWaypointEditor.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmWaypointEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmTacticalDisplay.Map1.CurrentTool := miArrowTool;

  Action := caFree;
  frmWaypointEditor := nil;
end;

procedure TfrmWaypointEditor.FormCreate(Sender: TObject);
var
  i : Integer;
  Item : TMenuItem;
begin
  dtpStartTime.Format := 'HH:mm:ss';
  btnHide.Enabled := False;
  btnHide.Visible := False;
  FormStyle := fsStayOnTop;
  lvWaypoint.DoubleBuffered := true;
  lvWaypoint.ReadOnly := True;
  //lvWaypoint.Enabled := False;
  FAddMode := false;
  FLastUserIndex := 0;
  idLvClick := -1;
  idDevice := -1;
  FHideEvent := true;
  FFocusedBehav := nil;
  idDelete := 100;
  FLastUser := False;
  edtPosition.Enabled := True;
  edtPosition.OnKeyPress := edtWaypointPositionKeyPress;

  VSimMap.OnAddWayoint := OnAddWaypoint;
  VSimMap.OnEditWayoint := OnEditWaypoint;

  btnControlComboInterval.Enabled := False;

  case TT3Vehicle(simMgrClient.ControlledPlatform).PlatformDomain of
    0 :
    begin
      Label5.Visible := True;
      edtAltitude.Visible := True;
      Label6.Visible := True;

      Label5.Caption := 'Altitude';
      Label6.Caption := 'feet';
    end;
    1 :
    begin
      Label5.Visible := False;
      edtAltitude.Visible := False;
      Label6.Visible := False;
    end;    
    2 :
    begin
      Label5.Visible := True;
      edtAltitude.Visible := True;
      Label6.Visible := True; 

      Label5.Caption := 'Depth';
      Label6.Caption := 'metres';
    end;
  end;

  edtArrival.Enabled := False;

  if FHideEvent then
  begin
    Height := 319;
    btnHide.Caption := 'Show Events >>';
  end
  else
  begin
    Height := 562;
    btnHide.Caption := 'Hide Events <<';
  end;

  btnApply.Enabled := True;
  btnCancel.Enabled := True;

  Notebook1.PageIndex := 0;

  pmSonoMode.Items.Clear;

  for i := 1 to 2 do
  begin
    Item := TMenuItem.Create(Self);
    Item.OnClick := OnMenuSonobuoyModeClick;

    if i = 1 then
    begin
      Item.Caption := 'Passive';
      Item.Tag := 0;
    end
    else
    begin
      Item.Caption := 'Active';
      Item.Tag := 1;
    end;

    pmSonoMode.Items.Add(Item);
    btnApply.Caption := 'OK';
    btnCancel.Caption := 'Close';
  end;

  if simMgrClient.ISInstructor then
    btnSave.Visible := True;
end;

procedure TfrmWaypointEditor.FormDestroy(Sender: TObject);
begin
  frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
end;

procedure TfrmWaypointEditor.lvWaypointSelectItem(Sender: TObject;
          Item: TListItem; Selected: Boolean);
begin
  if Item = nil then
    Exit;

  idLvClick := Item.Index;

  if idLvClick <> -1 then
  begin
    FFocusedBehav := TScripted_Behav_Definition(
      TT3Vehicle(FHookedPlatform).Waypoints.Behaviour[item.Index]);

    btnControlComboInterval.Enabled := True;

    if Assigned(FFocusedBehav) then
    begin
      with FFocusedBehav.FData do
      begin
        edtPosition.Text := formatDMS_long(Waypoint_Longitude) + ';' +
                            formatDMS_latt(Waypoint_Latitude);

        btnControlComboInterval.Enabled := True;
        edtSpeed.Text := FormatSpeed(Speed);

        if Speed < 0 then
          lblStateMovement.Caption := 'Move Backward'
        else
          lblStateMovement.Caption := 'Move Forward';

        case FHookedPlatform.PlatformDomain of
          0,1 : edtAltitude.Text := FormatAltitude(Altitude / C_Feet_To_Meter); //air //surface
          2,3,4 : edtAltitude.Text := FormatAltitude(Altitude); //sub surface //land //amphibi
        end;

        rgStartTime.ItemIndex := StartMode;
        dtpStartTime.DateTime := StartAt;
      end;


      UpdateAssetTree;
    end;
  end
  else
  begin
    edtPosition.Text := '';
    btnControlComboInterval.Enabled := False;
    edtSpeed.Text := '';
    lblStateMovement.Caption := '';
    edtAltitude.Text := '';
    chkArrival.Checked := False;
    edtArrival.Text := '';

    rgStartTime.ItemIndex := 0;
    dtpStartTime.DateTime := 0;

    cktreeAsset.Items.Clear;
    Notebook1.PageIndex := 0;
  end;
end;

procedure TfrmWaypointEditor.SetHookedPlatform(const Value: TT3PlatformInstance);
begin
  FHookedPlatform := Value;
  frmWaypointCopy.HookedPlatform := FHookedPlatform;
  frmSaveWaypoint.HookedPlatform := FHookedPlatform;

  with TT3Vehicle(FHookedPlatform) do
  begin
    UpdateTerminationWaypoint;

    //nando
    Waypoints.ShipOwn := TT3PlatformInstance(Value);
  end;
  UpdateTableWaypoint;
  frmWaypointCopy.UpdateTableCopyWP;
//  UpdateAssetTree;
end;

procedure TfrmWaypointEditor.SetWPEvent(ev: TObject);
begin
  FWPEvent := ev;
end;

procedure TfrmWaypointEditor.Stoponlastwaypoint1Click(Sender: TObject);
var
  recSend : TrecSinc_Waypoint;
begin
  with recSend do
  begin
    Cmd   := 0;
    Mode  := 7;
    index := 6;
    platformID := TT3Vehicle(FHookedPlatform).InstanceIndex;
    platformName := TT3Vehicle(FHookedPlatform).InstanceName;
  end;
  simMgrClient.netSend_CmdSyncWaypoint(RecSend);
end;

procedure TfrmWaypointEditor.btnTrackClick(Sender: TObject);
var
  OwnTrackID, TargetTrackID : string;
  Focused_Track : TSimObject;
  RecSend : TrecSinc_Waypoint;
  weapon : TObject;
begin
  OwnTrackID := TT3Vehicle(FHookedPlatform).Track_ID;
  weapon := TT3Vehicle(FHookedPlatform).getWeapon(edtNameWeapon.Text);
  Focused_Track := frmTacticalDisplay.focusedTrack;

  if Focused_Track is TT3DetectedTrack then
  begin
    TargetTrackID := FormatTrackNumber(TT3DetectedTrack(Focused_Track).TrackNumber);
    Focused_Track := TT3DetectedTrack(Focused_Track).TrackObject;
  end
  else if Focused_Track is TT3NonRealVehicle then
    TargetTrackID := FormatTrackNumber(TT3PlatformInstance(Focused_Track).TrackNumber)
  else if Focused_Track is TT3Vehicle then
    TargetTrackID := TT3PlatformInstance(Focused_Track).Track_ID;

  if not IsCapable(weapon, Focused_Track) then
    Exit;

  if Assigned(Focused_Track) then
  begin
    if OwnTrackID <> TargetTrackID then
    begin
      with RecSend do
      begin
        Cmd  := 3;
        Mode := 2;
        index := idLvClick;
        List_Index    := idDevice;
        platformID    := TT3Vehicle(FHookedPlatform).InstanceIndex;
        platformName  := TT3Vehicle(FHookedPlatform).InstanceName;
        Target_Index  := TT3PlatformInstance(Focused_Track).InstanceIndex;
        Weapon_ID     := TT3Unit(weapon).InstanceIndex;
      end;
      simMgrClient.netSend_CmdSyncWaypoint(RecSend);
    end;
  end;
end;

procedure TfrmWaypointEditor.UpdateArrivalTime;
var
  range : Double;
  i, timeToGo : Integer;
  v : TT3Vehicle;
begin
  if idLvClick = -1 then
    Exit;

  if chkArrival.Checked then
  begin
    v := TT3Vehicle(FHookedPlatform);

    if v.Speed > 0 then
    begin
      range := 0;

      for i := 0 to idLvClick do
      begin
        if i = 0 then
          range := range + CalcRange(v.PosX,v.PosY,
            TScripted_Behav_Definition(v.Waypoints.Behaviour[i]).FData.Waypoint_Longitude,
            TScripted_Behav_Definition(v.Waypoints.Behaviour[i]).FData.Waypoint_Latitude)
        else
          range := range + CalcRange(
            TScripted_Behav_Definition(v.Waypoints.Behaviour[i-1]).FData.Waypoint_Longitude,
            TScripted_Behav_Definition(v.Waypoints.Behaviour[i-1]).FData.Waypoint_Latitude,
            TScripted_Behav_Definition(v.Waypoints.Behaviour[i]).FData.Waypoint_Longitude,
            TScripted_Behav_Definition(v.Waypoints.Behaviour[i]).FData.Waypoint_Latitude);
      end;

      timeToGo := Ceil((range / v.Speed) * 3600);

      edtArrival.Text := FormatDateTime('ddhhnnss',
        IncSecond(simMgrClient.GameTIME, timeToGo)) + 'Z' +
        FormatDateTime('mmmyyyy', IncSecond(simMgrClient.GameTIME, timeToGo));
    end
    else
      edtArrival.Text := FormatDateTime('ddhhnnss', simMgrClient.GameTIME) +
        'Z' + FormatDateTime('mmmyyyy', simMgrClient.GameTIME);
  end
  else
    edtArrival.Text := '';
end;

procedure TfrmWaypointEditor.UpdateAssetTree;
//var
//  Aparent, node : TTreeNode;
//  i : integer;
//  dev : TObject;
begin
  cktreeAsset.Items.Clear;

  AssetSensor;
  AssetWeapon;
  AssetCountermeasure;
  AssetCommunication;

  cktreeAsset.FullExpand;
  if cktreeAsset.Items.Count > 0 then
    cktreeAsset.Items.GetFirstNode.Selected := true;
end;

procedure TfrmWaypointEditor.UpdateChangeStateWaypoint;
begin
//  TT3Vehicle(Owner).Waypoints.IsChange := not TT3Vehicle(Owner).Waypoints.IsChange;
//
//  if TT3Vehicle(Owner).Waypoints.IsChange then
//  begin
//    btnApply.Enabled := True;
//    btnCancel.Caption := 'Cancel';
//  end
//  else
//  begin
//    btnApply.Enabled := False;
//    btnCancel.Caption := 'Close';
//  end;
end;

procedure TfrmWaypointEditor.UpdateCountermeasureEventWaypoint;
begin
  cbbCMState.ItemIndex := TScripted_Chaff_Event(TWaypointEventClass(FWPEvent)
    .FData).FData.Countermeasure_Control;
end;

procedure TfrmWaypointEditor.UpdateDatalinkEventWaypoint;
begin
  case TWaypointEventClass(FWPEvent).FType of
    wetComHF : cbSensorState.ItemIndex := TScripted_Datalink_Event(
               TWaypointEventClass(FWPEvent).FData).FData.Datalink_Control;
    wetComUHF : cbSensorState.ItemIndex := TScripted_Datalink_Event(
               TWaypointEventClass(FWPEvent).FData).FData.Datalink_Control;
  end;
end;

procedure TfrmWaypointEditor.UpdateGeneralInfoWaypoint;
begin
  with TScripted_Behav_Definition(TT3Vehicle(FHookedPlatform).Waypoints
       .Behaviour[idLvClick]).FData do
  begin
    edtPosition.Text := formatDMS_long(Waypoint_Longitude) + ';' +
                        formatDMS_latt(Waypoint_Latitude);

    btnControlComboInterval.Enabled := True;
    edtSpeed.Text := FormatSpeed(Speed);

    if Speed < 0 then
      lblStateMovement.Caption := 'Move Backward'
    else
      lblStateMovement.Caption := 'Move Forward';

    case FHookedPlatform.PlatformDomain of
      0,1 : edtAltitude.Text := FormatAltitude(Altitude / C_Feet_To_Meter); //air //surface
      2,3,4 : edtAltitude.Text := FormatAltitude(Altitude); //sub surface //land //amphibi
    end;

    rgStartTime.ItemIndex := StartMode;
    dtpStartTime.DateTime := StartAt;
  end;
end;

procedure TfrmWaypointEditor.UpdateMineEventWaypoint;
begin
  with TScripted_Mine_Event(TWaypointEventClass(FWPEvent).FData).FData do
  begin
    edtMineName.Text := DeleteAmpersand(pmMine.Items[MineType].Caption);
    edtMineDepth.Text := FloatToStr(MineDepth);
    edtMineSpacing.Text := FloatToStr(MineSpacing);
    edtMineQty.Text := IntToStr(MineQuantity);
    chkDeployUntilNextWpMine.Checked := DeployMineUntilNextWp;
  end;
end;

procedure TfrmWaypointEditor.UpdateSensorEventWaypoint;
begin
  case TWaypointEventClass(FWPEvent).FType of
    wetRadar : cbSensorState.ItemIndex := TScripted_Radar_Event(
               TWaypointEventClass(FWPEvent).FData).FData.Radar_Control;
    wetSonar : cbSensorState.ItemIndex := TScripted_Sonar_Event(
               TWaypointEventClass(FWPEvent).FData).FData.Sonar_Control;
    wetIFFTransponder : cbSensorState.ItemIndex := TScripted_IFF_Event(
                        TWaypointEventClass(FWPEvent).FData).
                        FData.IFF_Transponder_Control;
    wetIFFInterogator : cbSensorState.ItemIndex := TScripted_IFF_Event(
                        TWaypointEventClass(FWPEvent).FData).
                        FData.IFF_Interrogator_Control;
  end;
end;

procedure TfrmWaypointEditor.UpdateSonobuoyEventWaypoint;
begin
  with TScripted_Sonobuoy_Event(TWaypointEventClass(FWPEvent).FData).FData do
  begin
    edtSonoName.Text := DeleteAmpersand(pmSonobuoy.Items[SonobuoyType].Caption);
    edtSonoMode.Text := DeleteAmpersand(pmSonoMode.Items[SonobuoyMode].Caption);
    edtSonoDepth.Text := FloatToStr(SonobuoyDepth);
    edtSonoSpacing.Text := FloatToStr(SonobuoySpacing);
    edtSonoQty.Text := IntToStr(SonobuoyQuantity);
    chkDeployUntilNextWpSonobuoy.Checked := DeploySonoUntilNextWp;
  end;
end;

procedure TfrmWaypointEditor.UpdateTableWaypoint;
var
  i : integer;
  li: TListItem;
begin
  lvWaypoint.Items.Clear;

  with TT3Vehicle(FHookedPlatform) do
  begin
    for i := 0 to Waypoints.Count - 1 do
    begin
      li := lvWaypoint.Items.Add;
      li.Caption := IntToStr(i+1);
      li.SubItems.Add('WP - ' + IntToStr(TScripted_Behav_Definition(Waypoints.Behaviour[i]).FData.Scripted_Event_Index));
      li.Data := Waypoints.Behaviour[i];

      if FLastUserIndex < TScripted_Behav_Definition(Waypoints.Behaviour[i]).FData.Scripted_Event_Index then
        FLastUserIndex := TScripted_Behav_Definition(Waypoints.Behaviour[i]).FData.Scripted_Event_Index;
    end;

  end;
end;

procedure TfrmWaypointEditor.UpdateTableWaypointVectac(WpnCarrier : TT3PlatformInstance);
var
  i : integer;
  li: TListItem;
begin
  lvWaypoint.Items.Clear;

  with TT3Vehicle(WpnCarrier) do
  begin
    for i := 0 to Waypoints.Count - 1 do
    begin
      li := lvWaypoint.Items.Add;
      li.Caption := IntToStr(i+1);
      li.SubItems.Add('WP - ' +
        IntToStr(TScripted_Behav_Definition(Waypoints.Behaviour[i]).FData.Scripted_Event_Index));
      li.Data := Waypoints.Behaviour[i];

      if FLastUserIndex < TScripted_Behav_Definition(Waypoints.Behaviour[i]).FData.Scripted_Event_Index then
         FLastUserIndex := TScripted_Behav_Definition(Waypoints.Behaviour[i]).FData.Scripted_Event_Index;
    end;
  end;
end;

procedure TfrmWaypointEditor.UpdateTerminationWaypoint;
begin
  case TT3Vehicle(FHookedPlatform).Waypoints.Termination of
    wtLH: edtTermination.Text := 'Continue on last heading' ;
    wtTH: edtTermination.Text := 'Continue on terminal heading' ;
    wtRP: edtTermination.Text := 'Repeat the pattern, using the current position as the anchor point' ;
    wtRP2:edtTermination.Text := 'Repeat the pattern, reusing the existing waypoint positions'  ;
    wtRB: edtTermination.Text := 'Return to launching base' ;
    wtRM: edtTermination.Text := 'Remove platform from exercise' ;
    wtSp: edtTermination.Text := 'Stop on last waypoint' ;
  end;
end;

procedure TfrmWaypointEditor.UpdateWeaponEventWaypoint;
var
  targetID : Integer;
  s : string;
  obj : TSimObject;
begin
  with TScripted_Weapon_Event(TWaypointEventClass(FWPEvent).FData).FData do
  begin
    s := pmenuWeapon.Items[Weapon_Type].Caption;

    edtNameWeapon.Text := DeleteAmpersand(s);
    edtSalvo.Text := IntToStr(Salvo_Size);
    targetID := Target_Index;
  end;

  if targetID <> 0 then
  begin
    obj := simMgrClient.findDetectedTrack(targetID);

    if Assigned(obj) then
      edtTrack.Text := FormatTrackNumber(TT3DetectedTrack(obj).TrackNumber)
    else
    begin
      FTargetPlatform := simMgrClient.FindT3PlatformByID(targetID);

      if Assigned(FTargetPlatform) then
        edtTrack.Text := TT3PlatformInstance(FTargetPlatform).Track_ID
      else
      begin
        FTargetPlatform := simMgrClient.FindNonRealPlatformByID(targetID);
        edtTrack.Text := TT3PlatformInstance(FTargetPlatform).TrackLabel;
      end;
    end;
  end;
end;

end.
