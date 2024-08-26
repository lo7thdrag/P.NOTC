unit ufrmLeftToolsPlotter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzBmpBtn, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmLeftToolsPlotter = class(TForm)
    btnCenterHook: TRzBmpButton;
    btnCenterGame: TRzBmpButton;
    btnPan: TRzBmpButton;
    btnFilterRings: TRzBmpButton;
    btnRangRing: TRzBmpButton;
    btnTool: TRzBmpButton;
    btnOptions: TRzBmpButton;
    btnRuler: TRzBmpButton;
    btnBrowseMap: TRzBmpButton;
    imgBackground: TImage;
    pnlContent: TPanel;
    imgShow: TImage;
    procedure btnCenterHookClick(Sender: TObject);
    procedure btnCenterGameClick(Sender: TObject);
    procedure btnPanClick(Sender: TObject);
    procedure btnFilterRingsClick(Sender: TObject);
    procedure btnRangRingClick(Sender: TObject);
    procedure btnAirMapClick(Sender: TObject);
    procedure btnLandMapClick(Sender: TObject);
    procedure btnSeaMapClick(Sender: TObject);
    procedure btnToolClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnRulerClick(Sender: TObject);
    procedure btnBrowseMapClick(Sender: TObject);
    procedure btnMinimapClick(Sender: TObject);
//    procedure cbSetScaleChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgShowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLeftToolsPlotter: TfrmLeftToolsPlotter;

implementation

uses ufTacticalDisplay, uSimMgr_Client,
  uMapXHandler, MapXLib_TLB, Math, tttData, uBrowseMap, uRuler;

const
  CMin_Z = 0;
  CMax_Z = 14;
  C_CLEAR = 0;  //untuk action multiselect
  C_ADD = 1;  //untuk action multiselect
  C_MOVE = 2;  //untuk action multiselect


function ZoomIndexToScale(const i: Integer): double;
begin
  if i < -3 then
    result := 0.125
  else if i > 14 then
    result := 2500.0
  else
    result := Power(2.0, (i - 3));
end;

function FindClosestZoomIndex(const z: double): Integer;
var
  i: Integer;
begin
  if z >= 2500 then
    result := CMax_Z
  else if z <= 0.125 then
    result := CMin_Z
  else
  begin
    i := Round(Log2(z));
    result := i + 3;
  end;
end;

function FixMapZoom(z: double): double;
begin
  if z >= 1.0 then
    result := Round(z)
  else
    result := 0.001 * Round(z * 1000);
end;
{$R *.dfm}

procedure TfrmLeftToolsPlotter.btnAirMapClick(Sender: TObject);
begin
  simMgrClient.SwitchMap(1);

end;

procedure TfrmLeftToolsPlotter.btnBrowseMapClick(Sender: TObject);
begin
  frmBrowseMap.Show;
end;

procedure TfrmLeftToolsPlotter.btnCenterGameClick(Sender: TObject);
var
  long, lat: double;
begin
  long := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Long;
  lat := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Lat;
  VSimMap.SetMapCenter(long, lat);

  frmTacticalDisplay.StatusBar1.Panels[0].Text := TRzBmpButton(Sender).Hint;
  btnCenterGame.Down := False;    //mubdi - agar centergame button cukup sekali
  if btnCenterHook.Down then      // tekan seperti tombol biasa
  begin                           // mengembalikan centerhook button yang
    btnCenterHook.Down := False;  // tertahan
    frmTacticalDisplay.FHookOnPlatform := not frmTacticalDisplay.FHookOnPlatform;
  end;
end;

procedure TfrmLeftToolsPlotter.btnCenterHookClick(Sender: TObject);
begin
  with frmTacticalDisplay do
  begin
    if focusedTrack = nil then   //mk
      exit;

    FHookOnPlatform := not FHookOnPlatform;
    btnCenterHook.Down := FHookOnPlatform;

    if FHookOnPlatform then
    begin
      try
        simMgrClient.MyCenterHookedPlatfom := focusedTrack;

        VSimMap.SetMapCenter(simMgrClient.MyCenterHookedPlatfom.getPositionX,
              simMgrClient.MyCenterHookedPlatfom.getPositionY);
        FLastMapCenterY := simMgrClient.MyCenterHookedPlatfom.getPositionY;
        FLastMapCenterX := simMgrClient.MyCenterHookedPlatfom.getPositionX;
      except
        focusedTrack := nil;
        simMgrClient.MyCenterHookedPlatfom := nil;
      end;
    end
    else
    begin
      simMgrClient.MyCenterHookedPlatfom := nil;
    end;

    StatusBar1.Panels[0].Text := btnCenterHook.Hint;
  end;

end;

procedure TfrmLeftToolsPlotter.btnFilterRingsClick(Sender: TObject);
var
  i: Integer;
  rrVis: Boolean;
  z: double;
begin
  rrVis := btnFilterRings.Down;

  // toolBtnFilterRangeRings.Down := FRangeRingVisible;
  if rrVis then
  begin
    z := FixMapZoom(VSimMap.FMap.Zoom);
    i := FindClosestZoomIndex(z);
    z := ZoomIndexToScale(i);
    simMgrClient.RangeRing.Interval := 0.125 * z;
  end;

  if Assigned(frmTacticalDisplay.focusedTrack) then
    simMgrClient.MyRingHookedPlatfom := frmTacticalDisplay.focusedTrack;

  if Assigned(simMgrClient.MyRingHookedPlatfom)then
  begin
    simMgrClient.RangeRing.mX := simMgrClient.MyRingHookedPlatfom.getPositionX;
    simMgrClient.RangeRing.mY := simMgrClient.MyRingHookedPlatfom.getPositionY;
    simMgrClient.RangeRing.Visible := rrVis;
  end;

  frmTacticalDisplay.StatusBar1.Panels[0].Text := TRzBmpButton(Sender).Hint;
