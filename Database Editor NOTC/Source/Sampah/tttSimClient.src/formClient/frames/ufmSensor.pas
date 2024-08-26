unit ufmSensor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, uDBAsset_Sensor,
  uDBAsset_Sonar, uDBAsset_Radar,  uDBAssetObject,  uSimObjects,
  ufmControlled
  ;

type
  TfmSensor = class(TfmControlled)
    PanelSensorChoices: TPanel;
    lstSensor: TListView;
    PanelSensorControl: TPanel;
    grbIFFTransponderControl: TGroupBox;
    Label108: TLabel;
    Bevel23: TBevel;
    Label110: TLabel;
    Label112: TLabel;
    Bevel24: TBevel;
    sbIFFTransponderControlModeOn: TSpeedButton;
    sbIFFTransponderControlModeOff: TSpeedButton;
    cbIFFTransponderControlMode1: TCheckBox;
    cbIFFTransponderControlMode2: TCheckBox;
    cbIFFTransponderControlMode3: TCheckBox;
    cbIFFTransponderControlMode3C: TCheckBox;
    cbIFFTransponderControlMode4: TCheckBox;
    edtIFFTransponderControlMode1: TEdit;
    edtIFFTransponderControlMode2: TEdit;
    edtIFFTransponderControlMode3: TEdit;
    grbAnomalyDetectorSensor: TGroupBox;
    Label225: TLabel;
    Bevel47: TBevel;
    Label230: TLabel;
    sbAnomalyDetectorControlModeOn: TSpeedButton;
    sbAnomalyDetectorControlModeOff: TSpeedButton;
    grbElectroOpticalSensor: TGroupBox;
    Label231: TLabel;
    Bevel48: TBevel;
    Label235: TLabel;
    Label245: TLabel;
    Bevel49: TBevel;
    Label251: TLabel;
    Label252: TLabel;
    sbElectroOpticalSensorDisplayRangeShow: TSpeedButton;
    sbElectroOpticalSensorDisplayRangeHide: TSpeedButton;
    sbElectroOpticalSensorBlindZoneShow: TSpeedButton;
    sbElectroOpticalSensorBlindZoneHide: TSpeedButton;
    sbElectroOpticalSensorControlModeOn: TSpeedButton;
    sbElectroOpticalSensorControlModeOff: TSpeedButton;
    btnElectroOpticalSensorExecuteSingleScan: TButton;
    grbVisualDetectorSensor: TGroupBox;
    Label257: TLabel;
    Bevel51: TBevel;
    Label258: TLabel;
    Label259: TLabel;
    sbVisualDetectorDisplayRangeShow: TSpeedButton;
    sbVisualDetectorDisplayRangeHide: TSpeedButton;
    sbVisualDetectorDisplayBlindZonesShow: TSpeedButton;
    sbVisualDetectorDisplayBlindZonesHide: TSpeedButton;
    grbSearchRadarControl: TGroupBox;
    ScrollBox1: TScrollBox;
    Label189: TLabel;
    Bevel28: TBevel;
    Label193: TLabel;
    Label194: TLabel;
    Label200: TLabel;
    Bevel30: TBevel;
    Label201: TLabel;
    Label202: TLabel;
    Label203: TLabel;
    Label204: TLabel;
    Label205: TLabel;
    Label261: TLabel;
    Bevel31: TBevel;
    Label262: TLabel;
    Label263: TLabel;
    Label264: TLabel;
    btnControlComboInterval: TSpeedButton;
    btnComboScanStrart: TSpeedButton;
    sbControlModeSearch: TSpeedButton;
    sbControlModeTrack: TSpeedButton;
    sbControlModeOff: TSpeedButton;
    sbControlEccmOn: TSpeedButton;
    sbControlEccmOff: TSpeedButton;
    sbScanModeFull: TSpeedButton;
    sbScanModePartial: TSpeedButton;
    sbRangeShow: TSpeedButton;
    sbRangeHide: TSpeedButton;
    sbBlindShow: TSpeedButton;
    sbBlindHide: TSpeedButton;
    sbScanShow: TSpeedButton;
    sbScanHide: TSpeedButton;
    cbActivationInterval: TCheckBox;
    editComboInterval: TEdit;
    editScanStart: TEdit;
    editScanEnd: TEdit;
    btShowRangeAltitude: TButton;
    btExecuteSingleScan: TButton;
    grbIFFInterrogatorControl: TGroupBox;
    Label208: TLabel;
    Bevel34: TBevel;
    Label210: TLabel;
    Label211: TLabel;
    Bevel35: TBevel;
    Label212: TLabel;
    Bevel36: TBevel;
    btnbtnIFFInterrogatorTrackSearch: TSpeedButton;
    sbIFFInterrogatorControlModeOn: TSpeedButton;
    sbIFFInterrogatorControlModeOff: TSpeedButton;
    cbbtnIFFInterrogatorMode1: TCheckBox;
    cbbtnIFFInterrogatorMode2: TCheckBox;
    cbbtnIFFInterrogatorMode3: TCheckBox;
    cbbtnIFFInterrogatorMode3C: TCheckBox;
    cbbtnIFFInterrogatorMode4: TCheckBox;
    edtIFFInterrogatorMode1: TEdit;
    edtIFFInterrogatorMode2: TEdit;
    edtIFFInterrogatorMode3: TEdit;
    editbtnIFFInterrogatorTrack: TEdit;
    grbSonobuoyControl: TGroupBox;
    Label240: TLabel;
    Bevel44: TBevel;
    lblStatusSonobuoy: TLabel;
    Label243: TLabel;
    Label244: TLabel;
    lbStatusQuantity: TLabel;
    Label242: TLabel;
    Bevel45: TBevel;
    Label246: TLabel;
    Label247: TLabel;
    Label248: TLabel;
    Bevel46: TBevel;
    Label249: TLabel;
    Label250: TLabel;
    lblSonobuoyMonitorCurrently: TLabel;
    lblSonobuoyMonitorPlatform: TLabel;
    Label253: TLabel;
    Label254: TLabel;
    btnSonobuoyControlCombo: TSpeedButton;
    editControlMode: TEdit;
    editControlDepth: TEdit;
    btnSonobuoyControlDeploy: TButton;
    grbESMSensorControl: TGroupBox;
    Label217: TLabel;
    Bevel38: TBevel;
    Label218: TLabel;
    Label219: TLabel;
    Bevel40: TBevel;
    Label220: TLabel;
    sbESMSensorControlModeOn: TSpeedButton;
    sbESMSensorControlModeOff: TSpeedButton;
    sbESMSensorDisplayBlindZoneShow: TSpeedButton;
    sbESMSensorDisplayBlindZoneHide: TSpeedButton;
    grbSonarControl: TGroupBox;
    ScrollBox2: TScrollBox;
    Bevel37: TBevel;
    Bevel39: TBevel;
    Bevel41: TBevel;
    Bevel42: TBevel;
    Bevel43: TBevel;
    Label213: TLabel;
    Label214: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label223: TLabel;
    Label224: TLabel;
    Label226: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    Label232: TLabel;
    Label233: TLabel;
    Label234: TLabel;
    Label236: TLabel;
    Label237: TLabel;
    Label238: TLabel;
    Label239: TLabel;
    LabelCablePayout: TLabel;
    LabelDepth: TLabel;
    lbCableActual: TLabel;
    lbDepthActual: TLabel;
    lbDepthSettled: TLabel;
    lbDepthTow: TLabel;
    lblStatusDeployment: TLabel;
    sbDeploymentActiondeploy: TSpeedButton;
    sbDeploymentActionShow: TSpeedButton;
    sbDisplayBlindHide: TSpeedButton;
    sbDisplayBlindShow: TSpeedButton;
    sbDisplayRangeHide: TSpeedButton;
    sbDisplayRangeShow: TSpeedButton;
    sbSonarControlModeActive: TSpeedButton;
    sbSonarControlModeOff: TSpeedButton;
    sbSonarControlModePassive: TSpeedButton;
    editCableOrdered: TEdit;
    PanelSpace: TPanel;
    procedure lstSensorSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure sbESMSensorControlModeClick(Sender: TObject);
    procedure sbSearchRadarClick(Sender: TObject);
    procedure sbSonarClick(Sender: TObject);
    procedure sbVisualSensorClick(Sender: TObject);
  private
    { Private declarations }

    Focused_Sensor: TSimObject;
  protected

    procedure DisplayTab(const i: byte); override;

  public
    { Public declarations }
    procedure initCreate(sender: TForm); override;

    procedure setActiveSensor(const sens: TSimObject);
    procedure RefreshPlatformSensorsTab
      (PfList: TPlatform_Instance);


    procedure Refresh_VisibleTab;

    procedure RefreshVisualPropertiesTab(visual: TVisual_Sensor_On_Board);
    procedure RefreshSonarPropertiesTab(sonar: TSonar_On_Board);
    procedure RefreshRadarPropertiesTab(radar: TRadar_On_Board);
    procedure RefreshESMPropertiesTab(esm: TESM_On_Board);


  end;

