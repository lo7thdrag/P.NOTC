unit uMapXData;

interface

uses
  MapXLib_TLB;

type

  TSimMapData = class
  protected
    DMap          : TMap;

    FLyrDepth     : CMapXLayer;
    FmDSet        : CMapXDataset;
    FmPt          : CMapXPoint;
    FmRowVals     : CMapXRowValues;
    FLastFeatKey  : string;
    FLastDVal1, FLastDVal2 : double;

    FLyrLands : array [0..5] of CMapXLayer;
    FLyrAreas : array [1..5] of CMapXLayer;

  public
    constructor Create;
    destructor Destroy; override;

    procedure LoadDataMap(const mData: string);

    function GetMapDepth(const x, y: double; var d1, d2: double): boolean;
    function GetMapLand(const x, y: double): boolean;


  end;


var
  VMapData: TSimMapData;

implementation

uses
  SysUtils, Windows, ComObj;

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;


{ TSimMapData }

constructor TSimMapData.Create;
begin
  DMap := TMap.Create(nil);
  FmPt := CoPoint.Create;

end;

destructor TSimMapData.Destroy;
begin

  inherited;
end;

procedure TSimMapData.LoadDataMap(const mData: string);
const
  CDepthName   = 'area_kedalaman';
  CLayerName: array [1..5] of string =
   ('ID1000_',
    'ID2000_',
    'ID3000_',
    'ID4000_',
    'ID5000_');

   CCoastland = 'Coastline';
   CLand =  'land';
   CArea =  'area_coverage';

var i: Integer;
    Z : OleVariant;
begin
  DMap.Layers.RemoveAll;
  InitOleVariant(Z);
  FLyrDepth := nil;
  FmDSet    := nil;
  FLastFeatKey := '';

  if not FileExists(mData) then Exit;
  DMap.Geoset := mData;
  try
    FLyrDepth := DMap.Layers.Item(CDepthName);
  except
    on EOleException do
    FLyrDepth := nil;
  end;
  FmDSet := DMap.Datasets.Add( miDataSetLayer, FLyrDepth ,CDepthName, Z, Z, Z, Z, Z );

  try
    FLyrLands[0] := DMap.Layers.Item(CCoastland);
  except
    on EOleException do
      FLyrLands[i] := nil;
  end;
  for i := 1 to 5 do begin
    try
      FLyrLands[i] := DMap.Layers.Item(CLayerName[i]+ CLand);
    except
      on EOleException do
        FLyrLands[i] := nil;
    end;
  end;
  for i := 1 to 5 do begin
    try
      FLyrAreas[i] := DMap.Layers.Item(CLayerName[i]+ CArea);
    except
      on EOleException do
      FLyrAreas[i] := nil;
    end;
  end;
end;

function TSimMapData.GetMapDepth(const x, y: double; var d1,
  d2: double): boolean;
var fs: CMapXFeatures;
    f : CMapXFeature;
begin
  Result := False;
  if FLyrDepth = nil then Exit;

  FmPt.Set_(x, y);

  fs := FLyrDepth.SearchAtPoint(FmPt);

  if fs.Count > 0 then begin
    f := fs.Item(1);
    if f.FeatureKey <> FLastFeatKey then begin
      //the problem is here:  memory sucker
      //      mRowVals := FmDSet.RowValues[f.FeatureID];
      FmRowVals := FmDSet.RowValues[f.featureKey];

      d1  := FmRowVals.Item('DRVAL1___1').Value;
      d2  := FmRowVals.Item('DRVAL2___2').Value;   // tertinggi

      FLastFeatKey  := f.FeatureKey;
      FLastDVal1    := d1;
      FLastDVal2    := d2;
    end
    else begin
      d1 := FLastDVal1;
      d2 := FLastDVal2;
    end;

    Result := True;
  end;
end;

function TSimMapData.GetMapLand(const x, y: double): boolean;
var i : Integer;
    fs: CMapXFeatures;
    f : CMapXFeature;
    found: Boolean;
begin
  FmPt.Set_(x, y);

  result := False;

  found := False;
  for i := 5 downto 1 do begin
    if FLyrLands[i] = nil then
      Continue;
    fs := FLyrAreas[i].SearchAtPoint(FmPt);
    if fs.Count > 0 then begin
      found := true;
      Break;
    end;
  end;
  if found then begin
    fs := FLyrLands[i].SearchAtPoint(FmPt);
    if fs.Count > 0 then
      Result := True;
  end
  else begin
    if FLyrLands[0] <> nil then begin
      fs := FLyrLands[0].SearchAtPoint(FmPt);
      if fs.Count > 0 then
        Result := True;
    end;
  end;
end;


end.
