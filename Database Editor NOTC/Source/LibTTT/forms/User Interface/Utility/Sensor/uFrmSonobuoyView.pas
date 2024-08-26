unit uFrmSonobuoyView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, uDBAsset_Sonobuoy, uSimContainers, uBaseCoordSystem;

type
  TfrmSonobuoyView = class(TForm)
    ImgBackgroundList: TImage;
    ImgBackground: TImage;
    Label4: TLabel;
    lstSonobuoy: TListBox;
    Label2: TLabel;
    lblName: TLabel;
    ImgBc: TImage;
    lblTab: TLabel;
    ImgBtnNextTab: TImage;
    ImgBtnPreviousTab: TImage;
    pnlTabGeneral: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label5: TLabel;
    edtMaxDepth: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    medtEnduranceTime: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtSonarDef: TLabel;
    pnlTabChar: TPanel;
    Label12: TLabel;
    Label16: TLabel;
    Label26: TLabel;
    edtLength: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtWidth: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Panel6: TPanel;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    Image2: TImage;
    Label8: TLabel;
    Label28: TLabel;
    edtHeight: TLabel;
    Label36: TLabel;
    Label1: TLabel;
    lbl1: TLabel;
    edt1: TEdit;
    imgBtnBack: TImage;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure imgBtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);

  private
    tabIndex, tabMax : Integer;
    FSonobuoyList : TList;
    FSelectedSonobuoy : TSonobuoy_On_Board;

  public
   procedure UpdateTabPage;
   procedure UpdateSonobuoyList;
   procedure UpdateSonobuoyData;

   procedure UpdateSonarData;

  end;

var
  frmSonobuoyView: TfrmSonobuoyView;

implementation

 uses uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSonobuoyView.edtCheatKeyPress(Sender: TObject; var Key: Char);
  var
  i : Integer;
  sonobuoy : TSonobuoy_On_Board;
begin
  if Key = #13 then
  begin
 lstSonobuoy.Items.Clear;

  dmTTT.GetfilterSonobuoyDef(FSonobuoyList,edt1.Text);
    for i := 0 to  FSonobuoyList.Count - 1 do
    begin
   sonobuoy := FSonobuoyList.Items[i];
    lstSonobuoy.Items.AddObject(sonobuoy.FDef.Class_Identifier, sonobuoy);
    end;
  end;
end;

procedure TfrmSonobuoyView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FSonobuoyList);
  Action := cafree;
end;

procedure TfrmSonobuoyView.FormCreate(Sender: TObject);
begin
 FSonobuoyList := TList.Create;
end;

procedure TfrmSonobuoyView.FormShow(Sender: TObject);
begin
  tabIndex := 0;
  tabMax := 2;
  UpdateSonobuoyList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSonobuoyView.imgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSonobuoyView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmSonobuoyView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmSonobuoyView.lbSingleClick(Sender: TObject);
begin
  if lstSonobuoy.ItemIndex = -1 then
    Exit;

  FSelectedSonobuoy := TSonobuoy_On_Board(lstSonobuoy.Items.Objects[lstSonobuoy.ItemIndex]);

  UpdateSonobuoyData;
end;

{$ENDREGION}


{$REGION ' View Data Handle '}
procedure TfrmSonobuoyView.UpdateSonobuoyData;
var
  timeStr : string;
begin
  with FSelectedSonobuoy do
  begin
      lblName.Caption := FDef.Class_Identifier;

    {$REGION ' General '}
    edtMaxDepth.Caption := FormatFloat('0', FDef.Max_Depth);

    SecondToTime(FDef.Endurance_Time, timeStr);
    medtEnduranceTime.Caption := timeStr;

    UpdateSonarData;

    {$ENDREGION}

    {$REGION ' Characteristics '}
    edtLength.Caption := FormatFloat('0', FDef.Length);
    edtWidth.Caption := FormatFloat('0', FDef.Width);
    edtHeight.Caption := FormatFloat('0', FDef.Height);

    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;

end;

procedure TfrmSonobuoyView.UpdateSonobuoyList;
 var
  i : Integer;
  sonobuoy : TSonobuoy_On_Board;
begin
  lstSonobuoy.Items.Clear;

  dmTTT.GetAllSonobuoyDef(FSonobuoyList);

  for i := 0 to FSonobuoyList.Count - 1 do
  begin
    sonobuoy := FSonobuoyList.Items[i];
    lstSonobuoy.Items.AddObject(sonobuoy.FDef.Class_Identifier, sonobuoy);
  end;
end;

procedure TfrmSonobuoyView.UpdateTabPage;
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
      lblTab.Caption := 'CHARACTERISTICS';
      pnlTabChar.BringToFront;
    end;
    2:
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

procedure TfrmSonobuoyView.UpdateSonarData;
begin
  with FSelectedSonobuoy do
  begin
    dmTTT.GetSonarDef(FDef.Sonar_Index, FSonar);

    if Assigned(FSonar) then
      edtSonarDef.Caption := FSonar.FDef.Sonar_Identifier
    else
      edtSonarDef.Caption := 'none';
  end;
end;

{$ENDREGION}

end.
