unit uNewReplay;

  (*-------------------------------------------------------------------------
    --  Gamer Recorder and Replay for Air Defence System Simlulator        --
    -------------------------------------------------------------------------
    -- unit name   : uNewReplay                                            --
    -- description : Player Class for TNewRecorder saved file              --
    -- requirement : MSThreadTimer                                         --
    -------------------------------------------------------------------------
    ..  First Created : 18 Maret 2005     ..
    ..  Finished      : 12 Mei   2005     ..
    ..  by            : andySu            ..
    ..  Edited        : Sam               ..
    ..  First Edited  : 27 April 2011     ..
    ..  Fin. Edited   : ........ 2011     ..
    ........................................
   *)


interface

uses
  Classes, Windows, SysUtils, Dialogs,
  uGameData_TTT, tttData, uSRRFunction,
  uCommonLogReplay, uThreadTimer, uNetSessionData ;

type

(* R E P L A Y * S E C T I O N *********************************)
  //TFrameReplayEvent =  procedure (const aData: arrRecObjectData) of object;
  TFrameReplayEvent =  procedure (const eEventID : Int64 ; IndexID : integer ; Tick : LongWord) of object;
  TUpdateTime = procedure (Tick : LongWord) of object;

  TReplayStatus = (rsCreated, rsOpenFile, rsRePlay, rsRePlayPause, rsEnd);

//===========================================================================
(* TNewReplay history
    {  27 April 2011

       Recording and Playing Base on Network Event

       TReplayReadData = record
        Tick          : LongWord;
        SpeedMultiply : Word;
        NumOfData     : Word;   // EventID : Int64
        FilePos       : Int64;
       end;

    }
    { 06 Mei 2005
       + Speed Multiplier
    }
    { 28 April 2005
       + AfterSeek Status. Flag untuk menandai Frame 'pertama' setelah di seek.
    }
    { 25 April 2005
       + pebaikan kecil tapi fatal di GetPositionHistory().
    }
    { 19 April 2005
       + tambahan History jika di seekplay().
    }
    { 12 April 2005
      + Modifikasi GetFileReplayInfo untuk ScenarioInfo.
    }
    { 11 April 2005
      + tambahan property  FrameTick[i] dan  FrameNumData[i].
    }
    {08 April 2005
      * +tambahan property, akses ke header;
        - seek play, harusnya sleep() di REVISI..()
        - KASUS ARCS TEST, frame0 nilai sleepnya buesaar.
    }
    {30 Maret 2005
     * release 0.1
     + BugFix  03_29_01
     + BugFix  03_28_01
    }
    {29 maret 2005
     + FTimer.Interval := NextData.time - currentData.Time;
     - 03_29_01 : Perubahan interval meleset 1 frame
     - belum diek jika log tidak berisi data.
    }
    {28 Maret 2005
     - sudah bisa di seekPlay, ke frame manapun;
     - FTimer.Interval := 4000; //tidak pernah diubah.
     - 03_28_01 : if FReplayStatus = rsEnd then hang.
    }
    { .. undocumented progress..
    }
    {18 Maret 2005
     . started
    }
*)

