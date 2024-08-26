unit ufLandTemp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uT3Unit, uDBAsset_Embark_Library, uT3Vehicle, uDataTypes;

type
  TfrmLandTemp = class(TForm)
    lvPlaformAvailable: TListView;
    btnOK: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure lvPlaformAvailableSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    OnDeckList   : TList;
    OnHullList   : TList;

    FControlledPlatform : TT3PlatformInstance;
    FSelectedPlatform : TT3PlatformInstance;

    function CheckPersonelCapability(MemberShip, HostShip : TT3Vehicle):Boolean;
    function CheckAirCapability(MemberShip, HostShip : TT3Vehicle):Boolean;
    function CheckAmphibhiousAndLandCapability(MemberShip, HostShip : TT3Vehicle):Boolean;
    function CheckMemberPosToRamp(MemberShip, HostShip : TT3Vehicle):Integer;

  public
    { Public declarations }

    property ControlledPlatform : TT3PlatformInstance read FControlledPlatform
      write FControlledPlatform;
    property HostPlatform : TT3PlatformInstance read FSelectedPlatform
      write FSelectedPlatform;
  end;

var
  frmLandTemp: TfrmLandTemp;

implementation

{$R *.dfm}
uses
  uSimMgr_Client, uGameData_TTT, uSimObjects, uBaseCoordSystem,
  tttData, ufTacticalDisplay, ufTransportEmbarkasi;

procedure TfrmLandTemp.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLandTemp.btnOKClick(Sender: TObject);
var
  I : Integer;

  CurrentSpaceAir  : Integer;
  CurrentSpaceHull : Double;
  CurrentSpacePersonel : Integer;

  CurrentWeightAir : Double;
  CurrentWeightHull : Double;
  CurrentWeightPersonel : Double;

  TotalCurrentWeight : Double;
  TotalMaxDayaAngkutWeight : Double;

  SisaDayaAngkutWeight  : Double;
  HostHullSpace : Double;

  RecTransport : TRecCmd_Transport;
  RecEmbark : TRec_EmbarkedPlatformData;
  tempTransport    : TT3Vehicle;

  tempRamp : TRamp;
  RampID, tempX, tempY,
  Width, Length,
  HostWidth, HostLength  : Integer;
  tempHeading : Single;
  tempRampPos: Integer;
  isHullShowTemp : Boolean;

  frmEmbark : TfrmTransportEmbarkasi;
