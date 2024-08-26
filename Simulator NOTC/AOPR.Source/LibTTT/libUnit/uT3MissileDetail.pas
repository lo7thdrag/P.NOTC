unit uT3MissileDetail;

interface

uses
  Classes, SysUtils, Graphics, Windows,
  uT3Missile, uWeaponWaypoint, tttData, uT3UnitContainer, uSimObjects,
  uT3Unit, uT3DetectedTrack, uDBCubicles, uT3Vehicle, uCoordConvertor,
  uBaseCoordSystem, uObjectVisuals, uLibSettingTTT, uT3CounterMeasure
  ,uDataTypes, uT3Common, uDBAsset_Scripted, uT3MissileEnvironment,
  uSnapshotData, uT3Weapon, uT3Torpedo;

type

//============================================================================
  //==============================================================================
  //List Missile launch for Tote Dysplay
  TMissileHaveLaunch = class
    MissileLaunch : TT3Missile;
    TimeEng     : TTime;
    TImeFlight  : TTime;
    StartTime   : TTime;
    FTImeFlight  : Double;
    isAir       : Boolean;
    EngageMode  : string;
    isHaveLaunch : Boolean;
    isLaunch  : Boolean;
    launcherMissileAngle : Double;
    MissileCategory : TWeapoonCategory;
    LauncherNumber : Integer;
    MissileName  : string;
    MissileIndex : Integer;
    ParentShipName  : string;
    parentShipIndex : Integer;
    TargetShipName  : string;
    TargetShipIndex : Integer;
    TargetCourse : Double;
    TargetSpeed  : Double;
    TargetAltitude : Double;
  end;

  //Kind Of Missile-------------------------------------------------------------
  //Surface to Surface
  TT3Missile_SS = class(TT3Missile)
    private
      procedure Shoot;
      function searchTarget : TSimObject;
    protected
      procedure SetLaunched(const Value: boolean);override;
      procedure SetAltitude(const Value : single);override;
    public
      MissileMovement : TT3LaunchMovement_Missile;
      MissileHitMode  : TT3Hit_Missile;

      constructor Create; override;
      destructor  Destroy; override;

      procedure Initialize;override;
      procedure SetMovement(Mode : TMissileFiringMode);
      procedure Draw(aCnv: tCanvas); override;
      procedure Move(const aDeltaMs: double); override;

      function    GetSnapshotData : _SS_TT3Missile_SS;
      procedure   SetSnapshotData (const ss : _SS_TT3Missile_SS);
  end;

  //Surface to Air
  TT3Missile_SA = class(TT3Missile)
    private
      FisSeekTargetAlt : Boolean;
      procedure Shoot;
      function searchTarget : TSimObject;
    public
      MissileMovement : TT3LaunchMovement_Missile;

      constructor Create; override;
      destructor  Destroy; override;
      procedure Initialize; override;
      procedure Move(const aDeltaMs: double); override;

      function    GetSnapshotData : _SS_TT3Missile_SA;
      procedure   SetSnapshotData (const ss : _SS_TT3Missile_SA);
  end;

  //Air to Air
  TT3Missile_AA = class(TT3Missile)
    private
      procedure Shoot;
      function searchTarget : TSimObject;
    public
      MissileMovement : TT3LaunchMovement_Missile;

      constructor Create; override;
      destructor  Destroy; override;

      procedure Initialize;override;
      procedure Move(const aDeltaMs: double); override;
      procedure SetMovement(Mode : TMissileFiringMode);

      function  GetSnapshotData : _SS_TT3Missile_AA;
      procedure SetSnapshotData (const ss : _SS_TT3Missile_AA);
  end;

   //Air to Surface
  TT3Missile_AS = class(TT3Missile)
    private
      procedure Shoot;
      function searchTarget : TSimObject;
    public
      MissileMovement : TT3LaunchMovement_Missile;
      constructor Create; override;
      destructor  Destroy; override;

      procedure Initialize;override;
      procedure Move(const aDeltaMs: double); override;
      procedure SetMovement(Mode : TMissileFiringMode);

      function  GetSnapshotData : _SS_TT3Missile_AS;
      procedure SetSnapshotData (const ss : _SS_TT3Missile_AS);
  end;

  //Land Attack
  TT3Missile_LA = class(TT3Missile)
    private
      procedure Shoot;
      {$IFDEF SERVER}
      function searchTarget : TSimObject;
      {$ENDIF}
    public
      MissileMovement : TT3LaunchMovement_Missile;

      constructor Create; override;
      destructor  Destroy; override;

      procedure Initialize;override;
      procedure Move(const aDeltaMs: double); override;
      procedure SetMovement(Mode : TMissileFiringMode);

      function  GetSnapshotData : _SS_TT3Missile_LA;
      procedure SetSnapshotData (const ss : _SS_TT3Missile_LA);
  end;

  //Hybrid Missile
  TT3Missile_HM = class(TT3Missile)
    private
      FTorpedo : TT3Torpedo;
      FTorpedoDefinition  : TRecTorpedo_Definition;

      procedure Shoot;

      {$IFDEF SERVER}
//      function searchTarget : TSimObject;
//      function CheckDomainTarget(Target : TT3PlatformInstance): Boolean;
      {$ENDIF}

      public
      MissileMovement : TT3LaunchMovement_Missile;

      constructor Create; override;
      destructor  Destroy; override;

      procedure Initialize;override;
      procedure Draw(aCnv: tCanvas); override;
      procedure Move(const aDeltaMs: double); override;
//      procedure SetMovement(Mode : TMissileFiringMode);

      function  GetSnapshotData : _SS_TT3Missile_HM;
      procedure SetSnapshotData (const ss : _SS_TT3Missile_HM);

      property LoadedTorpedo : TT3Torpedo read FTorpedo write FTorpedo;
      property TorpedoDefinition : TRecTorpedo_Definition read FTorpedoDefinition
                write FTorpedoDefinition;
  end;

  //Tactical Missile
  TT3Missile_TM = class(TT3Missile)
    private
//      procedure Shoot;
//      function searchTarget : TSimObject;
    public
      MissileMovement : TT3LaunchMovement_Missile;

      constructor Create; override;
      destructor  Destroy; override;

      procedure Initialize;override;
      procedure Draw(aCnv: tCanvas); override;
      procedure Move(const aDeltaMs: double); override;

      function  GetSnapshotData : _SS_TT3Missile_TM;
      procedure SetSnapshotData (const ss : _SS_TT3Missile_TM);
  end;

//==============================================================================
implementation

uses
  uT3Radar, newClassASTT, uT3Sensor, uFilter;

//================================================================================
{ TT3Missile_SS } //Surface to Surface Missile

constructor TT3Missile_SS.create;
begin
  inherited;

  MissileHitMode := TT3Hit_Missile.create;
end;

procedure TT3Missile_SS.SetAltitude(const Value: single);
begin
  FMover.Z := Value/(C_NauticalMile_To_Metre * C_Degree_To_NauticalMile);
end;

procedure TT3Missile_SS.SetLaunched(const Value: boolean);
begin
  inherited;

  {if Assigned(FTargetObject) then
  begin
    if FLaunched then
    begin
      if Self.Definition.Fly_Out_Required = 1 then
        SetAltitude(Definition.Fly_Out_Altitude * C_Feet_To_Meter)
      else
        SetAltitude(FDefaultAltitude * C_Feet_To_Meter);
    end;
  end;}
end;

procedure TT3Missile_SS.SetMovement(Mode: TMissileFiringMode);
begin
  case Mode of
    mfmRBl, mfmRBLW :
    begin
      MissileMovement := TT3RBL_Missile.create;
      TT3RBL_Missile(MissileMovement).Converter := Converter;
    end;
    mfmBOL, mfmBOLW :
    begin
      MissileMovement := TT3BOL_Missile.create;
      TT3BOL_Missile(MissileMovement).Converter := Converter;
    end;
  end;
end;

function TT3Missile_SS.GetSnapshotData: _SS_TT3Missile_SS;
var
   ss : _SS_TT3Missile_SS ;
begin
   ss.M := TT3Missile(Self).GetSnapshotData ;
   if MissileHitMode <> nil then begin
      ss.TT3Hit.PopUp_Move  := byte(MissileHitMode.PopUp_Move)  ;
      ss.TT3Hit.HAFO        := MissileHitMode.HAFO              ;
      ss.TT3Hit.HighCurve   := MissileHitMode.HighCurve         ;
      ss.TT3Hit.StartCurve  := MissileHitMode.StartCurve        ;
      ss.TT3Hit.isHAFOSet   := MissileHitMode.isHAFOSet         ;
      ss.TT3Hit.isPopUP     := MissileHitMode.isPopUP           ;
      ss.TT3Hit.isHavePopUp := MissileHitMode.isHavePopUp       ;
   end;
   Result := ss ;
end;

procedure TT3Missile_SS.SetSnapshotData(const ss: _SS_TT3Missile_SS);
begin
  TT3Missile(Self).SetSnapshotData(ss.M) ;
  if MissileHitMode <> nil then begin
    MissileHitMode.PopUp_Move      := TPopUpMode(ss.TT3Hit.PopUp_Move)  ;
    MissileHitMode.HAFO            := ss.TT3Hit.HAFO        ;
    MissileHitMode.HighCurve       := ss.TT3Hit.HighCurve   ;
    MissileHitMode.StartCurve      := ss.TT3Hit.StartCurve  ;
    MissileHitMode.isHAFOSet       := ss.TT3Hit.isHAFOSet   ;
    MissileHitMode.isPopUP         := ss.TT3Hit.isPopUP     ;
    MissileHitMode.isHavePopUp     := ss.TT3Hit.isHavePopUp ;
   end;
end;

destructor TT3Missile_SS.destroy;
begin

  inherited;
end;

procedure TT3Missile_SS.Draw(aCnv: tCanvas);
var
  idx,i: Integer;
  misPos, nextWaypointPos, targetPos : TPoint;
  nextWaypoint : ^TRecWeaponWaypoint;

  xPos, yPos : integer;
