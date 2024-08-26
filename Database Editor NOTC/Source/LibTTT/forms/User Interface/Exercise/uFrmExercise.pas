unit uFrmExercise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.OleCtrls, MapXLib_TLB,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, uCoordConvertor,
  uBaseCoordSystem, uSimContainers, uDBAssetObject, uDBAsset_Deploy,
  uDBAsset_GameEnvironment, uDBEditSetting, newClassASTT, uDBAsset_Base;

type
  TUpdatePlatformID = class
  public
    OldId: Integer;
    NewId: Integer;
  end;

  TfrmExercise = class(TForm)
    ImgBackground: TImage;
    lstScenario: TListBox;
    pnlMap: TPanel;
    Map1: TMap;
    btnNew: TImage;
    btnEdit: TImage;
    btnDelete: TImage;
    ImgBackList: TImage;
    ImgBtnBack: TImage;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    lbScenarioName: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    pnlCursorPosition: TPanel;
    grpCursorPosition: TGroupBox;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    lBearingFCenter: TLabel;
    lDistanceFCenter: TLabel;
    lPosLat: TLabel;
    lGridLat: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    lPosLong: TLabel;
    lGridLong: TLabel;
    lbcenterx: TLabel;
    lbcentery: TLabel;
    GroupBox1: TGroupBox;
    Label67: TLabel;
    lblGameCenterLat: TLabel;
    lblGameCenterLong: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label65: TLabel;
    lbGameArea: TLabel;
    dtpDate: TDateTimePicker;
    dtpDDay: TDateTimePicker;
    dtpTime: TDateTimePicker;
    dtpJamJ: TDateTimePicker;
    ProgressBar1: TProgressBar;
    btnIncrease: TImage;
    Image7: TImage;
    cbbScale: TComboBox;
    btnDecrease: TImage;
    btnMove: TImage;
    Label3: TLabel;
    btncopy: TImage;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure LoadMap(aGeoset: string);
    procedure Map1MapViewChanged(Sender: TObject);

    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnDecreaseScaleClick(Sender: TObject);
    procedure btnIncreaseScaleClick(Sender: TObject);
    procedure btnMoveToolClick(Sender: TObject);
    procedure cbbScaleChange(Sender: TObject);

    procedure btnMouseEnter(Sender: TObject);
    procedure btnMouseLeave(Sender: TObject);
    procedure Map1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

    procedure UpdateCursorPositionData(const X, Y: Integer);
    procedure btncopyClick(Sender: TObject);

  private
    FStartTime, FDDayTime: TDateTime;
    FCanvas: TCanvas;
    FConverter: TCoordConverter;
    FLyrDraw: CMapXLayer;
    FUpdateList: Boolean;
    FScenarioList: TList;
    FIdTranslateList: TList;
    FOldEnvironmentIndex: Integer;
    FOldAssetDeploymentndex: Integer;
    FOldResourceAllocationIndex: Integer;
    FSelectedScenario: TScenario_Definition;
    FSelectedAssetDeployment: TAsset_Deployment;
    FSelectedResourceAllocation: TResource_Allocation;
    FSelectedEnvironment: TGame_Environment_Definition;
    FSelectedGameArea: TGame_Area_Definition;

    function TranslatePlatformID(aOldPlatformIndex: Integer): Integer;
    procedure CopyScenario;
    procedure CopyPlatform(const aNewResourceAllocationIndex, aNewDeploymentIndex: Integer);
    procedure CopyBase(const aNewResourceAllocationIndex: Integer);
    procedure CopyOverlay(const aNewResourceAllocationIndex: Integer);
    procedure CopyRPL(const aNewResourceAllocationIndex: Integer);
    procedure CopyWaypoint(const aNewResourceAllocationIndex: Integer);
    procedure CopyCubicleGroup(const aNewDeploymentIndex: Integer);
    procedure CopyPlatformActivation(const aNewDeploymentIndex: Integer);
    procedure UpdateScenarioList;
    procedure UpdateScenarioData;
    procedure UpdateGameCenter;

  public
  end;

var
  frmExercise: TfrmExercise;

implementation

uses
  uDataModuleTTT, ufrmSummaryScenario;

{$R *.dfm}

