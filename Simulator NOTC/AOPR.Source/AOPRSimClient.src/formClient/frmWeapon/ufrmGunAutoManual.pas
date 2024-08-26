unit ufrmGunAutoManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ufmWeaponCtrl,
  uGameData_TTT, uT3Listener, uT3Unit, Menus;

type
  TfrmGunAutoManual = class(TfrmWeaponCtrl)
    grbGunEngagementAutomaticManualMode: TGroupBox;
    ScrollBox2: TScrollBox;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblQuantityChaff: TLabel;
    Label6: TLabel;
    btnChaffType: TSpeedButton;
    btnPosition: TSpeedButton;
    edtChaffType: TEdit;
    edtBloomPosition: TEdit;
    edtBloomAltitude: TEdit;
    ScrollBox3: TScrollBox;
    Label10: TLabel;
    Label11: TLabel;
    Bevel2: TBevel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Bevel5: TBevel;
    Label23: TLabel;
    btnTargetSearch: TSpeedButton;
    editControlSalvoSize: TEdit;
    editGunEngagementTargetTrack: TEdit;
    editAutofireIntercept: TEdit;
    editAutofireThreshold: TEdit;
    Label12: TLabel;
    lblGunEngagementStatus: TLabel;
    Label13: TLabel;
    lbGunEngagementQuantity: TLabel;
    Label14: TLabel;
    Bevel3: TBevel;
    Label25: TLabel;
    lblSalvoMode: TLabel;
    Bevel6: TBevel;
    sbControlModeAuto: TSpeedButton;
    sbControlModeManual: TSpeedButton;
    sbControlModeChaff: TSpeedButton;
    sbControlSalvoModeCont: TSpeedButton;
    sbControlSalvoModeSalvo: TSpeedButton;
    Label15: TLabel;
    Bevel4: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    lblIntercept: TLabel;
    sbGunEngagementDisplayRangeShow: TSpeedButton;
    sbGunEngagementDisplayRangeHide: TSpeedButton;
    sbGunEngagementDisplayBlindShow: TSpeedButton;
    sbGunEngagementDisplayBlindHide: TSpeedButton;
    sbGunEngagementDisplayInterceptShow: TSpeedButton;
    sbGunEngagementDisplayInterceptHide: TSpeedButton;
    btnGunEngagementAssign: TButton;
    btnGunEngagementCease: TButton;
    btnGunEngagementBreak: TButton;
    btnGunEngagementFire: TButton;
    pmenuChaffType: TPopupMenu;
    sbControlModeNGS: TSpeedButton;
    ScrollBox4: TScrollBox;
    Label5: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    Edit1: TEdit;
    btnSetup: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lblDA: TLabel;
    lblLR: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label8: TLabel;
    Label29: TLabel;
    Spot1: TEdit;
    Spot2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    btnConvert: TButton;
    btnFireALL: TButton;
    procedure btnGunModeClick(Sender: TObject);
    procedure btnGunSalvoClick(Sender: TObject);
    procedure btnRangeClick(Sender: TObject);
    procedure btnBlindZoneClick(Sender: TObject);
    procedure btnInterceptClick(Sender: TObject);
    procedure btnTargetSearchClick(Sender: TObject);
    procedure editControlSalvoSizeExit(Sender: TObject);
    procedure editControlSalvoSizeKeyPress(Sender: TObject; var Key: Char);
    procedure editAutofireInterceptKeyPress(Sender: TObject; var Key: Char);
    procedure editAutofireThresholdKeyPress(Sender: TObject; var Key: Char);
    procedure btnGunEngagementAssignClick(Sender: TObject);
    procedure btnGunEngagementBreakClick(Sender: TObject);
    procedure btnGunEngagementFireClick(Sender: TObject);
    procedure btnGunEngagementCeaseClick(Sender: TObject);
    procedure editAutofireInterceptExit(Sender: TObject);
    procedure editAutofireThresholdExit(Sender: TObject);
    procedure btnChaffTypeClick(Sender: TObject);
    procedure btnPositionClick(Sender: TObject);
    procedure btnSetupClick(Sender: TObject);
    procedure edtBloomAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure Spot1KeyPress(Sender: TObject; var Key: Char);
    procedure btnFireALLClick(Sender: TObject);
  private
    { Private declarations }
    FGunListener : TT3GunOnVehicleListener;
    FChaffCategory : Byte;
    FChaffType   : string;
    FChaffPosX, FChaffPosY : double;
	  FVisibleShowRange : Boolean;
    FVisibleShowBlind : Boolean;

    procedure ApplyControlMode(Mode : integer);
    procedure ApplySalvoMode(Mode : integer);
    procedure ApplyTarget(Value : integer);
    procedure ApplyAssigned(Value : boolean);
    procedure ApplyCeaseFire(Value : boolean);
    procedure ApplyFire(Value : boolean);

    procedure ChaffOption(Value : boolean);
    procedure EmptyRec(var rGun : TRecCmd_GunFire);
    procedure OnPropertyIntChange(Sender : TObject;Props : TPropsID; Value : Integer);
    procedure OnPropertyDblChange(Sender : TObject;Props : TPropsID; Value : Double);
    procedure OnPropertyBoolChange(Sender : TObject;Props : TPropsID; Value : Boolean);
//    procedure OnPropertyByteChange(Sender : TObject;Props : TPropsID; Value : Byte);
    procedure OnGunChaffPosChange(Sender : TObject;Props : TPropsID; ValueX, ValueY : double);
    function  CheckGunCapability(Sender: TT3PlatformInstance): boolean;
    procedure ChaffItemMenu;
    procedure ChaffFiring(Sender: TObject);
    //function  SetChaffType(Sender: TT3PlatformInstance) : string;
    procedure OnChaffTypeItemSelected(Sender: TObject);
 protected
    procedure Empty;override;
    procedure SetProperties;override;
  public
    { Public declarations }
    procedure OnPropertyByteChange(Sender : TObject;Props : TPropsID; Value : Byte);
    procedure SetRangeChaff(X,Y, Range : double);
  end;

var
  frmGunAutoManual: TfrmGunAutoManual;

implementation

uses uT3Gun, uT3CounterMeasure,
     uT3Vehicle, TTTData, uSimMgr_Client,
     uDBAsset_Vehicle, uBaseCoordSystem,uT3SimManager,
     uT3Radar, uT3Weapon, uMapXHandler, uT3DetectedTrack, ufrmNGSGunSetup,
     uSimObjects, ufTacticalDisplay;

{$R *.dfm}

{ TfrmGunAutoManual }
procedure TfrmGunAutoManual.ApplyAssigned(Value : boolean);
begin
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  if Value then begin
    btnGunEngagementAssign.Enabled := false;
    btnGunEngagementBreak.Enabled := true;

    case TT3GunOnVehicle(FWeapon).ControlMode of
      1 : btnGunEngagementFire.Enabled := false;
      2,4 : btnGunEngagementFire.Enabled := true;
    end;
  end
  else
  begin
    if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Fire_Cntl_Director_Req = 1 then
    begin
      btnGunEngagementAssign.Enabled := true;
      btnGunEngagementBreak.Enabled := false;
      btnGunEngagementFire.Enabled := false;
    end
    else
    begin
      btnGunEngagementAssign.Enabled := false;
      btnGunEngagementBreak.Enabled := false;
      btnGunEngagementFire.Enabled := true;
    end;

    if not(Assigned(TT3GunOnVehicle(FWeapon).TargetObject))
       or (TT3GunOnVehicle(FWeapon).TargetObject.FreeMe)
       or (TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).Dormant) then
    begin
      editGunEngagementTargetTrack.Text := '';
    end;
  end;
end;

procedure TfrmGunAutoManual.ApplyCeaseFire(Value: boolean);
begin
  if Assigned(FWeapon) and (FWeapon is TT3GunOnVehicle) then
  begin
    simMgrClient.FlashPointNGS.Visible := false;
    btnGunEngagementCease.Enabled := false;

    if TT3GunOnVehicle(FWeapon).ControlMode = 2 then begin
      //-- mode manual aj
      if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Fire_Cntl_Director_Req = 0 then
      begin
        btnGunEngagementFire.Enabled := true;
        btnGunEngagementAssign.Enabled := false;
        btnGunEngagementBreak.Enabled := false;
      end
      else
      //-- mode manual tapi fire control assigned = true
      if (TT3GunOnVehicle(FWeapon).GunDefinition.FData.Fire_Cntl_Director_Req = 1) and
         (TT3GunOnVehicle(FWeapon).IsAssigned) then
      begin
        btnGunEngagementFire.Enabled := true;
        btnGunEngagementAssign.Enabled := false;
        btnGunEngagementBreak.Enabled := true;
      end
      else
      //-- mode manual tapi fire control assigned = false
      if (TT3GunOnVehicle(FWeapon).GunDefinition.FData.Fire_Cntl_Director_Req = 1) and
         (not TT3GunOnVehicle(FWeapon).IsAssigned) then
      begin
        btnGunEngagementFire.Enabled := false;
        btnGunEngagementAssign.Enabled := true;
        btnGunEngagementBreak.Enabled := false;
      end;
    end
    else
    if TT3GunOnVehicle(FWeapon).ControlMode = 4 then
      begin
        btnGunEngagementFire.Enabled := true;
        btnGunEngagementAssign.Enabled := false;
      end
    else
    begin
      // mode otomatis
      btnGunEngagementFire.Enabled := false;
      btnGunEngagementAssign.Enabled := true;
    end;

    if not(Assigned(TT3GunOnVehicle(FWeapon).TargetObject))
       or (TT3GunOnVehicle(FWeapon).TargetObject.FreeMe)
       or (TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).Dormant)then
    begin
      editGunEngagementTargetTrack.Text := '';
    end;
  end
  else
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;
end;

procedure TfrmGunAutoManual.ApplyControlMode(Mode: integer);
begin
  case Mode of
    // automatic mode, state :
    // - salvo mode disable
    1:
    begin
      btnTargetSearch.Enabled := true;
      editGunEngagementTargetTrack.Enabled := false;
      ScrollBox3.BringToFront;
      ChaffOption(false);

      {sbControlModeAuto.down := true;
      sbControlSalvoModeSalvo.Down := true;
      sbControlSalvoModeSalvo.Enabled := false;
      sbControlSalvoModeCont.Enabled := false;}

      sbControlModeAuto.down := true;
      sbControlSalvoModeCont.down := true;
      sbControlSalvoModeCont.Enabled := true;

      if sbControlModeAuto.Enabled then
        sbControlSalvoModeSalvo.Enabled := false;

      Label10.Visible := sbControlSalvoModeSalvo.Enabled;
      editControlSalvoSize.Visible := sbControlSalvoModeSalvo.Enabled;

      if Assigned(simMgrClient.TargetPoint) then
        simMgrClient.TargetPoint.Visible := false;
    end;
    2:
    // manual mode
    begin
      btnTargetSearch.Enabled := true;
      editGunEngagementTargetTrack.Enabled := true;
      ScrollBox3.BringToFront;
      ChaffOption(false);

      sbControlModeManual.Down := true;
      sbControlSalvoModeSalvo.Enabled := true;
      sbControlSalvoModeCont.Enabled := true;

      if Assigned(simMgrClient.TargetPoint) then
        simMgrClient.TargetPoint.Visible := false;
    end;
    3:
    // chaff mode
    begin
      btnTargetSearch.Enabled := false;
      editGunEngagementTargetTrack.Enabled := false;
      ScrollBox1.BringToFront;
      ChaffOption(true);
      sbControlModeChaff.Down := true;

      if Assigned(simMgrClient.TargetPoint) then
        simMgrClient.TargetPoint.Visible := false;
    end;
    4 :                                      //mk add
    begin
      btnTargetSearch.Enabled := true;
      editGunEngagementTargetTrack.Enabled := false;
      ScrollBox4.BringToFront;
      ChaffOption(False);
      sbControlModeNGS.Down := true;
      sbControlSalvoModeSalvo.Enabled := true;
      sbControlSalvoModeCont.Enabled := true;

      //show target drop point
      if Assigned(simMgrClient.TargetPoint) then
        simMgrClient.TargetPoint.Visible := true;
    end
    else
    begin
      sbControlModeAuto.down      := false;
      sbControlSalvoModeCont.down := false;
      sbControlModeManual.Down    := false;
      sbControlModeChaff.Down     := false;
      sbControlModeNGS.Down       := false;

      if Assigned(simMgrClient.TargetPoint) then
        simMgrClient.TargetPoint.Visible := false;
    end;
  end;
