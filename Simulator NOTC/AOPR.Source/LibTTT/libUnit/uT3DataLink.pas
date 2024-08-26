unit uT3DataLink;

interface

uses
  Windows, Classes, uT3Unit, uT3Sensor, uSnapshotData, tttData;

type

  TParticipatingUnitStatus  = (pusTransmitReceive, pusReceive, pusOff);
  TEliglibelUnitStatus      = (eusDamage, eusBandIncompatible, eusEligible);
  TOnDatalinkPoolRequest    = procedure(Sender : TObject; PooledPlatformID : Integer) of object;

  TT3DLParticipatingUnitItem = class
  private
    FPUStatus   : TParticipatingUnitStatus;
    FPUNumber   : integer;
    FPUPlatform : TT3PlatformInstance;
    FPUNetCenter: Boolean;

    procedure SetPUStatus(const Value: TParticipatingUnitStatus);
    procedure SetPUNumber(const Value: integer);
    procedure SetPUPlatform(const Value: TT3PlatformInstance);
    procedure SetPUNetCenter(const Value: Boolean);

  public
    property PUStatus   : TParticipatingUnitStatus read FPUStatus write SetPUStatus default pusTransmitReceive;
    property PUNumber   : integer read FPUNumber write SetPUNumber;
    property PUPlatform : TT3PlatformInstance read FPUPlatform write SetPUPlatform;
    property PUNetCenter: Boolean read FPUNetCenter write SetPUNetCenter default false;
  end;

  TT3DLEligibleUnitItem = class
  private
    FEUStatus: TEliglibelUnitStatus;
    FEUPlatform: TT3PlatformInstance;
    procedure SetEUStatus(const Value: TEliglibelUnitStatus);
    procedure SetEUPlatform(const Value: TT3PlatformInstance);
  public
    property EUStatus   : TEliglibelUnitStatus read FEUStatus write SetEUStatus default eusEligible;
    property EUPlatform : TT3PlatformInstance read FEUPlatform write SetEUPlatform;
  end;

  TT3DLNCSTrackEntityItem = class
  private
    FNEILastUpdateTime: TTIme;
    FNEITrackID   : integer;
    FNEIOwner     : integer;
    procedure SetNEIOwner(const Value: integer);
    procedure SetNEITrackID(const Value: integer);
  public
    property NEIOwnerID : integer read FNEIOwner write SetNEIOwner;
    property NEITrackID : integer read FNEITrackID write SetNEITrackID;
    property NEILastUpdateTime : TTIme read FNEILastUpdateTime;
  end;

  TT3DataLink = class(TT3Sensor)
  private
    FGroupForce         : Integer;
    FBandType           : Integer;
    FEligibleUnits      : TList;   //list Platform
    FParticipatingUnits : TList;   //list Platform
    FNCSEntityItems     : TThreadList;   //List tracks on NCS
    FStatus             : Boolean; {active or inactive}
    FPlayed             : Boolean; {play or stop}
    FLastPUNumber       : integer;
    FHasNCS             : Boolean;
    //EMCON PU n NCS
    {$IFDEF SERVER}
    FPUEMCONActivated   : Boolean;
    {$ENDIF}
    FNCSEMCONActivated  : Boolean;

    FPoolDelay          : double;
    FUpdatePools        : double;
    FIDLink             : Integer;

    FOnDatalinkPoolRequest: TOnDatalinkPoolRequest;
    //EMCON PU n NCS
    FOnPUDatalinkEMCON    : TOnDatalinkPoolRequest;
    FOnNCSDatalinkEMCON   : TNotifyEvent;

    FOnDatalinkOffline    : TNotifyEvent;
    FOnDatalinkOnline     : TNotifyEvent;
    FOnDatalinkTrackUpdate: TNotifyEvent;

    {$IFDEF SERVER}
    FProcessPoolPUIndex   : integer;
    function NextProcessPoolPU : TT3DLParticipatingUnitItem ;
    function GetNCSPU     : TT3DLParticipatingUnitItem;
    {$ENDIF}

    //function LowPUNUmber  : Integer;
    //function HighPUNumber : Integer;
    procedure SetOnRequestPoolDatalink(const Value: TOnDatalinkPoolRequest);
    procedure SetIDLink(const Value: Integer);
    procedure SetPlayed(const value : boolean);

    procedure ClearNCSEntitiesOwnBy(aPUID : Integer);
    function  getEntityOwner(aEntityID : Integer) : TT3DLNCSTrackEntityItem;
    procedure SetOnDatalinkOffline(const Value: TNotifyEvent);
    procedure SetOnDatalinkOnline(const Value: TNotifyEvent);
    procedure SetOnDatalinkTrackUpdate(const Value: TNotifyEvent);

    //EMCON PU n NCS
    procedure SetOnPUDatalinkEMCON(const Value: TOnDatalinkPoolRequest);
    procedure SetOnNCSDatalinkEMCON(const Value: TNotifyEvent);

  protected
    FOnUpdated          : TNotifyEvent;

  public
    constructor Create; override;
    destructor Destroy; override;

    function GetSnapshotData : _SS_TT3DataLink ;
    procedure SetSnapshotData(const ss : _SS_TT3DataLink);

    procedure AddEligibleUnit(aPlatform: TT3PlatformInstance);
    procedure AddParticipatingUnit(var aPlatform: TT3PlatformInstance);
    procedure RemoveEligibleUnit(aPlatform: TT3PlatformInstance);
    procedure RemoveParticipatingUnit(var aPlatform: TT3PlatformInstance);
    procedure SetNCSPlatform(aPlatform : TT3PlatformInstance; bValue : boolean);
    function  GetNCSPlatform : TT3PlatformInstance;
    procedure AddNCSEntities(aPUID : integer; arrValue : array of integer);
    procedure RemoveNCSEntities(aPUID : Integer);
    procedure SetParticipatingUnitStatus(aPlatform : TT3PlatformInstance;aStatus : TParticipatingUnitStatus);
    function  ParticipatingUnit(aPlatform : TT3PlatformInstance ) : boolean;
    function  EliglibelUnit(aPlatform : TT3PlatformInstance ) : boolean;
    function  ParticipatingUnitNumberExist(aNumber : integer) : boolean;
    procedure SetParticipatingUnitNumber(aPlatform : TT3PlatformInstance;aNumber : integer);
    procedure ClearParticipatingUnits;
    procedure ClearEligibleUnits;
    procedure ClearNCSEntities;
    function  GetPU(aPUNumber : integer): TT3DLParticipatingUnitItem;
    function  GetPUByInstanceIndex(aIndex : integer): TT3DLParticipatingUnitItem;
    function  getNCSEntitiesCount : integer;
    function  getNCSEntity(index : integer) : TT3DLNCSTrackEntityItem;
    { fungsi untuk ambil track yg didetek sama aPlatformID }
    function  getNCSEntityByPlatformIndex(aPlatformID : integer) : TStrings;
    { fungsi untuk ambil track berdasar track indexnya }
    function  getNCSEntityByIndex(aPlatformIndex : integer) : TT3DLNCSTrackEntityItem;
    function  RemoveDestroyedPlatform(aPlatform: TT3PlatformInstance) : boolean;

    {$IFDEF SERVER}
    function  Pooling(aDeltaMS : double) : boolean;
    procedure PoolProcess;
    {$ENDIF}

    procedure SetGroupForce(const value : Integer);
    procedure SetBandType(const value : Integer);
    procedure SetStatus(const value : boolean);
    procedure SetOnUpdated(const value : TNotifyEvent);

    property BandType       : Integer read FBandType write SetBandType default 1;
    property GroupForce     : Integer read FGroupForce write SetGroupForce;
    property EligibleUnits  : TList read FEligibleUnits;
    property IDLink         : Integer read FIDLink write SetIDLink;
    property ParticipatingUnits : TList read FParticipatingUnits;
    property Status : boolean read FStatus write SetStatus;
    property Played : Boolean read FPlayed write SetPlayed default False;
    property OnUpdated : TNotifyEvent read FOnUpdated write SetOnUpdated;

    property OnDatalinkPoolRequest : TOnDatalinkPoolRequest read FOnDatalinkPoolRequest write SetOnRequestPoolDatalink;
    property OnDatalinkOffline : TNotifyEvent read FOnDatalinkOffline write SetOnDatalinkOffline;
    property OnDatalinkOnline : TNotifyEvent read FOnDatalinkOnline write SetOnDatalinkOnline;
    property OnDatalinkTrackUpdate : TNotifyEvent read FOnDatalinkTrackUpdate write SetOnDatalinkTrackUpdate;

    //EMCON PU n NCS
    property OnNCSDatalinkEMCON : TNotifyEvent read FOnNCSDatalinkEMCON write SetOnNCSDatalinkEMCON;
    property OnPUDatalinkEMCON  : TOnDatalinkPoolRequest read FOnPUDatalinkEMCON write SetOnPUDatalinkEMCON;
  end;

