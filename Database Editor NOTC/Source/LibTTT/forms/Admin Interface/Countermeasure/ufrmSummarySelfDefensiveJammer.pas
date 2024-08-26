unit ufrmSummarySelfDefensiveJammer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Countermeasure;

type
  TfrmSummarySelfDefensiveJammer = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    ImgBackgroundForm: TImage;
    pnl1Title: TPanel;
    txtClass: TLabel;
    edtClass: TEdit;
    pnl2ControlPage: TPanel;
    PageControl1: TPageControl;
    tsGeneral: TTabSheet;
    lblECMType: TLabel;
    grbTargetSelection: TGroupBox;
    cbxTARHMissiles: TCheckBox;
    cbxFireControlRadar: TCheckBox;
    cbECMType: TComboBox;
    grbProbOfSuccess: TGroupBox;
    lblTypeA: TLabel;
    mnlbl2: TLabel;
    lblTypeB: TLabel;
    mnlbl3: TLabel;
    mnlbl4: TLabel;
    lblTypeC: TLabel;
    mnlbl5: TLabel;
    mnlbl6: TLabel;
    mnlbl1: TLabel;
    edtTypeA: TEdit;
    TrackBarTypeA: TTrackBar;
    edtTypeB: TEdit;
    TrackBarTypeB: TTrackBar;
    edtTypeC: TEdit;
    TrackBarTypeC: TTrackBar;
    tsNotes: TTabSheet;
    mmoNotes: TMemo;
    ImgHeader: TImage;
    Label2: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    //Global
    procedure ComboBoxDataChange(Sender: TObject);
    procedure CheckBoxDataClick(Sender: TObject);
    procedure edtChange(Sender: TObject);

    //General
    procedure trckbrGeneralChange(Sender: TObject);
    procedure edtGeneralChange(Sender: TObject);

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);


  private
    FSelectedDefensiveJammer : TDefensive_Jammer_On_Board;

    function CekInput: Boolean;
    procedure UpdateDefensiveJammerData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedDefensiveJammer : TDefensive_Jammer_On_Board
      read FSelectedDefensiveJammer write FSelectedDefensiveJammer;
  end;

var
  frmSummarySelfDefensiveJammer: TfrmSummarySelfDefensiveJammer;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSummarySelfDefensiveJammer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmSummarySelfDefensiveJammer.FormShow(Sender: TObject);
begin
  tsGeneral.Show;
  UpdateDefensiveJammerData;

  with FSelectedDefensiveJammer.FDefensiveJammer_Def do
    btnApply.Enabled := Defensive_Jammer_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummarySelfDefensiveJammer.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummarySelfDefensiveJammer.btnApplyClick(Sender: TObject);
begin
  if not CekInput then
    Exit;
  with FSelectedDefensiveJammer do
  begin

    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    {$REGION ' General '}
    LastName := edtClass.Text;
    FDefensiveJammer_Def.Defensive_Jammer_Identifier := edtClass.Text;

    FDefensiveJammer_Def.ECM_Type := cbECMType.ItemIndex;

    FDefensiveJammer_Def.Jammer_TARH_Capable := Ord(cbxTARHMissiles.Checked);
    FDefensiveJammer_Def.Jammer_SARH_Capable := Ord(cbxFireControlRadar.Checked);

    FDefensiveJammer_Def.Type_A_Seducing_Prob := TrackBarTypeA.Position / 100;
    FDefensiveJammer_Def.Type_B_Seducing_Prob := TrackBarTypeB.Position / 100;
    FDefensiveJammer_Def.Type_C_Seducing_Prob := TrackBarTypeC.Position / 100;
    {$ENDREGION}

    {$REGION ' Notes '}
    FNote.Notes := mmoNotes.Text;
    {$ENDREGION}

    if FDefensiveJammer_Def.Defensive_Jammer_Index = 0 then
    begin
      if dmTTT.InsertSelfDefensiveJammerDef(FDefensiveJammer_Def) then
      begin
        dmTTT.InsertNoteStorage(16, FDefensiveJammer_Def.Defensive_Jammer_Index, FNote);
        ShowMessage('Data has been saved');
      end;
    end
    else
    begin
      if dmTTT.UpdateSelfDefensiveJammerDef(FDefensiveJammer_Def) then
      begin
        dmTTT.UpdateNoteStorage(FDefensiveJammer_Def.Defensive_Jammer_Index, FNote);
        ShowMessage('Data has been updated');
      end;
    end;
  end;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummarySelfDefensiveJammer.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummarySelfDefensiveJammer.edtGeneralChange(Sender: TObject);
