unit uWaypoint;

interface

uses Windows,uDBAsset_Scripted, Classes, tttData, Graphics,uCoordConvertor,
     uSimObjects, Dialogs,uSnapshotData,

     //nando
     {uDBAsset_Vehicle,} uT3Unit, uGameData_TTT, ExtCtrls, uT3UnitContainer,
     uObjectVisuals;

type
  TOnWaypointReached = procedure (behavoiur, event : TObject) of object;

  TOnWaypoint_OnRadar = procedure (aShipID, aRadarIndex,
    aEventMode : Integer) of object;
  TOnWaypoint_OnSonar = procedure (aShipID, aSonarIndex,
    aEventMode : Integer) of object;
  TOnWaypoint_OnIFF = procedure (aShipID, aIffIndex, aIffType,
    aEventMode : Integer) of object;
  TOnWaypoint_DeployContinousEvent = procedure (aShipID, aObjIndex : Integer;
    aObjType, aSonoMode : Byte; aObjDepth, aObjSpacing : Double;
    aObjQty : Integer; aDeployUntilNextWaypoint : Boolean) of object;
  TOnWaypoint_DeploySonobuoy = procedure (aShipID, aSonoIndex : Integer;
    aSonoMode : Byte; aDepth : Double) of object;
  TOnWaypoint_LaunchMissile = procedure (aParentID, aTargetID, aMissileID,
    aSalvo : integer) of object;
  TOnWaypoint_LaunchTorpedo = procedure (aParentID, aTargetID, aMissileID,
    aSalvo : integer) of object;
  TOnWayPoint_LaunchBomb = procedure (aParentID, aTargetID, aMissileID,
    aSalvo : integer) of object;
  TOnWaypoint_DeployMine = procedure (aShipID, aMineIndex : Integer; aDepth
    : Double) of object;
  TOnWayPoint_LaunchGun = procedure (aParentID, aTargetID, aMissileID,
    aSalvo : integer) of object;
  TOnWaypoint_OnCountermeasure = procedure (aShipID, aCMIndex,
    aEventMode : Integer) of object;
  TOnWaypoint_OnDatalink = procedure (aShipID, aDatalinkIndex, aDatalinkType,
    aEventMode : Integer) of object;
  TOnWaypointEnd = procedure (aShipID : Integer; aSpeed,
    aHeading : Double) of object;
  TOnWaypointDestinantion_Change = procedure (aShipID : Integer; Long,
    Lat : Double) of object;
  TOnWaypointRemoveOwner = procedure (aShipID : Integer) of object;

  TWaypointEventType  = (wetRadar, wetSonar, wetIFFTransponder, wetIFFInterogator, wetSonobuoy,
                         wetWeapon1, wetWeapon2, wetWeapon3, wetWeapon4, wetWeapon5, wetMine,
                         wetCounterMeasure, wetComHF, wetComUHF, wetNone);

  TWaypointEventClass = class
    FType   : TWaypointEventType;
    FEnable : boolean;
    FData   : TObject;  // object of scripted event
    FObjectInstanceIndex :  integer;
  end;

  TWaypoint = class
  private
    FWPList : TList;
    FWPRangeList : TList;
    FWPListCache : TList;
    FPixelTrails : array of TPoint;
    //FEvents: TList;
    FTermination : TWaypointTermination;
    FIndexPoint : Integer;
    FOwner : TSimObject;

    FOwnerPositionX : Integer;
    FOwnerPositionY : Integer;
    FOnPointReached : TOnWaypointReached;
    FOffsetX, FOffsetY : Double;
    FPNextWaypoint : ^TRecWaypoint;
    FEnabled : Boolean;
    FIsOwnerHooked : Boolean;
    FIsOpenGuidanceTab : Boolean;

    //-nando
    FisRemoveOwner  : Boolean;
    FRunWaypoint    : Boolean;
    FStartWaypointX : Double;
    FStartWaypointY : Double;
    FShipOwn        : TT3PlatformInstance;
    FTimer          : TTimer;
    FIdTimer        : Integer;
    //Focused_weapon  : TSimObject;
    MisilleRemain   : Integer;
    ArrayMisLauch   : array[0..4] of TRecCmd_LaunchMissile;
    IDArray         : Integer;
    IDLaunchMismile : Integer;
    //choco
    FNextNodeID     : Integer;
    FIsChange       : Boolean;

    FLastLongCountermeasure : Double;
    FLastLatCountermeasure : Double;
    FIsContCountermeasure : Boolean;
    FCountermeasureIndex : Integer;
    FCountermeasureSpacing : Double;
    FCountermeasureQty : Integer;

    FLastLongSonobuoy : Double;
    FLastLatSonobuoy : Double;
    FIsContSonobuoy : Boolean;
    FSonobuoyIndex : Integer;
    FSonobuoyMode : Byte;
    FSonobuoyDepth : Double;
    FSonobuoySpacing : Double;
    FSonobuoyQty : Integer;

    FLastLongMine : Double;
    FLastLatMine : Double;
    FIsContMine : Boolean;
    FMineIndex : Integer;
    FMineDepth : Double;
    FMineSpacing : Double;
    FMineQty : Integer;

    FTerminationHeading : Double;
    FOldRange : Double;
    FOnNextWaypointChangeTo3D: TOnNextWaypointChangeTo3D;
    FCheck, FHasBeenSend : Boolean;
    FVisibleCircleWP: Boolean;
    FRangeList : TStringList;
    FColourWaypoint : Integer;
    FTFont : TFont;

    {$IFDEF SERVER}
    procedure CheckWaypointEvent(index : integer);
    {$ENDIF}

    procedure ClearWaypoint;
    procedure FTimerOnTime(Sender : TObject);
    procedure LauncMissile(Id : Integer);

    function GetEvents(index : Integer): Tlist;
    function GetBehaviour(index: Integer): TObject;
    function GetCount: Integer;

    procedure SetTermination(const Value: TWaypointTermination);
    procedure SetOwner(const Value: TSimObject);
    procedure SetOnPointReached(const Value: TOnWaypointReached);

    //---- tdk dipanggil ------//
    {function First    : TObject;
    function Last     : TObject;
    function Next     : TObject;
    function Previous : TObject;}
    //---- tdk dipanggil ------//

    procedure SetEnabled(const Value: boolean);
    function getNextWaypoint: TScripted_Behav_Definition;
    procedure CopyList(const Source, Destination: TList);
    procedure SetNextNodeID(const Value: Integer);

    procedure SetVisibleCircleWP(const Value: Boolean);  public
    //nando
    FonLaunchMissile  : TOnWaypoint_LaunchMissile;
    FOnLaunchTorpedo  : TOnWaypoint_LaunchTorpedo;
    FOnLaunchBomb     : TOnWayPoint_LaunchBomb;
    FOnLaunchGun      : TOnWayPoint_LaunchGun;
    FonRadarEvent     : TOnWaypoint_OnRadar;
    FonSonarEvent     : TOnWaypoint_OnSonar;
    FonIffEvent       : TOnWaypoint_OnIFF;
    FonDeployContinousEvent : TOnWaypoint_DeployContinousEvent;
    FonDeploySonobuoy : TOnWaypoint_DeploySonobuoy;
    FonDeployMine     : TOnWaypoint_DeployMine;
    FonCMEvent        : TOnWaypoint_OnCountermeasure;
    FonDatalinkEvent  : TOnWaypoint_OnDatalink;
    FonWaypointEnd    : TOnWaypointEnd;
    FonWaypointDestinationChange  : TOnWaypointDestinantion_Change;
    FonWaypointRemoveOwner        :  TOnWaypointRemoveOwner;
    NetBehav         : TScripted_Behav_Definition;
    VehiclePlatform  : TT3UnitContainer;
    FOnWaypointChange: TOnWaypointChange;

    constructor Create;
    destructor Destroy;override;

    function EventExistForObject(indexbehav : integer; valObject : TObject; var varObject : TObject) : boolean;overload;
    function EventExistForObject(indexbehav : integer; valType : TWaypointEventType; var varObject : TObject) : boolean;overload;
    function GetSnapshotData(index : Integer) : _SS_TWaypoint;

    procedure Add(behav : TScripted_Behav_Definition; event : TWaypointEventClass);
    procedure Delete(behav : TScripted_Behav_Definition);overload;
    procedure Delete(index : integer);overload;
    procedure Clear;
    procedure ConvertCoord(cvt: TCoordConverter);
    procedure Draw(aCnv : TCanvas);
    procedure RestartWaypoint;
    procedure Apply;

    //nando
    procedure CheckWaypointReach(const aDeltaMs: double);
    procedure SetStartWaypoint;
    procedure SetHeadingWaypoint;
    procedure RestartWaypointWithCurrentPosition;
    property ShipOwn : TT3PlatformInstance read FShipOwn write FShipOwn;
    procedure EnableSensorEvent(index, id, State, device : integer);
    procedure EnableWeaponEvent(index, id, targetIndex: integer; track : Boolean; weapontype : byte;
                  weaponIndex : integer;aSalvo : integer = 0);

    //choco - waypoint =================== BEGIN ===================
    function GetAvailableWaypointID: Integer;

    //----- Event -----
    procedure DoContinousEvent;

    procedure SensorStateChange(aIndex, aList_Index, aDeviceType,
              aState : Integer);

    procedure SonobuoyChange(aIndex, aList_Index, aSonobuoyIndex,
              aDeviceID: Integer);
    procedure SonobuoyModeChange(aIndex, aList_Index, aSonobuoyIndex,
              aSonobuoyMode : Integer);
    procedure SonobuoyDepthChange(aIndex, aList_Index, aSonobuoyIndex : Integer;
              aSonobuoyDepth : Double);
    procedure SonobuoySpacingChange(aIndex, aList_Index,
              aSonobuoyIndex : Integer; aSonobuoySpacing : Double);
    procedure SonobuoyQuantityChange(aIndex, aList_Index,
              aSonobuoyIndex, aSonobuoyQty : Integer);
    procedure SonobuoyContinueStateChange(aIndex, aList_Index,
              aSonobuoyIndex : Integer; aSonobuoyContinueState : Boolean);

    procedure WeaponChange(aIndex, aList_Index, aWeaponIndex,
              aWeaponID: Integer);
    procedure WeaponSalvoChange(aIndex, aList_Index, aWeaponIndex,
              aSalvo: Integer);
    procedure WeaponTargetChange(aIndex, aList_Index, aWeaponIndex,
              aTarget: Integer);

    procedure MineChange(aIndex, aList_Index, aMineIndex, aWeaponID : Integer);
    procedure MineDepthChange(aIndex, aList_Index, aMineIndex : Integer;
              aMineDepth : Double);
    procedure MineSpacingChange(aIndex, aList_Index,
              aMineIndex : Integer; aMineSpacing : Double);
    procedure MineQuantityChange(aIndex, aList_Index,
              aMineIndex, aMineQty : Integer);
    procedure MineContinueStateChange(aIndex, aList_Index,
              aMineIndex : Integer; aMineContinueState : Boolean);

    procedure CountermeasureStateChange(aIndex, aList_Index, aState : Integer);

    procedure DatalinkStateChange(aIndex, aList_Index, aDeviceType,
              aState : Integer);

    procedure ContinousEventChange(aObjIndex: Integer; aObjType, aObjMode: Byte;
              aObjDepth, aObjSpacing: Double; aObjQty : Integer;
              aDeployUntilNextWaypoint: Boolean);

    procedure TerminationAction;
    //----- Event -----
    //choco - waypoint ==================== END ====================

    property StartWaypointX : Double read FstartWaypointX write FstartWaypointX;
    property StartWaypointY : Double read FstartWaypointY write FstartWaypointY;

    property Events[index : integer] : TList read GetEvents;
    property Behaviour[index : integer] : TObject read GetBehaviour;
    property Count : integer read GetCount;
    property Termination : TWaypointTermination read FTermination write SetTermination;
    property Owner : TSimObject read FOwner write SetOwner;
    property OnPointReached : TOnWaypointReached read FOnPointReached write SetOnPointReached;
    property OnNextWaypointChangeTo3D : TOnNextWaypointChangeTo3D
      read FOnNextWaypointChangeTo3D write FOnNextWaypointChangeTo3D;

    property Enabled : boolean read FEnabled write SetEnabled;
    property NextWaypoint : TScripted_Behav_Definition read getNextWaypoint;

    //Nando
    property RunWaypoint : Boolean read FRunWaypoint write FRunWaypoint;
    property NextNodeID : Integer read FNextNodeID write SetNextNodeID;

    property IsChange : Boolean read FIsChange write FIsChange;
    property IsOwnerHooked : Boolean read FIsOwnerHooked write FIsOwnerHooked;
    property IsOpenGuidanceTab : Boolean read FIsOpenGuidanceTab write FIsOpenGuidanceTab;
    property TerminationHeading : Double read FTerminationHeading write FTerminationHeading;
    property OldRange : Double read FOldRange write FOldRange;
    property VisibleCircleWP : Boolean  read FVisibleCircleWP write SetVisibleCircleWP;
    property RangeList : TStringList read FRangeList write FRangeList;
  end;

