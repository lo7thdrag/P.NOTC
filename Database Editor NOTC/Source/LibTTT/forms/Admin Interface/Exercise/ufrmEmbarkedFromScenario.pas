unit ufrmEmbarkedFromScenario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject, newClassASTT, uDBAsset_Vehicle,
  Vcl.Imaging.pngimage, uSimContainers, uDBAsset_Deploy, uBaseCoordSystem;

type
  TfrmEmbarkedFromScenario = class(TForm)
    lbAllVehicleOnBoard: TListBox;
    lbAllVehicleDef: TListBox;
    btnAdd: TImage;
    btnClose: TImage;
    btnRemove: TImage;
    ImgBackgroundAvailable: TImage;
    ImgBackgroundForm: TImage;
    ImgBackgroundOnBoard: TImage;
    ImgHeaderAvailable: TImage;
    ImgHeaderOnBoard: TImage;
    Label1: TLabel;
    Label2: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbAllVehicleDefClick(Sender: TObject);
    procedure lbAlVehicleOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
                                       procedure btnEditClick(Sender: TObject);

  private
    FPlatformInstance : TPlatform_Instance;
    FAssetDeployment : TAsset_Deployment;
    FResourceAlloc : TResource_Allocation;

    FCurrentSpaceAir  : Integer;
    FCurrentSpaceHull : Double;
    FCurrentSpacePersonel : Integer;

    FCurrentWeightAir : Double;
    FCurrentWeightHull : Double;
    FCurrentWeightPersonel : Double;

    FTotalCurrentWeight : Double;
    FTotalMaxDayaAngkutWeight : Double;

    FSisaDayaAngkut  : Double;
    FSisaSpaceHull : Double;
    FSisaSpaceAir  : Integer;
    FSisaSpacePersonel : Integer;

    MemberPI : TPlatform_Instance;
    MemberPIOnBoard : TPlatform_Instance;

    FAllVehicleDefList : TList;
    FAllVehicleOnBoardList : TList;

    function CheckAirCapability(MemberShip, HostShip : TPlatform_Instance):Boolean;
    function CheckAmphibhiousAndLandCapability(MemberShip, HostShip : TPlatform_Instance):Boolean;
    function CheckPersonelCapability(MemberShip, HostShip : TPlatform_Instance):Boolean;

    procedure SetDataDayaAngkut(pi : TPlatform_Instance);
    procedure UpdateVehicleList;

  public
    HostID : Integer;

    property AssetDeployment : TAsset_Deployment read FAssetDeployment write FAssetDeployment;
    property ResourceAlloc : TResource_Allocation read FResourceAlloc write FResourceAlloc;
    property PlatformInstance : TPlatform_Instance read FPlatformInstance write FPlatformInstance;

  end;

var
  frmEmbarkedFromScenario: TfrmEmbarkedFromScenario;

implementation

uses
  uDataModuleTTT, uFrmHullView, tttData;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmEmbarkedFromScenario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllVehicleDefList);
  FreeItemsAndFreeList(FAllVehicleOnBoardList);
  Action := cafree;
end;

procedure TfrmEmbarkedFromScenario.FormCreate(Sender: TObject);
begin
  FAllVehicleDefList := TList.Create;
  FAllVehicleOnBoardList := TList.Create;
end;

procedure TfrmEmbarkedFromScenario.FormShow(Sender: TObject);
begin
  FTotalMaxDayaAngkutWeight := FPlatformInstance.Transport.FData.Max_Hangar_Weight + FPlatformInstance.Transport.FData.Max_Deck_Weight
  + (FPlatformInstance.Transport.FData.Max_Personnel_Capacity * 0.7);

  FSisaDayaAngkut :=  FTotalMaxDayaAngkutWeight;
  FSisaSpaceHull := FPlatformInstance.Transport.FData.Deck_Width;
  FSisaSpaceAir := FPlatformInstance.Transport.FData.Max_Hangar_Capacity;
  FSisaSpacePersonel := FPlatformInstance.Transport.FData.Max_Personnel_Capacity;

  UpdateVehicleList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmEmbarkedFromScenario.btnAddClick(Sender: TObject);
var
  isHullShowTemp : Boolean;

