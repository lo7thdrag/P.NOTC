unit uT3Weapon;

interface

uses
  SysUtils,

  uT3Unit, Graphics, tttData, uSimObjects, Classes, uObjectVisuals,
  uT3UnitContainer, uDBCubicles, uBaseCoordSystem, uDataTypes, uT3Common,
  uSnapshotData, Dialogs, Windows, Math, uCoordConvertor, uT3DogBox;

type

  TT3Weapon = class(TT3PlatformInstance)
  private
    FShowBlind  : boolean;
    FShowRange  : boolean;
    FPlanned    : boolean;
    FShowRangeSelected : Boolean;
    FShowBlindSelected : Boolean;
//    FDetectionRange: single;
//    FBZEndAngle: single;
//    FBZStartAngle: single;
    FWeaponRange  : double;
    FWeaponStatus : TWeaponStatus;
    FOnHit      : TOnWeaponHit;
    FOnOut      : TOnWeaponOut; //ham 04052012
    FOnTargeted : TOnWeaponTargetChange;
    FOnPropertyChange: TNotifyEvent;
    FisControllerPlat : Boolean;

    //RBlW
    FRangeRBLCircle : Double;
    FRBLW_PointX : Double;
    FRBLW_PointY : Double;
    FRBLW_Name   : string;

    //BOLW
    FRangeBOLWCircle : Double;
    FBOLW_PointX : Double;
    FBOLW_PointY : Double;
    FBOLW_Name   : string;
    FOnHybridLaunch: TOnHybridlaunch;
    FOnPropertyIntChange: TOnPropertyIntChange;
    FOnMissileSynchVBS: TOnMissileSynchVBS;
    FOnHitTo3D: TOnWeaponHitTo3D;

    procedure SetShowBlind(const Value: boolean);
    procedure SetShowRange(const Value: boolean);
    procedure SetPlanned(const Value: boolean);
    procedure SetWeaponCategory(const Value: TWeapoonCategory);
    procedure SetOnLaunched(const Value: TOnWeaponLaunch);
    procedure SetOnHit(const Value: TOnWeaponHit);
    procedure SetOnOut(const Value: TOnWeaponOut); //ham 04052012
    procedure SetWeaponRange(const Value: double);
    procedure SetWeaponStatus(const Value: TWeaponStatus);
    procedure SetOnTargeted(const Value: TOnWeaponTargetChange);
    procedure SetOnPropertyChange(const Value: TNotifyEvent);
    procedure SetShowRangeSelected(const Value: boolean);
    procedure SetShowBlindSelected(const Value: boolean);
    procedure setOHybridLaunch(const Value: TOnHybridlaunch);
    procedure SetOnPropertIntChange(const Value: TOnPropertyIntChange);

    procedure SetOnMissileSynchVBS(const Value: TOnMissileSynchVBS);

    procedure SetOnHitTo3D(const Value: TOnWeaponHitTo3D); 
 protected
    FSimPlatforms : TT3UnitContainer; //mk test
    FTargetObject : TSimObject;       //mk test
    FNeedAdjust   : boolean;      //mk test

    FControlMode  : integer;
    FRangeView  : TRangeVisual;
    FBlindView  : TList; 
    FWeaponCategory: TWeapoonCategory;
    FOnLaunched : TOnWeaponLaunch;
    FLaunched   : boolean;
    FPreLaunched : Boolean;
    FWeaponOnVehicleID : integer ; // sam.add u/snapshot
    FInitTargetIDOnVehicle : integer ; // sam.add u/snapshot

    procedure SetLaunched(const Value: boolean);virtual;
    procedure SetTargetObject(const Value: TSimObject);virtual;
    function getMountType: integer; virtual;
	  procedure SetControlMode(const Value: integer);virtual;   //mk test

  public
    {nando}
    VehiclePlatform  : TT3UnitContainer;
    VehicleDetect    : TT3UnitContainer;
    RBLWPoint        : TT3UnitContainer;
    VehicleOnGroup   : T3CubicleGroup;
    MissileToLaunch  : TSimObject;

    BZStartAngle  : array of single;
    BZEndAngle    : array of single;

    constructor Create;override;
    destructor Destroy;override;

    function  GetSnapshotData : _SS_TT3Weapon ;
    procedure SetSnapshotData(const ss : _SS_TT3Weapon);

    function  InsideBlindZone(aObject : TSimObject) : boolean; virtual;
    function  InsideBlindZonePos(X, Y : Double) : boolean; virtual;
    function  RangeBomb (aObject:TSimObject): Boolean; virtual;

    procedure Initialize;override;
    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
	  procedure SetObjects(platformObjects: TT3UnitContainer); virtual; //mk test

    property isControllerPlat : Boolean read FisControllerPlat write FisControllerPlat;
    property RangeRBLCircle   : Double  read FRangeRBLCircle write FRangeRBLCircle;
    property RBLW_PointX : Double read FRBLW_PointX write FRBLW_PointX;
    property RBLW_PointY : Double read FRBLW_PointY write FRBLW_PointY;
    property RBLW_Name   : string read FRBLW_Name write FRBLW_Name;
    property RangeBOLWCircle   : Double  read FRangeBOLWCircle write FRangeBOLWCircle;
    property BOLW_PointX : Double read FBOLW_PointX write FBOLW_PointX;
    property BOLW_PointY : Double read FBOLW_PointY write FBOLW_PointY;
    property BOLW_Name   : string read FBOLW_Name write FBOLW_Name;
    property ShowRange : boolean read FShowRange write SetShowRange;
    property ShowBlind : boolean read FShowBlind write SetShowBlind;
    property PreLaunched  : boolean read FPreLaunched write FPreLaunched;
    property Launched  : boolean read FLaunched write SetLaunched;
    property Planned   : boolean read FPlanned write SetPlanned;
    property WeaponCategory : TWeapoonCategory read FWeaponCategory write SetWeaponCategory;
    property TargetObject   : TSimObject read FTargetObject write SetTargetObject;
    property WeaponRange    : double read FWeaponRange write SetWeaponRange;
    property WeaponStatus   : TWeaponStatus read FWeaponStatus write SetWeaponStatus;
    property OnLaunched : TOnWeaponLaunch read FOnLaunched write SetOnLaunched;
    property OnHybridLaunch : TOnHybridlaunch read FOnHybridLaunch write setOHybridLaunch;
    property OnHit      : TOnWeaponHit read FOnHit write SetOnHit;
    property OnHitTo3D      : TOnWeaponHitTo3D read FOnHitTo3D write SetOnHitTo3D;
    property OnOut      : TOnWeaponOut read FOnOut write SetOnOut; //ham 04052012
    property OnTargeted : TOnWeaponTargetChange  read FOnTargeted write SetOnTargeted;
    property OnPropertyIntChange : TOnPropertyIntChange read FOnPropertyIntChange write SetOnPropertIntChange;
    property OnPropertyChange : TNotifyEvent read FOnPropertyChange write SetOnPropertyChange;
    property OnMissileSynchVBS : TOnMissileSynchVBS read FOnMissileSynchVBS write SetOnMissileSynchVBS;
    property MountType: integer read getMountType;
    property ShowRangeSelected : Boolean read FShowRangeSelected write SetShowRangeSelected;
    property ShowBlindSelected : Boolean read FShowBlindSelected write SetShowBlindSelected;
	  property ControlMode : integer read FControlMode write SetControlMode; //mk test
    property NeedAjust : Boolean  read FNeedAdjust write FNeedAdjust; //mk test

    property WeaponOnVehicleID  : Integer  read FWeaponOnVehicleID write FWeaponOnVehicleID; //sam.add u/snapshot
    property TargetInitID  : Integer  read FInitTargetIDOnVehicle write FInitTargetIDOnVehicle; //sam.add u/snapshot
  end;

  TT3Vectac = class(TT3Weapon)
  private
    FOwner     : TT3PlatformInstance;
    FTarget     : TT3PlatformInstance;
    FWpnCarrier : TT3PlatformInstance;
    FWeapon     : TT3Weapon;
    FListDogBox : TList;

    FLongitude : Double;
    FLatitude : Double;
    FDropOffset : Double;

    FVectacIsTrack : Boolean;
    FVectacIsPlan : Boolean;

    FConfirmDrop: Boolean;
    FExpiredTime: Double;
    FMovement : TMovementType;
    FSearchRadius: Double;
    FParentX: Double;
    FParentY: Double;
    FVisibleDogBox: Boolean;
    FAirborne_Descent_Rate: double;
    FIndexDogBox : Integer;