implementation

{$R *.dfm}

uses
  tttData, uGameData_TTT,
  uSimMgr_Client;

procedure TfmSensor.setActiveSensor(const sens: TSimObject);
begin
  Focused_Sensor := sens;
end;

{
grbAnomalyDetectorSensor
grbElectroOpticalSensor
grbESMSensorControl
grbIFFInterrogatorControl
grbIFFTransponderControl
grbSearchRadarControl
grbSonarControl
grbSonobuoyControl
grbVisualDetectorSensor
}
procedure TfmSensor.DisplayTab(const i: byte);
begin
  inherited;

end;

procedure TfmSensor.initCreate(sender: TForm);
begin
  inherited;
  lstSensor.DoubleBuffered := true;

// esm
  sbESMSensorControlModeOn.Tag :=  1;
  sbESMSensorControlModeOff.Tag := 2;
  sbESMSensorDisplayBlindZoneShow.Tag := 3;
  sbESMSensorDisplayBlindZoneHide.Tag := 4;

// search radar
  sbRangeShow.Tag         := 1;
  sbRangeHide.Tag         := 2;
  sbBlindShow.Tag         := 3;
  sbBlindHide.Tag         := 4;
  sbScanShow.Tag          := 5;
  sbScanHide.Tag          := 6;
  sbScanModeFull.Tag      := 7;
  sbScanModePartial.Tag   := 8;
  sbControlModeSearch.Tag := 9;
  sbControlModeTrack.Tag  := 10;
  sbControlModeOff.Tag    := 11;
  sbControlEccmOn.Tag     := 12;
  sbControlEccmOff.Tag    := 13;

