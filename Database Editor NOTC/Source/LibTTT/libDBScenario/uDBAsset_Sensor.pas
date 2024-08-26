unit uDBAsset_Sensor;

interface

uses
  tttData,Classes,uDBBlind_Zone, uDBNote_Storage,uDBAsset_Vehicle,
  uSimObjects, Graphics, uObjectVisuals, uSensor, uBaseCoordSystem, uSimContainers;

type


  TEOD_On_Board = class(TSensor)
  public

    FNote       : TNote_Storage ;
    FData       : TRecEO_On_Board;
    FEO_Def     : TRecEO_Detection_Definition;
    FBlind_Zone : TBlind_Zone;
    FBlind      : TList;
    FVehicle    : TVehicle_Definition;

    FBZone_1  : TRecBlind_Zone_Definition;
    FBZone_2  : TRecBlind_Zone_Definition;

    constructor Create;
    destructor Destroy;override;


  end;

  TESM_On_Board = class(TSimObject)
  private
    FOperationalStatus: TESMOperationalStatus;
    FShowBlindZone  : boolean;
    FBlindZone      : TBlindZoneVisual;
    procedure SetOperationalStatus(const Value: TESMOperationalStatus);
    procedure SetShowBlindZone(const Value: boolean);
    procedure SensorProcess;
  published
    property OperationalStatus : TESMOperationalStatus read FOperationalStatus write SetOperationalStatus;
    property ShowBlindZone : boolean read FShowBlindZone write SetShowBlindZone;
  public
    FData   : TRecESM_On_Board;
    FESM_Def: TRecESM_Definition;

    FNote   : TNote_Storage ;

    FBlind_Zone : TBlind_Zone;
    FBlind_Zone2 : TBlind_Zone;
    FBlind  : TList;
    FVehicle    : TVehicle_Definition;

    //added by bebe
    FBZone_1 : TRecBlind_Zone_Definition;
    FBZone_2 : TRecBlind_Zone_Definition;

    constructor Create;
    destructor Destroy;override;
    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
  end;

  TIFF_Sensor_On_Board = class (TSimObject)
  private
    FTransponderOperateStatus: TIFFOperationStatus;
    FInterrogatorOperateStatus: TIFFOperationStatus;
    FMode1Enabled: boolean;
    FMode4Enabled: boolean;
    FMode3CEnabled: boolean;
    FMode2Enabled: boolean;
    FMode3Enabled: boolean;
    FMode2: integer;
    FMode3: integer;
    FMode1: integer;
    procedure SetInterrogatorOperateStatus(const Value: TIFFOperationStatus);
    procedure SetTransponderOperateStatus(const Value: TIFFOperationStatus);
    procedure SetMode1Enabled(const Value: boolean);
    procedure SetMode2Enabled(const Value: boolean);
    procedure SetMode3CEnabled(const Value: boolean);
    procedure SetMode3Enabled(const Value: boolean);
    procedure SetMode4Enabled(const Value: boolean);
    procedure SetMode1(const Value: integer);
    procedure SetMode2(const Value: integer);
    procedure SetMode3(const Value: integer);
  published
    property TransponderOperateStatus   : TIFFOperationStatus read FTransponderOperateStatus write SetTransponderOperateStatus;
    property InterrogatorOperateStatus  : TIFFOperationStatus read FInterrogatorOperateStatus write SetInterrogatorOperateStatus;
    property Mode1Enabled : boolean read FMode1Enabled write SetMode1Enabled;
    property Mode2Enabled : boolean read FMode2Enabled write SetMode2Enabled;
    property Mode3Enabled : boolean read FMode3Enabled write SetMode3Enabled;
    property Mode3CEnabled : boolean read FMode3CEnabled write SetMode3CEnabled;
    property Mode4Enabled : boolean read FMode4Enabled write SetMode4Enabled;
    property Mode1 : integer read FMode1 write SetMode1;
    property Mode2 : integer read FMode2 write SetMode2;
    property Mode3 : integer read FMode3 write SetMode3;
  public
    FData         : TRecIFF_Sensor_On_Board;
    FPattern_IFF  : TList; //TRecPattern_IFF_Event;
    FScripted_IFF : TList; //TRecScripted_IFF_Event;
    FVehicle    : TVehicle_Definition;

    constructor Create;
    destructor Destroy;override;
    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;

  end;

  TMAD_On_Board = class
  public
    FData    : TRecMAD_Sensor_On_Board;
    FMAD_Def : TRecMAD_Definition;
    FNote    : TNote_Storage ;
    FVehicle    : TVehicle_Definition;

    constructor Create;
    destructor Destroy;override;

  end;

  TFCR_On_Board = class
  public
    FData    : TRecFCR_On_Board;
    FFCR_def : TRecFCR_Definition;

    FNote    : TNote_Storage ;

    FBlind_Zone : TBlind_Zone;
    FBlind   : TList;

    constructor Create;
    destructor Destroy;override;

  end;

  TVisual_Sensor_On_Board = class (TSensor)
  protected
    procedure SensorProcess;override;
  public
    FData       : TRecVisual_Sensor_On_Board;
    FBlind_Zone : TBlind_Zone;
    FBlind      : TList;
    FVehicle    : TVehicle_Definition;

    FBZone_1 : TRecBlind_Zone_Definition;
    FBZone_2 : TRecBlind_Zone_Definition;

    constructor Create;
    destructor Destroy;override;
    procedure UpdateVisual; override;
    procedure Move(const aDeltaMs: double); override;
    procedure Draw(aCnv: tCanvas); override;

    //  No Visual Definition .
  end;

