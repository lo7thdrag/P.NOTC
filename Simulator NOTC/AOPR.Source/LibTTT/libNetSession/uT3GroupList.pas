unit uT3GroupList;

interface

uses
  Classes, GmXml, GmXMLInterface;

type

//==============================================================================
  TCubicleInfo = class

  public

    CubicleID  : string;
    CubicleName: string;
    ConsoleIPs : TStrings;

    constructor Create;
    destructor Destroy; override;
  end;

//==============================================================================
  TConsoleInfo = class
  public
    IPAddress: string;
    ConsoleName: string;
    CubicleID,
    CubicleName: string;
  end;
//==============================================================================

  TNodeCubicle = class(TXMLObjInterface)
  private
    function getValue(const Index: Integer): string;
  public
    property CubicleID: string index 1 read getValue;
    property CubicleName: string index 2 read getValue;
  end;

//==============================================================================
  TNodeConsole = class(TXMLObjInterface)
  private
    function getValue(const Index: Integer): string;
  public
    property IPAddress  : string index 1 read getValue;
    property ConsoleName: string index 2 read getValue;
  end;

//==============================================================================
//mestinya ini dikasih nama cubicle list.
// isinya cubicle dan ipaddress
  T3GroupList = class
  private
//    function getControllerCount: integer;
//    function GetControllers(index: integer): TConsoleInfo;
  protected
    FXML    : TGmXML;
    FLoaded : Boolean;

    FNodeControllers,
    FNodeCubicles,
    FNodeWasdal   : TGmXmlNode;
    FNodeVBS   : TGmXmlNode;

    iNodeCons : TNodeConsole;

    FCubicleList,
    FConsoleList,
    FControllerList,
    FWasdalList: TStringList;
    FVBSList: TStringList;

  public
    constructor Create;
    destructor Destroy; override;

    procedure LoadFromFile(const fName: string);
    procedure CloseFile;

    function IsGroupMember(const ipAdd: string): boolean;
    function GetConsoleName(const ipAdd: string): string;

    function GetCubicleName(const ipAdd: string): string;
    function GetCubicle(const cbName: string): TCubicleInfo;
    function GetIPAddress(const cbName: string): string;
    function IsController(const ipAdd: string): Boolean;

    function IsWasdal(const ipAdd: string): Boolean;

    function IsVBS(const ipAdd: string): Boolean;

    procedure GetListConsole(var al : TStringList);

  end;



implementation


const
  cTag_aoprgroups   = 'aoprgroups';
  cTag_controllers  = 'controllers';
  cTag_cubicles     = 'cubicles';
  cTag_console      = 'console';
  cTag_wasdal       = 'wasdal';
  cTag_vbs          = 'vbs';


procedure ClearAndFreeItems(var sl: TStringList);
var
  i: integer;
  o: TObject;
begin
  for i := sl.Count - 1 downto 0 do begin
    o := sl.Objects[i];
    o.Free;
  end;
  sl.Clear;
end;


{ TNodeCubicles }

function TNodeCubicle.getValue(const Index: Integer): string;
begin
  case index of
    1 : //CubicleID
    result := getAttribValueByName('id');
    2 : //CubicleName
    result := getAttribValueByName('name');
  end;
end;

{ TNodeConsoles }

function TNodeConsole.getValue(const Index: Integer): string;
begin
  case index of
    1 : result := getAttribValueByName('ip');
    2 : result := getAttribValueByName('name');
  end;
end;


{ T3GroupList }

constructor T3GroupList.Create;
begin
  FNodeControllers  := nil;
  FNodeCubicles     := nil;

  FXML := nil;
  FLoaded := False;

  FCubicleList := TStringList.Create;
  FCubicleList.Sorted := true;

  FConsoleList := TStringList.Create;
  FConsoleList.Sorted := true;

  FControllerList := TStringList.Create;
  FControllerList.Sorted := true;

  FWasdalList := TStringList.Create;
  FWasdalList.Sorted := True;

  FVBSList := TStringList.Create;
  FVBSList.Sorted := True;



  iNodeCons := TNodeConsole.Create;
end;

