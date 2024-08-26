unit uDBAsset_Weapon;

interface

uses

  tttData,Classes, uDBNote_Storage, uDBAssetObject, uDBAsset_Vehicle, uSimObjects,
  Graphics, uObjectVisuals, uCoordConvertor, uDBBlind_Zone, uLibSettingTTT, u2DMover,
  uBaseCoordSystem, uDataTypes, uDBAsset_Countermeasure, newClassASTT, uDBAsset_Scripted, uSimContainers;
type
  TShoot = class
  private
    FLethality: integer;
    procedure SetLethality(const Value: integer);
  published
    property Lethality : integer read FLethality write SetLethality;
  end;

  TMissile_On_Board = class (TSimObject)
  private
    FRangeView  : TRangeVisual;
    FBlindView  : TList;
    FTacticalSymbol : TTacticalSymbol;
    FMover: T2DMover;

    FShowRange: boolean;
    FShowBlind: boolean;
    FWeaponCategory: TWeapoonCategory;
    FLaunched: boolean;
    FTargetObject: TSimObject;
    FPlanned: boolean;
    FRangeFormBase : double;
    FBasePOsition : t2DPoint;

    FlastPointX,FlastPointY : double;
    FOnHitSomething: TNotifyEvent;
    function getDetectionRange: Double;
    function getRange(const Index: Integer): Double;
    procedure SetShowRange(const Value: boolean);
    procedure SetShowBlind(const Value: boolean);
    procedure SetWeaponCategory(const Value: TWeapoonCategory);
    procedure SetLaunched(const Value: boolean);
    procedure SetTargetObject(const Value: TSimObject);
    procedure SetPlanned(const Value: boolean);
    procedure SetOnHitSomething(const Value: TNotifyEvent);
  published
  public
    FData         : TRecFitted_Weapon_On_Board;
    FDef          : TRecMissile_Definition;
    FLaunch       : TFitted_Weap_Launcher_On_Board;
    FLaunchs      : TList;
    FPI           : TPlatform_Instance;
    FBlind            : TList;
    FScript_Missile   : TList;
    FPattern_Missile  : TList;
    FNote         : uDBNote_Storage.TNote_Storage ;
    FVehicle      : TVehicle_Definition;
    FPlatform_Library_Entry : TRecPlatform_Library_Entry;

    FBZone_1 : TRecBlind_Zone_Definition;
    FBZone_2 : TRecBlind_Zone_Definition;

    property MaxRange: Double index 1 read getRange;
    property MinRange: Double index 2 read getRange;

    constructor Create;
    destructor Destroy;override;

    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;

    property ShowRange : boolean read FShowRange write SetShowRange;
    property ShowBlind : boolean read FShowBlind write SetShowBlind;
    property Launched  : boolean read FLaunched write SetLaunched;
    property Planned   : boolean read FPlanned write SetPlanned;

    property WeaponCategory : TWeapoonCategory read FWeaponCategory write SetWeaponCategory;
    property TargetObject : TSimObject read FTargetObject write SetTargetObject;
    property OnHitSomething : TNotifyEvent read FOnHitSomething write SetOnHitSomething;
  end;

  TTorpedo_On_Board = class (TSimObject)
  private
    FWeaponCategory: TWeapoonCategory;
    FShowBlind: boolean;
    FShowRange: boolean;
    FRangeView  : TRangeVisual;
    FBlindView  : TList;
    FTacticalSymbol : TTacticalSymbolVisual;
    function getRange(const Index: Integer): Double;
    procedure SetShowBlind(const Value: boolean);
    procedure SetShowRange(const Value: boolean);
    procedure SetWeaponCategory(const Value: TWeapoonCategory);
  published

  public

    FData : TRecFitted_Weapon_On_Board;
    FDef  : TRecTorpedo_Definition;
    FNote     : uDBNote_Storage.TNote_Storage ;
    FPI       : TPlatform_Instance;
    FBlind        : TList;
    FScript_Torpedo   : TList;
    FPattern_Torpedo  : TList;
    FVehicle      : TVehicle_Definition;
    FLaunch       : TFitted_Weap_Launcher_On_Board;
    FLaunchs      : TList;
    FTorpedo_POH : TRecTorpedo_POH_Modifier;
    X,Y : Integer;
    FPlatform_Library_Entry : TRecPlatform_Library_Entry;

    FBZone_1 : TRecBlind_Zone_Definition;
    FBZone_2 : TRecBlind_Zone_Definition;

    property MaxRange: Double index 1 read getRange;
    property MinRange: Double index 2 read getRange;

    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;

    constructor Create;
    destructor Destroy;override;

    property ShowRange : boolean read FShowRange write SetShowRange;
    property ShowBlind : boolean read FShowBlind write SetShowBlind;

    property WeaponCategory : TWeapoonCategory read FWeaponCategory write SetWeaponCategory;
  end;

  TMine_On_Board = class(TSimObject)
  private
    FWeaponCategory: TWeapoonCategory;
    procedure SetWeaponCategory(const Value: TWeapoonCategory);
  published
  public

    FNote     : uDBNote_Storage.TNote_Storage ;

    FData          : TRecFitted_Weapon_On_Board;
    FMine_Def      : TRecMine_Definition;
    FMine_POD      : TRecMine_POD_vs_Range;
    FPI            : TPlatform_Instance;
    FBlind         : TList;
    FScript_Mine   : TList;
    FPattern_Mine  : TList;
    FVehicle       : TVehicle_Definition;
    FPlatform_Library_Entry : TRecPlatform_Library_Entry;

    X : Integer;
    Y : Integer;

    constructor Create;
    destructor Destroy;override;

    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;

    property WeaponCategory : TWeapoonCategory read FWeaponCategory write SetWeaponCategory;
  end;

  THybrid_On_Board = class
  public
    FData         : TRecHybrid_Definition;
    FTorpedo_Def  : TRecTorpedo_Definition;
    FMissile_Def  : TRecMissile_Definition;
  end;

  TGun_Definition = class(TSimObject)
  private
    FWeaponCategory: TWeapoonCategory;
    FShowBlind: boolean;
    FShowRange: boolean;
    FRangeView  : TRangeVisual;
    FBlindView  : TList;
    FCapacity : integer;
    FMode: integer;
    FSalvoMode: integer;
    FTargetObject: TSimObject;
    FSalvoSize: integer;
    procedure SetWeaponCategory(const Value: TWeapoonCategory);
    procedure SetShowBlind(const Value: boolean);
    procedure SetShowRange(const Value: boolean);
    procedure SetMode(const Value: integer);
    procedure SetSalvoMode(const Value: integer);
    procedure SetCapacity(const Value: integer);
    procedure SetTargetObject(const Value: TSimObject);
    procedure SetSalvoSize(const Value: integer);
  published
  public
    FData     : TRecGun_Definition;
    FGun_POH  : TRecGun_POH_vs_Range;
    FNote     : uDBNote_Storage.TNote_Storage ;
    FPoint    : TPoint_Effect_On_Board;
    X : Integer;
    Y : Integer;

    constructor Create;
    destructor Destroy;override;

    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure Shoot;

    property ShowRange : boolean read FShowRange write SetShowRange;
    property ShowBlind : boolean read FShowBlind write SetShowBlind;
    property Mode : integer read FMode write SetMode;
    property SalvoMode : integer read FSalvoMode write SetSalvoMode;
    property Capacity : integer read FCapacity write SetCapacity;
    property WeaponCategory : TWeapoonCategory read FWeaponCategory write SetWeaponCategory;
    property TargetObject : TSimObject read FTargetObject write SetTargetObject;
    property SalvoSize : integer read FSalvoSize write SetSalvoSize;
  end;

  TBomb_Definition = class(TSimObject)
  private
    FWeaponCategory: TWeapoonCategory;
    procedure SetWeaponCategory(const Value: TWeapoonCategory);
  published
  public
    FData         : TRecBomb_Definition;
    FBomb_POH     : TRecBomb_POH_vs_Range;
    FNote         : uDBNote_Storage.TNote_Storage ;
   	FPoint    : TPoint_Effect_On_Board;

    X : Integer;
    Y : Integer;

	procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    constructor Create;
    destructor Destroy;override;

    property WeaponCategory : TWeapoonCategory read FWeaponCategory write SetWeaponCategory;

  end;



  implementation

