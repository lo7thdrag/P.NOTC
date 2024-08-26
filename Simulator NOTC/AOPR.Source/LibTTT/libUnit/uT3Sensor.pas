unit uT3Sensor;

interface

uses uSimObjects,tttData, Graphics, uObjectVisuals, uCoordConvertor,
     uSimVisuals, uT3Unit, uT3UnitContainer, Classes, uDBAsset_GameEnvironment,
     Math, uT3CounterMeasure, uT3Vehicle, uSnapshotData;

type
  TT3Sensor = class(TT3DeviceUnit)
  private
    FShowBlindZone: boolean;
    FShowRange: boolean;
    FShowRangeSelected : Boolean;
    FShowBlindSelected : Boolean;
    FDetectionRange: single;
    FDetailDetectionRange: Single;
    FOnRemoveSensor: TNotifyEvent;
    FOnSensorOperationalStatus: TOnSensorOperationalStatus;
    FOnSensorDetect: TOnSensorDetect;
    FOnSensorRemoved: TNotifyEvent;
    FOperatingMode: TSensorOperatingMode;
    FOnDeploySonar : TOnDeploySonar;
    FOnUpdateFormSonar : TOnUpdateFormSonar;
    FOnUpdateActualCable : TOnUpdateActualCable;

    //time sensor;
    FOnDayTimeUpdate : TNotifyEvent;
    FmyHour, FmyMin, FmySec, FmyMilli : Word;
    FDate_Time : TDateTime;
    FOnIFFDetect  : TOnIFFDetect;
    FOnModeSearchIFF : TOnModeSearchIFF;

    procedure SetShowBlindZone(const Value: boolean);
    procedure SetShowRange(const Value: boolean);
    procedure SetDetectionRange(const Value: single);
    procedure SetOnRemoveSensor(const Value: TNotifyEvent);
    procedure SetOnSensorOperationalStatus(
        const Value: TOnSensorOperationalStatus);
    procedure SetOnSensorDetect(const Value: TOnSensorDetect);
    procedure SetOnSensorRemoved(const Value: TNotifyEvent);
    procedure SetDateTime(const value: TDateTime);
    procedure SetShowRangeSelected(const Value: boolean);
    procedure SetShowBlindSelected(const Value: boolean);
    procedure SetOperatingMode(const Value: TSensorOperatingMode);
    //procedure FindJammerStatus;
    //procedure ClearAllProcessJamming;
    //procedure ListJamming(aObject : TT3PlatformInstance; jammer : TT3RadarNoiseJammerOnVehicle);
    //procedure FindParentJammedBy(aObject : TT3PlatformInstance);
    //function  CekObjectJammingParent(aParent: TSimObject; aObject: TT3PlatformInstance) : Boolean;

  protected
    isNeedNotify  : boolean;
    FOperationalStatus: TSensorOperationalStatus;
    FEmconOperationalStatus: TEMCON_OperasionalStatus;
    FSimPlatforms     : TT3UnitContainer;
    FRangeView      : TRangeVisual;
    FBlindZoneViews : TList;
    FRangeWithVisualEffect : Single;

    procedure SetOperationalStatus(const Value: TSensorOperationalStatus);virtual;
    procedure SetEmconOperationalStatus(const Value: TEMCON_OperasionalStatus);
    procedure SetEmconStatus(const Value: TSensorOperationalStatus; const Emcon: TEMCON_OperasionalStatus);
    procedure SetIFFStatus(const value: TSensorOperationalStatus);

    //function GetMaxLOSRange(aObject : TSimObject) : Double; virtual; abstract; //saya buat virtual abstract
    //function isJamming(aParent: TSimObject; aObject : TSimObject) : Boolean;

  public
    BZStartAngle  : array of single;
    BZEndAngle    : array of single;

    //  /  Date_Time : TDateTime;
    constructor Create; override;
    destructor Destroy;override;

    function GetSnapshotData : _SS_TT3Sensor ;
    procedure SetSnapshotData(const ss : _SS_TT3Sensor);

    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure SetObjects(platformObjects: TT3UnitContainer);
    procedure SensorProcess; virtual;

    procedure IFFMode (var Transmode1, Transmode2, Transmode3,
                        Transmode3C : string);  virtual;

    function  IFFOn (aObject:TSimObject) : Boolean; virtual;
    function  TargetTypeEligiblity(aTarget: TObject): boolean; virtual;
    function  delayTime(pfObject:TSimObject):Integer; virtual;
    function  CekStatusInterrogatorMode3C(aObject: TSimObject): Boolean; virtual;
    function  SecondToTime(const s: Integer): TTime;
    function  InsideBlindZone(aObject : TSimObject) : boolean; virtual;
    function  InsideVerticalCoverage(aObject : TSimObject) : boolean; virtual;
    function  InsideOtherMeasurement(aObject : TSimObject) : boolean; virtual;
    function  InsideRange(aObject : TSimObject) : boolean; virtual;
    function  InsideDetailRange(aObject : TSimObject) : Boolean; virtual;
    function  InsideJammedEffect : Boolean; virtual;
    function  MaxSonarSpeed(aObject : TSimObject) : Boolean; virtual;
    function  ParentSensor (aObject:TSimObject) : Boolean; virtual;  //add andik

    property ShowBlindZone : boolean read FShowBlindZone write SetShowBlindZone;
    property ShowRange : boolean read FShowRange write SetShowRange;
    property OperationalStatus : TSensorOperationalStatus read FOperationalStatus
      write SetOperationalStatus;
    property EmconOperationalStatus : TEMCON_OperasionalStatus
      read FEmconOperationalStatus write SetEmconOperationalStatus;
    property DetectionRange : single read FDetectionRange write SetDetectionRange;
    property DetailDetectionRange : Single read FDetailDetectionRange
      write FDetailDetectionRange;
    property OperatingMode : TSensorOperatingMode read FOperatingMode
      write SetOperatingMode;

    property OnRemoveSensor : TNotifyEvent read FOnRemoveSensor
      write SetOnRemoveSensor;
    property OnSensorOperationalStatus : TOnSensorOperationalStatus
      read FOnSensorOperationalStatus write SetOnSensorOperationalStatus;
    property OnSensorDetect   : TOnSensorDetect read FOnSensorDetect
      write SetOnSensorDetect;
    property OnSensorRemoved  : TNotifyEvent read FOnSensorRemoved
      write SetOnSensorRemoved;
    property OnDayTimeUpdate : TNotifyEvent read FOnDayTimeUpdate
      write FOnDayTimeUpdate;

    property OnIFFDetect : TOnIFFDetect read FOnIFFDetect write FOnIFFDetect;
    property OnModeSearchIFF : TOnModeSearchIFF read FOnModeSearchIFF
      write FOnModeSearchIFF;
    property ShowRangeSelected : Boolean read FShowRangeSelected
      write SetShowRangeSelected;
    property ShowBlindSelected : Boolean read FShowBlindSelected
      write SetShowBlindSelected;
    property Date_Time : TDateTime read FDate_Time write SetDateTime;
    property OnDeploySonar : TOnDeploySonar read FOnDeploySonar write FOnDeploySonar;
    property OnUpdateFormSonar : TOnUpdateFormSonar read FOnUpdateFormSonar
      write FOnUpdateFormSonar;
    property OnUpdateActualCable : TOnUpdateActualCable read FOnUpdateActualCable
      write FOnUpdateActualCable;
  end;

