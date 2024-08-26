unit uRecorder;

interface

uses
  Windows, uThreadTimer, Classes, uSteppers, Sysutils, uSRRFunction,
  uLibSettingTTT, DB, uDataModuleTTT, ZDataset;

type

  TWriterState = (wsWrite, wsIdle);
  TReaderState = (rdReading, rdEnd);

  TOnReaderFrameNotify = procedure (const aEventID : Int64; const aTick : Int64;aStreamData : TStream) of object;
  TOnReaderTickNotify = procedure (const aEventID : Int64; const aTick : Int64) of object;


  TDBObjectWriter = class

  private

    FQueueList  : TThreadList;
    FRRunner     : TMSTimer;
    FDelayedRun : TDelayer;
    FRecordIndex: integer;
    FWriterState: TWriterState;
    FDataModule : TdmTTT;
    FQueueNo    : LongInt;

    procedure OnRunnerNotify(const dt : Double);
    procedure OnDelayedNotify(Sender : TObject);

    procedure SaveObject(obj : TStoredObject);
    procedure SetRecordIndex(const Value: integer);
    procedure AddObject(obj : TStoredObject);

  public
    constructor Create(DM : TdmTTT);
    destructor Destroy; override;

    procedure WriteData(apRec: PAnsiChar ; const aGameTime: LongWord; const aGameSpeed: double;
                  const EventID: Int64);
    procedure InitiateWriter(recordName:string;scenarioIndex : integer;
      gameTime : TDateTime);
    procedure FinishWriter(gameTime : TDateTime);

    property RecordIndex : integer read FRecordIndex write SetRecordIndex;
    property WriterState : TWriterState read FWriterState;
  end;

  TDBObjectReader = class
  private

    FRecordList : TZQuery;
    FDataModule : TdmTTT;
    FOnReaderFrameNotify: TOnReaderFrameNotify;
    FReaderState: TReaderState;
    FOnReaderEnd: TNotifyEvent;
    FReplayName : String;
    FOnReaderTickNotify: TOnReaderTickNotify;

    FRecordStart, FRecordStop : TDateTime;

    procedure SetOnReaderFrameNotify(const Value: TOnReaderFrameNotify);
    procedure SetReaderState(const Value: TReaderState);
    procedure SetOnReaderEnd(const Value: TNotifyEvent);
    procedure SetOnReaderTickNotify(const Value: TOnReaderTickNotify);
  public
    constructor Create(DM : TdmTTT);
    destructor Destroy; override;

    function InitiateReader(recordName:string) : boolean;
    procedure ResetReader;
    procedure PlayNextFrames(const aTick : Int64);
    property ReaderState : TReaderState read FReaderState write SetReaderState;

    property OnReaderFrameNotify : TOnReaderFrameNotify read FOnReaderFrameNotify write SetOnReaderFrameNotify;
    property OnReaderEnd : TNotifyEvent read FOnReaderEnd write SetOnReaderEnd;
    property OnReaderTickNotify : TOnReaderTickNotify read FOnReaderTickNotify write SetOnReaderTickNotify;
    property ReplayName : string read FReplayName;
    property RecordStart : TDateTime read FRecordStart;
    property RecordStop : TDateTime read FRecordStop;

  end;

implementation

uses  uGameData_TTT, uCommonLogReplay, uNetSessionData, uVirtualTime;

const
  C_MAX_QUEUE = 100;

{ TDBObjectWriter }

procedure TDBObjectWriter.AddObject(obj: TStoredObject);
begin
  with FQueueList.LockList do
    Add(obj);

  FQueueList.UnlockList;

end;

constructor TDBObjectWriter.Create;
begin
  FDataModule := DM;

  FQueueList := TThreadList.Create;

  FRRunner := TMSTimer.Create;
  FRRunner.OnRunning := OnRunnerNotify;
  FRRunner.Enabled := True;

  FDelayedRun := TDelayer.Create;
  FDelayedRun.DInterval := 0.1; // sec
  FDelayedRun.OnTime := OnDelayedNotify;
  FDelayedRun.Enabled := True;

  FWriterState := wsIdle;
  FQueueNo := 0;

end;

destructor TDBObjectWriter.Destroy;
begin
  FDataModule := nil;

  FRRunner.Enabled := False;
  FRRunner.OnRunning := nil;

  FDelayedRun.Enabled := False;
  FDelayedRun.OnTime := nil;

  FDelayedRun.Free;
//  FRRunner.Free;

  FQueueList.Free;

  inherited;
end;

procedure TDBObjectWriter.FinishWriter(gameTime: TDateTime);
begin
  FDataModule.updateRecTimeStop(FRecordIndex,gameTime);
end;

procedure TDBObjectWriter.InitiateWriter;
begin

  // new data record
  FRecordIndex :=  FDataModule.newRecord(scenarioIndex,recordName,gameTime);

end;

procedure TDBObjectWriter.OnDelayedNotify;
var
  obj : TStoredObject;
begin
  with FQueueList.LockList do
    if Count > 0 then
    begin
      FWriterState := wsWrite;

      obj := items[0];

      SaveObject(obj);

      if Assigned(obj.FStreamData) then
        obj.FStreamData.Free;

      obj.Free;
      Delete(0);

    end
    else
      FWriterState := wsIdle;

  FQueueList.UnlockList;

end;

procedure TDBObjectWriter.OnRunnerNotify(const dt: Double);
begin

  FDelayedRun.Run(dt);

end;

