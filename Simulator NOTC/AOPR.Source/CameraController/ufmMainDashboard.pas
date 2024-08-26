unit ufmMainDashboard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, ImgList, StdCtrls, VrControls, VrWheel,
  uGameData_TTT, uLibSettingTTT;

type
  TTrackBar = class(ComCtrls.TTrackBar)
  private
    FSelectValueSymbol : Boolean;
  protected
    property OnMouseDown;
    property OnMouseUp;
  end;

  TfmMainDashboard = class(TForm)
    btnSwitchView: TSpeedButton;
    btnCamFree: TSpeedButton;
    btnCamAttach: TSpeedButton;
    btnCamLookAt: TSpeedButton;
    pgcViewTarget: TPageControl;
    tsPlatform: TTabSheet;
    lstPlatform: TListBox;
    tsPosition: TTabSheet;
    lblLatitude: TLabel;
    edtLatitude: TEdit;
    lblLongitude: TLabel;
    edtLongitude: TEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    btnTrackPos: TSpeedButton;
    lblTerrain: TLabel;
    cbbTerrain: TComboBox;
    grpPositionFromPlatform: TGroupBox;
    lblPositionAzimuth: TLabel;
    vrwhlPositionAzimuth: TVrWheel;
    edtPositionAzimuth: TEdit;
    bvlPosition: TBevel;
    lblPositionRange: TLabel;
    trckbrPositionRange: TTrackBar;
    lblMinPositionRange: TLabel;
    lblMaxPositionRange: TLabel;
    edtPositionRange: TEdit;
    lblPositionElevation: TLabel;
    trckbrPositionElevation: TTrackBar;
    lblMinPositionElevation: TLabel;
    lblMaxPositionElevation: TLabel;
    edtPositionElevation: TEdit;
    pnlConnection: TPanel;
    btnNormalVision: TSpeedButton;
    btnNightVision: TSpeedButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure btnSwitchViewClick(Sender: TObject);
    procedure CameraModeClick(Sender: TObject);
    procedure lstPlatformClick(Sender: TObject);
    procedure btnTrackPosClick(Sender: TObject);
    procedure cbbTerrainChange(Sender: TObject);
    procedure vrwhlPositionAzimuthChange(Sender: TObject);
    procedure vrwhlPositionAzimuthMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtPositionAzimuthExit(Sender: TObject);
    procedure edtPositionAzimuthKeyPress(Sender: TObject; var Key: Char);
    procedure trckbrPositionRangeChange(Sender: TObject);
    procedure TBPositionRangeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TBPositionRangeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure trckbrPositionRangeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPositionRangeExit(Sender: TObject);
    procedure edtPositionRangeKeyPress(Sender: TObject; var Key: Char);
    procedure trckbrPositionElevationChange(Sender: TObject);
    procedure TBPositionElevationMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TBPositionElevationMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure trckbrPositionElevationKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPositionElevationExit(Sender: TObject);
    procedure edtPositionElevationKeyPress(Sender: TObject; var Key: Char);
    procedure VisionModeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSelectedCameraMode : Integer;

    procedure SwitchView(const aState: Byte);
    procedure CameraMode(const aState: Byte);
  public
    procedure Initialize;
    procedure UpdatePlatformList;
    procedure UpdateCameraLongLat;

  end;

var
  fmMainDashboard: TfmMainDashboard;

implementation

uses
  uCameraControllerManager, uPlatformData, uCameraData;

{$R *.dfm}

procedure TfmMainDashboard.btnSwitchViewClick(Sender: TObject);
begin
  case TSpeedButton(Sender).Tag of
    0: TSpeedButton(Sender).Tag := 1;
    1: TSpeedButton(Sender).Tag := 0;
  end;

  SwitchView(btnSwitchView.Tag);
end;

procedure TfmMainDashboard.btnTrackPosClick(Sender: TObject);
var
  rec : TRec_CameraController;
begin
  rec.cmd := CORD_ID_CAMCON_TRACK_POS;
  CameraControllerManager.netSend_CameraController(rec);
end;

