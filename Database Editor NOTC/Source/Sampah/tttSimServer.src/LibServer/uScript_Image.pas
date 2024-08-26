unit uScript_Image;


interface


  procedure BeginGame;
  procedure EndGame;

implementation


uses
  SysUtils,

  uSimSettings,

  uTCP_Common,
  uTCP_Client_Mesh,
  uNetHandler;


procedure BeginGame;
begin
  DateSeparator     := '/';
  TimeSeparator     := ':';
  DecimalSeparator  := '.';
  ThousandSeparator := ',';

  LibSettingFile := getFileSetting;

  LoadFF_NetMeshSetting(LibSettingFile, LibNetMeshSetting);

  NetHandler_image := TNetHandler_image.Create;
end;

procedure EndGame;
begin
  NetHandler_image.Free;
  saveFF_NetMeshSetting(LibSettingFile, LibNetMeshSetting);

  netClient.Free;

end;



end.

