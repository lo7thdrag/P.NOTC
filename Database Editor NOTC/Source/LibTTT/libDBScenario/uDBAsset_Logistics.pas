unit uDBAsset_Logistics;

interface

uses
  tttData,Classes;

type
  TLogistics = class
  public
    FData : TRecLogisticsCapability;
    FVecDef : TRecVehicle_Definition;

//    FPlatformLogistics : TRecPlatformLogistics;

    constructor Create;
    destructor Destroy;override;

  end;


implementation

{ TLogistics }

constructor TLogistics.Create;
begin

end;

destructor TLogistics.Destroy;
begin

  inherited;
end;

end.
