unit uReferencePointEditor;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, uMapXHandler, uCoordConvertor, {TeCanvas,} ColorGrd, RzButton, Math, uDBEditSetting, uBaseCoordSystem,
  uDBAsset_Sensor, tttData, uDBPattern, uObjectVisuals,
  uDBAsset_GameEnvironment, uSimVisuals, uDBAsset_Reference_Point,
  System.ImageList;

type
  TfReferencePointEditor = class(TForm)
    pnlTestArea: TPanel;
    ToolBar1: TToolBar;
    ToolButton9: TToolButton;
    toolbtnDecreaseScale: TToolButton;
    cbSetScale: TComboBox;
    toolbtnIncreaseScale: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ImageList1: TImageList;
    grpCursorPosition: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    lbBearingFOrigin: TLabel;
    lbDistanceFOrigin: TLabel;
    lGridLat: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lGridLong: TLabel;
    btnCancel: TButton;
    Button4: TButton;
    Shape1: TShape;
    grpSelectedPoint: TGroupBox;
    ToolButton10: TToolButton;
    btOk: TButton;
    lbcenterx: TLabel;
    lbcentery: TLabel;
    lb4: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    cbbName: TComboBox;
    cbbType: TComboBox;
    btn2: TToolButton;
    btn3: TToolButton;
    edtPositionLat: TEdit;
    Map1: TMap;
    lb14: TLabel;
    lbPositionLat: TLabel;
    lbPositionLong: TLabel;
    edtPositionLong: TEdit;
    btnPosition: TSpeedButton;
    lbl3: TLabel;
    edtGridLat: TEdit;
    edtGridLong: TEdit;
    lblDomain: TLabel;
    cbbDomain: TComboBox;
    lblIdentity: TLabel;
    cbbIdentity: TComboBox;
    lblDisplay: TLabel;
    lblCourse: TLabel;
    edtCourse: TEdit;
    lblGroundSpeed: TLabel;
    edtGroundSpeed: TEdit;
    lbCourse: TLabel;
    lbGroundSpeed: TLabel;
    imgDisplay: TImage;
    il1: TImageList;
    lblBearing: TLabel;
    lbBearing: TLabel;
    edtBearing: TEdit;
    btnApply: TButton;
    btnRemove: TButton;
    procedure FormShow(Sender: TObject);
    procedure LoadENC(ENCGeoset : string);
    procedure btOkClick(Sender: TObject);
    procedure Map1DrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Cardinal; const RectFull,
      RectInvalid: IDispatch);
    procedure FormCreate(Sender: TObject);
    procedure Map1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Map1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure cbSetScaleChange(Sender: TObject);
    procedure Map1MapViewChanged(Sender: TObject);
    procedure toolbtnIncreaseScaleClick(Sender: TObject);
    procedure toolbtnDecreaseScaleClick(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Map1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure cbbNameClick(Sender: TObject);
    procedure cbbTypeChange(Sender: TObject);
    procedure cbbTypeBehav;
    procedure FormField(state: boolean);
    procedure cbbIdentityChange(Sender: TObject);
    procedure cbbDomainChange(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnPositionClick(Sender: TObject);
    procedure Map1Click(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure getSymbol(track_type, symbol_type: Integer; var Name: String; var Color: TColor); 
    procedure getDomain_Identity(symbol_type: Integer; var dom,ident: Integer);
    function getName(tipe, domain, identity: Integer): String;
    function getColor(tipe, domain, identity: Integer): TColor;
    procedure DisplaySymbol(name: String; color: TColor);
    procedure DrawSymbol(s_name: String; s_color: TColor; rec: TReference_Point);
    procedure DrawLine(s_color: TColor; rec: TReference_Point);
    function CheckSymbol(const px, py: double; const maxDist: integer): TReference_Point;
    function isPointOnLine(X,Y : double; line: TLineVisual): boolean;
    procedure btnCancelClick(Sender: TObject);
    procedure getData(var rec: TRecReference_Point);
    procedure edtBearingExit(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  Const
    //r        = 200;
  private
    patternIndex        : Integer;
    FCoordPlatformConv  : TCoordConverter;
  public
    { Public declarations }

    add, arrow, position           : Boolean;
    isCapturingScreen, MouseIsDown : Boolean;
    wCross, hCross                 : Integer;
    radius, r, index               : Integer;
    oriLong, oriLat                : Double;
    FLyrDraw                       : CMapXLayer;
    FCanvas                        : TCanvas;
    centX, centY                   : Integer;
    mapX, mapY                     : Double;

    fName            : String;
    myFile           : TextFile;

    rList,rpList    : TList;
    xx,yy           : Double;
    force,ra_id     : Integer;
    rec_count       : Integer;
    cursorLong, cursorLat: double;

    changed        : boolean;

    game_area : TGame_Environment_Definition;

    procedure ScreenShot(DestBitmap : TBitmap) ;
    procedure getCursorPosition(X,Y : Single);
    procedure getGridPosition(X,Y : Single; var gridLat,gridLong: String);
    procedure LoadMap(aGeoset : String);
    procedure getNameList;
    procedure refreshNameList;

    function getCenterX(fMap : TMap): Double;
    function getCenterY(fMap : TMap): Double;

  end;

var
   fReferencePointEditor : TfReferencePointEditor;
   b, TmpBmp        : TBitmap;

implementation
{$R *.dfm}

uses uScrCapture, ufCaptureRes, uT3Common,
  uDataModuleTTT, uReferencePointNew, StrUtils, uDataTypes;

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure TfReferencePointEditor.getCursorPosition(X,Y : Single);
var
    gridLat, gridLong : string;
begin
  getGridPosition(X,Y,gridLat,gridLong);

  lbBearingFOrigin.Caption  := FormatFloat('0.00', CalcBearing(Map1.CenterX, MAp1.CenterY, cursorLong, cursorLat));
  lbDistanceFOrigin.Caption := FormatFloat('0.00', FCoordPlatformConv.Distance_nmi(Map1.CenterX, MAp1.CenterY, cursorLong, cursorLat));

  lbPositionLat.Caption := formatDM_latitude(yy);
  lbPositionLong.Caption := formatDM_longitude(xx);

  lGridLat.Caption  := gridLat;
  lGridLong.Caption := gridLong;
end;

procedure TfReferencePointEditor.getGridPosition(X,Y : Single; var gridLat,gridLong: String);
var
    diffXnm, diffYnm, centerLong, centerLat  : double;
    addStringX, addStringY : string;
    oriX, oriY : single;
begin
  oriX := centX;                 // convert to single //
  oriY := centY;

  Map1.ConvertCoord(X, Y,  cursorLong, cursorLat, miScreenToMap);
  Map1.Convertcoord(oriX, oriY, centerLong, centerLat, miScreenToMap);

  diffYnm := (abs(cursorLat  - centerLat))  * 60;
  diffXnm := (abs(cursorLong - centerLong)) * 60;

  if Y < centY then addStringY := 'S'
  else addStringY := 'N';

  if X < centX then addStringX := 'W'
  else addStringX := 'E';

  gridLat  := FormatFloat('0.00', diffYnm) + ' nm ' + addStringY;
  gridLong := FormatFloat('0.00', diffXnm) + ' nm ' + addStringX;
end;

procedure TfReferencePointEditor.btnCancelClick(Sender: TObject);
var warning : Integer;
begin
  if changed then
  begin
    warning := MessageDlg('You have changes that have not been applied.'+#13+
                'Do you want to discard these?',mtWarning,[mbYes,mbNo],0);
    if warning = mrYes then
    begin
      try
        Self.Close;
      finally
//        free;
      end;
    end;
  end
  else Close;
end;

procedure TfReferencePointEditor.btn2Click(Sender: TObject);
begin
  if cbbName.ItemIndex <> 0 then
  begin
    cbbName.ItemIndex := cbbName.ItemIndex - 1;
    cbbNameClick(Sender);
  end;
end;

procedure TfReferencePointEditor.btn3Click(Sender: TObject);
begin
  if cbbName.ItemIndex <> rpList.Count then
  begin
    cbbName.ItemIndex := cbbName.ItemIndex + 1;
    cbbNameClick(Sender);
  end;
end;

procedure TfReferencePointEditor.btnApplyClick(Sender: TObject);
var ref_point: TRecReference_Point;
  I: Integer;
begin
  dmTTT.DeleteReference_Point(ra_id, force);
  for I := 0 to rpList.Count - 1 do begin
    with TReference_Point(rpList[I]) do begin
      ref_point.Resource_Alloc_Index   := FData.Resource_Alloc_Index;
      ref_point.Reference_Identifier   := FData.Reference_Identifier;
      ref_point.Force_Designation      := FData.Force_Designation;
      ref_point.Track_Type  := FData.Track_Type;
      ref_point.Symbol_Type := FData.Symbol_Type;
      ref_point.Course      := FData.Course;
      ref_point.Speed       := FData.Speed;
      ref_point.X_Position  := 0;
      ref_point.Y_Position  := 0;
      ref_point.Longitude   := FData.Longitude;
      ref_point.Latitude    := FData.Latitude;
      ref_point.Track_Bearing := FData.Track_Bearing;
      ref_point.AOP_Start_Time_Offset := FData.AOP_Start_Time_Offset;
    end;
//    if I < rec_count then
//    begin
//      ref_point.Reference_Index := TReference_Point(rpList[I]).FData.Reference_Index;
//      dmTTT.updateReference(ref_point,IntToStr(ref_point.Reference_Index));
//    end
//    else
    dmTTT.insertReference(ref_point);
  end;
end;

procedure TfReferencePointEditor.btnPositionClick(Sender: TObject);
begin
  position  := true;
  Map1.MousePointer := miCrossCursor;
end;

procedure TfReferencePointEditor.btnRemoveClick(Sender: TObject);
begin
  rpList.Delete(cbbName.ItemIndex-1);
  refreshNameList;
end;

procedure TfReferencePointEditor.btOkClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TfReferencePointEditor.ScreenShot(DestBitmap : TBitmap) ;
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

procedure TfReferencePointEditor.Button4Click(Sender: TObject);
begin
 b := TBitmap.Create;
 ScreenShot(b) ;
 isCapturingScreen := true;
 fScrCapture.Image1.Picture.Assign(b);
 Map1.MousePointer := miCrossCursor;
end;

procedure TfReferencePointEditor.cbbDomainChange(Sender: TObject);
begin
  if cbbIdentity.ItemIndex = -1 then cbbIdentity.ItemIndex := 0;
  cbbIdentityChange(Sender);
end;

procedure TfReferencePointEditor.cbbIdentityChange(Sender: TObject);
var
  bmp_name   : string;
  bmp_color  : TColor;
begin
  bmp_name  := getName(cbbType.ItemIndex, cbbDomain.ItemIndex, cbbIdentity.ItemIndex);
  bmp_color := getColor(cbbType.ItemIndex, cbbDomain.ItemIndex, cbbIdentity.ItemIndex);
  DisplaySymbol(bmp_name, bmp_color);
  if (cbbName.ItemIndex <> -1) and (cbbName.ItemIndex <> 0) and (cbbName.Text <> '') then
  begin
    if TReference_Point(rpList[cbbName.ItemIndex-1]).FData.Latitude <> 0 then
    begin
      with TReference_Point(rpList[cbbName.ItemIndex-1]) do begin
        Symbol_Name  := bmp_name;
        Symbol_Color := bmp_color;

        getData(FData);

        if cbbType.ItemIndex <> 0 then
          DrawSymbol(Symbol_Name, Symbol_Color, TReference_Point(rpList[cbbName.ItemIndex-1]))
        else DrawLine(Symbol_Color, TReference_Point(rpList[cbbName.ItemIndex-1]));
      end;
      changed := true;
      Map1.Repaint;
    end;
  end;
end;

procedure TfReferencePointEditor.DisplaySymbol(name: String; color: TColor);
var
  s   : String;
  bmp : TBitmapSymbol;
begin
  if imgDisplay.Visible then
  begin
    bmp := TBitmapSymbol.Create;
    s := ExtractFilePath(ParamStr(0));
    imgDisplay.Canvas.Brush.Color := clMedGray;
    imgDisplay.Canvas.Rectangle(0,0,imgDisplay.width-1,imgDisplay.height-1);
    bmp.Center.X := (imgDisplay.Width div 2) - 2;
    bmp.Center.Y := (imgDisplay.Height div 2) - 2;
    bmp.LoadBitmap(s + '\data\Bitmap\' + name, color);
    bmp.Draw(imgDisplay.Canvas);
  end;
end;

function TfReferencePointEditor.getName(tipe, domain, identity: Integer): String;
var bmp_name: String;
    domain_name: Integer;
begin
  domain_name := 0;
  case tipe of
    1:
      begin
        case identity of
          0: bmp_name := pctGeneral;
          1: bmp_name := pctBuoy;
          2: bmp_name := pctDataLinkReferencePoint;
          3: bmp_name := pctDistressedVessel;
          4: bmp_name := pctEsmEcmFix;
          5: bmp_name := pctGroundZero;
          6: bmp_name := pctManInWater;
          7: bmp_name := pctMaritimeHeadquarters;
          8: bmp_name := pctMineHazard;
          9: bmp_name := pctNavigationalHazard;
          10: bmp_name := pctOilRig;
          11: bmp_name := pctStation;
          12: bmp_name := pctTacticalGridorigin;
          13: bmp_name := pctAirGeneral;
          14: bmp_name := pctAirborneEarlyWarning;
          15: bmp_name := pctBullseye;
          16: bmp_name := pctCombatAirPatrol;
          17: bmp_name := pctDitchedAirCraft;
          18: bmp_name := pctGate;
          19: bmp_name := pctAswGeneral;
          20: bmp_name := pctBriefContact;
          21: bmp_name := pctDatum;
          22: bmp_name := pctKingpin;
          23: bmp_name := pctRiser;
          24: bmp_name := pctSearchCentre;
          25: bmp_name := pctSinker;
          26: bmp_name := pctWeaponEntryPoint;
          27: bmp_name := pctWreck;
        end;
        bmp_name  := bmp_name + '.bmp';
      end;
    2,3:
      begin
        case domain of
          0: domain_name  := vhdSurface;
          1: domain_name  := vhdSubsurface;
          2: domain_name  := vhdAir;
          3: domain_name  := vhdLand;
        end;
        case identity of
          0: bmp_name  := getDetectedSymbolFileName(domain_name, piFriend);
          1: bmp_name  := getDetectedSymbolFileName(domain_name, piAssumedFriend);
          2: bmp_name  := getDetectedSymbolFileName(domain_name, piHostile);
          3: bmp_name  := getDetectedSymbolFileName(domain_name, piSuspect);
          4: bmp_name  := getDetectedSymbolFileName(domain_name, piNeutral);
          5: bmp_name  := getDetectedSymbolFileName(domain_name, piUnknown);
          6: bmp_name  := getDetectedSymbolFileName(domain_name, piPending);
        end;
      end;
  end;
  Result  := bmp_name;
end;

function TfReferencePointEditor.getColor(tipe, domain, identity: Integer): TColor;
begin
  Result := 0;
  case tipe of
    1:
      case identity of
        0,4,11,13,14,15,16,18,19,20: Result  := clWebFloralWhite;
        1,2,7,10,12,21,22,24,26,27:  Result  := clBlack;
        3,6,17,23,25:                Result  := clYellow;
        5,8,9:                       Result  := clMaroon;
      end;
    0,2,3:
      case identity of
        0: Result := getColorFromIdentity(piFriend);
        1: Result := getColorFromIdentity(piAssumedFriend);
        2: Result := getColorFromIdentity(piHostile);
        3: Result := getColorFromIdentity(piSuspect);
        4: Result := getColorFromIdentity(piNeutral);
        5: Result := getColorFromIdentity(piUnknown);
        6: Result := getColorFromIdentity(piPending);
      end;
  end;
end;

procedure TfReferencePointEditor.cbbNameClick(Sender: TObject);   // bebe
var select_rpoint: TRecReference_Point;
    sel_dom,sel_ident: Integer;
    X,Y : Integer;
    gridLat,gridLong  : String;
    I: Integer;
begin
  if (cbbName.ItemIndex = 0) then
  begin
    fReferencePointNew.isNew  := true;
    fReferencePointNew.ShowModal;
  end
  else if (cbbName.ItemIndex > 0) then begin
    select_rpoint := TReference_Point(rpList[cbbName.ItemIndex-1]).FData;
    for I := 0 to rpList.Count - 1 do
      TReference_Point(rpList[I]).IsSelected := false;
    TReference_Point(rpList[cbbName.ItemIndex-1]).IsSelected := true;
    cbbType.ItemIndex := select_rpoint.Track_Type;
    cbbTypeBehav;
    edtPositionLat.Text := formatDM_latitude(select_rpoint.Latitude);
    edtPositionLong.Text:= formatDM_longitude(select_rpoint.Longitude);

    FCoordPlatformConv.ConvertToScreen(select_rpoint.Longitude,select_rpoint.Latitude,X,Y);
    getGridPosition(X,Y,gridLat,gridLong);
    edtGridLat.Text   := gridLat;
    edtGridLong.Text  := gridLong;

    DisplaySymbol(TReference_Point(rpList[cbbName.ItemIndex-1]).Symbol_Name, 
              TReference_Point(rpList[cbbName.ItemIndex-1]).Symbol_Color);
                                                                
    case select_rpoint.Track_Type of
      0: edtBearing.Text := FormatFloat('0',select_rpoint.Track_Bearing);
      2:
        begin
          edtCourse.Text := FormatFloat('0',select_rpoint.Course);
          edtGroundSpeed.Text := FormatFloat('0.0',select_rpoint.Speed);
        end;
      3:
        begin
          edtCourse.Text := FormatDateTime('hh:nn:ss',IntToDateTime(select_rpoint.AOP_Start_Time_Offset));
          edtGroundSpeed.Text := FormatFloat('0.0',select_rpoint.Speed);
        end;
    end;

    if (select_rpoint.Track_Type <> 1) then
      getDomain_Identity(select_rpoint.Symbol_Type, sel_dom, sel_ident)
    else sel_ident  := select_rpoint.Symbol_Type;

    cbbDomain.ItemIndex   := sel_dom;
    cbbIdentity.ItemIndex := sel_ident;
    Map1.Repaint;
  end;
end;

procedure TfReferencePointEditor.cbbTypeChange(Sender: TObject);    // bebe
begin
  if cbbName.Text = '' then
  begin
    cbbTypeBehav;
    cbbIdentityChange(Sender);
  end
  else if cbbName.ItemIndex <> 0 then
  begin
    if cbbType.ItemIndex = TReference_Point(rpList[cbbName.ItemIndex-1]).FData.Track_Type then
      cbbNameClick(Sender)
    else begin
      cbbTypeBehav;
      cbbIdentityChange(Sender);
    end;
  end;
end;

procedure TfReferencePointEditor.cbbTypeBehav;    // bebe
begin
  cbbIdentity.Clear;
  cbbIdentity.Items.Add('Friendly');
  cbbIdentity.Items.Add('Assumed friendly');
  cbbIdentity.Items.Add('Hostile');
  cbbIdentity.Items.Add('Suspect');
  cbbIdentity.Items.Add('Neutral');
  cbbIdentity.Items.Add('Unknown');
  cbbIdentity.Items.Add('Pending');
  case cbbType.ItemIndex of
    0: // bearing
      begin
        FormField(true);
      end;
    1: // static
      begin
        lblIdentity.Caption  := 'Symbol:';
        cbbIdentity.Clear;
        cbbIdentity.Items.Add('General');
        cbbIdentity.Items.Add('Buoy');
        cbbIdentity.Items.Add('DLRP');
        cbbIdentity.Items.Add('Distressed vessel');
        cbbIdentity.Items.Add('ESM/ECM fix');
        cbbIdentity.Items.Add('Ground zero');
        cbbIdentity.Items.Add('Man in water');
        cbbIdentity.Items.Add('Maritime headquarters');
        cbbIdentity.Items.Add('Mine hazard');
        cbbIdentity.Items.Add('Navigational hazard');
        cbbIdentity.Items.Add('Oil rig');
        cbbIdentity.Items.Add('Station');
        cbbIdentity.Items.Add('Tactical grid origin');
        cbbIdentity.Items.Add('Air general');
        cbbIdentity.Items.Add('Airbone early warning');
        cbbIdentity.Items.Add('Bullseye');
        cbbIdentity.Items.Add('Combat air patrol');
        cbbIdentity.Items.Add('Ditched aircraft');
        cbbIdentity.Items.Add('Gate');
        cbbIdentity.Items.Add('ASW general');
        cbbIdentity.Items.Add('Brief contact');
        cbbIdentity.Items.Add('Datum');
        cbbIdentity.Items.Add('Kingpin');
        cbbIdentity.Items.Add('Riser');
        cbbIdentity.Items.Add('Search centre');
        cbbIdentity.Items.Add('Sinker');
        cbbIdentity.Items.Add('Weapon entry');
        cbbIdentity.Items.Add('Wreck');
        FormField(true);
      end;
    2: // point
      begin
        lblIdentity.Caption  := 'Identity:';
        lblCourse.Caption    := 'Course:';
        lbCourse.Caption     := 'degrees T';
        FormField(true);
      end;
    3: // AOP
      begin
        lblIdentity.Caption  := 'Identity:';
        lblCourse.Caption    := 'AOP Start Time Offset:';
        lbCourse.Caption     := 'hh:mm:ss';
        FormField(true);
      end;
  end;
  cbbDomain.ItemIndex    := 0;
  cbbIdentity.ItemIndex  := 0;
end;

procedure TfReferencePointEditor.FormField(state: boolean);        // bebe
begin
  case cbbType.ItemIndex of
    0: // bearing
      begin
        lblDomain.Visible     := state;       cbbDomain.Visible     := state;
        lblIdentity.Visible   := state;       cbbIdentity.Visible   := state;
        lblDisplay.Visible    := not state;   imgDisplay.Visible    := not state;
        lblCourse.Visible     := not state;   edtCourse.Visible     := not state;   lbCourse.Visible     := not state;
        lblGroundSpeed.Visible:= not state;   edtGroundSpeed.Visible:= not state;   lbGroundSpeed.Visible:= not state;
        lblBearing.Visible    := state;       edtBearing.Visible    := state;       lbBearing.Visible    := state;
        edtBearing.Text       := '0';
      end;
    1: // static
      begin
        lblDomain.Visible     := not state;   cbbDomain.Visible     := not state;
        lblIdentity.Visible   := state;       cbbIdentity.Visible   := state;
        lblDisplay.Visible    := state;       imgDisplay.Visible    := state;
        lblCourse.Visible     := not state;   edtCourse.Visible     := not state;   lbCourse.Visible     := not state;
        lblGroundSpeed.Visible:= not state;   edtGroundSpeed.Visible:= not state;   lbGroundSpeed.Visible:= not state;
        lblBearing.Visible    := not state;   edtBearing.Visible    := not state;   lbBearing.Visible    := not state;
      end;
    2,3: // point, AOP
      begin
        lblDomain.Visible     := state;       cbbDomain.Visible     := state;
        lblIdentity.Visible   := state;       cbbIdentity.Visible   := state;
        lblDisplay.Visible    := state;       imgDisplay.Visible    := state;
        lblCourse.Visible     := state;       edtCourse.Visible     := state;       lbCourse.Visible     := state;
        lblGroundSpeed.Visible:= state;       edtGroundSpeed.Visible:= state;       lbGroundSpeed.Visible:= state;
        lblBearing.Visible    := not state;   edtBearing.Visible    := not state;   lbBearing.Visible    := not state;
        if cbbType.ItemIndex = 2 then edtCourse.Text  := '0';
        if cbbType.ItemIndex = 3 then edtCourse.Text  := '00:00:00';
        edtGroundSpeed.Text := '0.0';
      end;
  end;
end;

procedure TfReferencePointEditor.cbSetScaleChange(Sender: TObject);
var z : Double;
    s : string;
begin
  Map1.OnMapViewChanged := nil;
  if cbSetScale.ItemIndex < 0  then Exit;

  if (cbSetScale.ItemIndex <= 500) then
  begin
   s := cbSetScale.Items[cbSetScale.ItemIndex];
   try
     z := StrToFloat(s);
     map1.ZoomTo(z, Map1.CenterX, Map1.CenterY);
   finally

   end;
  end
  else cbSetScale.ItemIndex := cbSetScale.ItemIndex -1 ;
  Map1.OnMapViewChanged := Map1MapViewChanged;
end;

procedure TfReferencePointEditor.LoadMap(aGeoset: String);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if Map1 = nil then
    Exit;
  InitOleVariant(z);
  Map1.Layers.RemoveAll;

  Map1.Geoset := aGeoset;

  if aGeoset <> '' then
  begin
    for i := 1 to Map1.Layers.Count do
    begin
      Map1.Layers.Item(i).Selectable := false;
      Map1.Layers.Item(i).Editable  := False;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := Map1.Layers.Add(mInfo, 1);

    Map1.Layers.AnimationLayer := FLyrDraw;
    Map1.MapUnit := miUnitNauticalMile;
  end;
  //FMap.BackColor := RGB(192, 224, 255);
  Map1.BackColor := RGB(0, 0, 0);
end;

procedure TfReferencePointEditor.toolbtnDecreaseScaleClick(Sender: TObject);
begin
  if  cbSetScale.ItemIndex >  0 then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex  - 1;
    toolbtnIncreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if cbsetscale.ItemIndex = 0 then
   toolbtnDecreaseScale.Enabled := false
  else
   toolbtnDecreaseScale.Enabled := true;
end;

procedure TfReferencePointEditor.toolbtnIncreaseScaleClick(Sender: TObject);
begin
  if  (cbSetScale.ItemIndex <= 500) then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex + 1;
    toolbtnDecreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if (cbSetScale.ItemIndex = 0) then //sampai batas akhir
   toolbtnIncreaseScale.Enabled := true
  else
    toolbtnIncreaseScale.Enabled := true;
end;

procedure TfReferencePointEditor.Map1Click(Sender: TObject);
begin
  if position then
  begin
    if cbbName.Text <> '' then
    begin
      edtPositionLat.Text   := lbPositionLat.Caption;
      edtPositionLong.Text  := lbPositionLong.Caption;
      edtGridLat.Text       := lGridLat.Caption;
      edtGridLong.Text      := lGridLong.Caption;
      position              := false;

      TReference_Point(rpList[cbbName.ItemIndex-1]).FData.Longitude := dmToLongitude(edtPositionLong.Text);
      TReference_Point(rpList[cbbName.ItemIndex-1]).FData.Latitude  := dmToLatitude(edtPositionLat.Text);
      changed := true;
      fReferencePointNew.new_ref  := cbbName.Text;

      getData(TReference_Point(rpList[cbbName.ItemIndex-1]).FData);

      refreshNameList;

      Map1.MousePointer := miDefaultCursor;

      Map1.Repaint;
    end;
  end;
end;

procedure TfReferencePointEditor.getData(var rec: TRecReference_Point);
begin
  with rec do begin
    Reference_Identifier  := cbbName.Text;
    Track_Type            := cbbType.ItemIndex;
    if Track_Type <> 1 then
      Symbol_Type := StrToInt(IntToStr(cbbDomain.ItemIndex)+IntToStr(cbbIdentity.ItemIndex))
    else
      Symbol_Type := cbbIdentity.ItemIndex;
    if Track_Type = 2 then
      Course := StrToFloat(edtCourse.Text);
    if (Track_Type = 2) or (Track_Type = 3) then
      Speed  := StrToFloat(edtGroundSpeed.Text);
    if Track_Type = 0 then
      Track_Bearing   := StrToFloat(edtBearing.Text);
    if Track_Type = 3 then
      AOP_Start_Time_Offset := DateTimeToInt(StrToDateTime(edtCourse.Text));
  end;
end;

procedure TfReferencePointEditor.Map1DrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Cardinal; const RectFull,
  RectInvalid: IDispatch);
var
  I: Integer;
  ref_point : TReference_Point;
  draw: TDrawElement;
  w,h : Integer;
begin
  if not Assigned(FCanvas) then
    Exit;
  FCanvas.Handle      := hOutputDC;
  FCanvas.Brush.Style := bsSolid;
  FCanvas.Pen.Width   := 2;

  for I := 0 to rpList.Count - 1 do begin
    ref_point := rpList.Items[i];
    draw  := ref_point.Drawing;
    FCoordPlatformConv.ConvertToScreen(ref_point.FData.Longitude, ref_point.FData.Latitude,
        draw.Center.X, draw.Center.Y);

    if Assigned(draw) then
    begin
      if draw.Visible then
      begin
        if draw is TLineVisual then
        begin
          TLineVisual(draw).ConvertCoord(FCoordPlatformConv);
          TLineVisual(draw).LineStyles := psDash;
        end;

        if ref_point.IsSelected then
        begin
          if draw is TLineVisual then
          begin
            TLineVisual(draw).Color := clYellow;
            TLineVisual(draw).LineStyles := psDash;
          end
          else begin
            FCanvas.Pen.Color := clYellow;
            FCanvas.Pen.Style := psSolid;
            FCanvas.Brush.Style := bsClear;
            w := TBitmapSymbol(draw).BitmapWidth div 2 + 5;
            h := TBitmapSymbol(draw).BitmapHeigth div 2 + 5;
            FCanvas.Rectangle(draw.Center.X - w,draw.Center.Y - h,draw.Center.X + w,draw.Center.Y + h );
          end;
        end
        else if draw is TLineVisual then
        begin
          TLineVisual(draw).Color := ref_point.Symbol_Color;
        end;


        draw.Draw(FCanvas);
      end;
    end;
  end;


end;

procedure TfReferencePointEditor.DrawSymbol(s_name: String; s_color: TColor; rec: TReference_Point);
var
  s   : String;
begin
  rec.Drawing := TBitmapSymbol.Create;
  s   := ExtractFilePath(ParamStr(0));
  with TBitmapSymbol(rec.Drawing) do begin
    LoadBitmap(s + '\data\Bitmap\' + s_name, s_color);
    Visible  := true;
  end;
end;

procedure TfReferencePointEditor.edtBearingExit(Sender: TObject);
begin
  if (cbbName.ItemIndex-1 <> -1) then
  begin
    getData(TReference_Point(rpList[cbbName.ItemIndex-1]).FData);
    changed := true;
  end;
end;

procedure TfReferencePointEditor.DrawLine(s_color: TColor; rec: TReference_Point);
begin
  rec.Drawing  := TLineVisual.Create;
  with TLineVisual(rec.Drawing) do begin
    X1  := rec.FData.Longitude;
    Y1  := rec.FData.Latitude;
    Range   := 100;
    Bearing := rec.FData.Track_Bearing;
    LineStyles := psDash;
//    Color   := s_color;
    IsOnce  := false;
    Visible := true;
  end;
end;

function TfReferencePointEditor.isPointOnLine(X,Y : double; line: TLineVisual): boolean;
var sX,sY : integer;
  pt1,pt2,pt3 : T2dPoint;
  dist : double;
begin
  FCoordPlatformConv.ConvertToScreen(X,Y,sx,sy);

  result := false;

  pt1.X := line.sx1;
  pt1.Y := line.sy1;
  pt2.X := line.sx2;
  pt2.Y := line.sy2;
  pt3.X := sx;
  pt3.Y := sy;

  dist := ptToLineDistance(pt1,pt2,pt3);

  if dist < 3 then begin
//    once := false;
    result := true;
  end;

end;

function TfReferencePointEditor.CheckSymbol(const px, py: double;
  const maxDist: integer): TReference_Point;
var i: Integer;
    pi : TReference_Point;
    rr : Integer;
    m, r: double;
    ctx, cty: integer;
    ptx, pty: integer;
    found : boolean;
begin
  I := 0;

  FCoordPlatformConv.ConvertToScreen(px, py, ctx, cty);
  m := 1000000.0;
  result := nil;
  found := false;

  for i := 0 to rpList.Count - 1 do begin

    pi := rpList.Items[i];
    pi.IsSelected := false;
    if pi.Drawing is TLineVisual then
    begin
      if isPointOnLine(px,py,pi.Drawing as TLineVisual) then
      begin
        result := pi;
        found := true;
        pi.IsSelected := true;
        cbbName.ItemIndex := i+1;
      end;
    end
    else if pi.Drawing is TBitmapSymbol then
    begin
      FCoordPlatformConv.ConvertToScreen(pi.FData.Longitude, pi.FData.Latitude, ptx, pty);

      try
        rr := sqr(ptX - ctx) + sqr(ptY - ctY);
        if  rr = 0 then
          r := 10000
        else
           r := Sqrt(rr);
      except
      r := 10000;
      end;

      if (r < m) and (r < maxDist) then begin
        m := r;
        result := pi;
        found := true;
        pi.IsSelected := true;
        cbbName.ItemIndex := i+1;
      end
    end;
  end;
  if cbbName.ItemIndex = 0 then cbbName.ItemIndex := -1;
end;

procedure TfReferencePointEditor.Map1MapViewChanged(Sender: TObject);
var
      tempZoom : double;
begin
  tempZoom := 0;
  if Map1.CurrentTool = miZoomInTool then
  begin
     if Map1.Zoom <= 0.125 then tempZoom := 0.125;
     if (Map1.Zoom > 0.125) AND (Map1.Zoom < 1) then tempZoom := Map1.Zoom;
     if (Map1.Zoom >= 1) AND (Map1.Zoom <= 2500) then tempZoom := round(Map1.Zoom);
     if Map1.Zoom > 2500 then tempZoom := 2500;

     Map1.OnMapViewChanged := nil;
     Map1.ZoomTo(tempZoom, Map1.CenterX, Map1.CenterY);

     if (Map1.Zoom > 0.125) AND (Map1.Zoom < 0.25) then
     begin
           cbSetScale.Text := FormatFloat('0.000', tempZoom);
     end
     else if (Map1.Zoom >= 0.25) AND (Map1.Zoom < 0.5) then
     begin
           cbSetScale.Text := FormatFloat('0.00', tempZoom);
     end
     else if (Map1.Zoom >= 0.5) AND (Map1.Zoom < 1) then
     begin
           cbSetScale.Text := FormatFloat('0.0', tempZoom);
     end
     else
           cbSetScale.Text := floattostr(tempZoom);
     Map1.OnMapViewChanged := Map1MapViewChanged;
  end;
end;

procedure TfReferencePointEditor.Map1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var dx, dy : Double;
begin
  if Button = mbRight then
  begin
    Map1.CurrentTool := miArrowTool;
    Map1.MousePointer := miDefaultCursor;
  end;

  if isCapturingScreen then
  with fscrCapture do
  begin
     PDown.X := X;
     PDown.Y := Y;
     PActually.X := X;
     PActually.Y := Y;
     MouseIsDown := TRUE;
     Canvas.DrawFocusRect(Rect(x, y, x, y));
  end
  else if not position then
  begin
    FCoordPlatformConv.ConvertToMap(X, Y, dx, dy);
    CheckSymbol(dx, dy, 10);
    cbbNameClick(Sender);
    Map1.Repaint;
  end;
end;

procedure TfReferencePointEditor.Map1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
    xPos, yPos      : Single;
begin
  FCoordPlatformConv.ConvertToMap(X, Y, xx, yy);
  xPos := X;
  yPos := Y;
  getCursorPosition(xPos, yPos);

  if isCapturingScreen then begin
    if MouseIsDown then  begin
      with fscrCapture do begin
        PActually.X := x;
        PActually.Y := y;
      end;
    end;
    Map1.Repaint;
  end;
end;

procedure TfReferencePointEditor.Map1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if isCapturingScreen then
 begin

  with fscrCapture do
  begin

   PActually.X := x;
   PActually.Y := Y;
   MouseIsDown := TRUE;

   TmpBmp := TBitmap.Create;

   with TmpBmp do
   begin
     Width := Round(abs(PActually.x - PDown.x));
     Height := Round(abs(PActually.y - PDown.y));
     BitBlt(TmpBmp.Canvas.Handle, 0, 0, Width, Height, fScrCapture.Image1.Canvas.Handle, Map1.Left+ PDown.x,
     PDown.y, SRCCOPY);
     fCaptureRes.imgCaptureResult.AutoSize := false;
     fCaptureRes.imgCaptureResult.Picture.Bitmap.Assign(TmpBmp);
     fCaptureRes.Width := Width+10;
     fCaptureRes.Height := Height+fCaptureRes.panel3.height+10;
     fCaptureRes.ShowModal;

     if  fCaptureRes.recapture then  fCaptureRes.recapture:= false
     else
     begin
      isCapturingScreen := false;
      Map1.CurrentTool := miArrowTool;
      Map1.MousePointer := miDefaultCursor;
     end;
     MouseIsDown :=false;
   end;
  end;
 end;
end;

function TfReferencePointEditor.getCenterX(fMap : TMap): Double;
begin
  Result := fMap.CenterX;
end;

function TfReferencePointEditor.getCenterY(fMap : TMap): Double;
begin
  Result := fMap.CenterY;
end;

procedure TfReferencePointEditor.FormCreate(Sender: TObject);
begin
  FCanvas                 := TCanvas.Create;
  FCoordPlatformConv      := TCoordConverter.Create;
  FCoordPlatformConv.FMap := Map1;
  rList                   := TList.Create;
  rpList                  := TList.Create;
  game_area               := TGame_Environment_Definition.Create;
end;

procedure TfReferencePointEditor.FormShow(Sender: TObject);
begin
  changed := false;
  arrow   := true;
  add     := false;
  position  := false;

  if game_area.FGameArea.Detail_Map = 'ENC' then
    fName := vAppDBSetting.MapDestPathENC + '\' + game_area.FGameArea.Game_Area_Identifier + '.gst'
  else
    fName := vAppDBSetting.MapDestPathVECT + '\' + game_area.FGameArea.Game_Area_Identifier +
            '\' + game_area.FGameArea.Game_Area_Identifier + '.gst';
  if not FileExists(fName) then
     Exit;

  if FileExists(fName) then
  begin
    LoadENC(fName);

    if (game_area.FGameArea.Game_Centre_Long <> 0) and (game_area.FGameArea.Game_Centre_Lat <> 0) then
    begin
      Map1.CenterX := game_area.FGameArea.Game_Centre_Long;
      Map1.CenterY := game_area.FGameArea.Game_Centre_Lat;
    end;

    edtPositionLat.Text  := formatDM_latitude(game_area.FGameArea.Game_Centre_Lat);
    edtPositionLong.Text := formatDM_latitude(game_area.FGameArea.Game_Centre_Long);
    edtGridLat.Text      := '0.00';
    edtGridLong.Text     := '0.00';

    cbSetScale.ItemIndex := cbSetScale.Items.Count - 1;
    cbSetScaleChange(Sender);
  end;


  getNameList;
  cbbName.Text := '';
  cbbType.ItemIndex := 0;
  cbbTypeChange(Sender);


  Map1.Repaint;

end;

procedure TfReferencePointEditor.getNameList;
begin
  rpList.Clear;
  dmTTT.getAllReference_Point(ra_id,force,rpList);
  rec_count := rpList.Count;
  refreshNameList;
end;

procedure TfReferencePointEditor.refreshNameList;
var
  I: Integer;
begin
  cbbName.Clear;
  cbbName.Items.Add('(New)');
  for I := 0 to rpList.Count - 1 do begin
    with TReference_Point(rpList[I]) do begin
      cbbName.Items.Add(FData.Reference_Identifier);
      getSymbol(FData.Track_Type, FData.Symbol_Type, Symbol_Name, Symbol_Color);
      if FData.Reference_Identifier = fReferencePointNew.new_ref then
        cbbName.ItemIndex := I+1;

      if TReference_Point(rpList[I]).FData.Track_Type <> 0 then
        DrawSymbol(TReference_Point(rpList[I]).Symbol_Name, TReference_Point(rpList[I]).Symbol_Color,
                TReference_Point(rpList[I]))
      else DrawLine(TReference_Point(rpList[I]).Symbol_Color, TReference_Point(rpList[I]));
    end;
  end;
  if cbbName.ItemIndex = -1 then cbbName.ItemIndex := 0;
end;

procedure TfReferencePointEditor.getSymbol(track_type, symbol_type: Integer;
  var Name: String; var Color: TColor);
var dom,ident: Integer;
begin
  if (track_type <> 1) and (track_type <> 0) then
    getDomain_Identity(symbol_type, dom, ident)
  else ident  := symbol_type;

  Name  := getName(track_type, dom, ident);
  Color := getColor(track_type, dom, ident);
end;

procedure TfReferencePointEditor.getDomain_Identity(symbol_type: Integer; var dom,ident: Integer);
var
    sel_domain,sel_identity: String;
begin
  sel_domain   := '0';
  sel_identity := '0';
  if Length(IntToStr(symbol_type)) = 1 then
    sel_identity := IntToStr(symbol_type)
  else begin
    sel_domain   := AnsiMidStr(IntToStr(symbol_type),1,1);
    sel_identity := AnsiMidStr(IntToStr(symbol_type),2,1);
  end;

  dom   := StrToInt(sel_domain);
  ident := StrToInt(sel_identity);
end;
procedure TfReferencePointEditor.LoadENC(ENCGeoset : string);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if Map1 = nil then
    Exit;
  InitOleVariant(z);
  Map1.Layers.RemoveAll;

  Map1.Geoset := ENCGeoset;

  if ENCGeoset <> '' then
  begin
    for i := 1 to Map1.Layers.Count do
    begin
      Map1.Layers.Item(i).Selectable := false;
      Map1.Layers.Item(i).Editable  := False;
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

procedure TfReferencePointEditor.ToolButton10Click(Sender: TObject);
begin
  if (cbbName.Text <> '') and (cbbName.ItemIndex <> 0) then
  begin
    Map1.CenterX := TReference_Point(rpList[cbbName.ItemIndex-1]).FData.Longitude;
    Map1.CenterY := TReference_Point(rpList[cbbName.ItemIndex-1]).FData.Latitude;
  end;
  Map1.CurrentTool  := miArrowTool;
  Map1.MousePointer := miDefaultCursor;
end;

procedure TfReferencePointEditor.ToolButton13Click(Sender: TObject);
begin
  {ToolButton1.Down  := false;
  ToolButton2.Down  := false;
  ToolButton14.Down := false; }

  {if ToolButton13.Down then
  begin
    Map1.CurrentTool   := miZoomInTool;
    Map1.MousePointer  := miZoomInCursor;
  end
  else
  begin
    Map1.CurrentTool   := miArrowTool;
    Map1.MousePointer  := miCrossCursor;
  end; }

  Map1.CurrentTool := miZoomInTool;
  Map1.MousePointer := miZoomInCursor;

end;

procedure TfReferencePointEditor.ToolButton14Click(Sender: TObject);
begin

    map1.CurrentTool  := miCenterTool;
    map1.MousePointer := miCenterCursor;

end;

end.