//    FRangeDogBox : TRangeVisual;

    procedure SetConfirmDrop(const Value: Boolean);
    procedure SetExpiredTime(const Value: Double);
    procedure SetSearchRadius(const Value: Double);
    procedure SetVisibleDogBox(const Value: Boolean);
    procedure SetAirborne_Descent_Rate(const Value: Double);
  public
    constructor Create; override;
    destructor  Destroy;override;

    procedure Initialize;override;

    function GetSnapshotData : _SS_TT3Vectac ;
    procedure SetSnapshotData(const ss : _SS_TT3Vectac);

    procedure Move(const aDeltaMs: double); override;
    procedure Draw(aCnv: tCanvas); override;
    procedure UpdateVisual; override;
    procedure CalcIntercept(var NewLong, NewLat : Double); overload;
    procedure CalcIntercept(X1, Y1, X2, Y2: Double; var NewLong, NewLat : Double); overload;
    procedure CalcExpiredTime;
    procedure CreateDogBox;

    property Longitude : Double read FLongitude write FLongitude;
    property Latitude : Double read FLatitude write FLatitude;
    property ParentX : Double read FParentX write FParentX;
    property ParentY : Double read FParentY write FParentY;

//    property Owner : TT3PlatformInstance read FOwner write FOwner;
    property Target : TT3PlatformInstance read FTarget write FTarget;
    property WeaponCarrier : TT3PlatformInstance read FWpnCarrier write FWpnCarrier;
    property Weapon : TT3Weapon read FWeapon write FWeapon;
    property Tracked : Boolean read FVectacIsTrack write FVectacIsTrack;
    property Planned : Boolean read FVectacIsPlan write FVectacIsPlan;
    property DropOffset : Double read FDropOffset write FDropOffset;
    property SearchRadius : Double  read FSearchRadius write SetSearchRadius;
    property ConfirmDrop : Boolean  read FConfirmDrop write SetConfirmDrop;
    property ExpiredTime : Double  read FExpiredTime write SetExpiredTime;
    property VisibleDogBox : Boolean read FVisibleDogBox write SetVisibleDogBox;
    property Airborne_Descent_Rate : Double read FAirborne_Descent_Rate write SetAirborne_Descent_Rate;
  end;

