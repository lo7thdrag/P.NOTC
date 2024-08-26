unit ufPlatformStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAssetObject, Menus;

type
  TfPlatformStatus = class(TForm)
    gbPlatformStatus: TPanel;
    Panel2: TPanel;
    pnlPlatformRight: TPanel;
    pnlPlatSensor: TPanel;
    Label76: TLabel;
    lvSensors: TListView;
    pnlPlatWeapon: TPanel;
    Label77: TLabel;
    tvWeapons: TTreeView;
    pnlPlatCounterMeasure: TPanel;
    Label78: TLabel;
    tvCountermeasures: TTreeView;
    pnlPlatSystemState: TPanel;
    Label80: TLabel;
    lvSystemState: TListView;
    pnlPlatformLeft: TPanel;
    pnlPlatforms: TPanel;
    Label75: TLabel;
    lvPlatforms: TListView;
    Panel13: TPanel;
    btSelectHookedPlatform: TButton;
    btHookSelectedPlatform: TButton;
    pnlPlatEmbarked: TPanel;
    Label79: TLabel;
    tvEmbarkedPlatforms: TTreeView;
    pmCountermeasure: TPopupMenu;
    Damage2: TMenuItem;
    Repair2: TMenuItem;
    SetAvailableQuantity1: TMenuItem;
    pmEmbarked: TPopupMenu;
    pmSensor: TPopupMenu;
    damage1: TMenuItem;
    fixed1: TMenuItem;
    pmState: TPopupMenu;
    pmWeapon: TPopupMenu;
    dam1: TMenuItem;
    Repair1: TMenuItem;
    SetAvailableQuantity2: TMenuItem;
    procedure lvPlatformsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
    pi : TPlatform_Instance;
  public
    { Public declarations }
    procedure setPI(platforms : TPlatform_Instance);
    function getPI: TPlatform_Instance;
    Procedure DisplayPlatformStatus;
    function FindTrackListPlatformByMember(const arg: string): TListItem;

    procedure RefreshPlatformWeapons(PfList: TPlatform_Instance);
    procedure RefreshPlatformCountermeasures(PfList: TPlatform_Instance);
    procedure RefreshEmbarkedPlatform(PfList: TPlatform_Instance);
  end;

var
  fPlatformStatus: TfPlatformStatus;

implementation

uses
  uSimMgr_Client, uBaseCoordSystem, uDBAsset_Radar, uDBAsset_Sonar,
  uDBAsset_Sensor, uDBAsset_Countermeasure, uDBAsset_Bomb, uDBAsset_Gun;

{$R *.dfm}

procedure TfPlatformStatus.setPI(platforms : TPlatform_Instance);
begin
  pi := platforms;
end;

function TfPlatformStatus.getPI;
begin
  Result := pi;
end;

procedure TfPlatformStatus.lvPlatformsSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  s: string;
  li: TListItem;
  pi: TPlatform_Instance;
  rdr: TRadar_On_Board;
  i: Integer;
begin
  if Item = nil then
    exit;

  pi := Item.Data;
  if pi = nil then
    exit;

  lvSensors.Items.Clear;

  for i := 0 to pi.Vehicle.Radars.Count - 1 do
  begin
    rdr := pi.Vehicle.Radars[i];

    li := lvSensors.Items.Add;
    li.Caption := rdr.FDef.Radar_Identifier;
    li.SubItems.Add('off');

  end;

  for i := 0 to pi.Vehicle.Sonars.Count - 1 do
  begin
    li := lvSensors.Items.Add;
    li.Caption := TSonar_On_Board(pi.Vehicle.Sonars[i]).FDef.Sonar_Identifier;
    li.SubItems.Add('off');
  end;

  for i := 0 to pi.Vehicle.EOSensors.Count - 1 do
  begin
    li := lvSensors.Items.Add;
    li.Caption := TEO_On_Board(pi.Vehicle.EOSensors[i])
      .FEO_Def.Class_Identifier;
    li.SubItems.Add('off');
  end;

  for i := 0 to pi.Vehicle.ESMSensors.Count - 1 do
  begin
    li := lvSensors.Items.Add;
    li.Caption := TESM_On_Board(pi.Vehicle.ESMSensors[i])
      .FESM_Def.Class_Identifier;
    li.SubItems.Add('off');
  end;

  for i := 0 to pi.Vehicle.MADSensors.Count - 1 do
  begin
    li := lvSensors.Items.Add;
    li.Caption := TMAD_Sensor_On_Board(pi.Vehicle.MADSensors[i])
      .FMAD_Def.Class_Identifier;
    li.SubItems.Add('off');
  end;

  for i := 0 to pi.Vehicle.IFFSensors.Count - 1 do
  begin
    li := lvSensors.Items.Add;
    li.Caption := TIFF_Sensor_On_Board(pi.Vehicle.IFFSensors[i])
      .FData.Instance_Identifier;
    li.SubItems.Add('off');
  end;

  for i := 0 to pi.Vehicle.Visualsensors.Count - 1 do
  begin
    li := lvSensors.Items.Add;
    li.Caption := TVisual_Sensor_On_Board(pi.Vehicle.Visualsensors[i])
      .FData.Instance_Identifier;
    li.SubItems.Add('off');
  end;

  for i := 0 to pi.Vehicle.FCRSensors.Count - 1 do
  begin
    li := lvSensors.Items.Add;
    li.Caption := TFCR_On_Board(pi.Vehicle.FCRSensors)
      .FFCR_def.Radar_Identifier;
    li.SubItems.Add('off');
  end;
  // RefreshPlatformSensors(pi);
  RefreshPlatformWeapons(pi);
  RefreshPlatformCountermeasures(pi);
  RefreshEmbarkedPlatform(pi);
