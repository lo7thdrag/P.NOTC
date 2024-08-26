unit uLibSettingTTT;


interface

uses
  Graphics;

const
  // aplication.ini setting
  c_net = 'network';
//    c_NET_PORT  = 32000;
    c_NET_SESSIONPORT = 32001;
    c_NET_DBEDITPORT  = 32002;
    c_NET_GAMEPORT    = 32003;
    c_NET_COMMANDPORT = 32004;

  c_NET_BC_ADDRESS = '192.168.1.255';

  c_NET_SVRIP = '192.168.1.11';

  c_map = 'map';
    C_MaxZoomIndex = 12;
    C_MinZoomIndex = 0;

 c_dBase = 'database';
  c_defaultDBUser      = 'sa';
  c_defaultDBpassword  = 'sa';
  c_defaultDBProto     = 'mssql';

 c_symbol = 'symbol';


type
  //------------------------------------------------------------------------------
  // load from main setting file.
  //------------------------------------------------------------------------------
  TNetSetting = record
//    BasePort      : Word;  //
    SessionPort   : Word;  // sessionPort
    DBEditPort    : Word;  // sessionPort
    CommandPort   : Word;   //TCP
    GamePort      : Word;   //UDP
    GameAddress   : string;
    AutoStart     : Boolean;
  end;

  TNetServerSetting = record
    SendInterval: Integer;
  end;

  TNetClientSetting = record
    ServerIP: string;
  end;

  //------------------------------------------------------------------------------
  TMapSetting = record
    MapPath,
    MapGeoset: string;
    MapDataGeoset: string;

    MapZoom: integer;
    mX, mY: double;
    Colorbg : TColor;
    FullScreen: boolean;
  end;

  //----------------------------------------------------------------------------
  TGameDataSetting = record
    DataPath: string;
    ScenarioID : Integer;
    OwnShipPlatfomID: Integer;
    GroupSetting: string;
  end;
  //----------------------------------------------------------------------------

  TDBaseSetting  = record
    dbServer,
    dbProto,
    dbName,
    dbUser,
    dbPass,
    dbGameDefault: string;
  end;

  TSymbolSetting = record
    ImgPath: string;
    DefaultSymbol: string;
  end;

  TApplicationSetting = record
    GameServerName  : string;
    GameClientName  : string;
    DBEditorName    : string;
  end;

  TCubicleAssignSetting = record
    GroupIDs : array of Integer;
  end;



  function getFileSetting: string;

  function LoadFF_NetSetting(const fName: string; var nSet: TNetSetting): boolean;
  function LoadFF_NetServerSetting(const fName: string; var nSet: TNetServerSetting): boolean;
  function LoadFF_NetClientSetting(const fName: string; var nSet: TNetClientSetting): boolean;
  //------------------------------------------------------------------------------

  function LoadFF_MapSetting(const fName: string; var mSet: TMapSetting): boolean;

  //------------------------------------------------------------------------------
  function LoadFF_GameSetting(const fName: string; var gdSet: TGameDataSetting): boolean;
  procedure SaveFF_GameSetting(const fName: string; var gdSet: TGameDataSetting);


  function LoadFF_dBaseSetting(const fName: string; var dbSet: TDBaseSetting): boolean;
  procedure SaveFF_dBaseSetting(const fName: string; var dbSet: TDBaseSetting);

  function LoadFF_SymbolSetting(const fName: string; var imgSet: TSymbolSetting): boolean;

  function LoadFF_AppSetting(const fName: string; var appSett: TApplicationSetting): boolean;

  procedure LoadFF_CubicalAssignSetting(const fName: string; var caSett: TCubicleAssignSetting);
  procedure SaveFF_CubicalAssignSetting(const fName: string; var caSett: TCubicleAssignSetting);


var
  {global var}
  //loaded setting  FROM FILE

  vSettingFile: string;

  vNetSetting         : TNetSetting;
    vNetServerSetting : TNetServerSetting;
    vNetClientSetting : TNetClientSetting;

  vMapSetting         : TMapSetting;
  vGameDataSetting    : TGameDataSetting;
  vDBSetting          : TDBaseSetting;
  vSymbolSetting      : TSymbolSetting;

  vAppSetting         : TApplicationSetting;

  vCubicalAssignSetting : TCubicleAssignSetting;


implementation

uses
  Classes, IniFiles, SysUtils, uIniFilesProcs, uCodecBase64;

const
   c_gdata = 'gamedata';

//==============================================================================
function getFileSetting: string;
begin
//  result := ChangeFileExt(ParamStr(0), '.ini');
  result := ExtractFilePath(ParamStr(0)) + 'setting.ini';
end;
//==============================================================================

