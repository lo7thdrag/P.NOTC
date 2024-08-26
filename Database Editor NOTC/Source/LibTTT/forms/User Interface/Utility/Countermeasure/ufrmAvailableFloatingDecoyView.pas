unit ufrmAvailableFloatingDecoyView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uSimContainers, uDBAsset_Countermeasure,
  Vcl.Imaging.pngimage, uBaseCoordSystem;

type
  TfrmAvailableFloatingDecoyView = class(TForm)
    ImgBackground: TImage;
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    Label2: TLabel;
    Label4: TLabel;
    lstFloatingDecoy: TListBox;
    lblName: TLabel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    pnlTabGeneral: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label43: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    edtLengthDimensions: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edtWidththDimensions: TLabel;
    Label28: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtHeigthDimensions: TLabel;
    Label21: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtFrontRadarCross: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtSideRadarCross: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Panel3: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    edtFrontAcousticCross: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    edtSideAcousticCross: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Panel4: TPanel;
    Label32: TLabel;
    Label33: TLabel;
    edtFrontVisualCross: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    edtSideVisualCross: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    edtLifetimeDuration: TLabel;
    Label44: TLabel;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    lblsearch: TLabel;
    edtCheat: TEdit;
    procedure ImgBtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbSingleClick(Sender: TObject);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure edtfloatingdecoyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    tabIndex, tabMax : Integer;
    FFloatingDecoyList : TList;
    FSelectedFloatingDecoy : TFloating_Decoy_On_Board;
  public
    { Public declarations }

    procedure UpdateTabPage;
    procedure UpdateFloatingDecoyList;
    procedure UpdateFloatingDecoyData;
  end;

var
  frmAvailableFloatingDecoyView: TfrmAvailableFloatingDecoyView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableFloatingDecoyView.edtfloatingdecoyKeyPress(
  Sender: TObject; var Key: Char);
  var
  i : Integer;
  floatingdecoy : TFloating_Decoy_On_Board;
begin
  if Key = #13 then
  begin
  lstFloatingDecoy.Items.Clear;

  dmTTT.GetfilterFloatingDecoyDef(FFloatingDecoyList,edtCheat.Text);

    for i := 0 to FFloatingDecoyList.Count - 1 do
    begin
    floatingdecoy := FFloatingDecoyList.Items[i];
    lstFloatingDecoy.Items.AddObject(floatingdecoy.FFloatingDecoy_Def.Floating_Decoy_Identifier, floatingdecoy);
    end;
  end;
end;

procedure TfrmAvailableFloatingDecoyView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FFloatingDecoyList);

  Action := cafree;
end;

procedure TfrmAvailableFloatingDecoyView.FormCreate(Sender: TObject);
begin
  FFloatingDecoyList := TList.Create;
end;

procedure TfrmAvailableFloatingDecoyView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 1;

  UpdateTabPage;
  UpdateFloatingDecoyList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableFloatingDecoyView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableFloatingDecoyView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmAvailableFloatingDecoyView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmAvailableFloatingDecoyView.lbSingleClick(Sender: TObject);
begin
  if lstFloatingDecoy.ItemIndex = -1 then
    Exit;

  FSelectedFloatingDecoy := TFloating_Decoy_On_Board(lstFloatingDecoy.Items.Objects[lstFloatingDecoy.ItemIndex]);

  UpdateFloatingDecoyData;
end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmAvailableFloatingDecoyView.UpdateFloatingDecoyData;
var
  timeStr : string;
begin
  with FSelectedFloatingDecoy do
  begin
//    if FFloatingDecoy_Def.Floating_Decoy_Index= 0 then
//      edtClass.Text := '(Unnamed)'
//    else
//      edtClass.Text := FFloatingDecoy_Def.Floating_Decoy_Identifier;

    lblName.Caption := FFloatingDecoy_Def.Floating_Decoy_Identifier;

    {$REGION ' General '}
    edtLengthDimensions.Caption := FormatFloat('0', FFloatingDecoy_Def.Length);
    edtWidththDimensions.Caption := FormatFloat('0', FFloatingDecoy_Def.Width);
    edtHeigthDimensions.Caption := FormatFloat('0', FFloatingDecoy_Def.Height);

    {Catatan : seharusnya ada pilihan format satuan yg akan ditampilkan}
    edtFrontRadarCross.Caption := FormatFloat('0.00', FFloatingDecoy_Def.Front_Radar_Cross);
    edtSideRadarCross.Caption := FormatFloat('0.00', FFloatingDecoy_Def.Side_Radar_Cross);

    edtFrontAcousticCross.Caption := FormatFloat('0.00', FFloatingDecoy_Def.Front_Acoustic_Cross);
    edtSideAcousticCross.Caption := FormatFloat('0.00', FFloatingDecoy_Def.Side_Acoustic_Cross);

    edtFrontVisualCross.Caption := FormatFloat('0.0', FFloatingDecoy_Def.Front_Visual_Cross);
    edtSideVisualCross.Caption := FormatFloat('0.0', FFloatingDecoy_Def.Side_Visual_Cross);

    SecondToTime(Round(FFloatingDecoy_Def.Lifetime_Duration), timeStr);
    edtLifetimeDuration.Caption := timeStr;
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmAvailableFloatingDecoyView.UpdateFloatingDecoyList;
var
  i : Integer;
  floatingdecoy : TFloating_Decoy_On_Board;
begin
  lstFloatingDecoy.Items.Clear;

  dmTTT.GetAllFloatingDecoyDef(FFloatingDecoyList);

  for i := 0 to FFloatingDecoyList.Count - 1 do
  begin
    floatingdecoy := FFloatingDecoyList.Items[i];
    lstFloatingDecoy.Items.AddObject(floatingdecoy.FFloatingDecoy_Def.Floating_Decoy_Identifier, floatingdecoy);
  end;
end;

procedure TfrmAvailableFloatingDecoyView.UpdateTabPage;
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