implementation

uses uT3Listener, uT3Vehicle;

{ TT3Weapon }

constructor TT3Weapon.Create;
begin
  inherited;
  FRangeView        := TRangeVisual.Create;
  FBlindView        := TList.Create;
  FWeaponStatus     := wsAvailable;
  FShowRange        := False;
  FControlMode      := 2;
  FNeedAdjust       := true;
end;

destructor TT3Weapon.Destroy;
begin
  FRangeView.Free;
  FBlindView.Free;

  inherited;
end;

procedure TT3Weapon.Draw(aCnv: tCanvas);
var
  blindZ : TBlindZoneVisual;
  i : integer;
begin
  inherited;

  //if FShowRange then begin
  if FShowRangeSelected then
  begin
    FRangeView.LineStyles := psSolid;
    FRangeView.Draw(aCnv);
  end;

  if FShowBlindSelected then
  begin
    for i := 0 to FBlindView.Count - 1 do
    begin
      //TBlindZoneVisual(FBlindView[i]).Draw(aCnv);
      blindZ := FBlindView.Items[i];
      blindZ.Color := clRed;
      blindZ.Draw(aCnv);
    end;
  end;
end;

procedure TT3Weapon.Initialize;
begin
  inherited;
end;

function TT3Weapon.InsideBlindZone(aObject: TSimObject): boolean;
begin
  //inherited;

  result := false;

//  bearing := CalcBearing(FPosition.X,FPosition.Y,
//           TT3PlatformInstance(aObject).getPositionX,
//           TT3PlatformInstance(aObject).getPositionY);
//
//  // periksa apakah didalam area blind zone
//  if FBlindView.Count > 0 then begin
//    for I := 0 to FBlindView.Count - 1 do begin
//
//      blindZ := TBlindZoneVisual(FBlindView.Items[i]);
//      Result := DegComp_IsBeetwen(bearing, blindZ.StartAngle, blindZ.EndAngle);   //edit start n end angel
//
//      {if (blindZ.RelativeStartAngle > blindZ.RelativeEndAngle) then begin
//        if (bearing > blindZ.RelativeStartAngle) or
//           (bearing < blindZ.RelativeEndAngle) then begin
//            result := true;
//            break;
//        end;
//      end else
//      if (bearing > blindZ.RelativeStartAngle) and
//         (bearing < blindZ.RelativeEndAngle) then begin
//          result := true;
//          break;
//         end;}
//    end;
//  end;
end;

function TT3Weapon.InsideBlindZonePos(X, Y : Double): boolean;
var
  i : integer;
  blindZ : TBlindZoneVisual;
  bearing : double;
begin
  //inherited;

  result := false;

  bearing := CalcBearing(FPosition.X, FPosition.Y, X, Y);

  // periksa apakah didalam area blind zone
  if FBlindView.Count > 0 then
  begin
    for I := 0 to FBlindView.Count - 1 do
    begin
      blindZ := TBlindZoneVisual(FBlindView.Items[i]);
      Result := DegComp_IsBeetwen(bearing, blindZ.RelativeStartAngle, blindZ.RelativeEndAngle);

//      if (blindZ.RelativeStartAngle > blindZ.RelativeEndAngle) then begin
//        if (bearing > blindZ.RelativeStartAngle) or
//           (bearing < blindZ.RelativeEndAngle) then begin
//            result := true;
//            break;
//        end;
//      end else
//      if (bearing > blindZ.RelativeStartAngle) and
//         (bearing < blindZ.RelativeEndAngle) then begin
//          result := true;
//          break;
//         end;
    end;
  end;
end;

procedure TT3Weapon.Move(const aDeltaMs: double);
var
  i : integer;
  blindZ : TBlindZoneVisual;
begin
  inherited;

  // update rel start start-end angle
  for I := 0 to FBlindView.Count - 1 do
  begin
    blindZ := TBlindZoneVisual(FBlindView.Items[i]);
    blindZ.Ranges := WeaponRange;
   
    if Assigned(FParent) then
    begin
      blindZ.Heading:= TT3PlatformInstance(FParent).Course;
      blindZ.mX     := FParent.getPositionX;
      blindZ.mY     := FParent.getPositionY;
    end;

    blindZ.UpdateRelatifAngle;
  end;
end;

function TT3Weapon.RangeBomb(aObject: TSimObject): Boolean;
begin
  Result := True;
end;

procedure TT3Weapon.SetLaunched(const Value: boolean);
begin
  FLaunched := Value;
  if FLaunched then
  begin

    if Assigned(FOnLaunched) then
      FOnLaunched(Self, TargetObject);
  end;
end;

procedure TT3Weapon.SetOnHit(const Value: TOnWeaponHit);
begin
  FOnHit := Value;
end;

