unit uDBCubicles;

{ cubicle group object yg ndak mbulet.
  Group Member hanya berisi index data,
  tidak berisi object.
}

interface

uses
  Windows, Classes, SysUtils, Graphics, tttData;

type

//==============================================================================

  T3CubicleGroupMember = class
  public
    FData             : TRecCubicle_Group_Assignment;
  end;

//==============================================================================
  TStrListAdapter = class
  private
    function getItem(i: integer): TObject;
    function getCount: Integer;
  public
    FSList : TStringList;

    constructor Create;
    destructor Destroy; override;
    procedure Assign(const ss :TStrListAdapter);

    property Items[i: integer]: TObject read  getItem;
    property Count: Integer read getCount;
  end;
//==============================================================================

  T3CubicleGroup = class(TStrListAdapter)
  private

    FCubicleName: string;
    FDetectStart : Integer;
    FLasTrackNum : Integer;
    FTrackAssign : TStringList;
    FTmpMember   : T3CubicleGroupMember;

    procedure SetCubicleName(const Value: string); protected
  published public
    FData        : TRecCubicle_Group;
    //CubicleName  : string;

    constructor Create;
    destructor Destroy; override;

    procedure InitData;
    function GetTrackNumber(const pid: integer): Integer;
    procedure SetTrackNumber(const pid, tn: integer);
    procedure RemoveTrackNumber(const pid: integer);
    function IsGroupMember(const pid: Integer): boolean;
    procedure AddMember(const pid: Integer);
    procedure RemoveMember(const pid: Integer);
    property CubicleName  : string  read FCubicleName write SetCubicleName;
  end;

//==============================================================================
  T3CubicleGroupList = class(TStrListAdapter)
  public
    constructor Create;
    destructor Destroy; override;

    function GetGroupByID(const gid: integer): TObject;
    function GetGroupByID2(const gid: integer): TObject;
    function GetGroupOf_PlatformIndex(const pid: integer): T3CubicleGroup;
    function GetGroupByIdentifier(const valIdentifier: String): T3CubicleGroup;
    procedure ClearAllCubicleName;
  end;

implementation

//==============================================================================
constructor TStrListAdapter.Create;
begin
  inherited;
  FSList  := TStringList.Create;
  FSList.Sorted := True;
end;

destructor TStrListAdapter.Destroy;
begin

  FSList.Free;
  inherited;
end;

procedure TStrListAdapter.Assign(const ss :TStrListAdapter);
begin
  FSList.Clear;
  FSList.AddStrings(ss.FSList);
end;

function TStrListAdapter.getCount: Integer;
begin
  result := FSList.Count;
end;

function TStrListAdapter.getItem(i: integer): TObject;
begin
  if (i < 0) or (i >= FSList.Count)  then
    Result := nil
  else
    Result := FSList.Objects[i];
end;

{ T3CubicleGroup }
constructor T3CubicleGroup.Create;
begin
  inherited;
  FTrackAssign := TStringList.Create;
  FDetectStart := 0;
  FLasTrackNum := 0;
end;

destructor T3CubicleGroup.Destroy;
begin
  FTrackAssign.Free;

  inherited;
end;


procedure T3CubicleGroup.InitData;
begin
  FLasTrackNum := FData.Track_Block_Start;
  FDetectStart := FData.Track_Block_Start;
end;

function T3CubicleGroup.GetTrackNumber(const pid: integer): Integer;
var i: Integer;
    n: string;
begin
  n := IntToStr(pid);
  Result := 0;
  if not Assigned(FTrackAssign) then exit;

  i := FTrackAssign.IndexOfName(n);
  if i < 0 then begin
    Result := FLasTrackNum;
    FTrackAssign.Add( n + '=' + IntToStr(FLasTrackNum));
    inc(FLasTrackNum);

    if FLasTrackNum > FData.Track_Block_End then
     FLasTrackNum := FDetectStart;
  end
  else begin
    n := FTrackAssign.ValueFromIndex[i];
    Result := StrToInt(n);
  end;
end;

procedure T3CubicleGroup.SetCubicleName(const Value: string);
begin
  FCubicleName := Value;
end;

