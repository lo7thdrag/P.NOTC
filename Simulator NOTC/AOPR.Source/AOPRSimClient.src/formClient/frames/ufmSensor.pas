unit ufmSensor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, uSimObjects,
  ufmControlled, uT3unit, uT3Radar, uT3Sonar, uT3Sensor, uT3Sonobuoy,
  uT3Visual, uT3OtherSensor, uGameData_TTT,

  //nando uses weapon (karena jika sensor on weapon off (showrange))
   uT3UnitContainer,uT3Weapon, uBaseCoordSystem, uT3DetectedTrack, Menus;

type
  TfmSensor = class(TfmControlled)
    PanelSensorChoices: TPanel;
    lstSensor: TListView;
    PanelSensorControl: TPanel;
    grbIFFTransponderControl: TGroupBox;
    grbAnomalyDetectorSensor: TGroupBox;
    Label225: TLabel;
    Bevel47: TBevel;
    Label230: TLabel;
    sbAnomalyDetectorControlModeOn: TSpeedButton;
    sbAnomalyDetectorControlModeOff: TSpeedButton;
    grbElectroOpticalSensor: TGroupBox;
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
    Label261: TLabel;
    Bevel31: TBevel;
    Label262: TLabel;
    Label263: TLabel;
    Label264: TLabel;
    btnControlComboInterval: TSpeedButton;
    sbControlEccmOn: TSpeedButton;
    sbControlEccmOff: TSpeedButton;
    sbRangeShow: TSpeedButton;
    sbRangeHide: TSpeedButton;
    sbBlindShow: TSpeedButton;
    sbBlindHide: TSpeedButton;
    sbScanShow: TSpeedButton;
    sbScanHide: TSpeedButton;
    cbActivationInterval: TCheckBox;
    editComboInterval: TEdit;
    btShowRangeAltitude: TButton;
    btExecuteSingleScan: TButton;
    grbIFFInterrogatorControl: TGroupBox;
    grbSonobuoyControl: TGroupBox;
    grbESMSensorControl: TGroupBox;
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
    ScrollBox3: TScrollBox;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    sbElectroOpticalSensorDisplayRangeShow: TSpeedButton;
    sbElectroOpticalSensorDisplayRangeHide: TSpeedButton;
    sbElectroOpticalSensorBlindZoneShow: TSpeedButton;
    sbElectroOpticalSensorBlindZoneHide: TSpeedButton;
    sbElectroOpticalSensorControlModeOn: TSpeedButton;
    sbElectroOpticalSensorControlModeOff: TSpeedButton;
    ScrollBox4: TScrollBox;
    Label6: TLabel;
    Bevel3: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel4: TBevel;
    Label9: TLabel;
    sbESMSensorControlModeOn: TSpeedButton;
    sbESMSensorControlModeOff: TSpeedButton;
    sbESMSensorDisplayBlindZoneShow: TSpeedButton;
    sbESMSensorDisplayBlindZoneHide: TSpeedButton;
    ScrollBox5: TScrollBox;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    btnIFFInterrogatorTrackSearch: TSpeedButton;
    cbbtnIFFInterrogatorMode1: TCheckBox;
    cbbtnIFFInterrogatorMode2: TCheckBox;
    cbbtnIFFInterrogatorMode3: TCheckBox;
    cbbtnIFFInterrogatorMode3C: TCheckBox;
    cbbtnIFFInterrogatorMode4: TCheckBox;
    editbtnIFFInterrogatorTrack: TEdit;
    edtIFFInterrogatorMode1: TEdit;
    edtIFFInterrogatorMode2: TEdit;
    edtIFFInterrogatorMode3: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    sbIFFInterrogatorControlModeOff: TSpeedButton;
    sbIFFInterrogatorControlModeOn: TSpeedButton;
    ScrollBox6: TScrollBox;
    Bevel8: TBevel;
    Bevel9: TBevel;
    cbIFFTransponderControlMode1: TCheckBox;
    cbIFFTransponderControlMode2: TCheckBox;
    cbIFFTransponderControlMode3: TCheckBox;
    cbIFFTransponderControlMode3C: TCheckBox;
    cbIFFTransponderControlMode4: TCheckBox;
    edtIFFTransponderControlMode1: TEdit;
    edtIFFTransponderControlMode2: TEdit;
    edtIFFTransponderControlMode3: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    sbIFFTransponderControlModeOff: TSpeedButton;
    sbIFFTransponderControlModeOn: TSpeedButton;
    ScrollBox7: TScrollBox;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    btnSonobuoyControlCombo: TSpeedButton;
    btnSonobuoyControlDeploy: TButton;
    editControlDepth: TEdit;
    editControlMode: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    lblSonobuoyMonitorCurrently: TLabel;
    lblSonobuoyMonitorPlatform: TLabel;
    lblStatusSonobuoy: TLabel;
    lbStatusQuantity: TLabel;
    pnlControlRadar: TPanel;
    btnControlModeOff2: TSpeedButton;
    btnControlModeOn: TSpeedButton;
    pnlControlModeRadar2: TPanel;
    sbControlModeSearch: TSpeedButton;
    sbControlModeTrack: TSpeedButton;
    sbControlModeOff: TSpeedButton;
    pnlScanSector: TPanel;
    Bevel30: TBevel;
    Label200: TLabel;
    Label201: TLabel;
    sbScanModePartial: TSpeedButton;
    sbScanModeFull: TSpeedButton;
    Label202: TLabel;
    Label203: TLabel;
    editScanStart: TEdit;
    editScanEnd: TEdit;
    Label205: TLabel;
    Label204: TLabel;
    btnComboScanStrart: TSpeedButton;
    pnlDeployment: TPanel;
    pmModeSonobuoy: TPopupMenu;
    PanelALL: TPanel;
    lblRangeTIOW: TLabel;
    btnRange1: TSpeedButton;
    btnRAnge2: TSpeedButton;
    btnRange3: TSpeedButton;
    btnManual: TSpeedButton;
    btnAutomatic: TSpeedButton;
    lblInterrogation: TLabel;

    procedure lstSensorSelectItem(Sender: TObject; Item: TListItem;
              Selected: Boolean);
    procedure sbESMSensorControlModeClick(Sender: TObject);
    procedure sbSearchRadarClick(Sender: TObject);
    procedure sbSonarClick(Sender: TObject);
    procedure sbVisualSensorClick(Sender: TObject);
    procedure sbElectroOpticalSensorOnClick(Sender: TObject);
    procedure sbAnomalyDetectorOnClick(Sender: TObject);
    procedure btnIFFOnClick(Sender: TObject);
    procedure edtInterrogatorOnKeyPress(Sender: TObject; var Key: Char);
    procedure edtTransponderOnKeyPressed(Sender: TObject; var Key: Char);
    procedure OnIFFCheckedClick(Sender: TObject);
    procedure UpdateObserve();
    procedure btnIFFInterrogatorTrackSearchClick(Sender: TObject);
    procedure btnSonobuoyControlDeployClick(Sender: TObject);
    procedure btnSonobuoyControlComboClick(Sender: TObject);
  private
    { Private declarations }
    Focused_Sensor: TSimObject;
    FTargetObject : TSimObject;
    //nando
    FVisibleShowRange : Boolean;
    FVisibleShowBlind : Boolean;
    FVehiclePlatform  : TT3UnitContainer;
    recSonobuoy       : TRecCmd_LaunchSonobuoy;

    procedure HideRangeRadar;
    procedure SetRangeRadar;
    procedure HideRangeWeapon;

    procedure HideBlindRadar;
    procedure SetBlindRadar;
    procedure HideBlindWeapon;

    procedure RefreshIFFTransponderTab(iff : TT3IFFSensor);
    procedure RefreshIFFInterrogatorTab(iff : TT3IFFSensor);
    procedure OnMenuSonobuoyClick(Sender : TObject);
    procedure SetTIOWRangeSonar(aValue : Boolean);
  protected
    procedure DisplayTab(const i: byte); override;
  public
    { Public declarations }
    focused_platform: TSimObject;

    procedure InitCreate(sender: TForm); override;
    procedure UpdateSensorList(sensor : TT3Sensor);
    procedure UpdateSensorForm(sensor : TT3Sensor);
    procedure UpdateIFFSensorList(sensor : TT3IFFSensor;value : byte);
    procedure SetFocusedPlatform(pi: TT3PlatformInstance);
    procedure setActiveSensor(const sens: TSimObject);
    procedure RefreshPlatformSensorsTab
              (PfList: TT3PlatformInstance);
    procedure SetControlledObject(ctrlObj: TObject); override;
    procedure SetTargetObject(tgtObj : TSimObject);

    procedure Refresh_VisibleTab;
    procedure RefreshVisualPropertiesTab(visual: TT3Visual);
    procedure RefreshSonarPropertiesTab(sonar: TT3Sonar);
    procedure RefreshRadarPropertiesTab(radar: TT3Radar);
    procedure RefreshESMPropertiesTab(esm: TT3ESMSensor);
    procedure RefreshEOPropertiesTab(eo: TT3EOSensor);
    procedure RefreshMADPropertiesTab(mad : TT3MADSensor);
    procedure RefreshIFFPropertiesTab(iff : TT3IFFSensor);
    procedure RefreshSonobuoyPropertiesTab(sonobuoy: TT3SonobuoyOnVehicle);
    procedure RemoveListSensor(ctrlObj: TObject);

    //nando & farid
    procedure HideAllRange;//(pi: TT3PlatformInstance);
    procedure ShowRangeSelected;
    procedure HideAllBlind;
    procedure ShowBlindSelected;
  end;

implementation

{$R *.dfm}

uses
  tttData, uSimMgr_Client,  uT3Vehicle, math, ufToteDisplay;

//type
//  RecIFF = class (TSimObject)
//    IFFType : integer; // 1 :transponder, 2 : interrogator
//    Data    : TT3Sensor;
//
//  public
//    constructor Create;
//    destructor Destroy; override;
//  end;

//var
//  recIFFTransponder  : RecIFF;
//  recIFFInterrogator : RecIFF;
//  recSonobuoy       : TRecCmd_LaunchSonobuoy;

function OctToDec(OctStr: string): string;
var
  OctChar : set of AnsiChar;
  DecNum: Real;
  i: Integer;
  Error: Boolean;
begin
  OctChar:= ['0','1','2','3','4','5','6','7'];
  DecNum := 0;
  Error := False;

  for i := Length(OctStr) downto 1 do
  begin
    if not(CharInSet(OctStr[i], OctChar)) then //(OctStr[i] in ['0','1','2','3','4','5','6','7']) then
    begin
      Error := True;
      ShowMessage('This is not octal number');

      Break;
    end;

    DecNum := DecNum + StrToInt(OctStr[i]) * Power(8, Length(OctStr)-i);
  end;

  if not Error then
    Result := FloatToStr(DecNum)
  else
    Result := '';
end;

Function DecToOct(Inp : String): String;
Var
  HasilBagi,SisaBagi : Integer;
  Oct,Oktal : String;
  i : integer;
  Des : integer;
Begin
  Oct := '';
  Oktal := '';
  Des := StrToInt(inp);

  Repeat
	  SisaBagi := des Mod 8;
    Oct := Oct + intToStr(SisaBagi);
    HasilBagi := Des Div 8;
    des := HasilBagi;
  Until
    HasilBagi = 0;

  For I := length (Oct) Downto 1 Do
  Begin
    Oktal := Oktal+ Oct[i];
  End;

  Result := Oktal;
End;

procedure TfmSensor.setActiveSensor(const sens: TSimObject);
begin
  Focused_Sensor := sens;
end;

procedure TfmSensor.SetControlledObject(ctrlObj: TObject);
var
  device : TSimObject;
begin
  inherited;

  if not(Assigned(ctrlObj)) then
    Exit;

  RefreshPlatformSensorsTab(TT3PlatformInstance(ctrlObj));

  if lstSensor.Items.Count = 0 then
  begin
    PanelSensorControl.Visible := False;
    Exit;
  end
  else
    PanelSensorControl.Visible := True;

  if not(ctrlObj is TT3Vehicle) then
    Exit;

  device := TT3Vehicle(ctrlObj).Devices.Items[0];
  if not(Assigned(device)) or not(device is TT3Sensor) then
    Exit
  else
    focused_sensor := device;

  //lstSensor.ItemFocused := lstSensor.Items[0];

  //selectedItem := lstSensor.ItemFocused;
  //focused_sensor := selectedItem.Data;

  if not Assigned(focused_sensor) then
    exit;

  if focused_sensor is TT3Radar then
    RefreshRadarPropertiesTab(TT3radar(focused_sensor))
  else if focused_sensor is TT3Sonar then
    RefreshSonarPropertiesTab(TT3Sonar(focused_sensor))
  else if focused_sensor is TT3Visual then
    RefreshVisualPropertiesTab(TT3Visual(focused_sensor))
  else if focused_sensor is TT3ESMSensor then
    RefreshESMPropertiesTab(TT3ESMSensor(focused_sensor))
  else if focused_sensor is TT3EOSensor then
    RefreshEOPropertiesTab(TT3EOSensor(focused_sensor))
  else if focused_sensor is TT3MADSensor then
    RefreshMADPropertiesTab(TT3MADSensor(focused_sensor))
  else if focused_sensor is TT3IFFSensor then
    RefreshIFFPropertiesTab(TT3IFFSensor(focused_sensor))
  else if focused_sensor is TT3Sonobuoy then
    RefreshSonobuoyPropertiesTab(TT3SonobuoyOnVehicle(focused_sensor));

  HideRangeRadar;
  HideBlindRadar;
  SetRangeRadar;
  SetBlindRadar;
