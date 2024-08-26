unit uPlottingEditor;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, OleCtrls, MapXLib_TLB, Windows, StdCtrls, ComCtrls, ToolWin, ExtCtrls,
  Buttons, uDBEditSetting, uBaseCoordSystem, uCoordConvertor, tttData,
  uDrawStrategi, uMapXHandler, uMainPlottingShape, uDBAsset_FontTaktis, uSimbolTaktis,
  Grids, System.ImageList;

type
  TfmPlottingEditor = class(TForm)
    pnl1: TPanel;
    tlbMap: TToolBar;
    btnDecreaseScale: TToolButton;
    cbbSetScale: TComboBox;
    btnIncreaseScale: TToolButton;
    btnZoom: TToolButton;
    btnMove: TToolButton;
    btnCenterGame: TToolButton;
    pnl2: TPanel;
    mp1: TMap;
    ImageList1: TImageList;
    grpCursorPosition: TGroupBox;
    lblBearing: TLabel;
    lblDistance: TLabel;
    lblSlPosition: TLabel;
    lblnmSGrid: TLabel;
    lblWPosition: TLabel;
    lblnmWGrid: TLabel;
    lbl47: TLabel;
    lbl16: TLabel;
    lbl19: TLabel;
    lbl24: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl75: TLabel;
    lbl76: TLabel;
    lbl77: TLabel;
    grpPanel: TGroupBox;
    pnlIntelegent: TPanel;
    grpButton: TGroupBox;
    btnApply: TButton;
    btnDelete: TButton;
    btnClose: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lblIntelName: TLabel;
    edtLongIntel: TEdit;
    edtLattIntel: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    btnPositionIntel: TSpeedButton;
    lbl5: TLabel;
    pnlRadar: TPanel;
    lbl6: TLabel;
    lbl7: TLabel;
    lblRadarName: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    btnPosRadar: TSpeedButton;
    lbl11: TLabel;
    edtLongRadar: TEdit;
    edtLattRadar: TEdit;
    edtRadius: TEdit;
    mmoInfo: TMemo;
    pnlArrow: TPanel;
    lbl8: TLabel;
    lbl12: TLabel;
    lblArrowName: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    btnStartPos: TSpeedButton;
    edtStartLong: TEdit;
    edtStartLatt: TEdit;
    lbl17: TLabel;
    edtEndLong: TEdit;
    lbl18: TLabel;
    edtEndLatt: TEdit;
    btnEndPos: TSpeedButton;
    pnlLogistic: TPanel;
    lbl13: TLabel;
    lbl20: TLabel;
    lblLogisticName: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    btnPosLog: TSpeedButton;
    lbl25: TLabel;
    edtLongLog: TEdit;
    edtLattLog: TEdit;
    btnEditLog: TButton;
    btnDeleteLog: TButton;
    btnClearLog: TButton;
    btnInsertLog: TButton;
    pnlBase: TPanel;
    lbl21: TLabel;
    lbl26: TLabel;
    lblBaseName: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    btnPosBase: TSpeedButton;
    lbl30: TLabel;
    edtLongBase: TEdit;
    edtLattBase: TEdit;
    btnEditBase: TButton;
    btnDeleteBase: TButton;
    btnClearBase: TButton;
    btnInsertBase: TButton;
    lvLogistic: TListView;
    lvBase: TListView;
    cbbStatus: TComboBox;
    edtItemLog: TEdit;
    lbl27: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    edtQty: TEdit;
    btnplatform: TButton;
    edtPlatform: TEdit;
    btnSelect: TButton;
    lbl34: TLabel;
    lblSymbolTaktis: TLabel;
    bvl1: TBevel;
    btnEdit: TButton;
    procedure FormShow(Sender: TObject);
    procedure mp1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnPositionIntelClick(Sender: TObject);
    procedure mp1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure mp1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mp1DrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull,
      RectInvalid: IDispatch);
      {fajar}
    procedure btnHandlerPlottingEditor(Sender : TObject);
    procedure btnHandlerTableEditor(Sender : TObject);
    procedure lvLogisticSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvBaseSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnDecreaseScaleClick(Sender: TObject);
    procedure mp1MapViewChanged(Sender: TObject);
    procedure cbbSetScaleChange(Sender: TObject);
    procedure btnIncreaseScaleClick(Sender: TObject);
    procedure btnZoomClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure btnPosRadarClick(Sender: TObject);
    procedure btnStartPosClick(Sender: TObject);
    procedure btnEndPosClick(Sender: TObject);
    procedure btnPosLogClick(Sender: TObject);
    procedure btnPosBaseClick(Sender: TObject);
    procedure btnplatformClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCenterGameClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
   xx, yy : Double;
   mx, my : double;
   FColor : Integer;
   ApplyCount : Integer;
   StartPos : Boolean;

   FTagObjectPosition : Integer;
   FDraw : TMainPlottingShape;

   DrawFlagPoint : TDrawFlagPoint;
   procedure Aplly;

   procedure AplIntel;
   procedure AplLog;
   procedure AplBase;
   procedure AplPanah;
   procedure AplRadar;
   procedure getGridCursorPos;
   procedure FillPosEdt;
   procedure RefreshMousePointer;
   procedure ClearFlagPoint;
   procedure ClearFlistPlotting;
   procedure FlagPoint( mx, my : double);
   function CekInsert(IdObject : integer): Boolean;
   function CekInput(IdObject : integer): Boolean;

   procedure Canceled;

    { Private declarations }
  public
    { Public declarations }
    FFileCopy : string;
    ListFontTaktis : TList;
    isedit : Boolean;
    FTagApply : Integer;
    MouseIsDown, isCapturingScreen : Boolean;
    Converter : TCoordConverter;
    FMapPlatform : TSimMap;
    FCanvas : TCanvas;
    FFileName : string;
    FEdtColor : Integer;
    DrawPlotting : TDrawStrategi;
    FontTaktis : TFontTaktis;
    FontIndexTaktis : Integer;
    IdTaktis : Integer;
    centLong, centLatt  : double;
    procedure LoadPlotting(fFile : string);
    procedure ShowPanel(id : integer);
    procedure ShowDataToPanel;
    procedure ClearInput;
    procedure RefresForm;
    procedure RefresBtn;
    procedure SetCbScale;
    procedure RefresPos(PosX, PosY : Double);
    property Color : Integer read FColor write FColor;
  end;

