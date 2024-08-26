unit uWeaponSingleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBAssetObject;

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
    procedure lbSingleClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure lbSingleDblClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    id : string;
    isNew : Boolean;
    show_from : Integer;
  end;

var
  fWeaponSingle: TfWeaponSingle;
  mList : TList;

implementation

{$R *.dfm}

uses uSimDBEditor, uDBAsset_Weapon, uDataModuleTTT, ufrmSummaryMissile, ufrmAdminMainForm,
ufrmSummaryTorpedo, ufrmSummaryMine, ufrmSummaryBomb, ufrmSummaryGun, uMotionDoubleList,
ufrmMissileOnBoardPickList,ufrmTorpedoOnBoardPickList, ufrmMineOnBoardPickList, ufrmGunOnBoardPickList
, ufrmBombOnBoardPickList,
  ufrmUsage, uBaseCoordSystem;



procedure TfWeaponSingle.btnCloseClick(Sender: TObject);
begin
//  btnCopy.Enabled   := false;
//  btnEdit.Enabled   := false;
//  btnRemove.Enabled := false;
//  btnUsage.Enabled  := false;
//  btnClose.Enabled  := false;
  Close;
end;

procedure TfWeaponSingle.btnCopyClick(Sender: TObject);
begin
  if lbSingle.ItemIndex <> -1 then begin
    id  := lbTempId.Items.Strings[lbSingle.ItemIndex];

    if lbSingle.Selected[lbSingle.ItemIndex] then
    begin
      if frmAdminMainForm.index = 1 then
      begin
//        frmSummaryMissile.isCopy := True;
        Definition;
        frmSummaryMissile.ShowModal;
      end
      else if frmAdminMainForm.index = 2 then
      begin
//        frmSummaryTorpedo.isCopy := True;
        Definition;
        frmSummaryTorpedo.ShowModal;
      end
      else if frmAdminMainForm.index = 3 then
      begin
//        frmSummaryMine.isCopy := True;
        Definition;
        frmSummaryMine.ShowModal;
      end
      else if frmAdminMainForm.index = 4 then
      begin
//        frmSummaryGun.isCopy := True;
        Definition;
        frmSummaryGun.ShowModal;
      end
      else if frmAdminMainForm.index = 5 then
      begin
//        frmSummaryBomb.isCopy := True;
        Definition;
        frmSummaryBomb.ShowModal;
      end;
    end;
  end;
end;

procedure TfWeaponSingle.btnEditClick(Sender: TObject);
begin
  if lbSingle.ItemIndex <> -1 then begin
    id  := lbTempId.Items.Strings[lbSingle.ItemIndex];

    if frmAdminMainForm.index = 1 then
    begin
//      frmSummaryMissile.isCopy := False;
      Definition;
      frmSummaryMissile.ShowModal;
      frmSummaryMissile.PageControl1.ActivePageIndex := 0;
    end
    else if frmAdminMainForm.index = 2 then
    begin
//      frmSummaryTorpedo.isCopy := False;
      Definition;
      frmSummaryTorpedo.ShowModal;
    end
    else if frmAdminMainForm.index = 3 then
    begin
//      frmSummaryMine.isCopy := False;
      Definition;
      frmSummaryMine.ShowModal;
      frmSummaryMine.PageControl1.ActivePageIndex := 0;
    end
    else if frmAdminMainForm.index = 4 then
    begin
//      frmSummaryGun.isCopy := False;
      Definition;
      frmSummaryGun.ShowModal;
//      frmSummaryGun.TabSheet1.PageControl.ActivePageIndex:= 0;
    end
    else if frmAdminMainForm.index = 5 then
    begin
//      frmSummaryBomb.isCopy := False;
      Definition;
      frmSummaryBomb.ShowModal;
//      frmSummaryBomb.ts1.PageControl.ActivePageIndex := 0;
    end;
  end
  else
    ShowMessage('Select List first');
end;

procedure TfWeaponSingle.btnNewClick(Sender: TObject);
begin
  isNew := True;
  NewDefinition;
end;

procedure TfWeaponSingle.btnRemoveClick(Sender: TObject);
var warning: integer;
begin
  if lbSingle.ItemIndex <> -1 then
  begin
    warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);
    if warning = mrOK then
    begin
      try
        case frmAdminMainForm.index of
          1: dmTTT.deleteMissile_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
          2: dmTTT.deleteTorpedo_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
          3: dmTTT.deleteMine_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
          4: dmTTT.deleteGun(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
          5: dmTTT.deleteBomb(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
        end;
        refresh;
      except
        on E : Exception do
        begin
          if lbSingle.ItemIndex <> -1 then begin
            with frmUsage do begin
              UId := StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]);
              name_usage  := lbSingle.Items.Strings[lbSingle.ItemIndex];
              UIndex  := frmAdminMainForm.index + 6;
              if UIndex = 11 then
                usage_title := 'Point Effect On Board Vehicle:'
              else
              usage_title := 'Fitted Weapon Mount On Board Vehicle:';
                ShowModal;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfWeaponSingle.btnUsageClick(Sender: TObject);
begin
  if lbSingle.ItemIndex <> -1 then begin
    with frmUsage do begin
      UId := StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]);
      name_usage  := lbSingle.Items.Strings[lbSingle.ItemIndex];
      UIndex  := frmAdminMainForm.index + 6;
      if UIndex = 11 then
        usage_title := 'Point Effect On Board Vehicle:'
      else
        usage_title := 'Fitted Weapon Mount On Board Vehicle:';
      ShowModal;
    end;
  end;
end;

procedure TfWeaponSingle.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
end;

procedure TfWeaponSingle.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if GetKeyState(VK_ESCAPE)< 0 then
  begin
    case Msg.CharCode of
     VK_ESCAPE:
     begin
       btnClose.Click;
     end;
    end;
  end;
end;

procedure TfWeaponSingle.FormShow(Sender: TObject);
begin
  if frmAdminMainForm.index = 1 then
    Caption := 'Missile'
  else if frmAdminMainForm.index = 2 then
    Caption := 'Torpedo'
  else if frmAdminMainForm.index = 3 then
    Caption := 'Mine'
  else if frmAdminMainForm.index = 4 then
    Caption := 'Gun'
  else if frmAdminMainForm.index = 5 then
    Caption := 'Bomb/Depth Charge';

  refresh;
end;

procedure TfWeaponSingle.lbSingleClick(Sender: TObject);
begin
  if lbSingle.ItemIndex <> -1 then
  begin
    btnCopy.Enabled   := true;
    btnEdit.Enabled   := true;
    btnRemove.Enabled := true;
    btnUsage.Enabled  := true;
    btnClose.Enabled  := true;
  end;
end;

procedure TfWeaponSingle.lbSingleDblClick(Sender: TObject);
begin
  btnEdit.Click;
