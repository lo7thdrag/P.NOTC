unit uFrmTorpedoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, uDBAsset_Weapon, uSimContainers, tttData, uDBAsset_MotionCharacteristics;
type
  TfrmTorpedoView = class(TForm)
    ImgBackground: TImage;
    Label4: TLabel;
    lstTorpedo: TListBox;
    ImgBackgroundList: TImage;
    Label2: TLabel;
    Panel9: TPanel;
    lblName: TLabel;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    pnlTabPOH: TPanel;
    Image2: TImage;
    Label37: TLabel;
    Panel2: TPanel;
    trckbrWakeHoming: TTrackBar;
    trckbrWireGuided: TTrackBar;
    trckbrActiveAcoustic: TTrackBar;
    trckbrPassiveAcoustic: TTrackBar;
    trckbrActivePassiveAcoustic: TTrackBar;
    edtSpotNumber: TLabel;
    Label53: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lblWakeHoming: TLabel;
    lblWireGuided: TLabel;
    lblActiveAcoustic: TLabel;
    lblPassiveAcoustic: TLabel;
    lblBothAcoustic: TLabel;
    pnlTabPhysical: TPanel;
    Image1: TImage;
    Label21: TLabel;
    Panel1: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    edtMotionCharTorpedo: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Panel3: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    edtLength: TLabel;
    edtWidth: TLabel;
    edtHeight: TLabel;
    edtEngagementRange: TLabel;
    edtMinimumSpeed: TLabel;
    edtMaximumSpeed: TLabel;
    edtCavitationSpeed: TLabel;
    edtBelowCavitation: TLabel;
    edtAboveCavitation: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    chkAirDropCapable: TCheckBox;
    Panel4: TPanel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    edtLateralDeceleration: TLabel;
    edtDecentRate: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Panel5: TPanel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    edtAcousticFront: TLabel;
    edtAcousticSide: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    pnlTabGeneral: TPanel;
    Image3: TImage;
    Label68: TLabel;
    Label78: TLabel;
    edtMethod: TLabel;
    chkAntiSurface: TCheckBox;
    chkAntiSubSurface: TCheckBox;
    Label52: TLabel;
    Label54: TLabel;
    edtInitialCS: TLabel;
    Label97: TLabel;
    Panel10: TPanel;
    Label98: TLabel;
    Label99: TLabel;
    edtPrimaryTargetDomain: TLabel;
    Label47: TLabel;
    Panel12: TPanel;
    Label51: TLabel;
    Label101: TLabel;
    edtMaxSearchDepth: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    edtDetectabilityType: TLabel;
    Label46: TLabel;
    Panel11: TPanel;
    trckbrDamageSustainability: TTrackBar;
    lblDamageSustainability: TLabel;
    Label50: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Panel13: TPanel;
    trckbrLethality: TTrackBar;
    lblLethality: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Panel14: TPanel;
    Label77: TLabel;
    Label85: TLabel;
    Panel8: TPanel;
    Label86: TLabel;
    edtPower: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    edtFrequency: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label81: TLabel;
    Label107: TLabel;
    lblNuclearSubmarine: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    lblConventionalSubmarine: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    lblOtherSubmarine: TLabel;
    Label24: TLabel;
    Label45: TLabel;
    edtSafetyCeilingDepth: TLabel;
    Label48: TLabel;
    Label94: TLabel;
    Panel7: TPanel;
    chkFixDepth: TCheckBox;
    pnlTabGuidance: TPanel;
    Image4: TImage;
    Label49: TLabel;
    Label69: TLabel;
    edtPrimary: TLabel;
    Label93: TLabel;
    edtPursuit: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    edtSeekerRange: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    edtMinRange: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    edtMaxRange: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Panel16: TPanel;
    Panel20: TPanel;
    Label90: TLabel;
    Label84: TLabel;
    Label100: TLabel;
    Label149: TLabel;
    edtDefaultCruiseDepth: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    edtWireAngleOffset: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Panel6: TPanel;
    Label156: TLabel;
    Label157: TLabel;
    edtMinimumRunoutRange: TLabel;
    Label159: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    edtSeekerTurnOnRange: TLabel;
    Label126: TLabel;
    Panel17: TPanel;
    chkRangeOperatorModifable: TCheckBox;
    edtSeekerAzimuth: TLabel;
    Label108: TLabel;
    Label111: TLabel;
    Label121: TLabel;
    edtSeekerElevation: TLabel;
    Label128: TLabel;
    chkSinuationRunout: TCheckBox;
    Panel15: TPanel;
    Label102: TLabel;
    Label129: TLabel;
    edtSinuationPeriod: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    edtSinuationAmplitude: TLabel;
    Label144: TLabel;
    Panel18: TPanel;
    Label145: TLabel;
    Label146: TLabel;
    edtRadius: TLabel;
    Label148: TLabel;
    chkUseTerminalCircle: TCheckBox;
    Panel19: TPanel;
    Label164: TLabel;
    Label165: TLabel;
    edtFirstAngle: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    edtSecondAngle: TLabel;
    Label171: TLabel;
    CheckBox2: TCheckBox;
    chkRadiusOperatorModifable: TCheckBox;
    lblsearch: TLabel;
    edtbomblist: TEdit;
    imgImgBtnBack: TImage;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure ImgBtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);

  private
    FtargetDomainList : TStringList;

    tabIndex, tabMax : Integer;
    FTorpedoList : TList;
    FSelectedTorpedo : TTorpedo_On_Board;

    function SetWeaponCategory(aValue : Integer): string;

  public
    procedure UpdateTabPage;
    procedure UpdateTorpedoList;
    procedure UpdateTorpedoData;
    procedure UpdateMotionData;

    procedure UpdatePrimaryTargetDomainItems;

  end;

