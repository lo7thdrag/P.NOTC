 unit uT3Sonar;

interface

uses uT3Sensor, uDBAsset_Sonar, tttData, uSimObjects, uT3SonarCD,
  newClassASTT, math, uGameData_TTT, uSnapshotData,uSteppers,Graphics,
  uDBAssets_SubAreaEnviroDefinition, uDBAsset_GameEnvironment;

type
  TT3Sonar = class(TT3Sensor)
  private
    FSNRData: TT3Sonar_Curve_Def;
    FSonarDefinition: TSonar_On_Board;
    FControlMode: TSonarControlMode;
    FOnControlMode: TOnSonarControlMode;
    FLastDirPlatform : double;
    FSonarCategory: TSonarCategory;

    FActiveDetectionRange : Single;
    FPassiveDetectionRange : Single;
    FTimeDeploy : Integer; //second
    FTimeStow : Integer;
    FDepthCable : Double; //feet
    FActualCable : Double;
    FOrderCable : Double;
    FTIOWRange : TSonarTIOWRange;
    FUpdateDelay: TDelayer; // update from data,
    tmpActualCable : Double;

    procedure SetControlMode(const Value: TSonarControlMode);
    procedure SetOnControlMode(const Value: TOnSonarControlMode);
    function  SonarDepth(aSonarType: TSonarCategory): double;
    function  MaximumRange(aSonarMode: TSonarControlMode): double;
    procedure SetSonarCategory(const Value: TSonarCategory);
    procedure SetTIOWRange(const Value: TSonarTIOWRange);
    procedure OnUpdateDelay(Sender: TObject);
    procedure ShadowZonesProcessing(var Data: Double);  //in nauticalMiles

    //------------ cendol dlu gk da yg manggil -----------//
    //function  TASCriteria(aDt : double) : boolean;
    //function  BasicLOSRange(aObject : TSimObject) : double;
    //function  AmbientNoise(aMode : TSensorOperatingMode) : double;
    function  DetectionFactor(aSonarMode: TSonarControlMode; aFreq : Double): double;
    function  OperatingFrequency(aSonarMode: TSonarControlMode; aTarget: TObject): double;
    function  ShipLevelNoise(freq : double; ShippingRateType : Byte) : double;
    function  SeaState(freq : double; SeaStateSetting : Byte) : double;
    function  RainFallRate(freq : double; RainRateSetting : Byte) : double;
    //------------ cendol dlu gk da yg manggil ------------//

    function GetSubArea(aObject: TSimObject): TSubArea_Enviro_Definition; //jika result nill maka berada pada global environment
    function SubAreaBoundaryProcessing(aTarget : TSimObject) : Boolean;
    function GetTargetStrengthSourceLevel(aSonarMode: TSonarControlMode; aObject: TSimObject): Double;
    function GetTransmissionLossType(aobject : TSimObject):TSonarTransmissionLossType;
    function ComputeTransmissionLoss(aTarget : TSimObject; aTranmissionType : TSonarTransmissionLossType; aFreq : double): Double;
    function BottomBounceProcessing(aTarget : TSimObject; aFreq: Double): double;
    function getBottomAttenuationPerBounce(BottomLossCoef : Byte): Double;

    function ConvergenceZoneProcessing(aTarget : TSimObject) : Double;
    function TargetInConvergenceZone(aTarget : TSimObject; aWidth, aInterval : Double) : Boolean;
    function SpeedRelatedOwnshipNoise(aParentSonar : TSimObject): Double;
    function getWaveHeight(fr : Double; iSeaState : Byte) : Double;
    //function Ownshipnoise
  protected

  public
    isDeploy : Boolean;
    DeployCounter : Double;
    isParam : Byte; //jika 1 deploy, jika 2 stow
    ActiveTIOW : Integer;  //second
    timeToActive : Integer;//digunakan untuk semua,, saat deploy,stow,active,passive

    constructor Create; override;
    destructor Destroy; override; //mk 10042012

    procedure Initialize; override;
    procedure Move(const aDeltaMs: double); override;
    procedure SensorProcess; override;
    function GetSnapshotData : _SS_TT3Sonar ;
    procedure SetSnapshotData(const ss : _SS_TT3Sonar);

    function TargetTypeEligiblity(aTarget: TObject): boolean; override;
    function InsideBlindZone(aObject: TSimObject): boolean; override;
    function InsideOtherMeasurement(aObject: TSimObject): boolean; override;
    function InsideRange(aObject : TSimObject) : boolean; override;
    function InsideDetailRange(aObject : TSimObject) : Boolean; override;
    function MaxSonarSpeed(aObject : TSimObject) : Boolean; override;
    function InsideVerticalCoverage(aObject : TSimObject) : boolean; override; //mk 20042012
    function SonarCek(pfObject, aParent: TSimObject): Boolean;
    function delayTime(pfObject:TSimObject):Integer; override;

    property SonarDefinition: TSonar_On_Board read FSonarDefinition;
    property ControlMode: TSonarControlMode read FControlMode write
      SetControlMode;
    property OnControlMode: TOnSonarControlMode read FOnControlMode write
      SetOnControlMode;
    property SonarCategory : TSonarCategory read FSonarCategory write SetSonarCategory;
    property SNRData: TT3Sonar_Curve_Def read FSNRData;
    property ActiveDetectionRange : Single read FActiveDetectionRange write FActiveDetectionRange;
    property PassiveDetectionRange : Single read FPassiveDetectionRange write FPassiveDetectionRange;
    property TimeDeploy : Integer read FTimeDeploy write FTimeDeploy;
    property TimeStow : Integer read FTimeStow write FTimeStow;

    property DepthCable : Double read FDepthCable write FDepthCable;
    property ActualCable : Double read FActualCable write FActualCable;
    property OrderCable : Double read FOrderCable write FOrderCable;
    property TIOWRange : TSonarTIOWRange read FTIOWRange write SetTIOWRange;
  end;

tDoublePoint = record
    X, Y: double;
  end;

  function FN_Intersect(const p1, p2, p3, p4: tDoublePoint): boolean;
  function FN_CCW(const p0, p1, p2: tDoublePoint): integer;

implementation

uses uObjectVisuals, uDBBlind_Zone, uBaseCoordSystem, uT3Unit, uT3Vehicle,
  uT3Torpedo, uT3Mine, uT3Missile, uDBAsset_Scripted,
  uT3Common;

{ TT3Sonar }

(*
  Fungsi menghitung Basic LOS sonar
  Parameter :
    aObject : object platform
*)

//function TT3Sonar.AmbientNoise(aMode : TSensorOperatingMode) : double;
//var
//  nFreq, nShipLevelNoise, nSeaState : Double;
//begin
//  nFreq := OperatingFrequency(aMode);
//
//  nShipLevelNoise := ShipLevelNoise(nFreq);
//  nSeaState := SeaState(nFreq);
//
//  result := nShipLevelNoise + nSeaState;
//end;

//function TT3Sonar.BasicLOSRange(aObject: TSimObject): double;
//var
//  depthObj, depthpf : double;
//begin
//  depthObj := Abs(TT3PlatformInstance(aObject).Altitude); {meter}
//  depthpf  := SonarDepth(FSonarCategory); {meter}
//
//  result := Sqrt(Abs(17 * depthpf)) + Sqrt(Abs(17 * depthObj));
//end;

function TT3Sonar.BottomBounceProcessing(aTarget: TSimObject;
  aFreq: Double): double;
var
  NumberOfBounce : Double;
  SurfaceAttenuationPerBounce : Double;
  BottomAttenuationPerBounce : Double;
  BottomBounceAttenuation : Double;
  RangeToTarget : Double;
  sub : TSubArea_Enviro_Definition;
  WaveHeight : Double;
begin
  Result := 0;
  sub := GetSubArea(Parent);
  WaveHeight := getWaveHeight(aFreq, Environment.FData.Sea_State);

  RangeToTarget := C_NauticalMile_To_Feet * CalcRange3D(FPosition.X, FPosition.Y,
                               aTarget.getPositionX, aTarget.getPositionY,
                               FPosition.Z, aTarget.getPositionZ);
  if Assigned(sub) then
  begin
    if (sub.FData.Ave_Ocean_Depth <> 0) then
    begin
      NumberOfBounce := RangeToTarget / (2 * sub.FData.Ave_Ocean_Depth);
      SurfaceAttenuationPerBounce := 10 * Log10(1 - (0.0234 * Power((aFreq*WaveHeight), 1.5)));
      BottomAttenuationPerBounce := getBottomAttenuationPerBounce(sub.FData.Bottomloss_Coefficient);
      BottomBounceAttenuation := NumberOfBounce * (SurfaceAttenuationPerBounce + BottomAttenuationPerBounce);
      Result := BottomBounceAttenuation;
    end;
  end
  else
  begin
    if (Environment.FData.Ave_Ocean_Depth <> 0) then
    begin
      NumberOfBounce := RangeToTarget / (2 * Environment.FData.Ave_Ocean_Depth);
      SurfaceAttenuationPerBounce := 10 * Log10(1 - (0.0234 * Power((aFreq*WaveHeight), 1.5)));
      BottomAttenuationPerBounce := getBottomAttenuationPerBounce(Environment.FData.Bottomloss_Coefficient);
      BottomBounceAttenuation := NumberOfBounce * (SurfaceAttenuationPerBounce + BottomAttenuationPerBounce);
      Result := BottomBounceAttenuation;
    end;
  end;
end;

function TT3Sonar.ComputeTransmissionLoss( aTarget : TSimObject;
  aTranmissionType: TSonarTransmissionLossType; aFreq: double): Double;
var
  Alpha : Double;
  SlantRange : Double;
  SubArea : TSubArea_Enviro_Definition;
  DuctDepth : Double;
  SphericalTresholdRange : Double;

begin
  Result := 0;
  Alpha := (0.036 * aFreq * aFreq) / (3600 + (aFreq * aFreq) + (0.00000032 * (aFreq * aFreq)));
  SlantRange := C_NauticalMile_To_Metre * CalcRange3D(FPosition.X, FPosition.Y,
               aTarget.getPositionX, aTarget.getPositionY,
               FPosition.Z, aTarget.getPositionZ);
  if aTranmissionType = Spherical then
  begin
    if SlantRange > 0 then
      Result := (20 * Log10(SlantRange)) + ((Alpha * SlantRange));   //result Transmission Loss
  end
  else if aTranmissionType = Cylindrical then
  begin
    SubArea := GetSubArea(Parent);
    if Assigned(SubArea) then
    begin
      if SubArea.FData.Thermal_Layer_Depth = 0 then
        DuctDepth := SubArea.FData.Ave_Ocean_Depth
      else
        DuctDepth := SubArea.FData.Thermal_Layer_Depth
    end
    else
    begin
      if Environment.FData.Thermal_Layer_Depth = 0 then
        DuctDepth := Environment.FData.Ave_Ocean_Depth
      else
        DuctDepth := Environment.FData.Thermal_Layer_Depth
    end;
    if DuctDepth >= 0 then
    begin
      SphericalTresholdRange := 1050 * (Sqrt(DuctDepth));
      if (SlantRange > 0) and (SphericalTresholdRange > 0) then
        Result := (10 * Log10(SlantRange)) + (10 * Log10(SphericalTresholdRange)) +
                  (Alpha * SlantRange);
    end;
  end;
end;

function TT3Sonar.ConvergenceZoneProcessing(aTarget: TSimObject): Double;
var
  HorizontalRange : Double;
  ClosestCZ : Integer;
  CZCentreRange : Double;
  CZHalfWidth : Double;
  CZStartRange : Double;
  CZEndRange : Double;
  WidthCZ : array of Double;
  inCZ : Boolean;
  CZReductionTerm : Double;
