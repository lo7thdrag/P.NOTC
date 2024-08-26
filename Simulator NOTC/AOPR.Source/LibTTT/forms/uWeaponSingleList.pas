unit uWeaponSingleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfWeaponSingle = class(TForm)
    lbTempId: TListBox;
    lbSingle: TListBox;
    btnClose: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnRemove: TButton;
    btnUsage: TButton;
    btnFilter: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure refresh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure Definition;
    procedure btnRemoveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure NewDefinition;
  private
    { Private declarations }
  public
    { Public declarations }
    id : string;
    isNew : Boolean;
  end;

var
  fWeaponSingle: TfWeaponSingle;
  mList : TList;

implementation

{$R *.dfm}

uses uSimDBEditor, uDBAsset_Weapon, uDataModuleTTT, uMissileSummary, ufDBEditor,
uTorpedoSummary, uMineSummary, uBombWindow, uGunSummary, uMotionDoubleList;



procedure TfWeaponSingle.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfWeaponSingle.btnCopyClick(Sender: TObject);
begin
  id  := lbTempId.Items.Strings[lbSingle.ItemIndex];

  if lbSingle.Selected[lbSingle.ItemIndex] then
  begin
    if fDBEditor.index = 1 then
    begin
      fMissileSummary.isCopy := True;
      Definition;
      fMissileSummary.Show;
    end
    else if fDBEditor.index = 2 then
    begin
      fTorpedoSummary.isCopy := True;
      Definition;
      fTorpedoSummary.Show;
    end
    else if fDBEditor.index = 3 then
    begin
      fMineSummary.isCopy := True;
      Definition;
      fMineSummary.Show;
    end
    else if fDBEditor.index = 4 then
    begin
      fGunSummary.isCopy := True;
      Definition;
      fGunSummary.Show;
    end
    else if fDBEditor.index = 5 then
    begin
      fBombWindow.isCopy := True;
      Definition;
      fBombWindow.Show;
    end;
  end;
end;

procedure TfWeaponSingle.btnEditClick(Sender: TObject);
begin
  id  := lbTempId.Items.Strings[lbSingle.ItemIndex];

  if fDBEditor.index = 1 then
  begin
    fMissileSummary.isCopy := False;
    Definition;
    fMissileSummary.Show;
  end
  else if fDBEditor.index = 2 then
  begin
    fTorpedoSummary.isCopy := False;
    Definition;
    fTorpedoSummary.Show;
  end
  else if fDBEditor.index = 3 then
  begin
    fMineSummary.isCopy := False;
    Definition;
    fMineSummary.Show;
  end
  else if fDBEditor.index = 4 then
  begin
    fGunSummary.isCopy := False;
    Definition;
    fGunSummary.Show;
  end
  else if fDBEditor.index = 5 then
  begin
    fBombWindow.isCopy := False;
    Definition;
    fBombWindow.Show;
  end;
end;

procedure TfWeaponSingle.btnNewClick(Sender: TObject);
begin
  isNew := True;
  NewDefinition;
end;

procedure TfWeaponSingle.btnRemoveClick(Sender: TObject);
begin
  if fDBEditor.index = 1 then
  begin
    dmTTT.deleteMissile_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end
  else if fDBEditor.index = 2 then
  begin
    dmTTT.deleteTorpedo_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end
  else if fDBEditor.index = 3 then
  begin
    dmTTT.deleteMine_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end
  else if fDBEditor.index = 4 then
  begin
    dmTTT.deleteGun(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end
  else if fDBEditor.index = 5 then
  begin
    dmTTT.deleteBomb(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end;

  refresh;
end;

procedure TfWeaponSingle.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
end;

procedure TfWeaponSingle.FormShow(Sender: TObject);
begin
  if fDBEditor.index = 1 then
    Caption := 'Missile'
  else if fDBEditor.index = 2 then
    Caption := 'Torpedo'
  else if fDBEditor.index = 3 then
    Caption := 'Mine'
  else if fDBEditor.index = 4 then
    Caption := 'Gun'
  else if fDBEditor.index = 5 then
    Caption := 'Bomb';

  refresh;
end;

procedure TfWeaponSingle.refresh;
var
 I: Integer;
begin

  if fDBEditor.index = 1 then
  begin
    uSimDBEditor.getAllMissile(0,mList,fMissileSummary.Missile);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TMissile_On_Board(mList[I]).FDef.Class_Identifier);
      lbTempId.Items.Add(IntToStr(TMissile_On_Board(mList[I]).FDef.Missile_Index));
    end;
  end
  else if fDBEditor.index = 2 then
  begin
    uSimDBEditor.getAllTorpedo(0,mList,fTorpedoSummary.torpedo);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TTorpedo_On_Board(mList[I]).FDef.Class_Identifier);
      lbTempId.Items.Add(IntToStr(TTorpedo_On_Board(mList[I]).FDef.Torpedo_Index));
    end;
  end
  else if fDBEditor.index = 3 then
  begin
    uSimDBEditor.getAllMine(0,mList,fMineSummary.mine);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TMine_On_Board(mList[I]).FMine_Def.Mine_Identifier);
      lbTempId.Items.Add(IntToStr(TMine_On_Board(mList[I]).FMine_Def.Mine_Index));
    end;
  end
  else if fDBEditor.index = 4 then
  begin
    dmTTT.GetGun(0,mList,fGunSummary.gun);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TGun_Definition(mList[I]).FData.Gun_Identifier);
      lbTempId.Items.Add(IntToStr(TGun_Definition(mList[I]).FData.Gun_Index));
    end;
  end
  else if fDBEditor.index = 5 then
  begin
    dmTTT.GetBomb(0,mList,fBombWindow.bomb);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TBomb_Definition(mList[I]).FData.Bomb_Identifier);
      lbTempId.Items.Add(IntToStr(TBomb_Definition(mList[I]).FData.Bomb_Index));
    end;
  end

