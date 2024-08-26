unit ufmDisembarkWith;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, uT3Unit, uDBAsset_Embark_Library, uT3Vehicle, uDataTypes;

type
  TfmDisembarkWith = class(TForm)
    lvDisembarkWithPf: TListView;
    pnlDisembarkWithPf: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvDisembarkWithPfSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
    OnDeckList   : TList;
    OnHullList   : TList;

    FOldHostPlatform : TT3PlatformInstance;
    FMemberPlatform : TT3PlatformInstance;
    FSelectedPlatform : TT3PlatformInstance;

    function CheckPersonelCapability(MemberShip, HostShip : TT3Vehicle):Boolean;
    function CheckAmphibhiousAndLandCapability(MemberShip, HostShip : TT3Vehicle):Boolean;
    function CheckMemberPosToRamp(MemberShip, HostShip : TT3Vehicle):Integer;
  public
    { Public declarations }
    property OldHostPlatform : TT3PlatformInstance read FOldHostPlatform write FOldHostPlatform;
    property MemberPlatform : TT3PlatformInstance read FMemberPlatform write FMemberPlatform;
    property NewHostPlatform : TT3PlatformInstance read FSelectedPlatform write FSelectedPlatform;
  end;

var
  fmDisembarkWith: TfmDisembarkWith;

implementation

{$R *.dfm}
uses
  uSimMgr_Client, uGameData_TTT, uSimObjects, uBaseCoordSystem,
  tttData, ufTacticalDisplay, ufTransportEmbarkasi;

