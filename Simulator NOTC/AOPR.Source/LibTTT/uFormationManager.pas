unit uFormationManager;

interface

uses Classes, SysUtils, uDBFormation, tttData,uT3UnitContainer,
  uGameData_TTT ;

type

  TFormationManager = class
  private
    FFormations : TList; // list of TFormationRefine

    procedure OnMemberAdded(Sender : TObject);
    procedure OnMemberRemoved(Sender : TObject);

  public
    constructor Create;
    destructor Destroy;override;

    // ini agak dipaksain, tp biarin dlu
    procedure SetManager(amanager : TObject);

    function FormationNameExist(aName : String) : Boolean;
    function FormationByIndex(aIndex : Integer) : TFormationRefine;
    function FormationByName(aName : String) : TFormationRefine;
    function RemoveFormationByIndex(aIndex : Integer) : Boolean;
    function RemoveFormationMember(formation : TFormationRefine; aInstIndex : integer ):Boolean;
    function PlatformExistInFormation(aIndex : Integer) : Boolean;
    function PlatformIsLeader(aInstIndex : integer) : Boolean;
    function ActivateFormationByLeader(aInstindex : integer):Boolean;

    function Count : integer;

    function get(aIndex : INteger):TFormationRefine;

    procedure AddFormation(fm : TFormationRefine);
    procedure DeleteFormation(fm : TFormationRefine);

    procedure Clear;
  end;

implementation

uses
  uT3SimManager, uT3Vehicle, uT3Unit ;

var
  manager : TT3SimManager;

function TFormationManager.ActivateFormationByLeader(
  aInstindex: integer): Boolean;
var
  I,J : integer;

  fm : TFormationRefine;
  fa : TClassFormation_Assignment;
  pi : TT3PlatformInstance;
begin
  result := False;

  for I := 0 to FFormations.Count - 1 do
  begin

    fm := FFormations.Items[I];
    if fm.FFormation_Def.Formation_Leader = aInstIndex then
    begin

      for J := 0 to fm.Count - 1 do
      begin

        fa := fm.get(J);
        pi := manager.FindT3PlatformByID(fa.Platform_Instance_Index);

        if Assigned(pi) then
        begin
          TT3Vehicle(pi).FormationModeActive := True;

          if TT3Vehicle(pi).isFormationLeader then
            TT3Vehicle(pi).VehicleDefinition.GuidanceType := vgtStraightLine
          else
          begin
            TT3Vehicle(pi).VehicleDefinition.GuidanceType := vgtFormation;
            TT3Vehicle(pi).TempHeading := 720;
            TT3Vehicle(pi).TempSpeed := 720;
          end;


          manager.EventManager.OnPlatformOrderedControlChange(CORD_ID_MOVE,
              CORD_TYPE_SETFORMATION, TT3Vehicle(pi).InstanceIndex, 1);
        end;

      end;

      Result := True;
      Break;
    end;

  end;
end;

procedure TFormationManager.AddFormation(fm: TFormationRefine);
var
  pi : TT3PlatformInstance;
begin
  FFormations.Add(fm);

  fm.OnMemberAdded    := OnMemberAdded;
  fm.OnMemberRemoved  := OnMemberRemoved;

  if not Assigned(manager) then
    Exit;

  // update vehicle, set as leader
  pi := manager.FindT3PlatformByID(fm.FFormation_Def.Formation_Leader);

  if Assigned(pi) and (pi.ClassType = TT3Vehicle) then
  begin
    with TT3Vehicle(pi) do begin
      isFormationLeader := True;
      FormationModeActive := False;
      FormationName := fm.FFormation_Def.Formation_Identifier;
    end;
  end;

end;

procedure TFormationManager.Clear;
begin
  while FFormations.Count > 0 do
  begin
    TObject(FFormations.Items[0]).Free;
    FFormations.Delete(0);
  end;

  FFormations.Clear;
end;

function TFormationManager.Count: integer;
begin
  Result := FFormations.Count;
end;

constructor TFormationManager.Create;
begin
  FFormations := TList.Create;
end;

procedure TFormationManager.DeleteFormation(fm: TFormationRefine);
var
  pi : TT3PlatformInstance;
  fa : TClassFormation_Assignment;
  I: Integer;
