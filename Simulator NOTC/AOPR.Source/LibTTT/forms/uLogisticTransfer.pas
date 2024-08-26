unit uLogisticTransfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uT3Unit, Buttons, Menus, ufmControlled,
  uDataModuleTTT,
  uSimMgr_Client, uT3Vehicle, uGameData_TTT, uBaseCoordSystem {,uDBScenario, uGameData_TTT, tttData} ;

type
  TfrmLogisticTransfer = class(TForm)
    GroupBox16: TGroupBox;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label32: TLabel;
    Label38: TLabel;
    Label45: TLabel;
    Label69: TLabel;
    Label113: TLabel;
    Label145: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtIdShipLog: TEdit;
    btnIdShip: TSpeedButton;
    edtFuelTrans: TEdit;
    edtATTrans: TEdit;
    edtFoodTrans: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    pmIdShip: TPopupMenu;
    Label2: TLabel;
    Label3: TLabel;
    edtMLTrans: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtWaterTrans: TEdit;
    Label7: TLabel;
    procedure btnIdShipClick(Sender: TObject);
    procedure UpdateTabIdShip;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

  private
    FRecvId : Integer;
    OwnPi, RecvPi : TT3PlatformInstance;

    function cekOwnLogistic(var flag : integer):Boolean;
    procedure onIdShipClick(Sender : TObject);

  public
    procedure SetControlledObject(ctrlObj: TObject);
  end;

var
  frmLogisticTransfer: TfrmLogisticTransfer;

implementation

{$R *.dfm}

procedure TfrmLogisticTransfer.btnIdShipClick(Sender: TObject);
var
  Pos : TPoint;
begin
  inherited;
  GetCursorPos(pos);
  pmIdShip.Popup(pos.X, pos.Y);
end;

function TfrmLogisticTransfer.cekOwnLogistic(var flag : integer): Boolean;
var
  vFuel, vML, vAT, vFood, vWater : Double;

begin
  result := False;
  flag := 1; {data inputan salah}

  if not TryStrToFloat(edtFuelTrans.Text, vFuel) then
    exit;
  if not TryStrToFloat(edtMLTrans.Text, vML) then
    exit;
  if not TryStrToFloat(edtATTrans.Text, vAT) then
    exit;
  if not TryStrToFloat(edtFoodTrans.Text, vFood) then
    exit;
  if not TryStrToFloat(edtWaterTrans.Text, vWater) then
    exit;

  flag := 2; {logistik tidak mencukupi}

  if OwnPi.FuelRemaining < vFuel then exit;
  if OwnPi.MLRemaining < vML then exit;
  if OwnPi.ATRemaining < vAT then exit;
  if OwnPi.FoodRemaining < vFood then exit;
  if OwnPi.WaterRemaining < vWater then exit;

  flag := 3; {penampung penerima tidak mencukupi}
  if (RecvPi.FuelRemaining + vFuel) > RecvPi.FuelCapacity then exit;
  if (RecvPi.MLRemaining + vML) > RecvPi.MLCapacity then exit;
  if (RecvPi.ATRemaining + vAT) > RecvPi.ATCapacity then exit;
  if (RecvPi.FoodRemaining + vFood) > RecvPi.FoodCapacity then exit;
  if (RecvPi.WaterRemaining + vWater) > RecvPi.WaterCapacity then exit;

  flag := 0;
  result := True;
end;

procedure TfrmLogisticTransfer.onIdShipClick(Sender: TObject);
begin
  edtIdShipLog.Text := TMenuItem(Sender).Hint;
  FRecvId := TMenuItem(Sender).Tag;
end;

procedure TfrmLogisticTransfer.SetControlledObject(ctrlObj: TObject);
var
  idCtrl, fontId : Integer;
begin
  inherited;
  Caption :=  TT3PlatformInstance(ctrlObj).InstanceName;
  OwnPi := TT3PlatformInstance(ctrlObj);
  {filter hanya kapal tanker yang bisa transfer fuel}
  idCtrl:= OwnPi.FPIData.Vehicle_Index;
  dmttt.getFontIDByVecID(idCtrl, fontId);
  if fontId = 270 then {Kapal Tanki Muatan Cair}
    edtFuelTrans.Enabled := True
  else
    edtFuelTrans.Enabled := False;
end;

procedure TfrmLogisticTransfer.SpeedButton1Click(Sender: TObject);
var
  flag, i : Integer;
  recLogistic : TRecCmd_Change_Logistic;