function LoadFF_NetSetting(const fName: string; var nSet: TNetSetting): boolean;
var
  IniF: TIniFile;
  s: string;
begin
  s := ExtractFilePath(ParamStr(0));
  IniF := TIniFile.Create(fName);
  try
  with nSet do begin
//    BasePort  := Abs(INIFReadInteger(inif, c_net, 'baseport',  c_NET_PORT));
    SessionPort  := Abs(INIFReadInteger(inif, c_net, 'sessionport',  c_NET_SESSIONPORT));
    DBEditPort   := Abs(INIFReadInteger(inif, c_net, 'dbeditport',   c_NET_DBEDITPORT));
    CommandPort  := Abs(INIFReadInteger(inif, c_net, 'commandport',     c_NET_COMMANDPORT));
    GamePort     := Abs(INIFReadInteger(inif, c_net, 'gameport',     c_NET_GAMEPORT));
    GameAddress  := INIFReadString(inif, c_net, 'gameaddress',  c_NET_BC_ADDRESS);


    AutoStart :=  INIFReadBool(inif, c_net, 'autostart', true);
  end;
  finally
  Inif.Free;
  end;
  result := true;
end;

function LoadFF_NetServerSetting(const fName: string; var nSet: TNetServerSetting): boolean;
var
  IniF: TIniFile;
  s: string;
begin
  s := ExtractFilePath(ParamStr(0));
  IniF := TIniFile.Create(fName);
  try
  with nSet do begin
    SendInterval :=  Abs(INIFReadInteger(inif, c_net, 'sendinterval', 4));
  end;
  finally
  Inif.Free;
  end;
  result := true;
end;

function LoadFF_NetClientSetting(const fName: string; var nSet: TNetClientSetting): boolean;
var
  IniF: TIniFile;
  s: string;
begin
  s := ExtractFilePath(ParamStr(0));
  IniF := TIniFile.Create(fName);
  try
  with nSet do begin
    ServerIP  := INIFReadString(inif, c_net, 'serverip',  c_NET_SVRIP);
  end;
  finally
  Inif.Free;
  end;
  result := true;
end;

//==============================================================================

function LoadFF_MapSetting(const fName: string; var mSet: TMapSetting): boolean;
var IniF: TIniFile;
    s: string;
begin
  Result := True;
  IniF := TIniFile.Create(fName);
  try
  s := ExtractFilePath(ParamStr(0));
  with mSet do begin
    MapPath := IncludeTrailingBackslash(
      IniFReadstring(inif, c_map, 'mappath', 'M:\maps'));
//      s + IniFReadstring(inif, c_map, 'mappath', 'mapsea'));

    MapGeoset     := IniFReadstring(inif, c_map, 'defmap', 'Indonesia2.gst');

    MapDataGeoset  := IniFReadstring(inif, c_map, 'mapdata',
      'M:\maps\mapdata\mapdata.gst');

    MapZoom := INIFReadInteger(inif, c_map, 'zoom', 5);
    if MapZoom > C_MaxZoomIndex then MapZoom := C_MaxZoomIndex;
    if MapZoom < C_MinZoomIndex then MapZoom := C_MinZoomIndex;

    mX := INIFReadFloat(IniF, c_map, 'long', 112.75 );
    mY := INIFReadFloat(IniF, c_map, 'latt', -7.2 );

    FullScreen := INIFReadBool(inif, c_map, 'fullscreen', false );
  end;
  finally
    IniF.DisposeOf
  end;
end;

function LoadFF_GameSetting(const fName: string; var gdSet: TGameDataSetting): boolean;
var IniF: TIniFile;
    s: string;
