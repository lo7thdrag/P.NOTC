unit uOtherSingleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfOtherSingle = class(TForm)
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
    procedure btnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure refresh;
    procedure btnEditClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure NewDefinition;
    procedure Definition;
  private
    { Private declarations }
  public
    { Public declarations }
    id : string;
    isNew,isCopy : Boolean;
  end;

var
  fOtherSingle: TfOtherSingle;
  mList       : TList;

implementation

{$R *.dfm}

uses uDataModuleTTT, ufDBEditor, uDBAssetObject, uDBAsset_GameEnvironment,
uRuntimePlatform, uPredefinedPattern, uOverlay, uRadarIntervalList,
  uDBGame_Defaults,uGameDefaults, uDBPattern, uStudentRoleListWindow,
  newClassASTT, uDBAsset_Runtime_Platform_Library, uSNRvsPOD;

procedure TfOtherSingle.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfOtherSingle.btnCopyClick(Sender: TObject);
begin
  id  := lbTempId.Items.Strings[lbSingle.ItemIndex];
  isCopy := True;

  if lbSingle.Selected[lbSingle.ItemIndex] then
  begin
    if fDBEditor.index = 1 then
    begin
      Definition;
      fRuntimePlatform.Show;
    end
    else if fDBEditor.index = 2 then
    begin
      Definition;
      fPredefinedPattern.Show;
    end  {
    else if fDBEditor.index = 3 then
    begin

    end  }
    else if fDBEditor.index = 4 then
    begin
      Definition;
      fOverlay.Show;
    end
    else if fDBEditor.index = 5 then
    begin
      Definition;
      fStudentRoleListWindow.Show;
    end
    else if fDBEditor.index = 6 then
    begin
      Definition;
      fGameDefault.Show;
    end
    else if fDBEditor.index = 7 then
    begin
      Definition;
      fSnrVsPod.Show;
    end
  end;
end;

procedure TfOtherSingle.NewDefinition;
begin
  if fDBEditor.index = 6 then
  begin
     with fGameDefault do begin
       isNew := True;
       edtVisualFactorDetection.Text      := '';
       edtVisualFactorIdentification.Text := '';
       edtVisualCrossSection.Text         := '';
       edtVisualDetection.Text            := '';
       edtVisualMaxRange.Text             := '';
       edtChaffSeductionAltitude.Text     := '';
       edtChaffAltitude.Text              := '';
       edtChaffSeductionRange.Text        := '';
       edtAutogunInterception.Text        := '';
       edtAutogunThreshold.Text           := '';
 //      edtMissileMinRange.Text            := IntToStr(TGame_Defaults(mList[i]).FData.);
       edtMissileReacquisition.Text       := '';
