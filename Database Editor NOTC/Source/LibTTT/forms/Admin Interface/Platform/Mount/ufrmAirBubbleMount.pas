unit ufrmAirBubbleMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uDBAsset_Vehicle,
  uDBAsset_Countermeasure, Vcl.Imaging.pngimage;

type
  TfrmAirBubbleMount = class(TForm)
    pnl1Title: TPanel;
    edtName: TEdit;
    pnl2ControlPage: TPanel;
    pgc1: TPageControl;
    tsGeneral: TTabSheet;
    edtQuantity: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    ImgBackgroundForm: TImage;
    ImgHeader: TImage;
    Label1: TLabel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    //Global
    function GetNumberOfKoma(s : string): Boolean;
    procedure edtNumeralKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxDataChange(Sender: TObject);
    procedure CheckBoxDataClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure ValidationFormatInput();

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);

  private
    FSelectedVehicle : TVehicle_Definition;
    FSelectedAirBubble : TAir_Bubble_On_Board;

    function CekInput: Boolean;
    procedure UpdateAirBubbleData;
  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    LastName : string;

    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;
    property SelectedAirBubble : TAir_Bubble_On_Board read FSelectedAirBubble write FSelectedAirBubble;
  end;

var
  frmAirBubbleMount: TfrmAirBubbleMount;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAirBubbleMount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmAirBubbleMount.FormShow(Sender: TObject);
begin
  UpdateAirBubbleData;

  with FSelectedAirBubble.FData do
    btnApply.Enabled := Air_Bubble_Instance_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAirBubbleMount.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmAirBubbleMount.btnApplyClick(Sender: TObject);
begin
  if not CekInput then
  begin
    isOK := False;
    Exit;
  end;

  ValidationFormatInput;

  with FSelectedAirBubble do
  begin
    LastName := edtName.Text;
    FData.Instance_Identifier := edtName.Text;
    FData.Instance_Type := 0;
    FData.Bubble_Qty_On_Board := StrToInt(edtQuantity.Text);
    FData.Vehicle_Index := FSelectedVehicle.FData.Vehicle_Index;
    FData.Air_Bubble_Index := FAirBubble_Def.Air_Bubble_Index;

    if FData.Air_Bubble_Instance_Index = 0 then
      dmTTT.InsertAirBubbleOnBoard(FData)
    else
      dmTTT.UpdateAirBubbleOnBoard(FData);
  end;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmAirBubbleMount.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

function TfrmAirBubbleMount.CekInput: Boolean;
begin
  Result := False;

  {Jika Mount Name sudah ada}
  if dmTTT.GetAirBubbleOnBoardCount(FSelectedVehicle.FData.Vehicle_Index, edtName.Text) then
  begin
    {Jika inputan baru}
    if FSelectedAirBubble.FData.Air_Bubble_Instance_Index = 0 then
    begin
      ShowMessage('Duplicate Air Bubble!' + Char(13) + 'Choose Air Bubble Decoy to continue.');
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

procedure TfrmAirBubbleMount.UpdateAirBubbleData;
begin
  with FSelectedAirBubble do
  begin
    if FData.Air_Bubble_Instance_Index = 0 then
      edtName.Text := FAirBubble_Def.Air_Bubble_Identifier
    else
      edtName.Text := FData.Instance_Identifier;

      LastName := edtName.Text;

    edtQuantity.Text := IntToStr(FData.Bubble_Qty_On_Board);
  end;
end;

{$ENDREGION}

{$REGION ' Filter Input '}

function TfrmAirBubbleMount.GetNumberOfKoma(s: string): Boolean;
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

procedure TfrmAirBubbleMount.edtNumeralKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmAirBubbleMount.CheckBoxDataClick(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmAirBubbleMount.ComboBoxDataChange(Sender: TObject);
begin
  if TComboBox(Sender).ItemIndex = -1 then
    TComboBox(Sender).ItemIndex := 0;

  btnApply.Enabled := True;
end;

procedure TfrmAirBubbleMount.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmAirBubbleMount.ValidationFormatInput;
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
