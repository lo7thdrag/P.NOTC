unit uDBGameDefaults;

interface

uses
  tttData,uDataModuleTTT,uDBAssetObject,uDBScenario,SysUtils,
  uSimContainers,uDBGame_Defaults;

type

  TGame_Defaults = class
  public
    FData             : TRecGame_Defaults;
    Resource_alloc    : TResource_Allocation;

    procedure LoadFromGame(const  aResAlloc: Integer);

  public
    constructor Create;
    destructor Destroy;override;

  end;


implementation

constructor TTTGame_Defaults.Create;
begin

end;

destructor TTTGame_Defaults.Destroy;
begin

end;

procedure TTTGame_Defaults.LoadFromGame(const  aResAlloc: Integer);
begin

//  scenario   := TT3DBScenario.Create;


  if not dmTTT.GetGame_Defaults(aResAlloc, FData) then
    Exit;



end;



end.

