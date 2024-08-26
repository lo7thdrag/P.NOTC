unit ufrmSummaryScenario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DateUtils,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Vcl.Imaging.pngimage, VrControls, VrWheel,
  uDBAssetObject, uDBEditSetting, uDBAsset_GameEnvironment, uDBAsset_Deploy;

type
  TfrmSummaryScenario = class(TForm)
    ImgBackgroundForm: TImage;
    Img1Scenario: TImage;
    lblTabNotes: TLabel;
    ImgDash1: TImage;
    Img3ResourceAllocation: TImage;
    pnlTabScenario: TPanel;
    lbl7: TLabel;
    Label2: TLabel;
    dtpDate: TDateTimePicker;
    dtpDDay: TDateTimePicker;
    dtpTime: TDateTimePicker;
    dtpJamJ: TDateTimePicker;
    lbl9: TLabel;
    edtGameArea: TEdit;
    btnGameArea: TButton;
    pnlTabResource: TPanel;
    Img4Deployment: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ImgBtnNext: TImage;
    ImgBtnBack: TImage;
    ImgDash2: TImage;
    ImgHome: TImage;
    edtName: TEdit;
    Label3: TLabel;
    Image1: TImage;
    pnlTabEnvironment: TPanel;
    Image2: TImage;
    lbl14: TLabel;
    lbl8: TLabel;
    Label1: TLabel;
    edtWindSpeed: TEdit;
    edtWindDirection: TEdit;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl15: TLabel;
    vwOceanDirection: TVrWheel;
    lbl12: TLabel;
    lbl13: TLabel;
    edtOceanSpeed: TEdit;
    edtOceanDirection: TEdit;
    lbl19: TLabel;
    lbl18: TLabel;
    lbl1: TLabel;
    trckbrDayVis: TTrackBar;
    edtDayVis: TEdit;
    lbl2: TLabel;
    trckbrNightVis: TTrackBar;
    edtNightVis: TEdit;
    lbl3: TLabel;
    trckbrRainRate: TTrackBar;
    edtRainRate: TEdit;
    lbl4: TLabel;
    trckbrSeaState: TTrackBar;
    edtSeaState: TEdit;
    ImgDash3: TImage;
    Label4: TLabel;
    Img2Environment: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblAdvanceSetting: TLabel;
    vwWindDirection: TVrWheel;
    pnlTabDeployment: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Image4: TImage;
    Image3: TImage;
    btnFinish: TImage;
    btnGroup: TImage;
    rbBluePlatform: TRadioButton;
    rbRedPlatform: TRadioButton;
    Image5: TImage;
    btnVehicle: TImage;
    btnBase: TImage;
    btnOverlay: TImage;
    ImgWaypoint: TImage;
    ImgRPL: TImage;
    rbBlue: TRadioButton;
    rbRed: TRadioButton;

    //Global
    function GetNumberOfKoma(s : string): Boolean;
    procedure edtNumeralKeyPress(Sender: TObject; var Key: Char);
    procedure edtChange(Sender: TObject);
    procedure ValidationFormatInput();

    //Scenario

    //Environment
    procedure vwDirectionChange(Sender: TObject);
    procedure edtDirectionChange(Sender: TObject);
    procedure trckbrEnvironmentVisualChange(Sender: TObject);
    procedure trckbrEnvironmentStateChange(Sender: TObject);
    procedure edtVisualChange(Sender: TObject);
    procedure edtStateChange(Sender: TObject);

    //Resource Allocation
    procedure ForceChose;

    procedure btnNextClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImgHomeClick(Sender: TObject);
    procedure btnGameAreaClick(Sender: TObject);
    procedure lblAdvanceSettingClick(Sender: TObject);

    procedure btnVehicleClick(Sender: TObject);
    procedure btnOverlayClick(Sender: TObject);
    procedure ImgRPLClick(Sender: TObject);
    procedure btnBaseClick(Sender: TObject);
    procedure ImgWaypointClick(Sender: TObject);

    procedure btnGroupClick(Sender: TObject);
    procedure ImgDeploymentClick(Sender: TObject);

    procedure ForceChoseClick(Sender: TObject);
    procedure ForceChosePlatformClick(Sender: TObject);
    procedure dtpDateChange(Sender: TObject);
    procedure dtpDDayChange(Sender: TObject);

  private
    FTabpage : Integer;
    FStartTime, FDDayTime : TDateTime;

    FSelectedForce : Integer; {1: Red; 3: Blue}
    FSelectedForce2 : Integer; {1: Red; 3: Blue}

    FSelectedScenario : TScenario_Definition;
    FSelectedResourceAllocation : TResource_Allocation;
    FSelectedEnvironment : TGame_Environment_Definition;
    FSelectedGameArea : TGame_Area_Definition;

    FSelectedAssetDeployment : TAsset_Deployment;

    function CekInput: Boolean;

    procedure SaveScenario;
    procedure CreateResourceAllocation;
    procedure CreateEnvironment;

    procedure UpdatePage;
    procedure UpdateScenario;
    procedure UpdateResourceAllocation;
    procedure UpdateEnvironment;
    procedure UpdateGameAreaData;

    procedure SetResourceData;
    procedure SetSubEnvironmentData;
    procedure SetGameAreaData;

  public
    LastName : string;
    property SelectedScenario : TScenario_Definition read FSelectedScenario write FSelectedScenario;
    property SelectedResourceAllocation : TResource_Allocation read FSelectedResourceAllocation write FSelectedResourceAllocation;
    property SelectedEnvironment : TGame_Environment_Definition read FSelectedEnvironment write FSelectedEnvironment;
    property SelectedGameArea : TGame_Area_Definition read FSelectedGameArea write FSelectedGameArea;
    property SelectedAssetDeployment : TAsset_Deployment read FSelectedAssetDeployment write FSelectedAssetDeployment;

  end;