implementation

uses uLibSettingTTT, {uDBAsset_radar, uDBAsset_Sonar, uDBAsset_Sensor,}
  uBaseCoordSystem, SysUtils, {uDBAsset_Weapon,}
  uT3Missile, uT3Vehicle, uT3Radar, uT3Sonar,
  uT3OtherSensor, uT3Weapon, uT3Torpedo, uT3Gun, uT3Bomb, uT3Sonobuoy,
  DateUtils, Math;

{ TWaypoint }

var
  rMis: TRecCmd_LaunchMissile;


function MillisecToDateTime(const msAll): TDateTime;
var
  //dt: TDateTime;
  ms, s, n, h: word;
  ns, detik: Cardinal;
begin
  //VirtualTick in millisecond;
  ms := 0; //sementara
  detik := ms div 1000;
  ms    := ms mod 1000;
  s     := detik mod 60;
  ns    := detik div 60;
  n     := ns mod 60;
  ns    := ns div 60;
  h     := ns mod 24;

  result := EncodeTime(h, n, s, ms);
end;

function StringListSortComparefn(List: TStringList; Index1, Index2: Integer): Integer;
var
 i1, i2 : Integer;
begin
 i1 := StrToIntDef(List.Names[Index1], 0);
 i2 := StrToIntDef(List.Names[Index2], 0);
 Result := i1 - i2
end;

procedure TWaypoint.Add(behav: TScripted_Behav_Definition; event: TWaypointEventClass);
var
  rec : ^TRecWaypoint;
  isNew : Boolean;
  i : Integer;
  List : TList;
  FRangeWaypoint : TRangeVisual;
  Range : Double;
begin
  isNew := True;
  List := FWPList;

  for i := 0 to List.Count - 1 do
  begin
    rec := List.Items[i];
    if TScripted_Behav_Definition(rec^.Behav).FData.Scripted_Event_Index =
       behav.FData.Scripted_Event_Index then
    begin
      if Assigned(event) then
        rec^.Events.Add(event);

      isNew := False;
    end;
  end;

  if isNew then
  begin
    New(rec);
    rec^.Events := TList.Create;
    rec^.Behav  := behav;
    rec^.Name   := 'WP - ' + IntToStr(behav.FData.Scripted_Event_Index);

    if Assigned(event) then
      rec^.Events.Add(event);

    FWPList.Add(rec);

    Range := CalcRange(Owner.PosX, Owner.PosY , behav.FData.Waypoint_Longitude, behav.FData.Waypoint_Latitude);
    FRangeList.AddObject(FloatToStr(Range), behav);
    FRangeList.CustomSort(StringListSortComparefn);

    FRangeWaypoint := TRangeVisual.Create;
    FRangeWaypoint.Visible := FVisibleCircleWP;

    FRangeWaypoint.Range := 0.2;
    if TT3Vehicle(FOwner).UnitMotion.FData.Standard_Turn_Rate > 0.00001 then
      FRangeWaypoint.Range := Abs(behav.FData.Speed) / (TT3Vehicle(FOwner).UnitMotion.FData.Standard_Turn_Rate * 60);

    FRangeWaypoint.mX := behav.FData.Waypoint_Longitude;
    FRangeWaypoint.mY := behav.FData.Waypoint_Latitude;
    FWPRangeList.Add(FRangeWaypoint);
  end;
end;

procedure TWaypoint.Apply;
var
  tmp : ^TRecWaypoint;
  dx, dy, bearing, Range, radius : Double;
  RangeVisual : TRangeVisual;
  i : Integer;
