unit uProbabilityGraph;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uDBAssetObject, ImgList, ToolWin,
  Buttons, newClassASTT, System.ImageList;
const
  Gun_Air = 1;
  Gun_LandSurface = 2;
  SNR_vs_POD = 3;
  Mine_POD = 4;
  Bomb_POH_vs_Range = 5;
  Sonar = 6;
  Torpedo_POH_Modifier = 8;
type
  TProbabilityGraph = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    tlb1: TToolBar;
    btnDelete: TToolButton;
    il1: TImageList;
    btnMove: TToolButton;
    btnAdd: TToolButton;
    btn4: TToolButton;
    grp1: TGroupBox;
    lb1: TLabel;
    lb2: TLabel;
    lbRatioCursor: TLabel;
    lbProbCursor: TLabel;
    grp2: TGroupBox;
    lb5: TLabel;
    lb6: TLabel;
    lbRatioSelect: TLabel;
    lbProbSelect: TLabel;
    grp3: TGroupBox;
    lb3: TLabel;
    lb4: TLabel;
    lb7: TLabel;
    lb8: TLabel;
    edtRatioMin: TEdit;
    edtRatioMax: TEdit;
    grp4: TGroupBox;
    lb9: TLabel;
    lb10: TLabel;
    lb11: TLabel;
    lb12: TLabel;
    edtProbMin: TEdit;
    edtProbMax: TEdit;
    imgGraph: TImage;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    btnScreenCapture: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure imgGraphMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgGraphMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgGraphMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    function compareList(Item1 : Pointer; Item2 : Pointer) : Integer;
    function compareList_Gun(Item1 : Pointer; Item2 : Pointer) : Integer;
    function compareList_Mine(Item1 : Pointer; Item2 : Pointer) : Integer;
    function compareList_Bomb(Item1 : Pointer; Item2 : Pointer) : Integer;
    procedure edtRatioMinClick(Sender: TObject);
    procedure btnScreenCaptureClick(Sender: TObject);
    procedure edtRatioMinKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    resource_all : TResource_Allocation;
  public
    { Public declarations }
    stateDrawing : boolean;
    stateMove : boolean;
    stateDelete : boolean;
    uList,mList : Tlist;
    MinRatio, MaxRatio, MinProb, MaxProb : Integer;
    xMax,xMin,yMax,yMin, xRatio, yRatio : Double;
    xPoint, yPoint , xLength, yLength : Integer;
    pressed,moved,adding,edit : boolean;
    index, xIndex, yIndex : Integer;
    show_index : byte;
    procedure getData;
    procedure drawData;
    procedure drawGrid;
    procedure getPoint;
    procedure getPoint_Gun;
    procedure getPoint_Mine;
    procedure refreshPoint;
    procedure saveData;
    procedure clearAll;
    procedure closing;
    procedure captureMinMax;
    procedure drawPoint(const x,y,brush:Integer);
    procedure drawLine(const x1,y1,x2,y2:Integer);
    procedure ScreenShot(DestBitmap : TBitmap) ;
    procedure getPoint_Bomb;
    procedure getPoint_radar;
    procedure getPoint_torpedo;

  end;

var
  fProbabilityGraph: TProbabilityGraph;
  xx: double;
  yy: double;
  rectTemp: TRect;
  b,TmpBmp:TBitmap;
  MouseIsDown,isCapturingScreen : boolean;

implementation

{$R *.dfm}
uses
  uDataModuleTTT, ufrmSummarySNRvsPOD, ufrmSummaryGun, uDBAsset_Weapon, math, ufrmSummaryMine,
  ufrmSummaryBomb, drawRec, uScrCapture, ufCaptureRes, ufrmSummarySonar, ufrmSummaryTorpedo;

procedure TProbabilityGraph.btnDeleteClick(Sender: TObject);
begin
  if show_index <> Torpedo_POH_Modifier then
  begin
    if index <> -1 then
    begin
      uList.Delete(index);
      refreshPoint;
    end;
  end;
end;

procedure TProbabilityGraph.btnMoveClick(Sender: TObject);
begin
  moved   := not moved;
  adding  := not moved;
  btnMove.Down := moved;
  if moved then
    btnAdd.Down  := not moved;
end;

procedure TProbabilityGraph.btnAddClick(Sender: TObject);
begin
  if show_index = Torpedo_POH_Modifier then
  begin
    adding  := False;
    moved   := False;
    btnAdd.Down := adding;
  end
  else
  begin
    adding  := not adding;
    moved   := not adding;
    btnAdd.Down := adding;
    if adding then
      btnMove.Down := not adding;
  end;
end;

procedure TProbabilityGraph.btnApplyClick(Sender: TObject);
begin
  saveData;
end;

procedure TProbabilityGraph.btnCancelClick(Sender: TObject);
begin
  closing;
end;

procedure TProbabilityGraph.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  closing;
end;

procedure TProbabilityGraph.btnScreenCaptureClick(Sender: TObject);
begin
    fCaptureRes.imgCaptureResult.Picture.Assign(imgGraph.Picture);
    fCaptureRes.Height := imgGraph.Height + 100;
    fCaptureRes.Width := imgGraph.Width;
    fCaptureRes.Show;
end;

procedure TProbabilityGraph.closing;
begin
  edit    := false;
  adding  := false;
  Close;
end;

procedure TProbabilityGraph.FormCreate(Sender: TObject);
begin
  uList := TList.Create;
  mList := TList.Create;
  edit  := false;
end;

procedure TProbabilityGraph.clearAll;
begin
  imgGraph.Canvas.Pen.Color   := clWhite;
  imgGraph.Canvas.Brush.Color := clwhite;
  imgGraph.Canvas.Rectangle(0,0,imgGraph.width-1,imgGraph.height-1);
end;

procedure TProbabilityGraph.FormShow(Sender: TObject);
begin
  getData;
  drawData;
end;