procedure T3CubicleGroup.SetTrackNumber(const pid, tn: integer);
var i, newTn: Integer;
    n: string;
begin  // ini untuk group member
  n := IntToStr(pid);

  i := FTrackAssign.IndexOfName(n);
  if i > 0  then
    FTrackAssign.Delete(i);

  newTn := FData.Track_Block_Start + tn;

  FTrackAssign.Add( n + '=' + IntToStr(newTn));

  if newTn >= FLasTrackNum then begin
    FLasTrackNum :=  newTn + 1;
    FDetectStart := FLasTrackNum;
  end;

end;

procedure T3CubicleGroup.RemoveMember(const pid: Integer);
var
  i : Integer;
  member : T3CubicleGroupMember;
  found : Boolean;
begin
  found := False;

  for i := 0 to FSList.Count - 1 do
  begin
    member := T3CubicleGroupMember(FSList.Objects[i]);

    if member.FData.Platform_Instance_Index = pid then
    begin
      found := True;
      Break;
    end;
  end;

  if found then
    FSList.Delete(i);
end;

procedure T3CubicleGroup.RemoveTrackNumber(const pid: integer);
var i: Integer;
    n: string;
begin
  n := IntToStr(pid);
  i := FTrackAssign.IndexOfName(n);
  if i >= 0 then
     FTrackAssign.Delete(i);
end;

function T3CubicleGroup.IsGroupMember(const pid: Integer): boolean;
var i: Integer;
    n: string;
begin
  n := IntToStr(pid);
  i := FSList.IndexOf(n);

  result := (i > -1);
end;

procedure T3CubicleGroup.AddMember(const pid: Integer);
begin
  FTmpMember   := T3CubicleGroupMember.Create;
  FTmpMember.FData.Platform_Instance_Index := pid;
  FTmpMember.FData.Group_Index := FData.Group_Index;

  FSList.AddObject(IntToStr(pid), FTmpMember);
end;

//==============================================================================
{ T3CubicleGroupList }

constructor T3CubicleGroupList.Create;
begin
  inherited;

end;

destructor T3CubicleGroupList.Destroy;
begin

  inherited;
end;

function T3CubicleGroupList.GetGroupByID(const gid: integer): TObject;
var s: string;
    i: Integer;
begin
  s := IntToStr(gid);
  if FSList.Find(s, i) then
    Result := FSList.Objects[i]
  else
    Result := nil;
end;

function T3CubicleGroupList.GetGroupByID2(const gid: integer): TObject;
var
  f   : Boolean;
  i,c : Integer;
  grp : T3CubicleGroup;
begin
  f := False;
  i := 0;
  c := FSList.Count;
  grp := nil;

  while not f do
  begin
    grp := T3CubicleGroup(FSList.Objects[i]);
    f := grp.FData.Group_Index = gid;
    inc(i);
  end;

  if f then
    Result := grp
  else
    Result := nil;
end;

function T3CubicleGroupList.GetGroupByIdentifier(const valIdentifier : string): T3CubicleGroup;
var
  i   : integer;
  grp  : T3CubicleGroup;
  found: boolean;
begin
  Result := nil;

  for i := 0 to  FSList.Count-1 do
  begin
    grp := Items[i] as T3CubicleGroup;

    if grp.FData.Group_Identifier = valIdentifier then
    begin
      Result := grp;
      Exit;
    end;
  end;
end;

function T3CubicleGroupList.GetGroupOf_PlatformIndex(const pid: integer): T3CubicleGroup;
var i   : integer;
   grp  : T3CubicleGroup;
   found: boolean;
begin
  i := 0;
  grp := nil;
  found := false;

  while not found and (i < FSList.Count)  do
  begin
    grp :=  Items[i] as T3CubicleGroup;
    found := grp.IsGroupMember(pid);
    inc(i);
  end;

  if found then
    result := grp
  else
    result := nil;
end;

procedure T3CubicleGroupList.ClearAllCubicleName;
var i   : integer;
   grp  : T3CubicleGroup;
begin
  //for i := 0 to  - 1 do
  for i := 0 to  FSList.Count-1 do
  begin
    grp := Items[i] as T3CubicleGroup;
    grp.CubicleName := '';
  end;
end;

end.
