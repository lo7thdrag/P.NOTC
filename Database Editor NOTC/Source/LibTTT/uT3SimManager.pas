unit uT3SimManager;

interface

uses
   MapXLib_TLB,
   Classes, SysUtils, Graphics,
     uThreadTimer, uVirtualTime,
     uLibSettingTTT,uDBGame_Defaults,
     uDBScenario,  uDBAsset_Weapon,
     uSimManager , uSimObjects, uDBAssetObject,
     uDBAsset_GameEnvironment, uDBRainfall, uDBCloud_Effect,
     uDBDefault_Var, uSimContainers, tttData,uT3GroupList,
     uGameData_TTT;

type

  TT3SimManager = class(TSimManager)

  protected

    FScenario     : tT3DBScenario;

    FPlatForms    : TSimObjectNode;

    FGameDefault  : TGame_Defaults;
    FRainfall     : TRainfall;
    FCloud_Effects: TCloud_Effects;
    FDefault_Var  : TDefault_Var;


    FGroupList    : T3GroupList;

    FMyIPAddress,
    FMyCubicleName,
    FMyConsoleName : string;
    FIsInstructor  : boolean;

    FClientRole: integer;
    FEmbarkedPlatform : TPlatform_Instance;
    FLastPlatformID: Integer;

    procedure SetClientRole(const Value: integer);


    procedure FGameThread_OnTerminate(sender: TObject);
    procedure FGameThread_OnRunning(const dt: double); virtual;
    procedure FGameThread_OnPaused(const dt: double); virtual;

    procedure MovePlatformMember(const dt: double);

  protected
    FOnLogStr: TGetStrProc;

    //network procedures.
    procedure netRecv_platform_cmd(apRec: PAnsiChar; aSize: Word); virtual;

    procedure LaunchEmbarkPlatform(const rec : TRecCmd_Embark ); virtual;
    procedure LaunchMissile(const rec: TRecCmd_LaunchMissile ); virtual;
    procedure GunFire(const rec: TRecCmd_GunFire);

  public
    GameEnvironment : TGame_Environment_Definition;
    CubicleGroupList   : TList;
    FObjectCanBeDetectedBySensor : TSimContainer;

    function FindPlatformByID(const id: integer): TPlatform_Instance;
    function FindNearestPlatform(const px, py: double;
      const maxDist: integer): TPlatform_Instance;
    function FindNearestTrack(const px, py: double;
       const maxDist: integer): TSimObject;

    function FindMissileByID(const id: integer): TMissile_On_Board;

  public
    constructor Create;
    destructor Destroy; override;

    procedure ApplySetting; virtual;

    procedure ResetScenario;   override;

    procedure LoadScenarioID(const vSet: TGameDataSetting); virtual;

    procedure GameStart; override;
    procedure GamePause; override;

    procedure InitNetwork; virtual;
    procedure StopNetwork;  virtual;
    property ClientRole : integer  read FClientRole write SetClientRole;

    property Platforms : TSimObjectNode read FPlatForms;
    property Scenario : tT3DBScenario read FScenario;

    property CubicleName: string read FMyCubicleName;

    property ConsoleName: string read FMyConsoleName;
    property ISInstructor: Boolean read FIsInstructor;

    property OnLogStr: TGetStrProc read FOnLogStr write FOnLogStr;
end;



implementation

 uses
   uNetBaseSocket, uCoordConvertor,
   uDBAsset_Vehicle, uDataModuleTTT;

{ TT3SimManager }

constructor TT3SimManager.Create;
begin
  inherited;
  FGameThread.Interval := 50;

  FScenario       := tT3DBScenario.Create;
  FPlatForms      := TSimObjectNode.Create;

  FGameDefault    := TGame_Defaults.Create;
  FRainfall       := TRainfall.Create;
  FCloud_Effects  := TCloud_Effects.Create;
  FDefault_Var    := TDefault_Var.Create;

  GameEnvironment := nil;
  FObjectCanBeDetectedBySensor := TSimContainer.Create;
  FClientRole := crpInstruktur;  // default
  FGroupList := T3GroupList.Create;