// sonar
  sbSonarControlModeActive.Tag   := 1;
  sbSonarControlModePassive.Tag  := 2;
  sbSonarControlModeOff.Tag      := 3;
  sbDeploymentActiondeploy.Tag   := 4;
  sbDeploymentActionShow.Tag     := 5;
  sbDisplayRangeHide.Tag         := 6;
  sbDisplayRangeShow.Tag         := 7;
  sbDisplayBlindHide.Tag         := 8;
  sbDisplayBlindShow.Tag         := 9;

//Visual
  sbVisualDetectorDisplayRangeShow.Tag       := 1;
  sbVisualDetectorDisplayRangeHide.Tag       := 2;
  sbVisualDetectorDisplayBlindZonesHide.Tag  := 4;
  sbVisualDetectorDisplayBlindZonesShow.Tag  := 3;

end;


procedure TfmSensor.RefreshPlatformSensorsTab
  (PfList: TPlatform_Instance);
var
  i: integer;
  li: TListItem;
  rdr: TRadar_On_Board;
  snr: TSonar_On_Board;
  iff: TIFF_Sensor_On_Board;
  esm: TESM_On_Board;
  vis: TVisual_Sensor_On_Board;
begin

  lstSensor.Items.Clear;
  // radar
  for i := 0 to PfList.Vehicle.Radars.Count - 1 do
  begin
    rdr := PfList.Vehicle.Radars[i];
    li := lstSensor.Items.Add;
    li.Caption := rdr.FData.Instance_Identifier;
    case rdr.OperationalStatus of
      sopOff:
        li.SubItems.Add('Off');
      sopOn:
        li.SubItems.Add('On');
      sopDamage:
        li.SubItems.Add('Damaged');
      sopTooDeep:
        li.SubItems.Add('Too Deep');
      sopEMCON:
        li.SubItems.Add('EMCON');
    end;
  end;
  // sonar
  for i := 0 to PfList.Vehicle.Sonars.Count - 1 do
  begin
    snr := PfList.Vehicle.Sonars[i];
    li := lstSensor.Items.Add;
    li.Caption := snr.FData.Instance_Identifier;
    case snr.OperationalStatus of
      sopOff:
        li.SubItems.Add('Off');
      sopActive:
        li.SubItems.Add('Active');
      sopPassive:
        li.SubItems.Add('Passive');
      sopTooDeep:
        li.SubItems.Add('Too Deep');
      sopTooFast:
        li.SubItems.Add('Too Fast');
      sopDamage:
        li.SubItems.Add('Damage');
      sopEMCON:
        li.SubItems.Add('EMCON');
    end;
  end;

  // ESM
  for i := 0 to PfList.Vehicle.ESMSensors.Count - 1 do
  begin
    esm := PfList.Vehicle.ESMSensors[i];
    li := lstSensor.Items.Add;
    li.Caption := esm.FData.Instance_Identifier;
    case esm.OperationalStatus of
      eosOn:
        li.SubItems.Add('On');
      eosOff:
        li.SubItems.Add('Off');
      eosTooDeep:
        li.SubItems.Add('Too Deep');
      eosDamaged:
        li.SubItems.Add('Damage');
    end;
  end;

  // Visual
  for i := 0 to PfList.Vehicle.Visualsensors.Count - 1 do
  begin
    vis := PfList.Vehicle.Visualsensors[i];
    li := lstSensor.Items.Add;
    li.Caption := vis.FData.Instance_Identifier;
    case vis.OperationalStatus of
      sopOn:
        li.SubItems.Add('On');
      sopOff:
        li.SubItems.Add('Off');
    end;
  end;

