unit uDBLink;

interface

uses
  tttData,Classes;

type

  TLink = class
  public
    FLink_Def          : TRecLink_Definition;
    FLink_Part         : TRecLink_Participant;

    Participant        : TList;

    constructor Create;
    destructor Destroy;override;
  end;


implementation

{ TLink }

constructor TLink.Create;
begin
   Participant := TList.Create;
end;

destructor TLink.Destroy;
begin
  Participant.Free;
  inherited;
end;

end.
