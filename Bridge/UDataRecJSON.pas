unit UDataRecJSON;

interface

uses
  Grijjy.Bson,
  Grijjy.Bson.IO,
  Grijjy.Bson.Serialization;

const
  // NPMS ID DENTA
  // Single = double, byte = integer
  CPID_3D_INFO = 1;
      CORD_ID_3D_READY = 1;
      CORD_ID_3D_SHUTDOWN = 2;
      CORD_ID_3D_HANDSHAKE = 3;
  CPID_3D_DATA_UPDATE = 2;
      CORD_ID_OBJ_INIT = 1;
      CORD_ID_END_OBJ_INIT = 2;
  CPID_GAME_TIME_UPDATE_3D = 3;
  CPID_POS_UPDATE_FROM3D = 4;
  CPID_CMD_PLATFORM3D = 5;
    CORD_ID_MOVE  = 1;
      CORD_TYPE_SPEED     = 1;
      CORD_TYPE_COURSE    = 2;
      CORD_TYPE_ALTITUDE  = 3;
  CPID_CMD_REMOVE_PLATFORM3D = 6;
  CPID_CMD_LAUNCH_RUNTIME_PLATFORM3D = 7;
      CORD_ID_LAUNCH_SINGLE_RUNTIME_PLATFORM = 0;
  CPID_CMD_PLATFORM_REPOSITION       = 8;
      CORD_ID_REPOS  = 1;
  CPID_CMD_EMBARK = 9;
  CPID_CMD_RAMP_3D    = 10;
    CORD_ID_OPEN   = 1;
    CORD_ID_CLOSE  = 2;
  CPID_CMD_GUN_FIRE_3D = 11;
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
  CPID_CMD_LAUNCH_MISSILE_3D = 12;
    CORD_ID_launch_hybrid = 1;
  CPID_CMD_LAUNCH_TORPEDO_3D = 13;
  CPID_CMD_CAMERA_CONTROLLER_3D      = 14;
	  CORD_ID_CAMCON_MODE             = 1;
    CORD_ID_CAMCON_SHOW_PLATFORM    = 2;
    CORD_ID_CAMCON_POS_AZIMUTH      = 3;
    CORD_ID_CAMCON_POS_RANGE        = 4;
    CORD_ID_CAMCON_POS_ELEVATION    = 5;
    CORD_ID_CAMCON_REPOS_LAT        = 6;
    CORD_ID_CAMCON_REPOS_LONG       = 7;
    CORD_ID_CAMCON_TRACK_POS        = 8;
    CORD_ID_CAMCON_VISION           = 9;
  CPID_CMD_SYNC_WAYPOINTDATATO3D_3D = 15;
	  CORD_ID_WAYPOINT_START = 1;
    CORD_ID_WAYPOINT_END   = 2;
  CPID_CMD_MULTI_MODE_TO3D_3D = 16;
    C_DELETE_TO_3D  = 0;
    C_ADD_TO_3D     = 1;
    C_MOVE_TO_3D    = 2;
    C_SPEED_TO_3D   = 3;
    C_COURSE_TO_3D  = 4;
    C_HEADING_TO_3D = 5;
  CPID_CMD_TRANSPORT_3D    = 17;
    CORD_ID_embark = 1;
    CORD_ID_disembark  = 2;
  CPID_CMD_LAUNCH_BOMB_3D = 18;
  CPID_CMD_LAUNCH_MINES_3D = 19;
  CPID_CMD_LOGISTIC_STATUS_3D = 20;
  CPID_CMD_ENVI_3D = 21;
  CPID_CMD_GAME_CTRL_3D = 22;
    CORD_ID_start       = 1;
    CORD_ID_pause       = 2;
    CORD_ID_game_speed  = 3;
    CORD_ID_gototime    = 4;
    CORD_ID_finishgoto  = 5;
  CPID_SESSIONSTATE_3D = 23;
    CID_INFO        = 0;
    CID_CREATE      = 1;
    CID_DESTROY     = 2;
    CID_CONNECT     = 3;
  CPID_CMD_SONAR_DEPLOY_3D = 24;

