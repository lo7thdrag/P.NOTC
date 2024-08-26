unit uT3MissileEnvironment;

interface

uses
  Classes, Windows,Graphics, SysUtils,
  uT3Unit, tttData, uSimObjects, uObjectVisuals,
  uT3CounterMeasure, uT3Vehicle, uCoordConvertor, uDataTypes,
  uDBCubicles, uT3Common, uT3DetectedTrack, uLibSettingTTT,
  uBaseCoordSystem, uSnapshotData;

type
//==============================================================================
  //Waypoint Missile
  //RBLW
  TPointVehicleMissileRBLW = class(TSimObject)
    private
      FPointRBLW_X1   : Double;
      FPointRBLW_Y1   : Double;
      FNameRBLW       : string;
      FTacticalSymbol : TTacticalSymbol;
      FSelected       : Boolean;
      FIndexPoint     : Integer;
      FlauncherIndex  : Integer;
      FisChange       : Boolean;
      FDistanceToTarget : Double;
      FIsEdit         : Boolean;
      FIsOriginal     : Boolean;
      FOwnerID        : Integer;
    public
      constructor Create(aX, aY: Double; aID, aLauncherID, aOwnerID: Integer);
      destructor Destroy; override;

      function  GetSnapshotData : _SS_TPointVehicleMissileRBLW ;
      procedure SetSnapshotData(const ss : _SS_TPointVehicleMissileRBLW);
      procedure SetSelected(const Value: boolean);
      procedure DrawPointRBLW(aCnv : TCanvas);
      procedure RepositionTo(Mx, My : Double);

      property PointRBLW_X1     : Double  read FPointRBLW_X1  write FPointRBLW_X1;
      property PointRBLW_Y1     : Double  read FPointRBLW_Y1  write FPointRBLW_Y1;
      property NameRBLW         : string  read FNameRBLW      write FNameRBLW;
      property Selected         : Boolean read FSelected      write SetSelected;
      property IndexPoint       : Integer read FIndexPoint    write FIndexPoint;
      property LauncherIndex    : Integer read FlauncherIndex write FlauncherIndex;
      property IsChange         : Boolean read FisChange      write FisChange;
      property DistanceToTarget : Double read FDistanceToTarget write FDistanceToTarget;
      property IsEdit           : Boolean read FIsEdit write FIsEdit;
      property IsOriginal       : Boolean read FIsOriginal write FIsOriginal;
      property OwnerID          : Integer read FOwnerID write FOwnerID;
  end;

  //BOLW
  TPointVehicleMissileBOLW = class(TSimObject)
    private
      FPointBOLW_X1   : Double;
      FPointBOLW_Y1   : Double;
      FNameBOLW       : string;
      FTacticalSymbol : TTacticalSymbol;
      FSelected       : Boolean;
      FIndexPoint     : Integer;
      FlauncherIndex  : Integer;
      FisChange       : Boolean;
      FDistanceToTarget : Double;
      FIsEdit         : Boolean;
      FIsOriginal     : Boolean;
      FOwnerID        : Integer;
    public
      constructor Create(aX, aY: Double; aID, aLauncherID, aOwnerID: Integer);
      destructor Destroy; override;

      function GetSnapshotData : _SS_TPointVehicleMissileBOLW ;
      procedure SetSnapshotData(const ss : _SS_TPointVehicleMissileBOLW);
      procedure SetSelected(const Value: boolean);
      procedure DrawPointBOLW(aCnv : TCanvas);
      procedure RepositionTo(Mx, My : Double);

      property PointBOLW_X1  : Double  read FPointBOLW_X1  write FPointBOLW_X1;
      property PointBOLW_Y1  : Double  read FPointBOLW_Y1  write FPointBOLW_Y1;
      property NameBOLW      : string  read FNameBOLW      write FNameBOLW;
      property Selected      : Boolean read FSelected      write SetSelected;
      property IndexPoint    : Integer read FIndexPoint    write FIndexPoint;
      property LauncherIndex : Integer read FlauncherIndex write FlauncherIndex;
      property IsChange      : boolean read FisChange      write FisChange;
      property DistanceToTarget : Double read FDistanceToTarget write FDistanceToTarget;
      property IsEdit        : Boolean read FIsEdit write FIsEdit;
      property IsOriginal    : Boolean read FIsOriginal write FIsOriginal;
      property OwnerID       : Integer read FOwnerID write FOwnerID;
  end;


