unit uT3OtherSensor;

interface

uses SysUtils, uT3Sensor, uDBAsset_Sensor, uSimObjects, tttData, uT3UnitContainer,
   uSnapshotData, Math ;

type
  RecIFF = class (TSimObject)
    IFFType : integer; // 1 :transponder, 2 : interrogator
    Data    : TT3Sensor;

  public
    constructor Create;
    destructor Destroy; override;
  end;

  TT3ESMSensor  = class(TT3Sensor)
  private
    FESMDefinition: TESM_On_Board;
    FDevices: TT3UnitContainer;
    procedure SetDevices(const Value: TT3UnitContainer);
  protected
    function GetMaxLOSRange(aObject : TSimObject) : Double; //override;

  public
    constructor Create; override;

    procedure SensorProcess; override;
    procedure Initialize; override;
    procedure UpdateVisual; override;

    function  GetSnapshotData : _SS_TT3ESMSensor ;
    procedure SetSnapshotData(const ss : _SS_TT3ESMSensor);

    function InsideRange(aObject : TSimObject) : boolean; override;
    function InsideBlindZone(aObject : TSimObject) : boolean; override;
    function InsideOtherMeasurement(aObject : TSimObject) : boolean; override;
    function TargetTypeEligiblity(aTarget: TObject): boolean; override;

    property Devices : TT3UnitContainer read FDevices write SetDevices;
    property ESMDefinition : TESM_On_Board read FESMDefinition;
  end;

  TT3EOSensor   = class(TT3Sensor)
  private
    FEODefinition: TEO_On_Board;
  protected
    function  GetMaxLOSRange(aObject : TSimObject) : Double;
  public
    constructor Create; override;
    procedure   Initialize; override;

    function    GetSnapshotData : _SS_TT3EOSensor ;
    procedure   SetSnapshotData(const ss : _SS_TT3EOSensor);

    function  InsideBlindZone(aObject : TSimObject) : boolean; override;
    function  InsideDetailRange(aObject : TSimObject) : Boolean; override;
    function  InsideRange(aObject : TSimObject) : boolean; override;
    function  InsideOtherMeasurement(aObject : TSimObject) : boolean;override;
    function  InsideVerticalCoverage(aObject : TSimObject) : boolean; override;

    property EODefinition : TEO_On_Board read FEODefinition;
  end;

  TT3MADSensor = class(TT3Sensor)
  private
    FMADDefinition: TMAD_Sensor_On_Board;
  protected
  public
    constructor Create; override;
    procedure Initialize; override;

    function  GetSnapshotData : _SS_TT3MADSensor ;
    function  InsideRange(aObject : TSimObject) : boolean; override;

    procedure SetSnapshotData(const ss : _SS_TT3MADSensor);
    procedure SensorProcess; override;

    property MADDefinition : TMAD_Sensor_On_Board read FMADDefinition;
  end;

  TT3FCRSensor  = class(TT3Sensor)
  private
    FFCRDefinition: TFCR_On_Board;
  protected

  public
    constructor Create; override;
    procedure Initialize; override;

    function  InsideBlindZone(aObject : TSimObject): boolean; override;
    function  GetSnapshotData : _SS_TT3FCRSensor ;
    procedure SetSnapshotData(const ss : _SS_TT3FCRSensor);

    property FCRDefinition : TFCR_On_Board read FFCRDefinition;
  end;

  TT3IFFSensor = class(TT3Sensor)
  private
    FInterrogatorMode1Enabled: boolean;
    FInterrogatorMode2Enabled: boolean;
    FInterrogatorMode3Enabled: boolean;
    FInterrogatorMode3CEnabled: boolean;
    FInterrogatorMode4Enabled: boolean;
    FTransponderOperateStatus: TSensorOperationalStatus;
    FInterrogatorOperateStatus: TSensorOperationalStatus;
    FInterrogatorMode1: integer;
    FInterrogatorMode2: integer;
    FInterrogatorMode3: integer;
    FInterrogatorMode3C: integer;

    FIFFDefinition: TIFF_Sensor_On_Board;
    FTransponderMode2: integer;
    FTransponderMode3: integer;
    FTransponderMode3C: integer;
    FTransponderMode2Enabled: boolean;
    FTransponderMode1: integer;
    FTransponderMode3Enabled: boolean;
    FTransponderMode1Enabled: boolean;
    FTransponderMode4Enabled: boolean;
    FTransponderMode3CEnabled: boolean;
    FOnTransponderStatus: TOnSensorOperationalStatus;
    FOnInterrogatorStatus: TOnSensorOperationalStatus;
    FTargetObject: TSimObject;
    FPrevTargetObj : TSimObject;
    FModeSearchIFF : byte;

    procedure SetInterrogatorOperateStatus(const Value: TSensorOperationalStatus);
    procedure SetInterrogatorMode1(const Value: integer);
    procedure SetInterrogatorMode1Enabled(const Value: boolean);
    procedure SetInterrogatorMode2(const Value: integer);
    procedure SetInterrogatorMode2Enabled(const Value: boolean);
    procedure SetInterrogatorMode3(const Value: integer);
    procedure SetInterrogatorMode3C(const Value: integer);
    procedure SetInterrogatorMode3CEnabled(const Value: boolean);
    procedure SetInterrogatorMode3Enabled(const Value: boolean);
    procedure SetInterrogatorMode4Enabled(const Value: boolean);
    procedure SetTransponderOperateStatus(const Value: TSensorOperationalStatus);
    procedure SetTransponderMode1(const Value: integer);
    procedure SetTransponderMode1Enabled(const Value: boolean);
    procedure SetTransponderMode2(const Value: integer);
    procedure SetTransponderMode2Enabled(const Value: boolean);
    procedure SetTransponderMode3(const Value: integer);
    procedure SetTransponderMode3C(const Value: integer);
    procedure SetTransponderMode3CEnabled(const Value: boolean);
    procedure SetTransponderMode3Enabled(const Value: boolean);
    procedure SetTransponderMode4Enabled(const Value: boolean);
    procedure SetOnTransponderStatus(const Value: TOnSensorOperationalStatus);
    procedure SetOnInterrogatorStatus(const Value: TOnSensorOperationalStatus);
    procedure SetTargetObject(const Value: TSimObject);
    procedure SetModeSearchIFF(const value : byte);
    function GetMaxLos(aTarget : TSimObject) : double ;

  public
    IFFDetail : Boolean;
    TransponderMode1Detail, TransponderMode2Detail,
    TransponderMode3Detail, TransponderMode3CDetail : string;

    //utk update list IFF
    recIFFTransponder  : RecIFF;
    recIFFInterrogator : RecIFF;
    // TransponderMode3CDetail : Double;

    constructor Create;override;
    procedure Initialize; override;

    procedure SensorProcess; override;
    function GetSnapshotData : _SS_TT3IFFSensor ;
    procedure SetSnapshotData(const ss : _SS_TT3IFFSensor);
    procedure CekIFF (var obj : TSimObject; var value : Boolean; var value2 : Boolean);
    function  InsideRange(aObject : TSimObject) : boolean; override;
    function  IFFOn (aObject:TSimObject) : Boolean; override;
    procedure IFFMode (var Transmode1, Transmode2, Transmode3, Transmode3C : string); override;
    function CekStatusInterrogatorMode3C(aObject: TSimObject): Boolean; override;
    property TransponderOperateStatus   : TSensorOperationalStatus
        read FTransponderOperateStatus write SetTransponderOperateStatus;
    property TransponderMode1Enabled : boolean read FTransponderMode1Enabled
       write SetTransponderMode1Enabled;
    property TransponderMode2Enabled : boolean read FTransponderMode2Enabled
       write SetTransponderMode2Enabled;
    property TransponderMode3Enabled : boolean read FTransponderMode3Enabled
       write SetTransponderMode3Enabled;
    property TransponderMode3CEnabled : boolean read FTransponderMode3CEnabled
       write SetTransponderMode3CEnabled;
    property TransponderMode4Enabled : boolean read FTransponderMode4Enabled
       write SetTransponderMode4Enabled;
    property TransponderMode1 : integer read FTransponderMode1 write SetTransponderMode1;
    property TransponderMode2 : integer read FTransponderMode2 write SetTransponderMode2;
    property TransponderMode3 : integer read FTransponderMode3 write SetTransponderMode3;
    property TransponderMode3C : integer read FTransponderMode3C write SetTransponderMode3C;

    property InterrogatorOperateStatus  : TSensorOperationalStatus
        read FInterrogatorOperateStatus write SetInterrogatorOperateStatus;
    property InterrogatorMode1Enabled : boolean read FInterrogatorMode1Enabled
       write SetInterrogatorMode1Enabled;
    property InterrogatorMode2Enabled : boolean read FInterrogatorMode2Enabled
       write SetInterrogatorMode2Enabled;
    property InterrogatorMode3Enabled : boolean read FInterrogatorMode3Enabled
       write SetInterrogatorMode3Enabled;
    property InterrogatorMode3CEnabled : boolean read FInterrogatorMode3CEnabled
       write SetInterrogatorMode3CEnabled;
    property InterrogatorMode4Enabled : boolean read FInterrogatorMode4Enabled
       write SetInterrogatorMode4Enabled;
    property InterrogatorMode1 : integer read FInterrogatorMode1 write SetInterrogatorMode1;
    property InterrogatorMode2 : integer read FInterrogatorMode2 write SetInterrogatorMode2;
    property InterrogatorMode3 : integer read FInterrogatorMode3 write SetInterrogatorMode3;
    property InterrogatorMode3C : integer read FInterrogatorMode3C write SetInterrogatorMode3C;

    property IFFDefinition : TIFF_Sensor_On_Board read FIFFDefinition;
    property TargetObject  : TSimObject read FTargetObject write SetTargetObject;
    property PrevTargetObj  : TSimObject read FPrevTargetObj write FPrevTargetObj;
    property OnTransponderStatus  : TOnSensorOperationalStatus read FOnTransponderStatus write SetOnTransponderStatus;
    property OnInterrogatorStatus : TOnSensorOperationalStatus read FOnInterrogatorStatus write SetOnInterrogatorStatus;
    property ModeSearchIFF : byte read FModeSearchIFF write SetModeSearchIFF;
  end;

