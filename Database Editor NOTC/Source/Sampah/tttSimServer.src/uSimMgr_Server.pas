// ini komentar
unit uSimMgr_Server;

interface

uses
   Classes, SysUtils,
   uSteppers, uLibSettingTTT,
   uThreadTimer, uVirtualTime, uSimContainers, uT3simManager,
   uDBAssetObject ;

type

//==============================================================================

//==============================================================================
// TTT simCenter
// contain: 'session' , scenario management,  objects run..
//
//==============================================================================

  TSimMgr_Server = class(TT3SimManager)
  protected //thread  procedures

    procedure FGameThread_OnRunning(const dt: double); override;
    procedure FGameThread_OnPaused(const dt: double); override;
  private
    procedure setBroadcastData(const Value: boolean);
    function getBroadcastData: boolean;


  protected //networks procedures
    FNetSender : TDelayer;

    FDepthChecker : TDelayer;

    // send UDP
    procedure NetSend_MovementData(sender: TObject);

    //received TCP
    procedure netRecv_platform_cmd(apRec: PAnsiChar; aSize: Word); override;
    procedure netRecv_CmdPlatform_Move(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_CmdSensor(apRec: PAnsiChar; aSize: Word);

    procedure netRecv_CmdEmbark(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_CmdSYNCH(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_CmdLaunchMissile(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_CmdGunFire(apRec: PAnsiChar; aSize: Word);

    procedure DepthChecker_OnDepthCheck(sender: TObject);

  public

    constructor Create;
    destructor Destroy; override;

    procedure GameStart; override;
    procedure GamePause; override;

    procedure InitNetwork; override;
    procedure StopNetwork;  override;

    procedure PrepareNewScenario;
    procedure ClearScenario;

    procedure PlayScenario; // resume
    procedure PauseScenario;

    procedure LoadScenarioID(const vSet: TGameDataSetting); override;
    // map fix dulu
    //procedure SetMap(const mGeoset: string);

    //public scenario
    procedure FNetServerOnClientConnect(const S: string);
    procedure FNetServerOnClientDisConnect(const S: string);

  public
    property BroadcastData: boolean read getBroadcastData write setBroadcastData;




  end;

const

  CTTT_defmap = 'maps\mapdata.gst';

var
  simMgrServer: TSimMgr_Server;

implementation

uses
  uNetHandle_Server, uGameData_TTT, uMapXhandler, uMapXData, uTCPDatatype;
{ TSimMgr_Server }


constructor TSimMgr_Server.Create;
begin
  inherited;

  FNetSender := TDelayer.Create;
  FNetSender.Enabled := false;
  FNetSender.OnTime := NetSend_MovementData;
  FNetSender.DInterval := 4.0;

  FDepthChecker := TDelayer.Create;
  FDepthChecker.Enabled := False;
  FDepthChecker.DInterval   := 2.0;
  FDepthChecker.OnTime      := DepthChecker_OnDepthCheck;

end;

destructor TSimMgr_Server.Destroy;
begin

  inherited;
end;

procedure TSimMgr_Server.setBroadcastData(const Value: boolean);
begin
  FNetSender.Enabled := Value;
end;

function TSimMgr_Server.getBroadcastData: boolean;
begin
  result := FNetSender.Enabled;
end;

procedure TSimMgr_Server.FGameThread_OnRunning(const dt: double);
begin
  //send data.
  inherited;
  FDepthChecker.Run(dt);

  FNetSender.Run(dt);
end;

procedure TSimMgr_Server.FNetServerOnClientConnect(const S: string);
var rSyn: TRecCmdSYNCH;
begin
  rSyn.SynchID        := CORD_ID_Synch_NextPID;
  rSyn.Synch_IParam   := FLastPlatformID;

  VNetServer.SendTo(CPID_CMD_SYNCH, @rSyn, s);

  FOnLogStr('Online: ' + s);
end;


procedure TSimMgr_Server.FNetServerOnClientDisConnect(const S: string);
begin
  FOnLogStr('Offline: ' + s);
end;

procedure TSimMgr_Server.FGameThread_OnPaused(const dt: double);
begin

end;

procedure TSimMgr_Server.NetSend_MovementData(sender: TObject);
var i : integer;
    rec:  TRecPlatformMovement;
    pi : TPlatform_Instance;
    rGT: TRecGameTime;
begin
//  FOnLogStr('Broadcast movement data and GT');

  for i := 0 to FPlatForms.ChildCount - 1 do begin
    pi := FPlatForms.Childs[i] as TPlatform_Instance;
    rec := pi.GetMovementData;

    VNetServer.SendBroadcast_UDP_Data(CPID_PLATFORM_MOVE, @rec);
  end;

  rGT.ServerTime  := Now;
  rGT.GameMS      := FMainVTime.GetMillisecond;
  rGT.GameTime    := FMainVTime.GetTime;
  rGT.GameStart   := FMainVTime.DateTimeOffset;

  VNetServer.SendBroadcast_UDP_Data(CPID_GAMETIME, @rGT);
end;


procedure TSimMgr_Server.InitNetwork;
begin
//   VNetServer.RegisterPacket(CPID_PLATFORM_MOVE, SizeOf(TRecPlatformMovement),
//     NetOn_PlatformMovement );
  FNetSender.DCounter := 0;
  FNetSender.DInterval := vNetServerSetting.SendInterval;

//>> UDP SECTION
  VNetServer.RegisterUDPPacket(CPID_PLATFORM_MOVE,
    SizeOf(TRecPlatformMovement),
    nil );

  VNetServer.RegisterUDPPacket(CPID_PLATFORM_LANDDATA,
    SizeOf(TRecPlatfomLandData),
    nil );

  VNetServer.RegisterUDPPacket(CPID_GAMETIME,
    SizeOf(TRecGameTime),
    nil);


//>> TCP Section

  VNetServer.RegisterTCPPacket(CPID_CMD_PLATFORM,
    SizeOf(TRecCmd_Platform),
    netRecv_platform_cmd);

  VNetServer.RegisterTCPPacket(CPID_CMD_PLATFORM_REPOS,
    SizeOf(TRecCmd_Platform_MOVE),
    netRecv_CmdPlatform_Move);

  VNetServer.RegisterTCPPacket(CPID_CMD_SENSOR, SizeOf(TRecCmd_Sensor),
    netRecv_CmdSensor); // radar, sonar, esm
//
  VNetServer.RegisterTCPPacket(CPID_CMD_LAUNCH_EMBARK, SizeOf(TRecCmd_Embark),
     netRecv_CmdEmbark);

  VNetServer.RegisterTCPPacket(CPID_CMD_SYNCH, SizeOf(TRecCmdSYNCH),
    netRecv_CmdSYNCH);

  VNetServer.RegisterTCPPacket(CPID_CMD_LAUNCH_MISSILE, SizeOf(TRecCmd_LaunchMissile),
    netRecv_CmdLaunchMissile);

  VNetServer.RegisterTCPPacket(CPID_CMD_GUN_FIRE, SizeOf(TRecCmd_GunFire),
    netRecv_CmdGunFire);


end;

procedure TSimMgr_Server.netRecv_platform_cmd(apRec: PAnsiChar; aSize: Word);
var pid: ^TPacketID;
    sIP: string;
begin
  pid := @apRec^;
  sIP := LongIp_To_StrIp(pid^.ipSender);
  FOnLogStr(sIP + 'CPID_CMD_PLATFORM' );

  inherited;


  VNetServer.SendAlmostBroadcastCommand(CPID_CMD_PLATFORM, apRec, sIP);
end;

procedure TSimMgr_Server.netRecv_CmdPlatform_Move(apRec: PAnsiChar; aSize: Word);
var rec: ^TRecCmd_Platform_Move;
    p: TPlatform_Instance;
begin
  rec := @apRec^;
  FOnLogStr('CORD_ID_REPOS' );

  p := FindPlatformByID(rec^.PlatfomID);
  if p <> nil then begin
    if rec^.OrderID = CORD_ID_REPOS then
      p.RepositionTo(rec^.X, rec^.Y);
  end;
end;

procedure TSimMgr_Server.netRecv_CmdSensor(apRec: PAnsiChar; aSize: Word);
var pid: ^TPacketID;
    sIP: string;
begin
  pid := @apRec^;
  sIP := LongIp_To_StrIp(pid^.ipSender);
  FOnLogStr('CPID_CMD_SENSOR' );

  VNetServer.SendAlmostBroadcastCommand(CPID_CMD_SENSOR, apRec, sIP);
//  VNetServer.SendBroadcastCommand(CPID_CMD_SENSOR, apRec);

end;

procedure TSimMgr_Server.netRecv_CmdEmbark(apRec: PAnsiChar; aSize: Word);
var rEmb: ^TRecCmd_Embark;
    sIP: string;
    rSyn: TRecCmdSYNCH;

begin
  rEmb := @apRec^;
  sIP := LongIp_To_StrIp(rEmb.pid.ipSender);

  if Assigned(FOnLogStr) then begin
    FOnLogStr('receive  CPID_CMD_LAUNCH_EMBARK from ' + sIP);

    FOnLogStr(' parent pid' + InttoSTr(rEmb.ParentPlatformID));
    FOnLogStr(' this pid  ' + InttoSTr(rEmb.EmbarkPlaformID));
    FOnLogStr(' hosted    ' + InttoSTr(rEmb.Hosted_Index));
    FOnLogStr(' speed     ' + FloatToStr(rEmb.InitSpeed));
    FOnLogStr(' course    ' + FloatToStr(rEmb.InitCourse));
    FOnLogStr(' altitud   ' + FloatToStr(rEmb.InitAltitude));
  end;

  VNetServer.SendAlmostBroadcastCommand(CPID_CMD_LAUNCH_EMBARK, apRec, sIP);

  FLastPlatformID := rEmb^.EmbarkPlaformID;
  FOnLogStr('   embark last ID ' +  IntToStr(FLastPlatformID));

  inc(FLastPlatformID);

  rSyn.SynchID        := CORD_ID_Synch_NextPID;
  rSyn.Synch_IParam   := FLastPlatformID;

  VNetServer.SendBroadcastCommand(CPID_CMD_SYNCH, @rSyn);

  LaunchEmbarkPlatform(rEmb^ );
  FOnLogStr('  LaunchEmbarkPlatform');

end;

procedure TSimMgr_Server.netRecv_CmdSYNCH(apRec: PAnsiChar; aSize: Word);
begin
// walah.. kok dikirimi... ga usah repot-repot.. server aja yg ngirim...

end;

procedure TSimMgr_Server.netRecv_CmdLaunchMissile(apRec: PAnsiChar; aSize: Word);
var r: ^TRecCmd_LaunchMissile;
    sip: string;
begin
  r := @apRec^;
  LaunchMissile( r^) ;
  sip :=  LongIp_To_StrIp(r^.pid.ipSender);

  FOnLogStr(sip +  'CPID_CMD_LAUNCH_MISSILE');
  VNetServer.SendAlmostBroadcastCommand(CPID_CMD_LAUNCH_MISSILE , apRec, sIP);
end;

procedure TSimMgr_Server.netRecv_CmdGunFire(apRec: PAnsiChar; aSize: Word);
var r: ^TRecCmd_GunFire;
    sip: string;
begin
  r := @apRec^;
  FOnLogStr(sip +  ' CPID_CMD_GUN_FIRE' );

  GunFire(r^);

  sip :=  LongIp_To_StrIp(r^.pid.ipSender);
  VNetServer.SendAlmostBroadcastCommand(CPID_CMD_GUN_FIRE , apRec, sIP);

end;

procedure TSimMgr_Server.DepthChecker_OnDepthCheck(sender: TObject);
var i: integer;
    pi: TPlatform_Instance;
    obj : TObject;
    x, y: double;
    draft, dMin, dMax : double;
    isLand, depthAvail: boolean;

    rec : TRecPlatfomLandData;
begin

  for I := 0 to Platforms.ChildCount - 1 do begin
    obj :=  Platforms.Childs[i];
    if obj is TPlatform_Instance then begin
      pi := TPlatform_Instance(obj);
      x := pi.PositionX;
      y := pi.PositionY;
      isLand := VMapData.GetMapLand(x, y);

      pi.LandCheck(isLand);

      rec.PlatformID := pi.FData.Platform_Instance_Index;
      rec.IsOnLand   := isLand;

      if island then begin
        //getElev
        //rec.elev
      end
      else begin
        depthAvail := VMapData.GetMapDepth(x, y, dMin, dMax);
        try
          pi.DepthCheck(depthAvail, dMin, dMax);

        except
            depthAvail := false;

        end;

        rec.dAvail := depthAvail;
        if depthAvail then begin
          rec.dMin := dMin;
          rec.dMax := dMax;
        end
        else begin
          rec.dMin := 0;
          rec.dMax := 0;
        end;
      end;

      VNetServer.SendBroadcast_UDP_Data(CPID_PLATFORM_LANDDATA, @rec );
    end;
  end;
end;


procedure TSimMgr_Server.StopNetwork;
begin
  VNetServer.UnRegisterAllPacket;
end;

procedure TSimMgr_Server.GameStart;
begin
  inherited;

end;


procedure TSimMgr_Server.GamePause;
begin

  inherited;
end;

procedure TSimMgr_Server.PrepareNewScenario;
begin
  FMainVTime.Reset();

end;


procedure TSimMgr_Server.ClearScenario;
begin
  FGameThread.OnRunning := nil;
  FMainList.ClearAndFreeObject;
  FMainVTime.Reset();

end;

procedure TSimMgr_Server.PlayScenario;
begin
  FGameThread.Resume;
end;

procedure TSimMgr_Server.PauseScenario;
begin
  FGameThread.Suspend;
end;


procedure TSimMgr_Server.LoadScenarioID(const vSet: TGameDataSetting);
var fGeo: string;
    i : integer;
    pi : TPlatform_Instance;
begin
  inherited;
  FLastPlatformID := 100;
  for I := 0 to FScenario.Platform_Insts.Count - 1 do begin
    pi := FScenario.Platform_Insts.Items[i];

    if FLastPlatformID < pi.FData.Platform_Instance_Index then
      FLastPlatformID := pi.FData.Platform_Instance_Index;
  end;
  FLastPlatformID := FLastPlatformID + 100;

  FDepthChecker.Enabled := True;

end;



end.
