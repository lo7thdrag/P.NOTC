unit uSimVisuals;

interface

uses
  Classes, Windows, Graphics,
  uCoordConvertor;

type

  // ==============================================================================
  TDrawElement = class
  private

  protected
    FColor   : TColor;
    procedure SetFColor(const Value: TColor);  virtual;
  public
    Size    : byte;
    Center  : TPoint;
    Offset  : TPoint;
    FontName: TFontName;
    Visible : boolean;

    constructor Create;
    procedure Draw(aCnv: TCanvas); virtual;
    procedure ConvertCoord(cvt: TCoordConverter); virtual;
    property Color : TColor read FColor write SetFColor;

  end;

  // ==============================================================================
  TDrawContainers = class
  protected
    FList: TList;
    FDrw: TDrawElement;

  public
    constructor Create;
    destructor Destroy; override;

    procedure ClearItems;

    procedure addItem(const obj: TDrawElement);
    function GetItem(const i: integer): TDrawElement;
    function ItemCount: integer;
    procedure DeleteItem(i : integer);

    procedure DrawAll(aCnv: TCanvas);
    procedure ConvertAll(cvt: TCoordConverter);

    function SearchByPos(const x, y: integer): integer;
    // return index of list.

  end;

  // ==============================================================================
  function ptToRect(const px, py, dx, dy: integer): TRect;
  // ==============================================================================

implementation

uses
  uSimContainers;

function ptToRect(const px, py, dx, dy: integer): TRect;
begin
  with result do begin
    Left    := px - dx;
    Right   := px + dx;
    Top     := py - dy;
    Bottom  := py + dy;
  end;
end;

{ TDrawElement }
// ==============================================================================

constructor TDrawElement.Create;
begin
  Size := 12;
  FontName := 'Arial';
  Color := RGB(12, 255, 12);
  Center.x := 0;
  Center.y := 0;
  Offset := Center;
  Visible := true;
end;

procedure TDrawElement.ConvertCoord(cvt: TCoordConverter);
begin
  //
end;

procedure TDrawElement.Draw(aCnv: TCanvas);
begin
  if not Visible then
    exit;

  with aCnv do
  begin
    Font.Name := FontName;
    Font.Size := Size;
    Font.Color := Color;
  end;

end;

procedure TDrawElement.SetFColor(const Value: TColor);
begin
  FColor := Value;
end;

// ============================================================================
{ TDrawContainers }

constructor TDrawContainers.Create;
begin
  FList := TList.Create;

end;

procedure TDrawContainers.DeleteItem;
begin
  FList.Delete(i);
end;

destructor TDrawContainers.Destroy;
begin
  ClearAndFreeItems(FList);
  FList.Free;
  inherited;
end;

procedure TDrawContainers.ClearItems;
var
  i: integer;
  FDrw: TDrawElement;
begin
  for i := 0 to FList.Count - 1 do
  begin
    FDrw := FList[i];
    FDrw.Free;
  end;
  FList.Clear;

end;

procedure TDrawContainers.addItem(const obj: TDrawElement);
begin
  FList.Add(obj);
end;

procedure TDrawContainers.ConvertAll(cvt: TCoordConverter);
var
  i: integer;
  FDrw: TDrawElement;
begin
  for i := 0 to FList.Count - 1 do
  begin
    FDrw := FList[i];
    FDrw.ConvertCoord(cvt);
  end;
end;

procedure TDrawContainers.DrawAll(aCnv: TCanvas);
var
  i: integer;
  FDrw: TDrawElement;
begin
  for i := 0 to FList.Count - 1 do
  begin
    FDrw := FList[i];
    FDrw.Draw(aCnv);
  end;
end;


function TDrawContainers.SearchByPos(const x, y: integer): integer;
const
  C_HIT_SIZE = 6;
var
  i: integer;
  de: TDrawElement;
  r: TRect;
  found: boolean;
begin
  result := -1;
  found := false;
  r := ptToRect(x, y, C_HIT_SIZE, C_HIT_SIZE);

  i := FList.Count - 1;
  while not found and (i >= 0) do
  begin
    de := FList.Items[i];
    found := PtInRect(r, de.Center);
    dec(i);
  end;
  if found then
    result := i + 1;

end;

function TDrawContainers.GetItem(const i: integer): TDrawElement;
begin
  result := nil;
  if (i >= 0) and (i < FList.Count) then
    result := FList[i];
end;

function TDrawContainers.ItemCount: integer;
begin
  result := FList.Count;
end;

end.