end;

procedure TfrmGunAutoManual.ApplyFire(Value: boolean);
begin
  if Assigned(FWeapon) and (FWeapon is TT3GunOnVehicle) then
  begin
    if TT3GunOnVehicle(FWeapon).ControlMode = 4 then
    begin
      simMgrClient.FlashPointNGS.PosX := TT3GunOnVehicle(FWeapon).NGSFlashX;
      simMgrClient.FlashPointNGS.PosY := TT3GunOnVehicle(FWeapon).NGSFlashY;
     // simMgrClient.FlashPointNGS.Visible := true;
    end
    else
      simMgrClient.FlashPointNGS.Visible := false;

    btnGunEngagementCease.Enabled := true;
    btnGunEngagementFire.Enabled := false;
    btnGunEngagementAssign.Enabled := false;
    btnGunEngagementBreak.Enabled := false;
  end
  else
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;
end;

procedure TfrmGunAutoManual.ApplySalvoMode(Mode: integer);
begin
  case Mode of
    1 :
    begin
      sbControlSalvoModeCont.Down := true;
      Label10.Visible := False;
      editControlSalvoSize.Visible := False;
      Label5.Visible := False;
      Edit1.Visible := False;
    end;
    2 :
    begin
      sbControlSalvoModeSalvo.Down := true;
      Label10.Visible := True;
      editControlSalvoSize.Visible := True;
      Label5.Visible := True;
      Edit1.Visible := True;
    end;
  end;
end;

procedure TfrmGunAutoManual.ApplyTarget(Value: integer);
var
  tgt: TT3PlatformInstance;
  targetTrackId: string;
  dt: TSimObject;
  posX1, posX2, posY1, posY2, RangeGun: Double;
  isInsideBlindzoneGun : Boolean;
begin
  editGunEngagementTargetTrack.Text := '';

  // 1. find target
  tgt  := simMgrClient.FindT3PlatformByID(Value);

  if not Assigned(tgt) then
    tgt := simMgrClient.FindNonRealPlatformByID(Value);

  // 2. jika bukan GunOnVehicle maka keluar
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then begin
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  //3. cek target assign
  if not Assigned(tgt) then
  begin
    frmTacticalDisplay.addStatus('Targeted Platform must be set');
    TT3GunOnVehicle(FWeapon).TargetObject := nil;
    exit;
  end
  else if tgt.FreeMe or tgt.Dormant then
  begin
    frmTacticalDisplay.addStatus('Targeted is FreeMe');
    TT3GunOnVehicle(FWeapon).TargetObject := nil;
    exit;
  end;

  //4. cek range n blind zone
  posX1 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX;
  posY1 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY;
  posX2 := tgt.PosX;
  posY2 := tgt.PosY;

  RangeGun :=  CalcRange(posX1, posY1, posX2, posY2);
  isInsideBlindzoneGun := TT3GunOnVehicle(FWeapon).InsideBlindZone(tgt);

  if (RangeGun > TT3GunOnVehicle(FWeapon).GunDefinition.FData.Max_Range)
    or isInsideBlindzoneGun then
  begin
    frmTacticalDisplay.addStatus('Target in blindzone or out of range'); //mk
    TT3GunOnVehicle(FWeapon).TargetObject := nil;
    Exit;
  end;

  //5. cek gun capability
  if not CheckGunCapability(TT3PlatformInstance(tgt)) then
  begin
    frmTacticalDisplay.addStatus('Target not suitable with Gun Capability'); //mk
    TT3GunOnVehicle(FWeapon).TargetObject := nil;
    exit;
  end;

  //6. Asign ke target track
  targetTrackId := TT3PlatformInstance(tgt).Track_ID;
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    editGunEngagementTargetTrack.Text := targetTrackId
  end
  else
  begin
    dt := simMgrClient.findDetectedTrack(tgt);

    if Assigned(dt) then
      begin
        editGunEngagementTargetTrack.Text := FormatTrackNumber(
                                             TT3DetectedTrack(dt).TrackNumber);
      end
    else
    begin
      if TT3PlatformInstance(tgt).TrackNumber = 0 then
        editGunEngagementTargetTrack.Text := targetTrackId
      else
        editGunEngagementTargetTrack.Text := FormatTrackNumber
                                             (TT3PlatformInstance(tgt).TrackNumber);
    end;
  end;
end;

procedure TfrmGunAutoManual.btnBlindZoneClick(Sender: TObject);
begin
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  //Blind Zone
  with TT3GunOnVehicle(FWeapon) do
  case TSpeedButton(Sender).Tag of
    8:
    begin
      FVisibleShowBlind := True;
      if Assigned(OnShowBlind) then
        OnShowBlind(FWeapon, FVisibleShowBlind);

      ShowBlind := true;
      ShowBlindSelected := ShowBlind and FVisibleShowBlind;
      HideBlindSensor;
    end;
    9:
    begin
      FVisibleShowBlind := False;
      if Assigned(OnShowBlind) then
        OnShowBlind(FWeapon,FVisibleShowBlind);

      ShowBlind := false;
      ShowBlindSelected := ShowBlind and FVisibleShowBlind;
    end;
  end;
end;

procedure TfrmGunAutoManual.btnChaffTypeClick(Sender: TObject);
var
  pt: TPoint;
begin
  inherited;

  GetCursorPos(pt);

  if pmenuChaffType.Items.Count > 0 then
    pmenuChaffType.Popup(pt.X, pt.Y);
end;

procedure TfrmGunAutoManual.btnConvertClick(Sender: TObject);
begin
  inherited;
  //blm tau
end;

procedure TfrmGunAutoManual.btnFireALLClick(Sender: TObject);
var
  i,j : Integer;
  ve : TT3Vehicle;
  wpn : TT3Weapon;
  rGun : TRecCmd_GunFire;
begin
  inherited;
  //
  for i:=0 to simMgrClient.SimPlatforms.itemCount - 1 do
  begin
    ve := TT3Vehicle(simMgrClient.SimPlatforms.getObject(i));

    if Assigned(FTargeted) then
    begin
      if ve.InstanceIndex <> TT3PlatformInstance(FTargeted).InstanceIndex then
      begin
        for j := 0 to ve.Weapons.Count - 1 do
        begin
          wpn := TT3Weapon(ve.Weapons.Items[j]);

          if wpn is TT3GunOnVehicle then
          begin
            if (wpn.InstanceIndex = 1016) or (wpn.InstanceIndex = 432) then
            begin
              rGun.ParentPlatformID  := ve.InstanceIndex;
              rGun.GunID             := TT3GunOnVehicle(FWeapon).InstanceIndex;
              rGun.ControlMode       := TT3GunOnVehicle(FWeapon).ControlMode;
              rGun.SalvoMode         := TT3GunOnVehicle(FWeapon).SalvoMode;
              rGun.SalvoSize         := TT3GunOnVehicle(FWeapon).SalvoSize;
              rGun.GunCapacityRemain := TT3GunOnVehicle(FWeapon).Quantity;
              rGun.InterceptRange    := TT3GunOnVehicle(FWeapon).InterceptRange;
              rGun.ThresSpeed        := TT3GunOnVehicle(FWeapon).ThresholdSpeed;

//              rGun.TargetPlatformID  := 11233 ;
              rGun.TargetPlatformID  := TT3PlatformInstance(FTargeted).InstanceIndex;

              rGun.GunName   := TT3GunOnVehicle(FWeapon).InstanceName;
              rGun.pX        := TT3GunOnVehicle(FWeapon).PosX;                      //mk test
              rGun.pY        := TT3GunOnVehicle(FWeapon).PosY;
              rGun.pAltitude := TT3GunOnVehicle(FWeapon).Altitude;
              rGun.degSpotLine := TT3GunOnVehicle(FWeapon).NGSSpotLine;
              rGun.degGunLine  := TT3GunOnVehicle(FWeapon).NGSGunLine;

              //--- NGS corrections n error system
              rGun.NGSCorrMode   := TT3GunOnVehicle(FWeapon).NGSCorrMode;
              rGun.NGSRangeCorr  := TT3GunOnVehicle(FWeapon).OptRangeCorr;
              rGun.NGSDefCorr    := TT3GunOnVehicle(FWeapon).OptDefCorr;
              rGun.pXflash       := TT3GunOnVehicle(FWeapon).NGSFlashX;
              rGun.pYflash       := TT3GunOnVehicle(FWeapon).NGSFlashY;
              rGun.OrderID  := CORD_ID_fire;

              rGun.TurretID :=  TT3GunOnVehicle(FWeapon).GunDefinition.FPoint.FData.TurretID;
              SimMgrClient.netSend_CmdGunFire(rGun);
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmGunAutoManual.btnGunEngagementAssignClick(Sender: TObject);
var
  i,j  : integer;
  //fPlatform : TT3PlatformInstance;
  fPlatform : TSimObject;
  ve : TT3Vehicle;
  sensor : TT3DeviceUnit;
  posX1, posX2, posY1, posY2: Double;
  isInsideBlindZone, isInsideBlindzoneGun : Boolean;
  rFC : TRecCmd_FC;
  rGun : TRecCmd_GunFire;
  vfound, FCRfound : Boolean;
