unit ufrmFloatingDecoyMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Vehicle,
  uDBAsset_Countermeasure, Vcl.Imaging.pngimage;

type
  TfrmFloatingDecoyMount = class(TForm)
    pnl2ControlPage: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    edtQuantity: TEdit;
    lbl2: TLabel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    ImgBackgroundForm: TImage;
    ImgHeader: TImage;
    Label1: TLabel;
    pnl1Title: TPanel;
    txtClass: TLabel;
    edtName: TEdit;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    //Global
    function GetNumberOfKoma(s : string): Boolean;
    procedure edtNumeralKeyPress(Sender: TObject; var Key: Char);

    procedure edtChange(Sender: TObject);
    procedure ValidationFormatInput();

   
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);

  private
    FSelectedVehicle : TVehicle_Definition;
    FSelectedFloatingDecoy : TFloating_Decoy_On_Board;

    function CekInput: Boolean;
    procedure UpdateFloatingDecoyData;
  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    LastName : string;

    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;
    property SelectedFloatingDecoy : TFloating_Decoy_On_Board read FSelectedFloatingDecoy write FSelectedFloatingDecoy;
  end;

var
  frmFloatingDecoyMount: TfrmFloatingDecoyMount;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmFloatingDecoyMount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmFloatingDecoyMount.FormShow(Sender: TObject);
begin
  UpdateFloatingDecoyData;

  with FSelectedFloatingDecoy.FData do
    btnApply.Enabled := Floating_Decoy_Instance_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmFloatingDecoyMount.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmFloatingDecoyMount.btnApplyClick(Sender: TObject);
begin
  if not CekInput then
  begin
    isOK := False;
    Exit;
  end;

  ValidationFormatInput;

  with FSelectedFloatingDecoy do
  begin
    LastName := edtName.Text;
    FData.Instance_Identifier := edtName.Text;
    FData.Instance_Type := 0;
    FData.Quantity := StrToInt(edtQuantity.Text);
    FData.Vehicle_Index := FSelectedVehicle.FData.Vehicle_Index;
    FData.Floating_Decoy_Index := FFloatingDecoy_Def.Floating_Decoy_Index;

    if FData.Floating_Decoy_Instance_Index = 0 then
      dmTTT.InsertFloatingDecoyOnBoard(FData)
    else
      dmTTT.UpdateFloatingDecoyOnBoard(FData);
  end;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmFloatingDecoyMount.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

function TfrmFloatingDecoyMount.CekInput: Boolean;
begin
  Result := False;

  {Jika Mount Name sudah ada}
  if dmTTT.GetFloatingDecoyOnBoardCount(FSelectedVehicle.FData.Vehicle_Index, edtName.Text) then
  begin
    {Jika inputan baru}
    if FSelectedFloatingDecoy.FData.Floating_Decoy_Instance_Index = 0 then
    begin
      ShowMessage('Duplicate Floating Decoy!' + Char(13) + 'Choose Floating Decoy to continue.');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfrmFloatingDecoyMount.UpdateFloatingDecoyData;
begin
  with FSelectedFloatingDecoy do
  begin
    if FData.Floating_Decoy_Instance_Index = 0 then
      edtName.Text := FFloatingDecoy_Def.Floating_Decoy_Identifier
    else
      edtName.Text := FData.Instance_Identifier;

     LastName := edtName.Text;

    edtQuantity.Text := IntToStr(FData.Quantity);
  end;
end;

{$ENDREGION}

{$REGION ' Filter Input '}

function TfrmFloatingDecoyMount.GetNumberOfKoma(s: string): Boolean;
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

procedure TfrmFloatingDecoyMount.edtNumeralKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmFloatingDecoyMount.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmFloatingDecoyMount.ValidationFormatInput;
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