const
  DSACTIVE   = True;
  DSINACTIVE = False;
  C_POOL_DELAY = 3.00;
  C_UPDATE_POOLS = C_POOL_DELAY + 3 { second };

implementation

uses uT3Vehicle, SysUtils, uBaseCoordSystem;

function ComparePUNumber(Item1, Item2: Pointer): Integer;
var
  PUNumber1, PUNumber2 : string;
begin
  PUNumber1 := IntToStr(TT3DLParticipatingUnitItem(Item1).PUNumber);
  PUNumber2 := IntToStr(TT3DLParticipatingUnitItem(Item2).PUNumber);

  Result := CompareText(PUNumber1,PUNumber2) ;
end;

constructor TT3DataLink.Create;
begin
  inherited; // sam.add 13.01.15
  FEligibleUnits      := TList.Create;
  FParticipatingUnits := TList.Create;
  FNCSEntityItems     := TThreadList.Create;
  FLastPUNumber := 0;
  FPoolDelay    := 0.00;
  FUpdatePools  := 0.00;
  FNCSEMCONActivated := False;
  //FPUEMCONActivated := False;

  {$IFDEF SERVER}
  FProcessPoolPUIndex   := 0;
  {$ENDIF}
end;

destructor TT3DataLink.Destroy;
begin
  FEligibleUnits.Free;
  FParticipatingUnits.Free;

  inherited; // sam.add 13.01.15
