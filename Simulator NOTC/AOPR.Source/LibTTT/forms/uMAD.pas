unit uMAD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Sensor;

type
  TMADMount = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    PageControl1: TPageControl;
    General: TTabSheet;
    lblAntenna: TStaticText;
    edtAntenna: TEdit;
    lblFeetAntenna: TStaticText;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    state : integer;
    MAD : TMAD_Sensor_On_Board;
    procedure getMADform;
  end;

Const
  isNew = 1;
  isCopy = 2;
  isEdit = 3;

var
  MADMount: TMADMount;

implementation

uses
  uVehicleAttributeWindow, uDataModuleTTT;

{$R *.dfm}

procedure TMADMount.btnApplyClick(Sender: TObject);
begin
  getMADform;
  dmTTT.updateMAD(MAD, IntToStr(MAD.FData.MAD_Instance_Index));
end;

procedure TMADMount.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMADMount.btnOKClick(Sender: TObject);
begin
  getMADform;
  dmTTT.updateMAD(MAD, IntToStr(MAD.FData.MAD_Instance_Index));
  Close;
end;

procedure TMADMount.FormCreate(Sender: TObject);
begin
  MAD := TMAD_Sensor_On_Board.Create;
end;

procedure TMADMount.FormShow(Sender: TObject);
begin
  if state = isNew then
  begin
     edtName.Text := 'noname';
     edtAntenna.Text := '0';
  end
  else if state = isEdit then
  begin
     with MAD.FData do
     begin
       Instance_Type := 0;
       Instance_Identifier := MAD.FData.Instance_Identifier;
       Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
       MAD_Index := MAD.FMAD_Def.MAD_Index;

       edtName.Text := Instance_Identifier;
       edtAntenna.Text := FloatToStr(Antenna_Height);
     end;
  end
  else if state = isCopy then
  begin
     with MAD.FData do
     begin
       Instance_Type := 0;
       Instance_Identifier := 'Copy of ' + MAD.FData.Instance_Identifier;
       Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
       MAD_Index := MAD.FMAD_Def.MAD_Index;

       edtName.Text := Instance_Identifier;
       edtAntenna.Text := FloatToStr(Antenna_Height);
     end;
  end;
end;

procedure TMADMount.getMADform;
begin
  with MAD.FData do
  begin
    Instance_Identifier := edtName.Text;
    Antenna_Height := StrToFloat(edtAntenna.Text);
  end;
end;

end.