implementation

uses uBaseCoordSystem, SysUtils, DateUtils, uT3Radar, uT3Listener, uT3Sonobuoy,
  uT3RadarNoiseJammer;

{ TSensor }

procedure TT3Sensor.IFFMode(var Transmode1, Transmode2, Transmode3, Transmode3C: string);
begin
  Transmode1 := '---';
  Transmode2 := '---';
  Transmode3 := '---';
  Transmode3C := '---';
end;

function TT3Sensor.IFFOn(aObject: TSimObject): Boolean;
begin
  Result := True;
end;

function TT3Sensor.InsideBlindZone(aObject : TSimObject): boolean;
begin
  result := false;
end;

function TT3Sensor.InsideOtherMeasurement(aObject: TSimObject): boolean;
begin
  result := true;
end;

function TT3Sensor.InsideRange(aObject: TSimObject): boolean;
begin
  result := true;
end;

function TT3Sensor.InsideDetailRange(aObject : TSimObject) : Boolean;
begin
  Result := false;
end;

function TT3Sensor.InsideJammedEffect : Boolean;
begin
  Result := false;
end;

function TT3Sensor.InsideVerticalCoverage(aObject: TSimObject): boolean;
begin
  result := true;
end;

{procedure TT3Sensor.ListJamming(aObject: TT3PlatformInstance; jammer : TT3RadarNoiseJammerOnVehicle);
var
  i,j,k : Integer;
  RangeJammer, FreqRadar, vAltitude, minAltitude, maxAltitude, sumLower, sumUpper : Double;
  pfObject, pfObjectSudahTerjamming : TT3PlatformInstance;
  range, bearing, HeadingJammer, StartAngleJam, EndAngleJam, degLower, degUpper : Double;
  v : TT3Vehicle;
  device : TT3DeviceUnit;
  sensor : TT3Sensor;
  radar : TT3Radar;
  ObjectRemoveAfterJammerOff : TT3PlatformInstance;
  SubObjectAfterJammerOff : TT3PlatformInstance;
  found : Boolean;
  ObjectJammingParent : TT3PlatformInstance;
begin
  if jammer.StatusJammerNoiseRadar = esOn then
  begin
    //1. hitung range effektif jammer
    RangeJammer := jammer.EfffectiveRange(aObject);

    for i := 0 to FSimPlatforms.itemCount - 1 do
    begin
      pfObject := TT3PlatformInstance(FSimPlatforms.getObject(i));
      if pfObject = aObject then continue;

      range := CalcRange(aObject.getPositionX,aObject.getPositionY,
                pfObject.getPositionX,pfObject.getPositionY);

      //2. cek apakah masuk dalam range visual
      if Assigned(GameDefaults) then
      begin
        if range <= GameDefaults.FData.Max_Visual_Range then   //masuk range visual
          Continue;
      end
      else
      begin
        if range <= 12 then   //masuk range visual
          Continue;
      end;

      if pfObject is TT3Vehicle then
      begin
        v:= TT3Vehicle(pfObject);

        //3. cek apakah masuk dalam effektif range
        if range <= RangeJammer then
        begin
          for j := 0 to v.Devices.Count - 1 do
          begin
            device := TT3DeviceUnit(v.Devices.Items[j]);

            if (device is TT3Sensor) and (TT3Sensor(device).OperationalStatus = sopOn) then
            begin
              sensor := TT3Sensor(device);

              if sensor is TT3Radar then
              begin
                radar := TT3Radar(sensor);
                FreqRadar := radar.RadarDefinition.FDef.Frequency;
                HeadingJammer := aObject.Heading;
                bearing := CalcBearing(aObject.getPositionX, aObject.getPositionY,
                           pfObject.getPositionX, pfObject.getPositionY);

                //4. cek frequensinya apakah masuk dalam batas UPPER dan LOWER frequensi limit jammmer
                if (FreqRadar >= Jammer.UpperFrequencyLimit) or (FreqRadar <= Jammer.LowerFrequencyLimit )then     //diluar range freq jammer
                  Continue;

                //5. cek apakah target berada di dalam batas MAKSIMUM SEKTOR WIDTH
                StartAngleJam := HeadingJammer + (jammer.RadarJammerDefinition.FDef.Max_Sector_Width/2);
                EndAngleJam   := HeadingJammer - (jammer.RadarJammerDefinition.FDef.Max_Sector_Width/2);

                if StartAngleJam > 360 then StartAngleJam := StartAngleJam - 360;
                if EndAngleJam < 0 then EndAngleJam := EndAngleJam + 360;
                if not(DegComp_IsBeetwen(bearing, StartAngleJam, EndAngleJam)) then Continue;

                //6. cek apakah target berada di dalam VERTICAL COVERAGE
                degLower := jammer.RadarJammerDefinition.FDef.Lower_Vert_Coverage_Angle;
                degUpper := jammer.RadarJammerDefinition.FDef.Upper_Vert_Coverage_Angle;

                sumLower := Abs(RangeJammer*(Tan(degLower)));
                sumUpper := Abs(RangeJammer*(TAn(degUpper)));

                vAltitude := jammer.RadarJammerDefinition.FData.Antenna_Height + TT3Vehicle(aObject).Altitude;
                minAltitude := vAltitude - sumLower;
                maxAltitude := vAltitude + sumUpper;
                if (vAltitude < minAltitude) or (vAltitude > maxAltitude) then Continue;

                //7. cek apakah tipe JAMMER RESISTANT radar target melawan JAMMER TYPE dari jammer
                if jammer.RadarJammerDefinition.FDef.Jammer_Type = 0 then  //jammer tyoe A
                begin
                  if radar.RadarDefinition.FDef.Anti_Jamming_A_Resistant then
                    Continue;
                end
                else if jammer.RadarJammerDefinition.FDef.Jammer_Type = 1 then   //jammer Type B
                begin
                  if radar.RadarDefinition.FDef.Anti_Jamming_B_Resistant then
                    Continue;
                end
                else if Jammer.RadarJammerDefinition.FDef.Jammer_Type = 2 then   //jammer Type C then
                begin
                  if radar.RadarDefinition.FDef.Anti_Jamming_C_Resistant then
                    Continue;
                end;

                //8. jika semua condisi ok maka add target kedalam list jammer
                if aObject.VehicleOnJamming.Count = 0 then
                  aObject.VehicleOnJamming.Add(pfObject)
                else
                begin
                  found := True;
                  for k := 0 to aObject.VehicleOnJamming.Count - 1 do
                  begin
                    pfObjectSudahTerjamming := TT3PlatformInstance(aObject.VehicleOnJamming.Items[k]);
                    if pfObject = pfObjectSudahTerjamming then
                      begin
                        found := True;
                        Break;
                      end
                    else
                    begin
                      found := False;
                      Continue;
                    end;
                  end;

                  if not found then
                    aObject.VehicleOnJamming.Add(pfObject);
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end
  else if jammer.StatusJammerNoiseRadar = esOff then
  begin
    if aObject.VehicleOnJamming.Count = 0 then  Exit;

    if aObject.SubParentInJamming.Count > 0 then
    begin
      for I := 0 to aObject.SubParentInJamming.Count - 1 do
      begin
        SubObjectAfterJammerOff := TT3PlatformInstance(aObject.SubParentInJamming.Items[i]);
        SubObjectAfterJammerOff.masukJamming := False;
      end;

      aObject.SubParentInJamming.Clear;
    end;

    aObject.VehicleOnJamming.Clear;

    for I := 0 to TT3PlatformInstance(Parent).ParentInJamming.Count - 1 do
    begin
      ObjectJammingParent := TT3PlatformInstance(Parent).ParentInJamming.Items[i];

      if ObjectJammingParent = aObject then
        TT3PlatformInstance(Parent).ParentInJamming.Remove(TT3PlatformInstance(Parent).ParentInJamming.Items[i]);
    end;
  end;
end; }

