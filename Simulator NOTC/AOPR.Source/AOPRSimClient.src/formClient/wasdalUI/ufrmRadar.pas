unit ufrmRadar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ufmSensor, uT3Unit, uT3Vehicle;

type
  TfrmSensor = class(TForm)
    fmSensor1: TfmSensor;
    procedure fmSensor1btnIFFInterrogatorTrackSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetControlledObject(pit : TT3PlatformInstance);
  end;

var
  frmSensor: TfrmSensor;

implementation

uses ufTacticalDisplay,
  uT3DetectedTrack, ufrmGeneraPfTools, ufrmKeyboard;

{$R *.dfm}

procedure TfrmSensor.fmSensor1btnIFFInterrogatorTrackSearchClick(
  Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    if Assigned(frmTacticalDisplay.focusedTrack) then
    begin
      if frmTacticalDisplay.focusedTrack is TT3DetectedTrack then
        fmSensor1.SetFocusedPlatform(TT3DetectedTrack(frmTacticalDisplay.focusedTrack).TrackObject
          as TT3PlatformInstance)
      else if frmTacticalDisplay.focusedTrack is TT3PlatformInstance then
        fmSensor1.focused_platform := frmTacticalDisplay.focusedTrack;
    end;

    fmSensor1.btnIFFInterrogatorTrackSearchClick(Sender);
  end;

end;

procedure TfrmSensor.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmSensor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;

  if Assigned(frmGeneralPfTools) then
    frmGeneralPfTools.btnRadar.Down := False;

end;

procedure TfrmSensor.SetControlledObject(pit: TT3PlatformInstance);
begin
  if pit is TT3Vehicle then
  begin
    frmSensor.Caption := 'Sensor ' + pit.InstanceName;
  end;
end;

end.