begin
  if FWPList.Count > 0 then
  begin
    tmp := FWPList.Items[FNextNodeID];

    FOffsetX := FOwner.getPositionX - TScripted_Behav_Definition(tmp^.Behav).FData.Waypoint_Latitude;
    FOffsetY := FOwner.getPositionY - TScripted_Behav_Definition(tmp^.Behav).FData.Waypoint_Longitude;

    //3D
    dx := TScripted_Behav_Definition(tmp^.Behav).FData.Waypoint_Longitude;
    dy := TScripted_Behav_Definition(tmp^.Behav).FData.Waypoint_Latitude;
    bearing := CalcBearing(FOwner.getPositionX, FOwner.getPositionY, dx, dy);
    Range := CalcRange(FOwner.getPositionX, FOwner.getPositionY, dx, dy);

    FPNextWaypoint := FWPList.Items[FNextNodeID];

    if (E_WaypointStartTimeMode(TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.StartMode) = wstmStartAt) then
    begin

      radius := TScripted_Behav_Definition(tmp^.Behav).FData.Speed / (TT3Vehicle(FOwner).UnitMotion.FData.Standard_Turn_Rate * 60);

      if (Range < Abs(radius)) then
      begin
        if (TT3Vehicle(FOwner).GameTime < TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.StartAt) then
        begin
          TT3Vehicle(FOwner).Speed := 0;
          TT3Vehicle(FOwner).OrderedSpeed := 0;

            FCheck := True;
            FHasBeenSend := False;
        end
        else
        begin
          if Assigned(FOnPointReached) then
          begin
            FOnPointReached(FPNextWaypoint^.Behav, FPNextWaypoint^.Events);
          end;

          FCheck := False;
          FHasBeenSend := False;
        end;
      end
      else
      begin
        if Assigned(FOnPointReached) then
        begin
          FOnPointReached(FPNextWaypoint^.Behav, FPNextWaypoint^.Events);
        end;
      end;
    end
    else
    begin
      if Assigned(FOnPointReached) then
        FOnPointReached(FPNextWaypoint^.Behav, FPNextWaypoint^.Events);
    end;

    if TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Speed < 0 then
      bearing := ValidateDegree(bearing + 180);

    TT3Vehicle(FOwner).OrderedHeading := bearing;

    if Assigned(FOnNextWaypointChangeTo3D) then
      FOnNextWaypointChangeTo3D(FNextNodeID, TT3Vehicle(FOwner).InstanceIndex,
        TScripted_Behav_Definition(tmp^.Behav).FData.Speed,
        bearing, TT3Vehicle(Owner).Altitude, TScripted_Behav_Definition(tmp^.Behav).FData.Waypoint_Latitude,
        TScripted_Behav_Definition(tmp^.Behav).FData.Waypoint_Longitude);

    for i := 0 to FWPList.Count - 1 do
    begin
      tmp := FWPList.Items[i];
      RangeVisual := FWPRangeList.Items[i];

      RangeVisual.Range := 0.2;
      if Abs(TT3Vehicle(FOwner).Mover.TurnRate) > 0.00001 then
        RangeVisual.Range := TScripted_Behav_Definition(tmp^.Behav).FData.Speed / (TT3Vehicle(FOwner).UnitMotion.FData.Standard_Turn_Rate * 60);
    end;
  end;

  SetStartWaypoint;
  //setHeadingWaypoint;
end;

procedure TWaypoint.CheckWaypointReach(const aDeltaMs: double);
var
  {$IFDEF SERVER}
  i : integer;
  {$ENDIF}
  dx, dy : double;
  range, bearing, radius : Double;
  behav : TScripted_Behav_Definition;
begin
  if Assigned(FOwner) then
  begin
    if Assigned(FPNextWaypoint) then
    begin
      behav := TScripted_Behav_Definition(FPNextWaypoint^.Behav);
      dx := behav.FData.Waypoint_Longitude;
      dy := behav.FData.Waypoint_Latitude;

      range := CalcRange(FOwner.getPositionX,FOwner.getPositionY, dx,dy);
      bearing := CalcBearing(FOwner.getPositionX,FOwner.getPositionY, dx,dy);

      radius := 0.2;
      if (Abs(TT3Vehicle(FOwner).Mover.TurnRate) > 0.00001) then
        radius := Abs(TT3Vehicle(FOwner).Speed) / (Abs(TT3Vehicle(FOwner).Mover.TurnRate) * 60);

//      if (E_WaypointStartTimeMode(behav.FData.StartMode) = wstmStartAt) then
//        FCheck := True
//      else
//        FCheck := False;

      if (range <= radius) or FCheck then
      begin
        FOldRange := 9999999999;

        FIsContCountermeasure := False;
        FIsContSonobuoy := False;
        FIsContMine := False;

        if (E_WaypointStartTimeMode(behav.FData.StartMode) = wstmStartAt) then
        begin
          if (TT3Vehicle(FOwner).GameTime > behav.FData.StartAt) then
          begin
            //check event
            {$IFDEF SERVER}
            i := FWPList.IndexOf(FPNextWaypoint);
            CheckWaypointEvent(i);
            {$ENDIF}

            if FNextNodeID = FWPList.Count - 1 then
            begin
              TerminationAction;
              FNextNodeID := 0;
            end
            else
            begin
              Inc(FNextNodeID);
              FPNextWaypoint := FWPList.Items[FNextNodeID];

              if Assigned(FOnPointReached) then
                FOnPointReached(FPNextWaypoint^.Behav, FPNextWaypoint^.Events);

              dx := TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Waypoint_Longitude;
              dy := TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Waypoint_Latitude;
              bearing := CalcBearing(FOwner.getPositionX,FOwner.getPositionY, dx,dy);

              if TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Speed < 0 then
                bearing := ValidateDegree(bearing + 180);

              TT3Vehicle(FOwner).OrderedHeading := bearing;

              if Assigned(FOnNextWaypointChangeTo3D) then
                FOnNextWaypointChangeTo3D(FNextNodeID, TT3Vehicle(FOwner).InstanceIndex,
                  NextWaypoint.FData.Speed, bearing, TT3Vehicle(Owner).Altitude, TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Waypoint_Longitude,
                  TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Waypoint_Latitude);
            end;

            FCheck := False;
            FHasBeenSend := False;

            Exit;
          end
          else if not FHasBeenSend then
          begin
            TT3Vehicle(FOwner).Speed := 0;
            TT3Vehicle(FOwner).OrderedSpeed := 0;

            if Assigned(FOnNextWaypointChangeTo3D) then
              FOnNextWaypointChangeTo3D(FNextNodeID, TT3Vehicle(FOwner).InstanceIndex, 0,
                TT3Vehicle(FOwner).Heading, TT3Vehicle(Owner).Altitude, TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Waypoint_Longitude,
                TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Waypoint_Latitude);

            FCheck := True;
            FHasBeenSend := True;
          end;
        end
        else
        begin
          FCheck := False;
          FHasBeenSend := False;

          //check event
          {$IFDEF SERVER}
          i := FWPList.IndexOf(FPNextWaypoint);
          CheckWaypointEvent(i);
          {$ENDIF}

          if FNextNodeID = FWPList.Count - 1 then
          begin
            TerminationAction;
            FNextNodeID := 0;
          end
          else
          begin
            Inc(FNextNodeID);
            FPNextWaypoint := FWPList.Items[FNextNodeID];

            if Assigned(FOnPointReached) then
              FOnPointReached(FPNextWaypoint^.Behav, FPNextWaypoint^.Events);

            dx := TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Waypoint_Longitude;
            dy := TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Waypoint_Latitude;
            bearing := CalcBearing(FOwner.getPositionX,FOwner.getPositionY, dx,dy);

            if TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Speed < 0 then
              bearing := ValidateDegree(bearing + 180);

            TT3Vehicle(FOwner).OrderedHeading := bearing;

            if Assigned(FOnNextWaypointChangeTo3D) then
              FOnNextWaypointChangeTo3D(FNextNodeID, TT3Vehicle(FOwner).InstanceIndex,
                NextWaypoint.FData.Speed, bearing, TT3Vehicle(Owner).Altitude, TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Waypoint_Longitude,
                TScripted_Behav_Definition(FPNextWaypoint^.Behav).FData.Waypoint_Latitude);
          end;
        end;
      end;
    end;
  end;
end;

procedure TWaypoint.Clear;
var
  rec : ^TRecWaypoint;
  i : integer;
  List : TList;
  obj : TRangeVisual;

begin
  //list := FWPList.LockList;
  List := FWPList;
  for i := 0 to List.Count - 1 do
  begin
    rec := List.Items[i];
    rec^.Behav.Free;
    rec^.Events.Clear;
    Dispose(rec);
  end;
  List.Clear;

  for i := FWPRangeList.Count - 1 downto 0 do
  begin
    obj := FWPRangeList.Items[i];
    obj.Visible := False;
    obj.Free;
    FWPRangeList.Delete(i);
  end;
  FWPRangeList.Clear;

  FPNextWaypoint := nil;
  ClearWaypoint;
  //FWPList.UnlockList;