begin
  inherited;

  // 1. cek platform control
  if FControlled is TT3Vehicle then
    ve := TT3Vehicle(FControlled)
  else
    ve := nil;

  if not Assigned(ve) then
  begin
    //raise Exception.Create('Controlled platform not defined');
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    exit;
  end;

  // 2. cek apakah platform control dorman / freeMe
  if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
    exit;
  end;

  // 3. jika bukan GunOnVehicle maka keluar
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  // 4. jika tidak ada target maka keluar
  if not Assigned(TT3GunOnVehicle(FWeapon).TargetObject) then
  begin
    //raise Exception.Create('Target not selected yet');
    frmTacticalDisplay.addStatus('Target not selected yet'); //mk
    exit;
  end;

  // 5. send record
  FCRfound := false;
  for I := 0 to ve.Devices.Count - 1 do
  begin
    sensor := ve.Devices.Items[i];

    if sensor is TT3Radar then
    begin
      posX1 := TT3PlatformInstance(FControlled).PosX;
      posY1 := TT3PlatformInstance(FControlled).PosY;
      posX2 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).PosX;
      posY2 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).PosY;

      isInsideBlindZone := TT3Radar(sensor).InsideBlindZone(TT3GunOnVehicle(FWeapon).TargetObject);
      isInsideBlindzoneGun := TT3GunOnVehicle(FWeapon).InsideBlindZone(TT3GunOnVehicle(FWeapon).TargetObject);

      if (TT3Radar(sensor).RadarDefinition.FDef.Num_FCR_Channels > 0)
          and (TT3Radar(sensor).OperationalStatus = sopOn)
          and (TT3Radar(sensor).EmconOperationalStatus = EmconOff) then
      begin
        //check isExits/found
        FCRfound := True;
        vfound := False;
        frmTacticalDisplay.addStatus('STATUS');

        if TT3Radar(sensor).AssignedTrack <> nil then
        begin
          for j := 0 to TT3Radar(sensor).AssignedTrack.Count - 1 do
          begin
            fPlatform := TSimObject(TT3Radar(sensor).AssignedTrack.Items[j]);    //mk+yy 10052012

            if fPlatform = nil then
              continue;

            if fPlatform is TT3DetectedTrack then
            begin
              if ((TT3PlatformInstance(TT3DetectedTrack(fPlatform).TrackObject).InstanceIndex)
                  = (TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).InstanceIndex)) then
              begin
                vfound := True;

                //cek range
                if (CalcRange(posX1, posY1, posX2, posY2) < TT3Radar(sensor).DetectionRange)
                  and (CalcRange(posX1, posY1, posX2, posY2) < TT3GunOnVehicle(FWeapon).GunDefinition.FData.Max_Range)
                  and not isInsideBlindZone and not isInsideBlindzoneGun then
                begin
                  EmptyRec(rGun);
                  rGun.TargetPlatformID := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).InstanceIndex;
                  rGun.OrderID := CORD_ID_assign;
                  rGun.TurretID :=  TT3GunOnVehicle(FWeapon).GunDefinition.FPoint.FData.TurretID;
                  simMgrClient.netSend_CmdGunFire(rGun);

                  break;
                end;
              end;
            end
            else
            if fPlatform is TT3PlatformInstance then
            begin
              if ((TT3PlatformInstance(fPlatform).InstanceIndex) = (TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).InstanceIndex)) then
              begin
                vfound := True;

                //cek range
                if (CalcRange(posX1, posY1, posX2, posY2) < TT3Radar(sensor).DetectionRange)
                  and (CalcRange(posX1, posY1, posX2, posY2) < TT3GunOnVehicle(FWeapon).GunDefinition.FData.Max_Range)
                  and not isInsideBlindZone and not isInsideBlindzoneGun then
                begin
                  EmptyRec(rGun);
                  rGun.TargetPlatformID := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).InstanceIndex;
                  rGun.OrderID := CORD_ID_assign;
                  rGun.TurretID :=  TT3GunOnVehicle(FWeapon).GunDefinition.FPoint.FData.TurretID;
                  simMgrClient.netSend_CmdGunFire(rGun);

                  break;
                end;
              end;
            end;
          end;
        end;

        if not(vfound) then
        begin
          // gak bisa nambah lagi jika tlh sama atau melebihi kapasitas assignednya.
          if TT3Radar(sensor).AssignedTrack <> nil then
          begin
            if TT3Radar(sensor).AssignedTrack.Count >= TT3Radar(sensor).RadarDefinition.FDef.Num_FCR_Channels then
            begin
              //Exit;     //jgn exit tp continue keradar lain.
              Continue;
            end;
          end;

          if FTargeted is TT3PlatformInstance then
          begin
            rFC.PlatformID := TT3PlatformInstance(FTargeted).InstanceIndex;
          end
          else if FTargeted is TT3DetectedTrack then
          begin
            rFC.PlatformID := TT3PlatformInstance(TT3DetectedTrack(FTargeted).TrackObject).InstanceIndex;
          end;

          //cek range
          if (CalcRange(posX1, posY1, posX2, posY2) < TT3Radar(sensor).DetectionRange)
            and (CalcRange(posX1, posY1, posX2, posY2) < TT3GunOnVehicle(FWeapon).GunDefinition.FData.Max_Range)
            and not isInsideBlindZone and not isInsideBlindzoneGun then
          begin
            rFC.PlatformParentID := TT3PlatformInstance(FControlled).InstanceIndex;
            rFC.PlatformID := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).InstanceIndex;
            rFC.FCRadarID := TT3Radar(sensor).InstanceIndex;
            rFC.OrderID := CORD_FC_ASSIGN;
            simMgrClient.netSend_Cmd_FireControl(rFC);

            EmptyRec(rGun);
            rGun.TargetPlatformID := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).InstanceIndex;
            rGun.OrderID := CORD_ID_assign;
            rGun.TurretID :=  TT3GunOnVehicle(FWeapon).GunDefinition.FPoint.FData.TurretID;
            simMgrClient.netSend_CmdGunFire(rGun);

            break;
          end
          else
          begin
            frmTacticalDisplay.addStatus('Target in blindzone or out of range!!');
            Continue;
          end;
        end;
      end
      else
      begin
        if FCRfound = false then
        begin
          frmTacticalDisplay.addStatus('Not Assign Fire Control');
        end;
      end;
    end;
  end;
end;

procedure TfrmGunAutoManual.btnGunEngagementBreakClick(Sender: TObject);
var
  i,j : integer;
  rFC : TRecCmd_FC;
  rGun : TRecCmd_GunFire;
  ve : TT3Vehicle;
  sensor : TT3DeviceUnit;
  fTrack, AssTrack : TSimObject;
  vfound : Boolean;
begin
  inherited;

  // 1. cek platform control
  if FControlled is TT3Vehicle then
    ve := TT3Vehicle(FControlled)
  else
    ve := nil;

//  if not Assigned(ve) then
//  begin
//    //raise Exception.Create('Controlled platform not defined');
//    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
//    exit;
//  end;
//
//  // 2. cek apakah platform control dorman / freeMe
//  if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
//  begin
//    frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
//    exit;
//  end;

  // 3. jika bukan GunOnVehicle maka keluar
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  // 4. send record
  fTrack := TSimObject(TT3GunOnVehicle(FWeapon).TargetObject);
  if Assigned(fTrack) then
  begin
    for I := 0 to ve.Devices.Count - 1 do
    begin
      vfound := False;
      sensor := ve.Devices.Items[i];

      if sensor is TT3Radar then
      begin
        if (TT3Radar(sensor).RadarDefinition.FDef.Num_FCR_Channels > 0) then
        begin
          if TT3Radar(sensor).AssignedTrack <> nil then
          begin
            for j := 0 to TT3Radar(sensor).AssignedTrack.Count - 1 do
            begin
              AssTrack := TSimObject(TT3Radar(sensor).AssignedTrack.Items[j]);
              if AssTrack = nil then  Continue;

              if AssTrack is TT3DetectedTrack then
              begin
                if (TT3PlatformInstance(TT3DetectedTrack(AssTrack).TrackObject).InstanceIndex) = (TT3PlatformInstance(fTrack).InstanceIndex) then
                begin
                  vfound := True;
                  break;
                end;
              end
              else
              if AssTrack is TT3PlatformInstance then
              begin
                if (TT3PlatformInstance(AssTrack).InstanceIndex) = (TT3PlatformInstance(fTrack).InstanceIndex) then
                begin
                  vfound := True;
                  break;
                end;
              end;
            end;
          end;

          if vfound then
          begin
            rFC.PlatformParentID := TT3PlatformInstance(FControlled).InstanceIndex;
            //rFC.PlatformID := 0; //TT3PlatformInstance(lstFireControlAssetsAssignedTracks.Selected.Data).InstanceIndex;

            if fTrack is TT3PlatformInstance then
            begin
              rFC.PlatformID := TT3PlatformInstance(fTrack).InstanceIndex;
            end
            else if fTrack is TT3DetectedTrack then
            begin
              rFC.PlatformID := TT3PlatformInstance(TT3DetectedTrack(fTrack).TrackObject).InstanceIndex;
            end;

            rFC.FCRadarID := TT3Radar(sensor).InstanceIndex;

            if rFC.PlatformID = 0 then
            begin
              rFC.OrderID := CORD_FC_BREAKALL;
              simMgrClient.netSend_Cmd_FireControl(rFC);
              break;
            end
            else
            begin
              rFC.OrderID := CORD_FC_BREAK;
              simMgrClient.netSend_Cmd_FireControl(rFC);
            end;

            //simMgrClient.netSend_Cmd_FireControl(rFC);
            //break;
          end;
        end;
      end;
    end;
  end;

  EmptyRec(rGun);
  rGun.OrderID := CORD_ID_break;
  rGun.NGSBearing := 0;
  rGun.NGSElevation := 0;
  simMgrClient.netSend_CmdGunFire(rGun);
end;

procedure TfrmGunAutoManual.btnGunEngagementCeaseClick(Sender: TObject);
var
  rGun : TRecCmd_GunFire;
begin
  inherited;

//  // 1. cek platform control
//  if not(Assigned(FControlled)) then
//  begin
//    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
//    exit;
//  end;
//
//  // 2. cek apakah platform control dorman / freeMe
//  if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
//  begin
//    frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
//    exit;
//  end;

  // 3. jika bukan GunOnVehicle maka keluar
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  EmptyRec(rGun);
  rGun.OrderID := CORD_ID_cease;
  simMgrClient.netSend_CmdGunFire(rGun);
end;

procedure TfrmGunAutoManual.btnGunEngagementFireClick(Sender: TObject);
var
  rGun : TRecCmd_GunFire;
  TargetId, i, j : Integer;
  tgt : TT3PlatformInstance;
  posX1, posX2, posY1, posY2, RangeGun: Double;
  isInsideBlindzoneGun : Boolean;
  fPlatform : TSimObject;
  ve : TT3Vehicle;
  sensor : TT3DeviceUnit;
  vfound : Boolean;