//==============================================================================
  //Missile Movement
  TT3LaunchMovement_Missile = class
    private
      FConverter: TCoordConverter;
      procedure SetConverter(const Value: TCoordConverter);
    public
      constructor create;
      destructor Destroy;override;

      function calcCrossSection(aMis, aTgt : TT3PlatformInstance): double;
      property Converter : TCoordConverter read FConverter write SetConverter;
  end;


  //BOL -> Bearing On Launch
  TT3BOL_Missile = class(TT3LaunchMovement_Missile)
  private
    FisEnable : Boolean;
    FBOL_Point1_X : Double;
    FBOL_Point1_Y : Double;
    FBOL_Point2_X : Double;
    FBOL_Point2_Y : Double;
    FBOL_Point3_X : Double;
    FBOL_Point3_Y : Double;
    FBOL_Point4_X : Double;
    FBOL_Point4_Y : Double;
    FEnd_PointBOl_X : Double;
    FEnd_PointBOl_Y : Double;
    FStart_PointBOl_X : Double;
    FStart_PointBOl_Y : Double;
  public
    constructor create;
    destructor Destroy;override;

    procedure Initialize;
    procedure DrawDestructRangeofBOL(acnv: Tcanvas; Mis : TObject);

    function ValidateObject(aMis, aTgt : TSimObject) : TSimObject;
    function TargetInsideDestructArea(aTarget: TSimObject): Boolean;

    property isEnable : Boolean read FisEnable write FisEnable;
    property BOL_Point1_X : Double read FBOL_Point1_X write FBOL_Point1_X;
    property BOL_Point1_Y : Double read FBOL_Point1_Y write FBOL_Point1_Y;
    property BOL_Point2_X : Double read FBOL_Point2_X write FBOL_Point2_X;
    property BOL_Point2_Y : Double read FBOL_Point2_Y write FBOL_Point2_Y;
    property BOL_Point3_X : Double read FBOL_Point3_X write FBOL_Point3_X;
    property BOL_Point3_Y : Double read FBOL_Point3_Y write FBOL_Point3_Y;
    property BOL_Point4_X : Double read FBOL_Point4_X write FBOL_Point4_X;
    property BOL_Point4_Y : Double read FBOL_Point4_Y write FBOL_Point4_Y;
    property End_PointBOl_X : Double read FEnd_PointBOl_X write FEnd_PointBOl_X;
    property End_PointBOl_Y : Double read FEnd_PointBOl_Y write FEnd_PointBOl_Y;
    property Start_PointBOl_X : Double read FStart_PointBOl_X write FStart_PointBOl_X;
    property Start_PointBOl_Y : Double read FStart_PointBOl_Y write FStart_PointBOl_Y;
  end;

  //RBL
  TT3RBL_Missile = class(TT3LaunchMovement_Missile)
    private
    public
      constructor create;
      destructor Destroy; override;

      procedure DrawCircleofRBL(acnv: Tcanvas; Mis : TObject);
      procedure Initialize;
      function ValidateObject(aMis, aTgt : TSimObject) : TSimObject;
  end;

  //Straight/Direct
  TT3Straight_Missile = class(TT3LaunchMovement_Missile)
    private
    public
      constructor create;
      destructor Destroy; override;

      procedure Initialize;
      function ValidateObject(aMis, aTgt : TSimObject) : TSimObject;
  end;

  //Aimpoint
  TT3Aimpoint_Missile = class(TT3LaunchMovement_Missile)
    private
      FPositionX : Double;
      FPositionY : Double;
    public
      constructor create;
      destructor Destroy; override;

      procedure Initialize;
      function ValidateObject(aMis, aTgt : TSimObject) : TSimObject;

      property PositionX : Double read FPositionX write FPositionX;
      property PositionY : Double read FPositionY write FPositionY;
  end;

  //Bearing Only
  TT3BearingOnly_Missile = class(TT3LaunchMovement_Missile)
    private
      FBearingLaunch : Double;
    public
      constructor create;
      destructor Destroy; override;

      procedure Initialize;
      function ValidateObject(aMis, aTgt : TSimObject) : TSimObject;

      Property BearingLaunch : Double read FBearingLaunch write FBearingLaunch;
  end;

  //PopUp/SeaSkim
  TT3Hit_Missile = class(TT3LaunchMovement_Missile)
  private
    FPopUp_Move      : TPopUpMode;
    FHAFO            : Double;
    FHighCurve       : Double;
    FStartCurve      : Double;
    FisHAFOSet       : Boolean;
    FisPopUP         : Boolean;
    FisHavePopUp     : Boolean;
    FTargettoPopUp   : TSimObject;
  public
    constructor create;
    destructor Destroy; override;
    procedure Initialize;

    property PopUp_Move  : TPopUpMode read FPopUp_Move write FPopUp_Move;
    property HAFO        : Double     read FHAFO       write FHAFO;
    property HighCurve   : Double     read FHighCurve  write FHighCurve;
    property StartCurve  : Double     read FStartCurve write FStartCurve;
    property isHAFOSet       : Boolean read FisHAFOSet write FisHAFOSet;
    property isPopUP         : Boolean read FisPopUP write FisPopUP;
    property isHavePopUp     : Boolean read FisHavePopUp write FisHavePopUp;
    property TargettoPopUp   : TSimObject read FTargettoPopUp write FTargettoPopUp;
  end;

implementation

uses uT3Missile;


//================================================================================
{ TT3BOL_Missile }

constructor TT3BOL_Missile.create;
begin

end;

destructor TT3BOL_Missile.destroy;
begin

  inherited;
end;

procedure TT3BOL_Missile.DrawDestructRangeofBOL(acnv: Tcanvas; Mis: TObject);
var
  missile : TT3missile;
  aPolygon : array[0..3] of TPoint;
begin
  if not (Mis is TT3Missile) then
    Exit;

  missile := TT3Missile(mis);

  with aCnv do
  begin
    Pen.Color := clSilver;
    Pen.Style := psSolid;
    Pen.Width := 1;
    Brush.Style := bsClear;

    Converter.ConvertToScreen(BOL_Point1_X, BOL_Point1_Y, aPolygon[0].X, aPolygon[0].Y);
    Converter.ConvertToScreen(BOL_Point2_X, BOL_Point2_Y, aPolygon[1].X, aPolygon[1].Y);
    Converter.ConvertToScreen(BOL_Point3_X, BOL_Point3_Y, aPolygon[2].X, aPolygon[2].Y);
    Converter.ConvertToScreen(BOL_Point4_X, BOL_Point4_Y, aPolygon[3].X, aPolygon[3].Y);

    //           /P1 ------------------------ P2
    //          /   |                           |
    // OWN SHIP ----|      BOL DESTRUCTION      |
    //          \   |                           |
    //           \P4 ------------------------ P3
    Polygon(aPolygon);

//    aCnv.Font.Color := clRed;
//    aCnv.Font.Size := 12;
//    aCnv.TextOut(aPolygon[0].X,aPolygon[0].Y, 'P1');
//    aCnv.TextOut(aPolygon[1].X,aPolygon[1].Y, 'P2');
//    aCnv.TextOut(aPolygon[2].X,aPolygon[2].Y, 'P3');
//    aCnv.TextOut(aPolygon[3].X,aPolygon[3].Y, 'P4');
  end;
