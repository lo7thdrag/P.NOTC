unit ufmFireControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  uT3otherSensor, uT3Unit, uSimObjects, uT3Sensor, uGameData_TTT;

type
  TfmFireControl = class(TfmControlled)
    lstAssetsChoices: TListView;
    PanelFCChoices: TPanel;
    PaneFCSpace: TPanel;
    PanelALL: TPanel;
    PanelFC: TPanel;
    ScrollBox3: TScrollBox;
    grbFireControl: TGroupBox;
    Bevel27: TBevel;
    Bevel52: TBevel;
    Bevel53: TBevel;
    btnSearchFireControlAssetsTarget: TSpeedButton;
    Label265: TLabel;
    Label266: TLabel;
    Label267: TLabel;
    Label268: TLabel;
    Label514: TLabel;
    Label515: TLabel;
    Label527: TLabel;
    lbControlChannel: TLabel;
    sbFireControlAssetsBlindZonesHide: TSpeedButton;
    sbFireControlAssetsBlindZonesShow: TSpeedButton;
    sbFireControlAssetsDisplayHide: TSpeedButton;
    sbFireControlAssetsDisplayShow: TSpeedButton;
    sbFireControlAssetsModeOff: TSpeedButton;
    sbFireControlAssetsModeSearch: TSpeedButton;
    sbFireControlAssetsModeTrackOnly: TSpeedButton;
    btnFireControlAssetsTargetAssign: TButton;
    btnFireControlAssetsTargetBreak: TButton;
    btnFireControlAssetsTargetBreakAll: TButton;
    edtFireControlAssetsTarget: TEdit;
    lstFireControlAssetsAssignedTracks: TListView;

    procedure btnFCROnClick(Sender: TObject);
    procedure lstAssetsChoicesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnSearchFireControlAssetsTargetClick(Sender: TObject);
    procedure lstFireControlAssetsAssignedTracksSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);
    procedure FrameEnter(Sender: TObject);
    procedure lstFireControlAssetsAssignedTracksDblClick(Sender: TObject);
  private
    { Private declarations }
    FVisibleShowRange : Boolean;
    FVisibleShowBlind : Boolean;
    //FFocused_Platform : TSimObject;

    procedure SetRangeRadar;
    procedure SetBlindRadar;
    //procedure SetFocusedPlatform(obj : TSimObject);
    //procedure Setfocused_Platform(const Value: TSimObject);

    procedure AssignGunTarget (mode: Integer; targetID : Integer; dev : TT3Sensor);
  public
    { Public declarations }
    Focused_Platform : TSimObject;
    Focused_Sensor: TSimObject;
    rGun: TRecCmd_GunFire;
    //property Focused_Platform: TSimObject read FFocused_Platform write SetFocused_Platform;

    procedure SetControlledObject(ctrlObj: TObject); override;
    procedure SetFocusedPlatform(obj : TSimObject);
    procedure InitCreate(sender: TForm); override;
    procedure UpdateFCList(sensor : TT3Sensor);
    procedure RefreshFCRPropertiesTab(fcr : TT3Sensor);
    procedure RefreshPlatformSensorsTab(PfList: TT3PlatformInstance);
    procedure RefreshAssignTrack(radar : TT3Sensor);
    procedure SetSelectedFC(radar : TT3Sensor);
    procedure RemoveListFC(ctrlObj: TObject);

    //mk
    procedure HideAllRange;
    procedure ShowRangeSelected;
    procedure HideAllBlind;
    procedure ShowBlindSelected;
  end;

implementation

uses uT3Vehicle, tttData, StrUtils, uT3Radar, uSimMgr_Client,
  uT3DetectedTrack, uBaseCoordSystem, uT3Gun, ufTacticalDisplay, uT3Missile;

{$R *.dfm}

procedure TfmFireControl.AssignGunTarget(mode: Integer; targetID: Integer; dev : TT3Sensor);
var
  i : Integer;
  ve : TT3Vehicle;
  gun : TT3GunOnVehicle;
  obj : TObject;
