unit ufrmAcousticDecoyPOHGraphic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Vcl.Imaging.pngimage, Math,
  uScrCapture, ufCaptureRes,
  uDBAsset_Weapon;

type
  TfrmAcousticDecoyPOHGraphic = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    ImgBackgroundForm: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    grp3: TGroupBox;
    lb3: TLabel;
    lb4: TLabel;
    lb7: TLabel;
    lb8: TLabel;
    edtRatioMin: TEdit;
    edtRatioMax: TEdit;
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
    grp4: TGroupBox;
    lb9: TLabel;
    lb10: TLabel;
    lb11: TLabel;
    lb12: TLabel;
    edtProbMin: TEdit;
    edtProbMax: TEdit;
    imgGraph: TImage;
    Panel3: TPanel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure imgGraphMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgGraphMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imgGraphMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);

    procedure btnDeleteClick(Sender: TObject);
//    procedure btnEditClick(Sender: TObject);
//    procedure btnAddClick(Sender: TObject);

    procedure btnScreenCaptureClick(Sender: TObject);

    procedure edtAspectMinKeyPress(Sender: TObject; var Key: Char);
    procedure edtAspectMaxKeyPress(Sender: TObject; var Key: Char);
    procedure edtProbabilityMinKeyPress(Sender: TObject; var Key: Char);
    procedure edtProbabilityMaxKeyPress(Sender: TObject; var Key: Char);

  private
//    FProbabilityGraph : E_ProbabilityGraph;
    FSelectedProbObj : TObject;

    FProbabilityPointList : TList;
    FDeletedProbabilityPointList : TList;
    FSelectedPoint : TObject;

    FAspectMin : Double;
    FAspectMax : Double;
    FProbabilityMin : Double;
    FProbabilityMax : Double;

//    FGrid : TProbabilityGrid;

    FIsMouseDown : Boolean;
    FIsDragPoint : Boolean;

    procedure ConvertPositionToValue(const aX, aY: Integer; var aAspect, aProbability: Double);
    procedure ConvertValueToPosition(const aAspect, aProbability: Double; var aX, aY: Integer);
    function GetPointPosition(const aAspect, aProbability: Double): Integer;

    procedure UpdateProbabilityGraphForm;
    procedure DrawGrid;
    procedure DrawPoint;

  public
//    property ProbabilityGraph : E_ProbabilityGraph read FProbabilityGraph write FProbabilityGraph;
    property SelectedProbObj : TObject read FSelectedProbObj write FSelectedProbObj;
  end;

var
  frmAcousticDecoyPOHGraphic: TfrmAcousticDecoyPOHGraphic;

implementation

uses
  uDataModuleTTT ;

{$R *.dfm}


{$REGION ' Form Handle '}

procedure TfrmAcousticDecoyPOHGraphic.FormCreate(Sender: TObject);
begin
  FProbabilityPointList := TList.Create;
  FDeletedProbabilityPointList := TList.Create;
end;

procedure TfrmAcousticDecoyPOHGraphic.FormShow(Sender: TObject);
var
  i : Integer;
  data : TObject;
begin

  with TMine_On_Board(FSelectedProbObj).FMine_Def do
  begin
    Caption := 'Range vs. Probability of Detonation Curve for ' + Mine_Identifier;
//    lblCPAspect.Caption := 'Range:';
//    lblSPAspect.Caption := 'Range:';
//    grpAspect.Caption := 'Range';
//    lbl1.Caption := 'nm';
//    lbl2.Caption := 'nm';

//    dmTTT.GetMinePODvsRange(Mine_Index, FProbabilityPointList);
  end;

  FDeletedProbabilityPointList.Clear;
  FSelectedPoint := nil;

//  btnSelect.Down := True;

  FAspectMin := 0;
  FAspectMax := 0;
  FProbabilityMin := 0;
  FProbabilityMax := 0;

  for i := 0 to FProbabilityPointList.Count - 1 do
  begin
    data := FProbabilityPointList.Items[i];