var
  fmPlottingEditor: TfmPlottingEditor;

implementation
uses ufrmSummaryPlotting, Math;
{$R *.dfm}

procedure TfmPlottingEditor.AplBase;
var
  PangkalanPlot : TPangkalanPlotting;
  TempVehicle : TVehicleOnBase;
  I : Integer;
begin
  if CekInput(plPangkalan) then
    Exit;
  ClearFlagPoint;
  PangkalanPlot := TPangkalanPlotting.Create(Converter);
  PangkalanPlot.Name := lblBaseName.Caption;
  PangkalanPlot.color := FColor;
  PangkalanPlot.idTaktis := IdTaktis;
  PangkalanPlot.postCenter.X := dmsToLong(edtLongBase.Text);
  PangkalanPlot.postCenter.Y := dmsToLatt(edtLattBase.Text);
  PangkalanPlot.TableProp.X := dmsToLong(edtLongBase.Text);
  PangkalanPlot.TableProp.Y := dmsToLatt(edtLattBase.Text);
  PangkalanPlot.isRepostProperty := False;
  PangkalanPlot.isRepostPlot := False;
  if lvBase.Items.Count > 0 then
  begin
    for I := 0 to lvBase.Items.Count - 1 do
    begin
      TempVehicle := TVehicleOnBase.create;
      TempVehicle.Name := lvBase.Items[I].Caption;
      TempVehicle.Quantity := StrToInt(lvBase.Items[I].SubItems[0]);
      TempVehicle.Simbol := (lvBase.Items[I].SubItems[1]);
      TPangkalanPlotting(PangkalanPlot).VehiclesList.Add(TempVehicle);
    end;
  end;
  DrawPlotting.FList.Add(PangkalanPlot);
  ApplyCount := 1;
  RefresForm;

end;

procedure TfmPlottingEditor.AplIntel;
var
  IntelejenPlot : TIntelijenPlotting;
  I: Integer;
  TempInfo : TIntelijenInfo;
begin
  if CekInput(plIntelijen) then
    Exit;

  ClearFlagPoint;
  IntelejenPlot := TIntelijenPlotting.Create(Converter);
  IntelejenPlot.Name := lblIntelName.Caption;
  IntelejenPlot.color := FColor;
  IntelejenPlot.postCenter.X := dmsToLong(edtLongIntel.Text);
  IntelejenPlot.postCenter.Y := dmsToLatt(edtLattIntel.Text);
  IntelejenPlot.TableProp.X := dmsToLong(edtLongIntel.Text);
  IntelejenPlot.TableProp.Y := dmsToLatt(edtLattIntel.Text);
  IntelejenPlot.isRepostPlot := False;
  IntelejenPlot.isRepostProperty := False;
  for I := 0 to mmoInfo.Lines.Count - 1 do
  begin
    TempInfo := TIntelijenInfo.create;
    TempInfo.Info := mmoInfo.Lines.Strings[i];
    IntelejenPlot.InfoList.Add(TempInfo);
  end;
  DrawPlotting.FList.Add(IntelejenPlot);
  ApplyCount := 1;
  RefresForm;
end;

procedure TfmPlottingEditor.AplLog;
var
  LogisticPlot : TLogisticPlotting;
  TempLog : TLogisticOnBase;
  I: Integer;
begin
  if CekInput(plLogistic) then
    Exit;
  ClearFlagPoint;
  LogisticPlot := TLogisticPlotting.Create(Converter);
  LogisticPlot.Name := lblLogisticName.Caption;
  LogisticPlot.color := FColor;
  LogisticPlot.postCenter.X := dmsToLong(edtLongLog.Text);
  LogisticPlot.postCenter.Y := dmsToLatt(edtLattLog.Text);
  LogisticPlot.TableProp.X := dmsToLong(edtLongLog.Text);
  LogisticPlot.TableProp.Y := dmsToLatt(edtLattLog.Text);
  LogisticPlot.isRepostProperty := False;
  LogisticPlot.isRepostPlot := False;
  if lvLogistic.Items.Count > 0 then
  begin
    for I := 0 to lvLogistic.Items.Count - 1 do
    begin
      TempLog := TLogisticOnBase.create;
      TempLog.Name := lvLogistic.Items[I].Caption;
      TempLog.Status := lvLogistic.Items[I].SubItems[0];
      TLogisticPlotting(LogisticPlot).LogisticList.Add(TempLog);
    end;
  end;
  DrawPlotting.FList.Add(LogisticPlot);
  ApplyCount := 1;
  RefresForm;
end;

procedure TfmPlottingEditor.Aplly;
begin
  if ApplyCount = 0 then
  begin
    case FTagApply of
    plIntelijen : AplIntel;
    plLogistic  : AplLog;
    plRadar     : AplRadar;
    plPangkalan : AplBase;
    plPanah     : AplPanah;
    end;
    mp1.Refresh;
    mp1.Repaint;
  end;
end;

procedure TfmPlottingEditor.AplPanah;
var
  PanahPlot : TPanahPlotting;

