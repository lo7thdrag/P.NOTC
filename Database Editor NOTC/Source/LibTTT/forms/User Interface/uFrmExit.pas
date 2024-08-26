unit uFrmExit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmExit = class(TForm)
    ImgBackground: TImage;
    Label1: TLabel;
    btnOk: TImage;
    btnCancel: TImage;
    procedure FormShow(Sender: TObject);
    procedure ImgLogoSensorMouseEnter(Sender: TObject);
    procedure ImgSensorMouseLeave(Sender: TObject);
    procedure ImgWeaponMouseEnter(Sender: TObject);
    procedure ImgWeaponMouseLeave(Sender: TObject);
    procedure ImgOtherMouseEnter(Sender: TObject);
    procedure ImgOtherMouseLeave(Sender: TObject);
    procedure ImgHomeClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    CloseState : Boolean;
  end;

var
  frmExit: TfrmExit;

implementation

{$R *.dfm}

{$Region ' Form Handle '}
procedure TfrmExit.btnCancelClick(Sender: TObject);
begin
  CloseState := False;
  Close;
end;

procedure TfrmExit.btnOkClick(Sender: TObject);
begin
  CloseState := True;
  Close;
end;

procedure TfrmExit.FormShow(Sender: TObject);
begin
  self.BorderStyle := bsNone;
  self.Width := 300;
  self.Height := 150;
end;
{$ENDREGION}

{$Region ' Button Effect Handle '}

procedure TfrmExit.ImgSensorMouseLeave(Sender: TObject);
begin
//  ImgExercise.Picture.LoadFromFile('..\..\AOTC\Exercise_Normal.PNG');
//  ImgLogoExercise.Picture.LoadFromFile('..\..\AOTC\LogoExercise_Normal.PNG');
end;

procedure TfrmExit.ImgHomeClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmExit.ImgLogoSensorMouseEnter(Sender: TObject);
begin
//  ImgExercise.Picture.LoadFromFile('..\..\AOTC\Exercise_Select.PNG');
//  ImgLogoExercise.Picture.LoadFromFile('..\..\AOTC\LogoExercise_Select.PNG');
end;

procedure TfrmExit.ImgWeaponMouseEnter(Sender: TObject);
begin
//  ImgUtility.Picture.LoadFromFile('..\..\AOTC\Utility_Select.PNG');
//  ImgLogoUtility.Picture.LoadFromFile('..\..\AOTC\LogoUtility_Select.PNG');
end;

procedure TfrmExit.ImgWeaponMouseLeave(Sender: TObject);
begin
//  ImgUtility.Picture.LoadFromFile('..\..\AOTC\Utility_Normal.PNG');
//  ImgLogoUtility.Picture.LoadFromFile('..\..\AOTC\LogoUtility_Normal.PNG');
end;

procedure TfrmExit.ImgOtherMouseEnter(Sender: TObject);
begin
//  ImgShutdown.Picture.LoadFromFile('..\..\AOTC\Shutdown_Select.PNG');
//  ImgLogoShutdown.Picture.LoadFromFile('..\..\AOTC\LogoShutdown_Select.PNG');
end;

procedure TfrmExit.ImgOtherMouseLeave(Sender: TObject);
begin
//  ImgShutdown.Picture.LoadFromFile('..\..\AOTC\Shutdown_Normal.PNG');
//  ImgLogoShutdown.Picture.LoadFromFile('..\..\AOTC\LogoShutdown_Normal.PNG');
end;
{$ENDREGION}

end.
