unit uGameSetting;

interface

uses uT3Listener;

type
  TState = (sNormal, sAlways, sNever);
  TGuidanceCommand = (gcRealistic, gcDirect);

  TGameSetting = class
  private
    FChaffAttenuationOnRadar      : boolean;
    FLandmassOcculting            : boolean;

    FStudentLaunchRestriction     : boolean;
    FStudentCanLaunchAirCraft     : boolean;

    FAutomaticSensorIdentity      : boolean;
    FGuidanceCommand              : TGuidanceCommand;
    FSonobuoyRemovalEvent         : boolean;
    FTidalStreamEffectToShip      : boolean;
    FAircraftTerrainColl          : boolean;
    FTimeRemoveWreck              : integer;
    FAutomaticRemovePlatformOutsideArea: boolean;
    FBubbleRemovalEvent           : boolean;
    FSimplifySensorCheck          : boolean;
    FChaffRemovalEvent            : boolean;
    FWindEffectToAircraft         : boolean;
    FCoastlineCollision           : boolean;
    FSensorBlindZone              : boolean;
    FProbabilityOfKill            : TState;

    FAirTrackDropime              : integer;
    FESMTrackDropTime             : integer;
    FAcousticTrackDropTime        : integer;
    FSubsurfaceTrackDropTime      : integer;
    FSurfaceTrackDropTime         : integer;

    FSurfaceTrackLostContactTime  : integer;
    FAirTrackLostContactTime      : integer;
    FAcousticTrackLostContactTimer: integer;
    FESMTrackLostContactTime      : integer;
    FSubSurfaceTrackLostContatTime: integer;

    FVisualVisibility             : integer;
    FListener                     : TPropertyEventListener;

    procedure SetAircraftTerrainColl(const Value: boolean);
    procedure SetAutomaticRemovePlatformOutsideArea(const Value: boolean);
    procedure SetAutomaticSensorIdentity(const Value: boolean);
    procedure SetBubbleRemovalEvent(const Value: boolean);
    procedure SetChaffAttenuationOnRadar(const Value: boolean);
    procedure SetChaffRemovalEvent(const Value: boolean);
    procedure SetCoastlineCollision(const Value: boolean);
    procedure SetGuidanceCommand(const Value: TGuidanceCommand);
    procedure SetLandmassOcculting(const Value: boolean);
    procedure SetProbabilityOfKill(const Value: TState);
    procedure SetSensorBlindZone(const Value: boolean);
    procedure SetSimplifySensorCheck(const Value: boolean);
    procedure SetSonobuoyRemovalEvent(const Value: boolean);
    procedure SetStudentCanLaunchAirCraft(const Value: boolean);
    procedure SetStudentLaunchRestriction(const Value: boolean);
    procedure SetTidalStreamEffectToShip(const Value: boolean);
    procedure SetTimeRemoveWreck(const Value: integer);
    procedure SetWindEffectToAircraft(const Value: boolean);
    procedure SetAcousticTrackDropTime(const Value: integer);
    procedure SetAcousticTrackLostContactTimer(const Value: integer);
    procedure SetAirTrackDropime(const Value: integer);
    procedure SetAirTrackLostContactTime(const Value: integer);
    procedure SetESMTrackDropTime(const Value: integer);
    procedure SetESMTrackLostContactTime(const Value: integer);
    procedure SetSubsurfaceTrackDropTime(const Value: integer);
    procedure SetSubSurfaceTrackLostContatTime(const Value: integer);
    procedure SetSurfaceTrackDropTime(const Value: integer);
    procedure SetSurfaceTrackLostContactTime(const Value: integer);
    procedure SetVisualVisibility(const Value: integer);
  public
    constructor Create;
    procedure setListener(listener : TPropertyEventListener);
    function  getListener : TPropertyEventListener;

    property ChaffRemovalEvent : boolean read FChaffRemovalEvent write SetChaffRemovalEvent;
    property SonobuoyRemovalEvent : boolean read FSonobuoyRemovalEvent write SetSonobuoyRemovalEvent;
    property BubbleRemovalEvent : boolean read FBubbleRemovalEvent write SetBubbleRemovalEvent;
    property AutomaticRemovePlatformOutsideArea : boolean read FAutomaticRemovePlatformOutsideArea write SetAutomaticRemovePlatformOutsideArea;
    property ProbabilityOfKill : TState read FProbabilityOfKill write SetProbabilityOfKill;
    property TimeRemoveWreck : integer read FTimeRemoveWreck write SetTimeRemoveWreck;  // second;

    property CoastlineCollision  : boolean read FCoastlineCollision write SetCoastlineCollision;
    property AircraftTerrainColl : boolean read FAircraftTerrainColl write SetAircraftTerrainColl;
    property TidalStreamEffectToShip : boolean read FTidalStreamEffectToShip write SetTidalStreamEffectToShip;
    property WindEffectToAircraft : boolean read FWindEffectToAircraft write SetWindEffectToAircraft;
    property GuidanceCommand : TGuidanceCommand read FGuidanceCommand write SetGuidanceCommand;
    property SimplifySensorCheck : boolean read FSimplifySensorCheck write SetSimplifySensorCheck;
    property StudentLaunchRestriction : boolean read FStudentLaunchRestriction write SetStudentLaunchRestriction;
    property StudentCanLaunchAirCraft : boolean read FStudentCanLaunchAirCraft write SetStudentCanLaunchAirCraft;

    property LandmassOcculting : boolean read FLandmassOcculting write SetLandmassOcculting;
    property ChaffAttenuationOnRadar : boolean read FChaffAttenuationOnRadar write SetChaffAttenuationOnRadar;
    property AutomaticSensorIdentity : boolean read FAutomaticSensorIdentity write SetAutomaticSensorIdentity;
    property SensorBlindZone : boolean read FSensorBlindZone write SetSensorBlindZone;
    property VisualVisibility : integer read FVisualVisibility write SetVisualVisibility;

    property AirTrackLostContactTime : integer read FAirTrackLostContactTime write SetAirTrackLostContactTime;
    property SurfaceTrackLostContactTime : integer read FSurfaceTrackLostContactTime write SetSurfaceTrackLostContactTime;
    property SubSurfaceTrackLostContatTime : integer read FSubSurfaceTrackLostContatTime write SetSubSurfaceTrackLostContatTime;
    property ESMTrackLostContactTime : integer read FESMTrackLostContactTime write SetESMTrackLostContactTime;
    property AcousticTrackLostContactTimer : integer read FAcousticTrackLostContactTimer write SetAcousticTrackLostContactTimer;
    property AirTrackDropTime : integer read FAirTrackDropime write SetAirTrackDropime;
    property SurfaceTrackDropTime : integer read FSurfaceTrackDropTime write SetSurfaceTrackDropTime;
    property SubsurfaceTrackDropTime : integer read FSubsurfaceTrackDropTime write SetSubsurfaceTrackDropTime;
    property ESMTrackDropTime : integer read FESMTrackDropTime write SetESMTrackDropTime;
    property AcousticTrackDropTime : integer read FAcousticTrackDropTime write SetAcousticTrackDropTime;
  end;

