unit uDBAsset_Radar;

interface

uses
  tttData,Classes, uDBBlind_Zone, uDBNote_Storage,uDBAsset_Vehicle,
  uSimObjects, uSimContainers, uSimVisuals,uBaseCoordSystem, Graphics,
  uObjectVisuals, uDataTypes, uSteppers, uSensor ;

type

  TRecCoverage = record
    range : double;
    min, max : double;
  end;
  PRecCoverage = ^TRecCoverage;

  TRadar_Vertical   = class
  private
    covDiagram1, covDiagram2 : TList;
    FData   : TList;
    procedure AddCoverage(diagram : TList;coverage : PRecCoverage);
  public
    X : Integer;
    Ymax : Integer;
    Ymin : Integer;
//    List_Index          : integer;
//    RadarCoverage_Index : integer;
//    Target_Type         : byte;
//    Prob_of_Hit         : single;
//    Range               : single;
    FRadar_Coverage : TRecRadar_Vertical_Coverage;
    constructor Create;
    destructor Destroy;override;
    procedure ReSort;
    procedure Add(pData : PRecRadar_Vertical_Coverage);
    procedure GetCoverage(range : double; var min1,max1,min2,max2 : double);
    function isDataCoverageExist : boolean;
  end;

  TRadar_On_Board = class(TSensor)
  private
    FScanSectorVisual : TBlindZoneVisual;

    // radar runtime setting
    FControlMode    : TRadarControlMode;
    FScanRate       : TDelayer;

    procedure SetControlMode(const Value: TRadarControlMode);
    procedure ScanRate(aDelta : double);
    procedure SetOperationalStatus(const Value: TSensorOperationalStatus);override;
  public
    FData      : TRecRadar_On_Board;
    FDef       : TRecRadar_Definition;
    FPattern   : TRecPattern_Radar_Event;
    FType      : TRecRadar_Type ;
    FInterval  : TRecRadar_Interval_Definition;
    FVehicle   : TVehicle_Definition;
    FPOD       : TRecPOD_vs_SNR_Curve_Definition;

    FBZone_1            : TRecBlind_Zone_Definition;
    FBZone_2            : TRecBlind_Zone_Definition;
    FBlind_Zone         : TBlind_Zone;
    FBlind              : TList;
    FRadar_Type         : TList;

    FScripted_Pattern   : TList; // TRecPattern_Radar_Event;
    FScripted_Radar     : TList; //TRecScripted_Radar_Event;
    FRadar_Vertical     : TRadar_Vertical;
    FNote               : TNote_Storage ;
    FECCM_Type          : TRecECCM_Type ;

    // radar runtime setting
    FECCM                 : boolean;
    FScanSector           : TRadarScanSector;
    FStartScan, FEndScan  : double;
    FShowScanSector       : boolean;
    FSwapLine             : TSwapLineVisual;

    FMiliSeconds        : double;
    FScanDegree         : double;

    constructor Create;
    destructor Destroy; override;

    procedure SensorProcess;override;

  public
    procedure UpdateVisual; override;
    procedure Move(const aDeltaMs: double); override;
    procedure Draw(aCnv: tCanvas); override;
    property ControlMode : TRadarControlMode  read FControlMode write SetControlMode;
  end;


implementation

uses uDBAssetObject, uCoordConvertor, uDBAsset_Weapon;
{ TRadar_On_Board }

constructor TRadar_On_Board.Create;
begin
  inherited;
  FScripted_Pattern   := TList.Create;
  FScripted_Radar     := TList.Create;
  FBlind              := TList.Create;

  FRadar_Vertical     := TRadar_Vertical.Create;
  FBlind_Zone         := TBlind_Zone.Create;
  FVehicle            := TVehicle_Definition.Create;

  FScanSectorVisual   := TBlindZoneVisual.Create;
  FSwapLine           := TSwapLineVisual.Create;
  FControlMode        := rcmOff;
  FScanSector         := rscFull;
  FStartScan          := 0;
  FEndScan            := 360;

  FShowScanSector     := false;

  FMiliSeconds        := 0;
  FScanDegree         := 0;

  DetectionRange      := FDef.Detection_Range;
end;

destructor TRadar_On_Board.Destroy;
begin
  FreeItemsAndFreeList(FScripted_Pattern);
  FreeItemsAndFreeList(FScripted_Radar);
  FreeItemsAndFreeList(FBlind);

  FRadar_Vertical.Free;
  FBlind_Zone.Free;
  FVehicle.Free;
  FScanSectorVisual.Free;
  FSwapLine.Free;

  inherited;
end;

procedure TRadar_On_Board.Draw(aCnv: tCanvas);
begin
  inherited;
  if FShowScanSector then begin
    //FSwapLine.Color := clGreen;
    //FSwapLine.Draw(aCnv);
    //FScanSectorVisual.Color := clGreen;
    //FScanSectorVisual.Draw(aCnv);
  end;
