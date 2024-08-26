unit uT3ReplayEventManager;

interface

uses
  uT3EventManager, uT3Unit, tttData, uBaseCoordSystem,uDBAssetObject, uGameData_TTT,
  newClassASTT, SysUtils, ComCtrls, uMainStrategi, uMainLogisticTemplate;

type
  TT3ReplayEventManager = class(TT3EventManager)
  private
    FManagerClient : TObject;
    procedure SetManagerClient(const Value: TObject);

  public
    property ManagerClient : TObject read FManagerClient write SetManagerClient;

    procedure OnPlatformAssigned(Sender : TObject); override;
    procedure OnPlatformDestroy(Sender : TObject);                              override;
    procedure OnPlatformFreeMe(Sender : TObject;Value : boolean);               override;
    procedure OnPlatformHancurin(SenderID : Integer; Target: string; reasondestroy : Byte);override;
    procedure OnPlatformPositonChange(Sender : TObject);                        override;

//    procedure OnUpdateEnvi(index : integer; Value: Double);                     override;
    procedure OnCheckDateTime(sender : TObject); override;

    //sensor event
    procedure OnSensorDetect(Sender : TObject; detected : TObject; Value : boolean; aIFF : Boolean );  override;
    procedure OnSensorRemoved(Sender : TObject);                                      override;
    procedure OnSensorOperationalStatus(Sender : TObject;Mode : TSensorOperationalStatus);  override;
    procedure OnRadarControlMode(Sender : TObject;Mode : TRadarControlMode);                override;
    procedure OnSonarControlMode(Sender : TObject;Mode : TSonarControlMode);                override;
    procedure onIFFTransponderStatus(Sender : TObject;Mode : TSensorOperationalStatus);   override;
    procedure OnIFFInterrogatorStatus(Sender : TObject;Mode : TSensorOperationalStatus);  override;
    procedure OnIFFSensorDetect(aShip, aSensor, aTarget : TObject; value, value2 : boolean; mode1,mode2,mode3,mode3C : string);  override;

    //weapon event
    procedure OnWeaponLaunched(Sender : TObject; Target : TObject);                         override;
    procedure OnWeaponDestroy(Sender : TObject);                                            override;
    procedure OnWeaponTarget(Sender : TObject; Target : TObject);                           override;
    procedure OnWeaponPropertyChange(Sender : TObject);                                     override;
    procedure OnWeaponInOut(SenderID: integer; reasondestroy : Byte) ;                      override;
    procedure OnWeaponHit(Sender : TObject; Target : TObject; Lethality : integer; FreeWeapon: Boolean);     override;
	  procedure OnWeaponHitByServer(SenderID, TargetID, Lethality : integer; ParentName : string) ;    override;
    procedure OnMapNeedUpdate(Sender : TObject);                                override;
    // ECM Event
    procedure OnECMLaunched(Sender : TObject);        override;
	  procedure OnECMDestroy(Sender : TObject);         override;

    // event datalink
    procedure OnDataLinkUpdated(Sender : TObject); override;
    procedure OnDatalinkTracksUpdate(Sender : TObject);override;
    procedure OnDatalinkOffLine(Sender : TObject);override;

    procedure SetManager(manager : TObject);

    procedure OnDynamicTrackUpdate(iNameTrack, iNameOver: string; iIDTrack, idx, ibrg, irot, iNotrack, iNRPGroupID: integer; irng: Double ; ireltrue: Byte);
    procedure OnOverlayTemplate(r: TRecCmd_OverlayTemplate);
    procedure OnReceiveMessageHandling(Cmd : TRecSendMessage);override;

    procedure OnLaunchMisile(aParentID, aMissileID, aTargetID, aSalvo : Integer); override;
    procedure OnDepthChecker(Sender : TObject);override;
//    procedure OnPlotting(rec : TRecCmd_Plotting);OVERRIDE;
//    procedure OnLogisticTemplate(iName, iOldName: string; iIdAction, iColor : Integer; iShow : Boolean); override;
//    procedure OnLogisticRoute(iName: string; id, iPersonel, iColor : Integer; iSpeed, iPAwalX, iPAwalY
//              ,iPAkhirX, iPAkhirY : Double); override;
  end;

implementation

uses
  ufmainDisplay, uSimObjects, uT3ReplayClient, uT3Radar,
  uT3Vehicle, uT3Torpedo, uT3Missile, uT3Sensor, uT3DataLink,
  uT3Weapon, uT3DetectedTrack, uT3OtherSensor,
  uT3MissileDetail, uDBCubicles, uT3Gun, uT3Bomb, uT3SimManager,
  uT3CounterMeasure, uT3Sonobuoy;

{ TT3ReplayEventManager }

procedure TT3ReplayEventManager.OnCheckDateTime(sender: TObject);
begin
  inherited;
  if sender is TT3Sensor then
    TT3Sensor(sender).Date_Time :=  TT3ReplayClient(ManagerClient).GameTIME;

end;

procedure TT3ReplayEventManager.OnDatalinkOffLine(Sender: TObject);
begin
  inherited;
  TT3ReplayClient(ManagerClient).RemoveDetectedTrackByDataLink(TT3DataLink(Sender));

end;

procedure TT3ReplayEventManager.OnDatalinkTracksUpdate(Sender: TObject);
var
  dl      : TT3DataLink;
  i,j     : integer;
  itemNCS : TT3DLNCSTrackEntityItem;
  itemPU  : TT3DLParticipatingUnitItem;
  PUNCS,pf: TT3PlatformInstance;
  aPf     : TSimObject;
  range   : double;
  outRange, found : boolean;
  arrTracks : TIntegerArray;
  FMyCubGroup : T3CubicleGroup;
