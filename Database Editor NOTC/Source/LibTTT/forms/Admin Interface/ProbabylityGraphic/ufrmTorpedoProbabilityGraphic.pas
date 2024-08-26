unit ufrmTorpedoProbabilityGraphic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Vcl.Imaging.pngimage, Math,
  uScrCapture, ufCaptureRes, uDBAsset_Weapon, tttData, Vcl.ComCtrls, uSimContainers,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList;

type

  TProbabilityGrid = record
    Top : Integer;
    Left : Integer;
    Bottom : Integer;
    Right : Integer;
    Height : Integer;
    Width : Integer;
    CenterX : Integer;
    CenterY : Integer;
  end;

  TfrmTorpedoProbabilityGraphic = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    ImgBackgroundForm: TImage;
    Panel2: TPanel;
    imgGraph: TImage;
    il1: TImageList;
    Panel1: TPanel;
    grpAspect: TGroupBox;
    lb3: TLabel;
    lb4: TLabel;
    lb7: TLabel;
    lb8: TLabel;
    edtAspectMin: TEdit;
    edtAspectMax: TEdit;
    grpCursorPosition: TGroupBox;
    lb1: TLabel;
    lb2: TLabel;
    lblCursorAspect: TLabel;
    lblCursorProbability: TLabel;
    grpSelectedPoint: TGroupBox;
    lb5: TLabel;
    lb6: TLabel;
    lblSelectedAspect: TLabel;
    lblSelectedProbability: TLabel;
    grpProbability: TGroupBox;
    lb9: TLabel;
    lb10: TLabel;
    lb11: TLabel;
    lb12: TLabel;
    edtProbabilityMin: TEdit;
    edtProbabilityMax: TEdit;
    Panel3: TPanel;
    tlb1: TToolBar;
    btnSelect: TToolButton;
    btnAdd: TToolButton;
    btnSeparator: TToolButton;
    btnDelete: TToolButton;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure imgGraphMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgGraphMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imgGraphMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnScreenCaptureClick(Sender: TObject);
    procedure edtProbabilityMinKeyPress(Sender: TObject; var Key: Char);
    procedure edtProbabilityMaxKeyPress(Sender: TObject; var Key: Char);
    procedure btnDeleteClick(Sender: TObject);

  private
    FProbabilityGraph : E_ProbabilityGraph;
    FSelectedProbObj : TObject;

    FProbabilityPointList : TList;
    FDeletedProbabilityPointList : TList;
    FSelectedPoint : TObject;

    FAspectMin : Double;
    FAspectMax : Double;
    FProbabilityMin : Double;
    FProbabilityMax : Double;

    FGrid : TProbabilityGrid;

    FIsMouseDown : Boolean;
    FIsDragPoint : Boolean;
    FisTorpedoNew : Boolean;

    procedure ConvertPositionToValue(const aX, aY: Integer; var aAspect, aProbability: Double);
    procedure ConvertValueToPosition(const aAspect, aProbability: Double; var aX, aY: Integer);
    function GetPointPosition(const aAspect, aProbability: Double): Integer;

    procedure UpdateProbabilityGraphForm;
    procedure DrawGrid;
    procedure DrawPoint;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    property ProbabilityGraph : E_ProbabilityGraph read FProbabilityGraph write FProbabilityGraph;
    property SelectedProbObj : TObject read FSelectedProbObj write FSelectedProbObj;
  end;

var
  frmTorpedoProbabilityGraphic: TfrmTorpedoProbabilityGraphic;

implementation

uses
  uDataModuleTTT ;

{$R *.dfm}


{$REGION ' Form Handle '}

procedure TfrmTorpedoProbabilityGraphic.FormCreate(Sender: TObject);
begin
  FProbabilityPointList := TList.Create;
  FDeletedProbabilityPointList := TList.Create;
end;

procedure TfrmTorpedoProbabilityGraphic.FormDestroy(Sender: TObject);
begin
  FreeItemsAndFreeList(FProbabilityPointList);
  FreeItemsAndFreeList(FDeletedProbabilityPointList);