end;

procedure TfWeaponSingle.refresh;
var
 I: Integer;
begin
  try
  mList.Clear;
  if frmAdminMainForm.index = 1 then
  begin
//    uSimDBEditor.getAllMissile(0,mList,frmSummaryMissile.Missile);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TMissile_On_Board(mList[I]).FDef.Class_Identifier);
      lbTempId.Items.Add(IntToStr(TMissile_On_Board(mList[I]).FDef.Missile_Index));
    end;
  end
  else if frmAdminMainForm.index = 2 then
  begin
//    uSimDBEditor.getAllTorpedo(0,mList,frmSummaryTorpedo.torpedo);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TTorpedo_On_Board(mList[I]).FDef.Class_Identifier);
      lbTempId.Items.Add(IntToStr(TTorpedo_On_Board(mList[I]).FDef.Torpedo_Index));
    end;
  end
  else if frmAdminMainForm.index = 3 then
  begin
//    uSimDBEditor.getAllMine(0,mList,frmSummaryMine.mine);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TMine_On_Board(mList[I]).FMine_Def.Mine_Identifier);
      lbTempId.Items.Add(IntToStr(TMine_On_Board(mList[I]).FMine_Def.Mine_Index));
    end;
  end
  else if frmAdminMainForm.index = 4 then
  begin
//    dmTTT.GetGun(0,mList,frmSummaryGun.gun);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TGun_Definition(mList[I]).FData.Gun_Identifier);
      lbTempId.Items.Add(IntToStr(TGun_Definition(mList[I]).FData.Gun_Index));
    end;
  end
  else if frmAdminMainForm.index = 5 then
  begin
//    dmTTT.GetBomb(0,mList,frmSummaryBomb.bomb);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TBomb_Definition(mList[I]).FData.Bomb_Identifier);
      lbTempId.Items.Add(IntToStr(TBomb_Definition(mList[I]).FData.Bomb_Index));
    end;
  end
  except
    Close;
  end;

end;

procedure TfWeaponSingle.Definition;
var i,j:integer;
    primary_target  : String;
begin
  mList.Clear;
  case frmAdminMainForm.index of
    1:
      begin
        if frmAdminMainForm.fromDBeditor then begin
          if frmAdminMainForm.index = 1 then
          begin
            if show_from = fromMissileSel then
            begin
//              id := frmMissileOnBoardPickList.missile_id;
            end;
//            uSimDBEditor.getAllMissile(StrToInt(id),mList,frmSummaryMissile.Missile);
          end;
        end
        else
//          uSimDBEditor.getAllMissile(0,mList,frmSummaryMissile.Missile);

        with frmSummaryMissile do begin
//          with Missile.FDef do begin

            for I := 0 to mList.Count - 1 do
            begin
//              if isCopy then
//              begin
//                 edtClassMissile.Text    := 'Copy of ' + TMissile_On_Board(mList[i]).FDef.Class_Identifier;
//                 isNew := True;
//                 isCopy := false;
//              end
//              else
//                 edtClassMissile.Text    := TMissile_On_Board(mList[i]).FDef.Class_Identifier;
//              edtMaxAltitude.Text                 := IntToStr(TMissile_On_Board(mList[i]).FDef.Max_Target_Altitude_Delta);
              edtLethality.Text                   := IntToStr(TMissile_On_Board(mList[i]).FDef.Lethality);
//              edtDamage.Text                      := IntToStr(TMissile_On_Board(mList[i]).FDef.Damage_Capacity);
//              edtLengthDimension.Text             := FormatFloat('00.00',TMissile_On_Board(mList[i]).FDef.Length);
//              edtWidthDimension.Text              := FormatFloat('00.00',TMissile_On_Board(mList[i]).FDef.Width);
//              edtHeightDimension.Text             := FormatFloat('00.00',TMissile_On_Board(mList[i]).FDef.Height);
//              frmSummaryMissile.edtEngagementRangeDimension.Text    := FormatFloat('00.00',TMissile_On_Board(mList[i]).FDef.Engagement_Range);
              edtRangeBooster.Text                := FloatToStr(TMissile_On_Board(mList[i]).FDef.Booster_Separation_Range);
