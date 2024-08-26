unit uT3DatalinkManager;

interface
  uses uT3DataLink,uT3Unit,uT3UnitContainer,
    SysUtils, tttData, uDBGame_Defaults;

const
  C_DATALINK_ALLOWED = 3;
type

  TT3DatalinkManager = class
  private

    FDatalinks : array[0..C_DATALINK_ALLOWED - 1] of TT3DataLink;
    FSimPlatforms : TT3UnitContainer;

  protected

  public
    constructor Create;
    destructor Destroy; override;

    procedure AddParticipatingUnit(idxDLink : integer;aPUPlatform : TT3PlatformInstance);
    procedure RemoveParticipatingUnit(idxDLink : integer;aPUPlatform : TT3PlatformInstance);
    function RemoveDestroyedPlatform(aPUPlatform : TT3PlatformInstance) : boolean;

    procedure SetDataLinkForce(idxDLink : integer; idxForce : integer);
    procedure SetBandType(idxDLink : integer; idxBand : integer);
    procedure SetPlayed(idxDLink : integer; bPlayed : boolean);
    procedure SetNCSPlatform(idxDLink : integer;aPlatform : TT3PlatformInstance;bValue : boolean);
    procedure SetSimPlatforms(aList : TT3UnitContainer);
    procedure SetParticipatingUnitStatus(idxDLink : integer;aPlatform : TT3PlatformInstance;aStatus : Integer);
    procedure AddNCSEntityItems(idxDLink : integer;aPUID : Integer;arrTracks : array of integer);
    procedure SetGameDefaults(gameDef : TGame_Defaults);

    function IsDLPlayed(idxDLink : integer):Boolean;
    function getDatalink(idxDLink : integer):TT3DataLink;
    function getDatalinkOnPU(aPlatform : TT3PlatformInstance):TT3DataLink;
    
    procedure DatalinkTracksUpdate;

    {$IFDEF SERVER}
    procedure PoolDataLink(aDeltaMS : double);
    {$ENDIF}
  end;

implementation

uses uT3SimManager, uT3Vehicle;

{ TT3DatalinkManager }

procedure TT3DatalinkManager.AddParticipatingUnit(idxDLink: integer;
  aPUPlatform: TT3PlatformInstance);
var
  i : Integer;
begin
  if (idxDLink <= 0) or (idxDLink > C_DATALINK_ALLOWED) then
    Exit;

  FDatalinks[idxDLink - 1].AddParticipatingUnit(aPUPlatform);

  for I := 0 to C_DATALINK_ALLOWED - 1 do begin
    FDatalinks[i].RemoveEligibleUnit(aPUPlatform);
  end;
end;

constructor TT3DatalinkManager.Create;
var
  i : integer;
begin
  for I := 0 to C_DATALINK_ALLOWED - 1 do begin
    FDatalinks[i]               := TT3DataLink.Create;
    FDatalinks[i].InstanceName  := 'Datalink ' + IntToStr(i + 1);
    FDatalinks[i].IDLink        := I + 1;
    FDatalinks[i].BandType      := 1;
  end;
end;

procedure TT3DatalinkManager.DatalinkTracksUpdate;
var
  i : integer;
begin
  for I := 0 to C_DATALINK_ALLOWED - 1 do
  begin
    if Assigned(FDatalinks[i].OnDatalinkTrackUpdate) then
      FDatalinks[i].OnDatalinkTrackUpdate(FDatalinks[i]);
  end;
end;

destructor TT3DatalinkManager.Destroy;
var
  i : integer;
begin
  for I := 0 to C_DATALINK_ALLOWED - 1 do
    FDatalinks[i].Free;
end;

function TT3DatalinkManager.getDatalink(idxDLink: integer): TT3DataLink;
begin
  result := nil;

  if (idxDLink <= 0) or (idxDLink > C_DATALINK_ALLOWED) then
    Exit;

  result := FDatalinks[idxDLink - 1];
end;

function TT3DatalinkManager.getDatalinkOnPU(
  aPlatform: TT3PlatformInstance): TT3DataLink;
var
  i     :integer;
  found : Boolean;
begin
  result := nil;

  for i := 0 to C_DATALINK_ALLOWED - 1 do
  begin
    found := FDatalinks[i].ParticipatingUnit(aPlatform);

    if not found then
      found := FDatalinks[i].EliglibelUnit(aPlatform);

    if found then begin
      result := FDatalinks[i];
      break;
    end;
  end;
end;

function TT3DatalinkManager.IsDLPlayed(idxDLink: integer): Boolean;
begin
  Result := false;

  if (idxDLink <= 0) or (idxDLink > C_DATALINK_ALLOWED) then
    Exit;

  result := FDatalinks[idxDLink - 1].Played;
end;

function TT3DatalinkManager.RemoveDestroyedPlatform(aPUPlatform: TT3PlatformInstance) : boolean;
var
  found : boolean;
  i : integer;
begin
  for I := 0 to C_DATALINK_ALLOWED - 1 do
  begin
    found := FDatalinks[i].RemoveDestroyedPlatform(aPUPlatform);
    if found then
      Break;
  end;

  result := found;
end;

