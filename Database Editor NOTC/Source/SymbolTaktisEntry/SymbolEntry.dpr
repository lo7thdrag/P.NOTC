program SymbolEntry;

uses
  Forms,
  ufMainEntry in 'ufMainEntry.pas' {Form1},
  uDMGC in '..\tttGameController\uDMGC.pas' {DMGC: TDataModule},
  uLibSettingTTT in '..\LibTTT\uLibSettingTTT.pas',
  uIniFilesProcs in '..\SimFramework\LibBaseUtils\uIniFilesProcs.pas',
  uCodecBase64 in '..\SimFramework\LibComponent\Base64\uCodecBase64.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMGC, DMGC);
  LoadFF_dBaseSetting(vSettingFile, vDBSetting);




  Application.CreateForm(TForm1, Form1);

  Application.Run;
end.
