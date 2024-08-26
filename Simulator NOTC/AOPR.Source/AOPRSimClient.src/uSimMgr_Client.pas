unit uSimMgr_Client;

interface

uses
  MapXLib_TLB, Windows, Classes, Graphics, SysUtils, uCompassVisual, uObjectVisuals,
  uT3SimManager, uLibSettingTTT, uThreadTimer, uDataModuleTTT,
  uGameData_TTT, uNetSessionData, uSnapshotRec, uSteppers, uT3UnitContainer, uT3Unit,
  uSimObjects, uT3GroupList, uT3Vehicle, uDBCubicles, uT3Weapon, uT3counterMeasure, uT3Missile,
  uT3Gun, uT3Torpedo, uT3Bomb, uT3Mine, uT3Visual, uDBAsset_Scripted,
  uT3DetectedTrack, uT3DataLink, uT3Sensor, uDBAssetObject,uMainStrategi,
  uT3MissileDetail, uT3MissileEnvironment, newClassASTT, uExecuter, uCommTTT,
  Registry, MMSystem, uDBAsset_Vehicle, uSnapshotData, uT3Sonobuoy,
  uT3DefensiveJammer, tttData, Dialogs, uDataTypes,uMainPlottingShape,
  uDrawOverlay, uDrawStrategi, uDrawLogisticTemplate, uMainOverlay, uEventSummary,
  uMainLogisticTemplate, uDBAsset_Embark_Library, Controls, Forms, uT3GroupVehicle;

type

  // ==============================================================================
  // TTT simCenter
  // contain: 'session' , scenario management,  objects run..


  // ==============================================================================
  TNotifyGameCtrl = procedure(const r: TRecCmd_GameCtrl) of object;
  TOnUpdateMessageSent = procedure (const MessageValue : TRecSendMessage) of object;
  TOnUpdateProgress = procedure (const percentVal : integer) of object;

  // ==============================================================================

  {Nando Add for Channel Mapping}
  TChannelMapping = class
  private
  public
    GroupID : integer;
    GroupName : string;
    //--> nando added for List Comm each group
    ListComChannelMapping : TList;
    ListComChannelAvailable : Tlist;

    constructor create;
    destructor Destroy; override;

    procedure ChangeLabelChannelDef(chNumber : Integer;
                                    ChannelIdent, ChannelCode : string;
                                    ChannelFreq : Double);
    procedure ChangeInterferenceChannel(chNumber : integer;
                                  ChInterference : TModifCommInterference);
    procedure ChangeBandChannelDef(chNumber : Integer; ChannelBand : Byte);
    procedure ChangeBandSecure(chNumber : Integer; Secure : Boolean);
    procedure RemoveChannelDef(chNumber : integer);

    //Channel Mapping
    procedure AddtoChannelMapping(rec : TRecExternal_Communication_Channel);
    procedure RemoveChannelMapping(chNumber : integer);
    procedure ClearChannelMapping;
    //Channel Available
    procedure AddtoChannelAvailable(rec : TRecExternal_Communication_Channel);
    procedure RemoveChannelAvailable(chNumber : integer);
    procedure ClearChannelAvailable;
  end;

  TSimMgr_Client = class(TT3SimManager)
  protected
    FUpdateThread: TMSTimer;
    FUpdateDelay: TDelayer; // update from data,
    FConnectDelay: TDelayer;
    FUpdateCenterDelay: TDelayer;
    FUpdateDataLink : TDelayer;
    FUpdateForMessagehandling : Tdelayer;

    FCompass: TCompassVisual;
    FRangeRing: TRangeRingsVisual;
    FLineVisual: TLineVisual;
    FMovePlatformLine : TLineVisual;

    FTargetSymbol : TBitmapSymbolLDropPoint;
    FFlashPointNGS : TBitmapSymbolLDropPoint;

    FTrackNumber: integer;
    FMyIPAddress: string;

    FCubicleList: T3GroupList;
    FMyCubicleName, FMyConsoleName: string;

    FShipTacticalInfo : array [0..2] of String;

    FClientRole: integer;
    FConsoleRole: integer;

    FLatitude: Double;
    FLongitude: Double;

    procedure FGameThread_OnRunning(const dt: double); override;
    procedure FGameThread_OnPaused(const dt: double); override;
    procedure FUpdateThread_OnTerminate(sender: TObject); virtual;
    procedure FUpdateThread_OnRunning(const dt: double); virtual;
    procedure FUpdateThread_OnPaused(const dt: double); virtual;

    procedure FNetworkThread_OnRunning(const dt: double);override;
    procedure FNetworkThread_OnPaused(const dt: double); override;

    procedure FNetworkThreadVBS_OnRunning(const dt: double);override;
    procedure FNetworkThreadVBS_OnPaused(const dt: double); override;

    procedure FOnUpdateDelay(sender: TObject);
    procedure FOnConnectDelay(sender: TObject);
    procedure FOnUpdateCenterDelay(sender: TObject);
    procedure FOnUpdateMessageHandling(Sender : TObject);
    procedure OnTrackBlinking(sender: TObject; Value: Boolean);
  private
//    FCubAssignList: T3CubicleGroupList;
    FOnReceivedSensorCommand: TNotifyEvent;
    FOnMapViewChange: TNotifyEvent;

    FTimeFlag: integer;
    FTimeReq: Longword;
    FLastSecond: word;

    FOnUpdateForm: TNotifyEvent;
    FOnUpdateTime: TNotifyEvent;
    FOnUpdateCenter: TNotifyEvent;
    FEventCounter: integer;
    FIsInstructor: Boolean;

    FOnUpdateMessage : TOnUpdateMessageSent;
    FPlatformViewMode: Boolean;
    FTacticalDinamicSymbol : Boolean;
    FTacticalStaticSymbol : Boolean;
    FOnUpdateGotoProgress: TOnUpdateProgress;
    FTimeElapse : Extended;
    FIsGotoMode : Boolean;
    FIsConnected3D : Boolean;
    FIsFinish3DData: Boolean;

    FPIDControlledPlatform: Integer;

    procedure LogEventRecv(recID: integer);
    procedure UnAssginedDetTrackEvent;
    procedure QueryDetectedTracksByPlatform(aPlatformID: integer;
      var arrIDs: TIntegerArray);

    procedure SetPlatformViewMode(const Value: Boolean);
    procedure SetTacticalDinamicSymbol(const Value: Boolean);
    procedure SetTacticalStaticSymbol(const Value: Boolean);
    function GetShipTacticalInfo(const Index: Integer): string;
    procedure SetShipTacticalInfo(const Index: Integer; const Value: string);
    procedure SetOnUpdateGotoProgress(const Value: TOnUpdateProgress);

  protected
    // receive UDP
    procedure netRecv_PlatformMovement(apRec: PAnsiChar; aSize: word);
    procedure netRecv_PlatformLandData(apRec: PAnsiChar; aSize: word);
    procedure netRecv_GameTime(apRec: PAnsiChar; aSize: word);
    procedure netRecv_GameControlInfo(apRec: PAnsiChar; aSize: word);
    procedure netRecv_MissileSynchtarget(apRec: PAnsiChar; aSize: word);
    procedure netRecv_PlatformReposition(apRec: PAnsiChar; aSize: word);
    procedure netRecv_PlatformTrackNumber(apRec: PAnsiChar; aSize: word);
    procedure netRecv_LaunchHybrid(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_PlatformMovementArray(apRec: PAnsiChar; aSize: word);
    procedure netRecv_Synch_Pos_VBS(apRec: PAnsiChar; aSize: word); override;

    // receive TCP
    procedure netRecv_CmdSensor(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdUpdateSonar(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdUpdateActualCable(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdSonarDeploy(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdIFFSearchMode(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdSensorIFF(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdTargetIFF(apRec: PAnsiChar; aSize: word);

    procedure netRecv_CmdTransport(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdTransportProcess(apRec: PAnsiChar; aSize: word);
    procedure netRecv_EmbarkedPlatformData(apRec: PAnsiChar; aSize: word);

    procedure netRecv_CmdEmbark(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdDisembarkTemporary(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdDisembarkPersonelTemporary(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdReturnToBase(apRec: PAnsiChar; aSize: word);

    procedure netRecv_CmdEmbarkPersonelTemporary(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdSYNCH(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdVersion(apRec: PAnsiChar; aSize: word);

    procedure netRecv_CmdLaunchMissile(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdMissileProperties(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdMissileEngageProperties(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdLaunchChaff(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdLauncherProperties(apRec: PAnsiChar; aSize: word);

    procedure netRecv_CmdDecoys(apRec: PAnsiChar; aSize: word);

    // Bubble
    procedure netRecv_CmdLaunchBubble(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdBubbleLauncherProperties(apRec: PAnsiChar;
              aSize: word);
    procedure netRecv_CmdLaunchBubbleState(apRec: PAnsiChar; aSize: word);
    // Mine
    procedure netRecv_CmdLaunchMines(apRec: PAnsiChar; aSize: word);
    // Bomb
    procedure netRecv_CmdLaunchBomb(apRec: PAnsiChar; aSize: word);
    // Sonobuoy
    procedure netRecv_CmdLaunchSonobuoy(apRec: PAnsiChar; aSize: word);
    // hit bomb mine sync
    procedure netRecv_CmdSync_Hit_Mine_Bomb(apRec: PAnsiChar; aSize: word);

    procedure netRecv_CmdGunFire(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_CmdGunFireState(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_CmdGunFlash(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_CmdGameControl(apRec: PAnsiChar; aSize: word);
    procedure netRecv_Synch_Object(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdLaunch_RP(apRec: PAnsiChar; aSize: word);
    procedure netRecv_Session_Cub_Assign(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdRemovePlatfromByOperator(apRec: PAnsiChar;aSize: word);
    procedure netRecv_CmdLaunch_NonRP(apRec: PAnsiChar; aSize: word);

    {$REGION ' Overlay Recive '}
    procedure netRecv_CmdOverlayTemplate(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdDynamicTrack(apRec: PAnsiChar; aSize: word);

    procedure netRecv_CmdOverlayDynamicShape(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdOverlayStaticShape(apRec: PAnsiChar; aSize: word);

    procedure netRecv_BringToFront_OverlayDynamicShape(apRec: PAnsiChar; aSize: word);
    procedure netRecv_BringToFront_OverlayStaticShape(apRec: PAnsiChar; aSize: word);

    procedure netRecv_SendToBack_OverlayDynamicShape(apRec: PAnsiChar; aSize: word);
    procedure netRecv_SendToBack_OverlayStaticShape(apRec: PAnsiChar; aSize: word);
    {$ENDREGION}

    {$REGION ' Plotting Recive '}
    procedure netRecv_CmdPlottingShape (apRec: PAnsiChar; aSize: word);
    {$ENDREGION}

    {$REGION ' Shiping Route Recive '}
    procedure netRecv_CmdShipingRoute(apRec: PAnsiChar; aSize: word);
    {$ENDREGION}

    procedure netRecv_CmdTransferSonobuoy(apRec: PAnsiChar; aSize: word);
    procedure netRecv_Cmd_RampController(apRec: PAnsiChar; aSize: word);

    procedure netRecv_Cmd_MergeTrack(apRec: PAnsiChar; aSize: word);
    procedure netRecv_Cmd_FireControl(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_CmdLaunchChaffState(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdLaunchTorpedo(apRec: PAnsiChar; aSize: word);
    procedure netRecv_GameSetting(apRec: PAnsiChar; aSize: word);
    procedure netRecv_PlatformFreeMe(apRec: PAnsiChar; aSize: word);

    { update deomain dan Identity }
    procedure netRecv_CmdUpdatePlatform_PROPERTY(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdChangeTrackNumber(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdUpdateNRP_PROPERTY(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdESM_CHANGE_PROPERTY(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CmdPlatform_Repair(apRec: PAnsiChar; aSize: word);
    procedure netRecv_SynchVehicle(apRec: PAnsiChar; aSize: word);
    procedure netRecv_SynchMissile(apRec: PAnsiChar; aSize: word);
    procedure netRecv_SynchTorpedo(apRec: PAnsiChar; aSize: word);

    // added by choco : Platform Removal Sumary
    procedure netRecv_PlatformHitPlatform(apRec: PAnsiChar; aSize: word);
    procedure netRecv_ModifComm(apRec: PAnsiChar; aSize: word);
    // ham 04052012
    procedure netRecv_WeaponInOut(apRec: PAnsiChar; aSize: word);
    procedure netRecv_PlatformHancurin(apRec: PAnsiChar; aSize: word);

    //added by choco : Vectac Plan
    procedure netRecv_Vectac(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_PlatformGroupChange(apRec: PAnsiChar; aSize: word);
    procedure netRecv_CopyChaffLauncherProperty(apRec: PAnsiChar; aSize: word);

    procedure netRecv_cmd_snapshot(apRec: PAnsiChar; aSize: word);
    {ESM sinc}
    procedure netRecv_Synch_ESMvarian(apRec: PAnsiChar; aSize: word);

    procedure netRecv_LastUpdatePlatform(apRec: PAnsiChar; aSize: word);

    //prosedure untuk update data waypoint yang dieksekusi selanjutnya;
    procedure netRecv_Synch_WaypointData(apRec: PAnsiChar; aSize: word);

    procedure netRecv_StateServer(apRec: PAnsiChar; aSize: Word);

    procedure netRecv_DataFromVBS(apRec: PAnsiChar; aSize: word);
    procedure netRecv_DataFromPRSNLVBS(apRec: PAnsiChar; aSize: word);

  protected
    function LaunchEmbarkPlatform(const rec: TRecCmd_Embark): TT3PlatformInstance; override;
    function DisembarkTransportedOld(const rec : TRecCmd_Embark ):TT3PlatformInstance; override;
    function DisembarkTransportedPersonel(const rec : TRecCmd_DisembarkPersonelTemporary ):TT3PlatformInstance; override;
    function TakeOffFromBase(const rec: TRecCmd_LaunchRP): Boolean; override;
    function ReturnTobase (const rec : TRecCmd_ReturnToBase ):Boolean; override;
    function LaunchRuntimePlatform(const rec: TRecCmd_LaunchRP): TT3PlatformInstance; override;
    function LaunchReferencePoint(const rec: TRecCmd_LaunchNonRP): TT3PlatformInstance; override;
    function UpdatePropertyPlatform(const rec: TRecCmd_Platform_SET_PROPERTY): TT3PlatformInstance; override;
    function UpdateNRPProperty(const rec: TRecCmd_NRP_SET_PROPERTY): TT3PlatformInstance;
    function isExistTrackNumber(const Value: integer): Boolean;
    function getMaxRadarRangeInShip(ship: TT3PlatformInstance): double;

    procedure ChangeTrackNumber(const rec: TRecCmd_Platform_CHANGE_TRACKNUMBER);
    procedure GunFire(rec: TRecCmd_GunFire); overload; override;
    procedure GunFire(rec: TRecCmd_GunFireState); overload; override;
    procedure OnBombMineHit(sender: TSimObject; Target: TSimObject; lethality: integer);
    procedure FGotoThread_OnRunning(const dt: double);override;

    procedure netRecv_CameraController(apRec: PAnsiChar; aSize: Word);

    procedure netRecv_ShipTouchGround(apRec: PAnsiChar; aSize: Word);

  public
    MyWasdalRoleOnGroup : Integer; {0: Wasdal pinggir; 1: Wasdal tengah}
    MyForceDesignation : integer;   // default -1 : instruktur, selain itu punya force

    MyCenterHookedPlatfom : TSimObject;
    MyRingHookedPlatfom : TSimObject;

    {Nando}
    ListQueueMessage : TList;         //-> nando added for Queue Message Send
    ListComChannel : Tlist;

    {Avi}
    ListTotalValue : TStringList;
    FListFile : TStringList;

    ListDB_GameAreaIdentifier, ListDB_IDGameArea : TList;
    ListDB_GameAreaDefinition : TList;

    lastZoom : Double;
    lastArea : string;
    MapCenter_X, MapCenter_Y : Double;

    constructor Create(Map : TMap);
    destructor Destroy; override;

    procedure GameStart; override;
    procedure GamePause; override;

    procedure GameTerminate; override;
    procedure ApplyCubicleSetting;
    procedure GetALLConsoleInfo;
    procedure LoadScenarioID(const vSet: TGameDataSetting); override;
    procedure InitNetwork; override;
    procedure StopNetwork; override;

    // Tambahan : Prince
    procedure netRecv_CmdTorpedoSyncPanelWeapon(apRec: PAnsiChar; aSize: word);override;
    procedure netRecv_CmdBombSyncPanelWeapon(apRec: PAnsiChar; aSize: word);override;
    procedure netRecv_CmdTorpedoProperty(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_CmdBombProperty(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_CmdMineProperty(apRec: PAnsiChar; aSize: word); override;

    //add by bebe
    procedure LoadPredefinedPattern;
    procedure Split (const Delimiter: Char; Input: string; const Strings: TStrings) ;

    function FindNearestDetectedTrack(const px, py: double; const maxDist: integer): TSimObject;
    function FindNearestRBLWaypointTrack(const px, py: double; const maxDist: integer): TSimObject;
    function FindNearestBOLWaypointTrack(const px, py: double; const maxDist: integer): TSimObject;
    function GetBiggestTrackNumber: integer;

    procedure RequestAllCubicleAssignment;
    procedure LogNetworkEvent(const Value: String);

    // assign weapon event;
    procedure AssignPlatformInstanceEvent(pi: TT3PlatformInstance); override;
    procedure OnVehicleReadyLanding(sender: TObject); override;
    procedure SnapshotSetMyCubicleGroup;
    procedure SnapshotLoadFile( fName : string ) ;

  public
    // overlayRecord : ToverlayRecord;
    RemainingDay : TDateTime;
    EventSummaryList : TList;

    fOver: string;
    tambah: integer;
    InitFirstReplay: integer;
    FAllConsoleInfo: TStringList;
    FMyCubGroup, FMyCubController, FMyCubUnassined: T3CubicleGroup;

    SimDetectedTrackList: TT3UnitContainer;
    ControlledPlatform: TT3PlatformInstance;

    FRemoteServerCMD: TAppExecute;
    FRemoteClientCMD: TAppExecute;

    DrawGameCenter : TDrawGridOrigin;

    {Temporary}
    DrawFlagPoint : TDrawFlagPoint;
    DrawRuler : TDrawRuler;
    DrawPointRouteTemporary : TMainShipingRoute;

    TrackNumberWeapon: integer;

    FPatternMapping : TList;
    SubEnviArea : TSubEnvironmentArea;

    ControlledPlatformList : TList;
    lastCX, lastCY : Double;

    isFirstDraw : Boolean;

    procedure DrawAll(aCnv: TCanvas);
    procedure OnMapChange(sender: TObject);
    procedure netSend_CmdPlatform(const pi_id: integer;
        const ordID, ordType: Byte; const cmdParam: single);
    procedure netSend_CmdSetLauncherQty(const pi_id, weapon_id: integer;
        const launcher_id: Byte; const qty: integer);
    procedure netSend_CmdSetQuantity(const pi_id, wi_id: integer;
        const ordID, ordType: Byte; const cmdParam: integer;
        const dvcName: String = '');
    procedure netSend_CmdSetStatus(const pi_id, wi_id: integer;
        const ordID, ordType, cmdParam: Byte); // status
    procedure netSend_CmdEngageTrack(const pi_id, tgt_id, mis_id: integer;
              TrackID: string; isHaveLaunch: Byte);
    procedure netSend_CmdPlatform_Move(const pi_id: integer; const ordID: Byte;
        const x, y: double; const NRPIDGroup: integer);
    procedure netSend_CmdLastUpdatePlatform(rec : TRecCmd_LastUpdatePlatform);

    procedure netSend_CmdMultiMode(rec : TRecCmdMultiMode);

    {Prince}
    procedure LoadShape(fFile : String; tipe: Integer; overlay :TMainOverlayTemplate);
    procedure ChangeLogistic (const rec : TRecCmd_Change_Logistic); override;
    procedure ChangeLogisticState (const rec : TRecCmd_State_Logistic); override;
    procedure ChangeRampState(const rec : TRecCmd_RampController); override;
    {fajar}
    procedure LoadPlot(aName : string ; fFile: String; tipe: Integer;
    plotting: TMainPlottingTemplate);

    { aldy }
    procedure netSend_CmdPlatform_CHANGE_PROPERTY(rec: TRecCmd_Platform_SET_PROPERTY);
    procedure netSend_CmdTrack_CHANGE_TRACKNUMBER(rec: TRecCmd_Platform_CHANGE_TRACKNUMBER);
    procedure netSend_CmdNRP_CHANGE_PROPERTY(rec: TRecCmd_NRP_SET_PROPERTY);
    procedure netSend_CmdPlatform_Repair(rec: TRecCmd_Platform_Repair);
    procedure netSend_CmdESM_CHANGE_PROPERTY(rec: TRecCmd_ESM_SET_PROPERTY);
    { end }

    { nando }
    procedure netSend_CmdSyncWaypoint(rec: TrecSinc_Waypoint);
    procedure netSend_CmdSyncRBLW(rec: TrecSinc_RBLW);
    procedure netSend_CmdSyncBOLW(rec: TrecSinc_BOLW);
    procedure netSend_CmdSyncMissileEnvi(rec: TrecMissile_Envi);
    procedure netSend_CmdRecordAudio(rec: TRecRecordVoice);
    function GetTrackNumberForWeapon: integer;
    { end }

    function  GetTrackNumberForECM(ecm: TSimObject): integer;

    { farah }
    procedure AddListQueueMessage(rec : TRecSendMessage);

    procedure netSend_CmdSyncEnvi(rec: TrecSinc_Envi);
    procedure netSend_CmdRadarNoiseJammer(rec: TrecRadarNoiseJammer);
    procedure netSend_CmdSensor(const pi_id: integer; const sensType: Byte;
        const sensID: integer; const ordID, ordParam: Byte);
    procedure netSend_CmdIFFSearchMode(const pi_id : integer; const sensID: integer;
        const aMode : byte);
    procedure netSend_CmdSonarDeploy(const pi_id: integer; const sensID: integer;
        const aTime: Integer; const aParam: Byte; const fActualCable,fOrderCable: double);
    procedure netSend_CmdSensorIFF(const pi_id: integer; const tgt_id: integer;
        const sensID: integer; const index_mod: Byte; const check_mod: Boolean;
        const value_mod: integer);
    procedure netSend_CmdTargetIFF(const pi_id: integer; const tgt_id: integer;
        const sensID: integer);
    procedure netSend_CmdEmcon(const pi_id: integer; const EmcnCtgr: Byte;
        const sensID: integer; const ModeID, ordID, ordParam: Byte);

    {personel}
    procedure netSend_CmdPersonelMove(session_ID: Integer; pPlatformId: Integer; pHeading: Double; pMoveType: Byte; pFormationType: Byte);

    procedure netSend_CmdrReturnToBase (r : TRecCmd_ReturnToBase);
    procedure netSend_CmdRemoveTemporary(r: TRecCmd_SelectPlatformToRemove);
    procedure netSend_CmdDisembarkTransport(r: TRecCmd_Embark);

    {$REGION ' Transport Procedure'}
    procedure netSend_CmdTransport(r: TRecCmd_Transport);
    procedure netSend_CmDTransportProcess(r: TRecCmd_TransportProcess);
    procedure netSend_EmbarkedPlatformData(r: TRec_EmbarkedPlatformData);
    {$ENDREGION}

    procedure netSend_CmdDEmbarkPersonelTemporary(r: TRecCmd_EmbarkPersonelTemporary);
    procedure netSend_CmdDDisembarkPersonelTemporary(r: TRecCmd_DisembarkPersonelTemporary);
    procedure netSend_CmdLaunch_Embark(r: TRecCmd_Embark);
    procedure netSend_Cmd_Embark_Land(r: TRecCmd_Embark_Landing);
    procedure netSend_CmdLaunch_Missile(r: TRecCmd_LaunchMissile);
    procedure netSend_CmdMissileProperties(r: TRecFiringModeWeapon);
    procedure netSend_CmdMissileEngageProperties(r: TRecEngagementModeWeapon);
    procedure netSend_GameSetting(r: TRecCmd_GameSetting);
    procedure netSend_CmdLaunch_Torpedo(r: TRecCmd_LaunchMissile);
    procedure netSend_CmdGunFire(r: TRecCmd_GunFire);
    procedure netSend_CmdGameControl(r: TRecCmd_GameCtrl);
    procedure netSend_CmdLaunchRP(r: TRecCmd_LaunchRP);
    procedure netSend_CmdRemote(const mIP: string; const mColor: Byte; const mControl: Boolean; const ordID: Byte);
    procedure netSend_CmdLaunchNonRP(r: TRecCmd_LaunchNonRP);

    procedure netRecv_CmdRemote(apRec: PAnsiChar; aSize: word);
    procedure netRecv_Cmd_DataLink(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_platform_cmd(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_SetLauncherQty(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_SetQuantity(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_SetStatus(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_EngageTrack(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_CmdEmcon(apRec: PAnsiChar; aSize: word); override;
    procedure netSend_CmdDecoys(rec: TRecCmdDecoys);

    procedure netRecv_MultiMode(apRec: PAnsiChar; aSize: Word);

    procedure netRecv_Platform_PersonelMove(apRec: PAnsiChar; aSeize: Word); override;

    { nando }
    Procedure NetRecv_SincWaypoint(apRec: PAnsiChar; aSize: word); override;
    procedure NetRecv_SincRBLWMissile(apRec: PAnsiChar; aSize: word); override;
    procedure NetRecv_SincBOLWMissile(apRec: PAnsiChar; aSize: word); override;
    procedure NetRecv_SincMissileEnvi(apRec: PAnsiChar; aSize: word); override;
    procedure NetRecv_MessageHandling(apRec: PAnsiChar; aSize: word);
    // embark landing
    procedure netRecv_Cmd_Embark_Land(apRec: PAnsiChar; aSize: word); override;
    procedure FinishReadyingTime(const r : TRecCmd_Embark_Landing); override;
    procedure RemoveTemporary(const rec: TRecCmd_SelectPlatformToRemove);

    { farah }
    procedure NetRecv_cmd_environment(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_SyncBearingMissile(apRec: PAnsiChar; aSize: word);

    procedure netRecv_ControlledShip(apRec: PAnsiChar; aSize: word);

    {$REGION ' Overlay Send '}
    procedure netSend_CmdOverlayTemplate(r: TRecCmd_OverlayTemplate);
    procedure netSend_CmdDynamicTrack(r: TRecCmd_OverlayDynamicTrack);

    procedure netSend_CmdOverlayDynamicShape(r: TRecCmd_OverlayDynamicShape);
    procedure netSend_CmdOverlayStaticShape(r: TRecCmd_OverlayStaticShape);

    procedure netSend_BringToFrontStaticShape(r: TRecCmd_OverlayStaticShape);
    procedure netSend_BringToFrontDynamicShape(r: TRecCmd_OverlayDynamicShape);

    procedure netSend_SendToBackDynamicShape(r: TRecCmd_OverlayDynamicShape);
    procedure netSend_SendToBackStaticShape(r: TRecCmd_OverlayStaticShape);
    {$ENDREGION}

    {$REGION ' Plotting Send '}
    procedure netSend_CmdPlottingShape(r: TRecCmd_PlottingShape);
    {$ENDREGION}

    {$REGION ' Shiping Route Send '}
//    procedure netSend_CmdLogisticRoute(r: TRecCmd_LogisticRoute);
    procedure netSend_CmdShipingRoute(r: TRecCmd_ShipingRoute);
    {$ENDREGION}

    procedure netSend_CmdTransferSonobuoy(r: TRecCmd_TransferSonobuoy);
    procedure netSend_CmdTorpedoSyncPanelWeapon(r: TRecTorpedoPanelWeapon);
    procedure netSend_CmdBombSyncPanelWeapon(r: TRecBombPanelWeapon);
    procedure netSend_CmdTorpedoProperty(Platfrm_ID, TorpType, Order_type,
              WeaponIndex : Integer; Weapon_Name : string; Temp : Double);
    procedure netSend_CmdBombProperty(Platfrm_ID, InstanceIndex : Integer;
              Weapon_Name : string; Temp : Integer);
    procedure netSend_CmdMineProperty(Platfrm_ID, InstanceIndex : Integer;
              Weapon_Name : string; Temp : Double);

    procedure netSend_Cmd_MergeTrack(r: TRecCmd_MergeTrack);
    procedure netSend_Cmd_DataLink(r: TRecCmd_DataLink);
    procedure netSend_CMD_DataLink_AddTrack(r: TRecCmd_DataLink_AddTrack);
    procedure netSend_CMD_DataLink_RemoveTrack(r: TRecCmd_DataLink_RemoveTrack);
    procedure netSend_Cmd_FireControl(r: TRecCmd_FC);
    procedure netSend_CmdRemovePlatfromByOperator
              (r: TRecCmd_SelectPlatformToRemove);
    procedure netSend_CmdSnapshot( r : TRecCommandSnapshot );

    //ramp controller
    procedure netSend_cmdRampController(r: TRecCmd_RampController);

    procedure netSend_cmd_ControlledShip(r: TRec_ControlledShip);

    procedure netOnConnected(sender: TObject);
    procedure netVBSOnConnected(sender: TObject);
    procedure netVBSOnDisConnected(sender: TObject);
    procedure Log(const strHeader, strBody: string);
    procedure NotifyScaleMap(sender: TObject; var scale: double);

    function AddDetectedTrack(aTrack: TSimObject; sensor: TSimObject; value : Boolean; IsIns: Boolean): Boolean;
    function AddDetectedTrackByDataLink(idTrack: integer;
             dataLink: TT3DataLink): Boolean;
    function Remove_DetectedTrack(aTrack: TSimObject;
             sensor: TSimObject): Boolean;
    function LaunchNonRealtimeRuntimePlatform(const rec: TRecCmd_LaunchNonRP)
             : TT3PlatformInstance; override;
    function LaunchMissile(const rec: TRecCmd_LaunchMissile): TObject; override;
    function findDetectedTrack(aObj: TSimObject): TSimObject; overload;
    function findDetectedTrack(id: Integer): TSimObject; overload;
    procedure findDetectedTracksByDatalink(var arrValue : TIntegerArray );
    function FindESMByTrackNumber(const number: String): TT3EsmTrack;
    function FindESMByDetectedTrack(const number: String; aTrack: TSimObject)
             : TT3EsmTrack;
    function  IsGameStart: Boolean; override;

    {procedure RemoveDetectedTrack(aTrack: TSimObject; sensor: TSimObject);
      overload;}
    procedure AssignWeaponEvent(weapon: TT3Weapon); override;
    procedure AssignSensorEvent(sensor: TT3Sensor); override;
    procedure UpdateAllDevicePlatform(ve: TT3Vehicle); override;
    procedure RepairPlatform(const rec: TRecCmd_Platform_Repair); override;
    procedure RemoveDetectedTrack(aTrack: TSimObject); overload;
    procedure RemoveDetectedTracks(sensor: TSimObject); overload;
    procedure RemoveDetectedTrackByDataLink(dataLink: TT3DataLink);overload;
    procedure RemoveDetectedTrackByDataLink(aPlatformDetectedID: integer;
              dataLink: TT3DataLink);overload;
    procedure RemoveDetectedTrackByDataLink(aPlatformDetectedID: integer;
              dataLink: TT3DataLink; aDetectByPlatformID : integer);overload;
    procedure RemoveNonRealPlatform(obj: TT3PlatformInstance); overload;
    procedure RemoveNonRealPlatform(index: integer); overload;
    procedure RemoveESMTracks(aObj: TSimObject);
    procedure RemovePlatformByOperator(rec: TRecCmd_SelectPlatformToRemove);
    procedure netSend_VoipControlledChanged(const aNewPID: integer);

    // jammer
    procedure netRecv_ECMCommand(apRec: PAnsiChar; aSize: word); override;
    procedure netRecv_CmdRadarNoiseJammer(apRec: PAnsiChar; aSize: word); override;

    // sent to voip
    procedure netSend_CmdLaunchChaff(r: TRecCmd_LaunchChaff);
    procedure netSend_CmdLaunchChaffState(r: TRecCmd_LaunchChaffState);
    procedure netSend_CmdLauncherChaffProp(r: TRecCmd_ChaffLauncherProperties);
    procedure netSend_CmdLaunchBubble(r: TRecCmd_LaunchBubble);
    procedure netSend_CmdLaunchBubbleState(r: TRecCmd_LaunchBubbleState);
    procedure netSend_CmdLauncherBubbleProp
              (r: TRecCmd_BubbleLauncherProperties);
    procedure netSend_CmdLaunchMine(r: TRecCmd_LaunchMine);
    procedure netSend_CmdLaunchBomb(r: TRecCmd_LaunchBomb);
    procedure netSend_CmdLaunchSonobuoy(r: TRecCmd_LaunchSonobuoy);
    procedure netSend_ModifyCommunication(r: TRecModifComm);
    procedure netSend_Vectac(r: TRecVectac);
    procedure netSend_PlatformGroupChange(r: TRecPlatformGroupChange);
    procedure netSend_MessageHandling(r : TRecSendMessage);
    procedure RemovePlatformFromGroup(ve: TT3Vehicle);

    {ESM sinc}
    procedure OnVarianceESM(aESMtrack : TObject; aTrack : TObject); override;
    procedure netSend_Synch_ESMvarian(r: TRecCmd_EsmVariance);
    procedure NetSendECMCommand(rec : TRecECMCommand);

    {System State}
    procedure netSend_Cmd_Change_SystemState(rec: TRecCmd_Change_SystemState);
    procedure netRecv_Cmd_Change_SystemState(apRec: PAnsiChar; aSize: word);
    procedure ChangeSystemState(const rec : TRecCmd_Change_SystemState); override;

    {Logistic}
    procedure netSend_Cmd_Change_Logistic(rec: TRecCmd_Change_Logistic);
    procedure netRecv_Cmd_Change_Logistic(apRec: PAnsiChar; aSize: word);
    procedure netSend_Cmd_State_Logistic(rec: TRecCmd_State_Logistic);
    procedure netRecv_Cmd_State_Logistic(apRec: PAnsiChar; aSize: word);

    procedure EmbarkTransported (const rec : TRecCmd_Transport); override;
    procedure DisembarkTransported (const rec : TRecCmd_Transport); override;
    procedure DisembarkWithTransported (const rec : TRecCmd_Transport); override;
    procedure EmbarkTransportedPersonel (const rec : TRecCmd_EmbarkPersonelTemporary); override;

    procedure TransportProcess (const rec : TRecCmd_TransportProcess); override;

    {Overlay}
    procedure CreateOverlayTamplate (rec : TRecCmd_OverlayTemplate); override;
    procedure CreateOverlayShape (rec : TRecCmd_OverlayStaticShape); override;

    procedure CreatePlotting (rec : TRecCmd_PlottingShape); override;
    procedure CreateShipingRoute (rec : TRecCmd_ShipingRoute); override;

    //choco
    procedure netSend_CopyChaffLauncherProperty(r: TRecCmd_LaunchChaffState);

    {Add/Edit Formation - mm}
    procedure netSend_CmdEditFormation(rec: TRecEditFormation);
    procedure netRecv_CmdEditFormation(apRec: PAnsiChar; aSize: word);  override;

    {Edit Detectability Type}
    procedure netSend_CmdDetectabilityChange(rec: TRecDetectability);
    procedure netRecv_CmdDetectabilityChange(apRec: PAnsiChar; aSize: Word);

    procedure SwitchMap(const aActiveMap: Integer);
    procedure ChangeMap(const FActiveMap: Integer);

    {Added By Avi}
    function FindMark(const LookingFor: string; var Mark: string): Boolean;
    function GetValue(LookFor, Sentence: string; var Value: string): Boolean;
    function CheckZoomArea(DataArea : string; LastZoom: Double;
      var ZoomValue: Integer): Boolean;
    function CheckPosArea(DataArea : string; CenterMapX, CenterMapY: Double;
      var PosValue: Integer): Boolean;
    function CheckQualifyArea(FListFile: TStringList; OnMap: Integer;
      var FArea: string): string;

    //camera Controller
    procedure netRecv_CameraData(apRec: PAnsiChar; aSize: Word);

    procedure netSend_CmdCameraTrackPos(const aLat, aLong: Double);
    procedure netSend_CameraController(var rec: TRec_CameraController);
    procedure netSend_SwitchTerrain(var rec: TRec_SwitchTerrain);


    procedure netSend_CmdSYNCH(rec : TRecCmdSYNCH);
    procedure netSend_CmdVersion(rec : TRecCmdVersion);
  public
    property ClientRole: integer read FClientRole;
    property ConsoleRole: integer read FConsoleRole;
    property CubicleName: string read FMyCubicleName;
    property ConsoleName: string read FMyConsoleName;
    property ISInstructor: Boolean read FIsInstructor;
    //property ISWasdal   : Boolean read FIsWasdal;
    property MovePlatformLine: TLineVisual read FMovePlatformLine;
    property LineVisual: TLineVisual read FLineVisual;
    property RangeRing: TRangeRingsVisual read FRangeRing;
//    property CubAssignList: T3CubicleGroupList read FCubAssignList;
    property TargetPoint : TBitmapSymbolLDropPoint read FTargetSymbol;
    property FlashPointNGS : TBitmapSymbolLDropPoint read FFlashPointNGS;
    property PlatformViewMode : Boolean read FPlatformViewMode write SetPlatformViewMode;
    property TacticalDinamicSymbol: Boolean read FTacticalDinamicSymbol write SetTacticalDinamicSymbol;
    property TacticalStaticSymbol: Boolean read FTacticalStaticSymbol write SetTacticalStaticSymbol;
    property OnUpdateMessage : TOnUpdateMessageSent  read FOnUpdateMessage write FOnUpdateMessage;
    property OnUpdateForm: TNotifyEvent read FOnUpdateForm write FOnUpdateForm;
    property OnUpdateTime: TNotifyEvent read FOnUpdateTime write FOnUpdateTime;
    property OnUpdateCenter : TNotifyEvent read FOnUpdateCenter write FOnUpdateCenter;
    property OnReceivedSensorCommand : TNotifyEvent read FOnReceivedSensorCommand
       write FOnReceivedSensorCommand;
    property OnMapViewChange : TNotifyEvent read FOnMapViewChange write FOnMapViewChange;
    property IsFinish3DData : Boolean read FIsFinish3DData write FIsFinish3DData;

    { custom tactical info }
    procedure ApplyCallSign ;
    property ShipTacticalInfo1 : string index 0 read GetShipTacticalInfo write SetShipTacticalInfo;
    property ShipTacticalInfo2 : string index 1 read GetShipTacticalInfo write SetShipTacticalInfo;
    property ShipTacticalInfo3 : string index 2 read GetShipTacticalInfo write SetShipTacticalInfo;
    { custom goto time }
    property OnUpdateGotoProgress : TOnUpdateProgress read FOnUpdateGotoProgress write SetOnUpdateGotoProgress;
    procedure GotoTime(Index : Integer);override;

    property CubicleList : T3GroupList read FCubicleList;

    property PIDControlledPlatform : Integer read FPIDControlledPlatform write FPIDControlledPlatform;
  end;

var
  simMgrClient : TSimMgr_Client;

implementation

uses
  uSimManager, uBaseCoordSystem,
  uCoordConvertor, uMapXhandler, uNetHandle_Client, uNetVoipCtrl_Server,
  uNetBaseSocket, uT3Radar, uT3Sonar, uT3othersensor, uT3ClientEventManager,
  uAppUtils, ufLog, uSRRFunction, uDBScenario,
  uT3Listener, uGameSetting,
  uDBAsset_GameEnvironment, uDBGame_Defaults, uT3HybridMissile,
  uWaypoint, uT3DatalinkManager, uT3RadarNoiseJammer, uDBFormation, uFilter;

procedure TSimMgr_Client.NotifyScaleMap(sender: TObject; var scale: double);
begin
  scale := VSimMap.FMap.Zoom / 2;
end;

function TSimMgr_Client.AddDetectedTrack(aTrack: TSimObject;sensor: TSimObject; value : Boolean; IsIns: Boolean): Boolean;
var
  pi: TT3Unit;
  track: TT3DetectedTrack;
  i: integer;
  found: Boolean;
  IsDetailView: Boolean;
begin
  track := nil;
  found := false;

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    found := track.TrackObject = TT3Unit(aTrack);

    // check sensor detail viewed
     IsDetailView := TT3Sensor(sensor).InsideDetailRange(aTrack);
//    IsDetailView := True;

    if IsDetailView then // edit aldy + andik 20032012
      track.IsDetailViewed := True
    else
      track.IsDetailViewed := false;

    if found then
      break;
  end;

  if found then
  begin
    { if sensor is TT3ESMSensor then             buat ngecek
      frmLog.Memo1.Lines.Add('ESM Sensor detected'); }

    if Assigned(track) then
    begin
      track.isIFF3C := value;
      track.addDetectBy(TT3DeviceUnit(sensor));
    end;
  end
  else
  begin
    FTrackNumber := FTrackNumber + 1;

    track := TT3DetectedTrack.Create;
    track.Converter := Converter;
    track.VarianceESM := OnVarianceESM; //sinc esm
    track.TrackObject := TT3Unit(aTrack);
    track.ISBlinking := True;
    track.isIFF3C := value;
    track.TrackNumber := FTrackNumber;
    track.TrackName := 'Unknown';
    track.TrackClass := 'Unknown';
//    TT3Unit(aTrack).TrackNumber := FTrackNumber;
    track.TimeDetected := GameTIME;
    track.OnDetectecTrackDestroy := TT3ClientEventManager(EventManager).OnDetectedTrackDestroy;

    track.addDetectBy(TT3DeviceUnit(sensor));
    track.NotifyScaleMap := NotifyScaleMap;
    track.TrackIdent := piPending; // farid 20042012

    if IsIns then
      track.IsEnable := False
    else
      track.IsEnable := True;

    // check sensor detail viewed
//     IsDetailView := TT3Sensor(sensor).InsideDetailRange(aTrack);
    IsDetailView := True; // edit aldy + andik 20032012

//    pi := nil;
    if aTrack is TT3PlatformInstance then
    begin
      pi := aTrack as TT3PlatformInstance;
      track.TrackNumber := FMyCubGroup.GetTrackNumber(pi.InstanceIndex);
    end
    else if aTrack is TT3DeviceUnit then
    begin
      pi := aTrack as TT3DeviceUnit;
      track.TrackNumber := FMyCubGroup.GetTrackNumber(pi.InstanceIndex);

      if IsDetailView then
        track.IsDetailViewed := True
      else
        track.IsDetailViewed := false;
    end;

    {Edit by Choco}
    track.TrackType := TT3PlatformInstance(aTrack).PlatformType;
    track.TrackDomain := TT3PlatformInstance(aTrack).PlatformDomain;
    track.OnSelected := TT3ClientEventManager(EventManager).OnDetectedTrackSelected;
    track.TrackID := IntToStr(TT3PlatformInstance(aTrack).TrackNumber);
    track.OnTrackBlinking := OnTrackBlinking;

    // set event merged an unmerged on Client
    track.OnMerged := TT3ClientEventManager(EventManager).OnDetectedTrackMerged;
    track.OnUnmerged := TT3ClientEventManager(EventManager).OnDetectedTrackUnmerged;

    { ryu : platform view option }
    track.PlatformViewMode := PlatformViewMode;

    SimDetectedTrackList.addObject(track);
  end;

  if TT3Sensor(sensor) is TT3Sonar then
  begin
    if TT3PlatformInstance(aTrack).Altitude = 0 then
      track.TrackDomain := vhdSurface
    else
      track.TrackDomain := TT3PlatformInstance(aTrack).PlatformDomain;
  end;

  result := not found;
end;

procedure TSimMgr_Client.AddListQueueMessage(rec: TRecSendMessage);
var
  QueueMessage : TMessageHandling;
begin
  QueueMessage := TMessageHandling.Create;
  QueueMessage.FData := rec;

  {
    type of priority

    0 : FLASH
    1 : IMMED
    2 : PRIORITY
    3 : ROUTINE
  }

  case rec.Priority of
    0 :
    begin
      QueueMessage.TimeWait := GameDefaults.FData.MHS_Flash_Delay_Time;
    end;

    1 :
    begin
      QueueMessage.TimeWait := GameDefaults.FData.MHS_Immed_Delay_Time;
    end;

    2 :
    begin
      QueueMessage.TimeWait := GameDefaults.FData.MHS_Priority_Delay_Time;
    end;

    3 :
    begin
      QueueMessage.TimeWait := GameDefaults.FData.MHS_Routine_Delay_Time;
    end;
  end;

  ListQueueMessage.Add(QueueMessage);
end;
constructor TSimMgr_Client.Create(Map : TMap);
var
  i : integer;
begin
  inherited;
  tambah := 0; // add andik suneo
  FCompass := TCompassVisual.Create;
  FCompass.Width := Converter.FMap.Width;
  FCompass.Height := Converter.FMap.Height;

  FRangeRing := TRangeRingsVisual.Create;
  FRangeRing.Converter := Converter;
  FRangeRing.Interval := 10;

  FLineVisual := TLineVisual.Create;
  FLineVisual.Converter := Converter;

  FMovePlatformLine := TLineVisual.Create;
  FMovePlatformLine.Converter := Converter;
  FMovePlatformLine.Color := clDkGray;

  // load target bitmap
  FTargetSymbol := TBitmapSymbolLDropPoint.Create;
  FTargetSymbol.Converter := Converter;
  FTargetSymbol.LoadBitmap(vSymbolSetting.ImgPath + 'WpnDropPoint.bmp');
  //FTargetSymbol.Visible := true;

  // load flash bitmap
  FFlashPointNGS := TBitmapSymbolLDropPoint.Create;
  FFlashPointNGS.Converter := Converter;
  FFlashPointNGS.LoadBitmap(vSymbolSetting.ImgPath + 'FlashBTK.bmp');
  FFlashPointNGS.Color := clRed;

  // Avi Added List to move value of definition area from txt file to list

  ListDB_GameAreaIdentifier := TList.Create;
  ListDB_IDGameArea := TList.Create;
  ListDB_GameAreaDefinition := TList.Create;

  ListTotalValue := TStringList.Create;

  FListFile := TStringList.Create;

  ControlledPlatform := nil;

  FUpdateDelay := TDelayer.Create;
  FUpdateDelay.DInterval := 0.5;
  FUpdateDelay.OnTime := FOnUpdateDelay;
  FUpdateDelay.Enabled := True;

  { nando added delay handling for Queue Message}
  FUpdateForMessagehandling := TDelayer.Create;
  FUpdateForMessagehandling.DInterval := 1;
  FUpdateForMessagehandling.OnTime := FOnUpdateMessageHandling;
  FUpdateForMessagehandling.Enabled := True;

//  FUpdateDataLink := TDelayer.Create;
//  FUpdateDataLink.DInterval := 5; // second
  // event ini masih bermasalah....
  //FUpdateDataLink.OnTime := OnUpdateDataLink;
//  FUpdateDataLink.Enabled := True;

  FConnectDelay := TDelayer.Create;
  with FConnectDelay do
  begin
    DInterval := 8.0;
    OnTime := FOnConnectDelay;
    Enabled := false;
  end;

  FUpdateCenterDelay := TDelayer.Create;
  with FUpdateCenterDelay do
  begin
    DInterval := 0.5;
    OnTime := FOnUpdateCenterDelay;
    Enabled := false;
  end;

  FUpdateThread := TMSTimer.Create;
  FUpdateThread.Interval := 50;

  FLastPlatformID := 100;
  FEventCounter := 0;

  // ControlledPlatform := nil;
  SimDetectedTrackList := TT3UnitContainer.Create;
  SimDetectedTrackList.Converter := Converter;

  EventManager := TT3ClientEventManager.Create;
  AssignGameSettingChange(GameSetting.getListener as TPropertyEventListener);
  FTrackNumber := 1000;

  for I := 1 to C_DATALINK_ALLOWED do
    AssignSensorEvent(DataLinkManager.getDatalink(I));

  FClientRole := crpInstruktur; // default

  FCubicleList := T3GroupList.Create;

  FAllConsoleInfo := TStringList.Create;

  InitFirstReplay := 0;

//  SimPointRBLW_VehicleMissile := TT3UnitContainer.Create;
//  SimPointRBLW_VehicleMissile.Converter := Converter;

//  DrawOverlayTemplate := TDrawOverlay.Create;
//  DrawOverlayTemplate.Converter := Converter;

//  DrawStrategiTemplate := TDrawStrategi.Create;
//  DrawStrategiTemplate.Converter := Converter;

//  DrawLogisticTemplate := TDrawLogisticTemplate.Create;
//  DrawLogisticTemplate.Converter := Converter;

//  SimPlatformBase := TPlatformBaseContainer.Create;
//  SimPlatformBase.Converter := Converter;

  DrawGameCenter := TDrawGridOrigin.Create;
  DrawGameCenter.Converter := Converter;

  {Temporary}
  DrawFlagPoint := TDrawFlagPoint.Create;
  DrawFlagPoint.Converter := Converter;

  DrawRuler := TDrawRuler.Create;
  DrawRuler.Converter := Converter;

  DrawPointRouteTemporary := TMainShipingRoute.Create(Converter);
  DrawPointRouteTemporary.isShow := True;

  TrackNumberWeapon := 4000;
  MyForceDesignation := -1;
  MyCenterHookedPlatfom := nil;
  MyRingHookedPlatfom   := nil;

  SubEnviArea := TSubEnvironmentArea.Create;

  ListQueueMessage := TList.Create;
  ListComChannel := TList.Create;

  EventSummaryList := TList.Create;

  {ryu : platform view mode default}
  FPlatformViewMode := False;
  ShipTacticalInfo1 := C_TacticalInfos[1];
  ShipTacticalInfo2 := C_TacticalInfos[0];
  ShipTacticalInfo3 := C_TacticalInfos[0];

  FTacticalDinamicSymbol := True;
  FTacticalStaticSymbol := False;

  SimManager := Self;
  FIsFinish3DData := True;

  ControlledPlatformList := TList.Create;

  isFirstDraw := True;
end;

procedure TSimMgr_Client.CreateOverlayShape(rec: TRecCmd_OverlayStaticShape);
begin
  inherited;
end;

procedure TSimMgr_Client.CreateOverlayTamplate( rec: TRecCmd_OverlayTemplate);
begin
  rec.isShow := False;

  case rec.role of
    krInstruktur, kr2DViewer, krMiddleWasdal, krSideWasdal :
    begin
      {jk yg menerima console operator}
      if FClientRole = crpCubicle then
      begin
        if Assigned(FMyCubGroup) then
        begin
          if FMyCubGroup.FData.Force_Designation = rec.force then
            rec.isShow := True;
        end;
      end
      {jk yg menerima console instruktur}
      else
      begin
        rec.isShow := True;
      end;
    end;
    krPlotter, krOperator :
    begin
      if rec.roleName = ConsoleName then
      begin
        rec.isShow := True;
      end;
    end;
  end;

  inherited;

  TT3ClientEventManager(EventManager).UpdateOverlayTemplateList;

end;

procedure TSimMgr_Client.CreatePlotting(rec: TRecCmd_PlottingShape);
begin
  rec.IsCreate := False;

  case rec.role of
    krInstruktur, kr2DViewer, krMiddleWasdal, krSideWasdal :
    begin
      {jk yg menerima console operator}
      if FClientRole = crpCubicle then
      begin
        if Assigned(FMyCubGroup) then
        begin
          if FMyCubGroup.FData.Force_Designation = rec.force then
            rec.IsCreate := True;
        end;
      end
      {jk yg menerima console instruktur}
      else
      begin
        rec.IsCreate := True;
      end;
    end;
    krPlotter, krOperator :
    begin
      if rec.roleName = ConsoleName then
      begin
        rec.IsCreate := True;
      end;
    end;
  end;

  inherited;

  TT3ClientEventManager(EventManager).UpdatePlottingList;
end;

procedure TSimMgr_Client.CreateShipingRoute(rec: TRecCmd_ShipingRoute);
begin
  rec.Show := False;

  case rec.role of
    krInstruktur, kr2DViewer, krMiddleWasdal, krSideWasdal :
    begin
      {jk yg menerima console operator}
      if FClientRole = crpCubicle then
      begin
        if Assigned(FMyCubGroup) then
        begin
          if FMyCubGroup.FData.Force_Designation = rec.force then
            rec.Show := True;
        end;
      end
      {jk yg menerima console instruktur}
      else
      begin
        rec.Show := True;
      end;
    end;
    krPlotter, krOperator :
    begin
      if rec.roleName = ConsoleName then
      begin
        rec.Show := True;
      end;
    end;
  end;

  inherited;

  TT3ClientEventManager(EventManager).UpdateShipingRoute;

end;

destructor TSimMgr_Client.Destroy;
  procedure ClearAndFreeItems(var sl: TStringList);
  var
    i: integer;
    o: TObject;
  begin
    for i := sl.Count - 1 downto 0 do
    begin
      o := sl.Objects[i];
      o.Free;
    end;
    sl.Clear;
  end;
var
  i: Integer;
begin
  if FGameState = gsPlaying then
   GamePause;

  ControlledPlatformList.Clear;
  ControlledPlatformList.Free;

  FNetworkThreadVBS.OnRunning := FNetworkThreadVBS_OnPaused;
  FNetworkThread.OnRunning := FNetworkThread_OnPaused;
  FUpdateThread.OnRunning := nil;

  FUpdateThread.Free;
  FRangeRing.Free;
  FCompass.Free;
  FLineVisual.Free;
  FCubicleList.Free;
  FTargetSymbol.Free;
  FFlashPointNGS.Free;

  /// / remote condition
  if FRemoteServerCMD <> nil then
  begin
    if FRemoteServerCMD.Active then
      FRemoteServerCMD.Terminates;
    FreeAndNil(FRemoteServerCMD);
  end;

  for i := ListQueueMessage.Count - 1 downto 0 do
  begin
    ListQueueMessage.Delete(i);
  end;
  ListQueueMessage.Clear;
  ListQueueMessage.Free;

  for i := ListQueueMessage.Count -1 downto 0 do
  begin

  end;
  ListComChannel.Clear;
  ListComChannel.Free;

  if isExeRunning(vAppSetting.RemoteServerName, false) then
    CloseCurrentHandleApplication(vAppSetting.RemoteServerName);

  if FRemoteClientCMD <> nil then
  begin
    if FRemoteClientCMD.Active then
      FRemoteClientCMD.Terminates;

    FreeAndNil(FRemoteClientCMD);
  end;

  if isExeRunning(vAppSetting.RemoteClientName, false) then
    CloseCurrentHandleApplication(vAppSetting.RemoteClientName);

  // if FileExists(APP_REMOTE_BAT) then
  // DeleteFile(APP_REMOTE_BAT);

  ClearAndFreeItems(FAllConsoleInfo);
  FAllConsoleInfo.Free;
  /// / end remote condition

  // FCubAssignList.Free;
  inherited;

  // ini di clear belakangan
  UnAssginedDetTrackEvent;
  SimDetectedTrackList.ClearAndRemove;
  SimDetectedTrackList.Free;
//  FGDefList.Clear;

  EventSummaryList.Free;
  //FGDefList.Free;
end;

procedure TSimMgr_Client.GameStart;
begin
  inherited;

  FUpdateThread.OnRunning := FUpdateThread_OnRunning;
//  FNetworkThread.OnRunning := FNetworkThread_OnRunning;

  if FUpdateThread.Suspended then
    FUpdateThread.Start;

  FUpdateCenterDelay.Enabled := True;

end;

procedure TSimMgr_Client.GetALLConsoleInfo;
begin
  if FAllConsoleInfo = nil then
    Exit;
  if FAllConsoleInfo.Count <= 0 then
    FCubicleList.GetListConsole(FAllConsoleInfo);
end;

procedure TSimMgr_Client.GamePause;
begin
  inherited;

  FUpdateThread.OnRunning := FUpdateThread_OnPaused;
//  FNetworkThread.OnRunning := FNetworkThread_OnPaused;

  FUpdateCenterDelay.Enabled := false;

end;

procedure TSimMgr_Client.ApplyCallSign;
var
  i : integer;
  piT3 : TT3PlatformInstance;
begin

  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    piT3 := TT3PlatformInstance(SimPlatforms.getObject(i));

    if piT3 is TT3Vehicle then
    begin
      TT3Vehicle(piT3).ShipTacticalInfo1 := ShipTacticalInfo1;
      TT3Vehicle(piT3).ShipTacticalInfo2 := ShipTacticalInfo2;
      TT3Vehicle(piT3).ShipTacticalInfo3 := ShipTacticalInfo3;
    end;
  end;

  for i := 0 to simNonRealPlatform.itemCount - 1 do
  begin
    piT3 := TT3PlatformInstance(simNonRealPlatform.getObject(i));

    if piT3 is TT3NonRealVehicle then
    begin
      TT3NonRealVehicle(piT3).ShipTacticalInfo1 := ShipTacticalInfo1;
      TT3NonRealVehicle(piT3).ShipTacticalInfo2 := ShipTacticalInfo2;
      TT3NonRealVehicle(piT3).ShipTacticalInfo3 := ShipTacticalInfo3;
    end;
  end;


end;

procedure TSimMgr_Client.ApplyCubicleSetting;
var
  i: integer;
  ss: TStrings;
  found: Boolean;
  ip, host: string;
begin
  FMyIPAddress := '';

  FCubicleList.LoadFromFile(vGameDataSetting.GroupSetting);

  ss := TStringList.Create;
  if GetHostandIPList(host, ss) then
  begin
    i := 0;
    found := false;
    while not found and (i < ss.Count) do
    begin
      ip := ss[i];
      found := FCubicleList.IsGroupMember(ip);

      inc(i);
    end;

    if found then
    begin
      FMyIPAddress := ip;
      FIsInstructor := FCubicleList.IsController(FMyIPAddress);
      FIsWasdal     := FCubicleList.IsWasdal(FMyIPAddress);
      IsController := FCubicleList.IsController(FMyIPAddress);
      IsWasdal     := FCubicleList.IsWasdal(FMyIPAddress);
      FMyConsoleName := FCubicleList.GetConsoleName(FMyIPAddress);
      FMyCubicleName := FCubicleList.GetCubicleName(FMyIPAddress);
      IsVBS := FCubicleList.IsVBS(FMyIPAddress);

      //jika console berlaku sbgai vbs, maka simclient berlaku seperti instructur
      if IsVBS then
      begin
        FIsInstructor := True;
        IsController := True;
        FConsoleRole := kr3DViewer;
      end;

      if FIsInstructor then
      begin
        FClientRole := crpInstruktur;

        if vMapSetting.FormViewer then
          FConsoleRole := kr2DViewer
        else if vMapSetting.FormPlotter then
          FConsoleRole := krPlotter
        else
          FConsoleRole := krInstruktur
      end
      else if FIsWasdal then
      begin
        FClientRole := crpInstruktur;
        FIsWasdal   := True;

        if vMapSetting.FormWasdal then
          FConsoleRole := krMiddleWasdal
        else
          FConsoleRole := krSideWasdal
      end
      else
      begin
        FClientRole := crpCubicle;
        FConsoleRole := krOperator
      end;

      {Prince}
      if CubicleName = 'Controller Group' then
      begin
        MyWasdalRoleOnGroup := 1;
      end
      else
      begin
        if (Copy(ConsoleName, 10, 1))= 'T' then
          MyWasdalRoleOnGroup := 1
        else
          MyWasdalRoleOnGroup := 0;
      end;
    end;
  end;

  ss.Free;
end;

procedure TSimMgr_Client.InitNetwork;
begin
  // ------------------------------------------------------------------------------

  VNetClient.RegisterUDPPacket(CPID_PLATFORM_MOVE,
    SizeOf(TRecUDP_PlatformMovement), netRecv_PlatformMovement);

  VNetClient.RegisterUDPPacket(CPID_PLATFORM_MOVE_ARRAY,
    SizeOf(TRec_PlatformMovement), netRecv_PlatformMovementArray);

  VNetClient.RegisterUDPPacket(CPID_PLATFORM_LANDDATA,
    SizeOf(TRecUDP_PlatfomLandData), netRecv_PlatformLandData);

  VNetClient.RegisterUDPPacket(CPID_GAMETIME, SizeOf(TRecUDP_GameTime),
    netRecv_GameTime);

  VNetClient.RegisterUDPPacket(CPID_UDP_GAMECTRL_INFO,
    SizeOf(TRecUDP_GameCtrl_Info), netRecv_GameControlInfo);

  VNetClient.RegisterUDPPacket(CPID_CMD_GAME_CTRL, SizeOf(TRecCmd_GameCtrl),
    netRecv_CmdGameControl);

  VNetClient.RegisterUDPPacket(CPID_UDP_Synch_Obj, SizeOf(TRecUDP_Synch_Obj),
    netRecv_Synch_Object);

  VNetClient.RegisterUDPPacket(CPID_Synch_MISSILE_TARGET,
    SizeOf(TRecUDP_Synch_Missile), netRecv_MissileSynchtarget);

  VNetClient.RegisterUDPPacket(CPID_UDP_REPOSITION,
    SizeOf(TRecCmd_Platform_MOVE),
    netRecv_PlatformReposition);

  VNetClient.RegisterUDPPacket(CPID_UDP_TRACKNUMBER,
    SizeOf(TRecCmd_Platform_CHANGE_TRACKNUMBER), nil);

  //farid added
  VNetClient.RegisterUDPPacket(CPID_UDP_HYBRID,SizeOf(TrecCmd_LaunchHybrid),
    netRecv_LaunchHybrid);

  VNetClient.RegisterUDPPacket(CPID_SYNCH_POS_VBS, SizeOf(TRecUDP_PlatformMovement),
    netRecv_Synch_Pos_VBS);
  // ------------------------------------------------------------------------------
  VNetClient.RegisterTCPPacket(CPID_CMD_PLATFORM, SizeOf(TRecCmd_Platform),
    netRecv_platform_cmd);

  VNetClient.RegisterTCPPacket(CPID_CMD_PERSONEL_MOVE, SizeOf(TRec_Personel_Move),
    netRecv_Platform_PersonelMove);

  VNetClient.RegisterTCPPacket(CPID_CMD_EMCON_MODE, SizeOf(TRecCmd_ModeEmcon),
    netRecv_CmdEmcon);

  VNetClient.RegisterTCPPacket(CPID_CMD_PLATFORM_REPOS,
    SizeOf(TRecCmd_Platform_MOVE), nil); // reposisi

  VNetClient.RegisterTCPPacket(CPID_CMD_SET_LAUNCHERQTY,
    SizeOf(TRecCmd_Set_LauncherQty), netRecv_SetLauncherQty);

  VNetClient.RegisterTCPPacket(CPID_CMD_SET_QUANTITY,
    SizeOf(TRecCmd_Set_Quantity), netRecv_SetQuantity);

  VNetClient.RegisterTCPPacket(CPID_CMD_SET_STATUS, SizeOf(TRecCmd_Set_Status),
    netRecv_SetStatus);

  VNetClient.RegisterTCPPacket(CPID_CMD_ENGAGE_TRACK,
    SizeOf(TRecCmd_EngageTrack), netRecv_EngageTrack);

  VNetClient.RegisterTCPPacket(CPID_CMD_RADAR_NOISE_JAMMER,
    SizeOf(TrecRadarNoiseJammer), netRecv_CmdRadarNoiseJammer);
  VNetClient.RegisterTCPPacket(CPID_CMD_SENSOR, SizeOf(TRecCmd_Sensor),
    netRecv_CmdSensor); // radar, sonar, esm

  VNetClient.RegisterTCPPacket(CPID_CMD_UPDATE_SONAR, SizeOf(TRecCmd_UpdateSonar),
    netRecv_CmdUpdateSonar);

  VNetClient.RegisterTCPPacket(CPID_CMD_UPDATE_ACTUAL_CABLE, SizeOf(TRecCmd_UpdateActualCable),
    netRecv_CmdUpdateActualCable);

  VNetClient.RegisterTCPPacket(CPID_CMD_SONAR_DEPLOY, SizeOf(TRecCmd_SonarDeploy),
    netRecv_CmdSonarDeploy);

  VNetClient.RegisterTCPPacket(CPID_IFF_MODE_SEARCH, SizeOf(TRecCmd_IFFSearchMode),
    netRecv_CmdIFFSearchMode);

  VNetClient.RegisterTCPPacket(CPID_CMD_SENSOR_IFF, SizeOf(TRecCmd_SensorIFF),
    netRecv_CmdSensorIFF);

  VNetClient.RegisterTCPPacket(CPID_CMD_TARGET_IFF, SizeOf(TRecCmd_TargetIFF),
    netRecv_CmdTargetIFF);

  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_EMBARK, SizeOf(TRecCmd_Embark),
    netRecv_CmdEmbark);

  VNetClient.RegisterTCPPacket(CPID_CMD_DISEMBARK_TRANSPORT, SizeOf(TRecCmd_Embark),
    netRecv_CmdDisembarkTemporary);

  VNetClient.RegisterTCPPacket(CPID_CMD_DISEMBARK_TRANSPORT, SizeOf(TRecCmd_ReturnToBase),
    netRecv_CmdReturnToBase);

  VNetClient.RegisterTCPPacket(CPID_CMD_TRANSPORT, SizeOf(TRecCmd_Transport),
    netRecv_CmdTransport);

  VNetClient.RegisterTCPPacket(CPID_CMD_TRANSPORT_PROCESS, SizeOf(TRecCmd_TransportProcess),
    netRecv_CmdTransportProcess);

  VNetClient.RegisterTCPPacket(CPID_EMBARKED_PLATFORM_DATA, SizeOf(TRec_EmbarkedPlatformData),
    netRecv_EmbarkedPlatformData);

  VNetClient.RegisterTCPPacket(CPID_CMD_EMBARK_PERSONEL_TEMPORARY, SizeOf(TRecCmd_EmbarkPersonelTemporary),
    netRecv_CmdEmbarkPersonelTemporary);

  VNetClient.RegisterTCPPacket(CPID_CMD_DISEMBARK_PERSONEL_TEMPORARY, SizeOf(TRecCmd_DisembarkPersonelTemporary),
    netRecv_CmdDisembarkPersonelTemporary);

  VNetClient.RegisterTCPPacket(CPID_CMD_SYNCH, SizeOf(TRecCmdSYNCH),
    netRecv_CmdSYNCH);


  VNetClient.RegisterTCPPacket(CPID_CMD_VERSION, SizeOf(TRecCmdVersion),
    netRecv_CmdVersion);

  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_MISSILE,
    SizeOf(TRecCmd_LaunchMissile), netRecv_CmdLaunchMissile);

  VNetClient.RegisterTCPPacket(CPID_CMD_FIRINGMODE,
    SizeOf(TRecFiringModeWeapon), netRecv_CmdMissileProperties);

  VNetClient.RegisterTCPPacket(CPID_CMD_ENGAGEMENTMODE,
    SizeOf(TRecEngagementModeWeapon), netRecv_CmdMissileEngageProperties);

  VNetClient.RegisterTCPPacket(CPID_CMD_GUN_FIRE, SizeOf(TRecCmd_GunFire),
    netRecv_CmdGunFire);

  VNetClient.RegisterTCPPacket(CPID_CMD_GUN_FIRE_STATE,
    SizeOf(TRecCmd_GunFireState), netRecv_CmdGunFireState);

  VNetClient.RegisterTCPPacket(CPID_CMD_GAME_CTRL, SizeOf(TRecCmd_GameCtrl),
    netRecv_CmdGameControl);

  VNetClient.RegisterTCPPacket(CPID_TCP_REQUEST, SizeOf(TRecTCP_Request), nil);

  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_RUNTIME_PLATFORM,
    SizeOf(TRecCmd_LaunchRP), netRecv_CmdLaunch_RP);

  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_NON_RUNTIME_PLATFORM,
    SizeOf(TRecCmd_LaunchNonRP), netRecv_CmdLaunch_NonRP);

  VNetClient.RegisterTCPPacket(CPID_CMD_PLOTTINGSHAPE,
    SizeOf(TRecCmd_PlottingShape), netRecv_CmdPlottingShape);

  VNetClient.RegisterTCPPacket(CPID_CMD_SHIPINGROUTE,
    SizeOf(TRecCmd_ShipingRoute), netRecv_CmdShipingRoute);

  VNetClient.RegisterTCPPacket(CPID_CMD_OVERLAYSTATICSHAPE,
    SizeOf(TRecCmd_OverlayStaticShape), netRecv_CmdOverlayStaticShape);

  VNetClient.RegisterTCPPacket(CPID_CMD_OVERLAYTEMPLATE,
    SizeOf(TRecCmd_OverlayTemplate), netRecv_CmdOverlayTemplate);

  VNetClient.RegisterTCPPacket(CPID_CMD_DYNAMIC_TRACK,
    SizeOf(TRecCmd_OverlayDynamicTrack), netRecv_CmdDynamicTrack);

  VNetClient.RegisterTCPPacket(CPID_CMD_OVERLAYDYNAMICSHAPE,
    SizeOf(TRecCmd_OverlayDynamicShape), netRecv_CmdOverlayDynamicShape);

  VNetClient.RegisterTCPPacket(CPID_BRINGTOFRONT_OVERLAYDYNAMICSHAPE,
    SizeOf(TRecCmd_OverlayDynamicShape), netRecv_BringToFront_OverlayDynamicShape);

  VNetClient.RegisterTCPPacket(CPID_BRINGTOFRONT_OVERLAYSTATICSHAPE,
    SizeOf(TRecCmd_OverlayStaticShape), netRecv_BringToFront_OverlayStaticShape);

  VNetClient.RegisterTCPPacket(CPID_SENDTOBACK_OVERLAYDYNAMICSHAPE,
    SizeOf(TRecCmd_OverlayDynamicShape), netRecv_SendToBack_OverlayDynamicShape);

  VNetClient.RegisterTCPPacket(CPID_SENDTOBACK_OVERLAYSTATICSHAPE,
    SizeOf(TRecCmd_OverlayStaticShape), netRecv_SendToBack_OverlayStaticShape);

  VNetClient.RegisterTCPPacket(CPID_TORPEDO_PROPERTY,
    SizeOf(TRecTorpedoProperty),netRecv_CmdTorpedoProperty);

  VNetClient.RegisterTCPPacket(CPID_BOMB_PROPERTY,
    SizeOf(TRecBombProperty),netRecv_CmdBombProperty);

  VNetClient.RegisterTCPPacket(CPID_MINE_PROPERTY,
    SizeOf(TRecMineProperty),netRecv_CmdMineProperty);

  VNetClient.RegisterTCPPacket(CPID_CMD_TRANSFER_SONOBUOY,
    SizeOf(TRecCmd_TransferSonobuoy),netRecv_CmdTransferSonobuoy);

  VNetClient.RegisterTCPPacket(CPID_TORPEDO_SYNC_PANEL_WEAPON,
    SizeOf(TRecTorpedoPanelWeapon),netRecv_CmdTorpedoSyncPanelWeapon);

  VNetClient.RegisterTCPPacket(CPID_BOMB_SYNC_PANEL_WEAPON,
    SizeOf(TRecBombPanelWeapon),netRecv_CmdBombSyncPanelWeapon);
  //----------------------------------------------------------------------------

  VNetClient.RegisterTCPPacket(CPID_CMD_REMOVE_PLATFORM,
    SizeOf(TRecCmd_SelectPlatformToRemove),
    netRecv_CmdRemovePlatfromByOperator);

  VNetClient.RegisterTCPPacket(CPID_CUBICLEASSIGN, SizeOf(TRecCubAssign),
    netRecv_Session_Cub_Assign);

  VNetClient.RegisterTCPPacket(CPID_CMD_UPDATE_PLATFORM_PROPERTY,
    SizeOf(TRecCmd_Platform_SET_PROPERTY), netRecv_CmdUpdatePlatform_PROPERTY);

  VNetClient.RegisterTCPPacket(CPID_CMD_UPDATE_NRP_PROPERTY,
    SizeOf(TRecCmd_NRP_SET_PROPERTY), netRecv_CmdUpdateNRP_PROPERTY);

  VNetClient.RegisterTCPPacket(CPID_CMD_ESM_SET_PROPERTY,
    SizeOf(TRecCmd_ESM_SET_PROPERTY), netRecv_CmdESM_CHANGE_PROPERTY);

  VNetClient.RegisterTCPPacket(CPID_CMD_PLATFORM_REPAIR,
    SizeOf(TRecCmd_Platform_Repair), netRecv_CmdPlatform_Repair);

  VNetClient.RegisterTCPPacket(CPID_CMD_CHANGE_TRACK_NUMBER,
    SizeOf(TRecCmd_Platform_CHANGE_TRACKNUMBER), netRecv_CmdChangeTrackNumber);

  VNetClient.RegisterTCPPacket(CPID_CMD_MERGE_TRACK,
    SizeOf(TRecCmd_MergeTrack), netRecv_Cmd_MergeTrack);

  VNetClient.RegisterTCPPacket(CPID_CMD_DATALINK, SizeOf(TRecCmd_DataLink),
    netRecv_Cmd_DataLink);

  VNetClient.RegisterTCPPacket(CPID_CMD_DATALINK_ADDTRACK,
    SizeOf(TRecCmd_DataLink_AddTrack), netRecv_CMD_DataLink_AddTrack);

  VNetClient.RegisterTCPPacket(CPID_CMD_DATALINK_REMOVETRACK,
    SizeOf(TRecCmd_DataLink_RemoveTrack), netRecv_CMD_DataLink_RemoveTrack);

  VNetClient.RegisterTCPPacket(CPID_CMD_ASSIGN_FIRECONTROL, SizeOf(TRecCmd_FC),
    netRecv_Cmd_FireControl);

  VNetClient.RegisterTCPPacket(CPID_CMD_EMBARK_LAND,
    SizeOf(TRecCmd_Embark_Landing), netRecv_Cmd_Embark_Land);

  VNetClient.RegisterTCPPacket(CPID_REMOTE_CMD, SizeOf(TRecSendRemote),
    netRecv_CmdRemote);

  // nando Waypoint
  VNetClient.RegisterTCPPacket(CPID_SincWaypoint, SizeOf(TrecSinc_Waypoint),
    netRecv_SincWaypoint);

  // nando RBLW
  VNetClient.RegisterTCPPacket(CPID_SincRBLW, SizeOf(TrecSinc_RBLW),
    netRecv_SincRBLWMissile);
  VNetClient.RegisterTCPPacket(CPID_SincBOLW, SizeOf(TrecSinc_BOLW),
    netRecv_SincBOLWMissile);
  VNetClient.RegisterTCPPacket(CPID_CMD_Missile_Envi, SizeOf(TrecMissile_Envi),
    netRecv_SincMissileEnvi);

  // farah
  VNetClient.RegisterTCPPacket(CPID_CMD_ENVI, SizeOf(TrecSinc_Envi),
    netRecv_cmd_environment);

  VNetClient.RegisterTCPPacket(CPID_CMD_SNAPSHOT, SizeOf(TRecCommandSnapshot),
    netRecv_cmd_snapshot);

  // ------------------------------------------------------------------------------
  VNetVoipCtrlServer.RegisterPacket(CPID_VOIP_PLATFORM_SELECT,
    SizeOf(TRecVoip_SelectPlatform), nil);

  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_CHAFF,
    SizeOf(TRecCmd_LaunchChaff), netRecv_CmdLaunchChaff);
  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCHER_CHAFF_STATE,
    SizeOf(TRecCmd_LaunchChaffState), netRecv_CmdLaunchChaffState);
  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCHER_CHAFF_PROPS,
    SizeOf(TRecCmd_ChaffLauncherProperties), netRecv_CmdLauncherProperties);
  VNetClient.RegisterTCPPacket(CPID_CHAFF_PROPERTY,
    SizeOf(TRecCmd_LaunchChaffState), netRecv_CopyChaffLauncherProperty);

  // Bubble
  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_BUBBLE,
    SizeOf(TRecCmd_LaunchChaff), netRecv_CmdLaunchBubble);
  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCHER_BUBBLE_STATE,
    SizeOf(TRecCmd_LaunchChaffState), netRecv_CmdLaunchBubbleState);
  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCHER_BUBBLE_PROPS,
    SizeOf(TRecCmd_ChaffLauncherProperties),
    netRecv_CmdBubbleLauncherProperties);

  // Mine
  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_MINES,
    SizeOf(TRecCmd_LaunchMine), netRecv_CmdLaunchMines);

  // Bomb
  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_BOMB,
    SizeOf(TRecCmd_LaunchBomb), netRecv_CmdLaunchBomb);

  // Sonobuoy
  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_SONOBUOY,
    SizeOf(TRecCmd_LaunchSonobuoy), netRecv_CmdLaunchSonobuoy);

  VNetClient.RegisterTCPPacket(CPID_CMD_SYNC_HIT_MINE_BOMB,
    SizeOf(TRecCmd_Sync_Hit_BombMine), netRecv_CmdSync_Hit_Mine_Bomb);

  VNetClient.RegisterTCPPacket(CPID_CMD_LAUNCH_TORPEDO,
    SizeOf(TRecCmd_LaunchMissile), netRecv_CmdLaunchTorpedo);

  VNetClient.RegisterTCPPacket(CPID_GAME_SETTING, SizeOf(TRecCmd_GameSetting),
    netRecv_GameSetting);
  VNetClient.RegisterTCPPacket(CPID_PLATFORM_FREEME,
    SizeOf(TRecPlatformFreeMe), netRecv_PlatformFreeMe);

  VNetClient.RegisterTCPPacket(CPID_SYNCH_VEHICLE, SizeOf(TRecSynch_Vehicle),
    netRecv_SynchVehicle);
  VNetClient.RegisterTCPPacket(CPID_CMD_MAPS, SizeOf(TRec_MapData),
    netRecv_PlatformLandData);

  // added by choco : Platform Removal Sumary
  VNetClient.RegisterTCPPacket(CPID_CMD_PLATFORM_HIT_PLATFORM,
    SizeOf(TRecPlatformHitPlatform), netRecv_PlatformHitPlatform);
  // ham 04052012
  VNetClient.RegisterTCPPacket(CPID_CMD_WEAPON_OUT, SizeOf(TRecWeaponOut),
    netRecv_WeaponInOut);
  VNetClient.RegisterTCPPacket(CPID_CMD_PLATFORM_HANCUR,
    SizeOf(TRecPlatformHancur), netRecv_PlatformHancurin);

  VNetClient.RegisterTCPPacket(CPID_CMD_MODIF_COMM, SizeOf(TRecModifComm),
    netRecv_ModifComm);
  VNetClient.RegisterTCPPacket(CPID_CMD_VECTAC, SizeOf(TrecVectac), netRecv_Vectac);

  VNetClient.RegisterTCPPacket(CPID_CMD_PLAT_GROUP_CHANGE, SizeOf(TRecPlatformGroupChange),
    netRecv_PlatformGroupChange);

  VNetClient.RegisterTCPPacket(CPID_SYNC_TARGET,
    SizeOf(TRec_SyncTarget), netRecv_SyncBearingMissile);

  //esm sinc variance
  VNetClient.RegisterTCPPacket(CPID_CMD_SYNC_ESM_VARIANCE, SizeOf(TRecCmd_EsmVariance),
    netRecv_Synch_ESMvarian);

  VNetClient.RegisterTCPPacket(CPID_LASTUPDATE_PLATFORM,
    SizeOf(TRecCmd_LastUpdatePlatform), netRecv_LastUpdatePlatform);

  //System State
  VNetClient.RegisterTCPPacket(CPID_CMD_CHANGE_SYSTEMSTATE,
    SizeOf(TRecCmd_Change_SystemState), netRecv_Cmd_Change_SystemState);

  //Logistic
  VNetClient.RegisterTCPPacket(CPID_CMD_CHANGE_LOGISTIC,
    SizeOf(TRecCmd_Change_Logistic), netRecv_Cmd_Change_logistic);

  VNetClient.RegisterTCPPacket(CPID_CMD_LOGISTIC_STATUS,
    SizeOf(TRecCmd_State_Logistic), netRecv_Cmd_State_logistic);

  VNetClient.RegisterTCPPacket(CPID_CMD_DECOYS, SizeOf(TRecCmdDecoys),netRecv_CmdDecoys);

  VNetClient.RegisterTCPPacket(CPID_CMD_ECM, SizeOf(TRecECMCommand),netRecv_ECMCommand);
  VNetClient.RegisterTCPPacket(CPID_CMD_RECORDTRACK, sizeof(TRecRecordVoice), nil);
  VNetClient.RegisterTCPPacket(CPID_REC_MESSAGE, SizeOf(TRecSendMessage), NetRecv_MessageHandling);

  //edit n add formation
  VNetClient.RegisterTCPPacket(CPID_EDIT_FORMATION, SizeOf(TRecEditFormation),
    netRecv_CmdEditFormation);

  VNetClient.RegisterTCPPacket(CPID_EDIT_DETECTABILITY,
    SizeOf(TRecDetectability), netRecv_CmdDetectabilityChange);

 // VNetClient.RegisterTCPPacket(CPID_GUN_SPLASH, SizeOf(TRecSplashCannon),
 //   netRecv_GunSplash);

  VNetClient.RegisterTCPPacket(CPID_CMD_MULTI_MODE, SizeOf(TRecCmdMultiMode),
    netRecv_MultiMode);

  {Prince}
  VNetClient.RegisterTCPPacket(CPID_CMD_RAMP, SizeOf(TRecCmd_RampController),
    netRecv_Cmd_RampController);

  VNetClient.RegisterTCPPacket(CPID_CMD_FLASH_POINT, SizeOf(TRecCmd_FlashPoint),
    netRecv_CmdGunFlash);

  VNetClient.RegisterTCPPacket(CPID_CMD_CAMERA_CONTROLLER,
    SizeOf(TRec_CameraController), netRecv_CameraController);

  VNetClient.RegisterTCPPacket(CPID_CMD_SHIP_TOUCH_GROUND,
    SizeOf(TRec_ShipTouchGround), netRecv_ShipTouchGround);

  VNetClient.RegisterTCPPacket(CPID_CMD_SYNC_WAYPOINTDATATO3D,
    SizeOf(TRecSync_WaypointDataTo3D), netRecv_Synch_WaypointData);

  VNetClient.RegisterTCPPacket(CPID_CMD_STATE_SERVER, SizeOf(TRec_StateServer),
    netRecv_StateServer);

  VNetClient.RegisterTCPPacket(CPID_PLATFORM_MOVE,
    SizeOf(TRecUDP_PlatformMovement), netRecv_PlatformMovement);

  VNetClient.RegisterTCPPacket(CPID_REC_AOPR_DATA, SizeOf(TRec_AOPR_Data_Initialize),
    netRecv_DataFromVBS);

  VNetClient.RegisterTCPPacket(CPID_CMD_PERSONEL, SizeOf(TRec_Personel),
    netRecv_DataFromPRSNLVBS);

  VNetClient.RegisterTCPPacket(CPID_CMD_CONTROL_VEHICLE, SizeOf(TRec_ControlledShip),
    netRecv_ControlledShip);


  //Camera Controller
  VNetClient.RegisterTCPPacket(CPID_CMD_CAMERA_CONTROLLER, SizeOf
      (TRec_CameraController), netRecv_CameraData);

  VNetClient.RegisterTCPPacket(CPID_CMD_SWITCH_TERRAIN, SizeOf
      (TRec_SwitchTerrain), nil);

  VNetVoipCtrlServer.StartNetworking;
  FConnectDelay.Enabled := True;
end;

procedure TSimMgr_Client.StopNetwork;
begin
  FConnectDelay.Enabled := false;

  VNetClient.UnRegisterUDP;
  VNetClient.UnRegisterTCP;
end;

procedure TSimMgr_Client.SwitchMap(const aActiveMap: Integer);
var
  s, geosetStr, zoomStr : string;
  gDefRec  : TGame_Environment_Definition;
  gDefArea : string;
  FDefName_1, FDefName_2, FDefName_3 : string;
  I,J : Integer;

  Directory, FArea : string;
  FZoomValue, FPosValue, TotalValue : Integer;
begin
  lastZoom := VSimMap.FMap.Zoom;
  lastCX := VSimMap.FMap.CenterX;
  lastCY := VSimMap.FMap.CenterY;

  case aActiveMap of
    1:
    begin
      CheckQualifyArea(VScenario.ListDefinition_1, 1, FArea);
    end;
    2:
    begin
      CheckQualifyArea(VScenario.ListDefinition_2, 2, FArea);
    end;
    3:
    begin
      CheckQualifyArea(VScenario.ListDefinition_3, 3, FArea);
    end;
  end;

  lastArea := FArea;
  geosetStr := vMapSetting.MapGSTGame + '\' + FArea + '\' + FArea + '.gst';

  if FileExists(geosetStr) then
  begin
    VSimMap.LoadMap(geosetStr);
    VSimMap.FMap.ZoomTo(lastZoom, lastCX, lastCY);
  end
  else
    ShowMessage('Map Not Found!');
end;

procedure TSimMgr_Client.OnMapChange(sender: TObject);
begin
  FCompass.Width := Converter.FMap.Width;
  FCompass.Height := Converter.FMap.Height;

  if Assigned(ControlledPlatform) then
  begin
    // FRangeRing.mX := ControlledPlatform.getPositionX;
    // FRangeRing.mY := ControlledPlatform.getPositionY;
  end
  else
  begin
    // FRangeRing.mX := Converter.FMap.CenterX;
    // FRangeRing.mY := Converter.FMap.CenterY;
  end;

  if Assigned(FOnMapViewChange) then
    FOnMapViewChange(sender);
end;

procedure TSimMgr_Client.ChangeMap(const FActiveMap: Integer);
var
  I, J : Integer;
  FZoomValue, FPosValue, TotalValue : Integer;
  NewArea, geoset : string;
begin
  lastZoom := VSimMap.FMap.Zoom;

  if lastZoom = 0 then
    lastZoom := 100;

  lastCX := VSimMap.FMap.CenterX;
  lastCY := VSimMap.FMap.CenterY;

  case FActiveMap of
    1:
    begin
      CheckQualifyArea(VScenario.ListDefinition_1, 1, NewArea);
    end;
    2:
    begin
      CheckQualifyArea(VScenario.ListDefinition_2, 2, NewArea);
    end;
    3:
    begin
      CheckQualifyArea(VScenario.ListDefinition_3, 3, NewArea);
    end;
  end;

  if NewArea = LastArea then
    Exit
  else
  begin
    geoset := vMapSetting.MapGSTGame + '\' + NewArea + '\' + NewArea + '.gst';
    lastArea := NewArea;

    if FileExists(geoset) then
    begin
      VSimMap.LoadMap(geoset);
      VSimMap.FMap.ZoomTo(lastZoom, lastCX, lastCY);
    end
    else
      ShowMessage('Map Not Found');
  end;
end;

procedure TSimMgr_Client.OnTrackBlinking(sender: TObject; Value: Boolean);
begin
  // ini draw ulang
  VSimMap.DrawMap;
end;


function TSimMgr_Client.Remove_DetectedTrack(aTrack: TSimObject;
  sensor: TSimObject): Boolean; // add pak andik 12042012
var
  track: TT3DetectedTrack;
  i: integer;
  found: Boolean;
  Count: integer; // mk 20042012
begin // ini kalo sensornya di destroy?
  result := false; // add pak andik 12042012
  found := false;
  track := nil;

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    found := track.TrackObject = aTrack;

    if found then
      break;
  end;

  if found then
  begin
    result := track.removeDetectBy(TT3DeviceUnit(sensor));

    if result then // mk 20042012
    begin
      Count := track.TrackDetectedBy.Count;
      OnLogStr('TSimMgr_Client.Remove_DetectedTrack', 'Track ' + IntToStr(track.TrackNumber) +
               ' now detected by ' + IntToStr(Count) + ' sensor(s)');
    end;
  end;
end;

procedure TSimMgr_Client.RemoveDetectedTrack(aTrack: TSimObject);
var
  track: TT3DetectedTrack;
  i: integer;
  found: Boolean;
begin
  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    found := track.TrackObject = aTrack;

    if found then
    begin
      track.FreeMe := True;

      if (ISInstructor) or IsWasdal then
      begin
//        track.Free;
        SimDetectedTrackList.deleteObject(track);
      end;

      break;
    end;
  end;
end;

procedure TSimMgr_Client.RemoveDetectedTracks(sensor: TSimObject);
var
  track: TT3DetectedTrack;
  i, j : integer;
  ESMTrackObj : TObject;
  found: boolean;
  aESM: TT3EsmTrack;
begin
  if sensor.Parent = nil then
    exit ; // sam. add 13.01.15

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    if not Assigned(track) then
      continue;

    if Assigned(track) then
    begin
      if track.ESMTracks.Count > 0 then
      begin
        j := 0;
        found := false;
        ESMTrackObj := nil;

        while (not found) and (j < (track.ESMTracks.Count)) do
        begin
          ESMTrackObj := track.ESMTracks.Items[j];

          if (TT3ESMTrack(ESMTrackObj).DetectBy = sensor)
            or (TT3ESMTrack(ESMTrackObj).TrackObject = TT3Unit(sensor)) then
          begin
            found := true;
          end;

          inc(j);
        end;

        if found then
        begin
          aESM := TT3ESMTrack(ESMTrackObj);
          if Assigned (aESM) then
          begin
            if aESM.IsMerged then
            begin
              aESM.IsMerged := False;

              if Assigned(track.OnUnmerged) then
                track.OnUnmerged(track);

              track.MergedESM := nil;
            end;
          end;
        end;
      end
      else
      begin
        if track.MergedESM <> nil then
        begin
          if (TT3ESMTrack(track.MergedESM).DetectBy = sensor)
            or (TT3ESMTrack(track.MergedESM).TrackObject = TT3Unit(sensor)) then
          begin
            if track.MergedESM is TT3ESMTrack then
            begin
              if TT3ESMTrack(track.MergedESM).IsMerged then
              begin
                TT3ESMTrack(track.MergedESM).IsMerged := False;

                if Assigned(track.OnUnmerged) then
                  track.OnUnmerged(track);

                track.MergedESM := nil;
              end;
            end;
          end;
        end;
      end;
    end;

    // add pak andik 20042012
    if track.removeDetectBy(TT3DeviceUnit(sensor)) then
    begin
//      Count := track.TrackDetectedBy.Count;
//      OnLogStr('Sensor. ' + TT3DeviceUnit(sensor).InstanceName +
//          ' - Delete Vehicle : ' + IntToStr(track.TrackNumber)
//          + ' Count ' + IntToStr(Count)); // add pak andik 20042012
    end;

  end;
end;

procedure TSimMgr_Client.RemoveESMTracks(aObj: TSimObject);
var
  track: TT3DetectedTrack;
  ESM : TObject;
  i, j: integer;
begin
  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    if not(Assigned(track)) then Continue;

    if track.ESMTracks.Count > 0 then
    begin
      for j := track.ESMTracks.Count - 1 downto 0 do
      begin
        ESM := track.ESMTracks.Items[j];

        if ESM is TT3ESMTrack then
        begin
          if TT3ESMTrack(ESM).TrackObject.Parent = aObj then
          begin
            if Assigned(TT3ESMTrack(ESM)) then
            begin
              if TT3ESMTrack(ESM).IsMerged then
              begin
                TT3ESMTrack(ESM).IsMerged := False;

                if Assigned(track.OnUnmerged) then
                  track.OnUnmerged(track);

                track.MergedESM := nil;
              end;
            end;

            track.ESMTracks.Remove(ESM);
          end;
        end;
      end;
    end
    else
    begin
      if track.MergedESM <> nil then
      begin
        if track.TrackObject = aObj then
        begin
          if Assigned(TT3ESMTrack(track.MergedESM)) then
          begin
            if TT3ESMTrack(track.MergedESM).IsMerged then
            begin
              TT3ESMTrack(track.MergedESM).IsMerged := False;

              if Assigned(track.OnUnmerged) then
                track.OnUnmerged(track);

              track.MergedESM := nil;
              track.ESMTracks.Clear;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TSimMgr_Client.RemoveNonRealPlatform(obj: TT3PlatformInstance);
var
  i: integer;
  nrpPlatform: TT3NonRealVehicle;
begin
  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    if TSimObject(SimPlatforms.getObject(i)) is TT3NonRealVehicle then
    begin
      nrpPlatform := SimPlatforms.getObject(i) as TT3NonRealVehicle;

      if nrpPlatform.InstanceIndex = obj.InstanceIndex then
      begin
        nrpPlatform.FreeMe := True;
      end;
    end;
  end;
end;

procedure TSimMgr_Client.RemoveNonRealPlatform(index: integer);
var
  i: integer;
  nrpPlatform: TT3NonRealVehicle;
begin
  // nrpPlatform := FindT3PlatformByID(index);
  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    if TSimObject(SimPlatforms.getObject(i)) is TT3NonRealVehicle then
    begin
      nrpPlatform := SimPlatforms.getObject(i) as TT3NonRealVehicle;

      if nrpPlatform.InstanceIndex = index then
      begin
        nrpPlatform.FreeMe := True;
      end;
    end;
  end;
end;

function TSimMgr_Client.findDetectedTrack(aObj: TSimObject): TSimObject;
var
  i: integer;
  f: Boolean;
begin
  result := nil;

  i := 0;
  f := false;

  while not f and (i < SimDetectedTrackList.itemCount) do
  begin
    result := SimDetectedTrackList.getObject(i);

    f := (result as TT3DetectedTrack).TrackObject = aObj;
    inc(i)
  end;

  if not f then result := nil;
end;

procedure TSimMgr_Client.findDetectedTracksByDatalink(
  var arrValue: TIntegerArray);
var
  i,j, k: integer;
  objTrack : TT3DetectedTrack;
  devSensor : TObject;
begin
  i := 0;
  k := 1;

  while i < SimDetectedTrackList.itemCount do
  begin
    objTrack := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;

    if objTrack <> nil then
    begin
      for j := 0 to objTrack.TrackDetectedBy.Count - 1 do
      begin
        devSensor := objTrack.TrackDetectedBy.Items[j];
        if Assigned(devSensor) and (devSensor is TT3DataLink) then
        begin
          if Assigned(objTrack.TrackObject) then
          begin
            SetLength(arrValue, k);
            arrValue[k-1] := objTrack.TrackObject.InstanceIndex;
            Inc(k);
          end;
        end;
      end;
    end;

    inc(i);
  end;
end;

procedure TSimMgr_Client.RemovePlatformByOperator
  (rec: TRecCmd_SelectPlatformToRemove);
var
  obj, PfSonobuoy, ParentSono: TT3PlatformInstance;
  memberShipTemp, member2ShipTemp : TT3PlatformInstance;
  i, j, k : Integer;
begin
  if not rec.isNRPlatform then
    obj := FindT3PlatformByID(rec.PlatfomID)
  else
    obj := FindNonRealPlatformByID(rec.PlatfomID);

  if not Assigned(obj) then
    Exit;

  if obj is TT3Vehicle then {MASUK SINI}
  begin
    // added by choco : biar pas didelete di Tote Display diberikan reason "Delete By User"
    obj.reasonDestroy := 1;

    if obj is TT3NonRealVehicle then
    begin

      for j := 0 to TT3Vehicle(obj).MemberTransportList.Count - 1 do
      begin
        memberShipTemp := TT3Vehicle(obj).MemberTransportList[j];

        for k := 0 to TT3Vehicle(memberShipTemp).MemberTransportList.Count - 1 do
        begin
          member2ShipTemp := TT3Vehicle(memberShipTemp).MemberTransportList[k];
          member2ShipTemp.FreeMe := True;
          member2ShipTemp.Dormant := True;
          member2ShipTemp.Enable := False;
        end;

        memberShipTemp.FreeMe := True;
        memberShipTemp.Dormant := True;
        memberShipTemp.Enable := False;
      end;

//      TT3NonRealVehicle(obj).FreeChilds;
      obj.FreeMe := true;
      obj.Dormant:= True;
      obj.Enable := False;
    end
    else  if obj is TT3Vehicle then
    begin
      RemoveESMTracks(obj);

      for j := 0 to TT3Vehicle(obj).MemberTransportList.Count - 1 do
      begin
        memberShipTemp := TT3Vehicle(obj).MemberTransportList[j];

        for k := 0 to TT3Vehicle(memberShipTemp).MemberTransportList.Count - 1 do
        begin
          member2ShipTemp := TT3Vehicle(memberShipTemp).MemberTransportList[k];
          member2ShipTemp.FreeMe := True;
          member2ShipTemp.Dormant := True;
          member2ShipTemp.Enable := False;
        end;

        memberShipTemp.FreeMe := True;
        memberShipTemp.Dormant := True;
        memberShipTemp.Enable := False;
      end;

      obj.Dormant := True;

//      TT3Vehicle(obj).FreeChilds;
    end;
  end
  else if obj is TT3Missile then
  begin
    // added by choco : biar pas didelete di Tote Display diberikan reason "Delete By User"
    obj.reasonDestroy := 1;

    TT3Missile(obj).FreeChilds;
    obj.AbsoluteFree := true;
  end
  // Tambahan Gue : Prince Achmad (biar pas didelete di Tote Display diberikan reason "Delete By User")
  else if obj is TT3Torpedo then
  begin
    obj.reasonDestroy := 1;

    TT3Torpedo(obj).FreeChilds;
    obj.AbsoluteFree := true;

  end
  else if obj is TT3Mine then
  begin
    obj.reasonDestroy := 1;

    TT3Mine(obj).FreeChilds;
    obj.AbsoluteFree := true;
  end
  // ------------------------------
  else if obj is TT3Chaff then
  begin
    // added by choco : biar pas didelete di Tote Display diberikan reason "Delete By User"
    obj.reasonDestroy := 1;

    TT3Chaff(obj).FreeChilds;
    obj.AbsoluteFree := true;
  end
  else if obj is TT3Sonobuoy then
  begin
    obj.reasonDestroy := 1;

    TT3Sonobuoy(obj).PlatformDetectBySonobuoy.Clear;
    if Assigned(TT3Sonobuoy(obj).parentSonobuoy) then
    begin
      ParentSono := TT3Sonobuoy(obj).parentSonobuoy;
      for i := 0 to ParentSono.SonobuoyList.Count -1 do
      begin
        PfSonobuoy := TT3PlatformInstance(ParentSono.SonobuoyList.Items[i]);
        if PfSonobuoy.InstanceIndex = obj.InstanceIndex  then
        begin
          ParentSono.SonobuoyList.Remove(ParentSono.SonobuoyList.Items[i]);
          break;
        end;
      end;
    end;
    TT3Sonobuoy(obj).FreeChilds;
    obj.AbsoluteFree := true;
  end;

  {Buat kebutuhan event summary}
  TT3ClientEventManager(EventManager).OnPlatformHancurin(rec.PlatfomID, '', 1);

//  obj.FreeMe := True;  //(sudah di free di atasnya)
end;

procedure TSimMgr_Client.RemovePlatformFromGroup(ve: TT3Vehicle);
var
  grp : T3CubicleGroup;
  grm : T3CubicleGroupMember;
  i, j : Integer;
begin
  if not(Assigned(ve)) then Exit;

  for i := 0 to CubAssignList.Count - 1 do
  begin
    grp := T3CubicleGroup(CubAssignList.Items[i]);

    if (grp <> nil) and (FMyCubGroup <> nil) then
    begin
      if grp.FData.Group_Index <> FMyCubGroup.FData.Group_Index then
        Continue;

      for j := 0 to grp.Count - 1 do
      begin
        grm := T3CubicleGroupMember(grp.Items[j]);

        if grm <> nil then begin
          if grm.FData.Platform_Instance_Index = ve.InstanceIndex then
          begin
            grp.RemoveMember(grm.FData.Platform_Instance_Index);
            FMyCubGroup := grp;
            Break;
          end;
        end;
      end;
    end;
  end;
end;

procedure TSimMgr_Client.RemoveTemporary(const rec: TRecCmd_SelectPlatformToRemove);
var
  obj : TT3PlatformInstance;
  veTemp : TT3Vehicle;
begin
  obj := FindT3PlatformByID(rec.PlatfomID);

  if not Assigned(obj) then
    Exit;

  if obj is TT3Vehicle then
  begin
    veTemp := TT3Vehicle(obj);
    veTemp.FlagShowStatusDestroy := False;
    obj.FreeMe  := True;
//    RemoveESMTracks(obj);
    obj.Dormant := True;
  end;

  {untuk refresh list}
  TT3ClientEventManager(EventManager).RefreshEmbarkList;
end;

procedure TSimMgr_Client.DrawAll(aCnv: TCanvas);
var
  aRect: TRect;
begin
  {$REGION ' Batas draw di map '}
  aRect.Left := 0;
  aRect.Top := 0;
  aRect.Right := VSimMap.FMap.Width;
  aRect.Bottom := VSimMap.FMap.Height;
  {$ENDREGION}

  {$REGION ' Draw Compas '}
  FCompass.DrawCompass(aCnv);
  {$ENDREGION}

  {$REGION ' Draw Overlay '}
  SimOverlayTemplate.Draw(aCnv, VSimMap.FMap);
  {$ENDREGION}

  {$REGION ' Draw Plotting '}
  SimPlotting.Draw(aCnv);
  {$ENDREGION}

  {$REGION ' Draw Shiping Route '}
  {Draw Shiping Route yg sudah dipublish}
  SimShipingRoute.Draw(aCnv);

  {Draw Shiping Route yg masih dibuat/ temporary }
  DrawPointRouteTemporary.Draw(aCnv);
  {$ENDREGION}

  {$REGION ' Draw Base '}
  SimPlatformBase.Draw(aCnv);
  {$ENDREGION}

  {$REGION ' Draw Ruler '}
  DrawRuler.Draw(aCnv);
  {$ENDREGION}

  {$REGION ' Draw Game Center '}
  DrawGameCenter.Draw(aCnv);
  {$ENDREGION}

  {$REGION ' Draw Range Ring '}
  FRangeRing.ConvertCoord(Converter);
  FRangeRing.Draw(aCnv);
  {$ENDREGION}

  {$REGION ' Draw Line Visual '}
  if vFilter.Show(pftNone, 'Range/bearing cursor', 'Display information') then
  begin
    FLineVisual.ConvertCoord(Converter);
    FLineVisual.Draw(aCnv);
  end;
  {$ENDREGION}

  {$REGION ' Draw Splash Point NGS '}
  FFlashPointNGS.ConvertCoord(Converter);
  FFlashPointNGS.Draw(aCnv);
  {$ENDREGION}

  {$REGION ' Draw Spalsh Target '}
  FTargetSymbol.ConvertCoord(Converter);
  FTargetSymbol.Draw(aCnv);
  {$ENDREGION}

  {$REGION ' Draw Flag Point '}
  DrawFlagPoint.Draw(aCnv);
  {$ENDREGION}

  {$REGION ' Draw Move Line '}
  FMovePlatformLine.ConvertCoord(Converter);
  FMovePlatformLine.Draw(aCnv);
  {$ENDREGION}

  {$REGION ' Draw Object Platform '}
  if not vMapSetting.FormPlotter then
  begin
    SimPlatforms.UpdateAndDrawVisuals(aCnv, aRect);
    SimDetectedTrackList.UpdateAndDrawVisuals(aCnv, aRect);
  end;

  simNonRealPlatform.UpdateAndDrawVisuals(aCnv, aRect);
  {$ENDREGION}

  {$REGION ' Draw Device On Board '}
  SimDevices.UpdateAndDrawVisuals(aCnv, aRect);
  SimWeapons.UpdateAndDrawVisuals(aCnv, aRect);
  {$ENDREGION}

  {$REGION ' Draw Sub Envi Area '}
  if ISInstructor or ISWasdal then
  begin
    if Assigned(Converter) then
    begin
      SubEnviArea.ConvertCoord(Converter);
      SubEnviArea.Draw(aCnv);
    end;
  end;
  {$ENDREGION}

end;

function TSimMgr_Client.DisembarkTransportedPersonel(
  const rec: TRecCmd_DisembarkPersonelTemporary): TT3PlatformInstance;
var
  vObj: TT3PlatformInstance;
  r: TRecCmd_DisembarkPersonelTemporary;
  News: TEventSummary;
  strAction: string;
begin
  r.ParentPlatformID := rec.ParentPlatformID;
  result := inherited;

  if not Assigned(result) then
    Exit;

  if FIsInstructor or FIsWasdal then
  begin
    result.UnitGroup := True;
    result.Enable := True;
    if (result is TT3Vehicle) then
    begin
      vObj := result as TT3PlatformInstance;
      vObj.TrackLabel := vObj.Track_ID;
    end;
  end
  else
  begin
    if FMyCubGroup <> nil then
      result.UnitGroup := (FMyCubGroup.FData.Group_Index = rec.GrpID)
    else
      result.UnitGroup := False;

    result.Enable := result.UnitGroup;

    if (result is TT3Vehicle) then
    begin
      vObj := result as TT3PlatformInstance;
      vObj.TrackLabel := FormatTrackNumber(vObj.TrackNumber);
      vObj.TrackDomain := vObj.PlatformDomain;
      vObj.TrackIdent := piFriend;
    end;
  end;

  if result.UnitGroup then
  begin
    EventManager.OnUpdateTacticalTote;
    EventManager.OnLogStatusTactical('Embark Platform Launched');
    TT3ClientEventManager(EventManager).OnEmbarkPersonelTemporary(r.ParentPlatformID);
  end;

  Log('TSimMgr_Client.LaunchEmbarkPlatformTemporary', 'Launched Embark : ' + IntToStr(rec.EmbarkPlatformID));

  if result is TT3Vehicle then
    TT3Vehicle(result).OnReadyLanding := OnVehicleReadyLanding;
  {menampilkan event summary}
  strAction := vObj.InstanceName + ' Launched';
  News := TEventSummary.create;
  News.Time := simMgrClient.GameTIME;
  News.VehicleIdentifier := vObj.InstanceName;
  News.Force := vObj.Force_Designation;
  News.Action := strAction;
  SimManager.SimEventSummary.Add(News);
  TT3ClientEventManager(EventManager).OnWriteEventSummary;
  TT3ClientEventManager(EventManager).OnRefreshBase;
end;

procedure TSimMgr_Client.DisembarkWithTransported(const rec: TRecCmd_Transport);
var
  News : TEventSummary;
  HostTransport : TT3PlatformInstance;
  NewHostTransport : TT3PlatformInstance;
  MemberTransport : TT3PlatformInstance;

  MemberName : string ;
  HostName : string ;
  MemberForce : Integer;

begin
  inherited;

  MemberName := '';
  HostName := '';
  MemberForce := 3;

  MemberTransport := SimManager.FindT3PlatformByID(rec.MemberPlatformID);
  if MemberTransport <> nil then
  begin
    MemberName := MemberTransport.InstanceName;
    MemberForce := MemberTransport.Force_Designation;
  end;

  HostTransport := SimManager.FindT3PlatformByID(rec.HostPlatformID);
  if HostTransport <> nil then
  begin
    HostName := HostTransport.InstanceName;
  end;

  NewHostTransport := SimManager.FindT3PlatformByID(rec.NewHostPlatformID);
  if NewHostTransport <> nil then
  begin
    HostName := NewHostTransport.InstanceName;
  end;

  {menampilkan event summary}
  News := TEventSummary.create;
  News.Time := simMgrClient.GameTIME;
  News.VehicleIdentifier := MemberName;
  News.Force := MemberForce;
  News.Action := MemberName + ' Disembarked from ' + HostName;

  SimManager.SimEventSummary.Add(News);

  TT3ClientEventManager(EventManager).OnWriteEventSummary;
  TT3ClientEventManager(EventManager).OnUpdateTransportStatus(rec.HostPlatformID);
end;

function TSimMgr_Client.LaunchEmbarkPlatform(const rec: TRecCmd_Embark)
  : TT3PlatformInstance;
var
  grp: T3CubicleGroup; // mk 03052012
begin
  result := inherited;

  if not Assigned(result) then
    Exit;

  if result is TT3Vehicle then
  begin
    TT3Vehicle(result).OnReadyLanding := OnVehicleReadyLanding;
    TT3Vehicle(Result).ShipTacticalInfo1 := ShipTacticalInfo1;
    TT3Vehicle(Result).ShipTacticalInfo2 := ShipTacticalInfo2;
    TT3Vehicle(Result).ShipTacticalInfo3 := ShipTacticalInfo3;
    TT3Vehicle(Result).Connect3D := FIsConnected3D;
    TT3Vehicle(Result).PlatformViewMode := PlatformViewMode;
    
//    grp := //FCubAssignList.GetGroupOf_PlatformIndex(rec.ParentPlatformID) as T3CubicleGroup;
//    grp := FScenario.CubiclesGroupsList.GetGroupOf_PlatformIndex(rec.ParentPlatformID) ;

//    if Assigned(grp) then
//    begin
//      grp.AddMember(TT3Vehicle(Result).InstanceIndex);
//      grp.AddMember(Result.InstanceIndex);
//      Result.GroupIndex := grp.FData.Group_Index;
//      Result.TrackNumber := grp.GetTrackNumber(rec.EmbarkPlatformID);
//      grp.GetTrackNumber(TT3Vehicle(Result).InstanceIndex);
//    end;
  end;

  if result.UnitGroup then
  begin
    EventManager.OnUpdateTacticalTote;
    EventManager.OnLogStatusTactical('Embark Platform Launched');
  end;

  Log('TSimMgr_Client.LaunchEmbarkPlatform', 'Launched Embark : ' + IntToStr(rec.EmbarkPlatformID));
end;

function TSimMgr_Client.DisembarkTransportedOld(const rec: TRecCmd_Embark): TT3PlatformInstance;
var
  vObj: TT3PlatformInstance;
  r: TRecCmd_Transport;
  News: TEventSummary;
  strAction: string;
begin
  r.HostPlatformID := rec.ParentPlatformID;
  result := inherited;

  if not Assigned(result) then
    Exit;

  if FIsInstructor or FIsWasdal then
  begin
    result.UnitGroup := True;
    result.Enable := True;
    if (result is TT3Vehicle) then
    begin
      vObj := result as TT3PlatformInstance;
      vObj.TrackLabel := vObj.Track_ID;
    end;
  end
  else
  begin
    if FMyCubGroup <> nil then
      result.UnitGroup := (FMyCubGroup.FData.Group_Index = rec.GrpID)
    else
      result.UnitGroup := False;

    result.Enable := result.UnitGroup;

    if (result is TT3Vehicle) then
    begin
      vObj := result as TT3PlatformInstance;
      vObj.TrackLabel := FormatTrackNumber(vObj.TrackNumber);
      vObj.TrackDomain := vObj.PlatformDomain;
      vObj.TrackIdent := piFriend;
    end;
  end;

  if result.UnitGroup then
  begin
    EventManager.OnUpdateTacticalTote;
    EventManager.OnLogStatusTactical('Embark Platform Launched');
    TT3ClientEventManager(EventManager).OnUpdateTransportStatus(r.HostPlatformID);
  end;

  Log('TSimMgr_Client.LaunchEmbarkPlatformTemporary', 'Launched Embark : ' + IntToStr(rec.EmbarkPlatformID));

  if result is TT3Vehicle then
    TT3Vehicle(result).OnReadyLanding := OnVehicleReadyLanding;

  {$REGION ' Menampilkan event summary '}
  strAction := vObj.InstanceName + ' Launched';
  News := TEventSummary.create;
  News.Time := simMgrClient.GameTIME;
  News.VehicleIdentifier := vObj.InstanceName;
  News.Force := vObj.Force_Designation;
  News.Action := strAction;
  SimManager.SimEventSummary.Add(News);
  TT3ClientEventManager(EventManager).OnWriteEventSummary;
  TT3ClientEventManager(EventManager).OnRefreshBase;
  {$ENDREGION}
end;

function TSimMgr_Client.TakeOffFromBase(const rec: TRecCmd_LaunchRP): Boolean;
var
  vObj: TT3PlatformInstance;
  r: TRecCmd_Transport;
  News: TEventSummary;
  strAction: string;
begin
  inherited;

  TT3ClientEventManager(EventManager).OnRefreshBase;
end;

procedure TSimMgr_Client.TransportProcess(const rec: TRecCmd_TransportProcess);
begin
  inherited;
  TT3ClientEventManager(EventManager).OnUpdateTransportStatus(rec.HostPlatformID);
end;

function TSimMgr_Client.LaunchRuntimePlatform(const rec: TRecCmd_LaunchRP)
  : TT3PlatformInstance;
var
  //grp: T3CubicleGroup;
  vObj: TT3PlatformInstance;
begin
  // masukkan ke group.
  result := inherited;

//  grp := FCubAssignList.GetGroupByID(rec.RPGroupID) as T3CubicleGroup;

//  if grp <> nil then
//  begin // (lha.. iki... dapet pi.Fdata dari mana..)
//    grp.AddMember(rec.NewPlatformID);
//    grp.GetTrackNumber(rec.NewPlatformID);

//    if (result is TT3Vehicle) or (result is TT3Mine) then
//    begin
//      vObj := result as TT3PlatformInstance;
//      //vObj.OnReadyLanding := OnVehicleReadyLanding;
//      vObj.GroupIndex := grp.FData.Group_Index;
//    end;

//  end;

  if result <> nil then
  begin
    if FIsInstructor or FIsWasdal then
    begin
      result.UnitGroup := True;
      result.Enable := True;
      if (result is TT3Vehicle) or (result is TT3Mine) then
      begin
        vObj := result as TT3PlatformInstance;
        vObj.TrackLabel := vObj.Track_ID;
      end;
    end
    else
    begin
      if FMyCubGroup <> nil then
      begin
        result.UnitGroup := (FMyCubGroup.FData.Group_Index = rec.RPGroupID);
      end
      else
      begin
        result.UnitGroup := False;
      end;

      result.Enable := result.UnitGroup;

      if (result is TT3Vehicle) or (result is TT3Mine) then
      begin
        vObj := result as TT3PlatformInstance;
        // vObj.TrackNumber := grp.GetTrackNumber(vObj.InstanceIndex);

//        if Assigned(grp) then
//          vObj.TrackNumber := grp.GetTrackNumber(vObj.InstanceIndex)
//        else
//          vObj.TrackNumber := 9999;

        vObj.TrackLabel := FormatTrackNumber(vObj.TrackNumber);
        vObj.TrackDomain := vObj.PlatformDomain;
        vObj.TrackIdent := piFriend;
      end;
    end;

    if result.UnitGroup then
    begin
      EventManager.OnUpdateTacticalTote;
    end;

    if result is TT3Vehicle then
    begin
      TT3Vehicle(result).OnReadyLanding := OnVehicleReadyLanding;
      TT3Vehicle(Result).ShipTacticalInfo1 := ShipTacticalInfo1;
      TT3Vehicle(Result).ShipTacticalInfo2 := ShipTacticalInfo2;
      TT3Vehicle(Result).ShipTacticalInfo3 := ShipTacticalInfo3;
      TT3Vehicle(Result).Connect3D := FIsConnected3D;
    end;
  end;
end;

function TSimMgr_Client.LaunchNonRealtimeRuntimePlatform
  (const rec: TRecCmd_LaunchNonRP): TT3PlatformInstance;
var
  //grp: T3CubicleGroup;
  vObj: TT3NonRealVehicle;
begin
  result := inherited;

  if FIsInstructor or FIsWasdal then
  begin
    result.UnitGroup := (rec.NRPGroupID = 0);
    result.Enable := result.UnitGroup;

    if (result is TT3NonRealVehicle) and (result.Enable) then
    begin
      vObj := result as TT3NonRealVehicle;
      vObj.TrackNumber := 2100 + tambah; // add andik suneo
      tambah := tambah + 1; // add andik suneo
      vObj.TrackLabel := 'Unknown';
      vObj.TrackDomain := rec.TrackDomain;
      vObj.TrackIdent := rec.Identity;
      vObj.NRPType := rec.PointType;
      vObj.SymbolType := rec.Symbol;
      vObj.PlatformDomain := rec.TrackDomain;
      vObj.Force_Designation := fcNoForce;
      vObj.LastUpdate := rec.LastUpdateTime;

      vObj.OnChange := EventManager.OnNonRealTimeChanged;
    end;
  end
  else
  begin
    // showing or not
    result.UnitGroup := (FMyCubGroup.FData.Group_Index = rec.NRPGroupID);
    result.Enable := result.UnitGroup;

    if (result is TT3NonRealVehicle) and (result.Enable) then
    begin
      vObj := result as TT3NonRealVehicle;
//      grp := FCubAssignList.GetGroupByID(rec.NRPGroupID) as T3CubicleGroup;

//      if grp <> nil then begin
//        grp.AddMember(rec.NewPlatformID);
//        grp.GetTrackNumber(rec.NewPlatformID);

//        vObj.TrackNumber := grp.GetTrackNumber(vObj.InstanceIndex);
//      end
//      else begin
//        vObj.TrackNumber := 0;
//      end;

      vObj.TrackLabel := FormatTrackNumber(vObj.TrackNumber);
      vObj.TrackDomain := rec.TrackDomain;
      vObj.TrackIdent := rec.Identity;
      vObj.NRPType := rec.PointType;
      vObj.SymbolType := rec.Symbol;
      vObj.PlatformDomain := rec.TrackDomain;
      vObj.Force_Designation := fcNoForce;
      vObj.LastUpdate := rec.LastUpdateTime;

      vObj.OnChange := EventManager.OnNonRealTimeChanged;
    end;
  end;
end;

function TSimMgr_Client.LaunchReferencePoint(const rec: TRecCmd_LaunchNonRP)
  : TT3PlatformInstance;
var
  vObj: TT3NonRealVehicle;
begin
  result := inherited;

  if FMyCubGroup.FData.Force_Designation = rec.NRPGroupID then
  begin // (lha.. iki... dapet pi.Fdata dari mana..)

    if result is TT3NonRealVehicle then
    begin
      vObj := result as TT3NonRealVehicle;
      vObj.Force_Designation := rec.NRPGroupID;
    end;
  end;

  if FIsInstructor or FIsWasdal then
  begin
    result.UnitGroup := (rec.NRPGroupID = 0);
    result.Enable := false;
    if result is TT3NonRealVehicle then
    begin
      vObj := result as TT3NonRealVehicle;
      vObj.TrackDomain := rec.TrackDomain;
      vObj.TrackIdent := rec.Identity;
      vObj.NRPType := rec.PointType;
      vObj.SymbolType := rec.Symbol;
      vObj.PlatformDomain := rec.TrackDomain;
    end;
  end
  else
  begin
    // showing or not
    result.UnitGroup := (FMyCubGroup.FData.Force_Designation = rec.NRPGroupID);
    result.Enable := result.UnitGroup;

    if result is TT3NonRealVehicle then
    begin
      vObj := result as TT3NonRealVehicle;
      vObj.TrackNumber := 2100 + tambah; // add andik suneo
      tambah := tambah + 1; // add andik suneo
      vObj.TrackDomain := rec.TrackDomain;
      vObj.TrackIdent := rec.Identity;
      vObj.NRPType := rec.PointType;
      vObj.SymbolType := rec.Symbol;
      vObj.PlatformDomain := rec.TrackDomain;
    end;
  end;
end;

function TSimMgr_Client.UpdatePropertyPlatform
  (const rec: TRecCmd_Platform_SET_PROPERTY): TT3PlatformInstance;
var
  detectedTrack: TSimObject;
  i: integer;
  sensor: TT3Sensor;
begin
  // update domain
  result := inherited;

  if ISInstructor or ISWasdal then
  begin
    if Assigned(result) then
    begin
      if not(result is TT3NonRealVehicle) then
        Exit;

      if TT3PlatformInstance(result).Selected then
        TT3PlatformInstance(result).Selected := false;

      if rec.domain <> -1 then
      begin
        TT3PlatformInstance(result).PlatformDomain := rec.domain;
        TT3PlatformInstance(result).TrackDomain := TT3PlatformInstance(result)
          .PlatformDomain;
      end;

      if rec.Identity <> -1 then
        TT3PlatformInstance(result).TrackIdent := rec.Identity;

      if rec.PlatformType <> -1 then
        TT3PlatformInstance(result).PlatformType := rec.PlatformType;
    end;
  end;

  if not ISInstructor or not ISWasdal then
  begin
    if rec.GrpID <> FMyCubGroup.FData.Group_Index then
      Exit; // add nando + mamik 30032012

    detectedTrack := findDetectedTrack(result as TSimObject);
    if detectedTrack <> nil then
    begin
      if TT3DetectedTrack(detectedTrack).Selected then
      begin
        TT3DetectedTrack(detectedTrack).Selected := false;
      end;

      for i := 0 to TT3DetectedTrack(detectedTrack).TrackDetectedBy.Count - 1 do
      begin
        sensor := TT3DetectedTrack(detectedTrack).TrackDetectedBy.Items[i];
        if sensor is TT3DataLink and (TT3DetectedTrack(detectedTrack)
            .TrackDetectedBy.Count <= 1) then
          Exit;
      end;

      if rec.domain <> -1 then
        TT3DetectedTrack(detectedTrack).TrackDomain := rec.domain;

      if rec.Identity <> -1 then
        TT3DetectedTrack(detectedTrack).TrackIdent := rec.Identity;

      if rec.PlatformType <> -1 then
        TT3DetectedTrack(detectedTrack).TrackType := rec.PlatformType;

      VSimMap.FMap.Repaint;
    end
    else
    begin
      if (Assigned(result) and (result is TT3NonRealVehicle)) then
      begin
        if TT3PlatformInstance(result).Selected then
          TT3PlatformInstance(result).Selected := false;

        TT3PlatformInstance(result).TrackDomain := rec.domain;
        TT3PlatformInstance(result).PlatformDomain := rec.domain;
        TT3PlatformInstance(result).TrackIdent := rec.Identity;
        TT3PlatformInstance(result).PlatformType := rec.PlatformType;
      end;
    end;
  end;
end;

function TSimMgr_Client.UpdateNRPProperty(const rec: TRecCmd_NRP_SET_PROPERTY)
  : TT3PlatformInstance;
var
  vIndex: integer;
  obj: TT3NonRealVehicle;
  pi: TT3PlatformInstance;
  detectedTrack: TSimObject;
begin
  result := nil;

  if ((rec.GrpID = 0) and not ISInstructor) and // dng
     ((rec.GrpID = 0) and not ISWasdal) then
    Exit;

  if ((ISInstructor) and (rec.GrpID = 0)) or ((ISWasdal) and (rec.GrpID = 0)) then
  begin
    vIndex := rec.PlatfomID;
    obj := FindNonRealPlatformByID(vIndex) as TT3NonRealVehicle;

    if obj = nil then
      Exit;

    case rec.OrderID of
      NRP_ID_TYPE:
        TT3NonRealVehicle(obj).NRPType := rec.TypeNRP;
      NRP_ID_TRACKDOMAIN:
        begin
          TT3NonRealVehicle(obj).TrackDomain := rec.domain;
          TT3NonRealVehicle(obj).PlatformDomain := rec.domain;
          TT3NonRealVehicle(obj).SymbolType := rec.Symbol;
        end;
      NRP_ID_TRACKIDENT:
        TT3NonRealVehicle(obj).TrackIdent := rec.Identity;
      NRP_ID_FORCE:
        TT3NonRealVehicle(obj).Force_Designation := rec.Force;
      NRP_ID_PLATFORMTYPE:
        TT3NonRealVehicle(obj).PlatformType := rec.PlatformType;
      NRP_ID_SYMBOLTYPE:
        TT3NonRealVehicle(obj).SymbolType := rec.Symbol;
      NRP_ID_ALL:
        begin
          TT3NonRealVehicle(obj).NRPType := rec.TypeNRP;
          TT3NonRealVehicle(obj).TrackDomain := rec.domain;
          TT3NonRealVehicle(obj).PlatformDomain := rec.domain;
          TT3NonRealVehicle(obj).TrackIdent := rec.Identity;
          TT3NonRealVehicle(obj).Force_Designation := rec.Force;
          TT3NonRealVehicle(obj).PlatformType := rec.PlatformType;
          TT3NonRealVehicle(obj).SymbolType := rec.Symbol;
        end;
    end;

    if Assigned(obj.OnChange) then
      obj.OnChange(obj);
  end
  else if Assigned(FMyCubGroup) then
  begin
    if (rec.GrpID = FMyCubGroup.FData.Group_Index) then
    begin
      vIndex := rec.PlatfomID;
      obj := FindNonRealPlatformByID(vIndex) as TT3NonRealVehicle;

      if obj <> nil then
      begin
        case rec.OrderID of
          NRP_ID_TYPE:
            TT3NonRealVehicle(obj).NRPType := rec.TypeNRP;
          NRP_ID_TRACKDOMAIN:
            begin
              TT3NonRealVehicle(obj).TrackDomain := rec.domain;
              TT3NonRealVehicle(obj).PlatformDomain := rec.domain;
              TT3NonRealVehicle(obj).SymbolType := rec.Symbol;
            end;
          NRP_ID_TRACKIDENT:
            TT3NonRealVehicle(obj).TrackIdent := rec.Identity;
          NRP_ID_FORCE:
            TT3NonRealVehicle(obj).Force_Designation := rec.Force;
          NRP_ID_PLATFORMTYPE:
            TT3NonRealVehicle(obj).PlatformType := rec.PlatformType;
          NRP_ID_SYMBOLTYPE:
            TT3NonRealVehicle(obj).SymbolType := rec.Symbol;
          NRP_ID_ALL:
            begin
              TT3NonRealVehicle(obj).NRPType := rec.TypeNRP;
              TT3NonRealVehicle(obj).TrackDomain := rec.domain;
              TT3NonRealVehicle(obj).PlatformDomain := rec.domain;
              TT3NonRealVehicle(obj).TrackIdent := rec.Identity;
              TT3NonRealVehicle(obj).Force_Designation := rec.Force;
              TT3NonRealVehicle(obj).PlatformType := rec.PlatformType;
              TT3NonRealVehicle(obj).SymbolType := rec.Symbol;
            end;
        end;

        if Assigned(obj.OnChange) then
          obj.OnChange(obj);
      end
      else
      begin
        pi := FindT3PlatformByID(vIndex) as TT3PlatformInstance;
        detectedTrack := findDetectedTrack(pi as TSimObject);

        if detectedTrack = nil then
          Exit;

        case rec.OrderID of
          NRP_ID_TYPE:
            TT3DetectedTrack(detectedTrack).TrackType := rec.TypeNRP;
          NRP_ID_TRACKDOMAIN:
            TT3DetectedTrack(detectedTrack).TrackDomain := rec.domain;
          NRP_ID_TRACKIDENT:
            TT3DetectedTrack(detectedTrack).TrackIdent := rec.Identity;
          // P_ID_FORCE : TT3DetectedTrack(detectedtrack).track.Force_Designation;
          NRP_ID_PLATFORMTYPE:
            TT3DetectedTrack(detectedTrack).TrackType := rec.PlatformType;
          // NRP_ID_SYMBOLTYPE : TT3DetectedTrack(detectedtrack).SymbolType := rec.symbol;
          NRP_ID_ALL:
            begin
              TT3DetectedTrack(detectedTrack).TrackType := rec.TypeNRP;
              TT3DetectedTrack(detectedTrack).TrackDomain := rec.domain;
              TT3DetectedTrack(detectedTrack).TrackIdent := rec.Identity;
              // TT3DetectedTrack(detectedtrack).Force_Designation := rec.Force;
              TT3DetectedTrack(detectedTrack).TrackType := rec.PlatformType;
              // TT3DetectedTrack(detectedtrack).SymbolType := rec.symbol;
            end;
        end;

        if Assigned(obj.OnChange) then
          obj.OnChange(detectedTrack);
      end;
    end;
  end;

  EventManager.OnMapNeedUpdate(nil);
end;

procedure TSimMgr_Client.RepairPlatform(const rec: TRecCmd_Platform_Repair);
var
  ve : TT3Vehicle;
begin
  inherited;

  ve := FindT3PlatformByID(rec.PlatfomID) as TT3Vehicle;
  if Assigned(ve) then
    EventManager.OnVehicleHealthChange(ve);
end;

procedure TSimMgr_Client.UnAssginedDetTrackEvent;
var
  i : integer;
  obj : TObject;
begin
  for i := 0 to SimDetectedTrackList.itemCount - 1 do begin
    obj := SimDetectedTrackList.getObject(i);
    with TT3DetectedTrack(obj) do begin
      OnDetectecTrackDestroy := nil;
      OnSelected := nil;
      OnTrackBlinking := nil;
      OnMerged := nil;
      OnUnmerged := nil;
      OnDestroy := nil;
      OnHancur := nil;
      OnPropertyChange := nil;
      VarianceESM := nil;
    end;
  end;
end;

procedure TSimMgr_Client.UpdateAllDevicePlatform(ve: TT3Vehicle);
begin
  inherited;
end;

function TSimMgr_Client.LaunchMissile(const rec: TRecCmd_LaunchMissile)
  : TObject;
begin
  result := Inherited;
end;

procedure TSimMgr_Client.ChangeLogistic(const rec: TRecCmd_Change_Logistic);
var
  ve : TT3Vehicle;
  base : TPlatformBase;
begin
  inherited;

  case rec.StateID of
    0 :
    begin
      ve := FindT3PlatformByID(rec.PlatfomID) as TT3Vehicle;
      if Assigned(ve) then
        TT3ClientEventManager(EventManager).OnVehicleLogisticChange(ve);
    end;
    1 :
    begin
      ve := FindT3PlatformByID(rec.DestinationID) as TT3Vehicle;
      if Assigned(ve) then
        TT3ClientEventManager(EventManager).OnVehicleLogisticChange(ve);
    end;
    2:
    begin
      ve := FindT3PlatformByID(rec.PlatfomID) as TT3Vehicle;
      if Assigned(ve) then
        TT3ClientEventManager(EventManager).OnVehicleLogisticChange(ve);
    end;
  end;
end;

procedure TSimMgr_Client.ChangeLogisticState(const rec: TRecCmd_State_Logistic);
var
  ve : TT3Vehicle;
begin
  inherited;

  ve := FindT3PlatformByID(rec.PlatfomID) as TT3Vehicle;
  if Assigned(ve) then
    TT3ClientEventManager(EventManager).OnVehicleLogisticChange(ve);
end;

procedure TSimMgr_Client.ChangeRampState(const rec: TRecCmd_RampController);
begin
  inherited;

  TT3ClientEventManager(EventManager).OnUpdateTransportStatus(rec.PlatformID);
end;

procedure TSimMgr_Client.ChangeSystemState(
  const rec: TRecCmd_Change_SystemState);
var
  ve : TT3Vehicle;
begin
  inherited;

  ve := FindT3PlatformByID(rec.PlatfomID) as TT3Vehicle;
  if Assigned(ve) then
    EventManager.OnVehicleSystemStateChange(ve);
end;

procedure TSimMgr_Client.ChangeTrackNumber(const rec
    : TRecCmd_Platform_CHANGE_TRACKNUMBER);
var
  plat: TT3PlatformInstance;
  track: TT3DetectedTrack;
  esm: TT3EsmTrack;
  newNumber: integer;
  i, J: integer;
begin
  if (ISInstructor) or (ISWasdal) or (rec.GrpID = FMyCubGroup.FData.Group_Index) then
  begin
    if ISInstructor or ISWasdal then
    begin
      {$REGION ' Non Real Time '}
      plat := FindNonRealPlatformByID(rec.PlatfomID);
      if Assigned(plat) then
      begin
        if rec.newTrackNumber <> 0 then
          plat.TrackNumber := rec.newTrackNumber
        else
          plat.InstanceName := rec.newName;
      end;
      {$ENDREGION}
    end
    else
    begin
      if rec.newTrackNumber = 0 then
      begin
        newNumber := GetBiggestTrackNumber + 1;
      end
      else
      begin
        newNumber := rec.newTrackNumber;
      end;

      track := nil;

      if rec.typeTrack = 'DetectedTrack' then
      begin
        {$REGION ' DetectedTrack '}
        plat := FindT3PlatformByID(rec.PlatfomID);

        if not Assigned(plat) then
          Exit;

        track := findDetectedTrack(plat) as TT3DetectedTrack;

        if not Assigned(track) then
          Exit;

        case rec.OrderID of
          CORD_ID_TRACKNUMBER : track.TrackNumber := newNumber;
          CORD_ID_NAME : track.TrackName := rec.newName;
          CORD_ID_CLASS : track.TrackClass := rec.newClass
        end;
        {$ENDREGION}
      end
      else if rec.typeTrack = 'NRTTrack' then
      begin
        {$REGION ' Non Real Time '}
        plat := FindNonRealPlatformByID(rec.PlatfomID);

        if not Assigned(plat) then
          Exit;

        case rec.OrderID of
          CORD_ID_TRACKNUMBER : plat.TrackNumber := rec.newTrackNumber;
//          CORD_ID_NAME : plat.Trackna := rec.newName;
//          CORD_ID_CLASS : plat.InstanceClass := rec.newClass;
        end;
        {$ENDREGION}
      end
      else if rec.typeTrack = 'ESMTrack' then
      begin
        {$REGION ' ESM '}
        for i := 0 to SimDetectedTrackList.itemCount - 1 do
        begin
          track := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;
          if Assigned(track) then
          begin
            for J := 0 to track.ESMTracks.Count - 1 do
            begin
              esm := track.ESMTracks[J];
              if esm.TrackNumber = rec.oldESMNumber then
              begin
                esm.TrackNumber := rec.newESMNumber;
              end;
            end;
          end;
        end;
        {$ENDREGION}
      end;
    end;

    VSimMap.FMap.Repaint;
  end;
end;

function TSimMgr_Client.CheckPosArea(DataArea: string; CenterMapX,
  CenterMapY: Double; var PosValue: Integer): Boolean;
var
  FX1, FY1, FX2, FY2, FArea: string;
begin
  GetValue('X1_', DataArea, FX1);
  GetValue('Y1_', DataArea, FY1);
  GetValue('X2_', DataArea, FX2);
  GetValue('Y2_', DataArea, FY2);

  if (CenterMapX >= StrToFloat(FX1)) and (CenterMapY <= StrToFloat(FY1)) and
    (CenterMapX <= StrToFloat(FX2)) and (CenterMapY >= StrToFloat(FY2)) then
    PosValue := 2
  else
    PosValue := 0;

  Result :=(PosValue <> 0);
end;

function TSimMgr_Client.CheckQualifyArea(FListFile: TStringList; OnMap: Integer;
  var FArea: string): string;
var
  I, J, FZoomValue, FPosValue, TotalValue : Integer;
  DefaultArea : string;
begin
  ListTotalValue.Clear;

  DefaultArea := 'Area_Indonesia-Background\X1_91.5837777777778\' +
      'Y1_16.5468333333333\X2_148.513888888889\Y2_-20.7428888888889\InZoom_0.125\OutZoom_8192#';

  if FListFile.Count = 0 then
  begin
    FArea := 'Indonesia-Background';
    FListFile.Add(DefaultArea);
  end
  else
  begin
    for I := 0 to FListFile.Count - 1 do
    begin
      CheckZoomArea(FListFile[I], VSimMap.FMap.Zoom, FZoomValue);
      CheckPosArea(FListFile[I], VSimMap.FMap.CenterX, VSimMap.FMap.CenterY, FPosValue);
      TotalValue := FZoomValue + FPosValue;
      ListTotalValue.Add(IntToStr(TotalValue));
    end;

    for J := 3 downto 0 do
    begin
      if FArea = '' then
      begin
        for I := 0 to ListTotalValue.Count - 1 do
        begin
          if ListTotalValue[I] = IntToStr(J) then
          begin
            GetValue('Area_', FListFile[I], FArea);
            Break;
          end
          else
            Continue;
        end;
      end
      else
        Break;
    end;
  end;

  ListTotalValue.Clear;
end;

function TSimMgr_Client.CheckZoomArea(DataArea: string; LastZoom: Double;
  var ZoomValue: Integer): Boolean;
var
  FZoomIn, FZoomOut : string;
begin
  GetValue('InZoom_', DataArea, FZoomIn);
  GetValue('OutZoom', DataArea, FZoomOut);

  if (LastZoom >= StrToFloat(FZoomIn)) and (LastZoom <= StrToFloat(FZoomOut)) then
    ZoomValue := 1
  else
    ZoomValue := 0;

  Result := (ZoomValue <> 0);
end;

function TSimMgr_Client.isExistTrackNumber(const Value: integer): Boolean;
var
  i: integer;
  obj: TSimObject;
begin
  // Check Track Number pada Detected dan Non Real List dan Platforms

  result := false;
  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    obj := SimDetectedTrackList.getObject(i);
    if obj is TT3DetectedTrack then
    begin
      if TT3DetectedTrack(obj).TrackNumber = Value then
      begin
        result := True;
        Exit;
      end;
    end;
  end;

  for i := 0 to simNonRealPlatform.itemCount - 1 do
  begin
    obj := simNonRealPlatform.getObject(i);
    if obj is TT3NonRealVehicle then
    begin
      if TT3NonRealVehicle(obj).TrackNumber = Value then
      begin
        result := True;
        Exit;
      end;
    end;
  end;

  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    obj := SimPlatforms.getObject(i);
    if obj is TT3Vehicle then
    begin
      if TT3Vehicle(obj).TrackNumber = Value then
      begin
        result := True;
        Exit;
      end;
    end;
  end;
end;

function TSimMgr_Client.IsGameStart: Boolean;
begin
  Result := inherited;
end;

function TSimMgr_Client.getMaxRadarRangeInShip(ship: TT3PlatformInstance)
  : double;
var
  i: integer;
  Value: double;
  dev: TSimObject;
begin
  result := 0;

  if not Assigned(ship) then
    Exit;

  Value := 0;
  for i := 0 to SimDevices.itemCount - 1 do
  begin
    dev := SimDevices.getObject(i);
    if (dev is TT3Radar) and (dev.Parent.Equals(ship)) then
    begin
      if (Value < TT3Radar(dev).RadarDefinition.FDef.Detection_Range) then
      begin
        Value := TT3Radar(dev).RadarDefinition.FDef.Detection_Range
      end;
    end;
  end;

  result := Value;
end;

procedure TSimMgr_Client.GunFire(rec: TRecCmd_GunFire);
var
  pi, tgt: TT3PlatformInstance;
  wpn: TT3GunOnVehicle;
  News : TEventSummary;
  strAction : string;
begin
  inherited;

  pi := FindT3PlatformByID(rec.ParentPlatformID);

  if (pi = nil) and not(pi is TT3Vehicle) then
    Exit;

  // dikomen karena 1 vehicle ada GunID yang sama. sementara pake GunName dlu.
  //wpn := TT3Vehicle(pi).getWeapon(rec.GunName, TT3GunOnVehicle)
  //as TT3GunOnVehicle;

  wpn := TT3Vehicle(pi).getWeapon(rec.GunID, TT3GunOnVehicle) as TT3GunOnVehicle;
  if wpn <> nil then
  begin
    wpn.SalvoSize := rec.SalvoSize;

    case rec.OrderID of
      // control mode;
      CORD_ID_control_mode:
        begin
          wpn.ControlMode := rec.ControlMode;
          Log('TSimMgr_Client.GunFire', 'Received : ' + rec.GunName + ' - Control Mode : ' + IntToStr
              (rec.ControlMode));
        end;
      // salvo mode;
      CORD_ID_salvo_mode:
        begin
          wpn.SalvoMode := rec.SalvoMode;
          Log('TSimMgr_Client.GunFire', 'Received : ' + rec.GunName + ' - Salvo Mode : ' + IntToStr
              (rec.SalvoMode));
        end;
      // select target
      CORD_ID_target:
        begin
          tgt := FindT3PlatformByID(rec.TargetPlatformID);

          if not Assigned(tgt) then
            tgt := FindNonRealPlatformByID(rec.TargetPlatformID);

          if tgt = nil then
            Exit;

          wpn.isToTarget := True;
          wpn.TargetObject := tgt;
          Log('TSimMgr_Client.GunFire', 'Received : ' + rec.GunName + ' - Target Object : ' + IntToStr
              (rec.TargetPlatformID) + ' ; Elevation : ' + FormatSpeed(rec.NGSElevation) +
              ' ; Bearing : ' + FormatSpeed(rec.NGSBearing));
        end;
      // salvo size
      CORD_ID_salvo_size:
        begin
          wpn.SalvoSize := rec.SalvoSize;
          Log('TSimMgr_Client.GunFire', 'Received : ' + rec.GunName + ' - Salvo Size : ' + IntToStr
              (rec.SalvoSize));
        end;
      // intercept range
      CORD_ID_intercp_range:
        begin
          wpn.InterceptRange := rec.InterceptRange;
          Log('TSimMgr_Client.GunFire', 'Received : ' + rec.GunName + ' - Intercept Range : ' +
              FormatFLoat('00.00', rec.InterceptRange));
        end;
      // threshold speed
      CORD_ID_thresh_speed:
        begin
          wpn.ThresholdSpeed := rec.ThresSpeed;
          Log('TSimMgr_Client.GunFire', 'Received : ' + rec.GunName + ' - Threshold Speed : ' +
              FormatFLoat('00.00', rec.ThresSpeed));
        end;
      // fire result
      CORD_ID_fire_result:
        begin
          wpn.Quantity := rec.GunCapacityRemain;
          wpn.WeaponStatus := wsFiring;

          //          Log('Received : ' + rec.GunName + ' - Fire POH : ' + IntToStr
          //              (rec.HitProbability));

          if Assigned(ControlledPlatform) then
          begin
            if rec.TargetPlatformID = ControlledPlatform.InstanceIndex then
            begin
              if ISInstructor or ISWasdal then
                EventManager.OnLogStatusTactical(ControlledPlatform.TrackLabel
                            + ' UNDER GUNFIRE ATTACK')
              else
                EventManager.OnLogStatusTactical(IntToStr(ControlledPlatform.TrackNumber)
                            + ' UNDER GUNFIRE ATTACK');
            end;
          end;
        end;
      CORD_ID_assign: // assign gun
        begin
          wpn.IsAssigned := True;
          //AssignWeaponEvent(wpn);

          tgt := FindT3PlatformByID(rec.TargetPlatformID);
          if not Assigned(tgt) then
            Exit;

          tgt.IsAssigned := True;
          //wpn.OnUpdateQuantity := EventManager.OnGunUpdateQuantity;
          Log('TSimMgr_Client.GunFire', 'Received : ' + rec.GunName + ' - Assign Track : ');
        end;
      CORD_ID_break: // break assignment
        begin
          wpn.IsAssigned := false;
          tgt := FindT3PlatformByID(rec.TargetPlatformID);

          if Assigned(tgt) and tgt.IsAssigned then
            tgt.IsAssigned := false;

          Log('TSimMgr_Client.GunFire', 'Received : ' + rec.GunName + ' - Break');
          {if wpn.WeaponStatus = wsFiring then
          begin
            wpn.CeaseFire;
          end; }
        end;
      CORD_ID_cease: // stop gun fire
        begin
          tgt := FindT3PlatformByID(rec.TargetPlatformID);

          if Assigned(tgt) and tgt.FreeMe then
          begin
            wpn.IsAssigned := false;

            if tgt.IsAssigned then
              tgt.IsAssigned := false;

            wpn.TargetObject := nil;
          end;
          FlashPointNGS.Visible := False;
          {if Assigned(wpn.TargetObject) then
          begin
            if wpn.TargetObject.FreeMe then
              wpn.TargetObject := nil;
          end;}

          wpn.CeaseFire;

          Log('TSimMgr_Client.GunFire', 'Received : ' + TT3Vehicle(pi).InstanceName + ':' +
            rec.GunName + ' - Cease Fire ');
          Exit;
        end;
      { send post n altitude NGS target }
      CORD_ID_postNGS:
        begin
          wpn.isToTarget := False;
          wpn.NGSPosX := rec.px;
          wpn.NGSPosY := rec.py;
          wpn.NGSPosZ := rec.pAltitude;
          wpn.NGSSpotLine := rec.degSpotLine;
          wpn.NGSGunLine  := rec.degGunLine;

          wpn.NGSBearing := rec.NGSBearing;
          wpn.NGSElevation := rec.NGSElevation;

          //system error
          wpn.NGSFlashX   := rec.pXflash;
          wpn.NGSFlashY   := rec.pYflash;

          wpn.VBSAzimuth := rec.VBSAzimuth;
          wpn.VBSElevation := rec.VBSElevation;

          Log('TSimMgr_Client.GunFire', 'Received : ' + rec.GunName + ' - Position : (' + FloatToStr
              (rec.px) + ' ' + FloatToStr(rec.py)
              + '), Altitude :' + FloatToStr(rec.pAltitude) +
              ' ; Elevation : ' + FormatSpeed(rec.NGSElevation) +
              ' ; Bearing : ' + FormatSpeed(rec.NGSBearing));
        end;
      { NGS correction L/R }
      CORD_ID_NGSCorrLR :
        begin
          wpn.NGSPosX := rec.px;
          wpn.NGSPosY := rec.py;
          wpn.NGSFlashX   := rec.pXflash;
          wpn.NGSFlashY   := rec.pYflash;
          wpn.NGSCorrMode := rec.NGSCorrMode;

          if wpn.NGSCorrMode = 1  then
            wpn.OptDefCorr  := -(rec.NGSDefCorr)
          else if wpn.NGSCorrMode = 2 then
            wpn.OptDefCorr  := rec.NGSDefCorr
          else
            wpn.OptDefCorr  := 0;

          Log('TSimMgr_Client.GunFire', 'Received : ' + rec.GunName + ' - NGS Correction L/R : '
              + FloatToStr(wpn.OptDefCorr) +
              ' ; Elevation : ' + FormatSpeed(rec.NGSElevation) +
              ' ; Bearing : ' + FormatSpeed(rec.NGSBearing));
        end;
      { NGS correction D/A }
      CORD_ID_NGSCorrDA :
        begin
          wpn.NGSPosX := rec.px;
          wpn.NGSPosY := rec.py;
          wpn.NGSFlashX   := rec.pXflash;
          wpn.NGSFlashY   := rec.pYflash;
          wpn.NGSCorrMode := rec.NGSCorrMode;

          if wpn.NGSCorrMode = 1  then
            wpn.OptRangeCorr  := -(rec.NGSRangeCorr)
          else if wpn.NGSCorrMode = 2 then
            wpn.OptRangeCorr:= rec.NGSRangeCorr
          else
            wpn.OptRangeCorr:= 0;

          Log('TSimMgr_Client.GunFire', 'Received : ' + rec.GunName + ' - NGS Correction D/A : '
              + FloatToStr(wpn.OptDefCorr) +
              ' ; Elevation : ' + FormatSpeed(rec.NGSElevation) +
              ' ; Bearing : ' + FormatSpeed(rec.NGSBearing));
        end;
      CORD_ID_fire :
      begin
        {Menampilkan event summary}
        if wpn.isToTarget then
        begin
          if Assigned(wpn.TargetObject) then
            strAction := 'Gun ' + wpn.InstanceName + ' fired to ' + TT3PlatformInstance(wpn.TargetObject).InstanceName;
        end
        else
        begin
          strAction := 'Gun ' + wpn.InstanceName + ' fired to position : ' + formatDMS_long
              (wpn.NGSPosX) + ' ' + formatDMS_latt(wpn.NGSPosY) + ', Altitude :' + FloatToStr(wpn.NGSPosZ) +
              ', Elevation : ' + FormatSpeed(wpn.NGSElevation) +',  Bearing : ' + FormatSpeed(wpn.NGSBearing);
        end;

        News := TEventSummary.Create;
        News.Time := simMgrClient.GameTIME;
        News.VehicleIdentifier := TT3Vehicle(pi).InstanceName;
        News.Force := TT3Vehicle(pi).Force_Designation;
        News.Action := strAction;
        SimManager.SimEventSummary.Add(News);

        TT3ClientEventManager(EventManager).OnWriteEventSummary;
      end;
    end;
  end;
end;

function TSimMgr_Client.GetShipTacticalInfo(const Index: Integer): string;
begin
  result := FShipTacticalInfo[Index];
end;

function TSimMgr_Client.GetTrackNumberForECM(ecm: TSimObject): integer;
var
  pi: TT3Unit;
begin
  result := 0;

  if ecm is TT3DeviceUnit then
  begin
    pi := ecm as TT3DeviceUnit;
    result := FMyCubGroup.GetTrackNumber(pi.InstanceIndex);
  end;
end;

function TSimMgr_Client.GetTrackNumberForWeapon: integer;
begin
  result := TrackNumberWeapon;
  inc(TrackNumberWeapon);
end;

function TSimMgr_Client.GetValue(LookFor, Sentence: string;
  var Value: string): Boolean;
var
  IndexSeparate1, IndexSeparate2, IndexSeparate3 : Integer;
  Marker, FData : string;
  LData : Integer;
begin
  IndexSeparate1 := Pos(LookFor, Sentence);
  if IndexSeparate1 > 0 then
  begin
    FindMark(LookFor, Marker);
    IndexSeparate2 := Pos(Marker, Sentence);
    FData := Copy(Sentence, IndexSeparate1, (IndexSeparate2 - IndexSeparate1));

    LData := Length(FData);
    IndexSeparate3 := Pos('_', FData);
    Value := Copy(FData, IndexSeparate3 + 1, LData);
    Value := Trim(Value);
  end
  else
    Value := '0';

  Result := (Value <> '');
end;

procedure TSimMgr_Client.GotoTime(Index: Integer);
begin
  inherited;

  if Index < 0 then
  begin
    if Assigned(FOnUpdateGotoProgress) then
      FOnUpdateGotoProgress(100);
  end;

  FTimeElapse := FElapseTimeToGo;

end;

procedure TSimMgr_Client.GunFire(rec: TRecCmd_GunFireState);
//var
//  pi, tgt: TT3PlatformInstance;
//  wpn: TT3GunOnVehicle;
//  shoot: TT3GunShoot;
//  ProbOfHit: Byte;
//  S: string;
begin
//  inherited;

//  pi := FindT3PlatformByID(rec.ParentPlatformID);
//  tgt := FindT3PlatformByID(rec.TargetPlatformID);

//  if (pi = nil) and not(pi is TT3Vehicle) then
//    Exit;
//  if tgt = nil then
//    Exit;

//  wpn := TT3Vehicle(pi).getWeapon(rec.GunID, TT3GunOnVehicle)
//    as TT3GunOnVehicle;

//  if wpn <> nil then
//  begin
//    wpn.TargetObject := tgt;
//    wpn.ControlMode := rec.ControlMode;
//    wpn.SalvoMode := rec.SalvoMode;
//    wpn.SalvoSize := rec.SalvoSize;
//    // wpn.Quantity            := rec.GunCapacityRemain;
//    AssignWeaponEvent(wpn);
//    wpn.OnUpdateQuantity := EventManager.OnGunUpdateQuantity;

//    case rec.OrderID of
//      CORD_ID_fire: // gun fire
//        begin
//          case wpn.ControlMode of
//            1:
//              begin

//              end;
//            2:
//              begin
//                { ngeceknya pas mau nembak aj...
//                  if (not wpn.IsAssigned) and (wpn.GunDefinition.FData.Fire_Cntl_Director_Req = 1) then
//                  Exit;
//                  }
//              end;
//            3:
//              begin

//              end;
//          end;

//          shoot := wpn.PrepareShoot;
//          shoot.shoot(rec.HitProbability);
//          wpn.Quantity := wpn.Quantity - 1;

//        end;
//      CORD_ID_cease: // stop gun fire
//        begin
//          Exit;
//        end;
//    end;
//  end;
end;

procedure TSimMgr_Client.OnBombMineHit(sender: TSimObject; Target: TSimObject;
  lethality: integer);
begin
  if not(sender is TT3Bomb) or not(Target is TT3Mine) then
    Exit;

  if Target is TT3PlatformInstance then
  begin
    if sender is TT3Mine then
    begin
      if Assigned(TT3Mine(sender).OnHit) then
        TT3Mine(sender).OnHit(sender, Target, lethality);
    end
    else
    begin
      if Assigned(TT3Bomb(sender).OnHit) then
        TT3Bomb(sender).OnHit(sender, Target, lethality);
    end;
  end;
end;

procedure TSimMgr_Client.AssignWeaponEvent(weapon: TT3Weapon);
begin
  inherited;
  {
    if weapon is TT3GunOnVehicle then
    begin
    TT3GunOnVehicle(weapon).OnUpdateQuantity := EventManager.OnGunUpdateQuantity;
    end;
    }
end;

procedure TSimMgr_Client.AssignSensorEvent(sensor: TT3Sensor);
begin
  inherited;

  if sensor is TT3Radar then
  begin
    TT3Radar(sensor).OnFireControlUpdated := EventManager.OnFireControlUpdated;
  end
  else if sensor is TT3DataLink then
  begin
    TT3DataLink(sensor).OnUpdated := EventManager.OnDataLinkUpdated;
  end;
end;

function TSimMgr_Client.FindNearestDetectedTrack(const px, py: double;
  const maxDist: integer): TSimObject;
var
  pi : TT3DetectedTrack;
  rr: integer;
  m, r: double;
  i, ctx, cty: integer;
  ptx, pty: integer;
begin
  Converter.ConvertToScreen(px, py, ctx, cty);
  m := 1000000.0;
  result := nil;

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    pi := TT3DetectedTrack(SimDetectedTrackList.getObject(i));

    if not Assigned(pi.TrackObject) then
      continue;

    if pi.TrackObject is TT3Sensor then
      Continue;

    if pi.FreeMe then
      continue;

    Converter.ConvertToScreen(pi.getPositionX, pi.getPositionY, ptx, pty);
    try
      rr := sqr(ptx - ctx) + sqr(pty - cty);
      if rr = 0 then
        r := 10000
      else
        r := Sqrt(Abs(rr));
    except
      r := 10000;
    end;

    if (r < m) and (r < maxDist) then
    begin
      result := pi;

      break;
    end;
  end;
end;

function TSimMgr_Client.FindNearestBOLWaypointTrack(const px, py: double;
  const maxDist: integer): TSimObject;
var
  pi : TPointVehicleMissileBOLW;
  rr: integer;
  m, r: double;
  i, ctx, cty: integer;
  ptx, pty: integer;
begin
  Converter.ConvertToScreen(px, py, ctx, cty);
  m := 1000000.0;
  result := nil;

  for i := 0 to SimPointBOLW_VehicleMissile.itemCount - 1 do
  begin
    pi := TPointVehicleMissileBOLW(SimPointBOLW_VehicleMissile.getObject(i));

    if pi.FreeMe then
      continue;

    Converter.ConvertToScreen(pi.PointBOLW_X1, pi.PointBOLW_Y1, ptx, pty);

    try
      rr := sqr(ptx - ctx) + sqr(pty - cty);
      if rr = 0 then
        r := 10000
      else
        r := Sqrt(Abs(rr));
    except
      r := 10000;
    end;

    if (r < m) and (r < maxDist) then
    begin
      // m := r;
      // found := true;
      result := pi;
      break;
    end;
  end;
end;

function TSimMgr_Client.FindNearestRBLWaypointTrack(const px, py: double;
  const maxDist: integer): TSimObject;
var
  pi : TPointVehicleMissileRBLW;
  rr: integer;
  m, r: double;
  i, ctx, cty: integer;
  ptx, pty: integer;
begin
  Converter.ConvertToScreen(px, py, ctx, cty);
  m := 1000000.0;
  result := nil;

  for i := 0 to SimPointRBLW_VehicleMissile.itemCount - 1 do
  begin
    pi := TPointVehicleMissileRBLW(SimPointRBLW_VehicleMissile.getObject(i));

    if pi.FreeMe then
      continue;

    // Converter.ConvertToScreen(pi.getPositionX, pi.getPositionY, ptx, pty);
    Converter.ConvertToScreen(pi.PointRBLW_X1, pi.PointRBLW_Y1, ptx, pty);

    try
      rr := sqr(ptx - ctx) + sqr(pty - cty);
      if rr = 0 then
        r := 10000
      else
        r := Sqrt(Abs(rr));
    except
      r := 10000;
    end;

    if (r < m) and (r < maxDist) then
    begin
      // m := r;
      // found := true;
      result := pi;
      break;
    end;
  end;

end;

procedure TSimMgr_Client.FinishReadyingTime(const r: TRecCmd_Embark_Landing);
begin
  inherited;
end;

procedure TSimMgr_Client.FNetworkThreadVBS_OnPaused(const dt: double);
begin
  inherited;
end;

procedure TSimMgr_Client.FNetworkThreadVBS_OnRunning(const dt: double);
begin
  inherited;
  if Assigned(VNetClient) then
    VNetClient.getPacketVBS;
end;

procedure TSimMgr_Client.FNetworkThread_OnPaused(const dt: double);
begin
  inherited;
//x
end;

procedure TSimMgr_Client.FNetworkThread_OnRunning(const dt: double);
begin
  inherited;
  if Assigned(VNetClient) then
    VNetClient.getPacket;
end;

function TSimMgr_Client.FindESMByDetectedTrack(const number: String;
  aTrack: TSimObject): TT3EsmTrack;
var
  aESM: TT3EsmTrack;
  aDetected: TT3DetectedTrack;
  i : Integer;
begin
  result := nil;

  if Assigned(aTrack) and (aTrack is TT3DetectedTrack) then
  begin
    aDetected := TT3DetectedTrack(aTrack);

    if aDetected.ESMTracks.Count > 0 then
    begin
      for i := 0 to aDetected.ESMTracks.Count - 1 do
      begin
        aESM := aDetected.ESMTracks.Items[i];
        if (aESM.TrackNumber = number) then
          result := aESM;
      end;
    end;
  end;
end;

function TSimMgr_Client.FindESMByTrackNumber(const number: String): TT3EsmTrack;
var
  aESM: TT3EsmTrack;
  aDetected: TT3DetectedTrack;
  i, J: integer;
begin
  result := nil;

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    aDetected := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;
    if aDetected.ESMTracks.Count > 0 then
    begin
      for J := 0 to aDetected.ESMTracks.Count - 1 do
      begin
        aESM := aDetected.ESMTracks.Items[J];
        if (aESM.TrackNumber = number) then
          result := aESM;
      end;
    end;
  end;
end;

function TSimMgr_Client.FindMark(const LookingFor: string;
  var Mark: string): Boolean;
begin
  if LookingFor = 'Area_' then
    Mark := '\X1_'
  else if LookingFor = 'X1_' then
    Mark := '\Y1_'
  else if LookingFor = 'X2_' then
    Mark := '\Y2_'
  else if LookingFor = 'Y1_' then
    Mark := '\X2_'
  else if LookingFor = 'Y2_' then
    Mark := '\InZoom_'
  else if LookingFor = 'InZoom_' then
    Mark := '\OutZoom_'
  else
    Mark := '#';
end;

function TSimMgr_Client.GetBiggestTrackNumber: integer;
var
  i, temp: integer;
  track: TT3DetectedTrack;
begin
  temp := 0;
  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    track := TT3DetectedTrack(SimDetectedTrackList.getObject(i));
    if track.TrackNumber > temp then
    begin
      temp := track.TrackNumber;
    end;
  end;
  result := temp;
end;

procedure TSimMgr_Client.LoadScenarioID(const vSet: TGameDataSetting);
var
  i, j, k, l, GrpID: Integer;
  aObject: TT3PlatformInstance;
  vObj: TT3Vehicle;
  fGeo,
  S: string;
  f: Boolean;
  grp: T3CubicleGroup;
  gm: T3CubicleGroupMember;
  sensor: TT3Sensor;
  PlottingTemplate, tempPlotting : TMainPlottingTemplate;
  plotshape : TMainPlottingShape;
  shape : TShape_Definition;
  ptIdx : Integer;
  plotforce : Integer;
  flagPlotting : Boolean;
  fileName: string;
  areaName: string;

  baseTemp : TPlatformBase;
  overlayTemp : TMainOverlayTemplate;
begin
  inherited;

  {$REGION ' Load Cubicle Assign '}
  CubAssignList := FScenario.CubiclesGroupsListFromDB;

  f := False;

  if FIsInstructor or FIsWasdal then
  begin
    for i := 0 to SimPlatforms.itemCount - 1 do
    begin
      aObject := TT3PlatformInstance(SimPlatforms.getObject(i));
      aObject.UnitGroup := True;
      aObject.Enable := True;
      aObject.Visible := True;
      aObject.isInstructor := FIsInstructor;
      aObject.isWasdal := FIsWasdal;
      aObject.Environment := GameEnvironment;

      if aObject is TT3Vehicle then
      begin
        for l := 0 to TT3Vehicle(aObject).Devices.Count - 1 do
        begin
          sensor := TT3Vehicle(aObject).Devices[l];

          if Assigned(sensor) then
          begin
            sensor.Environment := GameEnvironment;
            sensor.GameDefaults := GameDefaults;
          end;
        end;

        vObj := aObject as TT3Vehicle;
        vObj.TrackLabel := vObj.Track_ID;
        vObj.IsGroupLeader := false;
        vObj.LoadPlatformSymbol;

        if (not f) and (aObject.Parent = nil) then
        begin
          ControlledPlatform := aObject;
          f := True;
        end;

        TT3Vehicle(aObject).OnReadyLanding := OnVehicleReadyLanding;
      end;
    end;

    MyForceDesignation := -1;
    FMyCubGroup := CubAssignList.GetGroupByID(3) as T3CubicleGroup; //choco : controller harus punya FMyCubGroup
  end
  else
  begin
    // Cubicle
    // Group yg di assign cuma satu;
    k := length(vCubicalAssignSetting.GroupIDs);

    // set nilai default
    for i := 0 to SimPlatforms.itemCount - 1 do
    begin
      aObject := TT3PlatformInstance(SimPlatforms.getObject(i));
      aObject.UnitGroup := False;
      aObject.Enable := False;
      aObject.Visible := False;
    end;

    if k > 0 then
    begin
      GrpID := vCubicalAssignSetting.GroupIDs[0];
      FMyCubGroup := CubAssignList.GetGroupByID(GrpID) as T3CubicleGroup;

      for i := 0 to length(vCubicalAssignSetting.GroupIDs) - 1 do
      begin
        GrpID := vCubicalAssignSetting.GroupIDs[i];
        grp := CubAssignList.GetGroupByID(GrpID) as T3CubicleGroup;
        f := false;

        if grp = nil then
          Exit;

        if grp.Count = 0 then
         MyForceDesignation := grp.FData.Force_Designation;

        for J := 0 to grp.Count - 1 do
        begin
          gm := grp.Items[J] as T3CubicleGroupMember;
          if gm <> nil then begin
            aObject := FindT3PlatformByID(gm.FData.Platform_Instance_Index);
          end
          else begin
            aObject := nil;
          end;

          if aObject <> nil then
          begin
            aObject.UnitGroup := True;
            aObject.Enable := True;
            aObject.Visible := True;
            aObject.Environment := GameEnvironment;

            if aObject is TT3Vehicle then
            begin
              for l := 0 to TT3Vehicle(aObject).Devices.Count - 1 do
              begin
                sensor := TT3Vehicle(aObject).Devices[l];

                if Assigned(sensor) then
                begin
                  sensor.Environment := GameEnvironment;
                  sensor.GameDefaults := GameDefaults;
                end;
              end;

              vObj := aObject as TT3Vehicle;
              vObj.TrackNumber := grp.GetTrackNumber(vObj.InstanceIndex);
              vObj.TrackLabel := FormatTrackNumber(vObj.TrackNumber);

              vObj.TrackDomain := vObj.PlatformDomain;
              vObj.TrackIdent := piFriend;

              if vObj.VehicleDefinition.FData.Platform_Domain <> vhdLand then
                vObj.IsOwnShip := True;

              if (not f) and (aObject.Parent = nil) then
              begin
                ControlledPlatform := aObject;
                vObj := aObject as TT3Vehicle;

                if vObj.VehicleDefinition.FData.Platform_Domain <> vhdLand then
                  vObj.IsGroupLeader := True; //halu

                f := True;
                MyForceDesignation := ControlledPlatform.Force_Designation;
              end;
            end;
          end;
        end;
      end;
    end
    else
    begin
      FMyCubGroup := nil;

      // no group assigned to this cubicle!
      // Application terminate!
    end;
  end;
  {$ENDREGION}

  {$REGION ' Load Communication '}
  Scenario.LoadCommunicationFromDB(vSet.ScenarioID);
  {$ENDREGION}

  {$REGION ' Load Game Area '}
  S := UpperCase(Trim(GameEnvironment.FGameArea.Detail_Map));

  areaName := GameEnvironment.FGameArea.Game_Area_Identifier;
  fGeo := vMapSetting.MapGSTGame + '\' + areaName + '\' + areaName + '.gst';

  if Assigned(OnLogStr) then
  begin
    OnLogStr('LoadScenarioID', 'Load Peta');
    OnLogStr('LoadScenarioID', fGeo);
  end;

  if FileExists(fGeo) then
  begin
    try
      VSimMap.LoadMap(fGeo);

      if Assigned(ControlledPlatform) then
        VSimMap.FMap.ZoomTo(50, ControlledPlatform.getPositionX,
          ControlledPlatform.getPositionY)
      else
        VSimMap.FMap.ZoomTo(50, VSimMap.FMap.CenterX, VSimMap.FMap.CenterY);
    except
      on e : Exception do begin
        if Assigned(OnLogStr) then
        begin
          OnLogStr('LoadScenarioID', E.ClassName+' error raised, with message : '+E.Message);
        end;
        //ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;
    end;
  end;
  {$ENDREGION}

  RemainingDay := FScenario.ResourceAllocation.FData.D_Day;

  {$REGION ' Load BaseListFromDB ke SimBase Container '}
  {Load pangkalan}
  if (FScenario.BaseListFromDB.Count > 0) then
  begin
    for I := 0 to FScenario.BaseListFromDB.Count - 1 do
    begin
      baseTemp := TPlatformBase(FScenario.BaseListFromDB.Items[i]);
      SimPlatformBase.AddBase(baseTemp);
    end;
  end;
  {$ENDREGION}

  {$REGION ' Load OverlayListFromDB ke SimOverlay Container '}
  if (FScenario.OverlayListFromDB.Count > 0) then
  begin
    for i := 0 to FScenario.OverlayListFromDB.Count - 1 do
    begin
      overlayTemp := TMainOverlayTemplate.Create;

      overlayTemp.OverlayIndex := GetSerialOverlayID;
      overlayTemp.Name := TResource_Allocation(FScenario.OverlayListFromDB[I]).FOverlay.Overlay_Filename;
      overlayTemp.Tipe := TResource_Allocation(FScenario.OverlayListFromDB[I]).FOverlay.Static_Overlay;
      overlayTemp.Domain := TResource_Allocation(FScenario.OverlayListFromDB[I]).FOverlay.Domain;
      overlayTemp.Cubicle := 0;
      overlayTemp.force := TResource_Allocation(FScenario.OverlayListFromDB[I]).FOverlay.Force;
      overlayTemp.role := 1;

      SimOverlayTemplate.AddOverlayTemplate(overlayTemp);

      fileName := vMapSetting.OverlayPath + overlayTemp.Name + '.dat';
      {Load Shape}
      LoadShape(fileName, overlayTemp.Tipe, overlayTemp);
    end;
  end;
  {$ENDREGION}

  {$REGION ' Load PlottingListFromDB ke SimPlotting Container '}
  if (FScenario.PlottingListFromDB.Count > 0) then
  begin
    for I := 0 to FScenario.PlottingListFromDB.Count - 1 do
    begin
      ptIdx := TResource_Allocation(FScenario.PlottingListFromDB[I]).FPlotting.Plotting_Index;
      plotforce := TResource_Allocation(FScenario.PlottingListFromDB[I]).FPlotting.Force;

      PlottingTemplate := TMainPlottingTemplate.create(Converter);
      PlottingTemplate.Name := TResource_Allocation(FScenario.PlottingListFromDB[I]).FPlotting.Plotting_Name;
      PlottingTemplate.Tipe := TResource_Allocation(FScenario.PlottingListFromDB[I]).FPlotting.Plotting_Type;
      PlottingTemplate.Day := TResource_Allocation(FScenario.PlottingListFromDB[I]).FPlotting.Date;

      if (TResource_Allocation(FScenario.PlottingListFromDB[I]).FPlotting.Plotting_Group = 1) then
      begin
        PlottingTemplate.Group := 'Red';
      end
      else if (TResource_Allocation(FScenario.PlottingListFromDB[I]).FPlotting.Plotting_Group = 3) then
      begin
        PlottingTemplate.Group := 'Blue';
      end;

      PlottingTemplate.Cubicle := 0;
      flagPlotting := false;

      if (not ISInstructor) and (not ISWasdal) then
      begin
        if FMyCubGroup.FData.Force_Designation <> plotforce  then
          flagPlotting := true;
      end
      else
      begin
        for j := 0 to SimPlotting.FList.Count - 1 do
        begin
          tempPlotting := SimPlotting.FList.Items[j];
          if PlottingTemplate.Name <> tempPlotting.Name then
          begin
            flagPlotting:= False;
            Break;
          end;
        end;
      end;

      if (not flagPlotting) then
      begin
        fileName := vMapSetting.PlottingPath + PlottingTemplate.Name + '.dat';

        {Load Shape}
        LoadPlot(PlottingTemplate.Name, fileName, PlottingTemplate.Tipe, PlottingTemplate);
        for k := 0 to SimPlotting.FList.Count - 1 do
        begin
          plotshape := SimPlotting.FList.Items[k];
          if (plotshape.Name = TResource_Allocation(FScenario.PlottingListFromDB[I]).FPlotting.Plotting_Name) and
          (plotshape.Tipe =TResource_Allocation(FScenario.PlottingListFromDB[I]).FPlotting.Plotting_Type) then
          begin
            plotshape.Force := TResource_Allocation(FScenario.PlottingListFromDB[I]).FPlotting.Plotting_Group;
            plotshape.Time := TResource_Allocation(FScenario.PlottingListFromDB[I]).FPlotting.Date;
            plotshape.Group := 'Controller';
          end;
        end;
      end;
    end;
  end;
  {$ENDREGION}

  DrawGameCenter.postCenter.X := GameEnvironment.FGameArea.Game_Centre_Long;
  DrawGameCenter.postCenter.Y := GameEnvironment.FGameArea.Game_Centre_Lat;
end;

procedure TSimMgr_Client.LoadShape(fFile: String; tipe: Integer; overlay: TMainOverlayTemplate);
var
   Fs : TFileStream;
begin
  if not FileExists(fFile) then
    exit;

  try
    Fs := TFileStream.Create(fFile, fmOPENREAD );
    case tipe of
      osDynamic : SimOverlayTemplate.ShowStreamDataDynamic(Fs, overlay);
      osStatic  : SimOverlayTemplate.ShowStreamDataStatic(Fs, overlay);
    end;
  except
    Showmessage('Can''t load file overlay!' + #13);
  end;

  Fs.Free;
end;

procedure TSimMgr_Client.LoadPlot(aName : string ; fFile: String; tipe: Integer;
  plotting: TMainPlottingTemplate);
var
   Fs : TFileStream;
begin
  if not FileExists(fFile) then
    exit;

  try
    Fs := TFileStream.Create(fFile, fmOPENREAD );
    SimPlotting.ShowStreamData(aName, Fs, plotting);
  except
    Showmessage('Can''t load file Plotting!' + #13);
  end;

  Fs.Free;
end;

procedure TSimMgr_Client.LoadPredefinedPattern;
var
  i, j : Integer;
  aObject: TT3PlatformInstance;
  pLong, pLatt : Double;
  Behav: TScripted_Behav_Definition;
  WpEvent, ObjEvent, dev : TObject;

  A : TStringList;
  myString : string;
  directoryFile: string;
  myFile : TextFile;
  pX, pY, counter : Integer;
begin
  //load pattern  (platform activation)
  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    aObject := TT3PlatformInstance(SimPlatforms.getObject(i));

    if aObject is TT3Vehicle then
    begin
      if TT3Vehicle(aObject).PatternName <> '' then
      begin

        A := TStringList.Create;
        try
        begin
          directoryFile := vMapSetting.PatternPath + TT3Vehicle(aObject).PatternName + '.dat';
          if FileExists(directoryFile) then
          begin
            AssignFile(myFile, directoryFile);
            FileMode := fmOpenRead;
            reset(myFile);
            counter := 0;
            //seek(myfile,i);
            while not Eof(myFile) do
            begin
              Readln(myFile, myString);
              Split(',', myString, A) ;
              pX := strtoint(A[0]);
              pY := strtoint(A[1]);

              if Assigned(Converter) then
              begin
                if Converter.FMap.Geoset <> '' then
                begin
                  Converter.ConvertToMap(pX,pY,pLong,pLatt);

                  behav := TScripted_Behav_Definition.Create;
                  with behav.FData do
                  begin
                    Scripted_Event_Index  := counter;
                    Waypoint_Latitude     := pLatt;
                    Waypoint_Longitude    := pLong;
                    Speed                 := Round(TT3Vehicle(aObject).Speed);
                  end;

                  //FFocusedBehav := Behav;
                  TT3Vehicle(aObject).Waypoints.Add(Behav, nil);
                  TT3Vehicle(aObject).Waypoints.Enabled := True;

                  //Add Waypoint Event
                  with TT3Vehicle(aObject) do
                  begin

                    for j := 0 to SimDevices.itemCount - 1 do begin
                      dev :=  SimDevices.getObject(j);
                      if TT3Unit(dev).Parent <> TT3Vehicle(aObject) then continue;

                      // radar
                      if dev is TT3Radar then begin
                        objEvent  := TScripted_Radar_Event.Create;
                        with TScripted_Radar_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index := counter;
                          Radar_Index          := TT3Radar(dev).InstanceIndex;
                          Radar_Control        := 0; // off
                        end;

                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetRadar;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3Radar(dev).InstanceIndex;

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end else
                      // sonar
                      if dev is TT3Sonar then begin
                        objEvent  := TScripted_Sonar_Event.Create;
                        with TScripted_Sonar_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index := counter;
                          Sonar_Index          := TT3Sonar(dev).InstanceIndex;
                          Sonar_Control        := 0; // off
                        end;

                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetSonar;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3Sonar(dev).InstanceIndex;

                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end else
                      // iff
                      if dev is TT3IFFSensor then begin
                        objEvent  := TScripted_IFF_Event.Create;
                        with TScripted_IFF_Event(objEvent).FData do
                        begin
                          Scripted_Event_Index   := counter;
                          IFF_Instance_Index     := TT3IFFSensor(dev).InstanceIndex;

                          IFF_Interrogator_Control  := 0; // off
                          IFF_Transponder_Control   := 0; // off
                        end;

                        // wp event untuk transpondernya
                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetIFFTransponder;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3IFFSensor(dev).InstanceIndex;
                        Waypoints.Add(behav,TWaypointEventClass(wpevent));

                        // wp event untuk interogatornya
                        wpevent   := TWaypointEventClass.Create;
                        TWaypointEventClass(wpevent).FType := wetIFFInterogator;
                        TWaypointEventClass(wpevent).FData := objEvent;
                        TWaypointEventClass(wpevent).FEnable := false;
                        TWaypointEventClass(wpevent).FObjectInstanceIndex := TT3IFFSensor(dev).InstanceIndex;
                        Waypoints.Add(behav,TWaypointEventClass(wpevent));
                      end;
                    end;

                    //Check Weapon
                    //5 Weapon / 1 Coordinat Wayoint
                    for j := 1 to 5 do
                    begin
                      objEvent := TScripted_Weapon_Event.Create;
                      with TScripted_Weapon_Event(objEvent).FData do
                      begin
                        Scripted_Event_Index := counter;
                        List_Index           := -1;
                        Salvo_Size           := 0;
                        Target_Index         := 0;
                        Weapon_Type          := 0;
                      end;

                      wpevent   := TWaypointEventClass.Create;

                      case j of
                        1 : TWaypointEventClass(wpevent).FType := wetWeapon1;
                        2 : TWaypointEventClass(wpevent).FType := wetWeapon2;
                        3 : TWaypointEventClass(wpevent).FType := wetWeapon3;
                        4 : TWaypointEventClass(wpevent).FType := wetWeapon4;
                        5 : TWaypointEventClass(wpevent).FType := wetWeapon5;
                      end;

                      TWaypointEventClass(wpevent).FData := objEvent;
                      TWaypointEventClass(wpevent).FEnable := false;
                      TWaypointEventClass(wpevent).FObjectInstanceIndex := 0;
                      Waypoints.Add(behav,TWaypointEventClass(wpevent));
                    end;
                  end;
                end;
              end;

              inc(counter);
            end;
            CloseFile(myFile);
          end;
        end;
        finally
        A.Free;
        end;
      end;
    end;
  end;
end;


procedure TSimMgr_Client.Split (const Delimiter: Char; Input: string; const Strings: TStrings) ;
begin
   Assert(Assigned(Strings));
   Strings.Clear;
   Strings.Delimiter     := Delimiter;
   Strings.DelimitedText := Input;
end;

procedure TSimMgr_Client.Log(const strHeader, strBody: string);
begin
  frmLog.LogStr(strHeader, strBody);
end;

procedure TSimMgr_Client.LogEventRecv(recID: integer);
  function formatTrail(Value: integer): string;
  var
    i: integer;
    si, t: string;
  begin
    t := IntToStr(Value);
    si := '';
    for i := 0 to (4 - length(t)) - 1 do
      si := si + '0';
    result := si + t;
  end;

begin
  if Assigned(OnLogEventStr) then
    OnLogEventStr('TSimMgr_Client.LogEventRecv', '<' + formatTrail(recID) + '> ' + getPacketIDname(recID));

end;

procedure TSimMgr_Client.LogNetworkEvent(const Value: String);
begin
//  if Assigned(OnLogEventStr) then
//    OnLogEventStr(Value);
end;

procedure TSimMgr_Client.AssignPlatformInstanceEvent(pi: TT3PlatformInstance);
begin
  inherited;

  if pi is TT3Vehicle then
  begin
    TT3Vehicle(pi).OnUpdateWeapon := EventManager.OnUpdateWeaponVehicle;
  end;

end;

procedure TSimMgr_Client.OnVarianceESM(aESMtrack: TObject; aTrack : TObject);
var
  r: TRecCmd_EsmVariance;
begin
  if not(Assigned(aESMtrack)) or not(Assigned(aTrack)) then
    Exit;

  if not (aESMtrack is TT3ESMTrack) or not(aTrack is TT3DetectedTrack) then
    Exit;

  if Assigned(TT3DetectedTrack(aTrack).TrackObject) then
  begin
    r.DetectedID := TT3DetectedTrack(aTrack).TrackObject.InstanceIndex;

    if Assigned(TT3DetectedTrack(aTrack).TrackObject.Parent) and
      (TT3DetectedTrack(aTrack).TrackObject.Parent is TT3PlatformInstance) then
      r.ParentDetectedID := TT3PlatformInstance(TT3DetectedTrack(aTrack).TrackObject.Parent).InstanceIndex
    else
      r.ParentDetectedID := 0;
  end
  else begin
    r.DetectedID := 0;
    r.ParentDetectedID := 0;
  end;

  if (Assigned(TT3ESMTrack(aESMtrack).DetectBy)) and
     (TT3ESMTrack(aESMtrack).DetectBy is TT3ESMSensor) then
    r.SensorID := TT3ESMSensor(TT3ESMTrack(aESMtrack).DetectBy).InstanceIndex
  else
    r.SensorID := 0;

  r.EsmTrackNumber := StrToInt(TT3ESMTrack(aESMtrack).TrackNumber);
  r.nVariance := TT3ESMTrack(aESMtrack).Variance;

  simMgrClient.netSend_Synch_ESMvarian(r);
end;

procedure TSimMgr_Client.OnVehicleReadyLanding(sender: TObject);
var
  v: TT3Vehicle;
  r: TRecCmd_Embark_Landing;
begin
  if not ISInstructor or not ISWasdal then
    Exit;

  if sender is TT3Vehicle then
  begin
    v := sender as TT3Vehicle;
    if Assigned(v.BaseVehicle) then
    begin
      r.SessionID := SessionID;
      r.ParentPlatformID := v.BaseVehicle.InstanceIndex;
      r.EmbarkPlatformID := v.InstanceIndex;
      r.OrderID := CORD_SET_READYING;
      r.IndexEmbark := 0;
      r.IndexLanding := 0;
      r.InitSpeed := v.Speed;

      if v.PlatformDomain = vhdAmphibious then
      begin
       r.InitCourse := v.Course + 180;
       if r.InitCourse > 360 then
        r.InitCourse := r.InitCourse - 360;
      end
      else
       r.InitCourse := v.Course;

      r.InitAltitude := v.Altitude;

//      r.SessionID := SessionID;
//      r.ParentPlatformID := v.BaseVehicle.InstanceIndex;
//      r.EmbarkPlatformID := v.InstanceIndex;
//      r.InitSpeed := v.Mover.Speed;
//      r.InitCourse := v.Mover.Direction;
//      r.InitAltitude := v.Altitude;

      netSend_Cmd_Embark_Land(r);
    end;
  end;
end;

procedure TSimMgr_Client.GameTerminate;
begin
  TT3ClientEventManager(EventManager).OnTerminateOverlay;

  inherited;
end;

procedure TSimMgr_Client.FGameThread_OnRunning(const dt: double);
begin

  if not FIsInstructor or not FIsWasdal then
  begin
    // CheckAllSensorProses(dt);

    SimDetectedTrackList.CleanUpObject;
    SimDetectedTrackList.Validate;

    SimDetectedTrackList.Moves(dt);
  end;

  inherited;

end;

procedure TSimMgr_Client.FGotoThread_OnRunning(const dt: double);
var
  prog : integer;
begin

  FIsGotoMode := True;

  inherited;

  if FElapseTimeToGo = 0 then
  begin
    {
      since v0.2 of FGotoThread_OnRunning applied, update progress to 99 only,
      wait for event finish goto received
    }
    if Assigned(FOnUpdateGotoProgress) then
      FOnUpdateGotoProgress(99);

  end else
  {
    since v0.2 of FGotoThread_OnRunning applied, this codes never called,
    because FElapseTimeTogo always 0 at parent procedure
  }
  begin
    prog := Round( ( ( FTimeElapse - FElapseTimeToGo ) / FTimeElapse ) * 100 );

    if Assigned(FOnUpdateGotoProgress) then
      FOnUpdateGotoProgress(prog);

  end;

end;

function TSimMgr_Client.findDetectedTrack(id: Integer): TSimObject;
var
  i : integer;
  f : Boolean;
  obj : TSimObject;
begin
  Result := nil;

  i := 0;
  f := False;
  obj := nil;

  while not f and (i < SimDetectedTrackList.itemCount) do
  begin
    obj := SimDetectedTrackList.getObject(i);

    f := TT3DetectedTrack(obj).TrackObject.InstanceIndex = id;
    inc(i)
  end;

  if f then
    Result := obj;
end;

procedure TSimMgr_Client.FGameThread_OnPaused(const dt: double);
begin
//  if not Assigned(VNetClient) then
//    Exit;

//    VNetClient.getPacket;
  // VSimMap.DrawMap;
end;

// ------------------------------------------------------------------
procedure TSimMgr_Client.FUpdateThread_OnRunning(const dt: double);
var
  t: TDateTime;
  hh, mm, ss, zz: word;
begin // 250 ms

  if not FIsGotoMode then
    VSimMap.DrawMap;

  t := FMainVTime.GetTime;
  DecodeTime(t, hh, mm, ss, zz);

  if ss <> FLastSecond then
  begin
    if Assigned(FOnUpdateTime) then
      FOnUpdateTime(self);
  end;

  //VNetClient.getPacket;
  FUpdateDelay.Run(dt);
  FUpdateCenterDelay.Run(dt);
  FConnectDelay.Run(dt);
  //FUpdateDataLink.Run(dt);
  FUpdateForMessagehandling.Run(dt);
end;

procedure TSimMgr_Client.FUpdateThread_OnPaused(const dt: double);
begin
  if not FIsGotoMode then
    VSimMap.DrawMap;

  FConnectDelay.Run(dt);

  FUpdateDelay.Run(dt);

  if Assigned(FOnUpdateTime) then
    FOnUpdateTime(self);
end;

procedure TSimMgr_Client.FUpdateThread_OnTerminate(sender: TObject);
begin

end;
// ------------------------------------------------------------------

procedure TSimMgr_Client.FOnUpdateDelay(sender: TObject);
begin
  if Assigned(FOnUpdateForm) then
    FOnUpdateForm(self);
end;

procedure TSimMgr_Client.FOnUpdateMessageHandling(Sender: TObject);
var
  i : integer;
  QueueMessage : TMessageHandling;
  RecSend : TRecSendMessage;
begin
  for i := ListQueueMessage.Count - 1 downto 0 do
  begin
    QueueMessage := TMessageHandling(ListQueueMessage.Items[i]);
    QueueMessage.TimeWait := QueueMessage.TimeWait - 1;

    if (QueueMessage.TimeWait <= 0) then
    begin
      //Ready to Send -> then delete from Queue
      RecSend := QueueMessage.FData;
      netSend_MessageHandling(RecSend);

      if Assigned(FOnUpdateMessage) then
        FOnUpdateMessage(RecSend);

      ListQueueMessage.Delete(i);
    end;
    Sleep(10);
  end;
end;

procedure TSimMgr_Client.FOnConnectDelay(sender: TObject);
begin
  VNetClient.TryReconnect; // tcp only.
end;

procedure TSimMgr_Client.FOnUpdateCenterDelay(sender: TObject);
begin
  if Assigned(FOnUpdateCenter) then
    FOnUpdateCenter(self);
end;

procedure TSimMgr_Client.netRecv_PlatformMovement(apRec: PAnsiChar;
  aSize: word);
var
  rec: ^TRecUDP_PlatformMovement;
  pi: TT3PlatformInstance;
begin
  rec := @apRec^;
  LogEventRecv(rec^.pid.recID);
  if rec^.SessionID <> FSessionID then
    Exit;

  pi := FindT3PlatformByID(rec^.PlatformID);

  // jika tidak ditemukan di SimPlatform di cari di NonRealPlatform
  if not Assigned(pi) then
    pi := FindNonRealPlatformByID(rec^.PlatformID);

  if pi <> nil then
    pi.SetMovementData(rec^);
end;

procedure TSimMgr_Client.netRecv_PlatformMovementArray(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRec_PlatformMovement;
  pi: TT3PlatformInstance;
  i : Integer;
begin
  rec := @apRec^;
  LogEventRecv(rec^.pid.recID);

  for i := Low(rec^.Data) to High(rec^.Data) do begin
    if rec^.Data[i].SessionID <> FSessionID then
      Exit;

    pi := FindT3PlatformByID(rec^.Data[i].PlatformID);

    // jika tidak ditemukan di SimPlatform di cari di NonRealPlatform
    if not Assigned(pi) then
      pi := FindNonRealPlatformByID(rec^.Data[i].PlatformID);

    if pi <> nil then
      pi.SetMovementData(rec^.Data[i]);
  end;
end;

procedure TSimMgr_Client.netRecv_PlatformReposition(apRec: PAnsiChar;
  aSize: word);
var
  rec: ^TRecCmd_Platform_MOVE;
  pi: TT3PlatformInstance;
begin
  rec := @apRec^;
  LogEventRecv(rec^.pid.recID);
  if rec^.SessionID <> FSessionID then
    Exit;

  pi := FindT3PlatformByID(rec^.PlatfomID);
  // jika tidak ditemukan di SimPlatform di cari di NonRealPlatform
  if not Assigned(pi) then
    pi := FindNonRealPlatformByID(rec^.PlatfomID);

  if (pi <> nil) then
  begin
    if pi is TT3PlatformInstance then
    begin
      pi.RepositionTo(rec^.x, rec^.y);
      VSimMap.DrawMap;
    end
    else
    begin
      if (ISInstructor and (rec^.GroupID = 0)) or
         (ISWasdal and (rec^.GroupID = 0)) then
      begin
        pi.RepositionTo(rec^.x, rec^.y);
        VSimMap.DrawMap;
      end
      else if Assigned(FMyCubGroup) then
      begin
        if FMyCubGroup.FData.Group_Index = rec^.GroupID then
        begin
          pi.RepositionTo(rec^.x, rec^.y);
          VSimMap.DrawMap;
        end;
      end;
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_PlatformTrackNumber(apRec: PAnsiChar;
  aSize: word);
begin
//x
end;

procedure TSimMgr_Client.netRecv_PlatformFreeMe(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecPlatformFreeMe;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

//  if Assigned(OnLogTemporary) then
//    OnLogTemporary('Receive FreeMe : ' + IntToStr(aRec^.PlatformID) +
//                   ', State FreeMe : ' + BoolToStr(aRec^.FreeMe));

  FreePlatform(aRec^);
end;

procedure TSimMgr_Client.netRecv_PlatformGroupChange(apRec: PAnsiChar;
  aSize: word);
var
  OldFound, NewFound : Boolean;
  i : Integer;
  grp, OldGroup, NewGroup : T3CubicleGroup;
  SelectedMember  : TPlatform_Instance;
  SelectedMembera  : TT3PlatformInstance;
  ve : TT3Vehicle;
  rec : ^TRecPlatformGroupChange;
begin
  rec := @apRec^;

  if rec^.SessionID <> FSessionID then
    Exit;

  LogEventRecv(rec^.pid.recID);

  if not Assigned(FMyCubGroup) then
    Exit;

  ChangePlatformGroup(rec^, ve, OldGroup, NewGroup);

  if Assigned(OldGroup) and Assigned(NewGroup) then
  begin
    if Assigned(ve) then
    begin
      if ISInstructor or ISWasdal then
      begin
        ve.UnitGroup := True;
        ve.Enable := True;
        ve.TrackLabel := ve.Track_ID;
        ve.LoadPlatformSymbol;
      end
      else
      begin
        ve.UnitGroup := (NewGroup.FData.Group_Index = FMyCubGroup.FData.Group_Index);
        ve.Enable := ve.UnitGroup;

        if Assigned(NewGroup) then
        begin
          OldGroup.RemoveTrackNumber(ve.InstanceIndex);
          ve.TrackNumber := FMyCubGroup.GetTrackNumber(ve.InstanceIndex);
        end
        else
          ve.TrackNumber := 9999;

        ve.TrackLabel := FormatTrackNumber(ve.TrackNumber);
        ve.TrackDomain := ve.PlatformDomain;
        ve.TrackIdent := piFriend;
      end;

      if (OldGroup.FData.Group_Index = FMyCubGroup.FData.Group_Index) or (NewGroup.FData.Group_Index = FMyCubGroup.FData.Group_Index) then
        SimDetectedTrackList.ClearAndRemove;

      EventManager.OnUpdateTacticalTote;

      if IsController then
        EventManager.OnUpdateTvCubicleGroup;
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_PlatformHancurin(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecPlatformHancur;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  EventManager.OnPlatformHancurin(aRec^.SenderID, aRec^.Target, aRec^.reasondestroy);
end;

procedure TSimMgr_Client.netRecv_PlatformHitPlatform(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecPlatformHitPlatform;
  Sender, Target : TT3PlatformInstance;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  if (aRec^.FreeWeapon) then
  begin
    Sender := FindT3PlatformByID(aRec^.SenderID);
    if Sender = nil then
      Sender := FindWeaponByID(aRec^.SenderID);

    if not Assigned(Sender) then
      Sender := TT3PlatformInstance(FindDeviceByID(aRec^.SenderID));

    Target := FindT3PlatformByID(aRec^.TargetID);

    if Sender is TT3Torpedo then
    begin
      TT3Torpedo(Sender).FreeChilds;
      Sender.FreeMe := True;
      Sender.AbsoluteFree := True;

      if Target is TT3Bomb then
      begin
        TT3Bomb(Target).FreeChilds;
        Target.FreeMe := True;
        Target.AbsoluteFree := True;
      end;
    end
    else if Sender is TT3Bomb then
    begin
      if Sender is TT3Mine then   //mine turunan dari bomb, tapi butuh perlakuan berbeda
      begin
        TT3Mine(Sender).CountMine := TT3Mine(Sender).CountMine - 1;
        if TT3Mine(Sender).CountMine <= 0 then
        begin
          TT3Mine(Sender).FreeChilds;
          Sender.FreeMe := True;
          Sender.AbsoluteFree := True;
        end;
      end
      else
      begin
        TT3Bomb(Sender).FreeChilds;
        Sender.FreeMe := True;
        Sender.AbsoluteFree := True;
      end;
    end
    else if Sender is TT3Missile then
    begin
      if Target is TT3Chaff then
      begin
        if TT3Missile(Sender).Definition.ECM_Detonation = 0 then //No Detonate to Chaff
          Exit;

        if TT3Chaff(Target).ChaffCategory = ecgDistraction then
        begin
          TT3Missile(Sender).FreeChilds;
          Sender.FreeMe := True;
          Sender.AbsoluteFree := True;

          TT3Chaff(Target).FreeChilds;
          Target.FreeMe := True;
          Target.AbsoluteFree := True;
        end
        else if TT3Chaff(Target).ChaffCategory = ecgSeduction then
        begin
          TT3Chaff(Target).FreeChilds;
          Target.FreeMe := True;
          Target.AbsoluteFree := True;
        end;
      end
      else if Target is TT3InfraredDecoy then
      begin
        TT3Missile(Sender).FreeChilds;
        Sender.FreeMe := True;
        Sender.AbsoluteFree := True;

        TT3InfraredDecoy(Target).FreeChilds;
        Target.FreeMe := True;
        Target.AbsoluteFree := True;
      end
      else if Target is TT3FloatingDecoy then
      begin
        TT3Missile(Sender).FreeChilds;
        Sender.FreeMe := True;
        Sender.AbsoluteFree := True;

        TT3FloatingDecoy(Target).FreeChilds;
        Target.FreeMe := True;
        Target.AbsoluteFree := True;
      end
      else
      begin
        TT3Missile(Sender).FreeChilds;
        Sender.FreeMe := True;
        Sender.AbsoluteFree := True;
      end;
    end
    else if Sender is TT3GunShoot then
    begin
      TT3GunShoot(Sender).FreeChilds;
      Sender.FreeMe := True;
      Sender.AbsoluteFree := True;

      if Target is TT3Missile then
      begin
        TT3Missile(Target).FreeChilds;
        Target.FreeMe := True;
        Target.AbsoluteFree := True;
      end;
    end
    else if Sender is TT3GunOnVehicle then
    begin
      if Target is TT3Missile then
      begin
        TT3PlatformInstance(Target).reasonDestroy := 21;
        TT3PlatformInstance(Target).UnitMakeDestroy := TT3PlatformInstance(Sender).InstanceName;

        TT3Missile(Target).FreeChilds;
        Target.FreeMe := True;
        Target.AbsoluteFree := True;
      end;
    end;
  end;

  EventManager.OnWeaponHitByServer(aRec^.SenderID, aRec^.TargetID,
    aRec^.lethality, aRec^.Parent);
end;

// ham 04052012
procedure TSimMgr_Client.netRecv_WeaponInOut(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecWeaponOut;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  EventManager.OnWeaponInOut(aRec^.SenderID, aRec^.reasonDestroy);
end;

procedure TSimMgr_Client.NetSendECMCommand(rec: TRecECMCommand);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_ECM, @rec);
end;

procedure TSimMgr_Client.netRecv_Cmd_Embark_Land(apRec: PAnsiChar; aSize: word);
var
 r : ^TRecCmd_Embark_Landing;
begin
  r := @apRec^;

  case r^.OrderID of
    CORD_SET_READYING : inherited;
    CORD_FINISH_READYING :FinishReadyingTime(r^);
  end;
end;

procedure TSimMgr_Client.netRecv_PlatformLandData(apRec: PAnsiChar;
  aSize: word);
var
  rec: ^TRec_MapData;
  pi: TT3PlatformInstance;
begin
  rec := @apRec^;

  if rec^.SessionID <> FSessionID then
    Exit;

  pi := FindT3PlatformByID(rec^.PlatformID);

  if pi = nil then
    Exit;

  with rec^ do
  begin
    pi.LandCheck(IsOnLand, dMin, dMax);

    // set to first position grounded
    if IsOnLand then
    begin
//       if pi is TT3Vehicle then begin
//       if (pi.PlatformDomain = 1) or  (pi.PlatformDomain = 2) then
//       begin
//         pi.setPositionX(rec^.X);
//         pi.setPositionX(rec^.Y);
//         pi.Speed := 0;
//       end
//       else
//       end;
    end
    else
    begin
//      IsLandPersonel := True
      pi.DepthCheck(dAvail, dMin, dMax);
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_GameTime(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecUDP_GameTime;
begin // broadcast synchronize buat Game time Viewer;
  rec := @apRec^;

  if rec^.SessionID <> FSessionID then
    Exit;

  FMainVTime.SetMilliSecond(rec^.GameMS);
end;

{procedure TSimMgr_Client.netRecv_GunSplash(apRec: PAnsiChar; aSize: Word);
var
  rSplash : ^TRecSplashCannon;
  pi : TT3PlatformInstance;
  _2dPoint : t2DPoint;
  xOffset, yOffset : Double;
begin
  rSplash := @apRec^;

  pi := FindT3PlatformByID(rSplash.ShipID);

  if not Assigned(pi) then
    Exit;

  xOffset := 114.03935544;
  yOffset := -7.60488823;

  with TT3Vehicle(pi).GunSplash do
  begin
    _2dPoint.X := rSplash.PosX + xOffset;
    _2dPoint.Y := rSplash.PosY + yOffset;
    SplashPoint := _2dPoint;
    Visible := True;
  end;
end;}

procedure TSimMgr_Client.netRecv_LastUpdatePlatform(apRec: PAnsiChar;
  aSize: word);
var
  rec : ^TRecCmd_LastUpdatePlatform;
  pi : TT3PlatformInstance;
  nrp : TT3NonRealVehicle;
begin
  rec := @apRec^;

  pi := FindNonRealPlatformByID(rec^.PlatfomID);
  if pi is TT3NonRealVehicle then
  begin
    nrp := TT3NonRealVehicle(pi);
    nrp.LastUpdate := rec^.UpdateTime;
  end;
end;

procedure TSimMgr_Client.netRecv_LaunchHybrid(apRec: PAnsiChar; aSize: Word);
var
  rec : ^TrecCmd_LaunchHybrid;
  pi : TT3PlatformInstance;
  HybridMissile : TT3HybridMissile;
  Torpedo : TT3Torpedo;
begin
  rec := @apRec^;
  Torpedo := nil;

  pi := FindT3PlatformByID(rec^.WpnID);
  if pi is TT3HybridMissile then
  begin
    HybridMissile := pi as TT3HybridMissile;
    Torpedo :=  TT3Torpedo(CreateTorpedoProjectileHybrid(TT3PlatformInstance(HybridMissile.Owner).InstanceIndex,
      HybridMissile.WeaponOnVehicleID, Rec^.NewID));

    HybridMissile.LoadedTorpedo := nil;
    Torpedo.UnitGroup := HybridMissile.UnitGroup;
    Torpedo.Enable := True;
//    Torpedo.InstanceName := HybridMissile.InstanceName;
//    Torpedo.Launched := rec^.Launched;
//    Torpedo.InstanceIndex := rec^.WpnID;
    Torpedo.Parent := nil;
    if Assigned(OnLogEventStr) then
      OnLogEventStr('TSimMgr_Client.netRecv_LaunchHybrid', 'Receive paket for launch : ' + Torpedo.InstanceName);
  end;

//  Torpedo.Initialize;
//  Torpedo.PosX := HybridMissile.PosX;
//  Torpedo.PosY := HybridMissile.PosY;
//  Torpedo.PosZ := HybridMissile.PosZ;

  if Torpedo <> nil then
  begin
    if FIsInstructor or Torpedo.UnitGroup  or FIsWasdal                                                                                                                                                                                           then
      Torpedo.Visible := True
    else
      Torpedo.Visible := False;
  end;
end;

procedure TSimMgr_Client.NetRecv_MessageHandling(apRec: PAnsiChar; aSize: word);
var
  RecRecv : ^TRecSendMessage;
begin
  RecRecv := @apRec^;
  EventManager.OnReceiveMessageHandling(RecRecv^);
end;

procedure TSimMgr_Client.netRecv_MissileSynchtarget(apRec: PAnsiChar;
  aSize: word);
var
  i: integer;
  pi, tgt: TT3PlatformInstance;
  mis: TT3Missile;

  rec: ^TRecUDP_Synch_Missile;
begin
  rec := @apRec^;

  tgt := FindT3PlatformByID(rec^.TargetPlatformID);
  if tgt = nil then
    Exit;

  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    pi := SimPlatforms.getObject(i) as TT3PlatformInstance;

    if pi is TT3Missile then
    begin
      // begin synch
      mis := TT3Missile(pi);
      if mis.InstanceIndex = rec^.PlatformID then
      begin
        mis.SetTargetObject(tgt);

        if Assigned(mis.OnLogEventStr) then
          mis.OnLogEventStr('TSimMgr_Client.netRecv_MissileSynchtarget', 'Sync For Targeting ' + tgt.InstanceName);
      end;
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_ModifComm(apRec: PAnsiChar; aSize: word);
var
  i : integer;
  rec: ^TRecModifComm;
  ChannelMapping : TChannelMapping;
  recCom : TRecExternal_Communication_Channel;
begin
  rec := @apRec^;
  if rec^.SessionID <> FSessionID then Exit;

  if rec^.ModifStat = mcsAdd then
  begin
    if not ISInstructor or not ISWasdal then
    begin
      if rec^.GroupID <> FMyCubGroup.FData.Group_Index then Exit;
    end;

    for i := 0 to ListComChannel.Count -1 do
    begin
      ChannelMapping := TChannelMapping(ListComChannel.Items[i]);
      if ChannelMapping.GroupID = rec^.GroupID then
      begin
        recCom.Comms_Channel_Index := 0;
        recCom.Resource_Alloc_Index := 0;
        recCom.Channel_Number := Rec^.Channel_Number;
        recCom.Channel_Identifier := Rec^.Channel_Ident;
        recCom.Comms_Band := Rec^.Channel_band;
        recCom.Channel_Freq := Rec^.Channel_Frek;
        if Rec^.Channel_Security then
          recCom.Channel_Security := 1
        else
          recCom.Channel_Security := 0;
        recCom.Channel_Code := Rec^.Channel_Code;

        ChannelMapping.RemoveChannelAvailable(Rec^.Channel_Number);
        ChannelMapping.AddtoChannelMapping(recCom);

        EventManager.OnReceiveModifComm(Rec^);

        Break;
      end;
    end;
  end
  else
  if rec^.ModifStat = mcsRemove then
  begin
    if not ISInstructor or not ISWasdal then
    begin
      if rec^.GroupID <> FMyCubGroup.FData.Group_Index then Exit;
    end;

    for i := 0 to ListComChannel.Count -1 do
    begin
      ChannelMapping := TChannelMapping(ListComChannel.Items[i]);
      if ChannelMapping.GroupID = rec^.GroupID then
      begin
        recCom.Comms_Channel_Index := 0;
        recCom.Resource_Alloc_Index := 0;
        recCom.Channel_Number := Rec^.Channel_Number;
        recCom.Channel_Identifier := Rec^.Channel_Ident;
        recCom.Comms_Band := Rec^.Channel_band;
        recCom.Channel_Freq := Rec^.Channel_Frek;
        if Rec^.Channel_Security then
          recCom.Channel_Security := 1
        else
          recCom.Channel_Security := 0;
        recCom.Channel_Code := Rec^.Channel_Code;

        ChannelMapping.RemoveChannelMapping(Rec^.Channel_Number);
        ChannelMapping.AddtoChannelAvailable(recCom);

        EventManager.OnReceiveModifComm(Rec^);

        Break;
      end;
    end;
  end
  else
  if rec^.ModifStat = mcsCreate then
  begin
    if not ISInstructor or not ISWasdal then exit;

    for i := 0 to ListComChannel.Count -1 do
    begin
      ChannelMapping := TChannelMapping(ListComChannel.Items[i]);

      recCom.Comms_Channel_Index := 0;
      recCom.Resource_Alloc_Index := 0;
      recCom.Channel_Number := Rec^.Channel_Number;
      recCom.Channel_Identifier := Rec^.Channel_Ident;
      recCom.Comms_Band := Rec^.Channel_band;
      recCom.Channel_Freq := Rec^.Channel_Frek;
      if Rec^.Channel_Security then
        recCom.Channel_Security := 1
      else
        recCom.Channel_Security := 0;
      recCom.Channel_Code := Rec^.Channel_Code;

      ChannelMapping.AddtoChannelAvailable(recCom);
    end;
    EventManager.OnReceiveModifComm(Rec^);
  end
  else
  if rec^.ModifStat = mcsOff then
  begin
    for i := 0 to ListComChannel.Count -1 do
    begin
      ChannelMapping := TChannelMapping(ListComChannel.Items[i]);
      ChannelMapping.RemoveChannelDef(rec^.Channel_Number);
    end;
    EventManager.OnReceiveModifComm(Rec^);
  end
  else
  if rec^.ModifStat = mcsChangeSecure then
  begin
    for i := 0 to ListComChannel.Count -1 do
    begin
      ChannelMapping := TChannelMapping(ListComChannel.Items[i]);
      ChannelMapping.ChangeBandSecure(rec^.Channel_Number, rec^.Channel_Security);
    end;
    EventManager.OnReceiveModifComm(Rec^);
  end
  else
  if rec^.ModifStat = mcsChangeBand then
  begin
    for i := 0 to ListComChannel.Count - 1 do
    begin
      ChannelMapping := TChannelMapping(ListComChannel.Items[i]);
      ChannelMapping.ChangeBandChannelDef(rec^.Channel_Number, rec^.Channel_band);
    end;
    EventManager.OnReceiveModifComm(Rec^);
  end
  else
  if rec^.ModifStat = mcsChangeLabel then
  begin
    for i := 0 to ListComChannel.Count - 1 do
    begin
      ChannelMapping := TChannelMapping(ListComChannel.Items[i]);
      ChannelMapping.ChangeLabelChannelDef(rec^.Channel_Number,
                     rec^.Channel_Ident, rec^.Channel_Code, rec^.Channel_Frek);
    end;
    EventManager.OnReceiveModifComm(Rec^);
  end
  else
  if rec^.ModifStat = mcsInterference then
  begin
    if not ISInstructor or not ISWasdal then Exit;

    for i := 0 to ListComChannel.Count - 1 do
    begin
      ChannelMapping := TChannelMapping(ListComChannel.Items[i]);
      ChannelMapping.ChangeInterferenceChannel(rec^.Channel_Number,
                                               rec^.Channel_intfr);

    end;
    EventManager.OnReceiveModifComm(Rec^);
  end;
end;

procedure TSimMgr_Client.netRecv_MultiMode(apRec: PAnsiChar; aSize: Word);
var
  rec : ^TRecCmdMultiMode;
  grp : T3GroupVehicle;
  i,j : Integer;
  p : TT3PlatformInstance;
begin
  rec := @apRec^;

  grp := CreateGroupVehicle(rec^);

  if rec^.aAction = C_ADD then
  begin
    if Assigned(grp) then
    begin


      for j := 0 to grp.CountVe - 1 do
      begin
        p := TT3PlatformInstance(grp.GetVehicle(j));
        if p is TT3Vehicle then
        begin
          if (not ISInstructor) or (not IsWasdal) then
            (p as TT3Vehicle).IsGrouped := rec.CubicleGroup = FMyCubGroup.FData.Group_Index;
        end;
      end;

    end;
  end;
end;

procedure TSimMgr_Client.netRecv_Platform_PersonelMove(apRec: PAnsiChar; aSeize: Word);
begin
 inherited;
end;

procedure TSimMgr_Client.netRecv_GameControlInfo(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecUDP_GameCtrl_Info;
  dtNow: Longword;
  dt: integer;
  gS: TGamePlayState;
begin
  rec := @apRec^;
  LogEventRecv(rec^.pid.recID);

  if rec^.SessionID <> FSessionID then
    Exit;

  if rec^.Flag = FTimeFlag then
  begin
    gS := TGamePlayState(rec^.GameState);
    case gS of
      gsStop:
        begin // server is stoped
          FMainVTime.SetMilliSecond(rec^.GameTimeMS);

        end;
      gsPlaying:
        begin
          dt := FMainVTime.GetMillisecond - FTimeReq;
          if rec^.GameSpeed > 1.0 then
            dtNow := rec^.GameTimeMS + Round(0.5 * rec^.GameSpeed * dt)
          else
            dtNow := rec^.GameTimeMS + LongWord((dt + 1) div 2);

          FMainVTime.SetMilliSecond(dtNow);
        end;
    end;
    FTimeFlag := 0;

    if gS <> GameState then
    begin
      case gS of
        gsStop:
          GamePause;
        gsPlaying:
        begin
          GameStart;
          //isFirstStart := false;
        end;
        // gsTerminated  : GameTerminate;
      end;
    end;

    if Abs(rec^.GameSpeed - GameSpeed) > 0.01 then
      GameSpeed := rec^.GameSpeed;

    if Assigned(FOnUpdateTime) then
      FOnUpdateTime(self);
  end;

end;

procedure TSimMgr_Client.netRecv_GameSetting(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmd_GameSetting;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  ChangeGameSetting(aRec^);
end;


procedure TSimMgr_Client.netSend_CmdPersonelMove(session_ID: Integer;
  pPlatformId: Integer; pHeading: Double; pMoveType, pFormationType: Byte);
var
  rec: TRec_Personel_Move;
begin
  rec.SessionID := session_ID;
  rec.PlatformID := pPlatformId;
  rec.Heading := pHeading;
  rec.MoveType := pMoveType;
  rec.FormationType := pFormationType;

  VNetClient.SendCommand(CPID_CMD_PERSONEL_MOVE, @rec);
end;

procedure TSimMgr_Client.netSend_CmdPlatform(const pi_id: integer;
  const ordID, ordType: Byte; const cmdParam: single);
var
  rec: TRecCmd_Platform;
begin
  rec.PlatfomID := pi_id;
  rec.OrderID := ordID;
  rec.OrderType := ordType;
  rec.OrderParam := cmdParam;
  rec.DiveMode := 0;

  rec.SessionID := FSessionID;

  VNetClient.SendCommand(CPID_CMD_PLATFORM, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSetLauncherQty(const pi_id,
  weapon_id: integer; const launcher_id: Byte; const qty: integer);
var
  rec: TRecCmd_Set_LauncherQty;
begin
  rec.PlatfomID := pi_id;
  rec.WeaponID := weapon_id;
  rec.LauncherID := launcher_id;
  rec.OrderQuantity := qty;

  rec.SessionID := FSessionID;

  VNetClient.SendCommand(CPID_CMD_SET_LAUNCHERQTY, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSetQuantity(const pi_id, wi_id: integer;
  const ordID, ordType: Byte; const cmdParam: integer;
  const dvcName: String = '');
var
  rec: TRecCmd_Set_Quantity;
begin
  rec.PlatfomID := pi_id;
  rec.IDUnit := wi_id;
  rec.OrderID := ordID;
  rec.OrderType := ordType;
  rec.OrderQuantity := cmdParam;
  rec.IDName := dvcName;

  rec.SessionID := FSessionID;

  VNetClient.SendCommand(CPID_CMD_SET_QUANTITY, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSetStatus(const pi_id, wi_id: integer;
  const ordID, ordType, cmdParam: Byte);
var
  rec: TRecCmd_Set_Status;
begin
  rec.PlatfomID := pi_id;
  rec.IDUnit := wi_id;
  rec.OrderID := ordID;
  rec.OrderType := ordType;
  rec.OrderStatus := cmdParam;

  rec.SessionID := FSessionID;

  VNetClient.SendCommand(CPID_CMD_SET_STATUS, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSonarDeploy(const pi_id, sensID,
  aTime: Integer; const aParam: Byte; const fActualCable,fOrderCable: Double);
var
  rec: TRecCmd_SonarDeploy;
begin
  with rec do
  begin
    PlatformID    := pi_id;
    SensorID      := sensID;
    TimeToActive  := aTime;
    Param         := aParam;
    ActualCable   := fActualCable;
    OrderCable    := fOrderCable;
  end;

  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_SONAR_DEPLOY, @rec);
end;

procedure TSimMgr_Client.netSend_CmdIFFSearchMode(const pi_id, sensID: integer;
  const aMode: byte);
var
  rec : TRecCmd_IFFSearchMode;
begin
  with rec do
  begin
    PlatformID    := pi_id;
    SensorID      := sensID;
    ModeSearch    := aMode;
  end;
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_IFF_MODE_SEARCH, @rec);
end;

procedure TSimMgr_Client.netSend_CmdEngageTrack(const pi_id, tgt_id,
  mis_id: integer; TrackID: string; isHaveLaunch: Byte);
var
  rec: TRecCmd_EngageTrack;
begin
  rec.PlatformID := pi_id;
  rec.TargetID := tgt_id;
  rec.MisID := mis_id;
  rec.track := TrackID;
  rec.isHaveLaunch := isHaveLaunch;

  rec.SessionID := FSessionID;

  VNetClient.SendCommand(CPID_CMD_ENGAGE_TRACK, @rec);
end;

procedure TSimMgr_Client.netSend_CmdPlatform_Move(const pi_id: integer;
  const ordID: Byte; const x, y: double; const NRPIDGroup: integer);
var
  rec: TRecCmd_Platform_MOVE;
begin
  rec.PlatfomID := pi_id;
  rec.OrderID := ordID;
  rec.x := x;
  rec.y := y;
  // rec.Z     := z;
  rec.GroupID := NRPIDGroup;

  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_PLATFORM_REPOS, @rec);
end;

procedure TSimMgr_Client.netSend_CmdPlatform_CHANGE_PROPERTY
  (rec: TRecCmd_Platform_SET_PROPERTY);
begin

  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_UPDATE_PLATFORM_PROPERTY, @rec);
end;

procedure TSimMgr_Client.netSend_CmdTrack_CHANGE_TRACKNUMBER
  (rec: TRecCmd_Platform_CHANGE_TRACKNUMBER);
begin
  if isExistTrackNumber(rec.newTrackNumber) and (rec.newTrackNumber <> 0) then
  begin
    EventManager.OnLogStatusTactical('Track Number Already Used');
    Exit;
  end;

  rec.SessionID := FSessionID;
  if ISInstructor or ISWasdal then
    rec.GrpID := 0
  else
    rec.GrpID := FMyCubGroup.FData.Group_Index;

  VNetClient.SendCommand(CPID_CMD_CHANGE_TRACK_NUMBER, @rec);
end;

procedure TSimMgr_Client.netSend_CmdTransferSonobuoy(r: TRecCmd_TransferSonobuoy);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_TRANSFER_SONOBUOY, @r);
end;

procedure TSimMgr_Client.netSend_CmdVersion(rec: TRecCmdVersion);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_VERSION, @rec);
end;

procedure TSimMgr_Client.netSend_GameSetting(r: TRecCmd_GameSetting);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_GAME_SETTING, @r);
end;

procedure TSimMgr_Client.netSend_MessageHandling(r: TRecSendMessage);
begin
  r.SesionID := FSessionID;
  VNetClient.SendCommand(CPID_REC_MESSAGE, @r);
end;

procedure TSimMgr_Client.netSend_ModifyCommunication(r: TRecModifComm);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_MODIF_COMM, @r);
end;

procedure TSimMgr_Client.netSend_PlatformGroupChange(
  r: TRecPlatformGroupChange);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_PLAT_GROUP_CHANGE, @r);
end;

procedure TSimMgr_Client.netSend_SendToBackDynamicShape(
  r: TRecCmd_OverlayDynamicShape);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_SENDTOBACK_OVERLAYDYNAMICSHAPE, @r);
end;

procedure TSimMgr_Client.netSend_SendToBackStaticShape(
  r: TRecCmd_OverlayStaticShape);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_SENDTOBACK_OVERLAYSTATICSHAPE, @r);
end;

procedure TSimMgr_Client.netSend_SwitchTerrain(var rec: TRec_SwitchTerrain);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_SWITCH_TERRAIN, @rec);
end;

procedure TSimMgr_Client.netSend_Synch_ESMvarian(r: TRecCmd_EsmVariance);
begin
  r.SessionID := FSessionID;
  r.GroupID   := self.FMyCubGroup.FData.Group_Index;

  VNetClient.SendCommand(CPID_CMD_SYNC_ESM_VARIANCE, @r);
end;

procedure TSimMgr_Client.netSend_CmdNRP_CHANGE_PROPERTY
  (rec: TRecCmd_NRP_SET_PROPERTY);
begin
  rec.SessionID := FSessionID;

  if ISInstructor or ISWasdal then
    rec.GrpID := 0
  else
    rec.GrpID := FMyCubGroup.FData.Group_Index;

  VNetClient.SendCommand(CPID_CMD_UPDATE_NRP_PROPERTY, @rec);
end;

procedure TSimMgr_Client.netSend_CmdPlatform_Repair
  (rec: TRecCmd_Platform_Repair);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_PLATFORM_REPAIR, @rec);
end;

//procedure TSimMgr_Client.netSend_CmdPlotting(r: TRecCmd_Plotting);
//begin
//  r.SessionID := FSessionID;
//
//  VNetClient.SendCommand(CPID_CMD_PLOTTING, @r);
//end;

procedure TSimMgr_Client.netSend_CmdPlottingShape(r: TRecCmd_PlottingShape);
begin
//  r.IPReceiver := StrIp_To_LongIp(FCubicleList.GetIPAddress(r.GroupReceiver));

  r.SessionID := FSessionID;
    VNetClient.SendCommand(CPID_CMD_PLOTTINGSHAPE, @r);
end;

procedure TSimMgr_Client.netSend_CmdESM_CHANGE_PROPERTY
  (rec: TRecCmd_ESM_SET_PROPERTY);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_ESM_SET_PROPERTY, @rec);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TSimMgr_Client.netSend_CmdRadarNoiseJammer(rec: TrecRadarNoiseJammer);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_RADAR_NOISE_JAMMER, @rec);
end;

procedure TSimMgr_Client.netSend_cmdRampController(r: TRecCmd_RampController);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_RAMP, @r);
end;

procedure TSimMgr_Client.netSend_CmdSensor(const pi_id: integer;
  const sensType: Byte; const sensID: integer; const ordID, ordParam: Byte);
var
  rec: TRecCmd_Sensor;

begin
  with rec do
  begin
    SensorType := sensType;
    PlatformID := pi_id;
    SensorID := sensID;
    OrderID := ordID;
    OrderParam := ordParam;
  end;

  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_SENSOR, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSensorIFF(const pi_id: integer;
  const tgt_id: integer; const sensID: integer; const index_mod: Byte;
  const check_mod: Boolean; const value_mod: integer);
var
  rec: TRecCmd_SensorIFF;
begin
  with rec do
  begin
    PlatformID := pi_id;
    TargetID := tgt_id;
    SensorID := sensID;
    index_mode := index_mod;
    check_mode := check_mod;
    value_mode := value_mod;
  end;

  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_SENSOR_IFF, @rec);
end;

procedure TSimMgr_Client.netSend_CmdTargetIFF(const pi_id: integer;
  const tgt_id: integer; const sensID: integer);
var
  rec: TRecCmd_TargetIFF;
begin
  with rec do
  begin
    PlatformID := pi_id;
    TargetID := tgt_id;
    SensorID := sensID;
  end;

  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_TARGET_IFF, @rec);
end;

procedure TSimMgr_Client.netSend_CmdShipingRoute(r: TRecCmd_ShipingRoute);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_SHIPINGROUTE, @r);
end;

procedure TSimMgr_Client.netSend_CmdEditFormation(
  rec: TRecEditFormation);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_EDIT_FORMATION, @rec);
end;

procedure TSimMgr_Client.netSend_CmdEmcon(const pi_id: integer;
  const EmcnCtgr: Byte; const sensID: integer;
  const ModeID, ordID, ordParam: Byte);
var
  rec: TRecCmd_ModeEmcon;
  grp : T3CubicleGroup;
  grpID : Integer;
begin
  grp := FScenario.CubiclesGroupsListFromDB.GetGroupOf_PlatformIndex(pi_id);
//  if grp = nil then
//  Exit;

  if grp = nil then
    grpID := 0
  else
    grpID := grp.FData.Group_Index;

  with rec do
  begin
    PlatformID := pi_id;
    EmconCtgr := EmcnCtgr;
    SensorID := sensID;
    Mode := ModeID;
    OrderID := ordID;
    OrderParam := ordParam;
	  SensorGroupID := grpID;
    //SensorGroupID := grp.FData.Group_Index;
  end;

  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_EMCON_MODE, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSyncBOLW(rec: TrecSinc_BOLW);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_SincBOLW, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSyncRBLW(rec: TrecSinc_RBLW);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_SincRBLW, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSyncWaypoint(rec: TrecSinc_Waypoint);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_SincWaypoint, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSyncEnvi(rec: TrecSinc_Envi);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_ENVI, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSYNCH(rec: TRecCmdSYNCH);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_SYNCH, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSyncMissileEnvi(rec: TrecMissile_Envi);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_Missile_Envi, @rec);
end;

procedure TSimMgr_Client.netRecv_CmdSensor(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_Sensor;
  pi: TT3PlatformInstance;
  obj: TObject;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

  SensorCommand(r^);

  pi := FindT3PlatformByID(r^.PlatformID);

  if pi = nil then
    Exit;

  if not(pi is TT3Vehicle) then
    Exit;

  case r^.SensorType of

    CSENSOR_TYPE_IFF:
      begin
        obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3IFFSensor);

        if Assigned(ControlledPlatform) then
        begin
          if pi.InstanceIndex = TT3Vehicle(ControlledPlatform).InstanceIndex then
          begin
            EventManager.OnUpdateIFFList(TT3IFFSensor(obj), r^.OrderParam);
            EventManager.OnRefreshIFFForm(TT3IFFSensor(obj));
          end;
        end;
      end;
  end;

  EventManager.OnVehicleSensorStateChange(TT3Vehicle(pi));
end;

procedure TSimMgr_Client.netRecv_CmdUpdateActualCable(apRec: PAnsiChar;
  aSize: word);
var
  r : ^TRecCmd_UpdateActualCable;
  pi, pfObject: TT3PlatformInstance;
  obj: TObject;
  i : Integer;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

   pi := FindT3PlatformByID(r^.PlatformID);

  if pi = nil then
    Exit;

  if not(pi is TT3Vehicle) then
    Exit;

  obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3Sonar);

  if Assigned(obj) then
  begin
    for I := 0 to SimPlatforms.itemCount - 1 do
    begin
      pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
      if pi.InstanceIndex = pfObject.InstanceIndex then
      begin
        TT3Sonar(obj).ActualCable := r^.value;
      end;
    end;

  end;
end;

procedure TSimMgr_Client.netRecv_CmdUpdateSonar(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_UpdateSonar;
  pi,pfObject: TT3PlatformInstance;
  obj: TObject;
  i: Integer;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

   pi := FindT3PlatformByID(r^.PlatformID);

  if pi = nil then
    Exit;

  if not(pi is TT3Vehicle) then
    Exit;

  obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3Sonar);
 // Log('Update Cable ' + IntToStr(r^.SensorID) + ':' + IntToStr(r^.Counter)+ ':'+ IntToStr(pi.InstanceIndex));

  if Assigned(ControlledPlatform) and Assigned(obj) then
  begin
    if r^.param = 1 then
    begin
      for I := 0 to SimPlatforms.itemCount - 1 do
      begin
        pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
        if pi.InstanceIndex = pfObject.InstanceIndex then
        begin
          TT3Sonar(obj).ActualCable := r^.Counter;
          TT3Sonar(obj).OrderCable := r^.order;
          TT3Sonar(obj).ControlMode := TSonarControlMode(scmDeploying);
        end;
      end;
    end
    else if r^.param = 2 then
    begin
      for I := 0 to SimPlatforms.itemCount - 1 do
      begin
        pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
        if pi.InstanceIndex = pfObject.InstanceIndex then
        begin
          if (r^.Counter)>= (r^.order)then
          begin

            TT3Sonar(obj).ActualCable := r^.Counter;
            TT3Sonar(obj).OrderCable := r^.order;
            TT3Sonar(obj).ControlMode := TSonarControlMode(scmStowing);
          end;
        end;
      end;
    end
    else if r^.param = 5 then     //deploy keatas
    begin
      for I := 0 to SimPlatforms.itemCount - 1 do
      begin
        pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
        if pi.InstanceIndex = pfObject.InstanceIndex then
        begin
          if (r^.Counter)>= (r^.order)then
          begin

            TT3Sonar(obj).ActualCable := r^.Counter;
            TT3Sonar(obj).OrderCable := r^.order;
            TT3Sonar(obj).ControlMode := TSonarControlMode(scmDeploying);
          end;
        end;
      end;
    end;
//    EventManager.OnSonarControlMode(TT3Sensor(obj), TT3Sonar(obj).ControlMode);
  end;
end;

procedure TSimMgr_Client.netRecv_CmdSonarDeploy(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecCmd_SonarDeploy;
  Pi : TT3PlatformInstance;
begin
   r := @apRec^;
   LogEventRecv(r^.pid.recID);

   if r^.SessionID <> FSessionID then
    Exit;

  pi := FindT3PlatformByID(r^.PlatformID);

  if pi = nil then
    Exit;

  if not(pi is TT3Vehicle) then
    Exit;

  if Assigned(ControlledPlatform) then
  begin
    if pi.InstanceIndex = TT3Vehicle(ControlledPlatform).InstanceIndex then
    begin
      EventManager.OnUpdateSonarDeploy(TT3Vehicle(pi), r^.Param, r^.OrderCable);
    end;
  end;
end;


procedure TSimMgr_Client.netRecv_CmdIFFSearchMode(apRec: PAnsiChar;
  aSize: word);
var
  r : ^TRecCmd_IFFSearchMode;
  Pi, pfObject : TT3PlatformInstance;
  aDev: TObject;
  i: Integer;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

  pi := FindT3PlatformByID(r^.PlatformID);

  if pi = nil then
    Exit;

  if not(pi is TT3Vehicle) then
    Exit;

   aDev := TT3Vehicle(pi).getDevice(r^.SensorID, TT3IFFSensor);

   if Assigned(ControlledPlatform) and Assigned(aDev) then
  begin
    for I := 0 to SimPlatforms.itemCount - 1 do
    begin
      pfObject := TT3PlatformInstance(SimPlatforms.getObject(i));
      if pi.InstanceIndex = pfObject.InstanceIndex then
      begin
        TT3IFFSensor(aDev).ModeSearchIFF := r^.ModeSearch;
        TT3IFFSensor(aDev).TargetObject := nil;
      end;
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_CmdSensorIFF(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecCmd_SensorIFF;
  pi, pt : TT3PlatformInstance;
  obj : TObject;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

  pi := FindT3PlatformByID(r^.PlatformID);

  if r^.TargetID = 0 then
    pt := nil
  else
    pt := FindT3PlatformByID(r^.TargetID);

  if pi = nil then
    Exit;
  // if pt = nil then
  // exit;

  if not(pi is TT3Vehicle) then
    Exit;

  r := @apRec^;

  obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3IFFSensor);

//  if pt <> nil then
//    obj2 := TT3Vehicle(pt).getDevice(r^.SensorID, TT3IFFSensor)
//  else
//    obj2 := nil;

  if obj = nil then
    Exit;

  case r^.index_mode of
    1:
      begin // transponder mode1
        TT3IFFSensor(obj).TransponderMode1Enabled := r^.check_mode;
        TT3IFFSensor(obj).TransponderMode1 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    2:
      begin // transponder mode2
        TT3IFFSensor(obj).TransponderMode2Enabled := r^.check_mode;
        TT3IFFSensor(obj).TransponderMode2 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    3:
      begin // transponder mode3
        TT3IFFSensor(obj).TransponderMode3Enabled := r^.check_mode;
        TT3IFFSensor(obj).TransponderMode3 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    4:
      begin // interrogator mode1
        TT3IFFSensor(obj).InterrogatorMode1Enabled := r^.check_mode;
        TT3IFFSensor(obj).InterrogatorMode1 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    5:
      begin // interrogator mode2
        TT3IFFSensor(obj).InterrogatorMode2Enabled := r^.check_mode;
        TT3IFFSensor(obj).InterrogatorMode2 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    6:
      begin // interrogator mode3
        TT3IFFSensor(obj).InterrogatorMode3Enabled := r^.check_mode;
        TT3IFFSensor(obj).InterrogatorMode3 := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    7:   // interrogator mode3C
      begin
        TT3IFFSensor(obj).InterrogatorMode3CEnabled := r^.check_mode;
        TT3IFFSensor(obj).InterrogatorMode3C := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    8:   // Transponder Mode 3C
      begin
        TT3IFFSensor(obj).TransponderMode3CEnabled := r^.check_mode;
        TT3IFFSensor(obj).TransponderMode3C := r^.value_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    9:  // transponder mode 4
      begin
        TT3IFFSensor(obj).TransponderMode4Enabled := r^.check_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
    10: // interogator mode 4
      begin
        TT3IFFSensor(obj).InterrogatorMode4Enabled := r^.check_mode;
        TT3IFFSensor(obj).TargetObject := pt;
      end;
  end;

  if Assigned(ControlledPlatform) then
  begin
    if pi.InstanceIndex = TT3Vehicle(ControlledPlatform).InstanceIndex then
    begin
      EventManager.OnRefreshIFFForm(TT3IFFSensor(obj));
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_CmdTargetIFF(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_TargetIFF;
  pi, pt: TT3PlatformInstance;
  obj : TObject;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

  pi := FindT3PlatformByID(r^.PlatformID);
  if not(pi is TT3Vehicle) then
    Exit;

  pt := FindT3PlatformByID(r^.TargetID);
  if not(pt is TT3Vehicle) then
    Exit;

  obj := TT3Vehicle(pi).getDevice(r^.SensorID, TT3IFFSensor);
  if obj = nil then
    Exit;

  TT3IFFSensor(obj).TargetObject := pt;
  TT3IFFSensor(obj).PrevTargetObj := nil;
end;

procedure TSimMgr_Client.netRecv_CmdTransferSonobuoy(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_TransferSonobuoy;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r.SessionID <> FSessionID then
    Exit;

  TT3ClientEventManager(EventManager).OnTransferSonobuoy(r^.OldParentID, r^.NewParentID, r^.SonoID, r^.Flag)

end;

procedure TSimMgr_Client.netRecv_CmdEmcon(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_ModeEmcon;
  pi: TT3PlatformInstance;
  obj: TObject;
  vnext: Boolean;
  i : Integer;
  ve : TT3Vehicle;
  sensor : TT3Sensor;
  BtnAllSilent : Boolean;
begin
  r := @apRec^;
  pi := FindT3PlatformByID(r^.PlatformID);

  if (pi = nil) then
    Exit;

  inherited;

  if (r^.SensorID = 0) or (r^.EmconCtgr = Byte(HFDatalink))
    or (r^.EmconCtgr = Byte(VHFDatalink)) then
    vnext := True
  else
    vnext := False;

  BtnAllSilent := (r^.EmconCtgr = 12) and (r^.Mode = 1);

  ve := TT3Vehicle(pi);
  if vnext = False then begin
    for i := 0 to ve.Devices.Count - 1 do
    begin
      sensor := ve.Devices.Items[i];

      if sensor is TT3Radar then begin
        obj := ve.getDevice(r^.SensorID, TT3Radar);

        if obj = nil then continue;

        if r^.SensorID = TT3Radar(obj).InstanceIndex then
        begin
          vnext := True;
          Break;
        end;
      end
      else if sensor is TT3Sonar then begin
        obj := ve.getDevice(r^.SensorID, TT3Sonar);

        if obj = nil then continue;

        if r^.SensorID = TT3Sonar(obj).InstanceIndex then
        begin
          vnext := True;
          Break;
        end;
      end
      else if sensor is TT3IFFSensor then begin
        obj := ve.getDevice(r^.SensorID, TT3IFFSensor);

        if obj = nil then continue;

        if r^.SensorID = TT3IFFSensor(obj).InstanceIndex then
        begin
          vnext := True;
          Break;
        end;
      end;
    end;
  end;

  //grp := FScenario.CubiclesGroupsList.GetGroupOf_PlatformIndex(r.PlatformID);
  if vnext = True then
  begin
    if ISInstructor or ISWasdal then begin
      if ControlledPlatform = pi then
        EventManager.UpdateEmconCheckBox(pi, BtnAllSilent);
    end
    else
    begin
      if not(Assigned(FMyCubGroup)) then
        Exit;

      if r.SensorGroupID = FMyCubGroup.FData.Group_Index then
      begin
        EventManager.UpdateEmconCheckBox(pi, BtnAllSilent);
      end;
    end;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure TSimMgr_Client.netSend_CmdLaunch_Embark(r: TRecCmd_Embark);
begin
  r.SessionID := FSessionID;

  // -------------------------------------------------------//mk 03052012
  { if ISInstructor then
    r.GrpID := 0
    else
    r.GrpID := FMyCubGroup.FData.Group_Index; }
  // -------------------------------------------------------//mk 03052012

  VNetClient.SendCommand(CPID_CMD_LAUNCH_EMBARK, @r);
end;

procedure TSimMgr_Client.netSend_CmdDisembarkTransport(r: TRecCmd_Embark);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCH_EMBARK, @r);
end;

procedure TSimMgr_Client.netSend_Cmd_Embark_Land(r: TRecCmd_Embark_Landing);
begin
  r.SessionID := FSessionID;

  VNetClient.SendCommand(CPID_CMD_EMBARK_LAND, @r);
end;

procedure TSimMgr_Client.netSend_CmdLaunch_Missile(r: TRecCmd_LaunchMissile);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCH_MISSILE, @r);
end;

procedure TSimMgr_Client.netSend_CmdMissileEngageProperties
  (r: TRecEngagementModeWeapon);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_ENGAGEMENTMODE, @r);
end;

procedure TSimMgr_Client.netSend_CmdMissileProperties(r: TRecFiringModeWeapon);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_FIRINGMODE, @r);
end;

procedure TSimMgr_Client.netSend_CmdLaunch_Torpedo(r: TRecCmd_LaunchMissile);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCH_TORPEDO, @r);
end;

//procedure TSimMgr_Client.netSend_CmdLogisticRoute(r: TRecCmd_LogisticRoute);
//begin
//  r.SessionID := FSessionID;
//  VNetClient.SendCommand(CPID_CMD_LOGISTICROUTE, @r);
//end;

procedure TSimMgr_Client.netSend_CmdMultiMode(rec : TRecCmdMultiMode);
begin
  //rec.GroupID := 0;
  if ISInstructor or ISWasdal then
    rec.CubicleGroup := 0
  else
    rec.CubicleGroup := FMyCubGroup.FData.Group_Index;

  VNetClient.SendCommand(CPID_CMD_MULTI_MODE, @rec);
end;

procedure TSimMgr_Client.netSend_CmdGunFire(r: TRecCmd_GunFire);
begin
  r.SessionID := FSessionID;
  r.HitProbability := 0;
  VNetClient.SendCommand(CPID_CMD_GUN_FIRE, @r);
end;

procedure TSimMgr_Client.netSend_CmdRecordAudio(rec: TRecRecordVoice);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_RECORDTRACK, @rec);
end;

procedure TSimMgr_Client.netSend_CmdRemote(const mIP: string;
  const mColor: Byte; const mControl: Boolean; const ordID: Byte);
var
  rec: TRecSendRemote;
begin
  rec.pid.ipReceiver := StrIp_To_LongIp(mIP);
  rec.SessionID := FSessionID;
  rec.FServer := StrIp_To_LongIp(mIP);
  rec.FClient := StrIp_To_LongIp(FMyIPAddress);
  rec.FPort := vGameDataSetting.RemotePort;
  rec.FColor := mColor;
  rec.FControl := mControl;
  rec.OrderID := ordID;
  VNetClient.SendCommand(CPID_REMOTE_CMD, @rec);
end;

procedure TSimMgr_Client.netSend_CmdSnapshot( r : TRecCommandSnapshot );
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_SNAPSHOT, @r);
end;

procedure TSimMgr_Client.netRecv_CmdRadarNoiseJammer(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TrecRadarNoiseJammer;
  jammerOwner, jammedOwner: TT3PlatformInstance;
  jammerObject, jammedObject : TObject;
begin
  inherited;

  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

  jammerOwner := FindT3PlatformByID(r^.JammerPlatformOwnerID);
  if jammerOwner = nil then
    Exit;

  if not(jammerOwner is TT3Vehicle) then
    Exit;

  jammerObject := FindT3DeviceByID(TT3RadarNoiseJammerOnVehicle,
                  TSimObject(jammerOwner), r^.JammerID);
  if jammerObject = nil then
    Exit;

  case r^.OrderID of
    CORD_ID_RN_JAMSUCCESS :
      begin
        jammedObject := nil;

        jammedOwner := FindT3PlatformByID(r^.ObjectSuccesJammedOwnerID);
        if Assigned(jammedOwner) then
          jammedObject := FindT3DeviceByID(TT3Radar,
                          TSimObject(jammedOwner), r^.ObjectSuccesJammedID );

        if not Assigned(jammedObject) then
          Exit;

        { apply effect }
        TT3RadarNoiseJammerOnVehicle(jammerObject).ApplyJammedEffect(jammedObject, True);
      end;
    CORD_ID_RN_JAMFAILED :
      begin
        jammedObject := nil;

        jammedOwner := FindT3PlatformByID(r^.ObjectSuccesJammedOwnerID);
        if Assigned(jammedOwner) then
          jammedObject := FindT3DeviceByID(TT3Radar,
                          TSimObject(jammedOwner), r^.ObjectSuccesJammedID );

        if not Assigned(jammedObject) then
          Exit;

        { apply effect }
        TT3RadarNoiseJammerOnVehicle(jammerObject).ApplyJammedEffect(jammedObject, False);
      end;
  end;

  if Assigned(ControlledPlatform) then
  begin
    if TT3Vehicle(jammerOwner).InstanceIndex = TT3Vehicle(ControlledPlatform).InstanceIndex then
    begin
      EventManager.OnUpdateRadarNoiseJammer(TT3RadarNoiseJammerOnVehicle(jammerObject), r^.JammerStatus);
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_CmdRemote(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecSendRemote;
  rec: TRecSendRemote;

  prmIp: string;
  prmColor: Byte;
  prmPort: integer;
  prmControl: Boolean;
  prmCaption: string;

  isControl: string;
  sCommand: string;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  case r^.OrderID of
    REMOTE_STATE_FALSE:
      begin
        if FRemoteServerCMD <> nil then
        begin
          if FRemoteServerCMD.Active then
            FRemoteServerCMD.Terminates;
        end;

        if FRemoteClientCMD <> nil then
        begin
          if FRemoteClientCMD.Active then
            FRemoteClientCMD.Terminates;
        end;

        if isExeRunning(vAppSetting.RemoteServerName, false) then
          CloseCurrentHandleApplication(vAppSetting.RemoteServerName);
        if isExeRunning(vAppSetting.RemoteClientName, false) then
          CloseCurrentHandleApplication(vAppSetting.RemoteClientName);
      end;

    REMOTE_STATE_TRUE:
      begin
        if FRemoteServerCMD = nil then
        begin
          if isExeRunning(vAppSetting.RemoteServerName, false) then
            CloseCurrentHandleApplication(vAppSetting.RemoteServerName);

          FRemoteServerCMD := TAppExecute.Create;
          FRemoteServerCMD.OnStartExecute := nil;
          FRemoteServerCMD.OnEndExecute := nil;

          FRemoteServerCMD.FExecFname := vAppSetting.RemoteServerName;
          sCommand := IntToStr(r^.FPort) + ' ' + IntToStr
            (vGameDataSetting.RemoteScreen);
          FRemoteServerCMD.ExecutesWithParams(sCommand);
        end;

        /// send back
        rec.pid.ipReceiver := r^.FClient;
        rec.SessionID := FSessionID;
        rec.FServer := StrIp_To_LongIp(FMyIPAddress);
        rec.FClient := StrIp_To_LongIp(prmIp);
        rec.FPort := r^.FPort;
        rec.FColor := r^.FColor;
        rec.FControl := r^.FControl;
        rec.OrderID := REMOTE_STATE_READY;
        VNetClient.SendCommand(CPID_REMOTE_CMD, @rec);
      end;

    REMOTE_STATE_READY:
      begin
        if FRemoteClientCMD = nil then
        begin
          FRemoteClientCMD := TAppExecute.Create;
          FRemoteClientCMD.OnStartExecute := nil;
          FRemoteClientCMD.OnEndExecute := nil;

          if isExeRunning(vAppSetting.RemoteClientName, false) then
            CloseCurrentHandleApplication(vAppSetting.RemoteClientName);
        end;

        if FRemoteClientCMD <> nil then
        begin
          if FRemoteClientCMD.Active then
            FRemoteClientCMD.Terminates;
        end;

        prmIp := LongIp_To_StrIp(r^.FServer);
        prmPort := r^.FPort;
        prmColor := r^.FColor;
        prmControl := r^.FControl;
        prmCaption := FCubicleList.GetConsoleName(prmIp);

        isControl := 'false';
        if prmControl then
          isControl := 'true';

        sCommand := prmIp + ' ' + IntToStr(prmPort) + ' ' + IntToStr(prmColor)
          + ' ' + isControl + ' ' + prmCaption;
        FRemoteClientCMD.FExecFname := vAppSetting.RemoteClientName;
        FRemoteClientCMD.ExecutesWithParams(sCommand);

        TT3ClientEventManager(EventManager).OnRemoteViewerRun();
      end;
  end;
end;

procedure TSimMgr_Client.netRecv_CmdEditFormation(apRec: PAnsiChar;
  aSize: word);
var
  rec: ^TRecEditFormation;
//  formationSelected : TFormation;
//  i : Integer;
  fm : TFormationRefine;
begin
  rec := @apRec^;
  if rec^.SessionID <> FSessionID then
    Exit;

  inherited;

  //Update list formation
  EventManager.OnUpdateFormationList;

  //Update list Members Formation
  // refine
  fm := Scenario.Formation_List_rev.FormationByIndex(rec.FormationID);
  if Assigned(fm) then
    EventManager.OnUpdateFormationMembers(fm);

  LogEventRecv(rec^.pid.recID);
end;

procedure TSimMgr_Client.netRecv_CmdEmbark(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmd_Embark;
  pf: TT3PlatformInstance;
begin
  aRec := @apRec^;
  if aRec^.SessionID <> FSessionID then
    Exit;

  case aRec^.OrderID of
    CORD_ID_INITIATE:
      begin
        TT3ClientEventManager(EventManager).onLaunchEmbark(aRec^);
      end;
    CORD_ID_LAUNCH:
      begin
        pf := DisembarkTransportedOld(aRec^);
        if pf = nil then Exit;

        TT3Vehicle(pf).Connect3D := FIsConnected3D;
        pf.isInstructor := FIsInstructor;
        pf.isWasdal := FIsWasdal;

        Log('TSimMgr_Client.netRecv_CmdEmbark', 'Launch Platform : ' + pf.InstanceName + #13#10
                        + 'ID Embark platform : ' + IntToStr(aRec^.EmbarkPlatformID));
      end;
  end;
  LogEventRecv(aRec^.pid.recID);
end;

procedure TSimMgr_Client.netRecv_CmdEmbarkPersonelTemporary(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_EmbarkPersonelTemporary;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  EmbarkTransportedPersonel(r^)
end;

procedure TSimMgr_Client.netRecv_CmdTransport(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_Transport;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  if r^.OrderID = CORD_ID_embark then
    EmbarkTransported(r^)
  else if r^.OrderID = CORD_ID_disembark then
    DisembarkTransported(r^)
  else if r^.OrderID = CORD_ID_disembarkwith then
    DisembarkWithTransported(r^);
end;

procedure TSimMgr_Client.netRecv_CmdTransportProcess(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecCmd_TransportProcess;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  TransportProcess(r^);
end;

procedure TSimMgr_Client.netRecv_EmbarkedPlatformData(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRec_EmbarkedPlatformData;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  EmbarkedPlatformData(r^);
end;

procedure TSimMgr_Client.netRecv_CmdDisembarkPersonelTemporary(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmd_DisembarkPersonelTemporary;
  pf: TT3PlatformInstance;
begin
  aRec := @apRec^;
  if aRec^.SessionID <> FSessionID then
    Exit;

  case aRec^.OrderID of
    CORD_ID_INITIATE:
      begin
        TT3ClientEventManager(EventManager).onLaunchEmbarkPersonel(aRec^);
      end;
    CORD_ID_LAUNCH:
      begin
        pf := DisembarkTransportedPersonel(aRec^);
        if pf = nil then Exit;

        TT3Vehicle(pf).Connect3D := FIsConnected3D;
        pf.isInstructor := FIsInstructor;
        pf.isWasdal := FIsWasdal;

        Log('TSimMgr_Client.netRecv_CmdEmbark', 'Launch Platform : ' + pf.InstanceName + #13#10
                        + 'ID Embark platform : ' + IntToStr(aRec^.EmbarkPlatformID));
      end;
  end;

  LogEventRecv(aRec^.pid.recID);
end;

procedure TSimMgr_Client.netRecv_CmdDisembarkTemporary(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmd_Embark;
  pf: TT3PlatformInstance;
begin
  aRec := @apRec^;
  if aRec^.SessionID <> FSessionID then
    Exit;

  pf := DisembarkTransportedOld(aRec^);
  if pf = nil then Exit;

  pf.isInstructor := FIsInstructor;
  pf.isWasdal := FIsWasdal;

  Log('TSimMgr_Client.netRecv_CmdDisembarkTemporary', 'Launch Platform : ' + pf.InstanceName + #13#10
                  + 'ID Embark platform : ' + IntToStr(aRec^.EmbarkPlatformID));

  LogEventRecv(aRec^.pid.recID);
end;

procedure TSimMgr_Client.netRecv_CmdSYNCH(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmdSYNCH;
begin
  aRec := @apRec^;

  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  case aRec^.SynchID of
    CORD_ID_Synch_NextPID:
      begin
        FLastPlatformID := aRec^.Synch_IParam;
      end;
  end;
end;


procedure TSimMgr_Client.netRecv_CmdVersion(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmdVersion;
  data : TRecCmdVersion;
  IP : string;
begin
  aRec := @apRec^;

  LogEventRecv(aRec^.pid.recID);
  IP := LongIp_To_StrIp(aRec^.pid.ipSender);
  OnLogStr('TSimMgr_Client.netRecv_CmdVersion', 'Receive Data from : ' + IP);

  if aRec^.SessionID <> FSessionID then
    Exit;

  case aRec^.SynchID of
    CORD_ID_GET_VERSION :
      begin
        data.SessionID := FSessionID;
        data.SynchID := CORD_ID_GET_VERSION;
        data.Synch_Version := EncryptStr(FVersion, FKeyVersion);
        netSend_CmdVersion(data);
      end;
    CORD_ID_VERSION_MATCH :
      begin
       // ShowMessage('Version Match');
      end;
    CORD_ID_VERSION_NOT_MATCH :
      begin
        if MessageDlg('Version did not match, server version is ' + aRec^.Synch_Version, mtWarning,
        [mbOK], 0) = mrOK then
          Application.Terminate;
      end;
  end;
end;

procedure TSimMgr_Client.netRecv_CmdLaunchChaff(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmd_LaunchChaff;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  LaunchChaff(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdLaunchChaffState(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecCmd_LaunchChaffState;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  LauncherChaffState(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdLauncherProperties(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecCmd_ChaffLauncherProperties;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  LauncherChaffProp(aRec^);
end;

// bubble
procedure TSimMgr_Client.netRecv_CmdLaunchBubble(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmd_LaunchBubble;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  LaunchBubble(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdLaunchBubbleState(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecCmd_LaunchBubbleState;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  LauncherBubbleState(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdLaunchMines(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmd_LaunchMine;
begin
  aRec := @apRec^;

  if aRec^.SessionID <> SessionID then
    Exit;

  LaunchMine(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdLaunchBomb(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmd_LaunchBomb;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> SessionID then
    Exit;

  LaunchBomb(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdLaunchSonobuoy(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmd_LaunchSonobuoy;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> SessionID then
    Exit;

  LaunchSonobuoy(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdSync_Hit_Mine_Bomb(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecCmd_Sync_Hit_BombMine;
  weapon: TSimObject;
  Target: TSimObject;
begin
  aRec := @apRec^;

  if aRec^.SessionID <> SessionID then
    Exit;

  weapon := FindWeaponByID(aRec^.WeaponID);

  if not Assigned(weapon) then
    Exit;

  Target := FindT3PlatformByID(aRec^.TargetID);

  if not Assigned(Target) then
    Exit;

  self.OnBombMineHit(weapon, Target, aRec^.lethality);
end;

procedure TSimMgr_Client.netRecv_BringToFront_OverlayDynamicShape(
  apRec: PAnsiChar; aSize: word);
  var
  r : ^TRecCmd_OverlayDynamicShape;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  if r.Cubicle = 0 then
  begin
    TT3ClientEventManager(EventManager).BringToFront_OverlayDynamicShape(r^);
  end
  else
  begin
    if FMyCubGroup <> nil then
    begin
      if FMyCubGroup.FData.Group_Index = r^.Cubicle then
        TT3ClientEventManager(EventManager).BringToFront_OverlayDynamicShape(r^);
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_BringToFront_OverlayStaticShape(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecCmd_OverlayStaticShape;
begin
   r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;


  TT3ClientEventManager(EventManager).BringToFront_OverlayStaticShape(r^);

end;

procedure TSimMgr_Client.netRecv_SendToBack_OverlayStaticShape(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecCmd_OverlayStaticShape;
begin
   r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  TT3ClientEventManager(EventManager).SendToBack_OverlayStaticShape(r^);
end;

procedure TSimMgr_Client.netRecv_CameraController(apRec: PAnsiChar;
  aSize: Word);
var
  r : ^TRec_CameraController;
begin
  r := @apRec^;

  if r^.cmd = CORD_ID_CAMCON_TRACK_POS then
    EventManager.OnCameraTrackPosition;
end;

procedure TSimMgr_Client.netRecv_CameraData(apRec: PAnsiChar; aSize: Word);
var
  rec: ^TRec_CameraController;
begin
  rec := @apRec^;

  case rec.cmd of
    CORD_ID_CAMCON_REPOS_LAT:
      FLatitude := rec.valueDbl;
    CORD_ID_CAMCON_REPOS_LONG:
      FLongitude := rec.valueDbl;
  end;

//  fmMainDashboard.//UpdateCameraLongLat;
end;

procedure TSimMgr_Client.netRecv_CmdBombProperty(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecBombProperty;
begin
  inherited;

  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  EventManager.OnUpdateBombProperty(r^.Param);
end;

procedure TSimMgr_Client.netRecv_CmdBombSyncPanelWeapon(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecBombPanelWeapon;
begin
  inherited;

  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  TT3ClientEventManager(EventManager).OnBombSyncPanel(r^.ParentPlatformID,
     r^.WeaponIndex, r^.NoTarget);

end;

procedure TSimMgr_Client.netRecv_CmdBubbleLauncherProperties(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecCmd_BubbleLauncherProperties;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);
  if aRec^.SessionID <> FSessionID then
    Exit;

  LauncherBubbleProp(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdLaunchMissile(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecCmd_LaunchMissile;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  // check hybrid missile ato bukan
  if aRec^.Order = CORD_ID_launch_hybrid then
    // launch hybrid
    LaunchHybrid(aRec^)
  else
    LaunchMissile(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdMineProperty(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecMineProperty;
begin
  inherited;

  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  EventManager.OnUpdateMineProperty(r^.Param);
end;

procedure TSimMgr_Client.netRecv_CmdMissileEngageProperties(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecEngagementModeWeapon;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  LaunchMissileEngageProps(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdMissileProperties(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecFiringModeWeapon;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  if Assigned(ControlledPlatform) then
  begin
//    if aRec^.PlatformID = ControlledPlatform.InstanceIndex then
      LaunchMissileProps(aRec^);
  end;
end;

procedure TSimMgr_Client.netRecv_CmdLaunchTorpedo(apRec: PAnsiChar;
  aSize: word);
var
  aRec: ^TRecCmd_LaunchMissile;
begin
  aRec := @apRec^;
  LogEventRecv(aRec^.pid.recID);

  if aRec^.SessionID <> FSessionID then
    Exit;

  LaunchTorpedo(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdGunFire(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmd_GunFire;
begin
  aRec := @apRec^;

  if aRec^.SessionID <> FSessionID then
    Exit;

  LogEventRecv(aRec^.pid.recID);

  GunFire(aRec^);
end;

procedure TSimMgr_Client.netRecv_CmdGunFireState(apRec: PAnsiChar; aSize: word);
//var
//  aRec: ^TRecCmd_GunFireState;
begin
//  aRec := @apRec^;

//  if aRec^.SessionID <> FSessionID then
//    Exit;

//  LogEventRecv(aRec^.pid.recID);
//  Log('Received from Server Gun Fire order id : ' + IntToStr(aRec^.OrderID)
//      + ' quantity : ' + IntToStr(aRec^.GunCapacityRemain));

//  GunFire(aRec^);

//  if aRec^.TargetPlatformID = ControlledPlatform.InstanceIndex then
//  begin
//    if ISInstructor then
//      frmTacticalDisplay.addStatus(ControlledPlatform.TrackLabel +
//          ' UNDER GUNFIRE ATTACK')
//    else
//      frmTacticalDisplay.addStatus(IntToStr(ControlledPlatform.TrackNumber)
//          + ' UNDER GUNFIRE ATTACK');
//  end;
end;

procedure TSimMgr_Client.netRecv_CmdGunFlash(apRec: PAnsiChar; aSize: Word);
var
  rec : ^TRecCmd_FlashPoint;
begin
  rec := @apRec^;

  FlashPointNGS.PosX := rec.posX;
  FlashPointNGS.PosY := rec.posY;
  FlashPointNGS.Visible := True;
end;

procedure TSimMgr_Client.netSend_CmdGameControl(r: TRecCmd_GameCtrl);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_GAME_CTRL, @r);
end;

procedure TSimMgr_Client.netSend_CmdLaunchRP(r: TRecCmd_LaunchRP);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCH_RUNTIME_PLATFORM, @r);
end;

procedure TSimMgr_Client.netSend_CmdLaunchChaff(r: TRecCmd_LaunchChaff);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCH_CHAFF, @r);
end;

procedure TSimMgr_Client.netSend_CmdLaunchChaffState
  (r: TRecCmd_LaunchChaffState);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCHER_CHAFF_STATE, @r);
end;

procedure TSimMgr_Client.netSend_CmdLauncherChaffProp
  (r: TRecCmd_ChaffLauncherProperties);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCHER_CHAFF_PROPS, @r);
end;

procedure TSimMgr_Client.netSend_CmdLaunchBubble(r: TRecCmd_LaunchBubble);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCH_BUBBLE, @r);
end;

procedure TSimMgr_Client.netSend_CmdLaunchBubbleState
  (r: TRecCmd_LaunchBubbleState);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCHER_BUBBLE_STATE, @r);
end;

procedure TSimMgr_Client.netSend_CmdLauncherBubbleProp
  (r: TRecCmd_BubbleLauncherProperties);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCHER_BUBBLE_PROPS, @r);
end;

procedure TSimMgr_Client.netSend_CmdLaunchMine(r: TRecCmd_LaunchMine);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCH_MINES, @r);
end;

procedure TSimMgr_Client.netSend_CmdLastUpdatePlatform(
  rec: TRecCmd_LastUpdatePlatform);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_LASTUPDATE_PLATFORM, @rec);
end;

procedure TSimMgr_Client.netSend_CmdLaunchBomb(r: TRecCmd_LaunchBomb);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCH_BOMB, @r);
end;

procedure TSimMgr_Client.netSend_CmdLaunchSonobuoy(r: TRecCmd_LaunchSonobuoy);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCH_SONOBUOY, @r);
end;

procedure TSimMgr_Client.netSend_CmdLaunchNonRP(r: TRecCmd_LaunchNonRP);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LAUNCH_NON_RUNTIME_PLATFORM, @r);
end;

procedure TSimMgr_Client.netSend_CmdOverlayStaticShape(r: TRecCmd_OverlayStaticShape);
begin
  if ISInstructor or ISWasdal then
    r.Cubicle := 0
  else
    r.Cubicle := FMyCubGroup.FData.Group_Index;

  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_OVERLAYSTATICSHAPE, @r);
end;

procedure TSimMgr_Client.netSend_CmdOverlayTemplate(r: TRecCmd_OverlayTemplate);
begin
  r.SessionID := FSessionID;

  VNetClient.SendCommand(CPID_CMD_OVERLAYTEMPLATE, @r);
end;

procedure TSimMgr_Client.netSend_CmdTorpedoProperty(Platfrm_ID, TorpType,
   Order_type, WeaponIndex : Integer; Weapon_Name : string; Temp : Double);
var
  r: TRecTorpedoProperty;
begin
  r.ParentPlatformID := Platfrm_ID;
  r.WeaponIndex := WeaponIndex;
  r.WeaponName := Weapon_Name;
  r.OrderType := Order_type;
  r.TorpType := TorpType;
  r.Param := Temp;

  r.SessionID := FSessionID;

  VNetClient.SendCommand(CPID_TORPEDO_PROPERTY, @r);
end;

procedure TSimMgr_Client.netSend_CmdTorpedoSyncPanelWeapon(
  r: TRecTorpedoPanelWeapon);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_TORPEDO_SYNC_PANEL_WEAPON, @r);
end;

procedure TSimMgr_Client.netSend_BringToFrontDynamicShape(
  r: TRecCmd_OverlayDynamicShape);
begin
  if ISInstructor or ISWasdal then
    r.Cubicle := 0
  else
    r.Cubicle := FMyCubGroup.FData.Group_Index;

  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_BRINGTOFRONT_OVERLAYDYNAMICSHAPE, @r);
end;

procedure TSimMgr_Client.netSend_BringToFrontStaticShape(
  r: TRecCmd_OverlayStaticShape);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_BRINGTOFRONT_OVERLAYSTATICSHAPE, @r);
end;

procedure TSimMgr_Client.netSend_CameraController(
  var rec: TRec_CameraController);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_CAMERA_CONTROLLER, @rec);
end;

procedure TSimMgr_Client.netSend_CmdBombProperty(Platfrm_ID, InstanceIndex : Integer;
    Weapon_Name: string; Temp: Integer);
var
  r: TRecBombProperty;
begin
  r.ParentPlatformID := Platfrm_ID;
  r.WeaponIndex := InstanceIndex;
  r.WeaponName  := Weapon_Name;
  r.Param := Temp;

  r.SessionID := FSessionID;

  VNetClient.SendCommand(CPID_BOMB_PROPERTY, @r);
end;

procedure TSimMgr_Client.netSend_CmdMineProperty(Platfrm_ID, InstanceIndex: Integer;
    Weapon_Name: string; Temp: Double);
var
  r: TRecMineProperty;
begin
  r.ParentPlatformID := Platfrm_ID;
  r.WeaponIndex := InstanceIndex;
  r.WeaponName := Weapon_Name;
  r.Param := Temp;

  r.SessionID := FSessionID;

  VNetClient.SendCommand(CPID_MINE_PROPERTY, @r);
end;

procedure TSimMgr_Client.netSend_CmdBombSyncPanelWeapon(r: TRecBombPanelWeapon);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_BOMB_SYNC_PANEL_WEAPON, @r);
end;

procedure TSimMgr_Client.netSend_CmdCameraTrackPos(const aLat, aLong: Double);
var
  rec : TRec_CameraController;
begin
  rec.SessionID := FSessionID;

  rec.cmd := CORD_ID_CAMCON_REPOS_LAT;
  rec.valueDbl := aLat;
  VNetClient.SendCommand(CPID_CMD_CAMERA_CONTROLLER, @rec);

  rec.cmd := CORD_ID_CAMCON_REPOS_LONG;
  rec.valueDbl := aLong;
  VNetClient.SendCommand(CPID_CMD_CAMERA_CONTROLLER, @rec);
end;

procedure TSimMgr_Client.netSend_CmdDDisembarkPersonelTemporary(
  r: TRecCmd_DisembarkPersonelTemporary);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_DISEMBARK_PERSONEL_TEMPORARY, @r);
end;

procedure TSimMgr_Client.netSend_CmdDecoys(rec: TRecCmdDecoys);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_DECOYS, @rec);
end;

procedure TSimMgr_Client.netSend_CmdDEmbarkPersonelTemporary(
  r: TRecCmd_EmbarkPersonelTemporary);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_EMBARK_PERSONEL_TEMPORARY, @r);
end;

procedure TSimMgr_Client.netSend_CmdTransport(r: TRecCmd_Transport);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_TRANSPORT, @r);
end;

procedure TSimMgr_Client.netSend_CmDTransportProcess(
  r: TRecCmd_TransportProcess);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_TRANSPORT_PROCESS, @r);
end;

procedure TSimMgr_Client.netSend_EmbarkedPlatformData(
  r: TRec_EmbarkedPlatformData);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_EMBARKED_PLATFORM_DATA, @r);
end;

procedure TSimMgr_Client.netSend_CmdDetectabilityChange(rec: TRecDetectability);
begin
  rec.SessionID := SessionID;
  VNetClient.SendCommand(CPID_EDIT_DETECTABILITY, @rec);
end;

procedure TSimMgr_Client.netSend_CmdOverlayDynamicShape(r: TRecCmd_OverlayDynamicShape);
begin
  if ISInstructor or ISWasdal then
    r.Cubicle := 0
  else
    r.Cubicle := FMyCubGroup.FData.Group_Index;

  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_OVERLAYDYNAMICSHAPE, @r);
end;

procedure TSimMgr_Client.netSend_CmdDynamicTrack(r: TRecCmd_OverlayDynamicTrack);
begin
  r.SessionID := FSessionID;

  if ISInstructor or ISWasdal then
    r.Cubicle := 0
  else
    r.Cubicle := FMyCubGroup.FData.Group_Index;

  VNetClient.SendCommand(CPID_CMD_DYNAMIC_TRACK, @r);
end;

procedure TSimMgr_Client.netSend_Cmd_MergeTrack(r: TRecCmd_MergeTrack);
begin
  r.SessionID := FSessionID;
  r.GroupID := self.FMyCubGroup.FData.Group_Index;

  VNetClient.SendCommand(CPID_CMD_MERGE_TRACK, @r);
end;

procedure TSimMgr_Client.netSend_Cmd_State_Logistic(rec: TRecCmd_State_Logistic);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_LOGISTIC_STATUS, @rec);
end;

procedure TSimMgr_Client.netSend_CopyChaffLauncherProperty(
  r: TRecCmd_LaunchChaffState);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CHAFF_PROPERTY, @r);
end;

procedure TSimMgr_Client.netSend_Cmd_Change_Logistic(
  rec: TRecCmd_Change_Logistic);
begin
  rec.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_CHANGE_LOGISTIC, @rec);
end;

procedure TSimMgr_Client.netSend_Cmd_Change_SystemState(
  rec: TRecCmd_Change_SystemState);
begin
   rec.SessionID := FSessionID;
   VNetClient.SendCommand(CPID_CMD_CHANGE_SYSTEMSTATE, @rec);
end;

procedure TSimMgr_Client.netSend_cmd_ControlledShip(r: TRec_ControlledShip);
begin
  r.SessionID := FSessionID;

  if r.Controlled = True then
     r.ControlledName := FMyConsoleName;

  VNetClient.SendCommand(CPID_CMD_CONTROL_VEHICLE, @r);
end;

procedure TSimMgr_Client.netSend_Cmd_FireControl(r: TRecCmd_FC);
var
  grp: T3CubicleGroup; // mk 03052012
begin
  r.SessionID := FSessionID;
  
  grp := FScenario.CubiclesGroupsListFromDB.GetGroupOf_PlatformIndex(r.PlatformParentID) ;
  if Assigned(grp) then
    r.GroupID := grp.FData.Group_Index
  else
    r.GroupID := 0;

  VNetClient.SendCommand(CPID_CMD_ASSIGN_FIRECONTROL, @r);
end;

procedure TSimMgr_Client.netSend_CmdRemovePlatfromByOperator
  (r: TRecCmd_SelectPlatformToRemove);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_REMOVE_PLATFORM, @r);
end;

procedure TSimMgr_Client.netSend_CmdRemoveTemporary(r: TRecCmd_SelectPlatformToRemove);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_REMOVE_PLATFORM, @r);
end;

procedure TSimMgr_Client.netSend_CmdrReturnToBase(r: TRecCmd_ReturnToBase);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_DISEMBARK_TRANSPORT, @r);
end;

procedure TSimMgr_Client.netSend_Vectac(r: TRecVectac);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_VECTAC, @r);
end;

procedure TSimMgr_Client.netSend_VoipControlledChanged(const aNewPID: integer);
// sent to voip
var
  r: TRecVoip_SelectPlatform;
begin
  r.PlatfomID := aNewPID;
  r.Command := 0;
  r.SessionID := FSessionID; ;

  VNetVoipCtrlServer.SendToVoipCtrl(CPID_VOIP_PLATFORM_SELECT, @r);
end;

procedure TSimMgr_Client.netVBSOnConnected(sender: TObject);
begin
  OnLogStr('netVBSOnConnected', 'Connected to VBS Socket');
end;

procedure TSimMgr_Client.netVBSOnDisConnected(sender: TObject);
begin
  OnLogStr('netVBSOnDisConnected', 'Disonnected to VBS Socket');
end;

procedure TSimMgr_Client.netRecv_CmdGameControl(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_GameCtrl;
  obj : TSimObject;
  i : Integer;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

  VNetClient.GameCtrl := r^.GameCtrl;

  case r^.GameCtrl of
    CORD_ID_start:
      begin
        GameSpeed := 1.0;
        GameStart;

        isFirstStart := false;

        for i := 0 to SimPlatforms.itemCount do begin
          obj := SimPlatforms.getObject(i);
          if obj is TT3Vehicle then
            TT3Vehicle(obj).GameSpeed := r^.GameSpeed;
        end;
      end;
    CORD_ID_pause:
      begin
        GamePause;
        GameSpeed := 0.0;
      end;
    CORD_ID_game_speed:
      begin ;
        GameSpeed := r^.GameSpeed;

        for i := 0 to SimPlatforms.itemCount do begin
          obj := SimPlatforms.getObject(i);
          if obj is TT3Vehicle then
            TT3Vehicle(obj).GameSpeed := r^.GameSpeed;
        end;
      end;
    CORD_ID_gototime   :
    begin
      if r^.GotoTime = 1000 then   // if specific time choosen
        FTimeToGo := r^.TimeTogo;

      GotoTime(r^.GotoTime);

    end;
    CORD_ID_finishgoto   :
    begin
      {
        since v0.2 of FGotoThread_OnRunning applied, update progress to 100,
        and finished goto process on clients
      }
      if Assigned(FOnUpdateGotoProgress) then
        FOnUpdateGotoProgress(100);

      FIsGotoMode := False;
    end;
  end;

end;

procedure TSimMgr_Client.netRecv_CmdTorpedoProperty(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecTorpedoProperty;
begin
  inherited;

  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  EventManager.OnUpdateTorpedoProperty(r^);
end;

procedure TSimMgr_Client.netRecv_CmdTorpedoSyncPanelWeapon(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecTorpedoPanelWeapon;
begin
  inherited;

  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  TT3ClientEventManager(EventManager).OnTorpedoSyncPanel(r^.ParentPlatformID,
                        r^.TorpType, r^.WeaponIndex, r^.Param1);
end;

procedure TSimMgr_Client.netRecv_StateServer(apRec: PAnsiChar; aSize: Word);
var
  r : ^TRec_StateServer;
  o : TSimObject;
  v : TT3Vehicle;
  i : Integer;
begin
  r := @apRec^;

  if r^.Mode = 1 then
  begin
    FIsConnected3D := Boolean(r^.State);

    {Prince}
    TT3ClientEventManager(EventManager).on3DConnection(FIsConnected3D);

    for i := 0 to SimPlatforms.itemCount do
    begin
      o := SimPlatforms.getObject(i);
      if o is TT3Vehicle then
      begin
        v := TT3Vehicle(o);
        v.Connect3D := Boolean(r^.State);

//        {Prince}
//        v.isRampOpen := False;
      end;
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_SyncBearingMissile(apRec: PAnsiChar;
  aSize: word);
var
  rec : ^TRec_SyncTarget;
  wpn, pi : TT3PlatformInstance;
begin
  rec := @apRec^;

  wpn := FindT3PlatformByID(rec.WeaponID);
  pi  := FindT3PlatformByID(rec.TargetID);

  if wpn is TT3Missile then
    TT3Missile(wpn).SetTargetObject(pi);
end;

procedure TSimMgr_Client.netRecv_SynchMissile(apRec: PAnsiChar; aSize: word);
begin

end;

procedure TSimMgr_Client.netRecv_SynchTorpedo(apRec: PAnsiChar; aSize: word);
begin

end;

procedure TSimMgr_Client.netRecv_SynchVehicle(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecSynch_Vehicle;
  pi: TT3PlatformInstance;
begin
  r := @apRec^;
  if r^.SessionID <> FSessionID then Exit;

  pi := FindT3PlatformByID(r^.PlatformID);
  if not(pi is TT3Vehicle) then Exit;

  with TT3Vehicle(pi) do
  begin
    Dormant := r^.DormantState;
    if ISInstructor then
    begin
      if not r^.DormantState then
        LoadPlatformSymbol;
    end;

    OnGrounded := r^.OnGrounded;
    OnLand := r^.OnLand;
    DamageSensor := r^.DamageSensor;
    DamageWeapon := r^.DamageWeapon;
    DamageComm := r^.DamageComm;
    DamageHelm := r^.DamageHelm;
    FuelLeakage := r^.FuelLeakage;
    DamagePropulsion := r^.DamagePropulsion;

    FuelRemaining := r^.FuelRemaining;
  end;
end;

procedure TSimMgr_Client.netRecv_Synch_ESMvarian(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_EsmVariance;
  aPlatform: TT3PlatformInstance;
  aDetect: TT3DetectedTrack;
  aESM: TT3EsmTrack;
  obj : TObject;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then Exit;

  if (ISInstructor) or (ISWasdal) then Exit;

  if (FMyCubGroup = nil) then Exit;

  if r^.GroupID <> FMyCubGroup.FData.Group_Index then Exit;

  aPlatform := FindT3PlatformByID(r^.ParentDetectedID);
  if aPlatform = nil then Exit;       //mk cba

  obj := TT3Vehicle(aPlatform).getDevice(r^.DetectedID, TT3Radar);
  if obj = nil then Exit;

  aDetect   := findDetectedTrack(TSimObject(obj)) as TT3DetectedTrack;
  if aDetect = nil then Exit;       //mk cba

  aESM := FindESMByDetectedTrack(IntToStr(r^.EsmTrackNumber), aDetect);
  if aESM = nil then Exit;

  if Assigned(aESM.DetectBy) and (aESM.DetectBy is TT3ESMSensor) then
  begin
    if TT3ESMSensor(aESM.DetectBy).InstanceIndex = r^.SensorID then
    begin
      aESM.Variance := r^.nVariance;
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_Synch_Object(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecUDP_Synch_Obj;
  pi: TT3PlatformInstance;
  v: TT3Vehicle;
  s: string;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

  case r^.PlatformType of
    CPT_PLATFORM_VEHICLE:
      begin
        pi := FindT3PlatformByID(r^.PlatformID);

        if pi = nil then
          Exit;

        if not(pi is TT3Vehicle) then
          Exit;

        v := pi as TT3Vehicle;

        if Assigned(OnLogTemporary) then
          OnLogTemporary('Sync Object : ' + v.InstanceName + 'Value Health : '
                          + FormatFloat('0.00', r^.dValue2));

        try
          case r^.SynchType of
            CST_Health_Percent:
              begin
                v.HealthPercent := r^.dValue1;
                v.Health        := r^.dValue2;
                v.Dormant       := r^.bValue;
              end;
          end;
        except
           on EAccessViolation do begin
             s := 'platform id: ' + IntToStr(r^.PlatformID) + ', v: ' + v.InstanceName;
             s := s + Format('h: %2.2f h: %2.2f ',[r^.dValue1, r^.dValue2]); ;
             ShowMessage(s);
           end;
        end;
      end;
  end;

end;

procedure TSimMgr_Client.netRecv_Synch_Pos_VBS(apRec: PAnsiChar; aSize: word);
var
  sIP : string;
  r : ^TRecUDP_PlatformMovement;
begin
  inherited;

  r := @apRec^;

  sIP := LongIp_To_StrIp(r^.PId.ipSender);

//  OnLogStr('TSimMgr_Client.netRecv_Synch_Pos_VBS', 'Receive from : ' + sIP);
end;

procedure TSimMgr_Client.netRecv_Synch_WaypointData(apRec: PAnsiChar;
  aSize: word);
var
  rec: ^TRecSync_WaypointDataTo3D;
  Pi: TT3PlatformInstance;
  Ve: TT3Vehicle;
begin
  rec := @apRec^;

  Pi := FindT3PlatformByID(rec^.PlatformID);

  case rec^.OrderID of
    CORD_ID_WAYPOINT_START :
    begin
      if Pi is TT3Vehicle then
      begin
        Ve := TT3Vehicle(Pi);
        Ve.Waypoints.NextNodeID := rec^.WaypointID;
        Ve.OrderedHeading := rec^.Course;
        //Ve.Heading := rec^.Course;
        Ve.Speed := rec^.Speed;
        Ve.OrderedSpeed := rec^.Speed;
      end;
    end;
    CORD_ID_WAYPOINT_END :
    begin
      if Pi is TT3Vehicle then
      begin
        Ve := TT3Vehicle(Pi);
        Ve.Waypoints.TerminationAction;
        case Ve.Waypoints.Termination of
          wtLH, wtTH, wtSp : begin
            TVehicle_Definition(Ve.UnitDefinition).GuidanceType := vgtStraightLine;
            Ve.OrderedHeading := rec^.Course;
            Ve.Heading := rec^.Course;
            Ve.OrderedSpeed := rec^.Speed;
            Ve.Speed := rec^.Speed;
          end;
          wtRP : begin
            Ve.OrderedHeading := rec^.Course;
            Ve.Heading := rec^.Course;
          end;
        end;
      end;
    end;
  end;

end;

procedure TSimMgr_Client.netRecv_Vectac(apRec: PAnsiChar; aSize: word);
var
  rec : ^TRecVectac;
  commander : TT3Vehicle;
  vectac : TT3Vectac;
  visible : Boolean;
begin
  inherited;

  rec := @apRec^;

  commander := FindT3PlatformByID(rec^.CommanderID) as TT3Vehicle;
  vectac := commander.Weapons.Items[commander.Weapons.Count-1];

  if not ISInstructor or not ISWasdal then
  begin
    case rec^.cmd of
      CPID_CMD_VECTAC_PLAN   :
                              begin
                                if FMyCubGroup <> nil then
                                  vectac.Planned := FMyCubGroup.IsGroupMember(rec^.CommanderID);
                              end;
      CPID_CMD_VECTAC_LAUNCH :
                              begin
                                if FMyCubGroup <> nil then
                                begin
                                  visible := FMyCubGroup.IsGroupMember(rec^.CommanderID);
                                  vectac.ConfirmDrop := visible;
                                  vectac.VisibleDogBox := visible;
                                end;
                              end;
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_CmdLaunch_RP(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_LaunchRP;
  pf : TT3PlatformInstance;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

  case r^.OrderID of
    CORD_ID_LAUNCH_SINGLE_RUNTIME_PLATFORM :
    begin
      pf := LaunchRuntimePlatform(r^);
      if pf = nil then Exit;

      pf.isInstructor := FIsInstructor;
      pf.isWasdal := FIsWasdal;

      if pf is TT3Vehicle then
        TT3Vehicle(pf).PlatformViewMode := FPlatformViewMode;

      pf.Selected := True;

    end;
    CORD_ID_LAUNCH_MULTI_RUNTIME_PLATFORM :
    begin
      case r^.OrderType of
        CORD_ID_START_SEND_DATA_RUNTIME_PLATFORM :
        begin

        end;
        CORD_ID_REQ_NEXT_DATA_RUNTIME_PLATFORM :
        begin
          pf := LaunchRuntimePlatform(r^);
          if pf = nil then Exit;

          TT3Vehicle(pf).Connect3D := FIsConnected3D;
          pf.isInstructor := FIsInstructor;
          pf.isWasdal := FIsWasdal;

          if pf is TT3Vehicle then
            TT3Vehicle(pf).PlatformViewMode := FPlatformViewMode;
        end;
        CORD_ID_END_SEND_DATA_RUNTIME_PLATFORM :
        begin

        end;
      end;
    end;
  end;


end;

procedure TSimMgr_Client.netRecv_CmdShipingRoute(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_ShipingRoute;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  CreateShipingRoute(r^);

end;

procedure TSimMgr_Client.netRecv_SendToBack_OverlayDynamicShape(
  apRec: PAnsiChar; aSize: word);
var
  r : ^TRecCmd_OverlayDynamicShape;
begin
   r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  if r.Cubicle = 0 then
  begin
    TT3ClientEventManager(EventManager).SendToBack_OverlayDynamicShape(r^);
  end
  else
  begin
    if FMyCubGroup <> nil then
    begin
      if FMyCubGroup.FData.Group_Index = r^.Cubicle then
        TT3ClientEventManager(EventManager).SendToBack_OverlayDynamicShape(r^);
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_Session_Cub_Assign(apRec: PAnsiChar;
  aSize: word);
var
  rq: ^TRecCubAssign;
  ip, cubname: string;
  GrpID: integer;
  grp: T3CubicleGroup;
begin
  rq := @apRec^;
  LogEventRecv(rq^.pid.recID);

  ip := LongIp_To_StrIp(rq^.LongIP);

  case rq.cmdID of
    CMD_ASSIGN_INFO_START:
      begin
        if rq^.LongIP = 0 then
        begin
          CubAssignList.ClearAllCubicleName;
        end;

      end;
    CMD_ASSIGN_INFO_DATA:
      begin
        GrpID := rq^.GroupID;

        cubname := FCubicleList.GetCubicleName(ip);
        grp := CubAssignList.GetGroupByID(GrpID) as T3CubicleGroup;
        if grp <> nil then
          grp.CubicleName := cubname;

      end;
    CMD_ASSIGN_INFO_END:
      begin
      end;
  end;

end;

procedure TSimMgr_Client.netRecv_SincBOLWMissile(apRec: PAnsiChar; aSize: word);
begin
  inherited;
end;

procedure TSimMgr_Client.netRecv_SincMissileEnvi(apRec: PAnsiChar; aSize: word);
begin
  inherited;
end;

procedure TSimMgr_Client.netRecv_SincRBLWMissile(apRec: PAnsiChar; aSize: word);
begin
  inherited;
end;

procedure TSimMgr_Client.netRecv_SincWaypoint(apRec: PAnsiChar; aSize: word);
begin
  inherited;
end;

procedure TSimMgr_Client.netRecv_cmd_environment(apRec: PAnsiChar; aSize: word);
begin
  inherited;

  EventManager.OnUpdateEnvironment;
end;

procedure TSimMgr_Client.netRecv_cmd_snapshot(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCommandSnapshot;
  orderID : byte ;
  msg : string ;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);
  if r^.SessionID <> FSessionID then
    Exit;

  orderID := r^.OrderID ;
  msg     := r^.SnapshotName ;

  case orderID of
    CPID_CMD_SNAPSHOT_SUCCESS :
    begin
      msg := ' "'+msg+'" success.';
      TT3ClientEventManager(EventManager).OnSnapshotEventDone(msg);
      FOnLogStr('netRecv_cmd_snapshot', 'Snapshot :: '+msg);
    end;
    CPID_CMD_SNAPSHOT_FAIL    :
    begin
      msg := 'save '+msg+' failed' ;
      TT3ClientEventManager(EventManager).OnSnapshotEventDone(msg);
      FOnLogStr('netRecv_cmd_snapshot', 'Snapshot :: '+msg);
    end;
    CPID_CMD_SNAPSHOT_EXIST   :
    begin
      msg := msg +' is exist' ;
      TT3ClientEventManager(EventManager).OnSnapshotEventDone(msg);
      FOnLogStr('netRecv_cmd_snapshot', 'Snapshot :: '+msg);
    end;
    CPID_CMD_WAIT_SERVER      :
    begin
      msg := 'Please wait ...';
      //TT3ClientEventManager(EventManager).onUpdateStateServer(msg);
    end;
    CPID_CMD_FINISH_SERVER    :
    begin
      msg := '';
     //TT3ClientEventManager(EventManager).onUpdateStateServer(msg);
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_Cmd_State_Logistic(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_State_Logistic;
begin
  rec := @apRec^;
  LogEventRecv(rec^.pid.recID);

  if rec^.SessionID <> FSessionID then
    Exit;

  ChangeLogisticState(rec^);
end;

procedure TSimMgr_Client.netRecv_ControlledShip(apRec: PAnsiChar; aSize: word);
var
  r : ^TRec_ControlledShip;
  sip : string;
  Pi : TT3PlatformInstance;
  //CtrlVehicle : TVehicle_Control;
begin
  r := @apRec^;

  sip :=  LongIp_To_StrIp(r^.pid.ipSender);
  FOnLogStr('TSimMgr_Client.netRecv_ControlledShip', sIP + ' : ' + getPacketIDname(r^.pid.recID)
            + #13#10 + 'PlatformID : ' + IntToStr(r^.PlatformID)
            + #13#10 + 'Controlled : ' + BoolToStr(r^.Controlled)
            + #13#10 + 'Controlled By : ' + r^.ControlledName);

  //if not ISInstructor then
  //begin
    Pi := FindT3PlatformByID(r^.PlatformID);

    if Assigned(Pi) then
    begin
//      PIDControlledPlatform := r^.PlatformID;
      if AnsiCompareStr(TT3Vehicle(Pi).Vehicle_Control.Control_Name, ConsoleName) = 0 then
      begin
        Pi.Controlled := r^.Controlled;
      end;

      TT3Vehicle(pi).Vehicle_Control.Controlled := r^.Controlled;
      TT3Vehicle(Pi).Vehicle_Control.Control_Name := r^.ControlledName;
    end;
  //end;
end;

procedure TSimMgr_Client.netRecv_CopyChaffLauncherProperty(apRec: PAnsiChar;
  aSize: word);
var
  r : ^TRecCmd_LaunchChaffState;
begin
  r := @apRec^;

  CopyChaffLauncherProp(r^)
end;

procedure TSimMgr_Client.netRecv_DataFromVBS(apRec: PAnsiChar; aSize: word);
var
  rec : ^TRec_AOPR_Data_Initialize;
  msg : string ;
  r: TRecCmd_GameCtrl;
begin
  rec := @apRec^;

  case rec^.OrderID of
    CORD_ID_REQ_NEXT_DATA :
    begin
      if FIsFinish3DData = True then
      begin
        msg := 'Please wait ...';
        TT3ClientEventManager(EventManager).onUpdateStateServer(msg);

        FIsFinish3DData := False;

        r.SessionID := SessionID;
        r.GameCtrl  := CORD_ID_pause;
        r.GameSpeed := 0.0;

        VNetClient.SendCommand(CPID_CMD_GAME_CTRL, @r);
      end;
    end;

  end;
end;

procedure TSimMgr_Client.netRecv_DataFromPRSNLVBS(apRec: PAnsiChar; aSize: word);
var
  rec : ^TRec_Personel;
  msg : string ;
  r: TRecCmd_GameCtrl;
begin
  rec := @apRec^;

  case rec^.OrderID of
    CORD_ID_END_SEND_DATA_PRSNL :
    begin
      msg := '';
      TT3ClientEventManager(EventManager).onUpdateStateServer(msg);
      FIsFinish3DData := True;
      OnLogStr('TSimMgr_Client.netRecv_DataFromPRSNLVBS', 'Finish Send Data vbs');

//      r.SessionID := SessionID;
//      r.GameCtrl  := CORD_ID_start;
//      r.GameSpeed := 1.0;
//
//      VNetClient.SendCommand(CPID_CMD_GAME_CTRL, @r);
    end;

  end;
end;

procedure TSimMgr_Client.netRecv_CmdRemovePlatfromByOperator(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecCmd_SelectPlatformToRemove;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);
  if r^.SessionID <> FSessionID then
    Exit;

  if r.IdAction = 0 then
    RemoveTemporary(r^)
  else
    RemovePlatformByOperator(r^);

  TT3ClientEventManager(EventManager).onRefreshAssumeControll;
end;

procedure TSimMgr_Client.netRecv_CmdReturnToBase(apRec: PAnsiChar; aSize: word);
var
  aRec: ^TRecCmd_ReturnToBase;

begin
  aRec := @apRec^;
  if aRec^.SessionID <> FSessionID then
    Exit;

  ReturnTobase(aRec^);

  Log('TSimMgr_Client.netRecv_CmdReturnToBase', 'Return To Base Platform : ' + aRec^.PlatformClassIden + #13#10
                  + 'ID Embark platform : ' + (aRec^.BaseIdentifier));

  LogEventRecv(aRec^.pid.recID);
end;

procedure TSimMgr_Client.netRecv_CmdLaunch_NonRP(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_LaunchNonRP;
  nrp: TT3PlatformInstance;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

  nrp := LaunchNonRealtimeRuntimePlatform(r^);

  if nrp <> nil then begin
    EventManager.OnNonRealTimeAdded(nrp);
    nrp.isInstructor := FIsInstructor;
    nrp.isWasdal := FIsWasdal;
  end;

//  utk sinkron create obj NRP saya coment ini
//  if ISInstructor and (r^.NRPGroupID = 0) then
//  begin
//    nrp := LaunchNonRealtimeRuntimePlatform(r^);
//    if nrp <> nil then
//      EventManager.OnNonRealTimeAdded(nrp);

//    Exit;
//  end;

//  if Assigned(FMyCubGroup) then
//  begin
//    if FMyCubGroup.FData.Group_Index = r^.NRPGroupID then begin
//      nrp := LaunchNonRealtimeRuntimePlatform(r^);

//      if nrp <> nil then
//        EventManager.OnNonRealTimeAdded(nrp);
//    end;
//  end;
end;

procedure TSimMgr_Client.netRecv_CmdOverlayTemplate(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_OverlayTemplate;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  CreateOverlayTamplate(r^);

end;

procedure TSimMgr_Client.netRecv_CmdOverlayStaticShape(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecCmd_OverlayStaticShape;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r.SessionID <> FSessionID then
    Exit;

  CreateOverlayShape(r^);

end;

procedure TSimMgr_Client.netRecv_CmdOverlayDynamicShape(apRec: PAnsiChar; aSize: word);
var
  r : ^TRecCmd_OverlayDynamicShape;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  if r.Cubicle = 0 then
  begin
    TT3ClientEventManager(EventManager).OnOverlayDynamicShape(r^);
  end
  else
  begin
    if FMyCubGroup <> nil then
    begin
      if FMyCubGroup.FData.Group_Index = r^.Cubicle then
        TT3ClientEventManager(EventManager).OnOverlayDynamicShape(r^);
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_Cmd_MergeTrack(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_MergeTrack;
  aPlatform: TT3PlatformInstance;
  aDetect: TT3DetectedTrack;
  aESM: TT3EsmTrack;
begin
  r := @apRec^;

  if r^.SessionID <> FSessionID then
    Exit;

  if (ISInstructor) or (ISWasdal) then
    Exit;

  if (FMyCubGroup = nil) then
    Exit;

  if r^.GroupID <> FMyCubGroup.FData.Group_Index then
    Exit;

  aPlatform := FindT3PlatformByID(r^.DetectedTrackNumber);
  if aPlatform = nil then
    Exit;       //mk cba

  aDetect := findDetectedTrack(aPlatform) as TT3DetectedTrack;
  if aDetect = nil then
    Exit;       //mk cba

  aESM := FindESMByTrackNumber(IntToStr(r^.EsmTrackNumber));
  if aESM = nil then
    Exit;       //mk cba

  //merge
  if r^.OrderMerge then
  begin
    aDetect.MergedESM := aESM;
    aESM.IsMerged := True;

    if Assigned(aDetect.OnMerged) then
      aDetect.OnMerged(aDetect);
  end
  // unmerge
  else
  begin
    aESM.IsMerged := false;

    if Assigned(aDetect.OnUnmerged) then
      aDetect.OnUnmerged(aDetect);

    aDetect.MergedESM := nil;
  end;

  LogEventRecv(r^.pid.recID);
end;

procedure TSimMgr_Client.netRecv_Cmd_RampController(apRec: PAnsiChar;aSize: word);
var
  rec: ^TRecCmd_RampController;
begin
  rec := @apRec^;
  LogEventRecv(rec^.pid.recID);

  if rec = nil then
    Exit;

  if rec^.SessionID <> FSessionID then
    Exit;

  ChangeRampState(rec^);
end;

procedure TSimMgr_Client.netRecv_Cmd_Change_Logistic(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_Change_Logistic;
begin
  rec := @apRec^;
  LogEventRecv(rec^.pid.recID);

  if rec^.SessionID <> FSessionID then
    Exit;

  ChangeLogistic(rec^);
end;

procedure TSimMgr_Client.netRecv_Cmd_Change_SystemState(apRec: PAnsiChar;
  aSize: word);
var
  rec: ^TRecCmd_Change_SystemState;
begin
  rec := @apRec^;
  LogEventRecv(rec^.pid.recID);

  if rec^.SessionID <> FSessionID then
    Exit;

  ChangeSystemState(rec^);
end;

procedure TSimMgr_Client.netRecv_Cmd_FireControl(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_FC;
  objPlatform: TSimObject;
  objDetected: TSimObject;

  objParentPlatform: TSimObject;
  tempPlatform: TT3PlatformInstance;
  radar: TT3Radar;
  isExist: Boolean;
  i: integer;
begin
  r := @apRec^;
  if (r^.SessionID <> SessionID) then
    Exit;

  objParentPlatform := FindT3PlatformByID(r^.PlatformParentID);
  if not Assigned(objParentPlatform) then
    Exit;

  radar := nil;
  if objParentPlatform is TT3Vehicle then
  begin
    radar := TT3Vehicle(objParentPlatform).getDevice(r^.FCRadarID, TT3Radar) as TT3Radar;
  end;

  if Assigned(radar) then
  begin
    case r^.OrderID of
      CORD_FC_BREAKALL:
      begin
        if radar.AssignedTrack <> nil then
        begin
          for i := 0 to radar.AssignedTrack.Count - 1 do
          begin
            tempPlatform := radar.AssignedTrack.Items[i];
            tempPlatform.IsAssigned := false;
          end;

          radar.AssignedTrack.Clear;
        end;

        if Assigned(radar.OnFireControlUpdated) then
        begin
          radar.OnFireControlUpdated(radar);
        end;

        Exit;
      end;
    end;

    objPlatform := FindT3PlatformByID(r^.PlatformID);
    if not Assigned(objPlatform) then
      Exit;

    if Assigned(ControlledPlatform) then
    begin
      if objPlatform.Equals(ControlledPlatform) then
      begin
        // jika dia adalah platform yang dikontrol nyalakan status bar FCRControl warna Merah {belum}
        if FMyCubGroup.IsGroupMember(r^.PlatformID) then
        begin
          case r^.OrderID of
            CORD_FC_BREAK, CORD_FC_BREAKALL : TT3PlatformInstance(objPlatform).LockFCR := False;
            CORD_FC_ASSIGN : TT3PlatformInstance(objPlatform).LockFCR := True;
          end;
        end;

        if Assigned(TT3PlatformInstance(objPlatform).OnAssigned) then
          TT3PlatformInstance(objPlatform).OnAssigned
            (objPlatform as TT3PlatformInstance);
      end;
    end;

    if not ISInstructor and not ISWasdal then
    begin
      if (r^.GroupID <> FMyCubGroup.FData.Group_Index) then
        Exit;
    end;

    if Assigned(objPlatform) then
    begin
      objDetected := findDetectedTrack(objPlatform);
    end
    else Exit;

    if Assigned(objDetected) then
      objPlatform := objDetected;

    case r^.OrderID of
      CORD_FC_ASSIGN:
      begin
        isExist := false; // mk
        objPlatform.IsAssigned := True;

        if radar.AssignedTrack <> nil then
        begin
          for i := 0 to radar.AssignedTrack.Count - 1 do
          begin
            if objPlatform.Equals(radar.AssignedTrack.Items[i]) then
            begin
              isExist := True;
              break;
            end;
          end;

          if not isExist then
            radar.AssignedTrack.Add(objPlatform);
        end;
      end;
      CORD_FC_BREAK:
      begin
        isExist := false; // mk
        if radar.AssignedTrack <> nil then
        begin
          if radar.AssignedTrack.Count <= 0 then
            Exit;

          for i := 0 to radar.AssignedTrack.Count - 1 do
          begin
            if objPlatform.Equals(radar.AssignedTrack.Items[i]) then
            begin
              isExist := True;
              break;
            end;
          end;

          if isExist then
          begin
            objPlatform.IsAssigned := false;
            radar.AssignedTrack.Remove(objPlatform);
          end;
        end;
      end;
      CORD_FC_BREAKALL:
      begin
        if radar.AssignedTrack <> nil then
        begin
          for i := 0 to radar.AssignedTrack.Count - 1 do
          begin
            TT3PlatformInstance(radar.AssignedTrack[i]).IsAssigned := false;
            radar.AssignedTrack.Remove(radar.AssignedTrack[i]); // mk 10052012
          end;
        end;
      end;
    end;

    if Assigned(radar.OnFireControlUpdated) then
    begin
      radar.OnFireControlUpdated(radar);
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_platform_cmd(apRec: PAnsiChar; aSize: word);
begin
  inherited;
end;

procedure TSimMgr_Client.netRecv_SetLauncherQty(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_Set_LauncherQty;
  p: TT3PlatformInstance;
  ve: TT3Vehicle;
begin
  inherited;
  rec := @apRec^;

  if rec^.SessionID <> FSessionID then
    Exit;

  p := FindT3PlatformByID(rec^.PlatfomID);
  if (p = nil) then
    Exit;

  ve := TT3Vehicle(p);

  if Assigned(ve.OnUpdateWeapon) then
    ve.OnUpdateWeapon(ve);
end;

procedure TSimMgr_Client.netRecv_SetQuantity(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_Set_Quantity;
  p: TT3PlatformInstance;
  ve: TT3Vehicle;
begin
  inherited;
  rec := @apRec^;

  if rec^.SessionID <> FSessionID then
    Exit;

  p := FindT3PlatformByID(rec^.PlatfomID);
  if (p = nil) then
    Exit;

  ve := TT3Vehicle(p);

  if Assigned(ve.OnUpdateWeapon) then
    ve.OnUpdateWeapon(ve);
end;

procedure TSimMgr_Client.netRecv_SetStatus(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_Set_Status;
  p: TT3PlatformInstance;
  ve: TT3Vehicle;
begin
  inherited;

  rec := @apRec^;

  if rec^.SessionID <> FSessionID then
    Exit;

  p := FindT3PlatformByID(rec^.PlatfomID);

  if not (Assigned(p) and (p is TT3Vehicle)) then
    Exit;

  ve := TT3Vehicle(p);

  if Assigned(ve.OnUpdateWeapon) then
    ve.OnUpdateWeapon(ve);
end;

procedure TSimMgr_Client.netRecv_ShipTouchGround(apRec: PAnsiChar; aSize: Word);
var
  r : ^TRec_ShipTouchGround;
  plat : TT3PlatformInstance;
begin
  r := @apRec^;

  plat := FindT3PlatformByID(r^.PlatformID);
  TT3Vehicle(plat).OnLand := Boolean(r^.IsOnLand);

  if (Boolean(r^.IsOnLand)) then begin
    FOnLogStr('netRecv_cmd_snapshot', plat.InstanceName + ' IsOnLand = True/' + IntToStr(r^.IsOnLand));

    TT3Vehicle(plat).OrderedSpeed := 0;
    TT3Vehicle(plat).WaypointLastSpeed := 0;
    TT3Vehicle(plat).TempSpeed := 0;
  end
  else
    FOnLogStr('netRecv_cmd_snapshot', plat.InstanceName + ' IsOnLand = True/' + IntToStr(r^.IsOnLand));
  //TT3Vehicle(plat).Mover.Speed := 0;
end;

procedure TSimMgr_Client.netRecv_ECMCommand(apRec: PAnsiChar; aSize: word);
var
  rec : ^TRecECMCommand;
  jammerObject, jammerOwner, jammedObject, jammedOwner, detTrack, trackObj : TObject;
  foundParent : boolean;
  i :integer;
begin
  inherited;

  rec := @apRec^;
  jammerObject := nil;

  if rec^.SessionID <> FSessionID then
    Exit;

  jammerOwner := FindT3PlatformByID(rec.JammerObjectOwnerID);
  if Assigned(jammerOwner) then
  begin
    jammerObject := FindT3DeviceByID(TT3DefensiveJammerOnVehicle,
                    TSimObject(jammerOwner),rec.JammerObjectID );
  end;

  if not Assigned(jammerObject) then
    Exit;

  case rec.OrderID of
    CORD_ID_SD_EVTJAMSUCCESS :
      begin
        jammedObject := nil;

        case TJammedObjectType(rec.JammedObjectType) of
          jotFCR :
            begin
              jammedOwner := FindT3PlatformByID(rec.JammedObjectOwnerID);
              if Assigned(jammedOwner) then
                jammedObject := FindT3DeviceByID(TT3Radar,
                                TSimObject(jammedOwner),rec.JammedObjectID );
            end;
          jotMissile :
            jammedObject := FindT3PlatformByID(rec.JammedObjectID);
        end;

        if not Assigned(jammedObject) then
          Exit;

        { apply effect }
        TT3DefensiveJammerOnVehicle(jammerObject).ApplyJammedEffect(jammedObject);

        { hanya berlaku di cubicle saja untuk jam status automatic }
        if (not FIsInstructor or not FIsWasdal) and (jammedObject is TT3Radar) then
        begin
          { if automatic mode, break parent only }
//          if TT3DefensiveJammerOnVehicle(jammerObject).Status = esAutomatic then
//          begin
          foundParent := False;
          detTrack := nil;

          if TT3Radar(jammedObject).AssignedTrack <> nil then
          begin
            for I := 0 to TT3Radar(jammedObject).AssignedTrack.Count - 1 do
            begin
              detTrack := TT3Radar(jammedObject).AssignedTrack.Items[i];

              if detTrack.ClassType = TT3DetectedTrack then
              begin
                trackObj := TT3DetectedTrack(detTrack).TrackObject;

                if trackObj = jammerOwner then
                begin
                  foundParent := true;
                  Break;
                end;
              end;
            end;

            if foundParent then
            begin
              TT3Radar(jammedObject).AssignedTrack.Delete(I);

              if detTrack <> nil then
                TT3DetectedTrack(detTrack).IsAssigned := False;
            end;
          end;
//          end;
        end;

        if jammedObject is TT3Radar then
        begin
          if Assigned(TT3Radar(jammedObject).OnFireControlUpdated) then
            TT3Radar(jammedObject).OnFireControlUpdated(TT3Radar(jammedObject));
        end;
      end;
    CORD_ID_SD_SETMODE,
    CORD_ID_SD_SETMANMODE,
    CORD_ID_SD_SETSPOTNUMBER,
    CORD_ID_SD_SETBEARING,
    CORD_ID_SD_SETTRACK :
      begin
        EventManager.OnECMCommand(jammerObject);
      end;
  end;
end;

procedure TSimMgr_Client.netRecv_EngageTrack(apRec: PAnsiChar; aSize: word);
var
  rec: ^TRecCmd_EngageTrack;
  p, tgt: TT3PlatformInstance;
  ve: TT3Vehicle;
begin
  inherited;

  rec := @apRec^;

  if rec^.SessionID <> FSessionID then
    Exit;

  p := FindT3PlatformByID(rec^.PlatformID);
  tgt := FindT3PlatformByID(rec^.TargetID);
  if (p = nil) then
    Exit;
  ve := TT3Vehicle(p);

  ve.ShipPlatform := p;
  ve.TargetPlatform := tgt;
  ve.MissileID := rec^.MisID;
  ve.isHaveLaunch := rec^.isHaveLaunch;
end;

procedure TSimMgr_Client.netRecv_CmdUpdatePlatform_PROPERTY(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecCmd_Platform_SET_PROPERTY;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);
  if r^.SessionID <> FSessionID then
    Exit;

  UpdatePropertyPlatform(r^);
end;

procedure TSimMgr_Client.netRecv_CmdChangeTrackNumber(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecCmd_Platform_CHANGE_TRACKNUMBER;
begin
  r := @apRec^;

  if r^.SessionID <> FSessionID then
    Exit;

  ChangeTrackNumber(r^);

  LogEventRecv(r^.pid.recID);
end;

procedure TSimMgr_Client.netRecv_CmdDecoys(apRec: PAnsiChar; aSize: word);
var
  r  : ^TRecCmdDecoys;
  decoys : TT3PlatformInstance;
begin
  r   := @apRec^;

  if r^.SessionID <> FSessionID then
    Exit;

  decoys := DeployDecoys(r^);

  if Assigned(decoys) then
  begin
    EventManager.OnDecoysDeployed(decoys.Parent);
    decoys.Parent := nil;
  end;
end;

procedure TSimMgr_Client.netRecv_CmdDetectabilityChange(apRec: PAnsiChar;
  aSize: word);
var
  rec : ^TRecDetectability;
  pi : TT3PlatformInstance;
begin
  rec := @apRec^;
  LogEventRecv(rec^.pid.recID);

  if rec^.SessionID <> FSessionID then
    Exit;

  pi := FindT3PlatformByID(rec^.PlatformID);

  if not Assigned(pi) then
    Exit;

  pi.DetectabilityType := rec^.DetectType;

  EventManager.OnDetectabilityChange(pi);
end;

procedure TSimMgr_Client.netRecv_CmdDynamicTrack(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_OverlayDynamicTrack;
  rec: TRecCmd_OverlayDynamicTrack;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r.SessionID <> FSessionID then
    Exit;

  rec.TemplateName  := r.TemplateName;
  rec.NameTrack   := r.NameTrack;
  rec.IDTrack     := r.IDTrack;
  rec.IdSelectTrack := r.IdSelectTrack;
  rec.Brg         := r.Brg;
  rec.Rng         := r.Rng;
  rec.Rot         := r.Rot;
  rec.Orientation := r.Orientation;
  rec.IdAction    := r.IdAction;

  rec.Idx       := r.Idx;
  rec.Notrack   := r.Notrack;

  if r.Cubicle = 0 then
  begin
    TT3ClientEventManager(EventManager).OnDynamicTrack(rec);
  end
  else
  begin
    if FMyCubGroup <> nil then
    begin
      if FMyCubGroup.FData.Group_Index = r^.Cubicle then
        TT3ClientEventManager(EventManager).OnDynamicTrack(rec);
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_CmdUpdateNRP_PROPERTY(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecCmd_NRP_SET_PROPERTY;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

  UpdateNRPProperty(r^);
end;

procedure TSimMgr_Client.netRecv_CmdESM_CHANGE_PROPERTY(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecCmd_ESM_SET_PROPERTY;
  track: TT3DetectedTrack;
  esm: TT3EsmTrack;
  i, J: integer;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);
  if r^.SessionID <> FSessionID then
    Exit;

  if not(ISInstructor) or not(ISWasdal) then
  begin
    if FMyCubGroup.FData.Group_Index <> r^.GrpID then
      Exit;

    if r^.SessionID <> FSessionID then
      Exit;

    for i := 0 to SimDetectedTrackList.itemCount - 1 do
    begin
      track := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;
      for J := 0 to track.ESMTracks.Count - 1 do
      begin
        esm := track.ESMTracks[J];
        if esm.TrackNumber = r^.TrackNumber then
        begin
          if r^.Identity <> -1 then
            esm.TrackIdent := r^.Identity;
          if r^.domain <> -1 then
            esm.TrackDomain := r^.domain;
        end;
      end;

    end;
  end;
end;

procedure TSimMgr_Client.netRecv_CmdPlatform_Repair(apRec: PAnsiChar;
  aSize: word);
var
  r: ^TRecCmd_Platform_Repair;
begin
  r := @apRec^;
  LogEventRecv(r^.pid.recID);

  if r^.SessionID <> FSessionID then
    Exit;

  RepairPlatform(r^);
end;

//procedure TSimMgr_Client.netRecv_CmdPlotting(apRec: PAnsiChar; aSize: word);
//var
//  r: ^TRecCmd_Plotting;
//  rec: TRecCmd_Plotting;
//begin
//  r := @apRec^;
//  LogEventRecv(r^.pid.recID);
//
//  if r = nil then
//    Exit;
//
//  if r^.SessionID <> FSessionID then
//    Exit;
//
//  rec := r^;
//
////  if rec.Group = MyNOPRGroup then
//    TT3ClientEventManager(EventManager).OnPlotting(rec);
//end;

procedure TSimMgr_Client.netRecv_CmdPlottingShape(apRec: PAnsiChar; aSize: word);
var
  r: ^TRecCmd_PlottingShape;
begin
  r := @apRec^;
   LogEventRecv(r^.pid.recID);

  if r = nil then
    Exit;

  if r^.SessionID <> FSessionID then
    Exit;

  CreatePlotting(r^);
end;

procedure TSimMgr_Client.netOnConnected(sender: TObject);
var
  rec: TRecTCP_Request;
begin
  // synch platform_index untuk launch;
  // di server onConnected di kirimi.
  { rec.reqID     := REQ_LAST_PLATFORMID_INFO;
    rec.reqFlag   := Random($ffff);
    VNetClient.SendCommand(CPID_TCP_REQUEST, @rec );
    }

  rec.reqID := REQ_CUBICLE_ASSIGNMENT;
  rec.reqFlag := Random($FFFF);
  VNetClient.SendCommand(CPID_TCP_REQUEST, @rec);

  // ini karena dibales lewat udp, maka perlu 'paket id' tambahan
  // untuk memastikan paket yg diproses adalah paket hasil request sendiri.
  // 'sync time'
  rec.reqID := REQ_SYNCH_GAMECTRL_INFO;
  FTimeFlag := Random($FFFF);
  rec.reqParam := 0;
  rec.reqFlag := FTimeFlag;
  FTimeReq := FMainVTime.GetMillisecond;

  VNetClient.SendCommand(CPID_TCP_REQUEST, @rec);

  rec.reqID := REQ_MISSED_PACKET;
  rec.reqFlag := Random($FFFF);
  VNetClient.SendCommand(CPID_TCP_REQUEST, @rec);
end;

procedure TSimMgr_Client.RequestAllCubicleAssignment;
begin
  //x
end;

function TSimMgr_Client.ReturnTobase(const rec: TRecCmd_ReturnToBase): Boolean;
var
  News: TEventSummary;
  strAction: string;
begin
  result := inherited;

  if not result then Exit;

  {menampilkan event summary}
  strAction := rec.PlatformClassIden + ' Return to base';
  News := TEventSummary.create;
  News.Time := simMgrClient.GameTIME;
  News.VehicleIdentifier := rec.PlatformClassIden;
  News.Force := rec.Force_Designation;
  News.Action := strAction;
  SimManager.SimEventSummary.Add(News);
  TT3ClientEventManager(EventManager).OnWriteEventSummary;
  TT3ClientEventManager(EventManager).OnRefreshBase;
end;

{$REGION 'Datalink Section start here'}

function TSimMgr_Client.AddDetectedTrackByDataLink(idTrack: integer;
  dataLink: TT3DataLink): Boolean;
var
  pi: TT3PlatformInstance;
  //vDef : TVehicle_Definition;
  track: TT3DetectedTrack;
  aTrack: TSimObject;
  //DLBandOK : boolean;
begin
  result := false;
  aTrack := FindT3PlatformByID(idTrack);
  track := findDetectedTrack(aTrack) as TT3DetectedTrack;

  if Assigned(track) then // jika sudah ada
  begin
    track.addDetectBy(datalink);

    if track.Dormant then
      track.Dormant := false;

    Exit;
  end;

  if not Assigned(aTrack) then
    Exit;

  FTrackNumber := FTrackNumber + 1;
  track := TT3DetectedTrack.Create;
  track.TrackObject := TT3Unit(aTrack);
  track.ISBlinking := True;
  track.TrackNumber := FTrackNumber;
  track.TimeDetected := GameTIME;
  track.Converter := Converter;
  track.addDetectBy(TT3DeviceUnit(dataLink));
  track.OnDetectecTrackDestroy := TT3ClientEventManager(EventManager).OnDetectedTrackDestroy;

  if aTrack is TT3PlatformInstance then
  begin
    pi := aTrack as TT3PlatformInstance;
    track.TrackNumber := FMyCubGroup.GetTrackNumber(pi.InstanceIndex);
  end;

  track.TrackType := TT3PlatformInstance(aTrack).PlatformType;
  track.TrackDomain := TT3PlatformInstance(aTrack).PlatformDomain;
  track.OnSelected := TT3ClientEventManager(EventManager)
    .OnDetectedTrackSelected;
  track.TrackID := IntToStr(TT3PlatformInstance(aTrack).TrackNumber);
  track.OnTrackBlinking := OnTrackBlinking;

  SimDetectedTrackList.addObject(track);
  result := true;
  Log('TSimMgr_Client.AddDetectedTrackByDataLink', 'Add Detected Track By Data Link -> ' + IntToStr
      (TT3PlatformInstance(aTrack).InstanceIndex));
end;

procedure TSimMgr_Client.EmbarkTransportedPersonel(
  const rec: TRecCmd_EmbarkPersonelTemporary);
begin

  inherited;

  TT3ClientEventManager(EventManager).OnEmbarkPersonelTemporary(rec.ParentPlatformID);
end;

procedure TSimMgr_Client.EmbarkTransported(const rec: TRecCmd_Transport);
var
  News : TEventSummary;
  HostTransport : TT3PlatformInstance;
  MemberTransport : TT3PlatformInstance;

  MemberName : string ;
  HostName : string ;
  MemberForce : Integer;

begin
  inherited;

  MemberName := '';
  HostName := '';
  MemberForce := 3;

  MemberTransport := SimManager.FindT3PlatformByID(rec.MemberPlatformID);
  if MemberTransport <> nil then
  begin
    MemberName := MemberTransport.InstanceName;
    MemberForce := MemberTransport.Force_Designation;
  end;

  HostTransport := SimManager.FindT3PlatformByID(rec.HostPlatformID);
  if HostTransport <> nil then
  begin
    HostName := HostTransport.InstanceName;
  end;

  {menampilkan event summary}
  News := TEventSummary.create;
  News.Time := simMgrClient.GameTIME;
  News.VehicleIdentifier := MemberName;
  News.Force := MemberForce;
  News.Action := MemberName + ' Embarked to ' + HostName;

  SimManager.SimEventSummary.Add(News);

  TT3ClientEventManager(EventManager).OnWriteEventSummary;
  TT3ClientEventManager(EventManager).OnUpdateTransportStatus(rec.HostPlatformID);
end;

procedure TSimMgr_Client.DisembarkTransported(const rec: TRecCmd_Transport);
var
  News : TEventSummary;
  HostTransport : TT3PlatformInstance;
  MemberTransport : TT3PlatformInstance;

  MemberName : string ;
  HostName : string ;
  MemberForce : Integer;

begin
  inherited;

  MemberName := '';
  HostName := '';
  MemberForce := 3;

  MemberTransport := SimManager.FindT3PlatformByID(rec.MemberPlatformID);
  if MemberTransport <> nil then
  begin
    MemberName := MemberTransport.InstanceName;
    MemberForce := MemberTransport.Force_Designation;
  end;

  HostTransport := SimManager.FindT3PlatformByID(rec.HostPlatformID);
  if HostTransport <> nil then
  begin
    HostName := HostTransport.InstanceName;
  end;

  {menampilkan event summary}
  News := TEventSummary.create;
  News.Time := simMgrClient.GameTIME;
  News.VehicleIdentifier := MemberName;
  News.Force := MemberForce;
  News.Action := MemberName + ' Disembarked from ' + HostName;

  SimManager.SimEventSummary.Add(News);

  TT3ClientEventManager(EventManager).OnWriteEventSummary;
  TT3ClientEventManager(EventManager).OnUpdateTransportStatus(rec.HostPlatformID);
end;

procedure TSimMgr_Client.QueryDetectedTracksByPlatform(aPlatformID : integer;
      var arrIDs : TIntegerArray);
var
  i,j, count : Integer;
  obj   : TSimObject;
  item  : TT3DetectedTrack;
  device : TT3Sensor;
  aPf : TT3PlatformInstance;
begin
  aPf := FindT3PlatformByID(aPlatformID);
  count := 1;

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    obj := SimDetectedTrackList.getObject(i);
    if obj = nil then
      Continue;

    item := obj as TT3DetectedTrack;

    if item.Dormant then
      continue;

    for j := 0 to item.TrackDetectedBy.Count - 1 do
    begin
      device := item.TrackDetectedBy.Items[j];
      if device = nil then
        Continue;
      
      if (device is TT3Radar) and device.Parent.Equals(aPf) then
      begin
        SetLength(arrIDs, count);

        arrIDs[count - 1] := item.TrackObject.InstanceIndex;
        count := Count + 1;

        Break;
      end;
    end;
  end;
end;

procedure TSimMgr_Client.netRecv_Cmd_DataLink(apRec: PAnsiChar; aSize: word);
  procedure InitializeArr(var a : Array of Integer);
  var
    i : integer;
  begin
    for I := 0 to Length(a) - 1 do
      a[i] := 0;
  end;
var
  r: ^TRecCmd_DataLink;
  dataLink, dlCubicle: TT3DataLink;
  reqCubicle : T3CubicleGroup;
  arrTracks : TIntegerArray;
  recTracksDL : TRecCmd_DataLink;
  i : Integer;
  l : TStrings;
  grp : T3CubicleGroup;
  isRemoveAllDLTrack : boolean;
begin
  inherited;

  r := @apRec^;

  if r^.SessionID <> FSessionID then
    Exit;

  dataLink := DataLinkManager.getDatalink(r^.DataLinkID);
  if dataLink <> nil then
  begin
    case r^.OrderDL of
      odlPUEMCONActivated :
      begin
        if not(Assigned(ControlledPlatform)) then
          Exit;

        dlCubicle := DataLinkManager.getDatalinkOnPU(ControlledPlatform);
        if not Assigned(dlCubicle) then
          Exit;

        if dlCubicle.IDLink <> r^.DataLinkID then
          Exit;

        { remove detected track is dlCubicle own }
//          l := dlCubicle.getNCSEntityByPlatformIndex(r^.PooledPUID);

//          for I := 0 to l.Count - 1 do
//            RemoveDetectedTrackByDataLink(StrToInt(l[i]), dlCubicle);
//          l.Free;
        if r^.PooledPUID = ControlledPlatform.InstanceIndex then
          simMgrClient.RemoveDetectedTrackByDataLink(dlCubicle);
        { end remove detected track is dlCubicle own }

        { remove NCS Entities is dlCubicle own }
        dlCubicle.RemoveNCSEntities(r^.PooledPUID);

        frmLog.DatalinkUpdate(datalink);
      end;

      odlNCSEMCONActivated :
      begin
        { remove All detected track is detected by this datalink }
        RemoveDetectedTrackByDataLink(dataLink);

        { remove All NCS Entities is detected by this datalink }
        dataLink.ClearNCSEntities;

        frmLog.DatalinkUpdate(datalink);
      end;

      odlStop:
      begin
        RemoveDetectedTrackByDataLink(dataLink);
        dataLink.Played := false;

        EventManager.OnUpdateDatalinkTote(odlStop);
      end;

      odlPlay:
      begin
        dataLink.Played := true;

        EventManager.OnUpdateDatalinkTote(odlPlay);
      end;

      odlPool :
      begin
        if not FIsInstructor or not FIsWasdal then
        begin
          if not(Assigned(ControlledPlatform)) then
            Exit;

          // Get ControlledPlatform Data Link
          dlCubicle := DataLinkManager.getDatalinkOnPU(ControlledPlatform);
          if not Assigned(dlCubicle) then
            Exit;

          if dlCubicle.IDLink <> r^.DataLinkID then
            Exit;

          { cek emcon status pada object yang di control}
          if ControlledPlatform is TT3Vehicle then
          begin
            if (TT3Vehicle(ControlledPlatform).EMCON_HFDataLinkVehicle = EmconHFDatalinkOn)
              or (TT3Vehicle(ControlledPlatform).EMCON_UHFVHFDataLinkVehicle = EmconUHFVHFDatalinkOn) then
            begin
              { remove from NCS Entities }
              //dlCubicle.RemoveNCSEntities(r^.PooledPUID);

              Exit;
            end;
          end;
          { end cek emcon status }

          // Get Cubicle Group of Data Link
          reqCubicle := Scenario.CubiclesGroupsListFromDB.GetGroupOf_PlatformIndex(r^.PooledPUID);
          if not Assigned(reqCubicle) then
            Exit
          else
          if reqCubicle.Equals(FMyCubGroup) then
            // if same do it...
            QueryDetectedTracksByPlatform(r^.PooledPUID, arrTracks)
          else
            Exit;

          // Complete the rec value
          recTracksDL.DataLinkID := r^.DataLinkID;
          recTracksDL.Force      := r^.Force;
          recTracksDL.Band       := r^.Band;
          recTracksDL.PooledPUID := r^.PooledPUID;
          recTracksDL.OrderDL    := odlPooledTracks;

          InitializeArr(recTracksDL.PooledTracksID);
          for I := 0 to Length(arrTracks) - 1 do
          begin
            if I > Length(recTracksDL.PooledTracksID) - 1 then
              Break;

            recTracksDL.PooledTracksID[i] := arrTracks[i];
          end;

          // Send request ID = odlPooledTracks (update track)
          netSend_Cmd_DataLink(recTracksDL);

          if Assigned(OnLogStr) then
            OnLogStr('netRecv_Cmd_DataLink', 'Datalink ' + IntToStr(r^.DataLinkID) + ':' +
                  IntToStr(r^.PooledPUID) + ' sending tracks');
        end;
      end;

      odlPUStatus :
      begin
        { jika status controlled paltform PU off, maka hapus datalink track }
        if (r^.PUStatus = 2) and (Assigned(ControlledPlatform))then
        begin
          if r^.platformID = ControlledPlatform.InstanceIndex then
            simMgrClient.RemoveDetectedTrackByDataLink(dataLink);
        end;
      end;

      odlRemovePermanently, odlRemove :
      begin
        isRemoveAllDLTrack := false;
        if not FIsInstructor or not FIsWasdal then
        begin
          grp := FScenario.CubiclesGroupsListFromDB.GetGroupOf_PlatformIndex(r^.platformID);
          if (grp <> nil) and (FMyCubGroup <> nil) then
          begin
            if FMyCubGroup.FData.Group_Index = grp.FData.Group_Index then
              isRemoveAllDLTrack := true;
          end;
        end;

        if isRemoveAllDLTrack then
          RemoveDetectedTrackByDataLink(datalink)
        else
        begin
          { remove from detected track }
          l := dataLink.getNCSEntityByPlatformIndex(r^.platformID);

          for I := 0 to l.Count - 1 do
            RemoveDetectedTrackByDataLink(StrToInt(l[i]),datalink);

          l.Free;
        end;

        { remove from NCS Entities }
        dataLink.RemoveNCSEntities(r^.platformID);
      end;
    end;

    { update detected track by datalink }
    if r^.OrderDL = odlPooledTracks then begin
      if Assigned(dataLink.OnDatalinkTrackUpdate) then
        dataLink.OnDatalinkTrackUpdate(dataLink);
    end;

    if (r^.OrderDL <> odlPool) and (r^.OrderDL <> odlPooledTracks) then
    begin
      if Assigned(dataLink.OnUpdated) then
      begin
        //update totedisplay
        dataLink.OnUpdated(dataLink);

        // in hanya untuk log saja
        frmLog.DatalinkUpdate(datalink);
      end;
    end;
  end;
end;

procedure TSimMgr_Client.RemoveDetectedTrackByDataLink(dataLink: TT3DataLink);
var
  i,j: integer;
  track: TT3DetectedTrack;
  sensor: TT3Sensor;
begin
  for i := SimDetectedTrackList.itemCount - 1 downto 0 do
  begin
    track := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;
    if Assigned(track) then
    begin
      for J := track.TrackDetectedBy.Count - 1 downto 0 do
      begin
        sensor := track.TrackDetectedBy.Items[J];
        if sensor is TT3DataLink and sensor.Equals(dataLink) then
        begin
          // hapus sensor.
          track.TrackDetectedBy.Delete(J);
        end;
      end;

      if track.TrackDetectedBy.Count < 1 then
      begin
        track.Dormant := true;
      end;
    end;
  end;
end;

procedure TSimMgr_Client.RemoveDetectedTrackByDataLink(aPlatformDetectedID: integer;
  dataLink: TT3DataLink);
var
  i: integer;
  track: TT3DetectedTrack;
  sensor: TT3Sensor;
  J: integer;
begin
  // jk benar controledPlatform-nya adalah receiver datalink -> hapus detected by datalink
  for i := SimDetectedTrackList.itemCount - 1 downto 0 do
  begin
    track := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;

    if Assigned(track) and Assigned(track.TrackObject) and
      (track.TrackObject.InstanceIndex = aPlatformDetectedID) then
    begin
      for J := track.TrackDetectedBy.Count - 1 downto 0 do
      begin
        sensor := track.TrackDetectedBy.Items[J];
        if sensor is TT3DataLink and sensor.Equals(dataLink) then
        begin
          // hapus sensor.
          track.TrackDetectedBy.Delete(J);
        end;
      end;

      if track.TrackDetectedBy.Count < 1 then
      begin
        track.Dormant := true;
      end;

      break;
    end;
  end;
end;

procedure TSimMgr_Client.netSend_Cmd_DataLink(r: TRecCmd_DataLink);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_DATALINK, @r);
end;

procedure TSimMgr_Client.netSend_CMD_DataLink_AddTrack
  (r: TRecCmd_DataLink_AddTrack);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_DATALINK_ADDTRACK, @r);
end;

procedure TSimMgr_Client.netSend_CMD_DataLink_RemoveTrack(
  r: TRecCmd_DataLink_RemoveTrack);
begin
  r.SessionID := FSessionID;
  VNetClient.SendCommand(CPID_CMD_DATALINK_REMOVETRACK, @r);
end;

{$ENDREGION}



{*******************************************snapshot**********************************}

procedure TSimMgr_Client.SnapshotSetMyCubicleGroup;
var
  i,j,k,
  GrpID   : integer ;
  piT3    : TT3PlatformInstance;
  grp,newGrp     : T3CubicleGroup ;
  gm      : T3CubicleGroupMember;
  sensor  : TT3Sensor;
  ve      : TT3Vehicle ;
  f       : boolean ;
  unassignedGroupCub: TCubicleAssignSetting;

begin

  for i := low(lRec.FRCubicleGroupList) to high(lRec.FRCubicleGroupList) do
  begin
    recSSCubGroup := lRec.FRCubicleGroupList[i] ;
//    if recSSCubGroup.FData.Group_Identifier <> 'Controller' then
//    begin
      grp := T3CubicleGroup.Create;
      grp.FData        := recSSCubGroup.FData ;
      grp.CubicleName  := recSSCubGroup.CubicleName;
      grp.InitData;
      for j := low(lRec.FRCubicleGroupList[i].FSList) to high(lRec.FRCubicleGroupList[i].FSList) do
      begin
         gm := T3CubicleGroupMember.Create ;
         gm.FData :=  lRec.FRCubicleGroupList[i].FSList[j].FData ;
         grp.FSList.AddObject(IntToStr(gm.FData.Platform_Instance_Index), gm);
      end;
      FScenario.CubiclesGroupsListFromDB.FSList.AddObject(IntToStr(grp.FData.Group_Index), grp);
//    end
  end;

  for i := 1 to 5 do
  begin
    grp := T3CubicleGroup.Create;
    with grp.FData do
    begin
      Group_Index       := 0;
      Deployment_Index  := 0;
      Group_Identifier  := 'Controller';
      Force_Designation := i;
      Tracks_Block      := 0;
      Track_Block_Start := 0;
      Track_Block_End   := 0;
      Zulu_Zulu         := 0;
    end;

    grp.InitData;
    FScenario.CubiclesGroupsListFromDB.FSList.AddObject(IntToStr(i), grp);
  end;

//  for i := 0 to Length(unassignedGroupCub.GroupIDs) - 1 do
//  begin
//    if isController then
//    begin
//      if i < (FScenario.CubiclesGroupsListFromDB.Count - 5) then
//        Continue;
//    end;
//
//    newGrp := T3CubicleGroup.Create;
//    newGrp.CubicleName := '';
//    newGrp.FData.Group_Index := unassignedGroupCub.GroupIDs[i];
//    newGrp.FData.Deployment_Index := T3CubicleGroup(FScenario.CubiclesGroupsListFromDB.Items[FScenario.CubiclesGroupsListFromDB.Count-1]).FData.Deployment_Index;
//    newGrp.FData.Group_Identifier := 'Unassigned Group';
//    newGrp.FData.Force_Designation := 4; //no force
//    newGrp.FData.Tracks_Block := 0;
//    newGrp.FData.Zulu_Zulu := 0;
//    FScenario.CubiclesGroupsListFromDB.FSList.AddObject(IntToStr(newGrp.FData.Group_Index), newGrp);
//  end;

  for I := 0 to FScenario.CubiclesGroupsListFromDB.Count - 1 do
  begin
    grp  := FScenario.CubiclesGroupsListFromDB.Items[i] as T3CubicleGroup;
    if grp <> nil then
    begin
      grp.InitData;

      //dmTTT.GetT3GroupMember(grp.FData.Group_Index, grp.FSList);

      for j := 0 to grp.Count - 1 do
      begin
        gm := grp.Items[j] as T3CubicleGroupMember;
        if gm <> nil then
          piT3 := FindT3PlatformByID(gm.FData.Platform_Instance_Index)
        else
          piT3 := nil;

        if piT3 <> nil then
        begin
          if j = 0 then
           piT3.IsGroupLeader := true
          else
           piT3.IsGroupLeader := false;

          // sam .. ?
//          piT3.GroupIndex := grp.FData.Group_Index;
          grp.SetTrackNumber(piT3.FPIData.Platform_Instance_Index, j);
        end
      end;
    end;
  end;

  CubAssignList := FScenario.CubiclesGroupsListFromDB;
  f := false;

  if FIsInstructor or FIsWasdal then
  begin
    for i := 0 to SimPlatforms.itemCount - 1 do
    begin
      piT3 := TT3PlatformInstance(SimPlatforms.getObject(i));
      piT3.UnitGroup := True;
      piT3.Enable := True;
      piT3.isInstructor := FIsInstructor;
      piT3.isWasdal := FIsWasdal;

      // environment
      piT3.Environment := GameEnvironment;

      for j := 0 to TT3Vehicle(piT3).Devices.Count - 1 do
      begin
        sensor := TT3Vehicle(piT3).Devices[j];

        if Assigned(sensor) then
        begin
          sensor.Environment := GameEnvironment;
          sensor.GameDefaults := GameDefaults;
        end;
      end;

      if piT3 is TT3Vehicle then
      begin
        ve := piT3 as TT3Vehicle;
        ve.TrackLabel := ve.Track_ID;
        // vObj.Visible    := false;
        // vObj.TrackDomain := vObj.PlatformDomain;
        // vObj.TrackIdent  := piFriend;
        ve.IsGroupLeader := false;
        ve.LoadPlatformSymbol;
      end;

      if (not f) and (piT3.Parent = nil) then
      begin
        ControlledPlatform := piT3;
        f := True;
        // break; //--> ini cuma untuk ngetes radar, kudu dibuang klo dah sls
      end;
    end;

    MyForceDesignation := -1;
    FMyCubGroup := CubAssignList.GetGroupByIdentifier('Controller') as T3CubicleGroup;
  end
  else
  begin
    // Cubicle
    // Group yg di assign cuma satu;
    // k := length(vCubicalAssignSetting.GroupIDs);

    {manipulasi, memastikan snapshoot default unit group false}
    for i := 0 to SimPlatforms.itemCount - 1 do
    begin
      piT3 := TT3PlatformInstance(SimPlatforms.getObject(i));
      piT3.UnitGroup := False;
    end;

    if length(vCubicalAssignSetting.GroupIDs) > 0 then
    begin
      GrpID := vCubicalAssignSetting.GroupIDs[0];
      FMyCubGroup := CubAssignList.GetGroupByID(GrpID) as T3CubicleGroup;

      for i := 0 to length(vCubicalAssignSetting.GroupIDs) - 1 do
      begin
        GrpID := vCubicalAssignSetting.GroupIDs[i];
        grp := CubAssignList.GetGroupByID(GrpID) as T3CubicleGroup;
        f := false;

        if grp = nil then
          Exit;

        for J := 0 to grp.Count - 1 do
        begin
          gm := grp.Items[J] as T3CubicleGroupMember;
          if gm <> nil then
            piT3 := FindT3PlatformByID(gm.FData.Platform_Instance_Index)
          else
            piT3 := nil;

          if piT3 <> nil then
          begin
            piT3.UnitGroup := True;
            piT3.Enable := True;

            // environment
            piT3.Environment := GameEnvironment;

            for k := 0 to TT3Vehicle(piT3).Devices.Count - 1 do
            begin
              sensor := TT3Vehicle(piT3).Devices[k];

              if Assigned(sensor) then
              begin
                sensor.Environment := GameEnvironment;
                sensor.GameDefaults := GameDefaults;
              end;
            end;

            if piT3 is TT3Vehicle then
            begin
              ve := piT3 as TT3Vehicle;
              ve.TrackNumber := grp.GetTrackNumber(ve.InstanceIndex);
              ve.TrackLabel := FormatTrackNumber(ve.TrackNumber);

              ve.TrackDomain := ve.PlatformDomain;
              ve.TrackIdent := piFriend;
              ve.IsOwnShip := True;
            end;
          end;

          if piT3 <> nil then
          begin
            if (not f) and (piT3.Parent = nil) then
            begin
              ControlledPlatform := piT3;
              ve := piT3 as TT3Vehicle;
              ve.IsGroupLeader := True; //halu
              f := True;
              MyForceDesignation := ControlledPlatform.Force_Designation;
            end;
          end;
        end;
      end;
    end
    else
    begin
      FMyCubGroup := nil;
      // no group assigned to this cubicle!
      // Application terminate!
    end;
  end;
end;

procedure TSimMgr_Client.SetOnUpdateGotoProgress(
  const Value: TOnUpdateProgress);
begin
  FOnUpdateGotoProgress := Value;
end;

procedure TSimMgr_Client.SetPlatformViewMode(const Value: Boolean);
var
  i : integer;
  piT3 : TT3PlatformInstance;
  piTrack : TT3DetectedTrack;
begin
  FPlatformViewMode := Value;

  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    piT3 := TT3PlatformInstance(SimPlatforms.getObject(i));

    if piT3 is TT3Vehicle then
    begin
      TT3Vehicle(piT3).PlatformViewMode := PlatformViewMode;
    end;
  end;

  for i := 0 to SimDetectedTrackList.itemCount - 1 do
  begin
    piTrack := TT3DetectedTrack(SimDetectedTrackList.getObject(i));

    if piTrack is TT3DetectedTrack then
    begin
      TT3DetectedTrack(piTrack).PlatformViewMode := PlatformViewMode;
    end;
  end;
end;

procedure TSimMgr_Client.SetShipTacticalInfo(const Index: Integer;
  const Value: string);
begin
  FShipTacticalInfo[Index] := Value;
end;

procedure TSimMgr_Client.SetTacticalDinamicSymbol(const Value: Boolean);
var
  i : integer;
  piT3 : TT3PlatformInstance;
  piTrack : TT3DetectedTrack;
begin
  FTacticalDinamicSymbol := Value;

  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    piT3 := TT3PlatformInstance(SimPlatforms.getObject(i));

    if piT3 is TT3Vehicle then
    begin
      TT3Vehicle(piT3).TacticalDinamicSymbol := TacticalDinamicSymbol;
    end;
  end;
end;

procedure TSimMgr_Client.SetTacticalStaticSymbol(const Value: Boolean);
var
  i : integer;
  piT3 : TT3PlatformInstance;
  piTrack : TT3DetectedTrack;
begin
  FTacticalStaticSymbol := Value;

  for i := 0 to SimPlatforms.itemCount - 1 do
  begin
    piT3 := TT3PlatformInstance(SimPlatforms.getObject(i));

    if piT3 is TT3Vehicle then
    begin
      TT3Vehicle(piT3).TacticalStaticSymbol := TacticalStaticSymbol;
    end;
  end;
end;

procedure TSimMgr_Client.SnapshotLoadFile(fName: string);
var
  fGeo, fPattern, S, slog   : string;
  Datalink1, Datalink2, Datalink3 : TT3DataLink;
  i, J, k : Integer;
  position        : TMapPt;
  OverlayTemplate : TMainOverlayTemplate;
  shape : TShape_Definition;
  ovIdx : Integer;
  rD: TRecCmd_OverlayDynamicShape;

  fileName: string;
  areaName: string;

  DefName_1, DefName_2, DefName_3 : string;
  rec : TPlatformBase;

  recOverlayTemplate : TRecCmd_OverlayTemplate;
  recOverlayStatic: TRecCmd_OverlayStaticShape;

  recPlotting : TRecCmd_PlottingShape;
  recShipingRoute : TRecCmd_ShipingRoute;

  platformBaseTemp : TPlatformBase;
begin
  GamePause ;

  {***custom from snapshot }
  __snapshot_showprogress(true);

  if __snapshot_loadfile(fName) then begin
    slog := lRec.Name+'-'+lRec.AddName;
    FOnLogStr('SnapshotLoadFile', 'Snapshot :: Use snapshot '+QuotedStr(slog));
  end
  else
    FOnLogStr('SnapshotLoadFile', 'Snapshot Info : Error Load snapshot '+QuotedStr(fName) );

  ResetScenario;

  __snapshot_setGameScenario(FScenario);

  FLastPlatformID := 100;

  FMainVTime.Reset(0);
  FMainVTime.DateTimeOffset := FScenario.ResourceAllocation.FData.Game_Start_Time;

  FLastPlatformID := ((FLastPlatformID  div 100) + 1 ) * 100;
  FLastPlatformID := lRec.LastPlatformID + 1;

  __snapshot_setGameEnvironment(GameEnvironment);
  __snapshot_setGameDefault(GameDefaults);
  __snapshot_setRainfall(FRainfall);
  __snapshot_setCloudEffects(FCloud_Effects);
  __snapshot_setDefaultVar(FDefault_Var);

  GameEnvironment.COnverter := Converter ;

  // to move the value of definition area from 'txt' file to the list
  DefName_1 := vMapSetting.MapDefGame + '\Def_' + GameEnvironment.FData.Game_Def_1 + '.txt';
  DefName_2 := vMapSetting.MapDefGame + '\Def_' + GameEnvironment.FData.Game_Def_2 + '.txt';
  DefName_3 := vMapSetting.MapDefGame + '\Def_' + GameEnvironment.FData.Game_Def_3 + '.txt';

  if FileExists(DefName_1) then
    FScenario.ListDefinition_1.LoadFromFile(DefName_1);

  if FileExists(DefName_2) then
    FScenario.ListDefinition_2.LoadFromFile(DefName_2);

  if FileExists(DefName_3) then
    FScenario.ListDefinition_3.LoadFromFile(DefName_3);

  {$REGION ' SimPlatform '}
  if FIsWasdal then
  begin
    __snapshotSetVehicleList(SimPlatforms,Self,FIsWasdal,slog, FLastPlatformID);
    __snapshotSetVehicleDefList(SimPlatforms,Self,FIsWasdal,slog);
  end
  else
  begin
    __snapshotSetVehicleList(SimPlatforms,Self,FIsInstructor,slog, FLastPlatformID);
    __snapshotSetVehicleDefList(SimPlatforms,Self,FIsInstructor,slog);
  end;
  {$ENDREGION}

  {$REGION ' Cubicle Group '}
  SnapshotSetMyCubicleGroup;
  {$ENDREGION}

  {$REGION ' Non Real Time & Object Missile '}
   if FIsWasdal then
   begin
      __snapshotSetNonRealtimeList(simNonRealPlatform,Self,FIsWasdal,slog);
      __snapshotSetPointRBLW_VehicleMissile(SimPointRBLW_VehicleMissile,Self,FIsWasdal,slog);
      __snapshotSetPointBOLW_VehicleMissile(SimPointBOLW_VehicleMissile,Self,FIsWasdal,slog);
   end
   else
   begin
      __snapshotSetNonRealtimeList(simNonRealPlatform,Self,FIsInstructor,slog);
      __snapshotSetPointRBLW_VehicleMissile(SimPointRBLW_VehicleMissile,Self,FIsInstructor,slog);
      __snapshotSetPointBOLW_VehicleMissile(SimPointBOLW_VehicleMissile,Self,FIsInstructor,slog);
   end;
   {$ENDREGION}

  {$REGION ' SimPlatform :: TT3Weapon '}
  if FIsWasdal then
  begin
    __snapshotSetMissileList(SimPlatforms,Self,FIsWasdal);
    __snapshotSetTorpedoList(SimPlatforms,Self,FIsWasdal);
    __snapshotSetBombList(SimPlatforms,Self,FIsWasdal);
    __snapshotSetMineList(SimPlatforms,Self,FIsWasdal);
  end
  else
  begin
    __snapshotSetMissileList(SimPlatforms,Self,FIsInstructor);
    __snapshotSetTorpedoList(SimPlatforms,Self,FIsInstructor);
    __snapshotSetBombList(SimPlatforms,Self,FIsInstructor);
    __snapshotSetMineList(SimPlatforms,Self,FIsInstructor);
  end;
  {$ENDREGION}

  {$REGION ' SimPlatform :: TT3CounterMeasuer '}
  if FIsWasdal then
  begin
    __snapshotSetAirBubbleList(SimPlatforms,Self,FIsWasdal);
    __snapshotSetChaffList(SimPlatforms,Self,FIsWasdal);
  end
  else
  begin
    __snapshotSetAirBubbleList(SimPlatforms,Self,FIsInstructor);
    __snapshotSetChaffList(SimPlatforms,Self,FIsInstructor);
  end;
  {$ENDREGION}

  {$REGION ' SimPlatform :: Sonobuoy '}
  if FIsWasdal then
  begin
    __snapshotSetSonobuoyList(SimPlatforms,Self,FIsWasdal);
  end
  else
  begin
    __snapshotSetSonobuoyList(SimPlatforms,Self,FIsInstructor);
  end;
  {$ENDREGION}

  {$REGION ' Shiping Route '}
  for i := Low(lRec.FRShipingRoute) to High(lRec.FRShipingRoute) do begin
    recSSShipingRoute := lRec.FRShipingRoute[i];

    recShipingRoute.ShipingRouteId := recSSShipingRoute.ShipingRouteId;
    recShipingRoute.Name := recSSShipingRoute.Name;
    recShipingRoute.IdAction := caSnapShoot;
    recShipingRoute.Force := recSSShipingRoute.Force;
    recShipingRoute.Color := recSSShipingRoute.Color;
    recShipingRoute.Show := False;

    for j := Low(lRec.FRShipingRoute[i].FList) to High(lRec.FRShipingRoute[i].FList) do
    begin
      recShipingRoute.Personel[j] := lRec.FRShipingRoute[i].FList[j].Personel;
      recShipingRoute.Speed[j] := lRec.FRShipingRoute[i].FList[j].Speed;
      recShipingRoute.postStart[j].X := lRec.FRShipingRoute[i].FList[j].PosAwalX;
      recShipingRoute.postStart[j].Y := lRec.FRShipingRoute[i].FList[j].PosAwalY;
      recShipingRoute.postEnd[j].X := lRec.FRShipingRoute[i].FList[j].PosAkhirX;
      recShipingRoute.postEnd[j].Y := lRec.FRShipingRoute[i].FList[j].PosAkhirY;
    end;

    CreateShipingRoute(recShipingRoute);
  end;
  {$ENDREGION}

  {$REGION ' Overlay '}
  for i := Low(lRec.FRMainOverlayTemplate) to High(lRec.FRMainOverlayTemplate) do
  begin
    recSSOverlayTemplate:= lRec.FRMainOverlayTemplate[i];
    recOverlayTemplate.OverlayID := recSSOverlayTemplate.OverlayIndex;
    recOverlayTemplate.Name := recSSOverlayTemplate.Name;
    recOverlayTemplate.Tipe := recSSOverlayTemplate.Tipe;
    recOverlayTemplate.Domain := recSSOverlayTemplate.Domain;
    recOverlayTemplate.isShow := False;
    recOverlayTemplate.Force := recSSOverlayTemplate.Force;
    recOverlayTemplate.Role := recSSOverlayTemplate.Role;
    recOverlayTemplate.RoleName := recSSOverlayTemplate.RoleName;
    recOverlayTemplate.IdAction := caSnapShoot;

    CreateOverlayTamplate(recOverlayTemplate);

    for J := Low(lRec.FRMainOverlayTemplate[i].StaticList) to High(lRec.FRMainOverlayTemplate[i].StaticList) do
    begin
      recSSOverlayStaticShape := lRec.FRMainOverlayTemplate[i].StaticList[J];

      recOverlayStatic.IdAction    := caAdd;
      recOverlayStatic.TemplateId  := recSSOverlayTemplate.OverlayIndex;
      recOverlayStatic.Cubicle     := 0;
      recOverlayStatic.ShapeType   := recSSOverlayStaticShape.ShapeType;
      recOverlayStatic.PostStart.X := recSSOverlayStaticShape.PostStart.X;
      recOverlayStatic.PostStart.Y := recSSOverlayStaticShape.PostStart.Y;
      recOverlayStatic.PostEnd.X   := recSSOverlayStaticShape.PostEnd.X;
      recOverlayStatic.PostEnd.Y   := recSSOverlayStaticShape.PostEnd.Y;
      recOverlayStatic.Words       := recSSOverlayStaticShape.Words;
      recOverlayStatic.Size        := recSSOverlayStaticShape.Size;
      recOverlayStatic.Radius1     := recSSOverlayStaticShape.Radius1;
      recOverlayStatic.Radius2     := recSSOverlayStaticShape.Radius2;
      recOverlayStatic.StartAngle  := recSSOverlayStaticShape.StartAngle;
      recOverlayStatic.EndAngle    := recSSOverlayStaticShape.EndAngle;
      recOverlayStatic.Rotasi      := recSSOverlayStaticShape.Rotasi;
      recOverlayStatic.Kolom       := recSSOverlayStaticShape.Kolom;
      recOverlayStatic.Baris       := recSSOverlayStaticShape.Baris;
      recOverlayStatic.color       := recSSOverlayStaticShape.color;
      recOverlayStatic.lineType    := recSSOverlayStaticShape.lineType;
      recOverlayStatic.weight      := recSSOverlayStaticShape.weight;
      recOverlayStatic.BrushStyle  := recSSOverlayStaticShape.BrushStyle;
      recOverlayStatic.ColorFill   := recSSOverlayStaticShape.ColorFill;

      for k := 0 to 12 do
      begin
        recOverlayStatic.PolyPoint[k]   := recSSOverlayStaticShape.PolyPoint[k];
      end;

      CreateOverlayShape(recOverlayStatic);
    end;
  end;
  {$ENDREGION}

  {$REGION ' Plotting '}
  for i := Low(lRec.FRMainPlotting) to High(lRec.FRMainPlotting) do
  begin
    recSSPlotting:= lRec.FRMainPlotting[i];

    recPlotting.PlottingId    := recSSPlotting.PlottingId;
    recPlotting.TemplateName  := recSSPlotting.Name;
    recPlotting.PostStart     := recSSPlotting.postCenter;
    recPlotting.Tipe          := recSSPlotting.Tipe;
    recPlotting.Force         := recSSPlotting.Force;
    recPlotting.Identity      := recSSPlotting.Identity;
    recPlotting.Role          := recSSPlotting.Role;
    recPlotting.RoleName      := recSSPlotting.RoleName;
    recPlotting.IdAction      := caSnapShoot;

    case recSSPlotting.Tipe of
      plIntelijen:
      begin
        {$REGION ' Intelijen '}
        for j := Low(lRec.FRMainPlotting[i].IntelInfoList) to High(lRec.FRMainPlotting[i].IntelInfoList) do
        begin
          recPlotting.Data[j] := lRec.FRMainPlotting[i].IntelInfoList[j].Info;
        end;
        {$ENDREGION}
      end;
      plLogistic:
      begin
        {$REGION ' Logistic '}
        for j := Low(lRec.FRMainPlotting[i].LogisticOnBaseList) to High(lRec.FRMainPlotting[i].LogisticOnBaseList) do
        begin
          recPlotting.Data[j] := lRec.FRMainPlotting[i].LogisticOnBaseList[j].Name;
          recPlotting.Status[j] := lRec.FRMainPlotting[i].LogisticOnBaseList[j].Status;
        end;
        {$ENDREGION}
      end;
      plRadar:
      begin
        {$REGION ' Radar '}
        recPlotting.Radius := recSSPlotting.Radius;
        {$ENDREGION}
      end;
      plPangkalan:
      begin
        {$REGION ' Pangkalan '}
        for j := Low(lRec.FRMainPlotting[i].VehicleOnBaseList) to High(lRec.FRMainPlotting[i].VehicleOnBaseList) do
        begin
          recPlotting.Data[j] := lRec.FRMainPlotting[i].VehicleOnBaseList[j].Name;
          recPlotting.Quantity[j] := lRec.FRMainPlotting[i].VehicleOnBaseList[j].Quantity;
          recPlotting.Simbol[j] := lRec.FRMainPlotting[i].VehicleOnBaseList[j].Simbol;
        end;
        {$ENDREGION}
      end;
      plPanah:
      begin
        {$REGION ' Panah '}
        recPlotting.postEnd := recSSPlotting.PostEnd;
        {$ENDREGION}
      end;
    end;

    CreatePlotting(recPlotting);
  end;
  {$ENDREGION}

  {$REGION ' Base '}
  for i := Low(lRec.FRPlatformBase) to High(lRec.FRPlatformBase) do
  begin
    recSSPlatformBase:= lRec.FRPlatformBase[i];

    platformBaseTemp := TPlatformBase.Create;

    platformBaseTemp.id := recSSPlatformBase.PlatformBaseId;
    platformBaseTemp.Identifier := recSSPlatformBase.Identifier;
    platformBaseTemp.Force := recSSPlatformBase.Force;
    platformBaseTemp.Longitude := recSSPlatformBase.Longitude;
    platformBaseTemp.Latitude := recSSPlatformBase.Latitude;
    platformBaseTemp.Radius := recSSPlatformBase.Radius;
    platformBaseTemp.TypeBase := recSSPlatformBase.TypeBase;
    platformBaseTemp.Fuel := recSSPlatformBase.Fuel;
    platformBaseTemp.Lubricants := recSSPlatformBase.Lubricants;
    platformBaseTemp.FreshWater := recSSPlatformBase.FreshWater;
    platformBaseTemp.Water := recSSPlatformBase.Water;
    platformBaseTemp.Food := recSSPlatformBase.Food;

    Scenario.BaseListFromDB.Add(platformBaseTemp);
    SimPlatformBase.AddBase(platformBaseTemp);
  end;
  {$ENDREGION}

  ///  ---------------------------------Datalink-------------------------------------------------------
  Datalink1 := DataLinkManager.getDatalink(1);
  Datalink2 := DataLinkManager.getDatalink(2);
  Datalink3 := DataLinkManager.getDatalink(3);

  __snapshot_setDatalinks(SimPlatforms, Datalink1, Datalink2, Datalink3);
  ///-----------------------------------Datalink-------------------------------------------------------
  ///
  {*** Clear Object yang tidak dipakai ***}
//  SimWeapons.ClearObjectAfterSnapshot;
//  SimDevices.ClearObjectAfterSnapshot;
//  SimPlatforms.ClearObjectAfterSnapshot;
//  simNonRealPlatform.ClearObjectAfterSnapshot;

  {Load embark library}
  if (FScenario.BaseListFromDB.Count > 0) then
  begin
    for I := 0 to FScenario.BaseListFromDB.Count - 1 do
    begin
      rec := TPlatformBase(FScenario.BaseListFromDB.Items[i]);
      SimPlatformBase.ListBase.add(rec);
    end;
  end;

//  FGDefList := Scenario.GDefList;

  FOnLogStr('SnapshotLoadFile', '...........................................................................');
  FOnLogStr('SnapshotLoadFile', 'Snapshot :: Load Success');
  FOnLogStr('SnapshotLoadFile', '...........................................................................');
  __snapshot_showprogress(False);
  {***end custom from snapshot }

  S := UpperCase(Trim(GameEnvironment.FGameArea.Detail_Map));
//  fGeo := vMapSetting.MapPath + 'Indonesia\Indonesia.gst';

  areaName := GameEnvironment.FGameArea.Game_Area_Identifier;
  fGeo := vMapSetting.MapGSTGame + '\' + areaName + '\' + areaName + '.gst';

  if FileExists(fGeo) then
  begin
    try
      VSimMap.LoadMap(fGeo);

      if Assigned(ControlledPlatform) then
        VSimMap.FMap.ZoomTo(50, ControlledPlatform.getPositionX,
          ControlledPlatform.getPositionY)
      else
        VSimMap.FMap.ZoomTo(50, VSimMap.FMap.CenterX, VSimMap.FMap.CenterY);
    except
      on e : Exception do begin
        if Assigned(OnLogStr) then
        begin
          OnLogStr('SnapshotLoadFile', E.ClassName+' error raised, with message : '+E.Message);
        end;
        //ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;
    end;
  end;

//  // overlayrecord := TOverlayRecord.Create;
//  if lRec.FRGameScenario.overlayName  <> 'empty' then
//  begin
//    fOver := vMapSetting.OverlayPath + lRec.FRGameScenario.overlayName + '\';
//    // overlayrecord.clearList;
//    // overlayRecord.loadFromFile(fOver);
//  end;
//
//  // predefined pattern
//  fPattern := vMapSetting.PatternPath + lRec.FRGameScenario.predefPatternName + '.dat'; ;
//  if FileExists(fPattern) then
//  begin
////    VSimMap.LoadPredefinedPattern(fPattern);   {comment by bebe}
//  end;

end;

{ TChannelMapping }

procedure TChannelMapping.AddtoChannelAvailable(
  rec: TRecExternal_Communication_Channel);
var
  i : Integer;
  isFound : Boolean;
  aComChannel : TExternal_Communication_Channel;
begin
  isFound := false;
  for i := 0 to ListComChannelAvailable.Count - 1 do
  begin
    aComChannel := TExternal_Communication_Channel(ListComChannelAvailable.Items[i]);
    if aComChannel.FData.Channel_Number = rec.Channel_Number then
    begin
      isFound := True;
      Break;
    end;
  end;

  if not isFound then
  begin
    aComChannel := TExternal_Communication_Channel.Create;
    aComChannel.FData := rec;
    ListComChannelAvailable.Add(aComChannel);
  end;
end;

procedure TChannelMapping.RemoveChannelAvailable(chNumber: integer);
var
  i : Integer;
  aComChannel : TExternal_Communication_Channel;
begin
  for i := ListComChannelAvailable.Count -1 downto 0 do
  begin
    aComChannel := TExternal_Communication_Channel(ListComChannelAvailable.Items[i]);
    if aComChannel.FData.Channel_Number = chNumber then
    begin
      ListComChannelAvailable.Delete(i);
      break;
    end;
  end;
end;

procedure TChannelMapping.ChangeBandChannelDef(chNumber: Integer;
  ChannelBand: Byte);
var
  i : Integer;
  isFound : Boolean;
  aComChannel : TExternal_Communication_Channel;
begin
  isFound := false;
  for i := 0 to ListComChannelMapping.Count - 1 do
  begin
    aComChannel := TExternal_Communication_Channel(ListComChannelMapping.Items[i]);
    if aComChannel.FData.Channel_Number = chNumber then
    begin
      isFound := True;
      aComChannel.FData.Comms_Band := ChannelBand;
      Break;
    end;
  end;

  if not isFound then
  begin
    for i := 0 to ListComChannelAvailable.Count - 1 do
    begin
      aComChannel := TExternal_Communication_Channel(ListComChannelAvailable.Items[i]);
      if aComChannel.FData.Channel_Number = chNumber then
      begin
        aComChannel.FData.Comms_Band := ChannelBand;
        break;
      end;
    end;
  end;
end;

procedure TChannelMapping.ChangeBandSecure(chNumber: Integer; Secure: Boolean);
var
  i : Integer;
  isFound : Boolean;
  aComChannel : TExternal_Communication_Channel;
begin
  isFound := false;
  for i := 0 to ListComChannelMapping.Count - 1 do
  begin
    aComChannel := TExternal_Communication_Channel(ListComChannelMapping.Items[i]);
    if aComChannel.FData.Channel_Number = chNumber then
    begin
      isFound := True;
      if Secure then
        aComChannel.FData.Channel_Security := 1
      else
        aComChannel.FData.Channel_Security := 0;

      Break;
    end;
  end;

  if not isFound then
  begin
    for i := 0 to ListComChannelAvailable.Count - 1 do
    begin
      aComChannel := TExternal_Communication_Channel(ListComChannelAvailable.Items[i]);
      if aComChannel.FData.Channel_Number = chNumber then
      begin
        if Secure then
          aComChannel.FData.Channel_Security := 1
        else
          aComChannel.FData.Channel_Security := 0;

        Break;
      end;
    end;
  end;
end;

procedure TChannelMapping.ChangeInterferenceChannel(chNumber : Integer;
  ChInterference: TModifCommInterference);
var
  i : Integer;
  isFound : Boolean;
  aComChannel : TExternal_Communication_Channel;
begin
  isFound := false;
  for i := 0 to ListComChannelMapping.Count - 1 do
  begin
    aComChannel := TExternal_Communication_Channel(ListComChannelMapping.Items[i]);
    if aComChannel.FData.Channel_Number = chNumber then
    begin
      isFound := True;
      aComChannel.FData.Channel_Interference := ChInterference;
      Break;
    end;
  end;

  if not isFound then
  begin
    for i := 0 to ListComChannelAvailable.Count - 1 do
    begin
      aComChannel := TExternal_Communication_Channel(ListComChannelAvailable.Items[i]);
      if aComChannel.FData.Channel_Number = chNumber then
      begin
        aComChannel.FData.Channel_Interference := ChInterference;
        Break;
      end;
    end;
  end;
end;

procedure TChannelMapping.ChangeLabelChannelDef(chNumber: Integer; ChannelIdent,
  ChannelCode: string; ChannelFreq : Double);
var
  i : Integer;
  isFound : Boolean;
  aComChannel : TExternal_Communication_Channel;
begin
  isFound := false;
  for i := 0 to ListComChannelMapping.Count - 1 do
  begin
    aComChannel := TExternal_Communication_Channel(ListComChannelMapping.Items[i]);
    if aComChannel.FData.Channel_Number = chNumber then
    begin
      isFound := True;
      aComChannel.FData.Channel_Identifier := ChannelIdent;
      aComChannel.FData.Channel_Code := ChannelCode;
      aComChannel.FData.Channel_Freq := ChannelFreq;
      Break;
    end;
  end;

  if not isFound then
  begin
    for i := 0 to ListComChannelAvailable.Count - 1 do
    begin
      aComChannel := TExternal_Communication_Channel(ListComChannelAvailable.Items[i]);
      if aComChannel.FData.Channel_Number = chNumber then
      begin
        aComChannel.FData.Channel_Identifier := ChannelIdent;
        aComChannel.FData.Channel_Code := ChannelCode;
        aComChannel.FData.Channel_Freq := ChannelFreq;
        Break;
      end;
    end;
  end;
end;

procedure TChannelMapping.RemoveChannelDef(chNumber : integer);
var
  i : Integer;
  isFound : Boolean;
  aComChannel : TExternal_Communication_Channel;
begin
  isFound := False;
  for i := 0 to ListComChannelMapping.Count - 1 do
  begin
    aComChannel := TExternal_Communication_Channel(ListComChannelMapping.Items[i]);
    if aComChannel.FData.Channel_Number = chNumber then
    begin
      isFound := True;
      ListComChannelMapping.Delete(i);
      break;
    end;
  end;

  if not isFound then
  begin
    for i := 0 to ListComChannelAvailable.Count - 1 do
    begin
      aComChannel := TExternal_Communication_Channel(ListComChannelAvailable.Items[i]);
      if aComChannel.FData.Channel_Number = chNumber then
      begin
        ListComChannelAvailable.Delete(i);
        Break;
      end;
    end;
  end;
end;

procedure TChannelMapping.AddtoChannelMapping(
  rec: TRecExternal_Communication_Channel);
var
  i : Integer;
  isFound : Boolean;
  aComChannel : TExternal_Communication_Channel;
begin
  isFound := false;
  for i := 0 to ListComChannelMapping.Count - 1 do
  begin
    aComChannel := TExternal_Communication_Channel(ListComChannelMapping.Items[i]);
    if aComChannel.FData.Channel_Number = rec.Channel_Number then
    begin
      isFound := True;
      Break;
    end;
  end;

  if not isFound then
  begin
    aComChannel := TExternal_Communication_Channel.Create;
    aComChannel.FData := rec;
    ListComChannelMapping.Add(aComChannel);
  end;
end;

procedure TChannelMapping.ClearChannelMapping;
var
  i : integer;
begin
  for i := ListComChannelMapping.Count -1 downto 0 do
  begin
    ListComChannelMapping.Delete(i);
  end;
  ListComChannelMapping.Free;
end;

procedure TChannelMapping.ClearChannelAvailable;
var
  i : integer;
begin
  for i := ListComChannelAvailable.Count -1 downto 0 do
  begin
    ListComChannelAvailable.Delete(i);
  end;
  ListComChannelAvailable.Free;
end;

procedure TChannelMapping.RemoveChannelMapping(chNumber: integer);
var
  i : Integer;
  aComChannel : TExternal_Communication_Channel;
begin
  for i := ListComChannelMapping.Count -1 downto 0 do
  begin
    aComChannel := TExternal_Communication_Channel(ListComChannelMapping.Items[i]);
    if aComChannel.FData.Channel_Number = chNumber then
    begin
      ListComChannelMapping.Delete(i);
      break;
    end;
  end;
end;

constructor TChannelMapping.create;
begin
  ListComChannelMapping := TList.Create;
  ListComChannelAvailable := TList.Create;
end;

destructor TChannelMapping.destroy;
var
  i : integer;
begin
  for i := ListComChannelMapping.Count - 1 downto 0 do
  begin
    ListComChannelMapping.Delete(i);
  end;
  ListComChannelMapping.Clear;
  ListComChannelMapping.Free;

  for i := ListComChannelAvailable.Count downto 0 do
  begin
    ListComChannelAvailable.Delete(i);
  end;

  ListComChannelAvailable.Clear;
  ListComChannelAvailable.Free;

  inherited;
end;

procedure TSimMgr_Client.RemoveDetectedTrackByDataLink(
  aPlatformDetectedID: integer; dataLink: TT3DataLink;
  aDetectByPlatformID: integer);
var
  i: integer;
  track: TT3DetectedTrack;
  sensor: TT3Sensor;
  J: integer;
  item : TT3DLNCSTrackEntityItem;
begin
  // jk benar controledPlatform-nya adalah receiver datalink -> hapus detected by datalink
  for i := SimDetectedTrackList.itemCount - 1 downto 0 do
  begin
    track := SimDetectedTrackList.getObject(i) as TT3DetectedTrack;

    if Assigned(track) and Assigned(track.TrackObject) and
      (track.TrackObject.InstanceIndex = aPlatformDetectedID) then
    begin
      for J := track.TrackDetectedBy.Count - 1 downto 0 do
      begin
        sensor := track.TrackDetectedBy.Items[J];
        if sensor is TT3DataLink and sensor.Equals(dataLink) then
        begin
          item := dataLink.getNCSEntityByIndex(aPlatformDetectedID);
          if Assigned(item) then
            if item.NEIOwnerID = aDetectByPlatformID then
              track.TrackDetectedBy.Delete(J);
        end;
      end;

      if track.TrackDetectedBy.Count < 1 then
      begin
        track.Dormant := true;
      end;

      break;
    end;
  end;
end;

end.
