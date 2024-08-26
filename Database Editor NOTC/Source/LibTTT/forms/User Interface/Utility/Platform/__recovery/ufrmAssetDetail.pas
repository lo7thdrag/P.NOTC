unit ufrmAssetDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle, uDBAssetObject, uSimContainers;

type
  TfrmAssetDetail = class(TForm)
    lbAsset: TListBox;
    ImgBackgroundAvailable: TImage;
    ImgBackgroundForm: TImage;
    lblTitle: TLabel;
    Image1: TImage;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    FAssetList : TList;
    FSelectedVehicle : TVehicle_Definition;

    procedure UpdateAssetList;

  public
    ButtonTag : integer;

    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;
  end;

var
  frmAssetDetail: TfrmAssetDetail;

implementation

uses
  uDataModuleTTT, uDBAsset_Radar, uDBAsset_Sonar, uDBAsset_ESM, uDBAsset_Sensor, uDBAsset_Sonobuoy,
  uDBAsset_Weapon, uDBAsset_Countermeasure;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAssetDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAssetList);
  Action := cafree;
end;

procedure TfrmAssetDetail.FormCreate(Sender: TObject);
begin
  FAssetList := TList.Create;
end;

procedure TfrmAssetDetail.FormShow(Sender: TObject);
begin
//  UpdateFilterTypeItems;
  UpdateAssetList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAssetDetail.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAssetDetail.UpdateAssetList;
var
  i : Integer;
  radar : TRadar_On_Board;
  sonar : TSonar_On_Board;
  ESM : TESM_On_Board;
  EOD : TEOD_On_Board;
  MAD : TMAD_On_Board;
  sonobuoy : TSonobuoy_On_Board;
  visualdetector : TVisual_Sensor_On_Board;
  IFF : TIFF_Sensor_On_Board;
  missile : TMissile_On_Board;
  torpedo : TTorpedo_On_Board;
  mine : TMine_On_Board;
  gun : TGun_Definition;
  bomb : TBomb_Definition;
  acousticdecoy : TAcoustic_Decoy_On_Board;
  airbubble : TAir_Bubble_On_Board;
  chaff : TChaff_On_Board;
  floatingdecoy : TFloating_Decoy_On_Board;
  infrareddecoy : TInfrared_Decoy_On_Board;
  radarjammer : TRadar_Noise_Jammer_On_Board;
  definsivejammer : TDefensive_Jammer_On_Board;
  towedjammerdecoy : TTowed_Jammer_Decoy_On_Board;
