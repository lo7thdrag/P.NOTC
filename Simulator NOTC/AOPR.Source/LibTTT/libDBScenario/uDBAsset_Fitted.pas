unit uDBAsset_Fitted;

interface

uses
  tttData,Classes;

type

  TFitted_Weap_Launcher_On_Board = class
  public
    FData   : TRecFitted_Weap_Launcher_On_Board;
  end;

  TFitted_Weapon_On_Board = class
  public
    FData       : TRecFitted_Weapon_On_Board;
    FHybrid     : TList;

    constructor Create;
    destructor Destroy;override;
  end;

implementation

{ TFitted_Weapon_On_Board }


{ TFitted_Weapon_On_Board }

constructor TFitted_Weapon_On_Board.Create;
begin
  FHybrid     := TList.Create;
end;

destructor TFitted_Weapon_On_Board.Destroy;
begin
  FHybrid.Free;
  inherited;
end;

end.