var
  frmTorpedoView: TfrmTorpedoView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmTorpedoView.edtCheatKeyPress(Sender: TObject; var Key: Char);
 var
 i : Integer;
  torpedo : TTorpedo_On_Board;
begin
  if Key = #13 then
  begin

  lstTorpedo.Items.Clear;

  dmTTT.GetfilterTorpedoDef(FTorpedoList,edtbomblist.text);
    for i := 0 to FTorpedoList.Count - 1 do
    begin
      torpedo := FTorpedoList.Items[i];
    lstTorpedo.Items.AddObject(Torpedo.FDef.Class_Identifier, torpedo);
    end;
  end;
end;

procedure TfrmTorpedoView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FTorpedoList);
  Action := cafree;
end;

procedure TfrmTorpedoView.FormCreate(Sender: TObject);
begin
 FtargetDomainList := TStringList.Create;
 FTorpedoList := TList.Create;
end;

procedure TfrmTorpedoView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 4;

  UpdateTabPage;
  UpdateTorpedoList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmTorpedoView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTorpedoView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmTorpedoView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmTorpedoView.lbSingleClick(Sender: TObject);
begin
  if lstTorpedo.ItemIndex = -1 then
    Exit;

  FSelectedTorpedo := TTorpedo_On_Board(lstTorpedo.Items.Objects[lstTorpedo.ItemIndex]);

  UpdateTorpedoData;
end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmTorpedoView.UpdateTorpedoData;
var
  motion : TMotion_Characteristics;
begin
  with FSelectedTorpedo do
  begin
    lblName.Caption := FDef.Class_Identifier;

    {$REGION ' General '}

    case FDef.Launch_Method of
      Ord(mTorpedoAimpoint) : edtMethod.Caption := msTorpedoAimpoint;
      Ord(mTorpedoBearing) : edtMethod.Caption := msTorpedoBearing;
      Ord(mTorpedoOr) : edtMethod.Caption := msTorpedoOr;
      Ord(mTorpedoDirect) : edtMethod.Caption := msTorpedoDirect;
    end;

    case FDef.Launch_Speed of
      Ord(icsTorpedoMinimum) : edtInitialCS.Caption := icssTorpedoMinimum;
      Ord(icsTorpedoCruise) : edtInitialCS.Caption := icssTorpedoCruise;
      Ord(icsTorpedoHigh) : edtInitialCS.Caption := icssTorpedoHigh;
      Ord(icsTorpedoMaximum) : edtInitialCS.Caption := icssTorpedoMaximum;
    end;

    edtPower.Caption := FormatFloat('0', FDef.Active_Seeker_Power);
    edtFrequency.Caption := FormatFloat('0', FDef.Active_Seeker_Freq);

    chkAntiSurface.Checked := Boolean(FDef.Anti_Sur_Capable);
    chkAntiSubSurface.Checked := Boolean(FDef.Anti_SubSur_Capable);

    UpdatePrimaryTargetDomainItems;
  //  edtPrimaryTargetDomain.Caption := FtargetDomainList[FDef.Primary_Target_Domain];
    edtPrimaryTargetDomain.Caption := SetWeaponCategory(FDef.Primary_Target_Domain);

    edtSafetyCeilingDepth.Caption := FormatFloat('0', FDef.Acoustic_Torp_Ceiling_Depth);
    chkFixDepth.Checked := Boolean(FDef.Fixed_Ceiling_Depth);

    edtMaxSearchDepth.Caption := FormatFloat('0', FDef.Max_Torpedo_Search_Depth);
    edtDetectabilityType.Caption := FDef.Detectability_Type.ToString;

    trckbrLethality.Position := FDef.Lethality;
    lblLethality.Caption := trckbrLethality.Position.ToString;
    trckbrDamageSustainability.Position := FDef.Damage_Capacity;
    lblDamageSustainability.Caption := trckbrDamageSustainability.Position.ToString;

    lblNuclearSubmarine.Caption := Round(FDef.Opt_Launch_Range_Nuc_Sub * 100).ToString;