destructor T3GroupList.Destroy;
begin
  iNodeCons.Free;

  FControllerList.Clear;
  FControllerList.Free;

  FWasdalList.Clear;
  FWasdalList.Free;

  FConsoleList.Clear;
  FConsoleList.Free;

  FVBSList.Clear;
  FVBSList.Free;

  FCubicleList.Clear;
  FCubicleList.Free;

  FNodeControllers  := nil;
  FNodeCubicles     := nil;
  FNodeVBS          := nil;
  FXML.Free;

  inherited;
end;


procedure T3GroupList.LoadFromFile(const fName: string);
var i, j: integer;
    nCon: TNodeConsole;
    nCub: TNodeCubicle;
    nCubWasdal: TNodeCubicle;
    nCubVBS: TNodeCubicle;
    con:  TConsoleInfo;
    cub: TCubicleInfo;
begin
  FXML := TGmXML.Create(nil);

  FXML.LoadFromFile(fName);

  FNodeControllers := FXML.Nodes.Node[0].Children.NodeByName[cTag_controllers];
  FNodeCubicles    := FXML.Nodes.Node[0].Children.NodeByName[cTag_cubicles];
  FNodeWasdal      := FXML.Nodes.Node[0].Children.NodeByName[cTag_wasdal];
  FNodeVBS         := FXML.Nodes.Node[0].Children.NodeByName[cTag_vbs];

  nCon  := TNodeConsole.Create;
  nCub  := TNodeCubicle.Create;
  nCubWasdal := TNodeCubicle.Create;
  nCubVBS := TNodeCubicle.Create;


  nCub.Assign(FNodeControllers);

  nCubWasdal.Assign(FNodeWasdal);

  nCubVBS.Assign(FNodeVBS);


  FControllerList.Clear;
  FWasdalList.Clear;
  FVBSList.Clear;
  ClearAndFreeItems(FConsoleList);
  ClearAndFreeItems(FCubicleList);
  ClearAndFreeItems(FWasdalList);

  cub := TCubicleInfo.Create;
  cub.CubicleID   := nCub.CubicleID;
  cub.CubicleName := nCub.CubicleName;


  for i := 0 to FNodeControllers.Children.Count-1 do begin
    nCon.Assign(FNodeControllers.Children.Node[i]);

    con :=  TConsoleInfo.Create;
    con.IPAddress   := nCon.IPAddress;
    con.ConsoleName := nCon.ConsoleName;
    con.CubicleName := nCub.CubicleName;

    FControllerList.AddObject(con.IPAddress, con);
    FConsoleList.AddObject(con.IPAddress, con);

    cub.ConsoleIPs.Add(con.IPAddress);
  end;

  FCubicleList.AddObject(cub.CubicleName, cub);

  cub := TCubicleInfo.Create;
  cub.CubicleID   := nCubWasdal.CubicleID;
  cub.CubicleName := nCubWasdal.CubicleName;

  if Assigned(FNodeWasdal) then
  begin
    for i := 0 to FNodeWasdal.Children.Count - 1 do
    begin
      nCon.Assign(FNodeWasdal.Children.Node[i]);

      con := TConsoleInfo.Create;
      con.IPAddress   := nCon.IPAddress;
      con.ConsoleName := nCon.ConsoleName;
      con.CubicleName := nCubWasdal.CubicleName;

      FWasdalList.AddObject(con.IPAddress, con);
      FConsoleList.AddObject(con.IPAddress, con);

      cub.ConsoleIPs.Add(con.IPAddress);
    end;

    FCubicleList.AddObject(cub.CubicleName, cub);
  end;

  cub := TCubicleInfo.Create;
  cub.CubicleID   := nCubVBS.CubicleID;
  cub.CubicleName := nCubVBS.CubicleName;

  if Assigned(FNodeVBS) then
  begin
    for i := 0 to FNodeVBS.Children.Count - 1 do
    begin
      nCon.Assign(FNodeVBS.Children.Node[i]);

      con := TConsoleInfo.Create;
      con.IPAddress   := nCon.IPAddress;
      con.ConsoleName := nCon.ConsoleName;
      con.CubicleName := nCubVBS.CubicleName;

      FVBSList.AddObject(con.IPAddress, con);
      FConsoleList.AddObject(con.IPAddress, con);

      cub.ConsoleIPs.Add(con.IPAddress);
    end;

    FCubicleList.AddObject(cub.CubicleName, cub);
  end;

  for i := 0 to FNodeCubicles.Children.Count-1 do begin
    nCub.Assign(FNodeCubicles.Children.Node[i]);

    cub := TCubicleInfo.Create;
    cub.CubicleID   := nCub.CubicleID;
    cub.CubicleName := nCub.CubicleName;

    for j := 0 to nCub.FXMLNode.Children.Count-1 do begin
      nCon.Assign(nCub.FXMLNode.Children.Node[j]);

      con :=  TConsoleInfo.Create;
      con.IPAddress   := nCon.IPAddress;
      con.ConsoleName := nCon.ConsoleName;
      con.CubicleName := nCub.CubicleName;

      FConsoleList.AddObject(con.IPAddress, con);

      cub.ConsoleIPs.Add(con.IPAddress);
    end;

    FCubicleList.AddObject(cub.CubicleName, cub);
  end;

  nCon.Free;
  nCub.Free;
  nCubWasdal.Free;
  nCubVBS.Free;
