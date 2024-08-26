unit ufrmWeapon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ufmWeapon, uT3Unit, uT3Vehicle;

type
  TfrmWeapon = class(TForm)
    fmWeapon1: TfmWeapon;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure fmWeapon1btnWakeHomingTargetTrackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetControlledObject(pit : TT3PlatformInstance);
  end;

var
  frmWeapon: TfrmWeapon;

implementation

uses ufrmGeneraPfTools, ufrmKeyboard;

{$R *.dfm}

procedure TfrmWeapon.fmWeapon1btnWakeHomingTargetTrackClick(Sender: TObject);
begin
  fmWeapon1.btnWakeHomingTorpedoOnClick(Sender);

end;

procedure TfrmWeapon.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmWeapon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;

  if Assigned(frmGeneralPfTools) then
    frmGeneralPfTools.btnWeapon.Down := False;

end;

procedure TfrmWeapon.SetControlledObject(pit: TT3PlatformInstance);
begin
  if pit is TT3Vehicle then
  begin
    frmWeapon.Caption := 'Weapon ' + pit.InstanceName;
  end;
end;

end.
