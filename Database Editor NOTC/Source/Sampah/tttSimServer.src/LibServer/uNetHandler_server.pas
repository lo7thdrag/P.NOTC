unit uNetHandler_server;

interface

uses
  uNetHandler;

implementation

type

  TNetHandlerServer = class (TNetHandler)

  public
    constructor Create;
    destructor Destroy; override;

  end;

end.
