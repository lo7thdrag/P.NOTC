unit uRadarJammerMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,uDBAsset_Countermeasure;

type
  TRadarJammerMountForm = class(TForm)
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
    lblAntenna: TStaticText;
    edtAntenna: TEdit;
    lblFeetAntenna: TStaticText;
    procedure getData;
    procedure getMount;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    jammer : TJammer_On_Board;
  end;

var
  RadarJammerMountForm: TRadarJammerMountForm;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehicleAttributeWindow,uVehiclePicklistFilter;

procedure TRadarJammerMountForm.getMount;
begin

  with jammer.FData do begin
    edtName.Text      := Instance_Identifier;
    edtAntenna.Text   := FloatToStr(Antenna_Height);
  end;

end;

procedure TRadarJammerMountForm.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.updateJammer(jammer,IntToStr(jammer.FData.Jammer_Instance_Index));
end;

procedure TRadarJammerMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TRadarJammerMountForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TRadarJammerMountForm.FormCreate(Sender: TObject);
begin
  jammer := TJammer_On_Board.Create;
end;

procedure TRadarJammerMountForm.FormShow(Sender: TObject);
begin
  getMount;
end;

procedure TRadarJammerMountForm.getData;
begin
  with jammer.FData do begin
    Instance_Identifier   := edtName.Text;
    if fVehiclePicklistFilter.id_vehicle <> '' then
       Vehicle_Index  := StrToInt(fVehiclePicklistFilter.id_vehicle)
    else
       Vehicle_Index         := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    Jammer_Index      := Jammer_Index;
    Antenna_Height    := StrToFloat(edtAntenna.Text);
  end;

end;

end.
