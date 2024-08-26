unit uNewLog;

  (*-------------------------------------------------------------------------
    --  Gamer Recorder and Replay for Air Defence System Simlulator        --
    -------------------------------------------------------------------------
    -- unit name     : uNewLog                                             --
    -- description   : Recorder Class                                      --
    -------------------------------------------------------------------------
    ..  First Created : 15 Maret 2005     ..
    ..  Finished      : 12 Mei   2005     ..
    ..  by            : andySu            ..
    ..  Edited        : Sam               ..
    ..  First Edited  : 27 April 2011     ..
    ..  Fin. Edited   : ........ 2011     ..
    ........................................
   *)


interface
uses
  Classes, Windows, SysUtils,
  tttData, uGameData_TTT, uSRRFunction,
  uCommonLogReplay, uTCPDatatype, uNetSessionData  ;

type

//---------------------------------------------------------------------------
(* -= TNewRecorder =-
    {  27 April 2011

       Log Base on Network Event  :

       AddDataToLogFrame(const aGameSpeed: double; const EventID: Int64)
       AddDataToLogEvent(apRec: PAnsiChar ; const aGameSpeed: double;
                                    const EventID: Int64)
    }
    { 10 Mei 2005
       + GameSpeed Finished

      06 Mei 2005
       + GameSpeed Started
    }
    { 12 April 2005
       + tambahan Scenario Info
    }
    { 17 Maret 2005
      * Release 0.1
      +
    }
    { 15 Maret 2005
      - pakai TTimer
      . Start
    }
    { Format File Replay:
      ScenarioName
      Z:\geoset\indonesia.gst
      replayData
      TimeStamp1 ac1data ac2data
      TimeStamp2 ac1data ac2data ac3data
    }
*)

//---------------------------------------------------------------------------
  TNewRecorder = class(TObject)
  private
  {TimeStamp}
    FFirstTick: LongWord;

  {FileHandling}
    FTemporaryName: string;
    FFileStream   : TFileStream;

  {RecordingStatus}
    FRecStatus : TRecorderStatus;

  {Header}

  {ScenarioInfo}
    FScenarioInfo     : TRecScenario_Definition;

  protected

  public
    constructor Create;
    destructor Destroy; override;

  {public_methods_File_Handling}
    procedure InitializedFileRecord(
      const aFileName: string; const aSceneInfo: TRecScenario_Definition);

    procedure SaveFileRecord(const aFNewName: string);

  {public_methods_DataLog}

    //procedure AddDataToLog(const aGameSpeed: double;  const aData: arrRecObjectData);

    procedure AddDataToLogFrame(const aGameTime: LongWord; const aGameSpeed: double;
                                    const EventID: Int64);

    procedure AddDataToLogEvent(apRec: PAnsiChar ; const aGameTime: LongWord; const aGameSpeed: double;
                                    const EventID: Int64);
  public
    property ScenarioInfo: TRecScenario_Definition read FScenarioInfo;
    property RecordingStatus: TRecorderStatus read FRecStatus;

  end;


implementation

{ TNewRecorder }

constructor TNewRecorder.Create;
begin
  FFileStream := nil;

  FRecStatus := rsCreated;
end;

destructor TNewRecorder.Destroy;
begin
  if FFileStream <> nil then FreeAndNil(FFileStream);
  inherited;
end;

//- {public_methods_File_Handling} ---------------------------------------------
//-

procedure TNewRecorder.InitializedFileRecord(
    const aFileName: string; const aSceneInfo: TRecScenario_Definition);
var
  pcWrite: PChar;
begin
  if FRecStatus = rsCreated then
  begin
    FScenarioInfo  := aSceneInfo;
    FTemporaryName := aFileName;

//    pcWrite := '  ';
    pcWrite := PChar(CONST_CRLF);

    FFileStream := TFileStream.Create(FTemporaryName, fmCreate);

    FFileStream.WriteBuffer(CONST_FileReplayCurrentVersion, SizeOf(TRecFileHeader));
    FFileStream.WriteBuffer(pcWrite^, Length(pcWrite));

    FFileStream.WriteBuffer(FScenarioInfo, SizeOf(TRecScenario_Definition));
    FFileStream.WriteBuffer(pcWrite^, Length(pcWrite));

    FRecStatus :=  rsInitialized;

  end
  else begin
  end;

