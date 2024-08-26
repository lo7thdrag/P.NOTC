unit ufrmLaunchRPCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uGameData_TTT, uSimMgr_Client, uBaseCoordSystem, Buttons,
  uMapXHandler, tttData;

type
  TfrmlaunchCountRP = class(TForm)
    btn1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    edtRow: TEdit;
    edtColoumn: TEdit;
    edtPos: TEdit;
    lblPos: TLabel;
    btnPos: TSpeedButton;
    btnCancel: TButton;
    lblHeading: TLabel;
    edtHeading: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btnPosClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FMapPositionX: double;
    FMapPositionY: double;
    procedure SetMapPositionX(const Value: double);
    procedure SetMapPositionY(const Value: double);
    { Private declarations }
  public
    { Public declarations }
    property MapPositionX : double read FMapPositionX write SetMapPositionX;
    property MapPositionY : double read FMapPositionY write SetMapPositionY;
  end;

var
  frmlaunchCountRP: TfrmlaunchCountRP;

implementation

{$R *.dfm}

procedure TfrmlaunchCountRP.btn1Click(Sender: TObject);
var
  rSend : TRecCmd_LaunchRP;
  I, J, Row, Coloumn: Integer;
  posX, posY : Double;
begin
  Row := StrToInt(edtRow.Text);
  Coloumn := StrToInt(edtColoumn.Text);

  posX := FMapPositionX;
  posY := FMapPositionY;

  rSend.pX := posX;
  rSend.pY := posY;

  rSend.OrderID := CORD_ID_LAUNCH_MULTI_RUNTIME_PLATFORM;
  rSend.OrderType := CORD_ID_START_SEND_DATA_RUNTIME_PLATFORM;
  rSend.MaxRowIndex := Row;
  rSend.MaxColumnIndex := Coloumn;
  rSend.SessionID := 0;
  rSend.RPPlatformID := 522;
  rSend.NewPlatformID := 0;
  rSend.RPGroupID := 0;
  rSend.ForceDesignation := 3;
  rSend.IDPlatformName := 0;
  rSend.IDPlatformClass := 0;

  StrToChar('', rSend.namePlatform);
  StrToChar('', rSend.nameClass);
  StrToChar('', rSend.VBSClassName);

  StrToChar('Indonesia - Diponegoro Sigma Class', rSend.InstanceName);
  StrToChar('DPN', rSend.TrackIdent);

  rSend.pZ := 0;
  rSend.domain := 0;
  rSend.PHeading := StrToFloat(edtHeading.Text);
  rSend.PSpeed := 0;
  rSend.PAltitude := 0;
  rSend.Quantity_Group_Personal := 0;
  simMgrClient.netSend_CmdLaunchRP(rSend);

//  for I := 1 to Row do
//  begin
//    for J := 1 to Coloumn do
//    begin
//      rSend.SessionID := 0;
//      rSend.RPPlatformID := 522;
//      rSend.NewPlatformID := 0;
//      rSend.RPGroupID := 0;
//      rSend.ForceDesignation := 3;
//      rSend.IDPlatformName := 0;
//      rSend.IDPlatformClass := 0;
//
//      StrToChar('', rSend.namePlatform);
//      StrToChar('', rSend.nameClass);
//      StrToChar('', rSend.VBSClassName);
//
//      StrToChar('Indonesia - Diponegoro Sigma Class', rSend.InstanceName);
//      StrToChar('dpn' + IntToStr(I) + IntToStr(J), rSend.TrackIdent);
//
//      rSend.pZ := 0;
//      rSend.domain := 0;
//      rSend.PHeading := 0;
//      rSend.PSpeed := 0;
//      rSend.PAltitude := 0;
//      rSend.Quantity_Group_Personal := 0;
//      simMgrClient.netSend_CmdLaunchRP(rSend);
//      Application.ProcessMessages;
//      //Sleep(100);
//
//      rSend.pX := rSend.pX + 0.025;
//    end;
//    rSend.pY := rSend.pY + 0.025;
//    rSend.pX := posX;
//
//  end;

  Close;
end;

procedure TfrmlaunchCountRP.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmlaunchCountRP.btnPosClick(Sender: TObject);
begin
  VSimMap.FMap.CurrentTool := mtDeployPosition;
end;

procedure TfrmlaunchCountRP.SetMapPositionX(const Value: double);
begin
  FMapPositionX := Value;

  edtPos.Text := formatDM_longitude(FMapPositionX) + '  '
                      + formatDM_latitude(FMapPositionY);
end;

procedure TfrmlaunchCountRP.SetMapPositionY(const Value: double);
begin
  FMapPositionY := Value;

  edtPos.Text := formatDM_longitude(FMapPositionX) + '  '
  + formatDM_latitude(FMapPositionY);
end;

end.
