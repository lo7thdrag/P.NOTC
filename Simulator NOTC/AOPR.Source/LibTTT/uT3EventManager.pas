unit uT3EventManager;

interface

uses tttData, Classes, uT3Torpedo, uT3Missile, uT3Unit, uSimObjects, uT3Weapon,
    uT3Vehicle, SYsUtils, uGameData_TTT, uT3Listener, uT3CounterMeasure, Windows,
    uT3Sonobuoy, uT3OtherSensor, uDBAsset_GameEnvironment, uT3RadarNoiseJammer,
    uDBFormation, uDBAsset_Vehicle, uDataTypes, uEventSummary, uT3GroupVehicle;

type
//  TLogStrProc = procedure(const strHeader, strBody: string) of object;

  TT3EventManager = class
  private
    FOnLogEventStr: TLogStrProc;
    procedure SetOnLogEventStr(const Value: TLogStrProc);
//    procedure OnLogisticTemplate(iName, iOldName: string; iIdAction,
//      iColor: Integer; iShow: Boolean);
  public
    procedure OnCollision(Sender, Target : TObject; Value : Boolean); virtual;
    procedure OnFuelEmpty(Sender : TObject; OrderType: Byte; Value : Double); virtual;
    procedure OnChangeHeading(Sender : TObject; OrderType: Byte; Value : Double); virtual;
    procedure OnChangePosition(Sender : TObject; IdAction: Byte; x, y: Double); virtual;
    procedure OnIsCollision(Sender : TObject); virtual;
    procedure RemoveFromTargetedRefTrack(Sender : TObject);virtual;
    procedure OnPlatformDestroy(Sender : TObject);                virtual;
    procedure OnPlatformHancur(Sender : TObject; Target: string; reasondestroy : Byte); virtual;
    procedure OnPlatformSelected(Sender : TObject);               virtual;
    procedure OnPlatformControlled(Sender : TObject);             virtual;
    procedure OnPlatformOrderedControl(Sender : TObject;
                                       Order : TPlatformOrderedControl;
                                       Value : double); virtual;
    procedure OnPlatformOrderedControlChange(OrderID : Integer; OrderType : Integer;
                                             PlatfomID : Integer; OrderParam : Single); virtual;
    procedure OnPlatformFreeMe(Sender : TObject;Value : boolean);virtual;
    procedure OnPlatformAssigned(Sender : TObject); virtual;
    procedure onEngageTrack(Track : String); virtual;
    procedure UpdateEmconCheckBox(pflist : TT3PlatformInstance; StateBtn : Boolean);virtual;
    procedure OnPlatformPropertyChange(Sender : TObject); virtual;
    procedure OnVehicleSensorStateChange(Sender : TT3Vehicle); virtual;
    procedure OnSyncTarget(aWeapon, aTarget : TObject);                virtual;

    //andik
    procedure OnLastUpdateTimePlatform(str : string); virtual;

    //farid
    procedure OnGuidance_Engage(aShipID, aParentID : TT3PlatformInstance;
                                MissileID : Integer; IsHaveLaunch : Byte);virtual;
    //vehicle
    procedure OnUpdateWeaponVehicle(Sender : TObject); virtual;

    //farah-envi
    procedure OnUpdateEnvi(index : integer; Value:Double;
      GameEnvironment : TGame_Environment_Definition);virtual;
    procedure OnCheckDateTime(sender : TObject); virtual;
    //farah-overlay
    procedure OnTerminateOverlay; virtual;

    //multiselect
    procedure OnUpdateGroupControl(grp : T3GroupVehicle; Action : Byte); virtual;

    //sensor event
    procedure OnSensorDetect(Sender : TObject; detected : TObject; Value : boolean; aIFF : Boolean );  virtual;
    procedure OnSensorRemoved(Sender : TObject);                                      virtual;
    procedure OnSensorOperationalStatus(Sender : TObject;Mode : TSensorOperationalStatus);  virtual;
    procedure OnRadarControlMode(Sender : TObject;Mode : TRadarControlMode);                virtual;
    procedure OnSonarControlMode(Sender : TObject;Mode : TSonarControlMode);                virtual;
    procedure onIFFTransponderStatus(Sender : TObject;Mode : TSensorOperationalStatus);   virtual;
    procedure OnIFFInterrogatorStatus(Sender : TObject;Mode : TSensorOperationalStatus);  virtual;
    procedure OnSonobuoyPassiveDetect(Sender, detected: TObject; aValue : Byte);   virtual;

    //weapon evet
    procedure OnWeaponLaunched(Sender : TObject; Target : TObject);                     virtual;
    procedure OnWeaponHit(Sender : TObject; Target : TObject; Lethality : integer; FreeWeapon: Boolean);     virtual;
    procedure OnWeaponHitTo3D(Sender : TObject; Target : TObject; Heading : Double);     virtual;
    procedure OnWeaponOut(Sender : TObject; reasondestroy : Byte);                      virtual; // Prince
    procedure OnWeaponDestroy(Sender : TObject);                                        virtual;
    procedure OnWeaponTarget(Sender : TObject; Target : TObject);                       virtual;
    procedure OnWeaponPropertyChange(Sender : TObject);                                 virtual;
    procedure OnWeaponHybrid(sender : TObject); virtual;
    procedure OnPropertyIntChange(Sender : TObject;Props : TPropsID; Value : Integer); virtual;

    //gun event
    procedure OnGunFire(Sender : TObject);            virtual;
    procedure OnGunUpdateQuantity(Sender : TObject);  virtual;
    procedure OnGunSetButtonCase(Sender : TObject);   virtual;
    procedure OnPlatformDamageChanged(sender: TObject;
        const dmgType: TDamageItemType); virtual;

    //ecm event
    procedure OnECMLaunched(Sender : TObject);        virtual;
	  procedure OnECMDestroy(Sender : TObject);         virtual;
    procedure OnECMQuantityChange(Sender : TObject);  virtual;
    procedure OnECMlistUpdated(Sender : TObject);     virtual;
    procedure OnECMJammingSuccess(Sender : TObject; jammedObject :
      TJammedObjectParameter); virtual;
    procedure OnECMJammingFailed(Sender : TObject; reason : String); virtual;
    procedure OnRadarNoiseJammingSuccess(Sender : TObject;
      JammedOject : TJammedObjectParameter;  Value : Boolean); virtual;
    //procedure OnRadarNoiseJammingFailed(Sender : TObject; JammedOject : TJammedObjectParameter); virtual;

    // event datalink
    procedure OnDataLinkUpdated(Sender : TObject); virtual;
    procedure OnDatalinkPoolRequest(Sender : TObject; PooledPlatformID : Integer); virtual;
    procedure OnDatalinkOffLine(Sender : TObject); virtual;
    procedure OnDatalinkOnline(Sender : TObject); virtual;
    procedure OnDatalinkTracksUpdate(Sender : TObject); virtual;
    procedure OnPUDatalinkEMCON(Sender : TObject; PooledPlatformID : Integer); virtual;
    procedure OnNCSDatalinkEMCON(Sender : TObject); virtual;

    //event FireControl
    procedure OnFireControlUpdated(Sneder : TObject); virtual;

    //nando waypoint launch misile
    procedure OnWaypointChange(index : integer);virtual;

    //choco
    procedure OnWaypointChangeVectac(WpnCarrierID, index : integer); virtual;
    procedure OnWaypointDataChange(rec : TrecSinc_Waypoint); virtual;
    procedure OnNextWaypointChangeTo3D(WaypointID, aShipID: Integer; aSpeed,
      aBearing, Altitude, PosX, PosY: Double); virtual;

    procedure OnFiringModeChange(mis:TObject); virtual;
    procedure OnEngagementChange(mis:TObject); virtual;

    procedure OnLaunchMisile(aParentID, aMissileID, aTargetID, aSalvo : Integer); virtual;
    procedure OnLaunchTorpedo(aParentID, aMissileID, aTargetID, aSalvo : Integer); virtual;
    procedure OnLaunchBomb(aParentID, aMissileID, aTargetID, aSalvo : Integer); virtual;
    procedure OnLaunchGun(aParentID, aMissileID, aTargetID, aSalvo : Integer); virtual;
    procedure EmptyRec(var rGun : TRecCmd_GunFire);
    procedure OnSonarEvent(aShipID, aSonarIndex, aEventMode : Integer); virtual;
    procedure OnRadarEvent(aShipID, aRadarIndex, aEventMode : Integer); virtual;
    procedure OnIffEvent(aShipID, aIffIndex, aIffType, aEventMode : Integer); virtual;
    procedure OnDeployContinousEvent(aShipID, aObjIndex : Integer;
              aObjType, aObjMode : Byte; aObjDepth, aObjSpacing : Double;
              aObjQty : Integer; aDeployUntilNextWaypoint : Boolean); virtual;
    procedure OnDeploySonobuoy(aShipID, aSonoIndex : Integer; aSonoMode : Byte;
              aDepth : Double); virtual;
    procedure OnDeployMine(aShipID, aMineIndex : Integer; aDepth : Double); virtual;
    procedure OnCountermeasureEvent(aShipID, aCMIndex,
              aEventMode : Integer); virtual;
    procedure OnDatalinkEvent(aShipID, aDatalinkIndex, aDatalinkType,
              aEventMode : Integer); virtual;

    // game setting event handle
    procedure OnPropGameSettingIntChange(Sender : TObject;Props : TPropsID; Value : Integer);        virtual;
    procedure OnPropGameSettingDoubleChange(Sender : TObject;Props : TPropsID; Value : Double);      virtual;
    procedure OnPropGameSettingBoolChange(Sender : TObject;Props : TPropsID; Value : Boolean);       virtual;
    procedure OnPropGameSettingByteChange(Sender : TObject;Props : TPropsID; Value : Byte);          virtual;

    //Non Real Time Changed
    procedure OnNonRealTimeChanged(Sender : TObject); virtual;
    procedure OnNonRealTimeAdded(Sender : TObject);   virtual;
    procedure OnMapNeedUpdate(Sender : TObject);      virtual;

    procedure OnRadarRemoveAssignedPlatform(radar : TObject); virtual;
    procedure OnAfterLanding(Sender : TObject); virtual;

	  //added by choco
    procedure OnWeaponHitByServer(SenderID, TargetID, Lethality : integer; ParentName : string) ;    virtual;
    procedure OnWeaponInOut(SenderID : Integer; reasondestroy : Byte) ;         virtual;
    procedure OnPlatformHancurin(SenderID : Integer; Target: string; reasondestroy : Byte);virtual;
    procedure OnPlatformPositonChange(Sender : TObject);                        virtual;
    procedure OnVectactChange(Sender : TObject); overload; virtual;
    procedure OnVectactChange(r : TRecVectac); overload; virtual;
    procedure AbortMissileLaunch(aParentId, aMissileId : Integer); virtual;

    //Added Nando & Andi
    procedure OnIFFSensorDetect(aShip, aSensor, aTarget : TObject ;value, value2 : boolean; mode1,mode,mode3,mode3C:string); virtual;
    procedure OnModeSearchIFF(aSensor : TObject; value : byte); virtual;
    procedure OnDeploySonar(VIndex, SensorType, SensorIndex, ControlMode, Status : integer); virtual;
    procedure OnUpdateFormSonar (VIndex, SensorType, SensorIndex, Counter, param, order : Integer); virtual;
    procedure OnUpdateActualCable(VIndex, SensorType, SensorIndex : integer; aValue : Double); virtual;

    procedure OnWaypointRemoveOwner(aShipID : Integer); virtual;
    procedure OnWaypointEnd(aShipID : Integer; aSpeed, aHeading : Double); virtual;
    procedure OnWaypointDestinationChange(aShipID : Integer; Long, Lat : Double); virtual;

    procedure OnUpdateTvCubicleGroup; virtual;
    procedure OnVehicleHealthChange(ve: TT3Vehicle); virtual;
    procedure OnVehicleSystemStateChange(ve: TT3Vehicle); virtual;
    procedure OnVehicleLogisticChange(ve: TT3Vehicle); virtual;
