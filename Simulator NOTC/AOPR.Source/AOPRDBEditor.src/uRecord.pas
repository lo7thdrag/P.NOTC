unit uRecord;

interface
  uses
  uDataTypes, Windows, Graphics;

type
  { File Header
    ID = 1 ======> Text
    ID = 2 ======> Line
    ID = 3 ======> Rectangle
    ID = 4 ======> Circle
    ID = 5 ======> Ellipse
    ID = 6 ======> Arc
    ID = 7 ======> Sector
    ID = 8 ======> Grid / Table
    ID = 9 ======> Polygon
  }
  TFileHeader = record
    ID         : Integer;     // ID const comparing
    Size       : Integer;     // size of record
    Exclude    : string[15];
  end;

  TTextRecord = record
    header      : TFileHeader;
    ParentPos   : t2DPoint;
    postStart   : t2DPoint;
    size        : Integer;
    words       : String[30];
    color       : Integer;
    isSelected  : Boolean;
  end;

  TLineRecord = record
    header      : TFileHeader;
    ParentPos   : t2DPoint;
    postStart   : t2DPoint;
    postEnd     : t2DPoint;
    color       : Integer;
    isSelected  : Boolean;
    weight      : Integer;
    lineType    : TPenStyle;
  end;

  TRectRecord = record
    header      : TFileHeader;
    ParentPos   : t2DPoint;
    postStart    : t2DPoint;
    postEnd      : t2DPoint;
    color       : Integer;
    isSelected  : Boolean;
    weight      : Integer;
    lineType    : TPenStyle;
    brushStyle  : TBrushStyle;
    fillColor   : Integer;
  end;

  TCircleRecord = record
    header      : TFileHeader;
    ParentPos   : t2DPoint;
    postCenter  : t2DPoint;
    radius      : Double;
    color       : Integer;
    isSelected  : Boolean;
    weight      : Integer;
    lineType    : TPenStyle;
    brushStyle  : TBrushStyle;
    fillColor   : Integer;
  end;

  TEllipseRecord = record
    header      : TFileHeader;
    ParentPos   : t2DPoint;
    postCenter  : t2DPoint;
    Hradius     : Double;
    Vradius     : Double;
    color       : Integer;
    isSelected  : Boolean;
    weight      : Integer;
    lineType    : TPenStyle;
    brushStyle  : TBrushStyle;
    fillColor   : Integer;
  end;

  TArcRecord = record
    header      : TFileHeader;
    ParentPos   : t2DPoint;
    postCenter  : t2DPoint;
    radius      : Double;
    startAngle  : Integer;
    endAngle    : Integer;
    color       : Integer;
    isSelected  : Boolean;
    weight      : Integer;
    lineType    : TPenStyle;
    brushStyle  : TBrushStyle;
  end;

  TSectorRecord = record
    header      : TFileHeader;
    ParentPos   : t2DPoint;
    postCenter  : t2DPoint;
    Oradius     : Double;
    Iradius     : Double;
    startAngle  : Integer;
    endAngle    : Integer;
    color       : Integer;
    isSelected  : Boolean;
    weight      : Integer;
    lineType    : TPenStyle;
    brushStyle  : TBrushStyle;
    fillColor   : Integer;
  end;

  TGridRecord = record
    header      : TFileHeader;
    ParentPos   : t2DPoint;
    postCenter  : t2DPoint;
    Height      : Double;
    Width       : Double;
    HCount      : Integer;
    WCount      : Integer;
    Rotation    : Integer;
    color       : Integer;
    isSelected  : Boolean;
    weight      : Integer;
    lineType    : TPenStyle;
    brushStyle  : TBrushStyle;
  end;

  TPolygonRecord = record
    header      : TFileHeader;
    ParentPos   : t2DPoint;
    LengthArray : Integer;
    postStart   : Array[0..100] of t2DPoint;
    color       : Integer;
    isSelected  : Boolean;
    weight      : Integer;
    lineType    : TPenStyle;
    brushStyle  : TBrushStyle;
    fillColor   : Integer;
  end;

  tempPos = record
    position : double;
  end;

  tempGrid = record
    Grid : string[30];
  end;

implementation

end.
