unit ufrmAvailableInfraredDecoyView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uSimContainers, uDBAsset_Countermeasure,
  Vcl.Imaging.pngimage, uBaseCoordSystem;

type
  TfrmAvailableInfraredDecoyView = class(TForm)
    ImgBackground: TImage;
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    Label2: TLabel;
    Label4: TLabel;
    lstInfraredDecoy: TListBox;
    lblName: TLabel;
    pnlTabGeneral: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtMaxIRCrossSection: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtBloomTime: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    edtSustainTime: TLabel;
    Label15: TLabel;
    edtDissipationInStillAir: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    Label5: TLabel;
    Label8: TLabel;
    edtDissipationIn100: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edtDescentRate: TLabel;
    Label22: TLabel;
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
    procedure edtinfrareddecoyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    tabIndex, tabMax : Integer;
    FInfraredDecoyList : TList;
    FSelectedInfraredDecoy : TInfrared_Decoy_On_Board;
  public
    { Public declarations }

    procedure UpdateTabPage;
    procedure UpdateInfraredDecoyList;
    procedure UpdateInfraredDecoyData;
  end;

var
  frmAvailableInfraredDecoyView: TfrmAvailableInfraredDecoyView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableInfraredDecoyView.edtinfrareddecoyKeyPress(
  Sender: TObject; var Key: Char);
 var
  i : Integer;
  infrareddecoy : TInfrared_Decoy_On_Board;
begin
  if Key = #13 then
  begin
  lstInfraredDecoy.Items.Clear;

  dmTTT.GetfilterInfraredDecoyDef(FInfraredDecoyList,edtCheat.Text);

    for i := 0 to FInfraredDecoyList.Count - 1 do
    begin
      infrareddecoy := FInfraredDecoyList.Items[i];
    lstInfraredDecoy.Items.AddObject(infrareddecoy.FInfraredDecoy_Def.Infrared_Decoy_Identifier, infrareddecoy);
  end;
end;
end;

procedure TfrmAvailableInfraredDecoyView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FInfraredDecoyList);

  Action := cafree;
end;

procedure TfrmAvailableInfraredDecoyView.FormCreate(Sender: TObject);
begin
  FInfraredDecoyList := TList.Create;
end;

procedure TfrmAvailableInfraredDecoyView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 1;

  UpdateTabPage;
  UpdateInfraredDecoyList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableInfraredDecoyView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableInfraredDecoyView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmAvailableInfraredDecoyView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmAvailableInfraredDecoyView.lbSingleClick(Sender: TObject);
begin
  if lstInfraredDecoy.ItemIndex = -1 then
    Exit;

  FSelectedInfraredDecoy := TInfrared_Decoy_On_Board(lstInfraredDecoy.Items.Objects[lstInfraredDecoy.ItemIndex]);

  UpdateInfraredDecoyData;
end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmAvailableInfraredDecoyView.UpdateInfraredDecoyData;
var
  timeStr : string;
begin
  with FSelectedInfraredDecoy do
  begin
//    if FInfraRedDecoy_Def.Infrared_Decoy_Index = 0 then
//      edtClass.Text := '(Unnamed)'
//    else
//      edtClass.Text := FInfraRedDecoy_Def.Infrared_Decoy_Identifier;

    lblName.Caption := FInfraRedDecoy_Def.Infrared_Decoy_Identifier;

    {$REGION ' General '}
    edtMaxIRCrossSection.Caption := FormatFloat('0', FInfraRedDecoy_Def.Max_Infrared_Cross);

    SecondToTime(FInfraRedDecoy_Def.Bloom_Time, timeStr);
    edtBloomTime.Caption := timeStr;

    SecondToTime(FInfraRedDecoy_Def.Sustain_Time, timeStr);
    edtSustainTime.Caption := timeStr;

    SecondToTime(FInfraRedDecoy_Def.Max_Dissipation_Time, timeStr);
    edtDissipationInStillAir.Caption := timeStr;

    SecondToTime(FInfraRedDecoy_Def.Min_Dissipation_Time, timeStr);
    edtDissipationIn100.Caption := timeStr;

    edtDescentRate.Caption := FormatFloat('0.00', FInfraRedDecoy_Def.Descent_Rate);
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}
  end;
end;

procedure TfrmAvailableInfraredDecoyView.UpdateInfraredDecoyList;
var
  i : Integer;
  infrareddecoy : TInfrared_Decoy_On_Board;
begin
  lstInfraredDecoy.Items.Clear;

  dmTTT.GetAllInfraredDecoyDef(FInfraredDecoyList);

  for i := 0 to FInfraredDecoyList.Count - 1 do
  begin
    infrareddecoy := FInfraredDecoyList.Items[i];
    lstInfraredDecoy.Items.AddObject(infrareddecoy.FInfraredDecoy_Def.Infrared_Decoy_Identifier, infrareddecoy);
  end;
end;

procedure TfrmAvailableInfraredDecoyView.UpdateTabPage;
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
