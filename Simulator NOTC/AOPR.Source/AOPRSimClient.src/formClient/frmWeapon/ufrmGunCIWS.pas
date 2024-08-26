unit ufrmGunCIWS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ufmWeaponCtrl, uGameData_TTT,
  uT3Listener,
  uT3Unit;

type
  TfrmGunCIWS = class(TfrmWeaponCtrl)
    grbGunEngagementCIWS: TGroupBox;
    ScrollBox8: TScrollBox;
    Label468: TLabel;
    lblCIWSStatus: TLabel;
    Label474: TLabel;
    lbCIWSQuantity: TLabel;
    Label477: TLabel;
    Bevel99: TBevel;
    Label478: TLabel;
    Label479: TLabel;
    Bevel100: TBevel;
    Label480: TLabel;
    Bevel101: TBevel;
    Label481: TLabel;
    Label482: TLabel;
    Label483: TLabel;
    Label488: TLabel;
    Label489: TLabel;
    Bevel103: TBevel;
    sbCIWSControlModeAuto: TSpeedButton;
    sbCIWSControlModeManual: TSpeedButton;
    sbCIWSControlSalvoCont: TSpeedButton;
    sbCIWSControlSalvoSalvo: TSpeedButton;
    sbCIWSControlDisplayRangeShow: TSpeedButton;
    sbCIWSControlDisplayRangeHide: TSpeedButton;
    sbCIWSControlDisplayBlindZonesShow: TSpeedButton;
    sbCIWSControlDisplayBlindZonesHide: TSpeedButton;
    editCIWSControlSalvoSize: TEdit;
    btnCIWSCease: TButton;
    editCIWSTargetTrack: TEdit;
    btnCIWSFire: TButton;
    btnTargetSearch: TSpeedButton;
    procedure sbCIWSControlModeAutoClick(Sender: TObject);
    procedure SalvoMode(Sender: TObject);
    procedure btnTargetSearchClick(Sender: TObject);
    procedure btnRangeClick(Sender: TObject);
    procedure btnBlindZone(Sender: TObject);
    procedure btnCIWSFireClick(Sender: TObject);
    procedure btnCIWSCeaseClick(Sender: TObject);
    procedure editCIWSControlSalvoSizeKeyPress(Sender: TObject; var Key: Char);
    procedure editCIWSControlSalvoSizeExit(Sender: TObject);
  private
    FGunListener: TT3GunOnVehicleListener;
    procedure ApplyControlMode(Mode: integer);
    procedure ApplyCeaseFire(Value: boolean);
    procedure ApplySalvoMode(Mode: integer);
    procedure ApplyTarget(Value: integer);
    procedure ApplyFire(Value : boolean);

    procedure EmptyRec(var rGun: TRecCmd_GunFire);
    procedure OnPropertyIntChange(Sender: TObject; Props: TPropsID; Value: integer);
    procedure OnPropertyDblChange(Sender: TObject; Props: TPropsID; Value: Double);
    procedure OnPropertyBoolChange(Sender: TObject; Props: TPropsID; Value: boolean);
//    procedure OnPropertyByteChange(Sender: TObject; Props: TPropsID; Value: Byte);
    function  CheckGunCapability(Sender: TT3PlatformInstance): boolean;
    { Private declarations }
  protected
    procedure Empty; override;
    procedure SetProperties; override;
  public
    { Public declarations }
    procedure OnPropertyByteChange(Sender : TObject;Props : TPropsID; Value : Byte);
  end;

var
  frmGunCIWS: TfrmGunCIWS;

implementation

uses uT3Gun, uT3CounterMeasure,
  uT3Vehicle, TTTData, uSimMgr_Client,
  uDBAsset_Vehicle, uBaseCoordSystem, uT3SimManager,
  uT3Radar, uT3Weapon, uMapXHandler, uT3DetectedTrack,
  uSimObjects, ufTacticalDisplay;
{$R *.dfm}

