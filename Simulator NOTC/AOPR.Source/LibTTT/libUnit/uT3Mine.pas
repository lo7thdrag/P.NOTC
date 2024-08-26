unit uT3Mine;

interface

uses uT3Weapon, tttData, uDBAsset_Weapon, uObjectVisuals, uT3UnitContainer,
  SysUtils,uDBBlind_Zone, uSimObjects, uT3Bomb, uDataTypes, Graphics, uDBAssetObject,
  Classes, u2DMover, uSnapshotData, Windows;

type
  TMineCategory = (mcAcoustic, mcImpact, mcMagnetic, mcPressure);
  TMineMooring  = (mmFixed, mmFloating);
  TMineDetectability = (mdNormalDetection, mdundetectable, mdPassiveDetection, mdAlwaysVisible);
  TMoveChangeState   = (mcsStable, mcsIncrease, mcsDecrease);

  TT3Mine = class(TT3Bomb)
  private
    FCounter          : Double;
    FOrderedAltitude  : Double;
    FMover            : T2DMover;
    FOwner            : TSimObject;
//    FMineDefinition   : TMine_On_Board;
    FAltitudeState    : TMoveChangeState;
    FTargetPlatforms  : TT3UnitContainer;
    FCycleUpdateAltitude    : double;
    FRangeArea: Double;
    FCountMine: Integer;
    FMineType: Byte;
    FIDNameMine: Integer;

    {$IFDEF SERVER}
    function TargetCheck(target: TSimObject): boolean;
    Procedure CalcHitSomething;
    {$ENDIF}

    procedure SetOwner(const Value: TSimObject);
    procedure SetOrderedAltitude(const Value : double);
    procedure SetTargetPlatforms(const Value: TT3UnitContainer);

    procedure SetRangeArea(const Value: Double);
    procedure SetCountMine(const Value: Integer);

    procedure SetMineType(const Value: Byte);

    procedure setIDNameMine(const Value: Integer);  protected
    MineCategory : TMineCategory;
    MineMooring  : TMineMooring;
    MineDetectability : TMineDetectability;

    FMineArea : TRectAreaVisual;

    function  getAltitude: single; override;
    procedure CalcMovement(aDeltaMs: double); override;
    procedure setPos(const Index: Integer; const Value: double); override;
    procedure SetLaunched(const Value: boolean);override;
    procedure SetAltitude(const Value: single); override;

  public
    CountTarget : Integer;
    EngageRange : Double;

    constructor Create; override;
    destructor Destroy; override;

    function getPOD(range : Double): Double;
    function GetSnapshotData : _SS_TT3Mine ;
    procedure SetSnapshotData(const ss : _SS_TT3Mine);

    procedure Move(const aDeltaMs: double); override;
    procedure Draw(aCnv: TCanvas); override;
    procedure UpdateVisual ; override;
    procedure Initialize; override;

    procedure SetSelected(Const Value: boolean); override;
    procedure RepositionTo(const x, y: double); override;
    procedure setPositionX(const v: double); override;
    procedure setPositionY(const v: double); override;
    procedure setPositionZ(const v: double); override;
    procedure SetFreeMe(const Value: boolean); override;

    property TargetPlatforms  : TT3UnitContainer read FTargetPlatforms write SetTargetPlatforms;
    property OrderedAltitude  : double read FOrderedAltitude  write SetOrderedAltitude;
//    property MineDefinition   : TMine_On_Board read FMineDefinition;
    property Mover  : T2DMover read FMover write FMover;
    property RangeArea : Double read FRangeArea write SetRangeArea;
    property CountMine : Integer Read FCountMine write SetCountMine;
    property MineType : Byte read FMineType write SetMineType;  // 0 ranjau water, 1 ranjau land
    property IDNameMine : Integer read FIDNameMine write setIDNameMine;


