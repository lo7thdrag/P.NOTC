unit ufrmOverlayEditor;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, uMapXHandler, uCoordConvertor, uDBAsset_GameEnvironment, {TeCanvas,}
  ColorGrd, tttData,
  uMainStaticShape, uMainDynamicShape, uDrawOverlay, uMainOverlay, newClassASTT,
  uFormula, RzButton, Menus, {acPNG,} System.ImageList, Vcl.Imaging.pngimage;

type
  E_OverlayMapCursor = (mcSelect, mcAdd, mcEdit, mcRulerStart, mcRulerEnd);
  E_ShapeColor = (scOutline, scFill);

  TOverlayEditorForm = class(TForm)
    pnlButton: TPanel;
    ImageList1: TImageList;
    pnlMap: TPanel;

    pnlLeft: TPanel;
    Map1: TMap;
    RzToolButton1: TRzToolButton;
    ToolBar1: TToolBar;
    btnIncrease: TToolButton;
    cbSetScale: TComboBox;
    btnDecrease: TToolButton;
    btnZoom: TToolButton;
    btnPan: TToolButton;
    btnCenterGame: TToolButton;
    grbColour: TGroupBox;
    colorChoose: TColorGrid;
    GroupBox8: TGroupBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    lblShape: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    pnlStatic: TPanel;
    grpNone: TGroupBox;
    grpLine: TGroupBox;
    SpeedButton1: TSpeedButton;
    Label47: TLabel;
    Label48: TLabel;
    SpeedButton2: TSpeedButton;
    edtLineStartPosLat: TEdit;
    edtLineStartPosLong: TEdit;
    edtLineEndPosLat: TEdit;
    edtLineEndPosLong: TEdit;
    grpArc: TGroupBox;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    SpeedButton7: TSpeedButton;
    edtArcPosLat: TEdit;
    edtArcPosLong: TEdit;
    edtArcRadius: TEdit;
    edtArcStartAngle: TEdit;
    edtArcEndAngle: TEdit;
    grpCircle: TGroupBox;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    SpeedButton5: TSpeedButton;
    edtCirclePosLong: TEdit;
    edtCircleRadius: TEdit;
    edtCirclePosLat: TEdit;
    grpEllipse: TGroupBox;
    Label63: TLabel;
    lblHorizontal: TLabel;
    Label78: TLabel;
    lblVertical: TLabel;
    lbl6: TLabel;
    bvl1: TBevel;
    Label79: TLabel;
    SpeedButton6: TSpeedButton;
    edtEllipsePosLat: TEdit;
    edtEllipsePosLong: TEdit;
    edtHorizontal: TEdit;
    edtVertical: TEdit;
    grpPolygon: TGroupBox;
    Label91: TLabel;
    SpeedButton10: TSpeedButton;
    btnDeletePoly: TSpeedButton;
    edtPolyPosLat: TEdit;
    edtPolyPosLong: TEdit;
    lvPolyVertex: TListView;
    grpRectangle: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    edtRectStartPosLat: TEdit;
    edtRectStartPosLong: TEdit;
    edtRectEndPosLat: TEdit;
    edtRectEndPosLong: TEdit;
    grpText: TGroupBox;
    lblTextPosition: TLabel;
    lblTextField: TLabel;
    lblTextSize: TLabel;
    SpeedButton: TSpeedButton;
    edtTextField: TEdit;
    cbbTextSize: TComboBox;
    edtTextPosLAt: TEdit;
    edtTextPosLong: TEdit;
    grpGrid: TGroupBox;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    bvl2: TBevel;
    lbl14: TLabel;
    lbl15: TLabel;
    SpeedButton9: TSpeedButton;
    Bevel9: TBevel;
    edtTablePosLat: TEdit;
    edtTablePosLong: TEdit;
    edtTableHeight: TEdit;
    edtTableWidth: TEdit;
    edtTableColumn: TEdit;
    edtTableRow: TEdit;
    edtTableRotationAngle: TEdit;
    grpSector: TGroupBox;
    lblSectorCenter: TLabel;
    lblSectorInner: TLabel;
    lblSectorOuter: TLabel;
    lblSectorStartAngle: TLabel;
    lblSectorEndAngle: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    bvlAngle: TBevel;
    lbl11: TLabel;
    lbl12: TLabel;
    SpeedButton8: TSpeedButton;
    edtSectorPosLat: TEdit;
    edtSectorInner: TEdit;
    edtSectorOuter: TEdit;
    edtSectorStartAngle: TEdit;
    edtSectorEndAngle: TEdit;
    edtSectorPosLong: TEdit;
    pnlDynamic: TPanel;
    grpTextD: TGroupBox;
    lbl17: TLabel;
    lbl18: TLabel;
    Label51: TLabel;
    edtTextRange: TEdit;
    edtTextFieldD: TEdit;
    edtTextBearing: TEdit;
    cbbTextSizeD: TComboBox;
    grpLineD: TGroupBox;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl23: TLabel;
    lbl25: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    edtLineStartRange: TEdit;
    edtLineStartBearing: TEdit;
    edtLineEndRange: TEdit;
    edtLineEndBearing: TEdit;
    grpRectangleD: TGroupBox;
    lbl26: TLabel;
    lbl27: TLabel;
    edtRecStartRange: TEdit;
    edtRecStartBearing: TEdit;
    edtRecEndRange: TEdit;
    edtRecEndBearing: TEdit;
    grpCircleD: TGroupBox;
    Label52: TLabel;
    lbl1: TLabel;
    lblCentre: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    edtCircleRange: TEdit;
    edtCircleBearing: TEdit;
    edtCircleRadiusD: TEdit;
    grpEllipseD: TGroupBox;
    Label4: TLabel;
    lbl48: TLabel;
    lbl50: TLabel;
    lbl51: TLabel;
    lbl52: TLabel;
    bvl4: TBevel;
    lbl49: TLabel;
    lbl79: TLabel;
    lbl80: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtEllipseRange: TEdit;
    edtEllipseBearing: TEdit;
    edtEllipseHorizontalD: TEdit;
    edtEllipseVerticalD: TEdit;
    grpArcD: TGroupBox;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    lbl46: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label3: TLabel;
    Label60: TLabel;
    edtArcRange: TEdit;
    edtArcBearing: TEdit;
    edtArcRadiusD: TEdit;
    edtArcStartAngleD: TEdit;
    edtArcEndAngleD: TEdit;
    grpSectorD: TGroupBox;
    lbl64: TLabel;
    lbl65: TLabel;
    lbl66: TLabel;
    lbl67: TLabel;
    lbl68: TLabel;
    lbl69: TLabel;
    lbl70: TLabel;
    lbl71: TLabel;
    lbl72: TLabel;
    bvl7: TBevel;
    bvl8: TBevel;
    lbl73: TLabel;
    lbl74: TLabel;
    edtSectorRange: TEdit;
    edtSectorInnerD: TEdit;
    edtSectorOuterD: TEdit;
    edtSectorStartAngleD: TEdit;
    edtSectorEndAngleD: TEdit;
    edtSectorBearing: TEdit;
    grpGridD: TGroupBox;
    lbl53: TLabel;
    lbl54: TLabel;
    lbl55: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl58: TLabel;
    lbl59: TLabel;
    bvl5: TBevel;
    lbl60: TLabel;
    bvl6: TBevel;
    lbl61: TLabel;
    lbl62: TLabel;
    Label44: TLabel;
    Bevel12: TBevel;
    edtTableRange: TEdit;
    edtTableBearing: TEdit;
    edtTableHeightD: TEdit;
    edtTableWidthD: TEdit;
    edtTableColumnD: TEdit;
    edtTableRowD: TEdit;
    edtRotationAngleD: TEdit;
    grpPolygonD: TGroupBox;
    AddPolyD: TSpeedButton;
    btnDeletePolyD: TSpeedButton;
    Label7: TLabel;
    edtPolygonRange: TEdit;
    edtPolygonBearing: TEdit;
    lvPolyVertexD: TListView;
    grpNoneD: TGroupBox;
    pmOverlayEdit: TPopupMenu;
    mniControl: TMenuItem;
    mnitoFront: TMenuItem;
    mnitoBack: TMenuItem;
    mniDelete: TMenuItem;
    N1: TMenuItem;
    Label8: TLabel;
    Label64: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    ilColor: TImageList;
    grpColorEditing: TGroupBox;
    btnNoFill: TStaticText;
    pnl1: TPanel;
    bvl9: TBevel;
    pnlOutline: TPanel;
    Label32: TLabel;
    lbl24: TLabel;
    lbl39: TLabel;
    lbl75: TLabel;
    lbl76: TLabel;
    lbl77: TLabel;
    lbl78: TLabel;
    bvl3: TBevel;
    lbl84: TLabel;
    lbl86: TLabel;
    lbl87: TLabel;
    Label34: TLabel;
    bvl11: TBevel;
    lbl92: TLabel;
    bvl12: TBevel;
    bvl13: TBevel;
    lbl96: TLabel;
    lbl97: TLabel;
    lbl98: TLabel;
    lbl94: TLabel;
    lbl99: TLabel;
    lbl100: TLabel;
    lbl101: TLabel;
    lbl102: TLabel;
    lbl103: TLabel;
    lbl104: TLabel;
    lbl105: TLabel;
    lbl106: TLabel;
    lbl107: TLabel;
    lbl108: TLabel;
    lbl109: TLabel;
    lbl110: TLabel;
    lbl111: TLabel;
    lbl112: TLabel;
    lbl113: TLabel;
    lbl114: TLabel;
    lbl115: TLabel;
    lbl116: TLabel;
    lbl117: TLabel;
    lbl118: TLabel;
    lbl119: TLabel;
    lbl120: TLabel;
    lbl121: TLabel;
    lbl122: TLabel;
    lbl123: TLabel;
    lbl124: TLabel;
    lbl125: TLabel;
    lbl126: TLabel;
    lbl127: TLabel;
    lbl128: TLabel;
    lbl129: TLabel;
    lbl130: TLabel;
    lbl131: TLabel;
    lbl132: TLabel;
    Bevel1: TBevel;
    lbl133: TLabel;
    lbl134: TLabel;
    lbl135: TLabel;
    lbl136: TLabel;
    lbl137: TLabel;
    Bevel2: TBevel;
    bvl14: TBevel;
    lbl138: TLabel;
    Label61: TLabel;
    Bevel4: TBevel;
    Label65: TLabel;
    Bevel5: TBevel;
    Label93: TLabel;
    Bevel3: TBevel;
    Label97: TLabel;
    Label98: TLabel;
    Bevel6: TBevel;
    GroupBox1: TGroupBox;
    pnlPenEditing: TPanel;
    lbl16: TLabel;
    Label29: TLabel;
    cbbWeightPen: TComboBox;
    cbbDashesPen: TComboBox;
    Label45: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Bevel7: TBevel;
    Label123: TLabel;
    Label124: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label37: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Bevel8: TBevel;
    Label38: TLabel;
    Label39: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label46: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Label157: TLabel;
    Label158: TLabel;
    pnlWarning: TPanel;
    lblWarning: TLabel;
    lbl33: TLabel;
    pnlMainBackground: TPanel;
    pnlSparatorHor1: TPanel;
    Image2: TImage;
    pnlButtom: TPanel;
    Panel4: TPanel;
    Button2: TButton;
    pnlSparatorVer1: TPanel;
    Image3: TImage;
    pnlToolBar: TPanel;
    pnlAlignToolBar: TPanel;
    pnlCursorPosition: TPanel;
    grbCursorPosition: TGroupBox;
    lblBearing: TLabel;
    lblDistance: TLabel;
    lbSlPosition: TLabel;
    lblnmSGrid: TLabel;
    lblWPosition: TLabel;
    lblnmWGrid: TLabel;
    lbl47: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    btnClose: TButton;
    btnOutline: TImage;
    btnFill: TImage;
    pnlFill: TPanel;
    btnSelect: TImage;
    btnText: TImage;
    btnLine: TImage;
    btnRectangle: TImage;
    btnCircle: TImage;
    btnEllipse: TImage;
    btnArc: TImage;
    btnSector: TImage;
    btnGrid: TImage;
    btnPolygon: TImage;
    btnOk: TButton;
    btnDelPoly: TButton;
    btnEditPoly: TButton;
    btnout: TToolButton;
    lblNameOverlay: TLabel;
    btngamearea: TToolButton;
    btnruler: TToolButton;
    btnDelete: TButton;
    btnApply: TButton;
    // Label61: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure Map1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Map1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Map1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Map1MapViewChanged(Sender: TObject);
    procedure Map1DrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);

    { Prince }
    procedure btnHandleShape(Sender: TObject);
    procedure btnHandleShapePosition(Sender: TObject);
    procedure btnSave(Sender: TObject);
    procedure OnKeyPress(Sender: TObject; var Key: Char);

    procedure cbSetScaleChange(Sender: TObject);
    procedure btnIncreaseClick(Sender: TObject);
    procedure btnDecreaseClick(Sender: TObject);
    procedure btnZoomClick(Sender: TObject);
    procedure btnPanClick(Sender: TObject);
    procedure btnCenterGameClick(Sender: TObject);
    procedure colorChooseChange(Sender: TObject);
    procedure AddPolyDClick(Sender: TObject);
    procedure btnDeletePolyDClick(Sender: TObject);

    procedure cbbDashesPenSelect(Sender: TObject);
    procedure cbbDashesPenDSelect(Sender: TObject);
    procedure edtArcRadiusChange(Sender: TObject);
    procedure mnitoFrontClick(Sender: TObject);
    procedure mnitoBackClick(Sender: TObject);
    procedure OnKeyPressTextSize(Sender: TObject; var Key: Char);
    procedure pnlWarningClick(Sender: TObject);
    procedure FormResize(Sender: TObject);

    procedure btnOutlineClick(Sender: TObject);
    procedure btnFillClick(Sender: TObject);
    procedure btnNoFillClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnDeletePolyClick(Sender: TObject);

    procedure LoadNormalButtonImage;
    procedure btnDelPolyClick(Sender: TObject);
    procedure btnEditPolyClick(Sender: TObject);
    procedure lvPolyVertexSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnoutClick(Sender: TObject);
    procedure btngameareaClick(Sender: TObject);
    procedure btnrulerClick(Sender: TObject);