//procedure TT3Sensor.FindJammerStatus;
//var
//  i,j:Integer;
//  pfObject : TT3PlatformInstance;
//  v: TT3Vehicle;
//  device : TT3DeviceUnit;
//  deviceJammer : TT3RadarNoiseJammerOnVehicle;
//begin
//  for I := 0 to FSimPlatforms.itemCount - 1 do
//  begin
//    pfObject := TT3PlatformInstance(FSimPlatforms.getObject(i));
//
//    if not(pfObject is TT3Vehicle) then Continue;
//
//    v := TT3Vehicle(pfObject);
//    for j := 0 to v.Devices.Count - 1 do
//    begin
//      device := TT3DeviceUnit(v.Devices.Items[j]);
//
//      if device is TT3RadarNoiseJammerOnVehicle then
//      begin
//        DeviceJammer := TT3RadarNoiseJammerOnVehicle(device);
//        DeviceJammer.ListJamming(pfObject);
//      end;
//    end;
//  end;
//end;

//procedure TT3Sensor.FindParentJammedBy(aObject: TT3PlatformInstance);
//var
//  i,j,k,l,m,n: Integer;
//  pfObject, ObjectList, ObjectListTmp, SubObjectList : TT3PlatformInstance;
//  deviceJammer : TT3RadarNoiseJammerOnVehicle;
//  device : TT3DeviceUnit;
//  v : TT3Vehicle;
//  ObjectSudahAda : TT3PlatformInstance;
//  ObjectSudahAdaSubParent : TT3PlatformInstance;
//  IsObjectSudahAda : boolean;
//  IsObjectSudahAdaSubParent : boolean;
//begin
//  for I := 0 to FSimPlatforms.itemCount - 1 do
//  begin
//    pfObject := TT3PlatformInstance(FSimPlatforms.getObject(i));
//
//    if pfObject = aObject then continue;
//
//    if pfObject.VehicleOnJamming.Count = 0 then Continue;
//
//    if pfObject.VehicleOnJamming.Count > 0 then
//    begin
//       for j := 0 to pfObject.VehicleOnJamming.Count - 1 do
//       begin
//         ObjectList := TT3PlatformInstance(pfObject.VehicleOnJamming.Items[j]);
//
//         if ObjectList = aObject then
//         begin
//           if aObject.ParentInJamming.Count = 0 then
//             aObject.ParentInJamming.Add(pfObject)
//           else
//           if aObject.ParentInJamming.Count > 0 then
//           begin
//             for m := 0 to aObject.ParentInJamming.Count - 1 do
//             begin
//               ObjectSudahAda := aObject.ParentInJamming.Items[m];
//               if ObjectSudahAda = pfObject then
//                 begin
//                  IsObjectSudahAda := True;
//                  Break;
//                 end
//               else
//               begin
//                 IsObjectSudahAda := False;
//                 Continue;
//               end;
//             end;
//
//             if not IsObjectSudahAda then
//              aObject.ParentInJamming.Add(pfObject);
//           end;
//         end;
//       end;
//    end;
//
//    if aObject.ParentInJamming.Count = 0 then Continue;
//    if aObject.ParentInJamming.Count > 0 then
//    begin
//      for j := 0 to aObject.ParentInJamming.Count - 1 do
//      begin
//        ObjectListTmp  := TT3PlatformInstance(aObject.ParentInJamming.Items[j]);
//        BearingParent  := 0;
//        BearingVehicle := 0;
//        DerajatVehicle := 0;
//
//        BearingParent := CalcBearing(ObjectListTmp.getPositionX, ObjectListTmp.getPositionY,
//                         aObject.getPositionX,aObject.getPositionY);
//
//        for k := 0 to FSimPlatforms.itemCount - 1 do
//        begin
//          SubObjectList := TT3PlatformInstance(FSimPlatforms.getObject(k));
//
//          if SubObjectList = ObjectListTmp then continue;
//          if SubObjectList = aObject then  Continue;
//
//          BearingVehicle := CalcBearing(ObjectListTmp.getPositionX, ObjectListTmp.getPositionY,
//                       SubObjectList.getPositionX,SubObjectList.getPositionY);
//
//          derajatVehicle := Abs(BearingParent-BearingVehicle);
//
//          v := TT3Vehicle(ObjectListTmp);
//          for l:=0 to v.Devices.Count-1 do
//          begin
//            device := TT3DeviceUnit(v.Devices.Items[l]);
//            if device is TT3RadarNoiseJammerOnVehicle then
//            begin
//              deviceJammer := TT3RadarNoiseJammerOnVehicle(device);
//              Break;
//            end;
//          end;
//
//          if deviceJammer.RadarJammerDefinition.FDef.Max_Sector_Width > DerajatVehicle then
//          begin
//            if ObjectListTmp.SubParentInJamming.Count = 0 then
//              ObjectListTmp.SubParentInJamming.Add(SubObjectList)
//            else
//            if ObjectListTmp.SubParentInJamming.Count > 0 then
//            begin
//              for n:=0 to ObjectListTmp.SubParentInJamming.Count-1 do
//              begin
//                ObjectSudahAdaSubParent := ObjectListTmp.SubParentInJamming.Items[n];
//                if ObjectSudahAdaSubParent = SubObjectList then
//                begin
//                  IsObjectSudahAdaSubParent := True;
//                  Break;
//                end
//                else
//                begin
//                  IsObjectSudahAdaSubParent := False;
//                  Continue;
//                end;
//              end;
//
//              if not IsObjectSudahAdaSubParent then
//                ObjectListTmp.SubParentInJamming.Add(SubObjectList);
//            end;
//          end;
//        end;
//      end;
//    end;
//  end;
//end;

