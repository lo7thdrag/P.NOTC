unit uDBAsset_Radar;

interface

uses
  tttData,Classes, uDBBlind_Zone, uDBNote_Storage,uDBAsset_Vehicle,
  SysUtils, newClassASTT;

type

  TRecCoverage = record
    range : double;
    min, max : double;
  end;

  TCoverage = class
  public
    FData  : TRecCoverage;
  end;

  //PRecCoverage = ^TRecCoverage;

  TRadar_Vertical   = class
  private
    covDiagram1, covDiagram2 : TList;
    FData   : TList;

    procedure AddCoverage(diagram : TList; coverage : TCoverage);
  public
    constructor Create;
    destructor Destroy;override;

    procedure ReSort;
    procedure Add(pData : TRadar_Vertical_Coverage{PRecRadar_Vertical_Coverage});
    procedure GetCoverage(range : double; var min1,max1,min2,max2 : double);
    function isDataCoverageExist : boolean;
    function itemCount : integer;  {sam.add for snapshot}
    function getRadar_Vertical_Coverage ( index : integer ) : TRadar_Vertical_Coverage;  {sam.add for snapshot}
  end;

  TRadar_On_Board = class
  public
    FData      : TRecRadar_On_Board;
    FDef       : TRecRadar_Definition;
    FPattern   : TRecPattern_Radar_Event;
    FType      : TRecRadar_Type ;
    FInterval  : TRecRadar_Interval_Definition;
    FVehicle   : TVehicle_Definition;

    FBlind_Zone         : TBlind_Zone;
    FBlind              : TList;
    FRadar_Type         : TList;
    FScripted_Pattern   : TList; // TRecPattern_Radar_Event;
    FScripted_Radar     : TList; //TRecScripted_Radar_Event;
    FRadar_Vertical     : TRadar_Vertical;
    FNote               : TNote_Storage ;
    FECCM_Type          : TRecECCM_Type ;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TRadar_On_Board }

constructor TRadar_On_Board.Create;
begin
  inherited;
  FScripted_Pattern   := TList.Create;
  FScripted_Radar     := TList.Create;
  FRadar_Vertical     := TRadar_Vertical.Create;
  FBlind              := TList.Create;

  FBlind_Zone         := TBlind_Zone.Create;
  FVehicle            := TVehicle_Definition.Create;
  FNote               := TNote_Storage.Create;
end;

destructor TRadar_On_Board.Destroy;
var
  i : integer;
  item : TObject;
begin
  for I := FScripted_Pattern.Count - 1 downto 0 do begin
    item :=  FScripted_Pattern.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FScripted_Pattern);

  for I := FScripted_Radar.Count - 1 downto 0 do begin
    item :=  FScripted_Radar.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FScripted_Radar);

  for I := FBlind.Count - 1 downto 0 do begin
    item :=  FBlind.Items[i];
    FreeAndNil(item);
  end;
  FreeAndNil(FBlind);

  FreeAndNil(FRadar_Vertical);
  FreeAndNil(FBlind_Zone);
  FreeAndNil(FVehicle);
  FreeAndNil(FNote);

  inherited;
end;

{ TRadar_Vertical }

procedure TRadar_Vertical.Add(pData: TRadar_Vertical_Coverage{PRecRadar_Vertical_Coverage});
var
  coverage : TCoverage;
begin
  // ignore 0 range
  if pData.FData.Vert_Coverage_Range <= 0.0009 then exit;

  FData.Add(pData);

  coverage := TCoverage.Create;
  coverage.FData.range := pData.FData.Vert_Coverage_Range;
  coverage.FData.min   := pData.FData.Vert_Cover_Min_Elevation;
  coverage.FData.max   := pData.FData.Vert_Cover_Max_Elevation;

  case pData.FData.Coverage_Diagram of
    // first vertical coverage diagram
    1 : AddCoverage(covDiagram1, coverage);
    // second vertical coverage diagram
    2 : AddCoverage(covDiagram2, coverage);
  end;
end;

procedure TRadar_Vertical.AddCoverage(diagram: TList; coverage: TCoverage);
var
  i: integer;
  item : TCoverage;
begin
  // add and sorted by range
  if diagram.Count = 0 then begin
    diagram.Add(coverage);
    exit;
  end;
  for I := 0 to diagram.Count - 1 do begin
    item := diagram.Items[i];
    if item.FData.range >= coverage.FData.range then break;
  end;

  diagram.Insert(i,coverage);
end;

