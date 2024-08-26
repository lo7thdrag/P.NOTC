unit uDataRec;

interface

uses
  System.SysUtils, uTCPDatatype;

const
  // Legacy ID  DENTA
  CPID_CMD_SYNCH = 55;
  CPID_SYNCH_POS_3D = 155;

  CPID_TCP_REQUEST = 60;
      REQ_DATA_PLATFORM = 7;

  CPID_REC_AOTC_DATA = 152;
      CORD_ID_START_SEND_DATA = 1;
      CORD_ID_REQ_NEXT_DATA = 2;
      CORD_ID_END_SEND_DATA = 3;

  CPID_GAME_TIME = 156;

  CPID_CMD_PLATFORM = 51;
    CORD_ID_MOVE  = 1;
      CORD_TYPE_SPEED     = 1;
      CORD_TYPE_COURSE    = 2;
      CORD_TYPE_ALTITUDE  = 3;

  CPID_UDP_REPOSITION       = 37;
  CPID_CMD_PLATFORM_REPOS   = 52;
      CORD_ID_REPOS  = 1;

  CPID_CMD_LAUNCH_EMBARK = 54;

  CPID_CMD_LAUNCH_RUNTIME_PLATFORM = 61;
      CORD_ID_LAUNCH_SINGLE_RUNTIME_PLATFORM = 0;

  CPID_CMD_REMOVE_PLATFORM = 64;

  CPID_CMD_RAMP    = 168;
    CORD_ID_OPEN   = 1;
    CORD_ID_CLOSE  = 2;

  CPID_CMD_GUN_FIRE = 57;
    CORD_ID_assign = 1;
    CORD_ID_break  = 2;
    CORD_ID_fire   = 3;
    CORD_ID_cease  = 4;
	  CORD_ID_control_mode = 5;
    CORD_ID_salvo_mode   = 6;
    CORD_ID_target       = 7;
    CORD_ID_thresh_speed = 8;
    CORD_ID_intercp_range= 9;
    CORD_ID_salvo_size  = 10;
    CORD_ID_fire_result = 11;
    CORD_ID_fire_stop = 12;
    CORD_ID_postNGS   = 13; //mk add
    CORD_ID_chaff_pos = 14;
    CORD_ID_chaff_bloom = 15;
    CORD_ID_chaff_type  = 16;
    CORD_ID_NGSCorrLR = 17;
    CORD_ID_NGSCorrDA = 18;

  CPID_CMD_LAUNCH_MISSILE = 56;
    CORD_ID_launch_hybrid = 1;

  CPID_CMD_LAUNCH_TORPEDO = 73;

  CPID_CMD_CAMERA_CONTROLLER      = 167;
	  CORD_ID_CAMCON_MODE             = 1;
    CORD_ID_CAMCON_SHOW_PLATFORM    = 2;
    CORD_ID_CAMCON_POS_AZIMUTH      = 3;
    CORD_ID_CAMCON_POS_RANGE        = 4;
    CORD_ID_CAMCON_POS_ELEVATION    = 5;
    CORD_ID_CAMCON_REPOS_LAT        = 6;
    CORD_ID_CAMCON_REPOS_LONG       = 7;
    CORD_ID_CAMCON_TRACK_POS        = 8;
    CORD_ID_CAMCON_VISION           = 9;

  CPID_CMD_SYNC_WAYPOINTDATATO3D = 177;
	  CORD_ID_WAYPOINT_START = 1;
    CORD_ID_WAYPOINT_END   = 2;

  CPID_CMD_MULTI_MODE_TO_3D = 190;
    C_DELETE_TO_3D  = 0;
    C_ADD_TO_3D     = 1;
    C_MOVE_TO_3D    = 2;
    C_SPEED_TO_3D   = 3;
    C_COURSE_TO_3D  = 4;
    C_HEADING_TO_3D = 5;

  CPID_CMD_TRANSPORT = 178;
    CORD_ID_embark = 1;
    CORD_ID_disembark  = 2;

  CPID_CMD_LAUNCH_BOMB      	 = 105;

  CPID_CMD_LAUNCH_MINES    		 = 106;

  CPID_CMD_LOGISTIC_STATUS    = 193;

  CPID_CMD_CHANGE_LOGISTIC       = 157;

  CPID_CMD_ENVI = 97;

  CPID_CMD_GAME_CTRL = 59;
    CORD_ID_start       = 1;
    CORD_ID_pause       = 2;
    CORD_ID_game_speed  = 3;
    CORD_ID_gototime    = 4;
    CORD_ID_finishgoto  = 5;

  CPID_SESSIONSTATE = 12;
    CID_INFO        = 0;
    CID_CREATE      = 1;
    CID_DESTROY     = 2; // Only this
    CID_CONNECT     = 3;

  CPID_CMD_SONAR_DEPLOY = 126;