var
  frmSummaryScenario : TfrmSummaryScenario;

implementation

uses
  ufrmGameAreaPickList, ufrmSubEnviCharacteristic,
  ufrmVehicleResourceAllocationPickList, ufrmBaseResourceAllocationPickList, ufrmOverlayResourceAllocationPickList,
  ufrmRPLResourceAllocationPickList, ufrmWaypointResourceAllocationPickList,

  ufrmGroupSelect, uDataModuleTTT, ufrmPlatformDeploytment;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSummaryScenario.FormShow(Sender: TObject);
begin
  FTabpage := 0;
  FSelectedForce := 3;
  FSelectedForce2 := 3;

  UpdateScenario;

  UpdatePage;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryScenario.btnBackClick(Sender: TObject);
begin
  FTabpage := FTabpage - 1;
  UpdatePage;
end;

procedure TfrmSummaryScenario.btnGameAreaClick(Sender: TObject);
begin
  frmGameAreaPickList := TfrmGameAreaPickList.Create(Self);
  try
    with frmGameAreaPickList do
    begin
      SelectedGameAreaId := SelectedEnvironment.FData.Game_Area_Index;
      ShowModal;
      FSelectedEnvironment.FData.Game_Area_Index := SelectedGameAreaId;
    end;

  finally
    frmGameAreaPickList.Free;
  end;

  UpdateGameAreaData;
end;

procedure TfrmSummaryScenario.btnNextClick(Sender: TObject);
begin
  if FTabpage = 0 then
  begin
    if not CekInput then
      Exit;
  end;

  FTabpage := FTabpage + 1;
  UpdatePage;
end;

