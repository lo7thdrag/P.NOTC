unit uT3Visual;

interface

uses uT3Sensor, uDBAsset_Sensor, graphics, uSimObjects, uSnapshotData ;

type
  TT3Visual = class(TT3Sensor)
  private
    FVisualDefinition: TVisual_Sensor_On_Board;
    {comment dlu krn gk di panggil}
    //function InsideHorizon(aObject : TSimObject) : boolean;
  protected
    function  GetMaxLOSRange(aObject : TSimObject) : Double; //override;
  public
    procedure Initialize; override;
    function  GetSnapshotData : _SS_TT3Visual ;
    procedure SetSnapshotData(const ss : _SS_TT3Visual);

    function  InsideRange(aObject: TSimObject): boolean; override;
    function  InsideDetailRange(aObject : TSimObject) : Boolean; override;
    function  TargetTypeEligiblity(aTarget: TObject): boolean; override;
    function  InsideBlindZone(aObject : TSimObject) : boolean;override;
    function  InsideOtherMeasurement(aObject : TSimObject) : boolean; override;
    function  ParentSensor (aObject:TSimObject) : Boolean; override;   //add andik

    property VisualDefinition : TVisual_Sensor_On_Board read FVisualDefinition;
  end;

implementation

uses uT3Unit, uBaseCoordSystem, uDBBlind_Zone,
     uObjectVisuals, uT3vehicle, tttData;

{ TT3Visual }

procedure TT3Visual.Initialize;
var
  i : integer;
  blindZ : TBlindZoneVisual;
begin
  inherited;

  if Assigned(UnitDefinition) and (UnitDefinition is TVisual_Sensor_On_Board) then
    FVisualDefinition := TVisual_Sensor_On_Board(UnitDefinition);

  if Assigned(GameDefaults) then
  begin
    DetectionRange := GameDefaults.FData.Max_Visual_Range;
    DetailDetectionRange := GameDefaults.FData.Visual_Detect_Range;

    if DetectionRange = 0 then
    begin
      DetectionRange := 12;
      DetailDetectionRange := 12;
    end;
  end
  else
  begin
    DetectionRange := 12;
    DetailDetectionRange := 12;
  end;

  if Assigned(FVisualDefinition) then
  begin
    InstanceName := FVisualDefinition.FData.Instance_Identifier;
    InstanceIndex := FVisualDefinition.FData.Visual_Instance_Index;

    if FVisualDefinition.FBlind.Count > 0 then
    begin
      SetLength(BZStartAngle,FVisualDefinition.FBlind.Count);
      SetLength(BZEndAngle,FVisualDefinition.FBlind.Count);

      for i := 0 to FVisualDefinition.FBlind.Count - 1 do
      begin
        blindZ := TBlindZoneVisual.Create;
        BZStartAngle[i] := TBlind_Zone(FVisualDefinition.FBlind.Items[i]).FData.Start_Angle;
        BZEndAngle[i]   := TBlind_Zone(FVisualDefinition.FBlind.Items[i]).FData.End_Angle;
        blindZ.StartAngle := BZStartAngle[i];
        blindZ.EndAngle   := BZEndAngle[i];
        FBlindZoneViews.Add(blindZ);
      end;
    end;

    // update rel start start-end angle
    for I := 0 to FBlindZoneViews.Count - 1 do
    begin
      blindZ := TBlindZoneVisual(FBlindZoneViews.Items[i]);
      blindZ.Ranges := DetectionRange;

      if Assigned(FParent) then begin
        blindZ.Heading:= TT3PlatformInstance(FParent).Course;
        blindZ.mX     := FParent.getPositionX;
        blindZ.mY     := FParent.getPositionY;
      end;

      blindZ.UpdateRelatifAngle;
    end;
  end;
end;

function TT3Visual.InsideBlindZone(aObject: TSimObject): boolean;
var
  i : integer;
  blindZ : TBlindZoneVisual;
  bearing : double;
begin
  Result := inherited;

  bearing := CalcBearing(FPosition.X,FPosition.Y,
           TT3PlatformInstance(aObject).getPositionX,
           TT3PlatformInstance(aObject).getPositionY);

  // periksa apakah didalam area blind zone
  if FBlindZoneViews.Count > 0 then begin
    for I := 0 to FBlindZoneViews.Count - 1 do begin

      blindZ := TBlindZoneVisual(FBlindZoneViews.Items[i]);
      Result := DegComp_IsBeetwen(bearing, blindZ.RelativeStartAngle, blindZ.RelativeEndAngle); //mk 19042012

      {if (blindZ.RelativeStartAngle > blindZ.RelativeEndAngle) then begin
        if (bearing > blindZ.RelativeStartAngle) or
           (bearing < blindZ.RelativeEndAngle) then begin
            result := true;
            break;
        end;
      end else
      if (bearing > blindZ.RelativeStartAngle) and
         (bearing < blindZ.RelativeEndAngle) then result := false;}
    end;
  end
  else result := false;

end;

function TT3Visual.InsideRange(aObject: TSimObject): boolean;
var
  range : double;