begin
  inherited;

  if not Assigned(Sender) then
    Exit;

  outRange := false;

  if Sender is TT3DataLink then
  begin
    if TT3ReplayClient(ManagerClient).CurrentPerspective <> 0 then
    begin
      dl := TT3DataLink(Sender);

      FMyCubGroup := T3CubicleGroup(TT3ReplayClient(ManagerClient).Scenario.
        CubiclesGroupsListFromDB.GetGroupByID(TT3ReplayClient(ManagerClient).CurrentPerspective));

      { cek apakah ada platform yang di control }
      if not Assigned(TT3ReplayClient(ManagerClient).HookedPlatform) then
      begin
        TT3ReplayClient(ManagerClient).RemoveDetectedTrackByDataLink(dl);

        Exit;
      end;
      { end cek platform yang di control }

      { cek emcon status pada object yang di control}
      if TT3ReplayClient(ManagerClient).HookedPlatform is TT3Vehicle then
      begin
        if (TT3Vehicle(TT3ReplayClient(ManagerClient).HookedPlatform).EMCON_HFDataLinkVehicle = EmconHFDatalinkOn)
        or (TT3Vehicle(TT3ReplayClient(ManagerClient).HookedPlatform).EMCON_UHFVHFDataLinkVehicle = EmconUHFVHFDatalinkOn) then
        begin
          { remove detected track }
          TT3ReplayClient(ManagerClient).RemoveDetectedTrackByDataLink(dl);
          Exit;
        end;
      end;
      { end cek emcon status }

      // Get participating Unit
      itemPU := nil;
      if TT3ReplayClient(ManagerClient).HookedPlatform.ClassType = TT3PlatformInstance then
        itemPU := dl.GetPUByInstanceIndex(TT3PlatformInstance(TT3ReplayClient(ManagerClient).HookedPlatform).InstanceIndex);

      if not Assigned(itemPU) then
        Exit;

      // Get NCS PLatform
      PUNCS := dl.GetNCSPlatform;
      if not Assigned(PUNCS) then
        // if not assign, delete detected track
        TT3ReplayClient(ManagerClient).RemoveDetectedTrackByDataLink(dl)
      else
      begin
        if TT3ReplayClient(ManagerClient).HookedPlatform.Equals(PUNCS) then
        begin
          { shortening cycle process }
          TT3ReplayClient(ManagerClient).findDetectedTracksByDatalink(arrTracks);

          { sync between NCS entities with detected tracks }
          for I := 0 to dl.getNCSEntitiesCount - 1 do
          begin
            itemNCS := dl.getNCSEntity(i);

            if not Assigned(itemNCS) then
              Continue;

            if itemNCS.NEIOwnerID = PUNCS.InstanceIndex then
              Continue;

            found := false;
            for j := 0 to Length(arrTracks) - 1 do
            begin
              if arrTracks[j] = itemNCS.NEITrackID then
              begin
                { already exist on detected track by datalink, set to 0 }
                arrTracks[j] := 0;
                found := true;
                break;
              end;
            end;


            if FMyCubGroup = nil then
              Exit;

            if FMyCubGroup.IsGroupMember(itemNCS.NEITrackID) then
              found := true;

            { if not exist on detected track by datalink, then add track }
            if not found then
              TT3ReplayClient(ManagerClient).AddDetectedTrackByDataLink(itemNCS.NEITrackID,dl);
          end;

          for I := 0 to Length(arrTracks) - 1 do
          begin
            if arrTracks[i] = 0  then
              Continue;

            aPf := TT3ReplayClient(ManagerClient).FindT3PlatformByID(arrTracks[i]);
            if Assigned(aPf) then
              TT3ReplayClient(ManagerClient).Remove_DetectedTrack(aPf,dl);
          end;
        end
        else
        begin
          pf := nil;
          { track update berdasar jarak controlled platform band dan NCS band }
          if TT3ReplayClient(ManagerClient).HookedPlatform.ClassType = TT3PlatformInstance then
            pf := TT3PlatformInstance(TT3ReplayClient(ManagerClient).HookedPlatform);

          if not Assigned(pf) then
            Exit;

          range := CalcRange(pf.PosX,pf.PosY,PUNCS.PosX, PUNCS.PosY);

          case dl.BandType of
            // HF
            1 :
            begin
              if range > TT3ReplayClient(ManagerClient).GameDefaults.FData.Max_HF_Detect_Range then
                outRange := True;
            end;
            // UHF
            2 :
            begin
              if range > TT3ReplayClient(ManagerClient).GameDefaults.FData.Max_UHF_Detect_Range then
                outRange := True;
            end
          end;

          if outRange or (itemPU.PUStatus = pusOff) then
            TT3ReplayClient(ManagerClient).RemoveDetectedTrackByDataLink(dl)
          else
          begin
            { shortening cycle process }
            TT3ReplayClient(ManagerClient).findDetectedTracksByDatalink(arrTracks);

            { sync between NCS entities with detected tracks }
            for I := 0 to dl.getNCSEntitiesCount - 1 do
            begin
              itemNCS := dl.getNCSEntity(i);

              if not Assigned(itemNCS) then
                Continue;

              if itemNCS.NEIOwnerID = pf.InstanceIndex then
                Continue;

              found := false;
              for j := 0 to Length(arrTracks) - 1 do
              begin
                if arrTracks[j] = itemNCS.NEITrackID then
                begin
                  { already exist on detected track by datalink, set to 0 }
                  arrTracks[j] := 0;
                  found := true;
                  break;
                end;
              end;

              if FMyCubGroup.IsGroupMember(itemNCS.NEITrackID) then
                found := true;

              { if not exist on detected track by datalink, then add track }
              if not found then
                TT3ReplayClient(ManagerClient).AddDetectedTrackByDataLink(itemNCS.NEITrackID,dl);
            end;

            for I := 0 to Length(arrTracks) - 1 do
            begin
              if arrTracks[i] = 0  then
                Continue;

              aPf := TT3ReplayClient(ManagerClient).FindT3PlatformByID(arrTracks[i]);
              if Assigned(aPf) then
                TT3ReplayClient(ManagerClient).Remove_DetectedTrack(aPf,dl);
            end;
          end;
        end;
      end;
    end;
  end;end;

