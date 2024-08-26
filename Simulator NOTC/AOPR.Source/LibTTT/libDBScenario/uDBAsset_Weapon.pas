unit uDBAsset_Weapon;

interface

uses

  tttData,Classes, uDBNote_Storage, uDBAssetObject, uDBAsset_Vehicle,
  uDBAsset_Countermeasure, Sysutils;

type

  TMissile_On_Board = class
  private
  public
    FData         : TRecFitted_Weapon_On_Board;
    FDef          : TRecMissile_Definition;
    FLaunch       : TRecFitted_Weap_Launcher_On_Board;
    FLaunchs      : TList;
    FPI           : TPlatform_Instance;
    FBlind            : TList;
    FScript_Missile   : TList;
    FPattern_Missile  : TList;
    FNote         : TNote_Storage ;
    FVehicle      : TVehicle_Definition;

    constructor Create;
    destructor Destroy;override;

  end;

  TTorpedo_On_Board = class
  public

    FData : TRecFitted_Weapon_On_Board;
    FDef  : TRecTorpedo_Definition;
    FNote     : TNote_Storage ;
    FPI       : TPlatform_Instance;
    FBlind        : TList;
    FScript_Torpedo   : TList;
    FPattern_Torpedo  : TList;
    FVehicle      : TVehicle_Definition;
    FLaunch       : TRecFitted_Weap_Launcher_On_Board;
    FLaunchs      : TList;
    FAspectPOH    : TList; // list of TTorpedo_POH_Modifier

    constructor Create;
    destructor Destroy;override;
  end;

  TMine_On_Board = class
  public

    FNote     : TNote_Storage ;

    FData          : TRecFitted_Weapon_On_Board;
    FMine_Def      : TRecMine_Definition;
    FMine_POD      : TRecMine_POD_vs_Range;
    FPI            : TPlatform_Instance;
    FPOD           : TList;
    FBlind         : TList;
    FScript_Mine   : TList;
    FPattern_Mine  : TList;
    FVehicle       : TVehicle_Definition;

    constructor Create;
    destructor Destroy;override;
  end;

  THybrid_On_Board = class
  public
    FData         : TRecFitted_Weapon_On_Board;
    FHybridData   : TRecHybrid_Definition;
    FTorpedo_Def  : TRecTorpedo_Definition;
    FMissile_Def  : TRecMissile_Definition;
    FBlind        : TList;

    constructor Create;
    destructor Destroy;override;
  end;

  TGun_Definition = class
  public
    FData     : TRecGun_Definition;
    FGun_POH  : TRecGun_POH_vs_Range;
    FBlind    : TList;
    FPOH      : TList;
    FNote     : TNote_Storage ;
    FPoint    : TPoint_Effect_On_Board;

    constructor Create;
    destructor Destroy;override;

  end;

  TBomb_Definition = class
  public
    FData         : TRecBomb_Definition;
    FBomb_POH     : TRecBomb_POH_vs_Range;
    FPOH          : TList;
    FNote         : TNote_Storage ;
   	FPoint        : TPoint_Effect_On_Board;

    constructor Create;
    destructor Destroy;override;
  end;         

implementation

{ TMissile_On_Board }

constructor TMissile_On_Board.Create;
begin
  FPI               := TPlatform_Instance.Create;
  FBlind            := TList.Create;
  FScript_Missile   := TList.Create;
  FPattern_Missile  := TList.Create;
  FVehicle          := TVehicle_Definition.Create;
  FLaunchs          := TList.Create;

end;

destructor TMissile_On_Board.Destroy;
var
  i : integer;
  item : TObject;