end;

function TT3DataLink.EliglibelUnit(aPlatform: TT3PlatformInstance): boolean;
var
  I : Integer;
  item : TT3DLEligibleUnitItem;
begin
  result := False;

  for I := 0 to EligibleUnits.Count - 1 do
  begin
    item :=  EligibleUnits.Items[i];

    result := item.FEUPlatform.Equals(aPlatform);
    if result then
      break;
  end;
end;

function TT3DataLink.getEntityOwner(aEntityID: Integer): TT3DLNCSTrackEntityItem;
var
  i : integer;
  item : TT3DLNCSTrackEntityItem;
begin
  result := nil;

  for i := 0 to getNCSEntitiesCount - 1 do
  begin
    item := getNCSEntity(i);
    if item.FNEITrackID = aEntityID then
    begin
      result := item;
      Break;
    end;
  end;
end;

function TT3DataLink.ParticipatingUnit(aPlatform: TT3PlatformInstance): boolean;
var
  I : Integer;
  item : TT3DLParticipatingUnitItem;
begin
  result := False;

  for I := 0 to ParticipatingUnits.Count - 1 do
  begin
    item :=  ParticipatingUnits.Items[i];

    result := item.FPUPlatform.Equals(aPlatform);
    if result then
      break;
  end;
end;

function TT3DataLink.ParticipatingUnitNumberExist(aNumber: integer): boolean;
var
  I : Integer;
  item : TT3DLParticipatingUnitItem;
begin
  result := False;

  for I := 0 to ParticipatingUnits.Count - 1 do
  begin
    item :=  ParticipatingUnits.Items[i];

    result := item.FPUNumber = aNumber;
    if result then
      break;
  end;
end;

{$IFDEF SERVER}
function TT3DataLink.Pooling(aDeltaMS: double) : boolean;
begin
  result := false;

  if not Played then
    exit;

  FPoolDelay := FPoolDelay + aDeltaMS;
  if FPoolDelay > C_POOL_DELAY then
  begin
    FPoolDelay := 0.00;

    { pool from participating unit }
    PoolProcess;

    result := True;
  end
  else
    result := false;
end;

procedure TT3DataLink.PoolProcess;
var
  NCSPu, PoolPu : TT3DLParticipatingUnitItem;
  bandCompatible : boolean;
  rangePU : double;