begin
  inherited;

  // 1. cek platform control
  if not(Assigned(FControlled)) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    exit;
  end;

  // 2. cek apakah platform control dorman / freeMe
  if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
    exit;
  end;

  // 3. jika bukan GunOnVehicle maka keluar
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  // 4. Send record
  if (TT3GunOnVehicle(FWeapon).ControlMode <> 4) and (TT3GunOnVehicle(FWeapon).ControlMode <> 3)then
  begin
    //1. Cek apakah target nil atau dorman
    if not(Assigned(TT3GunOnVehicle(FWeapon).TargetObject)) or (TT3GunOnVehicle(FWeapon).TargetObject.FreeMe)
        or (TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).Dormant) then
    begin
      if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Fire_Cntl_Director_Req = 1 then
      begin
        EmptyRec(rGun);
        rGun.OrderID := CORD_ID_break;
        simMgrClient.netSend_CmdGunFire(rGun);

        TT3GunOnVehicle(FWeapon).TargetObject := nil;
        editGunEngagementTargetTrack.Text := '';

        frmTacticalDisplay.addStatus('Target not selected yet'); //mk
        Exit;
      end
      else
      begin
        TT3GunOnVehicle(FWeapon).TargetObject := nil;
        editGunEngagementTargetTrack.Text := '';

        //raise Exception.Create('Target not selected yet');
        frmTacticalDisplay.addStatus('Target not selected yet'); //mk
        Exit;
      end;
    end
    else
    begin
      if TT3GunOnVehicle(FWeapon).TargetObject is TT3DetectedTrack then
        TargetId := TT3PlatformInstance(TT3DetectedTrack(TT3GunOnVehicle(FWeapon).TargetObject).TrackObject).InstanceIndex
      else if TT3GunOnVehicle(FWeapon).TargetObject is TT3PlatformInstance then
        TargetId := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).InstanceIndex
      else
      begin
        frmTacticalDisplay.addStatus('Target not suitable'); //mk
        Exit;
      end;

      tgt := simMgrClient.FindT3PlatformByID(TargetId);
      if not(Assigned(tgt)) then
      begin
        frmTacticalDisplay.addStatus('Target not selected yet'); //mk
        Exit;
      end;

      posX1 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX;
      posY1 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY;
      posX2 := tgt.PosX;
      posY2 := tgt.PosY;
      RangeGun :=  CalcRange(posX1, posY1, posX2, posY2);
      isInsideBlindzoneGun := TT3GunOnVehicle(FWeapon).InsideBlindZone(tgt);

      //2. Cek apakah target masih dlm range n di dlm blinzone
      if (RangeGun > TT3GunOnVehicle(FWeapon).GunDefinition.FData.Max_Range)
        or isInsideBlindzoneGun then
      begin
        if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Fire_Cntl_Director_Req = 1 then
        begin
          EmptyRec(rGun);
          rGun.OrderID := CORD_ID_break;
          simMgrClient.netSend_CmdGunFire(rGun);

          TT3GunOnVehicle(FWeapon).TargetObject := nil;
          editGunEngagementTargetTrack.Text := '';

          frmTacticalDisplay.addStatus('Target in blindzone or out of range'); //mk
          Exit;
        end
        else
        begin
          TT3GunOnVehicle(FWeapon).TargetObject := nil;
          editGunEngagementTargetTrack.Text := '';

          frmTacticalDisplay.addStatus('Target in blindzone or out of range'); //mk
          Exit;
        end;
      end;

      //3. Cek apakah target masih ada di dlm list fc
      if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Fire_Cntl_Director_Req = 1 then
      begin
        ve := TT3Vehicle(TT3GunOnVehicle(FWeapon).Parent);
        if not Assigned(ve) then
        begin
          frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
          exit;
        end;

        vfound := False;
        for I := 0 to ve.Devices.Count - 1 do
        begin
          sensor := ve.Devices.Items[i];

          if sensor is TT3Radar then
          begin
            if (TT3Radar(sensor).RadarDefinition.FDef.Num_FCR_Channels > 0) then
            begin
              //check isExits/found
              if TT3Radar(sensor).AssignedTrack <> nil then
              begin
                for j := 0 to TT3Radar(sensor).AssignedTrack.Count - 1 do
                begin
                  fPlatform := TSimObject(TT3Radar(sensor).AssignedTrack.Items[j]);
                  if fPlatform = nil then continue;

                  if fPlatform is TT3DetectedTrack then
                  begin
                    if ((TT3PlatformInstance(TT3DetectedTrack(fPlatform).TrackObject).InstanceIndex)
                        = (TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).InstanceIndex)) then
                    begin
                      vfound := True;
                      Break;
                    end;
                  end
                  else
                  if fPlatform is TT3PlatformInstance then
                  begin
                    if ((TT3PlatformInstance(fPlatform).InstanceIndex) = (TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).InstanceIndex)) then
                    begin
                      vfound := True;
                      break;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;

        if not(vfound) then
        begin
          EmptyRec(rGun);
          rGun.OrderID := CORD_ID_break;
          simMgrClient.netSend_CmdGunFire(rGun);

          TT3GunOnVehicle(FWeapon).TargetObject := nil;
          editGunEngagementTargetTrack.Text := '';

          frmTacticalDisplay.addStatus('Target Not Assign in Fire Control'); //mk
          Exit;
        end;
      end;
    end;
  end
  else if TT3GunOnVehicle(FWeapon).ControlMode = 4 then
  begin
    posX1 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX;
    posY1 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY;
    posX2 := TT3GunOnVehicle(FWeapon).NGSFlashX;
    posY2 := TT3GunOnVehicle(FWeapon).NGSFlashY;
    RangeGun :=  CalcRange(posX1, posY1, posX2, posY2);
    isInsideBlindzoneGun := TT3GunOnVehicle(FWeapon).InsideBlindZonePos(posX2, posY2);

    if (RangeGun > TT3GunOnVehicle(FWeapon).GunDefinition.FData.Max_Range)
        or isInsideBlindzoneGun then
    begin
      frmTacticalDisplay.addStatus('Target Point in blindzone or out of range'); //mk
      Exit;
    end;

//    simMgrClient.FlashPointNGS.PosX := TT3GunOnVehicle(FWeapon).NGSFlashX;
//    simMgrClient.FlashPointNGS.PosY := TT3GunOnVehicle(FWeapon).NGSFlashY;
    //simMgrClient.FlashPointNGS.Visible := True;
  end;

  //4. If OK => Fire Gun
  case TT3GunOnVehicle(FWeapon).ControlMode of
    1,2:
    begin;
      if not Assigned(TT3GunOnVehicle(FWeapon).TargetObject) then
      begin
        //raise Exception.Create('Target not selected yet')
        frmTacticalDisplay.addStatus('Target not selected yet'); //mk
        Exit;
      end
      else
      begin
        if TT3GunOnVehicle(FWeapon).Quantity <= 0 then
        begin
          frmTacticalDisplay.addStatus('Weapon quantity <= 0'); //mk
          Exit;
        end;

        EmptyRec(rGun);
        rGun.OrderID  := CORD_ID_fire;
        rGun.TurretID :=  TT3GunOnVehicle(FWeapon).GunDefinition.FPoint.FData.TurretID;
        SimMgrClient.netSend_CmdGunFire(rGun);

        // enable waktu terima hasil shoot dari server
//        btnGunEngagementFire.Enabled := false;
//        btnGunEngagementCease.Enabled := true;
      end;
    end;
    3 : ChaffFiring(Sender);
    4 :
    begin
      if TT3GunOnVehicle(FWeapon).Quantity <= 0 then
      begin
        frmTacticalDisplay.addStatus('Weapon quantity <= 0'); //mk
        Exit;
      end;

      EmptyRec(rGun);
      rGun.OrderID  := CORD_ID_fire;
      rGun.TurretID :=  TT3GunOnVehicle(FWeapon).GunDefinition.FPoint.FData.TurretID;
      SimMgrClient.netSend_CmdGunFire(rGun);

      // enable waktu terima hasil shoot dari server
//      btnGunEngagementFire.Enabled := false;
//      btnGunEngagementCease.Enabled := true;
    end;
  end;
end;

procedure TfrmGunAutoManual.btnGunModeClick(Sender: TObject);
var
  rGun : TRecCmd_GunFire;
begin
  // 1. cek platform control
  if not(Assigned(FControlled)) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    exit;
  end;

  // 2. cek apakah platform control dorman / freeMe
  if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
    exit;
  end;

  // 3. jika bukan GunOnVehicle maka keluar
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  // 4. cek apakah gun sedang fire
  if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then
  begin
    EmptyRec(rGun);
    rGun.OrderID := CORD_ID_cease;
    simMgrClient.netSend_CmdGunFire(rGun);
  end;

  // Gun Mode
  EmptyRec(rGun);

  with TT3GunOnVehicle(FWeapon) do
  begin
    case TSpeedButton(Sender).Tag of
      1: rGun.ControlMode := 1;
      2: rGun.ControlMode := 2;
      3: rGun.ControlMode := 3;
      14: rGun.ControlMode := 4;          //mk add
    end;
  end;

  rGun.OrderID := CORD_ID_control_mode;
  simMgrClient.netSend_CmdGunFire(rGun);

//  if TSpeedButton(Sender).Down then
//    TSpeedButton(Sender).Down := false;
end;

procedure TfrmGunAutoManual.btnGunSalvoClick(Sender: TObject);
var
  rGun : TRecCmd_GunFire;
begin
  // 1. cek platform control
  if not(Assigned(FControlled)) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    exit;
  end;

  // 2. cek apakah platform control dorman / freeMe
  if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
    exit;
  end;

  // 3. jika bukan GunOnVehicle maka keluar
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  // 4. cek apakah gun sedang fire
  if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then begin
    frmTacticalDisplay.addStatus('Weapon is firing, please stop its before!'); //mk
    exit;
  end;

  // 5. Salvo Mode
  EmptyRec(rGun);

  with TT3GunOnVehicle(FWeapon) do
  begin
    case TSpeedButton(Sender).Tag of
      4: rGun.SalvoMode := 1;
      5: rGun.SalvoMode := 2;
    end;
  end;

  rGun.OrderID := CORD_ID_salvo_mode;
  simMgrClient.netSend_CmdGunFire(rGun);

//  if TSpeedButton(Sender).Down then
//    TSpeedButton(Sender).Down := false;
end;

procedure TfrmGunAutoManual.btnInterceptClick(Sender: TObject);
begin
  // Intercept
end;

procedure TfrmGunAutoManual.btnPositionClick(Sender: TObject);
begin
  inherited;
  VSimMap.FMap.CurrentTool := mtDeployChaff;
end;

procedure TfrmGunAutoManual.btnRangeClick(Sender: TObject);
begin
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  // Show Hide Range
  with TT3GunOnVehicle(FWeapon) do
  begin
    case TSpeedButton(Sender).Tag of
      6:
      begin
        FVisibleShowRange := True;
        if Assigned(OnShowBlind) then
          OnShowBlind(FWeapon, FVisibleShowRange);

        ShowRange := true;
        ShowRangeSelected := ShowRange and FVisibleShowRange;

        HideRangeSensor;
      end;
      7:
      begin
        FVisibleShowRange := False;
        if Assigned(OnShowBlind) then
          OnShowBlind(FWeapon,FVisibleShowRange);

        ShowRange := false;
        ShowRangeSelected := ShowRange and FVisibleShowRange;
      end;
    end;
  end;
end;

procedure TfrmGunAutoManual.btnSetupClick(Sender: TObject);
begin
  if not Assigned(frmNGSGunSetup) then
    frmNGSGunSetup := TfrmNGSGunSetup.Create(self);

  frmNGSGunSetup.FormStyle := fsStayOnTop;
  frmNGSGunSetup.PlatformCtrld := FControlled;
  frmNGSGunSetup.Weapon := FWeapon;
  frmNGSGunSetup.SetDataWeapon(FWeapon);
  frmNGSGunSetup.ClearFlagPoint;

  frmNGSGunSetup.Show;
end;

//function TfrmGunAutoManual.SetChaffType(Sender: TT3PlatformInstance) : string;
//var
//  i       : integer;
//  //ecm     : TT3CounterMeasure;
//  device  : TT3DeviceUnit;
//begin
//  result := '';
//
//  if (not Assigned(FControlled)) then
//  begin
//    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
//    Exit;
//  end;
//
//  for i := 0 to TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Count - 1 do
//  begin
//    device := TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Items[i];
//    if not (device is TT3CounterMeasure) then
//      continue;
//
//    if device is TT3ChaffLauncher then
//      continue;
//
//    //ecm := TT3CounterMeasure(device);
//    if not (device is TT3ChaffOnVehicle) then
//      continue;
//
//    result := TT3ChaffOnVehicle(device).InstanceName;
//    break;
//  end;
//end;

