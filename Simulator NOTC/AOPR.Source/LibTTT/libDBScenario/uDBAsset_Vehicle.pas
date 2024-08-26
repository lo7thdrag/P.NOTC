unit uDBAsset_Vehicle;

interface

uses

  Windows, Classes, SysUtils, tttData, uDBNote_Storage;

type


  TVehicle_Definition = class
  private
    FGuidanceType   : TVehicleGuidanceType;
    procedure SetGuidanceType(const Value: TVehicleGuidanceType);

  public
    FData                 : TRecVehicle_Definition;
    FPlatform_Ident       : TRecPlatform_Instance_Identifier;
    FHeliLimitation       : TRecHelicopter_Land_Launch_Limits;

    // sensors
    Radars         : TList;      //      : TRadar_On_Board;
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
    Jammers                 : TList;    //jammer noise
    Point_Effects           : TList;
    Towed_Jammer_Decoys     : TList;
    BubbleLauncher          : TList;

    Hosted_Platform         : TList;
    // TSonobuoy_On_Board;
    Sonobuoy                : TList;
    FNote                   : TNote_Storage ;
    //Pattern
    Predefined              : TList;

    constructor Create;
    destructor Destroy; override;

    function FindRadarByID(const id: integer): TObject;
    function FindSonarByID(const id: integer): TObject;
    function FindESMByID(const id: integer): TObject;
    function FindWeaponGunByID(const id: integer): TObject;
    property GuidanceType   : TVehicleGuidanceType read FGuidanceType write SetGuidanceType;
  end;

implementation

uses uDBAsset_Sensor, uDBAsset_Radar, uDBAsset_Sonar,
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

  GuidanceType            := vgtStraightLine;
end;

destructor TVehicle_Definition.Destroy;
  procedure FreeAndNilList(AList : TList);
  var
    i : integer;
    item : TObject;
  begin
    if Assigned(AList) then
    begin
      for I := 0 to AList.Count - 1 do begin
        item := AList.Items[i];
        FreeAndNil(item);
      end;

      FreeAndNil(AList);
    end;
  end;
begin
  FreeAndNilList(Radars);
  FreeAndNilList(Sonars);
  FreeAndNilList(EOSensors);
  FreeAndNilList(ESMSensors);
  FreeAndNilList(IFFSensors);
  FreeAndNilList(MADSensors);
  FreeAndNilList(Visualsensors);
  FreeAndNilList(FCRSensors);
  FreeAndNilList(Missiles);
  FreeAndNilList(Torpedos);
  FreeAndNilList(Mines);
  FreeAndNilList(Acoustic_Decoys);
  FreeAndNilList(Air_Bubble_Mount);
  FreeAndNilList(Bombs);
  FreeAndNilList(Chaffs);
  FreeAndNilList(Chaff_Launchers);
  FreeAndNilList(Defensive_Jammers);
  FreeAndNilList(Guns);
  FreeAndNilList(Infrared_Decoys);
  FreeAndNilList(Jammers);
  FreeAndNilList(Point_Effects);
  FreeAndNilList(Towed_Jammer_Decoys);
  FreeAndNilList(Hosted_Platform);
  FreeAndNilList(Sonobuoy);
  FreeAndNilList(Predefined);

  inherited;
end;

procedure TVehicle_Definition.SetGuidanceType(
  const Value: TVehicleGuidanceType);
begin
  FGuidanceType := Value;
end;

function TVehicle_Definition.FindRadarByID(const id: integer): TObject;
var f: boolean;
    i: integer;
    r: TRadar_On_Board;
begin
  result := nil;
  f := false;
  i := 0;
  r := nil;
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
  f := false;
  i := 0;
  r := nil;
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
  f := false;
  i := 0;
  r := nil;
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
  f := false;
  i := 0;
  wpn := nil;
  while not f and (i< Guns.Count)  do begin
    wpn := Guns[i];
    f := wpn.FData.Gun_Index = id;
    inc(i)
  end;
  if f then
    result := wpn;

end;


end.
