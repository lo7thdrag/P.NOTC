unit uGroupList;

interface

uses
  Classes, uNetMeshSetting;

type

  TIMGGroupList = class
  protected
    FClientList  : TStringList; // not sorted. all

    //index
    FIPnCallsign: TStringList; // Sorted. disini isinya hanya client yg enable.
                                // isiny ip address n callsign in name=value format
    FFileLoaded : Boolean;
    FFileName   : string;
    FMyIPAddress: string;
    FMyInfo     : TNetClientInfo;

    procedure setMyIPAddress(const sIPAdd: string);

    function getMyInfo(const Index: Integer): string;
    procedure setMyInfo(const Index: Integer; const Value: string);

  public
    GroupSetting: TNetGroupSetting;

    constructor Create;
    destructor Destroy; override;

    function GetCallsignFromIP(const ip: string): string;
    function GetIPFromCallsign(const cls: string): string;
    function ChangeClientCallsign(const sNewCall, sIpAddress: string): boolean;

    function IsInActiveMember(const ipAddress: string): Boolean;

    procedure LoadGroupIPlist(const fName: string);
    procedure SaveGroupIPlist(const fName: string);


  public

   //berikut ini harus diset sebelum load from file
   //ipAddress harus tetap ada!
    //    property MyWordID: Word;
    property MyIPAddress: string read FMyIPAddress write setMyIPAddress;


    property MyID: string         index 1 read getMyInfo;
//    property MyIPAddress: string  index 2 read getMyInfo;
    property MyCallsign: string   index 3 read getMyInfo write setMyInfo;
    property MyShipName: string   index 4 read getMyInfo write setMyInfo;

  end;



implementation

uses
  SysUtils,  OverbyteIcsWSocket;

constructor TIMGGroupList.Create;
begin
  FClientList  := TStringList.Create;

  FIPnCallsign := TStringList.Create;
  FIPnCallsign.Sorted := true;

end;

destructor TIMGGroupList.Destroy;
begin
  FIPnCallsign.Free;
  FClientList.Free;
  inherited;
end;

procedure TIMGGroupList.setMyIPAddress(const sIPAdd: string);
var s: string;
begin
  s := Trim(sIPAdd);
  if WSocketIsDottedIP(s) then
    FMyIPAddress := s
  else
    FMyIPAddress := '127.0.0.1';
end;

function TIMGGroupList.GetCallsignFromIP(const ip: string): string;
var i: Integer;
begin
  i := FIPnCallsign.IndexOfName(ip);
  if i < 0 then
    Result := ''
  else
    result := FIPnCallsign.ValueFromIndex[i];
end;

function TIMGGroupList.GetIPFromCallsign(const cls: string): string;
var i: Integer;
    f: Boolean;
begin
  i := 0;
  f := False;
  result := '';

  while (i < FIPnCallsign.Count) and not f  do begin
    f := SameText(cls, FIPnCallsign.ValueFromIndex[i]);
    Inc(i);
  end;

  if f then
    result := FIPnCallsign.Names[i-1];
end;

function TIMGGroupList.ChangeClientCallsign(const sNewCall, sIpAddress: string): boolean;
var i: Integer;
    nc : TNetClientInfo;
begin
  result := False;
  i := FIPnCallsign.IndexOfName(sIpAddress);

  if i < 0 then Exit;
  FIPnCallsign.Values [sIpAddress] := sNewCall;
  result := True;

  if FClientList.Find(sIpAddress, i) then begin
    nc := FClientList.Objects[i] as TNetClientInfo;
    nc.Callsign := sNewCall;
  end;
end;

function TIMGGroupList.IsInActiveMember(const ipAddress: string): Boolean;
begin
  Result := FIPnCallsign.IndexOfName(ipAddress) >= 0;

end;

//------------------------------------------------------------------------------
procedure TIMGGroupList.LoadGroupIPlist(const fName: string);
var i: Integer;
    sClientIP, sClientCalls: string;
    nc : TNetClientInfo;
begin
  if not FileExists(fName ) then
    raise Exception.Create( fName + ' not exist.');

  FMyInfo := nil;

  LoadFF_NetGroupSetting(fName, GroupSetting);

// if not GroupSetting.autodetectip then
// auto detect sudah jalan waktu di frmNetConfig

  if GroupSetting.autodetectip then
    FMyIPAddress := GroupSetting.detectedip
  else
    FMyIPAddress := GroupSetting.manualip;

  LoadImageClientList(fName, FClientList); // load semua.

  FIPnCallsign.Clear;

{ search. what is my ID }
  for i := 0 to FClientList.Count-1  do begin
    sClientIP := FClientList[i];
    nc := FClientList.Objects[i] as TNetClientInfo;

    if SameText(sClientIP, FMyIPAddress) then begin
      // found my self in list
      FMyInfo := nc;
      FMyInfo.Enable := True; // always..
      /// not in ip n callsign. why?

    end
    else begin
      if nc.Enable then begin
        sClientCalls := nc.Callsign;
        if FIPnCallsign.IndexOfName(sClientIP) < 0 then
          FIPnCallsign.Add(sClientIP + '=' + sClientCalls)
        else
          FIPnCallsign.Values[sClientIP] := sClientCalls;
      end;
    end;
  end;

  FFileLoaded := True;
  FFileName := fName;
end;

procedure TIMGGroupList.SaveGroupIPlist(const fName: string);
begin
  if not FileExists(fName)  then Exit;
  SaveFF_NetGroupSetting(fName, GroupSetting);
  SaveImageClientList(fName, FClientList); // save semua.
  // do not save without first load.
  // warning. cannot 'delete' existing node.

end;


function TIMGGroupList.getMyInfo(const Index: Integer): string;
begin
  case Index of
    1: Result := FMyInfo.ImageID;     // MyID
//    2: Result := FMyInfo.IPAddress;   // MyIpAddress
    2: Result := FMyIPAddress;   // MyIpAddress
    3: Result := FMyInfo.Callsign;    // MyCallsign
    4: Result := FMyInfo.ShipName;    // MyShipName
  else
    result := '';
  end

end;

procedure TIMGGroupList.setMyInfo(const Index: Integer;
  const Value: string);
begin
  // di sini cuman set property
  //broadcast notifynya di handle di net handler.
  case Index of
//    1: FMyInfo.ImageID;     // MyID is read only
//    2: FMyInfo.IPAddress;   // MyIpAddress  is read only
    3: FMyInfo.Callsign :=  Value;    // MyCallsign

    4: FMyInfo.ShipName := Value;    // MyShipName
  end

end;

end.
