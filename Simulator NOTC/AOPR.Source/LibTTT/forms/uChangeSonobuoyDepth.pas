unit uChangeSonobuoyDepth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  uT3Sonobuoy, uSimMgr_Client, uT3Unit, uGameData_TTT;

type
  TfChangeSonobuoyDepth = class(TForm)
    pnl1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    lbDepth: TLabel;
    Label4: TLabel;
    lbtrack: TLabel;
    Bevel2: TBevel;
    btnCancel: TButton;
    btnOk: TButton;
    edtNewDepth: TEdit;
    Label1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure edOrderAltitudeKeyPress(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fChangeSonobuoyDepth: TfChangeSonobuoyDepth;

implementation

{$R *.dfm}

procedure TfChangeSonobuoyDepth.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfChangeSonobuoyDepth.edOrderAltitudeKeyPress(Sender: TObject);
var
  Altitude  : double;
  pi        : TT3PlatformInstance;
begin

  case TEdit(Sender).Tag of
    0 : TryStrToFloat(edtNewDepth.Text, Altitude);
  end;

  pi := simMgrClient.FindT3PlatformByID(StrToInt(Label1.Caption));
  if Assigned(pi) then
  begin
    TT3Sonobuoy(pi).OrderDepth := Altitude;

    SimMgrClient.netSend_CmdPlatform(pi.InstanceIndex,
    CORD_ID_MOVE, CORD_TYPE_ALTITUDE, Altitude);
  end;

  close;
end;

end.
