unit uChaffAssets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, uDBAsset_Vehicle, uDBAsset_Countermeasure;

type
  TChaffAssets = class(TForm)
    pnl1: TPanel;
    pgc1: TPageControl;
    tsGeneral: TTabSheet;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    lbl1: TLabel;
    btn1: TButton;
    bvl1: TBevel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtMinDelay: TEdit;
    edtMaxNumberChaff: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    bvl2: TBevel;
    bvl3: TBevel;
    bvl4: TBevel;
    bvl5: TBevel;
    bvl6: TBevel;
    bvl7: TBevel;
    chkLauncher1: TCheckBox;
    chkLauncher2: TCheckBox;
    chkLauncher3: TCheckBox;
    chkLauncher4: TCheckBox;
    btnLauncher1: TButton;
    btnLauncher2: TButton;
    btnLauncher3: TButton;
    btnLauncher4: TButton;
    chkCapable: TCheckBox;
    lbl9: TLabel;
    grpDamage: TGroupBox;
    lbl10: TLabel;
    lbl11: TLabel;
    trckbrDamage: TTrackBar;
    edtProbabilitySuccess: TEdit;
    edtTimeWeaponImpact: TEdit;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    edtDefaultRange: TEdit;
    edtDefaultAltitude: TEdit;
    lbl15: TLabel;
    lbl16: TLabel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btnLauncher1Click(Sender: TObject);
    procedure chkLauncher1Click(Sender: TObject);
    procedure chkLauncher2Click(Sender: TObject);
    procedure chkLauncher4Click(Sender: TObject);
    procedure chkLauncher3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure trckbrDamageChange(Sender: TObject);
    procedure getLauncher;
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vehicle        : TVehicle_Definition;
    chaff_launcher : TChaff_Launcher_On_Board;
    id      : integer;
  end;

var
  ChaffAssets: TChaffAssets;

implementation

{$R *.dfm}

uses uDataModuleTTT, uChaffMount, uChaffLauncher, uChaffSelect,
uVehiclePicklistFilter, uVehicleSelect;

procedure TChaffAssets.btn1Click(Sender: TObject);
begin
  if fChaffSelect.lbMissileSel.ItemIndex <> -1 then
  begin
    ChaffMountForm.chaff := fChaffSelect.csList[fChaffSelect.lbMissileSel.ItemIndex];
    ChaffMountForm.Show;
  end;

end;

procedure TChaffAssets.btnApplyClick(Sender: TObject);
begin
  if dmTTT.GetChaff_Launcher_On_Board(id,chaff_launcher) then
  begin
    with chaff_launcher.FData do begin
      Def_Bloom_Range     := StrToFloat(edtDefaultRange.Text);
      Def_Bloom_Altitude  := StrToFloat(edtDefaultAltitude.Text);
    end;
    dmTTT.UpdateChaff_Launcher_On_Board(IntToStr(id),chaff_launcher);
  end
  else
  begin
    with chaff_launcher.FData do begin
      Def_Bloom_Range     := StrToFloat(edtDefaultRange.Text);
      Def_Bloom_Altitude  := StrToFloat(edtDefaultAltitude.Text);

      if fVehicleSelect.vehicle_ra then
        Vehicle_Index     :=  StrToInt(fVehicleSelect.vId)
      else
        Vehicle_Index     := StrToInt(fVehiclePicklistFilter.id_vehicle);
    end;
    dmTTT.InsertChaff_Launcher_On_Board(chaff_launcher);
  end;

end;

procedure TChaffAssets.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TChaffAssets.btnLauncher1Click(Sender: TObject);
begin
  fChaffLauncher.Show;
end;

procedure TChaffAssets.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TChaffAssets.chkLauncher1Click(Sender: TObject);
begin
  if chkLauncher1.Checked then
    btnLauncher1.Enabled := True
  else
    btnLauncher1.Enabled := False;
end;

procedure TChaffAssets.chkLauncher2Click(Sender: TObject);
begin
  if chkLauncher2.Checked then
    btnLauncher2.Enabled := True
  else
    btnLauncher2.Enabled := False;
end;

procedure TChaffAssets.chkLauncher3Click(Sender: TObject);
begin
  if chkLauncher3.Checked then
    btnLauncher3.Enabled := True
  else
    btnLauncher3.Enabled := False;
end;

procedure TChaffAssets.chkLauncher4Click(Sender: TObject);
begin
  if chkLauncher4.Checked then
    btnLauncher4.Enabled := True
  else
    btnLauncher4.Enabled := False;
end;

procedure TChaffAssets.FormCreate(Sender: TObject);
begin
  vehicle := TVehicle_Definition.Create;
  chaff_launcher := TChaff_Launcher_On_Board.Create;
end;

procedure TChaffAssets.FormShow(Sender: TObject);
begin
  btnLauncher1.Enabled := False;
  btnLauncher2.Enabled := False;
  btnLauncher3.Enabled := False;
  btnLauncher4.Enabled := False;
  chkLauncher1.Checked := False;
  chkLauncher2.Checked := False;
  chkLauncher3.Checked := False;
  chkLauncher4.Checked := False;

  getLauncher;

end;

procedure TChaffAssets.getLauncher;
begin

  if fVehicleSelect.vehicle_ra then
    id:=  StrToInt(fVehicleSelect.vId)
  else
    id := StrToInt(fVehiclePicklistFilter.id_vehicle);

  if dmTTT.GetChaff_Launcher_On_Board(id,chaff_launcher) then
  begin
    chkLauncher1.Checked := True;
    btnLauncher1.Enabled := True;
  end;

  with chaff_launcher do begin
    with fChaffLauncher do begin
      edtMinRange.Text      := FloatToStr(FData.Min_Range);
      edtMaxRange.Text      := FloatToStr(FData.Max_Range);
      edtMinElevation.Text  := FloatToStr(FData.Min_Elevation);
      edtMaxElevation.Text  := FloatToStr(FData.Max_Elevation);
      edtAverageSpeed.Text  := FloatToStr(FData.Average_Launch_Spd);
      edtForward.Text       := FloatToStr(FData.Launcher_Angle);
      cbbLauncherKind.ItemIndex := FData.Launcher_Kind;
    end;
      edtDefaultRange.Text    := FloatToStr(FData.Def_Bloom_Range);
      edtDefaultAltitude.Text := FloatToStr(FData.Def_Bloom_Altitude);

  end;
end;


procedure TChaffAssets.trckbrDamageChange(Sender: TObject);
begin
  edtProbabilitySuccess.Text := IntToStr((sender as TTrackBar).Position);
end;

end.
