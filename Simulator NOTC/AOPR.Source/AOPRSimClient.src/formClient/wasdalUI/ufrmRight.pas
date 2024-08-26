unit ufrmRight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Vcl.StdCtrls;

type
  TfrmRight = class(TForm)
    pnlTitle: TPanel;
    pnlContainer: TPanel;
    lblTitle: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CreateAllRightForms;
  public
    { Public declarations }

    procedure ShowMapTools;
    procedure ShowPlatformTools;
    procedure ShowTools;
    procedure ShowPlatformInfo;
    procedure ShowHelp;
    procedure ShowViewWasdal;

  end;

var
  frmRight: TfrmRight;

implementation

uses
  ufrmMapTools, ufrmPlatformTools, ufrmTools, ufrmGeneraPfTools, ufrmHelp, ufrmViewWasdal;

{$R *.dfm}

{ TfrmRight }

const
  cWidth = 186;

procedure TfrmRight.CreateAllRightForms;
begin
  Width := cWidth;

  frmMapTools := TfrmMapTools.Create(nil);
  frmMapTools.Parent := pnlContainer;
  frmMapTools.Align := alClient;
  frmMapTools.Show;

  frmPlatformTools := TfrmPlatformTools.Create(nil);
  frmPlatformTools.Parent := pnlContainer;
  frmPlatformTools.Align := alClient;

  frmTools := TfrmTools.Create(nil);
  frmTools.Parent := pnlContainer;
  frmTools.Align := alClient;

  frmGeneralPfTools := TfrmGeneralPfTools.Create(nil);
  frmGeneralPfTools.Parent := pnlContainer;
  frmGeneralPfTools.Align := alClient;

  frmHelp := TfrmHelp.Create(nil);
  frmHelp.Parent := pnlContainer;
  frmHelp.Align := alClient;

  frmViewWasdal := TfrmViewWasdal.Create(nil);
  frmViewWasdal.Parent := pnlContainer;
  frmViewWasdal.Align := alClient;

end;

procedure TfrmRight.FormCreate(Sender: TObject);
begin
  CreateAllRightForms;
//  pnlTitle.Caption := 'MAP UTILITY';
  lblTitle.Caption := 'MAP UTILITY';
  pnlTitle.Font.Size := 12;
end;

procedure TfrmRight.ShowHelp;
begin
//  pnlTitle.Caption := 'HELP';
  lblTitle.Caption := 'HELP';

  frmPlatformTools.Hide;
  frmTools.Hide;
  frmGeneralPfTools.Hide;
  frmMapTools.Hide;
  frmHelp.Show;
  frmViewWasdal.Hide;
end;

procedure TfrmRight.ShowViewWasdal;
begin
//  pnlTitle.Caption := 'VIEW';
  lblTitle.Caption := 'VIEW';

  frmPlatformTools.Hide;
  frmTools.Hide;
  frmGeneralPfTools.Hide;
  frmMapTools.Hide;
  frmHelp.Hide;
  frmViewWasdal.Show;
end;

procedure TfrmRight.ShowMapTools;
begin
//  pnlTitle.Caption := 'MAP UTILITY';
  lblTitle.Caption := 'MAP UTILITY';

  frmPlatformTools.Hide;
  frmTools.Hide;
  frmGeneralPfTools.Hide;
  frmMapTools.Show;
  frmHelp.Hide;
  frmViewWasdal.Hide;
end;

procedure TfrmRight.ShowPlatformInfo;
begin
//  pnlTitle.Caption := 'PLATFORM' + #13#10 + 'CONTROL';
  lblTitle.Caption := 'PLATFORM CONTROL';

  frmPlatformTools.Hide;
  frmTools.Hide;
  frmMapTools.Hide;
  frmGeneralPfTools.Show;
  frmGeneralPfTools.btnTransferLog.Hide;
  frmGeneralPfTools.btnFullScreen.Top := 647;
  frmGeneralPfTools.btnWindowedScreen.Top := 647;
  frmHelp.Hide;
  frmViewWasdal.Hide;
end;

procedure TfrmRight.ShowPlatformTools;
begin
//  pnlTitle.Caption := 'PLATFORM' + sLineBreak + 'TOOLS';
  lblTitle.Caption := 'PLATFORM TOOLS';

  frmTools.Hide;
  frmMapTools.Hide;
  frmGeneralPfTools.Hide;
  frmPlatformTools.Show;
  frmHelp.Hide;
  frmViewWasdal.Hide;
end;

procedure TfrmRight.ShowTools;
begin
//  pnlTitle.Caption := 'TOOLS';
  lblTitle.Caption := 'TOOLS';

  frmMapTools.Hide;
  frmGeneralPfTools.Hide;
  frmPlatformTools.Hide;
  frmTools.Show;
  frmHelp.Hide;
  frmViewWasdal.Hide;
end;

end.