{$Region ' Form Handle '}

procedure TfrmExercise.FormCreate(Sender: TObject);
var
  currentDateTime: TDateTime;
begin
  FScenarioList := TList.Create;
  FSelectedAssetDeployment := TAsset_Deployment.Create;
  FSelectedResourceAllocation := TResource_Allocation.Create;
  FSelectedEnvironment := TGame_Environment_Definition.Create;
  FSelectedGameArea := TGame_Area_Definition.Create;

  currentDateTime := Now;
  dtpDate.Date := currentDateTime;
  dtpTime.Time := currentDateTime;
  dtpDDay.Date := currentDateTime;
  dtpJamJ.Time := currentDateTime;

  FConverter := TCoordConverter.Create;

  FIdTranslateList := TList.Create;
end;

procedure TfrmExercise.CopyPlatform(const aNewResourceAllocationIndex, aNewDeploymentIndex: Integer);
var
  i, j: Integer;
  tempList: TList;
  platformTemp: TPlatform_Instance;
  idTranslateTemp: TUpdatePlatformID;
  oldPlatformID: Integer;
begin
  tempList := TList.Create;
  FIdTranslateList.Clear;

  dmTTT.GetPlatformInstance(FOldResourceAllocationIndex, 1, 3, tempList);
  for i := 0 to tempList.Count - 1 do
  begin
    platformTemp := tempList.Items[i];

    with platformTemp do
    begin
      oldPlatformID := FData.Platform_Instance_Index;
      FData.Resource_Alloc_Index := aNewResourceAllocationIndex;
      dmTTT.InsertPlatformInstance(FData);

      {Copy Platform Activation}
      if dmTTT.GetPlatformActivation(FOldAssetDeploymentndex, oldPlatformID, FActivation) > 0 then
      begin
        FActivation.Deployment_Index := aNewDeploymentIndex;
        FActivation.Platform_Instance_Index := FData.Platform_Instance_Index;

        dmTTT.InsertPlatformActivation(FActivation);
      end;

      idTranslateTemp := TUpdatePlatformID.Create;
      with idTranslateTemp do
      begin
        OldId := oldPlatformID;
        NewId := FData.Platform_Instance_Index;

        FIdTranslateList.Add(idTranslateTemp);
      end;
    end;
  end;
  tempList.Clear;

  dmTTT.GetPlatformInstance(FOldResourceAllocationIndex, 1, 1, tempList);
  for j := 0 to tempList.Count - 1 do
  begin
    platformTemp := tempList.Items[j];

    with platformTemp do
    begin
      oldPlatformID := FData.Platform_Instance_Index;
      FData.Resource_Alloc_Index := aNewResourceAllocationIndex;
      dmTTT.InsertPlatformInstance(FData);

      {Copy Platform Activation}
      if dmTTT.GetPlatformActivation(FOldAssetDeploymentndex, oldPlatformID, FActivation) > 0 then
      begin
        FActivation.Deployment_Index := aNewDeploymentIndex;
        FActivation.Platform_Instance_Index := FData.Platform_Instance_Index;

        dmTTT.InsertPlatformActivation(FActivation);
      end;

      idTranslateTemp := TUpdatePlatformID.Create;
      with idTranslateTemp do
      begin
        OldId := oldPlatformID;
        NewId := FData.Platform_Instance_Index;

        FIdTranslateList.Add(idTranslateTemp);
      end;
    end;
  end;
  tempList.Clear;

  dmTTT.GetPlatformActivation(aNewDeploymentIndex, tempList);
  for i := 0 to tempList.Count - 1 do
  begin
    platformTemp := tempList.Items[i];

    with platformTemp do
    begin
      FActivation.Host_ID := TranslatePlatformID(FActivation.Host_ID);
      dmTTT.UpdatePlatformActivation(FActivation);
    end;
  end;

  tempList.Free;
end;

procedure TfrmExercise.CopyCubicleGroup(const aNewDeploymentIndex: Integer);
var
  i, j, parentIndex: Integer;
  tempList: TList;
  cubicleTemp: TCubicle_Group_Assignment;
