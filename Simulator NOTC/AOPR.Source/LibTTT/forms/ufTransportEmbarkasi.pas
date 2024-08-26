unit ufTransportEmbarkasi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Math,
  Generics.Collections,
  uDBAsset_Capability, uDataTypes, tttData,
  uT3Vehicle, uT3Unit, uSimMgr_Client, uGameData_TTT, uBaseCoordSystem,
  Vcl.Imaging.pngimage;

type
  TfrmTransportEmbarkasi = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    imgArea: TImage;
    Label17: TLabel;
    edtArah: TEdit;
    btnSetHeading0: TButton;
    btnSetHeading270: TButton;
    btnSetHeading180: TButton;
    btnSetHeading90: TButton;
    Label18: TLabel;
    edtKecepatan: TEdit;
    btnSpZero: TButton;
    btnSpOne: TButton;
    btnSpTwo: TButton;
    btnUpdate: TButton;
    btnDisembark: TButton;
    Timer1: TTimer;
    pnlPlatformDetailssss: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    lblTransportStatus: TLabel;
    btnClosex: TButton;
    Label11: TLabel;
    Label12: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    lblTransportClass: TLabel;
    lblTransportNameDetail: TLabel;
    btnStateStandBy: TButton;
    btnStateReady: TButton;
    btnStateEmbarkProcess: TButton;
    btnStateQueue: TButton;
    Label23: TLabel;
    Label24: TLabel;
    lblTransportArah: TLabel;
    pnlImageArea: TPanel;
    pnlBackRamp: TPanel;
    pnlFrontRamp: TPanel;
    pnlStarboardRampBack: TPanel;
    pnlStarboardRampFront: TPanel;
    pnlPortRampBack: TPanel;
    pnlPortRampFront: TPanel;
    lblSelectedRampPosition: TLabel;
    lblIndicator: TLabel;
    pnlShipDetails: TPanel;
    lblShipName: TLabel;
    lblShipClassName: TLabel;
    lblShipMaxWeightTitle: TLabel;
    lblShipCurrWeightTitle: TLabel;
    lblShipLengthTitle: TLabel;
    lblShipCurrWeightUnit: TLabel;
    lblShipAreaTitle: TLabel;
    lblShipMaxWeightUnit: TLabel;
    lblShipRemWeightUnit: TLabel;
    lblShipRemWeightTitle: TLabel;
    lblShipWidthUnit: TLabel;
    lblShipWidthTitle: TLabel;
    lblShipAreaUnit: TLabel;
    lblShipLengthUnit: TLabel;
    lblShipRemWeight: TLabel;
    lblShipCurrWeight: TLabel;
    lblShipLength: TLabel;
    lblShipMaxWeight: TLabel;
    lblShipWidth: TLabel;
    lblShipArea: TLabel;
    pnlPlatformDetails: TPanel;
    lblSelectedPlatform: TLabel;
    lblSelectedPlatformClass: TLabel;
    lblSelectedPlatformLengthTitle: TLabel;
    lblSelectedPlatformWidthTitle: TLabel;
    lblPlatformMoveTitle: TLabel;
    lblSelectedPlatformWidthUnit: TLabel;
    lblPlatformStatusTitle: TLabel;
    lblSelectedPlatformLengthUnit: TLabel;
    lblSelectedPlatformAreaUnit: TLabel;
    lblSelectedPlatformAreaTitle: TLabel;
    lblPlatformHeadingTitle: TLabel;
    lblSelectedPlatformArea: TLabel;
    lblSelectedPlatformWidth: TLabel;
    lblSelectedPlatformLength: TLabel;
    btnMoveForward: TButton;
    btnStop: TButton;
    btnMoveBackward: TButton;
    lblPlatformHeading: TLabel;
    btnClose: TButton;
    lblPlatformStatus: TLabel;
    imgTurnTable: TImage;
    imgArrowRight: TImage;
    imgArrowLeft: TImage;
    btnReady: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure imgAreaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDisembarkClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure btnHeadingClick(Sender: TObject);
    procedure cbbPlatformStatusChange(Sender: TObject);

    procedure drawTurnTable;
    procedure drawDisembarkArea;
    procedure btnReadyClick(Sender: TObject);


  private
    { Private declarations }
    InitFormLength : Integer;
    IinitFormWidth : Integer;

//    ShipLength, ShipWidth: Integer;
    HullLength, HullWidth: Integer;

    FTransportList: TList;
    FSelectedTransport: TMyShape;
    FPreviouslySelectedTransport: TMyShape; // track selected Shape sebelumnya
    AvailableIndices: TList<Integer>; // Menyimpan Index dari Transport yang tersedia
    rec: TRecCmd_TransportProcess;

    procedure resetDataTransport;
    procedure CenterComponents;
    procedure UpdateComponents;

    procedure drawShapeRect; /// gambar Transportnya \\\
    procedure createObject;
    procedure UpdateInfoMove;
    procedure SetMemberLoadState(Shape: TMyShape; State: Integer);
    procedure DeleteSelectedTransport;
  public
    { Public declarations }
    isAsHost : Boolean;
    ControlerShipID: Integer; {ID penanda seandainya proses ini dilakukan di operator, kapal yg bisa dicontrol hanya kapal yg ada dioperator tsb }

    HostShipID: Integer;
    MemberShipID: Integer;

    HostShip: TT3Vehicle;
    MemberShip: TT3Vehicle;
  end;

var
  frmTransportEmbarkasi: TfrmTransportEmbarkasi;

const
//  C_FaktorSkala3 = 3;
  C_FaktorSkala = 5;

implementation

{$R *.dfm}

{ TfrmTransportEmbarkasi }