procedure TT3ReplayEventManager.OnDataLinkUpdated(Sender: TObject);
begin
  inherited;

end;

procedure TT3ReplayEventManager.OnDepthChecker(Sender: TObject);
var
  rec : TRec_MapData;
  isNeedCheck : boolean;
begin
  if Sender is TT3PlatformInstance then
  begin
    // klasifikasi lagi aj biar g semuanya minta pengecekan.
    isNeedCheck := (Sender is TT3Vehicle) or (Sender is TT3Torpedo);

    //cek apakah sender = Air => sementara tidak di proses
    if Sender is TT3Vehicle then begin
      if (TT3Vehicle(Sender).VehicleDefinition.FData.Platform_Domain = vhdAir) then
        isNeedCheck := False;
    end;

    if isNeedCheck then begin
      rec.SessionID  := TT3ReplayClient(ManagerClient).SessionID;
      rec.PlatformID := TT3PlatformInstance(Sender).InstanceIndex;
      rec.OrderID    := CORD_MAPS_DEPTH;
      rec.X          := TT3PlatformInstance(Sender).PosX;
      rec.Y          := TT3PlatformInstance(Sender).PosY;

      TT3ReplayClient(ManagerClient).NetSendMapStub(rec);
    end;
  end;
end;

procedure TT3ReplayEventManager.OnDynamicTrackUpdate(iNameTrack,
  iNameOver: string; iIDTrack, idx, ibrg, irot, iNotrack, iNRPGroupID: integer;
  irng: Double; ireltrue: Byte);
begin
end;

procedure TT3ReplayEventManager.OnECMDestroy(Sender: TObject);
begin
  inherited;

  if (Sender is TT3Chaff) or (Sender is TT3AirBubble)
      or (Sender is TT3Sonobuoy) then
  begin
    TT3ReplayClient(ManagerClient).RemoveDetectedTrack(TSimObject(Sender));
  end;

end;

procedure TT3ReplayEventManager.OnECMLaunched(Sender: TObject);
begin
  inherited;

  if (Sender is TT3Chaff) then
  begin
    TT3ReplayClient(ManagerClient).SimPlatforms.addObject(TSimObject(Sender));

    TT3ReplayClient(ManagerClient).Display.addStatus(TT3Chaff(Sender).InstanceName + ' launched');
  end;

  if (Sender is TT3AirBubble) then
  begin
    TT3ReplayClient(ManagerClient).SimPlatforms.addObject(TSimObject(Sender));

    TT3ReplayClient(ManagerClient).Display.addStatus(TT3AirBubble(Sender).InstanceName + ' launched');
  end;

  if (Sender is TT3Sonobuoy) then
  begin
    TT3ReplayClient(ManagerClient).SimPlatforms.addObject(TSimObject(Sender));

    TT3ReplayClient(ManagerClient).Display.addStatus(TT3Sonobuoy(Sender).InstanceName + ' launched');
  end;
end;

procedure TT3ReplayEventManager.OnIFFInterrogatorStatus(Sender: TObject;
  Mode: TSensorOperationalStatus);
begin
  inherited;

end;

procedure TT3ReplayEventManager.OnIFFSensorDetect(aShip, aSensor,
  aTarget: TObject; value, value2: boolean; mode1, mode2, mode3,
  mode3C: string);
var
  i : Integer;
  SimTrack : TT3DetectedTrack;
  detTrack : TT3PlatformInstance;
begin
  inherited;

  //menggambar topi di object target
  if aTarget is TT3PlatformInstance then
  begin
    detTrack := TT3PlatformInstance(aTarget);

    for i := 0 to TT3ReplayClient(ManagerClient).SimDetectedTrackList.itemCount - 1 do
    begin
      SimTrack := TT3DetectedTrack(TT3ReplayClient(ManagerClient).SimDetectedTrackList.getObject(i));

      if detTrack = SimTrack.TrackObject then
      begin
        SimTrack.isShowIFF := value;
        SimTrack.isMode4IFF := value2;
        SimTrack.TransMode1Detected := mode1;
        SimTrack.TransMode2Detected := mode2;
        SimTrack.TransMode3Detected := mode3;
        SimTrack.TransMode3CDetected := mode3C;
      end;
    end;
  end;
end;

procedure TT3ReplayEventManager.onIFFTransponderStatus(Sender: TObject;
  Mode: TSensorOperationalStatus);
begin
  inherited;

end;

procedure TT3ReplayEventManager.OnLaunchMisile(aParentID, aMissileID, aTargetID,
  aSalvo: Integer);
begin
  inherited;

end;

