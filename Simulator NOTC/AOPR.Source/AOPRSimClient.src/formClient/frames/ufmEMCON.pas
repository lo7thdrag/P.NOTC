unit ufmEMCON;

interface

uses   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ComCtrls, StdCtrls, Buttons, ExtCtrls, uT3Unit,
  uT3Sensor, uT3OtherSensor, uT3Vehicle, tttData, uT3Radar, uT3Sonar, uT3Visual,
  uSimManager, uSimMgr_Client, uGameData_TTT, uT3DataLink;

type
  TfmEMCON = class(TfmControlled)
    PanelEmconChoices: TPanel;
    LvEmcon: TListView;
    PanelEmcon: TPanel;
    PaneALL: TPanel;
    ScrollBox2: TScrollBox;
    Bevel17: TBevel;
    Bevel18: TBevel;
    btnEmconDistributeToGroup: TButton;
    cbEmconAcousticDecoys: TCheckBox;
    cbEmconActiveSonar: TCheckBox;
    cbEmconFireControl: TCheckBox;
    cbEmconHFComm: TCheckBox;
    cbEmconHFDatalink: TCheckBox;
    cbEmconIFF: TCheckBox;
    cbEmconJammingSystems: TCheckBox;
    cbEmconLasers: TCheckBox;
    cbEmconSearchRadar: TCheckBox;
    cbEmconUWT: TCheckBox;
    cbEmconVHFUHFComm: TCheckBox;
    cbEmconVHFUHFDatalink: TCheckBox;
    cbxEmcon: TComboBox;
    Label562: TLabel;
    pnlGroupAirbone: TPanel;
    Label87: TLabel;
    Bevel22: TBevel;
    sbEmconGroupAirboneEMCON: TSpeedButton;
    sbEmconGroupAirboneClear: TSpeedButton;
    sbEmconAllSystemsAllSilent: TSpeedButton;
    sbEmconAllSystemsClearAll: TSpeedButton;

    procedure sbEmconAllClick(Sender: TObject);
    procedure cbEmconSearchRadarClick(Sender: TObject);
    procedure cbEmconFireControlClick(Sender: TObject);
  private
    { Private declarations }
    FirstClick : Boolean;
    StateButtonAllSilent : Boolean;
  public
    { Public declarations }
    procedure SetControlledObject(ctrlObj: TObject); override;
    procedure InitCreate(Sender: TForm); override;
    procedure UpdateSensorList(sensor : TT3Sensor);
    procedure UpdateIFFList(sensor : TT3IFFSensor);
    procedure RefreshPlatformSensorsTab(PfList: TT3PlatformInstance);
    procedure UpdateCheckBox(PfList: TT3PlatformInstance; StateBtn : Boolean);
    procedure RemoveListEMCON(ctrlObj: TObject);
  end;

var
  fmEMCON: TfmEMCON;

implementation

uses ufTacticalDisplay;

{$R *.dfm}

//type
//  RecIFF = class
//    IFFType : integer;
//    Data    : Pointer;
//  end;

//var
//  recIFFTransponder  : RecIFF;
//  recIFFInterrogator : RecIFF;

procedure TfmEMCON.cbEmconFireControlClick(Sender: TObject);
//var
//  v : TT3Vehicle;
//  i : Integer;
//  Sensor : TT3Sensor;
begin
  {inherited;
  v := TT3Vehicle(FControlled);

  for i := 0 to v.Devices.Count - 1 do
  begin
    Sensor := TT3Sensor(v.Devices.Items[i]);

    if Sensor is TT3Radar then
    begin
       if (TT3Radar(v.Devices.Items[i]).RadarDefinition.FType.Radar_Type_Index = 2) or
          (TT3Radar(v.Devices.Items[i]).RadarDefinition.FType.Radar_Type_Index = 3) and
          cbEmconFireControl.Checked then
          begin
            SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,
                                           CSENSOR_TYPE_RADAR, TT3Radar(v.Devices.Items[i]).InstanceIndex,
                                           CORD_ID_ControlMode, Byte(rcmEmcon));
          end
       else
       begin
         SimMgrClient.netSend_CmdSensor(TT3PlatformInstance(FControlled).InstanceIndex,CSENSOR_TYPE_RADAR,
                                        TT3Radar(v.Devices.Items[i]).InstanceIndex, CORD_ID_ControlMode,
                                        Byte(rcmOff));
       end;
    end;
  end;  }