end;

procedure TfWeaponSingle.Definition;
var i:integer;
begin
  mList.Clear;

  if fDBEditor.fromDBeditor then begin
    if fDBEditor.index = 1 then
       uSimDBEditor.getAllMissile(StrToInt(id),mList,fMissileSummary.Missile);
  end
  else
    uSimDBEditor.getAllMissile(0,mList,fMissileSummary.Missile);

  with fMissileSummary do begin
    with Missile.FDef do begin

      for I := 0 to mList.Count - 1 do
      begin
        if isCopy then
        begin
           edtClassMissile.Text    := 'Copy of ' + TMissile_On_Board(mList[i]).FDef.Class_Identifier;
           isNew := True;
        end
        else
           edtClassMissile.Text    := TMissile_On_Board(mList[i]).FDef.Class_Identifier;
        edtMaxAltitude.Text                 := IntToStr(TMissile_On_Board(mList[i]).FDef.Max_Target_Altitude_Delta);
        edtLethality.Text                   := IntToStr(TMissile_On_Board(mList[i]).FDef.Lethality);
        edtDamage.Text                      := IntToStr(TMissile_On_Board(mList[i]).FDef.Damage_Capacity);
        edtLengthDimension.Text             := FloatToStr(TMissile_On_Board(mList[i]).FDef.Length);
        edtWidthDimension.Text              := FloatToStr(TMissile_On_Board(mList[i]).FDef.Width);
        edtHeightDimension.Text             := FloatToStr(TMissile_On_Board(mList[i]).FDef.Height);
        edtEngagementRangeDimension.Text    := FloatToStr(TMissile_On_Board(mList[i]).FDef.Engagement_Range);
        edtRangeBooster.Text                := FloatToStr(TMissile_On_Board(mList[i]).FDef.Booster_Separation_Range);
        edtBoxWeightBooster.Text            := FloatToStr(TMissile_On_Board(mList[i]).FDef.Booster_Separation_Box_Width);
        edtBoxHeightBooster.Text            := FloatToStr(TMissile_On_Board(mList[i]).FDef.Booster_Separation_Box_Length);
        edtFrontRadarPhysical.Text          := FloatToStr(TMissile_On_Board(mList[i]).FDef.Front_Radar_Cross);
        edtSideRadarPhysical.Text           := FloatToStr(TMissile_On_Board(mList[i]).FDef.Side_Radar_Cross);
        edtFrontVisualPhysical.Text         := FloatToStr(TMissile_On_Board(mList[i]).FDef.Front_Visual_Cross);
        edtSideVisualPhysical.Text          := FloatToStr(TMissile_On_Board(mList[i]).FDef.Side_Visual_Cross);
        edtFrontInfraredPhysical.Text       := FloatToStr(TMissile_On_Board(mList[i]).FDef.Front_Infrared_Cross);
        edtSideInfraredPhysical.Text        := FloatToStr(TMissile_On_Board(mList[i]).FDef.Side_Infrared_Cross);
        edtFreqTerminalTARH.Text            := FloatToStr(TMissile_On_Board(mList[i]).FDef.Transmitted_Frequency);
        edtAntiRadiationMissile.Text        := FloatToStr(TMissile_On_Board(mList[i]).FDef.AR_POH_Modifier);
        edtInfraredMissile.Text             := FloatToStr(TMissile_On_Board(mList[i]).FDef.IR_POH_Modifier);
        edtSARHMissile.Text                 := FloatToStr(TMissile_On_Board(mList[i]).FDef.SARH_POH_Modifier);
        edtTARHMissile.Text                 := FloatToStr(TMissile_On_Board(mList[i]).FDef.TARH_POH_Modifier);
        edtMinRangeGuide.Text               := FloatToStr(TMissile_On_Board(mList[i]).FDef.Min_Range);
        edtMaxRangeGuide.Text               := FloatToStr(TMissile_On_Board(mList[i]).FDef.Max_Range);
        edtRangeFlyGuide.Text               := FloatToStr(TMissile_On_Board(mList[i]).FDef.Fly_Out_Range);
        edtAltitudeFlyGuide.Text            := FloatToStr(TMissile_On_Board(mList[i]).FDef.Fly_Out_Altitude);
        edtStartRangeTerminalGuidance.Text  := FloatToStr(TMissile_On_Board(mList[i]).FDef.Terminal_Sinuation_Start_Range);
        edtAltitudeTerminalGuidance.Text    := FloatToStr(TMissile_On_Board(mList[i]).FDef.Terminal_Acquisition_Altitude);
        edtPeriodTerminalGuidance.Text      := FloatToStr(TMissile_On_Board(mList[i]).FDef.Terminal_Sinuation_Period);
        edtRangeSeekerTurnGuidance.Text          := FloatToStr(TMissile_On_Board(mList[i]).FDef.Seeker_TurnOn_Range);
        edtRangeSeekerDetectionGuidance.Text     := FloatToStr(TMissile_On_Board(mList[i]).FDef.Term_Guide_Range);
        edtAzimuthSeekerDetectionGuidance.Text   := FloatToStr(TMissile_On_Board(mList[i]).FDef.Term_Guide_Azimuth);
        edtElevationSeekerDetectionGuidance.Text := FloatToStr(TMissile_On_Board(mList[i]).FDef.Term_Guide_Elevation);
        edtCommandAltitudeGuidance.Text          := FloatToStr(TMissile_On_Board(mList[i]).FDef.Terminal_Pop_Up_Altitude);
        edtmaxNumWaypointGuidance.Text           := FloatToStr(TMissile_On_Board(mList[i]).FDef.Max_Num_Wpts);
        edtMinFinalWaypointGuidance.Text         := FloatToStr(TMissile_On_Board(mList[i]).FDef.Min_Final_Leg_Length);
        edtMaxFiringGuidance.Text                := FloatToStr(TMissile_On_Board(mList[i]).FDef.Max_Firing_Depth);
        edtDefaultCruiseGuidance.Text            := FloatToStr(TMissile_On_Board(mList[i]).FDef.Default_Altitude);
        edtRangeTARH.Text                        := IntToStr(TMissile_On_Board(mList[i]).FDef.Spot_Number);
        edtPulseRepTerminalTARH.Text             := FloatToStr(TMissile_On_Board(mList[i]).FDef.Pulse_Rep_Freq);
        edtPulseWidthTerminalTARH.Text           := FloatToStr(TMissile_On_Board(mList[i]).FDef.Pulse_Width);
        edtScanRateTerminalTARH.Text             := FloatToStr(TMissile_On_Board(mList[i]).FDef.Scan_Rate);
        edtTransmitterPowerTerminalTARH.Text     := FloatToStr(TMissile_On_Board(mList[i]).FDef.Xmit_Power);
        edtLowerLimitReceivedFreqTARH.Text       := FloatToStr(TMissile_On_Board(mList[i]).FDef.Lower_Received_Freq);
        edtUpperLimitReceivedFreqTARH.Text       := FloatToStr(TMissile_On_Board(mList[i]).FDef.Upper_Received_Freq);
        EditProbability.Text                     := FloatToStr(TMissile_On_Board(mList[i]).FDef.Prob_of_Hit);
        uSimDBEditor.getMotion_Characteristics(TMissile_On_Board(mlist[i]).FDef.Motion_Index,fMotionDouble.motion);
        edtMotionCharacteristic.Text             := fMotionDouble.motion.FData.Motion_Identifier;

        if TMissile_On_Board(mList[i]).FDef.Anti_Air_Capable = 1 then
          cbxAntiAir.Checked := True
        else
          cbxAntiAir.Checked := False;

        if TMissile_On_Board(mList[i]).FDef.Anti_Sur_Capable = 1 then
          cbxAntiSurface.Checked := True
        else
          cbxAntiSurface.Checked := False;

        if TMissile_On_Board(mList[i]).FDef.Anti_SubSur_Capable = 1 then
          cbxAntiSubsurface.Checked := True
        else
          cbxAntiSubsurface.Checked := False;

        if TMissile_On_Board(mList[i]).FDef.Anti_Land_Capable = 1 then
          cbxAntiLand.Checked := True
        else
          cbxAntiLand.Checked := False;

        if TMissile_On_Board(mList[i]).FDef.Home_On_Jam_Type_A_Capable = 1 then
           cbxTypeA.Checked := True
        else
          cbxTypeA.Checked := False;

        if TMissile_On_Board(mList[i]).FDef.Home_On_Jam_Type_B_Capable = 1 then
          cbxTypeB.Checked := True
        else
          cbxTypeB.Checked := False;

        if TMissile_On_Board(mList[i]).FDef.Home_On_Jam_Type_C_Capable = 1 then
          cbxTypeC.Checked := True
        else
          cbxTypeC.Checked := False;

        if TMissile_On_Board(mList[i]).FDef.Terminal_Guidance_Capability = 1 then
          cbxTerminalAcqGuidance.Checked := True
        else
          cbxTerminalAcqGuidance.Checked := False;

        if TMissile_On_Board(mList[i]).FDef.Fly_Out_Required = 1 then
          cbxFlyOutRequired.Checked := True
        else
          cbxFlyOutRequired.Checked := False;

        if TMissile_On_Board(mList[i]).FDef.Wpt_Capable = 1 then
          cbxWaypointUserGuidance.Checked := True
        else
          cbxWaypointUserGuidance.Checked := False;

        if TMissile_On_Board(mList[i]).FDef.Launch_Method = 0 then
           cbMethod.Text := 'Aimpoint Only Launch'
        else if TMissile_On_Board(mList[i]).FDef.Launch_Method = 1 then
           cbMethod.Text := 'Bearing Only Launch'
        else if TMissile_On_Board(mList[i]).FDef.Launch_Method = 2 then
           cbMethod.Text := 'Aimpoint or Bearing Only Launch'
        else
           cbMethod.Text := 'Direct Launch';

        if TMissile_On_Board(mList[i]).FDef.Launch_Speed = 0 then
           cbInitialCommanded.Text := 'Minimum'
        else if TMissile_On_Board(mList[i]).FDef.Launch_Speed = 1 then
           cbInitialCommanded.Text := 'Cruise'
        else if TMissile_On_Board(mList[i]).FDef.Launch_Speed = 2 then
           cbInitialCommanded.Text := 'High'
        else
           cbInitialCommanded.Text := 'Maximum';

        if TMissile_On_Board(mList[i]).FDef.Primary_Target_Domain = 0 then
           cbPrimaryTarget.Text := 'Air to Surface'
        else if TMissile_On_Board(mList[i]).FDef.Primary_Target_Domain = 1 then
           cbPrimaryTarget.Text := 'Surface/Subsurface to Surface/Subsurface'
        else if TMissile_On_Board(mList[i]).FDef.Primary_Target_Domain = 2 then
           cbPrimaryTarget.Text := 'Surface/Subsurface to Air'
        else if TMissile_On_Board(mList[i]).FDef.Primary_Target_Domain = 3 then
           cbPrimaryTarget.Text := 'Air to Air'
        else
           cbPrimaryTarget.Text := 'Land Attack';

        if TMissile_On_Board(mList[i]).FDef.Detectability_Type = 0 then
           cbDetectabilityType.Text := 'Normal Detection'
        else if TMissile_On_Board(mList[i]).FDef.Detectability_Type = 1 then
           cbDetectabilityType.Text := 'Undetectable'
        else if TMissile_On_Board(mList[i]).FDef.Detectability_Type = 2 then
           cbDetectabilityType.Text := 'Passive Detection'
        else
           cbDetectabilityType.Text := 'Always Visible';

        if TMissile_On_Board(mList[i]).FDef.Mid_Course_Update_Mode = 0 then
           cbMidCourse.Text := 'Switch Missile Target Designation'
        else if TMissile_On_Board(mList[i]).FDef.Mid_Course_Update_Mode = 1 then
           cbMidCourse.Text := 'Change Cruise Phase Waypoints'
        else if TMissile_On_Board(mList[i]).FDef.Mid_Course_Update_Mode = 2 then
           cbMidCourse.Text := 'None'
        else if TMissile_On_Board(mList[i]).FDef.Mid_Course_Update_Mode = 2 then
           cbMidCourse.Text := 'HF'
        else if TMissile_On_Board(mList[i]).FDef.Mid_Course_Update_Mode = 2 then
           cbMidCourse.Text := 'UHF'
        else
           cbMidCourse.Text := 'SATCOM';

        if TMissile_On_Board(mList[i]).FDef.Primary_Guide_Type = 0 then
           cbPrimaryLaunchGuidance.Text := 'Semi-Active Radar Homing'
        else if TMissile_On_Board(mList[i]).FDef.Primary_Guide_Type = 1 then
           cbPrimaryLaunchGuidance.Text := 'Terminal-Active Radar Homing'
        else if TMissile_On_Board(mList[i]).FDef.Primary_Guide_Type = 2 then
           cbPrimaryLaunchGuidance.Text := 'Infrared Homing'
        else if TMissile_On_Board(mList[i]).FDef.Primary_Guide_Type = 3 then
           cbPrimaryLaunchGuidance.Text := 'Anti-Radiation'
        else if TMissile_On_Board(mList[i]).FDef.Primary_Guide_Type = 4 then
            cbPrimaryLaunchGuidance.Text := 'Straight'
        else
           cbPrimaryLaunchGuidance.Text := 'Hybrid(Stand-off ASW)';

        if TMissile_On_Board(mList[i]).FDef.Secondary_Guide_Type = 0 then
           cbSecondaryLaunchGuidance.Text := 'None'
        else if TMissile_On_Board(mList[i]).FDef.Secondary_Guide_Type = 1 then
           cbSecondaryLaunchGuidance.Text := 'Infrared Homing'
        else
           cbSecondaryLaunchGuidance.Text := 'Anti-Radiation';

        if TMissile_On_Board(mList[i]).FDef.Pursuit_Guide_Type = 0 then
           cbPursuitLaunchGuidance.Text := 'Lead'
        else
           cbPursuitLaunchGuidance.Text := 'Pure';
      end;
    end;
  end;

  if fDBEditor.fromDBeditor then
  begin
    if fDBEditor.index = 2 then
      uSimDBEditor.getAllTorpedo(StrToInt(id),mList,fTorpedoSummary.torpedo);
  end
  else
     uSimDBEditor.getAllTorpedo(0,mList,fTorpedoSummary.torpedo);
  with fTorpedoSummary do begin
    with torpedo.FDef do begin
      for I := 0 to mList.Count - 1 do
      begin
        if isCopy then
        begin
          edtClassTorpedo.Text   := 'Copy of ' + TTorpedo_On_Board(mList[i]).FDef.Class_Identifier;
          isNew := True;
        end
        else
          edtClassTorpedo.Text   := TTorpedo_On_Board(mList[i]).FDef.Class_Identifier;
        edtLethality.Text               := IntToStr(TTorpedo_On_Board(mList[i]).FDef.Lethality);
        edtMaxSearchDepth.Text          := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Default_Depth);
        edtDamage.Text                  := IntToStr(TTorpedo_On_Board(mList[i]).FDef.Damage_Capacity);
        edtLengthDimension.Text         := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Length);
        edtWidthDimension.Text          := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Width);
        edtHeightDimension.Text         := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Height);
        edtEngagementRangeDimension.Text    := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Engagement_Range);
        uSimDBEditor.getMotion_Characteristics(TTorpedo_On_Board(mlist[i]).FDef.Motion_Index,fMotionDouble.motion);
        edtMotionCharacteristic.Text             := fMotionDouble.motion.FData.Motion_Identifier;
        edtLateralDecelerationAirDrop.Text  := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Lateral_Deceleration);
        edtDecentRateAirDrop.Text           := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Airborne_Descent_Rate);
        edtFrontAcousticCross.Text          := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Front_Acoustic_Cross);
        edtSideAcousticCross.Text           := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Side_Acoustic_Cross);
        edtWakeHoming.Text                  := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.WakeHome_POH_Modifier);
        edtWireGuided.Text                  := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.WireGuide_POH_Modifier);
        edtActiveAccoustic.Text             := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Active_Acoustic_POH_Mod);
        edtPassiveAccoustic.Text            := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Passive_Acoustic_POH_Mod);
        edtRangeSeekerDetectionGuide.Text   := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Term_Guide_Range);
        edtAzimuthSeekerDetectionGuide.Text := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Term_Guide_Azimuth);
        edtPeriodSinuation.Text             := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Runout_Sinuation_Period);
        edtAmplitudeSinuation.Text          := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Runout_Sinuation_Amplitude);
        edtMinRangeGuidance.Text            := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Min_Range);
        edtMaxRangeGuidance.Text            := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Max_Range);
             //   .edtDepthSafetyCeiling.Text          := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.D);
        edtPower.Text                       := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Active_Seeker_Power);
        edtFreq.Text                        := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Active_Seeker_Freq);
        edtNuclearSubmarine.Text            := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Opt_Launch_Range_Nuc_Sub);
        edtConvSubmarine.Text               := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Opt_Launch_Range_Conv_Sub);
        edtOtherSubmarine.Text              := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Opt_Launch_Range_Other);
        edtMinSpeedAccoustic.Text           := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.LSpeed_Acoustic_Intens);
        edtBelowCavitationAccoustic.Text    := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Below_Cav_Acoustic_Intens);
        edtAboveCavitationAccoustic.Text    := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Above_Cav_Acoustic_Intens);
        edtCavitationSpeedAccoustic.Text    := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Cavitation_Switch_Point);
        edtMaxSpeedAccoustic.Text           := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.HSpeed_Acoustic_Intens);
        edtActPassAccoustic.Text              := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Active_Passive_POH_Mod);
        edtElevationSeekerDetectionGuide.Text := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Term_Guide_Elevation);
        edtMinRunoutGuidance.Text             := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Min_Runout_Range);
        edtDefaultCruiseGuidance.Text         := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Default_Depth);
        edtWireAngleGuidance.Text             := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Wire_Angle_Offset);
        edtRangeSeekerTurnOnGuidance.Text     := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Seeker_TurnOn_Range);
        edtRadiusGuidance.Text                := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Terminal_Circle_Radius);

        if TTorpedo_On_Board(mList[i]).FDef.Anti_Sur_Capable = 1 then
          cbxAntiSurface.Checked := True
        else
          cbxAntiSurface.Checked := False;

        if TTorpedo_On_Board(mList[i]).FDef.Anti_SubSur_Capable = 1 then
          cbxAntiSubsurface.Checked := True
        else
          cbxAntiSubsurface.Checked := False;

        if TTorpedo_On_Board(mList[i]).FDef.Fixed_Circle_Radius = 1 then
          cbxRadiusOperatorGuidance.Checked := True
        else
          cbxRadiusOperatorGuidance.Checked := False;

        if TTorpedo_On_Board(mList[i]).FDef.Sinuation_Runout = 1 then
          cbxSinuationRunout.Checked := True
        else
          cbxSinuationRunout.Checked := False;

        if TTorpedo_On_Board(mList[i]).FDef.Use_Terminal_Circle = 1 then
          cbxUseTerminalCircle.Checked  := True
        else
          cbxUseTerminalCircle.Checked  := False;

        if TTorpedo_On_Board(mList[i]).FDef.Launch_Method = 0 then
          cbMethod.Text := 'Aimpoint Only Launch'
        else if TTorpedo_On_Board(mList[i]).FDef.Launch_Method = 1 then
          cbMethod.Text := 'Bearing Only Launch'
        else if TTorpedo_On_Board(mList[i]).FDef.Launch_Method = 2 then
          cbMethod.Text := 'Aimpoint or Bearing Only Launch'
        else
          cbMethod.Text := 'Direct Launch';

        if TTorpedo_On_Board(mList[i]).FDef.Launch_Speed = 0 then
          cbInitialCommanded.Text := 'Minimum'
        else if TTorpedo_On_Board(mList[i]).FDef.Launch_Speed = 1 then
          cbInitialCommanded.Text := 'Cruise'
        else if TTorpedo_On_Board(mList[i]).FDef.Launch_Speed = 2 then
          cbInitialCommanded.Text := 'High'
        else
          cbInitialCommanded.Text := 'Maximum';

        if TTorpedo_On_Board(mList[i]).FDef.Primary_Target_Domain = 0 then
          cbPrimaryTarget.Text := 'Air to Surface/Subsurface'
        else if TTorpedo_On_Board(mList[i]).FDef.Primary_Target_Domain = 1 then
          cbPrimaryTarget.Text := 'Surface/Subsurface to Surface/Subsurface'
        else if TTorpedo_On_Board(mList[i]).FDef.Primary_Target_Domain = 2 then
          cbPrimaryTarget.Text := 'Surface/Subsurface to Air'
        else if TTorpedo_On_Board(mList[i]).FDef.Primary_Target_Domain = 3 then
          cbPrimaryTarget.Text := 'Air to Air'
        else
          cbPrimaryTarget.Text := 'Land Attack';

        if TTorpedo_On_Board(mList[i]).FDef.Detectability_Type = 0 then
          cbDetectabilityType.Text := 'Normal Detection'
        else if TTorpedo_On_Board(mList[i]).FDef.Detectability_Type = 1 then
          cbDetectabilityType.Text := 'Undetectable'
        else if TTorpedo_On_Board(mList[i]).FDef.Detectability_Type = 2 then
          cbDetectabilityType.Text := 'Passive Detection'
        else
          cbDetectabilityType.Text := 'Always Visible';
      end;
    end;
  end;

  if fDBEditor.fromDBeditor then begin
    if fDBEditor.index = 3 then
     uSimDBEditor.getAllMine(StrToInt(id),mList,fMineSummary.mine);
  end
  else
    uSimDBEditor.getAllMine(0,mList,fMineSummary.mine);
  with fMineSummary do begin
    with mine.FMine_Def do begin
      for I := 0 to mList.Count - 1 do
      begin
        if isCopy then
        begin
          edtClassMine.Text   := 'Copy of ' + TMine_On_Board(mList[i]).FMine_Def.Mine_Identifier;
          isNew := True;
        end
        else
          edtClassMine.Text                := TMine_On_Board(mList[i]).FMine_Def.Mine_Identifier;
        edtLethality.Text                := IntToStr(TMine_On_Board(mList[i]).FMine_Def.Mine_Lethality);
        edtMaxLayingDepth.Text           := FloatToStr(TMine_On_Board(mList[i]).FMine_Def.Max_Laying_Depth);
        edtLengthDimension.Text          := FloatToStr(TMine_On_Board(mList[i]).FMine_Def.Length);
        edtWidthDimension.Text           := FloatToStr(TMine_On_Board(mList[i]).FMine_Def.Width);
        edtHeightDimension.Text          := FloatToStr(TMine_On_Board(mList[i]).FMine_Def.Height);
        edtEngagementRangeDimension.Text := FloatToStr(TMine_On_Board(mList[i]).FMine_Def.Engagement_Range);
        edtFrontRadarPhysical.Text       := FloatToStr(TMine_On_Board(mList[i]).FMine_Def.Front_Acoustic_Cross);
        edtSideRadarPhysical.Text        := FloatToStr(TMine_On_Board(mList[i]).FMine_Def.Side_Acoustic_Cross);

        if TMine_On_Board(mList[i]).FMine_Def.Platform_Category = 0 then
          cbCategory.Text := 'Accoustic'
        else if TMine_On_Board(mList[i]).FMine_Def.Platform_Category = 1 then
          cbCategory.Text := 'Impact'
        else if TMine_On_Board(mList[i]).FMine_Def.Platform_Category = 1 then
          cbCategory.Text := 'Magnetic'
        else
          cbCategory.Text := 'Pressure';

        if TMine_On_Board(mList[i]).FMine_Def.Detectability_Type = 0 then
          cbDetectabilityType.Text := 'Normal Detection'
        else if TMine_On_Board(mList[i]).FMine_Def.Detectability_Type = 1 then
          cbDetectabilityType.Text := 'Undetectable'
        else if TMine_On_Board(mList[i]).FMine_Def.Detectability_Type = 2 then
          cbDetectabilityType.Text := 'Passive Detection'
        else
          cbDetectabilityType.Text := 'Always Visible';

        if TMine_On_Board(mList[i]).FMine_Def.Anti_Sur_Capable = 0 then
          cbxAntiSurface.Checked := False
        else
          cbxAntiSurface.Checked := True;

        if TMine_On_Board(mList[i]).FMine_Def.Anti_SubSur_Capable = 0 then
          cbxAntiSubSurface.Checked := False
        else
          cbxAntiSubSurface.Checked := True;

        if TMine_On_Board(mList[i]).FMine_Def.Mooring_Type = 0 then
          cbMooringType.Text := 'Fixed'
        else
          cbMooringType.Text := 'Floating';
      end;
    end;
  end;

  if fDBEditor.fromDBeditor then begin
    if fDBEditor.index = 4 then
     dmTTT.GetGun(StrToInt(id),mList,fGunSummary.gun);
  end
  else
     dmTTT.GetGun(0,mList,fGunSummary.gun);
  with fGunSummary do begin
    with gun.FData do begin
      for I := 0 to mList.Count - 1 do
      begin
        if isCopy then
        begin
          edtClassGun.Text   := 'Copy of '+ Gun_Identifier;
          isNew := True;
        end
        else
          edtClassGun.Text              := Gun_Identifier;
        edtLethality.Text             := IntToStr(Lethality_per_Round);
        edtMinforAirTargetRange.Text  := FloatToStr(Air_Min_Range);
        edtMaxforAirTargetRange.Text  := FloatToStr(Air_Max_Range);
        edtMinforSurfaceRange.Text    := FloatToStr(Min_Range);
        edtRateOfFire.Text            := IntToStr(Rate_of_Fire);
        edtMaxAltitude.Text           := FloatToStr(Max_Target_Altitude_Delta);
        edtAverageShell.Text          := FloatToStr(Gun_Average_Shell_Velocity);
        edtMaxforSurfaceRange.Text    := FloatToStr(Max_Range);

        if Gun_Category = 0 then
          cbCategory.Text := 'Close-In-Weapon System'
        else if Gun_Category = 1 then
          cbCategory.Text := 'Gun'
        else
          cbCategory.Text := 'Rocket';

        if Anti_Sur_Capable = 1 then
          cbxAntiSurface.Checked := True
        else
          cbxAntiSurface.Checked := False;

        if Anti_Land_Capable = 1 then
          cbxAntiLand.Checked := True
        else
          cbxAntiLand.Checked := False;

        if TGun_Definition(mList[i]).FData.Anti_Air_Capable = 1 then
          cbxAntiAir.Checked := True
        else
          cbxAntiAir.Checked := False;
       end;
    end;
  end;

  if fDBEditor.fromDBeditor then begin
    if fDBEditor.index = 5 then
     dmTTT.GetBomb((StrToInt(id)),mList,fBombWindow.bomb);
  end
  else
     dmTTT.GetBomb(0,mList,fBombWindow.bomb);
  with fBombWindow do begin
    with bomb.FData do begin
      for I := 0 to mList.Count - 1 do
      begin
        if isCopy then
        begin
          edtClass.Text     := 'Copy of ' + TBomb_Definition(mList[i]).FData.Bomb_Identifier;
          isNew := True;
        end
        else
          edtClass.Text     := TBomb_Definition(mList[i]).FData.Bomb_Identifier;
        edtRangeMin.Text  := FloatToStr(TBomb_Definition(mList[i]).FData.Min_Range);
        edtRangeMax.Text  := FloatToStr(TBomb_Definition(mList[i]).FData.Max_Range);
        edtLethality.Text := IntToStr(TBomb_Definition(mList[i]).FData.Lethality);

        if TBomb_Definition(mList[i]).FData.Bomb_Type = 0 then
          cbbType.Text := 'Bomb'
        else
          cbbType.Text := 'Depth Charge';
      end;
    end;
  end