end;

procedure TfmSensor.SetRangeRadar;
var
  VehicleSensor : TT3DeviceUnit;
  i : Integer;
begin
  if not(Assigned(FControlled)) then Exit;

  for i := 0 to (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Count - 1 do
  begin
    VehicleSensor := (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Items[i];
	  if not(Assigned(VehicleSensor)) then Continue;

    if VehicleSensor is TT3Sensor then
    begin
      if (VehicleSensor as TT3Sensor).ShowRange then
      begin
        (VehicleSensor as TT3Sensor).ShowRangeSelected := True;

        Break;
      end;
    end;
  end;
end;

procedure TfmSensor.HideRangeRadar;
var
  i,j : Integer;

  AllVehicle : TT3PlatformInstance;
  VehicleSensor : TT3DeviceUnit;
begin
  FVehiclePlatform := simMgrClient.SimPlatforms;
  if not Assigned(FVehiclePlatform) then Exit;

  for i := 0 to FVehiclePlatform.itemCount - 1 do
  begin
    AllVehicle := TT3PlatformInstance(FVehiclePlatform.getObject(i));
	  if not(Assigned(AllVehicle)) then Continue;

    if AllVehicle is TT3Vehicle then
    begin
      for j := 0 to (AllVehicle as TT3Vehicle).Devices.Count - 1 do
      begin
        VehicleSensor := (AllVehicle as TT3Vehicle).Devices.Items[j];
        if not(Assigned(VehicleSensor)) then Continue;

        if VehicleSensor is TT3Sensor then
        begin
          (VehicleSensor as TT3Sensor).ShowRangeSelected := False;
        end;
      end;
    end;
  end;
end;

procedure TfmSensor.HideRangeWeapon;
var
  i : Integer;
  VehicleWeapon : TT3Weapon;
begin
  if not(Assigned(FControlled)) then Exit;

  for i := 0 to (TT3PlatformInstance(FControlled) as TT3Vehicle).Weapons.Count - 1 do
  begin
    VehicleWeapon := (TT3PlatformInstance(FControlled) as TT3Vehicle).Weapons.Items[i];
	  if not(Assigned(VehicleWeapon)) then Continue;

    if VehicleWeapon is TT3Weapon then
    begin
      if (VehicleWeapon as TT3Weapon).ShowRange then
      begin
        (VehicleWeapon as TT3Weapon).ShowRangeSelected := False;
        //(VehicleWeapon as TT3Weapon).ShowRange := False;
      end;
    end;
  end;
end;

procedure TfmSensor.HideAllRange;{(pi: TT3PlatformInstance); }
var
  I, index  : Integer;
  sensor    : TT3Sensor;
  obj       : TObject;
  //vehicle : TT3Vehicle;
begin
  {if not(Assigned(pi)) or not(pi is TT3Vehicle) then exit;

  vehicle := TT3Vehicle(pi);
  if not(Assigned(vehicle)) then Exit;

  if vehicle.Devices.Count > 0 then
  begin
    for I := 0 to vehicle.Devices.Count - 1 do
    begin
      sensor := TT3Sensor(vehicle.Devices.Items[i]);
	    if not(Assigned(sensor)) then Continue;
      
      //sensor := lstSensor.Items[I].Data;
      //sensor.ShowRange := false;
      sensor.ShowRangeSelected := False;
    end;
  end;}

  index := lstSensor.itemIndex;

  for I := 0 to lstSensor.Items.Count - 1 do
  begin
    if (I <> index) then
    begin
      obj := lstSensor.Items[I].Data;

      if (obj is RecIFF) then
        begin
          sensor := TT3Sensor(RecIff(obj).Data);
        end
      else
        sensor := TT3Sensor(obj);

      //sensor.ShowRange := false;
      sensor.ShowRangeSelected := False;
    end;
  end;
end;

procedure TfmSensor.ShowRangeSelected;
var
  I, index  : Integer;
  sensor    : TT3Sensor;
  obj       : TObject;
begin
  index := -1;
  i := lstSensor.itemIndex;

  if (I <> index) then
  begin
    obj := lstSensor.Items[I].Data;

    if (obj is RecIFF) then
      begin
        sensor := TT3Sensor(RecIff(obj).Data);
      end
    else
      sensor := TT3Sensor(obj);

    //sensor := lstSensor.Items[I].Data;
	  if not(Assigned(sensor)) then Exit;

    if sensor.ShowRange then
    begin
      sensor.ShowRangeSelected := True;
    end;
  end;
end;

procedure TfmSensor.HideBlindRadar;
var
  i,j : Integer;

  AllVehicle : TT3PlatformInstance;
  VehicleSensor : TT3DeviceUnit;
begin
  FVehiclePlatform := simMgrClient.SimPlatforms;
  if not Assigned(FVehiclePlatform) then Exit;

  for i := 0 to FVehiclePlatform.itemCount - 1 do
  begin
    AllVehicle := TT3PlatformInstance(FVehiclePlatform.getObject(i));
	  if not(Assigned(AllVehicle)) then Continue;

    if AllVehicle is TT3Vehicle then
    begin
      for j := 0 to (AllVehicle as TT3Vehicle).Devices.Count - 1 do
      begin
        VehicleSensor := (AllVehicle as TT3Vehicle).Devices.Items[j];
		    if not(Assigned(VehicleSensor)) then Continue;

        if VehicleSensor is TT3Sensor then
        begin
          (VehicleSensor as TT3Sensor).ShowBlindSelected := False;
        end;
      end;
    end;
  end;
end;

procedure TfmSensor.SetBlindRadar;
var
  VehicleSensor : TT3DeviceUnit;
  i : Integer;
begin
  if not(Assigned(FControlled)) then Exit;

  for i := 0 to (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Count - 1 do
  begin
    VehicleSensor := (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Items[i];
	  if not(Assigned(VehicleSensor)) then Continue;

    if VehicleSensor is TT3Sensor then
    begin
      if (VehicleSensor as TT3Sensor).ShowBlindZone then
      begin
        (VehicleSensor as TT3Sensor).ShowBlindSelected := True;

        Break;
      end;
    end;
  end;
end;

procedure TfmSensor.HideBlindWeapon;
var
  i : Integer;
  VehicleWeapon : TT3Weapon;
begin
  if not(Assigned(FControlled)) then Exit;

  for i := 0 to (TT3PlatformInstance(FControlled) as TT3Vehicle).Weapons.Count - 1 do
  begin
    VehicleWeapon := (TT3PlatformInstance(FControlled) as TT3Vehicle).Weapons.Items[i];
	  if not(Assigned(VehicleWeapon)) then Continue;
    
    if VehicleWeapon is TT3Weapon then
    begin
      if (VehicleWeapon as TT3Weapon).ShowBlind then
      begin
        (VehicleWeapon as TT3Weapon).ShowBlindSelected := False;
        //(VehicleWeapon as TT3Weapon).ShowRange := False;
      end;
    end;
  end;
end;

procedure TfmSensor.HideAllBlind;
var
  I, index  : Integer;
  sensor    : TT3Sensor;
  obj       : TObject;
begin
  index := lstSensor.itemIndex;

  for I := 0 to lstSensor.Items.Count - 1 do
  begin
    if (I <> index) then
    begin
      obj := lstSensor.Items[I].Data;

      if (obj is RecIFF) then
        begin
          sensor := TT3Sensor(RecIff(obj).Data);
        end
      else
        sensor := TT3Sensor(obj);

      //sensor := lstSensor.Items[I].Data;
      if not(Assigned(sensor)) then Continue;

      //sensor.ShowRange := false;
      sensor.ShowBlindSelected := False;
    end;
  end;
end;

procedure TfmSensor.ShowBlindSelected;
var
  I, index  : Integer;
  sensor    : TT3Sensor;
  obj       : TObject;
begin
  index := -1;
  i := lstSensor.itemIndex;

  if (I <> index) then
  begin
    obj := lstSensor.Items[I].Data;

    if (obj is RecIFF) then
      begin
        sensor := TT3Sensor(RecIff(obj).Data);
      end
    else
      sensor := TT3Sensor(obj);

    //sensor := lstSensor.Items[I].Data;
	  if not(Assigned(sensor)) then Exit;
    
    if sensor.ShowBlindZone then
    begin
      sensor.ShowBlindSelected := True;
    end;
  end;
end;

procedure TfmSensor.SetTargetObject(tgtObj: TSimObject);
begin
  FTargetObject := tgtObj;
end;

procedure TfmSensor.SetTIOWRangeSonar(aValue: Boolean);
begin
  lblRangeTIOW.Visible  := aValue;
  btnRange1.Visible     := aValue;
  btnRAnge2.Visible     := aValue;
  btnRange3.Visible     := aValue;
end;

procedure TfmSensor.UpdateSensorForm(sensor: TT3Sensor);
begin
  if not(Assigned(sensor)) then
    Exit;  

  UpdateSensorList(sensor);

  if sensor.Parent = FControlled then begin
    if (Assigned(Focused_Sensor)) and (Focused_Sensor is TT3Sensor) then
    begin
      if TT3Sensor(sensor).InstanceIndex = TT3Sensor(Focused_Sensor).InstanceIndex then
      begin
        if sensor is TT3Radar then
          RefreshRadarPropertiesTab(TT3radar(sensor))
        else if sensor is TT3Sonar then
          RefreshSonarPropertiesTab(TT3Sonar(sensor))
        else if sensor is TT3Visual then
          RefreshVisualPropertiesTab(TT3Visual(sensor))
        else if sensor is TT3ESMSensor then
          RefreshESMPropertiesTab(TT3ESMSensor(sensor))
        else if sensor is TT3EOSensor then
          RefreshEOPropertiesTab(TT3EOSensor(sensor))
        else if sensor is TT3MADSensor then
          RefreshMADPropertiesTab(TT3MADSensor(sensor))
        else if sensor is TT3IFFSensor then
          RefreshIFFPropertiesTab(TT3IFFSensor(sensor))
        else if sensor is TT3SonobuoyOnVehicle then
          RefreshSonobuoyPropertiesTab(TT3SonobuoyOnVehicle(sensor));
      end;
    end;
  end;
end;

procedure TfmSensor.UpdateSensorList(sensor : TT3Sensor);
var
  i: integer;
  li: TListItem;
  obj: TObject;
  rec : RecIFF;
begin
  if lstSensor.Items.count = 0 then exit;

  if not(Assigned(sensor)) then Exit;

  if sensor.Parent <> FControlled then Exit;

  for i := 0 to lstSensor.Items.Count - 1 do
  begin
    li := lstSensor.Items[i];
	  if not(Assigned(li)) then Continue;

    obj := li.Data;
    if not(Assigned(obj)) then Continue;

    if obj is RecIFF then
	  begin
      rec := RecIff(obj);
	    if not(Assigned(rec)) then Continue;

      if rec.IFFType = 1 then
      begin
        if sensor.EmconOperationalStatus = EmconOff then
        begin
          case TT3IFFSensor(sensor).TransponderOperateStatus of
            sopOff:
              li.SubItems[0] := 'Off';
            sopOn:
              li.SubItems[0] := 'On';
            sopOffIFF:
              li.SubItems[0] := 'Off';
            sopDamage:
              li.SubItems[0] := 'Damaged';
            sopTooDeep:
              li.SubItems[0] := 'Too Deep';
            sopEMCON:
              li.SubItems[0] := 'EMCON';
            sopActive:
              li.SubItems[0] := 'Active';
            sopPassive:
              li.SubItems[0] := 'Passive';
            sopTooFast:
              li.SubItems[0] := 'Too Fast';
			      //------------------------------  //17042012 mk
            sopDeploying:
              li.SubItems[0] := 'Deploying';
            sopDeployed:
              li.SubItems[0] := 'Deployed';
            sopStowing:
              li.SubItems[0] := 'Stowing';
            sopStowed:
              li.SubItems[0] := 'Stowed';
            //------------------------------ //17042012 mk
          end;
        end
        else
        begin
          case sensor.EmconOperationalStatus of
            EmconOn:
              li.SubItems[0] := 'EMCON';
            EmconOff:
              li.SubItems[0] := 'off';
          end;
        end;
      end
      else
      begin
        if sensor.EmconOperationalStatus = EmconOff then
        begin
          case TT3IFFSensor(sensor).InterrogatorOperateStatus of
            sopOff:
              li.SubItems[0] := 'Off';
            sopOn:
              li.SubItems[0] := 'On';
            sopOffIFF:
              li.SubItems[0] := 'Off';
            sopDamage:
              li.SubItems[0] := 'Damaged';
            sopTooDeep:
              li.SubItems[0] := 'Too Deep';
            sopEMCON:
              li.SubItems[0] := 'EMCON';
            sopActive:
              li.SubItems[0] := 'Active';
            sopPassive:
              li.SubItems[0] := 'Passive';
            sopTooFast:
              li.SubItems[0] := 'Too Fast';
			      //------------------------------  //17042012 mk
            sopDeploying:
              li.SubItems[0] := 'Deploying';
            sopDeployed:
              li.SubItems[0] := 'Deployed';
            sopStowing:
              li.SubItems[0] := 'Stowing';
            sopStowed:
              li.SubItems[0] := 'Stowed';
            //------------------------------  //17042012 mk
          end;
        end
        else
        begin
          case sensor.EmconOperationalStatus of
            EmconOn:
              li.SubItems[0] := 'EMCON';
            EmconOff:
              li.SubItems[0] := 'off';
          end;
        end;
      end;
    end
    else
    begin
      if TT3Sensor(obj) = sensor then begin
        if sensor.EmconOperationalStatus = EmconOff then
        begin
          case sensor.OperationalStatus of
            sopOff:
            begin
              li.SubItems[0] := 'Off';
              if TT3Sensor(obj) is TT3Sonar then
              begin
                sbSonarControlModePassive.Down    := False;
                sbSonarControlModeActive.Down     := False;
                sbSonarControlModeOff.Down        := True;
              end;

            end;
            sopOffIFF:
              li.SubItems[0] := 'Off';
            sopOn:
              li.SubItems[0] := 'On';
            sopDamage:
              li.SubItems[0] := 'Damaged';
            sopTooDeep:
              li.SubItems[0] := 'Too Deep';
            sopEMCON:
              li.SubItems[0] := 'EMCON';
            sopActive:
            begin
              li.SubItems[0] := 'Active';
              if TT3Sensor(obj) is TT3Sonar then
              begin
                sbSonarControlModePassive.Down    := False;
                sbSonarControlModeActive.Down     := true;
                sbSonarControlModeOff.Down        := False;
              end;
            end;
            sopPassive:
            begin
              li.SubItems[0] := 'Passive';
              if TT3Sensor(obj) is TT3Sonar then
              begin
                sbSonarControlModePassive.Down    := true;
                sbSonarControlModeActive.Down     := False;
                sbSonarControlModeOff.Down        := False;
              end;
            end;
            sopTooFast:
              li.SubItems[0] := 'Too Fast';
			      sopDeployed:
              begin
                li.SubItems[0] := 'Deployed';              //17042012 mk
                if TT3Sensor(obj) is TT3Sonar then
                begin
                  lbCableActual.Caption := FloatToStr(TT3Sonar(TT3Sensor(obj)).ActualCable);
                   // ShowMessage(FloatToStr(TT3Sonar(TT3Sensor(obj)).OrderCable));
                  if TT3Sonar(TT3Sensor(obj)).SonarDefinition.FDef.Sonar_Classification = 0 then          //active
                  begin
                     sbSonarControlModePassive.Enabled := False;
                     sbSonarControlModeActive.Enabled  := True;
                     sbSonarControlModeActive.Down     := False;
                  end
                  else if (TT3Sonar(TT3Sensor(obj)).SonarDefinition.FDef.Sonar_Classification = 1) or      //passive
                          (TT3Sonar(TT3Sensor(obj)).SonarDefinition.FDef.Sonar_Classification = 3)  then   //passiveIntercept
                  begin
                    sbSonarControlModePassive.Enabled := true;
                    sbSonarControlModeActive.Enabled  := false;
                    sbSonarControlModePassive.Down    := False;
                  end
                  else if TT3Sonar(TT3Sensor(obj)).SonarDefinition.FDef.Sonar_Classification = 2  then     //activePassive
                  begin
                     sbSonarControlModePassive.Enabled := true;
                     sbSonarControlModeActive.Enabled  := True;
                  end;

                end;

                lblStatusDeployment.Caption := 'Deployed'; //17042012 mk
              end;
            sopDeploying:
              begin
                lbCableActual.Caption := IntToStr(Round(TT3Sonar(TT3Sensor(obj)).ActualCable));
                li.SubItems[0] := 'Deploying';              //17042012 mk
                lblStatusDeployment.Caption := 'Deploying'; //17042012 mk
                sbSonarControlModePassive.Enabled := false;
                sbSonarControlModeActive.Enabled  := false;
              end;
            sopStowed:
              begin

                li.SubItems[0] := 'Stowed';              //17042012 mk
                if TT3Sensor(obj) is TT3Sonar then
                begin
                  lbCableActual.Caption := IntToStr(Round(TT3Sonar(TT3Sensor(obj)).ActualCable));
                  sbSonarControlModePassive.Enabled := False;
                  sbSonarControlModeActive.Enabled  := False;
                end;

                lblStatusDeployment.Caption := 'Stowed'; //17042012 mk
              end;
            sopStowing:
              begin
                lbCableActual.Caption := IntToStr(Round(TT3Sonar(TT3Sensor(obj)).ActualCable));
                li.SubItems[0] := 'Stowing';              //17042012 mk
                lblStatusDeployment.Caption := 'Stowing'; //17042012 mk
                sbSonarControlModePassive.Enabled := false;
                sbSonarControlModeActive.Enabled  := false;
              end;
          end;
        end
        else
        begin
          case sensor.EmconOperationalStatus of
            EmconOn:
              li.SubItems[0] := 'EMCON';
            EmconOff:
              li.SubItems[0] := 'off';
          end;
        end;

        break;
      end;
    end;
  end;
end;

procedure TfmSensor.UpdateIFFSensorList(sensor : TT3IFFSensor; value : byte);
var
  i: integer;
  li: TListItem;
  obj : TObject;
  rec : RecIFF;
begin
  if lstSensor.Items.count = 0 then exit;

  if not(Assigned(sensor)) then Exit;

  for i := 0 to lstSensor.Items.Count - 1 do
  begin
	  li := lstSensor.Items[i];
    if not(Assigned(li)) then Continue;

    obj := li.Data;
    if not(Assigned(obj)) then Continue;

    if (obj is RecIFF) then 
	  begin
      rec := RecIff(obj);
	    if not(Assigned(rec)) then Continue;

      if rec.IFFType = 1 then
      begin
        if sensor.EmconOperationalStatus = EmconOff then
        begin
          case sensor.TransponderOperateStatus of
            sopOff:
              li.SubItems[0] := 'Off';
            sopOn:
              li.SubItems[0] := 'On';
            sopOffIFF:
              li.SubItems[0] := 'Off';
            sopDamage:
              li.SubItems[0] := 'Damaged';
            sopTooDeep:
              li.SubItems[0] := 'Too Deep';
            sopEMCON:
              li.SubItems[0] := 'EMCON';
            sopActive:
              li.SubItems[0] := 'Active';
            sopPassive:
              li.SubItems[0] := 'Passive';
            sopTooFast:
              li.SubItems[0] := 'Too Fast';
		        //------------------------------  //17042012 mk
            sopDeploying:
              li.SubItems[0] := 'Deploying';
            sopDeployed:
              li.SubItems[0] := 'Deployed';
            sopStowing:
              li.SubItems[0] := 'Stowing';
            sopStowed:
              li.SubItems[0] := 'Stowed';
            //------------------------------ //17042012 mk
          end;
        end
        else
        begin
          case sensor.EmconOperationalStatus of
            EmconOn:
              li.SubItems[0] := 'EMCON';
            EmconOff:
              li.SubItems[0] := 'off';
          end;
        end;
      end
      else
      begin
        if sensor.EmconOperationalStatus = EmconOff then
        begin
          case sensor.InterrogatorOperateStatus of
            sopOff:
              li.SubItems[0] := 'Off';
            sopOn:
              li.SubItems[0] := 'On';
            sopOffIFF:
              li.SubItems[0] := 'Off';
            sopDamage:
              li.SubItems[0] := 'Damaged';
            sopTooDeep:
              li.SubItems[0] := 'Too Deep';
            sopEMCON:
              li.SubItems[0] := 'EMCON';
            sopActive:
              li.SubItems[0] := 'Active';
            sopPassive:
              li.SubItems[0] := 'Passive';
            sopTooFast:
              li.SubItems[0] := 'Too Fast';
			      //------------------------------  //17042012 mk
            sopDeploying:
              li.SubItems[0] := 'Deploying';
            sopDeployed:
              li.SubItems[0] := 'Deployed';
            sopStowing:
              li.SubItems[0] := 'Stowing';
            sopStowed:
              li.SubItems[0] := 'Stowed';
            //------------------------------  //17042012 mk
          end;
        end
        else
        begin
          case sensor.EmconOperationalStatus of
            EmconOn:
              li.SubItems[0] := 'EMCON';
            EmconOff:
              li.SubItems[0] := 'off';
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmSensor.btnIFFInterrogatorTrackSearchClick(Sender: TObject);
var
  tgt : TT3PlatformInstance;
  myTrackId, targetTrackId, trackNum : string;
  sObject : TSimObject;
begin
  inherited;

  if focused_platform = nil then exit;

  if TT3Sensor(Focused_Sensor).OperationalStatus = sopDamage then Exit;

  tgt := TT3PlatformInstance(focused_platform);

  if Assigned(FControlled) then
    myTrackId := TT3PlatformInstance(FControlled).Track_ID
  else
    Exit;

  if Assigned(focused_platform) then
  begin
    if focused_platform is TT3NonRealVehicle then
    begin
      targetTrackId := IntToStr(TT3PlatformInstance(focused_platform).TrackNumber);
    end
    else if focused_platform is TT3Vehicle then
    begin
      targetTrackId := TT3PlatformInstance(focused_platform).Track_ID;
    end;

    sObject := simMgrClient.findDetectedTrack(focused_platform);
    if Assigned(sObject) then
    begin
      trackNum := FormatTrackNumber(TT3DetectedTrack(sObject).TrackNumber);
    end
    else
    begin
      trackNum := TT3PlatformInstance(focused_platform).TrackLabel;
    end;

    if (TT3PlatformInstance(focused_platform).PlatformDomain = 2) and
       (TT3PlatformInstance(focused_platform).Altitude > 0) then Exit;

    if (TT3PlatformInstance(FControlled).PlatformDomain = 2) and
       (TT3PlatformInstance(FControlled).Altitude > 0) then Exit;
  end;

  if myTrackId <> targetTrackId then
  begin
    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      editbtnIFFInterrogatorTrack.Text := targetTrackId
    else
      editbtnIFFInterrogatorTrack.Text := trackNum;  {ambil Track Numbernya}
  end;

//  if Assigned(TT3IFFSensor(focused_sensor).TargetObject) then
//  begin
//    TT3IFFSensor(focused_sensor).TransponderMode1Detail := '---';
//    TT3IFFSensor(focused_sensor).TransponderMode2Detail := '---';
//    TT3IFFSensor(focused_sensor).TransponderMode3Detail := '---';
//    TT3IFFSensor(focused_sensor).TransponderMode3CDetail := '---';
//  end;

  SimMgrClient.netSend_CmdTargetIFF(TT3PlatformInstance(FControlled).InstanceIndex, tgt.InstanceIndex,
                                    TT3IFFSensor(focused_sensor).InstanceIndex);
end;

procedure TfmSensor.SetFocusedPlatform(pi: TT3PlatformInstance);
begin
  focused_platform := pi;
end;

procedure TfmSensor.btnIFFOnClick(Sender: TObject);
begin
  inherited;

  if not(Assigned(FControlled)) then Exit;

  if Assigned(focused_sensor) and (focused_sensor is TT3IFFSensor) and
     not (TT3Sensor(Focused_Sensor).OperationalStatus = sopDamage) then
  begin
    with TT3IFFSensor(focused_sensor) do
    begin
      case TSpeedButton(Sender).Tag of
        1: //InterrogatorOperateStatus := sopOn;
          begin
            if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3IFFSensor) then
            SimMgrClient.netSend_CmdSensor
              (TT3PlatformInstance(FControlled).InstanceIndex,CSENSOR_TYPE_IFF,
               TT3IFFSensor(focused_sensor).InstanceIndex, recIFFInterrogator.IFFType,Byte(sopOn));
          end;
        2: //InterrogatorOperateStatus := sopOff;
          begin
            if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3IFFSensor) then
            SimMgrClient.netSend_CmdSensor
              (TT3PlatformInstance(FControlled).InstanceIndex,CSENSOR_TYPE_IFF,
               TT3IFFSensor(focused_sensor).InstanceIndex, recIFFInterrogator.IFFType,Byte(sopOffIFF));
          end;
        3: //TransponderOperateStatus  := sopOn;
          begin
            if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3IFFSensor) then
            SimMgrClient.netSend_CmdSensor
              (TT3PlatformInstance(FControlled).InstanceIndex,CSENSOR_TYPE_IFF,
               TT3IFFSensor(focused_sensor).InstanceIndex, recIFFTransponder.IFFType,Byte(sopOn));
          end;
        4: //TransponderOperateStatus  := sopOff;
          begin
            if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3IFFSensor) then
            SimMgrClient.netSend_CmdSensor
              (TT3PlatformInstance(FControlled).InstanceIndex,CSENSOR_TYPE_IFF,
               TT3IFFSensor(focused_sensor).InstanceIndex, recIFFTransponder.IFFType, Byte(sopOffIFF));
          end;
        5 : //mode automatic
        begin
          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3IFFSensor) then
          SimMgrClient.netSend_CmdIFFSearchMode(TT3PlatformInstance(FControlled).InstanceIndex,
          TT3IFFSensor(focused_sensor).InstanceIndex, 0); // 0  : automatic
        end;
        6 : //mode manual
        begin
          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3IFFSensor) then
          SimMgrClient.netSend_CmdIFFSearchMode(TT3PlatformInstance(FControlled).InstanceIndex,
          TT3IFFSensor(focused_sensor).InstanceIndex, 1); // 1  : manual
        end;
      end;

      UpdateObserve;
    end;
  end;