type

  TRec3dPos = record

    [BsonElement('sei')]
    SessionId: Integer; { get; set; }

    [BsonElement('si')]
    SenderId: string; { get; set; }

    [BsonElement('oid')]
    ObjectId: Integer; { get; set; }

    [BsonElement('db')]
    DatabaseId: Integer; { get; set; }

    [BsonElement('px')]
    Pos_Lon: Double; { get; set; }

    [BsonElement('py')]
    Pos_Lat: Double; { get; set; }

    [BsonElement('pz')]
    Elevation: Double; { get; set; }

    [BsonElement('hdg')]
    Heading: Double; { get; set; }

    [BsonElement('sp')]
    Speed: Double; { get; set; }

    [BsonElement('ar')]
    Roll: Double; { get; set; }

    [BsonElement('ap')]
    Pitch: Double; { get; set; }

//    [BsonElement('tp')]
//    ObjTypeEnum: Integer; { get; set; }

    [BsonElement('on')]
    Obj3dName: string; { get; set; }

    [BsonElement('did')]
    LegacyDbId: Integer; { get; set; }

  end;

  RecDataOrder = record

    [BsonElement('sei')]
    SessionId: Integer; { get; set; }

    [BsonElement('si')]
    SenderId: string; { get; set; }

    [BsonElement('oid')]
    ObjectId: Integer; { get; set; }

    [BsonElement('ord')]
    OrderId: Integer; { get; set; }

    [BsonElement('val')]
    Value: Double; { get; set; }

  end;

  NetRecData3D = record

    [BsonElement('sei')]
    SessionId: Integer; { get; set; }

    [BsonElement('st')]
    SoftwareType: string; { get; set; }  //notc or aotc

    [BsonElement('ord')]
    OrderId: Integer; { get; set; }

    [BsonElement('rd')]
    DoubleVal: Double; { get; set; }

    [BsonElement('rs')]
    StringVal: string; { get; set; }

    [BsonElement('ri')]
    IntVal: Integer; { get; set; }

  end;

  NetRec_AOTC_Data_Initialize = record

    [BsonElement('sei')]
    SessionId: Integer; { get; set; }

    [BsonElement('ord')]
    OrderID : Integer;

    [BsonElement('pi')]
    PlatformID : Integer;

    [BsonElement('ipn')]
    IDPlatformName : Integer;

    [BsonElement('pci')]
    IDPlatformClass : Integer;

    [BsonElement('pcn')]
    nameClass : string;// array[1..60] of AnsiChar;

    [BsonElement('pn')]
    namePlatform : string;//array[1..60] of AnsiChar;

    [BsonElement('vn')]
    ClassName3D : string;//array[1..60] of AnsiChar;

    [BsonElement('tr')]
    TurnRate : Double;

    [BsonElement('dr')]
    DiveRate : Double;

    [BsonElement('hdg')]
    Heading : Double;

    [BsonElement('spd')]
    Speed : Double;

    [BsonElement('alt')]
    Altitude : Double;

    [BsonElement('px')]
    PosX : Double;

    [BsonElement('py')]
    PosY : Double;

    [BsonElement('pz')]
    PosZ : Double;

    [BsonElement('fm')]
    FreeMe : Integer;

    [BsonElement('pd')]
    PlatformDomain : Integer;

    [BsonElement('od')]
    OveralDamage : Integer;

    [BsonElement('hp')]
    HealthPercent : Double;

    [BsonElement('fd')]
    ForceDesignation : Integer;
  end;

  NetRec_GameTime = record

    [BsonElement('sei')]
    SessionId: Integer; { get; set; }

    [BsonElement('ord')]
    OrderID : Integer;

    [BsonElement('y')]
    GameYear : Integer;

    [BsonElement('m')]
    GameMonth : Integer;

    [BsonElement('d')]
    GameDay : Integer;

    [BsonElement('h')]
    Gamehour : Integer;

    [BsonElement('mi')]
    GameMinute : Integer;

    [BsonElement('s')]
    GameSecond : Integer;
  end;

  NetRec_Cmd_Platform = record

    [BsonElement('sei')]
    SessionID : Integer;  //reserved;

    [BsonElement('pid')]
    PlatfomID : Integer;

    [BsonElement('tr')]
    TurnRate  : Single;

    [BsonElement('ord')]
    OrderID   : Byte;

    [BsonElement('ort')]
    OrderType : Byte;

    [BsonElement('par')]
    OrderParam: single;

    [BsonElement('idf')]
    IDPlatformClass : Integer;

    [BsonElement('vd')]
    VDomain : Byte;

    [BsonElement('dm')]
    DiveMode : Byte;

    [BsonElement('qf')]
    quickFormation : byte;
  end;

  NetRec_Cmd_SelectPlatformToRemove = record
    [BsonElement('sei')]
    SessionID : Integer;  //reserved;

    [BsonElement('pid')]
    PlatfomID : Integer;

    [BsonElement('np')]
    isNRPlatform : boolean;

    [BsonElement('ia')]
    IdAction : Integer; {1 :Delete by User; 0: Landing}
  end;


  NetRec_Cmd_LaunchRP = record

    [BsonElement('sei')]
    SessionID : Integer;

    [BsonElement('ord')]
    OrderID   : Byte;

    [BsonElement('ort')]
    OrderType : Byte;

    [BsonElement('mri')]
    MaxRowIndex : Integer;

    [BsonElement('mci')]
    MaxColumnIndex : Integer;

    [BsonElement('rpi')]
    RPPlatformID : Integer;

    [BsonElement('npf')]
    NewPlatformID : Integer;

    [BsonElement('gid')]
    RPGroupID : Integer;

    [BsonElement('fd')]
    ForceDesignation : Integer;

    [BsonElement('idf')]
    IDPlatformName : Integer;

    [BsonElement('idc')]
    IDPlatformClass : Integer;

    [BsonElement('pcn')]
    nameClass : string;// array[1..60] of AnsiChar;

    [BsonElement('pn')]
    namePlatform : string;//array[1..60] of AnsiChar;

    [BsonElement('vn')]
    ClassName3D : string;//array[1..60] of AnsiChar;

    [BsonElement('in')]
    InstanceName : string;//array[1..32] of AnsiChar;

    [BsonElement('ti')]
    TrackIdent : string;//array[1..12] of AnsiChar;

    [BsonElement('dm')]
    domain : Integer;

    [BsonElement('x')]
    pX : double;

    [BsonElement('y')]
    pY : double;

    [BsonElement('z')]
    pZ : double;

    [BsonElement('hdg')]
    PHeading : double;

    [BsonElement('spd')]
    PSpeed : double;

    [BsonElement('alt')]
    PAltitude : double;

    [BsonElement('qgp')]
    Quantity_Group_Personal : Integer;

    [BsonElement('trt')]
    TurnRate : Double;

    [BsonElement('drt')]
    DiveRate : Double;

  end;

  Net_RecCmd_Platform_MOVE = record     //reposition
    [BsonElement('sei')]
    SessionID : Integer;

    [BsonElement('pid')]
    PlatfomID : Integer;

    [BsonElement('idf')]
    IDPlatformName : Integer;

    [BsonElement('idc')]
    IDPlatformClass : Integer;

    [BsonElement('ord')]
    OrderID : Integer;

    [BsonElement('x')]
    X : double;

    [BsonElement('y')]
    Y : double;

    [BsonElement('z')]
    Z : double;

    [BsonElement('gid')]
    GroupID : Integer;

  end;

  NetRecCmd_Embark = record
    [BsonElement('ord')]
    OrderID           : integer;

    [BsonElement('qn')]
    QueueNum          : integer;

    [BsonElement('sei')]
    SessionID         : Integer;

    [BsonElement('pid')]
    ParentPlatformID  : integer;   // ID nya launcher

    [BsonElement('eid')]
    EmbarkPlatformID  : integer;   // ID platform instance yg baru di launch

    [BsonElement('hi')]
    Hosted_Index      : integer;

    [BsonElement('qty')]
    Quantity          : Integer;  {Prince : sementara quantity sy pake sebagai penanda Embark, disembark dan disembarkwith}

    [BsonElement('bid')]
    BaseId            : Integer;

    [BsonElement('idf')]
    IDPlatformName : Integer;

    [BsonElement('idc')]
    IDPlatformClass : Integer;

    [BsonElement('nc')]
    nameClass : string;//array[1..60] of AnsiChar;

    [BsonElement('npf')]
    namePlatform : string;//array[1..60] of AnsiChar;

    [BsonElement('vcn')]
    VBSClassName : string;//array[1..60] of AnsiChar;

    [BsonElement('ln')]
    LaunchName: string;

    [BsonElement('ti')]
    TrackIdent: string;//array[1..30] of AnsiChar;
    //activation

    [BsonElement('is')]
    InitSpeed: Double;

    [BsonElement('ic')]
    InitCourse: Double;

    [BsonElement('ia')]
    InitAltitude: Double;

    [BsonElement('x')]
    InitX: double;

    [BsonElement('y')]
    initY: double;

    [BsonElement('z')]
    initZ: double;

    [BsonElement('qgp')]
    Quantity_Group_Personal : Integer;

    [BsonElement('gid')]
    GrpID : Integer;              //mk 03052012

    [BsonElement('dmn')]
    Domain : Integer;

    [BsonElement('trn')]
    TurnRate : Double;

    [BsonElement('dr')]
    DiveRate : Double;
  end;

  NetRecCmd_RampController = record
    [BsonElement('sei')]
    SessionID : Integer;

    [BsonElement('pid')]
    PlatformID : Integer;

    [BsonElement('rid')]
    RampID : Byte;

    [BsonElement('rst')]
    RampState : Byte;
  end;

  NetRecCmd_GunFire = record
    [BsonElement('sei')]
    SessionID : Integer;

    [BsonElement('pid')]
    ParentPlatformID  : integer;

    [BsonElement('gid')]
    GunID             : integer;

    [BsonElement('idc')]
    IDPlatformClass   : Integer;

    [BsonElement('tid')]
    TargetPlatformID  : integer;

    [BsonElement('ord')]
    OrderID           : integer;

    [BsonElement('cmd')]
    ControlMode       : integer;

    [BsonElement('svm')]
    SalvoMode         : integer;

    [BsonElement('svz')]
    SalvoSize         : integer;

    [BsonElement('gcr')]
    GunCapacityRemain : Integer;

    [BsonElement('icr')]
	  InterceptRange    : single;

    [BsonElement('trs')]
    ThresSpeed        : single;

    [BsonElement('hpb')]
    HitProbability    : Byte;

    [BsonElement('gnm')]
    GunName           : string;

    [BsonElement('cfx')]
    ChaffX    : single;

    [BsonElement('cfy')]
    ChaffY    : single;

    [BsonElement('cfb')]
    ChaffBloom        : integer;

    [BsonElement('cft')]
    ChaffType         : integer;

    [BsonElement('pcx')]
    pX                : Double;

    [BsonElement('pcy')]
    pY                : Double;

    [BsonElement('pxf')]
    pXflash           : Double;

    [BsonElement('pyf')]
    pYflash           : Double;

    [BsonElement('plt')]
    pAltitude         : Double;

    [BsonElement('dsl')]
    degSpotLine       : Double;

    [BsonElement('dgl')]
    degGunLine        : Double;

    [BsonElement('ncm')]
    NGSCorrMode       : integer;

    [BsonElement('nrc')]
    NGSRangeCorr      : Double;

    [BsonElement('ndc')]
    NGSDefCorr        : Double;

    [BsonElement('nbr')]
    NGSBearing        : Double;

    [BsonElement('nlv')]
    NGSElevation      : Double;

    [BsonElement('vaz')]
    VBSAzimuth        : Double;

    [BsonElement('vlv')]
    VBSElevation      : Double;

    [BsonElement('rid')]
    TurretID          : Integer;
  end;

  NetRecCmd_LaunchMissile = record
    [BsonElement('sei')]
    SessionID                 : Integer;

    [BsonElement('gid')]
    GroupID                   : Integer;

    [BsonElement('pid')]
    ParentPlatformID          : integer;

    [BsonElement('mid')]
    MissileID                 : integer;

    [BsonElement('tid')]
    TargetPlatformID          : integer;

    [BsonElement('pii')]
    ProjectileInstanceIndex   : integer;

    [BsonElement('ord')]
    Order                     : integer;

    [BsonElement('lag')]
    LaunchAngle               : integer;

    [BsonElement('frm')]
    FiringMode                : Byte;

    [BsonElement('lbr')]
    LaunchBearing             : single;

    [BsonElement('srg')]
    SeekerRange               : single;

    [BsonElement('lid')]
    LauncherID                : Byte;

    [BsonElement('ncb')]
    NoCubicle                 : Integer;

    [BsonElement('msn')]
    MissileName               : string;

    [BsonElement('iew')]
    IsEngagementWeapon        : Boolean;
  end;

  NetRec_CameraController = record
    [BsonElement('sei')]
    SessionID                 : Integer;

    [BsonElement('cmd')]
    cmd                       : Byte;

    [BsonElement('vnt')]
    valueInt                  : integer;

    [BsonElement('vdb')]
    valueDbl                  : double;
  end;

  NetRecSync_WaypointDataTo3D = record
    [BsonElement('sei')]
    SessionID                 : Integer;

    [BsonElement('oid')]
    OrderID                   : Byte;

    [BsonElement('pid')]
    PlatformID                : integer;

    [BsonElement('wid')]
    WaypointID                : integer;

    [BsonElement('spd')]
    Speed                     : double;

    [BsonElement('crs')]
    Course                    : double;

    [BsonElement('psx')]
    PosX                      : double;

    [BsonElement('psy')]
    PosY                      : double;

    [BsonElement('alt')]
    Altitude                  : double;

    [BsonElement('dmn')]
    Domain                    : integer;
  end;

  NetRecCmdMultiModeTo3D = record
    [BsonElement('sei')]
    SessionID                 : Integer;

    [BsonElement('cvh')]
    CountVehicle              : Integer;

    [BsonElement('pid')]
    PlatformID                : integer;

    [BsonElement('act')]
    aAction                   : Byte;

    [BsonElement('psx')]
    X                         : String;

    [BsonElement('psy')]
    Y                         : string;

    [BsonElement('prm')]
    Param                     : Double;

    [BsonElement('xtd')]
    X3D                       : Double;

    [BsonElement('ytd')]
    Y3D                       : Double;

    [BsonElement('std')]
    Speed3D                   : String;
  end;

  NetRecCmd_Transport = record
    [BsonElement('sei')]
    SessionID         : Integer;

    [BsonElement('oid')]
    OrderID           : Integer;

    [BsonElement('hid')]
    HostPlatformID    : Integer;

