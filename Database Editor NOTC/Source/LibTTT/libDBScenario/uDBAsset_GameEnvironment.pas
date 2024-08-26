unit uDBAsset_GameEnvironment;

interface

uses

 tttData,Classes,math;

type

  TGame_Environment_Definition = class
  public
    FData         : TRecGame_Environment_Definition;
    FGameArea     : TRecGame_Area_Definition;
    FGlobal_Conv  : TRecGlobal_Convergence_Zone ;

    FOverlay      : TList;

    constructor Create;
    destructor Destroy;override;
    procedure calculateMaxPowerScaleArea;
    function getMaxPOwerScaleArea:integer;
   private
     max_power_scale_area : integer;
  end;

  TMainOverlay_Definition = class {rename}
  public
    FData : TRecOverlay_Definition;
  end;

  TShape_Definition = class
  public
    FData : TRec_OverlayShape;
  end;

implementation

{ TGame_Environment_Definition }

constructor TGame_Environment_Definition.Create;
begin
   FOverlay      := TList.Create;
end;

destructor TGame_Environment_Definition.Destroy;
begin
  FOverlay.Free;
  inherited;
end;

procedure TGame_Environment_Definition.calculateMaxPowerScaleArea;
var area_length:extended;
    power:integer;
begin
 power := 10;
 area_length := FGameArea.Game_X_Dimension; //ambil x dan y sama saja
 if area_length<>0 then
  power := trunc(log2(area_length))+1;

 max_power_scale_area := power;

end;

function TGame_Environment_Definition.getMaxPOwerScaleArea;
begin
 result := max_power_scale_area;
end;

end.