begin
  if edtIdShipLog.Text = 'Id Ship' then
  begin
    ShowMessage('Masukkan id Kapal yang akan di transfer');
    exit;
  end;

  RecvPi := simMgrClient.FindT3PlatformByID(FRecvId);

  if cekOwnLogistic(flag) then
  begin
    for i := 0 to 4 do
    begin
      recLogistic.PlatfomID := FRecvId;
      recLogistic.StateID := i;

      if i = 0 then
//        recLogistic.nValue := RecvPi.FuelRemaining + StrToFloat(edtFuelTrans.Text)
//      else if i = 1 then
//        recLogistic.nValue := RecvPi.MLRemaining + StrToFloat(edtMLTrans.Text)
//      else if i = 2 then
//        recLogistic.nValue := RecvPi.ATRemaining + StrToFloat(edtATTrans.Text)
//      else if i = 3 then
//        recLogistic.nValue := RecvPi.FoodRemaining + StrToFloat(edtFoodTrans.Text)
//      else
//        recLogistic.nValue := RecvPi.WaterRemaining + StrToFloat(edtWaterTrans.Text);

      simMgrClient.netSend_Cmd_Change_Logistic(recLogistic);
      sleep(100);
    end;

    for i := 0 to 4 do
    begin
      recLogistic.PlatfomID := OwnPi.InstanceIndex;
      recLogistic.StateID := i;

      if i = 0 then
//        recLogistic.nValue := OwnPi.FuelRemaining - StrToFloat(edtFuelTrans.Text)
//      else if i = 1 then
//        recLogistic.nValue := OwnPi.MLRemaining - StrToFloat(edtMLTrans.Text)
//      else if i = 2 then
//        recLogistic.nValue := OwnPi.ATRemaining - StrToFloat(edtATTrans.Text)
//      else if i = 3 then
//        recLogistic.nValue := OwnPi.FoodRemaining - StrToFloat(edtFoodTrans.Text)
//      else
//        recLogistic.nValue := OwnPi.WaterRemaining - StrToFloat(edtWaterTrans.Text);

      simMgrClient.netSend_Cmd_Change_Logistic(recLogistic);
      sleep(100);
    end;

    close;
  end
  else
  begin
    case flag of
      1 : ShowMessage('Incorrect data input');
      2 : ShowMessage('Deficient Logistics');
      3 : ShowMessage('Transfers Overload');
    end;
  end;
end;

procedure TfrmLogisticTransfer.SpeedButton2Click(Sender: TObject);
begin
  Close
end;

procedure TfrmLogisticTransfer.UpdateTabIdShip;
var
  menuItem : TMenuItem;
  i : Integer;
  pi : TT3PlatformInstance;
  range : Double;

begin
  pmIdShip.Items.Clear;

  with simMgrClient do
  begin
    for i := 0 to SimPlatforms.itemCount - 1 do
    begin
      pi := TT3PlatformInstance(SimPlatforms.getObject(i));

      if not(Assigned(pi)) then
        Continue;

      if (TT3PlatformInstance(pi).Controlled) then
        Continue;

      range := CalcRange(OwnPi.PosX, OwnPi.PosY, pi.PosX, pi.PosY );

      if range > 0.5 then
        Continue;

      if (pi is TT3Vehicle) then
      begin
        menuItem := TMenuItem.Create(nil);

        if IsController or ISWasdal then
        begin
          menuItem.Caption := TT3PlatformInstance(pi).Track_ID;
          menuItem.Hint := TT3PlatformInstance(pi).Track_ID;
          menuItem.Tag := (TT3PlatformInstance(pi).InstanceIndex);
        end
        else
        begin
          menuItem.Caption := IntToStr(TT3PlatformInstance(pi).InstanceIndex);
          menuItem.Hint := IntToStr(TT3PlatformInstance(pi).InstanceIndex);
          menuItem.Tag := (TT3PlatformInstance(pi).InstanceIndex);
        end;

        menuItem.OnClick := onIdShipClick;
        pmIdShip.Items.Add(menuItem);
      end;
    end;
  end;

  edtIdShipLog.Text := 'Id Ship';
  edtFuelTrans.Text := '0';
  edtMLTrans.Text := '0';
  edtATTrans.Text := '0';
  edtFoodTrans.Text := '0';
  edtWaterTrans.Text := '0';
end;

end.
