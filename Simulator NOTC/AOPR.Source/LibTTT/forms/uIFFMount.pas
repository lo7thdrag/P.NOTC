unit uIFFMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Sensor;

type
  TIFFMountForm = class(TForm)
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
    lblCapability: TStaticText;
    cbMountExtension: TComboBox;
    lblHullMounted: TStaticText;
    edtAntenna: TEdit;
    lblSubmerged: TStaticText;
    edtSubmerged: TEdit;
    lblMaxOperational: TStaticText;
    edtMaxOperational: TEdit;
    lblAntenna: TStaticText;
    lblFeetSubmerged: TStaticText;
    lblFeetMaxOperational: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iff: TIFF_Sensor_On_Board;
    procedure setData;
    procedure getData;
  end;

var
  IFFMountForm: TIFFMountForm;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

procedure TIFFMountForm.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.updateIFF(iff, IntToStr(iff.FData.IFF_Instance_Index));
end;

procedure TIFFMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TIFFMountForm.btnOKClick(Sender: TObject);
begin
  getData;
  dmTTT.updateIFF(iff, IntToStr(iff.FData.IFF_Instance_Index));
  Close;
end;

procedure TIFFMountForm.FormCreate(Sender: TObject);
begin
  iff := TIFF_Sensor_On_Board.Create;
end;

procedure TIFFMountForm.setData;
begin
  with iff.FData do
  begin
    edtName.Text := Instance_Identifier;
    edtAntenna.Text := FloatToStr(Rel_Antenna_Height);
    edtSubmerged.Text := FloatToStr(Submerged_Antenna_Height);
    edtMaxOperational.Text := FloatToStr(Max_Operational_Depth);
    cbMountExtension.ItemIndex := IFF_Capability;
  end;
end;

procedure TIFFMountForm.FormShow(Sender: TObject);
begin
  setData;
end;

procedure TIFFMountForm.getData;
begin
  with iff.FData do
  begin
    Instance_Identifier := edtName.Text;
    IFF_Capability := cbMountExtension.ItemIndex;
    Rel_Antenna_Height := StrToFloat(edtAntenna.Text);
    Submerged_Antenna_Height := StrToFloat(edtSubmerged.Text);
    Max_Operational_Depth := StrToFloat(edtMaxOperational.Text);
  end;
end;

end.