//       edtMissileMaxRange.Text            := FloatToStr(TGame_Defaults(mList[i]).FData.
       edtDefensiveInterval.Text          := '';
       edtProbabilityDecreaseRate.Text    := '';
       edtProbabilityRadiusDelay.Text     := '';
       edtProbabilityModifier.Text        := '';
       edtMineTimeInterval.Text           := '';
       edtSonarTMABearing.Text            := '';
       edtSonarTMASeduction.Text          := '';
       edtSonarTMAMaxCauseEror.Text       := '';
       edtSonarTMAMaxSpeedEror.Text       := '';
       edtMakeStaleSurface.Text           := '';
       edtMakeStaleAir.Text               := '';
       edtMakeStaleSubsurface.Text        := '';
       edtMakeStaleESM.Text               := '';
       edtMakeStaleSonar.Text             := '';
{       edtRemoveStaleSurface.Text         := FloatToStr(TGame_Defaults(mList[i]).FData.
       edtRemoveStaleAir.Text             := FloatToStr(TGame_Defaults(mList[i]).FData.
       edtRemoveStaleSubsurface.Text      := FloatToStr(TGame_Defaults(mList[i]).FData.
       edtRemoveStaleESM.Text             := FloatToStr(TGame_Defaults(mList[i]).FData.
       edtRemoveStaleSonar.Text           := FloatToStr(TGame_Defaults(mList[i]).FData.}
       edtSampleRateSurface.Text          := '';
       edtSampleRateAir.Text              := '';
       edtMaxNumSurface.Text              := '';
       edtMaxNumAir.Text                  := '';
       edtMaxRangeHF.Text                 := '';
       edtMaxRangeUnderwater.Text         := '';
       edtMaxRangeUHF.Text                := '';
       edtGuideOutrun.Text                := '';
       edtGuideEngangement.Text           := '';
       edtGuideShadow.Text                := '';
       edtClutterReduction.Text           := '';
       edtGuidanceSinuationAmplitude.Text := '';
       edtGuidanceSinuationPeriod.Text    := '';
       edtZigzagShortAmplitude.Text       := '';
       edtZigzagShortPeriod.Text          := '';
       edtZigzagLongAmplitude.Text        := '';
       edtZigzagLongPeriod.Text           := '';
       edtZigzagVeryLongAmplitude.Text    := '';
       edtZigzagVeryLongPeriod.Text       := '';
       edtDetectionUHF.Text               := '';
       edtDetectionHF.Text                := '';
       edtESMBEaring.Text                 := '';
       edtESMMaxIFF.Text                  := '';
       edtMHSImmediate.Text               := '';
       edtMHSFlash.Text                   := '';
       edtMHSRoutine.Text                 := '';
       edtMHSPriority.Text                := '';
       Show;
    end;
    Close;
  end
  else if fDBEditor.index = 1 then
  begin
    with fRuntimePlatform do begin
      edtRuntimeName.Text := '';
    end;
  end
  else if fDBEditor.index = 2 then
  begin
    with fPredefinedPattern do begin
      edtPatternName.Text := '';
      edtHeading.Text     := '';
      cbbType.Clear;
    end;
  end
  else if fDBEditor.index = 3 then
  begin
    with fPredefinedPattern do begin
      edtPatternName.Text := '';
      edtHeading.Text     := '';
      cbbType.Clear;
    end;
  end
  else if fDBEditor.index = 4 then
  begin
    with fOverlay do begin
      edtOverlayName.Text := '';
      edtArea.Text     := '';
      cbbType.Clear;
      cbbDomain.Clear;
    end;
  end
  else if fDBEditor.index = 5 then
  begin
    with fStudentRoleListWindow do begin
      edtName.Text := '';
    end;
  end
  else if fDBEditor.index = 7 then
  begin
    with fSnrVsPod do begin
      edtName.Text := '';
      btnEditList.Enabled := False;
    end;
  end;
end;

procedure TfOtherSingle.btnEditClick(Sender: TObject);
begin
  id  := lbTempId.Items.Strings[lbSingle.ItemIndex];

  if fDBEditor.index = 1 then
  begin
    isNew := False;
    Definition;
    fRuntimePlatform.Show;
  end
  else if fDBEditor.index = 2 then
  begin
    isNew := False;
    Definition;
    fPredefinedPattern.Show;
  end
  else if fDBEditor.index = 3 then
  begin
    isNew := False;
    Definition;
    //fOverlay.Show;
  end
  else if fDBEditor.index = 4 then
  begin
    isNew := False;
    Definition;
    fOverlay.Show;
  end
  else if fDBEditor.index = 5 then
  begin
    isNew := False;
    Definition;
    fStudentRoleListWindow.Show;

  end
  else if fDBEditor.index = 6 then
  begin
    isNew := False;
    Definition;
    fGameDefault.Show;
  end
  else if fDBEditor.index = 7 then
  begin
    isNew := False;
    Definition;
    fSnrVsPod.Show;
  end
  else if fDBEditor.index = 8 then
  begin

  end
end;

procedure TfOtherSingle.Definition;
var i:integer;
begin
  if fDBEditor.index = 1 then
  begin
    dmTTT.GetRuntime_Platform_Library(StrToInt(id),mList,fRuntimePlatform.runtime_library);
    for i := 0 to mList.Count - 1 do
    begin
      with fRuntimePlatform do
      begin
        if isCopy then
        begin
          edtRuntimeName.Text := 'Copy of '+ TRuntime_Platform_Library(mList[i]).FData.Library_Name;
          fOtherSingle.isNew := True;
        end
        else
          edtRuntimeName.Text := TRuntime_Platform_Library(mList[i]).FData.Library_Name;
      end;
    end;
  end
  else if fDBEditor.index = 2 then
  begin
    dmTTT.GetPredefined_Pattern(StrToInt(id),mList,fPredefinedPattern.pattern);

    for I := 0 to mList.Count - 1 do
    begin
      with fPredefinedPattern do
      begin
        if isCopy then
        begin
          edtPatternName.Text  := 'Copy of '+ TPredefined_Pattern(mList[i]).FData.Pattern_Identifier;
          isNew           := True;
        end
        else
          edtPatternName.Text  := TPredefined_Pattern(mList[i]).FData.Pattern_Identifier;

        cbbType.ItemIndex      := TPredefined_Pattern(mList[i]).FData.Pattern_Type;
        if TPredefined_Pattern(mList[i]).FData.Pattern_Termination = 0 then
          chkEventPattern.Checked := True
        else
          chkEventPattern.Checked := False;

        edtHeading.Text        := FloatToStr(TPredefined_Pattern(mList[i]).FData.Termination_Heading);

        dmTTT.GetVehicle_Definition(TPredefined_Pattern(mList[i]).FData.Vehicle_Index,vehicle);
        edt1.Text              := vehicle.FData.Vehicle_Identifier;
      end;

    end;
  end
  else if fDBEditor.index = 3 then
  begin
    //dmTTT.GetRadar_Interval_List(0,mList,RadarIntervalListForm.radar_interval);

  end
  else if fDBEditor.index = 4 then
  begin
    dmTTT.GetOverlay_Definition_List(StrToInt(id),mList,fOverlay.overlay_def);
    for i := 0 to mList.Count - 1 do
    begin
      with fOverlay do
      begin
        if isCopy then
        begin
          edtOverlayName.Text := 'Copy of '+ TOverlay_Definition(mList[i]).FData.Overlay_Identifier;
          fOtherSingle.isNew := True;
        end
        else
          edtOverlayName.Text := TOverlay_Definition(mList[i]).FData.Overlay_Identifier;

        cbbType.ItemIndex := TOverlay_Definition(mList[i]).FData.Static_Overlay;
        cbbDomain.ItemIndex := TOverlay_Definition(mList[i]).FData.Domain;
        dmTTT.GetGame_Area_DefByID(overlay_def.FData.Game_Area_Index, game_area_def);
        edtArea.Text := game_area_def.FGameArea.Game_Area_Identifier;

      end;
    end;

  end
  else if fDBEditor.index = 5 then
  begin
    dmTTT.GetStudent_Role_List(StrToInt(id),mList,fStudentRoleListWindow.student_list);
    for i := 0 to mList.Count - 1 do
    begin
      with fStudentRoleListWindow do
      begin
        if isCopy then
        begin
          edtName.Text := 'Copy of '+ TStudent_Role_List(mList[i]).FData.Role_List_Identifier;
          isNew := True;
        end
        else
          edtName.Text := TStudent_Role_List(mList[i]).FData.Role_List_Identifier;
      end;
    end;
  end
  else if fDBEditor.index = 6 then
  begin
    with fGameDefault do
    begin
      dmTTT.GetAllGame_Defaults(StrToInt(id),mList,fGameDefault.game_default);
      if isCopy then
      begin
        edtName.Text := 'Copy of '+ game_default.FData.Defaults_Identifier;
        isNew := True;
      end
      else
        edtName.Text := game_default.FData.Defaults_Identifier;
      Definition;
      Show;
    end;
  end
  else if fDBEditor.index = 7 then
  begin
    dmTTT.GetPOD_vs_SNR_Curve_Definition(StrToInt(id),mList,fSnrVsPod.POD);
    for I := 0 to mList.Count - 1 do
    begin
      with fSnrVsPod do
      begin
        if isCopy then
        begin
          edtName.Text := 'Copy of '+ TPOD_vs_SNR_Curve_Definition(mList[i]).FData.Curve_Definition_Identifier;
          fSnrVsPod.isNew := True;
        end
        else
          edtName.Text := TPOD_vs_SNR_Curve_Definition(mList[i]).FData.Curve_Definition_Identifier;

        Definition;
        Show;
      end;
    end;
  end
  else if fDBEditor.index = 8 then
  begin
   {
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Identifier);
      lbTempId.Items.Add(IntToStr(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Index));
    end;   }
  end
end;

procedure TfOtherSingle.btnNewClick(Sender: TObject);
begin
  isNew := True;
  NewDefinition;
end;

procedure TfOtherSingle.btnRemoveClick(Sender: TObject);
begin
  if fDBEditor.index = 1 then
  begin
    dmTTT.DeleteRuntime_Platform_Library(lbTempId.Items.Strings[lbSingle.ItemIndex]);
  end
  {else if fDBEditor.index = 2 then
  begin
    dmTTT.deleteAir_Bubble_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end
  else if fDBEditor.index = 3 then
  begin
    dmTTT.deleteChaff_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end    }
  else if fDBEditor.index = 4 then
  begin
    dmTTT.DeleteOverlay_Definition(lbTempId.Items.Strings[lbSingle.ItemIndex]);
  end
  else if fDBEditor.index = 5 then
  begin
    dmTTT.DeleteStudent_Role_List(lbTempId.Items.Strings[lbSingle.ItemIndex]);
  end
  else if fDBEditor.index = 6 then
  begin
    dmTTT.deleteGame_Defaults(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end;

  refresh;
end;

procedure TfOtherSingle.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
end;

procedure TfOtherSingle.FormShow(Sender: TObject);
begin
  if fDBEditor.index = 1 then
    Caption := 'Runtime Platform Library'
  else if fDBEditor.index = 2 then
    Caption := 'Predefined Patterns'
  else if fDBEditor.index = 3 then
    Caption := 'Radar Activation Intervals'
  else if fDBEditor.index = 4 then
    Caption := 'Graphical Overlays'
  else if fDBEditor.index = 5 then
    Caption := 'Student Roles'
  else if fDBEditor.index = 6 then
    Caption := 'Games Defaults'
  else if fDBEditor.index = 7 then
    Caption := 'SNR vs POD Curve'
  else if fDBEditor.index = 8 then
    Caption := 'Report Editor'
  else
    Caption := 'Report Viewer';

  refresh;
end;

procedure TfOtherSingle.refresh;
var i:integer;
begin
  if fDBEditor.index = 1 then
  begin
    dmTTT.GetRuntime_Platform_Library(0,mList,fRuntimePlatform.runtime_library);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TRuntime_Platform_Library(mList[I]).FData.Library_Name);
      lbTempId.Items.Add(IntToStr(TRuntime_Platform_Library(mList[I]).FData.Platform_Library_Index));
    end;
  end
  else if fDBEditor.index = 2 then
  begin
    dmTTT.GetPredefined_Pattern(0,mList,fPredefinedPattern.pattern);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TPredefined_Pattern(mList[I]).FData.Pattern_Identifier);
      lbTempId.Items.Add(IntToStr(TPredefined_Pattern(mList[I]).FData.Pattern_Index));
    end;
  end
  else if fDBEditor.index = 3 then
  begin
    dmTTT.GetRadar_Interval_List(0,mList,RadarIntervalListForm.radar_interval);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TRadar_Interval_List(mList[I]).FData.Interval_List_Identifier);
      lbTempId.Items.Add(IntToStr(TRadar_Interval_List(mList[I]).FData.Interval_List_Index));
    end;
  end
  else if fDBEditor.index = 4 then
  begin
    dmTTT.GetOverlay_Definition_List(0,mList,fOverlay.overlay_def);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TOverlay_Definition(mList[I]).FData.Overlay_Identifier);
      lbTempId.Items.Add(IntToStr(TOverlay_Definition(mList[I]).FData.Overlay_Index));
    end;
  end
  else if fDBEditor.index = 5 then
  begin
    dmTTT.GetStudent_Role_List(0,mList,fStudentRoleListWindow.student_list);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TStudent_Role_List(mList[I]).FData.Role_List_Identifier);
      lbTempId.Items.Add(IntToStr(TStudent_Role_List(mList[I]).FData.Role_List_Index));
    end;
  end
  else if fDBEditor.index = 6 then
  begin
    dmTTT.GetAllGame_Defaults(0,mList,fGameDefault.game_default);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TGame_Defaults(mList[I]).FData.Defaults_Identifier);
      lbTempId.Items.Add(IntToStr(TGame_Defaults(mList[I]).FData.Defaults_Index));
    end;
  end
  else if fDBEditor.index = 7 then
  begin
    dmTTT.GetPOD_vs_SNR_Curve_Definition(0,mList,fSnrVsPod.POD);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Identifier);
      lbTempId.Items.Add(IntToStr(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Index));
    end;
  end
  else if fDBEditor.index = 8 then
  begin
   // dmTTT.getAllRadar_On_Board(0,mList);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Identifier);
      lbTempId.Items.Add(IntToStr(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Index));
    end;
  end
end;





end.
