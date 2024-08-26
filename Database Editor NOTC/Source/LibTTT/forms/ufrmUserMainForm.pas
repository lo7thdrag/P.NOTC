unit ufrmUserMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmUserMainForm = class(TForm)
    ImgBackground: TImage;
    LogoImgExercise: TImage;
    LogoImgUtility: TImage;
    LogoImgShutdown: TImage;
    ImgExercise: TImage;
    ImgUtility: TImage;
    ImgShutdown: TImage;
    LogoImgLogin: TImage;
    ImgLogin: TImage;

    procedure FormShow(Sender: TObject);

    procedure ImgUtilityClick(Sender: TObject);
    procedure ImgShutdownClick(Sender: TObject);
    procedure ImgExerciseClick(Sender: TObject);
    procedure ImgLoginClick(Sender: TObject);

    procedure IconMenuMouseEnter(Sender: TObject);
    procedure IconMenuMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    isShutdown : Boolean;
    isLogin : Boolean;
    iconName : string;
    filePath, imgChoice : string;

    procedure IconLoad;

  public
    { Public declarations }
  end;

var
  frmUserMainForm: TfrmUserMainForm;

implementation

uses
  uFrmLogin, uFrmUtility, uFrmExercise, uFrmExit, ufrmNewAdminMainForm;

{$R *.dfm}

{$Region ' Form Handle '}

procedure TfrmUserMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmUserMainForm.FormShow(Sender: TObject);
begin
//  self.BorderStyle := bsNone;
  self.Width := 1300;//1485;
  self.Height := 700;//800;
end;

{$ENDREGION}

{$Region ' Button Handle '}

procedure TfrmUserMainForm.ImgExerciseClick(Sender: TObject);
begin
  frmExercise := TfrmExercise.Create(Self);
  try
    frmExercise.ShowModal;
  finally
    frmExercise.Free;
  end;
end;

procedure TfrmUserMainForm.ImgUtilityClick(Sender: TObject);
begin
  Hide;

  frmUtility := TfrmUtility.Create(Self);
  try
    frmUtility.ShowModal;
  finally
    frmUtility.Free;
  end;

  Show;
end;

procedure TfrmUserMainForm.ImgLoginClick(Sender: TObject);
begin

  with frmLogin do
  begin
    ShowModal;
    isLogin := CloseState;
  end;

  if isLogin then
  begin
    Self.Hide;

    frmNewAdminMainForm := TfrmNewAdminMainForm.Create(Self);
    try
      frmNewAdminMainForm.ShowModal;
    finally
      frmNewAdminMainForm.Free;
    end;

    Self.Show;
  end;
end;

procedure TfrmUserMainForm.ImgShutdownClick(Sender: TObject);
begin
  frmExit := TfrmExit.Create(Self);
  try
    with frmExit do
    begin
      ShowModal;
      isShutdown := CloseState;
    end;
  finally
    frmExit.Free;
  end;

  if isShutdown then
    Close;
end;

{$ENDREGION}

{$Region ' Button Hover Handle '}

procedure TfrmUserMainForm.IconMenuMouseEnter(Sender: TObject);
begin
  iconName := TImage(sender).Name;
  filePath := 'data\Image DBEditor\Interface\';
  imgChoice := '_Select.PNG';

  IconLoad;
end;

procedure TfrmUserMainForm.IconMenuMouseLeave(Sender: TObject);
begin
  iconName := TImage(sender).Name;
  filePath := 'data\Image DBEditor\Interface\';
  imgChoice := '_Normal.PNG';

  IconLoad;
end;

procedure TfrmUserMainForm.IconLoad;
begin
  if (iconName = 'ImgExercise') or (iconName = 'LogoImgExercise') then
  begin
    ImgExercise.Picture.LoadFromFile(filePath + 'ImgExercise' + imgChoice);
    LogoImgExercise.Picture.LoadFromFile(filePath + 'LogoImgExercise' + imgChoice);
  end
  else if (iconName = 'ImgUtility') or  (iconName = 'LogoImgUtility') then
  begin
    ImgUtility.Picture.LoadFromFile(filePath + 'ImgUtility' + imgChoice);
    LogoImgUtility.Picture.LoadFromFile(filePath + 'LogoImgUtility' + imgChoice);
  end
  else if (iconName = 'ImgShutdown') or  (iconName = 'LogoImgShutdown') then
  begin
    ImgShutdown.Picture.LoadFromFile(filePath + 'ImgShutdown' + imgChoice);
    LogoImgShutdown.Picture.LoadFromFile(filePath + 'LogoImgShutdown' + imgChoice);
  end
  else if (iconName = 'ImgLogin') or  (iconName = 'LogoImgLogin') then
  begin
    ImgLogin.Picture.LoadFromFile(filePath + 'ImgLogin' + imgChoice);
    LogoImgLogin.Picture.LoadFromFile(filePath + 'LogoImgLogin' + imgChoice);
  end;
end;


{$ENDREGION}

end.
