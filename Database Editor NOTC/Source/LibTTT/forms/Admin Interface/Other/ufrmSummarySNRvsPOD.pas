unit ufrmSummarySNRvsPOD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, newClassASTT, Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TfrmSummarySnrVsPod = class(TForm)
    ImgBackgroundForm: TImage;
    ImgHeader: TImage;
    Label1: TLabel;
    pnl1Title: TPanel;
    Label2: TLabel;
    edtName: TEdit;
    pnl2ControlPage: TPanel;
    btnOK: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    pgc1: TPageControl;
    tsGeneral: TTabSheet;
    btnEditList: TButton;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnEditListClick(Sender: TObject);

  private
    FSelectedSNRvsPOD : TPOD_vs_SNR_Curve_Definition;

    function CekInput: Boolean;
    procedure UpdateSnrVsPodData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedSNRvsPOD : TPOD_vs_SNR_Curve_Definition read FSelectedSNRvsPOD write FSelectedSNRvsPOD;
  end;

var
  frmSummarySnrVsPod: TfrmSummarySnrVsPod;

implementation

uses
  uDataModuleTTT, ufrmSNRvsPODGraphic ;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSummarySnrVsPod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmSummarySnrVsPod.FormShow(Sender: TObject);
begin
  tsGeneral.Show;
  UpdateSnrVsPodData;

  with FSelectedSNRvsPOD.FData do
    btnApply.Enabled := Curve_Definition_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummarySnrVsPod.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummarySnrVsPod.btnApplyClick(Sender: TObject);
begin
  with FSelectedSNRvsPOD do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    FData.Curve_Definition_Identifier := edtName.Text;
    LastName := edtName.Text;

    if FData.Curve_Definition_Index = 0 then
    begin
      if dmTTT.InsertPODvsSNRCurveDef(FData) then
        ShowMessage('Data has been saved');
    end
    else
    begin
      if dmTTT.UpdatePODvsSNRCurveDef(FData) then
        ShowMessage('Data has been updated');
    end;

  end;

  UpdateSnrVsPodData;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummarySnrVsPod.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummarySnrVsPod.btnEditListClick(Sender: TObject);
begin
  frmSNRvsPODGraphic := TfrmSNRvsPODGraphic.Create(Self);
  try
    with frmSNRvsPODGraphic do
    begin
      SelectedProbObj := FSelectedSNRvsPOD;
      ShowModal;
    end;
    AfterClose := frmSNRvsPODGraphic.AfterClose;
  finally
    frmSNRvsPODGraphic.Free;
  end;

  btnCancel.Enabled := not AfterClose;
  btnApply.Enabled := AfterClose;
end;

procedure TfrmSummarySnrVsPod.UpdateSnrVsPodData;
begin
  with FSelectedSNRvsPOD do
  begin
    if FData.Curve_Definition_Index = 0 then
      edtName.Text := '(Unnamed)'
    else
      edtName.Text := FData.Curve_Definition_Identifier;

    LastName := edtName.Text;

    btnEditList.Enabled := FData.Curve_Definition_Index <> 0
  end;
end;

function TfrmSummarySnrVsPod.CekInput: Boolean;
var
 i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtName.Text = '')then
  begin
    ShowMessage('Please insert class name');
    Exit;
  end;

  {Jika berisi spasi semua}
  if Copy(edtName.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtName.Text);
    numSpace := 0;

    for i := 1 to chkSpace do
    begin
      if edtName.Text[i] = #32 then
      numSpace := numSpace + 1;
    end;

    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  {Jika Class Name sudah ada}
  if (dmTTT.GetPODvsSNRCurveDef(edtName.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedSNRvsPOD.FData.Curve_Definition_Index = 0 then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end
    else if LastName <> edtName.Text then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  Result := True;
end;

{$ENDREGION}

end.