procedure TfrmGunAutoManual.ChaffFiring(Sender : TObject);
var
  i : Integer;
  rLauncher     : TRecCmd_LaunchChaffState;
  rLauncherProp : TRecCmd_ChaffLauncherProperties;
  device  : TT3DeviceUnit;
  lc : TObject;
  blmRange, blmAlt : Double;
begin
  inherited;

  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  if (TryStrToFloat(edtBloomPosition.Text,blmRange)) and (TryStrToFloat(edtBloomAltitude.Text,blmAlt)) then
  begin
    //TryStrToFloat(edtBloomPosition.Text,blmRange);
    //TryStrToFloat(edtBloomAltitude.Text,blmAlt);

    if (not Assigned(FControlled)) then
    begin
      frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
      Exit;
    end;

    for i := 0 to TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Count - 1 do
    begin
      device := TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Items[i];

      if not (device is TT3ChaffOnVehicle) then
        continue;

      if TT3ChaffOnVehicle(device).Status = esDamaged then
        continue;

      if (TT3ChaffOnVehicle(device).ChaffLaunchers.Count > 0)
         and (TT3ChaffOnVehicle(device).InstanceName = edtChaffType.Text) then
      begin
        lc := TT3ChaffOnVehicle(device).ChaffLaunchers.Items[TT3ChaffOnVehicle(device).Launcher];

        if (blmRange > TT3ChaffLauncher(lc).BloomRange)then
        begin
          frmTacticalDisplay.addStatus('Bloom Position over than maximum : '
                                        +FloatToStr(TT3ChaffLauncher(lc).BloomRange)); //mk
          exit;
        end
        else
        if (blmAlt > TT3ChaffLauncher(lc).BloomAltitude) then
        begin
          frmTacticalDisplay.addStatus('Bloom Altitude over than maximum : '
                                        +FloatToStr(TT3ChaffLauncher(lc).BloomAltitude)); //mk
          exit;
        end
        else
        if (TT3GunOnVehicle(FWeapon).InsideBlindZonePos(FChaffPosX, FChaffPosY)) then
        begin
          frmTacticalDisplay.addStatus('Chaff in blindzone'); //mk
          exit;
        end;

        with rLauncherProp do
        begin
          ParentPlatformID  := TT3Vehicle(FControlled).InstanceIndex; //TT3PlatformInstance(TT3ChaffLauncher(lc).Parent).InstanceIndex;
          LauncherID        := TT3ChaffLauncher(lc).Number;
          Delay             := TT3ChaffLauncher(lc).Delay;
          SalvoSize         := 1;
          BloomRange        := blmRange;
          BloomAltitude     := blmAlt;
          Bearing           := TT3ChaffLauncher(lc).Angle;
          MapPositionX      := FChaffPosX;
          MapPositionY      := FChaffPosY;
          IDState           := 1;
        end;
        SimMgrClient.netSend_CmdLauncherChaffProp(rLauncherProp);

        rLauncher.ParentPlatformID := TT3Vehicle(FControlled).InstanceIndex; //TT3PlatformInstance(TT3ChaffOnVehicle(device).Parent).InstanceIndex;
        rLauncher.ChaffOnVehicleID := TT3ChaffOnVehicle(device).InstanceIndex;
        rLauncher.LauncherID       := TT3ChaffOnVehicle(device).Launcher;
        //rLauncher.SessionID        := simMgrClient.SessionID;
        if Sender.ClassType = TButton then
        case TButton(Sender).Tag of
          3:
            begin
              if TT3ChaffOnVehicle(device).Quantity <= 0 then exit;
              if TT3ChaffOnVehicle(device).ChaffLaunchers.Count < TT3ChaffOnVehicle(device).Launcher then exit;

              rLauncher.StateID := 1;
              SimMgrClient.netSend_CmdLaunchChaffState(rLauncher);
            end;
          4:
           begin
             if TT3ChaffOnVehicle(device).ChaffLaunchers.Count < TT3ChaffOnVehicle(device).Launcher then exit;

              rLauncher.StateID := 0;
              SimMgrClient.netSend_CmdLaunchChaffState(rLauncher);
           end;
        end;

        lblQuantityChaff.Caption := IntToStr(TT3ChaffOnVehicle(device).Quantity - 1);
        Break;
      end;
    end;
  end;
end;

procedure TfrmGunAutoManual.ChaffItemMenu;
var
  Item    : TMenuItem;
  device  : TT3DeviceUnit;
  ve      : TT3Vehicle;
  i       : integer;
  //wpnName : string;
begin
  pmenuChaffType.Items.Clear;

  if (not Assigned(FControlled)) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    Exit;
  end;

  if FControlled is TT3Vehicle then
    ve := TT3Vehicle(FControlled)
  else
    ve := nil;

  if (not Assigned(ve)) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is not vehicle'); //mk
    Exit;
  end;

  if FWeapon is TT3GunOnVehicle then
  begin
    if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Chaff_Capable_Gun = 1 then
    begin
      //FChaffType := SetChaffType(TT3PlatformInstance(FControlled));
      for i := 0 to ve.Devices.Count - 1 do
      begin
        device := TT3DeviceUnit(ve.Devices.Items[i]);
        if not (device is TT3CounterMeasure) then
          continue;

        if device is TT3ChaffLauncher then
          continue;

        if not (device is TT3ChaffOnVehicle) then
          continue;

        FChaffType := device.InstanceName;
        if not IfExistItem(pmenuChaffType, FChaffType) then
        begin
          Item := TMenuItem.Create(self);
          Item.OnClick := OnChaffTypeItemSelected;
          Item.Caption := FChaffType;
          item.Tag     := Byte(FChaffCategory);
          pmenuChaffType.Items.Add(Item);
          edtChaffType.Text := FChaffType;
        end;
      end;
    end;
  end;
end;

procedure TfrmGunAutoManual.OnChaffTypeItemSelected(Sender: TObject);
var
  ChaffType : String;
  nLauncer: Integer;
  device  : TObject; //TT3DeviceUnit;
  lc : TObject;
begin
  ChaffType := TMenuItem(Sender).Caption;
  ChaffType := DeleteAmpersand(ChaffType);
  //nLauncer := 0;

  edtChaffType.Text := ChaffType;

  if (not Assigned(FControlled)) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    Exit;
  end;

  device := TT3Vehicle(FControlled).getDevice(ChaffType, TT3ChaffOnVehicle);
  if not Assigned(device) then
    Exit;

  lblQuantityChaff.Caption  := IntToStr(TT3ChaffOnVehicle(device).Quantity);
  nLauncer := TT3ChaffOnVehicle(device).Launcher;

  if Assigned(TT3ChaffOnVehicle(device).ChaffLaunchers)
  and (TT3ChaffOnVehicle(device).ChaffLaunchers.Count > 0) then
  begin
    lc := TT3ChaffOnVehicle(device).ChaffLaunchers.Items[nLauncer];
    SetRangeChaff(TT3Vehicle(TT3PlatformInstance(FControlled)).PosX,TT3Vehicle(TT3PlatformInstance(FControlled)).PosY,TT3ChaffLauncher(lc).BloomRange);
    edtBloomAltitude.Text :=  FloatToStr(TT3ChaffLauncher(lc).BloomAltitude);
  end;

//  for i := 0 to TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Count - 1 do
//  begin
//    device := TT3Vehicle(TT3PlatformInstance(FControlled)).Devices.Items[i];
//
//    if not (device is TT3ChaffOnVehicle) then continue;
//
//    if (TT3ChaffOnVehicle(device).InstanceName = ChaffType) then
//    begin
//      lblQuantityChaff.Caption  := IntToStr(TT3ChaffOnVehicle(device).Quantity);
//
//      nLauncer := TT3ChaffOnVehicle(device).Launcher - 1;
//      if Assigned(TT3ChaffOnVehicle(device).ChaffLaunchers)
//         and (TT3ChaffOnVehicle(device).ChaffLaunchers.Count > 0) then
//      begin
//        lc := TT3ChaffOnVehicle(device).ChaffLaunchers.Items[nLauncer];
//        SetRangeChaff(TT3Vehicle(TT3PlatformInstance(FControlled)).PosX,TT3Vehicle(TT3PlatformInstance(FControlled)).PosY,TT3ChaffLauncher(lc).BloomRange);
//        edtBloomAltitude.Text :=  FloatToStr(TT3ChaffLauncher(lc).BloomAltitude);
//      end;
//
//      Break;
//    end;
//  end;
end;

procedure TfrmGunAutoManual.OnGunChaffPosChange(Sender : TObject;Props : TPropsID; ValueX, ValueY: double);
begin
  FChaffPosX := ValueX;
  FChaffPosY := ValueY;

  edtBloomPosition.Text := formatDM_longitude(ValueX) + ' ' + formatDM_latitude(ValueY);
end;

procedure TfrmGunAutoManual.ChaffOption(Value: boolean);
begin
  lblSalvoMode.Visible := not Value;
  sbControlSalvoModeSalvo.Visible := not Value;
  sbControlSalvoModeCont.Visible := not Value;
  //lblIntercept.Visible := not Value;
  //sbGunEngagementDisplayInterceptShow.Visible := not Value;
  //sbGunEngagementDisplayInterceptHide.Visible := not Value;
  btnGunEngagementAssign.Visible := not Value;
  btnGunEngagementBreak.Visible := not Value;
  
  if TT3GunOnVehicle(FWeapon).ControlMode = 4 then
  begin
    btnGunEngagementFire.Enabled := True;
    btnGunEngagementAssign.Enabled := False;
    btnGunEngagementBreak.Enabled := False;
  end
  else
  begin
    if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Fire_Cntl_Director_Req = 1 then
    begin
      if (TT3GunOnVehicle(FWeapon).IsAssigned) then
      begin
        if Value then
          btnGunEngagementFire.Enabled := Value
        else
          btnGunEngagementFire.Enabled := not Value;

        btnGunEngagementAssign.Enabled := Value;
        btnGunEngagementBreak.Enabled := not Value;
      end
      else
      begin
        btnGunEngagementAssign.Enabled := not Value;
        btnGunEngagementFire.Enabled := Value;
        btnGunEngagementBreak.Enabled := Value;
      end;
    end
    else
    begin
      btnGunEngagementAssign.Enabled := False;
      btnGunEngagementFire.Enabled := True;
    end;
  end;

  btnGunEngagementCease.Enabled := false;
end;

procedure TfrmGunAutoManual.Empty;
begin
  editControlSalvoSize.Text  := '1';
  editAutofireIntercept.Text := '0.0';
  editAutofireThreshold.Text := '0.0';
  editGunEngagementTargetTrack.Text := '';

  sbGunEngagementDisplayRangeHide.Down := true;
  sbGunEngagementDisplayBlindHide.Down := true;
  sbGunEngagementDisplayInterceptHide.Down := true;

  btnGunEngagementAssign.Enabled := false;
  btnGunEngagementCease.Enabled := false;
  btnGunEngagementBreak.Enabled := false;
  btnGunEngagementFire.Enabled := false;

  lblGunEngagementStatus.Caption := 'Unavailable';
  lbGunEngagementQuantity.Caption := '--';

  edtChaffType.Text := '';
  lblQuantityChaff.Caption := '--';
  edtBloomPosition.Text := '';
  edtBloomAltitude.Text := '0.0';

  Spot1.Text  := '0.0';
  Spot2.Text  := '0.0';

  btnTargetSearch.Enabled := false;

  if Assigned(FWeapon) and Assigned(FGunListener) then
  begin
    if FWeapon is TT3GunOnVehicle then
    begin
      TT3GunOnVehicle(FWeapon).removeListener('AUTOMANUALLISTENER');
    end;
  end;
