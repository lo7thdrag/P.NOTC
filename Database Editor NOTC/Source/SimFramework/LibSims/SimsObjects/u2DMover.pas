unit u2DMover;
{ simple n fast movement calculator
  by Andy Sucipto
  20 Agustus 2007

  catatan:
    speed = knots,
    X dan Y -> dalam degree longlat ;
}

interface

type

  T2DMover = class // 2 D mover
  private
    FEnabled: boolean;
    function GetDirection(): double;
    procedure SetDirection(const Value: double);

    function GetTurnRate: double;
    procedure SetTurnRate(const Value: double);

    function GetAcceleration: double;
    procedure SetAcceleration(const Value: double);

    function GetSpeed: double;
    procedure SetSpeed(const Value: double);

    function GetDeltaDir: double;
    procedure SetEnabled(const Value: boolean);

    function GetMaxSpeed: double;
    procedure SetMaxSpeed(const Value:double);
    function getVerticalAccel: Double;
    function getClimbRate: Double;
    function getDescentRate: Double;
    procedure SetClimbRate(const Value: Double);
    procedure SetDescentRate(const Value: Double);
    procedure setVerticalAccel(const Value: Double);
    function getVerticalSpeed: double;
    procedure setVerticalSpeed(const Value: double);

  protected
    FPosX, FPosY, FPosZ: double; // long lat;

    FAcceleration: double; // knots / second ??/
    FSpeed,Max_Speed: double; // degree / ms

    FTurnRate: double; // Radians per second;

    FDirection: double; // 0 .. 2 Pi;
    FDeltaDir: double;

    FSinX, FCosX: extended;

    FVerticalSpeed,
    FVerticalAccel,
    FClimbRate,
    FDescentRate     : Double;


  public
    constructor Create;

    procedure Calc_Speed(const aDt: double); // if accelerate
    procedure Calc_Direction(const aDt: double); // if turn
    procedure Calc_Movement(const aDt: double); //

    procedure Move(const aDt: double); // dt : millisecond;

  public
    property X: double read FPosX write FPosX; // asli longlat;
    property Y: double read FPosY write FPosY;
    property Z: double read FPosZ write FPosZ;

    property Enabled: boolean read FEnabled write SetEnabled;

    property Acceleration: double      //knot per second
      read GetAcceleration write SetAcceleration;

    property Speed: double            // knots
      read GetSpeed write SetSpeed;

    property Direction: double        // degree 0 .. 360 cartesian
      read GetDirection write SetDirection;

    property DeltaDirection: double   // degree 0 .. 360 cartesian
      read GetDeltaDir;

    property TurnRate: double         // degree per second;
      read GetTurnRate write SetTurnRate;


    property MaxSpeed : double
      read GetMaxSpeed write SetMaxSpeed;     //knots

    property Vertical_Accel: Double read getVerticalAccel
      write setVerticalAccel;  // feet per minute

    property ClimbRate: Double read  getClimbRate
      write SetClimbRate;     // feet per minute

    property DescentRate: Double read  getDescentRate
      write SetDescentRate;    // feet per minute

    property VerticalSpeed: double read getVerticalSpeed write setVerticalSpeed;

  

  end;

implementation

uses Math;

const

  C_2_Pi: double = 2.0 * Pi;

  C_RadToDeg = 180.0 / Pi;
  C_DegToRad = Pi / 180.0;

  C_Degree_To_NauticalMile = 60.0;
  C_NauticalMile_To_Degree = 1.0 / 60.0;
  C_SecondToHour: double = 1 / 3600.0;
  C_HourToSecond: double = 3600.0;

  C_MilliSecondToSecond: double = 0.001;
  C_SecondToMilliSecond: double = 1000.0;

  C_NauticalMile_To_Feet = 6076.0;
  C_Degree_To_Feet = C_Degree_To_NauticalMile * C_NauticalMile_To_Feet;


function ValidateRange(const aVal, aMaxVal: double): double;
begin
  result := aVal - (Floor(aVal / aMaxVal) * aMaxVal);
end;

{ T2DMover }

constructor T2DMover.Create;
begin
  FEnabled := False;
end;

// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

function T2DMover.GetMaxSpeed;
begin
  Result := Max_Speed;
end;

 procedure T2DMover.SetMaxSpeed(const Value: double);
begin
  // value = knots, FSpeed = degree per millisecond;
  Max_Speed := Value;
end;

function T2DMover.GetDirection(): double;
begin
  Result := C_RadToDeg * FDirection;

end;