begin
  lbAsset.Items.Clear;

  case ButtonTag of
    0:
    begin
      lblTitle.Caption := 'List of Radar';
      dmTTT.GetRadarOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
      begin
        radar := FAssetList.Items[i];
        lbAsset.Items.AddObject(radar.FData.Instance_Identifier, radar);
      end;
    end;
    1:
    begin
      lblTitle.Caption := 'List of Sonar';
      dmTTT.GetSonarOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
      begin
        sonar := FAssetList.Items[i];
        lbAsset.Items.AddObject(sonar.FData.Instance_Identifier, sonar);
      end;
    end;
    2:
    begin
      lblTitle.Caption := 'List of ESM';
      dmTTT.GetESMOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          esm := FAssetList.Items[i];
          lbAsset.Items.AddObject(esm.FData.Instance_Identifier, esm);
        end;
    end;
    3:
    begin
      lblTitle.Caption := 'List of EOD';
      dmTTT.GetEOOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          eod := FAssetList.Items[i];
          lbAsset.Items.AddObject(eod.FData.Instance_Identifier, eod);
        end;
    end;
    4:
    begin
      lblTitle.Caption := 'List of MAD';
      dmTTT.GetMADOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          mad := FAssetList.Items[i];
          lbAsset.Items.AddObject(mad.FData.Instance_Identifier, mad);
        end;
    end;
    5:
    begin
      lblTitle.Caption := 'List of Buoy';
      dmTTT.GetSonobuoyOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          sonobuoy := FAssetList.Items[i];
          lbAsset.Items.AddObject(sonobuoy.FData.Instance_Identifier, sonobuoy);
        end;
    end;
    6:
    begin
      lblTitle.Caption := 'Visual Detector';
      dmTTT.GetVisualOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          visualdetector := FAssetList.Items[i];
          lbAsset.Items.AddObject(visualdetector.FData.Instance_Identifier, visualdetector);
        end;
    end;
    7:
    begin
      lblTitle.Caption := 'List of IFF';
      dmTTT.GetIFFOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          IFF := FAssetList.Items[i];
          lbAsset.Items.AddObject(IFF.FData.Instance_Identifier, IFF);
        end;
    end;
    8:
    begin
      lblTitle.Caption := 'List of Missiles';
      dmTTT.GetMissileOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          missile := FAssetList.Items[i];
          lbAsset.Items.AddObject(missile.FData.Instance_Identifier, missile);
        end;
    end;
    9:
    begin
      lblTitle.Caption := 'List of Torpedoes';
      dmTTT.GetTorpedoOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          torpedo := FAssetList.Items[i];
          lbAsset.Items.AddObject(torpedo.FData.Instance_Identifier, torpedo);
        end;
    end;
    10:
    begin
      lblTitle.Caption := 'List of Mines';
      dmTTT.GetMineOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          Mine := FAssetList.Items[i];
          lbAsset.Items.AddObject(Mine.FData.Instance_Identifier, Mine);
        end;
    end;
    11:
    begin
      lblTitle.Caption := 'List of Guns';
      dmTTT.GetGunOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          Gun := FAssetList.Items[i];
          lbAsset.Items.AddObject(Gun.FPoint.FData.Instance_Identifier, Gun);
        end;
    end;
    12:
    begin
      lblTitle.Caption := 'List of Bombs';
      dmTTT.GetBombOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          Bomb := FAssetList.Items[i];
          lbAsset.Items.AddObject(Bomb.FData.Bomb_Identifier, Bomb);
        end;
    end;
    13:
    begin
      lblTitle.Caption := 'Accoustic Decoy';
      dmTTT.GetAcousticDecoyOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          acousticdecoy := FAssetList.Items[i];
          lbAsset.Items.AddObject(acousticdecoy.FData.Instance_Identifier, acousticdecoy);
        end;
    end;
    14:
    begin
      lblTitle.Caption := 'Air Bubble';
      dmTTT.GetAirBubbleOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          AirBubble := FAssetList.Items[i];
          lbAsset.Items.AddObject(AirBubble.FData.Instance_Identifier, AirBubble);
        end;
    end;
    15:
    begin
      lblTitle.Caption := 'List of Chaff';
      dmTTT.GetChaffOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          Chaff := FAssetList.Items[i];
          lbAsset.Items.AddObject(Chaff.FData.Instance_Identifier, Chaff);
        end;
    end;
    16:
    begin
      lblTitle.Caption := 'Floating Decoy';
      dmTTT.GetFloatingDecoyOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          FloatingDecoy := FAssetList.Items[i];
          lbAsset.Items.AddObject(FloatingDecoy.FData.Instance_Identifier, FloatingDecoy);
        end;
    end;
    17:
    begin
      lblTitle.Caption := 'Infrared Decoy';
      dmTTT.GetInfraredDecoyOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          InfraredDecoy := FAssetList.Items[i];
          lbAsset.Items.AddObject(InfraredDecoy.FData.Instance_Identifier, InfraredDecoy);
        end;
    end;
    18:
    begin
      lblTitle.Caption := 'Radar Noise';
      dmTTT.GetRadarNoiseJammerOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          radarjammer := FAssetList.Items[i];
          lbAsset.Items.AddObject(radarjammer.FData.Instance_Identifier, radarjammer);
        end;
    end;
    19:
    begin
      lblTitle.Caption := 'Self Defensive';
      dmTTT.GetSelfDefensiveJammerOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          definsivejammer := FAssetList.Items[i];
          lbAsset.Items.AddObject(definsivejammer.FData.Instance_Identifier, definsivejammer);
        end;
    end;
    20:
    begin
      lblTitle.Caption := 'Towed Jammer';
      dmTTT.GetTowedJammerDecoyOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAssetList);

      for i := 0 to FAssetList.Count - 1 do
        begin
          towedjammerdecoy := FAssetList.Items[i];
          lbAsset.Items.AddObject(towedjammerdecoy.FData.Instance_Identifier, towedjammerdecoy);
        end;
    end;
  end;
end;


{$ENDREGION}
end.
