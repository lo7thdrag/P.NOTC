unit ufrmGeneraPfTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzBmpBtn, uBaseCoordSystem;

type
  TfrmGeneralPfTools = class(TForm)
    btnDetails: TRzBmpButton;
    btnInfo: TRzBmpButton;
    btnGuidance: TRzBmpButton;
    btnRadar: TRzBmpButton;
    btnWeapon: TRzBmpButton;
    btnCounterMeasure: TRzBmpButton;
    btnEMCON: TRzBmpButton;
    btnOther: TRzBmpButton;
    btnTransferLog: TRzBmpButton;
    btnFCR: TRzBmpButton;
    btnFullScreen: TRzBmpButton;
    btnWindowedScreen: TRzBmpButton;
    ScrollBox1: TScrollBox;
    procedure btnDetailsClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnGuidanceClick(Sender: TObject);
    procedure btnRadarClick(Sender: TObject);
    procedure btnWeaponClick(Sender: TObject);
    procedure btnCounterMeasureClick(Sender: TObject);
    procedure btnFCRClick(Sender: TObject);
    procedure btnEMCONClick(Sender: TObject);
    procedure btnOtherClick(Sender: TObject);
    procedure btnTransferLogClick(Sender: TObject);
    procedure btnWindowedScreenClick(Sender: TObject);
    procedure btnFullScreenClick(Sender: TObject);
  private
    FShowVehicleToolButton: Boolean;
    procedure SetShowVehicleToolButton(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property ShowVehicleToolButton : Boolean read FShowVehicleToolButton write SetShowVehicleToolButton;

  end;

var
  frmGeneralPfTools: TfrmGeneralPfTools;

implementation

uses ufrmTrackDetails, ufTacticalDisplay,
  uT3Unit,uT3Vehicle, ufrmPlatformInfo, ufrmGuidance, ufrmRadar, ufrmWeapon,
  ufrmC, ufrmFireControl, ufrmEMCON, ufrmLogistic, uLogisticChange, uSimMgr_Client,
  uT3GroupVehicle, ComCtrls, ufrmTop;

{$R *.dfm}

{ TfrmPfOpt }

procedure TfrmGeneralPfTools.btnCounterMeasureClick(Sender: TObject);
begin
  if TRzBmpButton(Sender).Down then
  begin
    if not Assigned(frmCM) then
    begin
      frmCM := TfrmCM.Create(nil);
      frmCM.fmCounterMeasure1.InitCreate(Self);
    end;

    if Assigned(simMgrClient.ControlledPlatform) then
    begin
      if simMgrClient.ControlledPlatform is TT3PlatformInstance then begin
        frmCM.fmCounterMeasure1.SetControlledObject(simMgrClient.ControlledPlatform);
        frmCM.Caption := 'Countermeasure ' + simMgrClient.ControlledPlatform.InstanceName;
        frmCM.Show;
      end;
    end;
  end
  else
  begin
    if Assigned(frmCM) then
      frmCM.Close;
  end;
end;

procedure TfrmGeneralPfTools.btnDetailsClick(Sender: TObject);
begin
  if btnDetails.Down then
  begin
    if not Assigned(frmTrackInfo) then
      frmTrackInfo := TfrmTrackInfo.Create(nil);

    frmTrackInfo.InitTabHookedInfo;

    if Assigned(frmTacticalDisplay.focusedTrack) then
    begin
      frmTrackInfo.DisplayTab(frmTacticalDisplay.focusedTrack);
      frmTrackInfo.Show;
    end;

  end
  else
  begin
    if Assigned(frmTrackInfo) then
      frmTrackInfo.Close;
  end;

end;

procedure TfrmGeneralPfTools.btnEMCONClick(Sender: TObject);
begin
  if TRzBmpButton(Sender).Down then
  begin
    if not Assigned(frmEMCON) then
    begin
      frmEMCON := TfrmEMCON.Create(nil);
      frmEMCON.fmEMCON1.InitCreate(Self);
    end;

    if Assigned(simMgrClient.ControlledPlatform) then
    begin
      if simMgrClient.ControlledPlatform is TT3PlatformInstance then begin
        frmEMCON.fmEMCON1.SetControlledObject(simMgrClient.ControlledPlatform);
        frmEMCON.Caption := 'Guidance ' + simMgrClient.ControlledPlatform.InstanceName;
        frmEMCON.Show;
      end;
    end;
  end
  else
  begin
    if Assigned(frmEMCON) then
      frmEMCON.Close;
  end;
end;

procedure TfrmGeneralPfTools.btnFCRClick(Sender: TObject);
begin
  if TRzBmpButton(Sender).Down then
  begin
    if not Assigned(frmFCR) then
    begin
      frmFCR := TfrmFCR.Create(nil);
      frmFCR.fmFireControl1.InitCreate(Self);
    end;

    if Assigned(simMgrClient.ControlledPlatform) then
    begin
      if simMgrClient.ControlledPlatform is TT3PlatformInstance then begin
        frmFCR.fmFireControl1.SetControlledObject(simMgrClient.ControlledPlatform);
        frmFCR.Caption := 'Fire Control ' + simMgrClient.ControlledPlatform.InstanceName;
        frmFCR.Show;
      end;
    end;
  end
  else
  begin
    if Assigned(frmFCR) then
      frmFCR.Close;
  end;
end;

procedure TfrmGeneralPfTools.btnGuidanceClick(Sender: TObject);
var
  i : Integer;
  obj : T3GroupVehicle;
  li : TListItem;
begin
  if btnGuidance.Down then
  begin
    if not Assigned(frmGuidance) then
    begin
      frmGuidance := TfrmGuidance.Create(nil);
      frmGuidance.fmPlatformGuidance1.InitCreate(self);
    end;

//    if Assigned(frmTacticalDisplay.focusedTrack) then
//    begin
//      if frmTacticalDisplay.focusedTrack is TT3PlatformInstance then begin
//        frmGuidance.fmPlatformGuidance1.SetControlledObject(frmTacticalDisplay.focusedTrack);
//        frmGuidance.Show;
//      end;
//    end;

    if Assigned(simMgrClient.ControlledPlatform) then
    begin
      if simMgrClient.ControlledPlatform is TT3PlatformInstance then begin
        frmGuidance.fmPlatformGuidance1.SetControlledObject(simMgrClient.ControlledPlatform);
        frmGuidance.Caption := 'Guidance ' + simMgrClient.ControlledPlatform.InstanceName;
        frmGuidance.Show;
      end;
    end;

    frmGuidance.lvTrackControl.Clear;

    if simMgrClient.ListPlatformSelect.count > 0 then
    begin
      for i:= 0 to simMgrClient.ListPlatformSelect.Count - 1 do
      begin
        obj := T3GroupVehicle(simMgrClient.ListPlatformSelect.Items[i]);
        if obj.CubicleGroupID = 0 then
        begin
          li := frmGuidance.lvTrackControl.Items.Add;
          li.Caption := obj.GroupName;
          li.SubItems.Add(FormatSpeed(obj.Course));
          li.SubItems.Add(FormatSpeed(obj.Speed));
          li.Data := obj;
        end;
      end;
    end;
  end
  else
  begin
    if Assigned(frmGuidance) then
      frmGuidance.Close;
  end;

end;

procedure TfrmGeneralPfTools.btnInfoClick(Sender: TObject);
begin
  if btnInfo.Down then
  begin
    if not Assigned(frmPlatformInfo) then
      frmPlatformInfo := TfrmPlatformInfo.Create(nil);

    if Assigned(frmTacticalDisplay.focusedTrack) then
    begin
      if frmTacticalDisplay.focusedTrack is TT3PlatformInstance then begin
        frmPlatformInfo.fmOwnShip1.SetControlledObject(frmTacticalDisplay.focusedTrack);
        frmPlatformInfo.Show;
      end;
    end;
  end
  else
  begin
    if Assigned(frmPlatformInfo) then
      frmPlatformInfo.Close;
  end;
end;

procedure TfrmGeneralPfTools.btnOtherClick(Sender: TObject);
begin

  if TRzBmpButton(Sender).Down then
  begin
    if not Assigned(frmLogistic) then
    begin
      frmLogistic := TfrmLogistic.Create(nil);
      frmLogistic.fmLogisticCalculation1.InitCreate(nil);
    end;

    if Assigned(simMgrClient.ControlledPlatform) then
    begin
      if simMgrClient.ControlledPlatform is TT3PlatformInstance then begin
        frmLogistic.fmLogisticCalculation1.SetControlledObject(simMgrClient.ControlledPlatform);
        frmLogistic.Show;
      end;
    end;
  end
  else
  begin
    if Assigned(frmLogistic) then
      frmLogistic.Close;
  end;
end;

procedure TfrmGeneralPfTools.btnRadarClick(Sender: TObject);
begin
  if btnRadar.Down then
  begin
    if not Assigned(frmSensor) then
    begin
      frmSensor := TfrmSensor.Create(nil);
      frmSensor.fmSensor1.InitCreate(self);
    end;

    if Assigned(simMgrClient.ControlledPlatform) then
    begin
      if simMgrClient.ControlledPlatform is TT3PlatformInstance then begin
        frmSensor.fmSensor1.SetControlledObject(simMgrClient.ControlledPlatform);
        frmSensor.Caption := 'Sensor ' + simMgrClient.ControlledPlatform.InstanceName;
        frmSensor.Show;
      end;
    end;
  end
  else
  begin
    if Assigned(frmSensor) then
      frmSensor.Close;
  end;
end;

procedure TfrmGeneralPfTools.btnTransferLogClick(Sender: TObject);
begin
  if not Assigned(frmLogisticChange) then
    frmLogisticChange := TfrmLogisticChange.Create(self);

  with frmLogisticChange do
  begin
    ModeTransferID := 0;
    UpdateTabIdShip;
    pnlHose.Height := 40;
    frmLogisticChange.Height := 282;
    Show;
  end;

end;

procedure TfrmGeneralPfTools.btnWeaponClick(Sender: TObject);
begin
  if btnWeapon.Down then
  begin
    if not Assigned(frmWeapon) then
    begin
      frmWeapon := TfrmWeapon.Create(nil);
      frmWeapon.fmWeapon1.InitCreate(self);
    end;

    if Assigned(simMgrClient.ControlledPlatform) then
    begin
      if simMgrClient.ControlledPlatform is TT3PlatformInstance then begin
        frmWeapon.fmWeapon1.SetControlledObject(simMgrClient.ControlledPlatform);
        frmWeapon.Caption := 'Weapon ' + simMgrClient.ControlledPlatform.InstanceName;
        frmWeapon.Show;
      end;
    end;
  end
  else
  begin
    if Assigned(frmWeapon) then
      frmWeapon.Close;
  end;
end;

procedure TfrmGeneralPfTools.btnFullScreenClick(Sender: TObject);
begin
  frmTacticalDisplay.hideBottomPanel(sender);
  frmTop.hideTopPanel(sender);
end;

procedure TfrmGeneralPfTools.btnWindowedScreenClick(Sender: TObject);
begin
  frmTacticalDisplay.hideBottomPanel(sender);
  frmTop.hideTopPanel(sender);
end;

procedure TfrmGeneralPfTools.SetShowVehicleToolButton(const Value: Boolean);
begin
  FShowVehicleToolButton := Value;

  // tampilkan semua tombol control untuk vehicle platform
  if not FShowVehicleToolButton then
  begin
    btnInfo.Visible := False;
    btnGuidance.Visible := False;
    btnRadar.Visible := False;
    btnWeapon.Visible := False;
    btnCounterMeasure.Visible := False;
    btnEMCON.Visible := False;
    btnOther.Visible := False;
    btnTransferLog.Visible := False;
    btnFCR.Visible := False;
  end else
  begin
    btnInfo.Visible := True;
    btnGuidance.Visible := True;
    btnRadar.Visible := True;
    btnWeapon.Visible := True;
    btnCounterMeasure.Visible := True;
    btnEMCON.Visible := True;
//    btnOther.Visible := True;
//    btnTransferLog.Visible := True;
    btnFCR.Visible := True;
  end;
end;

end.
