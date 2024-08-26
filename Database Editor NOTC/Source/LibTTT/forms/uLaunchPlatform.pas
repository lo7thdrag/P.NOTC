unit uLaunchPlatform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, uDBAssetObject, uDataModuleTTT,
  uDBAsset_Vehicle, uGameData_TTT;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPlatformInst: TPlatform_Instance;
    FEmbarkedDefinition  : TVehicle_Definition;
    FEmbarkedAvailable : integer;
    FEmbarkedPlatform: TPlatform_Instance;
    procedure SetPlatformInst(const Value: TPlatform_Instance);
    procedure SetEmbarkedPlatform(const Value: TPlatform_Instance);
    { Private declarations }
  public
    RecToSend: TRecCmd_Embark;

    { Public declarations }
    property PlatformInst : TPlatform_Instance read FPlatformInst write SetPlatformInst;
    property EmbarkedPlatform : TPlatform_Instance read FEmbarkedPlatform;


  end;

var
  frmLaunchPlaform: TfrmLaunchPlaform;

implementation

uses ufTacticalDisplay, uSimMgr_Client ;

{$R *.dfm}

{ TfrmLaunchPlaform }

procedure TfrmLaunchPlaform.btnCancelClick(Sender: TObject);
begin
  FEmbarkedDefinition.Free;
  FEmbarkedPlatform.Free;
  Close;
end;

procedure TfrmLaunchPlaform.btnLaunchClick(Sender: TObject);
var aObject: TObject;
    vIndex : integer;
    newPID : Integer;
begin
  if lvEmbarked.ItemIndex >= 0 then begin
    aObject := FPlatformInst.Vehicle.Hosted_Platform[lvEmbarked.ItemIndex];
    THosted_Platform(aObject).FData.Quantity := THosted_Platform(aObject).FData.Quantity - 1;

    if THosted_Platform(aObject).FData.Quantity = 0 then begin
      aObject.Free;
      FPlatformInst.Vehicle.Hosted_Platform.Delete(lvEmbarked.ItemIndex);
    end;
  end;

  newPID :=  simMgrClient.GetSerialPlatformID;

  FEmbarkedPlatform.FData.Platform_Instance_Index := newPID;
  RecToSend.EmbarkPlaformID     := newPID;


  frmTacticalDisplay.ControlEmbarkedPlatform := false;
  simMgrClient.Platforms.AddChild(FEmbarkedPlatform);
  simMgrClient.Scenario.Platform_Insts.Add(FEmbarkedPlatform);
  simMgrClient.GroupMembers.Add(FEmbarkedPlatform);
  simMgrClient.FObjectCanBeDetectedBySensor.AddObject(FEmbarkedPlatform);
//  simMgrClient.GroupMembers.Add(FEmbarkedPlatform);

  with FEmbarkedPlatform do begin
    FActivation.Init_Position_Longitude := FPlatformInst.PositionX;
    FActivation.Init_Position_Latitude  := FPlatformInst.PositionY;
    FActivation.Init_Course             := 0;
    FActivation.Init_Altitude           := 0;
    FActivation.Init_Ground_Speed       := 0;
    Activated := true;

    //vIndex := FData.Vehicle_Index;
    vIndex := THosted_Platform(aObject).FData.Hosted_Vehicle_Index;

    dmTTT.GetVehicle_Definition(vIndex, Vehicle);
    dmTTT.GetMotion_Characteristics(Vehicle.FData.Motion_Characteristics, Motion);

    //sensor
    dmTTT.getAllEO_On_Board(vIndex,0,             Vehicle.EOSensors);
    dmTTT.getAllESM_On_Board(vIndex,0,            Vehicle.ESMSensors);
    dmTTT.getAllIFF_Sensor_On_Board(vIndex,0,     Vehicle.IFFSensors);
    dmTTT.getAllMAD_Sensor_On_Board(vIndex,0,     Vehicle.MADSensors);
    dmTTT.getAllVisual_Sensor_On_Board(vIndex,0,  Vehicle.Visualsensors);
    dmTTT.getAllFCR_On_Board(vIndex,              Vehicle.FCRSensors);

    dmTTT.GetAllRadar_On_Board(vIndex,0, Vehicle.Radars);
    dmTTT.GetAllSonar_On_Board(vIndex,0, Vehicle.Sonars);

    //weapon fit on Board
    dmTTT.getAllMissile_OnBoard(vIndex,0,   Vehicle.Missiles  );
    dmTTT.getAllTorpedo_OnBoard(vIndex,0,   Vehicle.Torpedos  );
    dmTTT.GetHybrid_Definition(vIndex,      Vehicle.Hybrids   );
    dmTTT.getAllMines_OnBoard(vIndex,0 ,    Vehicle.Mines );
    dmTTT.GetAllBomb(vIndex,                Vehicle.Bombs);
    dmTTT.GetAllGun(vIndex,                 Vehicle.Guns);

    dmTTT.getAllAcoustic_Decoy_On_Board(vIndex,     Vehicle.Acoustic_Decoys);
    dmTTT.getAllAir_Bubble_Mount(vIndex,            Vehicle.Air_Bubble_Mount);
    dmTTT.getAllChaff_On_Board(vIndex,              Vehicle.Chaffs);
    dmTTT.getAllChaff_Launcher_On_Board(vIndex,     Vehicle.Chaff_Launchers);
    dmTTT.getAllDefensive_Jammer_On_Board(vIndex,   Vehicle.Defensive_Jammers);
    dmTTT.getAllFloating_Decoy_On_Board(vIndex,     Vehicle.Floating_Decoys);
    dmTTT.getAllInfrared_Decoy_On_Board(vIndex,     Vehicle.Infrared_Decoys);
    dmTTT.getAllJammer_On_Board(vIndex,             Vehicle.Jammers);
    dmTTT.getAllPoint_Effect_On_Board(vIndex,       Vehicle.Point_Effects);
    dmTTT.getAllTowed_Jammer_Decoy_On_Board(vIndex, Vehicle.Towed_Jammer_Decoys);
    dmTTT.getHosted_Platform(vIndex,0,              Vehicle.Hosted_Platform);
    dmTTT.getAllSonobuoy_On_Board(vIndex,0,         Vehicle.Sonobuoy );

    InitData;
  end;

  frmTacticalDisplay.Refresh_AssumeControl;

  simMgrClient.netSend_CmdLaunch_Embark(RecToSend);

  Close;
