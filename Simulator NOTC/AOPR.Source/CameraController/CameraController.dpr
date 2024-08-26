program CameraController;

uses
  Forms,
  ufmMainDashboard in 'ufmMainDashboard.pas' {fmMainDashboard},
  uTCPClient in '..\SimFramework\LibNets\NetComponent\uTCPClient.pas',
  uNetHandle_TTT in '..\LibTTT\netTTT\uNetHandle_TTT.pas',
  uBaseNetHandler in '..\SimFramework\LibNets\uBaseNetHandler.pas',
  uDataBuffer in '..\SimFramework\LibNets\NetComponent\uDataBuffer.pas',
  uNetBaseSocket in '..\SimFramework\LibNets\NetComponent\uNetBaseSocket.pas',
  uGameData_TTT in '..\LibTTT\netTTT\uGameData_TTT.pas',
  uPacketRegister in '..\SimFramework\LibNets\NetComponent\uPacketRegister.pas',
  uTCPDatatype in '..\SimFramework\LibNets\NetComponent\uTCPDatatype.pas',
  tttData in '..\LibTTT\libDBScenario\tttData.pas',
  uT3Listener in '..\LibTTT\libUnit\uT3Listener.pas',
  uNetUDPnode in '..\SimFramework\LibNets\NetComponent\uNetUDPnode.pas',
  uScriptCommon in 'uScriptCommon.pas',
  uLibSettingTTT in '..\LibTTT\uLibSettingTTT.pas',
  uCodecBase64 in '..\SimFramework\LibComponent\Base64\uCodecBase64.pas',
  uIniFilesProcs in '..\SimFramework\LibBaseUtils\uIniFilesProcs.pas',
  uNetCameraController in 'uNetCameraController.pas',
  uCameraControllerManager in 'uCameraControllerManager.pas',
  uPlatformData in 'uPlatformData.pas',
  uSteppers in '..\SimFramework\LibBaseUtils\Counter\uSteppers.pas',
  uThreadTimer in '..\SimFramework\LibBaseUtils\Counter\uThreadTimer.pas',
  uDataTypes in '..\SimFramework\LibBaseUtils\CoordSystem\uDataTypes.pas',
  uCameraDataModule in 'uCameraDataModule.pas' {dmCamera: TDataModule},
  uCameraData in 'uCameraData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Camera Controller';
  Application.MainFormOnTaskbar := False;
  Application.CreateForm(TfmMainDashboard, fmMainDashboard);
  Application.CreateForm(TdmCamera, dmCamera);
  BeginGameCommon;
  fmMainDashboard.Initialize;

  Application.Run;
end.
