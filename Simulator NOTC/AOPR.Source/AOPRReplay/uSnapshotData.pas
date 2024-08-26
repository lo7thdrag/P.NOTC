unit uSnapshotData;

interface

uses
  Classes, graphics , tttData , uDataTypes, uDBNote_Storage, Windows ;

type

  t3DPoint = record
    X,
    Y,
    Z: double;
  end;

  TNote_StorageLimit = record
    Note_Index: integer;
    Note_Type: byte;
    Notes: string[255];
  end;

  TRecSwapLineVisual = record
    mX, mY: Double;
    Ranges: single;
    Angle: single;
    Heading: double;
    RelativeAngle: double;
  end;

  _SS_DateTime = record
    year, month, day, hh, mt, sc, mm : word ;
  end;

  _SS_Game_Defaults = record
    FData: TRecGame_Defaults;
    FGameCloud_ESM         : TRecGame_Cloud_On_ESM;
    FGameCloud_Radar       : TRecGame_Cloud_On_Radar;
    FGameDefault_IFF       : array of TRecGame_Default_IFF_Mode_Code;  //edited by andi
    FGameRainfall_ESM      : TRecGame_Rainfall_On_ESM;
    FGameRainfall_Missile  : TRecGame_Rainfall_On_Missile_Seeker;
    FGameRainfall_Radar    : TRecGame_Rainfall_On_Radar;
    FGameRainfall_Sonar    : TRainRateNoiseSonarArray;//TRecGame_Rainfall_On_Sonar;
    FGameSea_Missile       : TRecGame_Sea_On_Missile_Safe_Altitude;
    FGameSea_Radar         : TRecGame_Sea_On_Radar;
    FGameSea_Sonar         : TSeaStateSonarArray;//TRecGame_Sea_On_Sonar;
    FGameShip_Sonar        : TShipNoiseOnSonarArray;//TRecGame_Ship_On_Sonar;
  end;

  _SS_Game_Environment_Definition = record
    FData         : TRecGame_Environment_Definition;
    FGameArea     : TRecGame_Area_Definition;
    FGlobal_Conv  : TRecGlobal_Convergence_Zone ;
  end;

  _SS_TSimObject = record
    ObjectID   : String ;
    IsAssigned : Boolean ;
    PosX: double ;
    PosY: double ;
    PosZ: double ;
  end;

  _SS_TT3Unit = record
    FObject           : _SS_TSimObject ;
    Initialized       : boolean;
    Environment       : _SS_Game_Environment_Definition;
    GameDefaults      : _SS_Game_Defaults;
    //UnitGroup         : boolean  ;   set di runtime
    DeleteFromSnapshot: Boolean;     //untuk delete object tidak dipakai setelah snapshot selesai.
    Lethality         : integer  ;
    InstanceIndex     : integer ;
    Selected          : boolean ;
    Controlled        : boolean ;
    IsRepositioning   : boolean ;
    NoCubicle         : integer ;
    Health            : single ;
    HealthPercent     : single ;
    InstanceName      : string ;
    InstanceClass     : string ;
    TrackNumber       : integer ;
    TrackLabel        : string ;
    TrackDomain       : integer ;
    TrackIdent        : integer ;
    DamageStatus      : TRecDamageStatus ;
    DetectabilityType : Integer;
    FlagShowStatusDestroy : Boolean ;
    isInstructor      : Boolean;
    isWasdal          : Boolean;
    Visible           : boolean ;
  end;

  ///------------------------------------TT3PlatformInstance----------------------------------------
  _SS_TPlatform_Instance = record
    FData           : TRecPlatform_Instance;
    FActivation     : TRecPlatform_Activation;
    //Vehicle       : TVehicle_Definition;
    //Satellite     : TSatellite_Definition;
    //Sonobuoy      : TSonobuoy_On_Board;
    //Hybrid        : THybrid_Definition;
    //Motion        : TMotion_Characteristics;
    //HeliLimitation : THelicopter_Land_Launch_Limits;
    CubicleGroupID  : Integer;
    IsGroupLeader   : boolean;
    PlatformType    : integer ;
    InstanceName    : string ;
    TrackID         : string ;
  end;

  _SS_TT3PlatformInstance = record
    SST3Unit          : _SS_TT3Unit ;
    { public }
    reasonDestroy     : Byte;
	  UnitMakeDestroy   : string;
    isSkipDraw        : Boolean;
    //masukJamming      : Boolean;

    VehicleOnJamming          : array of integer;
    ParentInJamming           : array of integer;
    SubParentInJamming        : array of integer;
    SonobuoyList              : array of integer;
    PlatformDetectBySonobuoy  : array of integer;
    FDelayTIOW                : Integer;
    {DATALINK ATTRIBUTE}
    DataLinkIndex     : Integer;
    PUNumber          : Integer;
    {END DATALINK ATTRIBUTE}
    GroupIndex        : Integer;
    { property }
    FData             : TRecPlatform_Instance ;
    UnitMotion        : TRecMotion_Characteristics ;
    UnitLogistic      : TRecLogistic_Characteristics;
    UnitActivation    : TRecPlatform_Activation ;
    UnitCapability    : TRecTransport;
    Force_Designation : byte ;
    Track_ID          : string ;
    PlatformType      : integer ;
    PlatformDomain    : integer ;
    LaunchTime        : integer ;
    IsGroupLeader     : boolean ;
    Selected          : boolean ;
    Altitude          : single ;
    Course            : double ;
    Speed             : double ;
    Heading           : Double;
    GroundSpeed       : Double ;
    DormantTime       : word ;
    Dormant           : boolean;
    FuelEndurance     : TRecFuelEndurance ;
    FuelCapacity      : double ;
    FuelRemaining     : double ;
    FuelPercentage    : double ;
    DataLinkOn        : boolean ;
    DetailedDetectionShowed: TRadarDetailedCapabilities ;
    PARemaining : Double;
    BARemaining : Double;
    TARemaining : Double;
    MLRemaining : Double;
    ATRemaining : Double;
    FoodRemaining : Double;
    WaterRemaining : Double;
  end;

  _SS_TBlind_Zone   = record
    FData : TRecBlind_Zone_Definition
  end;

  _SS_TPoint_Effect_On_Board = record
    FData           : TRecPoint_Effect_On_Board;
    FBlind_Zone     : _SS_TBlind_Zone;
    FBlind          : TList;
    FScripted_Point : TList;
    FPattern_Point  : TList;
  end;

  _SS_TScripted_Weapon = record
    Event   : TRecScripted_Weapon_Event;
    Behav   : TRecScripted_Behav_Definition;
  end;

  _SS_TPattern_Weapon = record
    Event   : TRecPattern_Weapon_Event;
    Pattern : TRecScripted_Pattern_Point;
  end;

  _SS_Point_Effect_On_Board = record
  public
    FData           : TRecPoint_Effect_On_Board;
    FBlind_Zone     : _SS_TBlind_Zone;
    FBlind          : array of _SS_TBlind_Zone;
    FScripted_Point : array of _SS_TScripted_Weapon;
    FPattern_Point  : array of _SS_TPattern_Weapon;
    ParentInstanceIndex  : integer;
  end;

  _SS_Towed_Jammer_Decoy_On_Board = record
  public
    FData : TRecTowed_Jammer_Decoy_On_Board;
    FDef  : TRecTowed_Jammer_Decoy_Definition;
    FNote : TNote_Storage ;
  end;

  _SS_Scripted_Infrared  = record
    Event : TRecScripted_Infrared_Decoy_Event;
    Behav : TRecScripted_Behav_Definition;
  end;

  _SS_Pattern_Infrared = class
    Event   : TRecPattern_Infrared_Decoy_Event;
    Pattern : TRecScripted_Pattern_Point;
  end;

  _SS_Infrared_Decoy_On_Board = record
  public
    FData               : TRecInfrared_Decoy_On_Board;
    FInfraRedDecoy_Def  : TRecInfrared_Decoy_Definition;
    FScripted_Infra     : array of _SS_Scripted_Infrared;
    FPattern_Infra      : array of _SS_Pattern_Infrared;
    FNote               : TNote_Storage ;
  end;

  _SS_Defensive_Jammer_On_Board = record
    FData                : TRecDefensive_Jammer_On_Board;
    FDefensiveJammer_Def : TRecDefensive_Jammer_Definition;
    FNote                : TNote_Storage ;
  end;

  _SS_Hybrid_On_Board = record
    FData         : TRecFitted_Weapon_On_Board;
    FHybridData   : TRecHybrid_Definition;
    FTorpedo_Def  : TRecTorpedo_Definition;
    FMissile_Def  : TRecMissile_Definition;
  end;

  _SS_Fitted_Weapon_On_Board = record
  public
    FData       : TRecFitted_Weapon_On_Board;
    FHybrid     : array of _SS_Hybrid_On_Board;
  end;

  _SS_Sonobuoy_On_Board = record
    FData           : TRecSonobuoy_On_Board;
    FDef            : TRecSonobuoy_Definition;
    //FBlind_Zone     : _SS_TBlind_Zone;
    //FBlind          : array of _SS_TBlind_Zone;
    //FPattern_Sonar  : TList; //TRecPattern_Sonar_Event;
    //FScripted_sonar : TList;  //TRecScripted_Sonar_Event;
    //FPOD            : TList;
    //FPattern        : TRecPattern_Sonar_Event;
    //FCategory       : TRecSonar_Category ;
    //FNote           : TNote_Storage ;
    //FVehicleID        : string[60];
    //FPI             : TRecPlatform_Instance; // tambahan
    //FSonar          : TSonar_On_Board; // tambahan
    Owner             : Integer;
  end;

  _SS_TVehicle_Definition = record
    FData                     : TRecVehicle_Definition;
    FPlatform_Ident           : TRecPlatform_Instance_Identifier;
    FHeliLimitation           : TRecHelicopter_Land_Launch_Limits;
    FPointEffectsOnBoard      : array of _SS_Point_Effect_On_Board;
    FTowedJammerDecoyOnBoard  : array of _SS_Towed_Jammer_Decoy_On_Board;
    FInfraredecoyOnBoard      : array of _SS_Infrared_Decoy_On_Board;
    FDefensiveJammerOnBoard   : array of _SS_Defensive_Jammer_On_Board ;
    FHybridOnBoard            : array of _SS_Fitted_Weapon_On_Board;
    FSonobuoyOnBoard          : array of _SS_Sonobuoy_On_Board;
    GuidanceType              : Byte;
  end;

  _SS_TQueuedEmbarkedLaunch = record
    ReadyingTime   : double  ;
    ReadyToLaunch  : boolean ;
    InitialSpeed   : double  ;
    InitialHeading : double  ;
    QueueNumber    : integer ;
    InstanceIndexEmbar : Integer;
    TrackID        : string  ;
    LaunchName     : string  ;
  end;

  _SS_TT3EmbarkedVehicle = record
    LaunchAlert         : integer ;
    Quantity            : integer ;
    Availabel           : integer ;
    Readying            : Double ;
    EmbarkedVehicle     : TRecHosted_Platform ;
    EmbarkDefinition    : TRecVehicle_Definition;
    EmbarkedIdentifier  : string ;
    LaunchQueue         : array of _SS_TQueuedEmbarkedLaunch ;
    LandQueue           : array of _SS_TQueuedEmbarkedLaunch ;
    IsAfterLanding      : Boolean ;
  end;

  _SS_Transport = record
