unit uT3Sonobuoy;

interface

uses uT3Unit, uT3Sonar, uT3Sensor, uDBAsset_Sonar,{uDBAsset_Sonobuoy, }uObjectVisuals, uGameData_TTT,
     u2DMover, uDBBlind_Zone, uT3UnitContainer, uSimObjects, tttData, uT3Listener, uT3Vehicle,
     Graphics, SysUtils, Classes, newClassASTT, math, uSnapshotData;

type
  TMoveChangeState  = (mcsStable, mcsIncrease, mcsDecrease);

  TT3Sonobuoy = class(TT3PlatformInstance)
    private
      FOrderedAltitude        : Double;
      FEndurance              : integer;
      FMover                  : T2DMover;
      FHomePositionX          : double;
      FHomePositionY          : double;
      FHomePositionZ          : double;

      FLaunch                 : Boolean;
      FSonobuoyDefinition     : TSonobuoy_On_Board;
      FAltitudeState          : TMoveChangeState;
      FCycleUpdateAltitude    : double;
      FControlMode            : TSonarControlMode;
      FDetectSonoPassive      : Boolean;
      FDetect2SonoPassive     : Boolean;
      FDetect3SonoPassive     : Boolean;
      FOnSonobuoyPassiveDetect : TOnSonobuoyPassiveDetect;
      FScanInterval : integer;
      FOwner: TSimObject;
    FSonobuoyID: Integer;

      procedure SetOrderedAltitude(const Value : double);
      procedure SetControlMode(const value : TSonarControlMode);
    procedure SetOwner(const Value: TSimObject);
    procedure setSonobuoyID(const Value: Integer);
    protected
      //FisInstructor           : Boolean;
      FVerticalSpeed          : double;
      FOrderDepth             : Double;

      function  getAltitude: single; override;
      procedure SetAltitude(const Value: single); override;
      procedure SetInstructor(Const Value: boolean); override;
      procedure SetIsWasdal(const Value: Boolean); override;

      procedure CalcMovement(aDeltaMs: double); override;
    public
      Gambar  : Boolean;
      ParentIndex : integer;
      SimPlatforms           : TT3UnitContainer;
      parentSonobuoy : TT3PlatformInstance;
      TargetSonoPassive : TT3PlatformInstance;
      PlatformDetectBySonobuoy : TList;
      FRangeSonobuoy          : Double;
      FRangeActive : double;
      FRangePassive : double;

      constructor Create; override;
      destructor Destroy; override;

      function GetSnapshotData : _SS_TT3Sonobuoy ;
      procedure SetSnapshotData(const ss : _SS_TT3Sonobuoy);

      procedure Initialize; override;
      procedure Draw(aCnv: TCanvas); override;
      procedure Move(const aDeltaMs: double); override;
      procedure UpdateVisual ; override;

      procedure Launch;
      procedure SonoBoyProses;
      procedure RepositionTo(const x, y: double); override;
      procedure setPositionX(const v: double); override;
      procedure setPositionY(const v: double); override;
      procedure setPositionZ(const v: double); override;

      property VerticalSpeed : Double read FVerticalSpeed write FVerticalSpeed;
      property OrderedAltitude  : double read FOrderedAltitude  write SetOrderedAltitude;
      property SonobuoyDefinition : TSonobuoy_On_Board read FSonobuoyDefinition;
      property OrderDepth : Double read FOrderDepth write FOrderDepth;
      property OrderEndurance : Integer read FEndurance write FEndurance;
      property ControlMode : TSonarControlMode read FControlMode write SetControlMode;
      property DetectSonoPassive : Boolean read FDetectSonoPassive write FDetectSonoPassive;
      property Detect2SonoPassive : Boolean read FDetect2SonoPassive write FDetect2SonoPassive;
      property Detect3SonoPassive : Boolean read FDetect3SonoPassive write FDetect3SonoPassive;
      property OnSonobuoyPassiveDetect : TOnSonobuoyPassiveDetect read FOnSonobuoyPassiveDetect write FOnSonobuoyPassiveDetect;