begin
  Result := 0;

  if (Environment.FData.CZ_Active <> 0) and
     (SonarDepth(FSonarCategory) < Environment.FGlobal_Conv.Max_Sonar_Depth) and
     (TT3PlatformInstance(aTarget).Altitude < Environment.FGlobal_Conv.Max_Sonar_Depth) then
  begin
    HorizontalRange := CalcRange(FPosition.X, FPosition.Y,
                                 aTarget.getPositionX, aTarget.getPositionY);
    if Environment.FGlobal_Conv.Occurance_Range <> 0 then
    begin
      ClosestCZ := Round(HorizontalRange / Environment.FGlobal_Conv.Occurance_Range);
      SetLength(WidthCZ,ClosestCZ);

      if (ClosestCZ = 0) or (ClosestCZ > 6) then
      begin
        Result := 0;
        Exit;
      end
      else
      begin
        CZCentreRange := ClosestCZ * Environment.FGlobal_Conv.Occurance_Range;
        CZHalfWidth := (ClosestCZ * Environment.FGlobal_Conv.Width) / 2;
        CZStartRange := CZCentreRange - CZHalfWidth;
        CZEndRange := CZCentreRange + CZHalfWidth;

        inCZ := TargetInConvergenceZone(aTarget,Environment.FGlobal_Conv.Width, Environment.FGlobal_Conv.Occurance_Range);

        if (HorizontalRange > CZStartRange) and (HorizontalRange < CZEndRange) and (inCZ) then
        begin
          CZReductionTerm := (Environment.FGlobal_Conv.Increase_per_CZ - (ClosestCZ - 1)) *
                             Environment.FGlobal_Conv.Signal_Reduction_Term;
          Result := CZReductionTerm;
        end;
      end;
    end;
  end;
end;

function TT3Sonar.TargetInConvergenceZone(aTarget: TSimObject; aWidth,
  aInterval: Double): Boolean;
var
 i : Integer;
 range : Double;
 CZCount : Integer;
 HalfWidthCZ : array of double;
begin
  Result := false;
  range := CalcRange(FPosition.X, FPosition.Y,
                     aTarget.getPositionX, aTarget.getPositionY);
  if aInterval <> 0 then
  begin
    CZCount := Round(range/aInterval);

    SetLength(HalfWidthCZ, CZCount);

    for I := 0 to CZCount - 1 do
    begin
      HalfWidthCZ[i] := (aWidth * (i+1))/2;
      if (range > ((aInterval*(i+1)) - HalfWidthCZ[i])) and
         (range < ((aInterval*(i+1)) + HalfWidthCZ[i]))  then
      begin
        result := True;
        Exit;
      end;
    end;
  end;
end;

constructor TT3Sonar.Create;
begin
  inherited;

  FSNRData := TT3Sonar_Curve_Def.Create;
  FLastDirPlatform := 0;
  isDeploy := false;
  DeployCounter := 0;
  TimeDeploy := 0;
  DepthCable := 0;
  isParam := 0;
  ActiveTIOW := 0;
  timeToActive := 0;
  ActualCable := 0;
  OrderCable := 0;
  TIOWRange := strShort;

  FUpdateDelay := TDelayer.Create;
  FUpdateDelay.DInterval := 1;
  FUpdateDelay.OnTime := OnUpdateDelay;
  FUpdateDelay.Enabled := True;
end;

function TT3Sonar.delayTime(pfObject:TSimObject): Integer;
var
  rangeTIOW, range:Double;
begin
  range   := CalcRange(FPosition.X,FPosition.Y,
           pfObject.getPositionX,pfObject.getPositionY);

   rangeTIOW := (range*C_NauticalMile_To_Yards)/1000;
   if rangeTIOW <= FSonarDefinition.FDef.TIOW_Short_Range then         //short range
     ActiveTIOW := Round(FSonarDefinition.FDef.Active_Int_Period)
   else if (rangeTIOW > FSonarDefinition.FDef.TIOW_Short_Range) and    //medium range
        (rangeTIOW <= FSonarDefinition.FDef.TIOW_Medium_Range) then
     ActiveTIOW := Round((FSonarDefinition.FDef.Active_Int_Period * FSonarDefinition.FDef.TIOW_Medium_Range)/
                    FSonarDefinition.FDef.TIOW_Short_Range)
   else                                                                 //long range
     ActiveTIOW := Round((FSonarDefinition.FDef.Active_Int_Period * FSonarDefinition.FDef.TIOW_Long_Range)/
                    FSonarDefinition.FDef.TIOW_Short_Range);

   Result := ActiveTIOW;
end;

destructor TT3Sonar.Destroy;  //---mk 14042012
begin
  inherited;

  FSNRData.Destroy;         //17042012 mk
end;

function TT3Sonar.getBottomAttenuationPerBounce(BottomLossCoef: Byte): Double;
begin
  Result := 0;

  if BottomLossCoef = 1 then
    Result := 5.45
  else if BottomLossCoef = 2 then
    Result := 7.44
  else if BottomLossCoef = 3 then
    Result := 9.51
  else if BottomLossCoef = 4 then
    Result := 12.69
  else if BottomLossCoef = 5 then
    Result := 14.56
  else if BottomLossCoef = 6 then
    Result := 18.81
  else if BottomLossCoef = 7 then
    Result := 21.88
  else if BottomLossCoef = 8 then
    Result := 26.00
  else if BottomLossCoef = 9 then
    Result := 30.39

end;

//----

(*
  Function to compute detection factor
  Parameter :
  aSonarMode : sonar operating mode in active, passive, active/passive or
  passive intercep
*)

function TT3Sonar.DetectionFactor(aSonarMode: TSonarControlMode; aFreq : Double): double;
begin
//  result := FSNRData.getMaxSNRRatio +
//        FSonarDefinition.FDef.Known_Cross_Section -
//        (40 * Log10(FSonarDefinition.FDef.Active_Detect_Range))
//         - (SeaState(aFreq, 0) +
//            ShipLevelNoise(aFreq,0));

  Result := 0;


  case aSonarMode of
    scmPassive :
    begin
      if FSonarDefinition.FDef.Passive_Detect_Range > 0 then
        result := FSNRData.getMaxSNRRatio +
          FSonarDefinition.FDef.Known_Signal_Source -
          (20 * Log10(FSonarDefinition.FDef.Passive_Detect_Range))
           - (SeaState(aFreq,0) +
              ShipLevelNoise(aFreq,0));
    end;

    scmActive:
    begin
      if FSonarDefinition.FDef.Active_Detect_Range > 0 then
      result := FSNRData.getMaxSNRRatio +
        FSonarDefinition.FDef.Known_Cross_Section -
        (40 * Log10(FSonarDefinition.FDef.Active_Detect_Range))
         - (SeaState(aFreq,0) +
            ShipLevelNoise(aFreq,0));
    end;
  end;
end;

procedure TT3Sonar.Initialize;
var
  blindZ: TBlindZoneVisual;
  podSNR: TPOD_vs_SNR_Point;
  i: integer;
begin
  inherited;

  if Assigned(Parent) then
    FLastDirPlatform := TT3PlatformInstance(Parent).Course;

  if Assigned(UnitDefinition) and (UnitDefinition is TSonar_On_Board) then
    FSonarDefinition := TSonar_On_Board(UnitDefinition);

  if Assigned(FSonarDefinition) then
  begin
    DetectionRange := FSonarDefinition.FDef.Max_Detect_Range;
    ActiveDetectionRange := FSonarDefinition.FDef.Active_Detect_Range;
    PassiveDetectionRange := FSonarDefinition.FDef.Passive_Detect_Range;

    InstanceName := FSonarDefinition.FData.Instance_Identifier;
    InstanceIndex := FSonarDefinition.FData.Sonar_Instance_Index;

    case FSonarDefinition.FDef.Sonar_Classification of
      0: OperatingMode := somActive;
      1: OperatingMode := somPassive;
      2: OperatingMode := somActivePassive;
      3: OperatingMode := somPassiveIntercept;
    end;

    case FSonarDefinition.FDef.Sonar_Category_Index of
      0 : FSonarCategory := scHMS;
      1 : FSonarCategory := scVDS;
      2 : FSonarCategory := scTAS;
      3 : FSonarCategory := scSonobuoy;
      4 : FSonarCategory := scDipping;
    end;

    FTIOWRange := strShort;

    if FSonarDefinition.FBlind.Count > 0 then
    begin
      SetLength(BZStartAngle, FSonarDefinition.FBlind.Count);
      SetLength(BZEndAngle, FSonarDefinition.FBlind.Count);

      for i := 0 to FSonarDefinition.FBlind.Count - 1 do
      begin
        blindZ := TBlindZoneVisual.Create;
        BZStartAngle[i] := TBlind_Zone(FSonarDefinition.FBlind.Items[i])
          .FData.Start_Angle;
        BZEndAngle[i] := TBlind_Zone(FSonarDefinition.FBlind.Items[i])
          .FData.End_Angle;
        blindZ.StartAngle := BZStartAngle[i];
        blindZ.EndAngle := BZEndAngle[i];
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

    // initiate POD_SNR_Curve
    for i := 0 to FSonarDefinition.FPOD.Count - 1 do begin
      podSNR := FSonarDefinition.FPOD.Items[i];
      FSNRData.addData(podSNR.FData.SNR_Ratio,
        podSNR.FData.Prob_of_Detection);
    end;
  end;
end;

function TT3Sonar.InsideBlindZone(aObject: TSimObject): boolean;
var
  i: integer;
  blindZ: TBlindZoneVisual;
  bearing: double;
begin
  Result := inherited;

  bearing := CalcBearing(FPosition.X, FPosition.Y,
             TT3PlatformInstance(aObject).getPositionX,
             TT3PlatformInstance(aObject).getPositionY);

  // periksa apakah didalam area blind zone
  if FBlindZoneViews.Count > 0 then
  begin
    for i := 0 to FBlindZoneViews.Count - 1 do
    begin
      blindZ := TBlindZoneVisual(FBlindZoneViews.Items[i]);
      Result := DegComp_IsBeetwen(bearing, blindZ.RelativeStartAngle, blindZ.RelativeEndAngle); //mk 14042012
    end;
  end
  else
    result := false;
end;

function TT3Sonar.InsideOtherMeasurement(aObject: TSimObject): boolean;
begin
  inherited;
  result := TargetTypeEligiblity(aObject);

  //if result and (FSonarCategory = scTAS) then
  //  result := TASCriteria()
end;

function TT3Sonar.InsideRange(aObject: TSimObject): boolean;
var
  range : double;
begin
  inherited;
  if TT3PlatformInstance(aObject).PlatformDomain = vhdAir then
  begin
    Result := False;
    Exit;
  end;

  range   := CalcRange(FPosition.X,FPosition.Y,
           aObject.getPositionX,aObject.getPositionY);

  result := range <= MaximumRange(ControlMode);
  
end;

function TT3Sonar.InsideDetailRange(aObject : TSimObject) : Boolean;
var
  range : Double;
begin
  inherited;
  range   := CalcRange(FPosition.X,FPosition.Y,
           aObject.getPositionX,aObject.getPositionY);

  Result := range <= DetailDetectionRange;
end;

(*
  Sonar maximum operating range, depend on operating mode.
  Passive : MAXIMUM DETECTION RANGE
  Active  : Selected TIOW --> SHORT, MEDIUM, LONG : selected by operator  (kyards)

  Parameter :
  aSonarMode : Operating mode
  Output  : range (nm)
*)

function TT3Sonar.MaximumRange(aSonarMode: TSonarControlMode): Double;
begin
  Result := SonarDefinition.FDef.Max_Detect_Range;

  case aSonarMode of
    scmActive:
      begin
        case FTIOWRange of
          strShort  : result := (1000 / C_NauticalMile_To_Yards) * SonarDefinition.FDef.TIOW_Short_Range;
          strMedium : result := (1000 / C_NauticalMile_To_Yards) * SonarDefinition.FDef.TIOW_Medium_Range;
          strLong   : result := (1000 / C_NauticalMile_To_Yards) * SonarDefinition.FDef.TIOW_Long_Range;
        end;
      end;
    scmPassive:
      result := SonarDefinition.FDef.Max_Detect_Range;
  else
    result := SonarDefinition.FDef.Max_Detect_Range;    //mk 14042012
  end;
end;

function TT3Sonar.MaxSonarSpeed(aObject: TSimObject): Boolean;
var
  pfSpeed : Double;
begin
  Result := inherited;

  pfSpeed := TT3PlatformInstance(aObject).Speed;
  if pfSpeed > FSonarDefinition.FDef.Maximum_Sonar_Speed then
    Result := False
end;