procedure TDBObjectWriter.SaveObject(obj : TStoredObject);
begin

  if Assigned(obj) then
  begin
    inc(FQueueNo);

    if Assigned(FDataModule) then
      FDataModule.recordFrame( FRecordIndex, obj.FTick, obj.FRecordType, obj.FStreamData,FQueueNo);
  end;

end;

procedure TDBObjectWriter.SetRecordIndex(const Value: integer);
begin
  FRecordIndex := Value;
end;

procedure TDBObjectWriter.WriteData(apRec: PAnsiChar; const aGameTime: LongWord;
  const aGameSpeed: double; const EventID: Int64);
var
  storedObject                     : TStoredObject;
  rCmd_Platform                    : TRecCmd_Platform;
  rCmd_Set_LauncherQty             : TRecCmd_Set_LauncherQty;
  rCmd_ModeEmcon                   : TRecCmd_ModeEmcon ;
  rCmd_Set_Quantity                : TRecCmd_Set_Quantity;
  rCmd_Set_Status                  : TRecCmd_Set_Status;
  rCmd_Platform_MOVE               : TRecCmd_Platform_MOVE;
  rCmd_EngageTrack                 : TRecCmd_EngageTrack;
  rRadarNoiseJammer                : TrecRadarNoiseJammer;
  rCmd_Sensor                      : TRecCmd_Sensor ;
  rCmd_SensorIFF                   : TRecCmd_SensorIFF;
  rCmd_Embark                      : TRecCmd_Embark ;
  rCmdSYNCH                        : TRecCmdSYNCH;
  rCmd_LaunchMissile               : TRecCmd_LaunchMissile;
  rCmd_GunFire                     : TRecCmd_GunFire ;
  rCmd_GameCtrl                    : TRecCmd_GameCtrl;
  rTCP_Request                     : TRecTCP_Request;
  rCmd_LaunchRP                    : TRecCmd_LaunchRP;
  rCmd_LaunchNonRP                 : TRecCmd_LaunchNonRP;

  rCmd_OverlayTemplate             : TRecCmd_OverlayTemplate;
  rCmd_OverlayStaticShape          : TRecCmd_OverlayStaticShape;
  rCmd_PlottingShape               : TRecCmd_PlottingShape;
  rCmd_ShipingRoute                : TRecCmd_ShipingRoute;
  rCmd_Change_Logistic             : TRecCmd_Change_Logistic;
  rCmd_State_Logistic              : TRecCmd_State_Logistic;
  rCmd_RampController              : TRecCmd_RampController;
  rCmd_Transport                   : TRecCmd_Transport;

  rCmd_OverlayDynamicTrack         : TRecCmd_OverlayDynamicTrack;
  rCmd_SelectPlatformToRemove      : TRecCmd_SelectPlatformToRemove ;
  rCmd_Platform_SET_PROPERTY       : TRecCmd_Platform_SET_PROPERTY ;
  rCmd_NRP_SET_PROPERTY            : TRecCmd_NRP_SET_PROPERTY ;
  rCmd_ESM_SET_PROPERTY            : TRecCmd_ESM_SET_PROPERTY;
  rCmd_Platform_Repair             : TRecCmd_Platform_Repair ;
  rCmd_MergeTrack                  : TRecCmd_MergeTrack;
  rCmd_DataLink                    : TRecCmd_DataLink;
  rCmd_DataLink_AddTrack           : TRecCmd_DataLink_AddTrack;
  rCmd_FC                          : TRecCmd_FC;
  rCmd_Embark_Landing              : TRecCmd_Embark_Landing;
  rCmd_Platform_CHANGE_TRACKNUMBER : TRecCmd_Platform_CHANGE_TRACKNUMBER ;
  rCmd_FiringModeWeapon            : TRecFiringModeWeapon;
  rEngagementModeWeapon            : TRecEngagementModeWeapon;
  rCmd_LaunchChaff                 : TRecCmd_LaunchChaff;
  rCmd_LaunchChaffState            : TRecCmd_LaunchChaffState;
  rCmd_ChaffLauncherProperties     : TRecCmd_ChaffLauncherProperties;
  rCmd_LaunchBomb                  : TRecCmd_LaunchBomb;
  rCmd_LaunchMine                  : TRecCmd_LaunchMine;
  rCmd_Sync_Hit_BombMine           : TRecCmd_Sync_Hit_BombMine;
  rSinc_Waypoint                   : TrecSinc_Waypoint;
  rSinc_RBLW                       : TrecSinc_RBLW;
  rSinc_BOLW                       : TrecSinc_BOLW;
  rMissile_envi                    : TrecMissile_envi;
  rSinc_Envi                       : TrecSinc_Envi;
  r_CubAssign                      : TRecCubAssign ;
  rCmd_GameSetting                 : TRecCmd_GameSetting;
  r_MapData                        : TRec_MapData ;
  r_PlatformHitPlatform            : TRecPlatformHitPlatform;
  r_WeaponOut                      : TRecWeaponOut;
  r_PlatformHancur                 : TRecPlatformHancur;
  r_ModifComm                      : TRecModifComm;
  rCmd_DataLink_RemoveTrack        : TrecCmd_DataLink_RemoveTrack;
  rCmd_TargetIFF                   : TRecCmd_TargetIFF ;
  rVectac                          : TRecVectac;
  rCmd_OverlayDynamicShape         : TRecCmd_OverlayDynamicShape;
  rCmd_FreeMePlatform              : TRecPlatformFreeMe;
  rTorpedoPanelWeapon              : TRecTorpedoPanelWeapon;
  recSync                          : TRecSyncPos;
  rIFFSearchMode                   : TRecCmd_IFFSearchMode;
  rCmdDecoys                       : TRecCmdDecoys;
  rCmd_LaunchSonobuoy              : TRecCmd_LaunchSonobuoy;
  RCmd_LogisticRoute               : TRecCmd_LogisticRoute;

