program AOPRRClient;

uses
  Forms,
  uRemoteClient in 'uRemoteClient.pas' {frmRemoteClient},
  uRemoteHost in 'uRemoteHost.pas' {frmRemoteHost},
  uRemoteData in 'uRemoteData.pas',
  ZLibEx in '..\SimFramework\LibComponent\ZLibEx\ZLibEx.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRemoteClient, frmRemoteClient);
  Application.Run;
end.
