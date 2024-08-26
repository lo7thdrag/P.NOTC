unit uT3RadarNoiseJammer;

interface

uses uT3CounterMeasure, uDBAsset_Countermeasure, uSnapshotData,
     uT3UnitContainer, uT3Missile, uT3Radar, tttData, uT3Unit,
     Classes, Math, uSimObjects;

type
  TT3RadarNoiseJammerOnVehicle = class(TT3CounterMeasure)
  private
    FRadarJammerDefinition : TJammer_On_Board;
    FJamTargeting   : TNoiseJammerTargeting;

    FTargetJamming : TList;
    FDeviceEntities  : TT3UnitContainer;

    FJamBearing                : Double;
    FJamSpotNumber             : Integer;
    FJamCenterFreq             : Double;
    FJamBandWidth              : Double;
    FJamReqTargetRadarId       : integer;
    FJamReqTargetRadarOwnId    : integer;
    FOnJammingSuccess          : TOnRNJammingSuccess;

    FQuantity     : Integer;
    FPowerDensity : Double;
    FMaxEffectiveRange  : Double;
    FJammerType         : TJammerType;
    FMaximumSectorWidth : Double;
    FUpperFrequencyLimit : Double;
    FLowerFrequencyLimit : Double;
    FUpperVerticalCoverage : Double;
    FLowerVerticalCoverage : Double;
    FRangeEffective : Double;

    {$IFDEF SERVER}
    function InsideSuitTarget(aObject : TSimObject) : boolean;
    function InsideSpotNumber(aObject : TSimObject) : boolean;
    function InsideJamRange(aObject : TSimObject) : boolean;
    function InsideBearing(aObject : TSimObject) : boolean;
    function InsideFreqRange(aObject : TSimObject) : boolean;
    function InsideSectorWidth(aObject : TSimObject) : boolean;
    function InsideVerticalLimits(aObject : TSimObject) : boolean;
    function CeckJammResistant(aObject : TSimObject) : boolean;
    function CeckAntiJammCapable(aObject : TSimObject) : boolean;
    {$ENDIF}

    procedure SetJamBearing(const Value: Double);
    procedure SetJamCenterFreq(const Value: Double);
    procedure SetJamBandWidth(const Value: Double);
    procedure SetJamSpotNumber(const Value: integer);
    procedure SetJamReqTargetRadarId(const Value: integer);
    procedure SetJamReqTargetRadarOwnId(const Value: integer);

    procedure SetJamTargeting(const Value: TNoiseJammerTargeting);
    procedure SetDeviceEntities(const Value: TT3UnitContainer);

    procedure SetOnJammingSuccess(const Value: TOnRNJammingSuccess);

  protected
    procedure SetStatus(const Value: TECMStatus); override;

  public
    constructor Create; override;
    destructor  Destroy; override;

    procedure Initialize; override;
    procedure Move(const aDeltaMs : double); override;
    procedure ApplyJammedEffect(aJammedObject : TObject; Value : Boolean);

    function  EfffectiveRange(aObject : TSimObject): Double;
    function  GetSnapshotData : _SS_RadarNoiseJammerOnVehicle ;
    procedure SetSnapshotData(const ss : _SS_RadarNoiseJammerOnVehicle);
    //procedure ListJamming(aObject : TT3PlatformInstance);


    property DeviceEntities   : TT3UnitContainer read FDeviceEntities write SetDeviceEntities;
    property JamTargeting  : TNoiseJammerTargeting read FJamTargeting write SetJamTargeting
     default ettNJBarrage;

    property JamBearing    : Double read FJamBearing write SetJamBearing;
    property JamSpotNumber : Integer read FJamSpotNumber write SetJamSpotNumber default 10000;
    property JamCenterFreq : Double read FJamCenterFreq write SetJamCenterFreq;
    property JamBandWidth  : Double read FJamBandWidth write SetJamBandWidth;
    property JamReqTargetRadarId : integer read FJamReqTargetRadarId write SetJamReqTargetRadarId default 0;
    property JamReqTargetRadarOwnId : integer read FJamReqTargetRadarOwnId write SetJamReqTargetRadarOwnId default 0;

    property TargetJamming: TList read FTargetJamming;
    property OnJammingSuccess : TOnRNJammingSuccess read FOnJammingSuccess write SetOnJammingSuccess;

    property RadarJammerDefinition : TJammer_On_Board read FRadarJammerDefinition
       write FRadarJammerDefinition;
    property PowerDensity : Double read FPowerDensity write FPowerDensity;
    property MaxEffectiveRange : Double read FMaxEffectiveRange write FMaxEffectiveRange;
    property JammerType : TJammerType read FJammerType write FJammerType;
    property MaximumSectorWidth : Double read FMaximumSectorWidth write FMaximumSectorWidth;
    property UpperFrequencyLimit : Double read FUpperFrequencyLimit write FUpperFrequencyLimit;
    property LowerFrequencyLimit : Double read FLowerFrequencyLimit write FLowerFrequencyLimit;
    property UpperVerticalCoverage : Double read FUpperVerticalCoverage write FUpperVerticalCoverage;
    property LowerVerticalCoverage : Double read FLowerVerticalCoverage write FLowerVerticalCoverage;
    property Quantity : Integer read FQuantity write FQuantity;
    property RangeEffective : Double read FRangeEffective write FrangeEffective;
  end;

