unit uController;

interface

uses u2Dmover, Classes;

type

//==============================================================================
  TSteering = class
  private
    Mover: T2DMover;
  private
    function GetSpeed: double;
    procedure SetSpeed(val: double);

    function GetHeading: double;
    procedure SetHeading(val: double);
  public
    constructor Create;
    property Heading: double read GetHeading write SetHeading;
    procedure update(dt: double);
  public
    property Speed: double read GetSpeed;

  end;

//==============================================================================
  TWayPoint = class
  private
    function GetPatrol: Boolean;
    procedure SetPatrol(val: Boolean);

  public

    FPoints: Classes.TList;
    constructor Create;
    destructor Destroy; override;

  public
    property Patrol: Boolean read GetPatrol write SetPatrol;
  end;
//==============================================================================

implementation


{ TSteering }

constructor TSteering.Create;
begin
  Mover := T2DMover.Create;
end;

function TSteering.GetHeading: double;
begin

end;

function TSteering.GetSpeed: double;
begin

end;

procedure TSteering.SetHeading(val: double);
begin

end;

procedure TSteering.SetSpeed(val: double);
begin

end;

procedure TSteering.update(dt: double);
begin
  Mover.Move(dt);
end;

{ TWayPoint }

constructor TWayPoint.Create;
begin

end;

destructor TWayPoint.Destroy;
begin

  inherited;
end;

function TWayPoint.GetPatrol: Boolean;
begin

end;

procedure TWayPoint.SetPatrol(val: Boolean);
begin

end;

end.