procedure TProbabilityGraph.drawData;
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
      MinRatio  := 0;
      MinProb   := 0;

      if show_index = Torpedo_POH_Modifier then MaxRatio  := 3
      else MaxRatio  := 10;

      MaxProb   := 100;

      if show_index = Torpedo_POH_Modifier then edtRatioMin.Text  := '0'
      else edtRatioMin.Text  := '0.00';

      if show_index = Mine_POD then edtRatioMax.Text  := '1.00'
      else if show_index = Torpedo_POH_Modifier then edtRatioMax.Text  := '3'
      else edtRatioMax.Text  := '10.00';

      edtProbMin.Text   := '0.00';
      edtProbMax.Text   := '100.00';
    end
    else begin
      if show_index = Mine_POD then
      begin
        MinRatio  := 0;
        MinProb   := 0;
        MaxRatio  := Ceil(xMax*10);
        MaxProb   := Ceil(yMax*100);
        while MaxProb mod 10 <> 0 do Inc(MaxProb);
        edtRatioMin.Text  := FormatFloat('0.00', MinRatio);
        edtRatioMax.Text  := FormatFloat('0.00', MaxRatio/10);
        edtProbMin.Text   := FormatFloat('0.00', MinProb);
        edtProbMax.Text   := FormatFloat('0.00', MaxProb);
      end
      else begin
        MinRatio  := 0;
        MinProb   := 0;
        MaxRatio  := Ceil(xMax);
        MaxProb   := Ceil(yMax*100);
        while MaxProb mod 10 <> 0 do Inc(MaxProb);
        if show_index = Torpedo_POH_Modifier then
        begin
          edtRatioMin.Text  := FormatFloat('0', MinRatio);
          edtRatioMax.Text  := FormatFloat('0', MaxRatio);
          edtProbMin.Text   := FormatFloat('0.00', MinProb);
          edtProbMax.Text   := FormatFloat('0.00', MaxProb);
        end
        else begin
          edtRatioMin.Text  := FormatFloat('0.00', MinRatio);
          edtRatioMax.Text  := FormatFloat('0.00', MaxRatio);
          edtProbMin.Text   := FormatFloat('0.00', MinProb);
          edtProbMax.Text   := FormatFloat('0.00', MaxProb);
        end;
      end;
    end;
  end;

  xRatio    := xLength/(MaxRatio-MinRatio);
  yRatio    := (yLength/((MaxProb-MinProb)/10))/10;

  drawGrid;

  case show_index of
    Byte(Gun_Air),Byte(Gun_LandSurface): getPoint_Gun;
    Byte(SNR_vs_POD), Byte(Sonar): getPoint;
    Byte(Mine_POD): getPoint_Mine;
    Byte(Bomb_POH_vs_Range): getPoint_Bomb;
    Byte(Torpedo_POH_Modifier): getPoint_torpedo;
  end;

end;

procedure TProbabilityGraph.getData;
var T_Rec : TTorpedo_On_Board;
  I: Integer;
begin
  uList.Clear;

  case show_index of
    Byte(Gun_Air):
      begin
//        Caption := 'Air Target Range vs. Probability of Hit Curve for ' +
//                  frmSummaryGun.gun.FData.Gun_Identifier;
//        dmTTT.getAllGun_POH_vs_Range(frmSummaryGun.gun.FData.Gun_Index,1,uList,xMin,yMax,yMin);
//        if uList.Count > 0 then
//          xMax  := TGun_Definition(uList[uList.Count-1]).FGun_POH.Range;
//        imgGraph.Canvas.TextOut(40,20,'Probability of Hit (%)');
//        imgGraph.Canvas.TextOut(280,480,'Range (nm)');
      end;
    Byte(Gun_LandSurface):
      begin
//        Caption := 'Surface/Land Target Range vs. Probability of Hit Curve for ' +
//                  frmSummaryGun.gun.FData.Gun_Identifier;
//        dmTTT.getAllGun_POH_vs_Range(frmSummaryGun.gun.FData.Gun_Index,2,uList,xMin,yMax,yMin);
        if uList.Count > 0 then
          xMax  := TGun_Definition(uList[uList.Count-1]).FGun_POH.Range;
        imgGraph.Canvas.TextOut(40,20,'Probability of Hit (%)');
        imgGraph.Canvas.TextOut(280,480,'Range (nm)');
      end;
    Byte(SNR_vs_POD):
      begin
//        Caption := 'Signal-to-Noise Ratio vs. Probability of Detection Curve ' +
//                 frmSummarySnrVsPod.POD.FData.Curve_Definition_Identifier;
//        dmTTT.getAllPOD_vs_SNR_Point(frmSummarySnrVsPod.POD.FData.Curve_Definition_Index,uList,xMin,yMax,yMin);
//        if uList.Count > 0 then
//          xMax  := TPOD_vs_SNR_Point(uList[uList.Count-1]).FData.SNR_Ratio;
//        imgGraph.Canvas.TextOut(40,20,'Probability of Detection (%)');
//        imgGraph.Canvas.TextOut(250,480,'Signal-to-Noise Ratio (dB)');
//        lb7.Caption := 'dB';
//        lb8.Caption := 'dB';
      end;
    Byte(Mine_POD):
      begin
//        Caption := 'Range vs. Probability of Detonation Curve for ' +
//                 frmSummaryMine.mine.FMine_Def.Mine_Identifier;
//        dmTTT.getAllMine_POD_vs_Range(frmSummaryMine.mine.FMine_Def.Mine_Index,uList,xMin,yMax,yMin);
//        if uList.Count > 0 then
//          xMax  := TMine_On_Board(uList[uList.Count-1]).FMine_POD.Range;
//        imgGraph.Canvas.TextOut(40,20,'Probability of Detonation (%)');
//        imgGraph.Canvas.TextOut(280,480,'Range (nm)');
//        lb7.Caption := 'nm';
//        lb8.Caption := 'nm';
      end;
    Byte(Bomb_POH_vs_Range):
      begin
//        Caption := 'Bomb vs. Probability of Hit Curve for ' +
//                frmSummaryBomb.bomb.FData.Bomb_Identifier;
//        dmTTT.getAllBomb_POH_vs_Range(frmSummaryBomb.bomb.FData.Bomb_Index, uList, xMin, yMax, yMin);
//        if uList.Count > 0 then
//           xMax := TBomb_Definition(uList[uList.Count-1]).FBomb_POH.Range;
        imgGraph.Canvas.TextOut(40,20,'Probability of Hit (%)');
        imgGraph.Canvas.TextOut(280,480,'Range (nm)');
        lb7.Caption := 'nm';
        lb8.Caption := 'nm';
      end;
    Byte(Sonar):
      begin
