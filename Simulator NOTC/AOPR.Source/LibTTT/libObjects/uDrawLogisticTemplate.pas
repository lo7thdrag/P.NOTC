unit uDrawLogisticTemplate;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin, OleCtrls,
  uMapXHandler, uBaseCoordSystem, math, {TeCanvas,} ColorGrd,
  uMainLogisticTemplate,
  uRecord, uFormula, uDataTypes, uCoordConvertor;
type

  TShipingRouteContainer = class
  private
    FConverter: TCoordConverter;
    procedure SetConverter(const Value: TCoordConverter);

  protected

  public
    FList : TList;
//    FListTemp : TList;
    FFormula : TFormula;

    constructor Create;
    destructor Destroy; override;

    function GetShipingRoute(ShipingRouteId : Integer): TMainShipingRoute;

    procedure Clear;
    procedure Draw(FCanvas: TCanvas);

    { method add data to FList }
    procedure AddShipingRoute(ShipingRoute : TMainShipingRoute);
//    procedure AddLogisticRoute(OLogisticRoute : TPointRoute);

    { method remove data from FList }
    procedure RemoveShipingRoute(ShipingRoute : TMainShipingRoute);
//    procedure RemoveLogisticRoute(OLogisticRoute : TPointRoute);



    property Converter : TCoordConverter read FConverter write SetConverter;

  end;

implementation

{ TDrawLogisticTemplate }

//procedure TShipingRouteContainer.AddLogisticRoute(OLogisticRoute: TPointRoute);
//begin
//  FListTemp.Add(OLogisticRoute);
//end;

procedure TShipingRouteContainer.AddShipingRoute(ShipingRoute: TMainShipingRoute);
begin
  FList.Add(ShipingRoute);
end;

procedure TShipingRouteContainer.Clear;
begin
  FList.Clear;
//  FListTemp.Clear
end;

constructor TShipingRouteContainer.Create;
begin
  FList := TList.Create;
//  FListTemp := TList.Create;
end;

destructor TShipingRouteContainer.Destroy;
begin

  inherited;
  FList.Free;
//  FListTemp.Free;
end;

procedure TShipingRouteContainer.Draw(FCanvas: TCanvas);
var
  i : Integer;
  item : TMainShipingRoute;
//  temp : TPointRoute;
begin
  for i := 0 to FList.Count - 1 do
  begin
    item := FList[i];
    item.Draw(FCanvas);
  end;

//  for i := 0 to FListTemp.Count - 1 do
//  begin
//    temp := FListTemp[i];
//    temp.Draw(FCanvas);
//  end;
end;

function TShipingRouteContainer.GetShipingRoute(ShipingRouteId: Integer): TMainShipingRoute;
var
  i : Integer;
  item : TMainShipingRoute;
begin
  for i := 0 to FList.Count - 1 do
  begin
    item := FList[i];
    if item.ShipingRouteId = ShipingRouteId then
    begin
      Result := item;
      Exit;
    end;
  end;
end;

//procedure TShipingRouteContainer.RemoveLogisticRoute(OLogisticRoute: TPointRoute);
//begin
//  FListTemp.Remove(OLogisticRoute);
//end;

procedure TShipingRouteContainer.RemoveShipingRoute(ShipingRoute: TMainShipingRoute);
begin
  FList.Remove(ShipingRoute);
end;

procedure TShipingRouteContainer.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

end.
