unit uT3Bomb;

interface

uses uT3Weapon, uDBasset_Weapon, tttData, uObjectVisuals, uT3UnitContainer,
  SysUtils, u2DMover, uT3Unit, uDataTypes,uSimObjects, Graphics, Classes, uDBAssetObject,
  uSnapshotData;

type
  TBombType = (btBomb, btDepthCharge, btRocket);
  TMoveChangeState  = (mcsStable, mcsIncrease, mcsDecrease);

  TT3Bomb = class(TT3Weapon)
  private
    FSalvo            : Double;
    FPOH              : TList;
    FMaxRange         : Double;
    FMinRange         : Double;
    FOrderedAltitude  : Double;
    FEngageTarget     : Boolean;
    FTargetPosition   : t3DPoint;
    FOwner            : TSimObject;
    FAltitudeState    : TMoveChangeState;
    FTargetPlatforms  : TT3UnitContainer;
    FBombDefinition   : TBomb_Definition;
    FCycleUpdateAltitude    : double;
    FIDNameBomb: Integer;
    FBombType: Integer;
    FShipName : string; // untuk mengambil yg mengeluarkan bomb

    {$IFDEF SERVER}
    function TargetCheck(target: TSimObject): boolean;
    Procedure CalcHitSomething;
    {$ENDIF}

    procedure SetOwner(const Value: TSimObject);
    procedure SetOrderedAltitude(const Value : double);
    procedure SetTargetPosition(const Value: t3DPoint);
    procedure SetTargetPlatforms(const Value: TT3UnitContainer);

    procedure setIDNameBomb(const Value: Integer);

    procedure SetBombType(const Value: Integer);  protected
    FOrderDepth   : Double;
    FCounter      : Double;
    FLaunch       : Boolean;
    FMover        : T2DMover;
    TipeBomb      : TBombType;
    FTacticalSymbol   : TTacticalSymbol;

//    FTargetedTrack: TSimObject;

    function getAltitude : Single; override;
    procedure SetAltitude(const Value: single); override;
    procedure SetLaunched(const Value: boolean);override;
    procedure CalcMovement(aDeltaMs: double); override;

  public
    CountTarget : Integer;
    constructor Create;override;
    destructor Destroy;override;

    function getPOH(range : Double): Double;
    function GetSnapshotData : _SS_TT3Bomb ;

    procedure Launch;
    procedure Initialize; override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: TCanvas);override;
    procedure Move(const aDeltaMs: double); override;
    procedure SetSnapshotData(const ss : _SS_TT3Bomb);
    procedure RepositionTo(const x, y: double); override;
    procedure SetSelected(Const Value: boolean); override;

    procedure setPositionX(const v: double); override;
    procedure setPositionY(const v: double); override;
    procedure setPositionZ(const v: double); override;

//    property Owner       : TSimObject read FOwner write SetOwner;
    property OrderDepth  : Double read FOrderDepth write FOrderDepth;
    property BombDefinition   : TBomb_Definition read FBombDefinition;
    property TargetPosition   : t3DPoint read FTargetPosition write SetTargetPosition;
    property TargetPlatforms  : TT3UnitContainer read FTargetPlatforms write SetTargetPlatforms;
    property OrderedAltitude  : Double read FOrderedAltitude  write SetOrderedAltitude;
    property IDNameBomb : Integer read FIDNameBomb write setIDNameBomb;
    property BombType : Integer read FBombType write SetBombType;     // 1 = bomb udara, 2 = selain itu
    property ShipName : string read FShipName write FShipName;

//    property VerticalSpeed : Double read FVerticalSpeed write FVerticalSpeed;
//    property TargetedTrack : TSimObject read FTargetedTrack write FTargetedTrack;
//    property ParentCourse : Double read FParentCourse write FParentCourse;
//    property OnBombCheckHit : TNotifyEvent read FOnBombCheckHit write FOnBombCheckHit;
//    property BombAktif : Boolean read FBombAktif write FBombAktif;
  end;

  TT3BombONVehicle = class(TT3Weapon)
  private

    FTargetTrack      : string;
    FQuantity         : integer;
    FSalvoSize        : integer;
    FParentPlatformID : integer;
    FTargetPlatformID : integer;

    FButtonLaunch     : Boolean;
    FBombDefinition   : TBomb_Definition;
    FDropWhithoutTarget : Boolean;

    {Sementara g tau gunanya}

    FSalvoCounter     : Integer;
    FOuterRange       : TRangeVisual;
    FInnerRange       : TRangeVisual;