end;


procedure T3GroupList.CloseFile;
begin
  FXML.Free;
  FXML := nil;

  FNodeControllers  := nil;
  FNodeCubicles     := nil;

  FNodeWasdal       := nil;

  FNodeVBS          := nil;


  FControllerList.Clear;
  ClearAndFreeItems(FConsoleList);
  ClearAndFreeItems(FCubicleList);

end;

function T3GroupList.GetConsoleName(const ipAdd: string): string;
var i: integer;
    con:  TConsoleInfo;
begin
  if FConsoleList.Find(ipAdd, i) then begin
    con     := FConsoleList.Objects[i] as TConsoleInfo;
    result  := con.ConsoleName;
  end
  else
    result := '';
end;

function T3GroupList.GetCubicleName(const ipAdd: string): string;
var i: integer;
    con:  TConsoleInfo;
begin
  result := '';
  if FConsoleList.Find(ipAdd, i) then begin
    con :=  FConsoleList.Objects[i] as TConsoleInfo;
    result := con.CubicleName;
  end;
end;

function T3GroupList.GetIPAddress(const cbName: string): string;
var
  i : integer;
  con :  TConsoleInfo;
begin
  result := '';

  for i := 0 to FConsoleList.Count - 1 do
  begin
    con :=  FConsoleList.Objects[i] as TConsoleInfo;

    if con.ConsoleName =  cbName then
    begin
      result := con.IPAddress;
      Break;
    end;
  end;
end;

procedure T3GroupList.GetListConsole(var al: TStringList);
var
    i: integer;
    con:  TConsoleInfo;
begin
  if al = nil then exit;
  for i := 0 to FConsoleList.Count - 1 do begin
     con :=  FConsoleList.Objects[i] as TConsoleInfo;
     al.AddObject(con.IPAddress,con);
  end;
end;

function T3GroupList.GetCubicle(const cbName: string): TCubicleInfo;
var i: integer;
begin
  Result := nil;

  if FCubicleList.Find(cbName, i) then
    Result := FCubicleList.Objects[i] as TCubicleInfo;

end;

function T3GroupList.IsGroupMember(const ipAdd: string): boolean;
var i: integer;
begin
  result := FConsoleList.Find(ipAdd, i);
end;

function T3GroupList.IsVBS(const ipAdd: string): Boolean;
var
  i : Integer;
begin
  result := FVBSList.Find(ipAdd, i);
end;


function T3GroupList.IsWasdal(const ipAdd: string): Boolean;
var
  i : Integer;
begin
  result := FWasdalList.Find(ipAdd, i);
end;

function T3GroupList.IsController(const ipAdd: string): Boolean;
var i: integer;
begin
  result := FControllerList.Find(ipAdd, i);
end;

{ TCubicleInfo }

constructor TCubicleInfo.Create;
begin
  inherited;

  ConsoleIPs := TStringList.Create;
end;

destructor TCubicleInfo.Destroy;
begin
  ConsoleIPs.Clear;
  ConsoleIPs.Free;

  inherited;
end;

end.