//      property Owner           : TSimObject read FOwner write SetOwner;
      property SonobuoyID      : Integer read FSonobuoyID write setSonobuoyID;
  end;

  TT3SonobuoyOnVehicle = class(TT3Sensor)
  private
    FQuantity           : integer;
    FWeaponStatus       : TWeaponStatus;
    FOnUpdateQuantity   : TNotifyEvent;
    FSonobuoyDefinition : TSonobuoy_On_Board;
    FDevices            : TT3UnitContainer;
    FOnQuantityChange: TNotifyEvent;

    procedure SetOnQuantityChange(const Value: TNotifyEvent);
    function CreateProjectile: TT3Sonobuoy;
    procedure SetWeaponStatus(const Value: TWeaponStatus);
    procedure SetQuantity(const Value: integer);
    procedure SetDevices(const Value: TT3UnitContainer);
  public
    constructor Create; override;
    procedure Initialize; override;

    function GetSnapshotData : _SS_TT3SonobuoyOnVehicle ;
    procedure SetSnapshotData(const ss : _SS_TT3SonobuoyOnVehicle);

    function PrepareDrop : TT3Sonobuoy;

    property Devices : TT3UnitContainer read FDevices write SetDevices;
    property Quantity : integer read FQuantity write SetQuantity;
    property SonobuoyDefinition : TSonobuoy_On_Board read FSonobuoyDefinition;
    property WeaponStatus : TWeaponStatus read FWeaponStatus write SetWeaponStatus;
    property OnUpdateQuantity : TNotifyEvent read FOnUpdateQuantity write FOnUpdateQuantity;
    property OnQuantityChange: TNotifyEvent read FOnQuantityChange write
             SetOnQuantityChange;
  end;


implementation

uses
  uT3Common, uLibSettingTTT, uBaseCoordSystem,uDataModuleTTT,
  uDBAsset_Scripted, uFilter;

{ TT3SonobuoyOnVehicle }

constructor TT3SonobuoyOnVehicle.Create;
begin
  inherited;
end;

function TT3SonobuoyOnVehicle.CreateProjectile: TT3Sonobuoy;
var
  Sono  : TT3Sonobuoy;
begin
  Sono := TT3Sonobuoy.Create;

  Sono.Parent          := FParent;
  Sono.ParentIndex     := TT3PlatformInstance(FParent).InstanceIndex;
  Sono.Gambar          := True;
  Sono.UnitDefinition  := UnitDefinition;
  Sono.UnitGroup       := UnitGroup;
  Sono.Enable          := Enable;
  Sono.isInstructor    := TT3PlatformInstance(FParent).isInstructor;
  Sono.isWasdal        := TT3PlatformInstance(FParent).isWasdal;
  Sono.Force_Designation := TT3PlatformInstance(FParent).Force_Designation;
  Sono.PlatformType      := vhtSonobuoy;

  Sono.Initialize;
  result := Sono;
end;

procedure TT3SonobuoyOnVehicle.Initialize;
begin
  inherited;
//  if Assigned(FParent) then begin
//    FPosition.X := TT3PlatformInstance(FParent).getPositionX;
//    FPosition.Y := TT3PlatformInstance(FParent).getPositionY;
//    FPosition.Z := TT3PlatformInstance(FParent).getPositionZ;
//  end;

  if Assigned(UnitDefinition)then
    FSonobuoyDefinition := TSonobuoy_On_Board(UnitDefinition);

  if Assigned(FSonobuoyDefinition) then begin
    with FSonobuoyDefinition do begin
      InstanceName  := FData.Instance_Identifier;
      InstanceIndex := FData.Sonobuoy_Index;
      Quantity      := FData.Quantity;
    end;
  end;
end;

function TT3SonobuoyOnVehicle.PrepareDrop: TT3Sonobuoy;
var
  Sono : TT3Sonobuoy;