implementation

uses uObjectVisuals, uDBBlind_Zone, uT3Unit,
    uBaseCoordSystem, uT3Radar, uT3Sonar, uT3Vehicle, uDBAsset_Scripted;

function OctToDec(OctStr: string): string;
var
  OctChar : set of AnsiChar;
  DecNum: Real;
  i: Integer;
  Error: Boolean;
begin
  OctChar:= ['0','1','2','3','4','5','6','7'];
  DecNum := 0;
  Error := False;

  for i := Length(OctStr) downto 1 do
  begin
    if not(CharInSet(OctStr[i], OctChar)) then //(OctStr[i] in ['0','1','2','3','4','5','6','7']) then
    begin
      Error := True;
     // ShowMessage('This is not octal number');

      Break;
    end;

    DecNum := DecNum + StrToInt(OctStr[i]) * Power(8, Length(OctStr)-i);
  end;

  if not Error then
    Result := FloatToStr(DecNum)
  else
    Result := '';
end;

Function DecToOct(Inp : String): String;

Var
  HasilBagi,SisaBagi : Integer;
  Oct,Oktal : String;
  i : integer;
  Des : integer;
Begin
  Oct := '';
  Oktal := '';
  Des:= StrToInt(inp);
  Repeat
  SisaBagi := des Mod 8;
  Oct:= Oct + intToStr(SisaBagi);
  HasilBagi := Des Div 8;
  des:= HasilBagi;
  Until HasilBagi = 0;

  For I := length (Oct) Downto 1 Do
  Begin
  Oktal := Oktal+ Oct[i];
  End;
  Result:= Oktal;
End;
{ TESMSensor }

constructor TT3ESMSensor.Create;
begin
  inherited;

end;

procedure TT3ESMSensor.Initialize;
var
  i : integer;
  blindZ : TBlindZoneVisual;
begin
  inherited;

  if Assigned(FParent) then begin
    FPosition.X := TT3PlatformInstance(FParent).getPositionX;
    FPosition.Y := TT3PlatformInstance(FParent).getPositionY;
    FPosition.Z := TT3PlatformInstance(FParent).getPositionZ;
  end;

  DetectionRange := 500;
  DetailDetectionRange := 500;

  if Assigned(UnitDefinition) and (UnitDefinition is TESM_On_Board) then
    FESMDefinition := TESM_On_Board(UnitDefinition);

  if Assigned(FESMDefinition) then begin
    InstanceName := FESMDefinition.FData.Instance_Identifier;
    InstanceIndex := FESMDefinition.FData.ESM_Instance_Index;

    if FESMDefinition.FBlind.Count > 0 then begin
      SetLength(BZStartAngle,FESMDefinition.FBlind.Count);
      SetLength(BZEndAngle,FESMDefinition.FBlind.Count);

      for i := 0 to FESMDefinition.FBlind.Count - 1 do begin
        blindZ := TBlindZoneVisual.Create;
        BZStartAngle[i] := TBlind_Zone(FESMDefinition.FBlind.Items[i]).FData.Start_Angle;
        BZEndAngle[i]   := TBlind_Zone(FESMDefinition.FBlind.Items[i]).FData.End_Angle;
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
end;

function TT3ESMSensor.InsideBlindZone(aObject: TSimObject): boolean;
var
  i : integer;
  blindZ : TBlindZoneVisual;
  bearing : double;
begin
  Result := inherited;

  bearing := CalcBearing(FPosition.X,FPosition.Y,
           TT3PlatformInstance(aObject.Parent).getPositionX,
           TT3PlatformInstance(aObject.Parent).getPositionY);

  // periksa apakah didalam area blind zone
  if FBlindZoneViews.Count > 0 then
  begin
    for I := 0 to FBlindZoneViews.Count - 1 do
    begin
      blindZ := TBlindZoneVisual(FBlindZoneViews.Items[i]);
      Result := DegComp_IsBeetwen(bearing, blindZ.RelativeStartAngle, blindZ.RelativeEndAngle);
    end;
  end
  else
    result := false;
end;

function TT3ESMSensor.InsideOtherMeasurement(aObject : TSimObject) : boolean;
var
  maxLOS   : Double;
  range : Double;
  isSubSurvase : Boolean;
begin
  maxLOS := GetMaxLOSRange(aObject) {* 1000 * C_Meter_To_NauticalMile};
  range := CalcRange(Parent.PosX, Parent.PosY, aObject.PosX, aObject.PosY);

  Result := false;
  isSubSurvase := True;

  if TT3PlatformInstance(aObject.Parent) is TT3PlatformInstance then
  begin
    if ((TT3PlatformInstance(aObject.Parent).PlatformDomain = 2) and
       (TT3PlatformInstance(aObject.Parent).Altitude <> 0)) then
      isSubSurvase := False;
  end;

  if range < maxLOS then
  begin
    Result := true and isSubSurvase;
  end;
end;

function TT3ESMSensor.InsideRange(aObject: TSimObject): boolean;
var
  maxRange, range : Double;
begin
  inherited;

  //maxRange  := TT3Radar(aObject).DetectionRange * 1.8;
  maxRange  := 500;  //max ESM range fix 500nm
  range     := CalcRange(FPosition.X, FPosition.Y, aObject.getPositionX, aObject.getPositionY);

  result := range <= maxRange;
end;

function TT3ESMSensor.GetMaxLOSRange(aObject: TSimObject): Double;
var
  basicLOS : Double;
  maxLOS   : Double;
  v, tgt : TT3Vehicle;
  dev : TT3DeviceUnit;
  TargetHeight, AntenaHeight,
  ESMAntena, SubESMAntena,
  TgtAntena, TgtSubAntena,
  AtmosRefract, HorizonFactor : Double;
