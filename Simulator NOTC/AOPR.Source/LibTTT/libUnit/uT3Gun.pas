unit uT3Gun;

interface

uses uT3Weapon, uDBAsset_Weapon, tttData, uObjectVisuals,
  uDBBlind_Zone, Classes, SysUtils, uGameData_TTT, uT3Listener,
  uSimObjects, uT3UnitContainer, uDBAssetObject, uSnapshotData;

type

  TT3GunPOH = class
  private
    FAirTargetPOH     : TList;
    FSurfaceTargetPOH : TList;
    FMinPOHRangeAir, FMaxPOHRangeAir,
    FMinPOHRangeSurf : double;

    procedure Sort;
  protected
  public
    constructor Create(poh : TList);  // list of TRecGun_POH_vs_Range
    destructor 	Destroy; override;

    function CalcPOH(range :  double;targetType : integer) : boolean;
    function GetSnapshotData : _SS_TT3GunPOH ;
    procedure SetSnapshotData(const ss : _SS_TT3GunPOH);
  end;

  TT3GunShoot = class(TT3Weapon)
  private
    FPOH      	   : TT3GunPOH;
    FPOHResult	   : Byte;
	  FGunDefinition : TGun_Definition;
    FGunOnVehicleID: Integer;
    FShipName      : string; // untuk mengambil yg menembakkan gun
  public
    NGSPosX          : double;
    NGSPosY          : double;
    NGSPosZ          : double;
    NGSSpotLine      : double;
    NGSGunLine       : double;
    NGSFlashX        : double;
    NGSFlashY        : double;

    function  Shoot : Byte; overload;
    procedure Shoot(poh : byte);overload;
    procedure setPOH(poh : TT3GunPOH);
    property  POHResult : Byte read FPOHResult;
    property  GunOnVehicleID : Integer read FGunOnVehicleID write FGunOnVehicleID;
    property  ShipName  : string read FShipName write FShipName;

    function GetSnapshotData : _SS_TT3GunShoot ;
    procedure SetSnapshotData(const ss : _SS_TT3GunShoot);
  end;

  TT3GunOnVehicle = class(TT3Weapon)
  private
    FGunDefinition    : TGun_Definition;
    FOnSetSalvo       : TOnWeaponSetSalvo;
    FQuantity         : integer;
    FSalvoSize        : integer;
    FSalvoMode        : integer;
    FGunPOH           : TT3GunPOH;
    //FAssigned         : boolean;

    FOnGunFire        : TNotifyEvent;
    FOnGunCeaseFire   : TNotifyEvent;
    FOnUpdateQuantity : TNotifyEvent;
    FOnSetCaseFire    : TNotifyEvent;
    FState            : Integer;
    FDelay            : Double;
    FThresholdSpeed   : double;
    FInterceptRange   : double;

    FChaffBloom       : integer;
    FChaffPosX        : double;
    FChaffPosY        : double;
    FChaffType        : double;

    FNGSPosX          : double;
    FNGSPosY          : double;
    FNGSPosZ          : double;
    FNGSSpotLine      : double;
    FNGSGunLine       : double;

    //---- correction NGS (satuanmya NauticalMile)
    FOptRangeCorr     : double;    //DA
    FOptDefCorr       : double;    //LR
    FNGSCorrMode      : Integer;   //(0 = normal) (1 = -), (2 = +)

    FNGSFlashX        : double;
    FNGSFlashY        : double;
    FNGSBearing: Double;
    FNGSElevation: Double;
    //--------------------

    FVBSAzimuth       : Double;
    FVBSElevation     : Double;

    {$IFDEF SERVER}
    FCounter          : double;
    FSalvoCounter     : integer;


    function  CalcHitSomething : Boolean; //cwis
    {$ENDIF}

    procedure SetQuantity(const Value: integer);
    procedure SetOnSetSalvo(const Value: TOnWeaponSetSalvo);
    procedure SetSalvoSize(const Value: integer);
    function  CreateProjectiles: TT3GunShoot;
    procedure SetSalvoMode(const Value: integer);
    procedure SetInterceptRange(const Value: double);
    procedure SetThresholdSpeed(const Value: double);
    procedure SetChaffBloom(const Value: integer);
    procedure SetChaffType(const Value: double);

    procedure SetNGSBearing(const Value: Double);
    procedure SetNGSElevation(const Value: Double); protected
    function  getMountType: integer; override;
    procedure SetTargetObject(const Value: TSimObject);override;
    procedure SetControlMode(const Value: integer); override;
  public
    isToTarget : Boolean;
    TargetName : string;

    constructor Create; override;
    destructor  Destroy; override;

    function  GetSnapshotData : _SS_GunOnVehicle ;
    procedure SetSnapshotData(const ss : _SS_GunOnVehicle);

    function  PrepareShoot : TT3GunShoot;
    function  InsideBlindZone(aObject : TSimObject) : boolean; override;
    function  InsideBlindZonePos(X, Y : Double) : boolean; override;

    procedure Initialize; override;
    procedure UpdateVisual; override;

    procedure SetAssigned(const value : Boolean); override;
    procedure SetOnGunFire(const value : TNotifyEvent);
    procedure SetOnGunCeaseFire(const value : TNotifyEvent);
    procedure SetState(const value : Integer);
    procedure SetChaffPosition(const ValueX, ValueY: double);

    procedure setNGSPositionX(const Value: double);
    procedure setNGSPositionY(const Value: double);
    procedure setNGSPositionZ(const Value: double);
    procedure setNGSSpotLine(const Value: double);
    procedure setNGSGunLine(const Value: double);

    //---- correction NGS
    procedure SetOptRangeCorr (const Value: double);
    procedure SetOptDefCorr (const Value: double);
    procedure SetNGSCorrMode(const Value: Integer);
    procedure SetNGSFlashX(const Value: double);
    procedure SetNGSFlashY(const Value: double);
    //-------------------

    procedure Move(const aDeltaMs: double); override;
    procedure CeaseFire;

    property Quantity : integer read FQuantity write SetQuantity;
    property SalvoSize : integer read FSalvoSize write SetSalvoSize;
    property OnSetSalvo : TOnWeaponSetSalvo read FOnSetSalvo write SetOnSetSalvo;
    property GunDefinition : TGun_Definition read FGunDefinition;
    property SalvoMode : integer read FSalvoMode write SetSalvoMode;
    property OnGunFire : TNotifyEvent read FOnGunFire write SetOnGunFire;
    property OnGunCeaseFire : TNotifyEvent read FOnGunCeaseFire write SetOnGunCeaseFire;
    property OnUpdateQuantity : TNotifyEvent read FOnUpdateQuantity write FOnUpdateQuantity;
    property OnSetCaseFire : TNotifyEvent read FOnSetCaseFire write FOnSetCaseFire;
    //property IsAssigned : boolean read FAssigned write SetAssigned;
    property State : Integer read FState write SetState;

    property InterceptRange  : double read FInterceptRange write SetInterceptRange;
    property ThresholdSpeed  : double read FThresholdSpeed write SetThresholdSpeed;

    property ChaffBloom   :integer read FChaffBloom write SetChaffBloom;
    property ChaffType    :double read FChaffType write SetChaffType;
    property ChaffPosX    :double read FChaffPosX;
    property ChaffPosY    :double read FChaffPosY;

    property NGSPosX      :double read FNGSPosX write setNGSPositionX;
    property NGSPosY      :double read FNGSPosY write setNGSPositionY;
    property NGSPosZ      :double read FNGSPosZ write setNGSPositionZ;
    property NGSSpotLine  :double read FNGSSpotLine write setNGSSpotLine;
    property NGSGunLine   :double read FNGSGunLine write setNGSGunLine;
    property NGSBearing   :Double read FNGSBearing write SetNGSBearing;
    property NGSElevation :Double read FNGSElevation write SetNGSElevation;

    //---- correction NGS
    property OptRangeCorr : double read FOptRangeCorr write SetOptRangeCorr;
    property OptDefCorr : double read FOptDefCorr write SetOptDefCorr;
    property NGSCorrMode : Integer read FNGSCorrMode write SetNGSCorrMode;
    property NGSFlashX : double read FNGSFlashX write SetNGSFlashX;
    property NGSFlashY : double read FNGSFlashY write SetNGSFlashY;
    //-------------------

    property VBSAzimuth : Double read FVBSAzimuth write FVBSAzimuth;
    property VBSElevation : Double read FVBSElevation write FVBSElevation;
  end;

