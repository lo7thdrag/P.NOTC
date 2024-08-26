unit uFrmMADView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls,uDBAsset_Sensor, uSimContainers;

type
  TfrmMADView = class(TForm)
    ImgBackgroundList: TImage;
    ImgBackground: TImage;
    Label4: TLabel;
    lstMAD: TListBox;
    Label2: TLabel;
    lblName: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    edtBaselineDetection: TLabel;
    edtAssociatedCross: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pnlTabGeneral: TPanel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    Image1: TImage;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    Image2: TImage;
    lblTab: TLabel;
    edtCheat: TEdit;
    lblsearch: TLabel;
    ImgBtnBack: TImage;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure ImgBtnBackClick(Sender: TObject);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);

  private
    tabIndex, tabMax : Integer;
    FMADList : TList;
    FSelectedMAD : TMAD_On_Board;

  public
   procedure UpdateTabPage;
   procedure UpdateMADList;
   procedure UpdateMADData;

  end;

var
  frmMADView: TfrmMADView;

implementation

uses
   uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmMADView.edtCheatKeyPress(Sender: TObject; var Key: Char);
 var
  i : Integer;
  mad : TMAD_On_Board;
begin
  if Key = #13 then
  begin
    lstMAD.Items.Clear;

    dmTTT.GetfilterMADDef(FMADList,edtCheat.Text);
    for i := 0 to FMADList.Count - 1 do
    begin
      mad := FMADList.Items[i];
      lstMAD.Items.AddObject(mad.FMAD_Def.Class_Identifier, mad);
    end;
  end;
end;

procedure TfrmMADView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FMADList);
  Action := cafree;
end;

procedure TfrmMADView.FormCreate(Sender: TObject);
begin
FMADList := TList.Create;
end;

procedure TfrmMADView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 1;

  UpdateTabPage;
  UpdateMADList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmMADView.ImgBtnBackClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmMADView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmMADView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmMADView.lbSingleClick(Sender: TObject);
begin
  if lstMAD.ItemIndex = -1 then
    Exit;

  FSelectedMAD := TMAD_On_Board(lstMAD.Items.Objects[lstMAD.ItemIndex]);

  UpdateMADData;
end;
{$ENDREGION}

{$REGION ' View Data Handle '}
procedure TfrmMADView.UpdateMADData;
begin
  with FSelectedMAD do
  begin
    lblName.Caption := FMAD_Def.Class_Identifier;

    {$REGION ' General '}
    edtBaselineDetection.Caption := FormatFloat('0.00', FMAD_Def.Baseline_Detect_Range);
    edtAssociatedCross.Caption := FormatFloat('0', FMAD_Def.Known_Cross_Section);
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}
  end;
end;

procedure TfrmMADView.UpdateMADList;
var
  i : Integer;
  mad : TMAD_On_Board;
begin
  lstMAD.Items.Clear;

  dmTTT.GetAllMADDef(FMADList);

  for i := 0 to FMADList.Count - 1 do
  begin
    mad := FMADList.Items[i];
    lstMAD.Items.AddObject(mad.FMAD_Def.Class_Identifier, mad);
  end;
end;

procedure TfrmMADView.UpdateTabPage;
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