//    FOnSetSalvo       : TOnWeaponSetSalvo;
    FOnBombFire       : TNotifyEvent;
    FOnBombUpdateQuantity : TNotifyEvent;


    function CreateProjectile: TT3Bomb;
    procedure SetQuantity(const Value: integer);
    procedure SetTargetTrack(const Value: string);
    procedure SetParentPlatformID(const Value: integer);
    procedure SetTargetPlatformID(const Value: integer);
    procedure SetButtonLaunch(const Value: Boolean);
    procedure SetSalvoSize(const Value: integer);
    procedure SetDropWhithoutTarget(const Value: boolean);
//    procedure SetOnSetSalvo(const Value: TOnWeaponSetSalvo);

  protected
    MaxRange  : Double;
    MinRange  : Double;
    TipeBomb  : TBombType;
    RocketLauncher  : Boolean;

    function getMountType: integer; override;

  public
    constructor Create; override;

    function PrepareDrop : TT3Bomb;
    function GetSnapshotData : _SS_BombOnVehicle ;

    procedure Initialize; override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv : TCanvas); override;
    procedure SetSnapshotData(const ss : _SS_BombOnVehicle);

    {Sync Button}
    property TargetTrack : string read FTargetTrack write SetTargetTrack;
    property ParentPlatformID : integer read FParentPlatformID write SetParentPlatformID;
    property TargetPlatformID : integer read FTargetPlatformID write SetTargetPlatformID;
    property ButtonLaunch : Boolean read FButtonLaunch write SetButtonLaunch;
    property SalvoSize : integer read FSalvoSize write SetSalvoSize;
    property Quantity : integer read FQuantity write SetQuantity;
    property DropWhithoutTarget: boolean read FDropWhithoutTarget write SetDropWhithoutTarget;

    property BombDefinition : TBomb_Definition read FBombDefinition;

    {Sementara g tau gunanya}
    procedure setOnBombFire(sender : TNotifyEvent);
    property OnBombFire : TNotifyEvent read FOnBombFire write setOnBombFire;
    property OnBombUpdateQuantity : TNotifyEvent read FOnBombUpdateQuantity write FOnBombUpdateQuantity;
  end;

  var
    MapPositionX : Double;
    MapPositionY : Double;
    BombTypes     : Integer;

implementation

uses
  uLibSettingTTT, uBaseCoordSystem, Types, uCoordConvertor, uT3Common, uT3Listener,
  uT3Vehicle, uDBBlind_Zone;

{ TT3Bomb }

constructor TT3BombONVehicle.Create;
begin
  inherited;
  FSalvoSize := 1;
end;

function TT3BombONVehicle.CreateProjectile: TT3Bomb;
var
  projectil  : TT3Bomb;
  tPt   : t3DPoint;
begin
  projectil := TT3Bomb.Create;

  projectil.Parent          := FParent;
  projectil.Owner           := FParent;
  projectil.UnitMotion      := UnitMotion;
  projectil.UnitDefinition  := UnitDefinition;
  projectil.UnitGroup       := UnitGroup;
  projectil.Enable          := Enable;
  projectil.WeaponCategory  := WeaponCategory;
  projectil.Track_ID        := 'BOM';
  projectil.FSalvo          := SalvoSize;
  projectil.TipeBomb        := TipeBomb;
  projectil.isInstructor    := TT3PlatformInstance(Parent).isInstructor;
  projectil.isWasdal        := TT3PlatformInstance(Parent).isWasdal;
  projectil.ShipName        := TT3PlatformInstance(FParent).InstanceName;

  {Harus ada target}
  projectil.TargetObject    := TargetObject;

  if Boolean(BombDefinition.FData.Rocket_Launcher) then
  begin
    tPt.X := MapPositionX;
    tPt.y := MapPositionY;
    tPt.Z := 0;
  end
  else
  begin
    tPt.X := TargetObject.getPositionX;
    tPt.y := TargetObject.getPositionY;
    tPt.Z := TargetObject.getPositionZ;
  end;