end;


procedure TfmSensor.lstSensorSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  selectedItem: TListItem;
  sensorType: integer;
begin
  selectedItem := lstSensor.ItemFocused;
  if FControlled = nil then
    exit;
  if selectedItem = nil then
    exit;

  sensorType := TPlatform_Instance(FControlled).defineSensorType
    (selectedItem.Caption, focused_sensor);
  if not Assigned(focused_sensor) then
    exit;
  FActiveTab := sensorType;

  case sensorType of
    1: begin
      RefreshRadarPropertiesTab(TRadar_On_Board(focused_sensor));

    end;
    2: begin
      RefreshSonarPropertiesTab(TSonar_On_Board(focused_sensor));
    end;
    3: begin
      RefreshVisualPropertiesTab(TVisual_Sensor_On_Board(focused_sensor));
    end;
    4: begin
      RefreshESMPropertiesTab(TESM_On_Board(focused_sensor));
    end;
  end;

end;

procedure TfmSensor.RefreshVisualPropertiesTab(visual: TVisual_Sensor_On_Board);
begin
  grbVisualDetectorSensor.BringToFront;

  with visual do
  begin
    if ShowRange then
      sbVisualDetectorDisplayRangeShow.Down := true
    else
      sbVisualDetectorDisplayRangeHide.Down := true;

    if ShowBlindZone then
      sbVisualDetectorDisplayBlindZonesShow.Down := true
    else
      sbVisualDetectorDisplayBlindZonesHide.Down := true;

  end;
end;

procedure TfmSensor.Refresh_VisibleTab;
begin
  case FActiveTab of
    1: begin
      RefreshRadarPropertiesTab(TRadar_On_Board(focused_sensor));

    end;
    2: begin
      RefreshSonarPropertiesTab(TSonar_On_Board(focused_sensor));
    end;
    3: begin
      RefreshVisualPropertiesTab(TVisual_Sensor_On_Board(focused_sensor));
    end;
    4: begin
      RefreshESMPropertiesTab(TESM_On_Board(focused_sensor));
    end;

  end;
end;