//    case FProbabilityGraph of
//      pgMine:
//      begin
//        with TMine_On_Board(data).FMine_POD do
//        begin
//          if Range < FAspectMin then
//            FAspectMin := Range
//          else if Range > FAspectMax then
//            FAspectMax := Range;
//
//          if (Prob_of_Detonation * 100) < FProbabilityMin then
//            FProbabilityMin := (Prob_of_Detonation * 100)
//          else if (Prob_of_Detonation * 100) > FProbabilityMax then
//            FProbabilityMax := (Prob_of_Detonation * 100);
//        end;
//      end;
//      pgGunAir, pgGunSurfaceLand:
//      begin
//        with TGun_Definition(data).FGun_POH do
//        begin
//          if Range < FAspectMin then
//            FAspectMin := Range
//          else if Range > FAspectMax then
//            FAspectMax := Range;
//
//          if (Prob_of_Hit * 100) < FProbabilityMin then
//            FProbabilityMin := (Prob_of_Hit * 100)
//          else if (Prob_of_Hit * 100) > FProbabilityMax then
//            FProbabilityMax := (Prob_of_Hit * 100);
//        end;
//      end;
//      pgBomb:
//      begin
//        with TBomb_Definition(data).FBomb_POH do
//        begin
//          if Range < FAspectMin then
//            FAspectMin := Range
//          else if Range > FAspectMax then
//            FAspectMax := Range;
//
//          if (Prob_of_Hit * 100) < FProbabilityMin then
//            FProbabilityMin := (Prob_of_Hit * 100)
//          else if (Prob_of_Hit * 100) > FProbabilityMax then
//            FProbabilityMax := (Prob_of_Hit * 100);
//        end;
//      end;
//      pgSNRvsPOD:
//      begin
//        with TPOD_vs_SNR_Point(data).FData do
//        begin
//          if SNR_Ratio < FAspectMin then
//            FAspectMin := SNR_Ratio
//          else if SNR_Ratio > FAspectMax then
//            FAspectMax := SNR_Ratio;
//
//          if (Prob_of_Detection * 100) < FProbabilityMin then
//            FProbabilityMin := (Prob_of_Detection * 100)
//          else if (Prob_of_Detection * 100) > FProbabilityMax then
//            FProbabilityMax := (Prob_of_Detection * 100);
//        end;
//      end;
//    end;
  end;

  if FAspectMin = FAspectMax then
    FAspectMax := FAspectMin + 20;

  if FProbabilityMin = FProbabilityMax then
    FProbabilityMax := FProbabilityMin + 20;

//  FGrid.CenterX := imgGraph.Width div 2;
//  FGrid.CenterY := imgGraph.Height div 2;
//  FGrid.Height := Round(imgGraph.Height * 0.65);
//  FGrid.Width := Round(imgGraph.Width * 0.8);
//  FGrid.Top := Round(FGrid.CenterY - (FGrid.Height / 2));
//  FGrid.Left := Round(FGrid.CenterX - (FGrid.Width / 2));
//  FGrid.Bottom := Round(FGrid.CenterY + (FGrid.Height / 2));
//  FGrid.Right := Round(FGrid.CenterX + (FGrid.Width / 2));

  UpdateProbabilityGraphForm;
  btnApply.Enabled := False;
end;

{$ENDREGION}

{$REGION ' Button Handle '}
procedure TfrmAcousticDecoyPOHGraphic.btnDeleteClick(Sender: TObject);
var
  i : Integer;
  data : TObject;
begin
  if not Assigned(FSelectedPoint) then
    Exit;

  for i := FProbabilityPointList.Count - 1 downto 0 do
  begin
    data := FProbabilityPointList.Items[i];

//    case FProbabilityGraph of
//      pgMine:
//      begin
//        if TMine_On_Board(data).FMine_POD.List_Index =
//          TMine_On_Board(FSelectedPoint).FMine_POD.List_Index then
//        begin
//          FDeletedProbabilityPointList.Add(TMine_On_Board(data));
//          FProbabilityPointList.Delete(i);
//          FSelectedPoint := nil;
//          break;
//        end;
//      end;
//      pgGunAir, pgGunSurfaceLand:
//      begin
//        if TGun_Definition(data).FGun_POH.List_Index =
//          TGun_Definition(FSelectedPoint).FGun_POH.List_Index then
//        begin
//          FDeletedProbabilityPointList.Add(TGun_Definition(data));
//          FProbabilityPointList.Delete(i);
//          FSelectedPoint := nil;
//          break;
//        end;
//      end;
//      pgBomb:
//      begin
//        if TBomb_Definition(data).FBomb_POH.List_Index =
//          TBomb_Definition(FSelectedPoint).FBomb_POH.List_Index then
//        begin
//          FDeletedProbabilityPointList.Add(TBomb_Definition(data));
//          FProbabilityPointList.Delete(i);
//          FSelectedPoint := nil;
//          break;
//        end;
//      end;
//      pgSNRvsPOD:
//      begin
//        if TPOD_vs_SNR_Point(data).FData.List_Index =
//          TPOD_vs_SNR_Point(FSelectedPoint).FData.List_Index then
//        begin
//          FDeletedProbabilityPointList.Add(TPOD_vs_SNR_Point(data));
//          FProbabilityPointList.Delete(i);
//          FSelectedPoint := nil;
//          break;
//        end;
//      end;
//    end;
  end;

  UpdateProbabilityGraphForm;
  btnApply.Enabled := True;
end;

procedure TfrmAcousticDecoyPOHGraphic.DrawGrid;
var
  aspectDiffMode, probabilityDiffMode, i : Integer;
  aspectDiff, probabilityDiff, diffX, diffY : Double;
  valueStr, probabilityLabel, aspectLabel : string;
