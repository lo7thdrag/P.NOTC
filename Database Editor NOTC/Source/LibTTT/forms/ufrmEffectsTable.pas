unit ufrmEffectsTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uDBAssetObject, Grids, DBGrids, DB,
  {DBTables,} ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset,
  newClassASTT, tttData, uDBGame_Defaults;

type
  TfrmEffectsTable = class(TForm)
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    strGrdEffectTable: TStringGrid;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure strgrdEffectTableSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure edtInputKeyPress(Sender: TObject; var Key: Char);
    procedure edtInputExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    FEffectType : E_EffectType;
    FSelectedGameDefault : TGame_Defaults;

    FEffectList : TList;
    FSelectedColumn : Integer;
    FSelectedRow : Integer;

    procedure UpdateEffectTableData;
    procedure UpdateRainfallEffectOnRadar;
    procedure UpdateCloudEffectOnRadar;
    procedure UpdateSeaStateEffectOnRadar;
    procedure UpdateRainfallEffectOnESM;
    procedure UpdateCloudEffectOnESM;
    procedure UpdateRainfallEffectOnMissile;
    procedure UpdateSeaStateEffectOnMissile;
    procedure UpdateRainfallEffectOnSonar;
    procedure UpdateShipNoiseEffectOnSonar;
    procedure UpdateSeaStateEffectOnSonar;
  public
    property EffectType : E_EffectType read FEffectType write FEffectType;
    property SelectedGameDefault : TGame_Defaults read FSelectedGameDefault
      write FSelectedGameDefault;
  end;

var
  frmEffectsTable: TfrmEffectsTable;

implementation

{$R *.dfm}
uses
  uDataModuleTTT, ufrmSummaryGameDefaults;

procedure TfrmEffectsTable.btnApplyClick(Sender: TObject);
var
  i : Integer;
  rainfallOnRadar : TGame_Rainfall_On_Radar;
  cloudOnRadar : TGame_Cloud_On_Radar;
  seastateOnRadar : TGame_Sea_On_Radar;
  rainfallOnESM : TGame_Rainfall_On_ESM;
  cloudOnESM : TGame_Cloud_On_ESM;
  rainfallOnMissile : TGame_Rainfall_On_Missile_Seeker;
  seastateOnMissile : TGame_Sea_On_Missile_Safe_Altitude;
  rainfallOnSonar : TGame_Rainfall_On_Sonar;
  shipnoiseOnSonar : TGame_Ship_On_Sonar;
  seastateOnSonar : TGame_Sea_On_Sonar;