end;

procedure TfrmTorpedoProbabilityGraphic.FormShow(Sender: TObject);
var
  i : Integer;
  data : TObject;
  temp : TTorpedo_On_Board;
begin

  with TTorpedo_On_Board(FSelectedProbObj).FDef do
  begin
    Caption := 'Aspect vs. Probability of Hit Curve for ' + Class_Identifier;
    dmTTT.GetTorpedoPOHModifier(Torpedo_Index, Ord(FProbabilityGraph), FProbabilityPointList);
  end;

  FDeletedProbabilityPointList.Clear;
  FSelectedPoint := nil;

  btnSelect.Down := True;

  FAspectMin := 0;
  FAspectMax := 0;
  FProbabilityMin := 0;
  FProbabilityMax := 0;

  for i := 0 to FProbabilityPointList.Count - 1 do
  begin
    data := FprobabilityPointList.Items[i];

    with TTorpedo_On_Board(data).FTorpedo_POH do
    begin
      if Aspect_Angle < FAspectMin then
        FAspectMin := Aspect_Angle
      else if Aspect_Angle > FAspectMax then
        FAspectMax := Aspect_Angle;

      if (POH_Modifier * 100) < FProbabilityMin then
        FProbabilityMin := (POH_Modifier * 100)
      else if (POH_Modifier * 100) > FProbabilityMax then
        FProbabilityMax := (POH_Modifier * 100);
    end;
  end;

  if FAspectMin = FAspectMax then
    FAspectMax := FAspectMin + 20;

  if FProbabilityMin = FProbabilityMax then
    FProbabilityMax := FProbabilityMin + 20;

  FGrid.CenterX := imgGraph.Width div 2;
  FGrid.CenterY := imgGraph.Height div 2;
  FGrid.Height := Round(imgGraph.Height * 0.65);
  FGrid.Width := Round(imgGraph.Width * 0.8);
  FGrid.Top := Round(FGrid.CenterY - (FGrid.Height / 2));
  FGrid.Left := Round(FGrid.CenterX - (FGrid.Width / 2));
  FGrid.Bottom := Round(FGrid.CenterY + (FGrid.Height / 2));
  FGrid.Right := Round(FGrid.CenterX + (FGrid.Width / 2));

  UpdateProbabilityGraphForm;
  btnApply.Enabled := False;
//  with TTorpedo_On_Board(FSelectedProbObj).FDef do
//  begin
//    dmTTT.GetTorpedoPOHModifier(Torpedo_Index, FProbabilityPointList);
//
//    if FProbabilityPointList.Count = 0 then
//    begin
//      for i := 0 to 3 do
//      begin
//        temp := TTorpedo_On_Board.Create;
//
//        with temp.FTorpedo_POH do
//        begin
//          Torpedo_Index  := TTorpedo_On_Board(FSelectedProbObj).FDef.Torpedo_Index;
//          Aspect_Angle   := i;
//          POH_Modifier   := 0.2;
//        end;
//
//        FProbabilityPointList.Add(temp);
//      end;
//      FisTorpedoNew := True;
//    end
//    else
//      FisTorpedoNew := False;
//  end;

//  FSelectedPoint := nil;
//
//  btnSelect.Down := True;
//
//  FAspectMin := 0;
//  FAspectMax := 3;
//  FProbabilityMin := 0;
//  FProbabilityMax := 100;
//
//  FGrid.CenterX := imgGraph.Width div 2;
//  FGrid.CenterY := imgGraph.Height div 2;
//  FGrid.Height := Round(imgGraph.Height * 0.65);
//  FGrid.Width := Round(imgGraph.Width * 0.8);
//  FGrid.Top := Round(FGrid.CenterY - (FGrid.Height / 2));
//  FGrid.Left := Round(FGrid.CenterX - (FGrid.Width / 2));
//  FGrid.Bottom := Round(FGrid.CenterY + (FGrid.Height / 2));
//  FGrid.Right := Round(FGrid.CenterX + (FGrid.Width / 2));
//
//  UpdateProbabilityGraphForm;
//  btnApply.Enabled := False;
end;