begin
  tempList := TList.Create;

  dmTTT.GetCubicleGroup(FOldAssetDeploymentndex, 3, tempList);
  for i := 0 to tempList.Count - 1 do
  begin
    cubicleTemp := tempList.Items[i];

    with cubicleTemp do
    begin
      parentIndex := FData.Group_Index;
      FData.Deployment_Index := aNewDeploymentIndex;

      dmTTT.InsertCubicleGroup(FData);
    end;
  end;
  tempList.Clear;

  dmTTT.GetCubicleGroup(FOldAssetDeploymentndex, 1, tempList);
  for i := 0 to tempList.Count - 1 do
  begin
    cubicleTemp := tempList.Items[i];

    with cubicleTemp do
    begin
      parentIndex := FData.Group_Index;
      FData.Deployment_Index := aNewDeploymentIndex;

      dmTTT.InsertCubicleGroup(FData);
    end;
  end;

  tempList.Free;
end;

procedure TFrmExercise.CopyScenario;
var
  newScenarioName: string;
  count, parentIndex: Integer;
begin

  {$REGION ' Pengecekan nama scenario baru '}
  with FSelectedScenario do
  begin
    newScenarioName := FData.Scenario_Identifier + ' - Copy';

    count := dmTTT.GetScenarioDef(newScenarioName);

    if count > 0 then
      newScenarioName := newScenarioName + ' (' + IntToStr(count + 1) + ')';
  end;
  {$ENDREGION}
  {$REGION ' Insert Environtment '}
  with FSelectedEnvironment do
  begin
    FOldEnvironmentIndex := FData.Game_Enviro_Index;

    FData.Game_Enviro_Identifier := 'Scenario - ' + newScenarioName;
    dmTTT.InsertEnvironmentDef(FData);

    FGlobal_Conv.Game_Enviro_Index := FData.Game_Enviro_Index;
    dmTTT.InsertGlobalConvergenceZone(FGlobal_Conv);
  end;
  {$ENDREGION}
  {$REGION ' Insert Resource Allocation '}
  with FSelectedResourceAllocation do
  begin
    FOldResourceAllocationIndex := FData.Resource_Alloc_Index;

    FData.Allocation_Identifier := 'Scenario - ' + newScenarioName;
    FData.Game_Enviro_Index := FSelectedEnvironment.FData.Game_Enviro_Index;
    dmTTT.InsertResourceAllocationDef(FData);
  end;
  {$ENDREGION}
  {$REGION ' Insert Scenario '}
  with FSelectedScenario do
  begin
    FData.Resource_Alloc_Index := FSelectedResourceAllocation.FData.Resource_Alloc_Index;

    FData.Scenario_Identifier := newScenarioName;
    FData.Scenario_Code := 0;

    if dmTTT.InsertScenarioDef(FSelectedScenario.FData) then
    begin
      with FSelectedAssetDeployment do
      begin
        FOldAssetDeploymentndex := FData.Deployment_Index;
        FData.Deployment_Identifier := '(Scenario ' + newScenarioName + ')';
        FData.Scenario_Index := FSelectedScenario.FData.Scenario_Index;

        dmTTT.InsertAssetDeployment(FSelectedAssetDeployment.FData);
      end;
    end;
  end;
  {$ENDREGION}
  {$REGION ' Copy Semua Resource '}
  {Copy Platform}
  CopyPlatform(FSelectedResourceAllocation.FData.Resource_Alloc_Index, FSelectedAssetDeployment.FData.Deployment_Index);

  {Copy Base}
  CopyBase(FSelectedResourceAllocation.FData.Resource_Alloc_Index);

  {Copy Overlay}
  CopyOverlay(FSelectedResourceAllocation.FData.Resource_Alloc_Index);

  {Copy RPL}
  CopyRPL(FSelectedResourceAllocation.FData.Resource_Alloc_Index);

  {Copy Waypoint}
  CopyWaypoint(FSelectedResourceAllocation.FData.Resource_Alloc_Index);

  {Copy Cubicle Group}
  CopyCubicleGroup(FSelectedAssetDeployment.FData.Deployment_Index);

  {Copy Platform Activation}
//  CopyPlatformActivation(FSelectedAssetDeployment.FData.Deployment_Index);
end;