begin
  if dev.Parent is TT3Vehicle then
  begin
    ve := TT3Vehicle(dev.Parent);

    for I := 0 to ve.Weapons.Count - 1 do
    begin
      obj := ve.Weapons.Items[i];
      if obj is TT3GunOnVehicle then
      begin
        gun := TT3GunOnVehicle(ve.Weapons.Items[i]);

        if gun.GunDefinition.FData.Fire_Cntl_Director_Req = 1   then
        begin
          with rGun do
          begin
            SessionID         := 0;
            ParentPlatformID  := ve.InstanceIndex;
            GunName           := gun.InstanceName;
            GunID             := gun.InstanceIndex;
            ControlMode       := gun.ControlMode;
            SalvoMode         := gun.SalvoMode;
            SalvoSize         := gun.SalvoSize;
            GunCapacityRemain := gun.Quantity;

            if mode = 1 then begin
              TargetPlatformID  := targetID;
              OrderID          := CORD_ID_target;
              simMgrClient.netSend_CmdGunFire(rGun);
            end
            else if mode = 2 then
            begin
              if gun.TargetObject <> nil then
              begin
                if TT3PlatformInstance(gun.TargetObject).InstanceIndex
                   = targetID then
                begin
                  TargetPlatformID := TT3PlatformInstance(gun.TargetObject).InstanceIndex;
                  OrderID          := CORD_ID_break;
                  simMgrClient.netSend_CmdGunFire(rGun);
                end;
              end;
            end
            else if mode = 3 then
            begin
              TargetPlatformID := TT3PlatformInstance(gun.TargetObject).InstanceIndex;
              OrderID          := CORD_ID_break;
              simMgrClient.netSend_CmdGunFire(rGun);
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmFireControl.btnFCROnClick(Sender: TObject);
var
  li : TlistItem;
  rFC : TRecCmd_FC;
  I: Integer;
  fPlatform, fTarget : TT3PlatformInstance;
  posX1, posX2, posY1, posY2: Double;
  isInsideBlindZone : Boolean;
  fTrack : TSimObject;
  myTrackId, targetTrackId : Integer;