end;

procedure TNewRecorder.SaveFileRecord(const aFNewName: string);
begin
  FreeAndNil(FFileStream);
  FRecStatus := rsCreated;

  if aFNewName <> '' then
    RenameFile(FTemporaryName, aFNewName);
end;

//- {public_methods_DataLog} ---------------------------------------------------
//-


{
procedure TNewRecorder.AddDataToLog(const aGameSpeed: double;
                                    const aData: arrRecObjectData);
var timeStamp: LongWord;
    gs: double;
    i, sz : integer;
    pcWrite: PChar;
    num : Word;
begin
  if FFileStream = nil then exit;

  if FRecStatus = rsInitialized then begin

    FFirstTick := GetTickCount;
    FRecStatus := rsRecording;
  end;

  if FRecStatus = rsRecording then begin
    timestamp := GetTickCount - FFirstTick;

    FFileStream.WriteBuffer(timeStamp, SizeOf(timeStamp));

    gs := aGameSpeed;

    if gs < CONST_MIN_GAMESPEED_MULTIPLIER then
      gs := CONST_MIN_GAMESPEED_MULTIPLIER;

    if gs > CONST_MAX_GAMESPEED_MULTIPLIER then
      gs := CONST_MAX_GAMESPEED_MULTIPLIER;

    FFileStream.WriteBuffer(gs, SizeOf(Word));

    num := Length(aData);
    FFileStream.WriteBuffer(Num, SizeOf(num));

    sz := SizeOf(TRecPlatformInstanceData);
    for i := 0 to High(aData) do begin
      FFileStream.WriteBuffer(aData[i] , sz);
    end;

    pcWrite := PChar(CONST_CRLF);
    FFileStream.WriteBuffer(pcWrite^, Length(pcWrite));
  end;

end;
}

procedure TNewRecorder.AddDataToLogFrame(
                                    const aGameTime: LongWord;
                                    const aGameSpeed: double;
                                    const EventID: Int64);
var timeStamp: LongWord;
    gs: double;
    //i, sz : integer;
    //pcWrite: PChar;
begin
  if FFileStream = nil then exit;

  if FRecStatus = rsInitialized then begin

    FFirstTick := aGameTime;
    FRecStatus := rsRecording;
  end;

  if FRecStatus = rsRecording then begin
    timestamp := aGameTime - FFirstTick;

    FFileStream.WriteBuffer(timeStamp, CONST_SZOF_LONGWORD);

    gs := aGameSpeed;

    if gs < CONST_MIN_GAMESPEED_MULTIPLIER then
      gs := CONST_MIN_GAMESPEED_MULTIPLIER;

    if gs > CONST_MAX_GAMESPEED_MULTIPLIER then
      gs := CONST_MAX_GAMESPEED_MULTIPLIER;

    FFileStream.WriteBuffer(gs, CONST_SZOF_WORD);

    FFileStream.WriteBuffer(eventID, CONST_SZOF_Int64);

  end;

end;

procedure TNewRecorder.AddDataToLogEvent(apRec: PAnsiChar ;
                                    const aGameTime: LongWord;
                                    const aGameSpeed: double;
                                    const EventID: Int64);
