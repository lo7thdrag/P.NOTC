unit uConverters;

interface

uses
  System.SysUtils, uTCPDatatype;

const
  // Legacy ID
  CPID_CMD_SYNCH = 55;
  CPID_SYNCH_POS_3D = 155;

  CPID_TCP_REQUEST = 60;
      REQ_DATA_PLATFORM = 7;

  CPID_REC_AOTC_DATA = 152;
      CORD_ID_START_SEND_DATA = 1;
      CORD_ID_REQ_NEXT_DATA = 2;
      CORD_ID_END_SEND_DATA = 3;

  CPID_GAME_TIME = 156;

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
    PosX : Double;
    PosY : Double;
    PosZ : Double;
    FreeMe : Byte;
    PlatformDomain : Byte;
    OveralDamage : Integer;
    HealthPercent : Single;
    ForceDesignation : Byte;
  end;


implementation

end.