end;

procedure TfrmLeftToolsPlotter.btnLandMapClick(Sender: TObject);
begin
  simMgrClient.SwitchMap(2);

end;

procedure TfrmLeftToolsPlotter.btnMinimapClick(Sender: TObject);
begin
//  frmTacticalDisplay.MiniMap.Visible := btnMinimap.Down;
end;

procedure TfrmLeftToolsPlotter.btnOptionsClick(Sender: TObject);
begin
  if frmTacticalDisplay.btnOptions.Down then
      frmTacticalDisplay.btnOptions.Down := False
    else
      frmTacticalDisplay.btnOptions.Down := True;
  frmTacticalDisplay.btnOptionsClick(nil)
end;

procedure TfrmLeftToolsPlotter.btnPanClick(Sender: TObject);
begin
  if btnPan.Down then
  begin
    frmRuler.Close;
    frmTacticalDisplay.Map1.CurrentTool := miPanTool;
    frmTacticalDisplay.Map1.MousePointer := miPanCursor;
    frmTacticalDisplay.Map1.IsPan := False;   {parameter untuk map agar tidak bisa digeser}
    frmTacticalDisplay.StatusBar1.Panels[0].Text := TRzBmpButton(Sender).Hint;

    btnRuler.Down := False;

  end
  else
  begin
    frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
    frmTacticalDisplay.Map1.MousePointer := miDefaultCursor;
    frmTacticalDisplay.Map1.IsPan := True;   {parameter untuk map agar bisa digeser}
    frmTacticalDisplay.StatusBar1.Panels[0].Text := 'Select';
  end;

end;

procedure TfrmLeftToolsPlotter.btnRangRingClick(Sender: TObject);
begin
  with frmTacticalDisplay do
  begin
    FRangeRingOnHook := btnRangRing.Down;

    if FRangeRingOnHook then
      simMgrClient.MyRingHookedPlatfom := focusedTrack;

    if FRangeRingOnHook and (simMgrClient.MyRingHookedPlatfom <> nil) then
    begin
      simMgrClient.RangeRing.mx := simMgrClient.MyRingHookedPlatfom.getPositionX;
      simMgrClient.RangeRing.my := simMgrClient.MyRingHookedPlatfom.getPositionY;
    end;

    StatusBar1.Panels[0].Text := TRzBmpButton(Sender).Hint;
  end;
end;

procedure TfrmLeftToolsPlotter.btnRulerClick(Sender: TObject);
begin
  with frmTacticalDisplay do
  begin
    if btnRuler.Down then
    begin
//      Map1.CurrentTool := mtRuler;
      Map1.CurrentTool := mtSelectObject;
      StatusBar1.Panels[0].Text := TRzBmpButton(Sender).Hint;

      frmRuler.Show;

      {Untuk mengembalikan tomol pan ke semula}
      btnPan.Down := False;
      Map1.IsPan := True;
//      simMgrClient.LineVisual.Visible := True;
//      simMgrClient.LineVisual.ShowRangeBearing := True;
    end
    else
    begin
      Map1.CurrentTool := mtSelectObject;
      StatusBar1.Panels[0].Text := 'Select';

//      simMgrClient.LineVisual.Visible := False;
    end;
    btnRuler.Down := False;
  end;

end;

procedure TfrmLeftToolsPlotter.btnSeaMapClick(Sender: TObject);
begin
  simMgrClient.SwitchMap(3);
end;

procedure TfrmLeftToolsPlotter.btnToolClick(Sender: TObject);
var
  vHelpFile, vHelpID : OleVariant;
begin
  VSimMap.FMap.Layers.LayersDlg(vHelpFile, vHelpID);
end;

//procedure TfrmLeftToolsPlotter.cbSetScaleChange(Sender: TObject);
//var
//  z: double;
//  s: string;
//  i: Integer;
//  rrVis: Boolean;
//begin
//  if cbSetScale.ItemIndex < 0 then
//    exit;
//
//  s := cbSetScale.Items[cbSetScale.ItemIndex];
//  try
//    z := StrToFloat(s);
//    VSimMap.SetMapZoom(z * 2);
//    frmTacticalDisplay.lblRangeScale.Caption := cbSetScale.Text;
//    lbRangeRings.Caption := '1 : ' + FloatToStr(z/4);
//
//    // Set Range Ring
//    rrVis := frmLeftToolsPlotter.btnFilterRings.down;
//    if rrVis then
//    begin
//      z := FixMapZoom(VSimMap.FMap.Zoom);
//      i := FindClosestZoomIndex(z);
//      z := ZoomIndexToScale(i);
//      simMgrClient.RangeRing.Interval := 0.125 * z;
//    end;
//  finally
//
//  end;
//end;

procedure TfrmLeftToolsPlotter.FormCreate(Sender: TObject);
var
  i : integer;
  z : Double;
begin
//  cbSetScale.Items.Clear;
//
//  for i := CMin_Z to CMax_Z do
//  begin
//    z := ZoomIndexToScale(i);
//    cbSetScale.Items.Add(FloatToStr(z));
//  end;
end;

procedure TfrmLeftToolsPlotter.imgShowClick(Sender: TObject);
begin
  if pnlContent.Visible then pnlContent.Visible := False
  else pnlContent.Visible := True;
  BringToFront;
//  pnlContent.Height := 10;
end;

end.
