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

  T3GroupList = class
  private
//    function getControllerCount: integer;
//    function GetControllers(index: integer): TConsoleInfo;
  protected
    FXML    : TGmXML;
    FLoaded : Boolean;

    FNodeControllers,
    FNodeCubicles   : TGmXmlNode;

    iNodeCons : TNodeConsole;

    FCubicleList,
    FConsoleList,
    FControllerList: TStringList;

  public
    constructor Create;
    destructor Destroy; override;

    procedure LoadFromFile(const fName: string);
    procedure CloseFile;

    function IsGroupMember(const ipAdd: string): boolean;
    function GetConsoleName(const ipAdd: string): string;

    function GetCubicleName(const ipAdd: string): string;
    function GetCubicle(const cbName: string): TCubicleInfo;

    function IsController(const ipAdd: string): Boolean;

  end;



implementation


const
  cTag_t3groups     = 't3groups';
  cTag_controllers  = 'controllers';
  cTag_cubicles     = 'cubicles';
  cTag_console      = 'console';

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


  iNodeCons := TNodeConsole.Create;
end;

destructor T3GroupList.Destroy;
begin
  iNodeCons.Free;

  FControllerList.Clear;
  FControllerList.Free;

  FConsoleList.Clear;
  FConsoleList.Free;

  FCubicleList.Clear;
  FCubicleList.Free;

  FNodeControllers  := nil;
  FNodeCubicles     := nil;
  FXML.Free;

  inherited;
end;


procedure T3GroupList.LoadFromFile(const fName: string);
var i, j: integer;
    nCon: TNodeConsole;
    nCub: TNodeCubicle;
    con:  TConsoleInfo;
    cub: TCubicleInfo;
begin
  FXML := TGmXML.Create(nil);

  FXML.LoadFromFile(fName);

  FNodeControllers := FXML.Nodes.Node[0].Children.NodeByName[cTag_controllers];
  FNodeCubicles    := FXML.Nodes.Node[0].Children.NodeByName[cTag_cubicles];

  nCon  := TNodeConsole.Create;
  nCub  := TNodeCubicle.Create;

  nCub.Assign(FNodeControllers);

  FControllerList.Clear;
  ClearAndFreeItems(FConsoleList);
  ClearAndFreeItems(FCubicleList);

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
end;


procedure T3GroupList.CloseFile;
begin
  FXML.Free;
  FXML := nil;

  FNodeControllers  := nil;
  FNodeCubicles     := nil;

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

function T3GroupList.GetCubicle(const cbName: string): TCubicleInfo;
var i: integer;
begin
  Result := nil;

  if FCubicleList.Find(cbName, i) then
    Result := FCubicleList.Objects[i] as TCubicleInfo ;

end;

function T3GroupList.IsGroupMember(const ipAdd: string): boolean;
var i: integer;
begin
  result := FConsoleList.Find(ipAdd, i);
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