//    [BsonElement('nhp')]
//    NewHostPlatformID    : Integer;

    [BsonElement('mid')]
    MemberPlatformID  : Integer;

    [BsonElement('mpn')]
    MemberPlatformName: string;

    [BsonElement('mtn')]
    MemberPlatform3DName: string;

    [BsonElement('dmn')]
    MemberDomain: integer;

    [BsonElement('bid')]
    BaseIdentifier    : string;

    [BsonElement('tid')]
    TrackID           : string;

    [BsonElement('stp')]
    StateTransport    : Boolean;

    [BsonElement('isp')]
    InitSpeed         : Double;

    [BsonElement('ics')]
    InitCourse        : Double;

    [BsonElement('iat')]
    InitAltitude      : Double;

    [BsonElement('trt')]
    TurnRate         : Double;

    [BsonElement('drt')]
    DiveRate        : Double;

    [BsonElement('rid')]
    RampID      : integer;
  end;

  NetRecCmd_LaunchMine = record
    [BsonElement('sei')]
    SessionID               : Integer;

    [BsonElement('gid')]
    GroupID                 : Integer;

    [BsonElement('ncb')]
    NoCubicle               : Integer;

    [BsonElement('ppi')]
    ParentPlatformID        : Integer;

    [BsonElement('mov')]
    MineOnVehicleID         : Integer;

    [BsonElement('dpt')]
    Depth                   : Double;

    [BsonElement('qty')]
    AvailableQuantity       : Integer;

    [BsonElement('pii')]
    ProjectileInstanceIndex : Integer;

    [BsonElement('rng')]
    Range                   : Double;

    [BsonElement('cnt')]
    Count                   : Integer;

    [BsonElement('nmv')]
	  NameMineVbs             : Integer;
  end;

  NetRecCmd_LaunchBomb = record
    [BsonElement('sei')]
    SessionID               : Integer;

    [BsonElement('gid')]
    GroupID                 : Integer;

    [BsonElement('ncb')]
    NoCubicle               : Integer;

    [BsonElement('ppi')]
    ParentPlatformID        : Integer;

    [BsonElement('tpi')]
    TargetPlatformID        : Integer;

    [BsonElement('bov')]
    BombOnVehicleID         : Integer;

    [BsonElement('ssz')]
    SalvoSize               : Integer;

    [BsonElement('qty')]
    AvailableQuantity       : Integer;

    [BsonElement('pii')]
    ProjectileInstanceIndex : Integer;

    [BsonElement('btp')]
    BombType                : Byte;

    [BsonElement('nbv')]
    NameBombVbs             : Integer;

    [BsonElement('tpx')]
    TargetPosX              : Double;

    [BsonElement('tpy')]
    TargetPosY              : Double;
  end;

   NetRecCmd_State_Logistic = record
    [BsonElement('sei')]
    SessionID       : Integer;

    [BsonElement('pid')]
    PlatfomID       : Integer;

    [BsonElement('did')]
    DestinationID   : Integer;

    [BsonElement('aid')]
    ActionID        : Integer; {0: AsDestStateLogistic; 1:AsSourceStateLogistic}

    [BsonElement('sid')]
    StateID         : Integer; {0: Idle; 1: Standby; 2: Process}

    [BsonElement('hid')]
    HoseID          : Integer; {0: Port; 1:Starboard}
  end;

  NetRecSinc_Envi = record
    [BsonElement('sid')]
    SessionID     : Integer;

    [BsonElement('eid')]
    Sub_EnviID    : Integer;   // membedakan sub area 1 dgn yg lain

    [BsonElement('ety')]
    Envi_Type     : Integer;   // membedakan global area dgn sub area

    [BsonElement('ech')]
    Envi_Chance   : Integer;   // membedakan angin/arus/dll

    [BsonElement('val')]
    Value         : Double;
  end;

  NetRecCmd_GameCtrl = record
    [BsonElement('sid')]
    SessionID : Integer;

    [BsonElement('gct')]
    GameCtrl  : Integer;   // cmd start / stop / game speed

    [BsonElement('gsp')]
    GameSpeed : double;
  end;

  NetRecSessionState = packed record
    [BsonElement('ord')]
    Order         : Byte;

    [BsonElement('stp')]
    SessionType   : Byte;

    [BsonElement('sst')]
    SessionStat   : Byte;

    [BsonElement('scd')]
    ScenarioID    : Integer;

    [BsonElement('sid')]
    SessionID     : Integer;

    [BsonElement('gpt')]
    GPMType       : Byte;
  end;

  NetRecCmd_SonarDeploy = record
    [BsonElement('sid')]
    SessionID     : Integer;

    [BsonElement('pid')]
    PlatformID    : integer;

    [BsonElement('rid')]
    SensorID      : integer;

    [BsonElement('tta')]
    TimeToActive  : Integer;

    [BsonElement('prm')]
    Param         : Byte;

    [BsonElement('acb')]
    ActualCable   : Double;

    [BsonElement('ocb')]
    OrderCable    : Double;
  end;

implementation

end.
