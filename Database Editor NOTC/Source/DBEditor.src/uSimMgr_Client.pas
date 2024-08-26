unit uSimMgr_Client;

interface

uses
   Classes, SysUtils,

     uT3SimManager;

type

//==============================================================================
// TTT simCenter
// contain: 'session' , scenario management,  objects run..
//
//==============================================================================

  TSimMgr_Client = class(TT3SimManager)

    procedure FGameThread_OnTerminate(sender: TObject);
    procedure FGameThread_OnMainTimer(const dt: double); virtual;

  public

    constructor Create;
    destructor Destroy; override;

  // scenario management
    procedure ReqSessionStatus;

    procedure ReqCreateNewSession;
    procedure ReqCloseSession;

    procedure ReqPrepareNewScenario;
    procedure ReqClearScenario;

    procedure ReqPlayScenario; // resume
    procedure ReqPauseScenario;

  public

  end;


var
  simMgrClient: TSimMgr_Client;

implementation


{ TSimMgr_Server }

constructor TSimMgr_Client.Create;
begin
  inherited;

end;

destructor TSimMgr_Client.Destroy;
begin

  inherited;
end;

procedure TSimMgr_Client.FGameThread_OnTerminate(sender: TObject);
begin

end;


procedure TSimMgr_Client.FGameThread_OnMainTimer(const dt: double);
begin

end;

procedure TSimMgr_Client.ReqSessionStatus;
begin

end;

procedure TSimMgr_Client.ReqCreateNewSession;
begin
{  FMainVTime.Reset();
  FGameThread.OnRunning := FGameThread_OnMainTimer;

  FSessionState         := ssActiveSession;
}
end;

procedure TSimMgr_Client.ReqCloseSession;
begin
{  FSessionState := ssNoSession;

  FGameThread.OnRunning := nil;
  FMainList.ClearObject;
  FMainVTime.Reset();

 }

end;

procedure TSimMgr_Client.ReqClearScenario;
begin
{  FGameThread.OnRunning := nil;
  FMainList.ClearObject;
  FMainVTime.Reset();

  FScenario.CloseScenario;
}
end;

procedure TSimMgr_Client.ReqPrepareNewScenario;
begin
{  FScenario.Init_Scenario;

//  FScenario.InfoMap := CTTT_defmap;
    FScenario.InfoMap := LibMapSetting.MapGeoset;

}
end;

procedure TSimMgr_Client.ReqPauseScenario;
begin
//  FGameThread.Suspend;
end;

procedure TSimMgr_Client.ReqPlayScenario;
begin
//  FGameThread.Resume;
end;




{procedure TSimMgr_Client.LoadScenario(const ss: string);
begin
  FScenario.LoadFromFile(ss);
  CreateObjectFromScenario;

end;
}
end.