procedure T2DMover.SetDirection(const Value: double);
begin
  FDirection := C_DegToRad * Value;
  SinCos(FDirection, FSinx, FCosX);
end;

// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

function T2DMover.GetTurnRate: double;
begin
  result := C_RadToDeg *  FTurnRate;
end;

// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

procedure T2DMover.SetTurnRate(const Value: double);
begin
  FTurnRate := C_DegToRad * Value;
end;

// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

function T2DMover.GetAcceleration: double;
begin //knot per second ??.
  result := FAcceleration * C_Degree_To_NauticalMile * C_HourToSecond ;

end;

procedure T2DMover.SetAcceleration(const Value: double);
begin
  FAcceleration := C_NauticalMile_To_Degree * Value /
    (C_HourToSecond)
end;

// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

function T2DMover.GetSpeed: double;
begin
  result := FSpeed * C_Degree_To_NauticalMile * C_HourToSecond;

end;

procedure T2DMover.SetSpeed(const Value: double);
begin
  // value = knots, FSpeed = degree per millisecond;
  FSpeed := C_NauticalMile_To_Degree * Value * C_SecondToHour;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure T2DMover.Calc_Speed(const aDt: double);
begin
  // speed : degree per second;
  // aDt   : second;
  FSpeed := FSpeed + FAcceleration * aDt;
  if (FSpeed > Max_Speed) then FAcceleration := 0;
//
  FVerticalSpeed := FVerticalSpeed + FVerticalAccel * aDt;

  if FVerticalAccel < 0 then begin
    if abs (FVerticalSpeed) > FDescentRate  then
     FVerticalSpeed := -FDescentRate;

  end
  else if FVerticalAccel > 0 then begin

    if FVerticalSpeed > FClimbRate then
      FVerticalSpeed := FClimbRate;
  end;

//  if FVerticalSpeed then

end;

procedure T2DMover.Calc_Direction(const aDt: double);
begin
  //Direction : cartesian degree, 0.. 2 Pi , 0 = east
  //FTurnRate : radian per milli second

  FDeltaDir  := FTurnRate * aDt;
  FDirection := FDirection + FDeltaDir;
  FDirection := ValidateRange(FDirection, C_2_Pi);
  SinCos(FDirection, FSinX, FCosX);
end;

procedure T2DMover.Calc_Movement(const aDt: double);
var
  d, dx, dy: double;
  dH: Double;
begin
  // x := v . t;
  d := FSpeed * aDt;

  dx := d * FCosX;
  dy := d * FSinX;

  FPosX := FPosX + dx;
  FPosY := FPosY + dy;

  dH := FVerticalSpeed  * aDt;
  FPosZ := FPosZ + dH;

end;

procedure T2DMover.Move(const aDt: double);
begin
  if not FEnabled then Exit;
  Calc_Speed(aDt);
  if ABS(FSpeed) > 0.00000001 then begin
    Calc_Direction(aDt);
    Calc_Movement(aDt);
  end;
end;

function T2DMover.GetDeltaDir: double;
begin
  result := C_RadToDeg * FDeltaDir;
end;


procedure T2DMover.SetEnabled(const Value: boolean);
begin
  FEnabled := Value;
end;

function T2DMover.getVerticalAccel: Double;
begin
  Result := FVerticalAccel;
end;

function T2DMover.getVerticalSpeed: double;
begin
//internal" degree per detik
// esternal" feet per minute
  result := FVerticalSpeed * ( 60.0 * C_Degree_To_Feet);

end;

procedure T2DMover.setVerticalSpeed(const Value: double);
begin // feet per minute
  FVerticalSpeed := Value /( 60.0 * C_Degree_To_Feet );
end;

procedure T2DMover.setVerticalAccel(const Value: Double);
begin // feet per minute / second.
  FVerticalAccel := Value / ( 60.0 * C_Degree_To_Feet);
end;



function T2DMover.getClimbRate: Double;
begin  // feet per minute
  Result :=  FClimbRate * (60.0 * C_Degree_To_Feet);

end;

procedure T2DMover.SetClimbRate(const Value: Double);
begin // feet per menit
  FClimbRate := (Value /(60.0 * C_Degree_To_Feet)) ;  // == degree per detik

end;

function T2DMover.getDescentRate: Double;
begin  // feet per minute
  Result :=  FDescentRate * (60.0 * C_Degree_To_Feet);

end;

procedure T2DMover.SetDescentRate(const Value: Double);
begin  // feet per minute
  FDescentRate := (Value /(60.0 * C_Degree_To_Feet)) ;  // == degree per detik
end;


end.