implementation

uses uT3Vehicle, uT3Sensor, uBaseCoordSystem;

{ TT3RadarNoiseJammerOnVehicle }

procedure TT3RadarNoiseJammerOnVehicle.ApplyJammedEffect(
  aJammedObject: TObject; Value : Boolean);
var
  i : integer;
  AssigedTrack : TT3PlatformInstance;
  {$IFDEF SERVER}
  rJammedObjParameter : TJammedObjectParameter;
  {$ENDIF}
begin
  if aJammedObject is TT3Radar then
  begin
    if Value then
    begin
      i := Self.FTargetJamming.IndexOf(TT3Radar(aJammedObject));
      if i < 0 then
      begin
        FTargetJamming.Add(TT3Radar(aJammedObject));

        i := TT3Radar(aJammedObject).JammedBy.IndexOf(Self);
        if i < 0 then
        begin
          TT3Radar(aJammedObject).RNJammOperationalStatus := JammedOn;

          TT3Radar(aJammedObject).JammedBy.Add(Self);

          if TT3Radar(aJammedObject).AssignedTrack <> nil then
          begin
            for i := 0 to TT3Radar(aJammedObject).AssignedTrack.Count - 1 do
            begin
              AssigedTrack := TT3Radar(aJammedObject).AssignedTrack.Items[i];
              AssigedTrack.IsAssigned := False;
            end;

            TT3Radar(aJammedObject).AssignedTrack.Clear;

            if Assigned(TT3Radar(aJammedObject).OnFireControlUpdated) then
            begin
              TT3Radar(aJammedObject).OnFireControlUpdated(TT3Radar(aJammedObject));
            end;
          end;

          {$IFDEF SERVER}
          if Assigned(FOnJammingSuccess) then
          begin
            rJammedObjParameter.PJammedObjectID := TT3Radar(aJammedObject).InstanceIndex;
            rJammedObjParameter.PJammedObjectOwnerID := TT3Vehicle(TT3Radar(aJammedObject).Parent).InstanceIndex;
            rJammedObjParameter.PJammedObjectType := jotFCR;

            FOnJammingSuccess(Self, rJammedObjParameter, Value);
          end;
          {$ENDIF}
        end;
      end;
    end
    else
    begin
      i := TT3Radar(aJammedObject).JammedBy.IndexOf(Self);
      if i >= 0 then
      begin
        TT3Radar(aJammedObject).RNJammOperationalStatus := JammedOff;

        TT3Radar(aJammedObject).JammedBy.Delete(i);
      end;

      i := Self.FTargetJamming.IndexOf(TT3Radar(aJammedObject));
      if i >= 0 then
      begin
        FTargetJamming.Delete(i);

        {$IFDEF SERVER}
        if Assigned(FOnJammingSuccess) then
        begin
          rJammedObjParameter.PJammedObjectID := TT3Radar(aJammedObject).InstanceIndex;
          rJammedObjParameter.PJammedObjectOwnerID := TT3Vehicle(TT3Radar(aJammedObject).Parent).InstanceIndex;
          rJammedObjParameter.PJammedObjectType := jotFCR;

          FOnJammingSuccess(Self, rJammedObjParameter, Value);
        end;
        {$ENDIF}
      end;
    end;
  end;
end;

{$IFDEF SERVER}
function TT3RadarNoiseJammerOnVehicle.InsideJamRange(
  aObject: TSimObject): boolean;
var
  range, EfffectiveJammerRange : double;