//  if projectil.TipeBomb = btRocket then
//  begin
//    tPt.X := MapPositionX;
//    tPt.y := MapPositionY;
//    tPt.Z := 0;
//  end
//  else
//  begin
//    tPt.X := TargetObject.getPositionX;
//    tPt.y := TargetObject.getPositionY;
//    tPt.Z := TargetObject.getPositionZ;
//  end;

  projectil.TargetPosition  := tPt;
  //----------------------------------------------------------------------------

  projectil.Initialize;
  result := projectil;
end;

function TT3BombONVehicle.getMountType: integer;
begin
  result := FBombDefinition.FPoint.FData.Mount_Type;
end;


procedure TT3BombONVehicle.Initialize;
begin
  inherited;

  if Assigned(UnitDefinition) then
    FBombDefinition := TBomb_Definition(UnitDefinition);

  if Assigned(FBombDefinition) then
  begin
    with FBombDefinition do
    begin
      {Masuk tipe bomb apa}
      case FData.Bomb_Type of
        Ord(btBomb) : TipeBomb := btBomb;
        Ord(btDepthCharge) : TipeBomb := btDepthCharge;
        Ord(btRocket) : TipeBomb := btRocket;
      end;

      WeaponCategory := wcBomb;
      InstanceName := FData.Bomb_Identifier;
      Lethality := FData.Lethality;
      MaxRange := FData.Max_Range;
      MinRange := FData.Min_Range;
      InstanceIndex := FPoint.FData.Point_Effect_Index;
      Quantity := FPoint.FData.Quantity;
    end;

    {Sementara g tau gunanya}
    FOuterRange := TRangeVisual.Create;
    FInnerRange := TRangeVisual.Create;
    FOuterRange.mX := PosX;
    FOuterRange.mY := PosY;
    FOuterRange.Range := BombDefinition.FData.Max_Range;
    WeaponRange := BombDefinition.FData.Max_Range;
    FOuterRange.Visible := false;
    FInnerRange.mX := PosX;
    FInnerRange.mY := PosY;
    FInnerRange.Range := BombDefinition.FData.Min_Range;
    FInnerRange.Visible := false;
  end;
end;

function TT3BombONVehicle.PrepareDrop: TT3Bomb;
var
  bomb : TT3Bomb;
begin
  result := nil;

  if not Assigned(TargetObject) then exit;
  if not (Quantity > 0) then exit;

  bomb    := CreateProjectile;
  result  := bomb;

//  Quantity := Quantity - SalvoSize;
end;

procedure TT3BombONVehicle.SetButtonLaunch(const Value: Boolean);
begin
  FButtonLaunch := Value;
end;

procedure TT3BombONVehicle.SetDropWhithoutTarget(const Value: boolean);
begin
  FDropWhithoutTarget := Value;
end;

//procedure TT3BombONVehicle.SetOnSetSalvo(const Value: TOnWeaponSetSalvo);
//begin
//  FOnSetSalvo := Value;
//end;

procedure TT3BombONVehicle.SetParentPlatformID(const Value: integer);
begin
  FParentPlatformID := Value;
end;

procedure TT3BombONVehicle.SetQuantity(const Value: integer);
begin
  if Value <= 0 then
  begin
    if WeaponStatus = wsAvailable then
    begin
      FQuantity     := 0;
      WeaponStatus  := wsUnavailable;
    end;
  end
  else
  begin
    if WeaponStatus <> wsDamaged then
    begin
      FQuantity     := Value;
      WeaponStatus  := wsAvailable;
    end;
  end;

  TriggerListener(Self,psQuantity,FQuantity);

  if Assigned(OnPropertyChange) then
    OnPropertyChange(Self);

end;

procedure TT3BombONVehicle.SetSalvoSize(const Value: integer);
begin
  FSalvoSize := Value;
//  if Assigned(FOnSetSalvo) then
//    FOnSetSalvo(Self,Value);
end;

