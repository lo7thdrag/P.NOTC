unit ufmCounterMeasure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ufmControlled,
  Menus, uSimObjects, uT3CounterMeasure, uT3Unit, uBaseCoordSystem,
  uT3Listener,uT3DefensiveJammer, uGameData_TTT, uT3RadarNoiseJammer;

type
  TfmCounterMeasure = class(TfmControlled)
    PanelCounterMeasureSpace: TPanel;
    PanelCounterMeasureChoice: TPanel;
    lvECM: TListView;
    PanelCounterMeasure: TPanel;
    grbOnBoardSelfDefenseJammer: TGroupBox;
    grbTowedJammerDecoy: TGroupBox;
    Label501: TLabel;
    Label503: TLabel;
    Label506: TLabel;
    Bevel111: TBevel;
    Label504: TLabel;
    Label559: TLabel;
    Bevel118: TBevel;
    Label505: TLabel;
    Label507: TLabel;
    Label508: TLabel;
    Label509: TLabel;
    Label512: TLabel;
    Label560: TLabel;
    Label561: TLabel;
    Bevel109: TBevel;
    lblTowedJammerDecoyActual: TLabel;
    Label563: TLabel;
    Label564: TLabel;
    lblTowedJammerDecoyQuantity: TLabel;
    sbTowedJammerDecoyModeAuto: TSpeedButton;
    sbTowedJammerDecoyModeManual: TSpeedButton;
    sbTowedJammerDecoyActionDeploy: TSpeedButton;
    sbTowedJammerDecoyActionStow: TSpeedButton;
    sbTowedJammerDecoyTargetingSpot: TSpeedButton;
    sbTowedJammerDecoyTargetingTrack: TSpeedButton;
    sbTowedJammerDecoyModeOff: TSpeedButton;
    edtTowedJammerDecoyBearing: TEdit;
    edtTowedJammerDecoySpotNumb: TEdit;
    editTowedJammerDecoyOrdered: TEdit;
    grbFloatingDecoy: TGroupBox;
    Label502: TLabel;
    Bevel114: TBevel;
    Label550: TLabel;
    lbFloatingDecoyQuantity: TLabel;
    btnFloatingDecoyDeploy: TButton;
    grbAirborneChaff: TGroupBox;
    Label510: TLabel;
    Label511: TLabel;
    Label516: TLabel;
    Bevel110: TBevel;
    lbChaffAirboneQuantity: TLabel;
    btnAirboneChaffType: TSpeedButton;
    editChaffAirboneType: TEdit;
    btnChaffAirboneDeploy: TButton;
    grbAcousticDecoy: TGroupBox;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btnComboAcousticDecoyMode: TSpeedButton;
    btnComboAcousticDecoyFilter: TSpeedButton;
    sbAcousticDecoyActionDeploy: TSpeedButton;
    sbAcousticDecoyActionStow: TSpeedButton;
    sbAcousticDecoyActivationOn: TSpeedButton;
    sbAcousticDecoyActivationOff: TSpeedButton;
    sbAcousticDecoyCycleTimerOn: TSpeedButton;
    sbAcousticDecoyCycleTimerOff: TSpeedButton;
    edtAcousticDecoyMode: TEdit;
    edtAcousticDecoyFilter: TEdit;
    grbSurfaceChaffDeployment: TGroupBox;
    ScrollBox2: TScrollBox;
    Bevel3: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edtSurfaceChaffLauncher: TEdit;
    edtSurfaceChaffBearing: TEdit;
    edtSurfaceChaffType: TEdit;
    lblSurfaceChaffQuantity: TLabel;
    edtSurfaceChaffBloomRange: TEdit;
    edtSurfaceChaffBloomAltitude: TEdit;
    edtSurfaceChaffSalvoSize: TEdit;
    edtSurfaceChaffDelay: TEdit;
    ckSurfaceChaffEnabled: TCheckBox;
    btnSurfaceChaffLauncher: TSpeedButton;
    btnSurfaceChaffType: TSpeedButton;
    btnSurfaceChaffCopy: TSpeedButton;
    btnSurfaceChaffLaunch: TSpeedButton;
    btnSurfaceChaffAbort: TSpeedButton;
    Label19: TLabel;
    Bevel4: TBevel;
    ckSurfaceChaffSeductionEnabled: TCheckBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    grpAirBubble: TGroupBox;
    lblDeploy: TLabel;
    lblQuant: TLabel;
    lblType: TLabel;
    bvl1: TBevel;
    lblBubblelQuantity: TLabel;
    btnType: TSpeedButton;
    edtBubble: TEdit;
    btnAirBubbleDeploy: TButton;
    grbRadarNoiseJammer: TGroupBox;
    ScrollBox3: TScrollBox;
    Bevel117: TBevel;
    btnComboRadarJammingControlMode: TSpeedButton;
    cbRadarJammingControlMode: TComboBox;
    Label532: TLabel;
    Label557: TLabel;
    Label558: TLabel;
    gbRadarJammingSelectedTrackMode: TGroupBox;
    Label518: TLabel;
    Label528: TLabel;
    Label530: TLabel;
    Label535: TLabel;
    Label539: TLabel;
    Label540: TLabel;
    Label541: TLabel;
    btnRadarJammingModeSelectedTrackTrack: TSpeedButton;
    editRadarJammingModeSelectedTrackCenterFreq: TEdit;
    editRadarJammingModeSelectedTrackBearing: TEdit;
    editRadarJammingModeSelectedTrackBandwidth: TEdit;
    editRadarJammingSelectedTrackModeTrack: TEdit;
    gbRadarJammingSpotNumberMode: TGroupBox;
    Label519: TLabel;
    Label521: TLabel;
    Label522: TLabel;
    Label523: TLabel;
    Label524: TLabel;
    Label525: TLabel;
    Label517: TLabel;
    editRadarJammingSpotNumberCenter: TEdit;
    editRadarJammingSpotNumberBearing: TEdit;
    editRadarJammingSpotNumberBandwidth: TEdit;
    editRadarJammingSpotNumberSpot: TEdit;
    sbRadarJammingControlActivationOff: TSpeedButton;
    sbRadarJammingControlActivationOn: TSpeedButton;
    ScrollBox4: TScrollBox;
    PanelALL: TPanel;
    pmChaffType: TPopupMenu;
    pmChaffLauncher: TPopupMenu;
    Label23: TLabel;
    ScrollBox5: TScrollBox;
    Bevel112: TBevel;
    grbManualSpot: TGroupBox;
    Label547: TLabel;
    Label546: TLabel;
    Label549: TLabel;
    edtOnBoardSelfDefenseJammerSpotNumber: TEdit;
    edtOnBoardSelfDefenseJammerBearing: TEdit;
    grbManualTrack: TGroupBox;
    Label24: TLabel;
    btnSDJammerTarget: TSpeedButton;
    edtSDJammerTarget: TEdit;
    Label542: TLabel;
    Label543: TLabel;
    Label544: TLabel;
    sbOnBoardSelfDefenseJammerControlModeAuto: TSpeedButton;
    sbOnBoardSelfDefenseJammerControlModeManual: TSpeedButton;
    sbOnBoardSelfDefenseJammerControlModeOff: TSpeedButton;
    sbOnBoardSelfDefenseJammerControlTargetingSpot: TSpeedButton;
    sbOnBoardSelfDefenseJammerControlTargetingTrack: TSpeedButton;
    gbRadarJammingBarrageMode: TGroupBox;
    Label531: TLabel;
    Label533: TLabel;
    Label534: TLabel;
    Label536: TLabel;
    Label537: TLabel;
    Label538: TLabel;
    editRadarJammingBarrageCenter: TEdit;
    editRadarJammingBarrageBearing: TEdit;
    editRadarJammingBarrageBandwidth: TEdit;
    pmNoiseJammerMode: TPopupMenu;
    mniJammBarrage: TMenuItem;
    mniJammFreq: TMenuItem;
    mniJammSpotNumber: TMenuItem;
    mniJammSelectedTrack: TMenuItem;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;

    procedure lvECMSelectItem(Sender: TObject; Item: TListItem;
              Selected: Boolean);
    procedure btnECMAcousticDecoyOnClick(Sender: TObject);
    procedure btnFloatingDecoyDeployClick(Sender: TObject);
    procedure btnSurfaceChaffOnClick(Sender: TObject);
    procedure ckSurfaceChaffEnabledClick(Sender: TObject);
    procedure OnSurfaceChaffKeyPress(Sender: TObject; var Key: Char);
    procedure btnChaffAirboneDeployClick(Sender: TObject);
    procedure btnAirboneChaffTypeClick(Sender: TObject);
    procedure btnAirBubbleDeployClick(Sender: TObject);
    procedure btnRadarNoiseJammerOnClick(Sender: TObject);
    procedure cbRadarJammingControlModeChange(Sender: TObject);
    procedure sbOnBoardSelfDefenseJammerControlModeAutoClick(Sender: TObject);
    procedure edtOnBoardSelfDefenseText(Sender: TObject; var Key: Char);
    procedure btnSDJammerTargetClick(Sender: TObject);
    procedure editRadarJammingBarrageBearingKeyPress(Sender: TObject;
      var Key: Char);
    procedure editRadarJammingSpotNumberSpotKeyPress(Sender: TObject;
      var Key: Char);
    procedure btnRadarJammingModeSelectedTrackTrackClick(Sender: TObject);
  private
    { Private declarations }
    FAGroupBox: array [TECMCategory] of TGroupBox;
    mnPopup : TPopupMenu;
    focusedECM : TSimObject;
    //listener  : TEventListener;

    //----- coment dlu kn tdk dipanggil  -----//
    {procedure SetListener(Sender : TObject);
    procedure OnChaffDelayChange(Value : integer);
    procedure OnChaffSalvoChange(Value : integer);
    procedure OnChaffBloomAltitudeChange(Value : double);
    procedure OnChaffBloomRangeChange(Value : double);
    procedure OnChaffStateChange(Value : integer);}
    //----- coment dlu kn tdk dipanggil  -----//

    procedure InitSurfaceChaffUI;
    procedure ClearMenuItem(menu : TPopupMenu);
    procedure CreateModeMenuItem(menu : TPopupMenu);
    procedure CreateFilterMenuItem(menu : TPopupMenu);
    procedure MenuItemAcousticSelected(Sender : TObject);
    procedure UpdateAcousticDecoyTab(Sender : TObject);
    procedure UpdateAirborneChaffTab(Sender : TObject);
    procedure UpdateAirBubbleTab(Sender : TObject);
    procedure UpdateDecoy(Sender : TObject);
    procedure UpdateTowedJammer(Sender : TObject);
    procedure UpdateSurfaceChaff(Sender : TObject);

    procedure DefaultSelfDefenseECMValue(var recECM : TRecECMCommand);
    procedure DefaultRadarNoiseJammerValue(var recJammer : TrecRadarNoiseJammer);

    //choco - Chaff Renew
    procedure MenuChaffTypeSelected(Sender : TObject);
    procedure MenuChaffLauncherSelected(Sender : TObject);

    //    procedure btnChaffTypeOnClick(Sender: TObject);
  protected
    procedure DisplayTab(const i: byte); override;
  public
    { Public declarations }
    Focused_Platform : TSimObject;

    procedure InitCreate(Sender : TForm); override;
    procedure UpdateForm; override;
    procedure SetControlledObject(ctrlObj: TObject); override;
    procedure RefreshPlatformECMTab(pi: TT3PlatformInstance);
    procedure OnRefreshECMQuantity(Sender: TObject);
    //    procedure RefreshRadarNoiseJammerPropertiesTab(jammer : TT3RadarNoiseJammerOnVehicle);

    procedure UpdateNoiseJammer(Sender : TObject); //jammer noise
    procedure UpdateRadarNoiseJammerList(sensor : TT3RadarNoiseJammerOnVehicle; value : byte);
    procedure UpdateECMList(ecm : TT3CounterMeasure);
    procedure UpdateOnBoardSelfDefence(Sender : TObject);
    procedure RemoveListCounterMeasure(ctrlObj: TObject);

    property SelectedECM : TSimObject read focusedECM;
  end;