//    procedure OnVehicleRampChange (ve: TT3Vehicle); virtual;

    procedure OnDepthChecker(Sender : TObject);virtual;

    //decoy
    procedure OnDecoysDeployed(aParent: TObject); virtual;

    property  OnLogEventStr: TLogStrProc  read FOnLogEventStr write SetOnLogEventStr;

	  {Nando}
    procedure OnReceiveGameSpeedForRecord(Cmd : TRecCmd_GameCtrl); virtual;
    procedure OnReceiveMessageHandling(Cmd : TRecSendMessage);virtual;
    procedure OnReceiveModifComm(Cmd : TRecModifComm);virtual;

    //choco : Guidance stale time reach
    procedure OnGuidanceStaleTimeReached(aParent, aTarget : TT3PlatformInstance; aDT : Double); virtual;
    procedure OnGuidanceStandoffReached(aParent, aTarget : TT3PlatformInstance); virtual;
    procedure OnGuidanceLaunchWeapon(aParent, aTarget : TT3PlatformInstance); virtual;

    //station
//    procedure OnGuidanceStationReached(ve : TT3PlatformInstance; val : Boolean); virtual;
//    procedure OnGuidanceStationUpdateSpeed(ve : TT3PlatformInstance; aSpeed : Double); virtual;
//    procedure OnGuidanceStationUpdateHeading(ve : TT3PlatformInstance; aHeading : Double); virtual;

    procedure OnUpdateIFFList(sensor : TT3IFFSensor; value : byte);     virtual;
    procedure OnRefreshIFFForm(sensor : TT3IFFSensor);                  virtual;
    procedure OnUpdateSonarDeploy(piObj : TT3Vehicle; value : byte; cable : Double);  virtual;
    procedure OnUpdateRadarNoiseJammer(jammer : TObject; value : byte); virtual;
    procedure OnUpdateBombProperty(value : Integer);                    virtual;
    procedure OnUpdateMineProperty(value : Double);                     virtual;
    procedure OnUpdateTorpedoProperty(rec : TRecTorpedoProperty);       virtual;
    procedure OnECMCommand(JammerObj : TObject);                        virtual;

    procedure OnUpdateTacticalTote;                                     virtual;
    procedure OnLogStatusTactical(str : string);                        virtual;
    procedure OnUpdateDatalinkTote(idOrderDL : Integer);                virtual;

    //Formation Update form
    procedure OnUpdateFormationList;                                    virtual;
    procedure OnUpdateFormationMembers(formation : TFormationRefine);   virtual;
    //procedure OnDeleteDogBox();
    procedure OnDetectabilityChange(aShip: TT3PlatformInstance);        virtual;

    //logistic
    procedure OnLogisticTemplate(iName, iOldName: string; iIdAction, iForce, iColor : Integer; iShow : Boolean); virtual;
    procedure OnLogisticRoute(iName: string; id, iPersonel, iForce, iColor : Integer; iSpeed, iPAwalX, iPAwalY
              ,iPAkhirX, iPAkhirY : Double); virtual;
