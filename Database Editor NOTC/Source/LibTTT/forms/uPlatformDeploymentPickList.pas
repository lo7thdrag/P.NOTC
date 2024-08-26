unit uPlatformDeploymentPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, uCoordConvertor,uDBAssetObject, MapXLib_TLB;

type
  TPlatformDeploymentPickListForm = class(TForm)
    Panel1: TPanel;

    btnFilter: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    GroupBox1: TGroupBox;
    cbForce: TCheckBox;
    cbClassification: TCheckBox;
    cbHide: TCheckBox;
    cbxForce: TComboBox;
    cbxClassification: TComboBox;
    lbTmpPlatf: TListBox;
    lbPlatforms: TListBox;
    lbForce: TListBox;
    lbType: TListBox;
    procedure btnFilterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbForceClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbPlatformsDblClick(Sender: TObject);
    procedure cbClassificationClick(Sender: TObject);
    procedure cbxForceChange(Sender: TObject);
    procedure cbxClassificationChange(Sender: TObject);
    procedure cbHideClick(Sender: TObject);
  private
    { Private declarations }
    FCoordPlatformConv : TCoordConverter;
    procedure getPlatforms;
  public
    { Public declarations }
    drawSimbols : boolean;
    procedure refreshPlatformList;

  end;

var
  PlatformDeploymentPickListForm: TPlatformDeploymentPickListForm;
  platforms_ins : TPlatform_Instance;

implementation

uses uSimDBEditor,newclassASTT,
uBaseCoordSystem, ufrmSummaryScenario, uDataModuleTTT;
{$R *.dfm}

procedure TPlatformDeploymentPickListForm.refreshPlatformList;
var idForce,idClass,deployed,I:integer;
begin

 idForce := -1;
 idClass := -1;
 deployed := 0;

 if cbForce.Checked and (cbxForce.Text <> '') then
  idForce := cbxForce.ItemIndex + 1;

 if cbClassification.Checked and (cbxClassification.Text <> '') then
  idClass := cbxClassification.ItemIndex;

 if cbHide.Checked then
  deployed  := 1;

 if (idForce <> -1) or (idClass <> -1) or (deployed <> 0) then
 begin
  with SimMgr do
  begin
//   Platform_Insts.Clear;
//   dmTTT.filterPlatFormInstance(frmSummaryScenario.ResourceAllocation.FData.Resource_Alloc_Index,
//    idForce,idClass,deployed,Platform_Insts);

//   lbPlatforms.Items.Clear;
//   lbTmpPlatf.Items.Clear;
   for I:= 0 to Platform_Insts.Count - 1 do
   begin
    lbPlatforms.Items.Add(TPlatform_Instance(Platform_Insts[I]).FData.Instance_Name);
    lbTmpPlatf.Items.Add(inttostr(TPlatform_Instance(Platform_Insts[I]).FData.Platform_Instance_Index));
   end;
  end;
 end
 else getPlatforms;
end;

procedure TPlatformDeploymentPickListForm.getPlatforms;
var i:integer;
begin
  lbTmpPlatf.Clear;
  lbPlatforms.Clear;
  lbForce.Clear;
  lbType.Clear;

//  if frmScenario.id_resourceAlloc <> 0 then
//     dmTTT.getPlatFormInstance(frmScenario.id_resourceAlloc,0,'',SIMMgr.Platform_Insts)
//  else
//     dmTTT.getPlatFormInstance(frmScenario.Scenario.FData.Resource_Alloc_Index,0,'',SIMMgr.Platform_Insts);

  for I := 0 to SIMMgr.Platform_Insts.Count - 1 do
  begin
    lbPlatforms.Items.Add(TPlatform_Instance(SIMMgr.Platform_Insts[i]).FData.Instance_Name);
    lbTmpPlatf.Items.Add(IntToStr(TPlatform_Instance(SIMMgr.Platform_Insts[i]).FData.Platform_Instance_Index));
    lbForce.Items.Add(IntToStr(TPlatform_Instance(SIMMgr.Platform_Insts[i]).FData.Force_Designation));
    //get platform activation
//    dmTTT.GetPlatform_ActivationToPlatformInstance(TPlatform_Instance(SIMMgr.Platform_Insts[i]).FData.Platform_Instance_Index, fPlatformDeploytment.platformSelect);
    //set bitmap posision
