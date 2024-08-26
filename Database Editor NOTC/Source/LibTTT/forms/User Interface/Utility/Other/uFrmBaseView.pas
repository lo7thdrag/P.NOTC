unit uFrmBaseView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmBaseView = class(TForm)
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    ImgBackground: TImage;
    Label4: TLabel;
    lstBase: TListBox;
    Label2: TLabel;
    procedure ImgBtnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseView: TfrmBaseView;

implementation

{$R *.dfm}

procedure TfrmBaseView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

end.
