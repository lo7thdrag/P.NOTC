unit frmLaunchRPCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uGameData_TTT, uSimMgr_Client, uBaseCoordSystem;

type
  TfrmlaunchCountRP = class(TForm)
    btn1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    edtRow: TEdit;
    edtColoumn: TEdit;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
//  posX := 112.91005516;
//  posY := -7.3457011065;
  posX := 114.24640481;
  posY := -7.6806379366;
  rSend.pX := posX;
  rSend.pY := posY;

  for I := 1 to Row do
  begin
    for J := 1 to Coloumn do
    begin
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
      StrToChar('dpn' + IntToStr(I) + IntToStr(J), rSend.TrackIdent);

      rSend.pZ := 0;
      rSend.domain := 0;
      rSend.PHeading := 0;
      rSend.PSpeed := 0;
      rSend.PAltitude := 0;
      rSend.Quantity_Group_Personal := 0;
      simMgrClient.netSend_CmdLaunchRP(rSend);
      Application.ProcessMessages;
      Sleep(100);

      rSend.pX := rSend.pX + 0.025;
    end;
    rSend.pY := rSend.pY + 0.025;
    rSend.pX := posX;

  end;

  Close;
end;

end.
