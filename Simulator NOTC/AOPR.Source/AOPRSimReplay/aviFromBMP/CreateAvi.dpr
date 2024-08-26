program CreateAvi;

uses
  Forms,
  AviFromBitmaps in 'AviFromBitmaps.pas',
  CreateAviMain in 'CreateAviMain.pas' {CAviFileForm},
  vfw in 'vfw.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCAviFileForm, CAviFileForm1);
  Application.Run;
end.
