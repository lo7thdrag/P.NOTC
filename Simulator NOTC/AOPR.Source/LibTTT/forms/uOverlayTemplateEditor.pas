unit uOverlayTemplateEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uDBEditSetting, uGameData_TTT, uDBAssetObject,
  Buttons, uMainOverlay, uMainStaticShape, uMainDynamicShape, uSimObjects, uT3DetectedTrack,
  uFormula, uDataTypes,
  ColorGrd,  U_Helper,uDrawOverlay, Vcl.Imaging.pngimage{, acPNG};

type
  E_ShapeColor = (scOutline, scFill);

  TfmOverlayEditor = class(TForm)
    grpTemplate: TGroupBox;
    lvTemplates: TListView;
    btnNew: TSpeedButton;
    btnEdit: TSpeedButton;
    btnDelete: TSpeedButton;
    btnCloseTemplate: TSpeedButton;
    pnlType: TPanel;
    grpStatic: TGroupBox;
    chkShowOverlayTemplate: TCheckBox;
    grpDynamic: TGroupBox;
    lvTrack: TListView;
    pnlCreateNew: TPanel;
    Label1: TLabel;
    Label65: TLabel;
    Label2: TLabel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    edtNameOverlay: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    btnAttach: TSpeedButton;
    btnDetach: TSpeedButton;
    Label4: TLabel;
    Panel1: TPanel;
    Bevel5: TBevel;
    rbStatic: TRadioButton;
    rbDynamic: TRadioButton;
    grpObjectEditor: TGroupBox;
    Bevel1: TBevel;
    Bevel6: TBevel;
    pnlStatic: TPanel;
    btnObjectApply: TButton;
    btnObjectDelete: TButton;
    btnObjectCancel: TButton;
    lblShape: TLabel;
    grpRectangle: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    edtRectStartPosLat: TEdit;
    edtRectStartPosLong: TEdit;
    edtRectEndPosLat: TEdit;
    edtRectEndPosLong: TEdit;
    lblState: TLabel;
    Bevel7: TBevel;
    grpText: TGroupBox;
    lblTextPosition: TLabel;
    lblTextField: TLabel;
    lblTextSize: TLabel;
    SpeedButton: TSpeedButton;
    edtTextPosLat: TEdit;
    edtTextField: TEdit;
    edtTextPosLong: TEdit;
    cbbTextSize: TComboBox;
    grpGrid: TGroupBox;
    Label29: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    bvl2: TBevel;
    lbl13: TLabel;
    bvl3: TBevel;
    lbl14: TLabel;
    lbl15: TLabel;
    SpeedButton9: TSpeedButton;
    edtTablePosLat: TEdit;
    edtTablePosLong: TEdit;
    edtTableHeight: TEdit;
    edtTableWidth: TEdit;
    edtTableColumn: TEdit;
    edtTableRow: TEdit;
    edtTableRotationAngle: TEdit;
    grpLine: TGroupBox;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    Label11: TLabel;
    SpeedButton2: TSpeedButton;
    edtLineStartPosLat: TEdit;
    edtLineStartPosLong: TEdit;
    edtLineEndPosLat: TEdit;
    edtLineEndPosLong: TEdit;
    grpEllipse: TGroupBox;
    Label14: TLabel;
    lblHorizontal: TLabel;
    Label23: TLabel;
    lblVertical: TLabel;
    lbl6: TLabel;
    bvl1: TBevel;
    Label22: TLabel;
    SpeedButton6: TSpeedButton;
    edtEllipsePosLat: TEdit;
    edtEllipsePosLong: TEdit;
    edtHorizontal: TEdit;
    edtVertical: TEdit;
    grpPolygon: TGroupBox;
    Label13: TLabel;
    SpeedButton10: TSpeedButton;
    edtPolyPosLat: TEdit;
    edtPolyPosLong: TEdit;
    lvPolyVertex: TListView;
    grpArc: TGroupBox;
    Label21: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    SpeedButton7: TSpeedButton;
    edtArcPosLat: TEdit;
    edtArcPosLong: TEdit;
    edtArcRadius: TEdit;
    edtArcStartAngle: TEdit;
    edtArcEndAngle: TEdit;
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
    bvlRadii: TBevel;
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
    grpCircle: TGroupBox;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    SpeedButton5: TSpeedButton;
    edtCirclePosLong: TEdit;
    edtCircleRadius: TEdit;
    edtCirclePosLat: TEdit;
    grpNone: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel9: TBevel;
    btnObjectClose: TButton;
    pnlTrackSelection: TPanel;
    Label15: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    lb6: TLabel;
    lb7: TLabel;
    btnTargetSearch: TSpeedButton;
    Bevel10: TBevel;
    Bevel11: TBevel;
    btnTrackSelectionCancel: TButton;
    edtTrack: TEdit;
    edtRange: TEdit;
    edtBearing: TEdit;
    edtRotation: TEdit;
    btnTrackSelectionOK: TButton;
    rbTrueOrientation: TRadioButton;
    rbRelativeOrientation: TRadioButton;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label24: TLabel;
    pnlDynamic: TPanel;
    grpPolygonD: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label37: TLabel;
    AddPolyD: TSpeedButton;
    edtPolygonRange: TEdit;
    edtPolygonBearing: TEdit;
    lvPolyVertexD: TListView;
    grpRectangleD: TGroupBox;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    edtRecStartRange: TEdit;
    edtRecStartBearing: TEdit;
    edtRecEndRange: TEdit;
    edtRecEndBearing: TEdit;
    grpLineD: TGroupBox;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl85: TLabel;
    lbl23: TLabel;
    lbl25: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    edtLineStartRange: TEdit;
    edtLineStartBearing: TEdit;
    edtLineEndRange: TEdit;
    edtLineEndBearing: TEdit;
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
    lbl81: TLabel;
    lbl82: TLabel;
    lbl83: TLabel;
    Label44: TLabel;
    Bevel12: TBevel;
    Label45: TLabel;
    edtTableRange: TEdit;
    edtTableBearing: TEdit;
    edtTableHeightD: TEdit;
    edtTableWidthD: TEdit;
    edtTableColumnD: TEdit;
    edtTableRowD: TEdit;
    edtRotationAngleD: TEdit;
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
    lbl63: TLabel;
    lbl89: TLabel;
    lbl90: TLabel;
    Label46: TLabel;
    edtSectorRange: TEdit;
    edtSectorInnerD: TEdit;
    edtSectorOuterD: TEdit;
    edtSectorStartAngleD: TEdit;
    edtSectorEndAngleD: TEdit;
    edtSectorBearing: TEdit;
    grpEllipseD: TGroupBox;
    lbl47: TLabel;
    lbl48: TLabel;
    lbl50: TLabel;
    lbl51: TLabel;
    lbl52: TLabel;
    bvl4: TBevel;
    lbl49: TLabel;
    lbl79: TLabel;
    lbl80: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    edtEllipseRange: TEdit;
    edtEllipseBearing: TEdit;
    edtEllipseHorizontalD: TEdit;
    edtEllipseVerticalD: TEdit;
    grpTextD: TGroupBox;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl91: TLabel;
    lbl93: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    edtTextRange: TEdit;
    edtTextFieldD: TEdit;
    edtTextBearing: TEdit;
    cbbTextSizeD: TComboBox;
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
    Label59: TLabel;
    Label60: TLabel;
    edtArcRange: TEdit;
    edtArcBearing: TEdit;
    edtArcRadiusD: TEdit;
    edtArcStartAngleD: TEdit;
    edtArcEndAngleD: TEdit;
    grpNoneD: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    btnNone: TSpeedButton;
    lbl94: TLabel;
    lbl111: TLabel;
    pnlWarning: TPanel;
    lbl86: TLabel;
    lblWarning: TLabel;
    Bevel8: TBevel;
    btnAddPoint: TSpeedButton;
    btnEditPoint: TSpeedButton;
    btnDeletePoint: TSpeedButton;
    btnClearPoint: TSpeedButton;
    btnAddPointD: TSpeedButton;
    btnEditPointD: TSpeedButton;
    btnDeletePointD: TSpeedButton;
    btnClearPointD: TSpeedButton;
    pnlWarningEdit: TPanel;
    lblWarningEdit: TLabel;
    rgForce: TRadioGroup;
    chkShowAllOverlayTemplate: TCheckBox;
    chkHideAllOverlayTemplate: TCheckBox;
    btnMove: TSpeedButton;
    lblIdxDrawOverlay: TLabel;
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
    grpColorEditing: TGroupBox;
    btnOutline: TImage;
    btnFill: TImage;
    pnlOutline: TPanel;
    pnlFill: TPanel;
    grbColour: TGroupBox;
    colorChoose: TColorGrid;
    pnl1: TPanel;
    btnNoFill: TStaticText;
    GroupBox1: TGroupBox;
    pnlPenEditing: TPanel;
    lbl16: TLabel;
    Label3: TLabel;
    cbbWeightPen: TComboBox;
    cbbDashesPen: TComboBox;

    procedure FormShow(Sender: TObject);

    procedure rbTipeHandle(Sender: TObject);
    procedure rbDomainHandle(Sender: TObject);

    procedure lvTemplatesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvTrackSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);

    procedure btnHandleTemplate(Sender: TObject);
    procedure btnHandleShape(Sender: TObject);
    procedure btnHandleShapePosition(Sender: TObject);
    procedure btnHandleObjectEditor(Sender: TObject);

    procedure btnAttachClick(Sender: TObject);
    procedure btnTargetSearchClick(Sender: TObject);
