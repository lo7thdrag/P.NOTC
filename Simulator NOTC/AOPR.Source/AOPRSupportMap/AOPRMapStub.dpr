program AOPRMapStub;

uses
  Forms,
  Classes,
  SysUtils,
  Windows,
  uMain in 'uMain.pas' {MainForm},
  uNetHandle_TTT in '..\LibTTT\netTTT\uNetHandle_TTT.pas',
  uMapStub in 'uMapStub.pas',
  uLibSettingTTT in '..\LibTTT\uLibSettingTTT.pas',
  uScriptCommon in 'uScriptCommon.pas',
  uNetStub in 'uNetStub.pas',
  uNetBaseSocket in '..\SimFramework\LibNets\NetComponent\uNetBaseSocket.pas',
  uNetUDPnode in '..\SimFramework\LibNets\NetComponent\uNetUDPnode.pas',
  uPacketRegister in '..\SimFramework\LibNets\NetComponent\uPacketRegister.pas',
  uBaseNetHandler in '..\SimFramework\LibNets\uBaseNetHandler.pas',
  uTCPDatatype in '..\SimFramework\LibNets\NetComponent\uTCPDatatype.pas',
  uIniFilesProcs in '..\SimFramework\LibBaseUtils\uIniFilesProcs.pas',
  uTCPServer in '..\SimFramework\LibNets\NetComponent\uTCPServer.pas',
  uTCPClient in '..\SimFramework\LibNets\NetComponent\uTCPClient.pas',
  uGameData_TTT in '..\LibTTT\netTTT\uGameData_TTT.pas',
  uThreadTimer in '..\SimFramework\LibBaseUtils\Counter\uThreadTimer.pas',
  uPacketBuffer in '..\SimFramework\LibNets\NetComponent\uPacketBuffer.pas',
  uDataTypes in '..\SimFramework\LibBaseUtils\CoordSystem\uDataTypes.pas',
  uStringFunc in '..\SimFramework\LibBaseUtils\StringUtils\uStringFunc.pas',
  uSteppers in '..\SimFramework\LibBaseUtils\Counter\uSteppers.pas',
  uMapLayerDB in 'uMapLayerDB.pas',
  tttData in '..\LibTTT\libDBScenario\tttData.pas',
  uBaseCoordSystem in '..\SimFramework\LibBaseUtils\CoordSystem\uBaseCoordSystem.pas',
  uCoordConvertor in '..\SimFramework\LibBaseUtils\CoordSystem\uCoordConvertor.pas',
  uMapXHandler in '..\LibTTT\uMapXHandler.pas',
  uDataBuffer in '..\SimFramework\LibNets\NetComponent\uDataBuffer.pas',
  uNetSessionData in '..\LibTTT\libNetSession\uNetSessionData.pas',
  uVirtualTime in '..\SimFramework\LibBaseUtils\Counter\uVirtualTime.pas',
  uTMapTouch2 in '..\LibTTT\uTMapTouch2.pas',
  uT3Listener in '..\LibTTT\libUnit\uT3Listener.pas',
  uCodecBase64 in '..\SimFramework\LibComponent\Base64\uCodecBase64.pas',
  uGamePlayType in '..\AOPRReplay\uGamePlayType.pas';

{$R *.res}

var
  Mutex : THandle;

begin
  MyMsg := RegisterWindowMessage('NOPRMapStub_Message');
  Mutex := CreateMutex(nil, True, 'NOPRMapStub_Mutex');
  if (Mutex = 0) OR (GetLastError = ERROR_ALREADY_EXISTS) then
  begin

    SendMessage(HWND_BROADCAST, MyMsg, 0, 0);

    Application.MessageBox('Another MapStub has already running.',
      'NOPR Map Stub', MB_OK + MB_ICONINFORMATION);
    Application.Terminate;

  end
  else begin
    Application.Initialize;
    Application.MainFormOnTaskbar := false;

    Application.Title := 'AOPR Map Stub';
    Application.CreateForm(TMainForm, MainForm);
    Application.ShowMainForm := false;
    BeginGameCommon;

    MainForm.lblMapData.Caption := vMapSetting.MapDataGeoset;
    MainForm.lblGeoset.Caption  := vMapSetting.MapGeoset;
    MainForm.lblPort.Caption    := IntToStr(vNetSetting.MapStubPort);
    MainForm.lblGCPort.Caption  := IntToStr(vNetSetting.MapStubGCPort);

    Application.Run;

    EndGameCommon;
    if Mutex <> 0 then
      CloseHandle(Mutex);
  end;
end.