procedure TT3Weapon.SetOnHitTo3D(const Value: TOnWeaponHitTo3D);
begin
  FOnHitTo3D := Value;
end;

//ham 04052012
procedure TT3Weapon.SetOnOut(const Value: TOnWeaponOut);
begin
  FOnOut := Value;
end; 

procedure TT3Weapon.SetOnLaunched(const Value: TOnWeaponLaunch);
begin
  FOnLaunched := Value;
end;

procedure TT3Weapon.SetOnMissileSynchVBS(const Value: TOnMissileSynchVBS);
begin
  FOnMissileSynchVBS := Value;
end;

procedure TT3Weapon.SetOnPropertIntChange(const Value: TOnPropertyIntChange);
begin
  FOnPropertyIntChange := Value;
end;

procedure TT3Weapon.SetOnPropertyChange(const Value: TNotifyEvent);
begin
  FOnPropertyChange := Value;
end;

procedure TT3Weapon.SetOnTargeted(const Value: TOnWeaponTargetChange);
begin
  FOnTargeted := Value;
end;

procedure TT3Weapon.SetObjects(platformObjects: TT3UnitContainer);
begin
  FSimPlatforms   := platformObjects;
end;

procedure TT3Weapon.setOHybridLaunch(const Value: TOnHybridlaunch);
begin
  FOnHybridLaunch := Value;
end;

procedure TT3Weapon.SetPlanned(const Value: boolean);
begin
  FPlanned := Value;
end;

procedure TT3Weapon.SetShowBlind(const Value: boolean);
begin
  FShowBlind := Value;
end;

procedure TT3Weapon.SetShowRange(const Value: boolean);
begin
  FShowRange := Value;
end;

procedure TT3Weapon.SetShowRangeSelected(const Value: boolean);
begin
  FShowRangeSelected := Value;
end;

procedure TT3Weapon.SetShowBlindSelected(const Value: Boolean);
begin
  FShowBlindSelected := Value;
end;

procedure TT3Weapon.SetTargetObject(const Value: TSimObject);
begin
  FTargetObject := Value;
//  if Assigned(FOnTargeted) then
//    FOnTargeted(Self, Value);
end;

procedure TT3Weapon.SetControlMode(const Value: integer);
begin
  FControlMode := Value;
end;

function TT3Weapon.getMountType: integer;
begin
  result := 0;
end;

procedure TT3Weapon.SetWeaponCategory(const Value: TWeapoonCategory);
begin
  FWeaponCategory := Value;
end;

procedure TT3Weapon.SetWeaponRange(const Value: double);
begin
  FWeaponRange := Value;
end;

procedure TT3Weapon.SetWeaponStatus(const Value: TWeaponStatus);
var
  S, F, P : string;
begin
  try
    if FWeaponStatus <> Value then
    begin
      if Assigned(OnPropertyIntChange) then
        OnPropertyIntChange(Self, psWeaponStatus, Byte(Value));
    end;
//      TriggerListener(Self, psWeaponStatus, Byte(Value));

    FWeaponStatus := Value;
  except
    on EAccessViolation do begin
      case Value of
        wsAvailable   : S:= 'wsAvailable';
        wsUnavailable : S:= 'wsUnavailable';
        wsDamaged     : S:= 'wsDamaged';
        wsTooHigh     : S:= 'wsTooHigh';
        wsFiring      : S:= 'wsFiring';
      end;

      case Self.FreeMe of
        True : F := 'FreeMe Weapon : True';
        False : F := 'FreeMe Weapon : False';
      end;

      S := 'ERROR ACCES VIOLATION' + #13#10 + 'Weapon Name : ' + Self.InstanceName
            + #13#10 + 'Weapon Status : ' + S
            + #13#10 + 'Weapon ID : ' + IntToStr(Self.InstanceIndex)
            + #13#10 + F;

      if Assigned(Parent) then
      begin
        case Parent.FreeMe of
          True : P := 'FreeMe Parent : True';
          False : P := 'FreeMe Parent : False';
        end;

        S := S + #13#10 + 'Parent Weapon : ' + TT3Vehicle(Parent).InstanceName +
              #13#10 + P;
      end;

      if Assigned(OnLogTemporary) then
          OnLogTemporary(S);
    end;
  end;
end;

procedure TT3Weapon.UpdateVisual;
var
  i : integer;
  blind : TBlindZoneVisual;
  //X,Y : integer;
begin
  inherited;

  if Assigned(FParent) then
  begin
    FRangeView.mX := FParent.getPositionX;
    FRangeView.mY := FParent.getPositionY;
    FRangeView.Color := clRed;
    FRangeView.Range := WeaponRange;
    FRangeView.ConvertCoord(Converter);
    //FRangeView.Visible := FShowRange;

    for i := 0 to FBlindView.Count - 1 do begin
      blind := FBlindView.Items[i];

      with blind do begin
        Heading:= TT3PlatformInstance(FParent).Course;
        //Heading:= TT3PlatformInstance(FParent).Heading;     //mk test
        Ranges := WeaponRange;
        mX     := FParent.getPositionX;
        mY     := FParent.getPositionY;

        StartAngle := BZStartAngle[i];
        EndAngle   := BZEndAngle[i];

        ConvertCoord(Self.Converter);
      end;
    end;
  end;
