unit uCommonLogReplay;

  (*-------------------------------------------------------------------------
    --  Gamer Recorder and Replay for Air Defence System Simlulator        --
    -------------------------------------------------------------------------
    -- unit name   : uCommonLogReplay                                      --
    -- description : definisi tipe data untuk TNewRecorder dan TNewReplay  --
    --                                                                     --
    -------------------------------------------------------------------------
    ..  First Created : 18 Maret 2005     ..
    ..  Finished      : 12 Mei   2005     ..
    ..  by            : andySu            ..
    ........................................
   *)

(* uCommonLogReplay history
   digunakan oleh uNewLog dan uNewReplay
   { 11 Mei 2005
      . Command Status Recording
   }
   { 10 Mei 2005
      . Recording status dipinda ke sini dari uNewLog
   }
   { 20 April 2005
      . File Version
   }
   { 19 April 2005
      . tambahan History jika di seekplay )
   }
   { 18 April 2005
      . penambahan tipe data aircraft
   }
   { 12 April 2005
      . penambahan data scenario sesusai ARCS
      . 'SnapShot' utuk mengetahui sekilas ttg data
   }
   { 18 Maret 2005
      . start, pindahan dari unit uNewLog dan uNewReplay
}
*)

interface

uses
  Classes, Windows, SysUtils, StrUtils ,
  uGameData_TTT , uNetSessionData;

type

  { History Data }
  TRecCoord = record
    CoordX, CoordY, CoordZ : double;
  end;

  TRecACHistory = record
    ACID: integer;
    HistoryData : array of TRecCoord;
    HistoryCount : integer;
  end;

  aACHistory = array of TRecACHistory;

  { status Recording of TNewRecorder }

  TRecorderStatus = ( rsCreated, rsInitialized, rsRecording );


