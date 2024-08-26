unit uRPLibrary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uSimMgr_Client, Buttons, tttData;

type
  TfrmRPLibrary = class(TForm)
    Bevel1: TBevel;
    Notebook1: TNotebook;
    lvObject: TListView;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbClass: TLabel;
    edtName: TEdit;
    edtTrackId: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    lbClassLaunch: TLabel;
    lbNameLaunch: TLabel;
    Label8: TLabel;
    btnNext: TButton;
    btnLaunch: TButton;
    btnCancel: TButton;
    lbPosition: TLabel;
    edtPosition: TEdit;
    btnPosition: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNextClick(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    procedure btnPositionClick(Sender: TObject);
  private
    FDeployedObject: TObject;
    FMapPositionX: double;
    FMapPositionY: double;
    procedure SetDeployedObject(const Value: TObject);
    procedure SetMapPositionX(const Value: double);
    procedure SetMapPositionY(const Value: double);
    { Private declarations }
  public
    { Public declarations }
    property MapPositionX : double read FMapPositionX write SetMapPositionX;
    property MapPositionY : double read FMapPositionY write SetMapPositionY;
  end;

var
  frmRPLibrary: TfrmRPLibrary;

implementation

uses uDBAssetObject, uDBAsset_Sonobuoy, uDBAsset_Vehicle,
  uBaseCoordSystem, ufTacticalDisplay, uDataModuleTTT, uMapXhandler;

{$R *.dfm}

procedure TfrmRPLibrary.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRPLibrary.btnLaunchClick(Sender: TObject);
var
  tempObject : TObject;
  vIndex : integer;
begin
  if trim(edtPosition.Text) = '' then exit;
  if FDeployedObject = nil then exit;

  tempObject := FDeployedObject;

  if tempObject.ClassType = TVehicle_Definition then begin

    vIndex := TVehicle_Definition(tempObject).FData.Vehicle_Index;
    FDeployedObject := TPlatform_Instance.Create;

    with TPlatform_Instance(FDeployedObject) do begin
      Activated     := true;
      Controlled    := false;
      Vehicle       := TVehicle_Definition(tempObject);
      FData.Track_ID := edtTrackId.Text;
      FData.Platform_Instance_Index :=  simMgrClient.GetSerialPlatformID;

      FActivation.Init_Position_Longitude := MapPositionX;
      FActivation.Init_Position_Latitude  := MapPositionY;
      FActivation.Init_Course             := 0;
      FActivation.Init_Altitude           := 0;
      FActivation.Init_Ground_Speed       := 0;

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

    //simMgrClient.Scenario.Platform_Insts.Add(FDeployedObject);
    simMgrClient.FObjectCanBeDetectedBySensor.AddObject(FDeployedObject);
    simMgrClient.Platforms.AddChild(TPlatform_Instance(FDeployedObject));
  end;

  frmTacticalDisplay.Refresh_AssumeControl;
  Close;

end;

procedure TfrmRPLibrary.btnNextClick(Sender: TObject);
var
  aObject : TObject;
begin
  if lvObject.ItemIndex < 0 then exit;

  FDeployedObject := lvObject.Items[lvObject.ItemIndex].Data;
  if FDeployedObject = nil then exit;

  case Notebook1.PageIndex of
    0 :
    begin
      Notebook1.PageIndex := 1;

      if FDeployedObject.ClassType = TVehicle_Definition then begin
        lbClass.Caption := TVehicle_Definition(FDeployedObject).FData.Vehicle_Identifier;
        edtName.Text := TVehicle_Definition(FDeployedObject).FData.Vehicle_Identifier;
      end else
      if FDeployedObject.ClassType = TMissile_Definition then begin
        lbClass.Caption := TMissile_Definition(FDeployedObject).FData.Class_Identifier;
        edtName.Text := TMissile_Definition(FDeployedObject).FData.Class_Identifier;
      end else
      if FDeployedObject.ClassType = TTorpedo_Definition then begin
        lbClass.Caption := TTorpedo_Definition(FDeployedObject).FData.Class_Identifier;
        edtName.Text := TTorpedo_Definition(FDeployedObject).FData.Class_Identifier;
      end else
      if FDeployedObject.ClassType = TMine_Definition then begin
        lbClass.Caption := TMine_Definition(FDeployedObject).FData.Mine_Identifier;
        edtName.Text := TMine_Definition(FDeployedObject).FData.Mine_Identifier;
      end else
      if FDeployedObject.ClassType = TSonobuoy_On_Board then begin
        lbClass.Caption := TSonobuoy_On_Board(FDeployedObject).FDef.Class_Identifier;
        edtName.Text := TSonobuoy_On_Board(FDeployedObject).FDef.Class_Identifier;
      end;

      btnLaunch.Enabled := false;
      btnNext.Enabled := true;
    end;
    1 :
    begin
      Notebook1.PageIndex := 2;
      if FDeployedObject <> nil then begin
        lbClassLaunch.Caption := lbClass.Caption;
        lbNameLaunch.Caption  := edtName.Text;
      end;
      btnLaunch.Enabled := true;
      btnNext.Enabled := false;
    end;
  end;
end;

procedure TfrmRPLibrary.btnPositionClick(Sender: TObject);
begin
  VSimMap.FMap.CurrentTool := mtDeployPosition;
end;

procedure TfrmRPLibrary.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmRPLibrary := nil;
  Action := caFree;
end;

procedure TfrmRPLibrary.FormCreate(Sender: TObject);
var
  i : integer;
  aObject : TObject;
  item : TListITem;
begin
  lvObject.Items.Clear;

  for i := 0 to simMgrClient.Scenario.RuntimePlatformLibrary.Count - 1 do begin
    aObject := simMgrClient.Scenario.RuntimePlatformLibrary[i];

    if aObject.ClassType = TVehicle_Definition then
      with TVehicle_Definition(aObject) do
        lvObject.AddItem(FData.Vehicle_Identifier,aObject);

    if aObject.ClassType = TMissile_Definition then
      with TMissile_Definition(aObject) do
        lvObject.AddItem(FData.Class_Identifier,aObject);

    if aObject.ClassType = TTorpedo_Definition then
      with TTorpedo_Definition(aObject) do
        lvObject.AddItem(FData.Class_Identifier,aObject);

    if aObject.ClassType = TMine_Definition then
      with TMine_Definition(aObject) do
        lvObject.AddItem(FData.Mine_Identifier,aObject);

    if aObject.ClassType = TSonobuoy_On_Board then
      with TSonobuoy_On_Board(aObject) do
        lvObject.AddItem(FDef.Class_Identifier,aObject);
  end;
  Notebook1.PageIndex := 0;
//
end;

procedure TfrmRPLibrary.SetDeployedObject(const Value: TObject);
begin
  FDeployedObject := Value;
end;

procedure TfrmRPLibrary.SetMapPositionX(const Value: double);
begin
  FMapPositionX := Value;
  edtPosition.Text := formatDM_longitude(FMapPositionX) + '  ' + formatDM_latitude(FMapPositionY);
end;

procedure TfrmRPLibrary.SetMapPositionY(const Value: double);
begin
  FMapPositionY := Value;
  edtPosition.Text := formatDM_longitude(FMapPositionX) + '  ' + formatDM_latitude(FMapPositionY);
end;

end.