end;

destructor TT3SimManager.Destroy;
begin


  FGroupList.Free;

  FPlatForms.Free;    // and free all the childs.

  FScenario.Free;
  FGameDefault.Free;
  FRainfall.Free;
  FCloud_Effects.Free;
  FDefault_Var.Free;

  inherited;
end;

procedure TT3SimManager.ApplySetting;
var i: integer;
    ss: TStrings;
    found: boolean;
    ip,host: string;
begin
//  FPortSession := IntTostr(vNetSetting.SessionPort);
  FMyIPAddress := '';

  FGroupList.LoadFromFile(vGameDataSetting.GroupSetting);

  ss := TStringList.Create;
  if GetHostandIPList(host, ss) then begin
    I := 0;
    found := false;
    while not found and (i< ss.Count) do begin
      ip := ss[i];
      found := FGroupList.IsGroupMember(ip);

      inc(i);
    end;
    if found then begin
      FMyIPAddress   := ip;
      FIsInstructor  := FGroupList.IsController(FMyIPAddress);
      FMyConsoleName := FGroupList.GetConsoleName(FMyIPAddress);
      FMyCubicleName := FGroupList.GetCubicleName(FMyIPAddress);

      if FIsInstructor then
        FClientRole := crpInstruktur
      else
        FClientRole := crpCubicle;

    end;
  end;

  ss.Free;
end;

procedure TT3SimManager.FGameThread_OnTerminate(sender: TObject);
begin

end;

procedure TT3SimManager.FGameThread_OnPaused(const dt: double);
begin
//
end;

procedure TT3SimManager.FGameThread_OnRunning(const dt: double);
begin // d
  FMainVTime.IncreaseMillisecond(dt * 1000.0 );

  FPlatForms.Move(dt);

  FPlatForms.CleanChildNeedFree;
end;

procedure TT3SimManager.GamePause;
begin
  inherited;
  FGameThread.OnRunning := FGameThread_OnPaused;

end;

procedure TT3SimManager.GameStart;
begin
  inherited;
  FGameThread.OnRunning := FGameThread_OnRunning;

  FGameThread.Start;
end;


procedure TT3SimManager.ResetScenario;
begin
  inherited;

  FPlatForms.ClearChilds; // clear only, did not free it;
end;


procedure TT3SimManager.LoadScenarioID(const vSet: TGameDataSetting);
var i   : Integer;
    pi  : TPlatform_Instance;
begin
//  ResetScenario;
  FScenario.LoadFromDB(vSet.ScenarioID);

  FMainVTime.Reset(0);
  FMainVTime.DateTimeOffset := FScenario.Resource_alloc.FData.Game_Start_Time;


  for I := 0 to FScenario.Platform_Insts.Count - 1 do begin

    pi := FScenario.Platform_Insts.Items[i];
    FPlatForms.AddChild(pi);

    FObjectCanBeDetectedBySensor.AddObject(pi);
    pi.DetectedList(FObjectCanBeDetectedBySensor);

    if  pi.FData.Platform_Instance_Index = vSet.OwnShipPlatfomID then begin
      pi.Controlled := true;
      pi.Activated := true;
    end;
  end;

  GameEnvironment  := FScenario.GameEnvironment;
  CubicleGroupList := FScenario.CubiclesGroups;    // all cubicle groups
  FGameDefault.LoadFromGame(FScenario.ResourceAllocIndex);

  FGameDefault.LoadFromGame(FScenario.ResourceAllocIndex);
  FRainfall.LoadFromRainfall();
  FCloud_Effects.LoadFromCloudEffects();
  FDefault_Var.LoadFromDatabase();
end;


