unit uSimMgr_Client;

interface

uses
   Classes, Graphics, SysUtils, uCompassVisual, uObjectVisuals, uDBAssetObject,
   uT3SimManager, uLibSettingTTT, uThreadTimer, uDataModuleTTT, uGameData_TTT,
   uSteppers ;

type

//==============================================================================
// TTT simCenter
// contain: 'session' , scenario management,  objects run..
//
//==============================================================================

  TSimMgr_Client = class(TT3SimManager)
  protected
    FUpdateThread : TMSTimer;
    FUpdateDelay  : TDelayer;

    FConnectDelay  : TDelayer;

    FOnUpdateForm: TNotifyEvent;

    FCompass: TCompassVisual;
    FRangeRing: TRangeRingsVisual;
    FLineVisual : TLineVisual;

    procedure FGameThread_OnRunning(const dt: double); override;
    procedure FGameThread_OnPaused(const dt: double); override;

    procedure FUpdateThread_OnTerminate(sender: TObject); virtual;
    procedure FUpdateThread_OnRunning(const dt: double); virtual;
    procedure FUpdateThread_OnPaused(const dt: double); virtual;

    procedure FOnUpdateDelay(sender: TObject);
    procedure FOnConnectDelay(sender: TObject);

  private
    FOnReceivedSensorCommand: TNotifyEvent;
    FOnMapViewChange: TNotifyEvent;
    procedure OnPlatformNeedDeleted (Sender : TObject);

  protected

    procedure NetRecv_PlatformMovement(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_PlatformLandData(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_GameTime(apRec: PAnsiChar; aSize: Word);

    procedure netRecv_CmdSensor(apRec: PAnsiChar; aSize: Word);

    procedure netRecv_CmdEmbark(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_CmdSYNCH(apRec: PAnsiChar; aSize: Word);

    procedure netRecv_CmdLaunchMissile(apRec: PAnsiChar; aSize: Word);

    procedure netRecv_CmdGunFire(apRec: PAnsiChar; aSize: Word);
  public

    constructor Create;
    destructor Destroy; override;


    procedure GameStart; override;
    procedure GamePause; override;

    procedure LoadScenarioID(const vSet: TGameDataSetting); override;

    procedure InitNetwork; override;
    procedure StopNetwork;  override;

  public
    OwnShipPlatform : TPlatform_Instance;
    HookedTrack     : TPlatform_Instance;
    GroupMembers : TList;

    procedure DrawAll(aCnv: TCanvas);
    procedure DrawAllDetected(aCnv: TCanvas);

    procedure OnMapChange(sender: TObject);
    procedure SetHookedPlatform(Pi : TPlatform_Instance);

    function isPIOnGroup(Pi : TObject) : boolean;

    procedure netSend_CmdPlatform(const pi_id: Integer; const ordID, ordType: Byte;
      const cmdParam: single);

    procedure netSend_CmdPlatform_Move(const pi_id: Integer;
      const ordID: Byte; const x, y: double);

    procedure netSend_CmdSensor(const pi_id: Integer;
      const sensType: byte; const sensID: integer;
      const ordID, ordParam: byte);

    procedure netSend_CmdLaunch_Embark(
     const r: TRecCmd_Embark);

    procedure netSend_CmdLaunch_Missile(
     const r: TRecCmd_LaunchMissile);

    procedure netSend_CmdGunFire( const r: TRecCmd_GunFire);

    function GetSerialPlatformID: Integer;
    procedure LaunchEmbarkPlatform(const rec : TRecCmd_Embark ); override;
    procedure SetZoomEnc;


  public

    property OnUpdateForm: TNotifyEvent read FOnUpdateForm write FOnUpdateForm;
    property LineVisual : TLineVisual read FLineVisual;
    property RangeRing  : TRangeRingsVisual read FRangeRing;

    property OnReceivedSensorCommand: TNotifyEvent read
     FOnReceivedSensorCommand write FOnReceivedSensorCommand;

    property OnMapViewChange: TNotifyEvent read FOnMapViewChange
      write FOnMapViewChange;

  end;


var
  simMgrClient: TSimMgr_Client;

implementation

uses
   uCoordConvertor, uMapXhandler,  uNetHandle_Client, tttData,
   uDBAsset_Cubicle,  uDBAsset_Sensor, uDBAsset_Radar, uDBAsset_Sonar,
   ufTacticalDisplay, uDBAsset_GameEnvironment;

{ TSimMgr_Server }

constructor TSimMgr_Client.Create;
begin
  inherited;

  FCompass := TCompassVisual.Create;
  FCompass.Width  := VConvertor.FMap.Width;
  FCompass.Height := VConvertor.FMap.Height;

  FRangeRing := TRangeRingsVisual.Create;
  FRangeRing.Interval := 10;
  FLineVisual := TLineVisual.Create;

  OwnShipPlatform := nil;

  FUpdateDelay  := TDelayer.Create;
  FUpdateDelay.DInterval := 1;
  FUpdateDelay.OnTime := FOnUpdateDelay;
  FUpdateDelay.Enabled := True;

  FConnectDelay  :=  TDelayer.Create;
  with  FConnectDelay do begin
    DInterval := 8;
    OnTime  := FOnConnectDelay;
    Enabled := false;
  end;


  FUpdateThread := TMSTimer.Create;

  GroupMembers := TList.Create;
  FLastPlatformID := 100;

end;

destructor TSimMgr_Client.Destroy;
begin
  GroupMembers.Free;

  FUpdateThread.Free;

  FRangeRing.Free;
  FCompass.Free;
  FLineVisual.Free;
  inherited;
end;

procedure TSimMgr_Client.setZoomENC();
var
   limitWidth : Array[0..15] of double;
   arrayTemp : Array[0..30] of double;
   arrayStringTemp : Array[0..30] of String;
   resultTemp : Array[0..30] of String;
   a, b : integer;
   widthNM : integer;
   envi : TGame_Environment_Definition;
begin
        //isi combo box
        frmTacticalDisplay.cbSetScale.Clear;
        with FScenario.GameEnvironment do
        begin
          widthNM := Round(FGameArea.Game_X_Dimension);
        end;

        limitWidth[0] := 0.1;
        limitWidth[1] := 0.2;
        limitWidth[2] := 0.5;
        limitWidth[3] := 1;
        limitWidth[4] := 2;
        limitWidth[5] := 5;
        limitWidth[6] := 10;
        limitWidth[7] := 20;
        limitWidth[8] := 50;
        limitWidth[9] := 100;
        limitWidth[10] := 200;
        limitWidth[11] := 500;
        limitWidth[12] := 1000;
        limitWidth[13] := 1500;
        limitWidth[14] := 2000;
        limitWidth[15] := 2500;

        a := 0;
        while limitWidth[a] < widthNm do
        begin
          arrayTemp[a] := limitWidth[a];
          a := a+1;
        end;
        arrayTemp[a] := widthNm;

        for b := 0 to a do
            arrayStringTemp[b] := floattostr(arrayTemp[b]);

        for b := 0 to a do
        begin
            resultTemp[b] := arrayStringTemp[b];
            frmTacticalDisplay.cbSetScale.Items.Add(resultTemp[b]);
        end;
end;

procedure TSimMgr_Client.GameStart;
begin
  inherited;

  FUpdateThread.OnRunning := FUpdateThread_OnRunning;
  FUpdateThread.Start;
end;


procedure TSimMgr_Client.GamePause;
begin
  inherited;
  FUpdateThread.OnRunning := FUpdateThread_OnPaused;

end;

procedure TSimMgr_Client.InitNetwork;
begin
  VNetClient.RegisterUDPPacket(CPID_PLATFORM_MOVE, SizeOf(TRecPlatformMovement),
     NetRecv_PlatformMovement );

  VNetClient.RegisterUDPPacket(CPID_PLATFORM_LANDDATA,
    SizeOf(TRecPlatfomLandData),
    netRecv_PlatformLandData );

  VNetClient.RegisterUDPPacket(CPID_GAMETIME,
    SizeOf(TRecGameTime),
    netRecv_GameTime);


// - -
  VNetClient.RegisterTCPPacket(CPID_CMD_PLATFORM, SizeOf(TRecCmd_Platform),
    netRecv_platform_cmd);

  VNetClient.RegisterTCPPacket(CPID_CMD_PLATFORM_REPOS, SizeOf(TRecCmd_Platform_MOVE),
    nil); // reposisi


  VNetClient.RegisterTCPPacket(CPID_CMD_SENSOR, SizeOf(TRecCmd_Sensor),
    netRecv_CmdSensor); // radar, sonar, esm

  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_EMBARK, SizeOf(TRecCmd_Embark),
     netRecv_CmdEmbark);

  VNetClient.RegisterTCPPacket(CPID_CMD_SYNCH, SizeOf(TRecCmdSYNCH),
    netRecv_CmdSYNCH);

  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_MISSILE, SizeOf(TRecCmd_LaunchMissile),
    netRecv_CmdLaunchMissile);

  VNetClient.RegisterTCPPacket(CPID_CMD_GUN_FIRE, SizeOf(TRecCmd_GunFire),
    netRecv_CmdGunFire);

  FConnectDelay.Enabled := true;


end;

function TSimMgr_Client.isPIOnGroup(Pi: TObject): boolean;
var i : integer;
  o: TObject;
begin
  result := false;
  for i := 0 to GroupMembers.Count - 1 do begin
    o := GroupMembers[i];

    if o = pi then begin
      result := true;
      break;
    end;
  end;
end;

procedure TSimMgr_Client.StopNetwork;
begin
  FConnectDelay.Enabled := false;

  VNetClient.UnRegisterUDP;
  VNetClient.UnRegisterTCP;


end;

procedure TSimMgr_Client.SetHookedPlatform(Pi: TPlatform_Instance);
begin
  HookedTrack := Pi;
  if Pi <> nil then begin

    // if range ring. center = on hoooked platform then begin
  end;
end;

procedure TSimMgr_Client.OnMapChange(sender: TObject);
var hw, hh: integer;
begin
  FCompass.Width :=   VConvertor.FMap.Width;
  FCompass.Height :=  VConvertor.FMap.Height;

  hw := VConvertor.FMap.Width div 2;
  hh := VConvertor.FMap.Height div 2;

  if Assigned(OwnShipPlatform) then begin
    FRangeRing.mX := OwnShipPlatform.PositionX;
    FRangeRing.mY := OwnShipPlatform.PositionY;
  end
  else begin
    FRangeRing.mX := VConvertor.FMap.CenterX;
    FRangeRing.mY := VConvertor.FMap.CenterY;
  end;

  if Assigned (FOnMapViewChange) then
   FOnMapViewChange(sender);


end;

procedure TSimMgr_Client.OnPlatformNeedDeleted(Sender: TObject);
var i : integer;  
  pi : TPlatform_Instance;
  found : boolean;
begin
  found := false;
  for I := 0 to GroupMembers.Count - 1 do begin
    pi := TPlatform_Instance(GroupMembers[i]);
    if pi = TPlatform_Instance(Sender) then begin
      found := true;
      break;
    end;
  end;
  if found then GroupMembers.Delete(i);
    
  found := false;
  for I := 0 to FScenario.Platform_Insts.Count - 1 do begin
    pi := TPlatform_Instance(FScenario.Platform_Insts[i]);
    if pi = TPlatform_Instance(Sender) then begin
      found := true;
      break;
    end;    
  end;
  if found then FScenario.Platform_Insts.Delete(i);
  
  FObjectCanBeDetectedBySensor.Remove(Sender);

  if ASsigned(pi) then pi.Enable := false;

  //FPlatForms.CleanChildNeedFree;

  frmTacticalDisplay.Refresh_AssumeControl;
end;

procedure TSimMgr_Client.DrawAll(aCnv: TCanvas);
begin
   FPlatForms.UpdateVisual;
   FPlatForms.Draw(aCnv);

   if not ISInstructor then
      DrawAllDetected(aCnv);

   FCompass.DrawCompass(aCnv);

   FRangeRing.ConvertCoord(VConvertor);
   FRangeRing.Draw(aCnv );

   FLineVisual.ConvertCoord(VConvertor);
   FLineVisual.Draw(aCnv);
end;

procedure TSimMgr_Client.DrawAllDetected(aCnv: TCanvas);
var i: integer;
    pi: TPlatform_Instance;
begin
  for I := 0 to Platforms.ChildCount - 1 do
  begin
    pi := Platforms.Childs[i] as TPlatform_Instance;
    pi.DrawDetected(aCnv);
  end;

end;


procedure TSimMgr_Client.LaunchEmbarkPlatform(const rec: TRecCmd_Embark);
begin
  inherited;
  GroupMembers.Add(FEmbarkedPlatform);


end;

procedure TSimMgr_Client.LoadScenarioID(const vSet: TGameDataSetting);
var i, j, k, grpID: Integer;
    pi : TPlatform_Instance;
    fGeo: string;
    cub : TCubicle_Group_Assignment;
    cubG: TCubicle_Group;
    lPI : TIntegerArray;
begin
  inherited;
  FLastPlatformID := 100;
  for I := 0 to FScenario.Platform_Insts.Count - 1 do begin
    pi := FScenario.Platform_Insts.Items[i];
    pi.OnHit := OnPlatformNeedDeleted;

    if FLastPlatformID < pi.FData.Platform_Instance_Index then
      FLastPlatformID := pi.FData.Platform_Instance_Index;
  end;
  FLastPlatformID := FLastPlatformID + 100;

  GroupMembers.Clear;

  if FIsInstructor then begin
    for I := 0 to FScenario.Platform_Insts.Count - 1 do begin
      pi := FScenario.Platform_Insts.Items[i];
      pi.ClientRole := crpInstruktur;
      GroupMembers.Add(pi);

    end;
  end
  else begin
    for I := 0 to FScenario.Platform_Insts.Count - 1 do begin
      pi := FScenario.Platform_Insts.Items[i];
      pi.ClientRole := crpCubicle
    end;

    for I := 0 to length(vCubicalAssignSetting.GroupIDs) - 1 do  begin
      grpID := vCubicalAssignSetting.GroupIDs[i];

      dmTTT.GetCubicle_GroupMemberPlatformID(grpID, lpi);

      for j := 0 to Length(lPI) - 1 do begin

        pi := FindPlatformByID(lPI[j]);
        if pi <> nil then  begin
          GroupMembers.Add(pi);
          pi.ISOnGroup := true;
        end;
      end;
    end;
  end;

  if GroupMembers.Count > 0 then
    OwnShipPlatform := TPlatform_Instance(GroupMembers[0])
  else
    OwnShipPlatform := nil;

  fGeo := vMapSetting.MapPath + FScenario.MapGeosetName;

  if FileExists(fGeo)  then begin
    VSimMap.LoadMap(fGeo);
    if Assigned(OwnShipPlatform) then
      VSimMap.FMap.ZoomTo(50,OwnShipPlatform.PositionX,OwnShipPlatform.PositionY)
    else
      VSimMap.FMap.ZoomTo(50,VSimMap.FMap.CenterX,VSimMap.FMap.CenterY);
  end;

  //set scala
  SetZoomEnc();

end;

procedure TSimMgr_Client.FGameThread_OnRunning(const dt: double);
begin
  inherited;
//  if ClientRole <> crpInstruktur then
    MovePlatformMember(dt);

  VSimMap.DrawMap;


  FConnectDelay.Run(dt);
end;

procedure TSimMgr_Client.FGameThread_OnPaused(const dt: double);
begin

//  VSimMap.DrawMap;
end;

procedure TSimMgr_Client.FUpdateThread_OnTerminate(sender: TObject);
begin

end;

procedure TSimMgr_Client.FOnUpdateDelay(sender: TObject);
begin

  if Assigned(FOnUpdateForm) then
   FOnUpdateForm(self);

end;

procedure TSimMgr_Client.FOnConnectDelay(sender: TObject);
begin
  VNetClient.TryReconnect; // tcp only.

end;

procedure TSimMgr_Client.FUpdateThread_OnRunning(const dt: double);
begin
  FUpdateDelay.Run(dt);
end;

procedure TSimMgr_Client.FUpdateThread_OnPaused(const dt: double);
begin

end;

procedure TSimMgr_Client.NetRecv_PlatformMovement(apRec: PAnsiChar; aSize: Word);
var rec :  ^TRecPlatformMovement;
    pi: TPlatform_Instance;
begin
  rec := @apRec^;
  pi := FindPlatformByID(rec^.PlatformID);

  if pi <> nil then
    pi.SetMovementData(rec^);
end;

procedure TSimMgr_Client.netRecv_PlatformLandData(apRec: PAnsiChar; aSize: Word);
var rec :  ^TRecPlatfomLandData;
    pi: TPlatform_Instance;
begin
  rec := @apRec^;
  pi := FindPlatformByID(rec^.PlatformID);

  if pi = nil then exit;

  with rec^ do begin
    pi.LandCheck(IsOnLand);
    pi.DepthCheck(dAvail, dMin, dMax );
  end;

end;

procedure TSimMgr_Client.netRecv_GameTime(apRec: PAnsiChar; aSize: Word);
var rec: ^TRecGameTime;
begin
  rec := @apRec^;
  FMainVTime.SetMilliSecond(rec^.GameMS);

end;

procedure TSimMgr_Client.netSend_CmdPlatform(const pi_id: Integer;
  const ordID, ordType: Byte; const cmdParam: single);
var rec : TRecCmd_Platform;
begin
  rec.PlatfomID   := pi_id;
  rec.OrderID     := ordID;
  rec.OrderType   := ordType;
  rec.OrderParam  := cmdParam;

  VNetClient.SendCommand(CPID_CMD_PLATFORM, @rec);

end;

procedure TSimMgr_Client.netSend_CmdPlatform_Move(const pi_id: Integer;
  const ordID: Byte; const x, y: double);
var rec : TRecCmd_Platform_MOVE;
begin
  rec.PlatfomID   := pi_id;
  rec.OrderID     := ordID;
  rec.X     := x;
  rec.Y     := y;
//  rec.Z     := z;

  VNetClient.SendCommand(CPID_CMD_PLATFORM_REPOS, @rec);

end;

procedure TSimMgr_Client.netSend_CmdSensor(const pi_id: Integer;
      const sensType: byte; const sensID: integer;
      const ordID, ordParam: byte);
var rec : TRecCmd_Sensor;

begin
  with rec do begin
    SensorType := SensorType;
    PlatformID := pi_id;
    SensorID   := sensID;
    OrderID    := ordID;
    OrderParam := ordParam;
  end;

  VNetClient.SendCommand(CPID_CMD_SENSOR, @rec);
end;

procedure TSimMgr_Client.netRecv_CmdSensor(apRec: PAnsiChar; aSize: Word);
var r : ^TRecCmd_Sensor;
    pi: TPlatform_Instance;
    obj: TObject;
    rdr : TRadar_On_Board;
begin
  r := @apRec^;
  pi := FindPlatformByID(r^.PlatformID);

  if pi = nil then exit;
  r := @apRec^;

  case r^.SensorType of
    CSENSOR_TYPE_RADAR :  begin
       obj := pi.Vehicle.FindRadarByID(r^.SensorID) ;
       if obj = nil then exit;

       case r^.OrderID of
         CORD_ID_ControlMode:
           TRadar_On_Board(obj).ControlMode := TRadarControlMode(r^.OrderParam);

       end;

    end;
    CSENSOR_TYPE_SONAR :begin
       obj := pi.Vehicle.FindSonarByID(r^.SensorID) ;
       if obj = nil then exit;

       case r^.OrderID of
         CORD_ID_ControlMode:
           TSonar_On_Board(obj).ControlMode := TSonarControlMode(r^.OrderParam);

       end;

    end;
    CSENSOR_TYPE_ESM   :begin
       obj := pi.Vehicle.FindESMByID(r^.SensorID) ;
       if obj = nil then exit;

       case r^.OrderID of
         CORD_ID_OperationalStatus:
           TESM_On_Board(obj).OperationalStatus :=
            TESMOperationalStatus(r^.OrderParam);

       end;

    end;
  end;

{
  if Assigned(FOnReceivedSensorCommand) then
   FOnReceivedSensorCommand(s);

}

end;

function TSimMgr_Client.GetSerialPlatformID: Integer;
begin
  Result := FLastPlatformID;
  Inc(FLastPlatformID);

end;

procedure TSimMgr_Client.netSend_CmdLaunch_Embark(
     const r: TRecCmd_Embark);
begin
  VNetClient.SendCommand(CPID_CMD_LAUNCH_EMBARK, @r );

end;

procedure TSimMgr_Client.netSend_CmdLaunch_Missile(
     const r: TRecCmd_LaunchMissile);
begin

   VNetClient.SendCommand(CPID_CMD_LAUNCH_MISSILE, @r );
end;

procedure TSimMgr_Client.netSend_CmdGunFire( const r: TRecCmd_GunFire);
begin
   VNetClient.SendCommand(CPID_CMD_GUN_FIRE, @r);
end;
procedure TSimMgr_Client.netRecv_CmdEmbark(apRec: PAnsiChar; aSize: Word);
var aRec: ^TRecCmd_Embark;
begin
  aRec := @apRec^;
  LaunchEmbarkPlatform(aRec^ );
end;

procedure TSimMgr_Client.netRecv_CmdSYNCH(apRec: PAnsiChar; aSize: Word);
var aRec: ^TRecCmdSYNCH;
begin
  aRec := @apRec^;

  case aRec^.SynchID of
    CORD_ID_Synch_NextPID : begin
      FLastPlatformID := aRec^.Synch_IParam;

    end;

  end;

end;

procedure TSimMgr_Client.netRecv_CmdLaunchMissile(apRec: PAnsiChar; aSize: Word);
var aRec: ^TRecCmd_LaunchMissile;
begin
  aRec := @apRec^;
  LaunchMissile(aRec^);

end;
procedure TSimMgr_Client.netRecv_CmdGunFire(apRec: PAnsiChar; aSize: Word);
var aRec: ^TRecCmd_GunFire;
begin
  aRec := @apRec^;

  GunFire(aRec^);
end;

end.
