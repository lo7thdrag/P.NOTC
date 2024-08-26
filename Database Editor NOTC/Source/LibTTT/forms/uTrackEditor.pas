unit uTrackEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, uDetectedObject, Menus;

type
  TfrmTrackEditor = class(TForm)
    Label1: TLabel;
    lbTrackNumber: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    edTrackName: TEdit;
    Label3: TLabel;
    edTrackClass: TEdit;
    Label4: TLabel;
    edTrackType: TEdit;
    btnType: TSpeedButton;
    Label5: TLabel;
    edTrackDomain: TEdit;
    btnDomain: TSpeedButton;
    Label6: TLabel;
    edTrackIdentity: TEdit;
    btnIdentity: TSpeedButton;
    Label7: TLabel;
    edPropulsion: TEdit;
    btnPropulsion: TSpeedButton;
    Bevel2: TBevel;
    Button1: TButton;
    pmType: TPopupMenu;
    Air1: TMenuItem;
    Surface1: TMenuItem;
    Subsurface1: TMenuItem;
    Land1: TMenuItem;
    General1: TMenuItem;
    Chaff1: TMenuItem;
    FixedWingASWMP1: TMenuItem;
    FixedWingEW1: TMenuItem;
    FixedWingFighter1: TMenuItem;
    FixedWingStrikeBomber1: TMenuItem;
    FixedWingReconnaissance1: TMenuItem;
    FixedWingSurveillanceAEW1: TMenuItem;
    Missile1: TMenuItem;
    RotaryWingAttack1: TMenuItem;
    RotaryWingASW1: TMenuItem;
    RotaryWingReconnaissance1: TMenuItem;
    RotaryWingSurveillanceAEW1: TMenuItem;
    RotaryWingSatellite1: TMenuItem;
    Seaplane1: TMenuItem;
    Other1: TMenuItem;
    AircraftCarrierCVCVN1: TMenuItem;
    AmphibiousWarfare1: TMenuItem;
    Auxiliary1: TMenuItem;
    Chaff2: TMenuItem;
    CruiserGuidedMissileCGCGN1: TMenuItem;
    DestroyerDD1: TMenuItem;
    DestroyerGuidedMissileDDG1: TMenuItem;
    FrigateFF1: TMenuItem;
    FrigateGuidedMissileFFG1: TMenuItem;
    JammerDecoy1: TMenuItem;
    Merchant1: TMenuItem;
    MineWarfare1: TMenuItem;
    PatrolCraftPTPTG1: TMenuItem;
    UtilityVessel1: TMenuItem;
    Other2: TMenuItem;
    AcousticDecoy1: TMenuItem;
    AirBubble1: TMenuItem;
    DieselAttackSSK1: TMenuItem;
    DieselGuidedMissileSSG1: TMenuItem;
    Mine1: TMenuItem;
    Nuclear1: TMenuItem;
    NuclearAttackSSN1: TMenuItem;
    NuclearBallisticMissileSSBN1: TMenuItem;
    NuclearGuidedMissileSSGN1: TMenuItem;
    Sonobuoy1: TMenuItem;
    orpedo1: TMenuItem;
    Other3: TMenuItem;
    Airfield1: TMenuItem;
    BatteryAntiAircraftArtillery1: TMenuItem;
    BatteryCoastalDefenceArtillery1: TMenuItem;
    BatteryCoastalDefenceMissile1: TMenuItem;
    BatterySurfacetoAirMissile1: TMenuItem;
    PlatoonArmour1: TMenuItem;
    PlatoonInfantry1: TMenuItem;
    Port1: TMenuItem;
    Other4: TMenuItem;
    pmDomain: TPopupMenu;
    Air2: TMenuItem;
    Surface2: TMenuItem;
    Subsurface2: TMenuItem;
    Land2: TMenuItem;
    Genera1: TMenuItem;
    pmIdentity: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    Suspect1: TMenuItem;
    Hostile1: TMenuItem;
    procedure btnDomainClick(Sender: TObject);
    procedure btnIdentityClick(Sender: TObject);
    procedure btnTypeClick(Sender: TObject);
    procedure Suspect1Click(Sender: TObject);
    procedure onItemIdentityClick(Sender: TObject);
  private
    { Private declarations }
    FHookedObject : TDetectedObject;
    procedure SetHookedObject(const Value: TDetectedObject);
  public
    { Public declarations }
    property HookedObject : TDetectedObject read FHookedObject write SetHookedObject;
  end;

var
  frmTrackEditor: TfrmTrackEditor;

implementation

uses uDBAssetObject, tttData;

{$R *.dfm}

{ TfrmTrackEditor }

procedure TfrmTrackEditor.btnDomainClick(Sender: TObject);
var p : TPoint;
begin
  GetCursorPos(p);
  pmDomain.Popup(p.X,p.Y);
end;

procedure TfrmTrackEditor.btnIdentityClick(Sender: TObject);
var p : TPoint;
begin
  GetCursorPos(p);
  pmIdentity.Popup(p.X,p.Y);
end;

procedure TfrmTrackEditor.btnTypeClick(Sender: TObject);
var p : TPoint;
begin
  GetCursorPos(p);
  pmType.Popup(p.X,p.Y);
end;