procedure TfrmGunCIWS.ApplyCeaseFire(Value: boolean);
begin
  if Assigned(FWeapon) and (FWeapon is TT3GunOnVehicle) then
  begin
    btnCIWSCease.Enabled := false;

    if TT3GunOnVehicle(FWeapon).ControlMode <> 1 then
      btnCIWSFire.Enabled := true
    else
      btnCIWSFire.Enabled := false;

    if not(Assigned(TT3GunOnVehicle(FWeapon).TargetObject))
       or (TT3GunOnVehicle(FWeapon).TargetObject.FreeMe)
       or (TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).Dormant)then
    begin
      editCIWSTargetTrack.Text := '';
    end;
  end
  else
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
  end;
end;

procedure TfrmGunCIWS.ApplyControlMode(Mode: integer);
begin
  case Mode of
    // automatic mode, state :
    // - salvo mode disable
    1:
      begin
        btnTargetSearch.Enabled := false;
        sbCIWSControlModeAuto.down := true;

        if TT3GunOnVehicle(Weapon).SalvoMode = 1 then
          sbCIWSControlSalvoCont.down := true
        else
          sbCIWSControlSalvoCont.down := False;

        sbCIWSControlSalvoCont.Enabled := true;

        if sbCIWSControlModeAuto.Enabled then
        begin
          sbCIWSControlSalvoSalvo.Enabled := false;
          btnCIWSFire.Enabled := False;
        end;
      end;
    2:
      // manual mode
      begin
        btnTargetSearch.Enabled := True;
        sbCIWSControlModeManual.down := True;

        if TT3GunOnVehicle(Weapon).SalvoMode = 1 then
        begin
          sbCIWSControlSalvoCont.down := True;
          sbCIWSControlSalvoSalvo.down := False;
        end
        else
        begin
          sbCIWSControlSalvoCont.down := False;
          sbCIWSControlSalvoSalvo.down := True;
        end;

        sbCIWSControlSalvoSalvo.Enabled := True;
        sbCIWSControlSalvoCont.Enabled := True;

        btnCIWSFire.Enabled := True;
      end;
    0:
      begin
        begin
          sbCIWSControlModeAuto.down    := false;
          sbCIWSControlSalvoCont.down   := false;
          sbCIWSControlModeManual.down  := false;
          sbCIWSControlSalvoSalvo.down  := false;
        end;
      end
      else
      begin
        sbCIWSControlModeAuto.down    := false;
        sbCIWSControlSalvoCont.down   := false;
        sbCIWSControlModeManual.down  := false;
        sbCIWSControlSalvoSalvo.down  := false;
      end;
  end;
end;

procedure TfrmGunCIWS.ApplyFire(Value: boolean);
begin
  if Assigned(FWeapon) and (FWeapon is TT3GunOnVehicle) then
  begin
    btnCIWSCease.Enabled := true;
    btnCIWSFire.Enabled := false;
  end
  else
  begin
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;
end;

procedure TfrmGunCIWS.ApplySalvoMode(Mode: integer);
begin
  case Mode of
    1:
      sbCIWSControlSalvoCont.down := true;
    2:
      sbCIWSControlSalvoSalvo.down := true;
  end;
end;

procedure TfrmGunCIWS.ApplyTarget(Value: integer);
var
  tgt: TT3PlatformInstance;
  dt: TSimObject;
  targetTrackId: string;
  posX1, posX2, posY1, posY2, RangeGun: Double;
  isInsideBlindzoneGun : Boolean;
