unit ufMainGC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, StdCtrls;

type

  TfrmMainGC = class(TForm)
    MainMenu1: TMainMenu;
    mnSession: TMenuItem;
    mnStart1: TMenuItem;
    mnConnect1: TMenuItem;
    mnTerminate1: TMenuItem;
    mnDelete1: TMenuItem;
    mnDevelopment1: TMenuItem;
    mnExplorer1: TMenuItem;
    mnLogOut1: TMenuItem;
    mnHelp: TMenuItem;
    mnStartDatabaseDeveloper1: TMenuItem;
    mnPreplay1: TMenuItem;
    mnStartStudentpreplay1: TMenuItem;
    mnStudentPreplayStatus1: TMenuItem;
    mnStartExplorer1: TMenuItem;
    mnLogout2: TMenuItem;
    mnContent1: TMenuItem;
    mnAbout: TMenuItem;
    procedure mnStart1Click(Sender: TObject);
    procedure mnConnect1Click(Sender: TObject);
    procedure mnTerminate1Click(Sender: TObject);
    procedure mnDelete1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    isCtrl: Boolean;

  public
    { Public declarations }
    procedure EventOnReceiveSession(Sender: TObject);
    procedure ApplySetting;
  end;

var
  frmMainGC: TfrmMainGC;

implementation

uses
  uNetSessionClient, ufStartSession, ufConnectTerminate, ufStartExerciseWizard,
  uLibSettingTTT;

{$R *.dfm}

procedure TfrmMainGC.mnStart1Click(Sender: TObject);
var mr: integer;
begin
  frmStartSession.DisplaySenarioList;

  mr := frmStartSession.ShowModal;

  if (mr = mrOK) then begin
    theClient.RequestOnlineList;

    frmStartExerciseWizard.ExerciseName := frmStartSession.SelectedName;
    frmConnectTerminate.ExerciseName    := frmStartSession.SelectedName;


    if frmStartExerciseWizard.StartNewExercise(
      frmStartSession.SelectedSCID)  then begin

      vGameDataSetting.ScenarioID       := frmStartSession.SelectedSCID;
      vGameDataSetting.OwnShipPlatfomID := frmStartExerciseWizard.selectedPlatform;

      SaveFF_GameSetting(vSettingFile, vGameDataSetting);

      theClient.SendStartGameSession(frmStartSession.SelectedSCID,
        frmStartExerciseWizard.ExerciseName);
    end
    else
      ShowMessage('Scenario selection has been canceled by user.');
  end;
end;

procedure TfrmMainGC.mnTerminate1Click(Sender: TObject);
var mr: integer;
begin
  frmConnectTerminate.SetAsTerminate;

  mr := frmConnectTerminate.ShowModal;

  if frmConnectTerminate.OKTerminate then
    theClient.SendTerminateGameSession;
end;

procedure TfrmMainGC.mnConnect1Click(Sender: TObject);
begin
  frmConnectTerminate.SetAsConnect;

  frmConnectTerminate.ShowModal;

  if frmConnectTerminate.OKConnect then begin
    theClient.ConnectGameSession;
  end;

end;

procedure TfrmMainGC.ApplySetting;
var i: integer;
begin
  Caption := theClient.ConsoleName;

  isCtrl := theClient.IsController;

  mnSession.Enabled := true;
    mnStart1.Enabled      := isCtrl;
    mnConnect1.Enabled    := true;
    mnTerminate1.Enabled  := isCtrl;
    mnDelete1.Enabled     := isCtrl;

  mnDevelopment1.Enabled  := true;
    mnStartDatabaseDeveloper1.Enabled := true;
    mnPreplay1.Enabled                := false;
      mnStartStudentpreplay1.Enabled  := false;
      mnStudentPreplayStatus1.Enabled := false;

  mnExplorer1.Enabled := true;
    mnStartExplorer1.Enabled := false;

  mnLogOut1.Enabled := true;
    mnLogout2.Enabled := true;

  mnHelp.Enabled := true;
    mnContent1.Enabled := true;
    mnAbout.Enabled := true;

  DefaultMonitor := dmPrimary;

  if theClient.IsController then begin
    Left    := Screen.Monitors[0].Left;
    Width   := Screen.Monitors[0].Width div 2;

    Top     := Screen.Monitors[0].Top;
    Height  := Screen.Monitors[0].Height;
  end
  else begin
    if Screen.MonitorCount > 1 then
      i := 1
    else
      i := 0;
    Left    := Screen.Monitors[i].Left;
    Height  := Screen.Monitors[i].Height div 2;
    Top     := Screen.Monitors[i].BoundsRect.Bottom - Height;
    Width   := Screen.Monitors[i].Width;
  end;
end;

procedure TfrmMainGC.Button1Click(Sender: TObject);
begin
//  theclient.
end;

procedure TfrmMainGC.mnDelete1Click(Sender: TObject);
begin
  //  delete snapshot or recorded scenario
end;


procedure TfrmMainGC.EventOnReceiveSession(Sender: TObject);
begin
//  mnStart1.Enabled      := not theClient.GameSessionExist;
//  mnConnect1.Enabled    := theClient.GameSessionExist;
//  mnTerminate1.Enabled  := theClient.GameSessionExist;
  if theClient.IsController then begin
    frmConnectTerminate.UpdateSession
  end
  else begin
//    if theClient.GameSessionExist then
    
  end;

end;

procedure TfrmMainGC.FormCreate(Sender: TObject);
begin
  DefaultMonitor := dmPrimary;

  vSettingFile := getFileSetting;

  LoadFF_GameSetting(vSettingFile, vGameDataSetting);
end;

end.