procedure TT3Sonar.Move(const aDeltaMs: double);
begin
  inherited;

  if not isDeploy then exit;

  DeployCounter := DeployCounter + aDeltaMs;
  if DeployCounter > timeToActive then
  begin
     OnUpdateActualCable(TT3PlatformInstance(Parent).InstanceIndex,
                      CSENSOR_TYPE_SONAR, InstanceIndex, OrderCable);

    //Do Something
    if isParam = 1 then   //deployed
    begin
     OnDeploySonar(TT3PlatformInstance(Parent).InstanceIndex,
                  CSENSOR_TYPE_SONAR,
                  InstanceIndex,
                  CORD_ID_ControlMode,
                  byte(scmDeployed));
    end
    else
    if isParam = 2 then     //stowed
    begin
      OnDeploySonar(TT3PlatformInstance(Parent).InstanceIndex,
                  CSENSOR_TYPE_SONAR,
                  InstanceIndex,
                  CORD_ID_ControlMode,
                  byte(scmStowed));
    end
    else
    if isParam = 3 then     //active
    begin
      OnDeploySonar(TT3PlatformInstance(Parent).InstanceIndex,
                  CSENSOR_TYPE_SONAR,
                  InstanceIndex,
                  CORD_ID_ControlMode,
                  byte(scmActive));
    end
    else
    if isParam = 4 then     //passive
    begin
      OnDeploySonar(TT3PlatformInstance(Parent).InstanceIndex,
                  CSENSOR_TYPE_SONAR,
                  InstanceIndex,
                  CORD_ID_ControlMode,
                  byte(scmPassive));
    end
    else
    if isParam = 5 then     //deploy keatas
    begin
      OnDeploySonar(TT3PlatformInstance(Parent).InstanceIndex,
                  CSENSOR_TYPE_SONAR,
                  InstanceIndex,
                  CORD_ID_ControlMode,
                  byte(scmDeployed));
    end;

    isDeploy := false;
    DeployCounter := 0;
    isParam := 0;
  end
  else
  begin
    if isParam = 1 then  //deploying
    begin
      tmpActualCable := ((DeployCounter*SonarDefinition.FDef.Sonar_Depth_Rate_of_Change)/C_Meter_To_Feet);

      FUpdateDelay.Run(aDeltaMs);

    end
    else
    if (isParam = 2) or (isParam = 5)  then  //stowing
    begin
      FUpdateDelay.Run(aDeltaMs);

    end;


  end;
end;

procedure TT3Sonar.OnUpdateDelay(Sender: TObject);
begin
  case isParam of
    1 :
    begin
      OnUpdateFormSonar(TT3PlatformInstance(Parent).InstanceIndex,
                        CSENSOR_TYPE_SONAR,
                        InstanceIndex,
                        Round((ActualCable)+tmpActualCable), isParam, Round(OrderCable));
    end;

    2,5 :
    begin
       OnUpdateFormSonar(TT3PlatformInstance(Parent).InstanceIndex,
                        CSENSOR_TYPE_SONAR,
                        InstanceIndex,
                        Round((ActualCable)-DeployCounter), isParam, Round(OrderCable));
    end;
  end;
end;

(*
  Sonar operating frequency, depend on operating mode.
  Passive : Sonar's PASSIVE FREQ OF OPERATION
  Active  : Sonar's ACTIVE FREQ OF OPERATION
  Passive Intercept : Target Sonar's ACTIVE FREQ OF OPERATION
  Parameter :
  aSonarMode : Operating mode
  aTarget : Target sonar
  Output  : Freq (kHz)
*)

function TT3Sonar.OperatingFrequency(aSonarMode: TSonarControlMode;
  aTarget: TObject) : Double;
var
  i : integer;
  v : TT3Vehicle;
  dev : TT3DeviceUnit;
  SonarTarget : TT3Sonar;
begin
  Result := 0;
  v := TT3Vehicle(aTarget);

  if aSonarMode = scmPassive then
  begin
    if OperatingMode = somPassiveIntercept then
    begin
      for I := 0 to v.Devices.Count - 1 do
      begin
        dev := v.Devices.Items[i];
        if dev is TT3Sonar then
        begin
          SonarTarget := TT3Sonar(dev);
          if SonarTarget.ControlMode = scmActive then
            Result := SonarTarget.FSonarDefinition.FDef.Active_Freq_of_Op
          else
            Result := 0;
        end;
      end;
    end
    else
      Result := FSonarDefinition.FDef.Passive_Freq_of_Op;
  end
  else if aSonarMode = scmActive then
    Result := FSonarDefinition.FDef.Active_Freq_of_Op;


//  case aSonarMode of
//    somActive:
//      result := FSonarDefinition.FDef.Active_Freq_of_Op;
//    somPassive:
//      result := FSonarDefinition.FDef.Passive_Freq_of_Op;
//    somActivePassive:
//      result := FSonarDefinition.FDef.Active_Freq_of_Op;  //mk 14042012
//    somPassiveIntercept:
//      result := FSonarDefinition.FDef.Active_Freq_of_Op; //mk 14042012
//  end;
end;

function TT3Sonar.RainFallRate(freq: double; RainRateSetting: Byte): double;
var
  i : integer;
  noise : TRecGame_Rainfall_On_Sonar;
  found : boolean;
  tmpRainRate1, tmpRainRate2 : Double;
begin
  Result := 0;

  if Length(GameDefaults.FGameRainfall_Sonar) <= 0 then
    Result := 0
  else
  begin
    found := False;

    for I := 0 to Length(GameDefaults.FGameRainfall_Sonar) - 1 do
    begin
      noise := GameDefaults.FGameRainfall_Sonar[i];

      if (freq > noise.Sonar_Frequency / 1000) then
        Continue
      else
      begin
        if  i = 0 then
        begin
          case RainRateSetting of
            0 : Result := noise.Rain_0_Effect;
            1 : Result := noise.Rain_1_Effect;
            2 : Result := noise.Rain_2_Effect;
            3 : Result := noise.Rain_3_Effect;
            4 : Result := noise.Rain_4_Effect;
            5 : Result := noise.Rain_5_Effect;
            6 : Result := noise.Rain_6_Effect;
          end;
          found := True;
          Break;
        end
        else
        begin
          tmpRainRate1 := 0;
          tmpRainRate2 := 0;

          case RainRateSetting of
            0 :
            begin
              tmpRainRate1 := FSonarDefinition.FRainRateNoiseData[i-1].Rain_0_Effect;
              tmpRainRate2 := noise.Rain_0_Effect;
            end;
            1 :
            begin
              tmpRainRate1 := FSonarDefinition.FRainRateNoiseData[i-1].Rain_1_Effect;
              tmpRainRate2 := noise.Rain_1_Effect;
            end;
            2 :
            begin
              tmpRainRate1 := FSonarDefinition.FRainRateNoiseData[i-1].Rain_2_Effect;
              tmpRainRate2 := noise.Rain_2_Effect;
            end;
            3 :
            begin
              tmpRainRate1 := FSonarDefinition.FRainRateNoiseData[i-1].Rain_3_Effect;
              tmpRainRate2 := noise.Rain_3_Effect;
            end;
            4 :
            begin
              tmpRainRate1 := FSonarDefinition.FRainRateNoiseData[i-1].Rain_4_Effect;
              tmpRainRate2 := noise.Rain_4_Effect;
            end;
            5 :
            begin
              tmpRainRate1 := FSonarDefinition.FRainRateNoiseData[i-1].Rain_5_Effect;
              tmpRainRate2 := noise.Rain_5_Effect;
            end;
            6 :
            begin
              tmpRainRate1 := FSonarDefinition.FRainRateNoiseData[i-1].Rain_6_Effect;
              tmpRainRate2 := noise.Rain_6_Effect;
            end;
          end;

          Result := Interpolate(freq,
                    FSonarDefinition.FRainRateNoiseData[i-1].Sonar_Frequency / 1000,
                    tmpRainRate1,
                    noise.Sonar_Frequency / 1000,
                    tmpRainRate2);

          found := True;
          Break;
        end;
      end;
    end;

    if not found then
    begin
      case RainRateSetting of
        0 : Result := FSonarDefinition.FRainRateNoiseData[
                Length(FSonarDefinition.FRainRateNoiseData)-1].Rain_0_Effect;
        1 : Result := FSonarDefinition.FRainRateNoiseData[
                Length(FSonarDefinition.FRainRateNoiseData)-1].Rain_1_Effect;
        2 : Result := FSonarDefinition.FRainRateNoiseData[
                Length(FSonarDefinition.FRainRateNoiseData)-1].Rain_2_Effect;
        3 : Result := FSonarDefinition.FRainRateNoiseData[
                Length(FSonarDefinition.FRainRateNoiseData)-1].Rain_3_Effect;
        4 : Result := FSonarDefinition.FRainRateNoiseData[
                Length(FSonarDefinition.FRainRateNoiseData)-1].Rain_4_Effect;
        5 : Result := FSonarDefinition.FRainRateNoiseData[
                Length(FSonarDefinition.FRainRateNoiseData)-1].Rain_5_Effect;
        6 : Result := FSonarDefinition.FRainRateNoiseData[
                Length(FSonarDefinition.FRainRateNoiseData)-1].Rain_6_Effect;
      end;
    end;
  end;
end;


function TT3Sonar.SeaState(freq: double; SeaStateSetting : Byte): double;
var
  i : integer;
  noise : TRecGame_Sea_On_Sonar;
  found : boolean;
  tmpSeaState1, tmpSeaState2 : Double;
begin
  Result := 0;

  if Length(GameDefaults.FGameSea_Sonar) <= 0 then
    Result := 0
  else
  begin
    found := False;

    for I := 0 to Length(GameDefaults.FGameSea_Sonar) - 1 do
    begin
      noise := GameDefaults.FGameSea_Sonar[i];

      if (freq > noise.Sonar_Frequency / 1000) then
        Continue
      else
      begin
        if  i = 0 then
        begin
          case SeaStateSetting of
            0 : Result := noise.Sea_0_Effect;
            1 : Result := noise.Sea_1_Effect;
            2 : Result := noise.Sea_2_Effect;
            3 : Result := noise.Sea_3_Effect;
            4 : Result := noise.Sea_4_Effect;
            5 : Result := noise.Sea_5_Effect;
            6 : Result := noise.Sea_6_Effect;
            7 : Result := noise.Sea_7_Effect;
            8 : Result := noise.Sea_8_Effect;
            9 : Result := noise.Sea_9_Effect;
          end;
          found := True;
          Break;
        end
        else
        begin
          tmpSeaState1 := 0;
          tmpSeaState2 := 0;

          case SeaStateSetting of
            0 :
            begin
              tmpSeaState1 := FSonarDefinition.FSeaStateNoiseData[i-1].Sea_0_Effect;
              tmpSeaState2 := noise.Sea_0_Effect;
            end;
            1 :
            begin
              tmpSeaState1 := FSonarDefinition.FSeaStateNoiseData[i-1].Sea_1_Effect;
              tmpSeaState2 := noise.Sea_1_Effect;
            end;
            2 :
            begin
              tmpSeaState1 := FSonarDefinition.FSeaStateNoiseData[i-1].Sea_2_Effect;
              tmpSeaState2 := noise.Sea_2_Effect;
            end;
            3 :
            begin
              tmpSeaState1 := FSonarDefinition.FSeaStateNoiseData[i-1].Sea_3_Effect;
              tmpSeaState2 := noise.Sea_3_Effect;
            end;
            4 :
            begin
              tmpSeaState1 := FSonarDefinition.FSeaStateNoiseData[i-1].Sea_4_Effect;
              tmpSeaState2 := noise.Sea_4_Effect;
            end;
            5 :
            begin
              tmpSeaState1 := FSonarDefinition.FSeaStateNoiseData[i-1].Sea_5_Effect;
              tmpSeaState2 := noise.Sea_5_Effect;
            end;
            6 :
            begin
              tmpSeaState1 := FSonarDefinition.FSeaStateNoiseData[i-1].Sea_6_Effect;
              tmpSeaState2 := noise.Sea_6_Effect;
            end;
            7 :
            begin
              tmpSeaState1 := FSonarDefinition.FSeaStateNoiseData[i-1].Sea_7_Effect;
              tmpSeaState2 := noise.Sea_7_Effect;
            end;
            8 :
            begin
              tmpSeaState1 := FSonarDefinition.FSeaStateNoiseData[i-1].Sea_8_Effect;
              tmpSeaState2 := noise.Sea_8_Effect;
            end;
            9 :
            begin
              tmpSeaState1 := FSonarDefinition.FSeaStateNoiseData[i-1].Sea_9_Effect;
              tmpSeaState2 := noise.Sea_9_Effect;
            end;
          end;

          Result := Interpolate(freq,
                    FSonarDefinition.FSeaStateNoiseData[i-1].Sonar_Frequency / 1000,
                    tmpSeaState1,
                    noise.Sonar_Frequency / 1000,
                    tmpSeaState2);

          found := True;
          Break;
        end;
      end;
    end;

    if not found then
    begin
      case SeaStateSetting of
        0 : Result := FSonarDefinition.FSeaStateNoiseData[
                Length(FSonarDefinition.FSeaStateNoiseData)-1].Sea_0_Effect;
        1 : Result := FSonarDefinition.FSeaStateNoiseData[
                Length(FSonarDefinition.FSeaStateNoiseData)-1].Sea_1_Effect;
        2 : Result := FSonarDefinition.FSeaStateNoiseData[
                Length(FSonarDefinition.FSeaStateNoiseData)-1].Sea_2_Effect;
        3 : Result := FSonarDefinition.FSeaStateNoiseData[
                Length(FSonarDefinition.FSeaStateNoiseData)-1].Sea_3_Effect;
        4 : Result := FSonarDefinition.FSeaStateNoiseData[
                Length(FSonarDefinition.FSeaStateNoiseData)-1].Sea_4_Effect;
        5 : Result := FSonarDefinition.FSeaStateNoiseData[
                Length(FSonarDefinition.FSeaStateNoiseData)-1].Sea_5_Effect;
        6 : Result := FSonarDefinition.FSeaStateNoiseData[
                Length(FSonarDefinition.FSeaStateNoiseData)-1].Sea_6_Effect;
        7 : Result := FSonarDefinition.FSeaStateNoiseData[
                Length(FSonarDefinition.FSeaStateNoiseData)-1].Sea_7_Effect;
        8 : Result := FSonarDefinition.FSeaStateNoiseData[
                Length(FSonarDefinition.FSeaStateNoiseData)-1].Sea_8_Effect;
        9 : Result := FSonarDefinition.FSeaStateNoiseData[
                Length(FSonarDefinition.FSeaStateNoiseData)-1].Sea_9_Effect;
      end;
    end;
  end;
