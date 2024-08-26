unit uElectroOpticalDetectorMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uDBAsset_Sensor;

type
  TElectroOpticalMountForm = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    imgBlindZones: TImage;
    lblClassName: TStaticText;
    edtClassName: TEdit;
    lblMountExtension: TStaticText;
    cbMountExtension: TComboBox;
    lblBlindZones: TStaticText;
    lblAntenna: TStaticText;
    edtAntenna: TEdit;
    lblFeetAntenna: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    eo : TEO_On_Board;
    procedure setdata;
    procedure getData;
  end;

var
  ElectroOpticalMountForm: TElectroOpticalMountForm;

implementation

uses
  uDataModuleTTT, uEODoublePickList;

{$R *.dfm}

procedure TElectroOpticalMountForm.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.updateEO(eo, IntToStr(eo.FData.EO_Instance_Index));
end;

procedure TElectroOpticalMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
  fEODoublePickList.FormShow(sender);
end;

procedure TElectroOpticalMountForm.btnOKClick(Sender: TObject);
begin
  getData;
  dmTTT.updateEO(eo, IntToStr(eo.FData.EO_Instance_Index));
  Close;
  fEODoublePickList.FormShow(sender);
end;

procedure TElectroOpticalMountForm.FormCreate(Sender: TObject);
begin
  eo := TEO_On_Board.Create;
end;

procedure TElectroOpticalMountForm.FormShow(Sender: TObject);
begin
  setData;
end;

procedure TElectroOpticalMountForm.setData;
begin
  with eo.FData do
  begin
    edtName.Text := Instance_Identifier;
    edtClassName.Text := Instance_Identifier;
    edtAntenna.Text := FloatToStr(Antenna_Height);
    cbMountExtension.ItemIndex := Instance_Type;
  end;

end;

procedure TElectroOpticalMountForm.getData;
begin
  with eo.FData do
  begin
    Instance_Identifier := edtName.Text;
    Instance_Type := cbMountExtension.ItemIndex;
    Antenna_Height := StrToFloat(edtAntenna.Text);
  end;
end;

end.