procedure TfrmExercise.CopyWaypoint(const aNewResourceAllocationIndex: Integer);
var
  i: Integer;
  tempList: TList;
  waypointTemp: TResource_Waypoint_Mapping;
begin
  tempList := TList.Create;

  dmTTT.GetResourceWaypointMapping(FOldResourceAllocationIndex, tempList);
  for i := 0 to tempList.Count - 1 do
  begin
    waypointTemp := tempList.Items[i];

    with waypointTemp do
    begin
      FData.Resource_Alloc_Index := aNewResourceAllocationIndex;
      dmTTT.InsertResourceWaypointMapping(waypointTemp);
    end;
  end;
  tempList.Free;
end;

procedure TfrmExercise.CopyPlatformActivation(const aNewDeploymentIndex: Integer);
var
  i: Integer;
  tempList: TList;
  platformTemp: TPlatform_Instance;
begin
  tempList := TList.Create;

  dmTTT.GetPlatformActivation(FOldAssetDeploymentndex, tempList);
  for i := 0 to tempList.Count - 1 do
  begin
    platformTemp := tempList.Items[i];

    with platformTemp do
    begin
      FActivation.Deployment_Index := aNewDeploymentIndex;
      dmTTT.InsertPlatformActivation(FActivation);
    end;
  end;
  tempList.Free;
end;

procedure TfrmExercise.CopyRPL(const aNewResourceAllocationIndex: Integer);
var
  i: Integer;
  tempList: TList;
  rplTemp: TResource_Library_Mapping;
begin
  tempList := TList.Create;

  dmTTT.GetResourceRPLMapping(FOldResourceAllocationIndex, tempList);
  for i := 0 to tempList.Count - 1 do
  begin
    rplTemp := tempList.Items[i];

    with rplTemp do
    begin
      FData.Resource_Alloc_Index := aNewResourceAllocationIndex;
      dmTTT.InsertResourceRPLMapping(FData);
    end;
  end;
  tempList.Free;
end;

procedure TfrmExercise.FormDestroy(Sender: TObject);
begin
  FreeItemsAndFreeList(FScenarioList);
  FSelectedAssetDeployment.Free;
  FSelectedResourceAllocation.Free;
  FSelectedEnvironment.Free;
  FSelectedGameArea.Free;

  FConverter.Free;
end;

procedure TfrmExercise.FormShow(Sender: TObject);
begin
  DoubleBuffered := False;
  pnlMap.Visible := True;

  LoadMap(vAppDBSetting.Pattern);

  FConverter.FMap := Map1;

  cbbScale.ItemIndex := cbbScale.Items.Count - 1;
  cbbScaleChange(cbbScale);

  UpdateScenarioList;
end;

procedure TfrmExercise.btnMouseLeave(Sender: TObject);
begin
//
end;

procedure TfrmExercise.btnMouseEnter(Sender: TObject);
begin
//
end;

procedure TfrmExercise.btnCloseClick(Sender: TObject);
begin
  close;
end;

{$ENDREGION}

{$Region ' Button Handle '}

procedure TfrmExercise.btnNewClick(Sender: TObject);
begin

  frmSummaryScenario := TfrmSummaryScenario.Create(Self);
  try
    with frmSummaryScenario do
    begin
      SelectedScenario := TScenario_Definition.Create;
      SelectedResourceAllocation := TResource_Allocation.Create;
      SelectedEnvironment := TGame_Environment_Definition.Create;
      SelectedGameArea := TGame_Area_Definition.Create;
      SelectedAssetDeployment := TAsset_Deployment.Create;
      ShowModal;
    end;
  finally
    frmSummaryScenario.Free;
  end;

  UpdateScenarioList;
end;

procedure TfrmExercise.cbbScaleChange(Sender: TObject);
var
  z: Double;
  s: string;
begin
  Map1.OnMapViewChanged := nil;

  if cbbScale.ItemIndex < 0 then
    Exit;

  if (cbbScale.ItemIndex <= 16) then
  begin
    s := cbbScale.Items[cbbScale.ItemIndex];
    try
      z := StrToFloat(s);
      Map1.ZoomTo(z, Map1.CenterX, Map1.CenterY);
    finally

    end;
  end
  else
    cbbScale.ItemIndex := cbbScale.ItemIndex - 1;

  Map1.OnMapViewChanged := Map1MapViewChanged;
