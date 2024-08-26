unit uLaunchPlatform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, uT3Unit, {uDataModuleTTT,}
  uDBAsset_Vehicle, uGameData_TTT, uT3Vehicle, uBaseCoordSystem;

type
  TfrmLaunchPlaform = class(TForm)
    Notebook1: TNotebook;
    lvEmbarked: TListView;
    btnNext: TButton;
    btnLaunch: TButton;
    btnCancel: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbClass: TLabel;
    lbAvailable: TLabel;
    edtName: TEdit;
    edtTrackId: TEdit;
    edtFormation: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    lbClassLaunch: TLabel;
    lbNameLaunch: TLabel;
    Label8: TLabel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtTrackIdChange(Sender: TObject);
  private
    FNormalClose          : boolean;
    FPlatformInst         : TT3PlatformInstance;
    FEmbarkedDefinition   : TVehicle_Definition;
    FEmbarkedHeading      : double;
    FEmbarkedSpeed        : double;
    FEmbarkedAltitude: double;

    procedure SetPlatformInst(const Value: TT3PlatformInstance);
    procedure SetEmbarkedHeading(const Value: double);
    procedure SetEmbarkedSpeed(const Value: double);
    procedure SetEmbarkedAltitude(const Value: double);
    { Private declarations }
  public
    RecToSend: TRecCmd_Embark;

    { Public declarations }
    property PlatformInst : TT3PlatformInstance read FPlatformInst write SetPlatformInst;
    property EmbarkedHeading : double read FEmbarkedHeading write SetEmbarkedHeading;
    property EmbarkedSpeed   : double read FEmbarkedSpeed write SetEmbarkedSpeed;
    property EmbarkedAltitude : double read FEmbarkedAltitude write SetEmbarkedAltitude;
  end;

var
  frmLaunchPlaform: TfrmLaunchPlaform;

implementation

uses ufTacticalDisplay, uSimMgr_Client, tttData,

  uDBAssetObject;

{$R *.dfm}

{ TfrmLaunchPlaform }

procedure TfrmLaunchPlaform.btnCancelClick(Sender: TObject);
begin
  frmTacticalDisplay.ControlEmbarkedPlatform := false;
  Close;
end;

procedure TfrmLaunchPlaform.btnLaunchClick(Sender: TObject);
begin
  {
  // safely initialize
  recLaunch.QueueNum  := 0;
  recLaunch.SessionID := simMgrClient.SessionID;
  recLaunch.ParentPlatformID := PlatformInst.InstanceIndex;
  recLaunch.EmbarkPlatformID := 0;
  recLaunch.Hosted_Index     := 0;
  recLaunch.Quantity         := 0;
  recLaunch.LaunchName       := '';
  recLaunch.TrackIdent       := '';
  recLaunch.InitSpeed        := 0;
  recLaunch.InitCourse       := 0;
  recLaunch.InitAltitude     := 0;
  recLaunch.InitX            := PlatformInst.getPositionX;
  recLaunch.InitY            := PlatformInst.getPositionY;
  recLaunch.InitZ            := PlatformInst.getPositionZ;

  recLaunch.OrderID := CORD_ID_LAUNCH;
  simMgrClient.netSend_CmdLaunch_Embark(recLaunch);
  }

  simMgrClient.netSend_CmdLaunch_Embark(RecToSend);
  btnLaunch.Enabled := false;
//  Timer1.Enabled := True;
  Close;
end;

procedure TfrmLaunchPlaform.btnNextClick(Sender: TObject);
var
  hostPlatform : TT3EmbarkedVehicle;
