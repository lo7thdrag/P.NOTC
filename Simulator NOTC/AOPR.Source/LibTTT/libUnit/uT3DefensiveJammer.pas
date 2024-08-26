unit uT3DefensiveJammer;

interface

uses uT3CounterMeasure, uDBAsset_Countermeasure, uSnapshotData,
     uT3UnitContainer, uT3Missile, uT3Radar, tttData;

type

  TT3DefensiveJammerOnVehicle = class(TT3CounterMeasure)
  private
    FDefensiveDefinition    : TDefensive_Jammer_On_Board;
    FTargeting              : TECMTargeting;

    FBearing                : Double;
    FSpotNumber             : Integer;
    FTargetIndex            : integer;

    FPlatformEntities       : TT3UnitContainer;
    FDeviceEntities         : TT3UnitContainer;

    FJammer_TARH_Capable    : boolean;
    FJammer_SARH_Capable    : boolean;
    FType_A_Seducing_Prob   : single;
    FType_B_Seducing_Prob   : single;
    FType_C_Seducing_Prob   : single;
    FBreakLockCounter       : single;
    FECM_Type               : byte;

    FJammedObject           : TObject;
    FOnJammingSuccess       : TOnSDJammingSuccess;
    FOnJammingFailed        : TOnSDJammingFailed;

    {$IFDEF SERVER}
    FHOJCapable             : Boolean;

    function AcquireMissileTARH : TT3Missile;
    function AcquireFCRadar     : TT3Radar;

    function BreakLockCalculation : Boolean;
    {$ENDIF}

    procedure SetBearing(const Value: Double);
    procedure SetTargeting(const Value: TECMTargeting);
    procedure SetSpotNumber(const Value: Integer);
    procedure SetPlatformEntities(const Value: TT3UnitContainer);
    procedure SetDeviceEntities(const Value: TT3UnitContainer);
    procedure SetTargetIndex(const Value: integer);
    procedure SetOnJammingSuccess(const Value: TOnSDJammingSuccess);
    procedure SetOnJammingFailed(const Value: TOnSDJammingFailed);
  protected
    procedure SetStatus(const Value: TECMStatus);override;
  public
    constructor Create; override;
    procedure Initialize; override;
    procedure Move(const aDeltaMs: double); override;
    procedure ApplyJammedEffect(aJammedObject : TObject);

    function  GetSnapshotData : _SS_DefensiveJammerOnVehicle ;
    procedure SetSnapshotData(const ss : _SS_DefensiveJammerOnVehicle);

    property DefensiveDefinition
             : TDefensive_Jammer_On_Board read FDefensiveDefinition;
    property Bearing    : Double read FBearing write SetBearing;
    property Targeting  : TECMTargeting read FTargeting write SetTargeting default ettSpot;
    property SpotNumber : Integer read FSpotNumber write SetSpotNumber default 10000;
    property PlatformEntities : TT3UnitContainer read FPlatformEntities write SetPlatformEntities;
    property DeviceEntities   : TT3UnitContainer read FDeviceEntities write SetDeviceEntities;
    property TargetIndex : integer read FTargetIndex write SetTargetIndex default 0;
    property OnJammingSuccess : TOnSDJammingSuccess read FOnJammingSuccess write SetOnJammingSuccess;
    property OnJammingFailed  : TOnSDJammingFailed read FOnJammingFailed write SetOnJammingFailed;
  end;

implementation

uses  uT3Unit, uT3DetectedTrack, uBaseCoordSystem;

{ TT3DefensiveJammerOnVehicle }

{$IFDEF SERVER}
function TT3DefensiveJammerOnVehicle.AcquireFCRadar: TT3Radar;
var
  I,j, count : integer;
  item : TObject;
  lockedTgt : TObject;
  jammedFCR, candFCR : TT3Radar;
  FCRBearing, dtBearing, minBearing : Double;
