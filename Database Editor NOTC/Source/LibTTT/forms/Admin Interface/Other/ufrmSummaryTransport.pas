unit ufrmSummaryTransport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ufrmTransportPickList, uDBAsset_Transport, uDBAssetObject,
  Vcl.ComCtrls, Vcl.Imaging.pngimage
  ;

type
  TfrmSummaryTransport = class(TForm)
    lblID_Vhcle: TLabel;
    pnl2ControlPage: TPanel;
    PageControl1: TPageControl;
    tsGeneral: TTabSheet;
    chkCarriableUnit: TCheckBox;
    grbHanggarUnitCarried: TGroupBox;
    lbl2: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl14: TLabel;
    edtHangarMaxCapacity: TEdit;
    edtHanggarMaxWeight: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    chkFixWing: TCheckBox;
    chkRotary: TCheckBox;
    chkHangarUnitCarried: TCheckBox;
    grbDeckUnitCarried: TGroupBox;
    lbl4: TLabel;
    lbl11: TLabel;
    edtDeckMaxWeight: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    chkLand: TCheckBox;
    chkAmphibious: TCheckBox;
    chkDeckUnitCarried: TCheckBox;
    grbPersonelUnitCarried: TGroupBox;
    lbl10: TLabel;
    lbl3: TLabel;
    edtPersonelMaxCapacity: TEdit;
    chkPersonelUnitCarried: TCheckBox;
    ImgBackgroundForm: TImage;
    Label5: TLabel;
    ImgHeader: TImage;
    pnl1Title: TPanel;
    txtClass: TLabel;
    edtClass: TEdit;
    btnOK: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    lbl6: TLabel;
    Label7: TLabel;
    edtDeckMaxWide: TEdit;
    lbl13: TLabel;
    edtDeckMaxLength: TEdit;
    Label8: TLabel;

    procedure FormShow(Sender: TObject);

    //Global
    function GetNumberOfKoma(s : string): Boolean;
    procedure edtNumeralKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxDataClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure ValidationFormatInput();

    //General
    procedure chkHangarUnitCarriedClick(Sender: TObject);
    procedure chkDeckUnitCarriedClick(Sender: TObject);
    procedure chkPersonelUnitCarriedClick(Sender: TObject);
    procedure chkHanggarSubUnitClick(Sender: TObject);
    procedure chkDecSubUnitClick(Sender: TObject);

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    FSelectedTransport : TTransport;

    function CekInput: Boolean;
    procedure UpdateTransportData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedTransport : TTransport read FSelectedTransport write FSelectedTransport;

  end;

var
  frmSummaryTransport: TfrmSummaryTransport;


implementation

{$R *.dfm}


uses
  uDataModuleTTT;

{$REGION ' Form Handle '}

procedure TfrmSummaryTransport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmSummaryTransport.FormShow(Sender: TObject);
begin
  tsGeneral.Show;
  UpdateTransportData;

  with FSelectedTransport.FData do
    btnApply.Enabled := Transport_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryTransport.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummaryTransport.btnApplyClick(Sender: TObject);
begin
  with FSelectedTransport do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    ValidationFormatInput;

    {$REGION ' General '}
    LastName := edtClass.Text;
    FData.Transport_Identifier := edtClass.Text;
    FData.Carriable := chkCarriableUnit.Checked;
    FData.Hangar_Unit_Carried := chkHangarUnitCarried.Checked;
    FData.FixedWing_Carried := chkFixWing.Checked;
    FData.Rotary_Carried := chkRotary.Checked;
    FData.Max_Hangar_Capacity := StrToInt(edtHangarMaxCapacity.Text);
    FData.Max_Hangar_Weight := StrToFloat(edtHanggarMaxWeight.Text);

    FData.Deck_Unit_Carried := chkDeckUnitCarried.Checked;
    FData.Amphibious_Carried := chkAmphibious.Checked;
    FData.Land_Carried := chkLand.Checked;
    FData.Max_Deck_Weight := StrToFloat(edtDeckMaxWeight.Text);
    FData.Deck_Width := StrToFloat(edtDeckMaxWide.Text);
    FData.Deck_Length := StrToFloat(edtDeckMaxLength.Text);

    FData.Personnel_Unit_Carried := chkPersonelUnitCarried.Checked;
    FData.Max_Personnel_Capacity := StrToInt(edtPersonelMaxCapacity.Text);
    {$ENDREGION}

    if FData.Transport_Index = 0 then
    begin
      if dmTTT.InsertTransportDef(FData) then
      begin
        ShowMessage('Data has been saved');
      end;
    end
    else
    begin
      if dmTTT.UpdateTransportDef(FData) then
      begin
        ShowMessage('Data has been updated');
      end;
    end;
  end;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummaryTransport.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummaryTransport.chkHangarUnitCarriedClick(Sender: TObject);
begin
  grbHanggarUnitCarried.Enabled := chkHangarUnitCarried.Checked;
  chkRotary.Checked := chkHangarUnitCarried.Checked;
  chkFixWing.Checked := chkHangarUnitCarried.Checked;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryTransport.chkDeckUnitCarriedClick(Sender: TObject);
begin
  grbDeckUnitCarried.Enabled := chkDeckUnitCarried.Checked;
  chkAmphibious.Checked := chkDeckUnitCarried.Checked;
  chkLand.Checked := chkDeckUnitCarried.Checked;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryTransport.chkPersonelUnitCarriedClick(Sender: TObject);