begin
  range := CalcRange(FPosition.X,FPosition.Y,
                     aObject.getPositionX,aObject.getPositionY);

  { hitung range effektif jammer }
  EfffectiveJammerRange := EfffectiveRange(aObject);

  result := range <= EfffectiveJammerRange;

//  if not(result) then
//  begin
//    if Assigned(OnLogEventStr) then
//      OnLogEventStr('Target not in range of noise jammer');
//  end;
end;

function TT3RadarNoiseJammerOnVehicle.InsideBearing(
  aObject: TSimObject): boolean;
var
  bearing : Double;
begin
  { Cek bearing target = bearing jammer request }
  bearing := CalcBearing(FPosition.X, FPosition.Y,
             aObject.getPositionX, aObject.getPositionY);

  if JamTargeting <> ettNJTrack then
  begin
    if Round(bearing) = Round(JamBearing) then
      result := True
    else begin
      result := False;
    end;
  end
  else
    result := True;

//  if not(result) then
//  begin
//    if Assigned(OnLogEventStr) then
//      OnLogEventStr('Not suit bearing target to noise jammer');
//  end;
end;

function TT3RadarNoiseJammerOnVehicle.InsideFreqRange(
  aObject: TSimObject): boolean;
var
  FreqRadar, UpperFreqReq, LowerFreqReq : Double;
begin
  { cek frequensinya apakah masuk dalam batas UPPER dan LOWER frequensi limit jammmer }
  FreqRadar := TT3Radar(aObject).RadarDefinition.FDef.Frequency;

  { untuk tipe jammer frequency dan jammer barrage }
  if (JamTargeting = ettNJFreq) or (JamTargeting = ettNJBarrage) then
  begin
    UpperFreqReq := JamCenterFreq + (JamBandWidth/2);
    LowerFreqReq := JamCenterFreq - (JamBandWidth/2);
    if (FreqRadar <= UpperFreqReq) and (FreqRadar >= LowerFreqReq)then
      Result := True
    else
      Result := False;
  end
  else
  { untuk tipe jammer track dan jammer spot number }
  begin
    if (FreqRadar <= UpperFrequencyLimit) and (FreqRadar >= LowerFrequencyLimit)then
      Result := True
    else
      Result := False;
  end;

//  if not(result) then
//  begin
//    if Assigned(OnLogEventStr) then
//      OnLogEventStr('Not in UPPER and LOWER FREQUENCY noise jammer');
//  end;
end;

function TT3RadarNoiseJammerOnVehicle.InsideSectorWidth(
  aObject: TSimObject): boolean;
var
  bearing, HeadingJam, StartAngleJam, EndAngleJam : Double;
begin
  { Cek apakah target berada di dalam batas MAKSIMUM SEKTOR WIDTH }
  bearing := CalcBearing(FPosition.X, FPosition.Y,
             aObject.getPositionX, aObject.getPositionY);

  HeadingJam    := TT3Vehicle(Self.Parent).Heading;
  EndAngleJam   := HeadingJam + (RadarJammerDefinition.FDef.Max_Sector_Width/2);
  StartAngleJam := HeadingJam - (RadarJammerDefinition.FDef.Max_Sector_Width/2);

  if EndAngleJam > 360 then
    EndAngleJam := EndAngleJam - 360;

  if StartAngleJam < 0 then
    StartAngleJam := StartAngleJam + 360;

  if DegComp_IsBeetwen(bearing, StartAngleJam, EndAngleJam) then
    result := True
  else
    result := False;

//  if not(result) then
//  begin
//    if Assigned(OnLogEventStr) then
//      OnLogEventStr('Not in SECTOR WIDTH noise jammer');
//  end;
end;

function TT3RadarNoiseJammerOnVehicle.InsideSpotNumber(
  aObject: TSimObject): boolean;
begin
  if JamTargeting = ettNJSpotNum then
  begin
    if TT3Radar(aObject).SpotNumber = Self.JamSpotNumber then
      Result := True
    else begin
      Result := False;
    end;
  end
  else
    Result := True;

//  if not(result) then
//  begin
//    if Assigned(OnLogEventStr) then
//        OnLogEventStr('Not suit spot number target to noise jammer by spot number');
//  end;
end;

function TT3RadarNoiseJammerOnVehicle.InsideSuitTarget(
  aObject: TSimObject): boolean;
