unit uDBAsset_Countermeasure;

interface

uses
  tttData, Classes, uDBBlind_Zone, uDBNote_Storage;


type

// Acoustic_Decoy_On_Board
// Air_Bubble_Mount
// Chaff_On_Board
// Chaff_Launcher_On_Board
// Defensive_Jammer_On_Board

// Floating_Decoy_On_Board
// Infrared_Decoy_On_Board
// Jammer_On_Board
// Point_Effect_On_Board
// Towed_Jammer_Decoy_On_Board


  TAcoustic_Decoy_On_Board = class
  public
    FData  : TRecAcoustic_Decoy_On_Board;
    FAccousticDecoy_Def : TRecAcoustic_Decoy_Definition;
    FAccousticDecoy_POHs : TList;
    FAccousticDecoy_POH : TRecAcoustic_Decoy_POH_Modifier;
    FNote               : TNote_Storage ;
  end;

  TAir_Bubble_Mount = class
  public
    FData           : TRecAir_Bubble_Mount;
    FAirBubble_Def  : TRecAir_Bubble_Definition;
    FNote            : TNote_Storage ;
  end;


  TChaff_On_Board = class
  public
    FData           : TRecChaff_On_Board;
    FChaff_Def      : TRecChaff_Definition;

    FScripted_Chaffs  : TList; //of TScripted_Chaff
    FScripted_Pattern : TList; //of TScripted_Pattern
    FNote             : TNote_Storage ;

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
  end;

  TFloating_Decoy_On_Board = class
  public
    FData              : TRecFloating_Decoy_On_Board;
    FFloatingDecoy_Def : TRecFloating_Decoy_Definition;
    FNote              : TNote_Storage ;
  end;

  TInfrared_Decoy_On_Board = class
  public
    FData               : TRecInfrared_Decoy_On_Board;
    FInfraRedDecoy_Def  : TRecInfrared_Decoy_Definition;
    FScripted_Infra     : TList;
    FPattern_Infra      : Tlist;
    FNote               : TNote_Storage ;
  end;

  TJammer_On_Board = class     //jammer noise
  public
    FData  : TRecJammer_On_Board;
    FDef   : TRecJammer_Definition;
    FNote  : TNote_Storage ;
  end;

  TPoint_Effect_On_Board = class
  public
    FData           : TRecPoint_Effect_On_Board;
    FBlind_Zone     : TBlind_Zone;
    FBlind          : TList;
    FScripted_Point : TList;
    FPattern_Point  : TList;

    constructor Create;
    destructor Destroy;override;
  end;

  TTowed_Jammer_Decoy_On_Board = class
  public
    FData : TRecTowed_Jammer_Decoy_On_Board;
    FDef  : TRecTowed_Jammer_Decoy_Definition;
    FNote : TNote_Storage ;
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
  FBlind.Free;
  FScripted_Point.Free;
  FPattern_Point.Free;
  FBlind_Zone.Free;
  inherited;
end;

end.
