unit uSimManagerTTT;

interface

uses
   Classes, SysUtils,
     uThreadTimer, uVirtualTime, uSimContainers,
     uSimManager , uSimObjects;

type

  TT3SimManager = class(TSimManager)
  protected
    FPlatForms : TSimObjectNode;

    procedure FGameThread_OnTerminate(sender: TObject);
    procedure FGameThread_OnMainTimer(const dt: double); virtual;
  public
    constructor Create;
    destructor Destroy; override;


    procedure ResetScenario;   override;
    procedure LoadScenarioID(const sc_index: integer); override;

    procedure GameStart; override;
    procedure GamePause; override;
  end;


implementation

{ TSimManagerTTT }

constructor TT3SimManager.Create;
begin
  inherited;
  FPlatForms := TSimObjectNode.Create;

end;

destructor TT3SimManager.Destroy;
begin
  FPlatForms.Free;

  inherited;
end;

procedure TT3SimManager.FGameThread_OnMainTimer(const dt: double);
begin
  FMainVTime.IncreaseMillisecond(dt);


end;

procedure TT3SimManager.FGameThread_OnTerminate(sender: TObject);
begin

end;

procedure TT3SimManager.GamePause;
begin
  inherited;
  FGameThread.OnRunning := FGameThread_OnMainTimer;

end;

procedure TT3SimManager.GameStart;
begin
  inherited;

end;

procedure TT3SimManager.ResetScenario;
begin
  inherited;
  FPlatForms.ClearChilds; // clear only, did not free it;

end;

procedure TT3SimManager.LoadScenarioID(const sc_index: integer);
var i: Integer;
begin
  ResetScenario;

  FScenario.LoadFromDB(sc_index);



  for I := 0 to FScenario.Platform_Insts.Count - 1 do begin
    FPlatForms.AddChild(FScenario.Platform_Insts.Items[i]);
  end;
//??  FScenario.Platform_Insts.Clear; ??



end;


end.