end;

procedure TfPlatformStatus.DisplayPlatformStatus;
var
  s: string;
  li: TListItem;
  i: Integer;
  forceColor: String;
begin
  with (simMgrClient) do
  begin
    for i := 0 to Platforms.ChildCount - 1 do
    begin

      pi := TPlatform_Instance(Platforms.Childs[i]);

      s := pi.FData.Instance_Name;

      li := FindTrackListPlatformByMember(s);

      if li = nil then
      begin
        li := lvPlatforms.Items.Add;
        li.Caption := pi.Vehicle.FData.Vehicle_Identifier;
        li.SubItems.Add(pi.InstanceName);
        li.SubItems.Add(FormatTrackNumber(pi.TrackNumber));

        case pi.FData.Force_Designation of
          1:
            begin
              lvPlatforms.Canvas.Brush.Color := clRed;
              forceColor := 'Red';
            end;
          2:
            begin
              lvPlatforms.Canvas.Brush.Color := clYellow;
              forceColor := 'Yellow';
            end;
          3:
            begin
              lvPlatforms.Canvas.Brush.Color := clBlue;
              forceColor := 'Blue';
            end;
          4:
            begin
              lvPlatforms.Canvas.Brush.Color := clGreen;
              forceColor := 'Green';
            end;
          5:
            begin
              lvPlatforms.Canvas.Brush.Color := clWhite;
              forceColor := 'No Force';
            end;
          6:
            begin
              lvPlatforms.Canvas.Brush.Color := clBlack;
              forceColor := 'Black';
            end;
        else
          lvPlatforms.Canvas.Brush.Color := clBlack;
        end;
        li.SubItems.Add(forceColor);
        li.Data := pi;
        lvPlatforms.Canvas.Brush.Color := clBlack;
      end
      else
      begin
        // sudah ada.
        li.SubItems[0] := pi.InstanceName;
        li.SubItems[1] := FormatTrackNumber(pi.TrackNumber);
        li.SubItems[2] := IntToStr(pi.FData.Force_Designation);
      end;
    end;
  end;
end;

function TfPlatformStatus.FindTrackListPlatformByMember(const arg: string)
  : TListItem;
var
  i: Integer;
  f: Boolean;
  li: TListItem;

begin
  Result := nil;

  f := False;
  i := 0;
  while not f and (i < lvPlatforms.Items.Count) do
  begin
    li := lvPlatforms.Items.Item[i];

    // f := False;
    // f := SameText(li.Caption, arg);
    f := SameText(li.SubItems[0], arg);

    Inc(i);
  end;

  if f then
    Result := li;
end;

procedure TfPlatformStatus.RefreshPlatformWeapons(PfList: TPlatform_Instance);
var
  i: Integer;
  mis: TMissile_Definition;
  torp: TTorpedo_Definition;
