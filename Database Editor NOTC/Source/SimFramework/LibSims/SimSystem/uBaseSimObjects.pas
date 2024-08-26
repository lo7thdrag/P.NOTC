unit uBaseSimObjects;

(*
  andySu, 2008 11 07
*)

interface

type

  TBaseSimObject = class
  private
    FEnable: boolean;
    procedure SetEnable(const Value: boolean);
  published

  public
    FreeMe: boolean;
    UniqueID: string;

    constructor Create;
    destructor Destroy; override;

    property Enable : boolean read FEnable write SetEnable;

  end;

implementation

{ TBaseSimClass }

constructor TBaseSimObject.Create;
begin
  FreeMe := False;
  FEnable := true;
end;

destructor TBaseSimObject.Destroy;
begin

  inherited;
end;

procedure TBaseSimObject.SetEnable(const Value: boolean);
begin
  FEnable := Value;
end;

end.