end;

procedure TT3BOL_Missile.Initialize;
begin

end;

function TT3BOL_Missile.TargetInsideDestructArea(aTarget: TSimObject): Boolean;
var
  x, y,
  x1, y1,
  x2, y2,
  x3, y3,
  x4, y4 : Integer;
begin
  Converter.ConvertToScreen(TT3PlatformInstance(aTarget).PosX,
    TT3PlatformInstance(aTarget).PosY, x, y);
  Converter.ConvertToScreen(BOL_Point1_X, BOL_Point1_Y, x1, y1);
  Converter.ConvertToScreen(BOL_Point2_X, BOL_Point2_Y, x2, y2);
  Converter.ConvertToScreen(BOL_Point3_X, BOL_Point3_Y, x3, y3);
  Converter.ConvertToScreen(BOL_Point4_X, BOL_Point4_Y, x4, y4);

  Result := IsPointInPolygon(x, y, x1, y1, x2, y2, x3, y3, x4, y4);
end;

function TT3BOL_Missile.ValidateObject(aMis, aTgt : TSimObject) : TSimObject;
var
  range, rcs, RcstoRange, minRCS : double;

  //Point In Poligon
  PointShip : t2DPoint; // Point
  PointBOl1, PointBol2, PointBol3, PointBol4 : t2DPoint; //Poligon
begin
  result := nil;
  rcs    := 0;

  //           /P1 ------------------------ P2
  //          /   |                           |
  // OWN SHIP ----|      BOL DESTRUCTION      |
  //          \   |                           |
  //           \P4 ------------------------ P3

  range   := CalcRange3D(aMis.getPositionX, aMis.getPositionY,
                         aTgt.getPositionX, aTgt.getPositionY,
                         aMis.getPositionZ, aTgt.getPositionZ) * C_NauticalMile_To_Metre;

  //Point Ship
  PointShip.X := TT3PlatformInstance(aTgt).getPositionX;
  PointShip.Y := TT3PlatformInstance(aTgt).getPositionY;

  //Poligon Point
  PointBOl1.X := BOL_Point1_X;
  PointBOl1.Y := BOL_Point1_Y;
  PointBol2.X := BOL_Point2_X;
  PointBol2.Y := BOL_Point2_Y;
  PointBol3.X := BOL_Point3_X;
  PointBol3.Y := BOL_Point3_Y;
  PointBol4.X := BOL_Point4_X;
  PointBol4.Y := BOL_Point4_Y;

  if not PointInPoligonLangLot(PointShip, PointBOl1, PointBOl2, PointBOl3, PointBOl4) then
    Exit;

  minRCS := 60 / (7 * C_NauticalMile_To_Metre); // anggap maximum RCS yg didefinisikan 60dbm2, dan jarak deteksi max 2 nm

  // deteksi chaff
  if aTgt is TT3Chaff then
  begin

    if range = 0 then
      RcstoRange := 100000000
    else
      RcstoRange := TT3Chaff(aTgt).RCS / ( range );

    if RcstoRange <= minRCS then
      exit;

    if rcs <= RcstoRange then
      result := aTgt;
  end
  // deteksi vehicle
  else
  begin

    if range = 0 then
      RcstoRange := 100000000
    else
      RcstoRange := calcCrossSection(TT3Missile(aMis),TT3Vehicle(aTgt)) / ( range );

    if RcstoRange <= minRCS then
      exit;

    if rcs <= RcstoRange then
      result := aTgt;
  end;
end;

//================================================================================

//================================================================================
{ TT3RBL_Missile }

constructor TT3RBL_Missile.create;
begin

end;

destructor TT3RBL_Missile.destroy;
begin

  inherited;
end;

procedure TT3RBL_Missile.DrawCircleofRBL(acnv: Tcanvas; Mis: TObject);
var
  Rects : TRect;

  i,r,j  : Integer;
  pi : TT3PlatformInstance;
  tg : TT3DetectedTrack;

  Ratio : Double;

  DistanceMissileToTarget, DistanceHomeToTarget, DistanceShipToTarget : Double;
  RangeCircleRBLShip, RangeCircleRBLTarget : Double;
  RangeCircleRBLShipShrink, RangeCircleRBLTargetShrink : Double;

  pt : TPoint;
  dx, dy : Double;

  CoorShipX, CoorShipY : Double;
  tCoorShipX, tCoorShipY : integer;

  grp : T3CubicleGroup;
  gm  : T3CubicleGroupMember;

  isFound : Boolean;

  Missile : TT3missile;

  x1, y1, x2, y2 : integer;