end;


{ snapshot }
function TT3Weapon.GetSnapshotData : _SS_TT3Weapon ;
var
    ss : _SS_TT3Weapon ;
begin
    ss.P := TT3PlatformInstance(Self).GetSnapshotData ;
    if Parent <> nil then ss.Owner  := TT3Unit(Parent).InstanceIndex ;

    if TargetObject <> nil then
       ss.TargetObject := TT3Unit(TargetObject).InstanceIndex
    else
       ss.TargetObject := TargetInitID ;

    ss.WeaponOnVehicleID := WeaponOnVehicleID;
    ss.isControllerPlat := isControllerPlat;
    ss.RangeRBLCircle   := RangeRBLCircle;

    ss.RBLW_PointX := RBLW_PointX;
    ss.RBLW_PointY := RBLW_PointY;
    ss.RBLW_Name   := RBLW_Name;

    ss.RangeBOLWCircle   := RangeBOLWCircle;
    ss.BOLW_PointX := BOLW_PointX;
    ss.BOLW_PointY := BOLW_PointY;
    ss.BOLW_Name   := BOLW_Name;

    ss.ShowRange := ShowRange;
    ss.ShowBlind := ShowBlind;
    ss.PreLaunched  := PreLaunched ;
    ss.Launched  := Launched ;
    ss.Planned   := Planned;
    ss.WeaponCategory := byte(TWeapoonCategory(WeaponCategory)) ;

    ss.WeaponRange    := WeaponRange ;
    ss.WeaponStatus   := byte(TWeaponStatus(WeaponStatus)) ;

    ss.MountType:= MountType ;

    ss.ShowRangeSelected := ShowRangeSelected ;
    ss.ShowBlindSelected := ShowBlindSelected ;

    ss.ControlMode := ControlMode ;
    ss.NeedAjust := NeedAjust ;

    Result := ss ;
end;

procedure TT3Weapon.SetSnapshotData(const ss : _SS_TT3Weapon);
begin
    if Self is TT3PlatformInstance then
      TT3PlatformInstance(Self).SetSnapshotData(ss.P) ;

    isControllerPlat := ss.isControllerPlat;
    RangeRBLCircle   := ss.RangeRBLCircle;

    RBLW_PointX := ss.RBLW_PointX;
    RBLW_PointY := ss.RBLW_PointY;
    RBLW_Name   := ss.RBLW_Name;

    RangeBOLWCircle   := ss.RangeBOLWCircle;
    BOLW_PointX := ss.BOLW_PointX;
    BOLW_PointY := ss.BOLW_PointY;
    BOLW_Name   := ss.BOLW_Name;

    ShowRange := ss.ShowRange;
    ShowBlind := ss.ShowBlind;
    PreLaunched  := ss.PreLaunched ;
    FLaunched  := ss.Launched ;
    //Planned   := ss.Planned;
    WeaponCategory := (TWeapoonCategory(WeaponCategory)) ;
    //TargetObject   : TSimObject ;
    WeaponRange    := ss.WeaponRange ;
    WeaponStatus   := (TWeaponStatus(WeaponStatus)) ;

    ShowRangeSelected := ss.ShowRangeSelected ;
    ShowBlindSelected := ss.ShowBlindSelected ;

    ControlMode := ss.ControlMode ;
    NeedAjust := ss.NeedAjust ;
end;


//procedure TT3Weapon.SetPoint1x(const Value: integer);
//begin
//  FPoint1x := Value;
//end;
//
//procedure TT3Weapon.SetPoint1y(const Value: integer);
//begin
//  FPoint1y := Value;
//end;
//
//procedure TT3Weapon.SetPoint2x(const Value: integer);
//begin
//  FPoint2x := Value;
//end;
//
//procedure TT3Weapon.SetPoint2y(const Value: integer);
//begin
//  FPoint2y := Value;
//end;
//
//procedure TT3Weapon.SetPoint3x(const Value: integer);
//begin
//  FPoint3x := Value;
//end;
//
//procedure TT3Weapon.SetPoint3y(const Value: integer);
//begin
//  FPoint3y := Value;
//end;
//
//procedure TT3Weapon.SetPoint4x(const Value: integer);
//begin
//  FPoint4x := Value;
//end;
//
//procedure TT3Weapon.SetPoint4y(const Value: integer);
//begin
//  FPoint4y := Value;
//end;

{ TT3Vectac }

procedure TT3Vectac.CalcIntercept(var NewLong, NewLat: Double);
var
  hRange, hBearing, hTime, hSpeed, mx, my{, mx2, my2} : double;
  FTargetCourse,
  FTargetSpeed,
  FTargetBearing,
  FTargetRange    : double;
  kec,waktu,splashRange : Double;
