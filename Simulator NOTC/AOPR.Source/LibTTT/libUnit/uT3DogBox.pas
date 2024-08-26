unit uT3DogBox;

interface
uses
  uObjectVisuals, uCoordConvertor, Graphics, Types, Math, uBaseCoordSystem;
type
  TT3DogBox = class
    private
      FExpiredTime: Double;
      FSearchRadius: Double;
      FParentX: Double;
      FParentY: Double;
      FRangeDogBox : TRangeVisual;
      FCenterDogBox : TRangeVisual;
      FTextExpiredTime : TTextVisual;
      FCenterPoint: TPoint;
      FVisible: Boolean;
      FConverter: TCoordConverter;
      FIndexDogBox: Integer;

      procedure SetExpiredTime(const Value: Double);
      procedure SetSearchRadius(const Value: Double);
      procedure SetVisible(const Value: Boolean);
      procedure SetConverter(const Value: TCoordConverter);
      procedure SetIndexDogBox(const Value: Integer);
    public
      constructor Create;
      destructor  Destroy;override;

      procedure Move(const aDeltaMs: double);
      procedure Draw(aCnv: tCanvas);
      procedure UpdateVisual;

      property SearchRadius : Double  read FSearchRadius write SetSearchRadius;
      property ExpiredTime : Double  read FExpiredTime write SetExpiredTime;
  //    property CenterPoint : TPoint read FCenterPoint write SetCenterPoint;
      property ParentX : Double read FParentX write FParentX;
      property ParentY : Double read FParentY write FParentY;
      property VisibLe : Boolean read FVisible write SetVisible;
      property Converter : TCoordConverter read FConverter write SetConverter;
      property IndexDogBox : Integer  read FIndexDogBox write SetIndexDogBox;
    end;

implementation

uses
  SysUtils;

{ TT3DogBox }

constructor TT3DogBox.Create;
begin
  inherited;
  FRangeDogBox := TRangeVisual.Create;
  FCenterDogBox := TRangeVisual.Create;

  FTextExpiredTime := TTextVisual.Create;
  FTextExpiredTime.Color    := clBlack;
  FTextExpiredTime.Size     := 6;
  FTextExpiredTime.FontName := 'Tahoma';
  FTextExpiredTime.Offset.X := 0;
  FTextExpiredTime.Offset.Y := 0;
end;

destructor TT3DogBox.Destroy;
begin
  FTextExpiredTime.Free;
  FCenterDogBox.Free;
  FRangeDogBox.Free;

  inherited;
end;

procedure TT3DogBox.Draw(aCnv: tCanvas);
begin
  if FVisible then
  begin
    FCenterDogBox.LineStyles := psSolid;
    FCenterDogBox.Draw(aCnv);

    FRangeDogBox.LineStyles := psInsideFrame;
    FRangeDogBox.Draw(aCnv);

    FTextExpiredTime.Draw(aCnv);
  end;
end;

procedure TT3DogBox.Move(const aDeltaMs: double);
begin

  FExpiredTime := FExpiredTime - aDeltaMs;
end;

procedure TT3DogBox.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

procedure TT3DogBox.SetExpiredTime(const Value: Double);
begin
  FExpiredTime := Value;
end;

procedure TT3DogBox.SetIndexDogBox(const Value: Integer);
begin
  FIndexDogBox := Value;
end;

procedure TT3DogBox.SetSearchRadius(const Value: Double);
begin
  FSearchRadius := Value;
end;

procedure TT3DogBox.SetVisible(const Value: Boolean);
begin
  FVisible := Value;

  FRangeDogBox.Visible := Value;
  FCenterDogBox.Visible := Value;
  FTextExpiredTime.Visible := Value;
end;

procedure TT3DogBox.UpdateVisual;
  function IntToDateTime(const int: Integer):TDateTime;
  begin
    result := int / (60 * 60 * 24 ) ;
  end;
begin

  FRangeDogBox.mX := FParentX;
  FRangeDogBox.mY := FParentY;
  FRangeDogBox.Color := clRed;
  FRangeDogBox.Range := FSearchRadius;
  FRangeDogBox.ConvertCoord(Converter);

  FCenterDogBox.mX := FParentX;
  FCenterDogBox.mY := FParentY;
  FCenterDogBox.Color := clRed;
  FCenterDogBox.Range := 0.1;
  FCenterDogBox.ConvertCoord(Converter);

  Converter.ConvertToScreen(FParentX, FParentY, FCenterPoint.X, FCenterPoint.Y);

  FTextExpiredTime.Color := clRed;
  FTextExpiredTime.Text := FormatDateTime('nn:ss', IntToDateTime(Ceil(FExpiredTime)));
  FTextExpiredTime.Center := FCenterPoint;
  FTextExpiredTime.ConvertCoord(Converter);
end;

end.