begin
  if not (Mis is TT3Missile) then Exit;
  Missile := TT3Missile(mis);

  with acnv do
  begin
    Pen.Color := clSilver;
    Pen.Style := psSolid;
    Pen.Width := 1;
    Brush.Style := bsClear;

    RangeCircleRBLShip := 5/60; //5 nouctical mile
    RangeCircleRBLTarget := 0.9 * RangeCircleRBLShip; // For Target object
    RangeCircleRBLShipShrink := 0;

    //Draw Circle in All Ship
    if Missile.isInstructor or Missile.isWasdal then
    begin
      //Draw Circle in All Target (TT3platformInstance)
      if not Assigned(Missile.TargetPlatforms) then Exit;
      if not Assigned(Missile.target) then Exit;


      for i := 0 to Missile.TargetPlatforms.itemCount - 1 do
      begin
        pi := Missile.TargetPlatforms.getObject(i) as TT3PlatformInstance;

        if pi is TT3Vehicle then
        begin
          if TT3Vehicle(pi) = TT3Vehicle(Missile.Owner) then
            Continue;

          if TT3Vehicle(pi) = TT3Vehicle(Missile.target) then
            Continue;

          DistanceMissileToTarget := CalcRange(Missile.getPositionX, Missile.getPositionY,
                TT3Vehicle(Missile.Target).getPositionX, TT3Vehicle(Missile.Target).getPositionY);
          DistanceHomeToTarget    := CalcRange(Missile.Owner.getPositionX, Missile.Owner.getPositionY,
                TT3Vehicle(Missile.Target).getPositionX, TT3Vehicle(Missile.Target).getPositionY);
          DistanceShipToTarget    := CalcRange(TT3Vehicle(Missile.target).getPositionX, TT3Vehicle(Missile.target).getPositionY,
                TT3Vehicle(pi).getPositionX, TT3Vehicle(pi).getPositionY);

          if DistanceHomeToTarget <> 0 then
            Ratio := DistanceMissileToTarget / DistanceHomeToTarget
          else
            Ratio := DistanceMissileToTarget;

          if (Ratio <= 1) and (Ratio > 0.4) then
            RangeCircleRBLShipShrink   := RangeCircleRBLShip * Ratio
          else
          if (Ratio > 1) then
            RangeCircleRBLShipShrink   := RangeCircleRBLShip
          else
          if (Ratio < 0.4) then
            RangeCircleRBLShipShrink   := RangeCircleRBLShip * 0.4;

          if (not TT3Vehicle(pi).Dormant) and (DistanceShipToTarget < 25) then
          begin
            CoorShipX := TT3Vehicle(pi).getPositionX;
            CoorShipY := TT3Vehicle(pi).getPositionY;

            dx := CoorShipX + RangeCircleRBLShipShrink;
            dy := CoorShipY;

            Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
            Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

            r := Abs(pt.X - tCoorShipX);

            Rects.Top     := tCoorShipY - r;
            Rects.Left    := tCoorShipX - r;
            Rects.Bottom  := tCoorShipY + r;
            Rects.Right   := tCoorShipX + r;

            Ellipse(Rects);
          end;
        end;
      end;
    end
    else
    begin
      //Draw Circle in All Target (TT3detectedTrack & Fmygroup)
      //Draw Circle in DetectecTrack
      if not Assigned(Missile.DetectPlatform) then
        Exit;

      if not Assigned(Missile.target) then Exit;

      for i := 0 to Missile.DetectPlatform.itemCount - 1 do
      begin
        if Missile.DetectPlatform.getObject(i) is TT3DetectedTrack then
        begin
          tg := Missile.DetectPlatform.getObject(i) as TT3DetectedTrack;

          if Assigned(tg.TrackObject) then
          begin
            if tg.TrackObject.InstanceIndex = TT3Vehicle(Missile.Owner).InstanceIndex then
              Continue;

            if tg.TrackObject.InstanceIndex = TT3Vehicle(Missile.target).InstanceIndex then
              Continue;

            DistanceMissileToTarget := CalcRange(Missile.getPositionX, Missile.getPositionY,
                TT3Vehicle(Missile.Target).getPositionX, TT3Vehicle(Missile.Target).getPositionY);
            DistanceHomeToTarget    := CalcRange(Missile.Owner.getPositionX, Missile.Owner.getPositionY,
                TT3Vehicle(Missile.Target).getPositionX, TT3Vehicle(Missile.Target).getPositionY);
            DistanceShipToTarget    := CalcRange(TT3Vehicle(Missile.target).getPositionX,
                TT3Vehicle(Missile.target).getPositionY, tg.getPositionX,
                tg.getPositionY);

            if DistanceHomeToTarget <> 0 then
              Ratio := DistanceMissileToTarget / DistanceHomeToTarget
            else
              Ratio := DistanceMissileToTarget;

            if (Ratio <= 1) and (Ratio > 0.4) then
              RangeCircleRBLShipShrink   := RangeCircleRBLShip * Ratio
            else
            if (Ratio > 1) then
              RangeCircleRBLShipShrink   := RangeCircleRBLShip
            else
            if (Ratio < 0.4) then
              RangeCircleRBLShipShrink   := RangeCircleRBLShip * 0.4;

            if (not (tg.Dormant)) and (DistanceShipToTarget < 25) then
            begin
              CoorShipX := tg.getPositionX;
              CoorShipY := tg.getPositionY;

              dx := CoorShipX + RangeCircleRBLShipShrink;
              dy := CoorShipY;

              Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
              Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

              r := Abs(pt.X - tCoorShipX);

              Rects.Top     := tCoorShipY - r;
              Rects.Left    := tCoorShipX - r;
              Rects.Bottom  := tCoorShipY + r;
              Rects.Right   := tCoorShipX + r;

              Ellipse(Rects);
            end;
          end;
        end;
      end;

      //Draw Circle in FmyCub
      if not Assigned(Missile.TargetPlatforms) then
        Exit;

      for i := 0 to Missile.TargetPlatforms.itemCount - 1 do
      begin
        if Missile.TargetPlatforms.getObject(i) is TT3PlatformInstance then
        begin
          pi := Missile.TargetPlatforms.getObject(i) as TT3PlatformInstance;

          if pi is TT3Vehicle then
          begin
            if TT3Vehicle(pi) = TT3Vehicle(Missile.Owner) then Continue;
            if TT3Vehicle(pi) = TT3Vehicle(Missile.target) then Continue;
            if not Assigned(Missile.SameGroupPlatform) then continue;

            for j := 0 to Missile.SameGroupPlatform.Count - 1 do
            begin
              gm := Missile.SameGroupPlatform.Items[j] as T3CubicleGroupMember;
              if gm = nil then
                continue;

              if TT3Vehicle(pi).InstanceIndex = gm.FData.Platform_Instance_Index then
              begin
                DistanceMissileToTarget := CalcRange(Missile.getPositionX, Missile.getPositionY,
                    TT3Vehicle(Missile.Target).getPositionX, TT3Vehicle(Missile.Target).getPositionY);
                DistanceHomeToTarget    := CalcRange(Missile.Owner.getPositionX, Missile.Owner.getPositionY,
                    TT3Vehicle(Missile.Target).getPositionX, TT3Vehicle(Missile.Target).getPositionY);
                DistanceShipToTarget    := CalcRange(TT3Vehicle(Missile.target).getPositionX,
                    TT3Vehicle(Missile.target).getPositionY, TT3Vehicle(pi).getPositionX,
                    TT3Vehicle(pi).getPositionY);

                if DistanceHomeToTarget <> 0 then
                  Ratio := DistanceMissileToTarget / DistanceHomeToTarget
                else
                  Ratio := DistanceMissileToTarget;

                if (Ratio <= 1) and (Ratio > 0.4) then
                  RangeCircleRBLShipShrink   := RangeCircleRBLShip * Ratio
                else
                if (Ratio > 1) then
                  RangeCircleRBLShipShrink   := RangeCircleRBLShip
                else
                if (Ratio < 0.4) then
                  RangeCircleRBLShipShrink   := RangeCircleRBLShip * 0.4;

                if (not TT3Vehicle(pi).Dormant) and (DistanceShipToTarget < 25) then
                begin
                  CoorShipX := TT3Vehicle(pi).getPositionX;
                  CoorShipY := TT3Vehicle(pi).getPositionY;

                  dx := CoorShipX + RangeCircleRBLShipShrink;
                  dy := CoorShipY;

                  Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
                  Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

                  r := Abs(pt.X - tCoorShipX);

                  Rects.Top     := tCoorShipY - r;
                  Rects.Left    := tCoorShipX - r;
                  Rects.Bottom  := tCoorShipY + r;
                  Rects.Right   := tCoorShipX + r;

                  Ellipse(Rects);
                end;
              end;
            end;
          end;
        end;
      end;
    end;

    //Draw Circle in Owner Ship
    if (Assigned(Missile.target)) and (Missile.Target is TT3Vehicle) then
    begin
      DistanceMissileToTarget := CalcRange(Missile.getPositionX, Missile.getPositionY,
           TT3Vehicle(Missile.Target).getPositionX, TT3Vehicle(Missile.Target).getPositionY);
      DistanceHomeToTarget    := CalcRange(Missile.Owner.getPositionX, Missile.Owner.getPositionY,
           TT3Vehicle(Missile.Target).getPositionX, TT3Vehicle(Missile.Target).getPositionY);

      if DistanceHomeToTarget <> 0 then
        Ratio := DistanceMissileToTarget / DistanceHomeToTarget
      else
        Ratio := DistanceMissileToTarget;

      if (Ratio <= 1) and (Ratio > 0.4) then
        RangeCircleRBLShipShrink   := RangeCircleRBLShip * Ratio
      else
      if (Ratio > 1) then
        RangeCircleRBLShipShrink   := RangeCircleRBLShip
      else
      if (Ratio < 0.4) then
        RangeCircleRBLShipShrink   := RangeCircleRBLShip * 0.4;

      if (not TT3Vehicle(Missile.target).Dormant) and (DistanceHomeToTarget < 25) then
      begin
        CoorShipX := TT3Vehicle(Missile.Owner).getPositionX;
        CoorShipY := TT3Vehicle(Missile.Owner).getPositionY;

        dx := CoorShipX + RangeCircleRBLShipShrink;
        dy := CoorShipY;

        Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
        Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

        r := Abs(pt.X - tCoorShipX);

        Rects.Top     := tCoorShipY - r;
        Rects.Left    := tCoorShipX - r;
        Rects.Bottom  := tCoorShipY + r;
        Rects.Right   := tCoorShipX + r;

        Ellipse(Rects);
      end;
    end;

    //Draw Circle in Target
    if (Assigned(Missile.target)) and (Missile.Target is TT3Vehicle) then
    begin
      DistanceMissileToTarget := CalcRange(Missile.getPositionX, Missile.getPositionY,
          TT3Vehicle(Missile.Target).getPositionX, TT3Vehicle(Missile.Target).getPositionY);
      DistanceHomeToTarget    := CalcRange(Missile.Owner.getPositionX, Missile.Owner.getPositionY,
          TT3Vehicle(Missile.Target).getPositionX, TT3Vehicle(Missile.Target).getPositionY);

      if DistanceHomeToTarget <> 0 then
        Ratio := DistanceMissileToTarget / DistanceHomeToTarget
      else
        Ratio := DistanceMissileToTarget;

      if (Ratio <= 1) and (Ratio > 0.4) then
      begin
        RangeCircleRBLShipShrink   := RangeCircleRBLShip * Ratio;
        RangeCircleRBLTargetShrink := RangeCircleRBLTarget * Ratio;
      end
      else
      if (Ratio > 1) then
      begin
        RangeCircleRBLShipShrink   := RangeCircleRBLShip;
        RangeCircleRBLTargetShrink := RangeCircleRBLTarget;
      end
      else
      if (Ratio < 0.4) then
      begin
        RangeCircleRBLShipShrink   := RangeCircleRBLShip * 0.4;
        RangeCircleRBLTargetShrink := RangeCircleRBLTarget * 0.4;
      end;

      if (not TT3Vehicle(Missile.target).Dormant) then
      begin
        //Draw Circle 1
        CoorShipX := TT3Vehicle(Missile.Target).getPositionX;
        CoorShipY := TT3Vehicle(Missile.target).getPositionY;

        dx := CoorShipX + RangeCircleRBLShipShrink;
        dy := CoorShipY;

        Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
        Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

        r := Abs(pt.X - tCoorShipX);

        Rects.Top     := tCoorShipY - r;
        Rects.Left    := tCoorShipX - r;
        Rects.Bottom  := tCoorShipY + r;
        Rects.Right   := tCoorShipX + r;

        Ellipse(Rects);

        //Draw Circle 2
        CoorShipX := TT3Vehicle(Missile.Target).getPositionX;
        CoorShipY := TT3Vehicle(Missile.target).getPositionY;

        dx := CoorShipX + RangeCircleRBLTargetShrink;
        dy := CoorShipY;

        Converter.ConvertToScreen(CoorShipX, CoorShipY, tCoorShipX, tCoorShipY);
        Converter.ConvertToScreen(dx, dy, pt.X, pt.Y);

        r := Abs(pt.X - tCoorShipX);

        Rects.Top     := tCoorShipY - r;
        Rects.Left    := tCoorShipX - r;
        Rects.Bottom  := tCoorShipY + r;
        Rects.Right   := tCoorShipX + r;

        Ellipse(Rects);
      end;
    end;
  end;
