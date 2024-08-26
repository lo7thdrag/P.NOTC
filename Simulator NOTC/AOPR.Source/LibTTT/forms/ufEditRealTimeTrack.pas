unit ufEditRealTimeTrack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, Buttons, Menus,
  PlatformDefaultStyleActnCtrls, uGameData_TTT, uSimObjects, System.ImageList;

type

  TfrmEditRealTimeTrack = class(TForm)
    Label1: TLabel;
    LblTrackNumber: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtNameTrack: TEdit;
    edtClassTrack: TEdit;
    edtTypeTrack: TEdit;
    edtDomainTrack: TEdit;
    edtIdentityTrack: TEdit;
    edtPropulsionTypeTrack: TEdit;
    BTtype: TButton;
    Bevel2: TBevel;
    ImageList1: TImageList;
    BTdomain: TButton;
    BTidentity: TButton;
    BTpropulsiontype: TButton;
    BitBtn1: TBitBtn;
    pumtype: TPopupMenu;
    pumdomain: TPopupMenu;
    pumidentity: TPopupMenu;
    mnAircraftCarrier: TMenuItem;
    mnAmphibiousWarfare: TMenuItem;
    mnAuxiliary: TMenuItem;
    mnChaff: TMenuItem;
    mnCruiserGuidedMissile: TMenuItem;
    mnDestroyer: TMenuItem;
    mnDestroyerGuidedMissle: TMenuItem;
    mnFrigate: TMenuItem;
    mnFrigateGuidedMissle: TMenuItem;
    mnInfraredDecoy: TMenuItem;
    mnJammerDecoy: TMenuItem;
    mnMerchant: TMenuItem;
    mnMineWar: TMenuItem;
    mnPatrolCraff: TMenuItem;
    mnUtility: TMenuItem;
    mnOther: TMenuItem;
    mnAir: TMenuItem;
    mnSurface: TMenuItem;
    mnSubsurface: TMenuItem;
    mnLand: TMenuItem;
    mnGeneral: TMenuItem;
    mnPending: TMenuItem;
    mnUnknown: TMenuItem;
    mnAssumedFriend: TMenuItem;
    mnFriend: TMenuItem;
    mnNeutral: TMenuItem;
    mnSuspent: TMenuItem;
    mnHostile: TMenuItem;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BTtypeClick(Sender: TObject);
    procedure BTdomainClick(Sender: TObject);
    procedure BTidentityClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnAircraftCarrierClick(Sender: TObject);
    procedure mnAmphibiousWarfareClick(Sender: TObject);
    procedure mnAuxiliaryClick(Sender: TObject);
    procedure mnChaffClick(Sender: TObject);
    procedure mnCruiserGuidedMissileClick(Sender: TObject);
    procedure mnDestroyerClick(Sender: TObject);
    procedure mnDestroyerGuidedMissleClick(Sender: TObject);
    procedure mnFrigateClick(Sender: TObject);
    procedure mnFrigateGuidedMissleClick(Sender: TObject);
    procedure mnInfraredDecoyClick(Sender: TObject);
    procedure mnJammerDecoyClick(Sender: TObject);
    procedure mnMerchantClick(Sender: TObject);
    procedure mnMineWarClick(Sender: TObject);
    procedure mnPatrolCraffClick(Sender: TObject);
    procedure mnUtilityClick(Sender: TObject);
    procedure mnOtherClick(Sender: TObject);
    procedure mnAirClick(Sender: TObject);
    procedure mnSurfaceClick(Sender: TObject);
    procedure mnSubsurfaceClick(Sender: TObject);
    procedure mnLandClick(Sender: TObject);
    procedure mnGeneralClick(Sender: TObject);
    procedure mnPendingClick(Sender: TObject);
    procedure mnUnknownClick(Sender: TObject);
    procedure mnAssumedFriendClick(Sender: TObject);
    procedure mnFriendClick(Sender: TObject);
    procedure mnNeutralClick(Sender: TObject);
    procedure mnSuspentClick(Sender: TObject);
    procedure mnHostileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Data: TSimObject;
    rec : TRecCmd_NRP_SET_PROPERTY;
    recVehicle: TRecCmd_Platform_SET_PROPERTY;
    recESM : TRecCmd_ESM_SET_PROPERTY;

    procedure SetRecord;
    procedure UpdateInfo(obj : TSimObject);
    procedure UpdateView(obj : TSimObject);
  end;