implementation


uses
  uT3Vehicle, uSimMgr_Client, ufTacticalDisplay, uT3Missile, uT3DetectedTrack;

const
  AcousticMode : array [0..3] of string =
                 ('Swept Frequency','Noise','Pulsed Noise','Alternating');

  ECMStatus    : array [0..10] of string =
                 ('Available', 'Launching Chaff', 'Unavailable', 'Damaged', 'On',
                  'Off', 'EMCON', 'Automatic', 'Manual', 'Deployed', 'Stowed');
{$R *.dfm}

function DeleteAmpersand(Value: string): string;
var
  i: integer;
  found: Boolean;
begin
  found := false;

  for i := 0 to Length(Value) - 1 do
  begin
    if Value[i] = '&' then
    begin
      found := true;
      break;
    end;
  end;

  if found then
    Delete(Value, i, 1);

  result := Value;
end;

procedure TfmCounterMeasure.btnAirboneChaffTypeClick(Sender: TObject);
var
  pt : TPoint;
begin
  inherited;

  GetCursorPos(pt);
  pmChaffType.Popup(pt.X, pt.Y);
end;

procedure TfmCounterMeasure.btnAirBubbleDeployClick(Sender: TObject);
var
  rLauncher : TRecCmd_LaunchBubbleState;
  rLauncherprop : TRecCmd_BubbleLauncherProperties;
begin
  inherited;

  if focusedECM = nil then
    exit;

  if not (focusedECM is TT3AirBubbleOnVehicle) then
    exit;

  if TT3AirBubbleOnVehicle(focusedECM).Status = esDamaged then
    Exit;

  rLauncher.ParentPlatformID := TT3PlatformInstance(TT3AirBubbleOnVehicle
                                (focusedECM).Parent).InstanceIndex;
  rLauncher.ChaffOnVehicleID := TT3AirBubbleOnVehicle(focusedECM).InstanceIndex;
  rLauncher.LauncherID       := TT3AirBubbleOnVehicle(focusedECM).Launcher;
  rLauncher.SessionID        := simMgrClient.SessionID;

  rLauncherprop.ParentPlatformID := TT3PlatformInstance(TT3ChaffLauncher
                                    (focusedECM).Parent).InstanceIndex;
  rLauncherprop.LauncherID := TT3AirBubbleOnVehicle(focusedECM).InstanceIndex;//;TT3BubbleLauncher(focusedECM).Number;
  rLauncherprop.SalvoSize  := 1;
  rLauncherprop.BloomDepth := TT3PlatformInstance(TT3AirBubbleOnVehicle(focusedECM).Parent).Altitude;
  rLauncherprop.Bearing    := TT3PlatformInstance(TT3AirBubbleOnVehicle(focusedECM).Parent).Heading;
  rLauncherprop.IDState    := 0;

  SimMgrClient.netSend_CmdLauncherBubbleProp(rLauncherprop);

  if TT3AirBubbleOnVehicle(focusedECM).Quantity <= 0 then
    exit;
  //  if TT3AirBubbleOnVehicle(focusedECM).ChaffLaunchers.Count < TT3AirBubbleOnVehicle(focusedECM).Launcher then exit;

  rLauncher.StateID := 1;
  SimMgrClient.netSend_CmdLaunchBubbleState(rLauncher);
end;

procedure TfmCounterMeasure.btnChaffAirboneDeployClick(Sender: TObject);
var
//  lc : TObject;
  rChaff : TRecCmd_LaunchChaff;
//  rLauncher : TRecCmd_LaunchChaffState;
//  rLauncherprop : TRecCmd_ChaffLauncherProperties;
begin
  inherited;

  if focusedECM = nil then
    exit;

  if not (focusedECM is TT3ChaffOnVehicle) then
    exit;

  if TT3ChaffOnVehicle(focusedECM).Status = esDamaged then
    Exit;

  if TT3ChaffOnVehicle(focusedECM).Quantity <= 0 then
    exit;

//  rChaff.SessionID := SessionID;
  rChaff.ParentPlatformID := TT3PlatformInstance(TT3ChaffOnVehicle(focusedECM).Parent).InstanceIndex;
  rChaff.ChaffOnVehicleID := TT3ChaffOnVehicle(focusedECM).InstanceIndex;
  rChaff.LauncherID := 0;
  rChaff.ChaffInstanceIndex := 0;

  simMgrClient.netSend_CmdLaunchChaff(rChaff);

//  if TT3ChaffOnVehicle(focusedECM).ChaffLaunchers.Count > 0 then
//  begin
//    lc := TT3ChaffOnVehicle(focusedECM).ChaffLaunchers.
//          Items[TT3ChaffOnVehicle(focusedECM).Launcher - 1];
//
//    rLauncher.ParentPlatformID := TT3PlatformInstance(TT3ChaffOnVehicle
//                                  (focusedECM).Parent).InstanceIndex;
//    rLauncher.ChaffOnVehicleID := TT3ChaffOnVehicle(focusedECM).InstanceIndex;
//    rLauncher.LauncherID       := TT3ChaffOnVehicle(focusedECM).Launcher;
//    rLauncher.SessionID        := simMgrClient.SessionID;
//
//    rLauncherprop.ParentPlatformID := TT3PlatformInstance(TT3ChaffLauncher
//                                      (lc).Parent).InstanceIndex;
//    rLauncherprop.LauncherID := TT3ChaffLauncher(lc).Number;
//    rLauncherprop.Delay      := TT3ChaffLauncher(lc).Delay;
//    rLauncherprop.SalvoSize  := TT3ChaffLauncher(lc).SalvoSize;
//    rLauncherprop.BloomRange := TT3ChaffLauncher(lc).BloomRange;
//    rLauncherprop.BloomAltitude := TT3ChaffLauncher(lc).BloomAltitude;
//    rLauncherprop.Bearing       := TT3ChaffLauncher(lc).Angle;
//    rLauncherprop.IDState       := 0;
//    rLauncherprop.Qty           := TT3ChaffOnVehicle(focusedECM).Quantity;
//
//    SimMgrClient.netSend_CmdLauncherChaffProp(rLauncherprop);
//  end;
//
//  if TT3ChaffOnVehicle(focusedECM).Quantity <= 0 then
//    exit;
//
//  if TT3ChaffOnVehicle(focusedECM).ChaffLaunchers.Count
//    < TT3ChaffOnVehicle(focusedECM).Launcher then
//    exit;
//
//  rLauncher.StateID := 1;
//  rLauncher.Qty     := TT3ChaffOnVehicle(focusedECM).Quantity;
//  SimMgrClient.netSend_CmdLaunchChaffState(rLauncher);
end;

//procedure TfmCounterMeasure.btnChaffTypeOnClick(Sender: TObject);
//var
//  pt : TPoint;
//begin
//  GetCursorPos(pt);
//  pmChaffType.Popup(pt.X, pt.Y);
//end;

procedure TfmCounterMeasure.btnECMAcousticDecoyOnClick(Sender: TObject);
var
  pt: TPoint;
begin
  inherited;

  if focusedECM = nil then
    exit;
  if not (focusedECM is TT3AcousticDecoyOnVehicle) then
    exit;
  if TT3AcousticDecoyOnVehicle(focusedECM).Status = esDamaged then
    Exit;

  with TT3AcousticDecoyOnVehicle(focusedECM) do
  begin
    case TSpeedButton(Sender).Tag of
      1 : DeploymentAction := edaDeploy;
      2 : DeploymentAction := edaStow;
      3 : Control := ecaOn;
      4 : Control := ecaOff;
      5 : CycleTimer := ectOn;
      6 : CycleTimer := ectOff;
      7 :
      begin
        GetCursorPos(pt);
        CreateModeMenuItem(mnPopup);
        mnPopup.Popup(pt.X, pt.Y);
      end;
      8 :
      begin
        GetCursorPos(pt);
        CreateFilterMenuItem(mnPopup);
        mnPopup.Popup(pt.X, pt.Y);
      end;
    end;
  end;
end;

procedure TfmCounterMeasure.MenuChaffLauncherSelected(Sender: TObject);
var
  cl : TT3ChaffLauncher;
begin
  cl := TT3ChaffOnVehicle(focusedECM)
        .ChaffLaunchers.Items[TMenuItem(Sender).Tag];

  if not Assigned(cl) then
    Exit;

  TT3ChaffOnVehicle(focusedECM).Launcher := TMenuItem(Sender).Tag;

  if cl.Kind = 0 then
  begin
    edtSurfaceChaffLauncher.Text := IntToStr(cl.Number) + ' - ' +
                                    FormatFloat('000', cl.Angle);
    edtSurfaceChaffBearing.ReadOnly := True;
  end
  else
  begin
    edtSurfaceChaffLauncher.Text := IntToStr(cl.Number) + ' - Trainable';
    edtSurfaceChaffBearing.ReadOnly := False;
  end;

  edtSurfaceChaffBearing.Text := FormatFloat('000', cl.Angle);

  edtSurfaceChaffBloomRange.Text := FormatCourse(cl.BloomRange);
  edtSurfaceChaffBloomAltitude.Text := FormatCourse(cl.BloomAltitude);
  edtSurfaceChaffSalvoSize.Text  := IntToStr(cl.SalvoSize);
  edtSurfaceChaffDelay.Text      := IntToStr(cl.Delay);
