unit uSensor;

interface

uses uSimObjects,tttData, Graphics, uObjectVisuals, uCoordConvertor,
     uSimContainers, uSimVisuals ;

type
  TSensor = class(TSimObject)
  private

    FShowBlindZone: boolean;
    FShowRange: boolean;

    FDetectionRange: single;
    FBZEndAngle: single;
    FBZStartAngle: single;

    procedure SetShowBlindZone(const Value: boolean);
    procedure SetShowRange(const Value: boolean);
    procedure SetDetectionRange(const Value: single);
    procedure SetBZEndAngle(const Value: single);
    procedure SetBZStartAngle(const Value: single);
  protected
    isNeedNotify : boolean;
    FOperationalStatus: TSensorOperationalStatus;

    FSimObjects       : TSimContainer;
    FDetectedObjects  : TDrawContainers;

    FRangeView      : TRangeVisual;
    FBlindZone      : TBlindZoneVisual;

    procedure AddDetectedObject(aObject: TSimObject;
                    detectSensor : TDetectedSensorType;
                    sensorIdentifier : string);
    procedure RemoveDetectedObject(aObject : TSimObject;
                    detectSensor : TDetectedSensorType;
                    sensorIdentifier : string);
    procedure RemoveAllDetectedObject(
                    detectSensor : TDetectedSensorType;
                    sensorIdentifier : string); overload;
    procedure RemoveAllDetectedObject; overload;

    procedure SensorProcess; virtual;

    procedure SetOperationalStatus(const Value: TSensorOperationalStatus);virtual;

  public
    constructor Create;
    destructor Destroy;override;
    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure SetObjects(simObjects      : TSimContainer;
                         detectedObjects : TDrawContainers);

  published
    property ShowBlindZone : boolean read FShowBlindZone write SetShowBlindZone;
    property ShowRange : boolean read FShowRange write SetShowRange;
    property OperationalStatus : TSensorOperationalStatus read FOperationalStatus write SetOperationalStatus;
    property DetectionRange : single read FDetectionRange write SetDetectionRange;
    property BZStartAngle : single  read FBZStartAngle write SetBZStartAngle;
    property BZEndAngle : single read FBZEndAngle write SetBZEndAngle;
  end;
implementation

uses uDBAssetObject, Classes, uDetectedObject;

{ TSensor }

procedure TSensor.AddDetectedObject(aObject: TSimObject;
  detectSensor: TDetectedSensorType;sensorIdentifier : string);
var i  :integer;
    instanceName : string;
    detectedObject : TDetectedObject;
    found : boolean;
    maxTrackId : integer;
begin
  detectedObject := nil;
  found := false;
  maxTrackId := 0;

  if aObject.ClassType = TPlatform_Instance then
    instanceName := TPlatform_Instance(aObject).InstanceName;

  for I := 0 to FDetectedObjects.ItemCount - 1 do begin
    detectedObject := FDetectedObjects.GetItem(i) as TDetectedObject ;
    with detectedObject do begin
      if maxTrackId < TrackNumber  then
        maxTrackId := TrackNumber;

      if SimObject = aObject then begin
        DetectedBy := DetectedBy + [detectSensor];
        found := true;
        break;
      end;
    end;
  end;

  if not found then begin
    detectedObject := TDetectedObject.Create;
    detectedObject.DetectedBy := [detectSensor];
    detectedObject.SimObject := aObject;
    detectedObject.TrackNumber := maxTrackId + 1;
    FDetectedObjects.addItem(detectedObject);
  end;

  detectedObject.IfNotExistAdd(sensorIdentifier);
end;

constructor TSensor.Create;
begin
  inherited;
  FRangeView      := TRangeVisual.Create;
  FBlindZone      := TBlindZoneVisual.Create;

  FShowBlindZone  := false;
  FShowRange      := false;
  isNeedNotify    := false;

  FOperationalStatus  := sopOff;

end;

destructor TSensor.Destroy;
begin
  FRangeView.Free;
  FBlindZone.Free;
  inherited;
end;