//function TT3Sensor.CekObjectJammingParent(aParent : TSimObject;
//  aObject: TT3PlatformInstance): Boolean;
//begin
//  Result := False;

  {if TT3PlatformInstance(aParent).ParentInJamming.Count = 0 then
  begin
    Result := False;
    Exit;
  end;

  for i := 0 to TT3PlatformInstance(aParent).ParentInJamming.Count - 1 do
  begin
    aObjectTmp := TT3PlatformInstance(TT3PlatformInstance(aParent).ParentInJamming.Items[i]);

    if aObjectTmp.SubParentInJamming.Count > 0 then
    begin
      for j := 0 to aObjectTmp.SubParentInJamming.Count - 1 do
      begin
        subObject :=TT3PlatformInstance(aObjectTmp.SubParentInJamming.Items[j]);
        rangeVis := CalcRange(aParent.getPositionX,aParent.getPositionY,
                    subObject.getPositionX,subObject.getPositionY);

        if rangeVis > 12 then
          subObject.masukJamming := True
        else
          subObject.masukJamming := False;
      end;
    end;
  end;

  for i := 0 to TT3PlatformInstance(aParent).ParentInJamming.Count - 1 do
  begin
    if aObjectTmp = aObject then
    begin
      Result := True;
      Exit;
    end;
  end; }
