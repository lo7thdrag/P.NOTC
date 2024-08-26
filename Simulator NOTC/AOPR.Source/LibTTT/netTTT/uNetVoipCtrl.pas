unit uNetVoipCtrl;

interface

uses
  uBaseNetHandler;

type


  TNetVoipCtrl = class(TBaseNetHandler)
  public

    constructor Create;
    destructor Destroy; override;

  public
    VoipCtrlAddress: string;
    VoipCtrlPort   : Word;
  end;


implementation

{ TNetVoipCtrl }

constructor TNetVoipCtrl.Create;
begin

end;

destructor TNetVoipCtrl.Destroy;
begin

  inherited;
end;


end.