begin
  FTargetRange   := CalcRange(WeaponCarrier.PosX, WeaponCarrier.PosY, Target.PosX, Target.PosY);
  FTargetBearing := Calcbearing(WeaponCarrier.PosX,WeaponCarrier.PosY,Target.PosX,Target.PosY);
  FTargetCourse  := Target.Course;
  FTargetSpeed   := Target.Speed;

  CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,TT3Vehicle(WeaponCarrier).OrderedSpeed,
                    hRange,hBearing,hTime,hSpeed);

  if Airborne_Descent_Rate > 0 then
  begin
    Kec          := TT3Vehicle(WeaponCarrier).OrderedSpeed/ C_MS_To_KNOTS;
    Waktu        := (WeaponCarrier.Altitude*C_Meter_To_Feet)/
                    (Airborne_Descent_Rate/60);
    splashRange  := (Kec * Waktu)/C_NauticalMile_To_Metre ;

    RangeBearingToCoord(hRange - splashRange, hBearing, mx, my);
  end
  else
    RangeBearingToCoord(hRange,hBearing,mx,my);

  NewLong := WeaponCarrier.PosX + mx;
  NewLat  := WeaponCarrier.PosY + my;
//  FWpnCarrier.Heading := hBearing;
end;

procedure TT3Vectac.CalcExpiredTime;
  function CalcFuelConsumtion(mt: TMovementType): Double;
  var
    aUpperSpeed, aLowerSpeed, aUpperFuel, aLowerFuel{, Temp} : Double;
    //SpeedNumerator, SpeedDenominator, FuelDenominator : Double;
  begin
    aUpperSpeed := 0;
    aLowerSpeed := 0;
    aUpperFuel  := 0;
    aLowerFuel  := 0;

    case mt of
      mtMinimumCruise:
      begin
        aUpperSpeed := Weapon.UnitMotion.FData.Cruise_Ground_Speed;
        aLowerSpeed := Weapon.UnitMotion.FData.Min_Ground_Speed;
        aUpperFuel  := Weapon.UnitMotion.FData.Cruise_Speed_Fuel_Consume;
        aLowerFuel  := Weapon.UnitMotion.FData.Min_Speed_Fuel_Consume;
      end;
      mtCruiseHigh:
      begin
        aUpperSpeed := Weapon.UnitMotion.FData.High_Ground_Speed;
        aLowerSpeed := Weapon.UnitMotion.FData.Cruise_Ground_Speed;
        aUpperFuel  := Weapon.UnitMotion.FData.High_Speed_Fuel_Consume;
        aLowerFuel  := Weapon.UnitMotion.FData.Cruise_Speed_Fuel_Consume;
      end;
      mtHighMaximum:
      begin
        aUpperSpeed := Weapon.UnitMotion.FData.Max_Ground_Speed;
        aLowerSpeed := Weapon.UnitMotion.FData.High_Ground_Speed;
        aUpperFuel  := Weapon.UnitMotion.FData.Max_Speed_Fuel_Consume;
        aLowerFuel  := Weapon.UnitMotion.FData.High_Speed_Fuel_Consume;
      end;
    end;

    //SpeedNumerator    := Speed - aLowerSpeed;
    //SpeedDenominator  := aUpperSpeed - aLowerSpeed;
    //FuelDenominator   := aUpperFuel - aLowerFuel;

    Result := Interpolate(Speed,aLowerSpeed,aLowerFuel,aUpperSpeed,aUpperFuel);

    //Temp := (SpeedNumerator * FuelDenominator) + (aLowerFuel * SpeedDenominator);
    //Result := Temp / SpeedDenominator;
  end;
var
  MotMinSpeed, MotCruiseSpeed, MotHighSpeed, MotMaxSpeed : double;
  SpeedWeapon : Double;
begin
  if Assigned(Weapon) then
  begin
    if Assigned(Weapon.UnitMotion) then
    begin
      with Weapon.UnitMotion.FData do begin
        MotMinSpeed     := Min_Ground_Speed;
        MotCruiseSpeed  := Cruise_Ground_Speed;
        MotHighSpeed    := High_Ground_Speed;
        MotMaxSpeed     := Max_Ground_Speed;
        SpeedWeapon     := Max_Ground_Speed;
      end;

      if SpeedWeapon <= 0.001 then FMovement := mtStop
      else if SpeedWeapon = MotMinSpeed then FMovement := mtMinimum
      else if (SpeedWeapon > MotMinSpeed) and (SpeedWeapon < MotCruiseSpeed) then  FMovement := mtMinimumCruise
      else if SpeedWeapon = MotCruiseSpeed then FMovement := mtCruise
      else if (SpeedWeapon > MotCruiseSpeed) and (SpeedWeapon < MotHighSpeed) then  FMovement := mtCruiseHigh
      else if SpeedWeapon = MotHighSpeed then FMovement := mtHigh
      else if (SpeedWeapon > MotHighSpeed) and (SpeedWeapon < MotMaxSpeed) then  FMovement := mtHighMaximum
      else if (SpeedWeapon >= MotMaxSpeed) then  FMovement := mtMaximum;


      case TEnduranceType(Weapon.UnitMotion.FData.Endurance_Type) of
        entFuel:
                begin
                  case FMovement of
                    mtStop          : FExpiredTime := 0;
                    mtMinimum       : FExpiredTime := ((3600 * Weapon.UnitMotion.FData.Max_Fuel_Capacity) /
                                      Weapon.UnitMotion.FData.Min_Speed_Fuel_Consume);
                    mtCruise        : FExpiredTime := ((3600 * Weapon.UnitMotion.FData.Max_Fuel_Capacity) /
                                      Weapon.UnitMotion.FData.Cruise_Speed_Fuel_Consume);
                    mtHigh          : FExpiredTime := ((3600 * Weapon.UnitMotion.FData.Max_Fuel_Capacity) /
                                      Weapon.UnitMotion.FData.High_Speed_Fuel_Consume);
                    mtMaximum       : FExpiredTime := ((3600 * Weapon.UnitMotion.FData.Max_Fuel_Capacity) /
                                      Weapon.UnitMotion.FData.Max_Speed_Fuel_Consume);
                    mtMinimumCruise,
                    mtCruiseHigh,
                    mtHighMaximum   : FExpiredTime := ((3600 * Weapon.UnitMotion.FData.Max_Fuel_Capacity) /
                                      CalcFuelConsumtion(FMovement));
                  end;
                end;

        entTime: FExpiredTime := Weapon.UnitMotion.FData.Endurance_Time;
        entRange: FExpiredTime := ((Weapon.UnitMotion.FData.Max_Effective_Range * C_NauticalMile_To_Metre) /
                  (Weapon.Speed * 0.514444444));
        entUnlimited: FExpiredTime := 1
      end;
    end
    else
      FExpiredTime := 0;
  end;