begin
  if not vFilter.Show(pftAir, 'Surface-to-surface missile', 'Weapon engagements') then
    Exit;

  inherited;       //mk

  FTacticalSymbol.isVehicle := false;

  if not Visible then Exit;
  if not Planned then Exit;

  if Assigned(WeaponWaypoint.FNextWaypoint) then
  begin
    Converter.ConvertToScreen(getPositionX, getPositionY, misPos.X, misPos.Y);

    with aCnv do
    begin
      Pen.Color := clSilver;
      Pen.Style := psSolid;
      Pen.Width := 1;

      MoveTo(misPos.X, misPos.Y);
      idx := WeaponWaypoint.WeaponWaypointList.IndexOf(WeaponWaypoint.FNextWaypoint);

      for i := idx to WeaponWaypoint.WeaponWaypointList.Count - 1 do
      begin
        nextWaypoint := WeaponWaypoint.WeaponWaypointList.Items[i];

        with TScripted_Behav_Definition(nextWaypoint^.Behav).FData do
          Converter.ConvertToScreen(Waypoint_Latitude, Waypoint_Longitude,
            nextWaypointPos.X, nextWaypointPos.Y);

        LineTo(nextWaypointPos.X, nextWaypointPos.Y);
        MoveTo(nextWaypointPos.X, nextWaypointPos.Y);
      end;

      Converter.ConvertToScreen(TT3PlatformInstance(TargetObject).PosX,
        TT3PlatformInstance(TargetObject).PosY, targetPos.X, targetPos.Y);
      LineTo(targetPos.X, targetPos.Y);
    end;
  end
  else if MissileMovement is TT3RBL_Missile then
  begin
    if isShowMode then
    begin
//      TT3RBL_Missile(MissileMovement).Converter := Converter;
      TT3RBL_Missile(MissileMovement).DrawCircleofRBL(aCnv, Self);
    end;
  end
  else if MissileMovement is TT3BOL_Missile then
  begin
//    TT3BOL_Missile(MissileMovement).Converter := Converter;
    TT3BOL_Missile(MissileMovement).DrawDestructRangeofBOL(aCnv, Self);
  end;

  if (FLaunching) then
	begin
    FTacticalSymbol.SpeedVector.Speed   := 60;
    FTacticalSymbol.SpeedVector.Course  := Course;
    FTacticalSymbol.SpeedVector.Visible := True;
    FTacticalSymbol.SpeedVector.Color   := FTacticalSymbol.Color;  //mk

    FTacticalSymbol.SetTextVisibility(Visible);

    if isInstructor then
      FTacticalSymbol.CallSign1 := Track_ID
    else
      FTacticalSymbol.CallSign1 := IntToStr(TrackNumber);

    FTacticalSymbol.SetTextColor(FTacticalSymbol.Color);  //mk
    FTacticalSymbol.Visible             := Visible;
    FTacticalSymbol.Draw(aCnv);

    xPos := FTacticalSymbol.Center.X;
    yPos := FTacticalSymbol.Center.Y;
    FSignPlatform.Text    := '+';
    FSignPlatform.Center  := Point(xPos - 7, yPos);
    FSignPlatform.Visible := Visible;
    FSignPlatform.Color   := FTacticalSymbol.Color;  //mk
    FSignPlatform.Draw(aCnv);
  end;
end;

procedure TT3Missile_SS.Initialize;
begin
  inherited;

  MissileHitMode.PopUp_Move := ppPopUP;
  MissileHitMode.isHAFOSet := False;
  MissileHitMode.HAFO      := 1.97;
  MissileHitMode.isPopUP   := false;
  MissileHitMode.isHavePopUp    := False;
  MissileHitMode.TargettoPopUp  := nil;
end;

procedure TT3Missile_SS.Shoot;
var
  i : Integer;
  hRange,hBearing,hTime,hSpeed : double;
  mx,my : double;

  //3 point waypoint
  LengthWaypoint : Double;
  NextWaypointTemp : ^TRecWeaponWaypoint;
  NextWaypointTemp2 : ^TRecWeaponWaypoint;
  PositionX_Waypoint, PositionY_Waypoint : Double;
  PositionX2_Waypoint, PositionY2_Waypoint : Double;
  PositionLastX_Waypoint, PositionLastY_Waypoint : Double;
  PositionX_RBLW, PositionY_RBLW : Double;
  //defHeight : double;
begin
  case FiringMode of
    mfmRBl :
    begin
      if not Assigned(TargetObject) then Exit;

      FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y,FPosition.X, FPosition.Y);
      FTargetBearing := Calcbearing(FPosition.X, FPosition.Y, FTargetPosition.X,FTargetPosition.Y);
      FTargetCourse  := TT3PlatformInstance(TargetObject).Course;
      FTargetSpeed  := TT3PlatformInstance(TargetObject).Speed;

      CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                                 hRange,hBearing,hTime,hSpeed);

      RangeBearingToCoord(hRange,hBearing,mx,my);
      FTargetPosition.X := FPosition.X + mx;
      FTargetPosition.Y := FPosition.Y + my;
      FTargetPosition.Z := TT3PlatformInstance(TargetObject).getPositionZ;

      FTargetBearing    := hBearing;
      FTargetRange      := hRange;
    end;
    mfmRBLW :
    begin
      if not Assigned(TargetObject) then Exit;

      if WeaponWaypoint.WeaponWaypointList.Count > 0 then
      begin
        LengthWaypoint := 0;

        NextWaypointTemp   := WeaponWaypoint.WeaponWaypointList.Items[WeaponWaypoint.WeaponWaypointList.Count-1];
        PositionLastX_Waypoint := TScripted_Behav_Definition(NextWaypointTemp^.Behav).FData.Waypoint_Latitude;
        PositionlastY_Waypoint := TScripted_Behav_Definition(NextWaypointTemp^.Behav).FData.Waypoint_Longitude;

        if WeaponWaypoint.WeaponWaypointList.Count > 0 then
        begin
          NextWaypointTemp := WeaponWaypoint.WeaponWaypointList.Items[0];

          PositionX_Waypoint := TScripted_Behav_Definition(NextWaypointTemp^.Behav).FData.Waypoint_Latitude;
          PositionY_Waypoint := TScripted_Behav_Definition(NextWaypointTemp^.Behav).FData.Waypoint_Longitude;

          LengthWaypoint := LengthWaypoint + CalcRange(FHomePositionX, FHomePositionY, PositionX_Waypoint, PositionY_Waypoint);

          for i := 0 to WeaponWaypoint.WeaponWaypointList.Count - 1 do
          begin
            if (i + 1) < WeaponWaypoint.WeaponWaypointList.Count then
            begin
               NextWaypointTemp := WeaponWaypoint.WeaponWaypointList.Items[i+1];
               NextWaypointTemp2 := WeaponWaypoint.WeaponWaypointList.Items[i];

               PositionX_Waypoint := TScripted_Behav_Definition(NextWaypointTemp^.Behav).FData.Waypoint_Latitude;
               PositionY_Waypoint := TScripted_Behav_Definition(NextWaypointTemp^.Behav).FData.Waypoint_Longitude;

               PositionX2_Waypoint := TScripted_Behav_Definition(NextWaypointTemp2^.Behav).FData.Waypoint_Latitude;
               PositionY2_Waypoint := TScripted_Behav_Definition(NextWaypointTemp2^.Behav).FData.Waypoint_Longitude;

               LengthWaypoint := LengthWaypoint + CalcRange(PositionX2_Waypoint, PositionY2_Waypoint, PositionX_Waypoint, PositionY_Waypoint);
            end;
          end;

          CalcHitPredictionWithWaypoint(TT3PlatformInstance(TargetObject).Speed, TT3PlatformInstance(TargetObject).Course, LengthWaypoint
                                              ,FTargetPosition.X , FTargetPosition.Y, UnitMotion.FData.High_Ground_Speed,
                                              PositionX_RBLW, PositionY_RBLW);

          FTargetPosition.X := PositionX_RBLW;
          FTargetPosition.Y := PositionY_RBLW;

          FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y,PositionLastX_Waypoint, PositionlastY_Waypoint);
          FTargetBearing := Calcbearing(PositionLastX_Waypoint, PositionlastY_Waypoint, FTargetPosition.X,FTargetPosition.Y);
          FTargetCourse  := TT3PlatformInstance(TargetObject).Course;
          FTargetSpeed   := TT3PlatformInstance(TargetObject).Speed;

          CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                           hRange,hBearing,hTime,hSpeed);

          RangeBearingToCoord(hRange,hBearing,mx,my);
          FTargetPosition.X := PositionLastX_Waypoint + mx;
          FTargetPosition.Y := PositionlastY_Waypoint + my;
          FTargetPosition.Z := TT3PlatformInstance(TargetObject).getPositionZ;
        end;
      end;
    end;
    mfmBOL, mfmBOLW :
    begin
      FTargetPosition.X := TT3BOL_Missile(MissileMovement).Start_PointBOl_X;
      FTargetPosition.Y := TT3BOL_Missile(MissileMovement).Start_PointBOl_Y;
      FTargetPosition.Z := 1/60;
    end;
  end;

  //defHeight := 10;

  FMover.MaxSpeed       := UnitMotion.FData.Max_Ground_Speed;
  FMover.Acceleration   := UnitMotion.FData.Acceleration;

  SetOrderedHeading(FTargetBearing);

  FLastPosition.X := FPosition.X;
  FLastPosition.Y := FPosition.Y;
  FLastPosition.Z := FPosition.Z;
end;

procedure TT3Missile_SS.Move(const aDeltaMs: double);
var
  i  : Integer;

  VisualRange : double;
  RangeFromHome : double;
  pf : TSimObject;

  PointRBLW : TPointVehicleMissileRBLW;
  PointBOLW : TPointVehicleMissileBOLW;
  MisName : string;
  FocusedWeapon, BestTarget : TSimObject;
  MissileVehicle : TT3MissilesOnVehicle;