var
  frmEditRealTimeTrack: TfrmEditRealTimeTrack;

implementation

uses uT3Unit, uT3DetectedTrack, tttData, uMapXHandler, uSimMgr_Client, uT3Vehicle,
  uBaseCoordSystem;

{$R *.dfm}

procedure TfrmEditRealTimeTrack.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmEditRealTimeTrack.BitBtn2Click(Sender: TObject);
begin
  SetRecord;

  if (Data is TT3NonRealVehicle) then
  begin
    rec.OrderID := NRP_ID_ALL;
    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      rec.GrpID := 0
    else
      rec.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;

    simMgrClient.netSend_CmdNRP_CHANGE_PROPERTY(rec);
  end
  else if (Data is TT3Vehicle) then
  begin
    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      recVehicle.GrpID := 0
    else
      recVehicle.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;

    simMgrClient.netSend_CmdPlatform_CHANGE_PROPERTY(recVehicle);
  end
  else if (Data is TT3DetectedTrack) then
  begin
    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      recVehicle.GrpID := 0
    else
      recVehicle.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;

    simMgrClient.netSend_CmdPlatform_CHANGE_PROPERTY(recVehicle);
  end
  else if (Data is TT3ESMTrack) then
  begin
    recESM.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;
    simMgrClient.netSend_CmdESM_CHANGE_PROPERTY(recESM);
  end;

  Invalidate;
  VSimMap.FMap.Repaint;
  Self.Close;
end;

procedure TfrmEditRealTimeTrack.BTdomainClick(Sender: TObject);
var
  p: Tpoint;
begin
  GetCursorPos(p);
  pumdomain.Popup(p.X, p.Y);
end;

procedure TfrmEditRealTimeTrack.BTidentityClick(Sender: TObject);
var
  p: Tpoint;
begin
  GetCursorPos(p);
  pumidentity.Popup(p.X, p.Y);
end;

procedure TfrmEditRealTimeTrack.BTtypeClick(Sender: TObject);
var
  p: Tpoint;
begin
  GetCursorPos(p);
  pumtype.Popup(p.X, p.Y);
end;

procedure TfrmEditRealTimeTrack.FormShow(Sender: TObject);
begin
  if Data = nil then Exit;

  if Data is TT3DetectedTrack then begin
    Self.Caption := 'Edit Detected Track';
    LblTrackNumber.Caption := FormatTrackNumber(TT3DetectedTrack(Data).TrackNumber);
  end
  else if Data is TT3ESMTrack then begin
    Self.Caption := 'Edit ESM Track';
    LblTrackNumber.Caption := TT3ESMTrack(Data).TrackNumber;
  end
  else if (Data is TT3NonRealVehicle) then begin
    Self.Caption := 'Edit Non Real Time Track';
    LblTrackNumber.Caption := FormatTrackNumber(TT3NonRealVehicle(Data).TrackNumber);
  end
  else if (Data is TT3Vehicle) then begin
    Self.Caption := 'Edit Real Time Track';
    LblTrackNumber.Caption := '---';
  end;

  UpdateInfo(Data);
  UpdateView(Data);
end;

procedure TfrmEditRealTimeTrack.mnAirClick(Sender: TObject);
begin
  edtDomainTrack.Text := vhdsAir;
end;

procedure TfrmEditRealTimeTrack.mnAircraftCarrierClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsAirCarrier;
end;

procedure TfrmEditRealTimeTrack.mnAmphibiousWarfareClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsAmphibious;
end;

procedure TfrmEditRealTimeTrack.mnAssumedFriendClick(Sender: TObject);
begin
  edtIdentityTrack.Text := 'AssumedFriend';
end;

procedure TfrmEditRealTimeTrack.mnAuxiliaryClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsAuxiliary;
end;

procedure TfrmEditRealTimeTrack.mnChaffClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsOther;
end;

