unit uScriptCommon;

interface

  procedure BeginGameCommon;
  procedure EndGameCommon;

implementation

uses
  uLibSettingTTT, uNetCameraController, uGameData_TTT, uCameraControllerManager,
  uCameraDataModule, Dialogs;

procedure BeginGameCommon;
begin
  vSettingFile := getFileSetting;

  LoadFF_NetSetting(vSettingFile, vNetSetting);
  LoadFF_NetClientSetting(vSettingFile, vNetClientSetting);
  LoadFF_dBaseSetting(vSettingFile, vDBSetting);
  LoadFF_GameSetting(vSettingFile, vGameDataSetting);
  LoadFF_TerrainArea(vSettingFile, vTerrainArea);

  VNetCameraController := TNetCameraController.Create;
  VNetCameraController.GamePort := vNetSetting.GamePort;
  VNetCameraController.CommandPort := vNetSetting.CommandPort;
  VNetCameraController.BroadCastAddress := vNetSetting.GameAddress;
  VNetCameraController.ServerIP := vNetClientSetting.ServerIP;
  VNetCameraController.StartNetworking;

  with vDBSetting do
    dmCamera.InitZDB(dbServer, dbProto, dbName, dbUser, dbPass);

  CameraControllerManager := TCameraControllerManager.Create;
  CameraControllerManager.SessionID := vGameDataSetting.GameSessionID;
  CameraControllerManager.InitNetwork;
  CameraControllerManager.GetPlatformDataFromDB;

  VNetCameraController.OnConnected := CameraControllerManager.NetOnConnected;
  VNetCameraController.OnDisconnected :=
    CameraControllerManager.NetOnDisconnected;
end;

procedure EndGameCommon;
begin
  VNetCameraController.StopNetworking;
  VNetCameraController.Free;
end;

end.
