unit uDBGame_Defaults;

interface

uses
  tttData;

type

  TGame_Defaults = class
  public
    FData: TRecGame_Defaults;
    FResource_Allocation   : TRecResource_Allocation;
    FGameCloud_ESM         : TRecGame_Cloud_On_ESM;
    FGameCloud_Radar       : TRecGame_Cloud_On_Radar;
    FGameDefault_IFF       : TRecGame_Default_IFF_Mode_Code;
    FGameRainfall_ESM      : TRecGame_Rainfall_On_ESM;
    FGameRainfall_Missile  : TRecGame_Rainfall_On_Missile_Seeker;
    FGameRainfall_Radar    : TRecGame_Rainfall_On_Radar;
    FGameRainfall_Sonar    : TRecGame_Rainfall_On_Sonar;
    FGameSea_Missile       : TRecGame_Sea_On_Missile_Safe_Altitude;
    FGameSea_Radar         : TRecGame_Sea_On_Radar;
    FGameSea_Sonar         : TRecGame_Sea_On_Sonar;
    FGameShip_Sonar        : TRecGame_Ship_On_Sonar;

    procedure LoadFromGame(const aResAlloc: Integer);

  public
    constructor Create;
    destructor Destroy; override;

  end;

implementation

uses
  uDataModuleTTT;

constructor TGame_Defaults.Create;
begin

end;

destructor TGame_Defaults.Destroy;
begin

end;

procedure TGame_Defaults.LoadFromGame(const aResAlloc: Integer);
var gIndex :integer;
begin

  if not dmTTT.GetGame_Defaults(aResAlloc, FData) then
    Exit;

  gIndex := FData.Defaults_Index;

  if not dmTTT.GetGame_Cloud_On_ESM(gIndex, FGameCloud_ESM) then exit;
  if not dmTTT.GetGame_Cloud_On_Radar(gIndex, FGameCloud_Radar) then exit;
  if not dmTTT.GetGame_Default_IFF_Mode_Code(gIndex, FGameDefault_IFF) then exit;
  if not dmTTT.GetGame_Rainfall_On_ESM(gIndex, FGameRainfall_ESM) then exit;
  if not dmTTT.GetGame_Rainfall_On_Missile_Seeker(gIndex, FGameRainfall_Missile) then
  exit;
  if not dmTTT.GetGame_Rainfall_On_Radar(gIndex, FGameRainfall_Radar) then exit;
  if not dmTTT.GetGame_Rainfall_On_Sonar(gIndex, FGameRainfall_Sonar) then exit;
  if not dmTTT.GetGame_Sea_On_Missile_Safe_Altitude (gIndex, FGameSea_Missile) then
  exit;
  if not dmTTT.GetGame_Sea_On_Radar(gIndex, FGameSea_Radar) then exit;
  if not dmTTT.GetGame_Sea_On_Sonar(gIndex, FGameSea_Sonar) then exit;
  if not dmTTT.GetGame_Ship_On_Sonar(gIndex, FGameShip_Sonar) then exit;


end;

end.
