unit uAdministrator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmAdministrator = class(TForm)
    lvUserLogin: TListView;
    btnEdit: TButton;
    btnClose: TButton;
    btnNew: TButton;
    btnRemove: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
    UserLoginList : TList;

  public
    { Public declarations }
    procedure refresh;
  end;

var
  frmAdministrator: TfrmAdministrator;

implementation

uses uDataModuleTTT, uDBAsset_UserLogin, uUserLogin;

{$R *.dfm}

procedure TfrmAdministrator.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAdministrator.btnEditClick(Sender: TObject);
begin
  frmUserLogin.UserLogin := TUser_Login.Create;
  frmUserLogin.UserLogin := TUser_Login(lvUserLogin.Selected.Data);
  frmUserLogin.isNew := False;
  frmUserLogin.ShowModal;
end;

procedure TfrmAdministrator.btnNewClick(Sender: TObject);
begin
  frmUserLogin.isNew := True;
  frmUserLogin.ShowModal;
end;

procedure TfrmAdministrator.btnRemoveClick(Sender: TObject);
var
  aUserLogin : TUser_Login;
begin
  aUserLogin := TUser_Login.Create;
  aUserLogin := TUser_Login(lvUserLogin.Selected.Data);
  dmTTT.DeleteUserLogin(aUserLogin.FData.Login_index);
  refresh;
end;

procedure TfrmAdministrator.FormCreate(Sender: TObject);
begin
  UserLoginList := TList.Create;
end;

procedure TfrmAdministrator.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfrmAdministrator.refresh;
var
  i : Integer;
  aUserLogin : TUser_Login;
begin
  lvUserLogin.Items.Clear;

  dmTTT.GetAllUserLogin(UserLoginList);

  aUserLogin := TUser_Login.Create;

  for I := 0 to UserLoginList.Count - 1 do
  begin
    aUserLogin := TUser_Login(UserLoginList.Items[i]);
    with lvUserLogin.Items.Add do
    begin
      Data := UserLoginList.Items[i];
      Caption := aUserLogin.FData.Name;
      SubItems.Add(aUserLogin.FData.Username);
      SubItems.Add(aUserLogin.FData.Password);
      SubItems.Add(aUserLogin.FData.Privilege);
    end;
  end;

end;

end.