//  RCmd_Plotting                    : TRecCmd_Plotting;
  rCmd_TransferSonobuoy            : TRecCmd_TransferSonobuoy;
  rCmd_LastUpdatePlatform          : TRecCmd_LastUpdatePlatform;
  rPlatformGroupChange             : TRecPlatformGroupChange;
  rPersonel_Move                   : TRec_Personel_Move;
  rDetectability                   : TRecDetectability;
  rEditFormation                   : TRecEditFormation;
  rRecordVoice                     : TRecRecordVoice;
  rECMCommand                      : TRecECMCommand;
  rSyncTarget                      : TRec_SyncTarget;
  rCmd_UpdateActualCable           : TRecCmd_UpdateActualCable;
  rCmd_UpdateSonar                 : TRecCmd_UpdateSonar;
  rMineProperty                    : TRecMineProperty;
  rBombProperty                    : TRecBombProperty;
  rTorpedoProperty                 : TRecTorpedoProperty;
  rBombPanelWeapon                 : TRecBombPanelWeapon;

  rCmd_Change_SystemState          : TRecCmd_Change_SystemState;
  rCmd_EsmVariance                 : TRecCmd_EsmVariance;
  rUDP_PlatformMovement            : TRecUDP_PlatformMovement;
  rCmdMultiMode                    : TRecCmdMultiMode;
  rSendMessage                     : TRecSendMessage;
begin
  if EventID = -1 then
    Exit;

  storedObject := TStoredObject.Create;
  with storedObject do
  begin
    FTick         := aGameTime;
    FRecordType   := EventID;
  end;

  case EventID of
    CPID_REC_MESSAGE : {86}
    begin
      CopyMemory(@rSendMessage, apRec, CONST_SZOFR_SendMessage);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rSendMessage,CONST_SZOFR_SendMessage) ;
    end;

    CPID_CMD_MULTI_MODE : {85}
    begin
      CopyMemory(@rCmdMultiMode, apRec, CONST_SZOFR_CmdMultiMode);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmdMultiMode,CONST_SZOFR_CmdMultiMode) ;
    end;

    CPID_SYNCH_POS_VBS : {84}
    begin
      CopyMemory(@rUDP_PlatformMovement, apRec, CONST_SZOFR_UDP_PlatformMovement);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rUDP_PlatformMovement,CONST_SZOFR_UDP_PlatformMovement) ;
    end;

    CPID_SYNC_TARGET : {60}
    begin
      CopyMemory(@rSyncTarget, apRec, CONST_SZOFR_SyncTarget);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rSyncTarget,CONST_SZOFR_SyncTarget) ;
    end;

    CPID_CMD_ECM : {61}
    begin
      CopyMemory(@rSyncTarget, apRec, CONST_SZOFR_ECMCommand);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rSyncTarget,CONST_SZOFR_ECMCommand) ;
    end;

    CPID_CMD_RECORDTRACK : {67}
    begin
      CopyMemory(@rRecordVoice, apRec, CONST_SZOFR_RecordVoice);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rRecordVoice,CONST_SZOFR_RecordVoice) ;
    end;

    CPID_EDIT_FORMATION : {79}
    begin
      CopyMemory(@rEditFormation, apRec, CONST_SZOFR_EditFormation);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rEditFormation,CONST_SZOFR_EditFormation) ;
    end;

    CPID_EDIT_DETECTABILITY : {80}
    begin
      CopyMemory(@rDetectability, apRec, CONST_SZOFR_Detectability);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rDetectability,CONST_SZOFR_Detectability) ;
    end;

    CPID_CMD_PERSONEL_MOVE : {81}
    begin
      CopyMemory(@rPersonel_Move, apRec, CONST_SZOFR_Personel_Move);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rPersonel_Move,CONST_SZOFR_Personel_Move) ;
    end;

    CPID_CMD_UPDATE_ACTUAL_CABLE : {59}
    begin
      CopyMemory(@rCmd_UpdateActualCable, apRec, CONST_SZOFR_Cmd_UpdateActualCable);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_UpdateActualCable,CONST_SZOFR_Cmd_UpdateActualCable) ;
    end;

    CPID_CMD_UPDATE_SONAR : {58}
    begin
      CopyMemory(@rCmd_UpdateSonar, apRec, CONST_SZOFR_Cmd_UpdateSonar);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_UpdateSonar,CONST_SZOFR_Cmd_UpdateSonar) ;
    end;

    CPID_BOMB_SYNC_PANEL_WEAPON : {49}
    begin
      CopyMemory(@rBombPanelWeapon, apRec, CONST_SZOFR_BombPanelWeapon);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rBombPanelWeapon,CONST_SZOFR_BombPanelWeapon) ;
    end;

    CPID_TORPEDO_PROPERTY : {50}
    begin
      CopyMemory(@rTorpedoProperty, apRec, CONST_SZOFR_TorpedoProperty);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rTorpedoProperty,CONST_SZOFR_TorpedoProperty) ;
    end;

    CPID_BOMB_PROPERTY : {51}
    begin
      CopyMemory(@rBombProperty, apRec, CONST_SZOFR_BombProperty);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rBombProperty,CONST_SZOFR_BombProperty) ;
    end;

    CPID_MINE_PROPERTY : {52}
    begin
      CopyMemory(@rMineProperty, apRec, CONST_SZOFR_MineProperty);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rMineProperty,CONST_SZOFR_MineProperty) ;
    end;

    CPID_CMD_CHANGE_SYSTEMSTATE : {46}
    begin
      CopyMemory(@rCmd_Change_SystemState, apRec, CONST_SZOFR_Cmd_Change_SystemState);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_Change_SystemState,CONST_SZOFR_Cmd_Change_SystemState) ;
    end;

    CPID_CMD_SYNC_ESM_VARIANCE : {45}
    begin
      CopyMemory(@rCmd_EsmVariance, apRec, CONST_SZOFR_Cmd_EsmVariance);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_EsmVariance,CONST_SZOFR_Cmd_EsmVariance) ;
    end;

    CPID_CMD_PLAT_GROUP_CHANGE : {44}
    BEGIN
      CopyMemory(@rPlatformGroupChange, apRec, CONST_SZOFR_PlatformGroupChange);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rPlatformGroupChange,CONST_SZOFR_PlatformGroupChange) ;
    END;

    CPID_LASTUPDATE_PLATFORM : {41}
    begin
      CopyMemory(@rCmd_LastUpdatePlatform, apRec, CONST_SZOFR_Cmd_LastUpdatePlatform);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_LastUpdatePlatform,CONST_SZOFR_Cmd_LastUpdatePlatform) ;
    end;

    CPID_CMD_TRANSFER_SONOBUOY : {33}
    begin
      CopyMemory(@rCmd_TransferSonobuoy, apRec, CONST_SZOFR_Cmd_TransferSonobuoy);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_TransferSonobuoy,CONST_SZOFR_Cmd_TransferSonobuoy) ;
    end;

    CPID_CMD_DELETE_OVERLAY : {32}
    begin