begin
  jammedFCR  := nil;
  candFCR    := nil;
  minBearing := 9999;

  count := FDeviceEntities.itemCount;
  for I := 0 to count - 1 do
  begin
    item := FDeviceEntities.getObject(i);

    if item is TT3Radar then
    begin
      if not (TT3Radar(item).OperationalStatus in [sopOn]) then
        Continue;

      {cari FCR Radar saja}
      if TT3Radar(item).RadarDefinition.FDef.Num_FCR_Channels > 0 then
      begin
        case Status of
          esAutomatic:
          begin
            {hanya FCR yang lock platform ini saja}
            if (Assigned(TT3Radar(item).AssignedTrack))
               or (TT3Radar(item).AssignedTrack <> nil) then
            begin
              for j := 0 to TT3Radar(item).AssignedTrack.Count - 1 do
              begin
                lockedTgt := TT3Radar(item).AssignedTrack.Items[j];

                if (lockedTgt is TT3PlatformInstance) and (lockedTgt = Parent) then
                begin
                  jammedFCR := TT3Radar(item);
                  break;
                end
                else
                if (lockedTgt is TT3DetectedTrack) and
                   (TT3DetectedTrack(lockedTgt).TrackObject = Parent) then
                begin
                  jammedFCR := TT3Radar(item);
                  break;
                end;
              end;
            end;
          end;

          esManual :
          begin
            case Targeting of
              { manual mode dengan track number}
              ettTrack :
              begin
                { Target belum ditrack}
                if TargetIndex = 0 then
                  Break;

                if Assigned(TT3Radar(item).Parent) and
                   (TT3PlatformInstance(TT3Radar(item).Parent).InstanceIndex = TargetIndex) then
                begin
                  { apakah FCR lagi lock platform apapun }
                  if TT3Radar(item).AssignedTrack <> nil then
                  begin
                    if TT3Radar(item).AssignedTrack.Count >= 1 then
                    begin
                      jammedFCR := TT3Radar(item);
                      break;
                    end;
                  end;
                end;
              end;

              { manual mode dengan spot number}
              ettSpot:
              begin
                if TT3Radar(item).SpotNumber = FSpotNumber then
                begin
                  if (Assigned(TT3Radar(item).AssignedTrack))
                     or (TT3Radar(item).AssignedTrack <> nil) then
                  begin
                    { apakah FCR lagi lock platform apapun }
                    if TT3Radar(item).AssignedTrack.Count = 0 then
                      Continue;

                    { cek candidat FCR dengan bearing set operator }
                    if Assigned(TT3Radar(item)) then
                    begin
                      { bearing jammer to FCR }
                      FCRBearing := CalcBearing(TT3Radar(item).PosX, TT3Radar(item).PosY,
                                    PosX, PosY);

                      { delta bearing_to_jammer with operator bearing }
                      dtBearing := Abs(FCRBearing - Bearing);

                      if dtBearing > 180 then
                        dtBearing := 360 - dtBearing;

                      if minBearing > dtBearing then
                      begin
                        minBearing := dtBearing;
                        candFCR := TT3Radar(item);
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;

    if Assigned(candFCR) then
      jammedFCR := candFCR;

    { jika ketemu ..}
    if Assigned(jammedFCR) then
      break;
  end;

  result := jammedFCR;
end;
{$ENDIF}

{$IFDEF SERVER}
function TT3DefensiveJammerOnVehicle.AcquireMissileTARH: TT3Missile;
var
  i : integer;
  item : TObject;
  jammedMissile : TT3Missile;
begin
  result := nil;

  if not Assigned(FPlatformEntities) then
    Exit;

  jammedMissile := nil;

  for I := 0 to FPlatformEntities.itemCount - 1 do
  begin
    item := FPlatformEntities.getObject(i);

    {cari yang missile saja}
    if item is TT3Missile then
    begin
      {cari missile yang tipe guidance TARH}
      if TT3Missile(item).PrimaryGuidance = mgtTARH then
      begin
        case Status of
          { jika mode automatic}
          esAutomatic:
          begin
            if Assigned(TT3Missile(item).TargetObject) and
               TT3Missile(item).isLockTarget then
            begin
              {hanya TARH missile yg narget platform ini yg bisa di jammed}
              if TT3Missile(item).TargetObject = Parent then
              begin
                if TT3Missile(item).EstimateHitTime > -1 then
                begin
                  { jika banyak TARH missile yg narget, cari yg estimasi waktu perkenaan
                    paling pendek }

                  if not Assigned(jammedMissile) then
                    jammedMissile := TT3Missile(item)
                  else
                  if jammedMissile.EstimateHitTime > TT3Missile(item).EstimateHitTime then
                    jammedMissile := TT3Missile(item);
                end;
              end;
            end;
          end;

          { jika mode manual}
          esManual:
          begin
            case Targeting of
              { manual mode dengan track number}
              ettTrack:
              begin
                { Target belum ditrack}
                if TargetIndex = 0 then
                  Break;

                if TT3Missile(item).InstanceIndex = TargetIndex then
                begin
                  { only missile with locking target eligible for jamming }
                  if Assigned(TT3Missile(item).TargetObject) and
                     TT3Missile(item).isLockTarget then
                  begin
                    jammedMissile := TT3Missile(item);
                    break;
                  end;
                end;
              end;

              { manual mode dengan spot number}
              ettSpot:
              begin
                if Assigned(TT3Missile(item).TargetObject) and
                   TT3Missile(item).isLockTarget then
                begin
                  { hanya spot number yang sesuai dengan input operator }
                  if TT3Missile(item).SpotNumber = FSpotNumber then
                  begin
                    jammedMissile := TT3Missile(item);
                    break;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

  result := jammedMissile;