begin
  editCIWSTargetTrack.Text := '';

  // 1. jika bukan GunOnVehicle maka keluar
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  // 2. find target
  tgt := simMgrClient.FindT3PlatformByID(Value);
  if not Assigned(tgt) then
  begin
    frmTacticalDisplay.addStatus('Targeted Platform must be set');
    //raise Exception.Create('Targeted Platform must be set');
    TT3GunOnVehicle(FWeapon).TargetObject := nil;
    exit;
  end
  else if tgt.FreeMe or tgt.Dormant then
  begin
    frmTacticalDisplay.addStatus('Targeted is FreeMe');
    //raise Exception.Create('Targeted is FreeMe');
    TT3GunOnVehicle(FWeapon).TargetObject := nil;
    exit;
  end;

  //3. cek range n blind zone
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
    //raise Exception.Create('Target in blindzone or out of range');
    TT3GunOnVehicle(FWeapon).TargetObject := nil;
    Exit;
  end;

  //4. cek gun capability
  if not CheckGunCapability(TT3PlatformInstance(tgt)) then
  begin
    frmTacticalDisplay.addStatus('Target not suitable with Gun Capability'); //mk
    //raise Exception.Create('Target not suitable with Gun Capability');
    TT3GunOnVehicle(FWeapon).TargetObject := nil;
    exit;
  end;

  //6. Asign ke target track
  targetTrackId := TT3PlatformInstance(tgt).Track_ID;
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
    editCIWSTargetTrack.Text := targetTrackId
  else
  begin
    dt := simMgrClient.findDetectedTrack(tgt);

    if Assigned(dt) then
      editCIWSTargetTrack.Text := FormatTrackNumber(TT3DetectedTrack(dt).TrackNumber)
    else
    begin
      if TT3PlatformInstance(tgt).TrackNumber = 0 then
        editCIWSTargetTrack.Text := targetTrackId
      else
        editCIWSTargetTrack.Text := FormatTrackNumber
          (TT3PlatformInstance(tgt).TrackNumber);
    end;
  end;
end;

procedure TfrmGunCIWS.btnBlindZone(Sender: TObject);
begin
  if (not Assigned(Weapon)) or not(Weapon is TT3GunOnVehicle) then
  begin
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  // Blind Zone
  with TT3GunOnVehicle(Weapon) do
  begin
    case TSpeedButton(Sender).Tag of
      1:
        begin
          FVisibleShowBlind := true;
          if Assigned(OnShowBlind) then
            OnShowBlind(Weapon, FVisibleShowBlind);

          ShowBlind := true;
          ShowBlindSelected := ShowBlind and FVisibleShowBlind;
          HideBlindSensor;
        end;
      2:
        begin
          FVisibleShowBlind := false;
          if Assigned(OnShowBlind) then
            OnShowBlind(Weapon, FVisibleShowBlind);

          ShowBlind := false;
          ShowBlindSelected := ShowBlind and FVisibleShowBlind;
        end;
    end;
  end;
end;

procedure TfrmGunCIWS.btnCIWSCeaseClick(Sender: TObject);
var
  rGun: TRecCmd_GunFire;
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
  if (not Assigned(Weapon)) or not(Weapon is TT3GunOnVehicle) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    exit;
  end;

  EmptyRec(rGun);
  rGun.OrderID := CORD_ID_cease;
  simMgrClient.netSend_CmdGunFire(rGun);
end;

procedure TfrmGunCIWS.btnCIWSFireClick(Sender: TObject);
var
  rGun: TRecCmd_GunFire;
  TargetId : Integer;
  tgt : TT3PlatformInstance;
  posX1, posX2, posY1, posY2, RangeGun: Double;
  isInsideBlindzoneGun : Boolean;
