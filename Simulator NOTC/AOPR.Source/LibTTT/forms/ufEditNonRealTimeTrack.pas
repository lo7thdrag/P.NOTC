unit ufEditNonRealTimeTrack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, ExtCtrls, uT3Vehicle, uT3Unit,
  uSimObjects, uGameData_TTT, System.ImageList;

type
  TfrmEditNonRealTimeTrack = class(TForm)
    Lbltrack: TLabel;
    lbltrack1: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    edtnameTrack: TEdit;
    edtTypeEditNonRealTimeTrack: TEdit;
    btnType: TButton;
    ImageList1: TImageList;
    btnclose: TButton;
    PmenuType: TPopupMenu;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtDomain: TEdit;
    Label6: TLabel;
    edtIdentity: TEdit;
    edtforce: TEdit;
    edtposLat: TEdit;
    btnDomain: TButton;
    btnforce: TButton;
    btnPosition: TButton;
    lbAltitude: TLabel;
    edtAltitude: TEdit;
    Label8: TLabel;
    edtCourse: TEdit;
    lbCourse: TLabel;
    Label10: TLabel;
    lbGroundSpeed: TLabel;
    edtGroundSpeed: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtClass: TEdit;
    edtPlatformType: TEdit;
    edtPropulsionType: TEdit;
    edtLastUpdated: TEdit;
    edtTrackIden: TEdit;
    btnPlatformType: TButton;
    btnpropulsiontype: TButton;
    btnLastUpdated: TButton;
    NonRealTime1: TMenuItem;
    NonRealTimeBearingTrack1: TMenuItem;
    NonRealTime2: TMenuItem;
    SpecialPoint1: TMenuItem;
    pmDomain: TPopupMenu;
    Air1: TMenuItem;
    Surface1: TMenuItem;
    Subsurface1: TMenuItem;
    Land1: TMenuItem;
    General1: TMenuItem;
    pmIdentity: TPopupMenu;
    Pending1: TMenuItem;
    Unknown1: TMenuItem;
    AssumedFriend1: TMenuItem;
    Friend1: TMenuItem;
    Neutral1: TMenuItem;
    Suspect1: TMenuItem;
    Hostile1: TMenuItem;
    pmforce: TPopupMenu;
    ForceRed1: TMenuItem;
    ForceBlue1: TMenuItem;
    ForceGreen1: TMenuItem;
    ForceAmber1: TMenuItem;
    NoForce1: TMenuItem;
    pmPlatformType: TPopupMenu;
    pmPropulsionType: TPopupMenu;
    btnIdentityTrack: TButton;
    Acoustic1: TMenuItem;
    Unknown2: TMenuItem;
    Convensional1: TMenuItem;
    Nuclear1: TMenuItem;
    grpNonRealPoint: TGroupBox;
    grpRealTime: TGroupBox;
    grpNonRealBearing: TGroupBox;
    grpNonRealSpecial: TGroupBox;
    grpNonRealAOP: TGroupBox;
    grpESM: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtNameRT: TEdit;
    edtClassTrack: TEdit;
    edtTypeTrack: TEdit;
    edtDomainTrack: TEdit;
    edtIdentityTrack: TEdit;
    edtPropulsionTypeTrack: TEdit;
    btnBTtype: TButton;
    btnBTpropulsiontype: TButton;
    pmpumtype: TPopupMenu;
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
    j: TPopupMenu;
    mnAir: TMenuItem;
    mnSurface: TMenuItem;
    mnSubsurface: TMenuItem;
    mnLand: TMenuItem;
    mnGeneral: TMenuItem;
    pmpumidentity: TPopupMenu;
    mnPending: TMenuItem;
    mnUnknown: TMenuItem;
    mnAssumedFriend: TMenuItem;
    mnFriend: TMenuItem;
    mnNeutral: TMenuItem;
    mnSuspent: TMenuItem;
    mnHostile: TMenuItem;
    lbl7: TLabel;
    edtNRBBearing: TEdit;
    btnBearingDomain: TButton;
    btnBearingIdentity: TButton;
    lbl8: TLabel;
    lbl9: TLabel;
    edtNRBForce: TEdit;
    btn3: TButton;
    edtNRBPosLat: TEdit;
    btn4: TButton;
    lbl10: TLabel;
    lbl11: TLabel;
    edtNRBIdentity: TEdit;
    edtNRBDomain: TEdit;
    lbl12: TLabel;
    lbl13: TLabel;
    edtAOPDomain: TEdit;
    btn1: TButton;
    edtAOPIdentity: TEdit;
    btn2: TButton;
    lbl14: TLabel;
    lbl15: TLabel;
    edtAOPForce: TEdit;
    btn5: TButton;
    btn6: TButton;
    edtAOPPosLat: TEdit;
    lbl16: TLabel;
    lbl17: TLabel;
    edtAOPGroundSpeed: TEdit;
    lbl18: TLabel;
    lbl19: TLabel;
    edtNRSDomain: TEdit;
    btn7: TButton;
    edtNRSSymbolType: TEdit;
    btn8: TButton;
    lbl20: TLabel;
    lbl21: TLabel;
    edtNRSForce: TEdit;
    btn9: TButton;
    btn10: TButton;
    edtNRSPosLat: TEdit;
    lbl22: TLabel;
    lbl23: TLabel;
    edtNRSAltitude: TEdit;
    lbl24: TLabel;
    btn11: TButton;
    edtESMForce: TEdit;
    lbl25: TLabel;
    lbl26: TLabel;
    edtESMIdentity: TEdit;
    btn12: TButton;
    btn13: TButton;
    edtESMDomain: TEdit;
    lbl27: TLabel;
    edtESMOrigin: TEdit;
    btn14: TButton;
    lbl28: TLabel;
    btnDomainRT: TButton;
    btnIdentityRT: TButton;
    btnPropReal: TButton;
    pmGeneralSpecial: TPopupMenu;
    pmAirSpecial: TPopupMenu;
    pmASW: TPopupMenu;
    ASWGeneral1: TMenuItem;
    BriefContact1: TMenuItem;
    Datum1: TMenuItem;
    Kingpin1: TMenuItem;
    Riser1: TMenuItem;
    SearchCenter1: TMenuItem;
    Sinker1: TMenuItem;
    WeaponEntryPoint1: TMenuItem;
    Wreck1: TMenuItem;
    AirGeneral1: TMenuItem;
    AirborneEarlyWarning1: TMenuItem;
    Bullseye1: TMenuItem;
    CombatAirPatrol1: TMenuItem;
    DitchedAirCraft1: TMenuItem;
    Gate1: TMenuItem;
    General2: TMenuItem;
    Bouy1: TMenuItem;
    DatalinkReferencePoint1: TMenuItem;
    DistressedVessel1: TMenuItem;
    ESMECMFix1: TMenuItem;
    GroundZero1: TMenuItem;
    ManInZero1: TMenuItem;
    MaritimeHeadquarter1: TMenuItem;
    MineHazard1: TMenuItem;
    NavigationHazart1: TMenuItem;
    OilRig1: TMenuItem;
    Station1: TMenuItem;
    acticalGridOrigin1: TMenuItem;
    edtTrackNumber: TEdit;
    pnlTabTrack: TPanel;
    pnlPageControlTrackDetail: TPanel;
    pnlTabDetail: TPanel;
    pnlContentDetail: TPanel;
    pnlTop: TPanel;
    pnlBot: TPanel;
    pnlContentTrack: TPanel;
    Amphibious1: TMenuItem;
    edtposLong: TEdit;
    edtNRBPosLong: TEdit;
    edtAOPPosLong: TEdit;
    edtNRSPosLong: TEdit;
    procedure btnTypeClick(Sender: TObject);
    procedure btnDomainClick(Sender: TObject);
    procedure btnforceClick(Sender: TObject);
    procedure btnIdentityTrackClick(Sender: TObject);
    procedure btnPlatformTypeClick(Sender: TObject);
    procedure btnpropulsiontypeClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