begin
  if CekInput(plPanah) then
    Exit;
  ClearFlagPoint;
  PanahPlot := TPanahPlotting.Create(Converter);
  PanahPlot.Name := lblArrowName.Caption;
  PanahPlot.color := FColor;
  PanahPlot.postCenter.X := dmsToLong(edtStartLong.Text);
  PanahPlot.postCenter.y := dmsToLatt(edtStartLatt.Text);
  PanahPlot.postEnd.X := dmsToLong(edtEndLong.Text);
  PanahPlot.postEnd.y := dmsToLatt(edtEndLatt.Text);

  DrawPlotting.FList.Add(PanahPlot);
  ApplyCount := 1;
  RefresForm;
end;

procedure TfmPlottingEditor.AplRadar;
var
  RadarPlot : TRadarPlotting;
begin
  if CekInput(plRadar) then
    Exit;
  ClearFlagPoint;
  RadarPlot := TRadarPlotting.Create(Converter);
  RadarPlot.Name := lblRadarName.Caption;
  RadarPlot.color := FColor;
  RadarPlot.postCenter.X := dmsToLong(edtLongRadar.Text);
  RadarPlot.postCenter.Y := dmsToLatt(edtLattRadar.Text);
  RadarPlot.Radius := StrToFloat(edtRadius.Text);

  DrawPlotting.FList.Add(RadarPlot);
  ApplyCount := 1;
  RefresForm;
end;

procedure TfmPlottingEditor.btnCenterGameClick(Sender: TObject);
begin
  mp1.CenterX := centLong;
  mp1.CenterY := centLatt;
  RefreshMousePointer;
end;

procedure TfmPlottingEditor.btnDecreaseScaleClick(Sender: TObject);
begin
  if cbbSetScale.ItemIndex > 0 then
  begin
    cbbSetScale.ItemIndex := cbbSetScale.ItemIndex - 1;
    btnIncreaseScale.Enabled := true;
  end;

  cbbSetScaleChange(cbbSetScale);

  if cbbSetScale.ItemIndex = 0 then
    btnDecreaseScale.Enabled := false
  else
   btnDecreaseScale.Enabled := true;
end;

procedure TfmPlottingEditor.btnEndPosClick(Sender: TObject);
begin
  mp1.CurrentTool := mtAddPlotting;
  FTagObjectPosition := btnEndPos.Tag;
end;

procedure TfmPlottingEditor.btnHandlerPlottingEditor(Sender: TObject);
begin
  case TButton(Sender).Tag of
  0: {Apply}
  begin
    RefreshMousePointer;
    Aplly;
  end;
  1: {Delete}
  begin
    ClearInput;
    RefreshMousePointer;
    ClearFlistPlotting;
    ApplyCount := 0;
    RefresForm;
  end;
  2: {Close}
  begin
    RefreshMousePointer;
    ClearInput;
    Close;
    Canceled;
  end;
  3: {Edit}
  begin
    ClearFlistPlotting;
    ApplyCount := 0;
    Aplly;
  end;
  end;
end;

procedure TfmPlottingEditor.btnHandlerTableEditor(Sender: TObject);
begin
  case TButton(Sender).Tag of
  0:  {Insert item Logistic}
  begin
    if CekInsert(plLogistic)  then
      Exit;
    with lvLogistic.Items.Add do
    begin
      Caption := edtItemLog.Text;
      SubItems.Add(cbbStatus.Text);
    end;
    edtItemLog.Text := '';
    cbbStatus.Text := '';
    edtItemLog.SetFocus;
  end;
  1: {Edit item Logistic}
  begin
    if Assigned(lvLogistic.Selected) then
    begin
      if CekInsert(plLogistic)  then
      Exit;
      lvLogistic.Selected.Caption := edtItemLog.Text;
      lvLogistic.Selected.SubItems[0] := cbbStatus.Text;
    end;
    edtItemLog.Text := '';
    cbbStatus.Text := '';
    edtItemLog.SetFocus;
  end;
  2: {Delete item Logistic}
  begin
    lvLogistic.DeleteSelected;
    edtItemLog.Text := '';
    cbbStatus.Text := '';
    edtItemLog.SetFocus;
  end;
  3: {Clear item Logistic}
  begin
    lvLogistic.Items.Clear;
    edtItemLog.Text := '';
    cbbStatus.Text := '';
    edtItemLog.SetFocus;
  end;
  4: {Insert vehicle Pangkalan}
  begin
    if CekInsert(plPangkalan) then
      Exit;
    with lvBase.Items.Add do
    begin
      Caption := edtPlatform.Text;
      SubItems.Add(edtQty.Text);
      SubItems.Add(lblSymbolTaktis.Caption);
    end;
    edtPlatform.Text := '';
    edtQty.Text := '';
    lblSymbolTaktis.Caption:='';
    FontIndexTaktis := 0;
    edtPlatform.SetFocus;
  end;
  5: {Edit vehicle Pangkalan}
  begin
    if Assigned(lvBase.Selected) then
    begin
      if CekInsert(plPangkalan) then
      Exit;
      lvBase.Selected.Caption := edtPlatform.Text;
      lvBase.Selected.SubItems[0] := edtQty.Text;
      lvBase.Selected.SubItems[1] := (lblSymbolTaktis.Caption);
      edtPlatform.Text := '';
      edtQty.Text := '';
      lblSymbolTaktis.Caption:='';
      FontIndexTaktis := 0;
      edtPlatform.SetFocus;
    end;
  end;
  6: {Delete vehicle Pangkalan}
  begin
    lvBase.DeleteSelected;
    edtPlatform.Text := '';
    edtQty.Text := '';
    lblSymbolTaktis.Caption:='';
    FontIndexTaktis := 0;
    edtPlatform.SetFocus;
  end;
  7: {Clear vehicle Pangkalan}
  begin
    lvBase.Items.Clear;
    edtPlatform.Text := '';
    edtQty.Text := '';
    lblSymbolTaktis.Caption:='';
    FontIndexTaktis := 0;
    edtPlatform.SetFocus;
  end;
  end;