type

  TRecData3DPosition = record
    pc: TPacketID;
    ConsoleID, ShipDbID: word;
    EntityID : LongWord;
    x, y, z: single;
    heading: single;
    speed: single;
    pitch: single;
    roll: single;
    rudder: single; //
    groundSpeed : single;
  end;

  TRecUDP_PlatformMovement =  record
    pid  : TPacketID;
    SessionID  : Integer;
    PlatformID : Integer;
    OrderID : Byte;
    IDPlatformName : Integer;
    IDPlatformClass : Integer;
    X, Y, Z  : double;
    Course,
    Speed    : Single;
    Accel,
    TurnRate : Single;
    ObjectType : Byte;
    FuelRemaining : double;
    MLRemaining : double;
    ATRemaining : double;
    FoodRemaining : double;
    WaterRemaining : double;
    TimeRemaining : double;
    RangeRemaining : double;
    OveralDamage : Integer;
    HealthPercent : Single;
  end;

  TRecCmdSYNCH = record
    pid           : TPacketID;
    SessionID     : Integer;
    SynchID       : byte;
    Synch_IParam  : integer;
    Synch_Dparam  : double;
    Synch_Version : string[255];
  end;

  TRecCmdVersion = record
    pid           : TPacketID;
    SessionID     : Integer;
    SynchID       : byte;
    Synch_Version : string[255];
  end;

  TRecTCP_Request = record
    pid         : TPacketID;
    SessionID   : Integer;
    State3D     : Byte;
    reqID       : byte;
    reqParam    : byte;
    reqFlag     : word;
  end;

  TRec_GameTime = record
    pc : TPacketID;
    OrderID : Integer;
    GameYear : Integer;
    GameMonth : Integer;
    GameDay : Integer;
    Gamehour : Integer;
    GameMinute : Integer;
    GameSecond : Integer;
  end;

  TRec_AOTC_Data_Initialize = record
    PC : TPacketID;
    OrderID : Byte;
    PlatformID : Integer;
    IDPlatformName : Integer;
    IDPlatformClass : Integer;
    nameClass : array[1..60] of AnsiChar;
    namePlatform : array[1..60] of AnsiChar;
    VBSClassName : array[1..60] of AnsiChar;
    TurnRate : Double;
    DiveRate : Double;
    Course : Double;
    Speed : Double;
    Altitude : Double;
    PosX : Double;
    PosY : Double;
    PosZ : Double;
    FreeMe : Byte;
    PlatformDomain : Byte;
    OveralDamage : Integer;
    HealthPercent : Single;
    ForceDesignation : Byte;
  end;

  TRecCmd_Platform = record
    pid  : TPacketID;
    SessionID : Integer;  //reserved;
    PlatfomID : Integer;
    TurnRate  : Single;
    OrderID   : Byte;
    OrderType : Byte;
    OrderParam: single;
    IDPlatformClass : Integer;
    VDomain : Byte;
    DiveMode : Byte;
    quickFormation : byte;
  end;

  TRecCmd_SelectPlatformToRemove = record
    pid                 : TPacketID;
    SessionID           : Integer;
    PlatfomID           : Integer;  // selected platform_index
    isNRPlatform        : boolean; {is NonReal Platform}
    IdAction            : Byte; {1 :Delete by User; 0: Landing}
  end;

  TRecCmd_LaunchRP = record
    pid  : TPacketID;
    SessionID     : Integer;
    OrderID       : Byte;
    OrderType     : Byte;
    MaxRowIndex   : Integer;
    MaxColumnIndex: Integer;
    RPPlatformID  : integer;      // ID nya launcher / vehicle def
    NewPlatformID : Integer;      // digenerate server. client kirim 0
    RPGroupID     : Integer;      // assignment ke group.
    ForceDesignation: Integer;    //mk Force Designation 27042012
    IDPlatformName : Integer;     ///tambahan untuk vbs
    IDPlatformClass : Integer;    ///tambahan untuk vbs
    nameClass : array[1..60] of AnsiChar;    ///tambahan untuk vbs
    namePlatform : array[1..60] of AnsiChar; ///tambahan untuk vbs
    VBSClassName : array[1..60] of AnsiChar; ///tambahan untuk vbs
    InstanceName  :  array[1..32] of AnsiChar;
    TrackIdent    :  array[1..12] of AnsiChar;
    domain : Integer;
    pX, pY, pZ : Double;
    PHeading : Double;
    PSpeed : Double;
    PAltitude : Double;
    Quantity_Group_Personal : Integer;
    TurnRate : Double;
    DiveRate : Double;
  end;

  TRecCmd_Platform_MOVE = record     //reposition
    pid  : TPacketID;
    SessionID : Integer;  //reserved;
    PlatfomID : Integer;
    IDPlatformName : Integer;
    IDPlatformClass : Integer;
    OrderID   : Byte;
    X, Y, Z   : double;
    GroupID   : Integer;
  end;

  TRecCmd_Embark = record
    pid               : TPacketID;
    OrderID           : integer;
    QueueNum          : integer;
    SessionID         : Integer;
    ParentPlatformID  : integer;   // ID nya launcher
    EmbarkPlatformID  : integer;   // ID platform instance yg baru di launch
    Hosted_Index      : integer;
    Quantity          : Integer;  {Prince : sementara quantity sy pake sebagai penanda Embark, disembark dan disembarkwith}
    BaseId            : Integer;

    IDPlatformName : Integer;
    IDPlatformClass : Integer;
    nameClass : array[1..60] of AnsiChar;
    namePlatform : array[1..60] of AnsiChar;
    VBSClassName : array[1..60] of AnsiChar;

    LaunchName,
    TrackIdent: array[1..30] of AnsiChar;
    //activation
    InitSpeed,
    InitCourse,
    InitAltitude: Double;

    InitX, initY, initZ: double;
    Quantity_Group_Personal : Integer;
    GrpID : Integer;              //mk 03052012
    Domain : Integer;
    TurnRate : Double;
    DiveRate : Double;
  end;

  TRecCmd_RampController = record
    pid : TPacketID;
    SessionID : Integer;
    PlatformID : Integer;
    RampID : Byte; {0: Front, 1: Rear, 2: Port, 3: Satboard}
    RampState : Byte;
  end;

  TRecCmd_GunFire = record
    pid               : TPacketID;
    SessionID         : Integer;
    ParentPlatformID  : integer;    // ID nya launcher
    GunID             : integer;
    IDPlatformClass   : Integer;
    TargetPlatformID  : integer;
    OrderID           : integer;     // fire ceas
    ControlMode       : integer;
    SalvoMode         : integer;
    SalvoSize         : integer;
    GunCapacityRemain : Integer;
	  InterceptRange    : single;
    ThresSpeed        : single;
    HitProbability    : Byte;
    // tambahan record untuk mengatasi GunID yg sama, tapi beda object
    GunName           : string[100];
    // chaff property
    ChaffX, ChaffY    : single;
    ChaffBloom        : integer;
    ChaffType         : integer;
    {mk NGS}
    pX, pY, pXflash,
    pYflash           : Double;
    pAltitude         : Double;
    degSpotLine       : Double;
    degGunLine        : Double;
    //--- NGS corrections
    NGSCorrMode       : integer;
    NGSRangeCorr      : Double;
    NGSDefCorr        : Double;
    NGSBearing        : Double;
    NGSElevation      : Double;
    VBSAzimuth        : Double;
    VBSElevation      : Double;
    TurretID          : Integer;
  end;

  TRecCmd_LaunchMissile = record
    pid                       : TPacketID;
    SessionID                 : Integer;
    GroupID                   : Integer;
    ParentPlatformID          : integer;
    MissileID                 : integer;     // ID missile nya TWeaponOnBoard
    TargetPlatformID          : integer;
    ProjectileInstanceIndex   : integer;
    Order                     : integer;
    LaunchAngle               : integer;
    FiringMode                : Byte;
    LaunchBearing             : single;
    SeekerRange               : single;
    LauncherID                : Byte;
    NoCubicle                 : Integer;
    // tambahan record untuk mengatasi MissileID yg sama, tapi beda object
    MissileName               : string[100];
    IsEngagementWeapon        : Boolean;
  end;

  TRec_CameraController = record
    pid       : TPacketID;
    SessionID : Integer;
    cmd       : Byte;
    valueInt  : Integer;
    valueDbl  : Double;
  end;

  TRecSync_WaypointDataTo3D = record
    pid         : TPacketID;
    SessionID   : Integer;
    OrderID     : Byte;
    PlatformID  : Integer;
    WaypointID  : Integer;
    Speed       : Double;
    Course      : Double;
    PosX        : Double;
    PosY        : Double;
    Altitude    : Double;
    Domain      : Integer;
  end;

  TRecCmdMultiModeTo3D = record
    pid           : TPacketID;
    SessionID     : Integer;
    CountVehicle  : Integer;
    PlatformID    : array [0..20] of integer;
    aAction       : Byte;
    X             : array[0..20,0..60] of AnsiChar;
    Y             : array[0..20,0..60] of AnsiChar;
    Param         : Double;
    X3D           : array [0..20] of Double;
    Y3D           : array [0..20] of Double;
    Speed3D       : array [0..20,0..60] of AnsiChar;
  end;

  TRecCmd_Transport = record
    pid                   : TPacketID;
    SessionID             : Integer;
    OrderID               : Integer;
    HostPlatformID        : Integer;
    NewHostPlatformID     : Integer;
    MemberPlatformID      : Integer;
    MemberPlatformName    : string[60];
    MemberPlatform3DName  : string[30];
    MemberDomain          : Integer;
    BaseIdentifier        : string[60];
    TrackID               : string[30];
    StateTransport        : Boolean;
    InitSpeed             : Double;
    InitCourse            : Double;
    InitAltitude          : Double;
    TurnRate              : Double;
    DiveRate              : Double;
    RampID                : Integer;
  end;

  TRecCmd_LaunchMine = record
    pid                     : TPacketID;
    SessionID               : Integer;
    GroupID                 : Integer;
    NoCubicle               : Integer;
    ParentPlatformID        : Integer;
    MineOnVehicleID         : Integer;
    Depth                   : Double;
    AvailableQuantity       : Integer;
    ProjectileInstanceIndex : Integer;
    Range                   : Double;
    Count                   : Integer;
	  NameMineVbs             : Integer;
  end;

  TRecCmd_LaunchBomb = record
    pid                     : TPacketID;
    SessionID               : Integer;
    GroupID                 : Integer;
    NoCubicle               : Integer;
    ParentPlatformID        : Integer;
    TargetPlatformID        : Integer;
    BombOnVehicleID         : Integer;
    SalvoSize               : Integer;
    AvailableQuantity       : Integer;
    ProjectileInstanceIndex : Integer;
    BombType                : Byte;
    NameBombVbs             : Integer;
    TargetPosX              : Double;
    TargetPosY              : Double;
  end;

   TRecCmd_State_Logistic = record
    pid             : TPacketID;
    SessionID       : Integer;
    PlatfomID       : Integer;
    DestinationID   : Integer;
    ActionID        : Integer; {0: AsDestStateLogistic; 1:AsSourceStateLogistic}
    StateID         : Integer; {0: Idle; 1: Standby; 2: Process}
    HoseID          : Integer; {0: Port; 1:Starboard}
  end;

  TRecCmd_Change_Logistic = record
    pid             : TPacketID;
    SessionID       : Integer;
    PlatfomID       : Integer;
    DestinationID   : Integer;
    ModeTransferID  : Integer; {0: antar kapal; 1: dari pangkalan; 2: perubahan dari instruktur}
    ItemID          : Integer; {0: Fuel; 1:Lubricants; 2:Water; 3:Food}
    HoseID          : Integer; {0: Port; 1:Starboard}
    vFuel           : double;
    vLubricants     : double;
    vFreshWater     : double;
    vWater          : double;
    vFood           : double;
    StateID         : Integer; {0: Idle; 1: Standby; 2: Process}
  end;

  TrecSinc_Envi = record
    pid           : TPacketID;
    SessionID     : Integer;
    Sub_EnviID    : Integer;   // membedakan sub area 1 dgn yg lain
    Envi_Type     : Integer;   // membedakan global area dgn sub area
    Envi_Chance   : Integer;   // membedakan angin/arus/dll
    Value         : Double;
  end;

  TRecCmd_GameCtrl = record
    pid       : TPacketID;
    SessionID : Integer;
    GameCtrl  : word;   // cmd start / stop / game speed
    GameSpeed : double;
    GotoTime  : integer;
    TimeTogo  : Extended;
  end;

  TRecSessionState = packed record
    pid           : TPacketID;
    Order         : Byte;
    SessionType   : Byte;
    SessionStat   : Byte;
    ScenarioID    : Integer;
    SessionID     : Integer;
    ExerciseName  : string[60];
    SnapshotName  : string[20];
    GPMType       : Byte;
    GPMFName      : string[20];
  end;

  TRecCmd_SonarDeploy = record
    pid           : TPacketID;
    SessionID     : Integer;
    PlatformID    : integer;
    SensorID      : integer;
    TimeToActive  : Integer;
    Param         : Byte;
    ActualCable   : Double;
    OrderCable    : Double;
  end;
implementation

end.
