unit uNetMeshSetting;
{ ATNP and IMAGE use this unit.
}


interface
uses
  Classes;

type

  TNetCommSetting = record
    TCPport : word;   // tcp port
    COMNum : Integer;
    COMBaud: Integer;
  end;

  TNetGroupSetting = record
    autodetectip:  Boolean;
//    myipaddress : string;
    detectedip : string;
    manualip   : string;
  end;

  TNetClientInfo = class
  public
    ImageID  : string;
    NodeID   : Word;
    IPAddress: string;
    Callsign : string;
    ShipName : string;
    Enable   : boolean;
    constructor Create;
  end;

  function GetDefaultIMAGE_ID(const ip: string): string;

  procedure ClearImageClientSetting(sl: TStringList);

  procedure LoadImageClientList(const fName: string;
     lstInfo: TStringList);

  procedure SaveImageClientList(const fName: string;
     lstInfo: TStringList);

  procedure LoadFF_NetCommSetting(const fName: string; var nCommSet: TNetCommSetting);
  procedure SaveFF_NetCommSetting(const fName: string; const nCommSet: TNetCommSetting);

  procedure LoadFF_NetGroupSetting(const fName: string; var nGrpSet: TNetGroupSetting);
  procedure SaveFF_NetGroupSetting(const fName: string; const nGrpSet: TNetGroupSetting);

var
   ncInfo: TNetClientInfo;

   VNetCommSetting: TNetCommSetting;

   VDefImageID: string;
   VDefImagePORT: integer;


implementation

uses
  IniFiles, uIniFilesProcs,  OverbyteIcsWSocket, StrUtils, sysUtils,
   uNetComUtils;

const
   CIMG_DefComPort = 1; // com1
   CIMG_DefCombps  = 8; //19200 bps

   c_netcomm = 'netcomm';
   c_netgroup = 'netgroup';

  CIMG_ID    = 'id';
  CIMG_Call  = 'callsign';
  CIMG_SHIPN = 'shipname';
  CIMG_ENABL = 'enable';
//  CIMG_NodeID= 'nodeid';

//==============================================================================
constructor TNetClientInfo.Create;
begin
//  ImageID  := 'IMAGE';
  ImageID  := VDefImageID;

  IPAddress:= '127.0.0.1';
  Callsign := 'CALLSIGN';
  ShipName := 'SHIP';
  Enable   := false;
end;

//==============================================================================
function GetDefaultIMAGE_ID(const ip: string): string;
var s, r: string;
    i: integer;
begin
  r := ReverseString(ip);
  i := Pos('.', r);
  if i > 0 then

  s := ReverseString(Copy(r, 1, i-1));
//  Result := 'IMAGE_'+ s;
  Result := VDefImageID + s;
end;


//------------------------------------------------------------------------------
procedure ClearImageClientSetting(sl: TStringList);
var
  i: integer;
  o: TObject;
begin
  for i := sl.Count - 1 downto 0 do begin
    o := sl.Objects[i];
    sl.Delete(i);
    o.Free;
  end;
//  sl.Clear;
end;

//------------------------------------------------------------------------------
procedure LoadImageClientList(const fName: string;
   lstInfo: TStringList);
var ini: TIniFile;
    i : Integer;
    ss: TStrings;
    sClientIP : string;
begin
  ClearImageClientSetting(lstInfo);

  ini := TIniFile.Create(fName);

  ss := TStringList.Create;
  ini.ReadSections(ss);

  for i := 0 to ss.Count-1  do begin
    sClientIP := ss.Strings[i];

    if not WSocketIsDottedIP(sClientIP) then
      Continue;
    // Add clients.

    ncInfo := TNetClientInfo.Create;
    with ncInfo do begin
      ImageID   := INIFReadString(ini, sClientIP, CIMG_ID,
        GetDefaultIMAGE_ID(sClientIP));

      NodeID  :=  WordID_from_IPAddress(sClientIP);

      IPAddress := sClientIP;
      Callsign  := INIFReadString(ini, sClientIP, CIMG_CALL,  ImageID);
      ShipName  := INIFReadString(ini, sClientIP, CIMG_SHIPN, ImageID);
      Enable    := INIFReadBool(ini, sClientIP, CIMG_ENABL, False);
    end;

    lstInfo.AddObject(sClientIP, ncInfo);
  end;

  ss.Free;
  ini.Free;
