unit uSnapshotGCRec;

interface

uses
  Classes, SysUtils, uSnapshotUtils, tttData ;

type
  TRecGCSnapshot = record
    ID                 : Integer;
    Name               : string[60];
    AddName            : string[60];
    LastPlatformID     : Integer;
    FRCubicleGroupList : _SSA_CubGroup ;
    FRAssignCGList     : _SSA_CubAssign ;
  function LoadFrom(AStream: TStream): Boolean;
  procedure SaveTo(AStream: TStream; ScenarioID: Integer);
    const
      cVersion = cSSUTILS_FILE_VERSION ;
      cDefaultOptions = [ssuAnsiStringCodePage, ssuUTF16ToUTF8];
  end;

implementation


function TRecGCSnapshot.LoadFrom(AStream: TStream): Boolean;
begin
  Result := TSnapshotUtils.ReadFrom(AStream, Self, TypeInfo(TRecGCSnapshot), cVersion); // or
end;

procedure TRecGCSnapshot.SaveTo(AStream: TStream; ScenarioID: Integer);
begin
  TSnapshotUtils.WriteTo(AStream, Self, TypeInfo(TRecGCSnapshot), ScenarioID, cVersion, cDefaultOptions);
end;


end.