procedure TfmMainDashboard.CameraMode(const aState: Byte);
begin
  case aState of
    1, 3:
    begin
      grpPositionFromPlatform.Visible := False;
      btnNormalVision.Top := 410;
      btnNightVision.Top := 410;
      pnlConnection.Top := 438;
      Height := 464;
    end;
    2:
    begin
      grpPositionFromPlatform.Visible := True;
      btnNormalVision.Top := 616;
      btnNightVision.Top := 616;
      pnlConnection.Top := 644;
      Height := 670;
    end;
  end;
end;

procedure TfmMainDashboard.CameraModeClick(Sender: TObject);
var
  rec : TRec_CameraController;
begin
  vrwhlPositionAzimuth.Enabled := TSpeedButton(Sender).Tag = 2;
  edtPositionAzimuth.Enabled := TSpeedButton(Sender).Tag = 2;
  trckbrPositionRange.Enabled := TSpeedButton(Sender).Tag = 2;
  edtPositionRange.Enabled := TSpeedButton(Sender).Tag = 2;
  trckbrPositionElevation.Enabled := TSpeedButton(Sender).Tag = 2;
  edtPositionElevation.Enabled := TSpeedButton(Sender).Tag = 2;
  tsPosition.Enabled := TSpeedButton(Sender).Tag = 1;

  CameraMode(TSpeedButton(Sender).Tag);

  rec.cmd := CORD_ID_CAMCON_MODE;
  rec.valueInt := TSpeedButton(Sender).Tag;

  CameraControllerManager.netSend_CameraController(rec);
end;

procedure TfmMainDashboard.cbbTerrainChange(Sender: TObject);
var
  rec : TRec_SwitchTerrain;
begin
  rec.TerrainID := cbbTerrain.ItemIndex;
  CameraControllerManager.netSend_SwitchTerrain(rec);
end;

procedure TfmMainDashboard.edtPositionElevationExit(Sender: TObject);
var
  elevation : Integer;
  rec : TRec_CameraController;
begin
  elevation := StrToInt(edtPositionElevation.Text);

  if elevation < trckbrPositionElevation.Min then
    elevation := trckbrPositionElevation.Min
  else if elevation > trckbrPositionElevation.Max then
    elevation := trckbrPositionElevation.Max;

  trckbrPositionElevation.Position := elevation;

  rec.cmd := CORD_ID_CAMCON_POS_ELEVATION;
  rec.valueInt := elevation;

  CameraControllerManager.netSend_CameraController(rec);
end;

procedure TfmMainDashboard.edtPositionElevationKeyPress(Sender: TObject; var Key: Char);
var
  elevation : Integer;
  rec : TRec_CameraController;