//              edtBoxWeightBooster.Text            := FloatToStr(TMissile_On_Board(mList[i]).FDef.Booster_Separation_Box_Width);
              edtBoxHeightBooster.Text            := FloatToStr(TMissile_On_Board(mList[i]).FDef.Booster_Separation_Box_Length);
              edtFrontRadarPhysical.Text          := FloatToStr(TMissile_On_Board(mList[i]).FDef.Front_Radar_Cross);
              edtSideRadarPhysical.Text           := FloatToStr(TMissile_On_Board(mList[i]).FDef.Side_Radar_Cross);
              edtFrontVisualPhysical.Text         := FloatToStr(TMissile_On_Board(mList[i]).FDef.Front_Visual_Cross);
              edtSideVisualPhysical.Text          := FloatToStr(TMissile_On_Board(mList[i]).FDef.Side_Visual_Cross);
              edtFrontInfraredPhysical.Text       := FloatToStr(TMissile_On_Board(mList[i]).FDef.Front_Infrared_Cross);
              edtSideInfraredPhysical.Text        := FloatToStr(TMissile_On_Board(mList[i]).FDef.Side_Infrared_Cross);
              edtFreqTerminalTARH.Text            := FloatToStr(TMissile_On_Board(mList[i]).FDef.Transmitted_Frequency);
              frmSummaryMissile.edtAntiRadiationMissile.Text        := FormatFloat('0',TMissile_On_Board(mList[i]).FDef.AR_POH_Modifier * 100);
              edtInfraredMissile.Text             := FormatFloat('0',TMissile_On_Board(mList[i]).FDef.IR_POH_Modifier * 100);
              edtSARHMissile.Text                 := FormatFloat('0',TMissile_On_Board(mList[i]).FDef.SARH_POH_Modifier * 100);
              edtTARHMissile.Text                 := FormatFloat('0',TMissile_On_Board(mList[i]).FDef.TARH_POH_Modifier * 100);
              edtMinRangeGuide.Text               := FloatToStr(TMissile_On_Board(mList[i]).FDef.Min_Range);
              edtMaxRangeGuide.Text               := FloatToStr(TMissile_On_Board(mList[i]).FDef.Max_Range);
              frmSummaryMissile.edtRangeFlyGuide.Text   := FloatToStr(TMissile_On_Board(mList[i]).FDef.Fly_Out_Range);
              edtAltitudeFlyGuide.Text            := FloatToStr(TMissile_On_Board(mList[i]).FDef.Fly_Out_Altitude);
              edtStartRangeTerminalGuidance.Text  := FloatToStr(TMissile_On_Board(mList[i]).FDef.Terminal_Sinuation_Start_Range);
              edtAltitudeTerminalGuidance.Text    := FloatToStr(TMissile_On_Board(mList[i]).FDef.Terminal_Acquisition_Altitude);
              edtPeriodTerminalGuidance.Text      := FloatToStr(TMissile_On_Board(mList[i]).FDef.Terminal_Sinuation_Period);
              edtRangeSeekerTurnGuidance.Text          := FloatToStr(TMissile_On_Board(mList[i]).FDef.Seeker_TurnOn_Range);
              edtRangeSeekerDetectionGuidance.Text     := FloatToStr(TMissile_On_Board(mList[i]).FDef.Term_Guide_Range);
              edtAzimuthSeekerDetectionGuidance.Text   := FloatToStr(TMissile_On_Board(mList[i]).FDef.Term_Guide_Azimuth);
              edtElevationSeekerDetectionGuidance.Text := FloatToStr(TMissile_On_Board(mList[i]).FDef.Term_Guide_Elevation);
              edtCommandAltitudeGuidance.Text          := FloatToStr(TMissile_On_Board(mList[i]).FDef.Terminal_Acquisition_Altitude);
              edtmaxNumWaypointGuidance.Text           := FloatToStr(TMissile_On_Board(mList[i]).FDef.Max_Num_Wpts);
              edtMinFinalWaypointGuidance.Text         := FloatToStr(TMissile_On_Board(mList[i]).FDef.Min_Final_Leg_Length);
              edtMaxFiringGuidance.Text                := FloatToStr(TMissile_On_Board(mList[i]).FDef.Max_Firing_Depth);
              edtDefaultCruiseGuidance.Text            := FloatToStr(TMissile_On_Board(mList[i]).FDef.Default_Altitude);
              edtRangeTARH.Text                        := IntToStr(TMissile_On_Board(mList[i]).FDef.Spot_Number);
              edtPulseRepTerminalTARH.Text             := FormatFloat('00.00',TMissile_On_Board(mList[i]).FDef.Pulse_Rep_Freq);
              edtPulseWidthTerminalTARH.Text           := FloatToStr(TMissile_On_Board(mList[i]).FDef.Pulse_Width);
              edtScanRateTerminalTARH.Text             := FloatToStr(TMissile_On_Board(mList[i]).FDef.Scan_Rate);
              edtTransmitterPowerTerminalTARH.Text     := FloatToStr(TMissile_On_Board(mList[i]).FDef.Xmit_Power);
              edtLowerLimitReceivedFreqTARH.Text       := FloatToStr(TMissile_On_Board(mList[i]).FDef.Lower_Received_Freq);
              edtUpperLimitReceivedFreqTARH.Text       := FloatToStr(TMissile_On_Board(mList[i]).FDef.Upper_Received_Freq);
//              EditProbability.Text                     := FormatFloat('0',TMissile_On_Board(mList[i]).FDef.Prob_of_Hit * 100);
              uSimDBEditor.getMotion_Characteristics(TMissile_On_Board(mlist[i]).FDef.Motion_Index,fMotionDouble.motion);
              edtMotionCharacteristic.Text             := fMotionDouble.motion.FData.Motion_Identifier;
//              id_motion := TMissile_On_Board(mlist[i]).FDef.Motion_Index;
              edtAmplitudeTerminalGuidance.Text        := FloatToStr(TMissile_On_Board(mList[i]).FDef.Terminal_Sinuation_Amplitude);

              if TMissile_On_Board(mList[i]).FDef.Anti_Air_Capable = 1 then
//                cbxAntiAir.Checked := True
              else
//                cbxAntiAir.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Anti_Sur_Capable = 1 then
//                cbxAntiSurface.Checked := True
              else
//                cbxAntiSurface.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Anti_SubSur_Capable = 1 then
//                cbxAntiSubsurface.Checked := True
              else
//                cbxAntiSubsurface.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Anti_Land_Capable = 1 then
//                cbxAntiLand.Checked := True
              else
//                cbxAntiLand.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Anti_Amphibious_Capable = 1 then
//                cbxAntiAmphibious.Checked := True
              else
//                cbxAntiAmphibious.Checked := False;


              if TMissile_On_Board(mList[i]).FDef.Sea_State_Modelling_Capable = 1 then
                chkSeaStateModelling.Checked := True
              else
                chkSeaStateModelling.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Home_On_Jam_Type_A_Capable = 1 then
//                 cbxTypeA.Checked := True
              else
//                cbxTypeA.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Home_On_Jam_Type_B_Capable = 1 then
//                cbxTypeB.Checked := True
              else
//                cbxTypeB.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Home_On_Jam_Type_C_Capable = 1 then
//                cbxTypeC.Checked := True
              else
//                cbxTypeC.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Booster_Separation_Required = 1 then
//                cbxBoosterSeparation.Checked := True
              else
//                cbxBoosterSeparation.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Fixed_Seeker_Turn_On_Range = 1 then
//                cbxRangeSeekerTurnGuidance.Checked := True
              else
//                cbxRangeSeekerTurnGuidance.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Terminal_Altitude_Required = 1 then
//                cbxTerminalAcqGuidance.Checked := True
              else
//                cbxTerminalAcqGuidance.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Fly_Out_Required = 1 then
//                cbxFlyOutRequired.Checked := True
              else
//                cbxFlyOutRequired.Checked := False;

              if TMissile_On_Board(mList[i]).FDef.Wpt_Capable = 1 then
//                cbxWaypointUserGuidance.Checked := True
              else
//                cbxWaypointUserGuidance.Checked := False;

//              cbMethod.ItemIndex                  := TMissile_On_Board(mList[i]).FDef.Launch_Method;
//              cbInitialCommanded.ItemIndex        := TMissile_On_Board(mList[i]).FDef.Launch_Speed;

//              primary_target_behav;
              case TMissile_On_Board(mList[i]).FDef.Primary_Target_Domain of
                0: primary_target := 'Air to Surface/Subsurface';
                1: primary_target := 'Surface/Subsurface to Surface/Subsurface';
                2: primary_target := 'Surface/Subsurface to Air';
                3: primary_target := 'Air to Air';
                4: primary_target := 'Land Attack';
                5: primary_target := 'Hybrid';
              end;
//              cbPrimaryTarget.ItemIndex := 0;
//              for j := 0 to cbPrimaryTarget.Items.Count - 1 do begin
//                if cbPrimaryTarget.Items.Strings[j] = primary_target then
//                begin
//                  cbPrimaryTarget.ItemIndex := j;
//                  Break;
//                end;
//              end;

