unit uDMGC;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection, dialogs;

type

  TScenarioInfo = class
    Scenario_Index        : Integer;
    Scenario_Identifier   : string;
    Resource_Alloc_Index  : Integer;
  end;

  TGroupInfo = class
    Group_Index: integer;
    Deployment_Index: integer;
    Group_Identifier: string;
    CubicleName: string;

//    Force_Designation: integer;
//    Tracks_Block: integer;
//    Track_Block_Start: integer;
//    Track_Block_End: integer;
//    Zulu_Zulu: integer;
  end;

  TDeployedPlatformInfo = class
    Group_Index: integer;
    Platform_Instance_Index: integer;
    Instance_Name: string;
  end;

  TDMGC = class(TDataModule)
    zConn: TZConnection;
    zQ: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function InitZDB(const zDbServer, zDBProto, zDBname,
      zDBuser, zDBPass: string): boolean;
    procedure GetSenarioListFromDB(var l: TList);
    procedure GetGroupList(const scId: Integer; var l: TList);
    procedure GetGroupMember(const grpId: Integer; var l: TList);
  end;

var
  dmGC: TDMGC;

implementation

uses
  uLibSettingTTT;

{$R *.dfm}



function TDMGC.InitZDB(const zDbServer, zDBProto, zDBname,
  zDBuser, zDBPass: string): boolean;
begin

  with zConn do
  begin
    HostName := zDbServer;
    Protocol := zDBProto;
    Database := zDBName;
    User     := zDBUser;
    Password := zDBpass;
  end;

  try
    zConn.Connect;
    Result :=  zConn.Connected;
  except
    on Exception do
    begin
      MessageDlg('Error Database Connection on ' + zDbServer, mtError, [mbOK], 0);
      Result := false;
      exit;
    end
  end;
  ZQ.Connection := ZConn;
end;

procedure TDMGC.GetSenarioListFromDB(var l: TList);
var bResult : Boolean;
    scInfo: TScenarioInfo;
begin
// create connection, query   SQL.Add('FROM Scenario_Definition' );
  if not zConn.Connected then
    with vDBSetting do begin
      bResult := dmGC.InitZDB(dbServer, dbProto, dbName, dbUser, dbPass);

      if not bResult  then begin
         ShowMessage('Connection to database failed. ');
         Exit;
      end;
    end;
  with dmGC.ZQ do begin
    Close;
    SQL.Clear;

    SQL.Add('SELECT ');
    SQL.Add('  Scenario_Index, Scenario_Identifier, Resource_Alloc_Index');
    SQL.Add('FROM ');
    SQL.Add(' Scenario_Definition');

    Open;
  end;

  l.Clear;
  //warning: belum free scInfo yg ada.

  while not ZQ.Eof do begin
    scInfo := TScenarioInfo.Create;
    with scInfo do begin
      Scenario_Index          := ZQ.Fields[0].AsInteger;
      Scenario_Identifier     := ZQ.Fields[1].AsString;
      Resource_Alloc_Index    := ZQ.Fields[2].AsInteger;
    end;

    l.Add(scInfo);

    ZQ.Next;
  end;

end;

procedure TDMGC.GetGroupList(const scId: Integer; var l: TList);
var gInfo: TGroupInfo;
    bResult : boolean;
begin

  if not zConn.Connected then
    with vDBSetting do begin
      bResult := dmGC.InitZDB(dbServer, dbProto, dbName, dbUser, dbPass);

      if not bResult  then begin
         ShowMessage('Connection to database failed. ');
         Exit;
      end;
    end;

  with dmGC.ZQ do begin
    Close;
    SQL.Clear;

    SQL.Add('SELECT ');
    SQL.Add(' a.Group_Index, a.Group_Identifier, a.Deployment_Index  ');
    SQL.Add('FROM ');
    SQL.Add(' Cubicle_Group a join   Asset_Deployment_Definition b ');
    SQL.Add(' ON a.Deployment_Index = b.Deployment_Index ');
    SQL.Add('WHERE ');
    SQL.Add(' b.Scenario_Index =');
    SQL.Add(IntToStr(scID));
    Open;
  end;

  l.Clear;
  while not ZQ.Eof do begin
    gInfo := TGroupInfo.Create;
    with gInfo do begin
      Group_Index       := ZQ.Fields[0].AsInteger;
      Group_Identifier  := ZQ.Fields[1].AsString;
      Deployment_Index  := ZQ.Fields[2].AsInteger;
    end;
    l.Add(gInfo);
    ZQ.Next;
  end;

end;

procedure TDMGC.GetGroupMember(const grpId: Integer; var l: TList);
var dPI: TGroupInfo;
    bResult : boolean;
begin
  if not zConn.Connected then
    with vDBSetting do begin
      bResult := dmGC.InitZDB(dbServer, dbProto, dbName, dbUser, dbPass);

      if not bResult  then begin
         ShowMessage('Connection to database failed. ');
         Exit;
      end;
    end;

  with dmGC.ZQ do begin
    Close;
    SQL.Clear;

    SQL.Add('SELECT ');
    SQL.Add(' a.Group_Index, c.Platform_Instance_Index, c.Instance_Name  ');
    SQL.Add('FROM ');
    SQL.Add('  Cubicle_Group_Assignment a ');
    SQL.Add('  JOIN Platform_Instance c ');
    SQL.Add('  ON a.Platform_Instance_Index = c.Platform_Instance_Index ');
    SQL.Add('WHERE ');
    SQL.Add('  a.Group_Index=');

    SQL.Add(IntToStr(grpId));
    Open;
  end;

  l.Clear;
  while not ZQ.Eof do begin
    dPI  := TGroupInfo.Create;
    with dPI do begin
      Group_Index       := ZQ.Fields[0].AsInteger;
      Deployment_Index  := ZQ.Fields[1].AsInteger;
      Group_Identifier  := ZQ.Fields[2].AsString;
    end;
    l.Add(dPI);
    ZQ.Next;
  end;

end;

end.
