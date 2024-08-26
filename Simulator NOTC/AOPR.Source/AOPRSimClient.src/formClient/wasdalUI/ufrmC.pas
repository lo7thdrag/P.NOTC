unit ufrmC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ufmCounterMeasure, uT3Unit,uT3UnitContainer, uT3Vehicle,
  Vcl.StdCtrls;

type
  TfrmCM = class(TForm)
    fmCounterMeasure1: TfmCounterMeasure;
    lblType: TLabel;
    procedure fmCounterMeasure1btnRadarJammingModeSelectedTrackTrackClick(
      Sender: TObject);
    procedure fmCounterMeasure1btnSDJammerTargetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetControlledObject(pit : TT3PlatformInstance);
  end;

var
  frmCM: TfrmCM;

implementation

uses
  ufTacticalDisplay, uT3DetectedTrack, ufrmGeneraPfTools, ufrmKeyboard;

{$R *.dfm}

procedure TfrmCM.fmCounterMeasure1btnRadarJammingModeSelectedTrackTrackClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(frmTacticalDisplay.focusedTrack) then
    begin
      if frmTacticalDisplay.focusedTrack is TT3DetectedTrack then begin
        fmCounterMeasure1.focused_platform :=
          TT3PlatformInstance(TT3DetectedTrack(frmTacticalDisplay.focusedTrack).TrackObject);
      end
      else if frmTacticalDisplay.focusedTrack is TT3PlatformInstance then begin
        fmCounterMeasure1.focused_platform := frmTacticalDisplay.focusedTrack;
      end;
    end;

    fmCounterMeasure1.btnRadarJammingModeSelectedTrackTrackClick(Sender);
  end;

end;

procedure TfrmCM.fmCounterMeasure1btnSDJammerTargetClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(frmTacticalDisplay.focusedTrack) then
    begin
      if frmTacticalDisplay.focusedTrack is TT3DetectedTrack then begin
        fmCounterMeasure1.focused_platform :=
          TT3PlatformInstance(TT3DetectedTrack(frmTacticalDisplay.focusedTrack).TrackObject);
      end
      else if frmTacticalDisplay.focusedTrack is TT3PlatformInstance then begin
        fmCounterMeasure1.focused_platform := frmTacticalDisplay.focusedTrack;
      end;
    end;

    fmCounterMeasure1.btnSDJammerTargetClick(Sender);
  end;

end;

procedure TfrmCM.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmCM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;

  if Assigned(frmGeneralPfTools) then
    frmGeneralPfTools.btnCounterMeasure.Down := False;

end;

procedure TfrmCM.SetControlledObject(pit: TT3PlatformInstance);
begin
  if pit is TT3Vehicle then
  begin
    frmCM.Caption := 'Countermeasure ' + pit.InstanceName;
  end;
end;

end.
