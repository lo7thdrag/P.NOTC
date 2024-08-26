unit uFrmSonarView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls,uDBAsset_Sonar, uSimContainers, uBaseCoordSystem, tttData;

type
  TfrmSonarView = class(TForm)
    ImgBackgroundList: TImage;
    ImgBackground: TImage;
    Label4: TLabel;
    lstSonar: TListBox;
    Label2: TLabel;
    lblName: TLabel;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    pnlTabTA: TPanel;
    Image3: TImage;
    Label35: TLabel;
    Label41: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    chkArrayKinking: TCheckBox;
    chkBearingAmbiguity: TCheckBox;
    pnlTabChar: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label5: TLabel;
    medtTimeToIdentifyTarget: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtCableLength: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtCablePayoutRate: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    edtSNRvsPODCurve: TLabel;
    Label27: TLabel;
    Label32: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    chkPassiveTargetInvestigation: TCheckBox;
    pnlTabGeneral: TPanel;
    Image2: TImage;
    Label16: TLabel;
    Label26: TLabel;
    edtCrossSection: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtSignalSourceLevel: TLabel;
    Label39: TLabel;
    Label28: TLabel;
    edtActiveSonarPower: TLabel;
    Label36: TLabel;
    Label40: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtSonarCategory: TLabel;
    Label43: TLabel;
    edtSonarOM: TLabel;
    Label37: TLabel;
    Label12: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    edtMaxOperatingDepth: TLabel;
    Label47: TLabel;
    edtOwnshipNoiseDueSonarActiveMode: TLabel;
    Label51: TLabel;
    edtMaxSonarSpeed: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    Label58: TLabel;
    Panel2: TPanel;
    chkSurfaceDetecting: TCheckBox;
    chkSubSurfaceDetecting: TCheckBox;
    chkMineDetecting: TCheckBox;
    chkTorpedoDetecting: TCheckBox;
    Panel5: TPanel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    Label59: TLabel;
    Label46: TLabel;
    Label60: TLabel;
    edtArrayKinkingTurnRate: TLabel;
    medtArrayKinkingSettleTime: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label44: TLabel;
    Label50: TLabel;
    edtMinTowSpeed: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    edtMinDepth: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    edtMaxBearingError: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    edtAverageBeamWidth: TLabel;
    Label78: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label65: TLabel;
    medtIntegrationPeriodActive: TLabel;
    Label74: TLabel;
    medtIntegrationPeriodPassive: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Panel6: TPanel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    edtTimeIntervalWatchShort: TLabel;
    Label86: TLabel;
    edtTimeIntervalWatchMedium: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    edtTimeIntervalWatchLong: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Panel7: TPanel;
    chkPassiveTMAInvestigating: TCheckBox;
    chkDepthFinding: TCheckBox;
    chkTracking: TCheckBox;
    Label7: TLabel;
    Label9: TLabel;
    edtActiveFrequency: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Panel8: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    edtPassiveFrequency: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtActiveDetectionRange: TLabel;
    Label71: TLabel;
    Label77: TLabel;
    Panel10: TPanel;
    Label85: TLabel;
    Label87: TLabel;
    edtPassiveDetectionRange: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    edtMaxDetectionRange: TLabel;
    Label99: TLabel;
    Label49: TLabel;
    Label55: TLabel;
    lbl1: TLabel;
    edt1: TEdit;
    imgBtnBack: TImage;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure imgBtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);

  private
    tabIndex, tabMax : Integer;
    FSonarList : TList;
    FSelectedSonar : TSonar_On_Board;

  public
    procedure UpdateTabPage;
    procedure UpdateSonarList;
    procedure UpdateSonarData;

    procedure UpdateSNRvsPODData;
  end;

var
  frmSonarView: TfrmSonarView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSonarView.edtCheatKeyPress(Sender: TObject; var Key: Char);
  var
  i : Integer;
  sonar : TSonar_On_Board;
begin
  if Key = #13 then
  begin
  lstSonar.Items.Clear;

  dmTTT.GetfilterSonarDef(FSonarList,edt1.Text);
    for i := 0 to FSonarList.Count - 1 do
    begin
    sonar := FSonarList.Items[i];
    lstSonar.Items.AddObject(sonar.FDef.Sonar_Identifier, sonar)
    end;
  end;
end;

procedure TfrmSonarView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FSonarList);
  Action := cafree;
end;

procedure TfrmSonarView.FormCreate(Sender: TObject);
begin
 FSonarList := TList.Create;
end;

procedure TfrmSonarView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 3;

  UpdateTabPage;
  UpdateSonarList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSonarView.imgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSonarView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmSonarView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmSonarView.lbSingleClick(Sender: TObject);
begin
  if lstSonar.ItemIndex = -1 then
    Exit;

  FSelectedSonar := TSonar_On_Board(lstSonar.Items.Objects[lstSonar.ItemIndex]);

  UpdateSonarData;
end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmSonarView.UpdateSonarData;
var
  timeStr : string;
