unit uGunMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uDBAsset_Weapon;

type
  TGunMountForm = class(TForm)
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

    procedure getMount;
    procedure getData;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    gun : TGun_Definition;
  end;

var
  GunMountForm: TGunMountForm;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehiclePicklistFilter, uVehicleAttributeWindow,
uMissileLaunchers, uMissileSelect;

procedure TGunMountForm.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.UpdatePoint_Effect_On_Board(IntToStr(gun.FPoint.FData.Point_Effect_Index),1,gun.FPoint);
end;

procedure TGunMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TGunMountForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TGunMountForm.FormCreate(Sender: TObject);
begin
  gun := TGun_Definition.Create;
end;

procedure TGunMountForm.FormShow(Sender: TObject);
begin
  getMount;
end;

procedure TGunMountForm.getData;
begin
  with gun.FPoint.FData do begin
    Instance_Identifier   := edtName.Text;
    if fVehiclePicklistFilter.id_vehicle <> '' then
       Vehicle_Index  := StrToInt(fVehiclePicklistFilter.id_vehicle)
    else
       Vehicle_Index         := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    if cbMountExtension.ItemIndex <> -1 then
      Mount_Type            := cbMountExtension.ItemIndex
    else
      Mount_Type          := 0;
    Quantity              := StrToInt(edtQuantity.Text);
    Gun_Index             := Gun_Index;
  end;
end;

procedure TGunMountForm.getMount;
begin
  with gun.FPoint.FData do begin
    edtName.Text      := Instance_Identifier;
    edtClassName.Text := Instance_Identifier;
    edtQuantity.Text  := IntToStr(Quantity) ;
    cbMountExtension.ItemIndex := Mount_Type;
  end;
end;



end.