//    trckbrNuclearSubmarine.Position := Round(FDef.Opt_Launch_Range_Nuc_Sub * 100);
    lblConventionalSubmarine.Caption := Round(FDef.Opt_Launch_Range_Conv_Sub * 100).ToString;
//    trckbrConventionalSubmarine.Position := Round(FDef.Opt_Launch_Range_Conv_Sub * 100);
    lblOtherSubmarine.Caption := Round(FDef.Opt_Launch_Range_Other * 100).ToString;
//    trckbrOtherSubmarine.Position := Round(FDef.Opt_Launch_Range_Other * 100);
    {$ENDREGION}

    {$REGION ' Physical '}
    UpdateMotionData;

    edtLength.Caption := FormatFloat('0', FDef.Length);
    edtWidth.Caption := FormatFloat('0', FDef.Width);
    edtHeight.Caption := FormatFloat('0', FDef.Height);
    edtEngagementRange.Caption := FormatFloat('0', FDef.Engagement_Range);

    chkAirDropCapable.Checked := Boolean(FDef.Air_Drop_Capable);
    edtLateralDeceleration.Caption := FormatFloat('0.00', FDef.Lateral_Deceleration);
    edtDecentRate.Caption := FormatFloat('0.00', FDef.Airborne_Descent_Rate);

    edtMinimumSpeed.Caption := FormatFloat('0.0', FDef.LSpeed_Acoustic_Intens);
    edtMaximumSpeed.Caption := FormatFloat('0.0', FDef.HSpeed_Acoustic_Intens);
    edtCavitationSpeed.Caption := FormatFloat('0.00', FDef.Cavitation_Switch_Point);
    edtBelowCavitation.Caption := FormatFloat('0.0', FDef.Below_Cav_Acoustic_Intens);
    edtAboveCavitation.Caption := FormatFloat('00.', FDef.Above_Cav_Acoustic_Intens);

    edtAcousticFront.Caption := FormatFloat('0.00', FDef.Front_Acoustic_Cross);
    edtAcousticSide.Caption := FormatFloat('0.00', FDef.Side_Acoustic_Cross);
    {$ENDREGION}

    {$REGION ' POH modifier '}
    trckbrWakeHoming.Position := Round(FDef.WakeHome_POH_Modifier * 100);
    lblWakeHoming.Caption := trckbrWakeHoming.Position.ToString;

    trckbrWireGuided.Position := Round(FDef.WireGuide_POH_Modifier * 100);
    lblWireGuided.Caption := trckbrWireGuided.Position.ToString;

    trckbrActiveAcoustic.Position := Round(FDef.Active_Acoustic_POH_Mod * 100);
    lblActiveAcoustic.Caption := trckbrActiveAcoustic.Position.ToString;

    trckbrPassiveAcoustic.Position := Round(FDef.Passive_Acoustic_POH_Mod * 100);
    lblPassiveAcoustic.Caption := trckbrPassiveAcoustic.Position.ToString;

    trckbrActivePassiveAcoustic.Position := Round(FDef.Active_Passive_POH_Mod * 100);
    lblBothAcoustic.Caption := trckbrActivePassiveAcoustic.Position.ToString;
    {$ENDREGION}

    {$REGION ' Guidance '}
    case FDef.Guidance_Type of
      0: edtPrimary.Caption := prsTorpedoStraight;
      1: edtPrimary.Caption := prsTorpedoActive;
      2: edtPrimary.Caption := prsTorpedoPassive;
      3: edtPrimary.Caption := prsTorpedoOr;
      4: edtPrimary.Caption := prsTorpedoWireGuided;
      5: edtPrimary.Caption := prsTorpedoWakeHoming;
    end;

    case FDef.Pursuit_Guidance_Type of
      0: edtPursuit.Caption := pusTorpedoLead;
      1: edtPursuit.Caption := pusTorpedoPure;
    end;

    edtMinRange.Caption := FormatFloat('0.00', FDef.Min_Range);
    edtMaxRange.Caption := FormatFloat('0.00', FDef.Max_Range);

    edtSeekerTurnOnRange.Caption := FormatFloat('0.00', FDef.Seeker_TurnOn_Range);
    chkRangeOperatorModifable.Checked := Boolean(FDef.Fixed_Seeker_TurnOn_Range);

    edtSeekerRange.Caption := FormatFloat('0.00', FDef.Term_Guide_Range);
    edtSeekerAzimuth.Caption := FormatFloat('0', FDef.Term_Guide_Azimuth);
    edtSeekerElevation.Caption := FormatFloat('0', FDef.Term_Guide_Elevation);

    edtDefaultCruiseDepth.Caption := FormatFloat('0', FDef.Default_Depth);
    edtWireAngleOffset.Caption := FormatFloat('0', FDef.Wire_Angle_Offset);
    edtMinimumRunoutRange.Caption := FormatFloat('0.00', FDef.Min_Runout_Range);

    chkSinuationRunout.Checked := Boolean(FDef.Sinuation_Runout);
    edtSinuationPeriod.Caption := FormatFloat('0', FDef.Runout_Sinuation_Period);
    edtSinuationAmplitude.Caption := FormatFloat('0', FDef.Runout_Sinuation_Amplitude);

    chkUseTerminalCircle.Checked := Boolean(FDef.Use_Terminal_Circle);
    edtRadius.Caption := FormatFloat('0.00', FDef.Terminal_Circle_Radius);
    chkRadiusOperatorModifable.Checked := Boolean(FDef.Fixed_Circle_Radius);

    edtFirstAngle.Caption := FDef.First_Relative_Gyro_Angle.ToString;