begin
  with FSelectedSonar do
  begin
      lblName.Caption := FDef.Sonar_Identifier;

    {$REGION ' General '}
    case FDef.Sonar_Category_Index of
      Ord(cSonarHull) : edtSonarCategory.Caption := csSonarHull;
      Ord(cSonarVariableDepth) : edtSonarCategory.Caption := csSonarVariableDepth;
      Ord(cSonarSonobuoy) : edtSonarCategory.Caption := csSonarSonobuoy;
      Ord(cSonarDipping) : edtSonarCategory.Caption := csSonarDipping;
    end;

    case FDef.Sonar_Classification of
      Ord(omSonarActive) : edtSonarOM.Caption := omsSonarActive;
      Ord(omSonarPassive) : edtSonarOM.Caption := omsSonarPassive;
      Ord(omSonarOr) : edtSonarOM.Caption := omsSonarOr;
      Ord(omSonarPassiveInt) : edtSonarOM.Caption := omsSonarPassiveInt;
    end;

    chkSurfaceDetecting.Checked := FDef.Surface_Detection_Capable;
    chkSubSurfaceDetecting.Checked := FDef.SubSurface_Detection_Capable;
    chkTorpedoDetecting.Checked := FDef.Torpedo_Detection_Capable;
    chkMineDetecting.Checked := FDef.Mine_Detection_Capable;

    edtActiveFrequency.Caption := FormatFloat('0.000', FDef.Active_Freq_of_Op);
    edtPassiveFrequency.Caption := FormatFloat('0.000', FDef.Passive_Freq_of_Op);

    edtActiveDetectionRange.Caption := FormatFloat('0.00', FDef.Active_Detect_Range);
    edtPassiveDetectionRange.Caption := FormatFloat('0.00', FDef.Passive_Detect_Range);
    edtMaxDetectionRange.Caption := FormatFloat('0.00', FDef.Max_Detect_Range);

    edtCrossSection.Caption := FormatFloat('0.00', FDef.Known_Cross_Section);
    edtSignalSourceLevel.Caption := FormatFloat('0.0', FDef.Known_Signal_Source);
    edtActiveSonarPower.Caption := FormatFloat('0.000', FDef.Active_Operating_Power);
    edtMaxOperatingDepth.Caption := FormatFloat('0', FDef.Max_Operating_Depth);
    edtMaxSonarSpeed.Caption := FormatFloat('0.00', FDef.Maximum_Sonar_Speed);
    edtOwnshipNoiseDueSonarActiveMode.Caption := FormatFloat('0.0', FDef.Ownship_Increase_due_to_Active);

    {$ENDREGION}

    {$REGION ' Characteristics '}
    SecondToTime(FDef.Active_Int_Period, timeStr);
    medtIntegrationPeriodActive.Caption := timeStr;

    SecondToTime(FDef.Passive_Int_Period, timeStr);
    medtIntegrationPeriodPassive.Caption := timeStr;

    edtTimeIntervalWatchShort.Caption := FormatFloat('0.00', FDef.TIOW_Short_Range);
    edtTimeIntervalWatchMedium.Caption := FormatFloat('0.00', FDef.TIOW_Medium_Range);
    edtTimeIntervalWatchLong.Caption := FormatFloat('0.00', FDef.TIOW_Long_Range);

    SecondToTime(FDef.Time_2_Identify, timeStr);
    medtTimeToIdentifyTarget.Caption := timeStr;

    edtCableLength.Caption := FormatFloat('0', FDef.Cable_Length);
    edtCablePayoutRate.Caption := FormatFloat('0.00', FDef.Depth_per_Speed);

//    edtSNRvsPODCurve.Caption := FPOD.Curve_Definition_Identifier;

    chkPassiveTargetInvestigation.Checked := FDef.Target_Identification;
    chkPassiveTMAInvestigating.Checked := FDef.Passive_Processing;
    chkDepthFinding.Checked := FDef.Depth_Finding_Capable;
    chkTracking.Checked := FDef.Tracking_Capable;

//    UpdateSNRvsPODData;

    {$ENDREGION}

    {$REGION ' Tower Array '}
    chkArrayKinking.Checked := FDef.Kinking_Processing;
    edtArrayKinkingTurnRate.Caption := FormatFloat('0.00', FDef.Turn_Rate_2_Kink);

    SecondToTime(FDef.Time_2_Settle_Kinked, timeStr);
    medtArrayKinkingSettleTime.Caption := timeStr;

    edtMinTowSpeed.Caption := FormatFloat('0.00', FDef.Tow_Speed);
    edtMinDepth.Caption := FormatFloat('0', FDef.Minimum_Depth);
    edtMaxBearingError.Caption := FormatFloat('0', FDef.Maximum_Reported_Bearing_Error);
    edtAverageBeamWidth.Caption := FormatFloat('0', FDef.Average_Beam_Width);
    chkBearingAmbiguity.Checked := FDef.Bearing_Processing;
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmSonarView.UpdateSonarList;
var
  i : Integer;
  sonar : TSonar_On_Board;
begin
  lstSonar.Items.Clear;

  dmTTT.GetAllSonarDef(FSonarList);

  for i := 0 to FSonarList.Count - 1 do
  begin
    sonar := FSonarList.Items[i];
    lstSonar.Items.AddObject(sonar.FDef.Sonar_Identifier, sonar);
  end;
end;

procedure TfrmSonarView.UpdateTabPage;
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
      lblTab.Caption := 'CHARACTERISTICS';
      pnlTabChar.BringToFront;
    end;
    2:
    begin
      lblTab.Caption := 'TOWER ARRAY';
      pnlTabTA.BringToFront;
    end;
    3:
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

procedure TfrmSonarView.UpdateSNRvsPODData;
begin
  with FSelectedSonar do
  begin
    if dmTTT.GetPODvsSNRCurveDef(FDef.Curve_Detection_Index, FPOD) then
      edtSNRvsPODCurve.Caption := FPOD.Curve_Definition_Identifier
    else
      edtSNRvsPODCurve.Caption := 'None';
  end;
end;

{$ENDREGION}

end.
