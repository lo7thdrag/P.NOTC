unit uDBAsset_Satellite;

interface

uses
  Windows, Classes, SysUtils, Graphics, tttData,uDBNote_Storage;

type

  TSatellite_Definition   = class
  public
    FData   : TRecSatellite_Definition;
    FNote   : TNote_Storage;
    FPI     : TRecPlatform_Instance;

    constructor Create;
    destructor Destroy; override;
  end;

implementation


constructor TSatellite_Definition.Create;
begin

end;

destructor TSatellite_Definition.Destroy;
begin
  inherited;
end;



end.