implementation

uses uT3Vehicle, uT3Unit, uBaseCoordSystem, uT3SimManager, uT3Missile, Math;

{ TT3Gun }

{$IFDEF SERVER}
function TT3GunOnVehicle.CalcHitSomething: Boolean;
var
  i  : integer;
  vh, pl : TT3PlatformInstance;
  tgtRange : double;
begin
  Result := False;

  for I := 0 to FSimPlatforms.itemCount - 1 do
  begin
    pl := FSimPlatforms.getObject(I) as TT3PlatformInstance;
    if not(Assigned(pl)) then
      Continue;

    { Jk obyek werk diabaikan }
    if pl.Dormant or FreeMe then
      Continue;

    if not(Assigned(Parent)) then
      Continue;

    vh := parent as TT3PlatformInstance;
    {jika parent abaikan}
    if pl = vh then continue;

    tgtRange := CalcRange(vh.getPositionX,vh.getPositionY,
                pl.getPositionX, pl.getPositionY);

    if not(pl is TT3Missile) then
      Continue;

    if ((tgtRange) < FGunDefinition.FData.Max_Range) then
    begin
      Self.TargetObject := pl;
      Self.FState := 1;

      Result := True;

      Break;
    end;
  end;
end;
{$ENDIF}

procedure TT3GunOnVehicle.CeaseFire;
begin
  TriggerListener(Self, psCeaseFire, true);

  if FQuantity <= 0 then
    WeaponStatus  := wsUnavailable
  else
  begin
    if WeaponStatus <> wsDamaged then
      WeaponStatus  := wsAvailable;
  end;
end;

constructor TT3GunOnVehicle.Create;
begin
  inherited;
  FSalvoSize := 1;
  FSalvoMode := 2;
  //FControlMode := 1;

  FInterceptRange := 0.00;
  FThresholdSpeed  := 0.00;
end;

procedure TT3GunOnVehicle.SetChaffBloom(const Value: integer);
begin
  FChaffBloom := Value;
  TriggerListener(Self, pschaffBloom, Value);
end;

procedure TT3GunOnVehicle.SetChaffPosition(const ValueX, ValueY: double);
begin
  FChaffPosX := ValueX;
  FChaffPosY := ValueY;
end;

procedure TT3GunOnVehicle.SetChaffType(const Value: double);
begin
  FChaffType := Value;
end;

procedure TT3GunOnVehicle.SetControlMode(const Value: integer);
begin
  FControlMode := Value;
  TriggerListener(Self,psControlMode,Value);
end;

procedure TT3GunOnVehicle.SetInterceptRange(const Value: double);
begin
  FInterceptRange := Value;
  TriggerListener(Self,psInterceptRgn,Value);
end;

procedure TT3GunOnVehicle.SetNGSBearing(const Value: Double);
begin
  FNGSBearing := Value;
end;

procedure TT3GunOnVehicle.SetNGSCorrMode(const Value: Integer);
begin
  FNGSCorrMode := Value;
end;