end;

procedure TWaypoint.ClearWaypoint;
begin
  FRunWaypoint := False;
end;

procedure TWaypoint.EnableSensorEvent(index, id, State, device: integer);
var
  rec : ^TRecWaypoint;
  List , TempList : TList;

  EventList : TWaypointEventClass;
begin
  //check event Radar, sonar, Weapon
  List := FWPList;
  rec := List.Items[index];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[id]);
  EventList.FEnable := (State <> 2);

  case Device of
    1 : begin
          //Radar
          TScripted_Radar_Event(EventList.FData).FData.Radar_Control := State;
        end;
    2 : begin
          //Sensor
          TScripted_Sonar_Event(EventList.FData).FData.Sonar_Control := State;
        end;
    3 : begin
          //IFF Transponder
          TScripted_IFF_Event(EventList.FData).FData.IFF_Transponder_Control := State;
        end;
    4 : begin
          //IFF Interogator
          TScripted_IFF_Event(EventList.FData).FData.IFF_Interrogator_Control := State;
        end;
  end;
end;

procedure TWaypoint.EnableWeaponEvent(index, id, targetIndex: integer; track: Boolean;
              weapontype : byte;weaponIndex : integer;aSalvo : integer = 0);
var
  rec : ^TRecWaypoint;
  List , TempList : TList;
  i : integer;
  EventList : TWaypointEventClass;
begin
  EventList := nil;
  List := FWPList;
  rec := List.Items[index];
  TempList := Rec^.Events;

  for i := 0 to TempList.Count - 1 do
  begin
    EventList := TWaypointEventClass(TempList[i]);
    if EventList.FType = TWaypointEventType(id) then
      Break;
  end;

  if Assigned(EventList) then
  begin
    EventList.FObjectInstanceIndex := weaponIndex;

    if track then
    begin
      TScripted_Weapon_Event(EventList.FData).FData.Target_Index := targetIndex;
    end
    else
    begin
      if aSalvo > 0 then
        TScripted_Weapon_Event(EventList.FData).FData.Salvo_Size := aSalvo
      else
        TScripted_Weapon_Event(EventList.FData).FData.Weapon_Type := weapontype;
    end;
  end;
end;

{$IFDEF SERVER}
procedure TWaypoint.CheckWaypointEvent(index : integer);
var
  rec : ^TRecWaypoint;
  List , TempList : TList;
  EventList : TWaypointEventClass;
  j : Integer;
  weapon : TObject;
  ShipIndex : Integer;
//  target : TT3PlatformInstance;
//  IsQuantityAvailable, IsInRange, IsBlindzone : Boolean;
begin
  //check event Radar, sonar, IFF
  List := FWPList;
  rec := List.Items[index];
  TempList := Rec^.Events;

  IDArray := 0;
  IDLaunchMismile := 0;
  ShipIndex := TT3PlatformInstance(FOwner).InstanceIndex;

  for j := 0 to TempList.Count - 1 do
  begin
    EventList := TWaypointEventClass(TempList[j]);

    //------------Radar
    if (EventList.FType = wetRadar) and (EventList.FEnable = True) then
    begin
      if Assigned(FonRadarEvent) then
      begin
        FonRadarEvent(ShipIndex, EventList.FObjectInstanceIndex,
            TScripted_Radar_Event(EventList.FData).FData.Radar_Control);
      end;
    end
    else
    //------------Sonar
    if (EventList.FType = wetSonar) and (EventList.FEnable = True) then
    begin
      if Assigned(FonSonarEvent) then
      begin
        FonSonarEvent(ShipIndex, EventList.FObjectInstanceIndex,
            TScripted_Sonar_Event(EventList.FData).FData.Sonar_Control);
      end
    end
    else
    //---------IFFTransponder
    if (EventList.FType = wetIFFTransponder) and (EventList.FEnable = True) then
    begin
      if Assigned(FonIffEvent) then
      begin
        FonIffEvent(ShipIndex, EventList.FObjectInstanceIndex, 1,
            TScripted_IFF_Event(EventList.FData).FData.IFF_Transponder_Control);
      end
    end
    else
    //---------IFFInterogrator
    if (EventList.FType = wetIFFInterogator) and (EventList.FEnable = true) then
    begin
      if Assigned(FonIffEvent) then
      begin
        FonIffEvent(ShipIndex, EventList.FObjectInstanceIndex, 2,
            TScripted_IFF_Event(EventList.FData).FData.IFF_Interrogator_Control);
      end
    end
    else
    //Sonobuoy
    if (EventList.FType = wetSonobuoy) and (EventList.FEnable = true) then
    begin
      if EventList.FObjectInstanceIndex <> 0 then
      begin
        with TScripted_Sonobuoy_Event(EventList.FData).FData do
        begin
          if DeploySonoUntilNextWp then
          begin
            if Assigned(FonDeployContinousEvent) then
              FonDeployContinousEvent(ShipIndex, EventList.FObjectInstanceIndex,
                Byte(EventList.FType), SonobuoyMode, SonobuoyDepth,
                SonobuoySpacing, SonobuoyQuantity, DeploySonoUntilNextWp);
          end
          else
          begin
            if Assigned(FonDeploySonobuoy) then
              FonDeploySonobuoy(ShipIndex, EventList.FObjectInstanceIndex,
                SonobuoyMode, SonobuoyDepth);
          end;
        end;
      end;
    end
    else
    //-- weapon
    if ((EventList.FType = wetWeapon1) or (EventList.FType = wetWeapon2)
        or (EventList.FType = wetWeapon3) or (EventList.FType = wetWeapon4)
        or (EventList.FType = wetWeapon5)) and (EventList.FEnable = true) then
    begin
      if EventList.FObjectInstanceIndex <> 0 then
      begin
        with TT3Vehicle(FOwner) do
        begin
          weapon := getWeapon(EventList.FObjectInstanceIndex);

          if weapon is TT3MissilesOnVehicle then
          begin
            if not (TT3MissilesOnVehicle(weapon).Quantity > 0) then
              Exit;

            if Assigned(FonLaunchMissile) then
              FonLaunchMissile(InstanceIndex, EventList.FObjectInstanceIndex,
                TScripted_Weapon_Event(EventList.FData).FData.Target_Index,
                TScripted_Weapon_Event(EventList.FData).FData.Salvo_Size);
          end
          else
          if weapon is TT3TorpedoesOnVehicle then
          begin
            if not (TT3TorpedoesOnVehicle(weapon).Quantity > 0) then
              Exit;

            if Assigned(FOnLaunchTorpedo) then
              FOnLaunchTorpedo(InstanceIndex, EventList.FObjectInstanceIndex,
                TScripted_Weapon_Event(EventList.FData).FData.Target_Index,
                TScripted_Weapon_Event(EventList.FData).FData.Salvo_Size);
          end
          else if weapon is TT3BombONVehicle then
          begin
            if not (TT3BombONVehicle(weapon).Quantity > 0) then
              Exit;

            if Assigned(FOnLaunchBomb) then
              FOnLaunchBomb(InstanceIndex, EventList.FObjectInstanceIndex,
                TScripted_Weapon_Event(EventList.FData).FData.Target_Index,
                TScripted_Weapon_Event(EventList.FData).FData.Salvo_Size);
          end
          else if weapon is TT3GunONVehicle then
          begin
            if not (TT3GunONVehicle(weapon).Quantity > 0) then
              Exit;

            if Assigned(FOnLaunchGun) then
              FOnLaunchGun(InstanceIndex, EventList.FObjectInstanceIndex,
                TScripted_Weapon_Event(EventList.FData).FData.Target_Index,
                TScripted_Weapon_Event(EventList.FData).FData.Salvo_Size);
          end;
        end;
      end;
    end
    else
    //Mine
    if (EventList.FType = wetMine) and (EventList.FEnable = true) then
    begin
      if EventList.FObjectInstanceIndex <> 0 then
      begin
        with TScripted_Mine_Event(EventList.FData).FData do
        begin
          if DeployMineUntilNextWp then
          begin
            if Assigned(FonDeployContinousEvent) then
              FonDeployContinousEvent(ShipIndex, EventList.FObjectInstanceIndex,
                Byte(EventList.FType), 0, MineDepth, MineSpacing, MineQuantity,
                DeployMineUntilNextWp);
          end
          else
          begin
            if Assigned(FonDeployMine) then
              FonDeployMine(ShipIndex, EventList.FObjectInstanceIndex, MineDepth);
          end;
        end;
      end;
    end
    else
    //Countermeasure
    if (EventList.FType = wetCounterMeasure) and (EventList.FEnable = True) then
    begin
      if Assigned(FonCMEvent) then
      begin
        FonCMEvent(ShipIndex, EventList.FObjectInstanceIndex,
            TScripted_Chaff_Event(EventList.FData).FData.Countermeasure_Control);
      end;
    end
    else
    //Datalink HF
    if (EventList.FType = wetComHF) and (FEnabled = True) then
    begin
      if Assigned(FonDatalinkEvent) then
        FonDatalinkEvent(ShipIndex, EventList.FObjectInstanceIndex, 1,
          TScripted_Datalink_Event(EventList.FData).FData.Datalink_Control);
    end
    else
    //Datalink UHF/VHF
    if (EventList.FType = wetComUHF) and (FEnabled = True) then
    begin
      if Assigned(FonDatalinkEvent) then
        FonDatalinkEvent(ShipIndex, EventList.FObjectInstanceIndex, 2,
          TScripted_Datalink_Event(EventList.FData).FData.Datalink_Control);
    end;
  end;