end;

procedure TfmPlottingEditor.btnIncreaseScaleClick(Sender: TObject);
begin
if (cbbSetScale.ItemIndex <= 500) then
  begin
    cbbSetScale.ItemIndex := cbbSetScale.ItemIndex + 1;
    btnDecreaseScale.Enabled := true;
  end;

  cbbSetScaleChange(cbbSetScale);

  if (cbbSetScale.ItemIndex = 0) then // sampai batas akhir  //10
    btnIncreaseScale.Enabled := true // false
  else
    btnIncreaseScale.Enabled := true;

  RefreshMousePointer;
end;

procedure TfmPlottingEditor.btnMoveClick(Sender: TObject);
begin
  mp1.CurrentTool  := mtPan;
end;

procedure TfmPlottingEditor.btnplatformClick(Sender: TObject);
begin
  frmSimbolTaktis.FontType := 0;
  frmSimbolTaktis.drwgrdFontTaktis.RowCount := 184;
  frmSimbolTaktis.ShowModal;
end;

procedure TfmPlottingEditor.btnPosBaseClick(Sender: TObject);
begin
  ClearFlagPoint;
  mp1.CurrentTool := mtAddPlotting;
  FTagObjectPosition := btnPosBase.Tag;
end;

procedure TfmPlottingEditor.btnPositionIntelClick(Sender: TObject);
begin
  ClearFlagPoint;
  mp1.CurrentTool := mtAddPlotting;
  FTagObjectPosition := btnPositionIntel.Tag;
end;

procedure TfmPlottingEditor.btnPosLogClick(Sender: TObject);
begin
  ClearFlagPoint;
  mp1.CurrentTool := mtAddPlotting;
  FTagObjectPosition := btnPosLog.Tag;
end;

procedure TfmPlottingEditor.btnPosRadarClick(Sender: TObject);
begin
  ClearFlagPoint;
  mp1.CurrentTool := mtAddPlotting;
  FTagObjectPosition := btnPosRadar.Tag;
end;

procedure TfmPlottingEditor.btnSelectClick(Sender: TObject);
begin
  mp1.CurrentTool := mtSelectObject;
end;

procedure TfmPlottingEditor.btnStartPosClick(Sender: TObject);
begin
  ClearFlagPoint;
  mp1.CurrentTool := mtAddPlotting;
  FTagObjectPosition := btnStartPos.Tag;
end;

procedure TfmPlottingEditor.btnZoomClick(Sender: TObject);
begin
  if btnZoom.Down then
     btnZoom.Down := False;
  mp1.CurrentTool  := miZoomInTool;
end;

procedure TfmPlottingEditor.Canceled;
var
  j : Integer;
  plot : TMainPlottingShape;
begin
  for j := 0 to DrawPlotting.FList.Count - 1 do
  begin
    plot := DrawPlotting.FList.Items[j];
    plot.isSelected := False;
  end;
  mp1.Repaint;
end;

procedure TfmPlottingEditor.cbbSetScaleChange(Sender: TObject);
var
  z: Double;
  s: string;
begin
  mp1.OnMapViewChanged := nil;
  if cbbSetScale.ItemIndex < 0 then
    Exit;

  if (cbbSetScale.ItemIndex <= 500) then
  begin
    s := cbbSetScale.Items[cbbSetScale.ItemIndex];
    try
      z := StrToFloat(s);
      mp1.ZoomTo(z, mp1.CenterX, mp1.CenterY);
    finally

    end;
  end
  else
    cbbSetScale.ItemIndex  := cbbSetScale.ItemIndex - 1;
  mp1.OnMapViewChanged   := mp1MapViewChanged;

  RefreshMousePointer;
end;

function TfmPlottingEditor.CekInput(IdObject: integer): Boolean;
begin
  Result := False;
  case IdObject of
  plIntelijen:
  begin
    if (edtLongIntel.Text = '') or (edtLattIntel.Text = '') or
      (mmoInfo.Text = '')  then
      Result := True;
  end;
  plLogistic:
  begin
    if (edtLongLog.Text = '') or (edtLattLog.Text = '') or
      (lvLogistic.Items.Count = 0) then
      Result := True;
  end;
  plRadar:
  begin
    if (edtLongRadar.Text = '') or (edtLattRadar.Text = '') or
      (edtRadius.Text = '') then
      Result := True;
  end;
  plPangkalan:
  begin
    if (edtLongBase.Text = '') or (edtLattBase.Text = '') or
      (lvBase.Items.Count = 0) then
      Result := True;
  end;
  plPanah:
  begin
    if (edtStartLong.Text = '') or (edtStartLatt.Text = '') or
       (edtEndLong.Text = '') or (edtEndLatt.Text = '')  then
      Result := True;
  end;
  end;
  if Result then
    MessageDlg('Incomplete Data Input', mtInformation, [mbOK],0, mbOK);
end;

function TfmPlottingEditor.CekInsert(IdObject: integer): Boolean;
begin
  Result := False;
  case IdObject of
  plPangkalan:
  begin
    if (edtPlatform.Text = '') or (edtQty.Text = '') or (lblSymbolTaktis.Caption ='') then
      Result := True;
  end;
  plLogistic:
  begin
    if (edtItemLog.Text = '') or (cbbStatus.Text ='') then
      Result := True;
  end;
  end;
  if Result then
    MessageDlg('Incomplete Data Input', mtInformation, [mbOK],0, mbOK);
end;

procedure TfmPlottingEditor.ClearFlagPoint;
begin
  DrawFlagPoint.FList.Clear;
  mp1.Refresh;
  mp1.Repaint;
end;