//    procedure ForceRed1Click(Sender: TObject);
//    procedure ForceBlue1Click(Sender: TObject);
//    procedure ForceGreen1Click(Sender: TObject);
//    procedure ForceAmber1Click(Sender: TObject);
//    procedure NoForce1Click(Sender: TObject);

    procedure edtGroundSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure edtCourseKeyPress(Sender: TObject; var Key: Char);
    procedure edtAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure btnPositionClick(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure ASWGeneral1Click(Sender: TObject);
    procedure mnAirClick(Sender: TObject);
    procedure mnPendingClick(Sender: TObject);
    procedure edtTrackNumberKeyPress(Sender: TObject; var Key: Char);
    procedure edtnameTrackKeyPress(Sender: TObject; var Key: Char);
    procedure edtClassTrackKeyPress(Sender: TObject; var Key: Char);
    procedure btnLastUpdatedClick(Sender: TObject);

    procedure pgControlTrackDetailClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure nrtTypeChangeClick(Sender: TObject);

    procedure DomainChangeClick(Sender: TObject);
    procedure IdentityChangeClick(Sender: TObject);
    procedure ForceChangeClick(Sender: TObject);
    procedure edtPositionCenterKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    FMapPositionX: double;
    FMapPositionY: double;

    identity : integer;
    domain : Integer;
    force : Integer;
    sym   : string;

    function GetDomainStr(const vDomain: Integer):string;
    function GetIdentityStr(const vIdentity: Integer):string;
    function GetForceStr(const vForce: Integer):string;

    procedure SetMapPositionX(const Value: double);
    procedure SetMapPositionY(const Value: double);
    procedure setESMProperty;
  public
    { Public declarations }
    Data : TSimObject;
    rec : TRecCmd_NRP_SET_PROPERTY;
    recVehicle: TRecCmd_Platform_SET_PROPERTY;    //test mk
    recESM : TRecCmd_ESM_SET_PROPERTY;

    procedure SetDomainText(value : String);
    procedure SetIdentityText(value : String);
    procedure SetForceText(value : String);

    procedure SetRecord;

    property MapPositionX : double read FMapPositionX write SetMapPositionX;
    property MapPositionY : double read FMapPositionY write SetMapPositionY;

    procedure UpdateGeneralInfo(obj : TSimObject);
    procedure UpdateDetailInfo(obj : TSimObject);
    procedure UpdateTrackInfo(obj : TSimObject);
    procedure UpdateViewBtn(obj : TSimObject);
  end;

var
  frmEditNonRealTimeTrack: TfrmEditNonRealTimeTrack;

implementation

uses
  tttData, uMapXHandler,
  uSimMgr_Client, uBaseCoordSystem, uT3DetectedTrack, ufTacticalDisplay,
  StrUtils, ufrmKeyboard;

{$R *.dfm}

procedure TfrmEditNonRealTimeTrack.ASWGeneral1Click(Sender: TObject);
begin
  edtNRSSymbolType.Text := TMenuItem(Sender).Hint;
  sym := TMenuItem(Sender).Hint;

  SetRecord;
  rec.symbol := pciAswGeneral;
  rec.OrderID := NRP_ID_SYMBOLTYPE;
  //TT3NonRealVehicle(Data).SymbolType := sym;

  simMgrClient.netSend_CmdNRP_CHANGE_PROPERTY(rec);
end;

procedure TfrmEditNonRealTimeTrack.btn8Click(Sender: TObject);
var
  p: Tpoint;
begin
  GetCursorPos(p);
  case TT3NonRealVehicle(Data).TrackDomain of
    vhdAir : pmAirSpecial.Popup(p.X, p.Y);
    vhdGeneral : pmGeneralSpecial.Popup(p.X, p.Y);

  else
    pmASW.Popup(p.X, p.Y);
  end;
end;

procedure TfrmEditNonRealTimeTrack.btncloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditNonRealTimeTrack.btnDomainClick(Sender: TObject);
var
  p: Tpoint;
begin
  GetCursorPos(p);
  pmDomain.Popup(p.X, p.Y);
end;

procedure TfrmEditNonRealTimeTrack.btnforceClick(Sender: TObject);
var
  p: Tpoint;
begin
  GetCursorPos(p);
  pmforce.Popup(p.X, p.Y);

end;

procedure TfrmEditNonRealTimeTrack.btnIdentityTrackClick(Sender: TObject);
var
 p: Tpoint;
begin
  GetCursorPos(p);
  pmIdentity.Popup(p.X,p.Y);
end;

procedure TfrmEditNonRealTimeTrack.btnLastUpdatedClick(Sender: TObject);
var
  v: TT3NonRealVehicle;
  aRec : TRecCmd_LastUpdatePlatform;
  DateStr : string;
begin
  DateStr := DateTimeToStr(Now);
  edtLastUpdated.Text := DateStr;
  if Assigned(Data) and (Data is TT3NonRealVehicle) then
  begin
    v := data as TT3NonRealVehicle;

    aRec.PlatfomID := v.InstanceIndex;
    aRec.UpdateTime := DateStr;
    SimMgrClient.netSend_CmdLastUpdatePlatform(aRec);
  end;
end;

procedure TfrmEditNonRealTimeTrack.btnPlatformTypeClick(Sender: TObject);
var
  p: Tpoint;
begin
  GetCursorPos (p);
  pmPlatformType.Popup(p.X, p.Y);
end;

procedure TfrmEditNonRealTimeTrack.btnpropulsiontypeClick(Sender: TObject);
var
 p: Tpoint;
begin
 GetCursorPos(p);
 pmPropulsionType.Popup(p.X, p.Y);
end;

procedure TfrmEditNonRealTimeTrack.btnTypeClick(Sender: TObject);
var
  p: Tpoint;
begin
  if not (Data is TT3NonRealVehicle) then
    Exit;

  GetCursorPos(p);
  PmenuType.Popup(p.X, p.Y);
end;

procedure TfrmEditNonRealTimeTrack.btnPositionClick(Sender: TObject);
begin
  VSimMap.FMap.CurrentTool := mtDeployPosition;
end;

procedure TfrmEditNonRealTimeTrack.edtClassTrackKeyPress(Sender: TObject; var Key: Char);
var
  value : string;
  rec : TRecCmd_Platform_CHANGE_TRACKNUMBER;
begin
  if Key = #13 then
  begin
    value := TEdit(Sender).Text;

    if data is TT3DetectedTrack then
    begin
      {$REGION ' DetectedTrack Section '}
      rec.OrderID := CORD_ID_CLASS;
      rec.typeTrack := 'DetectedTrack';
      rec.PlatfomID := TT3DetectedTrack(Data).TrackObject.InstanceIndex;
      rec.TrackID   := TT3DetectedTrack(Data).TrackNumber;
      rec.newClass := value;

      simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
      {$ENDREGION}
    end
//    else if data is TT3NonRealVehicle then
//    begin
//      {$REGION ' Non Real Time Section '}
//      rec.OrderID := CORD_ID_CLASS;
//      rec.typeTrack := 'NRTTrack';
//      rec.PlatfomID := TT3NonRealVehicle(Data).InstanceIndex;
//      rec.TrackID   := TT3NonRealVehicle(Data).TrackNumber;
//      rec.newClass := value;
//
//      simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
//      {$ENDREGION}
//    end;
  end;
end;

procedure TfrmEditNonRealTimeTrack.edtnameTrackKeyPress(Sender: TObject; var Key: Char);
var
  value : string;
  rec : TRecCmd_Platform_CHANGE_TRACKNUMBER;
begin
  if Key = #13 then
  begin
    value := TEdit(Sender).Text;

    if data is TT3DetectedTrack then
    begin
      {$REGION ' DetectedTrack Section '}
      rec.OrderID := CORD_ID_NAME;
      rec.typeTrack := 'DetectedTrack';
      rec.PlatfomID := TT3DetectedTrack(Data).TrackObject.InstanceIndex;
      rec.TrackID   := TT3DetectedTrack(Data).TrackNumber;
      rec.newName := value;

      simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
      {$ENDREGION}
    end
//    else if data is TT3NonRealVehicle then
//    begin
//      {$REGION ' Non Real Time Section '}
//      rec.OrderID := CORD_ID_NAME;
//      rec.typeTrack := 'NRTTrack';
//      rec.PlatfomID := TT3NonRealVehicle(Data).InstanceIndex;
//      rec.TrackID   := TT3NonRealVehicle(Data).TrackNumber;
//      rec.newName := value;
//
//      simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
//      {$ENDREGION}
//    end;
  end;
end;

procedure TfrmEditNonRealTimeTrack.edtTrackNumberKeyPress(Sender: TObject;
      var Key: Char);
var
  ValKey : set of AnsiChar;
  rec: TRecCmd_Platform_CHANGE_TRACKNUMBER;
  value : Integer;
  detected : TT3DetectedTrack;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToInt(TEdit(Sender).Text, value);
    if Assigned(Data) then
    begin
      if Data is TT3DetectedTrack then
      begin
        {$REGION ' DetectedTrack Section '}
        rec.OrderID := CORD_ID_TRACKNUMBER;
        rec.typeTrack := 'DetectedTrack';
        rec.PlatfomID := TT3DetectedTrack(Data).TrackObject.InstanceIndex;
        rec.TrackID   := TT3DetectedTrack(Data).TrackNumber;
        rec.newTrackNumber := value;

        simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
        {$ENDREGION}
      end
      else if data is TT3ESMTrack then
      begin
        {$REGION ' ESMTrack Section '}
        detected := TT3ESMTrack(Data).Parent as TT3DetectedTrack;
        rec.typeTrack := 'ESMTrack';
        rec.PlatfomID := detected.TrackObject.InstanceIndex;
        rec.TrackID   := detected.TrackNumber;
        rec.newTrackNumber := -1;

        //set ESM ol dan new
        rec.oldESMNumber := TT3ESMTrack(Data).TrackNumber;
        rec.newESMNumber := IntToStr(value);

        simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
        {$ENDREGION}
      end
      else if data is TT3NonRealVehicle then
      begin
        {$REGION ' Non Real Time Section '}
        rec.OrderID := CORD_ID_TRACKNUMBER;
        rec.typeTrack := 'NRTTrack';
        rec.PlatfomID := TT3NonRealVehicle(Data).InstanceIndex;
        rec.TrackID   := TT3NonRealVehicle(Data).TrackNumber;
        rec.newTrackNumber := value;

        simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
        {$ENDREGION}
      end;
    end;
  end;
end;

procedure TfrmEditNonRealTimeTrack.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmEditNonRealTimeTrack.FormShow(Sender: TObject);
begin
  if Assigned(Data) then
  begin
    UpdateGeneralInfo(Data);
    UpdateTrackInfo(Data);
    UpdateDetailInfo(Data);
    UpdateViewBtn(Data);
  end;
end;

procedure TfrmEditNonRealTimeTrack.mnAirClick(Sender: TObject);
var
  dmn : Integer;
begin
  //untuk Detected track
  dmn := -1;

  case TMenuItem(Sender).Tag of
    vhdAir :
    begin
      dmn := vhdAir;
    end;
    vhdSurface :
    begin
      dmn := vhdSurface;
    end;
    vhdSubsurface :
    begin
      dmn := vhdSubsurface;
    end;
    vhdLand :
    begin
      dmn := vhdLand;
    end;
    vhdGeneral :
    begin
      dmn := vhdGeneral;
    end;

    vhdWreck : ;
    vhdAmphibious : ;
  end;

  if dmn <> -1 then
    frmTacticalDisplay.UpdatePlatformProperties(Data, dmn, -1, -1);
end;

procedure TfrmEditNonRealTimeTrack.mnPendingClick(Sender: TObject);
var
  id : Integer;
begin
  //Unutk detected Track
  id := -1;

  case TMenuItem(Sender).Tag of
    piPending :
    begin
      id := piPending;
    end;
    piUnknown :
    begin
      id := piUnknown;
    end;
    piAssumedFriend :
    begin
      id := piAssumedFriend;
    end;
    piFriend :
    begin
      id := piFriend;
    end;
    piNeutral :
    begin
      id := piNeutral;
    end;
    piSuspect :
    begin
      id := piSuspect;
    end;
    piHostile :
    begin
      id := piHostile;
    end;
  end;

  if id <> -1 then
    frmTacticalDisplay.UpdatePlatformProperties(Data, -1, id, -1);
end;

procedure TfrmEditNonRealTimeTrack.nrtTypeChangeClick(Sender: TObject);
var
   NRPGroupID : Integer;

begin
  if Assigned(Data) then
  begin
    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      NRPGroupID := 0
    else
      NRPGroupID := simMgrClient.FMyCubGroup.FData.Group_Index;

    rec.PlatfomID := TT3NonRealVehicle(Data).InstanceIndex;
    rec.domain := Self.domain;
    rec.identity := Self.identity;
    rec.TypeNRP := TT3NonRealVehicle(Data).NRPType;
    rec.platformType := TT3NonRealVehicle(Data).PlatformType;
    rec.Force  := Self.force;

    simMgrClient.netSend_CmdPlatform_Move(TT3Unit(Data).InstanceIndex, CORD_ID_REPOS, MapPositionX, MapPositionY, NRPGroupID);

    case TMenuItem(Sender).Tag of
      nrpPoint :
      begin
        {$REGION ' Point '}
        edtTypeEditNonRealTimeTrack.Text := nrpsPoint;

        rec.TypeNRP := nrpPoint;
        rec.OrderID := NRP_ID_TYPE;

        simMgrClient.netSend_CmdNRP_CHANGE_PROPERTY(rec);
        {$ENDREGION}
      end;
      nrpBearing  :
      begin
        {$REGION ' Bearing '}
        edtTypeEditNonRealTimeTrack.Text := nrpsBearing;

        rec.TypeNRP := nrpBearing;
        rec.OrderID := NRP_ID_TYPE;

        simMgrClient.netSend_CmdNRP_CHANGE_PROPERTY(rec);
        SimMgrClient.netSend_CmdPlatform(TT3NonRealVehicle(Data).InstanceIndex, CORD_ID_MOVE, CORD_TYPE_SPEED, 0);
        {$ENDREGION}
      end;
      nrpArea  :
      begin
        {$REGION ' Area '}
        edtTypeEditNonRealTimeTrack.Text := nrpsArea;
//        SetRecord;

        rec.TypeNRP := nrpArea;
        rec.OrderID := NRP_ID_TYPE;

        simMgrClient.netSend_CmdNRP_CHANGE_PROPERTY(rec);
        {$ENDREGION}
      end;
      nrpSpecial :
      begin
        {$REGION ' Special '}
        edtTypeEditNonRealTimeTrack.Text := nrpsSpecial;
//        SetRecord;

        rec.TypeNRP := nrpSpecial;
        rec.OrderID := NRP_ID_TYPE;

        simMgrClient.netSend_CmdNRP_CHANGE_PROPERTY(rec);
        {$ENDREGION}
      end;
    end;
  end


end;

procedure TfrmEditNonRealTimeTrack.pgControlTrackDetailClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: TPanel;
begin
  panel := Sender as TPanel;
  PanelTag := panel.Tag;

  if panel = pnlTabTrack then
  begin
    if PanelTag = 0 then
    begin
      pnlTabTrack.Color := RGB(44, 127, 161);
      pnlContentTrack.BringToFront;

      pnlTabTrack.Tag := 1;
      pnlTabDetail.Tag := 0;
      pnlTabDetail.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabDetail then
  begin
    if PanelTag = 0 then
    begin
      pnlTabDetail.Color := RGB(44, 127, 161);
      pnlContentDetail.BringToFront;

      pnlTabDetail.Tag := 1;
      pnlTabTrack.Tag := 0;
      pnlTabTrack.Color := RGB(29, 81, 103);
    end;
  end;

end;

procedure TfrmEditNonRealTimeTrack.SetMapPositionX(const Value: double);
begin
  FMapPositionX := Value;
//  edtPosition.Text := formatDM_longitude(FMapPositionX) + '  '
//  + formatDM_latitude(FMapPositionY);
end;

procedure TfrmEditNonRealTimeTrack.SetMapPositionY(const Value: double);
begin
  FMapPositionY := Value;
//  edtPosition.Text := formatDM_longitude(FMapPositionX) + '  '
//  + formatDM_latitude(FMapPositionY);
end;

procedure TfrmEditNonRealTimeTrack.setESMProperty;
begin
  recESM.PlatfomID := TT3DetectedTrack(Data.Parent).TrackObject.InstanceIndex;
  recESM.Tracknumber := TT3ESMTrack(Data).TrackNumber;
  recESM.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;
  recESM.domain := domain;
  recESM.identity := identity;
end;

procedure TfrmEditNonRealTimeTrack.SetRecord;
var
   NRPGroupID : Integer;
begin
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
    NRPGroupID := 0
  else
    NRPGroupID := simMgrClient.FMyCubGroup.FData.Group_Index;

  if (Data is TT3NonRealVehicle ) then
  begin
    rec.PlatfomID := TT3NonRealVehicle(Data).InstanceIndex;
    rec.domain := Self.domain;
    rec.identity := Self.identity;
    rec.TypeNRP := TT3NonRealVehicle(Data).NRPType;
    rec.platformType := TT3NonRealVehicle(Data).PlatformType;
    rec.Force  := Self.force;
    rec.symbol := pciAswGeneral;

    simMgrClient.netSend_CmdPlatform_Move(TT3Unit(Data).InstanceIndex, CORD_ID_REPOS, MapPositionX, MapPositionY, NRPGroupID);
  end
  else if (Data is TT3Vehicle) then
  begin
    recVehicle.PlatfomID := TT3Vehicle(Data).InstanceIndex;

    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      recVehicle.GrpID := 0
    else
      recVehicle.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;
  end
  else if (Data is TT3ESMTrack) then    //sementara gni dlu y
  begin
    setESMProperty;
  end
  else if (Data is TT3DetectedTrack) then
  begin
    recVehicle.PlatfomID := TT3DetectedTrack(Data).TrackObject.InstanceIndex;

    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      recVehicle.GrpID := 0
    else
      recVehicle.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;
  end;
end;

procedure TfrmEditNonRealTimeTrack.UpdateViewBtn(obj: TSimObject);
begin
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    if obj is TT3NonRealVehicle then
    begin
      btnDomainRT.Enabled := true;
      btnIdentityRT.Enabled := true;
      btnPropReal.Enabled := true;
    end else
    begin
      btnDomainRT.Enabled := false;
      btnIdentityRT.Enabled := false;
      btnPropReal.Enabled := false;
    end;
  end
  else
  begin
    if obj is TT3PlatformInstance then
    begin
      if obj is TT3NonRealVehicle then
      begin
        btnDomainRT.Enabled := true;
        btnIdentityRT.Enabled := true;
        btnPropReal.Enabled := true;
      end else
      begin
        btnDomainRT.Enabled := false;
        btnIdentityRT.Enabled := false;
        btnPropReal.Enabled := false;
      end;
    end
    else if obj is TT3DetectedTrack then
    begin
      btnDomainRT.Enabled := false;
      btnIdentityRT.Enabled := true;
      btnPropReal.Enabled := false;
    end
    else if obj is TT3ESMTrack then
    begin
      btnDomainRT.Enabled := true;
      btnIdentityRT.Enabled := true;
      btnPropReal.Enabled := true;
    end else
    begin
      btnDomainRT.Enabled := false;
      btnIdentityRT.Enabled := false;
      btnPropReal.Enabled := false;
    end;
  end;
end;

procedure TfrmEditNonRealTimeTrack.UpdateGeneralInfo(obj: TSimObject);
begin
  if (obj is TT3DetectedTrack) or (obj is TT3ESMTrack) or (obj is TT3NonRealVehicle) then
  begin
    edtTrackNumber.Visible := True;
    edtnameTrack.Enabled := false;
    if obj is TT3DetectedTrack then
    begin
      Self.Caption := 'Edit Detected Track';
      edtTrackNumber.Text := FormatTrackNumber(TT3DetectedTrack(obj).TrackNumber);
      edtnameTrack.Text := TT3DetectedTrack(obj).TrackName;
      edtTypeEditNonRealTimeTrack.Text := 'Detected Track';
    end
    else if obj is TT3ESMTrack then
    begin
      Self.Caption := 'Edit ESM Track';
      edtTrackNumber.Text := TT3ESMTrack(obj).TrackNumber
    end
    else if obj is TT3NonRealVehicle then
    begin
      Self.Caption := 'Edit Non Real Time Track';
      edtTrackNumber.Text := FormatTrackNumber(TT3NonRealVehicle(obj).TrackNumber);
      edtnameTrack.Text := TT3NonRealVehicle(obj).InstanceName;

      case TT3NonRealVehicle(obj).NRPType of
        nrpPoint    : edtTypeEditNonRealTimeTrack.Text := nrpsPoint;
        nrpBearing  : edtTypeEditNonRealTimeTrack.Text := nrpsBearing;
        nrpArea     : edtTypeEditNonRealTimeTrack.Text := nrpsArea;
        nrpSpecial  : edtTypeEditNonRealTimeTrack.Text := nrpsSpecial;
      end;
    end;
  end
  else
  begin
    Self.Caption := 'Edit Real Time Track';
    edtTrackNumber.Visible := False;
  end;
end;

procedure TfrmEditNonRealTimeTrack.UpdateTrackInfo(obj : TSimObject);
var
  ptype, domainStr, IdentityStr, nrpType : string;
begin
  MapPositionX := obj.getPositionX;
  MapPositionY := obj.getPositionY;

  if obj is TT3PlatformInstance then
  begin
    {$REGION ' TT3PlatformInstance Track '}

    identity := TT3PlatformInstance(obj).TrackIdent;
    domain := TT3PlatformInstance(obj).TrackDomain;

    if obj is TT3NonRealVehicle then
    begin
      btnType.Enabled := true;
      btnDomain.Enabled := true;
      btnPlatformType.Enabled := true;
      btnforce.Enabled := true;
      btnPosition.Enabled := true;

      case TT3NonRealVehicle(obj).NRPType of
        nrpPoint :
        begin
          {$REGION ' Point '}
          edtDomain.Text := GetDomainStr(domain);
          edtIdentity.Text := GetIdentityStr(identity);
          edtforce.Text := GetForceStr(TT3PlatformInstance(obj).Force_Designation);
          edtposLat.Text := formatDMS_latt(FMapPositionY);
          edtposLong.Text := formatDMS_long(MapPositionX);

          edtCourse.Text := FloatToStr(TT3PlatformInstance(obj).Course);
          edtGroundSpeed.Text := FloatToStr(TT3PlatformInstance(obj).Speed);

          edtAltitude.Enabled := True;

          if domain = vhdAir then
          begin
            lbAltitude.Caption := 'Altitude :';
            Label8.Caption := 'feet';
            edtAltitude.Text := intToStr(round(TT3NonRealVehicle(obj).Altitude * C_Meter_To_Feet));
          end
          else
          begin
            lbAltitude.Caption := 'Depth :';
            Label8.Caption := 'meter';
            edtAltitude.Text := intToStr(round(TT3NonRealVehicle(obj).Altitude));

            if domain <> vhdSubsurface then
              edtAltitude.Enabled := False;
          end;

          grpNonRealPoint.BringToFront;

          {$ENDREGION}
        end;
        nrpBearing :
        begin
          {$REGION ' Bearing '}
          edtNRBDomain.Text := GetDomainStr(domain);
          edtNRBIdentity.Text := GetIdentityStr(identity);
          edtNRBForce.Text := GetForceStr(TT3PlatformInstance(obj).Force_Designation);
          edtNRBPosLat.Text := formatDMS_latt(FMapPositionY);
          edtNRBPosLong.Text := formatDMS_long(MapPositionX);
          edtNRBBearing.Text := FloatToStr(TT3NonRealVehicle(obj).LineVisual.Bearing);
          grpNonRealBearing.BringToFront;
          {$ENDREGION}
        end;
        nrpArea:
        begin
          {$REGION ' AOP '}
          edtAOPDomain.Text := GetDomainStr(domain);
          edtAOPIdentity.Text := GetIdentityStr(identity);
          edtAOPForce.Text := GetForceStr(TT3PlatformInstance(obj).Force_Designation);
          edtAOPPosLat.Text := formatDMS_latt(FMapPositionY);
          edtAOPPosLong.Text := formatDMS_long(MapPositionX);
          edtAOPGroundSpeed.Text := FloatToStr(TT3PlatformInstance(obj).Speed);
          grpNonRealAOP.BringToFront;
          {$ENDREGION}
        end;
        nrpSpecial:
        begin
          {$REGION ' Special '}
          edtNRSDomain.Text := GetDomainStr(domain);
          edtNRSSymbolType.Text := GetIdentityStr(identity);
          edtNRSForce.Text := GetForceStr(TT3PlatformInstance(obj).Force_Designation);
          edtNRSPosLat.Text := formatDMS_latt(FMapPositionY);
          edtNRSPosLong.Text := formatDMS_long(MapPositionX);
          edtNRSAltitude.Text := FloatToStr(TT3PlatformInstance(obj).Altitude);
          grpNonRealSpecial.BringToFront;
          {$ENDREGION}
        end;
      end;
    end
    else if obj is TT3Vehicle then
    begin
       domain := TT3PlatformInstance(obj).PlatformDomain;
    end;

    {$ENDREGION}
  end
  else if obj is TT3DetectedTrack then
  begin
    {$REGION ' Detected Track '}
    edtNameRT.Enabled := True;
    edtClassTrack.Enabled := True;

    edtNameRT.Text := TT3DetectedTrack(obj).TrackName;
    edtClassTrack.Text := TT3DetectedTrack(obj).TrackClass;

    edtTypeTrack.Text := ptype;
    edtDomainTrack.Text := GetDomainStr(TT3DetectedTrack(obj).TrackDomain);
    edtIdentityTrack.Text := GetIdentityStr(TT3DetectedTrack(obj).TrackIdent);

    {$ENDREGION}
  end
  else if obj is TT3ESMTrack then
  begin
    {$REGION ' ESM Track '}
    edtPlatformType.Text := 'ESM Track';
    edtTrackIden.Text := TT3ESMTrack(obj).TrackNumber;
    domain := TT3ESMTrack(obj).TrackDomain;
    identity := TT3ESMTrack(obj).TrackIdent;

    lbCourse.Caption := 'Course :';
    lbGroundSpeed.Caption := 'Ground Speed :';
    if TT3ESMTrack(obj).TrackDomain = vhdSubsurface then
      lbAltitude.Caption := 'Depth :'
    else
      lbAltitude.Caption := 'Altitude :';

    edtCourse.Enabled := false;
    edtGroundSpeed.Enabled := false;
    edtAltitude.Enabled := False;
    edtCourse.Text := FloatToStr(TT3ESMTrack(obj).Bearing);
    edtGroundSpeed.Text := FloatToStr(TT3ESMTrack(obj).Range);
    edtAltitude.Text := '-'
    {$ENDREGION}
  end;

  if obj is TT3PlatformInstance then
  begin
    if (obj is TT3NonRealVehicle) then
    begin
      //untuk nonrealtime
      edtAOPGroundSpeed.Text := FloatToStr(TT3NonRealVehicle(obj).OrderedSpeed);
      edtNRSAltitude.Text := FloatToStr(TT3PlatformInstance(obj).Altitude);
    end
    else if (obj is TT3Vehicle) then
    begin
      nrpType := '';
      btnType.Enabled := false;
      btnDomain.Enabled := false;
      btnforce.Enabled := false;
      btnPlatformType.Enabled := false;
      btnPosition.Enabled := false;
      btnpropulsiontype.Enabled := false;
    end;
  end
  else if obj is TT3DetectedTrack then
  begin
  end
  else if obj is TT3ESMTrack then
  begin

  end;
end;

procedure TfrmEditNonRealTimeTrack.UpdateDetailInfo(obj : TSimObject);
var
  objRealTime : TT3Vehicle;
  objNRP : TT3NonRealVehicle;
  objESM : TT3ESMTrack;
  objDetectedTrack : TT3DetectedTrack;
  pType : string;
begin
  {group box}
  if obj is TT3NonRealVehicle then
  begin
    {$REGION ' Non Real Time'}
    objNRP := obj as TT3NonRealVehicle;

    edtClass.Text := '---';
    edtPlatformType.Text := '---';
    edtPropulsionType.Text := '---';
    edtLastUpdated.Text := '---';
    edtTrackIden.Text := '---';
    {$ENDREGION}
  end
  else if obj is TT3Vehicle then
  begin
    {$REGION ' Vehicle '}
    objRealTime := obj as TT3Vehicle;

    //set data to groupbox non Real
    identity := objRealTime.TrackIdent;
    domain := objRealTime.TrackDomain;
    force := objRealTime.Force_Designation;

    edtNameRT.Text := objRealTime.InstanceName;
    edtClassTrack.Text := objRealTime.InstanceClass;

    edtnameTrack.Text := objRealTime.InstanceName;
    edtTypeEditNonRealTimeTrack.Text := 'Real Time Track ' + objRealTime.InstanceClass;

    case objRealTime.PlatformType of
      vhtAirCarrier     : ptype := vhtsAirCarrier;
      vhtAmphibious     : ptype := vhtsAmphibious;
      vhtAuxiliary      : ptype := vhtsAuxiliary;
      //vhtchaff
      vhtCruiseGuided   : ptype := vhtsCruiseGuided;
      vhtDestroyer      : ptype := vhtsDestroyer;
      vhtDestroGuided   : ptype := vhtsDestroGuided;
      vhtFrigate        : ptype := vhtsFrigate;
      vhtFrigatGuided   : ptype := vhtsFrigatGuided;
      //vhtInfraredDecoy
      //vhtJammerDecoy
      vhtMerchant       : ptype := vhtsMerchant;
      //vhtMainWarefare
      vhtPatrolCraft    : ptype := vhtsMerchant;
      vhtUtilityVess    : ptype := vhtsUtilityVess;
      vhtOther          : ptype := vhtsOther;
    else
      ptype := vhtsOther;
    end;
    edtTypeTrack.Text := pType;

    case identity of
      piPending       : edtIdentity.Text := pfPending;
      piUnknown       : edtIdentity.Text := pfUnknown;
      piAssumedFriend : edtIdentity.Text := pfAssumedFriend;
      piFriend        : edtIdentity.Text := pfFriend;
      piNeutral       : edtIdentity.Text := pfNeutral;
      piSuspect       : edtIdentity.Text := pfSuspect;
      piHostile       : edtIdentity.Text := pfHostile;
    else
      edtIdentityTrack.Text := pfPending;
    end;

    case domain of
      vhdAir          : edtDomain.Text := vhdsAir;
      vhdSurface      : edtDomain.Text := vhdsSurface;
      vhdSubsurface   : edtDomain.Text := vhdsSubsurface;
      vhdLand         : edtDomain.Text := vhdsLand;
      vhdGeneral      : edtDomain.Text := vhdsGeneral;
      vhdWreck        : edtDomain.Text := vhdsWreck;
    else
      edtDomainTrack.Text := vhdsAir;
    end;

    case TT3PlatformInstance(Data).Force_Designation of
      0 : SetForceText('Red');
      1 : SetForceText('Blue');
      2 : SetForceText('Green');
      3 : SetForceText('Amber');
      4 : SetForceText('No Force');
    else
      SetForceText('None');
    end;

    grpRealTime.BringToFront;
    {$ENDREGION}
  end
  else if obj is TT3DetectedTrack then
  begin
    objDetectedTrack := obj as TT3DetectedTrack;

    edtClass.Text := TT3DetectedTrack(Data).TrackClass;
    edtPlatformType.Text := '---';
    edtPropulsionType.Text := '---';
    edtLastUpdated.Text := '---';
    edtTrackIden.Text := '---';

    grpRealTime.BringToFront;
  end
  else if obj is TT3ESMTrack then
  begin
    {$REGION ' ESM Track '}
    objESM := obj as TT3ESMTrack;

    identity := objESM.TrackIdent;
    domain := objESM.TrackDomain;

    edtnameTrack.Text := objESM.TrackNumber;
    edtTypeEditNonRealTimeTrack.Text := 'ESM Track';
    edtNameRT.Text := '---';
    edtClassTrack.Text := '---';
    edtTypeTrack.Text := '---';

    case identity of
      piPending       : edtESMIdentity.Text := pfPending;
      piUnknown       : edtESMIdentity.Text := pfUnknown;
      piAssumedFriend : edtESMIdentity.Text := pfAssumedFriend;
      piFriend        : edtESMIdentity.Text := pfFriend;
      piNeutral       : edtESMIdentity.Text := pfNeutral;
      piSuspect       : edtESMIdentity.Text := pfSuspect;
      piHostile       : edtESMIdentity.Text := pfHostile;
    else
      edtESMIdentity.Text := pfPending;
    end;

    case domain of
      vhdAir          : edtESMDomain.Text := vhdsAir;
      vhdSurface      : edtESMDomain.Text := vhdsSurface;
      vhdSubsurface   : edtESMDomain.Text := vhdsSubsurface;
      vhdLand         : edtESMDomain.Text := vhdsLand;
      vhdGeneral      : edtESMDomain.Text := vhdsGeneral;
      vhdWreck        : edtESMDomain.Text := vhdsWreck;
    else
      edtESMDomain.Text := vhdsAir;
    end;

    case force of
      0 : SetForceText('Red');
      1 : SetForceText('Blue');
      2 : SetForceText('Green');
      3 : SetForceText('Amber');
      4 : SetForceText('No Force');
    else
      SetForceText('None');
    end;

    grpESM.BringToFront;
    {$ENDREGION}
  end;
end;

function TfrmEditNonRealTimeTrack.GetDomainStr(const vDomain: Integer): string;
var
  domainTemp : string;
begin
  case vDomain of
    vhdAir: domainTemp := vhdsAir;
    vhdSurface: domainTemp := vhdsSurface;
    vhdSubsurface: domainTemp := vhdsSubsurface;
    vhdLand: domainTemp := vhdsLand;
    vhdAmphibious: domainTemp := vhdsAmphibious;
    vhdGeneral:domainTemp := vhdsGeneral;
  end;
  Result := domainTemp;
end;

function TfrmEditNonRealTimeTrack.GetIdentityStr(const vIdentity: Integer): string;
var
  identityTemp : string;
begin
  case vIdentity of
    piPending:
      identityTemp := 'Pending';
    piUnknown:
      identityTemp := 'Unknown';
    piAssumedFriend:
      identityTemp := 'Assumedfriend';
    piFriend:
      identityTemp := 'Friend';
    piNeutral:
      identityTemp := 'Neutral';
    piSuspect:
      identityTemp := 'Suspect';
    piHostile:
      identityTemp := 'Hostile';
  end;
  Result := identityTemp;
end;

function TfrmEditNonRealTimeTrack.GetForceStr(const vForce: Integer): string;
begin
  case vForce of
    0 : Result := 'Red';
    1 : Result := 'Blue';
    2 : Result := 'Green';
    3 : Result := 'Amber';
    4 : Result := 'No Force';
  else
    Result := 'None';
  end;
end;

procedure TfrmEditNonRealTimeTrack.SetDomainText(value : String);
begin
  edtDomain.Text := value;
  edtNRBDomain.Text := value;
  edtAOPDomain.Text := value;
  edtNRSDomain.Text := value;
  edtDomainTrack.Text := value;
  edtESMDomain.Text := value;
end;

procedure TfrmEditNonRealTimeTrack.SetIdentityText(value : String);
begin
  edtIdentity.Text := value;
  edtNRBIdentity.Text := value;
  edtAOPIdentity.Text := value;
  edtIdentityTrack.Text := value;
  edtESMIdentity.Text := value;
end;

procedure TfrmEditNonRealTimeTrack.SetForceText(value : String);
begin
  edtforce.Text := value;
  edtNRBForce.Text := value;
  edtAOPForce.Text := value;
  edtNRSForce.Text := value;

  edtESMForce.Text := value;
end;

procedure TfrmEditNonRealTimeTrack.DomainChangeClick(Sender: TObject);
var
  domainTemp : Integer;
begin
  domainTemp := TMenuItem(Sender).Tag;

  if (Data is TT3NonRealVehicle) then
  begin
    {$REGION ' Non Real Time '}
    rec.PlatfomID := TT3NonRealVehicle(Data).InstanceIndex;
    rec.OrderID := NRP_ID_TRACKDOMAIN;
    rec.domain := domainTemp;

    case domainTemp of
      vhdAir : rec.symbol := '`';
      vhdSurface : rec.symbol := '4';
      vhdSubsurface : rec.symbol := '8';
      vhdLand : rec.symbol := '=';
      vhdAmphibious : rec.symbol := '4';
      vhdGeneral : rec.symbol := 'q';
    end;

    simMgrClient.netSend_CmdNRP_CHANGE_PROPERTY(rec);
    {$ENDREGION}
  end
  else if (Data is TT3Vehicle) then
  begin
    recVehicle.identity := -1;
    recVehicle.domain := domainTemp;
    recVehicle.platformType := -1;

    simMgrClient.netSend_CmdPlatform_CHANGE_PROPERTY(recVehicle);
  end
  else if (Data is TT3DetectedTrack) then
  begin
    recVehicle.identity := -1;
    recVehicle.domain := domainTemp;
    recVehicle.platformType := -1;

    simMgrClient.netSend_CmdPlatform_CHANGE_PROPERTY(recVehicle);
  end
  else if (Data is TT3ESMTrack) then
  begin
    simMgrClient.netSend_CmdESM_CHANGE_PROPERTY(recESM);
  end;
end;

procedure TfrmEditNonRealTimeTrack.IdentityChangeClick(Sender: TObject);
var
  identityTemp : Integer;
begin
  identityTemp := TMenuItem(Sender).Tag;

  if (Data is TT3NonRealVehicle) then
  begin
    {$REGION ' Non Real Time '}
    rec.PlatfomID := TT3NonRealVehicle(Data).InstanceIndex;
    rec.OrderID := NRP_ID_TRACKIDENT;
    rec.identity := identityTemp;
    simMgrClient.netSend_CmdNRP_CHANGE_PROPERTY(rec);
    {$ENDREGION}
  end
  else if (Data is TT3Vehicle) then
  begin
    recVehicle.PlatfomID := TT3Vehicle(Data).InstanceIndex;

//    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
//      recVehicle.GrpID := 0
//    else
//      recVehicle.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;

    recVehicle.identity := identityTemp;
//    recVehicle.domain := -1;
//    recVehicle.platformType := -1;

    simMgrClient.netSend_CmdPlatform_CHANGE_PROPERTY(recVehicle);
  end
  else if (Data is TT3DetectedTrack) then
  begin
    recVehicle.PlatfomID := TT3DetectedTrack(Data).TrackObject.InstanceIndex;

//    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
//      recVehicle.GrpID := 0
//    else
//      recVehicle.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;

    recVehicle.identity := identityTemp;
//    recVehicle.domain := -1;
//    recVehicle.platformType := -1;


    simMgrClient.netSend_CmdPlatform_CHANGE_PROPERTY(recVehicle);
  end
  else if (Data is TT3ESMTrack) then
  begin
    recESM.PlatfomID := TT3DetectedTrack(Data.Parent).TrackObject.InstanceIndex;
    recESM.Tracknumber := TT3ESMTrack(Data).TrackNumber;
    recESM.GrpID := simMgrClient.FMyCubGroup.FData.Group_Index;
//    recESM.domain := domain;
    recESM.identity := identityTemp;

    simMgrClient.netSend_CmdESM_CHANGE_PROPERTY(recESM);
  end;
end;

procedure TfrmEditNonRealTimeTrack.ForceChangeClick(Sender: TObject);
var
  forceTemp : Integer;
begin
  forceTemp := TMenuItem(Sender).Tag;

  if (Data is TT3NonRealVehicle) then
  begin
    {$REGION ' Non Real Time '}
    rec.PlatfomID := TT3NonRealVehicle(Data).InstanceIndex;
    rec.OrderID := NRP_ID_FORCE;
    rec.Force := forceTemp;
    simMgrClient.netSend_CmdNRP_CHANGE_PROPERTY(rec);
    {$ENDREGION}
  end
end;

procedure TfrmEditNonRealTimeTrack.edtPositionCenterKeyPress(Sender: TObject; var Key: Char);
var
  NRPGroupID : Integer;

  ValKey : set of AnsiChar;
  Indeks : Integer;
  PosX, PosY, Text : string;
  PosX1, PosY1 : Double;
begin
  if Key = #13 then
  begin
    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      NRPGroupID := 0
    else
      NRPGroupID := simMgrClient.FMyCubGroup.FData.Group_Index;

    case TEdit(Sender).Tag of
      nrpPoint :
      begin
        {$REGION ' Point '}
        if dmsToLatt(edtposLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtposLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        simMgrClient.netSend_CmdPlatform_Move(TT3Unit(Data).InstanceIndex, CORD_ID_REPOS, dmsToLong(edtposLong.Text), dmsToLatt(edtposLat.Text), NRPGroupID);
        {$ENDREGION}
      end;
      nrpBearing :
      begin
        {$REGION ' Bearing '}
        if dmsToLatt(edtNRBPosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtNRBPosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        simMgrClient.netSend_CmdPlatform_Move(TT3Unit(Data).InstanceIndex, CORD_ID_REPOS, dmsToLong(edtNRBPosLong.Text), dmsToLatt(edtNRBPosLat.Text), NRPGroupID);
        {$ENDREGION}
      end;
      nrpArea :
      begin
        {$REGION ' AOP '}
        if dmsToLatt(edtAOPPosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtAOPPosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        simMgrClient.netSend_CmdPlatform_Move(TT3Unit(Data).InstanceIndex, CORD_ID_REPOS, dmsToLong(edtAOPPosLong.Text), dmsToLatt(edtAOPPosLat.Text), NRPGroupID);
        {$ENDREGION}
      end;
      nrpSpecial :
      begin
        {$REGION ' AOP '}
        if dmsToLatt(edtNRSPosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtNRSPosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        simMgrClient.netSend_CmdPlatform_Move(TT3Unit(Data).InstanceIndex, CORD_ID_REPOS, dmsToLong(edtNRSPosLong.Text), dmsToLatt(edtNRSPosLat.Text), NRPGroupID);
        {$ENDREGION}
      end;
    end;
  end;
end;

procedure TfrmEditNonRealTimeTrack.edtCourseKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  heading: double;
  v: TT3NonRealVehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(TEdit(Sender).Text, heading);
    if Assigned(Data) and (Data is TT3NonRealVehicle) then
    begin
      v := data as TT3NonRealVehicle;

      v.OrderedHeading := heading;
      SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,CORD_ID_MOVE, CORD_TYPE_COURSE, heading);
    end;
  end;
end;

procedure TfrmEditNonRealTimeTrack.edtGroundSpeedKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  Speed: double;
  v : TT3NonRealVehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(TEdit(Sender).Text, Speed);
    if Assigned(Data) and (Data is TT3NonRealVehicle) then begin
        v := Data as TT3NonRealVehicle;

        if v.TrackDomain = vhdLand then
        Exit;

        v.OrderedSpeed := Speed;

        SimMgrClient.netSend_CmdPlatform(v.InstanceIndex, CORD_ID_MOVE, CORD_TYPE_SPEED, Speed);
    end;
  end;
end;

procedure TfrmEditNonRealTimeTrack.edtAltitudeKeyPress(Sender: TObject;var Key: Char);
var
  ValKey : set of AnsiChar;
  Altitude: double;
  v : TT3NonRealVehicle;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(TEdit(Sender).Text, Altitude);
    if Assigned(Data) and (Data is TT3NonRealVehicle) then
    begin
        v := Data as TT3NonRealVehicle;
        if v.TrackDomain = vhdAir then
        begin
          Altitude := ((Altitude * Altitude) / (Altitude * C_Meter_To_Feet));
          v.OrderedAltitude := Altitude;
        end;

        SimMgrClient.netSend_CmdPlatform(v.InstanceIndex,CORD_ID_MOVE, CORD_TYPE_ALTITUDE, Altitude);
    end;
  end;
end;

end.
