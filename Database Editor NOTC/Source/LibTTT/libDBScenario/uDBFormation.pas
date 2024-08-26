unit uDBFormation;

interface

uses
  tttData,Classes;

type

  TFormation = class
  public
    FFormation_Def   : TRecFormation_Definition;
    FForm_Assign     : TRecFormation_Assignment;
    FPlatform_Instance: TRecPlatform_Instance;

    Assignment       : TList;

    constructor Create;
    destructor Destroy;override;
  end;


implementation

{ TLink }

constructor TFormation.Create;
begin
   Assignment := TList.Create;
end;

destructor TFormation.Destroy;
begin
  Assignment.Free;
  inherited;
end;

end.
