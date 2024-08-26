unit uPredefinedPatternEvents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_Sensor, uSensor, uDBAsset_Radar, uDBAsset_Sonar,
  uDBAsset_Countermeasure, uDBAsset_Weapon, uDBAsset_Scripted, uTrainingPattern;

type
  TEditEvents = class(TForm)
    Panel1: TPanel;
    lbList: TListBox;
    Panel2: TPanel;
    gbRadar: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    radarAction: TComboBox;
    btnOk: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    gbSonar: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    sonarAction: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    gbWeapon: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button5: TButton;
    Button6: TButton;
    weaponSalvoSize: TEdit;
    gbJammers: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    gbIFF: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    ComboBox3: TComboBox;
    Label10: TLabel;
    gbCommLink: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    ComboBox4: TComboBox;
    radarName: TComboBox;
    radarEvent: TEdit;
    sonarEvent: TEdit;
    sonarName: TComboBox;
    jammerAction: TComboBox;
    jammerName: TEdit;
    IFFName: TEdit;
    weaponName: TComboBox;
    weaponEvent: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure lbListClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
    event : String;
    isRadar : Boolean;

    procedure getRadar;
    procedure getSonar;
    procedure getWeapons;
    procedure getJammers;
    procedure getIFFs;

    procedure getDataRadar;
  public
    { Public declarations }
    weaponTemp : Array[0..99] of String;

    temp        : Integer;
    myList      : TList;
    radarList   : TList;
    sonarList   : TList;
    missileList : TList;
    torpedoList : TList;
    minesList   : TList;
    gunList     : TList;
    bombList    : TList;
    jammerList  : TList;
    iffList     : TList;

    pRadarEvent : TPattern_Radar_Event;
  end;

var
  EditEvents: TEditEvents;

implementation

uses
  uDataModuleTTT, ufrmSummaryPredefinedPattern;

{$R *.dfm}

procedure TEditEvents.getDataRadar;
begin
  //:= radarEvent.Text;
//  pRadarEvent.FData := radarName.Text;
  pRadarEvent.FData.Scripted_Pattern_Index := fTrainingPattern.scriptedPPt.FData.Scripted_Pattern_Index;
  pRadarEvent.FData.Radar_Index := TRadar_On_Board(radarList[radarName.ItemIndex]).FData.Radar_Instance_Index;

  if radarAction.Text = 'Of' then
     pRadarEvent.FData.Radar_Control := 0
  else if radarAction.Text = 'On' then
     pRadarEvent.FData.Radar_Control := 1
  else if radarAction.Text = 'No Change' then
     pRadarEvent.FData.Radar_Control := 2;
end;

procedure TEditEvents.btnApplyClick(Sender: TObject);
begin
  if isRadar then
  begin
     getDataRadar;
     dmTTT.insertPatern_Radar_Event(pRadarEvent);
  end;
end;

procedure TEditEvents.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TEditEvents.btnOkClick(Sender: TObject);
begin
  close;
end;

procedure TEditEvents.FormCreate(Sender: TObject);
begin
  myList      := TList.Create;
  pRadarEvent := TPattern_Radar_Event.Create;
  radarList   := TList.Create;
  sonarList   := TList.Create;
  missileList := TList.Create;
  torpedoList := TList.Create;
  minesList   := TList.Create;
  gunList     := TList.Create;
  bombList    := TList.Create;
  jammerList  := TList.Create;
  iffList     := TList.Create;
end;

procedure TEditEvents.getRadar;
var I : Integer;
begin
  dmTTT.getAllRadar_On_Board(frmSummaryPredefinedPattern.pattern.FData.Vehicle_Index,0,radarList);
  if radarList.count = temp then
  else
  begin
     lbList.Items.Add('Radar');
     inc(temp);
  end;

  for I := 0 to radarList.Count - 1 do
  begin
     radarName.Items.Add(TRadar_On_Board(radarList[i]).FData.Instance_Identifier);
  end;
end;

procedure TEditEvents.getSonar;
var I : Integer;
begin
   dmTTT.getAllSonar_On_Board(frmSummaryPredefinedPattern.pattern.FData.Vehicle_Index,0,sonarList);
   if sonarList.count = temp then
   else
   begin
      lbList.Items.Add('Sonar');
      inc(temp);
   end;

  for I := 0 to sonarList.Count - 1 do
  begin
     sonarName.Items.Add(TSonar_On_Board(sonarList[i]).FData.Instance_Identifier);
  end;
end;

procedure TEditEvents.getWeapons;
var
  I : Integer;
  missile, torpedo, mines, gun, bomb : Boolean;
