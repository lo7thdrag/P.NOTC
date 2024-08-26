unit ufmWeaponCtrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, tttData, Menus;

type
  TOnWpnVisibility = procedure (Sender : TObject; Value : boolean) of object;
  TfrmWeaponCtrl = class(TForm)
    lblInfo: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    FWeaponCategory: TWeapoonCategory;
    FOnShowBlind: TOnWpnVisibility;
    FOnShowRange: TOnWpnVisibility;
    { Private declarations }
    procedure setWeapon(const Value: TObject); virtual;
    procedure setControlled(const Value: TObject);
    procedure setTargeted(const Value: TObject);
    procedure SetWeaponCategory(const Value: TWeapoonCategory);
    procedure SetOnShowBlind(const Value: TOnWpnVisibility);
    procedure SetOnShowRange(const Value: TOnWpnVisibility);
  protected
    FWeapon: TObject;
    FControlled: TObject;
    FTargeted: TObject;
    FVisibleShowRange : boolean;
    FVisibleShowBlind : boolean;
    procedure SetProperties;virtual;
    procedure Empty; virtual;
    procedure HideRangeSensor;
    procedure HideBlindSensor;
  public
    { Public declarations }
    property Weapon : TObject read FWeapon write setWeapon;
    property PlatformCtrld : TObject read FControlled write setControlled;
    property PlatformTrgt  : TObject read FTargeted write setTargeted;
    property WeaponCategory : TWeapoonCategory read FWeaponCategory write SetWeaponCategory;
    property OnShowRange : TOnWpnVisibility read FOnShowRange write SetOnShowRange;
    property OnShowBlind : TOnWpnVisibility read FOnShowBlind write SetOnShowBlind;
  end;

var
  frmWeaponCtrl: TfrmWeaponCtrl;

  function IfExistItem(mnu: TPopupMenu; Caption: string): Boolean;
  function DeleteAmpersand(Value: string): string;

implementation

uses uT3Sensor, uT3Unit, uT3Vehicle;

{$R *.dfm}

function DeleteAmpersand(Value: string): string;
var
  i: integer;
  found: Boolean;
begin
  found := false;

  for i := 0 to Length(Value) - 1 do  begin
    if Value[i] = '&' then
    begin
      found := true;
      break;
    end;
  end;

  if found then
    Delete(Value, i, 1);

  result := Value;
end;

function IfExistItem(mnu: TPopupMenu; Caption: string): Boolean;
var
  i: integer;
  itemCaption: String;
begin
  result := false;
  for i := 0 to mnu.Items.Count - 1 do
  begin
    itemCaption := DeleteAmpersand(mnu.Items[i].Caption);
    if itemCaption = Caption then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TfrmWeaponCtrl.HideBlindSensor;
var
  i : Integer;
  VehicleSensor : TT3DeviceUnit;
begin
  if (not Assigned(FControlled)) then Exit;
  
  for i := 0 to (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Count - 1 do
  begin
    VehicleSensor := (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Items[i];

    if VehicleSensor is TT3Sensor then
    begin
      if (VehicleSensor as TT3Sensor).ShowBlindZone then
      begin
        (VehicleSensor as TT3Sensor).ShowBlindSelected := False;
        //(VehicleSensor as TT3Sensor).ShowRange         := False;
      end;
    end;
  end;
end;


procedure TfrmWeaponCtrl.HideRangeSensor;
var
  i : Integer;
  VehicleSensor : TT3DeviceUnit;
begin
  if (not Assigned(FControlled)) then Exit;

  for i := 0 to (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Count - 1 do
  begin
    VehicleSensor := (TT3PlatformInstance(FControlled) as TT3Vehicle).Devices.Items[i];

    if VehicleSensor is TT3Sensor then
    begin
      if (VehicleSensor as TT3Sensor).ShowRange then
      begin
        (VehicleSensor as TT3Sensor).ShowRangeSelected := False;
        //(VehicleSensor as TT3Sensor).ShowRange         := False;
      end;
    end;
  end;
end;

procedure TfrmWeaponCtrl.Empty;
begin
//
end;

procedure TfrmWeaponCtrl.FormCreate(Sender: TObject);
begin
  FWeapon     := nil;
  FTargeted   := nil;
  FControlled := nil;
  FVisibleShowRange := false;
  FVisibleShowBlind := false;

  Align := alClient;
  BorderStyle := bsNone;
  Show;
end;

procedure TfrmWeaponCtrl.setControlled(const Value: TObject);
begin
  FControlled := Value;
end;

procedure TfrmWeaponCtrl.SetOnShowBlind(const Value: TOnWpnVisibility);
begin
  FOnShowBlind := Value;
end;

procedure TfrmWeaponCtrl.SetOnShowRange(const Value: TOnWpnVisibility);
begin
  FOnShowRange := Value;
end;

procedure TfrmWeaponCtrl.SetProperties;
begin
  if not Assigned(FControlled) then begin
    raise Exception.Create('Controlled Platform must be set on ' + Self.Name);
    exit;
  end;
end;

procedure TfrmWeaponCtrl.setTargeted(const Value: TObject);
begin
  FTargeted := Value;
end;

procedure TfrmWeaponCtrl.setWeapon(const Value: TObject);
begin
  if not Assigned(Value) then begin
    FWeapon := Value;
    Empty;
  end
  else begin
    FWeapon := Value;
    SetProperties;
  end;
end;

procedure TfrmWeaponCtrl.SetWeaponCategory(const Value: TWeapoonCategory);
begin
  FWeaponCategory := Value;
end;

end.
