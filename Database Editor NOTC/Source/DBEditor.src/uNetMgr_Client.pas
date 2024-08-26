unit uNetMgr_Client;

interface

uses
   Classes, SysUtils, OverbyteIcsWSocket,
   uTCPDatatype, uTCPClient, uThreadTimer,
   uNetMgr, ufDebugNet;
type

//==============================================================================
  TNetMgr_Client = class(TNetMgr)
  private
    FServerIP: string;

//    procedure FNetClient_OnStateChange(st: TSocketState);

    procedure setServerIp(const Value: string);

  protected
    FUseDebug : Boolean;
    FrmDebugNet: TfrmDebug;
    FNetClient: TTCPClient;

    procedure FNetThread_OnCreate(const dt: double); override;
    procedure FNetThread_OnTerminate (sender : TObject);  override;

  public

    constructor Create;
    destructor Destroy; override;

    procedure SetDebugForm(frm: TfrmDebug);

  public
    property  ServerIP: string read FServerIP write setServerIp;


  end;

var
  netClient: TNetMgr_Client;

implementation

{ TNetHandlerServer }


constructor TNetMgr_Client.Create;
begin
  inherited;
  FrmDebugNet := nil;
  FUseDebug := false;

end;

destructor TNetMgr_Client.Destroy;
begin
  if Assigned(FNetThread) then begin
    FNetThread.FreeOnTerminate := true;
    FNetThread.Terminate;
  end;

  FrmDebugNet.Free;
//  inherited;
end;

{procedure TNetMgr_Client.FNetClient_OnStateChange(st: TSocketState);
begin
  if FUseDebug then begin

    FrmDebugNet.Add_NetStatusLog(SockStateToString(st));
  end;
end;
}
procedure TNetMgr_Client.FNetThread_OnCreate(const dt: double);
begin
  FNetClient := TTCPClient.Create;
  FNetSock   := FNetClient;

  FNetThread.OnRunning := FNetThread_OnRunning;
  FNetClient.Connect(FServerIP,  BasePort);


//  FNetClient.  OnClient_Connect     := FNetClient_OnClientConnect;
//  FNetClient.OnClient_DisConnect  := FNetClient_OnClientDisconnect;
//    FNetClient.OnStateChange := FNetClient_OnStateChange;

  if FUseDebug then begin

    FNetClient.OnGetStatusLog :=  FrmDebugNet.Add_NetStatusLog;
    FNetClient.OnGetSendLog   :=  FrmDebugNet.Add_NetSendLog;
    FNetClient.OnGetRecvLog   :=  FrmDebugNet.Add_NetRecvLog;

  end;

//  FNetClient.Connect Listen(BasePort);

end;

procedure TNetMgr_Client.FNetThread_OnTerminate(sender: TObject);
begin
  inherited;
  FNetClient := nil;

end;

procedure TNetMgr_Client.SetDebugForm(frm: TfrmDebug);
begin
  FrmDebugNet := frm;
  FUseDebug := FrmDebugNet <> nil;

  if FUseDebug then begin
    if Assigned(FNetClient) then begin
      FNetClient.OnGetStatusLog :=  FrmDebugNet.Add_NetStatusLog;
      FNetClient.OnGetSendLog   :=  FrmDebugNet.Add_NetSendLog;
      FNetClient.OnGetRecvLog   :=  FrmDebugNet.Add_NetRecvLog;
    end;
  end
  else begin
    if Assigned(FNetClient) then begin
      FNetClient.OnGetStatusLog :=  nil;
      FNetClient.OnGetSendLog   :=  nil;
      FNetClient.OnGetRecvLog   :=  nil;
    end;
  end;

end;

procedure TNetMgr_Client.setServerIp(const Value: string);
begin
  FServerIP := Value;
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
