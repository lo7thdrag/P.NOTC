unit uDBRainfall;

interface

uses
  tttData,Classes;

type

  TRainfall   = class
  public

    FRainfall_On_ESM        : TList; //TRecRainfall_On_ESM
    FRainfall_On_Missile    : TList; //TRecRainfall_On_Missile_Seeker
    FRainfall_On_Radar      : TList; //TRecRainfall_On_Radar
    FRainfall_On_Sonar      : TList; //TRecRainfall_On_Sonar

    procedure LoadFromRainfall();

    constructor Create;
    destructor RainfallDestroy;

  end;

  TRainfall_On_ESM = class
  public
    FData : TRecRainfall_On_ESM;
  end;

  TRainfall_On_Missile = class
  public
    FData : TRecRainfall_On_Missile_Seeker;
  end;

  TRainfall_On_Radar = class
  public
    FData : TRecRainfall_On_Radar;
  end;

  TRainfall_On_Sonar = class
  public
    FData :TRecRainfall_On_Sonar;
  end;


implementation

uses
  uDataModuleTTT;

constructor TRainfall.Create;
begin
   FRainfall_On_ESM       := TList.Create; //TRecRainfall_On_ESM
   FRainfall_On_Missile   := TList.Create; //TRecRainfall_On_Missile_Seeker
   FRainfall_On_Radar     := TList.Create; //TRecRainfall_On_Radar
   FRainfall_On_Sonar     := TList.Create; //TRecRainfall_On_Sonar
end;

destructor TRainfall.RainfallDestroy;
begin
  FRainfall_On_ESM.Free;
  FRainfall_On_Missile.Free;
  FRainfall_On_Radar.Free;
  FRainfall_On_Sonar.Free;
end;

procedure TRainfall.LoadFromRainfall();
begin

    if not dmTTT.GetRainfall_On_ESM(FRainfall_On_ESM) then
    Exit;
    if not dmTTT.GetRainfall_On_Missile(FRainfall_On_Missile) then
    Exit;
    if not dmTTT.GetRainfall_On_Radar(FRainfall_On_Radar) then
    Exit;
    if not dmTTT.GetRainfall_On_Sonar(FRainfall_On_Sonar) then
    Exit;

end;

end.