//===========================================================================
  TReplayReadData = record
    Tick          : LongWord;
    SpeedMultiply : Word;
    EventID       : Int64 ;   // NumOfData     : Word;
    FilePos       : Int64;
  end;

  { TNewReplay }
  TNewReplay = class(TObject)
  private

  {FileHandling}
    FFileName       : string;
    FDataStart,
    FLastDataPos    : Int64;

    FScenarioInfo   : TRecScenario_Definition;

  {FrameIndexing}
    FFrameIndexList  : array of TReplayReadData;
    FFrameIndexSize,
    FFrameIndexCount : integer;

  {ReplayStatus}
    FReplayStatus : TReplayStatus;
    FCurrentFrame : Integer;
    FOnFrameReplay: TFrameReplayEvent;
    FAfterSeek    : boolean;

    FOnEndReplay : TNotifyEvent;

  {ReplayData}
    //FDataCurrent      : arrRecObjectData;
    //FDataCurrent  : PAnsiChar ;
    //ADataCurrent  : AnsiChar ;
  {Timer/Threads}
    FTimer    : TMSTimer;
    FDataCurentTick : LongWord;

  {Speed Multiplier}
    FSpeedMultiply : Word;
    FOnUpditeTime: TUpdateTime;

  {private_methods_FrameIndexing}
    procedure AddToFrameIndex(const aFilePos: Int64;
                              const aTimeTick: LongWord;
                              const aSpeedMultiply: Word;
                              const aEventID : Int64 );
                              //const aNumData: Word);

  {private_methods_'low level'_data_retrieving}
    function GetFileReplayInfo(const aFName: string): boolean;

  //----gk di panggil ----//
  //function ReadFrameData( const aFrameIndex: integer;
                           //var aData: arrRecObjectData): boolean;
                           //var aData: PAnsiChar): boolean;

  {private_methods_internal_playing}
   //  procedure PlayNextFrame;
  {private_methods_timer_event_handler}
    procedure OnTimerHandler(sender: TObject);
  {private_methods_property_frame_fnfo}
    function getFrameTick(ix: integer) : LongWord;
    //function getFrameNumOfData(ix: integer) : LongWord;
    function getFrameEventID(ix: integer) : Int64;
    function getFrameSpeedMultiplier(ix: integer) : Word;
  {private_methods_property_SpeedMultiplier }
    procedure setSpeedMultiplier(aMult: word);
    function getFrameLength: integer;
    function getFrameRecord(index: integer): TReplayReadData;
 
  public
    constructor Create;
    destructor Destroy; override;

  {public_methods_File_Handling}
    function OpenFileReplay(const aFName: string  ): boolean;
    procedure CloseFileReplay;

  {public_methods_Play_Function}
    procedure StartPlay;
    procedure StopPlay;
    procedure PausePlay;
    procedure ResumePlay;
    procedure SeekPlay(const aFrameIndex: integer);
    procedure PlayNextFrame;
    function GetCurrentFrameFilePos : Int64;

  {public_method_HistoryFunction}
    // procedure GetPositionHistory(var aHistList:  aACHistory; const aFrameIx: integer=-1);

  {published_property_play_function}
    property CurrentFrame : integer read FCurrentFrame;
    property MaxFrame     : integer read FFrameIndexCount;
    ///property DataCurrent  : .... read FDataCurrent;
    property DataTick     : LongWord    read  FDataCurentTick;
    property OnFrameReplay: TFrameReplayEvent read FOnFrameReplay write FOnFrameReplay;
  {published_property_ReplayStatus}
    property ReplayStatus  : TReplayStatus read FReplayStatus;
    property AfterSeek     : boolean read FAfterSeek;
    property OnEndReplay   : TNotifyEvent read FOnEndReplay write FOnEndReplay;

    property PFFileName : string read FFileName;
  {public_property_FrameInfo}
    property FrameTick[index: integer]:  Longword  read getFrameTick ;
    property FrameSpeedMultiply[index: integer]:  Word  read getFrameSpeedMultiplier;
    //property FrameNumData[index: integer]:  Longword  read getFrameNumOfData;
    property FrameEventID [index: integer]:  int64  read getFrameEventID;
    property ScenarioInfo: TRecScenario_Definition read FScenarioInfo;
    property ReplaySpeedMultiplier: Word read FSpeedMultiply write setSpeedMultiplier;

    // get frame length
    property FrameLength : integer read getFrameLength;
    property FrameRecord[index: integer] : TReplayReadData read getFrameRecord;

    //update time main display
    property OnUpdateTime : TUpdateTime read FOnUpditeTime write FOnUpditeTime;
  end;


implementation

//==============================================================================
{ TNewReplay }

  constructor TNewReplay.Create;
  begin
    FSpeedMultiply := 1;

    FTimer := TMSTimer.Create;
    FTimer.Interval := 1000;
    FTimer.OnTimer := OnTimerHandler;

    FFrameIndexCount := 0;
    FFrameIndexSize  := 64;
    SetLength(FFrameIndexList, FFrameIndexSize);

    FReplayStatus := rsCreated;
    FAfterSeek    := false;
  end;

  destructor TNewReplay.Destroy;
  begin
    FTimer.Terminate;
    FTimer.Free;
    SetLength(FFrameIndexList, 0);

    inherited;
  end;