end;

procedure TfmSensor.btnSonobuoyControlComboClick(Sender: TObject);
var
  Pos : TPoint;
begin
  inherited;
  GetCursorPos(pos);
  pmModeSonobuoy.Popup(pos.X, pos.Y);
end;

procedure TfmSensor.btnSonobuoyControlDeployClick(Sender: TObject);
var
  batasSonobuoy : Integer;
begin
  inherited;
  if Focused_Sensor = nil then exit;
  if not (Focused_Sensor is TT3SonobuoyOnVehicle) then Exit;

  with TT3SonobuoyOnVehicle(Focused_Sensor)do
  begin
    batasSonobuoy := Quantity;
    if batasSonobuoy > 0 then
    begin
      if (editControlDepth.Text = '')then
        ShowMessage('Data Kedalaman belum diisi')
      else
      begin
        recSonobuoy.ParentPlatformID    := TT3PlatformInstance(TT3SonobuoyOnVehicle(Focused_Sensor).Parent).InstanceIndex;
        recSonobuoy.SonobuoyOnVehicleID := InstanceIndex;
        if editControlMode.Text = 'Active' then
          recSonobuoy.SonobuoyMode        := Byte(scmActive)//editControlMode.Text;
        else if editControlMode.Text = 'Passive' then
          recSonobuoy.SonobuoyMode        := Byte(scmPassive);
        recSonobuoy.Depth               := StrToFloat(editControlDepth.Text);
        recSonobuoy.AvailableQuantity   := Quantity -1 ;
        recSonobuoy.ProjectileInstanceIndex := 0;

        simMgrClient.netSend_CmdLaunchSonobuoy(recSonobuoy);
        lbStatusQuantity.Caption := IntToStr(Quantity - 1);
      end;
    end
    else
      ShowMessage('Sonobuoy Habis');
  end;