end;
{$ENDIF}

procedure TWaypoint.LauncMissile(Id: integer);
begin
  if Id < IDArray then
  begin
    FIdTimer := 0;
    FTimer.Enabled := True;
  end;
end;

procedure TWaypoint.MineChange(aIndex, aList_Index, aMineIndex, aWeaponID : Integer);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);
  EventList.FEnable := (aMineIndex <> 0);

  TScripted_Mine_Event(EventList.FData).FData.MineType := aMineIndex;
  EventList.FObjectInstanceIndex := aWeaponID;
end;

procedure TWaypoint.MineContinueStateChange(aIndex, aList_Index,
  aMineIndex: Integer; aMineContinueState: Boolean);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);

  TScripted_Mine_Event(EventList.FData).FData.DeployMineUntilNextWp := aMineContinueState;
end;

procedure TWaypoint.MineDepthChange(aIndex, aList_Index, aMineIndex: Integer;
  aMineDepth: Double);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);

  TScripted_Mine_Event(EventList.FData).FData.MineDepth := aMineDepth;
end;

procedure TWaypoint.MineQuantityChange(aIndex, aList_Index, aMineIndex,
  aMineQty: Integer);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);

  TScripted_Mine_Event(EventList.FData).FData.MineQuantity := aMineQty;
end;

procedure TWaypoint.MineSpacingChange(aIndex, aList_Index, aMineIndex: Integer;
  aMineSpacing: Double);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);

  TScripted_Mine_Event(EventList.FData).FData.MineSpacing := aMineSpacing;
end;

procedure TWaypoint.FTimerOnTime(Sender: TObject);
begin
  FIdTimer := FIdTimer + integer(FTimer.Interval);

  //Timer On For 5 Second
  if FIdTimer = 5000 then
  begin
    rMis.ParentPlatformID := ArrayMisLauch[IDLaunchMismile].ParentPlatformID;
    rMis.TargetPlatformID := ArrayMisLauch[IDLaunchMismile].TargetPlatformID;
    rMis.MissileID        := ArrayMisLauch[IDLaunchMismile].MissileID;

    //send Misil after 5 detik
    if MisilleRemain > 0 then
    begin
      //simMgrClient.netSend_CmdLaunch_Missile(rMis);}
      if Assigned(FonLaunchMissile) then
      begin
        FonLaunchMissile(rMis.ParentPlatformID, rMis.MissileID, rMis.TargetPlatformID, 2);
      end;
    end;

    FTimer.Enabled := False;

    IDLaunchMismile := IDLaunchMismile + 1;
    LauncMissile(IDLaunchMismile);
  end;
end;

procedure TWaypoint.ContinousEventChange(aObjIndex: Integer; aObjType,
  aObjMode: Byte; aObjDepth, aObjSpacing: Double; aObjQty: Integer;
  aDeployUntilNextWaypoint: Boolean);
begin
  case TWaypointEventType(aObjType) of
    wetSonobuoy :
    begin
      FLastLongSonobuoy := TT3Vehicle(Owner).PosX;
      FLastLatSonobuoy := TT3Vehicle(Owner).PosY;
      FSonobuoyIndex := aObjIndex;
      FSonobuoyMode := aObjMode;
      FSonobuoyDepth := aObjDepth;
      FSonobuoySpacing := aObjSpacing;
      FSonobuoyQty := aObjQty;
      FIsContSonobuoy := aDeployUntilNextWaypoint;
    end;
    wetMine :
    begin
      FLastLongMine := TT3Vehicle(Owner).PosX;
      FLastLatMine := TT3Vehicle(Owner).PosY;
      FMineIndex := aObjIndex;
      FMineDepth := aObjDepth;
      FMineSpacing := aObjSpacing;
      FMineQty := aObjQty;
      FIsContMine := aDeployUntilNextWaypoint;
    end;
    wetCounterMeasure :
    begin
      FLastLongCountermeasure := TT3Vehicle(Owner).PosX;
      FLastLatCountermeasure := TT3Vehicle(Owner).PosY;
      FCountermeasureIndex := aObjIndex;
      FCountermeasureSpacing := aObjSpacing;
      FCountermeasureQty := aObjQty;
      FIsContCountermeasure := aDeployUntilNextWaypoint;
    end;
  end;
end;

procedure TWaypoint.ConvertCoord(cvt: TCoordConverter);
var
  i : Integer;
  dx, dy : Double;
  rec : ^TRecWaypoint;
  RangeVisual : TRangeVisual;
begin
  cvt.ConvertToScreen(Owner.PosX,Owner.PosY,FOwnerPositionX,FOwnerPositionY);

  SetLength(FPixelTrails, FWPList.Count);
  for i := 0 to FWPList.Count - 1 do
  begin
    rec := FWPList.Items[i];
    dx := TScripted_Behav_Definition(rec^.Behav).FData.Waypoint_Longitude;
    dy := TScripted_Behav_Definition(rec^.Behav).FData.Waypoint_Latitude;
    cvt.ConvertToScreen(dx, dy, FPixelTrails[i].X, FPixelTrails[i].Y);

    RangeVisual := FWPRangeList.Items[i];

   // RangeVisual.Range := 0.2;
    if Abs(TT3Vehicle(FOwner).Mover.TurnRate) > 0.00001 then
      RangeVisual.Range := Abs(TScripted_Behav_Definition(rec^.Behav).FData.Speed) / (Abs(TT3Vehicle(FOwner).Mover.TurnRate) * 60);

    RangeVisual.mX := dx;
    RangeVisual.mY := dy;
    RangeVisual.ConvertCoord(cvt);
  end;

//  for i:= 0 to FWPRangeList.Count - 1 do
//  begin

//    RangeVisual.mX := behav.FData.Waypoint_Longitude;
//    RangeVisual.mY := behav.FData.Waypoint_Latitude;
//  end;
end;

procedure TWaypoint.CopyList(const Source, Destination: TList);
var
  i : Integer;
begin
  Destination.Clear;

  for i := 0 to Source.Count - 1 do
    Destination.Add(Source.Items[i]);

  Source.Clear;
end;

procedure TWaypoint.CountermeasureStateChange(aIndex, aList_Index,
  aState: Integer);
var
  rec : ^TRecWaypoint;
  List , TempList : TList;

  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);
  EventList.FEnable := (aState <> 2);

  TScripted_Chaff_Event(EventList.FData).FData.Countermeasure_Control := aState;
end;

constructor TWaypoint.Create;
begin
  //FWPList := TThreadList.Create;
  FWPList := TList.Create;
  FWPRangeList := TList.Create;
  FWPListCache := TList.Create;
  FTermination := wtLH;
  FIndexPoint  := -1;
  FPNextWaypoint  := nil;
  FEnabled := False;
  FIsChange := False;

  //nando
  FRunWaypoint := False;
  FTimer := TTimer.Create(nil);
  FTimer.Enabled := False;
  FTimer.Interval := 1000;
  FTimer.OnTimer := FTimerOnTime;
  FIdTimer := 0;
  FNextNodeID := 0;

  FisRemoveOwner := false;

  FIsContCountermeasure := False;
  FIsContSonobuoy := False;
  FIsContMine := False;

  //choco - For Drawing Purpose
  FIsOwnerHooked := False;
  FIsOpenGuidanceTab := False;
  FHasBeenSend := False;

  FRangeList := TStringList.Create;
  FRangeList.CustomSort(StringListSortComparefn);
  FRangeList.Sorted := True;
  FColourWaypoint := RGB(RandomRange(0, 255), RandomRange(10, 255), RandomRange(20, 255));
  FTFont := TFont.Create;
