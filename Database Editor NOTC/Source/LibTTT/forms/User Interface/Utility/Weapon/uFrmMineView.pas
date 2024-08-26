unit uFrmMineView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls,uDBAsset_Weapon, uSimContainers, tttData;

type
  TfrmMineView = class(TForm)
    ImgBackground: TImage;
    Label4: TLabel;
    lstMine: TListBox;
    ImgBackgroundList: TImage;
    Label2: TLabel;
    lblName: TLabel;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    pnlTabGeneral: TPanel;
    Label1: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    edtAcousticFront: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtAcousticSide: TLabel;
    Label32: TLabel;
    Label28: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    edtLength: TLabel;
    edtWidth: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Panel1: TPanel;
    chkAntiSurface: TCheckBox;
    Panel4: TPanel;
    Panel5: TPanel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    Image1: TImage;
    chkAntiSubSurface: TCheckBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtCategoryMine: TLabel;
    edtMooringType: TLabel;
    edtDetType: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    edtMaxLayingDepth: TLabel;
    Label36: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edtHeight: TLabel;
    Label29: TLabel;
    Label37: TLabel;
    Label40: TLabel;
    edtEngagementRange: TLabel;
    Label42: TLabel;
    Panel2: TPanel;
    Label43: TLabel;
    trckbrLethality: TTrackBar;
    lblLethality: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lblsearch: TLabel;
    edtbomblist: TEdit;
    imgImgBtnBack: TImage;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure ImgBtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure trckbrLethalityChange(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);
    procedure imgImgBtnBackClick(Sender: TObject);

  private
    tabIndex, tabMax : Integer;
    FMineList : TList;
    FSelectedMine: TMine_On_Board;

  public
   procedure UpdateTabPage;
   procedure UpdateMineList;
   procedure UpdateMineData;

  end;

var
  frmMineView: TfrmMineView;

implementation
uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmMineView.edtCheatKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
  mine : TMine_On_Board;
begin
  if Key = #13 then
  begin


    lstMine.Items.Clear;

  dmTTT.GetfilterMineDef(FMineList,edtbomblist.text);
    for i := 0 to FMineList.Count - 1 do
    begin
  mine := FMineList.Items[i];
   lstMine.Items.AddObject(mine.FMine_Def.Mine_Identifier, mine);
    end;
  end;
end;
procedure TfrmMineView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FMineList);
  Action := cafree;
end;

procedure TfrmMineView.FormCreate(Sender: TObject);
begin
 FMineList := TList.Create;
end;

procedure TfrmMineView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 1;

  UpdateTabPage;
  UpdateMineList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmMineView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMineView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmMineView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmMineView.imgImgBtnBackClick(Sender: TObject);
begin
Close;
end;

procedure TfrmMineView.lbSingleClick(Sender: TObject);
begin
  if lstMine.ItemIndex = -1 then
    Exit;

  FSelectedMine := TMine_On_Board(lstMine.Items.Objects[lstMine.ItemIndex]);

  UpdateMineData;
end;
procedure TfrmMineView.trckbrLethalityChange(Sender: TObject);
begin
trckbrLethality.Position := StrToInt(lblLethality.Caption)
end;

{$ENDREGION}

{$REGION ' View Data Handle '}
procedure TfrmMineView.UpdateMineData;
begin
  with FSelectedMine do
  begin
    lblName.Caption := FMine_Def.Mine_Identifier;

    {$REGION ' General '}

    chkAntiSurface.Checked := Boolean(FMine_Def.Anti_Sur_Capable);
    chkAntiSubSurface.Checked := Boolean(FMine_Def.Anti_SubSur_Capable);

    case FMine_Def.Platform_Category of
      Ord(cMineAcoustic) : edtCategoryMine.Caption := csMineAcoustic;
      Ord(cMineImpact) : edtCategoryMine.Caption := csMineImpact;
      Ord(cMineMagnetic) : edtCategoryMine.Caption := csMineMagnetic;
      Ord(cMinePresure) : edtCategoryMine.Caption := csMinePresure;
    end;

    case FMine_Def.Mooring_Type of
      Ord(mtMineFixed) : edtMooringType.Caption := mtsMineFixed;
      Ord(mtMineFloating) : edtMooringType.Caption := mtsMineFloating;
    end;

    case FMine_Def.Detectability_Type of
      Ord(dtMineNormalDet) : edtDetType.Caption := dtsMineNormalDet;
      Ord(dtMineUndetectable) : edtDetType.Caption := dtsMineUndetectable;
      Ord(dtMinePassiveDet) : edtDetType.Caption := dtsMinePassiveDet;
      Ord(dtMineAlwaysVis) : edtDetType.Caption := dtsMineAlwaysVis;
    end;
    edtMaxLayingDepth.Caption := FormatFloat('0', FMine_Def.Max_Laying_Depth);

//    btnEditProbOfDetonanationCurve.Enabled := FMine_Def.Mine_Index <> 0;

    edtLength.Caption := FormatFloat('0', FMine_Def.Length);
    edtWidth.Caption := FormatFloat('0', FMine_Def.Width);
    edtHeight.Caption := FormatFloat('0', FMine_Def.Height);
    edtEngagementRange.Caption := FormatFloat('0', FMine_Def.Engagement_Range);

    edtAcousticFront.Caption := FormatFloat('0.00', FMine_Def.Front_Acoustic_Cross);
    edtAcousticSide.Caption := FormatFloat('0.00', FMine_Def.Side_Acoustic_Cross);

    trckbrLethality.Position := FMine_Def.Mine_Lethality;
    lblLethality.Caption := trckbrLethality.Position.ToString;
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmMineView.UpdateMineList;
var
  i : Integer;
  mine : TMine_On_Board;

begin
  lstMine.Items.Clear;

  dmTTT.GetAllMineDef(FMineList);

  for i := 0 to FMineList.Count - 1 do
  begin
    mine := FMineList.Items[i];
   lstMine.Items.AddObject(mine.FMine_Def.Mine_Identifier, mine);
  end;
end;


procedure TfrmMineView.UpdateTabPage;
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