end;

procedure TT3Vectac.CalcIntercept(X1, Y1, X2, Y2: Double; var NewLong, NewLat : Double);
var
  hRange, hBearing, hTime, hSpeed, mx, my : double;
  FTargetCourse,
  FTargetSpeed,
  FTargetBearing,
  FTargetRange    : double;
begin
  FTargetRange   := CalcRange(X2,Y2,X1,Y1);
  FTargetBearing := Calcbearing(X1,Y1,X2,Y2);
  FTargetCourse  := Target.Course;
  FTargetSpeed   := Target.Speed;

  CalcHitPrediction(FTargetRange,FTargetBearing,FTargetSpeed,FTargetCourse,TT3Vehicle(WeaponCarrier).Mover.MaxSpeed,
                    hRange,hBearing,hTime,hSpeed);

  RangeBearingToCoord(hRange,hBearing,mx,my);

  NewLong := WeaponCarrier.PosX + mx;
  NewLat  := WeaponCarrier.PosY + my;
end;

constructor TT3Vectac.Create;
begin
  inherited;

  FInstance_Name    := 'VECTAC';
  FListDogBox := TList.Create;
  FIndexDogBox := 0;
end;

destructor TT3Vectac.Destroy;
var
  I: Integer;
begin
  FWeapon := nil;
  FTarget := nil;
  FOwner  := nil;
  FWpnCarrier := nil;

  if FListDogBox.Count > 0 then
  begin
    for I := FListDogBox.Count - 1 downto 0 do
    begin
      FListDogBox.Delete(i);
    end;
  end;

  FListDogBox.Free;

  inherited;
end;

procedure TT3Vectac.Draw(aCnv: tCanvas);
var
  iX,iY : Integer;
  I : Integer;
begin
  inherited;

  if (FVectacIsPlan) and (not FConfirmDrop)then
  begin
//    if WeaponCarrier.InstanceIndex = 123 then
//    begin
      with aCnv do
      begin
        Pen.Color := clSilver;
        Pen.Style := psSolid;
        Converter.ConvertToScreen(WeaponCarrier.PosX,WeaponCarrier.PosY,iX,iY);
        MoveTo(iX,iY);
        Converter.ConvertToScreen(Longitude,Latitude,iX,iY);
        LineTo(iX,iY);
      end;
//    end;
  end;

  if FListDogBox.Count > 0 then
  begin
    for I := 0 to FListDogBox.Count - 1 do
    begin
      TT3DogBox(FListDogBox.Items[i]).Draw(aCnv);
    end;
  end;
end;

procedure TT3Vectac.Initialize;
begin
  inherited;

  FWeaponCategory  := wcVectac;

  FVectacIsTrack := False;
  FVectacIsPlan := False;

  FTarget := nil;

  FDropOffset := 4;
end;

procedure TT3Vectac.Move(const aDeltaMs: double);
var
  NewLong, NewLat : Double;
  I : Integer;
begin
  inherited;

  if FVectacIsPlan then
  begin
    CalcIntercept(NewLong,NewLat);

    if Assigned(TT3Vehicle(WeaponCarrier).Waypoints.NextWaypoint) then
    begin
      with TT3Vehicle(WeaponCarrier).Waypoints.NextWaypoint.FData do
      begin
        Waypoint_Longitude  := NewLong;
        Waypoint_Latitude   := NewLat;
      end;

      Longitude  := WeaponCarrier.PosX;
      Latitude   := WeaponCarrier.PosY;
    end
    else
    begin
      Longitude  := NewLong;
      Latitude   := NewLat;
    end;
  end;

  if FConfirmDrop then
  begin
    WeaponCarrier := nil;
    Weapon := nil;
    FVectacIsTrack := False;
    FVectacIsPlan := False;
    FConfirmDrop := False;
    FExpiredTime := 0;
  end;

  if FListDogBox.Count > 0 then
  begin
    for I := FListDogBox.Count - 1 downto 0 do
    begin
      TT3DogBox(FListDogBox.Items[i]).Move(aDeltaMs);

      if TT3DogBox(FListDogBox.Items[i]).ExpiredTime <= 0 then
      begin
        TT3DogBox(FListDogBox.Items[i]).Free;
        FListDogBox.Delete(i);
      end;
    end;
  end;