begin
  if JamTargeting = ettNJTrack then
  begin
    if TT3Vehicle(aObject).InstanceIndex = Self.JamReqTargetRadarOwnId then
      Result := True
    else begin
      Result := False;
    end;
  end else
    Result := True;

//  if not(result) then
//  begin
//    if Assigned(OnLogEventStr) then
//        OnLogEventStr('Not suit target to noise jammer by track');
//  end;
end;

function TT3RadarNoiseJammerOnVehicle.InsideVerticalLimits(
  aObject: TSimObject): boolean;
var
  RangeJammer, vAltitude, minAltitude, maxAltitude, sumLower,
  sumUpper, degLower, degUpper : Double;
begin
  { cek apakah target berada di dalam VERTICAL COVERAGE LIMITS }
  degLower := RadarJammerDefinition.FDef.Lower_Vert_Coverage_Angle;
  degUpper := RadarJammerDefinition.FDef.Upper_Vert_Coverage_Angle;

  { hitung range effektif jammer }
  RangeJammer := EfffectiveRange(aObject);

  sumLower := Abs(RangeJammer*(Tan(degLower)));
  sumUpper := Abs(RangeJammer*(TAn(degUpper)));

  vAltitude := RadarJammerDefinition.FData.Antenna_Height + TT3Vehicle(aObject).Altitude;
  minAltitude := vAltitude - sumLower;
  maxAltitude := vAltitude + sumUpper;

  if (vAltitude >= minAltitude) and (vAltitude <= maxAltitude) then
    Result := True
  else
    Result := False;

//  if not(result) then
//  begin
//    if Assigned(OnLogEventStr) then
//      OnLogEventStr('Not in VERTICAL COVERAGE LIMITS noise jammer');
//  end;
end;

function TT3RadarNoiseJammerOnVehicle.CeckAntiJammCapable(
  aObject: TSimObject): boolean;
begin
  { cek apakah tipe ANTI JAMMER RESISTANT radar target melawan JAMMER TYPE dari jammer  }
  if TT3Radar(aObject).ECCM then
  begin
    if RadarJammerDefinition.FDef.Jammer_Type = 0 then  //anti jammer tyoe A
    begin
      if TT3Radar(aObject).RadarDefinition.FDef.Anti_Jamming_A_Resistant then
        Result := True
      else
        Result := False;
    end
    else if RadarJammerDefinition.FDef.Jammer_Type = 1 then   //anti jammer Type B
    begin
      if TT3Radar(aObject).RadarDefinition.FDef.Anti_Jamming_B_Resistant then
        Result := True
      else
        Result := False;
    end
    else if RadarJammerDefinition.FDef.Jammer_Type = 2 then   //anti jammer Type C then
    begin
      if TT3Radar(aObject).RadarDefinition.FDef.Anti_Jamming_C_Resistant then
        Result := True
      else
        Result := False;
    end
    else
    begin
      Result := False;
    end;
  end
  else
    Result := False;

//  if (result) then
//  begin
//    if Assigned(OnLogEventStr) then
//      OnLogEventStr('Anti Jamming Radar status is on');
//  end;
end;

function TT3RadarNoiseJammerOnVehicle.CeckJammResistant(
  aObject: TSimObject): boolean;
begin
  { cek apakah tipe JAMMER RESISTANT radar target = JAMMER TYPE dari jammer }
  if RadarJammerDefinition.FDef.Jammer_Type = 0 then  //jammer tyoe A
  begin
    if TT3Radar(aObject).RadarDefinition.FDef.Jamming_A_Resistant then
      Result := True
    else
      Result := False;
  end
  else if RadarJammerDefinition.FDef.Jammer_Type = 1 then   //jammer Type B
  begin
    if TT3Radar(aObject).RadarDefinition.FDef.Jamming_B_Resistant then
      Result := True
    else
      Result := False;
  end
  else if RadarJammerDefinition.FDef.Jammer_Type = 2 then   //jammer Type C then
  begin
    if TT3Radar(aObject).RadarDefinition.FDef.Jamming_C_Resistant then
      Result := True
    else
      Result := False;
  end
  else
    Result := False;

//  if not(result) then
//  begin
//    if Assigned(OnLogEventStr) then
//      OnLogEventStr('Not in suit Jammer Type with noise jammer');
//  end;
end;
{$ENDIF}