procedure TT3BombONVehicle.UpdateVisual;
begin
  inherited;
  {update Range double}
  FOuterRange.mX := FPosition.X;
  FOuterRange.mY := FPosition.Y;
  FOuterRange.Color := clRed;
  FOuterRange.Range := WeaponRange;
  FOuterRange.ConvertCoord(Converter);
  FOuterRange.Visible := ShowRange;

  FInnerRange.mX := FPosition.X;
  FInnerRange.mY := FPosition.Y;
  FInnerRange.Color := clRed;
  FInnerRange.Range := WeaponRange;
  FInnerRange.ConvertCoord(Converter);
  FInnerRange.Visible := ShowRange;
end;

procedure TT3BombONVehicle.Draw(aCnv: TCanvas);
begin
  inherited;

  if ShowRangeSelected then
  begin
    FOuterRange.LineStyles := psSolid;
    FOuterRange.Draw(aCnv);
    FInnerRange.LineStyles := psSolid;
    FInnerRange.Draw(aCnv);
  end;

end;

procedure TT3BombONVehicle.setOnBombFire(sender : TNotifyEvent);
begin
  FOnBombFire := sender;
  FSalvoCounter := 0;
end;

function TT3BombONVehicle.GetSnapshotData : _SS_BombOnVehicle ;
var
  i : integer ;
  ss : _SS_BombOnVehicle ;
  ppoh : TBomb_POH_vs_Range;
begin
  if Parent <> nil then
      ss.Owner  := TT3Unit(Parent).InstanceIndex;
  ss.W := TT3Weapon(Self).GetSnapshotData ;
  ss.BombDefinition.FData     := BombDefinition.FData;
  ss.BombDefinition.FBomb_POH := BombDefinition.FBomb_POH;
  ss.BombDefinition.FNote     := BombDefinition.FNote     ;

  {
  SetLength(ss.BombDefinition.FBlind,BombDefinition.FBlind.Count);
  for I := 0 to BombDefinition.FBlind.Count - 1 do
  begin
      blind := TBlind_Zone(BombDefinition.FBlind[i]) ;
      if blind <> nil then
        ss.BombDefinition.FBlind[i].FData := blind.FData;
  end;
  }

  if BombDefinition.FPOH <> nil then begin
  SetLength(ss.BombDefinition.FPOH,BombDefinition.FPOH.Count);
    for I := 0 to BombDefinition.FPOH.Count - 1 do
    begin
        ppoh := TBomb_POH_vs_Range(BombDefinition.FPOH[i]) ;
        if ppoh <> nil then
          ss.BombDefinition.FPOH[i].FData := ppoh.FData;
    end;
  end;

  ss.SalvoSize                := SalvoSize ;
  ss.Quantity                 := Quantity ;
//  ss.State                    := State ;
  Result := ss ;
end;

procedure TT3BombONVehicle.SetSnapshotData(const ss : _SS_BombOnVehicle);
begin
  TT3Weapon(Self).SetSnapshotData(ss.W) ;
  BombDefinition.FData     := ss.BombDefinition.FData;
  BombDefinition.FBomb_POH := ss.BombDefinition.FBomb_POH;
  SalvoSize                := ss.SalvoSize ;
  Quantity                 := ss.Quantity ;
//  State                    := ss.State ;
end;

procedure TT3BombONVehicle.SetTargetPlatformID(const Value: integer);
begin
  FTargetPlatformID := Value;
end;

procedure TT3BombONVehicle.SetTargetTrack(const Value: string);
begin
  FTargetTrack := Value;
end;

{$IFDEF SERVER}
Procedure TT3Bomb.CalcHitSomething;
var
  i  : integer;
  pf : TSimObject;
  range, ketinggian, r, pod : double;
begin
  i := 0;
  CountTarget := 0;

  while (i < FTargetPlatforms.itemCount) do
  begin
    pf := FTargetPlatforms.getObject(i);
    inc(i);

    TT3PlatformInstance(pf).BombHitFlag := False;

    { Jk self diabaikan }
    if (pf = self)then
      continue;

    { Jk platform bukan target yg benar }
    if not TargetCheck(pf) then continue;

    { Jk obyek werk diabaikan }
    if TT3PlatformInstance(pf).Dormant then
      continue;

    { Jk obyek sedang diangkut diabaikan }
    if pf is TT3Vehicle then
    begin
      if TT3Vehicle(pf).StateTransport then
        Continue;
    end;

    {-- POD modifier for each Bomb category }
    range := CalcRange(TT3PlatformInstance(pf).getPositionX, TT3PlatformInstance(pf).getPositionY, FPosition.X,FPosition.Y);