//        Caption := 'Signal-to-Noise Ratio vs. Probability of Detection Curve ' +
//                 frmSummarySnrVsPod.POD.FData.Curve_Definition_Identifier;
//        dmTTT.getAllPOD_vs_SNR_Point(frmSummarySnrVsPod.POD.FData.Curve_Definition_Index,uList,xMin,yMax,yMin);
//        if uList.Count > 0 then
//          xMax  := TPOD_vs_SNR_Point(uList[uList.Count-1]).FData.SNR_Ratio;
//        imgGraph.Canvas.TextOut(40,20,'Probability of Detection (%)');
//        imgGraph.Canvas.TextOut(250,480,'Signal-to-Noise Ratio (dB)');
      end;
//    Byte(Torpedo_POH_Modifier):
//      begin
//        Caption := 'Torpedo vs. Probability of Hit Curve for ' +
////                  frmSummaryTorpedo.torpedo.FDef.Class_Identifier;
////        dmTTT.getAllTorpedo_POH_Modifier(frmSummaryTorpedo.torpedo.FDef.Torpedo_Index,uList,xMin,yMax,yMin);
////          xMax  := 3;
////        if uList.Count = 0 then
////        begin
////          for I := 0 to 3 do
////          begin
////            T_Rec := TTorpedo_On_Board.Create;
////            T_Rec.FTorpedo_POH.Aspect_Angle := I;
////            T_Rec.FTorpedo_POH.POH_Modifier := 0.5;
////            uList.Add(T_Rec);
////          end;
////          xMin := 0;
////          yMax := 1;
////          yMin := 0.5;
////        end;
////        imgGraph.Canvas.TextOut(40,20,'Probability of Hit (%)');
////        imgGraph.Canvas.TextOut(280,480,'Aspect Angle');
//      end;
  end;
end;

procedure TProbabilityGraph.drawGrid;
var w_save,w,h_save,h,x,y : Integer;
begin
  x := MinRatio;
  Inc(x);
  y := MinProb;
  y := y + 10;

  w_save  := xPoint;
  w := xPoint + Round(xRatio);
  while x <= MaxRatio do begin
    Inc(x);
    w_save  := w;
    w := w + Round(xRatio);
  end;

  h_save  := yPoint+yLength;
  h := yPoint+yLength - Round(yRatio*10);
  while y <= MaxProb do begin
    y := y + 10;
    h_save  := h;
    h := h - Round(yRatio*10);
  end;

  // update xy
  xLength := w_save - xPoint;
  xRatio  := xLength/(MaxRatio-MinRatio);
  yLength := (yLength+yPoint) - h_save;
  yRatio  := (yLength/((MaxProb-MinProb)/10))/10;

  x := MinRatio;
  Inc(x);
  y := MinProb;
  y := y + 10;

  // vertical
  w_save  := xPoint;
  w := xPoint + Round(xRatio);
  while x <= MaxRatio do begin
    imgGraph.Canvas.Pen.Color := clGray;
    imgGraph.Canvas.Pen.Style := psDot;
    imgGraph.Canvas.MoveTo(w,yPoint);
    imgGraph.Canvas.LineTo(w,yPoint+yLength);
    //--------------------------------------------------------------------
    imgGraph.Canvas.Pen.Color := clBlack;
    imgGraph.Canvas.Pen.Style := psSolid;
    imgGraph.Canvas.MoveTo(Round(w_save+(xRatio/2)),yPoint+yLength);
    imgGraph.Canvas.LineTo(Round(w_save+(xRatio/2)),yPoint+yLength+5);
    imgGraph.Canvas.MoveTo(w,yPoint+yLength);
    imgGraph.Canvas.LineTo(w,yPoint+yLength+5);
    if show_index = Mine_POD then
      imgGraph.Canvas.TextOut(w-6,yPoint+yLength+8,FormatFloat('0.0',x/10))
    else imgGraph.Canvas.TextOut(w-2,yPoint+yLength+8,IntToStr(x));
    Inc(x);
    //----------------------------------------------------------------------
    w_save  := w;
    w := w + Round(xRatio);
  end;

  //horizontal
  h_save  := yPoint+yLength;
  h := yPoint+yLength - Round(yRatio*10);
  while y <= MaxProb do begin
    imgGraph.Canvas.Pen.Color := clGray;
    imgGraph.Canvas.Pen.Style := psDot;
    imgGraph.Canvas.MoveTo(xPoint,h);
    imgGraph.Canvas.LineTo(xPoint+xLength,h);
    //----------------------------------------------------------------------
    imgGraph.Canvas.Pen.Color := clBlack;
    imgGraph.Canvas.Pen.Style := psSolid;
    imgGraph.Canvas.MoveTo(xPoint,Round(h_save-((yRatio*10)/2)));
    imgGraph.Canvas.LineTo(xPoint-5,Round(h_save-((yRatio*10)/2)));
    imgGraph.Canvas.MoveTo(xPoint,h);
    imgGraph.Canvas.LineTo(xPoint-5,h);
    imgGraph.Canvas.TextOut(xPoint-22,h-4,IntToStr(y));
    y := y + 10;
    //----------------------------------------------------------------------
    h_save  := h;
    h := h - Round(yRatio*10);
  end;

  x := MinRatio;
  y := MinProb;

  // first line
  imgGraph.Canvas.Pen.Color := clBlack;
  imgGraph.Canvas.Pen.Style := psSolid;
  imgGraph.Canvas.MoveTo(xPoint,yPoint);
  imgGraph.Canvas.LineTo(xPoint,yPoint+yLength);
  imgGraph.Canvas.MoveTo(xPoint,yPoint+yLength);
  imgGraph.Canvas.LineTo(xPoint,yPoint+yLength+5);
  if show_index = Mine_POD then
    imgGraph.Canvas.TextOut(xPoint-6,yPoint+yLength+8,FormatFloat('0.0',x))
  else imgGraph.Canvas.TextOut(xPoint-2,yPoint+yLength+8,IntToStr(x));
  imgGraph.Canvas.MoveTo(xPoint,yPoint+yLength);
  imgGraph.Canvas.LineTo(xPoint+xLength,yPoint+yLength);
  imgGraph.Canvas.MoveTo(xPoint,yPoint+yLength);
  imgGraph.Canvas.LineTo(xPoint-5,yPoint+yLength);
  imgGraph.Canvas.TextOut(xPoint-22,yPoint+yLength-4,IntToStr(y));

  imgGraph.Canvas.Pen.Color := clBlack;