implementation

uses uDBAssetObject, uDBAsset_Weapon;


{ TEO_On_Board }

constructor TEOD_On_Board.Create;
begin
   FBlind      := TList.Create;
   FBlind_Zone := TBlind_Zone.Create;
   FVehicle    := TVehicle_Definition.Create;
end;

destructor TEOD_On_Board.Destroy;
begin
  FreeItemsAndFreeList(FBlind);
  FBlind_Zone.Free;
  FVehicle.Free;
  inherited;
end;

{ TESM_On_Board }

constructor TESM_On_Board.Create;
begin
   FBlind      := TList.Create;
   FBlind_Zone := TBlind_Zone.Create;
   FVehicle    := TVehicle_Definition.Create;

   FOperationalStatus := eosOff;
   FShowBlindZone := false;
   FBlindZone     := TBlindZoneVisual.Create;
end;

destructor TESM_On_Board.Destroy;
begin
   FreeItemsAndFreeList(FBlind);
   FBlind_Zone.Free;
   FVehicle.Free;
   FBlindZone.Free;
  inherited;
end;

procedure TESM_On_Board.Draw(aCnv: tCanvas);
begin
  inherited;

  if FShowBlindZone then begin
    FBlindZone.Color := clGreen;
    FBlindZone.Draw(aCnv);
  end;

end;

procedure TESM_On_Board.Move(const aDeltaMs: double);
begin
  inherited;
  if FOperationalStatus = eosOn then
    SensorProcess;
end;

procedure TESM_On_Board.SensorProcess;
begin

end;

procedure TESM_On_Board.SetOperationalStatus(
  const Value: TESMOperationalStatus);
var
  isNeedNotify : boolean;
begin
  isNeedNotify := false;
  if Value <> FOperationalStatus  then isNeedNotify := true;

  FOperationalStatus := Value;

  if isNeedNotify then TriggerChange(etESMOperationalStatus);
end;

procedure TESM_On_Board.SetShowBlindZone(const Value: boolean);
begin
  FShowBlindZone := Value;
end;

procedure TESM_On_Board.UpdateVisual;
begin
  inherited;

end;

{ TFCR_On_Board }

constructor TFCR_On_Board.Create;
begin
  FBlind      := TList.Create;
  FBlind_Zone := TBlind_Zone.Create;
end;

destructor TFCR_On_Board.Destroy;
begin
  FBlind.Free;
  inherited;
end;

{ TVisual_Sensor_On_Board }

constructor TVisual_Sensor_On_Board.Create;
begin
  inherited;
  FBlind      := TList.Create;
  FBlind_Zone := TBlind_Zone.Create;
  FVehicle    := TVehicle_Definition.Create;

  FOperationalStatus := sopOn;
  DetectionRange := 12;
end;

