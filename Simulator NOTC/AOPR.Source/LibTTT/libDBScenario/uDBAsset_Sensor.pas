unit uDBAsset_Sensor;

interface

uses
  tttData,Classes,uDBBlind_Zone, uDBNote_Storage,uDBAsset_Vehicle,
  Graphics;

type

  TEO_On_Board = class
  public
    FNote   : TNote_Storage ;
    FData       : TRecEO_On_Board;
    FEO_Def     : TRecEO_Detection_Definition;
    FBlind_Zone : TBlind_Zone;
    FBlind      : TList;
    FVehicle    : TVehicle_Definition;

    constructor Create;
    destructor Destroy;override;
  end;

  TESM_On_Board = class
  public
    FData   : TRecESM_On_Board;
    FESM_Def: TRecESM_Definition;
    FNote   : TNote_Storage ;
    FBlind_Zone : TBlind_Zone;
    FBlind  : TList;
    FVehicle    : TVehicle_Definition;

    constructor Create;
    destructor Destroy; override;
  end;

  TIFF_Sensor_On_Board = class
  public
    FData         : TRecIFF_Sensor_On_Board;
    FPattern_IFF  : TList; //TRecPattern_IFF_Event;
    FScripted_IFF : TList; //TRecScripted_IFF_Event;
    FVehicle    : TVehicle_Definition;

    constructor Create;
    destructor Destroy;override;
  end;

  TMAD_Sensor_On_Board = class
  public
    FData    : TRecMAD_Sensor_On_Board;
    FMAD_Def : TRecMAD_Definition;
    FNote    : TNote_Storage ;
    FVehicle    : TVehicle_Definition;

    constructor Create;
    destructor Destroy;override;
  end;

  TFCR_On_Board = class
  public
    FData    : TRecFCR_On_Board;
    FFCR_def : TRecFCR_Definition;
    FNote    : TNote_Storage ;
    FBlind_Zone : TBlind_Zone;
    FBlind   : TList;

    constructor Create;
    destructor Destroy;override;
  end;

  TVisual_Sensor_On_Board = class
  public
    FData       : TRecVisual_Sensor_On_Board;
    FBlind_Zone : TBlind_Zone;
    FBlind      : TList;
    FVehicle    : TVehicle_Definition;

    constructor Create;
    destructor Destroy; override;
    //  No Visual Definition .
  end;

implementation

uses uDBAssetObject, uDBAsset_Weapon;


{ TEO_On_Board }

constructor TEO_On_Board.Create;
begin
   FBlind      := TList.Create;
   FBlind_Zone := TBlind_Zone.Create;
   FVehicle    := TVehicle_Definition.Create;
end;

destructor TEO_On_Board.Destroy;
begin
   FBlind.Free;
  inherited;
end;

{ TESM_On_Board }

constructor TESM_On_Board.Create;
begin
   FBlind      := TList.Create;
   FBlind_Zone := TBlind_Zone.Create;
   FVehicle    := TVehicle_Definition.Create;

end;

destructor TESM_On_Board.Destroy;
begin
  inherited;
end;

{ TFCR_On_Board }

constructor TFCR_On_Board.Create;
begin
  FBlind      := TList.Create;
  FBlind_Zone := TBlind_Zone.Create;
end;

destructor TFCR_On_Board.Destroy;
begin
  FBlind.Free;
  inherited;
end;

{ TVisual_Sensor_On_Board }

constructor TVisual_Sensor_On_Board.Create;
begin
  inherited;
  FBlind      := TList.Create;
  FBlind_Zone := TBlind_Zone.Create;
  FVehicle    := TVehicle_Definition.Create;
end;

destructor TVisual_Sensor_On_Board.Destroy;
begin
  inherited;
end;

{ TMAD_Sensor_On_Board }

constructor TMAD_Sensor_On_Board.Create;
begin
   FVehicle := TVehicle_Definition.Create;
end;

destructor TMAD_Sensor_On_Board.Destroy;
begin

  inherited;
end;

{ TIFF_Sensor_On_Board }

constructor TIFF_Sensor_On_Board.Create;
begin
  FPattern_IFF  := TList.Create; //TRecPattern_IFF_Event;
  FScripted_IFF := TList.Create; //TRecScripted_IFF_Event;
  FVehicle      := TVehicle_Definition.Create;

end;

destructor TIFF_Sensor_On_Board.Destroy;
begin
  FPattern_IFF.Free;
  FScripted_IFF.Free;
  inherited;
end;

end.
