unit ufrmPlatformTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzBmpBtn;

type
  TfrmPlatformTools = class(TForm)
    btnAddPf: TRzBmpButton;
    btnRemovePf: TRzBmpButton;
    btnTrackHistory: TRzBmpButton;
    btnMultiModes: TRzBmpButton;
    btnTacticInfo: TRzBmpButton;
    btnPfView: TRzBmpButton;
    btnDinamic: TRzBmpButton;
    btnStatic: TRzBmpButton;
    btnFullScreen: TRzBmpButton;
    btnWindowedScreen: TRzBmpButton;
    procedure btnAddPfClick(Sender: TObject);
    procedure btnRemovePfClick(Sender: TObject);
    procedure btnTrackHistoryClick(Sender: TObject);
    procedure btnMultiModesClick(Sender: TObject);
    procedure btnTacticInfoClick(Sender: TObject);
    procedure btnPfViewClick(Sender: TObject);
    procedure btnWindowedScreenClick(Sender: TObject);
    procedure btnFullScreenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlatformTools: TfrmPlatformTools;

implementation

uses ufTacticalDisplay, uT3Vehicle, uT3DetectedTrack,
  uT3Unit, tttData, ufrmGuidance, uSimMgr_Client, uGameData_TTT, ufrmTop;

{$R *.dfm}

procedure TfrmPlatformTools.btnAddPfClick(Sender: TObject);
begin
  frmTacticalDisplay.btnAddPlatformClick(nil);
end;

procedure TfrmPlatformTools.btnFullScreenClick(Sender: TObject);
begin
  frmTacticalDisplay.hideBottomPanel(sender);
  frmTop.hideTopPanel(sender);
end;

procedure TfrmPlatformTools.btnWindowedScreenClick(Sender: TObject);
begin
  frmTacticalDisplay.hideBottomPanel(sender);
  frmTop.hideTopPanel(sender);
end;

procedure TfrmPlatformTools.btnMultiModesClick(Sender: TObject);
var
  pi : TT3PlatformInstance;
  i : Integer;
  rec : TRecCmdMultiMode;
begin
  with frmTacticalDisplay do
  begin
    if btnMultiModes.Down then
    begin
      isMultiMode := True;
      Map1.CurrentTool := mtMultiMode;
      Map1.OnPlatformSelected := True;
    end
    else
    begin
      isMultiMode := False;
      Map1.CurrentTool := mtSelectObject;
      UnSelectAllPlatformTrack;
      fmPlatformGuidance1.clearPlatformMultiSelectList;

      if Assigned(frmguidance) then
        frmguidance.fmPlatformGuidance1.clearPlatformMultiSelectList;

//      rec.GroupID := 0;
//      rec.CubicleGroup := 0;
//      rec.aAction := C_CLEAR;
//      simMgrClient.netSend_CmdMultiMode(rec);

      for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do begin
        pi := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;
        if pi.Controlled then
         pi.Selected := True;
      end;

      Map1.OnPlatformSelected := False;
    end;
  end;
end;

procedure TfrmPlatformTools.btnPfViewClick(Sender: TObject);
begin
  case TRzBmpButton(sender).Tag of
    0:
    begin
      btnDinamic.Down := True;
      btnStatic.Down := False;
      btnPfView.Down  := False;

      simMgrClient.TacticalDinamicSymbol := btnDinamic.Down;
      simMgrClient.TacticalStaticSymbol := btnStatic.Down;
      simMgrClient.PlatformViewMode := btnPfView.Down;

      if simMgrClient.isFirstDraw then
      begin
        simMgrClient.ControlledPlatform.Selected := True;
        simMgrClient.isFirstDraw := false;
      end;
    end;
    1:
    begin
      btnDinamic.Down := False;
      btnStatic.Down := True;
      btnPfView.Down  := False;

      simMgrClient.TacticalDinamicSymbol := btnDinamic.Down;
      simMgrClient.TacticalStaticSymbol := btnStatic.Down;
      simMgrClient.PlatformViewMode := btnPfView.Down;
    end;
    2:
    begin
      btnDinamic.Down := False;
      btnStatic.Down := False;
      btnPfView.Down  := True;

      simMgrClient.TacticalDinamicSymbol := btnDinamic.Down;
      simMgrClient.TacticalStaticSymbol := btnStatic.Down;
      simMgrClient.PlatformViewMode := btnPfView.Down;
    end;
  end;
end;

procedure TfrmPlatformTools.btnRemovePfClick(Sender: TObject);
begin
  frmTacticalDisplay.btnRemovePlatformOrTrackClick(nil);
end;

procedure TfrmPlatformTools.btnTacticInfoClick(Sender: TObject);
begin
  frmTacticalDisplay.acticalInfoSet1Click(nil);
end;

procedure TfrmPlatformTools.btnTrackHistoryClick(Sender: TObject);
begin
  with frmTacticalDisplay do
    if focusedTrack <> nil then
    begin
      if focusedTrack is TT3Vehicle then
      begin
        TT3Vehicle(focusedTrack).ShowTrails := not TT3Vehicle(focusedTrack)
          .ShowTrails;
        btnTrackHistory.Down := TT3Vehicle(focusedTrack).ShowTrails;
      end
      else if focusedTrack is TT3DetectedTrack then
      begin
        TT3DetectedTrack(focusedTrack).ShowTrails := not TT3DetectedTrack
          (focusedTrack).ShowTrails;

        btnTrackHistory.Down := TT3DetectedTrack(focusedTrack).ShowTrails;

      end;
    end;
end;

end.