//              cbDetectabilityType.ItemIndex       := TMissile_On_Board(mList[i]).FDef.Detectability_Type;
//              cbMidCourse.ItemIndex               := TMissile_On_Board(mList[i]).FDef.Mid_Course_Update_Mode;
//              cbPrimaryLaunchGuidance.ItemIndex   := TMissile_On_Board(mList[i]).FDef.Primary_Guide_Type;
//              cbSecondaryLaunchGuidance.ItemIndex := TMissile_On_Board(mList[i]).FDef.Secondary_Guide_Type;
//              cbPrimaryTARH.ItemIndex             := TMissile_On_Board(mList[i]).FDef.ECCM_Type;
//              cbPursuitLaunchGuidance.ItemIndex   := TMissile_On_Board(mList[i]).FDef.Pursuit_Guide_Type;
//              cbCapabilityTerminalGuidance.ItemIndex   := TMissile_On_Board(mList[i]).FDef.Terminal_Guidance_Capability;
//              cbDetonationECMTARH.ItemIndex       := TMissile_On_Board(mList[i]).FDef.ECM_Detonation;
//              cbDetectionECMTARH.ItemIndex        := TMissile_On_Board(mList[i]).FDef.ECM_Detection;
              cbbDetonationIRCM.ItemIndex         := TMissile_On_Board(mList[i]).FDef.IRCM_Detonation;
              cbbDetectionIRCM.ItemIndex          := TMissile_On_Board(mList[i]).FDef.IRCM_Detection;

//              mmNotes.Clear;
              if TMissile_On_Board(mList[i]).FNote.Notes <> '' then
//                mmNotes.Lines.Add(TMissile_On_Board(mList[i]).FNote.Notes);

//              cbFrontRadarPhysical.ItemIndex          := 0;
//              cbSideRadarPhysical.ItemIndex           := 0;
//              cbFrontRadarPhysical.Enabled            := false;
//              cbSideRadarPhysical.Enabled             := false;

//              if dmTTT.GetHybrid_ByMissile(TMissile_On_Board(mList[i]).FDef.Missile_Index,frmSummaryMissile.Hybrid) then
              begin
//                cbxHybridTorpedo.Checked := True;
//                edtHybridTorpedoDef.Text := Hybrid.FTorpedo_Def.Class_Identifier;
//                fTorpedo.torpedo_id := IntToStr(Hybrid.FData.Torpedo_Index);
              end
              else
              begin
//                cbxHybridTorpedo.Checked := False;
                edtHybridTorpedoDef.Text := '';
//                frmTorpedoOnBoardPickList.torpedo_id := '';
              end;

            end;
          end;
        end;
      end;
//    2:
      begin
       if frmAdminMainForm.fromDBeditor then
        begin
          if frmAdminMainForm.index = 2 then
          begin
            if show_from = fromTorpedoSel then
            begin
//              id := frmTorpedoOnBoardPickList.torpedo_id;
              //fTorpedo.fromTorpedoSel := false;
            end;
//            uSimDBEditor.getAllTorpedo(StrToInt(id),mList,frmSummaryTorpedo.torpedo);
          end;
        end
        else
//           uSimDBEditor.getAllTorpedo(0,mList,frmSummaryTorpedo.torpedo);
        with frmSummaryTorpedo do begin
