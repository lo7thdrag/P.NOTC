unit ufrmLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmLog = class(TForm)
    imgBackground: TImage;
    imgLabel: TImage;
    btnClose: TImage;
    pnlButton: TPanel;
    btnClear: TImage;
    procedure btnCloseClick(Sender: TObject);
    procedure btnMouseEnter(Sender: TObject);
    procedure btnMouseLeave(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLog: TfrmLog;

implementation

{$R *.dfm}

uses

ufrmMain;

procedure TfrmLog.btnClearClick(Sender: TObject);
begin
  MainForm.btnClearLog.Click;
  MainForm.Show;
end;

procedure TfrmLog.btnCloseClick(Sender: TObject);
begin
  MainForm.Width := 557;
  MainForm.Height := 850;
  MainForm.TopPanel.Visible := True;
  MainForm.pnlClose.Visible := True;
  MainForm.Position := poScreenCenter;
  MainForm.Close;
  Close;
end;

procedure TfrmLog.btnMouseEnter(Sender: TObject);
var
  button : TImage;
  tag : Integer;
begin
  button := Sender as TImage;
  tag := button.Tag;

  case tag of
    1:
    begin
      btnClear.Picture.LoadFromFile('Images\' + 'btnClear' + '_Select.png');
    end;
    2:
    begin
      btnClose.Picture.LoadFromFile('Images\' + 'btnClose' + '_Select.png');
    end;
  end;
end;

procedure TfrmLog.btnMouseLeave(Sender: TObject);
var
  button : TImage;
  tag : Integer;
begin
  button := Sender as TImage;
  tag := button.Tag;

  case tag of
    1:
    begin
      btnClear.Picture.LoadFromFile('Images\' + 'btnClear' + '_Normal.png');
    end;
    2:
    begin
      btnClose.Picture.LoadFromFile('Images\' + 'btnClose' + '_Normal.png');
    end;
  end;
end;

end.