{$ENDREGION}

{$REGION ' Button Handle '}
procedure TfrmTorpedoProbabilityGraphic.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  Close;
end;

procedure TfrmTorpedoProbabilityGraphic.btnApplyClick(Sender: TObject);
var
  i : Integer;
  data : TObject;
begin

  for i := 0 to FDeletedProbabilityPointList.Count - 1 do
  begin
    data := FDeletedProbabilityPointList.Items[i];

    with TTorpedo_On_Board(data).FTorpedo_POH do
    begin
//      if List_Index <> 0 then
//        dmTTT.DeleteTorpedoPOHModifier(2, List_Index);
    end;

    TTorpedo_On_Board(data).Free;

  end;

  FDeletedProbabilityPointList.Clear;

  for i := 0 to FProbabilityPointList.Count - 1 do
  begin
    data := FProbabilityPointList.Items[i];

    with TTorpedo_On_Board(data) do
    begin
//      if FTorpedo_POH.List_Index = 0 then
        dmTTT.InsertTorpedoPOHModifier(FTorpedo_POH)
//      else
//        dmTTT.UpdateTorpedoPOHModifier(FTorpedo_POH);
    end;
  end;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmTorpedoProbabilityGraphic.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTorpedoProbabilityGraphic.btnDeleteClick(Sender: TObject);
var
  i : Integer;
  data : TObject;
begin
  if not Assigned(FSelectedPoint) then
    Exit;

  if TTorpedo_On_Board(FSelectedPoint).FTorpedo_POH.Torpedo_Index = 0 then
  begin
    ShowMessage('Apply the data first!');
    Exit;
  end;

  for i := FProbabilityPointList.Count - 1 downto 0 do
  begin
    data := FProbabilityPointList.Items[i];

    if TTorpedo_On_Board(data).FTorpedo_POH.Torpedo_Index = TTorpedo_On_Board(FSelectedPoint).FTorpedo_POH.Torpedo_Index then
    begin
      FDeletedProbabilityPointList.Add(TTorpedo_On_Board(data));
      FProbabilityPointList.Delete(i);
      FSelectedPoint := nil;
      break;
    end;
  end;

  UpdateProbabilityGraphForm;
  btnApply.Enabled := True;
end;

procedure TfrmTorpedoProbabilityGraphic.btnScreenCaptureClick(Sender: TObject);
begin
//  with fCaptureRes do
//  begin
//    imgCaptureResult.Picture.Assign(imgGraph.Picture);
//    Height := imgGraph.Height + 100;
//    Width := imgGraph.Width;
//    Show;
//  end;
end;

procedure TfrmTorpedoProbabilityGraphic.UpdateProbabilityGraphForm;
begin
  btnDelete.Enabled := Assigned(FSelectedPoint);

  if Assigned(FSelectedPoint) then
  begin
    with TTorpedo_On_Board(FSelectedPoint).FTorpedo_POH do
    begin
      lblSelectedAspect.Caption := FormatFloat('0.00', Aspect_Angle);
      lblSelectedProbability.Caption := FormatFloat('0.00', POH_Modifier * 100);
    end;
  end
  else
  begin
    lblSelectedAspect.Caption := '-';
    lblSelectedProbability.Caption := '-';
  end;

  edtAspectMin.Text := FormatFloat('0.00', FAspectMin);
  edtAspectMax.Text := FormatFloat('0.00', FAspectMax);
  edtProbabilityMin.Text := FormatFloat('0.00', FProbabilityMin);
  edtProbabilityMax.Text := FormatFloat('0.00', FProbabilityMax);

  DrawGrid;
  DrawPoint;
end;