end;

procedure TWaypoint.DatalinkStateChange(aIndex, aList_Index, aDeviceType,
  aState: Integer);
var
  rec : ^TRecWaypoint;
  List, TempList : TList;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);
  EventList.FEnable := (aState <> 2);

  TScripted_Datalink_Event(EventList.FData).FData.Datalink_Control := aState;
end;

procedure TWaypoint.Delete(index: integer);
var rec : ^TRecWaypoint;
  list : TList;
  RangeVisual : TRangeVisual;
begin
  //list := FWPList.LockList;
  list := FWPList;
  if (index < 0) and (index >= List.Count) then exit;

  rec := List.Items[index];
  rec^.Behav.Free;
  rec^.Events.Clear;
  rec^.Events.Free;
  Dispose(rec);

  list.Delete(index);

  RangeVisual := FWPRangeList.Items[index];
  RangeVisual.Free;
  FWPRangeList.Delete(index);
  //FWPList.UnlockList;
end;

destructor TWaypoint.Destroy;
var
  obj : TObject;
  i : Integer;
begin

  inherited;
  FTFont.Free;

  FRangeList.Free;

  if FWPList.Count > 0 then
  begin
    for i := FWPList.Count -1 downto 0 do
    begin
      obj := FWPList.Items[i];
      obj.Free;
      FWPList.Delete(i);
    end;
  end;

  FWPList.Clear;
  FWPList.Free;

  if FWPRangeList.Count > 0 then
  begin
    for i := FWPRangeList.Count -1 downto 0 do
    begin
      obj := FWPRangeList.Items[i];
      obj.Free;
      FWPRangeList.Delete(i);
    end;
  end;

  FWPRangeList.Clear;
  FWPRangeList.Free;
end;

procedure TWaypoint.DoContinousEvent;
{$IFDEF SERVER}
var
  range : Double;
{$ENDIF}
begin
  if not (FIsContCountermeasure or FIsContSonobuoy or FIsContMine) then
    Exit;

  if FIsContCountermeasure then
  begin
    if Assigned(TT3Vehicle(Owner).OnLogEventStr) then
    begin
      TT3Vehicle(Owner).OnLogEventStr('TWaypoint.DoContinousEvent', 'Run Continous Countermeasure');
    end;
  end;

  if FIsContSonobuoy then
  begin
    {$IFDEF SERVER}
    range := CalcRange(FLastLongSonobuoy, FLastLatSonobuoy,
             TT3Vehicle(Owner).PosX, TT3Vehicle(Owner).PosY);

    if range >= FSonobuoySpacing then
    begin
      FLastLongSonobuoy := TT3Vehicle(Owner).PosX;
      FLastLatSonobuoy := TT3Vehicle(Owner).PosY;

      if Assigned(FonDeploySonobuoy) then
        FonDeploySonobuoy(TT3Vehicle(Owner).InstanceIndex, FSonobuoyIndex,
          FSonobuoyMode, FSonobuoyDepth);
    end;
    {$ENDIF}
  end;

  if FIsContMine then
  begin
    {$IFDEF SERVER}
    range := CalcRange(FLastLongMine, FLastLatMine,
             TT3Vehicle(Owner).PosX, TT3Vehicle(Owner).PosY);

    if range >= FMineSpacing then
    begin
      FLastLongMine := TT3Vehicle(Owner).PosX;
      FLastLatMine := TT3Vehicle(Owner).PosY;

      if Assigned(FonDeployMine) then
        FonDeployMine(TT3Vehicle(Owner).InstanceIndex, FMineIndex, FMineDepth);
    end;
    {$ENDIF}
  end;
end;

procedure TWaypoint.Draw(aCnv: TCanvas);
var
  i,  x, y : Integer;
  bmp : TBitmap;
  RangeVisual : TRangeVisual;
  rec : ^TRecWaypoint;
  Bearing : Integer;
  lf: TLogFont;
begin
  with aCnv do
  begin
    if (FIsOwnerHooked and FIsOpenGuidanceTab) or
      (TT3Vehicle(FOwner).isInstructor) or
      (TT3Vehicle(FOwner).isWasdal) then
    begin
      for i := 0 to Length(FPixelTrails) - 1 do
      begin
        if i <> Length(FPixelTrails) - 1 then
        begin
          Pen.Style := psSolid;
          Pen.Color := FColourWaypoint;
          MoveTo(FPixelTrails[i].X, FPixelTrails[i].Y);
          LineTo(FPixelTrails[i + 1].X, FPixelTrails[i + 1].Y);
          Bearing := Round(CalcBearing(FPixelTrails[i].X, FPixelTrails[i].Y,
                      FPixelTrails[i + 1].X, FPixelTrails[i + 1].Y));
          FTFont.Assign(Font);
          GetObject(FTFont.Handle, SizeOf(lf), @lf);
          lf.lfEscapement := Bearing;
          lf.lfOrientation := Bearing;
          SetBkMode(Handle, TRANSPARENT);
          FTFont.Handle := CreateFontIndirect(lf);
          //Font.Assign(FTFont);
        end;


        bmp := TBitmap.Create;
        bmp.Transparent := true;
        bmp.LoadFromFile(vSymbolSetting.ImgPath + pctWayPoint + '.bmp');

        x := FPixelTrails[i].X - (bmp.Width div 2);
        y := FPixelTrails[i].Y - (bmp.Height div 2);

        rec := FWPList.Items[i];
        TextOut(FPixelTrails[i].X, FPixelTrails[i].Y, rec^.Name);

        Pen.Color := FColourWaypoint;
        Pen.Style := psSolid;
        Draw(x, y, bmp);
        bmp.Free;
      end;

      for i := 0 to FWPRangeList.Count - 1 do
      begin
        RangeVisual := FWPRangeList.Items[i];
        RangeVisual.Color := clNavy;
        RangeVisual.LineStyles := psSolid;
        RangeVisual.Draw(aCnv);
      end;
    end;
  end;
end;

function TWaypoint.EventExistForObject(indexbehav: integer;
         valType: TWaypointEventType; var varObject: TObject): boolean;
var
    rec : ^TRecWaypoint;
    event : TWaypointEventClass;
    i : integer;
    list : TList;
    exist : boolean;
begin
  result := False;

  if indexbehav > Count - 1 then
    exit;

  if indexbehav < 0 then
    exit;

  //list := FWPList.LockList;
  list := FWPList;
  exist := false;
  varObject := nil;

  rec := List.Items[indexbehav];

  for i:=0 to rec^.Events.Count - 1 do
  begin
    event := rec^.Events[i];
    if event.FType = valType then
    begin
      varObject := event;
      exist := true;
      break;
    end;
  end;

  result := exist;
end;

//function TWaypoint.First: TObject;
//begin
//  result := nil;
//
//  if FWPList.Count = 0 then exit;
//
//  FIndexPoint := 0;
//  result := Behaviour[0];
//end;

function TWaypoint.EventExistForObject(indexbehav: integer;
         valObject: TObject; var varObject : TObject): boolean;
var
    rec : ^TRecWaypoint;
    event : TWaypointEventClass;
    i : integer;
    list : TList;
    exist : boolean;
begin
  result := False;

  if indexbehav > Count - 1 then
    exit;

  if indexbehav < 0 then
    exit;

  //list := FWPList.LockList;
  list := FWPList;
  exist := false;
  varObject := nil;

  rec := List.Items[indexbehav];
  for i:=0 to rec^.Events.Count - 1 do
  begin
    event := rec^.Events[i];

    if (valObject is TT3Radar) and
       (event.FData.ClassName = 'TScripted_Radar_Event') and
       (TT3Radar(valObject).InstanceIndex = TScripted_Radar_Event(event.FData).FData.Radar_Index )
    then
      begin
        exist     := true;
        varObject := event;

        break;
      end
    else if (valObject is TT3Sonar) and
       (event.FData.ClassName = 'TScripted_Sonar_Event') and
       (TT3Sonar(valObject).InstanceIndex = TScripted_Sonar_Event(event.FData).FData.Sonar_Index)
    then
      begin
        exist     := true;
        varObject := event;

        break;
      end
    else if (valObject is TT3IFFSensor) and
       (event.FData.ClassName = 'TScripted_IFF_Event') and
       (TT3IFFSensor(valObject).InstanceIndex = TScripted_IFF_Event(event.FData).FData.IFF_Instance_Index)
    then
    begin
      exist     := true;
      varObject := event;

      break;
    end
    else if (valObject is TT3SonobuoyOnVehicle) and
       (event.FData.ClassName = 'TScripted_Sonobuoy_Event') and
       (TT3SonobuoyOnVehicle(valObject).InstanceIndex = TScripted_Sonobuoy_Event(event.FData).FData.Scripted_Event_Index)//TScripted_Sonobuoy_Event(event.FData).FData.Scripted_Event_Index)
    then
    begin
      exist     := true;
      varObject := event;

      break;
    end;
  end;

  result := exist;
  //FWPList.UnlockList;
