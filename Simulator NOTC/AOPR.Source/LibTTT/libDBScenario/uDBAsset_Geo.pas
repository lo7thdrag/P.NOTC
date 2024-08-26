unit uDBAsset_Geo;

interface

uses
  tttData,Classes;

type

  TGeo_Area_Def = class
  public
    FData   : TRecGeo_Area_Definition;
    Point   : TList;
    Event   : TList;

    constructor Create;
    destructor Destroy;override;
  end;

  TGeo_Area_Point = class
  public
    FData : TRecGeo_Area_Point;
  end;

  TConditional_Event = class
  public
    FData : TRecConditional_Event_Definition;
  end;

  TResource_Geo_Area_Map = class
  public
    FData : TRecResource_Geo_Area_Mapping;
  end;

  TResource_Overlay_Mapping = class
    public
    FData : TRecResource_Overlay_Mapping;
  end;

implementation

{ TGeo_Area }

constructor TGeo_Area_Def.Create;
begin
  Point   := TList.Create;
  Event   := TList.Create;
end;

destructor TGeo_Area_Def.Destroy;
begin
  Point.Free;
  Event.Free;
  inherited;
end;

end.