//    procedure chkShowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnDetachClick(Sender: TObject);
    procedure AddPolyDClick(Sender: TObject);

    procedure OnKeyPress(Sender: TObject; var Key: Char);
    procedure btnOutlineClick(Sender: TObject);
    procedure btnFillClick(Sender: TObject);
    procedure txtNoFillClick(Sender: TObject);
    procedure colorChooseChange(Sender: TObject);
    procedure cbbDashesPenSelect(Sender: TObject);
    procedure lvPolyVertexSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnClearPointClick(Sender: TObject);
    procedure btnDeletePointClick(Sender: TObject);
    procedure btnEditPointClick(Sender: TObject);
    procedure btnAddPointClick(Sender: TObject);
    procedure btnAddPointDClick(Sender: TObject);
    procedure btnEditPointDClick(Sender: TObject);
    procedure btnClearPointDClick(Sender: TObject);
    procedure btnDeletePointDClick(Sender: TObject);
    procedure lvPolyVertexDSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ReadOnlycbb(Sender: TObject; var Key: Char);
    procedure templateShowHide(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnNoFillClick(Sender: TObject);

  private
    FTagTombolPosition : Integer;
    FTrackPlatform: TSimObject;

    FShapeType : Integer;
    FShapeColor : E_ShapeColor;


    procedure SetTrackPlatform(const Value: TSimObject);    { Private declarations }

  protected
    FControlled: TObject;

  public
    Action : Byte;

    FisNoFill : Boolean;
    FSelectedOverlay : TMainOverlayTemplate;

    Temporary : TList;
    TemporaryD : TList;
    IsEditObject : Boolean;
    TagObject : Integer;
    TipeOverlay : Integer;
    StateOverlay : Integer; {tipe overlay utk kebutuhan tampilan}
    DomainOverlay : Integer;
    NoShapeInList{, IdShape} : Integer;
    IdSelectedTemplate : Integer;
    IdSelectedTrack: Integer;
    IdTrackInstanceIndex : Integer;
    IdSelectedPoint, IdSelectedPointD : Integer;
    roleOverlay : Byte;
    FFormula      : TFormula;
    IsFind : Boolean; // untuk menandai kalu gambar bisa digeser

//    NameSelectedTemplate : string;
    ForceSelectedTemplate : Byte;
    RoleSelectedTemplate : String;
    isMoveOverlay : Boolean;
    PostX, PostY : Double;
    idxDrawOverlay : Integer;
    maxIdxDrawOverlay : Integer;
    minIdxDrawOverlay : Integer;

    procedure Apply;
    procedure Deleted;
    procedure Canceled;

    procedure AddTemplate;
//    function AddTemplate:Boolean;
    procedure AddTrackSelection;
    procedure EditTemplate;
    procedure SelectTemplate;
    procedure SelectShape(pos : TPoint);
    procedure DeleteTemplate;
    procedure FillEditText;
    procedure ClearEditText;
    procedure ClearFlagPoint;
    procedure UpdateOverlayTemplateList;
    procedure RefreshDynamicTrack;
    procedure RefreshLvPolyVertexList(i: Byte);

    procedure ChangePosition(idAction : Integer);
    procedure clearSelect;

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
    procedure GbrFlagPoint(mx, my :Double);

    procedure SetNoFill(val : Boolean);
    procedure ReposOverlayStatic(startX, startY, endX, endY: Double);
    procedure SelectShapeStatic (var NoShapeInList : Integer; IdTemplate: Integer; pos : TPoint);
    procedure ShowForceOverlayEdit;

    function FindIdSelectedShape: Boolean;
    function lineTypeChoice (linetype :TPenStyle): String;
    function FilterName(): Boolean;
    function CekInput(IdObject : Integer): Boolean;
    function GetInput(s : string): Boolean;

    property TrackPlatform: TSimObject read FTrackPlatform write  SetTrackPlatform;
    property ShapeType : Integer read FShapeType write  FShapeType;
  end;

var
  isBtnFrameClick : Boolean;
  isBtnFillClick : Boolean;
  isColor : Boolean;
  isNoFill : Boolean;
  isFrameFill : Boolean;
  fmOverlayEditor: TfmOverlayEditor;
  isInputProblem : Boolean;
  drawOverlay : TOverlayTemplateContainer;
  lvTemplateOriginal : TListView;
implementation

{$R *.dfm}
uses uSimMgr_Client, uDataModuleTTT, uDBScenario, uLibSettingTTT, tttData,
  ufTacticalDisplay, uMapXHandler, uT3Unit, uFormUtil, uBaseCoordSystem,
  ufrmKeyboard ;


procedure TfmOverlayEditor.lvPolyVertexDSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  li : TListItem;
begin
  if Selected then
  begin
    IdSelectedPointD := lvPolyVertexD.Selected.Index;
    li := lvPolyVertexD.Items[IdSelectedPointD];
    edtPolygonRange.Text := li.SubItems[0];
    edtPolygonBearing.Text := li.SubItems[1];

    btnEditPointD.Enabled := True;
    btnDeletePointD.Enabled := True;
  end
  else
  begin
    btnEditPointD.Enabled := False;
    btnDeletePointD.Enabled := False;
  end;
end;

procedure TfmOverlayEditor.lvPolyVertexSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  li : TListItem;
begin
  if Selected then
  begin
    IdSelectedPoint := lvPolyVertex.Selected.Index;
    li := lvPolyVertex.Items[IdSelectedPoint];
    edtPolyPosLat.Text := li.SubItems[1];
    edtPolyPosLong.Text := li.SubItems[0];

    btnEditPoint.Enabled := True;
    btnDeletePoint.Enabled := True;
  end
  else
  begin
    btnEditPoint.Enabled := False;
    btnDeletePoint.Enabled := False;
  end;
end;

procedure TfmOverlayEditor.lvTemplatesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  idTemp : Integer;
begin
  if Selected then
  begin

    idTemp := StrToInt(lvTemplates.Selected.Caption);

    FSelectedOverlay := simMgrClient.SimOverlayTemplate.GetOverlayTemplate(idTemp);

    if Assigned(FSelectedOverlay) then
    begin
      StateOverlay := FSelectedOverlay.Tipe;

      chkShowAllOverlayTemplate.Checked := False;
      chkHideAllOverlayTemplate.Checked := False;
      chkShowOverlayTemplate.Checked := FSelectedOverlay.isShow;

      btnEdit.Enabled := True;
      btnDelete.Enabled := True;
    end;

  end
  else
  begin
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
  end;
end;

procedure TfmOverlayEditor.lvTrackSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if Selected then
  begin
    IdSelectedTrack := (StrToInt(lvTrack.Selected.Caption)-1);

    btnEdit.Enabled := True;
    btnAttach.Enabled := True;
    btnDetach.Enabled := True;
  end
  else
  begin
    btnEdit.Enabled := False;
    btnDetach.Enabled := False;
  end;

end;

procedure TfmOverlayEditor.OnKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetInput(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;
end;

procedure TfmOverlayEditor.rbDomainHandle(Sender: TObject);
begin
//  if rbAir.Checked then
//    DomainOverlay := vhdAir
//  else if rbSurface.Checked then
//    DomainOverlay := vhdSurface
//  else if rbSubsurface.Checked then
//    DomainOverlay := vhdSubsurface
//  else if rbLand.Checked then
//    DomainOverlay := vhdLand
//  else if rbGeneral.Checked then
//    DomainOverlay := vhdGeneral;
end;

procedure TfmOverlayEditor.rbTipeHandle(Sender: TObject);
var
  value : Boolean;

begin
  value := False;
  TipeOverlay := osDynamic;

  if rbStatic.Checked then
  begin
    TipeOverlay := osStatic;
    value := True;
  end;

//  rbAir.Enabled        := value;
//  rbSurface.Enabled    := value;
//  rbSubsurface.Enabled := value;
//  rbLand.Enabled       := value;
//  rbGeneral.Enabled    := value;
end;

procedure TfmOverlayEditor.ReadOnlycbb(Sender: TObject; var Key: Char);
begin
  Key := #0;
  Exit;
end;

procedure TfmOverlayEditor.RefreshDynamicTrack;
var
  i, j, k : Integer;
  objectTrackSelection : TMainTrackSelection;
  OverlayTemplate : TMainOverlayTemplate;
begin
  lvTrack.Clear;

  {dibuat IdSelectedRoute - 1, karena perbedaan penomoran antara Flisttemp dan listview}
  k := IdSelectedTemplate - 1;

  if (k < 0) or (k > simMgrClient.SimOverlayTemplate.FList.Count ) then
    exit;

  OverlayTemplate := simMgrClient.SimOverlayTemplate.FList.Items[k];

  for i := 0 to OverlayTemplate.ListAttachShip.Count - 1 do
  begin
    objectTrackSelection := OverlayTemplate.ListAttachShip.Items[i];

    with lvTrack.Items.Add do
    begin
      SubItems.Add(objectTrackSelection.TrackId);
      SubItems.Add(FloatToStr(objectTrackSelection.BearingOffset));
      SubItems.Add(FloatToStr(objectTrackSelection.RangeOffset));
      SubItems.Add(FloatToStr(objectTrackSelection.Rotation));
      if objectTrackSelection.Orientation = 1 then
        SubItems.Add('T')
      else
        SubItems.Add('R');
    end;
  end;

  lvTrack.Items.BeginUpdate;
  try
   for j := 0 to lvTrack.Items.Count-1 do
     lvTrack.Items.Item[j].Caption:=IntToStr(j+1);
  finally
    lvTrack.Items.EndUpdate;
  end;

  if lvTrack.Items.Count = 0 then
    btnEdit.Enabled := False;
end;

procedure TfmOverlayEditor.UpdateOverlayTemplateList;
var
  i : Integer;
  OverlayTemplate : TMainOverlayTemplate;
  force : string;
  isPrintTemp : Boolean;
begin
  lvTemplates.Items.Clear;

  for i := 0 to simMgrClient.SimOverlayTemplate.FList.Count - 1 do
  begin
    isPrintTemp := False;

    OverlayTemplate := simMgrClient.SimOverlayTemplate.FList.Items[i];
    case OverlayTemplate.role of
      krInstruktur, kr2DViewer, krMiddleWasdal, krSideWasdal :
      begin
        {jk yg menerima console operator}
        if simMgrClient.ClientRole = crpCubicle then
        begin
          if simMgrClient.FMyCubGroup.FData.Force_Designation = OverlayTemplate.force then
            isPrintTemp := True;
        end
        {jk yg menerima console instruktur}
        else
        begin
          isPrintTemp := True;
        end;
      end;
      krPlotter, krOperator :
      begin
        if OverlayTemplate.roleName = simMgrClient.ConsoleName then
        begin
          isPrintTemp := True;
        end;
      end;
    end;

    if isPrintTemp then
    begin
      with lvTemplates.Items.Add do
      begin
        Caption := IntToStr(OverlayTemplate.OverlayIndex);
        SubItems.Add(OverlayTemplate.Name);
        if OverlayTemplate.Tipe = 0 then
          SubItems.Add('Dynamic')
        else
          SubItems.Add('Static');

        case OverlayTemplate.force of
          1 : force := 'Red';
          3 : force := 'Blue';
        end;
        SubItems.Add(force);

        case OverlayTemplate.role of
          krInstruktur, kr2DViewer : SubItems.Add('Controller');
          krMiddleWasdal, krSideWasdal : SubItems.Add('Wasdal');
          krPlotter : SubItems.Add('Plotter');
          krOperator : SubItems.Add('Operator');
        end;

        SubItems.Add(IntToStr(OverlayTemplate.Cubicle));
      end;
    end;
  end;

  btnEdit.Enabled := False;
  btnDelete.Enabled := False;
  rbStatic.Checked := True;
  TipeOverlay := osStatic;
  DomainOverlay := vhdSurface;

end;

procedure TfmOverlayEditor.RefreshLvPolyVertexList(i: Byte);
var
  j : Integer;
begin
  case i of
    0 :
    begin
      lvPolyVertexD.Items.BeginUpdate;
      try
       for j := 0 to lvPolyVertexD.Items.Count-1 do
         lvPolyVertexD.Items.Item[j].Caption:=IntToStr(j+1);
      finally
        lvPolyVertexD.Items.EndUpdate;
      end;
    end;
    1 :
    begin
      lvPolyVertex.Items.BeginUpdate;
      try
       for j := 0 to lvPolyVertex.Items.Count-1 do
         lvPolyVertex.Items.Item[j].Caption:=IntToStr(j+1);
      finally
        lvPolyVertex.Items.EndUpdate;
      end;
    end;
  end;
end;

procedure TfmOverlayEditor.ReposOverlayStatic(startX, startY, endX, endY: Double);
var
  mx, my, nx, ny : Double;
  deltaMoveX : Double;
  deltaMoveY : Double;

  i, j, k, Hr,Vr, r,
  x1, x2, x3, x4, x5,
  y1, y2, y3, y4, y5, n : Integer;


  // variabel pembantu text
  posTextX : Double;
  posTextY : Double;

  // variabel pembantu line
  startLineX : Double;
  startLineY : Double;
  endLineX : Double;
  endLineY : Double;

  // variabel pembantu rectangle
  topLeftRectX : Double;
  topLeftRectY : Double;
  bottomRightRectX : Double;
  bottomRightRectY : Double;

  // variabel pembantu circle
  centerCircleLatt : Double;
  centerCircleLong : Double;

  // variabel pembantu Ellipse
  centerEllipseLong : Double;
  centerEllipseLatt : Double;

  // variabel pembantu Arc
  centerArcLong : Double;
  centerArcLatt : Double;

  // variabel pembantu sector
  centerSectorLong : Double;
  centerSectorLatt : Double;

  // variabel pembantu grid
  centerGridLong : Double;
  centerGridLatt : Double;

  //variabel pembantu polygon
  pointPolyX : Double;
  pointPolyY : Double;

  Idx, Idy, Odx, Ody,
  RKiAts, RKaAts, RKiBwh, RKaBwh,
  BKiAts, BKaAts, BKiBwh, BKaBwh : Double;

  polyPoint : Array of TPoint;
  point : TDotStatic;
  li : TListItem;
begin
  deltaMoveX := endX - startX;
  deltaMoveY := endY - startY;

  if lblShape.Caption = 'Text'then
  begin
    posTextX := dmsToLong(edtTextPosLong.Text);
    posTextY := dmsToLatt(edtTextPosLat.Text);

    edtTextPosLat.Text := formatDMS_latt(posTextY + deltaMoveY);
    edtTextPosLong.Text := formatDMS_long(posTextX + deltaMoveX);
    Action := caEdit;
    GbrText;
    Exit;
  end
  else if lblShape.Caption = 'Line' then
  begin
    startLineX := dmsToLong(edtLineStartPosLong.Text);
    startLineY := dmsToLatt(edtLineStartPosLat.Text);

    endLineX := dmsToLong(edtLineEndPosLong.Text);
    endLineY := dmsToLatt(edtLineEndPosLat.Text);

    edtLineStartPosLat.Text := formatDMS_latt(startLineY + deltaMoveY) ;
    edtLineStartPosLong.Text := formatDMS_long(startLineX + deltaMoveX) ;

    edtLineEndPosLat.Text := formatDMS_latt(endLineY + deltaMoveY);
    edtLineEndPosLong.Text := formatDMS_long(endLineX + deltaMoveX) ;

    Action := caEdit;
    GbrLine;
    Exit;
  end
  else if lblShape.Caption = 'Rectangle' then
  begin
    //Top-left
    topLeftRectX := dmsToLong(edtRectStartPosLong.Text);
    topLeftRectY := dmsToLatt(edtRectStartPosLat.Text);

    //Bottom-right
    bottomRightRectX := dmsToLong(edtRectEndPosLong.Text);
    bottomRightRectY := dmsToLatt(edtRectEndPosLat.Text);

    edtRectStartPosLong.Text := formatDMS_long(topLeftRectX + deltaMoveX);
    edtRectStartPosLat.Text := formatDMS_latt(topLeftRectY + deltaMoveY);
    edtRectEndPosLong.Text := formatDMS_long(bottomRightRectX + deltaMoveX);
    edtRectEndPosLat.Text := formatDMS_latt(bottomRightRectY + deltaMoveY);

    Action := caEdit;
    GbrRectangle;
    Exit;
  end
  else if lblShape.Caption = 'Circle' then
  begin
    centerCircleLong := dmsToLong(edtCirclePosLong.Text);
    centerCircleLatt := dmsToLatt(edtCirclePosLat.Text);

    edtCirclePosLong.Text := formatDMS_long(centerCircleLong + deltaMoveX);
    edtCirclePosLat.Text := formatDMS_latt(centerCircleLatt + deltaMoveY);
    Action := caEdit;
    GbrCircle;
    Exit;
  end
  else if lblShape.Caption = 'Ellipse' then
  begin
    centerEllipseLong := dmsToLong(edtEllipsePosLong.Text);
    centerEllipseLatt := dmsToLatt(edtEllipsePosLat.Text);

    edtEllipsePosLong.Text := formatDMS_long(centerEllipseLong + deltaMoveX);
    edtEllipsePosLat.Text := formatDMS_latt(centerEllipseLatt + deltaMoveY);

    Action := caEdit;
    GbrEllipse;
    Exit;
  end
  else if lblShape.Caption = 'Arc' then
  begin
    centerArcLong := dmsToLong(edtArcPosLong.Text);
    centerArcLatt := dmsToLatt(edtArcPosLat.Text);

    edtArcPosLat.Text := formatDMS_latt(centerArcLatt + deltaMoveY);
    edtArcPosLong.Text := formatDMS_long(centerArcLong + deltaMoveX);
    Action := caEdit;
    GbrArc;
    Exit;
  end
  else if lblShape.Caption = 'Sector' then
  begin
    centerSectorLong := dmsToLong(edtSectorPosLong.Text);
    centerSectorLatt := dmsToLatt(edtSectorPosLat.Text);

    edtSectorPosLat.Text := formatDMS_latt(centerSectorLatt + deltaMoveY);
    edtSectorPosLong.Text := formatDMS_long(centerSectorLong + deltaMoveX);
    Action := caEdit;
    GbrSector;
    Exit;
  end
  else if lblShape.Caption = 'Grid' then
  begin
    centerGridLong := dmsToLong(edtTablePosLong.Text);
    centerGridLatt := dmsToLatt(edtTablePosLat.Text);;

    edtTablePosLat.Text := formatDMS_latt(centerGridLatt + deltaMoveY);
    edtTablePosLong.Text := formatDMS_long(centerGridLong + deltaMoveX);
    Action := caEdit;
    GbrGrid;
    Exit;
  end
  else if lblShape.Caption = 'Polygon' then
  begin
    for I := 0 to lvPolyVertex.Items.Count - 1 do
    begin
      pointPolyX := dmsToLong(lvPolyVertex.Items[I].SubItems[0]);
      pointPolyY := dmsToLatt(lvPolyVertex.Items[I].SubItems[1]);
      with lvPolyVertex.Items[I] do
      begin
        SubItems[0] := formatDMS_long(pointPolyX + deltaMoveX);
        SubItems[1] := formatDMS_latt(pointPolyY + deltaMoveY);
      end;
    end;
    Action := caEdit;
    GbrPolygon;
    Exit;
  end;

  lblShape.Caption := '---';
  grpNoneD.BringToFront;
  grpNone.BringToFront;

  cbbDashesPen.Enabled := True;
  cbbWeightPen.Enabled := True;

  btnObjectDelete.Enabled := False;
  btnObjectApply.Enabled := False;
end;

procedure TfmOverlayEditor.AddTrackSelection;
var
  OverlayTemplate : TMainOverlayTemplate;
  rec : TRecCmd_OverlayDynamicTrack;

begin
  if (edtTrack.Text = '') or (edtRange.Text = '') or (edtBearing.Text = '') or
     (edtRotation.Text = '') then
  begin
    ShowMessage('Incomplete data input');
    Exit;
  end;

  OverlayTemplate := simMgrClient.SimOverlayTemplate.FList.Items[IdSelectedTemplate - 1];

  rec.TemplateName := OverlayTemplate.Name;
  rec.IDTrack := IdTrackInstanceIndex;
  rec.NameTrack := edtTrack.Text;
  rec.Rng := StrToFloat(edtRange.Text);
  rec.Brg := StrToInt(edtBearing.Text);
  rec.Rot := StrToInt(edtRotation.Text);
  rec.IdAction := caAdd;

  if rbTrueOrientation.Checked then
    rec.Orientation := 1
  else
    rec.Orientation := 0;

  simMgrClient.netSend_CmdDynamicTrack(rec);
  edtTrack.Text := '';
  edtRange.Text := '0';
  edtBearing.Text := '0';
  edtRotation.Text := '0';

  // menambah isShow unk multipleTemplate
  OverlayTemplate.isShow := True;
end;

procedure TfmOverlayEditor.Apply;
begin
  case FShapeType of
    ovText : GbrText;
    ovLine : GbrLine;
    ovRectangle : GbrRectangle;
    ovCircle : GbrCircle;
    ovEllipse : GbrEllipse;
    ovArc : GbrArc;
    ovSector : GbrSector;
    ovGrid : GbrGrid;
    ovPolygon : GbrPolygon;
  end;
end;

procedure TfmOverlayEditor.ChangePosition(idAction : Integer);
var
  i : Integer;
  itemD        : TMainDynamicShape;
  itemS        : TMainStaticShape;
  recShapeStatic : TRecCmd_OverlayStaticShape;
  recShapeDynamic : TRecCmd_OverlayDynamicShape;
begin
  if not FindIdSelectedShape then
      Exit;

  if Assigned(FSelectedOverlay) then
  begin
    case FSelectedOverlay.Tipe of

      osDynamic :
      begin
        {$REGION ' Dynamic '}
        itemD := FSelectedOverlay.DynamicList[NoShapeInList];

        recShapeDynamic.IdAction := idAction;
        recShapeDynamic.IdSelectShape := NoShapeInList;
        recShapeDynamic.TemplateId := FSelectedOverlay.OverlayIndex;

        if itemD is TTextDynamic then
          recShapeDynamic.ShapeID := ovText
        else if itemD is TLineDynamic then
          recShapeDynamic.ShapeID := ovLine
        else if itemD is TRectangleDynamic then
          recShapeDynamic.ShapeID := ovRectangle
        else if itemD is TCircleDynamic then
          recShapeDynamic.ShapeID := ovCircle
        else if itemD is TEllipseDynamic then
          recShapeDynamic.ShapeID := ovEllipse
        else if itemD is TArcDynamic  then
          recShapeDynamic.ShapeID := ovArc
        else if itemD is TSectorDynamic then
          recShapeDynamic.ShapeID := ovSector
        else if itemD is TGridDynamic then
          recShapeDynamic.ShapeID := ovGrid
        else if itemD is TPolygonDynamic then
          recShapeDynamic.ShapeID := ovPolygon;

        if idAction = 4 then
        begin
          maxIdxDrawOverlay := idxDrawOverlay + 1;
          idxDrawOverlay :=  maxIdxDrawOverlay;
          recShapeDynamic.idxDraw := maxIdxDrawOverlay;
          simMgrClient.netSend_BringToFrontDynamicShape(recShapeDynamic);
        end
        else if idAction = 5 then
        begin
          minIdxDrawOverlay := minIdxDrawOverlay -1;
          recShapeDynamic.idxDraw := minIdxDrawOverlay;
          simMgrClient.netSend_SendToBackDynamicShape(recShapeDynamic);
        end
        else
          Exit;
        {$ENDREGION}
      end;
      osStatic :
      begin
        {$REGION ' Static '}
        itemS := FSelectedOverlay.StaticList[NoShapeInList];

        if not itemS.isSelected then
          Exit;

        if itemS is TTextStatic then
          recShapeStatic.ShapeType := ovText
        else if itemS is TLineStatic then
          recShapeStatic.ShapeType := ovLine
        else if itemS is TRectangleStatic then
          recShapeStatic.ShapeType := ovRectangle
        else if itemS is TCircleStatic then
          recShapeStatic.ShapeType := ovCircle
        else if itemS is TEllipseStatic then
          recShapeStatic.ShapeType := ovEllipse
        else if itemS is TArcStatic  then
          recShapeStatic.ShapeType := ovArc
        else if itemS is TSectorStatic then
          recShapeStatic.ShapeType := ovSector
        else if itemS is TGridStatic then
          recShapeStatic.ShapeType := ovGrid
        else if itemS is TPolygonStatic then
          recShapeStatic.ShapeType := ovPolygon;

        recShapeStatic.TemplateId := FSelectedOverlay.OverlayIndex;
        recShapeStatic.IdSelectShape := NoShapeInList;

        {Bring To Front}
        if idAction = 4 then
        begin
          simMgrClient.netSend_BringToFrontStaticShape(recShapeStatic);
        end
        else if idAction = 5 then
        begin
          simMgrClient.netSend_SendToBackStaticShape(recShapeStatic);
        end
        else
          Exit;
        {$ENDREGION}
      end;
    end;
    clearSelect;
  end;
end;

procedure TfmOverlayEditor.btnAddPointClick(Sender: TObject);
var
  tempPointX, tempPointY : Double;
begin
  if (edtPolyPosLat.Text = '') and (edtPolyPosLong.Text = '') then
  begin
    lblWarning.Caption := 'Incomplete Data Input';
    pnlWarning.Visible := True;
    lbl86.Visible := True;
    lblWarning.Visible := True;
    lbl86.Font.Color := clRed;
    lbl86.Font.Style := [fsBold];
    lblWarning.Font.Color := clRed;
    Exit
  end;

//  if lvPolyVertex.ItemIndex <> -1 then
//  begin
//    with lvPolyVertex.Items[IdSelectedPoint] do
//    begin
//      SubItems[0] := edtPolyPosLong.Text;
//      SubItems[1] := edtPolyPosLat.Text;
//    end;
//  end
//  else
//  begin
//    with lvPolyVertex.Items.Add do
//    begin
//      SubItems.Add(edtPolyPosLong.Text);
//      SubItems.Add(edtPolyPosLat.Text);
//    end;
//  end;

  with lvPolyVertex.Items.Add do
    begin
      SubItems.Add(edtPolyPosLong.Text);
      SubItems.Add(edtPolyPosLat.Text);
    end;

  tempPointX := dmsToLong(edtPolyPosLong.Text);
  tempPointY := dmsToLatt(edtPolyPosLat.Text);

  GbrFlagPoint(tempPointX, tempPointY);

  RefreshLvPolyVertexList(1);

  edtPolyPosLat.Text := formatDMS_latt(0);
  edtPolyPosLong.Text := formatDMS_long(0);
end;

procedure TfmOverlayEditor.btnAddPointDClick(Sender: TObject);
begin
  if (edtPolygonRange.Text = '') and (edtPolygonBearing.Text = '') then
  begin
    lblWarning.Caption := 'Incomplete Data Input';
    pnlWarning.Visible := True;
    lbl86.Visible := True;
    lblWarning.Visible := True;
    lbl86.Font.Color := clRed;
    lbl86.Font.Style := [fsBold];
    lblWarning.Font.Color := clRed;
    Exit
  end;

  with lvPolyVertexD.Items.Add do
  begin
    SubItems.Add(edtPolygonRange.Text);
    SubItems.Add(edtPolygonBearing.Text);
  end;
  RefreshLvPolyVertexList(0);
  edtPolygonRange.Text := '1';
  edtPolygonBearing.Text := '0';
end;

procedure TfmOverlayEditor.btnAttachClick(Sender: TObject);
begin
//  pnlType.Visible := False;
  pnlTrackSelection.Visible := True;
  btnTrackSelectionOK.Enabled := False;
  edtTrack.Text := '';
  edtRange.Text := '0';
  edtBearing.Text := '0';
  edtRotation.Text := '0';
end;

procedure TfmOverlayEditor.btnClearPointClick(Sender: TObject);
begin
  lvPolyVertex.Clear;
  ClearFlagPoint
end;

procedure TfmOverlayEditor.btnClearPointDClick(Sender: TObject);
begin
  lvPolyVertexD.Clear;
end;

procedure TfmOverlayEditor.btnDeletePointClick(Sender: TObject);
begin
  lvPolyVertex.Items.Delete(IdSelectedPoint);
end;

procedure TfmOverlayEditor.btnDeletePointDClick(Sender: TObject);
begin
  lvPolyVertexD.Items.Delete(IdSelectedPointD);
end;

procedure TfmOverlayEditor.btnDetachClick(Sender: TObject);
var
  OverlayTemplate : TMainOverlayTemplate;
  rec : TRecCmd_OverlayDynamicTrack;

begin
  if IdSelectedTrack > lvTrack.Items.Count then
    Exit;

  OverlayTemplate := simMgrClient.SimOverlayTemplate.FList.Items[IdSelectedTemplate - 1];

  rec.TemplateName := OverlayTemplate.Name;
  rec.IdSelectTrack := IdSelectedTrack;
  rec.IdAction := 3;

  simMgrClient.netSend_CmdDynamicTrack(rec);

  btnDetach.Enabled := False;
  btnEdit.Enabled := False;

  //menambahkan isShow unk multiple template
  OverlayTemplate.isShow := False;
end;

procedure TfmOverlayEditor.btnEditPointClick(Sender: TObject);
var
  tempPointX, tempPointY : Double;

begin
  if (edtPolyPosLat.Text = '') and (edtPolyPosLong.Text = '') then
  begin
    lblWarning.Caption := 'Incomplete Data Input';
    pnlWarning.Visible := True;
    lbl86.Visible := True;
    lblWarning.Visible := True;
    lbl86.Font.Color := clRed;
    lbl86.Font.Style := [fsBold];
    lblWarning.Font.Color := clRed;
    Exit
  end;

  with lvPolyVertex.Items[IdSelectedPoint] do
  begin
    SubItems[0] := edtPolyPosLong.Text;
    SubItems[1] := edtPolyPosLat.Text;
  end;

  tempPointX := dmsToLong(edtPolyPosLong.Text);
  tempPointY := dmsToLatt(edtPolyPosLat.Text);

  GbrFlagPoint(tempPointX, tempPointY);

  RefreshLvPolyVertexList(1);
  edtPolyPosLat.Text := formatDMS_latt(0);
  edtPolyPosLong.Text := formatDMS_long(0);
  frmTacticalDisplay.Map1.CurrentTool := mtAddOverlay;
  UpdateOverlayTemplateList;
end;

procedure TfmOverlayEditor.btnEditPointDClick(Sender: TObject);
begin
  if (edtPolygonRange.Text = '') and (edtPolygonBearing.Text = '') then
  begin
    lblWarning.Caption := 'Incomplete Data Input';
    pnlWarning.Visible := True;
    lbl86.Visible := True;
    lblWarning.Visible := True;
    lbl86.Font.Color := clRed;
    lbl86.Font.Style := [fsBold];
    lblWarning.Font.Color := clRed;
    Exit
  end;

  with lvPolyVertexD.Items[IdSelectedPointD] do
  begin
    SubItems.Add(edtPolygonRange.Text);
    SubItems.Add(edtPolygonBearing.Text);
  end;

  with lvPolyVertexD.Items[lvPolyVertexD.ItemIndex] do
  begin
    SubItems[0] := edtPolygonRange.Text;
    SubItems[1] := edtPolygonBearing.Text;
  end;

  RefreshLvPolyVertexList(0);
  edtPolygonRange.Text := '1';
  edtPolygonBearing.Text := '0';
end;

procedure TfmOverlayEditor.btnFillClick(Sender: TObject);
begin
  btnFill.Picture.LoadFromFile('data\Image Interface\Instruktur\btnFill_Select.PNG');
  btnOutline.Picture.LoadFromFile('data\Image Interface\Instruktur\btnOutline_Normal.PNG');

  FShapeColor := scFill;
end;

procedure TfmOverlayEditor.btnOutlineClick(Sender: TObject);
begin
  btnOutline.Picture.LoadFromFile('data\Image Interface\Instruktur\btnOutline_Select.PNG');
  btnFill.Picture.LoadFromFile('data\Image Interface\Instruktur\btnFill_Normal.PNG');

  FShapeColor := scOutline;
end;

procedure TfmOverlayEditor.btnHandleObjectEditor(Sender: TObject);
var nameSelectedOverlay : string;
begin
  case TButton(Sender).Tag of
    0: {Apply}
    begin
      nameSelectedOverlay := Self.Caption;
      Apply;
      if isInputProblem  then
        Exit
      else
        btnHandleShape(btnSelect);
    end;
    1: {Delete}
    begin
      Deleted;
      btnHandleShape(btnSelect);
    end;
    2: {Cancel}
    begin
      Canceled;
      btnHandleShape(btnSelect);
    end;
    3: {Close}
    begin
      Canceled;
      grpTemplate.Left := 17;

      UpdateOverlayTemplateList;
    end;
  end;
  ClearEditText;
  ClearFlagPoint;
  frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
  btnNone.Down := True;
end;

procedure TfmOverlayEditor.btnHandleShape(Sender: TObject);
begin
  ClearEditText;
  Canceled;
  IsEditObject := False;
  btnObjectApply.Enabled := True;
  frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;

  cbbWeightpen.Text := '1';
  cbbDashesPen.Text := 'Solid';
  cbbTextSize.Text := '11';
  Action := 1;

  lbl86.Visible := False;
  lblWarning.Visible := False;

  case StateOverlay of
    osDynamic : pnlDynamic.Visible := True;
    osStatic : pnlStatic.Visible := True;
  end;

  FShapeType := TSpeedButton(Sender).Tag;
  case FShapeType of
    0: {New}
    begin
      lblShape.Caption := '---';
      grpNone.BringToFront;

      isMoveOverlay := False;

      if StateOverlay = osDynamic then
        frmTacticalDisplay.Map1.CurrentTool := mtEditOverlayStatic
      else
        frmTacticalDisplay.Map1.CurrentTool := mtEditOverlayStatic;

      {$REGION ' Button Handle '}
      btnOutline.Visible := False;
      btnFill.Visible := False;
      pnlpenediting.Visible := False;
      {$ENDREGION}

    end;
    ovText:LoadPanelText;
    ovLine:LoadPanelLine;
    ovRectangle:LoadPanelRectangle;
    ovCircle:LoadPanelCircle;
    ovEllipse:LoadPanelEllipse;
    ovArc:LoadPanelArc;
    ovSector:LoadPanelSector;
    ovGrid:LoadPanelGrid;
    ovPolygon:LoadPanelPolygon;

    10 : {Move}
    begin
      lblShape.Caption := '---';
      grpNoneD.BringToFront;
      grpNone.BringToFront;

      cbbDashesPen.Enabled := True;
      cbbWeightPen.Enabled := True;

      btnObjectDelete.Enabled := False;
      btnObjectApply.Enabled := False;
      btnMove.Down := True;
      isMoveOverlay := True;

      if StateOverlay = osDynamic then
        frmTacticalDisplay.Map1.CurrentTool := mtEditOverlayDynamic
      else
        frmTacticalDisplay.Map1.CurrentTool := mtEditOverlayStatic;
    end;
  end;

  if btnFill.Enabled = False then
  begin
    isFrameFill := True;
//    btnOutline.Down := True;
//    btnFill.Down := False;
    isBtnFillClick := False;
    isBtnFrameClick := True;
//    txtFillColor.Color := txtColorSelect.Color;
  end;
end;

procedure TfmOverlayEditor.btnHandleTemplate(Sender: TObject);
var
  OverlayTemplate : TMainOverlayTemplate;
  cublicleId        : Integer;
begin
  pnlTrackSelection.Visible := False;
  pnlStatic.Visible := False;
  pnlDynamic.Visible := False;

  if StateOverlay = 0 then
    btnMove.Enabled := False
  else
    btnMove.Enabled := True;

  case TSpeedButton(Sender).Tag of
    0: {Refresh}
    begin
      pnlCreateNew.BringToFront;
      edtNameOverlay.Text := 'New Overlay';
    end;
    1:{Edit}
    begin
      EditTemplate;
    end;
    2:{Delete}
    begin
      DeleteTemplate;
    end;
    3:{Close}
    begin
      Close;
    end;
    4:{Create}
    begin
      AddTemplate;
    end;
    5:{Cancel}
    begin
      pnlType.BringToFront;
    end;
    6:{Ok Track Selection}
    begin
      AddTrackSelection;
    end;
    7:{Cancel Track Selection}
    begin
      pnlType.BringToFront;
    end;
  end;
end;

procedure TfmOverlayEditor.btnNoFillClick(Sender: TObject);
begin
  case FShapeType of
    ovText, ovLine, ovArc, ovGrid :
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

procedure TfmOverlayEditor.btnHandleShapePosition(Sender: TObject);
begin
  if (Sender is TSpeedButton) then
  begin
    FTagTombolPosition := TSpeedButton(Sender).Tag;

    if FTagTombolPosition = 10 then
    begin
      if not SpeedButton10.Down then
        frmTacticalDisplay.Map1.CurrentTool := mtSelectObject
      else
        frmTacticalDisplay.Map1.CurrentTool := mtAddOverlay;
    end
    else
    begin
      frmTacticalDisplay.Map1.CurrentTool := mtAddOverlay;
    end;
  end;
end;

procedure TfmOverlayEditor.btnTargetSearchClick(Sender: TObject);
begin
  if Assigned(TrackPlatform) then
  begin
    if TrackPlatform is TT3DetectedTrack then
    begin
      edtTrack.Text := TT3PlatformInstance(TT3DetectedTrack(TrackPlatform).TrackObject).Track_ID;
      IdTrackInstanceIndex := TT3PlatformInstance(TT3DetectedTrack(TrackPlatform).TrackObject).InstanceIndex
    end
    else if TrackPlatform is TT3PlatformInstance then
    begin
      edtTrack.Text := TT3PlatformInstance(TrackPlatform).Track_ID;
      IdTrackInstanceIndex := TT3PlatformInstance(TrackPlatform).InstanceIndex
    end;
    btnTrackSelectionOK.Enabled := True;
  end
  else
    exit;

end;

procedure TfmOverlayEditor.Canceled;
var
  i, j : Integer;
  ObjectOverlay : TMainStaticShape;
  OverlayTemplate : TMainOverlayTemplate;
begin
  for i := 0 to simMgrClient.SimOverlayTemplate.FList.Count - 1 do
  begin
    OverlayTemplate := simMgrClient.SimOverlayTemplate.FList.Items[i];

    if OverlayTemplate.Tipe = 0 then
    begin
      for j := 0 to OverlayTemplate.DynamicList.Count - 1 do
      begin
        ObjectOverlay := OverlayTemplate.DynamicList.Items[j];
        ObjectOverlay.isSelected := False;
      end;
    end
    else
    begin
      for j := 0 to OverlayTemplate.StaticList.Count - 1 do
      begin
        ObjectOverlay := OverlayTemplate.StaticList.Items[j];
        ObjectOverlay.isSelected := False;
      end;
    end;
  end;
end;

procedure TfmOverlayEditor.cbbDashesPenSelect(Sender: TObject);
begin
  if cbbDashesPen.Text = 'Solid' then
  begin
    cbbWeightPen.Enabled := True;
    cbbWeightPen.Text := cbbWeightpen.Text
  end
  else
  begin
    cbbWeightPen.Enabled := False;
    cbbWeightPen.Text := '1'
  end;
end;

function TfmOverlayEditor.CekInput(IdObject: Integer): Boolean;
begin
  Result := False;
  lbl86.Visible := False;
  lblWarning.Visible := False;

  case StateOverlay of

    {$REGION ' Dynamic Section '}
    osDynamic :
    begin
      case IdObject of
        ovText:{Text}
        begin
          if(edtTextRange.Text = '')or(edtTextBearing.Text = '')or(edtTextFieldD.Text = '')
          or(cbbTextSizeD.Text = '')then
          begin
            lblWarning.Caption := 'Incomplete data input';
            Result := True ;
          end
          else if (StrToInt(cbbTextSizeD.Text) > 72) or(StrToInt(cbbTextSizeD.Text) = 0) then
          begin
            lblWarning.Caption := 'Invalid size input';
            Result := True;
          end;
        end;
        ovLine:{Line}
        begin
          if (edtLineStartRange.Text = '')or(edtLineStartBearing.Text = '')or
          (edtLineEndRange.Text = '')or(edtLineEndBearing.Text = '') then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtLineStartRange.Text = edtLineEndRange.Text ) and (edtLineEndRange.Text = edtLineEndBearing.Text )then
          begin
            lblWarning.Caption := 'Invalid input..., Start and End position can not be identical';
            Result := True;
          end;;
        end;
        ovRectangle:{Rectangle}
        begin
          if (edtRecStartRange.Text = '')or(edtRecStartBearing.Text = '')or
          (edtRecEndRange.Text = '')or(edtRecEndBearing.Text = '') then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtRecStartRange.Text = edtRecEndRange.Text ) and (edtRecStartBearing.Text = edtRecEndBearing.Text )then
          begin
            lblWarning.Caption := 'Invalid input..., Top-Left and Bottom-Right position can not be identical';
            Result := True;
          end;;
        end;
        ovCircle:{Circle}
        begin
          if (edtCircleRange.Text = '')or(edtCircleBearing.Text = '') or
          (edtCircleRadiusD.Text = '') then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtCircleRadiusD.Text = '0' ) then
          begin
            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
            Result := True;
          end;
        end;
        ovEllipse:{Ellipse}
        begin
          if (edtEllipseRange.Text = '')or(edtEllipseBearing.Text = '')or
          (edtEllipseHorizontalD.Text = '')or(edtEllipseVerticalD.Text = '')then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtEllipseHorizontalD.Text = '0') or (edtEllipseVerticalD.Text = '0')then
          begin
            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
            Result := True;
          end;
        end;

        ovArc:{Arc}
        begin
          if (edtArcRange.Text = '')or(edtArcBearing.Text = '')or
          (edtArcRadiusD.Text = '')or(edtArcStartAngleD.Text = '')or
          (edtArcEndAngleD.Text = '')or(edtArcPosLat.Text = '')or
          (edtArcPosLong.Text ='')then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtArcRadiusD.Text = '0') then
          begin
            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
            Result := True;
          end
          else if (edtArcStartAngleD.Text = edtArcEndAngleD.Text) then
          begin
            lblWarning.Caption := 'Invalid input..., Start and End Angle can not be identical';
            Result := True;
          end;
        end;
        ovSector:{Sector}
        begin
          if (edtSectorRange.Text = '')or(edtSectorBearing.Text = '')or
          (edtSectorInnerD.Text = '')or(edtSectorOuterD.Text = '')or
          (edtSectorStartAngleD.Text = '')or(edtSectorEndAngleD.Text = '')then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtSectorInnerD.Text = '0')or (edtSectorOuterD.Text = '0')then
          begin
            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
            Result := True;
          end
          else if (edtSectorStartAngleD.Text = edtSectorEndAngleD.Text) then
          begin
            lblWarning.Caption := 'Invalid input..., Start and End Angle can not be identical';
            Result := True;
          end
          else if (edtSectorInnerD.Text = edtSectorOuterD.Text) then
          begin

            lblWarning.Caption := 'Invalid input..., Inner and Outer Radius can not be identical';
            Result := True;
          end;
        end;
        ovGrid:{Grid}
        begin
          if (edtTableRange.Text = '')or(edtTableBearing.Text = '')or
          (edtTableHeightD.Text = '')or(edtTableColumnD.Text = '')or
          (edtTableWidthD.Text = '')or(edtTableRowD.Text = '')or
          (edtRotationAngleD.Text = '')then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtTableHeightD.Text = '0') or (edtTableColumnD.Text = '0') or (edtTableWidthD.Text = '0')
          or (edtTableRowD.Text = '0') then
          begin
            lblWarning.Caption := 'Invalid input, minimum Col, Row and height > 0';
            Result := True;
          end;
        end;
        ovPolygon:{Polygon}
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
    osStatic  :
    begin
      case IdObject of
        ovText:{Text}
         begin
          if(edtTextPosLong.Text = '') or (edtTextPosLAt.Text= '')or
          (edtTextField.Text = '')or(cbbTextSize.Text = '')then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (StrToInt(cbbTextSize.Text) > 72 )or (StrToInt(cbbTextSize.Text) = 0 )then
          begin
            lblWarning.Caption := 'Invalid size input';
            Result := True;
          end;
        end;
        ovLine:{Line}
        begin
          if (edtLineStartPosLong.Text ='') or (edtLineStartPosLat.Text = '')or
          (edtLineEndPosLong.Text = '') or (edtLineEndPosLat.Text = '')then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtLineStartPosLong.Text = edtLineEndPosLong.Text) and (edtLineStartPosLat.Text = edtLineEndPosLat.Text)then
          begin
            lblWarning.Caption := 'Invalid input..., Start and End position can not be identical';
            Result := True;
          end;;
        end;
        ovRectangle:{Rectangle}
        begin
          if (edtRectStartPosLong.Text = '')or(edtRectStartPosLat.Text = '')or
          (edtRectEndPosLong.Text = '')or (edtRectEndPosLat.Text = '')or
          (edtRectStartPosLong.Text= '')or (edtRectStartPosLat.Text= '')or
          (edtRectEndPosLat.Text= '')or(edtRectEndPosLong.Text= '') then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtRectStartPosLong.Text = edtRectEndPosLong.Text ) and (edtRectStartPosLat.Text = edtRectEndPosLat.Text )then
          begin
            lblWarning.Caption := 'Invalid input..., Top-Left and Bottom-Right position can not be identical';
            Result := True;;
          end;
        end;
        ovCircle:{Circle}
        begin
          if (edtCirclePosLong.Text = '')or (edtCirclePosLat.Text = '') or
          (edtCircleRadius.Text = '')or(edtCirclePosLong.text='')or
          (edtCirclePosLat.Text= '') then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtCircleRadius.Text = '0' ) then
          begin
            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
            Result := True;
          end;
        end;
        ovEllipse:{Ellipse}
        begin
          if (edtEllipsePosLong.Text = '')or (edtEllipsePosLat.Text = '')
          or(edtHorizontal.Text = '') or (edtVertical.Text = '')or
          (edtEllipsePosLat.text= '')or
          (edtEllipsePosLong.Text= '') then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtHorizontal.Text = '0') or (edtVertical.Text = '0')then
          begin
            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
            Result := True;
          end;
        end;
        ovArc:{Arc}
        begin
          if (edtArcPosLong.Text = '') or (edtArcPosLat.Text = '')or
          (edtArcRadius.Text = '')or(edtArcStartAngle.Text = '')or
          (edtArcEndAngle.Text = '')then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtArcRadius.Text = '0') then
          begin
            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
            Result := True;
          end
          else if (edtArcEndAngle.Text = edtArcStartAngle.Text) then
          begin
            lblWarning.Caption := 'Invalid input..., Start and End Angle can not be identical';
            Result := True;
          end;
        end;
        ovSector:{Sector}
        begin
          if(edtSectorInner.Text = '') or (edtSectorOuter.Text = '')or
          (edtSectorStartAngle.Text = '') or (edtSectorEndAngle.Text = '')or
          (edtSectorPosLat.Text = '')or (edtSectorPosLong.Text = '')then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end
          else if (edtSectorInner.Text = '0')or (edtSectorOuter.Text = '0')then
          begin
            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
            Result := True;
          end
          else if (edtSectorStartAngle.Text = edtSectorEndAngle.Text) then
          begin
            lblWarning.Caption := 'Invalid input..., Start and End Angle can not be identical';
            Result := True;
          end
          else if (edtSectorInner.Text = edtSectorOuter.Text) then
          begin
            lblWarning.Caption := 'Invalid input..., Inner and Outer Radius can not be identical';
            Result := True;
          end;
        end;
        ovGrid:{Grid}
        begin
          if (edtTablePosLong.Text = '')or (edtTablePosLat.Text ='') or
          (edtTableHeight.Text = '')or (edtTableColumn.Text = '') or
          (edtTableWidth.Text = '') or (edtTableRow.Text = '')or
          (edtTableRotationAngle.Text = '')or(edtTablePosLat.Text ='')
          or(edtTablePosLong.Text='') then
          begin
            lblWarning.Caption := 'Incomplete Data Input';
            Result := True;
          end

          else if (edtTableHeight.Text = '0') or (edtTableColumn.Text = '0') or (edtTableWidth.Text = '0')
          or (edtTableRow.Text = '0') then
          begin
            lblWarning.Caption := 'Invalid input, minimum Col, Row and height > 0';
            Result := True;
          end;
        end;
        ovPolygon:{Polygon}
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

  {$REGION ' Kodingan Lama '}