//    if (range > FMaxRange) or (range < FMinRange)  then
//      continue;

    //dibikin range ledakan seluas 500 meter, sedangkan range min max adalah range jangkauan launch bomb
//    if range > (500 * C_Meter_To_NauticalMile) then
//        Continue;

    //dibikin range ledakan setinggi 10 meter
    ketinggian := Abs(TT3PlatformInstance(pf).getPositionZ - FPosition.Z);
    if (ketinggian > 20) then
      continue;

    pod   := getPOH(range);
    r     := 0;
    {-----------------------------------------}

    if (pod > r)then
    begin
      if (pf is TT3Vehicle) or (pf is TT3Weapon)then
      begin
        TT3PlatformInstance(pf).BombHitFlag := True;
        TT3PlatformInstance(pf).BombDamage := pod;
        CountTarget := CountTarget + 1;
      end;
    end;
  end;
end;
{$ENDIF}

procedure TT3Bomb.CalcMovement(aDeltaMs: double);
begin
  FCycleUpdateAltitude := FCycleUpdateAltitude + aDeltaMs;

  if FAltitudeState = mcsIncrease then begin
    if FMover.Z >= FOrderedAltitude then begin
      FMover.Z := FOrderedAltitude;
      FMover.Vertical_Accel := 0.0;
      FMover.VerticalSpeed  := 0.0;
      FMover.ClimbRate      := 0;
      FMover.DescentRate    := 0;
      FAltitudeState        := mcsStable;
    end
  end
  else if FAltitudeState = mcsDecrease then begin
    if FMover.Z <= FOrderedAltitude then begin
      FMover.Z := FOrderedAltitude;
      FMover.Vertical_Accel := 0.0;
      FMover.VerticalSpeed  := 0.0;
      FMover.ClimbRate      := 0;
      FMover.DescentRate    := 0;
      FAltitudeState := mcsStable;
    end;
  end
  else if FAltitudeState = mcsStable then begin
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

constructor TT3Bomb.Create;
begin
  inherited;
  FEngageTarget   := false;
  FAltitudeState  := mcsStable;
  FPOH            := Tlist.Create;
  FMover          := T2DMover.Create;
end;

destructor TT3Bomb.Destroy;
begin
  FTacticalSymbol.Free;
  FMover.Free;

  inherited;
end;

procedure TT3Bomb.Move(const aDeltaMs: double);
{$IFDEF SERVER}
var
  pf    : TSimObject;
  I, J  : Integer;
{$ENDIF}
begin
  inherited;

  if Launched then
  begin
    CalcMovement(aDeltaMs);

    {$IFDEF SERVER}
    FCounter := FCounter + aDeltaMs;

    if FCounter > 4 then
    begin
      if TipeBomb = btDepthCharge then
      begin
        if Altitude < OrderDepth then
          Exit
      end;

      CalcHitSomething;
      i := 0; j := 1;

      while (i < FTargetPlatforms.itemCount) do
      begin
        pf := FTargetPlatforms.getObject(i);
        inc(i);

        if Assigned(pf) then
        begin
          if TT3PlatformInstance(pf).BombHitFlag then
          begin
            TT3PlatformInstance(pf).BombHitFlag := False;
            Launched := false;

            if J = CountTarget then
            begin
              if Assigned(OnHit) then
              begin
                Self.reasonDestroy := 22;
                OnHit(Self,pf,Round(TT3PlatformInstance(pf).BombDamage * Lethality * FSalvo));
                exit;
              end;
            end
            else
            begin
              if Assigned(OnHit) then
              begin
                Self.reasonDestroy := 22;
                OnHit(Self,pf,Round(TT3PlatformInstance(pf).BombDamage * Lethality * FSalvo), False);
              end;
              j := j + 1;
            end;
          end
        end;
      end;

      if Launched then
      begin
        Launched := false;
        if Assigned(OnOut) then
          OnOut(Self,3);