end;

procedure TT3RBL_Missile.Initialize;
begin

end;

function TT3RBL_Missile.ValidateObject(aMis, aTgt : TSimObject): TSimObject;
var
  bearing, range,
  rcs, RcstoRange, minRCS : double;
begin
  result := nil;
  rcs    := 0;

  range   := CalcRange3D(aMis.getPositionX, aMis.getPositionY,
                         aTgt.getPositionX, aTgt.getPositionY,
                         aMis.getPositionZ, aTgt.getPositionZ) * C_NauticalMile_To_Metre;

  bearing := Calcbearing(aMis.getPositionX, aMis.getPositionY, aTgt.getPositionX, aTgt.getPositionY);

  if not InsideAngleOfView(TT3Missile(aMis).Course,60,bearing) then exit;

  minRCS := 60 / (7 * C_NauticalMile_To_Metre); // anggap maximum RCS yg didefinisikan 60dbm2, dan jarak deteksi max 2 nm

  // deteksi chaff
  if aTgt is TT3Chaff then
  begin
    if range = 0 then
      RcstoRange := 100000000
    else
      RcstoRange := TT3Chaff(aTgt).RCS / ( range );

    if RcstoRange <= minRCS then
      exit;

    if rcs <= RcstoRange then
      result := aTgt;
  end
  // deteksi vehicle
  else
  begin
    if range = 0 then
      RcstoRange := 100000000
    else
      RcstoRange := calcCrossSection(TT3Missile(aMis),TT3Vehicle(aTgt)) / ( range );

    if RcstoRange <= minRCS then
      exit;

    if rcs <= RcstoRange then
      Result := aTgt;
  end;