begin
  with imgGraph.Canvas do
  begin
    {background}
    Pen.Color := clWhite;
    Pen.Style := psSolid;
    Brush.Color := clWhite;
    Brush.Style := bsSolid;

    Rectangle(0, 0, imgGraph.Width, imgGraph.Height);

    {grid}
    if (FAspectMax - FAspectMin) / 5 >= 4 then
    begin
      aspectDiffMode := 1;
      aspectDiff := 5;
    end
    else if (FAspectMax - FAspectMin) / 0.5 >= 4 then
    begin
      aspectDiffMode := 2;
      aspectDiff := 0.5;
    end
    else if (FAspectMax - FAspectMin) / 0.05 >= 4 then
    begin
      aspectDiffMode := 3;
      aspectDiff := 0.05;
    end;

    if (FProbabilityMax - FProbabilityMin) / 5 >= 4 then
    begin
      probabilityDiffMode := 1;
      probabilityDiff := 5;
    end
    else if (FProbabilityMax - FProbabilityMin) / 0.5 >= 4 then
    begin
      probabilityDiffMode := 2;
      probabilityDiff := 0.5;
    end
    else if (FProbabilityMax - FProbabilityMin) / 0.05 >= 4 then
    begin
      probabilityDiffMode := 3;
      probabilityDiff := 0.05;
    end;

//    diffX := FGrid.Width / ((FAspectMax - FAspectMin) / aspectDiff);
//    diffY := FGrid.Height /
//      ((FProbabilityMax - FProbabilityMin) / probabilityDiff);
//
//    Font.Size := 10;
//
//    i := 1;
//    while Round(FGrid.Left + (i * diffX)) <= FGrid.Right do
//    begin
//      if i mod 2 = 0 then
//      begin
//        Pen.Color := clGray;
//        Pen.Style := psDot;
//        MoveTo(Round(FGrid.Left + (i * diffX)), FGrid.Top);
//        LineTo(Round(FGrid.Left + (i * diffX)), FGrid.Bottom);
//
//        case aspectDiffMode of
//          1, 2: valueStr := FormatFloat('0', FAspectMin + (i * aspectDiff));
//          3: valueStr := FormatFloat('0.#', FAspectMin + (i * aspectDiff));
//        end;
//
//        TextOut(
//          Round(FGrid.Left + (i * diffX) - 3 - ((Length(valueStr) - 1) * 3)),
//          FGrid.Bottom + 6, valueStr);
//      end;
//
//      Pen.Color := clBlack;
//      Pen.Style := psSolid;
//      MoveTo(Round(FGrid.Left + (i * diffX)), FGrid.Bottom - 2);
//      LineTo(Round(FGrid.Left + (i * diffX)), FGrid.Bottom + 3);
//
//      Inc(i);
//    end;
//
//    i := 1;
//    while Round(FGrid.Bottom - (i * diffY)) >= FGrid.Top do
//    begin
//      if i mod 2 = 0 then
//      begin
//        Pen.Color := clGray;
//        Pen.Style := psDot;
//        MoveTo(FGrid.Left, Round(FGrid.Bottom - (i * diffY)));
//        LineTo(FGrid.Right, Round(FGrid.Bottom - (i * diffY)));
//
//        case probabilityDiffMode of
//          1, 2: valueStr := FormatFloat('0',
//            FProbabilityMin + (i * probabilityDiff));
//          3: valueStr := FormatFloat('0.#',
//            FProbabilityMin + (i * probabilityDiff));
//        end;
//
//        TextOut(FGrid.Left - 10 - ((Length(valueStr) - 1) * 7),
//          Round(FGrid.Bottom - (i * diffY) - 8), valueStr);
//      end;
//
//      Pen.Color := clBlack;
//      Pen.Style := psSolid;
//      MoveTo(FGrid.Left - 2, Round(FGrid.Bottom - (i * diffY)));
//      LineTo(FGrid.Left + 3, Round(FGrid.Bottom - (i * diffY)));
//
//      Inc(i);
//    end;
//
//    Pen.Color := clBlack;
//    Pen.Style := psSolid;
//
//    valueStr := FormatFloat('0', FAspectMin);
//    MoveTo(FGrid.Left - 2, FGrid.Bottom);
//    LineTo(FGrid.Right, FGrid.Bottom);
//    TextOut(FGrid.Left - 3 - ((Length(valueStr) - 1) * 3), FGrid.Bottom + 6,
//      valueStr);
//
//    valueStr := FormatFloat('0', FProbabilityMin);
//    MoveTo(FGrid.Left, FGrid.Top);
//    LineTo(FGrid.Left, FGrid.Bottom + 3);
//    TextOut(FGrid.Left - 10 - ((Length(valueStr) - 1) * 7), FGrid.Bottom - 8,
//      valueStr);
//
//    {label}
//    Font.Size := 12;
//
//    case FProbabilityGraph of
//      pgMine:
//      begin
//        probabilityLabel := 'Probability of Detonation (%)';
//        aspectLabel := 'Range (nm)';
//      end;
//      pgGunAir:
//      begin
//        probabilityLabel := 'Probability of Hit (%)';
//        aspectLabel := 'Range (nm)';
//      end;
//      pgGunSurfaceLand:
//      begin
//        probabilityLabel := 'Probability of Hit (%)';
//        aspectLabel := 'Range (nm)';
//      end;
//      pgBomb:
//      begin
//        probabilityLabel := 'Probability of Hit (%)';
//        aspectLabel := 'Range (nm)';
//      end;
//      pgSNRvsPOD:
//      begin
//        probabilityLabel := 'Probability of Detection (%)';
//        aspectLabel := 'Signal-to-Noise Ratio (dB)';
//      end;
//    end;
//
//    TextOut(FGrid.Left, FGrid.Top - 40, probabilityLabel);
//
//    TextOut(FGrid.CenterX - Round((Length(aspectLabel) - 1) * 7 / 2),
//      FGrid.Bottom + 30, aspectLabel);
  end;