var
    pcWrite   : PChar;
    rCmd_Platform                 : TRecCmd_Platform;
    rCmd_Set_LauncherQty          : TRecCmd_Set_LauncherQty;
    rCmd_ModeEmcon                : TRecCmd_ModeEmcon ;
    rCmd_Set_Quantity             : TRecCmd_Set_Quantity;
    rCmd_Set_Status               : TRecCmd_Set_Status;
    rCmd_Platform_MOVE            : TRecCmd_Platform_MOVE;
    rCmd_EngageTrack              : TRecCmd_EngageTrack;
    rRadarNoiseJammer             : TrecRadarNoiseJammer;
    rCmd_Sensor                   : TRecCmd_Sensor ;
    rCmd_SensorIFF                : TRecCmd_SensorIFF;
    rCmd_Embark                   : TRecCmd_Embark ;
    rCmdSYNCH                     : TRecCmdSYNCH;
    rCmd_LaunchMissile            : TRecCmd_LaunchMissile;
    rCmd_GunFire                  : TRecCmd_GunFire ;
    rCmd_GameCtrl                 : TRecCmd_GameCtrl;
    rTCP_Request                  : TRecTCP_Request;
    rCmd_LaunchRP                 : TRecCmd_LaunchRP;
    rCmd_LaunchNonRP              : TRecCmd_LaunchNonRP;
    rCmd_OverlayTemplate          : TRecCmd_OverlayTemplate;
//    rCmd_GmbOverlayClient         : TRecCmd_GmbOverlayClient;
    rCmd_OverlayDynamicTrack      : TRecCmd_OverlayDynamicTrack;
    rCmd_SelectPlatformToRemove   : TRecCmd_SelectPlatformToRemove ;
    rCmd_Platform_SET_PROPERTY    : TRecCmd_Platform_SET_PROPERTY ;
    rCmd_NRP_SET_PROPERTY         : TRecCmd_NRP_SET_PROPERTY ;
    rCmd_ESM_SET_PROPERTY         : TRecCmd_ESM_SET_PROPERTY;
    rCmd_Platform_Repair          : TRecCmd_Platform_Repair ;
    rCmd_MergeTrack               : TRecCmd_MergeTrack;
    rCmd_DataLink                 : TRecCmd_DataLink;
    rCmd_DataLink_AddTrack        : TRecCmd_DataLink_AddTrack;
    rCmd_FC                       : TRecCmd_FC;
    rCmd_Embark_Landing           : TRecCmd_Embark_Landing;
    rCmd_Platform_CHANGE_TRACKNUMBER  : TRecCmd_Platform_CHANGE_TRACKNUMBER ;
    rCmd_FiringModeWeapon         : TRecFiringModeWeapon;
    rEngagementModeWeapon         : TRecEngagementModeWeapon;
    rCmd_LaunchChaff              : TRecCmd_LaunchChaff;
    rCmd_LaunchChaffState         : TRecCmd_LaunchChaffState;
    rCmd_ChaffLauncherProperties  : TRecCmd_ChaffLauncherProperties;
    rCmd_LaunchBomb               : TRecCmd_LaunchBomb;
    rCmd_LaunchMine               : TRecCmd_LaunchMine;
    rCmd_Sync_Hit_BombMine        : TRecCmd_Sync_Hit_BombMine;
    rSinc_Waypoint                : TrecSinc_Waypoint;
    rSinc_RBLW                    : TrecSinc_RBLW;
    rSinc_BOLW                    : TrecSinc_BOLW;
    rMissile_envi                 : TrecMissile_envi;
    rSinc_Envi                    : TrecSinc_Envi;
    r_CubAssign                   : TRecCubAssign ;
    rCmd_GameSetting              : TRecCmd_GameSetting;
    r_MapData                     : TRec_MapData ;
    r_PlatformHitPlatform         : TRecPlatformHitPlatform;
    r_WeaponOut                   : TRecWeaponOut;
    r_PlatformHancur              : TRecPlatformHancur;
    r_ModifComm                   : TRecModifComm;
    //rCmd_Sync_Hit_BombMine        : TRecCmd_Sync_Hit_BombMine;
    rCmd_DataLink_RemoveTrack       : TrecCmd_DataLink_RemoveTrack;
    // r_PlatformFreeMe             : TRecPlatformFreeMe;
    rCmd_TargetIFF                  : TRecCmd_TargetIFF ;
    rVectac                         : TRecVectac;
    rCmd_OverlayDynamicShape        : TRecCmd_OverlayDynamicShape;