begin
  if not FHasNCS then
    exit;

  // find NGS platform
  NCSPu := GetNCSPU;
  if (not Assigned(NCSPu)) or (not Assigned(NCSPu.PUPlatform)) then
    Exit;

  if NCSPu.PUPlatform is TT3Vehicle then
  begin
    if (TT3Vehicle(NCSPu.PUPlatform).EMCON_HFDataLinkVehicle = EmconHFDatalinkOn) or
      (TT3Vehicle(NCSPu.PUPlatform).EMCON_UHFVHFDataLinkVehicle = EmconUHFVHFDatalinkOn) then
    begin
      // fired only once
      if not FNCSEMCONActivated then
      begin
        // clear ncs track
        ClearNCSEntities;

        // trigger event
        if Assigned(FOnNCSDatalinkEMCON) then
          FOnNCSDatalinkEMCON(Self);

        FNCSEMCONActivated := true;
      end;

      Exit;
    end
    else
      FNCSEMCONActivated := False;
  end;

  // cek NGS band compatible
  bandCompatible := (TT3Vehicle(NCSPu.PUPlatform).VehicleDefinition.FData.HF_Link_Capable)
                    and (BandType = 1);
  bandCompatible := bandCompatible
                   or (TT3Vehicle(NCSPu.PUPlatform).VehicleDefinition.FData.UHF_Link_Capable)
                   and (BandType = 2);

  if not bandCompatible then
    Exit;

  // cek NCS status
  if not (NCSPu.PUStatus = pusTransmitReceive) then
    Exit;

  // find participating unit
  PoolPu := NextProcessPoolPU;
  if (not Assigned(PoolPu)) or (not Assigned(PoolPu.PUPlatform)) then
    Exit;

  //  if PoolPu.Equals(NCSPu) then begin
  //    { broadcast own track }
  //    Exit;
  //  end;

  { periksa status PU,
    - transmit/receive  : request pool
    - receive : hanya nerima informasi saja
    - off : tidak aktif
  }

  if PoolPu.FPUStatus = pusTransmitReceive then
  begin
    { periksa datalink band }
    bandCompatible := (TT3Vehicle(PoolPu.PUPlatform).VehicleDefinition.FData.HF_Link_Capable)
                      and (BandType = 1);
    bandCompatible := bandCompatible
                      or (TT3Vehicle(PoolPu.PUPlatform).VehicleDefinition.FData.UHF_Link_Capable)
                      and (BandType = 2);

    if not bandCompatible then
      Exit;

    { communication or sensor damage then exit }
    if TT3Vehicle(NCSPu.PUPlatform).DamageSensor or
      TT3Vehicle(NCSPu.PUPlatform).DamageComm  then
      Exit;

    if TT3Vehicle(PoolPu.PUPlatform).DamageSensor or
      TT3Vehicle(PoolPu.PUPlatform).DamageComm  then
      Exit;
    { end comm and sensor damage check}

    { cek emcon status pada Participating Unit Platform}
    if (TT3Vehicle(PoolPu.PUPlatform).EMCON_HFDataLinkVehicle = EmconHFDatalinkOn)
      or (TT3Vehicle(PoolPu.PUPlatform).EMCON_UHFVHFDataLinkVehicle = EmconUHFVHFDatalinkOn) then
    begin
      // fired only once
      FPUEMCONActivated := (TT3Vehicle(PoolPu.PUPlatform).LastEMCON_HFDLink
                            = EmconHFDatalinkOn) or
                           (TT3Vehicle(PoolPu.PUPlatform).LastEMCON_UHFVHFDLink
                            = EmconUHFVHFDatalinkOn);

      if not FPUEMCONActivated then
      begin
        TT3Vehicle(PoolPu.PUPlatform).LastEMCON_HFDLink
                      := TT3Vehicle(PoolPu.PUPlatform).EMCON_HFDataLinkVehicle;
        TT3Vehicle(PoolPu.PUPlatform).LastEMCON_UHFVHFDLink
                      := TT3Vehicle(PoolPu.PUPlatform).EMCON_UHFVHFDataLinkVehicle;

        // remove track of participating unit
        RemoveNCSEntities(PoolPu.FPUPlatform.InstanceIndex);

        // trigger event
        if Assigned(FOnPUDatalinkEMCON) then
          FOnPUDatalinkEMCON(Self, PoolPu.FPUPlatform.InstanceIndex);
      end;

      // remove track of participating unit
      //RemoveNCSEntities(PoolPu.FPUPlatform.InstanceIndex);

      Exit;
    end
    else
    begin
      FPUEMCONActivated := (TT3Vehicle(PoolPu.PUPlatform).LastEMCON_HFDLink
                            = EmconHFDatalinkOff);
      if not FPUEMCONActivated then
      begin
        TT3Vehicle(PoolPu.PUPlatform).LastEMCON_HFDLink
                      := TT3Vehicle(PoolPu.PUPlatform).EMCON_HFDataLinkVehicle;
      end;
                            // and
      FPUEMCONActivated := (TT3Vehicle(PoolPu.PUPlatform).LastEMCON_UHFVHFDLink
                            = EmconUHFVHFDatalinkOff);
      if not FPUEMCONActivated then
      begin
        TT3Vehicle(PoolPu.PUPlatform).LastEMCON_UHFVHFDLink
                      := TT3Vehicle(PoolPu.PUPlatform).EMCON_UHFVHFDataLinkVehicle;
      end;
    end;
    { end cek emcon status }

    { check HF, UHF platform range to NCS platform }
    rangePU := CalcRange(NCSPu.PUPlatform.PosX, NCSPu.PUPlatform.PosY,
                         PoolPu.PUPlatform.PosX, PoolPu.PUPlatform.PosY );
    case BandType of
      // HF
      1 :
      begin
        if rangePU > GameDefaults.FData.Max_HF_Detect_Range then
          Exit;
      end;
      // UHF
      2 :
      begin
        if rangePU > GameDefaults.FData.Max_UHF_Detect_Range then
          Exit;
      end
      else
      begin
      // unknown band
        Exit;
      end;
    end;
    { end check HF, UHF platform range to NCS platform }

    { if everythink ok, then request pool sensor }
    if Assigned(FOnDatalinkPoolRequest) then
    begin
      FOnDatalinkPoolRequest(Self, PoolPu.FPUPlatform.InstanceIndex);
    end;
  end;
end;

function TT3DataLink.NextProcessPoolPU: TT3DLParticipatingUnitItem;
var
  item : TT3DLParticipatingUnitItem;
begin
  result := nil;

  if ParticipatingUnits.Count = 0 then
    Exit;

  if FProcessPoolPUIndex > ParticipatingUnits.Count - 1 then
    FProcessPoolPUIndex := 0;

  item := ParticipatingUnits.Items[FProcessPoolPUIndex];
  FProcessPoolPUIndex := FProcessPoolPUIndex + 1;

  Result := item;
end;
{$ENDIF}

function TT3DataLink.getNCSEntitiesCount: integer;
var
  l : TList;
begin
  try
    l := FNCSEntityItems.LockList;
    result := l.Count;
  finally
    FNCSEntityItems.UnlockList;
  end;
end;

function TT3DataLink.getNCSEntity(index : integer): TT3DLNCSTrackEntityItem;
var
  l : TList;
begin
  try
    l := FNCSEntityItems.LockList;

    if (index > l.Count - 1) then
      result := nil
    else
      Result := l.Items[index];
  finally
    FNCSEntityItems.UnlockList;
  end;
