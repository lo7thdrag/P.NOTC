unit uSimManager;

interface

uses

  uThreadTimer, uVirtualTime, uSimContainers,
  uDBScenario;


type

//==============================================================================
  TGamePlayState = (gsStop, gsCreateScenario, gsPlaying );
  TSessionState  = (ssNoSession, ssActiveSession);

  TSimManager = class
  protected
    FGameThread   : TMSTimer;
    FMainList     : TSimContainer;
    FMainVTime    : TVirtualTime;
    FSessionState : TSessionState;

    FScenario     : tT3DBScenario;
    FGameSpeed    : double;
  private
    function GetGameTime: TDateTime;
    function getGameSpeed: double;
    procedure setGameSpeed(const Value: double);

  protected
    procedure ResetScenario;   virtual;

  public

    constructor Create;
    destructor Destroy; override;


    procedure GameStart; virtual;
    procedure GamePause; virtual;
    property GameTIME: TDateTime read GetGameTime;
    property GameSPEED: double read getGameSpeed write setGameSpeed;

  end;


implementation


uses
 SysUtils;
{ TSimManager }

constructor TSimManager.Create;
begin
  FSessionState := ssNoSession;

  FMainList     := TSimContainer.Create;
  FMainVTime    := TVirtualTime.Create;
  FGameSpeed    := 1.0;

  FGameThread   := TMSTimer.Create;
  FScenario     := tT3DBScenario.Create;

end;

destructor TSimManager.Destroy;
begin
  FSessionState := ssNoSession;
  FScenario.Free;

  FGameThread.OnRunning := nil;
  FGameThread.Free;

  FMainVTime.Free;
  FMainList.Free;

  inherited;
end;

procedure TSimManager.GamePause;
begin

end;

procedure TSimManager.GameStart;
begin

end;


function TSimManager.GetGameTime: TDateTime;
begin
  result := FMainVTime.GetTime;
end;

procedure TSimManager.ResetScenario;
begin
  FMainList.ClearAndFreeObject;

  FMainVTime.DateTimeOffset := Now;
  FMainVTime.Reset();
  FSessionState := ssNoSession;

end;

function TSimManager.getGameSpeed: double;
begin
  result := FGameSpeed;
end;


procedure TSimManager.setGameSpeed(const Value: double);
begin
  FGameSpeed := Value;
end;

end.
