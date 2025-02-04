unit ufmCounterMeasure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ufmControlled, uDBAssetObject;

type
  TfmCounterMeasure = class(TfmControlled)
    PanelCounterMeasureSpace: TPanel;
    PanelCounterMeasureChoice: TPanel;
    lvECM: TListView;
    PanelCounterMeasure: TPanel;
    grbOnBoardSelfDefenseJammer: TGroupBox;
    Label542: TLabel;
    Label543: TLabel;
    Label544: TLabel;
    Bevel112: TBevel;
    Label546: TLabel;
    Label547: TLabel;
    Label549: TLabel;
    sbOnBoardSelfDefenseJammerControlModeAuto: TSpeedButton;
    sbOnBoardSelfDefenseJammerControlModeManual: TSpeedButton;
    sbOnBoardSelfDefenseJammerControlTargetingSpot: TSpeedButton;
    sbOnBoardSelfDefenseJammerControlTargetingTrack: TSpeedButton;
    sbOnBoardSelfDefenseJammerControlModeOff: TSpeedButton;
    edtOnBoardSelfDefenseJammerBearing: TEdit;
    edtOnBoardSelfDefenseJammerSpotNumber: TEdit;
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
    Label513: TLabel;
    Bevel115: TBevel;
    Label545: TLabel;
    Label548: TLabel;
    Label551: TLabel;
    Label552: TLabel;
    Bevel116: TBevel;
    Label553: TLabel;
    Label554: TLabel;
    Label555: TLabel;
    Label556: TLabel;
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
    PanelRadarJamming: TPanel;
    Label532: TLabel;
    Label558: TLabel;
    Label557: TLabel;
    Bevel117: TBevel;
    btnComboRadarJammingControlMode: TSpeedButton;
    sbRadarJammingControlActivationOn: TSpeedButton;
    sbRadarJammingControlActivationOff: TSpeedButton;
    PanelRadarJammingMode: TPanel;
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
    cbRadarJammingControlMode: TComboBox;
    procedure lvECMSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshPlatformECMTab(pi: TPlatform_Instance);
  end;

implementation


uses
  uDBAsset_Countermeasure;

{$R *.dfm}

procedure TfmCounterMeasure.lvECMSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  selectedItem: TListItem;
  pi: TPlatform_Instance;
begin

  selectedItem := lvECM.ItemFocused;
  if selectedItem = nil then
    exit;

  pi := TPlatform_Instance(FControlled);
  case pi.defineECMType(selectedItem.Caption) of
    1:
      grbAirborneChaff.BringToFront;
    2:
      Panelradarjamming.BringToFront;
    3:
      grbonboardselfdefensejammer.BringToFront;
    4:
      grbacousticdecoy.BringToFront;
    5:
      ; // belum ada formnya
  end;
end;
procedure TfmCounterMeasure.RefreshPlatformECMTab(pi: TPlatform_Instance);
var
  li: TListItem;
  i: integer;
  jam: TJammer_On_Board;
  defjam: TDefensive_Jammer_On_Board;
  accDecoy: TAcoustic_Decoy_On_Board;
  airbub: TAir_Bubble_Mount;
begin

  lvECM.Items.Clear;

  for i := 0 to pi.Vehicle.Chaffs.Count - 1 do
  begin
    li := lvECM.Items.Add;
    jam := pi.Vehicle.Chaffs[i];
    li.Caption := jam.FData.Instance_Identifier;
    li.SubItems.Add('off');
  end;

  // jammer
  for i := 0 to pi.Vehicle.Jammers.Count - 1 do
  begin
    li := lvECM.Items.Add;
    jam := pi.Vehicle.Jammers[i];
    li.Caption := jam.FData.Instance_Identifier;
    li.SubItems.Add('off');
  end;

  // defensive jammer
  for i := 0 to pi.Vehicle.Defensive_Jammers.Count - 1 do
  begin
    li := lvECM.Items.Add;
    defjam := pi.Vehicle.Defensive_Jammers[i];
    li.Caption := defjam.FData.Instance_Identifier;
    li.SubItems.Add('off');
  end;

  // acoustic Decoy
  for i := 0 to pi.Vehicle.Acoustic_Decoys.Count - 1 do
  begin
    li := lvECM.Items.Add;
    accDecoy := pi.Vehicle.Acoustic_Decoys[i];
    li.Caption := accDecoy.FData.Instance_Identifier;
    li.SubItems.Add('off');

  end;

  // airbubble
  for i := 0 to pi.Vehicle.Air_Bubble_Mount.Count - 1 do
  begin
    li := lvECM.Items.Add;
    airbub := pi.Vehicle.Air_Bubble_Mount[i];
    li.Caption := airbub.FData.Instance_Identifier;
    li.SubItems.Add('off');
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