begin
  if TEdit(Sender).Text = '' then
    TEdit(Sender).Text := '0';

  if (StrToInt(TEdit(Sender).Text) > 100) then
    TEdit(Sender).Text := '100';

  if TEdit(Sender).Name = 'edtTypeA' then
    TrackBarTypeA.Position := StrToInt(TEdit(Sender).Text)
  else if TEdit(Sender).Name = 'edtTypeB' then
    TrackBarTypeB.Position := StrToInt(TEdit(Sender).Text)
  else if TEdit(Sender).Name = 'edtTypeC' then
    TrackBarTypeC.Position := StrToInt(TEdit(Sender).Text);

  btnApply.Enabled := True;
end;

procedure TfrmSummarySelfDefensiveJammer.trckbrGeneralChange(Sender: TObject);
begin
  case TTrackBar(Sender).Tag of
    0: {TypeA}
    begin
      edtTypeA.Text := IntToStr(TTrackBar(Sender).Position);
    end;
    1: {TypeB}
    begin
      edtTypeB.Text := IntToStr(TTrackBar(Sender).Position);
    end;
    2: {TypeC}
    begin
      edtTypeC.Text := IntToStr(TTrackBar(Sender).Position);
    end;
  end;

  btnApply.Enabled := True;
end;

procedure TfrmSummarySelfDefensiveJammer.UpdateDefensiveJammerData;
begin
  with FSelectedDefensiveJammer do
  begin
    if FDefensiveJammer_Def.Defensive_Jammer_Index = 0 then
      edtClass.Text := '(Unnamed)'
    else
      edtClass.Text := FDefensiveJammer_Def.Defensive_Jammer_Identifier;

    {$REGION ' General '}
    LastName := edtClass.Text;
    cbxTARHMissiles.Checked := Boolean(FDefensiveJammer_Def.Jammer_TARH_Capable);
    cbxFireControlRadar.Checked := Boolean(FDefensiveJammer_Def.Jammer_SARH_Capable);

    cbECMType.ItemIndex := FDefensiveJammer_Def.ECM_Type;

    TrackBarTypeA.Position := Round(FDefensiveJammer_Def.Type_A_Seducing_Prob * 100);
    TrackBarTypeB.Position := Round(FDefensiveJammer_Def.Type_B_Seducing_Prob * 100);
    TrackBarTypeC.Position := Round(FDefensiveJammer_Def.Type_C_Seducing_Prob * 100);
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

function TfrmSummarySelfDefensiveJammer.CekInput: Boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtClass.Text = '')then
  begin
    ShowMessage('Please insert class name');
    Exit;
  end;

  {Jika berisi spasi semua}
  if Copy(edtClass.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtClass.Text);
    numSpace := 0;

    for i := 1 to chkSpace do
    begin
      if edtClass.Text[i] = #32 then
      numSpace := numSpace + 1;
    end;

    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  {Jika Class Name sudah ada}
  if (dmTTT.GetSelfDefensiveJammerDef(edtClass.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedDefensiveJammer.FDefensiveJammer_Def.Defensive_Jammer_Index= 0 then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end
    else if LastName <> edtClass.Text then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  Result := True;
end;

{$ENDREGION}

{$REGION ' Filter Input '}

procedure TfrmSummarySelfDefensiveJammer.CheckBoxDataClick(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummarySelfDefensiveJammer.ComboBoxDataChange(Sender: TObject);
begin
  if TComboBox(Sender).ItemIndex = -1 then
    TComboBox(Sender).ItemIndex := 0;

  btnApply.Enabled := True;
end;

procedure TfrmSummarySelfDefensiveJammer.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

{$ENDREGION}


end.