//    with fPlatformDeploytment.platformObj do
//    begin
//       Center.X := Round(fPlatformDeploytment.platformSelect.FActivation.Init_Position_Longitude);
//       Center.Y := Round(fPlatformDeploytment.platformSelect.FActivation.Init_Position_Latitude);
//    end;
//    fPlatformDeploytment.platformList.Add(fPlatformDeploytment.platformObj);
  end;
end;

procedure TPlatformDeploymentPickListForm.lbPlatformsDblClick(Sender: TObject);
begin
  btnOK.Click;
end;

procedure TPlatformDeploymentPickListForm.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TPlatformDeploymentPickListForm.btnFilterClick(Sender: TObject);
begin
 if PlatformDeploymentPickListForm.Height = 453 then
 begin
  btnFilter.Caption := '<<Filter';
  PlatformDeploymentPickListForm.Height := 589;
  cbxForce.Enabled := True;
  cbxClassification.Enabled := True;
 // cbForce.Checked := False;
 // cbHide.Checked := True;
 // cbClassification.Checked := False;
  refreshPlatformList;
 end
 else
 begin
   btnFilter.Caption := 'Filter>>';
   PlatformDeploymentPickListForm.Height := 453;
 end;

end;

procedure TPlatformDeploymentPickListForm.btnOKClick(Sender: TObject);
var
  stringLat, stringLong : string;
begin
  if lbPlatforms.ItemIndex >= 0 then
  begin

   //setFocusedPlatform(strtoint(lbTmpPlatf.Items[lbPlatforms.ItemIndex]));
   idFocusedPlatform := strtoint(lbTmpPlatf.Items[lbPlatforms.ItemIndex]);