//  case IdObject of
//    ovText:{Text}
//    begin
//      case StateOverlay of
//        osDynamic :
//        begin
//          if(edtTextRange.Text = '')or(edtTextBearing.Text = '')or(edtTextFieldD.Text = '')
//          or(cbbTextSizeD.Text = '')then
//          begin
//            lblWarning.Caption := 'Incomplete data input';
//            Result := True ;
//          end
//          else if (StrToInt(cbbTextSizeD.Text) > 72) or(StrToInt(cbbTextSizeD.Text) = 0) then
//          begin
//            lblWarning.Caption := 'Invalid size input';
//            Result := True;
//          end;
//        end;
//        osStatic  :
//        begin
//          if(edtTextPosLong.Text = '') or (edtTextPosLAt.Text= '')or
//          (edtTextField.Text = '')or(cbbTextSize.Text = '')then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//          else if (StrToInt(cbbTextSize.Text) > 72 )or (StrToInt(cbbTextSize.Text) = 0 )then
//          begin
//            lblWarning.Caption := 'Invalid size input';
//            Result := True;
//          end;
//        end;
//      end;
//    end;
//    ovLine:{Line}
//    begin
//      case StateOverlay of
//        osDynamic :
//        begin
//          if (edtLineStartRange.Text = '')or(edtLineStartBearing.Text = '')or
//          (edtLineEndRange.Text = '')or(edtLineEndBearing.Text = '') then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//          else if (edtLineStartRange.Text = edtLineEndRange.Text ) and (edtLineEndRange.Text = edtLineEndBearing.Text )then
//          begin
//            lblWarning.Caption := 'Invalid input..., Start and End position can not be identical';
//            Result := True;
//          end;;
//        end;
//        osStatic  :
//        begin
//          if (edtLineStartPosLong.Text ='') or (edtLineStartPosLat.Text = '')or
//          (edtLineEndPosLong.Text = '') or (edtLineEndPosLat.Text = '')then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//          else if (edtLineStartPosLong.Text = edtLineEndPosLong.Text) and (edtLineStartPosLat.Text = edtLineEndPosLat.Text)then
//          begin
//            lblWarning.Caption := 'Invalid input..., Start and End position can not be identical';
//            Result := True;
//          end;;
//        end;
//      end;
//    end;
//    ovRectangle:{Rectangle}
//    begin
//      case StateOverlay of
//        osDynamic :
//        begin
//          if (edtRecStartRange.Text = '')or(edtRecStartBearing.Text = '')or
//          (edtRecEndRange.Text = '')or(edtRecEndBearing.Text = '') then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//          else if (edtRecStartRange.Text = edtRecEndRange.Text ) and (edtRecStartBearing.Text = edtRecEndBearing.Text )then
//          begin
//            lblWarning.Caption := 'Invalid input..., Top-Left and Bottom-Right position can not be identical';
//            Result := True;
//          end;;
//        end;
//        osStatic :
//        begin
//          if (edtRectStartPosLong.Text = '')or(edtRectStartPosLat.Text = '')or
//          (edtRectEndPosLong.Text = '')or (edtRectEndPosLat.Text = '')or
//          (edtRectStartPosLong.Text= '')or (edtRectStartPosLat.Text= '')or
//          (edtRectEndPosLat.Text= '')or(edtRectEndPosLong.Text= '') then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//          else if (edtRectStartPosLong.Text = edtRectEndPosLong.Text ) and (edtRectStartPosLat.Text = edtRectEndPosLat.Text )then
//          begin
//            lblWarning.Caption := 'Invalid input..., Top-Left and Bottom-Right position can not be identical';
//            Result := True;;
//          end;
//        end;
//      end;
//    end;
//    ovCircle:{Circle}
//    begin
//      case StateOverlay of
//        osDynamic :
//        begin
//          if (edtCircleRange.Text = '')or(edtCircleBearing.Text = '') or
//          (edtCircleRadiusD.Text = '') then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//          else if (edtCircleRadiusD.Text = '0' ) then
//          begin
//            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
//            Result := True;
//          end;
//        end;
//        osStatic  :
//        begin
//          if (edtCirclePosLong.Text = '')or (edtCirclePosLat.Text = '') or
//          (edtCircleRadius.Text = '')or(edtCirclePosLong.text='')or
//          (edtCirclePosLat.Text= '') then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//          else if (edtCircleRadius.Text = '0' ) then
//          begin
//            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
//            Result := True;
//          end;
//        end;
//      end;
//    end;
//    ovEllipse:{Ellipse}
//    begin
//      case StateOverlay of
//        osDynamic :
//        begin
//          if (edtEllipseRange.Text = '')or(edtEllipseBearing.Text = '')or
//          (edtEllipseHorizontalD.Text = '')or(edtEllipseVerticalD.Text = '')then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//          else if (edtEllipseHorizontalD.Text = '0') or (edtEllipseVerticalD.Text = '0')then
//          begin
//            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
//            Result := True;
//          end;
//        end;
//        osStatic  :
//        begin
//          if (edtEllipsePosLong.Text = '')or (edtEllipsePosLat.Text = '')
//          or(edtHorizontal.Text = '') or (edtVertical.Text = '')or
//          (edtEllipsePosLat.text= '')or
//          (edtEllipsePosLong.Text= '') then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//          else if (edtHorizontal.Text = '0') or (edtVertical.Text = '0')then
//          begin
//            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
//            Result := True;
//          end;
//        end;
//      end;
//    end;
//    ovArc:{Arc}
//    begin
//      case StateOverlay of
//        osDynamic :
//        begin
//          if (edtArcRange.Text = '')or(edtArcBearing.Text = '')or
//          (edtArcRadiusD.Text = '')or(edtArcStartAngleD.Text = '')or
//          (edtArcEndAngleD.Text = '')or(edtArcPosLat.Text = '')or
//          (edtArcPosLong.Text ='')then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//          else if (edtArcRadiusD.Text = '0') then
//          begin
//            lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
//            Result := True;
//          end
//          else if (edtArcStartAngleD.Text = edtArcEndAngleD.Text) then
//          begin
//            lblWarning.Caption := 'Invalid input..., Start and End Angle can not be identical';
//            Result := True;
//          end;
//        end;
//        osStatic  :
//        begin
//        if (edtArcPosLong.Text = '') or (edtArcPosLat.Text = '')or
//        (edtArcRadius.Text = '')or(edtArcStartAngle.Text = '')or
//        (edtArcEndAngle.Text = '')then
//        begin
//          lblWarning.Caption := 'Incomplete Data Input';
//          Result := True;
//        end
//        else if (edtArcRadius.Text = '0') then
//        begin
//          lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
//          Result := True;
//        end
//        else if (edtArcEndAngle.Text = edtArcStartAngle.Text) then
//        begin
//          lblWarning.Caption := 'Invalid input..., Start and End Angle can not be identical';
//          Result := True;
//        end;
//        end;
//      end;
//    end;
//    ovSector:{Sector}
//    begin
//      case StateOverlay of
//        osDynamic :
//        begin
//        if (edtSectorRange.Text = '')or(edtSectorBearing.Text = '')or
//        (edtSectorInnerD.Text = '')or(edtSectorOuterD.Text = '')or
//        (edtSectorStartAngleD.Text = '')or(edtSectorEndAngleD.Text = '')then
//        begin
//          lblWarning.Caption := 'Incomplete Data Input';
//          Result := True;
//        end
//        else if (edtSectorInnerD.Text = '0')or (edtSectorOuterD.Text = '0')then
//        begin
//          lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
//          Result := True;
//        end
//        else if (edtSectorStartAngleD.Text = edtSectorEndAngleD.Text) then
//        begin
//          lblWarning.Caption := 'Invalid input..., Start and End Angle can not be identical';
//          Result := True;
//        end
//        else if (edtSectorInnerD.Text = edtSectorOuterD.Text) then
//        begin
//
//          lblWarning.Caption := 'Invalid input..., Inner and Outer Radius can not be identical';
//          Result := True;
//        end;
//        end;
//        osStatic  :
//        begin
//        if(edtSectorInner.Text = '') or (edtSectorOuter.Text = '')or
//        (edtSectorStartAngle.Text = '') or (edtSectorEndAngle.Text = '')or
//        (edtSectorPosLat.Text = '')or (edtSectorPosLong.Text = '')then
//        begin
//          lblWarning.Caption := 'Incomplete Data Input';
//          Result := True;
//        end
//        else if (edtSectorInner.Text = '0')or (edtSectorOuter.Text = '0')then
//        begin
//          lblWarning.Caption := 'Invalid radius input, minimum radius > 0';
//          Result := True;
//        end
//        else if (edtSectorStartAngle.Text = edtSectorEndAngle.Text) then
//        begin
//          lblWarning.Caption := 'Invalid input..., Start and End Angle can not be identical';
//          Result := True;
//        end
//        else if (edtSectorInner.Text = edtSectorOuter.Text) then
//        begin
//          lblWarning.Caption := 'Invalid input..., Inner and Outer Radius can not be identical';
//          Result := True;
//        end;
//        end;
//      end;
//    end;
//    ovGrid:{Grid}
//    begin
//      case StateOverlay of
//        osDynamic :
//        begin
//          if (edtTableRange.Text = '')or(edtTableBearing.Text = '')or
//          (edtTableHeightD.Text = '')or(edtTableColumnD.Text = '')or
//          (edtTableWidthD.Text = '')or(edtTableRowD.Text = '')or
//          (edtRotationAngleD.Text = '')then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//          else if (edtTableHeightD.Text = '0') or (edtTableColumnD.Text = '0') or (edtTableWidthD.Text = '0')
//          or (edtTableRowD.Text = '0') then
//          begin
//            lblWarning.Caption := 'Invalid input, minimum Col, Row and height > 0';
//            Result := True;
//          end;
//        end;
//        osStatic  :
//        begin
//          if (edtTablePosLong.Text = '')or (edtTablePosLat.Text ='') or
//          (edtTableHeight.Text = '')or (edtTableColumn.Text = '') or
//          (edtTableWidth.Text = '') or (edtTableRow.Text = '')or
//          (edtTableRotationAngle.Text = '')or(edtTablePosLat.Text ='')
//          or(edtTablePosLong.Text='') then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end
//
//          else if (edtTableHeight.Text = '0') or (edtTableColumn.Text = '0') or (edtTableWidth.Text = '0')
//          or (edtTableRow.Text = '0') then
//          begin
//            lblWarning.Caption := 'Invalid input, minimum Col, Row and height > 0';
//            Result := True;
//          end;
//        end;
//      end;
//    end;
//    ovPolygon:{Polygon}
//    begin
//      case StateOverlay of
//        osDynamic :
//        begin
//        if lvPolyVertexD.Items.Count < 1 then
//        begin
//          lblWarning.Caption := 'Incomplete Data Input';
//          Result := True;
//        end;
//        end;
//        osStatic  :
//        begin
//          if lvPolyVertex.Items.Count < 1 then
//          begin
//            lblWarning.Caption := 'Incomplete Data Input';
//            Result := True;
//          end;
//        end;
//      end;
//    end;
//  end;
  {$ENDREGION}

  if Result then
  begin
    pnlWarning.Visible := True;
    lbl86.Visible := True;
    lblWarning.Visible := True;
    lbl86.Font.Color := clRed;
    lbl86.Font.Style := [fsBold];
    lblWarning.Font.Color := clRed;
    isInputProblem := True;
  end;