begin
  if lvEmbarked.ItemIndex < 0 then
    exit;

  hostPlatform := TT3EmbarkedVehicle(TT3Vehicle(FPlatformInst).EmbarkedVehicles[lvEmbarked.ItemIndex]);

  case Notebook1.PageIndex of
    0 :
      begin
        Notebook1.PageIndex := 1;

        FEmbarkedDefinition := TVehicle_Definition(lvEmbarked.Items[lvEmbarked.ItemIndex].Data);
        if FEmbarkedDefinition <> nil then
        begin
          with FEmbarkedDefinition do begin
            lbClass.Caption     := FData.Vehicle_Identifier;
            lbAvailable.Caption := IntToStr(hostPlatform.Quantity);
            edtName.Text        := FData.Vehicle_Identifier;
          end;
        end;

        btnLaunch.Enabled := False;
//        btnNext.Enabled := False;

        RecToSend.Hosted_Index := lvEmbarked.ItemIndex;
      end;
    1 :
      begin
        if hostPlatform.Quantity <= 0  then
        begin
          ShowMessage('Quantity Embark is Empty');
          Self.Hide;
          Exit;
        end;

        Notebook1.PageIndex := 2;

        if FEmbarkedDefinition <> nil then
        begin
          with FEmbarkedDefinition do
          begin
            lbClassLaunch.Caption := FData.Vehicle_Identifier;
            lbNameLaunch.Caption :=  edtName.Text;
          end;
        end;

        btnLaunch.Enabled := true;
        btnNext.Enabled := false;

        case TT3Vehicle(FPlatformInst).VehicleDefinition.FData.GangwayPosition of
          0 : //front Door
            begin
              RecToSend.InitCourse := TT3Vehicle(FPlatformInst).Course;
              RecToSend.InitSpeed  := FPlatformInst.Speed;
            end;
          1 : //Back Door
            begin
              RecToSend.InitCourse := ValidateDegree(TT3Vehicle(FPlatformInst).Course + 180);
              RecToSend.InitSpeed  := FPlatformInst.Speed;
            end;
        end;

        StrToChar(edtName.Text, RecToSend.LaunchName);
        StrToChar(edtTrackId.Text, RecToSend.TrackIdent);
        RecToSend.InitAltitude := FPlatformInst.Altitude;
        RecToSend.InitX      := FPlatformInst.getPositionX;
        RecToSend.InitY      := FPlatformInst.getPositionY;
        RecToSend.OrderID    := CORD_ID_INITIATE;
      end;
  end;
end;

procedure TfrmLaunchPlaform.edtTrackIdChange(Sender: TObject);
begin
  if edtTrackId.Text <> '' then
    btnNext.Enabled := true
  else
    btnNext.Enabled := False;
end;

procedure TfrmLaunchPlaform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  if not FNormalClose then begin
//    if Assigned(FEmbarkedDefinition) then
//      FEmbarkedDefinition.Free;
//  end;

  frmTacticalDisplay.ControlEmbarkedPlatform := false;
  frmLaunchPlaform := nil;

  Action := caFree;
end;

procedure TfrmLaunchPlaform.FormCreate(Sender: TObject);
begin
  FNormalClose := false;

  with RecToSend do begin
    ParentPlatformID := 0;
    EmbarkPlatformID  := 0;
  end;

  Notebook1.PageIndex := 0;
  FEmbarkedHeading := 0;
  FEmbarkedSpeed := 0;
  FEmbarkedAltitude := 0;
end;

procedure TfrmLaunchPlaform.FormShow(Sender: TObject);
begin
  Notebook1.PageIndex := 0;
  btnNext.Enabled := True;
  edtTrackId.Text := '';
end;

procedure TfrmLaunchPlaform.SetEmbarkedAltitude(const Value: double);
begin
  FEmbarkedAltitude := Value;
end;

procedure TfrmLaunchPlaform.SetEmbarkedHeading(const Value: double);
begin
  FEmbarkedHeading := Value;
end;

procedure TfrmLaunchPlaform.SetEmbarkedSpeed(const Value: double);
begin
  FEmbarkedSpeed := Value;
end;

procedure TfrmLaunchPlaform.SetPlatformInst(const Value: TT3PlatformInstance);
var
  i : integer;