end;

procedure TfmSensor.DisplayTab(const i: byte);
begin
  inherited;

end;

procedure TfmSensor.edtInterrogatorOnKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  Value,IndexFocusPlatform : integer;
  tmp : string;
begin
  inherited;

  ValKey := [#48 .. #55, #8, #13];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if not(Assigned(FControlled)) then
      Exit;

	  if Assigned(Focused_Sensor) and (Focused_Sensor is TT3IFFSensor) and
       not (TT3Sensor(Focused_Sensor).OperationalStatus = sopDamage) then
    begin
      with TT3IFFSensor(Focused_Sensor) do
      begin
        if TryStrToInt(TEdit(Sender).Text, Value) then
        begin
          tmp := OctToDec(TEdit(Sender).Text);
          Value := StrToInt(tmp);
        end;

        if focused_platform = nil then
          IndexFocusPlatform := 0
        else
          IndexFocusPlatform := TT3PlatformInstance(focused_platform).InstanceIndex;

        case TEdit(Sender).Tag of
          1 :
          begin
            // InterrogatorMode1Enabled := TCheckBox(Sender).Checked;
            InterrogatorMode1 := Value;
            SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex,
                                              IndexFocusPlatform, TT3IFFSensor(focused_sensor).InstanceIndex,
                                              4, InterrogatorMode1Enabled, InterrogatorMode1);
          end;
          2 :
          begin
            //InterrogatorMode2Enabled := TCheckBox(Sender).Checked;
            InterrogatorMode2 := Value;
            SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex,
                                              IndexFocusPlatform, TT3IFFSensor(focused_sensor).InstanceIndex,
                                              5, InterrogatorMode2Enabled, InterrogatorMode2);
          end;
          3 :
          begin
            // InterrogatorMode3Enabled := TCheckBox(Sender).Checked;
            InterrogatorMode3 := Value;
            SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex,
                                              IndexFocusPlatform, TT3IFFSensor(focused_sensor).InstanceIndex,
                                              6, InterrogatorMode3Enabled, InterrogatorMode3);
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmSensor.edtTransponderOnKeyPressed(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  Value : integer;
  tmp : string;
begin
  inherited;

  ValKey := [#48 .. #55, #8, #13];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if not(Assigned(FControlled)) then
      Exit;

    if Assigned(Focused_Sensor) and (Focused_Sensor is TT3IFFSensor) and
       not (TT3Sensor(Focused_Sensor).OperationalStatus = sopDamage) then
    begin
      with TT3IFFSensor(Focused_Sensor) do
      begin
        if TryStrToInt(TEdit(Sender).Text, Value) then
        begin
          tmp := OctToDec(TEdit(Sender).Text);
          Value := StrToInt(tmp);
        end;

        case TEdit(Sender).Tag of
          1 :
          begin
            //TransponderMode1Enabled := TCheckBox(Sender).Checked;
            TransponderMode1 := Value;
            SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex,0,
                                              TT3IFFSensor(focused_sensor).InstanceIndex, 1,
                                              TransponderMode1Enabled, TransponderMode1);
          end;
          2 :
          begin
            // TransponderMode2Enabled := TCheckBox(Sender).Checked;
            TransponderMode2 := Value;
            SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex,0,
                                              TT3IFFSensor(focused_sensor).InstanceIndex, 2,
                                              TransponderMode2Enabled, TransponderMode2);
          end;
          3 :
          begin
            //TransponderMode3Enabled := TCheckBox(Sender).Checked;
            TransponderMode3 := Value;
            SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex,0,
                                              TT3IFFSensor(focused_sensor).InstanceIndex, 3,
                                              TransponderMode3Enabled, TransponderMode3);
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmSensor.initCreate(sender: TForm);
begin
  inherited;
  lstSensor.DoubleBuffered := true;

  //mad
  sbAnomalyDetectorControlModeOn.Tag  := 1;
  sbAnomalyDetectorControlModeOff.Tag := 2;

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
  btnRange1.Tag                  := 10;
  btnRange2.Tag                  := 11;
  btnRange3.Tag                  := 12;

//Visual
  sbVisualDetectorDisplayRangeShow.Tag       := 1;
  sbVisualDetectorDisplayRangeHide.Tag       := 2;
  sbVisualDetectorDisplayBlindZonesHide.Tag  := 4;
  sbVisualDetectorDisplayBlindZonesShow.Tag  := 3;

// EO
  sbElectroOpticalSensorControlModeOn.Tag    := 1;
  sbElectroOpticalSensorControlModeOff.Tag   := 2;
  sbElectroOpticalSensorDisplayRangeShow.Tag := 3;
  sbElectroOpticalSensorDisplayRangeHide.Tag := 4;
  sbElectroOpticalSensorBlindZoneShow.Tag    := 5;
  sbElectroOpticalSensorBlindZoneHide.Tag    := 6;

//IFF
  sbIFFInterrogatorControlModeOn.Tag  := 1;
  sbIFFInterrogatorControlModeOff.Tag := 2;
  sbIFFTransponderControlModeOn.Tag   := 3;
  sbIFFTransponderControlModeOff.Tag  := 4;
  btnAutomatic.Tag := 5;
  btnManual.Tag := 6;

  cbIFFTransponderControlMode1.Tag    := 1;
  cbIFFTransponderControlMode2.Tag    := 2;
  cbIFFTransponderControlMode3.Tag    := 3;
  cbIFFTransponderControlMode3C.tag   := 4;
  cbIFFTransponderControlMode4.Tag    := 5;

  cbbtnIFFInterrogatorMode1.Tag       := 6;
  cbbtnIFFInterrogatorMode2.Tag       := 7;
  cbbtnIFFInterrogatorMode3.Tag       := 8;
  cbbtnIFFInterrogatorMode3C.Tag      := 9;
  cbbtnIFFInterrogatorMode4.Tag       := 10;
end;


procedure TfmSensor.RefreshPlatformSensorsTab
  (PfList: TT3PlatformInstance);
var
  i: integer;
  li: TListItem;

  sensor : TT3Sensor;
  device : TT3DeviceUnit;
begin
  lstSensor.Items.Clear;

  if not(Assigned(PfList)) or not(PfList is TT3Vehicle) then
    exit;

  for i := 0 to TT3Vehicle(PfList).Devices.Count - 1 do
  begin
    device := TT3Vehicle(PfList).Devices.Items[i];
    if not(Assigned(device)) or not(device is TT3Sensor) then continue;

    sensor := TT3Sensor(device);

    if sensor is TT3IFFSensor then begin
      li := lstSensor.Items.Add;
      li.Caption  := sensor.InstanceName + 'Transponder';

      if Assigned(TT3IFFSensor(sensor).recIFFTransponder) then
        FreeAndNil(TT3IFFSensor(sensor).recIFFTransponder);

      TT3IFFSensor(sensor).recIFFTransponder := RecIFF.Create;
      TT3IFFSensor(sensor).recIFFTransponder.IFFType := 1;
      TT3IFFSensor(sensor).recIFFTransponder.Data := sensor;
      li.Data     := TT3IFFSensor(sensor).recIFFTransponder;

      if TT3IFFSensor(sensor).EmconOperationalStatus = EmconOff then
      begin
        case TT3IFFSensor(sensor).TransponderOperateStatus of
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
		      sopActive:
            li.SubItems.Add('Active');
          sopPassive:
            li.SubItems.Add('Passive');
          sopTooFast:
            li.SubItems.Add('Too Fast');
          //------------------------------  //17042012 mk
          sopDeploying:
            li.SubItems.Add('Deploying');
          sopDeployed:
            li.SubItems.Add('Deployed');
          sopStowing:
            li.SubItems.Add('Stowing');
          sopStowed:
            li.SubItems.Add('Stowed');
          //------------------------------  //17042012 mk
          sopOffIFF:
            li.SubItems.Add('Off');
        end;
      end
      else
      begin
        case sensor.EmconOperationalStatus of
          EmconOn:
            li.SubItems.Add('EMCON');
          EmconOff:
            li.SubItems.Add('off');
        end;
      end;

      li := lstSensor.Items.Add;
      li.Caption  := sensor.InstanceName + 'Interrogator';

      if Assigned(TT3IFFSensor(sensor).recIFFInterrogator) then
        FreeAndNil(TT3IFFSensor(sensor).recIFFInterrogator);

      TT3IFFSensor(sensor).recIFFInterrogator := RecIFF.Create;
      TT3IFFSensor(sensor).recIFFInterrogator.IFFType := 2;
      TT3IFFSensor(sensor).recIFFInterrogator.Data := sensor;
      li.Data     := TT3IFFSensor(sensor).recIFFInterrogator;

      if TT3IFFSensor(sensor).EmconOperationalStatus = EmconOff then
      begin
        case TT3IFFSensor(sensor).InterrogatorOperateStatus of
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
		      sopActive:
            li.SubItems.Add('Active');
          sopPassive:
            li.SubItems.Add('Passive');
          sopTooFast:
            li.SubItems.Add('Too Fast');
          //------------------------------ //17042012 mk
          sopDeploying:
            li.SubItems.Add('Deploying');
          sopDeployed:
            li.SubItems.Add('Deployed');
          sopStowing:
            li.SubItems.Add('Stowing');
          sopStowed:
            li.SubItems.Add('Stowed');
          //------------------------------ //17042012 mk
          sopOffIFF:
            li.SubItems.Add('Off');
        end;
      end
      else
      begin
        case sensor.EmconOperationalStatus of
            EmconOn:
              li.SubItems.Add('EMCON');
            EmconOff:
              li.SubItems.Add('off');
        end;
      end;
    end
    else
    begin
      li := lstSensor.Items.Add;
      li.Caption  := sensor.InstanceName;
      li.Data     := sensor;

      if sensor.EmconOperationalStatus = EmconOff then
      begin
        case sensor.OperationalStatus of
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
          sopActive:
            li.SubItems.Add('Active');
          sopPassive:
            li.SubItems.Add('Passive');
          sopTooFast:
            li.SubItems.Add('Too Fast');
		      //------------------------------  //17042012 mk
          sopDeploying:
            li.SubItems.Add('Deploying');
          sopDeployed:
            li.SubItems.Add('Deployed');
          sopStowing:
            li.SubItems.Add('Stowing');
          sopStowed:
            li.SubItems.Add('Stowed');
          //------------------------------  //17042012 mk
        end;
      end
      else
      begin
        case sensor.EmconOperationalStatus of
          EmconOn:
            li.SubItems.Add('EMCON');
          EmconOff:
            li.SubItems.Add('off');
        end;
      end;
    end;
  end;
