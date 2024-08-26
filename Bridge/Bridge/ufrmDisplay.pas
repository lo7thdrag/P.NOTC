unit ufrmDisplay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TfrmDisplay = class(TForm)
    pnlMain: TPanel;
    imgBackground: TImage;
    btnSetting: TImage;
    pnlButton: TPanel;
    imgShowOldForm: TImage;
    btnStart: TImage;
    btnLog: TImage;
    imgClose: TImage;
    btnStop: TImage;
    procedure FormResize(Sender: TObject);
    procedure imgShowOldFormClick(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
    procedure btnMouseEnter(Sender: TObject);
    procedure btnMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure Start3D;
  private
    { Private declarations }
  public
    { Public declarations }
    resize : Integer;
  end;

var
  frmDisplay: TfrmDisplay;

implementation

{$R *.dfm}

uses ufrmMain, ufrmSetting, ufrmLog, ShellApi, uDataRec;

procedure TfrmDisplay.btnLogClick(Sender: TObject);
begin
  MainForm.Width := 1000;
  MainForm.Height := 400;
  MainForm.pnlClose.Visible := False;
  MainForm.TopPanel.Visible := False;
  MainForm.Position := poScreenCenter;
  frmLog.Show;
  MainForm.Show;
end;

procedure TfrmDisplay.btnMouseEnter(Sender: TObject);
var
  button : TImage;
  tag : Integer;
begin
  button := Sender as TImage;
  tag := button.Tag;

  case tag of
    1:
    begin
      btnStart.Picture.LoadFromFile('Images\' + 'btnStart' + '_Select.png');
    end;
    2:
    begin
      btnSetting.Picture.LoadFromFile('Images\' + 'btnSetting' + '_Select.png');
    end;
    3:
    begin
      btnLog.Picture.LoadFromFile('Images\' + 'btnLog' + '_Select.png');
    end;
    4:
    begin
      btnStop.Picture.LoadFromFile('Images\' + 'btnStop' + '_Select.png');
    end;
  end;
end;

procedure TfrmDisplay.btnMouseLeave(Sender: TObject);
var
  button : TImage;
  tag : Integer;
begin
  button := Sender as TImage;
  tag := button.Tag;

  case tag of
    1:
    begin
      btnStart.Picture.LoadFromFile('Images\' + 'btnStart' + '_Normal.png');
    end;
    2:
    begin
      btnSetting.Picture.LoadFromFile('Images\' + 'btnSetting' + '_Normal.png');
    end;
    3:
    begin
      btnLog.Picture.LoadFromFile('Images\' + 'btnLog' + '_Normal.png');
    end;
    4:
    begin
      btnStop.Picture.LoadFromFile('Images\' + 'btnStop' + '_Normal.png');
    end;
  end;
end;

procedure TfrmDisplay.btnSettingClick(Sender: TObject);
begin
  frmSetting.Show;
end;

procedure TfrmDisplay.btnStartClick(Sender: TObject);
begin
  MainForm.ListenButton.Click;
  btnStart.Visible := False;
  Start3D;
end;

procedure TfrmDisplay.btnStopClick(Sender: TObject);
var
  r : TRecSessionState;
begin
  r.SessionID := 0;
  r.Order := CID_DESTROY;
  r.SessionType := 0;
  r.ScenarioID := 0;
  r.SessionStat := 0;
  r.GPMType := 0;

  MainForm.NetRecv_SessionStateLocal(@r, CPID_SESSIONSTATE);
//  MainForm.TestPause;

  MainForm.ListenButton.Click;
  btnStart.Visible := True;
end;

procedure TfrmDisplay.FormCreate(Sender: TObject);
begin
  resize := 0;
end;

procedure TfrmDisplay.FormResize(Sender: TObject);
begin
  if resize <> 1 then
  begin
    pnlButton.Left := pnlButton.Left + ((pnlMain.Width - 1051) div 2);
    pnlButton.Top := pnlButton.Top + ((pnlMain.Height - 746) div 2);
    imgShowOldForm.Top := imgShowOldForm.Top + (pnlMain.Height - 746);
    imgClose.Left := imgClose.Left + (pnlMain.Width - 1051);
  end;
  resize := 1;
end;

procedure TfrmDisplay.imgCloseClick(Sender: TObject);
var
  i : Integer;
  screens : Integer;
begin
    Close;
end;

procedure TfrmDisplay.imgShowOldFormClick(Sender: TObject);
begin
  MainForm.ShowModal;
end;

procedure TfrmDisplay.Start3D;
begin
  ShellExecute(0, 'open', ('D:\NOTC\NOTC.exe'), nil, nil, SW_SHOW);
end;

end.