end;

function TT3DataLink.getNCSEntityByIndex(
  aPlatformIndex: integer): TT3DLNCSTrackEntityItem;
var
  l : TList;
  i : Integer;
  item : TT3DLNCSTrackEntityItem;
begin
  result := nil;

  try
    l := FNCSEntityItems.LockList;

    for i := 0 to l.Count - 1 do
    begin
      item := TT3DLNCSTrackEntityItem(l.Items[i]);
      if item.NEITrackID = aPlatformIndex then
      begin
        result := item;
        Break;
      end;
    end;

  finally
    FNCSEntityItems.UnlockList;
  end;
end;

function TT3DataLink.getNCSEntityByPlatformIndex(
  aPlatformID: integer): TStrings;
var
  l : TList;
  i : Integer;
  item : TT3DLNCSTrackEntityItem;
begin
  result := nil;

  if not Assigned(Result) then
    result := TStringList.Create;

  try
    l := FNCSEntityItems.LockList;

    for i := 0 to l.Count - 1 do
    begin
      item := TT3DLNCSTrackEntityItem(l.Items[i]);
      if item.NEIOwnerID = aPlatformID then
      begin
        result.Add(IntToStr(item.NEITrackID));
      end;
    end;

  finally
    FNCSEntityItems.UnlockList;
  end;
end;

procedure TT3DataLink.AddEligibleUnit(aPlatform: TT3PlatformInstance);
var
  I : Integer;
  found : Boolean;
  item : TT3DLEligibleUnitItem;
  bandCompatible : boolean;
begin
  found := False;

  for I := 0 to EligibleUnits.Count - 1 do
  begin
    item := EligibleUnits.Items[I];
    if item.EUPlatform.Equals(aPlatform) then
      found := True;
  end;

  if found then
    Exit;

  item := TT3DLEligibleUnitItem.Create;
  item.EUPlatform := aPlatform;
  item.EUStatus   := eusEligible;

  if (aPlatform is TT3Vehicle) then
  begin

    if TT3Vehicle(aPlatform).DamageSensor or
      TT3Vehicle(aPlatform).DamageComm  then
      item.EUStatus := eusDamage
    else
    begin
      { cek band compatibility }
      bandCompatible := (TT3Vehicle(aPlatform).VehicleDefinition.FData.HF_Link_Capable) and (BandType = 1);
      bandCompatible := bandCompatible or
        (TT3Vehicle(aPlatform).VehicleDefinition.FData.UHF_Link_Capable) and (BandType = 2);

      if not bandCompatible then
        item.EUStatus := eusBandIncompatible
    end;
  end;

  EligibleUnits.Add(item);
end;

procedure TT3DataLink.AddNCSEntities(aPUID : integer; arrValue: array of integer);
var
  i,j : integer;
  item : TT3DLNCSTrackEntityItem;
  list,l : TList;
  found : boolean;
begin
  list := TList.Create;
  for I := 0 to getNCSEntitiesCount - 1 do
  begin
    item := getNCSEntity(i);
    if item.FNEIOwner = aPUID then
      list.Add(item);
  end;

  for I := list.Count - 1 downto 0 do
  begin
    item := list.Items[i];
    found := false;

    for j := 0 to Length(arrValue) - 1 do
    begin
      if arrValue[j] = 0 then
        Break;

      found := item.FNEITrackID = arrValue[j];
      if found then break;
    end;

    if not found then
    begin
      list.Delete(i);
      FNCSEntityItems.Remove(item);
    end;
  end;

  list.Free;

  for I := 0 to Length(arrValue) - 1 do
  begin
    if arrValue[i] = 0 then Exit;

    item := getEntityOwner(arrValue[i]);

    { change entiy owner }
    if Assigned(item) then
      item.FNEIOwner := aPUID
    { create new entity}
    else
    begin
      item := TT3DLNCSTrackEntityItem.Create;
      item.FNEITrackID := arrValue[i];
      item.FNEIOwner   := aPUID;

      try
        l := FNCSEntityItems.LockList;
        l.Add(item);
      finally
        FNCSEntityItems.UnlockList;
      end;
    end;
  end;
end;

procedure TT3DataLink.AddParticipatingUnit(var aPlatform: TT3PlatformInstance);
var
  I : Integer;
  found : Boolean;
  item : TT3DLParticipatingUnitItem;
begin
  found := False;

  // max 64 units allowed
  if ParticipatingUnits.Count > 64 then
    Exit;

  for I := 0 to ParticipatingUnits.Count - 1 do
  begin
    item := ParticipatingUnits.Items[I];
    if item.FPUPlatform.Equals(aPlatform) then
    begin
      found := True;
    end;
  end;

  if found then
    Exit;

  if not (aPlatform is TT3Vehicle) then
    Exit;

  FLastPUNumber := FLastPUNumber + 1;

  item := TT3DLParticipatingUnitItem.Create;
  item.FPUNumber    := FLastPUNumber;
  item.FPUPlatform  := aPlatform;

  ParticipatingUnits.Add(item);