//    Identifier    :string;
//    TrackID       :string;
//    Weight        :Double;
//    WideScale     :Double;
//    IdxVehicle    :Integer;
//    Domain        :Integer;
//    DWT           :Double;
//    ReadyingTime  :Double;
//    Status        :Integer;
    MemberId : Integer;
    StateTransport : Boolean;
    HostIdTransport : Integer;
    MemberLoadState : Integer;
    MemberPosX: Integer;
    MemberPosY: Integer;
    MemberHeading: Double;
    MemberOrderedHeading: Double;
    MemberSpeed: Integer;
  end;

  _SS_TWaypointEventClass = record
    FType   : Byte;
    FEnable : boolean;

    //waypoint
    ScriptedRadarEvent : TRecScripted_Radar_Event;
    ScriptedSonarEvent : TRecScripted_Sonar_Event;
    ScriptedIFFEvent : TRecScripted_IFF_Event;
    ScriptedSonobuoyEvent : TRecScripted_Sonobuoy_Event;
    ScriptedWeaponEvent : TRecScripted_Weapon_Event;
    ScriptedMineEvent : TRecScripted_Mine_Event;
    ScriptedChaffEvent : TRecScripted_Chaff_Event;
    ScriptedDatalinkEvent : TRecScripted_Datalink_Event;

    FObjectInstanceIndex :  integer;
  end;

  _SS_TWaypoint = record
    Termination : Byte;
    NextNodeID     : Integer;
    TerminationHeading : Double;
    NextWaypoint : TRecScripted_Behav_Definition;
    ScriptBehavDefinition : TRecScripted_Behav_Definition;
    WaypointEvent : array of _SS_TWaypointEventClass;
  end;
  //---------------------personel record---------------------------------------//
    _SS_TPersonel = record
    Id          : Integer;
    Identifier  : string;
    VeID        : Integer;
    ChildFromBrigade: string;
    ChildFromKompi: string;
    ChildFromPleton: string;
    ChildFromBatalyon: string;
  end;

  _SS_TGroup  = record
    GroupData : _SS_TPersonel;
    Quantity    : Integer;
  end;

  _SS_TPlatoon  = record
    PlatoonData : _SS_TPersonel;
    GroupFlag   : Byte;
    GroupList   : array of _SS_TGroup;
  end;

  _SS_TKompi  = record
    KompiData : _SS_TPersonel;
    PlatoonFlag : Byte;
    PlatonList  : array of _SS_TPlatoon;
  end;

  _SS_TBatalyon = record
    BatalyonData : _SS_TPersonel;
    KompiFlag   : Byte;
    KompiList   : array of _SS_TKompi;
  end;

  _SS_TBrigade = record
    BrigadeData : _SS_TPersonel;
    BatalyonFlag: Byte;
    Batalyon    : array of _SS_TBatalyon;
  end;

  _SS_THose = record
    HoseID : Integer; {0: Port; 1: Starboard}
    Available : Boolean;
    State : Integer;  {0: Idle; 1: Standby; 2: Process}
    DestinationID : Integer;
  end;

  //----------------------------------------------------------------------------//
  _SS_TT3Vehicle  = record
    P : _SS_TT3PlatformInstance ;

    CharSymbol : Char;
    FontName : string;
    FontIndex : Integer;


    EmbarkedVehicles : array of _SS_TT3EmbarkedVehicle ;
    EmbarkedPersonelTemporary     : array of _SS_TBrigade;

    // TO-DO object List
    // Devices  : TList ;
    // Weapons  : TList ;
    // Waypoints: TWaypoint s;

    {$REGION ' Vehicle Guidance '}
    Heading         : Double ;
    GroundSpeed     : Double ;
    Altitude        : Double ;
    FirstHeading    : Double ;
    OrderedSpeed    : Double ;
    OrderedHeading  : Double ;
    OrderedAltitude : Double ;
    WindDirection   : Double ;
    WindSpeed       : Double ;
    {$ENDREGION}

    {$REGION ' Platform System State '}
    DamageOverall       : integer ;
    DamageHelm          : boolean ;
    DamagePropulsion    : boolean ;
    DamagePercentSpeed  : integer ;
    FuelRemainingPersen : single ;
    FuelLeakage         : boolean ;
    DamageSensor        : boolean ;
    DamageWeapon        : boolean ;
    DamageComm          : boolean ;
    {$ENDREGION}

    {$REGION ' Platform Logistic '}
    isTransferFromBase  : Boolean;
    SupplierIDLog       : Integer;
    HoseList            : array of _SS_THose;
    HoseUseID           : Integer; {0: Port; 1: Starboard}
    DestinationIDLog    : Integer;
    DestinationStateLog : Integer; {0: Idle; 1: Standby; 2: Process}

    FuelRemaining : Double ;
    MLRemaining   : Double ;
    ATRemaining   : Double ;
    FoodRemaining : Double ;
    {$ENDREGION}

    {$REGION ' Platform Transport '}
    CurrentHanggarWeight : Double;
    CurrentHanggarCapacity : Integer;
    CurrentOnBoardWeight: Double;
    CurrentPersonelWeight : Double;
    CurrentPersonelCapacity : Integer;
    CurrentHullWeight : Double;
    CurrentHullSpace : Double;
    MemberTransport : array of _SS_Transport;
    {$ENDREGION}

    ShowTrails     : boolean ;
    OnGrounded     : boolean ;
    OnLand         : boolean ;

    VehicleDefinition : _SS_TVehicle_Definition;

    lastHeading       : Double ;
    HelmDegree        : Double ;
    CircleDirection   : Double ;
    EvasionDegree     : Double ;
    helmAngleAchieved : Boolean ;
    EvasionAngleAchieved : Boolean ;
    //TO-DO
    //VHistory : THistoryVisual ;
    isStartZigzag    : Boolean ;
    isFirstZigzag    : Boolean ;
    isLeftZigzag     : Boolean ;
    isRightZigzag    : Boolean ;
    AmplitudoZigzag  : Double ;
    PeriodZigzag     : Double ;
    OrderedZigzag    : Double ;
    temp_PosX        : Double ;
    temp_PosY        : Double;
    PosisiX        : Double;
    PosisiY        : Double;

    isStartSinuation    : Boolean ;
    isFirstSinuation    : Boolean ;
    isLeftSinuation     : Boolean ;
    isRightSinuation    : Boolean ;
    AmplitudoSinuation  : Double ;
    PeriodSinuation     : Double ;
    OrderedSinuation    : Double ;
    Sinuationtemp_PosX  : Double ;
    Sinuationtemp_PosY  : Double ;
    IsOwnShip           : Boolean ;

    LaunchFromRPL       : Boolean;

    Capacity_Pesonel_Carried : Double;
    Capacity_AirPlatf_Carried : Double;
    Wide_Hangar_UnitCarried: Double;
    Wide_Deck_UnitCarried : Double;

    //waypoint
    waypoint : array of _SS_TWaypoint;
  end;

  _SS_TT3NonRealVehicle = record
      V          : _SS_TT3Vehicle ;
      Color      : Integer;
      NRPType    : Integer;