end;

procedure TfmOverlayEditor.ClearEditText;
begin
  {Text}
  edtTextPosLat.Text  := formatDMS_latt(0);
  edtTextPosLong.Text := formatDMS_long(0);
  edtTextField.Text := 'None';

  edtTextRange.Text := '0';
  edtTextBearing.Text := '0';
  edtTextFieldD.Text := 'None';

  {Line}
  edtLineStartRange.Text := '0';
  edtLineStartBearing.Text := '0';
  edtLineEndRange.Text := '0';
  edtLineEndBearing.Text := '0';

  edtLineStartPosLong.Text := formatDMS_long(0);
  edtLineStartPosLat.Text := formatDMS_latt(0);
  edtLineEndPosLong.Text := formatDMS_long(0);
  edtLineEndPosLat.Text := formatDMS_latt(0);

  {Rectangle}
  edtRecStartRange.Text := '0';
  edtRecStartBearing.Text := '0';
  edtRecEndRange.Text := '0';
  edtRecEndBearing.Text := '0';

  edtRectStartPosLong.Text := formatDMS_long(0);
  edtRectStartPosLat.Text := formatDMS_latt(0);
  edtRectEndPosLong.Text := formatDMS_long(0);
  edtRectEndPosLat.Text := formatDMS_latt(0);

  {Circle}
  edtCircleRange.Text := '0';
  edtCircleBearing.Text := '0';
  edtCircleRadiusD.Text := '0';

  edtCircleRadius.Text := '1';
  edtCirclePosLong.Text := formatDMS_long(0);
  edtCirclePosLat.Text := formatDMS_latt(0);

  {Ellipse}
  edtEllipseRange.Text := '0';
  edtEllipseBearing.Text := '0';
  edtEllipseHorizontalD.Text := '0';
  edtEllipseVerticalD.Text := '0';

  edtHorizontal.Text := '1';
  edtVertical.Text := '1';
  edtEllipsePosLong.Text := formatDMS_long(0);
  edtEllipsePosLat.Text := formatDMS_latt(0);

  {Arc}
  edtArcRange.Text := '0';
  edtArcBearing.Text := '0';
  edtArcRadiusD.Text := '0';
  edtArcStartAngleD.Text := '0';
  edtArcEndAngleD.Text := '0';

  edtArcRadius.Text := '1';
  edtArcPosLong.Text := formatDMS_long(0);
  edtArcPosLat.Text := formatDMS_latt(0);
  edtArcStartAngle.Text := '0';
  edtArcEndAngle.Text := '0';

  {Sector}
  edtSectorRange.Text := '0';
  edtSectorBearing.Text := '0';
  edtSectorInnerD.Text := '0';
  edtSectorOuterD.Text := '0';
  edtSectorStartAngleD.Text := '0';
  edtSectorEndAngleD.Text := '0';

  edtSectorInner.Text := '1';
  edtSectorOuter.Text := '2';
  edtSectorPosLong.Text := formatDMS_long(0);
  edtSectorPosLat.Text := formatDMS_latt(0);
  edtSectorStartAngle.Text := '0';
  edtSectorEndAngle.Text := '0';

  {Grid}
  edtTableRange.Text := '0';
  edtTableBearing.Text := '0';
  edtTableHeightD.Text := '1';
  edtTableColumnD.Text := '1';
  edtTableWidthD.Text := '1';
  edtRotationAngleD.Text := '0';

  edtTableHeight.Text := '1';
  edtTableWidth.Text := '1';
  edtTablePosLong.Text := formatDMS_long(0);
  edtTablePosLat.Text := formatDMS_latt(0);
  edtTableColumn.Text := '1';
  edtTableRow.Text := '1';
  edtTableRotationAngle.Text:= '0';

  {Polygon}
  edtPolygonRange.Text := '0';
  edtPolygonBearing.Text:= '0';
  edtPolyPosLong.Text := formatDMS_long(0);
  edtPolyPosLat.Text := formatDMS_latt(0);
  lvPolyVertexD.Clear;
  lvPolyVertex.Clear;