procedure TfrmEditRealTimeTrack.mnCruiserGuidedMissileClick(
  Sender: TObject);
begin
  edtTypeTrack.Text := vhtsCruiseGuided;
end;

procedure TfrmEditRealTimeTrack.mnDestroyerClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsDestroyer;
end;

procedure TfrmEditRealTimeTrack.mnDestroyerGuidedMissleClick(
  Sender: TObject);
begin
  edtTypeTrack.Text := vhtsDestroGuided;
end;

procedure TfrmEditRealTimeTrack.mnFriendClick(Sender: TObject);
begin
  edtIdentityTrack.Text := 'Friend';
end;

procedure TfrmEditRealTimeTrack.mnFrigateClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsFrigate;
end;

procedure TfrmEditRealTimeTrack.mnFrigateGuidedMissleClick(
  Sender: TObject);
begin
  edtTypeTrack.Text := vhtsFrigatGuided;
end;

procedure TfrmEditRealTimeTrack.mnGeneralClick(Sender: TObject);
begin
  edtDomainTrack.Text := vhdsGeneral;
end;

procedure TfrmEditRealTimeTrack.mnHostileClick(Sender: TObject);
begin
  edtIdentityTrack.Text := 'Hostile';
end;

procedure TfrmEditRealTimeTrack.mnInfraredDecoyClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsOther;
end;

procedure TfrmEditRealTimeTrack.mnJammerDecoyClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsOther;
end;

procedure TfrmEditRealTimeTrack.mnLandClick(Sender: TObject);
begin
  edtDomainTrack.Text := vhdsLand;
end;

procedure TfrmEditRealTimeTrack.mnMerchantClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsMerchant;
end;

procedure TfrmEditRealTimeTrack.mnMineWarClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsMineWarfare;
end;

procedure TfrmEditRealTimeTrack.mnNeutralClick(Sender: TObject);
begin
  edtIdentityTrack.Text := 'Neutral';
end;

procedure TfrmEditRealTimeTrack.mnOtherClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsOther;
end;

procedure TfrmEditRealTimeTrack.mnPatrolCraffClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsPatrolCraft;
end;

procedure TfrmEditRealTimeTrack.mnPendingClick(Sender: TObject);
begin
  edtIdentityTrack.Text := 'Pending';
end;

procedure TfrmEditRealTimeTrack.mnSubsurfaceClick(Sender: TObject);
begin
  edtDomainTrack.Text := vhdsSubsurface;
end;

procedure TfrmEditRealTimeTrack.mnSurfaceClick(Sender: TObject);
begin
  edtDomainTrack.Text := vhdsSurface;
end;

procedure TfrmEditRealTimeTrack.mnSuspentClick(Sender: TObject);
begin
  edtIdentityTrack.Text := 'Suspect';
end;

procedure TfrmEditRealTimeTrack.mnUnknownClick(Sender: TObject);
begin
  edtIdentityTrack.Text := 'Unknown';
end;

procedure TfrmEditRealTimeTrack.mnUtilityClick(Sender: TObject);
begin
  edtTypeTrack.Text := vhtsUtilityVess;
end;

procedure TfrmEditRealTimeTrack.SetRecord;
var
   domain, identity, platformType : Integer;