end;

procedure TfmCounterMeasure.MenuChaffTypeSelected(Sender: TObject);
var
  s : string;
  dev, lc : TObject;
  v : TT3Vehicle;
begin
  {Dng : kalo gak d filter bisa acces violation }
  if lvECM.Selected = nil then
    Exit;

  s := DeleteAmpersand(TMenuItem(Sender).Caption);
  dev := TT3Vehicle(FControlled).getDevice(s, TT3ChaffOnVehicle);

  if not Assigned(dev) then
    Exit;

  lvECM.Selected.Data := TT3ChaffOnVehicle(dev);
  focusedECM := TT3ChaffOnVehicle(dev);

  with TT3ChaffOnVehicle(dev) do
  begin
    if ChaffLaunchers.Count > 0 then
    begin
      lc := ChaffLaunchers.Items[Launcher];

      if TT3ChaffLauncher(lc).Kind = 0 then
      begin
        edtSurfaceChaffLauncher.Text   := IntToStr(TT3ChaffLauncher(lc).Number) + ' - ' +
                                          FormatFloat('000',TT3ChaffLauncher(lc).Angle);
        edtSurfaceChaffBearing.ReadOnly := True;
      end
      else
      begin
        edtSurfaceChaffLauncher.Text   := IntToStr(TT3ChaffLauncher(lc).Number) + ' - Trainable';
        edtSurfaceChaffBearing.ReadOnly := False;
      end;

      edtSurfaceChaffBearing.Text    := FormatFloat('000',TT3ChaffLauncher(lc).Angle);
      edtSurfaceChaffBloomRange.Text := FormatCourse(TT3ChaffLauncher(lc).BloomRange);
      edtSurfaceChaffBloomAltitude.Text :=  FormatCourse(TT3ChaffLauncher(lc).BloomAltitude);
      edtSurfaceChaffSalvoSize.Text  := IntToStr(TT3ChaffLauncher(lc).SalvoSize);
      edtSurfaceChaffDelay.Text      := IntToStr(TT3ChaffLauncher(lc).Delay);
    end;

    edtSurfaceChaffType.Text := InstanceName;
    lblSurfaceChaffQuantity.Caption := IntToStr(Quantity);

    if ChaffDefinition.FData.Instance_Type = Byte(ecgSeduction) then
    begin
      Label19.Visible := True;
      Bevel4.Visible := True;
      ckSurfaceChaffSeductionEnabled.Visible := True;

      v := TT3Vehicle(TT3CounterMeasure(dev).Parent);

      if v.VehicleDefinition.FData.Chaff_Seduction_Capable then
        ckSurfaceChaffSeductionEnabled.Enabled := True
      else
        ckSurfaceChaffSeductionEnabled.Enabled := False;
    end
    else
    begin
      Label19.Visible := False;
      Bevel4.Visible := False;
      ckSurfaceChaffSeductionEnabled.Visible := False;
      ckSurfaceChaffSeductionEnabled.Enabled := False;
    end;
  end;
end;