begin
  isHullShowTemp := False;

  if lbAllVehicleDef.ItemIndex = -1 then
    Exit;

  if MemberPI.Vehicle.FData.DWT > FSisaDayaAngkut then
  begin
    MessageDlg('Already exceed maximum weight limit', mtInformation, [mbOK], 0);
    Exit;
  end;

  case MemberPI.Vehicle.FData.Platform_Domain of

    {$REGION ' Jika yang diangkut air platform '}
    vhdAir:
    begin
      if not CheckAirCapability(MemberPI, FPlatformInstance) then
        Exit;
    end;
    {$ENDREGION}

    {$REGION ' Jika yang diangkut Surface dan Subsurface platform '}
    vhdSurface, vhdSubsurface:
    begin

    end;
    {$ENDREGION}

    {$REGION ' Jika yang diangkut Land platform '}
    vhdLand:
    begin
      if (MemberPI.Vehicle.FData.Platform_Category =  2) and (MemberPI.Vehicle.FData.Platform_Type =  0) then
      begin
        if not CheckPersonelCapability(MemberPI, FPlatformInstance) then
          Exit;
      end
      else
      begin
        if not CheckAmphibhiousAndLandCapability(MemberPI, FPlatformInstance) then
          Exit
        else
          isHullShowTemp := True;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Jika yang diangkut Amphibious platform '}
    vhdAmphibious:
    begin
      if not CheckAmphibhiousAndLandCapability(MemberPI, FPlatformInstance) then
        Exit
      else
          isHullShowTemp := True;
    end;
    {$ENDREGION}
  end;

  with MemberPI do
  begin
    FActivation.Deployment_Index := AssetDeployment.FData.Deployment_Index;
    FActivation.Platform_Instance_Index := MemberPI.FData.Platform_Instance_Index;

    FActivation.Init_Position_Latitude := FPlatformInstance.FActivation.Init_Position_Latitude;
    FActivation.Init_Position_Longitude := FPlatformInstance.FActivation.Init_Position_Longitude;
    FActivation.Init_Position_Cartesian_X := FPlatformInstance.FActivation.Init_Position_Cartesian_X;
    FActivation.Init_Position_Cartesian_Y := FPlatformInstance.FActivation.Init_Position_Cartesian_Y;

    FActivation.Init_Altitude := 0;
    FActivation.Init_Ground_Speed := 0;
    FActivation.Init_Course := 0;

    if Motion.FData.Endurance_Type <> 0 then
      FActivation.Init_Fuel := 0
    else
      FActivation.Init_Fuel := Motion.FData.Max_Fuel_Capacity;

    FActivation.Init_Lubricants := Logistic.FData.Max_Lubricants_Capacity;
    FActivation.Init_Freshwater := Logistic.FData.Max_Water_Capacity;
    FActivation.Init_Water := Logistic.FData.Max_Freshwater_Capacity;
    FActivation.Init_Food := Logistic.FData.Max_Ration_Capacity;
    FActivation.Host_ID := FPlatformInstance.FData.Platform_Instance_Index;
    FActivation.State_Transport := True;

    if FActivation.Platform_Event_Index = 0 then
      dmTTT.InsertPlatformActivation(FActivation)
    else
      dmTTT.UpdatePlatformActivation(FActivation);

    if isHullShowTemp then
    begin
//      frmHullView := TfrmHullView.Create(Self);
//      try
//        with frmHullView do
//        begin
//          HostShip := FPlatformInstance;
//          Deployment := FAssetDeployment;
//          Resource := FResourceAlloc;
//          ShowModal;
//        end;
//      finally
        frmHullView.Free;
      end;
    end;
     UpdateVehicleList;
  end;


procedure TfrmEmbarkedFromScenario.btnRemoveClick(Sender: TObject);
begin
  if lbAllVehicleOnBoard.ItemIndex = -1 then
    Exit;

  with MemberPIOnBoard do
  begin
    FActivation.Deployment_Index := AssetDeployment.FData.Deployment_Index;
    FActivation.Platform_Instance_Index := MemberPIOnBoard.FData.Platform_Instance_Index;

    FActivation.Host_ID := 0;
    FActivation.State_Transport := False;
    FActivation.Circle_X := 0;
    FActivation.Circle_Y := 0;
    FActivation.Init_Helm_Angle := 0;

    dmTTT.UpdatePlatformActivation(FActivation);
  end;

  UpdateVehicleList;