end;

procedure TT3Sonar.SensorProcess;
var
 i : integer;
 pfObject : TT3PlatformInstance;
 isInRange, isInBlindZone, //isInDetailRange,
 isInOtherMeasurement, isInVerticalCoverage,
 allState, isSonarCek : boolean;
begin
//  inherited;
//  if FOperationalStatus = sopOff then
//    exit;

  for i := 0 to FSimPlatforms.itemCount-1 do
  begin
    pfObject := TT3PlatformInstance(FSimPlatforms.getObject(i));

    if pfObject = Parent then
    begin
      continue;
    end;

    //cek apakah satu cubicle
    if pfObject.UnitGroup then
    begin
      if Assigned(OnSensorDetect) then
        OnSensorDetect(Self,pfObject,false,False);

      continue;
    end;

    isInRange := InsideRange(pfObject);
    isInBlindZone := InsideBlindZone(pfObject);
   // isInDetailRange := InsideDetailRange(pfObject);
    isInOtherMeasurement := InsideOtherMeasurement(pfObject);
    isInVerticalCoverage := InsideVerticalCoverage(pfObject);
    isSonarCek := SonarCek(pfObject, Parent);

    allState := isInRange and (not isInBlindZone) and {isInDetailRange and}
                isInOtherMeasurement and isInVerticalCoverage and
                isSonarCek;

    OnSensorDetect(Self, pfObject, allState, False);
  end;
end;

procedure TT3Sonar.SetControlMode(const Value: TSonarControlMode);
begin
  FControlMode := Value;
  case FControlMode of
    scmOff    : SetOperationalStatus(sopOFF);
    scmPassive:
      begin
      //  if SonarDefinition.FDef.Sonar_Category_Index = 0 then //17042012 mk
          SetOperationalStatus(sopPassive);
      end;
    scmActive :
      begin
       // if SonarDefinition.FDef.Sonar_Category_Index = 0 then //17042012 mk
          SetOperationalStatus(sopActive);
      end;
    scmDeployed : SetOperationalStatus(sopDeployed);     		 //17042012 mk
    scmStowed   : SetOperationalStatus(sopStowed);           //17042012 mk
    scmDeploying : SetOperationalStatus(sopDeploying);
    scmStowing   : SetOperationalStatus(sopStowing);

  end;

  {if Assigned(FOnControlMode) then  //mk 214042012 tak rem dlu oz gk da FC
    FOnControlMode(self, Value); }
end;

procedure TT3Sonar.SetOnControlMode(const Value: TOnSonarControlMode);
begin
  FOnControlMode := Value;
end;

procedure TT3Sonar.SetSonarCategory(const Value: TSonarCategory);
begin
  FSonarCategory := Value;
end;

procedure TT3Sonar.SetTIOWRange(const Value: TSonarTIOWRange);
begin
  FTIOWRange := Value;
end;

procedure TT3Sonar.ShadowZonesProcessing(var Data: Double);
var
  Gradient : double;
  SudutM : Double;
  SZR : Double;
  sub : TSubArea_Enviro_Definition;
  Sonar_Depth : Double;
begin
  Data := 0;
  Sonar_Depth := C_Meter_To_Feet * SonarDepth(FSonarCategory);
  sub := GetSubArea(parent);

  if Assigned(sub) then
  begin
    if sub.FData.Sound_Velocity_Type = 1 then  //negative
    begin
      if sub.FData.Ave_Ocean_Depth <> 0 then
      begin
        Gradient := (sub.FData.Bottom_Sound_Speed - sub.FData.Surface_Sound_Speed) /
                    sub.FData.Ave_Ocean_Depth;
        if  (sub.FData.Surface_Sound_Speed <> 0) then
        begin
          if ((1 + ((Sonar_Depth * Gradient)/sub.FData.Surface_Sound_Speed)) <= 1) and
              ((1 + ((Sonar_Depth * Gradient)/sub.FData.Surface_Sound_Speed)) >= -1)then
          begin
            SudutM := (ArcCos(1 + ((Sonar_Depth * Gradient)/sub.FData.Surface_Sound_Speed)));
            if Gradient <> 0 then
            begin
              SZR := (-2 * sub.FData.Surface_Sound_Speed * Sin(SudutM))/Gradient;
              Data := SZR/C_NauticalMile_To_Feet;
            end;
          end;
        end;
      end;

    end
    else if  sub.FData.Sound_Velocity_Type = 0  then  //positive
    begin
      if sub.FData.Ave_Ocean_Depth <> 0 then
      begin
        Gradient := (sub.FData.Bottom_Sound_Speed - sub.FData.Surface_Sound_Speed) /
                    sub.FData.Ave_Ocean_Depth;
        if  (sub.FData.Surface_Sound_Speed <> 0) then
        begin
          if ((1 - (((sub.FData.Ave_Ocean_Depth - Sonar_Depth) * Gradient)/ sub.FData.Surface_Sound_Speed)) <= 1) and
             ((1 - (((sub.FData.Ave_Ocean_Depth - Sonar_Depth) * Gradient)/ sub.FData.Surface_Sound_Speed)) >= -1)then
          begin
            SudutM := -1 * ( ArcCos(1 - (((sub.FData.Ave_Ocean_Depth - Sonar_Depth) * Gradient)/ sub.FData.Surface_Sound_Speed)));
            if Gradient <> 0 then  begin
              SZR := (-2 * sub.FData.Surface_Sound_Speed * Sin(SudutM))/Gradient;
              Data := SZR/C_NauticalMile_To_Feet;
            end;
          end;
        end;
      end;
    end
    else if (sub.FData.Sound_Velocity_Type = 2) and                            //positive over negative   and
            (Sonar_Depth < sub.FData.Thermal_Layer_Depth) then   //sonar above the thermal layer
    begin
      if sub.FData.Thermal_Layer_Depth <> 0 then
      begin
        Gradient := (sub.FData.Layer_Sound_Speed - sub.FData.Surface_Sound_Speed) /
                  sub.FData.Thermal_Layer_Depth;
        if (sub.FData.Surface_Sound_Speed <> 0) then
        begin
          if ((1 - (((sub.FData.Thermal_Layer_Depth - Sonar_Depth) * Gradient)/
                                       sub.FData.Surface_Sound_Speed)) <= 1) and
             ((1 - (((sub.FData.Thermal_Layer_Depth - Sonar_Depth) * Gradient)/
                                       sub.FData.Surface_Sound_Speed)) >= -1) then
          begin
            SudutM := -1 * (ArcCos(1 - (((sub.FData.Thermal_Layer_Depth - Sonar_Depth) * Gradient)/
                                         sub.FData.Surface_Sound_Speed)));
            if Gradient <> 0 then begin
              SZR := (-2 * sub.FData.Surface_Sound_Speed * sin(SudutM)) / Gradient;
              Data := SZR/C_NauticalMile_To_Feet;
            end;
          end;
        end;
      end;
    end
    else if (sub.FData.Sound_Velocity_Type = 2) and                            //positive over negative   and
            (Sonar_Depth > sub.FData.Thermal_Layer_Depth) then   //sonar below the thermal layer
    begin
      if (sub.FData.Ave_Ocean_Depth - sub.FData.Thermal_Layer_Depth) <> 0 then
      begin
        Gradient := (sub.FData.Bottom_Sound_Speed - sub.FData.Layer_Sound_Speed) /
                      (sub.FData.Ave_Ocean_Depth - sub.FData.Thermal_Layer_Depth);
        if (sub.FData.Layer_Sound_Speed <> 0) then
        begin
          if ((1 + (((Sonar_Depth - sub.FData.Thermal_Layer_Depth) * Gradient)/
                                sub.FData.Layer_Sound_Speed)) <= 1) and
             ((1 + (((Sonar_Depth - sub.FData.Thermal_Layer_Depth) * Gradient)/
                                sub.FData.Layer_Sound_Speed)) >= -1) then
          begin
            SudutM := (ArcCos(1 + (((Sonar_Depth - sub.FData.Thermal_Layer_Depth) * Gradient)/
                                  sub.FData.Layer_Sound_Speed)));
            if Gradient <> 0 then begin
              SZR := (-2 * sub.FData.Layer_Sound_Speed * Sin(SudutM)) / Gradient;
              Data := SZR/C_NauticalMile_To_Feet;
            end;
          end;
        end;
      end;
    end;
//    else
//      Data := 0;
  end
  else
  begin
