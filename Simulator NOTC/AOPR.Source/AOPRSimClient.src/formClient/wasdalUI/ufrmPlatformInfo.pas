unit ufrmPlatformInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ufmOwnShip;

type
  TfrmPlatformInfo = class(TForm)
    fmOwnShip1: TfmOwnShip;
    procedure fmOwnShip1btnLaunchClick(Sender: TObject);
    procedure fmOwnShip1btnLandPlatformClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlatformInfo: TfrmPlatformInfo;

implementation

uses
  uSimMgr_Client, uLaunchPlatform,
  uT3Unit, ufrmGeneraPfTools;

{$R *.dfm}

procedure TfrmPlatformInfo.fmOwnShip1btnLandPlatformClick(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    fmOwnShip1.btnLandPlatformClick(Sender);
  end;
end;

procedure TfrmPlatformInfo.fmOwnShip1btnLaunchClick(Sender: TObject);
begin
  if Assigned(simMgrClient.ControlledPlatform) then
  begin
    if not Assigned(frmLaunchPlaform) then
      frmLaunchPlaform := TfrmLaunchPlaform.Create(self);

    frmLaunchPlaform.PlatformInst := TT3PlatformInstance(simMgrClient.ControlledPlatform);
    frmLaunchPlaform.FormStyle := fsStayOnTop;
    frmLaunchPlaform.Show;
  end;
end;

procedure TfrmPlatformInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;

  if Assigned(frmGeneralPfTools) then
    frmGeneralPfTools.btnInfo.Down := False;
end;

procedure TfrmPlatformInfo.FormCreate(Sender: TObject);
begin
  fmOwnShip1.InitCreate(self);

  if simMgrClient.ISWasdal then
  begin
    fmOwnShip1.btnLaunch.Visible := False;
    fmOwnShip1.btnLandPlatform.Visible := False;
  end;
end;

end.