procedure TfmDisembarkWith.btnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TfmDisembarkWith.btnOkClick(Sender: TObject);
var
  I : Integer;

  CurrentSpaceHull : Double;
  CurrentSpacePersonel : Integer;

  CurrentWeightHull : Double;
  CurrentWeightPersonel : Double;

  TotalCurrentWeight : Double;
  TotalMaxDayaAngkutWeight : Double;

  SisaDayaAngkut  : Double;

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
  if OldHostPlatform = nil then
  begin
    MessageDlg('Please re-controll The transported platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan kapal pengangkut '}
  if NewHostPlatform = nil then
  begin
    MessageDlg('Please re-select The transport platfrom', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan Status kapal pengangkut '}
  if TT3Vehicle(NewHostPlatform).HostLoadState <> hlsReady  then
  begin
    MessageDlg('Host platform in loading process', mtInformation, [mbOK], 0);
    Exit
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan daya angkut secara umum kapal pengangkut '}
  CurrentSpacePersonel := 0;

  CurrentWeightHull := 0;
  CurrentWeightPersonel := 0;

  for i := 0 to TT3Vehicle(NewHostPlatform).MemberTransportList.Count - 1 do
  begin
    tempTransport := TT3Vehicle(NewHostPlatform).MemberTransportList.Items[i];

    if (tempTransport.PlatformDomain =  vhdLand) and (tempTransport.PlatformCategory =  2) and (tempTransport.PlatformType =  0) then
    begin
      {$REGION ' Personel Section '}
      CurrentSpacePersonel  := CurrentSpacePersonel + tempTransport.VehicleDefinition.FData.Quantity_Group_Personal;
      CurrentWeightPersonel    := CurrentWeightPersonel + (tempTransport.VehicleDefinition.FData.Quantity_Group_Personal * 0.7);
      {$ENDREGION}
    end
    else
    begin
      {$REGION ' Other Section '}
      CurrentSpaceHull   := CurrentSpaceHull + (tempTransport.UnitCapability.FData.Deck_Width * tempTransport.UnitCapability.FData.Deck_Length);
      CurrentWeightHull := CurrentWeightHull + tempTransport.SumCurrentWeight;
      {$ENDREGION}
    end;
  end;

  TotalCurrentWeight := CurrentWeightHull + CurrentWeightPersonel;
  TotalMaxDayaAngkutWeight := TT3Vehicle(NewHostPlatform).UnitCapability.FData.Max_Deck_Weight +
  (TT3Vehicle(NewHostPlatform).UnitCapability.FData.Max_Personnel_Capacity * 0.7);

  SisaDayaAngkut := TotalMaxDayaAngkutWeight - TotalCurrentWeight;

  if TT3Vehicle(MemberPlatform).VehicleDefinition.FData.Weight > SisaDayaAngkut then
  begin
    MessageDlg('Already exceed maximum weight limit', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  {$REGION ' Pengecekan sesuai capability kapal pengangkut '}

  isHullShowTemp := False;
  case MemberPlatform.PlatformDomain of

    {$REGION ' Jika yang diangkut Land platform '}
    vhdLand:
    begin
      if (MemberPlatform.PlatformCategory =  2) and (MemberPlatform.PlatformType =  0) then
      begin
        if not CheckPersonelCapability(TT3Vehicle(MemberPlatform), TT3Vehicle(NewHostPlatform)) then
          Exit;
      end
      else
      begin
        if not CheckAmphibhiousAndLandCapability(TT3Vehicle(MemberPlatform), TT3Vehicle(NewHostPlatform)) then
          Exit
        else
          isHullShowTemp := True;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Jika yang diangkut Amphibious platform '}
    vhdAmphibious:
    begin
      if not CheckAmphibhiousAndLandCapability(TT3Vehicle(MemberPlatform), TT3Vehicle(NewHostPlatform)) then
        Exit
      else
        isHullShowTemp := True;
    end;
    {$ENDREGION}

  end;

  {$ENDREGION}

  {$REGION ' Set platform state and position based on ramp '}
  HostWidth := Trunc(TT3Vehicle(NewHostPlatform).UnitCapability.Fdata.Deck_Width * 7);
  HostLength := Trunc(TT3Vehicle(NewHostPlatform).UnitCapability.Fdata.Deck_Length * 7);
  Width := Trunc(TT3Vehicle(MemberPlatform).UnitCapability.Fdata.Deck_Width * 7);
  Length := Trunc(TT3Vehicle(MemberPlatform).UnitCapability.Fdata.Deck_Length * 7);
  tempRamp := TT3Vehicle(NewHostPlatform).RampList[0];

  tempX := HostLength - (Length div 2) - 10;
  tempY := HostWidth div 2;
  tempHeading := 270;
  tempRampPos:= 0;

//  TT3Vehicle(MemberPlatform).MemberPosDisembark := tempRampPos;
//  TT3Vehicle(MemberPlatform).StateTransport := True;
//  TT3Vehicle(NewHostPlatform).HostLoadState := hlsLoading;

  {$ENDREGION}

  {$REGION ' Mengirim Paket Embarkasi baru'}
  RecTransport.OrderID := CORD_ID_disembarkwith;
  RecTransport.HostPlatformID := OldHostPlatform.InstanceIndex;
  RecTransport.NewHostPlatformID := NewHostPlatform.InstanceIndex;
  RecTransport.MemberPlatformID := MemberPlatform.InstanceIndex;

  RecTransport.MemberPlatformName := MemberPlatform.InstanceName;
  RecTransport.TrackID := TT3Vehicle(MemberPlatform).Track_ID;
  RecTransport.StateTransport := True;

  simMgrClient.netSend_CmdTransport(RecTransport);
  {$ENDREGION}

  {$REGION ' Proses tambahan untuk kapal yg ditempatkan di Hull '}
  if isHullShowTemp then
  begin

    {$REGION 'Mengirim Paket Embarked Platform'}
    RecEmbark.OrderID := CORD_ID_SETHEADING;
    RecEmbark.HostShipID := NewHostPlatform.InstanceIndex;
    RecEmbark.MemberShipID := MemberPlatform.InstanceIndex;
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

function TfmDisembarkWith.CheckAmphibhiousAndLandCapability(MemberShip, HostShip: TT3Vehicle): Boolean;
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

  {$REGION ' Pengecekan kapasitas maksimal Amphibious and Land Carried '}
  tempUsedSpace := 0;
  tempUsedSpace := TT3Vehicle(MemberShip).UnitCapability.FData.Deck_Length * TT3Vehicle(MemberShip).UnitCapability.FData.Deck_Width;
  if TT3Vehicle(NewHostPlatform).CurrentHullSpace < tempUsedSpace then
  begin
    MessageDlg('There is not enough space ', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  Result := True;

end;

function TfmDisembarkWith.CheckMemberPosToRamp(MemberShip, HostShip: TT3Vehicle): Integer;
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

function TfmDisembarkWith.CheckPersonelCapability(MemberShip, HostShip: TT3Vehicle): Boolean;
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
  FreeCapacity := 0;
  FreeCapacity := TT3Vehicle(HostShip).UnitCapability.FData.Max_Personnel_Capacity - TT3Vehicle(HostShip).CurrentPersonelCapacity;

  if FreeCapacity < TT3Vehicle(MemberShip).CurrentPersonelCapacity  then
  begin
    MessageDlg('There is not enough space ', mtInformation, [mbOK], 0);
    Exit;
  end;
  {$ENDREGION}

  Result  := True;
end;

procedure TfmDisembarkWith.FormCreate(Sender: TObject);
begin
  OnDeckList  := TList.Create;
  OnHullList  := TList.Create;
end;

procedure TfmDisembarkWith.FormShow(Sender: TObject);
var
  li : TListItem;

  i,j     : Integer;
  _Range  : Double;
  _Platform : TT3PlatformInstance;

begin
  if not Assigned(OldHostPlatform) then
    Exit;

  if OldHostPlatform is TT3Vehicle then
  begin
    lvDisembarkWithPf.Clear;

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

        if MemberPlatform.Equals(_Platform) then
          Continue;

        {Cek kapal-kapal yg satu force}
        if _Platform.Force_Designation <> TT3PlatformInstance(TT3Vehicle(ControlledPlatform)).Force_Designation then
          Continue;

        if NOT TT3Vehicle(_Platform).StateTransport then
          Continue;

//        if TT3Vehicle(_Platform).PlatformDomain <> vhdSurface then
//          Continue;

        if TT3Vehicle(_Platform).HostIdTransport <> OldHostPlatform.InstanceIndex then
          Continue;

        li := lvDisembarkWithPf.Items.Add;
        li.Caption := _Platform.InstanceName;
        li.SubItems.Add('');
        li.Data := _Platform;
      end;
    end;
  end;
end;

procedure TfmDisembarkWith.lvDisembarkWithPfSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  NewHostPlatform := nil;

  if Selected then
  begin
    NewHostPlatform := Item.Data;
    btnOK.Enabled := True;
  end
  else
  begin
    btnOK.Enabled := False;
  end;
end;

end.
