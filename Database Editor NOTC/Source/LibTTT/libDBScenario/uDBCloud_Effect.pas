unit uDBCloud_Effect;

interface

uses
  tttData,Classes;
type

  TCloud_Effects  = class
  public
    FCloud_Effects_On_ESM   : TList;
    FCloud_Effects_On_Radar : TList;

    procedure LoadFromCloudEffects();

    constructor Create;
    destructor Destroy; override;
  end;

  TCloud_Effects_On_ESM = class
  public
    FData : TRecCloud_Effects_On_ESM;
  end;

  TCloud_Effects_On_Radar = class
  public
    FData : TRecCloud_Effects_On_Radar;
  end;

implementation

uses
  uDataModuleTTT;

constructor TCloud_Effects.Create;
begin
  FCloud_Effects_On_ESM   := TList.Create;
  FCloud_Effects_On_Radar := TList.Create;
end;

destructor TCloud_Effects.Destroy;
begin
  FCloud_Effects_On_ESM.Free;
  FCloud_Effects_On_Radar.Free;
end;

procedure TCloud_Effects.LoadFromCloudEffects();
begin

  if not dmTTT.GetCloud_Effect_On_ESM(FCloud_Effects_On_ESM) then Exit;

  if not dmTTT.GetCloud_Effect_On_Radar(FCloud_Effects_On_Radar) then Exit;
  


end;








end.
