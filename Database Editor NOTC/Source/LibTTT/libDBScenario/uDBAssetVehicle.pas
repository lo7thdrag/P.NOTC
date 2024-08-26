unit uDBAssetVehicle;

interface

uses
  Classes, SysUtils, tttData, newClassASTT;

type


  TVehicle_Definition = class
  public
    FData  : TRecVehicle_Definition;
    Radars : TList; // of  TRadar_Definition;
//    Sonars : TSonar_Definition;
    constructor Create;
    destructor Destroy; override;

  end;


implementation

{ TVehicle_Definition }

constructor TVehicle_Definition.Create;
begin

end;

destructor TVehicle_Definition.Destroy;
begin

  inherited;
end;

end.