begin
  domain := 1;
  identity := 0;
  platformType := 40;

  if edtDomainTrack.Text = vhdsAir then
    domain := vhdAir
  else if edtDomainTrack.Text = vhdsSurface then
    domain := vhdSurface
  else if edtDomainTrack.Text = vhdsSubsurface then
    domain := vhdSubsurface
  else if edtDomainTrack.Text = vhdsLand then
    domain := vhdLand
  else if edtDomainTrack.Text = vhdsGeneral then
    domain := vhdGeneral;

  if edtIdentityTrack.Text = pfPending then
    identity := piPending
  else if edtIdentityTrack.Text = pfUnknown then 
    identity := piUnknown
  else if edtIdentityTrack.Text = pfAssumedFriend then
    identity := piAssumedFriend
  else if edtIdentityTrack.Text = pfFriend then
    identity := piFriend
  else if edtIdentityTrack.Text = pfNeutral then
    identity := piNeutral
  else if edtIdentityTrack.Text = pfSuspect then
    identity := piSuspect
  else if edtIdentityTrack.Text = pfHostile then
    identity := piHostile;

  if edtTypeTrack.Text = vhtsAirCarrier then
    platformType := vhtAirCarrier
  else if edtTypeTrack.Text = vhtsAmphibious then
    platformType := vhtAmphibious
  else if edtTypeTrack.Text = vhtsAuxiliary then
    platformType := vhtAuxiliary
  else if edtTypeTrack.Text = vhtsOther then
    platformType := vhtOther
  else if edtTypeTrack.Text = vhtsCruiseGuided then
    platformType := vhtCruiseGuided
  else if edtTypeTrack.Text = vhtsDestroyer then
    platformType := vhtDestroyer
  else if edtTypeTrack.Text = vhtsDestroGuided then
    platformType := vhtDestroGuided
  else if edtTypeTrack.Text = vhtsFrigate then
    platformType := vhtFrigate
  else if edtTypeTrack.Text = vhtsFrigatGuided then
    platformType := vhtFrigatGuided
  else if edtTypeTrack.Text = vhtsMineWarfare then
    platformType := vhtMineWarfare
  else if edtTypeTrack.Text = vhtsMerchant then
    platformType := vhtMerchant
  else if edtTypeTrack.Text = vhtsPatrolCraft then
    platformType := vhtPatrolCraft
  else if edtTypeTrack.Text = vhtsUtilityVess then
    platformType := vhtUtilityVess;

  if (Data is TT3NonRealVehicle ) then
  begin
    rec.PlatfomID := TT3NonRealVehicle(Data).InstanceIndex;
    rec.domain    := domain;
    rec.identity  := identity;
    rec.TypeNRP   := TT3NonRealVehicle(Data).NRPType;
    rec.platformType := platformType;
    rec.Force :=  TT3NonRealVehicle(Data).Force_Designation;
  end
  else if (Data is TT3Vehicle) then
  begin
    recVehicle.PlatfomID := TT3Vehicle(Data).InstanceIndex;
    recVehicle.domain := domain;
    recVehicle.identity := identity;
    recVehicle.platformType := platformType;
  end
  else if (Data is TT3ESMTrack) then
  begin
    recESM.PlatfomID := TT3DetectedTrack(Data.Parent).TrackObject.InstanceIndex;
    recESM.Tracknumber := TT3ESMTrack(Data).TrackNumber;
    recESM.domain := domain;
    recESM.identity := identity;
  end
  else if (Data is TT3DetectedTrack) then
  begin
    recVehicle.PlatfomID := TT3DetectedTrack(Data).TrackObject.InstanceIndex;
    recVehicle.domain := domain;
    recVehicle.identity := identity;
    recVehicle.platformType := platformType;
  end;
end;

procedure TfrmEditRealTimeTrack.UpdateInfo(obj: TSimObject);
var
  domainStr, TypeStr, IdentityStr : string;
  domain, identity : Integer;