//        procedure TfrmWaypointEditor.OnAddRuller(Long, Lat: double);
  private
    FSelectedPolyID: Integer;
    FTagTombolPosition: Integer;
    FSelectedOverlay: TOverlay_Definition;
    FConverter: TCoordConverter;
    FTipeOverlay: Integer; { tipe overlay utk kebutuhan tampilan }

    FMapCursor: E_OverlayMapCursor;
    FShapeColor: E_ShapeColor;

    xx: Double;
    yy: Double;

  public
    isOK: Boolean; { Penanda jika gagal cek input, btn OK tidak langsung close }
    AfterClose: Boolean;
    { Penanda ketika yg dipilih btn cancel, list tdk perlu di update }

    IdAction: Byte; { 1: add; 2: Edit; 3: Delete }

    ShapeType: Integer;
    FisNoFill: Boolean;
        isshow:Boolean;
    IdSelectShape: Integer;
    IsReEdit: Boolean;

    nameSelectedTemplate: string;

    mx, my: Double;

    FMapPlatform: TSimMap;

    FFormula: TFormula;

    OverlayGameEnviroDef: TGame_Environment_Definition;

    FCanvas: TCanvas;
    FLyrDraw: CMapXLayer;
    fFtrFactory: CMapXFeatureFactory;
    MouseIsDown, isCapturingScreen: Boolean;

    DrawOverlay: TDrawOverlay;
    DrawFlagPoint: TDrawFlagPoint;

    centLong, centLatt: Double;
           procedure OnAddRuller(Long,Lat : double);
    { Prince }
    // procedure Apply;
    // procedure Deleted;
    procedure Canceled;
    procedure GetPosition;
    procedure ClearEditText;
    procedure ClearFlagPoint;
    procedure SelectShape(pos: TPoint);
    procedure RefreshMousePointer;
    procedure RefreshLvPolyVertexList;
    procedure RefreshForm;

    procedure LoadShape(fFile: String);

    procedure LoadPanelText;
    procedure LoadPanelLine;
    procedure LoadPanelRectangle;
    procedure LoadPanelCircle;
    procedure LoadPanelEllipse;
    procedure LoadPanelArc;
    procedure LoadPanelSector;
    procedure LoadPanelGrid;
    procedure LoadPanelPolygon;

    procedure GbrText;
    procedure GbrLine;
    procedure GbrRectangle;
    procedure GbrCircle;
    procedure GbrEllipse;
    procedure GbrArc;
    procedure GbrSector;
    procedure GbrGrid;
    procedure GbrPolygon;
    procedure GbrFlagPoint(mx, my: Double);
    procedure EditFlagPoint(id: Integer; mx, my: Double);

    procedure SetNoFill(val: Boolean);

    procedure setCBScale;
    procedure getGridCursorPos;
    procedure GameCenterDynamic;

    function RecordToFileStream(fFile: String): Boolean;

    procedure ScreenShot(DestBitmap: TBitmap);
    procedure LoadMap(Geoset: String);

    function CekInput(IdObject: Integer): Boolean;
    function GetInput(s: string): Boolean;
    function GetGridLatt(yCursorPoint: Double): string;
    function GetGridLong(xCursorPoint: Double): string;

    property SelectedOverlay: TOverlay_Definition read FSelectedOverlay
      write FSelectedOverlay;
    property MapCursor: E_OverlayMapCursor read FMapCursor write FMapCursor;
  end;

var
  OverlayEditorForm: TOverlayEditorForm;

implementation

uses uBaseCoordSystem, math, ufrmSummaryOverlay, ComObj, uScrCapture,
  ufCaptureRes,ufrmGameAreaPickList,
  uDBEditSetting, uDataModuleTTT, uRecord, ufrmRuler;
{$R *.dfm}

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

{$REGION ' Form Handle '}

procedure TOverlayEditorForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IsReEdit := True;
end;

procedure TOverlayEditorForm.FormCreate(Sender: TObject);
begin
  // Map1.DoubleBuffered   := true;

  // FMapPlatform          := TSimMap.Create(Map1);

  // Converter.FMap        := Self.Map1;
  // OverlayGameEnviroDef  := TGame_Environment_Definition.Create;

  // FMapPlatform.FMap.OnMouseMove     := Map1MouseMove;
  // FMapPlatform.FMap.OnMouseDown     := Map1MouseDown;
  // FMapPlatform.FMap.OnMouseUp       := Map1MouseUp;
  // FMapPlatform.FMap.OnDrawUserLayer := Map1DrawUserLayer;

  FCanvas := TCanvas.Create;
  FConverter := TCoordConverter.Create;
  FFormula := TFormula.Create;

  DrawOverlay := TDrawOverlay.Create;
  DrawOverlay.Converter := FConverter;

  DrawFlagPoint := TDrawFlagPoint.Create;
  DrawFlagPoint.Converter := FConverter;

  btnOk.Enabled := false;
end;

procedure TOverlayEditorForm.FormResize(Sender: TObject);
begin
  WindowState := wsMaximized;
  pnlAlignToolBar.Width := round((pnlToolBar.Width - 433) / 2);
end;

procedure TOverlayEditorForm.FormShow(Sender: TObject);
var
  aGeoset, ENCGeoset, VektorGeoset, GameAreaName: string;
begin
  LoadMap(vAppDBSetting.Pattern);

  FConverter.FMap := Map1;

  cbSetScale.ItemIndex := cbSetScale.Items.Count - 1;
  cbSetScaleChange(Sender);

  cbSetScale.Text := cbSetScale.Items.Strings[cbSetScale.ItemIndex];

  FTipeOverlay := osStatic;

  pnlStatic.Visible := True;
  pnlDynamic.Visible := false;

  grpNone.BringToFront;
  pnlWarning.Visible := false;

  centLong := 116.357322793642;
  centLatt := -0.328853651464508;

  btnSelect.OnClick(btnSelect);

  DrawOverlay.Clear;

  LoadShape(vAppDBSetting.OverlayPath + '\' +
    ufrmSummaryOverlay.frmSummaryOverlay.LastName + '.dat');
  RefreshForm;

  cbSetScaleChange(Sender);
end;

{$ENDREGION}
{$REGION ' Button Handle '}

procedure TOverlayEditorForm.btnApplyClick(Sender: TObject);
begin
  case ShapeType of
    ovText:
      GbrText;
    ovLine:
      GbrLine;
    ovRectangle:
      GbrRectangle;
    ovCircle:
      GbrCircle;
    ovEllipse:
      GbrEllipse;
    ovArc:
      GbrArc;
    ovSector:
      GbrSector;
    ovGrid:
      GbrGrid;
    ovPolygon:
      GbrPolygon;
  end;

  btnSelect.OnClick(btnSelect);
  btnOk.Enabled := True;

  Map1.Refresh;
  Map1.Repaint;
end;

procedure TOverlayEditorForm.btnDeleteClick(Sender: TObject);
begin
  case FTipeOverlay of
    0:
      DrawOverlay.DynamicList.Delete(IdSelectShape);
    1:
      DrawOverlay.StaticList.Delete(IdSelectShape);
  end;
  btnDelete.Enabled := false;
  btnSelect.OnClick(btnSelect);
end;

procedure TOverlayEditorForm.btnHandleShape(Sender: TObject);
var
  isDynamic: Boolean;
begin
  LoadNormalButtonImage;
  btnDelete.Enabled := false;

  RefreshMousePointer;
  ClearFlagPoint;
  ClearEditText;
  Canceled;
  IdAction := 1;

  case FTipeOverlay of

{$REGION ' Dynamic Section '}
    osDynamic:
      begin
        pnlDynamic.Visible := True;
        cbbWeightPen.Text := '1';
        cbbDashesPen.Text := 'Solid';
        cbbTextSize.Text := '11';
        isDynamic := True;
      end;
{$ENDREGION}
{$REGION ' Static Section '}
    osStatic:
      begin
        pnlStatic.Visible := True;
        isDynamic := false;
      end
{$ENDREGION}
  end;

  ShapeType := TImage(Sender).Tag;
  case ShapeType of
    0: { Select }
      begin
        btnSelect.Picture.LoadFromFile
          ('data\Image DBEditor\Interface\Button\btnCursor_Select.PNG');
        lblShape.Caption := '---';
        grpNone.BringToFront;

        { merubah cursor }
        FMapCursor := mcEdit;

{$REGION ' Button Handle '}
        btnOutline.Visible := false;
        btnFill.Visible := false;
        pnlPenEditing.Visible := false;
{$ENDREGION}
      end;
    ovText:
      LoadPanelText;
    ovLine:
      LoadPanelLine;
    ovRectangle:
      LoadPanelRectangle;
    ovCircle:
      LoadPanelCircle;
    ovEllipse:
      LoadPanelEllipse;
    ovArc:
      LoadPanelArc;
    ovSector:
      LoadPanelSector;
    ovGrid:
      LoadPanelGrid;
    ovPolygon:
      LoadPanelPolygon
  end;
end;

procedure TOverlayEditorForm.btnSave(Sender: TObject);
begin
  DeleteFile(vAppDBSetting.OverlayPath + '\' +
    SelectedOverlay.FData.Overlay_Identifier + '.dat');
  RecordToFileStream(vAppDBSetting.OverlayPath + '\' +
    SelectedOverlay.FData.Overlay_Identifier + '.dat');

  ShowMessage('Data has been saved');

  RefreshMousePointer;
  btnPan.Down := false;
  btnZoom.Down := false;
  AfterClose := True;
  Close;
end;

procedure TOverlayEditorForm.mnitoBackClick(Sender: TObject);
begin
  DrawOverlay.SendToBack(IdSelectShape);
  Map1.Refresh;
  Map1.Repaint;
end;

procedure TOverlayEditorForm.mnitoFrontClick(Sender: TObject);
begin
  DrawOverlay.BringToFront(IdSelectShape);
  Map1.Refresh;
  Map1.Repaint;
end;

{$ENDREGION}
{$REGION ' Load Panel Handle '}

procedure TOverlayEditorForm.LoadPanelText;
begin
  lblShape.Caption := 'Text';
  btnText.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnText_Select.PNG');