end;

//================================================================================

//================================================================================

{ TT3Straight_Missile }

constructor TT3Straight_Missile.create;
begin

end;

destructor TT3Straight_Missile.destroy;
begin

  inherited;
end;

procedure TT3Straight_Missile.Initialize;
begin

end;

function TT3Straight_Missile.ValidateObject(aMis, aTgt : TSimObject) : TSimObject;
var
  bearing, range,
  rcs, RcstoRange, minRCS : double;
begin
  result := nil;
  rcs    := 0;

  range   := CalcRange3D(aMis.getPositionX, aMis.getPositionY,
                         aTgt.getPositionX, aTgt.getPositionY,
                         aMis.getPositionZ, aTgt.getPositionZ) * C_NauticalMile_To_Metre;

  bearing := Calcbearing(aMis.getPositionX, aMis.getPositionY, aTgt.getPositionX, aTgt.getPositionY);

  if not InsideAngleOfView(TT3Missile(aMis).Course,60,bearing) then
    exit;

  //anggap maximum RCS yg didefinisikan 60dbm2, dan jarak deteksi max 2 nm
  minRCS := 60 / (25 * C_NauticalMile_To_Metre);

  // deteksi chaff
  if aTgt is TT3Chaff then
  begin
    if range = 0 then
      RcstoRange := 100000000
    else
      RcstoRange := TT3Chaff(aTgt).RCS / ( range );

    if RcstoRange <= minRCS then
      exit;

    if rcs <= RcstoRange then
      result := aTgt;
  end
  // deteksi vehicle
  else
  begin
    if range = 0 then
      RcstoRange := 100000000
    else
      RcstoRange := calcCrossSection(TT3Missile(aMis),TT3Vehicle(aTgt)) / ( range );

    if RcstoRange <= minRCS then
      exit;

    if rcs <= RcstoRange then
      result := aTgt;
  end;
end;
//================================================================================

//================================================================================
{ TT3Hit_Missile }

constructor TT3Hit_Missile.create;
begin

end;

destructor TT3Hit_Missile.destroy;
begin

  inherited;
end;

procedure TT3Hit_Missile.Initialize;
begin

end;
//================================================================================

{ TT3Launch_Missile }

function TT3LaunchMovement_Missile.calcCrossSection(aMis,
  aTgt: TT3PlatformInstance): double;

  function isBetween(val1, val2, valtest : double) : boolean;
  begin
    result := (valtest >= val1) and (valtest <= val2);
  end;
var
  delta : double;
begin
  Result := 0;

  if aTgt is TT3Vehicle then
  begin
    delta := Abs(TT3Missile(aMis).Course - TT3Vehicle(aTgt).Course);

    if isBetween(30,150,delta) or isBetween(240,330,delta) then
      Result := TT3Vehicle(aTgt).VehicleDefinition.FData.Side_Radar_Cross
    else
      Result := TT3Vehicle(aTgt).VehicleDefinition.FData.Front_Radar_Cross;
  end;
end;

constructor TT3LaunchMovement_Missile.create;
begin

end;

destructor TT3LaunchMovement_Missile.destroy;
begin

  inherited;
end;

procedure TT3LaunchMovement_Missile.SetConverter(const Value: TCoordConverter);
begin
  FConverter := Value;
end;

//================================================================================

{ TPointVehicleMissileRBLW }

constructor TPointVehicleMissileRBLW.Create(aX, aY: Double; aID, aLauncherID,
  aOwnerID: Integer);
begin
  FTacticalSymbol := TTacticalSymbol.Create;
  FTacticalSymbol.ConvertCoord(Converter);