constructor TT3RadarNoiseJammerOnVehicle.Create;
begin
  inherited;

  Status   := esOff;
  Category := ecRadarNoiseJammer;    //mk
  FRangeEffective := 0 ;//inisialisasi aja
  FTargetJamming := TList.Create;

  JamBearing    := 0;
  JamCenterFreq := 0;
  JamBandWidth  := 0;
end;

destructor TT3RadarNoiseJammerOnVehicle.Destroy;
begin
  FTargetJamming.Free;

  inherited;
end;

function TT3RadarNoiseJammerOnVehicle.EfffectiveRange(
  aObject: TSimObject): Double;
var
  RangePowerFactor : Double;
  Bandwidth : Double;
  EffectivePower : Double;
  v : TT3Vehicle;
begin
  v := FParent as TT3Vehicle;

  Result := 0;

  if not (Assigned(v)) then
    Exit;

  if not (Assigned(aObject)) then
    Exit;

  if aObject is TT3Vehicle then
  begin
    if ((TT3Vehicle(aObject).TrackDomain) = vhdSurface) then
    begin
      if Assigned(Self)then
      begin
          Self.PowerDensity := Self.RadarJammerDefinition.FDef.Jammer_Power_Density;
          Self.MaxEffectiveRange := Self.RadarJammerDefinition.FDef.Max_Effective_Range;

          RangePowerFactor := Self.PowerDensity / (Self.MaxEffectiveRange * Self.MaxEffectiveRange);

          Self.UpperFrequencyLimit := Self.RadarJammerDefinition.FDef.Upper_Freq_Limit;
          Self.LowerFrequencyLimit := Self.RadarJammerDefinition.FDef.Lower_Freq_Limit;

          Bandwidth := (Self.UpperFrequencyLimit - Self.LowerFrequencyLimit) / 10000;  {sementara di bagi 10000 utk}

          EffectivePower := Self.PowerDensity / Bandwidth;

          Result := Sqrt(Abs(EffectivePower / RangePowerFactor));
      end;
    end;
  end;

  FRangeEffective := Result;
end;

procedure TT3RadarNoiseJammerOnVehicle.Initialize;
begin

  inherited;
  if Assigned(UnitDefinition) then
  begin
    FRadarJammerDefinition := TJammer_On_Board(UnitDefinition);
  end;

  if Assigned(FRadarJammerDefinition) then
  begin
    with FRadarJammerDefinition do
    begin
      InstanceIndex := FData.Jammer_Instance_Index;
      InstanceName := FData.Instance_Identifier;
      Category := ecRadarNoiseJammer;
    end;
  end;
end;