uses uDataModuleTTT, uDBAsset_MotionCharacteristics;

{ TMissile_On_Board }

constructor TMissile_On_Board.Create;
begin
  FMover := T2DMover.Create;

  FPI               := TPlatform_Instance.Create;
  FBlind            := TList.Create;
  FScript_Missile   := TList.Create;
  FPattern_Missile  := TList.Create;
  FVehicle          := TVehicle_Definition.Create;
  FBlindView        := TList.Create;
  FLaunchs          := TList.Create;

  FLaunch           := TFitted_Weap_Launcher_On_Board.Create;
  FRangeView        := TRangeVisual.Create;
  FTacticalSymbol   := TTacticalSymbol.Create;

  //FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'MissileFriend.bmp',cgFriend);
end;

destructor TMissile_On_Board.Destroy;
var
  i : Integer;
begin
  FMover.Free;
  FPI.Free;
  FVehicle.Free;
  FRangeView.Free;
  FTacticalSymbol.Free;
  FLaunch.Free;

  FreeItemsAndFreeList(FBlind);
  FreeItemsAndFreeList(FScript_Missile);
  FreeItemsAndFreeList(FPattern_Missile);
  FreeItemsAndFreeList(FBlindView);
  FreeItemsAndFreeList(FLaunchs);

  inherited;
