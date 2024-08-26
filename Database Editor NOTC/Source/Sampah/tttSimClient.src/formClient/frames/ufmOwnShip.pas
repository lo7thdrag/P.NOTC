unit ufmOwnShip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ufmControlled;

type
  TfmOwnShip = class(TfmControlled)
    ScrollBox4: TScrollBox;
    lbOwnShipPosition1: TLabel;
    Label22: TLabel;
    lbOrderHeading: TLabel;
    lbActualHeading: TLabel;
    Label23: TLabel;
    lbActualCourse: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    lbOwnShipOrderGround: TLabel;
    Label28: TLabel;
    lbOrderedAltitude: TLabel;
    lbOwnShipActualground: TLabel;
    Label29: TLabel;
    lbGuidance: TLabel;
    lbFuel: TLabel;
    lbDamage: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    lbOwnShipPosition2: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    lbActualAltitude: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    StaticText16: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText58: TStaticText;
    StaticText64: TStaticText;
    StaticText65: TStaticText;
    StaticText66: TStaticText;
    StaticText68: TStaticText;
    StaticText69: TStaticText;
    StaticText72: TStaticText;
    StaticText73: TStaticText;
    StaticText74: TStaticText;
    StaticText75: TStaticText;
    StaticText70: TStaticText;
    btnLaunch: TButton;
    procedure btnLaunchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    procedure InitCreate(sender: TForm); override;
//    procedure SetControlledObject(ctrlObj: TObject); override;

    procedure Refresh_OwnShipTab(Sender: TObject);
  end;

implementation

uses
  uDBAssetObject, uBaseCoordSystem, uGuidance, uLaunchPlatform;

{$R *.dfm}

procedure TfmOwnShip.btnLaunchClick(Sender: TObject);
begin
  if not Assigned(frmLaunchPlaform) then
    frmLaunchPlaform := TfrmLaunchPlaform.Create(self);

  if FControlled <> nil then begin
    frmLaunchPlaform.PlatformInst := TPlatform_Instance(FControlled);
    frmLaunchPlaform.FormStyle := fsStayOnTop;
    frmLaunchPlaform.Show;
  end;

end;

procedure TfmOwnShip.Refresh_OwnShipTab(Sender: TObject);
begin
  if Sender = nil then
    exit;

  // FOwnShip := (sender as TSimMgr_Client).OwnShipPlatform;
  if FControlled = nil then
    exit;

  with TPlatform_Instance(FControlled) do
  begin
    lbOwnShipPosition1.Caption  := formatDMS_long(PositionX);
    lbOwnShipPosition2.Caption  := formatDMS_latt(PositionY);

    lbActualCourse.Caption      := FormatCourse(Course);
    lbActualHeading.Caption     := FormatCourse(Course);
    lbOrderHeading.Caption      := FormatCourse(OrderedHeading);

    lbOrderedAltitude.Caption   := FormatAltitude(OrderedAltitude);

    if OrderedHeading = 0 then
      lbOrderHeading.Caption  := '0.00';
    if Course = 0 then
    begin
      lbActualCourse.Caption  := '0.00';
      lbActualHeading.Caption := '0.00';
    end;

    lbOwnShipActualground.Caption := FormatSpeed(Speed);
    lbOwnShipOrderGround.Caption  := FormatSpeed(OrderedSpeed);

    if Speed = 0 then
      lbOwnShipActualground.Caption := '0.00';
    if OrderedSpeed = 0 then
      lbOwnShipOrderGround.Caption := '0.00';

    lbGuidance.Caption := GetGuidanceStr(Vehicle.GuidanceType);
    lbOwnShipPosition1.Caption := formatDMS_long(PositionX);
    lbOwnShipPosition2.Caption := formatDMS_latt(PositionY);

    lbActualCourse.Caption := FormatCourse(Course);
    lbActualHeading.Caption := FormatCourse(Course);
    lbOrderHeading.Caption := FormatCourse(OrderedHeading);

    lbOrderedAltitude.Caption := FormatAltitude(OrderedAltitude);

    if OrderedHeading = 0 then
      lbOrderHeading.Caption := '0.00';
    if Course = 0 then
    begin
      lbActualCourse.Caption  := '0.00';
      lbActualHeading.Caption := '0.00';
    end;

    lbOwnShipActualground.Caption := FormatSpeed(Speed);
    lbOwnShipOrderGround.Caption  := FormatSpeed(OrderedSpeed);

    if Speed = 0 then
      lbOwnShipActualground.Caption := '0.00';
    if OrderedSpeed = 0 then
      lbOwnShipOrderGround.Caption := '0.00';

//    lbDamage.Caption := IntToStr(Vehicle.FData.Damage_Capacity);
    lbDamage.Caption := IntToStr(HealthPercent);

   end;
end;


end.
