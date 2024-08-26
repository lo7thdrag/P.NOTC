unit ufrmAvailableTowedJammerDecoyView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uDBAsset_Countermeasure, uSimContainers,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, tttData, uBaseCoordSystem;

type
  TfrmAvailableTowedJammerDecoyView = class(TForm)
    ImgBackground: TImage;
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    Label2: TLabel;
    Label4: TLabel;
    lstTowedJammerDecoy: TListBox;
    lblName: TLabel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    pnlTabGeneral: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtECMType: TLabel;
    Label43: TLabel;
    lblTrackBarTypeA: TLabel;
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
    lblTrackBarTypeB: TLabel;
    lblTrackBarTypeC: TLabel;
    Panel1: TPanel;
    cbxTARHMissiles: TCheckBox;
    Panel2: TPanel;
    cbxFireControlRadars: TCheckBox;
    TrackBarTypeA: TTrackBar;
    TrackBarTypeB: TTrackBar;
    TrackBarTypeC: TTrackBar;
    Label18: TLabel;
    Label19: TLabel;
    medtActivationControlDelay: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edtTowLength: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    edtLengthDimensions: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edtWidththDimensions: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    edtHeigthDimensions: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    edtFrontRadarCross: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    edtSideRadarCross: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    Panel5: TPanel;
    Label45: TLabel;
    Label46: TLabel;
    edtFrontAcousticCross: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    edtSideAcousticCross: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Panel6: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    edtFrontVisualCross: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    edtSideVisualCross: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    lblsearch: TLabel;
    edtCheat: TEdit;
    procedure ImgBtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbSingleClick(Sender: TObject);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure edttowedjammerdecoyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    tabIndex, tabMax : Integer;
    FTowedJammerDecoyList : TList;
    FSelectedTowedJammerDecoy : TTowed_Jammer_Decoy_On_Board;
  public
    { Public declarations }

    procedure UpdateTabPage;
    procedure UpdateTowedJammerDecoyList;
    procedure UpdateDefensiveJammerData;

    property SelectedTowedJammerDecoy : TTowed_Jammer_Decoy_On_Board
      read FSelectedTowedJammerDecoy write FSelectedTowedJammerDecoy;
  end;

var
  frmAvailableTowedJammerDecoyView: TfrmAvailableTowedJammerDecoyView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableTowedJammerDecoyView.edttowedjammerdecoyKeyPress(
  Sender: TObject; var Key: Char);
  var
  i : Integer;
  towedjammerdecoy : TTowed_Jammer_Decoy_On_Board;
begin
  if Key = #13 then
  begin
  lstTowedJammerDecoy.Items.Clear;

  dmTTT.GetfilterTowedJammerDecoyDef(FTowedJammerDecoyList,edtCheat.Text);

    for i := 0 to FTowedJammerDecoyList.Count - 1 do
    begin
  towedjammerdecoy := FTowedJammerDecoyList.Items[i];
    lstTowedJammerDecoy.Items.AddObject(towedjammerdecoy.FDef.Towed_Decoy_Identifier, towedjammerdecoy);
    end;
  end;
end;

procedure TfrmAvailableTowedJammerDecoyView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FTowedJammerDecoyList);

  Action := cafree;
end;

procedure TfrmAvailableTowedJammerDecoyView.FormCreate(Sender: TObject);
begin
  FTowedJammerDecoyList := TList.Create;
end;

procedure TfrmAvailableTowedJammerDecoyView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 1;

  UpdateTabPage;
  UpdateTowedJammerDecoyList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableTowedJammerDecoyView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableTowedJammerDecoyView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmAvailableTowedJammerDecoyView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmAvailableTowedJammerDecoyView.lbSingleClick(Sender: TObject);
begin
  if lstTowedJammerDecoy.ItemIndex = -1 then
    Exit;

  FSelectedTowedJammerDecoy := TTowed_Jammer_Decoy_On_Board(lstTowedJammerDecoy.Items.Objects[lstTowedJammerDecoy.ItemIndex]);

  UpdateDefensiveJammerData;
end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmAvailableTowedJammerDecoyView.UpdateDefensiveJammerData;
var
  timeStr : string;
begin
  with FSelectedTowedJammerDecoy do
  begin
//    if FDefensiveJammer_Def.Defensive_Jammer_Index = 0 then
//      edtClass.Text := '(Unnamed)'
//    else
//      edtClass.Text := FDef.Towed_Decoy_Identifier;

    lblName.Caption := FDef.Towed_Decoy_Identifier;

    {$REGION ' General '}
    case FDef.ECM_Type of
      Ord(ECMTypeA) : edtECMType.Caption := ECMsTypeA;
      Ord(ECMTypeB) : edtECMType.Caption := ECMsTypeB;
    end;
//    cbbECMType.ItemIndex := FDef.ECM_Type;

    SecondToTime(Round(FDef.Activation_Control_Delay), timeStr);
    medtActivationControlDelay.Caption := timeStr;

    edtTowLength.Caption := FloatToStr(FDef.Tow_Length);

    cbxTARHMissiles.Checked := Boolean(FDef.Decoy_TARH_Capable);
    cbxFireControlRadars.Checked := Boolean(FDef.Decoy_SARH_Capable);

    TrackBarTypeA.Position := Round(FDef.Type_A_Seducing_Prob * 100);
    lblTrackBarTypeA.Caption := TrackBarTypeA.Position.ToString;
    TrackBarTypeB.Position := Round(FDef.Type_B_Seducing_Prob * 100);
    lblTrackBarTypeB.Caption := TrackBarTypeB.Position.ToString;
    TrackBarTypeC.Position := Round(FDef.Type_C_Seducing_Prob * 100);
    lblTrackBarTypeC.Caption := TrackBarTypeC.Position.ToString;

    edtLengthDimensions.Caption := FormatFloat('0', FDef.Length);
    edtWidththDimensions.Caption := FormatFloat('0', FDef.Width);
    edtHeigthDimensions.Caption := FormatFloat('0', FDef.Height);

    edtFrontRadarCross.Caption := FormatFloat('0.00', FDef.Front_Radar_Cross);
    edtSideRadarCross.Caption := FormatFloat('0.00', FDef.Side_Radar_Cross);

    edtFrontAcousticCross.Caption := FormatFloat('0.00', FDef.Front_Acoustic_Cross);
    edtSideAcousticCross.Caption := FormatFloat('0.00', FDef.Side_Acoustic_Cross);

    edtFrontVisualCross.Caption := FormatFloat('0.0', FDef.Front_Visual_Cross);
    edtSideVisualCross.Caption := FormatFloat('0.0', FDef.Side_Visual_Cross);
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmAvailableTowedJammerDecoyView.UpdateTowedJammerDecoyList;
var
  i : Integer;
  towedjammerdecoy : TTowed_Jammer_Decoy_On_Board;
begin
  lstTowedJammerDecoy.Items.Clear;

  dmTTT.GetAllTowedJammerDecoyDef(FTowedJammerDecoyList);

  for i := 0 to FTowedJammerDecoyList.Count - 1 do
  begin
    towedjammerdecoy := FTowedJammerDecoyList.Items[i];
    lstTowedJammerDecoy.Items.AddObject(towedjammerdecoy.FDef.Towed_Decoy_Identifier, towedjammerdecoy);
  end;
end;

procedure TfrmAvailableTowedJammerDecoyView.UpdateTabPage;
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
