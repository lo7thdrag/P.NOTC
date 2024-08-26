unit uWeaponWaypoint;

interface

uses
  Windows, ExtCtrls, Classes, Graphics, SysUtils,
  uObjectVisuals, uT3Unit, uSimObjects, tttData, uT3Weapon, uDBAsset_Scripted
  , uBaseCoordSystem;

type
  TOnWaypointWeaponReach = procedure (Sender : Tobject) of object;

  TWeaponWaypointEventClass = class
    FEnable : boolean;
    FData   : TObject;
  end;

  TWeaponWaypoint = class
    private
      FWeaponWaypointList : TList;
      //FPixelTrails : array of TPoint;
      FOwner: TSimObject;                    //Owner is Missile / Projectile
      //FOwnerPositionX : integer;             //Position Of Missile / Projectile
      //FOwnerPositionY : integer;
      FSelected: boolean;
      FOnSelected: TNotifyEvent;
      FClick: Boolean;
      FOnClick: TNotifyEvent;
      //FText: TTextVisual;
      FTrackObject: TT3Unit;

      FEnabled: boolean;
      FDrawWeaponWaypoint : Boolean;
      //FTargetObject : TSimObject;
    public
      FNextWaypoint : ^TRecWeaponWaypoint;

      constructor Create;
      destructor  Destroy;Override;

      procedure SetTrackObject(const Value: TT3Unit);
      procedure SetSelected(const Value: boolean);
      procedure SetEnabled(const Value: Boolean);
      procedure SetClick(const Value: Boolean);
      procedure SetDrawWeaponWaypoint(const Value : boolean);
      procedure SetOnSelected(const Value: TNotifyEvent);
      procedure SetOnClick(const Value: TNotifyEvent);
      procedure SetOwner(const val : TSimObject);
      procedure CheckWeaponWaypointReach(x1, y1, x2, y2 : Double);
      procedure Add(behav : TScripted_Behav_Definition; event : TWeaponWaypointEventClass);
      procedure OnAddWeaponWaypoint(Lat, Long : Double; aWpID : integer);
      procedure CheckWaypointReach;
      procedure ApplyWeaponWaypoint;

      property TrackObject  : TT3Unit read FTrackObject write SetTrackObject;
      property OnSelected   : TNotifyEvent read FOnSelected write SetOnSelected;
      property OnClick      : TNotifyEvent read FOnClick write SetOnClick;
      property IsEnabled    : Boolean read FEnabled write SetEnabled;
      property IsDrawWeaponWaypoint : Boolean read FDrawWeaponWaypoint write SetDrawWeaponWaypoint;
      property isSelected   : Boolean read FSelected write SetSelected;
      property isClick      : Boolean read FClick write SetClick;
      property Owner        : TSimObject read FOwner write SetOwner;
      property WeaponWaypointList : TList read FWeaponWaypointList;
  end;

implementation

//uses uT3Missile;

{ TWeaponWaypoint }

constructor TWeaponWaypoint.Create;
begin
  FWeaponWaypointList := TList.Create;
  FNextWaypoint       := nil;
  FEnabled            := false;
  FDrawWeaponWaypoint := False;
end;

destructor TWeaponWaypoint.Destroy;
begin

  inherited;
end;

procedure TWeaponWaypoint.SetDrawWeaponWaypoint(const Value: boolean);
begin
  FDrawWeaponWaypoint := Value;
end;

procedure TWeaponWaypoint.SetEnabled(const Value: Boolean);
begin
  FEnabled := Value;
end;

procedure TWeaponWaypoint.SetOnSelected(const Value: TNotifyEvent);
begin
  FOnSelected := Value;
end;

procedure TWeaponWaypoint.SetOwner(const val: TSimObject);
begin
  FOwner := val;
end;

procedure TWeaponWaypoint.SetOnClick(const Value: TNotifyEvent);
begin
  FOnClick := Value;
end;

procedure TWeaponWaypoint.SetTrackObject(const Value: TT3Unit);
begin
  FTrackObject := Value;
end;

procedure TWeaponWaypoint.SetSelected(const Value: boolean);
begin
  FSelected := Value;

  if Assigned(FOnSelected) and FSelected then
    FOnSelected(Self);
end;

procedure TWeaponWaypoint.SetClick(const Value: Boolean);
begin
  FClick := Value;

  if Assigned(FOnClick) and FClick then
    FOnClick(self);
end;

procedure TWeaponWaypoint.OnAddWeaponWaypoint(Lat, Long: Double; aWpID : integer);
var
  behav : TScripted_Behav_Definition;
begin
  if aWpID < 3 then
  begin
    behav := TScripted_Behav_Definition.Create;
    with behav.FData do
    begin
      Scripted_Event_Index  := aWpID;
      Waypoint_Latitude     := Lat;
      Waypoint_Longitude    := Long;
    end;

    Add(behav, nil);
  end;
end;

procedure TWeaponWaypoint.Add(behav: TScripted_Behav_Definition;
  event: TWeaponWaypointEventClass);