//- {private_methods_FrameIndexing} -------------------------------------------
//- menyimpan Posisi data Frame di File

  procedure TNewReplay.AddToFrameIndex(const aFilePos: Int64;
                              const aTimeTick: LongWord;
                              const aSpeedMultiply: Word;
                              const aEventID : Int64 );
                              //const aNumData: Word);
  begin
    if FFrameIndexCount >= FFrameIndexSize then begin
      FFrameIndexSize  := FFrameIndexSize + 64;
      SetLength(FFrameIndexList, FFrameIndexSize);
    end;

    FFrameIndexList[FFrameIndexCount].Tick           := aTimeTick;
    FFrameIndexList[FFrameIndexCount].SpeedMultiply  := aSpeedMultiply;

    //FFrameIndexList[FFrameIndexCount].NumOfData := aNumData;
    FFrameIndexList[FFrameIndexCount].EventID   := aEventID;
    FFrameIndexList[FFrameIndexCount].FilePos   := aFilePos;
    inc(FFrameIndexCount);
  end;

//- {private_methods_'low level'_data_retrieving} ------------------------------
//- membaca data dari file, tidak mengubah status

  function TNewReplay.GetFileReplayInfo(const aFName: string): boolean;
  var
      readCount, seekCount : integer;
      lastPos   : int64;
      rLongWord : LongWord;
      //rWordNumData,
      rEventID : int64 ;
      rWordGameMul : Word;
      fdStream  : TFileStream;
      fRecHeader: TRecFileHeader;
  begin
    result := FALSE;

    if not FileExists(aFName) then
      exit;

    if FReplayStatus = rsCreated then begin
      FFileName := aFName;

      fdStream := TFileStream.Create(FFileName, fmOpenRead);

      // ...GetHeader...
      fdStream.ReadBuffer(fRecHeader, SizeOf(TRecFileHeader));

      if (fRecHeader.PrimaryID <> CONST_FileReplayCurrentVersion.PrimaryID)
        or (fRecHeader.SecondaryID <> CONST_FileReplayCurrentVersion.SecondaryID)
        or (fRecHeader.Version <> CONST_FileReplayCurrentVersion.Version)
        or (fRecHeader.Revision <> CONST_FileReplayCurrentVersion.Revision)
      then
      begin
        raise Exception.Create('Invalid File Replay.');
        exit;
      end;

      fdStream.Seek(2, soCurrent);

      // ...Scenario Info...
      fdStream.ReadBuffer(FScenarioInfo, SizeOf(TRecScenario_Definition));
      fdStream.Seek(2, soCurrent);

      FDataStart := fdStream.Position ;
      lastPos    := fdStream.Position;

      // ...First Line Data...
      //   . timeStamp
      readCount := fdStream.Read(rLongWord, CONST_SZOF_LONGWORD);
      lastPos := lastPos + readCount;

      //   . gameSpeedMultiplier
      readCount := fdStream.Read(rWordGameMul, CONST_SZOF_WORD);
      lastPos := lastPos + readCount;

      while readCount > 0 do
      begin
        readCount := fdStream.Read(rEventID, CONST_SZOF_Int64);
        lastPos := lastPos + readCount;

        if readCount > 0 then begin
          {*} AddToFrameIndex(lastPos, rLongWord, rWordGameMul, rEventID);
          //seekCount := rWordNumData * CONST_SZOF_RECOBJDATA +2;  // +2 for CRLF

          seekCount := 2;
          case rEventID of
            CPID_CMD_OVERLAYDYNAMICSHAPE:seekCount := CONST_SZOFR_Cmd_OverlayDynamicShape+ 2;
            CPID_CMD_VECTAC:seekCount := CONST_SZOFR_Vectac+ 2;
            CPID_CMD_TARGET_IFF:seekCount := CONST_SZOFR_Cmd_TargetIFF+ 2;
            //CPID_PLATFORM_FREEME:seekCount := CONST_SZOFR_PlatformFreeMe+ 2;
            CPID_CMD_DATALINK_REMOVETRACK:seekCount := CONST_SZOFR_Cmd_DataLink_RemoveTrack+ 2;
            CPID_CMD_MODIF_COMM:seekCount := CONST_SZOFR_ModifComm+ 2;
            CPID_CMD_PLATFORM_HANCUR : seekCount := CONST_SZOFR_PlatformHancur+ 2;
            CPID_CMD_WEAPON_OUT : seekCount := CONST_SZOFR_WeaponOut+ 2;
            CPID_CMD_PLATFORM_HIT_PLATFORM:seekCount := CONST_SZOFR_PlatformHitPlatform+ 2;
            CPID_CMD_MAPS :seekCount := CONST_SZOFR_MapData+ 2;
            {
            CPID_SYNCH_TORPEDO :
            CPID_SYNCH_MISSILE :
            CPID_SYNCH_VEHICLE :
            CPID_PLATFORM_FREEME :
            }
            CPID_GAME_SETTING :seekCount := CONST_SZOFR_Cmd_GameSetting+ 2;
            CPID_CMD_LAUNCH_TORPEDO :seekCount := CONST_SZOFR_Cmd_LaunchMissile+ 2;
            CPID_CMD_LAUNCHER_CHAFF_PROPS :seekCount := CONST_SZOFR_Cmd_ChaffLauncherProperties+ 2;
            CPID_CMD_LAUNCHER_CHAFF_STATE :seekCount := CONST_SZOFR_Cmd_LaunchChaffState+ 2;
            CPID_CMD_LAUNCH_CHAFF :seekCount := CONST_SZOFR_Cmd_LaunchChaff+ 2;
            CPID_CUBICLEASSIGN :seekCount := CONST_SZOF_CubAssign+ 2;
            CPID_CMD_ENVI :seekCount := CONST_SZOFR_Sinc_Envi+ 2;
            CPID_CMD_Missile_Envi :seekCount := CONST_SZOFR_Missile_envi+ 2;
            CPID_SincBOLW :seekCount := CONST_SZOFR_Sinc_BOLW+ 2;
            CPID_SincRBLW :seekCount := CONST_SZOFR_Sinc_RBLW+ 2;
            CPID_SincWaypoint :seekCount := CONST_SZOFR_Sinc_Waypoint+ 2;
            CPID_CMD_SYNC_HIT_MINE_BOMB :seekCount := CONST_SZOFR_Cmd_Sync_Hit_BombMine+ 2;
            CPID_CMD_LAUNCH_MINES :seekCount := CONST_SZOFR_Cmd_LaunchMine+ 2;
            CPID_CMD_LAUNCH_BOMB :seekCount := CONST_SZOFR_Cmd_LaunchBomb+ 2;
            CPID_CMD_LAUNCHER_BUBBLE_PROPS :seekCount := CONST_SZOFR_Cmd_ChaffLauncherProperties+ 2;
            CPID_CMD_LAUNCHER_BUBBLE_STATE :seekCount := CONST_SZOFR_Cmd_LaunchChaffState+ 2;
            CPID_CMD_LAUNCH_BUBBLE :seekCount := CONST_SZOFR_Cmd_LaunchChaff+ 2;
            CPID_CMD_ENGAGEMENTMODE :seekCount := CONST_SZOFR_EngagementModeWeapon+ 2;
            CPID_CMD_FIRINGMODE :seekCount := CONST_SZOFR_Cmd_FiringModeWeapon+ 2;
            CPID_CMD_CHANGE_TRACK_NUMBER :seekCount := CONST_SZOFR_Cmd_Platform_CHANGE_TRACKNUMBER+ 2;
            CPID_CMD_EMBARK_LAND :seekCount := CONST_SZOFR_Cmd_Embark_Landing+ 2;
            CPID_CMD_ASSIGN_FIRECONTROL :seekCount := CONST_SZOFR_Cmd_FC+ 2;
            CPID_CMD_DATALINK_ADDTRACK :seekCount := CONST_SZOFR_Cmd_DataLink_AddTrack+ 2;
            CPID_CMD_DATALINK :seekCount := CONST_SZOFR_Cmd_DataLink+ 2;
            CPID_CMD_MERGE_TRACK : seekCount := CONST_SZOFR_Cmd_MergeTrack+ 2;
            CPID_CMD_PLATFORM_REPAIR :seekCount := CONST_SZOFR_Cmd_Platform_Repair+ 2;
            CPID_CMD_ESM_SET_PROPERTY :seekCount := CONST_SZOFR_Cmd_ESM_SET_PROPERTY+ 2;
            CPID_CMD_UPDATE_NRP_PROPERTY :seekCount := CONST_SZOFR_Cmd_NRP_SET_PROPERTY+ 2;
            CPID_CMD_UPDATE_PLATFORM_PROPERTY :seekCount := CONST_SZOFR_Cmd_Platform_SET_PROPERTY+ 2;
            CPID_CMD_REMOVE_PLATFORM :seekCount := CONST_SZOFR_Cmd_SelectPlatformToRemove+ 2;
            CPID_CMD_DYNAMIC_TRACK :seekCount := CONST_SZOFR_Cmd_OverlayDynamicTrack+ 2;

            CPID_CMD_OVERLAYTEMPLATE :seekCount := CONST_SZOFR_Cmd_OverlayTemplate+ 2;
            CPID_CMD_OVERLAYSTATICSHAPE :seekCount := CONST_SZOFR_Cmd_OverlayStaticShape+ 2;
            CPID_CMD_PLOTTINGSHAPE :seekCount := CONST_SZOFR_rCmd_PlottingShape+ 2;
            CPID_CMD_SHIPINGROUTE :seekCount := CONST_SZOFR_Cmd_ShipingRoute+ 2;
            CPID_CMD_CHANGE_LOGISTIC :seekCount := CONST_SZOFR_Cmd_Change_Logistic+ 2;
            CPID_CMD_LOGISTIC_STATUS :seekCount := CONST_SZOFR_Cmd_State_logistic+ 2;
            CPID_CMD_RAMP :seekCount := CONST_SZOFR_Cmd_RampController+ 2;
            CPID_CMD_TRANSPORT :seekCount := CONST_SZOFR_Cmd_Transport+ 2;


            CPID_CMD_LAUNCH_NON_RUNTIME_PLATFORM :seekCount := CONST_SZOFR_Cmd_LaunchNonRP+ 2;
            CPID_CMD_LAUNCH_RUNTIME_PLATFORM :seekCount := CONST_SZOFR_Cmd_LaunchRP+ 2;
            CPID_TCP_REQUEST :seekCount := CONST_SZOFR_TCP_Request+ 2;
            CPID_CMD_GAME_CTRL :seekCount := CONST_SZOFR_Cmd_GameCtrl+ 2;
            {
            CPID_CMD_GUN_FIRE_STATE :
            }
            CPID_CMD_GUN_FIRE :seekCount := CONST_SZOFR_Cmd_GunFire+ 2;
            CPID_CMD_LAUNCH_MISSILE :seekCount := CONST_SZOFR_Cmd_LaunchMissile+ 2;
            CPID_CMD_SYNCH :seekCount := CONST_SZOFR_CmdSYNCH+ 2;
            CPID_CMD_LAUNCH_EMBARK :seekCount := CONST_SZOFR_Cmd_Embark+ 2;
            CPID_CMD_SENSOR_IFF :seekCount := CONST_SZOFR_Cmd_SensorIFF+ 2;
            CPID_CMD_SENSOR :seekCount := CONST_SZOFR_Cmd_Sensor+ 2;
            CPID_CMD_RADAR_NOISE_JAMMER :seekCount := CONST_SZOFR_RadarNoiseJammer+ 2;
            CPID_CMD_ENGAGE_TRACK :seekCount := CONST_SZOFR_Cmd_EngageTrack+ 2;
            CPID_CMD_PLATFORM_REPOS :seekCount := CONST_SZOFR_Cmd_Platform_MOVE+ 2;
            CPID_CMD_SET_STATUS :seekCount := CONST_SZOFR_Cmd_Set_Status+ 2;
            CPID_CMD_SET_QUANTITY :seekCount := CONST_SZOFR_Cmd_Set_Quantity+ 2;
            CPID_CMD_SET_LAUNCHERQTY :seekCount := CONST_SZOFR_Cmd_Set_LauncherQty+ 2;
            CPID_CMD_EMCON_MODE :seekCount := CONST_SZOFR_Cmd_ModeEmcon+ 2;
            CPID_CMD_PLATFORM :seekCount := CONST_SZOFR_Cmd_Platform+ 2;
          end;

          if rEventID <> -1 then
          begin
             fdStream.Seek(seekCount, soCurrent);
             lastPos := lastPos + seekCount;
          end;
        end;

        readCount := fdStream.Read(rLongWord, CONST_SZOF_LONGWORD);
        lastPos := lastPos + readCount;

        readCount := fdStream.Read(rWordGameMul, CONST_SZOF_WORD);
        lastPos := lastPos + readCount;
      end;

      fdStream.Free;
      result := TRUE;
    end;
  end;