//        FCounter := 0;
      end;

      FCounter := 0;
    end;
    {$ENDIF}
  end;
end;

procedure TT3Bomb.Draw(aCnv: tCanvas);
begin
  inherited;
  if not Visible then exit;

  FTacticalSymbol.isVehicle := false;

  if Launched then begin
    FTacticalSymbol.SpeedVector.Speed   := 0;
    FTacticalSymbol.SpeedVector.Visible := True;
    FTacticalSymbol.SpeedVector.Color   := FTacticalSymbol.Color;
    FTacticalSymbol.SetTextVisibility(Visible);

    {if isInstructor then
      FTacticalSymbol.TextVisual.Text   := '+' + Track_ID
    else
      FTacticalSymbol.TextVisual.Text   := '+' + IntToStr(TrackNumber);}

    FTacticalSymbol.SetTextColor(FTacticalSymbol.Color);
    FTacticalSymbol.Visible             := Visible;
    FTacticalSymbol.Draw(aCnv);

    FSignPlatform.Visible               := Visible;
    FSignPlatform.Color                 := FTacticalSymbol.Color;
    FSignPlatform.Draw(aCnv);
  end;
end;

procedure TT3Bomb.UpdateVisual;
var
  X,Y : integer;
begin
  inherited;
  if not Launched then begin
    Converter.ConvertToScreen(FPosition.X, FPosition.Y,X,Y);
  end else begin
    Converter.ConvertToScreen(FMover.X, FMover.Y, X, Y);
  end;

  FTacticalSymbol.Center := Point(X, Y);
  FTacticalSymbol.SpeedVector.Course := ConvCartesian_To_Compass(FMover.Direction);
  FTacticalSymbol.ConvertCoord(Converter);
end;

procedure TT3Bomb.Initialize;
var
  color     : TCOlor;
  symbol    : string;
begin
  inherited;
  if not (Assigned(FParent)) then
    Exit;

//  if TipeBomb = btRocket then
//  begin
//    FMover.X := MapPositionX;
//    FMover.Y := MapPositionY;
//    FMover.Z := FParent.getPositionZ;
//  end
//  else
//  begin
//    FMover.X := FParent.getPositionX;
//    FMover.Y := FParent.getPositionY;
//    FMover.Z := FParent.getPositionZ;
//  end;

  FBombDefinition   := TBomb_Definition(UnitDefinition);

  if Boolean(FBombDefinition.FData.Rocket_Launcher) then
  begin
    FMover.X := MapPositionX;
    FMover.Y := MapPositionY;
    FMover.Z := FParent.getPositionZ;
  end
  else
  begin
    FMover.X := FParent.getPositionX;
    FMover.Y := FParent.getPositionY;
    FMover.Z := FParent.getPositionZ;
  end;

  FPosition.X     := FMover.X;
  FPosition.y     := FMover.Y;
  FPosition.Z     := FMover.Z;

  FMover.Enabled  := true;
  FAltitudeState  := mcsStable;

  FPlatformDomain := 2;
  FMover.VerticalSpeed := -10;

  if isInstructor then
    symbol := getCorrectSymbol(TT3PlatformInstance(Parent).PlatformDomain,
              TT3PlatformInstance(Parent).PlatformType,
              TT3PlatformInstance(Parent).Force_Designation, color)
  else
    symbol := getCorrectSymbol(FPlatformDomain, PlatformType, 3, color);

  FTacticalSymbol       := TTacticalSymbol.Create;
  FSignPlatform         := TTextVisual.Create;

  FTacticalSymbol.SymbolVisual.FontName := 'atct';
  FTacticalSymbol.SymbolVisual.CharSymbol := 'f';
  FTacticalSymbol.Color := color;
//  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'Bomb.bmp',color);

  if (UnitDefinition is TBomb_Definition) then
  with TBomb_Definition(UnitDefinition) do begin
    InstanceIndex     := FData.Bomb_Index;
    InstanceName      := FData.Bomb_Identifier;
    Lethality         := FData.Lethality;
    FMaxRange         := FData.Max_Range;
    FMinRange         := FData.Min_Range;
  end;
end;