//    procedure OnPlotting(rec : TRecCmd_Plotting); virtual;
    procedure OnMissileSynchVBS(Sender: TObject); virtual;
    procedure OnEventSendPlatformcmd(const pi_id: integer;
      const ordID, ordType, DiveMode: Byte; const cmdParam: single); virtual;

    procedure OnCameraTrackPosition; virtual;

    procedure OnCekLandAndDepth(x, y : Double ;r : TRec_MapData); virtual;

    procedure OnDeletVehicle3D(PlatformID : Integer); virtual;
    procedure OnlogDataMissile(ts: TStringList); virtual;
    procedure OnUpdateEnvironment; virtual;
  end;

implementation

uses
  uT3Sensor, uT3Mine, uT3Datalink, uBaseCoordSystem, uT3DefensiveJammer,
  uT3SimManager;


{ TT3EventManager }

procedure TT3EventManager.OnNCSDatalinkEMCON(Sender: TObject);
begin

end;

procedure TT3EventManager.OnNextWaypointChangeTo3D(WaypointID, aShipID: Integer; aSpeed,
  aBearing, Altitude, PosX, PosY: Double);
begin
//x
end;

procedure TT3EventManager.OnDatalinkEvent(aShipID, aDatalinkIndex,
  aDatalinkType, aEventMode: Integer);
begin

end;

procedure TT3EventManager.OnDatalinkOffLine(Sender: TObject);
begin
  if Assigned(OnLogEventStr) then
  begin
    OnLogEventStr('TT3EventManager.OnDatalinkOffLine', TT3DataLink(Sender).InstanceName + ' Offline');
  end;
end;

procedure TT3EventManager.OnDatalinkOnline(Sender: TObject);
begin
  if Assigned(OnLogEventStr) then
  begin
    OnLogEventStr('TT3EventManager.OnDatalinkOnline', TT3DataLink(Sender).InstanceName + ' Online');
  end;
end;

procedure TT3EventManager.OnDatalinkTracksUpdate(Sender: TObject);
begin

end;

procedure TT3EventManager.OnDataLinkUpdated(Sender: TObject);
begin

end;

procedure TT3EventManager.OnDecoysDeployed(aParent: TObject);
begin

end;

procedure TT3EventManager.OnDeletVehicle3D(PlatformID: Integer);
begin
//
end;

procedure TT3EventManager.OnDeployContinousEvent(aShipID, aObjIndex: Integer;
  aObjType, aObjMode: Byte; aObjDepth, aObjSpacing: Double;
  aObjQty : Integer; aDeployUntilNextWaypoint: Boolean);
begin
  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3EventManager.OnDeployContinousEvent', 'Deploy Continous Event');
end;

procedure TT3EventManager.OnDeployMine(aShipID, aMineIndex: Integer;
  aDepth: Double);
begin
  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3EventManager.OnDeployMine', 'Mine Deployed');
end;

procedure TT3EventManager.OnDeploySonar(VIndex, SensorType, SensorIndex,
  ControlMode, Status: integer);
begin
  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3EventManager.OnDeploySonar', 'Sensor Deploy');
end;

procedure TT3EventManager.OnDeploySonobuoy(aShipID, aSonoIndex: Integer;
  aSonoMode: Byte; aDepth: Double);