end;

procedure TfmSensor.lstSensorSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  selectedItem: TListItem;
  sensorType: integer;
  obj : TObject;
  rec : RecIFF;
begin
  if not(Assigned(FControlled)) then
    Exit;

  HideAllRange;//(TT3PlatformInstance(FControlled));
  ShowRangeSelected;
  HideAllBlind;
  ShowBlindSelected;
//  HideRangeWeapon;
//  HideBlindWeapon;

  selectedItem := lstSensor.ItemFocused;
  if selectedItem = nil then
    exit;

  rec := nil;
  obj := selectedItem.Data;
  if (obj is RecIFF) then
  begin
    rec := RecIff(obj);
    focused_sensor := rec.Data;
  end
  else
    focused_sensor := selectedItem.Data;

  if Assigned(focused_sensor) then
  begin
    sensorType := 0;

    if focused_sensor is TT3Radar then sensorType := 1  else
    if focused_sensor is TT3Sonar then sensorType := 2  else
    if focused_sensor is TT3Visual then sensorType := 3 else
    if focused_sensor is TT3ESMSensor then sensorType := 4 else
    if focused_sensor is TT3EOSensor then sensorType := 5 else
    if focused_sensor is TT3MADSensor then sensorType := 6 else
    if focused_sensor is TT3SonobuoyOnVehicle  then sensorType := 9 else
    if focused_sensor is TT3IFFSensor then
    begin
      if rec <> nil then begin
        if rec.IFFType = 1 then // transponder
          sensorType := 7
        else if rec.IFFType = 2 then // interrogator
          sensorType := 8;
      end;
    end;

    if sensorType <> 0 then
    begin
      FActiveTab := sensorType;
      case sensorType of
        1 : RefreshRadarPropertiesTab(TT3Radar(focused_sensor));
        2 : RefreshSonarPropertiesTab(TT3Sonar(focused_sensor));
        3 : RefreshVisualPropertiesTab(TT3Visual(focused_sensor));
        4 : RefreshESMPropertiesTab(TT3ESMSensor(focused_sensor));
        5 : RefreshEOPropertiesTab(TT3EOSensor(focused_sensor));
        6 : RefreshMADPropertiesTab(TT3MADSensor(focused_sensor));
        7,8 : RefreshIFFPropertiesTab(TT3IFFSensor(focused_sensor));
        9 : RefreshSonobuoyPropertiesTab(TT3SonobuoyOnVehicle(focused_sensor));
      end;
    end;
  end;
end;

procedure TfmSensor.OnIFFCheckedClick(Sender: TObject);
var
  IndexFocusPlatform : integer;
begin
  inherited;

  if Assigned(focused_sensor) and (focused_sensor is TT3IFFSensor) and
     not (TT3Sensor(Focused_Sensor).OperationalStatus = sopDamage) then
  begin
    with TT3IFFSensor(focused_sensor) do
    begin
      if focused_platform = nil then
        IndexFocusPlatform := 0
      else
        IndexFocusPlatform := TT3PlatformInstance(focused_platform).InstanceIndex;

      case TCheckBox(Sender).Tag of
        1:
        begin
          if not(Assigned(FControlled)) then Exit;

          TransponderMode1Enabled := TCheckBox(Sender).Checked;
          SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex, 0,
                                            TT3IFFSensor(focused_sensor).InstanceIndex, 1,
                                            TransponderMode1Enabled, TransponderMode1);
        end;
        2:
        begin
          if not(Assigned(FControlled)) then Exit;

          TransponderMode2Enabled := TCheckBox(Sender).Checked;
          SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex, 0,
                                            TT3IFFSensor(focused_sensor).InstanceIndex, 2,
                                            TransponderMode2Enabled, TransponderMode2);
        end;
        3:
        begin
          if not(Assigned(FControlled)) then Exit;

          TransponderMode3Enabled := TCheckBox(Sender).Checked;
          SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex, 0,
                                            TT3IFFSensor(focused_sensor).InstanceIndex, 3,
                                            TransponderMode3Enabled, TransponderMode3);
        end;
        4:
        begin
          if not(Assigned(FControlled)) then Exit;

          TransponderMode3CEnabled := TCheckBox(Sender).Checked;
          SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex, 0,
                                            TT3IFFSensor(focused_sensor).InstanceIndex, 8,
                                            TransponderMode3CEnabled, TransponderMode3C);

        end;
        5:
        begin
          if not(Assigned(FControlled)) then Exit;

          TransponderMode4Enabled := TCheckBox(Sender).Checked;
          SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex, 0,
                                            TT3IFFSensor(focused_sensor).InstanceIndex, 9,
                                            TransponderMode4Enabled, 0);
        end;
        6:
        begin
          if not(Assigned(FControlled)) then Exit;

          InterrogatorMode1Enabled := TCheckBox(Sender).Checked;
          SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex,
                                            IndexFocusPlatform,TT3IFFSensor(focused_sensor).InstanceIndex,
                                            4, InterrogatorMode1Enabled, InterrogatorMode1);
        end;
        7:
        begin
          if not(Assigned(FControlled)) then Exit;

          InterrogatorMode2Enabled := TCheckBox(Sender).Checked;
          SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex, IndexFocusPlatform,
                                            TT3IFFSensor(focused_sensor).InstanceIndex, 5,
                                            InterrogatorMode2Enabled, InterrogatorMode2);
        end;
        8:
        begin
          if not(Assigned(FControlled)) then Exit;

          InterrogatorMode3Enabled := TCheckBox(Sender).Checked;
          SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex, IndexFocusPlatform,
                                            TT3IFFSensor(focused_sensor).InstanceIndex, 6,
                                            InterrogatorMode3Enabled, InterrogatorMode3);
        end;
        9:
        begin
          if not(Assigned(FControlled)) then Exit;

          InterrogatorMode3CEnabled := TCheckBox(Sender).Checked;
          SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex, IndexFocusPlatform,
                                            TT3IFFSensor(focused_sensor).InstanceIndex, 7,
                                            InterrogatorMode3CEnabled, InterrogatorMode3C);

        end;

        10:
        begin
          if not(Assigned(FControlled)) then Exit;

          InterrogatorMode4Enabled := TCheckBox(Sender).Checked;
          SimMgrClient.netSend_CmdSensorIFF(TT3PlatformInstance(FControlled).InstanceIndex, IndexFocusPlatform,
                                            TT3IFFSensor(focused_sensor).InstanceIndex, 10,
                                            InterrogatorMode4Enabled, 0);
        end;
      end;
    end;
  end;
end;

procedure TfmSensor.OnMenuSonobuoyClick(Sender: TObject);
begin
  if TMenuItem(sender).Caption = '&Active' then
    editControlMode.Text := 'Active' else
  if TMenuItem(sender).Caption = '&Passive'  then
     editControlMode.Text := 'Passive';//else
//  if TMenuItem(sender).Caption = 'A&ctive/ Passive'  then
//     editControlMode.Text := 'Active/ Passive'else
//  if TMenuItem(sender).Caption = 'Pa&ssive Intercept'  then
//     editControlMode.Text := 'Passive Intercept';
end;

procedure TfmSensor.UpdateObserve;
var
  idx : Integer;
begin
  if frmToteDisplay.lvPlatforms.ItemIndex = -1 then
    Exit;

  idx := frmToteDisplay.lvPlatforms.ItemIndex;
  frmToteDisplay.lvPlatforms.Refresh;
  frmToteDisplay.btnPlatformStatusClick(frmToteDisplay.btnPlatformStatus);
  frmToteDisplay.lvPlatformsSelectItem(frmToteDisplay.lvPlatforms, frmToteDisplay.lvPlatforms.Items[frmToteDisplay.lvPlatforms.Items.Count-1], false);
  frmToteDisplay.lvPlatforms.ItemIndex := idx;
  frmToteDisplay.lvPlatformsSelectItem(frmToteDisplay.lvPlatforms, frmToteDisplay.lvPlatforms.Selected, false);
  frmToteDisplay.lvSensors.Refresh;
end;

procedure TfmSensor.RefreshVisualPropertiesTab(visual: TT3Visual);
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
{  case FActiveTab of
    1: RefreshRadarPropertiesTab(TT3Radar(focused_sensor));
    2: RefreshSonarPropertiesTab(TT3Sonar(focused_sensor));
    3: RefreshVisualPropertiesTab(TT3Visual(focused_sensor));
    4: RefreshESMPropertiesTab(TT3ESMSensor(focused_sensor));
    5: RefreshEOPropertiesTab(TT3EOSensor(focused_sensor));
    6: RefreshMADPropertiesTab(TT3MADSensor(focused_sensor));
    7,8 : RefreshIFFPropertiesTab(TT3IFFSensor(focused_sensor));
  end;  }
end;

procedure TfmSensor.RemoveListSensor(ctrlObj: TObject);
//var
//  v : TT3Vehicle;
//  i : Integer;
//  dev : TT3DeviceUnit;
begin
  if not(Assigned(ctrlObj)) then
    Exit;

//  if ctrlObj is TT3Vehicle then
//  begin
//    v := TT3Vehicle(ctrlObj);
//
//    for i := 0 to v.Devices.Count - 1 do
//    begin
//      dev := v.Devices.Items[i];
//
//      if dev is TT3IFFSensor then
//      begin
//        if Assigned(TT3IFFSensor(dev).recIFFTransponder) then
//          FreeAndNil(TT3IFFSensor(dev).recIFFTransponder);
//
//        if Assigned(TT3IFFSensor(dev).recIFFInterrogator) then
//          FreeAndNil(TT3IFFSensor(dev).recIFFInterrogator);
//      end;
//    end;
//  end;

  if FControlled = ctrlObj then
  begin
    lstSensor.Items.Clear;
    PanelSensorControl.Visible := False;

    Focused_Sensor := nil;
    focused_platform := nil;
  end;
end;

procedure TfmSensor.sbAnomalyDetectorOnClick(Sender: TObject);
begin
  if Assigned(focused_sensor) and (focused_sensor is TT3MADSensor) and
     not(TT3Sensor(Focused_Sensor).OperationalStatus = sopDamage) then
  begin
    with TT3MADSensor(focused_sensor) do
    begin
      case TSpeedButton(Sender).Tag of
        1:
        begin
          //OperationalStatus := sopOn
          if not(Assigned(FControlled)) then Exit;

          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3MADSensor) then
          begin
            SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                           CSENSOR_TYPE_MAD,TT3MADSensor(focused_sensor).InstanceIndex,
                                           CORD_ID_OperationalStatus, byte(sopOn));
          end;
        end;
        2:
        begin
          //OperationalStatus := sopOff;
          if not(Assigned(FControlled)) then Exit;

          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3MADSensor) then
          begin
            SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                           CSENSOR_TYPE_MAD, TT3MADSensor(focused_sensor).InstanceIndex,
                                           CORD_ID_OperationalStatus, byte(sopOff));
          end;
        end;
      end;
    end;

    frmToteDisplay.btnPlatformStatusClick(frmToteDisplay.btnPlatformStatus);
    frmToteDisplay.lvPlatformsSelectItem(frmToteDisplay.lvPlatforms, frmToteDisplay.lvPlatforms.Selected, false);
  end;
end;