begin
  inherited;

  FDeltaHead := 0;

  //Waiting Time to Launch
  if FisCounterDelay then
  begin
    FCounterDelay := FCounterDelay + aDeltaMs;
    if FCounterDelay < FLaunchDelay then exit
    else
    begin
      FisCounterDelay := False;
      FLaunching := True;
      Shoot;

      //Deleting Point Waypoint When Missile Launch
      MisName := InstanceName;
      FocusedWeapon  := TT3MissilesOnVehicle(TT3Vehicle(Owner).getWeapon(MisName));
      if FocusedWeapon <> nil then
      begin
        MissileVehicle := TT3MissilesOnVehicle(FocusedWeapon);

        case MissileVehicle.FiringMode of
          mfmRBLW:
          begin
            if MissileVehicle.RBLW_PointList.Count > 0 then
            begin
              for i := MissileVehicle.RBLW_PointList.Count - 1 downto 0 do
              begin
                PointRBLW := TPointVehicleMissileRBLW(MissileVehicle.RBLW_PointList[i]);

                if PointRBLW.LauncherIndex = FlauncherNumber then
                  MissileVehicle.RBLW_PointList.Delete(i);
              end;
            end;
          end;
          mfmBOLW:
          begin
            if MissileVehicle.BOLW_PointList.Count > 0 then
            begin
              for i := MissileVehicle.BOLW_PointList.Count - 1 downto 0 do
              begin
                PointBOLW := TPointVehicleMissileBOLW(MissileVehicle.BOLW_PointList[i]);

                if PointBOLW.LauncherIndex = FlauncherNumber then
                  MissileVehicle.BOLW_PointList.Delete(i);
              end;
            end;
          end;
        end;

      end;
    end;
  end;

  //Launch Missile
  if FLaunching and FLaunched then
  begin
    RangeFromHome := CalcRange(FHomePositionX, FHomePositionY,FPosition.X, FPosition.Y);

    {$IFDEF SERVER}
    if RangeFromHome > HAFO then
    begin
      if not MissileHitMode.isHAFOSet then
      begin
        SetOrderedAltitude(Definition.Default_Altitude * C_Feet_To_Meter);
        MissileHitMode.isHAFOSet := True;
      end;
    end
    else if RangeFromHome > FMaxRange then
    begin
      Launched := false;
      FLaunching := false;

      if Assigned(OnOut) then
        OnOut(Self,3);
    end;
    {$ENDIF}

    //to the waypoint first if waypoint exist
    if Assigned(WeaponWaypoint.FNextWaypoint) then
    begin
      CalcMovementWithWaypoint(aDeltaMs);
      WeaponWaypoint.CheckWeaponWaypointReach(FPosition.X,FPosition.Y,
             TScripted_Behav_Definition(WeaponWaypoint.FNextWaypoint^.Behav).FData.Waypoint_Latitude,
             TScripted_Behav_Definition(WeaponWaypoint.FNextWaypoint^.Behav).FData.Waypoint_Longitude);
    end
    else
    begin
      CalcMovement(aDeltaMs);

      pf := CheckHitSomething;
      if Assigned(pf) then
      begin
        if pf is TT3Vehicle then
        begin
          if (Altitude <= TT3Vehicle(pf).VehicleDefinition.FData.Height + TT3Vehicle(pf).Altitude) and
             (Altitude >= TT3Vehicle(pf).Altitude) then
          begin
            setPositionX(TT3PlatformInstance(pf).getPositionX);
            setPositionY(TT3PlatformInstance(pf).getPositionY);

            Launched := false;
            FLaunching := false;

            if Assigned(OnHit) then
            begin
              Self.reasonDestroy := 22;
              OnHit(Self,pf,Lethality);

              OnHitTo3D(Self,pf,Course);
              exit;
            end;
          end;
        end;

        if pf is TT3Chaff then
        begin
          setPositionX(TT3PlatformInstance(pf).getPositionX);
          setPositionY(TT3PlatformInstance(pf).getPositionY);

          if Assigned(OnHit) then
          begin
            Self.reasonDestroy := 22;
            OnHit(Self,pf,Lethality);
          end;

          Exit;
        end;

        if (pf is TT3InfraredDecoy) or (pf is TT3FloatingDecoy)then
        begin
          setPositionX(TT3PlatformInstance(pf).getPositionX);
          setPositionY(TT3PlatformInstance(pf).getPositionY);

          Launched := false;
          FLaunching := false;

          if Assigned(OnHit) then
          begin
            Self.reasonDestroy := 22;
            OnHit(Self,pf,Lethality);
          end;

          Exit;
        end;
      end;

      //choco : searchTarget dilakukan di Server & Client
      if not FIsOnAcquisitionDelay then
      begin
//        FIsOnAcquisitionDelay := True;
        BestTarget := searchTarget;
        if Assigned(BestTarget) then
        begin
          SetTargetObject(BestTarget);
          isLockTarget := True;
        end;
      end
      else
      begin
        FReAcquisitionCounter := FReAcquisitionCounter + aDeltaMs;
        if FReAcquisitionCounter > GameDefaults.FData.Missile_Reacquisition_Time then
        begin
          FReAcquisitionCounter := 0.00;
          FIsOnAcquisitionDelay := false;
        end;
      end;
    end;

    FLastPosition.X := FPosition.X;
    FLastPosition.Y := FPosition.Y;
    FLastPosition.Z := FPosition.Z;

    //ambil nilai range visual
    if Assigned(GameDefaults) then
      VisualRange := GameDefaults.FData.Max_Visual_Range
    else
      VisualRange := 12;

    //cek range untuk edit simbol missile
    if (not(isInstructor) and (RangeFromHome > VisualRange) and (not(isWasdal))) then    //mk
    begin
      UnitGroup := False;
      Visible := False;
//      Planned := False; | choco : planned g perlu di false. karena planned masih dibutuhkan untuk gambar
//      destrunction area pada BOL, target ring pada RBL
    end;
  end;
end;

function TT3Missile_SS.searchTarget: TSimObject;
var
  i : integer;
  pf, target : TSimObject;
  CrossSection, MaxCrossSection : Double;
  StrCrossSection : string;
  LogStr : string;
begin
  Result      := nil;

  if not HaveSeeker then
    Exit;

  if SeekerOn then
  begin
    if not FSeekAltitudeOnce then
    begin
      SetOrderedAltitude(Definition.Terminal_Pop_Up_Altitude * C_Feet_To_Meter); //sementara
      FSeekAltitudeOnce := true;
    end;
  end
  else
    Exit;

  case Definition.Primary_Guide_Type of
    0,3,4,5 : MaxCrossSection := 999999;
    1,2     : MaxCrossSection := -999999;
  else
    MaxCrossSection := 0;
  end;

  i := 0;
  target      := nil;

  while (i < TargetPlatforms.itemCount) do
  begin
    pf := TargetPlatforms.getObject(i);
    inc(i);

    if pf = Owner then continue;
    if pf = Self then continue;

    if not ((pf is TT3Vehicle) or (pf is TT3Chaff) or
       (pf is TT3FloatingDecoy) or (pf is TT3InfraredDecoy)) then
      Continue;

    if TT3PlatformInstance(pf).Dormant then
      continue;

    if isValidToTarget(pf) then
    begin
      CrossSection := calcCrossSection(TT3PlatformInstance(pf));

      if (MissileMovement is TT3BOL_Missile) and
        not TT3BOL_Missile(MissileMovement).TargetInsideDestructArea(pf) then
          Continue;

      StrCrossSection := FloatToStr(CrossSection);
      FListCrossection.AddObject(StrCrossSection, pf);
//      FListCrossection.CustomSort(compare);
    end;
  end;

  if FListCrossection.Count > 0 then
  begin
    FListCrossection := BubbleSort(FListCrossection);

//    if Assigned(OnLogDataMissile) then
//      OnLogDataMissile(FListCrossection);

//  for i := 0 to FListCrossection.Count - 1 do
//  begin
//    if Assigned(OnLogEventStr) then
//      OnLogEventStr('TT3Missile_SS.searchTarget', LogStr);

    CrossSection := StrToFloat(FListCrossection[0]);
    pf := FListCrossection.Objects[0] as TSimObject;

    case Definition.Primary_Guide_Type of
      0,3,5:
      begin
//        CrossSection := StrToFloat(FListCrossection[FListCrossection.Count - 1]);
//        pf := FListCrossection.Objects[FListCrossection.Count - 1] as TSimObject;
        LogStr := 'Crossection ' + TT3PlatformInstance(pf).InstanceName + ' := ' + FListCrossection[FListCrossection.Count - 1];
        if CrossSection < MaxCrossSection then
        begin
          MaxCrossSection := CrossSection;
          //target := pf;
//            if target is TT3Vehicle then
//            begin
//              if (TT3Vehicle(target).VehicleDefinition.FData.Vehicle_Index =
//              TT3Vehicle(TargetObject).VehicleDefinition.FData.Vehicle_Index) and
//                (TT3Vehicle(TargetObject).Dormant = False) then
//              begin
//                target := TargetObject;
//              end
//              else
//                target := pf;
//            end
//            else
            target := pf;
//          Break;
        end;
      end;
      1,2:
      begin
//        CrossSection := StrToFloat(FListCrossection[0]);
//        pf := FListCrossection.Objects[0] as TSimObject;
//        LogStr := 'Crossection ' + TT3PlatformInstance(pf).InstanceName + ' := ' + FListCrossection[0];
        if CrossSection > MaxCrossSection then
        begin
          MaxCrossSection := CrossSection;
          //target := pf;
//            if target is TT3Vehicle then
//            begin
//              if (TT3Vehicle(target).VehicleDefinition.FData.Vehicle_Index =
//              TT3Vehicle(TargetObject).VehicleDefinition.FData.Vehicle_Index) and
//                (TT3Vehicle(TargetObject).Dormant = False) then
//              begin
//                target := TargetObject;
//              end
//              else
//                target := pf;
//            end
//            else
            target := pf;
//          Break;
        end;
      end;
      4:; //4 = Tipe Straight | Do Nothing. Straight missile tidak melakukan proses pencarian target.
    end;
    FListCrossection.Clear;
  end;

  if Assigned(target) then
  begin
   Result := target;
  end;
end;

//================================================================================

//================================================================================
{ TT3Missile_SA } //Surface to Air Missile

constructor TT3Missile_SA.create;
begin
  inherited;

  MissileMovement := TT3Straight_Missile.create;
  FisSeekTargetAlt := True;
end;

destructor TT3Missile_SA.destroy;
begin

  inherited;
end;

procedure TT3Missile_SA.Initialize;
begin
  inherited;

end;

procedure TT3Missile_SA.Move(const aDeltaMs: double);
var
  range : double;
  pf : TSimObject;
  BestTarget : TSimObject;
  MisHeight : Double;