procedure TfmSensor.sbESMSensorControlModeClick(Sender: TObject);
begin
  if Assigned(focused_sensor) and (focused_sensor.ClassType = TESM_On_Board)
    then
  begin
    with TESM_On_Board(focused_sensor) do
    begin

      case TSpeedButton(Sender).Tag of
        1:
          begin
            OperationalStatus := eosOn;

            if FControlled <> nil then

              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlled)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_ESM,
                FData.ESM_Instance_Index, CORD_ID_OperationalStatus, byte
                  (OperationalStatus));
          end;
        2:
          begin
            OperationalStatus := eosOff;

            if FControlled <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlled)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_ESM,
                FData.ESM_Instance_Index, CORD_ID_OperationalStatus, byte
                  (OperationalStatus));
          end;
        3:
          begin
            ShowBlindZone := true;
          end;
        4:
          begin
            ShowBlindZone := false;
          end;
      end;
    end;
  end;

end;

procedure TfmSensor.sbSearchRadarClick(Sender: TObject);
begin
  if Assigned(focused_sensor) and (focused_sensor.ClassType = TRadar_On_Board)
    then
  begin
    with TRadar_On_Board(focused_sensor) do
      case TSpeedButton(Sender).Tag of
        1:
          ShowRange := true;
        2:
          ShowRange := false;
        3:
          ShowBlindZone := true;
        4:
          ShowBlindZone := false;
        5:
          FShowScanSector := true;
        6:
          FShowScanSector := false;
        9:
          begin
            ControlMode := rcmSearchTrack;
            if FControlled <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlled)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_RADAR,
                FData.Radar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));

          end;
        10:
          begin
            ControlMode := rcmTrack;

            if FControlled <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlled)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_RADAR,
                FData.Radar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));
          end;
        11:
          begin
            ControlMode := rcmOff;

            if FControlled <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlled)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_RADAR,
                FData.Radar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));
          end;
      end;
  end;

end;


procedure TfmSensor.sbSonarClick(Sender: TObject);
begin
  if Assigned(focused_sensor)
  and (focused_sensor.ClassType = TSonar_On_Board) then
    with TSonar_On_Board(focused_sensor) do
      case TSpeedButton(Sender).Tag of
        1:
          begin
            ControlMode := scmActive;
            if FControlled <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlled)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_SONAR,
                FData.Sonar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));

          end;
        2:
          begin
            ControlMode := scmPassive;
            if FControlled <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlled)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_SONAR,
                FData.Sonar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));

          end;
        3:
          begin
            ControlMode := scmOff;
            if FControlled <> nil then
              SimMgrClient.netSend_CmdSensor
                (TPlatform_Instance(FControlled)
                  .FData.Platform_Instance_Index, CSENSOR_TYPE_SONAR,
                FData.Sonar_Instance_Index, CORD_ID_ControlMode, byte
                  (ControlMode));

          end;
        6:
          ShowRange := false;
        7:
          ShowRange := true;
        8:
          ShowBlindZone := false;
        9:
          ShowBlindZone := true;
      end;


end;

procedure TfmSensor.sbVisualSensorClick(Sender: TObject);
begin
  if Assigned(focused_sensor) and (focused_sensor.ClassType =
      TVisual_Sensor_On_Board) then
    with TVisual_Sensor_On_Board(focused_sensor) do
      case TSpeedButton(Sender).Tag of
        1:
          ShowRange := true;
        2:
          ShowRange := false;
        3:
          ShowBlindZone := true;
        4:
          ShowBlindZone := false;
      end;
end;

procedure TfmSensor.RefreshESMPropertiesTab(esm: TESM_On_Board);
begin
  grbESMSensorControl.BringToFront;
  case esm.OperationalStatus of
    eosOn:
      begin
        sbESMSensorControlModeOn.Down := true;
        sbESMSensorControlModeOn.Enabled := true;
        sbESMSensorControlModeOff.Down := false;
        sbESMSensorControlModeOff.Enabled := true;
      end;
    eosOff:
      begin
        sbESMSensorControlModeOn.Down := false;
        sbESMSensorControlModeOn.Enabled := true;
        sbESMSensorControlModeOff.Down := true;
        sbESMSensorControlModeOff.Enabled := true;
      end;
    eosTooDeep:
      begin
        sbESMSensorControlModeOn.Enabled := false;
        sbESMSensorControlModeOff.Enabled := false;
      end;
    eosDamaged:
      begin
        sbESMSensorControlModeOn.Enabled := false;
        sbESMSensorControlModeOff.Enabled := false;
      end;
  end;

  if esm.ShowBlindZone then
    sbESMSensorDisplayBlindZoneShow.Down := true
  else
    sbESMSensorDisplayBlindZoneHide.Down := true