end;

procedure SaveImageClientList(const fName: string;
     lstInfo: TStringList);
var ini: TIniFile;
    i : Integer;
    sClientIP : string;
    nc : TNetClientInfo;
begin
  // do not save without first load.
  ini := TIniFile.Create(fName);

  for i := 0 to lstInfo.Count-1  do begin
    sClientIP := lstInfo[i];
    nc := lstInfo.Objects[i] as TNetClientInfo;

    ini.WriteString(sClientIP,  CIMG_ID,    nc.ImageID);
    ini.WriteString(sClientIP,  CIMG_CALL,  nc.Callsign  );
    ini.WriteString(sClientIP,  CIMG_SHIPN, nc.ShipName );
    ini.WriteBool(sClientIP,    CIMG_ENABL, nc.Enable   );

  end;


  ini.Free;

end;

//==============================================================================
{ TComPortBaudRate =(
0   br110,         7   br14400,
1   br300,         8   br19200,
2   br600,         9   br38400,
3   br1200,        10  br56000,
4   br2400,        11  br57600,
5   br4800,        12  br115200
6   br9600,

  // COM Port Numbers
  TComPortNumber = (pnCOM1, pnCOM2, pnCOM3, pnCOM4, pnCOM5, pnCOM6, pnCOM7,
    pnCOM8, pnCOM9, pnCOM10, pnCOM11, pnCOM12, pnCOM13,
    pnCOM14, pnCOM15, pnCOM16);
}

procedure LoadFF_NetCommSetting(const fName: string; var nCommSet: TNetCommSetting);
var IniF: TIniFile;
begin
  IniF := TIniFile.Create(fName);

  with nCommSet do begin
    // 1 --> COM 1
    COMNum  := INIFReadInteger(inif, c_netcomm, 'comnum', 1);
    // 8   br19200,
    COMBaud := INIFReadInteger(inif,c_netcomm,  'combaud', 8);
    TCPport := iniFReadInteger(inif,c_netcomm,  'tcpport', VDefImagePORT);
  end;

  Inif.Free;
end;

procedure SaveFF_NetCommSetting(const fName: string; const nCommSet: TNetCommSetting);
var
  IniF: TIniFile;
begin
  IniF := TIniFile.Create(fName);

  with nCommSet do begin
    IniF.WriteInteger(c_netcomm, 'comnum', COMNum);
    IniF.WriteInteger(c_netcomm, 'combaud', COMBaud);
    IniF.WriteInteger(c_netcomm, 'tcpport', TCPport);
  end;

  Inif.Free;
end;


procedure LoadFF_NetGroupSetting(const fName: string; var nGrpSet: TNetGroupSetting);
var IniF: TIniFile;
begin
  IniF := TIniFile.Create(fName);

  with nGrpSet do begin
    // 1 --> COM 1
    autodetectip := INIFReadBool(inif, c_netgroup, 'autodetect', false);
//    myipaddress  := IniFReadstring(inif, c_netgroup, 'myip', '127.0.0.1');
    detectedip  := IniFReadstring(inif, c_netgroup, 'detectedip', '192.168.1.12');
    manualip    := IniFReadstring(inif, c_netgroup, 'manualip', '192.168.1.12');

  end;

  Inif.Free;
end;

procedure SaveFF_NetGroupSetting(const fName: string; const nGrpSet: TNetGroupSetting);
var IniF: TIniFile;
begin
  IniF := TIniFile.Create(fName);

  with nGrpSet do begin
     IniF.WriteBool(c_netgroup, 'autodetect', autodetectip);
//     IniF.WriteString(c_netgroup, 'myip', myipaddress);
     IniF.WriteString(c_netgroup, 'detectedip', detectedip);
     IniF.WriteString(c_netgroup, 'manualip', manualip);

  end;

  Inif.Free;
end;


initialization

  VDefImageID := 'ATNP';
  VDefImagePort := 4010;

end.