begin
  inherited;

  FDeltaHead := 0;

  //Waiting Time to Launch
  if FisCounterDelay then
  begin
    FCounterDelay := FCounterDelay + aDeltaMs;
    if FCounterDelay < FLaunchDelay then exit
    else
    begin
      FisCounterDelay := false;
      FLaunching := true;
      Shoot;
    end;
  end;

  //Launch Missile
  if FLaunching then
  begin
    if Target <> nil then
    begin
      if CalcRange(getPositionX, getPositionY, Target.getPositionX, getPositionY) > 2 then
        isLockTarget := False;
    end;

    if FisSeekTargetAlt then
    begin
      if Target <> nil then begin
        MisHeight := TT3PlatformInstance(FTarget).getPositionZ * C_Degree_To_NauticalMile * C_NauticalMile_To_Metre;
        SetAltitude(MisHeight);
      end;

      FisSeekTargetAlt := False;
    end;

    CalcMovement(aDeltaMs);

    pf := CheckHitSomething;
    if Assigned(pf) then
    begin
      if pf is TT3Vehicle then
      begin
        if (Altitude <= TT3Vehicle(pf).VehicleDefinition.FData.Height + TT3Vehicle(pf).Altitude) and
           (Altitude >= TT3Vehicle(pf).Altitude) then
        begin
          setPositionX(TT3PlatformInstance(pf).getPositionX);
          setPositionY(TT3PlatformInstance(pf).getPositionY);

          Launched := false;
          FLaunching := false;

          if Assigned(OnHit) then
          begin
            Self.reasonDestroy := 22;
            OnHit(Self,pf,Lethality);
            exit;
          end;
        end;
      end;

      if pf is TT3Chaff then
      begin
        if TT3Chaff(pf).ChaffCategory = ecgDistraction then
        begin
          setPositionX(TT3PlatformInstance(pf).getPositionX);
          setPositionY(TT3PlatformInstance(pf).getPositionY);

          Launched := false;
          FLaunching := false;

          if Assigned(OnHit) then
          begin
            Self.reasonDestroy := 22;
            OnHit(Self,pf,Lethality);
          end;

          exit;
        end
        else if TT3Chaff(pf).ChaffCategory = ecgSeduction then
        begin
          isLockTarget := False;

          //Chaff Hancur n Missile Terus...jika Target
          //diluar seeker maka akan cari target baru

          if Assigned(OnHit) then
          begin
            Self.reasonDestroy := 22;
            OnHit(Self,pf,Lethality);
          end;
        end;
      end;
    end;

    //choco : searchTarget dilakukan di Server & Client
    if not FIsOnAcquisitionDelay then
    begin
      BestTarget := searchTarget;
      if Assigned(BestTarget) {and (FLastTarget <> TT3PlatformInstance(pf).InstanceIndex)} then
      begin

        SetTargetObject(BestTarget);
        isLockTarget := true;

      end;
    end else
    begin

      FReAcquisitionCounter := FReAcquisitionCounter + aDeltaMs;
      if FReAcquisitionCounter > GameDefaults.FData.Missile_Reacquisition_Time then
      begin
        FReAcquisitionCounter := 0.00;
        FIsOnAcquisitionDelay := false;
      end;

    end;

    FLastPosition.X := FPosition.X;
    FLastPosition.Y := FPosition.Y;
    FLastPosition.Z := FPosition.Z;

    // cek max range, jika > max range maka destroy
    range := CalcRange(FHomePositionX, FHomePositionY,FPosition.X, FPosition.Y) ;
    {$IFDEF SERVER}
    if range > FMaxRange then
    begin
      Launched := false;
      FLaunching := false;

      if Assigned(OnOut) then
        OnOut(Self,3);
    end;
    {$ENDIF}

    //cek range untuk edit simbol missile
    if (not(isInstructor) and (range > 12) and (not(isWasdal))) then    //mk
    begin
      UnitGroup := False;
      Visible := False;
//      Planned := False; | choco : planned g perlu di false. karena planned masih dibutuhkan untuk gambar
//      destrunction area pada BOL, target ring pada RBL
    end;
  end;
end;

function TT3Missile_SA.searchTarget: TSimObject;
var
  i : integer;
  pf, target : TSimObject;
  CrossSection, MaxCrossSection : Double;
  StrCrossSection : string;
begin
  Result := nil;

  if not HaveSeeker then
    Exit;

  if SeekerOn then
  begin
    if not FSeekAltitudeOnce then
    begin
       //SetAltitude(FDefaultSeekAltitude * C_Feet_To_Meter);
       FSeekAltitudeOnce := true;
    end;
  end
  else
    Exit;

  case Definition.Primary_Guide_Type of
    0,3,4,5 : MaxCrossSection := 999999;
    1,2     : MaxCrossSection := -999999;
  else
    MaxCrossSection := 0;
  end;

  target := nil;
  i := 0;

  while (i < TargetPlatforms.itemCount) do
  begin
    pf := TargetPlatforms.getObject(i);
    inc(i);

    if pf = Owner then continue;
    if pf = Self then continue;
    if not ((pf is TT3Vehicle) or (pf is TT3Chaff) or (pf is TT3Missile_AS)) then continue;
    if TT3PlatformInstance(pf).Dormant then continue;

    if isValidToTarget(pf) then
    begin
      CrossSection := calcCrossSection(TT3PlatformInstance(pf));

      StrCrossSection := FloatToStr(CrossSection);
      FListCrossection.AddObject(StrCrossSection, pf);
    end;
  end;

  if FListCrossection.Count > 0 then
  begin
    FListCrossection := BubbleSort(FListCrossection);

    CrossSection := StrToFloat(FListCrossection[0]);
    pf := FListCrossection.Objects[0] as TSimObject;

    case Definition.Primary_Guide_Type of
      0,3,5:
      begin
//        CrossSection := StrToFloat(FListCrossection[FListCrossection.Count - 1]);
//        pf := FListCrossection.Objects[FListCrossection.Count - 1] as TSimObject;
        if CrossSection < MaxCrossSection then
        begin
          MaxCrossSection := CrossSection;
          //target := pf;
//            if target is TT3Vehicle then
//            begin
//              if (TT3Vehicle(target).VehicleDefinition.FData.Vehicle_Index =
//              TT3Vehicle(TargetObject).VehicleDefinition.FData.Vehicle_Index) and
//                (TT3Vehicle(TargetObject).Dormant = False) then
//              begin
//                target := TargetObject;
//              end
//              else
//                target := pf;
//            end
//            else
            target := pf;
        end;
      end;
      1,2:
      begin
//        CrossSection := StrToFloat(FListCrossection[0]);
//        pf := FListCrossection.Objects[0] as TSimObject;
        if CrossSection > MaxCrossSection then
        begin
          MaxCrossSection := CrossSection;
          //target := pf;
//            if target is TT3Vehicle then
//            begin
//              if (TT3Vehicle(target).VehicleDefinition.FData.Vehicle_Index =
//              TT3Vehicle(TargetObject).VehicleDefinition.FData.Vehicle_Index) and
//                (TT3Vehicle(TargetObject).Dormant = False) then
//              begin
//                target := TargetObject;
//              end
//              else
//                target := pf;
//            end
//            else
            target := pf;
        end;
      end;
      4:; //4 = Tipe Straight | Do Nothing. Straight missile tidak melakukan proses pencarian target.
    end;
    FListCrossection.Clear;
  end;

  if Assigned(target) then
  begin
   Result := target;
  end;
end;

procedure TT3Missile_SA.Shoot;
var
  hRange,hBearing,hTime,hSpeed : double;
  mx,my : double;
begin
  if not Assigned(TargetObject) then Exit;

  FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y,FPosition.X, FPosition.Y);
  FTargetBearing := Calcbearing(FPosition.X, FPosition.Y, FTargetPosition.X,FTargetPosition.Y);
  FTargetCourse  := TT3PlatformInstance(TargetObject).Course;
  FTargetSpeed  := TT3PlatformInstance(TargetObject).Speed;

  CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                             hRange,hBearing,hTime,hSpeed);

  RangeBearingToCoord(hRange,hBearing,mx,my);
  FTargetPosition.X := FPosition.X + mx;
  FTargetPosition.Y := FPosition.Y + my;
  FTargetPosition.Z := TT3PlatformInstance(TargetObject).getPositionZ;

  Course            := hBearing;
  FTargetBearing    := hBearing;
  FTargetRange      := hRange;

  //defHeight := 10;

  FMover.MaxSpeed       := UnitMotion.FData.Max_Ground_Speed;
  FMover.Acceleration   := UnitMotion.FData.Acceleration;

  SetOrderedHeading(FTargetBearing);

  FLastPosition.X := FPosition.X;
  FLastPosition.Y := FPosition.Y;
  FLastPosition.Z := FPosition.Z;
end;

function TT3Missile_SA.GetSnapshotData : _SS_TT3Missile_SA;
var
   ss : _SS_TT3Missile_SA ;
begin
   ss.M := TT3Missile(Self).GetSnapshotData ;
   Result := ss ;
end;

procedure TT3Missile_SA.SetSnapshotData (const ss : _SS_TT3Missile_SA);
begin
 TT3Missile(Self).SetSnapshotData(ss.M) ;
end;

//================================================================================

//================================================================================
{ TT3Missile_AA } //Air to Air Missile

constructor TT3Missile_AA.create;
begin
  inherited;
end;

destructor TT3Missile_AA.destroy;
begin

  inherited;
end;

procedure TT3Missile_AA.Initialize;
begin
  inherited;

end;

procedure TT3Missile_AA.Move(const aDeltaMs: double);
var
  range : double;
  pf : TSimObject;
  BestTarget : TSimObject;