end;

procedure TfrmAcousticDecoyPOHGraphic.DrawPoint;
var
  pointID, i, newX, newY, oldX, oldY : Integer;
  data : TObject;
  posPercentX, posPercentY : Double;
begin
  if FProbabilityPointList.Count = 0 then
    Exit;

  with imgGraph.Canvas do
  begin
    pointID := 0;

    for i := 0 to FProbabilityPointList.Count - 1 do
    begin
      data := FProbabilityPointList.Items[i];

//      case FProbabilityGraph of
//        pgMine:
//        begin
//          with TMine_On_Board(data).FMine_POD do
//          begin
//            if (Range < FAspectMin) or
//              (Range > FAspectMax) or
//              ((Prob_of_Detonation * 100) < FProbabilityMin) or
//              ((Prob_of_Detonation * 100) > FProbabilityMax) then
//              Continue;
//
//            ConvertValueToPosition(Range, Prob_of_Detonation, newX, newY);
//          end;
//        end;
//        pgGunAir, pgGunSurfaceLand:
//        begin
//          with TGun_Definition(data).FGun_POH do
//          begin
//            if (Range < FAspectMin) or
//              (Range > FAspectMax) or
//              ((Prob_of_Hit * 100) < FProbabilityMin) or
//              ((Prob_of_Hit * 100) > FProbabilityMax) then
//              Continue;
//
//            ConvertValueToPosition(Range, Prob_of_Hit, newX, newY);
//          end;
//        end;
//        pgBomb:
//        begin
//          with TBomb_Definition(data).FBomb_POH do
//          begin
//            if (Range < FAspectMin) or
//              (Range > FAspectMax) or
//              ((Prob_of_Hit * 100) < FProbabilityMin) or
//              ((Prob_of_Hit * 100) > FProbabilityMax) then
//              Continue;
//
//            ConvertValueToPosition(Range, Prob_of_Hit, newX, newY);
//          end;
//        end;
//        pgSNRvsPOD:
//        begin
//          with TPOD_vs_SNR_Point(data).FData do
//          begin
//            if (SNR_Ratio < FAspectMin) or
//              (SNR_Ratio > FAspectMax) or
//              ((Prob_of_Detection * 100) < FProbabilityMin) or
//              ((Prob_of_Detection * 100) > FProbabilityMax) then
//              Continue;
//
//            ConvertValueToPosition(SNR_Ratio, Prob_of_Detection, newX, newY);
//          end;
//        end;
//      end;
//
//      Pen.Style := psSolid;
//      Pen.Color := clBlack;
//
//      if Assigned(FSelectedPoint) and (data = FSelectedPoint) then
//      begin
//        Brush.Color := clBlack;
//        Brush.Style := bsSolid;
//      end
//      else
//        Brush.Style := bsClear;
//
//      Ellipse(newX - 3, newY - 3, newX + 4, newY + 4);
//
//      if pointID = 0 then
//      begin
//        oldX := newX;
//        oldY := newY;
//        MoveTo(oldX, oldY);
//      end
//      else
//      begin
//        LineTo(newX, newY);
//        oldX := newX;
//        oldY := newY;
//        MoveTo(oldX, oldY);
//      end;
//
//      Inc(pointID);
    end;
  end;
end;

procedure TfrmAcousticDecoyPOHGraphic.edtAspectMaxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
//    if StrToFloat(edtAspectMax.Text) <= FAspectMin  then
//    begin
//      ShowMessage('Invalid value');
//      edtAspectMax.Text := FormatFloat('0.00', FAspectMax);
//      Exit;
//    end;
//
//    FAspectMax := StrToFloat(edtAspectMax.Text);
//    UpdateProbabilityGraphForm;
  end;
end;

procedure TfrmAcousticDecoyPOHGraphic.edtAspectMinKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
//    if StrToFloat(edtAspectMin.Text) >= FAspectMax  then
//    begin
//      ShowMessage('Invalid value');
//      edtAspectMin.Text := FormatFloat('0.00', FAspectMin);
//      Exit;
//    end;
//
//    FAspectMin := StrToFloat(edtAspectMin.Text);
//    UpdateProbabilityGraphForm;
  end;