end;

procedure TfmOverlayEditor.ClearFlagPoint;
begin
  simMgrClient.DrawFlagPoint.FList.Clear;
end;

procedure TfmOverlayEditor.clearSelect;
var
  I            : Integer;
  itemS        : TMainStaticShape;
  itemD        : TMainDynamicShape;
begin
  if Assigned(FSelectedOverlay) then
  begin
    case StateOverlay of
      osDynamic :
      for I := 0 to FSelectedOverlay.DynamicList.Count - 1 do
      begin
        itemD := FSelectedOverlay.DynamicList[i];
        itemD.isSelected := False;
      end;
      osStatic :
      for I := 0 to FSelectedOverlay.StaticList.Count - 1 do
      begin
        itemS := FSelectedOverlay.StaticList[i];
        itemS.isSelected := False;
      end;
    end;
    ClearEditText;
    ClearFlagPoint;
    frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
    btnNone.Down := True;
  end;

end;

procedure TfmOverlayEditor.colorChooseChange(Sender: TObject);
begin
  if FShapeColor = scOutline then
  begin
    pnlOutline.Color := colorChoose.ForegroundColor;
  end
  else
  begin
    FisNoFill := False;
    pnlFill.Caption := '';
    pnlFill.Color := colorChoose.ForegroundColor;
  end;
end;

procedure TfmOverlayEditor.Deleted;
var
  recShapeStatic : TRecCmd_OverlayStaticShape;
  recShapeDynamic : TRecCmd_OverlayDynamicShape;
begin

  if not FindIdSelectedShape then
      Exit;

  if Assigned(FSelectedOverlay) then
  begin
    case FSelectedOverlay.Tipe of
      0 :
      begin
        recShapeDynamic.IdAction := 3;
        recShapeDynamic.TemplateId := FSelectedOverlay.OverlayIndex;
        recShapeDynamic.IdSelectShape := NoShapeInList;
        recShapeDynamic.ShapeID := FShapeType;

        if simMgrClient.ISWasdal or simMgrClient.ISInstructor then
        begin
          {Kirim data disini}
          simMgrClient.netSend_CmdOverlayDynamicShape(recShapeDynamic);
        end
        else
        begin
        if (ForceSelectedTemplate = simMgrClient.FMyCubGroup.FData.Force_Designation) and (RoleSelectedTemplate = 'Operator')then
        begin
          {Kirim data disini}
          simMgrClient.netSend_CmdOverlayDynamicShape(recShapeDynamic);
        end
        else
          ShowMessage('You can not delete this object');
        end;
      end;
      1 :
      begin
        recShapeStatic.IdAction := caDelete;
        recShapeStatic.TemplateId := FSelectedOverlay.OverlayIndex;
        recShapeStatic.IdSelectShape := NoShapeInList;
        recShapeStatic.ShapeType := FShapeType;

        if simMgrClient.ISWasdal or simMgrClient.ISInstructor then
        begin
          {Kirim data disini}
          simMgrClient.netSend_CmdOverlayStaticShape(recShapeStatic);
        end
        else
        begin
        if (ForceSelectedTemplate = simMgrClient.FMyCubGroup.FData.Force_Designation) and (RoleSelectedTemplate = 'Operator') then
        begin
          {Kirim data disini}
          simMgrClient.netSend_CmdOverlayStaticShape(recShapeStatic);
        end
        else
          ShowMessage('You can not delete this object');
        end;

      end;
    end;
  end;

end;

procedure TfmOverlayEditor.DeleteTemplate;
var
  recTemplate : TRecCmd_OverlayTemplate;
  isDeleteTemp : Boolean;

begin
  if not Assigned(FSelectedOverlay) then
  begin
    ShowMessage('Select Overlay List ... !');
    Exit;
  end;

  recTemplate.OverlayID := FSelectedOverlay.OverlayIndex;
  recTemplate.IdAction := caDelete;

  isDeleteTemp := False;

  case simMgrClient.ConsoleRole of
    krInstruktur, kr2DViewer, krMiddleWasdal, krSideWasdal :
    begin
      isDeleteTemp := (FSelectedOverlay.role <> krPlotter) and (FSelectedOverlay.role <> krOperator)
    end;
    krPlotter, krOperator :
    begin
      isDeleteTemp := FSelectedOverlay.roleName = simMgrClient.ConsoleName;
    end;
  end;

  if isDeleteTemp then
    simMgrClient.netSend_CmdOverlayTemplate(recTemplate)
  else
    ShowMessage('You can not delete this template');

  btnDelete.Enabled := False;
  btnEdit.Enabled := False;
end;

procedure TfmOverlayEditor.EditTemplate;
var
  i : Integer;
  OverlayTemplate : TMainOverlayTemplate;
  isEdirTemp : Boolean;
begin
  if Assigned(FSelectedOverlay) then
  begin
    isEdirTemp := False;

    case simMgrClient.ConsoleRole of
      krInstruktur, kr2DViewer, krMiddleWasdal, krSideWasdal :
      begin
        isEdirTemp := (FSelectedOverlay.role <> krPlotter) and (FSelectedOverlay.role <> krOperator)
      end;
      krPlotter, krOperator :
      begin
        isEdirTemp := FSelectedOverlay.roleName = simMgrClient.ConsoleName;
      end;
    end;

    if isEdirTemp then
    begin
      grpTemplate.Left := 351;
      Self.Caption := FSelectedOverlay.Name;

      lblState.Caption := 'STATIC';
      pnlStatic.Visible := True;

      pnlPenEditing.Visible := True;
      grbColour.Visible := True;

      {Selain overlay yg diedit, semuanya di hiden}
      for i := 0 to simMgrClient.SimOverlayTemplate.FList.Count - 1 do
      begin
        OverlayTemplate := simMgrClient.SimOverlayTemplate.FList.Items[i];
        OverlayTemplate.isShow := False;
      end;

      FSelectedOverlay.isShow := True;
    end
    else
      ShowMessage('You can not edit this template');
  end;
end;

procedure TfmOverlayEditor.SelectShape(pos: TPoint);
begin
  IsFind := False;

  if Assigned(FSelectedOverlay) then
  begin
    if FSelectedOverlay.isShow = True then
    begin
      if FSelectedOverlay.Tipe = 0 then
      begin
        simMgrClient.SimOverlayTemplate.SelectShapeDynamic(NoShapeInList, FSelectedOverlay.Idx, IdSelectedTrack ,pos)
      end
      else
      begin
        SelectShapeStatic(NoShapeInList, FSelectedOverlay.OverlayIndex, pos)
      end;
    end;
  end;
end;

procedure TfmOverlayEditor.SelectShapeStatic(var NoShapeInList: Integer; IdTemplate: Integer; pos: TPoint);
var
  i, j, k, Hr,Vr, r,
  x1, x2, x3, x4, x5,
  y1, y2, y3, y4, y5 : Integer;

  Idx, Idy, Odx, Ody,
  RKiAts, RKaAts, RKiBwh, RKaBwh,
  BKiAts, BKaAts, BKiBwh, BKaBwh : Double;

  IptS, IptE, OptS, OptE, ptPos : t2DPoint;

  rect1, rect2, rect3, rect4 : TRect;

  item        : TMainStaticShape;
  OText       : TTextStatic;
  OLine       : TLineStatic;
  ORectangle  : TRectangleStatic;
  OCircle     : TCircleStatic;
  OEllipse    : TEllipseStatic;
  OArc        : TArcStatic;
  OSector     : TSectorStatic;
  OGrid       : TGridStatic;
  OPolygon    : TPolygonStatic;

  polyPoint : Array of TPoint;
  point : TDotStatic;

  IsEdit : Boolean;
  countList : Integer;
  OverlayTemplate : TMainOverlayTemplate;

