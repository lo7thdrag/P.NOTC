unit uDBAsset_Vehicle;

interface

uses

  Windows, Classes, SysUtils, Graphics, tttData, uDBNote_Storage, uWaypoint, uSimContainers;


type


  TVehicle_Definition = class
  private
    FGuidanceType   : TVehicleGuidanceType;
    FActiveWaypoint : TObject;
    procedure SetGuidanceType(const Value: TVehicleGuidanceType);
    procedure SetActiveWaypoint(const Value: TObject);
 // published

  public
    FData                 : TRecVehicle_Definition;
    FPlatform_Ident       : TRecPlatform_Instance_Identifier;
    FPlatform_Library_Entry : TRecPlatform_Library_Entry;
    FHosted_Platform      : TRecHosted_Platform;

    Waypoints     : TWaypoint;

    // sensors
    Radars         : TList;      //     : TRadar_On_Board;
    Sonars         : TList;      //      : TSonar_On_Board;
    EOSensors      : TList;      //      : TEO_On_Board;
    ESMSensors     : TList;      //      : TESM_On_Board;
    IFFSensors     : TList;      //      : TIFF_Sensor_On_Board;
    MADSensors     : TList;      //      : TMAD_Sensor_On_Board;
    Visualsensors  : TList;      //      : Visual_Sensor_On_Board;
    FCRSensors     : TList;      //      : TFCR_On_Board;

// weapons
    Missiles : TList;
    Torpedos : TList;
    Mines    : TList;
    Hybrids  : TList;

    Acoustic_Decoys         : TList;
    Air_Bubble_Mount        : TList;
    Bombs                   : TList;
    Chaffs                  : TList;
    Chaff_Launchers         : TList;
    Defensive_Jammers       : TList;
    Floating_Decoys         : TList;
    Guns                    : TList;
    Infrared_Decoys         : TList;
    Jammers                 : TList;
    Point_Effects           : TList;
    Towed_Jammer_Decoys     : TList;

    Hosted_Platform         : TList;

    // TSonobuoy_On_Board;
    Sonobuoy                : TList;

    FNote                   : TNote_Storage ;
    FPfCapability           : TRecTransport; //dng
    //Pattern
    Predefined              : TList;

    constructor Create;
    destructor Destroy; override;
    procedure InitWaypoint;

    function FindRadarByID(const id: integer): TObject;
    function FindSonarByID(const id: integer): TObject;
    function FindESMByID(const id: integer): TObject;

    function FindWeaponGunByID(const id: integer): TObject;


    property GuidanceType   : TVehicleGuidanceType read FGuidanceType write SetGuidanceType;
    property ActiveWaypoint : TObject read FActiveWaypoint write SetActiveWaypoint;
  end;


implementation

uses
  uDBAsset_Sensor,uDBAsset_Radar, uDBAsset_Sonar, uDBAsset_Scripted,
    uDBAsset_Weapon;

{ TVehicle_Definition }

constructor TVehicle_Definition.Create;
begin
//sensors
  Radars         := TList.Create;
  Sonars         := TList.Create;
  EOSensors      := TList.Create;
  ESMSensors     := TList.Create;
  IFFSensors     := TList.Create;
  MADSensors     := TList.Create;
  Visualsensors  := TList.Create;
  FCRSensors     := TList.Create;

//weapons
  Missiles := TList.Create;
  Torpedos := TList.Create;
  Mines    := TList.Create;
  Hybrids  := TList.Create;

//countermeasure
  Acoustic_Decoys         := TList.Create;
  Air_Bubble_Mount        := TList.Create;
  Bombs                   := TList.Create;
  Chaffs                  := TList.Create;
  Chaff_Launchers         := TList.Create;
  Defensive_Jammers       := TList.Create;
  Floating_Decoys         := TList.Create;
  Guns                    := TList.Create;
  Infrared_Decoys         := TList.Create;
  Jammers                 := TList.Create;
  Point_Effects           := TList.Create;
  Towed_Jammer_Decoys     := TList.Create;

//embarked platform
  Hosted_Platform         := TList.Create;

// sonobuoy
  Sonobuoy                := TList.Create;

//Pattern
  Predefined              := TList.Create;

  Waypoints               := TWaypoint.Create;
  GuidanceType            := vgtStraightLine;
end;