procedure TSensor.Draw(aCnv: tCanvas);
begin
  inherited;
  if FShowRange then begin
    FRangeView.Color := clGreen;
    FRangeView.LineStyles := psSolid;
    FRangeView.Draw(aCnv);
  end;
  if FShowBlindZone then begin
    FBlindZone.Color := clGreen;
    FBlindZone.Draw(aCnv);
  end;
end;

procedure TSensor.Move(const aDeltaMs: double);
begin
  inherited;

  if ((FOperationalStatus = sopOn)        or
      (FOperationalStatus = sopActive)    or
      (FOperationalStatus = sopPassive) ) and
      (FOperationalStatus <> sopDamage)   then
    SensorProcess;
end;

procedure TSensor.RemoveAllDetectedObject(detectSensor: TDetectedSensorType;
  sensorIdentifier: string);
var i  :integer;
begin
  for i := FDetectedObjects.ItemCount - 1 downto 0 do
    with FDetectedObjects.GetItem(i) as TDetectedObject do begin
      IfExistDelete(sensorIdentifier);

      if (detectSensor in DetectedBy) then
        DetectedBy := DetectedBy - [dstSonar];

      if DetectedBy = [dstNone] then
        FDetectedObjects.DeleteItem(i);
    end;
end;

procedure TSensor.RemoveAllDetectedObject;
begin
  FDetectedObjects.ClearItems;
end;

procedure TSensor.RemoveDetectedObject(aObject : TSimObject;
                detectSensor : TDetectedSensorType;
                sensorIdentifier : string);
var i  :integer;
begin
  for I := 0 to FDetectedObjects.ItemCount - 1 do begin

    with FDetectedObjects.GetItem(i) as TDetectedObject do begin
      if SimObject = aObject then begin
        IfExistDelete(sensorIdentifier);

        // will remove if object not detected by other sensor
        if DetectedBy = [] then begin
          FDetectedObjects.DeleteItem(i);
          break;
        end
        // else remove only object sensor state
        else begin
          DetectedBy := DetectedBy - [detectSensor];
          break;
        end;
      end;
    end;
  end;
end;

procedure TSensor.SensorProcess;
begin

end;

procedure TSensor.SetBZEndAngle(const Value: single);
begin
  FBZEndAngle := Value;
end;

procedure TSensor.SetBZStartAngle(const Value: single);
begin
  FBZStartAngle := Value;
end;

procedure TSensor.SetDetectionRange(const Value: single);
begin
  FDetectionRange := Value;
end;

procedure TSensor.SetObjects(simObjects: TSimContainer;
  detectedObjects: TDrawContainers);
begin
  FSimObjects := simObjects;
  FDetectedObjects := detectedObjects;
end;

procedure TSensor.SetOperationalStatus(const Value: TSensorOperationalStatus);
begin
  isNeedNotify := false;
  if Value <> FOperationalStatus  then isNeedNotify := true;

  FOperationalStatus := Value;
  //if isNeedNotify then TriggerChange(etRadarOperationalStatus);
end;

procedure TSensor.SetShowBlindZone(const Value: boolean);
begin
  FShowBlindZone := Value;
end;

procedure TSensor.SetShowRange(const Value: boolean);
begin
  FShowRange := Value;
end;

procedure TSensor.UpdateVisual;
begin
  inherited;
  if Assigned(FParent) then begin
    FPosition.X := FParent.getPositionX;
    FPosition.Y := FParent.getPositionY;
    FPosition.Z := FParent.getPositionZ;

    FRangeView.Range  := FDetectionRange;
    FRangeView.mX     := FParent.getPositionX;
    FRangeView.mY     := FParent.getPositionY;
    FRangeView.ConvertCoord(VConvertor);

    if FParent.ClassType =  TPlatform_Instance then
      FBlindZone.Heading:= TPlatform_Instance(FParent).Course;

    FBlindZone.Ranges := FDetectionRange;
    FBlindZone.mX     := FParent.getPositionX;
    FBlindZone.mY     := FParent.getPositionY;
    FBlindZone.StartAngle := BZStartAngle;
    FBlindZone.EndAngle   := BZEndAngle;
    FBlindZone.ConvertCoord(VConvertor);
  end;

end;

end.