end;

procedure TfrmAcousticDecoyPOHGraphic.edtProbabilityMaxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
//    if StrToFloat(edtProbabilityMax.Text) <= FProbabilityMin  then
//    begin
//      ShowMessage('Invalid value');
//      edtProbabilityMax.Text := FormatFloat('0.00', FProbabilityMax);
//      Exit;
//    end;
//
//    FProbabilityMax := StrToFloat(edtProbabilityMax.Text);
//    UpdateProbabilityGraphForm;
  end;
end;

procedure TfrmAcousticDecoyPOHGraphic.edtProbabilityMinKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
//    if StrToFloat(edtProbabilityMin.Text) >= FProbabilityMax  then
//    begin
//      ShowMessage('Invalid value');
//      edtProbabilityMin.Text := FormatFloat('0.00', FProbabilityMin);
//      Exit;
//    end;
//
//    FProbabilityMin := StrToFloat(edtProbabilityMin.Text);
//    UpdateProbabilityGraphForm;
  end;
end;

procedure TfrmAcousticDecoyPOHGraphic.btnApplyClick(Sender: TObject);
var
  i : Integer;
  data : TObject;
begin
  for i := 0 to FDeletedProbabilityPointList.Count - 1 do
  begin
    data := FDeletedProbabilityPointList.Items[i];

//    case FProbabilityGraph of
//      pgMine:
//      begin
//        with TMine_On_Board(data).FMine_POD do
//          if List_Index <> 0 then
//            dmTTT.DeleteMinePODvsRange(2, List_Index);
//
//        TMine_On_Board(data).Free;
//      end;
//      pgGunAir, pgGunSurfaceLand:
//      begin
//        with TGun_Definition(data).FGun_POH do
//          if List_Index <> 0 then
//            dmTTT.DeleteGunPOHvsRange(2, List_Index);
//
//        TGun_Definition(data).Free;
//      end;
//      pgBomb:
//      begin
//        with TBomb_Definition(data).FBomb_POH do
//          if List_Index <> 0 then
//            dmTTT.DeleteBombPOHvsRange(2, List_Index);
//
//        TBomb_Definition(data).Free;
//      end;
//      pgSNRvsPOD:
//      begin
//        with TPOD_vs_SNR_Point(data).FData do
//          if List_Index <> 0 then
//            dmTTT.DeletePODvsSNRCurvePoint(2, List_Index);
//
//        TPOD_vs_SNR_Point(data).Free;
//      end;
//    end;
  end;

  FDeletedProbabilityPointList.Clear;

  for i := 0 to FProbabilityPointList.Count - 1 do
  begin
    data := FProbabilityPointList.Items[i];

//    case FProbabilityGraph of
//      pgMine:
//      begin
//        with TMine_On_Board(data) do
//        begin
//          if FMine_POD.List_Index = 0 then
//            dmTTT.InsertMinePODvsRange(FMine_POD)
//          else
//            dmTTT.UpdateMinePODvsRange(FMine_POD);
//        end;
//      end;
//      pgGunAir, pgGunSurfaceLand:
//      begin
//        with TGun_Definition(data) do
//        begin
//          if FGun_POH.List_Index = 0 then
//            dmTTT.InsertGunPOHvsRange(FGun_POH)
//          else
//            dmTTT.UpdateGunPOHvsRange(FGun_POH);
//        end;
//      end;
//      pgBomb:
//      begin
//        with TBomb_Definition(data) do
//        begin
//          if FBomb_POH.List_Index = 0 then
//            dmTTT.InsertBombPOHvsRange(FBomb_POH)
//          else
//            dmTTT.UpdateBombPOHvsRange(FBomb_POH);
//        end;
//      end;
//      pgSNRvsPOD:
//      begin
//        with TPOD_vs_SNR_Point(data) do
//        begin
//          if FData.List_Index = 0 then
//            dmTTT.InsertPODvsSNRCurvePoint(FData)
//          else
//            dmTTT.UpdatePODvsSNRCurvePoint(FData);
//        end;
//      end;
//    end;
  end;

  btnApply.Enabled := False;
end;

procedure TfrmAcousticDecoyPOHGraphic.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAcousticDecoyPOHGraphic.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  Close;
end;

procedure TfrmAcousticDecoyPOHGraphic.btnScreenCaptureClick(Sender: TObject);
begin
//  with fCaptureRes do
//  begin
//    imgCaptureResult.Picture.Assign(imgGraph.Picture);
//    Height := imgGraph.Height + 100;
//    Width := imgGraph.Width;
//    Show;
//  end;
end;

procedure TfrmAcousticDecoyPOHGraphic.ConvertPositionToValue(const aX, aY: Integer; var aAspect, aProbability: Double);
var
  posPercent : Double;