{$IFDEF SERVER}
procedure TT3DatalinkManager.PoolDataLink(aDeltaMS: double);
var
  i : integer;
begin
  for I := 0 to C_DATALINK_ALLOWED - 1 do
  begin
    FDatalinks[i].Pooling(aDeltaMS);
  end;
end;
{$ENDIF}

procedure TT3DatalinkManager.RemoveParticipatingUnit(idxDLink: integer;
  aPUPlatform: TT3PlatformInstance);
var
  i : integer;
  grpForce : integer;
begin
  if (idxDLink <= 0) or (idxDLink > C_DATALINK_ALLOWED) then
    Exit;

  grpForce := FDatalinks[idxDLink - 1].GroupForce;

  for I := 0 to C_DATALINK_ALLOWED - 1 do
    if FDatalinks[i].GroupForce = grpForce then
      FDatalinks[i].AddEligibleUnit(aPUPlatform);

  FDatalinks[idxDLink - 1].RemoveParticipatingUnit(aPUPlatform);
end;

procedure TT3DatalinkManager.SetBandType(idxDLink, idxBand: integer);
begin
  if (idxDLink <= 0) or (idxDLink > C_DATALINK_ALLOWED) then
    Exit;

  FDatalinks[idxDLink - 1].BandType := idxBand;
end;

procedure TT3DatalinkManager.SetDataLinkForce(idxDLink, idxForce: integer);
var
  i         : integer;
  aObject   : TObject;
  aPlatform : TT3Vehicle;
  datalink  : TT3DataLink;
begin
  if (idxDLink <= 0) or (idxDLink > C_DATALINK_ALLOWED) then
    Exit;

  if not Assigned(FSimPlatforms) then
    Exit;

  datalink := FDatalinks[idxDLink - 1];

  { jika ganti group maka semua participating unit dihapus }
  if datalink.GroupForce <> idxForce then
  begin
    if datalink.Played then begin
      datalink.Played := false;
    end;

    if datalink.ParticipatingUnits.Count > 0 then
      datalink.ClearParticipatingUnits;

    datalink.GroupForce := idxForce;
  end;

  { update eliglible units }
  datalink.ClearEligibleUnits;

  for I := 0 to FSimPlatforms.itemCount - 1 do
  begin
    aObject := FSimPlatforms.getObject(I);

    if aObject is TT3Vehicle then
    begin
      aPlatform := aObject as TT3Vehicle;
      if aPlatform.Force_Designation = idxForce then  begin
        { jika bukan PU datalink manapun bisa -> eliglible}
        if not Assigned(getDatalinkOnPU(aPlatform)) then
          datalink.AddEligibleUnit(aPlatform);
      end;
    end;
  end;
end;

procedure TT3DatalinkManager.SetGameDefaults(gameDef: TGame_Defaults);
var
  i     :integer;
begin
  for i := 0 to C_DATALINK_ALLOWED - 1 do
    FDatalinks[i].GameDefaults := gameDef;
end;

procedure TT3DatalinkManager.AddNCSEntityItems(idxDLink: integer; aPUID : Integer;
  arrTracks: array of integer);
begin
  if (idxDLink <= 0) or (idxDLink > C_DATALINK_ALLOWED) then
    Exit;

  // add to the NCS entities list
  FDatalinks[idxDLink - 1].AddNCSEntities(aPUID, arrTracks);

  // update (add or remove) datalink track from the list detected track
  if Assigned(FDatalinks[idxDLink - 1].OnDatalinkTrackUpdate) then
    FDatalinks[idxDLink - 1].OnDatalinkTrackUpdate(FDatalinks[idxDLink - 1]);
end;

procedure TT3DatalinkManager.SetNCSPlatform(idxDLink: integer;
  aPlatform: TT3PlatformInstance;bValue : boolean);
begin
  if (idxDLink <= 0) or (idxDLink > C_DATALINK_ALLOWED) then
    Exit;

  FDatalinks[idxDLink - 1].SetNCSPlatform(aPlatform, bValue);
end;

procedure TT3DatalinkManager.SetParticipatingUnitStatus(idxDLink: integer;
  aPlatform: TT3PlatformInstance; aStatus: Integer);
begin
  if (idxDLink <= 0) or (idxDLink > C_DATALINK_ALLOWED) then
    Exit;

  case aStatus of
    0 : FDatalinks[idxDLink - 1].SetParticipatingUnitStatus(aPlatform, pusTransmitReceive);
    1 : FDatalinks[idxDLink - 1].SetParticipatingUnitStatus(aPlatform, pusReceive);
    2 : FDatalinks[idxDLink - 1].SetParticipatingUnitStatus(aPlatform, pusOff);
  end;
end;

procedure TT3DatalinkManager.SetPlayed(idxDLink: integer; bPlayed: boolean);
begin
  if (idxDLink <= 0) or (idxDLink > C_DATALINK_ALLOWED) then
    Exit;

  FDatalinks[idxDLink - 1].Played := bPlayed;
end;

procedure TT3DatalinkManager.SetSimPlatforms(aList: TT3UnitContainer);
begin
  FSimPlatforms := aList;
end;

end.
