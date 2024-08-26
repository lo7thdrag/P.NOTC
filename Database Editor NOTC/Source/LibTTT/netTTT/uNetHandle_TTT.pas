unit uNetHandle_TTT;

interface

uses
   Classes, SysUtils,
   OverbyteIcsWSocket,
   uNetBaseSocket, uNetUDPnode, uPacketRegister,

   uBaseNetHandler;

type

//------------------------------------------------------------------------------
// kelas abstract
// network connection manager.
//------------------------------------------------------------------------------

  TNetHandle_TTT = class(TBaseNetHandler)
  protected
    FNetUDPNode: TNetUDPNode;
    FNetTCPSock: TNetBaseSocket;

  public

    constructor Create;
    destructor Destroy; override;

  public

    GamePort   : integer;
    CommandPort: integer;
    BroadCastAddress: string;

  public
    procedure StartNetworking; virtual;
    procedure StopNetworking; virtual;

    procedure RegisterUDPPacket(const aType, aRecSize: word;
      aProcedure: TRegPacketHandlerProc);

    procedure RegisterTCPPacket(const aType, aRecSize: word;
      aProcedure: TRegPacketHandlerProc);

    procedure UnRegisterUDP;
    procedure UnRegisterTCP;


  end;


implementation


//===============================================================================
{ TNetHandler }

//==============================================================================
constructor TNetHandle_TTT.Create;
begin
  inherited;

end;

destructor TNetHandle_TTT.Destroy;
begin
  inherited;
end;


procedure TNetHandle_TTT.RegisterUDPPacket(const aType, aRecSize: word;
  aProcedure: TRegPacketHandlerProc);
begin
  FNetUDPNode.RegisterProcedure(aType, aProcedure, aRecSize);

end;

procedure TNetHandle_TTT.RegisterTCPPacket(const aType, aRecSize: word;
      aProcedure: TRegPacketHandlerProc);
begin
  FNetTCPSock.RegisterProcedure(aType, aProcedure, aRecSize);
end;

procedure TNetHandle_TTT.StartNetworking;
begin
  FNetUDPNode       := TNetUDPNode.Create;
  FNetUDPNode.Port  := GamePort;

  // TCPSock harus di create di turunan.

end;

procedure TNetHandle_TTT.StopNetworking;
begin
  FNetUDPNode.Close;
  FNetUDPNode.Free;

end;

procedure TNetHandle_TTT.UnRegisterTCP;
begin
  FNetTCPSock.UnregisterAllProcedure;

end;

procedure TNetHandle_TTT.UnRegisterUDP;
begin
  FNetUDPNode.UnregisterAllProcedure;

end;

//==============================================================================



end.