//procedure TT3RadarNoiseJammerOnVehicle.ListJamming(aObject: TT3PlatformInstance);
//var
//  i,j,k : Integer;
//  RangeJammer, FreqRadar, vAltitude, minAltitude, maxAltitude, sumLower, sumUpper : Double;
//  pfObject, pfObjectSudahTerjamming : TT3PlatformInstance;
//  range, bearing, HeadingJammer, StartAngleJam, EndAngleJam, degLower, degUpper : Double;
//  v : TT3Vehicle;
//  device : TT3DeviceUnit;
//  sensor : TT3Sensor;
//  radar : TT3Radar;
//  ObjectRemoveAfterJammerOff : TT3PlatformInstance;
//  SubObjectAfterJammerOff : TT3PlatformInstance;
//  found : Boolean;
//  ObjectJammingParent : TT3PlatformInstance;
//begin
//  if Status = esOn then
//  begin
//    //1. hitung range effektif jammer
//    RangeJammer := EfffectiveRange(aObject);
//
//    for i := 0 to FSimPlatforms.itemCount - 1 do
//    begin
//      pfObject := TT3PlatformInstance(FSimPlatforms.getObject(i));
//      if pfObject = aObject then continue;
//
//      range := CalcRange(aObject.getPositionX,aObject.getPositionY,
//                pfObject.getPositionX,pfObject.getPositionY);
//
//      //2. cek apakah masuk dalam range visual
//      if Assigned(GameDefaults) then
//      begin
//        if range <= GameDefaults.FData.Max_Visual_Range then   //masuk range visual
//          Continue;
//      end
//      else
//      begin
//        if range <= 12 then   //masuk range visual
//          Continue;
//      end;
//
//      if pfObject is TT3Vehicle then
//      begin
//        v:= TT3Vehicle(pfObject);
//
//        //3. cek apakah masuk dalam effektif range
//        if range <= RangeJammer then
//        begin
//          for j := 0 to v.Devices.Count - 1 do
//          begin
//            device := TT3DeviceUnit(v.Devices.Items[j]);
//
//            if (device is TT3Sensor) and (TT3Sensor(device).OperationalStatus = sopOn) then
//            begin
//              sensor := TT3Sensor(device);
//
//              if sensor is TT3Radar then
//              begin
//                radar := TT3Radar(sensor);
//                FreqRadar := radar.RadarDefinition.FDef.Frequency;
//                HeadingJammer := aObject.Heading;
//                bearing := CalcBearing(aObject.getPositionX, aObject.getPositionY,
//                           pfObject.getPositionX, pfObject.getPositionY);
//
//                //4. cek frequensinya apakah masuk dalam batas UPPER dan LOWER frequensi limit jammmer
//                if (FreqRadar >= UpperFrequencyLimit) or (FreqRadar <= LowerFrequencyLimit )then
//                  Continue;
//
//                //5. cek apakah target berada di dalam batas MAKSIMUM SEKTOR WIDTH
//                StartAngleJam := HeadingJammer + (RadarJammerDefinition.FDef.Max_Sector_Width/2);
//                EndAngleJam   := HeadingJammer - (RadarJammerDefinition.FDef.Max_Sector_Width/2);
//
//                if StartAngleJam > 360 then StartAngleJam := StartAngleJam - 360;
//                if EndAngleJam < 0 then EndAngleJam := EndAngleJam + 360;
//                if not(DegComp_IsBeetwen(bearing, StartAngleJam, EndAngleJam)) then Continue;
//
//                //6. cek apakah target berada di dalam VERTICAL COVERAGE
//                degLower := RadarJammerDefinition.FDef.Lower_Vert_Coverage_Angle;
//                degUpper := RadarJammerDefinition.FDef.Upper_Vert_Coverage_Angle;
//
//                sumLower := Abs(RangeJammer*(Tan(degLower)));
//                sumUpper := Abs(RangeJammer*(TAn(degUpper)));
//
//                vAltitude := RadarJammerDefinition.FData.Antenna_Height + TT3Vehicle(aObject).Altitude;
//                minAltitude := vAltitude - sumLower;
//                maxAltitude := vAltitude + sumUpper;
//                if (vAltitude < minAltitude) or (vAltitude > maxAltitude) then
//                  Continue;
//
//                //8. cek apakah tipe JAMMER RESISTANT radar target = JAMMER TYPE dari jammer
//                if RadarJammerDefinition.FDef.Jammer_Type = 0 then  //jammer tyoe A
//                begin
//                  if not(radar.RadarDefinition.FDef.Jamming_A_Resistant) then
//                    Continue;
//                end
//                else if RadarJammerDefinition.FDef.Jammer_Type = 1 then   //jammer Type B
//                begin
//                  if not(radar.RadarDefinition.FDef.Jamming_B_Resistant) then
//                    Continue;
//                end
//                else if RadarJammerDefinition.FDef.Jammer_Type = 2 then   //jammer Type C then
//                begin
//                  if not(radar.RadarDefinition.FDef.Jamming_C_Resistant) then
//                    Continue;
//                end;
//
//                //8. cek apakah tipe ANTI JAMMER RESISTANT radar target melawan JAMMER TYPE dari jammer
//                //   lewati dulu karena belum ada proses pengaktifanonya
//                {if RadarJammerDefinition.FDef.Jammer_Type = 0 then  //anti jammer tyoe A
//                begin
//                  if radar.RadarDefinition.FDef.Anti_Jamming_A_Resistant then
//                    Continue;
//                end
//                else if RadarJammerDefinition.FDef.Jammer_Type = 1 then   //anti jammer Type B
//                begin
//                  if radar.RadarDefinition.FDef.Anti_Jamming_B_Resistant then
//                    Continue;
//                end
//                else if RadarJammerDefinition.FDef.Jammer_Type = 2 then   //anti jammer Type C then
//                begin
//                  if radar.RadarDefinition.FDef.Anti_Jamming_C_Resistant then
//                    Continue;
//                end;}
//
//                //9. jika semua condisi ok maka add target kedalam list jammer
//                if aObject.VehicleOnJamming.Count = 0 then
//                  aObject.VehicleOnJamming.Add(pfObject)
//                else
//                begin
//                  found := True;
//                  for k := 0 to aObject.VehicleOnJamming.Count - 1 do
//                  begin
//                    pfObjectSudahTerjamming := TT3PlatformInstance(aObject.VehicleOnJamming.Items[k]);
//                    if pfObject = pfObjectSudahTerjamming then
//                      begin
//                        found := True;
//                        Break;
//                      end
//                    else
//                    begin
//                      found := False;
//                      Continue;
//                    end;
//                  end;
//
//                  if not found then
//                    aObject.VehicleOnJamming.Add(pfObject);
//                end;
//              end;
//            end;
//          end;
//        end;
//      end;
//    end;
//  end
//  else if Status = esOff then
//  begin
//    if aObject.VehicleOnJamming.Count = 0 then  Exit;
//
//    if aObject.SubParentInJamming.Count > 0 then
//    begin
//      for I := 0 to aObject.SubParentInJamming.Count - 1 do
//      begin
//        //SubObjectAfterJammerOff := TT3PlatformInstance(aObject.SubParentInJamming.Items[i]);
//        //SubObjectAfterJammerOff.masukJamming := False;
//      end;
//
//      aObject.SubParentInJamming.Clear;
//    end;
//
//    aObject.VehicleOnJamming.Clear;
//
//    for I := 0 to TT3PlatformInstance(Parent).ParentInJamming.Count - 1 do
//    begin
//      ObjectJammingParent := TT3PlatformInstance(Parent).ParentInJamming.Items[i];
//
//      if ObjectJammingParent = aObject then
//        TT3PlatformInstance(Parent).ParentInJamming.Remove(TT3PlatformInstance(Parent).ParentInJamming.Items[i]);
//    end;
//  end;
//end;

