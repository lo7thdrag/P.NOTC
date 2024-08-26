unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ufrmAdminMainForm, ExtCtrls, uDBEditSetting, {sSkinManager,}
  uUserLogin, jpeg, uDBAsset_UserLogin, uVehicleSelect;

type
  TfrmLoginOld = class(TForm)
    btnLogin: TButton;
    edtUsername: TEdit;
    edtPassword: TEdit;
    pnl1: TPanel;
    //sknmngr1: TsSkinManager;
    lbl1: TLabel;
    lbl2: TLabel;
    bvl3: TBevel;
    bvl4: TBevel;
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbl3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure Animasi(Pilih : Byte);
    procedure Privilege(aNamePrivilege : string);
  public
    { Public declarations }
    UserLogin : TUser_Login;
  end;

var
  frmLoginOld: TfrmLoginOld;


implementation

uses uDataModuleTTT, uLibSettingTTT;

{$R *.dfm}

procedure TfrmLoginOld.Animasi(Pilih: Byte);
Var  i, j, BandingLebar, BandingTinggi,
    myWidth, myHeight: LongInt;
Const Pembagi : LongInt = 200;
begin
  myWidth := frmLoginOld.Width ;
  myHeight := frmLoginOld.Height;
  frmLoginOld.AlphaBlend := True;
  BandingLebar := myWidth Div Pembagi;
  BandingTinggi := myHeight Div Pembagi;
  For i := 1 To Pembagi Do
  Begin
    If Pilih = 1 Then
    Begin
        frmLoginOld.AlphaBlendValue := i + 55;
//        frmLogin.Width := BandingLebar * i;
//        frmLogin.Height := BandingTinggi * i;
    End
    Else
    Begin
        frmLoginOld.AlphaBlendValue := 255 -(i + 55);
//        frmLogin.Width := BandingLebar * (pembagi - i);
//        frmLogin.Height := BandingTinggi * (pembagi - i);
    End;
//        frmLogin.Left := (Screen.Width - frmLogin.Width) div 2;
//        frmLogin.Top:=(Screen.Height - frmLogin.Height) div 2;
//        frmLogin.Show;
  End;
End;

procedure TfrmLoginOld.btn1Click(Sender: TObject);
begin
  frmAdminMainForm.Show;
  frmLoginOld.Hide;
end;

procedure TfrmLoginOld.btnLoginClick(Sender: TObject);
begin
  if dmTTT.GetValidasiUserLogin(edtUsername.Text, edtPassword.Text, UserLogin) then
  begin
    frmAdminMainForm.Show;
    frmLoginOld.Hide;
    Privilege(UserLogin.FData.Privilege);
  end
  else
  begin
    MessageDlg('invalid username or password.. !!', mtError, [mbOK],0)
  end;
end;

procedure TfrmLoginOld.FormCreate(Sender: TObject);
begin
  UserLogin := TUser_Login.Create;
end;

procedure TfrmLoginOld.FormShow(Sender: TObject);
begin
  //sknmngr1.SkinDirectory := vAppDBSetting.SkinPath;
  frmAdminMainForm.cbbThemes.ItemIndex := 15;
  //sknmngr1.SkinName :=  vAppDBSetting.SkinName;
  frmLoginOld.Caption := vAppDBSetting.ProjectName;
  frmAdminMainForm.Caption := vAppDBSetting.ProjectName + ' - Database Editor';
  edtUsername.Text := vAppDBSetting.UserDBEditor;
  edtPassword.Text := vAppDBSetting.PasswordDBEditor;
end;

procedure TfrmLoginOld.lbl3Click(Sender: TObject);
begin
  frmUserLogin.ShowModal;
end;

procedure TfrmLoginOld.Privilege(aNamePrivilege: string);
var
  i : Integer;
begin
  if aNamePrivilege = 'Admin System' then
  begin
     for I := 0 to frmAdminMainForm.MainMenu1.Items.Count - 1 do
    begin
      frmAdminMainForm.MainMenu1.Items[i].Enabled := True;
    end;
    fVehicleSelect.btnNew.Enabled := True;
    fVehicleSelect.btnCopy.Enabled := True;
    fVehicleSelect.btnEdit.Enabled := True;

  end
  else if aNamePrivilege = 'Scenario Builder' then
  begin
    for I := 0 to frmAdminMainForm.MainMenu1.Items.Count - 1 do
    begin
      frmAdminMainForm.MainMenu1.Items[i].Enabled := False;
    end;

    frmAdminMainForm.MainMenu1.Items[9].Enabled := True;
    fVehicleSelect.btnNew.Enabled := False;
    fVehicleSelect.btnCopy.Enabled := False;
    fVehicleSelect.btnEdit.Enabled := False;

  end
  else if aNamePrivilege = 'Data Modifier' then
  begin
    for I := 0 to frmAdminMainForm.MainMenu1.Items.Count - 1 do
    begin
      frmAdminMainForm.MainMenu1.Items[i].Enabled := True;
    end;

    frmAdminMainForm.MainMenu1.Items[8].Enabled := False;
    fVehicleSelect.btnNew.Enabled := True;
    fVehicleSelect.btnCopy.Enabled := True;
    fVehicleSelect.btnEdit.Enabled := True;

  end;

end;

end.