//   with fPlatformDeploytment do
//   begin
//    //drawSimbols := false;
//    edPlatform.Text := lbPlatforms.Items.Strings[lbPlatforms.ItemIndex];
//    //TPlatform_Instance(Platform_Insts[I]).FData.Platform_Instance_Index
//    fPlatformDeploytment.platformSelect := TPlatform_Instance(SIMMgr.Platform_Insts[lbPlatforms.ItemIndex]);
//    dmTTT.GetPlatform_ActivationToPlatformInstance(idFocusedPlatform, fPlatformDeploytment.platformSelect);
//    with fPlatformDeploytment.platformSelect.FActivation do
//    begin
//     edLatPosition.Text := formatDM_latitude(Init_Position_Latitude);
//     edLongPosition.Text := formatDM_longitude(Init_Position_Longitude);
//
//     {stringLat := '00° 00.000' + ''' ' + 'N';
//     stringLong := '000° 00.000' + ''' ' + 'E';
//
//     if (edLatPosition.Text = stringLat) AND (edLongPosition.Text = stringLong) then
//        drawSimbols := true
//     else
//        drawSimbols := false; }
//
//     //drawSimbols := true;
//
//     edVert.text := FormatFloat('0.000', Init_Position_Cartesian_Y);
//     edHorz.text := FormatFloat('0.000', Init_Position_Cartesian_X);
//     edCourse.Text := FormatFloat('0.000', Init_Course);
//     edHelmAngle.Text := FormatFloat('0.000', Init_Helm_Angle);
//     cbGroundSpeed.ItemIndex := Init_Ground_Speed;
//     edAltitude.Text := FormatFloat('0.000', Init_Altitude);
//     cbVerticalSpeed.ItemIndex := Init_Vertical_Speed;
//
//    {tambahan dari aldy }
//    //set cblateralGuid
//    cbLateralGuid.ItemIndex := Init_Guidance_Type;
//    //jalankan event perubahan pada cbLateral
//    cbLateralGuidChange(Sender);
//
//    case cbLateralGuid.ItemIndex of
//     -1: grbDefaultKosong.BringToFront;
//     0:
//      begin
//      //grbStraightGuidance.BringToFront;
//      edtCourse_StraightGuidance.Text := FloatToStr(Init_Command_Course);
//      cmbGroundSpeed_StraightGuidance.ItemIndex := Init_Command_Ground;
//      end;
//     1:
//      begin
//      //grbPatternOnSelfGuidance.BringToFront;
//      edtPredefinedPattern_PatternOnSelfGuidance.Text := FloatToStr(Pattern_Instance_Index);
//      edtAngularOffset_PatternOnSelfGuidance.Text := FloatToStr(Angular_Offset);
//      end;
//     2:
//      begin
//      //grbPatternOnTargetGuidance.BringToFront;
//      edtPredefinedPattern_PatternOnTargetGuidance.Text := FloatToStr(Pattern_Instance_Index);
//      edtTarget_PatternOnTargetGuidance.Text := FloatToStr(Guidance_Target);
//      edtAngularOffset_PatternOnTargetGuidance.Text := FloatToStr(Angular_Offset);
//      end;
//     3:
//      begin
//      //grbPatternOnPointGuidance.BringToFront;
//      edtPredefinedPattern_PatternOnPointGuidance.Text := FloatToStr(Pattern_Instance_Index);
//      edtAngularOffset_PatternOnPointGuidance.Text := FloatToStr(Angular_Offset);
//      edtLatAnchor_PatternOnPointGuidance.Text := FloatToStr(Anchor_Latitude);
//      edtLongAnchor_PatternOnPointGuidance.Text := FloatToStr(Anchor_Longitude);
//      edtXanchor_PatternOnPointGuidance.Text := FloatToStr(Anchor_Cartesian_X);
//      edtYanchor_PatternOnPointGuidance.Text := FloatToStr(Anchor_Cartesian_Y);
//      end;
//     4:
//      begin
//      //grbHelmGuidance.BringToFront;
//      edtHelmAngle_HelmGuidance.Text := FloatToStr(Init_Helm_Angle);
//      cmbGroundSpeed_HelmGuidance.ItemIndex := Init_Ground_Speed;
//      end;
//     5:
//      begin
//      //grbReturnToBaseGuidance.BringToFront;
//        cmbGroundSpeed_ReturnToBaseGuidance.ItemIndex := Init_Ground_Speed;
//        edtBase_ReturnToBaseGuidance.Text := FloatToStr(Target_Range);
//      end;
//     6:
//      begin
//      //grbStationKeepOnTrackGuidance.BringToFront;
//        edtTarget_StationKeepOnTrackGuidance.Text := FloatToStr(Guidance_Target);
//        edtTargetRange_StationKeepOnTrackGuidance.Text := FloatToStr(Target_Range);
//        //always true blm tahu ngambil dari mana
//        cbxAbsoluteOffsiteAngle_StationKeepOnTrackGuidance.Checked := true;
//      end;
//     7:
//      begin
//      //grbStationKeepOnPositionGuidance.BringToFront;
//        edtAnchorLat_StationKeepOnPositionGuidance.Text := FloatToStr(Anchor_Latitude);
//        edtAnchorLong_StationKeepOnPositionGuidance.Text := FloatToStr(Anchor_Longitude);
//        edtAnchorX_StationKeepOnPositionGuidance.Text := FloatToStr(Anchor_Cartesian_X);
//        edtAnchorY_StationKeepOnPositionGuidance.Text := FloatToStr(Anchor_Cartesian_Y);
//        //always true blm tahu ngambil dari mana
//        cbxDriftsOnCurrent_StationKeepOnPositionGuidance.Checked := true;
//      end;
//     8:
//      begin
//      //grbCircleOnTrackGuidance.BringToFront;
//        edtTarget_CircleOnTrackGuidance.Text := FloatToStr(Guidance_Target);
//        edtRadius_CircleOnTrackGuidance.Text := FloatToStr(Radius_of_Travel);
//        cmbDirection_CircleOnTrackGuidance.ItemIndex := Direction_of_Travel;
//        cmbGroundSpeed_CircleOnTrackGuidance.ItemIndex := Init_Ground_Speed;
//        edtRangeOffset_CircleOnTrackGuidance.Text := FloatToStr(Dynamic_Circle_Range_Offset);
//        edtAngleOffset_CircleOnTrackGuidance.Text := FloatToStr(Dynamic_Circle_Angle_Offset);
//
//        //always true blm tahu ngambil dari mana
//        cbxAbsoluteOffsetAngle_CircleOnTrackGuidance.Checked := true;
//      end;
//     9:
//      begin
//      //grbCircleOnPointGuidance.BringToFront;
//        edtCentreLat_CircleOnPointGuidance.Text := FloatToStr(Circle_Latitude);
//        edtCentreLong_CircleOnPointGuidance.Text := FloatToStr(Circle_Longitude);
//        edtCentreX_CircleOnPointGuidance.Text := FloatToStr(Circle_X);
//        edtCentreY_CircleOnPointGuidance.Text := FloatToStr(Circle_Y);
//        edtRadius_CircleOnPointGuidance.Text := FloatToStr(Radius_of_Travel);
//        cmbDirection_CircleOnPointGuidance.ItemIndex := Direction_of_Travel;
//        cmbGroundSpeed_CircleOnPointGuidance.ItemIndex := Init_Ground_Speed;
//      end;
//     10:
//      begin
//      //grbZigZagGuidance.BringToFront;
//        cmbLegLength_ZigZagGuidance.ItemIndex := Zig_Zag_Leg_Type;
//        edtBaseCourse_ZigZagGuidance.Text := FloatToStr(Init_Course);
//        edtPeriod_ZigZagGuidance.Text := FloatToStr(Period_Distance);
//        edtAmplitude_ZigZagGuidance.Text := FloatToStr(Amplitude_Distance);
//        cmbGroundSpeed_ZigZagGuidance.ItemIndex := Init_Ground_Speed;
//      end;
//     11:
//      begin
//      //grbSinuateGuidance.BringToFront;
//        edtBaseCourse_SinuateGuidance.Text := FloatToStr(Init_Course);
//        edtPeriod_SinuateGuidance.Text := FloatToStr(Period_Distance);
//        edtAmplitude_SinuateGuidance.Text := FloatToStr(Amplitude_Distance);
//        cmbGroundSpeed_SinuateGuidance.ItemIndex := Init_Ground_Speed;
//      end;
//     12:
//      begin
//      //grbShadowGuidance.BringToFront;
//        edtTarget_ShadowGuidance.Text := FloatToStr(Guidance_Target);
//        edtTargetRange_ShadowGuidance.Text := FloatToStr(Target_Range);
//      end;
//     13:
//      begin
//      //grbEngagementGuidance.BringToFront;
//        edtTarget_EngagementGuidance.Text := FloatToStr(Guidance_Target);
//        edtTargetRange_EngagementGuidance.Text := FloatToStr(Target_Range);
//      end;
//     14:
//      begin
//      //grbEvasionGuidance.BringToFront;
//        edtTarget_EvasionGuidance.Text := FloatToStr(Guidance_Target);
//      end;
//     15:
//      begin
//      //grbOutRunGuidance.BringToFront;
//        edtTarget_OutRunGuidance.Text := FloatToStr(Guidance_Target);
//      end;
//     16:
//      begin
//      //grbWayPointGuidance.BringToFront;
//        cmbType_WayPointGuidance.ItemIndex := Waypoint_Termination;
//        edtRadius_WayPointGuidance.Text := FloatToStr(Radius_of_Travel);
//        edtTarget_WayPointGuidance.Text := FloatToStr(Guidance_Target);
//      end;
//    end;
//    end;
//   end;
//    fPlatformDeploytment.indexFocusedPaltform := fPlatformDeploytment.getIndexByID(idFocusedPlatform);
//    fPlatformDeploytment.Map1.Repaint;
    Close;
  end
  else
    MessageDlg('Please choose item first...',mtWarning,mbOKCancel,0);