begin
  inherited;
  FDeltaHead := 0;

  //Waiting Time to Launch
  if FisCounterDelay then
  begin
    FCounterDelay := FCounterDelay + aDeltaMs;
    if FCounterDelay < FLaunchDelay then exit
    else
    begin
      FisCounterDelay := false;
      FLaunching := true;
      Shoot;
    end;
  end;

  //Launch Missile
  if FLaunching then
  begin
    if Target <> nil then
    begin
      if CalcRange(getPositionX, getPositionY, Target.getPositionX, getPositionY) > 2 then
        isLockTarget := False;
    end;

    CalcMovement(aDeltaMs);

    pf := CheckHitSomething;
    if Assigned(pf) then
    begin
      if pf is TT3Vehicle then
      begin
        if (Altitude <= TT3Vehicle(pf).VehicleDefinition.FData.Height + TT3Vehicle(pf).Altitude) and
           (Altitude >= TT3Vehicle(pf).Altitude) then
        begin
          setPositionX(TT3PlatformInstance(pf).getPositionX);
          setPositionY(TT3PlatformInstance(pf).getPositionY);

          Launched := false;
          FLaunching := false;

          if Assigned(OnHit) then
          begin
            Self.reasonDestroy := 22;
            OnHit(Self,pf,Lethality);
            exit;
          end;
        end;
      end;

      if pf is TT3Chaff then
      begin
        if TT3Chaff(pf).ChaffCategory = ecgDistraction then
        begin
          setPositionX(TT3PlatformInstance(pf).getPositionX);
          setPositionY(TT3PlatformInstance(pf).getPositionY);

          Launched := false;
          FLaunching := false;

          if Assigned(OnHit) then
          begin
            Self.reasonDestroy := 22;
            OnHit(Self,pf,Lethality);
          end;

          exit;
        end
        else if TT3Chaff(pf).ChaffCategory = ecgSeduction then
        begin
          isLockTarget := False;

          //Chaff Hancur n Missile Terus...jika Target
          //diluar seeker maka akan cari target baru

          if Assigned(OnHit) then
          begin
            Self.reasonDestroy := 22;
            OnHit(Self,pf,Lethality);
          end;
        end;
      end;
    end;

    if not FIsOnAcquisitionDelay then
    begin

      //choco : searchTarget dilakukan di Server & Client
      BestTarget := searchTarget;
      if Assigned(BestTarget) {and (FLastTarget <> TT3PlatformInstance(pf).InstanceIndex)} then
      begin
        SetTargetObject(BestTarget);
        isLockTarget := true;
      end;
    end else
    begin

      FReAcquisitionCounter := FReAcquisitionCounter + aDeltaMs;
      if FReAcquisitionCounter > GameDefaults.FData.Missile_Reacquisition_Time then
      begin
        FReAcquisitionCounter := 0.00;
        FIsOnAcquisitionDelay := false;
      end;

    end;

    FLastPosition.X := FPosition.X;
    FLastPosition.Y := FPosition.Y;
    FLastPosition.Z := FPosition.Z;

    // cek max range, jika > max range maka destroy
    range := CalcRange(FHomePositionX, FHomePositionY,FPosition.X, FPosition.Y) ;
    {$IFDEF SERVER}
    if range > FMaxRange then
    begin
      Launched := false;
      FLaunching := false;

      if Assigned(OnOut) then
        OnOut(Self,3);
    end;
    {$ENDIF}

    //cek range untuk edit simbol missile
    if (not(isInstructor) and (range > 12) and (not(isWasdal))) then    //mk
    begin
      UnitGroup := False;
      Visible := False;
//      Planned := False; | choco : planned g perlu di false. karena planned masih dibutuhkan untuk gambar
//      destrunction area pada BOL, target ring pada RBL
    end;
  end;
end;

function TT3Missile_AA.searchTarget: TSimObject;
var
  i : integer;
  pf, target : TSimObject;
  CrossSection, MaxCrossSection : Double;
  StrCrossSection : string;
begin
  Result := nil;
  if not HaveSeeker then Exit;

  if SeekerOn then
  begin
    if not FSeekAltitudeOnce then
    begin
      if FTerminal_Altitude_Required then
      begin
        SetAltitude(FDefaultSeekAltitude * C_Feet_To_Meter);
        FSeekAltitudeOnce := true;
      end
      else
        FSeekAltitudeOnce := true;
    end;
  end
  else
    Exit;

  case Definition.Primary_Guide_Type of
    0,3,4,5 : MaxCrossSection := 999999;
    1,2     : MaxCrossSection := -999999;
  else
    MaxCrossSection := 0;
  end;

  i := 0;
  target      := nil;

  while (i < TargetPlatforms.itemCount) do
  begin
    pf := TargetPlatforms.getObject(i);
    inc(i);

    if pf = Owner then continue;
    if pf = Self then continue;


    if not ((pf is TT3Vehicle) or (pf is TT3Chaff)) then continue;
    if TT3PlatformInstance(pf).Dormant then continue;

    if isValidToTarget(pf) then
    begin
      CrossSection := calcCrossSection(TT3PlatformInstance(pf));

      StrCrossSection := FloatToStr(CrossSection);
      FListCrossection.AddObject(StrCrossSection, pf);

//      case Definition.Primary_Guide_Type of
//        0,3,5:
//        begin
//          if CrossSection < MaxCrossSection then
//          begin
//            MaxCrossSection := CrossSection;
//            //target := pf;
////            if target is TT3Vehicle then
////            begin
////              if (TT3Vehicle(target).VehicleDefinition.FData.Vehicle_Index =
////              TT3Vehicle(TargetObject).VehicleDefinition.FData.Vehicle_Index) and
////                (TT3Vehicle(TargetObject).Dormant = False) then
////              begin
////                target := TargetObject;
////              end
////              else
////                target := pf;
////            end
////            else
//              target := pf;
//          end;
//        end;
//        1,2:
//        begin
//          if CrossSection > MaxCrossSection then
//          begin
//            MaxCrossSection := CrossSection;
//            //target := pf;
////            if target is TT3Vehicle then
////            begin
////              if (TT3Vehicle(target).VehicleDefinition.FData.Vehicle_Index =
////              TT3Vehicle(TargetObject).VehicleDefinition.FData.Vehicle_Index) and
////                (TT3Vehicle(TargetObject).Dormant = False) then
////              begin
////                target := TargetObject;
////              end
////              else
////                target := pf;
////            end
////            else
//              target := pf;
//          end;
//        end;
//        4:; //4 = Tipe Straight | Do Nothing. Straight missile tidak melakukan proses pencarian target.
//      end;
    end;
  end;

  if FListCrossection.Count > 0 then
  begin
    FListCrossection := BubbleSort(FListCrossection);

//    if Assigned(OnLogDataMissile) then
//      OnLogDataMissile(FListCrossection);

//  for i := 0 to FListCrossection.Count - 1 do
//  begin
//    if Assigned(OnLogEventStr) then
//      OnLogEventStr('TT3Missile_SS.searchTarget', LogStr);
    CrossSection := StrToFloat(FListCrossection[0]);
    pf := FListCrossection.Objects[0] as TSimObject;

    case Definition.Primary_Guide_Type of
      0,3,5:
      begin
//        CrossSection := StrToFloat(FListCrossection[FListCrossection.Count - 1]);
//        pf := FListCrossection.Objects[FListCrossection.Count - 1] as TSimObject;
        if CrossSection < MaxCrossSection then
        begin
          MaxCrossSection := CrossSection;
          //target := pf;
//            if target is TT3Vehicle then
//            begin
//              if (TT3Vehicle(target).VehicleDefinition.FData.Vehicle_Index =
//              TT3Vehicle(TargetObject).VehicleDefinition.FData.Vehicle_Index) and
//                (TT3Vehicle(TargetObject).Dormant = False) then
//              begin
//                target := TargetObject;
//              end
//              else
//                target := pf;
//            end
//            else
            target := pf;
        end;
      end;
      1,2:
      begin
        if CrossSection > MaxCrossSection then
        begin
          MaxCrossSection := CrossSection;
          //target := pf;
//            if target is TT3Vehicle then
//            begin
//              if (TT3Vehicle(target).VehicleDefinition.FData.Vehicle_Index =
//              TT3Vehicle(TargetObject).VehicleDefinition.FData.Vehicle_Index) and
//                (TT3Vehicle(TargetObject).Dormant = False) then
//              begin
//                target := TargetObject;
//              end
//              else
//                target := pf;
//            end
//            else
            target := pf;
        end;
      end;
      4:; //4 = Tipe Straight | Do Nothing. Straight missile tidak melakukan proses pencarian target.
    end;
    FListCrossection.Clear;
  end;

  if Assigned(target) then
  begin
    Result := target;
  end;
end;

procedure TT3Missile_AA.SetMovement(Mode: TMissileFiringMode);
begin
  case Mode of
    mfmDirect:
    begin
      MissileMovement := TT3Straight_Missile.create;
    end;
    mfmAimpoint :
    begin
      MissileMovement := TT3Aimpoint_Missile.create;
    end;
    mfmBearing :
    begin
      MissileMovement := TT3BearingOnly_Missile.create;
    end;
  end;
end;

procedure TT3Missile_AA.Shoot;
var
  hRange,hBearing,hTime,hSpeed : double;
  mx,my : double;

  //defHeight : Double;
begin
  if MissileMovement is TT3Straight_Missile then
  begin
    if not Assigned(TargetObject) then Exit;

    FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y,FPosition.X, FPosition.Y);
    FTargetBearing := Calcbearing(FPosition.X, FPosition.Y, FTargetPosition.X,FTargetPosition.Y);
    FTargetCourse  := TT3PlatformInstance(TargetObject).Course;
    FTargetSpeed  := TT3PlatformInstance(TargetObject).Speed;

    CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                               hRange,hBearing,hTime,hSpeed);

    RangeBearingToCoord(hRange,hBearing,mx,my);
    FTargetPosition.X := FPosition.X + mx;
    FTargetPosition.Y := FPosition.Y + my;
    FTargetPosition.Z := TT3PlatformInstance(TargetObject).getPositionZ;

    FTargetBearing    := hBearing;
    FTargetRange      := hRange;
  end
  else
  if MissileMovement is TT3Aimpoint_Missile then
  begin
    FTargetPosition.X := TT3Aimpoint_Missile(MissileMovement).PositionX;
    FTargetPosition.Y := TT3Aimpoint_Missile(MissileMovement).PositionY;
    FTargetPosition.Z := TT3PlatformInstance(Owner).getPositionZ;
  end
  else
  if MissileMovement is TT3BearingOnly_Missile then
  begin
    RangeBearingToCoord(100,TT3BearingOnly_Missile(MissileMovement).BearingLaunch,mx,my);
    FTargetBearing := TT3BearingOnly_Missile(MissileMovement).BearingLaunch;

    FTargetPosition.X := FPosition.X + mx;
    FTargetPosition.Y := FPosition.Y + my;
    FTargetPosition.Z := TT3PlatformInstance(Owner).getPositionZ;
  end;

  //defHeight := 10;

  FMover.MaxSpeed       := UnitMotion.FData.Max_Ground_Speed;
  FMover.Acceleration   := UnitMotion.FData.Acceleration;

  SetOrderedHeading(FTargetBearing);

  FLastPosition.X := FPosition.X;
  FLastPosition.Y := FPosition.Y;
  FLastPosition.Z := FPosition.Z;
end;

function TT3Missile_AA.GetSnapshotData : _SS_TT3Missile_AA;
var
   ss : _SS_TT3Missile_AA ;
