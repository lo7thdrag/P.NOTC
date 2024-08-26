unit uScriptSimClients;


interface

  procedure BeginGame;
  procedure EndGame;

implementation

uses
   uScriptCommon,
   SysUtils, Controls, Forms,
   uLibSettingTTT, uSimMgr_Client,
   uNethandle_Client,
   uMapXHandler,
   ufTacticalDisplay, uCoordConvertor;


procedure BeginGame;
var iResult: Integer;
    bResult : Boolean;
    p: string;
    scale : double;

begin
  BeginGameCommon;

  if vMapSetting.FullScreen then
    frmTacticalDisplay.Be_A_FullMap(true);

  LoadFF_NetClientSetting(vSettingFile, vNetClientSetting);
  LoadFF_CubicalAssignSetting(vSettingFile, vCubicalAssignSetting);


  VConvertor      := TCoordConverter.Create;
//  VConvertor.FMap := frmTacticalDisplay.Map1;
  VConvertor.FMap := frmTacticalDisplay.fmMapWindow1.Map;

//  VSimMap := TSimMap.Create(frmTacticalDisplay.Map1);
  VSimMap := TSimMap.Create(frmTacticalDisplay.fmMapWindow1.Map );

  simMgrClient            := TSimMgr_Client.Create;

  simMgrClient.ApplySetting;

  VSimMap.OnDrawToCanvas  := simMgrClient.DrawAll;
  VSimMap.OnMapChange     := simMgrClient.OnMapChange;
  simMgrClient.OnMapViewChange  := frmTacticalDisplay.MapViewChanged;
  VSimMap.OnToolUsed      := frmTacticalDisplay.MapToolUsed;
  VSimMap.OnMapMouseMove  := frmTacticalDisplay.MapMouseMove;
  VSimMap.OnMapMouseDown  := frmTacticalDisplay.MapMouseDown;
  VSimMap.OnMapMouseUp    := frmTacticalDisplay.MapMouseUp;

  simMgrClient.LoadScenarioId(vGameDataSetting);

  simMgrClient.OnUpdateForm := frmTacticalDisplay.UpdateFormData;


  frmTacticalDisplay.SetRoleClient(simMgrClient.ClientRole);


  VNetClient                  := TNetHandler_Client.Create;
  VNetClient.GamePort         := vNetSetting.GamePort;
  VNetClient.CommandPort      := vNetSetting.CommandPort;
  VNetClient.BroadCastAddress := vNetSetting.GameAddress;
  VNetClient.ServerIP         := vNetClientSetting.ServerIP;

  VNetClient.StartNetworking;

  if Assigned(simMgrClient.OwnShipPlatform) then begin
    frmTacticalDisplay.SetControlledPlatform(simMgrClient.OwnShipPlatform);
  end;

  simMgrClient.InitNetwork;
  simMgrClient.GameStart;
//  frmLog.;
end;

procedure EndGame;
begin
  VNetClient.StopNetworking;
  VNetClient.Free;


  simMgrClient.Free;

  VSimMap.Free;
  VConvertor.Free;

end;



end.