end;

function TT3DataLink.RemoveDestroyedPlatform(
  aPlatform: TT3PlatformInstance): boolean;
var
  i : integer;
  eu : TT3DLEligibleUnitItem;
  pu : TT3DLParticipatingUnitItem;
begin
  result := false;

  { search eliglible }
  if EligibleUnits.Count >= 0 then
  begin
    for I := EligibleUnits.Count - 1 downto 0 do
    begin
      eu := EligibleUnits.Items[I];
      if aPlatform.Equals(eu.EUPlatform) then
      begin
        EligibleUnits.Delete(I);
        result := true;

        FreeAndNil(eu);

        Break;
      end;
    end;
  end;

  if result then
    exit;

  { search participant unit }
  if ParticipatingUnits.Count >= 0 then
  begin
    for I := ParticipatingUnits.Count - 1 downto 0 do
    begin
      pu := ParticipatingUnits.Items[I];
      if aPlatform.Equals(pu.PUPlatform) then
      begin
        ParticipatingUnits.Delete(I);
        result := true;

//        {$IFDEF SERVER}
        { if NCS then offline datalink }
        if pu.PUNetCenter then
        begin
          Played := false;
        end;
//        {$ENDIF}

        FreeAndNil(pu);
        Break;
      end;
    end;
  end;
end;

procedure TT3DataLink.RemoveEligibleUnit(aPlatform: TT3PlatformInstance);
var
  I: Integer;
  item : TT3DLEligibleUnitItem;
begin
  if EligibleUnits.Count <= 0 then
    Exit;

  for I := EligibleUnits.Count - 1 downto 0 do
  begin
    item := EligibleUnits.Items[I];
    if aPlatform.Equals(item.EUPlatform) then
    begin
      EligibleUnits.Delete(I);
      Break;
    end;
  end;
end;

procedure TT3DataLink.RemoveNCSEntities(aPUID: Integer);
var
  l : Tlist;
  item : TT3DLNCSTrackEntityItem;
  i : integer;
begin
  try
    l := FNCSEntityItems.LockList;
    for i := l.Count - 1  downto 0 do
    begin
      item := TT3DLNCSTrackEntityItem(l.Items[i]);
      if item.FNEIOwner = aPUID then
      begin
        l.Delete(i);
        FreeAndNil(item);
      end;
    end;
  finally
    FNCSEntityItems.UnlockList;
  end;
end;

procedure TT3DataLink.RemoveParticipatingUnit(var aPlatform: TT3PlatformInstance);
var
  I: Integer;
  item : TT3DLParticipatingUnitItem;
begin
  if ParticipatingUnits.Count <= 0 then
    Exit;

  for I := ParticipatingUnits.Count - 1 downto 0 do
  begin
    item := ParticipatingUnits.Items[I];
    if item.FPUPlatform.Equals(aPlatform) then
    begin
      ParticipatingUnits.Delete(I);
      Break;
    end;
  end;
end;

procedure TT3DataLink.ClearEligibleUnits;
var
  i : integer;
  item : TT3DLEligibleUnitItem;
begin
  for I := EligibleUnits.Count - 1 downto 0 do
  begin
    item := EligibleUnits.Items[i];
    item.Free;

    EligibleUnits.Delete(i);
  end;

  EligibleUnits.Clear;
end;

procedure TT3DataLink.ClearNCSEntitiesOwnBy(aPUID: Integer);
var
  i : Integer;
  item : TT3DLNCSTrackEntityItem;
  l : TList;
begin
  try
    l := FNCSEntityItems.LockList;

    for I := l.Count - 1 downto 0 do
    begin
      item := l.Items[i];

      if item.FNEIOwner = aPUID then
      begin
        item.Free;
        l.Delete(i);
      end;
    end;
  finally
    FNCSEntityItems.UnlockList;
  end;
end;

procedure TT3DataLink.ClearNCSEntities;
var
  i : Integer;
  item : TObject;
  l : TList;
begin
  try
    l := FNCSEntityItems.LockList;

    for I := l.Count - 1 downto 0 do
    begin
      item := l.Items[i];
      item.Free;

      l.Delete(i);
    end;

    l.Clear;
  finally
    FNCSEntityItems.UnlockList;
  end;
end;

procedure TT3DataLink.ClearParticipatingUnits;
var
  i : integer;
  item : TT3DLParticipatingUnitItem;
begin
  for I := ParticipatingUnits.Count - 1 downto 0 do
  begin
    item := ParticipatingUnits.Items[i];
    item.Free;

    ParticipatingUnits.Delete(i);
  end;

  ParticipatingUnits.Clear;
  FLastPUNumber := 0;
end;

procedure TT3DataLink.SetNCSPlatform(aPlatform : TT3PlatformInstance; bValue : boolean);
var
  I: Integer;
  item : TT3DLParticipatingUnitItem;
begin
  ClearNCSEntities;
  for I := 0 to FParticipatingUnits.Count - 1 do
  begin
    item := FParticipatingUnits.Items[I];

    if item.FPUPlatform.Equals(aPlatform) then begin
      item.FPUNetCenter := bValue;
      FHasNCS := bValue;
    end
    else
      item.FPUNetCenter := false;
  end;