//      SymbolType : String;
      SymbolType : Char;
      Radius     : single;
      //LineVisual : TLineVisual;
  end;

  _SS_TPointVehicleMissileRBLW = record
      FObject          : _SS_TSimObject ;
      PointRBLW_X1     : Double  ;
      PointRBLW_Y1     : Double  ;
      NameRBLW         : string  ;
      Selected         : Boolean ;
      IndexPoint       : Integer ;
      LauncherIndex    : Integer ;
      IsChange         : Boolean ;
      DistanceToTarget : Double  ;
      IsEdit           : Boolean ;
      IsOriginal       : Boolean ;
      OwnerID          : Integer ;
  end;

  //BOLW
  _SS_TPointVehicleMissileBOLW = record
      FObject         : _SS_TSimObject ;
      PointBOLW_X1    : Double     ;
      PointBOLW_Y1    : Double     ;
      NameBOLW        : string     ;
      Selected        : Boolean    ;
      IndexPoint      : Integer    ;
      LauncherIndex   : Integer    ;
      IsChange        : boolean    ;
      DistanceToTarget: Double  ;
      IsEdit          : Boolean    ;
      IsOriginal      : Boolean    ;
  end;

  _SS_TT3CounterMeasure = record
    SST3Unit : _SS_TT3Unit ;
    Category: byte ;
    Status: byte ;
  end;

  _SS_TT3Weapon = record
   P : _SS_TT3PlatformInstance ;
   Owner          : integer ;
   TargetObject   : integer ;
   WeaponOnVehicleID : integer;
   isControllerPlat : Boolean;
   RangeRBLCircle   : Double;

   RBLW_PointX      : Double;
   RBLW_PointY      : Double;
   RBLW_Name        : string;

   RangeBOLWCircle  : Double;
   BOLW_PointX    : Double;
   BOLW_PointY    : Double;
   BOLW_Name      : string;

   ShowRange      : boolean;
   ShowBlind      : boolean;
   PreLaunched    : boolean ;
   Launched       : boolean ;
   Planned        : boolean;
   WeaponCategory : byte ;
   WeaponRange    : double ;
   WeaponStatus   : byte ;
   MountType      : integer ;
   ShowRangeSelected : Boolean ;
   ShowBlindSelected : Boolean ;
   //RangeBomb (aObject:TSimObject): Boolean; virtual;
	 ControlMode : integer ;
   NeedAjust : Boolean ;
  end;

  _SS_TT3Chaff  = record
    P : _SS_TT3PlatformInstance ;
    Owner : integer ;
    ChaffInstanceIndex : Integer;
    LauncherID : Integer;
    BloomRange : Double;
    BloomAltitude : Double;
    MapPositionX : Double;
    MapPositionY : Double;
  end;

  _SS_TT3AirBubble = record
   P : _SS_TT3PlatformInstance ;
   Owner : integer ;
   BubbleInstanceIndex : Integer;
   BloomDepth : Double;
   BloomAngle : Double;
  end;

  _SS_TT3Jammer = record
   P : _SS_TT3PlatformInstance ;
   Owner : integer ;
  end;

  _SS_TT3Decoy = record
   P : _SS_TT3PlatformInstance ;
   Owner : integer ;
  end;

  _SS_TT3Sonobuoy = record
    P : _SS_TT3PlatformInstance ;
    ParentPlatformID   : Integer;
    SonobuoyOnVehicleID: Integer;
    SonobuoyMode       : Byte;
    Depth              : Double;
  end;

  _SS_TT3Missile = record
    W                 : _SS_TT3Weapon ;
    Owner             : Integer ;
    LauncherIndex     : Integer;
    Lethality         : integer ;
    FiringMode        : TMissileFiringMode ;
    LaunchDelay       : integer ;   // second
    DamageCapacity    : double ;
    //SameGroupPlatform : T3CubicleGroup ;
    //DetectPlatform    : TT3UnitContainer ;
    isCounterDelay    : Boolean;
    SeekerOn          : boolean ;
    HaveSeeker        : Boolean ;
    Launching         : boolean ;
    isRBLW            : Boolean ;
    isBOLW            : Boolean ;
    isBOL             : Boolean ;
    Definition        : TRecMissile_Definition ;
    Engagement        : byte ; // TMissileEngagement ;
    LauncherNumber    : integer ;
    TargetPosition    : t3DPoint ;
    ShipIndex         : Integer ;
    ShipName          : string ;
    TargetIndex       : integer ;
    TargetName        : string ;
    TargetTrackCourse : Double ;
    TargetTrackSpeed  : Double ;
    TargetTrackAlt    : Single ;
    DistanceToTarget  : Double ;
    isAirLaunch       : boolean ;
    FHomePositionX    : Double ;
    FHomePositionY    : Double ;
  end;

  _SS_TT3Hit_Missile = record
    PopUp_Move  : byte ;
    HAFO        : Double     ;
    HighCurve   : Double     ;
    StartCurve  : Double     ;
    isHAFOSet       : Boolean ;
    isPopUP         : Boolean ;
    isHavePopUp     : Boolean ;
    //TargettoPopUp   : TSimObject ;
  end;

  _SS_TT3Missile_SS = record
     M      :  _SS_TT3Missile ;
     TT3Hit : _SS_TT3Hit_Missile ;
  end;

  _SS_TT3Missile_SA = record
     M :  _SS_TT3Missile ;
  end;

  _SS_TT3Missile_AA = record
     M :  _SS_TT3Missile ;
  end;

   _SS_TT3Missile_AS = record
     M :  _SS_TT3Missile ;
  end;

  _SS_TT3Missile_LA = record
     M :  _SS_TT3Missile ;
  end;

  _SS_TT3Missile_HM = record
     M :  _SS_TT3Missile ;
  end;

  _SS_TT3Missile_TM = record
     M :  _SS_TT3Missile ;
  end;

  ///------------------------------------TT3PlatformInstance--------------------------------------
  ///------------------------------------Device On Vehicle----------------------------------------


  _SS_TFitted_Weap_Launcher_On_Board = record
    FData   : TRecFitted_Weap_Launcher_On_Board;
  end;

  _SS_TTorpedo_POH_Modifier = record
    FData : TRecTorpedo_POH_Modifier;
  end;

  _SS_TMissile_On_Board = record
    FData             : TRecFitted_Weapon_On_Board;
    FDef              : TRecMissile_Definition;
    FLaunch           : TRecFitted_Weap_Launcher_On_Board;
    FNote             : TNote_Storage ;
    //FPI               : _SS_TT3PlatformInstance;
    FVehicle          : _SS_TVehicle_Definition;
    FLaunchs          : array of _SS_TFitted_Weap_Launcher_On_Board ;
    FBlind            : array of _SS_TBlind_Zone;
    FScript_Missile   : array of _SS_TScripted_Weapon;
    FPattern_Missile  : array of _SS_TPattern_Weapon;
  end;

  _SS_TTorpedo_On_Board = record
    FData             : TRecFitted_Weapon_On_Board;
    FDef              : TRecTorpedo_Definition;
    FNote             : TNote_Storage ;
    //FPI               : _SS_TT3PlatformInstance;
    FVehicle          : _SS_TVehicle_Definition;
    FLaunch           : TRecFitted_Weap_Launcher_On_Board;
    FBlind            : array of _SS_TBlind_Zone;
    FScript_Torpedo   : array of _SS_TScripted_Weapon;
    FPattern_Torpedo  : array of _SS_TPattern_Weapon;
    FAspectPOH        : array of _SS_TTorpedo_POH_Modifier;
  end;

  _SS_TMine_POD_vs_Range = record
    FData : TRecMine_POD_vs_Range;
  end;

  _SS_TMine_On_Board = record
    FData          : TRecFitted_Weapon_On_Board;
    FMine_Def      : TRecMine_Definition;
    FMine_POD      : TRecMine_POD_vs_Range;
    FNote          : TNote_Storage ;
    //FPI            : _SS_TT3PlatformInstance;
    FVehicle       : _SS_TVehicle_Definition;
    FBlind         : array of _SS_TBlind_Zone;
    FScript_Mine   : array of _SS_TScripted_Weapon;
    FPattern_Mine  : array of _SS_TPattern_Weapon;
    FPOD           : array of _SS_TMine_POD_vs_Range;
  end;

  _SS_TGun_POH_vs_Range = record
    FData : TRecGun_POH_vs_Range;
  end;

  _SS_TGun_Definition = record
  public
    FData     : TRecGun_Definition;
    FGun_POH  : TRecGun_POH_vs_Range;
    FNote     : TNote_Storage ;
    FBlind    : array of _SS_TBlind_Zone;
    FPOH      : array of _SS_TGun_POH_vs_Range;
    FPoint    : _SS_TPoint_Effect_On_Board;
  end;

  _SS_TBomb_POH_vs_Range = record
    FData : TRecBomb_POH_vs_Range;
  end;

  _SS_TBomb_Definition = record
  public
    FData         : TRecBomb_Definition;
    FBomb_POH     : TRecBomb_POH_vs_Range;
    FNote         : TNote_Storage ;
    //FBlind        : array of _SS_TBlind_Zone;
    FPOH          : array of _SS_TBomb_POH_vs_Range;
   	//FPoint        : TPoint_Effect_On_Board;
  end;

  //----------------------------------------------------------------------------
  _SS_MissilesOnVehicle = record
    W : _SS_TT3Weapon ;
    Owner               : integer ;
    MissileDefinition   : _SS_TMissile_On_Board ;
    FiringMode          : byte;
    Engagement          : byte;
    Quantity            : integer ;
    SalvoSize           : integer ;
    LaunchDelay         : integer ;
    //OnSetSalvo : TOnWeaponSetSalvo read FOnSetSalvo write SetOnSetSalvo;
    isONRBLW            : Boolean ;
    isONBOLW            : Boolean ;
    isONBOL             : Boolean ;
    LauncherNumber      : integer ;
    DestruckRange       : Double ;
    SeekerRangeTurn     : single ;
    DefaultAltitude     : double ;
    DefaultSeekAltitude : double ;
  end;

  _SS_TorpedoOnVehicle = record
    W : _SS_TT3Weapon ;
    Owner              : integer ;
    TorpedoDefinition  : _SS_TTorpedo_On_Board;
    SalvoSize          : integer ;
    SearchRadius       : Double ;
    SearchDepth        : Double ;
    SafetyCeiling      : Double ;
    SeekerRange        : Double ;

    Quantity           : integer ;
    LaunchBearing      : Double ;
    EnableLaunchBearing: boolean ;
    LaunchMethod       : byte;
  end;

  _SS_GunOnVehicle = record
    W : _SS_TT3Weapon ;
    Owner              : integer ;
    GunDefinition      : _SS_TGun_Definition;
    Quantity           : integer  ;
    SalvoSize          : integer  ;
    //OnSetSalvo : byte;
    SalvoMode          : integer ;
    IsAssigned         : boolean ;
    State              : Integer ;

    InterceptRange     : double ;
    ThresholdSpeed     : double ;

    ChaffBloom         :integer ;
    ChaffType          :double ;
    ChaffPosX          :double ;
    ChaffPosY          :double ;
  end;

  _SS_MineOnVehicle = record
    W : _SS_TT3Weapon ;
    Owner          : integer ;
    MineDefinition : _SS_TMine_On_Board ;
    SalvoSize      : integer ;
    Quantity       : integer ;
  end;

  _SS_BombOnVehicle = record
    W : _SS_TT3Weapon ;
    Owner          : integer ;
    BombDefinition : _SS_TBomb_Definition;
    SalvoSize      : integer ;
    Quantity       : integer ;
    State          : Integer ;
  end;

  _SS_TT3DogBox  = record
   SearchRadius : Double            ;
   ExpiredTime  : Double            ;
   ParentX      : Double            ;
   ParentY      : Double            ;
   VisibLe      : Boolean           ;
   IndexDogBox  : Integer           ;
 end;

  _SS_TT3Vectac  = record
    W             : _SS_TT3Weapon ;
    Owner         : integer ;
    Target        : integer ;
    WeaponCarrier : integer ;
    Longitude     : Double  ;
    Latitude      : Double  ;
    Tracked       : Boolean ;
    Planned       : Boolean ;
    OnDraw        : Boolean ;
    ListDogBox    : array of _SS_TT3DogBox ;
  end;



  _SS_TJammer_On_Board = record
    FData  : TRecJammer_On_Board;
    FDef   : TRecJammer_Definition;
    FNote  : TNote_Storage ;
  end;

  _SS_TScripted_Infrared  = record
    Event : TRecScripted_Infrared_Decoy_Event;
    Behav : TRecScripted_Behav_Definition;
  end;

  _SS_TPattern_Infrared = class
    Event   : TRecPattern_Infrared_Decoy_Event;
    Pattern : TRecScripted_Pattern_Point;
  end;

  _SS_TInfrared_Decoy_On_Board = record
    FData               : TRecInfrared_Decoy_On_Board;
    FInfraRedDecoy_Def  : TRecInfrared_Decoy_Definition;
    FScripted_Infra     : array of _SS_TScripted_Infrared;
    FPattern_Infra      : array of _SS_TPattern_Infrared;
    FNote               : TNote_Storage ;
  end;

  _SS_InfraredDecoyOnVehicle = record
    CM : _SS_TT3CounterMeasure ;
    Quantity: integer ;
    InfraredDecoyDefinition  : _SS_TInfrared_Decoy_On_Board ;
  end;

  _SS_TowedJammerOnVehicle = record
    CM : _SS_TT3CounterMeasure ;
    Quantity: integer ;
    TowedJammerDefinition : _SS_Towed_Jammer_Decoy_On_Board;
    DeploymentAction : byte;
    Bearing: integer ;
    OrderedTowedLength: integer ;
    ActualTOwedLength: integer ;
    Targeting: byte ;
  end;

  _SS_TDefensive_Jammer_On_Board = record
    FData                : TRecDefensive_Jammer_On_Board;
    FDefensiveJammer_Def : TRecDefensive_Jammer_Definition;
    FNote                : TNote_Storage ;
  end;

  _SS_DefensiveJammerOnVehicle = record
    CM : _SS_TT3CounterMeasure ;
    DefensiveDefinition : _SS_TDefensive_Jammer_On_Board ;
    Bearing: Double;
    Targeting: byte;
  end;

  _SS_RadarNoiseJammerOnVehicle = record
    CM : _SS_TT3CounterMeasure ;
    Owner                     : integer;
    //StatusJammerNoiseRadar    : byte;
    RadarJammerDefinition     : _SS_TJammer_On_Board ;
    PowerDensity              : Double;
    MaxEffectiveRange         : Double;
    JammerType                : byte;
    MaximumSectorWidth        : Double;
    UpperFrequencyLimit       : Double;
    LowerFrequencyLimit       : Double;
    UpperVerticalCoverage     : Double;
    LowerVerticalCoverage     : Double;
    Quantity                  : Integer;
    RangeEffective            : Double;
  end;

  _SS_TAir_Bubble_Mount = record
    FData           : TRecAir_Bubble_Mount;
    FAirBubble_Def  : TRecAir_Bubble_Definition;
    FNote           : TNote_Storage ;
  end;

  _SS_AirBubbleOnVehicle = record
    CM : _SS_TT3CounterMeasure ;
    Owner                 : integer;
    Quantity              : integer ;
    AirBubbleMount        : _SS_TAir_Bubble_Mount;
    //ChaffLaunchers: TList read FChaffLaunchers;
    Launcher              : integer ;
    BloomDepth            : double ;
    SalvoSize             : integer ;
    Angle                 : double ;
    BubbleInstanceINdex   : integer ;
    State                 : integer ;
    Number                : integer ;
  end;

  _SS_TAcoustic_Decoy_On_Board = record
    FData                 : TRecAcoustic_Decoy_On_Board;
    FAccousticDecoy_Def   : TRecAcoustic_Decoy_Definition;
    //FAccousticDecoy_POHs  : TList;
    FAccousticDecoy_POH   : TRecAcoustic_Decoy_POH_Modifier;
    FNote                 : TNote_Storage ;
  end;

  _SS_AcousticDecoyOnVehicle = record
    CM : _SS_TT3CounterMeasure ;
    Owner             : integer;
    DeploymentAction  : byte ;
    Control           : byte ;
    CycleTimer        : byte ;
    Mode              : byte ;
    FilterSetting     : integer ;
    ECMDefinition     : _SS_TAcoustic_Decoy_On_Board;
    Quantity          : Integer;
  end;

  _SS_TChaff_Launcher_On_Board = record
    FData  : TRecChaff_Launcher_On_Board;
  end;

  _SS_ChaffLauncher =  record
    CM : _SS_TT3CounterMeasure ;
    Owner                 : integer;
    LauncherDefinition    : _SS_TChaff_Launcher_On_Board ;
    BloomRange            : double ;
    BloomAltitude         : double ;
    SalvoSize             : integer ;
    Delay                 : integer ;
    Angle                 : double ;
    Number                : integer ;
    Kind                  : integer ;
    State                 : integer ;
    ChaffInstanceIndex    : integer ;
    MapPositionX          : double ;
    MapPositionY          : double ;
    IDState               : byte ;
    IsFiring              : boolean ;
  end;

  _SS_TScripted_Chaff = record
    Event: TRecScripted_Chaff_Event;
    Behav: TRecScripted_Behav_Definition;
  end;

  _SS_TPattern_Chaff = class
  public
    Event     : TRecPattern_Chaff_Event;
    Pattern   : TRecScripted_Pattern_Point;
  end;

  _SS_TChaff_On_Board = record
  public
    FData           : TRecChaff_On_Board;
    FChaff_Def      : TRecChaff_Definition;
    FNote             : TNote_Storage ;
    FScripted_Chaffs  : array of _SS_TScripted_Chaff ;
    FScripted_Pattern : array of _SS_TPattern_Chaff
  end;

  _SS_ChaffOnVehicle = record
    CM : _SS_TT3CounterMeasure ;
    Owner            : integer;
    Quantity         : integer;
    ChaffDefinition  : _SS_TChaff_On_Board ;
    //ChaffLaunchers: TList read FChaffLaunchers;
    Launcher         : integer ;
  end;

  _SS_TFloating_Decoy_On_Board = record
    FData              : TRecFloating_Decoy_On_Board;
    FFloatingDecoy_Def : TRecFloating_Decoy_Definition;
    FNote              : TNote_Storage ;
  end;

  _SS_FloatingDecoyOnVehicle = record
    CM : _SS_TT3CounterMeasure ;
    Owner                   : integer;
    Quantity                : integer ;
    FloatingDecoyDefinition : _SS_TFloating_Decoy_On_Board ;
  end;
   ///------------------------------------Device On Vehicle----------------------------------------

   ///--------------------------------------------TT3Sensor----------------------------------------
  _SS_TT3Sensor = record
    SST3Unit               : _SS_TT3Unit ;
    Owner                  : integer ;
    BZStartAngle           : array of single;
    BZEndAngle             : array of single;
    ShowBlindZone          : boolean ;
    ShowRange              : boolean ;
    OperationalStatus      : byte ;
    EmconOperationalStatus : byte ;
    DetectionRange         : single ;
    DetailDetectionRange   : Single ;
    OperatingMode          : byte ;
    ShowRangeSelected      : Boolean ;
    ShowBlindSelected      : Boolean ;
    Date_Time              : _SS_DateTime ;
  end;

  _SS_TPattern_Radar = record
    Event     : TRecPattern_Radar_Event;
    Pattern   : TRecScripted_Pattern_Point;
  end;

  _SS_TScripted_Radar = record
    Event  : TRecScripted_Radar_Event;
    Behav  : TRecScripted_Behav_Definition;
  end;

  _SS_TRadar_Vertical_Coverage = record
    FData  : TRecRadar_Vertical_Coverage;
  end;

  _SS_TRadar_On_Board = record
    FData      : TRecRadar_On_Board;
    FDef       : TRecRadar_Definition;
    FPattern   : TRecPattern_Radar_Event;
    FType      : TRecRadar_Type ;
    FInterval  : TRecRadar_Interval_Definition;
    FNote      : TRecNote_Storage ;
    FVehicle   : _SS_TVehicle_Definition;
    FBlind_Zone         : _SS_TBlind_Zone;
    FBlind              : array of _SS_TBlind_Zone;
    //FRadar_Type         : TList;
    FScripted_Pattern   : array of _SS_TPattern_Radar;
    FScripted_Radar     : array of _SS_TScripted_Radar;
    FRadar_Vertical     : array of _SS_TRadar_Vertical_Coverage;
    FECCM_Type          : TRecECCM_Type ;
  end;

  _SS_TPattern_IFF  = record
    Event   : TRecPattern_IFF_Event;
    Pattern : TRecScripted_Pattern_Point;
  end;

  _SS_TScripted_IFF   = record
    Event   : TRecScripted_IFF_Event;
    Behav   : TRecScripted_Behav_Definition;
  end;

  _SS_TIFF_Sensor_On_Board = record
    FData         : TRecIFF_Sensor_On_Board;
    FPattern_IFF  : array of _SS_TPattern_IFF ;
    FScripted_IFF : array of _SS_TScripted_IFF;
    FVehicle      : _SS_TVehicle_Definition;
  end;

  _SS_TESM_On_Board = record
    FData       : TRecESM_On_Board;
    FESM_Def    : TRecESM_Definition;
    FNote       : TNote_Storage ;
    FBlind_Zone : _SS_TBlind_Zone;
    FBlind      : array of _SS_TBlind_Zone;
    FVehicle    : _SS_TVehicle_Definition;
  end;

  _SS_TEO_On_Board = record
    FData       : TRecEO_On_Board;
    FEO_Def     : TRecEO_Detection_Definition;
    FNote       : TNote_Storage ;
    FBlind_Zone : _SS_TBlind_Zone;
    FBlind      : array of _SS_TBlind_Zone;
    FVehicle    : _SS_TVehicle_Definition;
  end;

  _SS_TMAD_Sensor_On_Board = record
    FData    : TRecMAD_Sensor_On_Board;
    FMAD_Def : TRecMAD_Definition;
    FNote    : TNote_Storage ;
    FVehicle    : _SS_TVehicle_Definition;
  end;

  _SS_TFCR_On_Board = record
    FData    : TRecFCR_On_Board;
    FFCR_def : TRecFCR_Definition;
    FNote    : TNote_Storage ;
    FBlind_Zone : _SS_TBlind_Zone;
    FBlind      : array of _SS_TBlind_Zone;
  end;

  _SS_TPOD_vs_SNR_Point = record
    FData  : TRecPOD_vs_SNR_Point;
  end;

  _SS_TPattern_Sonar  = record
    Event   : TRecPattern_Sonar_Event;
    Pattern : TRecScripted_Pattern_Point;
  end;

  _SS_TScripted_Sonar = record
    Event   : TRecScripted_Sonar_Event;
    Behav   : TRecScripted_Behav_Definition;
  end;

  _SS_TSonar_On_Board = record
    FData           : TRecSonar_On_Board;
    FDef            : TRecSonar_Definition;
    FBlind_Zone     : _SS_TBlind_Zone;
    FBlind          : array of _SS_TBlind_Zone;
    FPattern_Sonar  : array of _SS_TPattern_Sonar;
    FScripted_sonar : array of _SS_TScripted_Sonar;
    FPOD            : array of _SS_TPOD_vs_SNR_Point;

    FPattern  : TRecPattern_Sonar_Event;
    FCategory : TRecSonar_Category ;
    FNote     : TNote_Storage ;
    FVehicle  : _SS_TVehicle_Definition;
  end;

  _SS_TVisual_Sensor_On_Board = record
    FData       : TRecVisual_Sensor_On_Board;
    FBlind_Zone : _SS_TBlind_Zone;
    FBlind      : array of _SS_TBlind_Zone;
    FVehicle    : _SS_TVehicle_Definition;
  end;

  _SS_TSonobuoy_On_Board = record
    FData           : TRecSonobuoy_On_Board;
    FDef            : TRecSonobuoy_Definition;
    FBlind_Zone     : _SS_TBlind_Zone;
    FBlind          : array of _SS_TBlind_Zone;
    FPattern_Sonar  : array of _SS_TPattern_Sonar;
    FScripted_sonar : array of _SS_TScripted_Sonar;
    FPOD            : array of _SS_TPOD_vs_SNR_Point;

    FPattern  : TRecPattern_Sonar_Event;
    FCategory : TRecSonar_Category ;
    FNote     : TNote_Storage ;
    FVehicle  : _SS_TVehicle_Definition;
    FPI       : TRecPlatform_Instance; // tambahan
    FSonar    : _SS_TSonar_On_Board; // tambahan
  end;

  _SS_TT3SonobuoyOnVehicle = record
    S : _SS_TT3Sensor ;
    FSonobuoyDefinition : _SS_TSonobuoy_On_Board;
    FQuantity           : integer;
  end;

  //----------------------------------------------------------------------------

  _SS_TT3Radar = record
    S               : _SS_TT3Sensor ;
    R               : _SS_TRadar_On_Board;
    ControlMode     : byte;
    ECCM            : boolean ;
    ShowScanSector  : boolean ;
    StartScan       : double ;
    EndScan         : double ;
    ScanDegree      : double ;
  end;

  _SS_TT3ESMSensor = record
    S : _SS_TT3Sensor ;
    ESMDefinition : _SS_TESM_On_Board;
  end;

  _SS_TT3EOSensor = record
    S : _SS_TT3Sensor ;
    EODefinition : _SS_TEO_On_Board ;
  end;

  _SS_TT3MADSensor = record
    S : _SS_TT3Sensor ;
    MADDefinition : _SS_TMAD_Sensor_On_Board ;
  end;
  _SS_TT3FCRSensor = record
    S : _SS_TT3Sensor ;
    FCRDefinition : _SS_TFCR_On_Board ;
  end;

  _SS_TT3IFFSensor = record
    S : _SS_TT3Sensor ;
    TransponderOperateStatus   : byte ;
    TransponderMode1Enabled : boolean ;
    TransponderMode2Enabled : boolean ;
    TransponderMode3Enabled : boolean ;
    TransponderMode3CEnabled : boolean ;
    TransponderMode4Enabled : boolean ;
    TransponderMode1 : integer ;
    TransponderMode2 : integer ;
    TransponderMode3 : integer ;

    InterrogatorOperateStatus  : byte ;
    InterrogatorMode1Enabled : boolean ;
    InterrogatorMode2Enabled : boolean ;
    InterrogatorMode3Enabled : boolean ;
    InterrogatorMode3CEnabled : boolean ;
    InterrogatorMode4Enabled : boolean ;
    InterrogatorMode1 : integer ;
    InterrogatorMode2 : integer ;
    InterrogatorMode3 : integer ;

    IFFDefinition : _SS_TIFF_Sensor_On_Board ;
    TargetObjectID  : string ;
    //OnTransponderStatus  : TOnSensorOperationalStatus ;
    //OnInterrogatorStatus : TOnSensorOperationalStatus ;
  end;

  _SS_TT3DataLink = record
    S : _SS_TT3Sensor ;
    BandType : Integer ;
    GroupForce : Integer ;
    EligibleUnits : array of integer ;
    ParticipatingUnits : array of integer ;
    Status : boolean ;
    Played : Boolean ;
  end;

  _SS_TT3Sonar = record
    S               : _SS_TT3Sensor ;
    SonarDefinition : _SS_TSonar_On_Board ;
    ControlMode     : byte ;
    SonarCategory   : byte ;
    //SNRData       : TT3Sonar_Curve_Def ;
    ActiveDetectionRange  : Single ;
    PassiveDetectionRange : Single ;
    TimeDeploy      : Integer ;
    DepthCable      : Double ;
  end;

  _SS_TT3Visual = record
    S : _SS_TT3Sensor ;
    VisualDefinition  : _SS_TVisual_Sensor_On_Board ;
  end;

  ///--------------------------------------TT3Sensor--------------------------------------

  ///------------------------------------SimPlatform :: TT3Weapon----------------------------------------
  _SS_PInstanceIndex = record
    InstanceIndex   : integer ;
  end;

  _SS_TT3Torpedo = record
    W  : _SS_TT3Weapon;
    SearchRadius     : Double ;
    SearchDepth      : Double ;
    SafetyCeiling    : Double ;
    SeekerRange      : Double ;
    Lethality        : integer ;
    SeekerOn         : boolean ;
    OnGrounded       : boolean ;
    OnLand           : boolean ;
    Launching       : Boolean;
    TargetCourse     : double ;
    TargetSpeed      : double ;
    TargetDomain     : double ;
    lastHeading      : double ;
    OrderedAltitude  : double ;
    TargetPosition   : t3DPoint  ;
    TargetPlatforms  : array of _SS_PInstanceIndex ;
    Owner            : integer ;
    LaunchMethod     : byte  ;
    TorpedoDefinition: _SS_TTorpedo_On_Board  ;
    FHomePositionX   : double ;
    FHomePositionY   : double ;
  end;


  _SS_TT3Bomb = record
    W  : _SS_TT3Weapon;
    TargetPlatforms  : array of _SS_PInstanceIndex ;
    TargetPosition   : t3DPoint ;
    DescentRate      : Double ;
    AscentRate       : Double ;
    ParentCourse     : Double ;
    VerticalSpeed    : Double ;
    OrderDepth       : Double ;
    Owner            : integer ;
    TargetedTrack    : integer ;
    State            : byte ;
    BombDefinition   : _SS_TBomb_Definition ;
    BombAktif        : Boolean ;
  end;

  _SS_TT3Mine = record
    B  : _SS_TT3Bomb ;
    OrderedAltitude  : double;
    orderDepth       : Double;
    MineDefinition   : _SS_TMine_On_Board;