//end;

function TT3Sensor.CekStatusInterrogatorMode3C(aObject: TSimObject): Boolean;
begin
  Result := false;
end;

//procedure TT3Sensor.ClearAllProcessJamming;
//var
//  i : integer;
//  pfObject : TT3PlatformInstance;
//begin
//  aParent := TT3PlatformInstance(Parent);
//
//  if aParent.ParentInJamming.Count > 0 then
//  begin
//    for i := 0 to aParent.ParentInJamming.Count - 1 do
//    begin
//      SubObject := TT3PlatformInstance(aParent.ParentInJamming.Items[i]);
//      if SubObject.SubParentInJamming.Count > 0 then
//      begin
//        for j := 0 to SubObject.SubParentInJamming.Count - 1 do
//        begin
//          ObjectOnJamming := TT3PlatformInstance(SubObject.SubParentInJamming.Items[j]);
//          ObjectOnJamming.masukJamming := False;
//        end;
//      end;
//      SubObject.SubParentInJamming.Clear;
//    end;
//  end;
//
//  aParent.ParentInJamming.Clear;

//  for I := 0 to FSimPlatforms.itemCount - 1 do
//  begin
//    pfObject := TT3PlatformInstance(FSimPlatforms.getObject(i));
//    pfObject.VehicleOnJamming.Clear;
//  end;
//end;

constructor TT3Sensor.Create;
begin
  inherited;
  FRangeView      := TRangeVisual.Create;
  FBlindZoneViews := TList.Create;

  FShowBlindZone  := false;
  FShowRange      := false;
  isNeedNotify    := false;

  FOperationalStatus  := sopOff;
  FEmconOperationalStatus := EmconOff;
end;

function TT3Sensor.delayTime(pfObject:TSimObject): Integer;
begin
   result := 0;
end;

destructor TT3Sensor.Destroy;
var
  i : integer;
  aObj : TObject;
begin
  FRangeView.Free;

  for i := FBlindZoneViews.Count - 1 downto 0 do
  begin
    aObj := FBlindZoneViews.Items[i];
    aObj.Free;
    FBlindZoneViews.Delete(i);
  end;

  FBlindZoneViews.Free;

  inherited;
end;

procedure TT3Sensor.Draw(aCnv: tCanvas);
var
  blindZ : TBlindZoneVisual;
  i : integer;
begin
  inherited;
  //if FShowRange then begin
  if FShowRangeSelected then begin
    FRangeView.Color := clGreen;
    FRangeView.LineStyles := psSolid;
    FRangeView.Draw(aCnv);
  end;

  if FShowBlindSelected then
  for i := 0 to FBlindZoneViews.Count - 1 do begin
    blindZ := FBlindZoneViews.Items[i];
    blindZ.Color := clGreen;
    blindZ.Draw(aCnv);
  end;
end;

function TT3Sensor.MaxSonarSpeed(aObject: TSimObject): Boolean;
begin
  Result := True;
end;

procedure TT3Sensor.Move(const aDeltaMs: double);
var
  i : Integer;
  blindZ : TBlindZoneVisual;
