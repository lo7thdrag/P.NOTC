unit uRadarMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uDBAsset_Radar;

type
  TRadarMountForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    PageControl1: TPageControl;
    General: TTabSheet;
    lblClassName: TStaticText;
    edtClassName: TEdit;
    lblMountExtension: TStaticText;
    cbMountExtension: TComboBox;
    imgBlindZones: TImage;
    lblBlindZones: TStaticText;
    lblAntenna: TStaticText;
    edtAntenna: TEdit;
    lblSubmergedAntenna: TStaticText;
    edtSubmerged: TEdit;
    lblMaxOperational: TStaticText;
    edtMaxOperational: TEdit;
    lblFeetAntenna: TStaticText;
    lblFeetSubmerged: TStaticText;
    lblFeetMaxOperational: TStaticText;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    state : Integer;
    radarBoard : TRadar_On_Board;
    procedure getRadarForm;
  end;

Const
  isNew = 1;
  isCopy = 2;
  isEdit = 3;

var
  RadarMountForm: TRadarMountForm;

implementation

uses
  uDataModuleTTT, uVehicleAttributeWindow, UfRadarDoublePickList;

{$R *.dfm}

procedure TRadarMountForm.btnApplyClick(Sender: TObject);
begin
  getRadarForm;
  with radarBoard.FData do
  begin
     dmTTT.UpdateRadar_On_Board(IntToStr(Radar_Instance_Index), radarBoard);
  end;
end;

procedure TRadarMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
  fRadarDoublePickList.Show;
end;

procedure TRadarMountForm.btnOKClick(Sender: TObject);
begin
  getRadarForm;
  with radarBoard.FData do
  begin
     dmTTT.UpdateRadar_On_Board(IntToStr(Radar_Instance_Index), radarBoard);
  end;
  Close;
  fRadarDoublePickList.Show;
end;

procedure TRadarMountForm.FormCreate(Sender: TObject);
begin
  radarBoard := TRadar_On_Board.Create;
end;

procedure TRadarMountForm.FormShow(Sender: TObject);
begin
  if state = isNew then
  begin
     edtName.Text := 'noname';
     edtClassName.Text := '';
     edtAntenna.Text := '0';
     edtSubmerged.Text := '0';
     edtMaxOperational.Text := '0';
  end
  else if state = isCopy then
  begin
     with radarBoard.FData do
     begin
       Instance_Identifier := radarBoard.FDef.Radar_Identifier;
       Radar_Index := radarBoard.FDef.Radar_Index;
       Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
       Instance_Type := radarBoard.FDef.Radar_Type;

       edtName.Text := 'Copy Of' + Instance_Identifier;
       edtClassName.Text := radarBoard.FDef.Radar_Identifier;
       edtAntenna.Text := '0';
       edtSubmerged.Text := '0';
       edtMaxOperational.Text := '0';
       cbMountExtension.ItemIndex := Instance_Type;
     end;

  end
  else if state = isEdit then
  begin
     with radarBoard.FData do
     begin
       Instance_Identifier := radarBoard.FDef.Radar_Identifier;
       Radar_Index := radarBoard.FDef.Radar_Index;
       Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
       Instance_Type := radarBoard.FDef.Radar_Type;

       cbMountExtension.ItemIndex := Instance_Type;
       edtName.Text := Instance_Identifier;
       edtClassName.Text := Instance_Identifier;
       edtAntenna.Text := FloatToStr(Rel_Antenna_Height);
       edtSubmerged.Text := FloatToStr(Submerged_Antenna_Height);
       edtMaxOperational.Text := FloatToStr(Max_Operational_Depth);
     end;
  end;

end;

procedure TRadarMountForm.getRadarForm;
begin
   with radarBoard.FData do
   begin
     Instance_Identifier := edtName.Text;
     Instance_Type := cbMountExtension.ItemIndex;
     Rel_Antenna_Height := StrToFloat(edtAntenna.Text);
     Submerged_Antenna_Height := StrToFloat(edtSubmerged.Text);
     Max_Operational_Depth := StrToFloat(edtMaxOperational.Text);
   end;
end;

end.