end;

function TT3Vectac.GetSnapshotData : _SS_TT3Vectac ;
var
  ss : _SS_TT3Vectac ;
  I: Integer;
begin
  ss.W              := TT3Weapon(Self).GetSnapshotData ;
  ss.Longitude      := Longitude ;
  ss.Latitude       := Latitude ;
  if Owner <> nil then
    ss.Owner          := TT3Unit(Owner).InstanceIndex ;
  if Target <> nil then
    ss.Target         := TT3Unit(Target).InstanceIndex ;
  if WeaponCarrier <> nil then
    ss.WeaponCarrier  := TT3Unit(WeaponCarrier).InstanceIndex ;
  ss.Tracked        := Tracked ;
  ss.Planned        := Planned ;
//  ss.OnDraw         := ShowTrackLine ;

  if FListDogBox.Count > 0 then
  begin
    SetLength(ss.ListDogBox, FListDogBox.Count);

    for I := 0 to FListDogBox.Count - 1 do
    begin
      ss.ListDogBox[i].IndexDogBox  := TT3DogBox(FListDogBox.Items[i]).IndexDogBox;
      ss.ListDogBox[i].SearchRadius := TT3DogBox(FListDogBox.Items[i]).SearchRadius;
      ss.ListDogBox[i].ExpiredTime  := TT3DogBox(FListDogBox.Items[i]).ExpiredTime;
      ss.ListDogBox[i].ParentX      := TT3DogBox(FListDogBox.Items[i]).ParentX;
      ss.ListDogBox[i].ParentY      := TT3DogBox(FListDogBox.Items[i]).ParentY;
      ss.ListDogBox[i].VisibLe      := TT3DogBox(FListDogBox.Items[i]).VisibLe;
    end;
  end;

  Result := ss ;

end;

procedure TT3Vectac.CreateDogBox;
var
  DogBox : TT3DogBox;
begin
  if Assigned(Weapon) and Assigned(Weapon.UnitMotion) then
  begin
    DogBox := TT3DogBox.Create;
    DogBox.ExpiredTime := FExpiredTime;
    DogBox.SearchRadius := FSearchRadius;
    DogBox.Converter := Converter;
    DogBox.ParentX := FParentX;
    DogBox.ParentY := FParentY;
    DogBox.IndexDogBox := FIndexDogBox + 1;

    FListDogBox.Add(DogBox);
  end;
end;

procedure TT3Vectac.SetAirborne_Descent_Rate(const Value: Double);
begin
  FAirborne_Descent_Rate := Value;
end;

procedure TT3Vectac.SetConfirmDrop(const Value: Boolean);
begin
  FConfirmDrop := Value;
end;

procedure TT3Vectac.SetExpiredTime(const Value: Double);
begin
  FExpiredTime := Value;
end;

procedure TT3Vectac.SetSearchRadius(const Value: Double);
begin
  FSearchRadius := Value;
end;

procedure TT3Vectac.SetSnapshotData(const ss : _SS_TT3Vectac);
var
  I: Integer;
  DogBox: TT3DogBox;
//var
//  obj : TT3PlatformInstance ;
begin
  TT3Weapon(Self).SetSnapshotData(ss.W);
  Longitude      := ss.Longitude ;
  Latitude       := ss.Latitude ;
  Tracked        := ss.Tracked ;
  Planned        := ss.Planned ;


  for I := Low(ss.ListDogBox) to High(ss.ListDogBox) do
  begin
    DogBox := TT3DogBox.Create;
    DogBox.IndexDogBox  :=  ss.ListDogBox[i].IndexDogBox;
    DogBox.SearchRadius :=  ss.ListDogBox[i].SearchRadius;
    DogBox.ExpiredTime  :=  ss.ListDogBox[i].ExpiredTime;
    DogBox.ParentX      :=  ss.ListDogBox[i].ParentX;
    DogBox.ParentY      :=  ss.ListDogBox[i].ParentY;
    DogBox.VisibLe      :=  ss.ListDogBox[i].VisibLe;
    DogBox.Converter    :=  Self.Converter;
    FListDogBox.Add(DogBox);
  end;
//  ShowTrackLine  := ss.OnDraw ;
end;

procedure TT3Vectac.SetVisibleDogBox(const Value: Boolean);
var
  I: Integer;
begin
  FVisibleDogBox := Value;

  if FListDogBox.Count > 0 then
  begin
    for I := 0 to FListDogBox.Count - 1 do
    begin
      TT3DogBox(FListDogBox.Items[i]).VisibLe := Value;
    end;
  end;
end;

procedure TT3Vectac.UpdateVisual;
var
  I : Integer;
begin
  if FListDogBox.Count > 0 then
  begin
    for I := 0 to FListDogBox.Count - 1 do
    begin
      TT3DogBox(FListDogBox.Items[i]).UpdateVisual;
    end;
  end;
end;
end.