//    Data := 0;
    if Environment.FData.Sound_Velocity_Type = 1 then  //negative
    begin
      if Environment.FData.Ave_Ocean_Depth <> 0 then
      begin
        Gradient := (Environment.FData.Bottom_Sound_Speed - Environment.FData.Surface_Sound_Speed) /
                    Environment.FData.Ave_Ocean_Depth;
        if (Environment.FData.Surface_Sound_Speed <> 0) then
        begin
          if ((1 + ((Sonar_Depth * Gradient)/Environment.FData.Surface_Sound_Speed)) <= 1) and
             ((1 + ((Sonar_Depth * Gradient)/Environment.FData.Surface_Sound_Speed)) >= -1) then
          begin
            SudutM := (ArcCos(1 + ((Sonar_Depth * Gradient)/Environment.FData.Surface_Sound_Speed)));
            if Gradient <> 0 then  begin
              SZR := (-2 * Environment.FData.Surface_Sound_Speed * Sin(SudutM))/Gradient;
              Data := SZR/C_NauticalMile_To_Feet;
            end;
          end;
        end;
      end;
    end
    else if  Environment.FData.Sound_Velocity_Type = 0  then  //positive
    begin
      if Environment.FData.Ave_Ocean_Depth <> 0 then
      begin
        Gradient := (Environment.FData.Bottom_Sound_Speed - Environment.FData.Surface_Sound_Speed) /
                    Environment.FData.Ave_Ocean_Depth;
        if (Environment.FData.Surface_Sound_Speed <> 0) then
        begin
          if ((1 - (((Environment.FData.Ave_Ocean_Depth - Sonar_Depth) * Gradient)/
                   Environment.FData.Surface_Sound_Speed)) <= 1) and
            ((1 - (((Environment.FData.Ave_Ocean_Depth - Sonar_Depth) * Gradient)/
                   Environment.FData.Surface_Sound_Speed)) >= -1) then
          begin
            SudutM := -1 * (ArcCos(1 - (((Environment.FData.Ave_Ocean_Depth - Sonar_Depth) * Gradient)/
                     Environment.FData.Surface_Sound_Speed)));
            if Gradient <> 0 then  begin
              SZR := (-2 * Environment.FData.Surface_Sound_Speed * Sin(SudutM))/Gradient;
              Data := SZR/C_NauticalMile_To_Feet;
            end;
          end;
        end;
      end;
    end
    else if (Environment.FData.Sound_Velocity_Type = 2) and                            //positive over negative   and
            (Sonar_Depth < Environment.FData.Thermal_Layer_Depth) then   //sonar above the thermal layer
    begin
      if Environment.FData.Thermal_Layer_Depth <> 0 then
      begin
        Gradient := (Environment.FData.Layer_Sound_Speed - Environment.FData.Surface_Sound_Speed) /
                  Environment.FData.Thermal_Layer_Depth;
        if (Environment.FData.Surface_Sound_Speed <> 0) then
        begin
          if ((1 - (((Environment.FData.Thermal_Layer_Depth - Sonar_Depth) * Gradient)/
                                     Environment.FData.Surface_Sound_Speed)) <= 1) and
             ((1 - (((Environment.FData.Thermal_Layer_Depth - Sonar_Depth) * Gradient)/
                                     Environment.FData.Surface_Sound_Speed)) >= -1) then
          begin
            SudutM := -1 * (ArcCos(1 - (((Environment.FData.Thermal_Layer_Depth - Sonar_Depth) * Gradient)/
                                     Environment.FData.Surface_Sound_Speed)));
            if  Gradient <> 0 then  begin
              SZR := (-2 * Environment.FData.Surface_Sound_Speed * sin(SudutM)) / Gradient;
              Data := SZR/C_NauticalMile_To_Feet;
            end;
          end;
        end;
      end;
    end
    else if (Environment.FData.Sound_Velocity_Type = 2) and                            //positive over negative   and
            (Sonar_Depth > Environment.FData.Thermal_Layer_Depth) then   //sonar below the thermal layer
    begin
      if (Environment.FData.Ave_Ocean_Depth - Environment.FData.Thermal_Layer_Depth) <> 0 then
      begin
        Gradient := (Environment.FData.Bottom_Sound_Speed - Environment.FData.Layer_Sound_Speed) /
                      (Environment.FData.Ave_Ocean_Depth - Environment.FData.Thermal_Layer_Depth);
        if (Environment.FData.Layer_Sound_Speed <> 0) then
        begin
          if ((1 + (((Sonar_Depth - Environment.FData.Thermal_Layer_Depth) * Gradient)/
                                Environment.FData.Layer_Sound_Speed)) <= 1) and
            ((1 + (((Sonar_Depth - Environment.FData.Thermal_Layer_Depth) * Gradient)/
                                Environment.FData.Layer_Sound_Speed)) >= -1) then
          begin
            SudutM := (ArcCos(1 + (((Sonar_Depth - Environment.FData.Thermal_Layer_Depth) * Gradient)/
                                  Environment.FData.Layer_Sound_Speed)));
            if Gradient <> 0 then begin
              SZR := (-2 * Environment.FData.Layer_Sound_Speed * Sin(SudutM)) / Gradient;
              Data := SZR/C_NauticalMile_To_Feet;
            end;
          end;
        end;
      end;
    end;
//    else
//      Data := 0;
  end;
//   Result := 0;
   //Result := SZR/C_NauticalMile_To_Feet
end;

function TT3Sonar.ShipLevelNoise(freq: double; ShippingRateType : Byte): double;
var
  i : integer;
  noise : TRecGame_Ship_On_Sonar;
  found : boolean;
  tmpShipEffect1, tmpShipEffect2: Double;
begin
  {shipping rate type
   0 : distant
   1 : low
   2 : medium
   3 : high }

  Result := 0;

  if Length(GameDefaults.FGameShip_Sonar) <= 0 then
    Result := 0
  else
  begin
    found := False;

    for I := 0 to Length(GameDefaults.FGameShip_Sonar) - 1 do
    begin
      noise := GameDefaults.FGameShip_Sonar[i];

      if (freq > noise.Sonar_Frequency / 1000) then
        Continue
      else
      begin
        if  i = 0 then
        begin
          case ShippingRateType of
            0 : Result := noise.Distant_Ship_Effect;
            1 : Result := noise.Light_Ship_Effect;
            2 : Result := noise.Medium_Ship_Effect;
            3 : Result := noise.Heavy_Ship_Effect
          end;

          found := True;
          Break;
        end
        else
        begin
          tmpShipEffect1 := 0;
          tmpShipEffect2 := 0;

          case ShippingRateType of
            0 :
            begin
              tmpShipEffect1 := FSonarDefinition.FShipNoiseData[i-1].Distant_Ship_Effect;
              tmpShipEffect2 := noise.Distant_Ship_Effect;
            end;
            1 :
            begin
              tmpShipEffect1 := FSonarDefinition.FShipNoiseData[i-1].Light_Ship_Effect;
              tmpShipEffect2 := noise.Light_Ship_Effect;
            end;
            2 :
            begin
              tmpShipEffect1 := FSonarDefinition.FShipNoiseData[i-1].Medium_Ship_Effect;
              tmpShipEffect2 := noise.Medium_Ship_Effect;
            end;
            3 :
            begin
              tmpShipEffect1 := FSonarDefinition.FShipNoiseData[i-1].Heavy_Ship_Effect;
              tmpShipEffect2 := noise.Heavy_Ship_Effect;
            end;
          end;

          Result := Interpolate(freq,
                    FSonarDefinition.FShipNoiseData[i-1].Sonar_Frequency / 1000,
                    tmpShipEffect1,
                    noise.Sonar_Frequency / 1000,
                    tmpShipEffect2);

          found := True;
          Break;
        end;
      end;
    end;

    if not found then
    begin
      case ShippingRateType of
        0 : Result := FSonarDefinition.FShipNoiseData[
            Length(FSonarDefinition.FShipNoiseData)-1].Distant_Ship_Effect;
        1 : Result := FSonarDefinition.FShipNoiseData[
            Length(FSonarDefinition.FShipNoiseData)-1].Light_Ship_Effect;
        2 : Result := FSonarDefinition.FShipNoiseData[
            Length(FSonarDefinition.FShipNoiseData)-1].Medium_Ship_Effect;
        3 : Result := FSonarDefinition.FShipNoiseData[
            Length(FSonarDefinition.FShipNoiseData)-1].Heavy_Ship_Effect;
      end;
    end;
  end;
end;

function TT3Sonar.InsideVerticalCoverage(aObject: TSimObject): boolean;  //mk 20042012
begin
  Result := inherited;

  //Result := SonarDepth(FSonarCategory);
end;

(*
  Sonar depth function, depend on sonar type.
  Parameter :
  aSonarType : sonar type in HMS, VDS, TAS, DS
  Output  : sonar depth (meter)
*)

function TT3Sonar.SonarCek(pfObject, aParent: TSimObject): Boolean;
var
  depthSonar : double;
  i : Integer;
  dev : TT3DeviceUnit;
  son : TT3Sonar;
  freq : Double;
  aDetectionFactor : Double;
  //isTargetTypeEligiblity : Boolean;
  isSubAreaBoundary : Boolean;
  //TargetStrengthSourceLevel : Double;
  //TransmissionLossType : TSonarTransmissionLossType;
  //DirectPathTransmissionLoss : Double;
  //ShadowZones : Double;
  //aBottomBounce : Double;
  //TotalTransmissionLoss : Double;
  //aConvergenceZone : Double;
  //aSpeedRelatedOwnshipNoise : Double;
  //OwnshipNoise : Double;
  //TotalAmbientNoise : Double;
  //sub : TSubArea_Enviro_Definition;
  //SonarSignalToNoiseRatio : Double;
  //POD : Double;
  //r : Double;
begin
  Result := True;

  //cek speed sonar
  if TT3PlatformInstance(Parent).Speed > FSonarDefinition.FDef.Maximum_Sonar_Speed then
  begin
    Result := False;
    Exit;
  end;

  if FSonarDefinition.FDef.Sonar_Category_Index = 4 then  //tipe dipping
  begin
    depthSonar := SonarDepth(scDipping);
    if depthSonar < 0 then          //berarti sonar belum masik ke air
    begin
      Result := False;
      Exit;
    end;
  end;

  if FSonarDefinition.FDef.Sonar_Category_Index = 2 then  //tipe towwed array
  begin
   //TASCriteria
    result := true;

    { 1st criteria }
    if Result then
    begin
      if Environment.FData.Ave_Ocean_Depth < SonarDefinition.FDef.Minimum_Depth  then
      begin
        Result := False;
        Exit;
      end;
    end;

    { 2nd criteria }
    if Result then
    begin
      if Assigned(Parent) then
      begin
        if  (TT3PlatformInstance(Parent).Speed < SonarDefinition.FDef.Maximum_Tow_Speed ) then
        begin
          Result := False;
          Exit;
        end
        else
          Result := True;
      end;
    end;

    { 3rd criteria  }
    if Result then
    begin
      if TT3Vehicle(parent).OrderedHeading <> TT3Vehicle(parent).Heading then
       //maka dianggap kapal tersebut sedang berbelok
      begin
        if  TT3Vehicle(parent).UnitMotion.FData.Standard_Turn_Rate
            > SonarDefinition.FDef.Turn_Rate_2_Kink then
        begin
          Result := False;
          Exit;
        end;
      end;
    end;
  end;

  if ControlMode = scmPassive then
  begin
    if TT3PlatformInstance(Parent).Speed > FSonarDefinition.FDef.Maximum_Sonar_Speed then
    begin
      Result := False;
      Exit;
    end;

    if TT3PlatformInstance(pfObject).Speed <= 0 then     //platform diam tdak dpat d detect sonar passive
     Result := False
    else
     Result := True;

    if not Result then
    begin
      if pfObject is TT3Vehicle then
      begin
        for I := 0 to TT3Vehicle(pfObject).Devices.Count - 1 do
        begin
          dev := TT3DeviceUnit(TT3Vehicle(pfObject).Devices.Items[i]);
          if dev is TT3Sonar then
          begin
            son := TT3Sonar(dev);
            if son.ControlMode = scmActive then
            begin
              Result := True;
              break;
            end
            else
            begin
              Result := False;
            end;
          end;
        end;
        if Result = False then
          Exit;
      end;
    end;
  end;

  {=============Compute Detection Factor==============
  hasil : mendapatkan nilai shipping level noise,
          sea state noise.
          untuk kemudian digunakan menghitung nilai
          sonar detection factor(passive,active,passive intercept) }

   freq := OperatingFrequency(ControlMode, pfObject);     //operating ini masih kurang
   if freq = 0  then
   begin
     Result := False;
     Exit;
   end;
   aDetectionFactor := DetectionFactor(ControlMode, freq);

  {=============Check for Deployment & Operating Mode=======   //beres
   hasil : operating freq
  }

  {====Determine Eligible Target & Maximum Range ========      //beres
   ket : cek detectability type target,
         cek active detection capabilities,
         compute the maximum operating range(max passive, active)
   *procedure TargetTypeEligiblity       // beres  >> sudah dimasukkan di insideOtherMeasurement
   *untuk range sudah d masukkan dlam insideRange>> pada proc MaximumRange
  }

  {===physical processing====      //rebes
   ket : compute depth sonar
         sonarDepth //beres
         cek tipe dipping sama towed array
  }

  {===SubArea Boundary Processing=====
   ket : cek subArea>> true&false
  }
  isSubAreaBoundary := SubAreaBoundaryProcessing(pfObject);
  if not (isSubAreaBoundary) then
  begin
    Result := False;
    Exit;
  end;