begin
  inherited;

  if not (Assigned(focused_sensor)) then
  begin
    frmTacticalDisplay.addStatus('Sensor not set');
    Exit;
  end;
  myTrackId := TT3PlatformInstance(focused_sensor.Parent).InstanceIndex;

  if not (Focused_Sensor is TT3Radar) then
  begin
    frmTacticalDisplay.addStatus('Sensor is not radar fire control');
    Exit;
  end;

  if Sender.ClassType = TButton then
  begin
    if not (TT3Radar(Focused_Sensor).OperationalStatus = sopOn) then
    begin
      frmTacticalDisplay.addStatus('Radar fire control is off');
      SetSelectedFC(TT3Radar(Focused_Sensor));
      Exit;
    end;

    case TButton(Sender).Tag of
      4:
      begin
        if not Assigned(Focused_Platform) then
        begin
          frmTacticalDisplay.addStatus('Targeted Platform must be set');
          SetSelectedFC(TT3Radar(Focused_Sensor));
          Exit;
        end;

        if Focused_Platform is TT3DetectedTrack then
        begin
          fTarget       := TT3PlatformInstance(TT3DetectedTrack(Focused_Platform).TrackObject);
          targetTrackId := fTarget.InstanceIndex;
        end
        else if Focused_Platform is TT3PlatformInstance then
        begin
          fTarget       := TT3PlatformInstance(Focused_Platform);
          targetTrackId := fTarget.InstanceIndex;
        end
        else
        begin
          frmTacticalDisplay.addStatus('Target is not suitable');
          SetSelectedFC(TT3Radar(Focused_Sensor));
          Exit;
        end;

        if myTrackId = targetTrackId then
        begin
          frmTacticalDisplay.addStatus('Own platform can not targeted');
          SetSelectedFC(TT3Radar(Focused_Sensor));
          Exit;
        end;

        if TT3Radar(Focused_Sensor).RadarDefinition.FDef.Num_FCR_Channels > 0 then
        begin
          //check isExits
          for I := 0 to lstFireControlAssetsAssignedTracks.Items.Count - 1 do
          begin
            li := lstFireControlAssetsAssignedTracks.Items[I];
            fPlatform := li.Data;

            //if exist -> Exit
            if fPlatform.Equals(fTarget) then
            begin
              frmTacticalDisplay.addStatus('Target is already assign');
              SetSelectedFC(TT3Radar(Focused_Sensor));
              Exit;
            end;
          end;

          // gak bisa nambah lagi jika tlh sama atau melebihi kapasitas assignednya.
          if TT3Radar(Focused_Sensor).AssignedTrack <> nil then
          begin
            if TT3Radar(Focused_Sensor).AssignedTrack.Count >= TT3Radar(Focused_Sensor).RadarDefinition.FDef.Num_FCR_Channels then
            begin
              frmTacticalDisplay.addStatus('Assign Cannel in '+TT3Vehicle(FControlled).TrackLabel + ' is full!!'); //mk 10052012
              SetSelectedFC(TT3Radar(Focused_Sensor));
              Exit;
            end;
          end;

          posX1 := TT3PlatformInstance(FControlled).PosX;
          posY1 := TT3PlatformInstance(FControlled).PosY;
          posX2 := fTarget.PosX;
          posY2 := fTarget.PosY;
          isInsideBlindZone := TT3Radar(Focused_Sensor).InsideBlindZone(fTarget);

          {cek range}
          if (CalcRange(posX1, posY1, posX2, posY2) > TT3Radar(Focused_Sensor).DetectionRange)
            or isInsideBlindZone then
          begin
            frmTacticalDisplay.addStatus('Target in blindzone or out of range!!'); //mk
            SetSelectedFC(TT3Radar(Focused_Sensor));
            Exit;
          end
          else
          begin
            // Assign FC
            rFC.PlatformParentID := TT3PlatformInstance(FControlled).InstanceIndex;
            rFC.PlatformID := targetTrackId;
            rFC.FCRadarID := TT3Radar(Focused_Sensor).InstanceIndex;
            rFC.OrderID := CORD_FC_ASSIGN;
            simMgrClient.netSend_Cmd_FireControl(rFC);

            //Assign Track Gun
            AssignGunTarget(1, targetTrackId, TT3Radar(Focused_Sensor));

            edtFireControlAssetsTarget.Text := '';
            SetSelectedFC(TT3Radar(Focused_Sensor));
            Exit;
          end;
        end
        else
        begin
          frmTacticalDisplay.addStatus('Sensor is not radar fire control');
          SetSelectedFC(TT3Radar(Focused_Sensor));
          Exit;
        end;
      end;
      5:
      begin
        if lstFireControlAssetsAssignedTracks.Selected <> nil then
        begin
          rFC.PlatformParentID := TT3PlatformInstance(FControlled).InstanceIndex;

          fTrack := TSimObject(lstFireControlAssetsAssignedTracks.Selected.Data);
          if fTrack is TT3PlatformInstance then
          begin
            rFC.PlatformID := TT3PlatformInstance(fTrack).InstanceIndex;
          end
          else if fTrack is TT3DetectedTrack then
          begin
            rFC.PlatformID := TT3PlatformInstance(TT3DetectedTrack(fTrack).TrackObject).InstanceIndex;
          end;

          //Break FC
          rFC.FCRadarID := TT3Radar(Focused_Sensor).InstanceIndex;
          rFC.OrderID := CORD_FC_BREAK;
          simMgrClient.netSend_Cmd_FireControl(rFC);

          //Break Track Gun
          AssignGunTarget(2, rFC.PlatformID, TT3Radar(Focused_Sensor));

          edtFireControlAssetsTarget.Text := '';
          Exit;
        end;
      end;
      6:
      begin
        if lstFireControlAssetsAssignedTracks.Items.Count > 0 then
        begin
          rFC.PlatformParentID := TT3PlatformInstance(FControlled).InstanceIndex;
          rFC.PlatformID := 0;//TT3PlatformInstance(lstFireControlAssetsAssignedTracks.Selected.Data).InstanceIndex;
          rFC.FCRadarID := TT3Radar(Focused_Sensor).InstanceIndex;

          //Break FC
          rFC.OrderID := CORD_FC_BREAKALL;
          simMgrClient.netSend_Cmd_FireControl(rFC);

          //Break Track Gun
          AssignGunTarget(3, 0, TT3Radar(Focused_Sensor));

          edtFireControlAssetsTarget.Text := '';
          Exit;
        end;
      end;
    end;
  end

  else if sender.ClassType = TSpeedButton then
  begin
    if TT3Radar(Focused_Sensor).OperationalStatus = sopDamage then      //andik
    begin
      frmTacticalDisplay.addStatus('Sensor is Damage');
      Exit;
    end;

    with TT3Radar(Focused_Sensor) do
    begin
      case TSpeedButton(Sender).Tag of
        1:
        begin
          //ControlMode := rcmSearchTrack;

          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Radar) then
            SimMgrClient.netSend_CmdSensor
              (TT3PlatformInstance(FControlled).InstanceIndex,CSENSOR_TYPE_RADAR,
               TT3Radar(focused_sensor).InstanceIndex, CORD_ID_ControlMode,Byte(rcmSearchTrack));
        end;
        2:
        begin
          //ControlMode := rcmTrack;
          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Radar) then
            SimMgrClient.netSend_CmdSensor
              (TT3PlatformInstance(FControlled).InstanceIndex,CSENSOR_TYPE_RADAR,
               TT3Radar(focused_sensor).InstanceIndex, CORD_ID_ControlMode,Byte(rcmTrack));
        end;
        3:
        begin
          //ControlMode := rcmOff;
          if (FControlled is TT3PlatformInstance) and (focused_sensor is TT3Radar) then
            SimMgrClient.netSend_CmdSensor
              (TT3PlatformInstance(FControlled).InstanceIndex,CSENSOR_TYPE_RADAR,
               TT3Radar(focused_sensor).InstanceIndex, CORD_ID_ControlMode, Byte(rcmOff));
        end;
        7:
        begin
          FVisibleShowRange := True;
          ShowRange := true;

          ShowRangeSelected := ShowRange and FVisibleShowRange;
        end;
        8:
        begin
          FVisibleShowRange := False;
          ShowRange := false;

          ShowRangeSelected := ShowRange and FVisibleShowRange;
        end;
        9:
        begin
          FVisibleShowBlind := True;

          ShowBlindZone := True;
          ShowBlindSelected := ShowBlindZone and FVisibleShowBlind;
        end;
        10:
        begin
          FVisibleShowBlind := False;

          ShowBlindZone := False;
          ShowBlindSelected := ShowBlindZone and FVisibleShowBlind;
        end;
      end;
    end;
  end;

  RefreshPlatformSensorsTab(FControlled as TT3PlatformInstance);
  SetSelectedFC(TT3Radar(Focused_Sensor));
