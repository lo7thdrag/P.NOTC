unit uScriptSimReplay;

interface

procedure BeginGameReplay;
procedure EndGameReplay;

implementation

uses uScriptCommon,
  SysUtils,
  uMapXData,
  uGamePlayType,
  uLibSettingTTT,
  uT3ReplayManager,
  Dialogs,
  Forms,
  ufrmLog,
  uFilter;

procedure BeginGameReplay;
begin
  BeginGameCommon;

  LoadFF_NetClientSetting(vSettingFile, vNetClientSetting);
  LoadFF_CubicalAssignSetting(vSettingFile, vCubicalAssignSetting);
  LoadFF_AppSetting(vSettingFile, vAppSetting);
  vFilter := TFilter.Create;

  if vGameDataSetting.GamePlayMode.GameType <> 2 then
  begin
    MessageDlg('Not in Replay Mode..!', mtError, [mbOK], 0);
    Application.Terminate;
  end else begin
    ReplayManager                           := TT3ReplayManager.Create(False);
    ReplayManager.OnLogStr                  := frmReplay.OnLogStr;
    ReplayManager.OnUpdateGameInfo          := frmReplay.updateGameInfo;
    ReplayManager.OnResetReplay             := frmReplay.OnResetreplay;
    frmReplay.Timer1.Enabled                := true;
    ReplayManager.Reader.OnReaderTickNotify := frmReplay.OnTickNotify;
  end;
end;

procedure EndGameReplay;
begin
  if Assigned(ReplayManager) then begin
    ReplayManager.GamePause;
    ReplayManager.Free;
  end;

end;

end.