//  function TNewReplay.ReadFrameData(const aFrameIndex: integer;
//                             //var aData: arrRecObjectData): boolean;
//                             var aData: PAnsiChar): boolean;
//  var //i : integer;
//      //numOfDat : Word;
//      fdStream : TFileStream;
//
//      rCmd_Platform       : TRecCmd_Platform;
//      rCmd_Platform_MOVE  : TRecCmd_Platform_MOVE;
//      rCmd_Sensor         : TRecCmd_Sensor ;
//      rCmd_Embark         : TRecCmd_Embark ;
//      rCmdSYNCH           : TRecCmdSYNCH;
//      rCmd_LaunchMissile  : TRecCmd_LaunchMissile;
//      rCmd_GunFire        : TRecCmd_GunFire ;
//  begin
//    result := (aFrameIndex >= 0) AND (aFrameIndex < FFrameIndexCount);
//    if not result then exit;
//
//    fdStream := TFileStream.Create(FFileName, fmOpenRead);
//    fdStream.Seek( FFrameIndexList[aFrameIndex].FilePos   , soFromBeginning);
//
//    { sam change for event id
//    numOfDat:= FFrameIndexList[aFrameIndex].NumOfData;
//    setLength(aData, numOfDat);
//    for i := 0 to numOfDat-1 do
//      fdStream.ReadBuffer(aData[i], CONST_SZOF_RECOBJDATA);
//    }
//
//    aData := '';
//    case FFrameIndexList[aFrameIndex].EventID of
//      CPID_CMD_PLATFORM :
//        begin
//           fdStream.ReadBuffer( rCmd_Platform , CONST_SZOFR_Cmd_Platform);
//           aData := @rCmd_Platform;
//        end;
//      CPID_CMD_PLATFORM_REPOS :
//        begin
//          fdStream.ReadBuffer( rCmd_Platform_MOVE , CONST_SZOFR_Cmd_Platform_MOVE);
//          aData := @rCmd_Platform_MOVE;
//        end;
//      CPID_CMD_SENSOR :
//      begin
//          fdStream.ReadBuffer( rCmd_Sensor , CONST_SZOFR_Cmd_Sensor);
//          aData := @rCmd_Sensor;
//      end;
//      CPID_CMD_LAUNCH_EMBARK :
//        begin
//          fdStream.ReadBuffer( rCmd_Embark , CONST_SZOFR_Cmd_Embark);
//          aData := @rCmd_Embark;
//        end;
//      CPID_CMD_SYNCH :
//        begin
//          fdStream.ReadBuffer( rCmdSYNCH , CONST_SZOFR_CmdSYNCH);
//          aData := @rCmdSYNCH;
//        end;
//      CPID_CMD_LAUNCH_MISSILE :
//        begin
//          fdStream.ReadBuffer( rCmd_LaunchMissile , CONST_SZOFR_Cmd_LaunchMissile);
//          aData := @rCmd_LaunchMissile;
//        end;
//      CPID_CMD_GUN_FIRE :
//        begin
//          fdStream.ReadBuffer( rCmd_GunFire , CONST_SZOFR_Cmd_GunFire);
//          aData := @rCmd_GunFire;
//        end;
//    end;
//
//    fdStream.Free;
//  end;

  function TNewReplay.GetCurrentFrameFilePos: Int64;
  begin
      Result := FFrameIndexList[CurrentFrame].FilePos ;
  end;