end;

procedure TfmEMCON.cbEmconSearchRadarClick(Sender: TObject);
var
  v : TT3Vehicle;
  i : Integer;
  Sensor : TT3Sensor;
  datalink : TT3DataLink;
begin
  if FirstClick = True then
  begin
    v := TT3Vehicle(FControlled);
    datalink := simMgrClient.DataLinkManager.getDatalinkOnPU(v);

    //if HF data link
    if TCheckBox(Sender).Tag = Byte(HFDatalink) then
    begin
      if datalink <> nil then
      begin
        if cbEmconHFDatalink.Checked then
        begin
          simMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, Byte(HFDatalink),
                                        datalink.IDLink, Byte(Checked),
                                        CORD_ID_ControlMode, Byte(EmconOn));
        end
        else if not cbEmconHFDatalink.Checked then
        begin
          simMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, Byte(HFDatalink),
                                        datalink.IDLink, Byte(UnChecked),
                                        CORD_ID_ControlMode, Byte(EmconOff));
        end;
      end
      else begin
        frmTacticalDisplay.addStatus('Sensor Data Link not Assign!');
        TCheckBox(Sender).Checked := False;
      end;
    end
    //if HF data link
    else if TCheckBox(Sender).Tag = Byte(VHFDatalink) then
    begin
      if datalink <> nil then
      begin
        if cbEmconVHFUHFDatalink.Checked then
        begin
          simMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, Byte(VHFDatalink),
                                        datalink.IDLink, Byte(Checked),
                                        CORD_ID_ControlMode, Byte(EmconOn));
        end
        else if not cbEmconVHFUHFDatalink.Checked then
        begin
          simMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, Byte(VHFDatalink),
                                        datalink.IDLink, Byte(UnChecked),
                                        CORD_ID_ControlMode, Byte(EmconOff));
        end;
      end
      else begin
        frmTacticalDisplay.addStatus('Sensor Data Link not Assign!');
        TCheckBox(Sender).Checked := False;
      end;
    end
    else begin
      //if all sensor
      for i := 0 to v.Devices.Count - 1 do
      begin
        Sensor := TT3Sensor(v.Devices.Items[i]);

        case TCheckBox(Sender).Tag of
          Byte(srcRadar):
          begin
            if Sensor is TT3Radar then
            begin
              if (TT3Radar(v.Devices.Items[i]).RadarDefinition.FType.Radar_Type_Index = 0)
                and cbEmconSearchRadar.Checked then
              begin
                SimMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, byte(srcRadar),
                                            TT3Radar(v.Devices.Items[i]).InstanceIndex, Byte(Checked),
                                            CORD_ID_ControlMode, Byte(EmconOn));
                Continue;
              end
              else if (TT3Radar(v.Devices.Items[i]).RadarDefinition.FType.Radar_Type_Index = 0)
                      and not cbEmconSearchRadar.Checked then
              begin
                SimMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, byte(srcRadar),
                                            TT3Radar(v.Devices.Items[i]).InstanceIndex, Byte(UnChecked),
                                            CORD_ID_ControlMode, Byte(EmconOff));
                Continue;
              end;
            end;
          end;

          Byte(FCRadar):
          begin
            if Sensor is TT3Radar then
            begin
              if (((TT3Radar(Sensor).RadarDefinition.FType.Radar_Type_Index = 2) or
                  (TT3Radar(Sensor).RadarDefinition.FType.Radar_Type_Index = 3))
                  and (cbEmconFireControl.Checked)) then
              begin
                SimMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, byte(FCRadar),
                                            TT3Radar(v.Devices.Items[i]).InstanceIndex, Byte(Checked),
                                            CORD_ID_ControlMode, Byte(EmconOn));
                Continue;
              end
              else if (((TT3Radar(Sensor).RadarDefinition.FType.Radar_Type_Index = 2) or
                       (TT3Radar(Sensor).RadarDefinition.FType.Radar_Type_Index = 3)) and
                       (not cbEmconFireControl.Checked)) then
              begin
                SimMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, byte(FCRadar),
                                             TT3Radar(v.Devices.Items[i]).InstanceIndex, Byte(UnChecked),
                                             CORD_ID_ControlMode, Byte(EmconOff));
                Continue;
              end;
            end;
          end;

          Byte(IFF)        :
          begin
            if Sensor is TT3IFFSensor then
            begin
              if cbEmconIFF.Checked then
              begin
                simMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, Byte(IFF),
                                              TT3IFFSensor(v.Devices.Items[i]).InstanceIndex, Byte(Checked),
                                              CORD_ID_ControlMode, Byte(EmconOn));
                Continue;
              end
              else if not cbEmconIFF.Checked then
              begin
                simMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, Byte(IFF),
                                              TT3IFFSensor(v.Devices.Items[i]).InstanceIndex, Byte(UnChecked),
                                              CORD_ID_ControlMode, Byte(EmconOff));
                Continue;
              end;
            end;
          end;

          Byte(ActiveSonar):
          begin
            if Sensor is TT3Sonar then
            begin
              if cbEmconActiveSonar.Checked then
              begin
                SimMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, byte(ActiveSonar),
                                              TT3Sonar(v.Devices.Items[i]).InstanceIndex, Byte(Checked),
                                              CORD_ID_ControlMode, Byte(EmconOn));
                Continue;
              end
              else
              begin
                SimMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex,byte(ActiveSonar),
                                              TT3Sonar(v.Devices.Items[i]).InstanceIndex, Byte(UnChecked),
                                              CORD_ID_ControlMode, Byte(EmconOff));
                Continue;
              end;
            end;
          end;
        end;
      end;
    end;
  end
  else exit;
