unit uMapLayerDB;

interface

uses
  Classes,
  SysUtils, MapXLib_TLB, Forms, tttData;

type
  TMapStubLayerDb = class
  private
    FOnLogStr         : TLogStrProc;

    // mapx utils
    FLyrDepth     : CMapXLayer;
    FmDSet        : CMapXDataset;
    FmPt          : CMapXPoint;
    FmRowVals     : CMapXRowValues;
    FLastFeatKey  : string;
    FDefaultMap   : String;
    FLastDVal1, FLastDVal2 : double;

    DMap          : TMap;
    FMap          : TMap;

    FLyrLands : array [0..5] of CMapXLayer;
    FLyrOcean : CMapXLayer;
    FLyrSpotSounding : array [0..4] of CMapXLayer;

    procedure LoadDefaultDataMap(const mData: string);
  protected
  public
    constructor Create(const defMap : String);
    destructor Destroy;override;

    function GetMapDepth(const x, y: double; var d1, d2: double): boolean;
    function GetMapDepthBySpotSounding(const x, y: double; var d1: double): boolean;
    function GetMapLand(const x, y: double; var d1, d2: double): boolean;

    property OnLogStr  : TLogStrProc read FOnLogStr write FOnLogStr;
  end;

var
  DepthLayerDB : TMapStubLayerDb;


implementation

uses
  uLibSettingTTT, Windows, ComObj,
  StrUtils;


const
  C_ENC_LAND = 'area_land';
  C_VCT_LAND = 'oceansea';

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

{ TMapStubLayerDb }

constructor TMapStubLayerDb.Create(const defMap : String);
begin
  DMap  := TMap.Create(nil);
  FMap  := TMap.Create(nil);
  FmPt := CoPoint.Create;
  FDefaultMap := defMap;

  if FileExists(defMap) then
    LoadDefaultDataMap(defMap);
end;

function TMapStubLayerDb.GetMapLand(const x, y: double; var d1, d2: double): boolean;
var
    fs: CMapXFeatures;
    found, isOcean: Boolean;
begin
  FmPt.Set_(x, y);
  d1 := 0;
  d2 := 0;
  found := False;
  isOcean := false;

// ini agak tricky sdikit, karena layer yg dicek adalah layer ocean,
// maka pengecekan data ada brarti dilaut, brarti vehicle surface bisa trus jalan,
// klo g ada data asumsi berarti lagi di darat, vehicle harusnya berhenti.
  if not found then begin
    try
      if FLyrOcean = nil then begin
        result := false;
        exit;
      end;

      fs := FLyrOcean.SearchAtPoint(FmPt);

      if fs.Count > 0 then begin
        isOcean := true;
      end;
    except
      on E:Exception do begin
        if Assigned(FOnLogStr) then
          FOnLogStr('TMapStubLayerDb.GetMapLand', e.Message);
        isOcean := true;
      end;
    end;
    found := not isOcean;
  end;

//  if not found then
//    for i := 0 to Length(FLyrExtLands)-1 do begin
//      try
//        if FLyrExtLands[i] = nil then
//          Continue;
//
//        fs := FLyrExtLands[i].SearchAtPoint(FmPt);
//
//        if fs.Count > 0 then
//        begin
//          found := true;
//          Break;
//        end;
//      finally
//      end;
//    end;


  result := found;
end;

function TMapStubLayerDb.GetMapDepth(const x, y: double; var d1,
  d2: double): boolean;
var
    fs: CMapXFeatures;
    f : CMapXFeature;
    i : integer;
begin
  Result := False;
  if FLyrDepth = nil then Exit;

  d1 := 1000;
  d2 := -1000;

  FmPt.Set_(x, y);

  try
    fs := FLyrDepth.SearchAtPoint(FmPt);
    //count := fs.Count;
  except
    on E:Exception do begin
      if Assigned(FOnLogStr) then
        FOnLogStr('TMapStubLayerDb.GetMapDepth', e.Message);
      fs := nil;
    end;
  end;

  if not Assigned(fs) then exit;
  

  if fs.Count > 0 then
  begin
//    for I := 1 to fs.Count do
//    begin
      try
        f := fs.Item(1);
        if f.FeatureKey <> FLastFeatKey then begin
          //the problem is here:  memory sucker
          //      mRowVals := FmDSet.RowValues[f.FeatureID];
          FmRowVals := FmDSet.RowValues[f.featureKey];

          //if (d1 >= FmRowVals.Item('DRVAL1___1').Value) then
            d1 := FmRowVals.Item('DRVAL1___1').Value;

          //if (d2 <= FmRowVals.Item('DRVAL2___2').Value) then   // tertinggi
            d2 := FmRowVals.Item('DRVAL2___2').Value;

          FLastFeatKey  := f.FeatureKey;
          FLastDVal1    := d1;
          FLastDVal2    := d2;
        end
        else begin
          d1 := FLastDVal1;
          d2 := FLastDVal2;
        end;
      except
        on E:Exception do begin
          if Assigned(FOnLogStr) then
            FOnLogStr('TMapStubLayerDb.GetMapDepth', e.Message);
        end;
      end;
//    end;

    Result := True;
  end;
end;

function TMapStubLayerDb.GetMapDepthBySpotSounding(const x, y: double;
  var d1: double): boolean;
var
  fs: CMapXFeatures;
  found : Boolean;
  i : Integer;
begin
  FmPt.Set_(x, y);
  d1    := 0;
  found := False;

  for i := 0 to Length(FLyrSpotSounding)-1 do begin
    try
      if FLyrSpotSounding[i] = nil then
        Continue;

      fs := FLyrSpotSounding[i].SearchAtPoint(FmPt);

      if fs.Count > 0 then
      begin

        found := true;
        Break;
      end;
    finally
    end;
  end;
end;

procedure TMapStubLayerDb.LoadDefaultDataMap(const mData: string);
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
   COcean=  'oceansea';
   CSpotSounding = 'titik_spot_sounding';
var
    i: Integer;
    Z : OleVariant;
begin
  DMap.Layers.RemoveAll;
  InitOleVariant(Z);
  FLyrDepth := nil;
  FmDSet    := nil;
  FLastFeatKey := '';

  if not FileExists(mData) then
    Exit;

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
      FLyrLands[0] := nil;
  end;

  for i := 1 to 5 do begin
    try
      FLyrLands[i] := DMap.Layers.Item(CLayerName[i]+ CLand);
    except
      on EOleException do
        FLyrLands[i] := nil;
    end;
  end;

  try
    FLyrOcean := DMap.Layers.Item(COcean);
  except
    on EOleException do
      FLyrOcean := nil;
  end;

//  for i := 0 to 4 do begin
//    try
//      FLyrSpotSounding[i] := DMap.Layers.Item(CLayerName[i+1]+ CSpotSounding);
//    except
//      on EOleException do
//        FLyrSpotSounding[i] := nil;
//    end;
//  end;
end;

destructor TMapStubLayerDb.Destroy;
begin
end;

end.