end;

procedure TRadar_On_Board.Move(const aDeltaMs: double);
begin
  inherited;

end;


procedure TRadar_On_Board.SensorProcess;
var
  list : TList;
  i : integer;
  obj : TSimObject;
  range, bearing : double;
  min1,max1,min2,max2 : double;
  isInRange, isOutsideBlindZone, isInVerticalCoverage, isInGroup : boolean;
begin
  inherited;

  if not Assigned(FSimObjects) then Exit;

  list := FSimObjects.GetList;
  for I := 0 to List.Count - 1 do begin
    isInRange := false;
    isOutsideBlindZone := true;
    isInVerticalCoverage := false;
    isInGroup := false;
    range   := 1000000;
    bearing := 0;

    obj := list.Items[i];

    // if parent same with self
    if Assigned(obj.Parent) then
      if obj.Parent = Parent then continue;

    if Parent = obj then continue;

    if obj.ClassType = TPlatform_Instance then begin
      range := CalcRange(FPosition.X,FPosition.Y,
               TPlatform_Instance(obj).PositionX,TPlatform_Instance(obj).PositionY);
      bearing := CalcBearing(FPosition.X,FPosition.Y,
               TPlatform_Instance(obj).PositionX,TPlatform_Instance(obj).PositionY);
    end else
    if obj.ClassType = TMissile_On_Board then begin
    end;

    // periksa apakah dalam jangkauan radar
    if range <= DetectionRange then begin
      isInRange := true;

      // periksa apakah dalam jangkauan vertikal radar
      if FRadar_Vertical.isDataCoverageExist then begin
        FRadar_Vertical.GetCoverage(range,min1,max1,min2,max2);
        // PositionZ belum tau satuannya -> harus diubah dulu ke feet sebelum
        // di bandingkan dengan min dan max
        if obj.ClassType = TPlatform_Instance then begin
          if (TPlatform_Instance(obj).PositionZ > min1) and
             (TPlatform_Instance(obj).PositionZ > min2) and
             (TPlatform_Instance(obj).PositionZ < max1) and
             (TPlatform_Instance(obj).PositionZ < max2) then
             isInVerticalCoverage := true;
        end;
      end else
        // dianggap semua ketinggian/kedalaman tercover
        // karena tidak ada data vertical coverage
        isInVerticalCoverage := true;
    end;

    // periksa apakah diluar area blind zone
    if not (FBlind_Zone.FData.Start_Angle = FBlind_Zone.FData.End_Angle) then begin
      {jika start > end angle}
      if (FBlindZone.RelativeStartAngle > FBlindZone.RelativeEndAngle) then begin
        if (bearing > FBlindZone.RelativeStartAngle) or
           (bearing < FBlindZone.RelativeEndAngle) then isOutsideBlindZone := false;
      end else
      if (bearing > FBlindZone.RelativeStartAngle) and
         (bearing < FBlindZone.RelativeEndAngle) then isOutsideBlindZone := false;
    end;

    // klo dalam satu group g perlu dideteksi
    isInGroup := TPlatform_Instance(obj).isOnGroup;

    // periksa semua factor deteksi
    if isInRange and isOutsideBlindZone and isInVerticalCoverage and
      not isInGroup then
      AddDetectedObject(obj,dstRadar,FDef.Radar_Identifier)
    else
      RemoveDetectedObject(obj,dstRadar,FDef.Radar_Identifier)
  end;

  FSimObjects.ReturnList;
end;


procedure TRadar_On_Board.ScanRate(aDelta: double);
begin
  FMiliSeconds := FMiliSeconds + ( aDelta * 1000 );

  if FMiliSeconds > 1000 then
    FMiliSeconds := FMiliSeconds - 1000;

  FScanDegree := FMiliSeconds * (FDef.Scan_Rate / 1000);
end;

procedure TRadar_On_Board.SetControlMode(const Value: TRadarControlMode);
begin
  FControlMode := Value;
  case Value of
    rcmOff    : SetOperationalStatus(sopOff);
    rcmTrack  : SetOperationalStatus(sopOn);
    rcmSearchTrack: SetOperationalStatus(sopOn);
  end;

  if Value = rcmOff then
    RemoveAllDetectedObject(dstRadar,FDef.Radar_Identifier);
end;

procedure TRadar_On_Board.SetOperationalStatus(
  const Value: TSensorOperationalStatus);
begin
  inherited;
  if isNeedNotify then TriggerChange(etRadarOperationalStatus);
end;

procedure TRadar_On_Board.UpdateVisual;
begin
  inherited;
  if Assigned(FParent) then begin
    DetectionRange := FDef.Detection_Range;

    FSwapLine.Heading := TPlatform_Instance(FParent).Course;
    FSwapLine.Ranges := FDef.Detection_Range;
    FSwapLine.mX     := FParent.getPositionX;
    FSwapLine.mY     := FParent.getPositionY;
    FSwapLine.Angle  := FScanDegree;
    FSwapLine.ConvertCoord(VConvertor);
  end;