begin
  case FEffectType of
    etRadarRainfallRate:
    begin
      for i := 1 to strgrdEffectTable.RowCount - 1 do
      begin
        rainfallOnRadar := FEffectList.Items[i - 1];

        with rainfallOnRadar do
        begin
          FData.Rain_0_Effect := StrToFloat(strgrdEffectTable.Cells[1, i]);
          FData.Rain_1_Effect := StrToFloat(strgrdEffectTable.Cells[2, i]);
          FData.Rain_2_Effect := StrToFloat(strgrdEffectTable.Cells[3, i]);
          FData.Rain_3_Effect := StrToFloat(strgrdEffectTable.Cells[4, i]);
          FData.Rain_4_Effect := StrToFloat(strgrdEffectTable.Cells[5, i]);
          FData.Rain_5_Effect := StrToFloat(strgrdEffectTable.Cells[6, i]);
          FData.Rain_6_Effect := StrToFloat(strgrdEffectTable.Cells[7, i]);

          dmTTT.UpdateGameRainfallOnRadar(FData);
        end;
      end;
    end;
    etRadarCloudCover:
    begin
      for i := 1 to strgrdEffectTable.RowCount - 1 do
      begin
        cloudOnRadar := FEffectList.Items[i - 1];

        with cloudOnRadar do
        begin
          FData.Cloud_0_Effect := StrToFloat(strgrdEffectTable.Cells[1, i]);
          FData.Cloud_1_Effect := StrToFloat(strgrdEffectTable.Cells[2, i]);
          FData.Cloud_2_Effect := StrToFloat(strgrdEffectTable.Cells[3, i]);
          FData.Cloud_3_Effect := StrToFloat(strgrdEffectTable.Cells[4, i]);
          FData.Cloud_4_Effect := StrToFloat(strgrdEffectTable.Cells[5, i]);
          FData.Cloud_5_Effect := StrToFloat(strgrdEffectTable.Cells[6, i]);
          FData.Cloud_6_Effect := StrToFloat(strgrdEffectTable.Cells[7, i]);

          dmTTT.UpdateGameCloudOnRadar(FData);
        end;
      end;
    end;
    etRadarSeaState:
    begin
      for i := 1 to strgrdEffectTable.ColCount - 1 do
      begin
        seastateOnRadar := FEffectList.Items[i - 1];

        with seastateOnRadar do
        begin
          FData.Effect_on_Radar := StrToFloat(strgrdEffectTable.Cells[i, 1]);

          dmTTT.UpdateGameSeaStateOnRadar(FData);
        end;
      end;
    end;
    etESMRainfallRate:
    begin
      for i := 1 to strgrdEffectTable.RowCount - 1 do
      begin
        rainfallOnESM := FEffectList.Items[i - 1];

        with rainfallOnESM do
        begin
          FData.Rain_0_Effect := StrToFloat(strgrdEffectTable.Cells[1, i]);
          FData.Rain_1_Effect := StrToFloat(strgrdEffectTable.Cells[2, i]);
          FData.Rain_2_Effect := StrToFloat(strgrdEffectTable.Cells[3, i]);
          FData.Rain_3_Effect := StrToFloat(strgrdEffectTable.Cells[4, i]);
          FData.Rain_4_Effect := StrToFloat(strgrdEffectTable.Cells[5, i]);
          FData.Rain_5_Effect := StrToFloat(strgrdEffectTable.Cells[6, i]);
          FData.Rain_6_Effect := StrToFloat(strgrdEffectTable.Cells[7, i]);

          dmTTT.UpdateGameRainfallOnESM(FData);
        end;
      end;
    end;
    etESMCloudCover:
    begin
      for i := 1 to strgrdEffectTable.RowCount - 1 do
      begin
        cloudOnESM := FEffectList.Items[i - 1];

        with cloudOnESM do
        begin
          FData.Cloud_0_Effect := StrToFloat(strgrdEffectTable.Cells[1, i]);
          FData.Cloud_1_Effect := StrToFloat(strgrdEffectTable.Cells[2, i]);
          FData.Cloud_2_Effect := StrToFloat(strgrdEffectTable.Cells[3, i]);
          FData.Cloud_3_Effect := StrToFloat(strgrdEffectTable.Cells[4, i]);
          FData.Cloud_4_Effect := StrToFloat(strgrdEffectTable.Cells[5, i]);
          FData.Cloud_5_Effect := StrToFloat(strgrdEffectTable.Cells[6, i]);
          FData.Cloud_6_Effect := StrToFloat(strgrdEffectTable.Cells[7, i]);

          dmTTT.UpdateGameCloudOnESM(FData);
        end;
      end;
    end;
    etMissileRainfallRate:
    begin
      for i := 1 to strgrdEffectTable.RowCount - 1 do
      begin
        rainfallOnMissile := FEffectList.Items[i - 1];

        with rainfallOnMissile do
        begin
          FData.Rain_0_Effect := StrToFloat(strgrdEffectTable.Cells[1, i]);
          FData.Rain_1_Effect := StrToFloat(strgrdEffectTable.Cells[2, i]);
          FData.Rain_2_Effect := StrToFloat(strgrdEffectTable.Cells[3, i]);
          FData.Rain_3_Effect := StrToFloat(strgrdEffectTable.Cells[4, i]);
          FData.Rain_4_Effect := StrToFloat(strgrdEffectTable.Cells[5, i]);
          FData.Rain_5_Effect := StrToFloat(strgrdEffectTable.Cells[6, i]);
          FData.Rain_6_Effect := StrToFloat(strgrdEffectTable.Cells[7, i]);

          dmTTT.UpdateGameRainfallOnMissile(FData);
        end;
      end;
    end;
    etMissileSeaState:
    begin
      for i := 1 to strgrdEffectTable.ColCount - 1 do
      begin
        seastateOnMissile := FEffectList.Items[i - 1];

        with seastateOnMissile do
        begin
          FData.Effect_on_Missile_Safe_Altitude :=
            StrToFloat(strgrdEffectTable.Cells[i, 1]);

          dmTTT.UpdateGameSeaStateOnMissile(FData);
        end;
      end;
    end;
    etAmbientNoiseRainfallRate:
    begin
      for i := 1 to strgrdEffectTable.RowCount - 1 do
      begin
        rainfallOnSonar := FEffectList.Items[i - 1];

        with rainfallOnSonar do
        begin
          FData.Rain_0_Effect := StrToFloat(strgrdEffectTable.Cells[1, i]);
          FData.Rain_1_Effect := StrToFloat(strgrdEffectTable.Cells[2, i]);
          FData.Rain_2_Effect := StrToFloat(strgrdEffectTable.Cells[3, i]);
          FData.Rain_3_Effect := StrToFloat(strgrdEffectTable.Cells[4, i]);
          FData.Rain_4_Effect := StrToFloat(strgrdEffectTable.Cells[5, i]);
          FData.Rain_5_Effect := StrToFloat(strgrdEffectTable.Cells[6, i]);
          FData.Rain_6_Effect := StrToFloat(strgrdEffectTable.Cells[7, i]);

          dmTTT.UpdateGameRainfallOnSonar(FData);
        end;
      end;
    end;
    etAmbientNoiseShippingNoise:
    begin
      for i := 1 to strgrdEffectTable.RowCount - 1 do
      begin
        shipnoiseOnSonar := FEffectList.Items[i - 1];

        with shipnoiseOnSonar do
        begin
          FData.Distant_Ship_Effect := StrToFloat(strgrdEffectTable.Cells[1, i]);
          FData.Light_Ship_Effect := StrToFloat(strgrdEffectTable.Cells[2, i]);
          FData.Medium_Ship_Effect := StrToFloat(strgrdEffectTable.Cells[3, i]);
          FData.Heavy_Ship_Effect := StrToFloat(strgrdEffectTable.Cells[4, i]);

          dmTTT.UpdateGameShipNoiseOnSonar(FData);
        end;
      end;
    end;
    etAmbientNoiseSeaState:
    begin
      for i := 1 to strgrdEffectTable.RowCount - 1 do
      begin
        seastateOnSonar := FEffectList.Items[i - 1];

        with seastateOnSonar do
        begin
          FData.Sea_0_Effect := StrToFloat(strgrdEffectTable.Cells[1, i]);
          FData.Sea_1_Effect := StrToFloat(strgrdEffectTable.Cells[2, i]);
          FData.Sea_2_Effect := StrToFloat(strgrdEffectTable.Cells[3, i]);
          FData.Sea_3_Effect := StrToFloat(strgrdEffectTable.Cells[4, i]);
          FData.Sea_4_Effect := StrToFloat(strgrdEffectTable.Cells[5, i]);
          FData.Sea_5_Effect := StrToFloat(strgrdEffectTable.Cells[6, i]);
          FData.Sea_6_Effect := StrToFloat(strgrdEffectTable.Cells[7, i]);
          FData.Sea_7_Effect := StrToFloat(strgrdEffectTable.Cells[8, i]);
          FData.Sea_8_Effect := StrToFloat(strgrdEffectTable.Cells[9, i]);
          FData.Sea_9_Effect := StrToFloat(strgrdEffectTable.Cells[10, i]);

          dmTTT.UpdateGameSeaStateOnSonar(FData);
        end;
      end;
    end;
  end;

  btnApply.Enabled := False;