end;

procedure TT3DataLink.SetGroupForce(const value : Integer);
begin
  FGroupForce := value;
end;

procedure TT3DataLink.SetIDLink(const Value: Integer);
begin
  FIDLink := Value;
end;

procedure TT3DataLink.SetBandType(const value : Integer);
var
  i : integer;
  item : TT3DLEligibleUnitItem;
  bandCompatible : boolean;
begin
  FBandType := value;

  for i := EligibleUnits.Count - 1 downto 0 do
  begin
    item := EligibleUnits.Items[i];

    if not Assigned(item.EUPlatform) then begin
      item.Free;
      EligibleUnits.Delete(i);
      Continue;
    end;

    if (item.FEUPlatform is TT3Vehicle) then
    begin
      item.EUStatus := eusEligible;

      if TT3Vehicle(item.FEUPlatform).DamageSensor or
        TT3Vehicle(item.FEUPlatform).DamageComm  then
      begin
        item.EUStatus := eusDamage;
      end
      else
      begin
        { cek band compatibility }
        bandCompatible := (TT3Vehicle(item.FEUPlatform).VehicleDefinition.FData.HF_Link_Capable) and (BandType = 1);
        bandCompatible := bandCompatible or
          (TT3Vehicle(item.FEUPlatform).VehicleDefinition.FData.UHF_Link_Capable) and (BandType = 2);

        if not bandCompatible then
          item.EUStatus := eusBandIncompatible
      end;
    end;
  end;
end;

procedure TT3DataLink.SetStatus(const value : boolean);
begin
  FStatus := value;
end;

procedure TT3DataLink.SetParticipatingUnitNumber(aPlatform: TT3PlatformInstance;
  aNumber: integer);
var
  i : integer;
  item : TT3DLParticipatingUnitItem;
begin

  for i := 0 to ParticipatingUnits.Count - 1 do
  begin
    item := ParticipatingUnits.Items[i];
    if item.PUPlatform.Equals(aPlatform) then
    begin
      item.PUNumber := aNumber;
      break;
    end;
  end;

  // resort
  ParticipatingUnits.Sort(@ComparePUNumber);
end;

procedure TT3DataLink.SetParticipatingUnitStatus(aPlatform: TT3PlatformInstance;
  aStatus: TParticipatingUnitStatus);
var
  i : integer;
  item : TT3DLParticipatingUnitItem;
begin
  for i := 0 to ParticipatingUnits.Count - 1 do
  begin
    item := ParticipatingUnits.Items[i];
    if item.PUPlatform.Equals(aPlatform) then
    begin
      item.PUStatus := aStatus;

      case aStatus of
        pusReceive: ClearNCSEntitiesOwnBy(item.FPUPlatform.InstanceIndex);
        pusOff: ClearNCSEntitiesOwnBy(item.FPUPlatform.InstanceIndex);
      end;

      break;
    end;
  end;
end;

procedure TT3DataLink.SetPlayed(const value : boolean);
begin
  FPlayed := value;
  ClearNCSEntities;

  if not Value then
  begin
    if Assigned(FOnDatalinkOffline) then
      FOnDatalinkOffline(Self);
  end else begin
    if Assigned(FOnDatalinkOnline) then
      FOnDatalinkOnline(Self);
  end;
end;

procedure TT3DataLink.SetOnNCSDatalinkEMCON(const Value: TNotifyEvent);
begin
  FOnNCSDatalinkEMCON := Value;
end;

procedure TT3DataLink.SetOnPUDatalinkEMCON(const Value: TOnDatalinkPoolRequest);
begin
  FOnPUDatalinkEMCON := Value;
end;

procedure TT3DataLink.SetOnDatalinkOffline(const Value: TNotifyEvent);
begin
  FOnDatalinkOffline := Value;
end;

procedure TT3DataLink.SetOnDatalinkOnline(const Value: TNotifyEvent);
begin
  FOnDatalinkOnline := Value;
end;

procedure TT3DataLink.SetOnDatalinkTrackUpdate(const Value: TNotifyEvent);
begin
  FOnDatalinkTrackUpdate := Value;
end;

procedure TT3DataLink.SetOnRequestPoolDatalink(
  const Value: TOnDatalinkPoolRequest);
begin
  FOnDatalinkPoolRequest := Value;
end;

procedure TT3DataLink.SetOnUpdated(const value : TNotifyEvent);
begin
  FOnUpdated := value;
end;

function TT3DataLink.GetNCSPlatform: TT3PlatformInstance;
var
  I: Integer;
  item : TT3DLParticipatingUnitItem;
begin
  result := nil;
  for I := 0 to FParticipatingUnits.Count - 1 do
  begin
    item := FParticipatingUnits.Items[I];

    if item.FPUNetCenter then begin
      result := item.PUPlatform;
      break;
    end;
  end;
end;

{$IFDEF SERVER}
function TT3DataLink.GetNCSPU: TT3DLParticipatingUnitItem;
var
  i : integer;
  item : TT3DLParticipatingUnitItem;