begin
  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3EventManager.OnDeploySonobuoy', 'Sonobuoy Deployed');
end;

procedure TT3EventManager.OnDepthChecker(Sender: TObject);
begin

end;

procedure TT3EventManager.OnDetectabilityChange(aShip: TT3PlatformInstance);
begin
//x
end;

procedure TT3EventManager.OnECMCommand(JammerObj: TObject);
begin

end;

procedure TT3EventManager.OnECMDestroy(Sender: TObject);
begin
  if (Sender is TT3CounterMeasure) and Assigned(OnLogEventStr) then
  begin
    OnLogEventStr('TT3EventManager.OnECMDestroy', TT3CounterMeasure(Sender).InstanceName + ' destroyed ' );
  end
  else if (Sender is TT3CounterMeasure) and Assigned(OnLogEventStr) then
  begin
    OnLogEventStr('TT3EventManager.OnECMDestroy', TT3Sonobuoy(Sender).InstanceName + ' destroyed ' );
  end;
end;

procedure TT3EventManager.OnECMJammingFailed(Sender: TObject; reason: String);
begin
  OnLogEventStr('TT3EventManager.OnECMJammingFailed',
    TT3DefensiveJammerOnVehicle(Sender).InstanceName
    + ' defensive jamming failed, reason : ' + reason);
end;

procedure TT3EventManager.OnECMJammingSuccess(Sender : TObject; jammedObject: TJammedObjectParameter);
begin
  OnLogEventStr('TT3EventManager.OnECMJammingSuccess',
    TT3DefensiveJammerOnVehicle(Sender).InstanceName
    + ' defensive jamming success to ' + IntToStr(jammedObject.PJammedObjectID));
end;

procedure TT3EventManager.OnECMLaunched(Sender: TObject);
begin
  if Assigned(OnLogEventStr) then
   if Sender is TT3Chaff then
     OnLogEventStr('TT3EventManager.OnECMLaunched', TT3Chaff(Sender).InstanceName + ' launch altitude : ' + FloatToStr( TT3Chaff(Sender).BloomAltitude) + ' feet')
   else if Sender is TT3AirBubble then
     OnLogEventStr('TT3EventManager.OnECMLaunched', TT3AirBubble(Sender).InstanceName + ' launch depth : ' + FloatToStr( TT3AirBubble(Sender).BloomDepth) + ' feet')
   else if Sender is TT3Sonobuoy then
     OnLogEventStr('TT3EventManager.OnECMLaunched', TT3Sonobuoy(Sender).InstanceName + ' launch depth :  feet');
end;


procedure TT3EventManager.OnECMlistUpdated(Sender: TObject);
begin

end;

procedure TT3EventManager.OnECMQuantityChange(Sender: TObject);
begin

end;

procedure TT3EventManager.OnEngagementChange(mis:TObject);
begin

end;

procedure TT3EventManager.onEngageTrack(Track: String);
begin

end;

procedure TT3EventManager.OnEventSendPlatformcmd(const pi_id: integer;
  const ordID, ordType, DiveMode: Byte; const cmdParam: single);
begin

end;

procedure TT3EventManager.OnFireControlUpdated(Sneder: TObject);
begin

end;

procedure TT3EventManager.OnFiringModeChange(mis:TObject);
begin

end;

procedure TT3EventManager.OnFuelEmpty(Sender: TObject; OrderType: Byte;
  Value: Double);
begin
//
end;

procedure TT3EventManager.OnGuidanceLaunchWeapon(aParent,
  aTarget: TT3PlatformInstance);
begin

end;

procedure TT3EventManager.OnGuidanceStaleTimeReached(aParent,
  aTarget: TT3PlatformInstance; aDT : Double);
begin

end;

procedure TT3EventManager.OnGuidanceStandoffReached(aParent,
  aTarget: TT3PlatformInstance);
begin

end;

//procedure TT3EventManager.OnGuidanceStationReached(ve: TT3PlatformInstance;
//  val : Boolean);
//begin
//end;
//procedure TT3EventManager.OnGuidanceStationUpdateHeading(
//  ve: TT3PlatformInstance; aHeading: Double);
//begin
//end;
//procedure TT3EventManager.OnGuidanceStationUpdateSpeed(ve: TT3PlatformInstance;
//  aSpeed: Double);
//begin
//end;

procedure TT3EventManager.OnGuidance_Engage(aShipID,
  aParentID: TT3PlatformInstance; MissileID: Integer; IsHaveLaunch: Byte);
begin

end;

procedure TT3EventManager.OnGunFire(Sender: TObject);
begin

end;

procedure TT3EventManager.OnGunSetButtonCase(Sender: TObject);
begin

end;

procedure TT3EventManager.OnGunUpdateQuantity(Sender: TObject);
begin

end;

procedure TT3EventManager.OnIffEvent(aShipID, aIffIndex, aIffType, aEventMode: Integer);
begin

end;

procedure TT3EventManager.OnIFFInterrogatorStatus(Sender: TObject;
  Mode: TSensorOperationalStatus);
begin
  if Assigned(OnLogEventStr) then
  begin
    if Sender is TT3Sensor then
    begin
      OnLogEventStr('TT3EventManager.OnIFFInterrogatorStatus', 'Sensor ' + TT3Sensor(Sender).InstanceName + ' Interrogator, Status : ' + SensorOpStatusToString(Mode));
    end;
  end;
end;

procedure TT3EventManager.OnIFFSensorDetect(aShip, aSensor, aTarget : TObject ;value, value2 : boolean; mode1,mode,mode3,mode3C:string);
begin

end;

procedure TT3EventManager.onIFFTransponderStatus(Sender: TObject;
  Mode: TSensorOperationalStatus);
begin
  if Assigned(OnLogEventStr) then
  begin
    if Sender is TT3Sensor then
    begin
      OnLogEventStr('TT3EventManager.onIFFTransponderStatus', 'Sensor ' + TT3Sensor(Sender).InstanceName + ' Transponder, Status : ' + SensorOpStatusToString(Mode));
    end;
  end;
end;

procedure TT3EventManager.OnIsCollision(Sender: TObject);
begin

end;

procedure TT3EventManager.OnLastUpdateTimePlatform(str: string);
begin

