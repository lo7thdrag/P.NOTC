unit uCameraControllerManager;

interface

uses
  Classes, uGameData_TTT;

type
  TCameraControllerManager = class
  private
    FSessionID: Integer;
    FPlatformList: TList;
    FLatitude: Double;
    FLongitude: Double;

    FPlatformDB: TList;
    FVehicleDB: TList;
  public
    constructor Create;
    destructor Destroy;

    procedure InitNetwork;
    procedure GetPlatformDataFromDB;

    // convert array to string
    procedure CopyArrayToStr(const src: array of AnsiChar;
      var dest: AnsiString);

    procedure NetOnConnected(aSender: TObject);
    procedure NetOnDisconnected(aSender: TObject);

    procedure netSend_TCPRequest(var rec: TRecTCP_Request);
    procedure netSend_CameraController(var rec: TRec_CameraController);
    procedure netSend_SwitchTerrain(var rec: TRec_SwitchTerrain);

    procedure netRecv_PlatformData(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_PersonelData(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_EmbarkPlatform(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_RuntimePlatform(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_CmdRemovePlatfromByOperator
      (apRec: PAnsiChar; aSize: Word);
    procedure netRecv_CameraData(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_GameTime(apRec: PAnsiChar; aSize: Word);
    procedure netRecv_DammagePlatform(apRec: PAnsiChar; aSize: Word);

    property SessionID: Integer read FSessionID write FSessionID;
    property PlatformList: TList read FPlatformList;
    property Latitude: Double read FLatitude;
    property Longitude: Double read FLongitude;
  end;

var
  CameraControllerManager: TCameraControllerManager;

implementation

uses
  SysUtils, Graphics, ufmMainDashboard, uNetCameraController, uPlatformData,
  uCameraDataModule, uTCPDatatype;

{ TCameraControllerManager }

procedure TCameraControllerManager.CopyArrayToStr(const src: array of AnsiChar;
  var dest: AnsiString);
var
  i: Integer;
begin
  dest := '';

  for i := 0 to Length(src) do
  begin
    if Ord(src[i]) <> 0 then
      dest := dest + src[i];

    if Ord(src[i]) = 0 then
      Break;
  end;
end;

constructor TCameraControllerManager.Create;
begin
  FPlatformDB := TList.Create;
  FVehicleDB := TList.Create;
  FPlatformList := TList.Create;
end;

destructor TCameraControllerManager.Destroy;
begin
  FPlatformList.Free;
end;

procedure TCameraControllerManager.GetPlatformDataFromDB;
begin
  dmCamera.GetPlatformInstance(FPlatformDB);
  dmCamera.GetVehicleDef(FVehicleDB);
end;

procedure TCameraControllerManager.InitNetwork;
begin
  VNetCameraController.RegisterTCPPacket
    (CPID_TCP_REQUEST, SizeOf(TRecTCP_Request), nil);

  VNetCameraController.RegisterTCPPacket(CPID_REC_AOPR_DATA, SizeOf
      (TRec_AOPR_Data_Initialize), netRecv_PlatformData);

  VNetCameraController.RegisterTCPPacket
    (CPID_CMD_PERSONEL, SizeOf(TRec_Personel), netRecv_PersonelData);

  VNetCameraController.RegisterTCPPacket(CPID_CMD_LAUNCH_EMBARK, SizeOf
      (TRecCmd_Embark), netRecv_EmbarkPlatform);

  VNetCameraController.RegisterTCPPacket(CPID_CMD_LAUNCH_RUNTIME_PLATFORM,
    SizeOf(TRecCmd_LaunchRP), netRecv_RuntimePlatform);

  VNetCameraController.RegisterTCPPacket(CPID_CMD_REMOVE_PLATFORM, SizeOf
      (TRecCmd_SelectPlatformToRemove), netRecv_CmdRemovePlatfromByOperator);

  VNetCameraController.RegisterTCPPacket(CPID_CMD_CAMERA_CONTROLLER, SizeOf
      (TRec_CameraController), netRecv_CameraData);

  VNetCameraController.RegisterTCPPacket(CPID_CMD_SWITCH_TERRAIN, SizeOf
      (TRec_SwitchTerrain), nil);

  VNetCameraController.RegisterTCPPacket(CPID_GAME_TIME, SizeOf(TRec_GameTime),
    netRecv_GameTime);

  VNetCameraController.RegisterTCPPacket(CPID_PLATFORM_FREEME, sizeof(TRecPlatformFreeMe),
    netRecv_DammagePlatform);
end;

procedure TCameraControllerManager.NetOnConnected(aSender: TObject);
var
  rec: TRecTCP_Request;
begin
  with fmMainDashboard.pnlConnection do
  begin
    Caption := 'Connected';
    Color := clLime;
  end;

  rec.reqID := REQ_MISSED_PACKET;
  rec.reqFlag := Random($FFFF);
  //VNetCameraController.SendCommand(CPID_TCP_REQUEST, @rec);

  rec.reqID := REQ_DATA_PLATFORM;
  rec.State3D := Byte(False);
  rec.reqFlag := Random($FFFF);
  VNetCameraController.SendCommand(CPID_TCP_REQUEST, @rec);
end;

procedure TCameraControllerManager.NetOnDisconnected(aSender: TObject);
var
  i: Integer;
  plat: TPlatform;
begin
  for i := 0 to FPlatformList.Count - 1 do
  begin
    plat := FPlatformList.Items[i];
    plat.Free;
  end;

  FPlatformList.Clear;

  with fmMainDashboard do
  begin
    UpdatePlatformList;

    pnlConnection.Caption := 'Disconnected';
    pnlConnection.Color := clRed;
  end;
end;

procedure TCameraControllerManager.netRecv_CameraData
  (apRec: PAnsiChar; aSize: Word);
var
  rec: ^TRec_CameraController;
begin
  rec := @apRec^;

  case rec.cmd of
    CORD_ID_CAMCON_REPOS_LAT:
      FLatitude := rec.valueDbl;
    CORD_ID_CAMCON_REPOS_LONG:
      FLongitude := rec.valueDbl;
  end;

  fmMainDashboard.UpdateCameraLongLat;
end;

procedure TCameraControllerManager.netRecv_CmdRemovePlatfromByOperator
  (apRec: PAnsiChar; aSize: Word);
var
  rec: ^TRecCmd_SelectPlatformToRemove;
  found: Boolean;
  i: Integer;
  plat: TPlatform;
begin
  rec := @apRec^;

  found := False;

  for i := 0 to FPlatformList.Count - 1 do
  begin
    plat := FPlatformList.Items[i];

    if plat.InstanceIndex = rec.PlatfomID then
    begin
      plat.Free;
      Break;
    end;
  end;

  FPlatformList.Delete(i);

  with fmMainDashboard do
    UpdatePlatformList;
end;

procedure TCameraControllerManager.netRecv_DammagePlatform
  (apRec: PAnsiChar; aSize: Word);
var
  rec : ^TRecPlatformFreeMe;
  found : Boolean;
  i : Integer;
  plat : TPlatform;
begin
  rec := @apRec^;

  found := False;

  for i := 0 to FPlatformList.Count - 1 do
  begin
    plat := FPlatformList.Items[i];

    if Boolean(rec.FreeMe) then
    begin
      if plat.InstanceIndex = rec.PlatformID then
      begin
        plat.Free;
        Break;
      end;
    end;
  end;

  FPlatformList.Delete(i);

  with fmMainDashboard do
    UpdatePlatformList;
end;

procedure TCameraControllerManager.netRecv_EmbarkPlatform
  (apRec: PAnsiChar; aSize: Word);
var
  rec: ^TRecCmd_Embark;
  found: Boolean;
  i: Integer;
  plat: TPlatform;
  vehicleDB: TVehicle_Definition;
begin
  rec := @apRec^;

  found := False;

  for i := 0 to FPlatformList.Count - 1 do
  begin
    plat := FPlatformList.Items[i];

    if plat.InstanceIndex = rec.EmbarkPlatformID then
    begin
      found := True;
      Exit;
    end;
  end;

  if not found then
  begin
    plat := TPlatform.Create;
    plat.InstanceIndex := rec.EmbarkPlatformID;
    plat.InstanceIdentIndex := rec.IDPlatformName;
    plat.ClassIndex := rec.IDPlatformClass;

    for i := 0 to FVehicleDB.Count - 1 do
    begin
      vehicleDB := FVehicleDB.Items[i];

      if vehicleDB.FData.Vehicle_Index = plat.ClassIndex then
      begin
        plat.InstanceName := vehicleDB.FData.Vehicle_Identifier;
        Break;
      end;
    end;

    FPlatformList.Add(plat);

    fmMainDashboard.UpdatePlatformList;
  end;
end;

procedure TCameraControllerManager.netRecv_GameTime
  (apRec: PAnsiChar; aSize: Word);
var
  rec: ^TRec_GameTime;
  recData: TRec_AOPR_Data_Initialize;
  strIP : string;
begin
  rec := @apRec^;

  strIP := LongIp_To_StrIp(rec^.PC.ipSender);

  if rec^.OrderID = 1 then
  begin
    recData.OrderID := CORD_ID_REQ_NEXT_DATA;
    VNetCameraController.SendCommand(CPID_REC_AOPR_DATA, @recData);
  end;
end;

procedure TCameraControllerManager.netRecv_PersonelData
  (apRec: PAnsiChar; aSize: Word);
var
  rec: ^TRec_Personel;
  found: Boolean;
  i: Integer;
  plat, platDB: TPlatform;
begin
  rec := @apRec^;

  case rec^.OrderID of
    CORD_ID_START_SEND_DATA_PRSNL:
      begin
        rec^.OrderID := CORD_ID_REQ_NEXT_DATA_PRSNL;
        VNetCameraController.SendCommand(CPID_CMD_PERSONEL, apRec);
      end;
    CORD_ID_REQ_NEXT_DATA_PRSNL:
      begin
        if rec^.PlatformID <> 0 then
        begin
          found := False;

          if Boolean(rec.FreeMe) = False then
          begin
            for i := 0 to FPlatformList.Count - 1 do
            begin
              plat := FPlatformList.Items[i];

              if plat.InstanceIndex = rec.PlatformID then
              begin
                found := True;
                Break;
              end;
            end;

            if not found then
            begin
              plat := TPlatform.Create;
              plat.InstanceIndex := rec.PlatformID;

              for i := 0 to FPlatformDB.Count - 1 do
              begin
                platDB := FPlatformDB.Items[i];

                if platDB.InstanceIndex = plat.InstanceIndex then
                begin
                  plat.InstanceName := platDB.InstanceName;
                  Break;
                end;
              end;

              // plat.InstanceIdentIndex := rec.IDPlatformName;
              // plat.ClassIndex := rec.IDPlatformClass;

              FPlatformList.Add(plat);

              fmMainDashboard.UpdatePlatformList;
            end;
          end;

          rec^.OrderID := CORD_ID_REQ_NEXT_DATA_PRSNL;
          VNetCameraController.SendCommand(CPID_CMD_PERSONEL, apRec);
        end
        else
        begin
          rec^.OrderID := CORD_ID_REQ_NEXT_DATA_PRSNL;
          VNetCameraController.SendCommand(CPID_CMD_PERSONEL, apRec);
        end;
      end;
    CORD_ID_END_SEND_DATA_PRSNL:
      begin
        rec^.OrderID := CORD_ID_END_SEND_DATA_PRSNL;
        //VNetCameraController.SendCommand(CPID_CMD_PERSONEL, apRec);
      end;
  end;
end;

procedure TCameraControllerManager.netRecv_PlatformData
  (apRec: PAnsiChar; aSize: Word);
var
  rec: ^TRec_AOPR_Data_Initialize;
  found: Boolean;
  i: Integer;
  plat, platDB: TPlatform;
  vehicleDB: TVehicle_Definition;
  strIP : string;
begin
  rec := @apRec^;

  strIP := LongIp_To_StrIp(rec^.PC.ipSender);

  case rec^.OrderID of
    CORD_ID_START_SEND_DATA:
      begin
        rec^.OrderID := CORD_ID_REQ_NEXT_DATA;
        VNetCameraController.SendCommand(CPID_REC_AOPR_DATA, apRec);
      end;
    CORD_ID_REQ_NEXT_DATA:
      begin
        if rec^.PlatformID <> 0 then
        begin
          found := False;

          if Boolean(rec.FreeMe) = False then
          begin
            for i := 0 to FPlatformList.Count - 1 do
            begin
              plat := FPlatformList.Items[i];

              if plat.InstanceIndex = rec.PlatformID then
              begin
                found := True;
                Break;
              end;
            end;

            if not found then
            begin
              plat := TPlatform.Create;
              plat.InstanceIndex := rec.PlatformID;
              CopyArrayToStr(rec.namePlatform, plat.InstanceName);
//              for i := 0 to FPlatformDB.Count - 1 do
//              begin
//                platDB := FPlatformDB.Items[i];
//
//                if platDB.InstanceIndex = plat.InstanceIndex then
//                begin
//                  plat.InstanceName := platDB.InstanceName;
//                  Break;
//                end;
//              end;

              plat.InstanceIdentIndex := rec.IDPlatformName;
              plat.ClassIndex := rec.IDPlatformClass;

              if plat.InstanceName = '' then
                for i := 0 to FVehicleDB.Count - 1 do
                begin
                  vehicleDB := FVehicleDB.Items[i];

                  if vehicleDB.FData.Vehicle_Index = plat.ClassIndex then
                  begin
                    plat.InstanceName := vehicleDB.FData.Vehicle_Identifier;
                    Break;
                  end;
                end;

              FPlatformList.Add(plat);

              fmMainDashboard.UpdatePlatformList;
            end;
          end;
          rec^.OrderID := CORD_ID_REQ_NEXT_DATA;
          VNetCameraController.SendCommand(CPID_REC_AOPR_DATA, apRec);
        end
        else
        begin
          rec^.OrderID := CORD_ID_REQ_NEXT_DATA;
          VNetCameraController.SendCommand(CPID_REC_AOPR_DATA, apRec);
        end;
      end;
    CORD_ID_END_SEND_DATA:
      begin
        rec^.OrderID := CORD_ID_END_SEND_DATA;
        VNetCameraController.SendCommand(CPID_REC_AOPR_DATA, apRec);
      end;
  end;
end;

procedure TCameraControllerManager.netRecv_RuntimePlatform
  (apRec: PAnsiChar; aSize: Word);
var
  rec: ^TRecCmd_LaunchRP;
  found: Boolean;
  i: Integer;
  plat: TPlatform;
  vehicleDB: TVehicle_Definition;
  data: AnsiString;
begin
  rec := @apRec^;

  found := False;

  for i := 0 to FPlatformList.Count - 1 do
  begin
    plat := FPlatformList.Items[i];

    if plat.InstanceIndex = rec.NewPlatformID then
    begin
      found := True;
      Exit;
    end;
  end;

  if not found then
  begin
    plat := TPlatform.Create;
    plat.InstanceIndex := rec.NewPlatformID;
    plat.InstanceIdentIndex := rec.IDPlatformName;
    plat.ClassIndex := rec.IDPlatformClass;
    CopyArrayToStr(rec.InstanceName, data);

    plat.InstanceName := data;

    // for i := 0 to FVehicleDB.Count - 1 do
    // begin
    // vehicleDB := FVehicleDB.Items[i];
    //
    // if vehicleDB.FData.Vehicle_Index = plat.ClassIndex then
    // begin
    // plat.InstanceName := vehicleDB.FData.Vehicle_Identifier;
    // Break;
    // end;
    // end;

    FPlatformList.Add(plat);

    fmMainDashboard.UpdatePlatformList;
  end;
end;

procedure TCameraControllerManager.netSend_CameraController
  (var rec: TRec_CameraController);
begin
  rec.SessionID := FSessionID;
  VNetCameraController.SendCommand(CPID_CMD_CAMERA_CONTROLLER, @rec);
end;

procedure TCameraControllerManager.netSend_SwitchTerrain
  (var rec: TRec_SwitchTerrain);
begin
  rec.SessionID := FSessionID;
  VNetCameraController.SendCommand(CPID_CMD_SWITCH_TERRAIN, @rec);
end;

procedure TCameraControllerManager.netSend_TCPRequest(var rec: TRecTCP_Request);
begin
  rec.SessionID := FSessionID;
  VNetCameraController.SendCommand(CPID_TCP_REQUEST, @rec);
end;

end.
