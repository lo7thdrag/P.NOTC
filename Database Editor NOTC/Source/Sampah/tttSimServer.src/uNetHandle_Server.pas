unit uNetHandle_Server;

interface

uses
  Classes, SysUtils, OverbyteIcsWSocket,
  uNetUDPnode,
  uTCPServer, uThreadTimer,
  uNetHandle_TTT;

type

//==============================================================================

  TNetHandle_Server = class(TNetHandle_TTT)
  private
    FOnClientConnect: TGetStrProc;
    FOnClientDisConnect: TGetStrProc;

    procedure FNetServer_OnClientConnect(const S: string);
    procedure FNetServer_OnClientDisConnect(const S: string);

  protected
    FUseDebug : Boolean;
    FOnline   : boolean;
    FNetTCPServer: TTCPServer;

  public

    constructor Create;
    destructor Destroy; override;

  public

    procedure StartNetworking; override;
    procedure StopNetworking;  override;

    procedure SendTo(const aID: word; aBuffer: PAnsiChar; const ip: string);

    procedure SendBroadcast_UDP_Data(const aID: word; aBuffer: PAnsiChar);

    procedure SendBroadcastCommand(const aID: word; aBuffer: PAnsiChar);
    procedure SendAlmostBroadcastCommand(const aID: word; aBuffer: PAnsiChar;
      const noIP: string);

  public
    property OnClientConnect: TGetStrProc read FOnClientConnect
      write FOnClientConnect;

    property OnClientDisConnect: TGetStrProc read FOnClientDisConnect
      write FOnClientDisConnect;


  end;

var
  VNetServer: TNetHandle_Server;

implementation

{ TNetHandlerServer }


constructor TNetHandle_Server.Create;
begin
  inherited;

end;

destructor TNetHandle_Server.Destroy;
begin


  inherited;
end;

procedure TNetHandle_Server.FNetServer_OnClientConnect(const S: string);
begin
  if Assigned(FOnClientConnect) then
    FOnClientConnect(s);

end;

procedure TNetHandle_Server.FNetServer_OnClientDisConnect(const S: string);
begin
  if Assigned(FOnClientDisConnect) then
    FOnClientDisConnect(s);

end;


procedure TNetHandle_Server.StartNetworking;
begin
  inherited;

  FNetTCPServer := TTCPServer.Create;
  FNetTCPSock   := FNetTCPServer;

  FNetUDPNode.Connect();

  FNetTCPServer.OnClient_Connect     := FNetServer_OnClientConnect;
  FNetTCPServer.OnClient_DisConnect  := FNetServer_OnClientDisConnect;

  FNetTCPServer.Listen(IntToStr(CommandPort));
end;

procedure TNetHandle_Server.StopNetworking;
begin
  inherited;

{  FNetTCPServer.Stop;
   FNetTCPServer.Free;
   FNetSock := nil;
}
  //inherited;
end;

procedure TNetHandle_Server.SendTo(const aID: word; aBuffer: PAnsiChar; const ip: string);
begin
  FNetTCPServer.SendDataToIPAddress(aID, aBuffer, ip);

end;

procedure TNetHandle_Server.SendBroadcast_UDP_Data(const aID: word; aBuffer: PAnsiChar);
begin
{  if Assigned(FNetTCPServer)  then
   FNetTCPServer.SendData(aID, aBuffer); }

  FNetUDPNode.SendDataTo(BroadCastAddress, aID, aBuffer );

end;

procedure TNetHandle_Server.SendBroadcastCommand(const aID: word; aBuffer: PAnsiChar);
begin
  FNetTCPServer.SendData(aID, aBuffer);
end;

procedure TNetHandle_Server.SendAlmostBroadcastCommand(const aID: word;
  aBuffer: PAnsiChar; const noIP: string);
begin
  FNetTCPServer.SendDataExceptThis(aID, aBuffer, noIP);

end;

end.