//    property Owner  : TSimObject read FOwner write SetOwner;

  end;

  TT3MineOnVehicle = class(TT3Weapon)
  private
    FTargetTrack      : string;
    FParentPlatformID : integer;
    FTargetPlatformID : integer;
    FDepth            : integer;
    FButtonLaunch     : Boolean;

    FQuantity   : integer;
    FMineDefinition   : TMine_On_Board;
    FOnUpdateQuantity : TNotifyEvent;

    function CreateMines: TT3Mine;
    procedure SetQuantity(const Value: integer);
    procedure SetDepth (const Value: integer);
    procedure SetTargetTrack(const Value: string);
    procedure SetParentPlatformID(const Value: integer);
    procedure SetTargetPlatformID(const Value: integer);
    procedure SetButtonLaunch(const Value: Boolean);

  protected
    EngageRange  : Double;
    MineCategory : TMineCategory;
    MineMooring  : TMineMooring;
    MineDetectability : TMineDetectability;

    function getMountType: integer; override;

  public
    constructor Create; override;

    function PrepareDrop : TT3Mine;
    function GetSnapshotData : _SS_MineOnVehicle ;

    procedure Initialize;override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure SetSnapshotData(const ss : _SS_MineOnVehicle);

    {Sync Button}
    property TargetTrack : string read FTargetTrack write SetTargetTrack;
    property ParentPlatformID : integer read FParentPlatformID write SetParentPlatformID;
    property TargetPlatformID : integer read FTargetPlatformID write SetTargetPlatformID;
    property Depth : integer read FDepth write SetDepth;
    property ButtonLaunch : Boolean read FButtonLaunch write SetButtonLaunch;

    property Quantity   : integer read FQuantity write SetQuantity;
    property MineDefinition   : TMine_On_Board read FMineDefinition;
    property OnUpdateQuantity : TNotifyEvent read FOnUpdateQuantity write FOnUpdateQuantity;

  end;

implementation

uses
  uT3Unit, uT3Vehicle, uLibSettingTTT, uT3Common, uBaseCoordSystem, uT3Listener,
  uDBAsset_Scripted;

//{ TT3Mine }
//=========================================================================================
//=========================================================================================

{$IFDEF SERVER}
Procedure TT3Mine.CalcHitSomething;
var
  i  : integer;
  pf : TSimObject;
  range, r, pod : double;
  pohMod, mpod  : double;

  arect : TRect;
  posX1, posY1, posX2, posY2, posXtarget, posYTarget : Integer;
  dx, dy: double;
  rDegreeX, rDegreeY : double;
  pt : TPoint;
  ptTarget : t2DPoint;
  prosentasePerkenaan, RangeHit, RangTotalArea : Double;

  p,s : integer;
begin
  i := 0;
  CountTarget := 0;

  while (i < FTargetPlatforms.itemCount) do
  begin
    pf := FTargetPlatforms.getObject(i);
    inc(i);

    if Assigned(pf) then
    begin
      TT3PlatformInstance(pf).MineHitFlag := False;

      { Jk self diabaikan }
      if (pf = self) or (pf is TT3Bomb)then
        continue;

      { Jk Parent diabaikan }
      if pf = Owner then
        continue;

      { Jk platform bukan target yg benar }
  //    if not TargetCheck(pf) then continue;     //andik, sementara tak komen, soalnya biar tipe land juga bisa meledak (belum punya data ranjau darat)

       if TT3PlatformInstance(pf).PlatformDomain = 0 then     //tipe udara abaikan
        continue;


      { Jk obyek werk diabaikan }
      if TT3PlatformInstance(pf).Dormant then
        continue;

      {-- POH modifier for each Mine category }
      range := CalcRange(TT3PlatformInstance(pf).getPositionX, TT3PlatformInstance(pf).getPositionY, FPosition.X,FPosition.Y);

      if {((Range*C_NauticalMile_To_Metre) <= RangeArea) or }((range *  C_NauticalMile_To_Metre) <= 50) then  // anggapan jangkauan mine minimal 20 meter
      begin
        {pod := getPOD(range);          // cendol andik >> pake perhitungan sendiri dengan range area mine 20 meter

        pohMod := 0;
        if (pf is TT3Vehicle)then
        begin
          case MineCategory of
            mcAcoustic  : pohMod := TT3Vehicle(pf).VehicleDefinition.FData.Acoustic_Mine_POH_Modifier;
            mcImpact    : pohMod := TT3Vehicle(pf).VehicleDefinition.FData.Impact_Mine_POH_Modifier;
            mcMagnetic  : pohMod := TT3Vehicle(pf).VehicleDefinition.FData.Mag_Mine_POH_Modifier;
            mcPressure  : pohMod := TT3Vehicle(pf).VehicleDefinition.FData.Press_Mine_POH_Modifier;
          end;
        end;

        mpod := ((pod*100) - pohMod)/100; }

       { r    := Random;

        RangeHit := (20*20)*3.14; //anggapan radius hit 20 meter    >> 1256
        RangTotalArea := (RangeArea*RangeArea)*3.14;
        prosentasePerkenaan := ((CountMine * RangeHit)/RangTotalArea);  }

        {if prosentasePerkenaan < 0.5 then
          prosentasePerkenaan := 0.5;  }
        {-----------------------------------------}

  //      if {(r <= mpod)} prosentasePerkenaan > r then
  //      begin
          if (pf is TT3Vehicle) or (pf is TT3Weapon)then
          begin
            TT3PlatformInstance(pf).MineHitFlag := True;
            CountTarget := CountTarget + 1;
          end;
  //      end;
      end;
    end;
  end;
