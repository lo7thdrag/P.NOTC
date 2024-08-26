unit uOverlayOther;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, uMapXHandler, uCoordConvertor, uBaseCoordSystem,
  uDBAsset_GameEnvironment, {TeCanvas,} ColorGrd, {RzButton,} uOverlayPlus;

type
  TLineRecord = record
    posStartLatitude        : Double;
    posStartLongitude       : Double;
    posEndlatitude          : Double;
    posEndLongitude         : Double;
    gridStartLatitude       : string[30];
    gridStartLongitude      : string[30];
    gridEndlatitude         : string[30];
    gridEndLongitude        : string[30];
    color                   : integer;
    isSelected              : boolean;
  end;

  TTableRecord = record
    tablePosStartLatitude        : Double;
    tablePosStartLongitude       : Double;
    tablePosEndLatitude          : Double;
    tablePosEndLongitude         : Double;
    tableCenterGridLatitude      : string[30];      // dlm map
    tableCenterGridLongitude     : string[30];      // dlm map
    tableCenterPosLatitude       : Double;
    tableCenterPosLongitude      : Double;
    tableCellWidth               : integer;         // dlm nm
    tableCellheight              : integer;         // dlm nm
    tableNumbColumns             : integer;
    tableNumbRows                : integer;
    color                        : integer;
    isSelected                   : boolean;
  end;

  TRectRecord = record
    rectanglePosStartLatitude    : Double;
    rectanglePosStartLongitude   : Double;
    rectanglePosEndLatitude      : Double;
    rectanglePosEndLongitude     : Double;
    rectangleGridStartLatitude   : string[30];
    rectangleGridStartLongitude  : string[30];
    rectangleGridEndLatitude     : string[30];
    rectangleGridEndLongitude    : string[30];
    color                        : integer;
    isSelected                   : boolean;
  end;

  TEllipseRecord = record
    ellipsePosStartLatitude         : Double;
    ellipsePosStartLongitude        : Double;
    ellipsePosEndLatitude           : Double;
    ellipsePosEndLongitude          : Double;
    ellipsePosCenterLatitude        : Double;
    ellipsePosCenterLongitude       : Double;
    ellipseMajor                    : Integer;
    ellipseMinor                    : Integer;
    ellipseGridPointCenterLatitude  : string[30];
    ellipseGridPointCenterLongitude : string[30];
    color                           : integer;
    isSelected                      : boolean;
    flagX                           : string[10];
    flagY                           : string[10];
  end;

  TTextRecord = record
    textPosStartLatitude            : Double;
    textPosStartLongitude           : Double;
    textGridStartLatitude           : string[30];
    textGridStartLongitude          : string[30];
    TextString                      : String[30];
    textSize                        : integer;
    color                           : integer;
    isSelected                      : boolean;
  end;

  { /////////////////////////////////////////////// }
  TDrawOverlay = class
  protected
    FList : TList;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;
  end;

  TLineOverlay = class(TDrawOverlay)
  public
    dataLineRecord: TLineRecord;
    LineRecord: TLineRecord;

    LineFile: File of TLineRecord;
    is_LineFileCreated: boolean;

    constructor Create;
    destructor Destroy; override;

    procedure createLineFile(nameFile: string);
    procedure loadLineOverlay(fName: string);
    procedure saveLineRecord(mapLineStartX: Double; mapLineStartY: Double;
      mapLineEndX: Double; mapLineEndY: Double; lineGridStartLong: string;
      LineGridStartLat: string; LineGridEndLong: String;
      LineGridEndLat: String; LineColor: Integer; isSelected: boolean);
    procedure lineRecordToFile(fName: String);
    procedure drawLineOverlay(FCanvas: TCanvas; Map1: TMap);
    procedure HitLine(pos : TPoint; Map1: TMap);
    procedure editLineRecord(mapLineStartX: Double; mapLineStartY: Double;
      mapLineEndX: Double; mapLineEndY: Double; lineGridStartLong: string;
      LineGridStartLat: string; LineGridEndLong: String;
      LineGridEndLat: String; Map1: TMap);
    procedure editLineRecordToFile(fName: String);
  end;

  TTableOverlay = class(TDrawOverlay)
    dataTableRecord: TTableRecord;
    TableRecord: TTableRecord;

    TableFile: File of TTableRecord;
    is_TableFileCreated: boolean;

    constructor Create;
    destructor Destroy; override;

    procedure createTableFile(nameFile: string);
    procedure loadTableOverlay(fName: String);
    procedure saveTableRecord(mapTableStartX: Double; mapTableStartY: Double;
      mapTableEndX: Double; mapTableEndY: Double;
      tabCentGridLat: string; tabCentGridLong: string; tabCentPosLat: Double;
      tabCentPosLong: Double; tabCellWidth: integer; tabCellheight: integer;
      numberColums: integer; numberRows: integer; TableColor: integer; isSelected: boolean);
    procedure TableRecordToFile(fName: String);
    procedure drawTableOverlay(FCanvas: TCanvas; Map1: TMap);
    procedure HitTable(pos : TPoint; Map1: TMap);
    procedure editTableRecord(tabCentGridLat: string; tabCentGridLong: string; tabCentPosLat: Double;
      tabCentPosLong: Double; tabCellWidth: integer; tabCellheight: integer;
      numberColums: integer; numberRows: integer; Map1: TMap);
    procedure editTableRecordToFile(fName: String);
  end;

  TRectOverlay = class(TDrawOverlay)
    dataRectRecord: TRectRecord;
    RectRecord: TRectRecord;

    RectFile: File of TRectRecord;
    is_RectFileCreated: boolean;

    constructor Create;
    destructor Destroy; override;

    procedure createRectFile(nameFile: string);
    procedure loadRectOverlay(fName: String);
    procedure saveRectRecord(mapRectStartX: Double; mapRectStartY: Double;
      mapRectEndX: Double; mapRectEndY: Double; rectGridStartLong: string;
      rectGridStartLat: string; RectGridEndLong: string;
      RectGridEndLat: string; RectColor: integer; isSelected: boolean);
    procedure rectRecordToFile(fName: String);
    procedure drawRectOverlay(FCanvas: TCanvas; Map1: TMap);
    procedure HitRect(pos : TPoint; Map1: TMap);

    procedure editRectRecord(mapRectStartX: Double; mapRectStartY: Double;
      mapRectEndX: Double; mapRectEndY: Double; rectGridStartLong: string;
      rectGridStartLat: string; RectGridEndLong: string;
      RectGridEndLat: string; Map1: TMap);

    procedure editRectRecord2(mapRectStartX: Double; mapRectStartY: Double;
      mapRectEndX: Double; mapRectEndY: Double;  aRec : TRectRecord ; Map1: TMap);


    procedure editRectRecordToFile(fName: String);
  end;

  TEllipseOverlay = class(TDrawOverlay)
    dataEllipseRecord: TEllipseRecord;
    EllipseRecord: TEllipseRecord;
//    FList: TList;

    EllipseFile: File of TEllipseRecord;
    is_EllipseFileCreated: boolean;

    constructor Create;
    destructor Destroy; override;

    procedure createEllipseFile(nameFile: string);
    procedure loadEllipseOverlay(fName: String);
    procedure saveEllipseRecord(mapEllipseStartX : double; mapEllipseStartY: double;
      mapEllipseEndX: double; mapEllipseEndY: double; mapEllipseCenterX: double; mapEllipseCenterY: double; Major: integer;
      Minor: integer; EllipseGridCenterLong: string; EllipseGridCenterLat: string; EllipseColor: integer; isSelected : boolean; asX: string; asY: string);
    procedure ellipseRecordToFile(fName: String);
    procedure drawEllipseOverlay(FCanvas: TCanvas; Map1: TMap);
    procedure HitEllipse(pos : TPoint; Map1: TMap);
    procedure editEllipseRecord(posLong: double; posLat: double; gridLong: string; gridLat: string;
      major: integer; minor: integer; Map1: TMap);
    procedure editEllipseRecordToFile(fName: String);
  end;

  TTextOverlay = class(TDrawOverlay)
    dataTextRecord: TTextRecord;
    TextRecord: TTextRecord;
//    FList: TList;
    TextFile: File of TTextRecord;
    is_TextFileCreated: boolean;

    constructor Create;
    destructor Destroy; override;

    procedure createTextFile(nameFile: string);
    procedure loadTextOverlay(fName: String);
    procedure saveTextRecord(mapTextStartX: Double; mapTextStartY: Double;
      TextGridStartLong: string; TextGridStartLat: string; defString: string;
      defSize: integer; TextColor: integer; isSelected: boolean);
    procedure textRecordToFile(fName: String);
    procedure drawTextOverlay(FCanvas: TCanvas; Map1: TMap);
    procedure HitText(pos : TPoint; Map1: TMap);
    procedure editTextRecord(mapTextStartX: Double; mapTextStartY: Double;
      textGridStartLong: string; textGridStartLat: string; TextStringO: string;
      TextSizeO: integer; Map1: TMap);
    procedure editTextRecordToFile(fName: String);
  end;

  {TOverlayOther = class

  private
    lineOver : TLineOverlay;
    rectOver : TRectOverlay;
    ellipseOver : TEllipseOverlay;
    textOver : TTextOverlay;
  public
    procedure clearList;
    procedure createList;
  end;}

implementation

uses
  ufrmOverlayEditor;

constructor TDrawOverlay.Create;
begin
  FList := TList.Create;
end;

destructor TDrawOverlay.Destroy;
begin
  FList.Free;

end;

procedure TDrawOverlay.Clear;
begin
  FList.Clear;
end;

constructor TLineOverlay.Create;
begin
  inherited;
end;

destructor TLineOverlay.Destroy;
begin
  inherited;
end;

{procedure TOverlayOther.createList;
var
  line : TLineOverlay;
  rect : TRectOverlay;
  ellipse : TEllipseOverlay;
  text : TTextOverlay;
begin
  line.FList := TList.Create;
  rect.FList := TList.Create;
  ellipse.FList := TList.Create;
  text.FList := TList.Create;

  {self.FList := TList.Create;
  FList := TList.Create;
  FList := TList.Create;
  FList := TList.Create;
end;   }

{procedure TOverlayOther.clearList;
var
  line : TLineOverlay;
  rect : TRectOverlay;
  ellipse : TEllipseOverlay;
  text : TTextOverlay;
begin
  line.FList.clear;
  rect.FList.clear;
  ellipse.FList.clear;
  text.FList.clear;
end;   }

procedure TLineOverlay.saveLineRecord(mapLineStartX: Double; mapLineStartY: Double;
      mapLineEndX: Double; mapLineEndY: Double; lineGridStartLong: string;
      LineGridStartLat: string; LineGridEndLong: String;
      LineGridEndLat: String; LineColor: Integer; isSelected: boolean);
begin
  Self.LineRecord.posStartLongitude   := mapLineStartX;
  Self.LineRecord.posStartLatitude    := mapLineStartY;
  Self.LineRecord.posEndLongitude     := mapLineEndX;
  Self.LineRecord.posEndlatitude      := mapLineEndY;
  Self.LineRecord.gridStartLongitude  := lineGridStartLong;
  Self.LineRecord.gridStartLatitude   := LineGridStartLat;
  Self.LineRecord.gridEndLongitude    := LineGridEndLong;
  Self.LineRecord.gridEndlatitude     := LineGridEndLat;
  Self.LineRecord.color               := LineColor;
  self.LineRecord.isSelected          := isSelected;
end;

procedure TLineOverlay.createLineFile(nameFile : string);
begin
  AssignFile(LineFile, nameFile);
  ReWrite(LineFile);
  if ioresult <> 0 then begin
         ShowMessage('Error When Creating A New Overlay Line File');
         is_LineFileCreated := false;
  end;
  is_LineFileCreated := true;
end;

procedure TLineOverlay.lineRecordToFile(fName : string);
var
    tempLine : TLineOverlay;
begin
    tempLine                := TLineOverlay.Create;
    tempLine.LineRecord     := self.LineRecord;
//  tempLine.dataLineRecord := self.dataLineRecord;

    {if is_LineFileCreated = false then
    begin
       createLineFile(fName);
    end;}

    if FileExists(fName) then
       is_LineFileCreated := true
    else
       createLineFile(fName);

    if is_LineFileCreated then
    begin
      FileMode := fmOpenWrite;
      Reset(LineFile);
       if FileSize(LineFile) = 0 then
       begin
          seek(LineFile, 0);
          Write(LineFile, LineRecord);
       end
       else
       begin
          seek(LineFile, FileSize(LineFile));
          Write(LineFile, LineRecord);
       end;
    end;
    {else
        createLineFile(fName);}

  dataLineRecord := LineRecord;
  FList.Add(tempLine);
  //CloseFile(LineFile);
end;

constructor TTableOverlay.Create;
begin
  inherited;
end;

destructor TTableOverlay.Destroy;
begin
  inherited;
end;

procedure TTableOverlay.saveTableRecord(mapTableStartX: Double; mapTableStartY: Double;
      mapTableEndX: Double; mapTableEndY: Double; tabCentGridLat: string;
      tabCentGridLong: string; tabCentPosLat: Double;
      tabCentPosLong: Double; tabCellWidth: integer; tabCellheight: integer;
      numberColums: integer; numberRows: integer; TableColor: integer; isSelected: boolean);
begin
  Self.TableRecord.tablePosStartLongitude := mapTableStartX;
  Self.TableRecord.tablePosStartLatitude := mapTableStartY;
  Self.TableRecord.tablePosEndLongitude := mapTableEndX;
  Self.TableRecord.tablePosEndLatitude := mapTableEndY;
  Self.TableRecord.tableCenterGridLatitude := tabCentGridLat;
  Self.TableRecord.tableCenterGridLongitude := tabCentGridLong;
  Self.TableRecord.tableCenterPosLatitude := tabCentPosLat;
  Self.TableRecord.tableCenterPosLongitude := tabCentPosLong;
  Self.TableRecord.tableCellWidth := tabCellWidth;             //nm
  Self.TableRecord.tableCellheight := tabCellheight;           //nm
  Self.TableRecord.tableNumbColumns := numberColums;
  Self.TableRecord.tableNumbRows := numberRows;
  Self.TableRecord.Color := TableColor;
  Self.TableRecord.isSelected := isSelected;
end;

procedure TTableOverlay.createTableFile(nameFile : string);
begin
  AssignFile(tableFile, nameFile);
  ReWrite(tableFile);
  if ioresult <> 0 then begin
         ShowMessage('Error When Creating A New Overlay Table.bin File');
         is_TableFileCreated := false;
  end;
  is_TableFileCreated := true;
end;

procedure TTableOverlay.tableRecordToFile(fName : string);
var
    tempTable : TTableOverlay;
begin
    tempTable                 := TTableOverlay.Create;
    tempTable.TableRecord     := self.TableRecord;
    tempTable.dataTableRecord := self.dataTableRecord;

    if is_TableFileCreated = false then
    begin
       createTableFile(fName);
    end;

    if is_TableFileCreated then
    begin
       if FileSize(TableFile) = 0 then
       begin
          seek(TableFile, 0);
          Write(TableFile, TableRecord);
       end
       else
       begin
          seek(TableFile, FileSize(TableFile));
          Write(TableFile, TableRecord);
       end;
    end;
    {else
        createTableFile(fName);}

    dataTableRecord := TableRecord;
    FList.Add(tempTable);
end;

constructor TRectOverlay.Create;
begin
  inherited;
end;

destructor TRectOverlay.Destroy;
begin
  inherited;
end;

procedure TRectOverlay.saveRectRecord(mapRectStartX: Double; mapRectStartY: Double;
      mapRectEndX: Double; mapRectEndY: Double; rectGridStartLong: string;
      rectGridStartLat: string; RectGridEndLong: string;
      RectGridEndLat: string; RectColor: integer; isSelected: boolean);
begin
  RectRecord.rectanglePosStartLongitude   := mapRectStartX;
  RectRecord.rectanglePosStartLatitude    := mapRectStartY;
  RectRecord.rectanglePosEndLongitude     := mapRectEndX;
  RectRecord.rectanglePosEndLatitude      := mapRectEndY;
  RectRecord.rectangleGridStartLongitude  := rectGridStartLong;
  RectRecord.rectangleGridStartLatitude   := rectGridStartLat;
  RectRecord.rectangleGridEndLongitude    := RectGridEndLong;
  RectRecord.rectangleGridEndLatitude     := RectGridEndLat;
  RectRecord.color                        := RectColor;
  RectRecord.isSelected                   := isSelected;
end;

procedure TRectOverlay.createRectFile(nameFile : string);
begin
  AssignFile(rectFile, nameFile);
  ReWrite(rectFile);
  if ioresult <> 0 then begin
         ShowMessage('Error When Creating A New Overlay Rectangle.bin File');
         is_RectFileCreated := false;
  end;
  is_RectFileCreated := true;
end;

procedure TRectOverlay.rectRecordToFile(fName : string);
var
    tempRect : TRectOverlay;
begin
    tempRect                := TRectOverlay.Create;
    tempRect.RectRecord     := self.RectRecord;

    if FileExists(fName) then
       is_RectFileCreated := true
    else
       createRectFile(fName);

    if is_RectFileCreated then
    begin
       FileMode := fmOpenWrite;
       Reset(RectFile);
       if FileSize(RectFile) = 0 then
       begin
          seek(RectFile, 0);
          Write(RectFile, RectRecord);
       end
       else
       begin
          seek(RectFile, FileSize(RectFile));
          Write(RectFile, RectRecord);
       end;
    end;

    dataRectRecord := RectRecord;
    FList.Add(tempRect);
end;

constructor TEllipseOverlay.Create;
begin
  inherited;
end;

destructor TEllipseOverlay.Destroy;
begin
  inherited;
end;


procedure TEllipseOverlay.saveEllipseRecord(mapEllipseStartX : double; mapEllipseStartY: double;
    mapEllipseEndX: double; mapEllipseEndY: double; mapEllipseCenterX: double; mapEllipseCenterY: double;
    Major: integer; Minor: integer; EllipseGridCenterLong: string; EllipseGridCenterLat: string;
    EllipseColor: integer; isSelected : boolean; asX: string; asY: string);
begin
  EllipseRecord.ellipsePosStartLongitude        := mapEllipseStartX;
  EllipseRecord.ellipsePosStartLatitude         := mapEllipseStartY;
  EllipseRecord.ellipsePosEndLongitude          := mapEllipseEndX;
  EllipseRecord.ellipsePosEndLatitude           := mapEllipseEndY;
  EllipseRecord.ellipsePosCenterLongitude       := mapEllipseCenterX;
  EllipseRecord.ellipsePosCenterLatitude        := mapEllipseCenterY;
  EllipseRecord.ellipseMajor                    := Major;
  EllipseRecord.ellipseMinor                    := Minor;
  EllipseRecord.ellipseGridPointCenterLongitude := EllipseGridCenterLong;
  EllipseRecord.ellipseGridPointCenterLatitude  := EllipseGridCenterLat;
  EllipseRecord.color                           := EllipseColor;
  EllipseRecord.isSelected                      := isSelected;
  EllipseRecord.flagX                           := asX;
  EllipseRecord.flagY                           := asY;
end;

procedure TEllipseOverlay.createEllipseFile(nameFile : string);
begin
  AssignFile(EllipseFile, nameFile);
  ReWrite(EllipseFile);
  if ioresult <> 0 then begin
         ShowMessage('Error When Creating A New Overlay Ellipse.bin File');
         is_EllipseFileCreated := false;
  end;
  is_EllipseFileCreated := true;
end;

procedure TEllipseOverlay.ellipseRecordToFile(fName : string);
var
  tempEllipse : TEllipseOverlay;
begin
  tempEllipse                   := TEllipseOverlay.Create;
  tempEllipse.EllipseRecord     := self.EllipseRecord;

  if FileExists(fName) then
     is_EllipseFileCreated := true
  else
     createEllipseFile(fName);

    if is_EllipseFileCreated then
    begin
       FileMode := fmOpenWrite;
       Reset(EllipseFile);
       if FileSize(EllipseFile) = 0 then
       begin
          seek(EllipseFile, 0);
          Write(EllipseFile, EllipseRecord);
       end
       else
       begin
          seek(EllipseFile, FileSize(EllipseFile)+1);
          Write(EllipseFile, EllipseRecord);
       end;
    end;

    dataEllipseRecord := EllipseRecord;
    FList.Add(tempEllipse);
end;

constructor TTextOverlay.Create;
begin
  inherited;
end;

destructor TTextOverlay.Destroy;
begin
  inherited;
end;

procedure TTextOverlay.saveTextRecord(mapTextStartX: Double; mapTextStartY: Double;
     TextGridStartLong: string; TextGridStartLat: string; defString: string;
      defSize: integer; TextColor: integer; isSelected: Boolean);
begin
  TextRecord.textPosStartLongitude  := mapTextStartX;
  TextRecord.textPosStartLatitude   := mapTextStartY;
  TextRecord.textGridStartLongitude := TextGridStartLong;
  TextRecord.textGridStartLatitude  := TextGridStartLat;
  TextRecord.TextString             := defString;
  TextRecord.textSize               := defSize;
  TextRecord.color                  := TextColor;
  TextRecord.isSelected             := isSelected;
end;

procedure TTextOverlay.createTextFile(nameFile : string);
begin
  AssignFile(TextFile, nameFile);
  ReWrite(TextFile);
  if ioresult <> 0 then begin
         ShowMessage('Error When Creating A New Overlay Text.bin File');
         is_TextFileCreated := false;
  end;
  is_TextFileCreated := true;
end;

procedure TTextOverlay.TextRecordToFile(fName: String);
var
   tempText : TTextOverlay;
begin
   tempText             := TTextOverlay.Create;
   tempText.TextRecord  := self.TextRecord;

    if FileExists(fName) then
       is_TextFileCreated := true
    else
       createTextFile(fName);

    if is_TextFileCreated then
    begin
       FileMode := fmOpenWrite;
       Reset(TextFile);
       if FileSize(TextFile) = 0 then
       begin
          seek(TextFile, 0);
          Write(TextFile, TextRecord);
       end
       else
       begin
          seek(TextFile, FileSize(TextFile));
          Write(TextFile, TextRecord);
       end;
    end;

    dataTextRecord := TextRecord;
    FList.Add(tempText);
end;

procedure TLineOverlay.drawLineOverlay(FCanvas : TCanvas; Map1: TMap);
var
 I : integer;
 x1, x2, y1, y2 : single;
begin
    for I := 0 to FList.Count - 1 do
      begin
        if TDrawOverlay(FList[I]) is TLineOverlay then
        begin
          with TLineOverlay(FList[I]).dataLineRecord do
          begin
            FCanvas.Pen.color   := color;
            FCanvas.Brush.Style := bsClear;
            if isSelected then
            begin
                FCanvas.Pen.Color := clYellow;
            end
            else
                FCanvas.Pen.color   := color;
            Map1.ConvertCoord(x1, y1, posStartLongitude, posStartLatitude, miMapToScreen);
            Map1.ConvertCoord(x2, y2, posEndLongitude, posEndlatitude, miMapToScreen);
            FCanvas.MoveTo(Round(x1), Round(y1));
            FCanvas.LineTo(Round(x2), Round(y2));
          end;
        end;
      end;
end;

procedure TTableOverlay.drawTableOverlay(FCanvas : TCanvas; Map1 : TMap);
var
 I : integer;
 x1, x2, y1, y2, centerX, centerY : single;
begin
  for I := 0 to FList.Count - 1 do
  begin
    if TDrawOverlay(FList[I]) is TTableOverlay then
    begin
      with TTableOverlay(FList[I]).dataTableRecord do
      begin
        FCanvas.Pen.color   := color;
        FCanvas.Brush.Style := bsClear;
        if isSelected then
        begin
            FCanvas.Pen.Color := clYellow;
        end
        else
            FCanvas.Pen.color   := color;

        //draw rect
        Map1.ConvertCoord(x1, y1, tablePosStartLongitude, tablePosStartLatitude, miMapToScreen);
        Map1.ConvertCoord(x2, y2, tablePosEndLongitude, tablePosEndLatitude, miMapToScreen);
        FCanvas.RECTANGLE(round(x1), round(y1), round(x2), round(y2));

        //get center
        Map1.ConvertCoord(centerX, centerY, tableCenterPosLongitude, tableCenterPosLatitude, miMapToScreen);
        FCanvas.MoveTo(round(x1), round(centerY));
        FCanvas.LineTo(round(x2), round(centerY));
        FCanvas.MoveTo(round(centerX), round(y1));
        FCanvas.LineTo(round(centerX), round(y2));
        FCanvas.Brush.Style := bsClear;
      end;                  //end with
    end;                    //end if terluar
  end;                      // end for
end;

procedure TRectOverlay.drawRectOverlay(FCanvas : TCanvas; Map1 : TMap);
var
 I : integer;
 x1, x2, y1, y2 : single;
begin
  for I := 0 to FList.Count - 1 do
  begin
    if TDrawOverlay(FList[I]) is TRectOverlay then
    begin
      with TRectOverlay(FList[I]).dataRectRecord do
      begin
        FCanvas.Pen.color     := color;
        FCanvas.Brush.Style   := bsClear;
        if isSelected then
        begin
            FCanvas.Pen.Color := clYellow;
        end
        else
            FCanvas.Pen.color := color;
        Map1.ConvertCoord(x1, y1, rectanglePosStartLongitude, rectanglePosStartLatitude, miMapToScreen);
        Map1.ConvertCoord(x2, y2, rectanglePosEndLongitude, rectanglePosEndLatitude, miMapToScreen);
        FCanvas.RECTANGLE(round(x1), round(y1), round(x2), round(y2));
      end;
    end;
  end;
end;

procedure TEllipseOverlay.drawEllipseOverlay(FCanvas : TCanvas; Map1: TMap);
var
 I : integer;
 x1, x2, y1, y2 : single;
begin
  for I := 0 to FList.Count - 1 do
  begin
    if TDrawOverlay(FList[I]) is TEllipseOverlay then
    begin
      with TEllipseOverlay(FList[I]).dataEllipseRecord do
      begin
        FCanvas.Pen.color     := color;
        FCanvas.Brush.Style   := bsClear;
        if isSelected then
        begin
            FCanvas.Pen.Color := clYellow;
        end
        else
            FCanvas.Pen.color   := color;
        Map1.ConvertCoord(x1, y1, ellipsePosStartLongitude, ellipsePosStartLatitude, miMapToScreen);
        Map1.ConvertCoord(x2, y2, ellipsePosEndLongitude, ellipsePosEndLatitude, miMapToScreen);
        FCanvas.Ellipse(round(x1), round(y1), round(x2), round(y2));
      end;
    end;
  end;
end;

procedure TTextOverlay.drawTextOverlay(FCanvas : TCanvas; Map1: TMap);
var
 I : integer;
 x1, y1 : single;
 txstring : string;
begin
  for I := 0 to FList.Count - 1 do
  begin
    if TDrawOverlay(FList[I]) is TTextOverlay then
    begin
      with TTextOverlay(FList[I]).dataTextRecord do
      begin
        FCanvas.Font.color  := color;
        FCanvas.Font.size   := TextSize;
        FCanvas.Brush.Style := bsClear;
        if isSelected then
        begin
            FCanvas.Pen.Color := clYellow;
        end
        else
            FCanvas.Pen.color := color;
        Map1.ConvertCoord(x1, y1, textPosStartLongitude, textPosStartLatitude, miMapToScreen);
        txstring := TextString;
        FCanvas.TextOut(round(x1), round(y1), txstring);
      end;
    end;
  end;
end;

procedure TLineOverlay.loadLineOverlay(fName : string);
var
  line : TLineOverlay;
  i : Word;
begin
    if FileExists(fName) then
    begin
          i := 0;
          AssignFile(LineFile, fName);
          FileMode := fmOpenRead;
          reset(LineFile);
          seek(LineFile, i);
          while not Eof(LineFile) do
          begin
                Read(LineFile, LineRecord);
                line := TLineOverlay.Create;
                with line.dataLineRecord do
                begin
                     posStartLongitude  := LineRecord.posStartLongitude;
                     posStartLatitude   := LineRecord.posStartLatitude;
                     posEndLongitude    := LineRecord.posEndLongitude;
                     posEndlatitude     := LineRecord.posEndlatitude;
                     gridStartLongitude := LineRecord.gridStartLongitude;
                     gridStartLatitude  := LineRecord.gridStartLatitude;
                     gridEndLongitude   := LineRecord.gridEndLongitude;
                     gridEndlatitude    := LineRecord.gridEndlatitude;
                     color              := LineRecord.color;
                     isSelected         := false;            //biar warnanya tetap semula, bukan kuning. karna sudah tidak di select
                     //isSelected         := LineRecord.isSelected;
                end;
                FList.Add(line);
          end;
          CloseFile(LineFile);
    end;
end;

procedure TTableOverlay.loadTableOverlay(fName : string);
var
  table : TTableOverlay;
  i : word;
begin
    if FileExists(fName) then
    begin
          i := 0;
          AssignFile(TableFile, fName);
          FileMode := fmOpenRead;
          reset(TableFile);
          seek(TableFile, i);
          while not Eof(TableFile) do
          begin
                Read(TableFile, dataTableRecord);
                table := TTableOverlay.Create;
                with table.dataTableRecord do
                begin
                     tablePosStartLatitude    := dataTableRecord.tablePosStartLatitude;
                     tablePosStartLongitude   := dataTableRecord.tablePosStartLongitude;
                     tablePosEndLatitude      := dataTableRecord.tablePosEndLatitude;
                     tablePosEndLongitude     := dataTableRecord.tablePosEndLongitude;
                     tableCenterGridLatitude  := dataTableRecord.tableCenterGridLatitude;
                     tableCenterGridLongitude := dataTableRecord.tableCenterGridLongitude;
                     tableCenterPosLatitude   := dataTableRecord.tableCenterPosLatitude;
                     tableCenterPosLongitude  := dataTableRecord.tableCenterPosLongitude;
                     tableCellWidth           := dataTableRecord.tableCellWidth;
                     tableCellheight          := dataTableRecord.tableCellheight;
                     tableNumbColumns         := dataTableRecord.tableNumbColumns;
                     tableNumbRows            := dataTableRecord.tableNumbRows;
                     Color                    := dataTableRecord.Color;
                     isSelected               := dataTableRecord.isSelected;
                     //ShowMessage('start X = ' + floattostr(tablePosStartLongitude) +', startY Y = ' + floattostr(tablePosStartLatitude));
                end;
                FList.Add(table);
          end;
          CloseFile(TableFile);
    end;
end;

procedure TRectOverlay.loadRectOverlay(fName : string);
var
  rect : TRectOverlay;
  i    : word;
begin
    if FileExists(fName) then
    begin
          i := 0;
          AssignFile(RectFile, fName);
          FileMode := fmOpenRead;
          reset(RectFile);
          seek(RectFile, i);
          while not Eof(RectFile) do
          begin
                Read(RectFile, RectRecord);
                rect := TRectOverlay.Create;
                with rect.dataRectRecord do
                begin
                     rectanglePosStartLongitude  := RectRecord.rectanglePosStartLongitude;
                     rectanglePosStartLatitude   := RectRecord.rectanglePosStartLatitude;
                     rectanglePosEndLongitude    := RectRecord.rectanglePosEndLongitude;
                     rectanglePosEndLatitude     := RectRecord.rectanglePosEndLatitude;
                     rectangleGridStartLongitude := RectRecord.rectangleGridStartLongitude;
                     rectangleGridStartLatitude  := RectRecord.rectangleGridStartLatitude;
                     rectangleGridEndLongitude   := RectRecord.rectangleGridEndLongitude;
                     rectangleGridEndLatitude    := RectRecord.rectangleGridEndLatitude;
                     color                       := RectRecord.color;
                     isSelected                  := false;
                end;
                FList.Add(rect);
          end;
          CloseFile(RectFile);
    end;
end;

procedure TEllipseOverlay.loadEllipseOverlay(fName : string);
var
  ellipse : TEllipseOverlay;
  i : word;
begin
    if FileExists(fName) then
    begin
          i := 0;
          AssignFile(EllipseFile, fName);
          FileMode := fmOpenRead;
          reset(EllipseFile);
          seek(EllipseFile, i);
          while not Eof(EllipseFile) do
          begin
                Read(EllipseFile, EllipseRecord);
                ellipse := TEllipseOverlay.Create;
                with ellipse.dataEllipseRecord do
                begin
                     ellipsePosStartLatitude         := EllipseRecord.ellipsePosStartLatitude;
                     ellipsePosStartLongitude        := EllipseRecord.ellipsePosStartLongitude;
                     ellipsePosEndLatitude           := EllipseRecord.ellipsePosEndLatitude;
                     ellipsePosEndLongitude          := EllipseRecord.ellipsePosEndLongitude;
                     ellipsePosCenterLatitude        := EllipseRecord.ellipsePosCenterLatitude;
                     ellipsePosCenterLongitude       := EllipseRecord.ellipsePosCenterLongitude;
                     ellipseMajor                    := EllipseRecord.ellipseMajor;
                     ellipseMinor                    := EllipseRecord.ellipseMinor;
                     ellipseGridPointCenterLatitude  := EllipseRecord.ellipseGridPointCenterLatitude;
                     ellipseGridPointCenterLongitude := EllipseRecord.ellipseGridPointCenterLongitude;
                     color                           := EllipseRecord.color;
                     isSelected                      := EllipseRecord.isSelected;
                     flagX                           := EllipseRecord.flagX;
                     flagY                           := EllipseRecord.flagY;
                end;
                FList.Add(ellipse);
          end;
          CloseFile(EllipseFile);
    end;
end;

procedure TTextOverlay.loadTextOverlay(fName : string);
var
  Text : TTextOverlay;
  i : word;
begin
    if FileExists(fName) then
    begin
          i := 0;
          AssignFile(TextFile, fName);
          FileMode := fmOpenRead;
          reset(TextFile);
          seek(TextFile, i);
          while not Eof(TextFile) do
          begin
                Read(TextFile, TextRecord);
                text := TTextOverlay.Create;
                with text.dataTextRecord do
                begin
                     textPosStartLongitude  := TextRecord.textPosStartLongitude;
                     textPosStartLatitude   := TextRecord.textPosStartLatitude;
                     textGridStartLongitude := TextRecord.textGridStartLongitude;
                     textGridStartLatitude  := TextRecord.textGridStartLatitude;
                     TextString             := TextRecord.TextString;
                     textSize               := TextRecord.textSize;
                     color                  := TextRecord.color;
                     isSelected             := false;
                end;
                FList.Add(text);
          end;
          CloseFile(TextFile);
    end;
end;

procedure TLineOverlay.HitLine(pos : TPoint; Map1: TMap);
var
  rect, rect2          : TRect;
  x1, x2, y1, y2       : single;
  I                    : Integer;
  overlayPl            : overlayPlus;
begin
   overlayPl := overlayPlus.Create;

   for I := 0 to FList.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TLineOverlay then
    begin
      with TLineOverlay(FList[I]).dataLineRecord do
           isSelected := false;
    end;
   end;

   for I := 0 to FList.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TLineOverlay then
    begin
      with TLineOverlay(FList[I]).dataLineRecord do
      begin
        //isSelected := false;
        Map1.ConvertCoord(x1, y1, PosStartLongitude, PosStartLatitude, miMapToScreen);
        Map1.ConvertCoord(x2, y2, PosEndLongitude, PosEndLatitude, miMapToScreen);

        rect  := overlayPl.assignRect(x1, y1);
        rect2 := overlayPl.assignRect(x2, y2);
        if ((pos.X >= rect.Left) AND (pos.X <= rect.Right)) OR ((pos.X >= rect2.Left) AND (pos.X <= rect2.Right)) then
        begin
          if ((pos.Y >= rect.Top) AND (pos.Y <= rect.Bottom)) OR ((pos.Y >= rect2.Top) AND (pos.Y <= rect2.Bottom)) then
          begin
            isSelected := true;

//            OverlayEditorForm.edtStartPosLong.Text  := formatDM_longitude(posStartLongitude);
//            OverlayEditorForm.edtStartPosLat.Text   := formatDM_latitude(posStartLatitude);
//            OverlayEditorForm.edtEndPosLong.Text    := formatDM_longitude(posEndLongitude);
//            OverlayEditorForm.edtEndPosLat.Text     := formatDM_latitude(posEndlatitude);
//            OverlayEditorForm.edtStartGridLong.Text := gridStartLongitude;
//            OverlayEditorForm.edtStartGridLat.Text  := gridStartLatitude;
//            OverlayEditorForm.edtEndGridLong.Text   := gridEndLongitude;
//            OverlayEditorForm.edtEndGridLat.Text    := gridEndlatitude;

//            OverlayEditorForm.gbLine.BringToFront;
            break;
          end;
        end;
      end;                  //end with
    end;                    //end if terluar
   end;                     // end for
end;

procedure TLineOverlay.editLineRecord(mapLineStartX: Double; mapLineStartY: Double;
      mapLineEndX: Double; mapLineEndY: Double; lineGridStartLong: string;
      LineGridStartLat: string; LineGridEndLong: String;
      LineGridEndLat: String; Map1: TMap);
var
   I : integer;
begin
   for I := 0 to Flist.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TLineOverlay then
    begin
      with TLineOverlay(FList[I]).dataLineRecord do
      begin
           if isSelected then
           begin
              PosStartLongitude := mapLineStartX;
              PosStartLatitude  := mapLineStartY;
              PosEndLongitude   := mapLineEndX;
              PosEndLatitude    := mapLineEndY;
              GridStartLongitude:= lineGridStartLong;
              GridStartLatitude := LineGridStartLat;
              GridEndLongitude  := LineGridEndLong;
              GridEndLatitude   := LineGridEndLat;
              //color                     := color;
              //isSelected                :=
              break;
           end;
      end;
    end;
   end;
end;

procedure TLineOverlay.editLineRecordToFile(fName: String);
var
    tempLine  : TLineOverlay;
    I         : integer;
begin
    tempLine                 := TLineOverlay.Create;
    tempLine.LineRecord      := self.LineRecord;
    tempLine.dataLineRecord  := self.dataLineRecord;

    DeleteFile(fName);
    createLineFile(fName);

    for I := 0 to FList.Count - 1 do
    begin
        if TDrawOverlay(FList[I]) is TLineOverlay then
        begin
             if FileSize(LineFile) = 0 then
             begin
                seek(LineFile, 0);
                Write(LineFile, TLineOverlay(FList[I]).dataLineRecord);
             end
             else
             begin
                seek(LineFile, FileSize(LineFile));
                Write(LineFile, TLineOverlay(FList[I]).dataLineRecord);
             end;
        end;
    end;
end;

procedure TTableOverlay.HitTable(pos : TPoint; Map1: TMap);
var
  rect : TRect;
  pt   : TPoint;
  x1, x2, y1, y2 : single;
  I    : Integer;
  overlayPl : overlayPlus;
begin
   pt := pos;
   overlayPl := overlayPlus.Create;

   for I := 0 to FList.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TTableOverlay then
    begin
      with TTableOverlay(FList[I]).dataTableRecord do
      begin
        isSelected := false;        //inisialisasi awal, default = false
        Map1.ConvertCoord(x1, y1, tablePosStartLongitude, tablePosStartLatitude, miMapToScreen);
        Map1.ConvertCoord(x2, y2, tablePosEndLongitude, tablePosEndLatitude, miMapToScreen);

        rect := overlayPl.checkXYPosition(x1, y1, x2, y2);
        if (pt.X >= rect.Left) AND (pt.X <= rect.Right) then
        begin
          if (pt.Y >= rect.Top) AND (pt.Y <= rect.Bottom) then
          begin
            isSelected := true;

//            OverlayEditorForm.edtGridPosLong.Text  := formatDM_longitude(tableCenterPosLongitude);
//            OverlayEditorForm.edtGridPosLat.Text   := formatDM_latitude(tableCenterPosLatitude);
//
//            OverlayEditorForm.edtGridGLong.Text    := tableCenterGridLongitude;
//            OverlayEditorForm.edtGridGLat.Text     := tableCenterGridLatitude;
//
//            OverlayEditorForm.edtCellWidth.Text    := IntToStr(tableCellWidth);
//            OverlayEditorForm.edtCellheight.TExt   := IntToStr(tableCellHeight);
//
//            OverlayEditorForm.edtColumns.Text := IntToStr(tableNumbColumns);
//            OverlayEditorForm.edtRows.Text    := IntToStr(tableNumbRows);
//            OverlayEditorForm.gbGrid.BringToFront;
            break;
          end;
        end;
      end;                  //end with
    end;                    //end if terluar
   end;                     // end for
end;

procedure TTableOverlay.editTableRecord(tabCentGridLat: string; tabCentGridLong: string; tabCentPosLat: double;
      tabCentPosLong: double; tabCellWidth: integer; tabCellheight: integer;
      numberColums: integer; numberRows: integer; Map1: TMap);
var
   I : integer;
   degreeCellWidth, degreeCellHeight       : integer;
begin
   for I := 0 to FList.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TTableOverlay then
    begin
      with TTableOverlay(FList[I]).dataTableRecord do
      begin
           if isSelected then
           begin
              tableCenterGridLatitude   := tabCentGridLat;
              tableCenterGridLongitude  := tabCentGridLong;
              tableCenterPosLatitude    := tabCentPosLat;
              tableCenterPosLongitude   := tabCentPosLong;
              tabCellWidth              := tabCellWidth;         // nm
              tabCellheight             := tabCellheight;        // nm
              tableNumbColumns          := numberColums;
              tableNumbRows             := numberRows;
              //color                     := color;
              //isSelected                :=

              degreeCellWidth  := round(tabCellWidth  / 60);
              degreeCellHeight  := round(tabCellheight / 60);

              if tablePosEndLongitude >= tablePosStartLongitude then                                   //kuadran 4
              begin
                 if tablePosEndLatitude >= tablePosStartLatitude then
                 begin
                    tablePosStartLongitude := tabCentPosLong - degreeCellWidth*2;
                    tablePosStartLatitude := tabCentPosLat - degreeCellHeight*2;
                    tablePosEndLongitude := tabCentPosLong + degreeCellWidth*2;
                    tablePosEndLatitude := tabCentPosLat + degreeCellHeight*2;
                 end
                 else if tablePosEndLatitude <= tablePosStartLatitude then                           //kuadran 1
                 begin
                    tablePosStartLongitude := tabCentPosLong - degreeCellWidth*2;
                    tablePosStartLatitude := tabCentPosLat + degreeCellHeight*2;
                    tablePosEndLongitude := tabCentPosLong + degreeCellWidth*2;
                    tablePosEndLatitude := tabCentPosLat - degreeCellHeight*2;
                 end;
              end;

              if tablePosEndLongitude <= tablePosStartLongitude then
              begin
                 if tablePosEndLatitude >= tablePosStartLatitude then                                //kuadran 3
                 begin
                    tablePosStartLongitude := tabCentPosLong + degreeCellWidth*2;
                    tablePosStartLatitude := tabCentPosLat - degreeCellHeight*2;
                    tablePosEndLongitude := tabCentPosLong - degreeCellWidth*2;
                    tablePosEndLatitude := tabCentPosLat + degreeCellHeight*2;
                 end
                 else if tablePosEndLatitude <= tablePosStartLatitude then                           //kuadran 2
                 begin
                    tablePosStartLongitude := tabCentPosLong + degreeCellWidth*2;
                    tablePosStartLatitude := tabCentPosLat + degreeCellHeight*2;
                    tablePosEndLongitude := tabCentPosLong - degreeCellWidth*2;
                    tablePosEndLatitude := tabCentPosLat - degreeCellHeight*2;
                 end;
              end;
              break;
           end;
      end;
    end;
   end;
end;

procedure TTableOverlay.editTableRecordToFile(fName: String);
var
    tempTable : TTableOverlay;
    I         : integer;
begin
    tempTable := TTableOverlay.Create;
    tempTable.TableRecord     := self.TableRecord;
    tempTable.dataTableRecord := self.dataTableRecord;

    DeleteFile(fName);
    createTableFile(fName);

    for I := 0 to FList.Count - 1 do
    begin
        if TDrawOverlay(FList[I]) is TTableOverlay then
        begin
          //with TTableOverlay(FList[I]).dataTableRecord do
          //begin
             if FileSize(TableFile) = 0 then
             begin
                seek(TableFile, 0);
                Write(TableFile, TTableOverlay(FList[I]).dataTableRecord);
             end
             else
             begin
                seek(TableFile, FileSize(TableFile));
                Write(TableFile, TTableOverlay(FList[I]).dataTableRecord);
             end;
         // end;
        end;
    end;

    //TableRecord := dataTableRecord;
    //FList.Add(tempTable);
end;

procedure TRectOverlay.HitRect(pos : TPoint; Map1: TMap);
var
  rect :TRect;
  x1, x2, y1, y2 : single;
  I : Integer;
  overlayPl : overlayPlus;
begin
   overlayPl := overlayPlus.Create;

   for I := 0 to FList.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TRectOverlay then
    begin
      with TRectOverlay(FList[I]).dataRectRecord do
           isSelected := false;
    end;
   end;

   for I := 0 to FList.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TRectOverlay then
    begin
      with TRectOverlay(FList[I]).dataRectRecord do
      begin
        Map1.ConvertCoord(x1, y1, rectanglePosStartLongitude, rectanglePosStartLatitude, miMapToScreen);
        Map1.ConvertCoord(x2, y2, rectanglePosEndLongitude, rectanglePosEndLatitude, miMapToScreen);

        rect := overlayPl.checkXYPosition(x1, y1, x2, y2);
        if (pos.X >= rect.Left) AND (pos.X <= rect.Right) then
        begin
          if (pos.Y >= rect.Top) AND (pos.Y <= rect.Bottom) then
          begin
            isSelected := true;
            OverlayEditorForm.edtRectStartPosLong.Text  := formatDM_longitude(rectanglePosStartLongitude);
            OverlayEditorForm.edtRectStartPosLat.Text   := formatDM_latitude(rectanglePosStartLatitude);
            OverlayEditorForm.edtRectEndPosLong.Text    := formatDM_longitude(rectanglePosEndLongitude);
            OverlayEditorForm.edtRectEndPosLat.Text     := formatDM_latitude(rectanglePosEndLatitude);
//            OverlayEditorForm.edtRectStartGridLong.Text := rectangleGridStartLongitude;
//            OverlayEditorForm.edtRectStartGridLat.Text  := rectangleGridStartLatitude;
//            OverlayEditorForm.edtRectEndGridLong.Text   := rectangleGridEndLongitude;
//            OverlayEditorForm.edtRectEndGridLat.Text    := rectangleGridEndLatitude;
//            OverlayEditorForm.gbRectangle.BringToFront;
            break;
          end;
        end;
      end;
    end;
   end;
end;

procedure TRectOverlay.editRectRecord2(mapRectStartX: Double; mapRectStartY: Double;
      mapRectEndX: Double; mapRectEndY: Double;  aRec : TRectRecord ; Map1: TMap);
var
   I : integer;
begin
   for I := 0 to Flist.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TRectOverlay then
    begin
      with TRectOverlay(FList[I]).dataRectRecord do
      begin
           if isSelected then
           begin
              rectanglePosStartLongitude := mapRectStartX;
              rectanglePosStartLatitude  := mapRectStartY;
              rectanglePosEndLongitude   := mapRectEndX;
              rectanglePosEndLatitude    := mapRectEndY;
              rectangleGridStartLongitude:= aRec.rectangleGridStartLongitude;
              rectangleGridStartLatitude := aRec.rectangleGridStartLatitude;
              rectangleGridEndLongitude  := aRec.rectangleGridEndLongitude;
              rectangleGridEndLatitude   := aRec.rectangleGridEndLatitude;
              {color                     := color;
              isSelected                := }
              break;
           end;
      end;
    end;
   end;
end;


procedure TRectOverlay.editRectRecord(mapRectStartX: Double; mapRectStartY: Double;
  mapRectEndX: Double; mapRectEndY: Double; rectGridStartLong: string;
  rectGridStartLat: string; RectGridEndLong: string;
  RectGridEndLat: string; Map1: TMap);
var
   I : integer;
begin
   for I := 0 to Flist.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TRectOverlay then
    begin
      with TRectOverlay(FList[I]).dataRectRecord do
      begin
           if isSelected then
           begin
              rectanglePosStartLongitude := mapRectStartX;
              rectanglePosStartLatitude  := mapRectStartY;
              rectanglePosEndLongitude   := mapRectEndX;
              rectanglePosEndLatitude    := mapRectEndY;
              rectangleGridStartLongitude:= rectGridStartLong[30];
              rectangleGridStartLatitude := rectGridStartLat[30];
              rectangleGridEndLongitude  := RectGridEndLong[30];
              rectangleGridEndLatitude   := RectGridEndLat[30];
              //color                     := color;
              //isSelected                :=
              break;
           end;
      end;
    end;
   end;
end;


procedure TRectOverlay.editRectRecordToFile(fName: String);
var
    tempRect : TRectOverlay;
    I         : integer;
begin
    tempRect := TRectOverlay.Create;
    tempRect.RectRecord     := self.RectRecord;
    tempRect.dataRectRecord := self.dataRectRecord;

    DeleteFile(fName);
    createRectFile(fName);

    for I := 0 to FList.Count - 1 do
    begin
        if TDrawOverlay(FList[I]) is TRectOverlay then
        begin
             if FileSize(RectFile) = 0 then
             begin
                seek(RectFile, 0);
                Write(RectFile, TRectOverlay(FList[I]).dataRectRecord);
             end
             else
             begin
                seek(RectFile, FileSize(RectFile));
                Write(RectFile, TRectOverlay(FList[I]).dataRectRecord);
             end;
        end;
    end;
end;

procedure TEllipseOverlay.HitEllipse(pos : TPoint; Map1: TMap);
var
  rect :TRect;
  x1, x2, y1, y2 : single;
  I : Integer;
  overlayPl : overlayPlus;
begin
   overlayPl := overlayPlus.Create;

   for I := 0 to FList.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TEllipseOverlay then
    begin
      with TEllipseOverlay(FList[I]).dataEllipseRecord do
      begin
        isSelected := false;
        Map1.ConvertCoord(x1, y1, ellipsePosStartLongitude, ellipsePosStartLatitude, miMapToScreen);
        Map1.ConvertCoord(x2, y2, ellipsePosEndLongitude, ellipsePosEndLatitude, miMapToScreen);

        rect := overlayPl.checkXYPosition(x1, y1, x2, y2);
        if (pos.X >= rect.Left) AND (pos.X <= rect.Right) then
        begin
          if (pos.Y >= rect.Top) AND (pos.Y <= rect.Bottom) then
          begin
            isSelected := true;
            OverlayEditorForm.edtEllipsePosLong.Text  := formatDM_longitude(ellipsePosCenterLongitude);
//            frmOverlayEditor.edtEllipsePosLatt.Text  := formatDM_latitude(ellipsePosCenterLatitude);
//            frmOverlayEditor.edtEllipseGridLong.Text := ellipseGridPointCenterLongitude;
//            frmOverlayEditor.edtEllipseGridLatt.Text := ellipseGridPointCenterLatitude;
//            frmOverlayEditor.edtMajorAxis.Text       := inttostr(ellipseMajor);
//            frmOverlayEditor.edtMinorAxis.Text       := inttostr(ellipseMinor);
//            frmOverlayEditor.gbEllipse.BringToFront;
            break;
          end;
        end;
      end;
    end;
   end;
end;

procedure TEllipseOverlay.editEllipseRecord(posLong: double; posLat: double; gridLong: string; gridLat: string;
      major: integer; minor: integer; Map1: TMap);
var
   I : integer;
   degreeMajor, degreeMinor   : double;
begin
   for I := 0 to Flist.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TEllipseOverlay then
    begin
      with TEllipseOverlay(FList[I]).dataEllipseRecord do
      begin
           if isSelected then
           begin
              ellipseGridPointCenterLatitude   := gridLat;
              ellipseGridPointCenterLongitude  := gridLong;
              ellipsePosCenterLatitude         := PosLat;
              ellipsePosCenterLongitude        := PosLong;
              ellipseMajor                     := major;         // nm
              ellipseMinor                     := minor;         // nm
              //color                     := color;
              //isSelected                :=

              degreeMajor := (ellipseMajor / 60);        // nm to degree
              degreeMinor := (ellipseMinor / 60);

              if flagX = 'major' then
              begin
                if ellipsePosEndLongitude >= ellipsePosStartLongitude then                                   //kuadran 4
                begin
                   if ellipsePosEndLatitude >= ellipsePosStartLatitude then
                   begin
                      ellipsePosStartLongitude := ellipsePosCenterLongitude - degreeMajor/2;
                      ellipsePosStartLatitude  := ellipsePosCenterLatitude  - degreeMinor/2;
                      ellipsePosEndLongitude   := ellipsePosCenterLongitude + degreeMajor/2;
                      ellipsePosEndLatitude    := ellipsePosCenterLatitude  + degreeMinor/2;
                   end
                   else if ellipsePosEndLatitude <= ellipsePosStartLatitude then                           //kuadran 1
                   begin
                      ellipsePosStartLongitude := ellipsePosCenterLongitude - degreeMajor/2;
                      ellipsePosStartLatitude  := ellipsePosCenterLatitude  + degreeMinor/2;
                      ellipsePosEndLongitude   := ellipsePosCenterLongitude + degreeMajor/2;
                      ellipsePosEndLatitude    := ellipsePosCenterLatitude  - degreeMinor/2;
                   end;
                end;
                if ellipsePosEndLongitude <= ellipsePosStartLongitude then
                begin
                   if ellipsePosEndLatitude >= ellipsePosStartLatitude then                                //kuadran 3
                   begin
                      ellipsePosStartLongitude := ellipsePosCenterLongitude + degreeMajor/2;
                      ellipsePosStartLatitude  := ellipsePosCenterLatitude  - degreeMinor/2;
                      ellipsePosEndLongitude   := ellipsePosCenterLongitude - degreeMajor/2;
                      ellipsePosEndLatitude    := ellipsePosCenterLatitude  + degreeMinor/2;
                   end
                   else if ellipsePosEndLatitude <= ellipsePosStartLatitude then                           //kuadran 2
                   begin
                      ellipsePosStartLongitude := ellipsePosCenterLongitude + degreeMajor/2;
                      ellipsePosStartLatitude  := ellipsePosCenterLatitude  + degreeMinor/2;
                      ellipsePosEndLongitude   := ellipsePosCenterLongitude - degreeMajor/2;
                      ellipsePosEndLatitude    := ellipsePosCenterLatitude  - degreeMinor/2;
                   end;
                end;
              end
              else if flagX = 'minor' then
              begin
                if ellipsePosEndLongitude >= ellipsePosStartLongitude then                                   //kuadran 4
                begin
                   if ellipsePosEndLatitude >= ellipsePosStartLatitude then
                   begin
                      ellipsePosStartLongitude := ellipsePosCenterLongitude - degreeMinor/2;
                      ellipsePosStartLatitude  := ellipsePosCenterLatitude  - degreeMajor/2;
                      ellipsePosEndLongitude   := ellipsePosCenterLongitude + degreeMinor/2;
                      ellipsePosEndLatitude    := ellipsePosCenterLatitude  + degreeMajor/2;
                   end
                   else if ellipsePosEndLatitude <= ellipsePosStartLatitude then                           //kuadran 1
                   begin
                      ellipsePosStartLongitude := ellipsePosCenterLongitude - degreeMinor/2;
                      ellipsePosStartLatitude  := ellipsePosCenterLatitude  + degreeMajor/2;
                      ellipsePosEndLongitude   := ellipsePosCenterLongitude + degreeMinor/2;
                      ellipsePosEndLatitude    := ellipsePosCenterLatitude  - degreeMajor/2;
                   end;
                end;
                if ellipsePosEndLongitude <= ellipsePosStartLongitude then
                begin
                   if ellipsePosEndLatitude >= ellipsePosStartLatitude then                                //kuadran 3
                   begin
                      ellipsePosStartLongitude := ellipsePosCenterLongitude + degreeMinor/2;
                      ellipsePosStartLatitude  := ellipsePosCenterLatitude  - degreeMajor/2;
                      ellipsePosEndLongitude   := ellipsePosCenterLongitude - degreeMinor/2;
                      ellipsePosEndLatitude    := ellipsePosCenterLatitude  + degreeMajor/2;
                   end
                   else if ellipsePosEndLatitude <= ellipsePosStartLatitude then                           //kuadran 2
                   begin
                      ellipsePosStartLongitude := ellipsePosCenterLongitude + degreeMinor/2;
                      ellipsePosStartLatitude  := ellipsePosCenterLatitude  + degreeMajor/2;
                      ellipsePosEndLongitude   := ellipsePosCenterLongitude - degreeMinor/2;
                      ellipsePosEndLatitude    := ellipsePosCenterLatitude  - degreeMajor/2;
                   end;
                end;
              end;
              break;
           end;
      end;
    end;
   end;
end;

procedure TEllipseOverlay.editEllipseRecordToFile(fName: String);
var
    tempEllipse : TEllipseOverlay;
    I           : integer;
begin
    tempEllipse := TEllipseOverlay.Create;
    tempEllipse.EllipseRecord     := self.EllipseRecord;
    tempEllipse.dataEllipseRecord := self.dataEllipseRecord;

    DeleteFile(fName);
    createEllipseFile(fName);

    for I := 0 to FList.Count - 1 do
    begin
        if TDrawOverlay(FList[I]) is TEllipseOverlay then
        begin
             if FileSize(EllipseFile) = 0 then
             begin
                seek(EllipseFile, 0);
                Write(EllipseFile, TEllipseOverlay(FList[I]).dataEllipseRecord);
             end
             else
             begin
                seek(EllipseFile, FileSize(EllipseFile));
                Write(EllipseFile, TEllipseOverlay(FList[I]).dataEllipseRecord);
             end;
        end;
    end;
end;

procedure TTextOverlay.Hittext(pos : TPoint; Map1: TMap);
const
  RANGE                = 8;
var
  rect{, rect2 }       : TRect;
  x1, y1               : single;
  I                    : Integer;
  overlayPl            : overlayPlus;
begin
   overlayPl := overlayPlus.Create;

   for I := 0 to FList.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TTextOverlay then
    begin
      with TTextOverlay(FList[I]).dataTextRecord do
           isSelected := false;
    end;
   end;

   for I := 0 to FList.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TTextOverlay then
    begin
      with TTextOverlay(FList[I]).dataTextRecord do
      begin
        Map1.ConvertCoord(x1, y1, textPosStartLongitude, textPosStartLatitude, miMapToScreen);

        rect  := overlayPl.assignRect(x1, y1);
        //rect2 := overlayPl.assignRect(x1 + RANGE, y1 + RANGE);
        if ((pos.X >= rect.Left) AND (pos.X <= rect.Right))  {OR ((pos.X >= rect2.Left) AND (pos.X <= rect2.Right))} then
        begin
          if ((pos.Y >= rect.Top) AND (pos.Y <= rect.Bottom)) {OR ((pos.Y >= rect2.Top) AND (pos.Y <= rect2.Bottom))} then
          begin
            isSelected := true;

            OverlayEditorForm.edtTextPosLong.Text  := formatDM_longitude(textPosStartLongitude);
            OverlayEditorForm.edtTextPosLAt.Text   := formatDM_latitude(textPosStartLatitude);
//            frmOverlayEditor.edtTextGridLong.Text := textGridStartLongitude;
//            frmOverlayEditor.edtTextGridLat.Text  := textGridStartLatitude;
//            frmOverlayEditor.edtText.Text         := TextString;
//            frmOverlayEditor.gbText.BringToFront;
            break;
          end;
        end;
      end;                  //end with
    end;                    //end if terluar
   end;                     // end for
end;

procedure TTextOverlay.editTextRecord(mapTextStartX: Double; mapTextStartY: Double;
  textGridStartLong: string; textGridStartLat: string; TextStringO: string;
  TextSizeO: integer; Map1: TMap);
var
   I : integer;
begin
   for I := 0 to Flist.Count - 1 do
   begin
    if TDrawOverlay(FList[I]) is TTextOverlay then
    begin
      with TTextOverlay(FList[I]).dataTextRecord do
      begin
           if isSelected then
           begin
              textPosStartLongitude  := mapTextStartX;
              textPosStartLatitude   := mapTextStartY;
              textGridStartLongitude := textGridStartLong;
              textGridStartLat       := textGridStartLat;
              TextString             := TextStringO;
              textSize               := TextSizeO;
              break;
           end;
      end;
    end;
   end;
end;

procedure TTextOverlay.editTextRecordToFile(fName: String);
var
    temptext  : TTextOverlay;
    I         : integer;
begin
    tempText                 := TTextOverlay.Create;
    tempText.TextRecord      := self.TextRecord;
    tempText.dataTextRecord  := self.dataTextRecord;

    DeleteFile(fName);
    createTextFile(fName);

    for I := 0 to FList.Count - 1 do
    begin
        if TDrawOverlay(FList[I]) is TTextOverlay then
        begin
             if FileSize(TextFile) = 0 then
             begin
                seek(TextFile, 0);
                Write(TextFile, TTextOverlay(FList[I]).dataTextRecord);
             end
             else
             begin
                seek(TextFile, FileSize(TextFile));
                Write(TextFile, TTextOverlay(FList[I]).dataTextRecord);
             end;
        end;
    end;
end;

end.