end;

{ TRadar_Vertical }

procedure TRadar_Vertical.Add(pData: PRecRadar_Vertical_Coverage);
var
  coverage : PRecCoverage;
begin
  // ignore 0 range
  if pData^.Vert_Coverage_Range <= 0.0009 then exit;
  
  FData.Add(pData);

  New(coverage);
  coverage^.range := pData^.Vert_Coverage_Range;
  coverage^.min   := pData^.Vert_Cover_Min_Elevation;
  coverage^.max   := pData^.Vert_Cover_Max_Elevation;

  case pData^.Coverage_Diagram of
    // first vertical coverage diagram
    1 : AddCoverage(covDiagram1, coverage);
    // second vertical coverage diagram
    2 : AddCoverage(covDiagram2, coverage);
  end;
end;

procedure TRadar_Vertical.AddCoverage(diagram: TList; coverage: PRecCoverage);
var
  i, lastIndex : integer;
  item : PRecCoverage;
begin
  // add and sorted by range
  if diagram.Count = 0 then begin
    diagram.Add(coverage);
    exit;
  end;
  lastIndex := 0;
  for I := 0 to diagram.Count - 1 do begin
    item := diagram.Items[i];
    if item^.range >= coverage^.range then break;
    lastIndex := i;
  end;

  diagram.Insert(i,coverage);
end;

constructor TRadar_Vertical.Create;
begin
  if not Assigned(FData) then
    FData := TList.Create;

  covDiagram1 := TList.Create;
  covDiagram2 := TList.Create;
end;

destructor TRadar_Vertical.Destroy;
begin
  FreeItemsAndFreeList(covDiagram1);
  FreeItemsAndFreeList(covDiagram2);
  FreeItemsAndFreeList(FData);

  inherited;
end;

procedure TRadar_Vertical.GetCoverage(range: double; var min1, max1, min2,max2: double);
var i : integer;
    item, item2 : PRecCoverage;
begin
  item := nil;
  min1 := -1;
  min2 := -1;
  max1 := 100000000;
  max2 := 100000000;

  // diagram vertical coverage pertama
  if covDiagram1.Count > 1 then begin
    for i := 0 to covDiagram1.Count - 1 do begin
      item := covDiagram1.Items[i];
      if range > item^.range then continue else break;
    end;

    if (i = 0) or (i = covDiagram1.Count - 1) then begin
      min1 := item^.min;
      max1 := item^.max;
    end else
    begin
      item2 := covDiagram1.Items[i-1];
      // pake interpolasi
      // Y = (((X - X0)*Y1) + ((X1 - X)*Y0)) / (X1 - X0);

      min1 := (((range - item2^.range)*item^.min) +
              ((item^.range-range)*item2^.min)) /
              (item^.range - item2^.range);
      max1 := (((range - item2^.range)*item^.max) +
              ((item^.range-range)*item2^.max)) /
              (item^.range - item2^.range);
    end;
  end;

  // diagram vertical coverage kedua
  if covDiagram2.Count > 1 then begin
    for i := 0 to covDiagram2.Count - 1 do begin
      item := covDiagram2.Items[i];
      if range > item^.range then continue else break;
    end;

    if (i = 0) or (i = covDiagram2.Count - 1) then begin
      min2 := item^.min;
      max2 := item^.max;
    end else
    begin
      item2 := covDiagram2.Items[i-1];
      // pake interpolasi
      // Y = (((X - X0)*Y1) + ((X1 - X)*Y0)) / (X1 - X0);

      min2 := (((range - item2^.range)*item^.min) +
              ((item^.range-range)*item2^.min)) /
              (item^.range - item2^.range);
      max2 := (((range - item2^.range)*item^.max) +
              ((item^.range-range)*item2^.max)) /
              (item^.range - item2^.range);
    end;
  end;

end;

function TRadar_Vertical.isDataCoverageExist: boolean;
begin
  result := false;
  if Assigned(FData) then
    result := (FData.Count > 0);
end;

procedure TRadar_Vertical.ReSort;
var
  coverage : PRecRadar_Vertical_Coverage;
  item : PRecCoverage;
  i : integer;
begin
  covDiagram1.Clear;
  covDiagram2.Clear;

  for i := 0 to FData.Count - 1 do begin
    coverage := FData.Items[i];

    New(item);
    item^.range := coverage^.Vert_Coverage_Range;
    item^.min   := coverage^.Vert_Cover_Min_Elevation;
    item^.max   := coverage^.Vert_Cover_Max_Elevation;

    case coverage^.Coverage_Diagram of
      // first vertical coverage diagram
      1 : AddCoverage(covDiagram1, item);
      // second vertical coverage diagram
      2 : AddCoverage(covDiagram2, item);
    end;
  end;
end;

end.
