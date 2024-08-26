unit ufrmGunView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls,uDBAsset_Weapon, uSimContainers, tttData;

type
  TfrmGunView = class(TForm)
    Label4: TLabel;
    lstGun: TListBox;
    ImgBackgroundList: TImage;
    ImgBackground: TImage;
    Label2: TLabel;
    lblName: TLabel;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    pnlTabGeneral: TPanel;
    Label1: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    edtAirMinRange: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtAirMaxRange: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtCategoryGun: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label43: TLabel;
    lblLethality: TLabel;
    Panel1: TPanel;
    chkAntiSurface: TCheckBox;
    Panel4: TPanel;
    chkDeployingChaff: TCheckBox;
    Panel2: TPanel;
    trckbrLethality: TTrackBar;
    chkAntiLand: TCheckBox;
    chkAutofireMode: TCheckBox;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtMaxAltitudeDiff: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtAverageShellVelocity: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtRateOfFire: TLabel;
    Label17: TLabel;
    chkAntiAmphibious: TCheckBox;
    chkAntiAir: TCheckBox;
    chkNavalGunSupport: TCheckBox;
    CheckBox4: TCheckBox;
    Label19: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    edtSurLandMinRange: TLabel;
    Label27: TLabel;
    edtSurLandMaxRange: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    chkFireControl: TCheckBox;
    Image1: TImage;
    pnlTabNGS: TPanel;
    Image2: TImage;
    Label12: TLabel;
    Label16: TLabel;
    Label26: TLabel;
    edtMinDeflectionError: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtMaxDeflectionError: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Panel6: TPanel;
    Label8: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    edtMinRangeError: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    edtMaxRangeError: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Panel3: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    edtMaxDispersionError: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    edtMaxDamageRadius: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Panel5: TPanel;
    Label64: TLabel;
    Label65: TLabel;
    edtEffectiveRadius: TLabel;
    Label67: TLabel;
    Label56: TLabel;
    lblDamageRating: TLabel;
    Panel7: TPanel;
    trckbrDamageRating: TTrackBar;
    Label28: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label44: TLabel;
    lblsearch: TLabel;
    edtgunview: TEdit;
    imgImgBtnBack: TImage;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);


    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);
    procedure imgImgBtnBackClick(Sender: TObject);

  private
    tabIndex, tabMax : Integer;
    FGunList : TList;
    FSelectedGun : TGun_Definition;

    function SetWeaponCategory(aValue : Integer): string;

  public
     procedure UpdateTabPage;
     procedure UpdateGunList;
     procedure UpdateGunData;

  end;

var
  frmGunView: TfrmGunView;

implementation

uses
  uDataModuleTTT ;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmGunView.edtCheatKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
  gun : TGun_Definition;

begin
  lstGun.Items.Clear;

  dmTTT.GetFilterGunDef(FGunList,edtgunview.text);

  for i := 0 to FGunList.Count - 1 do
  begin
    gun := FGunList.Items[i];
    lstGun.Items.AddObject(gun.FData.Gun_Identifier, gun);
  end;
end;
procedure TfrmGunView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FGunList);
  Action := cafree;
end;

procedure TfrmGunView.FormCreate(Sender: TObject);
begin
  FGunList := TList.Create;
end;

procedure TfrmGunView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 2;

  UpdateTabPage;
  UpdateGunList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}


procedure TfrmGunView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmGunView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmGunView.imgImgBtnBackClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmGunView.lbSingleClick(Sender: TObject);
begin
  if lstGun.ItemIndex = -1 then
    Exit;

  FSelectedGun := TGun_Definition(lstGun.Items.Objects[lstGun.ItemIndex]);

  UpdateGunData;
end;
{$ENDREGION}

