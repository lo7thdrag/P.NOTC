program BridgeDelphiCSharp;

uses
  Vcl.Forms,
  ufrmMain in 'ufrmMain.pas' {MainForm},
  uTCPServer in '..\LibNets\NetComponent\uTCPServer.pas',
  uDataBuffer in '..\LibNets\NetComponent\uDataBuffer.pas',
  uNetBaseSocket in '..\LibNets\NetComponent\uNetBaseSocket.pas',
  uPacketRegister in '..\LibNets\NetComponent\uPacketRegister.pas',
  uTCPDatatype in '..\LibNets\NetComponent\uTCPDatatype.pas',
  uDataRec in '..\uDataRec.pas',
  Grijjy.Bson.IO in '..\LibNets\Grijjy\Grijjy.Bson.IO.pas',
  Grijjy.Bson in '..\LibNets\Grijjy\Grijjy.Bson.pas',
  Grijjy.Bson.Serialization in '..\LibNets\Grijjy\Grijjy.Bson.Serialization.pas',
  uThreadSafeQueue in '..\LibNets\NetLinkComp\uThreadSafeQueue.pas',
  uDataType in '..\LibNets\NetLinkComp\uDataType.pas',
  uHelper in '..\LibNets\NetLinkComp\uHelper.pas',
  uBuffer in '..\LibNets\NetLinkComp\uBuffer.pas',
  UPacketProtocol in '..\LibNets\NetLinkComp\UPacketProtocol.pas',
  uDataManager in '..\LibNets\NetLinkComp\uDataManager.pas',
  uNetLinkClient in '..\LibNets\NetLinkComp\uNetLinkClient.pas',
  UDataRecJSON in '..\UDataRecJSON.pas',
  Grijjy.SysUtils in '..\LibNets\Grijjy\Grijjy.SysUtils.pas',
  Grijjy.DateUtils in '..\LibNets\Grijjy\Grijjy.DateUtils.pas',
  Grijjy.BinaryCoding in '..\LibNets\Grijjy\Grijjy.BinaryCoding.pas',
  Grijjy.Collections in '..\LibNets\Grijjy\Grijjy.Collections.pas',
  uTCPClient in '..\LibNets\NetComponent\uTCPClient.pas',
  uBaseCoordSystem in 'uBaseCoordSystem.pas',
  uNetLinkServer in '..\LibNets\NetLinkComp\uNetLinkServer.pas',
  uNetUDPnode in '..\LibNets\NetComponent\uNetUDPnode.pas',
  ufrmDisplay in 'ufrmDisplay.pas' {frmDisplay},
  ufrmSetting in 'ufrmSetting.pas' {frmSetting},
  ufrmLog in 'ufrmLog.pas' {frmLog};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown:= True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDisplay, frmDisplay);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmSetting, frmSetting);
  Application.CreateForm(TfrmLog, frmLog);
  Application.Run;
end.