end;
{$ENDIF}

procedure TT3Mine.CalcMovement(aDeltaMs: double);
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

constructor TT3Mine.Create;
begin
  inherited;
  FMover          := T2DMover.Create;
  FAltitudeState  := mcsStable;
  FNeedAdjust     := true;
  FCounter        := 0;
  FCycleUpdateAltitude := 2.00;
  FMineArea := TRectAreaVisual.Create;
end;

destructor TT3Mine.Destroy;
begin
  inherited;
end;

procedure TT3Mine.Move(const aDeltaMs: Double);
{$IFDEF SERVER}
var
  pf        : TSimObject;
  I, J      : Integer;
{$ENDIF}
begin
  Self.InheritsFrom(TT3Weapon);

  if FreeMe then
    Exit;

  if Launched then
  begin
    CalcMovement(aDeltaMs);

    if Altitude < OrderDepth then
      Exit ;

    {$IFDEF SERVER}
    FCounter := FCounter + aDeltaMs;
    if FCounter > 5 {Self.GameDefaults.FData.POD_Check_Time} then
    begin
      CalcHitSomething;
      i := 0; j := 1;

      while (i < FTargetPlatforms.itemCount) do
      begin
        pf := FTargetPlatforms.getObject(i);
        inc(i);

        if Assigned(pf) then
        begin
          if TT3PlatformInstance(pf).MineHitFlag then
          begin
            TT3PlatformInstance(pf).MineHitFlag := False;

            if CountMine <= 0 then
              Launched := false;

            if J = CountTarget then
            begin
              if TT3PlatformInstance(pf).PlatformCategory = 6 then
              begin
                if Assigned(OnHit) then
                begin
                  Self.reasonDestroy := 22;
                  OnHit(Self,pf,0);
                  exit;
                end;
              end
              else
              begin
                if Assigned(OnHit) then
                begin
                  Self.reasonDestroy := 22;
                  OnHit(Self,pf,Round(Lethality));
                  exit;
                end;
              end;
            end
            else
            begin
              if TT3PlatformInstance(pf).PlatformCategory = 6 then
              begin
                if Assigned(OnHit) then
                begin
                  Self.reasonDestroy := 22;
                  OnHit(Self,pf,0, False);
                  exit;
                end;
              end
              else
              begin
                if Assigned(OnHit) then
                begin
                  Self.reasonDestroy := 22;
                  OnHit(Self,pf,Round(Lethality), False);
                end;
              end;

              j := j + 1;
            end;

            Sleep(100);
          end
        end;

      end;
      FCounter := 0;
    end;
    {$ENDIF}
  end;
end;

{$IFDEF SERVER}
function TT3Mine.TargetCheck(target: TSimObject): boolean;
var
  validTarget : boolean;
begin
  validTarget := False;

  if UnitDefinition is TMine_On_Board then begin
    if (TMine_On_Board(UnitDefinition).FMine_Def.Anti_Sur_Capable = 1 )
      and (TMine_On_Board(UnitDefinition).FMine_Def.Anti_SubSur_Capable = 1 ) then
    begin
      validTarget := ( TT3PlatformInstance(target).PlatformDomain = 1 ) or
                     ( TT3PlatformInstance(target).PlatformDomain = 2 );
    end
    else if (TMine_On_Board(UnitDefinition).FMine_Def.Anti_SubSur_Capable = 1 ) then
      validTarget := ( TT3PlatformInstance(target).PlatformDomain = 2 )
    else if (TMine_On_Board(UnitDefinition).FMine_Def.Anti_Sur_Capable = 1 ) then
      validTarget := ( TT3PlatformInstance(target).PlatformDomain = 1 );
  end else

  if UnitDefinition is TMine_Definition then begin
    if (TMine_Definition(UnitDefinition).FData.Anti_Sur_Capable = 1 )
      and (TMine_Definition(UnitDefinition).FData.Anti_SubSur_Capable = 1 ) then
    begin
      validTarget := ( TT3PlatformInstance(target).PlatformDomain = 1 ) or
                     ( TT3PlatformInstance(target).PlatformDomain = 2 );
    end
    else if (TMine_Definition(UnitDefinition).FData.Anti_SubSur_Capable = 1 ) then
      validTarget := ( TT3PlatformInstance(target).PlatformDomain = 2 )
    else if (TMine_Definition(UnitDefinition).FData.Anti_Sur_Capable = 1 ) then
      validTarget := ( TT3PlatformInstance(target).PlatformDomain = 1 );
  end;

  result := validTarget;