//procedure TT3ReplayEventManager.OnLogisticRoute(iName: string; id, iPersonel,
//  iColor: Integer; iSpeed, iPAwalX, iPAwalY, iPAkhirX, iPAkhirY: Double);
//var
//  i : Integer;
//  LogisticRoute : TLogisticRoute;
//  LogisticTemplate : TMainLogisticTemplate;
//begin
//  inherited;
//
//  for I := 0 to TT3ReplayClient(ManagerClient).DrawLogisticTemplate.FList.Count - 1 do
//  begin
//    LogisticTemplate := TT3ReplayClient(ManagerClient).DrawLogisticTemplate.FList.Items[i];
//
//    if LogisticTemplate.Name = iName then
//    begin
//      LogisticRoute := TLogisticRoute.Create(TT3ReplayClient(ManagerClient).Converter);
//
//      LogisticRoute.Personel := iPersonel;
//      LogisticRoute.Color := iColor;
//      LogisticRoute.Speed := iSpeed;
//      LogisticRoute.PosAwal.X := iPAwalX;
//      LogisticRoute.PosAwal.Y := iPAwalY;
//      LogisticRoute.PosAkhir.X := iPAkhirX;
//      LogisticRoute.PosAkhir.Y := iPAkhirY;
//      LogisticRoute.isEdit := False;
//      LogisticRoute.isSelected := False;
//
//      LogisticTemplate.AddRoute(LogisticRoute)
//    end;
//  end;
//end;

//procedure TT3ReplayEventManager.OnLogisticTemplate(iName, iOldName: string;
//  iIdAction, iColor: Integer; iShow: Boolean);
//var
//  i : Integer;
//  LogisticTemplate : TMainLogisticTemplate;
//begin
//  inherited;
//
//  case iIdAction of
//    1: {Add}
//    begin
//      LogisticTemplate := TMainLogisticTemplate.Create(TT3ReplayClient(ManagerClient).Converter);
//
//      LogisticTemplate.Name := iName;
//      LogisticTemplate.Color := iColor;
//      LogisticTemplate.isShow := iShow;
//      TT3ReplayClient(ManagerClient).DrawLogisticTemplate.AddLogisticTemplate(LogisticTemplate);
//    end;
//    2:{edit}
//    begin
//      for I := 0 to TT3ReplayClient(ManagerClient).DrawLogisticTemplate.FList.Count - 1 do
//      begin
//        LogisticTemplate := TT3ReplayClient(ManagerClient).DrawLogisticTemplate.FList.Items[i];
//
//        if LogisticTemplate.Name = iOldName then
//        begin
//          LogisticTemplate.Name := iName;
//          LogisticTemplate.Color := iColor;
//          LogisticTemplate.isShow := iShow;
//          LogisticTemplate.FList.Clear;
//          Break;
//        end;
//      end;
//    end;
//    3:{delete}
//    begin
//      for I := 0 to TT3ReplayClient(ManagerClient).DrawLogisticTemplate.FList.Count - 1 do
//      begin
//        LogisticTemplate := TT3ReplayClient(ManagerClient).DrawLogisticTemplate.FList.Items[i];
//
//        if LogisticTemplate.Name = iName then
//        begin
//          TT3ReplayClient(ManagerClient).DrawLogisticTemplate.FList.Delete(i);
//          Break;
//        end;
//      end;
//    end;
//  end;
//end;

procedure TT3ReplayEventManager.OnMapNeedUpdate(Sender: TObject);
begin
  inherited;
  TT3ReplayClient(ManagerClient).Display.Map.Repaint;

end;

procedure TT3ReplayEventManager.OnOverlayTemplate(r: TRecCmd_OverlayTemplate);
begin

end;

procedure TT3ReplayEventManager.OnPlatformAssigned(Sender: TObject);
begin
  inherited;

  if not Assigned(Sender) then
    Exit;

  if Sender is TT3PlatformInstance then
  begin
    if (TT3PlatformInstance(Sender).IsAssigned) then
      TT3ReplayClient(ManagerClient).Display.StatusBar1.Panels[7].Bevel := pbRaised
    else
      TT3ReplayClient(ManagerClient).Display.StatusBar1.Panels[7].Bevel := pbNone;
  end;

end;

procedure TT3ReplayEventManager.OnPlatformDestroy(Sender: TObject);
var
  tesObj : TT3PlatformInstance;
  newPi, pf, ftrack, newPlatform : TT3PlatformInstance;
  i : Integer;
