unit uDBAsset_Sonar;

interface

uses

  tttData,Classes,uDBBlind_Zone, uDBNote_Storage,uDBAsset_Vehicle;

type

  TSonar_On_Board = class
  public
    FData           : TRecSonar_On_Board;
    FDef            : TRecSonar_Definition;
    FBlind_Zone     : TBlind_Zone;
    FBlind          : TList;
    FPattern_Sonar  : TList; //TRecPattern_Sonar_Event;
    FScripted_sonar : TList;  //TRecScripted_Sonar_Event;
    FPOD            : TList;

    FShipNoiseData  : TShipNoiseOnSonarArray;
    FSeaStateNoiseData : TSeaStateSonarArray;
    FRainRateNoiseData : TRainRateNoiseSonarArray;
    FSonarPOD_vs_SNR : TRecPOD_vs_SNR_Curve_Definition;

    FPattern  : TRecPattern_Sonar_Event;
    FCategory : TRecSonar_Category ;
    FNote     : TNote_Storage ;
    FVehicle  : TVehicle_Definition;

    constructor Create;
    destructor Destroy;override;
  end;

  TSonobuoy_On_Board = class
  public
    FData           : TRecSonobuoy_On_Board;
    FDef            : TRecSonobuoy_Definition;
    FBlind_Zone     : TBlind_Zone;
    FBlind          : TList;
    FPattern_Sonar  : TList; //TRecPattern_Sonar_Event;
    FScripted_sonar : TList;  //TRecScripted_Sonar_Event;
    FPOD            : TList;

    FPattern  : TRecPattern_Sonar_Event;
    FCategory : TRecSonar_Category ;
    FNote     : TNote_Storage ;
    FVehicle  : TVehicle_Definition;
    FPI       : TRecPlatform_Instance; // tambahan
    FSonar    : TSonar_On_Board; // tambahan

    constructor Create;
    destructor Destroy;override;
  end;

implementation

uses uDBAssetObject;

{ TSonar_On_Board }

constructor TSonar_On_Board.Create;
begin
  inherited;

  FBlind          := TList.Create;
  FPattern_Sonar  := TList.Create; //TRecPattern_Sonar_Event;
  FScripted_sonar := TList.Create;
  FBlind_Zone     := TBlind_Zone.Create;
  FVehicle        := TVehicle_Definition.Create;
  FPOD            := TList.Create;

end;

destructor TSonar_On_Board.Destroy;
begin
  FBlind.Free;
  FPattern_Sonar.Free;
  FScripted_sonar.Free;
  FBlind_Zone.Free;
  FPOD.Free;

  inherited;
end;

{ TSonobuoy_On_Board }

constructor TSonobuoy_On_Board.Create;
begin
  FBlind          := TList.Create;
  FPattern_Sonar  := TList.Create; //TRecPattern_Sonar_Event;
  FScripted_sonar := TList.Create;
  FBlind_Zone     := TBlind_Zone.Create;
  FVehicle        := TVehicle_Definition.Create;
  FSonar    := TSonar_On_Board.Create; //tambahan
  FPOD            := TList.Create;
end;

destructor TSonobuoy_On_Board.Destroy;
begin
  FBlind.Free;
  FPattern_Sonar.Free;
  FScripted_sonar.Free;
  FBlind_Zone.Free;
  FPOD.Free;

  inherited;
end;

end.
