unit ufrmNGSGunSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uGameData_TTT, ufmWeaponCtrl, ufrmGunAutoManual,
  Menus, uMainStaticShape;

type
  TfrmNGSGunSetup = class(TForm)
    lblEngagement: TLabel;
    lblAimPoint: TLabel;
    edtAimPoint: TEdit;
    lblSpotterLine: TLabel;
    lblAltitude: TLabel;
    lblGunLine2: TLabel;
    edtEngagement: TEdit;
    edtSptLine: TEdit;
    edtAltitude: TEdit;
    lblGunLine: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btnSelect: TSpeedButton;
    btnPosition: TSpeedButton;
    btnClose: TBitBtn;
    btnApply: TBitBtn;
    pmenuEngagement: TPopupMenu;
    SpotterCorrection1: TMenuItem;
    GunnerCorrection1: TMenuItem;
    procedure btnCloseClick(Sender: TObject);
    procedure btnPositionClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSptLineKeyPress(Sender: TObject; var Key: Char);
    procedure SpotterCorrection1Click(Sender: TObject);
    procedure GunnerCorrection1Click(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure edtAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FMapPositionX: double;
    FMapPositionY: double;
    rSend        : TRecCmd_GunFire;
    //WpnController: TfrmWeaponCtrl;
    //FDeployedNGS: TObject;

    procedure SetMapPositionX(const Value: double);
    procedure SetMapPositionY(const Value: double);
    procedure setWeapon(const Value: TObject);
    procedure setControlled(const Value: TObject);
	  procedure EmptyRec(var rGun : TRecCmd_GunFire);
    //procedure SetDeployedNGS(const Value: TObject);
  protected
    FWeapon: TObject;
    FControlled: TObject;
    procedure SetProperties;
  public
    { Public declarations }
    property MapPositionX : double read FMapPositionX write SetMapPositionX;
    property MapPositionY : double read FMapPositionY write SetMapPositionY;
    property PlatformCtrld : TObject read FControlled write setControlled;
    property Weapon : TObject read FWeapon write setWeapon;

    procedure SetBearingNGS(const x1, y1 : double);
    procedure SetDataWeapon(const Obj: TObject);

    procedure ClearFlagPoint;
    procedure AddFlag(id : integer);
  end;

var
  frmNGSGunSetup: TfrmNGSGunSetup;

implementation

uses uMapXHandler, tttData, uBaseCoordSystem, uSimMgr_Client,
     uT3Weapon, uT3Unit, uT3Gun, ufTacticalDisplay;

{$R *.dfm}

procedure TfrmNGSGunSetup.AddFlag(id: integer);
var
  ObjectFlagPoint : TFlagPoint;
begin
  ObjectFlagPoint := simMgrClient.DrawFlagPoint.GetFlagPoint(id);
  if Assigned(ObjectFlagPoint)  then
  begin
    ObjectFlagPoint.Post.X := MapPositionX;
    ObjectFlagPoint.Post.Y := MapPositionY;
  end
  else
  begin
    ObjectFlagPoint := TFlagPoint.Create(simMgrClient.Converter);
    ObjectFlagPoint.PointId := id;
    ObjectFlagPoint.Post.X := MapPositionX;
    ObjectFlagPoint.Post.Y := MapPositionY;
    simMgrClient.DrawFlagPoint.FList.Add(ObjectFlagPoint);
  end;
end;

procedure TfrmNGSGunSetup.btnApplyClick(Sender: TObject);
var
  X_Flash, Y_Flash, X_FlashEror, Y_FlashError : Double;
  defEror, rangeEror, disAngle, disRange : Double;
  Range, Bearing, SpeedGun : Double;
begin
  {send post n altitude target}
  if (not Assigned(Weapon)) or (not(Weapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not set'); //mk
    exit;
  end;

  EmptyRec(rSend);

  //--NGS First Def data Error Correctios (satuannya dalam NauticalMile)--
  if Assigned(TT3GunOnVehicle(Weapon).GunDefinition) then
  begin
    defEror := (TT3GunOnVehicle(Weapon).GunDefinition.FData.NGS_MinDeflectionError +
               Random*(TT3GunOnVehicle(Weapon).GunDefinition.FData.NGS_MaxDeflectionError -
               TT3GunOnVehicle(Weapon).GunDefinition.FData.NGS_MinDeflectionError))
               * C_Meter_To_Degree;//C_NauticalMile_To_Degree;
    rangeEror := (TT3GunOnVehicle(Weapon).GunDefinition.FData.NGS_MinDeflectionError +
                 Random*(TT3GunOnVehicle(Weapon).GunDefinition.FData.NGS_MaxDeflectionError -
                 TT3GunOnVehicle(Weapon).GunDefinition.FData.NGS_MinDeflectionError))
                 * C_Meter_To_Degree;//C_NauticalMile_To_Degree;

    if Random(2) = 1 then
      defEror := -(defEror)
    else
      defEror := defEror;

    if Random(2) = 1 then
      rangeEror := -(rangeEror)
    else
      rangeEror := rangeEror;
  end
  else
  begin
    defEror := 0;
    rangeEror := 0;
  end;

  disAngle  := Random * 360;
  disRange  := Random * TT3GunOnVehicle(Weapon).GunDefinition.FData.NGS_MaxDispersionError
              * C_NauticalMile_To_Degree;

  X_Flash := MapPositionX + defEror - 0;
  Y_Flash := MapPositionY + rangeEror - 0;
  CalcForward(X_Flash, Y_Flash, disRange, disAngle, X_FlashEror, Y_FlashError);

  SpeedGun := TT3GunOnVehicle(FWeapon).GunDefinition.FData.Gun_Average_Shell_Velocity;
  Range := CalcRange(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                     MapPositionX,
                     MapPositionY);
  Bearing := CalcBearing(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                     MapPositionX,
                     MapPositionY);
  rSend.NGSBearing := ValidateDegree(Bearing - TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).Course);
  rSend.NGSElevation := GetElevation(SpeedGun, Range);
  rSend.VBSAzimuth := Bearing;
  rSend.VBSElevation := (Range * 45 / TT3GunOnVehicle(Weapon).GunDefinition.
    FData.Max_Range);

  rSend.TurretID :=  TT3GunOnVehicle(FWeapon).GunDefinition.FPoint.FData.TurretID;

//  simMgrClient.FlashPointNGS.PosX := X_FlashEror;
//  simMgrClient.FlashPointNGS.PosY := Y_FlashError;
//  simMgrClient.FlashPointNGS.Visible := True;

  rSend.pX          := MapPositionX;
  rSend.pY          := MapPositionY;
  rSend.pAltitude   := StrToFloat(edtAltitude.Text) * C_Feet_To_Meter;
  rSend.degSpotLine := StrToFloat(edtSptLine.Text);
  rSend.degGunLine  := StrToFloat(lblGunLine.Caption);
  rSend.pXflash     := X_FlashEror;
  rSend.pYflash     := Y_FlashError;

  rSend.OrderID   := CORD_ID_postNGS;
  simMgrClient.netSend_CmdGunFire(rSend);

  rSend.NGSDefCorr  := 0;
  rSend.NGSRangeCorr:= 0;
  rSend.NGSCorrMode := 0;

  rSend.OrderID := CORD_ID_NGSCorrLR;
  simMgrClient.netSend_CmdGunFire(rSend);

  rSend.OrderID := CORD_ID_NGSCorrDA;
  simMgrClient.netSend_CmdGunFire(rSend);

  btnApply.Enabled := False;
  VSimMap.FMap.CurrentTool := mtSelectObject;
  Close;
end;

procedure TfrmNGSGunSetup.btnCloseClick(Sender: TObject);
begin
  btnApply.Enabled := False;
  VSimMap.FMap.CurrentTool := mtSelectObject;
  Close;
end;

procedure TfrmNGSGunSetup.btnPositionClick(Sender: TObject);
begin
  VSimMap.FMap.CurrentTool := mtDeployNGS;
end;

procedure TfrmNGSGunSetup.btnSelectClick(Sender: TObject);
var
  pt: TPoint;
begin
  GetCursorPos(pt);

  if pmenuEngagement.Items.Count > 0 then
    pmenuEngagement.Popup(pt.X, pt.Y);
end;

procedure TfrmNGSGunSetup.ClearFlagPoint;
begin
  simMgrClient.DrawFlagPoint.Clear;
end;

procedure TfrmNGSGunSetup.edtAltitudeKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;
end;

procedure TfrmNGSGunSetup.edtSptLineKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    lblGunLine.Caption := edtSptLine.Text;
  end;
end;

procedure TfrmNGSGunSetup.EmptyRec(var rGun: TRecCmd_GunFire);
begin
  with rGun do begin
    SessionID         := 0;

    if Assigned(FControlled) then
      ParentPlatformID  := TT3PlatformInstance(FControlled).InstanceIndex
    else
      ParentPlatformID  := 0;

    if Assigned(FWeapon) then
    begin
      GunID             := TT3GunOnVehicle(FWeapon).InstanceIndex;
      ControlMode       := TT3GunOnVehicle(FWeapon).ControlMode;
      SalvoMode         := TT3GunOnVehicle(FWeapon).SalvoMode;
      SalvoSize         := TT3GunOnVehicle(FWeapon).SalvoSize;
      GunCapacityRemain := TT3GunOnVehicle(FWeapon).Quantity;
      InterceptRange    := TT3GunOnVehicle(FWeapon).InterceptRange;
      ThresSpeed        := TT3GunOnVehicle(FWeapon).ThresholdSpeed;

      if Assigned(TT3GunOnVehicle(FWeapon).TargetObject) then
        TargetPlatformID  := TT3Unit(TT3GunOnVehicle(FWeapon).TargetObject).InstanceIndex
      else
        TargetPlatformID  := 0;

      GunName   := TT3GunOnVehicle(FWeapon).InstanceName;
      pX        := TT3GunOnVehicle(FWeapon).NGSPosX;                      //mk test
      pY        := TT3GunOnVehicle(FWeapon).NGSPosY;
      pAltitude := TT3GunOnVehicle(FWeapon).NGSPosZ;
      degSpotLine := TT3GunOnVehicle(FWeapon).NGSSpotLine;
      degGunLine  := TT3GunOnVehicle(FWeapon).NGSGunLine;
      //--- NGS corrections n error system
      NGSCorrMode   := TT3GunOnVehicle(FWeapon).NGSCorrMode;
      NGSRangeCorr  := TT3GunOnVehicle(FWeapon).OptRangeCorr;
      NGSDefCorr    := TT3GunOnVehicle(FWeapon).OptDefCorr;
      pXflash       := TT3GunOnVehicle(FWeapon).NGSFlashX;
      pYflash       := TT3GunOnVehicle(FWeapon).NGSFlashY;
    end
    else begin
      GunID             := 0;
      ControlMode       := 0;
      SalvoMode         := 0;
      SalvoSize         := 0;
      GunCapacityRemain := 0;
      InterceptRange    := 0;
      ThresSpeed        := 0;
      TargetPlatformID  := 0;
      GunName           := '';
      pX        := 0;                      //mk test
      pY        := 0;
      pAltitude := 0;
      degSpotLine := 0;
      degGunLine  := 0;
      //--- NGS corrections n error system
      NGSCorrMode   := 0;
      NGSRangeCorr  := 0;
      NGSDefCorr    := 0;
      pXflash   := 0;
      pYflash   := 0;
    end;

    OrderID           := 0;
    HitProbability    := 0;
  end;
end;

procedure TfrmNGSGunSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VSimMap.FMap.CurrentTool := mtSelectObject;
end;

procedure TfrmNGSGunSetup.FormCreate(Sender: TObject);
begin
  FWeapon     := nil;
  FControlled := nil;
end;

procedure TfrmNGSGunSetup.GunnerCorrection1Click(Sender: TObject);
begin
  edtEngagement.Text := 'GunnerCorrection';
end;

procedure TfrmNGSGunSetup.SetBearingNGS(const x1, y1: double);
var
  bearing : double;
begin
  bearing := 0;

  if (Assigned(Weapon)) and (FWeapon is TT3GunOnVehicle) then
  begin
    bearing := CalcBearing(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).getPositionX,
               TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).getPositionY, x1, y1);
  end;

  edtSptLine.Text     := FormatFloat('000.0', bearing);
  lblGunLine.Caption  := FormatFloat('000.0', bearing);