begin
  dmTTT.getAllMissile_OnBoard(frmSummaryPredefinedPattern.pattern.FData.Vehicle_Index,0,missileList);
  if missileList.Count = temp then
  else
  begin
     lbList.Items.Add('Weapons');
     inc(temp);
     missile := true;
  end;

  dmTTT.getAllTorpedo_OnBoard(frmSummaryPredefinedPattern.pattern.FData.Vehicle_Index,0,torpedoList);
  if torpedoList.Count = temp then
  else
  begin
     if missile then
     else
        lbList.Items.Add('Weapons');
     inc(temp);
     torpedo := true;
  end;

  dmTTT.getAllMines_OnBoard(frmSummaryPredefinedPattern.pattern.FData.Vehicle_Index,0,minesList);
  if minesList.Count = temp then
  else
  begin
     if (missile = true) OR (torpedo = True) then
     else
        lbList.Items.Add('Weapons');
     inc(temp);
     mines := true;
  end;

  dmTTT.GetGun_OnBoard(frmSummaryPredefinedPattern.pattern.FData.Vehicle_Index,gunList);
  if gunList.Count = temp then
  else
  begin
     if (missile = true) OR (torpedo = True) OR (mines = true) then
     else
        lbList.Items.Add('Weapons');
     inc(temp);
     gun := true;
  end;

  missile := false;
  torpedo := false;
  mines   := false;
  gun     := false;
  bomb    := false;

  for I := 0 to missileList.Count - 1 do
  begin
     if TMissile_On_Board(missileList[i]).FData.Instance_Identifier = '' then
     else
     begin
        weaponName.Items.Add(TMissile_On_Board(missileList[i]).FData.Instance_Identifier);
     end;
  end;

  for I := 0 to torpedoList.Count - 1 do
  begin
     if TTorpedo_On_Board(torpedoList[i]).FData.Instance_Identifier = '' then
     else
     begin
        weaponName.Items.Add(TTorpedo_On_Board(torpedoList[i]).FData.Instance_Identifier);
     end;
  end;

  for I := 0 to minesList.Count - 1 do
  begin
     if TMine_On_Board(minesList[i]).FData.Instance_Identifier = '' then
     else
     begin
        weaponName.Items.Add(TMine_On_Board(minesList[i]).FData.Instance_Identifier);
     end;
  end;

  for I := 0 to gunList.Count - 1 do
  begin
     if TGun_Definition(gunList[i]).FData.Gun_Identifier = '' then
     else
     begin
        weaponName.Items.Add(TGun_Definition(gunList[i]).FData.Gun_Identifier);
     end;
  end;
end;

procedure TEditEvents.getJammers;
var I : Integer;
begin
  dmTTT.getAllJammer_On_Board(frmSummaryPredefinedPattern.pattern.FData.Vehicle_Index, jammerList);
  if jammerList.count = temp then
  else
  begin
     lbList.Items.Add('Jammers');
     inc(temp);
  end;
  for I := 0 to jammerList.Count - 1 do
  begin
      jammerName.Text := (TRadar_Noise_Jammer_On_Board(jammerList[i]).FData.Instance_Identifier);
  end;
end;

procedure TEditEvents.getIFFs;
var I : Integer;
begin
  dmTTT.getAllIFF_Sensor_On_Board(frmSummaryPredefinedPattern.pattern.FData.Vehicle_Index,0,iffList);
  if iffList.count = temp then
  else
  begin
     lbList.Items.Add('IFFs');
     inc(temp);
  end;
  for I := 0 to iffList.Count - 1 do
  begin
      IFFName.Text := (TIFF_Sensor_On_Board(iffList[i]).FData.Instance_Identifier);
  end;
end;

procedure TEditEvents.lbListClick(Sender: TObject);
begin
  if lbList.ItemIndex = -1 then
  begin
      Exit;
  end
  else
  begin
      event := lbList.Items.Strings[lbList.ItemIndex];
      if event = 'Radar' then begin
         isRadar := true;
         gbRadar.BringToFront;
      end
      else if event = 'Sonar' then
         gbSonar.BringToFront
      else if event = 'Weapons' then
         gbWeapon.BringToFront
      else if event = 'Jammers' then
         gbJammers.BringToFront
      else if event = 'IFFs' then
         gbIFF.BringToFront;
  end;
end;

procedure TEditEvents.FormShow(Sender: TObject);
begin
  temp := 0;
  lbList.Clear;
//  myList.Clear;

  getRadar;
  getSonar;
  getWeapons;
  getJammers;
  getIFFs;
end;

end.