procedure TfrmTransportEmbarkasi.FormCreate(Sender: TObject);
begin
  FTransportList := TList.Create; // create List yang isinya Transport yang diembark
  AvailableIndices := TList<Integer>.Create;

  resetDataTransport;

  Timer1.Enabled := True;

  InitFormLength := 894;
  IinitFormWidth := 112;
end;

procedure TfrmTransportEmbarkasi.FormShow(Sender: TObject);
var
  i: Integer;
  tempRamp : TRamp;
begin
  HostShip := simMgrClient.FindT3PlatformByID(HostShipID) as TT3Vehicle;

  {$REGION ' Properties Kapal '}
  lblShipName.Caption := HostShip.InstanceName;
  lblShipClassName.Caption       := HostShip.InstanceClass;

  lblShipMaxWeight.Caption := FormatFloat('0.##',TT3Vehicle(HostShip).UnitCapability.FData.Max_Deck_Weight);

  lblShipCurrWeight.Caption := FormatFloat('0.##',TT3Vehicle(HostShip).CurrentHullWeight);

  lblShipRemWeight.Caption  := FormatFloat('0.##',(TT3Vehicle(HostShip).UnitCapability.FData.Max_Deck_Weight -
                                                   TT3Vehicle(HostShip).CurrentHullWeight));
  {$ENDREGION}

  {$REGION ' Luas Area Main '}

  {$REGION ' Panjang & Lebar Kapal Induknya '}
//  ShipLength := Trunc(HostShip.VehicleDefinition.FData.Length) * Trunc(C_FaktorSkala3);
//  ShipWidth := Trunc(HostShip.VehicleDefinition.FData.Width) * Trunc(C_FaktorSkala3);
  {$ENDREGION}

  {$REGION ' Panjang & Lebar Hull Kapal Induknya '}
  HullLength := Trunc(HostShip.UnitCapability.FData.Deck_Length) * Trunc(C_FaktorSkala);
  HullWidth := Trunc(HostShip.UnitCapability.FData.Deck_Width) * Trunc(C_FaktorSkala);
  {$ENDREGION}

  {$REGION ' Panel Ship Details Info '}
  lblShipLength.Caption := HullLength.ToString;
  lblShipWidth.Caption := HullWidth.ToString;
  lblShipArea.Caption := (HullWidth * HullLength).ToString;
  {$ENDREGION}

  CenterComponents;
  {$ENDREGION}

  {$REGION ' Capability Rampa '}
  pnlFrontRamp.Visible := TT3Vehicle(HostShip).VehicleDefinition.FData.FrontGangway;
  pnlBackRamp.Visible := TT3Vehicle(HostShip).VehicleDefinition.FData.RearGangway;

  if(pnlFrontRamp.Visible) then
  begin
    pnlPortRampBack.Visible := TT3Vehicle(HostShip).VehicleDefinition.FData.PortGangway;
    pnlStarboardRampBack.Visible := TT3Vehicle(HostShip).VehicleDefinition.FData.StarBoardGangway;
  end
  else if (pnlBackRamp.Visible) then
  begin
    pnlPortRampFront.Visible := TT3Vehicle(HostShip).VehicleDefinition.FData.PortGangway;
    pnlStarboardRampFront.Visible := TT3Vehicle(HostShip).VehicleDefinition.FData.StarBoardGangway;
  end;
  {$ENDREGION}

  createObject;
end;

procedure TfrmTransportEmbarkasi.FormDestroy(Sender: TObject);
var
  s: TMyShape;
begin
  for s in FTransportList do
  begin
    s.Free;
  end;

  AvailableIndices.Free;
  FTransportList.Free;
end;

procedure TfrmTransportEmbarkasi.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s: TMyShape;
begin
  Action := caFree;
end;

procedure TfrmTransportEmbarkasi.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTransportEmbarkasi.imgAreaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  s: TMyShape;
  rampID: Integer;