end;

procedure TfmEMCON.InitCreate(Sender: TForm);
begin
  inherited;

  LvEmcon.DoubleBuffered := True;
  FirstClick := True;

  btnEmconDistributeToGroup.Tag  := 1;
  sbEmconAllSystemsAllSilent.Tag := 2;
  sbEmconAllSystemsClearAll.Tag  := 3;
  sbEmconGroupAirboneEMCON.Tag   := 4;
  sbEmconGroupAirboneClear.Tag   := 5;

  cbEmconSearchRadar.Tag     :=  Byte(srcRadar);
  cbEmconFireControl.Tag     :=  Byte(FCRadar);
  cbEmconIFF.Tag             :=  Byte(IFF);
  cbEmconJammingSystems.Tag  :=  Byte(Jamming);
  cbEmconLasers.Tag          :=  Byte(Lasers);
  cbEmconHFComm.Tag          :=  Byte(HFComm);
  cbEmconVHFUHFComm.Tag      :=  Byte(VHFComm);
  cbEmconHFDatalink.Tag      :=  Byte(HFDatalink);
  cbEmconVHFUHFDatalink.Tag  :=  Byte(VHFDatalink);
  cbEmconUWT.Tag             :=  Byte(UWT);
  cbEmconActiveSonar.Tag     :=  Byte(ActiveSonar);
  cbEmconAcousticDecoys.Tag  :=  Byte(AcousticDecoy);
end;

procedure TfmEMCON.SetControlledObject(ctrlObj: TObject);
begin
  inherited;

  RefreshPlatformSensorsTab(TT3PlatformInstance(FControlled));

  if LvEmcon.Items.Count = 0 then
  begin
    PanelEmcon.Visible:= false;
    exit;
  end
  else
    PanelEmcon.Visible:= true;
end;

procedure TfmEMCON.RefreshPlatformSensorsTab
  (PfList: TT3PlatformInstance);
var
  i: integer;
  li: TListItem;
  ve : TT3Vehicle;
  EMCON : TEMCON_Category;