{$REGION ' View Data Handle '}
procedure TfrmGunView.UpdateGunData;
begin
  with FSelectedGun do
  begin
    lblName.Caption := FData.Gun_Identifier;

    {$REGION ' General '}
    case FData.Gun_Category of
      Ord(cGunClose) : edtCategoryGun.Caption := csGunClose;
      Ord(cGunGun) : edtCategoryGun.Caption := csGunGun;
      Ord(cGunRocket) : edtCategoryGun.Caption := csGunRocket;
    end;

    edtRateOfFire.Caption := IntToStr(FData.Rate_of_Fire);
    edtMaxAltitudeDiff.Caption := IntToStr(FData.Max_Target_Altitude_Delta);
    edtAverageShellVelocity.Caption := FormatFloat('0.00', FData.Gun_Average_Shell_Velocity);

    chkFireControl.Checked := Boolean(FData.Fire_Cntl_Director_Req);

    edtAirMinRange.Caption := FormatFloat('0.00', FData.Air_Min_Range);
    edtAirMaxRange.Caption := FormatFloat('0.00', FData.Air_Max_Range);

    edtSurLandMinRange.Caption := FormatFloat('0.00', FData.Min_Range);
    edtSurLandMaxRange.Caption := FormatFloat('0.00', FData.Max_Range);

    edtCategoryGun.Caption := SetWeaponCategory(FData.Gun_Category);

//    btnEditAirTargetCurve.Enabled := FData.Gun_Index <> 0;
//    btnEditSurfaceLandTargetCurve.Enabled := FData.Gun_Index <> 0;

    chkAntiSurface.Checked := Boolean(FData.Anti_Sur_Capable);
    chkAntiLand.Checked := Boolean(FData.Anti_Land_Capable);
    chkAntiAir.Checked := Boolean(FData.Anti_Air_Capable);
    chkAntiAmphibious.Checked := Boolean(FData.Anti_Amphibious_Capable);
    chkDeployingChaff.Checked := Boolean(FData.Chaff_Capable_Gun);
    chkAutofireMode.Checked := Boolean(FData.Automode_Capable);
    chkNavalGunSupport.Checked := Boolean(FData.NGS_Capable);

    trckbrLethality.Position := FData.Lethality_per_Round;
    lblLethality.Caption := trckbrLethality.Position.ToString;
    {$ENDREGION}

    {$REGION ' Naval Gunfire Support '}
    edtMinDeflectionError.Caption := FormatFloat('0.0', FData.NGS_MinDeflectionError);
    edtMaxDeflectionError.Caption := FormatFloat('0.0', FData.NGS_MaxDeflectionError);

    edtMinRangeError.Caption := FormatFloat('0.0', FData.NGS_MinRangeError);
    edtMaxRangeError.Caption := FormatFloat('0.0', FData.NGS_MaxRangeError);

    edtMaxDispersionError.Caption := FormatFloat('0.0', FData.NGS_MaxDispersionError);
    edtMaxDamageRadius.Caption := FormatFloat('0.0', FData.NGS_MaxDamageRadius);
    edtEffectiveRadius.Caption := FormatFloat('0.0', FData.NGS_EffectiveRadius);

    trckbrDamageRating.Position := FData.NGS_DamageRating;
    lblDamageRating.Caption := trckbrDamageRating.Position.ToString;
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

function TfrmGunView.SetWeaponCategory(aValue: Integer): string;
begin
  case aValue of
    Byte(wcGunCIWS) : Result := 'Close-In-Weapon System';
    Byte(wcGunGun) : Result := 'Gun';
    Byte(wcGunRocket) : Result := 'Rocket';
  end;
end;

procedure TfrmGunView.UpdateGunList;
var
  i : Integer;
  gun : TGun_Definition;

begin
  lstGun.Items.Clear;

  dmTTT.GetAllGunDef(FGunList);

  for i := 0 to FGunList.Count - 1 do
  begin
    gun := FGunList.Items[i];
    lstGun.Items.AddObject(gun.FData.Gun_Identifier, gun);
  end;
end;

procedure TfrmGunView.UpdateTabPage;
begin

  {$REGION ' Setting Tab '}
  case tabIndex of
    0:
    begin
      lblTab.Caption := 'GENERAL';
      pnlTabGeneral.BringToFront;
    end;
    1:
    begin
      lblTab.Caption := 'NAVAL GUNFIRE SUPPORT';
      pnlTabNGS.BringToFront;
    end;
    2:
    begin
      lblTab.Caption := 'NOTE';
      pnlTabNotes.BringToFront;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Setting Button Prev-Next '}
  ImgBtnPreviousTab.Visible := True;
  ImgBtnNextTab.Visible := True;

  if tabIndex = 0 then
    ImgBtnPreviousTab.Visible := false
  else if tabIndex = tabMax then
    ImgBtnNextTab.Visible := false;
  {$ENDREGION}

end;
{$ENDREGION}

end.