procedure TfmSensor.sbElectroOpticalSensorOnClick(Sender: TObject);
begin
  if Assigned(focused_sensor) and (focused_sensor is TT3EOSensor) and
     not (TT3Sensor(Focused_Sensor).OperationalStatus = sopDamage ) then
  begin
    with TT3EOSensor(focused_sensor) do
    begin
      case TSpeedButton(Sender).Tag of
        1:
        begin
          //OperationalStatus := sopOn;
		      if not(Assigned(FControlled)) then Exit;

          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3EOSensor) then
          begin
            SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                           CSENSOR_TYPE_EO, TT3EOSensor(focused_sensor).InstanceIndex,
                                           CORD_ID_OperationalStatus, byte(sopOn));
          end;
        end;
        2:
        begin
          //OperationalStatus := sopOff;
		      if not(Assigned(FControlled)) then Exit;

          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3EOSensor) then
          begin
            SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                           CSENSOR_TYPE_EO, TT3EOSensor(focused_sensor).InstanceIndex,
                                           CORD_ID_OperationalStatus, byte(sopOff));
          end;
        end;
        3:
        begin
          FVisibleShowRange := True;
          ShowRange  := True;

          ShowRangeSelected := ShowRange and FVisibleShowRange;

          HideRangeWeapon;
        end;
        4:
        begin
          FVisibleShowRange := False;
          ShowRange  := False;

          ShowRangeSelected := ShowRange and FVisibleShowRange;
        end;
        5:
        begin
          FVisibleShowBlind := True;

          ShowBlindZone := True;
          ShowBlindSelected := ShowBlindZone and FVisibleShowBlind;
          HideBlindWeapon;
        end;
        6:
        begin
          FVisibleShowBlind := False;

          ShowBlindZone := False;
          ShowBlindSelected := ShowBlindZone and FVisibleShowBlind;
        end;
      end;

      UpdateObserve;
    end;
  end;
end;

procedure TfmSensor.sbESMSensorControlModeClick(Sender: TObject);
var
  sensor : TT3ESMSensor;
begin
  if not (Assigned(focused_sensor) and (focused_sensor is TT3ESMSensor)) and
     (TT3Sensor(Focused_Sensor).OperationalStatus = sopDamage ) then Exit;

  sensor := focused_sensor as TT3ESMSensor;
  if not(Assigned(sensor)) then Exit;

  case TSpeedButton(Sender).Tag of
    1:
    begin
      //OperationalStatus := sopOn;
	    if not(Assigned(FControlled)) then Exit;

      if (FControlled is TT3PlatformInstance) then
      begin
        SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,CSENSOR_TYPE_ESM,
                                       TT3ESMSensor(focused_sensor).InstanceIndex, CORD_ID_OperationalStatus,
                                       byte(sopOn));
      end;
    end;
    2:
    begin
      //OperationalStatus := sopOff;
	    if not(Assigned(FControlled)) then Exit;

      if (FControlled is TT3PlatformInstance) then
      begin
        SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,CSENSOR_TYPE_ESM,
                                       TT3ESMSensor(focused_sensor).InstanceIndex, CORD_ID_OperationalStatus,
                                       byte(sopOff));
      end;
    end;
    3:
    begin
      FVisibleShowBlind := True;

      sensor.ShowBlindZone := True;
      sensor.ShowBlindSelected := sensor.ShowBlindZone and FVisibleShowBlind;
    end;
    //sensor.ShowBlindZone := true;
    4:
    begin
      FVisibleShowBlind := False;

      sensor.ShowBlindZone := False;
      sensor.ShowBlindSelected := sensor.ShowBlindZone and FVisibleShowBlind;
    end;
    //sensor.ShowBlindZone := false;
  end;

  UpdateObserve;
end;

procedure TfmSensor.sbSearchRadarClick(Sender: TObject);
begin
  if Assigned(focused_sensor) and (focused_sensor is TT3Radar) and
     not (TT3Sensor(Focused_Sensor).OperationalStatus = sopDamage) then
  begin
    with TT3Radar(focused_sensor) do
    begin
      case TSpeedButton(Sender).Tag of
        1:
        begin
          if sbRangeShow.Down = False then
            sbRangeShow.Down := True
          else
          begin
            FVisibleShowRange := True;
            ShowRange := True;
            ShowRangeSelected := ShowRange and FVisibleShowRange;
            HideRangeWeapon;
          end;
        end;
        2:
        begin
          if sbRangeHide.Down = False then
            sbRangeHide.Down := True
          else
          begin
            FVisibleShowRange := False;
            ShowRange := False;
            ShowRangeSelected := ShowRange and FVisibleShowRange;
          end;
        end;
        3:
        begin
          if sbBlindShow.Down = False then
            sbBlindShow.Down := True
          else
          begin
            FVisibleShowBlind := True;
            ShowBlindZone := True;
            ShowBlindSelected := ShowBlindZone and FVisibleShowBlind;
            HideBlindWeapon;
          end;
        end;
        4:
        begin
          if sbBlindHide.Down = False then
            sbBlindHide.Down := True
          else
          begin
            FVisibleShowBlind := False;
            ShowBlindZone := False;
            ShowBlindSelected := ShowBlindZone and FVisibleShowBlind;
          end;
        end;
        5:
        begin
          if sbScanShow.Down = False then
            sbScanShow.Down := True
          else
          begin
            ShowScanSector  := true;
          end;
        end;
        6:
        begin
          if sbScanHide.Down = False then
            sbScanHide.Down := True
          else
          begin
            ShowScanSector  := false;
          end;
        end;
        7:
        begin
          if sbScanModeFull.Down = False then
            sbScanModeFull.Down := True;
        end;
        8:
        begin
          if sbScanModePartial.Down = False then
            sbScanModePartial.Down := True;
        end;
        9:
        begin
          //ControlMode := rcmSearchTrack;
          if not(Assigned(FControlled)) then Exit;

          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Radar) then
          begin
            SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                           CSENSOR_TYPE_RADAR, TT3Radar(focused_sensor).InstanceIndex,
                                           CORD_ID_ControlMode, Byte(rcmSearchTrack));
          end;
        end;
        10:
        begin
          //ControlMode := rcmTrack;
          if not(Assigned(FControlled)) then Exit;

          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Radar) then
          begin
            SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                           CSENSOR_TYPE_RADAR, TT3Radar(focused_sensor).InstanceIndex,
                                           CORD_ID_ControlMode,Byte(rcmTrack));
          end;
        end;
        11:
        begin
          //ControlMode := rcmOff;
          if not(Assigned(FControlled)) then Exit;

          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Radar) then
          begin
            SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                           CSENSOR_TYPE_RADAR, TT3Radar(focused_sensor).InstanceIndex,
                                           CORD_ID_ControlMode, Byte(rcmOff));
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmSensor.sbSonarClick(Sender: TObject);
var
  OrderCableLength : Double;
  tmpActualCable: Double;
begin
  if Assigned(focused_sensor) and (focused_sensor is TT3Sonar) and
     not (TT3Sensor(Focused_Sensor).OperationalStatus = sopDamage) then
  begin
    with TT3Sonar(focused_sensor) do
    begin

      OrderCableLength := StrToFloat(editCableOrdered.Text) * C_Meter_To_Feet;
      if (OrderCableLength > SonarDefinition.FDef.Cable_Length) then
      editCableOrdered.Text := FloatToStr(SonarDefinition.FDef.Cable_Length * C_Feet_To_Meter);

      OrderCable := StrToFloat(editCableOrdered.Text);
      DepthCable := C_Meter_To_Feet * StrToFloat(editCableOrdered.Text); //feet

        case TSpeedButton(Sender).Tag of
          1:
          begin
            //ControlMode := scmActive;
            if not(Assigned(FControlled)) then Exit;

            if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Sonar) then
            begin
              SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                             CSENSOR_TYPE_SONAR, TT3Sonar(focused_sensor).InstanceIndex,
                                             CORD_ID_ControlMode, byte(scmActive));
              SetTIOWRangeSonar(true);
            end;
          end;
          2:
          begin
            //ControlMode := scmPassive;
            if not(Assigned(FControlled)) then Exit;

            if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Sonar) then
            begin
              SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                             CSENSOR_TYPE_SONAR, TT3Sonar(focused_sensor).InstanceIndex,
                                             CORD_ID_ControlMode, byte(scmPassive));
              SetTIOWRangeSonar(false);
            end;
          end;
          3:
          begin
            //ControlMode := scmOff;
            if not(Assigned(FControlled)) then Exit;

            if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Sonar) then
            begin
              SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                             CSENSOR_TYPE_SONAR, TT3Sonar(focused_sensor).InstanceIndex,
                                             CORD_ID_ControlMode, byte(scmOff));
              SetTIOWRangeSonar(false);
            end;
          end;

          4:
          begin
            //ControlMode := scmDeployed; //17042012 mk
            if not(Assigned(FControlled)) then Exit;

            if (StrToFloat(editCableOrdered.Text) * C_Meter_To_Feet) = 0 then
            begin
              ShowMessage('Ordered cable payout must be greather than 0 ');
              Exit
            end;

            sbSonarControlModeActive.Enabled := false;
            sbSonarControlModePassive.Enabled := false;

            tmpActualCable:= ActualCable * C_Meter_To_Feet;

            if (tmpActualCable <= DepthCable) then
            begin
              TimeDeploy :=Round((DepthCable-tmpActualCable)/ SonarDefinition.FDef.Sonar_Depth_Rate_of_Change);

              if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Sonar) then
              begin
                SimMgrClient.netSend_CmdSonarDeploy (TT3PlatformInstance(FControlled).InstanceIndex,
                            TT3Sonar(focused_sensor).InstanceIndex,
                            TT3Sonar(focused_sensor).TimeDeploy, 1, TT3Sonar(focused_sensor).ActualCable,
                            TT3Sonar(focused_sensor).OrderCable);
              end;
            end
            else
            begin
              TimeStow := Round( (tmpActualCable - DepthCable)/ SonarDefinition.FDef.Sonar_Depth_Rate_of_Change);

              if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Sonar) then
              begin
                SimMgrClient.netSend_CmdSonarDeploy(TT3PlatformInstance(FControlled).InstanceIndex,
                            TT3Sonar(focused_sensor).InstanceIndex,
                            TT3Sonar(focused_sensor).TimeStow, 5, TT3Sonar(focused_sensor).ActualCable,
                            TT3Sonar(focused_sensor).OrderCable);
                            //param diisi 5 khusus untuk deploy keatas
              end;
            end;
          end;

          5:
          begin
            //ControlMode := scmStowed;  //17042012 mk
            if not(Assigned(FControlled)) then Exit;

            sbSonarControlModeActive.Enabled := false;
            sbSonarControlModePassive.Enabled := false;

            tmpActualCable:= ActualCable * C_Meter_To_Feet;

            if (tmpActualCable > 0) then
               TimeStow := Round( (tmpActualCable - 0)/ SonarDefinition.FDef.Sonar_Depth_Rate_of_Change)
            else
            begin
              Exit;
            end;

            if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Sonar) then
            begin
              SimMgrClient.netSend_CmdSonarDeploy(TT3PlatformInstance(FControlled).InstanceIndex,
                          TT3Sonar(focused_sensor).InstanceIndex,
                          TT3Sonar(focused_sensor).TimeStow, 2, TT3Sonar(focused_sensor).ActualCable,
                          0);
            end;
          end;
          6:
          begin
            FVisibleShowRange := False;
            ShowRange := false;

            ShowRangeSelected := ShowRange and FVisibleShowRange;
          end;
          7:
          begin
            if TT3Sonar(Focused_Sensor).ControlMode = scmActive then
            begin
              if TT3Sonar(Focused_Sensor).TIOWRange = strShort then
                DetectionRange := (1000 / C_NauticalMile_To_Yards) *
                                  TT3Sonar(focused_sensor).SonarDefinition.FDef.TIOW_Short_Range
              else if  TT3Sonar(Focused_Sensor).TIOWRange = strMedium then
                DetectionRange := (1000 / C_NauticalMile_To_Yards) *
                                  TT3Sonar(focused_sensor).SonarDefinition.FDef.TIOW_Medium_Range
              else if  TT3Sonar(Focused_Sensor).TIOWRange = strLong then
                DetectionRange := (1000 / C_NauticalMile_To_Yards) *
                                  TT3Sonar(focused_sensor).SonarDefinition.FDef.TIOW_Long_Range;
            end
            else
               DetectionRange := TT3Sonar(Focused_Sensor).SonarDefinition.FDef.Max_Detect_Range;

            FVisibleShowRange := True;
            ShowRange := true;

            ShowRangeSelected := ShowRange and FVisibleShowRange;

            HideRangeWeapon;
          end;
          8:
          begin
            FVisibleShowBlind := False;

            ShowBlindZone := False;
            ShowBlindSelected := ShowBlindZone and FVisibleShowBlind;
            HideBlindWeapon;
          end;
          9:
          begin
            FVisibleShowBlind := True;

            ShowBlindZone := True;
            ShowBlindSelected := ShowBlindZone and FVisibleShowBlind;
          end;
          10: // TIOW short range
          begin
            if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Sonar) then
            begin
              SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                             CSENSOR_TYPE_SONAR, TT3Sonar(focused_sensor).InstanceIndex,
                                             CORD_ID_ControlRangeSonar, byte(strShort));
            end;
          end;
          11: // TIOW medium range
          begin
            if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Sonar) then
            begin
              SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                             CSENSOR_TYPE_SONAR, TT3Sonar(focused_sensor).InstanceIndex,
                                             CORD_ID_ControlRangeSonar, byte(strMedium));
            end;
          end;
          12: // TIOW long range
          begin
            if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Sonar) then
            begin
              SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                             CSENSOR_TYPE_SONAR, TT3Sonar(focused_sensor).InstanceIndex,
                                             CORD_ID_ControlRangeSonar, byte(strLong));
            end;
          end;
        end;

        UpdateObserve;
    end;
  end;