begin
  if ssLeft in Shift then
  begin
    if FTransportList.Count > 0 then
    begin
      MemberShip := simMgrClient.FindT3PlatformByID(MemberShipID) as TT3Vehicle;
      { set previously Selected object's color jadi biru }
      if FPreviouslySelectedTransport <> nil then
      begin
        FPreviouslySelectedTransport.Color := clBlue;
        FPreviouslySelectedTransport.BorderColor := clBlue;
      end;


      { set Object yang dipilih = nil }
      FSelectedTransport := nil;

      for s in FTransportList do
      begin
        { jika klik di dalam bentukan Shape }
        if s.isPointInside(Point(X,Y)) then
        begin

          if not isAsHost  then
          begin
            if s.IDMemberShip <> ControlerShipID then
              Exit;
          end;

          s.Color := clLime;
          s.BorderColor := clLime;
          FSelectedTransport := s;

          lblSelectedPlatform.Caption := FSelectedTransport.NameMemberShip;
          lblSelectedPlatformClass.Caption := FSelectedTransport.ClassMemberShip;
          lblSelectedPlatformLength.Caption := FSelectedTransport.Height.ToString;
          lblSelectedPlatformWidth.Caption := FSelectedTransport.Width.ToString;
          lblSelectedPlatformArea.Caption := (FSelectedTransport.Width * FSelectedTransport.Height).ToString;
          lblPlatformStatus.Caption := FSelectedTransport.StateMemberShip;   //panggil

          btnMoveForward.Enabled := True;
          btnMoveBackward.Enabled := True;
          btnStop.Enabled := True;
          imgArrowLeft.Enabled := True;
          imgArrowRight.Enabled := True;
//          cbbPlatformStatus.Enabled := True;
        end;
      end;

      { Update the previously selected object }
      FPreviouslySelectedTransport := FSelectedTransport;

      { If no shape was clicked, clear the selection }
      if FSelectedTransport = nil then
      begin
        lblSelectedPlatform.Caption := 'No Platform Selected';
        lblSelectedPlatformClass.Caption := '---';
        lblSelectedPlatformLength.Caption := '0';
        lblSelectedPlatformWidth.Caption := '0';
        lblSelectedPlatformArea.Caption := '0';
        lblSelectedRampPosition.Caption := 'No Platform Selected';
        lblPlatformHeading.Caption := '0';
        lblPlatformStatus.Caption := '---';

        btnMoveForward.Enabled := False;
        btnMoveBackward.Enabled := False;
        btnStop.Enabled := False;
        imgArrowLeft.Enabled := False;
        imgArrowRight.Enabled := False;
//        cbbPlatformStatus.Enabled := False;
      end;
    end;
  end;
end;

procedure TfrmTransportEmbarkasi.createObject;
var
  heightTemp, widthTemp, velocityTemp, tempX, tempY: Integer;
  headingTemp: Single;
  s, sTemp: TMyShape;
  isFound: Boolean;
  pt: t2DPoint;
  Index, MaxIndex, i: Integer;
  tempRamp : TRamp;
  tempFound : Boolean;
begin
  for i := 0 to HostShip.MemberTransportList.Count - 1 do
  begin
    MemberShip := HostShip.MemberTransportList[i]; // ngambil data Member apa aja yang ada di Host Ship

    if not Assigned(MemberShip) then
    Exit;

    case MemberShip.PlatformDomain of

      {$REGION ' Jika yang diangkut air, surface & subsurface platform '}
      vhdAir, vhdSurface, vhdSubsurface:
      begin
        Continue;
      end;
      {$ENDREGION}

      {$REGION ' Jika yang diangkut Land platform '}
      vhdLand:
      begin
        if (MemberShip.VehicleDefinition.FData.Platform_Category =  2) and (MemberShip.VehicleDefinition.FData.Platform_Type =  0) then
        begin
          Continue;
        end
      end;
      {$ENDREGION}
    end;

    { Panjang dan Lebar sesuai ukuran masing2 Tank }
    heightTemp := Trunc(MemberShip.VehicleDefinition.FData.Length) * Trunc(C_FaktorSkala);
    widthTemp := Trunc(MemberShip.VehicleDefinition.FData.Width) * Trunc(C_FaktorSkala);

    tempFound := False;

    if FTransportList.Count = 0 then // jika masih belum ada object satupun
    begin
      Index := 0;

      s := TMyShape.Create(widthTemp, heightTemp, MemberShip.MemberSpeed, MemberShip.MemberPosX, MemberShip.MemberPosY, MemberShip.MemberHeading);
      s.IDMemberShip := MemberShip.InstanceIndex;
      s.Index := Index;
      s.NameMemberShip := MemberShip.InstanceName;
      s.ClassMemberShip := MemberShip.InstanceClass;
      SetMemberLoadState(s, MemberShip.MemberLoadState);
      FTransportList.Add(s);
    end
    else
    begin
      for sTemp in FTransportList do
      begin
        if MemberShip.InstanceIndex = sTemp.IDMemberShip then tempFound := True
      end;

      if tempFound then Continue;

      // Find the maximum index in the existing objects
      MaxIndex := 0;
      for s in FTransportList do
      begin
        if s.Index > MaxIndex then
          MaxIndex := s.Index;
      end;

      if AvailableIndices.Count > 0 then
      begin
        // use smallest available index for the new shape
        Index := AvailableIndices[0];
        AvailableIndices.Delete(0);
      end
      else
      begin
        // use the next highest index
        Index := MaxIndex + 1;
      end;

      { properties Shape nya }
      s := TMyShape.Create(widthTemp, heightTemp, MemberShip.MemberSpeed, MemberShip.MemberPosX, MemberShip.MemberPosY, MemberShip.MemberHeading);
      s.IDMemberShip := MemberShip.InstanceIndex;
      s.Index := Index;
      s.NameMemberShip := MemberShip.InstanceName;
      s.ClassMemberShip := MemberShip.InstanceClass;
      SetMemberLoadState(s, MemberShip.MemberLoadState);
      FTransportList.Add(s);
    end;
  end;
end;

procedure TfrmTransportEmbarkasi.SetMemberLoadState(Shape: TMyShape; State: Integer);
begin
  if Shape = nil then
    Exit;

  MemberShip := simMgrClient.FindT3PlatformByID(Shape.IDMemberShip) as TT3Vehicle;
  MemberShip.MemberLoadState := State;

  case MemberShip.MemberLoadState of
    0: Shape.StateMemberShip := 'Queue';
    1: Shape.StateMemberShip := 'Embark Process';
    2: Shape.StateMemberShip := 'Standby';
    3: Shape.StateMemberShip := 'Ready';
  end;

  lblPlatformStatus.Caption := Shape.StateMemberShip;
end;

procedure TfrmTransportEmbarkasi.UpdateInfoMove;
var
  s: TMyShape;
  MemberShip: TT3Vehicle;
  pi: TT3PlatformInstance;
begin
  for s in FTransportList do
  begin
    pi := simMgrClient.FindT3PlatformByID(s.IDMemberShip);
    if pi <> nil then
    begin
      MemberShip := pi as TT3Vehicle;

      s.X := MemberShip.MemberPosX;
      s.Y := MemberShip.MemberPosY;
      s.Heading := MemberShip.MemberHeading;
      s.Velocity := MemberShip.MemberSpeed;
      SetMemberLoadState(s, MemberShip.MemberLoadState);

      s.AngleRad := DegToRad(90-s.Heading);
      s.CosAngle := Cos(s.AngleRad);
      s.SinAngle := Sin(s.AngleRad);

//      if (s.StateMemberShip <> 'mlsStandBy') or (s.StateMemberShip <> 'mlsReady') then HostShip.HostLoadState := hlsReady;
    end;
  end;
end;


procedure TfrmTransportEmbarkasi.drawTurnTable;
var
  x1,x2,y1,y2 : Integer;
  diameter : Integer;
begin
  diameter := (imgArea.Height - 40);
  if diameter > 110 then diameter := 110;

  if pnlFrontRamp.Visible then
  begin
    if pnlPortRampBack.Visible then
    begin
      x1 := 40;
      x2 := 40 + diameter;
      y1 := (imgArea.Height div 2) - (diameter div 2);
      y2 := (imgArea.Height div 2) + (diameter div 2);
    end
    else
    begin
      x1 := imgArea.Width - 40 - diameter;
      x2 := imgArea.Width - 40;
      y1 := (imgArea.Height div 2) - (diameter div 2);
      y2 := (imgArea.Height div 2) + (diameter div 2);
    end;
  end
  else
  begin
    if pnlPortRampFront.Visible then
    begin
      x1 := imgArea.Width - 40 - diameter;
      x2 := imgArea.Width - 40;
      y1 := (imgArea.Height div 2) - (diameter div 2);
      y2 := (imgArea.Height div 2) + (diameter div 2);
    end
    else
    begin
      x1 := 40;
      x2 := 40 + diameter;
      y1 := (imgArea.Height div 2) - (diameter div 2);
      y2 := (imgArea.Height div 2) + (diameter div 2);
    end;
  end;

  imgArea.Canvas.Pen.Width := 1;
  imgArea.Canvas.Pen.Color := clGreen;
  imgArea.Canvas.Brush.Color := clGreen;
  imgArea.Canvas.Ellipse(x1, y1, x2, y2);
end;

procedure TfrmTransportEmbarkasi.drawDisembarkArea;
begin
  imgArea.Canvas.Pen.Color := clBlack;
  imgArea.Canvas.Pen.Style := psDash;
  imgArea.Canvas.Brush.Color := clWhite;

  if pnlFrontRamp.Visible then
  begin
    imgArea.Canvas.Rectangle(imgArea.Width,0,(imgArea.Width - 150),imgArea.Height);

    if pnlPortRampBack.Visible then
    begin
      imgArea.Canvas.Rectangle(50,0,160,(imgArea.Height div 2) - 20);
      imgArea.Canvas.Rectangle(50,imgArea.Height,160,(imgArea.Height div 2) + 20);
    end;
  end
  else
  begin
    imgArea.Canvas.Rectangle(0,0,150,imgArea.Height);

    if pnlPortRampFront.Visible then
    begin
      imgArea.Canvas.Rectangle((imgArea.Width - 160),0,(imgArea.Width - 50),(imgArea.Height div 2) - 20);
      imgArea.Canvas.Rectangle((imgArea.Width - 160),imgArea.Height,(imgArea.Width - 50),(imgArea.Height div 2) + 20);
    end;
  end;
end;

procedure TfrmTransportEmbarkasi.drawShapeRect;
var
  s: TMyShape;
begin
  { warnain background dengan warna putih }
  imgArea.Canvas.Brush.Color := clWhite;
  imgArea.Canvas.Brush.Style := bsSolid;
  imgArea.Canvas.FillRect(ClientRect);

  drawDisembarkArea;
//  drawTurnTable;
  { gambar Object Transport nya }

  if (FTransportList.Count <> 0) and (HostShip.MemberTransportList.Count <> 0) then
  begin
    if FTransportList.Count <> HostShip.MemberTransportList.Count then createObject;

    for s in FTransportList do
    begin
      if (FSelectedTransport <> nil) then    // kalau di-Select
      begin
        FSelectedTransport.BorderColor := clLime;
        s.Draw(imgArea.Canvas);

        imgArea.Canvas.Font.Name := 'Segoe UI';
        imgArea.Canvas.Font.Size := 10;
        imgArea.Canvas.Font.Style := [fsBold];
        imgArea.Canvas.Font.Color := clBlack;
        SetBkMode(imgArea.Canvas.Handle, TRANSPARENT);
        imgArea.Canvas.TextOut(s.X - 15, s.Y - 10, s.NameMemberShip);
      end
      else
      begin
        s.BorderColor := clBlue;
        s.Draw(imgArea.Canvas);

        imgArea.Canvas.Font.Name := 'Segoe UI';
        imgArea.Canvas.Font.Size := 10;
        imgArea.Canvas.Font.Style := [fsBold];
        imgArea.Canvas.Font.Color := clBlack;
        SetBkMode(imgArea.Canvas.Handle, TRANSPARENT);
        imgArea.Canvas.TextOut(s.X - 15 , s.Y - 10, s.NameMemberShip);
      end;
    end;
  end;
end;

procedure TfrmTransportEmbarkasi.Timer1Timer(Sender: TObject);
begin
  UpdateInfoMove;
  drawShapeRect;
  UpdateComponents;
end;

procedure TfrmTransportEmbarkasi.btnDisembarkClick(Sender: TObject);
var
  HostShip : TT3PlatformInstance;
  MemberShip : TT3PlatformInstance;

  RecTransport : TRecCmd_Transport;
  tempRamp : TRamp;

  tempMember : TT3Vehicle;
begin
  {$REGION ' Pengecekan kapal yang mengeluarkan '}
  HostShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(HostShipID));
  {$ENDREGION}

  {$REGION ' Pengecekan kapal yang diangkut '}
  if FSelectedTransport <> nil then
  begin
    MemberShip := TT3PlatformInstance(simMgrClient.SimPlatforms.getObjectByInstanceIndex(FSelectedTransport.IDMemberShip));
  {$ENDREGION}

  {$REGION ' Pengecekan Status rampa '}
  tempMember := MemberShip as TT3Vehicle;

  case tempMember.MemberPosDisembark of
    0: {Depan}
    begin
      tempRamp := TT3Vehicle(HostShip).RampList[0];
      if not tempRamp.State then
      begin
        MessageDlg('Please Open Front Ramp First', mtInformation, [mbOK], 0);
        Exit;
      end
      else if tempMember.MemberLoadState <> mlsReady then
      begin
        MessageDlg('Selected platform is not ready', mtInformation, [mbOK], 0);
        Exit;
      end;

    end;
    1: {Kanan}
    begin
      tempRamp := TT3Vehicle(HostShip).RampList[1];
      if not tempRamp.State then
      begin
        MessageDlg('Please Open Starboard Ramp First', mtInformation, [mbOK], 0);
        Exit;
      end
      else if tempMember.MemberLoadState <> mlsReady then
      begin
        MessageDlg('Selected platform is not ready', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    2: {Belakang}
    begin
      tempRamp := TT3Vehicle(HostShip).RampList[2];
      if not tempRamp.State then
      begin
        MessageDlg('Please Open Back Ramp First', mtInformation, [mbOK], 0);
        Exit;
      end
      else if tempMember.MemberLoadState <> mlsReady then
      begin
        MessageDlg('Selected platform is not ready', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
    3: {Kiri}
    begin
      tempRamp := TT3Vehicle(HostShip).RampList[3];
      if not tempRamp.State then
      begin
        MessageDlg('Please Open Port Ramp First', mtInformation, [mbOK], 0);
        Exit;
      end
      else if tempMember.MemberLoadState <> mlsReady then
      begin
        MessageDlg('Selected platform is not ready', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
  end;
  end;
  {$ENDREGION}

  {$REGION ' Mengirim Paket '}
  RecTransport.OrderID := CORD_ID_disembark;
  RecTransport.HostPlatformID := HostShip.InstanceIndex;
  RecTransport.MemberPlatformID := MemberShip.InstanceIndex;

  RecTransport.MemberPlatformName := MemberShip.InstanceName;
  RecTransport.TrackID := TT3Vehicle(MemberShip).Track_ID;
  RecTransport.StateTransport := False;

  RecTransport.MemberPlatform3DName := TT3Vehicle(MemberShip).VehicleDefinition.FData.VBS_Class_Name;
  RecTransport.MemberDomain := MemberShip.PlatformDomain;
  RecTransport.TurnRate := TT3Vehicle(MemberShip).UnitMotion.FData.Standard_Turn_Rate;
  RecTransport.DiveRate := TT3Vehicle(MemberShip).UnitMotion.FData.Vertical_Accel;
  RecTransport.InitSpeed  := 2;   
  RecTransport.InitAltitude  := 0;
  RecTransport.RampID  := TT3Vehicle(MemberShip).MemberPosDisembark;

  {$REGION ' Penentuan arah keluar '}
  case tempMember.MemberPosDisembark of
    0 : RecTransport.InitCourse := HostShip.Course;
    1 : RecTransport.InitCourse := ValidateDegree(HostShip.Course + 90);
    2 : RecTransport.InitCourse := ValidateDegree(HostShip.Course + 180);
    3 : RecTransport.InitCourse := ValidateDegree(HostShip.Course + 270);
  end;
  {$ENDREGION}

  simMgrClient.netSend_CmdTransport(RecTransport);
  {$ENDREGION}

  DeleteSelectedTransport;
  resetDataTransport;
end;

procedure TfrmTransportEmbarkasi.btnMoveClick(Sender: TObject);
var
  tempship : TT3Vehicle;
  RecEmbark : TRec_EmbarkedPlatformData;
begin
  if FSelectedTransport <> nil then
  begin
    tempship := simMgrClient.FindT3PlatformByID(FSelectedTransport.IDMemberShip) as TT3Vehicle;

    if Assigned(tempship) then
    begin
      RecEmbark.OrderID := CORD_ID_SETMOVE;
      RecEmbark.HostShipID := tempship.HostIdTransport;
      RecEmbark.MemberShipID := tempship.InstanceIndex;
//      RecEmbark.IsCollision := tempship.isMemberCollision;
      RecEmbark.Heading := tempship.Heading;
      RecEmbark.PosX := tempship.MemberPosX;
      RecEmbark.PosY := tempship.MemberPosY;
      case (Sender as TButton).tag of
        0:  RecEmbark.Speed := 1;
        1:  RecEmbark.Speed := 0;
        2:  RecEmbark.Speed := -1;
      end;
      simMgrClient.netSend_EmbarkedPlatformData(RecEmbark);
    end;
  end;
end;

procedure TfrmTransportEmbarkasi.btnReadyClick(Sender: TObject);
var
  tempship : TT3Vehicle;
  RecEmbark : TRec_EmbarkedPlatformData;
begin
  if FSelectedTransport <> nil then
  begin
    tempship := simMgrClient.FindT3PlatformByID(FSelectedTransport.IDMemberShip) as TT3Vehicle;

    if Assigned(tempship) then
    begin
      RecEmbark.OrderID := CORD_ID_SETLOADSTATE;
      RecEmbark.HostShipID := tempship.HostIdTransport;
      RecEmbark.MemberShipID := tempship.InstanceIndex;
      RecEmbark.Heading := tempship.Heading;
      RecEmbark.PosX := tempship.MemberPosX;
      RecEmbark.PosY := tempship.MemberPosY;
      simMgrClient.netSend_EmbarkedPlatformData(RecEmbark);
    end;
  end;
end;

procedure TfrmTransportEmbarkasi.btnHeadingClick(Sender: TObject);
var
  tempHeading : Double;
  tempship : TT3Vehicle;
  RecEmbark : TRec_EmbarkedPlatformData;
  valTemp : Integer;

begin
  if FSelectedTransport <> nil then
  begin
    tempship := simMgrClient.FindT3PlatformByID(FSelectedTransport.IDMemberShip) as TT3Vehicle;

    if Assigned(tempship) then
    begin
      RecEmbark.OrderID := CORD_ID_SETHEADING;

      valTemp := Trunc(tempship.MemberHeading) mod 45;
      if (valTemp <> 0) then
        Exit;

      case (Sender as TImage).tag of
        0:
        begin
          tempHeading := tempship.MemberHeading + 45;
          if tempHeading >= 360 then tempHeading := tempHeading - 360;
        end;
        1:
        begin
          tempHeading := tempship.MemberHeading - 45;
          if tempHeading < 0 then tempHeading := tempHeading + 360;
        end;
      end;

      RecEmbark.HostShipID := tempship.HostIdTransport;
      RecEmbark.MemberShipID := tempship.InstanceIndex;
      RecEmbark.Heading := tempHeading;
      RecEmbark.PosX := tempship.MemberPosX;
      RecEmbark.PosY := tempship.MemberPosY;
      RecEmbark.IsEmbarkArea := tempship.isInDisembarkArea;
//      RecEmbark.IsCollision := tempship.isMemberCollision;

      simMgrClient.netSend_EmbarkedPlatformData(RecEmbark);
    end;
  end;
end;

procedure TfrmTransportEmbarkasi.DeleteSelectedTransport;
var
  i: Integer;
begin
  if FSelectedTransport <> nil then
  begin
    { Get the index of the removed object and add it to the list of available indices }
    for i := 0 to FTransportList.Count - 1 do
    begin
      AvailableIndices.Add(FSelectedTransport.Index);
      Break;
    end;
    { Remove the selected Object }
    FTransportList.Remove(FSelectedTransport);
    FSelectedTransport.Free;
    FSelectedTransport := nil;
  end
  else
    ShowMessage('Select the object to delete!');
end;

procedure TfrmTransportEmbarkasi.resetDataTransport;
begin
  if FSelectedTransport = nil then
  begin
    lblSelectedPlatform.Caption := 'No Platform Selected';
    lblSelectedPlatformClass.Caption := '---';
    lblSelectedPlatformLength.Caption := '0';
    lblSelectedPlatformWidth.Caption := '0';
    lblSelectedPlatformArea.Caption := '0';
    lblSelectedRampPosition.Caption := 'No Platform Selected';
  end;
end;

procedure TfrmTransportEmbarkasi.cbbPlatformStatusChange(Sender: TObject);
var
  RecEmbark : TRec_EmbarkedPlatformData;
  tempLoadState: Integer;
begin
  if FSelectedTransport <> nil then
  begin
    MemberShip:= simMgrClient.FindT3PlatformByID(FSelectedTransport.IDMemberShip) as TT3Vehicle;

//    case cbbPlatformStatus.ItemIndex of
//      0:
//      begin
//        SetMemberLoadState(FSelectedTransport, mlsQueue);
//        tempLoadState:= mlsQueue;
//      end;
//      1:
//      begin
//        SetMemberLoadState(FSelectedTransport, mlsProcess);
//        tempLoadState:= mlsProcess;
//      end;
//      2:
//      begin
//        if MemberShip.MemberSpeed <> 0 then MessageDlg('Please stop the selected platform first', mtInformation, [mbOK], 0)
//        else
//        begin
//          SetMemberLoadState(FSelectedTransport, mlsStandby);
//          tempLoadState:= mlsStandby;
//        end;
//      end;
//      3:
//      begin
//        if MemberShip.MemberSpeed <> 0 then MessageDlg('Please stop the selected platform first', mtInformation, [mbOK], 0)
//        else if not MemberShip.isInDisembarkArea then MessageDlg('Current selected platform is not in disembark area', mtInformation, [mbOK], 0)
//        else
//        begin
//          SetMemberLoadState(FSelectedTransport, mlsStandby);
//          tempLoadState:= mlsReady;
//        end;
//      end;
//    end;

    RecEmbark.HostShipID := MemberShip.HostIdTransport;
    RecEmbark.MemberShipID := MemberShip.InstanceIndex;
    RecEmbark.MemberLoadState := tempLoadState;
    RecEmbark.Heading := MemberShip.MemberHeading;
    RecEmbark.Speed := MemberShip.MemberSpeed;
    RecEmbark.StateTransport := False;
    RecEmbark.PosX := 0;
    RecEmbark.PosY := 0;
    RecEmbark.IsEmbarkArea := MemberShip.isInDisembarkArea;
//      RecEmbark.IsTurnTable := tempship.isInTurnTable;
    RecEmbark.IsCollision := MemberShip.isMemberCollision;


    simMgrClient.netSend_EmbarkedPlatformData(RecEmbark);
  end;
end;

{$REGION 'Components Update'}
procedure TfrmTransportEmbarkasi.CenterComponents;
var
  differHeightShipToFormTemp  : Integer;
  differWidthShipToFormTemp   : Integer;
  differHeightHullToFormTemp  : Integer;
  differWidthHullToFormTemp   : Integer;
  RampStarboardPos : Integer;
  RampFrontHeight : Integer;
begin
  differHeightShipToFormTemp :=  HullWidth -  IinitFormWidth;
  differWidthShipToFormTemp := HullLength - InitFormLength;

  differHeightHullToFormTemp :=  HullWidth -  IinitFormWidth;
  differWidthHullToFormTemp := HullLength - InitFormLength;

  RampStarboardPos := differWidthHullToFormTemp;
  RampFrontHeight := differHeightHullToFormTemp;

  if (differWidthShipToFormTemp < 0) then
  begin
    differWidthShipToFormTemp := 0;
    differWidthHullToFormTemp := 0;
  end;

  if (differHeightShipToFormTemp < 0) then
  begin
    differHeightShipToFormTemp := 0;
    differHeightHullToFormTemp := 0;
  end;

  {$REGION ' Rezise Panjang & Lebar Form '}
  Height:= Height + differHeightShipToFormTemp;
  if Height < 620 then
    Height := 620;

  Width := Width + differWidthShipToFormTemp;
  if Width < 990 then
    Width := 990;


  {$ENDREGION}

  {$REGION ' Resize Panel Ship Details '}
  pnlShipDetails.Width := pnlShipDetails.Width + (differWidthHullToFormTemp div 2);

  lblShipName.Width := pnlShipDetails.width;
  lblShipClassName.Width := pnlShipDetails.width;
  lblShipMaxWeight.Left := lblShipMaxWeight.Left + (differWidthShipToFormTemp div 4);
  lblShipMaxWeightTitle.Left := lblShipMaxWeightTitle.Left + (differWidthShipToFormTemp div 4);
  lblShipMaxWeightUnit.Left  := lblShipMaxWeightUnit.Left + (differWidthShipToFormTemp div 4);

  lblShipCurrWeight.Left := lblShipCurrWeight.Left + (differWidthShipToFormTemp div 4);
  lblShipCurrWeightTitle.Left := lblShipCurrWeightTitle.Left + (differWidthShipToFormTemp div 4);
  lblShipCurrWeightUnit.Left  := lblShipCurrWeightUnit.Left + (differWidthShipToFormTemp div 4);

  lblShipRemWeight.Left := lblShipRemWeight.Left + (differWidthShipToFormTemp div 4);
  lblShipRemWeightTitle.Left := lblShipRemWeightTitle.Left + (differWidthShipToFormTemp div 4);
  lblShipRemWeightUnit.Left  := lblShipRemWeightUnit.Left + (differWidthShipToFormTemp div 4);

  lblShipLength.Left := lblShipLength.Left + (differWidthShipToFormTemp div 4);
  lblShipLengthTitle.Left := lblShipLengthTitle.Left + (differWidthShipToFormTemp div 4);
  lblShipLengthUnit.Left  := lblShipLengthUnit.Left + (differWidthShipToFormTemp div 4);

  lblShipWidth.Left := lblShipWidth.Left + (differWidthShipToFormTemp div 4);
  lblShipWidthTitle.Left := lblShipWidthTitle.Left + (differWidthShipToFormTemp div 4);
  lblShipWidthUnit.Left  := lblShipWidthUnit.Left + (differWidthShipToFormTemp div 4);

  lblShipArea.Left := lblShipArea.Left + (differWidthShipToFormTemp div 4);
  lblShipAreaTitle.Left := lblShipAreaTitle.Left + (differWidthShipToFormTemp div 4);
  lblShipAreaUnit.Left  := lblShipAreaUnit.Left + (differWidthShipToFormTemp div 4);

  {$ENDREGION}

  {$REGION ' Resize Panel Member Details '}
  lblSelectedPlatform.Width := pnlPlatformDetails.Width;
  lblSelectedPlatformClass.Width := pnlPlatformDetails.Width;

  lblSelectedPlatformLength.Left := lblSelectedPlatformLength.Left + (differWidthShipToFormTemp div 4);
  lblSelectedPlatformLengthTitle.Left := lblSelectedPlatformLengthTitle.Left + (differWidthShipToFormTemp div 4);
  lblSelectedPlatformLengthUnit.Left  := lblSelectedPlatformLengthUnit.Left + (differWidthShipToFormTemp div 4);

  lblSelectedPlatformWidth.Left := lblSelectedPlatformWidth.Left + (differWidthShipToFormTemp div 4);
  lblSelectedPlatformWidthTitle.Left := lblSelectedPlatformWidthTitle.Left + (differWidthShipToFormTemp div 4);
  lblSelectedPlatformWidthUnit.Left  := lblSelectedPlatformWidthUnit.Left + (differWidthShipToFormTemp div 4);

  lblSelectedPlatformArea.Left := lblSelectedPlatformArea.Left + (differWidthShipToFormTemp div 4);
  lblSelectedPlatformAreaTitle.Left := lblSelectedPlatformAreaTitle.Left + (differWidthShipToFormTemp div 4);
  lblSelectedPlatformAreaUnit.Left  := lblSelectedPlatformAreaUnit.Left + (differWidthShipToFormTemp div 4);

  lblPlatformMoveTitle.Left := lblPlatformMoveTitle.Left + (differWidthShipToFormTemp div 4);
  btnMoveForward.Left := btnMoveForward.Left + (differWidthShipToFormTemp div 4);
  btnStop.Left  := btnStop.Left + (differWidthShipToFormTemp div 4);
  btnMoveBackward.Left  := btnMoveBackward.Left + (differWidthShipToFormTemp div 4);

  lblPlatformHeadingTitle.Left := lblPlatformHeadingTitle.Left + (differWidthShipToFormTemp div 4);
  lblPlatformHeading.Left := lblPlatformHeading.Left + (differWidthShipToFormTemp div 4);
  imgTurnTable.Left  := imgTurnTable.Left + (differWidthShipToFormTemp div 4);
  imgArrowRight.Left := imgArrowRight.Left + (differWidthShipToFormTemp div 4);
  imgArrowLeft.Left := imgArrowLeft.Left + (differWidthShipToFormTemp div 4);

  lblPlatformStatus.Left := lblPlatformStatus.Left + (differWidthShipToFormTemp div 4);
  lblPlatformStatusTitle.Left := lblPlatformStatusTitle.Left + (differWidthShipToFormTemp div 4);
  btnReady.Left  := btnReady.Left + (differWidthShipToFormTemp div 4);
  {$ENDREGION}

  {$REGION ' Resize Panel Hull '}
  pnlBottom.Height := pnlBottom.Height + differHeightShipToFormTemp;

  lblIndicator.Width := lblIndicator.Width + differWidthShipToFormTemp;
  lblSelectedRampPosition.Width := pnlBottom.Width;

  {Resize Hull Area}
  pnlImageArea.Height := HullWidth;
  pnlImageArea.Width := HullLength;
  pnlImageArea.Left := Trunc((Width - pnlImageArea.Width)/2);

  {Resize Tinggi Rampa Depan & Belakang}
  pnlFrontRamp.Height := pnlFrontRamp.Height + RampFrontHeight;
  pnlBackRamp.Height := pnlBackRamp.Height + RampFrontHeight;

  {Reposition Semua Rampa}
  pnlBackRamp.Left := pnlImageArea.Left - pnlBackRamp.Width;
  pnlFrontRamp.Left := pnlImageArea.Left + pnlImageArea.Width;

  pnlStarboardRampFront.Left := pnlFrontRamp.Left - 160;
  pnlPortRampFront.Left := pnlFrontRamp.Left - 160;
  pnlStarboardRampBack.Left := pnlBackRamp.Left + 50;
  pnlPortRampBack.Left := pnlBackRamp.Left + 50;

  pnlStarboardRampFront.Top := pnlStarboardRampFront.Top + RampStarboardPos;
  pnlStarboardRampBack.Top := pnlStarboardRampBack.Top + RampStarboardPos;

  lblSelectedRampPosition.Top := lblSelectedRampPosition.Top + differHeightHullToFormTemp;
  btnDisembark.Top := btnDisembark.Top + differHeightShipToFormTemp;
  btnClose.Top := btnClose.Top + differHeightShipToFormTemp;

  btnDisembark.Left := btnDisembark.Left + (differWidthShipToFormTemp div 2);
  btnClose.Left := btnClose.Left + differWidthShipToFormTemp;
  {$ENDREGION}
end;

procedure TfrmTransportEmbarkasi.UpdateComponents;
var
  i : Integer;
  tempRamp : TRamp;
begin
  if Hostship <> nil then
  begin
    lblShipCurrWeight.Caption := FormatFloat('0.##',TT3Vehicle(HostShip).CurrentHullWeight);

    lblShipRemWeight.Caption  := FormatFloat('0.##',(TT3Vehicle(HostShip).UnitCapability.FData.Max_Deck_Weight -
                                                     TT3Vehicle(HostShip).CurrentHullWeight));

    for i := 0 to TT3Vehicle(HostShip).RampList.Count-1 do
    begin
      tempRamp := TT3Vehicle(HostShip).RampList[i];

      case i of
        0: {Depan}
        begin
          if tempRamp.State then
          begin
            pnlFrontRamp.Color := clLime;
          end
          else
          begin
            pnlFrontRamp.Color := clRed;
          end;
        end;
        1: {Kanan}
        begin
          if tempRamp.State then
          begin
            pnlStarboardRampFront.Color := clLime;
            pnlStarboardRampBack.Color := clLime;
          end
          else
          begin
            pnlStarboardRampFront.Color := clRed;
            pnlStarboardRampBack.Color := clRed;
          end;
        end;
        2: {Belakang}
        begin
          if tempRamp.State then
          begin
            pnlBackRamp.Color := clLime;
          end
          else
          begin
            pnlBackRamp.Color := clRed;
          end;
        end;
        3: {Kiri}
        begin
          if tempRamp.State then
          begin
            pnlPortRampFront.Color := clLime;
            pnlPortRampBack.Color := clLime;
          end
          else
          begin
            pnlPortRampFront.Color := clRed;
            pnlPortRampBack.Color := clRed;
          end;
        end;
      end;
    end;


    if FSelectedTransport <> nil then
    begin
      MemberShip:= simMgrClient.FindT3PlatformByID(FSelectedTransport.IDMemberShip) as TT3Vehicle;

      lblPlatformHeading.Caption := (MemberShip.MemberHeading).ToString;
      lblPlatformStatus.Caption := FSelectedTransport.StateMemberShip;
  //    cbbPlatformStatus.ItemIndex := MemberShip.MemberLoadState;

      case MemberShip.MemberPosDisembark of
        0:  lblSelectedRampPosition.Caption := 'Current selected platform is in Front ramp disembark area';
        1:  lblSelectedRampPosition.Caption := 'Current selected platform is in Starboard ramp disembark area';
        2:  lblSelectedRampPosition.Caption := 'Current selected platform is in Back ramp disembark area';
        3:  lblSelectedRampPosition.Caption := 'Current selected platform is in Port ramp disembark area';
        4:  lblSelectedRampPosition.Caption := 'Current selected platform is not in disembark area';
      end;

      if not MemberShip.isInDisembarkArea then
      begin
        btnDisembark.Enabled := False;
        btnReady.Enabled := False;
      end
      else
      begin
        btnDisembark.Enabled := True;
        btnReady.Enabled := True;
      end;
    end;
  end;
end;
{$ENDREGION}
end.