end;

procedure TProbabilityGraph.getPoint;
var
  I,x1,y1,x2,y2: Integer;
  lPoint : TPOD_vs_SNR_Point;
begin
  for I := 0 to uList.Count - 1 do begin
    x1 := Round((TPOD_vs_SNR_Point(uList[I]).FData.SNR_Ratio * xRatio) - (MinRatio*xRatio)) + xPoint;
    y1 := (yPoint + yLength) - Round((TPOD_vs_SNR_Point(uList[I]).FData.Prob_of_Detection * 100) * yRatio);

    lPoint := uList[I];
    lPoint.X := x1;
    lPoint.Y := y1;

    drawPoint(x1,y1,0);
    if I <> uList.Count - 1 then
    begin
      x2 := Round((TPOD_vs_SNR_Point(uList[I+1]).FData.SNR_Ratio * xRatio) - (MinRatio*xRatio)) + xPoint;
      y2 := (yPoint + yLength) - Round((TPOD_vs_SNR_Point(uList[I+1]).FData.Prob_of_Detection * 100) * yRatio);
      drawLine(x1,y1,x2,y2);
    end;
  end;
end;

procedure TProbabilityGraph.getPoint_radar;
var
  I,x1,y1,x2,y2: Integer;
  lPoint : TPOD_vs_SNR_Point;
begin
  for I := 0 to uList.Count - 1 do begin
    x1 := Round((TPOD_vs_SNR_Point(uList[I]).FData.SNR_Ratio * xRatio) - (MinRatio*xRatio)) + xPoint;
    y1 := (yPoint + yLength) - Round((TPOD_vs_SNR_Point(uList[I]).FData.Prob_of_Detection * 100) * yRatio);

    lPoint := uList[I];
    lPoint.X := x1;
    lPoint.Y := y1;

    drawPoint(x1,y1,0);
    if I <> uList.Count - 1 then
    begin
      x2 := Round((TPOD_vs_SNR_Point(uList[I+1]).FData.SNR_Ratio * xRatio) - (MinRatio*xRatio)) + xPoint;
      y2 := (yPoint + yLength) - Round((TPOD_vs_SNR_Point(uList[I+1]).FData.Prob_of_Detection * 100) * yRatio);
      drawLine(x1,y1,x2,y2);
    end;
  end;
end;

procedure TProbabilityGraph.getPoint_torpedo;
var
  I,x1,y1,x2,y2: Integer;
  lPoint : TTorpedo_On_Board;
begin
  for I := 0 to uList.Count - 1 do begin
    x1 := Round((TTorpedo_On_Board(uList[I]).FTorpedo_POH.Aspect_Angle * xRatio) - (MinRatio*xRatio)) + xPoint;
    y1 := (yPoint + yLength) - Round((TTorpedo_On_Board(uList[I]).FTorpedo_POH.POH_Modifier * 100) * yRatio);

    lPoint := uList[I];
    lPoint.X := x1;
    lPoint.Y := y1;

    drawPoint(x1,y1,0);
    if I <> uList.Count - 1 then
    begin
      x2 := Round((TTorpedo_On_Board(uList[I+1]).FTorpedo_POH.Aspect_Angle * xRatio) - (MinRatio*xRatio)) + xPoint;
      y2 := (yPoint + yLength) - Round((TTorpedo_On_Board(uList[I+1]).FTorpedo_POH.POH_Modifier * 100) * yRatio);
      drawLine(x1,y1,x2,y2);
    end;
  end;
end;

procedure TProbabilityGraph.getPoint_Gun;
var
  I,x1,y1,x2,y2: Integer;
  lPoint : TGun_Definition;
begin
  for I := 0 to uList.Count - 1 do begin
    x1 := Round((TGun_Definition(uList[I]).FGun_POH.Range * xRatio) - (MinRatio*xRatio)) + xPoint;
    y1 := (yPoint + yLength) - Round((TGun_Definition(uList[I]).FGun_POH.Prob_of_Hit * 100) * yRatio);

    lPoint := uList[I];
    lPoint.X := x1;
    lPoint.Y := y1;

    drawPoint(x1,y1,0);
    if I <> uList.Count - 1 then
    begin
      x2 := Round((TGun_Definition(uList[I+1]).FGun_POH.Range * xRatio) - (MinRatio*xRatio)) + xPoint;
      y2 := (yPoint + yLength) - Round((TGun_Definition(uList[I+1]).FGun_POH.Prob_of_Hit * 100) * yRatio);
      drawLine(x1,y1,x2,y2);
    end;
  end;
end;

procedure TProbabilityGraph.getPoint_Mine;
var
  I,x1,y1,x2,y2: Integer;
  lPoint : TMine_On_Board;
begin
  for I := 0 to uList.Count - 1 do begin
    x1 := Round((TMine_On_Board(uList[I]).FMine_POD.Range * xRatio) - (MinRatio*xRatio))*10 + xPoint;
    y1 := (yPoint + yLength) - Round((TMine_On_Board(uList[I]).FMine_POD.Prob_of_Detonation * 100) * yRatio);

    lPoint := uList[I];
    lPoint.X := x1;
    lPoint.Y := y1;

    drawPoint(x1,y1,0);
    if I <> uList.Count - 1 then
    begin
      x2 := Round((TMine_On_Board(uList[I+1]).FMine_POD.Range * xRatio) - (MinRatio*xRatio))*10 + xPoint;
      y2 := (yPoint + yLength) - Round((TMine_On_Board(uList[I+1]).FMine_POD.Prob_of_Detonation * 100) * yRatio);
      drawLine(x1,y1,x2,y2);
    end;
  end;
