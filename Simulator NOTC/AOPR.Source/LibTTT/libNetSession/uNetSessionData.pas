unit uNetSessionData;

interface

uses
  Classes, uNetBaseSocket, uGamePlayType, uTCPDataType;

type
//------------------------------------------------------------------------------
  TSessionType    = ( ssOff, ssEditing, ssPlaying );
//----------------------------------------------------------------------------

  TGamePlayMode   = record
    GameType      : TGamePlayType ;
    RecFileName   : string[20];
  end;

  TSessionVar =  record
    SessionType   : TSessionType;
    StateActive   : Boolean;
    ScenarioID    : Integer;
    ExerciseName  : string;
    SnapshotName  : string[20];
    GamePlayMode  : TGamePlayMode;
  end;

//------------------------------------------------------------------------------
  TNotifySessionState = procedure (const ssState: TSessionVar) of object;

//------------------------------------------------------------------------------

  TRecHostName = packed record   // packet of TSessionVar
    pid           : TPacketID;
    SessionID     : LongWord;
    HostName      : string[32];
  end;

//------------------------------------------------------------------------------
// request di kirim dari GC ke session server.
  //  CPID_REQ     = 10;
  TRecRequest = packed record
    pid           : TPacketID;
    RequestID     : Byte;
    RequestParam  : Byte;
  end;

  //  CPID_Notify   = 11;
  TRecNotify = packed record
    pid           : TPacketID;
    NotifyID     : Byte;
    NotifyParam  : Integer;
  end;

  //  CPID_SESSIONSTATE = 12;
  // record dari Instruktur
  TRecSessionState = packed record   // packet of TSessionVar
    pid           : TPacketID;
    Order         : Byte;    // info or update
    SessionType   : Byte;
    SessionStat   : Byte;
    ScenarioID    : Integer;
    SessionID     : Integer; // reserverd for multisession
    ExerciseName  : string[60];
    SnapshotName  : string[20];  // snapshot
    GPMType       : Byte;
    GPMFName      : string[20];
  end;

  //  CPID_SESSIONJOIN = 13;
  // record dari siswa
  TRecSessionJoin = packed record   // packet of TSessionVar
    pid           : TPacketID;
    Order         : Byte;    // connect or disconnect
    SessionType   : Byte;
    SessionID     : Integer; // reserverd for multisession
    HostName      : string[32];
  end;


//  CPID_SESSIONONLINELIST = 14;
  TRecNodeOnlineList = packed record
    pid       : TPacketID;
    NodeOrder : Word;  // info / update
    LongIP    : array [0..254] of LongWord;
//    B3        : byte;
//    B2        : byte;
//    B1        : byte;
//    B0        : array [0..7] of LongWord;
  end;

// CPID_CUBICLEASSIGN = 15;
  TRecCubAssign = packed record
    pid       : TPacketID;
    cmdID     : Byte;
    GroupID   : Integer;
    LongIP    : LongWord;
  end;

// CPID_SYNCH_TIME = 16;
  TRecServerTime = packed record
    pid         : TPacketID;
    ServerTime  : TDateTime;
    Flag        : Word;
  end;


  TAssignGroup = class
  private
    FCap: Integer;
  public
    AssList: array of Integer;
    Count: Integer;

    constructor Create;
    destructor Destroy; override;

    procedure Add(const i: integer);
    procedure Clear;
  end;

//==============================================================================
//  CPID_DBE_TBL_UPDATE   = 20;
  TRecDBE_Tbl_Update = packed record
    pid           : TPacketID;
    Order         : Byte;  // info / update
    TabelName     : string[64];
    PrimaryKey    : integer;
    SecondKey     : integer;
  end;

const

// == Constant of Packet ID ====================================================
//------------------------------------------------------------------------------
//  CPID 10 .. 19 buat SESSION
//  CPID 20 .. 29 buat DBEDITOR;
//  CPID 30 .. 49 buat GAME UDP;
//  CPID 50 .. 79 buat GAME TCP


//------------------------------------------------------------------------------
  CPID_HOSTNAME_INFO = 5;

// REQUEST
//------------------------------------------------------------------------------
  CPID_REQ          = 10;
    //RequestID
    CREQID_DBEDIT_SESSION     = 1;
    CREQID_GAME_SESSION       = 2;
    CREQID_ONLINE_LIST        = 3;

    CREQID_SYNCH_TIME         = 4;
    CREQID_MAPSYNCH           = 5;
    CREQID_ALL_CUB_ASSIGN     = 6;

//------------------------------------------------------------------------------
  CPID_NOTIFY       = 11;
    CNOT_MAPSYNCH   = 1;

//------------------------------------------------------------------------------
  CPID_SESSIONSTATE = 12;
   // OrderID
    CID_INFO        = 0;  //server send info
    CID_CREATE      = 1;
    CID_DESTROY     = 2;
    CID_CONNECT     = 3; //client connect to a game /
//    CID_DISCONNECT  = 4; //client connect to a game /

//  CPID_SESSIONJOIN = 13;

