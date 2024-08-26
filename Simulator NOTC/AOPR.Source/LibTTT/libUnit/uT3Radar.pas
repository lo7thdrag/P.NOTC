unit uT3Radar;

interface

uses uT3Sensor, tttData, uObjectVisuals, Graphics, uDBAsset_Radar, Classes, uSimObjects,
  uSnapshotData ;

type
  TOnFindActiveJammers = function(Sender : TObject): TList of object;
  TOnFindJammersInRange = function(Sender : Tobject): TList of object;

  TT3Radar = class(TT3Sensor)
  private
    FRadarDefinition      : TRadar_On_Board;

    // radar runtime setting
    FScanSectorVisual     : TBlindZoneVisual;
    FSwapLine             : TSwapLineVisual;

    FControlMode          : TRadarControlMode;
    FScanSector           : TRadarScanSector;

    FECCM                 : boolean;
    FShowScanSector       : boolean;
    FStartScan, FEndScan  : double;
    FScanDegree           : double;
    FOnControlMode        : TOnRadarControlMode;
    FOnRemoveDetected     : TNotifyEvent;

    FJammedBy: TList;
    FRNJammOperationalStatus : TRNJammOperasionalStatus;

    //aldy tambah List Assignment for FCR dan Event
    FAssignedTrack        : TList;
    FOnFireControlUpdated : TNotifyEvent;
    FSpotNumber: Integer;
    FECCMType: Integer;

    //Jammer Field
//    FActiveJammers : TList;
//    FJammersInRange : TList;
//    FOnFindActiveJammers : TOnFindActiveJammers;
//    FOnFindJammersInRange : TOnFindJammersInRange;
    procedure SetRNJammOperationalStatus(const Value: TRNJammOperasionalStatus);
    procedure SetRNJammStatus(const Value: TSensorOperationalStatus; const Jamm: TRNJammOperasionalStatus);
    procedure SetControlMode(const Value: TRadarControlMode);
    procedure SetECCM(const Value: boolean);
    procedure SetEndScan(const Value: double);
    procedure SetShowScanSector(const Value: boolean);
    procedure SetStartScan(const Value: double);
    procedure SetScanDegree(const Value: double);
    procedure SetOnControlMode(const Value: TOnRadarControlMode);
    procedure SetSpotNumber(const Value: Integer);
  protected
    procedure SetOperationalStatus(const Value: TSensorOperationalStatus); override;
    function  GetMaxLOSRange(aObject : TSimObject) : Double; //override;
  public
    constructor Create; override;
    destructor Destroy; override;

    function GetSnapshotData : _SS_TT3Radar ;
    procedure SetSnapshotData(const ss : _SS_TT3Radar);

    {$REGION 'Documentation'}
    ///	<summary>function to calculate if the object is inside blind
    ///	zone</summary>
    ///	<param name="aObject">object which is checked</param>
    ///	<returns>
    ///	  <para>true if inside blind zone</para>
    ///	  <note type="note">false if outside blindzone</note>
    ///	</returns>
    {$ENDREGION}
    function  InsideBlindZone(aObject : TSimObject) : boolean; override;
    function  InsideVerticalCoverage(aObject: TSimObject): boolean; override;
    function  InsideOtherMeasurement(aObject : TSimObject) : boolean; override;
    function  InsideRange(aObject : TSimObject) : boolean; override;
    function  InsideDetailRange(aObject : TSimObject) : Boolean; override;
    function  InsideJammedEffect : Boolean; override;
    function  TargetTypeEligiblity(aTarget: TObject): boolean; override;

    procedure SetStaticControlMode(const Value : TRadarControlMode);
    procedure Initialize; override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure UpdateAssignedtrack;
    procedure RemoveAssignedtrack;
    procedure Move(const aDeltaMs: double); override;
    procedure SetOnRemoveDetected(const Value : TNotifyEvent);
    procedure SetOnfireControlUpdated(const value : TNotifyEvent);

    property ControlMode    : TRadarControlMode read FControlMode write SetControlMode;
    property ECCM           : boolean read FECCM write SetECCM;
    property ShowScanSector : boolean read FShowScanSector write SetShowScanSector;
    property StartScan      : double read FStartScan write SetStartScan;
    property EndScan        : double read FEndScan write SetEndScan;
    property ScanDegree     : double read FScanDegree write SetScanDegree;
    property RadarDefinition : TRadar_On_Board read FRadarDefinition;
    property OnControlMode   : TOnRadarControlMode read FOnControlMode write SetOnControlMode;
    property OnRemoveDetected: TNotifyEvent read FOnRemoveDetected write SetOnRemoveDetected;
    property AssignedTrack   : TList read FAssignedTrack write FAssignedTrack;
    property OnFireControlUpdated : TNotifyEvent read FOnFireControlUpdated write SetOnfireControlUpdated;
    property SpotNumber     : Integer read FSpotNumber write SetSpotNumber;
    property ECCMType       : Integer read FECCMType;

    property JammedBy: TList read FJammedBy;
    property RNJammOperationalStatus : TRNJammOperasionalStatus
        read FRNJammOperationalStatus write SetRNJammOperationalStatus;
  end;

