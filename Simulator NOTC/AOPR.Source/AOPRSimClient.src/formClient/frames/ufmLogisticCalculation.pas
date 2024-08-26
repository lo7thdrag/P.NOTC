unit ufmLogisticCalculation;

interface

uses   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ComCtrls, StdCtrls, Buttons, ExtCtrls, uT3Unit,
  uT3Sensor, uT3OtherSensor, uT3Vehicle, tttData, uT3Radar, uT3Sonar, uT3Visual,
  uSimManager, uSimMgr_Client, uGameData_TTT, uT3DataLink, uMainLogisticTemplate,
  uBaseCoordSystem, uDetailRouteLogistic;

type
  TfmLogisticCalculation = class(TfmControlled)
    lblFuelLog: TLabel;
    Label55: TLabel;
    lblMLLog: TLabel;
    Label56: TLabel;
    lblATLog: TLabel;
    Label61: TLabel;
    lblFoodLog: TLabel;
    Label161: TLabel;
    lblWaterLog: TLabel;
    Label227: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    lblJarakLog: TLabel;
    lblWaktuLog: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label65: TLabel;
    Label58: TLabel;
    Label62: TLabel;
    Bevel1: TBevel;
    grplist: TGroupBox;
    btnUseTemplate: TSpeedButton;
    btnShowDetails: TSpeedButton;
    btnHideDetails: TSpeedButton;
    lvTemplateOnShip: TListView;
    Label2: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    lblFuelStatus: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblMlStatus: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblATStatus: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lblWaterStatus: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lblFoodStatus: TLabel;
    Label22: TLabel;
    Label60: TLabel;
    lblSaranLog: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;

    procedure ButtonHandle(Sender: TObject);
    procedure lvTemplateOnShipSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
  private
    { Private declarations }

  public
    IdSelectedTemplate: Integer;
    iPa, iBa, iTa : Integer;
    FuelCons, MlCons, ATCons, WaterCons, FoodCons : Double;
    jarak, waktu, vFuel, vML, vAT, vFood, vWater : Double;

    procedure cekSpeed(iSpeed : Double; var iConPerHour : Double);
    procedure LogisticCalculation;
    procedure RemoveListLogistic(ctrlObj: TObject);
    procedure SetControlledObject(ctrlObj: TObject); override;
    procedure InitCreate(Sender: TForm); override;
    procedure RefreshLTemplate;
    procedure ShipSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure ButtonHandleFormMiror(Sender: TObject);
  end;

var
  fmLogisticCalculation: TfmLogisticCalculation;

implementation

uses ufTacticalDisplay;

{$R *.dfm}


procedure TfmLogisticCalculation.ButtonHandle(Sender: TObject);
begin
  case TSpeedButton(Sender).Tag of
    1 : {Calc Route}
    begin
      LogisticCalculation
    end;
    2 : {Show Details Route}
    begin
      RefreshLTemplate;
      fmDetailsRouteLogistic.Show;
      btnShowDetails.Visible := False;
      btnHideDetails.Visible := True;
    end;
    3 : {Hide Details Route}
    begin
      RefreshLTemplate;
      fmDetailsRouteLogistic.Hide;
      btnShowDetails.Visible := True;
      btnHideDetails.Visible := False;
    end;
  end;
end;

procedure TfmLogisticCalculation.InitCreate(Sender: TForm);
begin
  inherited;

end;

procedure TfmLogisticCalculation.cekSpeed(iSpeed : Double; var iConPerHour : Double);
begin
  iConPerHour := 0;

  with TT3Vehicle(FControlled).UnitMotion.FData do
  begin
    if (iSpeed >= Min_Ground_Speed) and (iSpeed < Cruise_Ground_Speed) then
      iConPerHour := Min_Speed_Fuel_Consume
    else if (iSpeed >= Cruise_Ground_Speed) and (iSpeed < High_Ground_Speed) then
      iConPerHour := Cruise_Speed_Fuel_Consume
    else if (iSpeed >= High_Ground_Speed) and (iSpeed < Max_Ground_Speed) then
      iConPerHour := High_Speed_Fuel_Consume
    else if (iSpeed >= Max_Ground_Speed) then
      iConPerHour := Max_Speed_Fuel_Consume;
  end;
end;

procedure TfmLogisticCalculation.LogisticCalculation;
var
  i, j : Integer;
  LogistiRoute : TPointRoute;
  LogisticTemplate : TMainShipingRoute;

  consPerHour, LogRange, LogWaktuTempuh, LogFuel,
  LogML, LogAT, LogFood, LogWater, SecondToHours : Double;

