unit uChangeTorpedoCourse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  uT3Torpedo, uSimMgr_Client, uT3Unit, uGameData_TTT;

type
  TfChangeTorpedoCourse = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblCourse: TLabel;
    lbl3: TLabel;
    lbltrack: TLabel;
    bvl1: TBevel;
    btnCancel: TButton;
    btnOk: TButton;
    EdtNewCourse: TEdit;
    lblInstanceIndex: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fChangeTorpedoCourse: TfChangeTorpedoCourse;

implementation

{$R *.dfm}

procedure TfChangeTorpedoCourse.btnCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TfChangeTorpedoCourse.btnOkClick(Sender: TObject);
var
  Course  : double;
  pi        : TT3PlatformInstance;
begin

  case TEdit(Sender).Tag of
    0 : TryStrToFloat(EdtNewCourse.Text, Course);
  end;

  pi := simMgrClient.FindT3PlatformByID(StrToInt(lblInstanceIndex.Caption));
  if Assigned(pi) then
  begin
    SimMgrClient.netSend_CmdPlatform(pi.InstanceIndex,
    CORD_ID_MOVE, CORD_TYPE_COURSE, Course);
  end;

  close;
end;

end.