end;

procedure TfWeaponSingle.NewDefinition;
begin

  if fDBEditor.index = 1 then
  begin

    with fMissileSummary do
    begin
      edtClassMissile.Text                := '';
      edtMaxAltitude.Text                 := '';
      edtLethality.Text                   := '';
      edtDamage.Text                      := '';
      edtLengthDimension.Text             := '';
      edtWidthDimension.Text              := '';
      edtHeightDimension.Text             := '';
      edtEngagementRangeDimension.Text    := '';
      edtRangeBooster.Text                := '';
      edtBoxWeightBooster.Text            := '';
      edtBoxHeightBooster.Text            := '';
      edtFrontRadarPhysical.Text          := '';
      edtSideRadarPhysical.Text           := '';
      edtFrontVisualPhysical.Text         := '';
      edtSideVisualPhysical.Text          := '';
      edtFrontInfraredPhysical.Text       := '';
      edtSideInfraredPhysical.Text        := '';
      edtFreqTerminalTARH.Text            := '';
      edtAntiRadiationMissile.Text        := '';
      edtInfraredMissile.Text             := '';
      edtSARHMissile.Text                 := '';
      edtTARHMissile.Text                 := '';
      edtMinRangeGuide.Text               := '';
      edtMaxRangeGuide.Text               := '';
      edtRangeFlyGuide.Text               := '';
      edtAltitudeFlyGuide.Text            := '';
      edtStartRangeTerminalGuidance.Text  := '';
      edtAltitudeTerminalGuidance.Text    := '';
      edtPeriodTerminalGuidance.Text      := '';
      edtRangeSeekerTurnGuidance.Text          := '';
      edtRangeSeekerDetectionGuidance.Text     := '';
      edtAzimuthSeekerDetectionGuidance.Text   := '';
      edtElevationSeekerDetectionGuidance.Text := '';
      edtCommandAltitudeGuidance.Text          := '';
      edtmaxNumWaypointGuidance.Text           := '';
      edtMinFinalWaypointGuidance.Text         := '';
      edtMaxFiringGuidance.Text                := '';
      edtDefaultCruiseGuidance.Text            := '';
      edtRangeTARH.Text                        := '';
      edtPulseRepTerminalTARH.Text             := '';
      edtPulseWidthTerminalTARH.Text           := '';
      edtScanRateTerminalTARH.Text             := '';
      edtTransmitterPowerTerminalTARH.Text     := '';
      edtLowerLimitReceivedFreqTARH.Text       := '';
      edtUpperLimitReceivedFreqTARH.Text       := '';
      cbxAntiAir.Checked := False;
      cbxAntiSurface.Checked := False;
      cbxAntiSubsurface.Checked := False;
      cbxAntiLand.Checked := False;
      cbxTypeA.Checked := False;
      cbxTypeB.Checked := False;
      cbxTypeC.Checked := False;
      cbxHybridTorpedo.Checked := False;
      cbxBoosterSeparation.Checked := False;
      cbxFlyOutRequired.Checked := False;
      cbxRangeSeekerTurnGuidance.Checked := False;
      cbxTerminalAcqGuidance.Checked := False;
      cbxWaypointUserGuidance.Checked := False;

      Show;
    end;
    Close;
  end
  else if fDBEditor.index = 2 then
  begin
    with fTorpedoSummary do begin
      edtClassTorpedo.Text            := '';
      edtLethality.Text               := '';
      edtMaxSearchDepth.Text          := '';
      edtDamage.Text                  := '';
      edtLengthDimension.Text         := '';
      edtWidthDimension.Text          := '';
      edtHeightDimension.Text         := '';
      edtEngagementRangeDimension.Text    := '';
      edtMotionCharacteristic.Text        := '';
      edtLateralDecelerationAirDrop.Text  := '';
      edtDecentRateAirDrop.Text           := '';
      edtFrontAcousticCross.Text          := '';
      edtSideAcousticCross.Text           := '';
      edtWakeHoming.Text                  := '';
      edtWireGuided.Text                  := '';
      edtActiveAccoustic.Text             := '';
      edtPassiveAccoustic.Text            := '';
      edtRangeSeekerDetectionGuide.Text   := '';
      edtAzimuthSeekerDetectionGuide.Text := '';
      edtPeriodSinuation.Text             := '';
      edtAmplitudeSinuation.Text          := '';
      edtMinRangeGuidance.Text            := '';
      edtMaxRangeGuidance.Text            := '';
      edtRadiusGuidance.Text              := '';
      edtDepthSafetyCeiling.Text          := '';
      edtPower.Text                       := '';
      edtFreq.Text                        := '';
      edtNuclearSubmarine.Text            := '';
      edtConvSubmarine.Text               := '';
      edtOtherSubmarine.Text              := '';
      edtMinSpeedAccoustic.Text           := '';
      edtBelowCavitationAccoustic.Text    := '';
      edtAboveCavitationAccoustic.Text    := '';
      edtCavitationSpeedAccoustic.Text    := '';
      edtMaxSpeedAccoustic.Text           := '';
      edtActPassAccoustic.Text              := '';
      edtElevationSeekerDetectionGuide.Text := '';
      edtMinRunoutGuidance.Text             := '';
      edtRangeSeekerTurnOnGuidance.Text     := '';
      edtDefaultCruiseGuidance.Text         := '';
      edtWireAngleGuidance.Text             := '';
      cbMethod.Clear;
      cbInitialCommanded.Clear;
      cbPrimaryTarget.Clear;
      cbDetectabilityType.Clear;
      cbxAirDropCapable.Checked := False;
      cbPrimaryLaunchGuidance.Clear;
      cbPursuitLaunchGuidance.Clear;
      cbxSinuationRunout.Checked := False;
      cbxRadiusOperatorGuidance.Checked := False;
      cbxAntiSurface.Checked := False;
      cbxAntiSubSurface.Checked := False;
      cbxUseTerminalCircle.Checked := False;
      cbxRangeSeekerTurnOnGuidance.Checked := False;
      cbxrealtiveGyroAnglesGuidance.Checked := False;
      cbxFirstGyroAngelsGuidance.Clear;
      cbxSecondGyroAngelsGuidance.Clear;
      cbxFixDepth.Checked := False;

      Show;
    end;
    Close;
  end
  else if fDBEditor.index = 3 then
  begin
    with fMineSummary do
    begin
      edtClassMine.Text                := '';
      edtLethality.Text                := '';
      edtMaxLayingDepth.Text           := '';
      edtLengthDimension.Text          := '';
      edtWidthDimension.Text           := '';
      edtHeightDimension.Text          := '';
      edtEngagementRangeDimension.Text := '';
      edtFrontRadarPhysical.Text       := '';
      edtSideRadarPhysical.Text        := '';
      cbCategory.Clear;
      cbMooringType.Clear;
      cbxAntiSurface.Checked := False;
      cbxAntiSubSurface.Checked := False;
      cbDetectabilityType.Clear;
      cbFrontRadarPhysical.Clear;
      cbSideRadarPhysical.Clear;
      Show;
    end;
    Close;
  end
  else if fDBEditor.index = 4 then
  begin

    with fGunSummary do begin
      edtClassGun.Text              := '';
      edtLethality.Text             := '';
      edtMinforAirTargetRange.Text  := '';
      edtMaxforAirTargetRange.Text  := '';
      edtMinforSurfaceRange.Text    := '';
      edtRateOfFire.Text            := '';
      edtMaxAltitude.Text           := '';
      edtAverageShell.Text          := '';
      edtMaxforSurfaceRange.Text    := '';
      cbCategory.Clear;
      cbxAntiSurface.Checked := False;
      cbxDeployingChaff.Checked := False;
      cbxFireControl.Checked := False;
      cbxAntiLand.Checked := False;
      cbxAutofireMode.Checked := False;
      cbxAntiAir.Checked := False;
      Show;
    end;
    Close;
  end
  else if fDBEditor.index = 5 then
  begin

    with fBombWindow do
    begin
      fBombWindow.edtClass.Text     := '';
      edtRangeMin.Text  := '';
      edtRangeMax.Text  := '';
      edtLethality.Text := '';
      cbbType.Clear;
      Show;
    end;
    Close;

  end
end;


end.