begin
  Result := 0;
  tgt := nil;
  v := nil;

  TargetHeight  := 0;
  TgtAntena    := 0;
  TgtSubAntena := 0;
  HorizonFactor := 1;
  AtmosRefract := 1;

  if FParent is TT3Vehicle then
    v := FParent as TT3Vehicle;

  if not (Assigned(v)) then
    Exit;

  if not (aObject is TT3DeviceUnit) then
    Exit;

  dev := aObject as TT3DeviceUnit;
  if dev.Parent is TT3Vehicle then
    tgt := dev.Parent as TT3Vehicle;

  if not Assigned(tgt) then
    Exit;

  if ((TT3PlatformInstance(v).TrackDomain = vhdSubsurface)
      or (TT3PlatformInstance(v).PlatformDomain = vhdSubsurface))
      and (TT3PlatformInstance(v).Altitude <> 0) then
    Exit;

  if ((TT3PlatformInstance(tgt).TrackDomain = vhdSubsurface)
      or (TT3PlatformInstance(tgt).PlatformDomain = vhdSubsurface))
      and (TT3PlatformInstance(tgt).Altitude <> 0) then
    Exit;

  if Assigned(FESMDefinition) then
  begin
    ESMAntena := FESMDefinition.FData.Rel_Antenna_Height;
    SubESMAntena := FESMDefinition.FData.Submerged_Antenna_Height;
  end
  else
  begin
    ESMAntena := 0;
    SubESMAntena := 0;
  end;

  if dev is TT3Radar then
  begin
    if Assigned(TT3Radar(dev).RadarDefinition) then
    begin
      TgtAntena   := TT3Radar(dev).RadarDefinition.FData.Rel_Antenna_Height;
      TgtSubAntena:= TT3Radar(dev).RadarDefinition.FData.Submerged_Antenna_Height;
      HorizonFactor := TT3Radar(dev).RadarDefinition.FDef.Radar_Horizon_Factor;
    end;
  end;

  if (Assigned(tgt)) then
  begin
    if TgtAntena <= 0 then
      TgtAntena := tgt.VehicleDefinition.FData.Height;

    if (tgt.TrackDomain = vhdAir) or (tgt.PlatformDomain = vhdAir) then
    begin
      TargetHeight := Sqrt(Abs(17 * (((TgtAntena + TgtSubAntena) * C_Feet_To_Meter) +
                      tgt.Altitude)));
    end
    else
    if (tgt.TrackDomain = vhdSurface) or (tgt.PlatformDomain = vhdSurface)
        or (tgt.TrackDomain = vhdLand) or (tgt.PlatformDomain = vhdLand)
        or (tgt.TrackDomain = vhdAmphibious) or (tgt.PlatformDomain = vhdAmphibious) then
    begin
      TargetHeight := Sqrt(Abs(17 * ((TgtAntena + TgtSubAntena) * C_Feet_To_Meter)));
    end
    else
    if (tgt.TrackDomain = vhdSubsurface) or (tgt.PlatformDomain = vhdSubsurface) then
    begin
      TargetHeight := Sqrt(Abs(17 * (((TgtAntena + TgtSubAntena) * C_Feet_To_Meter) -
                      tgt.Altitude)));
    end
    else
    begin
      TargetHeight := Sqrt(Abs(17 * (((TgtAntena + TgtSubAntena) * C_Feet_To_Meter) +
                      tgt.Altitude)));
    end;
  end;

  if (Assigned(v)) then
  begin
    if ESMAntena <= 0 then ESMAntena := v.VehicleDefinition.FData.Height;

    if (v.TrackDomain = vhdAir) or (v.PlatformDomain = vhdAir) then
    begin
      AntenaHeight := Sqrt(Abs(17 * (((ESMAntena + SubESMAntena + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter) + v.Altitude)));
    end
    else
    if (v.TrackDomain = vhdSurface) or (v.PlatformDomain = vhdSurface)
        or (v.TrackDomain = vhdLand) or (v.PlatformDomain = vhdLand)
        or (v.TrackDomain = vhdAmphibious) or (v.PlatformDomain = vhdAmphibious) then
    begin
      AntenaHeight := Sqrt(Abs(17 * ((ESMAntena + SubESMAntena + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter)));
    end
    else
    if (v.TrackDomain = vhdSubsurface) or (v.PlatformDomain = vhdSubsurface) then
    begin
      AntenaHeight := Sqrt(Abs(17 * (((ESMAntena + SubESMAntena + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter) - v.Altitude)));
    end
    else
    begin
      AntenaHeight := Sqrt(Abs(17 * (((ESMAntena + SubESMAntena + v.VehicleDefinition.FData.Height)
                      * C_Feet_To_Meter) + v.Altitude)));
    end;
  end
  else AntenaHeight := Sqrt(Abs(17 * ((ESMAntena + SubESMAntena + v.VehicleDefinition.FData.Height)
                       * C_Feet_To_Meter)));

  //basicLOS := Sqrt((17 * ESMDefinition.FData.Rel_Antenna_Height)) + Sqrt((17 * v.VehicleDefinition.FData.Rel_Comm_Antenna_Height));
  //maxLOS := basicLOS * Self.ESMDefinition.FESM_Def.Emitter_Detect_Range_Factor * 1; {asumsi Average Refraction Factor = 1}

  if Assigned(Environment) then
  begin
    AtmosRefract := Environment.FData.Atmospheric_Refract_Modifier / 100;
  end;

  basicLOS := AntenaHeight + TargetHeight;
  maxLOS :=  basicLOS * HorizonFactor * AtmosRefract * 1.8;

  Result := maxLOS;
end;

procedure TT3ESMSensor.SensorProcess;
var
  i : integer;
  device : TSimObject;
  isInsideOtherMeasurement, status,
  isInRange, isInsideBlindZone,
  isTargetTypeEligiblity   : boolean;
begin
//  if FOperationalStatus = sopOff then
//    exit;

  if Assigned(FDevices) then
  begin
    for I := 0 to FDevices.itemCount - 1 do
	  begin
     	device := FDevices.getObject(i);
      // cek assined property OnSensorDetect
      if not Assigned(OnSensorDetect)     then continue;
      // cek apakah device unit
      if not (device is TT3DeviceUnit)    then continue;
      // cek apakah device = dirinya sendiri
      if device = Self                    then continue;
      // cek apakah devicenya masih dalam satu kapal
      if device.Parent = FParent          then continue;
      //cek apakah satu cubicle
      if device.Parent is TT3Unit then begin
        if TT3Unit(device.Parent).UnitGroup then continue;
      end;

      if (device is TT3Radar) then
      begin
        // periksa apakah dalam jangkauan radar
        isInRange           := InsideRange(device);
        // periksa apa di dalam blind zone
        isInsideBlindZone   := InsideBlindZone(device);
        // cek LOS
        isInsideOtherMeasurement := InsideOtherMeasurement(device);
        // cek apakah target disa dideteksi
        isTargetTypeEligiblity := TargetTypeEligiblity(device);

        status := isInRange and (not isInsideBlindZone) and (isInsideOtherMeasurement)
                  and (isTargetTypeEligiblity) and (FEmconOperationalStatus <> EmconOn);

        case TT3Sensor(device).OperationalStatus of
          sopOn   : OnSensorDetect(Self,device,status,false);
          sopOff  : OnSensorDetect(Self,device,false,false);
        else
          OnSensorDetect(Self,device,false,False);
        end;
      end;
    end;
  end;
end;

procedure TT3ESMSensor.SetDevices(const Value: TT3UnitContainer);
begin
  FDevices := Value;
end;

function TT3ESMSensor.GetSnapshotData : _SS_TT3ESMSensor ;
var
  ss :  _SS_TT3ESMSensor ;
  I  : integer ;
begin
  ss.S := TT3Sensor(Self).GetSnapshotData;
  with ESMDefinition do begin
    ss.ESMDefinition.FData                    := FData ;
    ss.ESMDefinition.FESM_Def                 := FESM_Def;
    ss.ESMDefinition.FVehicle.FData           := FVehicle.FData;
    ss.ESMDefinition.FVehicle.FPlatform_Ident := FVehicle.FPlatform_Ident;
    ss.ESMDefinition.FVehicle.FHeliLimitation := FVehicle.FHeliLimitation;

    ss.ESMDefinition.FNote                    := FNote ;

    if FBlind_Zone <> nil then begin
       ss.ESMDefinition.FBlind_Zone.FData := FBlind_Zone.FData ;
    end;
    if FBlind <> nil then begin
       SetLength(ss.ESMDefinition.FBlind,FBlind.Count);
       for I := 0 to FBlind.Count - 1 do begin
          ss.ESMDefinition.FBlind[i].FData := TBlind_Zone(FBlind[i]).FData ;
       end;
    end;

  end;
  Result := ss ;
end;

procedure TT3ESMSensor.SetSnapshotData(const ss : _SS_TT3ESMSensor);
begin
  TT3Sensor(Self).SetSnapshotData(ss.S);
  ESMDefinition.FData := ss.ESMDefinition.FData ;
  ESMDefinition.FESM_Def := ss.ESMDefinition.FESM_Def;
  ESMDefinition.FVehicle.FData := ss.ESMDefinition.FVehicle.FData;
  ESMDefinition.FVehicle.FPlatform_Ident := ss.ESMDefinition.FVehicle.FPlatform_Ident;
  ESMDefinition.FVehicle.FHeliLimitation := ss.ESMDefinition.FVehicle.FHeliLimitation;
end;

function TT3ESMSensor.TargetTypeEligiblity(aTarget: TObject): boolean;
var
  ParentTarget : TT3Vehicle;
  Radar : TT3Radar;
begin
  inherited;

  Result := True;

  if aTarget is TT3Radar then
  begin
    Radar := TT3Radar(aTarget);
    if Radar.Parent is TT3Vehicle then
    begin
      ParentTarget := TT3Vehicle(Radar.Parent);

      if ParentTarget.VehicleDefinition.FData.Detectability_Type = 1 then  //17042012 mk
      begin
        Result := False;
        Exit;
      end;
    end;

    //cek frekuensi target apakah masuk dalam batas frekuensi deteksi ESM
    if Assigned(Radar.RadarDefinition) then
    begin
      if Assigned(Radar.RadarDefinition) then
      begin
        if not(((FESMDefinition.FESM_Def.Low_Detect_Frequency1 < Radar.RadarDefinition.FDef.Frequency)
           and (Radar.RadarDefinition.FDef.Frequency < FESMDefinition.FESM_Def.High_Detect_Frequency1))
           or ((FESMDefinition.FESM_Def.Low_Detect_Frequency2 < Radar.RadarDefinition.FDef.Frequency)
           and (Radar.RadarDefinition.FDef.Frequency < FESMDefinition.FESM_Def.High_Detect_Frequency2)))
        then
        begin
          Result := False;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure TT3ESMSensor.UpdateVisual;
begin
  inherited;

//  if not Assigned(Parent) then exit;
//
//  FPosition.X := Parent.getPositionX;
//  FPosition.Y := Parent.getPositionY;
//  FPosition.Z := Parent.getPositionZ;
end;

{ TIFFSensor }
procedure TT3IFFSensor.CekIFF (var obj : TSimObject; var value : Boolean; var value2 : Boolean);
var
 i : integer;
 TargetVehicle : TT3Vehicle;
 SensorDevice  : TT3DeviceUnit;
 SensorIFF     : TT3IFFSensor;
 isMode1, isMode2, isMode3 : Boolean;
begin
  if obj = nil then
  begin
    value := False;
    value2 := false;
    exit;
  end;

  value := False;
  value2 := false;
  //obj := nil;
  IFFDetail :=False;
  isMode1 := False;
  isMode2 := False;
  isMode3 := False;
  //inisialisasi aja biar gak acess volation
  TransponderMode1Detail := '---';
  TransponderMode2Detail := '---';
  TransponderMode3Detail := '---';
  TransponderMode3CDetail := '---';

  if InterrogatorOperateStatus = sopOn then
    begin
      if ModeSearchIFF = 1 then   //designated
      begin
        if obj is TT3Vehicle then
        begin
          TargetVehicle := TT3Vehicle(obj);
          for i := 0 to TargetVehicle.Devices.Count -1 do
          begin
            SensorDevice := TT3DeviceUnit(TargetVehicle.Devices.Items[i]);

            if SensorDevice is TT3IFFSensor then
            begin
              SensorIFF := TT3IFFSensor(SensorDevice);

              if TargetObject = nil then
              exit;

              if (TT3Vehicle(TargetObject).InstanceIndex) <> (TargetVehicle.InstanceIndex) then
              begin
                if (SensorIFF.TransponderOperateStatus = sopOn) and (TargetVehicle.FlagIFF)  then
                begin
                  value := true;
                end
                else
                begin
                  value := false;
                  TargetVehicle.FlagIFF := false;
                end;

              end
              else
              begin
                if PrevTargetObj <> nil then
                begin
                  if TT3Vehicle(PrevTargetObj).InstanceIndex = TT3Vehicle(TargetObject).InstanceIndex then
                    exit;
                end;

                if SensorIFF.TransponderOperateStatus = sopon then
                begin
                   if InterrogatorMode1Enabled  and
                      SensorIFF.TransponderMode1Enabled
//                      and ( InterrogatorMode1 = SensorIFF.TransponderMode1)
                      then
                   begin
                     TransponderMode1Detail :=DecToOct(inttostr(SensorIFF.TransponderMode1));
                     isMode1 := True;
                     IFFDetail :=True;
                   end;

                   if InterrogatorMode2Enabled  and
                      SensorIFF.TransponderMode2Enabled
//                      and ( InterrogatorMode2 = SensorIFF.TransponderMode2)
                      then
                   begin
                     TransponderMode2Detail :=DecToOct(inttostr(SensorIFF.TransponderMode2));
                     isMode2 := True;
                     IFFDetail :=True;
                   end;

                   if InterrogatorMode3Enabled  and
                      SensorIFF.TransponderMode3Enabled
//                      and ( InterrogatorMode3 = SensorIFF.TransponderMode3)
                      then
                   begin
                     TransponderMode3Detail :=DecToOct(inttostr(SensorIFF.TransponderMode3));
                     isMode3 := True;
                     IFFDetail :=True;
                   end;

                   if InterrogatorMode4Enabled and
                      SensorIFF.TransponderMode4Enabled then
                   begin
                     if TT3Vehicle(Parent).Force_Designation = TargetVehicle.Force_Designation then
                       value2 := true;
                   end;

                   if (isMode1) or (isMode2) or (isMode3) then
                     value := True;

                   if value then
                     TargetVehicle.FlagIFF := true
                   else
                    TargetVehicle.FlagIFF := false;
                end
                else
                begin
                  value := false;
                  TargetVehicle.FlagIFF := false;
                  PrevTargetObj := TargetObject;
//                  TT3Vehicle(TargetObject).InstanceIndex := 0;   // agar target object tidak memiliki object tp tidak nil>>andik
                end;
              end

            end;
          end;

          if InterrogatorMode3CEnabled then
          begin
            if TT3PlatformInstance(obj).PlatformDomain = vhdAir then
              TransponderMode3CDetail := IntToStr(round((TT3PlatformInstance(obj).Altitude * C_Meter_To_Feet)/100));
          end
          else
             TransponderMode3CDetail := '---';
        end;
      end
      else
      begin
        if obj is TT3Vehicle then
        begin
          TargetVehicle := TT3Vehicle(obj);
          for i := 0 to TargetVehicle.Devices.Count -1 do
          begin

            SensorDevice := TT3DeviceUnit(TargetVehicle.Devices.Items[i]);

            if SensorDevice is TT3IFFSensor then
            begin
              SensorIFF := TT3IFFSensor(SensorDevice);

              if SensorIFF.TransponderOperateStatus = sopon then
              begin

                if InterrogatorMode1Enabled  and
                   SensorIFF.TransponderMode1Enabled
//                   and ( InterrogatorMode1 = SensorIFF.TransponderMode1)
                   then
                begin
                  TransponderMode1Detail :=DecToOct(inttostr(SensorIFF.TransponderMode1));
                  isMode1 := True;
                  IFFDetail :=True;
                end;

                if InterrogatorMode2Enabled  and
                   SensorIFF.TransponderMode2Enabled
//                   and ( InterrogatorMode2 = SensorIFF.TransponderMode2)
                   then
                begin
                  TransponderMode2Detail :=DecToOct(inttostr(SensorIFF.TransponderMode2));
                  isMode2 := True;
                  IFFDetail :=True;
                end;

                if InterrogatorMode3Enabled  and
                   SensorIFF.TransponderMode3Enabled
//                   and ( InterrogatorMode3 = SensorIFF.TransponderMode3)
                   then
                begin
                  TransponderMode3Detail :=DecToOct(inttostr(SensorIFF.TransponderMode3));
                  isMode3 := True;
                  IFFDetail :=True;
                end;

                if InterrogatorMode4Enabled and
                   SensorIFF.TransponderMode4Enabled then
                begin
                  if TT3Vehicle(Parent).Force_Designation = TargetVehicle.Force_Designation then
                  value2 := true;
                end;

                if (isMode1) or (isMode2) or (isMode3) then
                value := True;

                TargetVehicle.FlagIFF := false;// semua set false untuk otomatis
              end;

            end;
          end;

          if InterrogatorMode3CEnabled then
          begin
            if TT3PlatformInstance(obj).PlatformDomain = vhdAir then
              TransponderMode3CDetail := IntToStr(round((TT3PlatformInstance(obj).Altitude * C_Meter_To_Feet)/100));
          end
          else
             TransponderMode3CDetail := '---';
        end;
      end;
    end
  else
  begin
    value:=False;
    IFFDetail :=False;
  end;

  if OperationalStatus = sopOffIFF then
  begin
    value:=False;
    IFFDetail :=False;
  end;
  // exit;

//    obj := TargetObject;
end;

function TT3IFFSensor.CekStatusInterrogatorMode3C(aObject: TSimObject): Boolean;
var
  i : integer;
  dev : TT3DeviceUnit;
  RangeIFF : double;
begin
  Result := false;

   if OperationalStatus = sopOffIFF then
   exit;

  rangeIFF := CalcRange(FPosition.X, FPosition.Y,
                        aObject.getPositionX, aObject.getPositionY);

  if RangeIFF > GameDefaults.FData.Max_IFF_Range then
  begin
    Result := false;
    exit;
  end
  else
  begin
    if RangeIFF > GetMaxLos(aObject) then
    begin
      result := false;
      exit;
    end;
  end;

  if (InterrogatorOperateStatus = sopOn)and (InterrogatorMode3CEnabled)   then
  begin
//    if (TT3PlatformInstance(aObject).PlatformDomain = vhdAir)
//       and (TT3PlatformInstance(aObject).Altitude = 0) then
//      exit;

    if aObject is TT3Vehicle then
    begin
      for i := 0 to TT3Vehicle(aObject).Devices.Count - 1 do
      begin
        dev := TT3DeviceUnit(TT3Vehicle(aObject).Devices.Items[i]);
        if (dev is TT3IFFSensor) then
        begin
          if (TT3IFFSensor(dev).TransponderOperateStatus = sopOn) and
             (TT3IFFSensor(dev).TransponderMode3CEnabled) then
            Result := True
          else
            result := false;
        end;
      end;
    end;
  end;

end;

constructor TT3IFFSensor.Create;
begin
  inherited;
  FTransponderOperateStatus := sopOffIFF;
  FInterrogatorOperateStatus := sopOffIFF;
end;

procedure TT3IFFSensor.IFFMode(var Transmode1, Transmode2, Transmode3, Transmode3C: string);
begin
  inherited;
  Transmode1:= TransponderMode1Detail;
  Transmode2:= TransponderMode2Detail;
  Transmode3:= TransponderMode3Detail;
  Transmode3C:= TransponderMode3CDetail;
end;

function TT3IFFSensor.IFFOn(aObject: TSimObject): Boolean;
begin
  result := False;
end;

procedure TT3IFFSensor.Initialize;
var I, fd : Integer;
    iffDefault : TRecGame_Default_IFF_Mode_Code;
begin
  inherited;
  if Assigned(UnitDefinition) and (UnitDefinition is TIFF_Sensor_On_Board) then
    FIFFDefinition := TIFF_Sensor_On_Board(UnitDefinition);

  if Assigned(FIFFDefinition) then begin
    InstanceName := FIFFDefinition.FData.Instance_Identifier;
    InstanceIndex := FIFFDefinition.FData.IFF_Instance_Index;
    DetectionRange := 0;
  end;

  for I := 0 to Length(GameDefaults.FGameDefault_IFF) - 1 do
  begin
    iffDefault := GameDefaults.FGameDefault_IFF[i];
    fd := TT3PlatformInstance(parent).Force_Designation;
    if iffDefault.Force_Designation = fd then
    begin
      if iffDefault.IFF_Device_Type = 0 then      //interogator
      begin
        if iffDefault.IFF_Mode = 0 then
        begin
          InterrogatorMode1 := StrToInt(OctToDec(IntToStr(iffDefault.IFF_Code)));
          if iffDefault.Mode_State = 1 then
            InterrogatorMode1Enabled := True
          else
            InterrogatorMode1Enabled := false;
        end
        else if iffDefault.IFF_Mode = 1 then
        begin
          InterrogatorMode2 := StrToInt(OctToDec(IntToStr(iffDefault.IFF_Code)));
          if iffDefault.Mode_State = 1 then
            InterrogatorMode2Enabled := True
          else
            InterrogatorMode2Enabled := false;
        end
        else if iffDefault.IFF_Mode = 2 then
        begin
          InterrogatorMode3 := StrToInt(OctToDec(IntToStr(iffDefault.IFF_Code)));
          if iffDefault.Mode_State = 1 then
            InterrogatorMode3Enabled := True
          else
            InterrogatorMode3Enabled := false;
        end;
      end
      else if iffDefault.IFF_Device_Type = 1 then      //transponder
      begin
        if iffDefault.IFF_Mode = 0 then
        begin
          TransponderMode1 := StrToInt(OctToDec(IntToStr(iffDefault.IFF_Code)));
          if iffDefault.Mode_State = 1 then
            TransponderMode1Enabled := True
          else
            TransponderMode1Enabled := False;
        end
        else if iffDefault.IFF_Mode = 1 then
        begin
          TransponderMode2 := StrToInt(OctToDec(IntToStr(iffDefault.IFF_Code)));
          if iffDefault.Mode_State = 1 then
            TransponderMode2Enabled := True
          else
            TransponderMode2Enabled := False;
        end
        else if iffDefault.IFF_Mode = 2 then
        begin
          TransponderMode3 := StrToInt(OctToDec(IntToStr(iffDefault.IFF_Code)));
          if iffDefault.Mode_State = 1 then
            TransponderMode3Enabled := True
          else
            TransponderMode3Enabled := False;
        end;
      end
    end;
  end;

  if IFFDefinition.FData.IFF_Capability = 0 then    //bisa automatic bisa manual
    ModeSearchIFF := 0 // set default automatic
  else
    ModeSearchIFF := 1;
end;

function TT3IFFSensor.InsideRange(aObject: TSimObject): boolean;
begin
  Result := False;
end;

procedure TT3IFFSensor.SensorProcess;
var
  Transponder1Target, Transponder2Target, Transponder3Target,
  Transponder3CTarget : string;
  IFFtarget : TSimObject;
  //IsOn : Boolean;
  RangeIFF : double;
  iscekIFF, isMode4 : Boolean;
  pfObject : TT3PlatformInstance;
  ix : integer;
  j : integer;
begin
  // inherited;
  j := FSimPlatforms.itemCount ;

  for ix := 0 to j - 1 do
  begin
    pfObject := TT3PlatformInstance(FSimPlatforms.getObject(ix));

    if pfObject = Parent then
    begin
      continue;
    end;

    IFFtarget := pfObject;
    CekIFF(IFFtarget, iscekIFF, isMode4);
    IFFMode(Transponder1Target, Transponder2Target, Transponder3Target,
            Transponder3CTarget);

    if IFFtarget = nil then begin
      IFFtarget := pfObject;
    end;

    if ( IFFtarget <> nil ) and ( Parent <> nil )  then
    begin
      //do something
      if (TT3PlatformInstance(IFFtarget).PlatformDomain = vhdSubsurface) and
        (TT3PlatformInstance(IFFtarget).Altitude > 0) then
      begin
        iscekIFF := False;
      end;

      RangeIFF := CalcRange(parent.getPositionX, parent.getPositionY,
                             IFFtarget.getPositionX, IFFtarget.getPositionY);

      if RangeIFF > GameDefaults.FData.Max_IFF_Range then begin
        iscekIFF := false;
      end;

      if EmconOperationalStatus = EmconOn then begin
        iscekIFF := false;
      end;

      if Assigned(OnIFFDetect) then begin
        OnIFFDetect(Parent, Self, IFFtarget, iscekIFF, isMode4, Transponder1Target,
                    Transponder2Target, Transponder3Target, Transponder3CTarget);
      end;
    end;
  end;
end;

procedure TT3IFFSensor.SetInterrogatorMode1(const Value: integer);
begin
  FInterrogatorMode1 := Value;
end;

procedure TT3IFFSensor.SetInterrogatorMode1Enabled(const Value: boolean);
begin
  FInterrogatorMode1Enabled := value;
end;

procedure TT3IFFSensor.SetInterrogatorMode2(const Value: integer);
begin
  FInterrogatorMode2 := Value;
end;

procedure TT3IFFSensor.SetInterrogatorMode2Enabled(const Value: boolean);
begin
  FInterrogatorMode2Enabled := Value;
end;

procedure TT3IFFSensor.SetInterrogatorMode3(const Value: integer);
begin
  FInterrogatorMode3 := Value;
end;

procedure TT3IFFSensor.SetInterrogatorMode3C(const Value: integer);
begin
  FInterrogatorMode3C := Value;
end;

procedure TT3IFFSensor.SetInterrogatorMode3CEnabled(const Value: boolean);
begin
  FInterrogatorMode3CEnabled := Value;
end;

procedure TT3IFFSensor.SetInterrogatorMode3Enabled(const Value: boolean);
begin
  FInterrogatorMode3Enabled := Value;
end;

procedure TT3IFFSensor.SetInterrogatorMode4Enabled(const Value: boolean);
begin
  FInterrogatorMode4Enabled := Value;
end;

procedure TT3IFFSensor.SetInterrogatorOperateStatus(
  const Value: TSensorOperationalStatus);
begin
  FInterrogatorOperateStatus := Value;

  if (FInterrogatorOperateStatus = sopOn) or  (FTransponderOperateStatus = sopOn) then
    SetIFFStatus(sopOn)
  else if  (FInterrogatorOperateStatus = sopOffIFF) and  (FTransponderOperateStatus = sopOffIFF) then
    SetIFFStatus(sopOffIFF)
  else
    SetIFFStatus(Value);

//  if FInterrogatorOperateStatus = FTransponderOperateStatus then
//    SetIFFStatus(Value);

 { case Value of
    sopOn        : SetIFFStatus(sopOn);
    sopOff       : SetIFFStatus(sopOff);
    sopActive    : SetIFFStatus(sopActive);
    sopPassive   : SetIFFStatus(sopPassive) ;
    sopDamage    : SetIFFStatus(sopDamage) ;
    sopTooDeep   : SetIFFStatus(sopTooDeep);
    sopEMCON     : SetIFFStatus(sopEMCON);
    sopUp        : SetIFFStatus(sopUp);
    sopDown      : SetIFFStatus(sopDown);
    sopStowed    : SetIFFStatus(sopStowed);
    sopStowing   : SetIFFStatus(sopStowing);
    sopDeployed  : SetIFFStatus(sopDeployed);
    sopDeploying : SetIFFStatus(sopDeploying);
    sopTooFast   : SetIFFStatus(sopTooFast);
    sopTooSlow   : SetIFFStatus(sopTooSlow);
    sopKinked    : SetIFFStatus(sopKinked) ;
    sopTooHigh   : SetIFFStatus(sopTooHigh);
  end; }

  if Assigned(FOnInterrogatorStatus) then
    FOnInterrogatorStatus(Self,Value);
end;

procedure TT3IFFSensor.SetModeSearchIFF(const value: byte);
begin
  FModeSearchIFF := value;
  if Assigned(OnModeSearchIFF) then
    OnModeSearchIFF(Self, Value);
end;

procedure TT3IFFSensor.SetOnInterrogatorStatus(
  const Value: TOnSensorOperationalStatus);
begin
  FOnInterrogatorStatus := Value;
end;

procedure TT3IFFSensor.SetOnTransponderStatus(
  const Value: TOnSensorOperationalStatus);
begin
  FOnTransponderStatus := Value;
end;

procedure TT3IFFSensor.SetTargetObject(const Value: TSimObject);
begin
  FTargetObject := Value;
end;

procedure TT3IFFSensor.SetTransponderMode1(const Value: integer);
begin
  FTransponderMode1 := Value;
end;

procedure TT3IFFSensor.SetTransponderMode1Enabled(const Value: boolean);
begin
  FTransponderMode1Enabled := Value;
end;

procedure TT3IFFSensor.SetTransponderMode2(const Value: integer);
begin
  FTransponderMode2 := Value;
end;

procedure TT3IFFSensor.SetTransponderMode2Enabled(const Value: boolean);
begin
  FTransponderMode2Enabled := Value;
end;

procedure TT3IFFSensor.SetTransponderMode3(const Value: integer);
begin
  FTransponderMode3 := Value;
end;

procedure TT3IFFSensor.SetTransponderMode3C(const Value: integer);
begin
  FTransponderMode3C := Value;
end;

procedure TT3IFFSensor.SetTransponderMode3CEnabled(const Value: boolean);
begin
  FTransponderMode3CEnabled := Value;
end;

procedure TT3IFFSensor.SetTransponderMode3Enabled(const Value: boolean);
begin
  FTransponderMode3Enabled := Value;
end;

procedure TT3IFFSensor.SetTransponderMode4Enabled(const Value: boolean);
begin
  FTransponderMode4Enabled := Value;
end;

procedure TT3IFFSensor.SetTransponderOperateStatus(
  const Value: TSensorOperationalStatus);
begin
  FTransponderOperateStatus := Value;

  if (FInterrogatorOperateStatus = sopOn) or  (FTransponderOperateStatus = sopOn) then
    SetIFFStatus(sopOn)
  else if  (FInterrogatorOperateStatus = sopOffIFF) and  (FTransponderOperateStatus = sopOffIFF) then
    SetIFFStatus(sopOffIFF)
  else if (FInterrogatorOperateStatus = sopDamage) or  (FTransponderOperateStatus = sopDamage) then
    SetIFFStatus(sopDamage)
  else
    SetIFFStatus(Value);

//  if FInterrogatorOperateStatus = FTransponderOperateStatus then
//    SetIFFStatus(Value);

  {case Value of
    sopOn        : SetIFFStatus(sopOn);
    sopOff       : SetIFFStatus(sopOff);
    sopActive    : SetIFFStatus(sopActive);
    sopPassive   : SetIFFStatus(sopPassive) ;
    sopDamage    : SetIFFStatus(sopDamage) ;
    sopTooDeep   : SetIFFStatus(sopTooDeep);
    sopEMCON     : SetIFFStatus(sopEMCON);
    sopUp        : SetIFFStatus(sopUp);
    sopDown      : SetIFFStatus(sopDown);
    sopStowed    : SetIFFStatus(sopStowed);
    sopStowing   : SetIFFStatus(sopStowing);
    sopDeployed  : SetIFFStatus(sopDeployed);
    sopDeploying : SetIFFStatus(sopDeploying);
    sopTooFast   : SetIFFStatus(sopTooFast);
    sopTooSlow   : SetIFFStatus(sopTooSlow);
    sopKinked    : SetIFFStatus(sopKinked) ;
    sopTooHigh   : SetIFFStatus(sopTooHigh);
  end;      }

  if Assigned(FOnTransponderStatus) then
    FOnTransponderStatus(Self, Value);
end;

function TT3IFFSensor.GetMaxLos(aTarget: TSimObject): double;
var
  vTarget : TT3Vehicle;
  i : integer;
  dev : TT3DeviceUnit;
  altTarget, altParent : double;   //in meter
  IFFAntenaHeightTarget : double;   //in meter
  MaxLOS : double;
begin
  result := 0;
  MaxLOS := 0;
  if not (aTarget is TT3Vehicle) then exit;

  vTarget := TT3Vehicle(aTarget);
  altTarget := vTarget.Altitude;
  altParent := TT3Vehicle(Parent).Altitude;

  for I := 0 to vTarget.Devices.Count - 1 do
  begin
    dev := vTarget.Devices.Items[i];

    if dev is TT3IFFSensor then
    begin
      IFFAntenaHeightTarget := (TT3IFFSensor(dev).FIFFDefinition.FData.Rel_Antenna_Height) * C_Feet_To_Meter;
      MaxLOS := Sqrt(17 * (IFFAntenaHeightTarget + altTarget)) +
                sqrt(17 * ((FIFFDefinition.FData.Rel_Antenna_Height * C_Feet_To_Meter) + altParent));
    end;
  end;
  result := MaxLOS * 1000 * C_Meter_To_NauticalMile;    //result in kilometer convert to nautical mile
end;

function TT3IFFSensor.GetSnapshotData : _SS_TT3IFFSensor ;
var
  I : integer ;
  ss :  _SS_TT3IFFSensor ;
begin
  ss.S := TT3Sensor(Self).GetSnapshotData;
  ss.TransponderOperateStatus := byte(TransponderOperateStatus) ;
  ss.TransponderMode1Enabled := TransponderMode1Enabled;
  ss.TransponderMode2Enabled := TransponderMode2Enabled ;
  ss.TransponderMode3Enabled := TransponderMode3Enabled ;
  ss.TransponderMode3CEnabled := TransponderMode3CEnabled ;
  ss.TransponderMode4Enabled := TransponderMode4Enabled ;
  ss.TransponderMode1 := TransponderMode1 ;
  ss.TransponderMode2 := TransponderMode2 ;
  ss.TransponderMode3 := TransponderMode3 ;

  ss.InterrogatorOperateStatus  := byte(InterrogatorOperateStatus) ;
  ss.InterrogatorMode1Enabled := InterrogatorMode1Enabled ;
  ss.InterrogatorMode2Enabled := InterrogatorMode2Enabled ;
  ss.InterrogatorMode3Enabled := InterrogatorMode3Enabled ;
  ss.InterrogatorMode3CEnabled := InterrogatorMode3CEnabled ;
  ss.InterrogatorMode4Enabled := InterrogatorMode4Enabled ;
  ss.InterrogatorMode1 := InterrogatorMode1 ;
  ss.InterrogatorMode2 := InterrogatorMode2 ;
  ss.InterrogatorMode3 := InterrogatorMode3 ;

  with IFFDefinition do begin
    ss.IFFDefinition.FData                    := FData ;
    ss.IFFDefinition.FVehicle.FData           := FVehicle.FData ;
    ss.IFFDefinition.FVehicle.FPlatform_Ident := FVehicle.FPlatform_Ident ;
    ss.IFFDefinition.FVehicle.FHeliLimitation := FVehicle.FHeliLimitation ;
    if FScripted_IFF <> nil then begin
       SetLength(ss.IFFDefinition.FScripted_IFF,FScripted_IFF.Count);
       for I := 0 to FScripted_IFF.Count - 1 do begin
          ss.IFFDefinition.FScripted_IFF[i].Event := TScripted_IFF(FScripted_IFF[i]).Event.FData ;
          ss.IFFDefinition.FScripted_IFF[i].Behav := TScripted_IFF(FScripted_IFF[i]).Behav.FData ;
       end;
    end;
    if FPattern_IFF <> nil then begin
       SetLength(ss.IFFDefinition.FPattern_IFF,FPattern_IFF.Count);
       for I := 0 to FPattern_IFF.Count - 1 do begin
          ss.IFFDefinition.FPattern_IFF[i].Event := TPattern_IFF(FPattern_IFF[i]).Event.FData ;
          ss.IFFDefinition.FPattern_IFF[i].Pattern := TPattern_IFF(FPattern_IFF[i]).Pattern.FData ;
       end;
    end;
  end;
  if TargetObject <> nil then begin
     ss.TargetObjectID  := TargetObject.ObjectID ;
  end;
  Result := ss ;
end;

procedure TT3IFFSensor.SetSnapshotData(const ss : _SS_TT3IFFSensor);
begin
  TT3Sensor(Self).SetSnapshotData(ss.S);
  TransponderOperateStatus := TSensorOperationalStatus(ss.TransponderOperateStatus) ;
  TransponderMode1Enabled := ss.TransponderMode1Enabled;
  TransponderMode2Enabled := ss.TransponderMode2Enabled ;
  TransponderMode3Enabled := ss.TransponderMode3Enabled ;
  TransponderMode3CEnabled := ss.TransponderMode3CEnabled ;
  TransponderMode4Enabled := ss.TransponderMode4Enabled ;
  TransponderMode1 := ss.TransponderMode1 ;
  TransponderMode2 := ss.TransponderMode2 ;
  TransponderMode3 := ss.TransponderMode3 ;

  InterrogatorOperateStatus  := TSensorOperationalStatus(ss.InterrogatorOperateStatus) ;
  InterrogatorMode1Enabled := ss.InterrogatorMode1Enabled ;
  InterrogatorMode2Enabled := ss.InterrogatorMode2Enabled ;
  InterrogatorMode3Enabled := ss.InterrogatorMode3Enabled ;
  InterrogatorMode3CEnabled := ss.InterrogatorMode3CEnabled ;
  InterrogatorMode4Enabled := ss.InterrogatorMode4Enabled ;
  InterrogatorMode1 := ss.InterrogatorMode1 ;
  InterrogatorMode2 := ss.InterrogatorMode2 ;
  InterrogatorMode3 := ss.InterrogatorMode3 ;

  IFFDefinition.FData := ss.IFFDefinition.FData ;
  IFFDefinition.FVehicle.FData := ss.IFFDefinition.FVehicle.FData ;
  IFFDefinition.FVehicle.FPlatform_Ident := ss.IFFDefinition.FVehicle.FPlatform_Ident ;
  IFFDefinition.FVehicle.FHeliLimitation := ss.IFFDefinition.FVehicle.FHeliLimitation ;
end;
{ TEOSensor }

constructor TT3EOSensor.Create;
begin
  inherited;

end;

procedure TT3EOSensor.Initialize;
var
  i : integer;
  blindZ : TBlindZoneVisual;
begin
  inherited;

  if Assigned(UnitDefinition) and (UnitDefinition is TEO_On_Board) then
    FEODefinition := TEO_On_Board(UnitDefinition);

  if Assigned(FEODefinition) then begin
    InstanceName := FEODefinition.FData.Instance_Identifier;
    InstanceIndex := FEODefinition.FData.EO_Instance_Index;
    DetectionRange := FEODefinition.FEO_Def.Max_Range;
    DetailDetectionRange := FEODefinition.FEO_Def.Detection_Range;

    if FEODefinition.FBlind.Count > 0 then begin
      SetLength(BZStartAngle,FEODefinition.FBlind.Count);
      SetLength(BZEndAngle,FEODefinition.FBlind.Count);

      for i := 0 to FEODefinition.FBlind.Count - 1 do begin
        blindZ := TBlindZoneVisual.Create;
        BZStartAngle[i] := TBlind_Zone(FEODefinition.FBlind.Items[i]).FData.Start_Angle;
        BZEndAngle[i]   := TBlind_Zone(FEODefinition.FBlind.Items[i]).FData.End_Angle;
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
end;

function TT3EOSensor.InsideBlindZone(aObject: TSimObject): boolean;
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
      Result := DegComp_IsBeetwen(bearing, blindZ.RelativeStartAngle, blindZ.RelativeEndAngle);
      {
      if (blindZ.RelativeStartAngle > blindZ.RelativeEndAngle) then begin
        if (bearing > blindZ.RelativeStartAngle) or
           (bearing < blindZ.RelativeEndAngle) then begin
            result := true;
            break;
        end;
      end else
      if (bearing > blindZ.RelativeStartAngle) and
         (bearing < blindZ.RelativeEndAngle) then result := false;
      }
    end;
  end
  else Result := false;
end;

function TT3EOSensor.InsideDetailRange(aObject : TSimObject) : Boolean;
var
  range : Double;
begin
  inherited;

  range   := CalcRange(FPosition.X,FPosition.Y,
           aObject.getPositionX,aObject.getPositionY);

  Result := range <= DetailDetectionRange;
end;

function TT3EOSensor.InsideOtherMeasurement(aObject: TSimObject): boolean;
var
  maxLOS, range : Double;
begin
  Result := false;

//  if (aObject is TT3PlatformInstance) and (TT3PlatformInstance(aObject).PlatformDomain = 1) then
//  Result := True;

  maxLOS := GetMaxLOSRange(aObject); {* C_Meter_To_NauticalMile}
  range  := CalcRange(Parent.PosX, Parent.PosY, aObject.PosX, aObject.PosY);

  if range <= maxLOS then
    Result := True;

end;

function TT3EOSensor.GetMaxLOSRange(aObject: TSimObject): Double;
var
  basicLOS : Double;
  TargetHeight, AntenaHeight, AntenaEOHeight   : Double;
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

  if Assigned(FEODefinition) then AntenaEOHeight := FEODefinition.FData.Antenna_Height
  else AntenaEOHeight := 0;

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
      AntenaHeight := Sqrt(Abs(13 * ((AntenaEOHeight
                      * C_Feet_To_Meter) + v.Altitude)));
    end
    else
    if (v.TrackDomain = vhdSurface) or (v.PlatformDomain = vhdSurface)
        or (v.TrackDomain = vhdLand) or (v.PlatformDomain = vhdLand)
        or (v.TrackDomain = vhdAmphibious) or (v.PlatformDomain = vhdAmphibious) then
    begin
      AntenaHeight := Sqrt(Abs(13 * (AntenaEOHeight
                      * C_Feet_To_Meter)));
    end
    else
    if (v.TrackDomain = vhdSubsurface) or (v.PlatformDomain = vhdSubsurface) then
    begin
      AntenaHeight := Sqrt(Abs(13 * ((AntenaEOHeight
                      * C_Feet_To_Meter) - v.Altitude)));
    end
    else
    begin
      AntenaHeight := Sqrt(Abs(13 * ((AntenaEOHeight
                      * C_Feet_To_Meter) + v.Altitude)));
    end;
  end
  else AntenaHeight := Sqrt(Abs(13 * (AntenaEOHeight * C_Feet_To_Meter)));

  basicLOS := TargetHeight + AntenaHeight;

  Result := basicLOS;
end;


function TT3EOSensor.InsideRange(aObject: TSimObject): boolean;
var
  range : double;
begin
  inherited;
  range   := CalcRange(FPosition.X,FPosition.Y,
           aObject.getPositionX,aObject.getPositionY);

  result := range <= DetectionRange;
end;

function TT3EOSensor.InsideVerticalCoverage(aObject: TSimObject): boolean;
var
  altitude : Double;
begin
  altitude := TT3PlatformInstance(Parent).Altitude * C_Meter_To_Feet;

  Result := altitude <= 100;
end;

function TT3EOSensor.GetSnapshotData : _SS_TT3EOSensor ;
var
  i  : integer ;
  ss :  _SS_TT3EOSensor ;
begin
  ss.S := TT3Sensor(Self).GetSnapshotData;
  with EODefinition do begin
    ss.EODefinition.FData                     := FData ;
    ss.EODefinition.FEO_Def                   := FEO_Def ;
    ss.EODefinition.FNote                     := FNote ;
    ss.EODefinition.FVehicle.FData            := FVehicle.FData ;
    ss.EODefinition.FVehicle.FPlatform_Ident  := FVehicle.FPlatform_Ident ;
    ss.EODefinition.FVehicle.FHeliLimitation  := FVehicle.FHeliLimitation ;
    if FBlind_Zone <> nil then begin
       ss.EODefinition.FBlind_Zone.FData := FBlind_Zone.FData ;
    end;
    if FBlind <> nil then begin
       SetLength(ss.EODefinition.FBlind,FBlind.Count);
       for I := 0 to FBlind.Count - 1 do begin
          ss.EODefinition.FBlind[i].FData := TBlind_Zone(FBlind[i]).FData ;
       end;
    end;
  end;
  Result := ss ;
end;

procedure TT3EOSensor.SetSnapshotData(const ss : _SS_TT3EOSensor);
begin
  TT3Sensor(Self).SetSnapshotData(ss.S);
  EODefinition.FData := ss.EODefinition.FData ;
  EODefinition.FEO_Def := ss.EODefinition.FEO_Def ;
  EODefinition.FVehicle.FData := ss.EODefinition.FVehicle.FData ;
  EODefinition.FVehicle.FPlatform_Ident := ss.EODefinition.FVehicle.FPlatform_Ident ;
  EODefinition.FVehicle.FHeliLimitation := ss.EODefinition.FVehicle.FHeliLimitation ;
end;

{ TMADSensor }

constructor TT3MADSensor.Create;
begin
  inherited;

end;

procedure TT3MADSensor.Initialize;
begin
  inherited;
  if Assigned(UnitDefinition) and (UnitDefinition is TMAD_Sensor_On_Board) then
    FMADDefinition := TMAD_Sensor_On_Board(UnitDefinition);

  if Assigned(FMADDefinition) then begin
    InstanceName := FMADDefinition.FData.Instance_Identifier;
    InstanceIndex := FMADDefinition.FData.MAD_Instance_Index;
  end;
end;

function TT3MADSensor.InsideRange(aObject: TSimObject): boolean;
var
  Max_Detection_Range, Range : Double;
begin
  inherited;

  Range := CalcRange3D(Parent.PosX, Parent.PosY, aObject.PosX,
           aObject.PosY, Parent.PosZ, aObject.PosZ);

  if aObject is TT3Vehicle then
  begin
    Max_Detection_Range := (TT3Vehicle(aObject).VehicleDefinition.FData.Magnetic_Cross /
                           (FMADDefinition.FMAD_Def.Known_Cross_Section
                            * FMADDefinition.FMAD_Def.Baseline_Detect_Range));
  end
  else
  begin
    Max_Detection_Range := 0;
  end;

  Result := Range <= Max_Detection_Range;
end;

procedure TT3MADSensor.SensorProcess;
begin
  inherited;
end;

function TT3MADSensor.GetSnapshotData : _SS_TT3MADSensor ;
var
  ss :  _SS_TT3MADSensor ;
begin
  ss.S := TT3Sensor(Self).GetSnapshotData;
  with MADDefinition do begin
    ss.MADDefinition.FData                    := FData ;
    ss.MADDefinition.FMAD_Def                 := FMAD_Def ;
    ss.MADDefinition.FNote                    := FNote ;
    ss.MADDefinition.FVehicle.FData           := FVehicle.FData ;
    ss.MADDefinition.FVehicle.FPlatform_Ident := FVehicle.FPlatform_Ident ;
    ss.MADDefinition.FVehicle.FHeliLimitation := FVehicle.FHeliLimitation ;
  end;
  Result := ss ;
end;

procedure TT3MADSensor.SetSnapshotData(const ss : _SS_TT3MADSensor);
begin
  TT3Sensor(Self).SetSnapshotData(ss.S);
  MADDefinition.FData := ss.MADDefinition.FData ;
  MADDefinition.FMAD_Def := ss.MADDefinition.FMAD_Def ;
  MADDefinition.FNote  := ss.MADDefinition.FNote ;
  MADDefinition.FVehicle.FData := ss.MADDefinition.FVehicle.FData ;
  MADDefinition.FVehicle.FPlatform_Ident := ss.MADDefinition.FVehicle.FPlatform_Ident ;
  MADDefinition.FVehicle.FHeliLimitation := ss.MADDefinition.FVehicle.FHeliLimitation ;
end;

{ TFCRSensor }

constructor TT3FCRSensor.Create;
begin
  inherited;

end;

procedure TT3FCRSensor.Initialize;
var
  i : integer;
  blindZ : TBlindZoneVisual;
begin
  inherited;
  if Assigned(UnitDefinition) and (UnitDefinition is TFCR_On_Board) then
    FFCRDefinition := TFCR_On_Board(UnitDefinition);

  if Assigned(FFCRDefinition) then begin
    InstanceName := FFCRDefinition.FData.Instance_Identifier;
    InstanceIndex := FCRDefinition.FData.FCR_Instance_Index;

    if FFCRDefinition.FBlind.Count > 0 then begin
      SetLength(BZStartAngle,FFCRDefinition.FBlind.Count);
      SetLength(BZEndAngle,FFCRDefinition.FBlind.Count);

      for i := 0 to FFCRDefinition.FBlind.Count - 1 do begin
        blindZ := TBlindZoneVisual.Create;
        BZStartAngle[i] := TBlind_Zone(FFCRDefinition.FBlind.Items[i]).FData.Start_Angle;
        BZEndAngle[i]   := TBlind_Zone(FFCRDefinition.FBlind.Items[i]).FData.End_Angle;
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
end;

function TT3FCRSensor.InsideBlindZone(aObject: TSimObject): boolean;
begin
  Result := inherited;
end;

function TT3FCRSensor.GetSnapshotData : _SS_TT3FCRSensor ;
var
  i  : integer ;
  ss :  _SS_TT3FCRSensor ;
begin
  ss.S := TT3Sensor(Self).GetSnapshotData;
  with FCRDefinition do begin
    ss.FCRDefinition.FData    := FData ;
    ss.FCRDefinition.FFCR_def := FFCR_def ;
    ss.FCRDefinition.FNote    := FNote ;
    if FBlind_Zone <> nil then begin
      ss.FCRDefinition.FBlind_Zone.FData := FBlind_Zone.FData ;
    end;
    if FBlind <> nil then begin
       SetLength(ss.FCRDefinition.FBlind,FBlind.Count);
       for I := 0 to FBlind.Count - 1 do begin
          ss.FCRDefinition.FBlind[i].FData := TBlind_Zone(FBlind[i]).FData ;
       end;
    end;
  end;
  Result := ss ;
end;

procedure TT3FCRSensor.SetSnapshotData(const ss : _SS_TT3FCRSensor);
begin
  TT3Sensor(Self).SetSnapshotData(ss.S);
  FCRDefinition.FData := ss.FCRDefinition.FData ;
  FCRDefinition.FFCR_def := ss.FCRDefinition.FFCR_def ;
end;


{ RecIFF }

constructor RecIFF.Create;
begin
  inherited;

//  Data := nil;
end;

destructor RecIFF.Destroy;
begin
//  if Assigned(Data) then
//    Data := nil;

  inherited;
end;

end.