procedure TT3GunOnVehicle.SetNGSElevation(const Value: Double);
begin
  FNGSElevation := Value;
end;

procedure TT3GunOnVehicle.SetNGSFlashX(const Value: double);
begin
  FNGSFlashX := Value;
end;

procedure TT3GunOnVehicle.SetNGSFlashY(const Value: double);
begin
  FNGSFlashY := Value;
end;

procedure TT3GunOnVehicle.setNGSGunLine(const Value: double);
begin
  FNGSGunLine := Value;
end;

procedure TT3GunOnVehicle.setNGSPositionX(const Value: double);
begin
  FNGSPosX := Value;
end;

procedure TT3GunOnVehicle.setNGSPositionY(const Value: double);
begin
  FNGSPosY := Value;
end;

procedure TT3GunOnVehicle.setNGSPositionZ(const Value: double);
begin
  FNGSPosZ := Value;
end;

procedure TT3GunOnVehicle.setNGSSpotLine(const Value: double);
begin
  FNGSSpotLine := Value;
end;

procedure TT3GunOnVehicle.SetOnSetSalvo(const Value: TOnWeaponSetSalvo);
begin
  FOnSetSalvo := Value;
end;

procedure TT3GunOnVehicle.SetOptDefCorr(const Value: double);
begin
  FOptDefCorr := Value;
  TriggerListener(Self, psNGScorrectLR, Value);
end;

procedure TT3GunOnVehicle.SetOptRangeCorr(const Value: double);
begin
  FOptRangeCorr := Value;
  TriggerListener(Self,psNGScorrectDA,Value);
end;

procedure TT3GunOnVehicle.SetQuantity(const Value: integer);
begin
  if Value <= 0 then
  begin
    if (WeaponStatus = wsAvailable) or (WeaponStatus = wsFiring) then
    begin
      FQuantity     := 0;
    end;
  end
  else
  begin
    if WeaponStatus <> wsDamaged then
    begin
      FQuantity     := Value;
    end;
  end;

  TriggerListener(Self, psQuantity, Value);

  {if Assigned(OnUpdateQuantity) then
  begin
    OnUpdateQuantity(Self);
  end;}
end;

procedure TT3GunOnVehicle.SetSalvoMode(const Value: integer);
begin
  FSalvoMode := Value;
  TriggerListener(Self, psSalvoMode, Value);
end;

procedure TT3GunOnVehicle.SetSalvoSize(const Value: integer);
begin
  FSalvoSize := Value;
  TriggerListener(Self, psSalvoSize, Value);
end;

procedure TT3GunOnVehicle.SetAssigned(const value : Boolean);
begin
  inherited;

  TriggerListener(Self, psAssigned, Value);
end;

procedure TT3GunOnVehicle.SetOnGunFire(const value : TNotifyEvent);
begin
  FOnGunFire := value;
end;

procedure TT3GunOnVehicle.SetOnGunCeaseFire(const value : TNotifyEvent);
begin
  FOnGunCeaseFire := value;
end;

procedure TT3GunOnVehicle.SetState(const value : Integer);
begin
  FState := value;
end;

procedure TT3GunOnVehicle.SetTargetObject(const Value: TSimObject);
begin
  inherited;

  if not Assigned(Value) then
    exit;

  TriggerListener(Self, psSetTarget, TT3Unit(Value).InstanceIndex);
end;

procedure TT3GunOnVehicle.SetThresholdSpeed(const Value: double);
begin
  FThresholdSpeed := Value;
  TriggerListener(Self,psThresSpeed,Value);
end;

procedure TT3GunOnVehicle.UpdateVisual;
begin
  inherited;

  if not Assigned(Parent) then exit;

  FPosition.X := Parent.getPositionX;
  FPosition.Y := Parent.getPositionY;
  FPosition.Z := Parent.getPositionZ;
end;

