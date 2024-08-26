unit uDBEditSetting;

interface

type
  TDBEditorSetting = record
    MapSourcePathENC      : string;   //D:\TTT\mapsource\coverageArea
    MapSourceGeosetENC    : string;   //D:\TTT\mapsource\coverage\AreaCoverage.gst
    MapDestPathENC        : string;   //M:\map\mapsea

    MapSourcePathVECT     : string;   //D:\TTT\mapsource\map
    MapSourceGeosetVECT   : string;   //D:\TTT\mapsource\map\world.gst
    MapDestPathVECT       : string;   //M:\map\game_area

    MapENC                : string;   //D:\TTT\map\mapsea

    OverlayPath           : string;   //M:\map\overlay
    OverlayDestination        : string;
    OverlayClientPath     : string;   //D:\OverlayClient\
    PlottingPath          : string;
  end;

  function LoadFF_AppDBSetting(const fName: string; var dbEditSett: TDBEditorSetting): boolean;

var
  vAppDBSetting         : TDBEditorSetting;

implementation

  uses

 Classes, IniFiles, SysUtils, uIniFilesProcs;

function LoadFF_AppDBSetting(const fName: string; var dbEditSett: TDBEditorSetting): boolean;
const
  c_appsetting = 'dbeditor';
var
  IniF: TIniFile;
  s: string;
begin
  IniF := TIniFile.Create(fName);
  s := ExtractFilePath(ParamStr(0));

  with dbEditSett do
  begin
    MapSourcePathENC      := IniFReadstring(inif, c_appsetting, 'MapSourcePathENC', 'D:\TTT\mapsource\coverageArea' );
    MapSourceGeosetENC    := IniFReadstring(inif, c_appsetting, 'MapSourceGeosetENC', 'D:\TTT\mapsource\coverage\AreaCoverage.gst' );

    MapSourcePathVECT     := IniFReadstring(inif, c_appsetting, 'MapSourcePathVECT', 'D:\TTT\mapsource\map' );
    MapSourceGeosetVECT   := IniFReadstring(inif, c_appsetting, 'MapSourceGeosetVECT', 'D:\TTT\mapsource\map\world.gst' );

    MapDestPathENC        := IniFReadstring(inif, c_appsetting, 'MapDestPathENC', 'M:\map\mapsea' );
    MapDestPathVECT       := IniFReadstring(inif, c_appsetting, 'MapDestPathVECT', 'M:\map\game_area' );
    MapENC                := IniFReadstring(inif, c_appsetting, 'MapENC', 'D:\TTT\map\mapsea' );

    OverlayPath           := IniFReadstring(inif, c_appsetting, 'OverlayPath', 'M:\map\map\overlay' );
    OverlayDestination        := IniFReadstring(inif, c_appsetting, 'OverlayPathDes', '\\192.168.1.202\Map\Map\overlay' );
    PlottingPath          := INIFReadString(inif, c_appsetting, 'PlottingPath', 'M:\map\PlottingPath' )
  end;

  Result := True;
end;

end.