begin
  inherited;

  if not Enable then
  Exit;

  // update rel start start-end angle
  for i := 0 to FBlindZoneViews.Count - 1 do
  begin
    blindZ := TBlindZoneVisual(FBlindZoneViews.Items[i]);
    blindZ.Ranges := FDetectionRange;

    if Assigned(FParent) then
    begin
      blindZ.Heading := TT3PlatformInstance(FParent).Course;
      blindZ.mX := FParent.getPositionX;
      blindZ.mY := FParent.getPositionY;
    end;

    blindZ.UpdateRelatifAngle;
  end;

  if ((FOperationalStatus = sopOn) or
      (FOperationalStatus = sopActive) or
//	    (FOperationalStatus = sopDeployed) or   //17042012 mk
//      (FOperationalStatus = sopStowed) or   //17042012 mk
      (FOperationalStatus = sopOffIFF) or   //khusus IFF
      (FOperationalStatus = sopPassive)) and
     (FOperationalStatus <> sopDamage) then
    SensorProcess;

  if Assigned(OnDayTimeUpdate) then
  begin
    OnDayTimeUpdate(Self);
  end;
end;

function TT3Sensor.ParentSensor(aObject: TSimObject): Boolean;
begin
  Result := True;
end;

procedure TT3Sensor.SensorProcess;
var
  i : Integer;
  pfObject : TT3PlatformInstance;
  isInRange : Boolean;
  isInsideBlindZone : Boolean;
  isInsideVerticalCov : Boolean;
  isInsideOtherMeasurement : Boolean;
  isParentSensor : Boolean;
  isTargetTypeEligiblity : Boolean;
  isJammed : Boolean;
  allState : Boolean;
  IsOn : Boolean;
begin
  if not Assigned(FSimPlatforms) then
    Exit;

  // ClearAllProcessJamming; //normalkan dahulu
  // FindJammerStatus;       //kemudian cari lagi
  // periksa apa dalam MaxSonar Speed
  // InsideDetailRange(pfObject);
  // IsObjectJammingParent := CekObjectJammingParent(Parent, pfObject);
  // isMasukJamming := isJamming(Parent, pfObject);

  for i := 0 to FSimPlatforms.itemCount - 1 do
  begin
    pfObject := TT3PlatformInstance(FSimPlatforms.getObject(i));

    //cek apakah target yang di cek adalah dirinya sendiri
    if pfObject = Parent then
    begin
      Continue;
    end;

    if pfObject.isInstructor or pfObject.isWasdal then
    begin
    //krn instruktur langsung di cek
    end
    else
    begin
      //cek apakah satu cubicle
      if pfObject.UnitGroup then
      begin
        if Assigned(FOnSensorDetect) then
          FOnSensorDetect(Self, pfObject, False, False);

        Continue;
      end;
    end;

    //cek interrogator parent status mode 3C
    IsOn := CekStatusInterrogatorMode3C(pfObject);
    // periksa apakah dalam jangkauan radar
    isInRange                := InsideRange(pfObject);
    // periksa apa di dalam blind zone
    isInsideBlindZone        := InsideBlindZone(pfObject);
    // periksa apa di dalam vertical cov
    isInsideVerticalCov      := InsideVerticalCoverage(pfObject);
    // periksa pengukuran lainyya
    isInsideOtherMeasurement := InsideOtherMeasurement(pfObject);
    //cek apakah parent sensor adalah subsurface
    isParentSensor           := ParentSensor(Parent);
    //cek apakah target bisa dideteksi
    isTargetTypeEligiblity   := TargetTypeEligiblity(pfObject);
    // cek jaming proses
    isJammed                 := InsideJammedEffect;

    TT3PlatformInstance(pfobject).FDelayTIOW := delayTime(pfObject);

    // periksa semua factor deteksi
    allState := isInRange and (not isInsideBlindZone) and isInsideVerticalCov
                and (FEmconOperationalStatus <> EmconOn) and (isInsideOtherMeasurement)
                and (isParentSensor) and isTargetTypeEligiblity and not(isJammed);
                { and (not IsObjectJammingParent) and (not isMasukJamming)} // and isSonarCek;

    if not allState then
    begin
      if IsOn then
      begin
        if Assigned(FOnSensorDetect) then
          FOnSensorDetect(Self, pfObject, isOn, True);
      end;
    end;

    {Add by Choco}
    case pfObject.DetectabilityType of
      dtNormalDetection:
      begin
        if Assigned(FOnSensorDetect) then
          FOnSensorDetect(Self, pfObject, allState, False);
      end;
      dtUndetectable:
      begin
        if Assigned(FOnSensorDetect) then
          FOnSensorDetect(Self, pfObject, False, False);
      end;
      dtPassiveDetection:
      begin
        if OperationalStatus = sopPassive then
        begin
          if Assigned(FOnSensorDetect) then
            FOnSensorDetect(Self, pfObject, True, False);
        end
        else
        begin
          if Assigned(FOnSensorDetect) then
            FOnSensorDetect(Self, pfObject, False, False);
        end;
      end;
      dtAlwaysVisible:
      begin
        if Assigned(FOnSensorDetect) then
          FOnSensorDetect(Self, pfObject, True, False);
      end;
    end;
  end;
end;

procedure TT3Sensor.SetDateTime(const value: TDateTime);
begin
  decodetime(value, FmyHour, FmyMin, FmySec, FmyMilli);
end;

procedure TT3Sensor.SetDetectionRange(const Value: single);
begin
  FDetectionRange := Value;
end;