begin
  OverlayTemplate := simMgrClient.SimOverlayTemplate.GetOverlayTemplate(IdTemplate);
  for i := 0 to OverlayTemplate.StaticList.Count - 1 do
  begin
    item := OverlayTemplate.StaticList[i];
    item.isSelected := False;
  end;

  IsFind := False;

  for countList := OverlayTemplate.StaticList.Count - 1 downto 0 do
  begin
    ptPos := FFormula.PointTo2D(pos.X, pos.Y);

    item := OverlayTemplate.StaticList[countList];

    {$REGION ' Text Section '}
    if item is TTextStatic then
    begin
      OText := TTextStatic(item);

      simMgrClient.Converter.ConvertToScreen(OText.postStart.X, OText.postStart.Y, x1, y1);
      rect1 := FFormula.checkText(x1, y1, OText.Size, OText.words);

      if ptToArea(rect1, ptPos) then
      begin
        IsFind := True;
        LoadPanelText;

        ShapeType := ovText;
        edtTextPosLat.Text  := formatDMS_latt(OText.postStart.Y);
        edtTextPosLong.Text := formatDMS_long(OText.postStart.X);
        cbbTextSize.Text    := IntToStr(OText.size);
        edtTextField.Text   := OText.words;
        pnlOutline.Color    := OText.Color;
        OText.isSelected    := true;

        NoShapeInList := countList;

        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Line Section '}
    if item is TLineStatic then
    begin
      OLine := TLineStatic(item);

      simMgrClient.Converter.ConvertToScreen(OLine.postStart.X, OLine.postStart.Y, x1, y1);
      simMgrClient.Converter.ConvertToScreen(OLine.postEnd.X, OLine.postEnd.Y, x2, y2 );

      IptS  := FFormula.PointTo2D(x1, y1);
      IptE  := FFormula.PointTo2D(x2, y2);

      if ptToLine(IptS,IptE,ptPos) then
      begin
        IsFind := True;
        OLine.isSelected := true;

        LoadPanelLine;

        ShapeType := ovLine;
        edtLineStartPosLat.Text := formatDMS_latt(OLine.postStart.Y);
        edtLineStartPosLong.Text := formatDMS_long(OLine.postStart.X);
        edtLineEndPosLat.Text := formatDMS_latt(OLine.postEnd.Y);
        edtLineEndPosLong.Text := formatDMS_long(OLine.postEnd.X);
        pnlOutline.Color := OLine.Color;
        cbbDashesPen.Text :=  lineTypeChoice(OLine.LineType);
        cbbWeightPen.Text := IntToStr(OLine.weight);

        NoShapeInList := countList;

        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Rectangle Section '}
    if item is TRectangleStatic then
    begin
      ORectangle := TRectangleStatic(item);

      simMgrClient.Converter.ConvertToScreen(ORectangle.postStart.X, ORectangle.postStart.Y, x1, y1);
      simMgrClient.Converter.ConvertToScreen(ORectangle.postEnd.X, ORectangle.postEnd.Y, x2, y2 );

      rect1.Left    := x1;
      rect1.Top     := Y1;
      rect1.Right   := x2;
      rect1.Bottom  := Y2;

      rect2 := FFormula.checkXYPosition(rect1.Left, rect1.Top, rect1.Right, rect1.Bottom);

      if ptToArea(rect2, ptPos) then
      begin
        IsFind := True;
        ORectangle.isSelected := true;

        LoadPanelRectangle;

        ShapeType := ovRectangle;
        edtRectStartPosLong.Text  := formatDMS_long(ORectangle.postStart.X);
        edtRectStartPosLat.Text   := formatDMS_latt(ORectangle.postStart.Y);
        edtRectEndPosLong.Text    := formatDMS_long(ORectangle.postEnd.X);
        edtRectEndPosLat.Text     := formatDMS_latt(ORectangle.postEnd.Y);
        pnlOutline.Color      := ORectangle.Color;

        cbbDashesPen.Text :=  lineTypeChoice(ORectangle.LineType);
        cbbWeightPen.Text := IntToStr(ORectangle.weight);

        if ORectangle.BrushStyle = bsClear then
        begin
          SetNoFill(True);
        end
        else
        begin
          SetNoFill(False);
          PnlFill.Color := ORectangle.ColorFill;
        end;

        NoShapeInList := countList;

        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Circle Section '}
    if item is TCircleStatic then
    begin
      OCircle := TCircleStatic(item);

      simMgrClient.Converter.ConvertToMap(pos.X, pos.Y, ptPos.X, ptPos.Y);

      if ptToCircle(OCircle.postCenter, ptPos, OCircle.radius) then
      begin
        IsFind := True;
        OCircle.isSelected := true;

        LoadPanelCircle;

        ShapeType := ovCircle;
        edtCirclePosLong.Text := formatDMS_long(OCircle.postCenter.X);
        edtCirclePosLat.Text := formatDMS_latt(OCircle.postCenter.Y);
        edtCircleRadius.Text := FloatToStr(OCircle.radius);
        pnlOutline.Color := OCircle.Color;

        cbbDashesPen.Text :=  lineTypeChoice(OCircle.LineType);
        cbbWeightPen.Text := IntToStr(OCircle.weight);

        if OCircle.BrushStyle = bsClear then
        begin
          SetNoFill(True);
        end
        else
        begin
        SetNoFill(False);
        pnlFill.Color := OCircle.ColorFill;
        end;

        NoShapeInList := countList;

        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Ellipse Section '}
    if item is TEllipseStatic then
    begin
      OEllipse := TEllipseStatic(item);

      Idx := OEllipse.postCenter.X + OEllipse.Hradius/60;
      Idy := OEllipse.postCenter.Y + OEllipse.Vradius/60;

      simMgrClient.Converter.ConvertToScreen(OEllipse.postCenter.X, OEllipse.postCenter.Y, x1, y1);
      simMgrClient.Converter.ConvertToScreen(Idx, Idy, x2, y2);

      Hr := Abs(x1 - x2);
      Vr := Abs(y1 - y2);

      rect1.Left    := x1 - Hr;
      rect1.Top     := Y1 - Vr;
      rect1.Right   := x1 + Hr;
      rect1.Bottom  := Y1 + Vr;

      rect2 := FFormula.checkXYPosition(rect1.Left, rect1.Top, rect1.Right, rect1.Bottom);

      if ptToArea(rect2, ptPos) then
      begin
        IsFind := True;
        OEllipse.isSelected := true;

        LoadPanelEllipse;

        ShapeType := ovEllipse;
        edtEllipsePosLong.Text  := formatDMS_long(OEllipse.postCenter.X);
        edtEllipsePosLat.Text   := formatDMS_latt(OEllipse.postCenter.Y);
        edtHorizontal.Text      := FloatToStr(OEllipse.Hradius);
        edtVertical.Text        := FloatToStr(OEllipse.Vradius);
        pnlOutline.Color    := OEllipse.Color;

        cbbDashesPen.Text :=  lineTypeChoice(OEllipse.LineType);
        cbbWeightPen.Text := IntToStr(OEllipse.weight);

        if OEllipse.BrushStyle = bsClear then
        begin
          SetNoFill(True);
        end
        else
        begin
          SetNoFill(False);
          pnlFill.Color := OEllipse.ColorFill;
        end;

        NoShapeInList := countList;

        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Arc Section '}
    if item is TArcStatic then
    begin
      OArc := TArcStatic(item);

      simMgrClient.Converter.ConvertToMap(pos.X, pos.Y, ptPos.X, ptPos.Y);

      if ptToArc(OArc.postCenter, ptPos, OArc.radius, OArc.radius, OArc.StartAngle, OArc.EndAngle, 1) then
      begin
        IsFind := True;
        OArc.isSelected  := true;

        LoadPanelArc;

        ShapeType := ovArc;
        edtArcPosLong.Text := formatDMS_long(OArc.postCenter.X);
        edtArcPosLat.Text := formatDMS_latt(OArc.postCenter.Y);
        edtArcRadius.Text := FloatToStr(OArc.radius);
        edtArcStartAngle.Text := IntToStr(OArc.StartAngle);
        edtArcEndAngle.Text := IntToStr(OArc.EndAngle);
        pnlOutline.Color := OArc.Color;
        cbbDashesPen.Text :=  lineTypeChoice(OArc.LineType);
        cbbWeightPen.Text := IntToStr(OArc.weight);

        NoShapeInList := countList;

        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Sector Section '}
    if item is TSectorStatic then
    begin
      OSector := TSectorStatic(item);

      simMgrClient.Converter.ConvertToMap(pos.X, pos.Y, ptPos.X, ptPos.Y);

      if ptToArc(OSector.postCenter, ptPos, OSector.Iradius, OSector.Oradius, OSector.StartAngle, OSector.EndAngle, 2) then
      begin
        IsFind := True;
        OSector.isSelected  := true;

        LoadPanelSector;

        ShapeType := ovSector;
        edtSectorPosLong.Text     := formatDMS_long(OSector.postCenter.X);
        edtSectorPosLat.Text      := formatDMS_latt(OSector.postCenter.Y);
        edtSectorInner.Text       := FloatToStr(OSector.Iradius);
        edtSectorOuter.Text       := FloatToStr(OSector.Oradius);
        edtSectorStartAngle.Text  := IntToStr(OSector.StartAngle);
        edtSectorEndAngle.Text    := IntToStr(OSector.EndAngle);
        pnlOutline.Color      := OSector.Color;

        cbbDashesPen.Text :=  lineTypeChoice(OSector.LineType);
        cbbWeightPen.Text := IntToStr(OSector.weight);

        NoShapeInList := countList;

        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Grid Section '}
    if item is TGridStatic then
    begin
      OGrid := TGridStatic(item);

      //Point Kiri Atas
      IptS.X := OGrid.postCenter.X - ((OGrid.Width/60)*(OGrid.WCount/2));
      IptS.Y := OGrid.postCenter.Y + ((OGrid.Height/60)*(OGrid.HCount)/2);

      //Point Kanan Atas
      IptE.X := OGrid.postCenter.X + ((OGrid.Width/60)*(OGrid.WCount/2));
      IptE.Y := OGrid.postCenter.Y + ((OGrid.Height/60)*(OGrid.HCount)/2);

      //Point Kanan Bawah
      OptS.X := OGrid.postCenter.X + ((OGrid.Width/60)*(OGrid.WCount/2));
      OptS.Y := OGrid.postCenter.Y - ((OGrid.Height/60)*(OGrid.HCount)/2);

      //Point Kiri Bawah
      OptE.X := OGrid.postCenter.X - ((OGrid.Width/60)*(OGrid.WCount/2));
      OptE.Y := OGrid.postCenter.Y - ((OGrid.Height/60)*(OGrid.HCount)/2);

      BKiAts   := CalcBearing(OGrid.postCenter.X, OGrid.postCenter.Y, IptS.X, IptS.Y);
      BKaAts  := CalcBearing(OGrid.postCenter.X, OGrid.postCenter.Y, IptE.X, IptE.Y);
      BKaBwh := CalcBearing(OGrid.postCenter.X, OGrid.postCenter.Y, OptS.X, OptS.Y);
      BKiBwh  := CalcBearing(OGrid.postCenter.X, OGrid.postCenter.Y, OptE.X, OptE.Y);

      RKiAts     := CalcRange(OGrid.postCenter.X, OGrid.postCenter.Y, IptS.X, IptS.Y);
      RKaAts    := CalcRange(OGrid.postCenter.X, OGrid.postCenter.Y, IptE.X, IptE.Y);
      RKaBwh   := CalcRange(OGrid.postCenter.X, OGrid.postCenter.Y, OptS.X, OptS.Y);
      RKiBwh    := CalcRange(OGrid.postCenter.X, OGrid.postCenter.Y, OptE.X, OptE.Y);

      FindPoint(OGrid.postCenter, IptS, RKiAts, BKiAts + OGrid.Rotation);
      FindPoint(OGrid.postCenter, IptE, RKaAts, BKaAts + OGrid.Rotation);
      FindPoint(OGrid.postCenter, OptS, RKaBwh, BKaBwh + OGrid.Rotation);
      FindPoint(OGrid.postCenter, OptE, RKiBwh, BKiBwh + OGrid.Rotation);

      simMgrClient.Converter.ConvertToScreen(IptS.X, IptS.Y, x1, y1);
      simMgrClient.Converter.ConvertToScreen(IptE.X, IptE.Y, x2, y2);
      simMgrClient.Converter.ConvertToScreen(OptS.X, OptS.Y, x3, y3);
      simMgrClient.Converter.ConvertToScreen(OptE.X, OptE.Y, x4, y4);

      rect1 := FFormula.assignRect(x1, y1);
      rect2 := FFormula.assignRect(x2, y2);
      rect3 := FFormula.assignRect(x3, y3);
      rect4 := FFormula.assignRect(x4, y4);

      rect1.Left    := x1;
      rect1.Top     := Y1;
      rect1.Right   := x3;
      rect1.Bottom  := Y3;

      rect2 := FFormula.checkXYPosition(rect1.Left, rect1.Top, rect1.Right, rect1.Bottom);

      if ptToArea(rect2, ptPos) then
      begin
        IsFind := True;
        OGrid.isSelected := true;

        LoadPanelGrid;

        ShapeType := ovGrid;
        edtTablePosLong.Text        := formatDMS_long(OGrid.postCenter.X);
        edtTablePosLat.Text         := formatDMS_latt(OGrid.postCenter.Y);
        edtTableColumn.Text         := IntToStr(OGrid.HCount);
        edtTableRow.Text            := IntToStr(OGrid.WCount);
        edtTableWidth.Text          := FloatToStr(OGrid.Width);
        edtTableHeight.Text         := FloatToStr(OGrid.Height);
        edtTableRotationAngle.Text  := IntToStr(OGrid.Rotation);
        pnlOutline.Color        := OGrid.Color;

        cbbDashesPen.Text :=  lineTypeChoice(OGrid.LineType);
        cbbWeightPen.Text := IntToStr(OGrid.weight);

        NoShapeInList := countList;

        break;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Polygon Section '}
    if item is TPolygonStatic then
    begin
      OPolygon := TPolygonStatic(item);

      SetLength(polyPoint, OPolygon.polyList.Count);

      for j := 0 to OPolygon.polyList.Count - 1 do
      begin
        point := OPolygon.polyList.Items[j];

        simMgrClient.Converter.ConvertToScreen(point.X, point.Y, x1, y1);
        polyPoint[j].x := x1;
        polyPoint[j].y := y1;
      end;

      for j := 0 to OPolygon.polyList.Count - 1 do
      begin
        rect1 := FFormula.assignRect(polyPoint[j].x, polyPoint[j].y);

        if ptToArea(rect1, ptPos) then
        begin
          IsFind := True;
          OPolygon.isSelected := true;

          LoadPanelPolygon;
          lvPolyVertex.Clear;

          ShapeType := ovPolygon;

          for k := 0 to OPolygon.polyList.Count - 1 do
          begin
            point := OPolygon.polyList.Items[k];

            with lvPolyVertex.Items.Add do
            begin
              SubItems.Add(formatDMS_long(point.X));
              SubItems.Add(formatDMS_latt(point.Y));
            end;
          end;

          lvPolyVertex.Items.BeginUpdate;
          try
           for k := 0 to lvPolyVertex.Items.Count-1 do
             lvPolyVertex.Items.Item[k].Caption:=IntToStr(k+1);
          finally
            lvPolyVertex.Items.EndUpdate;
          end;
          pnlOutline.Color := OPolygon.Color;

          cbbDashesPen.Text :=  lineTypeChoice(OPolygon.LineType);
          cbbWeightPen.Text := IntToStr(OPolygon.weight);

          if OPolygon.BrushStyle = bsClear then
          begin
            SetNoFill(True);
          end
          else
          begin
            SetNoFill(False);
            pnlFill.Color := OPolygon.ColorFill;
          end;

          NoShapeInList := countList;

          break;
        end;
      end;
    end;

    if IsFind then
      break;
  end;
  {$ENDREGION}

  if IsFind then
  begin
    with fmOverlayEditor do
    begin
      btnObjectDelete.Enabled := True;
      btnObjectApply.Enabled := True;
      pnlStatic.Visible := True;
      IsEditObject := True;
    end;
  end
  else
  begin
    with fmOverlayEditor do
    begin
      lblShape.Caption := '---';
      pnlStatic.Visible := False;
      pnlDynamic.Visible := False;
      pnlWarningEdit.Visible := False;
    end;
  end;
end;

procedure TfmOverlayEditor.SelectTemplate;
var
  OverlayTemplate : TMainOverlayTemplate;
begin
  chkShowAllOverlayTemplate.Checked := False;
  chkHideAllOverlayTemplate.Checked := False;
  chkShowOverlayTemplate.Checked := FSelectedOverlay.isShow;

//  grpStatic.Visible := False;
//  grpDynamic.Visible := False;

  {dibuat IdSelectedRoute - 1, karena perbedaan penomoran antara Flisttemp dan listview}
//  OverlayTemplate := simMgrClient.DrawOverlayTemplate.FList.Items[IdSelectedTemplate - 1];
//  StateOverlay := OverlayTemplate.Tipe;
//
//  if StateOverlay = osDynamic then
//  begin
//    grpDynamic.Visible := True;
//    RefreshDynamicTrack;
//  end
//  else
//  begin
//    grpStatic.Visible := True;
//    btnEdit.Enabled := True;

//    case OverlayTemplate.Domain of
//      vhdAir        : lbDomain.Caption := 'Air';
//      vhdSurface    : lbDomain.Caption := 'Surface';
//      vhdSubsurface : lbDomain.Caption := 'Subsurface';
//      vhdLand       : lbDomain.Caption := 'Land';
//      vhdGeneral    : lbDomain.Caption := 'General';
//    end;

//    chkShowOverlayTemplate.Checked := OverlayTemplate.isShow;
//  end;

//  if OverlayTemplate.isShow then
//    chkShowOverlayTemplate.Checked := True
//  else
//    chkShowOverlayTemplate.Checked := False;
end;

procedure TfmOverlayEditor.SetNoFill(val: Boolean);
begin
  if val then
  begin
    FisNoFill := True;
    pnlFill.Caption := 'No Fill';
    pnlFill.Color := $00FFFAF0;
  end
  else
  begin
    FisNoFill := False;
    pnlFill.Caption := '';
    pnlFill.Color := $00FFFAF0;
  end;
end;

procedure TfmOverlayEditor.SetTrackPlatform(const Value: TSimObject);
begin
  FTrackPlatform := Value;
end;

procedure TfmOverlayEditor.ShowForceOverlayEdit;
begin
  if not simMgrClient.ISInstructor and not simMgrClient.ISWasdal then
  begin
//    lvTemplates.Height := 445;
//    rgForce.Visible := False;
//    Bevel2.Top := 112;
//    Bevel2.Visible := True;
//    pnlCreateNew.Top := 461;
//    pnlCreateNew.Height := 258;
//    btnCancel.Top := 124;
//    btnOk.Top := 124;
  end
  else
  begin
//    lvTemplates.Height := 349;
//    rgForce.Visible := True;
//    Bevel2.Visible := True;
//    Bevel2.Top := 202;
//    pnlCreateNew.Top := 371;
//    pnlCreateNew.Height := 240;
//    btnCancel.Top := 213;
//    btnOk.Top := 213;
  end;
end;

procedure TfmOverlayEditor.templateShowHide(Sender: TObject);
var
  i,j : Integer;
  OverlayTemplate : TMainOverlayTemplate;
begin
case TCheckBox(Sender).Tag of
  1 :
  begin
    if lvTemplates.Selected = nil then
      Exit;

    for I := 0 to simMgrClient.SimOverlayTemplate.FList.Count - 1 do
    begin
      OverlayTemplate := simMgrClient.SimOverlayTemplate.FList.Items[i];
      if OverlayTemplate.Name = lvTemplates.Selected.SubItems[0] then
      begin
        OverlayTemplate.isShow := chkShowOverlayTemplate.Checked;
        chkShowOverlayTemplate.Checked := chkShowOverlayTemplate.Checked;
        Break;
      end;
    end;

    chkShowAllOverlayTemplate.Checked := False;
    chkHideAllOverlayTemplate.Checked := False;
  end;
  2 :
  begin
    if chkShowAllOverlayTemplate.Checked then
    begin
      chkShowAllOverlayTemplate.Checked := True;
      chkHideAllOverlayTemplate.Checked := False;
      chkShowOverlayTemplate.Checked := False;

      for I := 0 to simMgrClient.SimOverlayTemplate.FList.Count - 1 do
      begin
        OverlayTemplate := simMgrClient.SimOverlayTemplate.FList.Items[i];
        for j := 0 to lvTemplates.Items.Count - 1 do
        begin
          if OverlayTemplate.Name = lvTemplates.Items[j].SubItems[0] then
            OverlayTemplate.isShow := True;
        end;
      end;
    end
    else
      chkHideAllOverlayTemplate.Checked;
  end;
  3 :
  begin
    if chkHideAllOverlayTemplate.Checked then
    begin
      chkHideAllOverlayTemplate.Checked := True;
      chkShowAllOverlayTemplate.Checked := False;
      chkShowOverlayTemplate.Checked := False;

      for I := 0 to simMgrClient.SimOverlayTemplate.FList.Count - 1 do
      begin
        OverlayTemplate := simMgrClient.SimOverlayTemplate.FList.Items[i];
        for j := 0 to lvTemplates.Items.Count - 1 do
          begin
            if OverlayTemplate.Name = lvTemplates.Items[j].SubItems[0] then
              OverlayTemplate.isShow := False;
          end;
      end;
    end
    else
      chkShowAllOverlayTemplate.Checked;
  end;
end;
end;


