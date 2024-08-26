unit uFrmWaypointView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmWaypointView = class(TForm)
    ImgBackgroundList: TImage;
    ImgBtnBack: TImage;
    ImgBackground: TImage;
    Label4: TLabel;
    lstWaypoint: TListBox;
    Label2: TLabel;
    Panel9: TPanel;
    procedure ImgBtnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWaypointView: TfrmWaypointView;

implementation

{$R *.dfm}

procedure TfrmWaypointView.ImgBtnBackClick(Sender: TObject);
begin
 Close;
end;

end.
