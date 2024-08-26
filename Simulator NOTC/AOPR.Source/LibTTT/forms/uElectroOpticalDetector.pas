unit uElectroOpticalDetector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uDBAsset_Sensor;

type
  TElectroOpticalForm = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    edtClass: TEdit;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    pgc1: TPageControl;
    General: TTabSheet;
    lblClassName: TStaticText;
    lblMountExtension: TStaticText;
    lblBlindZones: TStaticText;
    lblAntenna: TStaticText;
    edtMaxPossible: TEdit;
    lblFeetAntenna: TStaticText;
    ts1: TTabSheet;
    txt1: TStaticText;
    txt2: TStaticText;
    txt3: TStaticText;
    txt4: TStaticText;
    edtAssociatedCross: TEdit;
    edtDetectionRange: TEdit;
    txt5: TStaticText;
    txt6: TStaticText;
    mmNotes: TMemo;
    cbbSensorType: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    procedure getData;
    procedure setData;
  public
    { Public declarations }
    EOObject    : TEO_On_Board;
    isNew,isCopy, isEdit : Boolean;

  end;

var
  ElectroOpticalForm: TElectroOpticalForm;

implementation

{$R *.dfm}

uses uDataModuleTTT,uEOPicklist;

procedure TElectroOpticalForm.getData;
begin

  with EOObject.FEO_Def do begin
    Class_Identifier    := edtClass.Text;
    Max_Range           := StrToFloat(edtMaxPossible.Text);
    Known_Cross_Section := StrToFloat(edtAssociatedCross.Text);
    Detection_Range     := StrToFloat(edtDetectionRange.Text);

    if cbbSensorType.Text = 'EO Sensor(Optical)' then
      Sensor_Type := 0
    else if cbbSensorType.Text = 'Laser Sensor' then
      Sensor_Type := 1
    else
      Sensor_Type := 2;

    EOObject.FNote.Notes := mmNotes.Lines.Text;
  end;
end;

procedure TElectroOpticalForm.setData;
begin
  with EOObject.FEO_Def do
  begin
    edtClass.Text := Class_Identifier;
    edtDetectionRange.Text := FloatToStr(Detection_Range);
    edtMaxPossible.Text := FloatToStr(Max_Range);
    edtAssociatedCross.Text := FloatToStr(Known_Cross_Section);
    cbbSensorType.ItemIndex := Sensor_Type;
  end;
end;

procedure TElectroOpticalForm.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    getData;
    dmTTT.insertEO_Def(EOObject);
    isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateEO_Def(EOObject,IntToStr(EOObject.FEO_Def.EO_Index));
  end;
end;

procedure TElectroOpticalForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TElectroOpticalForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fEO.getEO;
end;

procedure TElectroOpticalForm.FormCreate(Sender: TObject);
begin
  EOObject := TEO_On_Board.Create;
end;

procedure TElectroOpticalForm.FormShow(Sender: TObject);
begin
  if isNew then
  begin
    edtClass.Text := '';
    edtMaxPossible.Text := '';
    edtAssociatedCross.Text := '';
    edtDetectionRange.Text := '';
    cbbSensorType.ItemIndex := 0;
  end
  else if isCopy then
  begin
    setData;
    edtClass.Text := 'Copy Of ' + EOObject.FEO_Def.Class_Identifier;
  end
  else if isEdit then
  begin
    setData;
  end;
end;

end.