begin
  inherited;
  pf := nil;

  // from client event
  if Sender is TT3DetectedTrack then
  begin
    if TT3DetectedTrack(Sender).TrackObject is TT3PlatformInstance then
      pf := TT3DetectedTrack(Sender).TrackObject as TT3PlatformInstance
    else if TT3DetectedTrack(Sender).TrackObject is TT3Sensor then
      pf := TT3DetectedTrack(Sender).TrackObject.Parent as TT3PlatformInstance;
  end
  else
  begin
    pf := TT3PlatformInstance(Sender);
  end;

  if not(Assigned(pf)) then
    Exit;

  //------------- cari new platform untuk selected + controled object -----//
  newPlatform := nil;
  for i := 0 to  TT3ReplayClient(ManagerClient).SimPlatforms.itemCount - 1 do
  begin
    newPi := TT3PlatformInstance(TT3ReplayClient(ManagerClient).SimPlatforms.getObject(i));
    if not Assigned(newPi) then
      continue;

    if newPi is TT3Vehicle then      //mk
    begin
      if (newPi.UnitGroup) and not(newPi.FreeMe) then
      begin
        newPlatform := newPi;
        Break;
      end;
    end;
  end;
  //------------- cari new platform untuk selected + controled object -----//

  if TT3ReplayClient(ManagerClient).HookedPlatform is TT3DetectedTrack then
    ftrack := TT3DetectedTrack(TT3ReplayClient(ManagerClient).HookedPlatform).TrackObject
              as TT3PlatformInstance
  else
    ftrack := TT3PlatformInstance(TT3ReplayClient(ManagerClient).HookedPlatform);

  if Assigned(pf) and Assigned(ftrack) and (pf = ftrack) then
  begin
    if ftrack.Selected then
    begin
      ftrack.Selected := False;
    end;

    TT3ReplayClient(ManagerClient).HookedPlatform := nil;

    if newPlatform <> nil then
    begin
      newPlatform.Selected := True;
      TT3ReplayClient(ManagerClient).HookedPlatform := newPlatform;
    end;
  end;

  TT3ReplayClient(ManagerClient).RemoveDetectedTrack(TSimObject(Sender));

  if (Sender is TT3PlatformInstance) and
    (TT3PlatformInstance(Sender).FlagShowStatusDestroy) then
  begin

    if TT3ReplayClient(ManagerClient).CurrentPerspective = 0 then
      TT3ReplayClient(ManagerClient).Display.addStatus(TT3PlatformInstance(Sender).TrackLabel + ' DESTROYED')
    else
      TT3ReplayClient(ManagerClient).Display.addStatus(IntToStr(TT3PlatformInstance(Sender).TrackNumber) + ' DESTROYED');
  end;

  TT3ReplayClient(ManagerClient).RemovePlatformFromGroup(TT3Vehicle(pf));

  // from server event mngr
  RemoveFromTargetedRefTrack(Sender);
  for i := 0 to TT3ReplayClient(ManagerClient).SimPlatforms.itemCount - 1 do
  begin
    tesObj := TT3ReplayClient(ManagerClient).SimPlatforms.getObject(i) as TT3PlatformInstance;

    if TT3Vehicle(tesObj).CircleTrack = TT3PlatformInstance(Sender) then
      TT3Vehicle(tesObj).CircleTrack := nil
    else
    if TT3Vehicle(tesObj).EngageVehicle = TT3PlatformInstance(Sender) then
      TT3Vehicle(tesObj).EngageVehicle := nil;

  end;
end;

procedure TT3ReplayEventManager.OnPlatformFreeMe(Sender: TObject;
  Value: boolean);
begin
  inherited;
end;

procedure TT3ReplayEventManager.OnPlatformHancurin(SenderID: Integer;
  Target: string;reasondestroy : Byte);
var
  Sender : TT3PlatformInstance;
  i : Integer;
  dev: TSimObject;
  objPlatform : TSimObject;
begin
  inherited;
  Sender := TT3ReplayClient(ManagerClient).FindT3PlatformByID(SenderID);

  if Assigned(Sender) then
  begin
    for i := 0 to TT3ReplayClient(ManagerClient).SimDevices.itemCount - 1 do     //mk
    begin
      dev := TT3ReplayClient(ManagerClient).SimDevices.getObject(i);
      if (dev is TT3Radar)then
      begin
        if (TT3Radar(dev).RadarDefinition.FDef.Num_FCR_Channels > 0) then
        begin
          objPlatform := TT3ReplayClient(ManagerClient).FindT3PlatformByID(SenderID);
          objPlatform.IsAssigned := false;

          if TT3Radar(dev).AssignedTrack <> nil then
          begin
            if TT3Radar(dev).AssignedTrack.Count > 0 then
            begin
              TT3Radar(dev).AssignedTrack.Remove(Sender);
              TT3Radar(dev).OnFireControlUpdated(TT3Radar(dev));
            end;
          end;
        end;
      end;
    end;
  end;

  if Assigned(Sender) and TT3PlatformInstance(Sender).FlagShowStatusDestroy then
  begin
    Sender.FlagShowStatusDestroy := False;

    if Target <> '' then
    begin
      Sender.reasonDestroy := 21;
    end
    else
    begin
      case reasonDestroy of
        1: Sender.reasonDestroy := 1;
        2: Sender.reasonDestroy := 2;
        3: Sender.reasonDestroy := 3;
        4: Sender.reasonDestroy := 4;
        5: Sender.reasonDestroy := 5;
        6: Sender.reasonDestroy := 6;
        21: Sender.reasonDestroy := 21;
        22: Sender.reasonDestroy := 22;
        23: Sender.reasonDestroy := 23;
      else
        Sender.reasonDestroy := 0;
      end;
    end;
  end;

  if Assigned(Sender) then     //30052012
  begin
    if Sender is TT3Vehicle then
    begin
      TT3ReplayClient(ManagerClient).RemoveESMTracks(Sender);
      Sender.FreeMe := True;
    end
    else if Sender is TT3NonRealVehicle then
      Sender.FreeMe := True
    else
    begin
      Sender.FreeMe := True;
      Sender.AbsoluteFree := True;
    end;
  end;
end;

procedure TT3ReplayEventManager.OnPlatformPositonChange(Sender: TObject);
begin
  inherited;
//  if Sender = TT3ReplayClient(ManagerClient).HookedPlatform then
//    TT3ReplayClient(ManagerClient).Display.UpdateRangeRingsPos(Sender);
end;

