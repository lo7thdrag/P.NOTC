unit uMissileMountForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uDBAsset_Weapon;

type
  TMissileMountForm = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    imgBlindZones: TImage;
    lblClassName: TStaticText;
    edtClassName: TEdit;
    lblMountExtension: TStaticText;
    cbMountExtension: TComboBox;
    lblBlindZones: TStaticText;
    lblQuantity: TStaticText;
    edtQuantity: TEdit;
    lblReload: TStaticText;
    edtReload: TEdit;
    lblHourReload: TStaticText;
    btnEditLaunchers: TButton;
    procedure getData;
    procedure getMount;
    procedure btnEditLaunchersClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    missile_fitted       : TMissile_On_Board;
  end;

var
  MissileMountForm: TMissileMountForm;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehiclePicklistFilter, uVehicleAttributeWindow,
uMissileLaunchers, uMissileSelect;

procedure TMissileMountForm.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.UpdateFitted_Weapon_OnBoard(IntToStr(missile_fitted.FData.Fitted_Weap_Index),1,missile_fitted.FData);
end;

procedure TMissileMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMissileMountForm.btnEditLaunchersClick(Sender: TObject);
begin
  dmTTT.GetFitted_Weap_Launcher_On_Board(missile_fitted.FData.Fitted_Weap_Index,MissileLaunchersForm.fitted_launch.FData);
  MissileLaunchersForm.Show;
end;

procedure TMissileMountForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;


procedure TMissileMountForm.getMount;
begin

  with missile_fitted.FData do begin
    edtName.Text      := Instance_Identifier;
    edtClassName.Text := Instance_Identifier;
    edtQuantity.Text  := IntToStr(Quantity) ;
    edtReload.Text    := FormatDateTime('hh:mm:ss',Firing_Delay);
    cbMountExtension.ItemIndex := Mount_Type;
  end;

end;


procedure TMissileMountForm.FormCreate(Sender: TObject);
begin
  missile_fitted := TMissile_On_Board.Create;
end;

procedure TMissileMountForm.FormShow(Sender: TObject);
begin
  getMount;
end;

procedure TMissileMountForm.getData;
begin
  with missile_fitted.FData do begin
    Instance_Identifier   := edtName.Text;
    if fVehiclePicklistFilter.id_vehicle <> '' then
       Vehicle_Index  := StrToInt(fVehiclePicklistFilter.id_vehicle)
    else
       Vehicle_Index         := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    if cbMountExtension.ItemIndex <> -1 then
      Mount_Type            := cbMountExtension.ItemIndex
    else
      Mount_Type          := 0;
    Missile_Index         := Missile_Index;
    Quantity              := StrToInt(edtQuantity.Text);
    Firing_Delay          := StrToDateTime(edtReload.Text);
  end;

end;

end.
