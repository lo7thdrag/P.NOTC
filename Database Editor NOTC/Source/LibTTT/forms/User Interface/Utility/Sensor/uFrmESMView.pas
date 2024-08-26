unit uFrmESMView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, uDBAsset_Sensor, uBaseCoordSystem , tttData, uSimContainers;

type
  TfrmESMView = class(TForm)
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    ImgBackground: TImage;
    Label4: TLabel;
    Label2: TLabel;
    lstESM: TListBox;
    lblName: TLabel;
    pnlTabGeneral: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label1: TLabel;
    edtMedtClassificationPeriod: TLabel;
    edtMaximumConfidenceLevel: TLabel;
    Label8: TLabel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtMedtIdentificationPeriod: TLabel;
    Label10: TLabel;
    Panel1: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    chkCommunicationInterceptCapable: TCheckBox;
    Label13: TLabel;
    Panel2: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtLowerLimitFirst: TLabel;
    Label19: TLabel;
    edtUpperLimitFirst: TLabel;
    Label21: TLabel;
    chkSecondFrequencyDetectionBand: TCheckBox;
    Panel3: TPanel;
    Label24: TLabel;
    Label23: TLabel;
    edtLowerLimitSecond: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edtUpperLimitSecond: TLabel;
    Label29: TLabel;
    Label18: TLabel;
    Panel4: TPanel;
    Label20: TLabel;
    Label22: TLabel;
    edtEmitterDetectionRangeFactor: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtSectorBlankDetectionFactor: TLabel;
    Label32: TLabel;
    Panel5: TPanel;
    Label28: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    edtMinimum: TLabel;
    edtInitial: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    ImgBc: TImage;
    lblsearch: TLabel;
    edtCheat: TEdit;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure ImgBtnBackClick(Sender: TObject);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);

  private
    tabIndex, tabMax : Integer;
    FESMList : TList;
    FSelectedESM : TESM_On_Board;

  public
    procedure UpdateTabPage;
    procedure UpdateESMList;
    procedure UpdateESMData;

  end;

var
  frmESMView: TfrmESMView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmESMView.edtCheatKeyPress(Sender: TObject; var Key: Char);
  var
  i : Integer;
  esm : TESM_On_Board;
begin
  if Key = #13 then
  begin

  lstESM.Items.Clear;

  dmTTT.GetfilterESMDef(FESMList,edtCheat.Text);
    for i := 0 to FESMList.Count - 1 do
    begin
  esm := FESMList.Items[i];
    lstESM.Items.AddObject(esm.FESM_Def.Class_Identifier, esm);
    end;
  end;
end;
procedure TfrmESMView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FESMList);
  Action := cafree;
end;

procedure TfrmESMView.FormCreate(Sender: TObject);
begin
  FESMList := Tlist.Create;
end;

procedure TfrmESMView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 1;

  UpdateTabPage;
  UpdateESMList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmESMView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmESMView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmESMView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmESMView.lbSingleClick(Sender: TObject);
begin
  if lstESM.ItemIndex = -1 then
    Exit;

  FSelectedESM := TESM_On_Board(lstESM.Items.Objects[lstESM.ItemIndex]);

  UpdateESMData;
end;

{$ENDREGION)

{$REGION ' View Data Handle '}

{$REGION ' View Data Handle '}
procedure TfrmESMView.UpdateESMData;
var
  timeStr : string;
  sEnum : string;
begin
  with FSelectedESM do
  begin
      lblName.Caption := FESM_Def.Class_Identifier;

    {$REGION ' General '}

    case FESM_Def.ESM_Classification of
      Ord(ccesmLow) : edtMaximumConfidenceLevel.Caption := ccesmsLow;
      Ord(ccesmMedium) : edtMaximumConfidenceLevel.Caption := ccesmsMedium;
      Ord(ccesmHigh) : edtMaximumConfidenceLevel.Caption := ccesmsHigh;
      Ord(ccesmHighest) : edtMaximumConfidenceLevel.Caption := ccesmsHighest;
    end;

    SecondToTime(Round(FESM_Def.Classification_Period), timeStr);
    edtMedtClassificationPeriod.Caption := timeStr;

    SecondToTime(Round(FESM_Def.Identification_Period), timeStr);
    edtMedtIdentificationPeriod.Caption := timeStr;

    chkCommunicationInterceptCapable.Checked := Boolean(FESM_Def.Comm_Intercept_Capable);
    edtLowerLimitFirst.Caption := FormatFloat('0.0', FESM_Def.Low_Detect_Frequency1);
    edtUpperLimitFirst.Caption := FormatFloat('0.0', FESM_Def.High_Detect_Frequency1);

    edtLowerLimitSecond.Caption := FormatFloat('0.0', FESM_Def.Low_Detect_Frequency2);
    edtUpperLimitSecond.Caption := FormatFloat('0.0', FESM_Def.High_Detect_Frequency2);

    edtEmitterDetectionRangeFactor.Caption := FormatFloat('0.00', FESM_Def.Emitter_Detect_Range_Factor);
    edtSectorBlankDetectionFactor.Caption  := FormatFloat('0.00', FESM_Def.Sector_Blank_Detection_Factor);

    chkSecondFrequencyDetectionBand.Checked := Boolean(FESM_Def.Second_Frequency_Detection_Capable);
    edtMinimum.Caption := FormatFloat('0', FESM_Def.Minimum_Bearing_Error_Variance);
    edtInitial.Caption := FormatFloat('0', FESM_Def.Initial_Bearing_Error_Variance);

    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmESMView.UpdateESMList;
var
  i : Integer;
  esm : TESM_On_Board;
begin
  lstESM.Items.Clear;

  dmTTT.GetAllESMDef(FESMList);

  for i := 0 to FESMList.Count - 1 do
  begin
    esm := TESM_On_Board(FESMList.Items[i]);
    lstESM.Items.AddObject(esm.FESM_Def.Class_Identifier, esm);
  end;
end;

procedure TfrmESMView.UpdateTabPage;
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