begin
    pcWrite := PChar(CONST_CRLF);
    AddDataToLogFrame(aGameTime,aGameSpeed,EventID);
    case EventID of
      {
      CPID_SYNCH_TORPEDO :
      CPID_SYNCH_MISSILE :
      CPID_SYNCH_VEHICLE :
      CPID_CMD_GUN_FIRE_STATE :
      }
      //CPID_PLATFORM_FREEME :
      //  begin
      //    CopyMemory(@r_PlatformFreeMe, apRec, CONST_SZOFR_PlatformFreeMe);
      //    FFileStream.WriteBuffer( r_PlatformFreeMe , CONST_SZOFR_PlatformFreeMe);
      //  end;
      CPID_CMD_OVERLAYDYNAMICSHAPE :
        begin
          CopyMemory(@rCmd_OverlayDynamicShape, apRec, CONST_SZOFR_Cmd_OverlayDynamicShape);
          FFileStream.WriteBuffer( rCmd_OverlayDynamicShape , CONST_SZOFR_Cmd_OverlayDynamicShape);
        end;
      CPID_CMD_VECTAC :
        begin
          CopyMemory(@rVectac, apRec, CONST_SZOFR_Vectac);
          FFileStream.WriteBuffer( rVectac , CONST_SZOFR_Vectac);
        end;
      CPID_CMD_TARGET_IFF :
        begin
          CopyMemory(@rCmd_TargetIFF, apRec, CONST_SZOFR_Cmd_TargetIFF);
          FFileStream.WriteBuffer( rCmd_TargetIFF , CONST_SZOFR_Cmd_TargetIFF);
        end;
      // CPID_CMD_MODIF_COMM:

      CPID_CMD_DATALINK_REMOVETRACK :
        begin
          CopyMemory(@rCmd_DataLink_RemoveTrack, apRec, CONST_SZOFR_Cmd_DataLink_RemoveTrack);
          FFileStream.WriteBuffer( rCmd_DataLink_RemoveTrack , CONST_SZOFR_Cmd_DataLink_RemoveTrack);
        end;
      CPID_CMD_MODIF_COMM:
        begin
          CopyMemory(@r_ModifComm, apRec, CONST_SZOFR_ModifComm);
          FFileStream.WriteBuffer( r_ModifComm , CONST_SZOFR_ModifComm);
        end;
      CPID_CMD_PLATFORM_HANCUR :
         begin
          CopyMemory(@r_PlatformHancur, apRec, CONST_SZOFR_PlatformHancur);
          FFileStream.WriteBuffer( r_PlatformHancur , CONST_SZOFR_PlatformHancur);
        end;
      CPID_CMD_WEAPON_OUT :
        begin
          CopyMemory(@r_WeaponOut, apRec, CONST_SZOFR_WeaponOut);
          FFileStream.WriteBuffer( r_WeaponOut , CONST_SZOFR_WeaponOut);
        end;
      CPID_CMD_SYNC_HIT_MINE_BOMB :
        begin
          CopyMemory(@rCmd_Sync_Hit_BombMine, apRec, CONST_SZOFR_Sync_Hit_BombMine);
          FFileStream.WriteBuffer( rCmd_Sync_Hit_BombMine , CONST_SZOFR_Sync_Hit_BombMine);
        end;
      CPID_CMD_PLATFORM_HIT_PLATFORM:
        begin
          CopyMemory(@r_PlatformHitPlatform, apRec, CONST_SZOFR_PlatformHitPlatform);
          FFileStream.WriteBuffer( r_PlatformHitPlatform , CONST_SZOFR_PlatformHitPlatform);
        end;
      CPID_CMD_MAPS :
        begin
          CopyMemory(@r_MapData, apRec, CONST_SZOFR_MapData);
          FFileStream.WriteBuffer( r_MapData , CONST_SZOFR_MapData);
        end;

      CPID_GAME_SETTING :
        begin
         CopyMemory(@rCmd_GameSetting, apRec, CONST_SZOFR_Cmd_GameSetting);
         FFileStream.WriteBuffer( rCmd_GameSetting , CONST_SZOFR_Cmd_GameSetting);
        end;
      CPID_CMD_LAUNCH_TORPEDO :
        begin
         CopyMemory(@rCmd_LaunchMissile, apRec, CONST_SZOFR_Cmd_LaunchMissile);
         FFileStream.WriteBuffer( rCmd_LaunchMissile , CONST_SZOFR_Cmd_LaunchMissile);
        end;
      CPID_CMD_LAUNCHER_CHAFF_PROPS :
        begin
         CopyMemory(@rCmd_ChaffLauncherProperties, apRec, CONST_SZOFR_Cmd_ChaffLauncherProperties);
         FFileStream.WriteBuffer( rCmd_ChaffLauncherProperties , CONST_SZOFR_Cmd_ChaffLauncherProperties);
        end;
      CPID_CMD_LAUNCHER_CHAFF_STATE :
        begin
         CopyMemory(@rCmd_LaunchChaffState, apRec, CONST_SZOFR_Cmd_LaunchChaffState);
         FFileStream.WriteBuffer( rCmd_LaunchChaffState , CONST_SZOFR_Cmd_LaunchChaffState);
        end;
      CPID_CMD_LAUNCH_CHAFF :
        begin
         CopyMemory(@rCmd_LaunchChaff, apRec, CONST_SZOFR_Cmd_LaunchChaff);
         FFileStream.WriteBuffer( rCmd_LaunchChaff , CONST_SZOFR_Cmd_LaunchChaff);
        end;
      CPID_CUBICLEASSIGN :
        begin
         CopyMemory(@r_CubAssign, apRec, CONST_SZOF_CubAssign);
         FFileStream.WriteBuffer(r_CubAssign, CONST_SZOF_CubAssign);
        end;
      CPID_CMD_ENVI :
        begin
         CopyMemory(@rSinc_Envi, apRec, CONST_SZOFR_Sinc_Envi);
         FFileStream.WriteBuffer(rSinc_Envi, CONST_SZOFR_Sinc_Envi);
        end;
      CPID_CMD_Missile_Envi :
        begin
         CopyMemory(@rMissile_envi, apRec, CONST_SZOFR_Missile_envi);
         FFileStream.WriteBuffer(rMissile_envi, CONST_SZOFR_Missile_envi);
        end;
      CPID_SincBOLW :
        begin
         CopyMemory(@rSinc_BOLW, apRec, CONST_SZOFR_Sinc_BOLW);
         FFileStream.WriteBuffer(rSinc_BOLW, CONST_SZOFR_Sinc_BOLW);
        end;
      CPID_SincRBLW :
        begin
         CopyMemory(@rSinc_RBLW, apRec, CONST_SZOFR_Sinc_RBLW);
         FFileStream.WriteBuffer(rSinc_RBLW, CONST_SZOFR_Sinc_RBLW);
        end;
      CPID_SincWaypoint :
        begin
         CopyMemory(@rSinc_Waypoint, apRec, CONST_SZOFR_Sinc_Waypoint);
         FFileStream.WriteBuffer(rSinc_Waypoint, CONST_SZOFR_Sinc_Waypoint);
        end;
      CPID_CMD_LAUNCH_MINES :
        begin
         CopyMemory(@rCmd_LaunchMine, apRec, CONST_SZOFR_Cmd_LaunchMine);
         FFileStream.WriteBuffer(rCmd_LaunchMine, CONST_SZOFR_Cmd_LaunchMine);
        end;
      CPID_CMD_LAUNCH_BOMB :
        begin
         CopyMemory(@rCmd_LaunchBomb, apRec, CONST_SZOFR_Cmd_LaunchBomb);
         FFileStream.WriteBuffer(rCmd_LaunchBomb, CONST_SZOFR_Cmd_LaunchBomb);
        end;
      CPID_CMD_LAUNCHER_BUBBLE_PROPS :
        begin
         CopyMemory(@rCmd_ChaffLauncherProperties, apRec, CONST_SZOFR_Cmd_ChaffLauncherProperties);
         FFileStream.WriteBuffer(rCmd_ChaffLauncherProperties, CONST_SZOFR_Cmd_ChaffLauncherProperties);
        end;
      CPID_CMD_LAUNCHER_BUBBLE_STATE :
        begin
         CopyMemory(@rCmd_LaunchChaffState, apRec, CONST_SZOFR_Cmd_LaunchChaffState);
         FFileStream.WriteBuffer(rCmd_LaunchChaffState, CONST_SZOFR_Cmd_LaunchChaffState);
        end;
      CPID_CMD_LAUNCH_BUBBLE :
        begin
         CopyMemory(@rCmd_LaunchChaff, apRec, CONST_SZOFR_Cmd_LaunchChaff);
         FFileStream.WriteBuffer(rCmd_LaunchChaff, CONST_SZOFR_Cmd_LaunchChaff);
        end;
      CPID_CMD_ENGAGEMENTMODE :
        begin
         CopyMemory(@rEngagementModeWeapon, apRec, CONST_SZOFR_EngagementModeWeapon);
         FFileStream.WriteBuffer(rEngagementModeWeapon, CONST_SZOFR_EngagementModeWeapon);
        end;
      CPID_CMD_FIRINGMODE :
        begin
         CopyMemory(@rCmd_FiringModeWeapon, apRec, CONST_SZOFR_Cmd_FiringModeWeapon);
         FFileStream.WriteBuffer(rCmd_FiringModeWeapon, CONST_SZOFR_Cmd_FiringModeWeapon);
        end;
      CPID_CMD_CHANGE_TRACK_NUMBER :
        begin
         CopyMemory(@rCmd_Platform_CHANGE_TRACKNUMBER, apRec, CONST_SZOFR_Cmd_Platform_CHANGE_TRACKNUMBER);
         FFileStream.WriteBuffer( rCmd_Platform_CHANGE_TRACKNUMBER , CONST_SZOFR_Cmd_Platform_CHANGE_TRACKNUMBER);
        end;
      CPID_CMD_EMBARK_LAND :
        begin
          CopyMemory(@rCmd_Embark_Landing, apRec, CONST_SZOFR_Cmd_Embark_Landing);
          FFileStream.WriteBuffer( rCmd_Embark_Landing , CONST_SZOFR_Cmd_Embark_Landing);
        end;
      CPID_CMD_ASSIGN_FIRECONTROL :
        begin
          CopyMemory(@rCmd_FC, apRec, CONST_SZOFR_Cmd_FC);
          FFileStream.WriteBuffer( rCmd_FC , CONST_SZOFR_Cmd_FC);
        end;
      CPID_CMD_DATALINK_ADDTRACK :
        begin
          CopyMemory(@rCmd_DataLink_AddTrack, apRec, CONST_SZOFR_Cmd_DataLink_AddTrack);
          FFileStream.WriteBuffer( rCmd_DataLink_AddTrack , CONST_SZOFR_Cmd_DataLink_AddTrack);
        end;
      CPID_CMD_DATALINK :
        begin
          CopyMemory(@rCmd_DataLink, apRec, CONST_SZOFR_Cmd_DataLink);
          FFileStream.WriteBuffer( rCmd_DataLink , CONST_SZOFR_Cmd_DataLink);
        end;
      CPID_CMD_MERGE_TRACK :
        begin
          CopyMemory(@rCmd_MergeTrack, apRec, CONST_SZOFR_Cmd_MergeTrack);
          FFileStream.WriteBuffer( rCmd_MergeTrack , CONST_SZOFR_Cmd_MergeTrack);
        end;
      CPID_CMD_PLATFORM_REPAIR :
        begin
          CopyMemory(@rCmd_Platform_Repair, apRec, CONST_SZOFR_Cmd_Platform_Repair);
          FFileStream.WriteBuffer( rCmd_Platform_Repair , CONST_SZOFR_Cmd_Platform_Repair);
        end;
      CPID_CMD_ESM_SET_PROPERTY :
        begin
           CopyMemory(@rCmd_ESM_SET_PROPERTY, apRec, CONST_SZOFR_Cmd_ESM_SET_PROPERTY);
           FFileStream.WriteBuffer( rCmd_ESM_SET_PROPERTY , CONST_SZOFR_Cmd_ESM_SET_PROPERTY);
        end;
      CPID_CMD_UPDATE_NRP_PROPERTY :
        begin
           CopyMemory(@rCmd_NRP_SET_PROPERTY, apRec, CONST_SZOFR_Cmd_NRP_SET_PROPERTY);
           FFileStream.WriteBuffer( rCmd_NRP_SET_PROPERTY , CONST_SZOFR_Cmd_NRP_SET_PROPERTY);
        end;
      CPID_CMD_UPDATE_PLATFORM_PROPERTY :
        begin
           CopyMemory(@rCmd_Platform_SET_PROPERTY, apRec, CONST_SZOFR_Cmd_Platform_SET_PROPERTY);
           FFileStream.WriteBuffer( rCmd_Platform_SET_PROPERTY , CONST_SZOFR_Cmd_Platform_SET_PROPERTY);
        end;
      CPID_CMD_REMOVE_PLATFORM :
        begin
          CopyMemory(@rCmd_SelectPlatformToRemove, apRec, CONST_SZOFR_Cmd_SelectPlatformToRemove);
          FFileStream.WriteBuffer( rCmd_SelectPlatformToRemove , CONST_SZOFR_Cmd_SelectPlatformToRemove);
        end;
      CPID_CMD_DYNAMIC_TRACK :
        begin
           CopyMemory(@rCmd_OverlayDynamicTrack, apRec, CONST_SZOFR_Cmd_OverlayDynamicTrack);
           FFileStream.WriteBuffer( rCmd_OverlayDynamicTrack , CONST_SZOFR_Cmd_OverlayDynamicTrack);
        end;
