unit uSonarDoubleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_Sonar;

type
  TfSonarDoubleList = class(TForm)
    shp1: TShape;
    lbSonarSelect: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempIdAll: TListBox;
    lbAllSonar: TListBox;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnEditMount: TButton;
    lbTempSel: TListBox;
    procedure getSonar_Def;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditMountClick(Sender: TObject);
  private
    { Private declarations }


  public
    { Public declarations }
    sId   : string;
    sList : TList;
    ssList : TList;
    sonar : TSonar_On_Board;
    fromCharacteristic: boolean;
    fromSonobuoy: boolean;
    fromVehicle: boolean;
    procedure getDataSonar;
    procedure sonar_def;
    procedure setDefaultSonar;
  end;

var
  fSonarDoubleList: TfSonarDoubleList;

implementation

{$R *.dfm}
uses uDataModuleTTT, uSimDBEditor, uSonobuoyWindow, uCharacteristicLandmass,
  uVehicleAttributeWindow, uSonarPicklist, uSonar, uSonarMount;

procedure TfSonarDoubleList.btnAddClick(Sender: TObject);
var i :integer;
begin
  if fromVehicle then
  begin
    setDefaultSonar;
    dmTTT.InsertSonar(SonarMountForm.sonar);
    lbSonarSelect.Items.Add(lbAllSonar.Items[lbAllSonar.ItemIndex]);
    lbTempSel.Items.Add(IntToStr(SonarMountForm.sonar.FData.Sonar_Instance_Index));
    Refresh;
  end
  else
  begin
  sId := lbTempIdAll.Items.Strings[lbAllSonar.ItemIndex];
    for I := 0 to lbAllSonar.Items.Count - 1 do
     if lbAllSonar.Selected[I] then
     begin
      if lbSonarSelect.Count = 0 then
        begin
          lbSonarSelect.Items.Clear;
          lbSonarSelect.Items.Add(lbAllSonar.Items[I]);
          sId :=lbTempIdAll.Items[I];
        end
      else begin
        lbSonarSelect.Items.Add(lbAllSonar.Items[i]);
        lbAllSonar.Items.Add(lbSonarSelect.Items[0]);
        lbSonarSelect.Items.Delete(0);
        sId :=lbTempIdAll.Items[I];
      end;
     end;

   for I :=lbAllSonar.Items.Count - 1 downto 0 do
     if lbAllSonar.Selected[I] then
     begin
      lbAllSonar.Items.Delete(I);
      lbTempIdAll.Items.Delete(I);
     end;
  end;
end;

procedure TfSonarDoubleList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfSonarDoubleList.btnCopyClick(Sender: TObject);
begin
  fSonar.isCopy := True;
  getDataSonar;
end;

procedure TfSonarDoubleList.btnEditClick(Sender: TObject);
begin
  fSonar.isCopy := False;
  getDataSonar;
end;

procedure TfSonarDoubleList.btnEditMountClick(Sender: TObject);
begin
  if lbSonarSelect.ItemIndex <> -1 then
  begin
    SonarMountForm.sonar := ssList[lbSonarSelect.ItemIndex];
    with SonarMountForm do
    begin
      state := isEdit;
      Show;
    end;
  end;
end;

procedure TfSonarDoubleList.btnNewClick(Sender: TObject);
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

procedure TfSonarDoubleList.setDefaultSonar;
begin
   SonarMountForm.sonar := TSonar_On_Board(sList[lbAllSonar.ItemIndex]);
   with SonarMountForm.sonar do
   begin
     FData.Instance_Identifier := FDef.Sonar_Identifier;
     FData.Instance_Type := FDef.Sonar_Classification;
     FData.Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
     FData.Sonar_Index := FDef.Sonar_Index;
     FData.Minimum_Depth := 0;
     FData.Time_2_Deploy := 0;
     FData.Time_2_Stow := 0;
   end;
end;

procedure TfSonarDoubleList.getDataSonar;
begin
  sId  := lbTempIdAll.Items.Strings[lbAllSonar.ItemIndex];
  Sonar_Def;
  fSonar.Show;
end;

procedure TfSonarDoubleList.Sonar_Def;
var I: Integer;
begin

  dmTTT.getSonar_Def(StrToInt(sID),sList,fSonar.sonarObject);

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

procedure TfSonarDoubleList.btnOkClick(Sender: TObject);
begin
  if fromVehicle then
  begin
    Close;
  end
  else
  begin
    if sId = '' then
    begin
      Exit;
    end;
    //sId := lbTempIdAll.Items.Strings[lbSonarSelect.ItemIndex];
    if fromSonobuoy then
    begin
    SonobuoyWindowForm.edtSonarDef.Text := lbSonarSelect.Items[0];
    end;

    if fromCharacteristic then
    begin
    fCharacteristicLandmass.sonar_index := StrToInt(sId);
    fCharacteristicLandmass.edtSonar.Text := lbSonarSelect.Items[0];
    end;

    Close;
  end;
  //SonobuoyWindowForm.Show;
end;

procedure TfSonarDoubleList.btnRemoveClick(Sender: TObject);
var i :integer;
begin
  if fromVehicle then
  begin
    if lbSonarSelect.ItemIndex <> -1 then
    begin
      dmTTT.DeleteSonar_On_Board(lbTempSel.Items[lbSonarSelect.ItemIndex],SonarMountForm.sonar);
      lbTempSel.ItemIndex := lbSonarSelect.ItemIndex;
      lbSonarSelect.DeleteSelected;
      lbTempSel.DeleteSelected;
    end;
  end
  else
  begin
    for I := 0 to lbSonarSelect.Items.Count - 1 do
     if lbSonarSelect.Selected[I] then
     begin
      lbAllSonar.Items.Add(lbSonarSelect.Items[I]);
      lbTempIdAll.Items.Add(sId);
     end;

   for I :=lbSonarSelect.Items.Count - 1 downto 0 do
     if lbSonarSelect.Selected[I] then
     begin
      lbSonarSelect.Items.Delete(I);
      sId := '';
     end;
  end;
end;

procedure TfSonarDoubleList.FormCreate(Sender: TObject);
begin
  sList := Tlist.Create;
  ssList := TList.Create;
end;

procedure TfSonarDoubleList.FormShow(Sender: TObject);
begin
  getSonar_Def;
end;

procedure TfSonarDoubleList.getSonar_Def;
var i : integer;
begin

//get all sonar name
 uSimDBEditor.getAllSonar(0,sList,sonar);

 lbAllSonar.Items.Clear;
 lbSonarSelect.Items.Clear;
 lbTempIdAll.Items.Clear;
 lbTempSel.Clear;

 for I := 0 to sList.Count - 1 do
 begin
    lbAllSonar.Items.Add(TSonar_On_Board(sList[i]).FDef.Sonar_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TSonar_On_Board(sList[i]).FDef.Sonar_Index));
 end;

 if fromVehicle then
 begin
   dmTTT.getAllSonar_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, 0, ssList);

   for I := 0 to ssList.Count - 1 do
   begin
      lbSonarSelect.Items.Add(TSonar_On_Board(ssList[I]).FData.Instance_Identifier);
      lbTempSel.Items.Add(IntToStr(TSonar_On_Board(ssList[I]).FData.Sonar_Instance_Index));
   end;
 end;

end;

end.
