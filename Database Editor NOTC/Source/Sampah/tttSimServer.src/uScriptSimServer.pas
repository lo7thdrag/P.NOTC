unit uScriptSimServer;


interface

  procedure BeginGame_Server;
  procedure EndGame_Server;

implementation

uses
  SysUtils,
  uScriptCommon,
  uMapXData, ufMapWindow,

  uLibSettingTTT, ufMainGServer,
  uNetHandle_Server, uSimMgr_Server;


procedure BeginGame_Server;
begin
  BeginGameCommon;

  VMapData := TSimMapData.Create;
  if FileExists(vMapSetting.MapDataGeoset)  then
    VMapData.LoadDataMap(vMapSetting.MapDataGeoset);

  simMgrServer := TSimMgr_Server.Create;
  simMgrServer.OnLogStr := fMainGServer.LogStr;

  simMgrServer.LoadScenarioId(vGameDataSetting);

  LoadFF_NetServerSetting(vSettingFile, vNetServerSetting);

  VNetServer              := TNetHandle_Server.Create;
  VNetServer.GamePort     := vNetSetting.GamePort;
  VNetServer.CommandPort  := vNetSetting.CommandPort;
  VNetServer.BroadCastAddress := vNetSetting.GameAddress;

  VNetServer.OnClientConnect    :=  simMgrServer.FNetServerOnClientConnect;
  VNetServer.OnClientDisConnect :=  simMgrServer.FNetServerOnClientDisConnect;


  VNetServer.StartNetworking;

  simMgrServer.InitNetwork;
  simMgrServer.BroadcastData := true;

  simMgrServer.GameStart;


end;

procedure EndGame_Server;
begin

  simMgrServer.GamePause;

  VNetServer.StopNetworking;
  VNetServer.Free;

  simMgrServer.Free;

  VMapData.Free;
end;



end.


