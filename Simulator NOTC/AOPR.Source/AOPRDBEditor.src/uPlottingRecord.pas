unit uPlottingRecord;

interface
uses
  uDataTypes, Windows;
type
{record untuk plotting}
  TFileHeaderPlot = record
    id     : Integer;
    Size   : Integer;
    Exclude: string[15];
  end;
    TRecIntelegen = record
    header    : TFileHeaderPlot;
    Force     : Integer;
    PostCenter : t2DPoint;
    LengthIntel : Integer;
    Info      : array[0..100] of string[60];
  end;
  TRecLogistic = record
    header    : TFileHeaderPlot;
    Force     : Integer;
    PostCenter : t2DPoint;
    LengthLog : Integer;
    Item      : array[0..100] of string[60];
    Status    : array[0..100] of string[60];
  end;
  TRecBase = record
    header      : TFileHeaderPlot;
    Force       : Integer;
    PostCenter : t2DPoint;
    LengthBase  : Integer;
    IdFontTaktis : Integer;
    Plat        : array[0..100] of string[60];
    Qty         : array[0..100] of string[60];
    FontTaktisIndex : array[0..100] of string[60];
  end;
  TRecRadar = record
    header    : TFileHeaderPlot;
    Force     : Integer;
    PostCenter : t2DPoint;
    Radius    : double;
  end;
  TRecPanah = record
    header          : TFileHeaderPlot;
    Force           : Integer;
    PostCenter : t2DPoint;
    PostEnd : t2DPoint;
  end;
  TempInfo = record
    infointelegen : string;
  end;
  TempLog = record
    item    : string;
    status  : string;
  end;
  TempBase = record
    plat  : string;
    qty   : string;
  end;
implementation

end.