//    MineAktif        : Boolean ;
    Owner            : Integer;
    FHomePositionX   : double ;
    FHomePositionY   : double ;
  end;

  _SS_TT3GunPOH = record
    FAirTargetPOH     : array of _SS_TGun_POH_vs_Range;
    FSurfaceTargetPOH : array of _SS_TGun_POH_vs_Range;
    FMinPOHRangeAir, FMaxPOHRangeAir,
    FMinPOHRangeSurf, FMaxPOHRangeSurf : double;
  end;

  _SS_TT3GunShoot = record
    W :  _SS_TT3Weapon ;
    FTT3GunPOH : _SS_TT3GunPOH ;
    POHResult  : byte ;
  end;

  ///------------------------------------SimPlatform :: TT3Weapon----------------------------------------

  ///--------------------------------------game manager--------------------------------------
  _SS_TResource_Allocation = record
  public
      FData         : TRecResource_Allocation;
      FOverlay      : TRecOverlay_Definition;
      IsOverlayShow : Boolean;
      IsOverlayEdit : Boolean;
      IsCubicle     : Boolean;
      FCubicleNumbr : Integer;
      //FDynamicTrack : TList; // array of TRecord_DynamicOverlay;
  end;

  _SS_TRec_OverlayShape = record
  public
    FData           : TRec_OverlayShape;
  end;

  _SS_TGeo_Area_Def = record
    FData   : TRecGeo_Area_Definition;
    Point   : array of TRecGeo_Area_Point;
    Event   : array of TRecConditional_Event_Definition;
  end;

  _SS_TReference_Point = record
    FData         : TRecReference_Point;
    Symbol_Name   : String;
    Symbol_Color  : integer;
    //Drawing       : TDrawElement;
    IsSelected    : boolean;
  end;

  _SS_GameEnvironment = record
    FData: TRecGame_Environment_Definition;
    FGameArea: TRecGame_Area_Definition;
    FGlobal_Conv: TRecGlobal_Convergence_Zone;
  end;

  _SS_GameDefaults = record
    FData: TRecGame_Defaults;
    FGameCloud_ESM         : TRecGame_Cloud_On_ESM;
    FGameCloud_Radar       : TRecGame_Cloud_On_Radar;
    FGameDefault_IFF       : array of TRecGame_Default_IFF_Mode_Code;    //edited by andi
    FGameRainfall_ESM      : TRecGame_Rainfall_On_ESM;
    FGameRainfall_Missile  : TRecGame_Rainfall_On_Missile_Seeker;
    FGameRainfall_Radar    : TRecGame_Rainfall_On_Radar;
    FGameRainfall_Sonar    : TRainRateNoiseSonarArray;//TRecGame_Rainfall_On_Sonar;
    FGameSea_Missile       : TRecGame_Sea_On_Missile_Safe_Altitude;
    FGameSea_Radar         : TRecGame_Sea_On_Radar;
    FGameSea_Sonar         : TSeaStateSonarArray;//TRecGame_Sea_On_Sonar;
    FGameShip_Sonar        : TShipNoiseOnSonarArray;
  end;

  //-----------------------------Base Embark Library--------------------------//
  _SS_TBaseEmbarkLibrary = record
    id                : Integer;
    identifier        : String;
    force             : Integer;
    Longitude         : Double;
    Latitude          : Double;
    Radius            : Double;
    TypeBase          : Integer;
    Fuel              : Double;
    Lubricants        : Double;
    FreshWater        : Double;
    Water             : Double;
    Food              : Double;
    VehicleListFlag   : Byte;
    FVehicleList      : array of TRecPlatform_Embark_Library;
    BrigadeListFlag  : Byte;
    BrigadeList     : array of _SS_TBrigade;
  end;

  //-----------------------------Logistic ------------------------------------//
  _SS_TPointRoute = record
    Name :string;
    PointId : Integer;
    Personel :Integer;
    Color :Integer;
    Speed :Double;
    PosAwalX :Double;
    PosAwalY :Double;
    PosAkhirX :Double;
    PosAkhirY :Double;
  end;

  _SS_TShipingRoute = record
    ShipingRouteId : Integer;
    Name : string;
    Force : Integer;
    Color : Integer;
    iShow : Boolean;
    FList : array of _SS_TPointRoute;
  end;

  _SS_TMainStaticShape = record
  public
    TemplateId  : Integer;
    ShapeType   : Integer;
    postStart   : t2DPoint; {PostStart/ PostCenter}
    postEnd     : t2DPoint;
    Words       : string[30];
	  Size        : byte;
    Radius1     : Double;     {Radius/Inner/Height}
    Radius2     : Double;     {Outer/ Width}
    StartAngle  : Integer;
    EndAngle    : Integer;
    Rotasi      : Integer;
    Kolom       : Integer;
    Baris       : Integer;
    color       : Integer;
    lineType    : TPenStyle;
    weight      : Integer;
    BrushStyle  : TBrushStyle;
    ColorFill   : TColor;
    PolyPoint   : array[0..12] of t2DPoint;
  end;

  _SS_TMainOverlayTemplate = record
    OverlayIndex : Integer;
    Name : string;
    Tipe : Integer;
    Domain : Integer;
    Cubicle : Integer;
    Idx : Integer;
    Force : Integer;
    Role : Byte;
    RoleName : string;
    StaticList : array of _SS_TMainStaticShape;
  end;

  _SS_TIntelijenInfo = record
    Info : string;
  end;

  _SS_TLogisticOnBase = record
    Name : string;
    Status : string;
  end;

  _SS_TVehicleOnBase = record
    Name : string;
    Quantity : Integer;
    Simbol : string;
    IndexTaktisSymbol : Integer;
  end;

  _SS_TMainPlotting = record
    PlottingId : Integer;
    Name : string;
    Identity : Integer;
    Tipe: Integer;
    Time : TDateTime;
    Force : Integer;
    Role : Byte;
    RoleName : string;
    postCenter  : t2DPoint;
    postEnd  : t2DPoint;
    IdAction : Integer;
    Radius        : Double;
    IntelInfoList : array of _SS_TIntelijenInfo;
    LogisticOnBaseList : array of _SS_TLogisticOnBase;
    VehicleOnBaseList : array of _SS_TVehicleOnBase;
  end;

  _SS_TMainStrategi = record
    NameBase : string;
    TypeBase : Integer;
    PosMapLongitude : Double;
    PosMapLatitude  : Double;
    Color : Integer;
  end;

  _SS_TPlatformBase = record
    PlatformBaseId : Integer;
    Identifier : string;
    Force : Integer;
    Longitude : Double;
    Latitude : Double;
