unit ufrmSummaryPredefinedPattern;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBPattern, uDBAsset_Vehicle, uTrainingPattern, uDBAssetObject;

type
  TfrmSummaryPredefinedPattern = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtPatternName: TEdit;
    pnl2: TPanel;
    grp1: TGroupBox;
    chkEventPattern: TCheckBox;
    lbl2: TLabel;
    edt1: TEdit;
    btnVehicle: TButton;
    grp2: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    cbbType: TComboBox;
    edtHeading: TEdit;
    lbl5: TLabel;
    pnl3: TPanel;
    btnCancel: TButton;
    btnApply: TButton;
    btnOk: TButton;
    btnEditPattern: TButton;

    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure chkEventPatternClick(Sender: TObject);
    procedure btnVehicleClick(Sender: TObject);
    procedure btnEditPatternClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtHeadingKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtHeadingKeyPress(Sender: TObject; var Key: Char);
    procedure edtHeadingKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    pattern             : TPredefined_Pattern;
    isNew   : Boolean;
    vehicle             : TVehicle_Definition;

    procedure getData;
    procedure setScale;
  end;

var
  frmSummaryPredefinedPattern: TfrmSummaryPredefinedPattern;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehicleSelect,
  uPredefinedSelectListForm;


procedure TfrmSummaryPredefinedPattern.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    getData;
    dmTTT.InsertPredefined_Pattern(pattern);
    isNew := False;
  end
  else
  begin
    getData;
    dmTTT.UpdatePredefined_Pattern(IntToStr(pattern.FData.Pattern_Index),pattern);
  end;
  btnEditPattern.Enabled := true;
//  fOtherSingle.refresh;
end;

procedure TfrmSummaryPredefinedPattern.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSummaryPredefinedPattern.setScale;
var
   limitWidth      : Array[0..15] of double;
   arrayTemp       : Array[0..30] of double;
   arrayStringTemp : Array[0..30] of String;
   resultTemp      : Array[0..30] of String;
   a, b            : integer;
   widthNM         : integer;
begin
  fTrainingPattern.cbSetScale.Clear;
  widthNM := 2500;  //strtoint(ExerciseAreaForm.edtMaximum.Text);

  limitWidth[0]  := 0.125;
  limitWidth[1]  := 0.25;
  limitWidth[2]  := 0.5;
  limitWidth[3]  := 1;
  limitWidth[4]  := 2;
  limitWidth[5]  := 4;
  limitWidth[6]  := 8;
  limitWidth[7]  := 16;
  limitWidth[8]  := 32;
  limitWidth[9]  := 64;
  limitWidth[10] := 128;
  limitWidth[11] := 256;
  limitWidth[12] := 512;
  limitWidth[13] := 1024;
  limitWidth[14] := 2048;
  limitWidth[15] := 2500;

  a := 0;
  while limitWidth[a] < widthNm do
  begin
    arrayTemp[a] := limitWidth[a];
    a := a+1;
  end;
  arrayTemp[a] := widthNm;

  for b := 0 to a do
      arrayStringTemp[b] := floattostr(arrayTemp[b]);

  for b := 0 to a do
  begin
      resultTemp[b] := arrayStringTemp[b];
      fTrainingPattern.cbSetScale.Items.Add(resultTemp[b]);
  end;
end;

{procedure TfPredefinedPattern.getScriptedData;
begin

end;  }

procedure TfrmSummaryPredefinedPattern.btnEditPatternClick(Sender: TObject);
begin
  setScale;
  //getScriptedData;
  uTrainingPattern.fTrainingPattern.getPatternIndex(pattern);
  uTrainingPattern.fTrainingPattern.ShowModal;
end;

procedure TfrmSummaryPredefinedPattern.btnOkClick(Sender: TObject);
begin
  btnApplyClick(sender);
  Close;
  fPredefinedSelect.getAllData;
end;

procedure TfrmSummaryPredefinedPattern.btnVehicleClick(Sender: TObject);
begin
  fVehicleSelect.id_form := fromPattern;
  fVehicleSelect.ShowModal;
end;

procedure TfrmSummaryPredefinedPattern.chkEventPatternClick(Sender: TObject);
begin
  if chkEventPattern.Checked then
  begin
    edt1.Enabled       := True;
    btnVehicle.Enabled := True;
  end
  else
  begin
    edt1.Enabled       := False;
    btnVehicle.Enabled := False;
  end;
end;

procedure TfrmSummaryPredefinedPattern.edtHeadingKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  tmpFloat : Double;
begin


end;


procedure TfrmSummaryPredefinedPattern.edtHeadingKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtHeading.Text := FormatFloat('0.00', StrToFloat(edtHeading.Text));
end;

procedure TfrmSummaryPredefinedPattern.edtHeadingKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edtHeading.Text = '' then
    Exit;

   if (StrToFloat(edtHeading.Text) > 360)  then
    begin
      ShowMessage('Incorrect value');
      edtHeading.Text := '360';
    //  edtHeading.Text := FormatFloat('0.00', StrToFloat(edtHeading.Text));
    end;
end;

procedure TfrmSummaryPredefinedPattern.FormCreate(Sender: TObject);
begin
  pattern := TPredefined_Pattern.Create;
end;

procedure TfrmSummaryPredefinedPattern.FormShow(Sender: TObject);
begin
  if edt1.Text = '[None]' then
    fVehicleSelect.vId := ''
  else fVehicleSelect.vId := IntToStr(vehicle.FData.Vehicle_Index);
end;

procedure TfrmSummaryPredefinedPattern.getData;
begin
  with pattern.FData do
  begin
    Pattern_Identifier  := edtPatternName.Text;
    Pattern_Type        := cbbType.ItemIndex;

    if chkEventPattern.Checked then
    begin
      Pattern_Termination := 0;
    end
    else
      Pattern_Termination := 1;
    Termination_Heading   := StrToFloat(edtHeading.Text);

    if fVehicleSelect.vId <> '' then
      Vehicle_Index := StrToInt(fVehicleSelect.vId)
    else
      Vehicle_Index := Vehicle_Index;

  end;
end;


end.