procedure TT3GunOnVehicle.Move(const aDeltaMs: double);
{$IFDEF SERVER}
var
  isInsideBlindzoneGun : Boolean; //test
  tgtRange : double;
{$ENDIF}
begin
  inherited;

  FPosition.X := FParent.getPositionX;
  FPosition.Y := FParent.getPositionY;

  // 1. cek parent freeme
  if Assigned(Parent) then
  begin
    if (TT3PlatformInstance(parent).Dormant or parent.FreeMe) then
    begin
      {$IFDEF SERVER}
      if Assigned(FOnGunCeaseFire) and (WeaponStatus = wsFiring) then
      begin
        FOnGunCeaseFire(Self);

        FState := 0;
        CeaseFire;

        {if Assigned(OnLogEventStr) then
        OnLogEventStr(InstanceName + ' stop launch gun');}

        exit;
      end;
      {$ENDIF}

      if IsAssigned then IsAssigned := False;

      if ControlMode <> 4 then
      begin
        if Assigned(TargetObject) then
        begin
          if TargetObject.IsAssigned then
            TargetObject.IsAssigned := False;

          TargetObject := nil;
        end;
      end;

      Exit;
    end;
  end;

  // 2. cek target freeme
  if ControlMode <> 4 then
  begin
    if Assigned(TargetObject) then
    begin
      if (TT3PlatformInstance(TargetObject).Dormant) or (TargetObject.FreeMe) then
      begin
        {$IFDEF SERVER}
        if Assigned(FOnGunCeaseFire) and (WeaponStatus = wsFiring) then
        begin
          FOnGunCeaseFire(Self);

          FState := 0;
          CeaseFire;

          {if Assigned(OnLogEventStr) then
          OnLogEventStr(InstanceName + ' stop launch gun');}

          exit;
        end;
        {$ENDIF}

        if IsAssigned then IsAssigned := False;

        if TargetObject.IsAssigned then
          TargetObject.IsAssigned := False;

        TargetObject := nil;
      end;
    end;
  end;

  {$IFDEF SERVER}
  if Quantity <= 0 then
    Exit;

  // 3. cek out of range atau blindzone
  if Assigned(TargetObject) then
  begin
    // jika target diluar range
    tgtRange := CalcRange(Parent.getPositionX, Parent.getPositionY,
            TargetObject.getPositionX, TargetObject.getPositionY);
    isInsideBlindzoneGun := InsideBlindZone(TargetObject);

    if ((tgtRange) > FGunDefinition.FData.Max_Range) or isInsideBlindzoneGun then
    begin
      if Assigned(FOnGunCeaseFire) and (WeaponStatus = wsFiring) then
      begin
        FOnGunCeaseFire(Self);

        FState := 0;
        CeaseFire;

        {if Assigned(OnLogEventStr) then
        OnLogEventStr(InstanceName + ' stop launch gun');}

        exit;
      end;
    end;
  end
  else if ControlMode = 4 then
  begin
    // jika target diluar range
    tgtRange := CalcRange(Parent.getPositionX, Parent.getPositionY, NGSFlashX, NGSFlashY);
    isInsideBlindzoneGun := InsideBlindZonePos(NGSFlashX, NGSFlashY);

    if ((tgtRange) > FGunDefinition.FData.Max_Range) or isInsideBlindzoneGun then
    begin
      if Assigned(FOnGunCeaseFire) and (WeaponStatus = wsFiring) then
      begin
        FOnGunCeaseFire(Self);

        FState := 0;
        CeaseFire;

        {if Assigned(OnLogEventStr) then
        OnLogEventStr(InstanceName + ' stop launch gun');}

        exit;
      end;
    end;
  end;

  // 4. Fire gun
  if (FWeaponCategory = wcGunCIWS) and (ControlMode = 1) then
  // 4.1 Automatic
  begin
    // jika target dormant atau hancur
    if not Assigned(TargetObject) or (TT3PlatformInstance(TargetObject).Dormant)
      or (TargetObject.FreeMe) then
    begin
      if Assigned(FOnGunCeaseFire) and (WeaponStatus = wsFiring) then
      begin
        FOnGunCeaseFire(Self); //test

        FState := 0;
        CeaseFire;

        {if Assigned(OnLogEventStr) then
          OnLogEventStr(InstanceName + ' stop launch gun');}

        exit;
      end;
    end;

    FCounter := FCounter + aDeltaMs;
    if FCounter >= FDelay then
    begin
      if CalcHitSomething then
      begin
        WeaponStatus := wsFiring;

        if Assigned(FOnGunFire) then
        begin
          FOnGunFire(Self);
        end;
      end;
    end;

    if Quantity <= 0 then      //jika peluru sudah abis
    begin
      if Assigned(FOnGunCeaseFire) and (WeaponStatus = wsFiring) then
      begin
        FOnGunCeaseFire(Self);

        FState := 0;
        CeaseFire;

        {if Assigned(OnLogEventStr) then
          OnLogEventStr(InstanceName + ' stop launch gun');}
      end;
    end;

    if FCounter > FDelay then
      FCounter := 0;
  end
  else
  // 4.2 Manual
  begin
    if FState = 0 then
    begin
      Exit;
    end;

    if ControlMode <> 4 then
    begin
      // jika target dormant atau hancur
      if not Assigned(TargetObject) or (TT3PlatformInstance(TargetObject).Dormant)
        or (TargetObject.FreeMe) then
      begin
        if Assigned(FOnGunCeaseFire) and (WeaponStatus = wsFiring) then
        begin
          FOnGunCeaseFire(Self);

          FState := 0;
          CeaseFire;

          {if Assigned(OnLogEventStr) then
            OnLogEventStr(InstanceName + ' stop launch gun'); }

          exit;
        end;
      end;
    end;

    case SalvoMode of
      1: //continuous
        begin
          FCounter := FCounter + aDeltaMs;
          if FCounter >= FDelay then
          begin
            WeaponStatus := wsFiring;
            if Assigned(FOnGunFire) then
            begin
              FOnGunFire(Self);
            end;
          end;

          if (Quantity <= 0) then      //jika peluru sudah abis
          begin
            if Assigned(FOnGunCeaseFire) and (WeaponStatus = wsFiring) then
            begin
              FOnGunCeaseFire(Self);

              FState := 0;
              CeaseFire;

              {if Assigned(OnLogEventStr) then
                OnLogEventStr(InstanceName + ' stop launch gun'); }
            end;
          end;

          if FCounter > FDelay then
            FCounter := 0;
        end;
      2 : //based on salvosize
        begin
          FCounter := FCounter + aDeltaMs;
          if FCounter > FDelay then
          begin
            WeaponStatus := wsFiring;

            if Assigned(FOnGunFire) then
            begin
              FOnGunFire(Self);
            end;

            Inc(FSalvoCounter);
          end;

          if FSalvoCounter >= FSalvoSize then      //jika salvocounter sudah sama dengan salvo size
          begin
            if Assigned(FOnGunCeaseFire) and (WeaponStatus = wsFiring) then
            begin
              FOnGunCeaseFire(Self);

              FState := 0;
              CeaseFire;

              {if Assigned(OnLogEventStr) then
                OnLogEventStr(InstanceName + ' stop launch gun');}

              FSalvoCounter := 0;
            end;
          end;

          if FCounter > FDelay then
            FCounter := 0;
        end;
    end;
  end;
  {$ENDIF}
end;

procedure TT3GunOnVehicle.Initialize;
var
  blindZ : TBlindZoneVisual;
  i : integer;
