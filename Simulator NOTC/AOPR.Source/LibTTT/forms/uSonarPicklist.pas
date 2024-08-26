unit uSonarPicklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBAsset_Sonar;

type
  TfSonarPicklist = class(TForm)
    lbTempId: TListBox;
    lbSonar: TListBox;
    btnClose: TButton;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btnRemove: TButton;
    btnUsage: TButton;
    btnFilter: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure getSonar;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure Sonar_Def;
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
    procedure getDataSonar;
  public
    { Public declarations }
    id_sonar  : string;
  end;

var
  fSonarPicklist: TfSonarPicklist;
  sList         : TList;

implementation

{$R *.dfm}
uses uDataModuleTTT,uSimDBEditor,uSonar, uSonarMount;

procedure TfSonarPicklist.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfSonarPicklist.btnCopyClick(Sender: TObject);
begin
  fSonar.isCopy := True;
  getDataSonar;
end;

procedure TfSonarPicklist.btnEditClick(Sender: TObject);
begin
  fSonar.isCopy := False;
  getDataSonar;
end;

procedure TfSonarPicklist.getDataSonar;
begin
  id_sonar  := lbTempId.Items.Strings[lbSonar.ItemIndex];
  Sonar_Def;
  fSonar.Show;
end;


procedure TfSonarPicklist.btnNewClick(Sender: TObject);
begin
    with fSonar do begin
      isNew   := True;
      fSonar.edtClass.Text                          := '';
      fSonar.edtActiveDetectionRangeGeneral.Text    := '';
      fSonar.edtAssociatedCrossGeneral.Text         := '';
      fSonar.edtPassiveDetectionGeneral.Text        := '';
      fSonar.edtAssociatedSignalGeneral.Text        := '';
      fSonar.edtMaxDetectionGeneral.Text            := '';
      fSonar.edtActiveSonarGeneral.Text             := '';
      fSonar.edtActiveFreqGeneral.Text              := '';
      fSonar.edtSignalToNoise.Text                  := '';
      fSonar.edtPassiveFreqGeneral.Text             := '';
      fSonar.edtMaxOperatingGeneral.Text            := '';
      fSonar.edtOwnshipNoiseGeneral.Text            := '';
      fSonar.edtMaxSonarSpeedGeneral.Text           := '';
      fSonar.edtActiveIntegrationPeriodCharacteristic.Text := '';
      fSonar.edtPassiveIntegrationPeriodCharacteristic.Text := '';
      fSonar.edtShortRangeTimeInterval.Text         := '';
      fSonar.edtMediumRangeTimeInterval.Text        := '';
      fSonar.edtLongRangeTimeInterval.Text          := '';
      fSonar.edtTimeRequired.Text                   := '';
      fSonar.edtCobleLength.Text                    := '';
      fSonar.edtCoblePayoutRate.Text                := '';
      fSonar.edtTurnRateToKink.Text                 := '';
      fSonar.edtTimeRequiredToSettle.Text           := '';
      fSonar.edtMinimumTowSpeed.Text                := '';
      fSonar.edtMinDepth.Text                       := '';
      fSonar.edtmaxBearingReported.Text             := '';
      fSonar.edtMaxAverageBeamWidth.Text            := '';
      cbxSurfaceDetecting.Checked := False;
      cbxTorpedoDetecting.Checked := False;
      cbxSubSurfaceDetecting.Checked := False;
      cbxMineClass.Checked := False;
      cbxPassiveTarget.Checked := False;
      cbxPassiveInvestigating.Checked := False;
      cbxTracking.Checked := False;
      cbxDepthFinding.Checked := False;
      cbxArrayKinking.Checked := False;
      cbxBearingAmbiguity.Checked := False;

      cbCategoryGeneralSonar.Clear;
      cbOperatignMOdeGeneralSonar.Clear;
      cbxAssociatedCross.Clear;

      Show;
    end;
end;