begin
  Result := nil;

  if not (Quantity > 0) then
    exit;

  Sono := CreateProjectile;
  result := Sono;

  Quantity := Quantity - 1;
end;

procedure TT3SonobuoyOnVehicle.SetDevices(const Value: TT3UnitContainer);
begin
  FDevices := Value;
end;

procedure TT3SonobuoyOnVehicle.SetOnQuantityChange(const Value: TNotifyEvent);
begin
  FOnQuantityChange := Value;
end;

procedure TT3SonobuoyOnVehicle.SetQuantity(const Value: integer);
begin
  FQuantity := Value;

  if Assigned(OnQuantityChange) then
    OnQuantityChange(Self);
end;

procedure TT3SonobuoyOnVehicle.SetWeaponStatus(const Value: TWeaponStatus);
begin
    if FWeaponStatus <> Value then
    TriggerListener(Self,psWeaponStatus,Byte(Value));

  FWeaponStatus := Value;
end;

function TT3SonobuoyOnVehicle.GetSnapshotData : _SS_TT3SonobuoyOnVehicle ;
var
  ss : _SS_TT3SonobuoyOnVehicle;
  I: Integer;
begin
  ss.S := TT3Sensor(Self).GetSnapshotData;
  with FSonobuoyDefinition do
  begin
    ss.FSonobuoyDefinition.FData := FData;
    ss.FSonobuoyDefinition.FDef  := FDef;
    ss.FSonobuoyDefinition.FPattern                 := FPattern;
    ss.FSonobuoyDefinition.FCategory                := FCategory;
    ss.FSonobuoyDefinition.FBlind_Zone.FData := FBlind_Zone.FData;

    ss.FSonobuoyDefinition.FVehicle.FData           := FVehicle.FData;
    ss.FSonobuoyDefinition.FVehicle.FPlatform_Ident := FVehicle.FPlatform_Ident;
    ss.FSonobuoyDefinition.FVehicle.FHeliLimitation := FVehicle.FHeliLimitation;

    ss.FSonobuoyDefinition.FNote                    := FNote ;

    if FBlind <> nil then
    begin
      SetLength(ss.FSonobuoyDefinition.FBlind, FBlind.Count);
      for I := 0 to FBlind.Count - 1 do
      begin
        ss.FSonobuoyDefinition.FBlind[i].FData := TBlind_Zone(FBlind[i]).FData ;
      end;
    end;
    if FPattern_Sonar <> nil then begin
       SetLength(ss.FSonobuoyDefinition.FPattern_Sonar,FPattern_Sonar.Count);
       for I := 0 to FPattern_Sonar.Count - 1 do begin
          ss.FSonobuoyDefinition.FPattern_Sonar[i].Event := TPattern_Sonar(FPattern_Sonar[i]).Event.FData ;
          ss.FSonobuoyDefinition.FPattern_Sonar[i].Pattern := TPattern_Sonar(FPattern_Sonar[i]).Pattern.FData ;
       end;
    end;
    if FScripted_sonar <> nil then begin
       SetLength(ss.FSonobuoyDefinition.FScripted_sonar,FScripted_sonar.Count);
       for I := 0 to FScripted_sonar.Count - 1 do begin
          ss.FSonobuoyDefinition.FScripted_sonar[i].Event := TScripted_Sonar(FScripted_sonar[i]).Event.FData ;
          ss.FSonobuoyDefinition.FScripted_sonar[i].Behav := TScripted_Sonar(FScripted_sonar[i]).Behav.FData ;
       end;
    end;
    if FPOD <> nil then begin
       SetLength(ss.FSonobuoyDefinition.FPOD,FPOD.Count);
       for I := 0 to FPOD.Count - 1 do begin
          ss.FSonobuoyDefinition.FPOD[i].FData := TPOD_vs_SNR_Point(FPOD[i]).FData ;
       end;
    end;
  end;

  ss.FQuantity := FQuantity;
  Result := ss;
end;

