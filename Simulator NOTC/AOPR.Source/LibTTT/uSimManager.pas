unit uSimManager;

interface

uses

  uThreadTimer, uVirtualTime, uSimContainers,
  uDBScenario;


type

//==============================================================================
  TGamePlayState = (gsStop, gsPlaying, gsTerminated );
//  TSessionState  = (ssNoSession, ssActiveSession);

  TSimManager = class
  protected
    FGameThread   : TMSTimer;
    FGotoThread   : TMSTimer;
    FDeviceThread : TMSTimer;
    FMainList     : TSimContainer;
    FMainVTime    : TVirtualTime;

    FScenario     : tT3DBScenario;
    FGameSpeed    : double;

    FGameState    : TGamePlayState;

    //tambahan thread timer sementara untuk pengambilan data dari jaringan
    FNetworkThread     : TMSTimer;
    FNetworkThreadTemp : TMSTimer;

    //Tambahan untuk mengambil paket data yang diterima dari VBS
    FNetworkThreadVBS  : TMSTimer;
  private

  protected
    function GetGameTime: TDateTime;
    function getGameSpeed: double;
    function getGameState: boolean;
    procedure setGameSpeed(const Value: double); virtual;

    procedure ResetScenario;   virtual;

  public

    constructor Create;
    destructor Destroy; override;


    procedure GameStart; virtual;
    procedure GamePause; virtual;
    procedure GameTerminate; virtual;

    property GameTIME: TDateTime read GetGameTime;
    property GameSPEED: double read getGameSpeed write setGameSpeed;
    property GameIsRunning: boolean read getGameState;
    property GameState: TGamePlayState read FGameState;
    property MainVTime: TVirtualTime read FMainVTime;

  end;


implementation


uses
 SysUtils;
{ TSimManager }

constructor TSimManager.Create;
begin
  FGameState    := gsStop;

  FMainList     := TSimContainer.Create;
  FMainVTime    := TVirtualTime.Create;
  FGameSpeed    := 0.0;

  FGotoThread   := TMSTimer.Create;
  FGameThread   := TMSTimer.Create;
  FDeviceThread := TMSTimer.Create;
  FGameState    := gsStop;

  FScenario     := tT3DBScenario.Create;

  FNetworkThread := TMSTimer.Create;
  FNetworkThread.Interval := 2;

  FNetworkThreadVBS := TMSTimer.Create;
  FNetworkThreadVBS.Interval := 2;

  FNetworkThreadTemp := nil;
end;

destructor TSimManager.Destroy;
begin
  if Assigned(FNetworkThreadTemp) then
  begin
    FNetworkThreadTemp.Enabled := False;
    FNetworkThreadTemp.OnRunning := nil;
    FNetworkThreadTemp.Free;
  end;

  FNetworkThreadVBS.Enabled := False;
  FNetworkThreadVBS.OnRunning := nil;

  FNetworkThread.Enabled := False;
  FNetworkThread.OnRunning := nil;

  FNetworkThreadVBS.Free;
  FNetworkThread.Free;

  FGameState    := gsStop;
  FScenario.Free;

  FDeviceThread.OnRunning := nil;
  FDeviceThread.Free;

  FGameThread.OnRunning := nil;
  FGameThread.Free;

  FGotoThread.OnRunning := nil;
  FGotoThread.Free;

  FMainVTime.Free;
  FMainList.Free;

  inherited;
end;

procedure TSimManager.GamePause;
begin
  FGameState    := gsStop;
end;

procedure TSimManager.GameStart;
begin
  FGameState    := gsPlaying;
end;

procedure TSimManager.GameTerminate;
begin
  FGameState    := gsTerminated;
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
end;

function TSimManager.getGameSpeed: double;
begin
  result := FGameSpeed;
end;

function TSimManager.getGameState: boolean;
begin
  result := FGameState = gsPlaying;
end;

procedure TSimManager.setGameSpeed(const Value: double);
begin
  FGameSpeed := Value;
end;

end.