end;

procedure TProbabilityGraph.getPoint_Bomb;
var
  I,x1,y1,x2,y2: Integer;
  lPoint : TBomb_Definition;
begin
  for I := 0 to uList.Count - 1 do begin
    x1 := Round((TBomb_Definition(uList[I]).FBomb_POH.Range * xRatio) - (MinRatio*xRatio)) + xPoint;
    y1 := (yPoint + yLength) - Round((TBomb_Definition(uList[I]).FBomb_POH.Prob_of_Hit * 100) * yRatio);

    lPoint := uList[I];
    lPoint.X := x1;
    lPoint.Y := y1;

    drawPoint(x1,y1,0);
    if I <> uList.Count - 1 then
    begin
      x2 := Round((TBomb_Definition(uList[I+1]).FBomb_POH.Range * xRatio) - (MinRatio*xRatio)) + xPoint;
      y2 := (yPoint + yLength) - Round((TBomb_Definition(uList[I+1]).FBomb_POH.Prob_of_Hit * 100) * yRatio);
      drawLine(x1,y1,x2,y2);
    end;
  end;
end;


procedure TProbabilityGraph.refreshPoint;
var
  I: Integer;
begin
  clearAll;
  imgGraph.Canvas.Pen.Color := clBlack;

  case show_index of
    Byte(Gun_Air):
      begin
        imgGraph.Canvas.TextOut(40,20,'Probability of Hit (%)');
        imgGraph.Canvas.TextOut(280,480,'Range (nm)');
      end;
    Byte(Gun_LandSurface):
      begin
        imgGraph.Canvas.TextOut(40,20,'Probability of Hit (%)');
        imgGraph.Canvas.TextOut(280,480,'Range (nm)');
      end;
    Byte(SNR_vs_POD):
      begin
        imgGraph.Canvas.TextOut(40,20,'Probability of Detection (%)');
        imgGraph.Canvas.TextOut(250,480,'Signal-to-Noise Ratio (dB)');
      end;
    Byte(Mine_POD):
      begin
        imgGraph.Canvas.TextOut(40,20,'Probability of Detonation (%)');
        imgGraph.Canvas.TextOut(280,480,'Range (nm)');
      end;
    Byte(Bomb_POH_vs_Range):
      begin
        imgGraph.Canvas.TextOut(40,20,'Probability of Hit (%)');
        imgGraph.Canvas.TextOut(280,480,'Range (nm)');
      end;
    Byte(Sonar):
      begin
        imgGraph.Canvas.TextOut(40,20,'Probability of Detection (%)');
        imgGraph.Canvas.TextOut(250,480,'Signal-to-Noise Ratio (dB)');
      end;
    Byte(Torpedo_POH_Modifier):
      begin
        imgGraph.Canvas.TextOut(40,20,'Probability of Hit (%)');
        imgGraph.Canvas.TextOut(280,480,'Aspect Range');
      end;
  end;

  drawGrid;

  for I := 0 to uList.Count - 1 do begin
    case show_index of
      Byte(Gun_Air),Byte(Gun_LandSurface):
        begin
          if pressed and (xIndex = TGun_Definition(uList[I]).X) and (yIndex = TGun_Definition(uList[I]).Y) then
          begin
            drawPoint(TGun_Definition(uList[I]).X,TGun_Definition(uList[I]).Y,1);
            index := I;
          end
          else drawPoint(TGun_Definition(uList[I]).X,TGun_Definition(uList[I]).Y,0);
          if I <> uList.Count - 1 then
          begin
            drawLine(TGun_Definition(uList[I]).X,TGun_Definition(uList[I]).Y,
            TGun_Definition(uList[I+1]).X,TGun_Definition(uList[I+1]).Y);
          end;
        end;
      Byte(SNR_vs_POD), Byte(Sonar):
        begin
          if pressed and (xIndex = TPOD_vs_SNR_Point(uList[I]).X) and (yIndex = TPOD_vs_SNR_Point(uList[I]).Y) then
          begin
            drawPoint(TPOD_vs_SNR_Point(uList[I]).X,TPOD_vs_SNR_Point(uList[I]).Y,1);
            index := I;
          end
          else drawPoint(TPOD_vs_SNR_Point(uList[I]).X,TPOD_vs_SNR_Point(uList[I]).Y,0);
          if I <> uList.Count - 1 then
          begin
            drawLine(TPOD_vs_SNR_Point(uList[I]).X,TPOD_vs_SNR_Point(uList[I]).Y,
            TPOD_vs_SNR_Point(uList[I+1]).X,TPOD_vs_SNR_Point(uList[I+1]).Y);
          end;
        end;
      Byte(Mine_POD):
        begin
          if pressed and (xIndex = TMine_On_Board(uList[I]).X) and (yIndex = TMine_On_Board(uList[I]).Y) then
          begin
            drawPoint(TMine_On_Board(uList[I]).X,TMine_On_Board(uList[I]).Y,1);
            index := I;
          end
          else drawPoint(TMine_On_Board(uList[I]).X,TMine_On_Board(uList[I]).Y,0);
          if I <> uList.Count - 1 then
          begin
            drawLine(TMine_On_Board(uList[I]).X,TMine_On_Board(uList[I]).Y,
            TMine_On_Board(uList[I+1]).X,TMine_On_Board(uList[I+1]).Y);
          end;
        end;
      Byte(Bomb_POH_vs_Range):
        begin
          if pressed and (xIndex = TBomb_Definition(uList[I]).X) and (yIndex = TBomb_Definition(uList[I]).Y) then
          begin
            drawPoint(TBomb_Definition(uList[I]).X,TBomb_Definition(uList[I]).Y,1);
            index := I;
          end
          else drawPoint(TBomb_Definition(uList[I]).X,TBomb_Definition(uList[I]).Y,0);
          if I <> uList.Count - 1 then
          begin
            drawLine(TBomb_Definition(uList[I]).X,TBomb_Definition(uList[I]).Y,
            TBomb_Definition(uList[I+1]).X,TBomb_Definition(uList[I+1]).Y);
          end;
        end;
      Byte(Torpedo_POH_Modifier):
        begin
          if pressed and (xIndex = TTorpedo_On_Board(uList[I]).X) and (yIndex = TTorpedo_On_Board(uList[I]).Y) then
          begin
            drawPoint(TTorpedo_On_Board(uList[I]).X,TTorpedo_On_Board(uList[I]).Y,1);
            index := I;
          end
          else drawPoint(TTorpedo_On_Board(uList[I]).X,TTorpedo_On_Board(uList[I]).Y,0);
          if I <> uList.Count - 1 then
          begin
            drawLine(TTorpedo_On_Board(uList[I]).X,TTorpedo_On_Board(uList[I]).Y,
            TTorpedo_On_Board(uList[I+1]).X,TTorpedo_On_Board(uList[I+1]).Y);
          end;
        end;
    end;
  end;