end;

procedure TfrmNGSGunSetup.SetDataWeapon(const Obj: TObject);
var
  vGun : TT3GunOnVehicle;
  //mx, my: double;
begin
  if Obj is TT3GunOnVehicle then
  begin
    vGun := TT3GunOnVehicle(Obj);

    //simMgrClient.Converter.ConvertToMap(round(vGun.NGSPosX), round(vGun.NGSPosY), mx, my);
    MapPositionX := vGun.NGSPosX;
    MapPositionY := vGun.NGSPosY;

    simMgrClient.TargetPoint.PosX := vGun.NGSPosX;
    simMgrClient.TargetPoint.PosY := vGun.NGSPosY;

    edtAltitude.Text    := FloatToStr(Round(vGun.NGSPosZ * C_Meter_To_Feet));
    edtSptLine.Text     := FloatToStr(vGun.NGSSpotLine);
    lblGunLine.Caption  := FloatToStr(vGun.NGSGunLine);
  end;
end;

procedure TfrmNGSGunSetup.SetMapPositionX(const Value: double);
begin
  FMapPositionX := Value;

  edtAimPoint.Text := formatDM_longitude(FMapPositionX) + '  '
                      + formatDM_latitude(FMapPositionY);
end;

procedure TfrmNGSGunSetup.SetMapPositionY(const Value: double);
begin
  FMapPositionY := Value;
  edtAimPoint.Text := formatDM_longitude(FMapPositionX) + '  '
  + formatDM_latitude(FMapPositionY);
end;

procedure TfrmNGSGunSetup.setWeapon(const Value: TObject);
begin
  if not Assigned(Value) then begin
    FWeapon := Value;
  end
  else begin
    FWeapon := Value;
    SetProperties;
  end;
end;

procedure TfrmNGSGunSetup.SpotterCorrection1Click(Sender: TObject);
begin
  edtEngagement.Text := 'SpotterCorrection';
end;

procedure TfrmNGSGunSetup.setControlled(const Value: TObject);
begin
  FControlled := Value;
end;

procedure TfrmNGSGunSetup.SetProperties;
begin
  if not Assigned(FControlled) then begin
//    raise Exception.Create('Controlled Platform must be set on ' + Self.Name);
    frmTacticalDisplay.addStatus('Controlled Platform must be set on ' + Self.Name); //mk
    exit;
  end;
end;

end.