procedure TT3Sensor.SetObjects(platformObjects: TT3UnitContainer);
begin
  FSimPlatforms   := platformObjects;
end;

procedure TT3Sensor.SetOnRemoveSensor(const Value: TNotifyEvent);
begin
  FOnRemoveSensor := Value;
end;

procedure TT3Sensor.SetOnSensorDetect(const Value: TOnSensorDetect);
begin
  FOnSensorDetect := Value;
end;

procedure TT3Sensor.SetOnSensorOperationalStatus(
  const Value: TOnSensorOperationalStatus);
begin
  FOnSensorOperationalStatus := Value;
end;

procedure TT3Sensor.SetOnSensorRemoved(const Value: TNotifyEvent);
begin
  FOnSensorRemoved := Value;
end;

procedure TT3Sensor.SetOperatingMode(const Value: TSensorOperatingMode);
begin
  FOperatingMode := Value;
end;

procedure TT3Sensor.SetOperationalStatus(const Value: TSensorOperationalStatus);
begin
  isNeedNotify := false;

  if (Value = sopDeploying) or (Value = sopStowing) then
    isNeedNotify := True
  else if Value <> FOperationalStatus  then
    isNeedNotify := true;

  FOperationalStatus := Value;

  TriggerListener(Self, psSensorOpStatus, Byte(Value));

  if isNeedNotify then
    if Assigned(FOnSensorOperationalStatus) then
      FOnSensorOperationalStatus(Self,Value);

  if (Value = sopOff) or (Value = sopStowed) then
  begin
    if Assigned(OnSensorRemoved) then
      OnSensorRemoved(self);
  end;
end;

procedure TT3Sensor.SetEmconOperationalStatus(const Value: TEMCON_OperasionalStatus);
begin
  FEmconOperationalStatus := value;

  case value of
    EmconOn  : SetEmconStatus(FOperationalStatus, EmconOn);
    EmconOff : SetEmconStatus(FOperationalStatus, EmconOff);
  end;
end;

procedure TT3Sensor.SetEmconStatus(const Value: TSensorOperationalStatus;
  const Emcon: TEMCON_OperasionalStatus);
begin
 // isNeedNotify := false;
 // if Emcon <> FEmconOperationalStatus  then isNeedNotify := true;

  FOperationalStatus := Value;

 // if isNeedNotify then
    if Assigned(FOnSensorOperationalStatus) then
      FOnSensorOperationalStatus(Self,Value);

  if Value = sopOff then
    if Assigned(OnSensorRemoved) then
      OnSensorRemoved(self);

  if self is TT3Radar then
  begin
    if Emcon = EmconOn then
    begin
      TT3Radar(Self).RemoveAssignedtrack;
    end;
  end;
end;

procedure TT3Sensor.SetIFFStatus(const value: TSensorOperationalStatus);
begin
  FOperationalStatus := value;
end;

procedure TT3Sensor.SetShowBlindZone(const Value: boolean);
begin
  FShowBlindZone := Value;
end;

procedure TT3Sensor.SetShowRange(const Value: boolean);
begin
  FShowRange := Value;
end;

procedure TT3Sensor.SetShowRangeSelected(const Value: boolean);
begin
  FShowRangeSelected := Value;
end;

function TT3Sensor.TargetTypeEligiblity(aTarget: TObject): boolean;
begin
  Result := True;
end;

procedure TT3Sensor.SetShowBlindSelected(const Value: boolean);
begin
  FShowBlindSelected := Value;
end;

function TT3Sensor.SecondToTime(const s: Integer): TTime;
var
  h: Double;
begin
  h := s / 3600;
  Result := h / 24;
end;

procedure TT3Sensor.UpdateVisual;
var
  i : integer;
  blindZ : TBlindZoneVisual;

  visualSensor, daytime, nighttime, sunrise, sunset : Double;
  riseHour, riseMin, riseSec, riseMilli : Word;
  setHour, setMin, setSec, setMilli : Word;
  sun_rise, sun_set : TTime;
  //z : string;
begin
  inherited;
  visualSensor := 1;

  if Assigned(FParent) then begin
    FPosition.X := FParent.getPositionX;
    FPosition.Y := FParent.getPositionY;
    FPosition.Z := FParent.getPositionZ;

    //get visual
    Environment.getVisual(daytime, nighttime, sunrise, sunset);

    sun_rise := SecondToTime(Round(sunrise));
    sun_set  := SecondToTime(Round(sunset));

    DecodeTime(sun_rise, riseHour, riseMin, riseSec, riseMilli);
    DecodeTime(sun_set, setHour, setMin, setSec, setMilli);

    if (FmyHour >= riseHour) and (FmyHour < setHour) then
       visualSensor := daytime/100;
    if (FmyHour >= setHour) and (FmyHour < riseHour) then
       visualSensor := nighttime/100;

    FRangeView.Range  := FDetectionRange*visualSensor;
    FRangeView.mX     := FParent.getPositionX;
    FRangeView.mY     := FParent.getPositionY;
    FRangeView.ConvertCoord(Converter);

    FRangeWithVisualEffect := FDetectionRange * visualSensor;

    for i := 0 to FBlindZoneViews.Count - 1 do begin
      blindZ := FBlindZoneViews.Items[i];

      with blindZ do begin
        //z := TT3PlatformInstance(FParent).InstanceName;
        Heading:= TT3PlatformInstance(FParent).Course;
        Ranges := FDetectionRange;
        mX     := FParent.getPositionX;
        mY     := FParent.getPositionY;
        
        StartAngle := BZStartAngle[i];
        EndAngle   := BZEndAngle[i];

        ConvertCoord(Self.Converter);
      end;
    end;
  end;