end;

procedure TfmSensor.RefreshRadarPropertiesTab(radar: TRadar_On_Board);
begin
  grbSearchRadarControl.BringToFront;

  with radar do
  begin
    if ShowRange then
      sbRangeShow.Down := true
    else
      sbRangeHide.Down := true;
    if ShowBlindZone then
      sbBlindShow.Down := true
    else
      sbBlindHide.Down := true;
    if FShowScanSector then
      sbScanShow.Down := true
    else
      sbScanHide.Down := true;

    case ControlMode of
      rcmOff:
        sbControlModeOff.Down := true;
      rcmTrack:
        sbControlModeTrack.Down := true;
      rcmSearchTrack:
        sbControlModeSearch.Down := true;
    end;

    case FScanSector of
      rscFull:
        sbScanModeFull.Down := true;
      rscPartial:
        sbScanModePartial.Down := true;
    end;

    sbScanModeFull.Enabled      := FDef.Sector_Scan_Capable;
    sbScanModePartial.Enabled   := FDef.Sector_Scan_Capable;
    sbScanShow.Enabled          := FDef.Sector_Scan_Capable;
    sbScanHide.Enabled          := FDef.Sector_Scan_Capable;
    editScanStart.Enabled       := FDef.Sector_Scan_Capable;
    editScanEnd.Enabled         := FDef.Sector_Scan_Capable;
    btnComboScanStrart.Enabled  := FDef.Sector_Scan_Capable;

    if FDef.Sector_Scan_Capable then
    begin
      editScanStart.Text := FormatFloat('#.##', FStartScan);
      editScanEnd.Text := FormatFloat('#.##', FEndScan);
      case FScanSector of
        rscFull:
          begin
            sbScanModeFull.Down := true;
            editScanStart.Enabled := true;
            editScanEnd.Enabled := true;
            btnComboScanStrart.Enabled := true;
          end;
        rscPartial:
          begin
            sbScanModePartial.Down := true;
            editScanStart.Enabled := false;
            editScanEnd.Enabled := false;
            btnComboScanStrart.Enabled := false;
          end;
      end;
    end
    else
    begin
      editScanStart.Text := '0';
      editScanEnd.Text := '0';
    end;
  end;
end;

procedure TfmSensor.RefreshSonarPropertiesTab(sonar: TSonar_On_Board);
begin
  grbSonarControl.BringToFront;

  with sonar do
  begin
    if ShowRange then
      sbDisplayRangeShow.Down := true
    else
      sbDisplayRangeHide.Down := true;

{    if ShowBlindZone then
      sbDisplayBlindZonesShow.Down := true
    else
      sbDisplayBlindZonesHide.Down := true;
}
    // sonar classification : active, passive, active/passive,passive intercept
    case FDef.Sonar_Classification of
      // active
      0:
        begin
          sbSonarControlModePassive.Enabled := false;
          sbSonarControlModeActive.Enabled := true;
        end;
      // passive or passive intercept
      1, 3:
        begin
          sbSonarControlModePassive.Enabled := true;
          sbSonarControlModeActive.Enabled := false;
        end;
      // active / passive
      2:
        begin
          sbSonarControlModePassive.Enabled := true;
          sbSonarControlModeActive.Enabled := true;
        end;
    end;
    case ControlMode of
      scmOff:
        sbSonarControlModeOff.Down := true;
      scmPassive:
        sbSonarControlModePassive.Down := true;
      scmActive:
        sbSonarControlModeActive.Down := true;
    end;

    case OperationalStatus of
      sopTooDeep, sopTooFast, sopTooSlow, sopTooHigh:
        begin
          sbSonarControlModeActive.Enabled := false;
          sbSonarControlModeOff.Enabled := false;
          sbSonarControlModePassive.Enabled := false;
        end;
    end;
  end;

end;


end.
