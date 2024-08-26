unit uFrmEODView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls,uDBAsset_Sensor, tttData, uSimContainers;

type
  TfrmEODView = class(TForm)
    ImgBackgroundList: TImage;
    ImgBackground: TImage;
    Label4: TLabel;
    lstEOD: TListBox;
    Label2: TLabel;
    lblName: TLabel;
    pnlTabGeneral: TPanel;
    Label3: TLabel;
    edtDetectionRange: TLabel;
    edtSensorType: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtAssociatedCross: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    chkFC_Capable: TCheckBox;
    pnlTabNotes: TPanel;
    mmoNotes: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label7: TLabel;
    edtMaxPossible: TLabel;
    Label20: TLabel;
    ImgBtnPreviousTab: TImage;
    ImgBtnNextTab: TImage;
    lblTab: TLabel;
    ImgBc: TImage;
    lblsearch: TLabel;
    edtCheat: TEdit;
    imgBtnBack: TImage;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure imgBtnBackClick(Sender: TObject);
    procedure ImgBtnNextTabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImgBtnPreviousTabClick(Sender: TObject);
    procedure edtCheatKeyPress(Sender: TObject; var Key: Char);

  private
    tabIndex, tabMax : Integer;
    FEODList : TList;
    FSelectedEOD : TEOD_On_Board;

  public
      procedure UpdateTabPage;
      procedure UpdateEODList;
      procedure UpdateEODData;

  end;

var
  frmEODView: TfrmEODView;

implementation

 uses
   uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmEODView.edtCheatKeyPress(Sender: TObject; var Key: Char);
  var
 i : Integer;
  eod : TEOD_On_Board;
begin
  if Key = #13 then
  begin

lstEOD.Items.Clear;

  dmTTT.GetfilterEODef(FEODList,edtCheat.Text);
    for i := 0 to FEODList.Count - 1 do
    begin
 eod := FEODList.Items[i];
    lstEOD.Items.AddObject(eod.FEO_Def.Class_Identifier, eod);
    end;
  end;
end;

procedure TfrmEODView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FEODList);
  Action := cafree;
end;

procedure TfrmEODView.FormCreate(Sender: TObject);
begin
FEODList := TList.Create;
end;

procedure TfrmEODView.FormShow(Sender: TObject);
begin
 tabIndex := 0;
 tabMax := 1;

 UpdateTabPage;
 UpdateEODList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}
procedure TfrmEODView.imgBtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEODView.ImgBtnNextTabClick(Sender: TObject);
begin
  tabIndex := tabIndex + 1;
  UpdateTabPage
end;

procedure TfrmEODView.ImgBtnPreviousTabClick(Sender: TObject);
begin
  tabIndex := tabIndex - 1;
  UpdateTabPage
end;

procedure TfrmEODView.lbSingleClick(Sender: TObject);
begin
  if lstEOD.ItemIndex = -1 then
    Exit;

  FSelectedEOD := TEOD_On_Board(lstEOD.Items.Objects[lstEOD.ItemIndex]);

  UpdateEODData;
end;
{$ENDREGION}

{$REGION ' View Data Handle '}
procedure TfrmEODView.UpdateEODData;
begin
  with FSelectedEOD do
  begin
    lblName.Caption := FEO_Def.Class_Identifier;

    {$REGION ' General '}
    case FEO_Def.Sensor_Type of
      Ord(steodEOSensor) : edtSensorType.Caption := steodsEOSensor;
      Ord(steodLaserSensor) : edtSensorType.Caption := steodsLaserSensor;
      Ord(steodIRSensor) : edtSensorType.Caption := steodsIRSensor;
    end;

    edtDetectionRange.Caption := FormatFloat('0.00', FEO_Def.Detection_Range);
    edtAssociatedCross.Caption := FormatFloat('0.0', FEO_Def.Known_Cross_Section);
    edtMaxPossible.Caption := FormatFloat('0.00', FEO_Def.Max_Range);
    chkFC_Capable.Checked := Boolean(FEO_Def.Num_FC_Channels);
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

procedure TfrmEODView.UpdateEODList;
var
  i : Integer;
  eod : TEOD_On_Board;
begin
  lstEOD.Items.Clear;

  dmTTT.GetAllEODef(FEODList);

  for i := 0 to FEODList.Count - 1 do
  begin
    eod := FEODList.Items[i];
    lstEOD.Items.AddObject(eod.FEO_Def.Class_Identifier, eod);
  end;
end;

procedure TfrmEODView.UpdateTabPage;
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
