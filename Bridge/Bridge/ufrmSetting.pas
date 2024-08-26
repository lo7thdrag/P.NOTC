unit ufrmSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmSetting = class(TForm)
    imgBackground: TImage;
    edtIP: TEdit;
    imgIPServer: TImage;
    imgGameAddress: TImage;
    imgTBBG1: TImage;
    imgTBBG2: TImage;
    edtGameAddress: TEdit;
    btnSave: TImage;
    btnClose: TImage;
    pnlButton: TPanel;
    procedure btnMouseEnter(Sender: TObject);
    procedure btnMouseLeave(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetting: TfrmSetting;

implementation

{$R *.dfm}
uses ufrmMain;

procedure TfrmSetting.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetting.btnMouseEnter(Sender: TObject);
var
  button : TImage;
  tag : Integer;
begin
  button := Sender as TImage;
  tag := button.Tag;

  case tag of
    1:
    begin
      btnSave.Picture.LoadFromFile('Images\' + 'btnSave' + '_Select.png');
    end;
    2:
    begin
      btnClose.Picture.LoadFromFile('Images\' + 'btnClose' + '_Select.png');
    end;
    end;
  end;

procedure TfrmSetting.btnMouseLeave(Sender: TObject);
var
  button : TImage;
  tag : Integer;
begin
  button := Sender as TImage;
  tag := button.Tag;

  case tag of
    1:
    begin
      btnSave.Picture.LoadFromFile('Images\' + 'btnSave' + '_Normal.png');
    end;
    2:
    begin
      btnClose.Picture.LoadFromFile('Images\' + 'btnClose' + '_Normal.png');
    end;
  end;
end;

procedure TfrmSetting.btnSaveClick(Sender: TObject);
begin
  MainForm.edtSvrIp.Text := edtIP.Text;
  MainForm.edtSvrUdpIp.Text := edtGameAddress.Text;
  Close;
end;

end.
