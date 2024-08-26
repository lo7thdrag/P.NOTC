unit uNetMgr_Server;

interface

uses
   Classes, SysUtils, OverbyteIcsWSocket,
   uTCPDatatype, uTCPServer, uThreadTimer,
   uNetMgr, ufDebugNet;
type

//==============================================================================
  TNetHandlerServer = class(TNetMgr)
  private
    procedure FNetServer_OnClientConnect(const S: string);
    procedure FNetServer_OnClientDisConnect(const S: string);

  protected
    FUseDebug: Boolean;
    FrmDebugNet: TfrmDebug;
    FNetServer: TTCPServer;

    procedure FNetThread_OnCreate(const dt: double); override;
    procedure FNetThread_OnTerminate (sender : TObject);  override;

  public

    constructor Create;
    destructor Destroy; override;

    procedure ShowDebugForm;

  public


  end;

var
  netServer: TNetHandlerServer;

implementation

{ TNetHandlerServer }


constructor TNetHandlerServer.Create;
begin
  inherited;
  FrmDebugNet := nil;

  FUseDebug := True;
  if FUseDebug then begin
    FrmDebugNet := TfrmDebug.Create(nil);
    FrmDebugNet.Show;
  end;

end;

destructor TNetHandlerServer.Destroy;
begin
  if Assigned(FNetThread) then begin
    FNetThread.Terminate;
    FNetThread.Free;
  end;

  FrmDebugNet.Free;
  inherited;
end;

procedure TNetHandlerServer.FNetServer_OnClientConnect(const S: string);
begin
  if FrmDebugNet <> nil then
    FrmDebugNet.Add_ConnectionStatus(s, True);
end;
procedure TNetHandlerServer.FNetServer_OnClientDisConnect(const S: string);
begin
  if FrmDebugNet <> nil then
    FrmDebugNet.Add_ConnectionStatus(s, False);
end;

procedure TNetHandlerServer.FNetThread_OnCreate(const dt: double);
begin
  FNetServer := TTCPServer.Create;
  FNetSock   := FNetServer;

  FNetThread.OnRunning := FNetThread_OnRunning;

  FNetServer.OnClient_Connect     := FNetServer_OnClientConnect;
  FNetServer.OnClient_DisConnect  := FNetServer_OnClientDisconnect;

  if FUseDebug then begin

    FNetServer.OnGetStatusLog :=  FrmDebugNet.Add_NetStatusLog;
    FNetServer.OnGetSendLog   :=  FrmDebugNet.Add_NetSendLog;
    FNetServer.OnGetRecvLog   :=  FrmDebugNet.Add_NetRecvLog;

  end;

  FNetServer.Listen(BasePort);

end;

procedure TNetHandlerServer.FNetThread_OnTerminate(sender: TObject);
begin
  inherited;
  FNetServer := nil;

end;

procedure TNetHandlerServer.ShowDebugForm;
begin
  if FrmDebugNet <> nil  then
    FrmDebugNet.Show;
end;

{procedure TNetHandlerServer.StartNetworking;
begin
  FNetThread := TZTimer.Create;
  FNetThread.OnRunning    := FNetThread_OnCreate;
  FNetThread.OnTerminate  := FNetThread_OnTerminate;
  FNetThread.Start;

end;

procedure TNetHandlerServer.StopNetworking;
begin
  FNetThread.Terminate;
  FNetThread.Free;

end;
}
end.