procedure TfrmSummaryScenario.CreateEnvironment;
begin
  {$REGION ' Set nilai default (dari modul astt 7-8) '}
  with FSelectedEnvironment do
  begin
    FData.Game_Enviro_Identifier := 'Scenario - ' + edtName.Text;
    FData.Wind_Speed := 0;
    FData.Wind_Direction := 0;
    FData.Daytime_Visual_Modifier := 100;
    FData.Nighttime_Visual_Modifier := 50;
    FData.Daytime_Infrared_Modifier := 0;
    FData.Nighttime_Infrared_Modifier := 100;
    FData.Sunrise := 21600;
    FData.Sunset := 64800;
    FData.Period_of_Twilight := 1800;
    FData.Rain_Rate := 0;
    FData.Cloud_Base_Height := 100000;
    FData.Cloud_Attenuation := 0;
    FData.Sea_State := 0;
    FData.Ocean_Current_Speed := 0;
    FData.Ocean_Current_Direction := 0;
    FData.Thermal_Layer_Depth := 0;
    FData.Sound_Velocity_Type := 0;
    FData.Surface_Sound_Speed := 2700;
    FData.Layer_Sound_Speed := 4600;
    FData.Bottom_Sound_Speed := 6000;
    FData.Bottomloss_Coefficient := 1;
    FData.Ave_Ocean_Depth := 6000;
    FData.CZ_Active := 0;
    FData.Surface_Ducting_Active := 0;
    FData.Upper_Limit_Surface_Duct_Depth := 0;
    FData.Lower_Limit_Surface_Duct_Depth := 0;
    FData.Sub_Ducting_Active := 0;
    FData.Upper_Limit_Sub_Duct_Depth := 0;
    FData.Lower_Limit_Sub_Duct_Depth := 0;
    FData.Shipping_Rate := 0;
    FData.Shadow_Zone_Trans_Loss := 0;
    FData.Atmospheric_Refract_Modifier := 100;
    FData.Barometric_Pressure := 0;
    FData.Air_Temperature := 0;
    FData.Surface_Temperature := 0;
    FData.Start_HF_Range_Gap := 2000;
    FData.End_HF_Range_Gap := 2000;

    FGlobal_Conv.Occurance_Range := 30;
    FGlobal_Conv.Width := 3;
    FGlobal_Conv.Signal_Reduction_Term := 0;
    FGlobal_Conv.Increase_per_CZ := 0;
    FGlobal_Conv.Max_Sonar_Depth := 300;
  end;
  {$ENDREGION}
end;

procedure TfrmSummaryScenario.CreateResourceAllocation;
var
  currentDateTime : TDateTime;
begin
  {$REGION ' Set nilai default '}
  with FSelectedResourceAllocation do
  begin
    FData.Allocation_Identifier := 'Scenario - ' + edtName.Text;

    currentDateTime := Now;
    FData.Game_Start_Time := currentDateTime;
    FData.D_Day := currentDateTime;
    FData.Game_Enviro_Index :=  FSelectedEnvironment.FData.Game_Enviro_Index;
    FData.Defaults_Index := 1; {'Game Default AOTC'}
    FData.Role_List_Index := 25; {Demonstration Exercise}
  end;
  {$ENDREGION}
end;

procedure TfrmSummaryScenario.dtpDateChange(Sender: TObject);
begin
  FStartTime := EncodeDateTime(YearOf(dtpDate.Date), MonthOf(dtpDate.Date),
    DayOf(dtpDate.DateTime), HourOf(dtpTime.Time), MinuteOf(dtpTime.Time),
    SecondOf(dtpTime.Time), 0);
end;

procedure TfrmSummaryScenario.dtpDDayChange(Sender: TObject);
begin
  FDDayTime := EncodeDateTime(YearOf(dtpDDay.Date), MonthOf(dtpDDay.Date),
    DayOf(dtpDDay.DateTime), HourOf(dtpJamJ.Time), MinuteOf(dtpJamJ.Time),
    SecondOf(dtpJamJ.Time), 0);
end;

procedure TfrmSummaryScenario.ForceChose;
begin
  if rbBlue.Checked then
  begin
    FSelectedForce := 3;
  end
  else
  begin
    FSelectedForce := 1;
  end;
end;

procedure TfrmSummaryScenario.btnVehicleClick(Sender: TObject);
begin
  frmVehicleResourceAllocationPickList := TfrmVehicleResourceAllocationPickList.Create(Self);
  try
    with frmVehicleResourceAllocationPickList do
    begin
      ResourceAllocation := FSelectedResourceAllocation;
      AssetDeployment := FSelectedAssetDeployment;
      SelectedForce := FSelectedForce;
      ShowModal;
    end;

  finally
    frmVehicleResourceAllocationPickList.Free;
  end;
end;

procedure TfrmSummaryScenario.ImgWaypointClick(Sender: TObject);
begin
  frmWaypointResourceAllocationPickList := TfrmWaypointResourceAllocationPickList.Create(Self);
  try
    with frmWaypointResourceAllocationPickList do
    begin
      ResourceAllocation := FSelectedResourceAllocation;
      SelectedForce := FSelectedForce;
      ShowModal;
    end;

  finally
    frmWaypointResourceAllocationPickList.Free;
  end;
