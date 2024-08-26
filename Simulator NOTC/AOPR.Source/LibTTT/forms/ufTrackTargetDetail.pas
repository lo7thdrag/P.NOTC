unit ufTrackTargetDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uSimObjects;

type
  TfrmDetailTrackTarget = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblTrack: TLabel;
    lblClass: TLabel;
    lblForce: TLabel;
    lblCourse: TLabel;
    lblSpeed: TLabel;
    lblBearing: TLabel;
    lblRange: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Bevel1: TBevel;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FPlatform : TSimObject;
  public
    { Public declarations }
    procedure SetDetailedTarget(controlled, target : TSimObject);
  end;

var
  frmDetailTrackTarget: TfrmDetailTrackTarget;

implementation

uses uBaseCoordSystem, uT3DetectedTrack, uT3Unit, uT3Vehicle;

{$R *.dfm}

procedure TfrmDetailTrackTarget.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDetailTrackTarget.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmDetailTrackTarget := nil;
end;

procedure TfrmDetailTrackTarget.SetDetailedTarget(controlled,
  target: TSimObject);
var                                 
  bearing, range : double;
begin
  FPlatform := controlled;

  bearing := CalcBearing(FPlatform.getPositionX,FPlatform.getPositionY,
                  target.getPositionX, target.getPositionY);
  range   := CalcRange(FPlatform.getPositionX,FPlatform.getPositionY,
                  target.getPositionX, target.getPositionY);

  lblRange.Caption := FormatFloat('#.##',range);
  lblBearing.Caption := FormatCourse(bearing);

  if target is TT3DetectedTrack then
  begin
    lblTrack.Caption  := TT3DetectedTrack(target).TrackID;
    if TT3DetectedTrack(target).TrackObject is TT3Vehicle then
      lblClass.Caption  := TT3Vehicle(TT3DetectedTrack(target).TrackObject)
                           .VehicleDefinition.FData.Vehicle_Identifier
    else
      lblClass.Caption  := '---';
    
    // force ?? belum  
  end
  else if target is TT3PlatformInstance then
  begin
    lblTrack.Caption  := TT3PlatformInstance(target).Track_ID;
    if target is TT3Vehicle then
      lblClass.Caption  := TT3Vehicle(target).VehicleDefinition.FData.Vehicle_Identifier
    else
      lblClass.Caption  := '---';

    // force ?? belum  
  end;
end;

end.