end;

procedure TMissile_On_Board.Draw(aCnv: tCanvas);
var i : integer;
  X1,Y1, X2,Y2 : integer;
begin
  inherited;
  if FShowRange then begin
    FRangeView.Draw(aCnv);
  end;

  if FShowBlind then begin
    for i := 0 to FBlindView.Count - 1 do
        TBlindZoneVisual(FBlindView[i]).Draw(aCnv);
  end;

  if FLaunched then begin
    FTacticalSymbol.TextVisual.Visible := false;
    FTacticalSymbol.Visible := true;
    FTacticalSymbol.Draw(aCnv);
  end;

  if FPlanned then begin
    if Assigned(TargetObject) then begin

      VConvertor.ConvertToScreen(TPlatform_Instance(FTargetObject).PositionX,
            TPlatform_Instance(FTargetObject).PositionY,X1,Y1);
      VConvertor.ConvertToScreen(FMover.X,FMover.Y,X2,Y2);

      with aCnv do begin
        Pen.Color := clSilver;
        Pen.Style := psSolid;
        Pen.Width := 1;

        MoveTo(X1,Y1);
        LineTo(X2,Y2);
      end;
    end;
  end;
end;

function TMissile_On_Board.getDetectionRange: Double;
begin
   Result := 0;
end;

function TMissile_On_Board.getRange(const Index: Integer): Double;
begin
  Result := 0;
  case Index of
    1 : Result := FDef.Max_Range;
    2 : Result := FDef.Min_Range;
  end;
end;

procedure TMissile_On_Board.Move(const aDeltaMs: double);
var
  tgtX, tgtY, mslX, mslY, range, bearing: double;
  X1,Y1, X2,Y2 : integer;
