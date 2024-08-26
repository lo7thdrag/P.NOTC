unit uT3ReplayClient;

interface

uses
  MapXLib_TLB, uMapXHandler, tttData, uCompassVisual, uObjectVisuals,
  uCoordConvertor, uT3GroupList, uT3Unit, uT3Vehicle, uT3Sensor, Windows,
  uT3DetectedTrack, uDataModuleTTT, uLibSettingTTT, uT3SimManager, Graphics,
  ufMainDisplay, SysUtils, Classes, uNewReplay, uGameData_TTT,
  uT3DataLink, uReplayDataType, uThreadTimer, uSteppers, uT3UnitContainer,
  uDBCubicles, uSimObjects, uT3Weapon, uBaseCoordSystem, uDBAsset_Scripted,
  uDBAsset_Vehicle, uDBAssetObject,uT3DefensiveJammer;

type

  TT3ReplayClient = class(TT3SimManager)
  private
    FSimMap             : TSimMap;

    fGeo                : String;
    fOver               : string;
    FOnLogStr           : TLogStrProc;

    FTrackNumber        : integer;
    FCurrentPerspective : integer;
    FTrackNumberWeapon  : integer;
    FOnJumpTo           : TEventJumpToTime;
    ListPlatformSelect  : TList;

    SubEnviArea : TSubEnvironmentArea;

    procedure DrawAll(aCnv: TCanvas);
    procedure CreateSimMap;
    procedure CreateDisplay;
    procedure CreateCompass;
    procedure CreateRangeRings;
    procedure CreateLineVisual;

    procedure OnMapChange(sender: TObject);

    procedure SetOnLogStr(const Value: TLogStrProc);
    procedure SetCurrentPerspective(const Value: integer);

    { from client }
    function findDetectedTrack(aObj: TSimObject): TSimObject;
    function FindESMByTrackNumber(const number: String): TT3EsmTrack;
    procedure SetOnJumpTo(const Value: TEventJumpToTime);

    procedure RemoveDatalinkPlatform(rec : TRecCmd_SelectPlatformToRemove); overload;
    procedure RemoveDatalinkPlatform(aPfID: integer); overload;
    procedure OnTrackBlinking(sender: TObject; Value: Boolean);
    function FindESMByDetectedTrack(const number: String; aTrack: TSimObject)
             : TT3EsmTrack;

  protected
    FCompass      : TCompassVisual;
    FRangeRing    : TRangeRingsVisual;
    FLineVisual   : TLineVisual;
    function LaunchEmbarkPlatform(const rec: TRecCmd_Embark)
      : TT3PlatformInstance; override;
  public
    Display       : TfrmMainDIsplay;
    HookedPlatform: TObject;
    SimDetectedTrackList: TT3UnitContainer;

    property OnLogStr: TLogStrProc read FOnLogStr write SetOnLogStr;
    property RangeRing : TRangeRingsVisual read FRangeRing;
    property LineVisual : TLineVisual read FLineVisual;
    property CurrentPerspective : integer read FCurrentPerspective write SetCurrentPerspective;
    property SimMap : TSimMap read FSimMap;
    property OnJumpTo : TEventJumpToTime read FOnJumpTo write SetOnJumpTo;

    procedure RemovePlatformFromGroup(ve: TT3Vehicle);
    procedure RemoveDetectedTrackByDataLink(dataLink: TT3DataLink);overload;
    procedure findDetectedTracksByDatalink(var arrValue : TIntegerArray );
    procedure RemoveESMTracks(aObj: TSimObject);
    function GetBiggestTrackNumber: integer;
    procedure NetSendMapStub(rec : TRec_MapData);

    {replay event}
    procedure Frame_Cmd_DataLink_RemoveTrack(apRec: PAnsiChar; aSize: Word);
    procedure Frame_CmdEmbark(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdLaunchBomb(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdLaunchMissile(apRec: PAnsiChar;aSize: word);
    procedure Frame_CmdLaunchTorpedo(apRec: PAnsiChar;aSize: word);
    procedure Frame_CmdPlatform_Move(apRec: PAnsiChar; aSize: Word);
    procedure Frame_CmdPlatformHancurin(apRec: PAnsiChar; aSize: Word);
    procedure Frame_CmdRadarNoiseJammer(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdSensor(apRec: PAnsiChar;aSize: word);
    procedure Frame_CmdSensorIFF(apRec: PAnsiChar;aSize: word);
    procedure Frame_CmdSync_Hit_Mine_Bomb(apRec: PAnsiChar;aSize: word);
    procedure Frame_CmdSYNCH(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdWeaponInOut(apRec: PAnsiChar; aSize: word);
    procedure Frame_CMD_DataLink_AddTrack(apRec: PAnsiChar; aSize: Word);
    procedure Frame_CmdPlatformFreeMe(apRec: PAnsiChar; aSize: Word);
    procedure Frame_Cmd_DataLink(apRec: PAnsiChar; aSize: word);
    procedure Frame_Cmd_MergeTrack(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdESM_CHANGE_PROPERTY(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdTargetIFF(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdVectac(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdLaunchSonobuoy(apRec: PAnsiChar; aSize: word);
    procedure Frame_PlatformHitPlatform(apRec: PAnsiChar; aSize: word);
    procedure Frame_ChangeTrackNumber(apRec: PAnsiChar; aSize: word);
    procedure Frame_Cmd_FireControl(apRec: PAnsiChar; aSize: word);
    procedure Frame_UpdateNRPProperty(apRec: PAnsiChar; aSize: word);
    procedure Frame_UpdatePropertyPlatform(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdRemovePlatfromByOperator(apRec: PAnsiChar; aSize: Word);
    procedure Frame_CmdDynamicTrack(apRec: PAnsiChar; aSize: word);

    procedure Frame_Cmd_OverlayTemplate(apRec: PAnsiChar; aSize: word);
    procedure Frame_Cmd_OverlayStaticShape(apRec: PAnsiChar; aSize: word);

    procedure Frame_CmdShipingRoute(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdPlottingShape(apRec: PAnsiChar; aSize: word);
    procedure Frame_Cmd_Change_Logistic(apRec: PAnsiChar; aSize: word);
    procedure Frame_Cmd_State_Logistic(apRec: PAnsiChar; aSize: word);
    procedure Frame_Cmd_RampController(apRec: PAnsiChar; aSize: word);

    procedure Frame_CmdLaunch_NonRP(apRec: PAnsiChar; aSize: Word);
    procedure Frame_CmdLaunch_RP(apRec: PAnsiChar; aSize: Word);
    procedure Frame_EngageTrack(apRec: PAnsiChar; aSize: word);
    procedure Frame_SetStatus(apRec: PAnsiChar; aSize: word);
    procedure Frame_SetQuantity(apRec: PAnsiChar; aSize: word);
    procedure Frame_SetLauncherQty(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdEmcon(apRec: PAnsiChar; aSize: word);
    procedure Frame_PlatformGroupChange(apRec: PAnsiChar; aSize: word);
    procedure Frame_Synch_Pos_VBS(apRec: PAnsiChar; aSize: word);
    procedure Frame_MultiMode(apRec: PAnsiChar; aSize: Word);
    procedure Frame_MessageHandling(apRec: PAnsiChar; aSize: word);
    procedure Frame_Personelmove(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdDetectabilityChange(apRec: PAnsiChar; aSize: Word);
    procedure Frame_CmdEditFormation(apRec: PAnsiChar; aSize: word);
    procedure Frame_ECMCommand(apRec: PAnsiChar; aSize: word);
    procedure Frame_SyncBearingMissile(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdUpdateActualCable(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdUpdateSonar(apRec: PAnsiChar; aSize: word);

    procedure Frame_Cmd_Change_SystemState(apRec: PAnsiChar; aSize: word);
    procedure Frame_Synch_ESMvarian(apRec: PAnsiChar; aSize: word);
    procedure Frame_ModifComm(apRec: PAnsiChar; aSize: word);
    procedure Frame_UpdatePlatform(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdTransferSonobuoy(apRec: PAnsiChar; aSize: word);
//    procedure Frame_CmdLogisticRoute(apRec: PAnsiChar; aSize: word);


    procedure Frame_CmdDecoys(apRec: PAnsiChar; aSize: word);
    procedure Frame_CopyChaffLauncherProperty(apRec: PAnsiChar; aSize: word);
    procedure Frame_CmdIFFSearchMode(apRec: PAnsiChar; aSize: word);

    procedure OnDisplayGameControl(control: integer);
    procedure AssignWeaponEvent(weapon: TT3Weapon); override;
    procedure GunFire(rec: TRecCmd_GunFire);override;
    procedure OnGunFire(Sender : TObject); override;
    procedure RemovePlatformByOperator(rec: TRecCmd_SelectPlatformToRemove);
    procedure ResetScenario;override;
    procedure ResetReplay;

    function AddDetectedTrack(aTrack: TSimObject; sensor: TSimObject; value : Boolean): Boolean;
    function AddDetectedTrackByDataLink(idTrack: integer;dataLink: TT3DataLink): Boolean;
    procedure RemoveDetectedTrack(aTrack: TSimObject); overload;
    function  RemoveDetectedTrack(aTrack: TSimObject;sensor: TSimObject): Boolean; overload;
    procedure RemoveDetectedTracks(sensor: TSimObject);
    function Remove_DetectedTrack(aTrack: TSimObject;
             sensor: TSimObject): Boolean;

    function FindNearestDetectedTrack(const px, py: double;
      const maxDist: integer): TSimObject;
    function LaunchRuntimePlatform(const rec: TRecCmd_LaunchRP)
      : TT3PlatformInstance; override;
    function GetTrackNumberForWeapon: integer;

    constructor Create(Map: TMap);
    destructor Destroy; override;
    procedure LoadScenarioID(const vSet: TGameDataSetting); override;
    procedure Show;
    procedure UnAssignedAllEvent;

    procedure JumpTo(const aTime : TTime);


  end;

implementation

uses
  uT3ReplayEventManager, Dialogs, uSRRFunction,
  uCommonLogReplay, uT3Mine, uT3Bomb, uT3Torpedo,
  uT3Missile, uT3CounterMeasure, uT3Radar, uT3Sonar, uT3OtherSensor,
  uT3Gun, uT3Visual, uT3RadarNoiseJammer, uT3HybridMissile, uT3Sonobuoy;

const

  CTTT_defmap = 'maps\mapdata.gst';
  C_CLEAR = 0;  //untuk action multiselect
  C_ADD = 1;  //untuk action multiselect
  C_MOVE = 2;  //untuk action multiselect

  xOffset = 42.700378312;
  yOffset = 41.854946496;

{ TT3ReplayClient }

function TT3ReplayClient.AddDetectedTrack(aTrack, sensor: TSimObject;value : Boolean): Boolean;
var
  pi: TT3Unit;
  track: TT3DetectedTrack;
  i: integer;
  found: Boolean;
  IsDetailView: Boolean;
  curGroup : T3CubicleGroup;
begin
  track := nil;
  found := false;

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    found := track.TrackObject = TT3Unit(aTrack);

    // check sensor detail viewed
    // IsDetailView := TT3Sensor(sensor).InsideDetailRange(aTrack);
    IsDetailView := True;

    if IsDetailView then // edit aldy + andik 20032012
      track.IsDetailViewed := True
    else
      track.IsDetailViewed := false;

    if found then
      break;
  end;

  if found then
  begin
    if Assigned(track) then
    begin
      track.isIFF3C := value;
      track.addDetectBy(TT3DeviceUnit(sensor));
    end;
  end
  else
  begin
    FTrackNumber := FTrackNumber + 1;

    track := TT3DetectedTrack.Create;
    track.Converter := Converter;
    track.VarianceESM := OnVarianceESM; //sinc esm
    track.TrackObject := TT3Unit(aTrack);
    track.ISBlinking := True;
    track.isIFF3C := value;
    track.TrackNumber := FTrackNumber;
//    TT3Unit(aTrack).TrackNumber := FTrackNumber;
    track.TimeDetected := GameTIME;

    track.addDetectBy(TT3DeviceUnit(sensor));
    track.TrackIdent := piPending; // farid 20042012

    // check sensor detail viewed
    // IsDetailView := TT3Sensor(sensor).InsideDetailRange(aTrack);
    IsDetailView := True; // edit aldy + andik 20032012

    curGroup := Scenario.CubiclesGroupsListFromDB.GetGroupByID2(CurrentPerspective) as T3CubicleGroup;

    if aTrack is TT3PlatformInstance then
    begin
      pi := aTrack as TT3PlatformInstance;
      track.TrackNumber := curGroup.GetTrackNumber(pi.InstanceIndex);
    end
    else if aTrack is TT3DeviceUnit then
    begin
      pi := aTrack as TT3DeviceUnit;
      track.TrackNumber := curGroup.GetTrackNumber(pi.InstanceIndex);

      if IsDetailView then
        track.IsDetailViewed := True
      else
        track.IsDetailViewed := false;
    end;

    {Edit by Choco}
    track.TrackType := TT3PlatformInstance(aTrack).PlatformType;
    track.TrackDomain := TT3PlatformInstance(aTrack).PlatformDomain;
    track.TrackID := IntToStr(TT3PlatformInstance(aTrack).TrackNumber);
    track.OnTrackBlinking := OnTrackBlinking;

    // set event merged an unmerged on Client
    SimDetectedTrackList.addObject(track);
  end;

  if TT3Sensor(sensor) is TT3Sonar then
  begin
    if TT3PlatformInstance(aTrack).Altitude = 0 then
      track.TrackDomain := vhdSurface
    else
      track.TrackDomain := TT3PlatformInstance(aTrack).PlatformDomain;
  end;

  result := not found;
end;

function TT3ReplayClient.AddDetectedTrackByDataLink(idTrack: integer;
  dataLink: TT3DataLink): Boolean;
var
  pi: TT3PlatformInstance;
  track: TT3DetectedTrack;
  aTrack: TSimObject;
  FMyCubGroup : T3CubicleGroup;
begin
  result := false;
  aTrack := FindT3PlatformByID(idTrack);
  track := findDetectedTrack(aTrack) as TT3DetectedTrack;

  if Assigned(track) then // jika sudah ada
  begin
    track.addDetectBy(datalink);

    if track.Dormant then
      track.Dormant := false;

    Exit;
  end;

  if not Assigned(aTrack) then
    Exit;

  FTrackNumber := FTrackNumber + 1;
  track := TT3DetectedTrack.Create;
  track.TrackObject := TT3Unit(aTrack);
  track.ISBlinking := True;
  track.TrackNumber := FTrackNumber;
  track.TimeDetected := GameTIME;
  track.Converter := Converter;
  track.addDetectBy(TT3DeviceUnit(dataLink));

  if aTrack is TT3PlatformInstance then
  begin
    pi := aTrack as TT3PlatformInstance;
    FMyCubGroup := T3CubicleGroup(Scenario.CubiclesGroupsListFromDB.GetGroupByID(CurrentPerspective));
    if Assigned(FMyCubGroup) then
      track.TrackNumber := FMyCubGroup.GetTrackNumber(pi.InstanceIndex);
  end;

  track.TrackType := TT3PlatformInstance(aTrack).PlatformType;
  track.TrackDomain := TT3PlatformInstance(aTrack).PlatformDomain;
  track.TrackID := IntToStr(TT3PlatformInstance(aTrack).TrackNumber);
//  track.OnTrackBlinking := OnTrackBlinking;

  SimDetectedTrackList.addObject(track);
  result := true;
end;

procedure TT3ReplayClient.AssignWeaponEvent(weapon: TT3Weapon);
begin
  inherited;

  if weapon is TT3GunOnVehicle then begin
    TT3GunOnVehicle(weapon).OnGunFire := OnGunFire;
    TT3GunOnVehicle(weapon).OnGunCeaseFire := OnGunCeaseFire;
  end;
end;

constructor TT3ReplayClient.Create;
begin

  // default instruktur view
  FIsInstructor := true;
  ListPlatformSelect := TList.Create;
  SubEnviArea := TSubEnvironmentArea.Create;

  CreateDisplay;
  inherited Create(Display.Map);

  // disable all game thread client. use thread manager
  FGameThread.Enabled := false;
  FGameThread.OnRunning := nil;
  FGameThread.OnTimer  := nil;
  FGameThread.OnTerminate := nil;

  EventManager := TT3ReplayEventManager.Create;
  TT3ReplayEventManager(EventManager).SetManager(self);

  SimDetectedTrackList := TT3UnitContainer.Create;
  SimDetectedTrackList.Converter := Converter;

  CreateCompass;
  CreateRangeRings;
  CreateLineVisual;
  CreateSimMap;

  FCurrentPerspective := 0; // default instruktur
  FTrackNumber        := 1000;
  FTrackNumberWeapon  := 4000;

  FLastPlatformID := 100;

  Display.Manager := Self;
  Display.RefreshTrackList;

  SimManager := Self;

  Show;

end;

procedure TT3ReplayClient.CreateCompass;
begin
  FCompass := TCompassVisual.Create;
  FCompass.Width := Converter.FMap.Width;
  FCompass.Height := Converter.FMap.Height;
end;

procedure TT3ReplayClient.CreateDisplay;
begin
  Display := TfrmMainDIsplay.Create(nil);
end;

procedure TT3ReplayClient.CreateLineVisual;
begin
  FLineVisual := TLineVisual.Create;
  FLineVisual.Converter := Converter;
end;

procedure TT3ReplayClient.CreateRangeRings;
begin
  FRangeRing := TRangeRingsVisual.Create;
  FRangeRing.Converter := Converter;
  FRangeRing.Interval := 10;
end;

procedure TT3ReplayClient.CreateSimMap;
begin
  FSimMap := TSimMap.Create(Display.Map);

  SimMap.OnDrawToCanvas := DrawAll;
  SimMap.OnMapChange := OnMapChange;
  SimMap.OnToolUsed := Display.MapToolUsed;
  SimMap.OnMapMouseMove := Display.MapMouseMove;
  SimMap.OnMapMouseDown := Display.MapMouseDown;
  SimMap.OnMapMouseUp := Display.MapMouseUp;
  SimMap.FMap.CurrentTool := mtSelectObject;

  LoadScenarioID(vGameDataSetting);
end;

destructor TT3ReplayClient.Destroy;
begin
  UnAssignedAllEvent;

  FSimMap.Free;

  ListPlatformSelect.Clear;
  ListPlatformSelect.Free;

  SimDetectedTrackList.ClearAndRemove;
  SimDetectedTrackList.Free;

  inherited;

  FRangeRing.Free;
  FLineVisual.Free;
  FCompass.Free;

  Display.Free;
end;

procedure TT3ReplayClient.DrawAll(aCnv: TCanvas);
var
  aRect: TRect;
  cnt,i : integer;
  obj: TT3PlatformInstance;
begin
  // batas penggambaran di map
  aRect.Left := 0;
  aRect.Top := 0;
  aRect.Right := SimMap.FMap.Width;
  aRect.Bottom := SimMap.FMap.Height;

  FCompass.DrawCompass(aCnv);

  FLineVisual.ConvertCoord(Converter);
  FLineVisual.Draw(aCnv);

  FRangeRing.ConvertCoord(Converter);
  FRangeRing.Draw(aCnv);

  SimPlatforms.UpdateAndDrawVisuals(aCnv, aRect);
  SimDevices.UpdateAndDrawVisuals(aCnv, aRect);
  SimWeapons.UpdateAndDrawVisuals(aCnv, aRect);

  SimDetectedTrackList.UpdateAndDrawVisuals(aCnv,aRect);

  // draw specific track base on current perspectives
  cnt := simNonRealPlatform.itemCount;
  for I := 0 to cnt - 1 do
  begin
    obj := simNonRealPlatform.getObject(I) as TT3PlatformInstance;

    if Assigned(obj) then begin
      if obj.GroupIndex = CurrentPerspective then
      begin
        obj.UpdateVisual;
        obj.Draw(aCnv);
      end;
    end;

  end;

  SimPlotting.Draw(aCnv);
  SimShipingRoute.Draw(aCnv);

  if CurrentPerspective = 0  then
  begin
    if Assigned(Converter) then
    begin
      SubEnviArea.ConvertCoord(Converter);
      SubEnviArea.Draw(aCnv);
    end;
  end;

end;

function TT3ReplayClient.findDetectedTrack(aObj: TSimObject): TSimObject;
var
  i: integer;
  f: Boolean;
begin
  i := 0;
  f := false;
  result := nil;

  while not f and (i < SimDetectedTrackList.itemCount) do
  begin
    result := SimDetectedTrackList.getObject(i);

    f := (result as TT3DetectedTrack).TrackObject = aObj;
    inc(i)
  end;
  if not f then
    result := nil;
end;

procedure TT3ReplayClient.findDetectedTracksByDatalink(
  var arrValue: TIntegerArray);
var
  i,j, k: integer;
  objTrack : TT3DetectedTrack;
  devSensor : TObject;
begin
  i := 0;
  k := 1;

  while i < SimDetectedTrackList.itemCount do
  begin
    objTrack := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;

    if objTrack <> nil then
    begin
      for j := 0 to objTrack.TrackDetectedBy.Count - 1 do
      begin
        devSensor := objTrack.TrackDetectedBy.Items[j];
        if Assigned(devSensor) and (devSensor is TT3DataLink) then
        begin
          if Assigned(objTrack.TrackObject) then
          begin
            SetLength(arrValue, k);
            arrValue[k-1] := objTrack.TrackObject.InstanceIndex;
            Inc(k);
          end;
        end;
      end;
    end;

    inc(i);
  end;end;

function TT3ReplayClient.FindESMByDetectedTrack(const number: String;
  aTrack: TSimObject): TT3EsmTrack;
var
  aESM: TT3EsmTrack;
  aDetected: TT3DetectedTrack;
  i : Integer;
begin
  result := nil;

  if Assigned(aTrack) and (aTrack is TT3DetectedTrack) then
  begin
    aDetected := TT3DetectedTrack(aTrack);

    if aDetected.ESMTracks.Count > 0 then
    begin
      for i := 0 to aDetected.ESMTracks.Count - 1 do
      begin
        aESM := aDetected.ESMTracks.Items[i];
        if (aESM.TrackNumber = number) then
          result := aESM;
      end;
    end;
  end;
end;

function TT3ReplayClient.FindESMByTrackNumber(
  const number: String): TT3EsmTrack;
var
  aESM: TT3EsmTrack;
  aDetected: TT3DetectedTrack;
  i, J: integer;
begin
  result := nil;
  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    aDetected := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;
    if aDetected.ESMTracks.Count > 0 then
    begin
      for J := 0 to aDetected.ESMTracks.Count - 1 do
      begin
        aESM := aDetected.ESMTracks.Items[J];
        if (aESM.TrackNumber = number) then
          result := aESM;
      end;
    end;
  end;
end;

function TT3ReplayClient.FindNearestDetectedTrack(const px, py: double;
  const maxDist: integer): TSimObject;
var
  pi: TT3DetectedTrack;
  rr: integer;
  m, r: double;
  i, ctx, cty: integer;
  ptx, pty: integer;
begin
  Converter.ConvertToScreen(px, py, ctx, cty);
  m := 1000000.0;
  result := nil;

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin

    pi := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    if not Assigned(pi.TrackObject) then
      continue;
    if pi.FreeMe then
      continue;

    Converter.ConvertToScreen(pi.getPositionX, pi.getPositionY, ptx, pty);

    try
      rr := sqr(ptx - ctx) + sqr(pty - cty);
      if rr = 0 then
        r := 10000
      else
        r := Sqrt(Abs(rr));
    except
      r := 10000;
    end;

    if (r < m) and (r < maxDist) then
    begin
      result := pi;
      break;
    end;
  end;
end;

procedure TT3ReplayClient.Frame_ChangeTrackNumber(apRec: PAnsiChar;
  aSize: word);
var
  Rec      : ^TRecCmd_Platform_CHANGE_TRACKNUMBER;
  plat      : TT3PlatformInstance;
  track     : TT3DetectedTrack;
  esm       : TT3EsmTrack;
  newNumber : integer;
  i, J      : integer;
begin
  Rec := @apRec^;

  if (FCurrentPerspective = 0) or (Rec.GrpID = FCurrentPerspective) then
  begin
    if FCurrentPerspective = 0 then
    begin
      // NON REAL TIME
      plat := FindNonRealPlatformByID(Rec.PlatfomID);
      if Assigned(plat) then
      begin
        if Rec.newTrackNumber <> 0 then
          plat.TrackNumber := rec.newTrackNumber
        else
          plat.InstanceName := rec.newName;
      end;

    end
    else
    begin
      if rec.newTrackNumber = 0 then
      begin
        newNumber := GetBiggestTrackNumber + 1;
      end
      else
      begin
        newNumber := rec.newTrackNumber;
      end;
      track := nil;

      plat := FindT3PlatformByID(rec.PlatfomID);
      if Assigned(plat) then
        track := findDetectedTrack(plat) as TT3DetectedTrack;

      // NON REAL TIME
      if not Assigned(track) then
      begin
        plat := FindNonRealPlatformByID(rec.PlatfomID);
        if Assigned(plat) then
        begin
          if rec.newTrackNumber <> 0 then
            plat.TrackNumber := rec.newTrackNumber
          else
            plat.InstanceName := rec.newName;
        end;
      end;

      if rec.newTrackNumber <> -1 then
      begin
        if Assigned(track) then
          track.TrackNumber := newNumber;
      end;

      if (rec.oldESMNumber <> '') and (rec.newESMNumber <> '') then
      begin
        for i := 0 to SimDetectedTrackList.itemCount - 1 do
        begin
          track := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;
          if Assigned(track) then
          begin
            for J := 0 to track.ESMTracks.Count - 1 do
            begin
              esm := track.ESMTracks[J];
              if esm.TrackNumber = rec.oldESMNumber then
              begin
                esm.TrackNumber := rec.newESMNumber;
              end;
            end;
          end;
        end;
      end;
    end;

    FSimMap.FMap.Repaint;
  end;
end;

procedure TT3ReplayClient.Frame_CmdDecoys(apRec: PAnsiChar; aSize: word);
var
  r  : ^TRecCmdDecoys;
  decoys : TT3PlatformInstance;
begin
  r   := @apRec^;

  decoys := DeployDecoys(r^);

  if Assigned(decoys) then
  begin
    decoys.UnitGroup := decoys.GroupIndex = CurrentPerspective;
    decoys.Parent := nil;
  end;
end;

procedure TT3ReplayClient.Frame_CmdDetectabilityChange(apRec: PAnsiChar;
  aSize: Word);
var
  rec : ^TRecDetectability;
  pi : TT3PlatformInstance;
begin
  rec := @apRec^;
  pi := FindT3PlatformByID(rec^.PlatformID);

  if not Assigned(pi) then
    Exit;

  pi.DetectabilityType := rec^.DetectType;

end;

procedure TT3ReplayClient.Frame_CmdDynamicTrack(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_OverlayDynamicTrack;
begin
  r := @apRec^;

  if r = nil then
    Exit;

  if r.Cubicle = 0 then
  begin
    TT3ReplayEventManager(EventManager).OnDynamicTrackUpdate( r^.NameTrack,
      r^.TemplateName, r^.IDTrack, r^.Idx, r^.Brg, r^.Rot, r^.Notrack, r^.Cubicle, r^.Rng, r^.Orientation);
  end
  else
  begin
    if CurrentPerspective = r^.Cubicle then
    begin
      TT3ReplayEventManager(EventManager).OnDynamicTrackUpdate( r^.NameTrack,
        r^.TemplateName, r^.IDTrack, r^.Idx, r^.Brg, r^.Rot, r^.Notrack, r^.Cubicle, r^.Rng, r^.Orientation);
    end
  end;

end;

procedure TT3ReplayClient.Frame_CmdEditFormation(apRec: PAnsiChar; aSize: word);
begin
  netRecv_CmdEditFormation(apRec,aSize);
end;

procedure TT3ReplayClient.Frame_CmdEmbark(apRec: PAnsiChar; aSize: word);
var rEmb: ^TRecCmd_Embark;
begin
  rEmb := @apRec^;

  case rEmb^.OrderID of
    { readying timer start }
    CORD_ID_INITIATE :
      InitiateEmbarkPlatform(rEmb^);
    { launch embark start immediately }
    CORD_ID_LAUNCH   :
      LaunchEmbarkPlatform(rEmb^);
    { launch canceled }
    CORD_ID_CANCEL   : ;
  end;
end;

procedure TT3ReplayClient.Frame_CmdEmcon(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_ModeEmcon;
  pi: TT3PlatformInstance;
  obj: TObject;
  vnext: Boolean;
  i : Integer;
  ve : TT3Vehicle;
  sensor : TT3Sensor;
  BtnAllSilent : Boolean;
begin

  netRecv_CmdEmcon(apRec,aSize);

  r := @apRec^;
  pi := FindT3PlatformByID(r^.PlatformID);

  if (pi = nil) then
    Exit;

  if (r^.SensorID = 0) or (r^.EmconCtgr = Byte(HFDatalink))
    or (r^.EmconCtgr = Byte(VHFDatalink)) then
    vnext := True
  else
    vnext := False;

  BtnAllSilent := (r^.EmconCtgr = 12) and (r^.Mode = 1);

  ve := TT3Vehicle(pi);
  if vnext = False then begin
    for i := 0 to ve.Devices.Count - 1 do
    begin
      sensor := ve.Devices.Items[i];

      if sensor is TT3Radar then begin
        obj := ve.getDevice(r^.SensorID, TT3Radar);

        if obj = nil then continue;

        if r^.SensorID = TT3Radar(obj).InstanceIndex then
        begin
          vnext := True;
          Break;
        end;
      end
      else if sensor is TT3Sonar then begin
        obj := ve.getDevice(r^.SensorID, TT3Sonar);

        if obj = nil then continue;

        if r^.SensorID = TT3Sonar(obj).InstanceIndex then
        begin
          vnext := True;
          Break;
        end;
      end
      else if sensor is TT3IFFSensor then begin
        obj := ve.getDevice(r^.SensorID, TT3IFFSensor);

        if obj = nil then continue;

        if r^.SensorID = TT3IFFSensor(obj).InstanceIndex then
        begin
          vnext := True;
          Break;
        end;
      end;
    end;
  end;

  //grp := FScenario.CubiclesGroupsList.GetGroupOf_PlatformIndex(r.PlatformID);
  if vnext = True then
  begin
    if r.SensorGroupID = CurrentPerspective then
    begin
      EventManager.UpdateEmconCheckBox(pi, BtnAllSilent);
    end;
  end;
end;

procedure TT3ReplayClient.Frame_CmdESM_CHANGE_PROPERTY(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecCmd_ESM_SET_PROPERTY;
  track: TT3DetectedTrack;
  esm: TT3EsmTrack;
  i, J: integer;
begin
  r := @apRec^;

  if not(IsController) then
  begin
    if CurrentPerspective <> r^.GrpID then
      Exit;

    for i := 0 to SimDetectedTrackList.itemCount - 1 do
    begin
      track := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;
      for J := 0 to track.ESMTracks.Count - 1 do
      begin
        esm := track.ESMTracks[J];
        if esm.TrackNumber = r^.TrackNumber then
        begin
          if r^.Identity <> -1 then
            esm.TrackIdent := r^.Identity;
          if r^.domain <> -1 then
            esm.TrackDomain := r^.domain;
        end;
      end;
    end;
  end;
end;

procedure TT3ReplayClient.Frame_CmdIFFSearchMode(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecCmd_IFFSearchMode;
  Pi, pfObject : TT3PlatformInstance;
  aDev: TObject;
  i: Integer;
begin
  r := @apRec^;
  pi := FindT3PlatformByID(r^.PlatformID);

  if pi = nil then
    Exit;

  if not(pi is TT3Vehicle) then
    Exit;

  aDev := TT3Vehicle(pi).getDevice(r^.SensorID, TT3IFFSensor);

  if Assigned(aDev) then
  begin
    for I := 0 to SimPlatforms.itemCount - 1 do
    begin
      pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
      if pi.InstanceIndex = pfObject.InstanceIndex then
      begin
        TT3IFFSensor(aDev).ModeSearchIFF := r^.ModeSearch;
        TT3IFFSensor(aDev).TargetObject := nil;
      end;
    end;
  end;
end;

procedure TT3ReplayClient.Frame_CmdLaunchBomb(apRec: PAnsiChar; aSize: word);
var
  aRec : ^TRecCmd_LaunchBomb;
  projectile  : TT3Bomb;
begin
  aRec := @apRec^;

  projectile := LaunchBomb(aRec^) as TT3Bomb;

  if projectile <> nil then begin
    projectile.Enable         := true;
    projectile.UnitGroup := projectile.GroupIndex = CurrentPerspective
  end;
end;

procedure TT3ReplayClient.Frame_CmdLaunchMissile(apRec: PAnsiChar; aSize: word);
var r: ^TRecCmd_LaunchMissile;
    projectile : TT3Weapon;
begin
  r := @apRec^;

  // check hybrid missile ato bukan
  if r^.Order = CORD_ID_launch_hybrid then
    // launch hybrid
    projectile := LaunchHybrid(r^) as TT3HybridMissile
  else
    projectile :=  LaunchMissile( r^) as TT3Missile;

  if projectile <> nil then
  begin
    projectile.Enable         := true;
    projectile.UnitGroup := projectile.GroupIndex = CurrentPerspective
  end;

end;

procedure TT3ReplayClient.Frame_CmdLaunchSonobuoy(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecCmd_LaunchSonobuoy;
  projectile : TT3Sonobuoy;
begin
  aRec := @apRec^;

  projectile := LaunchSonobuoy(aRec^) as TT3Sonobuoy;

  if projectile <> nil then
  begin
    projectile.Enable := True;
    projectile.UnitGroup := projectile.GroupIndex = CurrentPerspective
  end;
end;

procedure TT3ReplayClient.Frame_CmdLaunchTorpedo(apRec: PAnsiChar; aSize: word);
var r: ^TRecCmd_LaunchMissile;
    projectile : TT3Torpedo;
begin
  r := @apRec^;
  projectile :=  LaunchTorpedo( r^) as TT3Torpedo;

  if projectile <> nil then begin
    projectile.Enable         := true;
    projectile.UnitGroup := projectile.GroupIndex = CurrentPerspective
  end;
end;

procedure TT3ReplayClient.Frame_CmdLaunch_NonRP(apRec: PAnsiChar; aSize: Word);
var
  r  : ^TRecCmd_LaunchNonRP;
  pi : TT3PlatformInstance;
begin
  r  := @apRec^;
  pi := LaunchNonRealtimeRuntimePlatform(r^);
  if pi = nil then Exit;

  pi.UnitGroup := pi.GroupIndex = CurrentPerspective;
  if CurrentPerspective = 0 then
  begin
    pi.isInstructor := True;
    pi.isWasdal := True;
  end else
  begin
    pi.isInstructor := False;
    pi.isWasdal := False;
  end;
end;

procedure TT3ReplayClient.Frame_CmdLaunch_RP(apRec: PAnsiChar; aSize: Word);
var
  r  : ^TRecCmd_LaunchRP;
  pi : TT3PlatformInstance;
begin
  r  := @apRec^;
  pi := LaunchRuntimePlatform(r^);
  if pi = nil then Exit;

  pi.UnitGroup := pi.GroupIndex = CurrentPerspective;
  if CurrentPerspective = 0 then
  begin
    pi.isInstructor := True;
    pi.isWasdal := True;
  end else
  begin
    pi.isInstructor := False;
    pi.isWasdal := False;
  end;
end;

//procedure TT3ReplayClient.Frame_CmdLogisticRoute(apRec: PAnsiChar; aSize: word);
//var
//  r: ^TRecCmd_LogisticRoute;
//begin
//  r := @apRec^;
//
//  if r = nil then
//    Exit;
//
//  EventManager.OnLogisticRoute(r^.NameTemplate, r^.id, r^.Personel, r^.Color,
//  r^.Speed, r^.PosAwalX, r^.PosAwalY, r^.PosAkhirX, r^.PosAkhirY);
//end;

procedure TT3ReplayClient.Frame_CmdShipingRoute(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecCmd_ShipingRoute;
begin
  r := @apRec^;

  if r = nil then
    Exit;

  CreateShipingRoute(r^);
end;

procedure TT3ReplayClient.Frame_CmdPlatformFreeMe(apRec: PAnsiChar;
  aSize: Word);
var
  aRec: ^TRecPlatformFreeMe;
begin
  aRec := @apRec^;
  FreePlatform(aRec^);
end;

procedure TT3ReplayClient.Frame_CmdPlatformHancurin(apRec: PAnsiChar;
  aSize: Word);
var
  aRec: ^TRecPlatformHancur;
begin
  aRec := @apRec^;
  EventManager.OnPlatformHancurin(aRec^.SenderID, aRec^.Target, aRec^.reasondestroy);
end;

procedure TT3ReplayClient.Frame_CmdPlatform_Move(apRec: PAnsiChar; aSize: Word);
var rec: ^TRecCmd_Platform_Move;
    p: TT3PlatformInstance;
begin
  rec := @apRec^;

  p := FindT3PlatformByID(rec^.PlatfomID);
  if not Assigned(p) then
    p := FindNonRealPlatformByID(rec^.PlatfomID);

  if p <> nil then
    if rec^.OrderID = CORD_ID_REPOS then
      p.RepositionTo(rec^.X, rec^.Y);

end;

procedure TT3ReplayClient.Frame_CmdPlottingShape(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_PlottingShape;
begin
  r := @apRec^;

  if r = nil then
    Exit;

  CreatePlotting(r^);
end;

procedure TT3ReplayClient.Frame_CmdRadarNoiseJammer(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TrecRadarNoiseJammer;
  pi: TT3PlatformInstance;
  obj: TObject;
begin
  r := @apRec^;
  pi := FindT3PlatformByID(r^.JammerPlatformOwnerID);

  if pi = nil then
    Exit;
  if not(pi is TT3Vehicle) then
    Exit;

  obj := TT3Vehicle(pi).getDevice(r^.JammerID, TT3RadarNoiseJammerOnVehicle);
  if obj = nil then
    Exit;

  TT3RadarNoiseJammerOnVehicle(obj).Status := TECMStatus(r^.JammerStatus);
end;

procedure TT3ReplayClient.Frame_CmdRemovePlatfromByOperator(apRec: PAnsiChar;
  aSize: Word);
var
  r: ^TRecCmd_SelectPlatformToRemove;
begin
  r := @apRec^;
  RemoveDatalinkPlatform(r^);
  RemovePlatformByOperator(r^);
end;

procedure TT3ReplayClient.Frame_CmdSensor(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_Sensor;
  pi: TT3PlatformInstance;
  obj: TObject;
begin
  r := @apRec^;
  pi := FindT3PlatformByID(r^.PlatformID);

  if pi = nil then
    Exit;

  if not(pi is TT3Vehicle) then
    Exit;

  case r^.SensorType of
    CSENSOR_TYPE_RADAR:
      begin
        obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3Radar);
        if obj = nil then
          Exit;

        case r^.OrderID of
          CORD_ID_ControlMode:
            TT3Radar(obj).ControlMode := TRadarControlMode(r^.OrderParam);
        end;
      end;

    CSENSOR_TYPE_SONAR:
      begin
        obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3Sonar);
        if obj = nil then
          Exit;

        case r^.OrderID of
          CORD_ID_ControlMode:
            TT3Sonar(obj).ControlMode := TSonarControlMode(r^.OrderParam);
        end;
      end;

    CSENSOR_TYPE_ESM:
      begin
        obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3ESMSensor);
        if obj = nil then
          Exit;

        case r^.OrderID of
          CORD_ID_OperationalStatus:
            TT3ESMSensor(obj).OperationalStatus := TSensorOperationalStatus
              (r^.OrderParam);
        end;
      end;

    CSENSOR_TYPE_EO:
      begin
        obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3EOSensor);
        if obj = nil then
          Exit;

        case r^.OrderID of
          CORD_ID_OperationalStatus:
            TT3EOSensor(obj).OperationalStatus := TSensorOperationalStatus
              (r^.OrderParam);
        end;
      end;

    CSENSOR_TYPE_MAD:
      begin
        obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3MADSensor);
        if obj = nil then
          Exit;

        case r^.OrderID of
          CORD_ID_OperationalStatus:
            TT3MADSensor(obj).OperationalStatus := TSensorOperationalStatus
              (r^.OrderParam);
        end;
      end;

    CSENSOR_TYPE_IFF:
      begin
        obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3IFFSensor);
        if obj = nil then
          Exit;

        case r^.OrderID of
          1:
            TT3IFFSensor(obj).TransponderOperateStatus :=
              TSensorOperationalStatus(r^.OrderParam);
          2:
            TT3IFFSensor(obj).InterrogatorOperateStatus :=
              TSensorOperationalStatus(r^.OrderParam);
        end;
      end;
  end;
end;

procedure TT3ReplayClient.Frame_CmdSensorIFF(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_SensorIFF;
  pi, pt: TT3PlatformInstance;
  obj: TObject;
begin
  r := @apRec^;
  pi := FindT3PlatformByID(r^.PlatformID);

  if r^.TargetID = 0 then
    pt := nil
  else
    pt := FindT3PlatformByID(r^.TargetID);

  if pi = nil then
    Exit;

  if not(pi is TT3Vehicle) then
    Exit;

  r := @apRec^;

  obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3IFFSensor);

  if obj = nil then
    Exit;

  case r^.index_mode of
    1:
      begin // transponder mode1
        TT3IFFSensor(obj).TransponderMode1Enabled := r^.check_mode;
        TT3IFFSensor(obj).TransponderMode1 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    2:
      begin // transponder mode2
        TT3IFFSensor(obj).TransponderMode2Enabled := r^.check_mode;
        TT3IFFSensor(obj).TransponderMode2 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    3:
      begin // transponder mode3
        TT3IFFSensor(obj).TransponderMode3Enabled := r^.check_mode;
        TT3IFFSensor(obj).TransponderMode3 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    4:
      begin // interrogator mode1
        TT3IFFSensor(obj).InterrogatorMode1Enabled := r^.check_mode;
        TT3IFFSensor(obj).InterrogatorMode1 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    5:
      begin // interrogator mode2
        TT3IFFSensor(obj).InterrogatorMode2Enabled := r^.check_mode;
        TT3IFFSensor(obj).InterrogatorMode2 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    6:
      begin // interrogator mode3
        TT3IFFSensor(obj).InterrogatorMode3Enabled := r^.check_mode;
        TT3IFFSensor(obj).InterrogatorMode3 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
  end;
end;

procedure TT3ReplayClient.Frame_CmdSYNCH(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmdSYNCH;
begin
  aRec := @apRec^;
  case aRec^.SynchID of
    CORD_ID_Synch_NextPID:
      begin
        FLastPlatformID := aRec^.Synch_IParam;
      end;
  end;
end;

procedure TT3ReplayClient.Frame_CmdSync_Hit_Mine_Bomb(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecCmd_Sync_Hit_BombMine;
  weapon: TSimObject;
  Target: TSimObject;
begin
  aRec := @apRec^;

  weapon := FindWeaponByID(aRec^.WeaponID);
  if not Assigned(weapon) then
    Exit;

  Target := FindT3PlatformByID(aRec^.TargetID);
  if not Assigned(Target) then
    Exit;

  if not(weapon is TT3Bomb) or not(Target is TT3Mine) then
    Exit;

  if Target is TT3PlatformInstance then
  begin
    if weapon is TT3Mine then
    begin
      if Assigned(TT3Mine(weapon).OnHit) then
        TT3Mine(weapon).OnHit(weapon, Target, aRec^.lethality);
    end
    else
    begin
      if Assigned(TT3Bomb(weapon).OnHit) then
        TT3Bomb(weapon).OnHit(weapon, Target, aRec^.lethality);
    end;
  end;
end;

procedure TT3ReplayClient.Frame_CmdTargetIFF(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_TargetIFF;
  pi, pt: TT3PlatformInstance;
  obj: TObject;
begin
  r := @apRec^;
  pi := FindT3PlatformByID(r^.PlatformID);

  if not(pi is TT3Vehicle) then
    Exit;

  pt := FindT3PlatformByID(r^.TargetID);
  if not Assigned(pt) then
    Exit;

  if not(pt is TT3Vehicle) then
    Exit;

  obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3IFFSensor);
  if obj = nil then
    Exit;

  TT3IFFSensor(obj).TargetObject := pt;
  TT3IFFSensor(obj).PrevTargetObj := nil;
end;

procedure TT3ReplayClient.Frame_CmdTransferSonobuoy(apRec: PAnsiChar;
  aSize: word);
begin

end;

procedure TT3ReplayClient.Frame_CmdUpdateActualCable(apRec: PAnsiChar;
  aSize: word);
var
  r : ^TRecCmd_UpdateActualCable;
  pi, pfObject: TT3PlatformInstance;
  obj: TObject;
  i : Integer;
begin
  r := @apRec^;
  pi := FindT3PlatformByID(r^.PlatformID);

  if pi = nil then
    Exit;

  if not(pi is TT3Vehicle) then
    Exit;

  obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3Sonar);

  if Assigned(obj) then
  begin
    for I := 0 to SimPlatforms.itemCount - 1 do
    begin
      pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
      if pi.InstanceIndex = pfObject.InstanceIndex then
      begin
        TT3Sonar(obj).ActualCable := r^.value;
      end;
    end;

  end;
end;

procedure TT3ReplayClient.Frame_CmdUpdateSonar(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_UpdateSonar;
  pi,pfObject: TT3PlatformInstance;
  obj: TObject;
  i: Integer;
begin
  r := @apRec^;
  pi := FindT3PlatformByID(r^.PlatformID);

  if pi = nil then
    Exit;

  if not(pi is TT3Vehicle) then
    Exit;

  obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3Sonar);

  if Assigned(obj) then
  begin
    if r^.param = 1 then
    begin
      for I := 0 to SimPlatforms.itemCount - 1 do
      begin
        pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
        if pi.InstanceIndex = pfObject.InstanceIndex then
        begin
          TT3Sonar(obj).ActualCable := r^.Counter;
          TT3Sonar(obj).OrderCable := r^.order;
          TT3Sonar(obj).ControlMode := TSonarControlMode(scmDeploying);
        end;
      end;
    end
    else if r^.param = 2 then
    begin
      for I := 0 to SimPlatforms.itemCount - 1 do
      begin
        pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
        if pi.InstanceIndex = pfObject.InstanceIndex then
        begin
          if (r^.Counter)>= (r^.order)then
          begin

            TT3Sonar(obj).ActualCable := r^.Counter;
            TT3Sonar(obj).OrderCable := r^.order;
            TT3Sonar(obj).ControlMode := TSonarControlMode(scmStowing);
          end;
        end;
      end;
    end
    else if r^.param = 5 then     //deploy keatas
    begin
      for I := 0 to SimPlatforms.itemCount - 1 do
      begin
        pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
        if pi.InstanceIndex = pfObject.InstanceIndex then
        begin
          if (r^.Counter)>= (r^.order)then
          begin

            TT3Sonar(obj).ActualCable := r^.Counter;
            TT3Sonar(obj).OrderCable := r^.order;
            TT3Sonar(obj).ControlMode := TSonarControlMode(scmDeploying);
          end;
        end;
      end;
    end;
  end;
end;

procedure TT3ReplayClient.Frame_CmdVectac(apRec: PAnsiChar; aSize: word);
var
  Commander: TT3Vehicle;
  Vectac : TT3Vectac;
  rec : ^TRecVectac;
  FMyCubGroup : T3CubicleGroup;
  visible : boolean;
begin
  netRecv_Vectac(apRec,aSize);

  rec := @apRec^;
  commander := FindT3PlatformByID(rec^.CommanderID) as TT3Vehicle;
  vectac := commander.Weapons.Items[commander.Weapons.Count-1];

  if CurrentPerspective <> 0 then
  begin
    FMyCubGroup := Scenario.CubiclesGroupsListFromDB.GetGroupByID2(CurrentPerspective) as T3CubicleGroup;
    if not Assigned(FMyCubGroup) then
      Exit;

    case rec^.cmd of
      CPID_CMD_VECTAC_PLAN   :
                              begin
                                vectac.Planned := FMyCubGroup.IsGroupMember(rec^.CommanderID);
                              end;
      CPID_CMD_VECTAC_LAUNCH :
                              begin
                                visible := FMyCubGroup.IsGroupMember(rec^.CommanderID);
                                vectac.ConfirmDrop := visible;
                                vectac.VisibleDogBox := visible;
                              end;
    end;
  end;
end;

procedure TT3ReplayClient.Frame_CmdWeaponInOut(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecWeaponOut;
begin
  aRec := @apRec^;
  EventManager.OnWeaponInOut(aRec^.SenderID, aRec^.reasonDestroy);
end;

procedure TT3ReplayClient.Frame_Cmd_Change_Logistic(apRec: PAnsiChar;
  aSize: word);
var
  rec : ^TRecCmd_Change_Logistic;
begin
  rec := @apRec^;
  ChangeLogistic(rec^);
end;

procedure TT3ReplayClient.Frame_Cmd_Change_SystemState(apRec: PAnsiChar;
  aSize: word);
var
  rec : ^TRecCmd_Change_SystemState;
begin
  rec := @apRec^;
  ChangeSystemState(rec^);
end;

procedure TT3ReplayClient.Frame_Cmd_DataLink(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_DataLink;
  dataLink: TT3DataLink;
begin

  netRecv_Cmd_DataLink(apRec, aSize);

  r := @apRec^;

  dataLink := nil;
  // if not pooling request, update track datalink
  if (r^.OrderDL <> odlPool) and (r^.OrderDL <> odlPooledTracks) then
  begin
    dataLink := DataLinkManager.getDatalink(r^.DataLinkID);
    if Assigned(EventManager) then
      EventManager.OnDatalinkTracksUpdate(dataLink);
  end;

  if Assigned(dataLink) then
  begin

    if r^.OrderDL = odlStop then
    begin
      RemoveDetectedTrackByDataLink(dataLink);
    end;

    if Assigned(dataLink.OnUpdated) then
      dataLink.OnUpdated(dataLink);

  end;
end;

procedure TT3ReplayClient.Frame_CMD_DataLink_AddTrack(apRec: PAnsiChar;
  aSize: Word);
begin

end;

procedure TT3ReplayClient.Frame_Cmd_DataLink_RemoveTrack(apRec: PAnsiChar;
  aSize: Word);
begin
end;

procedure TT3ReplayClient.Frame_Cmd_FireControl(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_FC;
  objPlatform: TSimObject;
  objDetected: TSimObject;

  objParentPlatform: TSimObject;
  tempPlatform: TT3PlatformInstance;
  radar: TT3Radar;
  isExist: Boolean;
  i: integer;
begin
  r := @apRec^;

  objParentPlatform := FindT3PlatformByID(r^.PlatformParentID);
  if not Assigned(objParentPlatform) then
    Exit;

  radar := nil;
  if objParentPlatform is TT3Vehicle then
  begin
    radar := TT3Vehicle(objParentPlatform).getDevice(r^.FCRadarID, TT3Radar) as TT3Radar;
  end;

  if Assigned(radar) then
  begin
    case r^.OrderID of
      CORD_FC_BREAKALL:
      begin
        if radar.AssignedTrack <> nil then
        begin
          for i := 0 to radar.AssignedTrack.Count - 1 do
          begin
            tempPlatform := radar.AssignedTrack.Items[i];
            tempPlatform.IsAssigned := false;
          end;

          radar.AssignedTrack.Clear;
        end;

        if Assigned(radar.OnFireControlUpdated) then
        begin
          radar.OnFireControlUpdated(radar);
        end;

        Exit;
      end;
    end;

    objPlatform := FindT3PlatformByID(r^.PlatformID);
    if not Assigned(objPlatform) then
      Exit;

    if FCurrentPerspective <> 0 then
    begin
      if (r^.GroupID <> FCurrentPerspective) then
        Exit;
    end;

    if Assigned(objPlatform) then
    begin
      objDetected := findDetectedTrack(objPlatform);
    end
    else Exit;

    if Assigned(objDetected) then
      objPlatform := objDetected;

    case r^.OrderID of
      CORD_FC_ASSIGN:
      begin
        isExist := false; // mk
        objPlatform.IsAssigned := True;

        if radar.AssignedTrack <> nil then
        begin
          for i := 0 to radar.AssignedTrack.Count - 1 do
          begin
            if objPlatform.Equals(radar.AssignedTrack.Items[i]) then
            begin
              isExist := True;
              break;
            end;
          end;

          if not isExist then
            radar.AssignedTrack.Add(objPlatform);
        end;
      end;
      CORD_FC_BREAK:
      begin
        isExist := false; // mk
        if radar.AssignedTrack <> nil then
        begin
          if radar.AssignedTrack.Count <= 0 then
            Exit;

          for i := 0 to radar.AssignedTrack.Count - 1 do
          begin
            if objPlatform.Equals(radar.AssignedTrack.Items[i]) then
            begin
              isExist := True;
              break;
            end;
          end;

          if isExist then
          begin
            objPlatform.IsAssigned := false;
            radar.AssignedTrack.Remove(objPlatform);
          end;
        end;
      end;
      CORD_FC_BREAKALL:
      begin
        if radar.AssignedTrack <> nil then
        begin
          for i := 0 to radar.AssignedTrack.Count - 1 do
          begin
            TT3PlatformInstance(radar.AssignedTrack[i]).IsAssigned := false;
            radar.AssignedTrack.Remove(radar.AssignedTrack[i]); // mk 10052012
          end;
        end;
      end;
    end;

    if Assigned(radar.OnFireControlUpdated) then
    begin
      radar.OnFireControlUpdated(radar);
    end;
  end;
end;

procedure TT3ReplayClient.Frame_Cmd_MergeTrack(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_MergeTrack;
  aPlatform: TT3PlatformInstance;
  aDetect: TT3DetectedTrack;
  aESM: TT3EsmTrack;
begin
  r := @apRec^;

  if (IsController) then
    Exit;

  if r^.GroupID <> CurrentPerspective then
    Exit;

  aPlatform := FindT3PlatformByID(r^.DetectedTrackNumber);
  if aPlatform = nil then Exit;

  aDetect   := findDetectedTrack(aPlatform) as TT3DetectedTrack;
  if aDetect = nil then Exit;

  aESM      := FindESMByTrackNumber(IntToStr(r^.EsmTrackNumber));
  if aESM = nil then Exit;

  //merge
  if r^.OrderMerge then
  begin
    aDetect.MergedESM := aESM;
    aESM.IsMerged := True;

    if Assigned(aDetect.OnMerged) then
      aDetect.OnMerged(aDetect);
  end
  // unmerge
  else
  begin
    aESM.IsMerged := false;

    if Assigned(aDetect.OnUnmerged) then
      aDetect.OnUnmerged(aDetect);

    aDetect.MergedESM := nil;
  end;
end;

procedure TT3ReplayClient.Frame_Cmd_OverlayStaticShape(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecCmd_OverlayStaticShape;
begin
  r := @apRec^;

  if r = nil then
    Exit;

  if r.SessionID <> FSessionID then
    Exit;

  CreateOverlayShape(r^);

end;

procedure TT3ReplayClient.Frame_Cmd_OverlayTemplate(apRec: PAnsiChar;aSize: word);
var
  r: ^TRecCmd_OverlayTemplate;
//  rec: TRecCmd_OverlayTemplate;
begin
  r := @apRec^;

  if r = nil then
    Exit;

//  rec.Name := r.Name;
//  rec.IdAction := r.IdAction;
//  rec.Tipe := r.Tipe;
//  rec.Domain := r.Domain;
//  rec.Cubicle := r.Cubicle;

//  if r^.Cubicle = 0 then
//  begin
//    TT3ReplayEventManager(EventManager).OnOverlayTemplate(rec);
//  end
//  else
//  begin
//    if CurrentPerspective = r^.Cubicle then
//      TT3ReplayEventManager(EventManager).OnOverlayTemplate(rec);
//  end;
  CreateOverlayTamplate(r^);
end;

procedure TT3ReplayClient.Frame_Cmd_RampController(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_RampController;
begin
  rec := @apRec^;

  ChangeRampState(rec^);
end;

procedure TT3ReplayClient.Frame_Cmd_State_Logistic(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_State_Logistic;
begin
  rec := @apRec^;

  ChangeLogisticState(rec^);
end;

procedure TT3ReplayClient.Frame_CopyChaffLauncherProperty(apRec: PAnsiChar;
  aSize: word);
var
  r : ^TRecCmd_LaunchChaffState;
begin
  r := @apRec^;
  CopyChaffLauncherProp(r^);
end;

procedure TT3ReplayClient.Frame_ECMCommand(apRec: PAnsiChar; aSize: word);
var
  rec : ^TRecECMCommand;
  jammerObject, jammerOwner, jammedObject, jammedOwner, detTrack, trackObj : TObject;
  foundParent : boolean;
  i :integer;
begin

  rec := @apRec^;
  // from simserver
  case rec.OrderID of
    CORD_ID_SD_SETMODE,
    CORD_ID_SD_SETMANMODE,
    CORD_ID_SD_SETSPOTNUMBER,
    CORD_ID_SD_SETBEARING,
    CORD_ID_SD_SETTRACK :
      begin
        jammerObject := nil;

        jammerOwner := FindT3PlatformByID(rec.JammerObjectOwnerID);
        if Assigned(jammerOwner) then
          jammerObject := FindT3DeviceByID(TT3DefensiveJammerOnVehicle,
                          TSimObject(jammerOwner),rec.JammerObjectID );

        if not Assigned(jammerObject) then
          Exit;

        with TT3DefensiveJammerOnVehicle(jammerObject) do
        begin
          {0:off, 1:manual; 2:auto}
          case rec^.Mode of
            0 : Status := esOff;
            1 : Status := esManual;
            2 : Status := esAutomatic;
          end;

          {0:track; 1:spot}
          case rec^.ManualTgtType of
            0 : Targeting := ettTrack;
            1 : Targeting := ettSpot;
          end;

          SpotNumber  := rec^.SpotNumber;
          Bearing     := rec^.Bearing;

          {set target index for manual by track mode}
          case Byte(rec^.JammedObjectType) of
            Byte(jotMissile) : TargetIndex := rec^.JammedObjectID;
            Byte(jotFCR)     : TargetIndex := rec^.JammedObjectOwnerID;
          end;
        end;
      end;
  end;

  // froms simclient
  jammerObject := nil;

  jammerOwner := FindT3PlatformByID(rec.JammerObjectOwnerID);
  if Assigned(jammerOwner) then
  begin
    jammerObject := FindT3DeviceByID(TT3DefensiveJammerOnVehicle,
                    TSimObject(jammerOwner),rec.JammerObjectID );
  end;

  if not Assigned(jammerObject) then
    Exit;

  case rec.OrderID of
    CORD_ID_SD_EVTJAMSUCCESS :
      begin
        jammedObject := nil;

        case TJammedObjectType(rec.JammedObjectType) of
          jotFCR :
            begin
              jammedOwner := FindT3PlatformByID(rec.JammedObjectOwnerID);
              if Assigned(jammedOwner) then
                jammedObject := FindT3DeviceByID(TT3Radar,
                                TSimObject(jammedOwner),rec.JammedObjectID );
            end;
          jotMissile :
            jammedObject := FindT3PlatformByID(rec.JammedObjectID);
        end;

        if not Assigned(jammedObject) then
          Exit;

        { apply effect }
        TT3DefensiveJammerOnVehicle(jammerObject).ApplyJammedEffect(jammedObject);

        { hanya berlaku di cubicle saja untuk jam status automatic }
        if (CurrentPerspective <> 0) and (jammedObject is TT3Radar) then
        begin
          { if automatic mode, break parent only }
          foundParent := False;
          detTrack := nil;

          if TT3Radar(jammedObject).AssignedTrack <> nil then
          begin
            for I := 0 to TT3Radar(jammedObject).AssignedTrack.Count - 1 do
            begin
              detTrack := TT3Radar(jammedObject).AssignedTrack.Items[i];

              if detTrack.ClassType = TT3DetectedTrack then
              begin
                trackObj := TT3DetectedTrack(detTrack).TrackObject;

                if trackObj = jammerOwner then
                begin
                  foundParent := true;
                  Break;
                end;
              end;
            end;

            if foundParent then
            begin
              TT3Radar(jammedObject).AssignedTrack.Delete(I);

              if detTrack <> nil then
                TT3DetectedTrack(detTrack).IsAssigned := False;
            end;
          end;
        end;

        if jammedObject is TT3Radar then
        begin
          if Assigned(TT3Radar(jammedObject).OnFireControlUpdated) then
            TT3Radar(jammedObject).OnFireControlUpdated(TT3Radar(jammedObject));
        end;
      end;
    CORD_ID_SD_SETMODE,
    CORD_ID_SD_SETMANMODE,
    CORD_ID_SD_SETSPOTNUMBER,
    CORD_ID_SD_SETBEARING,
    CORD_ID_SD_SETTRACK :
      begin
        EventManager.OnECMCommand(jammerObject);
      end;
  end;

end;

procedure TT3ReplayClient.Frame_EngageTrack(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_EngageTrack;
  p, tgt: TT3PlatformInstance;
  ve: TT3Vehicle;
begin
  netRecv_EngageTrack(apRec, aSize) ;

  rec := @apRec^;
  p := FindT3PlatformByID(rec^.PlatformID);
  tgt := FindT3PlatformByID(rec^.TargetID);
  if (p = nil) then
    Exit;
  ve := TT3Vehicle(p);

  ve.ShipPlatform := p;
  ve.TargetPlatform := tgt;
  ve.MissileID := rec^.MisID;
  ve.isHaveLaunch := rec^.isHaveLaunch;
end;

procedure TT3ReplayClient.Frame_MessageHandling(apRec: PAnsiChar; aSize: word);
var
  RecRecv : ^TRecSendMessage;
begin
  RecRecv := @apRec^;
  EventManager.OnReceiveMessageHandling(RecRecv^);
end;

procedure TT3ReplayClient.Frame_ModifComm(apRec: PAnsiChar; aSize: word);
begin

end;

procedure TT3ReplayClient.Frame_MultiMode(apRec: PAnsiChar; aSize: Word);
var
  rec : ^TRecCmdMultiMode;
  p: TT3PlatformInstance;
  i : Integer;
  aObj : TObject;
begin
  rec := @apRec^;

  p := FindT3PlatformByID(rec^.PlatformID[0]);

  if not Assigned(p) then
    p := FindNonRealPlatformByID(rec^.PlatformID[0]);

  if rec^.aAction = C_ADD then //add
  begin
    if p <> nil then
    begin
      if Assigned(ListPlatformSelect) then
        ListPlatformSelect.Add(p);
    end;
  end
  else if rec^.aAction = C_CLEAR  then
    ListPlatformSelect.Clear
  else if rec^.aAction = C_MOVE then
  begin
    if Assigned(ListPlatformSelect) then
    begin
      for i := 0 to ListPlatformSelect.Count - 1 do
      begin
        aObj := ListPlatformSelect.Items[i];
        if aObj is TT3PlatformInstance then
        begin
          p := TT3PlatformInstance(aObj);
          p.RepositionTo(Rec^.X + p.getPositionX, rec^.Y + p.getPositionY);
        end;
      end;

    end;
  end;
end;

procedure TT3ReplayClient.Frame_Personelmove(apRec: PAnsiChar; aSize: word);
begin
  netRecv_Platform_PersonelMove(apRec,aSize)
end;

procedure TT3ReplayClient.Frame_PlatformGroupChange(apRec: PAnsiChar;
  aSize: word);
var
  OldFound, NewFound : Boolean;
  i : Integer;
  grp, OldGroup, NewGroup : T3CubicleGroup;
  SelectedMember  : TPlatform_Instance;
  ve : TT3Vehicle;
  rec : ^TRecPlatformGroupChange;
  MyGroup : T3CubicleGroup;
begin
  //choco
  //overall lancar, cuma ada problem ketika yg yg di assign itu "Unassigned Group"
  //(tracknumber belum ada, voip belum ada) soalnya "Unassigned Group" ini group generate-an

  rec := @apRec^;

  ChangePlatformGroup(rec^, ve, OldGroup, NewGroup);

  if Assigned(OldGroup) and Assigned(NewGroup) then
  begin
    if Assigned(ve) then
    begin
      if CurrentPerspective = 0 then
      begin
        ve.UnitGroup := True;
        ve.Enable := True;
        ve.TrackLabel := ve.Track_ID;
        ve.LoadPlatformSymbol;
      end
      else
      begin
        ve.UnitGroup := (NewGroup.FData.Group_Index = MyGroup.FData.Group_Index);
        ve.Enable := ve.UnitGroup;

        if Assigned(NewGroup) then
        begin
          OldGroup.RemoveTrackNumber(ve.InstanceIndex);
          ve.TrackNumber := MyGroup.GetTrackNumber(ve.InstanceIndex);
        end
        else
          ve.TrackNumber := 9999;

        ve.TrackLabel := FormatTrackNumber(ve.TrackNumber);
        ve.TrackDomain := ve.PlatformDomain;
        ve.TrackIdent := piFriend;
      end;

      if (OldGroup.FData.Group_Index = MyGroup.FData.Group_Index) or (NewGroup.FData.Group_Index = MyGroup.FData.Group_Index) then
        SimDetectedTrackList.ClearAndRemove;

      EventManager.OnUpdateTacticalTote;

      if IsController then
        EventManager.OnUpdateTvCubicleGroup;
    end;
  end;
end;

procedure TT3ReplayClient.Frame_PlatformHitPlatform(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecPlatformHitPlatform;
  Sender, Target : TT3PlatformInstance;
begin
  aRec := @apRec^;

  if (aRec^.FreeWeapon) then
  begin
    Sender := FindT3PlatformByID(aRec^.SenderID);
    if Sender = nil then
      Sender := FindWeaponByID(aRec^.SenderID);

    if not Assigned(Sender) then
      Sender := TT3PlatformInstance(FindDeviceByID(aRec^.SenderID));

    Target := FindT3PlatformByID(aRec^.TargetID);

    if Sender is TT3Torpedo then
    begin
      TT3Torpedo(Sender).FreeChilds;
      Sender.FreeMe := True;
      Sender.AbsoluteFree := True;

      if Target is TT3Bomb then
      begin
        TT3Bomb(Target).FreeChilds;
        Target.FreeMe := True;
        Target.AbsoluteFree := True;
      end;
    end
    else if Sender is TT3Bomb then
    begin
      TT3Bomb(Sender).FreeChilds;
      Sender.FreeMe := True;
      Sender.AbsoluteFree := True;
    end
    else if Sender is TT3Missile then
    begin
      if Target is TT3Chaff then
      begin
        if TT3Missile(Sender).Definition.ECM_Detonation = 0 then //No Detonate to Chaff
          Exit;

        if TT3Chaff(Target).ChaffCategory = ecgDistraction then
        begin
          TT3Missile(Sender).FreeChilds;
          Sender.FreeMe := True;
          Sender.AbsoluteFree := True;

          TT3Chaff(Target).FreeChilds;
          Target.FreeMe := True;
          Target.AbsoluteFree := True;
        end
        else if TT3Chaff(Target).ChaffCategory = ecgSeduction then
        begin
          TT3Chaff(Target).FreeChilds;
          Target.FreeMe := True;
          Target.AbsoluteFree := True;
        end;
      end
      else if Target is TT3InfraredDecoy then
      begin
        TT3Missile(Sender).FreeChilds;
        Sender.FreeMe := True;
        Sender.AbsoluteFree := True;

        TT3InfraredDecoy(Target).FreeChilds;
        Target.FreeMe := True;
        Target.AbsoluteFree := True;
      end
      else if Target is TT3FloatingDecoy then
      begin
        TT3Missile(Sender).FreeChilds;
        Sender.FreeMe := True;
        Sender.AbsoluteFree := True;

        TT3FloatingDecoy(Target).FreeChilds;
        Target.FreeMe := True;
        Target.AbsoluteFree := True;
      end
      else
      begin
        TT3Missile(Sender).FreeChilds;
        Sender.FreeMe := True;
        Sender.AbsoluteFree := True;
      end;
    end
    else if Sender is TT3GunShoot then
    begin
      TT3GunShoot(Sender).FreeChilds;
      Sender.FreeMe := True;
      Sender.AbsoluteFree := True;

      if Target is TT3Missile then
      begin
        TT3Missile(Target).FreeChilds;
        Target.FreeMe := True;
        Target.AbsoluteFree := True;
      end;
    end
    else if Sender is TT3GunOnVehicle then
    begin
      if Target is TT3Missile then
      begin
        TT3PlatformInstance(Target).reasonDestroy := 21;
        TT3PlatformInstance(Target).UnitMakeDestroy := TT3PlatformInstance(Sender).InstanceName;

        TT3Missile(Target).FreeChilds;
        Target.FreeMe := True;
        Target.AbsoluteFree := True;
      end;
    end;
  end;

  EventManager.OnWeaponHitByServer(aRec^.SenderID, aRec^.TargetID,
    aRec^.lethality, aRec^.Parent);
end;

procedure TT3ReplayClient.Frame_SetLauncherQty(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_Set_LauncherQty;
  p: TT3PlatformInstance;
  ve: TT3Vehicle;
begin
  netRecv_SetLauncherQty(aprec,aSize);

  rec := @apRec^;

  p := FindT3PlatformByID(rec^.PlatfomID);
  if (p = nil) then
    Exit;

  ve := TT3Vehicle(p);

  if Assigned(ve.OnUpdateWeapon) then
    ve.OnUpdateWeapon(ve);
end;

procedure TT3ReplayClient.Frame_SetQuantity(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_Set_Quantity;
  p: TT3PlatformInstance;
  ve: TT3Vehicle;
begin

  netRecv_SetQuantity(apRec,aSize) ;

  rec := @apRec^;

  p := FindT3PlatformByID(rec^.PlatfomID);
  if (p = nil) then
    Exit;

  ve := TT3Vehicle(p);

  if Assigned(ve.OnUpdateWeapon) then
    ve.OnUpdateWeapon(ve);
end;

procedure TT3ReplayClient.Frame_SetStatus(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_Set_Status;
  p: TT3PlatformInstance;
  ve: TT3Vehicle;
begin
  netRecv_SetStatus(apRec, aSize);

  rec := @apRec^;

  p := FindT3PlatformByID(rec^.PlatfomID);

  if not (Assigned(p) and (p is TT3Vehicle)) then
    Exit;

  ve := TT3Vehicle(p);

  if Assigned(ve.OnUpdateWeapon) then
    ve.OnUpdateWeapon(ve);

end;

procedure TT3ReplayClient.Frame_SyncBearingMissile(apRec: PAnsiChar;
  aSize: word);
var
  rec : ^TRec_SyncTarget;
  wpn, pi : TT3PlatformInstance;
begin
  rec := @apRec^;

  wpn := FindT3PlatformByID(rec.WeaponID);
  pi  := FindT3PlatformByID(rec.TargetID);

  if wpn is TT3Missile then
    TT3Missile(wpn).SetTargetObject(pi);
end;

procedure TT3ReplayClient.Frame_Synch_ESMvarian(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_EsmVariance;
  aPlatform: TT3PlatformInstance;
  aDetect: TT3DetectedTrack;
  aESM: TT3EsmTrack;
  obj : TObject;
begin
  r := @apRec^;
  if r^.GroupID <> CurrentPerspective then Exit;

  aPlatform := FindT3PlatformByID(r^.ParentDetectedID);
  if aPlatform = nil then Exit;       //mk cba

  obj := TT3Vehicle(aPlatform).getDevice(r^.DetectedID, TT3Radar);
  if obj = nil then Exit;

  aDetect   := findDetectedTrack(TSimObject(obj)) as TT3DetectedTrack;
  if aDetect = nil then Exit;       //mk cba

  aESM := FindESMByDetectedTrack(IntToStr(r^.EsmTrackNumber), aDetect);
  if aESM = nil then Exit;

  if Assigned(aESM.DetectBy) and (aESM.DetectBy is TT3ESMSensor) then
  begin
    if TT3ESMSensor(aESM.DetectBy).InstanceIndex = r^.SensorID then
    begin
      aESM.Variance := r^.nVariance;
    end;
  end;
end;

procedure TT3ReplayClient.Frame_Synch_Pos_VBS(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecUDP_PlatformMovement;
  X, Y, Z, Course: string;
  Obj : TSimObject;
begin
  r := @apRec^;
  X := formatDMS_long(r^.X);
  Y := formatDMS_latt(r^.Y);
  Z := FormatFloat('0.000', r^.Z);
  Course := FormatFloat('0.000', r^.Course);

  Obj := SimPlatforms.getObjectByInstanceIndex(r^.PlatformID);

  if Assigned(Obj) then
  begin
    TT3PlatformInstance(Obj).Heading := ValidateDegree(r^.Course);
    Obj.PosX := r^.X;
    Obj.PosY := r^.Y;
    if Obj is TT3Vehicle then
    TT3Vehicle(Obj).OrderedAltitude := r^.Z;
  end;
end;

procedure TT3ReplayClient.Frame_UpdateNRPProperty(apRec: PAnsiChar;
  aSize: word);
var
  rec: ^TRecCmd_NRP_SET_PROPERTY;
  vIndex: integer;
  obj: TT3NonRealVehicle;
  pi: TT3PlatformInstance;
  detectedTrack: TSimObject;
begin
  rec := @apRec^;

  if (rec.GrpID = 0) and (CurrentPerspective <> 0) then
    Exit;

  if (CurrentPerspective = 0) and (rec.GrpID = 0) then
  begin
    vIndex := rec.PlatfomID;
    obj := FindNonRealPlatformByID(vIndex) as TT3NonRealVehicle;

    if obj = nil then
      Exit;

    case rec.OrderID of
      NRP_ID_TYPE:
        TT3NonRealVehicle(obj).NRPType := rec.TypeNRP;
      NRP_ID_TRACKDOMAIN:
        TT3NonRealVehicle(obj).TrackDomain := rec.domain;
      NRP_ID_TRACKIDENT:
        TT3NonRealVehicle(obj).TrackIdent := rec.Identity;
      NRP_ID_FORCE:
        TT3NonRealVehicle(obj).Force_Designation := rec.Force;
      NRP_ID_PLATFORMTYPE:
        TT3NonRealVehicle(obj).PlatformType := rec.PlatformType;
      NRP_ID_SYMBOLTYPE:
        TT3NonRealVehicle(obj).SymbolType := rec.Symbol;
      NRP_ID_ALL:
        begin
          TT3NonRealVehicle(obj).NRPType := rec.TypeNRP;
          TT3NonRealVehicle(obj).TrackDomain := rec.domain;
          TT3NonRealVehicle(obj).TrackIdent := rec.Identity;
          TT3NonRealVehicle(obj).Force_Designation := rec.Force;
          TT3NonRealVehicle(obj).PlatformType := rec.PlatformType;
          TT3NonRealVehicle(obj).SymbolType := rec.Symbol;
        end;
    end;

    if Assigned(obj.OnChange) then
      obj.OnChange(obj);
  end
  else
  if (rec.GrpID = CurrentPerspective) then
  begin
    vIndex := rec.PlatfomID;
    obj := FindNonRealPlatformByID(vIndex) as TT3NonRealVehicle;

    if obj <> nil then
    begin
      case rec.OrderID of
        NRP_ID_TYPE:
          TT3NonRealVehicle(obj).NRPType := rec.TypeNRP;
        NRP_ID_TRACKDOMAIN:
          TT3NonRealVehicle(obj).TrackDomain := rec.domain;
        NRP_ID_TRACKIDENT:
          TT3NonRealVehicle(obj).TrackIdent := rec.Identity;
        NRP_ID_FORCE:
          TT3NonRealVehicle(obj).Force_Designation := rec.Force;
        NRP_ID_PLATFORMTYPE:
          TT3NonRealVehicle(obj).PlatformType := rec.PlatformType;
        NRP_ID_SYMBOLTYPE:
          TT3NonRealVehicle(obj).SymbolType := rec.Symbol;
        NRP_ID_ALL:
          begin
            TT3NonRealVehicle(obj).NRPType := rec.TypeNRP;
            TT3NonRealVehicle(obj).TrackDomain := rec.domain;
            TT3NonRealVehicle(obj).TrackIdent := rec.Identity;
            TT3NonRealVehicle(obj).Force_Designation := rec.Force;
            TT3NonRealVehicle(obj).PlatformType := rec.PlatformType;
            TT3NonRealVehicle(obj).SymbolType := rec.Symbol;
          end;
      end;

      if Assigned(obj.OnChange) then
        obj.OnChange(obj);
    end
    else
    begin
      pi := FindT3PlatformByID(vIndex) as TT3PlatformInstance;
      detectedTrack := findDetectedTrack(pi as TSimObject);

      if detectedTrack = nil then
        Exit;

      case rec.OrderID of
        NRP_ID_TYPE:
          TT3DetectedTrack(detectedTrack).TrackType := rec.TypeNRP;
        NRP_ID_TRACKDOMAIN:
          TT3DetectedTrack(detectedTrack).TrackDomain := rec.domain;
        NRP_ID_TRACKIDENT:
          TT3DetectedTrack(detectedTrack).TrackIdent := rec.Identity;
        // P_ID_FORCE : TT3DetectedTrack(detectedtrack).track.Force_Designation;
        NRP_ID_PLATFORMTYPE:
          TT3DetectedTrack(detectedTrack).TrackType := rec.PlatformType;
        // NRP_ID_SYMBOLTYPE : TT3DetectedTrack(detectedtrack).SymbolType := rec.symbol;
        NRP_ID_ALL:
          begin
            TT3DetectedTrack(detectedTrack).TrackType := rec.TypeNRP;
            TT3DetectedTrack(detectedTrack).TrackDomain := rec.domain;
            TT3DetectedTrack(detectedTrack).TrackIdent := rec.Identity;
            // TT3DetectedTrack(detectedtrack).Force_Designation := rec.Force;
            TT3DetectedTrack(detectedTrack).TrackType := rec.PlatformType;
            // TT3DetectedTrack(detectedtrack).SymbolType := rec.symbol;
          end;
      end;

      if Assigned(obj.OnChange) then
        obj.OnChange(detectedTrack);
    end;
  end;

  EventManager.OnMapNeedUpdate(nil);
end;

procedure TT3ReplayClient.Frame_UpdatePlatform(apRec: PAnsiChar; aSize: word);
var
  rec : ^TRecCmd_LastUpdatePlatform;
  pi : TT3PlatformInstance;
  nrp : TT3NonRealVehicle;
begin
  rec := @apRec^;

  pi := FindNonRealPlatformByID(rec^.PlatfomID);
  if pi is TT3NonRealVehicle then
  begin
    nrp := TT3NonRealVehicle(pi);
    nrp.LastUpdate := rec^.UpdateTime;
  end;

end;

procedure TT3ReplayClient.Frame_UpdatePropertyPlatform(apRec: PAnsiChar;
  aSize: word);
var
  rec: ^TRecCmd_Platform_SET_PROPERTY;
  pf : TT3PlatformInstance;
  detectedTrack: TSimObject;
  i: integer;
  sensor: TT3Sensor;
begin
  rec := @apRec^;

  pf := UpdatePropertyPlatform(rec^);

  if CurrentPerspective = 0 then
  begin
    if Assigned(pf) then
    begin
      if not(pf is TT3NonRealVehicle) then
        Exit;

      if TT3PlatformInstance(pf).Selected then
        TT3PlatformInstance(pf).Selected := false;

      if rec.domain <> -1 then
      begin
        TT3PlatformInstance(pf).PlatformDomain := rec.domain;
        TT3PlatformInstance(pf).TrackDomain := TT3PlatformInstance(pf)
          .PlatformDomain;
      end;

      if rec.Identity <> -1 then
        TT3PlatformInstance(pf).TrackIdent := rec.Identity;

      if rec.PlatformType <> -1 then
        TT3PlatformInstance(pf).PlatformType := rec.PlatformType;
    end;
  end;

  if CurrentPerspective <> 0 then
  begin
    if rec.GrpID <> CurrentPerspective then
      Exit; // add nando + mamik 30032012

    detectedTrack := findDetectedTrack(pf as TSimObject);
    if detectedTrack <> nil then
    begin
      if TT3DetectedTrack(detectedTrack).Selected then
      begin
        TT3DetectedTrack(detectedTrack).Selected := false;
      end;

      for i := 0 to TT3DetectedTrack(detectedTrack).TrackDetectedBy.Count - 1 do
      begin
        sensor := TT3DetectedTrack(detectedTrack).TrackDetectedBy.Items[i];
        if sensor is TT3DataLink and (TT3DetectedTrack(detectedTrack)
            .TrackDetectedBy.Count <= 1) then
          Exit;
      end;

      if rec.domain <> -1 then
        TT3DetectedTrack(detectedTrack).TrackDomain := rec.domain;

      if rec.Identity <> -1 then
        TT3DetectedTrack(detectedTrack).TrackIdent := rec.Identity;

      if rec.PlatformType <> -1 then
        TT3DetectedTrack(detectedTrack).TrackType := rec.PlatformType;

      FSimMap.FMap.Repaint;
    end
    else
    begin
      if (Assigned(pf) and (pf is TT3NonRealVehicle)) then
      begin
        if TT3PlatformInstance(pf).Selected then
          TT3PlatformInstance(pf).Selected := false;

        TT3PlatformInstance(pf).TrackDomain := rec.domain;
        TT3PlatformInstance(pf).PlatformDomain := rec.domain;
        TT3PlatformInstance(pf).TrackIdent := rec.Identity;
        TT3PlatformInstance(pf).PlatformType := rec.PlatformType;
      end;
    end;
  end;
end;

function TT3ReplayClient.GetBiggestTrackNumber: integer;
var
  i, temp: integer;
  track: TT3DetectedTrack;
begin
  temp := 0;
  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    if track.TrackNumber > temp then
    begin
      temp := track.TrackNumber;
    end;
  end;
  result := temp;
end;

function TT3ReplayClient.GetTrackNumberForWeapon: integer;
begin
  result := FTrackNumberWeapon;
  inc(FTrackNumberWeapon);
end;

procedure TT3ReplayClient.GunFire(rec: TRecCmd_GunFire);
  procedure CloneRec(var recDest:TRecCmd_GunFire; const recSrc : TRecCmd_GunFire);
  begin
    recDest.SessionID         := recSrc.SessionID;
    recDest.ParentPlatformID  := recSrc.ParentPlatformID;
    recDest.GunID             := recSrc.GunID;
    recDest.TargetPlatformID  := recSrc.TargetPlatformID;
    recDest.OrderID           := recSrc.OrderID;
    recDest.ControlMode       := recSrc.ControlMode;
    recDest.SalvoMode         := recSrc.SalvoMode;
    recDest.SalvoSize         := recSrc.SalvoSize;
    recDest.GunCapacityRemain := recSrc.GunCapacityRemain;
    recDest.InterceptRange    := recSrc.InterceptRange;
    recDest.ThresSpeed        := recSrc.ThresSpeed;
    recDest.HitProbability    := recSrc.HitProbability;
    recDest.GunName           := recSrc.GunName;
  end;
var pi, tgt: TT3PlatformInstance;
    wpn   : TT3GunOnVehicle;
    recGF : TRecCmd_GunFire;
begin
  inherited;
  pi   := FindT3PlatformByID(rec.ParentPlatformID);
  tgt  := FindT3PlatformByID(rec.TargetPlatformID);

  if (pi = nil) and not (pi is TT3Vehicle) then
    exit;

  //wpn := TT3Vehicle(pi).getWeapon(rec.GunName, TT3GunOnVehicle) as TT3GunOnVehicle;
  wpn := TT3Vehicle(pi).getWeapon(rec.GunID, TT3GunOnVehicle) as TT3GunOnVehicle;
  if wpn <> nil then begin
    wpn.TargetObject        := tgt;
    wpn.ControlMode         := rec.ControlMode;
    wpn.SalvoMode           := rec.SalvoMode;
    wpn.SalvoSize           := rec.SalvoSize;
    AssignWeaponEvent(wpn);

    case rec.OrderID of
      CORD_ID_assign : //assign gun
        begin
          if tgt = nil then exit;

          wpn.IsAssigned := true;
          tgt.IsAssigned := True;
        end;
      CORD_ID_break  : // break assignment
        begin
          wpn.IsAssigned := false;

          if tgt <> nil then
            tgt.IsAssigned := false;

          // asumsi : jika dalam keadaan firing, batalkan firing
          wpn.CeaseFire;
          wpn.State := 0;
          if Assigned(wpn.OnGunCeaseFire) then
            OnGunCeaseFire(wpn);

          wpn.OnGunFire       := nil;
          wpn.OnGunCeaseFire  := nil;

        end;
      CORD_ID_fire   : // gun fire
        begin
          case wpn.ControlMode of
            1 :
              begin
                //automatic
              end;
            2 :
              begin
                if tgt = nil then exit;
                if (not wpn.IsAssigned) and (not tgt.IsAssigned) and (wpn.GunDefinition.FData.Fire_Cntl_Director_Req = 1) then
                  Exit;
              end;
            3 :
              begin

              end;
            4:
              begin

              end;
          end;

          wpn.State := 1;

          wpn.OnGunFire       := OnGunFire;
          wpn.OnGunCeaseFire  := OnGunCeaseFire;
          wpn.State := 1;
          wpn.WeaponStatus := wsFiring;

        end;
      CORD_ID_cease  : // stop gun fire
        begin
          wpn.State := 0;
          if Assigned(wpn.OnGunCeaseFire) then
            OnGunCeaseFire(wpn);

          wpn.OnGunFire       := nil;
          wpn.OnGunCeaseFire  := nil;
        end;

      CORD_ID_control_mode  : // set control mode
        begin
          // jika control mode berubah, maka batalkan smua pekerjaan sekarang.
          if (wpn.ControlMode <> rec.ControlMode) and (wpn.ControlMode > 0) then begin

            // jika sedang menembak, hentikan menembak
            if wpn.IsAssigned then // berarti sdg mengassign target
            begin
              CloneRec(recGF,rec);
              recGF.OrderID := CORD_ID_break;
              GunFire(recGF);
            end else begin // berarti sedang menembak mode manual
              CloneRec(recGF,rec);
              recGF.OrderID := CORD_ID_cease;
              GunFire(rec);
            end;
          end;

          wpn.ControlMode := rec.ControlMode;
        end;
      CORD_ID_salvo_mode :
        begin
          wpn.SalvoMode := rec.SalvoMode;
        end;
      CORD_ID_target :
      begin
        tgt  := FindT3PlatformByID(rec.TargetPlatformID);
        wpn.TargetObject := tgt;
      end;
      CORD_ID_salvo_size :
      begin
        wpn.SalvoSize := rec.SalvoSize;
      end;
      CORD_ID_intercp_range :
      begin
        wpn.InterceptRange := rec.InterceptRange;
      end;
      CORD_ID_thresh_speed :
      begin
        wpn.ThresholdSpeed := rec.ThresSpeed;
      end;
      CORD_ID_chaff_bloom :
      begin
        wpn.ChaffBloom := rec.ChaffBloom;
      end;
      CORD_ID_chaff_pos :
      begin
        wpn.SetChaffPosition(rec.ChaffX,rec.ChaffY);
      end;
      {send post n altitude NGS target}
      CORD_ID_postNGS  :
      begin
        wpn.PosX := rec.pX;
        wpn.PosY := rec.pY;
        wpn.Altitude := rec.pAltitude;
      end;
    end;
  end;
end;

procedure TT3ReplayClient.JumpTo(const aTime: TTime);
begin
  if Assigned(FOnJumpTo) then
    FOnJumpTo(aTime);
end;

function TT3ReplayClient.LaunchEmbarkPlatform(
  const rec: TRecCmd_Embark): TT3PlatformInstance;
var
  grp: T3CubicleGroup;
begin
  result := inherited;

  if not Assigned(result) then
    Exit;

  result.UnitGroup := result.GroupIndex = CurrentPerspective;

  if result is TT3Vehicle then
  begin
	  grp := FScenario.CubiclesGroupsListFromDB.GetGroupOf_PlatformIndex(rec.ParentPlatformID) ;
    if Assigned(grp) then begin
      grp.AddMember(TT3Vehicle(Result).InstanceIndex);
      TT3Vehicle(Result).TrackNumber := grp.GetTrackNumber(TT3Vehicle(Result).InstanceIndex);
    end;
  end;
end;

function TT3ReplayClient.LaunchRuntimePlatform(
  const rec: TRecCmd_LaunchRP): TT3PlatformInstance;
var
  grp: T3CubicleGroup;
begin
  result := inherited;
  if not Assigned(result) then exit;

  result.isInstructor := FIsInstructor;

  if FIsInstructor then begin
    result.UnitGroup    := true;
    result.Enable       := true;
    result.TrackLabel   := result.Track_ID;
  end;

  grp := FScenario.CubiclesGroupsListFromDB.GetGroupByID(rec.RPGroupID) as T3CubicleGroup;
  if grp <> nil then
  begin
    if grp.FData.Group_Index = 0 then exit;

    grp.AddMember(rec.NewPlatformID);

    result.TrackNumber  := grp.GetTrackNumber(rec.NewPlatformID);
    result.UnitGroup    := (CurrentPerspective = grp.FData.Group_Index) or FIsInstructor;
    result.Enable       := result.UnitGroup;
    result.TrackDomain  := result.PlatformDomain;
    result.GroupIndex   := grp.FData.Group_Index;
    result.TrackLabel   := FormatTrackNumber(result.TrackNumber);
    if Result.UnitGroup then
      result.TrackIdent := piFriend;
  end;
end;

procedure TT3ReplayClient.LoadScenarioID(const vSet: TGameDataSetting);
var
  S: string;
  i, l: integer;
  aObject: TT3PlatformInstance;
  vObj: TT3Vehicle;
  f: boolean;
  sensor: TT3Sensor;
  areaName: string;
begin

  inherited;

  f := false;

  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    aObject := TT3PlatformInstance(SimPlatforms.getObject(i));
    aObject.UnitGroup := true;
    aObject.Enable := true;
    aObject.isInstructor := true;

    // environment
    aObject.Environment := GameEnvironment;

    for l := 0 to TT3Vehicle(aObject).Devices.Count - 1 do
    begin
      sensor := TT3Vehicle(aObject).Devices[l];
      sensor.Environment := GameEnvironment;
    end;

    if aObject is TT3Vehicle then
    begin
      vObj := aObject as TT3Vehicle;
      vObj.TrackLabel := vObj.Track_ID;
      vObj.IsGroupLeader := False;
      vObj.LoadPlatformSymbol;
    end;

    if (not f) and (aObject is TT3Vehicle) then
    begin
      HookedPlatform := aObject;
      TT3Vehicle(aObject).Selected := true;
      f := true;
    end;
  end;

  areaName := GameEnvironment.FGameArea.Game_Area_Identifier;
  fGeo := vMapSetting.MapGSTGame + '\' + areaName + '\' + areaName + '.gst';

  if FScenario.overlayName <> 'empty' then
  begin
    fOver := vMapSetting.OverlayPath + FScenario.overlayName + '\';
  end;

end;

procedure TT3ReplayClient.NetSendMapStub(rec: TRec_MapData);
begin
end;

procedure TT3ReplayClient.OnDisplayGameControl(control: integer);
var
  gs: double;
begin
  gs := 1.00;
  case control of
    1:
      begin
        GameSpeed := 1.0;

        GameStart;
      end;
    2:
      begin
        GamePause;
        GameSpeed := 0.0;
      end;
    3:
      begin ;
        if GameSpeed >= 1.0 then
        begin

          gs := Round(GameSpeed);
          if abs(gs) < 0.0001 then // nol
            gs := 1.0
          else
          begin
            gs := 2.0 * gs;
            if gs > 16.0 then
              exit;
          end;
        end;

        GameSpeed := gs;
      end;
    4 : // rewind
    begin


      GameSpeed := 1.0;
      GameStart;
    end;
  end;
end;

procedure TT3ReplayClient.OnGunFire(Sender: TObject);
var
  wpn : TT3GunOnVehicle;
  shoot : TT3GunShoot;
  pi, pl, parentShoot : TT3PlatformInstance;
  tgt : TT3PlatformInstance;
  r: TRecCmd_GunFire;
  i : Integer;
  TRIPRange : double;
begin
  inherited;
  if not (Sender is TT3GunOnVehicle) then
    Exit;

  wpn := Sender as TT3GunOnVehicle;
  if not Assigned(wpn) then       //mk
    Exit;

  pi := FindT3PlatformByID(TT3PlatformInstance(wpn.Parent).InstanceIndex);
  if not Assigned(pi) and not (pi is TT3Vehicle) then
    Exit;
  if wpn.ControlMode <> 4 then
  begin
    if not Assigned(wpn.TargetObject) then       //mk
      Exit;

    tgt := wpn.TargetObject as TT3PlatformInstance;
    if not Assigned(tgt) then
      Exit;
  end;

  if wpn.ControlMode <> 4 then
  begin
    shoot := wpn.PrepareShoot;

    if shoot <> nil then
    begin
      AssignWeaponEvent(shoot);

      if shoot.InstanceIndex = 0 then
        shoot.InstanceIndex := GetSerialPlatformID
      else
        shoot.InstanceIndex := shoot.InstanceIndex;

      r.TargetPlatformID := TT3PlatformInstance(wpn.TargetObject).InstanceIndex;
      r.HitProbability :=  Byte(shoot.Shoot);
    end;
  end
  else
  begin
    for i := 0 to SimPlatforms.itemCount - 1 do
    begin
      pl := SimPlatforms.getObject(i) as TT3PlatformInstance;

      if not(Assigned(pl)) then
        Continue;

      if not Assigned(wpn.Parent) then
        Continue;

      //cek apakah parent dari gun sendiri
      parentShoot := wpn.Parent as TT3PlatformInstance;
      if pl = parentShoot then Continue;

      //cek apakah subsurface
      if (pl.PlatformDomain = 2) and (pl.Altitude <> 0) then
        Continue;

      //cek apakah altitudenya > max altitude
      if pl.Altitude > (wpn.GunDefinition.FData.Max_Target_Altitude_Delta * C_Feet_To_Meter) then
        Continue;

      //cek max range point area
      TRIPRange := CalcRange(wpn.NGSFlashX, wpn.NGSFlashY, pl.getPositionX, pl.getPositionY);
      if ((TRIPRange) > wpn.GunDefinition.FData.NGS_EffectiveRadius) then
        Continue;

      wpn.TargetObject := pl;
      shoot := wpn.PrepareShoot;
      AssignWeaponEvent(shoot);

      if shoot.InstanceIndex = 0 then
        shoot.InstanceIndex := GetSerialPlatformID
      else
        shoot.InstanceIndex := shoot.InstanceIndex;

      r.HitProbability :=  Byte(shoot.Shoot);
    end;

    wpn.TargetObject := nil;
    r.TargetPlatformID := 0;
  end;
end;

procedure TT3ReplayClient.OnMapChange(sender: TObject);
begin
  FCompass.Width := Converter.FMap.Width;
  FCompass.Height := Converter.FMap.Height;

  Display.MapViewChanged(sender);
end;

procedure TT3ReplayClient.OnTrackBlinking(sender: TObject; Value: Boolean);
begin
  // ini draw ulang
  FSimMap.DrawMap;

end;

procedure TT3ReplayClient.RemoveDetectedTrack(aTrack: TSimObject);
var
  track: TT3DetectedTrack;
  i: integer;
  found: Boolean;
begin

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    found := track.TrackObject = aTrack;
    if found then
    begin
      track.FreeMe := True;
      track.AbsoluteFree := True;
      break;
    end;
  end;

end;

procedure TT3ReplayClient.RemoveDatalinkPlatform(
  rec: TRecCmd_SelectPlatformToRemove);
var
  obj : TT3PlatformInstance;
begin
  obj := nil;
  if not rec.isNRPlatform then
    obj := FindT3PlatformByID(rec.PlatfomID);

  if not Assigned(obj) then
    Exit;

  RemoveDatalinkPlatform(rec.PlatfomID);
end;

procedure TT3ReplayClient.RemoveDatalinkPlatform(aPfID: integer);
var
  obj : TT3PlatformInstance;
  recDL : TRecCmd_DataLink;
  dl : TT3Datalink;
  i : Integer;
begin
  obj := FindT3PlatformByID(aPfID);

  if not Assigned(obj) then
    Exit;

  if obj is TT3Vehicle then
  begin
    { cek ap di datalink }
    dl := DataLinkManager.getDatalinkOnPU(obj);
    if not Assigned(dl) then Exit;

    if DataLinkManager.RemoveDestroyedPlatform(obj) then
    begin

      with recDL do begin
        platformID          := 0;
        PUStatus            := 0;
        for I := 0 to Length(PooledTracksID) - 1 do
          PooledTracksID[i] := 0;
      end;

      recDL.DataLinkID := dl.IDLink;
      recDL.platformID := obj.InstanceIndex;
      recDL.OrderDL    := odlRemovePermanently;
    end;
  end;
end;

function TT3ReplayClient.RemoveDetectedTrack(aTrack,
  sensor: TSimObject): Boolean;
var
  track: TT3DetectedTrack;
  i: integer;
  found: Boolean;
begin
  result := false;
  found := false;
  track := nil;

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    found := track.TrackObject = aTrack;
    if found then
      break;
  end;

  if Assigned(track) and found then
  begin
    result := track.removeDetectBy(TT3DeviceUnit(sensor));
  end;
end;

procedure TT3ReplayClient.RemoveDetectedTrackByDataLink(dataLink: TT3DataLink);
var
  i,j: integer;
  track: TT3DetectedTrack;
  sensor: TT3Sensor;
begin
  for i := SimDetectedTrackList.itemCount - 1 downto 0 do
  begin
    track := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;
    if Assigned(track) then
    begin
      for J := track.TrackDetectedBy.Count - 1 downto 0 do
      begin
        sensor := track.TrackDetectedBy.Items[J];
        if sensor is TT3DataLink and sensor.Equals(dataLink) then
        begin
          // hapus sensor.
          track.TrackDetectedBy.Delete(J);
        end;
      end;

      if track.TrackDetectedBy.Count < 1 then
      begin
        track.Dormant := true;
      end;
    end;
  end;
end;

procedure TT3ReplayClient.RemoveDetectedTracks(sensor: TSimObject);
var
  track: TT3DetectedTrack;
  i: integer;
begin
  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    if not Assigned(track) then continue;

    // track.ISBlinking := True;
    if Assigned(track) then
    begin
      if Assigned(track.OnUnmerged) then
        track.OnUnmerged(track);

      track.MergedESM := nil;
    end;

    if track.removeDetectBy(TT3DeviceUnit(sensor)) then
    // add pak andik 20042012
    begin
    end;
  end;
end;

procedure TT3ReplayClient.RemoveESMTracks(aObj: TSimObject);
var
  track: TT3DetectedTrack;
  ESM : TObject;
  i, j: integer;
begin
  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    if not(Assigned(track)) then Continue;

    if track.ESMTracks.Count > 0 then
    begin
      for j := track.ESMTracks.Count - 1 downto 0 do
      begin
        ESM := track.ESMTracks.Items[j];

        if ESM is TT3ESMTrack then
        begin
          if TT3ESMTrack(ESM).TrackObject.Parent = aObj then
          begin
            if Assigned(TT3ESMTrack(ESM)) then
            begin
              if TT3ESMTrack(ESM).IsMerged then
              begin
                TT3ESMTrack(ESM).IsMerged := False;

                if Assigned(track.OnUnmerged) then
                  track.OnUnmerged(track);

                track.MergedESM := nil;
              end;
            end;

            track.ESMTracks.Remove(ESM);
          end;
        end;
      end;
    end
    else
    begin
      if track.MergedESM <> nil then
      begin
        if track.TrackObject = aObj then
        begin
          if Assigned(TT3ESMTrack(track.MergedESM)) then
          begin
            if TT3ESMTrack(track.MergedESM).IsMerged then
            begin
              TT3ESMTrack(track.MergedESM).IsMerged := False;

              if Assigned(track.OnUnmerged) then
                track.OnUnmerged(track);

              track.MergedESM := nil;
              track.ESMTracks.Clear;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TT3ReplayClient.RemovePlatformByOperator(
  rec: TRecCmd_SelectPlatformToRemove);
var
  obj, PfSonobuoy, ParentSono: TT3PlatformInstance;
  i : Integer;
  sObj : TSimObject;
  v : TT3Vehicle;
begin
  if not rec.isNRPlatform then
    obj := FindT3PlatformByID(rec.PlatfomID)
  else
    obj := FindNonRealPlatformByID(rec.PlatfomID);

  if not Assigned(obj) then
    Exit;

  if obj is TT3Vehicle then
  begin
    // added by choco : biar pas didelete di Tote Display diberikan reason "Delete By User"
    obj.reasonDestroy := 1;

    if obj is TT3NonRealVehicle then
    begin
      obj.FreeMe := true;
      obj.Dormant:= True;
      obj.Enable := False;
    end
    else  if obj is TT3Vehicle then
    begin
      RemoveESMTracks(obj);
      obj.Dormant := True;
    end;
  end
  else if obj is TT3Missile then
  begin
    // added by choco : biar pas didelete di Tote Display diberikan reason "Delete By User"
    obj.reasonDestroy := 1;

    TT3Missile(obj).FreeChilds;
    obj.AbsoluteFree := true;
  end
  // Tambahan Gue : Prince Achmad (biar pas didelete di Tote Display diberikan reason "Delete By User")
  else if obj is TT3Torpedo then
  begin
    obj.reasonDestroy := 1;

    TT3Torpedo(obj).FreeChilds;
    obj.AbsoluteFree := true;

  end
  else if obj is TT3Mine then
  begin
    obj.reasonDestroy := 1;

    TT3Mine(obj).FreeChilds;
    obj.AbsoluteFree := true;
  end
  // ------------------------------
  else if obj is TT3Chaff then
  begin
    // added by choco : biar pas didelete di Tote Display diberikan reason "Delete By User"
    obj.reasonDestroy := 1;

    TT3Chaff(obj).FreeChilds;
    obj.AbsoluteFree := true;
  end
  else if obj is TT3Sonobuoy then
  begin
    obj.reasonDestroy := 1;

    TT3Sonobuoy(obj).PlatformDetectBySonobuoy.Clear;
    if Assigned(TT3Sonobuoy(obj).parentSonobuoy) then
    begin
      ParentSono := TT3Sonobuoy(obj).parentSonobuoy;
      for i := 0 to ParentSono.SonobuoyList.Count -1 do
      begin
        PfSonobuoy := TT3PlatformInstance(ParentSono.SonobuoyList.Items[i]);
        if PfSonobuoy.InstanceIndex = obj.InstanceIndex  then
        begin
          ParentSono.SonobuoyList.Remove(ParentSono.SonobuoyList.Items[i]);
          break;
        end;
      end;
    end;
    TT3Sonobuoy(obj).FreeChilds;
    obj.AbsoluteFree := true;
  end;

  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    sObj := SimPlatforms.getObject(i);

    if sObj is TT3Vehicle then
    begin
      v := TT3Vehicle(sObj);

      if (obj is TT3Missile) and
         (v.InstanceIndex = TT3Missile(obj).EngagementParentID) then
        v.isEngagementWeaponFire := False
      else if (obj is TT3Torpedo) and
         (v.InstanceIndex = TT3Torpedo(obj).EngagementParentID) then
        v.isEngagementWeaponFire := False;
    end;
  end;
end;

procedure TT3ReplayClient.RemovePlatformFromGroup(ve: TT3Vehicle);
var
  grp : T3CubicleGroup;
  grm : T3CubicleGroupMember;
  i, j : Integer;
begin
  if not(Assigned(ve)) then Exit;

  for i := 0 to Scenario.CubiclesGroupsListFromDB.Count - 1 do
  begin
    grp := T3CubicleGroup(Scenario.CubiclesGroupsListFromDB.Items[i]);

    if (grp <> nil) then
    begin
      if grp.FData.Group_Index <> CurrentPerspective then
        Continue;

      for j := 0 to grp.Count - 1 do
      begin
        grm := T3CubicleGroupMember(grp.Items[j]);

        if grm <> nil then begin
          if grm.FData.Platform_Instance_Index = ve.InstanceIndex then
          begin
            grp.RemoveMember(grm.FData.Platform_Instance_Index);
            Break;
          end;
        end;
      end;
    end;
  end;
end;

function TT3ReplayClient.Remove_DetectedTrack(aTrack,
  sensor: TSimObject): Boolean;
var
  track: TT3DetectedTrack;
  i: integer;
  found: Boolean;
begin
  result := false;
  found := false;
  track := nil;

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    found := track.TrackObject = aTrack;

    if found then
      break;
  end;

  if found then
  begin
    result := track.removeDetectBy(TT3DeviceUnit(sensor));
  end;

end;

procedure TT3ReplayClient.SetCurrentPerspective(const Value: integer);
begin
  FCurrentPerspective := Value;

  if Value = 0 then // instruktur
    FIsInstructor := true
  else
    FIsInstructor := false;
end;

procedure TT3ReplayClient.SetOnJumpTo(const Value: TEventJumpToTime);
begin
  FOnJumpTo := Value;
end;

procedure TT3ReplayClient.SetOnLogStr(const Value: TLogStrProc);
begin
  FOnLogStr := Value;
end;

procedure TT3ReplayClient.Show;
var
  x, y: double;
begin

  if FileExists(fGeo) then
  begin
    SimMap.LoadMap(fGeo);

    if Assigned(HookedPlatform) then
    begin
      if HookedPlatform.ClassType = TT3DetectedTrack then
      begin
        x := TT3DetectedTrack(HookedPlatform).getPositionX;
        y := TT3DetectedTrack(HookedPlatform).getPositionY;
      end
      else
      begin
        x := TT3PlatformInstance(HookedPlatform).getPositionX;
        y := TT3PlatformInstance(HookedPlatform).getPositionY;
      end;
      SimMap.FMap.ZoomTo(50, x, y);
    end
    else
      SimMap.FMap.ZoomTo(50, SimMap.FMap.CenterX, SimMap.FMap.CenterY);
  end;
  Display.Show;
end;

procedure TT3ReplayClient.UnAssignedAllEvent;
var
  i : integer;
  obj : TObject;
begin
  // safely remove
  for i := 0 to SimPlatforms.itemCount - 1 do begin
    obj := SimPlatforms.getObject(i);
    if obj is TT3PlatformInstance then
      UnassignPlatformInstanceEvent(obj as TT3PlatformInstance);
  end;

  for i := 0 to SimDevices.itemCount - 1 do begin
    obj := SimDevices.getObject(i);
    if obj is TT3Weapon then
      UnassignWeaponEvent(obj as TT3Weapon)
    else
    if obj is TT3Sensor then
      UnassignSensorEvent(obj as TT3Sensor)
    else
    if obj is TT3CounterMeasure then
      UnassignECMEvent(obj as TT3CounterMeasure);
  end;

  for i := 0 to SimWeapons.itemCount - 1 do begin
    obj := SimWeapons.getObject(i);
    if obj is TT3Weapon then
      UnassignWeaponEvent(obj as TT3Weapon);
  end;

end;

procedure TT3ReplayClient.ResetReplay;
begin
  // reset all global var
  FCurrentPerspective := 0;
  FTrackNumber        := 1000;
  FTrackNumberWeapon  := 4000;
end;

procedure TT3ReplayClient.ResetScenario;
begin
  inherited;

  FMainVTime.Reset(0);
//  FMainVTime.DateTimeOffset := FScenario.Resource_alloc.FData.Game_Start_Time;
  FMainVTime.DateTimeOffset := FScenario.ResourceAllocation.FData.Game_Start_Time;

  SimDetectedTrackList.ClearAndRemove;
  SimShipingRoute.Clear;
  SimPlotting.Clear
end;

end.
