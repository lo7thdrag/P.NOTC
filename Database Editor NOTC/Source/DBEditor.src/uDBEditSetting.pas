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
    PlottingPath          : string;
    Pattern               : String;   //D:\TTT\mapsource\map\background.gst
    predefPattern         : String;   //M:\map\pattern
    BMPPath               : String;
    SkinPath              : String;
    MapTypePath           : string;   //D:\MAP
    MapDefView            : string;   //D:\MAP\DEF_MAP_VIEW
    MapGSTGame            : string;   //D:\MAP\GST_GAME
    SkinName              : string;
    ProjectName           : string;
    UserDBEditor          : string;
    PasswordDBEditor      : string;
    MapDefGame            : string;   //D:\MAP\DEF_GAME
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
var IniF : TIniFile;
    s    : string;
    str  : string;
begin
  Result := True;
   s     := ExtractFilePath(ParamStr(0));
   str := s;
   s := s + fName;

   IniF  := TIniFile.Create(s);
  try

  with dbEditSett do begin
    MapSourcePathENC      := IniFReadstring(inif, c_appsetting, 'MapSourcePathENC', 'M:\TTT\mapsource\coverageArea' );
    MapSourceGeosetENC    := IniFReadstring(inif, c_appsetting, 'MapSourceGeosetENC', 'M:\TTT\mapsource\coverage\AreaCoverage.gst' );

    MapSourcePathVECT     := IniFReadstring(inif, c_appsetting, 'MapSourcePathVECT', 'D:\TTT\mapsource\map' );
    MapSourceGeosetVECT   := IniFReadstring(inif, c_appsetting, 'MapSourceGeosetVECT', 'D:\TTT\mapsource\map\world.gst' );

    MapDestPathENC        := IniFReadstring(inif, c_appsetting, 'MapDestPathENC', 'M:\map\mapsea' );
    MapDestPathVECT       := IniFReadstring(inif, c_appsetting, 'MapDestPathVECT', 'M:\map\game_area' );
    MapENC                := IniFReadstring(inif, c_appsetting, 'MapENC', 'M:\map\mapsea' );

    OverlayPath           := IniFReadstring(inif, c_appsetting, 'OverlayPath', 'M:\map\overlay' );
    PlottingPath          := IniFReadString(IniF, c_appsetting, 'PlottingPath', 'M:\Map\Plotting');
    Pattern               := IniFReadstring(inif, c_appsetting, 'Pattern', 'M:\mapsource\map\background.gst' );
    predefPattern         := IniFReadstring(inif, c_appsetting, 'predefPattern', 'M:\map\pattern' );
    BMPPath               := IniFReadstring(inif, c_appsetting, 'BMPPath', str + '\data\Bitmap\' );
    SkinPath              := IniFReadstring(inif, c_appsetting, 'SkinPath','\data\Skin\');
    SkinPath              := str +  SkinPath;

    SkinName              := IniFReadstring(inif, c_appsetting, 'SkinName','WLM');
    ProjectName           := IniFReadstring(inif, c_appsetting, 'ProjectName','AOPR');
    UserDBEditor          := IniFReadstring(inif, c_appsetting, 'UserDBEditor','Administrator');
    PasswordDBEditor      := IniFReadstring(inif, c_appsetting, 'PasswordDBEditor','admin');

    MapTypePath           := INIFReadString(IniF, c_appsetting, 'MapTypePath', '');
    MapDefView            := INIFReadString(IniF, c_appsetting, 'MapDefView', '');
    MapGSTGame            := INIFReadString(IniF, c_appsetting, 'MapGSTGame', '');
    MapDefGame            := INIFReadString(IniF, c_appsetting, 'MapDefGame', '');
  end;
  finally
    IniF.DisposeOf
  end;
end;

end.