procedure TT3SonobuoyOnVehicle.SetSnapshotData(const ss : _SS_TT3SonobuoyOnVehicle);
begin
  TT3Sensor(Self).SetSnapshotData(ss.S);
  FSonobuoyDefinition.FVehicle.FData := ss.FSonobuoyDefinition.FVehicle.FData;
  FSonobuoyDefinition.FVehicle.FPlatform_Ident := ss.FSonobuoyDefinition.FVehicle.FPlatform_Ident;
  FSonobuoyDefinition.FVehicle.FHeliLimitation := ss.FSonobuoyDefinition.FVehicle.FHeliLimitation;
  FQuantity := ss.FQuantity;
end;

{ TT3Sonobuoy }

procedure TT3Sonobuoy.CalcMovement(aDeltaMs: double);
begin
  FCycleUpdateAltitude := FCycleUpdateAltitude + aDeltaMs;

  if FAltitudeState = mcsIncrease then
  begin
    if FMover.Z >= FOrderedAltitude then
    begin
      FMover.Z := FOrderedAltitude;
      FMover.Vertical_Accel := 0.0;
      FMover.VerticalSpeed  := 0.0;
      FMover.ClimbRate      := 0;
      FMover.DescentRate    := 0;
      FAltitudeState        := mcsStable;
    end
  end
  else if FAltitudeState = mcsDecrease then
  begin
    if FMover.Z <= FOrderedAltitude then
    begin
      FMover.Z := FOrderedAltitude;
      FMover.Vertical_Accel := 0.0;
      FMover.VerticalSpeed  := 0.0;
      FMover.ClimbRate      := 0;
      FMover.DescentRate    := 0;
      FAltitudeState := mcsStable;
    end;
  end
  else if FAltitudeState = mcsStable then
  begin
    FMover.Vertical_Accel := 0.0;
    FMover.ClimbRate      := 0;
    FMover.DescentRate    := 0;
    FMover.VerticalSpeed := 0.0;
  end;

  FMover.Move(aDeltaMs);
  FPosition.X := FMover.X;
  FPosition.Y := FMover.Y;
  FPosition.Z := FMover.Z;
end;

constructor TT3Sonobuoy.Create;
begin
  inherited;

  FMover          := T2DMover.Create;
  FMover.Enabled  := true;
  FPlatformDomain := 2;
  FLaunch         := false;
  FCycleUpdateAltitude := 0.05;
  PlatformDetectBySonobuoy := TList.Create;
end;

destructor TT3Sonobuoy.Destroy;
begin
  inherited;
  FTacticalSymbol.Free;
  FHalfTacticalSymbol.Free;
  FMover.Free;
end;

procedure TT3Sonobuoy.Draw(aCnv: TCanvas);
//var
//  aObject : TSimObject;
//  color   : TCOlor;
//  flag    : Integer;
begin
  inherited;

  if not (Visible and vFilter.Show(pftSubsurface, 'Sonobuoys', 'Tracks')) then
    Exit;

  FTacticalSymbol.isVehicle := false;
  FHalfTacticalSymbol.isVehicle := false;

  if FLaunch then
  begin
    FTacticalSymbol.SetTextVisibility(Visible);

//    if isInstructor then
//    begin
    FTacticalSymbol.CallSign1   := '+' + Track_ID;
    FHalfTacticalSymbol.CallSign1:= '+' + Track_ID;
//    end
//    else
//    begin
//      FTacticalSymbol.TextVisual.Text   := '+' + IntToStr(TrackNumber);
//      FHalfTacticalSymbol.TextVisual.Text:= '+' + IntToStr(TrackNumber);
//    end;

    if Gambar then
      FTacticalSymbol.Draw(aCnv)
    else
      FHalfTacticalSymbol.Draw(aCnv);

    FTacticalSymbol.SetTextColor(FTacticalSymbol.Color);
    FHalfTacticalSymbol.SetTextColor( FHALFTacticalSymbol.Color );

    FSignPlatform.Visible := Visible;
    FSignPlatform.Color := FTacticalSymbol.Color;
    FSignPlatform.Draw(aCnv);
  end;
