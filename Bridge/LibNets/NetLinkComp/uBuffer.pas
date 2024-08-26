unit uBuffer;

interface

uses
  System.Classes,
  System.SysUtils,

  uDataType,
  uDataManager,
  uThreadSafeQueue,
  UHelper;

type
  TDataQueue = class
  private
    //pLocBuff: PAnsiChar;
    FQueue: TThreadSafeQueue;
    FRegProcs: TPacketManager;
    FLogRecv: TGetStrProc;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;

    // procedure PutPacket(aP: PAnsiChar; const aSize: integer;
    // const ipSender: string);
    //
    procedure PutPacket(aData: TBytes);

    procedure PacketRecognizer(aData: TBytes);

    // function GetPacket(): Boolean;
    function GetPacket: Boolean;

    property RegProcs: TPacketManager read FRegProcs write FRegProcs;
    property LogRecv: TGetStrProc read FLogRecv write FLogRecv;
  end;

implementation

uses
// Windows;
  DateUtils;

{ TDataQueue }

constructor TDataQueue.Create;
begin
  FQueue := TThreadSafeQueue.Create;
end;

destructor TDataQueue.Destroy;
begin
  FQueue.DisposeOf;
  inherited;
end;

procedure TDataQueue.Clear;
begin
  FQueue.Clear
end;

function TDataQueue.GetPacket: Boolean;
var
  Data: TBytes;
begin
  Result:= False;
  if FQueue.IsEmpty then
    Exit;

//  if Assigned(FLogRecv) then
//    FLogRecv(TimeToString + ' : Queue Size Before = ' + IntToStr(FQueue.Count));

  Data:= FQueue.Dequeue;
  if Data<>nil then
  begin
//    if Assigned(FLogRecv) then
//      FLogRecv(TimeToString + ' : Queue Size After = ' + IntToStr(FQueue.Count));
  PacketRecognizer(Data);
    Result:= True;
  end;
end;

procedure TDataQueue.PacketRecognizer(AData: TBytes);
var
  Header: TPacketHeader;
  Content: string;
begin
  TComposer.DecomposePacket(AData, Header, Content);
  var
    dtutc: TDateTime:= TTimeZone.Local.ToUniversalTime(Now);
  Header.ReceiveTime:= DateTimeToUnixMs(dtutc, False);
  if FRegProcs.IsHandled(Header.PacketID) then
  begin
    if Assigned(FLogRecv) then begin
//      FLogRecv(TimeToString + ' : Data ' + FRegProcs[Header.PacketID].recName);
    end;
    FRegProcs[Header.PacketID].theProc(Header, Content);
  end
  else
  begin
    if Assigned(FLogRecv) then
      FLogRecv(TimeToString + ' : ' + 'UnRegistered ID ' + IntToStr(Header.PacketID));
  end;
end;

procedure TDataQueue.PutPacket(aData: TBytes);
begin
  if Length(AData)<=0 then
    Exit;

  if Assigned(FLogRecv) then
//      FLogRecv(TimeToString + ' : Queue Size Before = ' + IntToStr(FQueue.Count));

  FQueue.Enqueue(aData);

  if FQueue.Count > 0 then
  begin
    if Assigned(FLogRecv) then
//      FLogRecv(TimeToString + ' : Queue Size After = ' + IntToStr(FQueue.Count));
  end;

end;

end.