end;

procedure TfmFireControl.btnSearchFireControlAssetsTargetClick(
  Sender: TObject);
var
  trackNum : String;
  sObject : TSimObject;
  myTrackId, targetTrackId : Integer;
begin
  inherited;

  edtFireControlAssetsTarget.Text := '';

  if Assigned(FControlled) then
  begin
    myTrackId := TT3PlatformInstance(FControlled).InstanceIndex;
  end
  else
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    exit;
  end;

  if Focused_Platform is TT3DetectedTrack then
  begin
    targetTrackId := TT3PlatformInstance(TT3DetectedTrack(Focused_Platform).TrackObject).InstanceIndex;
  end
  else if Focused_Platform is TT3PlatformInstance then
  begin
    targetTrackId := TT3PlatformInstance(Focused_Platform).InstanceIndex;
  end
  else
  begin
    frmTacticalDisplay.addStatus('Target is not suitable');
    Exit;
  end;

  if myTrackId = targetTrackId then
  begin
    frmTacticalDisplay.addStatus('Own platform can not targeted');
    Exit;
  end;

  if Assigned(focused_platform) then
  begin
    //targetTrackId := TT3PlatformInstance(focused_platform).Track_ID;
    sObject := simMgrClient.findDetectedTrack(focused_platform);

    if Assigned(sObject) then
      trackNum := FormatTrackNumber(TT3DetectedTrack(sObject).TrackNumber)
    else
      trackNum := TT3PlatformInstance(focused_platform).Track_ID;

    edtFireControlAssetsTarget.Text := trackNum;
  end
  else
  begin
    frmTacticalDisplay.addStatus('Target not defined'); //mk
    exit;
  end;
