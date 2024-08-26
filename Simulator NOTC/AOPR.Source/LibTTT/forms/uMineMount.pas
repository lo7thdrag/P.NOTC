unit uMineMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Weapon;

type
  TMineMountForm = class(TForm)
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
    lblReload: TStaticText;
    edtReload: TEdit;
    lblHourReload: TStaticText;

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
    mine : TMine_On_Board;
  end;

var
  MineMountForm: TMineMountForm;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehiclePicklistFilter, uVehicleAttributeWindow,
uMissileLaunchers, uMissileSelect;

procedure TMineMountForm.getMount;
begin
  with mine.FData do begin
    edtName.Text      := Instance_Identifier;
    edtClassName.Text := Instance_Identifier;
    edtQuantity.Text  := IntToStr(Quantity) ;
    edtReload.Text    := FormatDateTime('hh:mm:ss',Firing_Delay);
    cbMountExtension.ItemIndex := Mount_Type;
  end;
end;

procedure TMineMountForm.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.UpdateFitted_Weapon_OnBoard(IntToStr(mine.FData.Fitted_Weap_Index),3,mine.FData);
end;

procedure TMineMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMineMountForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TMineMountForm.FormCreate(Sender: TObject);
begin
  mine := TMine_On_Board.Create;
end;

procedure TMineMountForm.FormShow(Sender: TObject);
begin
  getMount;
end;

procedure TMineMountForm.getData;
begin
  with mine.FData do begin
    Instance_Identifier   := edtName.Text;
    if fVehiclePicklistFilter.id_vehicle <> '' then
       Vehicle_Index  := StrToInt(fVehiclePicklistFilter.id_vehicle)
    else
       Vehicle_Index         := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    if cbMountExtension.ItemIndex <> -1 then
      Mount_Type            := cbMountExtension.ItemIndex
    else
      Mount_Type          := 0;
    Mine_Index            := Mine_Index;
    Quantity              := StrToInt(edtQuantity.Text);
    Firing_Delay          := StrToDateTime(edtReload.Text);
  end;
end;


end.
