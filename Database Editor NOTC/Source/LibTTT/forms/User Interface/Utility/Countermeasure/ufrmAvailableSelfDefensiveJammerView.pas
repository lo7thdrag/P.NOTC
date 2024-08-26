unit ufrmAvailableSelfDefensiveJammerView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uDBAsset_Countermeasure, uSimContainers,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, tttData;

type
  TfrmAvailableSelfDefensiveJammerView = class(TForm)
    ImgBackground: TImage;
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    Label2: TLabel;
    lstSelfDefensiveJammer: TListBox;
    lblName: TLabel;
    Label4: TLabel;
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
    Panel1: TPanel;
    cbxTARHMissiles: TCheckBox;
    Panel2: TPanel;
    cbxFireControlRadar: TCheckBox;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    TrackBarTypeA: TTrackBar;
    TrackBarTypeB: TTrackBar;
    TrackBarTypeC: TTrackBar;
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
    procedure edtselfdefensivejammerKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    tabIndex, tabMax : Integer;
    FSelfDefensiveJammerList : TList;
    FSelectedDefensiveJammer : TDefensive_Jammer_On_Board;
  public
    { Public declarations }

    procedure UpdateTabPage;
    procedure UpdateSelfDefensiveJammerList;
    procedure UpdateDefensiveJammerData;

    property SelectedDefensiveJammer : TDefensive_Jammer_On_Board
      read FSelectedDefensiveJammer write FSelectedDefensiveJammer;
  end;

var
  frmAvailableSelfDefensiveJammerView: TfrmAvailableSelfDefensiveJammerView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableSelfDefensiveJammerView.edtselfdefensivejammerKeyPress(
  Sender: TObject; var Key: Char);
 var
  i : Integer;
  selfdefensivejammer : TDefensive_Jammer_On_Board;
begin
  if Key = #13 then
  begin
  lstSelfDefensiveJammer.Items.Clear;

  dmTTT.GetfilterSelfDefensiveJammerDef(FSelfDefensiveJammerList,edtCheat.Text);

    for i := 0 to FSelfDefensiveJammerList.Count - 1 do
    begin
    selfdefensivejammer := FSelfDefensiveJammerList.Items[i];
    lstSelfDefensiveJammer.Items.AddObject(selfdefensivejammer.FDefensiveJammer_Def.Defensive_Jammer_Identifier, selfdefensivejammer);
    end;
  end;
end;
procedure TfrmAvailableSelfDefensiveJammerView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FSelfDefensiveJammerList);

  Action := cafree;
end;

procedure TfrmAvailableSelfDefensiveJammerView.FormCreate(Sender: TObject);
begin
  FSelfDefensiveJammerList := TList.Create;
end;

procedure TfrmAvailableSelfDefensiveJammerView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 1;

  UpdateTabPage;
  UpdateSelfDefensiveJammerList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableSelfDefensiveJammerView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableSelfDefensiveJammerView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmAvailableSelfDefensiveJammerView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmAvailableSelfDefensiveJammerView.lbSingleClick(Sender: TObject);
begin
  if lstSelfDefensiveJammer.ItemIndex = -1 then
    Exit;

  FSelectedDefensiveJammer := TDefensive_Jammer_On_Board(lstSelfDefensiveJammer.Items.Objects[lstSelfDefensiveJammer.ItemIndex]);

  UpdateDefensiveJammerData;
end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmAvailableSelfDefensiveJammerView.UpdateDefensiveJammerData;
begin
  with FSelectedDefensiveJammer do
  begin
//    if FDefensiveJammer_Def.Defensive_Jammer_Index = 0 then
//      edtClass.Text := '(Unnamed)'
//    else
//      edtClass.Text := FDefensiveJammer_Def.Defensive_Jammer_Identifier;

    lblName.Caption := FDefensiveJammer_Def.Defensive_Jammer_Identifier;

    {$REGION ' General '}
    cbxTARHMissiles.Checked := Boolean(FDefensiveJammer_Def.Jammer_TARH_Capable);
    cbxFireControlRadar.Checked := Boolean(FDefensiveJammer_Def.Jammer_SARH_Capable);

    case FDefensiveJammer_Def.ECM_Type of
      Ord(ECMTypeA) : edtECMType.Caption := ECMsTypeA;
      Ord(ECMTypeB) : edtECMType.Caption := ECMsTypeB;
      Ord(ECMTypeC) : edtECMType.Caption := ECMsTypeC;
    end;

//    cbECMType.ItemIndex := FDefensiveJammer_Def.ECM_Type;

    TrackBarTypeA.Position := Round(FDefensiveJammer_Def.Type_A_Seducing_Prob * 100);
    lblTrackBarTypeA.Caption := TrackBarTypeA.Position.ToString;
    TrackBarTypeB.Position := Round(FDefensiveJammer_Def.Type_B_Seducing_Prob * 100);
    lblTrackBarTypeB.Caption := TrackBarTypeB.Position.ToString;
    TrackBarTypeC.Position := Round(FDefensiveJammer_Def.Type_C_Seducing_Prob * 100);
    lblTrackBarTypeC.Caption := TrackBarTypeC.Position.ToString;
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmAvailableSelfDefensiveJammerView.UpdateSelfDefensiveJammerList;
var
  i : Integer;
  selfdefensivejammer : TDefensive_Jammer_On_Board;
begin
  lstSelfDefensiveJammer.Items.Clear;

  dmTTT.GetAllSelfDefensiveJammerDef(FSelfDefensiveJammerList);

  for i := 0 to FSelfDefensiveJammerList.Count - 1 do
  begin
    selfdefensivejammer := FSelfDefensiveJammerList.Items[i];
    lstSelfDefensiveJammer.Items.AddObject(selfdefensivejammer.FDefensiveJammer_Def.Defensive_Jammer_Identifier, selfdefensivejammer);
  end;
end;

procedure TfrmAvailableSelfDefensiveJammerView.UpdateTabPage;
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