end;

procedure TPlatformDeploymentPickListForm.cbClassificationClick(
  Sender: TObject);
begin
//  refreshPlatformList;
  cbxClassification.Enabled := True;
end;

procedure TPlatformDeploymentPickListForm.cbForceClick(Sender: TObject);
begin
//  refreshPlatformList;
  cbxForce.Enabled := True;
end;

procedure TPlatformDeploymentPickListForm.cbHideClick(Sender: TObject);
begin
  refreshPlatformList;
end;

procedure TPlatformDeploymentPickListForm.cbxClassificationChange(
  Sender: TObject);
begin
  refreshPlatformList;
end;

procedure TPlatformDeploymentPickListForm.cbxForceChange(Sender: TObject);
begin
  refreshPlatformList;
end;

procedure TPlatformDeploymentPickListForm.FormCreate(Sender: TObject);
begin
  platforms_ins := TPlatform_Instance.Create;
end;

procedure TPlatformDeploymentPickListForm.FormShow(Sender: TObject);
begin
 Height := 453;
 getPlatforms;
 //cbForce.Checked  := True;
// cbClassification.Checked := True;
 //cbHide.Checked := True;
 cbxForce.Text  := '[None]';
 cbxClassification.Text := '[None]';
// refreshPlatformList;  >>cendol dulu ye,, sementara gak pake filter
end;

end.