end;

procedure TfmFireControl.FrameEnter(Sender: TObject);
begin
  inherited;

  if not Assigned(FControlled) then
     Exit;

  RefreshPlatformSensorsTab(FControlled as TT3PlatformInstance);
end;

procedure TfmFireControl.HideAllBlind;
var
  I : Integer;
  sensor    : TT3Sensor;
  obj       : TObject;
  vehicle   : TT3Vehicle;
begin
  if not(Assigned(FControlled)) or not(FControlled is TT3Vehicle) then exit;

  vehicle := TT3Vehicle(FControlled);
  if not(Assigned(vehicle)) then Exit;

  sensor := nil;
  if vehicle.Devices.Count > 0 then
  begin
    for I := 0 to vehicle.Devices.Count - 1 do
    begin
      obj := vehicle.Devices.Items[i];
      if (obj is TT3Sensor) then sensor := TT3Sensor(obj);

	    if not(Assigned(sensor)) then Continue;

      sensor.ShowBlindSelected := False;
    end;
  end;
end;

procedure TfmFireControl.HideAllRange;
var
  I  : Integer;
  sensor    : TT3Sensor;
  obj       : TObject;
  vehicle   : TT3Vehicle;
begin
  if not(Assigned(FControlled)) or not(FControlled is TT3Vehicle) then exit;

  vehicle := TT3Vehicle(FControlled);
  if not(Assigned(vehicle)) then Exit;

  sensor := nil;
  if vehicle.Devices.Count > 0 then
  begin
    for I := 0 to vehicle.Devices.Count - 1 do
    begin
      obj := vehicle.Devices.Items[i];
      if (obj is TT3Sensor) then sensor := TT3Sensor(obj);

	    if not(Assigned(sensor)) then Continue;

      sensor.ShowRangeSelected := False;
    end;
  end;
end;

procedure TfmFireControl.initCreate(sender: TForm);
begin
  inherited;
  lstAssetsChoices.DoubleBuffered := true;

  sbFireControlAssetsModeSearch.Tag     := 1;
  sbFireControlAssetsModeTrackOnly.Tag  := 2;
  sbFireControlAssetsModeOff.tag        := 3;
  btnFireControlAssetsTargetAssign.Tag  := 4;
  btnFireControlAssetsTargetBreak.Tag   := 5;
  btnFireControlAssetsTargetBreakAll.Tag:= 6;

  sbFireControlAssetsDisplayShow.Tag    := 7;
  sbFireControlAssetsDisplayHide.Tag    := 8;
  sbFireControlAssetsBlindZonesShow.Tag := 9;
  sbFireControlAssetsBlindZonesHide.Tag := 10;
  btnSearchFireControlAssetsTarget.Tag  := 11;
end;

procedure TfmFireControl.UpdateFCList(sensor : TT3Sensor);
var
  i: integer;
  li: TListItem;
  tempRadar : TT3Radar;
  s : TT3Sensor;