begin
   ss.M := TT3Missile(Self).GetSnapshotData ;
   Result := ss ;
end;

procedure TT3Missile_AA.SetSnapshotData (const ss : _SS_TT3Missile_AA);
begin
 TT3Missile(Self).SetSnapshotData(ss.M) ;
end;

//================================================================================

//================================================================================
{ TT3Missile_AS } //Air to Surface Missile

constructor TT3Missile_AS.create;
begin
  inherited;
end;

destructor TT3Missile_AS.destroy;
begin

  inherited;
end;

procedure TT3Missile_AS.Initialize;
begin
  inherited;

end;

procedure TT3Missile_AS.Move(const aDeltaMs: double);
var
  range : double;
  pf : TSimObject;
  BestTarget : TSimObject;
begin
  inherited;
  FDeltaHead := 0;

  //Waiting Time to Launch
  if FisCounterDelay then
  begin
    FCounterDelay := FCounterDelay + aDeltaMs;
    if FCounterDelay < FLaunchDelay then exit
    else
    begin
      FisCounterDelay := false;
      FLaunching := true;
      Shoot;
    end;
  end;

  //Launch Missile
  if FLaunching then
  begin
    if Target <> nil then
    begin
      if CalcRange(getPositionX, getPositionY, Target.getPositionX, getPositionY) > 2 then
        isLockTarget := False;
    end;

    CalcMovement(aDeltaMs);

    pf := CheckHitSomething;
    if Assigned(pf) then
    begin
      if pf is TT3Vehicle then
      begin
        if (Altitude <= TT3Vehicle(pf).VehicleDefinition.FData.Height + TT3Vehicle(pf).Altitude) and
           (Altitude >= TT3Vehicle(pf).Altitude) then
        begin
          setPositionX(TT3PlatformInstance(pf).getPositionX);
          setPositionY(TT3PlatformInstance(pf).getPositionY);

          Launched := false;
          FLaunching := false;

          if Assigned(OnHit) then
          begin
            Self.reasonDestroy := 22;
            OnHit(Self,pf,Lethality);
            exit;
          end;
        end;
      end;

      if pf is TT3Chaff then
      begin
        if TT3Chaff(pf).ChaffCategory = ecgDistraction then
        begin
          setPositionX(TT3PlatformInstance(pf).getPositionX);
          setPositionY(TT3PlatformInstance(pf).getPositionY);

          Launched := false;
          FLaunching := false;

          if Assigned(OnHit) then
          begin
            Self.reasonDestroy := 22;
            OnHit(Self,pf,Lethality);
          end;

          exit;
        end
        else if TT3Chaff(pf).ChaffCategory = ecgSeduction then
        begin
          isLockTarget := False;

          //Chaff Hancur n Missile Terus...jika Target
          //diluar seeker maka akan cari target baru

          if Assigned(OnHit) then
          begin
            Self.reasonDestroy := 22;
            OnHit(Self,pf,Lethality);
          end;
        end;
      end;
    end;

    //choco : searchTarget dilakukan di Server & Client
    if not FIsOnAcquisitionDelay then
    begin

      BestTarget := searchTarget;
      if Assigned(BestTarget) {and (FLastTarget <> TT3PlatformInstance(pf).InstanceIndex)} then
      begin
        SetTargetObject(BestTarget);
        isLockTarget := true;
      end;

    end else
    begin

      FReAcquisitionCounter := FReAcquisitionCounter + aDeltaMs;
      if FReAcquisitionCounter > GameDefaults.FData.Missile_Reacquisition_Time then
      begin
        FReAcquisitionCounter := 0.00;
        FIsOnAcquisitionDelay := false;
      end;

    end;

    FLastPosition.X := FPosition.X;
    FLastPosition.Y := FPosition.Y;
    FLastPosition.Z := FPosition.Z;

    // cek max range, jika > max range maka destroy
    range := CalcRange(FHomePositionX, FHomePositionY,FPosition.X, FPosition.Y) ;
    {$IFDEF SERVER}
    if range > FMaxRange then
    begin
      Launched := false;
      FLaunching := false;

      if Assigned(OnOut) then
        OnOut(Self,3);
    end;
    {$ENDIF}

    //cek range untuk edit simbol missile
    if (not(isInstructor) and (range > 12) and (not(isWasdal))) then    //mk
    begin
      UnitGroup := False;
      Visible := False;
//      Planned := False; | choco : planned g perlu di false. karena planned masih dibutuhkan untuk gambar
//      destrunction area pada BOL, target ring pada RBL
    end;
  end;
end;

function TT3Missile_AS.searchTarget: TSimObject;
var
  i : integer;
  pf, target : TSimObject;
  CrossSection, MaxCrossSection : Double;
  StrCrossSection : string;
begin
  Result := nil;

  if not HaveSeeker then Exit;

  if SeekerOn then
  begin
    if not FSeekAltitudeOnce then
    begin
       SetAltitude(FDefaultSeekAltitude * C_Feet_To_Meter);
       FSeekAltitudeOnce := true;
    end;
  end
  else
    Exit;

  case Definition.Primary_Guide_Type of
    0,3,4,5 : MaxCrossSection := 999999;
    1,2     : MaxCrossSection := -999999;
  else
    MaxCrossSection := 0;
  end;

  i := 0;
  target      := nil;

  while (i < TargetPlatforms.itemCount) do
  begin
    pf := TargetPlatforms.getObject(i);
    inc(i);

    if pf = Owner then continue;
    if pf = Self then continue;

    if not ((pf is TT3Vehicle) or (pf is TT3Chaff)) then continue;
    if TT3PlatformInstance(pf).Dormant then continue;

    if isValidToTarget(pf) then
    begin
      CrossSection := calcCrossSection(TT3PlatformInstance(pf));

      StrCrossSection := FloatToStr(CrossSection);
      FListCrossection.AddObject(StrCrossSection, pf);
    end;
  end;

  if FListCrossection.Count > 0 then
  begin
    FListCrossection := BubbleSort(FListCrossection);

//    if Assigned(OnLogDataMissile) then
//      OnLogDataMissile(FListCrossection);

//  for i := 0 to FListCrossection.Count - 1 do
//  begin
//    if Assigned(OnLogEventStr) then
//      OnLogEventStr('TT3Missile_SS.searchTarget', LogStr);

    CrossSection := StrToFloat(FListCrossection[0]);
    pf := FListCrossection.Objects[0] as TSimObject;

    case Definition.Primary_Guide_Type of
      0,3,5:
      begin
//        CrossSection := StrToFloat(FListCrossection[FListCrossection.Count - 1]);
//        pf := FListCrossection.Objects[FListCrossection.Count - 1] as TSimObject;
        if CrossSection < MaxCrossSection then
        begin
          MaxCrossSection := CrossSection;
          //target := pf;
//            if target is TT3Vehicle then
//            begin
//              if (TT3Vehicle(target).VehicleDefinition.FData.Vehicle_Index =
//              TT3Vehicle(TargetObject).VehicleDefinition.FData.Vehicle_Index) and
//                (TT3Vehicle(TargetObject).Dormant = False) then
//              begin
//                target := TargetObject;
//              end
//              else
//                target := pf;
//            end
//            else
            target := pf;
        end;
      end;
      1,2:
      begin
//        CrossSection := StrToFloat(FListCrossection[0]);
//        pf := FListCrossection.Objects[0] as TSimObject;
        if CrossSection > MaxCrossSection then
        begin
          MaxCrossSection := CrossSection;
          //target := pf;
//            if target is TT3Vehicle then
//            begin
//              if (TT3Vehicle(target).VehicleDefinition.FData.Vehicle_Index =
//              TT3Vehicle(TargetObject).VehicleDefinition.FData.Vehicle_Index) and
//                (TT3Vehicle(TargetObject).Dormant = False) then
//              begin
//                target := TargetObject;
//              end
//              else
//                target := pf;
//            end
//            else
            target := pf;
        end;
      end;
      4:; //4 = Tipe Straight | Do Nothing. Straight missile tidak melakukan proses pencarian target.
    end;
    FListCrossection.Clear;
  end;

  if Assigned(target) then
  begin
    Result := target;
  end;
end;

procedure TT3Missile_AS.SetMovement(Mode: TMissileFiringMode);
begin
  case Mode of
    mfmDirect:
    begin
      MissileMovement := TT3Straight_Missile.create;
    end;
    mfmAimpoint :
    begin
      MissileMovement := TT3Aimpoint_Missile.create;
    end;
    mfmBearing :
    begin
      MissileMovement := TT3BearingOnly_Missile.create;
    end;
  end;
end;

procedure TT3Missile_AS.Shoot;
var
  hRange,hBearing,hTime,hSpeed : double;
  mx,my : double;
  //defHeight : Double;
begin
  if MissileMovement is TT3Straight_Missile then
  begin
    if not Assigned(TargetObject) then Exit;

    FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y,FPosition.X, FPosition.Y);
    FTargetBearing := Calcbearing(FPosition.X, FPosition.Y, FTargetPosition.X,FTargetPosition.Y);
    FTargetCourse  := TT3PlatformInstance(TargetObject).Course;
    FTargetSpeed  := TT3PlatformInstance(TargetObject).Speed;

    CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                               hRange,hBearing,hTime,hSpeed);

    RangeBearingToCoord(hRange,hBearing,mx,my);
    FTargetPosition.X := FPosition.X + mx;
    FTargetPosition.Y := FPosition.Y + my;
    FTargetPosition.Z := TT3PlatformInstance(TargetObject).getPositionZ;

    FTargetBearing    := hBearing;
    FTargetRange      := hRange;
  end
  else
  if MissileMovement is TT3Aimpoint_Missile then
  begin
    FTargetPosition.X := TT3Aimpoint_Missile(MissileMovement).PositionX;
    FTargetPosition.Y := TT3Aimpoint_Missile(MissileMovement).PositionY;
    FTargetPosition.Z := TT3PlatformInstance(Owner).getPositionZ;
  end
  else
  if MissileMovement is TT3BearingOnly_Missile then
  begin
    RangeBearingToCoord(100,TT3BearingOnly_Missile(MissileMovement).BearingLaunch,mx,my);
    FTargetBearing := TT3BearingOnly_Missile(MissileMovement).BearingLaunch;

    FTargetPosition.X := FPosition.X + mx;
    FTargetPosition.Y := FPosition.Y + my;

    if Assigned(Owner) then
      FTargetPosition.Z := TT3PlatformInstance(Owner).getPositionZ
    else
      FTargetPosition.Z := FPosition.Z;
  end;

  //defHeight := 10;

  FMover.MaxSpeed       := UnitMotion.FData.Max_Ground_Speed;
  FMover.Acceleration   := UnitMotion.FData.Acceleration;

  SetOrderedHeading(FTargetBearing);

  FLastPosition.X := FPosition.X;
  FLastPosition.Y := FPosition.Y;
  FLastPosition.Z := FPosition.Z;
