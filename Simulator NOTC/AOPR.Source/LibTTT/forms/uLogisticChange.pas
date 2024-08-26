unit uLogisticChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uT3Unit, Buttons, Menus, ufmControlled,
  uDataModuleTTT,
  uSimMgr_Client, uT3Vehicle, uGameData_TTT, uBaseCoordSystem, ufrmKeyboard, ufToteDisplay, tttData,
  uDBAsset_Embark_Library, uDBScenario {,uDBScenario, uGameData_TTT, tttData} ;

type
  TfrmLogisticChange = class(TForm)
    pnlHose: TPanel;
    Label4: TLabel;
    cbbHose: TComboBox;
    pnlValue: TPanel;
    btnCancel: TSpeedButton;
    btnTransfer: TSpeedButton;
    GroupBox16: TGroupBox;
    Label31: TLabel;
    lblFuel: TLabel;
    lblFreshWater: TLabel;
    Label38: TLabel;
    lblFood: TLabel;
    Label69: TLabel;
    Label113: TLabel;
    Label145: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblML: TLabel;
    Label5: TLabel;
    edtFuelTrans: TEdit;
    edtATTrans: TEdit;
    edtFoodTrans: TEdit;
    edtMLTrans: TEdit;
    procedure UpdateTabIdShip;
    procedure btnCancelClick(Sender: TObject);
    procedure btnTransferClick(Sender: TObject);
    procedure edtDesimalKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);

  private
    supplierShip, targetShip : TT3PlatformInstance;
    base : TPlatformBase;

    function GetBase: TPlatformBase;
    function CekSuppliedShipMaxCapacity:Boolean;
    function CekOwnShipRemaining:Boolean;
    function CekBaseRemaining:Boolean;

  public
    supplierShipID, targetShipID, baseID : Integer;
    ModeTransferID : Integer; {0: antar kapal; 1: dari pangkalan; 2: perubahan dari instruktur}

  end;

var
  frmLogisticChange: TfrmLogisticChange;

implementation

{$R *.dfm}

procedure TfrmLogisticChange.UpdateTabIdShip;
begin
  targetShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(targetShipID));

  if not Assigned(targetShip) then
    Exit;

  case ModeTransferID of
    0: {Antar Kapal}
    begin
      supplierShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(supplierShipID));

      if not Assigned(supplierShip) then
        Exit;

      Caption := supplierShip.InstanceName + ' to ' + targetShip.InstanceName;

    end;
    1: {Dengan Pangkalan}
    begin
      GetBase;

      if not Assigned(base) then
        Exit;

      Caption := base.identifier + ' to ' + targetShip.InstanceName;
    end;
  end;

  edtFuelTrans.Text := '0';
  edtMLTrans.Text   := '0';
  edtATTrans.Text   := '0';
  edtFoodTrans.Text := '0';
end;

function TfrmLogisticChange.CekSuppliedShipMaxCapacity: Boolean;
var
  fuelToTransferTemp : Double;
  lubricantsToTransferTemp : Double;
  WaterToTransferTemp : Double;
  foodToTransferTemp : Double;