procedure TfmPlottingEditor.ClearFlistPlotting;
begin
  DrawPlotting.FList.Clear;
  mp1.Refresh;
  mp1.Repaint;
end;

procedure TfmPlottingEditor.ClearInput;
begin
  edtLongIntel.Text := '';
  edtLattIntel.Text := '';
  mmoInfo.Text      := '';

  edtLongLog.Text :='';
  edtLattLog.Text := '';
  edtItemLog.Text := '';
  cbbStatus.Text  := '';
  lvLogistic.Items.Clear;

  edtLongBase.Text := '';
  edtLattBase.Text := '';
  edtPlatform.Text := '';
  edtQty.Text      := '';
  lblSymbolTaktis.Caption := '';
  lvBase.Items.Clear;

  edtLongRadar.Text := '';
  edtLattRadar.Text := '';
  edtRadius.Text    := '';

  edtStartLong.Text := '';
  edtStartLatt.Text := '';
  edtEndLong.Text   := '';
  edtEndLatt.Text   := '';
end;

procedure TfmPlottingEditor.FillPosEdt;
begin
  case FTagObjectPosition of
  0:
  begin
    edtLongIntel.Text := formatDMS_long(mx);
    edtLattIntel.Text := formatDMS_latt(my);
  end;
  1:
  begin
    edtLongLog.Text := formatDMS_long(mx);
    edtLattLog.Text := formatDMS_latt(my);
  end;
  2:
  begin
    edtLongBase.Text := formatDMS_long(mx);
    edtLattBase.Text := formatDMS_latt(my);
  end;
  3:
  begin
    edtStartLong.Text := formatDMS_long(mx);
    edtStartLatt.Text := formatDMS_latt(my);
    StartPos := True;
  end;
  4:
  begin
    edtEndLong.Text := formatDMS_long(mx);
    edtEndLatt.Text := formatDMS_latt(my);
    StartPos := False;
  end;
  5:
  begin
    edtLongRadar.Text := formatDMS_long(mx);
    edtLattRadar.Text := formatDMS_latt(my);
  end;
  end;
end;

procedure TfmPlottingEditor.FlagPoint(mx, my: double);
var
  ObjectFlagPoint : TFlagPoint;
begin
  ObjectFlagPoint := TFlagPoint.Create(Converter);
  ObjectFlagPoint.Post.X := mx;
  ObjectFlagPoint.Post.Y := my;
  DrawFlagPoint.FList.Add(ObjectFlagPoint);
end;

procedure TfmPlottingEditor.FormCreate(Sender: TObject);
begin
  mp1.DoubleBuffered := True;
  FMapPlatform  := TSimMap.Create(mp1);
  Converter := TCoordConverter.Create;
  Converter.FMap := Self.mp1;

  FMapPlatform.FMap.OnMouseMove     := mp1MouseMove;
  FMapPlatform.FMap.OnMouseDown     := mp1MouseDown;
  FMapPlatform.FMap.OnMouseUp       := mp1MouseUp;
  FMapPlatform.FMap.OnDrawUserLayer := mp1DrawUserLayer;

  FCanvas := TCanvas.Create;

  DrawPlotting := TDrawStrategi.Create;
  DrawPlotting.Converter := Converter;
  DrawFlagPoint := TDrawFlagPoint.Create;
  DrawFlagPoint.Converter := Converter;
  FDraw := TMainPlottingShape.create(Converter);
  FontTaktis := TFontTaktis.create;
  ListFontTaktis := TList.Create;
end;


procedure TfmPlottingEditor.FormDestroy(Sender: TObject);
begin
  ListFontTaktis.Free;
end;

procedure TfmPlottingEditor.FormShow(Sender: TObject);
var
  minfo : CMapXLayerInfo;
  mLayer : CMapXLayer;
