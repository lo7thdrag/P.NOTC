unit uNetHandle_Client;

interface

uses
   Classes, SysUtils, OverbyteIcsWSocket,
   uTCPClient,  uNetUDPnode, uNetHandle_TTT;
type

//==============================================================================
  TNetHandler_Client = class(TNetHandle_TTT)
  private
    FServerIP: string;
//    procedure FNetClient_OnStateChange(st: TSocketState);

    procedure setServerIp(const Value: string);

  protected
    FUseDebug : Boolean;
    FNetClient: TTCPClient;
  public

    constructor Create;
    destructor Destroy; override;

    procedure StartNetworking; override;
    procedure StopNetworking;  override;

    procedure SendCommand(const aID: word; aBuffer: PAnsiChar);

    procedure TryReconnect();

  public
    property  ServerIP: string read FServerIP write setServerIp;


  end;

var
  VNetClient: TNetHandler_Client;

implementation

{ TNetHandlerServer }


constructor TNetHandler_Client.Create;
begin
  inherited;

  FUseDebug := false;
end;

destructor TNetHandler_Client.Destroy;
begin

end;

{procedure TNetMgr_Client.FNetClient_OnStateChange(st: TSocketState);
begin
  if FUseDebug then begin

    FrmDebugNet.Add_NetStatusLog(SockStateToString(st));
  end;
end;
}


procedure TNetHandler_Client.setServerIp(const Value: string);
begin
  FServerIP := Value;
end;

procedure TNetHandler_Client.StartNetworking;
begin
  inherited;
  FNetClient := TTCPClient.Create;
  FNetTCPSock   := FNetClient;

  FNetUDPNode.Listen(IntToStr(GamePort));

  FNetClient.Connect(FServerIP, IntToStr(CommandPort));
end;

procedure TNetHandler_Client.StopNetworking;
begin
  FNetClient.Disconnect;
  FNetClient.Free;

  inherited;
end;

procedure TNetHandler_Client.TryReconnect;
begin
  if not FNetClient.Connected then
  FNetClient.Connect(FServerIP, IntToStr(CommandPort));

end;

procedure TNetHandler_Client.SendCommand(const aID: word; aBuffer: PAnsiChar);
begin
  FNetClient.SendData(aID, aBuffer);
end;

end.
