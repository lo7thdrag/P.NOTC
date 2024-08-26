unit ufEnvironmentStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uDBAsset_GameEnvironment;

type
  TfEnvironmentStatus = class(TForm)
    gbEnvironmentStatus: TPanel;
    Panel3: TPanel;
    Panel21: TPanel;
    Label81: TLabel;
    Bevel1: TBevel;
    Label82: TLabel;
    Bevel2: TBevel;
    Label83: TLabel;
    Label84: TLabel;
    Bevel3: TBevel;
    Label85: TLabel;
    lblSpeedWIndTrue: TLabel;
    lblDirectionWindTrue: TLabel;
    lblWindRelativeDirection: TLabel;
    Label87: TLabel;
    lblWindRelativeSpeed: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    lblVisibilityFactorsElectroOptical: TLabel;
    Label94: TLabel;
    lblAttenuationFactorsCloud: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    lblVisibilityactorsTime: TLabel;
    Label99: TLabel;
    lblAttenuationFactorsRain: TLabel;
    Label101: TLabel;
    Bevel4: TBevel;
    Label102: TLabel;
    Bevel5: TBevel;
    Label103: TLabel;
    lblVisibilityFactorsnfrared: TLabel;
    Label105: TLabel;
    lblOtherBarometric: TLabel;
    Label107: TLabel;
    lblOtherAirTemp: TLabel;
    Label109: TLabel;
    Bevel6: TBevel;
    Label111: TLabel;
    Label86: TLabel;
    Bevel7: TBevel;
    lblSoundVelocityAverageBottom: TLabel;
    lblSoundVelocityLayer: TLabel;
    lblSoundVelocityProfile: TLabel;
    Label98: TLabel;
    Label100: TLabel;
    Label104: TLabel;
    Label106: TLabel;
    lblOceanCurrentDirection: TLabel;
    Label112: TLabel;
    lblOceanCurrentSpeed: TLabel;
    Label114: TLabel;
    Bevel8: TBevel;
    Label115: TLabel;
    Bevel9: TBevel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    lblSurfaceTemp: TLabel;
    Label95: TLabel;
    Label108: TLabel;
    lblSeaState: TLabel;
    Label120: TLabel;
    Bevel10: TBevel;
    Label110: TLabel;
    Label121: TLabel;
  private
    { Private declarations }
    ge : TGame_Environment_Definition;
  public
    { Public declarations }
    procedure DisplayEnvironmentStatus;
    procedure setGE(envi : TGame_Environment_Definition);
    function getGE: TGame_Environment_Definition;
  end;

var
  fEnvironmentStatus: TfEnvironmentStatus;

implementation

uses uBaseCoordSystem, uSimMgr_Client, uDBAssets_SubAreaEnviroDefinition;

{$R *.dfm}

procedure TfEnvironmentStatus.DisplayEnvironmentStatus;
begin
  ge := (simMgrClient).GameEnvironment;

  with ge.FData do
  begin
    lblSpeedWIndTrue.Caption := FormatCourse(Wind_Direction);
    lblDirectionWindTrue.Caption := FormatSpeed(Wind_Speed);
    // lblWindRelativeSpeed
    // lblWindRelativeDirection

    lblAttenuationFactorsRain.Caption := IntToStr(Rain_Rate);
    lblAttenuationFactorsCloud.Caption := IntToStr(Cloud_Attenuation);

    // lblVisibilityactorsTime.Caption :=
    // lblVisibilityFactorsElectroOptical
    // lblVisibilityFactorsnfrared

    lblOtherAirTemp.Caption := FormatFloat('00.0', Air_Temperature);
    lblOtherBarometric.Caption := FormatFloat('000.0', Barometric_Pressure);
    lblOceanCurrentSpeed.Caption := FormatFloat('00.0', Ocean_Current_Speed);
    lblOceanCurrentDirection.Caption := FormatFloat('000.0',
      Ocean_Current_Direction);

    lblSoundVelocityProfile.Caption := IntToStr(Sound_Velocity_Type);
    lblSoundVelocityLayer.Caption := FormatFloat('0.0', Thermal_Layer_Depth);
    lblSoundVelocityAverageBottom.Caption := FormatFloat('0.0',
      Ave_Ocean_Depth);
    //
    lblSeaState.Caption := IntToStr(Sea_State);
    lblSurfaceTemp.Caption := FormatFloat('0.0', Surface_Temperature);
  end;
end;

procedure TfEnvironmentStatus.setGE(envi: TGame_Environment_Definition);
begin
  ge := envi;
end;

function TfEnvironmentStatus.getGE;
begin
  Result := ge;
end;

end.
