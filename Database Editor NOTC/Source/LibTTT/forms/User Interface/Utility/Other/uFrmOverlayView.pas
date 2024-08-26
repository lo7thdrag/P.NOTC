unit uFrmOverlayView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmOverlayView = class(TForm)
    ImgBackground: TImage;
    Label4: TLabel;
    lstOverlay: TListBox;
    Label2: TLabel;
    ImgBtnBack: TImage;
    Panel9: TPanel;
    ImgBackgroundList: TImage;
    procedure btnBackClick(Sender: TObject);
    procedure lstOverlayClick(Sender: TObject);
    procedure PurchaseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImgBtnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOverlayView: TfrmOverlayView;

implementation

{$R *.dfm}

procedure TfrmOverlayView.btnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOverlayView.FormShow(Sender: TObject);
begin
//  Label5.Visible := False;
//  btnShowShape.Visible := False;
end;

procedure TfrmOverlayView.ImgBtnBackClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmOverlayView.PurchaseClick(Sender: TObject);
begin
  ShowMessage('Please purchase to enjoy more features');
end;

procedure TfrmOverlayView.lstOverlayClick(Sender: TObject);
begin
  if lstOverlay.ItemIndex = -1 then
    Exit;

//  case lstOverlay.ItemIndex of
//    0: lblIdentifier.Caption := 'Daerah Serbuan Ampibi';
//    1: lblIdentifier.Caption := 'Area Lego Jangkar';
//    2: lblIdentifier.Caption := 'Area Latihan Umum';
//    3: lblIdentifier.Caption := 'Formasi Keluar APBS';
//    4: lblIdentifier.Caption := 'KA CSS-NX-4 Sardine (C-801) TARH SS-Missile)';
//  end;
//
//  if lstOverlay.ItemIndex > 2 then
//    lblType.Caption := 'Dynamic'
//  else
//    lblType.Caption := 'Static';
//
//  Label5.Visible := True;
//  btnShowShape.Visible := True;
end;

end.