end;

procedure TT3EventManager.OnLaunchBomb(aParentID, aMissileID, aTargetID,
  aSalvo: Integer);
begin
  if Assigned(FOnLogEventStr) then
    FOnLogEventStr('TT3EventManager.OnLaunchBomb', 'Waypoint Event : Bomb launch ' + IntToStr(aParentID) + ' ' +
      IntToStr(aMissileID) + ' ' + IntToStr(aTargetID) + ' ' + IntToStr(aSalvo));
end;

procedure TT3EventManager.OnLaunchGun(aParentID, aMissileID, aTargetID,
  aSalvo: Integer);
begin
  if Assigned(FOnLogEventStr) then
    FOnLogEventStr('TT3EventManager.OnLaunchGun', 'Waypoint Event : Gun launch ' + IntToStr(aParentID) + ' ' +
      IntToStr(aMissileID) + ' ' + IntToStr(aTargetID) + ' ' + IntToStr(aSalvo));
end;

procedure TT3EventManager.OnLaunchMisile(aParentID, aMissileID,
  aTargetID, aSalvo : Integer);
begin
  if Assigned(FOnLogEventStr) then
    FOnLogEventStr('TT3EventManager.OnLaunchMisile', 'Waypoint Event : Missile launch ' + IntToStr(aParentID) + ' ' +
      IntToStr(aMissileID) + ' ' + IntToStr(aTargetID) );
end;

procedure TT3EventManager.OnLaunchTorpedo(aParentID, aMissileID,
  aTargetID, aSalvo : Integer);
begin
  if Assigned(FOnLogEventStr) then
    FOnLogEventStr('TT3EventManager.OnLaunchTorpedo', 'Waypoint Event : Torpedo launch ' + IntToStr(aParentID) + ' ' +
      IntToStr(aMissileID) + ' ' + IntToStr(aTargetID) );
end;

procedure TT3EventManager.OnlogDataMissile(ts: TStringList);
begin

end;

procedure TT3EventManager.OnLogisticRoute(iName: string; id, iPersonel, iForce,
  iColor: Integer; iSpeed, iPAwalX, iPAwalY, iPAkhirX, iPAkhirY: Double);
begin

end;

procedure TT3EventManager.OnLogisticTemplate(iName, iOldName: string; iIdAction,
  iForce, iColor: Integer; iShow: Boolean);
begin

end;

procedure TT3EventManager.OnLogStatusTactical(str : string);
begin

end;

procedure TT3EventManager.OnMapNeedUpdate(Sender: TObject);
begin

end;

procedure TT3EventManager.OnMissileSynchVBS(Sender: TObject);
begin

end;

procedure TT3EventManager.OnModeSearchIFF(aSensor: TObject; value: byte);
begin

end;

procedure TT3EventManager.OnNonRealTimeAdded(Sender: TObject);
begin

end;

procedure TT3EventManager.OnNonRealTimeChanged(Sender: TObject);
begin

end;

procedure TT3EventManager.OnPlatformDamageChanged(sender: TObject;
  const dmgType: TDamageItemType);
var
  info : string;
begin
  case dmgType of
    diOverall:
    begin
      if TT3Vehicle(sender).HealthPercent <= 0 then
        info := 'Vehicle is damage';
    end;
    diSensor  : info := 'Sensor is damage';
    diECM     : info := 'CounterMeasure is damage';
    diWeapon  : info := 'Weapon is damage' ;
    diCommm   : info := 'Communication is damage';
    diHelm    : info := 'Helm is damage';
    diPropulsion: info := 'Propulsion is damage';
  end;

  if (sender is TT3Vehicle) and Assigned(OnLogEventStr) and (info <> '') then
    OnLogEventStr('TT3EventManager.OnPlatformDamageChanged', TT3PlatformInstance(Sender).InstanceName + ' damage : ' + info);
end;

procedure TT3EventManager.OnPlatformDestroy(Sender: TObject);
begin
  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3EventManager.OnPlatformDestroy', TT3PlatformInstance(Sender).InstanceName + ' destroyed');
end;

procedure TT3EventManager.OnPlatformFreeMe(Sender: TObject; Value: boolean);
begin
//  if Assigned(OnLogEventStr) then
//    OnLogEventStr(TT3PlatformInstance(Sender).InstanceName + ' Free' );
end;

procedure TT3EventManager.OnPlatformHancur(Sender: TObject;
          Target: string; reasondestroy : Byte);
begin
    if (Sender is TT3Vehicle) and Assigned(OnLogEventStr) then begin
      OnLogEventStr('TT3EventManager.OnPlatformHancur', TT3PlatformInstance(Sender).InstanceName + ' Hancur oleh ' +
      Target);
    end;
end;

procedure TT3EventManager.OnPlatformHancurin(SenderID : Integer;
          Target: string; reasondestroy : Byte);
begin
end;

procedure TT3EventManager.OnPlatformAssigned(Sender : TObject);
begin

end;

procedure TT3EventManager.OnPlatformControlled(Sender: TObject);
begin

end;

procedure TT3EventManager.OnPlatformOrderedControl(Sender: TObject;
  Order: TPlatformOrderedControl; Value: double);
begin
  case Order of
    pocSpeed  :
      if Assigned(OnLogEventStr) then
        OnLogEventStr('TT3EventManager.OnPlatformOrderedControl', TT3Vehicle(Sender).InstanceName + ' set Speed : ' + FloatToStr(Value));
    pocAltitude :
      if Assigned(OnLogEventStr) then
        OnLogEventStr('TT3EventManager.OnPlatformOrderedControl', TT3Vehicle(Sender).InstanceName + ' set Altitude : ' + FloatToStr(Value));
    pocHeading :
      if Assigned(OnLogEventStr) then
        OnLogEventStr('TT3EventManager.OnPlatformOrderedControl', TT3Vehicle(Sender).InstanceName + ' set Heading : ' + FloatToStr(Value));
  end;
end;

procedure TT3EventManager.OnPlatformOrderedControlChange(OrderID, OrderType,
  PlatfomID: Integer; OrderParam: Single);
begin

end;

procedure TT3EventManager.OnPlatformPropertyChange(Sender: TObject);
begin