end;

function TT3Sonobuoy.getAltitude: single;
begin
  Result := FMover.Z * C_Degree_To_NauticalMile * C_NauticalMile_To_Metre;
end;

function TT3Sonobuoy.GetSnapshotData: _SS_TT3Sonobuoy;
var
  ss : _SS_TT3Sonobuoy;
begin
  ss.P := TT3PlatformInstance(Self).GetSnapshotData;

  if Parent<>nil then
    ss.ParentPlatformID := TT3Unit(Parent).InstanceIndex;
  if Owner <> nil then
    ss.ParentPlatformID := TT3Unit(Owner).InstanceIndex;

  ss.SonobuoyOnVehicleID := SonobuoyID;
  ss.SonobuoyMode := Byte(ControlMode);
  ss.Depth := OrderDepth;
  Result := ss;
end;

procedure TT3Sonobuoy.SetSnapshotData(const ss: _SS_TT3Sonobuoy);
begin
  TT3PlatformInstance(Self).SetSnapshotData(ss.P);

  ControlMode := TSonarControlMode(ss.SonobuoyMode);
  OrderDepth := ss.Depth;
end;

procedure TT3Sonobuoy.setSonobuoyID(const Value: Integer);
begin
  FSonobuoyID := Value;
end;

procedure TT3Sonobuoy.Initialize;
var
  color   : TCOlor;
  symbol  : string;
  sonarIdx : Integer;
begin
  inherited;

  if not (Assigned(FParent)) then
    Exit;

  FMover.X := FParent.getPositionX;
  FMover.Y := FParent.getPositionY;
  FMover.Z := FParent.getPositionZ;

  FPosition.X     := FMover.X;
  FPosition.y     := FMover.Y;
  FPosition.Z     := FMover.Z;

  FHomePositionY  := FParent.getPositionY;
  FHomePositionX  := FParent.getPositionX;
  FHomePositionZ  := FParent.getPositionZ;

  FMover.Enabled  := true;
  FAltitudeState  := mcsIncrease;

  FSonobuoyDefinition := TSonobuoy_On_Board(UnitDefinition);

  FPlatformDomain := 2;
  VerticalSpeed   := 1;
  FMover.VerticalSpeed := -20;
  FMover.DescentRate := -20;

  if isInstructor then
     symbol := getCorrectSymbol(TT3PlatformInstance(Parent).PlatformDomain,
              TT3PlatformInstance(Parent).PlatformType,
              TT3PlatformInstance(Parent).Force_Designation, color)
  else
    symbol := getCorrectSymbol(FPlatformDomain, PlatformType, 3, color);


  FSignPlatform         := TTextVisual.Create;

  FTacticalSymbol       := TTacticalSymbol.Create;
  FTacticalSymbol.Color := color;
