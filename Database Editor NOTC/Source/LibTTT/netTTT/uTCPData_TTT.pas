unit uTCPData_TTT;

interface

uses
  uTCPDatatype;

type

  TAnyRecord = record
    pid     : TPacketID;
    anyDATA : Double;
  end;

  TRecPlatformMovement = record
    pid  : TPacketID;
    PlatformID : Integer;
    X, Y, Z  : double;
    Course,
    Speed    : single;
    Accel,
    TurnRate : single;
  end;


const


  CPID_PLATFORM_MOVE = 10;

implementation



end.