end;
{$ENDIF}

procedure TT3Mine.RepositionTo(const x, y: double);
begin
  inherited;

  FMover.X := X;
  FMover.Y := Y;
end;

procedure TT3Mine.SetAltitude(const Value: single);
begin
  inherited;
  FMover.Z := Value/(C_Degree_To_NauticalMile * C_NauticalMile_To_Metre);
end;

procedure TT3Mine.SetCountMine(const Value: Integer);
begin
  FCountMine := Value;
end;

procedure TT3Mine.SetFreeMe(const Value: boolean);
begin
  inherited;
  if Assigned(OnFreeMe) then
    OnFreeMe(Self, Value);
end;

procedure TT3Mine.setIDNameMine(const Value: Integer);
begin
  FIDNameMine := Value;
end;

procedure TT3Mine.SetRangeArea(const Value: Double);
begin
  FRangeArea := Value;
end;

procedure TT3Mine.SetLaunched(const Value: boolean);
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
  end;
end;

procedure TT3Mine.SetMineType(const Value: Byte);
begin
  FMineType := Value;
end;

procedure TT3Mine.SetOrderedAltitude(const Value: double);
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

procedure TT3Mine.SetOwner(const Value: TSimObject);
begin
  FOwner := Value;
end;

procedure TT3Mine.setPos(const Index: Integer; const Value: double);
begin
  inherited;
  case Index of
    1: FMover.Direction := ConvCompass_To_Cartesian(Value);
    2: FMover.Speed := Value;
  end;
end;

procedure TT3Mine.setPositionX(const v: double);
begin
  inherited;
  FMover.X := v;
end;

procedure TT3Mine.setPositionY(const v: double);
begin
  inherited;
  FMover.Y := v;
end;

procedure TT3Mine.setPositionZ(const v: double);
begin
  inherited;
  FMover.Z := v;
end;

procedure TT3Mine.SetSelected(const Value: boolean);
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

procedure TT3Mine.SetTargetPlatforms(const Value: TT3UnitContainer);
begin
  FTargetPlatforms := Value;
end;

procedure TT3Mine.UpdateVisual;
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

  FMineArea.ConvertCoord(Converter);
end;

procedure TT3Mine.Draw(aCnv: tCanvas);
begin
  inherited;

  FTacticalSymbol.isVehicle := false;

  if not Visible then exit;

  if Launched then begin
    FTacticalSymbol.SpeedVector.Speed   := 0;
    FTacticalSymbol.SpeedVector.Visible := True;
    FTacticalSymbol.SpeedVector.Color   := FTacticalSymbol.Color;
    FTacticalSymbol.SetTextVisibility(Visible);

    if isInstructor then
      FTacticalSymbol.CallSign1   := '+' + Track_ID
    else
      FTacticalSymbol.CallSign1   := '+' + IntToStr(TrackNumber);

    FTacticalSymbol.SetTextColor(FTacticalSymbol.Color);
    FTacticalSymbol.Visible             := Visible;
    FTacticalSymbol.Draw(aCnv);

    FSignPlatform.Visible               := Visible;
    FSignPlatform.Color                 := FTacticalSymbol.Color;
    FSignPlatform.Draw(aCnv);

    FMineArea.Range := RangeArea * C_Meter_To_NauticalMile;
    FMineArea.LineStyles := psSolid;
//    FMineArea.Draw(aCnv);         //draw area tidak dipakai dahulu
  end;
end;

procedure TT3Mine.Initialize;
var
  color   : TCOlor;
  symbol  : string;
begin
  inherited;

  if Assigned(FParent) then begin
    FMover.X := FParent.getPositionX;
    FMover.Y := FParent.getPositionY;
    FMover.Z := FParent.getPositionZ;
  end else begin
    FMover.X := UnitActivation.Init_Position_Longitude;
    FMover.Y := UnitActivation.Init_Position_Latitude;
    FMover.Z := UnitActivation.Init_Altitude;
  end;

  FPosition.X     := FMover.X;
  FPosition.y     := FMover.Y;
  FPosition.Z     := FMover.Z;

  FMover.Enabled  := true;
  FAltitudeState  := mcsStable;