begin
  grbPersonelUnitCarried.Enabled := chkPersonelUnitCarried.Checked;

  if not chkDeckUnitCarried.Checked then
  begin
    edtPersonelMaxCapacity.Text := '0';
  end;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryTransport.chkHanggarSubUnitClick(Sender: TObject);
begin
  if (not chkFixWing.Checked) and (not chkRotary.Checked) then
  begin
    edtHangarMaxCapacity.Enabled := False;
    edtHanggarMaxWeight.Enabled := False;
    edtHangarMaxCapacity.Text := '0';
    edtHanggarMaxWeight.Text := '0.0';
  end
  else
  begin
    edtHangarMaxCapacity.Enabled := True;
    edtHanggarMaxWeight.Enabled := True;
  end;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryTransport.chkDecSubUnitClick(Sender: TObject);
begin
  if (not chkAmphibious.Checked) and (not chkLand.Checked) then
  begin

    edtDeckMaxWeight.Enabled := False;
    edtDeckMaxWide.Enabled := False;
    edtDeckMaxLength.Enabled := False;
    edtDeckMaxWeight.Text := '0.0';
    edtDeckMaxWide.Text := '0.0';
    edtDeckMaxLength.Text := '0.0';
  end
  else
  begin
    edtDeckMaxWeight.Enabled := True;
    edtDeckMaxWide.Enabled := True;
    edtDeckMaxLength.Enabled := True;
  end;

  btnApply.Enabled := True;
end;

procedure TfrmSummaryTransport.UpdateTransportData;
begin
  with FSelectedTransport do
  begin
    if FData.Transport_Index = 0 then
      edtClass.Text := '(Unnamed)'
    else
      edtClass.Text := FData.Transport_Identifier;

    {$REGION ' General '}
    LastName := edtClass.Text;
    chkCarriableUnit.Checked := FData.Carriable;
    chkHangarUnitCarried.Checked := FData.Hangar_Unit_Carried;
    chkFixWing.Checked := FData.FixedWing_Carried;
    chkRotary.Checked := FData.Rotary_Carried;
    edtHangarMaxCapacity.Text := FormatFloat('0', FData.Max_Hangar_Capacity);
    edtHanggarMaxWeight.Text := FormatFloat('0.0', FData.Max_Hangar_Weight);

    chkDeckUnitCarried.Checked := FData.Deck_Unit_Carried;
    chkAmphibious.Checked := FData.Amphibious_Carried;
    chkLand.Checked := FData.Land_Carried;
    edtDeckMaxWeight.Text := FormatFloat('0.0', FData.Max_Deck_Weight);
    edtDeckMaxWide.Text := FormatFloat('0.0', FData.Deck_Width);
    edtDeckMaxLength.Text := FormatFloat('0.0', FData.Deck_Length);

    chkPersonelUnitCarried.Checked := FData.Personnel_Unit_Carried;
    edtPersonelMaxCapacity.Text := FormatFloat('0', FData.Max_Personnel_Capacity);
    {$ENDREGION}
  end;
end;

function TfrmSummaryTransport.CekInput: Boolean;
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
//  if (dmTTT.GetLogisticDef(edtClass.Text)>0) then
//  begin
//    {Jika inputan baru}
//    if FSelectedTransport.FData.Transport_Index= 0 then
//    begin
//      ShowMessage('Please use another class name');
//      Exit;
//    end
//    else if LastName <> edtClass.Text then
//    begin
//      ShowMessage('Please use another class name');
//      Exit;
//    end;
//  end;

  Result := True;
end;

{$ENDREGION}

{$REGION ' Filter Input '}

function TfrmSummaryTransport.GetNumberOfKoma(s: string): Boolean;
var
  a, i : Integer;
begin
  Result := False;
  a := 0;

  for i := 1 to length(s) do
  begin
    if s[i] = '.' then
      a := a + 1;
  end;

  if a > 0 then
    Result := True;
end;

procedure TfrmSummaryTransport.edtNumeralKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetNumberOfKoma(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if Key = #13 then
  begin
    if TEdit(Sender).Text = '' then
      TEdit(Sender).Text := '0';

    value := StrToFloat(TEdit(Sender).Text);

    case TEdit(Sender).Tag of
      0: TEdit(Sender).Text := FormatFloat('0', value);
      1: TEdit(Sender).Text := FormatFloat('0.0', value);
      2: TEdit(Sender).Text := FormatFloat('0.00', value);
      3: TEdit(Sender).Text := FormatFloat('0.000', value);
    end;

    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryTransport.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryTransport.CheckBoxDataClick(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryTransport.ValidationFormatInput;
var
  i: Integer;
  value : Double;

begin
  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then
    begin
      if TEdit(Components[i]).Tag = 4 then
        continue;

      if TEdit(Components[i]).Text = '' then
        TEdit(Components[i]).Text := '0';

      value := StrToFloat(TEdit(Components[i]).Text);

      case TEdit(Components[i]).Tag of
        0: TEdit(Components[i]).Text := FormatFloat('0', value);
        1: TEdit(Components[i]).Text := FormatFloat('0.0', value);
        2: TEdit(Components[i]).Text := FormatFloat('0.00', value);
        3: TEdit(Components[i]).Text := FormatFloat('0.000', value);
      end;
    end;
  end;
end;

{$ENDREGION}

end.
