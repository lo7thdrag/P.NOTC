unit uFrmPlottingView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmPlottingView = class(TForm)
    ImgBackground: TImage;
    lstPlotting: TListBox;
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    Label2: TLabel;
    Panel9: TPanel;
    Label4: TLabel;
    procedure ImgBtnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlottingView: TfrmPlottingView;

implementation

{$R *.dfm}

procedure TfrmPlottingView.ImgBtnBackClick(Sender: TObject);
begin
  Close;
end;

end.