begin
  LvEmcon.Items.Clear;

  if not (PfList is TT3Vehicle) then 
    exit;
    
  ve := TT3Vehicle(PfList);

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    pnlGroupAirbone.Visible := False;
    btnEmconDistributeToGroup.Visible := False;
  end
  else
  begin
    pnlGroupAirbone.Visible := True;
    btnEmconDistributeToGroup.Visible := True;
  end;

  //cek capability emcon datalink (HF/VHF)
  if ve.VehicleDefinition <> nil then
  begin
    cbEmconHFDatalink.Enabled := ve.VehicleDefinition.FData.HF_Link_Capable;
    cbEmconVHFUHFDatalink.Enabled := ve.VehicleDefinition.FData.UHF_Link_Capable;
  end
  else
  begin
    cbEmconHFDatalink.Enabled := False;
    cbEmconVHFUHFDatalink.Enabled := False;
  end;

  // sensors
  for i := 0 to ve.Devices.Count - 1 do
  begin
    if (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3Sensor) then
    begin
      if not (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3Visual) and
         not (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3ESMSensor) and
         not (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3EOSensor) and
         not (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3MADSensor)then
      begin
        li := LvEmcon.Items.Add;
        li.Caption := TT3DeviceUnit(TT3Vehicle(ve).Devices[i]).InstanceName;

        if (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3Radar) then
        begin
          li.StateIndex := 1;
        end
        else if (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3Sonar) then
        begin
          li.StateIndex := 0;
        end
        else if (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3Visual) then
        begin
          li.StateIndex := 2;
          Continue;
        end
        else if (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3MADSensor) then
        begin
          li.StateIndex := 4;
        end
        else if (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3ESMSensor) then
        begin
          li.StateIndex := 3;
          Continue;
        end
        else if (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3EOSensor) then
        begin
          li.StateIndex := 4;
          Continue;
        end
        else if (TT3DeviceUnit(TT3Vehicle(ve).Devices[i]) is TT3IFFSensor) then
        begin
          li.StateIndex := 5;
        end
        else
        begin
          li.StateIndex := 0;
        end;

        if TT3Sensor(TT3Vehicle(ve).Devices[i]).EmconOperationalStatus = EmconOff then
        begin
          case TT3Sensor(TT3Vehicle(ve).Devices[i]).OperationalStatus of
            sopOff:
              li.SubItems.Add('Off');
            sopOn:
              li.SubItems.Add('On');
            sopOffIFF:
              li.SubItems.Add('Off');
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
          case TT3Sensor(TT3Vehicle(ve).Devices[i]).EmconOperationalStatus of
            EmconOn:
              li.SubItems.Add('EMCON');
            EmconOff:
              li.SubItems.Add('off');
          end;
        end;

        li.Data := TT3Sensor(TT3Sensor(TT3Vehicle(ve).Devices[i]));
      end;
    end;
  end;

  //Set CheckBox
  for i := 0 to TT3Vehicle(ve).ListEMCON.Count - 1 do
  begin
    EMCON := TEMCON_Category(TT3Vehicle(ve).ListEMCON[i]);
    case byte(EMCON.Name) of
      byte(srcRadar)      : cbEmconSearchRadar.Checked := Boolean(EMCON.Mode);
      byte(FCRadar)       : cbEmconFireControl.Checked := Boolean(EMCON.Mode);
      byte(IFF)           : cbEmconIFF.Checked := Boolean(EMCON.Mode);
      byte(Jamming)       : cbEmconJammingSystems.Checked := Boolean(EMCON.Mode);
      byte(Lasers)        : cbEmconLasers.Checked := Boolean(EMCON.Mode);
      byte(HFComm)        : cbEmconHFComm.Checked := Boolean(EMCON.Mode);
      byte(VHFComm)       : cbEmconVHFUHFComm.Checked := Boolean(EMCON.Mode);
      byte(HFDatalink)    :
                begin
                  if cbEmconHFDatalink.Enabled then
                    cbEmconHFDatalink.Checked := Boolean(EMCON.Mode);
                end;
      byte(VHFDatalink)   :
                begin
                  if cbEmconVHFUHFDatalink.Enabled then
                    cbEmconVHFUHFDatalink.Checked := Boolean(EMCON.Mode);
                end;
      byte(UWT)           : cbEmconUWT.Checked := Boolean(EMCON.Mode);
      byte(ActiveSonar)   : cbEmconActiveSonar.Checked := Boolean(EMCON.Mode);
      byte(AcousticDecoy) : cbEmconAcousticDecoys.Checked := Boolean(EMCON.Mode);
    end;
  end;

  if StateButtonAllSilent then
  begin
    sbEmconAllSystemsAllSilent.Down := True;
    sbEmconAllSystemsClearAll.Down := False;
  end
  else
  begin
    sbEmconAllSystemsAllSilent.Down := False;
    sbEmconAllSystemsClearAll.Down := True;
  end;
end;

procedure TfmEMCON.RemoveListEMCON(ctrlObj: TObject);
begin
  if not(Assigned(ctrlObj)) then
    Exit;

  if FControlled = ctrlObj then
  begin
    LvEmcon.Items.Clear;
    PanelEmcon.Visible  := False;
  end;
end;