//- {private_methods_internal_playing} -----------------------------------------
//-

  procedure TNewReplay.PlayNextFrame;
  var prevFrame : integer;
      deltaT               : LongWord;
  begin
    // FrameEventID
    if Assigned(FOnFrameReplay) then
        FOnFrameReplay(FrameEventID[FCurrentFrame], FCurrentFrame,  FFrameIndexList[FCurrentFrame].Tick);

    FAfterSeek    := FALSE;

    if FCurrentFrame < (FFrameIndexCount-1) then begin
      prevFrame     := FCurrentFrame;
      FCurrentFrame := FCurrentFrame + 1;

      // ReadFrameData(FCurrentFrame, FDataCurrent);

      FDataCurentTick := FFrameIndexList[FCurrentFrame].Tick;

//      if Assigned(OnUpdateTime) then
//        OnUpdateTime(FDataCurentTick);

      deltaT := FFrameIndexList[FCurrentFrame].Tick -
        FFrameIndexList[prevFrame].Tick;

      FTimer.Interval := Round(
        (FFrameIndexList[prevFrame].SpeedMultiply / FSpeedMultiply) * deltaT - 0.5);

    end
    else begin
      //  if  end of frame then change status.
      FReplayStatus := rsEnd;

      if Assigned(FOnEndReplay) then FOnEndReplay(self);

    end;
  end;