procedure TT3Bomb.RepositionTo(const x, y: double);
begin
  inherited;
  FMover.X := X;
  FMover.Y := Y;
end;

procedure TT3Bomb.SetAltitude(const Value: single);
begin
  inherited;
  FMover.Z := Value / (C_Degree_To_NauticalMile * C_NauticalMile_To_Metre);
end;

procedure TT3Bomb.SetBombType(const Value: Integer);
begin
  FBombType := Value;
end;

procedure TT3Bomb.setIDNameBomb(const Value: Integer);
begin
  FIDNameBomb := Value;
end;

procedure TT3Bomb.SetLaunched(const Value: boolean);
begin
  inherited;
  if Value then begin

    if Assigned(UnitMotion) then begin
      FMover.Acceleration := UnitMotion.FData.Acceleration;
      FMover.MaxSpeed     := UnitMotion.FData.Max_Ground_Speed;
    end;

    {Posisi Awal}
    {diset saat initialize Mine}

    {Kedalaman Awal}
    if Assigned(FParent) then begin
      if (TT3PlatformInstance(Parent).PlatformDomain = 2)then
        Self.Altitude   := TT3PlatformInstance(FParent).Altitude
      else
        Self.Altitude   := 0;
    end;

    OrderedAltitude := OrderDepth;
//    SetOrderedAltitude(OrderDepth);
  end;
end;

procedure TT3Bomb.SetOrderedAltitude(const Value: double);
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
      FMover.ClimbRate      := 50;
      FMover.Vertical_Accel := 50;
      FAltitudeState        := mcsIncrease;
    end
    else begin
      FMover.DescentRate    := 50;
      FMover.Vertical_Accel := 50;
      FAltitudeState        := mcsDecrease;
    end;
  end;
end;

procedure TT3Bomb.SetOwner(const Value: TSimObject);
begin
//
end;

procedure TT3Bomb.Launch;
begin
  if FLaunch then exit;

  FLaunch := true;
  Visible := True;

  FMover.VerticalSpeed := -20 ;
  FMover.DescentRate := -20;

end;

function TT3Bomb.getAltitude: single;
begin
  Result := FMover.Z  * C_Degree_To_NauticalMile * C_NauticalMile_To_Metre;
end;

procedure TT3Bomb.setPositionX(const v: double);
begin
  inherited;
  FMover.X := v;
end;

procedure TT3Bomb.setPositionY(const v: double);
begin
  inherited;
  FMover.Y := v;
end;

procedure TT3Bomb.setPositionZ(const v: double);
begin
  inherited;
  FMover.Z := v;
end;

procedure TT3Bomb.SetSelected(const Value: boolean);
var
  col: TColor;
begin
//  col := FTacticalSymbol.Symbol.color;
  FTacticalSymbol.Selected := Value;
  FTacticalSymbol.color := col;
//  FTacticalSymbol.Symbol.Visible := true;
//  FTacticalSymbol.Symbol.color := col;

  FSelected := Value;

  if Assigned(FOnSelected) then
    FOnSelected(Self);
end;

procedure TT3Bomb.SetTargetPlatforms(const Value: TT3UnitContainer);
begin
  FTargetPlatforms := Value;
end;

procedure TT3Bomb.SetTargetPosition(const Value: t3DPoint);
begin
  FTargetPosition := Value;
end;

{$IFDEF SERVER}
function TT3Bomb.TargetCheck(target: TSimObject): boolean;
var
  validTarget : boolean;
begin
  validTarget := False;

 { if (BombDefinition.FData.Anti_Sur_Capable = 1 )
    and (BombDefinition.FData.Anti_Land_Capable = 1 ) then
  begin
    validTarget := ( TT3PlatformInstance(target).PlatformDomain = 1 ) or
                   ( TT3PlatformInstance(target).PlatformDomain = 3 );
  end
  else if (BombDefinition.FData.Anti_SubSur_Capable = 1 ) then
    validTarget := ( TT3PlatformInstance(target).PlatformDomain = 2 )
  else if (BombDefinition.FData.Anti_Sur_Capable = 1 ) then
    validTarget := ( TT3PlatformInstance(target).PlatformDomain = 1 )
  else if (BombDefinition.FData.Anti_Land_Capable = 1 ) then
    validTarget := ( TT3PlatformInstance(target).PlatformDomain = 3 );  }

  validTarget := not ( TT3PlatformInstance(target).PlatformDomain = vhdAir );

  result := validTarget;