end;

procedure TfrmSummaryScenario.ImgRPLClick(Sender: TObject);
begin
  frmRPLResourceAllocationPickList := TfrmRPLResourceAllocationPickList.Create(Self);
  try
    with frmRPLResourceAllocationPickList do
    begin
      ResourceAllocation := FSelectedResourceAllocation;
      ShowModal;
    end;

  finally
    frmRPLResourceAllocationPickList.Free;
  end;

end;

procedure TfrmSummaryScenario.btnOverlayClick(Sender: TObject);
begin
  frmOverlayResourceAllocationPickList := TfrmOverlayResourceAllocationPickList.Create(Self);
  try
    with frmOverlayResourceAllocationPickList do
    begin
      ResourceAllocation := FSelectedResourceAllocation;
      SelectedForce := FSelectedForce;
      ShowModal;
    end;

  finally
    frmOverlayResourceAllocationPickList.Free;
  end;
end;

procedure TfrmSummaryScenario.btnBaseClick(Sender: TObject);
begin
  frmBaseResourceAllocationPickList := TfrmBaseResourceAllocationPickList.Create(Self);
  try
    with frmBaseResourceAllocationPickList do
    begin
      ResourceAllocation := FSelectedResourceAllocation;
      SelectedForce := FSelectedForce;
      ShowModal;
    end;

  finally
    frmBaseResourceAllocationPickList.Free;
  end;
end;

procedure TfrmSummaryScenario.ImgDeploymentClick(Sender: TObject);
begin
  frmPlatformDeploytment := TfrmPlatformDeploytment.Create(Self);
  try
    with frmPlatformDeploytment do
    begin
      SelectedAssetDeployment := FSelectedAssetDeployment;
      SelectedResourceAlloc := FSelectedResourceAllocation;
      SelectedEnviArea := FSelectedEnvironment;
      ShowModal;
    end;
  finally
    frmPlatformDeploytment.Free;
  end;
end;

procedure TfrmSummaryScenario.btnGroupClick(Sender: TObject);
begin
  frmGroupSelect := TfrmGroupSelect.Create(Self);
  try
    with frmGroupSelect do
    begin
      SelectedScenario := FSelectedScenario;
      SelectedResourceAlloc := FSelectedResourceAllocation;
      SelectedAssetDeployment := FSelectedAssetDeployment;
      SelectedForce := FSelectedForce2;
      ShowModal;
    end;
  finally
    frmGroupSelect.Free;
  end;
end;

procedure TfrmSummaryScenario.ImgHomeClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSummaryScenario.lblAdvanceSettingClick(Sender: TObject);
begin
  frmSubEnviCharacteristic := TfrmSubEnviCharacteristic.Create(Self);
  try
    with frmSubEnviCharacteristic do
    begin
      SetSubEnvironmentData;
      AdvanceEnvironment := FSelectedEnvironment;
      ShowModal;

      if AfterClose then
        FSelectedEnvironment := AdvanceEnvironment;
    end;
  finally
    frmSubEnviCharacteristic.Free;
  end;

  UpdateEnvironment
end;