implementation

uses uT3Unit, uCoordConvertor,
  uBaseCoordSystem, uDBBlind_Zone, uT3DetectedTrack, uT3Vehicle, uT3Missile,
  uDBAsset_Scripted, newClassASTT;

{ TT3Radar }

constructor TT3Radar.Create;
begin
  inherited;

  FScanSectorVisual   := TBlindZoneVisual.Create;
  FSwapLine           := TSwapLineVisual.Create;
  FControlMode        := rcmOff;
  FScanSector         := rscFull;
  FStartScan          := 0;
  FEndScan            := 360;

  FShowScanSector     := false;
  FECCM               := false;
  FRadarDefinition    := nil;

  FJammedBy           := TList.Create;
  FRNJammOperationalStatus := JammedOff;
end;

destructor TT3Radar.Destroy;
var
  i : integer;
  //aObj : TObject;
begin
  FJammedBy.Free;

  if Assigned(AssignedTrack) then
  begin
    {saya merubah dengan melakukan Clear pada List FassignedTrack : Aldy}
    //FAssignedTrack.Clear;

    for i := FAssignedTrack.Count - 1 downto 0 do
    begin
      //aObj := FAssignedTrack.Items[i];
      FAssignedTrack.Delete(i);
    end;

    FAssignedTrack.Free;
  end;

  inherited;
end;

procedure TT3Radar.Draw(aCnv: tCanvas);
begin
  inherited;

end;


procedure TT3Radar.Initialize;
var
  blindZ : TBlindZoneVisual;
  i : integer;
begin
  inherited;

  if Assigned(UnitDefinition) and (UnitDefinition is TRadar_On_Board) then
    FRadarDefinition := TRadar_On_Board(UnitDefinition);

  if Assigned(FRadarDefinition) then begin
    DetectionRange := FRadarDefinition.FDef.Max_Unambig_Detect_Range;
    DetailDetectionRange := FRadarDefinition.FDef.Detection_Range;
    InstanceName  := FRadarDefinition.FData.Instance_Identifier;
    InstanceIndex := FRadarDefinition.FData.Radar_Instance_Index;
    FSpotNumber := FRadarDefinition.FDef.Radar_Spot_Number;
    FECCMType   := FRadarDefinition.FDef.ECCM_Type;

    if FRadarDefinition.FBlind.Count > 0 then begin
      SetLength(BZStartAngle,FRadarDefinition.FBlind.Count);
      SetLength(BZEndAngle,FRadarDefinition.FBlind.Count);

      for i := 0 to FRadarDefinition.FBlind.Count - 1 do begin
        blindZ := TBlindZoneVisual.Create;
        BZStartAngle[i] := TBlind_Zone(FRadarDefinition.FBlind.Items[i]).FData.Start_Angle;
        BZEndAngle[i]   := TBlind_Zone(FRadarDefinition.FBlind.Items[i]).FData.End_Angle;
        blindZ.StartAngle := BZStartAngle[i];
        blindZ.EndAngle   := BZEndAngle[i];
        FBlindZoneViews.Add(blindZ);
      end;
    end;

    // update rel start start-end angle
    for I := 0 to FBlindZoneViews.Count - 1 do begin
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

  // jika ada channel FCR brarti dia adalah radar fire control
  if RadarDefinition.FDef.Num_FCR_Channels > 0 then
  begin
    FAssignedTrack := TList.Create;
  end;