end;

procedure TfmSensor.sbVisualSensorClick(Sender: TObject);
begin
  if Assigned(focused_sensor) and (focused_sensor is TT3Visual) and
     not (TT3Sensor(Focused_Sensor).OperationalStatus = sopDamage) then
  begin
    with TT3Visual(focused_sensor) do
	  begin
      case TSpeedButton(Sender).Tag of
        1: begin
             FVisibleShowRange := True;

             ShowRange := true;
             ShowRangeSelected := ShowRange and FVisibleShowRange;

             HideRangeWeapon;
           end;
        2: begin
             FVisibleShowRange := False;

             ShowRange := false;
             ShowRangeSelected := ShowRange and FVisibleShowRange;
           end;
        3: begin
             FVisibleShowBlind := True;

             ShowBlindZone := True;
             ShowBlindSelected := ShowBlindZone and FVisibleShowBlind;
             HideBlindWeapon;
           end;
        4: begin
             FVisibleShowBlind := False;

             ShowBlindZone := False;
             ShowBlindSelected := ShowBlindZone and FVisibleShowBlind;
           end;
      end;
	  end;
    
	  UpdateObserve;
  end;
end;

procedure TfmSensor.RefreshEOPropertiesTab(eo: TT3EOSensor);
begin
  grbElectroOpticalSensor.BringToFront;
  case eo.OperationalStatus of
    sopOn:
      begin
        sbElectroOpticalSensorControlModeOn.Down := true;
        sbElectroOpticalSensorControlModeOn.Enabled := true;
        sbElectroOpticalSensorControlModeOff.Down := false;
        sbElectroOpticalSensorControlModeOff.Enabled := true;
      end;
    sopOff:
      begin
        sbElectroOpticalSensorControlModeOn.Down := false;
        sbElectroOpticalSensorControlModeOn.Enabled := true;
        sbElectroOpticalSensorControlModeOff.Down := true;
        sbElectroOpticalSensorControlModeOff.Enabled := true;
      end;
    sopTooDeep:
      begin
        sbElectroOpticalSensorControlModeOn.Enabled := false;
        sbElectroOpticalSensorControlModeOff.Enabled := false;
      end;
    sopDamage:
      begin
        sbElectroOpticalSensorControlModeOn.Enabled := false;
        sbElectroOpticalSensorControlModeOff.Enabled := false;
      end;
  end;

  if eo.EODefinition.FEO_Def.Num_FC_Channels = 0 then
  begin
    sbElectroOpticalSensorControlModeOff.Caption := 'Down';
    sbElectroOpticalSensorControlModeOn.Caption := 'Up';
    Label2.Caption := 'Periscope';
  end
  else if eo.EODefinition.FEO_Def.Num_FC_Channels = 1  then
  begin
    sbElectroOpticalSensorControlModeOff.Caption := 'Off';
    sbElectroOpticalSensorControlModeOn.Caption := 'On';
    Label2.Caption := 'Laser/IR Sensor (Infrared)';
  end;

  if eo.ShowBlindZone then sbElectroOpticalSensorBlindZoneShow.Down := true
  else sbElectroOpticalSensorBlindZoneHide.Down := true;

  if eo.ShowRange then sbElectroOpticalSensorDisplayRangeShow.Down := true
  else sbElectroOpticalSensorDisplayRangeHide.Down := true;
end;

procedure TfmSensor.RefreshESMPropertiesTab(esm: TT3ESMSensor);
begin
  grbESMSensorControl.BringToFront;
  case esm.OperationalStatus of
    sopOn:
      begin
        sbESMSensorControlModeOn.Down := true;
        sbESMSensorControlModeOn.Enabled := true;
        sbESMSensorControlModeOff.Down := false;
        sbESMSensorControlModeOff.Enabled := true;
      end;
    sopOff:
      begin
        sbESMSensorControlModeOn.Down := false;
        sbESMSensorControlModeOn.Enabled := true;
        sbESMSensorControlModeOff.Down := true;
        sbESMSensorControlModeOff.Enabled := true;
      end;
    sopTooDeep:
      begin
        sbESMSensorControlModeOn.Enabled := false;
        sbESMSensorControlModeOff.Enabled := false;
      end;
    sopDamage:
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

procedure TfmSensor.RefreshIFFInterrogatorTab(iff: TT3IFFSensor);
begin
  grbIFFInterrogatorControl.BringToFront;
  case iff.InterrogatorOperateStatus of
    sopOn:
      begin
         if iff.TargetObject = nil then
         editbtnIFFInterrogatorTrack.Text := '';

        sbIFFInterrogatorControlModeOn.Enabled := true;
        sbIFFInterrogatorControlModeOff.Enabled := true;
        sbIFFInterrogatorControlModeOn.Down := true;

        editbtnIFFInterrogatorTrack.Enabled:=True;
        btnIFFInterrogatorTrackSearch.Enabled:=True;

        cbbtnIFFInterrogatorMode1.Enabled:=True;
        cbbtnIFFInterrogatorMode2.Enabled:=True;
        cbbtnIFFInterrogatorMode3.Enabled:=True;
        cbbtnIFFInterrogatorMode3C.Enabled:=True;
        cbbtnIFFInterrogatorMode4.Enabled:=True;

        edtIFFInterrogatorMode1.Enabled:=True;
        edtIFFInterrogatorMode2.Enabled:=True;
        edtIFFInterrogatorMode3.Enabled:=True;

        if iff.IFFDefinition.FData.IFF_Capability = 0 then
        begin
          btnAutomatic.Enabled := true;
          btnManual.Enabled := true;
          if iff.ModeSearchIFF = 0 then // automatic
          begin
            btnAutomatic.Down := true;
            btnIFFInterrogatorTrackSearch.Enabled := false;
            editbtnIFFInterrogatorTrack.Enabled := false;
          end
          else
          begin
            btnManual.Down := true;
            btnIFFInterrogatorTrackSearch.Enabled := true;
            editbtnIFFInterrogatorTrack.Enabled := true;
          end;
        end
        else
        begin
          btnAutomatic.Enabled := false;
          btnManual.Enabled := false;
          btnIFFInterrogatorTrackSearch.Enabled := true;
          editbtnIFFInterrogatorTrack.Enabled := true;
        end;

      end;
    sopOff, sopOffIFF:
      begin
        iff.TargetObject := nil;

        sbIFFInterrogatorControlModeOn.Enabled := true;
        sbIFFInterrogatorControlModeOff.Enabled := true;
        sbIFFInterrogatorControlModeOff.Down := true;

        editbtnIFFInterrogatorTrack.Enabled:=False;
        btnIFFInterrogatorTrackSearch.Enabled:=False;
        editbtnIFFInterrogatorTrack.Text := '';

        cbbtnIFFInterrogatorMode1.Enabled:=False;
        cbbtnIFFInterrogatorMode2.Enabled:=False;
        cbbtnIFFInterrogatorMode3.Enabled:=False;
        cbbtnIFFInterrogatorMode3C.Enabled:=False;
        cbbtnIFFInterrogatorMode4.Enabled:=False;

        edtIFFInterrogatorMode1.Enabled:=False;
        edtIFFInterrogatorMode2.Enabled:=False;
        edtIFFInterrogatorMode3.Enabled:=False;

        btnAutomatic.Enabled := false;
        btnManual.Enabled := false;
      end;
    sopDamage, sopTooDeep, sopEMCON:
      begin
        sbIFFInterrogatorControlModeOn.Enabled := false;
        sbIFFInterrogatorControlModeOff.Enabled := false;
      end;
  end;

  cbbtnIFFInterrogatorMode1.OnClick:=nil;
  cbbtnIFFInterrogatorMode2.OnClick:=nil;
  cbbtnIFFInterrogatorMode3.OnClick:=nil;
  cbbtnIFFInterrogatorMode3C.OnClick:=nil;
  cbbtnIFFInterrogatorMode4.OnClick:=nil;

  cbbtnIFFInterrogatorMode1.Checked  := iff.InterrogatorMode1Enabled;
  cbbtnIFFInterrogatorMode2.Checked  := iff.InterrogatorMode2Enabled;
  cbbtnIFFInterrogatorMode3.Checked  := iff.InterrogatorMode3Enabled;
  cbbtnIFFInterrogatorMode3C.Checked := iff.InterrogatorMode3CEnabled;
  cbbtnIFFInterrogatorMode4.Checked  := iff.InterrogatorMode4Enabled;

  cbbtnIFFInterrogatorMode1.OnClick:=OnIFFCheckedClick;
  cbbtnIFFInterrogatorMode2.OnClick:=OnIFFCheckedClick;
  cbbtnIFFInterrogatorMode3.OnClick:=OnIFFCheckedClick;
  cbbtnIFFInterrogatorMode3C.OnClick:=OnIFFCheckedClick;
  cbbtnIFFInterrogatorMode4.OnClick:=OnIFFCheckedClick;

  edtIFFInterrogatorMode1.Text  := DecToOct(IntToStr(iff.InterrogatorMode1));
  edtIFFInterrogatorMode2.Text  := DecToOct(IntToStr(iff.InterrogatorMode2));
  edtIFFInterrogatorMode3.Text  := DecToOct(IntToStr(iff.InterrogatorMode3));
end;

procedure TfmSensor.RefreshIFFPropertiesTab(iff: TT3IFFSensor);
var
  selectedItem: TListItem;
  obj : TObject;
  rec : RecIFF;
begin
  selectedItem := lstSensor.ItemFocused;
  if selectedItem = nil then
    exit;

  obj := selectedItem.Data;
  if (obj is RecIFF) then begin
    rec := RecIff(obj);

    case rec.IFFType of
      1 : RefreshIFFTransponderTab(iff);
      2 : RefreshIFFInterrogatorTab(iff);
    end;
  end;
end;

procedure TfmSensor.RefreshIFFTransponderTab(iff: TT3IFFSensor);
begin
  grbIFFTransponderControl.BringToFront;
  case iff.TransponderOperateStatus of
    sopOn:
      begin
        sbIFFTransponderControlModeOn.Enabled := true;
        sbIFFTransponderControlModeOff.Enabled := true;
        sbIFFTransponderControlModeOn.Down := true;

        cbIFFTransponderControlMode1.Enabled := True;
        cbIFFTransponderControlMode2.Enabled := True;
        cbIFFTransponderControlMode3.Enabled := True;
        cbIFFTransponderControlMode3C.Enabled := True;
        cbIFFTransponderControlMode4.Enabled := True;

        edtIFFTransponderControlMode1.Enabled := True;
        edtIFFTransponderControlMode2.Enabled := True;
        edtIFFTransponderControlMode3.Enabled := True;
      end;
    sopOff, sopOffIFF :
      begin
        sbIFFTransponderControlModeOn.Enabled := true;
        sbIFFTransponderControlModeOff.Enabled := true;
        sbIFFTransponderControlModeOff.Down := true;

        cbIFFTransponderControlMode1.Enabled := False;
        cbIFFTransponderControlMode2.Enabled := False;
        cbIFFTransponderControlMode3.Enabled := False;
        cbIFFTransponderControlMode3C.Enabled := False;
        cbIFFTransponderControlMode4.Enabled := False;

        edtIFFTransponderControlMode1.Enabled := False;
        edtIFFTransponderControlMode2.Enabled := False;
        edtIFFTransponderControlMode3.Enabled := False;
      end;
    sopDamage, sopTooDeep, sopEMCON:
      begin
        sbIFFTransponderControlModeOn.Enabled := false;
        sbIFFTransponderControlModeOff.Enabled := false;
      end;
  end;

  cbIFFTransponderControlMode1.OnClick:=nil;
  cbIFFTransponderControlMode2.OnClick:=nil;
  cbIFFTransponderControlMode3.OnClick:=nil;
  cbIFFTransponderControlMode3c.OnClick:=nil;
  cbIFFTransponderControlMode4.OnClick:=nil;

  cbIFFTransponderControlMode1.Checked  := iff.TransponderMode1Enabled;
  cbIFFTransponderControlMode2.Checked  := iff.TransponderMode2Enabled;
  cbIFFTransponderControlMode3.Checked  := iff.TransponderMode3Enabled;
  cbIFFTransponderControlMode3C.Checked := iff.TransponderMode3CEnabled;
  cbIFFTransponderControlMode4.Checked  := iff.TransponderMode4Enabled;

  cbIFFTransponderControlMode1.OnClick:=OnIFFCheckedClick;
  cbIFFTransponderControlMode2.OnClick:=OnIFFCheckedClick;
  cbIFFTransponderControlMode3.OnClick:=OnIFFCheckedClick;
  cbIFFTransponderControlMode3c.OnClick:=OnIFFCheckedClick;
  cbIFFTransponderControlMode4.OnClick:=OnIFFCheckedClick;

  edtIFFTransponderControlMode1.Text  := DecToOct(IntToStr(iff.TransponderMode1));
  edtIFFTransponderControlMode2.Text  := DecToOct(IntToStr(iff.TransponderMode2));
  edtIFFTransponderControlMode3.Text  := DecToOct(IntToStr(iff.TransponderMode3));
