unit ufrmTop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzBmpBtn, StdCtrls, ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmTop = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    cbSetScale: TComboBox;
    cbAssumeControl: TComboBox;
    btnHook: TRzBmpButton;
    btMapTools: TRzBmpButton;
    Button1: TButton;
    btnPlatform: TRzBmpButton;
    btnPfOptions: TRzBmpButton;
    btnOptions: TRzBmpButton;
    Button2: TButton;
    btnHelp: TRzBmpButton;
    Label3: TLabel;
    Label4: TLabel;
    btnViewDisplay: TRzBmpButton;
    btnFullScreen: TRzBmpButton;
    btnDecreaseScale: TRzBmpButton;
    btnIncreaseScale: TRzBmpButton;
    procedure btnHookClick(Sender: TObject);
    procedure cbAssumeControlChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbSetScaleChange(Sender: TObject);
    procedure btnLogistikClick(Sender: TObject);
    procedure btnToteDisplayClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btMapToolsClick(Sender: TObject);
    procedure btnPlatformClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnPfOptionsClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnHelpClick(Sender: TObject);
    procedure btnViewDisplayClick(Sender: TObject);
    procedure btnFullScreenClick(Sender: TObject);
    procedure hideTopPanel(Sender: TObject);
    procedure btnDecreaseScaleClick(Sender: TObject);
    procedure btnIncreaseScaleClick(Sender: TObject);
  private
    { Private declarations }
    AModeMonitor : integer;
    isTopPanelHidden: Boolean;
    procedure FlipMonitor;
  public
    { Public declarations }
  end;

var
  frmTop: TfrmTop;

implementation

uses ufTacticalDisplay,
  uT3Unit, uT3Vehicle,
  uSimObjects, uT3DetectedTrack,
  uSimMgr_Client, uMapXHandler,
  MapXLib_TLB, tttData,
  Math, ufrmRight, uRotateMonitor, ufrmMapTools, ufrmViewWasdal,
  ufrmTools, ufrmGeneraPfTools, ufrmPlatformTools, ufrmHelp;

{$R *.dfm}


const
  CMin_Z = 0;
  CMax_Z = 14;
//  C_CLEAR = 0;  //untuk action multiselect
//  C_ADD = 1;  //untuk action multiselect
//  C_MOVE = 2;  //untuk action multiselect


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

procedure TfrmTop.btMapToolsClick(Sender: TObject);
begin
  frmRight.ShowMapTools;
end;

procedure TfrmTop.btnDecreaseScaleClick(Sender: TObject);
var
  i: Integer; // zoom out
  z, zNow: double;
begin
  zNow := FixMapZoom(0.5 * VSimMap.FMap.Zoom);
  i := FindClosestZoomIndex(zNow);
  z := ZoomIndexToScale(i);

  if z <= zNow then
    i := i + 1;
  if i < 0 then
    i := 0;
  if i > CMax_Z then
    i := CMax_Z;

  // do the zoom out
  cbSetScale.ItemIndex := i;
  cbSetScaleChange(cbSetScale);
end;

procedure TfrmTop.btnFullScreenClick(Sender: TObject);
begin
  frmTacticalDisplay.hideBottomPanel(sender);
end;

procedure TfrmTop.btnHelpClick(Sender: TObject);
begin
  frmRight.ShowHelp;
end;

procedure TfrmTop.btnHookClick(Sender: TObject);
begin
  frmTacticalDisplay.btnAssumeControlOfHookClick(nil);
end;

procedure TfrmTop.btnIncreaseScaleClick(Sender: TObject);
var
  i: Integer;
  z, zNow: double;
begin
  zNow := FixMapZoom(0.5 * VSimMap.FMap.Zoom);
  i := FindClosestZoomIndex(zNow);
  z := ZoomIndexToScale(i);

  if z >= zNow then
    i := i - 1;
  if i < 0 then
    i := 0;
  if i > CMax_Z then
    i := CMax_Z;

  // do the zoom in
  cbSetScale.ItemIndex := i;
  cbSetScaleChange(cbSetScale);
end;

procedure TfrmTop.btnLogistikClick(Sender: TObject);
begin
  frmTacticalDisplay.btnLogisticClick(nil);
end;

procedure TfrmTop.btnOptionsClick(Sender: TObject);
begin
  frmRight.ShowTools;
end ;

procedure TfrmTop.btnPfOptionsClick(Sender: TObject);
begin
  frmRight.ShowPlatformInfo;