end;

procedure TT3EventManager.OnPlatformSelected(Sender: TObject);
begin

end;

//procedure TT3EventManager.OnPlotting(rec : TRecCmd_Plotting);
//begin
//
//end;

procedure TT3EventManager.OnPlatformPositonChange(Sender: TObject);
begin
  // x
end;

procedure TT3EventManager.OnPropertyIntChange(Sender: TObject; Props: TPropsID;
  Value: Integer);
begin

end;

procedure TT3EventManager.OnPropGameSettingBoolChange(Sender : TObject;Props: TPropsID;
  Value: Boolean);
begin

  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3EventManager.OnPropGameSettingBoolChange',
       'Game Setting ID : ' + IntToStr(Byte(Props)) + ' set to ' + BoolToStr(Value));

end;

procedure TT3EventManager.OnPropGameSettingByteChange(Sender : TObject;Props: TPropsID;
  Value: Byte);
begin

  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3EventManager.OnPropGameSettingByteChange',
       'Game Setting ID : ' + IntToStr(Byte(Props)) + ' set to ' + IntToStr(Value));

end;

procedure TT3EventManager.OnPropGameSettingDoubleChange(Sender : TObject;Props: TPropsID;
  Value: Double);
begin

  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3EventManager.OnPropGameSettingDoubleChange',
     'Game Setting ID : ' + IntToStr(Byte(Props)) + ' set to ' + FloatToStr(Value));

end;

procedure TT3EventManager.OnPropGameSettingIntChange(Sender : TObject;Props: TPropsID;
  Value: Integer);
begin

  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3EventManager.OnPropGameSettingIntChange',
     'Game Setting ID : ' + IntToStr(Byte(Props)) + ' set to ' + IntToStr(Value));
end;

procedure TT3EventManager.OnPUDatalinkEMCON(Sender: TObject; PooledPlatformID : Integer);
begin

end;

procedure TT3EventManager.OnRadarControlMode(Sender: TObject;
  Mode: TRadarControlMode);
begin

end;

procedure TT3EventManager.OnRadarEvent(aShipID, aRadarIndex,
  aEventMode: Integer);
begin

end;

//procedure TT3EventManager.OnRadarNoiseJammingFailed(Sender: TObject;
//  JammedOject : TJammedObjectParameter );
//begin
//  OnLogEventStr(TT3RadarNoiseJammerOnVehicle(Sender).InstanceName
//    + ' radar noise jamming failed');
//end;

procedure TT3EventManager.OnRadarNoiseJammingSuccess(Sender: TObject;
  JammedOject : TJammedObjectParameter;  Value : Boolean);
begin
  if Value then begin
    OnLogEventStr('TT3EventManager.OnRadarNoiseJammingSuccess',
    TT3RadarNoiseJammerOnVehicle(Sender).InstanceName
    + ' radar noise jamming success '+ IntToStr(JammedOject.PJammedObjectID));
  end
  else begin
    OnLogEventStr('TT3EventManager.OnRadarNoiseJammingSuccess',
    TT3RadarNoiseJammerOnVehicle(Sender).InstanceName
    + ' radar noise jamming failed');
  end;
end;

procedure TT3EventManager.OnRadarRemoveAssignedPlatform(radar: TObject);
begin

end;

procedure TT3EventManager.OnReceiveGameSpeedForRecord(Cmd: TRecCmd_GameCtrl);
begin

end;

procedure TT3EventManager.OnReceiveMessageHandling(Cmd: TRecSendMessage);
begin

end;

procedure TT3EventManager.OnReceiveModifComm(Cmd: TRecModifComm);
begin

end;

procedure TT3EventManager.OnRefreshIFFForm(sensor: TT3IFFSensor);
begin

end;

procedure TT3EventManager.OnDatalinkPoolRequest(Sender: TObject;
  PooledPlatformID: Integer);
begin

end;

procedure TT3EventManager.OnSensorDetect(Sender, detected: TObject;
  Value: boolean; aIFF : Boolean);
begin

end;

procedure TT3EventManager.OnSensorOperationalStatus(Sender: TObject;
  Mode: TSensorOperationalStatus);
begin
  if (not(Mode = sopDeploying)) and (not(Mode = sopStowing)) then
    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3EventManager.OnSensorOperationalStatus',
        'Sensor ' + TT3Sensor(Sender).InstanceName + ', Status : ' + SensorOpStatusToString(Mode));
end;

procedure TT3EventManager.OnSensorRemoved(Sender: TObject);
begin

end;

procedure TT3EventManager.OnSonarControlMode(Sender: TObject;
  Mode: TSonarControlMode);
begin

end;

procedure TT3EventManager.OnSonarEvent(aShipID, aSonarIndex,
  aEventMode: Integer);
begin

end;
procedure TT3EventManager.OnSonobuoyPassiveDetect(Sender, detected: TObject;
  aValue: Byte);
begin

end;

procedure TT3EventManager.OnSyncTarget(aWeapon, aTarget: TObject);
begin

end;

procedure TT3EventManager.OnTerminateOverlay;
begin

end;

procedure TT3EventManager.OnUpdateActualCable(VIndex, SensorType, SensorIndex: integer; aValue: Double);
begin

end;

procedure TT3EventManager.OnUpdateBombProperty(value: Integer);
begin

end;

procedure TT3EventManager.OnUpdateDatalinkTote(idOrderDL: Integer);
begin

end;

procedure TT3EventManager.OnUpdateEnvi(index : integer; Value: Double;
  GameEnvironment : TGame_Environment_Definition);
begin

end;

procedure TT3EventManager.OnUpdateFormationList;
begin

end;

procedure TT3EventManager.OnUpdateFormationMembers(formation: TFormationRefine);
begin

end;

procedure TT3EventManager.OnUpdateFormSonar(VIndex, SensorType, SensorIndex,
  Counter, param, order: Integer);
begin

end;

procedure TT3EventManager.OnUpdateGroupControl(grp : T3GroupVehicle; Action : Byte);
begin

end;

procedure TT3EventManager.OnUpdateIFFList(sensor: TT3IFFSensor; value: byte);
begin

end;

procedure TT3EventManager.OnUpdateMineProperty(value: Double);
begin