end;

procedure TWaypoint.Delete(behav : TScripted_Behav_Definition);
var rec : ^TRecWaypoint;
    i : integer;
    list : Tlist;
    RangeVisual : TRangeVisual;
begin
  //list := FWPList.LockList;
  list := FWPList;
  for i := 0 to List.Count - 1 do begin
    rec := List.Items[i];
    if TScripted_Behav_Definition(rec^.Behav).FData.Scripted_Event_Index =
       behav.FData.Scripted_Event_Index then begin
          List.Delete(i);
          break;
       end;

    RangeVisual := FWPRangeList.Items[i];
    RangeVisual.Free;
    FWPRangeList.Delete(i);
  end;
  //FWPList.UnlockList;
end;

function TWaypoint.GetAvailableWaypointID: Integer;
var
  i, avaID, countNotFound : Integer;
  isFoundAvaId : Boolean;
  rec : ^TRecWaypoint;
begin
  avaID := 1;
  isFoundAvaId := False;

  while not isFoundAvaId do
  begin
    countNotFound := 0;

    for i := 0 to FWPListCache.Count - 1 do
    begin
      rec := FWPListCache.Items[i];

      if TScripted_Behav_Definition(rec^.Behav).FData.Scripted_Event_Index =
         avaID then
      begin
        Inc(avaID);
        Break;
      end;

      Inc(countNotFound);
    end;

    for i := 0 to FWPList.Count - 1 do
    begin
      rec := FWPList.Items[i];

      if TScripted_Behav_Definition(rec^.Behav).FData.Scripted_Event_Index =
         avaID then
      begin
        Inc(avaID);
        Break;
      end;

      Inc(countNotFound);
    end;

    if countNotFound = FWPListCache.Count + FWPList.Count then
      isFoundAvaId := True;
  end;

  Result := avaID;
end;

function TWaypoint.GetBehaviour(index: integer): TObject;
var rec : ^TRecWaypoint;
  list : TList;
begin
  //list := FWPList.LockList;
  result := nil;
  list := FWPList;

  if List.Count > 0 then
  begin
    if (index > -1) and (index <= List.count-1) then
    begin
      rec := List.Items[index];
      result := rec^.Behav;
    end
    else
      result := nil;
  end;

  //FWPList.UnlockList;
end;

function TWaypoint.GetCount: integer;
var
  list : TList;
begin
  //list := FWPList.LockList;
  list := FWPList;
  result := List.Count;
  //FWPList.UnlockList;
end;

function TWaypoint.GetEvents(index : integer): Tlist;
var rec : ^TRecWaypoint;
  list : TList;
begin
  //list := FWPList.LockList;
  result := nil;
  list := FWPList;

  if List.Count > 0 then
  begin
    if (index > -1) and (index <= List.count-1) then
    begin
      rec := List.Items[index];
      result := rec^.Events;
    end
    else
      result := nil;
  end;

  //FWPList.UnlockList;
end;

function TWaypoint.getNextWaypoint: TScripted_Behav_Definition;
begin
  if Assigned(FPNextWaypoint) then
    result := TScripted_Behav_Definition(FPNextWaypoint^.Behav)
  else
    result := nil;
end;

function TWaypoint.GetSnapshotData(index: Integer): _SS_TWaypoint;
var
  SS : _SS_TWaypoint;
  rec : ^TRecWaypoint;
  i : Integer;
  wpEvents : TWaypointEventClass;
begin
  if FWPList.Count > 0 then
  begin
    if (index > -1) and (index <= FWPList.count-1) then
    begin
      rec := FWPList.Items[index];
      SS.ScriptBehavDefinition := TScripted_Behav_Definition(Rec.Behav).FData;
      if rec.Events.Count > 0 then
      begin
        SetLength(ss.WaypointEvent,rec.Events.Count);
        for i := 0 to rec.Events.Count - 1 do begin
          wpEvents := rec.Events.Items[i];
          SS.WaypointEvent[i].FType := Byte(wpEvents.FType);
          SS.WaypointEvent[i].FEnable := wpEvents.FEnable;
          SS.WaypointEvent[i].FObjectInstanceIndex := wpEvents.FObjectInstanceIndex;

          case wpEvents.FType of
            wetRadar:
                    begin
                      SS.WaypointEvent[i].ScriptedRadarEvent := TScripted_Radar_Event(wpEvents.FData).FData;
                    end;
            wetSonar:
                    begin
                      SS.WaypointEvent[i].ScriptedSonarEvent := TScripted_Sonar_Event(wpEvents.FData).FData;
                    end;
            wetIFFTransponder, wetIFFInterogator:
                    begin
                      SS.WaypointEvent[i].ScriptedIFFEvent := TScripted_IFF_Event(wpEvents.FData).FData;
                    end;
            wetSonobuoy:
                    begin
                      SS.WaypointEvent[i].ScriptedSonobuoyEvent := TScripted_Sonobuoy_Event(wpEvents.FData).FData;
                    end;
            wetWeapon1, wetWeapon2, wetWeapon3, wetWeapon4, wetWeapon5:
                    begin
                      SS.WaypointEvent[i].ScriptedWeaponEvent := TScripted_Weapon_Event(wpEvents.FData).FData;
                    end;
            wetMine:
                    begin
                      SS.WaypointEvent[i].ScriptedMineEvent := TScripted_Mine_Event(wpEvents.FData).FData;
                    end;
            wetCounterMeasure:
                    begin
                      SS.WaypointEvent[i].ScriptedChaffEvent := TScripted_Chaff_Event(wpEvents.FData).FData;
                    end;
            wetComHF, wetComUHF:
                    begin
                      SS.WaypointEvent[i].ScriptedDatalinkEvent := TScripted_Datalink_Event(wpEvents.FData).FData;
                    end;
            wetNone:
                    begin
                    end;
          end;
        end;
      end;

      ss.Termination := Byte(Self.Termination);
      SS.NextNodeID := NextNodeID;
      SS.NextWaypoint := NextWaypoint.FData;
      SS.TerminationHeading := Self.TerminationHeading;
      result := SS;
    end;
  end;
end;

//function TWaypoint.Last: TObject;
//begin
//  result := nil;
//
//  if FWPList.Count = 0 then exit;
//
//  FIndexPoint := FWPList.Count - 1;
//  result := Behaviour[FWPList.Count - 1];
//end;

//function TWaypoint.Next: TObject;
//begin
//  result := nil;
//
//  if FWPList.Count = 0 then exit;
//
//  FIndexPoint := FIndexPoint + 1;
//  if FIndexPoint < FWPList.Count - 1 then
//    result := Behaviour[FIndexPoint]
//  else begin
//    FIndexPoint := FWPList.Count;
//    result := nil;
//  end;
//end;

//function TWaypoint.Previous: TObject;
//begin
//  result := nil;
//
//  if FWPList.Count = 0 then exit;
//
//  FIndexPoint := FIndexPoint - 1;
//  if FIndexPoint >= 0 then
//    result := Behaviour[FIndexPoint]
//  else begin
//    FIndexPoint := -1;
//    result := nil;
//  end;
//end;

//procedure TWaypoint.ReposWaypoint;
//var
//  rec : ^TRecWaypoint;
//  i : integer;
//begin
//  for i := 0 to FWPList.Count - 1 do begin
//    rec := FWPList.Items[i];
//
//    TScripted_Behav_Definition(rec^.Behav).FData.Waypoint_Latitude := FOwner.getPositionX - FOffsetX;
//    TScripted_Behav_Definition(rec^.Behav).FData.Waypoint_Longitude := FOwner.getPositionY - FOffsetY;
//  end;
//end;

procedure TWaypoint.RestartWaypoint;
begin
  if FWPList.Count > 0 then
  begin
    NextNodeID := 0;
    FNextNodeID := 0;
    FPNextWaypoint := FWPList.Items[0];
  end;