begin
  inherited;

  if Assigned(UnitDefinition) then
    FGunDefinition := TGun_Definition(UnitDefinition);

  if Assigned(FGunDefinition) then begin
    if Self.FGunDefinition.FData.Rate_of_Fire <> 0 then
      FDelay := (60 / (Self.FGunDefinition.FData.Rate_of_Fire))  //mk
    else
      FDelay := 1;

    with FGunDefinition do
    begin
      Lethality := FData.Lethality_per_Round;
      FWeaponCategory := TWeapoonCategory(FData.Gun_Category);

//      case FData.Gun_Category of
//        1 : FWeaponCategory := wcGunCIWS;
//        2 : FWeaponCategory := wcGunGun;
//        4 : FWeaponCategory := wcGunRocket;
//      end;

      InstanceName      := FGunDefinition.FPoint.FData.Instance_Identifier;
      InstanceIndex     := FGunDefinition.FPoint.FData.Point_Effect_Index;
      //InstanceIndex     := FGunDefinition.FData.Gun_Index;  {change point indext biar unik}
      Quantity          := FPoint.FData.Quantity;
      WeaponRange       := FData.Max_Range;
      FGunPOH           := TT3GunPOH.Create(FPOH);
    end;

    if FGunDefinition.FBlind.Count > 0 then begin
      SetLength(BZStartAngle,FGunDefinition.FBlind.Count);
      SetLength(BZEndAngle,FGunDefinition.FBlind.Count);

      for i := 0 to FGunDefinition.FBlind.Count - 1 do begin
        blindz := TBlindZoneVisual.Create;
        BZStartAngle[i] := TBlind_Zone(FGunDefinition.FBlind.Items[i]).FData.Start_Angle;
        BZEndAngle[i]   := TBlind_Zone(FGunDefinition.FBlind.Items[i]).FData.End_Angle;
        blindZ.StartAngle := BZStartAngle[i];
        blindZ.EndAngle   := BZEndAngle[i];
        FBlindView.Add(blindZ);
      end;
    end;

    // update rel start start-end angle
    for I := 0 to FBlindView.Count - 1 do begin
      blindZ := TBlindZoneVisual(FBlindView.Items[i]);
      blindZ.Ranges := WeaponRange;

      if Assigned(FParent) then begin
        blindZ.Heading:= TT3PlatformInstance(FParent).Course;
        blindZ.mX     := FParent.getPositionX;
        blindZ.mY     := FParent.getPositionY;
      end;

      blindZ.UpdateRelatifAngle;
    end;
  end;

  FChaffBloom := 0;
  FChaffPosX  := 0;
  FChaffPosY  := 0;
  FChaffType  := 0;

  //--------NGS--------------
  FNGSPosX    := 0;
  FNGSPosY    := 0;
  FNGSPosZ    := 0;
  FNGSSpotLine:= 0;
  FNGSGunLine := 0;
  FNGSBearing := 0;
  FNGSElevation := 0;
  FNGSCorrMode := 0;
  FOptRangeCorr := 0;

  //------NGS CORRECTIONS----
  FNGSCorrMode:= 0;  //0(normal),1(-),2(+)
  FOptRangeCorr:=0;
  FOptDefCorr := 0;

  //-------NGS System Erorr---
  FNGSFlashX  := 0;
  FNGSFlashY  := 0;
end;

function TT3GunOnVehicle.InsideBlindZone(aObject: TSimObject): boolean;
var
  i : integer;
  blindZ : TBlindZoneVisual;
  bearing : double;
begin
  Result := inherited;

  bearing := CalcBearing(FPosition.X, FPosition.Y,
           TT3PlatformInstance(aObject).getPositionX,
           TT3PlatformInstance(aObject).getPositionY);

  // periksa apakah didalam area blind zone
  if FBlindView.Count > 0 then begin
    for I := 0 to FBlindView.Count - 1 do
    begin
      blindZ := TBlindZoneVisual(FBlindView.Items[i]);
      Result := DegComp_IsBeetwen(bearing, blindZ.RelativeStartAngle, blindZ.RelativeEndAngle);

      {if (blindZ.RelativeStartAngle > blindZ.RelativeEndAngle) then begin
        if (bearing > blindZ.RelativeStartAngle) or
           (bearing < blindZ.RelativeEndAngle) then begin
            result := true;
            break;
        end;
      end else
      if (bearing > blindZ.RelativeStartAngle) and
         (bearing < blindZ.RelativeEndAngle) then begin
          result := true;
          break;
         end;}
    end;
  end;
end;

function TT3GunOnVehicle.InsideBlindZonePos(X, Y : Double): boolean;
begin
  Result := inherited;
end;

function TT3GunOnVehicle.CreateProjectiles: TT3GunShoot;
var
  shoot : TT3GunShoot;
begin
  shoot := TT3GunShoot.Create;
  shoot.Lethality     := Lethality * FSalvoSize;
  shoot.FParent       := self;
  shoot.InstanceName  := InstanceName;
  shoot.TargetObject  := TargetObject;
  shoot.WeaponCategory:= WeaponCategory;
  shoot.WeaponOnVehicleID := Self.InstanceIndex;

  shoot.ControlMode    := ControlMode;      // ---
  shoot.FSimPlatforms  := FSimPlatforms;    //    |
  shoot.NGSPosX        := NGSPosX;          //    |
  shoot.NGSPosY        := NGSPosY;          //    |
  shoot.NGSPosZ        := NGSPosZ;{Altitude}//    |
  shoot.NGSFlashX      := NGSFlashX;        //    ==> mk test
  shoot.NGSFlashY      := NGSFlashY;        //    |
  shoot.NGSSpotLine    := NGSSpotLine;      //    |
  shoot.NGSGunLine     := NGSGunLine;       //    |
  shoot.FGunDefinition := GunDefinition;    // ---
  shoot.ShipName       := TT3PlatformInstance(FParent).InstanceName;

  result := shoot;