//      CopyMemory(@rCmd_DeleteOverlay, apRec, CONST_SZOFR_Cmd_DeleteOverlay);
//      storedObject.FStreamData := TMemoryStream.Create;
//      storedObject.FStreamData.Write(rCmd_DeleteOverlay,CONST_SZOFR_Cmd_DeleteOverlay) ;
    end;

//    CPID_CMD_PLOTTING : {29}
//    begin
//      CopyMemory(@RCmd_Plotting, apRec, CONST_SZOFR_rCmd_Plotting);
//      storedObject.FStreamData := TMemoryStream.Create;
//      storedObject.FStreamData.Write(RCmd_Plotting,CONST_SZOFR_rCmd_Plotting) ;
//    end;



//    CPID_CMD_LOGISTICROUTE : {27}
//    BEGIN
//      CopyMemory(@RCmd_LogisticRoute, apRec, CONST_SZOFR_Cmd_LogisticRoute);
//      storedObject.FStreamData := TMemoryStream.Create;
//      storedObject.FStreamData.Write(RCmd_LogisticRoute,CONST_SZOFR_Cmd_LogisticRoute) ;
//
//    END;

    CPID_CMD_LAUNCH_SONOBUOY : {21}
    begin
      CopyMemory(@rCmd_LaunchSonobuoy, apRec, CONST_SZOFR_Cmd_LaunchSonobuoy);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_LaunchSonobuoy,CONST_SZOFR_Cmd_LaunchSonobuoy) ;
    end;

    CPID_CMD_DECOYS : {16}
    begin
      CopyMemory(@rCmdDecoys, apRec, CONST_SZOFR_CmdDecoys);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmdDecoys,CONST_SZOFR_CmdDecoys) ;
    end;

    CPID_CHAFF_PROPERTY : {14}
    begin
      CopyMemory(@rCmd_LaunchChaffState, apRec, CONST_SZOFR_Cmd_LaunchChaffState);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_LaunchChaffState,CONST_SZOFR_Cmd_LaunchChaffState) ;
    end;

    CPID_IFF_MODE_SEARCH : {4}
    begin
      CopyMemory(@rIFFSearchMode, apRec, CONST_SZOFR_Cmd_IFFSearchMode);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rIFFSearchMode,CONST_SZOFR_Cmd_IFFSearchMode) ;
    end;

    CPID_SYNC_OBJECT : {82}
    begin
      CopyMemory(@recSync, apRec, CONST_SZOFR_SyncObject);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(recSync,CONST_SZOFR_SyncObject) ;

    end;
    CPID_CMD_OVERLAYDYNAMICSHAPE : {31}
    begin
      CopyMemory(@rCmd_OverlayDynamicShape, apRec, CONST_SZOFR_Cmd_OverlayDynamicShape);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_OverlayDynamicShape,SizeOf(rCmd_OverlayDynamicShape)) ;
    end;
    CPID_CMD_VECTAC : {43}
    begin
      CopyMemory(@rVectac, apRec, CONST_SZOFR_Vectac);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rVectac,SizeOf(rVectac)) ;
    end;
    CPID_CMD_TARGET_IFF : {3}
    begin
      CopyMemory(@rCmd_TargetIFF, apRec, CONST_SZOFR_Cmd_TargetIFF);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_TargetIFF,SizeOf(rCmd_TargetIFF)) ;
    end;

    CPID_CMD_DATALINK_REMOVETRACK : {55}
    begin
      CopyMemory(@rCmd_DataLink_RemoveTrack, apRec, CONST_SZOFR_Cmd_DataLink_RemoveTrack);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_DataLink_RemoveTrack,SizeOf(rCmd_DataLink_RemoveTrack)) ;
    end;
    CPID_CMD_MODIF_COMM: {42}
    begin
      CopyMemory(@r_ModifComm, apRec, CONST_SZOFR_ModifComm);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(r_ModifComm,SizeOf(r_ModifComm)) ;
    end;
    CPID_CMD_PLATFORM_HANCUR : {57}
    begin
      CopyMemory(@r_PlatformHancur, apRec, CONST_SZOFR_PlatformHancur);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(r_PlatformHancur,SizeOf(r_PlatformHancur)) ;
    end;
    CPID_CMD_WEAPON_OUT : {57}
    begin
      CopyMemory(@r_WeaponOut, apRec, CONST_SZOFR_WeaponOut);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(r_WeaponOut,SizeOf(r_WeaponOut)) ;
    end;
    CPID_CMD_SYNC_HIT_MINE_BOMB : {54}
    begin
      CopyMemory(@rCmd_Sync_Hit_BombMine, apRec, CONST_SZOFR_Sync_Hit_BombMine);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_Sync_Hit_BombMine,SizeOf(rCmd_Sync_Hit_BombMine)) ;
    end;
    CPID_CMD_PLATFORM_HIT_PLATFORM: {56}
    begin
      CopyMemory(@r_PlatformHitPlatform, apRec, CONST_SZOFR_PlatformHitPlatform);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(r_PlatformHitPlatform,SizeOf(r_PlatformHitPlatform)) ;
    end;
    {CPID_CMD_MAPS :
    begin
      CopyMemory(@r_MapData, apRec, CONST_SZOFR_MapData);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(r_MapData,SizeOf(r_MapData)) ;
    end;}
    CPID_PLATFORM_FREEME : {53}
    begin
      CopyMemory(@rCmd_FreeMePlatform, apRec, CPID_PLATFORM_FREEME);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_FreeMePlatform,SizeOf(rCmd_FreeMePlatform)) ;
    end;
    CPID_GAME_SETTING : {15}
    begin
      CopyMemory(@rCmd_GameSetting, apRec, CONST_SZOFR_Cmd_GameSetting);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_GameSetting,SizeOf(rCmd_GameSetting)) ;
    end;
    CPID_TORPEDO_SYNC_PANEL_WEAPON : {48}
    begin
      CopyMemory(@rTorpedoPanelWeapon, apRec, CONST_SZOFR_Torpedo_Sync_Panel);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rTorpedoPanelWeapon, SizeOf(rTorpedoPanelWeapon));
    end;
    CPID_CMD_LAUNCH_TORPEDO :{10}
    begin
      CopyMemory(@rCmd_LaunchMissile, apRec, CONST_SZOFR_Cmd_LaunchMissile);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_LaunchMissile,SizeOf(rCmd_LaunchMissile)) ;
    end;

    CPID_CMD_LAUNCHER_CHAFF_PROPS : {13}
    begin
      CopyMemory(@rCmd_ChaffLauncherProperties, apRec, CONST_SZOFR_Cmd_ChaffLauncherProperties);

      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_ChaffLauncherProperties,SizeOf(rCmd_ChaffLauncherProperties)) ;
    end;

    CPID_CMD_LAUNCHER_CHAFF_STATE : {12}
    begin
      CopyMemory(@rCmd_LaunchChaffState, apRec, CONST_SZOFR_Cmd_LaunchChaffState);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_LaunchChaffState,SizeOf(rCmd_LaunchChaffState)) ;
    end;
    CPID_CMD_LAUNCH_CHAFF :{11}
    begin
      CopyMemory(@rCmd_LaunchChaff, apRec, CONST_SZOFR_Cmd_LaunchChaff);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_LaunchChaff,SizeOf(rCmd_LaunchChaff)) ;
    end;
    {CPID_CUBICLEASSIGN :
    begin
      CopyMemory(@r_CubAssign, apRec, CONST_SZOF_CubAssign);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(r_CubAssign,SizeOf(r_CubAssign)) ;
    end;}
    CPID_CMD_ENVI : {68}
    begin
      CopyMemory(@rSinc_Envi, apRec, CONST_SZOFR_Sinc_Envi);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rSinc_Envi,SizeOf(rSinc_Envi)) ;
    end;
    CPID_CMD_Missile_Envi : {66}
    begin
      CopyMemory(@rMissile_envi, apRec, CONST_SZOFR_Missile_envi);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rMissile_envi,SizeOf(rMissile_envi)) ;
    end;
    CPID_SincBOLW : {65}
    begin
      CopyMemory(@rSinc_BOLW, apRec, CONST_SZOFR_Sinc_BOLW);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rSinc_BOLW,SizeOf(rSinc_BOLW)) ;
    end;
    CPID_SincRBLW : {64}
    begin
      CopyMemory(@rSinc_RBLW, apRec, CONST_SZOFR_Sinc_RBLW);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rSinc_RBLW,SizeOf(rSinc_RBLW)) ;
    end;
    CPID_SincWaypoint : {63}
    begin
      CopyMemory(@rSinc_Waypoint, apRec, CONST_SZOFR_Sinc_Waypoint);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rSinc_Waypoint,SizeOf(rSinc_Waypoint)) ;
    end;
    CPID_CMD_LAUNCH_MINES : {20}
    begin
      CopyMemory(@rCmd_LaunchMine, apRec, CONST_SZOFR_Cmd_LaunchMine);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_LaunchMine,SizeOf(rCmd_LaunchMine)) ;
    end;
    CPID_CMD_LAUNCH_BOMB : {21}
    begin
      CopyMemory(@rCmd_LaunchBomb, apRec, CONST_SZOFR_Cmd_LaunchBomb);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_LaunchBomb,SizeOf(rCmd_LaunchBomb)) ;
    end;
    CPID_CMD_LAUNCHER_BUBBLE_PROPS : {18}
    begin
      CopyMemory(@rCmd_ChaffLauncherProperties, apRec, CONST_SZOFR_Cmd_ChaffLauncherProperties);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_ChaffLauncherProperties,SizeOf(rCmd_ChaffLauncherProperties)) ;
    end;

    CPID_CMD_LAUNCHER_BUBBLE_STATE : {19}
    begin
      CopyMemory(@rCmd_LaunchChaffState, apRec, CONST_SZOFR_Cmd_LaunchChaffState);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_LaunchChaffState,SizeOf(rCmd_LaunchChaffState)) ;
    end;

    CPID_CMD_LAUNCH_BUBBLE : {17}
    begin
      CopyMemory(@rCmd_LaunchChaff, apRec, CONST_SZOFR_Cmd_LaunchChaff);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_LaunchChaff,SizeOf(rCmd_LaunchChaff)) ;
    end;

    CPID_CMD_ENGAGEMENTMODE : {9}
    begin
      CopyMemory(@rEngagementModeWeapon, apRec, CONST_SZOFR_EngagementModeWeapon);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rEngagementModeWeapon,SizeOf(rEngagementModeWeapon)) ;
    end;

    CPID_CMD_FIRINGMODE : {8}
    begin
      CopyMemory(@rCmd_FiringModeWeapon, apRec, CONST_SZOFR_Cmd_FiringModeWeapon);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_FiringModeWeapon,SizeOf(rCmd_FiringModeWeapon)) ;
    end;

    CPID_CMD_CHANGE_TRACK_NUMBER : {36}
    begin
      CopyMemory(@rCmd_Platform_CHANGE_TRACKNUMBER, apRec, CONST_SZOFR_Cmd_Platform_CHANGE_TRACKNUMBER);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_Platform_CHANGE_TRACKNUMBER,SizeOf(rCmd_Platform_CHANGE_TRACKNUMBER)) ;
    end;

    CPID_CMD_EMBARK_LAND : {69}
    begin
      CopyMemory(@rCmd_Embark_Landing, apRec, CONST_SZOFR_Cmd_Embark_Landing);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_Embark_Landing,SizeOf(rCmd_Embark_Landing)) ;
    end;

    CPID_CMD_ASSIGN_FIRECONTROL : {40}
    begin
      CopyMemory(@rCmd_FC, apRec, CONST_SZOFR_Cmd_FC);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_FC,SizeOf(rCmd_FC)) ;
    end;

    CPID_CMD_DATALINK_ADDTRACK : {71}
    begin
      CopyMemory(@rCmd_DataLink_AddTrack, apRec, CONST_SZOFR_Cmd_DataLink_AddTrack);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_DataLink_AddTrack,SizeOf(rCmd_DataLink_AddTrack)) ;
    end;

    CPID_CMD_DATALINK : {70}
    begin
      CopyMemory(@rCmd_DataLink, apRec, CONST_SZOFR_Cmd_DataLink);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_DataLink,SizeOf(rCmd_DataLink)) ;
    end;

    CPID_CMD_MERGE_TRACK : {72}
    begin
      CopyMemory(@rCmd_MergeTrack, apRec, CONST_SZOFR_Cmd_MergeTrack);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_MergeTrack,SizeOf(rCmd_MergeTrack)) ;
    end;

    CPID_CMD_PLATFORM_REPAIR : {39}
    begin
      CopyMemory(@rCmd_Platform_Repair, apRec, CONST_SZOFR_Cmd_Platform_Repair);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_Platform_Repair,SizeOf(rCmd_Platform_Repair)) ;
    end;

    CPID_CMD_ESM_SET_PROPERTY : {38}
    begin
      CopyMemory(@rCmd_ESM_SET_PROPERTY, apRec, CONST_SZOFR_Cmd_ESM_SET_PROPERTY);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_ESM_SET_PROPERTY,SizeOf(rCmd_ESM_SET_PROPERTY)) ;
    end;

    CPID_CMD_UPDATE_NRP_PROPERTY : {37}
    begin
      CopyMemory(@rCmd_NRP_SET_PROPERTY, apRec, CONST_SZOFR_Cmd_NRP_SET_PROPERTY);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_NRP_SET_PROPERTY,SizeOf(rCmd_NRP_SET_PROPERTY)) ;
    end;

    CPID_CMD_UPDATE_PLATFORM_PROPERTY : {34}
    begin
      CopyMemory(@rCmd_Platform_SET_PROPERTY, apRec, CONST_SZOFR_Cmd_Platform_SET_PROPERTY);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_Platform_SET_PROPERTY,SizeOf(rCmd_Platform_SET_PROPERTY)) ;
    end;

    CPID_CMD_REMOVE_PLATFORM : {35}
    begin
      CopyMemory(@rCmd_SelectPlatformToRemove, apRec, CONST_SZOFR_Cmd_SelectPlatformToRemove);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_SelectPlatformToRemove,SizeOf(rCmd_SelectPlatformToRemove)) ;
    end;

    CPID_CMD_DYNAMIC_TRACK : {30}
    begin
      CopyMemory(@rCmd_OverlayDynamicTrack, apRec, CONST_SZOFR_Cmd_OverlayDynamicTrack);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_OverlayDynamicTrack,SizeOf(rCmd_OverlayDynamicTrack)) ;
    end;

    CPID_CMD_OVERLAYTEMPLATE : {26}
    begin
      CopyMemory(@rCmd_OverlayTemplate, apRec, CONST_SZOFR_Cmd_OverlayTemplate);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_OverlayTemplate,SizeOf(rCmd_OverlayTemplate)) ;
    end;

    CPID_CMD_OVERLAYSTATICSHAPE : {26}
    begin
      CopyMemory(@rCmd_OverlayStaticShape, apRec, CONST_SZOFR_Cmd_OverlayStaticShape);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_OverlayTemplate,SizeOf(rCmd_OverlayTemplate)) ;
    end;

    CPID_CMD_PLOTTINGSHAPE : {26}
    begin
      CopyMemory(@rCmd_PlottingShape, apRec, CONST_SZOFR_rCmd_PlottingShape);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_PlottingShape,SizeOf(rCmd_PlottingShape)) ;
    end;

    CPID_CMD_SHIPINGROUTE : {28}
    begin
      CopyMemory(@rCmd_ShipingRoute, apRec, CONST_SZOFR_Cmd_ShipingRoute);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_ShipingRoute,SizeOf(rCmd_ShipingRoute)) ;
    end;

    CPID_CMD_CHANGE_LOGISTIC : {47}
    begin
      CopyMemory(@rCmd_Change_Logistic, apRec, CONST_SZOFR_Cmd_Change_Logistic);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_Change_Logistic,SizeOf(rCmd_Change_Logistic)) ;
    end;

    CPID_CMD_LOGISTIC_STATUS : {47}
    begin
      CopyMemory(@rCmd_State_Logistic, apRec, CONST_SZOFR_Cmd_State_logistic);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_State_Logistic,SizeOf(rCmd_State_Logistic)) ;
    end;

    CPID_CMD_RAMP : {47}
    begin
      CopyMemory(@rCmd_RampController, apRec, CONST_SZOFR_Cmd_RampController);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_RampController,SizeOf(rCmd_RampController)) ;
    end;

    CPID_CMD_TRANSPORT : {47}
    begin
      CopyMemory(@rCmd_Transport, apRec, CONST_SZOFR_Cmd_Transport);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_Transport,SizeOf(rCmd_Transport)) ;
    end;

    CPID_CMD_LAUNCH_NON_RUNTIME_PLATFORM : {25}
    begin
      CopyMemory(@rCmd_LaunchNonRP, apRec, CONST_SZOFR_Cmd_LaunchNonRP);
      storedObject.FStreamData := TMemoryStream.Create;
      storedObject.FStreamData.Write(rCmd_LaunchNonRP,SizeOf(rCmd_LaunchNonRP)) ;
    end;

    CPID_CMD_LAUNCH_RUNTIME_PLATFORM :{24}
    begin
       CopyMemory(@rCmd_LaunchRP, apRec, CONST_SZOFR_Cmd_LaunchRP);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_LaunchRP,SizeOf(rCmd_LaunchRP)) ;
    end;
    {CPID_TCP_REQUEST :
    begin
       CopyMemory(@rTCP_Request, apRec, CONST_SZOFR_TCP_Request);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rTCP_Request,SizeOf(rTCP_Request)) ;
    end;}
    CPID_CMD_GAME_CTRL :{23}
    begin
       //CopyMemory(@rCmd_GameCtrl, apRec, CONST_SZOFR_Cmd_GameCtrl);

       //storedObject.FStreamData := TMemoryStream.Create;
       //storedObject.FStreamData.Write(rCmd_GameCtrl,SizeOf(rCmd_GameCtrl)) ;
    end;

    CPID_CMD_GUN_FIRE : {22}
    begin
       CopyMemory(@rCmd_GunFire, apRec, CONST_SZOFR_Cmd_GunFire);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_GunFire,SizeOf(rCmd_GunFire)) ;
    end;
    CPID_CMD_LAUNCH_MISSILE : {7}
    begin
       CopyMemory(@rCmd_LaunchMissile, apRec, CONST_SZOFR_Cmd_LaunchMissile);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_LaunchMissile,SizeOf(rCmd_LaunchMissile)) ;
    end;
    CPID_CMD_SYNCH :{83}
    begin
       CopyMemory(@rCmdSYNCH, apRec, CONST_SZOFR_CmdSYNCH);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmdSYNCH,SizeOf(rCmdSYNCH)) ;
    end;
    CPID_CMD_LAUNCH_EMBARK :{6}
    begin
       CopyMemory(@rCmd_Embark, apRec, CONST_SZOFR_Cmd_Embark);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_Embark,SizeOf(rCmd_Embark)) ;
    end;
    CPID_CMD_SENSOR_IFF : {5}
    begin
       CopyMemory(@rCmd_SensorIFF, apRec, CONST_SZOFR_Cmd_SensorIFF);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_SensorIFF,SizeOf(rCmd_SensorIFF)) ;
    end;
    CPID_CMD_SENSOR : {2}
    begin
       CopyMemory(@rCmd_Sensor, apRec, CONST_SZOFR_Cmd_Sensor);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_Sensor,SizeOf(rCmd_Sensor)) ;
    end;
    CPID_CMD_RADAR_NOISE_JAMMER : {62}
    begin
       CopyMemory(@rRadarNoiseJammer, apRec, CONST_SZOFR_RadarNoiseJammer);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rRadarNoiseJammer,SizeOf(rRadarNoiseJammer)) ;
    end;
    CPID_CMD_ENGAGE_TRACK : {73}
    begin
       CopyMemory(@rCmd_EngageTrack, apRec, CONST_SZOFR_Cmd_EngageTrack);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_EngageTrack,SizeOf(rCmd_EngageTrack)) ;
    end;
    CPID_CMD_PLATFORM_REPOS : {1}
    begin
       CopyMemory(@rCmd_Platform_MOVE, apRec, CONST_SZOFR_Cmd_Platform_MOVE);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_Platform_MOVE,SizeOf(rCmd_Platform_MOVE)) ;
    end;
    CPID_CMD_SET_STATUS : {77}
    begin
       CopyMemory(@rCmd_Set_Status, apRec, CONST_SZOFR_Cmd_Set_Status);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_Set_Status,SizeOf(rCmd_Set_Status)) ;
    end;
    CPID_CMD_SET_QUANTITY : {76}
    begin
       CopyMemory(@rCmd_Set_Quantity, apRec, CONST_SZOFR_Cmd_Set_Quantity);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_Set_Quantity,SizeOf(rCmd_Set_Quantity)) ;
    end;
    CPID_CMD_SET_LAUNCHERQTY : {75}
    begin
       CopyMemory(@rCmd_Set_LauncherQty, apRec, CONST_SZOFR_Cmd_Set_LauncherQty);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_Set_LauncherQty,SizeOf(rCmd_Set_LauncherQty)) ;
    end;
    CPID_CMD_EMCON_MODE : {78}
    begin
       CopyMemory(@rCmd_ModeEmcon, apRec, CONST_SZOFR_Cmd_ModeEmcon);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_ModeEmcon,SizeOf(rCmd_ModeEmcon)) ;
    end;
    CPID_CMD_PLATFORM : {74}
    begin
       CopyMemory(@rCmd_Platform, apRec, CONST_SZOFR_Cmd_Platform);

       storedObject.FStreamData := TMemoryStream.Create;
       storedObject.FStreamData.Write(rCmd_Platform,SizeOf(rCmd_Platform)) ;

    end;
  end;

  // stream exist
  if Assigned(storedObject.FStreamData) then
    AddObject(storedObject)
  else
    storedObject.Free;

