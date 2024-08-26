unit uTorpedoMounts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uDBAsset_Weapon;

type
  TTorpedoMountsForm = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure getMount;
    procedure getData;
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditLaunchersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    torpedo : TTorpedo_On_Board;
  end;

var
  TorpedoMountsForm: TTorpedoMountsForm;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehiclePicklistFilter, uVehicleAttributeWindow,
uMissileLaunchers, uMissileSelect, uTorpedoLauncher;

procedure TTorpedoMountsForm.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.UpdateFitted_Weapon_OnBoard(IntToStr(torpedo.FData.Fitted_Weap_Index),2,torpedo.FData);
end;

procedure TTorpedoMountsForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TTorpedoMountsForm.btnEditLaunchersClick(Sender: TObject);
begin
  dmTTT.GetFitted_Weap_Launcher_On_Board(torpedo.FData.Fitted_Weap_Index,torpedo.FLaunch);
  TorpedoLauncherForm.Show;
end;

procedure TTorpedoMountsForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TTorpedoMountsForm.FormCreate(Sender: TObject);
begin
  torpedo := TTorpedo_On_Board.Create;
end;

procedure TTorpedoMountsForm.FormShow(Sender: TObject);
begin
  getMount;
end;

procedure TTorpedoMountsForm.getMount;
begin
  with torpedo.FData do begin
    edtName.Text      := Instance_Identifier;
    edtClassName.Text := Instance_Identifier;
    edtQuantity.Text  := IntToStr(Quantity) ;
    edtReload.Text    := FormatDateTime('hh:mm:ss',Firing_Delay);
    cbMountExtension.ItemIndex := Mount_Type;
  end;

end;

procedure TTorpedoMountsForm.getData;
begin
  with torpedo.FData do begin
    Instance_Identifier   := edtName.Text;
    if fVehiclePicklistFilter.id_vehicle <> '' then
       Vehicle_Index  := StrToInt(fVehiclePicklistFilter.id_vehicle)
    else
       Vehicle_Index         := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    if cbMountExtension.ItemIndex <> -1 then
      Mount_Type            := cbMountExtension.ItemIndex
    else
      Mount_Type          := 0;
    Torpedo_Index         := Torpedo_Index;
    Quantity              := StrToInt(edtQuantity.Text);
    Firing_Delay          := StrToDateTime(edtReload.Text);
    Torpedo_Index         := Torpedo_Index;
  end;
end;


end.