//procedure TT3ReplayEventManager.OnPlotting(rec : TRecCmd_Plotting);
//var
//  i : Integer;
//  PlottingTemplate : TMainPlottingTemplate;
//begin
//  inherited;
//  case rec.IdAction of
//    1 : {Add}
//    begin
////      if Copy(rec.Group, 1, 8) <> Copy(TT3ReplayClient(ManagerClient).ConsoleName, 1, 8)then {plotting yg dibuat hanya utk 1 meja}
////        Exit;
//
////      PlottingTemplate := TMainPlottingTemplate.Create(TT3ReplayClient(ManagerClient).Converter);
////
////      PlottingTemplate.Name := rec.TemplateName;
////      PlottingTemplate.Group := rec.Group;
////      PlottingTemplate.Tipe := rec.Tipe;
////      PlottingTemplate.isShow := True;
////      PlottingTemplate.isSend := rec.isSend;
////      PlottingTemplate.isShow := rec.isShow;
//
////      simMgrClient.DrawStrategiTemplate.AddPlotting(PlottingTemplate);
//    end;
//    2 : {Edit}
//    begin
//
//    end;
//    3 : {Delete}
//    begin
//      for i := 0 to TT3ReplayClient(ManagerClient).DrawStrategiTemplate.FList.Count - 1 do
//      begin
//        PlottingTemplate := TT3ReplayClient(ManagerClient).DrawStrategiTemplate.FList.Items[i];
//
//        if (PlottingTemplate.Name = rec.TemplateName) and (PlottingTemplate.Tipe = rec.Tipe) and
//           (PlottingTemplate.Group = rec.Group) then
//        begin
//          TT3ReplayClient(ManagerClient).DrawStrategiTemplate.FList.Delete(i);
//          //fmOverlayEditor.RefreshLTemplate;
//          Break;
//        end;
//      end;
//    end;
//    4 : {Send}
//    begin
////      if rec.Group <> simMgrClient.ConsoleName then
////        Exit;
////
//      for i := 0 to TT3ReplayClient(ManagerClient).DrawStrategiTemplate.FList.Count - 1 do
//      begin
//        PlottingTemplate := TT3ReplayClient(ManagerClient).DrawStrategiTemplate.FList.Items[i];
//
//        if (PlottingTemplate.Name = rec.TemplateName) and (PlottingTemplate.Tipe = rec.Tipe) and
//           (PlottingTemplate.Group = rec.Group) then
//        begin
//          TT3ReplayClient(ManagerClient).DrawStrategiTemplate.FList.Delete(i);
//          Break;
//        end;
//      end;
//
//      PlottingTemplate := TMainPlottingTemplate.Create(TT3ReplayClient(ManagerClient).Converter);
//
//      PlottingTemplate.Name := rec.TemplateName;
//      PlottingTemplate.Group := rec.Group;
//      PlottingTemplate.Tipe := rec.Tipe;
//      PlottingTemplate.isShow := True;
//      PlottingTemplate.isShow := rec.isShow;
//
////      simMgrClient.DrawStrategiTemplate.AddPlotting(PlottingTemplate);
//    end;
//  end;
//end;

procedure TT3ReplayEventManager.OnRadarControlMode(Sender: TObject;
  Mode: TRadarControlMode);
begin
  inherited;
  TT3Radar(Sender).UpdateAssignedtrack;
end;

procedure TT3ReplayEventManager.OnReceiveMessageHandling(Cmd: TRecSendMessage);
begin
  inherited;

end;

procedure TT3ReplayEventManager.OnSensorDetect(Sender, detected: TObject;
  Value: boolean; aIFF : Boolean );
var
  isNew, foundESM : boolean;
  dev : TT3DeviceUnit;
  i, j : Integer;
  dt : TT3DetectedTrack;
  ESM : TObject;
begin
  inherited;

  dev := nil;

  if TT3ReplayClient(ManagerClient).CurrentPerspective = 0 then
    exit;

  // klo object udah diskejul mau di bunuh, g perlu diterusin
  if TSimObject(detected).FreeMe then
    exit;

  // klo object yg dormant jg g perlu diterusin
  if detected is TT3PlatformInstance then
    if TT3PlatformInstance(detected).Dormant then
      exit;

  if detected is TT3Weapon then
  begin
    if detected is TT3Missile then
      if not TT3Missile(detected).Launching then
        exit;

    if not TT3Weapon(detected).Launched then
      exit;
  end;

  //membuat update yang berlebihan sehinngga controler hang
  //  if detected is TT3Vehicle then
  //    frmTacticalDisplay.fmWeapon1.onDetectAirPlatform(TT3PlatformInstance(detected));

  if Sender is TT3DeviceUnit then
  begin
    dev := Sender as TT3DeviceUnit;
  end;

  if Value then
  begin
    foundESM := False;

    if Sender is TT3ESMSensor then  {supaya esm satu garis saja}
    begin
      for i := 0 to TT3ReplayClient(ManagerClient).SimDetectedTrackList.itemCount - 1 do
      begin
        dt := TT3DetectedTrack(TT3ReplayClient(ManagerClient).SimDetectedTrackList.getObject(i));

        if dt.ESMTracks.Count > 0 then
        begin
          for j := 0 to dt.ESMTracks.Count - 1 do
          begin
            ESM := dt.ESMTracks.Items[j];

            if ESM is TT3ESMTrack then
            begin
              if (TT3ESMSensor(TT3ESMTrack(ESM).DetectBy).InstanceIndex
                  = TT3ESMSensor(sender).InstanceIndex) then
              begin
                if TT3ESMTrack(ESM).TrackObject.Parent = TSimObject(detected).Parent then
                begin
                  foundESM := True;
                  Break;
                end;
              end;
            end;
          end;
        end;
      end;
    end;

    if not(foundESM) then
    begin
      isNew := TT3ReplayClient(ManagerClient).AddDetectedTrack(TSimObject(detected),
               TSimObject(Sender), aIFF);

      if isNew then
      begin
        if detected is TT3PlatformInstance then     //----add pak andik 12042012
        begin
          if Assigned(dev) then
            OnLogEventStr('TT3ReplayEventManager.OnSensorDetect',dev.InstanceName + ' detect ' +
              TT3PlatformInstance(dev.Parent).InstanceName);
        end;
      end
      else
      begin
        //------add pak andik 12042012
      end;
    end;
  end
  else
  if TT3ReplayClient(ManagerClient).Remove_DetectedTrack(TSimObject(detected),TSimObject(Sender)) then
  begin
  end; //--------------------------