procedure TfrmTorpedoProbabilityGraphic.imgGraphMouseDown(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, posX, posY, pointIndex : Integer;
  data : TObject;
  aspect, probability : Double;
begin
  {Biar tidak susah nyelect di badian tepinya, ini di comment dulu}
//  if (X < FGrid.Left) or (X > FGrid.Right) or (Y < FGrid.Top) or (Y > FGrid.Bottom) then
//    Exit;

  FIsMouseDown := True;
  FSelectedPoint := nil;

   if btnSelect.Down then
  begin
    for i := 0 to FProbabilityPointList.Count - 1 do
    begin
      data := FProbabilityPointList.Items[i];

      with TTorpedo_On_Board(data).FTorpedo_POH do
      begin
        if (Aspect_Angle < FAspectMin) or (Aspect_Angle > FAspectMax) or ((POH_Modifier * 100) < FProbabilityMin) or ((POH_Modifier * 100) > FProbabilityMax) then
          Continue;

        ConvertValueToPosition(Aspect_Angle, POH_Modifier, posX, posY);
      end;

      if (X >= posX - 3) and (X <= posX + 4) and (Y >= posY - 3) and (Y <= posY + 4) then
      begin
        FSelectedPoint := data;
        Break;
      end;
    end;
  end
  else if btnAdd.Down then
  begin
    ConvertPositionToValue(X, Y, aspect, probability);
    pointIndex := GetPointPosition(aspect, probability / 100);

    FSelectedPoint := TTorpedo_On_Board.Create;
    with TTorpedo_On_Board(FSelectedPoint).FTorpedo_POH do
    begin
      Torpedo_Index := TTorpedo_On_Board(FSelectedProbObj).FData.Torpedo_Index;
      POH_Modifier := probability / 100;
      Aspect_Angle := aspect;
    end;

    FProbabilityPointList.Insert(pointIndex, TTorpedo_On_Board(FSelectedPoint));

    btnApply.Enabled := True;
  end;

end;

procedure TfrmTorpedoProbabilityGraphic.imgGraphMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  aspect, probability : Double;
begin
  if (X < FGrid.Left) or (X > FGrid.Right) or (Y < FGrid.Top) or (Y > FGrid.Bottom) then
  begin
    lblCursorAspect.Caption := '-';
    lblCursorProbability.Caption := '-';
  end
  else
  begin
    ConvertPositionToValue(X, Y, aspect, probability);

    lblCursorAspect.Caption := FormatFloat('0.00', aspect);
    lblCursorProbability.Caption := FormatFloat('0.00', probability);
  end;

  FIsDragPoint := btnSelect.Down and FIsMouseDown and Assigned(FSelectedPoint);
end;

procedure TfrmTorpedoProbabilityGraphic.imgGraphMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  newAspect, newProbability : Double;
  pointIndex, i, j : Integer;
  data : TObject;
begin
  if btnSelect.Down and FIsDragPoint and Assigned(FSelectedPoint) then
  begin
    if (X < FGrid.Left) or (X > FGrid.Right) or (Y < FGrid.Top) or (Y > FGrid.Bottom) then
      Exit;

    ConvertPositionToValue(X, Y, newAspect, newProbability);

    with TTorpedo_On_Board(FSelectedPoint).FTorpedo_POH do
    begin
      Aspect_Angle := newAspect;
      POH_Modifier := newProbability / 100;
    end;

    for i := FProbabilityPointList.Count - 1 downto 0 do
    begin
      data := FProbabilityPointList.Items[i];
      if TTorpedo_On_Board(data).FTorpedo_POH.Aspect_Angle = TTorpedo_On_Board(FSelectedPoint).FTorpedo_POH.Aspect_Angle then
      begin
        FProbabilityPointList.Delete(i);
        Break;
      end;
    end;

    pointIndex := GetPointPosition(newAspect, newProbability / 100);
    FProbabilityPointList.Insert(pointIndex, TTorpedo_On_Board(FSelectedPoint));

    btnApply.Enabled := True;
  end;

  UpdateProbabilityGraphForm;
end;

{$ENDREGION}

{$REGION ' Filter User Handle '}
procedure TfrmTorpedoProbabilityGraphic.edtProbabilityMaxKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key = #13 then
//  begin
//    if StrToFloat(edtProbabilityMax.Text) <= FProbabilityMin  then
//    begin
//      ShowMessage('Invalid value');
//      edtProbabilityMax.Text := FormatFloat('0.00', FProbabilityMax);
//      Exit;
//    end;
//
//    FProbabilityMax := StrToFloat(edtProbabilityMax.Text);
//    UpdateProbabilityGraphForm;
//  end;
end;

procedure TfrmTorpedoProbabilityGraphic.edtProbabilityMinKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key = #13 then
//  begin
//    if StrToFloat(edtProbabilityMin.Text) >= FProbabilityMax  then
//    begin
//      ShowMessage('Invalid value');
//      edtProbabilityMin.Text := FormatFloat('0.00', FProbabilityMin);
//      Exit;
//    end;
//
//    FProbabilityMin := StrToFloat(edtProbabilityMin.Text);
//    UpdateProbabilityGraphForm;
//  end;
end;

{$ENDREGION}

{$REGION ' Function Handle '}
procedure TfrmTorpedoProbabilityGraphic.DrawGrid;
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

    diffX := FGrid.Width / ((FAspectMax - FAspectMin) / aspectDiff);
    diffY := FGrid.Height /
      ((FProbabilityMax - FProbabilityMin) / probabilityDiff);

    Font.Size := 10;

    i := 1;
    while Round(FGrid.Left + (i * diffX)) <= FGrid.Right do
    begin
      if i mod 2 = 0 then
      begin
        Pen.Color := clGray;
        Pen.Style := psDot;
        MoveTo(Round(FGrid.Left + (i * diffX)), FGrid.Top);
        LineTo(Round(FGrid.Left + (i * diffX)), FGrid.Bottom);

        case aspectDiffMode of
          1, 2: valueStr := FormatFloat('0', FAspectMin + (i * aspectDiff));
          3: valueStr := FormatFloat('0.#', FAspectMin + (i * aspectDiff));
        end;

        TextOut(
          Round(FGrid.Left + (i * diffX) - 3 - ((Length(valueStr) - 1) * 3)),
          FGrid.Bottom + 6, valueStr);
      end;

      Pen.Color := clBlack;
      Pen.Style := psSolid;
      MoveTo(Round(FGrid.Left + (i * diffX)), FGrid.Bottom - 2);
      LineTo(Round(FGrid.Left + (i * diffX)), FGrid.Bottom + 3);

      Inc(i);
    end;

    i := 1;
    while Round(FGrid.Bottom - (i * diffY)) >= FGrid.Top do
    begin
      if i mod 2 = 0 then
      begin
        Pen.Color := clGray;
        Pen.Style := psDot;
        MoveTo(FGrid.Left, Round(FGrid.Bottom - (i * diffY)));
        LineTo(FGrid.Right, Round(FGrid.Bottom - (i * diffY)));

        case probabilityDiffMode of
          1, 2: valueStr := FormatFloat('0',
            FProbabilityMin + (i * probabilityDiff));
          3: valueStr := FormatFloat('0.#',
            FProbabilityMin + (i * probabilityDiff));
        end;

        TextOut(FGrid.Left - 10 - ((Length(valueStr) - 1) * 7),
          Round(FGrid.Bottom - (i * diffY) - 8), valueStr);
      end;

      Pen.Color := clBlack;
      Pen.Style := psSolid;
      MoveTo(FGrid.Left - 2, Round(FGrid.Bottom - (i * diffY)));
      LineTo(FGrid.Left + 3, Round(FGrid.Bottom - (i * diffY)));

      Inc(i);
    end;

    Pen.Color := clBlack;
    Pen.Style := psSolid;

    valueStr := FormatFloat('0', FAspectMin);
    MoveTo(FGrid.Left - 2, FGrid.Bottom);
    LineTo(FGrid.Right, FGrid.Bottom);
    TextOut(FGrid.Left - 3 - ((Length(valueStr) - 1) * 3), FGrid.Bottom + 6,
      valueStr);

    valueStr := FormatFloat('0', FProbabilityMin);
    MoveTo(FGrid.Left, FGrid.Top);
    LineTo(FGrid.Left, FGrid.Bottom + 3);
    TextOut(FGrid.Left - 10 - ((Length(valueStr) - 1) * 7), FGrid.Bottom - 8,
      valueStr);

    {label}
    Font.Size := 12;

    probabilityLabel := 'Probability of Hit (%)';
    aspectLabel := 'Aspect (nm)';

    TextOut(FGrid.Left, FGrid.Top - 40, probabilityLabel);
    TextOut(FGrid.CenterX - Round((Length(aspectLabel) - 1) * 7 / 2), FGrid.Bottom + 30, aspectLabel);
  end;
end;

procedure TfrmTorpedoProbabilityGraphic.DrawPoint;
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

      with TTorpedo_On_Board(data).FTorpedo_POH do
      begin
        if (Aspect_Angle < FAspectMin) or (Aspect_Angle > FAspectMax) or ((POH_Modifier * 100) < FProbabilityMin) or ((POH_Modifier * 100) > FProbabilityMax) then
          Continue;

        ConvertValueToPosition(Aspect_Angle, POH_Modifier, newX, newY);
      end;

      Pen.Style := psSolid;
      Pen.Color := clBlack;

      if Assigned(FSelectedPoint) and (data = FSelectedPoint) then
      begin
        Brush.Color := clBlack;
        Brush.Style := bsSolid;
      end
      else
        Brush.Style := bsClear;

      Ellipse(newX - 3, newY - 3, newX + 4, newY + 4);

      if pointID = 0 then
      begin
        oldX := newX;
        oldY := newY;
        MoveTo(oldX, oldY);
      end
      else
      begin
        LineTo(newX, newY);
        oldX := newX;
        oldY := newY;
        MoveTo(oldX, oldY);
      end;

      Inc(pointID);
    end;
  end;
end;

procedure TfrmTorpedoProbabilityGraphic.ConvertPositionToValue(const aX, aY: Integer; var aAspect, aProbability: Double);
var
  posPercent : Double;
begin
  posPercent := (aX - FGrid.Left) / (FGrid.Right - FGrid.Left);
  aAspect := FAspectMin + ((FAspectMax - FAspectMin) * posPercent);

  posPercent := (FGrid.Bottom - aY) / (FGrid.Bottom - FGrid.Top);
  aProbability := FProbabilityMin + ((FProbabilityMax - FProbabilityMin) * posPercent);
end;

procedure TfrmTorpedoProbabilityGraphic.ConvertValueToPosition(const aAspect, aProbability: Double; var aX, aY: Integer);
var
  posPercent : Double;
begin
  posPercent := (aAspect - FAspectMin) / (FAspectMax - FAspectMin);
  aX := FGrid.Left + Round((FGrid.Right - FGrid.Left) * posPercent);

  posPercent := ((aProbability * 100) - FProbabilityMin) / (FProbabilityMax - FProbabilityMin);
  aY := FGrid.Bottom - Round((FGrid.Bottom - FGrid.Top) * posPercent);
end;

function TfrmTorpedoProbabilityGraphic.GetPointPosition(const aAspect, aProbability: Double): Integer;
var
  i : Integer;
  data : TObject;
begin
  Result := 0;

  for i := 0 to FProbabilityPointList.Count - 1 do
  begin
    data := FProbabilityPointList.Items[i];

    with TTorpedo_On_Board(data).FTorpedo_POH do
    begin
      if aAspect < Aspect_Angle then
      begin
        Result := i;
        Break;
      end;
    end;

    if i = FProbabilityPointList.Count - 1 then
      Result := FProbabilityPointList.Count;
  end;
end;

{$ENDREGION}

end.