begin
  if lstAssetsChoices.Items.count = 0 then exit;
  if not(Assigned(sensor)) then Exit;
  if sensor.Parent <> FControlled then Exit;

  for i := 0 to lstAssetsChoices.Items.Count - 1 do
  begin
    li := lstAssetsChoices.Items[i];

    if li.Data = sensor then
    begin
      if sensor.EmconOperationalStatus = EmconOff then
      begin
        case sensor.OperationalStatus of
          sopOff:
            li.SubItems[0] := 'Off';
          sopOn:
          begin
            s := li.Data;
            tempRadar := nil;

            if (s is TT3Radar) then
              tempRadar := TT3Radar(s);

            if Assigned(tempRadar) then
            begin
              if tempRadar.AssignedTrack <> nil then
              begin
                if tempRadar.AssignedTrack.Count = 0 then
                   li.SubItems[0] := 'No Channel Assigned'
                else if (tempRadar.AssignedTrack.Count > 0)
                  and (tempRadar.AssignedTrack.Count < tempRadar.RadarDefinition.FDef.Num_FCR_Channels) then
                   li.SubItems[0] := 'Some Channels Assigned'
                else
                if (tempRadar.AssignedTrack.Count >= tempRadar.RadarDefinition.FDef.Num_FCR_Channels) then
                  li.SubItems[0] := 'All Channels Assigned';
              end;
            end
            else
            begin
              li.SubItems[0] := '---';
            end;
          end;
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

      break;
    end;
  end;
end;

procedure TfmFireControl.lstAssetsChoicesSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  selectedItem: TListItem;
begin
  if not(Assigned(FControlled)) then Exit;

  HideAllRange;//(TT3PlatformInstance(FControlled));
  ShowRangeSelected;
  HideAllBlind;
  ShowBlindSelected;

  selectedItem := lstAssetsChoices.ItemFocused;

  if FControlled = nil then
    exit;

  if selectedItem = nil then
    exit;

  focused_sensor := selectedItem.Data;
  if not Assigned(focused_sensor) then
    exit;

  RefreshAssignTrack(selectedItem.Data);

  if not (Focused_Sensor  is TT3Sensor) then exit;

  RefreshFCRPropertiesTab(TT3Sensor(Focused_Sensor));
end;

procedure TfmFireControl.lstFireControlAssetsAssignedTracksDblClick(
  Sender: TObject);
var
  fTrack   : TSimObject;
  targetID : Integer;
begin
  inherited;

  //Assign Track Gun
  if lstFireControlAssetsAssignedTracks.Selected <> nil then
  begin
    targetID := 0;
    fTrack := TSimObject(lstFireControlAssetsAssignedTracks.Selected.Data);

    if fTrack is TT3PlatformInstance then
    begin
      targetID := TT3PlatformInstance(fTrack).InstanceIndex;
    end
    else if fTrack is TT3DetectedTrack then
    begin
      targetID := TT3PlatformInstance(TT3DetectedTrack(fTrack).TrackObject).InstanceIndex;
    end;

    if targetID <> 0 then
      AssignGunTarget(1, targetID, TT3Radar(Focused_Sensor));
  end;
end;

procedure TfmFireControl.lstFireControlAssetsAssignedTracksSelectItem(
  Sender: TObject; Item: TListItem; Selected: Boolean);
var
  aObj : TSimObject;
begin
  inherited;

  if not Assigned(item) then Exit;

  aObj := item.Data;
  Focused_Platform := aObj;

  {if aObj is TT3PlatformInstance then
  begin
    Focused_Platform := aObj;
  end
  else if aObj is TT3DetectedTrack then
  begin
    Focused_Platform := TT3DetectedTrack(aObj).TrackObject;
  end;}
end;

procedure TfmFireControl.RefreshFCRPropertiesTab(fcr: TT3Sensor);
begin
  case fcr.OperationalStatus of
    sopOn: sbFireControlAssetsModeSearch.Down := true;
    sopOff: sbFireControlAssetsModeOff.Down := true;
  end;

  if fcr.ShowBlindZone then
    sbFireControlAssetsBlindZonesShow.Down := true
  else
    sbFireControlAssetsBlindZonesHide.Down := true;

  if fcr.ShowRange then
    sbFireControlAssetsDisplayShow.Down := true
  else
    sbFireControlAssetsDisplayShow.Down := false;
end;