end;

procedure TfrmExercise.CopyBase(const aNewResourceAllocationIndex: Integer);
var
  i, j: Integer;
  tempList: TList;
  baseTemp: TResource_Base_Mapping;
begin
  tempList := TList.Create;

  dmTTT.GetResourceBaseMapping(FOldResourceAllocationIndex, 3, tempList);
  for i := 0 to tempList.Count - 1 do
  begin
    baseTemp := tempList.Items[i];

    with baseTemp do
    begin
      FData.Resource_Alloc_Index := aNewResourceAllocationIndex;
      dmTTT.InsertResourceBaseMapping(baseTemp);
    end;
  end;
  tempList.Clear;

  dmTTT.GetResourceBaseMapping(FOldResourceAllocationIndex, 1, tempList);
  for j := 0 to tempList.Count - 1 do
  begin
    baseTemp := tempList.Items[j];

    with baseTemp do
    begin
      FData.Resource_Alloc_Index := aNewResourceAllocationIndex;
      dmTTT.InsertResourceBaseMapping(baseTemp);
    end;
  end;

  tempList.Free;
end;

procedure TfrmExercise.btnEditClick(Sender: TObject);
begin
  if lstScenario.ItemIndex = -1 then
     Exit;

  frmSummaryScenario := TfrmSummaryScenario.Create(Self);
  try
    with frmSummaryScenario do
    begin
      SelectedScenario := FSelectedScenario;
      SelectedAssetDeployment := FSelectedAssetDeployment;
      ShowModal;
    end;
  finally
    frmSummaryScenario.Free;
  end;
  UpdateScenarioList;
end;

procedure TfrmExercise.btnIncreaseScaleClick(Sender: TObject);
begin
  if cbbScale.ItemIndex = 0 then
    Exit;

  cbbScale.ItemIndex := cbbScale.ItemIndex - 1;
  cbbScaleChange(cbbScale);
end;

procedure TfrmExercise.btnMoveToolClick(Sender: TObject);
begin
  Map1.CurrentTool := miPanTool;
  Map1.MousePointer := miPanCursor;

  btnMove.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnMove_Select.PNG');
end;

procedure TfrmExercise.btncopyClick(Sender: TObject);
begin
  if lstScenario.ItemIndex = -1 then
  begin
    showmessage('Please select scenario to copy !');
    Exit;
  end;

  CopyScenario;
  UpdateScenarioList;
end;

procedure TfrmExercise.btnDecreaseScaleClick(Sender: TObject);
begin
  if cbbScale.ItemIndex = 16 then
    exit;

  cbbScale.ItemIndex := cbbScale.ItemIndex + 1;
  cbbScaleChange(cbbScale);
end;

procedure TfrmExercise.btnDeleteClick(Sender: TObject);
var
  warning: Integer;