procedure TT3SimManager.MovePlatformMember(const dt: double);
var i: Integer;
   pi: TPlatform_Instance;
begin
  for I := 0 to Platforms.ChildCount - 1 do
  begin
    pi := Platforms.Childs[i] as TPlatform_Instance;

    try
      //idx := pi.FData.Platform_Instance_Index;

      pi.MoveMember(dt);
    finally
    end;


  end;

end;

function TT3SimManager.FindPlatformByID(const id: integer): TPlatform_Instance;
var i, c: Integer;
    pi : TPlatform_Instance;
    f: boolean;
begin
  f := false;
  pi := nil;
  I := 0;
  c := FScenario.Platform_Insts.Count;

  while not f and (i < c) do begin
    pi := FScenario.Platform_Insts.Items[i];
    f := (pi.FData.Platform_Instance_Index = id);
    inc(i);
  end;

  if f then
    result := pi
  else
    result := nil;

end;

function TT3SimManager.FindNearestPlatform(const px, py: double;
  const maxDist: integer): TPlatform_Instance;
var i, c: Integer;
    pi : TPlatform_Instance;
    rr : Integer;
    m, r: double;
    ctx, cty: integer;
    ptx, pty: integer;
begin
  I := 0;

  c := FScenario.Platform_Insts.Count;

  VConvertor.ConvertToScreen(px, py, ctx, cty);
  m := 1000000.0;
  result := nil;


  for i := 0 to FScenario.Platform_Insts.Count - 1 do begin

    pi := FScenario.Platform_Insts.Items[i];
    VConvertor.ConvertToScreen(pi.PositionX, pi.PositionY, ptx, pty);

    try
	    rr := sqr(ptX - ctx) + sqr(ptY - ctY);
	    if rr = 0 then
	      r := 10000
	    else
	      r := Sqrt(rr);
    except
      r := 10000;
    end;


    if (r < m) and (r < maxDist) then begin
      m := r;
      result := pi;
    end;
  end;
end;

 function TT3SimManager.FindNearestTrack(const px, py: double;
  const maxDist: integer): TSimObject;
var
    i: Integer;
    pi : TSimObject;
    rr : Integer;
    m, r: double;
    ctx, cty: integer;
    ptx, pty: integer;
    found : boolean;
begin
  VConvertor.ConvertToScreen(px, py, ctx, cty);
  m := 1000000.0;
  result := nil;
  found := false;

  // for platforms
  for i := 0 to FScenario.Platform_Insts.Count - 1 do
  begin
    pi := FScenario.Platform_Insts.Items[i];
    if Assigned(pi.Parent) then
      continue;

    if pi.FreeMe then
      continue;

    VConvertor.ConvertToScreen(pi.getPositionX, pi.getPositionY, ptx, pty);
	  try
	    rr := sqr(ptX - ctx) + sqr(ptY - ctY);
	    if  rr = 0 then
	      r := 10000
	    else
	       r := Sqrt(Abs(rr)); //add mamik 29032012
    except
      r := 10000;
    end;

    if (r < m) and (r < maxDist) then begin
      m := r;
      result := pi;
      found := true;
      break;
    end;
  end;
end;

function TT3SimManager.FindMissileByID(const id: integer): TMissile_On_Board;
 begin
   Result := nil;
 end;

procedure TT3SimManager.InitNetwork;
begin
  // some of register packet
end;

procedure TT3SimManager.SetClientRole(const Value: integer);
begin
  FClientRole := Value;
end;

procedure TT3SimManager.StopNetwork;
begin
 // unregister all packet
end;

procedure TT3SimManager.netRecv_platform_cmd(apRec: PAnsiChar; aSize: Word);
var rec: ^TRecCmd_Platform;
    p: TPlatform_Instance;