end;

destructor TT3GunOnVehicle.destroy;
begin
  inherited;
end;

function TT3GunOnVehicle.getMountType: integer;
begin
  result := FGunDefinition.FPoint.FData.Mount_Type;
end;


function TT3GunOnVehicle.PrepareShoot : TT3GunShoot;
var
  shoot : TT3GunShoot;
begin
  result:= nil;

//  if ControlMode <> 4 then
//  begin
    if not Assigned(TargetObject) then
      exit;
//  end;

  if not (Quantity > 0) then
    exit;

  shoot := CreateProjectiles;
  if Assigned(shoot) then
  begin
    shoot.Parent := Parent;
    shoot.setPOH(FGunPOH);

    if Assigned(OnLaunched) then
      OnLaunched(shoot,TargetObject);

    //Quantity := Quantity - FSalvoSize;
    result := shoot;
  end;
end;

function TT3GunOnVehicle.GetSnapshotData : _SS_GunOnVehicle ;
var
  I : integer;
  ss : _SS_GunOnVehicle;
  blind : TBlind_Zone;
  ppoh  : TGun_POH_vs_Range;
begin
  if Parent <> nil then
    ss.Owner  := TT3Unit(Parent).InstanceIndex;

  ss.W := TT3Weapon(Self).GetSnapshotData ;
  ss.GunDefinition.FData   := GunDefinition.FData;
  ss.GunDefinition.FGun_POH:= GunDefinition.FGun_POH;
  ss.GunDefinition.FNote   := GunDefinition.FNote;
  ss.GunDefinition.FPoint.FData := GunDefinition.FPoint.FData;

  blind := nil;
  if GunDefinition.FBlind <> nil then
  begin
    SetLength(ss.GunDefinition.FBlind,GunDefinition.FBlind.Count);
    for I := 0 to GunDefinition.FBlind.Count - 1 do
    begin
      blind := TBlind_Zone(GunDefinition.FBlind[i]);

      if blind <> nil then
        ss.GunDefinition.FBlind[i].FData := blind.FData;
    end;
  end;

  if GunDefinition.FPOH <> nil then
  begin
    SetLength(ss.GunDefinition.FPOH,GunDefinition.FPOH.Count);
    for I := 0 to GunDefinition.FPOH.Count - 1 do
    begin
      ppoh := TGun_POH_vs_Range(GunDefinition.FPOH[i]);

      if blind <> nil then
        ss.GunDefinition.FPOH[i].FData := ppoh.FData;
    end;
  end;

  ss.Quantity              := Quantity                ;
  ss.SalvoSize             := SalvoSize               ;
  ss.SalvoMode             := SalvoMode               ;
  ss.IsAssigned            := IsAssigned              ;
  ss.State                 := State                   ;

  ss.InterceptRange        := InterceptRange          ;
  ss.ThresholdSpeed        := ThresholdSpeed          ;

  ss.ChaffBloom            := ChaffBloom              ;
  ss.ChaffType             := ChaffType               ;
  ss.ChaffPosX             := ChaffPosX               ;
  ss.ChaffPosY             := ChaffPosY               ;

  Result := ss;
end;

procedure TT3GunOnVehicle.SetSnapshotData(const ss : _SS_GunOnVehicle);
begin
   TT3Weapon(Self).SetSnapshotData(ss.W);
   GunDefinition.FData   := ss.GunDefinition.FData     ;
   GunDefinition.FGun_POH:= ss.GunDefinition.FGun_POH  ;
   Quantity              := ss.Quantity                ;
   SalvoSize             := ss.SalvoSize               ;
   SalvoMode             := ss.SalvoMode               ;
   IsAssigned            := ss.IsAssigned              ;
   State                 := ss.State                   ;

   InterceptRange        := ss.InterceptRange          ;
   ThresholdSpeed        := ss.ThresholdSpeed          ;

   ChaffBloom            := ss.ChaffBloom              ;
   ChaffType             := ss.ChaffType               ;
   //ChaffPosX             := ss.ChaffPosX               ;
   //ChaffPosY             := ss.ChaffPosY               ;
end;

{ TT3GunShoot }

procedure TT3GunShoot.setPOH(poh : TT3GunPOH);
begin
  FPOH := poh;
end;

function TT3GunShoot.Shoot : Byte ;
var  
  info : string;
  //I : Integer;
  {$IFDEF SERVER}
  isHitSuccess : boolean;
  tgtRange, TRIPRange, lethalityNGS : double;
  vh, tgt : TT3PlatformInstance;
  //pl : TT3PlatformInstance;
  {$ENDIF}