begin
  result := False;

  if not Assigned(targetShip) then
    Exit;

  {$REGION ' Validasi format inputan '}
  if not TryStrToFloat(edtFuelTrans.Text, fuelToTransferTemp) then exit;
  if not TryStrToFloat(edtMLTrans.Text, lubricantsToTransferTemp) then exit;
  if not TryStrToFloat(edtATTrans.Text, WaterToTransferTemp) then exit;
  if not TryStrToFloat(edtFoodTrans.Text, foodToTransferTemp) then exit;
  {$ENDREGION}

  {$REGION ' Validasi batas maksimum inputan '}
  if targetShip.FuelCapacity < (targetShip.FuelRemaining + fuelToTransferTemp) then
  begin
    ShowMessage('Over maximum capacity, Fuel maximum capacity is ' + FormatFloat('0.00', targetShip.FuelCapacity) + ' m3');
    exit;
  end;
  if targetShip.MLCapacity < (targetShip.MLRemaining + lubricantsToTransferTemp) then
  begin
    ShowMessage('Over maximum capacity, Lubricants maximum capacity is ' + FormatFloat('0.00', targetShip.MLCapacity) + ' m3');
    exit;
  end;
  if targetShip.ATCapacity < (targetShip.ATRemaining + WaterToTransferTemp) then
  begin
    ShowMessage('Over maximum capacity, Water maximum capacity is ' + FormatFloat('0.00', targetShip.WaterCapacity) + ' m3');
    exit;
  end;
  if targetShip.FoodCapacity < (targetShip.FoodRemaining + foodToTransferTemp) then
  begin
    ShowMessage('Over maximum capacity, Food maximum capacity is ' + FormatFloat('0.00', targetShip.FoodCapacity) + ' ton');
    exit;
  end;
  {$ENDREGION}

  result := True;
end;

function TfrmLogisticChange.CekBaseRemaining: Boolean;
var
  fuelTemp : Double;
  mlTemp : Double;
  atTemp : Double;
  foodTemp : Double;

begin
  result := False;

  {$REGION ' Validasi format inputan '}
  if not TryStrToFloat(edtFuelTrans.Text, fuelTemp) then exit;
  if not TryStrToFloat(edtMLTrans.Text, mlTemp) then exit;
  if not TryStrToFloat(edtATTrans.Text, atTemp) then exit;
  if not TryStrToFloat(edtFoodTrans.Text, foodTemp) then exit;
  {$ENDREGION}

  {$REGION ' Validasi batas maksimum inputan '}
  if base.Fuel < fuelTemp then
  begin
    ShowMessage(' Insufficient Fuel ');
    exit;
  end;
  if base.Lubricants < mlTemp then
  begin
    ShowMessage(' Insufficient Lubricants ');
    exit;
  end;
  if base.FreshWater < atTemp then
  begin
    ShowMessage(' Insufficient Water ');
    exit;
  end;
  if base.Food < foodTemp then
  begin
    ShowMessage(' Insufficient food ');
    exit;
  end;
  {$ENDREGION}

  result := True;
end;

function TfrmLogisticChange.CekOwnShipRemaining: Boolean;
var
  fuelTemp : Double;
  mlTemp : Double;
  atTemp : Double;
  foodTemp : Double;

begin
  result := False;

  {$REGION ' Validasi format inputan '}
  if not TryStrToFloat(edtFuelTrans.Text, fuelTemp) then exit;
  if not TryStrToFloat(edtMLTrans.Text, mlTemp) then exit;
  if not TryStrToFloat(edtATTrans.Text, atTemp) then exit;
  if not TryStrToFloat(edtFoodTrans.Text, foodTemp) then exit;
  {$ENDREGION}

  {$REGION ' Validasi batas maksimum inputan '}
  if supplierShip.FuelRemaining < fuelTemp then
  begin
    ShowMessage(' Insufficient Fuel ');
    exit;
  end;
  if supplierShip.MLRemaining < mlTemp then
  begin
    ShowMessage(' Insufficient Lubricants ');
    exit;
  end;
  if supplierShip.ATRemaining < atTemp then
  begin
    ShowMessage(' Insufficient Water ');
    exit;
  end;
  if supplierShip.FoodRemaining < foodTemp then
  begin
    ShowMessage(' Insufficient food ');
    exit;
  end;
  {$ENDREGION}

  result := True;
end;

procedure TfrmLogisticChange.btnTransferClick(Sender: TObject);
var
  recLogistic : TRecCmd_Change_Logistic;
  hosePortTemp, hoseStarboardTemp : THose;