procedure TT3RadarNoiseJammerOnVehicle.Move(const aDeltaMs: double);
{$IFDEF SERVER}
var
  I, count : integer;
  item : TObject;
  isInSuitTarget, isInSpotNumber, isInBearing, isInRange,
  isInFreqRange, isInSectorWidth, isInVerticalLimits,
  isJammResistant, isAntiJammCapable : boolean;
  allState : boolean;
{$ENDIF}
begin
  inherited;

  {$IFDEF SERVER}
  if Status = esOff then
    exit;

  count := FDeviceEntities.itemCount;
  for I := 0 to count - 1 do
  begin
    item := FDeviceEntities.getObject(i);

    if item is TT3Radar then
    begin
      if not (TT3Radar(item).OperationalStatus = sopOn) then
        Continue;

      if TT3Radar(item).Parent = Self.Parent then
        Continue;

      { Ceck parent jammer selected target}
      isInSuitTarget      := InsideSuitTarget(TT3Radar(item).Parent);
      { Ceck spot number target }
      isInSpotNumber      := InsideSpotNumber(TT3Radar(item));
      { Ceck bearing target with bearing jammer }
      isInBearing         := InsideBearing(TT3Radar(item).Parent);
      { Ceck in the range of jammer }
      isInRange           := InsideJamRange(TT3Radar(item).Parent);
      { Ceck in the range of jammer frequency}
      isInFreqRange       := InsideFreqRange(TT3Radar(item));
      { Ceck in the sector width of jammer }
      isInSectorWidth     := InsideSectorWidth(TT3Radar(item).Parent);
      { Ceck in the vertcal coverage limits of jammer }
      isInVerticalLimits  := InsideVerticalLimits(TT3Radar(item).Parent);
      { Ceck radar jamming resistant }
      isJammResistant     := CeckJammResistant(TT3Radar(item));
      { Ceck radar anti jamming capable }
      isAntiJammCapable   := CeckAntiJammCapable(TT3Radar(item));

      { periksa semua factor deteksi }
      allState := isInSuitTarget and isInSpotNumber and isInBearing
                  and isInRange and isInFreqRange and isInSectorWidth
                  and isInVerticalLimits and isJammResistant
                  and not(isAntiJammCapable);

      { if allState then begin }
      ApplyJammedEffect(item, allState);
    end;
  end;
  {$ENDIF}
end;

//procedure TT3RadarNoiseJammerOnVehicle.SetStatusJammerNoiseRadar(
//  const Value: TECMStatus);
//begin
//  FStatusJammerNoiseRadar := Value;
//
//  if (FStatusJammerNoiseRadar = esOn) then
//    SetStatus(esOn)
//  else if (FStatusJammerNoiseRadar = esOff) then
//    SetStatus(esOff)
//  else
//    SetStatus(value);
//end;