procedure TfmFireControl.RefreshPlatformSensorsTab(PfList: TT3PlatformInstance);
var
  i: integer;
  li: TListItem;
  fc : String;
  ac : String;
  sensor    : TT3FCRSensor;
  tempRadar : TT3Radar;
  device    : TT3DeviceUnit;
begin
  lstAssetsChoices.Items.Clear;
  fc := 'Fire Control';
  ac := 'Air Search';
  if not (PfList is TT3Vehicle) or not(PfList is TT3Vehicle) then exit;

  for i := 0 to TT3Vehicle(PfList).Devices.Count - 1 do
  begin
    device := TT3Vehicle(PfList).Devices.Items[i];
    if not(Assigned(device)) or not(device is TT3Sensor) then continue;

    if device is TT3Radar then
    begin
      tempRadar := TT3Radar(device);

      if tempRadar.RadarDefinition.FDef.Num_FCR_Channels > 0 then
      begin
        li := lstAssetsChoices.Items.Add;
        li.Caption := tempRadar.InstanceName;
        li.Data    := tempRadar;

        if tempRadar.EmconOperationalStatus = EmconOff then
        begin
          case tempRadar.OperationalStatus of
            sopOff:
              li.SubItems.Add('Off');
            sopOn:
              begin
                if tempRadar.AssignedTrack <> nil then
                begin
                  if tempRadar.AssignedTrack.Count = 0 then
                     li.SubItems.Add('No Channel Assigned')
                  else if (tempRadar.AssignedTrack.Count > 0)
                      and (tempRadar.AssignedTrack.Count < tempRadar.RadarDefinition.FDef.Num_FCR_Channels) then
                     li.SubItems.Add('Some Channels Assigned')
                  else if (tempRadar.AssignedTrack.Count >= tempRadar.RadarDefinition.FDef.Num_FCR_Channels) then
                    li.SubItems.Add('All Channels Assigned');
                end;
              end;
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
          case tempRadar.EmconOperationalStatus of
            EmconOn:
              li.SubItems.Add('EMCON');
            EmconOff:
              li.SubItems.Add('off');
          end;
        end;
      end;
    end
    else if (device is TT3FCRSensor) then
    begin
      sensor := TT3FCRSensor(device);
      li := lstAssetsChoices.Items.Add;
      li.Caption  := sensor.InstanceName;
      li.Data     := sensor;

      if sensor.EmconOperationalStatus = EmconOff then
      begin
        case sensor.OperationalStatus of
          sopOff:
            li.SubItems.Add('Off');
          sopOn:
            begin
              li.SubItems.Add('Available');
            end;
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

procedure TfmFireControl.RemoveListFC(ctrlObj: TObject);
begin
  if not(Assigned(ctrlObj)) then
    Exit;

  if FControlled = ctrlObj then
  begin
    lstAssetsChoices.Items.Clear;
    PanelFC.Visible := False;

    Focused_Sensor := nil;
    focused_platform := nil;
  end;
end;

procedure TfmFireControl.RefreshAssignTrack(radar : TT3Sensor);
var
  fireControl : TT3Radar;
  I: Integer;
  li : TListItem;
  obj : TSimObject;
begin
  if not Assigned(radar) then Exit;

  fireControl := radar as TT3Radar;
  lstFireControlAssetsAssignedTracks.Items.Clear;

  if fireControl.AssignedTrack <> nil then
  begin
    for I := 0 to fireControl.AssignedTrack.Count - 1 do
    begin
      obj := fireControl.AssignedTrack.Items[I];
      li := lstFireControlAssetsAssignedTracks.Items.Add;

      if obj is TT3PlatformInstance then
      begin
        li.Caption := TT3PlatformInstance(obj).InstanceName;
        li.Data := obj;
      end
      else if obj is TT3DetectedTrack then
      begin
        li.Caption := IntToStr(TT3DetectedTrack(obj).TrackNumber);
        li.Data := obj;
      end;
    end;
  end;
end;

procedure TfmFireControl.SetBlindRadar;
var
  sensor    : TT3Sensor;
  obj       : TObject;
