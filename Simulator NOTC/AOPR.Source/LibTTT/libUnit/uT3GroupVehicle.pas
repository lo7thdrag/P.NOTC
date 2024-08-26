unit uT3GroupVehicle;

interface
uses
  Classes, uSimObjects, uT3Vehicle, uT3Unit;
Type
  T3GroupVehicle = class
  private
    FCourse: Double;
    FSpeed: Double;
    FListVehicle : TList;
    FGroupName: AnsiString;
    FGroupID: Integer;
    FCubicleGroupID: Integer;
    FHeading: Double;
    FDiffX: Double;
    FDiffY: Double;

    procedure SetCourse(const Value: Double);
    procedure SetSpeed(const Value: Double);
    procedure setGroupName(const Value: AnsiString);
    procedure setGroupID(const Value: Integer);
    procedure setCubicleGroupID(const Value: Integer);
    procedure SetHeading(const Value: Double);
  public
    constructor Create;
    destructor Destroy; override;

    function GetVehicle(index : Integer):TSimObject;
    function CountVe:Integer;
    procedure AddVehicle(obj : TSimObject);
    procedure Reposition (x, y : Double);
    procedure DeleteList;

    property GroupName : AnsiString read FGroupName write setGroupName;
    property GroupID : Integer read FGroupID write setGroupID;
    property CubicleGroupID : Integer read FCubicleGroupID write setCubicleGroupID;
    property Speed : Double read FSpeed write SetSpeed;
    property Course : Double read FCourse write SetCourse;
    property Heading : Double read FHeading write SetHeading;
    property DiffX : Double read FDiffX write FDiffX;
    property DiffY : Double read FDiffY write FDiffY;
  end;
implementation

{ T3GroupVehicle }

procedure T3GroupVehicle.AddVehicle(obj: TSimObject);
var
  Pi : TT3PlatformInstance;
  i : Integer;
  found : Boolean;
begin
  if FListVehicle.Count > 0 then
  begin
    found := True;

    if FListVehicle.IndexOf(obj) = -1 then
      found := False;

    if found = False then
      FListVehicle.Add(obj);
  end
  else
    FListVehicle.Add(obj);
end;

function T3GroupVehicle.CountVe: Integer;
begin
  Result := FListVehicle.Count;
end;

constructor T3GroupVehicle.Create;
begin
  inherited;
  FListVehicle := TList.Create;
end;

procedure T3GroupVehicle.DeleteList;
var
  i : Integer;
  aobj : TT3Vehicle;
begin
  if FListVehicle.Count > 0 then
  begin
    for i := FListVehicle.Count - 1 downto 0 do
    begin
      aobj := TT3Vehicle(FListVehicle.Items[i]);
      aobj.IsGrouped := False;
      FListVehicle.Delete(i);
    end;
  end;
end;

destructor T3GroupVehicle.Destroy;
var
  i : Integer;
begin
  if FListVehicle.Count > 0 then
  begin
    for i := FListVehicle.Count - 1 downto 0 do
    begin
      FListVehicle.Delete(i);
    end;
  end;

  FListVehicle.Clear;
  FListVehicle.Free;
  inherited;
end;

function T3GroupVehicle.GetVehicle(index: Integer): TSimObject;
begin
  Result := nil;
  Result := FListVehicle.Items[index];
end;

procedure T3GroupVehicle.Reposition(x, y: Double);
var
  pi : TT3PlatformInstance;
  i : Integer;
  aObj : TSimObject;
begin
  aObj := FListVehicle.Items[0];
  pi := TT3PlatformInstance(aObj);
  FDiffX := x - pi.getPositionX;
  FDiffY := y - pi.getPositionY;

  for i := 0 to FListVehicle.Count - 1 do
  begin
    aObj := FListVehicle.Items[i];
    pi := TT3PlatformInstance(aObj);
    pi.RepositionTo(pi.getPositionX + FDiffX, pi.getPositionY + FDiffY);
  end;
end;

procedure T3GroupVehicle.SetCourse(const Value: Double);
var
  ve : TT3Vehicle;
  i : Integer;
  Speed : Double;
begin
  FCourse := Value;

  for i := 0 to FListVehicle.Count - 1 do
  begin
    ve := TT3Vehicle(FListVehicle.Items[i]);
    ve.OrderedHeading := Value;
    ve.FirstHeading   := Value;
    ve.HelmDegree     := Value;
    ve.EvasionDegree  := Value;
    ve.CircleDirection:= Value;
    ve.OrderedZigzag  := Value;
    ve.OrderedSinuation := Value;
    ve.tempHeading := Value;
  end;
end;

procedure T3GroupVehicle.setCubicleGroupID(const Value: Integer);
begin
  FCubicleGroupID := Value;
end;

procedure T3GroupVehicle.setGroupID(const Value: Integer);
begin
  FGroupID := Value;
end;

procedure T3GroupVehicle.setGroupName(const Value: AnsiString);
begin
  FGroupName := Value;
end;

procedure T3GroupVehicle.SetHeading(const Value: Double);
var
  ve : TT3Vehicle;
  i : Integer;
begin
  FHeading := Value;
  FCourse := Value;

  for i := 0 to FListVehicle.Count - 1 do
  begin
    ve := TT3Vehicle(FListVehicle.Items[i]);
    ve.OrderedHeading := Value;
    ve.Heading := Value;
  end;
end;

procedure T3GroupVehicle.SetSpeed(const Value: Double);
var
  ve : TT3Vehicle;
  i : Integer;
  Speed : Double;
begin
  FSpeed := Value;

  for i := 0 to FListVehicle.Count - 1 do
  begin
    ve := TT3Vehicle(FListVehicle.Items[i]);
    Speed := Value;

    if Value > ve.Mover.MaxSpeed then
      Speed := ve.Mover.MaxSpeed
    else if Value < ve.Mover.MinSpeed then
      Speed := ve.Mover.MinSpeed;

    ve.OrderedSpeed := Speed;
    ve.WaypointLastSpeed := Speed;
    ve.TempSpeed := Speed;
  end;

  FSpeed := Speed;
end;

end.
