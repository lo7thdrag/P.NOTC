unit ufDeployMine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmDeployMine = class(TForm)
    grp1: TGroupBox;
    btnPosition: TSpeedButton;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    edtRow: TEdit;
    edtColoumn: TEdit;
    edtPosition: TEdit;
    btnCancel: TButton;
    btnDeploy: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnPositionClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeployClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FMapPositionX: double;
    FMapPositionY: double;
    procedure SetMapPositionX(const Value: double);
    procedure SetMapPositionY(const Value: double);
    { Private declarations }
  public
    { Public declarations }
    IdentNumber : Integer;
    property MapPositionX : double read FMapPositionX write SetMapPositionX;
    property MapPositionY : double read FMapPositionY write SetMapPositionY;
  end;

var
  frmDeployMine: TfrmDeployMine;

implementation

uses  uMapXhandler, tttData, uGameData_TTT, uBaseCoordSystem, uSimMgr_Client,
  ufTacticalDisplay;

{$R *.dfm}

procedure TfrmDeployMine.btnCancelClick(Sender: TObject);
begin
  frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
  Close;
end;

procedure TfrmDeployMine.btnDeployClick(Sender: TObject);
var
  rSend : TRecCmd_LaunchRP;
  I, J, Row, Coloumn: Integer;
  posX, posY : Double;
begin
  Row := StrToInt(edtRow.Text);
  Coloumn := StrToInt(edtColoumn.Text);
  posX := MapPositionX;
  posY := MapPositionY;
  rSend.pX := posX;
  rSend.pY := posY;

  rSend.OrderID := CORD_ID_LAUNCH_MULTI_RUNTIME_PLATFORM;
  rSend.OrderType := CORD_ID_START_SEND_DATA_RUNTIME_PLATFORM;
  rSend.MaxRowIndex := Row;
  rSend.MaxColumnIndex := Coloumn;

  rSend.SessionID := 0;
  rSend.RPPlatformID := 7;
  rSend.NewPlatformID := 0;
  rSend.RPGroupID := 0;
  rSend.ForceDesignation := 3;
  rSend.IDPlatformName := 0;
  rSend.IDPlatformClass := 0;

  StrToChar('', rSend.namePlatform);
  StrToChar('', rSend.nameClass);
  StrToChar('', rSend.VBSClassName);

  StrToChar('Mk 55 Mine', rSend.InstanceName);
  StrToChar('MIN', rSend.TrackIdent);

  rSend.pZ := 0;
  rSend.domain := vhdSubsurface;
  rSend.PHeading := 0;
  rSend.PSpeed := 0;
  rSend.PAltitude := 0;
  rSend.Quantity_Group_Personal := 0;
  simMgrClient.netSend_CmdLaunchRP(rSend);


//  for I := 1 to Row do
//  begin
//    for J := 1 to Coloumn do
//    begin
//      IdentNumber := IdentNumber + 1;
//      rSend.SessionID := 0;
//      rSend.RPPlatformID := 7;
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
//      StrToChar('Mk 55 Mine', rSend.InstanceName);
//      StrToChar('MIN' + IntToStr(IdentNumber){ + I) + IntToStr(J)}, rSend.TrackIdent);
//
//      rSend.pZ := 0;
//      rSend.domain := vhdSubsurface;
//      rSend.PHeading := 0;
//      rSend.PSpeed := 0;
//      rSend.PAltitude := 0;
//      rSend.Quantity_Group_Personal := 0;
//      simMgrClient.netSend_CmdLaunchRP(rSend);
//      Application.ProcessMessages;
//      Sleep(100);
//
//      rSend.pX := rSend.pX + 0.0005;
//    end;
//    rSend.pY := rSend.pY + 0.0005;
//    rSend.pX := posX;
//
//  end;

  Close;
end;

procedure TfrmDeployMine.btnPositionClick(Sender: TObject);
begin
   VSimMap.FMap.CurrentTool := mtDeployMine;
end;

procedure TfrmDeployMine.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VSimMap.FMap.CurrentTool := mtSelectObject;
end;

procedure TfrmDeployMine.FormCreate(Sender: TObject);
begin
  IdentNumber := 0;
end;

procedure TfrmDeployMine.SetMapPositionX(const Value: double);
begin
  FMapPositionX := Value;
  edtPosition.Text := formatDM_longitude(FMapPositionX) + '  '
  + formatDM_latitude(FMapPositionY);
end;

procedure TfrmDeployMine.SetMapPositionY(const Value: double);
begin
  FMapPositionY := Value;
  edtPosition.Text := formatDM_longitude(FMapPositionX) + '  '
  + formatDM_latitude(FMapPositionY);
end;

end.