//  rec: TVehicle_Definition;
  li : TListItem;
begin
  FPlatformInst := Value;

  lvEmbarked.Clear;
  with TT3Vehicle(FPlatformInst) do begin
    for i := 0 to EmbarkedVehicles.Count - 1 do begin

//      rec := nil;
//      dmTTT.GetVehicle_Definition(
//        TT3EmbarkedVehicle(EmbarkedVehicles[i]).EmbarkedVehicle.Hosted_Vehicle_Index,
//        rec);

      li := lvEmbarked.Items.Add;
//      li.Caption := rec.FData.Vehicle_Identifier;
      li.Caption := TT3EmbarkedVehicle(EmbarkedVehicles[i]).EmbarkedIdentifier;
      li.SubItems.Add(IntToStr(TT3EmbarkedVehicle(EmbarkedVehicles[i]).Quantity));
      li.Data := TT3EmbarkedVehicle(EmbarkedVehicles[i]).EmbarkDefinition;

    end;
  end;

  if lvEmbarked.Items.Count > 0 then
    lvEmbarked.ItemIndex := 0;

  RecToSend.ParentPlatformID := FPlatformInst.InstanceIndex;

end;

{ cek launch alert status }
procedure TfrmLaunchPlaform.Timer1Timer(Sender: TObject);
//var
  //i, K, count, queue : integer;
//  i, count : integer;
//  hostPlatform : TT3EmbarkedVehicle;
//  found, next : boolean;
//  recLaunch : TRecCmd_Embark;
//  queueEmb : TQueuedEmbarkedLaunch;
begin
//  if not Assigned(PlatformInst) then exit;
//
//  count := TT3Vehicle(FPlatformInst).EmbarkedVehicles.Count;
//  found := false;
//  for I := 0 to Count - 1 do begin
//    hostPlatform := TT3EmbarkedVehicle(TT3Vehicle(FPlatformInst).EmbarkedVehicles[i]);
//    if hostPlatform.getQueueCount > 0 then
//    begin
//      queueEmb := hostPlatform.getQueueItem(0);
//      if queueEmb.ReadyToLaunch = True then
//      begin
//        found := true;
//        break;
//      end;
//    end
//  end;
//
//  //btnLaunch.Enabled := found;
//  if found then
//  begin
//    recLaunch.QueueNum  := 0;
//    recLaunch.SessionID := simMgrClient.SessionID;
//    recLaunch.ParentPlatformID := PlatformInst.InstanceIndex;
//    recLaunch.EmbarkPlatformID := 0;
//    recLaunch.Hosted_Index     := 0;
//    recLaunch.Quantity         := 0;
//    recLaunch.LaunchName       := '';
//    recLaunch.TrackIdent       := '';
//    recLaunch.InitSpeed        := 0;
//    recLaunch.InitCourse       := 0;
//    recLaunch.InitAltitude     := 0;
//    recLaunch.InitX            := PlatformInst.getPositionX;
//    recLaunch.InitY            := PlatformInst.getPositionY;
//    recLaunch.InitZ            := PlatformInst.getPositionZ;
//
//    recLaunch.OrderID := CORD_ID_LAUNCH;
//    simMgrClient.netSend_CmdLaunch_Embark(recLaunch);
//
//    count := TT3Vehicle(FPlatformInst).EmbarkedVehicles.Count;
//    next  := false;
//    for I := 0 to Count - 1 do begin
//      hostPlatform := TT3EmbarkedVehicle(TT3Vehicle(FPlatformInst).EmbarkedVehicles[i]);
//      if hostPlatform.getQueueCount > 0 then
//      begin
//        next := True;
//        break;
//      end;
//    end;
//
//    if not(next) then
//    begin
//      Timer1.Enabled := false;
//
//      FNormalClose := true;
//      Close;
//      Self.Free;
//    end;
//  end;
end;

end.