end;

function TfrmEmbarkedFromScenario.CheckAirCapability(MemberShip, HostShip: TPlatform_Instance): Boolean;
begin
  Result := False;

  {$REGION ' Pengecekan kemampuan mengangkut air platform '}
  if not HostShip.Transport.FData.Hangar_Unit_Carried then
  begin
    MessageDlg('Host Platform is not support for this vehicle', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kemampuan mengangkut sesuai tipe '}
  case MemberShip.Vehicle.FData.Platform_Type of

    {$REGION ' Pengecekan kemampuan mengangkut fixed wing '}
    0:
    begin
      if HostShip.Transport.FData.FixedWing_Carried = False then
      begin
        MessageDlg('Embarkation capability is not support for fixed wing', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Pengecekan kemampuan mengangkut heli '}
    1:
    begin
      if HostShip.Transport.FData.Rotary_Carried = False then
      begin
        MessageDlg('Embarkation capability is not support for rotary', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    {$ENDREGION}

  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapasitas maksimal air carried '}
//  if FCurrentSpaceAir < 1 then
//  begin
//    MessageDlg('Already exceed maximum air capacity', mtInformation, [mbOK], 0);
//    Exit;
//  end;
  {$ENDREGION}

  Result  := True;
end;

function TfrmEmbarkedFromScenario.CheckAmphibhiousAndLandCapability(MemberShip, HostShip: TPlatform_Instance): Boolean;
var
  tempUsedSpace : Double;

begin
  Result := False;

  {$REGION ' Pengecekan kemampuan mengangkut Amphibious/ Land/ Surface platform '}
  if not HostShip.Transport.FData.Deck_Unit_Carried then
  begin
    MessageDlg('Host Platform is not support for this vehicle', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapasitas maksimal Amphibious and Land Carried '}
  tempUsedSpace := 0;
  tempUsedSpace := (MemberShip.Vehicle.FData.Length * C_Feet_To_Meter) * (MemberShip.Vehicle.FData.Width * C_Feet_To_Meter);
  if FSisaSpaceHull < tempUsedSpace then
  begin
    MessageDlg('There is not enough space ', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  Result := True;
end;

function TfrmEmbarkedFromScenario.CheckPersonelCapability(MemberShip, HostShip: TPlatform_Instance): Boolean;
begin
  Result := False;

  {$REGION ' Pengecekan kemampuan mengangkut personel '}
  if HostShip.Transport.FData.Personnel_Unit_Carried = False then
  begin
    MessageDlg('Embarkation capability is not support for personel', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapasitas maksimal personel carried '}
  if FSisaSpacePersonel < MemberShip.Vehicle.FData.Quantity_Group_Personal  then
  begin
    MessageDlg('There is not enough space ', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  Result  := True;
end;

procedure TfrmEmbarkedFromScenario.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmbarkedFromScenario.btnEditClick(Sender: TObject);
begin
  frmHullView := TfrmHullView.Create(Self);
  try
    with frmHullView do
    begin
      HostShip := FPlatformInstance;
      Deployment := FAssetDeployment;
      Resource := FResourceAlloc;
      ShowModal;
    end;
  finally
    frmHullView.Free;
  end;
  Exit;
end;

procedure TfrmEmbarkedFromScenario.lbAllVehicleDefClick(Sender: TObject);
begin
  if lbAllVehicleDef.ItemIndex = -1 then
    Exit;

  MemberPI := TPlatform_Instance(lbAllVehicleDef.Items.Objects[lbAllVehicleDef.ItemIndex]);
end;

procedure TfrmEmbarkedFromScenario.lbAlVehicleOnBoardClick(Sender: TObject);
begin
  if lbAllVehicleOnBoard.ItemIndex = -1 then
    Exit;

  MemberPIOnBoard := TPlatform_Instance(lbAllVehicleOnBoard.Items.Objects[lbAllVehicleOnBoard.ItemIndex]);
end;

procedure TfrmEmbarkedFromScenario.SetDataDayaAngkut(pi : TPlatform_Instance);
begin
  if pi.Vehicle.FData.Platform_Domain = vhdAir then
  begin
    {$REGION ' Air Section '}
    FCurrentSpaceAir  := FCurrentSpaceAir + 1;
    FCurrentWeightAir := FCurrentWeightAir + pi.Vehicle.FData.DWT;
    {$ENDREGION}
  end
  else if (pi.Vehicle.FData.Platform_Domain =  vhdLand) and (pi.Vehicle.FData.Platform_Category =  2) and (pi.Vehicle.FData.Platform_Type =  0) then
  begin
    {$REGION ' Personel Section '}
    FCurrentSpacePersonel  := FCurrentSpacePersonel + pi.Vehicle.FData.Quantity_Group_Personal;
    FCurrentWeightPersonel    := FCurrentWeightPersonel + (pi.Vehicle.FData.Quantity_Group_Personal * 0.7);
    {$ENDREGION}
  end
  else
  begin
    {$REGION ' Other Section '}
    FCurrentSpaceHull   := FCurrentSpaceHull + ((pi.Vehicle.FData.Width * C_Feet_To_Meter) * (pi.Vehicle.FData.Length * C_Feet_To_Meter));
    FCurrentWeightHull := FCurrentWeightHull + pi.Vehicle.FData.DWT;
    {$ENDREGION}
  end;

  FTotalCurrentWeight := FCurrentWeightAir + FCurrentWeightHull + FCurrentWeightPersonel;
  FTotalMaxDayaAngkutWeight := FPlatformInstance.Transport.FData.Max_Hangar_Weight + FPlatformInstance.Transport.FData.Max_Deck_Weight
  + (FPlatformInstance.Transport.FData.Max_Personnel_Capacity * 0.7);

  FSisaDayaAngkut := FTotalMaxDayaAngkutWeight - FTotalCurrentWeight;
  FSisaSpaceHull := FPlatformInstance.Transport.FData.Deck_Width - FCurrentSpaceHull;
  FSisaSpaceAir := FPlatformInstance.Transport.FData.Max_Hangar_Capacity - FCurrentSpaceAir;
  FSisaSpacePersonel := FPlatformInstance.Transport.FData.Max_Personnel_Capacity - FCurrentSpacePersonel;
end;

procedure TfrmEmbarkedFromScenario.UpdateVehicleList;
var
  i : Integer;
  tempPI : TPlatform_Instance;

begin
  lbAllVehicleDef.Items.Clear;
  lbAllVehicleOnBoard.Items.Clear;

  FCurrentSpaceAir := 0;
  FCurrentSpacePersonel := 0;

  FCurrentWeightAir := 0;
  FCurrentWeightHull := 0;
  FCurrentWeightPersonel := 0;

  dmTTT.GetPlatformInstance(FResourceAlloc.FData.Resource_Alloc_Index,-1, -1, FAllVehicleDefList);

  for i := 0 to FAllVehicleDefList.Count - 1 do
  begin
    tempPI := FAllVehicleDefList.Items[i];

    if tempPI.FData.Platform_Type = 1 then
    begin
      dmTTT.GetVehicleDef(tempPI.FData.Vehicle_Index, tempPI.Vehicle);
      dmTTT.GetMotion_Characteristics(tempPI.Vehicle.FData.Motion_Characteristics, tempPI.Motion);
      dmTTT.GetLogisticDef(tempPI.Vehicle.FData.Logistics_Index, tempPI.Logistic);
      dmTTT.GetTransportDef(tempPI.Vehicle.FData.Platform_Capability_Index, tempPI.Transport);
      dmTTT.GetPlatformActivation(FAssetDeployment.FData.Deployment_Index, tempPI.FData.Platform_Instance_Index, tempPI.FActivation);
    end;

    if tempPI.FData.Platform_Instance_Index = FPlatformInstance.FData.Platform_Instance_Index then
      Continue;

    if tempPI.FActivation.State_Transport then
    begin
      if tempPI.FActivation.Host_ID = FPlatformInstance.FData.Platform_Instance_Index then
      begin
        lbAllVehicleOnBoard.Items.AddObject(tempPI.FData.Instance_Name,tempPI);
        SetDataDayaAngkut(tempPI);
      end
      else
        Continue;
    end
    else
    begin
      if tempPI.Transport.FData.Carriable then
        lbAllVehicleDef.Items.AddObject(tempPI.FData.Instance_Name, tempPI);
    end;
  end;

end;

{$ENDREGION}

end.