//  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + pctWayPoint +
//    '.bmp', clRed);

  FPointRBLW_X1  := aX;
  FPointRBLW_Y1  := aY;
  FNameRBLW      := '+RBLW-' + IntToStr(aID) + '-L' + IntToStr(aLauncherID);
  FIndexPoint    := aID;
  FlauncherIndex := aLauncherID;
  FIsOriginal    := True;
  FOwnerID       := aOwnerID;
end;

destructor TPointVehicleMissileRBLW.destroy;
begin

  inherited;
end;

procedure TPointVehicleMissileRBLW.DrawPointRBLW(aCnv: TCanvas);
var
  tRBLWPointX, tRBLWPointY : Integer;
begin
  FTacticalSymbol.isVehicle := false;

  Converter.ConvertToScreen(FPointRBLW_X1, FPointRBLW_Y1, tRBLWPointX, tRBLWPointY);
  FTacticalSymbol.ConvertCoord(Converter);
//  FTacticalSymbol.Symbol.Center := Point(tRBLWPointX, tRBLWPointY);
  FTacticalSymbol.CallSign1 := FNameRBLW;
  FTacticalSymbol.SetTextCenter(Point(tRBLWPointX, tRBLWPointY));
  FTacticalSymbol.Color := clRed;
  FTacticalSymbol.Draw(aCnv);
end;

procedure TPointVehicleMissileRBLW.RepositionTo(Mx, My: Double);
begin
  FPointRBLW_X1 := Mx;
  FPointRBLW_Y1 := My;
end;

procedure TPointVehicleMissileRBLW.SetSelected(const Value: boolean);
var
  s : string;
begin
  FSelected := Value;
  FTacticalSymbol.Selected := Value;

  s := IntToStr(FlauncherIndex);
end;

function TPointVehicleMissileRBLW.GetSnapshotData : _SS_TPointVehicleMissileRBLW ;
var
  ss : _SS_TPointVehicleMissileRBLW ;
begin
  ss.PointRBLW_X1       := PointRBLW_X1     ;
  ss.PointRBLW_Y1       := PointRBLW_Y1     ;
  ss.NameRBLW           := NameRBLW         ;
  ss.Selected           := Selected         ;
  ss.IndexPoint         := IndexPoint       ;
  ss.LauncherIndex      := LauncherIndex    ;
  ss.IsChange           := IsChange         ;
  ss.DistanceToTarget   := DistanceToTarget ;
  ss.IsEdit             := IsEdit           ;
  ss.IsOriginal         := IsOriginal       ;
  ss.OwnerID            := OwnerID ;
  ss.FObject.ObjectID   := ObjectID ;
  ss.FObject.IsAssigned := IsAssigned ;
  ss.FObject.PosX       := PosX ;
  ss.FObject.PosY       := PosY ;
  ss.FObject.PosZ       := PosZ ;
  Result := ss ;
end;

procedure TPointVehicleMissileRBLW.SetSnapshotData(const ss : _SS_TPointVehicleMissileRBLW);
begin
  PointRBLW_X1       := ss.PointRBLW_X1     ;
  PointRBLW_Y1       := ss.PointRBLW_Y1     ;
  NameRBLW           := ss.NameRBLW         ;
  Selected           := ss.Selected         ;
  IndexPoint         := ss.IndexPoint       ;
  LauncherIndex      := ss.LauncherIndex    ;
  IsChange           := ss.IsChange         ;
  DistanceToTarget   := ss.DistanceToTarget ;
  IsEdit             := ss.IsEdit           ;
  IsOriginal         := ss.IsOriginal       ;
  OwnerID            := ss.OwnerID ;
  ObjectID           := ss.FObject.ObjectID ;
  IsAssigned         := ss.FObject.IsAssigned ;
  PosX               := ss.FObject.PosX ;
  PosY               := ss.FObject.PosY ;
  PosZ               := ss.FObject.PosZ ;
end;

//================================================================================

{ TPointVehicleMissileBOLW }

constructor TPointVehicleMissileBOLW.Create(aX, aY: Double; aID, aLauncherID,
  aOwnerID: Integer);
begin
  FTacticalSymbol := TTacticalSymbol.Create;
  FTacticalSymbol.ConvertCoord(Converter);
//  FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + pctWayPoint +
//    '.bmp', clRed);

  FPointBOLW_X1  := aX;
  FPointBOLW_Y1  := aY;
  FNameBOLW      := '+BOLW-' + IntToStr(aID) + '-L' + IntToStr(aLauncherID);
  FIndexPoint    := aID;
  FlauncherIndex := aLauncherID;
  FIsOriginal    := True;
  FOwnerID       := aOwnerID;
end;

destructor TPointVehicleMissileBOLW.destroy;
begin

  inherited;
end;

procedure TPointVehicleMissileBOLW.DrawPointBOLW(aCnv: TCanvas);
var
  tBOLWPointX, tBOLWPointY : Integer;
begin
  FTacticalSymbol.isVehicle := false;

  Converter.ConvertToScreen(FPointBOLW_X1, FPointBOLW_Y1, tBOLWPointX, tBOLWPointY);
  FTacticalSymbol.ConvertCoord(Converter);
//  FTacticalSymbol.Symbol.Center := Point(tBOLWPointX, tBOLWPointY);
  FTacticalSymbol.CallSign1 := FNameBOLW;
  FTacticalSymbol.SetTextCenter(Point(tBOLWPointX, tBOLWPointY));
  FTacticalSymbol.Color := clRed;
  FTacticalSymbol.Draw(aCnv);
end;

procedure TPointVehicleMissileBOLW.RepositionTo(Mx, My: Double);
begin
  FPointBOLW_X1 := Mx;
  FPointBOLW_Y1 := My;
end;

procedure TPointVehicleMissileBOLW.SetSelected(const Value: boolean);
var
  s : string;
