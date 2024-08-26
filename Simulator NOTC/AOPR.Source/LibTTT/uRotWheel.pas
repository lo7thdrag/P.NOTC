unit uRotWheel;

interface

uses
  Windows, SysUtils, Classes, Controls, Graphics;

type
  TRotWheel = class(TGraphicControl)
  private
    FDegree: double;
    procedure setDegree(const Value: double);
    function getDegree: double;
    { Private declarations }
  protected
    { Protected declarations }
    FDRect : TRect;
    FRSize : integer;
    FCt, FPt : TPoint;
    FDrag  : boolean;
    FOnDegreeChange: TNotifyEvent;

    procedure Resize; override;
    procedure SetSize;
    procedure UpdateDegree;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
              X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
              X, Y: Integer); override;
  public
    { Public declarations }
     constructor Create(aOwner: TComponent); override;
     procedure Paint; override;
  published
    { Published declarations }
    property Degree: double read getDegree write setDegree;
    property OnDegreeChange: TNotifyEvent read FOnDegreeChange write FOnDegreeChange;
  end;

//procedure Register;

implementation
{
procedure Register;
begin
  RegisterComponents('Samples', [TRotWheel]);
end;
}
{ TRotWheel }

uses
  Math;

function ConvertDegree(const s: double): double;
begin
  result := 90.0 - s;
  if result < 0 then
    result := result + 360.0;
end;

procedure TRotWheel.SetSize;
var size: integer;
begin
  FCt.X :=  (BoundsRect.Left + BoundsRect.Right ) shr 1;
  FCt.Y :=  (BoundsRect.Top  + BoundsRect.Bottom) shr 1;

  size := Min(Width, Height) - 2;
  FRSize := size shr 1;

  FDRect.Left   := FCt.X - FRSize;
  FDRect.Right  := FCt.X + FRSize;
  FDRect.Top    := FCt.Y - FRSize;
  FDRect.Bottom := FCt.Y + FRSize;
end;

constructor TRotWheel.Create(aOwner: TComponent);
begin
  inherited;

  SetDegree(0.0);
end;

procedure TRotWheel.Resize;
begin
  inherited;

  SetSize;
  UpdateDegree;
end;

procedure TRotWheel.Paint;
begin
  inherited;

  Canvas.Brush.Color := clBtnFace;
  Canvas.Ellipse(FDRect);
  Canvas.MoveTo(FCt.X, FCt.Y);
  Canvas.LineTo(FPt.X, FPt.Y);
end;


procedure TRotWheel.setDegree(const Value: double);
begin
  FDegree :=  DegToRad(ConvertDegree(Value));
  UpdateDegree;

  if HasParent then
    Paint;
end;

procedure TRotWheel.UpdateDegree;
var sn, cs : extended;
begin
  SinCos(FDegree, sn, cs);

  FPt.X := FCt.X +  Round((FRSize ) * cs);
  FPt.Y := FCt.Y -  Round((FRSize ) * sn);

  if Assigned(FOnDegreeChange) then
    FOnDegreeChange(self);
end;

function TRotWheel.getDegree: double;
begin
  result := ConvertDegree(RadToDeg(FDegree));
end;

procedure TRotWheel.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var sx, sy: integer;
    d: double;
begin
  sx := X - FCt.X;
  sy := Y - FCt.Y;
  d := Sqrt(Abs(sx * sx + sy * sy));
  FDrag :=  d < FRSize;
  if FDrag then begin
    FDegree := ArcTan2(-sy, sx);
    UpdateDegree;
    Paint;
  end;


  inherited;
end;

procedure TRotWheel.MouseMove(Shift: TShiftState; X, Y: Integer);
var sx, sy: integer;
begin
  if FDrag then begin
    sx := X - FCt.X;
    sy := Y - FCt.Y;
    FDegree := ArcTan2(-sy, sx);
    UpdateDegree;
    Paint;
  end;

  inherited;
end;

procedure TRotWheel.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  FDrag := false;

  inherited;
end;

end.