end;
{$ENDIF}

procedure TT3DefensiveJammerOnVehicle.ApplyJammedEffect(aJammedObject: TObject);
var
  foundParent : Boolean;
  i : integer;
begin
  { apply jammed effect on missile or FCR}
  if aJammedObject is TT3Missile then
  begin
    { set missile target to none, head and altitude fixed, seeker turn delayed }
    TT3Missile(aJammedObject).Jammed(Self);
  end
  else
  if aJammedObject is TT3Radar then
  begin
    { if automatic mode, break parent only }
    if Status = esAutomatic then
    begin
      foundParent := False;
      if TT3Radar(aJammedObject).AssignedTrack <> nil then
      begin
        for I := 0 to TT3Radar(aJammedObject).AssignedTrack.Count - 1 do
        begin
          if TT3Radar(aJammedObject).AssignedTrack.Items[i] = Parent then
          begin
            foundParent := true;
            Break;
          end;
        end;

        if foundParent then
        begin
          TT3Radar(aJammedObject).AssignedTrack.Delete(I);
          Parent.IsAssigned := false;
        end;
      end;
    end;

    { break only 1 assignment }
    if Status = esManual then
    begin
      if TT3Radar(aJammedObject).AssignedTrack <> nil then
      begin
        if TT3Radar(aJammedObject).AssignedTrack.Count > 0 then
        begin
          TT3PlatformInstance(TT3Radar(aJammedObject).AssignedTrack.Items[0]).IsAssigned := False;
          TT3Radar(aJammedObject).AssignedTrack.Delete(0);
        end;
      end;
    end;
  end;

  { biarkan seperti ini, dipake di client }
  FJammedObject := aJammedObject;
end;

{$IFDEF SERVER}
function TT3DefensiveJammerOnVehicle.BreakLockCalculation: Boolean;
var
  probRandom : single;
begin
  Result := false;
  Randomize;
  FHOJCapable := false;

  if Assigned(FJammedObject) then
  begin
    Result := True; // true by default
    probRandom := Random;

    { check Home OnJamming Missile }
    if FJammedObject is TT3Missile then
    begin
      FHOJCapable :=
      {Type A}  (FDefensiveDefinition.FDefensiveJammer_Def.ECM_Type = 0) and (TT3Missile(FJammedObject).HOJTypeA) or
      {Type B}  (FDefensiveDefinition.FDefensiveJammer_Def.ECM_Type = 1) and (TT3Missile(FJammedObject).HOJTypeB) or
      {Type C}  (FDefensiveDefinition.FDefensiveJammer_Def.ECM_Type = 2) and (TT3Missile(FJammedObject).HOJTypeC);

      {case 1 : if HOJCapable and jammer is SD, no break lock possible}
      if FHOJCapable then Result := false;

      if Assigned(FOnJammingFailed) and FHOJCapable then
        FOnJammingFailed(Self, TT3Missile(FJammedObject).InstanceName + ' has HOJ Capable');

      {case 2 : if HOJCapable and jammer is Towed, break lock possible}
      { -- implement later -- }

      {case 3 : if missile has Secodary Guidance = IR Guidance, no break lock possible }
      if TT3Missile(FJammedObject).SecondaryGuidance = mgtIRHoming then
      begin
        result := false;

        if Assigned(FOnJammingFailed) then
          FOnJammingFailed(Self, TT3Missile(FJammedObject).InstanceName + ' has IR Homing');
      end;

    end else if FJammedObject is TT3Radar then
    begin
      { radar ECCM type vs SD Type }
      { not do it - not assigned this conditions }