begin

  tvWeapons.Items.Clear;

  // missiles
  if (PfList.Vehicle.Missiles <> nil) and (PfList.Vehicle.Missiles.Count > 0)
    then
  begin
    for i := 0 to PfList.Vehicle.Missiles.Count - 1 do
    begin
      mis := PfList.Vehicle.Missiles[i];
      tvWeapons.Items.Add(nil, mis.FData.Class_Identifier);
    end;
  end;

  // torpedoes
  if (PfList.Vehicle.Torpedos <> nil) and (PfList.Vehicle.Torpedos.Count <> 0)
    then
  begin
    for i := 0 to PfList.Vehicle.Torpedos.Count - 1 do
    begin
      torp := PfList.Vehicle.Torpedos[i];
      tvWeapons.Items.Add(nil, torp.FData.Class_Identifier);
    end;
  end;

  // Mines
  if (PfList.Vehicle.Mines <> nil) and (PfList.Vehicle.Mines.Count <> 0) then
  begin
    for i := 0 to PfList.Vehicle.Mines.Count - 1 do
    begin
      tvWeapons.Items.Add(nil,
        TMine_Definition(PfList.Vehicle.Mines[i]).FData.Mine_Identifier);
    end;
  end;
  {
    if (PfList.Vehicle.Hybrids <> nil) then
    for I := 0 to PfList.Vehicle.Hybrids.Count - 1 do
    begin
    tvWeapons.Items.Add(nil, IntToStr(THybrid_Definition(PfList.Vehicle.Hybrids[I]).FData.Hybrid_Index));
    end;
    }

  // Bombs
  if (PfList.Vehicle.Bombs <> nil) and (PfList.Vehicle.Bombs.Count <> 0) then
  begin
    for i := 0 to PfList.Vehicle.Bombs.Count - 1 do
    begin
      tvWeapons.Items.Add(nil,
        TBomb_Definition(PfList.Vehicle.Bombs[i]).FData.Bomb_Identifier);
    end;
  end;

  // GUns
  if (PfList.Vehicle.Guns <> nil) and (PfList.Vehicle.Guns.Count <> 0) then
  begin
    for i := 0 to PfList.Vehicle.Guns.Count - 1 do
    begin
      tvWeapons.Items.Add(nil,
        TGun_Definition(PfList.Vehicle.Guns[i]).FData.Gun_Identifier);
    end;
  end;

end;

procedure TfPlatformStatus.RefreshPlatformCountermeasures
  (PfList: TPlatform_Instance);
var
  i: Integer;
  ac_decoy: TAcoustic_Decoy_On_Board;
  bubble: TAir_Bubble_Mount;
  chaff: TChaff_On_Board;
  chaff_launch: TChaff_Launcher_On_Board;
  def_jam: TDefensive_Jammer_On_Board;
  float_decoy: TFloating_Decoy_On_Board;
  infra_decoy: TInfrared_Decoy_On_Board;
  jammer: TJammer_On_Board;
  point: TPoint_Effect_On_Board;
  towed_jam: TTowed_Jammer_Decoy_On_Board;

