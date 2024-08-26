unit uScriptCommon;

interface


  procedure BeginGameCommon;
  procedure EndGameCommon;


implementation

uses
  uLibSettingTTT, SysUtils,
  uNetStub, uGameData_TTT, uTCPDatatype,
  uMapStub, uMain, uMapLayerDB;

procedure BeginGameCommon;
begin

  vSettingFile := getFileSetting;

  LoadFF_NetSetting(vSettingFile, vNetSetting);
  LoadFF_MapSetting(vSettingFile, vMapSetting);
  LoadFF_GameSetting(vSettingFile, vGameDataSetting);
  LoadFF_dBaseSetting(vSettingFile, vDBSetting);
  LoadFF_PortMapArea(vSettingFile, vPortMapArea);

  DepthLayerDB          := TMapStubLayerDb.Create(vMapSetting.MapDataGeoset);
  DepthLayerDB.OnLogStr := MainForm.OnLogStr;

  VNetStub          := TNetStub.Create;
  VNetStubGC        := TNetStubGC.Create;
  VMapStub          := TMapStub.create;
  VMapStub.OnLogStr := MainForm.OnLogStr;

  VNetStub.OnLogStr   := MainForm.OnLogStr;
  VNetStub.StubPort   := vNetSetting.MapStubPort;
  VNetStub.StubAddr   := vNetSetting.MapStubAddr;

  VNetStubGC.OnLogStr   := MainForm.OnLogStr;
  VNetStubGC.StubPort   := vNetSetting.MapStubGCPort;
  VNetStubGC.StubAddr   := vNetSetting.MapStubAddr;

  VNetStub.StartNetworking;
  VNetStub.StartListen;

  VNetStubGC.StartNetworking;
  VNetStubGC.StartListen;
end;

procedure EndGameCommon;
begin
  VMapStub.Free;
  VNetStub.StopListen;
  VNetStub.StopNetworking;
  VNetStubGC.StopListen;
  VNetStubGC.StopNetworking;

  VNetStub.Free;
  VNetStubGC.Free;
  DepthLayerDB.Free;
end;


end.