end;

procedure TProbabilityGraph.saveData;
var
  I: Integer;
  sPoint  : TPOD_vs_SNR_Point;
  gPoint  : TGun_Definition;
  mPoint  : TMine_On_Board;
  bPoint  : TBomb_Definition;
  tPoint  : TTorpedo_On_Board;
begin
  case show_index of
    Byte(Gun_Air),Byte(Gun_LandSurface):
      begin
//        dmTTT.DeleteGun_POH_vs_Range(IntToStr(frmSummaryGun.gun.FData.Gun_Index),IntToStr(show_index));
        for I := 0 to uList.Count - 1 do begin
          gPoint  := uList[I];
          with gPoint do begin
            FGun_POH.Range := (X - xPoint) / xRatio;
            FGun_POH.Prob_of_Hit := (((yPoint + yLength - Y) * (MaxProb-MinProb)) / yLength) / 100;
//            FGun_POH.Gun_Index  := frmSummaryGun.gun.FData.Gun_Index;
            case show_index of
              Byte(Gun_Air) : FGun_POH.Target_Type := 1;
              Byte(Gun_LandSurface) : FGun_POH.Target_Type := 2;
            end;
            dmTTT.insertGun_POH_vs_Range(gPoint);
          end;
        end;
      end;
    Byte(SNR_vs_POD),Byte(Sonar):
      begin
//        dmTTT.DeletePOD_vs_SNR_Point(IntToStr(frmSummarySnrVsPod.POD.FData.Curve_Definition_Index));
//        for I := 0 to uList.Count - 1 do begin
//          sPoint  := uList[I];
//          with sPoint do begin
//            FData.SNR_Ratio := (X - xPoint) / xRatio;
//            FData.Prob_of_Detection := (((yPoint + yLength - Y) * (MaxProb-MinProb)) / yLength) / 100;
//            FData.Curve_Definition_Index  := frmSummarySnrVsPod.POD.FData.Curve_Definition_Index;
//            dmTTT.insertPOD_vs_SNR_Point(sPoint);
//          end;
//        end;
      end;
    Byte(Mine_POD):
      begin
//        dmTTT.DeleteMine_POD_vs_Range(IntToStr(frmSummaryMine.mine.FMine_Def.Mine_Index));
        for I := 0 to uList.Count - 1 do begin
          mPoint  := uList[I];
          with mPoint do begin
            FMine_POD.Range := (X - xPoint) / xRatio / 10;
            FMine_POD.Prob_of_Detonation := (((yPoint + yLength - Y) * (MaxProb-MinProb)) / yLength) / 100;
//            FMine_POD.Mine_Index  := frmSummaryMine.mine.FMine_Def.Mine_Index;
            dmTTT.insertMine_POD_vs_Range(mPoint);
          end;
        end;
      end;
    Byte(Bomb_POH_vs_Range):
      begin
//        dmTTT.DeleteBomb_POH_vs_Range(IntToStr(frmSummaryBomb.bomb.FData.Bomb_Index));
          for I := 0 to uList.Count - 1 do begin
          bPoint  := uList[I];
          with bPoint do begin
            FBomb_POH.Range := (X - xPoint) / xRatio;
            FBomb_POH.Prob_of_Hit := (((yPoint + yLength - Y) * (MaxProb-MinProb)) / yLength) / 100;
//            FBomb_POH.Bomb_Index  := frmSummaryGun.gun.FData.Gun_Index;
            dmTTT.insertBomb_POH_vs_Range(bPoint);
          end;
        end;
      end;
    Byte(Torpedo_POH_Modifier):
      begin
//        dmTTT.DeleteTorpedo_POH_Modifier(IntToStr(frmSummaryTorpedo.torpedo.FDef.Torpedo_Index));
        for I := 0 to uList.Count - 1 do begin
          tPoint  := uList[I];
          with tPoint do begin
            FTorpedo_POH.Aspect_Angle := Round((X - xPoint) / xRatio);
            FTorpedo_POH.POH_Modifier := (((yPoint + yLength - Y) * (MaxProb-MinProb)) / yLength) / 100;
//            FTorpedo_POH.Torpedo_Index  := frmSummaryTorpedo.torpedo.FDef.Torpedo_Index;
            dmTTT.insertTorpedo_POH_Modifier(tPoint);
          end;
        end;
      end;
  end;
end;

procedure TProbabilityGraph.ScreenShot(DestBitmap: TBitmap);
 var
   DC : HDC;
 begin
   DC := GetDC (GetDesktopWindow) ;
   try
    DestBitmap.Width := GetDeviceCaps (DC, HORZRES) ;
    DestBitmap.Height := GetDeviceCaps (DC, VERTRES) ;
    BitBlt(DestBitmap.Canvas.Handle, 0, 0, DestBitmap.Width, DestBitmap.Height, DC, 0, 0, SRCCOPY) ;
   finally
    ReleaseDC (GetDesktopWindow, DC) ;
   end;
 end;

procedure TProbabilityGraph.imgGraphMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  I: Integer;
  aPoint   : TPOD_vs_SNR_Point;
  gunPoint : TGun_Definition;
  minePoint: TMine_On_Board;
  bombPoint: TBomb_Definition;