begin
  Result := True;
  IniF := TIniFile.Create(fName);
  try
  s := ExtractFilePath(ParamStr(0));
  with gdSet do begin
    DataPath    := IncludeTrailingBackslash(
      s + IniFReadstring(inif, c_gdata, 'datapath', '.\data\'));
    GroupSetting := DataPath + IniFReadstring(inif, c_gdata, 'groups' , 'cubicles.xml');

    ScenarioID      := INIFReadInteger(IniF, c_gdata, 'scenarioid', 452);
    OwnShipPlatfomID:= INIFReadInteger(IniF, c_gdata, 'ownshipid', 7942);
  end;
  finally
    IniF.Free
  end;
end;

procedure SaveFF_GameSetting(const fName: string; var gdSet: TGameDataSetting);
var  iniF: TIniFile;
begin
  IniF := TIniFile.Create(fName);
  try
  with iniF, gdSet do begin

    WriteInteger(c_gdata, 'ownshipid',     OwnShipPlatfomID); //untuk client.
    WriteInteger (c_gdata,  'scenarioid',  ScenarioID);

  end;
  finally
    iniF.Free
  end;

end;


function LoadFF_dBaseSetting(const fName: string; var dbSet: TDBaseSetting): boolean;
var IniF: TIniFile;
    s: string;
    readIn, readOut : string;
begin
  Result := True;
  IniF := TIniFile.Create(fName);
  try
  s := ExtractFilePath(ParamStr(0));

  with dbSet do begin
    dbServer :=  IniFReadstring(inif, c_dBase, 'dbserver', '192.168.1.15');
    dbProto  :=  IniFReadstring(inif, c_dBase, 'dbproto', c_defaultDBProto );
    dbName   :=  IniFReadstring(inif, c_dBase, 'dbname',  'runtime_db');

    readIn    := Base64Encode(c_defaultDBUser);
    readOut   := IniFReadstring(inif, c_dBase, 'dbuser', readIn);
    dbUser    := Base64Decode(readOut);

    readIn    := Base64Encode(c_defaultDBPassword);
    readOut   := IniFReadstring(inif, c_dBase, 'dbpass', readIn);
    dbPass    := Base64Decode(readOut);

    dbGameDefault := IniFReadstring(inif, c_dBase, 'dbgamedefault',  IntToStr(41));
  end;
  finally
    IniF.Free
  end;
end;

procedure SaveFF_dBaseSetting(const fName: string; var dbSet: TDBaseSetting);
var  iniF: TIniFile;
begin
  IniF := TIniFile.Create(fName);
  try
  with iniF, dbSet do begin
    WriteString(c_dBase, 'dbserver', dbServer);
    WriteString(c_dBase, 'dbproto',  dbProto );
    WriteString(c_dBase, 'dbname',   dbName);
    WriteString(c_dBase, 'dbuser',   Base64Encode(dbUser));
    WriteString(c_dBase, 'dbpass',   Base64Encode(dbPass));
    WriteString(c_dBase, 'dbgamedefault', dbGameDefault);
  end;
  finally
    iniF.Free
  end;

end;

function LoadFF_SymbolSetting(const fName: string; var imgSet: TSymbolSetting): boolean;
var IniF: TIniFile;
    s: string;
begin
  Result := True;
  IniF := TIniFile.Create(fName);

  try
    s := ExtractFilePath(ParamStr(0));

    with imgSet do begin
      ImgPath         :=  IncludeTrailingBackslash(
        s + IniFReadstring(inif, c_symbol, 'imgpath', '.\data\bitmap\'));

      DefaultSymbol   :=  IniFReadstring(inif, c_symbol, 'defsymbol', 'SurfacePending.bmp' );
    end;
  finally
    IniF.Free;
  end;
end;

function LoadFF_AppSetting(const fName: string; var appSett: TApplicationSetting): boolean;
const
   c_appsetting = 'application';
var IniF: TIniFile;
    s: string;
begin
  Result := True;
  IniF := TIniFile.Create(fName);

  try
    s := ExtractFilePath(ParamStr(0));

    with appSett do begin
      GameServerName  := IniFReadstring(inif, c_appsetting, 'gameserver', 'tttSimServer.exe' );
      GameClientName  := IniFReadstring(inif, c_appsetting, 'gameclient', 'tttSimClient.exe' );
      DBEditorName    := IniFReadstring(inif, c_appsetting, 'dbeditclient', 'pDBEditor.exe' );
    end;
  finally
    IniF.Free;
  end;

end;

procedure LoadFF_CubicalAssignSetting(const fName: string; var caSett: TCubicleAssignSetting);
const C_ASSIGN = 'cubicalassign';
var IniF: TIniFile;
    key: string;
    i  : Integer;
    ss: TStrings;

begin
  IniF := TIniFile.Create(fName);
  ss := TStringList.Create;

  try
    IniF.ReadSection(C_ASSIGN , ss);
    SetLength(caSett.GroupIDs, ss.Count);

    for i := 0 to ss.Count - 1 do begin

      key := ss[i];
      caSett.GroupIDs[i] := IniF.ReadInteger(C_ASSIGN, ss[i], 0);

    end;
  finally
    IniF.Free;
    ss.Free;
  end;
end;

procedure SaveFF_CubicalAssignSetting(const fName: string; var caSett: TCubicleAssignSetting);
const C_ASSIGN = 'cubicalassign';
var IniF: TIniFile;
    i   : Integer;
    ss: TStrings;

begin
  IniF := TIniFile.Create(fName);
  ss := TStringList.Create;

  IniF.EraseSection(C_ASSIGN);

  for i := 0 to Length(caSett.GroupIDs) - 1 do begin
    IniF.WriteInteger(C_ASSIGN, 'groupID'+ IntToStr(i), caSett.GroupIDs[i]);

  end;

  IniF.Free;

  ss.Free;
end;




end.


