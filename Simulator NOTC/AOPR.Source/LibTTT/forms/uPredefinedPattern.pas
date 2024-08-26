unit uPredefinedPattern;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBPattern, uDBAsset_Vehicle;

type
  TfPredefinedPattern = class(TForm)
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
    procedure getData;
    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure chkEventPatternClick(Sender: TObject);
    procedure btnVehicleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pattern : TPredefined_Pattern;
    isNew,fromPattern   : Boolean;
    vehicle : TVehicle_Definition;
  end;

var
  fPredefinedPattern: TfPredefinedPattern;

implementation

{$R *.dfm}

uses uDataModuleTTT, uOtherSingleList, uVehicleSelect;


procedure TfPredefinedPattern.btnApplyClick(Sender: TObject);
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
end;

procedure TfPredefinedPattern.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfPredefinedPattern.btnOkClick(Sender: TObject);
begin
  btnApplyClick(sender);
  Close;
  fOtherSingle.refresh;
end;

procedure TfPredefinedPattern.btnVehicleClick(Sender: TObject);
begin
  fromPattern := True;
  fVehicleSelect.Show;
end;

procedure TfPredefinedPattern.chkEventPatternClick(Sender: TObject);
begin
  if chkEventPattern.Checked then
  begin
    edt1.Enabled  := True;
    btnVehicle.Enabled := True;
  end
  else
  begin
    edt1.Enabled  := False;
    btnVehicle.Enabled := False;
  end;
end;

procedure TfPredefinedPattern.FormCreate(Sender: TObject);
begin
  pattern := TPredefined_Pattern.Create;
end;

procedure TfPredefinedPattern.getData;
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