end;

procedure TfrmTop.btnPlatformClick(Sender: TObject);
begin
  frmRight.ShowPlatformTools;
end;

procedure TfrmTop.btnViewDisplayClick(Sender: TObject);
begin
  frmRight.ShowViewWasdal;
end;

procedure TfrmTop.btnToteDisplayClick(Sender: TObject);
begin
  frmTacticalDisplay.btnToolBtnSlideClick(nil);
end;

procedure TfrmTop.Button1Click(Sender: TObject);
begin
  frmTacticalDisplay.btnStartGameClick(Sender)
end;

procedure TfrmTop.Button2Click(Sender: TObject);
begin
  frmTacticalDisplay.btnFullScreenClick(sender);
end;

procedure TfrmTop.cbAssumeControlChange(Sender: TObject);
var
  aObject: TSimObject;
begin
  aObject := TSimObject(cbAssumeControl.Items.Objects[cbAssumeControl.ItemIndex]);

  with frmTacticalDisplay do
  begin
    if aObject <> nil then
    begin
      if aObject is TT3Unit then
        TT3Unit(aObject).Selected := true
      else if aObject is TT3DetectedTrack then
        TT3DetectedTrack(aObject).Selected := true;

      Map1.Repaint;
    end;

    //DisplayTabHooked(cbAssumeControl.Items.Objects[cbAssumeControl.ItemIndex]);
  end;
end;

procedure TfrmTop.cbSetScaleChange(Sender: TObject);
var
  z: double;
  s: string;
  i: Integer;
  rrVis: Boolean;
begin
  if cbSetScale.ItemIndex < 0 then
    exit;

  s := cbSetScale.Items[cbSetScale.ItemIndex];
  try
    z := StrToFloat(s);
    VSimMap.SetMapZoom(z * 2);
    frmTacticalDisplay.lblRangeScale.Caption := cbSetScale.Text;

    // Set Range Ring
    rrVis := frmMapTools.btnFilterRings.down;
    if rrVis then
    begin
      z := FixMapZoom(VSimMap.FMap.Zoom);
      i := FindClosestZoomIndex(z);
      z := ZoomIndexToScale(i);
      simMgrClient.RangeRing.Interval := 0.125 * z;
    end;

  finally

  end;
end;

procedure TfrmTop.FlipMonitor;
begin
  if AModeMonitor = 3 then
    AModeMonitor := 1
  else
    AModeMonitor := 3;

  frmRotateMonitor.BtnSelectMode(AModeMonitor);
end;

procedure TfrmTop.FormCreate(Sender: TObject);
var
  i : integer;
  z : Double;
begin
  cbSetScale.Items.Clear;
//  AModeMonitor := 1;
  btnPlatform.Color := clRed;

  for i := CMin_Z to CMax_Z do
  begin
    z := ZoomIndexToScale(i);
    cbSetScale.Items.Add(FloatToStr(z));
  end;

  isTopPanelHidden := false;
end;

procedure TfrmTop.hideTopPanel(Sender: TObject);
begin
  if not isTopPanelHidden then
  begin
//    frmTop.Height := 0;
//    isTopPanelHidden := false;
    frmTop.Visible := false;
    isTopPanelHidden := true;

    frmMapTools.btnWindowedScreen.BringToFront;
    frmTools.btnWindowedScreen.BringToFront;
    frmGeneralPfTools.btnWindowedScreen.BringToFront;
    frmPlatformTools.btnWindowedScreen.BringToFront;
    frmViewWasdal.btnWindowedScreen.BringToFront;
    frmHelp.btnWindowedScreen.BringToFront;
  end
  else
  begin
//    frmTop.Height := 97;
//    isTopPanelHidden := true;
    frmTop.Visible := true;
    isTopPanelHidden := false;

    frmMapTools.btnFullScreen.BringToFront;
    frmTools.btnFullScreen.BringToFront;
    frmGeneralPfTools.btnFullScreen.BringToFront;
    frmPlatformTools.btnFullScreen.BringToFront;
    frmViewWasdal.btnFullScreen.BringToFront;
    frmHelp.btnFullScreen.BringToFront;
  end

end;

procedure TfrmTop.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    mbLeft:
    begin
      if (ssShift in Shift) then
      begin
        Button2.Visible := not Button2.Visible;
        btnFullScreen.Visible := not btnFullScreen.Visible;
      end;
    end;
  end;
end;

end.