end;

procedure TfrmEffectsTable.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEffectsTable.btnOkClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  Close;
end;

procedure TfrmEffectsTable.edtInputExit(Sender: TObject);
begin
//  edtInput.Visible := False;
end;

procedure TfrmEffectsTable.edtInputKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in [#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if Key = #13 then
  begin
//    value := StrToFloat(edtInput.Text);
    strgrdEffectTable.Cells[FSelectedColumn, FSelectedRow] :=
      FormatFloat('0.00', value);
//    edtInput.Visible := False;
    btnApply.Enabled := True;
  end;
end;

procedure TfrmEffectsTable.FormCreate(Sender: TObject);
begin
  FEffectList := TList.Create;
end;

procedure TfrmEffectsTable.FormShow(Sender: TObject);
begin
  case FEffectType of
    etRadarRainfallRate:
    begin
      Caption := 'Rainfall Rate Effect on Radar (dB/km)';
    end;
    etRadarCloudCover:
    begin
      Caption := 'Cloud Cover Effect on Radar (dB/km)';
    end;
    etRadarSeaState:
    begin
      Caption := 'Sea State Effect on Radar (dB)';
    end;
    etESMRainfallRate:
    begin
      Caption := 'Rainfall Rate Effect on ESM (%)';
    end;
    etESMCloudCover:
    begin
      Caption := 'Cloud Cover Effect on ESM (%)';
    end;
    etMissileRainfallRate:
    begin
      Caption := 'Rain Rate Effect on Missile Seeker (%)';
    end;
    etMissileSeaState:
    begin
      Caption := 'Sea State Effect on Missile Safe Altitude (ft)';
    end;
    etAmbientNoiseRainfallRate:
    begin
      Caption := 'Rainfall Rate Effect on Sonar (dB)';
    end;
    etAmbientNoiseShippingNoise:
    begin
      Caption := 'Shipping Noise Effect on Sonar (dB)';
    end;
    etAmbientNoiseSeaState:
    begin
      Caption := 'Sea State Effect on Sonar (dB)';
    end;
  end;

  UpdateEffectTableData;
  btnApply.Enabled := False;
end;

procedure TfrmEffectsTable.strgrdEffectTableSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
  rect : TRect;
begin
  FSelectedColumn := ACol;
  FSelectedRow := ARow;

//  with edtInput do
//  begin
//    rect := strgrdEffectTable.CellRect(FSelectedColumn, FSelectedRow);
//    Left := rect.Left + 11;
//    Top := rect.Top + 11;
//    Height := rect.Bottom - rect.top;
//    Width := rect.Right - rect.Left;
//
//    Text := strgrdEffectTable.Cells[FSelectedColumn, FSelectedRow];
//    Visible := True;
//  end;
end;

procedure TfrmEffectsTable.UpdateCloudEffectOnESM;
var
  i : Integer;
  cloudOnESM : TGame_Cloud_On_ESM;
begin
  with strgrdEffectTable do
  begin
    ColCount := 8;
    RowCount := 11;
    ColWidths[0] := 120;

    Cells[0, 0] := 'Frequency (GHz)';
    Cells[1, 0] := 'None';
    Cells[2, 0] := '1';
    Cells[3, 0] := '2';
    Cells[4, 0] := '3';
    Cells[5, 0] := '4';
    Cells[6, 0] := '5';
    Cells[7, 0] := 'High';
  end;

  dmTTT.GetGameCloudOnESM(FSelectedGameDefault.FData.Defaults_Index,
    FEffectList);

  for i := 0 to FEffectList.Count - 1 do
  begin
    cloudOnESM := FEffectList.Items[i];

    with cloudOnESM.FData do
    begin
      strgrdEffectTable.Cells[0, i + 1] := FormatFloat('0.0', Radar_Frequency);
      strgrdEffectTable.Cells[1, i + 1] := FormatFloat('0.00', Cloud_0_Effect);
      strgrdEffectTable.Cells[2, i + 1] := FormatFloat('0.00', Cloud_1_Effect);
      strgrdEffectTable.Cells[3, i + 1] := FormatFloat('0.00', Cloud_2_Effect);
      strgrdEffectTable.Cells[4, i + 1] := FormatFloat('0.00', Cloud_3_Effect);
      strgrdEffectTable.Cells[5, i + 1] := FormatFloat('0.00', Cloud_4_Effect);
      strgrdEffectTable.Cells[6, i + 1] := FormatFloat('0.00', Cloud_5_Effect);
      strgrdEffectTable.Cells[7, i + 1] := FormatFloat('0.00', Cloud_6_Effect);
    end;
  end;
end;

procedure TfrmEffectsTable.UpdateCloudEffectOnRadar;
var
  i : Integer;
  cloudOnRadar : TGame_Cloud_On_Radar;
begin
  with strgrdEffectTable do
  begin
    ColCount := 8;
    RowCount := 11;
    ColWidths[0] := 120;

    Cells[0, 0] := 'Frequency (GHz)';
    Cells[1, 0] := 'None';
    Cells[2, 0] := '1';
    Cells[3, 0] := '2';
    Cells[4, 0] := '3';
    Cells[5, 0] := '4';
    Cells[6, 0] := '5';
    Cells[7, 0] := 'High';
  end;

  dmTTT.GetGameCloudOnRadar(FSelectedGameDefault.FData.Defaults_Index,
    FEffectList);

  for i := 0 to FEffectList.Count - 1 do
  begin
    cloudOnRadar := FEffectList.Items[i];

    with cloudOnRadar.FData do
    begin
      strgrdEffectTable.Cells[0, i + 1] := FormatFloat('0.0', Radar_Frequency);
      strgrdEffectTable.Cells[1, i + 1] := FormatFloat('0.00', Cloud_0_Effect);
      strgrdEffectTable.Cells[2, i + 1] := FormatFloat('0.00', Cloud_1_Effect);
      strgrdEffectTable.Cells[3, i + 1] := FormatFloat('0.00', Cloud_2_Effect);
      strgrdEffectTable.Cells[4, i + 1] := FormatFloat('0.00', Cloud_3_Effect);
      strgrdEffectTable.Cells[5, i + 1] := FormatFloat('0.00', Cloud_4_Effect);
      strgrdEffectTable.Cells[6, i + 1] := FormatFloat('0.00', Cloud_5_Effect);
      strgrdEffectTable.Cells[7, i + 1] := FormatFloat('0.00', Cloud_6_Effect);
    end;
  end;
end;

procedure TfrmEffectsTable.UpdateEffectTableData;
begin
  case FEffectType of
    etRadarRainfallRate: UpdateRainfallEffectOnRadar;
    etRadarCloudCover: UpdateCloudEffectOnRadar;
    etRadarSeaState: UpdateSeaStateEffectOnRadar;
    etESMRainfallRate: UpdateRainfallEffectOnESM;
    etESMCloudCover: UpdateCloudEffectOnESM;
    etMissileRainfallRate: UpdateRainfallEffectOnMissile;
    etMissileSeaState: UpdateSeaStateEffectOnMissile;
    etAmbientNoiseRainfallRate: UpdateRainfallEffectOnSonar;
    etAmbientNoiseShippingNoise: UpdateShipNoiseEffectOnSonar;
    etAmbientNoiseSeaState: UpdateSeaStateEffectOnSonar;
  end;
end;

procedure TfrmEffectsTable.UpdateRainfallEffectOnESM;
var
  i : Integer;
  rainfallOnESM : TGame_Rainfall_On_ESM;
begin
  with strgrdEffectTable do
  begin
    ColCount := 8;
    RowCount := 11;
    ColWidths[0] := 120;

    Cells[0, 0] := 'Frequency (GHz)';
    Cells[1, 0] := 'None';
    Cells[2, 0] := '1';
    Cells[3, 0] := '2';
    Cells[4, 0] := '3';
    Cells[5, 0] := '4';
    Cells[6, 0] := '5';
    Cells[7, 0] := 'Heavy';
  end;

  dmTTT.GetGameRainfallOnESM(FSelectedGameDefault.FData.Defaults_Index,
    FEffectList);

  for i := 0 to FEffectList.Count - 1 do
  begin
    rainfallOnESM := FEffectList.Items[i];

    with rainfallOnESM.FData do
    begin
      strgrdEffectTable.Cells[0, i + 1] := FormatFloat('0.0',
        Radar_Frequency);
      strgrdEffectTable.Cells[1, i + 1] := FormatFloat('0.00', Rain_0_Effect);
      strgrdEffectTable.Cells[2, i + 1] := FormatFloat('0.00', Rain_1_Effect);
      strgrdEffectTable.Cells[3, i + 1] := FormatFloat('0.00', Rain_2_Effect);
      strgrdEffectTable.Cells[4, i + 1] := FormatFloat('0.00', Rain_3_Effect);
      strgrdEffectTable.Cells[5, i + 1] := FormatFloat('0.00', Rain_4_Effect);
      strgrdEffectTable.Cells[6, i + 1] := FormatFloat('0.00', Rain_5_Effect);
      strgrdEffectTable.Cells[7, i + 1] := FormatFloat('0.00', Rain_6_Effect);
    end;
  end;
end;

procedure TfrmEffectsTable.UpdateRainfallEffectOnMissile;
var
  i : Integer;
  rainfallOnMissile : TGame_Rainfall_On_Missile_Seeker;
begin
  with strgrdEffectTable do
  begin
    ColCount := 8;
    RowCount := 4;
    ColWidths[0] := 150;

    Cells[0, 0] := 'Guide Type';
    Cells[1, 0] := 'None';
    Cells[2, 0] := '1';
    Cells[3, 0] := '2';
    Cells[4, 0] := '3';
    Cells[5, 0] := '4';
    Cells[6, 0] := '5';
    Cells[7, 0] := 'Heavy';

    Cells[0, 1] := 'Semi-Active Radar Homing';
    Cells[0, 2] := 'Terminal-Active Radar Homing';
    Cells[0, 3] := 'Infrared Homing';
    Cells[0, 4] := 'Anti-Radiation';
    Cells[0, 5] := 'Straight';
    Cells[0, 6] := 'Hybrid';
  end;

  dmTTT.GetGameRainfallOnMissile(FSelectedGameDefault.FData.Defaults_Index,
    FEffectList);

  for i := 0 to FEffectList.Count - 1 do
  begin
    rainfallOnMissile := FEffectList.Items[i];

    with rainfallOnMissile.FData do
    begin
      strgrdEffectTable.Cells[1, i + 1] := FormatFloat('0.00', Rain_0_Effect);
      strgrdEffectTable.Cells[2, i + 1] := FormatFloat('0.00', Rain_1_Effect);
      strgrdEffectTable.Cells[3, i + 1] := FormatFloat('0.00', Rain_2_Effect);
      strgrdEffectTable.Cells[4, i + 1] := FormatFloat('0.00', Rain_3_Effect);
      strgrdEffectTable.Cells[5, i + 1] := FormatFloat('0.00', Rain_4_Effect);
      strgrdEffectTable.Cells[6, i + 1] := FormatFloat('0.00', Rain_5_Effect);
      strgrdEffectTable.Cells[7, i + 1] := FormatFloat('0.00', Rain_6_Effect);
    end;
  end;
end;

procedure TfrmEffectsTable.UpdateRainfallEffectOnRadar;
var
  i : Integer;
  rainfallOnRadar : TGame_Rainfall_On_Radar;
begin
  with strgrdEffectTable do
  begin
    ColCount := 8;
    RowCount := 11;
    ColWidths[0] := 120;

    Cells[0, 0] := 'Frequency (GHz)';
    Cells[1, 0] := 'None';
    Cells[2, 0] := '1';
    Cells[3, 0] := '2';
    Cells[4, 0] := '3';
    Cells[5, 0] := '4';
    Cells[6, 0] := '5';
    Cells[7, 0] := 'Heavy';
  end;

  dmTTT.GetGameRainfallOnRadar(FSelectedGameDefault.FData.Defaults_Index,
    FEffectList);

  for i := 0 to FEffectList.Count - 1 do
  begin
    rainfallOnRadar := FEffectList.Items[i];

    with rainfallOnRadar.FData do
    begin
      strgrdEffectTable.Cells[0, i + 1] := FormatFloat('0.0',
        Radar_Frequency);
      strgrdEffectTable.Cells[1, i + 1] := FormatFloat('0.00', Rain_0_Effect);
      strgrdEffectTable.Cells[2, i + 1] := FormatFloat('0.00', Rain_1_Effect);
      strgrdEffectTable.Cells[3, i + 1] := FormatFloat('0.00', Rain_2_Effect);
      strgrdEffectTable.Cells[4, i + 1] := FormatFloat('0.00', Rain_3_Effect);
      strgrdEffectTable.Cells[5, i + 1] := FormatFloat('0.00', Rain_4_Effect);
      strgrdEffectTable.Cells[6, i + 1] := FormatFloat('0.00', Rain_5_Effect);
      strgrdEffectTable.Cells[7, i + 1] := FormatFloat('0.00', Rain_6_Effect);
    end;
  end;
end;

procedure TfrmEffectsTable.UpdateRainfallEffectOnSonar;
var
  i : Integer;
  rainfallOnSonar : TGame_Rainfall_On_Sonar;
begin
  with strgrdEffectTable do
  begin
    ColCount := 8;
    RowCount := 12;
    ColWidths[0] := 120;

    Cells[0, 0] := 'Frequency (kHz)';
    Cells[1, 0] := 'None';
    Cells[2, 0] := '1';
    Cells[3, 0] := '2';
    Cells[4, 0] := '3';
    Cells[5, 0] := '4';
    Cells[6, 0] := '5';
    Cells[7, 0] := 'Heavy';
  end;

  dmTTT.GetGameRainfallOnSonar(FSelectedGameDefault.FData.Defaults_Index,
    FEffectList);

  for i := 0 to FEffectList.Count - 1 do
  begin
    rainfallOnSonar := FEffectList.Items[i];

    with rainfallOnSonar.FData do
    begin
      strgrdEffectTable.Cells[0, i + 1] := FormatFloat('0.0',
        Sonar_Frequency);
      strgrdEffectTable.Cells[1, i + 1] := FormatFloat('0.00', Rain_0_Effect);
      strgrdEffectTable.Cells[2, i + 1] := FormatFloat('0.00', Rain_1_Effect);
      strgrdEffectTable.Cells[3, i + 1] := FormatFloat('0.00', Rain_2_Effect);
      strgrdEffectTable.Cells[4, i + 1] := FormatFloat('0.00', Rain_3_Effect);
      strgrdEffectTable.Cells[5, i + 1] := FormatFloat('0.00', Rain_4_Effect);
      strgrdEffectTable.Cells[6, i + 1] := FormatFloat('0.00', Rain_5_Effect);
      strgrdEffectTable.Cells[7, i + 1] := FormatFloat('0.00', Rain_6_Effect);
    end;
  end;
end;

procedure TfrmEffectsTable.UpdateSeaStateEffectOnMissile;
var
  i : Integer;
  seastateOnMissile : TGame_Sea_On_Missile_Safe_Altitude;
begin
  with strgrdEffectTable do
  begin
    ColCount := 11;
    RowCount := 2;
    ColWidths[0] := 120;

    Cells[0, 0] := '';
    Cells[1, 0] := 'Still';
    Cells[2, 0] := '1';
    Cells[3, 0] := '2';
    Cells[4, 0] := '3';
    Cells[5, 0] := '4';
    Cells[6, 0] := '5';
    Cells[7, 0] := '6';
    Cells[8, 0] := '7';
    Cells[9, 0] := '8';
    Cells[10, 0] := 'Heavy';

    Cells[0, 1] := '';
  end;

  dmTTT.GetGameSeaStateOnMissile(FSelectedGameDefault.FData.Defaults_Index,
    FEffectList);

  for i := 0 to FEffectList.Count - 1 do
  begin
    seastateOnMissile := FEffectList.Items[i];

    with seastateOnMissile.FData do
    begin
      strgrdEffectTable.Cells[Sea_State + 1, 1] := FormatFloat('0.00',
        Effect_on_Missile_Safe_Altitude);
    end;
  end;
end;

procedure TfrmEffectsTable.UpdateSeaStateEffectOnRadar;
var
  i : Integer;
  seastateOnRadar : TGame_Sea_On_Radar;
begin
  with strgrdEffectTable do
  begin
    ColCount := 11;
    RowCount := 2;
    ColWidths[0] := 120;

    Cells[0, 0] := '';
    Cells[1, 0] := 'Still';
    Cells[2, 0] := '1';
    Cells[3, 0] := '2';
    Cells[4, 0] := '3';
    Cells[5, 0] := '4';
    Cells[6, 0] := '5';
    Cells[7, 0] := '6';
    Cells[8, 0] := '7';
    Cells[9, 0] := '8';
    Cells[10, 0] := 'Heavy';

    Cells[0, 1] := '';
  end;

  dmTTT.GetGameSeaStateOnRadar(FSelectedGameDefault.FData.Defaults_Index,
    FEffectList);

  for i := 0 to FEffectList.Count - 1 do
  begin
    seastateOnRadar := FEffectList.Items[i];

    with seastateOnRadar.FData do
    begin
      strgrdEffectTable.Cells[Sea_State + 1, 1] := FormatFloat('0.00',
        Effect_on_Radar);
    end;
  end;
end;

procedure TfrmEffectsTable.UpdateSeaStateEffectOnSonar;
var
  i : Integer;
  seastateOnSonar : TGame_Sea_On_Sonar;
begin
  with strgrdEffectTable do
  begin
    ColCount := 11;
    RowCount := 17;
    ColWidths[0] := 120;

    Cells[0, 0] := 'Frequency (kHz)';
    Cells[1, 0] := 'Still';
    Cells[2, 0] := '1';
    Cells[3, 0] := '2';
    Cells[4, 0] := '3';
    Cells[5, 0] := '4';
    Cells[6, 0] := '5';
    Cells[7, 0] := '6';
    Cells[8, 0] := '7';
    Cells[9, 0] := '8';
    Cells[10, 0] := 'Heavy';
  end;

  dmTTT.GetGameSeaStateOnSonar(FSelectedGameDefault.FData.Defaults_Index,
    FEffectList);

  for i := 0 to FEffectList.Count - 1 do
  begin
    seastateOnSonar := FEffectList.Items[i];

    with seastateOnSonar.FData do
    begin
      strgrdEffectTable.Cells[0, i + 1] := FormatFloat('0.0', Sonar_Frequency);
      strgrdEffectTable.Cells[1, i + 1] := FormatFloat('0.00', Sea_0_Effect);
      strgrdEffectTable.Cells[2, i + 1] := FormatFloat('0.00', Sea_1_Effect);
      strgrdEffectTable.Cells[3, i + 1] := FormatFloat('0.00', Sea_2_Effect);
      strgrdEffectTable.Cells[4, i + 1] := FormatFloat('0.00', Sea_3_Effect);
      strgrdEffectTable.Cells[5, i + 1] := FormatFloat('0.00', Sea_4_Effect);
      strgrdEffectTable.Cells[6, i + 1] := FormatFloat('0.00', Sea_5_Effect);
      strgrdEffectTable.Cells[7, i + 1] := FormatFloat('0.00', Sea_6_Effect );
      strgrdEffectTable.Cells[8, i + 1] := FormatFloat('0.00', Sea_7_Effect);
      strgrdEffectTable.Cells[9, i + 1] := FormatFloat('0.00', Sea_8_Effect);
      strgrdEffectTable.Cells[10, i + 1] := FormatFloat('0.00', Sea_9_Effect);
    end;
  end;
end;

procedure TfrmEffectsTable.UpdateShipNoiseEffectOnSonar;
var
  i : Integer;
  shipnoiseOnSonar : TGame_Ship_On_Sonar;
begin
  with strgrdEffectTable do
  begin
    ColCount := 5;
    RowCount := 17;
    ColWidths[0] := 120;

    Cells[0, 0] := 'Frequency (kHz)';
    Cells[1, 0] := 'Distant';
    Cells[2, 0] := 'Low';
    Cells[3, 0] := 'Medium';
    Cells[4, 0] := 'High';
  end;

  dmTTT.GetGameShipNoiseOnSonar(FSelectedGameDefault.FData.Defaults_Index,
    FEffectList);

  for i := 0 to FEffectList.Count - 1 do
  begin
    shipnoiseOnSonar := FEffectList.Items[i];

    with shipnoiseOnSonar.FData do
    begin
      strgrdEffectTable.Cells[0, i + 1] := FormatFloat('0.0', Sonar_Frequency);
      strgrdEffectTable.Cells[1, i + 1] := FormatFloat('0.00',
        Distant_Ship_Effect);
      strgrdEffectTable.Cells[2, i + 1] := FormatFloat('0.00',
        Distant_Ship_Effect);
      strgrdEffectTable.Cells[3, i + 1] := FormatFloat('0.00',
        Medium_Ship_Effect);
      strgrdEffectTable.Cells[4, i + 1] := FormatFloat('0.00',
        Heavy_Ship_Effect);
    end;
  end;
end;

end.