const
  CONST_CRLF   = #13#10;

  CONST_MIN_GAMESPEED_MULTIPLIER  = 1;
  CONST_MAX_GAMESPEED_MULTIPLIER  = 16;

  CONST_SZOF_WORD                             = SizeOf(Word);
  CONST_SZOF_LONGWORD                         = SizeOf(LongWord);
  CONST_SZOF_Int64                            = SizeOf(Int64);

  CONST_SZOFR_Cmd_Platform                    = SizeOf(TRecCmd_Platform);
  CONST_SZOFR_Cmd_Platform_MOVE               = SizeOf(TRecCmd_Platform_MOVE);
  CONST_SZOFR_Cmd_Sensor                      = SizeOf(TRecCmd_Sensor);
  CONST_SZOFR_Cmd_Embark                      = SizeOf(TRecCmd_Embark);
  CONST_SZOFR_CmdSYNCH                        = SizeOf(TRecCmdSYNCH);
  CONST_SZOFR_Cmd_LaunchMissile               = SizeOf(TRecCmd_LaunchMissile);
  CONST_SZOFR_Cmd_GunFire                     = SizeOf(TRecCmd_GunFire);
  CONST_SZOFR_Cmd_GameCtrl                    = SizeOf(TRecCmd_GameCtrl);
  CONST_SZOFR_TCP_Request                     = SizeOf(TRecTCP_Request);
  CONST_SZOFR_Cmd_LaunchRP                    = SizeOf(TRecCmd_LaunchRP);
  CONST_SZOFR_Cmd_LaunchNonRP                 = SizeOf(TRecCmd_LaunchNonRP);
  CONST_SZOFR_Cmd_Platform_SET_PROPERTY       = SizeOf(TRecCmd_Platform_SET_PROPERTY);
  CONST_SZOFR_Cmd_NRP_SET_PROPERTY            = SizeOf(TRecCmd_NRP_SET_PROPERTY);
  CONST_SZOFR_Cmd_SelectPlatformToRemove      = SizeOf(TRecCmd_SelectPlatformToRemove);
  CONST_SZOFR_Cmd_Platform_Repair             = SizeOf(TRecCmd_Platform_Repair);
  CONST_SZOFR_Cmd_Platform_CHANGE_TRACKNUMBER = SizeOf(TRecCmd_Platform_CHANGE_TRACKNUMBER);
  CONST_SZOFR_Cmd_FiringModeWeapon            = SizeOf(TRecFiringModeWeapon);
  CONST_SZOFR_Cmd_Set_LauncherQty             = SizeOf(TRecCmd_Set_LauncherQty);
  CONST_SZOFR_Cmd_ModeEmcon                   = SizeOf(TRecCmd_ModeEmcon) ;
  CONST_SZOFR_Cmd_Set_Quantity                = SizeOf(TRecCmd_Set_Quantity) ;
  CONST_SZOFR_Cmd_Set_Status                  = SizeOf(TRecCmd_Set_Status);
  CONST_SZOFR_Cmd_EngageTrack                 = SizeOf(TRecCmd_EngageTrack);
  CONST_SZOFR_RadarNoiseJammer                = SizeOf(TrecRadarNoiseJammer);
  CONST_SZOFR_Cmd_SensorIFF                   = SizeOf(TRecCmd_SensorIFF);

  CONST_SZOFR_Cmd_OverlayTemplate             = SizeOf(TRecCmd_OverlayTemplate);
  CONST_SZOFR_Cmd_OverlayStaticShape          = SizeOf(TRecCmd_OverlayStaticShape);
  CONST_SZOFR_rCmd_PlottingShape              = SizeOf(TRecCmd_PlottingShape);
  CONST_SZOFR_Cmd_ShipingRoute                = SizeOf(TRecCmd_ShipingRoute);
  CONST_SZOFR_Cmd_Change_Logistic             = SizeOf(TRecCmd_Change_Logistic);
  CONST_SZOFR_Cmd_State_logistic              = SizeOf(TRecCmd_State_Logistic);
  CONST_SZOFR_Cmd_RampController              = SizeOf(TRecCmd_RampController);
  CONST_SZOFR_Cmd_Transport                   = SizeOf(TRecCmd_Transport);

  CONST_SZOFR_Cmd_OverlayDynamicTrack         = SizeOf(TRecCmd_OverlayDynamicTrack);
  CONST_SZOFR_Cmd_ESM_SET_PROPERTY            = SizeOf(TRecCmd_ESM_SET_PROPERTY) ;
  CONST_SZOFR_Cmd_MergeTrack                  = SizeOf(TRecCmd_MergeTrack);
  CONST_SZOFR_Cmd_DataLink                    = SizeOf(TRecCmd_DataLink) ;
  CONST_SZOFR_Cmd_DataLink_AddTrack           = SizeOf(TRecCmd_DataLink_AddTrack);
  CONST_SZOFR_Cmd_FC                          = SizeOf(TRecCmd_FC);
  CONST_SZOFR_Cmd_Embark_Landing              = SizeOf(TRecCmd_Embark_Landing);
  CONST_SZOFR_EngagementModeWeapon            = SizeOf(TRecEngagementModeWeapon);
  CONST_SZOFR_Cmd_LaunchChaff                 = SizeOf(TRecCmd_LaunchChaff);
  CONST_SZOFR_Cmd_LaunchChaffState            = SizeOf(TRecCmd_LaunchChaffState);
  CONST_SZOFR_Cmd_ChaffLauncherProperties     = SizeOf(TRecCmd_ChaffLauncherProperties);
  CONST_SZOFR_Cmd_LaunchBubble                = SizeOf(TRecCmd_LaunchBubble);
  CONST_SZOFR_Cmd_LaunchBubbleState           = SizeOf(TRecCmd_LaunchBubbleState);
  CONST_SZOFR_Cmd_BubbleLauncherProperties    = SizeOf(TRecCmd_BubbleLauncherProperties);
  CONST_SZOFR_Cmd_LaunchBomb                  = SizeOf(TRecCmd_LaunchBomb);
  CONST_SZOFR_Cmd_LaunchMine                  = SizeOf(TRecCmd_LaunchMine);
  CONST_SZOFR_Cmd_Sync_Hit_BombMine           = SizeOf(TRecCmd_Sync_Hit_BombMine);
  CONST_SZOFR_Sinc_Waypoint                   = SizeOf(TrecSinc_Waypoint);
  CONST_SZOFR_Sinc_RBLW                       = SizeOf(TrecSinc_RBLW);
  CONST_SZOFR_Sinc_BOLW                       = SizeOf(TrecSinc_BOLW);
  CONST_SZOFR_Missile_envi                    = SizeOf(TrecMissile_envi);
  CONST_SZOFR_Sinc_Envi                       = SizeOf(TrecSinc_Envi);
  CONST_SZOF_CubAssign                        = SizeOf(TRecCubAssign);
  CONST_SZOFR_Cmd_GameSetting                 = SizeOf(TRecCmd_GameSetting);
  CONST_SZOFR_MapData                         = SizeOf(TRec_MapData);
  CONST_SZOFR_PlatformHitPlatform             = SizeOf(TRecPlatformHitPlatform);
  CONST_SZOFR_Sync_Hit_BombMine               = SizeOf(TRecCmd_Sync_Hit_BombMine);
  CONST_SZOFR_WeaponOut                       = SizeOf(TRecWeaponOut);
  CONST_SZOFR_PlatformHancur                  = SizeOf(TRecPlatformHancur);
  CONST_SZOFR_ModifComm                       = SizeOf(TRecModifComm);
  CONST_SZOFR_Cmd_DataLink_RemoveTrack        = SizeOf(TrecCmd_DataLink_RemoveTrack);
  CONST_SZOFR_PlatformFreeMe                  = SizeOf(TRecPlatformFreeMe);
  CONST_SZOFR_Cmd_TargetIFF                   = SizeOf(TRecCmd_TargetIFF);
  CONST_SZOFR_Vectac                          = SizeOf(TRecVectac);
  CONST_SZOFR_Cmd_OverlayDynamicShape         = SizeOf(TRecCmd_OverlayDynamicShape);
  CONST_SZOFR_Free_Platform                   = SizeOf(TRecPlatformFreeMe);
  CONST_SZOFR_SyncObject                      = SizeOf(TRecSyncPos);
  CONST_SZOFR_Torpedo_Sync_Panel              = SizeOf(TRecTorpedoPanelWeapon);
  CONST_SZOFR_Cmd_LaunchSonobuoy              = SizeOf(TRecCmd_LaunchSonobuoy);
  CONST_SZOFR_Cmd_IFFSearchMode               = SizeOf(TRecCmd_IFFSearchMode);
  CONST_SZOFR_CmdDecoys                       = SizeOf(TRecCmdDecoys);
  CONST_SZOFR_Cmd_LogisticRoute               = SizeOf(TRecCmd_LogisticRoute);

  CONST_SZOFR_Cmd_TransferSonobuoy            = SizeOf(TRecCmd_TransferSonobuoy);
  CONST_SZOFR_Cmd_LastUpdatePlatform          = SizeOf(TRecCmd_LastUpdatePlatform);
  CONST_SZOFR_PlatformGroupChange             = SizeOf(TRecPlatformGroupChange);
  CONST_SZOFR_Personel_Move                   = SizeOf(TRec_Personel_Move);
  CONST_SZOFR_Detectability                   = SizeOf(TRecDetectability);
  CONST_SZOFR_EditFormation                   = SizeOf(TRecEditFormation);
  CONST_SZOFR_RecordVoice                     = SizeOf(TRecRecordVoice);
  CONST_SZOFR_ECMCommand                      = SizeOf(TRecECMCommand);
  CONST_SZOFR_SyncTarget                      = SizeOf(TRec_SyncTarget);
  CONST_SZOFR_Cmd_UpdateActualCable           = SizeOf(TRecCmd_UpdateActualCable);
  CONST_SZOFR_Cmd_UpdateSonar                 = SizeOf(TRecCmd_UpdateSonar);
  CONST_SZOFR_MineProperty                    = SizeOf(TRecMineProperty);
  CONST_SZOFR_BombProperty                    = SizeOf(TRecBombProperty);
  CONST_SZOFR_TorpedoProperty                 = SizeOf(TRecTorpedoProperty);
  CONST_SZOFR_BombPanelWeapon                 = SizeOf(TRecBombPanelWeapon);

  CONST_SZOFR_Cmd_Change_SystemState          = SizeOf(TRecCmd_Change_SystemState);
  CONST_SZOFR_Cmd_EsmVariance                 = SizeOf(TRecCmd_EsmVariance);
  CONST_SZOFR_UDP_PlatformMovement            = SizeOf(TRecUDP_PlatformMovement);
  CONST_SZOFR_CmdMultiMode                    = SizeOf(TRecCmdMultiMode);
  CONST_SZOFR_SendMessage                     = SizeOf(TRecSendMessage);

implementation



end.