end;

function TT3Missile_AS.GetSnapshotData : _SS_TT3Missile_AS;
var
   ss : _SS_TT3Missile_AS ;
begin
   ss.M := TT3Missile(Self).GetSnapshotData ;
   Result := ss ;
end;

procedure TT3Missile_AS.SetSnapshotData (const ss : _SS_TT3Missile_AS);
begin
 TT3Missile(Self).SetSnapshotData(ss.M) ;
end;

//================================================================================

//================================================================================
{ TT3Missile_LA } //Land Attack Missile

constructor TT3Missile_LA.create;
begin
  inherited;
end;

destructor TT3Missile_LA.destroy;
begin

  inherited;
end;

procedure TT3Missile_LA.Initialize;
begin
  inherited;

end;

procedure TT3Missile_LA.Move(const aDeltaMs: double);
var
  range : double;
  {$IFDEF SERVER}
  pf : TSimObject;
  {$ENDIF}
begin
  inherited;
  FDeltaHead := 0;

  //Waiting Time to Launch
  if FisCounterDelay then
  begin
    FCounterDelay := FCounterDelay + aDeltaMs;
    if FCounterDelay < FLaunchDelay then exit
    else
    begin
      FisCounterDelay := false;
      FLaunching := true;
      Shoot;
    end;
  end;

  //Launch Missile
  if FLaunching then
  begin
    if Target <> nil then
    begin
      if CalcRange(getPositionX, getPositionY, Target.getPositionX, getPositionY) > 2 then
        isLockTarget := False;
    end;

    CalcMovement(aDeltaMs);

    {$IFDEF SERVER}
    if not FIsOnAcquisitionDelay then
    begin
      pf := searchTarget;
      if Assigned(pf) then
      begin
        if pf is TT3Vehicle then
        begin
          Launched := false;
          FLaunching := false; //mk07062012
          //FreeMe := true;

          if Assigned(OnHit) then
          begin
            OnHit(Self,pf,Lethality);
          end;
          exit;
        end;

        if pf is TT3Chaff then
        begin
          if TT3Chaff(pf).ChaffCategory = ecgDistraction then
          begin
            //Missile n Chaff Hancur
            Launched := false;
            FLaunching := false; //mk07062012
            //FreeMe := true;

            if Assigned(OnHit) then
            begin
              OnHit(Self,pf,Lethality);
            end;

            exit;
          end
          else
          if TT3Chaff(pf).ChaffCategory = ecgSeduction then
          begin
            isLockTarget := False;
            //Chaff Hancur n Missile Terus...jika Target
            //diluar seeker maka akan cari target baru

            if Assigned(OnHit) then
            begin
              OnHit(Self,pf,Lethality);
            end;
          end;
        end;
      end;
    end else
    begin

      FReAcquisitionCounter := FReAcquisitionCounter + aDeltaMs;
      if FReAcquisitionCounter > GameDefaults.FData.Missile_Reacquisition_Time then
      begin
        FReAcquisitionCounter := 0.00;
        FIsOnAcquisitionDelay := false;
      end;

    end;
    {$ENDIF}

    FLastPosition.X := FPosition.X;
    FLastPosition.Y := FPosition.Y;
    FLastPosition.Z := FPosition.Z;

    // cek max range, jika > max range maka destroy
    range := CalcRange(FHomePositionX, FHomePositionY,FPosition.X, FPosition.Y) ;
    {$IFDEF SERVER}
    if range > FMaxRange then
    begin
      Launched := false;
      FLaunching := false;

      if Assigned(OnOut) then
        OnOut(Self,3);
    end;
    {$ENDIF}

    //cek range untuk edit simbol missile
    if (not(isInstructor) and (range > 12) and (not(isWasdal))) then    //mk
    begin
      UnitGroup := False;
      Visible := False;
//      Planned := False; | choco : planned g perlu di false. karena planned masih dibutuhkan untuk gambar
//      destrunction area pada BOL, target ring pada RBL
    end;
  end;
end;

{$IFDEF SERVER}
function TT3Missile_LA.searchTarget: TSimObject;
var
  i : integer;
  pf, target : TSimObject;

  isHit : boolean;
  frPt, toPt, mPt : t2DPoint;
begin
  Result := nil;
  if not HaveSeeker then Exit;

  i := 0;
  isHit  := false;

  target      := nil;
  result      := nil;

  if SeekerOn then
  begin
    if not FSeekAltitudeOnce then
    begin
       SetAltitude(FDefaultSeekAltitude * C_Feet_To_Meter);
       FSeekAltitudeOnce := true;
    end;
  end;

  while (i < TargetPlatforms.itemCount) do
  begin
    pf := TargetPlatforms.getObject(i);
    inc(i);

    if pf = Owner then continue;
    if pf = Self then continue;
    if not ((pf is TT3Vehicle) or (pf is TT3Chaff)) then continue;
    if TT3PlatformInstance(pf).Dormant then continue;

    // Hit Something
    if IsInsideCircle(FPosition.X,FPosition.Y,TT3PlatformInstance(pf).getPositionX,
       TT3PlatformInstance(pf).getPositionY,50, FPosition.Z, TT3PlatformInstance(pf).getPositionZ, 1) then
    begin
      if pf is TT3Vehicle then
        isHit := true;

      if pf is TT3Chaff then
        if TT3Chaff(pf).ChaffCategory = ecgDistraction then
          isHit := true;

      if isHit then begin
        result := pf;
        setPositionX(TT3PlatformInstance(pf).getPositionX);
        setPositionY(TT3PlatformInstance(pf).getPositionY);
        exit;
      end;
    end;

    // Fast forward check.
    frPt.X := FLastPosition.X;
    frPt.Y := FLastPosition.Y;
    toPt.X := FPosition.X;
    toPt.Y := FPosition.Y;
    mPt.X  := TT3PlatformInstance(pf).getPositionX;
    mPt.Y  := TT3PlatformInstance(pf).getPositionY;
    if (CalcRange(FLastPosition.X,FLastPosition.Y,FPosition.X,FPosition.Y) > 0) and
       ptBetween2Point(mPt,frPt,toPt,50) then
    begin
       result := pf;
       setPositionX(TT3PlatformInstance(pf).getPositionX);
       setPositionY(TT3PlatformInstance(pf).getPositionY);
       exit;
    end;

    //Search Target Seeker
    if not SeekerOn then continue;

    if isLockTarget then Continue;

    if MissileMovement is TT3Straight_Missile then
      Target := TT3Straight_Missile(MissileMovement).ValidateObject(Self, pf)
    else
    if MissileMovement is TT3Aimpoint_Missile then
      Target := TT3Aimpoint_Missile(MissileMovement).ValidateObject(Self, pf)
    else
    if MissileMovement is TT3BearingOnly_Missile then
      Target := TT3BearingOnly_Missile(MissileMovement).ValidateObject(Self, pf);

    if Assigned(target) then
    begin
      SetTargetObject(target);
      isLockTarget := True;
    end
    else
      FTargetObject := nil;
  end;
end;
{$ENDIF}

procedure TT3Missile_LA.SetMovement(Mode: TMissileFiringMode);
begin
  case Mode of
    mfmDirect:
    begin
      MissileMovement := TT3Straight_Missile.create;
    end;
    mfmAimpoint :
    begin
      MissileMovement := TT3Aimpoint_Missile.create;
    end;
    mfmBearing :
    begin
      MissileMovement := TT3BearingOnly_Missile.create;
    end;
  end;
end;

procedure TT3Missile_LA.Shoot;
var
  hRange,hBearing,hTime,hSpeed : double;
  mx,my : double;
  //defHeight : Double;
begin
  if MissileMovement is TT3Straight_Missile then
  begin
    if not Assigned(TargetObject) then Exit;

    FTargetRange   := CalcRange(FTargetPosition.X,FTargetPosition.Y,FPosition.X, FPosition.Y);
    FTargetBearing := Calcbearing(FPosition.X, FPosition.Y, FTargetPosition.X,FTargetPosition.Y);
    FTargetCourse  := TT3PlatformInstance(TargetObject).Course;
    FTargetSpeed  := TT3PlatformInstance(TargetObject).Speed;

    CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,UnitMotion.FData.High_Ground_Speed,
                               hRange,hBearing,hTime,hSpeed);

    RangeBearingToCoord(hRange,hBearing,mx,my);
    FTargetPosition.X := FPosition.X + mx;
    FTargetPosition.Y := FPosition.Y + my;
    FTargetPosition.Z := TT3PlatformInstance(TargetObject).getPositionZ;

    FTargetBearing    := hBearing;
    FTargetRange      := hRange;
  end
  else
  if MissileMovement is TT3Aimpoint_Missile then
  begin
    FTargetPosition.X := TT3Aimpoint_Missile(MissileMovement).PositionX;
    FTargetPosition.Y := TT3Aimpoint_Missile(MissileMovement).PositionY;
    FTargetPosition.Z := TT3PlatformInstance(Owner).getPositionZ;
  end
  else
  if MissileMovement is TT3BearingOnly_Missile then
  begin
    RangeBearingToCoord(100,TT3BearingOnly_Missile(MissileMovement).BearingLaunch,mx,my);
    FTargetBearing := TT3BearingOnly_Missile(MissileMovement).BearingLaunch;

    FTargetPosition.X := FPosition.X + mx;
    FTargetPosition.Y := FPosition.Y + my;
    FTargetPosition.Z := TT3PlatformInstance(Owner).getPositionZ;
  end;

  //defHeight := 10;

  FMover.MaxSpeed       := UnitMotion.FData.Max_Ground_Speed;
  FMover.Acceleration   := UnitMotion.FData.Acceleration;

  SetOrderedHeading(FTargetBearing);

  FLastPosition.X := FPosition.X;
  FLastPosition.Y := FPosition.Y;
  FLastPosition.Z := FPosition.Z;
end;