end;

procedure TT3ReplayEventManager.OnSensorOperationalStatus(Sender: TObject;
  Mode: TSensorOperationalStatus);
begin
  inherited;

  if TT3ReplayClient(ManagerClient).IsController then exit;

  if Sender is TT3Sensor then begin
    if (Mode = sopOff) or (Mode = sopDamage) or
       (Mode = sopTooDeep) then
    begin
      TT3ReplayClient(ManagerClient).RemoveDetectedTracks(TSimObject(Sender));
    end;
  end;

end;

procedure TT3ReplayEventManager.OnSensorRemoved(Sender: TObject);
begin
  inherited;
  if TT3ReplayClient(ManagerClient).IsController then exit;

  TT3ReplayClient(ManagerClient).RemoveDetectedTracks(TSimObject(Sender));
end;

procedure TT3ReplayEventManager.OnSonarControlMode(Sender: TObject;
  Mode: TSonarControlMode);
begin
  inherited;

end;

procedure TT3ReplayEventManager.OnWeaponDestroy(Sender: TObject);
var
  pi : TT3PlatformInstance;
  i, j : Integer;

  ListMissile : TMissileHaveLaunch;
begin
  inherited;

  //Set Surface to Surface
  if Sender is TT3Missile then
  begin
    for i := 0 to TT3ReplayClient(ManagerClient).SimPlatforms.itemCount - 1 do
    begin
      pi := TT3ReplayClient(ManagerClient).SimPlatforms.getObject(i) as TT3PlatformInstance;

      if pi is TT3Vehicle then
      begin
        if TT3Vehicle(pi).InstanceIndex = TT3Missile(Sender).ShipIndex then
        begin
          for j := 0 to TT3Vehicle(pi).MissileLaunch.Count - 1 do
          begin
            ListMissile := TMissileHaveLaunch(TT3Vehicle(pi).MissileLaunch[j]);
            if ListMissile.MissileLaunch = TT3Missile(sender) then
            begin
              ListMissile.isLaunch := False;
              TT3Vehicle(pi).MissileLaunch.Delete(j);

              Break;
            end;
          end;
        end;
      end;

    end;
  end;

  if (Sender is TT3Missile) then TT3ReplayClient(ManagerClient).Display.addStatus('Missile destroyed');
  if (Sender is TT3Torpedo) then TT3ReplayClient(ManagerClient).Display.addStatus('Torpedo destroyed');
  if (Sender is TT3GunShoot) then TT3ReplayClient(ManagerClient).Display.addStatus('Gun destroyed');
  if (Sender is TT3GunOnVehicle) then TT3ReplayClient(ManagerClient).Display.addStatus('Gun on vehicle destroyed');

  if TT3ReplayClient(ManagerClient).HookedPlatform = Sender then
    TT3ReplayClient(ManagerClient).HookedPlatform := nil;
end;

procedure TT3ReplayEventManager.OnWeaponHit(Sender, Target: TObject;
  Lethality: integer; FreeWeapon: Boolean);
begin
  inherited;

  if (TT3ReplayClient(ManagerClient).HookedPlatform = Sender) or
     (TT3ReplayClient(ManagerClient).HookedPlatform = Target) then
    TT3ReplayClient(ManagerClient).HookedPlatform := nil;

  if (Sender is TT3PlatformInstance) and (Target is TT3PlatformInstance) then
  begin
    // Prince Achmad Tambahan Bro
    TT3PlatformInstance(sender).FreeChilds;
    TT3PlatformInstance(sender).FreeMe := True;
    TT3PlatformInstance(sender).AbsoluteFree := True;
  end;

  // ini dari onweaponhitbyserver --> client event manager
  if Assigned(Sender) then
    TT3PlatformInstance(Sender).reasonDestroy := 22;

  if Sender is TT3Torpedo then
  begin
    TT3Torpedo(Sender).FreeChilds;
    TT3Torpedo(Sender).FreeMe := True;
    TT3Torpedo(Sender).AbsoluteFree := true;
  end
  else if Sender is TT3Missile then
  begin
    TT3Missile(Sender).FreeChilds;
    TT3Missile(Sender).FreeMe := True;
    TT3Missile(Sender).AbsoluteFree := true;
  end
  else if Sender is TT3GunShoot then
  begin
    TT3GunShoot(Sender).FreeChilds;
    TT3GunShoot(Sender).FreeMe := True;
    TT3GunShoot(Sender).AbsoluteFree := True;

    if Target is TT3Missile then
    begin
      TT3Missile(Target).FreeChilds;
      TT3Missile(Target).FreeMe := True;
      TT3Missile(Target).AbsoluteFree := True;
    end;
  end
  else if Sender is TT3GunOnVehicle then
  begin
    if Target is TT3Missile then
    begin
      TT3PlatformInstance(Target).reasonDestroy := 21;
      TT3PlatformInstance(Target).UnitMakeDestroy := TT3PlatformInstance(Sender).InstanceName;

      TT3Missile(Target).FreeChilds;
      TT3Missile(Target).FreeMe := True;
      TT3Missile(Target).AbsoluteFree := True;
    end;
  end;
  //====