begin
  if simMgrClient.SimShipingRoute.FList.Count > 0 then
  begin
    fmDetailsRouteLogistic.lvDetailsRouteLogistic.Clear;

    if (IdSelectedTemplate <= 0) or (IdSelectedTemplate > simMgrClient.SimShipingRoute.FList.Count) then
    begin
      RefreshLTemplate;
      Exit;
    end;

    jarak := 0; waktu := 0;
    vFuel := 0; vML := 0; vAT := 0; vFood := 0; vWater := 0;

    LogisticTemplate := simMgrClient.SimShipingRoute.FList.Items[IdSelectedTemplate-1];

    for i := 0 to LogisticTemplate.FList.Count - 1 do
    begin
      LogistiRoute := LogisticTemplate.FList[i];

      {jarak yg ditempuh}
      LogRange := CalcRange(LogistiRoute.PosAwal.X,LogistiRoute.PosAwal.Y, LogistiRoute.PosAkhir.X,
                            LogistiRoute.PosAkhir.Y);

      {waktu yg ditempuh}
      LogWaktuTempuh := ((LogRange * C_NauticalMile_To_Metre) / (LogistiRoute.Speed/C_MS_To_KNOTS))/3600;

      {Fuel}
      cekSpeed(LogistiRoute.Speed, consPerHour);
      LogFuel := LogWaktuTempuh * consPerHour {m3};

      {ML}
      LogML := LogWaktuTempuh * MlCons; {m3}

      {AT}
      LogAT := LogWaktuTempuh * ATCons; {m3}

      {Water}
      LogWater := (LogWaktuTempuh/24) * WaterCons * (LogistiRoute.Personel + iPa + iBa + iTa);  {/24jam/ personel};

      {Food}
      LogFood := (LogWaktuTempuh/24) * FoodCons * (LogistiRoute.Personel + iPa + iBa + iTa);  {/24jam/ personel}

      with fmDetailsRouteLogistic.lvDetailsRouteLogistic.Items.Add do
      begin
        SecondToHours := abs((LogWaktuTempuh - (Round(LogWaktuTempuh)))) * 60;
        SubItems.Add('WP ' + IntToStr(LogistiRoute.PointId) + '-' + IntToStr(LogistiRoute.PointId+1));
        SubItems.Add(FormatFloat('0.000',LogRange));
        SubItems.Add(IntToStr(LogistiRoute.Personel + iPa + iBa + iTa));
        SubItems.Add(FloatToStr(LogistiRoute.Speed));
        SubItems.Add(FloatToStr(Round(LogWaktuTempuh)) + ':' + FormatFloat('00',SecondToHours));
        SubItems.Add(FormatFloat('0.000',LogFuel));
        SubItems.Add(FormatFloat('0.000',LogML));
        SubItems.Add(FormatFloat('0.000',LogAT));
        SubItems.Add(FormatFloat('0.000',LogFood));
        SubItems.Add(FormatFloat('0.000',LogWater));

        jarak := jarak + LogRange;
        waktu := waktu + LogWaktuTempuh;
        vFuel := vFuel + LogFuel;
        vML := vML + LogML;
        vAT := vAT + LogAT;
        vFood := vFood + LogFood;
        vWater := vWater + LogWater;
      end;
    end;
    SecondToHours := abs((waktu - (Round(waktu)))) * 60;

    lblJarakLog.Caption := FormatFloat('0.00',jarak);
    lblWaktuLog.Caption := (FloatToStr(Round(waktu)) + ':' + (FormatFloat('00',SecondToHours)));
    lblFuelLog.Caption := FormatFloat('0.00',vFuel);
    lblMLLog.Caption := FormatFloat('0.00',vML);
    lblATLog.Caption :=FormatFloat('0.00',vAT);
    lblFoodLog.Caption := FormatFloat('0.00',vFood);
    lblWaterLog.Caption := FormatFloat('0.00',vWater);

    fmDetailsRouteLogistic.lvDetailsRouteLogistic.Items.BeginUpdate;
    try
     for j := 0 to fmDetailsRouteLogistic.lvDetailsRouteLogistic.Items.Count-1 do
       fmDetailsRouteLogistic.lvDetailsRouteLogistic.Items.Item[j].Caption:=IntToStr(j+1);
    finally
      fmDetailsRouteLogistic.lvDetailsRouteLogistic.Items.EndUpdate;
    end;
  end;