var
  GameSetting : TGameSetting;

implementation

{ TGameSetting }

constructor TGameSetting.Create;
begin
  // set default setting;
  FChaffAttenuationOnRadar        := false;
  FLandmassOcculting              := false;
  FStudentLaunchRestriction       := false;
  FAutomaticSensorIdentity        := false;
  FGuidanceCommand                := gcRealistic;
  FSonobuoyRemovalEvent           := false;
  FStudentCanLaunchAirCraft       := false;
  FTidalStreamEffectToShip        := false;
  FAircraftTerrainColl            := false;
  FTimeRemoveWreck                := 120;
  FAutomaticRemovePlatformOutsideArea := false;
  FBubbleRemovalEvent             := false;
  FSimplifySensorCheck            := false;
  FChaffRemovalEvent              := false;
  FWindEffectToAircraft           := false;
  FCoastlineCollision             := false;
  FSensorBlindZone                := false;

  FProbabilityOfKill              := sNormal;

  FAirTrackDropime                := 60;
  FESMTrackDropTime               := 60;
  FAcousticTrackDropTime          := 60;
  FSubsurfaceTrackDropTime        := 60;
  FSurfaceTrackDropTime           := 60;
  FSurfaceTrackLostContactTime    := 30;
  FAirTrackLostContactTime        := 30;
  FAcousticTrackLostContactTimer  := 30;
  FESMTrackLostContactTime        := 30;
  FSubSurfaceTrackLostContatTime  := 30;

  FVisualVisibility               := 90;

  FListener   := TPropertyEventListener.Create;
end;

function TGameSetting.getListener: TPropertyEventListener;
begin
  result := FListener;
end;

procedure TGameSetting.SetAcousticTrackDropTime(const Value: integer);
begin
  FAcousticTrackDropTime := Value;
end;