//
//  {===Compute Target Strength & Source Level Terms==
//   hasil :  GetTargetStrengthSourceLevel
//   }
//
//   TargetStrengthSourceLevel := GetTargetStrengthSourceLevel(ControlMode, pfObject);
//
//  {==check for Ducting Conditions===
//  hasil : mendapatkan tipe transmissionLoss (Spherical / Cylindrical)
//  }
//   TransmissionLossType := GetTransmissionLossType(pfObject);
//
//  {==Compute Direct Path Transmission Loss==
//  hasil : transmission Loss tipe Spherical/Cylindrical }
//  DirectPathTransmissionLoss := ComputeTransmissionLoss(pfObject, TransmissionLossType,freq); // ingat !! freq ini masih kurang     ==
//
//  {==Shadow Zone Processing==
//  }
//  ShadowZonesProcessing(ShadowZones);
//  //ShadowZones := 10000;
//
//  {==Bottom Bounce Processing==}
//  aBottomBounce := BottomBounceProcessing(pfObject,freq);
//
//  {==Compute Total Transmission Loss==}
//
//  if ShadowZones > aBottomBounce then
//    TotalTransmissionLoss := DirectPathTransmissionLoss + aBottomBounce
//  else
//    TotalTransmissionLoss := DirectPathTransmissionLoss + ShadowZones;
//
//
//  {==Convergence Zone Processing==}
//  aConvergenceZone := ConvergenceZoneProcessing(pfObject);
//
//  {compute ambient Noise
//  ket :
//  }
//
//  aSpeedRelatedOwnshipNoise := SpeedRelatedOwnshipNoise(aParent);
//  if (SonarCategory = scHMS) or (SonarCategory = scVDS) then
//    OwnshipNoise := aSpeedRelatedOwnshipNoise + SonarDefinition.FDef.Ownship_Increase_due_to_Active +
//                  {noise intensity increase of active Acoustic Decoy belum} -
//                   TT3Vehicle(Parent).VehicleDefinition.FData.HMS_Noise_Reduction_Factor
//  else if (SonarCategory = scTAS) then
//    OwnshipNoise := aSpeedRelatedOwnshipNoise + SonarDefinition.FDef.Ownship_Increase_due_to_Active +
//              {noise intensity increase of active Acoustic Decoy belum} -
//               TT3Vehicle(Parent).VehicleDefinition.FData.TAS_Noise_Reduction_Factor
//  else if (SonarCategory = scDipping) then
//    OwnshipNoise := 0
//  else
//    OwnshipNoise := 0;
//
//  sub := GetSubArea(Parent);
//  if Assigned(sub) then
//    TotalAmbientNoise := ShipLevelNoise(freq, sub.FData.Shipping_Rate) +
//                         RainFallRate(freq, sub.FData.Rain_Rate)+
//                         SeaState(freq,sub.FData.Sea_State)+
//                         OwnshipNoise
//  else
//    TotalAmbientNoise := ShipLevelNoise(freq, Environment.FData.Shipping_Rate) +
//                         RainFallRate(freq, Environment.FData.Rain_Rate)+
//                         SeaState(freq,Environment.FData.Sea_State)+
//                         OwnshipNoise;
//
//  //============================================================================
//
//  {compute probability of Detection
//  hasil : sonar signal to noise ratio
//  }
//  SonarSignalToNoiseRatio := 0;
//  if ControlMode = scmActive then
//     SonarSignalToNoiseRatio := aDetectionFactor + TargetStrengthSourceLevel -
//                                (2 * TotalTransmissionLoss) + aConvergenceZone -
//                                TotalAmbientNoise
//  else if ControlMode = scmPassive then
//    SonarSignalToNoiseRatio := aDetectionFactor + TargetStrengthSourceLevel -
//                                 TotalTransmissionLoss + aConvergenceZone -
//                                 TotalAmbientNoise;
//
//  POD := SNRData.getProbDetection(SonarSignalToNoiseRatio);
//  //POD := SNRData.getProbDetection(36);
//  r := Random(100) / 100;
//  if r < POD then
//    Result := True   //detect
//  else
//    Result := False;
end;

function TT3Sonar.SonarDepth(aSonarType: TSonarCategory): double;     //dalam meter
var
  pfDepth, snrDepth, pfSpeed: double;
begin
  pfDepth := 0;
  pfSpeed := 1;
  snrDepth := 0;

  if Assigned(Parent) and (Parent is TT3PlatformInstance) then
  begin
    pfDepth := Abs(TT3PlatformInstance(Parent).Altitude);
    if (TT3PlatformInstance(Parent).PlatformDomain = 0) then  //   tipe udara
      pfDepth := pfDepth * (-1);

     pfSpeed := TT3PlatformInstance(Parent).Speed;
  end;

  case aSonarType of
    scHMS:
      snrDepth := pfDepth + (FSonarDefinition.FData.Minimum_Depth *
          C_Feet_To_Meter);
    scVDS:
      snrDepth := pfDepth + ActualCable;//(FSonarDefinition.FDef.Cable_Length *
          //C_Feet_To_Meter);
    scTAS:
      begin
        if pfSpeed = 0 then
           snrDepth := pfDepth +(ActualCable)
        else
         snrDepth := pfDepth +((ActualCable) / (0.7 * pfSpeed));
      end;
    scDipping:
      snrDepth := pfDepth + (ActualCable);
  end;

  Result := snrDepth;

  {if pfSpeed > FSonarDefinition.FDef.Maximum_Sonar_Speed then
    Result := False
  else
    Result := snrDepth; } //mk
end;

function TT3Sonar.SpeedRelatedOwnshipNoise(aParentSonar: TSimObject): Double;
var
  aSpeed : Double;
begin
  Result := 0;

  aSpeed := TT3Vehicle(aParentSonar).Speed;

  if aSpeed <= TT3Vehicle(aParentSonar).UnitMotion.FData.Min_Ground_Speed then
    Result := TT3Vehicle(aParentSonar).VehicleDefinition.FData.LSpeed_Acoustic_Intens
  else if (aSpeed <= TT3Vehicle(aParentSonar).VehicleDefinition.FData.Cavitation_Speed_Switch) and
          (aSpeed > TT3Vehicle(aParentSonar).UnitMotion.FData.Min_Ground_Speed) then
    Result := TT3Vehicle(aParentSonar).VehicleDefinition.FData.Below_Cav_Acoustic_Intens
  else if (aSpeed > TT3Vehicle(aParentSonar).VehicleDefinition.FData.Cavitation_Speed_Switch) and
          (aSpeed < TT3Vehicle(aParentSonar).UnitMotion.FData.Max_Ground_Speed)then
    Result := TT3Vehicle(aParentSonar).VehicleDefinition.FData.Above_Cav_Acoustic_Intens
  else if aSpeed = TT3Vehicle(aParentSonar).UnitMotion.FData.Max_Ground_Speed then
    Result := TT3Vehicle(aParentSonar).VehicleDefinition.FData.HSpeed_Acoustic_Intens;
end;

function TT3Sonar.SubAreaBoundaryProcessing(aTarget: TSimObject): Boolean;
var
  i: Integer;
  sub : TSubArea_Enviro_Definition;
  p1,p2,p3,p4 : tDoublePoint;
  isCek : Boolean;
  cekSubArea : Boolean; //digunakan untuk mengecek apakah platform brada di subarea tsb
  TotalSubArea : Integer;
  SVPSonar : Byte;
  SVPTarget : Byte;
  DepthOfThermalLayerSonar : Double;
  DepthOfThermalLayerTarget : Double;
begin
//===============inisialisasi===========================
  Result := false;
  TotalSubArea := 0;

  SVPSonar := 99;     //anggapan jika 99, maka tdak berada d subArea manapun
  DepthOfThermalLayerSonar := 0;
  SVPTarget := 99;
  DepthOfThermalLayerTarget := 0;
//======================================================

  p1.X := FPosition.X;
  p1.Y := FPosition.Y;

  p2.X := aTarget.getPositionX;
  p2.Y := aTarget.getPositionY;

  if Environment.FSubArea.Count <= 0 then    //berarti semua platform berada pada global envi
  begin                                      //dan gak ada subarea sama sekali
    Result := True;
    Exit;
  end
  else
  begin
    for I := 0 to Environment.FSubArea.Count - 1 do
    begin
      sub := Environment.FSubArea.items[I];
      //sub.FData.Thermal_Layer_Depth
      //sub.FData.Sound_Velocity_Type

      isCek := false;
      if not isCek then   //garis mendatar atas (x1,y1) dan (x2,y1)
      begin
        p3.X := sub.FData.X_Position_1;
        p3.Y := sub.FData.Y_Position_1;
        p4.X := sub.FData.X_Position_2;
        p4.Y := sub.FData.Y_Position_1;

        isCek := FN_Intersect(p1,p2,p3,p4);
      end;
      if not isCek then   //garis tegak kanan atas (x2,y1) dan (x2,y2)
      begin
        p3.X := sub.FData.X_Position_2;
        p3.Y := sub.FData.Y_Position_1;
        p4.X := sub.FData.X_Position_2;
        p4.Y := sub.FData.Y_Position_2;

        isCek := FN_Intersect(p1,p2,p3,p4);
      end;
      if not isCek then   //garis mendatar bawah (x2,y2) dan (x1,y2)
      begin
        p3.X := sub.FData.X_Position_2;
        p3.Y := sub.FData.Y_Position_2;
        p4.X := sub.FData.X_Position_1;
        p4.Y := sub.FData.Y_Position_2;

        isCek := FN_Intersect(p1,p2,p3,p4);
      end;
      if not isCek then   //garis tegak kiri (x1,y2) dan (x1,y1)
      begin
        p3.X := sub.FData.X_Position_1;
        p3.Y := sub.FData.Y_Position_2;
        p4.X := sub.FData.X_Position_2;
        p4.Y := sub.FData.Y_Position_1;

        isCek := FN_Intersect(p1,p2,p3,p4);
      end;

      if iscek then
      begin
        TotalSubArea := TotalSubArea + 1;
      end;

      //cek SubArea sonar
      cekSubArea := (FPosition.X > sub.FData.X_Position_1) and (FPosition.X < sub.FData.X_Position_2)
         and (FPosition.Y > sub.FData.Y_Position_1) and (FPosition.Y < sub.FData.Y_Position_2);
      if cekSubArea then
      begin
        SVPSonar := sub.FData.Sound_Velocity_Type;
        DepthOfThermalLayerSonar := sub.FData.Thermal_Layer_Depth;
      end
      else
      begin
        SVPSonar := 99; //anggapan jika 99, maka tdak berada d subArea manapun
        DepthOfThermalLayerSonar := 0;
      end;

      //cek SubArea target
      cekSubArea := (aTarget.getPositionX > sub.FData.X_Position_1) and (aTarget.getPositionX < sub.FData.X_Position_2)
         and (aTarget.getPositionY > sub.FData.Y_Position_1) and (aTarget.getPositionY < sub.FData.Y_Position_2);
      if cekSubArea then
      begin
        SVPTarget := sub.FData.Sound_Velocity_Type;
        DepthOfThermalLayerTarget := sub.FData.Thermal_Layer_Depth;
      end
      else
      begin
        SVPTarget := 99;
        DepthOfThermalLayerTarget := 0;
      end;
    end;
  end;

  if TotalSubArea <= 0 then
  begin
    result := True;
    Exit;
  end
  else if (TotalSubArea = 1) then
  begin
    {SVP : 0 = Positive
         1 = Negative
         2 = Positive Over Negative
         3 = Negative Over Positive}

    if (SVPSonar = 0) and (SVPTarget = 0) then
      Result := True
    else if (SVPSonar = 0) and (SVPTarget = 2) then
    begin
      if (TT3PlatformInstance(aTarget).Altitude > DepthOfThermalLayerTarget) and (SonarDepth(FSonarCategory) > DepthOfThermalLayerSonar)  then
      Result := True;
    end
    else if  (SVPSonar = 1) and (SVPTarget = 1) then
    begin
      result := true;
    end
    else if (SVPSonar = 1) and (SVPTarget = 3) then
    begin
      if (TT3PlatformInstance(aTarget).Altitude > DepthOfThermalLayerTarget) and (SonarDepth(FSonarCategory) > DepthOfThermalLayerSonar)  then
      Result := True;
    end
    else if  (SVPSonar = 2) and (SVPTarget = 2)  then
    begin
      if Abs(DepthOfThermalLayerTarget-DepthOfThermalLayerSonar) < 200 then
      result := True;
    end
    else if (SVPSonar = 3) and (SVPTarget = 3) then
    begin
      if Abs(DepthOfThermalLayerTarget-DepthOfThermalLayerSonar) < 200 then
      result := True;
    end;
  end
  else
  begin
    Result := false;
    Exit;
  end;

end;

(*
  If Sonar Operating Mode is Active then compare target type of
  Surface, subsurface, mine and torpedo.
  Parameter :
  aTarget : target object
  Output  : eligibility or not (boolean)
*)

