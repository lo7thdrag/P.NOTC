program SessionServer;

uses
  Forms,
  Windows,
  Messages,
  uCodecBase64 in '..\SimFramework\LibBaseUtils\StringUtils\uCodecBase64.pas',
  uIniFilesProcs in '..\SimFramework\LibBaseUtils\uIniFilesProcs.pas',
  uLibSettingTTT in '..\LibTTT\uLibSettingTTT.pas',
  uPacketBuffer in '..\SimFramework\LibNets\NetComponent\uPacketBuffer.pas',
  uPacketRegister in '..\SimFramework\LibNets\NetComponent\uPacketRegister.pas',
  uNetBaseSocket in '..\SimFramework\LibNets\NetComponent\uNetBaseSocket.pas',
  uTCPClient in '..\SimFramework\LibNets\NetComponent\uTCPClient.pas',
  uTCPServer in '..\SimFramework\LibNets\NetComponent\uTCPServer.pas',
  uNetSessionData in '..\LibTTT\libNetSession\uNetSessionData.pas',
  uBaseNetHandler in '..\SimFramework\LibNets\uBaseNetHandler.pas',
  uExecuter in '..\SimFramework\LibComponent\Executor\uExecuter.pas',
  ufMainSessionSvr in 'ufMainSessionSvr.pas' {frmMainSessionSvr},
  uNetHandler in '..\SimFramework\LibNets\uNetHandler.pas',
  uThreadTimer in '..\SimFramework\LibBaseUtils\Counter\uThreadTimer.pas',
  uNetSessionServer in '..\LibTTT\libNetSession\uNetSessionServer.pas';

{$R *.res}

var
  Mutex : THandle;

begin

  MyMsg := RegisterWindowMessage('TTTSessionServer_Message');
  Mutex := CreateMutex(nil, True, 'TTTSessionServer_Mutex');
  if (Mutex = 0) OR (GetLastError = ERROR_ALREADY_EXISTS) then
  begin

    SendMessage(HWND_BROADCAST, MyMsg, 0, 0);

    Application.MessageBox('Another Session Server has already running.',
      'TTT Session Server', MB_OK + MB_ICONINFORMATION);

  end
  else begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;

    uNetSessionServer.BeginServer;

    Application.Title := 'TTT Session Server';
    Application.CreateForm(TfrmMainSessionSvr, frmMainSessionSvr);


    theServer.OnStateChange       := frmMainSessionSvr.ServerChangeState;
    theServer.OnClientConnect     := frmMainSessionSvr.ServerClientConnect;
    theServer.OnClientDisConnect  := frmMainSessionSvr.ServerClientDisConnect;

    theServer.OnSessionStateChange := frmMainSessionSvr.SessionStateChange;
    theServer.OnNetLog             := frmMainSessionSvr.EventOnNetLog;

    theServer.ApplySetting;

    frmMainSessionSvr.ApplySetting;


    Application.Run;

    uNetSessionServer.EndServer;

    if Mutex <> 0 then
      CloseHandle(Mutex);
  end;


end.