destructor TVisual_Sensor_On_Board.Destroy;
begin
  FreeItemsAndFreeList(FBlind);
  FBlind_Zone.Free;
  FVehicle.Free;
  inherited;
end;

procedure TVisual_Sensor_On_Board.Draw(aCnv: tCanvas);
begin
  inherited;

end;

procedure TVisual_Sensor_On_Board.Move(const aDeltaMs: double);
begin
  inherited;

end;

procedure TVisual_Sensor_On_Board.SensorProcess;
var
  obj : TSimObject;
  i : integer;
  list : TList;
  isInRange, isOutsideBlindZone, isOnGroup : boolean;
  range, bearing : double;
  isInGroup : boolean;
begin
  inherited;
  if not Assigned(FSimObjects) then Exit;
  list := FSimObjects.GetList;
  for I := 0 to List.Count - 1 do begin
    isInRange := false;
    isOutsideBlindZone := true;
    isOnGroup := false;
    range    := 1000000;
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
    end;

    // periksa apakah diluar area blind zone
    if FBlind_Zone <> nil then
      //for j := 0 to List.Count - 1 do
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

    if isInRange and isOutsideBlindZone and not isInGroup then
      AddDetectedObject(obj,dstVisual,FData.Instance_Identifier)
    else
      RemoveDetectedObject(obj,dstVisual,FData.Instance_Identifier)
  end;
end;

procedure TVisual_Sensor_On_Board.UpdateVisual;
begin
  inherited;
  DetectionRange := 12 ;
end;

{ TMAD_Sensor_On_Board }

constructor TMAD_On_Board.Create;
begin
   FVehicle := TVehicle_Definition.Create;
end;

destructor TMAD_On_Board.Destroy;
begin
  FVehicle.Free;
  inherited;
end;

{ TIFF_Sensor_On_Board }

constructor TIFF_Sensor_On_Board.Create;
begin
  FPattern_IFF  := TList.Create; //TRecPattern_IFF_Event;
  FScripted_IFF := TList.Create; //TRecScripted_IFF_Event;
  FVehicle      := TVehicle_Definition.Create;

  FTransponderOperateStatus := oosOff;
  FInterrogatorOperateStatus:= oosOff;
end;

destructor TIFF_Sensor_On_Board.Destroy;
begin
  FPattern_IFF.Free;
  FScripted_IFF.Free;
  FVehicle.Free;
  inherited;
end;

procedure TIFF_Sensor_On_Board.Draw(aCnv: tCanvas);
begin
  inherited;

end;

procedure TIFF_Sensor_On_Board.Move(const aDeltaMs: double);
begin
  inherited;

end;

procedure TIFF_Sensor_On_Board.SetInterrogatorOperateStatus(
  const Value: TIFFOperationStatus);
begin
  FInterrogatorOperateStatus := Value;
  TriggerChange(etIFFOperationalStatus);
end;

procedure TIFF_Sensor_On_Board.SetMode1(const Value: integer);
begin
  FMode1 := Value;
end;

procedure TIFF_Sensor_On_Board.SetMode1Enabled(const Value: boolean);
begin
  FMode1Enabled := Value;
end;

procedure TIFF_Sensor_On_Board.SetMode2(const Value: integer);
begin
  FMode2 := Value;
end;

procedure TIFF_Sensor_On_Board.SetMode2Enabled(const Value: boolean);
begin
  FMode2Enabled := Value;
end;

procedure TIFF_Sensor_On_Board.SetMode3(const Value: integer);
begin
  FMode3 := Value;
end;

procedure TIFF_Sensor_On_Board.SetMode3CEnabled(const Value: boolean);
begin
  FMode3CEnabled := Value;
end;

procedure TIFF_Sensor_On_Board.SetMode3Enabled(const Value: boolean);
begin
  FMode3Enabled := Value;
end;

procedure TIFF_Sensor_On_Board.SetMode4Enabled(const Value: boolean);
begin
  FMode4Enabled := Value;
end;

procedure TIFF_Sensor_On_Board.SetTransponderOperateStatus(
  const Value: TIFFOperationStatus);
begin
  FTransponderOperateStatus := Value;
  TriggerChange(etIFFOperationalStatus);
end;

procedure TIFF_Sensor_On_Board.UpdateVisual;
begin
  inherited;

end;

end.
