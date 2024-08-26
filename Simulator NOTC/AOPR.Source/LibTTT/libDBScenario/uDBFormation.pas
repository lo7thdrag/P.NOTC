unit uDBFormation;

interface

uses
  tttData,Classes, SysUtils;

type

  TFormation = class
  public
    FFormation_Def   : TRecFormation_Definition;
    FForm_Assign     : TRecFormation_Assignment;

    Assignment       : TList;

    constructor Create;
    destructor Destroy;override;
  end;

  // ini yg dipake untuk formasi nantinya
  TFormationRefine = class
  private
    FForm_Assign   : TList;
    FOnMemberAdded: TNotifyEvent;
    FOnMemberRemove: TNotifyEvent;
    procedure SetOnMemberAdded(const Value: TNotifyEvent);
    procedure SetOnMemberRemove(const Value: TNotifyEvent);  // list of TClassFormation_Assignment

  public
    FFormation_Def : TRecFormation_Definition;

    constructor Create;
    destructor Destroy;override;

    function MemberByIndex(aIndex : Integer) : TClassFormation_Assignment;
    function MemberExist(aIndex : Integer): Boolean;
    function RemoveMemberByIndex(aIndex : Integer): Boolean;
    function get(aIndex : integer) : TClassFormation_Assignment;
    function Count : Integer;

    procedure AddMember(aMember : TClassFormation_Assignment);

    // event dipake hanya oleh formation manager saja
    property OnMemberAdded : TNotifyEvent read FOnMemberAdded write SetOnMemberAdded;
    property OnMemberRemoved : TNotifyEvent read FOnMemberRemove write SetOnMemberRemove;

  end;

implementation

{ TLink }

constructor TFormation.Create;
begin
   Assignment := TList.Create;
end;

destructor TFormation.Destroy;
begin
  Assignment.Free;
  inherited;
end;


{ TFormationRefine }

procedure TFormationRefine.AddMember(aMember: TClassFormation_Assignment);
begin
  FForm_Assign.Add(aMember);
  if Assigned(FOnMemberAdded) then
    FOnMemberAdded(aMember);
end;

function TFormationRefine.Count: Integer;
begin
  Result := FForm_Assign.Count;
end;

constructor TFormationRefine.Create;
begin
  FForm_Assign := TList.Create;
end;

destructor TFormationRefine.Destroy;
begin

  while FForm_Assign.Count > 0 do
  begin
    TObject(FForm_Assign.Items[0]).Free;
    FForm_Assign.Delete(0);
  end;

  FForm_Assign.Free;

  inherited;
end;

function TFormationRefine.get(aIndex: integer): TClassFormation_Assignment;
begin
  result := nil;
  if (aIndex >= 0) and (aIndex <= FForm_Assign.Count - 1)  then
    Result := FForm_Assign.Items[aIndex];
end;

function TFormationRefine.MemberByIndex(
  aIndex: Integer): TClassFormation_Assignment;
var
  m : TClassFormation_Assignment;
  I: Integer;
begin
  Result := nil;
  for I := 0 to FForm_Assign.Count - 1 do
  begin
    m := FForm_Assign.Items[I];

    if m.Platform_Instance_Index = aIndex then
    begin
      Result := m;
      Break;
    end;
  end;
end;

function TFormationRefine.MemberExist(aIndex: Integer): Boolean;
var
  m : TClassFormation_Assignment;
  I: Integer;
begin
  Result := False;
  for I := 0 to FForm_Assign.Count - 1 do
  begin
    m := FForm_Assign.Items[I];

    if m.Platform_Instance_Index = aIndex then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TFormationRefine.RemoveMemberByIndex(aIndex: Integer): Boolean;
var
  m : TClassFormation_Assignment;
  I: Integer;
begin
  Result := False;
  for I := 0 to FForm_Assign.Count - 1 do
  begin
    m := FForm_Assign.Items[I];

    if m.Platform_Instance_Index = aIndex then
    begin
      Result := True;

      // notify first
      if ASsigned(FOnMemberRemove) then
        FOnMemberRemove(m);

      m.Free;
      FForm_Assign.Delete(I);

      Break;
    end;
  end;

end;

procedure TFormationRefine.SetOnMemberAdded(const Value: TNotifyEvent);
begin
  FOnMemberAdded := Value;
end;

procedure TFormationRefine.SetOnMemberRemove(const Value: TNotifyEvent);
begin
  FOnMemberRemove := Value;
end;

end.