begin
  FSelected := Value;
  FTacticalSymbol.Selected := Value;

  s := IntToStr(FlauncherIndex);
end;


function TPointVehicleMissileBOLW.GetSnapshotData : _SS_TPointVehicleMissileBOLW ;
var
  ss : _SS_TPointVehicleMissileBOLW ;
begin
  ss.PointBOLW_X1     := PointBOLW_X1     ;
  ss.PointBOLW_Y1     := PointBOLW_Y1     ;
  ss.NameBOLW         := NameBOLW         ;
  ss.Selected         := Selected         ;
  ss.IndexPoint       := IndexPoint       ;
  ss.LauncherIndex    := LauncherIndex    ;
  ss.IsChange         := IsChange         ;
  ss.DistanceToTarget := DistanceToTarget ;
  ss.IsEdit           := IsEdit           ;
  ss.IsOriginal       := IsOriginal       ;
  ss.FObject.ObjectID   := ObjectID ;
  ss.FObject.IsAssigned := IsAssigned ;
  ss.FObject.PosX       := PosX ;
  ss.FObject.PosY       := PosY ;
  ss.FObject.PosZ       := PosZ ;
  Result := ss ;
end;

procedure TPointVehicleMissileBOLW.SetSnapshotData(const ss : _SS_TPointVehicleMissileBOLW);
begin
  PointBOLW_X1     := ss.PointBOLW_X1     ;
  PointBOLW_Y1     := ss.PointBOLW_Y1     ;
  NameBOLW         := ss.NameBOLW         ;
  Selected         := ss.Selected         ;
  IndexPoint       := ss.IndexPoint       ;
  LauncherIndex    := ss.LauncherIndex    ;
  IsChange         := ss.IsChange         ;
  DistanceToTarget := ss.DistanceToTarget ;
  IsEdit           := ss.IsEdit           ;
  IsOriginal       := ss.IsOriginal       ;
  ObjectID         := ss.FObject.ObjectID ;
  IsAssigned       := ss.FObject.IsAssigned ;
  PosX             := ss.FObject.PosX ;
  PosY             := ss.FObject.PosY ;
  PosZ             := ss.FObject.PosZ ;
end;


{ TT3Aimpoint_Missile }

constructor TT3Aimpoint_Missile.create;
begin

end;

destructor TT3Aimpoint_Missile.destroy;
begin

  inherited;
end;

procedure TT3Aimpoint_Missile.Initialize;
begin

end;

function TT3Aimpoint_Missile.ValidateObject(aMis, aTgt: TSimObject): TSimObject;
var
  bearing, range,
  rcs, RcstoRange, minRCS : double;
begin
  result := nil;
  rcs    := 0;

  range   := CalcRange3D(aMis.getPositionX, aMis.getPositionY,
                         aTgt.getPositionX, aTgt.getPositionY,
                         aMis.getPositionZ, aTgt.getPositionZ) * C_NauticalMile_To_Metre;

  bearing := Calcbearing(aMis.getPositionX, aMis.getPositionY, aTgt.getPositionX, aTgt.getPositionY);

  if not InsideAngleOfView(TT3Missile(aMis).Course,60,bearing) then exit;

  minRCS := 60 / (7 * C_NauticalMile_To_Metre); // anggap maximum RCS yg didefinisikan 60dbm2, dan jarak deteksi max 2 nm

  // deteksi chaff
  if aTgt is TT3Chaff then
  begin
    if range = 0 then
      RcstoRange := 100000000
    else
      RcstoRange := TT3Chaff(aTgt).RCS / ( range );

    if RcstoRange <= minRCS then
      exit;

    if rcs <= RcstoRange then
      result := aTgt;
  end
  // deteksi vehicle
  else
  begin
    if range = 0 then
      RcstoRange := 100000000
    else
      RcstoRange := calcCrossSection(TT3Missile(aMis),TT3Vehicle(aTgt)) / ( range );

    if RcstoRange <= minRCS then
      exit;

    if rcs <= RcstoRange then
      result := aTgt;
  end;
end;

{ TT3BearingOnly_Missile }

constructor TT3BearingOnly_Missile.create;
begin

end;

destructor TT3BearingOnly_Missile.destroy;
begin

  inherited;
end;

procedure TT3BearingOnly_Missile.Initialize;
begin

end;

function TT3BearingOnly_Missile.ValidateObject(aMis,
  aTgt: TSimObject): TSimObject;
var
  bearing, range,
  rcs, RcstoRange, minRCS : double;
begin
  result := nil;
  rcs    := 0;

  range   := CalcRange3D(aMis.getPositionX, aMis.getPositionY,
                         aTgt.getPositionX, aTgt.getPositionY,
                         aMis.getPositionZ, aTgt.getPositionZ) * C_NauticalMile_To_Metre;

  bearing := Calcbearing(aMis.getPositionX, aMis.getPositionY, aTgt.getPositionX, aTgt.getPositionY);

  if not InsideAngleOfView(TT3Missile(aMis).Course,60,bearing) then exit;

  minRCS := 60 / (7 * C_NauticalMile_To_Metre); // anggap maximum RCS yg didefinisikan 60dbm2, dan jarak deteksi max 2 nm

  // deteksi chaff
  if aTgt is TT3Chaff then
  begin
    if range = 0 then
      RcstoRange := 100000000
    else
      RcstoRange := TT3Chaff(aTgt).RCS / ( range );

    if RcstoRange <= minRCS then
      exit;

    if rcs <= RcstoRange then
      result := aTgt;
  end
  // deteksi vehicle
  else
  begin
    if range = 0 then
      RcstoRange := 100000000
    else
      RcstoRange := calcCrossSection(TT3Missile(aMis),TT3Vehicle(aTgt)) / ( range );

    if RcstoRange <= minRCS then
      exit;

    if rcs <= RcstoRange then
      result := aTgt;
  end;
end;

end.