//  if UnitDefinition is TMine_On_Board then
//    FMineDefinition := TMine_On_Board(UnitDefinition);

  FPlatformDomain := 2;

  if isInstructor then
  begin
    if Assigned(Parent) then
      symbol := getCorrectSymbol(TT3PlatformInstance(Parent).PlatformDomain,
                TT3PlatformInstance(Parent).PlatformType,
                TT3PlatformInstance(Parent).Force_Designation, color)
    else begin
      symbol := getCorrectSymbol(FPlatformDomain, PlatformType, Force_Designation, color);
    end;
  end
  else
  begin
    symbol := getCorrectSymbol(FPlatformDomain, PlatformType, 3, color);
  end;

  FTacticalSymbol       := TTacticalSymbol.Create;
  FSignPlatform         := TTextVisual.Create;
  FTacticalSymbol.SymbolVisual.FontName := 'atct';
  FTacticalSymbol.SymbolVisual.CharSymbol := '\';
  FTacticalSymbol.Color := color;
//  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + 'MineFriend.bmp',color);

  FMineArea := TRectAreaVisual.Create;
  FMineArea.mX := PosX;
  FMineArea.mY := PosY;
  FMineArea.Color := clRed;

  if Assigned(UnitDefinition) and (UnitDefinition is TMine_On_Board)then
  with TMine_On_Board(UnitDefinition) do begin
    InstanceIndex     := FData.Fitted_Weap_Index;
    InstanceName      := FData.Instance_Identifier;
    Lethality         := FMine_Def.Mine_Lethality;
    DetectabilityType := FMine_Def.Detectability_Type;
    EngageRange       := FMine_Def.Engagement_Range;

    TBomb_Definition(UnitDefinition).FPOH := nil;
  end;
end;

function TT3Mine.getAltitude: single;
begin
  Result := FMover.Z * C_Degree_To_NauticalMile * C_NauticalMile_To_Metre;
end;

function TT3Mine.getPOD(range: Double): Double;
var
  I: Integer;
  podVsRange : TMine_POD_vs_Range;
begin
  Result := 0;
  if UnitDefinition is TMine_On_Board then begin
    for I := 0 to TMine_On_Board(UnitDefinition).FPOD.Count - 1 do
    begin
      podVsRange := TMine_On_Board(UnitDefinition).FPOD.Items[I];
      if range <= podVsRange.FData.Range then
      begin
        if Result < podVsRange.FData.Prob_of_Detonation then
          Result := podVsRange.FData.Prob_of_Detonation;
      end;
    end;
  end else
  if UnitDefinition is TMine_Definition then begin
    for I := 0 to TMine_Definition(UnitDefinition).FPOD.Count - 1 do
    begin
      podVsRange := TMine_Definition(UnitDefinition).FPOD.Items[I];
      if range <= podVsRange.FData.Range then
      begin
        if Result < podVsRange.FData.Prob_of_Detonation then
          Result := podVsRange.FData.Prob_of_Detonation;
      end;
    end;
  end;
end;

function TT3Mine.GetSnapshotData : _SS_TT3Mine ;
var
  i : integer;
  ss: _SS_TT3Mine;
  weaponScript  : TScripted_Weapon;
  pattern       : TPattern_Weapon;
  blind         : TBlind_Zone;
  pod           : TMine_POD_vs_Range;
begin
  ss.B := TT3Bomb(Self).GetSnapshotData;
  pattern := nil;

  ss.OrderedAltitude          := OrderedAltitude;
  if UnitDefinition is TMine_On_Board then begin
    ss.MineDefinition.FData     := TMine_On_Board(UnitDefinition).FData;
    ss.MineDefinition.FMine_Def := TMine_On_Board(UnitDefinition).FMine_Def;
    ss.MineDefinition.FMine_POD := TMine_On_Board(UnitDefinition).FMine_POD;
    ss.MineDefinition.FNote     := TMine_On_Board(UnitDefinition).FNote;
  end else
  if UnitDefinition is TMine_Definition then begin
//    ss.MineDefinition.FData     := TMine_On_Board(UnitDefinition).FData;
    ss.MineDefinition.FMine_Def := TMine_Definition(UnitDefinition).FData;