begin
  FreeAndNil(FPI);
  FreeAndNil(FVehicle);

  for I := FScript_Missile.Count - 1 downto 0 do begin
    item := FScript_Missile.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FScript_Missile);

  for I := FPattern_Missile.Count - 1 downto 0 do begin
    item := FPattern_Missile.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FPattern_Missile);

  for I := FBlind.Count - 1 downto 0 do begin
    item := FBlind.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FBlind);

  for I := FLaunchs.Count - 1 downto 0 do begin
    item := FLaunchs.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FLaunchs);

  inherited;
end;

{ TTorpedo_On_Board }

constructor TTorpedo_On_Board.Create;
begin
  FPI               := TPlatform_Instance.Create;
  FBlind            := TList.Create;
  FScript_Torpedo   := TList.Create;
  FPattern_Torpedo  := TList.Create;
  FVehicle          := TVehicle_Definition.Create;
  FAspectPOH        := TList.Create;
  FLaunchs          := TList.Create;
end;

destructor TTorpedo_On_Board.Destroy;
var
  i : integer;
  item : TObject;
begin
  for I := FScript_Torpedo.Count - 1 downto 0 do begin
    item := FScript_Torpedo.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FScript_Torpedo);

  for I := FPattern_Torpedo.Count - 1 downto 0 do begin
    item := FPattern_Torpedo.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FPattern_Torpedo);

  for I := FBlind.Count - 1 downto 0 do begin
    item := FBlind.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FBlind);

  for I := FAspectPOH.Count - 1 downto 0 do begin
    item := FAspectPOH.Items[i];     
    FreeAndNil(item);
  end;        
  FreeAndNil(FAspectPOH);
  inherited;
end;

{ TMine_On_Board }

constructor TMine_On_Board.Create;
begin
   FPI            := TPlatform_Instance.Create;
   FPOD           := TList.Create;
   FBlind         := TList.Create;
   FScript_Mine   := TList.Create;
   FPattern_Mine  := TList.Create;
   FVehicle       := TVehicle_Definition.Create;

end;

destructor TMine_On_Board.Destroy;
var
  i : integer;
  item : TObject;
begin
  for I := FScript_Mine.Count - 1 downto 0 do begin
    item := FScript_Mine.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FScript_Mine);

  for I := FPattern_Mine.Count - 1 downto 0 do begin
    item := FPattern_Mine.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FPattern_Mine);

  for I := FBlind.Count - 1 downto 0 do begin
    item := FBlind.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FBlind);
  
  for I := FPOD.Count - 1 downto 0 do begin
    item := FPOD.Items[i];     
    FreeAndNil(item);
  end;        
  FreeAndNil(FPOD);

  FreeAndNil(FPI);
  FreeAndNil(FVehicle);

  inherited;
end;

{ THybrid_On_Board }

constructor THybrid_On_Board.Create;
begin
  FBlind         := TList.Create;

end;

destructor THybrid_On_Board.Destroy;
begin

  inherited;
end;

{ TBomb_Definition }

constructor TBomb_Definition.Create;
begin
  FPoint := TPoint_Effect_On_Board.Create;
  FPOH   := TList.Create;
end;

destructor TBomb_Definition.Destroy;
var
  i : integer;
  item : Pointer;
begin
  FreeAndNil(FPoint);

  for I := FPOH.Count - 1 downto 0 do begin
    item := FPOH.Items[i];
    Dispose(item);
  end;        
  FreeAndNil(FPOH);
  inherited;
end;

{ TGun_Definition }

constructor TGun_Definition.Create;
begin
  FPoint    := TPoint_Effect_On_Board.Create;
  FBlind    := TList.Create;
  FPOH      := TList.Create;
end;

destructor TGun_Definition.Destroy;
var
  i : integer;
  item : TObject;
  p : Pointer;
begin
  FreeAndNil(FPoint);

  for I := FBlind.Count - 1 downto 0 do begin
    item := FBlind.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FBlind);

  for I := FPOH.Count - 1 downto 0 do begin
    p := FPOH.Items[i];
    Dispose(p);
  end;        
  FreeAndNil(FPOH);

  inherited;
end;

end.