begin
  if  (X < xPoint+xLength+5) and (Y < yPoint+yLength+5) and
      (X > xPoint-5) and (Y > yPoint-5) then
  begin
    if btnAdd.Down then
    begin
      case show_index of
        Byte(Gun_Air),Byte(Gun_LandSurface):
          begin
            gunPoint  := TGun_Definition.Create;
            gunPoint.X  := X;
            gunPoint.Y  := Y;
            uList.Add(gunPoint);
            uList.SortList(compareList_Gun);
          end;
        Byte(SNR_vs_POD),Byte(Sonar):
          begin
            aPoint  := TPOD_vs_SNR_Point.Create;
            aPoint.X  := X;
            aPoint.Y  := Y;
            uList.Add(aPoint);
            uList.SortList(compareList);
          end;
        Byte(Mine_POD):
          begin
            minePoint  := TMine_On_Board.Create;
            minePoint.X  := X;
            minePoint.Y  := Y;
            uList.Add(minePoint);
            uList.SortList(compareList_Mine);
          end;
        Byte(Bomb_POH_vs_Range):
          begin
            bombPoint  := TBomb_Definition.Create;
            bombPoint.X  := X;
            bombPoint.Y  := Y;
            uList.Add(bombPoint);
            uList.SortList(compareList_Bomb);
          end;
      end;
    end;
    refreshPoint;
    for I := 0 to uList.Count - 1 do begin
      case show_index of
        Byte(Gun_Air),Byte(Gun_LandSurface):
          begin
            if  (X < TGun_Definition(uList[I]).X + 5) and
                (Y < TGun_Definition(uList[I]).Y + 5) and
                (X > TGun_Definition(uList[I]).X - 5) and
                (Y > TGun_Definition(uList[I]).Y - 5) then
            begin
              drawPoint(TGun_Definition(uList[I]).X,TGun_Definition(uList[I]).Y,1);
              pressed := true;
              index   := I;
              xIndex  := TGun_Definition(uList[I]).X;
              yIndex  := TGun_Definition(uList[I]).Y;
            end;
          end;
        Byte(SNR_vs_POD),Byte(Sonar):
          begin
            if  (X < TPOD_vs_SNR_Point(uList[I]).X + 5) and
                (Y < TPOD_vs_SNR_Point(uList[I]).Y + 5) and
                (X > TPOD_vs_SNR_Point(uList[I]).X - 5) and
                (Y > TPOD_vs_SNR_Point(uList[I]).Y - 5) then
            begin
              drawPoint(TPOD_vs_SNR_Point(uList[I]).X,TPOD_vs_SNR_Point(uList[I]).Y,1);
              pressed := true;
              index   := I;
              xIndex  := TPOD_vs_SNR_Point(uList[I]).X;
              yIndex  := TPOD_vs_SNR_Point(uList[I]).Y;
            end;
          end;
        Byte(Mine_POD):
          begin
            if  (X < TMine_On_Board(uList[I]).X + 5) and
                (Y < TMine_On_Board(uList[I]).Y + 5) and
                (X > TMine_On_Board(uList[I]).X - 5) and
                (Y > TMine_On_Board(uList[I]).Y - 5) then
            begin
              drawPoint(TMine_On_Board(uList[I]).X,TMine_On_Board(uList[I]).Y,1);
              pressed := true;
              index   := I;
              xIndex  := TMine_On_Board(uList[I]).X;
              yIndex  := TMine_On_Board(uList[I]).Y;
            end;
          end;
       Byte(Bomb_POH_vs_Range):
          begin
            if
              (X < TBomb_Definition(uList[I]).X + 5) and
              (Y < TBomb_Definition(uList[I]).Y + 5) and
              (X > TBomb_Definition(uList[I]).X - 5) and
              (Y > TBomb_Definition(uList[I]).Y - 5) then
            begin
              drawPoint(TBomb_Definition(uList[I]).X,TBomb_Definition(uList[I]).Y,1);
              pressed := true;
              index   := I;
              xIndex  := TBomb_Definition(uList[I]).X;
              yIndex  := TBomb_Definition(uList[I]).Y;
            end;
          end;
       Byte(Torpedo_POH_Modifier):
          begin
            if
              (X < TTorpedo_On_Board(uList[I]).X + 5) and
              (Y < TTorpedo_On_Board(uList[I]).Y + 5) and
              (X > TTorpedo_On_Board(uList[I]).X - 5) and
              (Y > TTorpedo_On_Board(uList[I]).Y - 5) then
            begin
              drawPoint(TTorpedo_On_Board(uList[I]).X,TTorpedo_On_Board(uList[I]).Y,1);
              pressed := true;
              index   := I;
              xIndex  := TTorpedo_On_Board(uList[I]).X;
              yIndex  := TTorpedo_On_Board(uList[I]).Y;
            end;
          end;
      end;
    end;
  end;
end;

function TProbabilityGraph.compareList_Gun(Item1 : Pointer; Item2 : Pointer) : Integer;
var
  x1, x2 : TGun_Definition;
begin
  x1 := TGun_Definition(Item1);
  x2 := TGun_Definition(Item2);

  if x1.X > x2.X then Result := 1
  else if x1.X = x2.X then Result := 0
  else Result := -1;
end;

function TProbabilityGraph.compareList(Item1 : Pointer; Item2 : Pointer) : Integer;
var
  x1, x2 : TPOD_vs_SNR_Point;
begin
  x1 := TPOD_vs_SNR_Point(Item1);
  x2 := TPOD_vs_SNR_Point(Item2);

  if x1.X > x2.X then Result := 1
  else if x1.X = x2.X then Result := 0
  else Result := -1;
end;

function TProbabilityGraph.compareList_Mine(Item1 : Pointer; Item2 : Pointer) : Integer;
var
  x1, x2 : TMine_On_Board;
begin
  x1 := TMine_On_Board(Item1);
  x2 := TMine_On_Board(Item2);

  if x1.X > x2.X then Result := 1
  else if x1.X = x2.X then Result := 0
  else Result := -1;
end;

function TProbabilityGraph.compareList_Bomb(Item1 : Pointer; Item2 : Pointer) : Integer;
var
  x1, x2 : TBomb_Definition;