end;

procedure TT3EventManager.OnUpdateRadarNoiseJammer(jammer: TObject; value: byte);
begin

end;

procedure TT3EventManager.OnUpdateSonarDeploy(piObj : TT3Vehicle; value: byte;
  cable: Double);
begin

end;

procedure TT3EventManager.OnUpdateTacticalTote;
begin

end;

procedure TT3EventManager.OnUpdateEnvironment;
begin

end;

procedure TT3EventManager.OnUpdateTorpedoProperty(rec: TRecTorpedoProperty);
begin

end;

procedure TT3EventManager.OnUpdateTvCubicleGroup;
begin

end;

procedure TT3EventManager.AbortMissileLaunch(aParentId, aMissileId: Integer);
begin

end;

procedure TT3EventManager.OnCekLandAndDepth(x, y: Double; r: TRec_MapData);
begin
//
end;

procedure TT3EventManager.EmptyRec(var rGun: TRecCmd_GunFire);
begin
  with rGun do
  begin
    SessionID         := 0;

    ParentPlatformID  := 0;
    GunID             := 0;
    ControlMode       := 0;
    SalvoMode         := 0;
    SalvoSize         := 0;
    GunCapacityRemain := 0;
    InterceptRange    := 0;
    ThresSpeed        := 0;
    TargetPlatformID  := 0;
    GunName           := '';
    pX        := 0;                      //mk test
    pY        := 0;
    pAltitude := 0;
    degSpotLine   := 0;
    degGunLine    := 0;

    //--- NGS corrections n error system
    NGSCorrMode   := 0;
    NGSRangeCorr  := 0;
    NGSDefCorr    := 0;
    pXflash   := 0;
    pYflash   := 0;
    NGSBearing    := 0;
    NGSElevation  := 0;
    ChaffX := 0;
    ChaffY := 0;
    OrderID           := 0;
    HitProbability    := 0;
  end;
end;

procedure TT3EventManager.OnAfterLanding(Sender: TObject);
begin

end;

procedure TT3EventManager.OnUpdateWeaponVehicle(Sender: TObject);
begin

end;

procedure TT3EventManager.OnVectactChange(Sender: TObject);
begin

end;

procedure TT3EventManager.OnVectactChange(r: TRecVectac);
begin
//x
end;

procedure TT3EventManager.OnVehicleHealthChange(ve: TT3Vehicle);
begin

end;

procedure TT3EventManager.OnVehicleLogisticChange(ve: TT3Vehicle);
begin
   //change logistic vehicle
end;

//procedure TT3EventManager.OnVehicleRampChange(ve: TT3Vehicle);
//begin
//  //change ramp vehicle
//end;

procedure TT3EventManager.OnVehicleSensorStateChange(Sender: TT3Vehicle);
begin

end;

procedure TT3EventManager.OnVehicleSystemStateChange(ve: TT3Vehicle);
begin
  //change system state vehicle
end;

procedure TT3EventManager.OnCameraTrackPosition;
begin
//
end;

procedure TT3EventManager.OnChangeHeading(Sender : TObject; OrderType: Byte; Value : Double);
begin

end;

procedure TT3EventManager.OnChangePosition(Sender : TObject; IdAction: Byte; x, y: Double);
begin

end;

procedure TT3EventManager.OnCheckDateTime(sender : TObject);
begin
  if not Assigned(sender) then
    Exit;
end;

procedure TT3EventManager.OnCollision(Sender, Target : TObject; Value : Boolean);
begin

end;

procedure TT3EventManager.OnCountermeasureEvent(aShipID, aCMIndex,
  aEventMode: Integer);
begin
  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3EventManager.OnCountermeasureEvent', 'Countermeasure Deploy');
end;

procedure TT3EventManager.OnWaypointChange(index: integer);
begin

end;

procedure TT3EventManager.OnWaypointChangeVectac(WpnCarrierID, index: integer);
begin

end;

procedure TT3EventManager.OnWaypointDataChange(rec: TrecSinc_Waypoint);
begin
//x
end;

procedure TT3EventManager.OnWaypointDestinationChange(aShipID: Integer;
  Long, Lat: Double);
begin
  //x
end;

procedure TT3EventManager.OnWaypointEnd(aShipID: Integer; aSpeed,
  aHeading: Double);
begin
  //x
end;

procedure TT3EventManager.OnWaypointRemoveOwner(aShipID: Integer);
begin
  //x
end;

procedure TT3EventManager.OnWeaponDestroy(Sender: TObject);
begin
//  if (Sender is TT3Weapon) and Assigned(OnLogEventStr) then begin
//    OnLogEventStr(TT3Weapon(Sender).InstanceName + ' destroyed Server Weapon' );
//  end;
end;