begin
  result := nil;

  for i := 0 to ParticipatingUnits.Count - 1 do
  begin
    item := ParticipatingUnits.Items[i];

    if item.FPUNetCenter then
    begin
      result := item;
      break;
    end;
  end;
end;
{$ENDIF}

function TT3DataLink.GetPU(aPUNumber : integer): TT3DLParticipatingUnitItem;
var
  i : integer;
  item : TT3DLParticipatingUnitItem;
begin
  result := nil;

  for i := 0 to ParticipatingUnits.Count - 1 do
  begin
    item := ParticipatingUnits.Items[i];
    if item.PUNumber = aPUNumber then
    begin
      result := item;
      break;
    end;
  end;
end;

function TT3DataLink.GetPUByInstanceIndex(
  aIndex: integer): TT3DLParticipatingUnitItem;
var
  i : integer;
  item : TT3DLParticipatingUnitItem;
begin
  result := nil;

  for i := 0 to ParticipatingUnits.Count - 1 do
  begin
    item := ParticipatingUnits.Items[i];
    if item.FPUPlatform.InstanceIndex = aIndex then
    begin
      result := item;
      break;
    end;
  end;
end;

function TT3DataLink.GetSnapshotData : _SS_TT3DataLink ;
var
  i  : integer ;
  ss :  _SS_TT3DataLink ;
  Participant : TT3DLParticipatingUnitItem;
  Eligible : TT3DLEligibleUnitItem;
  p  : TT3PlatformInstance;
begin
  ss.S := TT3Sensor(Self).GetSnapshotData;
  ss.BandType := BandType ;
  ss.GroupForce := GroupForce ;
  SetLength(ss.EligibleUnits,EligibleUnits.Count);

  for i := 0 to EligibleUnits.Count - 1 do
  begin
     Eligible := EligibleUnits.Items[I];
     p := Eligible.EUPlatform;

     if p <> nil then
      ss.EligibleUnits[i] := p.FPIData.Platform_Instance_Index ;
  end;
  SetLength(ss.ParticipatingUnits,ParticipatingUnits.Count);
  for i := 0 to ParticipatingUnits.Count - 1 do begin
     Participant := ParticipatingUnits.Items[I];
     p := Participant.FPUPlatform;

     if p <> nil then
       ss.ParticipatingUnits[i] := p.FPIData.Platform_Instance_Index ;
  end;
  ss.Status := Status;
  ss.Played := Played;
  //ss.OnUpdated : TNotifyEvent ;
  Result := ss ;
end;

//function TT3DataLink.HighPUNumber: Integer;
//var
//  i, value : integer;
//  item : TT3DLParticipatingUnitItem;
//begin
//  value := 0;
//  for I := 0 to ParticipatingUnits.Count - 1 do begin
//    item := ParticipatingUnits.Items[i];
//    if value < item.PUNumber then
//      value := item.PUNumber;
//  end;
//  result := value;
//end;

//function TT3DataLink.LowPUNUmber: Integer;
//var
//  i, value : integer;
//  item : TT3DLParticipatingUnitItem;
//begin
//  value := 100;
//  for I := 0 to ParticipatingUnits.Count - 1 do begin
//    item := ParticipatingUnits.Items[i];
//    if value > item.PUNumber then
//      value := item.PUNumber;
//  end;
//  result := value;
//end;

procedure TT3DataLink.SetSnapshotData(const ss : _SS_TT3DataLink);
begin
  TT3Sensor(Self).SetSnapshotData(ss.S);
  BandType := ss.BandType ;
  GroupForce := ss.GroupForce ;
  Status := ss.Status;
  Played := ss.Played;
end;

{ TT3DLParticipatingUnit }

procedure TT3DLParticipatingUnitItem.SetPUNetCenter(const Value: Boolean);
begin
  FPUNetCenter := Value;
end;

procedure TT3DLParticipatingUnitItem.SetPUNumber(const Value: integer);
begin
  FPUNumber := Value;
end;

procedure TT3DLParticipatingUnitItem.SetPUPlatform(
  const Value: TT3PlatformInstance);
begin
  FPUPlatform := Value;
end;

procedure TT3DLParticipatingUnitItem.SetPUStatus(
  const Value: TParticipatingUnitStatus);
begin
  FPUStatus := Value;
end;

{ TT3DLEliglibelUnitItem }

procedure TT3DLEligibleUnitItem.SetEUPlatform(
  const Value: TT3PlatformInstance);
begin
  FEUPlatform := Value;
end;

procedure TT3DLEligibleUnitItem.SetEUStatus(const Value: TEliglibelUnitStatus);
begin
  FEUStatus := Value;
end;

{ TT3DLNCSTrackEntityItem }

procedure TT3DLNCSTrackEntityItem.SetNEIOwner(const Value: integer);
begin
  FNEIOwner := Value;
end;

procedure TT3DLNCSTrackEntityItem.SetNEITrackID(const Value: integer);
begin
  FNEITrackID := Value;
end;

end.