begin

  {$REGION ' Pengecekan kapal yg diangkut '}
  if ControlledPlatform = nil then
  begin
    MessageDlg('Please re-controll The transported platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal pengangkut '}
  if HostPlatform = nil then
  begin
    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan Status kapal pengangkut '}
  if TT3Vehicle(HostPlatform).HostLoadState <> hlsReady  then
  begin
    MessageDlg('Host platform in loading process', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan daya angkut secara umum kapal pengangkut '}
  CurrentSpaceAir := 0;
  CurrentSpacePersonel := 0;
  CurrentSpaceHull := 0;

  CurrentWeightAir := 0;
  CurrentWeightHull := 0;
  CurrentWeightPersonel := 0;

  for i := 0 to TT3Vehicle(HostPlatform).MemberTransportList.Count - 1 do
  begin
    tempTransport := TT3Vehicle(HostPlatform).MemberTransportList.Items[i];

    if tempTransport.PlatformDomain = vhdAir then
    begin
      {$REGION ' Air Section '}
      CurrentSpaceAir  := CurrentSpaceAir + 1;
      CurrentWeightAir    := CurrentWeightAir + tempTransport.SumCurrentWeight;

      if TT3Vehicle(HostPlatform).UnitCapability.FData.Max_Hangar_Capacity < CurrentSpaceAir then
      begin
        MessageDlg('Already exceed maximum air space limit', mtInformation, [mbOK], 0);
        Exit
      end;
      {$ENDREGION}
    end
    else if (tempTransport.PlatformDomain =  vhdLand) and (tempTransport.PlatformCategory =  2) and (tempTransport.PlatformType =  0) then
    begin
      {$REGION ' Personel Section '}
      CurrentSpacePersonel  := CurrentSpacePersonel + tempTransport.VehicleDefinition.FData.Quantity_Group_Personal;
      CurrentWeightPersonel    := CurrentWeightPersonel + (tempTransport.VehicleDefinition.FData.Quantity_Group_Personal * 0.7);

      if TT3Vehicle(HostPlatform).UnitCapability.FData.Max_Personnel_Capacity < CurrentSpacePersonel then
      begin
        MessageDlg('Already exceed maximum Personnel space limit', mtInformation, [mbOK], 0);
        Exit
      end;
      {$ENDREGION}
    end
    else
    begin
      {$REGION ' Other Section '}
      CurrentSpaceHull   := CurrentSpaceHull + (tempTransport.UnitCapability.FData.Deck_Width * tempTransport.UnitCapability.FData.Deck_Length);
      CurrentWeightHull := CurrentWeightHull + tempTransport.SumCurrentWeight;
      HostHullSpace := (TT3Vehicle(HostPlatform).UnitCapability.FData.Deck_Width * TT3Vehicle(HostPlatform).UnitCapability.FData.Deck_Length);

      if  HostHullSpace < CurrentSpaceHull then
      begin
        MessageDlg('Already exceed maximum hull space limit', mtInformation, [mbOK], 0);
        Exit
      end;
      {$ENDREGION}
    end;
  end;

  TotalCurrentWeight := CurrentWeightAir + CurrentWeightHull + CurrentWeightPersonel;
  TotalMaxDayaAngkutWeight := TT3Vehicle(HostPlatform).UnitCapability.FData.Max_Hangar_Weight +
  TT3Vehicle(HostPlatform).UnitCapability.FData.Max_Deck_Weight + (TT3Vehicle(HostPlatform).UnitCapability.FData.Max_Personnel_Capacity * 0.7);

  SisaDayaAngkutWeight := TotalMaxDayaAngkutWeight - TotalCurrentWeight;

  if TT3Vehicle(ControlledPlatform).VehicleDefinition.FData.Weight > SisaDayaAngkutWeight then
  begin
    MessageDlg('Already exceed maximum weight limit', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan sesuai capability kapal pengangkut '}

  isHullShowTemp := False;
  case ControlledPlatform.PlatformDomain of

    {$REGION ' Jika yang diangkut air platform '}
    vhdAir:
    begin
      if not CheckAirCapability(TT3Vehicle(ControlledPlatform), TT3Vehicle(HostPlatform)) then
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
      if (ControlledPlatform.PlatformCategory =  2) and (ControlledPlatform.PlatformType =  0) then
      begin
        if not CheckPersonelCapability(TT3Vehicle(ControlledPlatform), TT3Vehicle(HostPlatform)) then
          Exit;
      end
      else
      begin
        if not CheckAmphibhiousAndLandCapability(TT3Vehicle(ControlledPlatform), TT3Vehicle(HostPlatform)) then
          Exit
        else
          isHullShowTemp := True;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Jika yang diangkut Amphibious platform '}
    vhdAmphibious:
    begin
      if not CheckAmphibhiousAndLandCapability(TT3Vehicle(ControlledPlatform), TT3Vehicle(HostPlatform)) then
        Exit
      else
        isHullShowTemp := True;
    end;
    {$ENDREGION}

  end;

  {$ENDREGION}

  {$REGION ' Set platform state and position based on ramp '}
  RampID := CheckMemberPosToRamp(TT3Vehicle(ControlledPlatform), TT3Vehicle(HostPlatform));

  HostWidth := Trunc(TT3Vehicle(HostPlatform).UnitCapability.Fdata.Deck_Width * 5);
  HostLength := Trunc(TT3Vehicle(HostPlatform).UnitCapability.Fdata.Deck_Length * 5);
  Width := Trunc(TT3Vehicle(ControlledPlatform).VehicleDefinition.FData.Width * 5);
  Length := Trunc(TT3Vehicle(ControlledPlatform).VehicleDefinition.FData.Length * 5);
  tempRamp := TT3Vehicle(HostPlatform).RampList[0];

  case RampID of
    0: {Depan}
    begin
      tempX := HostLength - (Length div 2) - 10;
      tempY := HostWidth div 2;
      tempHeading := 270;
      tempRampPos:= 0;
    end;
    1: {Kanan}
    begin
      tempHeading := 0;
      tempRampPos:= 1;
      if tempRamp.Available then
      begin
        tempX := 95;
        tempY := HostWidth - (Length div 2) - 10;
      end
      else
      begin
        tempX := HostLength - 95;
        tempY := HostWidth - (Length div 2) - 10;
      end;
    end;
    2: {Belakang}
    begin
      tempX := (Length div 2) + 10;
      tempY := HostWidth div 2;
      tempHeading := 90;
      tempRampPos:= 2;
    end;
    3: {Kiri}
    begin
      tempHeading := 180;
      tempRampPos:= 3;
      if tempRamp.Available then
      begin
        tempX := 95;
        tempY := (Length div 2) + 10;
      end
      else
      begin
        tempX := HostLength - 95;
        tempY := (Length div 2) + 10;
      end;
    end;
  end;

//  TT3Vehicle(ControlledPlatform).MemberPosDisembark := tempRampPos;
//  TT3Vehicle(ControlledPlatform).StateTransport := True;
//  TT3Vehicle(HostPlatform).HostLoadState := hlsLoading;

  {$ENDREGION}

  {$REGION ' Mengirim Paket Embarkasi'}
  RecTransport.OrderID := CORD_ID_embark;
  RecTransport.HostPlatformID := HostPlatform.InstanceIndex;
  RecTransport.MemberPlatformID := ControlledPlatform.InstanceIndex;

  RecTransport.MemberPlatformName := ControlledPlatform.InstanceName;
  RecTransport.TrackID := TT3Vehicle(ControlledPlatform).Track_ID;
  RecTransport.StateTransport := True;

  simMgrClient.netSend_CmdTransport(RecTransport);
  {$ENDREGION}

  {$REGION ' Proses tambahan untuk kapal yg ditempatkan di Hull '}
  if isHullShowTemp then
  begin

    {$REGION 'Mengirim Paket Embarked Platform'}
    RecEmbark.OrderID := CORD_ID_SETHEADING;
    RecEmbark.HostShipID := HostPlatform.InstanceIndex;
    RecEmbark.MemberShipID := ControlledPlatform.InstanceIndex;
//    RecEmbark.MemberLoadState := mlsQueue;
    RecEmbark.Heading := tempHeading;
//    RecEmbark.Speed := 0;
//    RecEmbark.StateTransport := True;
    RecEmbark.PosX := tempX;
    RecEmbark.PosY := tempY;
    RecEmbark.IsEmbarkArea := False;
//    RecEmbark.IsTurnTable := False;
//    RecEmbark.IsCollision := False;

    simMgrClient.netSend_EmbarkedPlatformData(RecEmbark);
    {$ENDREGION}

    {$REGION 'Membuka form embarkasi'}
//    frmEmbark := TfrmTransportEmbarkasi.Create(Self);
//    try
//      frmEmbark.HostShipID := HostPlatform.InstanceIndex;
//      frmEmbark.MemberShipID := ControlledPlatform.InstanceIndex;
//
//      frmEmbark.ShowModal;
//
//    finally
//      frmEmbark.Free;
//    end;
    {$ENDREGION}

  end;
  {$ENDREGION}

  Close;
end;

function TfrmLandTemp.CheckPersonelCapability(MemberShip, HostShip : TT3Vehicle): Boolean;
var
  FreeCapacity     : Integer;

begin
  Result := False;

  {$REGION ' Pengecekan kemampuan mengangkut personel '}
  if TT3Vehicle(HostShip).UnitCapability.FData.Personnel_Unit_Carried = False then
  begin
    MessageDlg('Embarkation capability is not support for personel', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapasitas maksimal personel carried '}
//  FreeCapacity := 0;
//  FreeCapacity := TT3Vehicle(HostShip).UnitCapability.FData.Max_Personnel_Capacity - TT3Vehicle(HostShip).CurrentPersonelCapacity;
//
//  if FreeCapacity < TT3Vehicle(MemberShip).CurrentPersonelCapacity  then
//  begin
//    MessageDlg('There is not enough space ', mtInformation, [mbOK], 0);
//    Exit;
//  end;
  {$ENDREGION}

  Result  := True;
end;

function TfrmLandTemp.CheckAirCapability(MemberShip, HostShip : TT3Vehicle): Boolean;
begin
  Result := False;

  {$REGION ' Pengecekan kemampuan mengangkut air platform '}
  if not TT3Vehicle(HostShip).UnitCapability.FData.Hangar_Unit_Carried then
  begin
    MessageDlg('Host Platform is not support for this vehicle', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kemampuan mengangkut sesuai tipe '}
  case MemberShip.PlatformType of

    {$REGION ' Pengecekan kemampuan mengangkut fixed wing '}
    0:
    begin
      if TT3Vehicle(HostShip).UnitCapability.FData.FixedWing_Carried = False then
      begin
        MessageDlg('Embarkation capability is not support for fixed wing', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Pengecekan kemampuan mengangkut heli '}
    1:
    begin
      if TT3Vehicle(HostShip).UnitCapability.FData.Rotary_Carried = False then
      begin
        MessageDlg('Embarkation capability is not support for rotary', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    {$ENDREGION}

  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapasitas maksimal air carried '}
//  if TT3Vehicle(HostShip).CurrentHanggarCapacity >  then
//  begin
//    MessageDlg('Already exceed maximum air capacity', mtInformation, [mbOK], 0);
//    Exit;
//  end;
  {$ENDREGION}

  Result  := True;
end;

function TfrmLandTemp.CheckAmphibhiousAndLandCapability(MemberShip, HostShip: TT3Vehicle): Boolean;
var
  rampID : Integer;
  tempUsedSpace  : Double;
  tempBearing : Double;
  tempLenghtShip, tempWidthShip : Double;
  tempPosRamp : Double;
  tempPosRampAkhir : Double;

  tempRampFront, tempRampBack,
  tempRampPort, tempRampStarboard : t2DPoint;

  tempDistance : Double;
  tempDistanceRamptoMemberShip : Double;

  {HostShipPos,} MemberShipPos: t2DPoint;

  tempRamp : TRamp;

begin
  Result := False;

  {$REGION ' Pengecekan kemampuan mengangkut Amphibious/ Land platform '}
  if not TT3Vehicle(HostShip).UnitCapability.FData.Deck_Unit_Carried then
  begin
    MessageDlg('Host Platform is not support for this vehicle', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan Rampa '}

  rampID := CheckMemberPosToRamp(MemberShip, HostShip);

  rampIDSpawn := rampID;

  if rampID = -1 then
  begin
    MessageDlg('Platform is not in suitable ramp', mtInformation, [mbOK], 0);
    Exit;
  end;

  tempRamp := TT3Vehicle(HostShip).RampList[rampID];

  case rampID of
    0: {Depan}
    begin
      if not tempRamp.State then
      begin
        MessageDlg('Please open front ramp first', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    1: {Kanan}
    begin
      if not tempRamp.State then
      begin
        MessageDlg('Please open starboard ramp first', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    2: {Belakang}
    begin
      if not tempRamp.State then
      begin
        MessageDlg('Please open back ramp first', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    3: {Kiri}
    begin
      if not tempRamp.State then
      begin
        MessageDlg('Please open port ramp first', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapasitas maksimal Amphibious and Land Carried '}
  tempUsedSpace := 0;
  tempUsedSpace := TT3Vehicle(ControlledPlatform).UnitCapability.FData.Deck_Length * TT3Vehicle(ControlledPlatform).UnitCapability.FData.Deck_Width;
  if TT3Vehicle(HostPlatform).CurrentHullSpace < tempUsedSpace then
  begin
    MessageDlg('There is not enough space ', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  Result := True;

end;

function TfrmLandTemp.CheckMemberPosToRamp(MemberShip, HostShip: TT3Vehicle): Integer;
var
  i : Integer;

  tempRamp : TRamp;
  tempLenghtShip : Double;
  tempWidthShip : Double;

  tempAngleRamp : Double;
  tempDistance : Double;
  distanceMemberShipToRamp : Double;
  bearingMemberShipToRamp : Double;

  tempPosHost : t2DPoint;
  tempPosMember : t2DPoint;
  tempPosRamp : t2DPoint;

begin
  Result := -1;

  tempPosHost.X := HostShip.PosX;
  tempPosHost.Y := HostShip.PosY;
  tempPosMember.X := MemberShip.PosX;
  tempPosMember.Y := MemberShip.PosY;

  tempLenghtShip := (HostShip.VehicleDefinition.FData.Length / C_NauticalMile_To_Feet)/2;
  tempWidthShip := (HostShip.VehicleDefinition.FData.Width / C_NauticalMile_To_Feet)/2;

  tempDistance := CalcRange(HostShip.PosX, HostShip.PosY, MemberShip.PosX, MemberShip.PosY);

  if HostShip.cekCollision then
  begin
    {$REGION ' Platform sudah didalam '}
    if TT3Vehicle(HostShip.TrackCollision).InstanceIndex = MemberShip.InstanceIndex then
    begin
      for i := 0 to 3 do
      begin
        tempRamp := HostShip.RampList[i];

        if tempRamp.State then
        begin
          Result := i;
          Break;
        end;
      end;
    end;
    {$ENDREGION}
  end
  else
  begin
    {$REGION ' Platform masih di luar '}
    for i := 0 to 3 do
    begin
      tempRamp := HostShip.RampList[i];

      if not tempRamp.Available then
        Continue;

      case i of
        0: {Depan}
        begin
          tempAngleRamp := ValidateDegree(HostShip.Course);
          FindPoint(tempPosHost, tempPosRamp, tempLenghtShip, tempAngleRamp);
        end;
        1: {Kanan}
        begin
          tempAngleRamp := ValidateDegree(HostShip.Course + 90);
          FindPoint(tempPosHost, tempPosRamp, tempWidthShip, tempAngleRamp);
        end;
        2: {Belakang}
        begin
          tempAngleRamp := ValidateDegree(HostShip.Course + 180);
          FindPoint(tempPosHost, tempPosRamp, tempLenghtShip, tempAngleRamp);
        end;
        3: {Kiri}
        begin
          tempAngleRamp := ValidateDegree(HostShip.Course + 270);
          FindPoint(tempPosHost, tempPosRamp, tempWidthShip, tempAngleRamp);
        end;
      end;

      if not ptToCircle(tempPosRamp, tempPosMember, tempLenghtShip ) then
        Continue;

      distanceMemberShipToRamp := CalcRange(tempPosMember.X, tempPosMember.Y, tempPosRamp.X, tempPosRamp.Y);
      if tempDistance < distanceMemberShipToRamp then
        Continue;

      tempDistance := distanceMemberShipToRamp;

      Result := i;
    end;
    {$ENDREGION}
  end;

end;

procedure TfrmLandTemp.FormCreate(Sender: TObject);
begin
  OnDeckList  := TList.Create;
  OnHullList  := TList.Create;
end;

procedure TfrmLandTemp.FormShow(Sender: TObject);
var
  li : TListItem;

  i,j     : Integer;
  _Range  : Double;
  _Platform : TT3PlatformInstance;

begin
  if not Assigned(ControlledPlatform) then
    Exit;

  if ControlledPlatform is TT3Vehicle then
  begin
    lvPlaformAvailable.Clear;

    with simMgrClient do
    begin
      for i := 0 to SimPlatforms.itemCount - 1 do
      begin
        _Platform := TT3PlatformInstance(SimPlatforms.getObject(i));

        if not(Assigned(_Platform)) then
          Continue;

        if not(_Platform is TT3Vehicle) then
          Continue;

        if _Platform.FreeMe then
          Continue;

        if ControlledPlatform.Equals(_Platform) then
          Continue;

        {Cek kapal-kapal yg satu force}
        if _Platform.Force_Designation <> TT3PlatformInstance(TT3Vehicle(ControlledPlatform)).Force_Designation then
          Continue;

        if TT3Vehicle(_Platform).StateTransport then
          Continue;

        {Cek kapal-kapal terdekat yg bisa dituju; jarak maks sesuai panjang kapal yg dituju nm}
        _Range := CalcRange(TT3Vehicle(ControlledPlatform).PosX, TT3Vehicle(ControlledPlatform).PosY, _Platform.PosX, _Platform.PosY);
        if _Range > (TT3Vehicle(_Platform).VehicleDefinition.FData.Length / C_NauticalMile_To_Feet) then
          Continue;

        li := lvPlaformAvailable.Items.Add;
        li.Caption := _Platform.InstanceName;
        li.SubItems.Add('');
        li.Data := _Platform;
      end;
    end;
  end;
end;

procedure TfrmLandTemp.lvPlaformAvailableSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  HostPlatform := nil;

  if Selected then
  begin
    HostPlatform := Item.Data;
    btnOK.Enabled := True;
  end
  else
  begin
    btnOK.Enabled := False;
  end;
end;

end.