begin
  inherited;

  // 1. cek platform control
  if not(Assigned(FControlled)) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    exit;
  end;

  // 2. cek apakah platform control dorman / freeMe
  if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
    //raise Exception.Create('Controlled platform is destroy');
    exit;
  end;

  // 3. jika bukan GunOnVehicle maka keluar
  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    exit;
  end;

  // 4. Send record
  if not(Assigned(TT3GunOnVehicle(FWeapon).TargetObject))
     or (TT3GunOnVehicle(FWeapon).TargetObject.FreeMe)
     or (TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).Dormant)then    //mk added
  begin
    TT3GunOnVehicle(FWeapon).TargetObject := nil;
    editCIWSTargetTrack.Text := '';

    //raise Exception.Create('Target not selected yet');
    frmTacticalDisplay.addStatus('Target not selected yet'); //mk
    Exit;
  end
  else
  begin
    if TT3GunOnVehicle(FWeapon).TargetObject is TT3DetectedTrack then
        TargetId := TT3PlatformInstance(TT3DetectedTrack(TT3GunOnVehicle(FWeapon)
                    .TargetObject).TrackObject).InstanceIndex
    else if TT3GunOnVehicle(FWeapon).TargetObject is TT3PlatformInstance then
      TargetId := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).TargetObject).InstanceIndex
    else
    begin
      frmTacticalDisplay.addStatus('Target not suitable'); //mk
      //raise Exception.Create('Target not suitable');
      Exit;
    end;

    tgt := simMgrClient.FindT3PlatformByID(TargetId);
    if not(Assigned(tgt)) then
    begin
      frmTacticalDisplay.addStatus('Target not selected yet'); //mk
      //raise Exception.Create('Target not selected yet');
      Exit;
    end;

    posX1 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosX;
    posY1 := TT3PlatformInstance(TT3GunOnVehicle(FWeapon).Parent).PosY;
    posX2 := tgt.PosX;
    posY2 := tgt.PosY;
    RangeGun :=  CalcRange(posX1, posY1, posX2, posY2);
    isInsideBlindzoneGun := TT3GunOnVehicle(FWeapon).InsideBlindZone(tgt);

    // 5. Cek apakah target masih dlm range n di dlm blinzone
    if (RangeGun > TT3GunOnVehicle(FWeapon).GunDefinition.FData.Max_Range)
      or isInsideBlindzoneGun then
    begin
      TT3GunOnVehicle(FWeapon).TargetObject := nil;
      editCIWSTargetTrack.Text := '';

      //raise Exception.Create('Target in blindzone or out of range');
      frmTacticalDisplay.addStatus('Target in blindzone or out of range'); //mk
      Exit;
    end;
  end;

  //6. If OK => Fire Gun
  case TT3GunOnVehicle(FWeapon).ControlMode of
     2:
      begin
        if not Assigned(TT3GunOnVehicle(Weapon).TargetObject) then
        begin
          //raise Exception.Create('Target not selected yet');
          frmTacticalDisplay.addStatus('Target not selected yet'); //mk
          Exit;
        end
        else
        begin
          if TT3GunOnVehicle(FWeapon).Quantity <= 0 then
          begin
            frmTacticalDisplay.addStatus('Weapon quantity <= 0'); //mk
            //raise Exception.Create('Weapon quantity <= 0');
            Exit;
          end;

          EmptyRec(rGun);
          rGun.OrderID := CORD_ID_fire;
          simMgrClient.netSend_CmdGunFire(rGun);

          // enable waktu terima hasil shoot dari server
//          btnCIWSFire.Enabled := false;
//          btnCIWSCease.Enabled := true;
        end;
      end;
  end;
end;

procedure TfrmGunCIWS.btnRangeClick(Sender: TObject);
begin
  if (not Assigned(Weapon)) or (not(Weapon is TT3GunOnVehicle)) then
    exit;

  // Show Hide Range
  with TT3GunOnVehicle(Weapon) do
  begin
    case TSpeedButton(Sender).Tag of
      1:
        begin
          FVisibleShowRange := true;
          if Assigned(OnShowBlind) then
            OnShowBlind(FWeapon, FVisibleShowRange);

          ShowRange := true;
          ShowRangeSelected := ShowRange and FVisibleShowRange;

          HideRangeSensor;
        end;
      2:
        begin
          FVisibleShowRange := false;
          if Assigned(OnShowBlind) then
            OnShowBlind(FWeapon, FVisibleShowRange);

          ShowRange := false;
          ShowRangeSelected := ShowRange and FVisibleShowRange;
        end;
    end;
  end;
end;

procedure TfrmGunCIWS.btnTargetSearchClick(Sender: TObject);
var
  rGun: TRecCmd_GunFire;
  myTrackId, targetTrackId: string;
  tgtId : Integer;
  Range, Bearing, SpeedGun : Double;