begin
  result := Byte(pohPending);
  //isHitSuccess := false;

  try
    if (TargetObject <> nil) and (TargetObject is TT3PlatformInstance) then
    begin
      if InsideBlindZone(TargetObject) then begin
        if Assigned(OnLogEventStr) then
          OnLogEventStr('TT3GunShoot.Shoot', 'Failed, Target in blind zone area');
        exit;
      end;

      {$IFDEF SERVER}
      if Assigned(Parent) and (Parent is TT3PlatformInstance) then
      begin
        vh       := parent as TT3PlatformInstance;
        tgt      := TargetObject as TT3PlatformInstance;
        TRIPRange:= CalcRange(NGSFlashX, NGSFlashY, tgt.getPositionX, tgt.getPositionY);
        tgtRange := CalcRange(vh.getPositionX, vh.getPositionY,
                    tgt.getPositionX, tgt.getPositionY);

        if ControlMode <> 4 then
        begin
          if tgt.PlatformDomain = 0 then
            isHitSuccess := FPOH.CalcPOH(tgtRange,1)
          else
            isHitSuccess := FPOH.CalcPOH(tgtRange, 2);

          if isHitSuccess then
          begin
            result := Byte(pohHit);

            if Assigned(OnHit) then
              OnHit(self, TargetObject, Lethality);
          end
          else
          begin
            result := Byte(pohNoHit);
            // always free after shoot
            FreeMe := true;
            AbsoluteFree := True;
          end;
        end
        else
        begin
          if TRIPRange < FGunDefinition.FData.NGS_MaxDamageRadius then
          begin
            result := Byte(pohHit);

            if Assigned(OnHit) then
              OnHit(self, TargetObject, Lethality);
          end
          else 
          if (FGunDefinition.FData.NGS_MaxDamageRadius < TRIPRange) 
             and (TRIPRange < FGunDefinition.FData.NGS_EffectiveRadius) then               
          begin
            result := Byte(pohHit);
            lethalityNGS := (Lethality * (TRIPRange - FGunDefinition.FData.NGS_MaxDamageRadius)/
                            (FGunDefinition.FData.NGS_EffectiveRadius - FGunDefinition.FData.NGS_MaxDamageRadius));

            if Assigned(OnHit) then
              OnHit(self, TargetObject, Round(lethalityNGS));
          end
          else
          begin
            result := Byte(pohNoHit);
            // always free after shoot
            FreeMe := true;
            AbsoluteFree := True;
          end;
        end;
      end;
      {$ENDIF}
    end;
  except
    TargetObject := nil;
  end;

  FPOHResult := result;
  case FPOHResult of
    pohPending  : info := 'Pending, calculate later';
    pohHit      : info := 'Success hit';
    pohNoHit    : info := 'Failed hit';
  end;

  {if Assigned(OnLogEventStr) and (FPOHResult = 3) then
    OnLogEventStr('TT3GunShoot.Shoot', 'Probability Hit : ' + info ); }
end;

procedure TT3GunShoot.Shoot(poh: Byte);
var
  info : string;
  I : Integer;
begin
  FPOHResult := poh;

  if ControlMode <> 4 then
  begin
    try
      if (TargetObject <> nil) and (TargetObject is TT3PlatformInstance) then begin

        if InsideBlindZone(TargetObject) then begin
          if Assigned(OnLogEventStr) then
            OnLogEventStr('TT3GunShoot.Shoot', 'Failed, Target in blind zone area');
          exit;
        end;

//        {$IFDEF CLIENT}
//        if Assigned(Parent) and (Parent is TT3PlatformInstance) then begin
//          if poh = pohHit then begin
//            if Assigned(OnHit) then
//              OnHit(self,TargetObject,Lethality);
//          end;
//        end;
//        // always free after shoot
//        FreeMe := true;
//        {$ENDIF}
      end;
    except
      TargetObject := nil;
    end;

    case FPOHResult of
      pohPending  : info := 'Pending, calculate later';
      pohHit      : info := 'Success hit';
      pohNoHit    : info := 'Failed hit';
    end;

    if Assigned(OnLogEventStr) then
      OnLogEventStr('TT3GunShoot.Shoot', 'Probability Hit : ' + info );
  end
  else
  begin
    for I := 0 to FSimPlatforms.itemCount - 1 do
    begin
//      {$IFDEF CLIENT}
//      pl := nil;
//      pl := FSimPlatforms.getObject(I) as TT3PlatformInstance;
//
//      if not(Assigned(pl)) then Continue;
//
//      if poh = pohHit then begin
//        if Assigned(OnHit) then
//          OnHit(self,pl,Lethality);
//      end;
//      {$ENDIF}

      if poh = pohHit then begin
        case FPOHResult of
          pohPending  : info := 'Pending, calculate later';
          pohHit      : info := 'Success hit';
          pohNoHit    : info := 'Failed hit';
        end;

        if Assigned(OnLogEventStr) then
          OnLogEventStr('TT3GunShoot.Shoot', 'Probability Hit : ' + info );
      end;
    end;

//    {$IFDEF CLIENT}
    // always free after shoot
//      FreeMe := true;
//    {$ENDIF}
  end;
end;

function TT3GunShoot.GetSnapshotData : _SS_TT3GunShoot ;
var
   ss : _SS_TT3GunShoot ;
begin
   ss.W := TT3Weapon(Self).GetSnapshotData;
   ss.FTT3GunPOH := FPOH.GetSnapshotData ;
   ss.POHResult := POHResult ;
   Result := ss;
end;

procedure TT3GunShoot.SetSnapshotData(const ss : _SS_TT3GunShoot);
begin
  TT3Weapon(Self).SetSnapshotData(ss.W);
  FPOH.SetSnapshotData(ss.FTT3GunPOH);
  FPOHResult := ss.POHResult ;
end;

{ TT3GunPOH }

function getPOH(range: double; POHList : TList):boolean;
var
  i : integer;
  //ppoh, it1, it2 : ^TRecGun_POH_vs_Range;
  ppoh, it1, it2 : TGun_POH_vs_Range;
  minRange, maxRange, prob : double;