begin
  if lstScenario.ItemIndex = -1 then
  begin
    ShowMessage('Select Scenario !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this Scenario ?', mtConfirmation, mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedAssetDeployment.FData do
    begin
      dmTTT.DeletePlatformActivation(1, Deployment_Index);

      dmTTT.DeleteCubicleGroupAssignment(1, Deployment_Index);
      dmTTT.DeleteCubicleGroupChannelAssignment(1, Deployment_Index);
      dmTTT.DeleteCubicleGroup(1, Deployment_Index);
    end;

    with FSelectedScenario.FData do
      dmTTT.DeleteScenarioDef(Scenario_Index);

    with FSelectedResourceAllocation.FData do
    begin
      dmTTT.DeletePlatformInstance(1, Resource_Alloc_Index);
      dmTTT.DeleteResourceBaseMapping(1, Resource_Alloc_Index, 0, 0);
      dmTTT.DeleteResourceOverlayMapping(1, Resource_Alloc_Index);

      dmTTT.DeleteResourceRPLMapping(1, Resource_Alloc_Index, 0);
      dmTTT.DeleteResourceWaypointMapping(1, Resource_Alloc_Index, 0);

      dmTTT.DeleteResourceAllocationDef(Resource_Alloc_Index);
    end;

    with FSelectedEnvironment.FData do
    begin
      dmTTT.DeleteGlobalConvergenceZone(Game_Enviro_Index);

      dmTTT.DeleteEnvironmentDef(Game_Enviro_Index)
    end;

    UpdateScenarioList;
    LoadMap('D:\Map\mapsource\IndonesiaBackground\Indonesia.gst');
  end;
end;

procedure TfrmExercise.CopyOverlay(const aNewResourceAllocationIndex: Integer);
var
  i, j: Integer;
  tempList: TList;
  overlayTemp: TResource_Overlay_Mapping;
begin
  tempList := TList.Create;

  dmTTT.GetResourceOverlayMapping(FOldResourceAllocationIndex, 3, tempList);
  for i := 0 to tempList.Count - 1 do
  begin
    overlayTemp := tempList.Items[i];

    with overlayTemp do
    begin
      FData.Resource_Alloc_Index := aNewResourceAllocationIndex;
      dmTTT.InsertResourceOverlayMapping(FData);
    end;
  end;
  tempList.Clear;

  dmTTT.GetResourceOverlayMapping(FOldResourceAllocationIndex, 1, tempList);
  for j := 0 to tempList.Count - 1 do
  begin
    overlayTemp := tempList.Items[j];

    with overlayTemp do
    begin
      FData.Resource_Alloc_Index := aNewResourceAllocationIndex;
      dmTTT.InsertResourceOverlayMapping(FData);
    end;
  end;

  tempList.Free;
end;

procedure TfrmExercise.lbSingleClick(Sender: TObject);
begin
  Map1.CurrentTool := miArrowTool;
  Map1.MousePointer := crDefault;
  btnMove.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnMove_Normal.PNG');

  if lstScenario.ItemIndex = -1 then
    Exit;

  FSelectedScenario := TScenario_Definition(lstScenario.Items.Objects[lstScenario.ItemIndex]);

  with FSelectedScenario.FData do
  begin
    dmTTT.GetAssetDeployment(Scenario_Index, FSelectedAssetDeployment);
    dmTTT.GetResourceAllocationDef(Resource_Alloc_Index, FSelectedResourceAllocation);
  end;

  with FSelectedResourceAllocation.FData do
    dmTTT.GetEnvironmentDef(Game_Enviro_Index, FSelectedEnvironment);

  with FSelectedEnvironment.FData do
    dmTTT.GetGameAreaDef(Game_Area_Index, FSelectedGameArea);

  UpdateScenarioData;
  UpdateGameCenter;
end;

procedure TfrmExercise.UpdateCursorPositionData(const X, Y: Integer);
var
  dx, dy, diffX, diffY: Double;
begin
  FConverter.ConvertToMap(X, Y, dx, dy);

  lBearingFCenter.Caption := FormatFloat('0.00', CalcBearing(FSelectedEnvironment.FGameArea.Game_Centre_Long, FSelectedEnvironment.FGameArea.Game_Centre_Lat, dx, dy));

  lDistanceFCenter.Caption := FormatFloat('0.00', CalcRange(FSelectedEnvironment.FGameArea.Game_Centre_Long, FSelectedEnvironment.FGameArea.Game_Centre_Lat, dx, dy));

  lPosLat.Caption := formatDMS_latt(dy);
  lPosLong.Caption := formatDMS_long(dx);

  diffX := Abs(dx - FSelectedEnvironment.FGameArea.Game_Centre_Long) * 60;
  diffY := Abs(dy - FSelectedEnvironment.FGameArea.Game_Centre_Lat) * 60;

  if dy < FSelectedEnvironment.FGameArea.Game_Centre_Lat then
    lGridLat.Caption := FormatFloat('0.00', diffY) + ' nm S'
  else
    lGridLat.Caption := FormatFloat('0.00', diffY) + ' nm N';

  if dx < FSelectedEnvironment.FGameArea.Game_Centre_Long then
    lGridLong.Caption := FormatFloat('0.00', diffX) + ' nm W'
  else
    lGridLong.Caption := FormatFloat('0.00', diffX) + ' nm E';
end;

procedure TfrmExercise.UpdateGameCenter;
var
  i: Integer;
begin
  ProgressBar1.Visible := True;

  for i := 0 to Random(80) do
    ProgressBar1.Position := i;

  with FSelectedGameArea.FData do
  begin
    LoadMap(vAppDBSetting.MapGSTGame + '\' + Game_Area_Identifier + '\' + Game_Area_Identifier + '.gst');

    Map1.CenterX := Game_Centre_Long;
    Map1.CenterY := Game_Centre_Lat;

    lblGameCenterLat.Caption := formatDMS_latt(Game_Centre_Lat);
    lblGameCenterLong.Caption := formatDMS_long(Game_Centre_Long);

  end;

  ProgressBar1.Position := 90;

  cbbScale.ItemIndex := cbbScale.Items.Count - 1;
  cbbScaleChange(cbbScale);

  ProgressBar1.Position := 100;
  ProgressBar1.Visible := False;
end;

procedure TfrmExercise.UpdateScenarioData;
begin
  lbScenarioName.Caption := FSelectedScenario.FData.Scenario_Identifier;
  lbGameArea.Caption := FSelectedGameArea.FData.Game_Area_Identifier;

  with FSelectedResourceAllocation do
  begin
    FStartTime := FData.Game_Start_Time;
    FDDayTime := FData.D_Day;

    dtpDate.Date := FStartTime;
    dtpTime.Time := FStartTime;

    dtpDDay.Date := FDDayTime;
    dtpJamJ.Time := FDDayTime;
  end;
end;

procedure TfrmExercise.UpdateScenarioList;
var
  i: Integer;
  scenario: TScenario_Definition;
begin
  dmTTT.GetAllScenarioDef(FScenarioList);

  lstScenario.Clear;

  for i := 0 to FScenarioList.Count - 1 do
  begin
    scenario := FScenarioList.Items[i];
    lstScenario.Items.AddObject(scenario.FData.Scenario_Identifier, scenario);
  end;
end;

{$ENDREGION}

{$Region ' Map Handle '}

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure TfrmExercise.LoadMap(aGeoset: string);
var
  z: OleVariant;
  i: Integer;
  mInfo: CMapXLayerInfo;
begin
  if Map1 = nil then
    Exit;

  InitOleVariant(z);
  Map1.Layers.RemoveAll;
  Map1.Geoset := aGeoset;

  if aGeoset <> '' then
  begin
    for i := 1 to Map1.Layers.Count do
    begin
      Map1.Layers.Item(i).Selectable := False;
      Map1.Layers.Item(i).Editable := False;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := Map1.Layers.Add(mInfo, 1);

    Map1.Layers.AnimationLayer := FLyrDraw;
    Map1.MapUnit := miUnitNauticalMile;
  end;

  Map1.BackColor := clSkyBlue;
end;

procedure TfrmExercise.Map1MapViewChanged(Sender: TObject);
var
  tempZoom: double;
begin
  if (Map1.CurrentTool = miZoomInTool) or (Map1.CurrentTool = miZoomOutTool) then
  begin
    if Map1.Zoom <= 0.125 then
      tempZoom := 0.125;
    if (Map1.Zoom > 0.125) and (Map1.Zoom < 1) then
      tempZoom := Map1.Zoom;
    if (Map1.Zoom >= 1) and (Map1.Zoom <= 2500) then
      tempZoom := round(Map1.Zoom);
    if Map1.Zoom > 2500 then
      tempZoom := 2500;

    Map1.OnMapViewChanged := nil;
    Map1.ZoomTo(tempZoom, Map1.CenterX, Map1.CenterY);

    Map1.OnMapViewChanged := Map1MapViewChanged;
  end;
end;

procedure TfrmExercise.Map1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  UpdateCursorPositionData(X, Y);
end;

{$ENDREGION}
function TfrmExercise.TranslatePlatformID(aOldPlatformIndex: Integer): Integer;
var
  i: Integer;
  idTemp: TUpdatePlatformID;
begin
  Result := 0;

  for i := 0 to FIdTranslateList.Count - 1 do
  begin
    idTemp := FIdTranslateList.Items[i];

    if idTemp.OldId = aOldPlatformIndex then
    begin
      Result := idTemp.NewId;
    end;
  end;
end;

end.