begin
  // 0. cek platform control
  if Assigned(FControlled) then
    myTrackId := TT3PlatformInstance(FControlled).Track_ID
  else
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    //raise Exception.Create('Controlled platform not defined');
    exit;
  end;

  // 1. cek platform control dorman / freeMe
  if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
    //raise Exception.Create('Controlled platform is destroy');
    exit;
  end;

  // 2. jika bukan GunOnVehicle maka keluar
  if (not Assigned(Weapon)) or (not(Weapon is TT3GunOnVehicle)) then
  begin
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  // 3. cek apakah gun sedang fire
  if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then
  begin
    frmTacticalDisplay.addStatus('Weapon is firing, please stop its before!'); //mk
    //raise Exception.Create('Weapon is firing, please stop its before!');
    exit;
  end;

  // 4a. cek platform apakah sudah dipilih untuk ditarget
  if not Assigned(FTargeted) then
  begin
    //raise Exception.Create('Targeted Platform must be set on ' + Self.Caption + ' form');
    frmTacticalDisplay.addStatus('Targeted Platform must be set on'); //mk
    exit;
  end
  // 4b. cek platform apakah sama dengan own platform
  else
  begin
    if FTargeted is TT3DetectedTrack then
    begin
      if Assigned(TT3DetectedTrack(FTargeted).TrackObject) then
      begin
        targetTrackId := TT3PlatformInstance(TT3DetectedTrack(FTargeted).TrackObject).Track_ID;
        tgtId := TT3PlatformInstance(TT3DetectedTrack(FTargeted).TrackObject).InstanceIndex;
      end;
    end
    else
    begin
      targetTrackId := TT3PlatformInstance(FTargeted).Track_ID;
      tgtId := TT3PlatformInstance(FTargeted).InstanceIndex;
    end;

    if myTrackId = targetTrackId then
    begin
      //raise Exception.Create('Own platform can not targeted ' + Self.Caption + ' form');
      frmTacticalDisplay.addStatus('Own platform can not targeted'); //mks
      exit;
    end;
  end;

  // 5. cek target yg disimpan gun dengan calon target baru, jika sama maka keluar
  {if Assigned(TT3GunOnVehicle(Weapon).TargetObject) then
  begin
    // 5.1 jika yg ditarget detected track
    if (FTargeted is TT3DetectedTrack) and TT3GunOnVehicle(Weapon)
      .TargetObject.Equals(TT3PlatformInstance(TT3DetectedTrack(FTargeted)
          .TrackObject)) then
      exit
    else
    // 5.2 jika yg ditarget platforminstance
      if TT3GunOnVehicle(Weapon).TargetObject.Equals
      (TT3PlatformInstance(FTargeted)) then
      exit;
  end;

  // 6. cek capability dari gun
  if not CheckGunCapability(TT3PlatformInstance(FTargeted)) then
  begin

    exit;
  end;}

  // 7. jika dalam keadaan firing, minta server hentikan..
  {if TT3GunOnVehicle(Weapon).ControlMode = 1 then
  begin
    if TT3GunOnVehicle(Weapon).WeaponStatus = wsFiring then
    begin
      EmptyRec(rGun);
      rGun.OrderID := CORD_ID_cease;
      simMgrClient.netSend_CmdGunFire(rGun);
    end;
  end; }

  // 8. set default record
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

  // 9. if all valid, sent to server
  rGun.TargetPlatformID := tgtId;
  rGun.OrderID := CORD_ID_target;
  rGun.TurretID :=  TT3GunOnVehicle(FWeapon).GunDefinition.FPoint.FData.TurretID;
  simMgrClient.netSend_CmdGunFire(rGun);
end;

function TfrmGunCIWS.CheckGunCapability(Sender: TT3PlatformInstance): boolean;
begin
  Result := false;

  if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
  begin
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    exit;
  end;

  case TVehicle_Definition(Sender.UnitDefinition).FData.Platform_Domain of
    0: // Air
      begin
        if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Anti_Air_Capable = 1 then
          result := true
        else
          result := false;
      end;
    1: // Surface
      begin
        if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Anti_Sur_Capable = 1 then
          result := true
        else
          result := false
      end;
    2: // Subsurface
      begin
        result := false
      end;
    3: // Land
      begin
        if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Anti_Land_Capable = 1 then
          result := true
        else
          result := false;
      end;
    4: // amphibi
      begin
        if (TT3GunOnVehicle(FWeapon).GunDefinition.FData.Anti_Land_Capable = 1)
            or (TT3GunOnVehicle(FWeapon).GunDefinition.FData.Anti_Sur_Capable = 1) then
          result := true
        else
          result := false;
      end;
  end;
end;