procedure TfrmTrackEditor.onItemIdentityClick(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    0 :
    begin
      FHookedObject.TrackForce := piPending;
      edTrackIdentity.Text := 'Pending';
    end;
    1 :
    begin
      FHookedObject.TrackForce := piUnknown;
      edTrackIdentity.Text := 'Unknown';
    end;
    2 :
    begin
      FHookedObject.TrackForce := piAssumedFriend;
      edTrackIdentity.Text := 'Assumed Friend';
    end;
    3 :
    begin
      FHookedObject.TrackForce := piFriend;
      edTrackIdentity.Text := 'Friend';
    end;
    4 :
    begin
      FHookedObject.TrackForce := piNeutral;
      edTrackIdentity.Text := 'Neutral';
    end;
    5 :
    begin
      FHookedObject.TrackForce := piSuspect;
      edTrackIdentity.Text := 'Suspect';
    end;
    6 :
    begin
      FHookedObject.TrackForce := piHostile;
      edTrackIdentity.Text := 'Hostile';
    end;
  end;
end;

procedure TfrmTrackEditor.SetHookedObject(const Value: TDetectedObject);
begin
  FHookedObject := Value;

  lbTrackNumber.Caption := IntToStr(FHookedObject.TrackNumber);

  if FHookedObject.SimObject = nil then exit;

  with TPlatform_Instance(FHookedObject.SimObject) do begin
    case Vehicle.FData.Platform_Domain of
      vhdAir        : edTrackDomain.Text := vhdsAir;
      vhdSurface    : edTrackDomain.Text := vhdsSurface;
      vhdSubsurface : edTrackDomain.Text := vhdsSubsurface;
      vhdLand       : edTrackDomain.Text := vhdsLand;
      vhdGeneral    : edTrackDomain.Text := vhdsGeneral;
    end;

    case Vehicle.FData.Platform_Type of
      vhtFighter       : edTrackType.Text := vhtsFighter      ;
      vhtStrikeBomber  : edTrackType.Text := vhtsStrikeBomber ;
      vhtFixed         : edTrackType.Text := vhtsFixed        ;
      vhtFixedEW       : edTrackType.Text := vhtsFixedEW      ;
      vhtRotaryAttack  : edTrackType.Text := vhtsRotaryAttack ;
      vhtRotaryASW     : edTrackType.Text := vhtsRotaryASW    ;
      vhtFixedSurv     : edTrackType.Text := vhtsFixedSurv    ;
      vhtFixedRec      : edTrackType.Text := vhtsFixedRec     ;
      vhtSeaPlane      : edTrackType.Text := vhtsSeaPlane     ;
      vhtMissile       : edTrackType.Text := vhtsMissile      ;
      vhtAirCarrier    : edTrackType.Text := vhtsAirCarrier   ;
      vhtCruiseGuided  : edTrackType.Text := vhtsCruiseGuided ;
      vhtDestroGuided  : edTrackType.Text := vhtsDestroGuided ;
      vhtFrigatGuided  : edTrackType.Text := vhtsFrigatGuided ;
      vhtDestroyer     : edTrackType.Text := vhtsDestroyer    ;
      vhtFrigate       : edTrackType.Text := vhtsFrigate      ;
      vhtMineWarfare   : edTrackType.Text := vhtsMineWarfare  ;
      vhtPatrolCraft   : edTrackType.Text := vhtsPatrolCraft  ;
      vhtMerchant      : edTrackType.Text := vhtsMerchant     ;
      vhtUtilityVess   : edTrackType.Text := vhtsUtilityVess  ;
      vhtSurfOther     : edTrackType.Text := vhtsSurfOther    ;
      vhtNuclearBalis  : edTrackType.Text := vhtsNuclearBalis ;
      vhtAuxiliary     : edTrackType.Text := vhtsAuxiliary    ;
      vhtNuclearAtt    : edTrackType.Text := vhtsNuclearAtt   ;
      vhtNuclearGuided : edTrackType.Text := vhtsNuclearGuided;
      vhtDieselAttack  : edTrackType.Text := vhtsDieselAttack ;
      vhtDieselGuided  : edTrackType.Text := vhtsDieselGuided ;
      vhtBaterySurf    : edTrackType.Text := vhtsBaterySurf   ;
      vhtBateryMissile : edTrackType.Text := vhtsBateryMissile;
      vhtBateryGun     : edTrackType.Text := vhtsBateryGun    ;
      vhtAirfield      : edTrackType.Text := vhtsAirfield     ;
      vhtPlatoonArm    : edTrackType.Text := vhtsPlatoonArm   ;
      vhtPlatoonInf    : edTrackType.Text := vhtsPlatoonInf   ;
      vhtBatteryArt    : edTrackType.Text := vhtsBatteryArt   ;
      vhtPort          : edTrackType.Text := vhtsPort         ;
      vhtSpecialCraft  : edTrackType.Text := vhtsSpecialCraft ;
      vhtOther         : edTrackType.Text := vhtsOther        ;
      vhtAmphibious    : edTrackType.Text := vhtsAmphibious   ;
      vhtRotarySurv    : edTrackType.Text := vhtsRotarySurv   ;
      vhtRotaryRec     : edTrackType.Text := vhtsRotaryRec    ;
    else
      edTrackType.Text := '??';
    end;
  end;

end;

procedure TfrmTrackEditor.Suspect1Click(Sender: TObject);
begin
  FHookedObject.TrackForce := piSuspect;
end;

end.