//    ListVehicle : Tlist;
//    ListPersonel : Tlist;
    Radius   : Double;
    TypeBase : Integer;
    Fuel : Double;
    Lubricants : Double;
    FreshWater: Double;
    Water: Double;
    Food : Double;
  end;

//  _SS_TBase = record
//    MB : _SS_TMainStrategi;
//  end;

//  _SS_TBaseRadar = record
//    MB : _SS_TMainStrategi;
//    rdrRange : Double;
//  end;

  _SS_TFormation = record
    FFormation_Def   : TRecFormation_Definition;
    FForm_Assign     : TRecFormation_Assignment;
    //Assignment       : TList;
  end;

  _SSA_TFormation      = record
     FForm             : _SS_TFormation ;
  end;

  _SSA_TFormationList  = record
     FFormList         : array of _SSA_TFormation ;
   end;

  _SS_TLink = record
    FLink_Def          : TRecLink_Definition;
    FLink_Part         : TRecLink_Participant;
    Participant        : array of _SS_TPlatform_Instance;
  end;

  _SS_GameScenario = record
    Scenario_def              : TRecScenario_Definition;
    Resource_allocObjFlag     : byte ;
    Resource_alloc            : _SS_TResource_Allocation;
    Platform_Insts            : array of _SS_TPlatform_Instance; //of TPlatform_Instance

    Formation                 : _SSA_TFormation ;
    Formation_List            : _SSA_TFormationList ;
    FLinks                    : array of _SS_TLink;

    GameEnvironmentObjFlag    : byte;
    GameEnvironment           : _SS_GameEnvironment;
    GameEnvironmentListFlag   : Byte;
    GameEnvironmentList       : array of _SS_GameEnvironment;
    GeoAreaDefObjFlag         : byte;
    GeoAreaDef                : _SS_TGeo_Area_Def;
    GeoPointObjFlag           : byte;
    GeoPoint                  : array of _SS_TGeo_Area_Def ;    // GetGeoAreaDefinition
    Resource_Overlay_MappingObjFlag  : byte;
    Resource_Overlay_Mapping  : TRecResource_Overlay_Mapping;
    Overlay_DefinitionObjFlag : byte;
    Overlay_Definition        : TRecOverlay_Definition;
    Overlay_MappingObjFlag    : byte;
    Overlay_Mapping           : array of _SS_TResource_Allocation ; // GetResource_Overlay_Mapping
    DynamicShape_Flag         : Byte;
    DynamicShape              : array of _SS_TRec_OverlayShape;
    StaticShape_Flag          : Byte;
    StaticShape               : array of _SS_TRec_OverlayShape;
    AssetDeploymentObjFlag    : byte;
    AssetDeployment           : TRecAsset_Deployment_Definition ;
    MapGeosetName             : string;
    predefPatternName         : String;
    overlayName               : string;
    allOverlayNames           : array[0..20] of string;
    ExternalComObjFlag        : byte;
    ExternalCom               : TRecExternal_Communication_Channel;
    ExComObjFlag              : byte;
    ExCom                     : array of TRecExternal_Communication_Channel;  // GetExternal_Communication_Channel
    Ref_PointObjFlag          : byte;
    Ref_Point                 : _SS_TReference_Point;
    rpListObjFlag             : byte;
    rpList                    : array of _SS_TReference_Point;  // getAllReference_Point
    GameDefaultsObjFlag       : byte;
    GameDefaults              : _SS_GameDefaults;  //mm gd
    EmbarkListObjFlag         : Byte;
    EmbarkLib                 : array of _SS_TBaseEmbarkLibrary;
  end;

  _SS_GameInfo     = record
    mServerTime    : Double ;
    mGameMS        : LongWord ;
    mGameTime      : Double ;
    mGameStart     : Double ;
    mSessionID     : integer ;
    mGameState     : byte ;
  end;

  __SS_RecCount = record
    mMissileSSCount,
    mMissileSACount,
    mMissileAACount,
    mMissileASCount,
    mMissileLACount,
    mMissileHMCount,
    mMissileTMCount : integer ;

    mMissileTorpedCount,
    mMissileBombCount,
    mMissileMineCount,
    mMissileGunShootCount,
    mMissileVectacCount: integer ;

    mVehicleCount,
    mWeaponCount,
    mChaffCount,
    mAirBubbleCount,
    mJammerCount,
    mDecoyCount,
    mSonobuoyCount,
    mNonRealTimeCount,
    mPointVehicleMissileBOLW,
    mPointVehicleMissileRBLW : integer ;

    mTT3RadarCount ,
    mTT3ESMSensorCount ,
    mTT3EOSensorCount ,
    mTT3MADSensorCount ,
    mTT3FCRSensorCount ,
    mTT3IFFSensorCount ,
    //mTT3DataLinkCount ,
    mTT3SonarCount ,
    mTT3SonobuoyOnVehicleCount,
    mTT3VisualCount : integer ;

    mTT3DefensiveJammerOnVehicle,
    mTT3TowedJammerOnVehicle,
    mTT3InfraredDecoyOnVehicle,
    mTT3RadarNoiseJammerOnVehicleCount,
    mTT3AcousticDecoyOnVehicleCount,
    mTT3AirBubbleOnVehicleCount,
    mTT3ChaffLauncherCount,
    mTT3ChaffOnVehicleCount,
    mTT3FloatingDecoyOnVehicleCount : integer ;

    mTT3MissilesOnVehicleCount,
    mTT3TorpedoOnVehicleCount,
    mTT3GunOnVehicleCount,
    mTT3MineOnVehicleCount,
    mTT3BombOnVehicleCount : integer ;

    mTT3VectacCount : integer ;

    mTMainOverlayTamplate : Integer;
    mTMainStaticShape : Integer;

    mTMainPlotting : Integer;
    mTIntelijenPlotting : Integer;
    mTLogisticPlotting : Integer;
    mTPangkalanPlotting : Integer;

    mTShipingRoute : Integer;
    mTPointRoute : Integer;

    mTPlatformBase : Integer;