begin
  x1 := TBomb_Definition(Item1);
  x2 := TBomb_Definition(Item2);

  if x1.X > x2.X then Result := 1
  else if x1.X = x2.X then Result := 0
  else Result := -1;
end;


procedure TProbabilityGraph.imgGraphMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if  (X < xPoint+xLength+5) and (Y < yPoint+yLength+5) and
      (X > xPoint-5) and (Y > yPoint-5) then
  begin
    if show_index = Mine_POD then
      lbRatioCursor.Caption := FormatFloat('0.00',((x - xPoint) / xRatio / 10))
    else if show_index = Torpedo_POH_Modifier then
      lbRatioCursor.Caption := FormatFloat('0',((x - xPoint) / xRatio))
    else lbRatioCursor.Caption := FormatFloat('0.00',((x - xPoint) / xRatio));
    lbProbCursor.Caption  := FormatFloat('0.00',(((yPoint + yLength - y) * MaxProb) / yLength));
    if pressed and btnMove.Down then
    begin
      case show_index of
        Byte(Gun_Air),Byte(Gun_LandSurface):
          begin
            TGun_Definition(uList[index]).X := X;
            TGun_Definition(uList[index]).Y := Y;
            xIndex  := X;
            yIndex  := Y;
            refreshPoint;
          end;
        Byte(SNR_vs_POD),Byte(Sonar):
          begin
            TPOD_vs_SNR_Point(uList[index]).X := X;
            TPOD_vs_SNR_Point(uList[index]).Y := Y;
            xIndex  := X;
            yIndex  := Y;
            refreshPoint;
          end;
        Byte(Mine_POD):
          begin
            TMine_On_Board(uList[index]).X := X;
            TMine_On_Board(uList[index]).Y := Y;
            xIndex  := X;
            yIndex  := Y;
            refreshPoint;
          end;
        Byte(Bomb_POH_vs_Range):
          begin
            TBomb_Definition(uList[index]).X := X;
            TBomb_Definition(uList[index]).Y := Y;
            xIndex  := X;
            yIndex  := Y;
            refreshPoint;
          end;
        Byte(Torpedo_POH_Modifier):
          begin
            TTorpedo_On_Board(uList[index]).X := TTorpedo_On_Board(uList[index]).X;
            TTorpedo_On_Board(uList[index]).Y := Y;
            xIndex  := xIndex;
            yIndex  := Y;
            refreshPoint;
          end;
      end;
    end;
  end
  else begin
    lbRatioCursor.Caption := '-';
    lbProbCursor.Caption  := '-';
  end;
end;

procedure TProbabilityGraph.imgGraphMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case show_index of
    Byte(Gun_Air),Byte(Gun_LandSurface): uList.SortList(compareList_Gun);
    Byte(SNR_vs_POD),Byte(Sonar): uList.SortList(compareList);
    Byte(Mine_POD): uList.SortList(compareList_Mine);
    Byte(Bomb_POH_vs_Range): uList.SortList(compareList_Bomb);

  end;
  refreshPoint;
  pressed := false;
end;

procedure TProbabilityGraph.drawPoint(const x,y,brush:Integer);
begin
  imgGraph.Canvas.Pen.Style := psSolid;
  imgGraph.Canvas.Brush.Style := bsClear;
  if brush = 1 then
  begin
    imgGraph.Canvas.Brush.Color := clBlack;
    lbRatioSelect.Caption       := FormatFloat('0.00',((x - xPoint) / xRatio));
    lbProbSelect.Caption        := FormatFloat('0.00',(((yPoint + yLength - y) * MaxProb) / yLength));
  end;
  imgGraph.Canvas.Ellipse(x-3,y-3,x+3,y+3);
end;

procedure TProbabilityGraph.edtRatioMinClick(Sender: TObject);
begin
  edit  := true;
  captureMinMax;
  drawData;
end;

procedure TProbabilityGraph.edtRatioMinKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtRatioMinClick(Sender);
end;

procedure TProbabilityGraph.drawLine(const x1,y1,x2,y2:Integer);
begin
  imgGraph.Canvas.Pen.Style := psSolid;
  imgGraph.Canvas.MoveTo(x1,y1);
  imgGraph.Canvas.LineTo(x2,y2);
end;

procedure TProbabilityGraph.captureMinMax;
begin
  if show_index = Torpedo_POH_Modifier then
  begin
    MinRatio  := 0;
    MinProb   := Trunc(StrToFloat(edtProbMin.Text));
    MaxRatio  := 3;
    MaxProb   := Ceil(StrToFloat(edtProbMax.Text));
  end
  else begin
    MinRatio  := Trunc(StrToFloat(edtRatioMin.Text));
    MinProb   := Trunc(StrToFloat(edtProbMin.Text));
    MaxRatio  := Ceil(StrToFloat(edtRatioMax.Text));
    MaxProb   := Ceil(StrToFloat(edtProbMax.Text));
  end;

  while MinProb mod 10 <> 0 do Dec(MinProb);
  while MaxProb mod 10 <> 0 do Inc(MaxProb);

  if MinRatio > xMin      then MinRatio := Trunc(xMin);
  if MinProb  > yMin      then MinProb  := Trunc(yMin);
  if MinRatio < 0         then MinRatio := 0;
  if MinProb  < 0         then MinProb  := 0;
  if MaxRatio < xMax      then MaxRatio := Ceil(xMax);
  if MaxProb  < yMax*100  then MaxProb  := Ceil(yMax*100);
  if MaxProb  > 100       then MaxProb  := 100;

  while MinProb mod 10 <> 0 do Dec(MinProb);
  while MaxProb mod 10 <> 0 do Inc(MaxProb);

  if show_index = Torpedo_POH_Modifier then
  begin
    edtRatioMin.Text  := FormatFloat('0', MinRatio);
    edtRatioMax.Text  := FormatFloat('0', MaxRatio);
  end
  else
  begin
    edtRatioMin.Text  := FormatFloat('0.00', MinRatio);
    edtRatioMax.Text  := FormatFloat('0.00', MaxRatio);
  end;

  edtProbMin.Text   := FormatFloat('0.00', MinProb);
  edtProbMax.Text   := FormatFloat('0.00', MaxProb);
end;

end.