begin
  inherited;

  case FDef.Primary_Target_Domain of
    0 : FWeaponCategory := wcMissileAirToSurfaceSubsurface;
    1 : FWeaponCategory := wcMissileSurfaceSubsurfaceToSurfaceSubsurface;
    2 : FWeaponCategory := wcMissileSurfaceSubsurfaceToAir;
    3 : FWeaponCategory := wcMissileAirToAir;
    4 : FWeaponCategory := wcMissileLandAttack;
  end;

  if FLaunched then begin
    mslX := FMover.X;
    mslY := FMover.Y;
    if Assigned(FTargetObject) then begin

      tgtX := TPlatform_Instance(FTargetObject).PositionX;
      tgtY := TPlatform_Instance(FTargetObject).PositionY;

      bearing := CalcBearing(mslX,mslY,tgtX,tgty);
      FMover.Direction := ConvCompass_To_Cartesian(bearing);

      VConvertor.ConvertToScreen(tgtX,tgtY, X1,Y1);
      VConvertor.ConvertToScreen(mslX,mslY, X2,Y2);

      range := sqrt( sqr(X2 - X1) + sqr(Y2 - Y1));

      if range < 5 then begin
        FLaunched := false;
        FPlanned := false;
        FTargetObject := nil;
      end;
    end;

    FMover.Move(aDeltaMs);

    FRangeFormBase := CalcRange(FMover.X,FMover.Y,FBasePOsition.X,FBasePOsition.Y);
    //if FRangeFormBase > FDef.Max_Range then
      {if Assigned(FOnHitSomething) then
        FOnHitSomething(Self);}

  end else begin
  end;


end;

procedure TMissile_On_Board.SetLaunched(const Value: boolean);
var
  rec : TMotion_Characteristics;
  bearing : Double;
begin
  FLaunched := Value;
  bearing := 0;
  //FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'MissileFriend.bmp',cgFriend);
  FTacticalSymbol.Visible := true;

  rec := nil;
  dmTTT.GetMotion_Characteristics(FDef.Motion_Index,rec);

  if assigned(rec) then begin

    FMover.X := TPlatform_Instance(FParent).PositionX;
    FMover.Y := TPlatform_Instance(FParent).PositionY;
    //FMover.TurnRate := rec.FData.Standard_Turn_Rate;
    FMover.Acceleration := rec.FData.Acceleration;
    FMover.MaxSpeed := rec.FData.Max_Ground_Speed;

    if Assigned(FTargetObject) then begin
      bearing := CalcBearing(FMover.X,FMover.Y,
        TPlatform_Instance(FTargetObject).PositionX,
        TPlatform_Instance(FTargetObject).PositionY);
    end;

    FMover.Direction := ConvCompass_To_Cartesian(bearing);
    FMover.Enabled := true;

  end;

  FBasePOsition.X := TPlatform_Instance(FParent).PositionX;
  FBasePOsition.Y := TPlatform_Instance(FParent).PositionY;
end;

procedure TMissile_On_Board.SetOnHitSomething(const Value: TNotifyEvent);
begin
  FOnHitSomething := Value;
end;

procedure TMissile_On_Board.SetPlanned(const Value: boolean);
begin
  FPlanned := Value;
end;

procedure TMissile_On_Board.SetShowBlind(const Value: boolean);
begin
  FShowBlind := Value;
end;

procedure TMissile_On_Board.SetShowRange(const Value: boolean);
begin
  FShowRange := Value;
  FRangeView.Visible := Value;
end;

procedure TMissile_On_Board.SetTargetObject(const Value: TSimObject);
begin
  FTargetObject := Value;
end;

procedure TMissile_On_Board.SetWeaponCategory(const Value: TWeapoonCategory);
begin
  FWeaponCategory := Value;
end;

procedure TMissile_On_Board.UpdateVisual;
var i : integer;
  blind : TBlindZoneVisual;
  X,Y : integer;