begin
  obj := lstAssetsChoices.Items[0].Data;
  sensor := nil;

  if (obj is TT3Sensor) then
    sensor := TT3Sensor(obj);

  if not(Assigned(sensor)) then Exit;

  if sensor.ShowBlindZone then
  begin
    sensor.ShowBlindSelected := True;
  end;
end;

procedure TfmFireControl.SetControlledObject(ctrlObj: TObject);
var
  device : TSimObject;
begin
  inherited;

  if not(Assigned(ctrlObj)) then
    Exit;

  RefreshPlatformSensorsTab(TT3PlatformInstance(ctrlObj));

  if lstAssetsChoices.Items.Count = 0 then
  begin
    PanelFC.Visible:= false;
    exit;
  end
  else
    PanelFC.Visible:= true;

  device := lstAssetsChoices.Items[0].Data;
  if not(Assigned(device)) or not(device is TT3Sensor) then
    Exit
  else
    focused_sensor := device;

  if not Assigned(focused_sensor) then
    exit;

  if Focused_Sensor is TT3Sensor then
  begin
    RefreshAssignTrack(TT3Sensor(focused_sensor));
    RefreshFCRPropertiesTab(TT3Sensor(focused_sensor));
  end;

  HideAllRange;
  HideAllBlind;
  SetRangeRadar;
  SetBlindRadar;
end;

//procedure TfmFireControl.Setfocused_platform(const Value: TSimObject);
//begin
//  FFocused_platform := Value;
//end;

procedure TfmFireControl.SetFocusedPlatform(obj : TSimObject);
begin
  Focused_Platform := obj;
end;

procedure TfmFireControl.SetRangeRadar;
var
  sensor    : TT3Sensor;
  obj       : TObject;
begin
  obj := lstAssetsChoices.Items[0].Data;
  sensor := nil;

  if (obj is TT3Sensor) then
    sensor := TT3Sensor(obj);

  if not(Assigned(sensor)) then Exit;

  if sensor.ShowRange then
  begin
    sensor.ShowRangeSelected := True;
  end;
end;

procedure TfmFireControl.SetSelectedFC(radar: TT3Sensor);
var
  i        : Integer;
  sensorFC : TT3Radar;
  obj      : TObject;
begin
  if Assigned(radar) and (radar is TT3Radar) then
  begin
    sensorFC := nil;

    for I := 0 to lstAssetsChoices.Items.Count - 1 do
    begin
      obj := lstAssetsChoices.Items[I].Data;
      if (obj is TT3Radar) then sensorFC := TT3Radar(obj);
      if not(Assigned(sensorFC)) then Continue;

      if (sensorFC.InstanceIndex = TT3Radar(radar).InstanceIndex) then
      begin
        lstAssetsChoices.Items[I].Selected := True;
        Break;
      end;
    end;
  end;
end;

procedure TfmFireControl.ShowBlindSelected;
var
  I, index  : Integer;
  sensor    : TT3Sensor;
  obj       : TObject;
begin
  index := -1;
  i := lstAssetsChoices.itemIndex;
  sensor := nil;

  if (I <> index) then
  begin
    obj := lstAssetsChoices.Items[I].Data;

    if (obj is TT3Sensor) then
      sensor := TT3Sensor(obj);

	  if not(Assigned(sensor)) then Exit;

    if sensor.ShowBlindZone then
    begin
      sensor.ShowBlindSelected := True;
    end;
  end;
end;

procedure TfmFireControl.ShowRangeSelected;
var
  I, index  : Integer;
  sensor    : TT3Sensor;
  obj       : TObject;
begin
  index := -1;
  i := lstAssetsChoices.itemIndex;
  sensor := nil;

  if (I <> index) then
  begin
    obj := lstAssetsChoices.Items[I].Data;

    if (obj is TT3Sensor) then
      sensor := TT3Sensor(obj);

	  if not(Assigned(sensor)) then Exit;

    if sensor.ShowRange then
    begin
      sensor.ShowRangeSelected := True;
    end;
  end;
end;

end.

