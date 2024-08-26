unit uGameData_TTT;

interface

uses
  uTCPDatatype;

type

  TAnyRecord = record
    pid     : TPacketID;
    anyDATA : Double;
  end;

  // UDP Game Record ===========================================================
//  CPID_PLATFORM_MOVE = 31;
  TRecPlatformMovement = record
    pid  : TPacketID;
    PlatformID : Integer;
    X, Y, Z  : double;
    Course,
    Speed    : single;
    Accel,
    TurnRate : single;
  end;

//  CPID_LandData = 32;
  TRecPlatfomLandData = record
    pid         : TPacketID;
    PlatformID  : Integer;
    IsOnLand    : boolean;
    dAvail      : boolean;
    dMin, dMax  : single;
    elev        : single;
  end;

  TRecGameTime = record
    pid         : TPacketID;
    ServerTime  : TDateTime;
    GameTime    : TDateTime;
    GameMS      : LongWord;
    GameSpeed   : single;
    GameStart   : TDateTime;
  end;


  //============================================================================
  // TCP Game Record ===========================================================
  TRecCmd_Platform = record
    pid  : TPacketID;
    SessionID : Integer;  //reserved;
    PlatfomID : Integer;
    OrderID   : Byte;
    OrderType : Byte;
    OrderParam: single;
  end;

  TRecCmd_Platform_MOVE = record
    pid  : TPacketID;
    SessionID : Integer;  //reserved;
    PlatfomID : Integer;
    OrderID   : Byte;
    X, Y, Z   : double;
  end;

  TRecCmd_Sensor = record
    pid  : TPacketID;
    SensorType: byte;
    PlatformID: integer;
    SensorID  : integer;
    OrderID   : byte;
    OrderParam: byte;
  end;

//  CPID_CMD_LAUNCH_EMBARK = CPID_TCP + 4;
  TRecCmd_Embark = record
    pid  : TPacketID;
    ParentPlatformID  : integer;   // ID nya launcher
    EmbarkPlaformID   : integer;   // ID platform instance yg baru di launch
    Hosted_Index      : integer;
    Quantity          : Integer;

    LaunchName,
    TrackIdent: string[30];
    //activation
    InitSpeed,
    InitCourse,
    InitAltitude: Double;
  end;

//  CPID_CMD_SYNCH = CPID_TCP + 5;
  TRecCmdSYNCH = record
    pid  : TPacketID;
    SynchID   : byte;
    Synch_IParam: integer;
    Synch_Dparam: double;
  end;

  //CPID_CMD_LAUNCH_MISSILE
  TRecCmd_LaunchMissile = record
    pid  : TPacketID;
    ParentPlatformID  : integer;    // ID nya launcher
    MissileID         : integer;          // ID missile yg baru di launch TWeaponOnBoard
    TargetPlatformID  : integer;
    Order             : integer;

  end;

  TRecCmd_GunFire = record
    pid  : TPacketID;
    ParentPlatformID  : integer;    // ID nya launcher
    GunID             : integer;
    TargetPlatformID  : integer;
    OrderID           : integer;     // fire ceas
    ControlMode       : integer;
    SalvoMode         : integer;
    SalvoSize         : integer;

  end;

{  TRecCmd_ClientUpdate = record
    pid  : TPacketID;
    ParentPlatformID  : integer;    // ID nya launcher
    UpdateType        : integer;
      VehicleID         : integer;
      GunID             : integer;  // gun
  end;
 }
const

//  CPID 30 .. 49 buat GAME UDP;

//  CPID 50 .. 79 buat GAME TCP
  CPID_UDP = 30;
  CPID_TCP = 50;
  //----------------------------------------------------------------------------

  CPID_PLATFORM_MOVE        = CPID_UDP + 1;
  CPID_PLATFORM_LANDDATA    = CPID_UDP + 2;
  CPID_GAMETIME             = CPID_UDP + 3;

  CPID_CLIENT_UPDATE             = CPID_UDP + 4;


  //============================================================================
  //----------------------------------------------------------------------------
  CPID_CMD_PLATFORM = CPID_TCP + 1;
    CORD_ID_MOVE  = 1;
      CORD_TYPE_SPEED     = 1;
      CORD_TYPE_COURSE    = 2;
      CORD_TYPE_ALTITUDE  = 3;

  //----------------------------------------------------------------------------
    CORD_ID_ACTIVATION  = 2;
      //   OrderType =   Init_Guidance;

  //----------------------------------------------------------------------------
  CPID_CMD_PLATFORM_REPOS = CPID_TCP + 2;
    CORD_ID_REPOS  = 1;

  //----------------------------------------------------------------------------
  CPID_CMD_SENSOR = CPID_TCP + 3;
    CSENSOR_TYPE_RADAR = 1;
    CSENSOR_TYPE_SONAR = 2;
    CSENSOR_TYPE_ESM   = 3;

//    CORD_ID_ = 1;
    CORD_ID_OperationalStatus = 1;
    CORD_ID_ControlMode       = 2;

  CPID_CMD_LAUNCH_EMBARK  = CPID_TCP + 4;

  CPID_CMD_SYNCH          = CPID_TCP + 5;
    CORD_ID_Synch_NextPID = 1;

  CPID_CMD_LAUNCH_MISSILE  = CPID_TCP + 6;
    // Order
  CPID_CMD_GUN_FIRE  = CPID_TCP + 7;
    CORD_ID_assign = 1;
    CORD_ID_break  = 2;
    CORD_ID_fire   = 3;
    CORD_ID_cease  = 4;
  //----------------------------------------------------------------------------
  CPID_CMD_UPDATE_FROM_CLIENT  = CPID_TCP + 8;

implementation



end.