//          with torpedo.FDef do begin
//            for I := 0 to mList.Count - 1 do
//            begin
//              if isCopy then
//              begin
//                edtClassTorpedo.Text   := 'Copy of ' + TTorpedo_On_Board(mList[i]).FDef.Class_Identifier;
//                isNew := True;
//              end
//              else
//                edtClassTorpedo.Text   := TTorpedo_On_Board(mList[i]).FDef.Class_Identifier;
//              edtLethality.Text               := IntToStr(TTorpedo_On_Board(mList[i]).FDef.Lethality);
//              edtMaxSearchDepth.Text          := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Max_Torpedo_Search_Depth);
//              edtDamage.Text                  := IntToStr(TTorpedo_On_Board(mList[i]).FDef.Damage_Capacity);
//              edtLengthDimension.Text         := FormatFloat('00.00',TTorpedo_On_Board(mList[i]).FDef.Length);
//              edtWidthDimension.Text          := FormatFloat('00.00',TTorpedo_On_Board(mList[i]).FDef.Width);
//              edtHeightDimension.Text         := FormatFloat('00.00',TTorpedo_On_Board(mList[i]).FDef.Height);
//              edtEngagementRangeDimension.Text    := FormatFloat('00.00000',TTorpedo_On_Board(mList[i]).FDef.Engagement_Range);
//              uSimDBEditor.getMotion_Characteristics(TTorpedo_On_Board(mlist[i]).FDef.Motion_Index,fMotionDouble.motion);
//              edtMotionCharacteristic.Text             := fMotionDouble.motion.FData.Motion_Identifier;
//              id_motion := TTorpedo_On_Board(mlist[i]).FDef.Motion_Index;
//              edtLateralDecelerationAirDrop.Text  := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Lateral_Deceleration);
//              edtDecentRateAirDrop.Text           := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Airborne_Descent_Rate);
//              edtFrontAcousticCross.Text          := FormatFloat('00.00',TTorpedo_On_Board(mList[i]).FDef.Front_Acoustic_Cross);
//              edtSideAcousticCross.Text           := FormatFloat('00.00',TTorpedo_On_Board(mList[i]).FDef.Side_Acoustic_Cross);
//              edtWakeHoming.Text                  := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.WakeHome_POH_Modifier);
//              edtWireGuided.Text                  := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.WireGuide_POH_Modifier);
//              edtActiveAccoustic.Text             := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Active_Acoustic_POH_Mod);
//              edtPassiveAccoustic.Text            := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Passive_Acoustic_POH_Mod);
//              edtRangeSeekerDetectionGuide.Text   := FormatFloat('00.00',TTorpedo_On_Board(mList[i]).FDef.Term_Guide_Range);
//              edtAzimuthSeekerDetectionGuide.Text := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Term_Guide_Azimuth);
//              edtPeriodSinuation.Text             := FormatFloat('00.00',TTorpedo_On_Board(mList[i]).FDef.Runout_Sinuation_Period);
//              edtAmplitudeSinuation.Text          := FormatFloat('00.00',TTorpedo_On_Board(mList[i]).FDef.Runout_Sinuation_Amplitude);
//              edtMinRangeGuidance.Text            := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Min_Range);
//              edtMaxRangeGuidance.Text            := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Max_Range);
//              edtDepthSafetyCeiling.Text          := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Acoustic_Torp_Ceiling_Depth);
//              edtPower.Text                       := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Active_Seeker_Power);
//              edtFreq.Text                        := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Active_Seeker_Freq);
//              edtNuclearSubmarine.Text            := FormatFloat('0',TTorpedo_On_Board(mList[i]).FDef.Opt_Launch_Range_Nuc_Sub);
//              edtConvSubmarine.Text               := FormatFloat('0',TTorpedo_On_Board(mList[i]).FDef.Opt_Launch_Range_Conv_Sub);
//              edtOtherSubmarine.Text              := FormatFloat('0',TTorpedo_On_Board(mList[i]).FDef.Opt_Launch_Range_Other);
//              edtMinSpeedAccoustic.Text           := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.LSpeed_Acoustic_Intens);
//              edtBelowCavitationAccoustic.Text    := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Below_Cav_Acoustic_Intens);
//              edtAboveCavitationAccoustic.Text    := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Above_Cav_Acoustic_Intens);
//              edtCavitationSpeedAccoustic.Text    := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Cavitation_Switch_Point);
//              edtMaxSpeedAccoustic.Text           := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.HSpeed_Acoustic_Intens);
//              edtActPassAccoustic.Text              := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Active_Passive_POH_Mod);
//              edtElevationSeekerDetectionGuide.Text := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Term_Guide_Elevation);
//              edtMinRunoutGuidance.Text             := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Min_Runout_Range);
//              edtDefaultCruiseGuidance.Text         := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Default_Depth);
//              edtWireAngleGuidance.Text             := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Wire_Angle_Offset);
//              edtRangeSeekerTurnOnGuidance.Text     := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Seeker_TurnOn_Range);
//              edtRadiusGuidance.Text                := FloatToStr(TTorpedo_On_Board(mList[i]).FDef.Terminal_Circle_Radius);
//
//              if TTorpedo_On_Board(mList[i]).FDef.Anti_Sur_Capable = 1 then
//                cbxAntiSurface.Checked := True
//              else
//                cbxAntiSurface.Checked := False;
//
//              if TTorpedo_On_Board(mList[i]).FDef.Anti_SubSur_Capable = 1 then
//                cbxAntiSubsurface.Checked := True
//              else
//                cbxAntiSubsurface.Checked := False;
//
//              if TTorpedo_On_Board(mList[i]).FDef.Fixed_Ceiling_Depth = 1 then
//                cbxFixDepth.Checked := True
//              else
//                cbxFixDepth.Checked := False;
//
//              if TTorpedo_On_Board(mList[i]).FDef.Air_Drop_Capable = 1 then
//                cbxAirDropCapable.Checked := True
//              else
//                cbxAirDropCapable.Checked := False;
//
//              if TTorpedo_On_Board(mList[i]).FDef.Fixed_Circle_Radius = 1 then
//                cbxRadiusOperatorGuidance.Checked := True
//              else
//                cbxRadiusOperatorGuidance.Checked := False;
//
//              if TTorpedo_On_Board(mList[i]).FDef.Sinuation_Runout = 1 then
//                cbxSinuationRunout.Checked := True
//              else
//                cbxSinuationRunout.Checked := False;
//
//              if TTorpedo_On_Board(mList[i]).FDef.Use_Terminal_Circle = 1 then
//                cbxUseTerminalCircle.Checked  := True
//              else
//                cbxUseTerminalCircle.Checked  := False;
//
//              if TTorpedo_On_Board(mList[i]).FDef.Fixed_Seeker_TurnOn_Range = 1 then
//                cbxRangeSeekerTurnOnGuidance.Checked  := True
//              else
//                cbxRangeSeekerTurnOnGuidance.Checked  := False;
//
//              cbMethod.ItemIndex                := TTorpedo_On_Board(mList[i]).FDef.Launch_Method - 1;
//              cbInitialCommanded.ItemIndex      := TTorpedo_On_Board(mList[i]).FDef.Launch_Speed;
//      //        cbPrimaryTarget.ItemIndex := TTorpedo_On_Board(mList[i]).FDef.Primary_Target_Domain;
//              if TTorpedo_On_Board(mList[i]).FDef.Primary_Target_Domain = 2 then
//                cbPrimaryTarget.ItemIndex := 1
//              else if TTorpedo_On_Board(mList[i]).FDef.Primary_Target_Domain = 4 then
//                cbPrimaryTarget.ItemIndex := 2
//              else
//                cbPrimaryTarget.ItemIndex := 0;
//
//                case TTorpedo_On_Board(mList[i]).FDef.Guidance_Type of
//                  9 : cbPrimaryLaunchGuidance.ItemIndex := 0;
//                  10 : cbPrimaryLaunchGuidance.ItemIndex := 1;
//                  11 : cbPrimaryLaunchGuidance.ItemIndex := 2;
//                  12 : cbPrimaryLaunchGuidance.ItemIndex := 3;
//                  13 : cbPrimaryLaunchGuidance.ItemIndex := 4;
//                  18 : cbPrimaryLaunchGuidance.ItemIndex := 5;
//                end;
//       //       cbPrimaryLaunchGuidance.ItemIndex := TTorpedo_On_Board(mList[i]).FDef.Guidance_Type;
//      //        cbPursuitLaunchGuidance.ItemIndex := TTorpedo_On_Board(mList[i]).FDef.Pursuit_Guidance_Type;
//              if TTorpedo_On_Board(mList[i]).FDef.Pursuit_Guidance_Type = 2 then
//                cbPursuitLaunchGuidance.ItemIndex := 0
//              else
//                cbPursuitLaunchGuidance.ItemIndex := 1;
//
//              cbxFirstGyroAngelsGuidance.Text   := IntToStr(TTorpedo_On_Board(mList[i]).FDef.First_Relative_Gyro_Angle);
//              cbxSecondGyroAngelsGuidance.Text  := IntToStr(TTorpedo_On_Board(mList[i]).FDef.Second_Relative_Gyro_Angle);
//              cbDetectabilityType.ItemIndex     := TTorpedo_On_Board(mList[i]).FDef.Detectability_Type;
//
//              mmNotes.Clear;
//              if TTorpedo_On_Board(mList[i]).FNote.Notes <> '' then
//                mmNotes.Lines.Add(TTorpedo_On_Board(mList[i]).FNote.Notes);
//            end;
//          end;
        end;
      end;
//    3:
      begin
        if frmAdminMainForm.fromDBeditor then begin
          if frmAdminMainForm.index = 3 then
          begin
            if show_from = fromMineSel then
            begin
//              id := frmMineOnBoardPickList.mine_id;
              //fMine.fromMineSel := false;
            end;
//           uSimDBEditor.getAllMine(StrToInt(id),mList,frmSummaryMine.mine);
          end;
        end
        else
//          uSimDBEditor.getAllMine(0,mList,frmSummaryMine.mine);
        with frmSummaryMine do begin