end;

procedure TT3ReplayEventManager.OnWeaponHitByServer(SenderID, TargetID,
  Lethality: integer; ParentName : string);
var
  Sender : TT3PlatformInstance;
begin
  inherited;

  Sender := TT3ReplayClient(ManagerClient).FindWeaponByID(SenderID);
  if not Assigned(Sender) then
    Sender := TT3ReplayClient(ManagerClient).FindT3PlatformByID(SenderID);

  if not Assigned(Sender) then
    Sender := TT3PlatformInstance(TT3ReplayClient(ManagerClient).FindDeviceByID(SenderID));

  if Assigned(Sender) then
    Sender.reasonDestroy := 22;

end;

procedure TT3ReplayEventManager.OnWeaponInOut(SenderID: integer;
  reasondestroy: Byte);
var
  Sender : TT3PlatformInstance;
begin
  inherited;

  Sender := TT3ReplayClient(ManagerClient).FindWeaponByID(SenderID);

  if not Assigned(Sender) then
    Sender := TT3ReplayClient(ManagerClient).FindT3PlatformByID(SenderID);

  if Assigned(Sender) then
    Sender.reasonDestroy := reasondestroy;

  if Sender is TT3Torpedo then
  begin
    TT3Torpedo(Sender).FreeChilds;
    Sender.FreeMe := True;
  end
  else if Sender is TT3Missile then
  begin
    TT3Missile(Sender).FreeChilds;
    TT3Missile(Sender).FreeMe := True;
  end
  else if Sender is TT3Bomb then
  begin
    TT3Bomb(Sender).FreeChilds;
    Sender.FreeMe := True;
    TT3Bomb(Sender).AbsoluteFree := True;
  end
end;

procedure TT3ReplayEventManager.OnWeaponLaunched(Sender, Target: TObject);
var
  wpn: TT3Weapon;
begin
  inherited;
  if not Assigned(Sender) then
    Exit;

  if Sender is TT3Weapon then
  begin
    wpn := TT3Weapon(Sender);

    if wpn is TT3Missile then
    begin
      TT3ReplayClient(ManagerClient).SimPlatforms.addObject(TSimObject(Sender));
      wpn.Enable := true;

      if Assigned(Target) then
      begin
        if (Sender  is TT3Missile_SS) or (Sender is TT3Missile_SA) then

        TT3ReplayClient(ManagerClient).Display.addStatus('Missile is launched');
      end;

      //nando : for draw RBL n RBLW
      TT3Missile(Sender).SameGroupPlatform := nil;
      if Assigned(TT3Missile(Sender).Owner) then
        TT3Missile(Sender).SameGroupPlatform := TT3ReplayClient(ManagerClient).Scenario.CubiclesGroupsListFromDB.GetGroupOf_PlatformIndex
                (TT3PlatformInstance(TT3Missile(Sender).Owner).InstanceIndex) as T3CubicleGroup;

      TT3Missile(Sender).DetectPlatform    := TT3ReplayClient(ManagerClient).SimDetectedTrackList;
      TT3Missile(Sender).isInstructor      := TT3ReplayClient(ManagerClient).IsController;
      TT3Missile(Sender).TrackNumber := TT3ReplayClient(ManagerClient).GetTrackNumberForWeapon;

      TT3ReplayClient(ManagerClient).Display.OnWeaponLaunched(Sender, Target);
    end
    else if Sender is TT3Torpedo then
    begin
      TT3ReplayClient(ManagerClient).SimPlatforms.addObject(TSimObject(Sender));
      wpn.Enable := true;

      if Assigned(Target) then
      begin
        TT3ReplayClient(ManagerClient).Display.addStatus('Torpedo is launched');
      end;

      //mk 12
      TT3Torpedo(Sender).isInstructor := TT3ReplayClient(ManagerClient).IsController;
      TT3Torpedo(Sender).TrackNumber := TT3ReplayClient(ManagerClient).GetTrackNumberForWeapon;

      TT3ReplayClient(ManagerClient).Display.OnWeaponLaunched(Sender, Target);
    end
    else if Sender is TT3Bomb then
    begin
      TT3ReplayClient(ManagerClient).SimPlatforms.addObject(TSimObject(Sender));
      wpn.Enable := true;

      if Assigned(Target) then
      begin
        TT3ReplayClient(ManagerClient).Display.OnWeaponLaunched(Sender, Target);

        if (TT3ReplayClient(ManagerClient).CurrentPerspective = 0) or
           (TT3ReplayClient(ManagerClient).CurrentPerspective = TT3Bomb(sender).NoCubicle)then
          TT3ReplayClient(ManagerClient).Display.addStatus('Bomb is launched');
      end;
    end
    else if Sender is TT3GunShoot then
    begin
      TT3ReplayClient(ManagerClient).SimWeapons.addObject(TSimObject(Sender));
      TT3ReplayClient(ManagerClient).Display.addStatus('Gun is launched');
    end;
  end;

end;

procedure TT3ReplayEventManager.OnWeaponPropertyChange(Sender: TObject);
begin
  inherited;

end;

procedure TT3ReplayEventManager.OnWeaponTarget(Sender, Target: TObject);
begin
  inherited;

end;

procedure TT3ReplayEventManager.SetManager(manager: TObject);
begin
  ManagerClient := TT3ReplayClient(manager);
end;

procedure TT3ReplayEventManager.SetManagerClient(const Value: TObject);
begin
  FManagerClient := Value;
end;

end.