procedure TT3EventManager.OnWeaponHit(Sender, Target: TObject; Lethality: integer; FreeWeapon: Boolean);
begin
  if not Assigned(Target) then
  begin
    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3EventManager.OnWeaponHit', 'Target missing when shooted??');

    exit;
  end;

  if Assigned(OnLogEventStr) then
    OnLogEventStr('TT3EventManager.OnWeaponHit', TT3PlatformInstance(Target).InstanceName + ' hit by ' + TT3Weapon(Sender).InstanceName );

  if Target is TT3Chaff then
  begin
    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3EventManager.OnWeaponHit', TT3Weapon(sender).InstanceName + ' Hit ' + TT3Chaff(Target).InstanceName);
  end;

  if Target is TT3Vehicle then
  begin
    //try
      TT3Vehicle(Target).Shooted(TSimObject(Sender), Lethality);
    //finally
      TT3PlatformInstance(Sender).UnitMakeDestroy := TT3PlatformInstance(Target).InstanceName;
      TT3PlatformInstance(Target).UnitMakeDestroy := TT3PlatformInstance(Sender).InstanceName;
      OnLogEventStr('TT3EventManager.OnWeaponHit', TT3Weapon(Sender).InstanceName + ' destroy ');
    //end;

    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3EventManager.OnWeaponHit', TT3PlatformInstance(Target).InstanceName + ' health ' +
          IntToStr(Round(TT3PlatformInstance(Target).HealthPercent)) + '%' )
  end;

  if Target is TT3Torpedo then
  begin
    TT3PlatformInstance(Sender).UnitMakeDestroy := TT3PlatformInstance(Target).InstanceName;
    TT3PlatformInstance(Target).UnitMakeDestroy := TT3PlatformInstance(Sender).InstanceName;

    TT3Torpedo(Target).FreeChilds;
    TSimObject(Target).FreeMe := true;
    TSimObject(Target).AbsoluteFree := true;

    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3EventManager.OnWeaponHit', TT3Weapon(sender).InstanceName + ' Hit ' + TT3Torpedo(Target).InstanceName);
  end;

  if Target is TT3Mine then
  begin
    TT3PlatformInstance(Sender).UnitMakeDestroy := TT3PlatformInstance(Target).InstanceName;
    TT3PlatformInstance(Target).UnitMakeDestroy := TT3PlatformInstance(Sender).InstanceName;

    TT3Mine(Target).FreeChilds;
    TSimObject(Target).FreeMe := true;
    TSimObject(Target).AbsoluteFree := true;

    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3EventManager.OnWeaponHit', TT3Weapon(sender).InstanceName + ' Hit ' + TT3Mine(Target).InstanceName);
  end;

  if Target is TT3Missile then
  begin
    //try
      TT3Missile(Target).Shooted(TSimObject(Sender), Lethality);
    //finally
      TT3PlatformInstance(Sender).UnitMakeDestroy := TT3PlatformInstance(Target).InstanceName;
      TT3PlatformInstance(Target).UnitMakeDestroy := TT3PlatformInstance(Sender).InstanceName;
      OnLogEventStr('TT3EventManager.OnWeaponHit', TT3Weapon(Sender).InstanceName + ' destroy ')
      //TSimObject(Sender).FreeMe := true; // 2 temporary
    //end;
  end;
end;

procedure TT3EventManager.OnWeaponOut(Sender: TObject; reasondestroy: Byte); //ham 04052012
begin
  if Assigned(OnLogEventStr) then
        OnLogEventStr('TT3EventManager.OnWeaponOut', TT3Weapon(sender).InstanceName + ' Out of Fuel ');
end;

procedure TT3EventManager.OnWeaponPropertyChange(Sender: TObject);
begin

end;

procedure TT3EventManager.OnWeaponTarget(Sender, Target: TObject);
begin

end;

procedure TT3EventManager.RemoveFromTargetedRefTrack(Sender: TObject);
var
  i : integer;
  aObj, tgt : TSimObject;
begin
  // sim weapon
  for I := 0 to SimManager.SimWeapons.itemCount - 1 do
  begin
    aObj := SimManager.SimWeapons.getObject(i);
    if not Assigned(aObj) then
      continue;

    if (aObj is TT3Weapon) then
    begin
      tgt := TT3Weapon(aObj).TargetObject;
      if Assigned(tgt) and (tgt = Sender) then
      begin
        TT3Weapon(aObj).TargetObject := nil;
      end;

      if aObj is TT3Missile then
      begin
        if TT3Missile(aObj).Target = Sender then
        begin
          TT3Missile(aObj).Target := nil;
        end;
      end;
    end;
  end;

  // sim device
  for I := 0 to SimManager.SimDevices.itemCount - 1 do
  begin
    aObj := SimManager.SimDevices.getObject(i);
    if not Assigned(aObj) then
      continue;

    if (aObj is TT3Weapon) then
    begin
      tgt := TT3Weapon(aObj).TargetObject;
      if Assigned(tgt) and (tgt = Sender) then
      begin
        TT3Weapon(aObj).TargetObject := nil;
      end;

      if aObj is TT3Missile then
      begin
        if TT3Missile(aObj).Target = Sender then
        begin
          TT3Missile(aObj).Target := nil;
        end;
      end;
    end;
  end;

  // sim platform
  for I := 0 to SimManager.SimPlatforms.itemCount - 1 do
  begin
    aObj := SimManager.SimPlatforms.getObject(i);
    if not Assigned(aObj) then
      continue;

    if (aObj is TT3Weapon) then
    begin
      tgt := TT3Weapon(aObj).TargetObject;
      if Assigned(tgt) and (tgt = Sender) then
      begin
        TT3Weapon(aObj).TargetObject := nil;
      end;

      if aObj is TT3Missile then
      begin
        if TT3Missile(aObj).Target = Sender then
        begin
          TT3Missile(aObj).Target := nil;
        end;
      end;
    end;
  end;
end;

procedure TT3EventManager.OnWeaponHitByServer(SenderID, TargetID, Lethality : integer; ParentName : string) ;
begin
end;

procedure TT3EventManager.OnWeaponHitTo3D(Sender, Target: TObject;
  Heading: Double);
begin

end;

procedure TT3EventManager.OnWeaponHybrid(sender: TObject);
begin

end;

procedure TT3EventManager.OnWeaponInOut(SenderID: integer; reasondestroy: Byte);
begin
end;

procedure TT3EventManager.OnWeaponLaunched(Sender, Target: TObject);
var
  name : string;
begin
  if not Assigned(Sender) then exit;  

  if Assigned(target) then
  begin
    if (Target is TT3PlatformInstance) then
      name := TT3PlatformInstance(Target).InstanceName;

    if (Sender is TT3Weapon) and Assigned(OnLogEventStr) then
      OnLogEventStr('TT3EventManager.OnWeaponLaunched',
                    TT3Weapon(Sender).InstanceName + ' launch to target ' + name
                    + #13#10 + FormatFloat('0.00', TT3Weapon(Sender).Altitude * C_Meter_To_Feet));
  end
  else
  begin
    if (Sender is TT3Weapon) and Assigned(OnLogEventStr) then
      OnLogEventStr('TT3EventManager.OnWeaponLaunched',
                    TT3Weapon(Sender).InstanceName + ' launch without target');
  end;
end;

procedure TT3EventManager.SetOnLogEventStr(const Value: TLogStrProc);
begin
  FOnLogEventStr := Value;
end;

procedure TT3EventManager.UpdateEmconCheckBox(pflist: TT3PlatformInstance; StateBtn : Boolean);
begin
//x
end;

end.