//    ss.MineDefinition.FMine_POD := TMine_On_Board(UnitDefinition).FMine_POD;
//    ss.MineDefinition.FNote     := TMine_On_Board(UnitDefinition).FNote;
  end;

  if UnitDefinition is TMine_On_Board then begin
    if TMine_On_Board(UnitDefinition).FScript_Mine <> nil then
    begin
      SetLength(ss.MineDefinition.FScript_Mine,TMine_On_Board(UnitDefinition).FScript_Mine.Count);

      for I := 0 to TMine_On_Board(UnitDefinition).FScript_Mine.Count - 1 do
      begin
        weaponScript := TScripted_Weapon(TMine_On_Board(UnitDefinition).FScript_Mine[i]);
        if weaponScript <> nil then
        begin
          ss.MineDefinition.FScript_Mine[i].Event := weaponScript.Event.FData;
          ss.MineDefinition.FScript_Mine[i].Behav := weaponScript.Behav.FData;
        end;
      end;
    end;

    if TMine_On_Board(UnitDefinition).FPattern_Mine <> nil then
    begin
      SetLength(ss.MineDefinition.FPattern_Mine,TMine_On_Board(UnitDefinition).FPattern_Mine.Count);

      for I := 0 to TMine_On_Board(UnitDefinition).FPattern_Mine.Count - 1 do
      begin
        pattern := TPattern_Weapon(TMine_On_Board(UnitDefinition).FPattern_Mine[i]);

        if pattern <> nil then
        begin
          ss.MineDefinition.FPattern_Mine[i].Event := pattern.Event.FData;
          ss.MineDefinition.FPattern_Mine[i].Pattern := pattern.Pattern.FData;
        end;
      end;
    end;

    if TMine_On_Board(UnitDefinition).FBlind <> nil then
    begin
      SetLength(ss.MineDefinition.FBlind,TMine_On_Board(UnitDefinition).FBlind.Count);

      for I := 0 to TMine_On_Board(UnitDefinition).FBlind.Count - 1 do
      begin
        blind := TBlind_Zone(TMine_On_Board(UnitDefinition).FBlind[i]) ;

        if pattern <> nil then
          ss.MineDefinition.FBlind[i].FData := blind.FData;
      end;
    end;
  end;

  if UnitDefinition is TMine_On_Board then begin
    if TMine_On_Board(UnitDefinition).FPOD <> nil then
    begin
      SetLength(ss.MineDefinition.FPOD,TMine_On_Board(UnitDefinition).FPOD.Count);

      for I := 0 to TMine_On_Board(UnitDefinition).FPOD.Count - 1 do
      begin
        pod := TMine_POD_vs_Range(TMine_On_Board(UnitDefinition).FPOD[i]);

        if pod <> nil then
          ss.MineDefinition.FPOD[i].FData := pod.FData;
      end;
    end;
  end else
  if UnitDefinition is TMine_Definition then begin
    if TMine_Definition(UnitDefinition).FPOD <> nil then
    begin
      SetLength(ss.MineDefinition.FPOD,TMine_Definition(UnitDefinition).FPOD.Count);

      for I := 0 to TMine_Definition(UnitDefinition).FPOD.Count - 1 do
      begin
        pod := TMine_POD_vs_Range(TMine_Definition(UnitDefinition).FPOD[i]);

        if pod <> nil then
          ss.MineDefinition.FPOD[i].FData := pod.FData;
      end;
    end;
  end;

  if UnitDefinition is TMine_On_Board then begin
    ss.MineDefinition.FVehicle.FData           := TMine_On_Board(UnitDefinition).FVehicle.FData;
    ss.MineDefinition.FVehicle.FPlatform_Ident := TMine_On_Board(UnitDefinition).FVehicle.FPlatform_Ident;
    ss.MineDefinition.FVehicle.FHeliLimitation := TMine_On_Board(UnitDefinition).FVehicle.FHeliLimitation;
  end;

  if (Parent<>nil) then
    ss.Owner := TT3Unit(Parent).InstanceIndex;
  if (Owner<>nil) then
    ss.Owner := TT3Unit(Owner).InstanceIndex;

  Result := ss;
end;

procedure TT3Mine.SetSnapshotData(const ss : _SS_TT3Mine);
begin
  TT3Bomb(Self).SetSnapshotData(ss.B) ;
  TMine_On_Board(UnitDefinition).FData                       := ss.MineDefinition.FData ;
  TMine_On_Board(UnitDefinition).FMine_Def                   := ss.MineDefinition.FMine_Def ;
  TMine_On_Board(UnitDefinition).FMine_POD                   := ss.MineDefinition.FMine_POD ;
  TMine_On_Board(UnitDefinition).FVehicle.FData              := ss.MineDefinition.FVehicle.FData ;
  TMine_On_Board(UnitDefinition).FVehicle.FPlatform_Ident    := ss.MineDefinition.FVehicle.FPlatform_Ident ;
  TMine_On_Board(UnitDefinition).FVehicle.FHeliLimitation    := ss.MineDefinition.FVehicle.FHeliLimitation ;
  OrderedAltitude := ss.B.OrderDepth;

