unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  uDBAsset_UserLogin;

type
  TfrmLogin = class(TForm)
    ImgBackground: TImage;
    Label1: TLabel;
    btnOk: TImage;
    btnCancel: TImage;
    Label2: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
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
    UserLogin : TUser_Login;
    CloseState : Boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  uDataModuleTTT, ufrmAdminMainForm;

{$R *.dfm}

{$Region ' Form Handle '}
procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  CloseState := False;
  Close;
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
begin
//  if dmTTT.GetValidasiUserLogin(edtUsername.Text, edtPassword.Text, UserLogin) then
//  begin
    frmAdminMainForm.Show;
//  end
//  else
//  begin
//    MessageDlg('invalid username or password.. !!', mtError, [mbOK],0)
//  end;

  CloseState := True;
  Close;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  self.BorderStyle := bsNone;
  self.Width := 300;
  self.Height := 350;
end;
{$ENDREGION}

{$Region ' Button Effect Handle '}

procedure TfrmLogin.ImgSensorMouseLeave(Sender: TObject);
begin
//  ImgExercise.Picture.LoadFromFile('..\..\AOTC\Exercise_Normal.PNG');
//  ImgLogoExercise.Picture.LoadFromFile('..\..\AOTC\LogoExercise_Normal.PNG');
end;

procedure TfrmLogin.ImgHomeClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.ImgLogoSensorMouseEnter(Sender: TObject);
begin
//  ImgExercise.Picture.LoadFromFile('..\..\AOTC\Exercise_Select.PNG');
//  ImgLogoExercise.Picture.LoadFromFile('..\..\AOTC\LogoExercise_Select.PNG');
end;

procedure TfrmLogin.ImgWeaponMouseEnter(Sender: TObject);
begin
//  ImgUtility.Picture.LoadFromFile('..\..\AOTC\Utility_Select.PNG');
//  ImgLogoUtility.Picture.LoadFromFile('..\..\AOTC\LogoUtility_Select.PNG');
end;

procedure TfrmLogin.ImgWeaponMouseLeave(Sender: TObject);
begin
//  ImgUtility.Picture.LoadFromFile('..\..\AOTC\Utility_Normal.PNG');
//  ImgLogoUtility.Picture.LoadFromFile('..\..\AOTC\LogoUtility_Normal.PNG');
end;

procedure TfrmLogin.ImgOtherMouseEnter(Sender: TObject);
begin
//  ImgShutdown.Picture.LoadFromFile('..\..\AOTC\Shutdown_Select.PNG');
//  ImgLogoShutdown.Picture.LoadFromFile('..\..\AOTC\LogoShutdown_Select.PNG');
end;

procedure TfrmLogin.ImgOtherMouseLeave(Sender: TObject);
begin
//  ImgShutdown.Picture.LoadFromFile('..\..\AOTC\Shutdown_Normal.PNG');
//  ImgLogoShutdown.Picture.LoadFromFile('..\..\AOTC\LogoShutdown_Normal.PNG');
end;
{$ENDREGION}

end.