//      CPID_CMD_GAMBAR_OVERLAY :
//        begin
//           CopyMemory(@rCmd_GmbOverlayClient, apRec, CONST_SZOFR_Cmd_GmbOverlayClient);
//           FFileStream.WriteBuffer( rCmd_GmbOverlayClient , CONST_SZOFR_Cmd_GmbOverlayClient);
//        end;
      CPID_CMD_OVERLAYTEMPLATE :
        begin
           CopyMemory(@rCmd_OverlayTemplate, apRec, CONST_SZOFR_Cmd_OverlayTemplate);
           FFileStream.WriteBuffer( rCmd_OverlayTemplate , CONST_SZOFR_Cmd_OverlayTemplate);
        end;
      CPID_CMD_LAUNCH_NON_RUNTIME_PLATFORM :
        begin
           CopyMemory(@rCmd_LaunchNonRP, apRec, CONST_SZOFR_Cmd_LaunchNonRP);
           FFileStream.WriteBuffer( rCmd_LaunchNonRP , CONST_SZOFR_Cmd_LaunchNonRP);
        end;
      CPID_CMD_LAUNCH_RUNTIME_PLATFORM :
        begin
           CopyMemory(@rCmd_LaunchRP, apRec, CONST_SZOFR_Cmd_LaunchRP);
           FFileStream.WriteBuffer( rCmd_LaunchRP , CONST_SZOFR_Cmd_LaunchRP);
        end;
      CPID_TCP_REQUEST :
        begin
           CopyMemory(@rTCP_Request, apRec, CONST_SZOFR_TCP_Request);
           FFileStream.WriteBuffer( rTCP_Request , CONST_SZOFR_TCP_Request);
        end;
      CPID_CMD_GAME_CTRL :
        begin
           CopyMemory(@rCmd_GameCtrl, apRec, CONST_SZOFR_Cmd_GameCtrl);
           FFileStream.WriteBuffer( rCmd_GameCtrl , CONST_SZOFR_Cmd_GameCtrl);
        end;

      CPID_CMD_GUN_FIRE :
        begin
           CopyMemory(@rCmd_GunFire, apRec, CONST_SZOFR_Cmd_GunFire);
           FFileStream.WriteBuffer( rCmd_GunFire , CONST_SZOFR_Cmd_GunFire);
        end;
      CPID_CMD_LAUNCH_MISSILE :
        begin
           CopyMemory(@rCmd_LaunchMissile, apRec, CONST_SZOFR_Cmd_LaunchMissile);
           FFileStream.WriteBuffer( rCmd_LaunchMissile , CONST_SZOFR_Cmd_LaunchMissile);
        end;
      CPID_CMD_SYNCH :
        begin
           CopyMemory(@rCmdSYNCH, apRec, CONST_SZOFR_CmdSYNCH);
           FFileStream.WriteBuffer( rCmdSYNCH , CONST_SZOFR_CmdSYNCH);
        end;
      CPID_CMD_LAUNCH_EMBARK :
        begin
           CopyMemory(@rCmd_Embark, apRec, CONST_SZOFR_Cmd_Embark);
           FFileStream.WriteBuffer( rCmd_Embark , CONST_SZOFR_Cmd_Embark);
        end;
      CPID_CMD_SENSOR_IFF :
        begin
           CopyMemory(@rCmd_SensorIFF, apRec, CONST_SZOFR_Cmd_SensorIFF);
           FFileStream.WriteBuffer( rCmd_SensorIFF , CONST_SZOFR_Cmd_SensorIFF);
        end;
      CPID_CMD_SENSOR :
        begin
           CopyMemory(@rCmd_Sensor, apRec, CONST_SZOFR_Cmd_Sensor);
           FFileStream.WriteBuffer( rCmd_Sensor , CONST_SZOFR_Cmd_Sensor);
        end;
      CPID_CMD_RADAR_NOISE_JAMMER :
        begin
           CopyMemory(@rRadarNoiseJammer, apRec, CONST_SZOFR_RadarNoiseJammer);
           FFileStream.WriteBuffer(rRadarNoiseJammer, CONST_SZOFR_RadarNoiseJammer);
        end;
      CPID_CMD_ENGAGE_TRACK :
        begin
           CopyMemory(@rCmd_EngageTrack, apRec, CONST_SZOFR_Cmd_EngageTrack);
           FFileStream.WriteBuffer(rCmd_EngageTrack, CONST_SZOFR_Cmd_EngageTrack);
        end;
      CPID_CMD_PLATFORM_REPOS :
        begin
           CopyMemory(@rCmd_Platform_MOVE, apRec, CONST_SZOFR_Cmd_Platform_MOVE);
           FFileStream.WriteBuffer(rCmd_Platform_MOVE, CONST_SZOFR_Cmd_Platform_MOVE);
        end;
      CPID_CMD_SET_STATUS :
        begin
           CopyMemory(@rCmd_Set_Status, apRec, CONST_SZOFR_Cmd_Set_Status);
           FFileStream.WriteBuffer(rCmd_Set_Status, CONST_SZOFR_Cmd_Set_Status);
        end;
      CPID_CMD_SET_QUANTITY :
        begin
           CopyMemory(@rCmd_Set_Quantity, apRec, CONST_SZOFR_Cmd_Set_Quantity);
           FFileStream.WriteBuffer(rCmd_Set_Quantity, CONST_SZOFR_Cmd_Set_Quantity);
        end;
      CPID_CMD_SET_LAUNCHERQTY :
        begin
           CopyMemory(@rCmd_Set_LauncherQty, apRec, CONST_SZOFR_Cmd_Set_LauncherQty);
           FFileStream.WriteBuffer(rCmd_Set_LauncherQty, CONST_SZOFR_Cmd_Set_LauncherQty);
        end;
      CPID_CMD_EMCON_MODE :
        begin
           CopyMemory(@rCmd_ModeEmcon, apRec, CONST_SZOFR_Cmd_ModeEmcon);
           FFileStream.WriteBuffer(rCmd_ModeEmcon, CONST_SZOFR_Cmd_ModeEmcon);
        end;
      CPID_CMD_PLATFORM :
        begin
           //recCmd_Platform := @apRec^;
           CopyMemory(@rCmd_Platform, apRec, CONST_SZOFR_Cmd_Platform);
           FFileStream.WriteBuffer(rCmd_Platform, CONST_SZOFR_Cmd_Platform);
        end;
    end;
    FFileStream.WriteBuffer(pcWrite^, Length(pcWrite));
end;

end.