constructor TRadar_Vertical.Create;
begin
  if not Assigned(FData) then
    FData := TList.Create;

  covDiagram1 := TList.Create;
  covDiagram2 := TList.Create;
end;

destructor TRadar_Vertical.Destroy;
begin
  covDiagram1.Clear;
  covDiagram2.Clear;

  covDiagram1.Free;
  covDiagram2.Free;

  inherited;
end;

procedure TRadar_Vertical.GetCoverage(range: double; var min1, max1, min2,max2: double);
var i : integer;
    item, item2 : TCoverage;
    val : double;
begin
  min1 := -100000000;
  min2 := -100000000;
  max1 := 100000000;
  max2 := 100000000;

  // diagram vertical coverage pertama
  if covDiagram1.Count > 1 then begin
    item :=  nil;
    for i := 0 to covDiagram1.Count - 1 do begin
      item := covDiagram1.Items[i];
      if range > item.FData.range then continue else break;
    end;
    if Assigned(item) then begin

      if (i = 0) or (i = covDiagram1.Count - 1) then begin
        min1 := item.FData.min;
        max1 := item.FData.max;
      end else
      begin
        item2 := covDiagram1.Items[i-1];
        // pake interpolasi
        // Y = (((X - X0)*Y1) + ((X1 - X)*Y0)) / (X1 - X0);

        val := (item.FData.range - item2.FData.range);
        if val = 0 then begin
          min1 := 0;
          max1 := 0;
        end else begin
          min1 := (((range - item2.FData.range)*item.FData.min) +
                  ((item.FData.range-range)*item2.FData.min)) /
                  (item.FData.range - item2.FData.range);
          max1 := (((range - item2.FData.range)*item.FData.max) +
                  ((item.FData.range-range)*item2.FData.max)) /
                  (item.FData.range - item2.FData.range);
        end;
      end;
    end;
  end;

  // diagram vertical coverage kedua
  if covDiagram2.Count > 1 then begin
    item := nil;
    for i := 0 to covDiagram2.Count - 1 do begin
      item := covDiagram2.Items[i];
      if range > item.FData.range then continue else break;
    end;

    if Assigned(item) then begin
      if (i = 0) or (i = covDiagram2.Count - 1) then begin
        min2 := item.FData.min;
        max2 := item.FData.max;
      end else
      begin
        item2 := covDiagram2.Items[i-1];
        // pake interpolasi
        // Y = (((X - X0)*Y1) + ((X1 - X)*Y0)) / (X1 - X0);

        val := (item.FData.range - item2.FData.range);
        if val = 0 then begin
          min1 := 0;
          max1 := 0;
        end else begin
          min2 := (((range - item2.FData.range)*item.FData.min) +
                  ((item.FData.range-range)*item2.FData.min)) /
                  (item.FData.range - item2.FData.range);
          max2 := (((range - item2.FData.range)*item.FData.max) +
                  ((item.FData.range-range)*item2.FData.max)) /
                  (item.FData.range - item2.FData.range);
        end;
      end;
    end;
  end;
end;

function TRadar_Vertical.getRadar_Vertical_Coverage(
  index: integer): TRadar_Vertical_Coverage;
var
   r : TRadar_Vertical_Coverage ;
begin
  Result := nil ;
  if ( index < FData.Count ) and ( index >= 0 ) then begin
    r := TRadar_Vertical_Coverage(FData[index]);
    if r <> nil then
      Result := r ;
  end;
end;

function TRadar_Vertical.isDataCoverageExist: boolean;
begin
  result := false;
 
  if Assigned(FData) then
    result := (FData.Count > 0);
end;

function TRadar_Vertical.itemCount: integer;
begin
   Result := FData.Count ;
end;

procedure TRadar_Vertical.ReSort;
var
  coverage : TRadar_Vertical_Coverage;//PRecRadar_Vertical_Coverage;
  item : TCoverage;
  i : integer;
begin
  covDiagram1.Clear;
  covDiagram2.Clear;

  for i := 0 to FData.Count - 1 do begin
    coverage := FData.Items[i];

    item := TCoverage.Create;
    item.FData.range := coverage.FData.Vert_Coverage_Range;
    item.FData.min   := coverage.FData.Vert_Cover_Min_Elevation;
    item.FData.max   := coverage.FData.Vert_Cover_Max_Elevation;

    case coverage.FData.Coverage_Diagram of
      // first vertical coverage diagram
      1 : AddCoverage(covDiagram1, item);
      // second vertical coverage diagram
      2 : AddCoverage(covDiagram2, item);
    end;
  end;
end;

end.