function TT3Missile_LA.GetSnapshotData : _SS_TT3Missile_LA;
var
   ss : _SS_TT3Missile_LA ;
begin
   ss.M := TT3Missile(Self).GetSnapshotData ;
   Result := ss ;
end;

procedure TT3Missile_LA.SetSnapshotData (const ss : _SS_TT3Missile_LA);
begin
 TT3Missile(Self).SetSnapshotData(ss.M) ;
end;

//================================================================================

//================================================================================
{ TT3Missile_TM } //Tactical Missile

constructor TT3Missile_TM.create;
begin
  inherited;

  MissileMovement := TT3Straight_Missile.create;
end;

destructor TT3Missile_TM.destroy;
begin

  inherited;
end;

procedure TT3Missile_TM.Draw(aCnv: tCanvas);
begin
  inherited;

end;

procedure TT3Missile_TM.Initialize;
begin
  inherited;

end;

procedure TT3Missile_TM.Move(const aDeltaMs: double);
begin
  inherited;

end;


//function TT3Missile_TM.searchTarget: TSimObject;
//var
//  i : integer;
//  pf, target : TSimObject;
//
//  isHit : boolean;
//  frPt, toPt, mPt : t2DPoint;
//begin
//  Result := nil;
//end;

//procedure TT3Missile_TM.Shoot;
//begin
//
//end;

function TT3Missile_TM.GetSnapshotData : _SS_TT3Missile_TM;
var
   ss : _SS_TT3Missile_TM ;
begin
   ss.M := TT3Missile(Self).GetSnapshotData ;
   Result := ss ;
end;

procedure TT3Missile_TM.SetSnapshotData (const ss : _SS_TT3Missile_TM);
begin
 TT3Missile(Self).SetSnapshotData(ss.M) ;
end;

//================================================================================

//================================================================================
{ TT3Missile_HM } //Hybrid Missile
{$IFDEF SERVER}
//function TT3Missile_HM.CheckDomainTarget(Target: TT3PlatformInstance): Boolean;
//begin
//  Result := False;
//
//  if Target is TT3Chaff then
//  begin
//    Result := True;
//  end
//  else
//  if Target is TT3Vehicle then
//  begin
//    if Target.Altitude = 0 then
//      Result := True
//    else
//      Result := False;
//  end;
//end;
{$ENDIF}

constructor TT3Missile_HM.create;
begin
  inherited;
  MissileMovement  := TT3Aimpoint_Missile.create;
end;

destructor TT3Missile_HM.destroy;
begin

  inherited;
end;

procedure TT3Missile_HM.Initialize;
begin
  inherited;

end;

procedure TT3Missile_HM.Move(const aDeltaMs: double);
var
  range : double;

begin
  inherited;
  FDeltaHead := 0;

  //Waiting Time to Launch
  if FisCounterDelay then
  begin
    FCounterDelay := FCounterDelay + aDeltaMs;
    if FCounterDelay < FLaunchDelay then exit
    else
    begin
      FisCounterDelay := false;
      FLaunching := true;
      Shoot;
    end;
  end;

  //Launch Missile
  if FLaunching then
  begin
    if Target <> nil then
    begin
      if CalcRange(getPositionX, getPositionY, Target.getPositionX, getPositionY) > 2 then
        isLockTarget := False;
    end;

    CalcMovement(aDeltaMs);

    if  (CalcRange(FPosition.X, FPosition.Y, FTargetPosition.X, FTargetPosition.Y) <= 0.9)
        and (FOrderedAltitude <> 0) then
      SetOrderedAltitude(0);

    {$IFDEF SERVER}
    if IsInsideCircle(FPosition.X,FPosition.Y,FTargetPosition.X,
     FTargetPosition.Y,50, FPosition.Z, FTargetPosition.Z, 1) then
    begin
      Launched := false;
      FLaunching := false;

      if Assigned(OnHybridLaunch) then
        OnHybridLaunch(Self);

        FreeMe := True;
        AbsoluteFree := True;

      FTorpedo := nil;
//      if Assigned(OnOut) then
//        OnOut(Self,23);

//      FTorpedo.InstanceIndex := InstanceIndex;
//      FTorpedo.Launched := True;
    end;
    {$ENDIF}

//    FLastPosition.X := FPosition.X;
//    FLastPosition.Y := FPosition.Y;
//    FLastPosition.Z := FPosition.Z;
//
//    FTorpedo.PosX := FPosition.X;
//    FTorpedo.PosY := FPosition.Y;
//    FTorpedo.PosZ := FPosition.Z;
//
//    FTorpedo.LaunchPosition := FLastPosition;

    // cek max range, jika > max range maka destroy
    range := CalcRange(FHomePositionX, FHomePositionY,FPosition.X, FPosition.Y) ;
    {$IFDEF SERVER}
    if range > FMaxRange then
    begin
      Launched := false;
      FLaunching := false;

      if Assigned(OnOut) then
        OnOut(Self,3);
    end;
    {$ENDIF}

    //cek range untuk edit simbol missile
    if (not(isInstructor) and (range > 12) and (not(isWasdal))) then    //mk
    begin
      UnitGroup := False;
      Visible := False;
      Planned := False;
    end;
  end;
end;

{$IFDEF SERVER}
//function TT3Missile_HM.searchTarget: TSimObject;
//var
//  i : integer;
//  pf, target : TSimObject;
//
//  isHit : boolean;
//  frPt, toPt, mPt : t2DPoint;
//begin
//  Result := nil;
//  if not HaveSeeker then Exit;
//
//  i := 0;
//  isHit  := false;
//
//  target      := nil;
//  result      := nil;
//
//  if SeekerOn then
//  begin
//    if not FSeekAltitudeOnce then
//    begin
//       SetAltitude(FDefaultSeekAltitude * C_Feet_To_Meter);
//       FSeekAltitudeOnce := true;
//    end;
//  end;
//
//  while (i < TargetPlatforms.itemCount) do
//  begin
//    pf := TargetPlatforms.getObject(i);
//    inc(i);
//
//    if pf = Owner then continue;
//    if pf = Self then continue;
//    if not ((pf is TT3Vehicle) or (pf is TT3Chaff)) then continue;
//    if TT3PlatformInstance(pf).Dormant then continue;
//
//    // Hit Something
//    if IsInsideCircle(FPosition.X,FPosition.Y,TT3PlatformInstance(pf).getPositionX,
//      TT3PlatformInstance(pf).getPositionY,50, FPosition.Z, TT3PlatformInstance(pf).getPositionZ, 1) then
//    begin
//     if pf is TT3Vehicle then
//       isHit := true;
//
//     if pf is TT3Chaff then
//       if TT3Chaff(pf).ChaffCategory = ecgDistraction then
//         isHit := true;
//
//     if isHit then begin
//       result := pf;
//
//       setPositionX(TT3PlatformInstance(pf).getPositionX);
//       setPositionY(TT3PlatformInstance(pf).getPositionY);
//
//       exit;
//     end;
//    end;
//
//    // Fast forward check.
//    frPt.X := FLastPosition.X;
//    frPt.Y := FLastPosition.Y;
//    toPt.X := FPosition.X;
//    toPt.Y := FPosition.Y;
//    mPt.X  := TT3PlatformInstance(pf).getPositionX;
//    mPt.Y  := TT3PlatformInstance(pf).getPositionY;
//    if (CalcRange(FLastPosition.X,FLastPosition.Y,FPosition.X,FPosition.Y) > 0) and
//      (ptBetween2Point(mPt,frPt,toPt,50)) then
//    begin
//
//       result := pf;
//
//       setPositionX(TT3PlatformInstance(pf).getPositionX);
//       setPositionY(TT3PlatformInstance(pf).getPositionY);
//
//       exit;
//    end;
//
//    //Search Target Seeker
//    if not SeekerOn then continue;
//    if not CheckDomainTarget(TT3PlatformInstance(pf)) then Continue;
//
//    if isLockTarget then Continue;
//
//    if MissileMovement is TT3Straight_Missile then
//      Target := TT3Straight_Missile(MissileMovement).ValidateObject(Self, pf)
//    else
//    if MissileMovement is TT3Aimpoint_Missile then
//      Target := TT3Aimpoint_Missile(MissileMovement).ValidateObject(Self, pf)
//    else
//    if MissileMovement is TT3BearingOnly_Missile then
//      Target := TT3BearingOnly_Missile(MissileMovement).ValidateObject(Self, pf);
//
//    if Assigned(target) then
//    begin
//      SetTargetObject(target);
//      isLockTarget := True;
//    end
//    else
//      FTargetObject := nil;
//  end;
//end;
{$ENDIF}

//procedure TT3Missile_HM.SetMovement(Mode: TMissileFiringMode);
//begin
//  case Mode of
//    mfmDirect:
//    begin
//      MissileMovement := TT3Straight_Missile.create;
//    end;
//    mfmAimpoint :
//    begin
//      MissileMovement := TT3Aimpoint_Missile.create;
//    end;
//    mfmBearing :
//    begin
//      MissileMovement := TT3BearingOnly_Missile.create;
//    end;
//  end;
//end;

procedure TT3Missile_HM.Shoot;
//var
//  hRange,hBearing,hTime,hSpeed : double;
//  mx,my : double;
  //defHeight : Double;
begin
  FTargetPosition.X := TT3Aimpoint_Missile(MissileMovement).PositionX;
  FTargetPosition.Y := TT3Aimpoint_Missile(MissileMovement).PositionY;
  FTargetPosition.Z := TT3PlatformInstance(Owner).getPositionZ;

  FMover.MaxSpeed       := UnitMotion.FData.Max_Ground_Speed;
  FMover.Acceleration   := UnitMotion.FData.Acceleration;

  SetOrderedHeading(FTargetBearing);

  FLastPosition.X := FPosition.X;
  FLastPosition.Y := FPosition.Y;
  FLastPosition.Z := FPosition.Z;
end;

procedure TT3Missile_HM.Draw(aCnv: tCanvas);
begin
  inherited;

end;


function TT3Missile_HM.GetSnapshotData : _SS_TT3Missile_HM;
var
   ss : _SS_TT3Missile_HM ;
begin
   ss.M := TT3Missile(Self).GetSnapshotData ;
   Result := ss ;
end;

procedure TT3Missile_HM.SetSnapshotData (const ss : _SS_TT3Missile_HM);
begin
 TT3Missile(Self).SetSnapshotData(ss.M) ;
end;

//================================================================================

end.