//          with mine.FMine_Def do begin
//            for I := 0 to mList.Count - 1 do
//            begin
//              if isCopy then
//              begin
//                edtClassMine.Text   := 'Copy of ' + TMine_On_Board(mList[i]).FMine_Def.Mine_Identifier;
//                isNew := True;
//              end
//              else
//                edtClassMine.Text                := TMine_On_Board(mList[i]).FMine_Def.Mine_Identifier;
//              edtLethality.Text                := IntToStr(TMine_On_Board(mList[i]).FMine_Def.Mine_Lethality);
//              edtMaxLayingDepth.Text           := FloatToStr(TMine_On_Board(mList[i]).FMine_Def.Max_Laying_Depth);
//              edtLengthDimension.Text          := FormatFloat('00.00',TMine_On_Board(mList[i]).FMine_Def.Length);
//              edtWidthDimension.Text           := FormatFloat('00.00',TMine_On_Board(mList[i]).FMine_Def.Width);
//              edtHeightDimension.Text          := FormatFloat('00.00',TMine_On_Board(mList[i]).FMine_Def.Height);
//              edtEngagementRangeDimension.Text := FormatFloat('00.00',TMine_On_Board(mList[i]).FMine_Def.Engagement_Range);
//              edtFrontRadarPhysical.Text       := FloatToStr(TMine_On_Board(mList[i]).FMine_Def.Front_Acoustic_Cross);
//              edtSideRadarPhysical.Text        := FloatToStr(TMine_On_Board(mList[i]).FMine_Def.Side_Acoustic_Cross);
//              cbCategory.ItemIndex          := TMine_On_Board(mList[i]).FMine_Def.Platform_Category - 2;
//              cbDetectabilityType.ItemIndex := TMine_On_Board(mList[i]).FMine_Def.Detectability_Type;
//              cbMooringType.ItemIndex       := TMine_On_Board(mList[i]).FMine_Def.Mooring_Type;
//
//              if TMine_On_Board(mList[i]).FMine_Def.Anti_Sur_Capable = 0 then
//                cbxAntiSurface.Checked := False
//              else
//                cbxAntiSurface.Checked := True;
//
//              if TMine_On_Board(mList[i]).FMine_Def.Anti_SubSur_Capable = 0 then
//                cbxAntiSubSurface.Checked := False
//              else
//                cbxAntiSubSurface.Checked := True;
//
//
//              Memo1.Clear;
//              if TMine_On_Board(mList[i]).FNote.Notes <> '' then
//                Memo1.Lines.Add(TMine_On_Board(mList[i]).FNote.Notes);
//
//            end;
//          end;
        end;
      end;
//    4:
      begin
        if frmAdminMainForm.fromDBeditor then begin
          if frmAdminMainForm.index = 4 then
          begin
            if show_from = fromGunSel then
            begin
//              id := frmGunOnBoardPickList.gun_id;
              //fGunSelect.fromGunSel := false;
            end;
//           dmTTT.GetGun(StrToInt(id),mList,frmSummaryGun.gun);
          end;
        end
        else
//           dmTTT.GetGun(0,mList,frmSummaryGun.gun);
        with frmSummaryGun do begin
//          with gun.FData do begin
//            for I := 0 to mList.Count - 1 do
//            begin
//              if isCopy then
//              begin
//                edtClassGun.Text   := 'Copy of '+ Gun_Identifier;
//                isNew := True;
//                btnEditAirTargetCurve.Enabled := false;
//                btnEditSurfaceLandTargetCurve.Enabled := false;
//              end
//              else
//                edtClassGun.Text              := Gun_Identifier;
//              edtLethality.Text             := IntToStr(Lethality_per_Round);
//              edtMinforAirTargetRange.Text  := FormatFloat('00.00',Air_Min_Range);
//              edtMaxforAirTargetRange.Text  := FormatFloat('00.00',Air_Max_Range);
//              edtMinforSurfaceRange.Text    := FormatFloat('00.00',Min_Range);
//              edtRateOfFire.Text            := IntToStr(Rate_of_Fire);
//              edtMaxAltitude.Text           := FloatToStr(Max_Target_Altitude_Delta);
//              edtAverageShell.Text          := FloatToStr(Gun_Average_Shell_Velocity);
//              edtMaxforSurfaceRange.Text    := FloatToStr(Max_Range);
//              edtEdLetalNGS.Text            := IntToStr(Lethality_per_Round);
//
//              if Fire_Cntl_Director_Req = 1 then
//                cbxFireControl.Checked  := True
//              else
//                cbxFireControl.Checked  := False;
//
//              if Gun_Category = 1 then
//                cbCategory.ItemIndex := 0
//              else if Gun_Category = 2 then
//                cbCategory.ItemIndex := 1
//              else
//                cbCategory.ItemIndex := 2;
//
//              if Anti_Sur_Capable = 1 then
//                cbxAntiSurface.Checked := True
//              else
//                cbxAntiSurface.Checked := False;
//
//              if NGS_Capable = 1 then
//                chkNavalgunfire.Checked:=True
//              else
//                chkNavalgunfire.Checked:=False;
//
//              if Anti_Land_Capable = 1 then
//                cbxAntiLand.Checked := True
//              else
//                cbxAntiLand.Checked := False;
//
//              if Anti_Air_Capable = 1 then
//                cbxAntiAir.Checked := True
//              else
//                cbxAntiAir.Checked := False;
//
//              if Anti_Amphibious_Capable = 1 then
//                cbxantiAmphibious.Checked := True
//              else
//                cbxAntiAmphibious.Checked := False;
//
//              if Chaff_Capable_Gun = 1 then
//                cbxDeployingChaff.Checked  := True
//              else
//                cbxDeployingChaff.Checked  := False;
//
//              if Automode_Capable = 1 then
//                cbxAutofireMode.Checked  := True
//              else
//                cbxAutofireMode.Checked  := False;
//
//              edtMindef.Text:=Gun_Identifier;
//              edtMindef.Text:=FloatToStr(Round(NGS_MinDeflectionError*C_NauticalMile_To_Metre));
//              edtMaxdef.Text:=Gun_Identifier;
//              edtMaxdef.Text:=FloatToStr(Round(NGS_MaxDeflectionError*C_NauticalMile_To_Metre));
//              edtMinRange.Text:=Gun_Identifier;
//              edtMinRange.Text:=FloatToStr(Round(NGS_MinRangeError*C_NauticalMile_To_Metre));
//              edtMaxRange.Text:=Gun_Identifier;
//              edtMaxRange.Text:=FloatToStr(Round(NGS_MaxRangeError*C_NauticalMile_To_Metre));
//              edtDisperError.Text:=Gun_Identifier;
//              edtDisperError.Text:=FloatToStr(Round(NGS_MaxDispersionError*C_NauticalMile_To_Metre));
//              edtdamageError.Text:=Gun_Identifier;
//              edtdamageError.Text:=FloatToStr(Round(NGS_MaxDamageRadius*C_NauticalMile_To_Metre));
//              edteffectifRadius.Text:=Gun_Identifier;
//              edteffectifRadius.Text:=FloatToStr(Round(NGS_EffectiveRadius*C_NauticalMile_To_Metre));
//
//             end;
//          end;