function TT3Sonar.TargetTypeEligiblity(aTarget: TObject): boolean;
var
  surfCapable, subsurfCapable, mineCapable, torpCapable: boolean;
  nVehicle : TT3Vehicle;
begin
  inherited;

  result := false;

  if not (Assigned(aTarget))then      //mk 19042012
    Exit;

  if not (aTarget is TT3PlatformInstance) then     //mk 19042012
    Exit;

  surfCapable     := FSonarDefinition.FDef.Surface_Detection_Capable    = true;
  subsurfCapable  := FSonarDefinition.FDef.SubSurface_Detection_Capable = true;
  mineCapable     := FSonarDefinition.FDef.Mine_Detection_Capable       = true;
  torpCapable     := FSonarDefinition.FDef.Torpedo_Detection_Capable    = true;

  if aTarget is TT3Vehicle then
  begin
    nVehicle := TT3Vehicle(aTarget);

    if Assigned(nVehicle)then
    begin
      if nVehicle.VehicleDefinition = nil  then   //mk
      begin
        if not (aTarget is TT3Torpedo) then
        begin
          Result := False;
          Exit;
        end
        else
        begin
          result := True;
          Exit;
        end;
      end;

      if nVehicle.VehicleDefinition.FData.Detectability_Type = 1 then  //17042012 mk
        Exit;

      if (nVehicle.VehicleDefinition.FData.Detectability_Type = 2) and //17042012 mk
         (FControlMode <> scmPassive) then
          Exit
      else
      if (nVehicle.VehicleDefinition.FData.Detectability_Type = 0) or  //17042012 mk
         (nVehicle.VehicleDefinition.FData.Detectability_Type = 3) then
      begin
        if not((aTarget is TT3Vehicle) or (aTarget is TT3Torpedo) or
            (aTarget is TT3Mine)) then
        begin
          result := True;  //mk
          Exit;
        end;

        if (nVehicle.VehicleDefinition.FData.Platform_Domain = 0) and (TT3Vehicle(aTarget).Altitude > 0) then
          begin
            Result := False;
            Exit;
          end
        else
          surfCapable := (nVehicle.VehicleDefinition.FData.Platform_Domain = 1) and surfCapable;

        subsurfCapable := (nVehicle.VehicleDefinition.FData.Platform_Domain = 2) and subsurfCapable;
      end;
    end;
  end
  else if aTarget is TT3Torpedo then
    torpCapable := torpCapable and true
  else if aTarget is TT3Mine then
    mineCapable := mineCapable and true
  else
  if aTarget is TT3Missile then
  begin
    result := False;
    Exit;
  end;

  result := surfCapable or subsurfCapable or mineCapable or torpCapable;
end;

(*
  TAS Criteria digunakan untuk mengecek eligibility detection dari Towed Array Sonar.
  Criteria :
    1 if AVERAGE OCEAN DEPTH < MINIMUM DEPTH TAS then ineligible
    2 if TAS Dploying platform ground speed < MINIMUM TOW SPEED then ineligible
    3 if TAS Status is UNKINKED and TAS Deploying platform Turn Rate >
          TURN RATE TO KINKED ARRAY then ineligible and status is KINKED
    4 if TAS Status KINKED and TAS Deploying platform Turn Rate < TURN RATE TO KINKED ARRAY
          and has stayed under this threshold for Game Time > TIME TO SETTLE KINKED ARRAY
          then status is UNKINKED and allow detection
*)

//function TT3Sonar.TASCriteria(aDt : double): boolean;
//var
//  deltaDir : double;
//  turnRate : double;
//begin
//  result := true;
//
//  { 1st criteria }
//  if result then
//  begin
//    if Environment.FData.Ave_Ocean_Depth < SonarDefinition.FDef.Minimum_Depth  then
//    begin
//      Result := False;
//    end;
//  end;
//
//  { 2nd criteria }
//  if result then
//  begin
//    if Assigned(Parent) then
//      result :=  TT3PlatformInstance(Parent).Speed < SonarDefinition.FDef.Maximum_Tow_Speed
//    else result := false;
//  end;
//
//  { 3rd hcriteria  }
//  if result then
//  begin
//    deltaDir := Abs(TT3PlatformInstance(Parent).Course - FLastDirPlatform);
//    turnRate := deltaDir / aDt;
//
//    if OperationalStatus = sopUnkinked then
//    begin
//      result := turnRate > SonarDefinition.FDef.Turn_Rate_2_Kink;
//      if not result then
//        OperationalStatus := sopKinked;
//    end;
//  end;
//end;

function TT3Sonar.GetSnapshotData : _SS_TT3Sonar ;
var
  I  : integer ;
  ss :  _SS_TT3Sonar ;
begin
  ss.S := TT3Sensor(Self).GetSnapshotData;
  with SonarDefinition do
  begin
    ss.SonarDefinition.FData                    := FData;
    ss.SonarDefinition.FDef                     := FDef;
    ss.SonarDefinition.FPattern                 := FPattern;
    ss.SonarDefinition.FCategory                := FCategory;

    ss.SonarDefinition.FVehicle.FData           := FVehicle.FData;
    ss.SonarDefinition.FVehicle.FPlatform_Ident := FVehicle.FPlatform_Ident;
    ss.SonarDefinition.FVehicle.FHeliLimitation := FVehicle.FHeliLimitation;

    ss.SonarDefinition.FNote                    := FNote ;

    if FBlind_Zone <> nil then begin
       ss.SonarDefinition.FBlind_Zone.FData := FBlind_Zone.FData ;
    end;
    if FBlind <> nil then begin
       SetLength(ss.SonarDefinition.FBlind,FBlind.Count);
       for I := 0 to FBlind.Count - 1 do begin
          ss.SonarDefinition.FBlind[i].FData := TBlind_Zone(FBlind[i]).FData ;
       end;
    end;
    if FPattern_Sonar <> nil then begin
       SetLength(ss.SonarDefinition.FPattern_Sonar,FPattern_Sonar.Count);
       for I := 0 to FPattern_Sonar.Count - 1 do begin
          ss.SonarDefinition.FPattern_Sonar[i].Event := TPattern_Sonar(FPattern_Sonar[i]).Event.FData ;
          ss.SonarDefinition.FPattern_Sonar[i].Pattern := TPattern_Sonar(FPattern_Sonar[i]).Pattern.FData ;
       end;
    end;
    if FScripted_sonar <> nil then begin
       SetLength(ss.SonarDefinition.FScripted_sonar,FScripted_sonar.Count);
       for I := 0 to FScripted_sonar.Count - 1 do begin
          ss.SonarDefinition.FScripted_sonar[i].Event := TScripted_Sonar(FScripted_sonar[i]).Event.FData ;
          ss.SonarDefinition.FScripted_sonar[i].Behav := TScripted_Sonar(FScripted_sonar[i]).Behav.FData ;
       end;
    end;
    if FPOD <> nil then begin
       SetLength(ss.SonarDefinition.FPOD,FPOD.Count);
       for I := 0 to FPOD.Count - 1 do begin
          ss.SonarDefinition.FPOD[i].FData := TPOD_vs_SNR_Point(FPOD[i]).FData ;
       end;
    end;
  end;

  ss.ControlMode:= byte(ControlMode);
    //OnControlMode: TOnSonarControlMode ;
  ss.SonarCategory := byte(SonarCategory);
    //SNRData: TT3Sonar_Curve_Def ;
  ss.ActiveDetectionRange := ActiveDetectionRange;
  ss.PassiveDetectionRange := PassiveDetectionRange;
  ss.TimeDeploy := TimeDeploy;
  ss.DepthCable := DepthCable;

  Result := ss ;
end;

function TT3Sonar.GetSubArea(aObject: TSimObject): TSubArea_Enviro_Definition;
var
  sub : TSubArea_Enviro_Definition;
  i : integer;
  cekSubArea : Boolean;
begin
  Result := nil;
  for I := 0 to Environment.FSubArea.Count - 1 do
  begin
    sub := Environment.FSubArea.items[I];
    cekSubArea := (aObject.getPositionX > sub.FData.X_Position_1) and (aObject.getPositionX < sub.FData.X_Position_2)
                 and (aObject.getPositionY > sub.FData.Y_Position_1) and (aObject.getPositionY < sub.FData.Y_Position_2);
    if cekSubArea then
    begin
      Result := sub;
      Exit;
    end;
  end;
end;

function TT3Sonar.GetTargetStrengthSourceLevel(aSonarMode: TSonarControlMode;
  aObject: TSimObject): Double;
var
 aTarget : TT3PlatformInstance;
 aBearing : Double;
 Pos : Double;
 i: Integer;
 dev : TT3DeviceUnit;
 sensor : TT3Sensor;
 TargetStrength : Double;
 TargetSourceLevel : Double;
begin
  Result := 0;
  TargetSourceLevel := 0;

  if aSonarMode = scmActive then
  begin
    //detect side front dlu...
    aBearing := CalcBearing(aObject.getPositionX,aObject.getPositionY,     //calcBearing terhadap target
                FPosition.X,FPosition.Y);

    aTarget := TT3PlatformInstance(aObject);
    Pos := Abs(aBearing-atarget.Heading);

    if ((Pos <= 30) and (Pos >= 330)) or ((Pos <= 210) and (Pos >= 150))then   //front
    begin
      TargetStrength := TT3Vehicle(aObject).VehicleDefinition.FData.Front_Acoustic_Cross;
    end
    else
    begin                                                                      //side
      TargetStrength := TT3Vehicle(aObject).VehicleDefinition.FData.Side_Acoustic_Cross;
    end;

    result := TargetStrength;
  end
  else if aSonarMode = scmPassive then
  begin
    if SonarDefinition.FDef.Sonar_Classification = 3 then //passive Inrtercept
    begin
      for I := 0 to TT3Vehicle(aObject).Devices.Count - 1 do
      begin
        dev := TT3DeviceUnit(TT3Vehicle(aObject).Devices.Items[i]);
        if dev is TT3Sensor then
        begin
          sensor := TT3Sensor(dev);
          if (sensor is TT3Sonar) and (sensor.OperatingMode = somActive) then
          begin
            if (TT3Sonar(sensor).FSonarDefinition.FDef.Active_Operating_Power * 1000) > 0 then
              TargetSourceLevel := 10 * Log10(TT3Sonar(sensor).FSonarDefinition.FDef.Active_Operating_Power * 1000);
          end;
        end;
      end;
    end
    else //jika hanya passive saja
    begin
      if TT3Vehicle(aObject).Speed <= TT3Vehicle(aObject).UnitMotion.FData.Min_Ground_Speed then
        TargetSourceLevel := TT3Vehicle(aObject).VehicleDefinition.FData.LSpeed_Acoustic_Intens // ambil minimum speed
      else if (TT3Vehicle(aObject).Speed > TT3Vehicle(aObject).UnitMotion.FData.Min_Ground_Speed) and
              (TT3Vehicle(aObject).Speed < TT3Vehicle(aObject).UnitMotion.FData.Max_Ground_Speed) then
      begin
        if TT3Vehicle(aObject).Speed <= TT3Vehicle(aObject).VehicleDefinition.FData.Cavitation_Speed_Switch then
          TargetSourceLevel := TT3Vehicle(aObject).VehicleDefinition.FData.Below_Cav_Acoustic_Intens
        else
          TargetSourceLevel := TT3Vehicle(aObject).VehicleDefinition.FData.Above_Cav_Acoustic_Intens;
      end
      else
        TargetSourceLevel := TT3Vehicle(aObject).VehicleDefinition.FData.HSpeed_Acoustic_Intens;
    end;

    result := TargetSourceLevel;
  end
end;


function TT3Sonar.GetTransmissionLossType(
  aobject: TSimObject): TSonarTransmissionLossType;
var
  i : Integer;
  sub : TSubArea_Enviro_Definition;
  subAreaTarget : TSubArea_Enviro_Definition;
  subAreaSonar : TSubArea_Enviro_Definition;
  cekSubAreaTarget : Boolean;
  cekSubAreaSonar : Boolean;
  isGlobalEnviTarget : Boolean;
  isGlobalEnviSonar : Boolean;