//    cbbFirstAngle.ItemIndex := FDef.First_Relative_Gyro_Angle;
    edtSecondAngle.Caption := FDef.Second_Relative_Gyro_Angle.ToString;
//    cbbSecondAngle.ItemIndex := FDef.Second_Relative_Gyro_Angle;

//    btnEditPOH.Enabled := FDef.Torpedo_Index <> 0;
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmTorpedoView.UpdateTorpedoList;
var
  i : Integer;
  torpedo : TTorpedo_On_Board;

begin
  lstTorpedo.Items.Clear;

  dmTTT.GetAllTorpedoDef(FTorpedoList);

  for i := 0 to FTorpedoList.Count - 1 do
  begin
    torpedo := FTorpedoList.Items[i];
    lstTorpedo.Items.AddObject(Torpedo.FDef.Class_Identifier, torpedo);
  end;
end;

procedure TfrmTorpedoView.UpdateTabPage;
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
      lblTab.Caption := 'PHYSICAL';
      pnlTabPhysical.BringToFront;
    end;
    2:
    begin
      lblTab.Caption := 'POH MODIFIER';
      pnlTabPOH.BringToFront;
    end;
    3:
    begin
      lblTab.Caption := 'GUIDANCE';
      pnlTabGuidance.BringToFront;
    end;
    4:
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

procedure TfrmTorpedoView.UpdateMotionData;
var
  motion : TMotion_Characteristics;
begin
  with FSelectedTorpedo do
  begin
    dmTTT.GetMotionCharacteristicDef(FDef.Motion_Index, motion);

    if Assigned(motion) then
      edtMotionCharTorpedo.Caption := motion.FData.Motion_Identifier
    else
      edtMotionCharTorpedo.Caption := 'none';

    motion.Free;
  end;
end;

function TfrmTorpedoView.SetWeaponCategory(aValue: Integer): string;
var
  sValueTemp : string;

begin
  case aValue of
    Byte(wcTorpedoStraigth) : sValueTemp := 'Straight';
    Byte(wcTorpedoActiveAcoustic) : sValueTemp := 'Active Acoustic';
    Byte(wcTorpedoPassiveAcoustic) : sValueTemp := 'Passive Acoustic';
    Byte(wcTorpedoWireGuided) : sValueTemp := 'Wire Guided';
    Byte(wcTorpedoWakeHoming) : sValueTemp := 'Wake Homing';
    Byte(wcTorpedoActivePassive) : sValueTemp := 'Active/Passive';
  end;
  Result := sValueTemp;
end;

procedure TfrmTorpedoView.UpdatePrimaryTargetDomainItems;
begin
  FtargetDomainList.Clear;
  edtPrimaryTargetDomain.Caption := 'none';

  if chkAntiSurface.Checked And chkAntiSubsurface.Checked then
  begin
    FtargetDomainList.Add('Any Within Capabilities');
    FtargetDomainList.Add('Surface');
    FtargetDomainList.Add('SubSurface');
  end
  else if chkAntiSurface.Checked then
  begin
    FtargetDomainList.Add('Surface');
  end
  else if chkAntiSubsurface.Checked then
    FtargetDomainList.Add('SubSurface');
end;

{$ENDREGION}

end.