end;

{ TDBObjectReader }

constructor TDBObjectReader.Create;
begin
  FDataModule := DM;
  FRecordList := TZQuery.Create(nil);
end;

destructor TDBObjectReader.Destroy;
begin
  FRecordList.Close;
  FRecordList.Free;

  inherited;
end;

function TDBObjectReader.initiateReader(recordName:string) : boolean;
begin
  Result := False;

  // fetch data records

  FRecordList.Close;
  FDataModule.getRecords(recordName,FRecordList);
  FDataModule.getRecordTime(recordName,FRecordStart,FRecordStop);

  if FRecordList.RecordCount > 0 then
  begin
    FReplayName := recordName;
    FRecordList.First;
    Result := True;
  end;
end;

procedure TDBObjectReader.PlayNextFrames(const aTick: Int64);
var
  CurrTick  : Int64;
  CurrRecType : integer;
  CurrBlobData : TStream;
  bf : TBlobField;
  vTime : TDateTime;
begin
  vTime := MillisecToDateTime2(aTick) + FRecordStart;

  if (FRecordList.Eof) and (vTime >= FRecordStop) then
  begin
    ReaderState := rdEnd;
    Exit;
  end;

  if FRecordList.Eof then
    Exit;

  CurrTick := FRecordList.FieldByName('Tick').AsLargeInt;

  while not FRecordList.Eof  do
  begin

    // iterate all frames on valid tick;

    if CurrTick <= aTick then
    begin

      CurrRecType := FRecordList.FieldByName('Record_Type').AsInteger;

      bf := FRecordList.FieldByName('BlobData') as TBlobField;
      CurrBlobData := FRecordList.CreateBlobStream(bf, bmRead) ;

      if Assigned(FOnReaderFrameNotify) then
        FOnReaderFrameNotify(CurrRecType,CurrTick, CurrBlobData);

      if Assigned(FOnReaderTickNotify) then
        FOnReaderTickNotify(CurrRecType,CurrTick);

      FRecordList.Next;

      if not FRecordList.Eof then
        CurrTick := FRecordList.FieldByName('Tick').AsLargeInt;

    end
    else
      Break;

  end;

end;

procedure TDBObjectReader.ResetReader;
begin

  FReaderState := rdReading;

  if FRecordList.RecordCount > 0 then
    FRecordList.First;
end;

procedure TDBObjectReader.SetOnReaderEnd(const Value: TNotifyEvent);
begin
  FOnReaderEnd := Value;
end;

procedure TDBObjectReader.SetOnReaderFrameNotify(
  const Value: TOnReaderFrameNotify);
begin
  FOnReaderFrameNotify := Value;
end;

procedure TDBObjectReader.SetOnReaderTickNotify(
  const Value: TOnReaderTickNotify);
begin
  FOnReaderTickNotify := Value;
end;

procedure TDBObjectReader.SetReaderState(const Value: TReaderState);
begin
  FReaderState := Value;

  if Value = rdEnd then
    if Assigned(FOnReaderEnd) then
      FOnReaderEnd(Self);

end;


end.