begin

  fm.OnMemberAdded := nil;
  fm.OnMemberRemoved := nil;

  if Assigned(manager) then
  begin

    // remove all member and leader from formation

    // release member first
    for I := 0 to fm.Count - 1 do
    begin
      fa := fm.get(I);
      pi := manager.FindT3PlatformByID(fa.Platform_Instance_Index);

      if Assigned(pi) and (pi.ClassType = TT3Vehicle) then
      begin
        with TT3Vehicle(pi) do begin
          isFormationLeader     := False;
          FormationModeActive   := False;
          FormationName         := '';
          FormationLeader       := 0;
          FormationState        := 0;
          FormationRange        := 0;
          FormationAltitude     := 0;
          FormationBearing      := 0;

          VehicleDefinition.GuidanceType := vgtStraightLine;

          OrderedHeading := Heading;
          FirstHeading   := Heading;
          HelmDegree     := Heading;
          EvasionDegree  := Heading;
          CircleDirection:= Heading;
          OrderedZigzag  := Heading;
          OrderedSinuation := Heading;

          manager.EventManager.OnPlatformOrderedControlChange(CORD_ID_MOVE,
              CORD_TYPE_COURSE, InstanceIndex, Heading);
        end;
      end;

    end;

    // release leader
    pi := manager.FindT3PlatformByID(fm.FFormation_Def.Formation_Leader);

    if Assigned(pi) and (pi.ClassType = TT3Vehicle) then
    begin
      with TT3Vehicle(pi) do begin
        isFormationLeader     := False;
        FormationModeActive   := False;
        FormationName         := '';
        FormationLeader       := 0;
        FormationState        := 0;
        FormationRange        := 0;
        FormationAltitude     := 0;
        FormationBearing      := 0;
      end;
    end;
  end;

  FFormations.Remove(fm);
end;

destructor TFormationManager.Destroy;
begin
  while FFormations.Count > 0 do
  begin
    TObject(FFormations.Items[0]).Free;
    FFormations.Delete(0);
  end;

  FFormations.Free;
end;

function TFormationManager.FormationByIndex(aIndex: Integer): TFormationRefine;

var

  I : integer;

  fm : TFormationRefine;
begin
  result := nil;
  for I := 0 to FFormations.Count - 1 do
  begin

    fm := FFormations.Items[I];
    if fm.FFormation_Def.Formation_Index = aIndex then
    begin
      Result := fm;
      Break;
    end;
  end;

end;

function TFormationManager.FormationByName(aName: String): TFormationRefine;

var
  I : integer;

  fm : TFormationRefine;
begin
  result := nil;
  for I := 0 to FFormations.Count - 1 do
  begin

    fm := FFormations.Items[I];

    if CompareStr(fm.FFormation_Def.Formation_Identifier,aName) = 0 then
    begin
      Result := fm;
      Break;
    end;

  end;
end;

function TFormationManager.FormationNameExist(aName: String): Boolean;

var
  I: Integer;

  fm : TFormationRefine;

begin
  result := False;
  for I := 0 to FFormations.Count - 1 do
  begin

    fm := FFormations.Items[I];
    if CompareStr(fm.FFormation_Def.Formation_Identifier,aName) = 0 then
    begin
      Result := True;
      Break;
    end;
  end;

end;

function TFormationManager.get(aIndex: INteger): TFormationRefine;

begin
  Result := nil;
  if (aIndex >= 0) and (aIndex <= FFormations.Count - 1) then
    Result := FFormations.Items[aIndex];
end;

procedure TFormationManager.OnMemberAdded(Sender: TObject);

var

  leader, member : TT3PlatformInstance;

  fm : TFormationRefine;

begin
  if not Assigned(Sender) then
    Exit;

  leader := nil;

  if Sender is TClassFormation_Assignment then
  begin
    with TClassFormation_Assignment(Sender) do begin
      fm := FormationByIndex(Formation_Index);

      if Assigned(fm) then
        leader := manager.FindT3PlatformByID(fm.FFormation_Def.Formation_Leader);

      if Assigned(leader) then
      begin
        member := manager.FindT3PlatformByID(Platform_Instance_Index);

        if Assigned(member) and (member is TT3Vehicle) then
        begin
          TT3Vehicle(member).isFormationLeader  := False;
          TT3Vehicle(member).FormationState     := TT3Vehicle(leader).FormationState;
          TT3Vehicle(member).FormationRange     := Range_from_Leader;
          TT3Vehicle(member).FormationAltitude  := Altitude;
          TT3Vehicle(member).FormationBearing   := Angle_Offset;
          TT3Vehicle(member).FormationName      := fm.FFormation_Def.Formation_Identifier;
          TT3Vehicle(member).FormationModeActive := TT3Vehicle(leader).FormationModeActive;
          TT3Vehicle(member).LeaderPlatform     := leader;

          if TT3Vehicle(member).FormationModeActive then
          begin
            TT3Vehicle(member).VehicleDefinition.GuidanceType := vgtFormation;

            manager.EventManager.OnPlatformOrderedControlChange(CORD_ID_MOVE,
                CORD_TYPE_SETFORMATION, TT3Vehicle(member).InstanceIndex, 1);
          end;

        end;
      end;
    end;
  end;