begin
//  posPercent := (aX - FGrid.Left) / (FGrid.Right - FGrid.Left);
//  aAspect := FAspectMin + ((FAspectMax - FAspectMin) * posPercent);
//
//  posPercent := (FGrid.Bottom - aY) / (FGrid.Bottom - FGrid.Top);
//  aProbability := FProbabilityMin +
//    ((FProbabilityMax - FProbabilityMin) * posPercent);
end;

procedure TfrmAcousticDecoyPOHGraphic.ConvertValueToPosition(const aAspect, aProbability: Double; var aX, aY: Integer);
var
  posPercent : Double;
begin
//  posPercent := (aAspect - FAspectMin) / (FAspectMax - FAspectMin);
//  aX := FGrid.Left + Round((FGrid.Right - FGrid.Left) * posPercent);
//
//  posPercent := ((aProbability * 100) - FProbabilityMin) /
//    (FProbabilityMax - FProbabilityMin);
//  aY := FGrid.Bottom - Round((FGrid.Bottom - FGrid.Top) * posPercent);
end;

function TfrmAcousticDecoyPOHGraphic.GetPointPosition(const aAspect, aProbability: Double): Integer;
var
  i : Integer;
  data : TObject;
begin
  Result := 0;

  for i := 0 to FProbabilityPointList.Count - 1 do
  begin
    data := FProbabilityPointList.Items[i];

//    case FProbabilityGraph of
//      pgMine:
//      begin
//        with TMine_On_Board(data).FMine_POD do
//        begin
//          if aAspect < Range then
//          begin
//            Result := i;
//            Break;
//          end;
//        end;
//      end;
//      pgGunAir, pgGunSurfaceLand:
//      begin
//        with TGun_Definition(data).FGun_POH do
//        begin
//          if aAspect < Range then
//          begin
//            Result := i;
//            Break;
//          end;
//        end;
//      end;
//      pgBomb:
//      begin
//        with TBomb_Definition(data).FBomb_POH do
//        begin
//          if aAspect < Range then
//          begin
//            Result := i;
//            Break;
//          end;
//        end;
//      end;
//      pgSNRvsPOD:
//      begin
//        with TPOD_vs_SNR_Point(data).FData do
//        begin
//          if aAspect < SNR_Ratio then
//          begin
//            Result := i;
//            Break;
//          end;
//        end;
//      end;
//    else
//      Result := 0;
//    end;

    if i = FProbabilityPointList.Count - 1 then
      Result := FProbabilityPointList.Count;
  end;
end;

procedure TfrmAcousticDecoyPOHGraphic.UpdateProbabilityGraphForm;
begin
//  btnDelete.Enabled := Assigned(FSelectedPoint);

  if Assigned(FSelectedPoint) then
  begin
//    case FProbabilityGraph of
//      pgMine:
//      begin
//        with TMine_On_Board(FSelectedPoint).FMine_POD do
//        begin
//          lblSelectedAspect.Caption := FormatFloat('0.00', Range);
//          lblSelectedProbability.Caption := FormatFloat('0.00',
//            Prob_of_Detonation * 100);
//        end;
//      end;
//      pgGunAir, pgGunSurfaceLand:
//      begin
//        with TGun_Definition(FSelectedPoint).FGun_POH do
//        begin
//          lblSelectedAspect.Caption := FormatFloat('0.00', Range);
//          lblSelectedProbability.Caption := FormatFloat('0.00',
//            Prob_of_Hit * 100);
//        end;
//      end;
//      pgBomb:
//      begin
//        with TBomb_Definition(FSelectedPoint).FBomb_POH do
//        begin
//          lblSelectedAspect.Caption := FormatFloat('0.00', Range);
//          lblSelectedProbability.Caption := FormatFloat('0.00',
//            Prob_of_Hit * 100);
//        end;
//      end;
//      pgSNRvsPOD:
//      begin
//        with TPOD_vs_SNR_Point(FSelectedPoint).FData do
//        begin
//          lblSelectedAspect.Caption := FormatFloat('0.00', SNR_Ratio);
//          lblSelectedProbability.Caption := FormatFloat('0.00',
//            Prob_of_Detection * 100);
//        end;
//      end;
//    end;
  end
  else
  begin
//    lblSelectedAspect.Caption := '-';
//    lblSelectedProbability.Caption := '-';
  end;

//  edtAspectMin.Text := FormatFloat('0.00', FAspectMin);
//  edtAspectMax.Text := FormatFloat('0.00', FAspectMax);
//  edtProbabilityMin.Text := FormatFloat('0.00', FProbabilityMin);
//  edtProbabilityMax.Text := FormatFloat('0.00', FProbabilityMax);

  DrawGrid;
  DrawPoint;
end;