begin
  if not (Key in[#48 .. #57, #8, #13, #45]) then
    Key := #0;

  if Key = #13 then
  begin
    elevation := StrToInt(edtPositionElevation.Text);

    if elevation < trckbrPositionElevation.Min then
      elevation := trckbrPositionElevation.Min
    else if elevation > trckbrPositionElevation.Max then
      elevation := trckbrPositionElevation.Max;

    trckbrPositionElevation.Position := elevation;

    rec.cmd := CORD_ID_CAMCON_POS_ELEVATION;
    rec.valueInt := elevation;

    CameraControllerManager.netSend_CameraController(rec);
  end;
end;

procedure TfmMainDashboard.edtPositionAzimuthExit(Sender: TObject);
var
  azimuth : Integer;
  rec : TRec_CameraController;
begin
  azimuth := StrToInt(edtPositionAzimuth.Text);

  if azimuth >= 360 then
    azimuth := 0;

  if azimuth < 180 then
    vrwhlPositionAzimuth.Position := azimuth + 180
  else
    vrwhlPositionAzimuth.Position := azimuth - 180;

  rec.cmd := CORD_ID_CAMCON_POS_AZIMUTH;
  rec.valueInt := azimuth;

  CameraControllerManager.netSend_CameraController(rec);
end;

procedure TfmMainDashboard.edtPositionAzimuthKeyPress(Sender: TObject;
  var Key: Char);
var
  azimuth : Integer;
  rec : TRec_CameraController;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    azimuth := StrToInt(edtPositionAzimuth.Text);

    if azimuth >= 360 then
      azimuth := 0;

    if azimuth < 180 then
      vrwhlPositionAzimuth.Position := azimuth + 180
    else
      vrwhlPositionAzimuth.Position := azimuth - 180;

    rec.cmd := CORD_ID_CAMCON_POS_AZIMUTH;
    rec.valueInt := azimuth;

    CameraControllerManager.netSend_CameraController(rec);
  end;
end;

procedure TfmMainDashboard.edtPositionRangeExit(Sender: TObject);
var
  range : Integer;
  rec : TRec_CameraController;
begin
  range := StrToInt(edtPositionRange.Text);

  if range < trckbrPositionRange.Min then
    range := trckbrPositionRange.Min
  else if range > trckbrPositionRange.Max then
    range := trckbrPositionRange.Max;

  trckbrPositionRange.Position := range;

  rec.cmd := CORD_ID_CAMCON_POS_RANGE;
  rec.valueInt := range;

  CameraControllerManager.netSend_CameraController(rec);
end;

procedure TfmMainDashboard.edtPositionRangeKeyPress(Sender: TObject;
  var Key: Char);
var
  range : Integer;
  rec : TRec_CameraController;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    range := StrToInt(edtPositionRange.Text);

    if range < trckbrPositionRange.Min then
      range := trckbrPositionRange.Min
    else if range > trckbrPositionRange.Max then
      range := trckbrPositionRange.Max;

    trckbrPositionRange.Position := range;

    rec.cmd := CORD_ID_CAMCON_POS_RANGE;
    rec.valueInt := range;

    CameraControllerManager.netSend_CameraController(rec);
  end;
end;

procedure TfmMainDashboard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShowMessage('BOOOM!!');
end;

procedure TfmMainDashboard.FormCreate(Sender: TObject);
begin
  trckbrPositionRange.FSelectValueSymbol := False;
  trckbrPositionRange.OnMouseDown := TBPositionRangeMouseDown;
  trckbrPositionRange.OnMouseUp := TBPositionRangeMouseUp;

  trckbrPositionElevation.FSelectValueSymbol := False;
  trckbrPositionElevation.OnMouseDown := TBPositionElevationMouseDown;
  trckbrPositionElevation.OnMouseUp := TBPositionElevationMouseUp;
end;

procedure TfmMainDashboard.FormShow(Sender: TObject);
begin
  SwitchView(0);
  tsPlatform.Show;
end;

procedure TfmMainDashboard.Initialize;
var
  i : Integer;
begin
  if Length(vTerrainArea.Area) > 0 then
  begin
    for i := 0 to Length(vTerrainArea.Area) -1 do
    begin
      cbbTerrain.Items.Add(vTerrainArea.Area[i]);
    end;
    cbbTerrain.Text := vTerrainArea.Area[0];
    cbbTerrain.ItemIndex := 0;
  end;
end;

procedure TfmMainDashboard.lstPlatformClick(Sender: TObject);
var
  rec : TRec_CameraController;
  plat : TPlatform;
begin
  if lstPlatform.ItemIndex = -1 then
    Exit;

  rec.cmd := CORD_ID_CAMCON_SHOW_PLATFORM;
  plat := CameraControllerManager.PlatformList.Items[lstPlatform.ItemIndex];
  rec.valueInt := plat.InstanceIndex;

  CameraControllerManager.netSend_CameraController(rec);
end;

procedure TfmMainDashboard.SwitchView(const aState: Byte);
begin
  case aState of
    0:
    begin
      Tag := 1;
      Height := 56;
      Width := 79;
      Left := Screen.Monitors[0].Width - Width;
    end;
    1:
    begin
      Tag := 0;
      Width := 294;
      Left := Screen.Monitors[0].Width - Width;

      if btnCamFree.Down then
        CameraMode(btnCamFree.Tag)
      else if btnCamAttach.Down then
        CameraMode(btnCamAttach.Tag)
      else if btnCamLookAt.Down then
        CameraMode(btnCamLookAt.Tag);
    end;
  end;
end;

procedure TfmMainDashboard.TBPositionElevationMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  trckbrPositionElevation.FSelectValueSymbol := (X >= 11) and (X <= 161) and
    (Y >= 2) and (Y <= 21);
end;

procedure TfmMainDashboard.TBPositionElevationMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  rec : TRec_CameraController;
begin
  if trckbrPositionElevation.FSelectValueSymbol then
  begin
    rec.cmd := CORD_ID_CAMCON_POS_ELEVATION;
    rec.valueInt := trckbrPositionElevation.Position;

    CameraControllerManager.netSend_CameraController(rec);
  end;

  trckbrPositionElevation.FSelectValueSymbol := False;
end;

procedure TfmMainDashboard.TBPositionRangeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  trckbrPositionRange.FSelectValueSymbol := (X >= 11) and (X <= 161) and
    (Y >= 2) and (Y <= 21);
end;

procedure TfmMainDashboard.TBPositionRangeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  rec : TRec_CameraController;
begin
  if trckbrPositionRange.FSelectValueSymbol then
  begin
    rec.cmd := CORD_ID_CAMCON_POS_RANGE;
    rec.valueInt := trckbrPositionRange.Position;

    CameraControllerManager.netSend_CameraController(rec);
  end;

  trckbrPositionRange.FSelectValueSymbol := False;
end;

procedure TfmMainDashboard.trckbrPositionElevationChange(Sender: TObject);
begin
  edtPositionElevation.Text := IntToStr(trckbrPositionElevation.Position);
end;

procedure TfmMainDashboard.trckbrPositionElevationKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  rec : TRec_CameraController;
begin
  rec.cmd := CORD_ID_CAMCON_POS_ELEVATION;
  rec.valueInt := trckbrPositionElevation.Position;

  CameraControllerManager.netSend_CameraController(rec);
end;

procedure TfmMainDashboard.trckbrPositionRangeChange(Sender: TObject);
begin
  edtPositionRange.Text := IntToStr(trckbrPositionRange.Position);
end;

procedure TfmMainDashboard.trckbrPositionRangeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  rec : TRec_CameraController;
begin
  rec.cmd := CORD_ID_CAMCON_POS_RANGE;
  rec.valueInt := trckbrPositionRange.Position;

  CameraControllerManager.netSend_CameraController(rec);
end;

procedure TfmMainDashboard.UpdateCameraLongLat;
begin
  edtLatitude.Text := FormatDMS_Latt(CameraControllerManager.Latitude);
  edtLongitude.Text := FormatDMS_Long(CameraControllerManager.Longitude);
end;

procedure TfmMainDashboard.UpdatePlatformList;
var
  i : Integer;
  plat : TPlatform;
begin
  lstPlatform.Items.Clear;

  for i := 0 to CameraControllerManager.PlatformList.Count - 1 do
  begin
    plat := CameraControllerManager.PlatformList.Items[i];
    lstPlatform.Items.Add(plat.InstanceName);
  end;
end;

procedure TfmMainDashboard.VisionModeClick(Sender: TObject);
var
  rec : TRec_CameraController;
begin
  rec.cmd := CORD_ID_CAMCON_VISION;
  rec.valueInt := TSpeedButton(Sender).Tag;

  CameraControllerManager.netSend_CameraController(rec);
end;

procedure TfmMainDashboard.vrwhlPositionAzimuthChange(Sender: TObject);
var
  azimuth : Integer;
begin
  if vrwhlPositionAzimuth.Position < 180 then
    azimuth := (180 + vrwhlPositionAzimuth.Position)
  else
    azimuth := (vrwhlPositionAzimuth.Position - 180);

  edtPositionAzimuth.Text := IntToStr(azimuth);
end;

procedure TfmMainDashboard.vrwhlPositionAzimuthMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  rec : TRec_CameraController;
begin
  rec.cmd := CORD_ID_CAMCON_POS_AZIMUTH;
  rec.valueInt := StrToInt(edtPositionAzimuth.Text);

  CameraControllerManager.netSend_CameraController(rec);
end;

end.