begin
  inherited;
  if Assigned(FParent) then begin
    FRangeView.mX := TPlatform_Instance(FParent).PositionX;
    FRangeView.mY := TPlatform_Instance(FParent).PositionY;
    FRangeView.Color := clRed;
    FRangeView.Range := FDef.Max_Range;
    FRangeView.ConvertCoord(VConvertor);
    FRangeView.Visible := FShowRange;

    FBlindView.Clear;
    if Assigned(FBlind) then
      for I := 0 to FBlind.Count - 1 do begin
        with TBlind_Zone(FBlind[i]).FData do begin
          blind := TBlindZoneVisual.Create;
          blind.Color := clRed;
          blind.mX := FParent.getPositionX;
          blind.mY := FParent.getPositionY;
          blind.Ranges := FDef.Max_Range;
          blind.StartAngle := Start_Angle;
          blind.EndAngle := End_Angle;
          blind.Visible := FShowBlind;
          blind.ConvertCoord(VConvertor);
          FBlindView.Add(blind);
        end;
      end;
  end;

  if not FLaunched then begin
    FMover.X := TPlatform_Instance(FParent).PositionX;
    FMover.Y := TPlatform_Instance(FParent).PositionY;

    FPosition.X := TPlatform_Instance(FParent).PositionX;
    FPosition.Y := TPlatform_Instance(FParent).PositionY;

    VConvertor.ConvertToScreen(FPosition.X,FPosition.Y,X,Y);
  end else begin
    VConvertor.ConvertToScreen(FMover.X,FMover.Y,X,Y);
  end;

  FTacticalSymbol.Center.X := X;
  FTacticalSymbol.Center.Y := Y;
  FTacticalSymbol.Symbol.Center := FTacticalSymbol.Center;
  FTacticalSymbol.SpeedVector.Course := ConvCartesian_To_Compass(FMover.Direction);
  FTacticalSymbol.ConvertCoord(VConvertor);

  FPosition.X := FMover.X;
  FPosition.Y := FMover.Y;
  FPosition.Z := FMover.Z;
end;

{ TTorpedo_On_Board }

constructor TTorpedo_On_Board.Create;
begin
  FPI               := TPlatform_Instance.Create;
  FVehicle          := TVehicle_Definition.Create;
  FLaunch           := TFitted_Weap_Launcher_On_Board.Create;
  FBlind            := TList.Create;
  FScript_Torpedo   := TList.Create;
  FPattern_Torpedo  := TList.Create;
  FLaunchs          := TList.Create;
end;

destructor TTorpedo_On_Board.Destroy;
var
  i : Integer;
begin
  FPI.Free;
  FVehicle.Free;
  FLaunch.Free;

  FreeItemsAndFreeList(FBlind);
  FreeItemsAndFreeList(FScript_Torpedo);
  FreeItemsAndFreeList(FPattern_Torpedo);
  FreeItemsAndFreeList(FLaunchs);

  inherited;
end;

procedure TTorpedo_On_Board.Draw(aCnv: tCanvas);
var i : integer;
begin
  inherited;
  if FShowRange then begin
    FRangeView.Draw(aCnv);
  end;

  if FShowBlind then begin
    for i := 0 to FBlindView.Count - 1 do
        TBlindZoneVisual(FBlindView[i]).Draw(aCnv);
  end;

end;

function TTorpedo_On_Board.getRange(const Index: Integer): Double;
begin
  Result := 0;
  case Index of
    1 : Result := FDef.Max_Range;
    2 : Result := FDef.Min_Range;
  end;

end;

procedure TTorpedo_On_Board.Move(const aDeltaMs: double);
begin
  inherited;
  case FDef.Primary_Target_Domain of
    0 : FWeaponCategory := wcTorpedoStraigth;
    1 : FWeaponCategory := wcTorpedoActiveAcoustic;
    2 : FWeaponCategory := wcTorpedoPassiveAcoustic;
    3 : FWeaponCategory := wcTorpedoActivePassive;
    4 : FWeaponCategory := wcTorpedoWireGuided;
    5 : FWeaponCategory := wcTorpedoWakeHoming;
  end;