begin
  result := false;

  if not Assigned(POHList) then exit;
  if POHList.Count = 0 then exit;

  for i := 0 to POHList.Count - 1 do begin
     ppoh := TGun_POH_vs_Range(POHList.Items[i]);
     if range > ppoh.FData.Range then Continue else Break;
  end;

  ppoh := TGun_POH_vs_Range(POHList.Items[POHList.Count - 1]);
  maxRange := ppoh.FData.Range;

  ppoh := TGun_POH_vs_Range(POHList.Items[0]);
  minRange := ppoh.FData.Range;

  // max probability
  if range <= minRange then begin
    ppoh := TGun_POH_vs_Range(POHList.Items[0]);
    prob := ppoh.FData.Prob_of_Hit;
    if Random < prob then
      result := true;
  end else
  // min probability
  if range >= maxRange then begin
    ppoh := TGun_POH_vs_Range(POHList.Items[POHList.Count - 1]);
    prob := ppoh.FData.Prob_of_Hit;
    if Random < prob then
      result := true;
  end else begin
    // pake interpolasi
    // Y = (((X - X0)*Y1) + ((X1 - X)*Y0)) / (X1 - X0);

    it1 := TGun_POH_vs_Range(POHList.Items[i-1]);
    it2 := TGun_POH_vs_Range(POHList.Items[i]);

    prob := (((range - it1.FData.range)*it2.FData.Prob_of_Hit) +
            ((it2.FData.range-range)*it1.FData.Prob_of_Hit)) /
            (it2.FData.range - it1.FData.range);

    if Random < prob then
      result := true;
  end
end;

function TT3GunPOH.CalcPOH(range: double; targetType : integer): boolean;
begin
  result := False;

  if targetType = 1 then
    result := getPOH(range, FAirTargetPOH)
  else if targetType = 2 then
    result := getPOH(range, FSurfaceTargetPOH)
end;

constructor TT3GunPOH.Create(poh: TList);
var
  i : integer;
  //ppoh, np : ^TRecGun_POH_vs_Range;
  ppoh, np : TGun_POH_vs_Range;
begin
  FAirTargetPOH     := Tlist.Create;
  FSurfaceTargetPOH := TList.Create;

  if Assigned(poh) then begin
    for i := 0 to poh.Count - 1 do begin
      ppoh := poh[i];

      if ppoh.FData.Target_Type = 1 then begin
        //New(np);
        np := TGun_POH_vs_Range(ppoh);
        np.FData.Prob_of_Hit := ppoh.FData.Prob_of_Hit;
        np.FData.Range := ppoh.FData.Range;
        FAirTargetPOH.Add(np);
      end;

      if ppoh.FData.Target_Type = 2 then begin
        //New(np);
        np := TGun_POH_vs_Range(ppoh);
        np.FData.Prob_of_Hit := ppoh.FData.Prob_of_Hit;
        np.FData.Range := ppoh.FData.Range;
        FSurfaceTargetPOH.Add(np);
      end;
    end;
    Sort;
  end;
end;

destructor TT3GunPOH.Destroy;
  procedure ClearAndFree(list : TList);
  var
    i : integer;
    p : Pointer;
  begin
    for i := 0 to List.Count - 1 do begin
      p := List[i];
      FreeAndNil(p);
    end;
    FreeAndNil(list);
  end;
begin
  ClearAndFree(FAirTargetPOH);
  ClearAndFree(FSurfaceTargetPOH);
end;

procedure TT3GunPOH.Sort;
  function CompareRanges(item1, item2 : Pointer):integer;
  var
    //ppoh1, ppoh2 : ^TRecGun_POH_vs_Range;
    ppoh1, ppoh2 : TGun_POH_vs_Range;
  begin
    ppoh1 := item1;
    ppoh2 := item2;

    if ppoh1.FData.Range < ppoh2.FData.Range then result := -1
    else if ppoh1.FData.Range > ppoh2.FData.Range then result := 1
    else result := 0;
  end;
begin
  FAirTargetPOH.Sort(@CompareRanges) ;
  FSurfaceTargetPOH.Sort(@CompareRanges);
end;

function TT3GunPOH.GetSnapshotData : _SS_TT3GunPOH ;
var
  ss   : _SS_TT3GunPOH ;
  I    : Integer;
  gpoh : TGun_POH_vs_Range;
begin
  SetLength(ss.FAirTargetPOH,FAirTargetPOH.Count);
  for I := 0 to FAirTargetPOH.Count - 1 do  begin
        gpoh := FAirTargetPOH.Items[i];
        if gpoh <> nil then begin
           ss.FAirTargetPOH[i].FData := gpoh.FData ;
        end;
  end;

  SetLength(ss.FSurfaceTargetPOH,FSurfaceTargetPOH.Count);
  for I := 0 to FSurfaceTargetPOH.Count - 1 do  begin
        gpoh := FSurfaceTargetPOH.Items[i];
        if gpoh <> nil then begin
           ss.FSurfaceTargetPOH[i].FData := gpoh.FData ;
        end;
  end;
  ss.FMinPOHRangeAir := FMinPOHRangeAir ;
  ss.FMaxPOHRangeAir := FMaxPOHRangeAir ;
  ss.FMinPOHRangeSurf := FMinPOHRangeSurf ;
  ss.FMinPOHRangeSurf := FMinPOHRangeSurf ;
  Result := ss ;
end;

procedure TT3GunPOH.SetSnapshotData(const ss : _SS_TT3GunPOH);
var
  I    : Integer;
  gpoh : TGun_POH_vs_Range;
begin
  for I := low(ss.FAirTargetPOH) to high(ss.FAirTargetPOH) do begin
      gpoh := TGun_POH_vs_Range.Create ;
      gpoh.FData := ss.FAirTargetPOH[i].FData ;
      FAirTargetPOH.Add(gpoh);
  end;
  for I := low(ss.FSurfaceTargetPOH) to high(ss.FSurfaceTargetPOH) do begin
      gpoh := TGun_POH_vs_Range.Create ;
      gpoh.FData := ss.FSurfaceTargetPOH[i].FData ;
      FSurfaceTargetPOH.Add(gpoh);
  end;
  FMinPOHRangeAir  := ss.FMinPOHRangeAir ;
  FMaxPOHRangeAir  := ss.FMaxPOHRangeAir ;
  FMinPOHRangeSurf := ss.FMinPOHRangeSurf ;
  FMinPOHRangeSurf := ss.FMinPOHRangeSurf ;
end;

end.
