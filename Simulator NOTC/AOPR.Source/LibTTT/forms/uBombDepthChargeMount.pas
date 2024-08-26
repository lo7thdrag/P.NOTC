unit uBombDepthChargeMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Weapon;

type
  TBombDepthChargeMountForm = class(TForm)
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
    lblClassName: TStaticText;
    edtClassName: TEdit;
    lblMountExtension: TStaticText;
    cbMountExtension: TComboBox;
    lblQuantity: TStaticText;
    edtQuantity: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure getData;
    procedure getMount;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bomb  : TBomb_Definition;
  end;

var
  BombDepthChargeMountForm: TBombDepthChargeMountForm;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehiclePicklistFilter, uVehicleAttributeWindow,
uMissileLaunchers, uMissileSelect;

procedure TBombDepthChargeMountForm.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.UpdatePoint_Effect_On_Board(IntToStr(bomb.FPoint.FData.Point_Effect_Index),2,bomb.FPoint);
end;

procedure TBombDepthChargeMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TBombDepthChargeMountForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TBombDepthChargeMountForm.FormCreate(Sender: TObject);
begin
  bomb  := TBomb_Definition.Create;
end;

procedure TBombDepthChargeMountForm.FormShow(Sender: TObject);
begin
  edtName.Clear;
  edtClassName.Clear;
  edtQuantity.Clear;
  getMount;
end;

procedure TBombDepthChargeMountForm.getData;
begin
  with bomb.FPoint.FData do begin
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
    Bomb_Index            := Bomb_Index;
  end;
end;

procedure TBombDepthChargeMountForm.getMount;
begin
  with bomb.FPoint.FData do begin
    edtName.Text      := Instance_Identifier;
    edtClassName.Text := Instance_Identifier;
    edtQuantity.Text  := IntToStr(Quantity) ;
    cbMountExtension.ItemIndex := Mount_Type;
  end;
end;

end.
