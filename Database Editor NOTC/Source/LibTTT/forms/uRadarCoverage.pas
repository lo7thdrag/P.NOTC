unit uRadarCoverage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, uDBAssetObject,
  Buttons, uDataModuleTTT, math, uDBAsset_Radar, System.ImageList;

const
  Cover1 = 1;
  Cover2 = 2;

type
  E_VerticalCoverageCurve = (vcCurve1 = 1, vcCurve2);

  TRadarCoverage = class(TForm)
    pnl1: TPanel;
    imgGraph: TImage;
    grp1: TGroupBox;
    lbllb1: TLabel;
    lbllb2: TLabel;
    lblRatioCursor: TLabel;
    lblProbCursor: TLabel;
    grp2: TGroupBox;
    lbllb5: TLabel;
    lbllb6: TLabel;
    lblRatioSelect: TLabel;
    lblProbSelect: TLabel;
    grp3: TGroupBox;
    lbllb3: TLabel;
    lbllb4: TLabel;
    lbllb7: TLabel;
    lbllb8: TLabel;
    edtRatioMin: TEdit;
    edtRatioMax: TEdit;
    grp4: TGroupBox;
    lbllb9: TLabel;
    lbllb10: TLabel;
    lbllb11: TLabel;
    lbllb12: TLabel;
    edtProbMin: TEdit;
    edtProbMax: TEdit;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    pnl2: TPanel;
    tlb1: TToolBar;
    btnMove: TToolButton;
    btnAdd: TToolButton;
    btn4: TToolButton;
    btnDelete: TToolButton;
    il1: TImageList;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    procedure clearAll;
    procedure FormCreate(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure refreshPoint;
    procedure drawGrid;
    procedure drawPoint(const x,y,brush:Integer);
    procedure drawLine(const x1,y1,x2,y2:Integer);
    procedure btnOKClick(Sender: TObject);
    procedure closing;
    procedure btnApplyClick(Sender: TObject);
    procedure saveData;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure getData;
    procedure drawData;
    procedure getPointRadar;
    procedure captureMinMax;
    procedure imgGraphMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgGraphMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgGraphMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function compareList(Item1 : Pointer; Item2 : Pointer) : Integer;
    procedure edtProbMinKeyPress(Sender: TObject; var Key: Char);
    procedure edtProbMinClick(Sender: TObject);

  private
    FSelectedRadar : TRadar_On_Board;
    FSelectedCurve : E_VerticalCoverageCurve;

  public
  uList,mList : Tlist;
  pressed,moved,adding,edit,isMax : boolean;
  show_index : Byte;
  MinRatio, MaxRatio, MinProb, MaxProb : Integer;
  xMax,xMin,yMax,yMin, xRatio, yRatio : Double;
  xPoint, yPoint , xLength, yLength, y0 : Integer;
  index, xIndex, yIndex : Integer;
  Radar_coverage : TRadar_Vertical;
    { Public declarations }

  property SelectedCurve : E_VerticalCoverageCurve read FSelectedCurve
      write FSelectedCurve;
  end;

var
  RadarCoverage: TRadarCoverage;

implementation

uses ufrmSummaryRadar, uFormula, tttData;

{$R *.dfm}

{ TRadarCoverage }

procedure TRadarCoverage.btnAddClick(Sender: TObject);
begin
  adding  := not adding;
  moved   := not adding;
  btnAdd.Down := adding;
  if adding then
    btnMove.Down := not adding;
end;

procedure TRadarCoverage.btnApplyClick(Sender: TObject);
begin
  saveData;
end;

procedure TRadarCoverage.btnCancelClick(Sender: TObject);
begin
  closing;
end;

procedure TRadarCoverage.btnDeleteClick(Sender: TObject);
begin
  if index <> -1 then
  begin
    uList.Delete(index);
    refreshPoint;
  end;
end;

procedure TRadarCoverage.btnMoveClick(Sender: TObject);
begin
  moved   := not moved;
  adding  := not moved;
  btnMove.Down := moved;
  if moved then
  btnAdd.Down  := not moved;
end;

procedure TRadarCoverage.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  closing;
end;

procedure TRadarCoverage.clearAll;
begin
  imgGraph.Canvas.Pen.Color   := clWhite;
  imgGraph.Canvas.Brush.Color := clwhite;
  imgGraph.Canvas.Rectangle(0,0,imgGraph.width-1,imgGraph.height-1);
end;

procedure TRadarCoverage.closing;
begin
  edit    := false;
  adding  := false;
  Close;
end;

procedure TRadarCoverage.getData;
begin
  uList.Clear;

//  Caption := 'Vertical Coverage Curve 1 for ' +
//            frmSummaryRadar.radarobject.FDef.Radar_Identifier;
//  case show_index of
//    Byte(Cover1):
//      dmTTT.getRadar_Vertical_Coverage(1,frmSummaryRadar.radarobject.FDef.Radar_Index,uList,xMin,yMax,yMin);
//    Byte(Cover2):
//      dmTTT.getRadar_Vertical_Coverage(2,frmSummaryRadar.radarobject.FDef.Radar_Index,uList,xMin,yMax,yMin);
//  end;
  if uList.Count > 0 then
    xMax  := TRadar_Vertical(uList[uList.Count-1]).FRadar_Coverage.Vert_Coverage_Range;
  imgGraph.Canvas.TextOut(40,20,'Elevation (Feet)');
  imgGraph.Canvas.TextOut(140,240,'Range (nm)');
end;

procedure TRadarCoverage.getPointRadar;
var
  I,x1,y1min,y1max,x2,y2min,y2max: Integer;
  lPoint : TRadar_Vertical;
begin
  for I := 0 to uList.Count - 1 do begin
    x1 := Round(((TRadar_Vertical(uList[I]).FRadar_Coverage.Vert_Coverage_Range * xRatio))/100) + xPoint;
    y1max := y0 - Round((TRadar_Vertical(uList[I]).FRadar_Coverage.Vert_Cover_Max_Elevation)/50000 * yRatio);
    y1min := y0 - Round((TRadar_Vertical(uList[I]).FRadar_Coverage.Vert_Cover_Min_Elevation)/50000 * yRatio);

    lPoint := uList[I];
    lPoint.X := x1;
    lPoint.Ymax := y1max;
    lPoint.Ymin := y1min;

    drawPoint(x1,y1max,0);
    drawPoint(x1,y1min,0);
    if I <> uList.Count - 1 then
    begin
      x2 := Round(((TRadar_Vertical(uList[I+1]).FRadar_Coverage.Vert_Coverage_Range * xRatio))/100) + xPoint;
      y2max := y0 - Round((TRadar_Vertical(uList[I+1]).FRadar_Coverage.Vert_Cover_Max_Elevation)/50000 * yRatio);
      y2min := y0 - Round((TRadar_Vertical(uList[I+1]).FRadar_Coverage.Vert_Cover_Min_Elevation)/50000 * yRatio);
      drawLine(x1,y1max,x2,y2max);
      drawLine(x1,y1min,x2,y2min);
    end;
  end;
end;

procedure TRadarCoverage.imgGraphMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  I: Integer;
  rPoint   : TRadar_Vertical;
begin
  if  (X < xPoint+xLength+5) and (Y < yPoint+yLength+5) and
      (X > xPoint-5) and (Y > yPoint-5) then
  begin
    if btnAdd.Down then
    begin
      rPoint  := TRadar_Vertical.Create;
      rPoint.X  := X;
      if Y <= y0 then
      begin
        rPoint.Ymax  := Y;
        rPoint.Ymin  := y0 + (y0 - Y);
      end
      else
      begin
        rPoint.Ymax  := y0 - (Y - y0);
        rPoint.Ymin  := Y;
      end;
      uList.Add(rPoint);
      uList.SortList(compareList);
    end;
    refreshPoint;
    for I := 0 to uList.Count - 1 do begin
      if  (X < TRadar_Vertical(uList[I]).X + 5) and
          (Y < TRadar_Vertical(uList[I]).Ymax + 5) and
          (X > TRadar_Vertical(uList[I]).X - 5) and
          (Y > TRadar_Vertical(uList[I]).Ymax - 5) then
      begin
        drawPoint(TRadar_Vertical(uList[I]).X,TRadar_Vertical(uList[I]).Ymax,1);
        drawPoint(TRadar_Vertical(uList[I]).X,TRadar_Vertical(uList[I]).Ymin,1);
        pressed := true;
        isMax   := True;
        index   := I;
        xIndex  := TRadar_Vertical(uList[I]).X;
        yIndex  := TRadar_Vertical(uList[I]).Ymax;
      end
      else if  (X < TRadar_Vertical(uList[I]).X + 5) and
          (Y < TRadar_Vertical(uList[I]).Ymin + 5) and
          (X > TRadar_Vertical(uList[I]).X - 5) and
          (Y > TRadar_Vertical(uList[I]).Ymin - 5) then
      begin
        drawPoint(TRadar_Vertical(uList[I]).X,TRadar_Vertical(uList[I]).Ymax,1);
        drawPoint(TRadar_Vertical(uList[I]).X,TRadar_Vertical(uList[I]).Ymin,1);
        pressed := true;
        isMax   := False;
        index   := I;
        xIndex  := TRadar_Vertical(uList[I]).X;
        yIndex  := TRadar_Vertical(uList[I]).Ymin;
      end;
    end;
  end;
end;

procedure TRadarCoverage.imgGraphMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if  (X < xPoint+xLength+5) and (Y < yPoint+yLength+5) and
      (X > xPoint-5) and (Y > yPoint-5) then
  begin
    lblRatioCursor.Caption := FormatFloat('0.00',((x - xPoint) / xRatio * 100));
    lblProbCursor.Caption  := FormatFloat('0.00',(((y0 - y) * 50000) / yRatio));
    if pressed and btnMove.Down then
    begin
      TRadar_Vertical(uList[index]).X := X;
      if isMax and (Y <= y0) then
      begin
        TRadar_Vertical(uList[index]).Ymax := Y;
        yIndex  := Y;
      end
      else if not isMax and (Y > y0) then
      begin
        TRadar_Vertical(uList[index]).Ymin := Y;
        yIndex  := Y;
      end;
      xIndex  := X;
      refreshPoint;
    end;
  end
  else begin
    lblRatioCursor.Caption := '-';
    lblProbCursor.Caption  := '-';
  end;
end;

procedure TRadarCoverage.imgGraphMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  uList.SortList(compareList);
  refreshPoint;
  pressed := false;
end;

function TRadarCoverage.compareList(Item1 : Pointer; Item2 : Pointer) : Integer;
var
  x1, x2 : TRadar_Vertical;
begin
  x1 := TRadar_Vertical(Item1);
  x2 := TRadar_Vertical(Item2);

  if x1.X > x2.X then Result := 1
  else if x1.X = x2.X then Result := 0
  else Result := -1;
end;

procedure TRadarCoverage.drawData;
begin
  pressed := false;
  //  edit    := false;
  adding  := false;
  btnAdd.Down := false;
  btnMove.Down  := false;
  index   := -1;

  clearAll;
  imgGraph.Canvas.Pen.Color := clBlack;

  xPoint  := 60;
  yPoint  := 50;
  xLength := 500;
  yLength := 400;

  if not edit then
  begin
    edit  := false;
    if uList.Count < 1 then
    begin
      MaxProb   := 300000;
      MinProb   := -300000;
      MaxRatio  := 500;
      MinRatio  := 0;

      edtRatioMin.Text  := FormatFloat('0', MinRatio);
      edtRatioMax.Text  := FormatFloat('0', MaxRatio);
      edtProbMin.Text   := FormatFloat('0', MinProb);
      edtProbMax.Text   := FormatFloat('0', MaxProb);
    end

    else begin
      MinRatio  := 0;
      MinProb   := -300000;
      MaxRatio  := Ceil(xMax);
      MaxProb   := 300000;
//      MinProb   := Ceil(yMin);
//      MaxProb   := Ceil(yMax);
//      while MaxProb mod 100000 <> 0 do Inc(MaxProb);
//      while MinProb mod 100000 <> 0 do Dec(MinProb);
      while MaxRatio mod 100 <> 0 do Inc(MaxRatio);

      edtRatioMin.Text  := FormatFloat('0', MinRatio);
      edtRatioMax.Text  := FormatFloat('0', MaxRatio);
      edtProbMin.Text   := FormatFloat('0', MinProb);
      edtProbMax.Text   := FormatFloat('0', MaxProb);
    end;
  end;
  xRatio    := xLength/((MaxRatio-MinRatio)/100);
  yRatio    := (yLength/((MaxProb-MinProb)/50000));

  drawGrid;

  getPointRadar;
end;

procedure TRadarCoverage.drawGrid;
var w_save,w,h_save,h,x,y : Integer;
begin
  x := MinRatio;
  x := x + 100;
  y := MinProb;
  y := y + 50000;

  w_save  := xPoint;
  w := xPoint + Round(xRatio);
  while x <= MaxRatio do begin
    x := x + 100;
    w_save  := w;
    w := w + Round(xRatio);
  end;

  h_save  := yPoint+yLength;
  h := yPoint+yLength - Round(yRatio);
  while y <= MaxProb do begin
    y := y + 50000;
    h_save  := h;
    h := h - Round(yRatio);
  end;

  // update xy
  xLength := w_save - xPoint;
  xRatio  := xLength/((MaxRatio-MinRatio)/100);
  yLength := (yLength+yPoint) - h_save;
  yRatio  := (yLength/((MaxProb-MinProb)/50000));

  x := MinRatio;
  y := MinProb;

  //horizontal
  h_save  := yPoint+yLength;
  h := yPoint+yLength;
  while y <= MaxProb do begin

    if y = 0 then
    begin
      imgGraph.Canvas.Pen.Color := clBlack;
      imgGraph.Canvas.Pen.Style := psSolid;
      imgGraph.Canvas.MoveTo(xPoint,h);
      imgGraph.Canvas.LineTo(xPoint+xLength,h);
      imgGraph.Canvas.MoveTo(xPoint,h);
      imgGraph.Canvas.LineTo(xPoint-5,h);
      y0 := h;
    end
    else begin
      imgGraph.Canvas.Pen.Color := clGray;
      imgGraph.Canvas.Pen.Style := psDot;
      imgGraph.Canvas.MoveTo(xPoint,h);
      imgGraph.Canvas.LineTo(xPoint+xLength,h);
      imgGraph.Canvas.Pen.Color := clBlack;
      imgGraph.Canvas.Pen.Style := psSolid;
      imgGraph.Canvas.MoveTo(xPoint,h);
      imgGraph.Canvas.LineTo(xPoint-5,h);
      imgGraph.Canvas.TextOut(xPoint-45,h-4,IntToStr(y));
    end;

    y := y + 50000;
    //----------------------------------------------------------------------
    h_save  := h;
    h := h - Round(yRatio);
  end;

  // vertical
  w_save  := xPoint;
  w := xPoint;
  while x <= MaxRatio do begin
    if x = 0 then
    begin
      imgGraph.Canvas.Pen.Color := clBlack;
      imgGraph.Canvas.Pen.Style := psSolid;
      imgGraph.Canvas.MoveTo(w,yPoint);
      imgGraph.Canvas.LineTo(w,yPoint+yLength);
      imgGraph.Canvas.MoveTo(w,yPoint+yLength);
      imgGraph.Canvas.LineTo(w,yPoint+yLength+5);
      imgGraph.Canvas.TextOut(w-13,y0-4,IntToStr(x));
    end
    else begin
      imgGraph.Canvas.Pen.Color := clGray;
      imgGraph.Canvas.Pen.Style := psDot;
      imgGraph.Canvas.MoveTo(w,yPoint);
      imgGraph.Canvas.LineTo(w,yPoint+yLength);
      imgGraph.Canvas.Pen.Color := clBlack;
      imgGraph.Canvas.Pen.Style := psSolid;
      imgGraph.Canvas.MoveTo(Round(w_save+(xRatio/2)),y0);
      imgGraph.Canvas.LineTo(Round(w_save+(xRatio/2)),y0+5);
      imgGraph.Canvas.MoveTo(w,y0);
      imgGraph.Canvas.LineTo(w,y0+5);
      imgGraph.Canvas.TextOut(w-10,y0+8,IntToStr(x));
    end;

    x := x + 100;
    //----------------------------------------------------------------------
    w_save  := w;
    w := w + Round(xRatio);
  end;

  x := MinRatio;
  y := MinProb;

  imgGraph.Canvas.Pen.Color := clBlack;
  imgGraph.Canvas.Pen.Style := psSolid;
  imgGraph.Canvas.TextOut(40,20,'Elevation (Feet)');
  imgGraph.Canvas.TextOut(280,y0+25,'Range (nm)');
end;

procedure TRadarCoverage.drawLine(const x1, y1, x2, y2: Integer);
begin
  imgGraph.Canvas.Pen.Style := psSolid;
  imgGraph.Canvas.MoveTo(x1,y1);
  imgGraph.Canvas.LineTo(x2,y2);
end;

procedure TRadarCoverage.drawPoint(const x, y, brush: Integer);
begin
  imgGraph.Canvas.Pen.Style := psSolid;
  imgGraph.Canvas.Brush.Style := bsClear;
  if brush = 1 then
  begin
    imgGraph.Canvas.Brush.Color := clBlack;
    lblRatioSelect.Caption := FormatFloat('0.00',((x - xPoint) / xRatio * 100));
    lblProbSelect.Caption  := FormatFloat('0.00',(((y0 - y) * 50000) / yRatio));
//    lblRatioSelect.Caption       := FormatFloat('0.00',((x - xPoint) / xRatio));
//    if y > y0 then
//      lblProbSelect.Caption        := FormatFloat('0.00',(((y0 - y) * MaxProb) / yLength))
//    else
//      lblProbSelect.Caption        := FormatFloat('0.00',(((y0 + y) * MaxProb) / yLength));
  end;
  imgGraph.Canvas.Ellipse(x-3,y-3,x+3,y+3);
end;

procedure TRadarCoverage.edtProbMinClick(Sender: TObject);
begin
  edit  := true;
  captureMinMax;
  drawData;
end;

procedure TRadarCoverage.edtProbMinKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtProbMinClick(Sender);
end;

procedure TRadarCoverage.captureMinMax;
begin
  MinRatio  := Trunc(StrToFloat(edtRatioMin.Text));
  MinProb   := Trunc(StrToFloat(edtProbMin.Text));
  MaxRatio  := Ceil(StrToFloat(edtRatioMax.Text));
  MaxProb   := Ceil(StrToFloat(edtProbMax.Text));

  while MinProb mod 50000 <> 0 do Dec(MinProb);
  while MaxProb mod 50000 <> 0 do Inc(MaxProb);

  if MinRatio > xMin      then MinRatio := Trunc(xMin);
  if MinProb  > yMin      then MinProb  := Ceil(yMin);
  if MinRatio < 0         then MinRatio := 0;
  if MinProb  < -300000   then MinProb  := -300000;
  if MaxRatio < xMax      then MaxRatio := Ceil(xMax);
  if MaxProb  < yMax      then MaxProb  := Ceil(yMax);
  if MaxProb  > 300000    then MaxProb  := 300000;

  while MinProb mod 50000 <> 0 do Dec(MinProb);
  while MaxProb mod 50000 <> 0 do Inc(MaxProb);

  edtRatioMin.Text  := FormatFloat('0', MinRatio);
  edtRatioMax.Text  := FormatFloat('0', MaxRatio);

  edtProbMin.Text   := FormatFloat('0', MinProb);
  edtProbMax.Text   := FormatFloat('0', MaxProb);
end;

procedure TRadarCoverage.FormCreate(Sender: TObject);
begin
  uList := TList.Create;
  mList := TList.Create;
  edit  := false;
end;

procedure TRadarCoverage.FormShow(Sender: TObject);
begin
  getdata;
  drawData;
end;

procedure TRadarCoverage.refreshPoint;
var
  I: Integer;
begin
  clearAll;
  imgGraph.Canvas.Pen.Color := clBlack;
  drawGrid;

  for I := 0 to uList.Count - 1 do begin
    if pressed and (xIndex = TRadar_Vertical(uList[I]).X) and
     ((yIndex = TRadar_Vertical(uList[I]).Ymax) or (yIndex = TRadar_Vertical(uList[I]).Ymin)) then
    begin
      drawPoint(TRadar_Vertical(uList[I]).X,TRadar_Vertical(uList[I]).Ymax,1);
      drawPoint(TRadar_Vertical(uList[I]).X,TRadar_Vertical(uList[I]).Ymin,1);
      index := I;
    end
    else begin
      drawPoint(TRadar_Vertical(uList[I]).X,TRadar_Vertical(uList[I]).Ymax,0);
      drawPoint(TRadar_Vertical(uList[I]).X,TRadar_Vertical(uList[I]).Ymin,0);
    end;

    if I <> uList.Count - 1 then
    begin
      drawLine(TRadar_Vertical(uList[I]).X,TRadar_Vertical(uList[I]).Ymax,
      TRadar_Vertical(uList[I+1]).X,TRadar_Vertical(uList[I+1]).Ymax);
      drawLine(TRadar_Vertical(uList[I]).X,TRadar_Vertical(uList[I]).Ymin,
      TRadar_Vertical(uList[I+1]).X,TRadar_Vertical(uList[I+1]).Ymin);
    end;
  end;
end;

procedure TRadarCoverage.saveData;
var
  I: Integer;
  RPoint  : TRadar_Vertical;
begin
  {belumtak benerin kodingnya}
//  dmTTT.DeleteRadar_Vertical_Coverage(IntToStr(frmSummaryRadar.radarobject.FDef.Radar_Index),IntToStr(show_index));
  for I := 0 to uList.Count - 1 do begin
    RPoint  := uList[I];
    with RPoint do begin
      FRadar_Coverage.Vert_Coverage_Range := (X - xPoint) / xRatio * 100;
      FRadar_Coverage.Vert_Cover_Max_Elevation := ((y0 - Ymax) * 50000) / yRatio;
      FRadar_Coverage.Vert_Cover_Min_Elevation := ((y0 - Ymin) * 50000) / yRatio;
//      FRadar_Coverage.Radar_Index  := frmSummaryRadar.radarobject.FDef.Radar_Index;
      case show_index of
        Byte(Cover1) : FRadar_Coverage.Coverage_Diagram := 1;
        Byte(Cover2) : FRadar_Coverage.Coverage_Diagram := 2;
      end;
      dmTTT.insertRadar_Vertical_Coverage(RPoint);
    end;
  end;
end;
end.