procedure TfrmSummaryScenario.SaveScenario;
begin
  LastName := edtName.Text;
  FSelectedEnvironment.FData.Game_Enviro_Identifier := 'Scenario - ' + edtName.Text;
  FSelectedResourceAllocation.FData.Allocation_Identifier := 'Scenario - ' + edtName.Text;
  FSelectedScenario.FData.Scenario_Identifier := edtName.Text;
  FSelectedScenario.FData.Scenario_Code := 0;

  SetResourceData;
  SetSubEnvironmentData;

  if FSelectedScenario.FData.Scenario_Index = 0 then
  begin
    with FSelectedEnvironment do
    begin
      dmTTT.InsertEnvironmentDef(FData);

      FGlobal_Conv.Game_Enviro_Index := FData.Game_Enviro_Index;
      dmTTT.InsertGlobalConvergenceZone(FGlobal_Conv);
    end;

    with FSelectedResourceAllocation do
    begin
      FData.Game_Enviro_Index := FSelectedEnvironment.FData.Game_Enviro_Index;
      dmTTT.InsertResourceAllocationDef(FData);
    end;

    with FSelectedScenario do
    begin
      FData.Resource_Alloc_Index := FSelectedResourceAllocation.FData.Resource_Alloc_Index;

      if dmTTT.InsertScenarioDef(FData) then
      begin
        with FSelectedAssetDeployment.FData do
        begin
          Deployment_Identifier := '(Scenario ' + edtName.Text + ')';
          Scenario_Index := FData.Scenario_Index;
        end;

        dmTTT.InsertAssetDeployment(FSelectedAssetDeployment.FData);
      end;
    end;

  end
  else
  begin
    with FSelectedEnvironment do
    begin
      dmTTT.UpdateEnvironmentDef(FData);

      FGlobal_Conv.Game_Enviro_Index := FData.Game_Enviro_Index;
      dmTTT.UpdateGlobalConvergenceZone(FGlobal_Conv);
    end;

    with FSelectedResourceAllocation do
    begin
      dmTTT.UpdateResourceAllocationDef(FData);
    end;

    with FSelectedScenario do
    begin
      dmTTT.UpdateScenarioDef(FData)
    end;

    with FSelectedAssetDeployment.FData do
    begin
      Deployment_Identifier := '(Scenario ' + edtName.Text + ')';
      dmTTT.UpdateAssetDeployment(FSelectedAssetDeployment.FData);
    end;

  end;
end;

procedure TfrmSummaryScenario.SetGameAreaData;
begin
  with FSelectedEnvironment.FGameArea do
  begin
    Game_Area_Index := FSelectedGameArea.FData.Game_Area_Index;
    Game_Area_Identifier := FSelectedGameArea.FData.Game_Area_Identifier;
    Game_Centre_Lat := FSelectedGameArea.FData.Game_Centre_Lat;
    Game_Centre_Long := FSelectedGameArea.FData.Game_Centre_Long;
    Detail_Map := FSelectedGameArea.FData.Detail_Map;
  end;
end;

procedure TfrmSummaryScenario.SetResourceData;
begin
  with FSelectedResourceAllocation do
  begin
    FData.Game_Start_Time := FStartTime;
    FData.D_Day := FDDayTime;
  end;
end;

procedure TfrmSummaryScenario.SetSubEnvironmentData;
begin
  with FSelectedEnvironment.FData do
  begin

    {$REGION ' Above Water '}
    Wind_Direction := StrToFloat(edtWindDirection.Text);
    Wind_Speed  := StrToFloat(edtWindSpeed.Text);

    Daytime_Visual_Modifier := StrToFloat(edtDayVis.Text);
    Nighttime_Visual_Modifier := StrToFloat(edtNightVis.Text);

    Rain_Rate := StrToInt(edtRainRate.Text);
    {$ENDREGION}

    {$REGION ' Surface and Subsurface '}
    Ocean_Current_Direction := StrToFloat(edtOceanDirection.Text);
    Ocean_Current_Speed := StrToFloat(edtOceanSpeed.Text);

    Sea_State := StrToInt(edtSeaState.Text);
    {$ENDREGION}
  end;
end;

procedure TfrmSummaryScenario.ForceChoseClick(Sender: TObject);
begin
  if rbBlue.Checked then
  begin
    FSelectedForce := 3;

    btnVehicle.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnVehicle_Blue.PNG');
    btnBase.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnBase_Blue.PNG');
    btnOverlay.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnOverlay_Blue.PNG');
  end
  else
  begin
    FSelectedForce := 1;

    btnVehicle.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnVehicle_Red.PNG');
    btnBase.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnBase_Red.PNG');
    btnOverlay.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnOverlay_Red.PNG');
  end;
end;

procedure TfrmSummaryScenario.ForceChosePlatformClick(Sender: TObject);
begin
  if rbBluePlatform.Checked then
  begin
    FSelectedForce2 := 3;

    btnGroup.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnGroup_Blue.PNG');
  end
  else
  begin
    FSelectedForce2 := 1;

    btnGroup.Picture.LoadFromFile('data\Image DBEditor\Interface\Button\btnGroup_Red.PNG');
  end;
end;

procedure TfrmSummaryScenario.UpdatePage;
var
  filePath : string;