//    mTBase : Integer;
//    mTBaseRadar : Integer;
  end;

  _SS_Rainfall = record
    FRainfall_On_ESM      : array of TRecRainfall_On_ESM;
    FRainfall_On_Missile  : array of TRecRainfall_On_Missile_Seeker ;
    FRainfall_On_Radar    : array of TRecRainfall_On_Radar ;
    FRainfall_On_Sonar    : array of TRecRainfall_On_Sonar ;
  end;

  _SS_CloudEffect = record
    FRainfall_On_ESM      : array of TRecCloud_Effects_On_ESM;
    FRainfall_On_Radar    : array of TRecCloud_Effects_On_Radar ;
  end;

  _SS_DefaultVar = record
    Sea_State_On_Missile_Safe_Altitude : TSingleArray;
    Sea_State_On_Radar : TSingleArray;
    Sea_State_On_Sonar : TSeaStateSonarArray;
    Operate            : TString;
    Ship_Noise         : TShipNoiseOnSonarArray;
    Default_Definition : TDefaultDef;
    Default_IFF        : TIFFMode;
  end;

  ///---------------------------------------------------------------------------
  _SSA_TT3Missile_SS       = array of _SS_TT3Missile_SS;
  _SSA_TT3Missile_SA       = array of _SS_TT3Missile_SA;
  _SSA_TT3Missile_AA       = array of _SS_TT3Missile_AA;
  _SSA_TT3Missile_AS       = array of _SS_TT3Missile_AS;
  _SSA_TT3Missile_LA       = array of _SS_TT3Missile_LA;
  _SSA_TT3Missile_HM       = array of _SS_TT3Missile_HM;
  _SSA_TT3Missile_TM       = array of _SS_TT3Missile_TM;
  ///---------------------------------------------------------------------------
  _SSA_TT3Torpedo          = array of _SS_TT3Torpedo;
  _SSA_TT3Bomb             = array of _SS_TT3Bomb;
  _SSA_TT3Mine             = array of _SS_TT3Mine;
  _SSA_TT3GunShoot         = array of _SS_TT3GunShoot;
  _SSA_TT3Vectac           = array of _SS_TT3Vectac;
  _SSA_TT3Sonobuoy         = array of _SS_TT3Sonobuoy;

  ///---------------------------------------------------------------------------
  _SSA_Weapon     = array of _SS_TT3Weapon;
  _SSA_Vehicle    = array of _SS_TT3Vehicle;
  _SSA_Chaff      = array of _SS_TT3Chaff;
  _SSA_AirBubble  = array of _SS_TT3AirBubble;
  _SSA_Jammer     = array of _SS_TT3Jammer;
  _SSA_Decoy      = array of _SS_TT3Decoy;
  _SSA_NonRealTime= array of _SS_TT3NonRealVehicle;
  _SSA_RBLW       = array of _SS_TPointVehicleMissileRBLW ;
  _SSA_BOLW       = array of _SS_TPointVehicleMissileBOLW ;
  ///---------------------------------------------------------------------------
  _SSA_MissilesOnVehicle     = array of _SS_MissilesOnVehicle;
  _SSA_TorpedoOnVehicle      = array of _SS_TorpedoOnVehicle;
  _SSA_GunOnVehicle          = array of _SS_GunOnVehicle;
  _SSA_MineOnVehicle         = array of _SS_MineOnVehicle;
  _SSA_BombOnVehicle         = array of _SS_BombOnVehicle;
  ///---------------------------------------------------------------------------
  _SSA_DefensiveJammerOnVehicle   = array of _SS_DefensiveJammerOnVehicle;
  _SSA_TowedJammerOnVehicle       = array of _SS_TowedJammerOnVehicle;
  _SSA_InfraredDecoyOnVehicle     = array of _SS_InfraredDecoyOnVehicle;
  _SSA_RadarNoiseJammerOnVehicle  = array of _SS_RadarNoiseJammerOnVehicle;
  _SSA_AirBubbleOnVehicle         = array of _SS_AirBubbleOnVehicle;
  _SSA_AcousticDecoyOnVehicle     = array of _SS_AcousticDecoyOnVehicle;
  _SSA_ChaffLauncher              = array of _SS_ChaffLauncher;
  _SSA_ChaffOnVehicle             = array of _SS_ChaffOnVehicle;
  _SSA_FloatingDecoyOnVehicle     = array of _SS_FloatingDecoyOnVehicle;

  ///---------------------------------------------------------------------------
  _SSA_Radar      = array of _SS_TT3Radar  ;
  _SSA_ESMSensor  = array of _SS_TT3ESMSensor ;
  _SSA_EOSensor   = array of _SS_TT3EOSensor ;
  _SSA_MADSensor  = array of _SS_TT3MADSensor ;
  _SSA_FCRSensor  = array of _SS_TT3FCRSensor ;
  _SSA_IFFSensor  = array of _SS_TT3IFFSensor ;
  _SSA_DataLink   = array of _SS_TT3DataLink ;
  _SSA_Sonar      = array of _SS_TT3Sonar ;
  _SSA_Visual     = array of _SS_TT3Visual ;
  _SSA_TT3SonobuoyOnVehicle = array of _SS_TT3SonobuoyOnVehicle;
  ///---------------------------------------------------------------------------

  _SSA_TMainOverlayTemplate   = array of _SS_TMainOverlayTemplate;
  _SSA_TMainPlotting          = array of _SS_TMainPlotting;
  _SSA_TShipingRoute          = array of _SS_TShipingRoute;
  _SSA_TPlatrformBase         = array of _SS_TPlatformBase;


//  _SSA_TIntelijenInfo         = array of _SS_TIntelijenInfo;
//  _SSA_TBase                  = array of _SS_TBase;
//  _SSA_TBaseRadar             = array of _SS_TBaseRadar;
  ///

implementation

//uses uT3SimManager;

end.