//- {private_methods_timer_event_handler} --------------------------------------
//-

  procedure TNewReplay.OnTimerHandler(sender: TObject);
  begin
    if FReplayStatus = rsRePlay then
      PlayNextFrame;

    if FReplayStatus = rsEnd then begin
      FTimer.Suspend;
      FReplayStatus := rsOpenFile;
    end;
  end;

//- {private_methods_property_frame_fnfo} -------------------------------------
//-

  function TNewReplay.getFrameTick(ix: integer): LongWord;
  begin
    if (ix >=0) and (ix < FFrameIndexCount) then
      result := FFrameIndexList[ix].Tick
    else
      result := 0
  end;

  {
  /// sam change for event id
  function TNewReplay.getFrameNumOfData(ix: integer): LongWord;
  begin
    if (ix >=0) and (ix < FFrameIndexCount) then
      // result := FFrameIndexList[ix].NumOfData
    else
      result := 0
  end;
  }

  function TNewReplay.getFrameEventID(ix: integer) : Int64;
  begin
    if (ix >=0) and (ix < FFrameIndexCount) then
      result := FFrameIndexList[ix].EventID
    else
      result := 0
  end;

  function TNewReplay.getFrameLength: integer;
begin
  result := Length(FFrameIndexList);
end;


function TNewReplay.getFrameRecord(index: integer): TReplayReadData;
begin
  if index < Length(FFrameIndexList) then
    result := FFrameIndexList[index];