end;

procedure TfrmGunAutoManual.EmptyRec(var rGun: TRecCmd_GunFire);
begin
  with rGun do
  begin
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
      pX        := TT3GunOnVehicle(FWeapon).PosX;                      //mk test
      pY        := TT3GunOnVehicle(FWeapon).PosY;
      pAltitude := TT3GunOnVehicle(FWeapon).Altitude;
      degSpotLine := TT3GunOnVehicle(FWeapon).NGSSpotLine;
      degGunLine  := TT3GunOnVehicle(FWeapon).NGSGunLine;

      //--- NGS corrections n error system
      NGSCorrMode   := TT3GunOnVehicle(FWeapon).NGSCorrMode;
      NGSRangeCorr  := TT3GunOnVehicle(FWeapon).OptRangeCorr;
      NGSDefCorr    := TT3GunOnVehicle(FWeapon).OptDefCorr;
      pXflash       := TT3GunOnVehicle(FWeapon).NGSFlashX;
      pYflash       := TT3GunOnVehicle(FWeapon).NGSFlashY;
      NGSBearing    := TT3GunOnVehicle(FWeapon).NGSBearing;
      NGSElevation  := TT3GunOnVehicle(FWeapon).NGSElevation;
      //ChaffType := TT3GunOnVehicle(FWeapon).ChaffType;
      ChaffBloom := TT3GunOnVehicle(FWeapon).ChaffBloom;
      ChaffX := TT3GunOnVehicle(FWeapon).ChaffPosX;
      ChaffY := TT3GunOnVehicle(FWeapon).ChaffPosY;
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
      degSpotLine   := 0;
      degGunLine    := 0;

      //--- NGS corrections n error system
      NGSCorrMode   := 0;
      NGSRangeCorr  := 0;
      NGSDefCorr    := 0;
      pXflash   := 0;
      pYflash   := 0;
      NGSBearing    := 0;
      NGSElevation  := 0;
      ChaffX := 0;
      ChaffY := 0;
    end;

    OrderID           := 0;
    HitProbability    := 0;
  end;
end;

procedure TfrmGunAutoManual.OnPropertyBoolChange(Sender : TObject; Props: TPropsID;
  Value: Boolean);
begin
  if Assigned(FWeapon) and Assigned(Sender) then
  begin
    if TT3Unit(FWeapon).InstanceIndex = TT3Unit(Sender).InstanceIndex then
    begin
      case Props of
        psAssigned  : ApplyAssigned(Value);
        psCeaseFire : ApplyCeaseFire(Value);
      end;
    end;
  end;
end;

procedure TfrmGunAutoManual.OnPropertyByteChange(Sender : TObject; Props: TPropsID; Value: Byte);
begin
  if Assigned(FWeapon) and Assigned(Sender) then
  begin
    if TT3Unit(FWeapon).InstanceIndex = TT3Unit(Sender).InstanceIndex then
    begin
      case Props of
        psWeaponStatus :
          case TWeaponStatus(Value) of
            wsAvailable   : lblGunEngagementStatus.Caption   := 'Available';
            wsUnavailable : lblGunEngagementStatus.Caption   := 'Unavailable';
            wsDamaged     : lblGunEngagementStatus.Caption   := 'Damaged';
            wsFiring      :
              begin
                lblGunEngagementStatus.Caption   := 'Firing';

                ApplyFire(True);
              end;
          end;
      end;
    end;
  end;
end;

procedure TfrmGunAutoManual.OnPropertyDblChange(Sender : TObject; Props: TPropsID; Value: Double);
begin
  if Assigned(FWeapon) and Assigned(Sender) then
  begin
    if TT3Unit(FWeapon).InstanceIndex = TT3Unit(Sender).InstanceIndex then
    begin
      case Props of
        psInterceptRgn : editAutofireIntercept.Text := FormatFloat('##.##', Value);
        psThresSpeed   : editAutofireThreshold.Text := FormatFloat('##.##', Value);
        psNGScorrectLR :
          begin
            lblLR.Caption := FormatFloat('00.00', (Value * C_Meter_To_NauticalMile));
            Spot1.Text    := '0.0';
          end;
        psNGScorrectDA :
          begin
            lblDA.Caption := FormatFloat('0.0', Value);
            Spot2.Text := '0.0';
          end;
      end;
    end;
  end;
end;

procedure TfrmGunAutoManual.OnPropertyIntChange(Sender : TObject; Props: TPropsID; Value: Integer);
begin
  if Assigned(FWeapon) and Assigned(Sender) then
  begin
    if TT3Unit(FWeapon).InstanceIndex = TT3Unit(Sender).InstanceIndex then
    begin
      case Props of
        psControlMode : ApplyControlMode(Value);
        psSalvoMode   : ApplySalvoMode(Value);
        psSetTarget   : ApplyTarget(Value);
        psSalvoSize   : editControlSalvoSize.Text := IntToStr(Value);
        psQuantity    : lbGunEngagementQuantity.Caption := IntToStr(Value);
        psChaffBloom  : edtBloomAltitude.Text := IntToStr(Value);
      end;
    end;
  end;
end;

procedure TfrmGunAutoManual.SetRangeChaff(X, Y, Range : double);
var
  rGun : TRecCmd_GunFire;
begin
  EmptyRec(rGun);
  rGun.OrderID := CORD_ID_chaff_pos;
  rGun.ChaffX := X;
  rGun.ChaffY := Y;
  FChaffPosX := X;
  FChaffPosY := Y;

  edtBloomPosition.Text := FormatFloat('0.00', Range);

  simMgrClient.netSend_CmdGunFire(rGun);
end;

procedure TfrmGunAutoManual.Spot1KeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;
end;

