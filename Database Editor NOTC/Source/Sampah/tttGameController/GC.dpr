program GC;

uses
  Forms,
  uNetBaseSocket in '..\SimFramework\LibNets\NetComponent\uNetBaseSocket.pas',
  uPacketBuffer in '..\SimFramework\LibNets\NetComponent\uPacketBuffer.pas',
  uPacketRegister in '..\SimFramework\LibNets\NetComponent\uPacketRegister.pas',
  uTCPClient in '..\SimFramework\LibNets\NetComponent\uTCPClient.pas',
  uTCPDatatype in '..\SimFramework\LibNets\NetComponent\uTCPDatatype.pas',
  uTCPServer in '..\SimFramework\LibNets\NetComponent\uTCPServer.pas',
  uNetSessionClient in '..\LibTTT\libNetSession\uNetSessionClient.pas',
  uNetSessionData in '..\LibTTT\libNetSession\uNetSessionData.pas',
  uBaseNetHandler in '..\SimFramework\LibNets\uBaseNetHandler.pas',
  uExecuter in '..\SimFramework\LibComponent\Executor\uExecuter.pas',
  uCodecBase64 in '..\SimFramework\LibComponent\Base64\uCodecBase64.pas',
  uIniFilesProcs in '..\SimFramework\LibBaseUtils\uIniFilesProcs.pas',
  ufMainGC in 'ufMainGC.pas' {frmMainGC},
  uThreadTimer in '..\SimFramework\LibBaseUtils\Counter\uThreadTimer.pas',
  uSteppers in '..\SimFramework\LibBaseUtils\Counter\uSteppers.pas',
  ufStartSession in 'ufStartSession.pas' {frmStartSession},
  ufStartExerciseWizard in 'ufStartExerciseWizard.pas' {frmStartExerciseWizard},
  ufStartReplayRecorded in 'ufStartReplayRecorded.pas' {frmStartReplayRecorded},
  ufAudioTrackSetting in 'ufAudioTrackSetting.pas' {frmAudioTrackSetting},
  ufConnectTerminate in 'ufConnectTerminate.pas' {frmConnectTerminate},
  GmXml in '..\SimFramework\LibComponent\XMLReader\GmXml.pas',
  GmXMLInterface in '..\SimFramework\LibComponent\XMLReader\GmXMLInterface.pas',
  uT3GroupList in '..\LibTTT\libNetSession\uT3GroupList.pas',
  uStringFunc in '..\SimFramework\LibBaseUtils\StringUtils\uStringFunc.pas',
  uLibSettingTTT in '..\LibTTT\uLibSettingTTT.pas',
  uDMGC in 'uDMGC.pas' {DMGC: TDataModule};

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TTT Game Controller';
  Application.CreateForm(TDMGC, DMGC);

  Application.CreateForm(TfrmMainGC, frmMainGC);
  Application.CreateForm(TfrmStartSession, frmStartSession);
  Application.CreateForm(TfrmStartExerciseWizard, frmStartExerciseWizard);
  Application.CreateForm(TfrmStartReplayRecorded, frmStartReplayRecorded);
  Application.CreateForm(TfrmAudioTrackSetting, frmAudioTrackSetting);
  Application.CreateForm(TfrmConnectTerminate, frmConnectTerminate);

  uNetSessionClient.BeginClient;

  uNetSessionClient.theClient.ApplySetting;

  frmMainGC.ApplySetting;


  theClient.OnReceiveOnlineList := frmStartExerciseWizard.EventOnReceiveOnlineList;
  theClient.OnReceiveSession    := frmMainGC.EventOnReceiveSession;


  Application.Run;

  uNetSessionClient.EndClient;

end.
