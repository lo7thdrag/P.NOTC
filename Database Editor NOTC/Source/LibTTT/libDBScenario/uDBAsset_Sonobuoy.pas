unit uDBAsset_Sonobuoy;

interface

uses
  tttData, uDBNote_Storage, uDBAsset_Vehicle, uDBAsset_Sonar;


type

  TSonobuoy_On_Board = class
  public
    FData     : TRecSonobuoy_On_Board;
    FDef      : TRecSonobuoy_Definition ;
    FNote     : TNote_Storage ;
    FPI       : TRecPlatform_Instance;
    FVehicle  : TVehicle_Definition;
    FSonar    : TSonar_On_Board;
    FPlatform_Library_Entry : TRecPlatform_Library_Entry;

    constructor Create;
    destructor Destroy;override;
  end;

implementation

constructor TSonobuoy_On_Board.Create;
begin
  FVehicle  := TVehicle_Definition.Create;
  FSonar    := TSonar_On_Board.Create;
end;

destructor TSonobuoy_On_Board.Destroy;
begin
  FVehicle.Free;
  FSonar.Free;
end;

end.
