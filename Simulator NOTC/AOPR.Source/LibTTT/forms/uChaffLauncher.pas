unit uChaffLauncher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uBlindZoneView;

type
  TfChaffLauncher = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    cbbLauncherKind: TComboBox;
    pnlForward: TPanel;
    lbl2: TLabel;
    bvl1: TBevel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    edtMinRange: TEdit;
    edtMaxRange: TEdit;
    edtMinElevation: TEdit;
    edtMaxElevation: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    edtForward: TEdit;
    edtAverageSpeed: TEdit;
    lbl13: TLabel;
    btnCancel: TButton;
    btnApply: TButton;
    btnOK: TButton;
    bvl2: TBevel;
    procedure btnCancelClick(Sender: TObject);
    procedure getData;
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RotWheelDegreChange(Sender: TObject);
    procedure getLauncher;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id : integer;
    rw : TBlindZoneView;
    z  : TZoneSector;
  end;

var
  fChaffLauncher: TfChaffLauncher;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehicleSelect, uVehiclePicklistFilter, uChaffAssets;

procedure TfChaffLauncher.btnApplyClick(Sender: TObject);
begin
  if fVehicleSelect.vehicle_ra then
      id :=  StrToInt(fVehicleSelect.vId)
  else
      id := StrToInt(fVehiclePicklistFilter.id_vehicle);
  if dmTTT.GetChaff_Launcher_On_Board(id,ChaffAssets.chaff_launcher) then
  begin
    getData;
    dmTTT.UpdateChaff_Launcher_On_Board(IntToStr(id),ChaffAssets.chaff_launcher);
  end
  else
  begin
    getData;
    dmTTT.InsertChaff_Launcher_On_Board(ChaffAssets.chaff_launcher);
  end;
end;

procedure TfChaffLauncher.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfChaffLauncher.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TfChaffLauncher.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlForward.DoubleBuffered := True;

  rw := TBlindZoneView.Create(self);

  rw.Parent := pnlForward;

  rw.Left   := 0;
  rw.Top    := 0;
  rw.EnableDrag := True;

  rw.Width  := pnlForward.Width;
  rw.Height := pnlForward.Height;

  rw.OnZoneChange := RotWheelDegreChange;

end;

procedure TfChaffLauncher.FormShow(Sender: TObject);
begin
  rw.ClearZone;
  getLauncher;
end;

procedure TfChaffLauncher.getLauncher;
begin
  if fVehicleSelect.vehicle_ra then
      id :=  StrToInt(fVehicleSelect.vId)
  else

      id := StrToInt(fVehiclePicklistFilter.id_vehicle);

  dmTTT.GetChaff_Launcher_On_Board(id,ChaffAssets.chaff_launcher);

  z := rw.AddZone;
  z.Degree        := ChaffAssets.chaff_launcher.FData.Launcher_Angle;
  rw.Repaint;

end;

procedure TfChaffLauncher.RotWheelDegreChange(Sender: TObject);
begin
  z := sender as TZoneSector;
  edtForward.Text := FormatFloat('000.0',z.Degree);
end;


procedure TfChaffLauncher.getData;
begin
  with ChaffAssets do begin
    with chaff_launcher.FData do begin
      Min_Range       := StrToFloat(edtMinRange.Text);
      Max_Range       := StrToFloat(edtMaxRange.Text);
      Min_Elevation   := StrToFloat(edtMinElevation.Text);
      Max_Elevation   := StrToFloat(edtMaxElevation.Text);
      Average_Launch_Spd  := StrToFloat(edtAverageSpeed.Text);
      Launcher_Kind   := cbbLauncherKind.ItemIndex;
      Launcher_Angle  := StrToFloat(edtForward.Text)

    end;
  end;
end;


end.