end;
{$ENDIF}

function TT3Bomb.getPOH(range: Double): Double;
var
  I: Integer;
  pohVsRange : TBomb_POH_vs_Range;
begin
  Result := 0;
  for I := 0 to FBombDefinition.FPOH.Count - 1 do
  begin
    pohVsRange := FBombDefinition.FPOH.Items[I];
    if range <= pohVsRange.FData.Range then
    begin
      if Result < pohVsRange.FData.Prob_of_Hit then
        Result := pohVsRange.FData.Prob_of_Hit;
    end;
  end;
end;

function TT3Bomb.GetSnapshotData : _SS_TT3Bomb ;
var
    i    : integer ;
    ss   : _SS_TT3Bomb ;
    ppoh :  TBomb_POH_vs_Range ;
begin
    ss.W := TT3Weapon(Self).GetSnapshotData ;

//    SetLength(ss.TargetPlatforms,TargetPlatforms.itemCount);
//    for I := 0 to TargetPlatforms.itemCount - 1 do begin
//        ss.TargetPlatforms[i].InstanceIndex  := TT3Unit(TargetPlatforms).InstanceIndex ;
//    end;
    ss.TargetPosition   := TargetPosition  ;
//    ss.DescentRate      := DescentRate ;
//    ss.AscentRate       := AscentRate ;
//    ss.ParentCourse     := ParentCourse ;
//    ss.VerticalSpeed    := VerticalSpeed ;
    ss.OrderDepth       := OrderDepth ;
    if Parent <> nil then
      ss.Owner          := TT3Unit(Parent).InstanceIndex ;
    if owner <> nil then
      ss.Owner          := TT3Unit(owner).InstanceIndex ;

//    ss.TargetedTrack    := TT3Unit(TargetedTrack).InstanceIndex ;
    ss.State                := byte(TipeBomb) ;

    ss.BombDefinition.FData := BombDefinition.FData ;
    ss.BombDefinition.FBomb_POH := BombDefinition.FBomb_POH ;
    if UnitDefinition is TBomb_Definition then
    begin
      if BombDefinition.FPOH <> nil then begin
        SetLength(ss.BombDefinition.FPOH,BombDefinition.FPOH.Count);
        for I := 0 to BombDefinition.FPOH.Count - 1 do
        begin
            ppoh := TBomb_POH_vs_Range(BombDefinition.FPOH[i]) ;
            if ppoh <> nil then
              ss.BombDefinition.FPOH[i].FData := ppoh.FData;
        end;
      end;
    end;
    ss.BombDefinition.FNote := BombDefinition.FNote ;
//    ss.BombAktif := BombAktif ;
    Result := ss ;
end;

procedure TT3Bomb.SetSnapshotData(const ss : _SS_TT3Bomb);
var

    i  : integer ;
    poh : TBomb_POH_vs_Range;
begin
    TT3Weapon(Self).SetSnapshotData(ss.W) ;


    TargetPosition       := ss.TargetPosition  ;
//    DescentRate          := ss.DescentRate ;
//    AscentRate           := ss.AscentRate ;
//    ParentCourse         := ss.ParentCourse ;
//    VerticalSpeed        := ss.VerticalSpeed ;
    OrderDepth           := ss.OrderDepth ;


    TipeBomb                    := TBombType(ss.State) ;
    BombDefinition.FData      := ss.BombDefinition.FData ;
    BombDefinition.FBomb_POH  := ss.BombDefinition.FBomb_POH ;

    if BombDefinition.FPOH <> nil then
    begin
      for I := low(ss.BombDefinition.FPOH) to high(ss.BombDefinition.FPOH) do begin
          poh := TBomb_POH_vs_Range.Create;
          poh.FData := ss.BombDefinition.FPOH[i].FData ;
          BombDefinition.FPOH.Add(poh);
      end;
    end;
    BombDefinition.FNote := ss.BombDefinition.FNote ;
//    BombAktif := ss.BombAktif ;


end;

end.
