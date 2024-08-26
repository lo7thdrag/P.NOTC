unit ufrmAvailableRadarNoiseJammerView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uDBAsset_Countermeasure, uSimContainers,
  Vcl.Imaging.pngimage, tttData;

type
  TfrmAvailableRadarNoiseJammerView = class(TForm)
    ImgBackground: TImage;
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    Label4: TLabel;
    lstRadarNoiseJammer: TListBox;
    lblName: TLabel;
    Label2: TLabel;
    pnlTabGeneral: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtPowerDensity: TLabel;
    Label43: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtMaxEffectiveRange: TLabel;
    Label10: TLabel;
    Label16: TLabel;
    edtMaxSectorWidth: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtJammerType: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label9: TLabel;
    Label17: TLabel;
    edtLowerFreqLimit: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edtUpperFreqLimit: TLabel;
    Label28: TLabel;
    edtLowerVerticalLimit: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtUpperVerticalLimit: TLabel;
    Label30: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
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
    procedure edtradarnoisejammerKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    tabIndex, tabMax : Integer;
    FRadarNoiseJammerList : TList;
    FSelectedRadarJammer : TRadar_Noise_Jammer_On_Board;
  public
    { Public declarations }

    procedure UpdateTabPage;
    procedure UpdateRadarNoiseJammerList;
    procedure UpdateRadarJammerData;

    property SelectedRadarJammer : TRadar_Noise_Jammer_On_Board read FSelectedRadarJammer
      write FSelectedRadarJammer;
  end;

var
  frmAvailableRadarNoiseJammerView: TfrmAvailableRadarNoiseJammerView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableRadarNoiseJammerView.edtradarnoisejammerKeyPress(
  Sender: TObject; var Key: Char);
var
  i : Integer;
  radarnoisejammer : TRadar_Noise_Jammer_On_Board;
begin
  if Key = #13 then
  begin
   lstRadarNoiseJammer.Items.Clear;

  dmTTT.GetfilterRadarNoiseJammerDef(FRadarNoiseJammerList,edtCheat.Text);

    for i := 0 to FRadarNoiseJammerList.Count - 1 do
    begin
      radarnoisejammer := FRadarNoiseJammerList.Items[i];
    lstRadarNoiseJammer.Items.AddObject(radarnoisejammer.FDef.Jammer_Identifier, radarnoisejammer);
  end;
end;
end;

procedure TfrmAvailableRadarNoiseJammerView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FRadarNoiseJammerList);

  Action := cafree;
end;

procedure TfrmAvailableRadarNoiseJammerView.FormCreate(Sender: TObject);
begin
  FRadarNoiseJammerList := TList.Create;
end;

procedure TfrmAvailableRadarNoiseJammerView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 1;

  UpdateTabPage;
  UpdateRadarNoiseJammerList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableRadarNoiseJammerView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableRadarNoiseJammerView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmAvailableRadarNoiseJammerView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmAvailableRadarNoiseJammerView.lbSingleClick(Sender: TObject);
begin
  if lstRadarNoiseJammer.ItemIndex = -1 then
    Exit;

  FSelectedRadarJammer := TRadar_Noise_Jammer_On_Board(lstRadarNoiseJammer.Items.Objects[lstRadarNoiseJammer.ItemIndex]);

  UpdateRadarJammerData;
end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmAvailableRadarNoiseJammerView.UpdateRadarJammerData;
begin
  with FSelectedRadarJammer do
  begin
//    if FDef.Jammer_Index = 0 then
//      edtClass.Text := '(Unnamed)'
//    else
//      edtClass.Text := FDef.Jammer_Identifier;

    lblName.Caption := FDef.Jammer_Identifier;

    {$REGION ' General '}
    edtPowerDensity.Caption := FormatFloat('0.00', FDef.Jammer_Power_Density);
    edtMaxEffectiveRange.Caption := FormatFloat('0.00', FDef.Max_Effective_Range);
    edtMaxSectorWidth.Caption := FormatFloat('0', FDef.Max_Sector_Width);
//    cbbJammerType.ItemIndex := FDef.Jammer_Type;
    case FDef.Jammer_Type of
      0: edtJammerType.Caption := JammerTypesA;
      1: edtJammerType.Caption := JammerTypesB;
      2: edtJammerType.Caption := JammerTypesC;
    end;

    edtLowerFreqLimit.Caption := FormatFloat('0.0', FDef.Lower_Freq_Limit);
    edtUpperFreqLimit.Caption := FormatFloat('0.0', FDef.Upper_Freq_Limit);

    edtLowerVerticalLimit.Caption := FormatFloat('0', FDef.Lower_Vert_Coverage_Angle);
    edtUpperVerticalLimit.Caption := FormatFloat('0', FDef.Upper_Vert_Coverage_Angle);
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmAvailableRadarNoiseJammerView.UpdateRadarNoiseJammerList;
var
  i : Integer;
  radarnoisejammer : TRadar_Noise_Jammer_On_Board;
begin
  lstRadarNoiseJammer.Items.Clear;

  dmTTT.GetAllRadarNoiseJammerDef(FRadarNoiseJammerList);

  for i := 0 to FRadarNoiseJammerList.Count - 1 do
  begin
    radarnoisejammer := FRadarNoiseJammerList.Items[i];
    lstRadarNoiseJammer.Items.AddObject(radarnoisejammer.FDef.Jammer_Identifier, radarnoisejammer);
  end;
end;

procedure TfrmAvailableRadarNoiseJammerView.UpdateTabPage;
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
