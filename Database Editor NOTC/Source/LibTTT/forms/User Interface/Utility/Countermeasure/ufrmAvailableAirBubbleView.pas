unit ufrmAvailableAirBubbleView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, uDBAsset_Countermeasure, uSimContainers, Vcl.ComCtrls;

type
  TfrmAvailableAirBubbleView = class(TForm)
    ImgBackground: TImage;
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    Label2: TLabel;
    Label4: TLabel;
    lstAirBubble: TListBox;
    lblName: TLabel;
    pnlTabGeneral: TPanel;
    Image1: TImage;
    Label3: TLabel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    Label6: TLabel;
    Label7: TLabel;
    edtMaxAcousticCross: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtDissipationTime: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    edtAscentRate: TLabel;
    Label15: TLabel;
    edtDescentRate: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lblsearch: TLabel;
    edtCheat: TEdit;
    procedure ImgBtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbSingleClick(Sender: TObject);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure edtairbubbleKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    tabIndex, tabMax : Integer;
    FAirBubbleList : TList;
    FSelectedAirBubble : TAir_Bubble_On_Board;
  public
    { Public declarations }

    procedure UpdateTabPage;
    procedure UpdateAirBubbleList;
    procedure UpdateAirBubbleData;
  end;

var
  frmAvailableAirBubbleView: TfrmAvailableAirBubbleView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableAirBubbleView.edtairbubbleKeyPress(Sender: TObject;
  var Key: Char);
 var
  i : Integer;
  airbubble : TAir_Bubble_On_Board;
begin
  if Key = #13 then
  begin
   lstAirBubble.Items.Clear;

  dmTTT.GetfilterAirBubbleDef(FAirBubbleList,edtCheat.Text);

    for i := 0 to FAirBubbleList.Count - 1 do
    begin
    airbubble := FAirBubbleList.Items[i];
    lstAirBubble.Items.AddObject(airbubble.FAirBubble_Def.Air_Bubble_Identifier, airbubble);
  end;
end;
end;

procedure TfrmAvailableAirBubbleView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAirBubbleList);

  Action := cafree;
end;

procedure TfrmAvailableAirBubbleView.FormCreate(Sender: TObject);
begin
  FAirBubbleList := TList.Create;
end;

procedure TfrmAvailableAirBubbleView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 1;

  UpdateTabPage;
  UpdateAirBubbleList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableAirBubbleView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableAirBubbleView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmAvailableAirBubbleView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmAvailableAirBubbleView.lbSingleClick(Sender: TObject);
begin
  if lstAirBubble.ItemIndex = -1 then
    Exit;

  FSelectedAirBubble := TAir_Bubble_On_Board(lstAirBubble.Items.Objects[lstAirBubble.ItemIndex]);

  UpdateAirBubbleData;
end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmAvailableAirBubbleView.UpdateAirBubbleData;
begin
  with FSelectedAirBubble do
  begin
//    if FAirBubble_Def.Air_Bubble_Index = 0 then
//      edtClass.Text := '(Unnamed)'
//    else
//      edtClass.Text := FAirBubble_Def.Air_Bubble_Identifier;

    lblName.Caption := FAirBubble_Def.Air_Bubble_Identifier;

    {$REGION ' General '}
    edtMaxAcousticCross.Caption := FormatFloat('0.00', FAirBubble_Def.Max_Acoustic_Cross);
    edtDissipationTime.Caption := FormatFloat('0', FAirBubble_Def.Dissipation_Time);
    edtAscentRate.Caption := FormatFloat('0.00', FAirBubble_Def.Ascent_Rate);
    edtDescentRate.Caption := FormatFloat('0.00', FAirBubble_Def.Descent_Rate);
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmAvailableAirBubbleView.UpdateAirBubbleList;
var
  i : Integer;
  airbubble : TAir_Bubble_On_Board;
begin
  lstAirBubble.Items.Clear;

  dmTTT.GetAllAirBubbleDef(FAirBubbleList);

  for i := 0 to FAirBubbleList.Count - 1 do
  begin
    airbubble := FAirBubbleList.Items[i];
    lstAirBubble.Items.AddObject(airbubble.FAirBubble_Def.Air_Bubble_Identifier, airbubble);
  end;
end;

procedure TfrmAvailableAirBubbleView.UpdateTabPage;
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