begin
  targetShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(targetShipID));

  if not Assigned(targetShip) then
    Exit;

  case ModeTransferID of

    {$REGION ' Transfer Antar Kapal '}
    0 :
    begin
      supplierShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(supplierShipID));

      if not Assigned(supplierShip) then
        Exit;

      case  cbbHose.ItemIndex of
        0:
        begin
          hosePortTemp := TT3Vehicle(supplierShip).HoseList[0];

          {$REGION ' Pengecekan selang kapal yang siap '}
          if hosePortTemp.State <> lsStandby then
          begin
            ShowMessage('Hose is not ready');
            Exit;
          end;
          {$ENDREGION}

          {$REGION ' Posisi kapal target terhadap selang '}
          if not IsInsideSector(supplierShip.PosX, supplierShip.PosY, targetShip.PosX, targetShip.PosY, supplierShip.Heading+180, supplierShip.Heading+360, 0.2) then
          begin
            ShowMessage('Wrong position');
            Exit;
          end;
          {$ENDREGION}

        end;
        1:
        begin
          hoseStarboardTemp := TT3Vehicle(supplierShip).HoseList[1];

          {$REGION ' Pengecekan selang kapal yang siap '}
          if hoseStarboardTemp.State <> lsStandby then
          begin
            ShowMessage('Hose is not ready');
            Exit;
          end;
          {$ENDREGION}

          {$REGION ' Posisi kapal target terhadap selang '}
          if not IsInsideSector(supplierShip.PosX, supplierShip.PosY, targetShip.PosX, targetShip.PosY, supplierShip.Heading, supplierShip.Heading+180, 0.2) then
          begin
            ShowMessage('Wrong position');
            Exit;
          end;
          {$ENDREGION}

        end;
      end;

      recLogistic.PlatfomID     := supplierShipID;

      if not CekOwnShipRemaining then
        Exit;
    end;
    {$ENDREGION}

    {$REGION ' Transfer Dari Pangkalan '}
    1 :
    begin
      if not Assigned(base) then
        Exit;

      recLogistic.PlatfomID     := baseID;

      if not CekBaseRemaining then
        Exit
    end;
    {$ENDREGION}

  end;

  if not CekSuppliedShipMaxCapacity then
    Exit;

  recLogistic.DestinationID := targetShipID;
  recLogistic.ModeTransferID:= ModeTransferID;
  recLogistic.vFuel         := StrToFloat(edtFuelTrans.Text);
  recLogistic.vLubricants   := StrToFloat(edtMLTrans.Text);
  recLogistic.vFreshWater   := StrToFloat(edtATTrans.Text);
  recLogistic.vFood         := StrToFloat(edtFoodTrans.Text);
  recLogistic.StateID       := lsProcess;
  recLogistic.HoseID        := cbbHose.ItemIndex;

  simMgrClient.netSend_Cmd_Change_Logistic(recLogistic);

  Close;

  ShowMessage('Transfer Process...');
end;

procedure TfrmLogisticChange.btnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TfrmLogisticChange.edtDesimalKeyPress(Sender: TObject; var Key: Char);
var
  i, a : Integer;
  _ValKey : set of AnsiChar;
begin
  _ValKey := [#48 .. #57, #8, #13, #46];

  {$REGION ' Filter selain angka dan titik tidak bisa '}
  if not(CharInSet(Key, _ValKey)) then
    Key := #0;
  {$ENDREGION}

  {$REGION ' Filter jk titik > 1 tidak bisa '}
  if Key = #46 then
  begin
    a := 0;

    for i := 1 to length(TEdit(sender).Text) do
    begin
      if TEdit(sender).Text[i] = '.' then
        a := a + 1;
    end;

    if a > 0 then
      Key := #0;
  end;
  {$ENDREGION}
end;

procedure TfrmLogisticChange.FormActivate(Sender: TObject);
begin
  if not Assigned(frmKeyboard) then
    Exit;
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

function TfrmLogisticChange.GetBase: TPlatformBase;
var
  i : Integer;

begin
  for I := 0 to VScenario.BaseListFromDB.Count - 1 do
  begin
    base := TPlatformBase(VScenario.BaseListFromDB.Items[i]);

    if base.id =  baseID then
      Break
    else
      base := nil;
  end;

  Result := base;
end;

end.