begin
  inherited;
  range   := CalcRange(FPosition.X,FPosition.Y,
           aObject.getPositionX,aObject.getPositionY);

  result := range <= DetectionRange;
end;

function TT3Visual.ParentSensor(aObject: TSimObject): Boolean;  //add andik, buat ngecek parent sensor subsurface
var
 insideDomain:Boolean;
begin
  if (TT3PlatformInstance(aObject).PlatformDomain = 2)  then
  begin
    if TT3PlatformInstance(aObject).Altitude <> 0 then
      insideDomain := false
    else
      insideDomain := True;
  end
  else
    insideDomain:=True;

  Result := insideDomain;
end;

function TT3Visual.TargetTypeEligiblity(aTarget: TObject): boolean;
begin
  inherited;

  Result := True;

  if aTarget is TT3Vehicle then
  begin
    if TT3Vehicle(aTarget).VehicleDefinition.FData.Detectability_Type = 1 then  //17042012 mk
      Result := False;
  end;
end;

//coment dlu krn gk dipanggil
{function TT3Visual.InsideHorizon(aObject: TSimObject): boolean;
var
  x1,y1,h1 : double;
  x2,y2,h2 : double;
begin
  result := true;

  x1 := getPositionX;
  y1 := getPositionY;
  h1 := getPositionZ + VisualDefinition.FData.Observer_Height;

  x2 := aObject.getPositionX;
  y2 := aObject.getPositionY;
  h2 := aObject.getPositionZ;

  if aObject is TT3Vehicle then
    h2 := h2 + TT3Vehicle(aObject).VehicleDefinition.FData.Height;

  result := IsVisibleByHorizon(x1,y1,h1,x2,y2,h2);
end;}

function TT3Visual.InsideOtherMeasurement(aObject: TSimObject): boolean;
var
  InsideDomain : boolean;
  maxLOS, range : Double;
begin
  result := true;
  InsideDomain := true;

  if not(Assigned(aObject)) then    //mk 19042012
    Exit;

  if InsideDomain then
  begin
    InsideDomain := false;

    maxLOS := GetMaxLOSRange(aObject); {* C_Meter_To_NauticalMile}
    range  := CalcRange(Parent.PosX, Parent.PosY, aObject.PosX, aObject.PosY);

    if range < maxLOS then
      InsideDomain := True;
  end;

  result := {InsideHorizon(aObject) and }InsideDomain;
end;

function TT3Visual.GetMaxLOSRange(aObject: TSimObject): Double;
var
  basicLOS : Double;
  TargetHeight, AntenaHeight, VisuaObsHeight   : Double;
  v : TT3Vehicle;