procedure TfrmAcousticDecoyPOHGraphic.imgGraphMouseDown(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, posX, posY, pointIndex : Integer;
  data : TObject;
  aspect, probability : Double;
begin
//  if (X < FGrid.Left) or
//    (X > FGrid.Right) or
//    (Y < FGrid.Top) or
//    (Y > FGrid.Bottom) then
//    Exit;
//
//  FIsMouseDown := True;
//  FSelectedPoint := nil;
//
//  if btnSelect.Down then
//  begin
//    for i := 0 to FProbabilityPointList.Count - 1 do
//    begin
//      data := FProbabilityPointList.Items[i];
//
//      case FProbabilityGraph of
//        pgMine:
//        begin
//          with TMine_On_Board(data).FMine_POD do
//          begin
//            if (Range < FAspectMin) or
//              (Range > FAspectMax) or
//              ((Prob_of_Detonation * 100) < FProbabilityMin) or
//              ((Prob_of_Detonation * 100) > FProbabilityMax) then
//              Continue;
//
//            ConvertValueToPosition(Range, Prob_of_Detonation, posX, posY);
//          end;
//        end;
//        pgGunAir, pgGunSurfaceLand:
//        begin
//          with TGun_Definition(data).FGun_POH do
//          begin
//            if (Range < FAspectMin) or
//              (Range > FAspectMax) or
//              ((Prob_of_Hit * 100) < FProbabilityMin) or
//              ((Prob_of_Hit * 100) > FProbabilityMax) then
//              Continue;
//
//            ConvertValueToPosition(Range, Prob_of_Hit, posX, posY);
//          end;
//        end;
//        pgBomb:
//        begin
//          with TBomb_Definition(data).FBomb_POH do
//          begin
//            if (Range < FAspectMin) or
//              (Range > FAspectMax) or
//              ((Prob_of_Hit * 100) < FProbabilityMin) or
//              ((Prob_of_Hit * 100) > FProbabilityMax) then
//              Continue;
//
//            ConvertValueToPosition(Range, Prob_of_Hit, posX, posY);
//          end;
//        end;
//        pgSNRvsPOD:
//        begin
//          with TPOD_vs_SNR_Point(data).FData do
//          begin
//            if (SNR_Ratio < FAspectMin) or
//              (SNR_Ratio > FAspectMax) or
//              ((Prob_of_Detection * 100) < FProbabilityMin) or
//              ((Prob_of_Detection * 100) > FProbabilityMax) then
//              Continue;
//
//            ConvertValueToPosition(SNR_Ratio, Prob_of_Detection, posX, posY);
//          end;
//        end;
//      end;
//
//      if (X >= posX - 3) and (X <= posX + 4) and
//        (Y >= posY - 3) and (Y <= posY + 4) then
//      begin
//        FSelectedPoint := data;
//        Break;
//      end;
//    end;
//  end
//  else if btnAdd.Down then
//  begin
//    ConvertPositionToValue(X, Y, aspect, probability);
//    pointIndex := GetPointPosition(aspect, probability / 100);
//
//    case FProbabilityGraph of
//      pgMine:
//      begin
//        FSelectedPoint := TMine_On_Board.Create;
//
//        with TMine_On_Board(FSelectedPoint).FMine_POD do
//        begin
//          Mine_Index := TMine_On_Board(FSelectedProbObj).FMine_Def.Mine_Index;
//          Prob_of_Detonation := probability / 100;
//          Range := aspect;
//        end;
//
//        FProbabilityPointList.Insert(pointIndex,
//          TMine_On_Board(FSelectedPoint));
//      end;
//      pgGunAir, pgGunSurfaceLand:
//      begin
//        FSelectedPoint := TGun_Definition.Create;
//
//        with TGun_Definition(FSelectedPoint).FGun_POH do
//        begin
//          Gun_Index := TGun_Definition(FSelectedProbObj).FData.Gun_Index;
//          Target_Type := Ord(FProbabilityGraph);
//          Prob_of_Hit := probability / 100;
//          Range := aspect;
//        end;
//
//        FProbabilityPointList.Insert(pointIndex,
//          TGun_Definition(FSelectedPoint));
//      end;
//      pgBomb:
//      begin
//        FSelectedPoint := TBomb_Definition.Create;
//
//        with TBomb_Definition(FSelectedPoint).FBomb_POH do
//        begin
//          Bomb_Index := TBomb_Definition(FSelectedProbObj).FData.Bomb_Index;
//          Prob_of_Hit := probability / 100;
//          Range := aspect;
//        end;
//
//        FProbabilityPointList.Insert(pointIndex,
//          TBomb_Definition(FSelectedPoint));
//      end;
//      pgSNRvsPOD:
//      begin
//        FSelectedPoint := TPOD_vs_SNR_Point.Create;
//
//        with TPOD_vs_SNR_Point(FSelectedPoint).FData do
//        begin
//          Curve_Definition_Index :=
//            TPOD_vs_SNR_Curve_Definition(FSelectedProbObj).FData.
//              Curve_Definition_Index;
//          Prob_of_Detection := probability / 100;
//          SNR_Ratio := aspect;
//        end;
//
//        FProbabilityPointList.Insert(pointIndex,
//          TPOD_vs_SNR_Point(FSelectedPoint));
//      end;
//    end;
//
//    btnApply.Enabled := True;
//  end;
end;

procedure TfrmAcousticDecoyPOHGraphic.imgGraphMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  aspect, probability : Double;
begin
//  if (X < FGrid.Left) or
//    (X > FGrid.Right) or
//    (Y < FGrid.Top) or
//    (Y > FGrid.Bottom) then
//  begin
//    lblCursorAspect.Caption := '-';
//    lblCursorProbability.Caption := '-';
//  end
//  else
//  begin
//    ConvertPositionToValue(X, Y, aspect, probability);
//
//    lblCursorAspect.Caption := FormatFloat('0.00', aspect);
//    lblCursorProbability.Caption := FormatFloat('0.00', probability);
//  end;
//
//  FIsDragPoint := btnSelect.Down and FIsMouseDown and Assigned(FSelectedPoint);
end;

procedure TfrmAcousticDecoyPOHGraphic.imgGraphMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  newAspect, newProbability : Double;
  pointIndex, i, j : Integer;
  data : TObject;
begin
//  if btnSelect.Down and FIsDragPoint and Assigned(FSelectedPoint) then
//  begin
//    if (X < FGrid.Left) or
//      (X > FGrid.Right) or
//      (Y < FGrid.Top) or
//      (Y > FGrid.Bottom) then
//      Exit;
//
//    ConvertPositionToValue(X, Y, newAspect, newProbability);
//
//    case FProbabilityGraph of
//      pgMine:
//      begin
//        with TMine_On_Board(FSelectedPoint).FMine_POD do
//        begin
//          Range := newAspect;
//          Prob_of_Detonation := newProbability / 100;
//        end;
//      end;
//      pgGunAir, pgGunSurfaceLand:
//      begin
//        with TGun_Definition(FSelectedPoint).FGun_POH do
//        begin
//          Range := newAspect;
//          Prob_of_Hit := newProbability / 100;
//        end;
//      end;
//      pgBomb:
//      begin
//        with TBomb_Definition(FSelectedPoint).FBomb_POH do
//        begin
//          Range := newAspect;
//          Prob_of_Hit := newProbability / 100;
//        end;
//      end;
//      pgSNRvsPOD:
//      begin
//        with TPOD_vs_SNR_Point(FSelectedPoint).FData do
//        begin
//          SNR_Ratio := newAspect;
//          Prob_of_Detection := newProbability / 100;
//        end;
//      end;
//    end;
//
//    for i := FProbabilityPointList.Count - 1 downto 0 do
//    begin
//      data := FProbabilityPointList.Items[i];
//
//      case FProbabilityGraph of
//        pgMine:
//        begin
//          if TMine_On_Board(data).FMine_POD.Range =
//            TMine_On_Board(FSelectedPoint).FMine_POD.Range then
//          begin
//            FProbabilityPointList.Delete(i);
//            Break;
//          end;
//        end;
//        pgGunAir, pgGunSurfaceLand:
//        begin
//          if TGun_Definition(data).FGun_POH.Range =
//            TGun_Definition(FSelectedPoint).FGun_POH.Range then
//          begin
//            FProbabilityPointList.Delete(i);
//            Break;
//          end;
//        end;
//        pgBomb:
//        begin
//          if TBomb_Definition(data).FBomb_POH.Range =
//            TBomb_Definition(FSelectedPoint).FBomb_POH.Range then
//          begin
//            FProbabilityPointList.Delete(i);
//            Break;
//          end;
//        end;
//        pgSNRvsPOD:
//        begin
//          if TPOD_vs_SNR_Point(data).FData.SNR_Ratio =
//            TPOD_vs_SNR_Point(FSelectedPoint).FData.SNR_Ratio then
//          begin
//            FProbabilityPointList.Delete(i);
//            Break;
//          end;
//        end;
//      end;
//    end;
//
//    pointIndex := GetPointPosition(newAspect, newProbability / 100);
//
//    case FProbabilityGraph of
//      pgMine:
//      begin
//        FProbabilityPointList.Insert(pointIndex,
//          TMine_On_Board(FSelectedPoint));
//      end;
//      pgGunAir, pgGunSurfaceLand:
//      begin
//        FProbabilityPointList.Insert(pointIndex,
//          TGun_Definition(FSelectedPoint));
//      end;
//      pgBomb:
//      begin
//        FProbabilityPointList.Insert(pointIndex,
//          TBomb_Definition(FSelectedPoint));
//      end;
//      pgSNRvsPOD:
//      begin
//        FProbabilityPointList.Insert(pointIndex,
//          TPOD_vs_SNR_Point(FSelectedPoint));
//      end;
//    end;
//
//    btnApply.Enabled := True;
//  end;

  UpdateProbabilityGraphForm;
end;

{$ENDREGION}

end.