begin
  {$REGION ' Setting Tab '}
  filePath := 'data\Image DBEditor\Interface\Button\';

  case FTabpage of
    0:
    begin
      Img1Scenario.Picture.LoadFromFile(filePath  + 'ImgStep_Select.PNG');

      ImgDash1.Picture.LoadFromFile(filePath + 'ImgDash_Normal.PNG');
      Img2Environment.Picture.LoadFromFile(filePath + 'ImgStep_Normal.PNG');
      ImgDash2.Picture.LoadFromFile(filePath + 'ImgDash_Normal.PNG');
      Img3ResourceAllocation.Picture.LoadFromFile(filePath + 'ImgStep_Normal.PNG');
      ImgDash3.Picture.LoadFromFile(filePath + 'ImgDash_Normal.PNG');
      Img4Deployment.Picture.LoadFromFile(filePath + 'ImgStep_Normal.PNG');

      pnlTabScenario.BringToFront;
    end;
    1:
    begin
      Img1Scenario.Picture.LoadFromFile(filePath + 'ImgStep_Select.PNG');
      ImgDash1.Picture.LoadFromFile(filePath + 'ImgDash_Select.PNG');
      Img2Environment.Picture.LoadFromFile(filePath + 'ImgStep_Select.PNG');

      ImgDash2.Picture.LoadFromFile(filePath + 'ImgDash_Normal.PNG');
      Img3ResourceAllocation.Picture.LoadFromFile(filePath + 'ImgStep_Normal.PNG');
      ImgDash3.Picture.LoadFromFile(filePath + 'ImgDash_Normal.PNG');
      Img4Deployment.Picture.LoadFromFile(filePath + 'ImgStep_Normal.PNG');

      pnlTabEnvironment.BringToFront;
    end;
    2:
    begin
      SaveScenario;

      Img1Scenario.Picture.LoadFromFile(filePath + 'ImgStep_Select.PNG');
      ImgDash1.Picture.LoadFromFile(filePath + 'ImgDash_Select.PNG');
      Img2Environment.Picture.LoadFromFile(filePath + 'ImgStep_Select.PNG');
      ImgDash2.Picture.LoadFromFile(filePath + 'ImgDash_Select.PNG');
      Img3ResourceAllocation.Picture.LoadFromFile(filePath + 'ImgStep_Select.PNG');

      ImgDash3.Picture.LoadFromFile(filePath + 'ImgDash_Normal.PNG');
      Img4Deployment.Picture.LoadFromFile(filePath + 'ImgStep_Normal.PNG');

      pnlTabResource.BringToFront;
    end;
    3:
    begin
      Img1Scenario.Picture.LoadFromFile(filePath + 'ImgStep_Select.PNG');
      ImgDash1.Picture.LoadFromFile(filePath + 'ImgDash_Select.PNG');
      Img2Environment.Picture.LoadFromFile(filePath + 'ImgStep_Select.PNG');
      ImgDash2.Picture.LoadFromFile(filePath + 'ImgDash_Select.PNG');
      Img3ResourceAllocation.Picture.LoadFromFile(filePath + 'ImgStep_Select.PNG');
      ImgDash3.Picture.LoadFromFile(filePath + 'ImgDash_Select.PNG');
      Img4Deployment.Picture.LoadFromFile(filePath + 'ImgStep_Select.PNG');

      pnlTabDeployment.BringToFront;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Setting Button Prev-Next '}
  if FTabpage = 0 then
  begin
    ImgBtnNext.Visible := True;
    ImgBtnBack.Visible := True;
    ImgBtnBack.Picture.LoadFromFile(filePath + 'ImgBack_Disabled.PNG');
    ImgBtnBack.Enabled := False;
  end
  else
  begin
    ImgBtnNext.Visible := (FTabpage <> 3);

    ImgHome.Visible := (FTabpage <> 3);

    btnFinish.Visible := (FTabpage = 3);

    ImgBtnBack.Picture.LoadFromFile(filePath + 'ImgBack_Normal.PNG');
    ImgBtnBack.Enabled := True;
  end;
  {$ENDREGION}
end;