procedure TfmCounterMeasure.MenuItemAcousticSelected(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    1, 2, 3, 4 :
    begin
      edtAcousticDecoyMode.Text := AcousticMode[TMenuItem(Sender).Tag - 1];

      if focusedECM is TT3AcousticDecoyOnVehicle then
        TT3AcousticDecoyOnVehicle(focusedECM).Mode
            :=  TECMAcousticDecoyMode(TMenuItem(Sender).Tag - 1);
    end;
    5,6,7 :
    begin
      edtAcousticDecoyFilter.Text := IntToStr(TMenuItem(Sender).Tag - 4);

      if focusedECM is TT3AcousticDecoyOnVehicle then
        TT3AcousticDecoyOnVehicle(focusedECM).FilterSetting
            :=  TMenuItem(Sender).Tag - 4;
    end;
  end;
end;

{procedure TfmCounterMeasure.OnChaffBloomAltitudeChange(Value: double);
begin
  edtSurfaceChaffBloomAltitude.Text := FormatAltitude(Value);
end;

procedure TfmCounterMeasure.OnChaffBloomRangeChange(Value: double);
begin
  edtSurfaceChaffBloomRange.Text := FormatCourse(Value);
end;

procedure TfmCounterMeasure.OnChaffDelayChange(Value: integer);
begin
  edtSurfaceChaffDelay.Text := IntToStr(Value);
end;

procedure TfmCounterMeasure.OnChaffSalvoChange(Value: integer);
begin
  edtSurfaceChaffSalvoSize.Text := IntToStr(Value);
end;

procedure TfmCounterMeasure.OnChaffStateChange(Value: integer);
begin
  if Value = 1 then
  begin
    btnSurfaceChaffLaunch.Enabled := false;
    btnSurfaceChaffAbort.Enabled := true;
  end;
  if Value = 0 then
  begin
    btnSurfaceChaffLaunch.Enabled := true;
    btnSurfaceChaffAbort.Enabled := false;
  end;
end;}

procedure TfmCounterMeasure.OnSurfaceChaffKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  DblVal : double;
  IntVal : integer;
  lc : TObject;
  StrVal : string;
  rLauncher : TRecCmd_ChaffLauncherProperties;
begin
  inherited;

  if not (focusedECM is TT3ChaffOnVehicle) then
    Exit;

  with TT3ChaffOnVehicle(focusedECM) do
  begin
    if not (ChaffLaunchers.Count > 0) then
      Exit;

    lc := ChaffLaunchers[Launcher];

    if not Assigned(lc) then
      Exit;
  end;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    StrVal  := TEdit(Sender).Text;

    case TEdit(Sender).Tag of
      1,2,3 : TryStrToFloat(StrVal,DblVal);
      4,5 : TryStrToInt(StrVal,IntVal);
    end;

    rLauncher.ParentPlatformID := TT3PlatformInstance(TT3ChaffLauncher
                                  (lc).Parent).InstanceIndex;
    rLauncher.LauncherID := TT3ChaffLauncher(lc).Number;

    case TEdit(Sender).Tag of
      1 : rLauncher.Bearing := ValidateDegree(DblVal);
      2 :
      begin
        with TT3ChaffLauncher(lc).LauncherDefinition.FData do
        begin
          if DblVal < Min_Range then
            DblVal := Min_Range
          else if DblVal > Max_Range then
            DblVal := Max_Range;
        end;

        rlauncher.BloomRange := DblVal;
      end;
      3 :
      begin
        with TT3ChaffLauncher(lc).LauncherDefinition.FData do
        begin
          if DblVal < Min_Elevation then
            DblVal := Min_Elevation
          else if DblVal > Max_Elevation then
            DblVal := Max_Elevation;
        end;

        rLauncher.BloomAltitude := DblVal;
      end;
      4 :
      begin
        if IntVal > TT3ChaffOnVehicle(focusedECM).Quantity then
          IntVal := TT3ChaffOnVehicle(focusedECM).Quantity;

        rLauncher.SalvoSize := IntVal;
      end;
      5 : rLauncher.Delay := IntVal;
    end;

    rLauncher.Tag := TEdit(Sender).Tag;
    rLauncher.IDState := 0;

    SimMgrClient.netSend_CmdLauncherChaffProp(rLauncher);
  end;
end;

procedure TfmCounterMeasure.btnFloatingDecoyDeployClick(Sender: TObject);
var
  rDecoys : TRecCmdDecoys;
begin
  inherited;

  if focusedECM is TT3CounterMeasure then
  begin
    if TT3CounterMeasure(focusedECM).Status = esDamaged then
      Exit;

    rDecoys.PlatformID := TT3PlatformInstance(TT3CounterMeasure(focusedECM).Parent).InstanceIndex;
    rDecoys.CounterMeasureID := TT3CounterMeasure(focusedECM).InstanceIndex;
    rDecoys.DecoyInstanceIndex := 0;

    if focusedECM is TT3FloatingDecoyOnVehicle then begin
      rDecoys.OrderID := CORD_ID_Deploy_Float;
      SimMgrClient.netSend_CmdDecoys(rDecoys);
    end else
    if focusedECM is TT3InfraredDecoyOnVehicle then begin
      rDecoys.OrderID := CORD_ID_Deploy_IR;
      SimMgrClient.netSend_CmdDecoys(rDecoys);
    end;
  end;

//  TT3FloatingDecoyOnVehicle(focusedECM).Deploy;
//  lbFloatingDecoyQuantity.Caption := IntToStr(TT3FloatingDecoyOnVehicle(focusedECM).Quantity);
end;

procedure TfmCounterMeasure.btnRadarJammingModeSelectedTrackTrackClick(
  Sender: TObject);
var
  recEcmCmd : TrecRadarNoiseJammer;
  bearing : double;
begin
  inherited;

  if not(focusedECM is TT3RadarNoiseJammerOnVehicle) then
  begin
    frmTacticalDisplay.addStatus('ECM Not Radar Noise Jammer');
    Exit;
  end;

  if not Assigned(focused_platform) then
  begin
    frmTacticalDisplay.addStatus('Vehicle Target Not Found');
    Exit;
  end;

  { set default value }
  DefaultRadarNoiseJammerValue(recEcmCmd);

  if Focused_Platform is TT3Vehicle then
  begin
    bearing := CalcBearing(TT3Vehicle(focusedECM.Parent).PosX,
               TT3Vehicle(focusedECM.Parent).PosY,
               TT3Vehicle(focused_platform).getPositionX,
               TT3Vehicle(focused_platform).getPositionY);

    recEcmCmd.ObjectReqJammedOwnerID  := TT3Vehicle(focused_platform).InstanceIndex;
    recEcmCmd.CenterFreq :=
      (TT3RadarNoiseJammerOnVehicle(focusedECM).RadarJammerDefinition.FDef.Upper_Freq_Limit +
      TT3RadarNoiseJammerOnVehicle(focusedECM).RadarJammerDefinition.FDef.Lower_Freq_Limit) / 2;

    recEcmCmd.Bearing := bearing;
    recEcmCmd.BandWidth := 2;
  end
  else
  begin
    frmTacticalDisplay.addStatus('Vehicle Target Not Vehicle!');
    Exit;
  end;

  recEcmCmd.OrderID  := CORD_ID_RN_SETJAMTRACK;
  simMgrClient.netSend_CmdRadarNoiseJammer(recEcmCmd);
end;

procedure TfmCounterMeasure.btnRadarNoiseJammerOnClick(Sender: TObject);
var
  recECMCommand : TrecRadarNoiseJammer;
begin
  inherited;

  if Assigned(focusedECM) and (focusedECM is TT3RadarNoiseJammerOnVehicle) and
     not (TT3RadarNoiseJammerOnVehicle(focusedECM).Status = esDamaged) then
  begin
    DefaultRadarNoiseJammerValue(recECMCommand);

    case TSpeedButton(Sender).Tag of
      1 :
        begin
          { status onn }
          recECMCommand.OrderID := CORD_ID_RN_SETJAMSTATUS;
          recECMCommand.JammerStatus    := 1;
        end;
      2 :
        begin
          { status off }
          recECMCommand.OrderID := CORD_ID_RN_SETJAMSTATUS;
          recECMCommand.JammerStatus    := 0;
        end;
    end;

    simMgrClient.netSend_CmdRadarNoiseJammer(recECMCommand);
  end else
  begin
    frmTacticalDisplay.addStatus('ECM Not Radar Noise Jammer or Damage');
    Exit;
  end;

//  if Assigned(focusedECM) and (focusedECM is TT3RadarNoiseJammerOnVehicle) and
//     not (TT3RadarNoiseJammerOnVehicle(focusedECM).Status = esDamaged) then
//  begin
//    case TSpeedButton(Sender).Tag of
//      1 :
//        begin
//            TT3RadarNoiseJammerOnVehicle(focusedECM).Status := esOn;
//
//            if (FControlled is TT3PlatformInstance) then
//            begin
//              SimMgrClient.netSend_CmdRadarNoiseJammer
//                (TT3PlatformInstance(FControlled).InstanceIndex,
//                 TT3RadarNoiseJammerOnVehicle(focusedECM).InstanceIndex,Byte(esOn));
//            end;
//        end;
//      2 :
//        begin
//          TT3RadarNoiseJammerOnVehicle(focusedECM).Status := esOff;
//
//          if (FControlled is TT3PlatformInstance) then
//          begin
//            SimMgrClient.netSend_CmdRadarNoiseJammer
//              (TT3PlatformInstance(FControlled).InstanceIndex,
//               TT3RadarNoiseJammerOnVehicle(focusedECM).InstanceIndex,Byte(esOff));
//          end;
//        end;
//      3 :
//        begin
//          //
//        end;
//    end;

//    if (FControlled is TT3PlatformInstance) then
//    begin
//      TT3RadarNoiseJammerOnVehicle(focusedECM).EfffectiveRange(TT3PlatformInstance(FControlled));
//    end;
//  end;
end;
procedure TfmCounterMeasure.btnSDJammerTargetClick(Sender: TObject);
var
  recEcmCmd : TRecECMCommand;
begin
  inherited;

  if not Assigned(focused_platform) then
  begin
    frmTacticalDisplay.addStatus('Vehicle Target Not Found');
    Exit;
  end;

  { set default value }
  DefaultSelfDefenseECMValue(recEcmCmd);

  if Focused_Platform is TT3Missile then
  begin
    recEcmCmd.JammedObjectType  := 1;
    recEcmCmd.JammedObjectID  := TT3Missile(Focused_Platform).InstanceIndex;
    recEcmCmd.JammedObjectOwnerID  := 0;
  end
  else if Focused_Platform is TT3Vehicle then begin
    recEcmCmd.JammedObjectType  := 0;
    recEcmCmd.JammedObjectID  := 0;
    recEcmCmd.JammedObjectOwnerID  := TT3Vehicle(Focused_Platform).InstanceIndex;
  end
  else
  begin
    frmTacticalDisplay.addStatus('Vehicle Target Not Missile or Vehicle!');
    Exit;
  end;

  recEcmCmd.OrderID  := CORD_ID_SD_SETTRACK;
  simMgrClient.NetSendECMCommand(recEcmCmd);
end;

procedure TfmCounterMeasure.btnSurfaceChaffOnClick(Sender: TObject);
var
  pt: TPoint;
  rLauncher : TRecCmd_LaunchChaffState;
  lc : TObject;
begin
  inherited;

  if focusedECM = nil then
    Exit;

  if not (focusedECM is TT3ChaffOnVehicle) then
    Exit;

  if TT3ChaffOnVehicle(focusedECM).Status = esDamaged then
    Exit;

  rLauncher.ParentPlatformID := TT3Vehicle(FControlled).InstanceIndex;
  rLauncher.ChaffOnVehicleID := TT3ChaffOnVehicle(focusedECM).InstanceIndex;
  rLauncher.LauncherID := TT3ChaffOnVehicle(focusedECM).Launcher;

  if not (focusedECM is TT3ChaffOnVehicle) then
    Exit;


  case TSpeedButton(Sender).Tag of
    1 : //Menu Launcher Click
      begin
        GetCursorPos(pt);
        pmChaffLauncher.Popup(pt.X, pt.Y);
      end;
    2 : //Menu Type Click
      begin
        GetCursorPos(pt);
        pmChaffType.Popup(pt.X, pt.Y);
      end;
    3 : //Copy to All Launcher
      begin
        simMgrClient.netSend_CopyChaffLauncherProperty(rLauncher);
      end;
    4 : //Launch Chaff
      begin
        if not (TT3ChaffOnVehicle(focusedECM).Quantity > 0) or
           not (TT3ChaffOnVehicle(focusedECM).ChaffLaunchers.Count > 0) then
          Exit;

        with TT3ChaffOnVehicle(focusedECM) do
        begin
          if not (ChaffLaunchers.Count > 0) then
            Exit;

          lc := ChaffLaunchers[Launcher];

          if not Assigned(lc) then
            Exit;

          if TT3ChaffLauncher(lc).SalvoSize < 1 then
          begin
            ShowMessage('Salvo Size must be greater than 0');
            Exit;
          end;

          if TT3ChaffLauncher(lc).Delay < 1 then
          begin
            ShowMessage('Delay must be greater than 0');
            Exit;
          end;

        end;

        rLauncher.StateID := 1;
        SimMgrClient.netSend_CmdLaunchChaffState(rLauncher);
      end;
    5 : //Abort Launch
      begin
        if not (TT3ChaffOnVehicle(focusedECM).ChaffLaunchers.Count > 0) then
          Exit;

        rLauncher.StateID := 0;
        SimMgrClient.netSend_CmdLaunchChaffState(rLauncher);
      end;
  end;
end;

procedure TfmCounterMeasure.cbRadarJammingControlModeChange(Sender: TObject);
var
  recECMCommand : TrecRadarNoiseJammer;
  idJammMode    : Integer;
begin
  inherited;

  if cbRadarJammingControlMode.Text = 'Barrage' then
  begin
    idJammMode := 1;

    gbRadarJammingBarrageMode.BringToFront;
    Label537.Enabled := true;
    Label538.Enabled := True;
    editRadarJammingBarrageBandwidth.Text := '';
    editRadarJammingBarrageBandwidth.Enabled := true;
  end
  else
  if cbRadarJammingControlMode.Text = 'Spot Jamming - Frequency' then
  begin
    idJammMode := 2;

    gbRadarJammingBarrageMode.BringToFront;
    Label537.Enabled := False;
    Label538.Enabled := False;
    editRadarJammingBarrageBandwidth.Text := '2';
    editRadarJammingBarrageBandwidth.Enabled := False;
  end
  else
  if cbRadarJammingControlMode.Text = 'Spot Jamming - Spot Number' then
  begin
    idJammMode := 3;

    gbRadarJammingSpotNumberMode.BringToFront;
    label522.Enabled := False;
    Label523.Enabled := False;
    Label524.Enabled := False;
    Label525.Enabled := False;
    editRadarJammingSpotNumberCenter.Enabled := False;
    editRadarJammingSpotNumberBandwidth.Enabled := False;
  end
  else
  if cbRadarJammingControlMode.Text = 'Spot Jamming - Selected Track' then
  begin
     idJammMode := 4;

     gbRadarJammingSelectedTrackMode.BringToFront;
     Label518.Enabled := False;
     Label528.Enabled := False;
     Label535.Enabled := False;
     Label530.Enabled := False;
     Label539.Enabled := False;
     Label540.Enabled := False;
     editRadarJammingModeSelectedTrackBearing.Enabled := False;
     editRadarJammingModeSelectedTrackCenterFreq.Enabled := False;
     editRadarJammingModeSelectedTrackBandwidth.Enabled := False;
  end
  else idJammMode := 0;

  if Assigned(focusedECM) and (focusedECM is TT3RadarNoiseJammerOnVehicle) and
     not (TT3RadarNoiseJammerOnVehicle(focusedECM).Status = esDamaged) then
  begin
    DefaultRadarNoiseJammerValue(recECMCommand);

    case idJammMode of
      1 :  { Barrage }
        begin
          recECMCommand.JammerMode    := 0;
        end;
      2 : { Center Frequency }
        begin
          recECMCommand.JammerMode    := 3;
        end;
      3 : { Spot Number }
        begin
          recECMCommand.JammerMode    := 2;
        end;
      4 : { Selected Track }
        begin
          recECMCommand.JammerMode    := 1;
        end
      else
        begin
          frmTacticalDisplay.addStatus('ECM Mode Not Assigned');
          Exit;
        end;
    end;

    recECMCommand.OrderID := CORD_ID_RN_SETJAMMODE;
    simMgrClient.netSend_CmdRadarNoiseJammer(recECMCommand);
  end else
  begin
    frmTacticalDisplay.addStatus('ECM Not Radar Noise Jammer or Damage');
    Exit;
  end;
end;

procedure TfmCounterMeasure.ckSurfaceChaffEnabledClick(Sender: TObject);
begin
  inherited;

  btnSurfaceChaffLaunch.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfmCounterMeasure.ClearMenuItem(menu: TPopupMenu);
//var
//  i : integer;
//  item : TMenuItem;
begin
  {for i := 0 to mnAcoustic.Items.Count - 1 do begin
    item := mnAcoustic.Items[i];
    FreeAndNil(item);
  end; }

  menu.Items.Clear;
end;

procedure TfmCounterMeasure.CreateFilterMenuItem(menu: TPopupMenu);
var
  item : TMenuItem;
  i : integer;
begin
  if not Assigned(mnPopup) then
    mnPopup := TPopupMenu.Create(Self);

  ClearMenuItem(mnPopup);
  for I := 0 to 2 do
  begin
    item := TMenuItem.Create(Self);
    item.Caption := IntToStr(i + 1);
    item.Tag     := i + 5;
    item.OnClick := MenuItemAcousticSelected;

    mnPopup.Items.Add(item);
  end;
end;

procedure TfmCounterMeasure.CreateModeMenuItem(menu: TPopupMenu);
var
  item : TMenuItem;
  i : integer;
begin
  if not Assigned(mnPopup) then
    mnPopup := TPopupMenu.Create(Self);

  ClearMenuItem(mnPopup);
  for I := 0 to Length(AcousticMode) - 1 do
  begin
    item := TMenuItem.Create(Self);
    item.Caption := AcousticMode[i];
    item.Tag     := i + 1;
    item.OnClick := MenuItemAcousticSelected;

    mnPopup.Items.Add(item);
  end;
end;

procedure TfmCounterMeasure.DefaultRadarNoiseJammerValue(
  var recJammer: TrecRadarNoiseJammer);
begin
  if not Assigned(focusedECM) then
    Exit;

  { fill with default value }
  with recJammer do
  begin
    case TT3RadarNoiseJammerOnVehicle(focusedECM).Status of
      esOff   : JammerStatus := 0;
      esOn    : JammerStatus := 1;
    end;

    case TT3RadarNoiseJammerOnVehicle(focusedECM).JamTargeting of
      ettNJBarrage : JammerMode := 0;
      ettNJTrack   : JammerMode := 1;
      ettNJSpotNum : JammerMode := 2;
      ettNJFreq    : JammerMode := 3;
    end;

    JammerID              := TT3RadarNoiseJammerOnVehicle(focusedECM).InstanceIndex;
    JammerPlatformOwnerID := TT3PlatformInstance(TT3RadarNoiseJammerOnVehicle(focusedECM).Parent).InstanceIndex;

    SpotNumber  := TT3RadarNoiseJammerOnVehicle(focusedECM).JamSpotNumber;
    Bearing     := TT3RadarNoiseJammerOnVehicle(focusedECM).JamBearing;
    CenterFreq  := TT3RadarNoiseJammerOnVehicle(focusedECM).JamCenterFreq;
    BandWidth   := TT3RadarNoiseJammerOnVehicle(focusedECM).JamBandWidth;

    ObjectReqJammedID      := 0;
    ObjectReqJammedOwnerID := 0;
  end;
end;

procedure TfmCounterMeasure.DefaultSelfDefenseECMValue(
  var recECM: TRecECMCommand);
begin
  if not Assigned(focusedECM) then
    Exit;

  { fill with default value }
  with recECM do
  begin
    case TT3DefensiveJammerOnVehicle(focusedECM).Status of
      esOff       : Mode := 0;
      esManual    : Mode := 1;
      esAutomatic : Mode := 2;
    end;

    case TT3DefensiveJammerOnVehicle(focusedECM).Targeting of
      ettTrack : ManualTgtType := 0;
      ettSpot  : ManualTgtType := 1;
    end;

    JammerObjectID      := TT3DefensiveJammerOnVehicle(focusedECM).InstanceIndex;
    JammerObjectOwnerID := TT3PlatformInstance(TT3DefensiveJammerOnVehicle(focusedECM).Parent).InstanceIndex;
    SpotNumber  := TT3DefensiveJammerOnVehicle(focusedECM).SpotNumber;
    Bearing     := TT3DefensiveJammerOnVehicle(focusedECM).Bearing;

    JammedObjectID      := 0;
    JammedObjectOwnerID := 0;
    JammedObjectType    := 2; //not missile or radar fc
  end;
end;

procedure TfmCounterMeasure.DisplayTab(const i: byte);
var wc : TECMCategory;
begin
  inherited;

  wc := TECMCategory(i);
  if FAGroupBox[wc] <> nil then
  begin
     FAGroupBox[wc].BringToFront;
  end;
end;

procedure TfmCounterMeasure.editRadarJammingBarrageBearingKeyPress(
  Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  valInput: double;
  recECMCommand : TrecRadarNoiseJammer;
begin
  inherited;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if not(focusedECM is TT3RadarNoiseJammerOnVehicle) then
    begin
      frmTacticalDisplay.addStatus('ECM Not Radar Noise Jammer');
      Exit;
    end;

    DefaultRadarNoiseJammerValue(recECMCommand);

    case TEdit(sender).Tag of
      1 : { Bearing }
        begin
          TryStrToFloat(editRadarJammingBarrageBearing.Text, valInput);

          if valInput > 360 then
          begin
            valInput := 0;
          end;

          recECMCommand.OrderID := CORD_ID_RN_SETJAMBEARING;
          recECMCommand.Bearing := valInput;
        end;
      2 : { Center Frequency }
        begin
          TryStrToFloat(editRadarJammingBarrageCenter.Text, valInput);

          recECMCommand.OrderID    := CORD_ID_RN_SETJAMCENTFREQ;
          recECMCommand.CenterFreq := valInput;
        end;
      3 : { Bandwidth }
        begin
          TryStrToFloat(editRadarJammingBarrageBandwidth.Text, valInput);

          if valInput < 0 then
          begin
            valInput := 2;
          end;

          recECMCommand.OrderID   := CORD_ID_RN_SETJAMBANDWIDTH;
          recECMCommand.BandWidth := valInput;
        end;
    end;

    simMgrClient.netSend_CmdRadarNoiseJammer(recECMCommand);
  end;
end;

procedure TfmCounterMeasure.editRadarJammingSpotNumberSpotKeyPress(
  Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  valInputInt : Integer;
  valInputfloat : Double;
  recECMCommand : TrecRadarNoiseJammer;
begin
  inherited;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if not(focusedECM is TT3RadarNoiseJammerOnVehicle) then
    begin
      frmTacticalDisplay.addStatus('ECM Not Radar Noise Jammer');
      Exit;
    end;

    DefaultRadarNoiseJammerValue(recECMCommand);

    case TEdit(sender).Tag of
      1 : { Spot Number }
        begin
          TryStrToInt(editRadarJammingSpotNumberSpot.Text, valInputInt);

          recECMCommand.OrderID := CORD_ID_RN_SETJAMSPOTNUMB;
          recECMCommand.SpotNumber := valInputInt;
          recECMCommand.CenterFreq :=
            (TT3RadarNoiseJammerOnVehicle(focusedECM).RadarJammerDefinition.FDef.Upper_Freq_Limit +
            TT3RadarNoiseJammerOnVehicle(focusedECM).RadarJammerDefinition.FDef.Lower_Freq_Limit) / 2;;
        end;
      2 : { Bearing }
        begin
          TryStrToFloat(editRadarJammingSpotNumberBearing.Text, valInputfloat);

          if valInputfloat > 360 then
          begin
            valInputfloat := 0;
          end;

          recECMCommand.OrderID := CORD_ID_RN_SETJAMBEARING;
          recECMCommand.Bearing := valInputfloat;
        end;
    end;

    simMgrClient.netSend_CmdRadarNoiseJammer(recECMCommand);
  end;
end;

procedure TfmCounterMeasure.edtOnBoardSelfDefenseText(Sender: TObject;
  var Key: Char);
var
  IntVal : integer;
  FloatVal : Double;
  ValKey : set of AnsiChar;
  StrVal : string;
  recEcmCmd : TRecECMCommand;
begin
  inherited;

  if not (focusedECM is TT3DefensiveJammerOnVehicle) then
    exit;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    StrVal  := TEdit(Sender).Text;
    case TEdit(Sender).Tag of
      1 : TryStrToFloat(StrVal,FloatVal);
      2 : TryStrToInt(StrVal,IntVal);
    end;

    DefaultSelfDefenseECMValue(recEcmCmd);

    case TEdit(Sender).Tag of
      1 :
        begin
          recEcmCmd.Bearing  := FloatVal;
          recEcmCmd.OrderID  := CORD_ID_SD_SETBEARING;
        end;
      2 :
        begin
          recEcmCmd.SpotNumber  := IntVal;
          recEcmCmd.OrderID     := CORD_ID_SD_SETSPOTNUMBER;
        end;
    end;

    simMgrClient.NetSendECMCommand(recEcmCmd);
  end;
end;

procedure TfmCounterMeasure.InitCreate;
begin
  FAGroupBox[ecAcousticDecoy]      := grbAcousticDecoy ;
  FAGroupBox[ecAirborneChaff]      := grbAirborneChaff ;
  FAGroupBox[ecFloatingDecoy]      := grbFloatingDecoy;
  FAGroupBox[ecInfraredDecoy]      := grbFloatingDecoy;
  FAGroupBox[ecTowedJammer]        := grbTowedJammerDecoy ;
  FAGroupBox[ecSurfaceChaff]       := grbSurfaceChaffDeployment ;
  FAGroupBox[ecOnBoardDefence]     := grbOnBoardSelfDefenseJammer;
  FAGroupBox[ecBubble]             := grpAirBubble;
  FAGroupBox[ecRadarNoiseJammer]   := grbRadarNoiseJammer;  //jammer noise
end;

procedure TfmCounterMeasure.InitSurfaceChaffUI;
begin
  edtSurfaceChaffLauncher.Text := '';
  edtSurfaceChaffBearing.Text :=  '000';
  ckSurfaceChaffEnabled.Checked := True;

  edtSurfaceChaffType.Text := '---';
  lblSurfaceChaffQuantity.Caption := '---';

  edtSurfaceChaffBloomRange.Text := '0.00';
  edtSurfaceChaffBloomAltitude.Text := '0.00';
  edtSurfaceChaffSalvoSize.Text := '0.00';
  edtSurfaceChaffDelay.Text := '000';

  btnSurfaceChaffCopy.Enabled := True;
  btnSurfaceChaffLaunch.Enabled := True;
  btnSurfaceChaffAbort.Enabled := False;
end;

procedure TfmCounterMeasure.lvECMSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  ec : TECMCategory;
  v : TT3Vehicle;
begin
  if FControlled = nil then
    Exit;

  if lvECM.Selected = nil then
    Exit;

  focusedECM := lvECM.Selected.Data;

  ec := TT3CounterMeasure(focusedECM).Category;
  DisplayTab(Byte(ec));
  case ec of
    ecAcousticDecoy   : UpdateAcousticDecoyTab(focusedECM);
    ecAirborneChaff   : UpdateAirborneChaffTab(focusedECM);
    ecFloatingDecoy,
    ecInfraredDecoy   : UpdateDecoy(focusedECM);
    ecTowedJammer     : UpdateTowedJammer(focusedECM);
    ecOnBoardDefence  : UpdateOnBoardSelfDefence(focusedECM);
    ecSurfaceChaff    : UpdateSurfaceChaff(focusedECM);
    ecBubble          : UpdateAirBubbleTab(focusedECM);
    ecRadarNoiseJammer: UpdateNoiseJammer(focusedECM); //jammer noise
  end;

  if focusedECM is TT3ChaffOnVehicle then
  begin
    with TT3ChaffOnVehicle(focusedECM) do
    begin
      if ChaffDefinition.FData.Instance_Type = Byte(ecgSeduction) then
      begin
        Label19.Visible := True;
        Bevel4.Visible := True;
        ckSurfaceChaffSeductionEnabled.Visible := True;

        v := TT3Vehicle(TT3ChaffOnVehicle(focusedECM).Parent);

        if v.VehicleDefinition.FData.Chaff_Seduction_Capable then
          ckSurfaceChaffSeductionEnabled.Enabled := True
        else
          ckSurfaceChaffSeductionEnabled.Enabled := False;
      end
      else
      begin
        Label19.Visible := False;
        Bevel4.Visible := False;
        ckSurfaceChaffSeductionEnabled.Visible := False;
        ckSurfaceChaffSeductionEnabled.Enabled := False;
      end;
    end;
  end;
end;

procedure TfmCounterMeasure.OnRefreshECMQuantity(Sender: TObject);
var
  ec : TECMCategory;
  objParent : TSimObject;
  ecParent : TT3PlatformInstance;
begin
  if not(Assigned(Sender)) then
    Exit;

  if not(Assigned(FControlled)) then
    Exit;

  if Sender is TT3CounterMeasure then
  begin
    objParent := TT3CounterMeasure(Sender).Parent;
    if not(Assigned(objParent)) then
      Exit;

    ecParent  := TT3PlatformInstance(objParent);
    if not(Assigned(ecParent)) then
      Exit;

    if ecParent.InstanceIndex = TT3PlatformInstance(FControlled).InstanceIndex then
    begin
      ec := TT3CounterMeasure(Sender).Category;

      case ec of
        ecAcousticDecoy   : UpdateAcousticDecoyTab(Sender);
        ecAirborneChaff   : UpdateAirborneChaffTab(Sender);
        ecFloatingDecoy,
        ecInfraredDecoy   : UpdateDecoy(Sender);
        ecTowedJammer     : UpdateTowedJammer(Sender);
        ecOnBoardDefence  : UpdateOnBoardSelfDefence(Sender);
        ecSurfaceChaff    : UpdateSurfaceChaff(Sender);
        ecBubble          : UpdateAirBubbleTab(Sender);
        ecRadarNoiseJammer: UpdateNoiseJammer(Sender); //jammer noise
      end;
    end;
  end;
end;

procedure TfmCounterMeasure.RefreshPlatformECMTab(pi: TT3PlatformInstance);
var
  li      : TListItem;
  i       : integer;
  tagType, tagLauncher : Byte;
  ecm     : TT3CounterMeasure;
  device  : TT3DeviceUnit;
  item    : TMenuItem;
  isChaffAdded : Boolean;
begin
  lvECM.Items.Clear;

  if not (pi is TT3Vehicle) then
    Exit;

  pmChaffType.Items.Clear;
  pmChaffLauncher.Items.Clear;

  tagType := 0;
  tagLauncher := 0;

  isChaffAdded := False;

  for i := 0 to TT3Vehicle(pi).Devices.Count - 1 do
  begin
    device := TT3Vehicle(pi).Devices.Items[i];

    if not (device is TT3CounterMeasure) then
      Continue;

    ecm := TT3CounterMeasure(device);

    if ecm is TT3ChaffOnVehicle then
    begin
      if not isChaffAdded then
      begin
        li := lvECM.Items.Add;
        li.Caption  := 'Chaff';
        li.Data     := ecm;

        li.SubItems.Add(ECMStatus[Byte(ecm.Status)]);

        isChaffAdded := True;
      end;

      item := TMenuItem.Create(Self);
      item.Caption := TT3ChaffOnVehicle(device).InstanceName;
      item.Tag := tagType;
      item.OnClick := MenuChaffTypeSelected;
      pmChaffType.Items.Add(item);

      Inc(tagType);
    end
    else if device is TT3ChaffLauncher then
    begin
      item := TMenuItem.Create(Self);
      item.Caption := TT3ChaffOnVehicle(device).InstanceName;
      item.Tag := tagLauncher;
      item.OnClick := MenuChaffLauncherSelected;
      pmChaffLauncher.Items.Add(item);

      Inc(tagLauncher);
    end
    else
    begin
      li := lvECM.Items.Add;
      li.Caption  := ecm.InstanceName;
      li.Data     := ecm;

      li.SubItems.Add(ECMStatus[Byte(ecm.Status)]);
    end;
  end;
end;

//procedure TfmCounterMeasure.RefreshRadarNoiseJammerPropertiesTab(
//  jammer: TT3RadarNoiseJammerOnVehicle);
//begin
//  grbRadarNoiseJammer.BringToFront;
//
//  case jammer.Status of
//    esDamaged: ;
//    esOn:
//      begin
//        sbRadarJammingControlActivationOn.Down := True;
//        sbRadarJammingControlActivationOff.Down := False;
//
//        cbRadarJammingControlMode.Enabled := True;
//        gbRadarJammingSelectedTrackMode.Enabled := True;
//        gbRadarJammingBarrageMode.Enabled := True;
//        gbRadarJammingSpotNumberMode.Enabled := True;
//      end;
//    esOff:
//      begin
//        sbRadarJammingControlActivationOn.Down := False;
//        sbRadarJammingControlActivationOff.Down := True;
//
//        cbRadarJammingControlMode.Enabled := False;
//        gbRadarJammingSelectedTrackMode.Enabled := False;
//        gbRadarJammingBarrageMode.Enabled := False;
//        gbRadarJammingSpotNumberMode.Enabled := False;
//      end;
//    esEMCON: ;
//  end;
//
//  case Targeting of
//    ettTrack  :
//    begin
//      sbOnBoardSelfDefenseJammerControlTargetingTrack.Down := true;
//      grbManualSpot.Visible := False;
//      grbManualTrack.Visible := True;
//    end;
//    ettSpot   :
//    begin
//      sbOnBoardSelfDefenseJammerControlTargetingSpot.Down := true;
//      grbManualSpot.Visible := True;
//      grbManualTrack.Visible := False;
//    end
//    else
//    begin
//      grbManualSpot.Visible := False;
//      grbManualTrack.Visible := False;
//    end;
//  end;
//
//  edtOnBoardSelfDefenseJammerBearing.Text    := IntToStr(Bearing);
//  edtOnBoardSelfDefenseJammerSpotNumber.Text := IntToStr(SpotNumber);
//
//  { find target }
//  tgt  := simMgrClient.FindT3PlatformByID(TargetIndex);
//  if tgt = nil then
//    Exit;
//
//  if simMgrClient.ISInstructor then
//  begin
//    edtSDJammerTarget.Text := tgt.Track_ID
//  end
//  else
//  begin
//    dt := simMgrClient.findDetectedTrack(tgt);
//
//    if Assigned(dt) then
//    begin
//        edtSDJammerTarget.Text := FormatTrackNumber(TT3DetectedTrack(dt).TrackNumber);
//    end
//    else
//    begin
//      if TT3PlatformInstance(tgt).TrackNumber = 0 then
//        edtSDJammerTarget.Text := tgt.Track_ID
//      else
//        edtSDJammerTarget.Text := FormatTrackNumber(TT3PlatformInstance(tgt).TrackNumber);
//    end;
//  end;
//end;

procedure TfmCounterMeasure.RemoveListCounterMeasure(ctrlObj: TObject);
begin
  if not(Assigned(ctrlObj)) then
    Exit;

  if FControlled = ctrlObj then
  begin
    lvECM.Items.Clear;
    PanelCounterMeasure.Visible := False;

    focusedECM := nil;
  end;
end;

procedure TfmCounterMeasure.sbOnBoardSelfDefenseJammerControlModeAutoClick(
  Sender: TObject);
var
  recECMCommand : TRecECMCommand;
begin
  inherited;

  if Assigned(focusedECM) and (focusedECM is TT3DefensiveJammerOnVehicle) and
     not (TT3DefensiveJammerOnVehicle(focusedECM).Status = esDamaged) then  begin

    DefaultSelfDefenseECMValue(recECMCommand);

    case TSpeedButton(Sender).Tag of
      1 :
        begin
          { automatic mode }
          recECMCommand.OrderID := CORD_ID_SD_SETMODE;
          recECMCommand.Mode    := 2;
        end;
      2 :
        begin
          { automatic mode }
          recECMCommand.OrderID := CORD_ID_SD_SETMODE;
          recECMCommand.Mode    := 1;
        end;
      3 :
        begin
          { automatic mode }
          recECMCommand.OrderID := CORD_ID_SD_SETMODE;
          recECMCommand.Mode    := 0;
        end;
      4 :
        begin
          { spot targeting }
          recECMCommand.OrderID := CORD_ID_SD_SETMANMODE;
          recECMCommand.ManualTgtType := 1;
        end;
      5 :
        begin
          { spot targeting }
          recECMCommand.OrderID := CORD_ID_SD_SETMANMODE;
          recECMCommand.ManualTgtType := 0;
        end;
    end;

    simMgrClient.NetSendECMCommand(recECMCommand);
  end;
end;

procedure TfmCounterMeasure.SetControlledObject(ctrlObj: TObject);
var
  ec : TECMCategory;
  v : TT3Vehicle;
begin
  inherited;

  if not Assigned(FControlled) then
    Exit;

  focusedECM := nil;

  RefreshPlatformECMTab(TT3PlatformInstance(FControlled));

  if lvECM.Items.Count = 0 then
  begin
    PanelCounterMeasure.Visible := False;
    Exit;
  end
  else
    PanelCounterMeasure.Visible := True;

  lvECM.ItemFocused := lvECM.Items[0];
  focusedECM := lvECM.ItemFocused.Data;

  ec := TT3CounterMeasure(focusedECM).Category;
  DisplayTab(Byte(ec));
  case ec of
    ecAcousticDecoy   : UpdateAcousticDecoyTab(focusedECM);
    ecAirborneChaff   : UpdateAirborneChaffTab(focusedECM);
    ecFloatingDecoy,
    ecInfraredDecoy   : UpdateDecoy(focusedECM);
    ecTowedJammer     : UpdateTowedJammer(focusedECM);
    ecOnBoardDefence  : UpdateOnBoardSelfDefence(focusedECM);
    ecSurfaceChaff    : UpdateSurfaceChaff(focusedECM);
    ecBubble          : UpdateAirBubbleTab(focusedECM);
    ecRadarNoiseJammer: UpdateNoiseJammer(focusedECM); //jammer noise
  end;

  if focusedECM is TT3ChaffOnVehicle then
  begin
    with TT3ChaffOnVehicle(focusedECM) do
    begin
      if ChaffDefinition.FData.Instance_Type = Byte(ecgSeduction) then
      begin
        Label19.Visible := True;
        Bevel4.Visible := True;
        ckSurfaceChaffSeductionEnabled.Visible := True;

        v := TT3Vehicle(TT3ChaffOnVehicle(focusedECM).Parent);

        if v.VehicleDefinition.FData.Chaff_Seduction_Capable then
          ckSurfaceChaffSeductionEnabled.Enabled := True
        else
          ckSurfaceChaffSeductionEnabled.Enabled := False;
      end
      else
      begin
        Label19.Visible := False;
        Bevel4.Visible := False;
        ckSurfaceChaffSeductionEnabled.Visible := False;
        ckSurfaceChaffSeductionEnabled.Enabled := False;
      end;
    end;
  end;

  //lvECM.Items[0].Selected := True;
end;

//procedure TfmCounterMeasure.SetListener(Sender : TObject);
//var
//  lc : TObject;
//begin
//  FreeAndNil(listener);
//
//  if Sender is TT3ChaffOnVehicle then begin
//    lc := TT3ChaffOnVehicle(Sender).ChaffLaunchers.Items[TT3ChaffOnVehicle(Sender).Launcher - 1];
//
//    listener := TT3ChaffLauncherListener.Create;
//    TT3ChaffLauncher(lc).addListener(listener);
//
//    with TT3ChaffLauncherListener(listener) do begin
//      OnDelayChange       := OnChaffDelayChange;
//      OnSalvoChange       := OnChaffSalvoChange;
//      OnBloomRangeChange  := OnChaffBloomRangeChange;
//      OnBloomAltitudeChange := OnChaffBloomAltitudeChange;
//      OnStateChange       := OnChaffStateChange;
//    end;
//  end;
//end;

procedure TfmCounterMeasure.UpdateAcousticDecoyTab(Sender: TObject);
begin
  if not (Sender is TT3AcousticDecoyOnVehicle) then
    exit;

  with TT3AcousticDecoyOnVehicle(Sender) do
  begin
    case DeploymentAction of
      edaDeploy : sbAcousticDecoyActionDeploy.Down := true;
      edaStow   : sbAcousticDecoyActionDeploy.Down := true;
    end;

    case Control of
      ecaOn   : sbAcousticDecoyActivationOn.Down  := true;
      ecaOff  : sbAcousticDecoyActivationOff.Down := true;
    end;

    case CycleTimer of
      ectOn   : sbAcousticDecoyCycleTimerOn.Down  := true;
      ectOff  : sbAcousticDecoyCycleTimerOff.Down := true;
    end;

    edtAcousticDecoyMode.Text   := AcousticMode[Byte(Mode)];
    edtAcousticDecoyFilter.Text := IntToStr(FilterSetting);
  end;
end;

procedure TfmCounterMeasure.UpdateAirborneChaffTab(Sender: TObject);
begin
  if not (Sender is TT3ChaffOnVehicle) then
    exit;

  with TT3ChaffOnVehicle(Sender) do
  begin
    lbChaffAirboneQuantity.Caption := IntToStr(Quantity);
  end;
end;

procedure TfmCounterMeasure.UpdateAirBubbleTab(Sender: TObject);
begin
  if not (Sender is TT3AirBubbleOnVehicle) then
    exit;

  with TT3AirBubbleOnVehicle(Sender) do
  begin
    lblBubblelQuantity.Caption := IntToStr(Quantity);
    edtBubble.Text := InstanceName;

    {if ChaffLaunchers.Count <= 0 then exit;

    if Launcher > 0 then begin
      lc := ChaffLaunchers.Items[Launcher-1];

      edtSurfaceChaffLauncher.Text  := IntToStr(TT3ChaffLauncher(lc).Number) + '-' +
                                        FormatFloat('##',TT3ChaffLauncher(lc).Angle);
      edtSurfaceChaffBearing.Text   := FormatCourse(TT3ChaffLauncher(lc).Angle);

      edtSurfaceChaffBloomRange.Text := FormatCourse(TT3ChaffLauncher(lc).BloomRange);
      edtSurfaceChaffBloomAltitude.Text :=  FormatCourse(TT3ChaffLauncher(lc).BloomAltitude);
      edtSurfaceChaffSalvoSize.Text := IntToStr(TT3ChaffLauncher(lc).SalvoSize);
      edtSurfaceChaffDelay.Text     := IntToStr(TT3ChaffLauncher(lc).Delay);
    end; }
  end;
end;

procedure TfmCounterMeasure.UpdateECMList(ecm: TT3CounterMeasure);
var
  i: integer;
  li: TListItem;
begin
  if lvECM.Items.count = 0 then
    exit;

  if not(Assigned(FControlled)) then
    Exit;

  if not(Assigned(ecm)) then
    Exit;

  if ecm.Parent <> FControlled then
    Exit;

  for i := 0 to lvECM.Items.Count - 1 do
  begin
    li := lvECM.Items[i];

    if li.Data = ecm then
    begin
      case ecm.Status of
        esAvailable:
          li.SubItems[0] := 'Available';
        esLaunchingChaff:
          li.SubItems[0] := 'Launcing Chaff';
        esUnavailable:
          li.SubItems[0] := 'Unavailable';
        esDamaged:
          li.SubItems[0] := 'Damage';
        esOn:
          li.SubItems[0] := 'On';
        esOff:
          li.SubItems[0] := 'Off';
        esEMCON:
          li.SubItems[0] := 'EMCON';
        esAutomatic:
          li.SubItems[0] := 'Automatic';
        esManual:
          li.SubItems[0] := 'Manual';
        esDeployed:
          li.SubItems[0] := 'Deployed';
        esStowed:
          li.SubItems[0] := 'Stowing';
      end;

      break;
    end;
  end;
end;

procedure TfmCounterMeasure.UpdateDecoy(Sender: TObject);
begin

  if Sender is TT3FloatingDecoyOnVehicle then
    with TT3FloatingDecoyOnVehicle(Sender) do
      lbFloatingDecoyQuantity.Caption := IntToStr(TT3FloatingDecoyOnVehicle(Sender).Quantity) ;

  if Sender is TT3InfraredDecoyOnVehicle then
    with TT3InfraredDecoyOnVehicle(Sender) do
      lbFloatingDecoyQuantity.Caption := IntToStr(TT3InfraredDecoyOnVehicle(Sender).Quantity) ;
end;

procedure TfmCounterMeasure.UpdateForm;
begin
  inherited;
end;

procedure TfmCounterMeasure.UpdateOnBoardSelfDefence(Sender: TObject);
var
  tgt: TT3PlatformInstance;
  dt: TSimObject;
begin
  if not(Sender is TT3DefensiveJammerOnVehicle) then
    exit;

  with TT3DefensiveJammerOnVehicle(Sender) do
  begin
    case Status of
      esAutomatic   :
      begin
        sbOnBoardSelfDefenseJammerControlModeAuto.Down := true;
        sbOnBoardSelfDefenseJammerControlTargetingTrack.Enabled := false;
        sbOnBoardSelfDefenseJammerControlTargetingSpot.Enabled  := false;
        edtOnBoardSelfDefenseJammerBearing.Enabled := False;
        edtOnBoardSelfDefenseJammerSpotNumber.Enabled := false;
        btnSDJammerTarget.Enabled := false;
      end;
      esManual      :
      begin
        sbOnBoardSelfDefenseJammerControlModeManual.Down := true;
        sbOnBoardSelfDefenseJammerControlTargetingTrack.Enabled := true;
        sbOnBoardSelfDefenseJammerControlTargetingSpot.Enabled  := true;
        edtOnBoardSelfDefenseJammerBearing.Enabled := True;
        edtOnBoardSelfDefenseJammerSpotNumber.Enabled := True;
        btnSDJammerTarget.Enabled := True;
      end;
      esOff         :
      begin
        sbOnBoardSelfDefenseJammerControlModeOff.Down := true;
        sbOnBoardSelfDefenseJammerControlTargetingTrack.Enabled := false;
        sbOnBoardSelfDefenseJammerControlTargetingSpot.Enabled  := false;
        edtOnBoardSelfDefenseJammerBearing.Enabled := False;
        edtOnBoardSelfDefenseJammerSpotNumber.Enabled := false;
        btnSDJammerTarget.Enabled := false;
      end;
    end;

    case Targeting of
      ettTrack  :
      begin
        sbOnBoardSelfDefenseJammerControlTargetingTrack.Down := true;
        grbManualSpot.Visible := False;
        grbManualTrack.Visible := True;
      end;
      ettSpot   :
      begin
        sbOnBoardSelfDefenseJammerControlTargetingSpot.Down := true;
        grbManualSpot.Visible := True;
        grbManualTrack.Visible := False;
      end
      else
      begin
        grbManualSpot.Visible := False;
        grbManualTrack.Visible := False;
      end;
    end;

    edtOnBoardSelfDefenseJammerBearing.Text    := FormatFloat('000.0', Bearing); //FloatToStr(Bearing);
    edtOnBoardSelfDefenseJammerSpotNumber.Text := IntToStr(SpotNumber);

    { find target }
    tgt  := simMgrClient.FindT3PlatformByID(TargetIndex);
    if tgt = nil then
      Exit;

    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
    begin
      edtSDJammerTarget.Text := tgt.Track_ID
    end
    else
    begin
      dt := simMgrClient.findDetectedTrack(tgt);

      if Assigned(dt) then
      begin
          edtSDJammerTarget.Text := FormatTrackNumber(TT3DetectedTrack(dt).TrackNumber);
      end
      else
      begin
        if TT3PlatformInstance(tgt).TrackNumber = 0 then
          edtSDJammerTarget.Text := tgt.Track_ID
        else
          edtSDJammerTarget.Text := FormatTrackNumber(TT3PlatformInstance(tgt).TrackNumber);
      end;
    end;
  end;
end;

procedure TfmCounterMeasure.UpdateRadarNoiseJammerList(
  sensor: TT3RadarNoiseJammerOnVehicle; value: byte);
var
 i: integer;
 li: TListItem;
 obj : TObject;
begin
  if lvECM.Items.Count = 0 then
    exit;

  for i := 0 to lvECM.Items.Count - 1 do
  begin
    li := lvECM.Items[i];
    obj := li.Data;

    if obj is TT3RadarNoiseJammerOnVehicle then
    begin
      case sensor.Status of
        esOn:
          li.SubItems[0] := 'On';
        esOff :
          li.SubItems[0] := 'Off';
        esDamaged:
          li.SubItems[0] := 'Damaged';
        esEMCON:
          li.SubItems[0] := 'EMCON';
      end;
    end;
  end;
end;

procedure TfmCounterMeasure.UpdateNoiseJammer (Sender: TObject);    //jammer noise
var
  tgt: TT3PlatformInstance;
  dt: TSimObject;
  jammer : TT3RadarNoiseJammerOnVehicle;
begin
  if not (Sender is TT3RadarNoiseJammerOnVehicle) then
    exit
  else
    jammer := TT3RadarNoiseJammerOnVehicle(Sender);

  case jammer.Status of
    esDamaged: ;
    esOn:
      begin
        sbRadarJammingControlActivationOn.Down := True;
        sbRadarJammingControlActivationOff.Down := False;

        cbRadarJammingControlMode.Enabled := True;
        gbRadarJammingSelectedTrackMode.Enabled := True;
        gbRadarJammingBarrageMode.Enabled := True;
        gbRadarJammingSpotNumberMode.Enabled := True;
      end;
    esOff:
      begin
        sbRadarJammingControlActivationOn.Down := False;
        sbRadarJammingControlActivationOff.Down := True;

        cbRadarJammingControlMode.Enabled := False;
        gbRadarJammingSelectedTrackMode.Enabled := False;
        gbRadarJammingBarrageMode.Enabled := False;
        gbRadarJammingSpotNumberMode.Enabled := False;
      end;
    esEMCON: ;
  end;

  case jammer.JamTargeting of
    ettNJBarrage  :
    begin
      gbRadarJammingBarrageMode.BringToFront;
      Label537.Enabled := true;
      Label538.Enabled := True;
      editRadarJammingBarrageBandwidth.Enabled := true;
      cbRadarJammingControlMode.ItemIndex := 0;

      editRadarJammingBarrageBearing.Text   := FormatFloat('000.0',jammer.JamBearing);//FloatToStr(jammer.JamBearing);
      editRadarJammingBarrageCenter.Text    := FormatFloat('000.0',jammer.JamCenterFreq);//(jammer.JamCenterFreq);
      editRadarJammingBarrageBandwidth.Text := FormatFloat('000.0',jammer.JamBandWidth);//FloatToStr(jammer.JamBandWidth);
    end;
    ettNJTrack   :
    begin
      gbRadarJammingSelectedTrackMode.BringToFront;
      gbRadarJammingSelectedTrackMode.BringToFront;
      cbRadarJammingControlMode.ItemIndex := 3;

      Label518.Enabled := False;
      Label528.Enabled := False;
      Label535.Enabled := False;
      Label530.Enabled := False;
      Label539.Enabled := False;
      Label540.Enabled := False;
      editRadarJammingModeSelectedTrackBearing.Enabled := False;
      editRadarJammingModeSelectedTrackCenterFreq.Enabled := False;
      editRadarJammingModeSelectedTrackBandwidth.Enabled := False;

      { find target }
      tgt  := simMgrClient.FindT3PlatformByID(jammer.JamReqTargetRadarOwnId);
      if tgt = nil then
        Exit;

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      begin
        editRadarJammingSelectedTrackModeTrack.Text := tgt.Track_ID
      end
      else
      begin
        dt := simMgrClient.findDetectedTrack(tgt);

        if Assigned(dt) then
        begin
          editRadarJammingSelectedTrackModeTrack.Text :=
            FormatTrackNumber(TT3DetectedTrack(dt).TrackNumber);
        end
        else
        begin
          if TT3PlatformInstance(tgt).TrackNumber = 0 then
            editRadarJammingSelectedTrackModeTrack.Text := tgt.Track_ID
          else
            editRadarJammingSelectedTrackModeTrack.Text :=
              FormatTrackNumber(TT3PlatformInstance(tgt).TrackNumber);
        end;
      end;

      editRadarJammingModeSelectedTrackBearing.Text    := FormatFloat('000.0',jammer.JamBearing);//FloatToStr(jammer.JamBearing);
      editRadarJammingModeSelectedTrackCenterFreq.Text := FormatFloat('000.0',jammer.JamCenterFreq);//FloatToStr(jammer.JamCenterFreq);
      editRadarJammingModeSelectedTrackBandwidth.Text  := FormatFloat('000.0',jammer.JamBandWidth);//FloatToStr(jammer.JamBandWidth);
    end;
    ettNJSpotNum :
    begin
      gbRadarJammingSpotNumberMode.BringToFront;
      cbRadarJammingControlMode.ItemIndex := 2;
      label522.Enabled := False;
      Label523.Enabled := False;
      Label524.Enabled := False;
      Label525.Enabled := False;
      editRadarJammingSpotNumberCenter.Enabled := False;
      editRadarJammingSpotNumberBandwidth.Enabled := False;

      editRadarJammingSpotNumberSpot.Text       := IntToStr(jammer.JamSpotNumber);
      editRadarJammingSpotNumberBearing.Text    := FormatFloat('000.0',jammer.JamBearing);//FloatToStr(jammer.JamBearing);
      editRadarJammingSpotNumberCenter.Text     := FormatFloat('000.0',jammer.JamCenterFreq);//FloatToStr(jammer.JamCenterFreq);
      editRadarJammingSpotNumberBandwidth.Text  := FormatFloat('000.0',jammer.JamBandWidth);//FloatToStr(jammer.JamBandWidth);
    end;
    ettNJFreq :
    begin
      gbRadarJammingBarrageMode.BringToFront;
      cbRadarJammingControlMode.ItemIndex := 1;
      Label537.Enabled := False;
      Label538.Enabled := False;
      editRadarJammingBarrageBandwidth.Enabled := False;

      editRadarJammingBarrageBearing.Text   := FormatFloat('000.0',jammer.JamBearing);//FloatToStr(jammer.JamBearing);
      editRadarJammingBarrageCenter.Text    := FormatFloat('000.0',jammer.JamCenterFreq);//FloatToStr(jammer.JamCenterFreq);
      editRadarJammingBarrageBandwidth.Text := FormatFloat('000.0',jammer.JamBandWidth);//FloatToStr(jammer.JamBandWidth);
    end
    else
    begin
      //
    end;
  end;
end;

procedure TfmCounterMeasure.UpdateSurfaceChaff(Sender: TObject);
var
  lc : TObject;
begin
  if not (Sender is TT3ChaffOnVehicle) then
    exit;

  InitSurfaceChaffUI;

  with TT3ChaffOnVehicle(Sender) do
  begin
    edtSurfaceChaffType.Text := InstanceName;
    lblSurfaceChaffQuantity.Caption := IntToStr(Quantity);

    if ChaffLaunchers.Count > 0 then
    begin
      lc := ChaffLaunchers.Items[Launcher];

      if TT3ChaffLauncher(lc).Kind = 0 then
      begin
        edtSurfaceChaffLauncher.Text   := IntToStr(TT3ChaffLauncher(lc).Number) + ' - ' +
                                          FormatFloat('000',TT3ChaffLauncher(lc).Angle);
        edtSurfaceChaffBearing.ReadOnly := True;
      end
      else
      begin
        edtSurfaceChaffLauncher.Text   := IntToStr(TT3ChaffLauncher(lc).Number) + ' - Trainable';
        edtSurfaceChaffBearing.ReadOnly := False;
      end;

      edtSurfaceChaffBearing.Text    := FormatFloat('000',TT3ChaffLauncher(lc).Angle);
      edtSurfaceChaffBloomRange.Text := FormatCourse(TT3ChaffLauncher(lc).BloomRange);
      edtSurfaceChaffBloomAltitude.Text :=  FormatCourse(TT3ChaffLauncher(lc).BloomAltitude);
      edtSurfaceChaffSalvoSize.Text  := IntToStr(TT3ChaffLauncher(lc).SalvoSize);
      edtSurfaceChaffDelay.Text      := IntToStr(TT3ChaffLauncher(lc).Delay);
    end;
  end;
end;

procedure TfmCounterMeasure.UpdateTowedJammer(Sender: TObject);
begin
  if not (Sender is TT3TowedJammerOnVehicle) then
    exit;

  with TT3TowedJammerOnVehicle(Sender) do
  begin
    case Status of
      esAutomatic   : sbTowedJammerDecoyModeAuto.Down := true;
      esManual      : sbTowedJammerDecoyModeManual.Down := true;
      esOff         : sbTowedJammerDecoyModeOff.Down := true;
    end;

    case Targeting of
      ettTrack  : sbTowedJammerDecoyTargetingTrack.Down := true;
      ettSpot   : sbTowedJammerDecoyTargetingSpot.Down := true;
    end;

    case DeploymentAction of
      edaDeploy : sbTowedJammerDecoyActionDeploy.Down := true;
      edaStow   : sbTowedJammerDecoyActionStow.Down := true;
    end;

    edtTowedJammerDecoyBearing.Text     := IntToStr(Bearing); //mk
    lblTowedJammerDecoyQuantity.Caption := IntToStr(Quantity);
    editTowedJammerDecoyOrdered.Text := IntToStr(OrderedTowedLength);
    lblTowedJammerDecoyActual.Caption := IntToStr(ActualTOwedLength);
  end;
end;

{
AcousticDecoy
AirborneChaff
FloatingDecoy
OnBoardSelfDefenseJammer
TowedJammerDecoy
RadarJamming

BarrageMode
SelectedTrackMode
SpotNumberMode
}

end.