var
  rec, tmp : ^TRecWeaponWaypoint;
  isNew, isDone : boolean;
  i : integer;
  List : TList;
begin
  isNew := True;

  List := FWeaponWaypointList;
  for i := 0 to List.Count - 1 do begin
    rec := List.Items[i];
    if TScripted_Behav_Definition(rec^.Behav).FData.Scripted_Event_Index =
       behav.FData.Scripted_Event_Index then begin
          if event <> nil then
            rec^.Events.Add(event);
          isNew := false;
       end;
  end;

  if isNew then begin
    isDone := false;

    New(rec);
    rec^.Events := TList.Create;
    rec^.Behav  := behav;
    rec^.Name   := 'Waypoint' + IntToStr(behav.FData.Scripted_Event_Index);

    if event <> nil then
      rec^.Events.Add(event);

    for I := 0 to List.Count - 1 do begin
      tmp := List.Items[i];
      if (TScripted_Behav_Definition(tmp^.Behav).FData.Scripted_Event_Index >
         behav.FData.Scripted_Event_Index) and (i <> List.Count - 1) then begin
           List.Insert(i,rec);
           isDone := true;
         end;
    end;

    if not isDone then FWeaponWaypointList.Add(rec);
  end;
end;

procedure TWeaponWaypoint.ApplyWeaponWaypoint;
begin
 if FWeaponWaypointList.Count > 0 then
    FNextWaypoint := FWeaponWaypointList.Items[0];
end;

procedure TWeaponWaypoint.CheckWaypointReach;
begin

end;

procedure TWeaponWaypoint.CheckWeaponWaypointReach(x1, y1, x2, y2 : Double);
var
  range  : double;
  i : Integer;
begin
  if Assigned(FOwner) then
  begin
    if Assigned(FNextWaypoint) then
    begin
//      dx := TScripted_Behav_Definition(FNextWaypoint^.Behav).FData.Waypoint_Latitude;
//      dy := TScripted_Behav_Definition(FNextWaypoint^.Behav).FData.Waypoint_Longitude;

      range := CalcRange(x1, y1, x2, y2) * C_NauticalMile_To_Metre; // meter
      if range <= 30 then
      begin
        i := FWeaponWaypointList.IndexOf(FNextWaypoint);
        if Assigned(TT3Weapon(owner).OnLogEventStr) then
          TT3Weapon(owner).OnLogEventStr('TWeaponWaypoint.CheckWeaponWaypointReach',
            TT3Weapon(owner).InstanceName
            + ' Reach Waypoint ' + FNextWaypoint^.Name);

//        if Assigned(TT3Missile(owner).OnLogEventStr) then
//          TT3Missile(owner).OnLogEventStr(TT3Missile(owner).InstanceName + ' Reach Waypoint ' + FNextWaypoint^.Name);

        if i < FWeaponWaypointList.Count - 1 then
        begin
          FNextWaypoint := FWeaponWaypointList.Items[i + 1];
          TT3Weapon(Owner).NeedAjust := True;

          if Assigned(TT3Weapon(owner).OnLogEventStr) then
            TT3Weapon(owner).OnLogEventStr('TWeaponWaypoint.CheckWeaponWaypointReach',
              TT3Weapon(owner).InstanceName +
              ' Movo to ' + FNextWaypoint^.Name + ' lat ' +
              FloatToStr(TScripted_Behav_Definition(FNextWaypoint^.Behav).FData.
              Waypoint_Latitude) + ' long ' + FloatToStr(
              TScripted_Behav_Definition(FNextWaypoint^.Behav).FData.
              Waypoint_Longitude));

//           TT3Missile(Owner).NeedAjust := True;
//
//           if Assigned(TT3Missile(owner).OnLogEventStr) then
//              TT3Missile(owner).OnLogEventStr(TT3Missile(owner).InstanceName + ' Movo to '
//                  + FNextWaypoint^.Name + ' lat ' + FloatToStr(TScripted_Behav_Definition(FNextWaypoint^.Behav).FData.Waypoint_Latitude)
//                  + ' long ' + FloatToStr(TScripted_Behav_Definition(FNextWaypoint^.Behav).FData.Waypoint_Longitude));
        end
        else
        begin
          FNextWaypoint := nil;
          TT3Weapon(Owner).NeedAjust := True;

          if Assigned(TT3Weapon(owner).OnLogEventStr) then
            TT3Weapon(owner).OnLogEventStr('TWeaponWaypoint.CheckWeaponWaypointReach',
              TT3Weapon(owner).InstanceName +
              ' Targeting ' + TT3PlatformInstance(TT3Weapon(owner).
              TargetObject).InstanceName);

//          TT3Missile(Owner).NeedAjust := True;
//          if Assigned(TT3Missile(owner).OnLogEventStr) then
//            TT3Missile(owner).OnLogEventStr(TT3Missile(owner).InstanceName +
//              ' Targeting ' + TT3PlatformInstance(TT3Missile(owner).
//              TargetObject).InstanceName);
        end;
      end;
    end;
  end;
end;

end.