begin
  mp1.Geoset := vAppDBSetting.MapDefView + '\Indonesia\' + 'Indonesia2.gst';
  mp1.DefaultStyle.RegionBackColor := TransparentColorValue;
  minfo := CoLayerInfo.Create;
  minfo.type_ := miLayerInfoTypeUserDraw;
  minfo.AddParameter('Name', 'LYR_DRAW');
  mLayer := mp1.Layers.Add(minfo, 1);
  mp1.Layers.AnimationLayer := mLayer;
  mp1.MapUnit := miUnitNauticalMile;
  centLong := mp1.CenterX;
  centLatt := mp1.CenterY;

  if not frmSummaryPlotting.isnew then
  begin
    if Assigned(FDraw) then
    begin
      //DrawPlotting.FList.Clear;
      RefresForm;
      if frmSummaryPlotting.StatusNameDat then
        LoadPlotting(vAppDBSetting.PlottingPath + '\' + frmSummaryPlotting.FNewName + '.dat' ) {new name}
      else
        LoadPlotting(vAppDBSetting.PlottingPath + '\' + frmSummaryPlotting.FOldName + '.dat' ); {old name}
      RefresForm;
      ApplyCount := 1 ;
      ShowDataToPanel;
    end;
  end
  else
  begin
    if DrawPlotting.FList.Count <> 0 then
    begin
      ShowDataToPanel;
      ApplyCount := 1;
      RefresForm;
    end
    else
    begin
      ClearInput;
      ApplyCount := 0;
    end;
  end;

  if frmSummaryPlotting.iscopy then
  begin
    if Assigned(FDraw) then
    begin
      DrawPlotting.FList.Clear;
      RefresForm;
      FFileCopy := frmSummaryPlotting.FFileName;
      LoadPlotting(vAppDBSetting.PlottingPath + '\' + FFileCopy + '.dat' );
      RefresForm;
      ShowDataToPanel;
    end;
  end;
  cbbSetScaleChange(Sender);
  RefresForm;
  RefresBtn;
end;

procedure TfmPlottingEditor.getGridCursorPos;
var
  yCursorPoint, xCursorPoint, yCenter, xCenter, diffX, diffY: Double;
  diffXnm, diffYnm: Double;
  gridLatt, gridLong, addStringX, addStringY: string;
begin
  yCursorPoint := yy;
  xCursorPoint := xx;

  yCenter := mp1.CenterY;
  xCenter := mp1.CenterX;

  diffY := Abs(yCursorPoint-yCenter);
  diffX := Abs(xCursorPoint - xCenter);
  diffYnm := diffY * 60;
  diffXnm := diffX * 60;

  if yCursorPoint < yCenter then
    addStringY := 'S'
  else
    addStringY := 'N';

  lblSlPosition.Caption := formatDM_latitude(yy);
  lblWPosition.Caption := formatDM_longitude(xx);
  gridLatt := FormatFloat('0.00', diffYnm);
  gridLong := FormatFloat('0.00', diffXnm);
  lblnmSGrid.Caption := gridLatt + ' nm ' + addStringY;
  lblnmWGrid.Caption := gridLong + ' nm ' + addStringX;
end;

procedure TfmPlottingEditor.LoadPlotting(fFile: string);
var
   Fs : TFileStream;
begin
  if not FileExists(fFile) then
    exit;
  DrawPlotting.edtcolor := FEdtColor;
  try
    Fs := TFileStream.Create(fFile, fmOPENREAD );
    if not frmSummaryPlotting.StatusNameDat then
    begin
      DrawPlotting.FChangeName := True;
      DrawPlotting.FNewName := frmSummaryPlotting.FNewName;
    end
    else
      DrawPlotting.FChangeName := False;
    DrawPlotting.ShowStreamData(Fs);
  except
    Showmessage('Can''t load file Plotting!' + #13);
  end;

  Fs.Free;
end;

procedure TfmPlottingEditor.lvBaseSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if Selected then
  begin
    btnEditBase.Enabled := True;
    btnDeleteBase.Enabled := True;
    btnInsertBase.Enabled := true;
    btnClearBase.Enabled := true;
    edtPlatform.Text := item.Caption;
    edtQty.Text := Item.SubItems[0];
    lblSymbolTaktis.Caption := ((Item.SubItems[1]));
  end
  else if Selected = false then
  begin
    btnEditBase.Enabled := False ;
    btnDeleteBase.Enabled := False ;
    btnInsertBase.Enabled := True ;
    btnClearBase.Enabled := True ;
  end;
end;

procedure TfmPlottingEditor.lvLogisticSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected then
  begin
    btnEditLog.Enabled := True;
    btnDeleteLog.Enabled := True;
    btnInsertLog.Enabled := False;
    btnClearLog.Enabled := False;
    edtItemLog.Text := Item.Caption;
    cbbStatus.Text := Item.SubItems[0];
  end
  else if Selected = false then
  begin
    btnEditLog.Enabled := False ;
    btnDeleteLog.Enabled := False ;
    btnInsertLog.Enabled := True ;
    btnClearLog.Enabled := True ;
  end;
end;

procedure TfmPlottingEditor.mp1DrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull,
  RectInvalid: IDispatch);
begin
  if not Assigned(FCanvas) then
    Exit;
  FCanvas.Handle := hOutputDC;
  DrawPlotting.Draw(FCanvas);
  DrawFlagPoint.Draw(FCanvas);
end;

procedure TfmPlottingEditor.mp1MapViewChanged(Sender: TObject);
var
  tempZoom : Double;
begin
  if mp1.CurrentTool = miZoomInTool then
  begin
    if mp1.Zoom <= 0.125 then
      tempZoom := 0.125;
    if (mp1.Zoom > 0.125) AND (mp1.Zoom < 1) then
      tempZoom := mp1.Zoom;
    if (mp1.Zoom >= 1) AND (mp1.Zoom <= 2500) then
      tempZoom := round(mp1.Zoom);
    if mp1.Zoom > 2500 then
      tempZoom := 2500;

    mp1.OnMapViewChanged := nil;
    mp1.ZoomTo(tempZoom, mp1.CenterX, mp1.CenterY);

    if (mp1.Zoom > 0.125) AND (mp1.Zoom < 0.25) then
    begin
      cbbSetScale.text := FormatFloat('0.000', tempZoom);
    end
    else if (mp1.Zoom >= 0.25) AND (mp1.Zoom < 0.5) then
    begin
      cbbSetScale.text := FormatFloat('0.00', tempZoom);
    end
    else if (mp1.Zoom >= 0.5) AND (mp1.Zoom < 1) then
    begin
      cbbSetScale.text := FormatFloat('0.0', tempZoom);
    end
    else
      cbbSetScale.text := floattostr(tempZoom);
    mp1.OnMapViewChanged := mp1MapViewChanged;
  end;
end;

procedure TfmPlottingEditor.mp1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  fpos: TPoint;
begin
  Converter.ConvertToMap(x, y, mx, my);
  Converter.ConvertToScreen(mx, my, fpos.X, fpos.Y );

  if mp1.CurrentTool = mtSelectObject then
  begin
    DrawPlotting.SelectProperty(fpos);
  end
  else if mp1.CurrentTool = mtAddPlotting then
  begin
    FillPosEdt;
    FlagPoint(mx, my);
    mp1.CurrentTool := mtSelectObject;
  end
  else if mp1.CurrentTool = mtPan then {Merubah center view game}
  begin
    mp1.CenterX := xx;
    mp1.CenterY := yy;

    RefreshMousePointer;
  end;
end;

procedure TfmPlottingEditor.mp1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Converter.ConvertToMap(X, Y, xx, yy);
    { all state }
  lblBearing.Caption  := FormatFloat('0.00', CalcBearing(mp1.CenterX,
    mp1.CenterY, xx, yy));
  lblDistance.Caption := FormatFloat('0.00', Converter.Distance_nmi(mp1.CenterX,
    mp1.CenterY, xx, yy));
  getGridCursorPos;
  if mp1.CurrentTool = mtSelectObject then
  begin
    DrawPlotting.ReposProperty(x,y);
  end;
  mp1.Repaint;
end;

procedure TfmPlottingEditor.mp1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  ix, iy : Double;
begin
  Converter.ConvertToMap(X, Y, ix, iy);
  DrawPlotting.RefreshPlot;
  RefresPos(ix,iy);
end;

procedure TfmPlottingEditor.RefresBtn;
begin
  btnInsertLog.Enabled := True;
  btnInsertBase.Enabled := True;
  btnEditLog.Enabled := False;
  btnEditBase.Enabled := False;
  btnDeleteLog.Enabled := False;
  btnDeleteBase.Enabled := False;
  btnClearLog.Enabled := False;
  btnClearBase.Enabled := False;

end;

procedure TfmPlottingEditor.RefresForm;
begin
  RefreshMousePointer;
  ClearFlagPoint;
  //ClearInput;
  if ApplyCount = 1 then
  begin
    btnEdit.Enabled := True;
    btnDelete.Enabled := True;
    btnApply.Enabled := False;
  end
  else
  begin
    btnEdit.Enabled := false;
    btnDelete.Enabled := false;
    btnApply.Enabled := true;
  end;
end;

procedure TfmPlottingEditor.RefreshMousePointer;
begin
  mp1.CurrentTool := mtNormalCursor;
end;

procedure TfmPlottingEditor.RefresPos(PosX, PosY : Double);
var
  I: Integer;
  plot : TMainPlottingShape;
begin
  for I := 0 to DrawPlotting.fList.Count - 1 do
  begin
    plot := DrawPlotting.FList.Items[i];
    if plot is TIntelijenPlotting then
    begin
      edtLongIntel.Text := formatDMS_long(PosX);
      edtLattIntel.Text := formatDMS_latt(PosY);
    end
    else
    if plot is TLogisticPlotting then
    begin
      edtLongLog.Text := formatDMS_long(PosX);
      edtLattlog.Text := formatDMS_latt(PosY);
    end
    else
    if plot is TRadarPlotting then
    begin
      edtLongRadar.Text := formatDMS_long(PosX);
      edtLattRadar.Text := formatDMS_latt(PosY);
    end
    else
    if plot is TPangkalanPlotting then
    begin
      edtLongBase.Text := formatDMS_long(PosX);
      edtLattBase.Text := formatDMS_latt(PosY);
    end
    else
    if plot is TPanahPlotting then
    begin
      if TPanahPlotting(plot).isPostEnd or not StartPos then
      begin
        edtEndLong.Text := formatDMS_long(PosX);
        edtEndLatt.Text := formatDMS_latt(PosY);
      end
      else
      begin
        edtStartLong.Text := formatDMS_long(PosX);
        edtStartLatt.Text := formatDMS_latt(PosY);
      end;
    end;
  end;
end;

procedure TfmPlottingEditor.SetCbScale;
var
  widthNM: Integer;
  limitWidth: Array [0 .. 15] of Double;
  arrayTemp: Array [0 .. 30] of Double;
  arrayStringTemp: Array [0 .. 30] of String;
  resultTemp: Array [0 .. 30] of String;
  a, b: Integer;
begin
  widthNM := Floor(2500);
//    osDynamic :  widthNM := Floor(16);
//  end;

  //  widthNM := floor(2500{uOverlayTemplateEditor.fmOverlayTemplateEditor.GameArea.FGameArea.Game_X_Dimension});

  // isi combo box
  cbbSetScale.clear;
  // widthNM := strtoint(ExerciseAreaForm.edtMaximum.Text);

  limitWidth[0] := 0.125;
  limitWidth[1] := 0.25;
  limitWidth[2] := 0.5;
  limitWidth[3] := 1;
  limitWidth[4] := 2;
  limitWidth[5] := 4;
  limitWidth[6] := 8;
  limitWidth[7] := 16;
  limitWidth[8] := 32;
  limitWidth[9] := 64;
  limitWidth[10] := 128;
  limitWidth[11] := 256;
  limitWidth[12] := 512;
  limitWidth[13] := 1024;
  limitWidth[14] := 2048;
  limitWidth[15] := 2500;

  a := 0;
  while limitWidth[a] < widthNM do
  begin
    arrayTemp[a] := limitWidth[a];
    a := a + 1;
  end;
  arrayTemp[a] := widthNM;

  for b := 0 to a do
    arrayStringTemp[b] := floattostr(arrayTemp[b]);

  for b := 0 to a do
  begin
    resultTemp[b] := arrayStringTemp[b];
    cbbSetScale.Items.add(resultTemp[b]);
  end;
end;

procedure TfmPlottingEditor.ShowDataToPanel;
var
  plot : TMainPlottingShape;
  i, k :Integer;
  Temp      : TIntelijenInfo;
  TempLog   : TLogisticOnBase;
  TempBase  : TVehicleOnBase;
begin
  for i := 0 to DrawPlotting.FList.Count - 1 do
  begin
    plot := DrawPlotting.FList[i];
    if plot is TIntelijenPlotting then
    begin
      ShowPanel(0);
      FTagApply := plIntelijen;
      lblIntelName.Caption := FFileName;
      edtLongIntel.Text := formatDMS_long(TIntelijenPlotting(plot).postCenter.X);
      edtLattIntel.Text := formatDMS_latt(TIntelijenPlotting(plot).postCenter.Y);
      FColor := TIntelijenPlotting(plot).color;
      for k := 0 to TIntelijenPlotting(plot).InfoList.Count - 1 do
      begin
        Temp := TIntelijenPlotting(plot).InfoList[k];
        mmoInfo.Lines.Add(Temp.Info);
      end;
    end
    else if plot is TLogisticPlotting then
    begin
      ShowPanel(1);
      FTagApply := plLogistic;
      lblLogisticName.Caption := FFileName;
      edtLongLog.Text := formatDMS_long(TLogisticPlotting(plot).postCenter.X);
      edtLattLog.Text := formatDMS_latt(TLogisticPlotting(plot).postCenter.Y);
      FColor := TLogisticPlotting(plot).color;
      lvLogistic.Items.Clear;
      for k := 0 to TLogisticPlotting(plot).LogisticList.Count - 1 do
      begin
        with lvLogistic.Items.Add do
        begin
          TempLog := TLogisticPlotting(plot).LogisticList[k];
          Caption := TempLog.Name;
          SubItems.Add(TempLog.Status);
        end;
      end
    end
    else if plot is TRadarPlotting then
    begin
      ShowPanel(2);
      FTagApply := plRadar;
      lblRadarName.Caption := FFileName;
      edtLongRadar.Text := formatDMS_long(TRadarPlotting(plot).postCenter.X);
      edtLattRadar.Text := formatDMS_latt(TRadarPlotting(plot).postCenter.Y);
      FColor := TRadarPlotting(plot).color;
      edtRadius.Text := FloatToStr(TRadarPlotting(plot).Radius);
    end
    else if plot is TPangkalanPlotting then
    begin
      ShowPanel(3);
      FTagApply := plPangkalan;
      lblBaseName.Caption := FFileName;
      edtLongBase.Text := formatDMS_long(TPangkalanPlotting(plot).postCenter.X);
      edtLattBase.Text := formatDMS_latt(TPangkalanPlotting(plot).postCenter.Y);
      FColor := TPangkalanPlotting(plot).color;
      for k := 0 to TPangkalanPlotting(plot).VehiclesList.Count - 1 do
      begin
        with lvBase.Items.Add do
        begin
          TempBase := TPangkalanPlotting(plot).VehiclesList[k];
          Caption := TempBase.Name;
          SubItems.Add(IntToStr(TempBase.Quantity));
          SubItems.Add(IntToStr(TempBase.IndexTaktis));
        end;
      end;
    end
    else if plot is TPanahPlotting then
    begin
      ShowPanel(4);
      FTagApply := plPanah;
      lblArrowName.Caption := FFileName;
      edtStartLong.Text := formatDMS_long(TPanahPlotting(plot).postCenter.X);
      edtStartLatt.Text := formatDMS_latt(TPanahPlotting(plot).postCenter.Y);
      edtEndLong.Text := formatDMS_long(TPanahPlotting(plot).postEnd.X);
      edtEndLatt.Text := formatDMS_latt(TPanahPlotting(plot).postEnd.Y);
      FColor := TPanahPlotting(plot).color;
    end;
  end;
  if (DrawPlotting.FList.Count = 0) then
  begin
    case frmSummaryPlotting.FIndexType of
    plIntelijen:
    begin
      lblIntelName.Caption := frmSummaryPlotting.PanelName;
      ClearInput;
      ShowPanel(frmSummaryPlotting.FIndexType);
      FTagApply := frmSummaryPlotting.FIndexType;
      Color := frmSummaryPlotting.acolor;

    end;
    plLogistic:
    begin
      lblLogisticName.Caption := frmSummaryPlotting.PanelName;
      ClearInput;
      ShowPanel(frmSummaryPlotting.FIndexType);
      FTagApply := frmSummaryPlotting.FIndexType;
      Color := frmSummaryPlotting.acolor;
    end;
    plRadar:
    begin
      lblRadarName.Caption := frmSummaryPlotting.PanelName;
      ClearInput;
      ShowPanel(frmSummaryPlotting.FIndexType);
      FTagApply := frmSummaryPlotting.FIndexType;
      Color := frmSummaryPlotting.acolor;
    end;
    plPangkalan:
    begin
      lblBaseName.Caption := frmSummaryPlotting.PanelName;
      ClearInput;
      ShowPanel(frmSummaryPlotting.FIndexType);
      FTagApply := frmSummaryPlotting.FIndexType;
      Color := frmSummaryPlotting.acolor;
    end;
    plPanah:
    begin
      lblArrowName.Caption := frmSummaryPlotting.PanelName;
      ClearInput;
      ShowPanel(frmSummaryPlotting.FIndexType);
      FTagApply := frmSummaryPlotting.FIndexType;
      Color := frmSummaryPlotting.acolor;
    end;
    end;
  end;
end;

procedure TfmPlottingEditor.ShowPanel(id: integer);
begin
  case id of
  0:
  begin
    pnlIntelegent.Visible := True;
    pnlLogistic.Visible := False;
    pnlBase.Visible := False;
    pnlArrow.Visible := false;
    pnlRadar.Visible := false;
  end;
  1:
  begin
    pnlIntelegent.Visible := false;
    pnlLogistic.Visible := true;
    pnlBase.Visible := False;
    pnlArrow.Visible := false;
    pnlRadar.Visible := false;
  end;
  2:
  begin
    pnlIntelegent.Visible := false;
    pnlLogistic.Visible := False;
    pnlRadar.Visible := true;
    pnlBase.Visible := false ;
    pnlArrow.Visible := false;
  end;
  3:
  begin
    pnlIntelegent.Visible := false;
    pnlLogistic.Visible := False;
    pnlRadar.Visible := false;
    pnlBase.Visible := true;
    pnlArrow.Visible := false;
  end;
  4:
  begin
    pnlIntelegent.Visible := false;
    pnlLogistic.Visible := False;
    pnlRadar.Visible := false;
    pnlBase.Visible := False;
    pnlArrow.Visible := true;
  end;
  end;
end;

end.