begin
  rec := @apRec^;
  // if rec^.SessionID <>  FGameSession.SessionID  then Exit;

  p := FindPlatformByID(rec^.PlatfomID);

  if  p = nil then Exit;
  case rec^.OrderID of
    CORD_ID_MOVE: begin
      case rec^.OrderType of
        CORD_TYPE_SPEED: begin
          p.OrderedSpeed := rec^.OrderParam;

        end;
        CORD_TYPE_COURSE: begin
          p.OrderedHeading := rec^.OrderParam;

        end;
        CORD_TYPE_ALTITUDE:
          p.OrderedAltitude := rec^.OrderParam;
      end;
    end;
    CORD_ID_ACTIVATION : begin
      p.FActivation.Init_Guidance_Type := rec^.OrderType;
    end;

  end;

end;

procedure TT3SimManager.LaunchEmbarkPlatform(const rec : TRecCmd_Embark);
var
   vDef : TVehicle_Definition;
   papi: TPlatform_Instance;
   hostPlatform : THosted_Platform;
   vIndex: integer;

begin
// vDef := TVehicle_Definition.Create;
  papi := FindPlatformByID(rec.ParentPlatformID);

  vDef := TVehicle_Definition.Create;

  if (rec.Hosted_Index < 0)
    or (rec.Hosted_Index >= papi.Vehicle.Hosted_Platform.Count) then exit;

  hostPlatform := papi.Vehicle.Hosted_Platform[rec.Hosted_Index];
  dmTTT.GetVehicle_Definition(hostPlatform.FData.Hosted_Vehicle_Index,
    vDef);

  hostPlatform.FData.Quantity := hostPlatform.FData.Quantity - 1;

  if hostPlatform.FData.Quantity = 0 then
    papi.Vehicle.Hosted_Platform.Remove(hostPlatform);


  FEmbarkedPlatform := TPlatform_Instance.Create;
  FEmbarkedPlatform.Activated := false;
  with FEmbarkedPlatform do begin
    Vehicle := vDef;
    FData.Track_ID := Rec.TrackIdent;
    FData.Platform_Instance_Index := rec.EmbarkPlaformID;
    FData.Instance_Name := rec.LaunchName;
  end;

//---
  Platforms.AddChild(FEmbarkedPlatform);
  Scenario.Platform_Insts.Add(FEmbarkedPlatform);

  FObjectCanBeDetectedBySensor.AddObject(FEmbarkedPlatform);

  with FEmbarkedPlatform do begin
    FActivation.Init_Position_Longitude := papi.PositionX;
    FActivation.Init_Position_Latitude  := papi.PositionY;
    FActivation.Init_Course             := 0;
    FActivation.Init_Altitude           := 0;
    FActivation.Init_Ground_Speed       := 0;
    Activated := true;

    //vIndex := FData.Vehicle_Index;
    vIndex := hostPlatform.FData.Hosted_Vehicle_Index;

    dmTTT.GetVehicle_Definition(vIndex, Vehicle);
    dmTTT.GetMotion_Characteristics(Vehicle.FData.Motion_Characteristics, Motion);

    //sensor
    dmTTT.getAllEO_On_Board(vIndex,0,             Vehicle.EOSensors);
    dmTTT.getAllESM_On_Board(vIndex,0,            Vehicle.ESMSensors);
    dmTTT.getAllIFF_Sensor_On_Board(vIndex,0,     Vehicle.IFFSensors);
    dmTTT.getAllMAD_Sensor_On_Board(vIndex,0,     Vehicle.MADSensors);
    dmTTT.getAllVisual_Sensor_On_Board(vIndex,0,  Vehicle.Visualsensors);
    dmTTT.getAllFCR_On_Board(vIndex,              Vehicle.FCRSensors);

    dmTTT.GetAllRadar_On_Board(vIndex,0, Vehicle.Radars);
    dmTTT.GetAllSonar_On_Board(vIndex,0, Vehicle.Sonars);

    //weapon fit on Board
    dmTTT.getAllMissile_OnBoard(vIndex,0,   Vehicle.Missiles  );
    dmTTT.getAllTorpedo_OnBoard(vIndex,0,   Vehicle.Torpedos  );
    dmTTT.GetHybrid_Definition(vIndex,      Vehicle.Hybrids   );
    dmTTT.getAllMines_OnBoard(vIndex,0 ,    Vehicle.Mines );
    dmTTT.GetAllBomb(vIndex,                Vehicle.Bombs);
    dmTTT.GetAllGun(vIndex,                 Vehicle.Guns);

    dmTTT.getAllAcoustic_Decoy_On_Board(vIndex,     Vehicle.Acoustic_Decoys);
    dmTTT.getAllAir_Bubble_Mount(vIndex,            Vehicle.Air_Bubble_Mount);
    dmTTT.getAllChaff_On_Board(vIndex,              Vehicle.Chaffs);
    dmTTT.getAllChaff_Launcher_On_Board(vIndex,     Vehicle.Chaff_Launchers);
    dmTTT.getAllDefensive_Jammer_On_Board(vIndex,   Vehicle.Defensive_Jammers);
    dmTTT.getAllFloating_Decoy_On_Board(vIndex,     Vehicle.Floating_Decoys);
    dmTTT.getAllInfrared_Decoy_On_Board(vIndex,     Vehicle.Infrared_Decoys);
    dmTTT.getAllJammer_On_Board(vIndex,             Vehicle.Jammers);
    dmTTT.getAllPoint_Effect_On_Board(vIndex,       Vehicle.Point_Effects);
    dmTTT.getAllTowed_Jammer_Decoy_On_Board(vIndex, Vehicle.Towed_Jammer_Decoys);
    dmTTT.getHosted_Platform(vIndex,0,              Vehicle.Hosted_Platform);
    dmTTT.getAllSonobuoy_On_Board(vIndex,0,         Vehicle.Sonobuoy );

    InitData;
  end;

