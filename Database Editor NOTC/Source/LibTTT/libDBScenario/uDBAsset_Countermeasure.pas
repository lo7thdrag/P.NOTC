unit uDBAsset_Countermeasure;

interface

uses
  tttData, Classes, uDBBlind_Zone, uDBNote_Storage, uSimContainers;


type

  TAcoustic_Decoy_On_Board = class
  public
    FData  : TRecAcoustic_Decoy_On_Board;
    FAccousticDecoy_Def : TRecAcoustic_Decoy_Definition;
    FAccousticDecoy_POH : TRecAcoustic_Decoy_POH_Modifier;
    FNote               : TNote_Storage ;
    FVehicle : TRecVehicle_Definition;

    constructor Create;
    destructor Destroy;override;
  end;

  TAcoustic_Decoy_POH_Modifier = class
  public
    FAccousticDecoy_POH : TRecAcoustic_Decoy_POH_Modifier;
  end;

  TAir_Bubble_On_Board = class
  public
    FData           : TRecAir_Bubble_On_Board;
    FAirBubble_Def  : TRecAir_Bubble_Definition;
    FNote            : TNote_Storage ;
    FVehicle : TRecVehicle_Definition;
  end;


  TChaff_On_Board = class
  public
    FData           : TRecChaff_On_Board;
    FChaff_Def      : TRecChaff_Definition;

    FScripted_Chaffs  : TList; //of TScripted_Chaff
    FScripted_Pattern : TList; //of TScripted_Pattern
    FNote             : TNote_Storage ;
    FVehicle : TRecVehicle_Definition;

//    FScripted_ChaffEvent  : array of TRecScripted_Chaff_Event;
//    FScripted_ChaffBehave : array of TRecScripted_Behav_Definition;
  end;

  TChaff_Launcher_On_Board = class
  public
    FData  : TRecChaff_Launcher_On_Board;
    // no def
  end;

  TDefensive_Jammer_On_Board = class
  public
    FData                : TRecDefensive_Jammer_On_Board;
    FDefensiveJammer_Def : TRecDefensive_Jammer_Definition;
    FNote                : TNote_Storage ;
    FVehicle             : TRecVehicle_Definition;
  end;

  TFloating_Decoy_On_Board = class
  public
    FData              : TRecFloating_Decoy_On_Board;
    FFloatingDecoy_Def : TRecFloating_Decoy_Definition;
    FNote              : TNote_Storage ;
    FVehicle           : TRecVehicle_Definition;
  end;

  TInfrared_Decoy_On_Board = class
  public
    FData               : TRecInfrared_Decoy_On_Board;
    FInfraRedDecoy_Def  : TRecInfrared_Decoy_Definition;
    FScripted_Infra     : TList;
    FPattern_Infra      : Tlist;
    FNote               : TNote_Storage ;
    FVehicle            : TRecVehicle_Definition;
  end;

  TRadar_Noise_Jammer_On_Board = class
  public
    FData  : TRecRadar_Noise_Jammer_On_Board;
    FDef   : TRecRadar_Noise_Jammer_Definition;
    FNote  : TNote_Storage ;
    FVehicle  : TRecVehicle_Definition;
  end;

  TPoint_Effect_On_Board = class
  public
    FData           : TRecPoint_Effect_On_Board;
    FBlind_Zone     : TBlind_Zone;
    FBlind          : TList;
    FScripted_Point : TList;
    FPattern_Point  : TList;
    FVehicle        : TRecVehicle_Definition;

    FBZone_1 : TRecBlind_Zone_Definition;
    FBZone_2 : TRecBlind_Zone_Definition;

    constructor Create;
    destructor Destroy;override;
  end;

  TTowed_Jammer_Decoy_On_Board = class
  public
    FData : TRecTowed_Jammer_Decoy_On_Board;
    FDef  : TRecTowed_Jammer_Decoy_Definition;
    FNote : TNote_Storage ;
    FVehicle  : TRecVehicle_Definition;
  end;

implementation



{ TPoint_Effect_On_Board }

constructor TPoint_Effect_On_Board.Create;
begin
   FBlind          := TList.Create;
   FScripted_Point := TList.Create;
   FPattern_Point  := TList.Create;
   FBlind_Zone     := TBlind_Zone.Create;
end;

destructor TPoint_Effect_On_Board.Destroy;
begin
  FBlind_Zone.Free;

  FreeItemsAndFreeList(FBlind);
  FreeItemsAndFreeList(FScripted_Point);
  FreeItemsAndFreeList(FPattern_Point);

  inherited;
end;

{ TAcoustic_Decoy_On_Board }

constructor TAcoustic_Decoy_On_Board.Create;
begin
  inherited;
end;

destructor TAcoustic_Decoy_On_Board.Destroy;
begin
  inherited;
end;
end.