procedure TfrmSummaryScenario.UpdateScenario;
begin
  with FSelectedScenario do
  begin

    if FData.Scenario_Index = 0 then
    begin
      edtName.Text := '(Unnamed)';

      CreateEnvironment;
      CreateResourceAllocation;
    end
    else
    begin
      edtName.Text := FData.Scenario_Identifier;

      LastName := edtName.Text;

      dmTTT.GetResourceAllocationDef(FSelectedScenario.FData.Resource_Alloc_Index, FSelectedResourceAllocation);
      dmTTT.GetEnvironmentDef(FSelectedResourceAllocation.FData.Game_Enviro_Index, FSelectedEnvironment);
    end;

    UpdateResourceAllocation;
    UpdateEnvironment;
    UpdateGameAreaData;
  end;
end;

procedure TfrmSummaryScenario.UpdateResourceAllocation;
begin
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

procedure TfrmSummaryScenario.UpdateEnvironment;
begin
  with FSelectedEnvironment do
  begin

    {$REGION ' Above Water '}
    vwWindDirection.Position := round(FData.Wind_Direction);
    edtWindSpeed.Text := FormatFloat('0.00', FData.Wind_Speed);
    edtWindDirection.Text := FormatFloat('0', FData.Wind_Direction);

    trckbrDayVis.Position := Round(FData.Daytime_Visual_Modifier);
    trckbrNightVis.Position := Round(FData.Nighttime_Visual_Modifier);

    trckbrRainRate.Position := FData.Rain_Rate;
    {$ENDREGION}

    {$REGION ' Surface and Subsurface '}
    vwOceanDirection.Position := round(FData.Ocean_Current_Direction);
    edtOceanSpeed.Text := FormatFloat('0.00', FData.Ocean_Current_Speed);
    edtOceanDirection.Text := FormatFloat('0', FData.Ocean_Current_Direction);

    trckbrSeaState.Position := FData.Sea_State;
    {$ENDREGION}
  end;
end;

procedure TfrmSummaryScenario.UpdateGameAreaData;
begin
  dmTTT.GetGameAreaDef(FSelectedEnvironment.FData.Game_Area_Index, FSelectedGameArea);

  with FSelectedGameArea do
  begin
    if FData.Game_Area_Index = 0 then
    begin
      edtGameArea.Text := '(None)';
    end
    else
    begin
      edtGameArea.Text := FData.Game_Area_Identifier;
      SetGameAreaData;
    end;
  end;
end;

