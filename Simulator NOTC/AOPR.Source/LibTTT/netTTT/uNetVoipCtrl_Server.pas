unit uNetVoipCtrl_Server;

interface

uses
  uNetVoipCtrl, uTCPServer, uTCPDatatype, uSimMgr_Client;

type


  TNetVoipCtrl_Server = class(TNetVoipCtrl)
  protected
    FNetVoipConnect: TTCPServer;

  public
    constructor Create;
    destructor Destroy; override;

    procedure StartNetworking; override;
    procedure StopNetworking; override;

    procedure SendToVoipCtrl(const aID: word; aBuffer: PAnsiChar);

    procedure OnConnect(const cmd : string);
    procedure OnDisConnect(const cmd : string);

  end;


var
  VNetVoipCtrlServer:  TNetVoipCtrl_Server;

implementation

uses
  SysUtils, ufLog;


{ TNetVoipCtrl_Server }

constructor TNetVoipCtrl_Server.Create;
begin
  inherited;

  FNetVoipConnect := TTCPServer.Create;
  FNetSock        := FNetVoipConnect;

  FNetVoipConnect.OnClient_Connect := OnConnect;
  FNetVoipConnect.OnClient_DisConnect := OnDisconnect;
end;

destructor TNetVoipCtrl_Server.Destroy;
begin
//  FNetSock.Free;

  FNetVoipConnect.Stop;
  FNetVoipConnect.Free;

  FNetSock := nil;

  inherited;
end;


procedure TNetVoipCtrl_Server.OnConnect(const cmd: string);
var
  id : integer;
begin
  if Assigned(simMgrClient.ControlledPlatform) then begin
    id := simMgrClient.ControlledPlatform.InstanceIndex;
    simMgrClient.netSend_VoipControlledChanged(id);
  end;

  //frmLog.Memo1.Lines.Add('Client Connected ' + cmd);
  //frmLog.Memo1.Lines.Add('Send to Archos' + IntToStr(id));
end;

procedure TNetVoipCtrl_Server.OnDisConnect(const cmd: string);
begin

end;

procedure TNetVoipCtrl_Server.StartNetworking;
begin
//  inherited;
  FNetVoipConnect.Listen(IntToStr(VoipCtrlPort));
end;

procedure TNetVoipCtrl_Server.StopNetworking;
begin
  FNetVoipConnect.Stop;

 // inherited;
 end;

procedure TNetVoipCtrl_Server.SendToVoipCtrl(const aID: word; aBuffer: PAnsiChar);
//var pid: ^TPacketID;
begin
  //pid := @aBuffer^;
  FNetVoipConnect.SendData(aID, aBuffer);
end;


end.