end;

procedure TfmLogisticCalculation.lvTemplateOnShipSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  i, j : Integer;
  LogistiRoute : TPointRoute;
  LogisticTemplate : TMainShipingRoute;
begin
  inherited;
  btnUseTemplate.Enabled := False;

  {semua template diset normal dulu}
  for i := 0 to simMgrClient.SimShipingRoute.FList.Count - 1 do
  begin
    LogisticTemplate := simMgrClient.SimShipingRoute.FList.Items[i];
    for j := 0 to LogisticTemplate.FList.Count - 1 do
    begin
      LogistiRoute := LogisticTemplate.FList[j];
      LogistiRoute.isSelected := False;
    end;
  end;

  if Selected then
  begin
    IdSelectedTemplate := (StrToInt(TListView(Sender).Selected.Caption));

    {yang diselect dibuat bergaris}
    LogisticTemplate := simMgrClient.SimShipingRoute.FList.Items[IdSelectedTemplate-1];
    for i := 0 to LogisticTemplate.FList.Count - 1 do
    begin
      LogistiRoute := LogisticTemplate.FList[i];
      LogistiRoute.isSelected := True;
    end;
    btnUseTemplate.Enabled := True;
  end
end;

procedure TfmLogisticCalculation.RefreshLTemplate;
var
  i, j : Integer;
  LogisticTemplate : TMainShipingRoute;
begin
  lvTemplateOnShip.Items.Clear;

  for I := 0 to simMgrClient.SimShipingRoute.FList.Count - 1 do
  begin
    LogisticTemplate := simMgrClient.SimShipingRoute.FList.Items[i];

    lvTemplateOnShip.Items.Add.SubItems.Add(LogisticTemplate.Name);
  end;

  lvTemplateOnShip.Items.BeginUpdate;
  try
   for j := 0 to lvTemplateOnShip.Items.Count-1 do
     lvTemplateOnShip.Items.Item[j].Caption:=IntToStr(j+1);
  finally
    lvTemplateOnShip.Items.EndUpdate;
  end;
end;

procedure TfmLogisticCalculation.RemoveListLogistic(ctrlObj: TObject);
begin
  if not(Assigned(ctrlObj)) then
    Exit;

  if FControlled = ctrlObj then
  begin
    lblJarakLog.Caption := '---';
    lblWaktuLog.Caption := '---';
    lblFuelLog.Caption := '---';
    lblMLLog.Caption := '---';
    lblATLog.Caption := '---';
    lblWaterLog.Caption := '---';
    lblFoodLog.Caption := '---';
  end;
end;

procedure TfmLogisticCalculation.SetControlledObject(ctrlObj: TObject);
begin
  inherited;

  RefreshLTemplate;
  if FControlled is TT3Vehicle then
  begin
    lblFuelStatus.Caption := FormatFloat('0.00',TT3PlatformInstance(FControlled).FuelRemaining);
    lblMlStatus.Caption := FormatFloat('0.00',TT3PlatformInstance(FControlled).MLRemaining);
    lblATStatus.Caption := FormatFloat('0.00',TT3PlatformInstance(FControlled).ATRemaining);
    lblWaterStatus.Caption := FormatFloat('0.00',TT3PlatformInstance(FControlled).WaterRemaining);
    lblFoodStatus.Caption := FormatFloat('0.00',TT3PlatformInstance(FControlled).FoodRemaining);

    with TT3Vehicle(FControlled).UnitLogistic.FData do
    begin
      iPa := PA;
      iBa := BA;
      iTa := TA;
      MlCons := Lubricants_Consumption;
      ATCons := Freshwater_Consumption;
      WaterCons := Water_Consumption;
      FoodCons := Ration_Consumption;
    end;

    lblJarakLog.Caption := '---';
    lblWaktuLog.Caption := '---';
    lblFuelLog.Caption := '---';
    lblMLLog.Caption := '---';
    lblATLog.Caption := '---';
    lblWaterLog.Caption := '---';
    lblFoodLog.Caption := '---';
  end;
end;

procedure TfmLogisticCalculation.ShipSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
 lvTemplateOnShipSelectItem(Sender, Item, Selected);
end;

procedure TfmLogisticCalculation.ButtonHandleFormMiror(Sender: TObject);
begin
  ButtonHandle(Sender);
end;

end.