{procedure TfmOverlayEditor.chkShowClick(Sender: TObject);
var
//  recTemplate : TRecCmd_OverlayTemplate;
  OverlayTemplate : TMainOverlayTemplate;
begin
  OverlayTemplate := simMgrClient.DrawOverlayTemplate.FList.Items[IdSelectedTemplate - 1];
  OverlayTemplate.isShow := chkShow.Checked;
//
  {OverlayTemplate := simMgrClient.DrawOverlayTemplate.FList.Items[IdSelectedTemplate - 1];
//
  recTemplate.Name := OverlayTemplate.Name;
  recTemplate.IdAction := 5;
  recTemplate.Value := chkShow.Checked;
//
  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
    recTemplate.Cubicle := 0
  else
    recTemplate.Cubicle := simMgrClient.FMyCubGroup.FData.Group_Index;
//
  {Kirim data disini}
  {simMgrClient.netSend_CmdOverlayTemplate(recTemplate);
  chkShowAll.Checked := False;
  chkHideAll.Checked := False;
//
end;}

procedure TfmOverlayEditor.txtNoFillClick(Sender: TObject);
begin
//  if isFrameFill then
//    isNoFill := False;
//
//  if isBtnFillClick then
//    isNoFill := True;
//
//  if isNoFill then
//  begin
//    pnlOutline.Visible := True;
//    isFillEmpty := True;
//  end;
end;

procedure TfmOverlayEditor.AddPolyDClick(Sender: TObject);
begin
  with lvPolyVertexD.Items.Add do
  begin
    SubItems.Add(edtPolygonRange.Text);
    SubItems.Add(edtPolygonBearing.Text);
  end;
  RefreshLvPolyVertexList(0);
  edtPolygonRange.Text := '0';
  edtPolygonBearing.Text := '0';
end;

procedure TfmOverlayEditor.AddTemplate;
var
  recTemplate : TRecCmd_OverlayTemplate;
begin

  if FilterName then
  begin
    ShowMessage('Please use another name');
    exit;
  end;

  recTemplate.Name := edtNameOverlay.Text;
  recTemplate.IdAction := caAdd;
  recTemplate.Tipe := TipeOverlay;
  recTemplate.Domain := DomainOverlay;
  recTemplate.role := simMgrClient.ConsoleRole;
  recTemplate.roleName := simMgrClient.ConsoleName;

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    case rgForce.ItemIndex of
      0 : recTemplate.force := 3; //blue
      1 : recTemplate.force := 1; //red
    end;
  end
  else
  begin
    recTemplate.force := simMgrClient.FMyCubGroup.FData.Force_Designation;
  end;

  {Kirim data disini}
  simMgrClient.netSend_CmdOverlayTemplate(recTemplate);

  pnlType.BringToFront;
end;

procedure TfmOverlayEditor.FillEditText;
begin
  case FTagTombolPosition of
    0:
    begin
      edtTextPosLat.Text  := formatDMS_latt(PostY);
      edtTextPosLong.Text := formatDMS_long(PostX);
    end;
    1:
    begin
      edtLineStartPosLat.Text  := formatDMS_latt(PostY);
      edtLineStartPosLong.Text := formatDMS_long(PostX);
    end;
    2:
    begin
      edtLineEndPosLat.Text  := formatDMS_latt(PostY);
      edtLineEndPosLong.Text := formatDMS_long(PostX);
    end;
    3:
    begin
      edtRectStartPosLat.Text  := formatDMS_latt(PostY);
      edtRectStartPosLong.Text := formatDMS_long(PostX);
    end;
    4:
    begin
      edtRectEndPosLat.Text  := formatDMS_latt(PostY);
      edtRectEndPosLong.Text := formatDMS_long(PostX);
    end;
    5:
    begin
      edtCirclePosLat.Text  := formatDMS_latt(PostY);
      edtCirclePosLong.Text := formatDMS_long(PostX);
    end;
    6:
    begin
      edtEllipsePosLat.Text  := formatDMS_latt(PostY);
      edtEllipsePosLong.Text := formatDMS_long(PostX);
    end;
    7:
    begin
      edtArcPosLat.Text  := formatDMS_latt(PostY);
      edtArcPosLong.Text := formatDMS_long(PostX);
    end;
    8:
    begin
      edtSectorPosLat.Text  := formatDMS_latt(PostY);
      edtSectorPosLong.Text := formatDMS_long(PostX);
    end;
    9:
    begin
      edtTablePosLat.Text  := formatDMS_latt(PostY);
      edtTablePosLong.Text := formatDMS_long(PostX);
    end;
    10:
    begin
      edtPolyPosLat.Text  := formatDMS_latt(PostY);
      edtPolyPosLong.Text := formatDMS_long(PostX);
    end;
  end;
end;

function TfmOverlayEditor.FilterName: Boolean;
var
  i : Integer;
begin
  Result := False;

  for i := 0 to lvTemplates.Items.Count-1 do
  begin
    if lvTemplates.Items.Item[i].SubItems[0] = edtNameOverlay.Text then
      Result := True;
  end;
end;

function TfmOverlayEditor.FindIdSelectedShape:Boolean;
var
  I            : Integer;
  OverlayTemplate : TMainOverlayTemplate;
  itemS        : TMainStaticShape;
  itemD        : TMainDynamicShape;

begin
  Result := False;

  if Assigned(FSelectedOverlay) then
  begin
    case FSelectedOverlay.Tipe of
      osDynamic :
      for I := 0 to FSelectedOverlay.DynamicList.Count - 1 do
      begin
        itemD := FSelectedOverlay.DynamicList[i];
        if itemD.isSelected = True then
        begin
          NoShapeInList := i;
          Result := True;
          break;
        end;
      end;
      osStatic :
      for I := 0 to FSelectedOverlay.StaticList.Count - 1 do
      begin
        itemS := FSelectedOverlay.StaticList[i];
        if itemS.isSelected = True then
        begin
          NoShapeInList := i;
          Result := True;
          break;
        end;
      end;
    end;
  end;


  if Result = false then
  begin
    MessageDlg('object has been removed or not selected correctly', mtWarning, [mbOK], 0);
  end;

end;

procedure TfmOverlayEditor.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfmOverlayEditor.FormCreate(Sender: TObject);
begin
  Temporary := TList.Create;
  TemporaryD := TList.Create;
  idxDrawOverlay := -1;
  minIdxDrawOverlay := 0;
end;

procedure TfmOverlayEditor.FormDestroy(Sender: TObject);
begin
  Temporary.Free;
  TemporaryD.Free;
end;

procedure TfmOverlayEditor.FormShow(Sender: TObject);
begin
  AlignFormToMonitor(0, apLeftTop, 3, 65, TForm(self));

  Self.Height := 695;
  Self.Width := 338;

  grpTemplate.Left := 17;

  UpdateOverlayTemplateList;

  lbl86.Visible := False;
  lblWarning.Visible := False;
  Self.Caption := '';

  pnlType.BringToFront;

end;

function TfmOverlayEditor.GetInput(s: string): Boolean;
var
  a, i : Integer;
begin
  Result := False;
  a := 0;

  for i := 1 to length(s) do
  begin
    if s[i] = '.' then
      a := a + 1;
  end;

  if a > 0 then
    Result := True;
end;

function TfmOverlayEditor.lineTypeChoice(linetype: TPenStyle): String;
begin
  case linetype of
    TPenStyle(psSolid) :
      begin
        Result := 'Solid' ;
        cbbDashesPen.ItemIndex := 0;
      end;
    TPenStyle(psDash):
      begin
        Result := 'Dash';
        cbbDashesPen.ItemIndex := 1;
      end;
    TPenStyle(psDot):
      begin
        Result := 'Dot';
        cbbDashesPen.ItemIndex := 2;
      end;
    TPenStyle(psDashDot):
      begin
        Result := 'Dash Dot';
        cbbDashesPen.ItemIndex := 3;
      end;
    TPenStyle(psDashDotDot):
      begin
        Result := 'Dash Dot Dot';
        cbbDashesPen.ItemIndex := 4;
      end;
  end;
end;

procedure TfmOverlayEditor.LoadPanelText;
begin
  lblShape.Caption := 'Text';

  {$REGION ' Dynamic Handle '}
  grpTextD.BringToFront;
  {$ENDREGION}

  {$REGION ' Static Handle '}
  grpText.BringToFront;
  {$ENDREGION}

  {$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := False;
  pnlpenediting.Visible := True;
  SetNoFill(True);
  btnOutlineClick(nil);
  {$ENDREGION}
end;

procedure TfmOverlayEditor.LoadPanelLine;
begin
  lblShape.Caption := 'Line';

  {$REGION ' Dynamic Handle '}
  grpLineD.BringToFront;
  {$ENDREGION}

  {$REGION ' Static Handle '}
  grpLine.BringToFront;
  {$ENDREGION}

  {$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := False;
  pnlpenediting.Visible := True;
  SetNoFill(True);
  btnOutlineClick(nil);
  {$ENDREGION}
end;

procedure TfmOverlayEditor.LoadPanelCircle;
begin
  lblShape.Caption := 'Circle';

  {$REGION ' Dynamic Handle '}
  grpCircleD.BringToFront;
  {$ENDREGION}

  {$REGION ' Static Handle '}
  grpCircle.BringToFront;
  {$ENDREGION}

  {$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := True;
  pnlpenediting.Visible := True;
  SetNoFill(True);
  btnOutlineClick(nil);
  {$ENDREGION}
end;

procedure TfmOverlayEditor.LoadPanelEllipse;
begin
  lblShape.Caption := 'Ellipse';

  {$REGION ' Dynamic Handle '}
  grpEllipseD.BringToFront;
  {$ENDREGION}

  {$REGION ' Static Handle '}
  grpEllipse.BringToFront;
  {$ENDREGION}

  {$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := True;
  pnlpenediting.Visible := True;
  SetNoFill(True);
  btnOutlineClick(nil);
  {$ENDREGION}
end;

procedure TfmOverlayEditor.LoadPanelRectangle;
begin
  lblShape.Caption := 'Rectangle';

  {$REGION ' Dynamic Handle '}
  grpRectangleD.BringToFront;
  {$ENDREGION}

  {$REGION ' Static Handle '}
  grpRectangle.BringToFront;
  {$ENDREGION}

  {$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := True;
  pnlpenediting.Visible := True;
  SetNoFill(True);
  btnOutlineClick(nil);
  {$ENDREGION}
end;

procedure TfmOverlayEditor.LoadPanelArc;
begin
  lblShape.Caption := 'Arc';

  {$REGION ' Dynamic Handle '}
  grpArcD.BringToFront;
  {$ENDREGION}

  {$REGION ' Static Handle '}
  grpArc.BringToFront;
  {$ENDREGION}

  {$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := False;
  pnlpenediting.Visible := True;
  SetNoFill(True);
  btnOutlineClick(nil);
  {$ENDREGION}
end;

procedure TfmOverlayEditor.LoadPanelGrid;
begin
  lblShape.Caption := 'Grid';

  {$REGION ' Dynamic Handle '}
  grpGridD.BringToFront;
  {$ENDREGION}

  {$REGION ' Static Handle '}
  grpGrid.BringToFront;
  {$ENDREGION}

  {$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := False;
  pnlpenediting.Visible := True;
  SetNoFill(True);
  btnOutlineClick(nil);
  {$ENDREGION}
end;

procedure TfmOverlayEditor.LoadPanelPolygon;
begin
   lblShape.Caption := 'Polygon';

  {$REGION ' Dynamic Handle '}
  grpPolygonD.BringToFront;
  {$ENDREGION}

  {$REGION ' Static Handle '}
  grpPolygon.BringToFront;
  {$ENDREGION}

  {$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := True;
  pnlpenediting.Visible := True;
  SetNoFill(True);
  btnOutlineClick(nil);
  {$ENDREGION}
end;

procedure TfmOverlayEditor.LoadPanelSector;
begin
  lblShape.Caption := 'Sector';

  {$REGION ' Dynamic Handle '}
  grpSectorD.BringToFront;
  {$ENDREGION}

  {$REGION ' Static Handle '}
  grpSector.BringToFront;
  {$ENDREGION}

  {$REGION ' Button Handle '}
  btnOutline.Visible := True;
  btnFill.Visible := True;
  pnlpenediting.Visible := True;
  {$ENDREGION}
end;

procedure TfmOverlayEditor.GbrText;
var
  Size : Byte;
  recShapeStatic : TRecCmd_OverlayStaticShape;
  recShapeDynamic : TRecCmd_OverlayDynamicShape;

begin
  if CekInput(ovText) then
    Exit;

  Size := 10;

  if IsEditObject then
  begin
      Action := caEdit;
    if not FindIdSelectedShape then
      Exit;
  end
  else
    Action := caAdd;

  case StateOverlay of

    {$REGION ' Dynamic Section '}
    osDynamic :
    begin
      recShapeDynamic.IdAction := Action;
      recShapeDynamic.IdSelectShape := NoShapeInList;
      recShapeDynamic.TemplateId := FSelectedOverlay.OverlayIndex;

      recShapeDynamic.ShapeID := ovText;
      recShapeDynamic.PostStart.Bearing := StrToFloat(edtTextBearing.Text);
      recShapeDynamic.PostStart.Range := StrToFloat(edtTextRange.Text);
      recShapeDynamic.Size := StrToInt(cbbTextSizeD.Text);
      recShapeDynamic.Words := edtTextFieldD.Text;
      recShapeDynamic.color := pnlOutline.Color;

      if Action = caEdit then
        recShapeDynamic.idxDraw := simMgrClient.SimOverlayTemplate.idxOverlay
      else
        recShapeDynamic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayDynamicShape(recShapeDynamic);
    end;
    {$ENDREGION}

    {$REGION ' Static Section '}
    osStatic  :
    begin
      recShapeStatic.TemplateId := FSelectedOverlay.OverlayIndex;
      recShapeStatic.ShapeType := ovText;
      recShapeStatic.IdSelectShape := NoShapeInList;
      recShapeStatic.IdAction := Action;

      recShapeStatic.PostStart.X := dmsToLong(edtTextPosLong.Text);
      recShapeStatic.PostStart.Y := dmsToLatt(edtTextPosLat.Text);
      recShapeStatic.Size := StrToInt(cbbTextSize.Text);
      recShapeStatic.Words := edtTextField.Text;
      recShapeStatic.color := pnlOutline.Color;

//      if Action = caEdit then
//        recShapeStatic.idxDraw := simMgrClient.DrawOverlayTemplate.idxOverlay
//      else
//        recShapeStatic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayStaticShape(recShapeStatic);
    end;
    {$ENDREGION}

  end;

  isInputProblem := False;
end;

procedure TfmOverlayEditor.GbrLine;
var
  recShapeStatic : TRecCmd_OverlayStaticShape;
  recShapeDynamic : TRecCmd_OverlayDynamicShape;

begin
  if CekInput(ovLine) then
    Exit;

  if IsEditObject then
  begin
      Action := 2;
    if not FindIdSelectedShape then
      Exit;
  end
  else
    Action := 1;

  case StateOverlay of

    {$REGION ' Dynamic Section '}
    osDynamic :
    begin
      recShapeDynamic.IdAction := Action;
      recShapeDynamic.IdSelectShape := NoShapeInList;
      recShapeDynamic.TemplateId := FSelectedOverlay.OverlayIndex;

      recShapeDynamic.ShapeID := ovLine;
      recShapeDynamic.PostStart.Bearing := StrToFloat(edtLineStartBearing.Text);
      recShapeDynamic.PostStart.Range := StrToFloat(edtLineStartRange.Text);
      recShapeDynamic.PostEnd.Bearing := StrToFloat(edtLineEndBearing.Text);
      recShapeDynamic.PostEnd.Range := StrToFloat(edtLineEndRange.Text);
      recShapeDynamic.color := pnlOutline.color;

      recShapeDynamic.lineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeDynamic.weight := StrToInt(cbbWeightPen.Text);

      if Action = caEdit then
        recShapeDynamic.idxDraw := simMgrClient.SimOverlayTemplate.idxOverlay
      else
        recShapeDynamic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayDynamicShape(recShapeDynamic);
    end;
    {$ENDREGION}

    {$REGION ' Static Section '}
    osStatic  :
    begin
      recShapeStatic.TemplateId := FSelectedOverlay.OverlayIndex;
      recShapeStatic.ShapeType := ovLine;
      recShapeStatic.IdSelectShape := NoShapeInList;
      recShapeStatic.IdAction := Action;

      recShapeStatic.postStart.X := dmsToLong(edtLineStartPosLong.Text);
      recShapeStatic.postStart.Y := dmsToLatt(edtLineStartPosLat.Text);
      recShapeStatic.postEnd.X := dmsToLong(edtLineEndPosLong.Text);
      recShapeStatic.postEnd.Y := dmsToLatt(edtLineEndPosLat.Text);

      recShapeStatic.color := pnlOutline.color;
      recShapeStatic.lineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeStatic.weight := StrToInt(cbbWeightPen.Text);

//      if Action = caEdit then
//        recShapeStatic.idxDraw := simMgrClient.DrawOverlayTemplate.idxOverlay
//      else
//        recShapeStatic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayStaticShape(recShapeStatic);
    end;
    {$ENDREGION}
  end;
  isInputProblem := False;
end;

procedure TfmOverlayEditor.GbrRectangle;
var
  recShapeStatic : TRecCmd_OverlayStaticShape;
  recShapeDynamic : TRecCmd_OverlayDynamicShape;
begin
  if CekInput(ovRectangle) then
    Exit;

  if IsEditObject then
  begin
    Action := 2;
  if not FindIdSelectedShape then
    Exit;
  end
  else
    Action := 1;

  case StateOverlay of

    {$REGION ' Dynamic Section '}
    osDynamic :
    begin
      recShapeDynamic.IdAction := Action;
      recShapeDynamic.IdSelectShape := NoShapeInList;
      recShapeDynamic.TemplateId := FSelectedOverlay.OverlayIndex;

      recShapeDynamic.ShapeID := ovRectangle;
      recShapeDynamic.PostStart.Bearing := StrToFloat(edtRecStartBearing.Text);
      recShapeDynamic.PostStart.Range := StrToFloat(edtRecStartRange.Text);
      recShapeDynamic.PostEnd.Bearing := StrToFloat(edtRecEndBearing.Text);
      recShapeDynamic.PostEnd.Range := StrToFloat(edtRecEndRange.Text);

      recShapeStatic.color := pnlOutline.Color;
      recShapeDynamic.BrushStyle := bsClear;

      recShapeDynamic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeDynamic.Weight := StrToInt(cbbWeightPen.Text);

      if Action = caEdit then
        recShapeDynamic.idxDraw := simMgrClient.SimOverlayTemplate.idxOverlay
      else
        recShapeDynamic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayDynamicShape(recShapeDynamic);
    end;
    {$ENDREGION}

    {$REGION ' Static Section '}
    osStatic  :
    begin
      recShapeStatic.TemplateId := FSelectedOverlay.OverlayIndex;
      recShapeStatic.ShapeType := ovRectangle;
      recShapeStatic.IdSelectShape := NoShapeInList;
      recShapeStatic.IdAction := Action;

      recShapeStatic.postStart.X := dmsToLong(edtRectStartPosLong.Text);
      recShapeStatic.postStart.Y := dmsToLatt(edtRectStartPosLat.Text);
      recShapeStatic.postEnd.X := dmsToLong(edtRectEndPosLong.Text);
      recShapeStatic.postEnd.Y := dmsToLatt(edtRectEndPosLat.Text);

      recShapeStatic.color := pnlOutline.Color;

      if FisNoFill  then
      begin
        recShapeStatic.BrushStyle := bsClear;
      end
      else
      begin
        recShapeStatic.BrushStyle := bsSolid;
        recShapeStatic.ColorFill := pnlFill.Color;
      end;

      recShapeStatic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeStatic.Weight := StrToInt(cbbWeightPen.Text);

//      if Action = caEdit then
//        recShapeStatic.idxDraw := simMgrClient.DrawOverlayTemplate.idxOverlay
//      else
//        recShapeStatic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayStaticShape(recShapeStatic);
    end;
    {$ENDREGION}
  end;
  isInputProblem := False;
end;

procedure TfmOverlayEditor.GbrCircle;
 var
  recShapeStatic : TRecCmd_OverlayStaticShape;
  recShapeDynamic : TRecCmd_OverlayDynamicShape;

begin
  if CekInput(ovCircle) then
    Exit;

  if IsEditObject then
    begin
      Action := 2;
    if not FindIdSelectedShape then
      Exit;
    end
  else
    Action := 1;

  case StateOverlay of

    {$REGION ' Dynamic Section '}
    osDynamic :
    begin
      recShapeDynamic.IdAction := Action;
      recShapeDynamic.IdSelectShape := NoShapeInList;
      recShapeDynamic.TemplateId := FSelectedOverlay.OverlayIndex;

      recShapeDynamic.ShapeID := ovCircle;
      recShapeDynamic.PostStart.Bearing := StrToFloat(edtCircleBearing.Text);
      recShapeDynamic.PostStart.Range := StrToFloat(edtCircleRange.Text);
      recShapeDynamic.Radius1 := StrToFloat(edtCircleRadiusD.Text);
      recShapeDynamic.Color := pnlOutline.Color;

      if FisNoFill  then
        recShapeDynamic.BrushStyle := bsClear
      else
      begin
        recShapeDynamic.BrushStyle := bsSolid;
        recShapeDynamic.ColorFill := pnlFill.Color;
      end;

      recShapeDynamic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeDynamic.Weight := StrToInt(cbbWeightPen.Text);

      if Action = caEdit then
        recShapeDynamic.idxDraw := simMgrClient.SimOverlayTemplate.idxOverlay
      else
        recShapeDynamic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayDynamicShape(recShapeDynamic);
    end;
    {$ENDREGION}

    {$REGION ' Static Section '}
    osStatic  :
    begin
      recShapeStatic.TemplateId := FSelectedOverlay.OverlayIndex;
      recShapeStatic.ShapeType := ovCircle;
      recShapeStatic.IdSelectShape := NoShapeInList;
      recShapeStatic.IdAction := Action;

      recShapeStatic.PostStart.X := dmsToLong(edtCirclePosLong.Text);
      recShapeStatic.PostStart.Y := dmsToLatt(edtCirclePosLat.Text);
      recShapeStatic.Radius1 := StrToFloat(edtCircleRadius.Text);
      recShapeStatic.color := pnlOutline.Color;

      if FisNoFill  then
        recShapeStatic.BrushStyle := bsClear
      else
      begin
        recShapeStatic.BrushStyle := bsSolid;
        recShapeStatic.ColorFill := pnlFill.Color;
      end;

      recShapeStatic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeStatic.Weight := StrToInt(cbbWeightPen.Text);

//      if Action = caEdit then
//        recShapeStatic.idxDraw := simMgrClient.DrawOverlayTemplate.idxOverlay
//      else
//        recShapeStatic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayStaticShape(recShapeStatic);
    end;
    {$ENDREGION}
  end;
  isInputProblem := False;
end;

procedure TfmOverlayEditor.GbrEllipse;
var
  recShapeStatic : TRecCmd_OverlayStaticShape;
  recShapeDynamic : TRecCmd_OverlayDynamicShape;
begin
  if CekInput(ovEllipse) then
    Exit;

  if IsEditObject then
  begin
    Action := 2;

    if not FindIdSelectedShape then
      Exit;
  end
  else
  Action := 1;

  case StateOverlay of

    {$REGION ' Dynamic Section '}
    osDynamic :
    begin
      recShapeDynamic.IdAction := Action;
      recShapeDynamic.IdSelectShape := NoShapeInList;
      recShapeDynamic.TemplateId := FSelectedOverlay.OverlayIndex;

      recShapeDynamic.ShapeID := ovEllipse;
      recShapeDynamic.PostStart.Bearing := StrToFloat(edtEllipseBearing.Text);
      recShapeDynamic.PostStart.Range := StrToFloat(edtEllipseRange.Text);
      recShapeDynamic.Radius2 := StrToFloat(edtEllipseVerticalD.Text);
      recShapeDynamic.Radius1 := StrToFloat(edtEllipseHorizontalD.Text);
      recShapeDynamic.Color := pnlOutline.Color;

      if FisNoFill  then
        recShapeDynamic.BrushStyle := bsClear
      else
      begin
        recShapeDynamic.BrushStyle := bsSolid;
        recShapeDynamic.ColorFill := pnlFill.Color;
      end;

      recShapeDynamic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeDynamic.Weight := StrToInt(cbbWeightPen.Text);

      if Action = caEdit then
        recShapeDynamic.idxDraw := simMgrClient.SimOverlayTemplate.idxOverlay
      else
        recShapeDynamic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayDynamicShape(recShapeDynamic);
    end;
    {$ENDREGION}

    {$REGION ' Static Section '}
    osStatic  :
    begin
      recShapeStatic.TemplateId := FSelectedOverlay.OverlayIndex;
      recShapeStatic.ShapeType := ovEllipse;
      recShapeStatic.IdSelectShape := NoShapeInList;
      recShapeStatic.IdAction := Action;

      recShapeStatic.PostStart.X := dmsToLong(edtEllipsePosLong.Text);
      recShapeStatic.PostStart.Y := dmsToLatt(edtEllipsePosLat.Text);
      recShapeStatic.Radius1 := StrToFloat(edtHorizontal.Text);
      recShapeStatic.Radius2 := StrToFloat(edtVertical.Text);
      recShapeStatic.color := pnlOutline.Color;

      if FisNoFill  then
        recShapeStatic.BrushStyle := bsClear
      else
      begin
        recShapeStatic.BrushStyle := bsSolid;
        recShapeStatic.ColorFill := pnlFill.Color;
      end;

      recShapeStatic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeStatic.Weight := StrToInt(cbbWeightPen.Text);

//      if Action = caEdit then
//        recShapeStatic.idxDraw := simMgrClient.DrawOverlayTemplate.idxOverlay
//      else
//        recShapeStatic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayStaticShape(recShapeStatic);
    end;
    {$ENDREGION}

  end;
  isInputProblem := False;
end;

procedure TfmOverlayEditor.GbrArc;
var
  recShapeStatic : TRecCmd_OverlayStaticShape;
  recShapeDynamic : TRecCmd_OverlayDynamicShape;
begin
  if CekInput(ovArc) then
    Exit;

  if IsEditObject then
  begin
      Action := 2;
    if not FindIdSelectedShape then
      Exit;
  end
  else
    Action := 1;

  case StateOverlay of

    {$REGION ' Dynamic Section '}
    osDynamic :
    begin
      recShapeDynamic.IdAction := Action;
      recShapeDynamic.IdSelectShape := NoShapeInList;
      recShapeDynamic.TemplateId := FSelectedOverlay.OverlayIndex;

      recShapeDynamic.ShapeID := ovArc;
      recShapeDynamic.PostStart.Bearing := StrToFloat(edtArcBearing.Text);
      recShapeDynamic.PostStart.Range := StrToFloat(edtArcRange.Text);
      recShapeDynamic.Radius1 := StrToFloat(edtArcRadiusD.Text);
      recShapeDynamic.StartAngle := StrToInt(edtArcStartAngleD.Text);
      recShapeDynamic.EndAngle := StrToInt(edtArcEndAngleD.Text);
      recShapeDynamic.Color := pnlOutline.Color;

      recShapeDynamic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeDynamic.Weight := StrToInt(cbbWeightPen.Text);

      if Action = 2 then
        recShapeDynamic.idxDraw := simMgrClient.SimOverlayTemplate.idxOverlay
      else
        recShapeDynamic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayDynamicShape(recShapeDynamic);
    end;
    {$ENDREGION}

    {$REGION ' Static Section '}
    osStatic  :
    begin
      recShapeStatic.TemplateId := FSelectedOverlay.OverlayIndex;
      recShapeStatic.ShapeType := ovArc;
      recShapeStatic.IdSelectShape := NoShapeInList;
      recShapeStatic.IdAction := Action;

      recShapeStatic.PostStart.X := dmsToLong(edtArcPosLong.Text);
      recShapeStatic.PostStart.Y := dmsToLatt(edtArcPosLat.Text);
      recShapeStatic.radius1 := StrToFloat(edtArcRadius.Text);
      recShapeStatic.StartAngle := StrToInt(edtArcStartAngle.Text);
      recShapeStatic.EndAngle := StrToInt(edtArcEndAngle.Text);
      recShapeStatic.color := pnlOutline.Color;

      recShapeStatic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeStatic.Weight := StrToInt(cbbWeightPen.Text);

//      if Action = caEdit then
//        recShapeStatic.idxDraw := simMgrClient.DrawOverlayTemplate.idxOverlay
//      else
//        recShapeStatic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayStaticShape(recShapeStatic);
    end;
    {$ENDREGION}
  end;
  isInputProblem := False;
end;

procedure TfmOverlayEditor.GbrSector;
var
  recShapeStatic : TRecCmd_OverlayStaticShape;
  recShapeDynamic : TRecCmd_OverlayDynamicShape;
begin
  if CekInput(ovSector) then
    Exit;

  if IsEditObject then
  begin
      Action := 2;
    if not FindIdSelectedShape then
      Exit;
  end
  else
    Action := 1;

  case StateOverlay of

    {$REGION ' Dynamic Section '}
    osDynamic :
    begin
      recShapeDynamic.IdAction := Action;
      recShapeDynamic.IdSelectShape := NoShapeInList;
      recShapeDynamic.TemplateId := FSelectedOverlay.OverlayIndex;

      recShapeDynamic.ShapeID := ovSector;
      recShapeDynamic.PostStart.Bearing := StrToFloat(edtSectorBearing.Text);
      recShapeDynamic.PostStart.Range := StrToFloat(edtSectorRange.Text);
      recShapeDynamic.Radius1 := StrToFloat(edtSectorOuterD.Text);
      recShapeDynamic.Radius2 := StrToFloat(edtSectorInnerD.Text);
      recShapeDynamic.StartAngle := StrToInt(edtSectorStartAngleD.Text);
      recShapeDynamic.EndAngle := StrToInt(edtSectorEndAngleD.Text);
      recShapeDynamic.Color := pnlOutline.Color;

      recShapeDynamic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeDynamic.Weight := StrToInt(cbbWeightPen.Text);

      if Action = caEdit then
        recShapeDynamic.idxDraw := simMgrClient.SimOverlayTemplate.idxOverlay
      else
        recShapeDynamic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayDynamicShape(recShapeDynamic);
    end;
    {$ENDREGION}

    {$REGION ' Static Section '}
    osStatic  :
    begin
      recShapeStatic.TemplateId := FSelectedOverlay.OverlayIndex;
      recShapeStatic.ShapeType := ovSector;
      recShapeStatic.IdSelectShape := NoShapeInList;
      recShapeStatic.IdAction := Action;

      recShapeStatic.PostStart.X := dmsToLong(edtSectorPosLong.Text);
      recShapeStatic.PostStart.Y := dmsToLatt(edtSectorPosLat.Text);
      recShapeStatic.Radius1 := StrToFloat(edtSectorOuter.Text);
      recShapeStatic.Radius2 := StrToFloat(edtSectorInner.Text);
      recShapeStatic.StartAngle := StrToInt(edtSectorStartAngle.Text);
      recShapeStatic.EndAngle := StrToInt(edtSectorEndAngle.Text);
      recShapeStatic.color := pnlOutline.Color;

      recShapeStatic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeStatic.Weight := StrToInt(cbbWeightPen.Text);

//      if Action = caEdit then
//        recShapeStatic.idxDraw := simMgrClient.DrawOverlayTemplate.idxOverlay
//      else
//        recShapeStatic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayStaticShape(recShapeStatic);
    end;
    {$ENDREGION}
  end;
  isInputProblem := False;
end;

procedure TfmOverlayEditor.GbrGrid;
var
  recShapeStatic : TRecCmd_OverlayStaticShape;
  recShapeDynamic : TRecCmd_OverlayDynamicShape;
begin
  if CekInput(ovGrid) then
    Exit;

  if IsEditObject then
  begin
     Action := 2;
    if not FindIdSelectedShape then
      Exit;
  end
  else
    Action := 1;

  case StateOverlay of

    {$REGION ' Dynamic Section '}
    osDynamic :
    begin
      recShapeDynamic.IdAction := Action;
      recShapeDynamic.IdSelectShape := NoShapeInList;
      recShapeDynamic.TemplateId := FSelectedOverlay.OverlayIndex;

      recShapeDynamic.ShapeID := ovGrid;
      recShapeDynamic.PostStart.Bearing := StrToFloat(edtTableBearing.Text);
      recShapeDynamic.PostStart.Range := StrToFloat(edtTableRange.Text);
      recShapeDynamic.Radius1 := StrToFloat(edtTableHeightD.Text);
      recShapeDynamic.Radius2 := StrToFloat(edtTableWidthD.Text);
      recShapeDynamic.Kolom := StrToInt(edtTableColumnD.Text);
      recShapeDynamic.Baris := StrToInt(edtTableRowD.Text);
      recShapeDynamic.Rotasi := StrToInt(edtRotationAngleD.Text);
      recShapeDynamic.Color := pnlOutline.Color;

      if FisNoFill  then
        recShapeDynamic.BrushStyle := bsClear
      else
      begin
        recShapeDynamic.BrushStyle := bsSolid;
        recShapeDynamic.ColorFill := pnlFill.Color;
      end;

      recShapeDynamic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeDynamic.Weight := StrToInt(cbbWeightPen.Text);

      if Action = caEdit then
        recShapeDynamic.idxDraw := simMgrClient.SimOverlayTemplate.idxOverlay
      else
        recShapeDynamic.idxDraw := idxDrawOverlay;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayDynamicShape(recShapeDynamic);
    end;
    {$ENDREGION}

    {$REGION ' Static Section '}
    osStatic  :
    begin
      recShapeStatic.TemplateId := FSelectedOverlay.OverlayIndex;
      recShapeStatic.ShapeType := ovGrid;
      recShapeStatic.IdSelectShape := NoShapeInList;
      recShapeStatic.IdAction := Action;

      recShapeStatic.PostStart.X := dmsToLong(edtTablePosLong.Text);
      recShapeStatic.PostStart.Y := dmsToLatt(edtTablePosLat.Text);
      recShapeStatic.Radius1 := StrToFloat(edtTableHeight.Text);
      recShapeStatic.Radius2 := StrToFloat(edtTableWidth.Text);
      recShapeStatic.Kolom := StrToInt(edtTableColumn.Text);
      recShapeStatic.Baris := StrToInt(edtTableRow.Text);
      recShapeStatic.Rotasi := StrToInt(edtTableRotationAngle.Text);
      recShapeStatic.color := pnlOutline.Color;

      if FisNoFill  then
        recShapeStatic.BrushStyle := bsClear
      else
      begin
        recShapeStatic.BrushStyle := bsSolid;
        recShapeStatic.ColorFill := pnlFill.Color;
      end;

      recShapeStatic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeStatic.Weight := StrToInt(cbbWeightPen.Text);

//      if Action = caEdit then
//        recShapeStatic.idxDraw := simMgrClient.DrawOverlayTemplate.idxOverlay
//      else
//        recShapeStatic.idxDraw := idxDrawOverlay;;

      {Kirim data disini}
      simMgrClient.netSend_CmdOverlayStaticShape(recShapeStatic);
    end;
    {$ENDREGION}
  end;
  isInputProblem := False;
end;

procedure TfmOverlayEditor.GbrPolygon;
var
  i : Integer;
  li : TListItem;
  recShapeStatic : TRecCmd_OverlayStaticShape;
  recShapeDynamic : TRecCmd_OverlayDynamicShape;
begin
  if CekInput(ovPolygon) then
    Exit;

  if IsEditObject then
  begin
    Action := 2;
    if not FindIdSelectedShape then
      Exit;
  end
  else
    Action := 1;

  case StateOverlay of
    {$REGION ' Dynamic Section '}
    osDynamic :
    begin
      recShapeDynamic.IdAction := Action;
      recShapeDynamic.IdSelectShape := NoShapeInList;
      recShapeDynamic.TemplateId := FSelectedOverlay.OverlayIndex;

      recShapeDynamic.ShapeID := ovPolygon;
      recShapeDynamic.Color := pnlOutline.Color;

      if FisNoFill  then
        recShapeDynamic.BrushStyle := bsClear
      else
      begin
        recShapeDynamic.BrushStyle := bsSolid;
        recShapeDynamic.ColorFill := pnlFill.Color;
      end;

      recShapeDynamic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeDynamic.Weight := StrToInt(cbbWeightPen.Text);

      if Action = caEdit then
        recShapeDynamic.idxDraw := simMgrClient.SimOverlayTemplate.idxOverlay
      else
        recShapeDynamic.idxDraw := idxDrawOverlay;

      recShapeDynamic.StatePoly := 0;
      for i := 0 to lvPolyVertexD.Items.Count - 1 do
      begin
        li := lvPolyVertexD.Items[i];
        recShapeDynamic.PostStart.Range := StrToFloat(li.SubItems[0]);
        recShapeDynamic.PostStart.Bearing := StrToFloat(li.SubItems[1]);

        {Kirim data disini}
        simMgrClient.netSend_CmdOverlayDynamicShape(recShapeDynamic);

        if (i+1) = lvPolyVertexD.Items.Count - 1 then
          recShapeDynamic.StatePoly := 1;
      end;

    end;
    {$ENDREGION}

    {$REGION ' Static Section '}
    osStatic  :
    begin
      recShapeStatic.TemplateId := FSelectedOverlay.OverlayIndex;
      recShapeStatic.ShapeType := ovPolygon;
      recShapeStatic.IdSelectShape := NoShapeInList;
      recShapeStatic.IdAction := Action;

      recShapeStatic.color := pnlOutline.Color;

      if FisNoFill  then
      begin
        recShapeStatic.BrushStyle := bsClear;
      end
      else
      begin
        recShapeStatic.BrushStyle := bsSolid;
        recShapeStatic.ColorFill := pnlFill.Color;
      end;

      recShapeStatic.LineType :=  TPenStyle(cbbDashesPen.ItemIndex);
      recShapeStatic.Weight := StrToInt(cbbWeightPen.Text);

//      if Action = caEdit then
//        recShapeStatic.idxDraw := simMgrClient.DrawOverlayTemplate.idxOverlay
//      else
//        recShapeStatic.idxDraw := idxDrawOverlay;

      for i := 0 to 12 do
      begin
        li := lvPolyVertex.Items[i];

        recShapeStatic.PolyPoint[i].X := 0;
        recShapeStatic.PolyPoint[i].Y := 0;
      end;

      for i := 0 to lvPolyVertex.Items.Count - 1 do
      begin
        li := lvPolyVertex.Items[i];

        recShapeStatic.PolyPoint[i].X := dmsToLong(li.SubItems[0]);
        recShapeStatic.PolyPoint[i].Y := dmsToLatt(li.SubItems[1]);
      end;

      simMgrClient.netSend_CmdOverlayStaticShape(recShapeStatic);

      SpeedButton10.Down := False;
    end;
    {$ENDREGION}
  end;
  isInputProblem := False;
end;

procedure TfmOverlayEditor.GbrFlagPoint(mx, my :Double);
var
  ObjectFlagPoint : TFlagPoint;
begin
  ObjectFlagPoint := TFlagPoint.Create(simMgrClient.Converter);
  ObjectFlagPoint.Post.X := mx;
  ObjectFlagPoint.Post.Y := my;
  simMgrClient.DrawFlagPoint.FList.Add(ObjectFlagPoint);
end;

//procedure TfmOverlayEditor.EditViewOverlay(isBringtoFront: Boolean);
//begin
//  if isBringtoFront then
//    simMgrClient.DrawOverlayTemplate.BringToFront
//  else
//    simMgrClient.DrawOverlayTemplate.SendToBack
//end;


end.