function TfrmSummaryScenario.CekInput: Boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtName.Text = '')then
  begin
    ShowMessage('Please insert class name');
    Exit;
  end;

  {Jika berisi spasi semua}
  if Copy(edtName.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtName.Text);
    numSpace := 0;

    for i := 1 to chkSpace do
    begin
      if edtName.Text[i] = #32 then
      numSpace := numSpace + 1;
    end;

    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  {Jika Class Name sudah ada}
  if (dmTTT.GetScenarioDef(edtName.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedScenario.FData.Scenario_Index = 0 then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end
    else if LastName <> edtName.Text then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  if FSelectedGameArea.FData.Game_Area_Index = 0 then
  begin
    ShowMessage('Select Game Area');
    Exit;
  end;

  Result := True;
end;

{$ENDREGION}

{$REGION ' Filter Input '}

function TfrmSummaryScenario.GetNumberOfKoma(s: string): Boolean;
var
  a, i : Integer;
begin
  Result := False;
  a := 0;

  for i := 1 to length(s) do
  begin
    if s[i] = '.' then
      a := a + 1;
  end;

  if a > 0 then
    Result := True;
end;

procedure TfrmSummaryScenario.edtNumeralKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetNumberOfKoma(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if Key = #13 then
  begin
    if TEdit(Sender).Text = '' then
      TEdit(Sender).Text := '0';

    value := StrToFloat(TEdit(Sender).Text);

    case TEdit(Sender).Tag of
      0: TEdit(Sender).Text := FormatFloat('0', value);
      1: TEdit(Sender).Text := FormatFloat('0.0', value);
      2: TEdit(Sender).Text := FormatFloat('0.00', value);
      3: TEdit(Sender).Text := FormatFloat('0.000', value);
    end;

//    btnApply.Enabled := True;
  end;
end;

procedure TfrmSummaryScenario.edtStateChange(Sender: TObject);
begin
  if TEdit(Sender).Text = '' then
    TEdit(Sender).Text := '0';

  if (StrToInt(TEdit(Sender).Text) > 6) then
    TEdit(Sender).Text := '6';

  if TEdit(Sender).Name = 'edtRainRate' then
    trckbrRainRate.Position := StrToInt(TEdit(Sender).Text)
  else if TEdit(Sender).Name = 'edtSeaState' then
    trckbrSeaState.Position := StrToInt(TEdit(Sender).Text);

end;

procedure TfrmSummaryScenario.edtVisualChange(Sender: TObject);
begin
  if TEdit(Sender).Text = '' then
    TEdit(Sender).Text := '0';

  if (StrToInt(TEdit(Sender).Text) > 100) then
    TEdit(Sender).Text := '100';

  if TEdit(Sender).Name = 'edtDayVis' then
    trckbrDayVis.Position := StrToInt(TEdit(Sender).Text)
  else if TEdit(Sender).Name = 'edtNightVis' then
    trckbrNightVis.Position := StrToInt(TEdit(Sender).Text);
end;

procedure TfrmSummaryScenario.vwDirectionChange(Sender: TObject);
var
  aVal : Integer;
begin
  if TVrWheel(Sender).Position < 180 then
    aVal := 180 + TVrWheel(Sender).Position
  else
    aVal := TVrWheel(Sender).Position - 180;

  if TVrWheel(Sender).Name = 'vwWindDirection' then
    edtWindDirection.Text := IntToStr(aVal)
  else if TVrWheel(Sender).Name = 'vwOceanDirection' then
    edtOceanDirection.Text := IntToStr(aVal);
end;

procedure TfrmSummaryScenario.edtDirectionChange(Sender: TObject);
var
  value : Integer;
begin
  if TEdit(Sender).Text = '' then
    TEdit(Sender).Text := '0';

  if (StrToInt(TEdit(Sender).Text) > 359) then
    TEdit(Sender).Text := '0';

  value := StrToInt(TEdit(Sender).Text);

  if value < 180 then
  begin
    value := Round(value + 180);
  end
  else
  begin
    value := Round(value - 180);
  end;

  if TEdit(Sender).Name = 'edtWindDirection' then
    vwWindDirection.Position := value
  else if TEdit(Sender).Name = 'edtOceanDirection' then
    vwOceanDirection.Position := value;

end;

procedure TfrmSummaryScenario.trckbrEnvironmentVisualChange(Sender: TObject);
begin
  case TTrackBar(Sender).Tag of
    0: {Daytime Visual}
    begin
      edtDayVis.Text := IntToStr(TTrackBar(Sender).Position);
    end;
    1: {Nighttime Visual}
    begin
      edtNightVis.Text := IntToStr(TTrackBar(Sender).Position);
    end;
  end;
end;

procedure TfrmSummaryScenario.trckbrEnvironmentStateChange(Sender: TObject);
begin
  case TTrackBar(Sender).Tag of
    0: {Rain Rate}
    begin
      edtRainRate.Text := IntToStr(TTrackBar(Sender).Position);
    end;
    1: {Rain Rate}
    begin
      edtSeaState.Text := IntToStr(TTrackBar(Sender).Position);
    end;
  end;
end;

procedure TfrmSummaryScenario.edtChange(Sender: TObject);
begin
//  btnApply.Enabled := True;
end;

procedure TfrmSummaryScenario.ValidationFormatInput;
var
  i: Integer;
  value : Double;

begin
  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then
    begin
      if TEdit(Components[i]).Tag = 4 then
        continue;

      if TEdit(Components[i]).Text = '' then
        TEdit(Components[i]).Text := '0';

      value := StrToFloat(TEdit(Components[i]).Text);

      case TEdit(Components[i]).Tag of
        0: TEdit(Components[i]).Text := FormatFloat('0', value);
        1: TEdit(Components[i]).Text := FormatFloat('0.0', value);
        2: TEdit(Components[i]).Text := FormatFloat('0.00', value);
        3: TEdit(Components[i]).Text := FormatFloat('0.000', value);
      end;
    end;
  end;
end;

{$ENDREGION}


end.
