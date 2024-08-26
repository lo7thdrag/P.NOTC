unit uDBDefault_Var;

interface

uses
  tttData;

type

  TDefault_Var    = class
  public
    Sea_State_On_Missile_Safe_Altitude : TSingleArray;
    Sea_State_On_Radar : TSingleArray;
    Sea_State_On_Sonar : TSeaStateSonarArray;
    Operate            : TString;
    Ship_Noise         : TShipNoiseOnSonarArray;
    Default_Definition : TDefaultDef;
    Default_IFF        : TIFFMode;



///     array of TRecSea_State_On_Missile_Safe_Altitude;
//    Sea_State_On_Radar : array of TRecSea_State_On_Radar;

    procedure LoadFromDatabase;


  end;


implementation

uses
  uDataModuleTTT;
{ TSea_State }

procedure TDefault_Var.LoadFromDatabase;
begin
  dmTTT.GetSeaStateOnMissile(Sea_State_On_Missile_Safe_Altitude);
  dmTTT.GetSeaStateOnRadar(Sea_State_On_Radar);
  dmTTT.GetSeaStateOnSonar(Sea_State_On_Sonar);

end;

end.