destructor TVehicle_Definition.Destroy;
begin
  FreeItemsAndFreeList(Radars);
  FreeItemsAndFreeList(Sonars);
  FreeItemsAndFreeList(EOSensors);
  FreeItemsAndFreeList(ESMSensors);
  FreeItemsAndFreeList(IFFSensors);
  FreeItemsAndFreeList(MADSensors);
  FreeItemsAndFreeList(Visualsensors);
  FreeItemsAndFreeList(FCRSensors);
  FreeItemsAndFreeList(Sonobuoy);

  FreeItemsAndFreeList(Missiles);
  FreeItemsAndFreeList(Torpedos);
  FreeItemsAndFreeList(Mines);
  FreeItemsAndFreeList(Hybrids);
  FreeItemsAndFreeList(Bombs);
  FreeItemsAndFreeList(Guns);
  FreeItemsAndFreeList(Point_Effects);

  FreeItemsAndFreeList(Acoustic_Decoys);
  FreeItemsAndFreeList(Air_Bubble_Mount);
  FreeItemsAndFreeList(Chaffs);
  FreeItemsAndFreeList(Chaff_Launchers);
  FreeItemsAndFreeList(Defensive_Jammers);
  FreeItemsAndFreeList(Floating_Decoys);
  FreeItemsAndFreeList(Infrared_Decoys);
  FreeItemsAndFreeList(Jammers);
  FreeItemsAndFreeList(Towed_Jammer_Decoys);

  FreeItemsAndFreeList(Hosted_Platform);
  FreeItemsAndFreeList(Predefined);

  Waypoints.Free;

  inherited;
end;

procedure TVehicle_Definition.InitWaypoint;
var
  wpEvent : TWaypointEventClass;
  i, j : integer;
begin
  // event n behav radar
  for i:= 0 to Radars.Count - 1 do
    for j := 0 to TRadar_On_Board(Radars[i]).FScripted_Radar.Count - 1 do
      with TScripted_Radar(TRadar_On_Board(Radars[i]).FScripted_Radar) do begin
        wpEvent := TWaypointEventClass.Create;
        wpEvent.FType := wetRadar;
        wpEvent.FData := event;
        wpEvent.FEnable := false;
        Waypoints.Add(behav,wpEvent);
      end;

  // event n behav sonar
  for i:= 0 to Sonars.Count - 1 do
    for j := 0 to TSonar_On_Board(Sonars[i]).FScripted_sonar.Count - 1 do
      with TScripted_Sonar(TSonar_On_Board(Sonars[i]).FScripted_sonar) do begin
        wpEvent := TWaypointEventClass.Create;
        wpEvent.FType := wetSonar;
        wpEvent.FData := event;
        wpEvent.FEnable := false;
        Waypoints.Add(behav,wpEvent);
      end;

  // event n behav chaff
  {for i:= 0 to Chaffs.Count - 1 do
    for j := 0 to TChaff_On_Board(Chaffs[i]).FScripted_Chaffs.Count - 1 do
      with TScripted_Chaff(TChaff_On_Board(Chaffs[i]).FScripted_Chaffs)do
        Waypoints.Add(behav,event);

  // event n behav infrared
  for i:= 0 to Infrared_Decoys.Count - 1 do
    for j := 0 to TInfrared_Decoy_On_Board(Infrared_Decoys[i]).FScripted_Infra.Count - 1 do
      with TScripted_Infrared(TInfrared_Decoy_On_Board(Infrared_Decoys[i]).FScripted_Infra)do
        Waypoints.Add(behav,event); }

end;

procedure TVehicle_Definition.SetActiveWaypoint(const Value: TObject);
begin
  FActiveWaypoint := Value;
end;

procedure TVehicle_Definition.SetGuidanceType(
  const Value: TVehicleGuidanceType);
begin
  FGuidanceType := Value;

  case FGuidanceType of
    vgtWaypoint :
      begin
        if Waypoints.Count > 0 then
          FActiveWaypoint := Waypoints.First;
      end;
  end;

end;

function TVehicle_Definition.FindRadarByID(const id: integer): TObject;
var f: boolean;
    i: integer;
    r: TRadar_On_Board;
begin
  result := nil;
  r := nil;
  f := false;
  i := 0;
  while not f and (i< Radars.Count)  do begin
    r := Radars[i];
    f := r.FData.Radar_Instance_Index = id;

    inc(i)
  end;
  if f then
    result := r;
end;

function TVehicle_Definition.FindSonarByID(const id: integer): TObject;
var f: boolean;
    i: integer;
    r: TSonar_On_Board;
begin
  result := nil;
  r := nil;
  f := false;
  i := 0;
  while not f and (i< Sonars.Count)  do begin
    r := Sonars[i];
    f := r.FData.Sonar_Instance_Index = id;

    inc(i)
  end;
  if f then
    result := r;
end;

function TVehicle_Definition.FindESMByID(const id: integer): TObject;
var f: boolean;
    i: integer;
    r: TESM_On_Board;
begin
  result := nil;
  r := nil;
  f := false;
  i := 0;
  while not f and (i< ESMSensors.Count)  do begin
    r := ESMSensors[i];
    f := r.FData.ESM_Instance_Index = id;

    inc(i)
  end;
  if f then
    result := r;
end;

function TVehicle_Definition.FindWeaponGunByID(const id: integer): TObject;
var f: boolean;
    i: integer;
    wpn: TGun_Definition;
begin
  result := nil;
  wpn := nil;
  f := false;
  i := 0;
  while not f and (i< Guns.Count)  do begin
    wpn := Guns[i];
    f := wpn.FData.Gun_Index = id;
    inc(i)
  end;
  if f then
    result := wpn;

end;


end.
