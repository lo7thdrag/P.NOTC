unit uFrmHullView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, uDBAssetObject, uDBAsset_Deploy, uDrawShipTransport, uDataTypes,
  uSimContainers;

const
  C_SkalaPengali = 3;

type
  TfrmHullView = class(TForm)
    Panel1: TPanel;
    pnlMainShip: TPanel;
    lvTransport: TListView;
    pnlKanan: TPanel;
    pnlKiri: TPanel;
    pnlBawah: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    pnlAtas: TPanel;
    pnlShip: TPanel;
    imgGraph: TImage;
    Panel2: TPanel;
    pnlHistShipName: TPanel;
    pnlBackground: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgGraphMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lvTransportClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
    FDeployment : TAsset_Deployment;
    FResource : TResource_Allocation;

    FHostShip : TPlatform_Instance;
    FSelectedPlatform : TPlatform_Instance;
    FSelectedShape : TMyShape;
    MemberPIOnBoard : TPlatform_Instance;

    FShapeList: TList;
    FAllVehicleOnBoardList : TList;

    procedure UpdateVehicleList;
    procedure DrawShip;

    procedure SetHullSize;

  public
    HostID : Integer;

    property HostShip : TPlatform_Instance read FHostShip write FHostShip;
    property Deployment : TAsset_Deployment read FDeployment write FDeployment;
    property Resource : TResource_Allocation read FResource write FResource;
  end;

var
  frmHullView: TfrmHullView;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

procedure TfrmHullView.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHullView.Button1Click(Sender: TObject);
begin
  if FSelectedShape <> nil then
  begin
    case TButton(sender).Tag of
      0 : FSelectedShape.Heading := 90;
      1 : FSelectedShape.Heading := 270;
      2 : FSelectedShape.Heading := 0;
      3 : FSelectedShape.Heading := 180;
    end;
  end;

  DrawShip;
end;

procedure TfrmHullView.Button2Click(Sender: TObject);
begin
 if FSelectedShape <> nil then
  begin
    case TButton(sender).Tag of
      0 : FSelectedShape.Heading := 90;
      1 : FSelectedShape.Heading := 270;
      2 : FSelectedShape.Heading := 0;
      3 : FSelectedShape.Heading := 180;
    end;
  end;

  DrawShip;
end;

procedure TfrmHullView.Button3Click(Sender: TObject);
begin
      if FSelectedShape <> nil then
  begin
    case TButton(sender).Tag of
      0 : FSelectedShape.Heading := 90;
      1 : FSelectedShape.Heading := 270;
      2 : FSelectedShape.Heading := 0;
      3 : FSelectedShape.Heading := 180;
    end;
  end;

  DrawShip;
end;

procedure TfrmHullView.Button4Click(Sender: TObject);
begin
  if FSelectedShape <> nil then
  begin
    case TButton(sender).Tag of
      0 : FSelectedShape.Heading := 90;
      1 : FSelectedShape.Heading := 270;
      2 : FSelectedShape.Heading := 0;
      3 : FSelectedShape.Heading := 180;
    end;
  end;

  DrawShip;
end;

procedure TfrmHullView.DrawShip;
var
  ship: TMyShape;
begin
  { warnain background dengan warna putih }
  imgGraph.Canvas.Brush.Color := clWhite;
  imgGraph.Canvas.Brush.Style := bsSolid;
  imgGraph.Canvas.FillRect(ClientRect);

  { gambar Shape rectangle }
  for ship in FShapeList do
  begin
    ship.BorderColor := clBlue;
    ship.Draw(imgGraph.Canvas);
  end;
end;

procedure TfrmHullView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FShapeList);
  FreeItemsAndFreeList(FAllVehicleOnBoardList);
end;

procedure TfrmHullView.FormCreate(Sender: TObject);
begin
  FShapeList := TList.Create;
  FAllVehicleOnBoardList := TList.Create;
end;

procedure TfrmHullView.FormShow(Sender: TObject);
begin
  SetHullSize;
  UpdateVehicleList;
end;

