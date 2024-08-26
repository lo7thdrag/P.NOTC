unit uFrmRadarView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls,UDBAsset_Radar, uSimContainers, tttData;

type
  TfrmRadarView = class(TForm)
    lstRadar: TListBox;
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    Label4: TLabel;
    Label2: TLabel;
    Panel9: TPanel;
    lblName: TLabel;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    pnlTabGeneral: TPanel;
    Label16: TLabel;
    Label26: TLabel;
    edtBaselineDelectionRange: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtAssociatedCrossSection: TLabel;
    Label39: TLabel;
    Label28: TLabel;
    edtMaxUnambigous: TLabel;
    Label36: TLabel;
    pnlTabChar: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label5: TLabel;
    edtFrequency: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtScanRate: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtPulseRepetitionFrequency: TLabel;
    Label1: TLabel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label17: TLabel;
    edtPulseWidth: TLabel;
    edtPower: TLabel;
    edtClutterRejection: TLabel;
    edtBeamWidth: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label40: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    chkValidVertical2: TCheckBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtRadarType: TLabel;
    Label38: TLabel;
    edtECOMType: TLabel;
    Label43: TLabel;
    edtEmitterType: TLabel;
    ImgBackground: TImage;
    Image2: TImage;
    Label37: TLabel;
    Panel2: TPanel;
    chkAltitudeData: TCheckBox;
    chkGroundSpeedData: TCheckBox;
    chkPlatformTypeRecognition: TCheckBox;
    chkPlatformClassRecognition: TCheckBox;
    chkHeadingData: TCheckBox;
    chkSectorscan: TCheckBox;
    Label12: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    edtNumberofFCR: TLabel;
    Label47: TLabel;
    edtOTHRadarFactor: TLabel;
    Label49: TLabel;
    edtMainLobeGain: TLabel;
    Label51: TLabel;
    edtSpotNumber: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    pnlTabAJ: TPanel;
    Label35: TLabel;
    lblPercentageMaxUnambigous: TLabel;
    Panel3: TPanel;
    chkTypeAJammingResistant: TCheckBox;
    chkTypeBJammingResistant: TCheckBox;
    Panel4: TPanel;
    chkTypeCJammingResistant: TCheckBox;
    trckbrJammerStrength: TTrackBar;
    lblJammerStrength: TLabel;
    chkAntiJammingCapable: TCheckBox;
    chkCancelTypeA: TCheckBox;
    chkCancelTypeB: TCheckBox;
    chkCancelTypeC: TCheckBox;
    trckbrPercentageMaxUnambigous: TTrackBar;
    Image3: TImage;
    Label41: TLabel;
    Label44: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label58: TLabel;
    Panel5: TPanel;
    edtCheat: TEdit;
    lblsearch: TLabel;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure ImgBtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure trckbrJammerStrengthChange(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);

  private
   tabIndex, tabMax : Integer;
   FRadarList : TList;
   FSelectedRadar : TRadar_On_Board;

  public
    procedure UpdateTabPage;
    procedure UpdateRadarList;
    procedure UpdateRadarData;

  end;

var
  frmRadarView: TfrmRadarView;

implementation

uses
  uDataModuleTTT ;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmRadarView.edtCheatKeyPress(Sender: TObject; var Key: Char);
  var
  i : Integer;
  radar : TRadar_On_Board;
begin
  if Key = #13 then
  begin
  lstRadar.Items.Clear;

  dmTTT.GetfilterRadarDef(FRadarList,edtCheat.Text);
    for i := 0 to FRadarList.Count - 1 do
    begin
 radar := FRadarList.Items[i];
    lstRadar.Items.AddObject(radar.FDef.Radar_Identifier, radar);
    end;
  end;
end;

procedure TfrmRadarView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FRadarList);
  Action := cafree;
end;

procedure TfrmRadarView.FormCreate(Sender: TObject);
begin
 FRadarList := TList.Create;
end;

procedure TfrmRadarView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 3;

  UpdateTabPage;
  UpdateRadarList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmRadarView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRadarView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmRadarView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmRadarView.lbSingleClick(Sender: TObject);
begin
  if lstRadar.ItemIndex = -1 then
    Exit;

  FSelectedRadar := TRadar_On_Board(lstRadar.Items.Objects[lstRadar.ItemIndex]);

  UpdateRadarData;
end;

procedure TfrmRadarView.trckbrJammerStrengthChange(Sender: TObject);
begin