//      Result := FDefensiveDefinition.FDefensiveJammer_Def.ECM_Type = TT3Radar(FJammedObject).ECCMType;
//
//      if Assigned(FOnJammingFailed) and not Result then
//        FOnJammingFailed(Self, 'Jammer ECM <> ' + TT3Radar(FJammedObject).InstanceName + ' ECCM');
    end;

    { calculate POS_vs_ECCM_Type }
    if result then
    begin
      if FJammedObject is TT3Missile then
      begin
        case TT3Missile(FJammedObject).ECCMType of
          0 : result := probRandom <= (FDefensiveDefinition.FDefensiveJammer_Def.Type_A_Seducing_Prob);
          1 : result := probRandom <= (FDefensiveDefinition.FDefensiveJammer_Def.Type_B_Seducing_Prob);
          2 : result := probRandom <= (FDefensiveDefinition.FDefensiveJammer_Def.Type_C_Seducing_Prob);
        end;
      end else
      if FJammedObject is TT3Radar then
      begin
        case TT3Radar(FJammedObject).ECCMType of
          0 : result := probRandom <= (FDefensiveDefinition.FDefensiveJammer_Def.Type_A_Seducing_Prob);
          1 : result := probRandom <= (FDefensiveDefinition.FDefensiveJammer_Def.Type_B_Seducing_Prob);
          2 : result := probRandom <= (FDefensiveDefinition.FDefensiveJammer_Def.Type_C_Seducing_Prob);
        end;
      end;

      if Assigned(FOnJammingFailed) and not result then
        FOnJammingFailed(Self, 'Random result too small to jam ' + TT3Unit(FJammedObject).InstanceName);
    end;
  end;
end;
{$ENDIF}

constructor TT3DefensiveJammerOnVehicle.Create;
begin
  inherited;

  FBearing    := 0;
  FTargeting  := ettSpot;
  Status      := esOff;
  Category    := ecOnBoardDefence;
end;

procedure TT3DefensiveJammerOnVehicle.Initialize;
begin
  inherited;

  if Assigned(UnitDefinition) then
    FDefensiveDefinition := TDefensive_Jammer_On_Board(UnitDefinition);

  if Assigned(FDefensiveDefinition) then
  begin
    with FDefensiveDefinition do
    begin
      InstanceIndex := FData.Defensive_Jammer_Instance_Index;
      InstanceName  := FData.Instance_Identifier;
      Category      := ecOnBoardDefence;

      FJammer_TARH_Capable  := FDefensiveJammer_Def.Jammer_TARH_Capable = 1;
      FJammer_SARH_Capable  := FDefensiveJammer_Def.Jammer_SARH_Capable = 1;
      FType_A_Seducing_Prob := FDefensiveJammer_Def.Type_A_Seducing_Prob;
      FType_B_Seducing_Prob := FDefensiveJammer_Def.Type_B_Seducing_Prob;
      FType_C_Seducing_Prob := FDefensiveJammer_Def.Type_C_Seducing_Prob;
      FECM_Type             := FDefensiveJammer_Def.ECM_Type;
    end;
  end;

  FBreakLockCounter := 0.00;
end;