end;

procedure TfrmLaunchPlaform.btnNextClick(Sender: TObject);
var hostPlatform : THosted_Platform;
begin
  if lvEmbarked.ItemIndex < 0 then exit;

  case Notebook1.PageIndex of
    0 :
      begin
        Notebook1.PageIndex := 1;

        FEmbarkedDefinition := TVehicle_Definition(lvEmbarked.Items[lvEmbarked.ItemIndex].Data);
        hostPlatform := FPlatformInst.Vehicle.Hosted_Platform[lvEmbarked.ItemIndex];
        if FEmbarkedDefinition <> nil then
          with FEmbarkedDefinition do begin
            lbClass.Caption     := FData.Vehicle_Identifier;
            lbAvailable.Caption := IntToStr(hostPlatform.FData.Quantity);
            edtName.Text        := FData.Vehicle_Identifier;
//            RecToSend.TrackIdent
          end;
        btnLaunch.Enabled := false;
        btnNext.Enabled := true;

        RecToSend.Hosted_Index := lvEmbarked.ItemIndex;

      end;
    1 :
      begin
        Notebook1.PageIndex := 2;

        if FEmbarkedDefinition <> nil then
          with FEmbarkedDefinition do begin

            lbClassLaunch.Caption := FData.Vehicle_Identifier;
            lbNameLaunch.Caption :=  edtName.Text;
            RecToSend.LaunchName  := edtName.Text;

          end;

        btnLaunch.Enabled := true;
        btnNext.Enabled := false;

        FEmbarkedPlatform := TPlatform_Instance.Create;
        FEmbarkedPlatform.Activated := false;

        with FEmbarkedPlatform do begin
          Vehicle := FEmbarkedDefinition;
          FData.Track_ID        := edtTrackId.Text;
          FData.Instance_Name   := edtName.Text;

          RecToSend.TrackIdent := edtTrackId.Text;
          RecToSend.LaunchName := edtName.Text;
        end;

        frmTacticalDisplay.ControlEmbarkedPlatform := true;
        frmTacticalDisplay.TacticalDisplayControlPanel.ActivePageIndex := 1;
//        frmTacticalDisplay.grbStraightLine.BringToFront;
        frmTacticalDisplay.SetControlledPlatform(FEmbarkedPlatform);

      end;

  end;
end;

procedure TfrmLaunchPlaform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmTacticalDisplay.ControlEmbarkedPlatform := false;
  FEmbarkedPlatform := nil;

  frmLaunchPlaform := nil;
  Action := caFree;
end;

procedure TfrmLaunchPlaform.FormCreate(Sender: TObject);
begin
   with RecToSend do begin
     ParentPlatformID := 0;
     EmbarkPlaformID  := 0;
   end;
   Notebook1.PageIndex := 0;

end;

procedure TfrmLaunchPlaform.SetEmbarkedPlatform(
  const Value: TPlatform_Instance);
begin
  FEmbarkedPlatform := Value;
end;

procedure TfrmLaunchPlaform.SetPlatformInst(const Value: TPlatform_Instance);
var
  i : integer;
  rec: TVehicle_Definition;
  li : TListItem;
begin
  FPlatformInst := Value;

  lvEmbarked.Clear;
  with FPlatformInst.Vehicle do begin
    for i := 0 to Hosted_Platform.Count - 1 do begin

      rec := TVehicle_Definition.Create;
      dmTTT.GetVehicle_Definition(
        THosted_Platform(Hosted_Platform[i]).FData.Hosted_Vehicle_Index,
        rec);

      li := lvEmbarked.Items.Add;
      li.Caption := rec.FData.Vehicle_Identifier;
      li.SubItems.Add(IntToStr(THosted_Platform(Hosted_Platform[i]).FData.Quantity));
      li.Data := rec;

    end;
  end;

  if lvEmbarked.Items.Count > 0 then
    lvEmbarked.ItemIndex := 0;

  RecToSend.ParentPlatformID := FPlatformInst.FData.Platform_Instance_Index;

end;

end.
