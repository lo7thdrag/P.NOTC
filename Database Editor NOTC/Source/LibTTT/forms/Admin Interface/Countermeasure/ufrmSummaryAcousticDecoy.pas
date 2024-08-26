unit ufrmSummaryAcousticDecoy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Countermeasure;

type
  TfrmSummaryAcousticDecoy = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    ImgBackgroundForm: TImage;
    Label1: TLabel;
    pnl1Title: TPanel;
    txtClass: TLabel;
    edtClass: TEdit;
    pnl2ControlPage: TPanel;
    PageControl1: TPageControl;
    tsGeneral: TTabSheet;
    grpDecoyNoise: TGroupBox;
    lblTrackbar500dB: TLabel;
    lblTrackbar0dB: TLabel;
    lblOwnshipAmbientNoiseIntensityIncrease: TLabel;
    edtDecoyNoise: TEdit;
    trckbrDecoyNoise: TTrackBar;
    grpProbOfHit: TGroupBox;
    btnEdtProbOfHit: TButton;
    tsNotes: TTabSheet;
    mmoNotes: TMemo;
    ImgHeader: TImage;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    //Global
    procedure edtChange(Sender: TObject);

    //General
    procedure trckbrGeneralChange(Sender: TObject);
    procedure edtGeneralChange(Sender: TObject);
    procedure btnEdtProbOfHitClick(Sender: TObject);

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);


  private
    FSelectedAcousticDecoy : TAcoustic_Decoy_On_Board;

    function CekInput: Boolean;
    procedure UpdateAcousticDecoyData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedAcousticDecoy : TAcoustic_Decoy_On_Board
      read FSelectedAcousticDecoy write FSelectedAcousticDecoy;
  end;

var
  frmSummaryAcousticDecoy: TfrmSummaryAcousticDecoy;

implementation

uses
  uDataModuleTTT, uAccousticDecoyProb;

 {$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSummaryAcousticDecoy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmSummaryAcousticDecoy.FormShow(Sender: TObject);
begin
  tsGeneral.Show;
  UpdateAcousticDecoyData;

  with FSelectedAcousticDecoy.FAccousticDecoy_Def do
    btnApply.Enabled := Decoy_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryAcousticDecoy.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummaryAcousticDecoy.btnApplyClick(Sender: TObject);
begin

  with FSelectedAcousticDecoy do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    {$REGION ' General '}
    LastName := edtClass.Text;
    FAccousticDecoy_Def.Decoy_Identifier := edtClass.Text;

    FAccousticDecoy_Def.Acoustic_Intensity_Increase := trckbrDecoyNoise.Position;
    {$ENDREGION}

    {$REGION ' Notes '}
    FNote.Notes := mmoNotes.Text;
    {$ENDREGION}

    if FAccousticDecoy_Def.Decoy_Index = 0 then
    begin
      if dmTTT.InsertAcousticDecoyDef(FAccousticDecoy_Def) then
      begin
        dmTTT.InsertNoteStorage(20, FAccousticDecoy_Def.Decoy_Index, FNote);
        ShowMessage('Data has been saved');
      end;
    end
    else
    begin
      if dmTTT.UpdateAcousticDecoyDef(FAccousticDecoy_Def) then
      begin
        dmTTT.UpdateNoteStorage(FAccousticDecoy_Def.Decoy_Index, FNote);
        ShowMessage('Data has been updated');
      end;
    end;
  end;

  UpdateAcousticDecoyData;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummaryAcousticDecoy.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummaryAcousticDecoy.btnEdtProbOfHitClick(Sender: TObject);
begin
  fAccousticDecoyProb := TAccousticDecoyProb.Create(Self);
  try
    with fAccousticDecoyProb do
    begin
      SelectedAcousticDecoy := FSelectedAcousticDecoy;
      ShowModal;
    end;
  finally
    fAccousticDecoyProb.Free;
  end;
  
end;

procedure TfrmSummaryAcousticDecoy.edtGeneralChange(Sender: TObject);
begin
  if TEdit(Sender).Text = '' then
    TEdit(Sender).Text := '0';

  if (StrToInt(TEdit(Sender).Text) > 500) then
    TEdit(Sender).Text := '500';

  trckbrDecoyNoise.Position := StrToInt(TEdit(Sender).Text);

  btnApply.Enabled := True;
end;

procedure TfrmSummaryAcousticDecoy.trckbrGeneralChange(Sender: TObject);
begin
  edtDecoyNoise.Text := IntToStr(TTrackBar(Sender).Position);
end;

procedure TfrmSummaryAcousticDecoy.UpdateAcousticDecoyData;
begin
  with FSelectedAcousticDecoy do
  begin
    if FAccousticDecoy_Def.Decoy_Index = 0 then
      edtClass.Text := '(Unnamed)'
    else
      edtClass.Text := FAccousticDecoy_Def.Decoy_Identifier;

    {$REGION ' General '}
    LastName := edtClass.Text;
    trckbrDecoyNoise.Position := Round(FAccousticDecoy_Def.Acoustic_Intensity_Increase);
    btnEdtProbOfHit.Enabled := FAccousticDecoy_Def.Decoy_Index <> 0;
    {$ENDREGION}

    {$REGION ' Notes '}
    mmoNotes.Text := FNote.Notes;
    {$ENDREGION}

  end;
end;

function TfrmSummaryAcousticDecoy.CekInput: Boolean;
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
  if (dmTTT.GetAcousticDecoyDef(edtClass.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedAcousticDecoy.FAccousticDecoy_Def.Decoy_Index = 0 then
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

procedure TfrmSummaryAcousticDecoy.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

{$ENDREGION}


end.
