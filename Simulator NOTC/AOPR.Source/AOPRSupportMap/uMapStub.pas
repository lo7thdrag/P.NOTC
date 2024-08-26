unit uMapStub;

interface

uses
  uThreadTimer,uGameData_TTT,Classes, SysUtils, Windows, uSteppers, tttData;

type
  TMapStub = class
  private
    FRunner      : TMSTimer;
    FNetworkThread     : TMSTimer;
    FDelay       : double;
    FDelayCount  : double;
    FOnLogStr: TLogStrProc;
    procedure onRunningThread(const dt: double);
    procedure NetworkThread_OnRunning(const dt: Double);
    procedure SetOnLogStr(const Value: TLogStrProc);
  public
    constructor Create;

    procedure DepthChecker(var rec : TRec_MapData);
    property OnLogStr : TLogStrProc read FOnLogStr write SetOnLogStr;
  end;

var
  VMapStub : TMapStub;

implementation

uses
  uTCPDatatype, uNetStub,
  uMapLayerDB, DateUtils;

function DateTimeToMilliseconds(aDateTime: TDateTime): Int64;
var
   TimeStamp: TTimeStamp;
begin
  {Call DateTimeToTimeStamp to convert DateTime to TimeStamp:}
   TimeStamp := DateTimeToTimeStamp (aDateTime);
   {Multiply and add to complete the conversion:}
   Result := Int64 (TimeStamp.Date) * MSecsPerDay + TimeStamp.Time;
end;

{Uses DateTimeToTimeStamp, TimeStampToMilliseconds, and DateTimeToMilliseconds. }
function MillisecondsBetween (const anow, athen: TDateTime): Int64;
begin
   if anow > athen then
     Result := DateTimeToMilliseconds(anow) - DateTimeToMilliseconds(athen)
   else
     Result := DateTimeToMilliseconds(athen) - DateTimeToMilliseconds(anow);
end;

constructor TMapStub.Create;
begin
  FRunner  := TMSTimer.Create;
  FRunner.Interval := 200;
  FRunner.OnRunning := onRunningThread;
  FRunner.Enabled  := true;

  FNetworkThread := TMSTimer.Create;
  FNetworkThread.Interval := 2;
  FNetworkThread.OnRunning := NetworkThread_OnRunning;
//  FNetworkThread.OnTerminate := FNetworkThread_OnTerminate;
  FNetworkThread.Enabled := True;

  FDelayCount := 0;
  FDelay := FRunner.Interval * 60 * 5;  // 60 second

end;

procedure TMapStub.onRunningThread(const dt: double);
var
  qCount : integer;
  rec   : TRec_MapData;
  Item  : TRItem;
  OnDelay : Boolean;
  diff : double;
  log : String;
  fX, fY :  String;
  start, stop : extended;
  elapse : extended;
begin

  if VNetStub.GetCount <= 0 then exit;

  OnDelay := false;
  FDelayCount := FDelayCount + dt;
  if FDelayCount >= FDelay then begin
    FDelayCount := 0;
    OnDelay := true;
  end;

  for qCount := 0 to VNetStub.GetCount - 1 do begin
    VNetStub.GetItem(qCount,Item);
    if Item.FlagStatus = fsNeedUpdate then begin
      VNetStub.SetFlagItem(Item.InstanceIndex,Item.SessionID,fsNone);

      rec.PlatformID := Item.InstanceIndex;
      rec.SessionID  := Item.SessionID;
      rec.OrderID    := CORD_MAPS_DEPTH;
      rec.IsOnLand   := false;
      rec.dAvail     := false;
      rec.dMin       := 0;
      rec.dMax       := 0;
      rec.elev       := 0;
      rec.X          := Item.PosX;
      rec.Y          := Item.PosY;

      // hanya utk melihat performance query kedalaman
      start := GetTickCount;
      DepthChecker(rec);
      stop  := GetTickCount;
      elapse := (stop - start) / 1000; // s

      VNetStub.SendBroadcast(CPID_CMD_MAPS,@rec);

      fX := FormatFloat('0.####',rec.X);
      fY := FormatFloat('0.####',rec.Y);

      log := IntToStr(rec.PlatformID) + ' (' + fX + ';' + fY + ') : ' +
             ' OnLand : ' + BoolToStr(rec.IsOnLand,True) +
             '; DepthMin : ' + FloatToStr(rec.dMin) +
             '; DepthMax : ' + FloatToStr(rec.dMax) +
             ' (' + FloatToStr(elapse) + ' sec)';
      FOnLogStr('TMapStub.onRunningThread', log);
      //Sleep(20);
    end;

    // check obsolete item
    if OnDelay then begin
      diff := MillisecondsBetween(Now,Item.LastUpdate) / ( 1000 * 60 ); // minutes
      if diff > 5 then // default 5 menit item harus diremove
        Item.FlagStatus := fsRemove;
    end;
  end;

end;

procedure TMapStub.SetOnLogStr(const Value: TLogStrProc);
begin
  FOnLogStr := Value;
end;

procedure TMapStub.DepthChecker(var rec : TRec_MapData);
var dMin, dMax : double;
    depthAvail: boolean;
begin
  rec.IsOnLand   := DepthLayerDB.GetMapLand(rec.x, rec.y, dMin, dMax);

  if rec.IsOnLand then begin
    //getElev
    //rec.elev
    rec.dMin := dMin;
    rec.dMax := dMax;
  end
  else begin
    try
      depthAvail := DepthLayerDB.GetMapDepth(rec.x, rec.y, dMin, dMax);
      //pi.DepthCheck(depthAvail, dMin, dMax);
    except
      //depthAvail := false;
      depthAvail := True;
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

end;

procedure TMapStub.NetworkThread_OnRunning(const dt: Double);
begin
  VNetStub.GetPacket;
end;

end.