end;

function TT3Radar.InsideBlindZone(aObject: TSimObject): boolean;
var
  i : integer;
  blindZ : TBlindZoneVisual;
  bearing : double;
begin
  inherited;

  bearing := CalcBearing(FPosition.X,FPosition.Y,
           TT3PlatformInstance(aObject).getPositionX,
           TT3PlatformInstance(aObject).getPositionY);

  Result := false;

  // periksa apakah didalam area blind zone
  if FBlindZoneViews.Count > 0 then begin
    for I := 0 to FBlindZoneViews.Count - 1 do begin

      blindZ := TBlindZoneVisual(FBlindZoneViews.Items[i]);
      Result := DegComp_IsBeetwen(bearing, blindZ.RelativeStartAngle, blindZ.RelativeEndAngle);
      {
      if (blindZ.RelativeStartAngle > blindZ.RelativeEndAngle) then begin
        if (bearing > blindZ.RelativeStartAngle) or
           (bearing < blindZ.RelativeEndAngle) then begin
            result := true;
            break;
        end;
      end
      else
      begin
        if (bearing < blindZ.RelativeStartAngle) and
         (bearing > blindZ.RelativeEndAngle) then
        result := true;
        break;
      end;
      }
    end;
  end else
    result := false;
end;

function TT3Radar.InsideRange(aObject: TSimObject): boolean;
var
  range : double;
begin
  inherited;

  range   := CalcRange(FPosition.X,FPosition.Y,
           aObject.getPositionX,aObject.getPositionY);

  result := range <= DetectionRange;
end;

function TT3Radar.InsideDetailRange(aObject : TSimObject) : Boolean;
var
  range : Double;
begin
  inherited;

  range   := CalcRange(FPosition.X, FPosition.Y,
           aObject.getPositionX, aObject.getPositionY);

  //tambahan sementara 310212012
//  Result := (range <= DetectionRange);
  Result := (range <= DetailDetectionRange);

  {if Result then
  begin
    if aObject is TT3PlatformInstance then
    begin
      with TT3PlatformInstance(aObject) do
      begin
        rec.IFF_Capability := RadarDefinition.FDef.IFF_Capability;
        rec.Altitude_Data_Capability := RadarDefinition.FDef.Altitude_Data_Capability;
        rec.Ground_Speed_Data_Capability := RadarDefinition.FDef.Ground_Speed_Data_Capability;
        rec.Heading_Data_Capability := RadarDefinition.FDef.Heading_Data_Capability;
        rec.Plat_Type_Recog_Capability := RadarDefinition.FDef.Plat_Type_Recog_Capability;
        rec.Plat_Class_Recog_Capability := RadarDefinition.FDef.Plat_Class_Recog_Capability;
        rec.Track_ID := True;

        DetailedDetectionShowed := rec;
      end;
    end;
  end; }
end;

function TT3Radar.InsideJammedEffect : Boolean;
begin
  if FRNJammOperationalStatus = JammedOn then
    Result := True
  else
    Result := False;
end;

function TT3Radar.InsideVerticalCoverage(aObject: TSimObject): boolean;
var
  v : TT3Vehicle;
  min1,max1,min2,max2, range : double;
  AntenaHeight, RadarAntena, SubRadarAntena   : Double;
