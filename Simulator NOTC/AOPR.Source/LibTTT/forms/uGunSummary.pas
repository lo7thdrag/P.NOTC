unit uGunSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Weapon;

type
  TfGunSummary = class(TForm)
    Panel1: TPanel;
    lbl1: TLabel;
    edtClassGun: TEdit;
    Panel2: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbCategory: TComboBox;
    grbLethality: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edtLethality: TEdit;
    TrackBarLethality: TTrackBar;
    grbCapabilities: TGroupBox;
    cbxAntiSurface: TCheckBox;
    cbxDeployingChaff: TCheckBox;
    grbRange: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    edtMinforAirTargetRange: TEdit;
    edtMaxforAirTargetRange: TEdit;
    edtMinforSurfaceRange: TEdit;
    grbProbOfHitCurve: TGroupBox;
    btnEditAirTargetCurve: TButton;
    TabSheet6: TTabSheet;
    mmNotes: TMemo;
    Label1: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    edtRateOfFire: TEdit;
    Label9: TLabel;
    edtMaxAltitude: TEdit;
    Label13: TLabel;
    edtAverageShell: TEdit;
    cbxFireControl: TCheckBox;
    Label14: TLabel;
    Label15: TLabel;
    Label24: TLabel;
    edtMaxforSurfaceRange: TEdit;
    btnEditSurfaceLandTargetCurve: TButton;
    cbxAntiLand: TCheckBox;
    cbxAutofireMode: TCheckBox;
    cbxAntiAir: TCheckBox;
    procedure TrackBarLethalityChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure getData;
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    gun : TGun_Definition;
    isCopy  : Boolean;
  end;

var
  fGunSummary: TfGunSummary;

implementation

{$R *.dfm}

uses uDataModuleTTT, uWeaponSingleList;

procedure TfGunSummary.btnApplyClick(Sender: TObject);
begin
  if fWeaponSingle.isNew then
  begin
    getData;
    dmTTT.insertGun_Def(gun);
    fWeaponSingle.isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateGun_Def(gun,IntToStr(gun.FData.Gun_Index));
  end;

end;

procedure TfGunSummary.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfGunSummary.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fWeaponSingle.refresh;
end;

procedure TfGunSummary.FormCreate(Sender: TObject);
begin
  gun := TGun_Definition.Create;
end;

procedure TfGunSummary.TrackBarLethalityChange(Sender: TObject);
begin
  edtLethality.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfGunSummary.getData;
begin

  with gun.FData do begin
    Gun_Identifier                := edtClassGun.Text;

    if cbCategory.ItemIndex = 0 then
      Gun_Category := 0
    else
      Gun_Category := 1;

    Rate_of_Fire                  := StrToInt(edtRateOfFire.Text);
    Lethality_per_Round           := StrToInt(edtLethality.Text);
    Min_Range                     := StrToFloat(edtMinforSurfaceRange.Text);
    Max_Range                     := StrToFloat(edtMaxforSurfaceRange.Text);
    Air_Min_Range                 := StrToFloat(edtMinforAirTargetRange.Text);
    Air_Max_Range                 := StrToFloat(edtMaxforAirTargetRange.Text);
   { Fire_Cntl_Director_Req        := StrToFloat();
    Chaff_Capable_Gun             := StrToFloat();
   }
    if cbxAntiSurface.Checked then
      Anti_Sur_Capable  := 1
    else
      Anti_Sur_Capable  := 0;

    if cbxAntiLand.Checked then
      Anti_Land_Capable  := 1
    else
      Anti_Land_Capable  := 0;

    if cbxAntiAir.Checked then
      Anti_Air_Capable  := 1
    else
      Anti_Air_Capable  := 0;

   // Automode_Capable              :=
    Max_Target_Altitude_Delta     := StrToInt(edtMaxAltitude.Text);
    Gun_Average_Shell_Velocity    := StrToFloat(edtAverageShell.Text);
   { Man_Gun_Max_Elevation         := StrToFloat();
    Man_Gun_Min_Elevation         := StrToFloat();
    Man_Gun_Rotation_Rate         := StrToFloat();
    Man_Gun_Elevation_Rate        := StrToFloat();
    Man_Gun_Num_Rounds_Per_Load   := StrToInt();
    Man_Gun_Time_to_Reload        := StrToFloat();
    Man_Gun_Muzzle_Velocity       := StrToFloat();
    NGS_Capable                   := ;
    NGS_MinDeflectionError        := StrToFloat();
    NGS_MaxDeflectionError        := StrToFloat();
    NGS_MinRangeError             := StrToFloat();
    NGS_MaxRangeError             := StrToFloat();
    NGS_MaxDispersionError        := StrToFloat();
    NGS_MaxDamageRadius           := StrToFloat();
    NGS_EffectiveRadius           := StrToFloat();
    NGS_DamageRating              := StrToFloat();   }
  end;

  gun.FNote.Notes := mmNotes.Lines.Text;

end;

end.