begin
  domain   := -1;
  identity := -1;

  if obj is TT3PlatformInstance then
  begin
    edtNameTrack.Text := TT3PlatformInstance(obj).InstanceName;
    edtClassTrack.Text:= TT3PlatformInstance(obj).InstanceClass;
    identity          := TT3PlatformInstance(obj).TrackIdent;

    if obj is TT3NonRealVehicle then
      domain := TT3NonRealVehicle(obj).TrackDomain
    else
      domain := TT3PlatformInstance(obj).PlatformDomain;

    case TT3PlatformInstance(obj).PlatformType of
      vhtAirCarrier:
        TypeStr := vhtsAirCarrier;
      vhtAmphibious:
        TypeStr := vhtsAmphibious;
      vhtAuxiliary:
        TypeStr := vhtsAuxiliary;
      // vhtchaff
      vhtCruiseGuided:
        TypeStr := vhtsCruiseGuided;
      vhtDestroyer:
        TypeStr := vhtsDestroyer;
      vhtDestroGuided:
        TypeStr := vhtsDestroGuided;
      vhtFrigate:
        TypeStr := vhtsFrigate;
      vhtFrigatGuided:
        TypeStr := vhtsFrigatGuided;
      // vhtInfraredDecoy
      // vhtJammerDecoy
      vhtMerchant:
        TypeStr := vhtsMerchant;
      // vhtMainWarefare
      vhtPatrolCraft:
        TypeStr := vhtsPatrolCraft;
      vhtUtilityVess:
        TypeStr := vhtsUtilityVess;
      vhtOther:
        TypeStr := vhtsOther;
    else
      TypeStr := vhtsOther;
    end;

    edtTypeTrack.Text := TypeStr;
  end
  else if obj is TT3DetectedTrack then
  begin
    edtNameTrack.Text   := FormatTrackNumber(TT3DetectedTrack(obj).TrackNumber);
    edtClassTrack.Text  := '---';
    edtTypeTrack.Text   := 'Detected Track';
    domain              := TT3DetectedTrack(obj).TrackDomain;
    identity            := TT3DetectedTrack(obj).TrackIdent;
  end
  else if obj is TT3ESMTrack then
  begin
    edtNameTrack.Text   := TT3ESMTrack(obj).TrackNumber;
    edtClassTrack.Text  := '---';
    edtTypeTrack.Text   := 'ESM Track';
    domain              := TT3ESMTrack(obj).TrackDomain;
    identity            := TT3ESMTrack(obj).TrackIdent;
  end;

  case domain of
    vhdAir:
      domainStr := vhdsAir;
    vhdSurface:
      domainStr := vhdsSurface;
    vhdSubsurface:
      domainStr := vhdsSubsurface;
    vhdLand:
      domainStr := vhdsLand;
    vhdGeneral:
      domainStr := vhdsGeneral;
  end;
  edtDomainTrack.Text := domainStr;

  case identity of
    piPending:
      IdentityStr := 'Pending';
    piUnknown:
      IdentityStr := 'Unknown';
    piAssumedFriend:
      IdentityStr := 'Assumedfriend';
    piFriend:
      IdentityStr := 'Friend';
    piNeutral:
      IdentityStr := 'Neutral';
    piSuspect:
      IdentityStr := 'Suspect';
    piHostile:
      IdentityStr := 'Hostile';
  end;
  edtIdentityTrack.Text := IdentityStr;

  // propultion belum diupdate.
end;

procedure TfrmEditRealTimeTrack.UpdateView(obj: TSimObject);
begin
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    if obj is TT3NonRealVehicle then
    begin
      if TT3NonRealVehicle(obj).NRPType = nrpSpecial then
      begin
        BTtype.Enabled := false;
        BTdomain.Enabled := false;
      end
      else
      begin
        BTtype.Enabled := true;
        BTdomain.Enabled := true;
      end;

      BTidentity.Enabled := true;
    end else
    begin
      BTtype.Enabled := false;
      BTdomain.Enabled := false;
      BTidentity.Enabled := false;
    end;
  end
  else
  begin
    if obj is TT3PlatformInstance then
    begin
      if obj is TT3NonRealVehicle then
      begin
        if TT3NonRealVehicle(obj).NRPType = nrpSpecial then
        begin
          BTtype.Enabled := false;
          BTdomain.Enabled := false;
        end
        else
        begin
          BTtype.Enabled := true;
          BTdomain.Enabled := true;
        end;

        BTidentity.Enabled := true;
      end else
      begin
        BTtype.Enabled := false;
        BTdomain.Enabled := false;
        BTidentity.Enabled := false;
      end;
    end
    else if obj is TT3DetectedTrack then
    begin
      BTtype.Enabled := false;
      BTdomain.Enabled := false;
      BTidentity.Enabled := true;
    end
    else if obj is TT3ESMTrack then
    begin
      BTtype.Enabled := false;
      BTdomain.Enabled := true;
      BTidentity.Enabled := true;
    end else
    begin
      BTtype.Enabled := false;
      BTdomain.Enabled := false;
      BTidentity.Enabled := false;
    end;
  end;
end;

end.