begin

  tvCountermeasures.Items.Clear;

  // accoustic decoy
  if (PfList.Vehicle.Acoustic_Decoys <> nil) and
    (PfList.Vehicle.Acoustic_Decoys.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Accoustic Decoy');
    for i := 0 to PfList.Vehicle.Acoustic_Decoys.Count - 1 do
    begin
      ac_decoy := PfList.Vehicle.Acoustic_Decoys[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Accoustic Decoy'),
        ac_decoy.FData.Instance_Identifier + ' - ' + IntToStr
          (ac_decoy.FData.Quantity));
    end;
  end;

  // air bubble
  if (PfList.Vehicle.Air_Bubble_Mount <> nil) and
    (PfList.Vehicle.Air_Bubble_Mount.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Air Bubble Mount');
    for i := 0 to PfList.Vehicle.Air_Bubble_Mount.Count - 1 do
    begin
      bubble := PfList.Vehicle.Air_Bubble_Mount[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.FieldAddress
          ('Air Bubble Mount'),
        bubble.FData.Instance_Identifier + ' - ' + IntToStr
          (bubble.FData.Bubble_Qty_On_Board));
    end;
  end;

  // chaff
  if (PfList.Vehicle.Chaffs <> nil) and (PfList.Vehicle.Chaffs.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Chaff');
    for i := 0 to PfList.Vehicle.Chaffs.Count - 1 do
    begin
      chaff := PfList.Vehicle.Chaffs[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Chaff'), chaff.FData.Instance_Identifier + ' - ' + IntToStr
          (chaff.FData.Chaff_Qty_On_Board));
    end;
  end;

  // chaff launcher
  if (PfList.Vehicle.Chaff_Launchers <> nil) and
    (PfList.Vehicle.Chaff_Launchers.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Chaff Launcher');
    for i := 0 to PfList.Vehicle.Chaff_Launchers.Count - 1 do
    begin
      chaff_launch := PfList.Vehicle.Chaff_Launchers[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Chaff Launcher'),
        '- ' + IntToStr(chaff_launch.FData.Launcher_Number));
    end;
  end;

  // defensive jammer
  if (PfList.Vehicle.Defensive_Jammers <> nil) and
    (PfList.Vehicle.Defensive_Jammers.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Defensive Jammer');
    for i := 0 to PfList.Vehicle.Defensive_Jammers.Count - 1 do
    begin
      def_jam := PfList.Vehicle.Defensive_Jammers[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Defensive Jammer'), def_jam.FData.Instance_Identifier + ' - 1');
    end;
  end;

  // floating decoy
  if (PfList.Vehicle.Floating_Decoys <> nil) and
    (PfList.Vehicle.Floating_Decoys.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Floating Decoy');
    for i := 0 to PfList.Vehicle.Floating_Decoys.Count - 1 do
    begin
      float_decoy := PfList.Vehicle.Floating_Decoys[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Floating Decoy'),
        float_decoy.FData.Instance_Identifier + ' - ' + IntToStr
          (float_decoy.FData.Quantity));
    end;
  end;

  // infrared decoy
  if (PfList.Vehicle.Infrared_Decoys <> nil) and
    (PfList.Vehicle.Infrared_Decoys.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Infrared_Decoy');
    for i := 0 to PfList.Vehicle.Infrared_Decoys.Count - 1 do
    begin
      infra_decoy := PfList.Vehicle.Infrared_Decoys[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Infrared_Decoy'),
        infra_decoy.FData.Instance_Identifier + ' - ' + IntToStr
          (infra_decoy.FData.Infrared_Decoy_Qty_On_Board));
    end;
  end;

  // jammer
  if (PfList.Vehicle.Jammers <> nil) and (PfList.Vehicle.Jammers.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Jammers');
    for i := 0 to PfList.Vehicle.Jammers.Count - 1 do
    begin
      jammer := PfList.Vehicle.Jammers[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Jammers'), jammer.FData.Instance_Identifier + ' - 1');
    end;
  end;

  // point effect
  if (PfList.Vehicle.Point_Effects <> nil) and
    (PfList.Vehicle.Point_Effects.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Point Effect');
    for i := 0 to PfList.Vehicle.Point_Effects.Count - 1 do
    begin
      point := PfList.Vehicle.Point_Effects[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Point Effect'), point.FData.Instance_Identifier + ' - ' + IntToStr
          (point.FData.Quantity));
    end;
  end;

  // towed jammer
  if (PfList.Vehicle.Towed_Jammer_Decoys <> nil) and
    (PfList.Vehicle.Towed_Jammer_Decoys.Count > 0) then
  begin
    tvCountermeasures.Items.Add(nil, 'Towed Jammer Decoy');
    for i := 0 to PfList.Vehicle.Towed_Jammer_Decoys.Count - 1 do
    begin
      towed_jam := PfList.Vehicle.Towed_Jammer_Decoys[i];
      tvCountermeasures.Items.AddChild(tvCountermeasures.Items.FieldAddress
          ('Towed Jammer Decoy'),
        towed_jam.FData.Instance_Identifier + ' - ' + IntToStr
          (towed_jam.FData.Quantity));
    end;
  end;
end;

procedure TfPlatformStatus.RefreshEmbarkedPlatform(PfList: TPlatform_Instance);
var
  i: Integer;
  embarked_plat: THosted_Platform;

begin

  tvEmbarkedPlatforms.Items.Clear;

  // embarked platform
  if (PfList.Vehicle.Hosted_Platform <> nil) then
    for i := 0 to PfList.Vehicle.Hosted_Platform.Count - 1 do
    begin
      embarked_plat := PfList.Vehicle.Hosted_Platform[i];
      tvEmbarkedPlatforms.Items.Add(nil,
        embarked_plat.FVehicle.Vehicle_Identifier);
    end;
end;

end.
