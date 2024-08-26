unit uNetMgr_Server;

interface

uses
   Classes, SysUtils, OverbyteIcsWSocket,
   uTCPDatatype, uTCPServer, uThreadTimer,
   uNetMgr; //, ufDebugNet;
type

//==============================================================================
  TNetMgr_Server = class(TNetMgr)
  private
    procedure FNetServer_OnClientConnect(const S: string);
    procedure FNetServer_OnClientDisConnect(const S: string);

  protected
    FUseDebug : Boolean;
//    FrmDebugNet: TfrmDebug;
    FNetServer: TTCPServer;

    procedure FNetThread_OnCreate(const dt: double); override;
    procedure FNetThread_OnTerminate (sender : TObject);  override;

  public

    constructor Create;
    destructor Destroy; override;

//    procedure SetDebugForm(frm: TfrmDebug);

  public


  end;

var
  netServer: TNetMgr_Server;

implementation

{ TNetHandlerServer }


constructor TNetMgr_Server.Create;
begin
  inherited;
//  FrmDebugNet := nil;
  FUseDebug := false;

end;

destructor TNetMgr_Server.Destroy;
begin
  if Assigned(FNetThread) then begin
    FNetThread.FreeOnTerminate := true;
    FNetThread.Terminate;
  end;

//  FrmDebugNet.Free;
//  inherited;
end;

procedure TNetMgr_Server.FNetServer_OnClientConnect(const S: string);
begin
{  if FrmDebugNet <> nil then
    FrmDebugNet.Add_ConnectionStatus(s, True);
}
end;
procedure TNetMgr_Server.FNetServer_OnClientDisConnect(const S: string);
begin
{  if FrmDebugNet <> nil then
    FrmDebugNet.Add_ConnectionStatus(s, False);
}end;

procedure TNetMgr_Server.FNetThread_OnCreate(const dt: double);
begin
  FNetServer := TTCPServer.Create;
  FNetSock   := FNetServer;

  FNetThread.OnRunning := FNetThread_OnRunning;

  FNetServer.OnClient_Connect     := FNetServer_OnClientConnect;
  FNetServer.OnClient_DisConnect  := FNetServer_OnClientDisconnect;

  if FUseDebug then begin

{    FNetServer.OnGetStatusLog :=  FrmDebugNet.Add_NetStatusLog;
    FNetServer.OnGetSendLog   :=  FrmDebugNet.Add_NetSendLog;
    FNetServer.OnGetRecvLog   :=  FrmDebugNet.Add_NetRecvLog;
}
  end;

  FNetServer.Listen(BasePort);

end;

procedure TNetMgr_Server.FNetThread_OnTerminate(sender: TObject);
begin
  inherited;
  FNetServer := nil;

end;

{procedure TNetMgr_Server.SetDebugForm(frm: TfrmDebug);
begin
  FrmDebugNet := frm;
  FUseDebug := FrmDebugNet <> nil;

  if FUseDebug then begin
    if Assigned(FNetServer) then begin
      FNetServer.OnGetStatusLog :=  FrmDebugNet.Add_NetStatusLog;
      FNetServer.OnGetSendLog   :=  FrmDebugNet.Add_NetSendLog;
      FNetServer.OnGetRecvLog   :=  FrmDebugNet.Add_NetRecvLog;
    end;
  end
  else begin
    if Assigned(FNetServer) then begin
      FNetServer.OnGetStatusLog :=  nil;
      FNetServer.OnGetSendLog   :=  nil;
      FNetServer.OnGetRecvLog   :=  nil;
    end;
  end;

end;
}
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