end;

procedure TFormationManager.OnMemberRemoved(Sender: TObject);

var
  leader, member : TT3PlatformInstance;

  fm : TFormationRefine;

  heading : double;

begin
  if not Assigned(Sender) then
    Exit;

  leader := nil;

  if Sender is TClassFormation_Assignment then
  begin
    with TClassFormation_Assignment(Sender) do begin
      fm := FormationByIndex(Formation_Index);

      if Assigned(fm) then
        leader := manager.FindT3PlatformByID(fm.FFormation_Def.Formation_Leader);

      if Assigned(leader) then
      begin
        member := manager.FindT3PlatformByID(Platform_Instance_Index);

        if Assigned(member) and (member is TT3Vehicle) then
        begin
          TT3Vehicle(member).isFormationLeader  := False;
          TT3Vehicle(member).FormationState     := 0;
          TT3Vehicle(member).FormationRange     := 0;
          TT3Vehicle(member).FormationAltitude  := 0;
          TT3Vehicle(member).FormationBearing   := 0;
          TT3Vehicle(member).FormationName      := '';
          TT3Vehicle(member).FormationModeActive := False;

          heading := TT3Vehicle(member).heading;
          TT3Vehicle(member).OrderedHeading := Heading;
          TT3Vehicle(member).FirstHeading   := Heading;
          TT3Vehicle(member).HelmDegree     := Heading;
          TT3Vehicle(member).EvasionDegree  := Heading;
          TT3Vehicle(member).CircleDirection:= Heading;
          TT3Vehicle(member).OrderedZigzag  := Heading;
          TT3Vehicle(member).OrderedSinuation := Heading;

          TT3Vehicle(member).VehicleDefinition.GuidanceType := vgtStraightLine;

          manager.EventManager.OnPlatformOrderedControlChange(CORD_ID_MOVE,
              CORD_TYPE_COURSE, TT3Vehicle(member).InstanceIndex, heading);

          TT3Vehicle(member).LeaderPlatform := nil;
        end;
      end;

      if fm.Count <= 0 then
        TT3Vehicle(leader).FormationModeActive := False;
    end;
  end;
end;

function TFormationManager.PlatformExistInFormation(aIndex: Integer): Boolean;

var
  I,J : integer;

  fm : TFormationRefine;
  fa : TClassFormation_Assignment;
  found : Boolean;
begin
  result := False;
  for I := 0 to FFormations.Count - 1 do
  begin
    Found := False;

    fm := FFormations.Items[I];
    if fm.FFormation_Def.Formation_Leader = aIndex then
    begin
      Result := True;
      Break;
    end;

    for J := 0 to fm.Count - 1 do
    begin
      fa := fm.get(J);
      if fa.Platform_Instance_Index = aIndex then
      begin
        Found := True;
        Break;
      end;
    end;

    if found then
    begin
      Result := True;
      break;
    end;

  end;
end;

function TFormationManager.PlatformIsLeader(aInstIndex: integer): Boolean;

var
  I : integer;

  fm : TFormationRefine;
begin
  result := False;

  for I := 0 to FFormations.Count - 1 do
  begin

    fm := FFormations.Items[I];
    if fm.FFormation_Def.Formation_Leader = aInstIndex then
    begin
      Result := True;
      Break;
    end;

  end;
end;

function TFormationManager.RemoveFormationByIndex(aIndex: Integer): Boolean;

var
  I: Integer;

  fm : TFormationRefine;

begin
  result := False;
  for I := 0 to FFormations.Count - 1 do
  begin

    fm := FFormations.Items[I];
    if fm.FFormation_Def.Formation_Index = aIndex then
    begin
      Result := True;
      FFormations.Delete(I);

      DeleteFormation(fm);
      Break;
    end;
  end;
end;

function TFormationManager.RemoveFormationMember(formation: TFormationRefine;
  aInstIndex: integer): Boolean;
begin
  result := False;

  if Assigned(formation) then
  begin
    formation.RemoveMemberByIndex(aInstIndex);
    Result := True;
  end;
end;

procedure TFormationManager.SetManager(amanager : TObject);
begin
  manager := TT3SimManager(aManager);
end;

end.
