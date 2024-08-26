unit uChangeTorpedoDepth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  uT3Torpedo, uSimMgr_Client, uT3Unit, uGameData_TTT;

type
  TfChangeTorpedoDepth = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblDepth: TLabel;
    lbl3: TLabel;
    lbltrack: TLabel;
    bvl1: TBevel;
    btnCancel: TButton;
    btnOk: TButton;
    EdtNewDepth: TEdit;
    lblInstanceIndex: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fChangeTorpedoDepth: TfChangeTorpedoDepth;

implementation

{$R *.dfm}

procedure TfChangeTorpedoDepth.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfChangeTorpedoDepth.btnOkClick(Sender: TObject);
var
  Altitude  : double;
  pi        : TT3PlatformInstance;
begin

  case TEdit(Sender).Tag of
    0 : TryStrToFloat(edtNewDepth.Text, Altitude);
  end;

  pi := simMgrClient.FindT3PlatformByID(StrToInt(lblInstanceIndex.Caption));
  if Assigned(pi) then
  begin
    SimMgrClient.netSend_CmdPlatform(pi.InstanceIndex,
    CORD_ID_MOVE, CORD_TYPE_ALTITUDE, Altitude);
  end;

  close;
end;

end.
