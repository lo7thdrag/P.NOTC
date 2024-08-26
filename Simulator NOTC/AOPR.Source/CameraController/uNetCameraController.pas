unit uNetCameraController;

interface

uses
  Classes, uNetHandle_TTT, uTCPClient, uThreadTimer, uSteppers;

type
  TNetCameraController = class(TNetHandle_TTT)
  private
    FThread : TMSTimer;
    FNetConnect : TDelayer;
    FNetClient: TTCPClient;
    FNetConnected : Boolean;

    function GetOnConnected: TNotifyEvent;
    procedure SetOnConnected(const aValue: TNotifyEvent);

    function GetOnDisconnected: TNotifyEvent;
    procedure SetOnDisconnected(const aValue: TNotifyEvent);
  protected
    procedure ThreadOnRunning(const dt: Double);
    procedure NetConnectOnTimer(Sender: TObject);
  public
    ServerIP : string;

    constructor Create;
    destructor Destroy; override;

    procedure StartNetworking; override;
    procedure StopNetworking; override;

    procedure SendCommand(const aID: Word; const aBuffer: PAnsiChar);

    property OnConnected: TNotifyEvent read GetOnConnected write SetOnConnected;
    property OnDisconnected: TNotifyEvent read GetOnDisconnected
      write SetOnDisconnected;
  end;

var
  VNetCameraController : TNetCameraController;

implementation

uses
  SysUtils, uTCPDatatype;

{ TNetCameraController }

constructor TNetCameraController.Create;
begin
  FNetClient := TTCPClient.Create;
  FNetTCPSock := FNetClient;

  FNetConnect := TDelayer.Create;
  FNetConnect.DInterval := 2.0;
  FNetConnect.OnTime := NetConnectOnTimer;
  FNetConnect.Enabled := False;

  FThread := TMSTimer.Create;
  FThread.Interval := 1;
  FThread.OnRunning := ThreadOnRunning;
end;

destructor TNetCameraController.Destroy;
begin
  FNetConnect.Free;
  FNetClient.Free;

  inherited;
end;

function TNetCameraController.GetOnConnected: TNotifyEvent;
begin
  Result := FNetClient.OnConnected;
end;

function TNetCameraController.GetOnDisconnected: TNotifyEvent;
begin
  Result := FNetClient.OnDisConnected;
end;

procedure TNetCameraController.NetConnectOnTimer(Sender: TObject);
begin
  if FNetConnected and not FNetClient.Connected then
    FNetClient.Connect(ServerIP, IntToStr(CommandPort));
end;

procedure TNetCameraController.SendCommand(const aID: Word;
  const aBuffer: PAnsiChar);
var
  pid : ^TPacketID;
begin
  pid := @aBuffer^;
  pid.ipSender := FNetClient.MyLongIP;

  FNetClient.SendData(aID, aBuffer);
end;

procedure TNetCameraController.SetOnConnected(const aValue: TNotifyEvent);
begin
  FNetClient.OnConnected := aValue;
end;

procedure TNetCameraController.SetOnDisconnected(const aValue: TNotifyEvent);
begin
  FNetClient.OnDisConnected := aValue;
end;

procedure TNetCameraController.StartNetworking;
begin
  inherited;

  FNetConnected := True;
  FNetConnect.Enabled := True;
  FThread.Enabled := True;
end;

procedure TNetCameraController.StopNetworking;
begin
  FNetConnected := False;
  FNetClient.Disconnect;

  inherited;
end;

procedure TNetCameraController.ThreadOnRunning(const dt: Double);
begin
  FNetConnect.Run(dt);
  FNetClient.GetPacket;
end;

end.
