unit ufrmSummaryOverlay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, newClassASTT, uDBAsset_Geo, tttData,
  uMainStaticShape, uMainDynamicShape, uRecord, Vcl.Imaging.pngimage,
  Vcl.ComCtrls;

type
  TfrmSummaryOverlay = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    ImgBackgroundForm: TImage;
    pnl1Title: TPanel;
    txtClass: TLabel;
    edtName: TEdit;
    pnl2ControlPage: TPanel;
    PageControl1: TPageControl;
    tsGeneral: TTabSheet;
    lbl2: TLabel;
    lbl3: TLabel;
    btnEditOverlay: TButton;
    cbbDomain: TComboBox;
    cbbType: TComboBox;
    ImgHeader: TImage;
    Label1: TLabel;

    procedure FormShow(Sender: TObject);

    procedure cbbTypeChange(Sender: TObject);
    procedure cbbDomainChange(Sender: TObject);
    procedure btnEditOverlayClick(Sender: TObject);

    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private

    FSelectedOverlay : TOverlay_Definition;

    function CekInput: Boolean;
    procedure UpdateOverlayData;

  public
    StateOverlay : Integer;

    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedOverlay : TOverlay_Definition read FSelectedOverlay write FSelectedOverlay;
  end;

var
  frmSummaryOverlay : TfrmSummaryOverlay;

implementation

uses
  ufrmOverlayEditor, uDataModuleTTT, uDBEditSetting, uBaseCoordSystem;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSummaryOverlay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmSummaryOverlay.FormShow(Sender: TObject);
begin
  tsGeneral.Show;
  UpdateOverlayData;

  with FSelectedOverlay.FData do
    btnApply.Enabled := Overlay_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryOverlay.btnOkClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummaryOverlay.btnApplyClick(Sender: TObject);
var
  OverlayDirOld, OverlayDirNew : string;
begin
  with FSelectedOverlay do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    {$REGION ' General '}
    FData.Overlay_Identifier := edtName.Text;
    FData.Name := edtName.Text;
    FData.Tipe := 1;{static}
    FData.Domain := cbbDomain.ItemIndex;

    OverlayDirOld := vAppDBSetting.OverlayPath + '\' + LastName + '.dat';
    OverlayDirNew := vAppDBSetting.OverlayPath + '\' + edtName.Text + '.dat';

    LastName := edtName.Text;
    {$ENDREGION}

    if FData.Overlay_Index = 0 then
    begin
      if dmTTT.InsertOverlayDef(FData) then
      begin
        ShowMessage('Data has been saved');
      end;
    end
    else
    begin
      if dmTTT.UpdateOverlayDef(FData) then
      begin
        RenameFile(OverlayDirOld, OverlayDirNew);
        ShowMessage('Data has been updated');
      end;
    end;
  end;

  UpdateOverlayData;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummaryOverlay.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummaryOverlay.btnEditOverlayClick(Sender: TObject);
begin

  with OverlayEditorForm do
  begin
    SelectedOverlay := FSelectedOverlay;
    ShowModal;
  end;

  AfterClose := OverlayEditorForm.AfterClose;

  btnCancel.Enabled := not AfterClose;
  btnApply.Enabled := true;
end;

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure TfrmSummaryOverlay.cbbDomainChange(Sender: TObject);
begin
  FSelectedOverlay.FData.Domain := cbbDomain.ItemIndex;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryOverlay.cbbTypeChange(Sender: TObject);
begin
  lbl3.Visible := cbbType.ItemIndex = 1;
  cbbDomain.Visible := cbbType.ItemIndex = 1;
  cbbDomain.ItemIndex := 0;

  btnApply.Enabled := True;

end;

procedure TfrmSummaryOverlay.UpdateOverlayData;
begin
  with FSelectedOverlay.FData do
  begin
    if Overlay_Index = 0 then
      edtName.Text := '(Unnamed)'
    else
      edtName.Text := Overlay_Identifier;

    LastName := edtName.Text;

    cbbType.ItemIndex := Tipe;
    cbbDomain.ItemIndex := Domain;

    btnEditOverlay.Enabled := Overlay_Index <> 0;
  end;
end;

function TfrmSummaryOverlay.CekInput: Boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if edtName.Text = '' then
  begin
    ShowMessage('Incomplete data input');
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
      ShowMessage('Please use another name');
      Exit;
    end;
  end;

  {Jika Class Name sudah ada}
  if (dmTTT.GetOverlayDef(edtName.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedOverlay.FData.Overlay_Index = 0 then
    begin
      ShowMessage('Please use another overlay name');
      Exit;
    end
    else if LastName <> edtName.Text then
    begin
      ShowMessage('Please use another overlay name');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfrmSummaryOverlay.edtNameChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

{$ENDREGION}


end.