//------------------------------------------------------------------------------
  CPID_SESSIONONLINELIST = 14;

  CPID_CUBICLEASSIGN = 15;
    CMD_ASSIGN_CLEAR = 0;
    CMD_ASSIGN_ADD   = 1;
    CMD_ASSIGN_END   = 2;

    CMD_ASSIGN_INFO_START    = 4;
    CMD_ASSIGN_INFO_DATA     = 5;
    CMD_ASSIGN_INFO_END      = 6;

    // track number
    CMD_ASSIGN_TRACK_NMBR    = 7;

  CPID_SYNCH_TIME = 16;
//  CPID_SCENARIO     = 12;

//== DBEditor ==================================================================
  CPID_DBE_TBL_UPDATE   = 20;


  procedure RecToOnlineList(const r : TRecNodeOnlineList; var ss: TStrings);
  function OnlineListToRec(const ss: TStrings): TRecNodeOnlineList;

var
  j : integer;

implementation

uses
  SysUtils, Windows;

//function OnlineListToRec(const ss: TStrings): TRecNodeOnlineList;
//var i : integer;
//    ipByte, aIx, bIx : byte;
//    longIP, msk : LongWord;
//    rIp : TRecIP;
//    IPString, IPString1 : string;
//begin
//  //j := 1;
//  result.B3 := 192; //default
//  result.B2 := 168;
//  result.B1 := 1;
//
//  if ss.Count > 0 then begin
//    longIP := StrIp_To_LongIp(ss[0]);
//    rIp.longIP := longIP;
//    result.B3 := rIp.b3;
//    result.B2 := rIp.b2;
//    result.B1 := rIp.b1;
//  end;
//
//  if j = 2 then
//  begin
//    Result.B1 := 2;
//  end;
//
//  FillChar (result.B0, 32, 0);
//
//  for i := 0 to ss.Count - 1 do begin
//    longIP := StrIp_To_LongIp(ss[i]);
//    rIp.longIP := longIP;
//    if longIP = 0 then
//      Continue;
//
//    IPString := IntToStr(result.B3) +  '.' + IntToStr(result.B2) +'.' + IntToStr(result.B1) + '.' + IntToStr(rIp.b0);
//    IPString1 := IntToStr(rIp.B3) +  '.' + IntToStr(rIp.B2) +'.' + IntToStr(rIp.B1) + '.' + IntToStr(rIp.B0);
//    if IPString <> IPString1 then
//      Continue;
//
//    ipByte := (longIP shr 24) and $ff;
//
//    aIX := ipByte div 32; // array index
//    bIX := ipByte mod 32;
//
//    msk := 1 shl bIX;
//    Result.B0[aIX]  := Result.B0[aIX] or msk;
//  end;
//
//  if j <> 2 then
//    j := 2
//  else
//    j := 1;
//
//end;
//
//procedure RecToOnlineList(const r : TRecNodeOnlineList; var ss: TStrings);
//var
//    i, j : integer;
//    sPrefix: string;
//    ipByte : byte;
//    msk,longIP : LongWord;
//begin
//  sPrefix :=  IntToStr(r.B3) + '.' + IntToStr(r.B2) + '.' + IntToStr(r.B1) + '.';
//  if Not Assigned(ss) then
//    ss := TStringList.Create;
//
//  for j := 0 to 7 do begin
//    for i := 0 to 31 do begin
//       msk := 1 shl i;
//       longIP := r.B0[j] and msk;
//       if msk = longIP then begin
//         ipByte := j * 32 + i;
//         ss.Add(sPrefix + IntToStr(ipByte));
//       end;
//    end;
//  end;
//end;

function OnlineListToRec(const ss: TStrings): TRecNodeOnlineList;
var i : integer;
    ipByte, aIx, bIx : byte;
    longIP, msk : LongWord;
    rIp : TRecIP;
    rec : TRecNodeOnlineList;
    IPString, IPString1 : string;
begin
  if(ss.Count > 0) then
  begin
    ZeroMemory(@rec.LongIP[0], SizeOf(rec.LongIP));
    for i := 0 to ss.Count - 1 do begin
      longIP := StrIp_To_LongIp(ss[i]);
      rec.LongIP[i] := longIP;
    end;

    CopyMemory(@result, @rec, SizeOf(TRecNodeOnlineList));
  end;
end;

procedure RecToOnlineList(const r : TRecNodeOnlineList; var ss: TStrings);
var
    i : integer;
    sPrefix: string;
begin
  for i := Low(r.LongIP) to High(r.LongIP) do
  begin
    if Not Assigned(ss) then
      ss := TStringList.Create;

      if(r.LongIP[i] <> 0 ) then
      begin
        sPrefix := LongIp_To_StrIp(r.LongIP[i]);
        ss.Add(sPrefix);
      end
      else
        break;
  end;
end;

procedure TAssignGroup.Add(const i: integer);
begin
  AssList[Count] := i;
  Inc(Count);
  if Count >= FCap then
    FCap := FCap + 8;

  SetLength(AssList, FCap);
end;

procedure TAssignGroup.Clear;
begin
  FCap  := 8;
  Count := 0;
  SetLength(AssList, FCap);
end;

constructor TAssignGroup.Create;
begin
  FCap  := 8;
  Count := 0;
  SetLength(AssList, FCap);
end;

destructor TAssignGroup.Destroy;
begin
  SetLength(AssList, 0);
  inherited;
end;

end.
