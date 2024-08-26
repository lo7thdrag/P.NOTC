unit ufrmAvailableChaffView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uSimContainers, uDBAsset_Countermeasure,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, uBaseCoordSystem;

type
  TfrmAvailableChaffView = class(TForm)
    ImgBackground: TImage;
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    Label2: TLabel;
    Label4: TLabel;
    lstChaff: TListBox;
    lblName: TLabel;
    pnlTabGeneral: TPanel;
    Image1: TImage;
    Label18: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    edtLowerLimit: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtUpperLimit: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Panel4: TPanel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    Label3: TLabel;
    Label7: TLabel;
    edtMaxRadarCross: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtBloomTime: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    edtMaxBloom: TLabel;
    Label15: TLabel;
    edtDissipationTimeinStillAir: TLabel;
    Label17: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    edtDissipationTimein100kt: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    edtDescentRate: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edtMaxRadarAttenuation: TLabel;
    Label29: TLabel;
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
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure lbSingleClick(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure edtchafflistKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    tabIndex, tabMax : Integer;
    FChaffList : TList;
    FSelectedChaff : TChaff_On_Board;
  public
    { Public declarations }

    procedure UpdateTabPage;
    procedure UpdateChaffList;
    procedure UpdateChaffData;
  end;

var
  frmAvailableChaffView: TfrmAvailableChaffView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableChaffView.edtchafflistKeyPress(Sender: TObject;
  var Key: Char);
 var
  i : Integer;
  chaff : TChaff_On_Board;
begin
  if Key = #13 then
  begin
  lstChaff.Items.Clear;

  dmTTT.GetfilterChaffDef(FChaffList,edtCheat.Text);

    for i := 0 to FChaffList.Count - 1 do
    begin
   chaff := FChaffList.Items[i];
    lstChaff.Items.AddObject(chaff.FChaff_Def.Chaff_Identifier, chaff);
  end;
end;
end;

procedure TfrmAvailableChaffView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FChaffList);

  Action := cafree;
end;

procedure TfrmAvailableChaffView.FormCreate(Sender: TObject);
begin
  FChaffList := TList.Create;
end;

procedure TfrmAvailableChaffView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 1;

  UpdateTabPage;
  UpdateChaffList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableChaffView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableChaffView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmAvailableChaffView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmAvailableChaffView.lbSingleClick(Sender: TObject);
begin
  if lstChaff.ItemIndex = -1 then
    Exit;

  FSelectedChaff := TChaff_On_Board(lstChaff.Items.Objects[lstChaff.ItemIndex]);

  UpdateChaffData;
end;

procedure TfrmAvailableChaffView.Panel9Click(Sender: TObject);
begin

end;

{$ENDREGION}

{$REGION ' View Data Handle '}

procedure TfrmAvailableChaffView.UpdateChaffData;
var
  timeStr : string;
begin
  with FSelectedChaff do
  begin
//    if FChaff_Def.Chaff_Index = 0 then
//      edtClass.Text := '(Unnamed)'
//    else
//      edtClass.Text := FChaff_Def.Chaff_Identifier;

    lblName.Caption := FChaff_Def.Chaff_Identifier;

    {$REGION ' General '}
    edtMaxRadarCross.Caption := FormatFloat('0.00', FChaff_Def.Max_Radar_Cross);

    {Catatan : Rumus dibawah sepertinya kurang tepat}
    SecondToTime(FChaff_Def.Bloom_Time, timeStr);
    edtBloomTime.Caption := timeStr;

    SecondToTime(FChaff_Def.Max_Dissipation_Time, timeStr);
    edtDissipationTimeinStillAir.Caption := timeStr;

    SecondToTime(FChaff_Def.Min_Dissipation_Time, timeStr);
    edtDissipationTimein100kt.Caption := timeStr;

    edtDescentRate.Caption := FormatFloat('0.00', FChaff_Def.Descent_Rate);
    edtMaxBloom.Caption := FormatFloat('0.00', FChaff_Def.Max_Radius);
    edtMaxRadarAttenuation.Caption := FormatFloat('0.00', FChaff_Def.Max_Radar_Attenuation);

    edtLowerLimit.Caption := FormatFloat('0.0', FChaff_Def.Radar_Affect_Lower_Freq);
    edtUpperLimit.Caption := FormatFloat('0.0', FChaff_Def.Radar_Affect_Upper_Freq);
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmAvailableChaffView.UpdateChaffList;
var
  i : Integer;
  chaff : TChaff_On_Board;
begin
  lstChaff.Items.Clear;

  dmTTT.GetAllChaffDef(FChaffList);

  for i := 0 to FChaffList.Count - 1 do
  begin
    chaff := FChaffList.Items[i];
    lstChaff.Items.AddObject(chaff.FChaff_Def.Chaff_Identifier, chaff);
  end;
end;

procedure TfrmAvailableChaffView.UpdateTabPage;
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