begin
  v := FParent as TT3Vehicle;

  Result := 0;
  TargetHeight  := 0;

  if not (Assigned(v)) then
    Exit;

  if not (Assigned(aObject)) then
    Exit;

  if not (v is TT3Vehicle) then
    Exit;

  if not( aObject is TT3PlatformInstance) then
    Exit;

  if ((TT3PlatformInstance(v).TrackDomain = vhdSubsurface)
      or (TT3PlatformInstance(v).PlatformDomain = vhdSubsurface))
      and (TT3PlatformInstance(v).Altitude <> 0) then
    Exit;

  if ((TT3PlatformInstance(aObject).TrackDomain = vhdSubsurface)
      or (TT3PlatformInstance(aObject).PlatformDomain = vhdSubsurface))
      and (TT3PlatformInstance(aObject).Altitude <> 0) then
    Exit;

  if Assigned(FVisualDefinition) then VisuaObsHeight := FVisualDefinition.FData.Observer_Height
  else VisuaObsHeight := 0;

  if aObject is TT3Vehicle then
  begin
    if (TT3Vehicle(aObject).TrackDomain = vhdAir) or (TT3Vehicle(aObject).PlatformDomain = vhdAir) then
    begin
      TargetHeight := Sqrt(Abs(13 * ((TT3Vehicle(aObject).VehicleDefinition.FData.Height * C_Feet_To_Meter) +
                      TT3Vehicle(aObject).Altitude)));
    end
    else
    if (TT3Vehicle(aObject).TrackDomain = vhdSurface) or (TT3Vehicle(aObject).PlatformDomain = vhdSurface)
        or (TT3Vehicle(aObject).TrackDomain = vhdLand) or (TT3Vehicle(aObject).PlatformDomain = vhdLand)
        or (TT3Vehicle(aObject).TrackDomain = vhdAmphibious) or (TT3Vehicle(aObject).PlatformDomain = vhdAmphibious) then
    begin
      TargetHeight := Sqrt(Abs(13 * (TT3Vehicle(aObject).VehicleDefinition.FData.Height * C_Feet_To_Meter)));
    end
    else
    if (TT3Vehicle(aObject).TrackDomain = vhdSubsurface) or (TT3Vehicle(aObject).PlatformDomain = vhdSubsurface) then
    begin
      TargetHeight := Sqrt(Abs(13 * ((TT3Vehicle(aObject).VehicleDefinition.FData.Height * C_Feet_To_Meter) -
                      TT3Vehicle(aObject).Altitude)));
    end
    else
    begin
      TargetHeight := Sqrt(Abs(13 * ((TT3Vehicle(aObject).VehicleDefinition.FData.Height * C_Feet_To_Meter) +
                      TT3Vehicle(aObject).Altitude)));
    end;
  end
  else
  begin
    if aObject is TT3PlatformInstance then TargetHeight := Sqrt(Abs(13 * TT3PlatformInstance(aObject).Altitude));
  end;

  if (Assigned(v)) then
  begin
    if (v.TrackDomain = vhdAir) or (v.PlatformDomain = vhdAir) then
    begin
      AntenaHeight := Sqrt(Abs(13 * (((VisuaObsHeight + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter) + v.Altitude)));
    end
    else
    if (v.TrackDomain = vhdSurface) or (v.PlatformDomain = vhdSurface)
        or (v.TrackDomain = vhdLand) or (v.PlatformDomain = vhdLand)
        or (v.TrackDomain = vhdAmphibious) or (v.PlatformDomain = vhdAmphibious) then
    begin
      AntenaHeight := Sqrt(Abs(13 * ((VisuaObsHeight + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter)));
    end
    else
    if (v.TrackDomain = vhdSubsurface) or (v.PlatformDomain = vhdSubsurface) then
    begin
      AntenaHeight := Sqrt(Abs(13 * (((VisuaObsHeight + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter) - v.Altitude)));
    end
    else
    begin
      AntenaHeight := Sqrt(Abs(13 * (((VisuaObsHeight + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter) + v.Altitude)));
    end;
  end
  else AntenaHeight := Sqrt(Abs(13 * (VisuaObsHeight * C_Feet_To_Meter)));

  basicLOS := TargetHeight + AntenaHeight;

  Result := basicLOS;
end;

function TT3Visual.InsideDetailRange(aObject : TSimObject) : Boolean;
var
  range : Double;
begin
  inherited;

  range   := CalcRange(FPosition.X, FPosition.Y,
           aObject.getPositionX, aObject.getPositionY);

  //tambahan sementara 310212012
  Result := (range <= DetailDetectionRange);

  {if Result then
  begin
    if aObject is TT3PlatformInstance then
    begin
      with TT3PlatformInstance(aObject) do
      begin
        rec.IFF_Capability := True;
        rec.Altitude_Data_Capability := True;
        rec.Ground_Speed_Data_Capability := True;
        rec.Heading_Data_Capability := True;
        rec.Plat_Type_Recog_Capability := True;
        rec.Plat_Class_Recog_Capability := True;
        rec.Track_ID := True;

        DetailedDetectionShowed := rec;
      end;
    end;
  end
  else
  begin
    if aObject is TT3PlatformInstance then
    begin
      with TT3PlatformInstance(aObject) do
      begin
        rec.IFF_Capability := False;
        rec.Altitude_Data_Capability := False;
        rec.Ground_Speed_Data_Capability := False;
        rec.Heading_Data_Capability := False;
        rec.Plat_Type_Recog_Capability := False;
        rec.Plat_Class_Recog_Capability := False;
        rec.Track_ID := True;

        DetailedDetectionShowed := rec;
      end;
    end;
  end;}
end;

function TT3Visual.GetSnapshotData : _SS_TT3Visual ;
var
  I  : integer ;
  ss :  _SS_TT3Visual ;
begin
  ss.S := TT3Sensor(Self).GetSnapshotData;
  with VisualDefinition do begin
    ss.VisualDefinition.FData                     := FData ;
    ss.VisualDefinition.FVehicle.FData            := FVehicle.FData ;
    ss.VisualDefinition.FVehicle.FPlatform_Ident  := FVehicle.FPlatform_Ident ;
    ss.VisualDefinition.FVehicle.FHeliLimitation  := FVehicle.FHeliLimitation ;
    if FBlind_Zone <> nil then begin
       ss.VisualDefinition.FBlind_Zone.FData := FBlind_Zone.FData ;
    end;
    if FBlind <> nil then begin
       SetLength(ss.VisualDefinition.FBlind,FBlind.Count);
       for I := 0 to FBlind.Count - 1 do begin
          ss.VisualDefinition.FBlind[i].FData := TBlind_Zone(FBlind[i]).FData ;
       end;
    end;
  end;
  Result := ss ;
end;

procedure TT3Visual.SetSnapshotData(const ss : _SS_TT3Visual);
begin
  TT3Sensor(Self).SetSnapshotData(ss.S);
  VisualDefinition.FData := ss.VisualDefinition.FData ;
  VisualDefinition.FVehicle.FData := ss.VisualDefinition.FVehicle.FData ;
  VisualDefinition.FVehicle.FPlatform_Ident := ss.VisualDefinition.FVehicle.FPlatform_Ident ;
  VisualDefinition.FVehicle.FHeliLimitation := ss.VisualDefinition.FVehicle.FHeliLimitation ;
end;

end.
