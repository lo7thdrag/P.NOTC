unit uDBPattern;

interface

uses
  tttData,Classes, uDBNote_Storage;

type

  TPredefined_Pattern = class
  public
    FData    : TRecPredefined_Pattern;
    Pattern  : TList;
    FNote    : TNote_Storage ;

    constructor Create;
    destructor Destroy;override;
  end;

  TPattern_Point  = class
  public
    FData : TRecPattern_Point;
  end;

implementation

{ TPredefined_Pattern }

constructor TPredefined_Pattern.Create;
begin
   Pattern  := TList.Create;
end;

destructor TPredefined_Pattern.Destroy;
begin
  Pattern.Free;
  inherited;
end;

end.
