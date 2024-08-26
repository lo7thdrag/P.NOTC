unit ufrmViewWasdal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzBmpBtn;

type
  TfrmViewWasdal = class(TForm)
    btnToteDisplay: TRzBmpButton;
    btnFullScreen: TRzBmpButton;
    btnRotateScreen: TRzBmpButton;
    btnWindowedScreen: TRzBmpButton;
    procedure btnToteDisplayClick(Sender: TObject);
    procedure btnToolBtnSlideClick(Sender: TObject);
    procedure btnFullScreenClick(Sender: TObject);
    procedure btnRotateScreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnWindowedScreenClick(Sender: TObject);
  private
    { Private declarations }
    AModeMonitor : integer;
    procedure FlipMonitor;
  public
    { Public declarations }
  end;

var
  frmViewWasdal: TfrmViewWasdal;

implementation

uses
  ufTacticalDisplay, uSlidingTrans, ufrmTop, uRotateMonitor;

{$R *.dfm}

procedure TfrmViewWasdal.btnFullScreenClick(Sender: TObject);
begin
  frmTacticalDisplay.hideBottomPanel(sender);
  frmTop.hideTopPanel(sender);
end;

procedure TfrmViewWasdal.btnWindowedScreenClick(Sender: TObject);
begin
  frmTacticalDisplay.hideBottomPanel(sender);
  frmTop.hideTopPanel(sender);
end;

procedure TfrmViewWasdal.btnRotateScreenClick(Sender: TObject);
begin
  FlipMonitor;
end;

procedure TfrmViewWasdal.btnToolBtnSlideClick(Sender: TObject);
begin
  VSlidingTrans.ShowHideBtnProc;
end;

procedure TfrmViewWasdal.btnToteDisplayClick(Sender: TObject);
begin
  frmTacticalDisplay.btnToolBtnSlideClick(nil);
end;

procedure TfrmViewWasdal.FlipMonitor;
begin
  if AModeMonitor = 3 then
    AModeMonitor := 1
  else
    AModeMonitor := 3;

  frmRotateMonitor.BtnSelectMode(AModeMonitor);
end;

procedure TfrmViewWasdal.FormCreate(Sender: TObject);
begin
  AModeMonitor := 1;
end;

end.