//          mmNotes.Clear;
//          if gun.FNote.Notes <> '' then
//            mmNotes.Lines.Add(gun.FNote.Notes);

        end;
      end;
//    5:
      begin
        if frmAdminMainForm.fromDBeditor then begin
          if frmAdminMainForm.index = 5 then
          begin
            if show_from = fromBombSel then
            begin
//              id := frmBombOnBoardPickList.bomb_id;
              //fBombDoublePickList.fromBombSel := false;
            end;
//           dmTTT.GetBomb((StrToInt(id)),mList,frmSummaryBomb.bomb);
          end;
        end
        else
//           dmTTT.GetBomb(0,mList,frmSummaryBomb.bomb);
        with frmSummaryBomb do begin
//          with bomb.FData do begin
//            for I := 0 to mList.Count - 1 do
//            begin
//              if isCopy then
//              begin
//                edtClass.Text     := 'Copy of ' + TBomb_Definition(mList[i]).FData.Bomb_Identifier;
//                isNew := True;
//              end
//              else
//                edtClass.Text     := TBomb_Definition(mList[i]).FData.Bomb_Identifier;
//              edtRangeMin.Text  := FormatFloat('00.00',TBomb_Definition(mList[i]).FData.Min_Range);
//              edtRangeMax.Text  := FormatFloat('00.00',TBomb_Definition(mList[i]).FData.Max_Range);
//              edtLethality.Text := IntToStr(TBomb_Definition(mList[i]).FData.Lethality);
//              cbbType.ItemIndex := TBomb_Definition(mList[i]).FData.Bomb_Type - 1;
//
//              if Anti_Sur_Capable = 1 then
//                chkAntiSurface.Checked := True
//              else
//                chkAntiSurface.Checked := False;
//
//              if Anti_SubSur_Capable = 1 then
//                chkAntiSubSurface.Checked := True
//              else
//                chkAntiSubSurface.Checked := False;
//
//              if Anti_Land_Capable = 1 then
//                chkAntiLand.Checked := True
//              else
//                chkAntiLand.Checked := False;
//
//              if Anti_Amphibious_Capable = 1 then
//                chkAntiAmphibious.Checked := True
//              else
//                chkAntiAmphibious.Checked := False;
//
//              if cbbType.ItemIndex = 0 then
//              begin
//                chkAntiSurface.Enabled    := true;
//                chkAntiSubSurface.Checked := false;
//                chkAntiSubSurface.Enabled := false;
//                chkAntiLand.Enabled       := true;
//              end
//              else  if cbbType.ItemIndex = 1 then
//              begin
//                chkAntiSurface.Checked    := false;
//                chkAntiSurface.Enabled    := false;
//                chkAntiSubSurface.Enabled := true;
//                chkAntiLand.Checked       := false;
//                chkAntiLand.Enabled       := false;
//              end;
//
//            end;
//          end;
//          mmo1.Clear;
//          if bomb.FNote.Notes <> '' then
//            mmo1.Lines.Add(bomb.FNote.Notes);
        end
      end;
  end;
//end;

procedure TfWeaponSingle.NewDefinition;
begin

  if frmAdminMainForm.index = 1 then
  begin

    with frmSummaryMissile do
    begin
//      edtClassMissile.Text                    := '';
//      edtMaxAltitude.Text                     := '0';
//      edtLethality.Text                       := '0';
//      edtDamage.Text                          := '0';
//      EditProbability.Text                    := '0';
//      edtLengthDimension.Text                 := '0';
//      edtWidthDimension.Text                  := '0';
//      edtHeightDimension.Text                 := '0';
//      edtEngagementRangeDimension.Text        := '0';
//      edtRangeBooster.Text                    := '0';
//      edtBoxWeightBooster.Text                := '0';
      edtBoxHeightBooster.Text                := '0';
      edtFrontRadarPhysical.Text              := '0';
      edtSideRadarPhysical.Text               := '0';
      edtFrontVisualPhysical.Text             := '0';
      edtSideVisualPhysical.Text              := '0';
      edtFrontInfraredPhysical.Text           := '0';
      edtSideInfraredPhysical.Text            := '0';
      edtAntiRadiationMissile.Text            := '0';
      edtInfraredMissile.Text                 := '0';
      edtSARHMissile.Text                     := '0';
      edtTARHMissile.Text                     := '0';
      edtMinRangeGuide.Text                   := '0';
      edtMaxRangeGuide.Text                   := '0';
      edtRangeFlyGuide.Text                   := '0';
      edtAltitudeFlyGuide.Text                := '0';
      edtStartRangeTerminalGuidance.Text      := '0';
      edtAltitudeTerminalGuidance.Text        := '0';
      edtPeriodTerminalGuidance.Text          := '0';
      edtAmplitudeTerminalGuidance.Text       := '0';
      edtRangeSeekerTurnGuidance.Text         := '0';
      edtRangeSeekerDetectionGuidance.Text    := '0';
      edtAzimuthSeekerDetectionGuidance.Text  := '0';
      edtElevationSeekerDetectionGuidance.Text:= '0';
      edtCommandAltitudeGuidance.Text         := '0';
      edtmaxNumWaypointGuidance.Text          := '0';
      edtMinFinalWaypointGuidance.Text        := '0';
      edtMaxFiringGuidance.Text               := '0';
      edtDefaultCruiseGuidance.Text           := '0';
      edtRangeTARH.Text                       := '0';
      edtFreqTerminalTARH.Text                := '0';
      edtPulseRepTerminalTARH.Text            := '0';
      edtPulseWidthTerminalTARH.Text          := '0';
      edtScanRateTerminalTARH.Text            := '0';
      edtTransmitterPowerTerminalTARH.Text    := '0';
      edtLowerLimitReceivedFreqTARH.Text      := '0';
      edtUpperLimitReceivedFreqTARH.Text      := '0';