end;

procedure TTorpedo_On_Board.SetShowBlind(const Value: boolean);
begin
  FShowBlind := Value;
end;

procedure TTorpedo_On_Board.SetShowRange(const Value: boolean);
begin
  FShowRange := Value;
end;

procedure TTorpedo_On_Board.SetWeaponCategory(const Value: TWeapoonCategory);
begin
  FWeaponCategory := Value;
end;

procedure TTorpedo_On_Board.UpdateVisual;
var i : integer;
  blind : TBlindZoneVisual;
begin
  inherited;
  if Assigned(FParent) then begin
    FRangeView.mX := FParent.getPositionX;
    FRangeView.mY := FParent.getPositionY;
    FRangeView.Color := clRed;
    FRangeView.Range := FDef.Max_Range;
    FRangeView.ConvertCoord(VConvertor);
    FRangeView.Visible := FShowRange;

    FBlindView.Clear;
    if Assigned(FBlind) then
      for I := 0 to FBlind.Count - 1 do begin
        with TBlind_Zone(FBlind[i]).FData do begin
          blind := TBlindZoneVisual.Create;
          blind.Color := clRed;
          blind.mX := FParent.getPositionX;
          blind.mY := FParent.getPositionY;
          blind.Ranges := FDef.Max_Range;
          blind.StartAngle := Start_Angle;
          blind.EndAngle := End_Angle;
          blind.Visible := FShowBlind;
          blind.ConvertCoord(VConvertor);
          FBlindView.Add(blind);
        end;
      end;
  end;
end;

{ TMine_On_Board }

constructor TMine_On_Board.Create;
begin
   FPI            := TPlatform_Instance.Create;
   FVehicle       := TVehicle_Definition.Create;

   FBlind         := TList.Create;
   FScript_Mine   := TList.Create;
   FPattern_Mine  := TList.Create;

   FWeaponCategory := wcMine;
end;

destructor TMine_On_Board.Destroy;
begin
  FPI.Free;
  FVehicle.Free;

  FreeItemsAndFreeList(FBlind);
  FreeItemsAndFreeList(FScript_Mine);
  FreeItemsAndFreeList(FPattern_Mine);

  inherited;
end;

procedure TMine_On_Board.Draw(aCnv: tCanvas);
begin
  inherited;

end;

procedure TMine_On_Board.Move(const aDeltaMs: double);
begin
  inherited;
end;

procedure TMine_On_Board.SetWeaponCategory(const Value: TWeapoonCategory);
begin
  FWeaponCategory := Value;
end;

procedure TMine_On_Board.UpdateVisual;
begin
  inherited;

end;

{ THybrid_On_Board }

destructor TBomb_Definition.Destroy;
begin
  FPoint.Free;
end;


{ TBomb_Definition }
constructor TBomb_Definition.Create;
begin
  FPoint := TPoint_Effect_On_Board.Create;
  FWeaponCategory := wcBomb;
end;

procedure TBomb_Definition.Draw(aCnv: tCanvas);
begin
  inherited;

end;

procedure TBomb_Definition.Move(const aDeltaMs: double);
begin
  inherited;
end;

procedure TBomb_Definition.SetWeaponCategory(const Value: TWeapoonCategory);
begin
  FWeaponCategory := Value;
end;

procedure TBomb_Definition.UpdateVisual;
begin
  inherited;



end;

{ TGun_Definition }

constructor TGun_Definition.Create;
begin
  FRangeView        := TRangeVisual.Create;
  FBlindView        := TList.Create;
  FCapacity         := 200;
  FMode             := 1;
  FSalvoMode        := 1;
  FSalvoSize        := 1;

  FPoint    := TPoint_Effect_On_Board.Create;

end;

destructor TGun_Definition.Destroy;
begin
  FRangeView.Free;
  FPoint.Free;

  FreeItemsAndFreeList(FBlindView);
  inherited;
