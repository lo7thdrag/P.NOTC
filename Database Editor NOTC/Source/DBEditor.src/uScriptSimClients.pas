unit uScriptSimClients;


interface

  procedure BeginGame;
  procedure EndGame;

implementation

uses
   SysUtils, Controls, Forms,

   uLibSettingTTT,  uSimMgr_Client,
   uDataModuleTTT, ufDBSetting,
   uMapXHandler,
   ufTacticalDisplay, uCoordConvertor;


procedure BeginGame;
var iResult: Integer;
    bResult : Boolean;
    p: string;
begin
  DateSeparator     := '/';
  TimeSeparator     := ':';
  DecimalSeparator  := '.';
  ThousandSeparator := ',';

  vSettingFile := getFileSetting;

  LoadFF_NetSetting(vSettingFile, vNetSetting);
  LoadFF_NetClientSetting(vSettingFile, vNetClientSetting);
  LoadFF_MapSetting(vSettingFile, vMapSetting);
  LoadFF_GameSetting(vSettingFile, vGameDataSetting);
  LoadFF_dBaseSetting(vSettingFile, vDBSetting);

  LoadFF_SymbolSetting(vSettingFile, vSymbolSetting);

{  netClient           := TNetMgr_Client.Create;
  netClient.BasePort  := IntToStr(vNetSetting.BasePort);
  netClient.ServerIP  := vNetClientSetting.ServerIP;
  netClient.SetDebugForm(frmDebug);
  frmDebug.SetAsClientDebug;
  frmDebug.Show;
}
  frmDBSEtting := TfrmDBSetting.Create(nil);

  iResult := mrNone;
  repeat
    with vDBSetting do
      bResult := dmTTT.InitZDB(dbServer, dbProto, dbName, dbUser, dbPass);

    if not bResult then begin

      with vDBSetting do begin
        frmDBSetting.dbServer := DBServer;
        frmDBSetting.dbName   := DBName;
        frmDBSetting.dbUser   := DBUser;
        frmDBSetting.dbPass   := DBPass;
      end;

      iResult := frmDBSEtting.ShowModal;

      if iResult = mrOk then begin
        vDBSetting.DBServer  := frmDBSetting.dbServer ;
        vDBSetting.DBName    := frmDBSetting.dbName   ;
        vDBSetting.DBUser    := frmDBSetting.dbUser   ;
        vDBSetting.DBPass    := frmDBSetting.dbPass   ;
        vDBSetting.dbProto   := c_defaultDBProto ;
      end;
    end
    else begin
      if (iResult = mrOk) then
        SaveFF_dBaseSetting(vSettingFile, vDBSetting);

    end;
  until  bResult or (iResult = mrCancel);
  frmDBSetting.Free;

  if (iResult = mrCancel) then Application.Terminate;

  VConvertor      := TCoordConverter.Create;
  VConvertor.FMap := frmTacticalDisplay.Map1;

  VSimMap := TSimMap.Create(frmTacticalDisplay.Map1);

  with vMapSetting do begin
    VSimMap.LoadMap(MapPath + MapGeoset);
    VSimMap.ApplySetting(MapZoom,  mX, mY, colorbg);
  end;

  simMgrClient        := TSimMgr_Client.Create;

  VSimMap.OnDrawToCanvas  := simMgrClient.DrawAll;
  VSimMap.OnMapChange     := simMgrClient.OnMapChange;

  simMgrClient.LoadScenarioId(vGameDataSetting);

  simMgrClient.OnUpdateForm := frmTacticalDisplay.UpdateFormData;
  simMgrClient.GameStart;

//  mr := frmConnectionSetting.ShowModal;
//  if mr = mrOk then
//    simMgrClient.LoadScenario;
//  if LibNetSetting.AutoStart then
//    netClient.StartNetworking;

end;

procedure EndGame;
begin
  //netClient.Free;

  simMgrClient.Free;

end;



end.