procedure TT3DefensiveJammerOnVehicle.Move(const aDeltaMs: double);
{$IFDEF SERVER}
var
  rJammedObjParameter : TJammedObjectParameter;
{$ENDIF}
begin
  inherited;

  {$IFDEF SERVER}
  if Status = esOff then
    exit;

  if not Assigned(FJammedObject) then
  begin
    { cari dulu missile TARH }
    if FJammer_TARH_Capable then
      FJammedObject := AcquireMissileTARH;
  end;

  {
    jika tidak ada, cari radar FCR/SARH
    pengecekan selalu dilakukan jika jammedobjectnya adalah TT3Radar,
    karena kemungkinan adanya break manual dari jamming platform
  }

  if FJammer_SARH_Capable and ((FJammedObject is TT3Radar) or not Assigned(FJammedObject))then
    FJammedObject := AcquireFCRadar;

  { jika tidak ditemukan TARH atau SARH maka reset counter }
  if not Assigned(FJammedObject) then
    FBreakLockCounter := 0.00;

  if Assigned(FJammedObject) then
  begin
    FBreakLockCounter := FBreakLockCounter + aDeltaMs;

    { check break lock time interval in second }
    if FBreakLockCounter > GameDefaults.FData.Jam_Break_Lock_Time_Interval then
    begin
      { break logic calculation }
      if BreakLockCalculation then
      begin
        if FJammedObject is TT3Missile then
        begin
          {HOJ vs Towed Jammer}
          if FHOJCapable then
          begin
            {switch target index missile to towed jammer/decoy}
            {implement later}
          end
          else
          if not FHOJCapable then
          begin
            { apply jammed effect }
            ApplyJammedEffect(FJammedObject);

            if Assigned(FOnJammingSuccess) then
            begin
              rJammedObjParameter.PJammedObjectID := TT3Missile(FJammedObject).InstanceIndex;
              rJammedObjParameter.PJammedObjectOwnerID := 0;
              rJammedObjParameter.PJammedObjectType := jotMissile;

              FOnJammingSuccess(Self, rJammedObjParameter);
            end;
          end;
        end
        else if FJammedObject is TT3Radar then
        begin
          if TT3Radar(FJammedObject).AssignedTrack <> nil then
          begin
            if TT3Radar(FJammedObject).AssignedTrack.Count >= 1 then
            begin
              { apply jammed effect }
              ApplyJammedEffect(FJammedObject);

              if Assigned(FOnJammingSuccess) then
              begin
                rJammedObjParameter.PJammedObjectID := TT3Radar(FJammedObject).InstanceIndex;
                rJammedObjParameter.PJammedObjectOwnerID := TT3PlatformInstance(TT3Radar(FJammedObject).Parent).InstanceIndex;
                rJammedObjParameter.PJammedObjectType := jotFCR;

                FOnJammingSuccess(Self, rJammedObjParameter);
              end;
            end;
          end;
        end;

        { release locked jammed object }
        FJammedObject := nil;
      end;

      FBreakLockCounter := 0.00;
    end;
  end;

  {$ENDIF}
end;

procedure TT3DefensiveJammerOnVehicle.SetBearing(const Value: Double);
begin
  FBearing := Value;
end;

procedure TT3DefensiveJammerOnVehicle.SetDeviceEntities(
  const Value: TT3UnitContainer);
begin
  FDeviceEntities := Value;
end;

procedure TT3DefensiveJammerOnVehicle.SetOnJammingFailed(
  const Value: TOnSDJammingFailed);
begin
  FOnJammingFailed := Value;
end;

procedure TT3DefensiveJammerOnVehicle.SetOnJammingSuccess(
  const Value: TOnSDJammingSuccess);
begin
  FOnJammingSuccess := Value;
end;

procedure TT3DefensiveJammerOnVehicle.SetPlatformEntities(
  const Value: TT3UnitContainer);
begin
  FPlatformEntities := Value;
end;

procedure TT3DefensiveJammerOnVehicle.SetTargetIndex(const Value: integer);
begin
  FTargetIndex := Value;
end;

procedure TT3DefensiveJammerOnVehicle.SetTargeting(const Value: TECMTargeting);
begin
  FTargeting := Value;
end;

//============ SNAPSHOT ===========
function TT3DefensiveJammerOnVehicle.GetSnapshotData : _SS_DefensiveJammerOnVehicle ;
var
  ss : _SS_DefensiveJammerOnVehicle ;
begin
  ss.CM := TT3CounterMeasure(Self).GetSnapshotData;
  ss.DefensiveDefinition.FData := DefensiveDefinition.FData ;
  ss.DefensiveDefinition.FDefensiveJammer_Def := DefensiveDefinition.FDefensiveJammer_Def ;
  ss.DefensiveDefinition.FNote := DefensiveDefinition.FNote ;
  ss.Bearing := Bearing;
  ss.Targeting:= byte(Targeting);
  Result := ss ;
end;

procedure TT3DefensiveJammerOnVehicle.SetSnapshotData(const ss : _SS_DefensiveJammerOnVehicle);
begin
  TT3CounterMeasure(Self).SetSnapshotData(ss.CM);
  DefensiveDefinition.FData := ss.DefensiveDefinition.FData ;
  DefensiveDefinition.FDefensiveJammer_Def := ss.DefensiveDefinition.FDefensiveJammer_Def ;
  DefensiveDefinition.FNote := ss.DefensiveDefinition.FNote ;
  Bearing := ss.Bearing;
  Targeting:= TECMTargeting(ss.Targeting);
end;
//============ END SNAPSHOT ===========

procedure TT3DefensiveJammerOnVehicle.SetSpotNumber(const Value: Integer);
begin
  FSpotNumber := Value;
end;

procedure TT3DefensiveJammerOnVehicle.SetStatus(const Value: TECMStatus);
begin
  inherited;

  FJammedObject := nil;
end;

end.