procedure TfSonarPicklist.btnRemoveClick(Sender: TObject);
begin
  dmTTT.deleteSonar_Def(StrToInt(lbTempId.Items.Strings[lbSonar.ItemIndex]));
  getSonar;
end;

procedure TfSonarPicklist.FormCreate(Sender: TObject);
begin
  sList := TList.Create;
end;

procedure TfSonarPicklist.FormShow(Sender: TObject);
begin
  getSonar;
end;

procedure TfSonarPicklist.getSonar;
var int:integer;
begin

//get all sonar name
 dmTTT.getSonar_Def(0,sList,fSonar.sonarObject);

 lbSonar.Items.Clear;
 lbTempId.Items.Clear;

 for int := 0 to sList.Count - 1 do
 begin
    lbSonar.Items.Add(TSonar_On_Board(sList[int]).FDef.Sonar_Identifier);
    lbTempId.Items.Add(IntToStr(TSonar_On_Board(sList[int]).FDef.Sonar_Index));
 end;
end;

procedure TfSonarPicklist.Sonar_Def;
var I: Integer;
begin

  dmTTT.getSonar_Def(StrToInt(id_sonar),sList,fSonar.sonarObject);

  for i := 0 to sList.Count-1 do begin
    with fSonar do begin
      if isCopy then
      begin
        edtClass.Text   := 'Copy of ' + TSonar_On_Board(sList[i]).FDef.Sonar_Identifier;
        isNew := True;
      end
      else
        edtClass.Text                          := TSonar_On_Board(sList[i]).FDef.Sonar_Identifier;
      edtActiveDetectionRangeGeneral.Text    := FloatToStr(TSonar_On_Board(sList[i]).FDef.Active_Detect_Range);
      edtAssociatedCrossGeneral.Text         := FloatToStr(TSonar_On_Board(sList[i]).FDef.Known_Cross_Section);
      edtPassiveDetectionGeneral.Text        := FloatToStr(TSonar_On_Board(sList[i]).FDef.Passive_Detect_Range);
      edtAssociatedSignalGeneral.Text        := FloatToStr(TSonar_On_Board(sList[i]).FDef.Known_Cross_Section);
      edtMaxDetectionGeneral.Text            := FloatToStr(TSonar_On_Board(sList[i]).FDef.Max_Detect_Range);
      edtActiveSonarGeneral.Text             := FloatToStr(TSonar_On_Board(sList[i]).FDef.Active_Operating_Power);
      edtActiveFreqGeneral.Text              := FloatToStr(TSonar_On_Board(sList[i]).FDef.Active_Freq_of_Op);
      edtSignalToNoise.Text                  := FloatToStr(TSonar_On_Board(sList[i]).FDef.Known_Signal_Source);
      edtPassiveFreqGeneral.Text             := FloatToStr(TSonar_On_Board(sList[i]).FDef.Passive_Freq_of_Op);
      edtMaxOperatingGeneral.Text            := FloatToStr(TSonar_On_Board(sList[i]).FDef.Max_Operating_Depth);
      edtOwnshipNoiseGeneral.Text            := FloatToStr(TSonar_On_Board(sList[i]).FDef.Ownship_Increase_due_to_Active);
      edtMaxSonarSpeedGeneral.Text           := FloatToStr(TSonar_On_Board(sList[i]).FDef.Maximum_Sonar_Speed);
      edtActiveIntegrationPeriodCharacteristic.Text := IntToStr(TSonar_On_Board(sList[i]).FDef.Active_Int_Period);
      edtPassiveIntegrationPeriodCharacteristic.Text := IntToStr(TSonar_On_Board(sList[i]).FDef.Passive_Int_Period);
      edtShortRangeTimeInterval.Text         := FloatToStr(TSonar_On_Board(sList[i]).FDef.TIOW_Short_Range);
      edtMediumRangeTimeInterval.Text        := FloatToStr(TSonar_On_Board(sList[i]).FDef.TIOW_Medium_Range);
      edtLongRangeTimeInterval.Text          := FloatToStr(TSonar_On_Board(sList[i]).FDef.TIOW_Long_Range);
      edtTimeRequired.Text                   := FloatToStr(TSonar_On_Board(sList[i]).FDef.Time_2_Identify);
      edtCobleLength.Text                    := FloatToStr(TSonar_On_Board(sList[i]).FDef.Cable_Length);
      edtCoblePayoutRate.Text                := FloatToStr(TSonar_On_Board(sList[i]).FDef.Sonar_Depth_Rate_of_Change);
      edtTurnRateToKink.Text                 := FloatToStr(TSonar_On_Board(sList[i]).FDef.Turn_Rate_2_Kink);
      edtTimeRequiredToSettle.Text           := FloatToStr(TSonar_On_Board(sList[i]).FDef.Time_2_Settle_Kinked);
      edtMinimumTowSpeed.Text                := FloatToStr(TSonar_On_Board(sList[i]).FDef.Maximum_Tow_Speed);
      edtMinDepth.Text                       := FloatToStr(TSonar_On_Board(sList[i]).FDef.Minimum_Depth);
      edtmaxBearingReported.Text             := FloatToStr(TSonar_On_Board(sList[i]).FDef.Maximum_Reported_Bearing_Error);
      edtMaxAverageBeamWidth.Text            := FloatToStr(TSonar_On_Board(sList[i]).FDef.Average_Beam_Width);

      if TSonar_On_Board(sList[i]).FDef.Depth_Finding_Capable then
         cbxDepthFinding.Checked := True
      else cbxDepthFinding.Checked := False;

      if TSonar_On_Board(sList[i]).FDef.Tracking_Capable then
         cbxTracking.Checked := True
      else cbxTracking.Checked := False;

      if TSonar_On_Board(sList[i]).FDef.Surface_Detection_Capable then
         cbxSurfaceDetecting.Checked := True
      else cbxSurfaceDetecting.Checked := False;

      if TSonar_On_Board(sList[i]).FDef.SubSurface_Detection_Capable then
         cbxSubSurfaceDetecting.Checked := True
      else cbxSubSurfaceDetecting.Checked := False;

      if TSonar_On_Board(sList[i]).FDef.Torpedo_Detection_Capable then
         cbxTorpedoDetecting.Checked := True
      else cbxTorpedoDetecting.Checked := False;

      if TSonar_On_Board(sList[i]).FDef.Mine_Detection_Capable then
         cbxMineClass.Checked := True
      else cbxMineClass.Checked := False;

      if TSonar_On_Board(sList[i]).FDef.Kinking_Processing then
         cbxArrayKinking.Checked := True
      else cbxArrayKinking.Checked := False;

      if TSonar_On_Board(sList[i]).FDef.Bearing_Processing then
         cbxBearingAmbiguity.Checked := True
      else cbxBearingAmbiguity.Checked := False;

      if TSonar_On_Board(sList[i]).FDef.Passive_Processing then
         cbxPassiveInvestigating.Checked := True
      else cbxPassiveInvestigating.Checked := False;

      if TSonar_On_Board(sList[i]).FDef.Target_Identification then
         cbxPassiveTarget.Checked := True
      else cbxPassiveTarget.Checked := False;

      if TSonar_On_Board(sList[i]).FDef.Sonar_Category_Index = 0 then
        cbCategoryGeneralSonar.Text  := 'Hull-Mounted'
      else if TSonar_On_Board(sList[i]).FDef.Sonar_Category_Index = 1 then
        cbCategoryGeneralSonar.Text  := 'Variabel Depth'
      else if TSonar_On_Board(sList[i]).FDef.Sonar_Category_Index = 2 then
        cbCategoryGeneralSonar.Text  := 'Towed Array'
      else if TSonar_On_Board(sList[i]).FDef.Sonar_Category_Index = 3 then
        cbCategoryGeneralSonar.Text  := 'Sonobuoy'
      else if TSonar_On_Board(sList[i]).FDef.Sonar_Category_Index = 4 then
        cbCategoryGeneralSonar.Text  := 'Dipping';

    end;

  end;
end;
end.