procedure TfrmGunAutoManual.SetProperties;
begin
  inherited;

  if (not Assigned(FWeapon)) or (not (FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    empty;
    exit;
  end;

  // -- set listener for this object
  FGunListener := TT3GunOnVehicleListener.Create;
  TT3GunOnVehicle(FWeapon).addListener(FGunListener);
  FGunListener.ListenerID := 'AUTOMANUALLISTENER';
  FGunListener.OnPropertyIntChange  := OnPropertyIntChange;
  FGunListener.OnPropertyDblChange  := OnPropertyDblChange;
  FGunListener.OnPropertyBoolChange := OnPropertyBoolChange;
  FGunListener.OnPropertyByteChange := OnPropertyByteChange;
  FGunListener.OnChaffPosition      := OnGunChaffPosChange;
  // -- end

  // -- set default
  if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Chaff_Capable_Gun = 1 then
  begin
    ChaffItemMenu;
    //sbControlModeChaff.Enabled := True;
  end
  else
  begin
    //sbControlModeChaff.Enabled := False;
  end;

  if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Automode_Capable = 1 then
    sbControlModeAuto.Visible := True
  else
    sbControlModeAuto.Visible := False;

  if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Fire_Cntl_Director_Req = 1 then
  begin
    if TT3GunOnVehicle(FWeapon).ControlMode = 4 then
    begin
      btnGunEngagementAssign.Enabled := false;
      btnGunEngagementBreak.Enabled := False;
      btnGunEngagementFire.Enabled := True;
      btnGunEngagementCease.Enabled := false;
    end
    else
    begin
      btnGunEngagementAssign.Enabled := True;
      btnGunEngagementBreak.Enabled := False;
      btnGunEngagementFire.Enabled := False;
      btnGunEngagementCease.Enabled := false;
    end;
  end
  else
  begin
    btnGunEngagementAssign.Enabled := False;
    btnGunEngagementBreak.Enabled := False;
    btnGunEngagementFire.Enabled := True;
    btnGunEngagementCease.Enabled := false;
  end;

  if TT3GunOnVehicle(FWeapon).GunDefinition.FData.NGS_Capable = 1 then  //mk add
  begin
    sbControlModeNGS.Visible :=  True;
  end
  else
  begin
    sbControlModeNGS.Visible :=  False;
  end;
  // -- end

  with TT3GunOnVehicle(FWeapon) do
  begin
    if ShowRange then sbGunEngagementDisplayRangeShow.Down := true
    else sbGunEngagementDisplayRangeHide.Down := true;

    if ShowBlind then sbGunEngagementDisplayBlindShow.Down := true
    else sbGunEngagementDisplayBlindHide.Down := true;

    ApplyControlMode(ControlMode);
    ApplySalvoMode(SalvoMode);

    if Assigned(TargetObject) then
    begin
      //if (TargetObject <> nil) and (TargetObject is TT3PlatformInstance) then
      //begin
        //MessageDlg(TargetObject.ClassName,mtInformation,mbYesNo,0);
        ApplyTarget(TT3PlatformInstance(TargetObject).InstanceIndex);
      //end;
    end
    else
      editGunEngagementTargetTrack.Text := '---';

    lbGunEngagementQuantity.Caption := IntToStr(Quantity);
    lblQuantityChaff.Caption := '--';
    editControlSalvoSize.Text := IntToStr(SalvoSize);
    editAutofireIntercept.Text := FormatFloat('00.00', InterceptRange);
    editAutofireThreshold.Text := FormatFloat('00.00', ThresholdSpeed);

    if (ChaffPosX = 0) and (ChaffPosY = 0) then
      edtBloomPosition.Text := '---'
    else
      OnGunChaffPosChange(nil,psChaffPosition,ChaffPosX,ChaffPosY);

    edtBloomAltitude.Text := IntToStr(ChaffBloom);

    case WeaponStatus of
      wsAvailable   :
        begin
          lblGunEngagementStatus.Caption   := 'Available';
          btnGunEngagementCease.Enabled := false;
        end;
      wsUnavailable : lblGunEngagementStatus.Caption   := 'Unavailable';
      wsDamaged     : lblGunEngagementStatus.Caption   := 'Damaged';
      wsFiring      :
        begin
          lblGunEngagementStatus.Caption   := 'Firing';
          btnGunEngagementFire.Enabled := false;
          if ControlMode = 2 then // manual
            btnGunEngagementCease.Enabled := true;
        end;
    end;

    if IsAssigned then
    begin
      btnGunEngagementAssign.Enabled := false;
      btnGunEngagementBreak.Enabled := true;

      if (WeaponStatus <> wsFiring) and (WeaponStatus = wsAvailable) then
        btnGunEngagementFire.Enabled := true;
    end else
    begin
      if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Fire_Cntl_Director_Req = 1 then
      begin
        if TT3GunOnVehicle(FWeapon).ControlMode = 4 then
          btnGunEngagementAssign.Enabled := false
        else
          btnGunEngagementAssign.Enabled := true;
      end
      else
        btnGunEngagementAssign.Enabled := false;

      btnGunEngagementBreak.Enabled := false;
    end;
  end;
end;

function TfrmGunAutoManual.CheckGunCapability(Sender: TT3PlatformInstance): boolean;
begin
  Result := false;

  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;
  
  case TVehicle_Definition(Sender.UnitDefinition).FData.Platform_Domain of
    0: //Air
      begin
        if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Anti_Air_Capable = 1 then
        begin
          result := true;
          FChaffCategory := 0;
          FChaffType := 'Air';
        end
        else
        begin
          Result := false;
        end;
      end;
    1: //Surface
      begin
        if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Anti_Sur_Capable = 1 then
        begin
          result := true;
          FChaffCategory := 1;
          FChaffType := 'Surface';
        end
        else
          Result := false;
      end;
    2: //Subsurface
      begin
        result := true;
      end;
    3: //Land
      begin
        if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Anti_Land_Capable = 1 then
        begin
          result := true;
          FChaffCategory := 3;
          FChaffType := 'Land';
        end
        else
          Result := false;
      end;
    4: // amphibi
      begin
        if (TT3GunOnVehicle(FWeapon).GunDefinition.FData.Anti_Land_Capable = 1)
            or (TT3GunOnVehicle(FWeapon).GunDefinition.FData.Anti_Sur_Capable = 1)
            or Boolean(TT3GunOnVehicle(FWeapon).GunDefinition.FData.Anti_Amphibious_Capable) then
          result := true
        else
          result := false;
      end;
      vhdGrpPersonel:
      begin
        if (TT3GunOnVehicle(FWeapon).GunDefinition.FData.FireArms = 1) then
        begin
          Result := True;
        end
        else
          Result := False;
      end;
  end;
end;

procedure TfrmGunAutoManual.editAutofireInterceptExit(Sender: TObject);
var
  rGun : TRecCmd_GunFire;
  intercept: single;
begin
  inherited;

  if TryStrToFloat(TEdit(Sender).Text, intercept) then
  begin
    if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
    begin
      frmTacticalDisplay.addStatus('Weapon not defined'); //mk
      exit;
    end;

    EmptyRec(rGun);
    rGun.OrderID := CORD_ID_intercp_range;
    rGun.InterceptRange := intercept;
    editAutofireIntercept.Text := FormatFloat('00.00', intercept);
    simMgrClient.netSend_CmdGunFire(rGun);
  end;
end;

procedure TfrmGunAutoManual.editAutofireInterceptKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  rGun : TRecCmd_GunFire;
  intercept: single;
begin
  inherited;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if TryStrToFloat(TEdit(Sender).Text, intercept) then
    begin
      if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
      begin
        frmTacticalDisplay.addStatus('Weapon not defined'); //mk
        exit;
      end;

      EmptyRec(rGun);
      rGun.OrderID := CORD_ID_intercp_range;
      rGun.InterceptRange := intercept;

      simMgrClient.netSend_CmdGunFire(rGun);
    end;
  end;
end;

procedure TfrmGunAutoManual.editAutofireThresholdExit(Sender: TObject);
var
  rGun : TRecCmd_GunFire;
  thrSpeed: single;
begin
  inherited;

  if TryStrToFloat(TEdit(Sender).Text, thrSpeed) then
  begin
    if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
    begin
      frmTacticalDisplay.addStatus('Weapon not defined'); //mk
      exit;
    end;

    EmptyRec(rGun);
    rGun.OrderID := CORD_ID_thresh_speed;
    rGun.ThresSpeed := thrSpeed;
    editAutofireThreshold.Text := FormatFloat('00.00', thrSpeed);
    simMgrClient.netSend_CmdGunFire(rGun);
  end;
end;

procedure TfrmGunAutoManual.editAutofireThresholdKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  rGun : TRecCmd_GunFire;
  thrSpeed: single;
begin
  inherited;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if TryStrToFloat(TEdit(Sender).Text, thrSpeed) then
    begin
      if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
      begin
        frmTacticalDisplay.addStatus('Weapon not defined'); //mk
        exit;
      end;

      EmptyRec(rGun);
      rGun.OrderID := CORD_ID_thresh_speed;
      rGun.ThresSpeed := thrSpeed;
      simMgrClient.netSend_CmdGunFire(rGun);
    end;
  end;
end;

procedure TfrmGunAutoManual.editControlSalvoSizeExit(Sender: TObject);
var
  rGun : TRecCmd_GunFire;
  salvo: integer;
begin
  inherited;

  if TryStrToInt(TEdit(Sender).Text, salvo) then
  begin
    // 1. cek platform control
    if not(Assigned(FControlled)) then
    begin
      frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
      exit;
    end;

    // 2. cek apakah platform control dorman / freeMe
    if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
    begin
      frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
      exit;
    end;

    // 3. jika bukan GunOnVehicle maka keluar
    if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
    begin
      frmTacticalDisplay.addStatus('Weapon not defined'); //mk
      exit;
    end;

    // 4. cek apakah gun sedang fire
    if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then begin
      frmTacticalDisplay.addStatus('Weapon is firing, please stop its before!'); //mk
      exit;
    end;

    // 5. send salvo size
    EmptyRec(rGun);
    rGun.SalvoSize := salvo;
    rGun.OrderID := CORD_ID_salvo_size;

    simMgrClient.netSend_CmdGunFire(rGun);
  end;
end;

procedure TfrmGunAutoManual.editControlSalvoSizeKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  salvo: integer;
  rGun : TRecCmd_GunFire;
begin
  inherited;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if TryStrToInt(TEdit(Sender).Text, salvo) then
    begin
      // 1. cek platform control
      if not(Assigned(FControlled)) then
      begin
        frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
        exit;
      end;

      // 2. cek apakah platform control dorman / freeMe
      if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
      begin
        frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
        exit;
      end;

      // 3. jika bukan GunOnVehicle maka keluar
      if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
      begin
        frmTacticalDisplay.addStatus('Weapon not defined'); //mk
        exit;
      end;

      // 4. cek apakah gun sedang fire
      if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then begin
        frmTacticalDisplay.addStatus('Weapon is firing, please stop its before!'); //mk
        exit;
      end;

      // 5. send salvo size
      EmptyRec(rGun);
      rGun.SalvoSize := salvo;
      rGun.OrderID := CORD_ID_salvo_size;

      simMgrClient.netSend_CmdGunFire(rGun);
    end;
  end;
end;

procedure TfrmGunAutoManual.edtBloomAltitudeKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  rGun : TRecCmd_GunFire;
  altitude: single;
begin
  inherited;

  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if TryStrToFloat(TEdit(Sender).Text, altitude) then
    begin
      if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
      begin
        frmTacticalDisplay.addStatus('Weapon not defined'); //mk
        exit;
      end;

      EmptyRec(rGun);
      rGun.OrderID := CORD_ID_chaff_bloom;
      rGun.InterceptRange := altitude;

      simMgrClient.netSend_CmdGunFire(rGun);
    end;
  end;
end;

procedure TfrmGunAutoManual.btnTargetSearchClick(Sender: TObject);
var
  rGun      : TRecCmd_GunFire;
  myTrackId, targetTrackId: string;
  tgtId: integer;
  isInsideBlindzoneGun     : boolean;
  posX1, posX2, posY1, posY2, RangeGun: Double;
  Range, Bearing, SpeedGun : Double;
begin
  inherited;
  EmptyRec(rGun);

  // 0. cek platform control
  if Assigned(FControlled) then
  begin
    myTrackId := TT3PlatformInstance(FControlled).Track_ID;
  end
  else
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    exit;
  end;

  if not Assigned(FTargeted) then
  begin
    frmTacticalDisplay.addStatus('Targeted platform not defined'); //mk
    exit;
  end;

  // 1. cek platform control dorman / freeMe
  if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
    exit;
  end;

  // 2. jika bukan GunOnVehicle maka keluar
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then begin
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  // 3. cek apakah gun sedang fire
  if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then begin
    frmTacticalDisplay.addStatus('Weapon is firing, please stop its before!'); //mk
    exit;
  end;

  // 4a. cek platform apakah sudah dipilih untuk ditarget
  if not Assigned(FTargeted) then
  begin
    //raise Exception.Create('Targeted Platform must be set on ' + Self.Caption + ' form');
    frmTacticalDisplay.addStatus('Targeted Platform must be set on'); //mk
    exit;
  end
  else
  begin
    if FTargeted is TT3DetectedTrack then
    begin
      if Assigned(TT3DetectedTrack(FTargeted).TrackObject) then
      begin
        if (TT3PlatformInstance(TT3DetectedTrack(FTargeted).TrackObject).FreeMe)
        or (TT3PlatformInstance(TT3DetectedTrack(FTargeted).TrackObject).Dormant) then
        begin
          frmTacticalDisplay.addStatus('Targeted Platform is FreeMe'); //mk
          exit;
        end
        else
        begin
          //4b. cek gun capability
          if not CheckGunCapability(TT3PlatformInstance(TT3DetectedTrack(FTargeted).TrackObject)) then
          begin
            frmTacticalDisplay.addStatus('Target not suitable with Gun Capability'); //mk
            exit;
          end;

          targetTrackId := TT3PlatformInstance(TT3DetectedTrack(FTargeted).TrackObject).Track_ID;
          tgtId := TT3PlatformInstance(TT3DetectedTrack(FTargeted).TrackObject).InstanceIndex;

          posX2 := TT3PlatformInstance(TT3DetectedTrack(FTargeted).TrackObject).PosX;
          posY2 := TT3PlatformInstance(TT3DetectedTrack(FTargeted).TrackObject).PosY;
          isInsideBlindzoneGun := TT3GunOnVehicle(FWeapon).InsideBlindZone(
                                  TT3PlatformInstance(TT3DetectedTrack(FTargeted).TrackObject));
        end;
      end;
    end
    else if FTargeted is TT3PlatformInstance then
    begin
      if (TT3PlatformInstance(FTargeted).FreeMe) or (TT3PlatformInstance(FTargeted).Dormant) then
      begin
        frmTacticalDisplay.addStatus('Targeted Platform is FreeMe'); //mk
        exit;
      end
      else
      begin
        //4b. cek gun capability
        if not CheckGunCapability(TT3PlatformInstance(TT3PlatformInstance(FTargeted))) then
        begin
          frmTacticalDisplay.addStatus('Target not suitable with Gun Capability'); //mk
          exit;
        end;

        targetTrackId := TT3PlatformInstance(FTargeted).Track_ID;
        tgtId := TT3PlatformInstance(FTargeted).InstanceIndex;

        posX2 := TT3PlatformInstance(FTargeted).PosX;
        posY2 := TT3PlatformInstance(FTargeted).PosY;
        isInsideBlindzoneGun := TT3GunOnVehicle(FWeapon).InsideBlindZone(TT3PlatformInstance(FTargeted));
      end;
    end
    else
    begin
      frmTacticalDisplay.addStatus('Target is not suitable');
      exit;
    end;

    // 4c. cek platform apakah sama dengan own platform
    if myTrackId = targetTrackId then
    begin
      //raise Exception.Create('Own platform can not targeted ' + Self.Caption + ' form');
      frmTacticalDisplay.addStatus('Own platform can not targeted'); //mk
      exit;
    end;
  end;

  //5. cek range target n blind zone
  posX1 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX;
  posY1 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY;
  RangeGun :=  CalcRange(posX1, posY1, posX2, posY2);

  if (RangeGun > TT3GunOnVehicle(FWeapon).GunDefinition.FData.Max_Range)
    or isInsideBlindzoneGun then
  begin
    frmTacticalDisplay.addStatus('Target in blindzone or out of range'); //mk
    Exit;
  end;

  // 6. set default record
  EmptyRec(rGun);

  SpeedGun := TT3GunOnVehicle(FWeapon).GunDefinition.FData.Gun_Average_Shell_Velocity;
  Range := CalcRange(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                     TT3PlatformInstance(FTargeted).PosX,
                     TT3PlatformInstance(FTargeted).PosY);
  Bearing := CalcBearing(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                     TT3PlatformInstance(FTargeted).PosX,
                     TT3PlatformInstance(FTargeted).PosY);
  rGun.NGSBearing := ValidateDegree(Bearing - TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).Course);
  rGun.NGSElevation := GetElevation(SpeedGun, Range);
  rGun.VBSAzimuth := Bearing;
  rGun.VBSElevation := (Range * 45 / TT3GunOnVehicle(FWeapon).GunDefinition.
    FData.Max_Range);

  // 7. if all valid, sent to server
  rGun.TargetPlatformID := tgtId;
  rGun.OrderID          := CORD_ID_target;
  rGun.TurretID :=  TT3GunOnVehicle(FWeapon).GunDefinition.FPoint.FData.TurretID;
  simMgrClient.netSend_CmdGunFire(rGun);
end;

procedure TfrmGunAutoManual.Button1Click(Sender: TObject);
var
  rGun : TRecCmd_GunFire;
  vCorrectToDeg : Double;
  Range, Bearing, SpeedGun : Double;
begin
  inherited;

  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then
  begin
    EmptyRec(rGun);
    rGun.OrderID := CORD_ID_cease;
    simMgrClient.netSend_CmdGunFire(rGun);
  end;

  // Gun Mode
  EmptyRec(rGun);

  rGun.NGSDefCorr  := StrToFloat(Spot1.Text);
  rGun.NGSCorrMode := 1;

  vCorrectToDeg    := StrToFloat(Spot1.Text)* C_Meter_To_Degree;
  rGun.pXflash     := TT3GunOnVehicle(FWeapon).NGSFlashX - vCorrectToDeg;
  rgun.pYflash     := TT3GunOnVehicle(FWeapon).NGSFlashY;
  rGun.pX          := TT3GunOnVehicle(FWeapon).NGSPosX - vCorrectToDeg;
  rGun.py          := TT3GunOnVehicle(FWeapon).NGSPosY;

  SpeedGun := TT3GunOnVehicle(FWeapon).GunDefinition.FData.Gun_Average_Shell_Velocity;
  Range := CalcRange(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                     TT3GunOnVehicle(FWeapon).NGSPosX - vCorrectToDeg,
                     TT3GunOnVehicle(FWeapon).NGSPosY);
  Bearing := CalcBearing(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                      TT3GunOnVehicle(FWeapon).NGSPosX - vCorrectToDeg,
                     TT3GunOnVehicle(FWeapon).NGSPosY);
  rGun.NGSBearing := ValidateDegree(Bearing - TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).Course);
  rGun.NGSElevation := GetElevation(SpeedGun, Range);