end;

procedure TfmSensor.RefreshMADPropertiesTab(mad: TT3MADSensor);
begin
  grbAnomalyDetectorSensor.BringToFront;

  case mad.OperationalStatus of
    sopOn:
      begin
        sbAnomalyDetectorControlModeOn.Down := true;
        sbAnomalyDetectorControlModeOff.Down := false;
      end;
    sopOff:
      begin
        sbAnomalyDetectorControlModeOn.Down := false;
        sbAnomalyDetectorControlModeOff.Down := true;
      end;
  end;
end;

procedure TfmSensor.RefreshRadarPropertiesTab(radar: TT3Radar);
begin
  grbSearchRadarControl.BringToFront;

  with radar do
  begin
    case RadarDefinition.FType.Radar_Type_Index of
      0   : begin
              //pnlControlModeRadar2.BringToFront;

              pnlControlModeRadar2.Visible := False;
              pnlControlRadar.Visible := True;

            end;
      2,3 : begin
             // pnlControlRadar.BringToFront;

              pnlControlModeRadar2.Visible := True;
              pnlControlRadar.Visible := False;

            end;
    end;

    if RadarDefinition.FDef.Sector_Scan_Capable then
       pnlScanSector.Visible := True
    else
       pnlScanSector.Visible := False;

    if ShowRange then
      begin
        sbRangeShow.Down := true;
      end
    else
      begin
        sbRangeHide.Down := true;
      end;

    if ShowBlindZone then
      sbBlindShow.Down := true
    else
      sbBlindHide.Down := true;

    if ShowScanSector then
      sbScanShow.Down := true
    else
      sbScanHide.Down := true;

    if (OperationalStatus <> sopDamage) and (OperationalStatus <> sopOff) then
    begin
      case ControlMode of
        rcmOff:
              begin
                sbControlModeOff.Down := true;
                btnControlModeOff2.Down := true;
              end;
        rcmTrack:
              begin
                sbControlModeTrack.Down := true;
                btnControlModeOn.Down := true;
              end;
        rcmSearchTrack:
              begin
                sbControlModeSearch.Down := true;
                btnControlModeOn.Down := true;
              end;
      end;
    end
    else
    begin
      sbControlModeOff.Down := true;
      btnControlModeOff2.Down := true;
    end;

    {case ScanSector of
      rscFull:
        sbScanModeFull.Down := true;
      rscPartial:
        sbScanModePartial.Down := true;
    end;}

    //coment dlu
    {sbScanModeFull.Enabled      := RadarDefinition.FDef.Sector_Scan_Capable;
    sbScanModePartial.Enabled   := RadarDefinition.FDef.Sector_Scan_Capable;
    sbScanShow.Enabled          := RadarDefinition.FDef.Sector_Scan_Capable;
    sbScanHide.Enabled          := RadarDefinition.FDef.Sector_Scan_Capable;
    editScanStart.Enabled       := RadarDefinition.FDef.Sector_Scan_Capable;
    editScanEnd.Enabled         := RadarDefinition.FDef.Sector_Scan_Capable;
    btnComboScanStrart.Enabled  := RadarDefinition.FDef.Sector_Scan_Capable; }

    if RadarDefinition.FDef.Sector_Scan_Capable then
    begin
      editScanStart.Text := FormatFloat('#.##', StartScan);
      editScanEnd.Text := FormatFloat('#.##', EndScan);
      {case ScanSector of
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
      end;}
    end
    else
    begin
      editScanStart.Text := '0';
      editScanEnd.Text := '0';
    end;
  end;
end;

procedure TfmSensor.RefreshSonarPropertiesTab(sonar: TT3Sonar);
begin
  grbSonarControl.BringToFront;

  with sonar do
  begin
    lbCableActual.Caption := FloatToStr(ActualCable);
//    editCableOrdered.Text := FloatToStr(OrderCable);

    if ShowRange then
      sbDisplayRangeShow.Down := true
    else
      sbDisplayRangeHide.Down := true;

    if ShowBlindZone then  					  //17042012 mk
      sbDisplayBlindShow.Down := true
    else
      sbDisplayBlindHide.Down := true;

    btnRange1.Caption := FormatFloat('0.00', sonar.SonarDefinition.FDef.TIOW_Short_Range);
    btnRange2.Caption := FormatFloat('0.00', sonar.SonarDefinition.FDef.TIOW_Medium_Range);
    btnRange3.Caption := FormatFloat('0.00', sonar.SonarDefinition.FDef.TIOW_Long_Range);


    // sonar classification : active, passive, active/passive,passive intercept
    case SonarDefinition.FDef.Sonar_Classification of
      // active
      0:
        begin
          sbSonarControlModePassive.Enabled := false;
          sbSonarControlModeActive.Enabled := true;
          if TIOWRange = strShort then
            btnRange1.Down := true
          else if TIOWRange = strMedium then
            btnRAnge2.Down := true
          else if TIOWRange = strLong then
            btnRange3.Down := true;

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

    // Sonar Category : Hull-Mounted, Variable Depth, Towed Array, Sonobuoy, Dipping
    case SonarDefinition.FDef.Sonar_Category_Index of    //----17042012 mk
      // Hull-Mounted, Sonobuoy
      0,3:
        begin
          pnlDeployment.Visible             := False;
        end;
      // Variable Depth, Towed Array, Dipping
      1,2,4:
        begin
          pnlDeployment.Visible             := True;
        if ControlMode = scmDeployed then
           begin
              if sonar.SonarDefinition.FDef.Sonar_Classification = 0 then //active
              begin
                sbSonarControlModePassive.Enabled := False;
                sbSonarControlModeActive.Enabled  := True;
                sbSonarControlModeActive.Down     := False;
              end
              else if (sonar.SonarDefinition.FDef.Sonar_Classification = 1) or      //passive
                      (sonar.SonarDefinition.FDef.Sonar_Classification = 3)  then  //passive intercept
              begin
                sbSonarControlModePassive.Enabled := true;
                sbSonarControlModeActive.Enabled  := false;
                sbSonarControlModePassive.Down    := False;
              end
              else if sonar.SonarDefinition.FDef.Sonar_Classification = 2  then //activePassive
              begin
                sbSonarControlModePassive.Enabled := true;
                sbSonarControlModeActive.Enabled  := True;
                sbSonarControlModeActive.Down     := False;
                sbSonarControlModePassive.Down    := False;
              end;

           end
           else if (ControlMode = scmDeploying) or (ControlMode = scmOff) then

           begin
             sbSonarControlModePassive.Enabled := False;
             sbSonarControlModeActive.Enabled  := False;
           end;
        end;
    end;         									                      //----17042012 mk

    case ControlMode of
      scmOff:
      begin
        sbSonarControlModeOff.Down := true;
        sbSonarControlModePassive.Down := False;
        sbSonarControlModeActive.Down := False;
      end;
      scmPassive:
      begin

      end;
      scmActive:
      begin

      end;
      scmEmcon:
          sbSonarControlModeOff.Down := true;
    end;

    case ControlMode of      				  		            //----17042012 mk
      scmDeployed:
        begin
          sbSonarControlModeActive.Enabled := true;
          sbSonarControlModePassive.Enabled := true;
          sbDeploymentActiondeploy.Down := false;
          lblStatusDeployment.Caption := 'Deployed';  // MK
        end;
      scmDeploying:
        begin
          sbSonarControlModeActive.Enabled := false;
          sbSonarControlModePassive.Enabled := false;
          lblStatusDeployment.Caption := 'Deploying'; // MK
        end;
      scmStowed:
        begin
          sbSonarControlModeActive.Enabled := false;
          sbSonarControlModePassive.Enabled := false;
          sbDeploymentActionShow.Down := false;
          lblStatusDeployment.Caption := 'Stowed';    // MK
          sbSonarControlModeOff.Down := true;
        end;
      scmStowing:
        begin
          sbSonarControlModeActive.Enabled := false;
          sbSonarControlModePassive.Enabled := false;
          lblStatusDeployment.Caption := 'Stowing';   // MK
        end;
    end; 											                      //----17042012 mk

    case OperationalStatus of
      sopTooDeep, sopTooFast, sopTooSlow, sopTooHigh:
        begin
          sbSonarControlModeActive.Enabled := false;
          sbSonarControlModeOff.Enabled := false;
          sbSonarControlModePassive.Enabled := false;
        end;
    end;

    if ControlMode = scmActive then
      SetTIOWRangeSonar(true)
    else
      SetTIOWRangeSonar(false);

    case TIOWRange of
      strShort      : btnRange1.Down := true;
      strMedium     : btnRange2.Down := true;
      strLong       : btnRange3.Down := true;
    end;
  end;
end;

procedure TfmSensor.RefreshSonobuoyPropertiesTab(sonobuoy: TT3SonobuoyOnVehicle);
var
  menuItem    : TMenuItem;
  I, J, Jum   : Integer;
  o, v        : TSimObject;

begin
  grbSonobuoyControl.BringToFront;
  lbStatusQuantity.Caption := IntToStr(TT3SonobuoyOnVehicle(sonobuoy).Quantity);
  Jum := 0;

  if Assigned(simMgrClient.ControlledPlatform) then
    v := simMgrClient.ControlledPlatform
  else
    Exit;

  pmModeSonobuoy.Items.Clear;

  if TT3SonobuoyOnVehicle(sonobuoy).SonobuoyDefinition.FSonar.FDef.Sonar_Classification = 0 then
  begin
    editControlMode.Text := 'Active';
    menuItem := TMenuItem.Create(nil);
    menuItem.Caption :='Active';
    menuItem.Tag     := 0;
    menuItem.OnClick := onMenuSonobuoyClick;
    pmModeSonobuoy.Items.Add(menuItem);
  end
  else if TT3SonobuoyOnVehicle(sonobuoy).SonobuoyDefinition.FSonar.FDef.Sonar_Classification = 1 then
  begin
    editControlMode.Text := 'Passive';
    menuItem := TMenuItem.Create(nil);
    menuItem.Caption :='Passive';
    menuItem.Tag     := 0;
    menuItem.OnClick := onMenuSonobuoyClick;
    pmModeSonobuoy.Items.Add(menuItem);
  end
  else if TT3SonobuoyOnVehicle(sonobuoy).SonobuoyDefinition.FSonar.FDef.Sonar_Classification = 2 then
  begin
    editControlMode.Text := 'Active';

    for I := 0 to 1 do
    begin
      menuItem := TMenuItem.Create(nil);

      if i = 0 then
        menuItem.Caption :='Active' else
      if i = 1 then
        menuItem.Caption :='Passive';

      menuItem.Tag     := i;
      menuItem.OnClick := onMenuSonobuoyClick;
      pmModeSonobuoy.Items.Add(menuItem);
    end;
  end
  else if TT3SonobuoyOnVehicle(sonobuoy).SonobuoyDefinition.FSonar.FDef.Sonar_Classification = 3 then
  begin
    editControlMode.Text := 'Passive';
    menuItem := TMenuItem.Create(nil);
    menuItem.Caption :='Passive';
    menuItem.Tag     := 0;
    menuItem.OnClick := onMenuSonobuoyClick;
    pmModeSonobuoy.Items.Add(menuItem);
  end;

  {Menentukan banyak sonobuoy yg dimonitor}
  with simMgrClient do begin

    for J := 0 to SimPlatforms.itemCount - 1 do begin
      o := SimPlatforms.getObject(J);

      if o is TT3Sonobuoy then begin
        if (TT3Sonobuoy(o).InstanceName = TT3SonobuoyOnVehicle(sonobuoy).InstanceName) and
           (TT3Sonobuoy(o).ParentIndex = TT3PlatformInstance(v).InstanceIndex) then
        begin
          inc(Jum)
        end;
      end;
    end;
  end;

  lblSonobuoyMonitorCurrently.Caption := IntToStr(Jum);

end;

end.