end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmRadarView.UpdateRadarData;
begin
  with FSelectedRadar do
  begin
    lblName.Caption := FDef.Radar_Identifier;

    {$REGION ' General '}
    case FDef.Radar_Type of
      Ord(tRadarSearch) : edtRadarType.Caption := tsRadarSearch;
      Ord(tRadarFireControl) : edtRadarType.Caption := tsRadarFireControl;
      Ord(tRadarBoth) : edtRadarType.Caption := tsRadarBoth;
    end;

    case FDef.ECCM_Type of
      Ord(eccmtRadarA) : edtECOMType.Caption := eccmtsRadarA;
      Ord(eccmtRadarB) : edtECOMType.Caption := eccmtsRadarB;
      Ord(eccmtRadarC) : edtECOMType.Caption := eccmtsRadarC;
    end;

    edtEmitterType.Caption := FDef.Radar_Emitter;
    edtBaselineDelectionRange.Caption := FormatFloat('0.00', FDef.Detection_Range);
    edtAssociatedCrossSection.Caption := FormatFloat('0.00', FDef.Known_Cross_Section);
    edtMaxUnambigous.Caption := FormatFloat('0.00', FDef.Max_Unambig_Detect_Range);
    edtNumberofFCR.Caption := IntToStr(FDef.Num_FCR_Channels);
    edtSpotNumber.Caption := IntToStr(FDef.Radar_Spot_Number);
    edtOTHRadarFactor.Caption := FormatFloat('0.0', FDef.Radar_Horizon_Factor);
    edtMainLobeGain.Caption := FormatFloat('0.0', FDef.Main_Lobe_Gain);
    chkAltitudeData.Checked := FDef.Altitude_Data_Capability;
    chkPlatformTypeRecognition.Checked := FDef.Plat_Type_Recog_Capability;
    chkGroundSpeedData.Checked := FDef.Ground_Speed_Data_Capability;
    chkPlatformClassRecognition.Checked := FDef.Plat_Class_Recog_Capability;
    chkHeadingData.Checked := FDef.Heading_Data_Capability;
    chkSectorscan.Checked := FDef.Sector_Scan_Capable;
    {$ENDREGION}

    {$REGION ' Characteristics '}
    edtFrequency.Caption := FormatFloat('0.0', FDef.Frequency);
    edtScanRate.Caption := FormatFloat('0.0', FDef.Scan_Rate);
    edtPulseRepetitionFrequency.Caption := FormatFloat('0.000', FDef.Pulse_Rep_Freq);
    edtPulseWidth.Caption := FormatFloat('0.00', FDef.Pulse_Width);
    edtPower.Caption := FormatFloat('0', FDef.Radar_Power);
    edtClutterRejection.Caption := FormatFloat('0.0', FDef.Clutter_Rejection);
    edtBeamWidth.Caption := FormatFloat('0', FDef.Beam_Width);
    chkValidVertical2.Checked := FDef.Second_Vert_Coverage;
//    btnEditVertical2.Enabled := FDef.Second_Vert_Coverage;
    {$ENDREGION}

    {$REGION ' Anti Jamming '}
    chkTypeAJammingResistant.Checked := FDef.Jamming_A_Resistant;
    chkTypeBJammingResistant.Checked := FDef.Jamming_B_Resistant;
    chkTypeCJammingResistant.Checked := FDef.Jamming_C_Resistant;
    trckbrJammerStrength.Position := Round(FDef.Off_Axis_Jammer_Reduction);
    lblJammerStrength.Caption := trckbrJammerStrength.Position.ToString;

    chkAntiJammingCapable.Checked := FDef.Anti_Jamming_Capable;
    chkCancelTypeA.Checked := FDef.Anti_Jamming_A_Resistant;
    chkCancelTypeB.Checked := FDef.Anti_Jamming_B_Resistant;
    chkCancelTypeC.Checked := FDef.Anti_Jamming_C_Resistant;
    trckbrPercentageMaxUnambigous.Position := Round(FDef.Anti_Jamming_Range_Reduction);
    lblPercentageMaxUnambigous.Caption := trckbrJammerStrength.Position.ToString;
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmRadarView.UpdateRadarList;
   var
  i : Integer;
  radar : TRadar_On_Board;
begin
  lstRadar.Items.Clear;

  dmTTT.GetAllRadarDef(FRadarList);

  for i := 0 to FRadarList.Count - 1 do
  begin
    radar := FRadarList.Items[i];
    lstRadar.Items.AddObject(radar.FDef.Radar_Identifier, radar);
  end;
end;

procedure TfrmRadarView.UpdateTabPage;
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
      lblTab.Caption := 'ANTI JAMMING';
      pnlTabAJ.BringToFront;
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

{$ENDREGION}

end.