end;

function TNewReplay.getFrameSpeedMultiplier(ix: integer) : Word;
  begin
    if (ix >=0) and (ix < FFrameIndexCount) then
      result := FFrameIndexList[ix].SpeedMultiply
    else
      result := 1
  end;

  procedure TNewReplay.setSpeedMultiplier(aMult: word);
  begin
    FSpeedMultiply := aMult;
  end;

//- {public_methods_File_Handling} ---------------------------------------------
//-

  function  TNewReplay.OpenFileReplay(const aFName: string ): boolean;
  begin
    result := FALSE;
    if FReplayStatus <> rsCreated then exit;

    if not GetFileReplayInfo(aFName) then exit;

    if FFrameIndexCount > 1 then begin
      FReplayStatus := rsOpenFile;
    end;

    result := TRUE;
  end;

  procedure TNewReplay.CloseFileReplay;
  begin
    FFileName     := '';

    FDataStart    := 0;
    FLastDataPos  := 0;
    FCurrentFrame := 0;

    FReplayStatus := rsCreated;
  end;

//- {public_methods_Play_Function} ---------------------------------------------
//-

  procedure TNewReplay.StartPlay;
  var nextFrame, deltaT: integer;
  begin
    if (FReplayStatus = rsOpenFile) then begin
      FReplayStatus := rsRePlay;

      FCurrentFrame := 0;

      // ReadFrameData(FCurrentFrame, FDataCurrent);
      FDataCurentTick := FFrameIndexList[FCurrentFrame].Tick;

      nextFrame := FCurrentFrame +1;
      if nextFrame < FFrameIndexCount then begin

        deltaT  := FFrameIndexList[nextFrame].Tick -
              FFrameIndexList[FCurrentFrame].Tick;

        FTimer.Interval := Round(
            (FFrameIndexList[FCurrentFrame].SpeedMultiply / FSpeedMultiply) * deltaT -0.5);
      end;

      FTimer.Resume;
    end;
  end;

  procedure TNewReplay.StopPlay;
  begin
    if (FReplayStatus = rsReplay) then
      FTimer.Suspend;

    if (FReplayStatus = rsRePlayPause)
        or  (FReplayStatus = rsReplay)
        or  (FReplayStatus = rsEnd)
        then
      FReplayStatus := rsOpenFile;
  end;