end;

//function TT3Sensor.isJamming(aParent: TSimObject; aObject: TSimObject): Boolean;
//var
//  j : Integer;
//  pi, targetJamming : TT3PlatformInstance;
//begin
//  Result := False;
//
//  //for I := 0 to FSimPlatforms.itemCount - 1 do
//  //begin
//    //pfObject := FSimPlatforms.getObject(i);
//    //cek klo sama dengan dirinya sendiri lewati
//    //if pfObject = aParent then Continue;
//
//    if aObject is TT3PlatformInstance then
//      pi := TT3PlatformInstance(aObject)
//    else
//      Exit;
//
//    for j := 0 to pi.VehicleOnJamming.Count - 1 do
//    begin
//      targetJamming := TT3PlatformInstance(pi.VehicleOnJamming.Items[j]);
//
//      //cek apakah target list jamming ada yang sama dengan aObject
//      if TT3PlatformInstance(aParent).InstanceIndex = targetJamming.InstanceIndex then
//      begin
//        Result := True;
//        Break;
//      end;
//    end;
//  //end;
//
//  {if TT3PlatformInstance(aObject).masukJamming then
//    Result := True
//  else
//    Result := False; }
//end;

function TT3Sensor.GetSnapshotData : _SS_TT3Sensor ;
var
  ss :  _SS_TT3Sensor ;
  sdate : _SS_DateTime ;
  i : integer ;
begin
  ss.SST3Unit                    := TT3Unit(Self).GetSnapshotData;
  if Parent <> nil then ss.Owner := TT3Unit(Parent).InstanceIndex ;
  SetLength(ss.BZStartAngle,length(BZStartAngle));
  for I := low(BZStartAngle) to High(BZStartAngle) do
      ss.BZStartAngle[i]         := BZStartAngle[i];
  SetLength(ss.BZEndAngle,length(BZEndAngle));
  for I := low(BZEndAngle) to High(BZEndAngle) do
      ss.BZEndAngle[i]           := BZEndAngle[i];
  ss.ShowBlindZone               := ShowBlindZone ;
  ss.ShowRange                   := ShowRange ;
  ss.OperationalStatus           := byte(OperationalStatus) ;
  ss.EmconOperationalStatus      := byte(EmconOperationalStatus) ;
  ss.DetectionRange              := DetectionRange ;
  ss.DetailDetectionRange        := DetailDetectionRange ;
  ss.OperatingMode               := byte(OperatingMode) ;
  ss.ShowRangeSelected           := ShowRangeSelected ;
  ss.ShowBlindSelected           := ShowBlindSelected ;
    DecodeDateTime(Date_Time,sdate.year,sdate.month,sdate.day,sdate.hh,sdate.mt,sdate.sc,sdate.mm);
    ss.Date_Time                   := sdate;
  Result := ss ;
end;

procedure TT3Sensor.SetSnapshotData(const ss : _SS_TT3Sensor);
var
  i : integer ;
begin
  TT3Unit(Self).SetSnapshotData(ss.SST3Unit);
  SetLength(BZStartAngle,length(ss.BZStartAngle));
  for I := low(ss.BZStartAngle) to High(ss.BZStartAngle) do
      BZStartAngle[i]        := ss.BZStartAngle[i];
  SetLength(BZEndAngle,length(ss.BZEndAngle));
  for I := low(ss.BZEndAngle) to High(ss.BZEndAngle) do
      BZEndAngle[i]          := ss.BZEndAngle[i];
  ShowBlindZone              := ss.ShowBlindZone              ;
  ShowRange                  := ss.ShowRange ;
  OperationalStatus          := TSensorOperationalStatus(ss.OperationalStatus);            ;
  EmconOperationalStatus     := TEMCON_OperasionalStatus(ss.EmconOperationalStatus) ;
  DetectionRange             := ss.DetectionRange             ;
  DetailDetectionRange       := ss.DetailDetectionRange       ;
  OperatingMode              := TSensorOperatingMode(ss.OperatingMode)     ;
  ShowRangeSelected := ss.ShowRangeSelected          ;
  ShowBlindSelected := ss.ShowBlindSelected          ;
  if IsValidDateTime(ss.Date_Time.year, ss.Date_Time.month,ss.Date_Time.day,
     ss.Date_Time.hh,ss.Date_Time.mt,ss.Date_Time.sc,ss.Date_Time.mm) then
  begin
     Date_Time := EncodeDateTime(
     ss.Date_Time.year, ss.Date_Time.month,ss.Date_Time.day,
     ss.Date_Time.hh,ss.Date_Time.mt,ss.Date_Time.sc,ss.Date_Time.mm);
  end;
end;

end.