begin
  inherited;
  Result := False;

  // periksa apakah dalam jangkauan vertikal radar
  if FRadarDefinition.FRadar_Vertical.isDataCoverageExist then
  begin
    if not(Assigned(aObject)) and not(aObject is TT3PlatformInstance) then
      Exit;

    range := CalcRange(FPosition.X,FPosition.Y, TT3PlatformInstance(aObject).getPositionX,
             TT3PlatformInstance(aObject).getPositionY);

    FRadarDefinition.FRadar_Vertical.GetCoverage(range,min1,max1,min2,max2);

    if Assigned(FRadarDefinition) then
    begin
      RadarAntena := FRadarDefinition.FData.Rel_Antenna_Height;
      SubRadarAntena := FRadarDefinition.FData.Submerged_Antenna_Height;
    end
    else
    begin
      RadarAntena    :=  0;
      SubRadarAntena := 0;
    end;

    //Radar Antena Height
    v := FParent as TT3Vehicle;
    if (Assigned(v)) then
    begin
      if RadarAntena = 0 then
      begin
        RadarAntena :=  v.VehicleDefinition.FData.Height;
      end;

      if (v.TrackDomain = vhdAir) or (v.PlatformDomain = vhdAir) then
      begin
        AntenaHeight := Sqrt(Abs(17 * (((RadarAntena + SubRadarAntena - 1000) * C_Feet_To_Meter) + v.Altitude)));
      end
      else if (v.TrackDomain = vhdSurface) or (v.PlatformDomain = vhdSurface)
               or (v.TrackDomain = vhdLand) or (v.PlatformDomain = vhdLand)
               or (v.TrackDomain = vhdAmphibious) or (v.PlatformDomain = vhdAmphibious) then
      begin
        AntenaHeight := Sqrt(Abs(17 * ((RadarAntena + SubRadarAntena - 1000)* C_Feet_To_Meter)));
      end
      else if (v.TrackDomain = vhdSubsurface) or (v.PlatformDomain = vhdSubsurface) then
      begin
        AntenaHeight := Sqrt(Abs(17 * (((RadarAntena + SubRadarAntena - 1000) * C_Feet_To_Meter) - v.Altitude)));
      end
      else
      begin
        AntenaHeight := Sqrt(Abs(17 * (((RadarAntena + SubRadarAntena - 1000) * C_Feet_To_Meter) + v.Altitude)));
      end;
    end
    else
      AntenaHeight := Sqrt(Abs(17 * ((RadarAntena + SubRadarAntena  - 1000) * C_Feet_To_Meter)));

    // PositionZ belum tau satuannya -> harus diubah dulu ke feet sebelum
    // di bandingkan dengan min dan max
    if (TT3PlatformInstance(aObject).Altitude > ((min1 * C_Feet_To_Meter)+ AntenaHeight)) and
       (TT3PlatformInstance(aObject).Altitude > ((min2 * C_Feet_To_Meter)+ AntenaHeight)) and
       (TT3PlatformInstance(aObject).Altitude < ((max1 * C_Feet_To_Meter)+ AntenaHeight)) and
       (TT3PlatformInstance(aObject).Altitude < ((max2 * C_Feet_To_Meter)+ AntenaHeight)) then
    begin
      result := true;
    end;
  end
  else
  begin
    // dianggap semua ketinggian/kedalaman tercover
    // karena tidak ada data vertical coverage
    result := true;
  end;
end;

function TT3Radar.InsideOtherMeasurement(aObject : TSimObject) : boolean;
var
  maxLOS   : Double;
  range, AtmosRefract, HorizonFactor : Double;
  InsideDomain : boolean;
begin
 //add andik
  InsideDomain := true;

  if aObject is TT3PlatformInstance then
  begin
    case TT3PlatformInstance(aObject).PlatformDomain of     //mk 19042012
      2:
        begin
          if TT3PlatformInstance(aObject).Altitude <> 0 then
            InsideDomain := false
          else
            InsideDomain := True;
        end;
    end;
  end;

  if InsideDomain then
  begin
    InsideDomain := false;

    if Assigned(Environment) then
    begin
      AtmosRefract := Environment.FData.Atmospheric_Refract_Modifier / 100;
    end
    else
    begin
      AtmosRefract := 1;
    end;

    if Assigned(RadarDefinition) then
    begin
      HorizonFactor := RadarDefinition.FDef.Radar_Horizon_Factor;
    end
    else
    begin
      HorizonFactor := 1;
    end;

    maxLOS := (GetMaxLOSRange(aObject)* 1000 * C_Meter_To_NauticalMile)
              * AtmosRefract * HorizonFactor;

    range  := CalcRange(Parent.PosX, Parent.PosY, aObject.PosX, aObject.PosY);

    if range < maxLOS then
      InsideDomain := True;
  end;

  result := InsideDomain;