end;

//===Nando
//Repost Position Versi 2 ^^8
procedure TWaypoint.SetStartWaypoint;
begin
  FStartWaypointX := FOwner.getPositionX;
  FstartWaypointY := FOwner.getPositionY;
end;

procedure TWaypoint.SetHeadingWaypoint;
begin
  if not Assigned(NextWaypoint) then exit;

  {
  with NextWaypoint do
  begin
    bearing := CalcBearing(FOwner.getPositionX,FOwner.getPositionY, FData.Waypoint_Longitude,
     FData.Waypoint_Latitude);

    if Assigned(TT3PlatformInstance(FOwner).FOnOrderedControl) then
        TT3PlatformInstance(FOwner).FOnOrderedControl(TT3Vehicle(FOwner), pocHeading, bearing);
  end;
  }

end;

procedure TWaypoint.SetNextNodeID(const Value: Integer);
begin
  if Value <> FNextNodeID then
  begin
    FNextNodeID := Value;

    if FWPList.Count > 0 then
    begin
      FPNextWaypoint := FWPList.Items[FNextNodeID];

      if Assigned(FOnWaypointChange) then
        FOnWaypointChange(2);
    end;
  end;
end;

procedure TWaypoint.RestartWaypointWithCurrentPosition;
var
  i : Integer;
  recNew : ^TRecWaypoint;
  difLat, difLong : Double;
begin
  difLong := FOwner.getPositionX - FStartWaypointX;
  difLat := FOwner.getPositionY - FstartWaypointY;

  for i := 0 to FWPList.Count - 1 do
  begin
    recNew := FWPList.Items[i];

    //Change old Coordinat with new Coordinat (because Pattern is same)
    //Change Longitude
    TScripted_Behav_Definition(recNew^.Behav).FData.Waypoint_Longitude :=
      TScripted_Behav_Definition(recNew^.Behav).FData.Waypoint_Longitude + difLong;

    //Change Latitude
    TScripted_Behav_Definition(recNew^.Behav).FData.Waypoint_Latitude :=
      TScripted_Behav_Definition(recNew^.Behav).FData.Waypoint_Latitude + difLat;
  end;
end;

procedure TWaypoint.TerminationAction;
var
  v : TT3Vehicle;
begin
  // procedure ketika mencapai point terakhir --> tergantung termination-nya
  case FTermination of
    wtLH:
    begin
      Clear;
      Enabled := False;

      v := TT3Vehicle(FOwner);
      FonWaypointEnd(v.InstanceIndex, v.Speed, v.Heading);
    end;
    wtTH:
    begin
      Clear;
      Enabled := False;

      v := TT3Vehicle(FOwner);
      FonWaypointEnd(v.InstanceIndex, v.Speed, FTerminationHeading);
    end;
    wtRP:
    begin
      RestartWaypointWithCurrentPosition;
      SetStartWaypoint;
      RestartWaypoint;
      Apply;

      v := TT3Vehicle(FOwner);
      FonWaypointEnd(v.InstanceIndex, 0, v.Heading);
    end;
    wtRP2:
    begin
      RestartWaypoint;
      v := TT3Vehicle(FOwner);
      FonWaypointEnd(v.InstanceIndex, 0, v.Heading);
    end;
    wtRB:
    begin
      v := TT3Vehicle(FOwner);
      FonWaypointEnd(v.InstanceIndex, 0, v.Heading);
    end;
    wtRM:
    begin
      if Assigned(FOwner) then
      begin
        v := TT3Vehicle(FOwner);

        if Assigned(FonWaypointRemoveOwner) then
        begin
          if not FisRemoveOwner then
          begin
            FisRemoveOwner := True;
            FonWaypointRemoveOwner(v.InstanceIndex);
          end;
        end;
        FonWaypointEnd(v.InstanceIndex, 0, v.Heading);
      end;

    end;
    wtSp :
    begin
      Clear;
      Enabled := False;

      v := TT3Vehicle(Owner);
      FonWaypointEnd(v.InstanceIndex, 0, v.Heading);
    end;
  end;
end;

procedure TWaypoint.WeaponChange(aIndex, aList_Index, aWeaponIndex,
  aWeaponID: Integer);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);
  EventList.FEnable := (aWeaponIndex <> 0);

  TScripted_Weapon_Event(EventList.FData).FData.Weapon_Type := aWeaponIndex;
  EventList.FObjectInstanceIndex := aWeaponID;
end;

procedure TWaypoint.WeaponSalvoChange(aIndex, aList_Index, aWeaponIndex,
  aSalvo: Integer);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);

  TScripted_Weapon_Event(EventList.FData).FData.Salvo_Size := aSalvo;
end;

procedure TWaypoint.WeaponTargetChange(aIndex, aList_Index, aWeaponIndex,
  aTarget: Integer);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);

  TScripted_Weapon_Event(EventList.FData).FData.Target_Index := aTarget;
end;

procedure TWaypoint.SensorStateChange(aIndex, aList_Index, aDeviceType,
  aState: Integer);
var
  rec : ^TRecWaypoint;
  List , TempList : TList;

  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);
  EventList.FEnable := (aState <> 2);

  case aDeviceType of
    1 : TScripted_Radar_Event(EventList.FData).FData.Radar_Control := aState;
    2 : TScripted_Sonar_Event(EventList.FData).FData.Sonar_Control := aState;
    3 : TScripted_IFF_Event(EventList.FData).FData
          .IFF_Transponder_Control := aState;
    4 : TScripted_IFF_Event(EventList.FData).FData
          .IFF_Interrogator_Control := aState;
  end;
end;

procedure TWaypoint.SetEnabled(const Value: boolean);
begin
  FEnabled := Value;
end;

procedure TWaypoint.SetOnPointReached(const Value: TOnWaypointReached);
begin
  FOnPointReached := Value;
end;

procedure TWaypoint.SetOwner(const Value: TSimObject);
begin
  FOwner := Value;
  //VConvertor.ConvertToScreen(FOwner.getPositionX,FOwner.getPositionY,FOwnerPositionX,FOwnerPositionY);
end;

procedure TWaypoint.SetTermination(const Value: TWaypointTermination);
begin
  FTermination := Value;
end;

procedure TWaypoint.SetVisibleCircleWP(const Value: Boolean);
begin
  FVisibleCircleWP := Value;
end;

procedure TWaypoint.SonobuoyChange(aIndex, aList_Index, aSonobuoyIndex,
  aDeviceID: Integer);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);
  EventList.FEnable := (aSonobuoyIndex <> 0);

  TScripted_Sonobuoy_Event(EventList.FData).FData.SonobuoyType := aSonobuoyIndex;
  EventList.FObjectInstanceIndex := aDeviceID;
end;

procedure TWaypoint.SonobuoyContinueStateChange(aIndex, aList_Index,
  aSonobuoyIndex: Integer; aSonobuoyContinueState: Boolean);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);

  TScripted_Sonobuoy_Event(EventList.FData).FData.DeploySonoUntilNextWp := aSonobuoyContinueState;
end;

procedure TWaypoint.SonobuoyDepthChange(aIndex, aList_Index,
  aSonobuoyIndex: Integer; aSonobuoyDepth: Double);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);

  TScripted_Sonobuoy_Event(EventList.FData).FData.SonobuoyDepth := aSonobuoyDepth;
end;

procedure TWaypoint.SonobuoyModeChange(aIndex, aList_Index, aSonobuoyIndex,
  aSonobuoyMode: Integer);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);

  TScripted_Sonobuoy_Event(EventList.FData).FData.SonobuoyMode := aSonobuoyMode;
end;

procedure TWaypoint.SonobuoyQuantityChange(aIndex, aList_Index,
  aSonobuoyIndex, aSonobuoyQty: Integer);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);

  TScripted_Sonobuoy_Event(EventList.FData).FData.SonobuoyQuantity := aSonobuoyQty;
end;

procedure TWaypoint.SonobuoySpacingChange(aIndex, aList_Index,
  aSonobuoyIndex: Integer; aSonobuoySpacing: Double);
var
  List, TempList : TList;
  Rec : ^TRecWaypoint;
  EventList : TWaypointEventClass;
begin
  List := FWPList;
  rec := List.Items[aIndex];
  TempList := Rec^.Events;

  EventList := TWaypointEventClass(TempList[aList_Index]);

  TScripted_Sonobuoy_Event(EventList.FData).FData.SonobuoySpacing := aSonobuoySpacing;
end;

end.
