unit uFrmBombView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls,uDBAsset_Weapon, uSimContainers, tttData;

type
  TfrmBombView = class(TForm)
    Label4: TLabel;
    lstBomb: TListBox;
    ImgBackgroundList: TImage;
    ImgBackground: TImage;
    Label2: TLabel;
    lblName: TLabel;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    pnlTabGeneral: TPanel;
    Label1: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    edtRangeMin: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtRangeMax: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtTypeBomb: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label43: TLabel;
    lblLethality: TLabel;
    Panel1: TPanel;
    chkAntiSurface: TCheckBox;
    Panel4: TPanel;
    chkAntiSubSurface: TCheckBox;
    Panel2: TPanel;
    trckbrLethality: TTrackBar;
    chkAntiLand: TCheckBox;
    chkAntiAmphibious: TCheckBox;
    Image1: TImage;
    Label6: TLabel;
    Label7: TLabel;
    lblsearch: TLabel;
    edtbomblist: TEdit;
    imgImgBtnBack: TImage;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure imgImgBtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure edtbomblistKeyPress(Sender: TObject; var Key: Char);

  private
    tabIndex, tabMax : Integer;
    FBombList : TList;
    FSelectedBomb : TBomb_Definition;

  public
     procedure UpdateTabPage;
     procedure UpdateBombList;
     procedure UpdateBombData;

  end;

var
  frmBombView: TfrmBombView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmBombView.edtbomblistKeyPress(Sender: TObject; var Key: Char);
var
 i : Integer;
  bomb : TBomb_Definition;
begin
  if Key = #13 then
  begin


   lstBomb.Items.Clear;

  dmTTT.GetfilterBombDef(FBombList,edtbomblist.text);
    for i := 0 to FBombList.Count - 1 do
    begin
    bomb := FBombList.Items[i];
    lstBomb.Items.AddObject(bomb.FData.Bomb_Identifier, bomb);
    end;
  end;
end;



procedure TfrmBombView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FBombList);
  Action := cafree;
end;

procedure TfrmBombView.FormCreate(Sender: TObject);
begin
FBombList := TList.Create;
end;

procedure TfrmBombView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 1;

  UpdateTabPage;
  UpdateBombList;
 end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmBombView.imgImgBtnBackClick(Sender: TObject);
begin
Close
end;

procedure TfrmBombView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmBombView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmBombView.lbSingleClick(Sender: TObject);
begin
  if lstBomb.ItemIndex = -1 then
    Exit;

  FSelectedBomb := TBomb_Definition(lstBomb.Items.Objects[lstBomb.ItemIndex]);

  UpdateBombData;
end;

procedure TfrmBombView.Panel9Click(Sender: TObject);
begin

end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmBombView.UpdateBombData;
begin
  with FSelectedBomb do
  begin
    lblName.Caption := FData.Bomb_Identifier;

    {$REGION ' General '}
//    LastName := edtClass.Text;
//    cbbType.ItemIndex := FData.Bomb_Type;

    case FData.Bomb_Type of
      Ord(tBombBomb) : edtTypeBomb.Caption := tsBombBomb;
      Ord(tBombDepthCharge) : edtTypeBomb.Caption := tsBombDepthCharge;
    end;

    chkAntiSurface.Checked := Boolean(FData.Anti_Sur_Capable);
    chkAntiSubSurface.Checked := Boolean(FData.Anti_SubSur_Capable);
    chkAntiLand.Checked := Boolean(FData.Anti_Land_Capable);
    chkAntiAmphibious.Checked := Boolean(FData.Anti_Amphibious_Capable);

    edtRangeMin.Caption := FormatFloat('0.00', FData.Min_Range);
    edtRangeMax.Caption := FormatFloat('0.00', FData.Max_Range);

//    btnEditPOH.Enabled := FData.Bomb_Index <> 0;

    trckbrLethality.Position := FData.Lethality;
    lblLethality.Caption := trckbrLethality.Position.ToString;
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}
  end;
end;

procedure TfrmBombView.UpdateBombList;
var
  i : Integer;
  bomb : TBomb_Definition;

begin
  lstBomb.Items.Clear;

  dmTTT.GetAllBombDef(FBombList);

  for i := 0 to FBombList.Count - 1 do
  begin
    bomb := FBombList.Items[i];
    lstBomb.Items.AddObject(bomb.FData.Bomb_Identifier, bomb);
  end;
end;

procedure TfrmBombView.UpdateTabPage;
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