//  MineAktif := ss.MineAktif ;
//  FHomePositionX   := ss.FHomePositionX ;
//  FHomePositionY   := ss.FHomePositionY ;
end;

//=========================================================================================
//=========================================================================================
constructor TT3MineOnVehicle.Create;
begin
  inherited;
//  FSalvoSize := 1;
end;

function TT3MineOnVehicle.CreateMines: TT3Mine;
var
  mine  : TT3Mine;
begin
  mine := TT3Mine.Create;

  mine.Parent          := FParent;
  mine.Owner           := FParent;
  mine.UnitMotion      := UnitMotion;
  mine.UnitDefinition  := UnitDefinition;
  mine.UnitGroup       := UnitGroup;
  mine.Enable          := Enable;
  mine.WeaponCategory  := WeaponCategory;
  mine.Track_ID        := 'MIN';
  mine.Force_Designation := TT3PlatformInstance(FParent).Force_Designation;
  mine.PlatformType      := vhtMine;
  mine.MineCategory    := MineCategory;
  mine.MineMooring     := MineMooring;
  mine.isInstructor    := TT3PlatformInstance(Parent).isInstructor;
  mine.isWasdal        := TT3PlatformInstance(Parent).isWasdal;

  mine.MineDetectability := MineDetectability;

  mine.Initialize;
  result := mine;
end;

procedure TT3MineOnVehicle.Draw(aCnv: tCanvas);
begin
  inherited;

end;

function TT3MineOnVehicle.getMountType: integer;
begin
   result := FMineDefinition.FData.Mount_Type;
end;

function TT3MineOnVehicle.PrepareDrop;
var
  mine : TT3Mine;
begin
  Result := nil;

  if not (Quantity > 0) then exit;

  mine := CreateMines;
  result := mine;

//  Quantity := Quantity - 1;
end;

procedure TT3MineOnVehicle.Initialize;
begin
  inherited;

  if Assigned(UnitDefinition) then
    FMineDefinition := TMine_On_Board(UnitDefinition);

  if Assigned(FMineDefinition) then begin
    with FMineDefinition do begin

      {Masuk Category Mine apa}
      case FMine_Def.Platform_Category of
        2 : MineCategory := mcAcoustic;
        3 : MineCategory := mcImpact;
        4 : MineCategory := mcMagnetic;
        5 : MineCategory := mcPressure;
      end;

      {Masuk tipe Mooring Mine apa}
      case FMine_Def.Mooring_Type of
        0 : MineMooring := mmFixed;
        1 : MineMooring := mmFloating;
      end;

      {Masuk tipe Detectability Mine apa}
      case FMine_Def.Detectability_Type of
        0 : MineDetectability := mdNormalDetection;
        1 : MineDetectability := mdundetectable;
        2 : MineDetectability := mdPassiveDetection;
        3 : MineDetectability := mdAlwaysVisible;
      end;

      WeaponCategory := wcMine;
      InstanceName := FData.Instance_Identifier;
      InstanceIndex := FData.Fitted_Weap_Index;
      EngageRange := FMine_Def.Engagement_Range;
      Lethality := FMine_Def.Mine_Lethality;
      Quantity := FData.Quantity;
    end;
  end;
end;

procedure TT3MineOnVehicle.SetButtonLaunch(const Value: Boolean);
begin
  FButtonLaunch := Value;
end;

procedure TT3MineOnVehicle.SetDepth(const Value: integer);
begin
  FDepth := Value;
end;

procedure TT3MineOnVehicle.SetParentPlatformID(const Value: integer);
begin
  FParentPlatformID := Value;
end;

procedure TT3MineOnVehicle.SetQuantity(const Value: integer);
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

function TT3MineOnVehicle.GetSnapshotData : _SS_MineOnVehicle ;
var
  I : integer;
  ss: _SS_MineOnVehicle;
  weaponScript: TScripted_Weapon;
  pattern     : TPattern_Weapon;
  blind       : TBlind_Zone;
  pod         : TMine_POD_vs_Range;