//  frmTacticalDisplay.RefreshTrackList;
end;

procedure TT3SimManager.LaunchMissile(const rec: TRecCmd_LaunchMissile );
var pi, tgt: TPlatform_Instance;
    mis: TMissile_On_Board;
begin
   pi := FindPlatformByID(rec.ParentPlatformID);
   tgt := FindPlatformByID(rec.TargetPlatformID);

   if pi = nil then
     exit;

   mis := pi.FindMissileByID(rec.MissileID) as TMissile_On_Board ;
   if mis <> nil then begin
     mis.TargetObject := tgt;
     mis.Launched := true;
   end;

end;

procedure TT3SimManager.GunFire(const rec: TRecCmd_GunFire);
var pi, tgt: TPlatform_instance;
    wpn : TGun_Definition;
begin
  //FOnLogStr('  start gun fire' );

  pi  := FindPlatformByID(rec.ParentPlatformID);
  tgt := FindPlatformByID(rec.TargetPlatformID);


  if pi = nil then
    exit;
{  FOnLogStr('    shooter: '  + pi.FData.Instance_Name );
  if tgt <> nil then
    FOnLogStr('    target: '  + tgt.FData.Instance_Name )
  else
    FOnLogStr('    target is NIL');
}

   wpn := pi.Vehicle.FindWeaponGunByID(rec.GunID) as TGun_Definition;

//    FOnLogStr('    weapon is ' + wpn.FData.Gun_Identifier);

  if wpn <> nil then begin
    wpn.TargetObject := tgt;
    wpn.Mode        := rec.ControlMode;
    wpn.SalvoMode   := rec.SalvoMode;
    wpn.SalvoSize   := rec.SalvoSize;

    case rec.OrderID of
      CORD_ID_assign : ;
      CORD_ID_break  : ;
      CORD_ID_fire   : begin

        wpn.Shoot;
        FOnLogStr('    shoot' );

      end;
      CORD_ID_cease  : ;
    end;
  end;
//  FOnLogStr('  end of gun fire' );

end;

end.

