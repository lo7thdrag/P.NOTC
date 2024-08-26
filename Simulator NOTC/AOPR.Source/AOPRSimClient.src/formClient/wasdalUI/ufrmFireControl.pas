unit ufrmFireControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ufmFireControl, ComCtrls, StdCtrls, uT3Unit,
  uT3Vehicle;

type
  TfrmFCR = class(TForm)
    fmFireControl1: TfmFireControl;
    procedure fmFireControl1lstFireControlAssetsAssignedTracksSelectItem(
      Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure fmFireControl1btnSearchFireControlAssetsTargetClick(
      Sender: TObject);
    procedure fmFireControl1btnFireControlAssetsTargetAssignClick(
      Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetControlledObject(pit : TT3PlatformInstance);
  end;

var
  frmFCR: TfrmFCR;

implementation

uses ufTacticalDisplay, ufrmGeneraPfTools;

{$R *.dfm}

procedure TfrmFCR.fmFireControl1btnFireControlAssetsTargetAssignClick(
  Sender: TObject);
begin
  if (Sender is TButton) and (TButton(Sender).Tag = 4) then
    frmTacticalDisplay.ObjectAssignedByGun := fmFireControl1.Focused_Platform
  else
    frmTacticalDisplay.ObjectAssignedByGun := nil;

  fmFireControl1.btnFCROnClick(Sender);

end;

procedure TfrmFCR.fmFireControl1btnSearchFireControlAssetsTargetClick(
  Sender: TObject);
begin
  frmTacticalDisplay.SetFCTargetObjectobj(frmTacticalDisplay.focusedTrack);
  frmTacticalDisplay.SetWeaponTargetObject(frmTacticalDisplay.focusedTrack);

  fmFireControl1.btnSearchFireControlAssetsTargetClick(Sender);

end;

procedure TfrmFCR.fmFireControl1lstFireControlAssetsAssignedTracksSelectItem(
  Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  fmFireControl1.lstFireControlAssetsAssignedTracksSelectItem(Sender, Item,
  Selected);

  if Assigned(fmFireControl1.Focused_Platform) then
    frmTacticalDisplay.ObjectAssignedByGun := fmFireControl1.Focused_Platform;

end;

procedure TfrmFCR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;

  if Assigned(frmGeneralPfTools) then
    frmGeneralPfTools.btnFCR.Down := False;

end;

procedure TfrmFCR.SetControlledObject(pit: TT3PlatformInstance);
begin
  if pit is TT3Vehicle then
  begin
    frmFCR.Caption := 'Fire Control ' + pit.InstanceName;
  end;
end;

end.