procedure TGameSetting.SetAcousticTrackLostContactTimer(const Value: integer);
begin
  FAcousticTrackLostContactTimer := Value;
end;

procedure TGameSetting.SetAircraftTerrainColl(const Value: boolean);
begin
  FAircraftTerrainColl := Value;
end;

procedure TGameSetting.SetAirTrackDropime(const Value: integer);
begin
  FAirTrackDropime := Value;

  if Assigned(FListener) then begin
    if Assigned(FListener.OnPropertyIntChange) then
      FListener.OnPropertyIntChange(nil,psAirTrackDropTime, Value);
  end;
end;

procedure TGameSetting.SetAirTrackLostContactTime(const Value: integer);
begin
  FAirTrackLostContactTime := Value;
end;

procedure TGameSetting.SetAutomaticRemovePlatformOutsideArea(
  const Value: boolean);
begin
  FAutomaticRemovePlatformOutsideArea := Value;
end;

procedure TGameSetting.SetAutomaticSensorIdentity(const Value: boolean);
begin
  FAutomaticSensorIdentity := Value;
end;

procedure TGameSetting.SetBubbleRemovalEvent(const Value: boolean);
begin
  FBubbleRemovalEvent := Value;
end;

procedure TGameSetting.SetChaffAttenuationOnRadar(const Value: boolean);
begin
  FChaffAttenuationOnRadar := Value;
end;

procedure TGameSetting.SetChaffRemovalEvent(const Value: boolean);
begin
  FChaffRemovalEvent := Value;
end;

procedure TGameSetting.SetCoastlineCollision(const Value: boolean);
begin
  FCoastlineCollision := Value;
end;

procedure TGameSetting.SetESMTrackDropTime(const Value: integer);
begin
  FESMTrackDropTime := Value;
end;

procedure TGameSetting.SetESMTrackLostContactTime(const Value: integer);
begin
  FESMTrackLostContactTime := Value;
end;

procedure TGameSetting.SetGuidanceCommand(const Value: TGuidanceCommand);
begin
  FGuidanceCommand := Value;
end;

procedure TGameSetting.SetLandmassOcculting(const Value: boolean);
begin
  FLandmassOcculting := Value;
end;

procedure TGameSetting.setListener(listener: TPropertyEventListener);
begin
  FListener := listener;
end;

procedure TGameSetting.SetProbabilityOfKill(const Value: TState);
begin
  FProbabilityOfKill := Value;
end;

procedure TGameSetting.SetSensorBlindZone(const Value: boolean);
begin
  FSensorBlindZone := Value;
end;

procedure TGameSetting.SetSimplifySensorCheck(const Value: boolean);
begin
  FSimplifySensorCheck := Value;
end;

procedure TGameSetting.SetSonobuoyRemovalEvent(const Value: boolean);
begin
  FSonobuoyRemovalEvent := Value;
end;

procedure TGameSetting.SetStudentCanLaunchAirCraft(const Value: boolean);
begin
  FStudentCanLaunchAirCraft := Value;
end;

procedure TGameSetting.SetStudentLaunchRestriction(const Value: boolean);
begin
  FStudentLaunchRestriction := Value;
end;

procedure TGameSetting.SetSubsurfaceTrackDropTime(const Value: integer);
begin
  FSubsurfaceTrackDropTime := Value;
end;

procedure TGameSetting.SetSubSurfaceTrackLostContatTime(const Value: integer);
begin
  FSubSurfaceTrackLostContatTime := Value;
end;

procedure TGameSetting.SetSurfaceTrackDropTime(const Value: integer);
begin
  FSurfaceTrackDropTime := Value;
end;

procedure TGameSetting.SetSurfaceTrackLostContactTime(const Value: integer);
begin
  FSurfaceTrackLostContactTime := Value;
end;

procedure TGameSetting.SetTidalStreamEffectToShip(const Value: boolean);
begin
  FTidalStreamEffectToShip := Value;
end;

procedure TGameSetting.SetTimeRemoveWreck(const Value: integer);
begin
  FTimeRemoveWreck := Value;

  if Assigned(FListener) then begin

    if Assigned(FListener.OnPropertyIntChange) then
      FListener.OnPropertyIntChange(nil,psTimeRemoveWreck, Value);

  end;
end;

procedure TGameSetting.SetVisualVisibility(const Value: integer);
begin
  FVisualVisibility := Value;
end;

procedure TGameSetting.SetWindEffectToAircraft(const Value: boolean);
begin
  FWindEffectToAircraft := Value;
end;

end.