procedure TNewReplay.PausePlay;
  begin
    if (FReplayStatus = rsRePlay) then begin
      FTimer.Suspend;
      FReplayStatus := rsRePlayPause;
    end;
  end;

  procedure TNewReplay.ResumePlay;
  begin
    if FReplayStatus = rsRePlayPause then begin
      FReplayStatus := rsRePlay;
      FTimer.Resume;
    end;
  end;

  procedure TNewReplay.SeekPlay(const aFrameIndex: integer);
  begin
    if FReplayStatus = rsReplay then
      FTimer.Suspend;

    if (aFrameIndex > 0 ) and (aFrameIndex < FFrameIndexCount) then begin
      FCurrentFrame := aFrameIndex;
      // ReadFrameData(FCurrentFrame, FDataCurrent);
    end;
    FAfterSeek    := TRUE;

    if FReplayStatus = rsReplay then
      FTimer.Resume;
  end;

//- {public_method_HistoryFunction} --------------------------------------------
//--

  {
  procedure TNewReplay.GetPositionHistory(var aHistList:  aACHistory;
     const aFrameIx: integer=-1);
  var i, j, k, maxFrame: integer;
      //tmpData: arrRecObjectData;
      tmpData: PAnsiChar;
      numOfAC: integer;

  begin
    if aFrameIx = -1 then
      maxFrame := FCurrentFrame
    else
      maxFrame := aFrameIx;

    ReadFrameData(maxFrame, tmpData);
    numOfAC:= Length(tmpData);
    setLength(aHistList, numOfAc);

    for j := 0 to numOfAC-1 do begin
       aHistList[j].ACID := tmpData[j].FData.Platform_Instance_Index;
       SetLength(aHistList[j].HistoryData, maxFrame+1);
       aHistList[j].HistoryCount := 0;
    end;

    for i := maxFrame-1 downto 0 do begin
      ReadFrameData(i, tmpData);

      for j := 0 to Length(tmpData)-1 do begin
        k := 0;
        while (k <  numOfAC) and (tmpData[j].FData.Platform_Instance_Index <> aHistList[k].ACID) do
          inc(k);

        if (k < numOfAC) then //*found*// begin
          aHistList[k].HistoryData[aHistList[k].HistoryCount].CoordX :=
            tmpData[j].PositionX;
          aHistList[k].HistoryData[aHistList[k].HistoryCount].CoordY :=
            tmpData[j].PositionY;

          aHistList[k].HistoryCount := aHistList[k].HistoryCount +1;
        end;
      end;
    end;
  end;
  }

end.