begin
  result := Spherical;

  subAreaTarget := nil;
  subAreaSonar := nil;
  isGlobalEnviTarget := True;
  isGlobalEnviSonar := True;

  for I := 0 to Environment.FSubArea.Count - 1 do
  begin
    sub := Environment.FSubArea.items[I];
    cekSubAreaTarget := (aObject.getPositionX > sub.FData.X_Position_1) and (aObject.getPositionX < sub.FData.X_Position_2)
               and (aObject.getPositionY > sub.FData.Y_Position_1) and (aObject.getPositionY < sub.FData.Y_Position_2);

    cekSubAreaSonar := (FPosition.X > sub.FData.X_Position_1) and (FPosition.X < sub.FData.X_Position_2)
             and (FPosition.Y > sub.FData.Y_Position_1) and (FPosition.Y < sub.FData.Y_Position_2);

    if cekSubAreaTarget then
    begin
      isGlobalEnviTarget := False;
      subAreaTarget := sub;
    end;

    if cekSubAreaSonar then
    begin
      isGlobalEnviSonar := False;
      subAreaSonar := sub;
    end;
  end;

  if isGlobalEnviTarget and isGlobalEnviSonar  then  //sama2 berada dalam global environment
  begin
    if Environment.FData.Sound_Velocity_Type = 2 then //positive Over Negative
    begin
      if Environment.FData.Surface_Ducting_Active = 1 then   //1 = active 0 = gak active
      begin
        if (SonarDepth(FSonarCategory) > Environment.FData.Upper_Limit_Surface_Duct_Depth)  and
           (SonarDepth(FSonarCategory) < Environment.FData.Lower_Limit_Surface_Duct_Depth)  and
           (TT3Vehicle(aobject).Altitude > Environment.FData.Upper_Limit_Surface_Duct_Depth)and
           (TT3Vehicle(aobject).Altitude < Environment.FData.Lower_Limit_Surface_Duct_Depth)then
           result := Cylindrical;
      end;
    end
    else if Environment.FData.Sound_Velocity_Type = 3  then //negative over Positive
    begin
      if Environment.FData.Sub_Ducting_Active = 1 then  //1 = active 0 = gak active
      begin
        if (SonarDepth(FSonarCategory) > Environment.FData.Upper_Limit_Sub_Duct_Depth)  and
           (SonarDepth(FSonarCategory) < Environment.FData.Lower_Limit_Sub_Duct_Depth)  and
           (TT3Vehicle(aobject).Altitude > Environment.FData.Upper_Limit_Sub_Duct_Depth)and
           (TT3Vehicle(aobject).Altitude < Environment.FData.Lower_Limit_Sub_Duct_Depth)then
           result := Cylindrical;
      end;
    end;

    if Environment.FData.Ave_Ocean_Depth < 1000 then
      result := Cylindrical;
  end
  else if isGlobalEnviTarget and (not isGlobalEnviSonar) then //sonar berada dalam sub area
  begin                                                       //target dalam global environment
    if subAreaSonar <> nil then begin
      if (Environment.FData.Sound_Velocity_Type = 2) and (subAreaSonar.FData.Sound_Velocity_Type = 2) then // PoN
      begin
        if (Environment.FData.Surface_Ducting_Active = 1) and (subAreaSonar.FData.Surface_Ducting_Active = 1) then
        begin
          if (SonarDepth(FSonarCategory) > subAreaSonar.FData.Upper_Limit_Sur_Duct_Depth)  and
             (SonarDepth(FSonarCategory) < subAreaSonar.FData.Lower_Limit_Sur_Duct_Depth)  and
             (TT3Vehicle(aobject).Altitude > Environment.FData.Upper_Limit_Surface_Duct_Depth)and
             (TT3Vehicle(aobject).Altitude < Environment.FData.Lower_Limit_Surface_Duct_Depth)then
              result := Cylindrical;
        end;
      end
      else if (Environment.FData.Sound_Velocity_Type = 3) and (subAreaSonar.FData.Sound_Velocity_Type = 3)  then  //NoP
      begin
        if (Environment.FData.Sub_Ducting_Active = 1) and (subAreaSonar.FData.Sub_Ducting_Active = 1) then
        begin
          if (SonarDepth(FSonarCategory) > subAreaSonar.FData.Upper_Limit_Sub_Duct_Depth)  and
             (SonarDepth(FSonarCategory) < subAreaSonar.FData.Lower_Limit_Sub_Duct_Depth)  and
             (TT3Vehicle(aobject).Altitude > Environment.FData.Upper_Limit_Sub_Duct_Depth)and
             (TT3Vehicle(aobject).Altitude < Environment.FData.Lower_Limit_Sub_Duct_Depth)then
              result := Cylindrical;
        end;
      end;

      if (Environment.FData.Ave_Ocean_Depth < 1000) and (subAreaSonar.FData.Ave_Ocean_Depth < 1000) then
        result := Cylindrical;
    end;
  end
  else if (not isGlobalEnviTarget) and isGlobalEnviSonar then  //sonar bedada dalam global envi
  begin                                                        //target berada dalam SubArea
    if subAreaTarget <> nil then begin
      if (Environment.FData.Sound_Velocity_Type = 2) and (subAreaTarget.FData.Sound_Velocity_Type = 2) then // PoN
      begin
        if (Environment.FData.Surface_Ducting_Active = 1) and (subAreaTarget.FData.Surface_Ducting_Active = 1) then
        begin
          if (SonarDepth(FSonarCategory) > Environment.FData.Upper_Limit_Surface_Duct_Depth)  and
             (SonarDepth(FSonarCategory) < Environment.FData.Lower_Limit_Surface_Duct_Depth)  and
             (TT3Vehicle(aobject).Altitude > subAreaTarget.FData.Upper_Limit_Sur_Duct_Depth)and
             (TT3Vehicle(aobject).Altitude < subAreaTarget.FData.Lower_Limit_Sur_Duct_Depth)then
              result := Cylindrical;
        end;
      end
      else if (Environment.FData.Sound_Velocity_Type = 3) and (subAreaTarget.FData.Sound_Velocity_Type = 3)  then  //NoP
      begin
        if (Environment.FData.Sub_Ducting_Active = 1) and (subAreaTarget.FData.Sub_Ducting_Active = 1) then
        begin
          if (SonarDepth(FSonarCategory) > Environment.FData.Upper_Limit_Sub_Duct_Depth)  and
             (SonarDepth(FSonarCategory) < Environment.FData.Lower_Limit_Sub_Duct_Depth)  and
             (TT3Vehicle(aobject).Altitude > subAreaTarget.FData.Upper_Limit_Sub_Duct_Depth)and
             (TT3Vehicle(aobject).Altitude < subAreaTarget.FData.Lower_Limit_Sub_Duct_Depth)then
              result := Cylindrical;
        end;
      end;

      if (Environment.FData.Ave_Ocean_Depth < 1000) and (subAreaTarget.FData.Ave_Ocean_Depth < 1000) then
        result := Cylindrical;
    end;
  end
  else if (not isGlobalEnviTarget) and (not isGlobalEnviSonar) then  //Target dan Sonar berada dalam subArea masing2
  begin
    if (subAreaSonar <> nil) and (subAreaTarget <> nil) then begin
      if (subAreaSonar.FData.Sound_Velocity_Type = 2) and (subAreaTarget.FData.Sound_Velocity_Type = 2) then // PoN
      begin
        if (subAreaSonar.FData.Surface_Ducting_Active = 1) and (subAreaTarget.FData.Surface_Ducting_Active = 1) then
        begin
          if (SonarDepth(FSonarCategory) > subAreaSonar.FData.Upper_Limit_Sur_Duct_Depth)  and
             (SonarDepth(FSonarCategory) < subAreaSonar.FData.Lower_Limit_Sur_Duct_Depth)  and
             (TT3Vehicle(aobject).Altitude > subAreaTarget.FData.Upper_Limit_Sur_Duct_Depth)and
             (TT3Vehicle(aobject).Altitude < subAreaTarget.FData.Lower_Limit_Sur_Duct_Depth)then
              result := Cylindrical;
        end;
      end
      else if (subAreaSonar.FData.Sound_Velocity_Type = 3) and (subAreaTarget.FData.Sound_Velocity_Type = 3)  then  //NoP
      begin
        if (subAreaSonar.FData.Sub_Ducting_Active = 1) and (subAreaTarget.FData.Sub_Ducting_Active = 1) then
        begin
          if (SonarDepth(FSonarCategory) > subAreaSonar.FData.Upper_Limit_Sub_Duct_Depth)  and
             (SonarDepth(FSonarCategory) < subAreaSonar.FData.Lower_Limit_Sub_Duct_Depth)  and
             (TT3Vehicle(aobject).Altitude > subAreaTarget.FData.Upper_Limit_Sub_Duct_Depth)and
             (TT3Vehicle(aobject).Altitude < subAreaTarget.FData.Lower_Limit_Sub_Duct_Depth)then
              result := Cylindrical;
        end;
      end;

      if (subAreaSonar.FData.Ave_Ocean_Depth < 1000) and (subAreaTarget.FData.Ave_Ocean_Depth < 1000) then
        result := Cylindrical;
    end;
  end;
end;

function TT3Sonar.getWaveHeight(fr : Double; iSeaState: Byte): Double;
var
  cek : Double;
begin
  Result := 0.1;

  if iSeaState = 0 then
    Result := 0.1
  else if iSeaState = 1 then
    Result := 0.25
  else if iSeaState = 2 then
    Result := 1
  else if iSeaState = 3 then
    Result := 2.7
  else if iSeaState = 4 then
    Result := 4.6
  else if iSeaState = 5 then
    Result := 8
  else if iSeaState = 6 then
    Result := 11.5
  else if iSeaState = 7 then
    Result := 20
  else if iSeaState = 8 then
    Result := 45
  else if iSeaState = 9 then
    Result := 45;

  cek := (1 / fr) * power((1 / 0.0234),(2/3));
  if Result >= cek then
    Result := Floor(cek);
end;

procedure TT3Sonar.SetSnapshotData(const ss : _SS_TT3Sonar);
begin
  TT3Sensor(Self).SetSnapshotData(ss.S);
  SonarDefinition.FData := ss.SonarDefinition.FData;
  SonarDefinition.FDef := ss.SonarDefinition.FDef;
  SonarDefinition.FPattern := ss.SonarDefinition.FPattern;
  SonarDefinition.FCategory := ss.SonarDefinition.FCategory;

  SonarDefinition.FVehicle.FData := ss.SonarDefinition.FVehicle.FData;
  SonarDefinition.FVehicle.FPlatform_Ident := ss.SonarDefinition.FVehicle.FPlatform_Ident;
  SonarDefinition.FVehicle.FHeliLimitation := ss.SonarDefinition.FVehicle.FHeliLimitation;

  ControlMode:= TSonarControlMode(ss.ControlMode);
  //OnControlMode: TOnSonarControlMode ;
  SonarCategory := TSonarCategory(ss.SonarCategory);
  //SNRData: TT3Sonar_Curve_Def ;
  ActiveDetectionRange := ss.ActiveDetectionRange;
  PassiveDetectionRange := ss.PassiveDetectionRange;
  TimeDeploy := ss.TimeDeploy;
  DepthCable := ss.DepthCable;
end;

function FN_Intersect(const p1, p2, p3, p4: tDoublePoint): boolean;
(*************************************************************************
 * PURPOSE
 * Given two line segments, determine if they intersect.
 *
 * RETURN VALUE
 * TRUE if they intersect, FALSE if not.
 *************************************************************************)
begin
  result := (((FN_CCW(p1, p2, p3) * FN_CCW(p1, p2, p4)) <= 0)
    and ((FN_CCW(p3, p4, p1) * FN_CCW(p3, p4, p2) <= 0)));

end;


function FN_CCW(const p0, p1, p2: tDoublePoint): integer;
(*
 * PURPOSE
 * Determines, given three points, if when travelling from the first to
 * the second to the third, we travel in a counterclockwise direction.

 *
 * RETURN VALUE
 * (int) 1 if the movement is in a counterclockwise direction, -1 if
 * not.
 *************************************************************************)

var dx1, dx2,
  dy1, dy2: Double;
begin

  dx1 := p1.x - p0.x;
  dx2 := p2.x - p0.x;
  dy1 := p1.y - p0.y;
  dy2 := p2.y - p0.y;

  (* This is basically a slope comparison: we don't do divisions because
   * of divide by zero possibilities with pure horizontal and pure
   * vertical lines.
   *)
  if (dx1 * dy2 > dy1 * dx2) then
    result := 1
  else
    result := -1;
end;


end.
