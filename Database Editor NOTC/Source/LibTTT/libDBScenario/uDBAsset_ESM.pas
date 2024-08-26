unit uDBAsset_ESM;

interface

uses
  tttData,uDBNote_Storage;


type


{  TRadar_Definition = class
  public
    FData  : TRecRadar_Definition;
  end;
}

  TESM_On_Board = class
  public
    FData     : TRecESM_On_Board;
    FESM_Def  : TRecESM_Definition;
    FNote     : TNote_Storage ;

    constructor Create;
    destructor Destroy;override;

  end;



implementation

{ TESM_On_Board }

constructor TESM_On_Board.Create;
begin
   //
end;

destructor TESM_On_Board.Destroy;
begin

  inherited;
end;

end.