//      cbxAntiAir.Checked                      := False;
//      cbxAntiSurface.Checked                  := False;
//      cbxAntiSubsurface.Checked               := False;
//      cbxAntiLand.Checked                     := False;
//      chkSeaStateModelling.Checked            := False;
//      cbxTypeA.Checked                        := False;
//      cbxTypeB.Checked                        := False;
//      cbxTypeC.Checked                        := False;
//      cbxHybridTorpedo.Checked                := False;
//      cbxBoosterSeparation.Checked            := False;
//      cbxFlyOutRequired.Checked               := False;
//      cbxRangeSeekerTurnGuidance.Checked      := False;
//      cbxTerminalAcqGuidance.Checked          := False;
//      cbxWaypointUserGuidance.Checked         := False;
//      cbMethod.Text                           := '';
//      cbInitialCommanded.Text                 := '';
//      cbPrimaryTarget.Text                    := '';
//      cbDetectabilityType.Text                := '';
//      cbMidCourse.Text                        := '';
//      cbPrimaryLaunchGuidance.Text            := '';
//      cbSecondaryLaunchGuidance.Text          := '';
//      cbPursuitLaunchGuidance.Text            := '';
//      cbPrimaryTARH.Text                      := '';
//      cbDetonationECMTARH.Text                := '';
//      cbDetectionECMTARH.Text                 := '';
//      cbFrontRadarPhysical.ItemIndex          := 0;
//      cbSideRadarPhysical.ItemIndex           := 0;
//      cbFrontRadarPhysical.Enabled            := false;
//      cbSideRadarPhysical.Enabled             := false;
//      edtMotionCharacteristic.Text            := '[None]';
//      mmNotes.Clear;

      ShowModal;
    end;
  end
  else if frmAdminMainForm.index = 2 then
  begin
//    with frmSummaryTorpedo do begin
//      edtClassTorpedo.Text            := '';
//      edtLethality.Text               := '0';
//      edtMaxSearchDepth.Text          := '0';
//      edtDamage.Text                  := '0';
//      edtLengthDimension.Text         := '0';
//      edtWidthDimension.Text          := '0';
//      edtHeightDimension.Text         := '0';
//      edtEngagementRangeDimension.Text    := '0';
//      edtMotionCharacteristic.Text        := '[None]';
//      edtLateralDecelerationAirDrop.Text  := '0';
//      edtDecentRateAirDrop.Text           := '0';
//      edtFrontAcousticCross.Text          := '0';
//      edtSideAcousticCross.Text           := '0';
//      edtWakeHoming.Text                  := '0';
//      edtWireGuided.Text                  := '0';
//      edtActiveAccoustic.Text             := '0';
//      edtPassiveAccoustic.Text            := '0';
//      edtRangeSeekerDetectionGuide.Text   := '0';
//      edtAzimuthSeekerDetectionGuide.Text := '0';
//      edtPeriodSinuation.Text             := '0';
//      edtAmplitudeSinuation.Text          := '0';
//      edtMinRangeGuidance.Text            := '0';
//      edtMaxRangeGuidance.Text            := '0';
//      edtRadiusGuidance.Text              := '0';
//      edtDepthSafetyCeiling.Text          := '0';
//      edtPower.Text                       := '0';
//      edtFreq.Text                        := '0';
//      edtNuclearSubmarine.Text            := '0';
//      edtConvSubmarine.Text               := '0';
//      edtOtherSubmarine.Text              := '0';
//      edtMinSpeedAccoustic.Text           := '0';
//      edtBelowCavitationAccoustic.Text    := '0';
//      edtAboveCavitationAccoustic.Text    := '0';
//      edtCavitationSpeedAccoustic.Text    := '0';
//      edtMaxSpeedAccoustic.Text           := '0';
//      edtActPassAccoustic.Text              := '0';
//      edtElevationSeekerDetectionGuide.Text := '0';
//      edtMinRunoutGuidance.Text             := '0';
//      edtRangeSeekerTurnOnGuidance.Text     := '0';
//      edtDefaultCruiseGuidance.Text         := '0';
//      edtWireAngleGuidance.Text             := '0';
//      cbMethod.Text                         := '';
//      cbInitialCommanded.Text               := '';
//      cbPrimaryTarget.Text                  := '';
//      cbDetectabilityType.Text              := '';
//      cbxAirDropCapable.Checked             := False;
//      cbPrimaryLaunchGuidance.Text          := '';
//      cbPursuitLaunchGuidance.Text          := '';
//      cbxSinuationRunout.Checked            := False;
//      cbxRadiusOperatorGuidance.Checked     := False;
//      cbxAntiSurface.Checked                := False;
//      cbxAntiSubSurface.Checked             := False;
//      cbxUseTerminalCircle.Checked          := False;
//      cbxRangeSeekerTurnOnGuidance.Checked  := False;
//      cbxrealtiveGyroAnglesGuidance.Checked := False;
//      cbxFirstGyroAngelsGuidance.ItemIndex  := 0;
//      cbxSecondGyroAngelsGuidance.ItemIndex := 0;
//      cbxFixDepth.Checked                   := False;
//      mmNotes.Clear;
//      ShowModal;
//    end;
  end
  else if frmAdminMainForm.index = 3 then
  begin
//    with frmSummaryMine do
//    begin
//      edtClassMine.Text                := '';
//      edtLethality.Text                := '0';
//      edtMaxLayingDepth.Text           := '0';
//      edtLengthDimension.Text          := '0';
//      edtWidthDimension.Text           := '0';
//      edtHeightDimension.Text          := '0';
//      edtEngagementRangeDimension.Text := '0';
//      edtFrontRadarPhysical.Text       := '0';
//      edtSideRadarPhysical.Text        := '0';
//      cbCategory.Text                  := '';
//      cbMooringType.Text               := '';
//      cbxAntiSurface.Checked           := False;
//      cbxAntiSubSurface.Checked        := False;
//      cbDetectabilityType.Text         := '';
//      Memo1.Clear;
//      ShowModal;
//    end;
  end
  else if frmAdminMainForm.index = 4 then
  begin
    with frmSummaryGun do begin
//      edtClassGun.Text              := '';
//      edtLethality.Text             := '0';
//      edtMinforAirTargetRange.Text  := '0';
//      edtMaxforAirTargetRange.Text  := '0';
//      edtMinforSurfaceRange.Text    := '0';
//      edtRateOfFire.Text            := '0';
//      edtMaxAltitude.Text           := '0';
//      edtAverageShell.Text          := '0';
//      edtMaxforSurfaceRange.Text    := '0';
//      cbCategory.Text               := '';
//      cbxAntiSurface.Checked        := False;
//      cbxDeployingChaff.Checked     := False;
//      cbxFireControl.Checked        := False;
//      cbxAntiLand.Checked           := False;
//      cbxAutofireMode.Checked       := False;
//      cbxAntiAir.Checked            := False;
//      btnEditAirTargetCurve.Enabled := false;
//      btnEditSurfaceLandTargetCurve.Enabled := false;
//      mmNotes.Clear;
      ShowModal;
    end;
  end
  else if frmAdminMainForm.index = 5 then
  begin
    with frmSummaryBomb do
    begin
      frmSummaryBomb.edtClass.Text     := '';
      edtRangeMin.Text  := '0';
      edtRangeMax.Text  := '0';
      edtLethality.Text := '';
      cbbType.ItemIndex := 0;
      chkAntiSurface.Checked    := False;
      chkAntiSubSurface.Checked := False;
      chkAntiLand.Checked       := False;
//      enableCombo;
//      mmo1.Clear;
      ShowModal;
    end;
  end
end;


end.