end;

function TT3Radar.GetMaxLOSRange(aObject: TSimObject): Double;
var
  basicLOS : Double;
  TargetHeight, AntenaHeight,
  RadarAntena, SubRadarAntena   : Double;
  v : TT3Vehicle;
begin
  v := FParent as TT3Vehicle;

  Result := 0;
  TargetHeight  := 0;

  {$REGION ' Pengecekan Kapal Parent '}
  if not (Assigned(v)) then
    Exit;

  if not (v is TT3Vehicle) then
    Exit;

  if ((TT3PlatformInstance(v).TrackDomain = vhdSubsurface)
      or (TT3PlatformInstance(v).PlatformDomain = vhdSubsurface))
      and (TT3PlatformInstance(v).Altitude <> 0) then
    Exit;
  {$ENDREGION}

  {$REGION ' Pengecekan Kapal Target '}
  if not (Assigned(aObject)) then
    Exit;

  if not( aObject is TT3PlatformInstance) then
    Exit;

  if ((TT3PlatformInstance(aObject).TrackDomain = vhdSubsurface)
      or (TT3PlatformInstance(aObject).PlatformDomain = vhdSubsurface))
      and (TT3PlatformInstance(aObject).Altitude <> 0) then
    Exit;
  {$ENDREGION}

  if Assigned(FRadarDefinition) then
  begin
    RadarAntena := FRadarDefinition.FData.Rel_Antenna_Height;
    SubRadarAntena := FRadarDefinition.FData.Submerged_Antenna_Height;
  end
  else
  begin
    RadarAntena := 0;
    SubRadarAntena := 0;
  end;

  if aObject is TT3Vehicle then
  begin
    {$REGION ' Jika target vehicle '}
    if (TT3Vehicle(aObject).TrackDomain = vhdAir) or (TT3Vehicle(aObject).PlatformDomain = vhdAir) then
    begin
      TargetHeight := Sqrt(Abs(17 * ((TT3Vehicle(aObject).VehicleDefinition.FData.Height * C_Feet_To_Meter) +
                      TT3Vehicle(aObject).Altitude)));
    end
    else
    if (TT3Vehicle(aObject).TrackDomain = vhdSurface) or (TT3Vehicle(aObject).PlatformDomain = vhdSurface)
        or (TT3Vehicle(aObject).TrackDomain = vhdLand) or (TT3Vehicle(aObject).PlatformDomain = vhdLand)
        or (TT3Vehicle(aObject).TrackDomain = vhdAmphibious) or (TT3Vehicle(aObject).PlatformDomain = vhdAmphibious) then
    begin
      TargetHeight := Sqrt(Abs(17 * (TT3Vehicle(aObject).VehicleDefinition.FData.Height * C_Feet_To_Meter)));
    end
    else
    if (TT3Vehicle(aObject).TrackDomain = vhdSubsurface) or (TT3Vehicle(aObject).PlatformDomain = vhdSubsurface) then
    begin
      TargetHeight := Sqrt(Abs(17 * ((TT3Vehicle(aObject).VehicleDefinition.FData.Height * C_Feet_To_Meter) -
                      TT3Vehicle(aObject).Altitude)));
    end
    else
    begin
      TargetHeight := Sqrt(Abs(17 * ((TT3Vehicle(aObject).VehicleDefinition.FData.Height * C_Feet_To_Meter) +
                      TT3Vehicle(aObject).Altitude)));
    end;
    {$ENDREGION}
  end
  else
  begin
    {$REGION ' Jika target selain vehicle '}
    if aObject is TT3PlatformInstance then
      TargetHeight := Sqrt(Abs(17 * TT3PlatformInstance(aObject).Altitude));
    {$ENDREGION}
  end;

  if (Assigned(v)) then
  begin
    if (v.TrackDomain = vhdAir) or (v.PlatformDomain = vhdAir) then
    begin
      AntenaHeight := Sqrt(Abs(17 * (((RadarAntena + SubRadarAntena + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter) + v.Altitude)));
    end
    else
    if (v.TrackDomain = vhdSurface) or (v.PlatformDomain = vhdSurface)
        or (v.TrackDomain = vhdLand) or (v.PlatformDomain = vhdLand)
        or (v.TrackDomain = vhdAmphibious) or (v.PlatformDomain = vhdAmphibious) then
    begin
      AntenaHeight := Sqrt(Abs(17 * ((RadarAntena + SubRadarAntena + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter)));
    end
    else
    if (v.TrackDomain = vhdSubsurface) or (v.PlatformDomain = vhdSubsurface) then
    begin
      AntenaHeight := Sqrt(Abs(17 * (((RadarAntena + SubRadarAntena + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter) - v.Altitude)));
    end
    else
    begin
      AntenaHeight := Sqrt(Abs(17 * (((RadarAntena + SubRadarAntena + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter) + v.Altitude)));
    end;
  end
  else
    AntenaHeight := Sqrt(Abs(17 * ((RadarAntena + SubRadarAntena) * C_Feet_To_Meter)));

  basicLOS := TargetHeight + AntenaHeight;

  Result := basicLOS;
end;

procedure TT3Radar.SetControlMode(const Value: TRadarControlMode);
begin
  FControlMode := Value;
  case Value of
    rcmOff        : SetOperationalStatus(sopOff);
    rcmTrack      : SetOperationalStatus(sopOn);
    rcmSearchTrack: SetOperationalStatus(sopOn);
  end;

  if Assigned(FOnControlMode) then
    FOnControlMode(self,value);
end;

//aldy set mode radar tanpa panggil property
procedure TT3Radar.SetStaticControlMode(const Value: TRadarControlMode);
begin
  FControlMode := Value;
  case Value of
    rcmOff        : SetOperationalStatus(sopOff);
    rcmTrack      : SetOperationalStatus(sopOn);
    rcmSearchTrack: SetOperationalStatus(sopOn);
  end;
end;

function TT3Radar.TargetTypeEligiblity(aTarget: TObject): boolean;
begin
  inherited;

  Result := True;

  if aTarget is TT3Vehicle then
  begin
    if TT3Vehicle(aTarget).VehicleDefinition.FData.Detectability_Type = 1 then  //17042012 mk
      Result := False;
  end;
end;

procedure TT3Radar.SetECCM(const Value: boolean);
begin
  FECCM := Value;
end;

procedure TT3Radar.SetEndScan(const Value: double);
begin
  FEndScan := Value;
end;

procedure TT3Radar.SetRNJammOperationalStatus(
  const Value: TRNJammOperasionalStatus);
begin
  FRNJammOperationalStatus := value;
  SetRNJammStatus(FOperationalStatus, value);
end;

procedure TT3Radar.SetRNJammStatus(const Value: TSensorOperationalStatus;
  const Jamm: TRNJammOperasionalStatus);
begin
  FOperationalStatus := Value;

  if Assigned(OnSensorOperationalStatus) then
    OnSensorOperationalStatus(Self, Value);

  if Value = sopOff then
    if Assigned(OnSensorRemoved) then
      OnSensorRemoved(self);

  if Jamm = JammedOn then
  begin
    TT3Radar(Self).RemoveAssignedtrack;
  end;
end;

procedure TT3Radar.SetOnControlMode(const Value: TOnRadarControlMode);
begin
  FOnControlMode := Value;
end;

procedure TT3Radar.SetOperationalStatus(const Value: TSensorOperationalStatus);
begin
  inherited;

  if (Value = sopOff) or (Value = sopDamage) then
  begin
    RemoveAssignedtrack;
  end;
end;

procedure TT3Radar.SetScanDegree(const Value: double);
begin
  FScanDegree := Value;
end;

procedure TT3Radar.SetShowScanSector(const Value: boolean);
begin
  FShowScanSector := Value;
end;

procedure TT3Radar.UpdateAssignedtrack;
var
  AssignTrack : TSimObject;
  platAssigned : TT3PlatformInstance;
  Controlled   : TT3PlatformInstance;
  I: Integer;
  distance : Double;
  inBlindZone : Boolean;
begin
  if not Assigned(AssignedTrack) then
    Exit;

  if AssignedTrack.Count <= 0 then
    Exit;

  Controlled := Self.Parent as TT3PlatformInstance;

  for I := AssignedTrack.Count - 1 downto 0  do
  begin
    AssignTrack := Assignedtrack.Items[I];
    if not Assigned(AssignTrack) then
      Continue;

    if AssignTrack is TT3DetectedTrack then
      platAssigned := TT3PlatformInstance(TT3DetectedTrack(AssignTrack).TrackObject)
    else if AssignTrack is TT3PlatformInstance then
      platAssigned := TT3PlatformInstance(AssignTrack)
    else
      platAssigned := nil;

    if not Assigned(platAssigned) then
      Continue;

    distance := CalcRange(platAssigned.getPositionX, platAssigned.getPositionY,
                Controlled.getPositionX, Controlled.getPositionY);
    //distance := CalcRange((Assignedtrack.Items[I]).getPositionX, (Assignedtrack.Items[I]).getPositionY, Controlled.getPositionX, Controlled.getPositionY);
    inBlindZone := InsideBlindZone(platAssigned);

    if (distance > DetectionRange) or (inBlindZone) or (FEmconOperationalStatus = EmconOn)
        or (platAssigned.FreeMe) or (platAssigned.Dormant) or (Controlled.FreeMe) then
    begin
      AssignTrack.IsAssigned := false;
      //Assignedtrack.Items[I].IsAssigned := false;
      AssignedTrack.Delete(I);

      if Assigned(OnRemoveDetected) then
        OnRemoveDetected(Self);

      if Assigned(OnFireControlUpdated) then
        OnFireControlUpdated(Self);
    end;
  end;
end;

procedure TT3Radar.Move(const aDeltaMs: double);
begin
  inherited;

  UpdateAssignedtrack;
end;

procedure TT3Radar.RemoveAssignedtrack;
var
  AssignTrack : TSimObject;
  I: Integer;
begin
  if not Assigned(AssignedTrack) then
    Exit;

  if AssignedTrack.Count <= 0 then
    Exit;

  for I := 0 to AssignedTrack.Count - 1 do
  begin
    AssignTrack := Assignedtrack.Items[I];
    if not Assigned(AssignTrack) then
      Continue;

    AssignTrack.IsAssigned := false;
    AssignedTrack.Delete(I);

    if Assigned(OnRemoveDetected) then
      OnRemoveDetected(Self);

    if Assigned(OnFireControlUpdated) then
      OnFireControlUpdated(Self);
  end;
end;

procedure TT3Radar.SetOnRemoveDetected(const Value : TNotifyEvent);
begin
  FOnRemoveDetected := Value;
end;

procedure TT3Radar.SetOnfireControlUpdated(const value : TNotifyEvent);
begin
  FOnFireControlUpdated := value;
end;

procedure TT3Radar.SetStartScan(const Value: double);
begin
  FStartScan := Value;
end;

procedure TT3Radar.UpdateVisual;
begin
  inherited;

  if Assigned(FParent) then begin
    FSwapLine.Heading:= TT3PlatformInstance(FParent).Course;
    FSwapLine.Ranges := DetectionRange;
    FSwapLine.mX     := FParent.getPositionX;
    FSwapLine.mY     := FParent.getPositionY;
    FSwapLine.Angle  := FScanDegree;
    FSwapLine.ConvertCoord(Converter);
  end;
end;

function TT3Radar.GetSnapshotData : _SS_TT3Radar ;
var
  I     : integer ;
  ss    : _SS_TT3Radar ;
  rc    : TRadar_Vertical_Coverage ;
begin
  ss.S                 := TT3Sensor(Self).GetSnapshotData;
  with RadarDefinition do
  begin
    ss.R.FData         := FData ;
    ss.R.FDef          := FDef ;
    ss.R.FPattern      := FPattern ;
    ss.R.FType         := FType ;
    ss.R.FInterval     := FInterval ;
    ss.R.FECCM_Type    := FECCM_Type;

    if FNote <> nil then begin
      ss.R.FNote         := FNote.FData ;
    end;
    if FBlind_Zone <> nil then begin
       ss.R.FBlind_Zone.FData := FBlind_Zone.FData ;
    end;
    if FBlind <> nil then begin
       SetLength(ss.R.FBlind,FBlind.Count);
       for I := 0 to FBlind.Count - 1 do begin
          ss.R.FBlind[i].FData := TBlind_Zone(FBlind[i]).FData ;
       end;
    end;
    if FScripted_Pattern <> nil then begin
       SetLength(ss.R.FScripted_Pattern,FScripted_Pattern.Count);
       for I := 0 to FScripted_Pattern.Count - 1 do begin
          ss.R.FScripted_Pattern[i].Event := TPattern_Radar(FScripted_Pattern[i]).Event.FData ;
          ss.R.FScripted_Pattern[i].Pattern := TPattern_Radar(FScripted_Pattern[i]).Pattern.FData ;
       end;
    end;
    if FScripted_Radar <> nil then begin
       SetLength(ss.R.FScripted_Pattern,FScripted_Radar.Count);
       for I := 0 to FScripted_Radar.Count - 1 do begin
          ss.R.FScripted_Radar[i].Event := TScripted_Radar(FScripted_Radar[i]).Event.FData ;
          ss.R.FScripted_Radar[i].Behav := TScripted_Radar(FScripted_Radar[i]).Behav.FData ;
       end;
    end;
    if FRadar_Vertical <> nil then begin
       SetLength(ss.R.FRadar_Vertical,FRadar_Vertical.itemCount);
       for I := 0 to FRadar_Vertical.itemCount - 1 do begin
           rc := FRadar_Vertical.getRadar_Vertical_Coverage(I);
           if rc <> nil then
              ss.R.FRadar_Vertical[i].FData := rc.FData ;
       end;
    end;
  end;


  ss.R.FVehicle.FData           := RadarDefinition.FVehicle.FData ;
  ss.R.FVehicle.FPlatform_Ident := RadarDefinition.FVehicle.FPlatform_Ident ;
  ss.R.FVehicle.FHeliLimitation := RadarDefinition.FVehicle.FHeliLimitation ;

  ss.ControlMode     := byte(ControlMode);
  ss.ECCM            := ECCM ;
  ss.ShowScanSector  := ShowScanSector ;
  ss.StartScan       := StartScan ;
  ss.EndScan         := EndScan ;
  ss.ScanDegree      := ScanDegree ;
  Result := ss ;
end;

procedure TT3Radar.SetSnapshotData(const ss : _SS_TT3Radar);
begin
  TT3Sensor(Self).SetSnapshotData(ss.S);
  RadarDefinition.FData     := ss.R.FData     ;
  RadarDefinition.FDef      := ss.R.FDef      ;
  RadarDefinition.FPattern  := ss.R.FPattern  ;
  RadarDefinition.FType     := ss.R.FType     ;
  RadarDefinition.FInterval := ss.R.FInterval ;
  RadarDefinition.FECCM_Type:= ss.R.FECCM_Type;
  RadarDefinition.FVehicle.FData           := ss.R.FVehicle.FData             ;
  RadarDefinition.FVehicle.FPlatform_Ident := ss.R.FVehicle.FPlatform_Ident   ;
  RadarDefinition.FVehicle.FHeliLimitation := ss.R.FVehicle.FHeliLimitation   ;
  ControlMode      := TRadarControlMode(ss.ControlMode);
  ECCM             := ss.ECCM           ;
  ShowScanSector   := ss.ShowScanSector ;
  StartScan        := ss.StartScan      ;
  EndScan          := ss.EndScan        ;
  ScanDegree       := ss.ScanDegree     ;
end;

procedure TT3Radar.SetSpotNumber(const Value: Integer);
begin
  FSpotNumber := Value;
end;

end.