begin
  pattern := nil;

  if Parent <> nil then
    ss.Owner  := TT3Unit(Parent).InstanceIndex;

  ss.W := TT3Weapon(Self).GetSnapshotData;
  ss.MineDefinition.FData     := MineDefinition.FData;
  ss.MineDefinition.FMine_Def := MineDefinition.FMine_Def;
  ss.MineDefinition.FMine_POD := MineDefinition.FMine_POD;
  ss.MineDefinition.FNote     := MineDefinition.FNote;

  if MineDefinition.FScript_Mine <> nil then
  begin
    SetLength(ss.MineDefinition.FScript_Mine,MineDefinition.FScript_Mine.Count);

    for I := 0 to MineDefinition.FScript_Mine.Count - 1 do
    begin
      weaponScript := TScripted_Weapon(MineDefinition.FScript_Mine[i]);

      if weaponScript <> nil then
      begin
        ss.MineDefinition.FScript_Mine[i].Event := weaponScript.Event.FData;
        ss.MineDefinition.FScript_Mine[i].Behav := weaponScript.Behav.FData;
      end;
    end;
  end;

  if MineDefinition.FPattern_Mine <> nil then
  begin
    SetLength(ss.MineDefinition.FPattern_Mine,MineDefinition.FPattern_Mine.Count);

    for I := 0 to MineDefinition.FPattern_Mine.Count - 1 do
    begin
      pattern := TPattern_Weapon(MineDefinition.FPattern_Mine[i]);

      if pattern <> nil then
      begin
        ss.MineDefinition.FPattern_Mine[i].Event := pattern.Event.FData;
        ss.MineDefinition.FPattern_Mine[i].Pattern := pattern.Pattern.FData;
      end;
    end;
  end;

  if MineDefinition.FBlind <> nil then
  begin
    SetLength(ss.MineDefinition.FBlind,MineDefinition.FBlind.Count);

    for I := 0 to MineDefinition.FBlind.Count - 1 do
    begin
      blind := TBlind_Zone(MineDefinition.FBlind[i]);

      if pattern <> nil then
        ss.MineDefinition.FBlind[i].FData := blind.FData;
    end;
  end;

  if MineDefinition.FPOD <> nil then
  begin
    SetLength(ss.MineDefinition.FPOD,MineDefinition.FPOD.Count);

    for I := 0 to MineDefinition.FPOD.Count - 1 do
    begin
      pod := TMine_POD_vs_Range(MineDefinition.FPOD[i]);
      if pod <> nil then
        ss.MineDefinition.FPOD[i].FData := pod.FData;
    end;
  end;

  ss.MineDefinition.FVehicle.FData           := MineDefinition.FVehicle.FData;
  ss.MineDefinition.FVehicle.FPlatform_Ident := MineDefinition.FVehicle.FPlatform_Ident;
  ss.MineDefinition.FVehicle.FHeliLimitation := MineDefinition.FVehicle.FHeliLimitation;

//  ss.SalvoSize := SalvoSize;
  ss.Quantity  := Quantity;

  Result := ss ;
end;

procedure TT3MineOnVehicle.SetSnapshotData(const ss : _SS_MineOnVehicle);
begin
  TT3Weapon(Self).SetSnapshotData(ss.W) ;
  MineDefinition.FData                       := ss.MineDefinition.FData ;
  MineDefinition.FMine_Def                   := ss.MineDefinition.FMine_Def ;
  MineDefinition.FMine_POD                   := ss.MineDefinition.FMine_POD ;
  MineDefinition.FVehicle.FData              := ss.MineDefinition.FVehicle.FData ;
  MineDefinition.FVehicle.FPlatform_Ident    := ss.MineDefinition.FVehicle.FPlatform_Ident ;
  MineDefinition.FVehicle.FHeliLimitation    := ss.MineDefinition.FVehicle.FHeliLimitation ;
//  SalvoSize                                  := ss.SalvoSize ;
  Quantity                                   := ss.Quantity ;
end;


procedure TT3MineOnVehicle.SetTargetPlatformID(const Value: integer);
begin
  FTargetPlatformID := Value;
end;

procedure TT3MineOnVehicle.SetTargetTrack(const Value: string);
begin
  FTargetTrack := Value;
end;

procedure TT3MineOnVehicle.UpdateVisual;
begin
  inherited;
  if not Assigned(Parent) then exit;

  FPosition.X := Parent.getPositionX;
  FPosition.Y := Parent.getPositionY;
  FPosition.Z := Parent.getPositionZ;
end;

end.
