unit uGuidance;

interface

uses
   tttData;

const

   C_GuidanceStr : array [TVehicleGuidanceType] of string =
   ( 'none',
     'Straight Line',
     'Helm',
     'Circle',
     'Station Keeping',
     'Zigzag',
     'Sinuation',
     'Formation',
     'Evasion',
     'Waypoint',
     'Outrun',
     'Engagement',
     'Shadow',
     'Return To Base'
   );

   function GetGuidanceStr(const vg: TVehicleGuidanceType): string;

implementation


function GetGuidanceStr(const vg: TVehicleGuidanceType): string;
begin
  result := C_GuidanceStr[vg];
end;
end.