end;

procedure TGun_Definition.Draw(aCnv: tCanvas);
begin
  inherited;
  if FShowRange then begin
    FRangeView.Color := clRed;
    FRangeView.LineStyles := psSolid;
    FRangeView.Draw(aCnv);
  end;
  if FShowBlind then begin
    //FBlindZone.Color := clGreen;
    //FBlindZone.Draw(aCnv);
  end;
end;

procedure TGun_Definition.Move(const aDeltaMs: double);
begin
  inherited;
  case FData.Gun_Category of
    1 : FWeaponCategory := wcGunCIWS;
    2 : FWeaponCategory := wcGunGun;
    4 : FWeaponCategory := wcGunRocket;
  end;
end;

procedure TGun_Definition.SetCapacity(const Value: integer);
begin
  FCapacity := Value;
end;

procedure TGun_Definition.SetMode(const Value: integer);
begin
  FMode := Value;
end;

procedure TGun_Definition.SetSalvoMode(const Value: integer);
begin
  FSalvoMode := Value;
end;

procedure TGun_Definition.SetSalvoSize(const Value: integer);
begin
  FSalvoSize := Value;
end;

procedure TGun_Definition.SetShowBlind(const Value: boolean);
begin
  FShowBlind := Value;
end;

procedure TGun_Definition.SetShowRange(const Value: boolean);
begin
  FShowRange := Value;
end;

procedure TGun_Definition.SetTargetObject(const Value: TSimObject);
begin
  FTargetObject := Value;
end;

procedure TGun_Definition.SetWeaponCategory(const Value: TWeapoonCategory);
begin
  FWeaponCategory := Value;
end;

procedure TGun_Definition.Shoot;
var tgtX, tgtY, range : double;
  shoot : TShoot;
begin
  if FTargetObject = nil then exit;
  if FTargetObject.ClassType <> TPlatform_Instance then exit;
  if Capacity <= 0 then exit;

  Capacity := Capacity - SalvoSize;

  tgtX := TPlatform_Instance(FTargetObject).PositionX;
  tgtY := TPlatform_Instance(FTargetObject).PositionY;

  // cek dengan maximum dan min shoot range
  range := CalcRange(tgtX, tgtY, FPosition.X,FPosition.Y );
  if (range < FData.Min_Range) or (range > FData.Max_Range) then exit;

  shoot := TShoot.Create;
  shoot.Lethality := SalvoSize * FData.Lethality_per_Round;
  TPlatform_Instance(FTargetObject).HitMe(shoot);
end;

procedure TGun_Definition.UpdateVisual;
var
  blind : TBlindZoneVisual;
begin
  inherited;
  if Assigned(FParent) then begin
    FPosition.X := FParent.getPositionX;
    FPosition.Y := FParent.getPositionY;
    FPosition.Z := FParent.getPositionZ;

    FRangeView.Range  := FData.Max_Range;
    FRangeView.mX     := FParent.getPositionX;
    FRangeView.mY     := FParent.getPositionY;
    FRangeView.ConvertCoord(VConvertor);

    {FBlindView.Clear;
    if Assigned(FBlind) then
      for I := 0 to FBlind.Count - 1 do begin
        with TBlind_Zone(FBlind[i]).FData do begin
          blind := TBlindZoneVisual.Create;
          blind.Color := clRed;
          blind.mX := FParent.getPositionX;
          blind.mY := FParent.getPositionY;
          blind.Ranges := FDef.Max_Range;
          blind.StartAngle := Start_Angle;
          blind.EndAngle := End_Angle;
          blind.Visible := FShowBlind;
          blind.ConvertCoord(VConvertor);
          FBlindView.Add(blind);
        end;
      end; }
  end;

end;

{ TGunShoot }

procedure TShoot.SetLethality(const Value: integer);
begin
  FLethality := Value;
end;

end.