//  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'SonoMonitorCtrl.bmp',color);
  FTacticalSymbol.SymbolVisual.FontName := 'atct';
  FTacticalSymbol.SymbolVisual.CharSymbol := ';';

  FHalfTacticalSymbol       := TTacticalSymbol.Create;
  FHalfTacticalSymbol.Color := color;
  FHalfTacticalSymbol.SymbolVisual.FontName := 'atct';
  FHalfTacticalSymbol.SymbolVisual.CharSymbol := '''';

//  FHalfTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'SonoMonitorOther.bmp',color);

  if Assigned(FSonobuoyDefinition) then begin
    with FSonobuoyDefinition do
    begin
      InstanceName  := FData.Instance_Identifier;
      InstanceIndex := FData.Sonobuoy_Index;
      FEndurance    := FDef.Endurance_Time;
      sonarIdx      := FSonar.FDef.Sonar_Index;

      FRangeActive := dmTTT.getActiveRange(Round(sonarIdx));
      FRangePassive := dmTTT.getPassiveRange(Round(sonarIdx));
      FRangeSonobuoy := dmTTT.getMaxRange(Round(sonarIdx));

    end;
  end;

  parentSonobuoy := nil;
  FDetectSonoPassive := False;
  FDetect2SonoPassive := False;
  FDetect3SonoPassive := False;
  TargetSonoPassive := nil;
  FScanInterval := 0;
end;

procedure TT3Sonobuoy.Launch;
begin
  if FLaunch then
    exit;

  FLaunch := true;

  FMover.VerticalSpeed := 5000;
  FMover.Direction := 0.0;
  FMover.Speed := 0.5;
  Self.SetAltitude(0);

  if Assigned(OnLaunched) then
    OnLaunched(Self);
end;

procedure TT3Sonobuoy.Move(const aDeltaMs: double);
//var
//  altitude: double;
begin
  inherited;

  if FLaunch then
  begin
    FScanInterval := (FScanInterval + 1) mod 5;

    if FScanInterval = 0  then
      SonoBoyProses;

    SetOrderedAltitude(OrderDepth);
    CalcMovement(aDeltaMs);
  end;

end;

procedure TT3Sonobuoy.RepositionTo(const x, y: double);
begin
  inherited;

  FMover.X := X;
  FMover.Y := Y;
end;

procedure TT3Sonobuoy.SetAltitude(const Value: single);
begin
  inherited;
  FMover.Z := Value/(C_Degree_To_NauticalMile * C_NauticalMile_To_Metre);
end;

procedure TT3Sonobuoy.SetInstructor(const Value: boolean);
begin
  FIsInstructor := Value;

  Initialize;
end;

procedure TT3Sonobuoy.SetIsWasdal(const Value: Boolean);
begin
  FIsWasdal := Value;

  Initialize;

end;

procedure TT3Sonobuoy.SetOrderedAltitude(const Value: double);
var
  dH: double;
begin
  FOrderedAltitude  := Value/ (C_NauticalMile_To_Metre * C_Degree_To_NauticalMile) ;
  dH                := (FOrderedAltitude - FMover.Z);

  if abs(dH) < 0.000000000001  then
  begin
    FAltitudeState := mcsStable;
    FMover.Vertical_Accel := 0;
  end
  else
  begin
    if FOrderedAltitude > FMover.Z then begin
      FMover.ClimbRate      := 150;
      FMover.Vertical_Accel := 150;
      FAltitudeState        := mcsIncrease;
    end
    else begin
      FMover.DescentRate    := 150;
      FMover.Vertical_Accel := - Abs(150);
      FAltitudeState        := mcsDecrease;
    end;
  end;
end;

procedure TT3Sonobuoy.SetOwner(const Value: TSimObject);
begin
  FOwner := Value;
end;

procedure TT3Sonobuoy.setPositionX(const v: double);
begin
  inherited;
  FMover.X := v;
end;

procedure TT3Sonobuoy.setPositionY(const v: double);
begin
  inherited;
  FMover.Y := v;
end;

procedure TT3Sonobuoy.setPositionZ(const v: double);
begin
  inherited;
  FMover.Z := v;
end;

procedure TT3Sonobuoy.SetControlMode(const value: TSonarControlMode);
begin
  FControlMode := value;
end;

procedure TT3Sonobuoy.SonoBoyProses;
var
  i, j, k, totDetectbySonobuoy : integer;
  pfObject : TT3PlatformInstance;
  isInRangeSonobuoy, isSon : Boolean;
  range : double;
  PfSonobuoy,SonobuoyDetectTarget : TT3Sonobuoy;
begin
  isSon := False;
  SonobuoyList.Clear;

  for I := 0 to SimPlatforms.itemCount-1 do
  begin
    pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));

    if Assigned(TT3Sonobuoy(self).PlatformDetectBySonobuoy) then
      TT3Sonobuoy(self).PlatformDetectBySonobuoy.Clear;

    if pfObject.InstanceIndex = ParentIndex then
    begin
      parentSonobuoy := pfObject;
      if Assigned(pfObject.SonobuoyList) then
      begin

        for j := 0 to pfObject.SonobuoyList.Count - 1 do
        begin
          if (pfObject.SonobuoyList.Items[j]) = Self then
          begin
            isSon := True;
            Break;
          end;

        end;
        if not isSon then
          parentSonobuoy.SonobuoyList.Add(Self);
      end
      else
        parentSonobuoy.SonobuoyList.Add(Self);
    end;
  end;

  for I := 0 to SimPlatforms.itemCount-1 do
  begin
    pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));

    if pfObject.InstanceIndex = ParentIndex then
    begin
      continue;
    end;

    range   := CalcRange(FPosition.X,FPosition.Y,
             pfObject.getPositionX,pfObject.getPositionY);

    isInRangeSonobuoy := range <= FRangeSonobuoy;

    if isInRangeSonobuoy then
    TT3Sonobuoy(self).PlatformDetectBySonobuoy.Add(pfObject);

  end;

  for I := 0 to SimPlatforms.itemCount-1 do
  begin
    totDetectbySonobuoy := 0;
    SonobuoyDetectTarget := nil;
    pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
    for  j := 0 to parentSonobuoy.SonobuoyList.Count - 1 do
    begin
      if pfObject.PlatformDomain = 0 then
        continue;

      PfSonobuoy := TT3Sonobuoy(parentSonobuoy.SonobuoyList.Items[j]);
      range  := CalcRange(PfSonobuoy.getPositionX,PfSonobuoy.getPositionY,
                   parentSonobuoy.getPositionX,parentSonobuoy.getPositionY);
      if range <= 35 then
      begin
        for k :=0 to PfSonobuoy.PlatformDetectBySonobuoy.Count - 1 do
        begin
          if pfObject = PfSonobuoy.PlatformDetectBySonobuoy.Items[k] then
          begin
            if TT3Sonobuoy(PfSonobuoy).ControlMode = scmPassive then
            begin
              totDetectbySonobuoy := totDetectbySonobuoy + 1;
              SonobuoyDetectTarget := TT3Sonobuoy(PfSonobuoy);
            end
          end;
        end;
      end;
    end;

    if not (pfObject is TT3Vehicle) then
      exit;

    if totDetectbySonobuoy = 1 then
    begin
      if Assigned(OnSonobuoyPassiveDetect) then
       OnSonobuoyPassiveDetect(SonobuoyDetectTarget, pfObject, 1);
    end
    else if totDetectbySonobuoy = 2 then
    begin
      if Assigned(OnSonobuoyPassiveDetect) then
       OnSonobuoyPassiveDetect(SonobuoyDetectTarget, pfObject, 2);
    end
    else if totDetectbySonobuoy >= 3  then
    begin
      if Assigned(OnSonobuoyPassiveDetect) then
       OnSonobuoyPassiveDetect(SonobuoyDetectTarget, pfObject, 3);
    end
    else
    begin
      if Assigned(OnSonobuoyPassiveDetect) then
       OnSonobuoyPassiveDetect(SonobuoyDetectTarget, pfObject, 0);
    end;
  end;
end;

procedure TT3Sonobuoy.UpdateVisual;
var
  X,Y : integer;
begin
  inherited;
  if not FLaunch then begin
    Converter.ConvertToScreen(FPosition.X, FPosition.Y,X,Y);
  end else begin
    Converter.ConvertToScreen(FMover.X, FMover.Y, X, Y);
  end;

  FTacticalSymbol.Center := Point(X, Y);
  FTacticalSymbol.SpeedVector.Course := ConvCartesian_To_Compass(FMover.Direction);
  FTacticalSymbol.ConvertCoord(Converter);

  FHalfTacticalSymbol.Center := Point(X, Y);
  FHalfTacticalSymbol.SpeedVector.Course := ConvCartesian_To_Compass(FMover.Direction);
  FHalfTacticalSymbol.ConvertCoord(Converter);
end;

end.
