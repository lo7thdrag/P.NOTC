unit uMainStrategi;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, uMapXHandler, uCoordConvertor,
  uLibSettingTTT, tttData, uBaseCoordSystem, uGameData_TTT,
  {TeCanvas,} ColorGrd, uDataTypes, uObjectVisuals, uSnapshotData;

type

  TMainPlottingTemplate = class
  private
    FName   : string;
    FGroup  : string;
    FTipe   : Integer;
    FCubicle: Integer;
    FDay    : Double;
    FTime   : Double;
    procedure SetDay(const Value: Double);
    procedure SetTime(const Value: Double);
    procedure SetName(const Value: string);
    procedure SetGroup(const Value: string);
    procedure SetTipe(const Value: Integer);
    procedure SetCubicle(const Value: Integer);  public

  public
    FCanvas : TCanvas;
    FMap    : TMap;
    isShow  : Boolean;
    isCreate : Boolean;
    isSend  : Boolean;
    ShapeList : TList;

//    function GetSnapshotData : _SS_TMainStrategi;

    constructor create(cvt : TCoordConverter);
    destructor Destroy; override;
    procedure Draw(FCanvas: TCanvas); virtual;

    property Day   : Double read FDay write SetDay;
    property Time  : double read FTime write SetTime;
    property Name   : string read FName write SetName;
    property Group  : string read FGroup write SetGroup;
    property Tipe   : Integer read FTipe write SetTipe;
    property Cubicle   : Integer read FCubicle write SetCubicle;
  end;

implementation

uses
  uMainPlottingShape;

constructor TMainPlottingTemplate.create;
begin
  ShapeList := TList.Create;
end;

destructor TMainPlottingTemplate.destroy;
begin
  inherited;
  ShapeList.Free;
end;

procedure TMainPlottingTemplate.Draw(FCanvas: TCanvas);
var
  i : Integer;
  Plotting : TMainPlottingShape;
begin
  for i := 0 to ShapeList.Count - 1 do
  begin
    Plotting := ShapeList[i];
    Plotting.Draw(FCanvas);
  end;
end;

//function TMainPlottingTemplate.GetSnapshotData: _SS_TMainStrategi;
//var
//  s : _SS_TMainStrategi;
//begin
//  s.NameBase := Name;
//  s.TypeBase := Tipe;
//  s.PosMapLongitude := postStart.X;
//  s.PosMapLatitude := postStart.Y;
//  s.Color := color;
//  Result := s;
//end;

procedure TMainPlottingTemplate.SetCubicle(const Value: Integer);
begin
  FCubicle := Value;
end;

procedure TMainPlottingTemplate.SetDay(const Value: Double);
begin
  FDay :=  Value;
end;

procedure TMainPlottingTemplate.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TMainPlottingTemplate.SetGroup(const Value: string);
begin
  FGroup := Value;
end;

procedure TMainPlottingTemplate.SetTime(const Value: Double);
begin
  FTime := Value;
end;

procedure TMainPlottingTemplate.SetTipe(const Value: Integer);
begin
  FTipe := Value;
end;

end.