procedure TfrmHullView.imgGraphMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  tempPoint : t2DPoint;

begin
  tempPoint.X := X;
  tempPoint.Y := Y;

  if FSelectedShape <> nil then
    FSelectedShape.Center := tempPoint;

  DrawShip;
end;

procedure TfrmHullView.lvTransportClick(Sender: TObject);
var
  i : Integer;
  tempShape: TMyShape;

begin
  FSelectedShape := nil;
  if lvTransport.Selected = nil then
    Exit;

  FSelectedPlatform := TPlatform_Instance(lvTransport.Selected.Data);

  for i := 0 to FShapeList.Count - 1 do
  begin
    tempShape := TMyShape(FShapeList[i]);

    if tempShape.ShipID = FSelectedPlatform.FActivation.Platform_Instance_Index  then
    begin
      FSelectedShape := tempShape;
      Break;
    end;
  end;

end;

procedure TfrmHullView.SetHullSize;
var
  tempWidth : Integer;
  tempLength : Integer;

begin
  tempWidth := trunc(pnlMainShip.Height - (FHostShip.Vehicle.FData.Width * C_SkalaPengali));
  pnlAtas.Height := trunc(tempWidth/ 2);
  pnlBawah.Height := trunc(tempWidth/ 2);

  tempLength := trunc(pnlMainShip.Width - (FHostShip.Vehicle.FData.Length * C_SkalaPengali));
  pnlKiri.Width := trunc(tempLength/ 2);
  pnlKanan.Width := trunc(tempLength/ 2);
end;

procedure TfrmHullView.UpdateVehicleList;
var
  i : Integer;
  tempPI : TPlatform_Instance;

  tempShape: TMyShape;
  tempWidth : Integer;
  tempHeight : Integer;
  tempVelocity : Integer;
  tempHeading : Double;
  tempX, tempY: Integer;

begin
  pnlHistShipName.Caption := HostShip.FData.Instance_Name;

  FShapeList.Clear;

  dmTTT.GetPlatformInstance(Resource.FData.Resource_Alloc_Index,-1, -1, FAllVehicleOnBoardList);

  for i := 0 to FAllVehicleOnBoardList.Count - 1 do
  begin
    tempPI := FAllVehicleOnBoardList.Items[i];

    if tempPI.FData.Platform_Type = 1 then
    begin
      dmTTT.GetVehicleDef(tempPI.FData.Vehicle_Index, tempPI.Vehicle);
      dmTTT.GetMotion_Characteristics(tempPI.Vehicle.FData.Motion_Characteristics, tempPI.Motion);
      dmTTT.GetLogisticDef(tempPI.Vehicle.FData.Logistics_Index, tempPI.Logistic);
      dmTTT.GetTransportDef(tempPI.Vehicle.FData.Platform_Capability_Index, tempPI.Transport);
      dmTTT.GetPlatformActivation(FDeployment.FData.Deployment_Index, tempPI.FData.Platform_Instance_Index, tempPI.FActivation);
    end;

    if tempPI.FActivation.Host_ID = FHostShip.FData.Platform_Instance_Index then
    begin
      with lvTransport.Items.Add do
      begin
        Data := tempPI;
        Caption := IntToStr(i);
        SubItems.Add(TPlatform_Instance(tempPI).FData.Instance_Name);
      end;

      tempWidth := Round(tempPI.Vehicle.FData.Width * C_SkalaPengali);
      tempHeight := Round(tempPI.Vehicle.FData.Height * C_SkalaPengali);
      tempHeading := 90;//tempPI.FActivation.Init_Helm_Angle;
      tempX := Round(tempPI.FActivation.Circle_X);
      tempY := Round(tempPI.FActivation.Circle_Y);

      tempVelocity := 1;

//      tempShape := TMyShape.Create(tempWidth, tempHeight, tempVelocity, tempX, tempY, tempHeading);
      tempShape.ShipID := tempPI.FActivation.Platform_Instance_Index;

      FShapeList.Add(tempShape);

      DrawShip;
    end
    else
      Continue;
  end;
end;

end.