//  simMgrClient.FlashPointNGS.PosX := rGun.pXflash;
//  simMgrClient.FlashPointNGS.PosY := TT3GunOnVehicle(FWeapon).NGSFlashY;
//  simMgrClient.FlashPointNGS.Visible := True;

  if Assigned(simMgrClient.TargetPoint) then begin
    simMgrClient.TargetPoint.PosX := rGun.pX ;
    simMgrClient.TargetPoint.PosY := TT3GunOnVehicle(FWeapon).NGSPosY;
    simMgrClient.TargetPoint.Visible := True;
  end;

  rGun.OrderID := CORD_ID_NGSCorrLR;
  simMgrClient.netSend_CmdGunFire(rGun);
end;

procedure TfrmGunAutoManual.Button2Click(Sender: TObject);
var
  rGun : TRecCmd_GunFire;
  vCorrectToDeg : Double;
  Range, Bearing, SpeedGun : Double;
begin
  inherited;

  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then
  begin
    EmptyRec(rGun);
    rGun.OrderID := CORD_ID_cease;
    simMgrClient.netSend_CmdGunFire(rGun);
  end;

  // Gun Mode
  EmptyRec(rGun);

  rGun.NGSDefCorr  := StrToFloat(Spot1.Text);
  rGun.NGSCorrMode := 2;

  vCorrectToDeg    := StrToFloat(Spot1.Text)* C_Meter_To_Degree;
  rGun.pXflash     := TT3GunOnVehicle(FWeapon).NGSFlashX + vCorrectToDeg;
  rgun.pYflash     := TT3GunOnVehicle(FWeapon).NGSFlashY;
  rGun.pX          := TT3GunOnVehicle(FWeapon).NGSPosX + vCorrectToDeg;
  rgun.pY          := TT3GunOnVehicle(FWeapon).NGSPosY;
  SpeedGun := TT3GunOnVehicle(FWeapon).GunDefinition.FData.Gun_Average_Shell_Velocity;
  Range := CalcRange(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                     TT3GunOnVehicle(FWeapon).NGSPosX + vCorrectToDeg,
                     TT3GunOnVehicle(FWeapon).NGSPosY);
  Bearing := CalcBearing(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                      TT3GunOnVehicle(FWeapon).NGSPosX + vCorrectToDeg,
                     TT3GunOnVehicle(FWeapon).NGSPosY);
  rGun.NGSBearing := ValidateDegree(Bearing - TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).Course);
  rGun.NGSElevation := GetElevation(SpeedGun, Range);

//  simMgrClient.FlashPointNGS.PosX := rGun.pXflash;
//  simMgrClient.FlashPointNGS.PosY := TT3GunOnVehicle(FWeapon).NGSFlashY;
//  simMgrClient.FlashPointNGS.Visible := True;

  if Assigned(simMgrClient.TargetPoint) then begin
    simMgrClient.TargetPoint.PosX := rGun.pX ;
    simMgrClient.TargetPoint.PosY := TT3GunOnVehicle(FWeapon).NGSPosY;
    simMgrClient.TargetPoint.Visible := True;
  end;

  rGun.OrderID := CORD_ID_NGSCorrLR;
  simMgrClient.netSend_CmdGunFire(rGun);
end;

procedure TfrmGunAutoManual.Button3Click(Sender: TObject);
var
  rGun : TRecCmd_GunFire;
  vCorrectToDeg : Double;
  Range, Bearing, SpeedGun : Double;
begin
  inherited;

  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then
  begin
    EmptyRec(rGun);
    rGun.OrderID := CORD_ID_cease;
    simMgrClient.netSend_CmdGunFire(rGun);
  end;

  // Gun Mode
  EmptyRec(rGun);

  rGun.NGSRangeCorr:= StrToFloat(Spot2.Text);
  rGun.NGSCorrMode := 1;

  vCorrectToDeg    := StrToFloat(Spot2.Text)* C_Meter_To_Degree;
  rgun.pXflash     := TT3GunOnVehicle(FWeapon).NGSFlashX;
  rGun.pYflash     := TT3GunOnVehicle(FWeapon).NGSFlashY - vCorrectToDeg;
  rgun.pX          := TT3GunOnVehicle(FWeapon).NGSPosX;
  rGun.pY          := TT3GunOnVehicle(FWeapon).NGSPosY - vCorrectToDeg;
  SpeedGun := TT3GunOnVehicle(FWeapon).GunDefinition.FData.Gun_Average_Shell_Velocity;
  Range := CalcRange(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                     TT3GunOnVehicle(FWeapon).NGSPosX,
                     TT3GunOnVehicle(FWeapon).NGSPosY - vCorrectToDeg);
  Bearing := CalcBearing(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                      TT3GunOnVehicle(FWeapon).NGSPosX,
                     TT3GunOnVehicle(FWeapon).NGSPosY - vCorrectToDeg);
  rGun.NGSBearing := ValidateDegree(Bearing - TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).Course);
  rGun.NGSElevation := GetElevation(SpeedGun, Range);

//  simMgrClient.FlashPointNGS.PosX := TT3GunOnVehicle(FWeapon).NGSFlashX;
//  simMgrClient.FlashPointNGS.PosY := rGun.pYflash;
//  simMgrClient.FlashPointNGS.Visible := True;

  if Assigned(simMgrClient.TargetPoint) then begin
    simMgrClient.TargetPoint.PosX := TT3GunOnVehicle(FWeapon).NGSPosX ;
    simMgrClient.TargetPoint.PosY := rGun.pY;
    simMgrClient.TargetPoint.Visible := True;
  end;

  rGun.OrderID := CORD_ID_NGSCorrDA;
  simMgrClient.netSend_CmdGunFire(rGun);
end;

procedure TfrmGunAutoManual.Button4Click(Sender: TObject);
var
  rGun : TRecCmd_GunFire;
  vCorrectToDeg : Double;
  Range, Bearing, SpeedGun : Double;
begin
  inherited;

  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then
  begin
    EmptyRec(rGun);
    rGun.OrderID := CORD_ID_cease;
    simMgrClient.netSend_CmdGunFire(rGun);
  end;

  // Gun Mode
  EmptyRec(rGun);

  rGun.NGSRangeCorr:= StrToFloat(Spot2.Text);
  rGun.NGSCorrMode := 2;

  vCorrectToDeg    := StrToFloat(Spot2.Text)* C_Meter_To_Degree;
  rgun.pXflash     := TT3GunOnVehicle(FWeapon).NGSFlashX;
  rGun.pYflash     := TT3GunOnVehicle(FWeapon).NGSFlashY + vCorrectToDeg;
  rgun.pX          := TT3GunOnVehicle(FWeapon).NGSPosX;
  rGun.pY          := TT3GunOnVehicle(FWeapon).NGSPosY + vCorrectToDeg;

  SpeedGun := TT3GunOnVehicle(FWeapon).GunDefinition.FData.Gun_Average_Shell_Velocity;
  Range := CalcRange(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                     TT3GunOnVehicle(FWeapon).NGSPosX,
                     TT3GunOnVehicle(FWeapon).NGSPosY + vCorrectToDeg);
  Bearing := CalcBearing(TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX,
                     TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY,
                      TT3GunOnVehicle(FWeapon).NGSPosX,
                     TT3GunOnVehicle(FWeapon).NGSPosY + vCorrectToDeg);
  rGun.NGSBearing := ValidateDegree(Bearing - TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).Course);
  rGun.NGSElevation := GetElevation(SpeedGun, Range);

//  simMgrClient.FlashPointNGS.PosX := TT3GunOnVehicle(FWeapon).NGSFlashX;
//  simMgrClient.FlashPointNGS.PosY := rGun.pYflash;
//  simMgrClient.FlashPointNGS.Visible := True;

  if Assigned(simMgrClient.TargetPoint) then begin
    simMgrClient.TargetPoint.PosX := TT3GunOnVehicle(FWeapon).NGSPosX ;
    simMgrClient.TargetPoint.PosY := rGun.pY;
    simMgrClient.TargetPoint.Visible := True;
  end;

  rGun.OrderID := CORD_ID_NGSCorrDA;
  simMgrClient.netSend_CmdGunFire(rGun);
end;

end.



