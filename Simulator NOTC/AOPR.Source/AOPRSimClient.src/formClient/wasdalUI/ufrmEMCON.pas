unit ufrmEMCON;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ufmEMCON, uT3Unit, uT3Vehicle;

type
  TfrmEMCON = class(TForm)
    fmEMCON1: TfmEMCON;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetControlledObject(pit : TT3PlatformInstance);
  end;

var
  frmEMCON: TfrmEMCON;

implementation

uses ufrmGeneraPfTools;

{$R *.dfm}

procedure TfrmEMCON.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;

  if Assigned(frmGeneralPfTools) then
    frmGeneralPfTools.btnEMCON.Down := False;

end;

procedure TfrmEMCON.SetControlledObject(pit: TT3PlatformInstance);
begin
  if pit is TT3Vehicle then
  begin
    frmEMCON.Caption := 'EMCON ' + pit.InstanceName;
  end;
end;

end.