procedure TfmEMCON.sbEmconAllClick(Sender: TObject);
begin
  inherited;

   case TSpeedButton(Sender).Tag of
     2: begin
            SimMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex, 12,
                                          0, Byte(Checked),
                                          CORD_ID_ControlMode, Byte(EmconOn));
        end;
     3: begin
          SimMgrClient.netSend_CmdEmcon(TT3PlatformInstance(FControlled).InstanceIndex,12,
                                        0, Byte(UnChecked),
                                        CORD_ID_ControlMode,Byte(EmconOff));
        end;
     4:;
     5:;
   end;
end;

procedure TfmEMCON.UpdateCheckBox(PfList: TT3PlatformInstance; StateBtn : Boolean);
var
  EMCON : TEMCON_Category;
  ve : TT3Vehicle;
  i: integer;
begin
  if not (PfList is TT3Vehicle) then
    exit;

  ve := TT3Vehicle(PfList);
  FirstClick := False;

  //Set CheckBox
  for i := 0 to TT3Vehicle(ve).ListEMCON.Count - 1 do
  begin
    EMCON := TEMCON_Category(TT3Vehicle(ve).ListEMCON[i]);

    case byte(EMCON.Name) of
      byte(srcRadar)      : cbEmconSearchRadar.Checked := Boolean(EMCON.Mode);
      byte(FCRadar)       : cbEmconFireControl.Checked := Boolean(EMCON.Mode);
      byte(IFF)           : cbEmconIFF.Checked := Boolean(EMCON.Mode);
      byte(Jamming)       : cbEmconJammingSystems.Checked := Boolean(EMCON.Mode);
      byte(Lasers)        : cbEmconLasers.Checked := Boolean(EMCON.Mode);
      byte(HFComm)        : cbEmconHFComm.Checked := Boolean(EMCON.Mode);
      byte(VHFComm)       : cbEmconVHFUHFComm.Checked := Boolean(EMCON.Mode);
      byte(HFDatalink)    :
                begin
                  if cbEmconHFDatalink.Enabled then
                    cbEmconHFDatalink.Checked := Boolean(EMCON.Mode);
                end;
      byte(VHFDatalink)   :
                begin
                  if cbEmconVHFUHFDatalink.Enabled then
                    cbEmconVHFUHFDatalink.Checked := Boolean(EMCON.Mode);
                end;
      byte(UWT)           : cbEmconUWT.Checked := Boolean(EMCON.Mode);
      byte(ActiveSonar)   : cbEmconActiveSonar.Checked := Boolean(EMCON.Mode);
      byte(AcousticDecoy) : cbEmconAcousticDecoys.Checked := Boolean(EMCON.Mode);
    end;
  end;

  FirstClick := True;
  StateButtonAllSilent := StateBtn;
  
  if StateBtn then
  begin
    sbEmconAllSystemsAllSilent.Down := True;
    sbEmconAllSystemsClearAll.Down := False;
  end
  else
  begin
    sbEmconAllSystemsAllSilent.Down := False;
    sbEmconAllSystemsClearAll.Down := True;
  end;
end;

procedure TfmEMCON.UpdateSensorList(sensor : TT3Sensor);
var
  i: integer;
  li: TListItem;
begin
  if LvEmcon.Items.count = 0 then
    exit;

  if not(Assigned(sensor)) then
    Exit;

  if sensor.Parent <> FControlled then
    Exit;

  for i := 0 to LvEmcon.Items.Count - 1 do
  begin
    li := LvEmcon.Items[i];

    if li.Data = sensor then
    begin
      if sensor.EmconOperationalStatus = EmconOff then
      begin
        case sensor.OperationalStatus of
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

      break;
    end;
  end;

end;

procedure TfmEMCON.UpdateIFFList(sensor : TT3IFFSensor);
var
  i: integer;
  li: TListItem;
  obj : TObject;
begin
  if LvEmcon.Items.count = 0 then
    exit;

  if not(Assigned(sensor)) then
    Exit;

  if sensor.Parent <> FControlled then
    Exit;

  for i := 0 to LvEmcon.Items.Count - 1 do
  begin
    li := LvEmcon.Items[i];
    obj := li.Data;
    if (obj is TT3IFFSensor) then
    begin
      if sensor.EmconOperationalStatus = EmconOff then
      begin
        case sensor.OperationalStatus of
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
      break;
    end;
  end;
end;
end.