{$REGION ' Dynamic Handle '}
  grpTextD.BringToFront;
  grpTextD.Visible := false;
{$ENDREGION}
{$REGION ' Static Handle '}
  grpText.BringToFront;
  grpText.Visible := True;
{$ENDREGION}
{$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := false;
  pnlPenEditing.Visible := false;
  SetNoFill(True);
  btnOutlineClick(nil);
{$ENDREGION}
end;

procedure TOverlayEditorForm.LoadPanelLine;
begin
  lblShape.Caption := 'Line';
  btnLine.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnLine_Select.PNG');

{$REGION ' Dynamic Handle '}
  grpLineD.BringToFront;
  grpLineD.Visible := True;
{$ENDREGION}
{$REGION ' Static Handle '}
  grpLine.BringToFront;
  grpLine.Visible := True;
{$ENDREGION}
{$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := false;
  pnlPenEditing.Visible := True;
  SetNoFill(True);
  btnOutlineClick(nil);
{$ENDREGION}
end;

procedure TOverlayEditorForm.LoadPanelRectangle;
begin
  lblShape.Caption := 'Rectangle';
  btnRectangle.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnRectangle_Select.PNG');

{$REGION ' Dynamic Handle '}
  grpRectangleD.BringToFront;
  grpRectangleD.Visible := True;
{$ENDREGION}
{$REGION ' Static Handle '}
  grpRectangle.BringToFront;
  grpRectangle.Visible := True;
{$ENDREGION}
{$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := True;
  pnlPenEditing.Visible := True;
  SetNoFill(false);
  btnOutlineClick(nil);
{$ENDREGION}
end;

procedure TOverlayEditorForm.LoadPanelCircle;
begin
  lblShape.Caption := 'Circle';
  btnCircle.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnCircle_Select.PNG');

{$REGION ' Dynamic Handle '}
  grpCircleD.BringToFront;
  grpCircleD.Visible := True;
{$ENDREGION}
{$REGION ' Static Handle '}
  grpCircle.BringToFront;
  grpCircle.Visible := True;
{$ENDREGION}
{$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := True;
  pnlPenEditing.Visible := True;
{$ENDREGION}
end;

procedure TOverlayEditorForm.LoadPanelEllipse;
begin
  lblShape.Caption := 'Ellipse';
  btnEllipse.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnEllipse_Select.PNG');

{$REGION ' Dynamic Handle '}
  grpEllipseD.BringToFront;
  grpEllipseD.Visible := True;
{$ENDREGION}
{$REGION ' Static Handle '}
  grpEllipse.BringToFront;
  grpEllipse.Visible := True;
{$ENDREGION}
{$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := True;
  pnlPenEditing.Visible := True;
{$ENDREGION}
end;

procedure TOverlayEditorForm.LoadPanelArc;
begin
  lblShape.Caption := 'Arc';
  btnArc.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnArc_Select.PNG');

{$REGION ' Dynamic Handle '}
  grpArcD.BringToFront;
  grpArcD.Visible := True;
{$ENDREGION}
{$REGION ' Static Handle '}
  grpArc.BringToFront;
  grpArc.Visible := True;
{$ENDREGION}
{$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := false;
  pnlPenEditing.Visible := True;
{$ENDREGION}
end;

procedure TOverlayEditorForm.LoadPanelSector;
begin
  lblShape.Caption := 'Sector';
  btnSector.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnSector_Select.PNG');

{$REGION ' Dynamic Handle '}
  grpSectorD.BringToFront;
  grpSectorD.Visible := True;
{$ENDREGION}
{$REGION ' Static Handle '}
  grpSector.BringToFront;
  grpSector.Visible := True;
{$ENDREGION}
{$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := false;
  pnlPenEditing.Visible := True;
{$ENDREGION}
end;

procedure TOverlayEditorForm.LoadPanelGrid;
begin
  lblShape.Caption := 'Grid';
  btnGrid.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnGrid_Select.PNG');

{$REGION ' Dynamic Handle '}
  grpGridD.BringToFront;
  grpGridD.Visible := True;
{$ENDREGION}
{$REGION ' Static Handle '}
  grpGrid.BringToFront;
  grpGrid.Visible := True;
{$ENDREGION}
{$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := false;
  pnlPenEditing.Visible := True;
{$ENDREGION}
end;

procedure TOverlayEditorForm.LoadPanelPolygon;
begin
  lblShape.Caption := 'Polygon';
  btnPolygon.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnPolygon_Select.PNG');

{$REGION ' Dynamic Handle '}
  grpPolygonD.BringToFront;
  grpPolygonD.Visible := True;
{$ENDREGION}
{$REGION ' Static Handle '}
  grpPolygon.BringToFront;
  grpPolygon.Visible := True;
{$ENDREGION}
{$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := false;
  pnlPenEditing.Visible := True;
{$ENDREGION}
end;

{$ENDREGION}
{$REGION ' Insert Shape Handle '}

procedure TOverlayEditorForm.GbrText;
var
  Size: Integer;
  TextStatic: TTextStatic;
  TextDynamic: TTextDynamic;
begin
  Size := 10;

  case FTipeOverlay of

{$REGION ' Dynamic Section '}
    osDynamic:
      begin
        if IdAction = 2 then
          TextDynamic := DrawOverlay.DynamicList.Items[IdSelectShape]
        else
          TextDynamic := TTextDynamic.Create(FConverter);

        TextDynamic.ParentPos.X := Map1.CenterX;
        TextDynamic.ParentPos.Y := Map1.CenterY;

        TextDynamic.postStart.Range := StrToFloat(edtTextRange.Text);
        TextDynamic.postStart.Bearing := StrToInt(edtTextBearing.Text);
        TextDynamic.Size := StrToInt(cbbTextSizeD.Text);
        TextDynamic.words := edtTextFieldD.Text;
        // TextDynamic.Color := txtColorSelect.color;
        TextDynamic.isSelected := false;

        if IdAction <> 2 then
          DrawOverlay.DynamicList.Add(TextDynamic);
      end;
{$ENDREGION}
{$REGION ' Static Section '}
    osStatic:
      begin
        if IdAction = 2 then
          TextStatic := DrawOverlay.StaticList.Items[IdSelectShape]
        else
          TextStatic := TTextStatic.Create(FConverter);

        if dmsToLatt(edtTextPosLAt.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtTextPosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        TextStatic.postStart.X := dmsToLong(edtTextPosLong.Text);
        TextStatic.postStart.Y := dmsToLatt(edtTextPosLAt.Text);
        TextStatic.Size := StrToInt(cbbTextSize.Text);
        TextStatic.words := edtTextField.Text;
        TextStatic.Color := pnlOutline.Color;
        TextStatic.isSelected := false;

        if IdAction <> 2 then
          DrawOverlay.StaticList.Add(TextStatic);
      end;
{$ENDREGION}
  end;
end;

procedure TOverlayEditorForm.GbrLine;
var
  LineStatic: TLineStatic;
  LineDynamic: TLineDynamic;
begin

  case FTipeOverlay of

{$REGION ' Dynamic Section '}
    osDynamic:
      begin
        if IdAction = 2 then
          LineDynamic := DrawOverlay.DynamicList.Items[IdSelectShape]
        else
          LineDynamic := TLineDynamic.Create(FConverter);

        LineDynamic.ParentPos.X := Map1.CenterX;
        LineDynamic.ParentPos.Y := Map1.CenterY;

        LineDynamic.postStart.Bearing := StrToInt(edtLineStartBearing.Text);
        LineDynamic.postStart.Range := StrToFloat(edtLineStartRange.Text);
        LineDynamic.PostEnd.Bearing := StrToInt(edtLineEndBearing.Text);
        LineDynamic.PostEnd.Range := StrToFloat(edtLineEndRange.Text);
        // LineDynamic.Color := txtColorSelect.color;
        LineDynamic.lineType := TPenStyle(cbbDashesPen.ItemIndex);
        LineDynamic.weight := StrToInt(cbbWeightPen.Text);
        if IdAction <> 2 then
          DrawOverlay.DynamicList.Add(LineDynamic);
      end;
{$ENDREGION}
{$REGION ' Static Section '}
    osStatic:
      begin
        if IdAction = 2 then
          LineStatic := DrawOverlay.StaticList.Items[IdSelectShape]
        else
          LineStatic := TLineStatic.Create(FConverter);

        if dmsToLatt(edtLineStartPosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtLineStartPosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        if dmsToLatt(edtLineEndPosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtLineEndPosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        LineStatic.postStart.X := dmsToLong(edtLineStartPosLong.Text);
        LineStatic.postStart.Y := dmsToLatt(edtLineStartPosLat.Text);
        LineStatic.PostEnd.X := dmsToLong(edtLineEndPosLong.Text);
        LineStatic.PostEnd.Y := dmsToLatt(edtLineEndPosLat.Text);
        LineStatic.Color := pnlOutline.Color;
        LineStatic.lineType := TPenStyle(cbbDashesPen.ItemIndex);
        LineStatic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.StaticList.Add(LineStatic);
      end;
{$ENDREGION}
  end;
end;

procedure TOverlayEditorForm.GbrRectangle;
var
  RectangleStatic: TRectangleStatic;
  RectangleDynamic: TRectangleDynamic;
begin

  case FTipeOverlay of

{$REGION ' Dynamic Section '}
    osDynamic:
      begin
        if IdAction = 2 then
          RectangleDynamic := DrawOverlay.DynamicList.Items[IdSelectShape]
        else
          RectangleDynamic := TRectangleDynamic.Create(FConverter);

        RectangleDynamic.ParentPos.X := Map1.CenterX;
        RectangleDynamic.ParentPos.Y := Map1.CenterY;

        RectangleDynamic.postStart.Bearing := StrToInt(edtRecStartBearing.Text);
        RectangleDynamic.postStart.Range := StrToFloat(edtRecStartRange.Text);
        RectangleDynamic.PostEnd.Bearing := StrToInt(edtRecEndBearing.Text);
        RectangleDynamic.PostEnd.Range := StrToFloat(edtRecEndRange.Text);
        // RectangleDynamic.Color := txtColorSelect.color;

        // if isFiFisNoFillen
        // begin
        // RectangleDynamic.BrushStyle := bsClear;
        // end
        // else
        // begin
        // RectangleDynamic.BrushStyle := bsSolid;
        /// /        RectangleDynamic.ColorFill := txtFillColor.Color;
        // end;

        RectangleDynamic.lineType := TPenStyle(cbbDashesPen.ItemIndex);
        RectangleDynamic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.DynamicList.Add(RectangleDynamic);
      end;
{$ENDREGION}
{$REGION ' Static Section '}
    osStatic:
      begin
        if IdAction = 2 then
          RectangleStatic := DrawOverlay.StaticList.Items[IdSelectShape]
        else
          RectangleStatic := TRectangleStatic.Create(FConverter);

        if dmsToLatt(edtRectStartPosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtRectStartPosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        if dmsToLatt(edtRectEndPosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtRectEndPosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        RectangleStatic.postStart.X := dmsToLong(edtRectStartPosLong.Text);
        RectangleStatic.postStart.Y := dmsToLatt(edtRectStartPosLat.Text);
        RectangleStatic.PostEnd.X := dmsToLong(edtRectEndPosLong.Text);
        RectangleStatic.PostEnd.Y := dmsToLatt(edtRectEndPosLat.Text);
        RectangleStatic.Color := pnlOutline.Color;

        if FisNoFill then
        begin
          RectangleStatic.BrushStyle := bsClear;
        end
        else
        begin
          RectangleStatic.BrushStyle := bsSolid;
          RectangleStatic.ColorFill := pnlFill.Color;
        end;

        RectangleStatic.lineType := TPenStyle(cbbDashesPen.ItemIndex);;
        RectangleStatic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.StaticList.Add(RectangleStatic);
      end;

{$ENDREGION}
  end;
end;

procedure TOverlayEditorForm.GbrCircle;
var
  CircleStatic: TCircleStatic;
  CircleDynamic: TCircleDynamic;
begin

  case FTipeOverlay of

{$REGION ' Dynamic Section '}
    osDynamic:
      begin
        if IdAction = 2 then
          CircleDynamic := DrawOverlay.DynamicList.Items[IdSelectShape]
        else
          CircleDynamic := TCircleDynamic.Create(FConverter);

        CircleDynamic.ParentPos.X := Map1.CenterX;
        CircleDynamic.ParentPos.Y := Map1.CenterY;

        CircleDynamic.postCenter.Bearing := StrToInt(edtCircleBearing.Text);
        CircleDynamic.postCenter.Range := StrToFloat(edtCircleRange.Text);
        CircleDynamic.Radius := StrToFloat(edtCircleRadiusD.Text);
        // CircleDynamic.Color := txtColorSelect.color;

        // if isFiFisNoFillen
        // begin
        // CircleDynamic.BrushStyle := bsClear;
        // end
        // else
        // begin
        // CircleDynamic.BrushStyle := bsSolid;
        // //        CircleDynamic.ColorFill := txtFillColor.Color;
        // end;
        //
        // GayaGaris := TPenStyle(cbbDashesPen.ItemIndex);
        // CircleDynamic.LineType :=  GayaGaris;
        CircleDynamic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.DynamicList.Add(CircleDynamic);
      end;

{$ENDREGION}
{$REGION ' Static Section '}
    osStatic:
      begin
        if IdAction = 2 then
          CircleStatic := DrawOverlay.StaticList.Items[IdSelectShape]
        else
          CircleStatic := TCircleStatic.Create(FConverter);

        if dmsToLatt(edtCirclePosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtCirclePosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        CircleStatic.postCenter.X := dmsToLong(edtCirclePosLong.Text);
        CircleStatic.postCenter.Y := dmsToLatt(edtCirclePosLat.Text);
        CircleStatic.Radius := StrToFloat(edtCircleRadius.Text);
        CircleStatic.Color := pnlOutline.Color;

        if FisNoFill then
        begin
          CircleStatic.BrushStyle := bsClear;
        end
        else
        begin
          CircleStatic.BrushStyle := bsSolid;
          CircleStatic.ColorFill := pnlFill.Color;
        end;

        CircleStatic.lineType := TPenStyle(cbbDashesPen.ItemIndex);
        CircleStatic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.StaticList.Add(CircleStatic);
      end;
{$ENDREGION}
  end;
end;

procedure TOverlayEditorForm.GbrEllipse;
var
  EllipseStatic: TEllipseStatic;
  EllipseDynamic: TEllipseDynamic;
begin

  case FTipeOverlay of

{$REGION ' Dynamic Section '}
    osDynamic:
      begin
        if IdAction = 2 then
          EllipseDynamic := DrawOverlay.DynamicList.Items[IdSelectShape]
        else
          EllipseDynamic := TEllipseDynamic.Create(FConverter);

        EllipseDynamic.ParentPos.X := Map1.CenterX;
        EllipseDynamic.ParentPos.Y := Map1.CenterY;

        EllipseDynamic.postCenter.Bearing := StrToInt(edtEllipseBearing.Text);
        EllipseDynamic.postCenter.Range := StrToFloat(edtEllipseRange.Text);
        EllipseDynamic.Vradius := StrToFloat(edtEllipseVerticalD.Text);
        EllipseDynamic.Hradius := StrToFloat(edtEllipseHorizontalD.Text);
        // EllipseDynamic.Color := txtColorSelect.color;

        // if isFiFisNoFillen
        // begin
        // EllipseDynamic.BrushStyle := bsClear;
        // end
        // else
        // begin
        // EllipseDynamic.BrushStyle := bsSolid;
        /// /        EllipseDynamic.ColorFill := txtFillColor.Color;
        // end;
        //
        // GayaGaris := TPenStyle(cbbDashesPen.ItemIndex);
        // EllipseDynamic.LineType :=  GayaGaris;
        EllipseDynamic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.DynamicList.Add(EllipseDynamic);
      end;
{$ENDREGION}
{$REGION ' Static Section '}
    osStatic:
      begin
        if IdAction = 2 then
          EllipseStatic := DrawOverlay.StaticList.Items[IdSelectShape]
        else
          EllipseStatic := TEllipseStatic.Create(FConverter);

        if dmsToLatt(edtEllipsePosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtEllipsePosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        EllipseStatic.postCenter.X := dmsToLong(edtEllipsePosLong.Text);
        EllipseStatic.postCenter.Y := dmsToLatt(edtEllipsePosLat.Text);
        EllipseStatic.Hradius := StrToFloat(edtHorizontal.Text);
        EllipseStatic.Vradius := StrToFloat(edtVertical.Text);
        EllipseStatic.Color := pnlOutline.Color;

        if FisNoFill then
        begin
          EllipseStatic.BrushStyle := bsClear;
        end
        else
        begin
          EllipseStatic.BrushStyle := bsSolid;
          EllipseStatic.ColorFill := pnlFill.Color;
        end;

        EllipseStatic.lineType := TPenStyle(cbbDashesPen.ItemIndex);
        EllipseStatic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.StaticList.Add(EllipseStatic);
      end;
{$ENDREGION}
  end;
end;

procedure TOverlayEditorForm.GbrArc;
var
  ArcStatic: TArcStatic;
  ArcDynamic: TArcDynamic;
begin

  case FTipeOverlay of

{$REGION ' Dynamic Section '}
    osDynamic:
      begin
        if IdAction = 2 then
          ArcDynamic := DrawOverlay.DynamicList.Items[IdSelectShape]
        else
          ArcDynamic := TArcDynamic.Create(FConverter);

        ArcDynamic.ParentPos.X := Map1.CenterX;
        ArcDynamic.ParentPos.Y := Map1.CenterY;

        ArcDynamic.postCenter.Bearing := StrToInt(edtArcBearing.Text);
        ArcDynamic.postCenter.Range := StrToFloat(edtArcRange.Text);
        ArcDynamic.Radius := StrToFloat(edtArcRadiusD.Text);
        ArcDynamic.StartAngle := StrToInt(edtArcStartAngleD.Text);
        ArcDynamic.EndAngle := StrToInt(edtArcEndAngleD.Text);
        // ArcDynamic.Color := txtColorSelect.color;

        // GayaGaris := TPenStyle(cbbDashesPen.ItemIndex);
        // ArcDynamic.LineType :=  GayaGaris;
        ArcDynamic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.DynamicList.Add(ArcDynamic);
      end;
{$ENDREGION}
{$REGION ' Static Section '}
    osStatic:
      begin
        if IdAction = 2 then
          ArcStatic := DrawOverlay.StaticList.Items[IdSelectShape]
        else
          ArcStatic := TArcStatic.Create(FConverter);

        if dmsToLatt(edtArcPosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtArcPosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        ArcStatic.postCenter.X := dmsToLong(edtArcPosLong.Text);
        ArcStatic.postCenter.Y := dmsToLatt(edtArcPosLat.Text);
        ArcStatic.Radius := StrToFloat(edtArcRadius.Text);
        ArcStatic.StartAngle := StrToInt(edtArcStartAngle.Text);
        ArcStatic.EndAngle := StrToInt(edtArcEndAngle.Text);
        ArcStatic.Color := pnlOutline.Color;

        ArcStatic.lineType := TPenStyle(cbbDashesPen.ItemIndex);
        ArcStatic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.StaticList.Add(ArcStatic);
      end;
{$ENDREGION}
  end;
end;

procedure TOverlayEditorForm.GbrSector;
var
  SectorStatic: TSectorStatic;
  SectorDynamic: TSectorDynamic;
begin

  case FTipeOverlay of
{$REGION ' Dynamic Section '}
    osDynamic:
      begin
        if IdAction = 2 then
          SectorDynamic := DrawOverlay.DynamicList.Items[IdSelectShape]
        else
          SectorDynamic := TSectorDynamic.Create(FConverter);

        SectorDynamic.ParentPos.X := Map1.CenterX;
        SectorDynamic.ParentPos.Y := Map1.CenterY;

        SectorDynamic.postCenter.Bearing := StrToInt(edtSectorBearing.Text);
        SectorDynamic.postCenter.Range := StrToFloat(edtSectorRange.Text);
        SectorDynamic.Oradius := StrToFloat(edtSectorOuterD.Text);
        SectorDynamic.Iradius := StrToFloat(edtSectorInnerD.Text);
        SectorDynamic.StartAngle := StrToInt(edtSectorStartAngleD.Text);
        SectorDynamic.EndAngle := StrToInt(edtSectorEndAngleD.Text);
        // SectorDynamic.Color := txtColorSelect.color;
        // SectorDynamic.ColorFill := txtFillColor.Color;

        // GayaGaris := TPenStyle(cbbDashesPen.ItemIndex);
        // SectorDynamic.LineType :=  GayaGaris;
        SectorDynamic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.DynamicList.Add(SectorDynamic);
      end;
{$ENDREGION}
{$REGION ' Static Section '}
    osStatic:
      begin
        if IdAction = 2 then
          SectorStatic := DrawOverlay.StaticList.Items[IdSelectShape]
        else
          SectorStatic := TSectorStatic.Create(FConverter);

        if dmsToLatt(edtSectorPosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtSectorPosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        SectorStatic.postCenter.X := dmsToLong(edtSectorPosLong.Text);
        SectorStatic.postCenter.Y := dmsToLatt(edtSectorPosLat.Text);
        SectorStatic.Oradius := StrToFloat(edtSectorOuter.Text);
        SectorStatic.Iradius := StrToFloat(edtSectorInner.Text);
        SectorStatic.StartAngle := StrToInt(edtSectorStartAngle.Text);
        SectorStatic.EndAngle := StrToInt(edtSectorEndAngle.Text);
        SectorStatic.Color := pnlOutline.Color;

        SectorStatic.lineType := TPenStyle(cbbDashesPen.ItemIndex);
        SectorStatic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.StaticList.Add(SectorStatic);
      end;
{$ENDREGION}
  end;
end;

procedure TOverlayEditorForm.GbrGrid;
var
  GridStatic: TGridStatic;
  GridDynamic: TGridDynamic;
begin

  case FTipeOverlay of
{$REGION ' Dynamic Section '}
    osDynamic:
      begin
        if IdAction = 2 then
          GridDynamic := DrawOverlay.DynamicList.Items[IdSelectShape]
        else
          GridDynamic := TGridDynamic.Create(FConverter);

        GridDynamic.ParentPos.X := Map1.CenterX;
        GridDynamic.ParentPos.Y := Map1.CenterY;

        GridDynamic.postCenter.Bearing := StrToInt(edtTableBearing.Text);
        GridDynamic.postCenter.Range := StrToFloat(edtTableRange.Text);
        GridDynamic.Height := StrToFloat(edtTableHeightD.Text);
        GridDynamic.Width := StrToFloat(edtTableWidthD.Text);
        GridDynamic.HCount := StrToInt(edtTableColumnD.Text);
        GridDynamic.WCount := StrToInt(edtTableRowD.Text);
        GridDynamic.Rotation := StrToInt(edtRotationAngleD.Text);
        // GridDynamic.Color := txtColorSelect.color;

        // if isFiFisNoFillen
        // begin
        // GridDynamic.BrushStyle := bsClear;
        // GridDynamic.ColorFill := clNone;
        // end
        // else
        // begin
        // GridDynamic.BrushStyle := bsSolid;
        // GridDynamic.ColorFill := txtFillColor.Color;
        // end;
        //
        // GayaGaris := TPenStyle(cbbDashesPen.ItemIndex);
        // GridDynamic.LineType :=  GayaGaris;
        GridDynamic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.DynamicList.Add(GridDynamic);
      end;
{$ENDREGION}
{$REGION ' Static Section '}
    osStatic:
      begin
        if IdAction = 2 then
          GridStatic := DrawOverlay.StaticList.Items[IdSelectShape]
        else
          GridStatic := TGridStatic.Create(FConverter);

        if dmsToLatt(edtTablePosLat.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Latitude');
          Exit
        end;

        if dmsToLong(edtTablePosLong.Text) = 0.0 then
        begin
          ShowMessage('Invalid Format Longitude');
          Exit
        end;

        GridStatic.postCenter.X := dmsToLong(edtTablePosLong.Text);
        GridStatic.postCenter.Y := dmsToLatt(edtTablePosLat.Text);
        GridStatic.Height := StrToFloat(edtTableHeight.Text);
        GridStatic.Width := StrToFloat(edtTableWidth.Text);
        GridStatic.HCount := StrToInt(edtTableColumn.Text);
        GridStatic.WCount := StrToInt(edtTableRow.Text);
        GridStatic.Rotation := StrToInt(edtTableRotationAngle.Text);
        GridStatic.Color := pnlOutline.Color;

        if FisNoFill then
        begin
          GridStatic.BrushStyle := bsClear;
          GridStatic.ColorFill := clNone;
        end
        else
        begin
          GridStatic.BrushStyle := bsSolid;
          GridStatic.ColorFill := pnlFill.Color;
        end;

        GridStatic.lineType := TPenStyle(cbbDashesPen.ItemIndex);
        GridStatic.weight := StrToInt(cbbWeightPen.Text);

        if IdAction <> 2 then
          DrawOverlay.StaticList.Add(GridStatic);
      end;
{$ENDREGION}
  end;
end;

procedure TOverlayEditorForm.GbrPolygon;
var
  i: Integer;
  li: TListItem;
  Point: TDotDynamic;
  PointS: TDotStatic;
  PolygonStatic: TPolygonStatic;
  PolygonDynamic: TPolygonDynamic;

begin

  case FTipeOverlay of
{$REGION ' Dynamic Section '}
    osDynamic:
      begin
        if IdAction = 2 then
        begin
          PolygonDynamic := DrawOverlay.DynamicList.Items[IdSelectShape];
          PolygonDynamic.polyList.Clear;
        end
        else
          PolygonDynamic := TPolygonDynamic.Create(FConverter);

        PolygonDynamic.ParentPos.X := Map1.CenterX;
        PolygonDynamic.ParentPos.Y := Map1.CenterY;
        // PolygonDynamic.Color := txtColorSelect.color;

        // if isFiFisNoFillen
        // begin
        // PolygonDynamic.BrushStyle := bsClear;
        // PolygonDynamic.ColorFill := clNone;
        // end
        // else
        // begin
        // PolygonDynamic.BrushStyle := bsSolid;
        // PolygonDynamic.ColorFill := txtFillColor.Color;
        // end;
        //
        // GayaGaris := TPenStyle(cbbDashesPen.ItemIndex);
        // PolygonDynamic.LineType :=  GayaGaris;
        PolygonDynamic.weight := StrToInt(cbbWeightPen.Text);

        for i := 0 to lvPolyVertexD.Items.Count - 1 do
        begin
          li := lvPolyVertexD.Items[i];

          Point := TDotDynamic.Create;
          Point.Range := StrToFloat(li.SubItems[0]);
          Point.Bearing := StrToInt(li.SubItems[1]);

          PolygonDynamic.polyList.Add(Point);
        end;

        if IdAction <> 2 then
          DrawOverlay.DynamicList.Add(PolygonDynamic);
      end;
{$ENDREGION}
{$REGION ' Static Section '}
    osStatic:
      begin
        if IdAction = 2 then
        begin
          PolygonStatic := DrawOverlay.StaticList.Items[IdSelectShape];
          PolygonStatic.polyList.Clear;
        end
        else
          PolygonStatic := TPolygonStatic.Create(FConverter);

        PolygonStatic.Color := pnlOutline.Color;

        if FisNoFill then
        begin
          PolygonStatic.BrushStyle := bsClear;
          PolygonStatic.ColorFill := clNone;
        end
        else
        begin
          PolygonStatic.BrushStyle := bsSolid;
          PolygonStatic.ColorFill := pnlFill.Color;
        end;

        PolygonStatic.lineType := TPenStyle(cbbDashesPen.ItemIndex);
        PolygonStatic.weight := StrToInt(cbbWeightPen.Text);

        for i := 0 to lvPolyVertex.Items.Count - 1 do
        begin
          li := lvPolyVertex.Items[i];

          PointS := TDotStatic.Create;
          PointS.X := dmsToLong(li.SubItems[0]);
          PointS.Y := dmsToLatt(li.SubItems[1]);

          PolygonStatic.polyList.Add(PointS);
        end;

        if IdAction <> 2 then
          DrawOverlay.StaticList.Add(PolygonStatic);
        SpeedButton10.Down := false;
      end;
{$ENDREGION}
  end;
end;

procedure TOverlayEditorForm.GbrFlagPoint(mx, my: Double);
var
  ObjectFlagPoint: TFlagPoint;
begin
  ObjectFlagPoint := TFlagPoint.Create(FConverter);
  ObjectFlagPoint.Post.X := mx;
  ObjectFlagPoint.Post.Y := my;
  DrawFlagPoint.FList.Add(ObjectFlagPoint);
end;

procedure TOverlayEditorForm.EditFlagPoint(id: Integer; mx, my: Double);
var
  ObjectFlagPoint: TFlagPoint;
begin
  ObjectFlagPoint := TFlagPoint.Create(FConverter);
  ObjectFlagPoint.Post.X := mx;
  ObjectFlagPoint.Post.Y := my;

  if (id = 1) or (id = 3) then
  begin
    DrawFlagPoint.FList.Delete(0);
    DrawFlagPoint.FList.Insert(0, ObjectFlagPoint);
  end
  else
  begin
    DrawFlagPoint.FList.Delete(1);
    DrawFlagPoint.FList.Insert(1, ObjectFlagPoint);
  end;
end;

{$ENDREGION}
{$REGION ' Map Handle '}

procedure TOverlayEditorForm.LoadMap(Geoset: String);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if Map1 = nil then
    Exit;

  InitOleVariant(z);
  Map1.Layers.RemoveAll;

  Map1.Geoset := Geoset;

  if Geoset <> '' then
  begin
    for i := 1 to Map1.Layers.Count do
    begin
      Map1.Layers.Item(i).Selectable := false;
      Map1.Layers.Item(i).Editable := false;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := Map1.Layers.Add(mInfo, 1);

    Map1.Layers.AnimationLayer := FLyrDraw;
    Map1.MapUnit := miUnitNauticalMile;
  end;

  Map1.BackColor := RGB(192, 224, 255);
end;

procedure TOverlayEditorForm.LoadNormalButtonImage;
begin
  btnZoom.ImageIndex := 2;
  btnPan.ImageIndex := 3;
  btnout.ImageIndex := 7;
end;

procedure TOverlayEditorForm.Map1DrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer;
  const RectFull, RectInvalid: IDispatch);
  var
    I : Integer;
   xWPPoint, yWPPoint : Single;
   intWPPointX, intWPPointY : Integer;
  sx, sy, ex, ey: Integer;
  itemStart, itemEnd  : TFlagPoint;

begin
  if not Assigned(FCanvas) then
    Exit;
  FCanvas.Handle := hOutputDC;

  DrawOverlay.drawAll(FCanvas, Map1);
  DrawFlagPoint.Draw(FCanvas);

  if Assigned(DrawOverlay.FSelectedDraw) then
  begin
    DrawOverlay.FSelectedDraw.isSelected := True;
    DrawOverlay.FSelectedDraw.Draw(FCanvas, Map1);
  end;


{$REGION ' Menggambar Ruler '}
  if frmRuler.isshow then
   begin
      DrawFlagPoint.Draw(FCanvas);

      if DrawFlagPoint.FList.Count = 2 then
      begin
        itemStart := DrawFlagPoint.FList[0];
        itemEnd := DrawFlagPoint.FList[1];

        FConverter.ConvertToScreen(itemStart.Post.X, itemStart.Post.Y, sx, sy);
        FConverter.ConvertToScreen(itemEnd.Post.X, itemEnd.Post.Y, ex, ey);

        with FCanvas do
        begin
          Brush.Style := bsClear;
          Pen.Color := clYellow ;
                  Pen.Width:= 2;
          MoveTo(sx, sy);
          LineTo(ex, ey);
        end;
      end;
   end;
end;

procedure TOverlayEditorForm.Map1MapViewChanged(Sender: TObject);
var
  tempZoom: Double;
begin
  if Map1.CurrentTool = miZoomInTool then
  begin
    if Map1.Zoom <= 0.125 then
      tempZoom := 0.125;
    if (Map1.Zoom > 0.125) AND (Map1.Zoom < 1) then
      tempZoom := Map1.Zoom;
    if (Map1.Zoom >= 1) AND (Map1.Zoom <= 2500) then
      tempZoom := round(Map1.Zoom);
    if Map1.Zoom > 2500 then
      tempZoom := 2500;

    Map1.OnMapViewChanged := nil;
    Map1.ZoomTo(tempZoom, Map1.CenterX, Map1.CenterY);

    // if (Map1.Zoom > 0.125) AND (Map1.Zoom < 0.25) then
    // begin
    // cbSetScale.text := FormatFloat('0.000', tempZoom);
    // end
    // else if (Map1.Zoom >= 0.25) AND (Map1.Zoom < 0.5) then
    // begin
    // cbSetScale.text := FormatFloat('0.00', tempZoom);
    // end
    // else if (Map1.Zoom >= 0.5) AND (Map1.Zoom < 1) then
    // begin
    // cbSetScale.text := FormatFloat('0.0', tempZoom);
    // end
    // else
    // cbSetScale.text := floattostr(tempZoom);
    Map1.OnMapViewChanged := Map1MapViewChanged;
  end;
end;

procedure TOverlayEditorForm.Map1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
// var
// xx: Double;
// yy: Double;
begin
  FConverter.ConvertToMap(X, Y, xx, yy);

  lblBearing.Caption := FormatFloat('0.00', CalcBearing(Map1.CenterX,
    Map1.CenterY, xx, yy));
  lblDistance.Caption := FormatFloat('0.00',
    FConverter.Distance_nmi(Map1.CenterX, Map1.CenterY, xx, yy));
  getGridCursorPos;

end;

procedure TOverlayEditorForm.Map1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if isCapturingScreen then
  begin
    with fscrCapture do
    begin
      PActually.X := X;
      PActually.Y := Y;
      MouseIsDown := True;

      // TmpBmp := TBitmap.Create;
      //
      // with TmpBmp do
      // begin
      // Width := round(abs(PActually.X - PDown.X));
      // Height := round(abs(PActually.Y - PDown.Y));
      // BitBlt(TmpBmp.canvas.Handle, 0, 0, Width, Height,
      // fscrCapture.Image1.canvas.Handle, Map1.Left + PDown.X, PDown.Y,
      // SRCCOPY);
      // fCaptureRes.imgCaptureResult.AutoSize := false;
      // fCaptureRes.imgCaptureResult.Picture.Bitmap.Assign(TmpBmp);
      // fCaptureRes.Width := Width + 10;
      // fCaptureRes.Height := Height + fCaptureRes.Panel3.Height + 10;
      // fCaptureRes.ShowModal;
      //
      // if fCaptureRes.recapture then
      // fCaptureRes.recapture := false
      // else
      // isCapturingScreen := false;
      // MouseIsDown := false;
      // end;
    end;
  end;
  Map1.Repaint; // dimatikan dl, msh coba polygon nya
end;

procedure TOverlayEditorForm.Map1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos: TPoint;
begin
  FConverter.ConvertToMap(X, Y, mx, my);

  if Button = mbLeft then
  begin
    { Untuk kebutuhan overlay }
    if FMapCursor = mcEdit then
    begin
      FConverter.ConvertToScreen(mx, my, pos.X, pos.Y);
      SelectShape(pos);
    end
     else if  FMapCursor = mcRulerStart then
    begin
      OnAddRuller(mx,my);
      frmRuler.Show;
      map1.Repaint;
    end
    else if  FMapCursor = mcRulerEnd then
    begin
      OnAddRuller(mx,my);
      frmRuler.Show;
      map1.Repaint;
    end
    else if FMapCursor = mcAdd then
    begin
      GetPosition;

      case ShapeType of
        ovText, ovCircle, ovEllipse, ovArc, ovSector, ovGrid:
          begin
            if DrawFlagPoint.FList.Count > 0 then
              DrawFlagPoint.FList.Clear;

            GbrFlagPoint(mx, my);
          end;
        ovLine, ovRectangle:
          begin
            if DrawFlagPoint.FList.Count = 0 then
            begin
              GbrFlagPoint(0, 0);
              GbrFlagPoint(0, 0);
            end;
            EditFlagPoint(FTagTombolPosition, mx, my)
          end;
        ovPolygon:
          begin
            GbrFlagPoint(mx, my);

            if SpeedButton10.Down then
            begin
              if lvPolyVertex.Items.Count > 12 then
                begin
                  ShowMessage('kelebihan bro');
                  Exit;
                end;
              with lvPolyVertex.Items.Add do
              begin
                SubItems.Add(formatDMS_long(mx));
                SubItems.Add(formatDMS_latt(my));
              end;
              RefreshLvPolyVertexList;
            end;
          end;
      end;

    end;
  end
  else if Button = mbRight then
  begin
    GetCursorPos(pos);

    if IdAction = 2 then
      pmOverlayEdit.Popup(pos.X, pos.Y);
  end;

  if isCapturingScreen then
  begin
    with fscrCapture do
    begin
      PDown.X := X;
      PDown.Y := Y;
      PActually.X := X;
      PActually.Y := Y;
      MouseIsDown := True;
      canvas.DrawFocusRect(RECT(X, Y, X, Y));
    end;
  end;
end;

{$ENDREGION}
{$REGION ' Toolbar Handle '}

procedure TOverlayEditorForm.btnIncreaseClick(Sender: TObject);
begin
  if cbSetScale.ItemIndex = 0 then
    Exit;

  cbSetScale.ItemIndex := cbSetScale.ItemIndex - 1;
  cbSetScaleChange(cbSetScale);
end;

procedure TOverlayEditorForm.btnDecreaseClick(Sender: TObject);
begin
  if cbSetScale.ItemIndex = 16 then
    Exit;

  cbSetScale.ItemIndex := cbSetScale.ItemIndex + 1;
  cbSetScaleChange(cbSetScale);
end;

procedure TOverlayEditorForm.btnZoomClick(Sender: TObject);
begin
  btnZoom.Down := not btnZoom.Down;
  btnPan.Down := false;


  FMapCursor := mcSelect;
  LoadNormalButtonImage;

  Map1.CurrentTool := miZoomInTool;
  Map1.MousePointer := miZoomInCursor;

  btnSelect.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnCursor_Normal.PNG');
  pnlStatic.Visible := false;
  btnZoom.ImageIndex := 5;
end;

procedure TOverlayEditorForm.btnPanClick(Sender: TObject);
begin
  btnPan.Down := not btnPan.Down;
  btnZoom.Down := false;
            btnruler.Down := False;
  FMapCursor := mcSelect;
  LoadNormalButtonImage;

  Map1.CurrentTool := miPanTool;
  Map1.MousePointer := miPanCursor;

  btnSelect.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnCursor_Normal.PNG');
  pnlStatic.Visible := false;
  btnPan.ImageIndex := 6;
end;

procedure TOverlayEditorForm.btnrulerClick(Sender: TObject);
begin
 btnruler.Down := not btnruler.Down;

  if btnruler.Down then
  begin
    with frmRuler do
    begin
      IDForm := 1;
      btnruler.ImageIndex := 14;
      Show;

    end;
  end
  else
  begin

    frmRuler.Hide;

  end;
end;
      procedure TOverlayEditorForm.OnAddRuller(Long, Lat: double);
begin

  if DrawFlagPoint.FList.Count = 0 then
  begin
    GbrFlagPoint(Lat, Long);
    GbrFlagPoint(Lat, Long);

    frmRuler.edtRulerStartPosLat.Text := formatDMS_latt(Lat);
    frmRuler.edtRulerStartPosLong.Text := formatDMS_long(Long);
    EditFlagPoint(0,Long,Lat);
    frmRuler.edtRulerEndPosLat.Text := formatDMS_latt(Lat);
    frmRuler.edtRulerEndPosLong.Text := formatDMS_long(Long);
    EditFlagPoint(1,Long,Lat);
  end
  else
  begin
    if FMapCursor = mcRulerStart then
    begin
      frmRuler.edtRulerStartPosLat.Text := formatDMS_latt(Lat);
      frmRuler.edtRulerStartPosLong.Text := formatDMS_long(Long);
      EditFlagPoint(0, Long, Lat)
    end
    else
    begin
      frmRuler.edtRulerEndPosLat.Text := formatDMS_latt(Lat);
      frmRuler.edtRulerEndPosLong.Text := formatDMS_long(Long);
      EditFlagPoint(1, Long, Lat)
    end;
  end;

end;
procedure TOverlayEditorForm.btnCenterGameClick(Sender: TObject);
begin
  Map1.CenterX := centLong;
  Map1.CenterY := centLatt;

  LoadNormalButtonImage;
  pnlStatic.Visible := false;

  RefreshMousePointer;
end;

{$ENDREGION}

procedure TOverlayEditorForm.GameCenterDynamic;
var
  i, cx, cy, ex, ey, fx, fy, r: Integer;
  dx, dy: Double;
  Point: TRect;
begin
  inherited;

  { Menggambar ring range }
  for i := 1 to 4 do
  begin
    dx := Map1.CenterX + (i * 2) / 60;
    dy := Map1.CenterY;

    FConverter.ConvertToScreen(Map1.CenterX, Map1.CenterY, cx, cy);
    FConverter.ConvertToScreen(dx, dy, ex, ey);

    r := Abs(cx - ex);

    Point.Left := cx - r;
    Point.Top := cy - r;
    Point.Right := cx + r;
    Point.Bottom := cy + r;

    with FCanvas do
    begin
      Brush.Style := bsClear;

      Pen.Style := psDashDot;
      Pen.Color := clGray;
      Pen.Width := 1;

      Ellipse(Point.Left, Point.Top, Point.Right, Point.Bottom);
    end;
  end;

  { Menggambar cross center }
  FConverter.ConvertToScreen(Map1.CenterX, Map1.CenterY, fx, fy);
  with FCanvas do
  begin
    Pen.Style := psSolid;
    MoveTo(Point.Left, fy);
    LineTo(Point.Right, fy);
    MoveTo(fx, Point.Top);
    LineTo(fx, Point.Bottom);
  end;
end;

procedure TOverlayEditorForm.OnKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in [#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetInput(TEdit(Sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;
end;

procedure TOverlayEditorForm.OnKeyPressTextSize(Sender: TObject; var Key: Char);
begin
  if not(Key in [#48 .. #57, #8, #13]) then
  begin
    Key := #0;
    Exit;
  end;

end;

procedure TOverlayEditorForm.pnlWarningClick(Sender: TObject);
begin
  pnlWarning.Visible := false;
end;

function TOverlayEditorForm.RecordToFileStream(fFile: String): Boolean;
var
  Fs: TFileStream;
begin
  Result := True;

  try
    Fs := TFileStream.Create(fFile, fmOPENWRITE or fmCREATE);
    case SelectedOverlay.FData.Tipe of
      osDynamic:
        DrawOverlay.SaveStreamDataDynamic(Fs);
      osStatic:
        DrawOverlay.SaveStreamDataStatic(Fs);
    end;
  except
    ShowMessage('Couldn''t save file overlay!' + #13);
    Result := false;
  end;
  Fs.Free; // << this actually writes the data to disk
end;

procedure TOverlayEditorForm.RefreshForm;
begin
  lblNameOverlay.Caption := SelectedOverlay.FData.Name;
  RefreshMousePointer;
  ClearEditText;
  Canceled;
  ClearFlagPoint;
  btnDelete.Enabled := false;
end;

procedure TOverlayEditorForm.RefreshLvPolyVertexList;
var
  j: Integer;
  ObjectFlagPoint: TFlagPoint;
  li: TListItem;
begin
  case FTipeOverlay of
    osDynamic:
      begin
        lvPolyVertexD.Items.BeginUpdate;
        try
          for j := 0 to lvPolyVertexD.Items.Count - 1 do
            lvPolyVertexD.Items.Item[j].Caption := IntToStr(j + 1);
        finally
          lvPolyVertexD.Items.EndUpdate;
        end;
      end;
    osStatic:
      begin
        lvPolyVertex.Items.BeginUpdate;
        try
          DrawFlagPoint.FList.Clear;

          for j := 0 to lvPolyVertex.Items.Count - 1 do
          begin
            lvPolyVertex.Items.Item[j].Caption := IntToStr(j + 1);

            li := lvPolyVertex.Items[j];

            ObjectFlagPoint := TFlagPoint.Create(FConverter);
            ObjectFlagPoint.Post.X := dmsToLong(li.SubItems[0]);
            ObjectFlagPoint.Post.Y := dmsToLatt(li.SubItems[1]);

            DrawFlagPoint.FList.Add(ObjectFlagPoint);
          end;
        finally
          lvPolyVertex.Items.EndUpdate;
        end;
      end;
  end;
end;

procedure TOverlayEditorForm.RefreshMousePointer;
begin
  Map1.CurrentTool := miSelectTool;
  Map1.MousePointer := miDefaultCursor;

  btnSelect.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnCursor_Normal.PNG');
  btnText.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnText_Normal.PNG');
  btnLine.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnLine_Normal.PNG');
  btnRectangle.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnRectangle_Normal.PNG');
  btnCircle.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnCircle_Normal.PNG');
  btnEllipse.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnEllipse_Normal.PNG');
  btnArc.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnArc_Normal.PNG');
  btnSector.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnSector_Normal.PNG');
  btnGrid.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnGrid_Normal.PNG');
  btnPolygon.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnPolygon_Normal.PNG');

  FisNoFill := True;
end;

procedure TOverlayEditorForm.GetPosition;
begin
  case FTagTombolPosition of
    0:
      begin
        edtTextPosLAt.Text := formatDMS_latt(my);
        edtTextPosLong.Text := formatDMS_long(mx);
      end;
    1:
      begin
        edtLineStartPosLat.Text := formatDMS_latt(my);
        edtLineStartPosLong.Text := formatDMS_long(mx);
      end;
    2:
      begin
        edtLineEndPosLat.Text := formatDMS_latt(my);
        edtLineEndPosLong.Text := formatDMS_long(mx);
      end;
    3:
      begin
        edtRectStartPosLat.Text := formatDMS_latt(my);
        edtRectStartPosLong.Text := formatDMS_long(mx);
      end;
    4:
      begin
        edtRectEndPosLat.Text := formatDMS_latt(my);
        edtRectEndPosLong.Text := formatDMS_long(mx);
      end;
    5:
      begin
        edtCirclePosLat.Text := formatDMS_latt(my);
        edtCirclePosLong.Text := formatDMS_long(mx);
      end;
    6:
      begin
        edtEllipsePosLat.Text := formatDMS_latt(my);
        edtEllipsePosLong.Text := formatDMS_long(mx);
      end;
    7:
      begin
        edtArcPosLat.Text := formatDMS_latt(my);
        edtArcPosLong.Text := formatDMS_long(mx);
      end;
    8:
      begin
        edtSectorPosLat.Text := formatDMS_latt(my);
        edtSectorPosLong.Text := formatDMS_long(mx);
      end;
    9:
      begin
        edtTablePosLat.Text := formatDMS_latt(my);
        edtTablePosLong.Text := formatDMS_long(mx);
      end;
    10:
      begin
        edtPolyPosLat.Text := formatDMS_latt(my);
        edtPolyPosLong.Text := formatDMS_long(mx);
      end;
  end;
end;

function TOverlayEditorForm.GetGridLong(xCursorPoint: Double): string;
var
  xCenter, diffX, diffXnm: Double;
  gridLong, addStringX: string;
begin
  // xCenter := ufrmSummaryOverlay.frmSummaryOverlay.GameArea.FGameArea.Game_Centre_Long;
  diffX := Abs(xCursorPoint - xCenter);
  diffXnm := diffX * 60;
  if xCursorPoint < xCenter then
    addStringX := 'W'
  else
    addStringX := 'E';
  gridLong := FormatFloat('0.00', diffXnm);
  Result := gridLong + ' nm ' + addStringX;;
end;

function TOverlayEditorForm.GetInput(s: string): Boolean;
var
  a, i: Integer;
begin
  Result := false;
  a := 0;

  for i := 1 to length(s) do
  begin
    if s[i] = '.' then
      a := a + 1;
  end;

  if a > 0 then
    Result := True;
end;

function TOverlayEditorForm.GetGridLatt(yCursorPoint: Double): string;
var
  yCenter, diffY, diffYnm: Double;
  gridLatt, addStringY: string;
begin
  // yCenter  := ufrmSummaryOverlay.frmSummaryOverlay.GameArea.FGameArea.Game_Centre_Lat;
  diffY := Abs(yCursorPoint - yCenter);
  diffYnm := diffY * 60;
  if yCursorPoint < yCenter then
    addStringY := 'S'
  else
    addStringY := 'N';
  gridLatt := FormatFloat('0.00', diffYnm);
  Result := gridLatt + ' nm ' + addStringY;
end;

procedure TOverlayEditorForm.getGridCursorPos;
var
  yCursorPoint, xCursorPoint, yCenter, xCenter, diffX, diffY: Double;
  diffXnm, diffYnm: Double;
  gridLatt, gridLong, addStringX, addStringY: string;
begin
  yCursorPoint := yy;
  xCursorPoint := xx;

  yCenter := Map1.CenterX;
  xCenter := Map1.CenterY;

  diffY := Abs(yCursorPoint - yCenter);
  diffX := Abs(xCursorPoint - xCenter);

  diffYnm := diffY * 60;
  diffXnm := diffX * 60;

  if yCursorPoint < yCenter then
    addStringY := 'S'
  else
    addStringY := 'N';

  if xCursorPoint < xCenter then
    addStringX := 'W'
  else
    addStringX := 'E';

  lbSlPosition.Caption := formatDMS_latt(yy);
  lblWPosition.Caption := formatDMS_long(xx);

  gridLatt := FormatFloat('0.00', diffYnm);
  gridLong := FormatFloat('0.00', diffXnm);
  lblnmSGrid.Caption := gridLatt + ' nm ' + addStringY;
  lblnmWGrid.Caption := gridLong + ' nm ' + addStringX;
end;

procedure TOverlayEditorForm.ClearEditText;
begin
  // * reset data & set button buat ambil koordinat down jadi false *\\

  { Text }
  edtTextPosLAt.Text := '';
  edtTextPosLong.Text := '';
  edtTextField.Text := 'None';

  edtTextRange.Text := '0';
  edtTextBearing.Text := '0';
  edtTextFieldD.Text := 'None';

  SpeedButton.Down := false;

  { Line }
  edtLineStartRange.Text := '0';
  edtLineStartBearing.Text := '0';
  edtLineEndRange.Text := '0';
  edtLineEndBearing.Text := '0';

  edtLineStartPosLong.Text := '';
  edtLineStartPosLat.Text := '';
  edtLineEndPosLong.Text := '';
  edtLineEndPosLat.Text := '';

  SpeedButton1.Down := false;
  SpeedButton2.Down := false;

  { Rectangle }
  edtRecStartRange.Text := '0';
  edtRecStartBearing.Text := '0';
  edtRecEndRange.Text := '0';
  edtRecEndBearing.Text := '0';

  edtRectStartPosLong.Text := '';
  edtRectStartPosLat.Text := '';
  edtRectEndPosLong.Text := '';
  edtRectEndPosLat.Text := '';

  SpeedButton3.Down := false;
  SpeedButton4.Down := false;

  { Circle }
  edtCircleRange.Text := '0';
  edtCircleBearing.Text := '0';
  edtCircleRadiusD.Text := '1';

  edtCircleRadius.Text := '1';
  edtCirclePosLong.Text := '';
  edtCirclePosLat.Text := '';

  SpeedButton5.Down := false;

  { Ellipse }
  edtEllipseRange.Text := '0';
  edtEllipseBearing.Text := '0';
  edtEllipseHorizontalD.Text := '1';
  edtEllipseVerticalD.Text := '1';

  edtHorizontal.Text := '1';
  edtVertical.Text := '1';
  edtEllipsePosLong.Text := '';
  edtEllipsePosLat.Text := '';

  SpeedButton6.Down := false;

  { Arc }
  edtArcRange.Text := '0';
  edtArcBearing.Text := '0';
  edtArcRadiusD.Text := '1';
  edtArcStartAngleD.Text := '0';
  edtArcEndAngleD.Text := '0';

  edtArcRadius.Text := '1';
  edtArcPosLong.Text := '';
  edtArcPosLat.Text := '';
  edtArcStartAngle.Text := '0';
  edtArcEndAngle.Text := '0';

  SpeedButton7.Down := false;

  { Sector }
  edtSectorRange.Text := '0';
  edtSectorBearing.Text := '0';
  edtSectorInnerD.Text := '1';
  edtSectorOuterD.Text := '1';
  edtSectorStartAngleD.Text := '0';
  edtSectorEndAngleD.Text := '0';

  edtSectorInner.Text := '1';
  edtSectorOuter.Text := '1';
  edtSectorPosLong.Text := '';
  edtSectorPosLat.Text := '';
  edtSectorStartAngle.Text := '0';
  edtSectorEndAngle.Text := '0';

  SpeedButton8.Down := false;

  { Grid }
  edtTableRange.Text := '0';
  edtTableBearing.Text := '0';
  edtTableHeightD.Text := '1';
  edtTableColumnD.Text := '1';
  edtTableWidthD.Text := '1';
  edtTableRowD.Text := '1';
  edtRotationAngleD.Text := '0';

  edtTableHeight.Text := '1';
  edtTableWidth.Text := '1';
  edtTablePosLong.Text := '';
  edtTablePosLat.Text := '';
  edtTableColumn.Text := '1';
  edtTableRow.Text := '1';
  edtTableRotationAngle.Text := '0';

  SpeedButton9.Down := false;

  { Polygon }
  edtPolygonRange.Text := '0';
  edtPolygonBearing.Text := '0';
  edtPolyPosLat.Text := '';
  edtPolyPosLong.Text := '';
  lvPolyVertexD.Clear;
  lvPolyVertex.Clear;

  SpeedButton10.Down := false;

  pnlWarning.Visible := false;
end;

procedure TOverlayEditorForm.ClearFlagPoint;
begin
  DrawFlagPoint.FList.Clear;
  Map1.Refresh;
  Map1.Repaint;
end;

procedure TOverlayEditorForm.LoadShape(fFile: String);
var
  Fs: TFileStream;
begin
  if not FileExists(fFile) then
    Exit;

  try
    Fs := TFileStream.Create(fFile, fmOPENREAD);
    case FTipeOverlay of
      osDynamic:
        DrawOverlay.ShowStreamDataDynamic(Fs);
      osStatic:
        DrawOverlay.ShowStreamDataStatic(Fs);
    end;
  except
    ShowMessage('Couldn''t load file overlay!' + #13);
  end;

  Fs.Free;
end;

procedure TOverlayEditorForm.lvPolyVertexSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  btnDelPoly.Visible := Selected;
  btnEditPoly.Visible := Selected;

  edtPolyPosLat.Text := '';
  edtPolyPosLong.Text := '';

  if Selected then
  begin
    FSelectedPolyID := Item.Index;
    edtPolyPosLong.Text := Item.SubItems[0];
    edtPolyPosLat.Text := Item.SubItems[1];
  end;
end;

procedure TOverlayEditorForm.setCBScale;
var
  widthNM: Integer;
  limitWidth: Array [0 .. 15] of Double;
  arrayTemp: Array [0 .. 30] of Double;
  arrayStringTemp: Array [0 .. 30] of String;
  resultTemp: Array [0 .. 30] of String;
  a, b: Integer;
begin
  case FTipeOverlay of
    osStatic:
      widthNM := floor(2500);
    osDynamic:
      widthNM := floor(16);
  end;

  // widthNM := floor(2500{uOverlayTemplateEditor.fmOverlayTemplateEditor.GameArea.FGameArea.Game_X_Dimension});

  // isi combo box
  cbSetScale.Clear;
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
    cbSetScale.Items.Add(resultTemp[b]);
  end;
end;

procedure TOverlayEditorForm.SetNoFill(val: Boolean);
begin
  if val then
  begin
    FisNoFill := True;
    pnlFill.Caption := 'No Fill';
    pnlFill.Color := $005B4216;
  end
  else
  begin
    FisNoFill := false;
    pnlFill.Caption := '';
    pnlFill.Color := $005B4216;
  end;
end;

procedure TOverlayEditorForm.btnNoFillClick(Sender: TObject);
begin
  case ShapeType of
    ovText, ovLine, ovArc, ovGrid:
      begin
        SetNoFill(True)
      end;
    ovRectangle, ovCircle, ovEllipse, ovSector, ovPolygon:
      begin
        FisNoFill := not FisNoFill;
        SetNoFill(FisNoFill);
      end;
  end;
end;

procedure TOverlayEditorForm.btnoutClick(Sender: TObject);
begin
  // if btnZoom.Down then
  // btnZoom.Down := False;
  btnout.Down := not btnout.Down;
  btnPan.Down := false;

  FMapCursor := mcSelect;
  LoadNormalButtonImage;

  Map1.CurrentTool := miZoomoutTool;
  Map1.MousePointer := miZoomoutCursor;

  btnSelect.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnCursor_Normal.PNG');
  pnlStatic.Visible := false;
  btnout.ImageIndex := 8;
end;

procedure TOverlayEditorForm.btnCloseClick(Sender: TObject);
begin
  RefreshMousePointer;
  btnPan.Down := false;
  btnZoom.Down := false;

  FMapCursor := mcSelect;
  btnOk.Enabled := false;

  AfterClose := false;
  Close;
end;

procedure TOverlayEditorForm.AddPolyDClick(Sender: TObject);
begin
  with lvPolyVertexD.Items.Add do
  begin
    SubItems.Add(edtPolygonRange.Text);
    SubItems.Add(edtPolygonBearing.Text);
  end;
  RefreshLvPolyVertexList;
end;

procedure TOverlayEditorForm.btnDeletePolyClick(Sender: TObject);
begin
  lvPolyVertex.Clear;
  ClearFlagPoint;
  ClearEditText;
end;

procedure TOverlayEditorForm.btnDeletePolyDClick(Sender: TObject);
begin
  lvPolyVertexD.Clear;
end;

procedure TOverlayEditorForm.btnDelPolyClick(Sender: TObject);
begin
  lvPolyVertex.Items.Delete(FSelectedPolyID);

  RefreshLvPolyVertexList;

  Map1.Refresh;
  Map1.Repaint;
end;

procedure TOverlayEditorForm.btnEditPolyClick(Sender: TObject);
begin
  with lvPolyVertex.Items[FSelectedPolyID] do
  begin
    Caption := '11';
    SubItems.Strings[0] := edtPolyPosLong.Text;
    SubItems.Strings[1] := edtPolyPosLat.Text;
  end;

  RefreshLvPolyVertexList;

  Map1.Refresh;
  Map1.Repaint;
end;

procedure TOverlayEditorForm.btnFillClick(Sender: TObject);
begin
  btnFill.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnFill_Select.PNG');
  btnOutline.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnOutline_Normal.PNG');

  FShapeColor := scFill;
  // btnNoFill.OnClick(btnNoFill);
end;

procedure TOverlayEditorForm.btngameareaClick(Sender: TObject);
begin
      frmGameAreaPickList:=TfrmGameAreaPickList.Create(self);
      try
        with frmGameAreaPickList do
        begin
          ShowModal;
          LoadMap('D:\Map\GST_GAME\AOTC\'+ SelectedGameAreaName+'\' +SelectedGameAreaName+'.gst');

        end;
      finally
       btngamearea.ImageIndex := 11;
            frmGameAreaPickList.Free;
      end;
//       btnSelect.Picture.LoadFromFile
//    ('data\Image DBEditor\Interface\Button\Db1.PNG');
//  pnlStatic.Visible := false;

end;

procedure TOverlayEditorForm.btnOutlineClick(Sender: TObject);
begin
  btnOutline.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnOutline_Select.PNG');
  btnFill.Picture.LoadFromFile
    ('data\Image DBEditor\Interface\Button\btnFill_Normal.PNG');

  FShapeColor := scOutline;
end;

procedure TOverlayEditorForm.btnHandleShapePosition(Sender: TObject);
begin
  if (Sender is TSpeedButton) then
  begin
    FTagTombolPosition := TSpeedButton(Sender).Tag;

    if FTagTombolPosition = 0 then // Button position Text
    begin
      if not SpeedButton.Down then
      begin
        ClearFlagPoint;
        ClearEditText;
        Canceled;

        Map1.CurrentTool := miSelectTool;
        Map1.MousePointer := miDefaultCursor;
        FMapCursor := mcSelect;
      end
      else
      begin
        Map1.CurrentTool := miArrowTool;
        Map1.MousePointer := miCrossCursor;
        FMapCursor := mcAdd;
      end;
    end
    else if FTagTombolPosition = 1 then // Button position Line
    begin
      if SpeedButton1.Down = false then
      begin
        ClearFlagPoint;
        ClearEditText;
        Canceled;

        Map1.CurrentTool := miSelectTool;
        Map1.MousePointer := miDefaultCursor;
        FMapCursor := mcSelect;
      end
      else
      begin
        Map1.CurrentTool := miArrowTool;
        Map1.MousePointer := miCrossCursor;
        FMapCursor := mcAdd;
      end;
    end
    else if FTagTombolPosition = 2 then // Button position Line
    begin
      if SpeedButton2.Down = false then
      begin
        ClearFlagPoint;
        ClearEditText;
        Canceled;

        Map1.CurrentTool := miSelectTool;
        Map1.MousePointer := miDefaultCursor;
        FMapCursor := mcSelect;
      end
      else
      begin
        Map1.CurrentTool := miArrowTool;
        Map1.MousePointer := miCrossCursor;
        FMapCursor := mcAdd;
      end;
    end
    else if FTagTombolPosition = 3 then // Button position Rectangle
    begin
      if not SpeedButton3.Down then
      begin
        ClearFlagPoint;
        ClearEditText;
        Canceled;

        Map1.CurrentTool := miSelectTool;
        Map1.MousePointer := miDefaultCursor;
        FMapCursor := mcSelect;
      end
      else
      begin
        Map1.CurrentTool := miArrowTool;
        Map1.MousePointer := miCrossCursor;
        FMapCursor := mcAdd;
      end;
    end
    else if FTagTombolPosition = 4 then // Button position Rectangle
    begin
      if not SpeedButton4.Down then
      begin
        ClearFlagPoint;
        ClearEditText;
        Canceled;

        Map1.CurrentTool := miSelectTool;
        Map1.MousePointer := miDefaultCursor;
        FMapCursor := mcSelect;
      end
      else
      begin
        Map1.CurrentTool := miArrowTool;
        Map1.MousePointer := miCrossCursor;
        FMapCursor := mcAdd;
      end;
    end
    else if FTagTombolPosition = 5 then // Button position Circle
    begin
      if not SpeedButton5.Down then
      begin
        ClearFlagPoint;
        ClearEditText;
        Canceled;

        Map1.CurrentTool := miSelectTool;
        Map1.MousePointer := miDefaultCursor;
        FMapCursor := mcSelect;
      end
      else
      begin
        Map1.CurrentTool := miArrowTool;
        Map1.MousePointer := miCrossCursor;
        FMapCursor := mcAdd;
      end;
    end
    else if FTagTombolPosition = 6 then // Button position Ellipse
    begin
      if not SpeedButton6.Down then
      begin
        ClearFlagPoint;
        ClearEditText;
        Canceled;

        Map1.CurrentTool := miSelectTool;
        Map1.MousePointer := miDefaultCursor;
        FMapCursor := mcSelect;
      end
      else
      begin
        Map1.CurrentTool := miArrowTool;
        Map1.MousePointer := miCrossCursor;
        FMapCursor := mcAdd;
      end;
    end
    else if FTagTombolPosition = 7 then // Button position Arc
    begin
      if not SpeedButton7.Down then
      begin
        ClearFlagPoint;
        ClearEditText;
        Canceled;

        Map1.CurrentTool := miSelectTool;
        Map1.MousePointer := miDefaultCursor;
        FMapCursor := mcSelect;
      end
      else
      begin
        Map1.CurrentTool := miArrowTool;
        Map1.MousePointer := miCrossCursor;
        FMapCursor := mcAdd;
      end;
    end
    else if FTagTombolPosition = 8 then // Button position Sector
    begin
      if not SpeedButton8.Down then
      begin
        ClearFlagPoint;
        ClearEditText;
        Canceled;

        Map1.CurrentTool := miSelectTool;
        Map1.MousePointer := miDefaultCursor;
        FMapCursor := mcSelect;
      end
      else
      begin
        Map1.CurrentTool := miArrowTool;
        Map1.MousePointer := miCrossCursor;
        FMapCursor := mcAdd;
      end;
    end
    else if FTagTombolPosition = 9 then // Button position Grid
    begin
      if not SpeedButton9.Down then
      begin
        ClearFlagPoint;
        ClearEditText;
        Canceled;

        Map1.CurrentTool := miSelectTool;
        Map1.MousePointer := miDefaultCursor;
        FMapCursor := mcSelect;
      end
      else
      begin
        Map1.CurrentTool := miArrowTool;
        Map1.MousePointer := miCrossCursor;
        FMapCursor := mcAdd;
      end;
    end
    else if FTagTombolPosition = 10 then // Button position Polygon
    begin
      if not SpeedButton10.Down then
      begin
        ClearFlagPoint;
        ClearEditText;
        Canceled;

        Map1.CurrentTool := miSelectTool;
        Map1.MousePointer := miDefaultCursor;
        FMapCursor := mcSelect;
      end
      else
      begin
        Map1.CurrentTool := miArrowTool;
        Map1.MousePointer := miCrossCursor;
        FMapCursor := mcAdd;
      end;
    end;
  end;
end;

procedure TOverlayEditorForm.Canceled;
var
  j: Integer;
  ShapeStatic: TMainStaticShape;
  ShapeDynamic: TMainDynamicShape;
begin
  for j := 0 to DrawOverlay.DynamicList.Count - 1 do
  begin
    ShapeDynamic := DrawOverlay.DynamicList.Items[j];
    ShapeDynamic.isSelected := false;
  end;

  for j := 0 to DrawOverlay.StaticList.Count - 1 do
  begin
    ShapeStatic := DrawOverlay.StaticList.Items[j];
    ShapeStatic.isSelected := false;
  end;

  Map1.Repaint;
end;

procedure TOverlayEditorForm.cbbDashesPenSelect(Sender: TObject);
begin
  if cbbDashesPen.Text = 'Solid' then
  begin
    cbbWeightPen.Enabled := True;
    cbbWeightPen.Text := cbbWeightPen.Text
  end
  else
  begin
    cbbWeightPen.Enabled := True;
    cbbWeightPen.Text := '1'
  end;
end;

procedure TOverlayEditorForm.cbSetScaleChange(Sender: TObject);
var
  z: Double;
  s: string;
begin
  Map1.OnMapViewChanged := nil;

  if cbSetScale.ItemIndex < 0 then
    Exit;

  if (cbSetScale.ItemIndex <= 16) then
  begin
    s := cbSetScale.Items[cbSetScale.ItemIndex];
    try
      z := StrToFloat(s);
      Map1.ZoomTo(z, Map1.CenterX, Map1.CenterY);
    finally

    end;
  end
  else
    cbSetScale.ItemIndex := cbSetScale.ItemIndex - 1;

  Map1.OnMapViewChanged := Map1MapViewChanged;
end;

function TOverlayEditorForm.CekInput(IdObject: Integer): Boolean;
begin
  Result := false;

  case FTipeOverlay of

{$REGION ' Dynamic Section '}
    osDynamic:
      begin
        case IdObject of
          ovText: { Text }
            begin
              if (edtTextRange.Text = '') or (edtTextBearing.Text = '') or
                (edtTextFieldD.Text = '') or (cbbTextSizeD.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (StrToInt(cbbTextSizeD.Text) > 72) or
                (StrToInt(cbbTextSizeD.Text) = 0) then
              begin
                lblWarning.Caption := 'Invalid size input';
                Result := True;
              end;
            end;
          ovLine: { Line }
            begin
              if (edtLineStartRange.Text = '') or
                (edtLineStartBearing.Text = '') or (edtLineEndRange.Text = '')
                or (edtLineEndBearing.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtLineStartRange.Text = edtLineEndRange.Text) and
                (edtLineEndRange.Text = edtLineEndBearing.Text) then
              begin
                lblWarning.Caption :=
                  'Invalid input..., Start and End position can not be identical';
                Result := True;
              end;
            end;
          ovRectangle: { Rectangle }
            begin
              if (edtRecStartRange.Text = '') or (edtRecStartBearing.Text = '')
                or (edtRecEndRange.Text = '') or (edtRecEndBearing.Text = '')
              then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtRecStartRange.Text = edtRecEndRange.Text) and
                (edtRecStartBearing.Text = edtRecEndBearing.Text) then
              begin
                lblWarning.Caption :=
                  'Invalid input..., Top-Left and Bottom-Right position can not be identical';
                Result := True;
              end;
            end;
          ovCircle: { Circle }
            begin
              if (edtCircleRange.Text = '') or (edtCircleBearing.Text = '') or
                (edtCircleRadiusD.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtCircleRadiusD.Text = '0') then
              begin
                lblWarning.Caption :=
                  'Invalid radius input, minimum radius > 0';
                Result := True;
              end;
            end;
          ovEllipse: { Ellipse }
            begin
              if (edtEllipseRange.Text = '') or (edtEllipseBearing.Text = '') or
                (edtEllipseHorizontalD.Text = '') or
                (edtEllipseVerticalD.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtEllipseHorizontalD.Text = '0') or
                (edtEllipseVerticalD.Text = '0') then
              begin
                lblWarning.Caption :=
                  'Invalid radius input, minimum radius > 0';
                Result := True;
              end;
            end;

          ovArc: { Arc }
            begin
              if (edtArcRange.Text = '') or (edtArcBearing.Text = '') or
                (edtArcRadiusD.Text = '') or (edtArcStartAngleD.Text = '') or
                (edtArcEndAngleD.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtArcRadiusD.Text = '0') then
              begin
                lblWarning.Caption :=
                  'Invalid radius input, minimum radius > 0';
                Result := True;
              end
              else if (edtArcStartAngleD.Text = edtArcEndAngleD.Text) then
              begin
                lblWarning.Caption :=
                  'Invalid input..., Start and End Angle can not be identical';
                Result := True;
              end;
            end;
          ovSector: { Sector }
            begin
              if (edtSectorRange.Text = '') or (edtSectorBearing.Text = '') or
                (edtSectorInnerD.Text = '') or (edtSectorOuterD.Text = '') or
                (edtSectorStartAngleD.Text = '') or
                (edtSectorEndAngleD.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtSectorInnerD.Text = '0') or
                (edtSectorOuterD.Text = '0') then
              begin
                lblWarning.Caption :=
                  'Invalid radius input, minimum radius > 0';
                Result := True;
              end
              else if (edtSectorStartAngleD.Text = edtSectorEndAngleD.Text) then
              begin
                lblWarning.Caption :=
                  'Invalid input..., Start and End Angle can not be identical';
                Result := True;
              end
            end;
          ovGrid: { Grid }
            begin
              if (edtTableRange.Text = '') or (edtTableBearing.Text = '') or
                (edtTableHeightD.Text = '') or (edtTableColumnD.Text = '') or
                (edtTableWidthD.Text = '') or (edtTableRowD.Text = '') or
                (edtRotationAngleD.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete Data Input';
                Result := True;
              end
              else if (edtTableHeightD.Text = '0') or
                (edtTableColumnD.Text = '0') or (edtTableWidthD.Text = '0') or
                (edtTableRowD.Text = '0') then
              begin
                lblWarning.Caption :=
                  'Invalid input, minimum Col, Row and height > 0';
                Result := True;
              end;
            end;
          ovPolygon: { Polygon }
            begin
              if lvPolyVertexD.Items.Count < 1 then
              begin
                lblWarning.Caption := 'Incomplete Data Input';
                Result := True;
              end;
            end;
        end;
      end;
{$ENDREGION}
{$REGION ' Static Section '}
    osStatic:
      begin
        case IdObject of
          ovText: { Text }
            begin
              if (edtTextPosLong.Text = '') or (edtTextPosLAt.Text = '') or
                (edtTextField.Text = '') or (cbbTextSize.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (StrToInt(cbbTextSize.Text) > 72) or
                (StrToInt(cbbTextSize.Text) = 0) then
              begin
                lblWarning.Caption := 'Invalid size input';
                Result := True;
              end;
            end;
          ovLine: { Line }
            begin
              if (edtLineStartPosLong.Text = '') or
                (edtLineStartPosLat.Text = '') or (edtLineEndPosLong.Text = '')
                or (edtLineEndPosLat.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtLineStartPosLong.Text = edtLineEndPosLong.Text) and
                (edtLineStartPosLat.Text = edtLineEndPosLat.Text) then
              begin
                lblWarning.Caption :=
                  'Invalid input..., Start and End position can not be identical';
                Result := True;
              end;
            end;
          ovRectangle: { Rectangle }
            begin
              if (edtRectStartPosLong.Text = '') or
                (edtRectStartPosLat.Text = '') or (edtRectEndPosLong.Text = '')
                or (edtRectEndPosLat.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtRectStartPosLong.Text = edtRectEndPosLong.Text) and
                (edtRectStartPosLat.Text = edtRectEndPosLat.Text) then
              begin
                lblWarning.Caption :=
                  'Invalid input..., Top-Left and Bottom-Right position can not be identical';
                Result := True;
              end;
            end;
          ovCircle: { Circle }
            begin
              if (edtCirclePosLong.Text = '') or (edtCirclePosLat.Text = '') or
                (edtCircleRadius.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtCircleRadius.Text = '0') then
              begin
                lblWarning.Caption :=
                  'Invalid radius input, minimum radius > 0';
                Result := True;
              end;
            end;
          ovEllipse: { Ellipse }
            begin
              if (edtEllipsePosLong.Text = '') or (edtEllipsePosLat.Text = '')
                or (edtHorizontal.Text = '') or (edtVertical.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtHorizontal.Text = '0') or (edtVertical.Text = '0')
              then
              begin
                lblWarning.Caption :=
                  'Invalid radius input, minimum radius > 0';
                Result := True;
              end;
            end;
          ovArc: { Arc }
            begin
              if (edtArcPosLong.Text = '') or (edtArcPosLat.Text = '') or
                (edtArcRadius.Text = '') or (edtArcEndAngle.Text = '') or
                (edtArcStartAngle.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtArcRadius.Text = '0') then
              begin
                lblWarning.Caption :=
                  'Invalid radius input, minimum radius > 0';
                Result := True;
              end
              else if (edtArcEndAngle.Text = edtArcStartAngle.Text) then
              begin
                lblWarning.Caption :=
                  'Invalid input..., Start and End Angle can not be identical';
                Result := True;
              end;
            end;
          ovSector: { Sector }
            begin
              if (edtSectorPosLong.Text = '') or (edtSectorPosLat.Text = '') or
                (edtSectorInner.Text = '') or (edtSectorOuter.Text = '') or
                (edtSectorStartAngle.Text = '') or (edtSectorEndAngle.Text = '')
              then
              begin
                lblWarning.Caption := 'Incomplete data input';
                Result := True;
              end
              else if (edtSectorInner.Text = '0') or (edtSectorOuter.Text = '0')
              then
              begin
                lblWarning.Caption :=
                  'Invalid radius input, minimum radius > 0';
                Result := True;
              end
              else if (edtSectorStartAngle.Text = edtSectorEndAngle.Text) then
              begin
                lblWarning.Caption :=
                  'Invalid input..., Start and End Angle can not be identical';
                Result := True;
              end
            end;
          ovGrid: { Grid }
            begin
              if (edtTablePosLong.Text = '') or (edtTablePosLat.Text = '') or
                (edtTableHeight.Text = '') or (edtTableColumn.Text = '') or
                (edtTableWidth.Text = '') or (edtTableRow.Text = '') or
                (edtTableRotationAngle.Text = '') then
              begin
                lblWarning.Caption := 'Incomplete Data Input';
                Result := True;
              end
              else if (edtTableHeight.Text = '0') or (edtTableColumn.Text = '0')
                or (edtTableWidth.Text = '0') or (edtTableRow.Text = '0') then
              begin
                lblWarning.Caption :=
                  'Invalid input, minimum Col, Row and height > 0';
                Result := True;
              end;
            end;
          ovPolygon: { Polygon }
            begin
              if lvPolyVertex.Items.Count < 1 then
              begin
                lblWarning.Caption := 'Incomplete Data Input';
                Result := True;
              end;
            end;
        end;
      end;
{$ENDREGION}
  end;

  if Result then
  begin
    pnlWarning.Visible := True;
    lbl33.Visible := True;
    lblWarning.Visible := True;
    lbl33.Font.Color := clRed;
    lbl33.Font.Style := [fsBold];
    lblWarning.Font.Color := clRed;
    // isInputProblem := True;
  end;
end;

procedure TOverlayEditorForm.colorChooseChange(Sender: TObject);
begin
  if FShapeColor = scOutline then
  begin
    pnlOutline.Color := colorChoose.ForegroundColor;
  end
  else
  begin
    FisNoFill := false;
    pnlFill.Caption := '';
    pnlFill.Color := colorChoose.ForegroundColor;
  end;
end;

procedure TOverlayEditorForm.edtArcRadiusChange(Sender: TObject);
var
  RadiusValues: Integer;
begin
  RadiusValues := StrToInt(edtArcRadius.Text);

  if RadiusValues > 31 then
end;

procedure TOverlayEditorForm.ScreenShot(DestBitmap: TBitmap);
var
  DC: HDC;
begin
  DC := GetDC(GetDesktopWindow);
  try
    DestBitmap.Width := GetDeviceCaps(DC, HORZRES);
    DestBitmap.Height := GetDeviceCaps(DC, VERTRES);
    BitBlt(DestBitmap.canvas.Handle, 0, 0, DestBitmap.Width, DestBitmap.Height,
      DC, 0, 0, SRCCOPY);
  finally
    ReleaseDC(GetDesktopWindow, DC);
  end;
end;

procedure TOverlayEditorForm.SelectShape(pos: TPoint);
begin
  if FTipeOverlay = osDynamic then
  begin
    DrawOverlay.SelectShapeDynamic(IdSelectShape, pos);
  end
  else
  begin
    DrawOverlay.SelectShapeStatic(IdSelectShape, pos);
  end;
end;

procedure TOverlayEditorForm.cbbDashesPenDSelect(Sender: TObject);
begin
  if cbbDashesPen.Text = 'Solid' then
  begin
    cbbWeightPen.Enabled := True;
    cbbWeightPen.Text := cbbWeightPen.Text;
  end
  else
  begin
    cbbWeightPen.Enabled := false;
    cbbWeightPen.Text := '1';
  end;
end;

end.