procedure TfrmGunCIWS.editCIWSControlSalvoSizeExit(Sender: TObject);
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
      exit;    //gk bleh ada log
    end;

    // 2. cek apakah platform control dorman / freeMe
    if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
    begin
      frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
      //raise Exception.Create('Controlled platform is destroy');
      exit;
    end;

    // 3. jika bukan GunOnVehicle maka keluar
    if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
    begin
      frmTacticalDisplay.addStatus('Weapon not defined'); //mk
      //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
      exit;
    end;

    // 4. cek apakah gun sedang fire
    if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then
    begin
      frmTacticalDisplay.addStatus('Weapon is firing, please stop its before!'); //mk
      //raise Exception.Create('Weapon is firing, please stop its before!');
      exit;
    end;

    // 5. send salvo size
    EmptyRec(rGun);
    rGun.SalvoSize := salvo;
    rGun.OrderID := CORD_ID_salvo_size;

    simMgrClient.netSend_CmdGunFire(rGun);
  end;
end;

procedure TfrmGunCIWS.editCIWSControlSalvoSizeKeyPress(Sender: TObject;
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
        //raise Exception.Create('Controlled platform not defined');
        exit;
      end;

      // 2. cek apakah platform control dorman / freeMe
      if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
      begin
        frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
        //raise Exception.Create('Controlled platform is destroy');
        exit;
      end;

      // 3. jika bukan GunOnVehicle maka keluar
      if (not Assigned(FWeapon)) or (not(FWeapon is TT3GunOnVehicle)) then
      begin
        frmTacticalDisplay.addStatus('Weapon not defined'); //mk
        //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
        exit;
      end;

      // 4. cek apakah gun sedang fire
      if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then begin
        frmTacticalDisplay.addStatus('Weapon is firing, please stop its before!'); //mk
        //raise Exception.Create('Weapon is firing, please stop its before!');
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

procedure TfrmGunCIWS.Empty;
begin
  inherited;

  editCIWSControlSalvoSize.Text := '1';
  editCIWSTargetTrack.Text := '---';

  sbCIWSControlDisplayRangeHide.down := true;
  sbCIWSControlDisplayBlindZonesHide.down := true;

  lblCIWSStatus.Caption := 'Unavailable';
  lbCIWSQuantity.Caption := '--';

  btnCIWSCease.Enabled := false;
  btnTargetSearch.Enabled := false;

  if Assigned(FWeapon) and Assigned(FGunListener) then
  begin
    if FWeapon is TT3GunOnVehicle then
    begin
      TT3GunOnVehicle(FWeapon).removeListener('CIWSLISTENER');
    end;
  end;
end;

procedure TfrmGunCIWS.EmptyRec(var rGun: TRecCmd_GunFire);
begin
  with rGun do
  begin
    SessionID := 0;

    if Assigned(FControlled) then
      ParentPlatformID := TT3PlatformInstance(FControlled).InstanceIndex
    else
      ParentPlatformID := 0;

    if Assigned(FWeapon) then
    begin
      GunID       := TT3GunOnVehicle(FWeapon).InstanceIndex;
      ControlMode := TT3GunOnVehicle(FWeapon).ControlMode;
      SalvoMode   := TT3GunOnVehicle(FWeapon).SalvoMode;
      SalvoSize   := TT3GunOnVehicle(FWeapon).SalvoSize;
      GunCapacityRemain := TT3GunOnVehicle(FWeapon).Quantity;
      InterceptRange  := 0;
      ThresSpeed      := 0;

      if Assigned(TT3GunOnVehicle(FWeapon).TargetObject) then
      begin
        TargetPlatformID := TT3Unit(TT3GunOnVehicle(FWeapon).TargetObject)
          .InstanceIndex;
      end
      else
        TargetPlatformID := 0;

      GunName := TT3GunOnVehicle(FWeapon).InstanceName;
      pX := 0;
      pY := 0;
      pAltitude := 0;
      degSpotLine := 0;
      degGunLine  := 0;
      //--- NGS corrections n error system
      NGSCorrMode   := 0;
      NGSRangeCorr  := 0;
      NGSDefCorr    := 0;
      pXflash   := 0;
      pYflash   := 0;
    end
    else
    begin
      GunID       := 0;
      ControlMode := 0;
      SalvoMode   := 0;
      SalvoSize   := 0;
      GunCapacityRemain := 0;
      InterceptRange    := 0;
      ThresSpeed        := 0;
      TargetPlatformID  := 0;
      GunName := '';
      pX      := 0;
      pY      := 0;
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

    OrderID         := 0;
    HitProbability  := 0;
  end;
end;

procedure TfrmGunCIWS.OnPropertyBoolChange(Sender: TObject; Props: TPropsID;
  Value: boolean);
begin
  if Assigned(FWeapon) and Assigned(Sender) then
  begin
    if TT3Unit(FWeapon).InstanceIndex = TT3Unit(Sender).InstanceIndex then
    begin
      case Props of
        psCeaseFire:
          ApplyCeaseFire(Value);
      end;
    end;
  end;
end;

procedure TfrmGunCIWS.OnPropertyByteChange(Sender: TObject; Props: TPropsID;
  Value: Byte);
begin
  if Assigned(FWeapon) and Assigned(Sender) then
  begin
    if TT3Unit(FWeapon).InstanceIndex = TT3Unit(Sender).InstanceIndex then
    begin
      case Props of
        psWeaponStatus :
          case TWeaponStatus(Value) of
            wsAvailable   : lblCIWSStatus.Caption   := 'Available';
            wsUnavailable : lblCIWSStatus.Caption   := 'Unavailable';
            wsDamaged     : lblCIWSStatus.Caption   := 'Damaged';
            wsFiring      :
              begin
                lblCIWSStatus.Caption   := 'Firing';

                ApplyFire(True);
              end;
          end;
      end;
    end;
  end;
end;

procedure TfrmGunCIWS.OnPropertyDblChange(Sender: TObject; Props: TPropsID;
  Value: Double);
begin
  if Assigned(FWeapon) and Assigned(Sender) then
  begin
    if TT3Unit(FWeapon).InstanceIndex = TT3Unit(Sender).InstanceIndex then
    begin
      //
    end;
  end;
end;

procedure TfrmGunCIWS.OnPropertyIntChange(Sender: TObject; Props: TPropsID;
  Value: integer);
begin
  if Assigned(FWeapon) and Assigned(Sender) then
  begin
    if TT3Unit(FWeapon).InstanceIndex = TT3Unit(Sender).InstanceIndex then
    begin
      case Props of
        psControlMode:
          ApplyControlMode(Value);
        psSalvoMode:
          ApplySalvoMode(Value);
        psSetTarget:
          ApplyTarget(Value);
        psSalvoSize:
          editCIWSControlSalvoSize.Text := IntToStr(Value);
        psQuantity:
          lbCIWSQuantity.Caption := IntToStr(Value);
      end;
    end;
  end;
end;

procedure TfrmGunCIWS.SalvoMode(Sender: TObject);
var
  rGun: TRecCmd_GunFire;
begin
  // 1. cek platform control
  if not(Assigned(FControlled)) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    //raise Exception.Create('Controlled platform not defined');
    exit;
  end;

  // 2. cek apakah platform control dorman / freeMe
  if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
    //raise Exception.Create('Controlled platform is destroy');
    exit;
  end;

  // 3. jika bukan GunOnVehicle maka keluar
  if (not Assigned(Weapon)) or (not(Weapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    exit;
  end;

  // 4. cek apakah gun sedang fire
  if TT3GunOnVehicle(FWeapon).WeaponStatus = wsFiring then begin
    frmTacticalDisplay.addStatus('Weapon is firing, please stop its before!'); //mk
    //raise Exception.Create('Weapon is firing, please stop its before!');
    exit;
  end;

  // 5. Salvo Mode
  EmptyRec(rGun);

  with TT3GunOnVehicle(Weapon) do
  begin
    case TSpeedButton(Sender).Tag of
      3: rGun.SalvoMode := 1;
      4: rGun.SalvoMode := 2;
    end;
  end;

  rGun.OrderID := CORD_ID_salvo_mode;
  simMgrClient.netSend_CmdGunFire(rGun);

  if TSpeedButton(Sender).down then
    TSpeedButton(Sender).down := false;
end;

procedure TfrmGunCIWS.sbCIWSControlModeAutoClick(Sender: TObject);
var
  rGun: TRecCmd_GunFire;
begin
  // 1. cek platform control
  if not(Assigned(FControlled)) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform not defined'); //mk
    //raise Exception.Create('Controlled platform not defined');
    exit;
  end;

  // 2. cek apakah platform control dorman / freeMe
  if (TT3PlatformInstance(FControlled).Dormant) or (TT3PlatformInstance(FControlled).FreeMe) then
  begin
    frmTacticalDisplay.addStatus('Controlled platform is destroy'); //mk
    //raise Exception.Create('Controlled platform is destroy');
    exit;
  end;

  // 3. jika bukan GunOnVehicle maka keluar
  if (not Assigned(Weapon)) or (not(Weapon is TT3GunOnVehicle)) then
  begin
    frmTacticalDisplay.addStatus('Weapon not defined'); //mk
    //raise Exception.Create('Weapon not set on ' + Self.Caption + ' form');
    exit;
  end;

  // 4. cek apakah gun sedang fire
  if TT3GunOnVehicle(Weapon).WeaponStatus = wsFiring then
  begin
    EmptyRec(rGun);
    rGun.OrderID := CORD_ID_cease;
    simMgrClient.netSend_CmdGunFire(rGun);
  end;

  // 5. Gun Mode
  EmptyRec(rGun);

  with TT3GunOnVehicle(Weapon) do
  begin
    case TSpeedButton(Sender).Tag of
      1: rGun.ControlMode := 1;
      2: rGun.ControlMode := 2;
    end;
  end;

  rGun.OrderID := CORD_ID_control_mode;
  simMgrClient.netSend_CmdGunFire(rGun);

  if TSpeedButton(Sender).down then
    TSpeedButton(Sender).down := false;
end;

procedure TfrmGunCIWS.SetProperties;
begin
  inherited;

  if (not Assigned(FWeapon)) or (not (FWeapon is TT3GunOnVehicle)) then
  begin
    MessageDlg(FWeapon.ClassName, mtInformation, [mbOK], 0);
    Empty;
    exit;
  end;

  // -- set listener for this object
  FGunListener := TT3GunOnVehicleListener.Create;
  TT3GunOnVehicle(FWeapon).addListener(FGunListener);
  FGunListener.ListenerID := 'CIWSLISTENER';
  FGunListener.OnPropertyIntChange := OnPropertyIntChange;
  FGunListener.OnPropertyDblChange := OnPropertyDblChange;
  FGunListener.OnPropertyBoolChange := OnPropertyBoolChange;
  FGunListener.OnPropertyByteChange := OnPropertyByteChange;
  // -- end

  sbCIWSControlModeAuto.Enabled := true;
  {if TT3GunOnVehicle(FWeapon).GunDefinition.FData.Automode_Capable = 1 then
    sbCIWSControlModeAuto.Enabled := true
  else
    sbCIWSControlModeAuto.Enabled := false; }

  with TT3GunOnVehicle(FWeapon) do
  begin
    if ShowRange then
      sbCIWSControlDisplayRangeShow.down := true
    else
      sbCIWSControlDisplayRangeHide.down := true;

    if ShowBlind then
      sbCIWSControlDisplayBlindZonesShow.down := true
    else
      sbCIWSControlDisplayBlindZonesHide.down := true;

    ApplyControlMode(ControlMode);
    ApplySalvoMode(SalvoMode);

    if (TargetObject <> nil) {and (TargetObject is TT3PlatformInstance) }then
      ApplyTarget(TT3PlatformInstance(TargetObject).InstanceIndex)
    else
      editCIWSTargetTrack.Text := '---';

    lbCIWSQuantity.Caption := IntToStr(Quantity);
    editCIWSControlSalvoSize.Text := IntToStr(SalvoSize);

    case WeaponStatus of
      wsAvailable:
        begin
          lblCIWSStatus.Caption := 'Available';
          btnCIWSCease.Enabled := false;
        end;
      wsUnavailable:
        lblCIWSStatus.Caption := 'Unavailable';
      wsDamaged:
        lblCIWSStatus.Caption := 'Damaged';
      wsFiring:
        begin
          lblCIWSStatus.Caption := 'Firing';
          btnCIWSFire.Enabled := false;

          if ControlMode = 2 then // manual
            btnCIWSCease.Enabled := true;
        end;
    end;
  end;
end;

end.