function TT3RadarNoiseJammerOnVehicle.GetSnapshotData : _SS_RadarNoiseJammerOnVehicle ;
var
  ss : _SS_RadarNoiseJammerOnVehicle ;
begin
  if Parent <> nil then ss.Owner      := TT3Unit(Parent).InstanceIndex ;
  ss.CM := TT3CounterMeasure(Self).GetSnapshotData;
  //ss.StatusJammerNoiseRadar           := byte(StatusJammerNoiseRadar);
  ss.RadarJammerDefinition.FData      := RadarJammerDefinition.FData ;
  ss.RadarJammerDefinition.FDef       := RadarJammerDefinition.FDef ;
  ss.RadarJammerDefinition.FNote      := RadarJammerDefinition.FNote ;
  ss.PowerDensity                     := PowerDensity;
  ss.MaxEffectiveRange                := MaxEffectiveRange;
  ss.JammerType                       := byte(JammerType);
  ss.MaximumSectorWidth               := MaximumSectorWidth;
  ss.UpperFrequencyLimit              := UpperFrequencyLimit;
  ss.LowerFrequencyLimit              := LowerFrequencyLimit;
  ss.UpperVerticalCoverage            := UpperVerticalCoverage;
  ss.LowerVerticalCoverage            := LowerVerticalCoverage;
  ss.Quantity                         := Quantity;
  ss.RangeEffective                   := RangeEffective;

  Result := ss ;
end;

procedure TT3RadarNoiseJammerOnVehicle.SetSnapshotData(const ss : _SS_RadarNoiseJammerOnVehicle);
begin
  TT3CounterMeasure(Self).SetSnapshotData(ss.CM);
  //StatusJammerNoiseRadar           := TECMStatus(ss.StatusJammerNoiseRadar);
  RadarJammerDefinition.FData      := ss.RadarJammerDefinition.FData ;
  RadarJammerDefinition.FDef       := ss.RadarJammerDefinition.FDef ;
  RadarJammerDefinition.FNote      := ss.RadarJammerDefinition.FNote ;
  PowerDensity                     := ss.PowerDensity;
  MaxEffectiveRange                := ss.MaxEffectiveRange;
  JammerType                       := TJammerType(ss.JammerType);
  MaximumSectorWidth               := ss.MaximumSectorWidth;
  UpperFrequencyLimit              := ss.UpperFrequencyLimit;
  LowerFrequencyLimit              := ss.LowerFrequencyLimit;
  UpperVerticalCoverage            := ss.UpperVerticalCoverage;
  LowerVerticalCoverage            := ss.LowerVerticalCoverage;
  Quantity                         := ss.Quantity;
  RangeEffective                   := ss.RangeEffective;
end;

procedure TT3RadarNoiseJammerOnVehicle.SetStatus(const Value: TECMStatus);
begin
  inherited;

end;

procedure TT3RadarNoiseJammerOnVehicle.SetDeviceEntities(
  const Value: TT3UnitContainer);
begin
  FDeviceEntities := Value;
end;

procedure TT3RadarNoiseJammerOnVehicle.SetJamBandWidth(const Value: Double);
begin
  FJamBandWidth := Value;
end;

procedure TT3RadarNoiseJammerOnVehicle.SetJamBearing(const Value: Double);
begin
  FJamBearing := Value;
end;

procedure TT3RadarNoiseJammerOnVehicle.SetJamCenterFreq(const Value: Double);
begin
  FJamCenterFreq := Value;
end;

procedure TT3RadarNoiseJammerOnVehicle.SetJamSpotNumber(const Value: integer);
begin
  FJamSpotNumber := Value;
end;

procedure TT3RadarNoiseJammerOnVehicle.SetJamTargeting(
  const Value: TNoiseJammerTargeting);
begin
  FJamTargeting := Value;
end;

procedure TT3RadarNoiseJammerOnVehicle.SetJamReqTargetRadarId(
  const Value: integer);
begin
  FJamReqTargetRadarId := Value;
end;

procedure TT3RadarNoiseJammerOnVehicle.SetJamReqTargetRadarOwnId(
  const Value: integer);
begin
  FJamReqTargetRadarOwnId := Value;
end;

procedure TT3RadarNoiseJammerOnVehicle.SetOnJammingSuccess(
  const Value: TOnRNJammingSuccess);
begin
  FOnJammingSuccess := Value;
end;

end.
