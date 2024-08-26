unit ufMainDisplay;

interface

uses
  MapXLib_TLB,  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, tttData,uDBAsset_GameEnvironment,
  ToolWin, ExtCtrls, ImgList, ufmMapWindow, OleCtrls, uMapXHandler,
  uDBCubicles, uT3GroupList, uReplayDataType, uObjectVisuals, uCoordConvertor,
  uT3Unit, uT3DetectedTrack, uSimObjects, uT3Listener, uT3Missile,
  uDBAsset_Weapon, uT3Torpedo, uT3Common, uDBAsset_Vehicle, Buttons, Grids, Mask,
  uT3Gun, DateUtils, Printers, uTMapTouch2, System.ImageList;

type
  TfrmMainDIsplay = class(TForm)
    mnMain: TMainMenu;
    View1: TMenuItem;
    Display1: TMenuItem;
    Tactical1: TMenuItem;
    Tote1: TMenuItem;
    ImageList1: TImageList;
    pnlTop: TPanel;
    ToolBar1: TToolBar;
    tbtnFullScreen: TToolButton;
    cbSetScale: TComboBox;
    toolbtnDecreaseScale: TToolButton;
    toolbtnIncreaseScale: TToolButton;
    ToolButton1: TToolButton;
    toolbtnZoom: TToolButton;
    ToolBtnCentreOnHook: TToolButton;
    ToolBtnCentreOnGameCentre: TToolButton;
    ToolBtnPan: TToolButton;
    toolBtnFilterRangeRings: TToolButton;
    ToolBtnRangeRingsOnHook: TToolButton;
    ToolButton2: TToolButton;
    ToolBtnHookPrevious: TToolButton;
    ToolBtnHookNext: TToolButton;
    ToolButton3: TToolButton;
    tbRewind: TToolButton;
    tbtnStartGame: TToolButton;
    tBtnGameFreeze: TToolButton;
    tBtnDoubleSpeed: TToolButton;
    N1: TMenuItem;
    FullScreen1: TMenuItem;
    Scale1: TMenuItem;
    Centre1: TMenuItem;
    N2: TMenuItem;
    Rangeings1: TMenuItem;
    N3: TMenuItem;
    Filters1: TMenuItem;
    Overrides1: TMenuItem;
    History1: TMenuItem;
    N4: TMenuItem;
    Hook1: TMenuItem;
    Controller1: TMenuItem;
    ools1: TMenuItem;
    Help1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    tbAddTrack: TToolButton;
    tbDeleteTrack: TToolButton;
    ToolButton8: TToolButton;
    tbHistory: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolBtnFilterCursor: TToolButton;
    tbAnchor: TToolButton;
    tbTools: TToolButton;
    ToolButton15: TToolButton;
    tbAudio: TToolButton;
    ToolButton17: TToolButton;
    tbHelp: TToolButton;
    Cursor1: TMenuItem;
    N5: TMenuItem;
    argetPriorityAssessment1: TMenuItem;
    NGSSpotterDialog1: TMenuItem;
    N6: TMenuItem;
    Options1: TMenuItem;
    pnlContain: TPanel;
    pnlTactical: TPanel;
    pnlTote: TPanel;
    pnlLeft: TPanel;
    HookContactInfoTraineeDisplay: TPageControl;
    tsHook: TTabSheet;
    lbTrackHook: TLabel;
    Label1: TLabel;
    lbNameHook: TLabel;
    lbClassHook: TLabel;
    Label2: TLabel;
    lbBearingHook: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbRangeHook: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbPositionHook1: TLabel;
    lbCourseHook: TLabel;
    lbPositionHook2: TLabel;
    lbGround: TLabel;
    lbFormation: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbDamage: TLabel;
    lb8: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    pnlDepth: TPanel;
    lbDepth: TLabel;
    lb2: TLabel;
    lbtext3: TStaticText;
    lb1: TStaticText;
    pnlAltitude: TPanel;
    lb4: TLabel;
    lbAltitude: TLabel;
    lb6: TStaticText;
    lb5: TStaticText;
    lb7: TStaticText;
    lb3: TStaticText;
    pnlMap: TPanel;
    pnlBottom: TPanel;
    Panel1: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    lbCourseHooked: TLabel;
    lbSpeedHooked: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lbRangeRings: TLabel;
    Label15: TLabel;
    lblRangeScale: TLabel;
    Label16: TLabel;
    lbRangeAnchor: TLabel;
    Label17: TLabel;
    lbBearingAnchor: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    lbLongitude: TLabel;
    lbLatitude: TLabel;
    lbY: TLabel;
    lbX: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label26: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    lbColor: TLabel;
    Label10: TLabel;
    Label21: TLabel;
    StatusBar1: TStatusBar;
    pnlStatusRed: TPanel;
    pnlStatusYellow: TPanel;
    lvTrackTable: TListView;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanelStatusOp: TCategoryPanel;
    btnWeaponEngagement: TSpeedButton;
    Label50: TLabel;
    Label27: TLabel;
    btnAudioRecord: TSpeedButton;
    gbWeaponEngagementsSUmmary: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    lvWeaponEngagement: TListView;
    gbAudioRecordTracks: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Label28: TLabel;
    Edit1: TEdit;
    Panel8: TPanel;
    Label29: TLabel;
    Panel9: TPanel;
    sgExChannel: TStringGrid;
    lvRecordOut: TListView;
    Panel10: TPanel;
    Label30: TLabel;
    Panel11: TPanel;
    sgInChannel: TStringGrid;
    Panel12: TPanel;
    Panel13: TPanel;
    Label31: TLabel;
    Panel14: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel15: TPanel;
    sgAvailableExChannel: TStringGrid;
    lvRecordIn: TListView;
    TabSheet2: TTabSheet;
    Panel16: TPanel;
    sgAvailableInChannel: TStringGrid;
    lbl1: TLabel;
    medtedt1: TMaskEdit;
    btnJump: TButton;
    lblMaxTime: TLabel;
    btnPrint: TToolButton;
    procedure tbtnFullScreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure toolbtnZoomClick(Sender: TObject);
    procedure cbSetScaleChange(Sender: TObject);
    procedure toolbtnDecreaseScaleClick(Sender: TObject);
    procedure toolbtnIncreaseScaleClick(Sender: TObject);
    procedure ToolBtnCentreOnGameCentreClick(Sender: TObject);
    procedure ToolBtnPanClick(Sender: TObject);
    procedure toolBtnFilterRangeRingsClick(Sender: TObject);
    procedure tbtnStartGameClick(Sender: TObject);
    procedure tBtnGameFreezeClick(Sender: TObject);
    procedure tBtnDoubleSpeedClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tbRewindClick(Sender: TObject);
    procedure ToolBtnCentreOnHookClick(Sender: TObject);
    procedure ToolBtnRangeRingsOnHookClick(Sender: TObject);
    procedure tbAnchorClick(Sender: TObject);
    procedure ToolBtnFilterCursorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToolBtnHookPreviousClick(Sender: TObject);
    procedure ToolBtnHookNextClick(Sender: TObject);
    procedure tbAddTrackClick(Sender: TObject);
    procedure tbDeleteTrackClick(Sender: TObject);
    procedure lvTrackTableSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure tbHistoryClick(Sender: TObject);
    procedure FullScreen1Click(Sender: TObject);
    procedure Centre1Click(Sender: TObject);
    procedure Rangeings1Click(Sender: TObject);
    procedure Label50Click(Sender: TObject);
    procedure Tactical1Click(Sender: TObject);
    procedure Tote1Click(Sender: TObject);
    procedure btnWeaponEngagementClick(Sender: TObject);
    procedure Label27Click(Sender: TObject);
    procedure btnAudioRecordClick(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure pnlStatusRedClick(Sender: TObject);
    procedure btnJumpClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    FMap    : TMapXTouch;
    FAnchorTrack : TSimObject;
    FManager : TObject;

    FOnGameControl: TOnGameControl;

    FAnchorFilterEnabled: Boolean;
    FFullScreen         : boolean;
    FLeftMouseDown      : boolean;
    FRangeRingOnHook    : Boolean;
    isOnAnchorLine      : Boolean;
    FIndexTrack         : integer;

    FDisplayID          : integer;
    FPerspectiveItem    : TMenuItem;

    FCenterOnHook       : Boolean;
    FLastMapCenterX,
    FLastMapCenterY     : double;
    FTrackLists          : TThreadList;

    statusR_List,statusY_List : TList;

    procedure ChangePerspective(groupID : integer);
    procedure FilterAnchor(X, Y : double);
    procedure KuadranInfo(x,y : integer; mX, mY : double);
    procedure OnPerspectiveClick(Sender : TObject);
    procedure MapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer;
      const RectFull, RectInvalid: IDispatch);
    procedure MapInitialization;
    procedure SetOnGameControl(const Value: TOnGameControl);
    procedure ResetTrackInfo;
    procedure SetFullScreen(const Value: boolean);
    procedure UnSelectAllTrack;
    procedure SetDisplayID(const Value: integer);
    procedure SetManager(const Value: TObject);
    function FindTrackListByMember(const arg: string): TListItem;
    procedure AddTrackPlatform(Sender: TObject); // for Controller;
    procedure RemoveFromTrackList(Sender: TObject);

  public
    { Public declarations }
    OnCloseForm : TNotifyEvent;

    property FullScreen : boolean read FFullScreen write SetFullScreen;
    property Map : TMapXTouch read FMap;
    property OnGameControl : TOnGameControl read FOnGameControl write SetOnGameControl;
    property DisplayID : integer read FDisplayID write SetDisplayID;
    property Manager : TObject read FManager write SetManager;

    procedure MapToolUsed(ASender: TObject; ToolNum: Smallint;
      X1, Y1, X2, Y2, Distance: double; Shift, Ctrl: WordBool;
      var EnableDefault: WordBool);
    procedure MapMouseDown(sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MapMouseMove(sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MapMouseUp(sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure MapViewChanged(Sender: TObject);
    procedure SetSelectedTrack(track: TSimObject);
    procedure UpdateForm;
    procedure UpdateCenterOnHook;
    procedure updateStatus;
    procedure addStatus(status: String);
    procedure SetPerspectivesOption;
    procedure RefreshTrackList;

    procedure OnWeaponEngaged(Sender, Target: TObject ; Launcher : Integer);
    procedure OnWeaponLaunched(Sender, Target: TObject);
    procedure DisplayGameTime(const gSpeed: single; const gTime: TDateTime);
    procedure DisplayValidTime(aStart, aStop : TDateTime);
  end;

  TStatus = class
    public
    state : String;
  end;

var
  frmMainDIsplay: TfrmMainDIsplay;

implementation

uses
  Math, uT3ReplayClient, uT3Vehicle, uBaseCoordSystem, uT3Weapon;

const
  CMin_Z = 0;
  CMax_Z = 14;


{$R *.dfm}

function ZoomIndexToScale(const i: Integer): double;
begin
  if i < -3 then
    result := 0.125
  else if i > 14 then
    result := 2500.0
  else
    result := Power(2.0, (i - 3));
end;

function FindClosestZoomIndex(const z: double): Integer;
var
  i: Integer;
begin
  result := 0;

  if z >= 2500 then
    result := CMax_Z
  else if z <= 0.125 then
    result := CMin_Z
  else
  begin
    i := Round(Log2(z));
    result := i + 3;
  end;
end;

function FixMapZoom(z: double): double;
begin
  if z >= 1.0 then
    result := Round(z)
  else
    result := 0.001 * Round(z * 1000);
end;

procedure EnableComposited(WinControl:TWinControl);
var
  i:Integer;
  NewExStyle:DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for I := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

procedure TfrmMainDIsplay.addStatus(status: String);
var status_state : TStatus;
begin
  status_state  := TStatus.Create;
  status_state.state := status;
  statusR_List.Add(status_state);
  updateStatus;
end;

procedure TfrmMainDIsplay.AddTrackPlatform(Sender: TObject);
var
  sTrackNum, sDomain, sIdent: string;
  li: TListItem;
  pi: TT3PlatformInstance;
  det: TT3DetectedTrack;
begin
  pi := nil;
  if Sender is TT3DetectedTrack then
  begin
    det := Sender as TT3DetectedTrack;

    pi := det.TrackObject as TT3PlatformInstance;

    sTrackNum := FormatTrackNumber(det.trackNumber);

    sDomain := getDomain(det.TrackDomain);
    sIdent := getIdentStr(det.TrackIdent);
  end
  else if (Sender is TT3PlatformInstance) then
  begin
    pi := Sender as TT3PlatformInstance;

    // sTrackNum   := FormatTrackNumber(pi.TrackNumber);
    sTrackNum := pi.TrackLabel;

    sDomain := getDomain(TVehicle_Definition(TT3Vehicle(Sender).UnitDefinition)
        .FData.Platform_Domain);
    sIdent := getIdentStr(pi.TrackIdent);
  end;

  if pi = nil then
    exit;

  li := FindTrackListByMember(sTrackNum);

  if li = nil then
  begin
    li := lvTrackTable.Items.Add;

    li.Caption := sDomain;
    li.SubItems.Add(sTrackNum);
    li.SubItems.Add(sIdent);

    li.SubItems.Add(FormatCourse(pi.Course));
    li.SubItems.Add(FormatSpeed(pi.Speed));

    if pi.Altitude >= 0 then
    begin
      li.SubItems.Add(FormatAltitude(pi.Altitude));
      li.SubItems.Add(' ');
    end
    else
    begin
      li.SubItems.Add(' ');
      li.SubItems.Add(FormatAltitude(pi.Altitude));
    end;
    li.Data := Sender;
  end
  else
  begin
    // sudah ada.
    // li.SubItems.Clear;
    li.Caption := sDomain;

    li.SubItems[0] := sTrackNum;
    li.SubItems[1] := sIdent;
    li.SubItems[2] := FormatCourse(pi.Course);
    li.SubItems[3] := FormatSpeed(pi.Speed);
    if pi.Altitude >= 0 then
    begin
      li.SubItems[4] := FormatAltitude(pi.Altitude);
      li.SubItems[5] := ' ';
    end
    else
    begin
      li.SubItems[4] := ' ';
      li.SubItems[5] := FormatAltitude(pi.Altitude);
    end;
  end;
end;

procedure PrintBitmap(Canvas:  TCanvas; DestRect:  TRect;  Bitmap:  TBitmap);
  VAR
    BitmapHeader:  pBitmapInfo;
    BitmapImage :  POINTER;
    HeaderSize  :  DWORD;    // Use DWORD for D3-D5 compatibility
    ImageSize   :  DWORD;
BEGIN
  GetDIBSizes(Bitmap.Handle, HeaderSize, ImageSize);
  GetMem(BitmapHeader, HeaderSize);
  GetMem(BitmapImage,  ImageSize);
  TRY
    GetDIB(Bitmap.Handle, Bitmap.Palette, BitmapHeader^, BitmapImage^);
    StretchDIBits(Canvas.Handle,
                  DestRect.Left, DestRect.Top,     // Destination Origin
                  DestRect.Right  - DestRect.Left, // Destination Width
                  DestRect.Bottom - DestRect.Top,  // Destination Height
                  0, 0,                            // Source Origin
                  Bitmap.Width, Bitmap.Height,     // Source Width & Height
                  BitmapImage,
                  TBitmapInfo(BitmapHeader^),
                  DIB_RGB_COLORS,
                  SRCCOPY)
  FINALLY
    FreeMem(BitmapHeader);
    FreeMem(BitmapImage)
  END
END {PrintBitmap};

FUNCTION CenterText(s:  STRING):  INTEGER;
BEGIN
  RESULT := (Printer.PageWidth - Printer.Canvas.TextWidth(s)) DIV 2
END {CenterText};

PROCEDURE PrintFooterTimeStamp (CONST LeftMargin:  INTEGER);
  VAR
    s:  STRING;
BEGIN
  //Footer
  Printer.Canvas.Font.Name := 'Arial';
  Printer.Canvas.Brush.Color := clWhite;
  Printer.Canvas.Font.Height :=
        MulDiv(GetDeviceCaps(Printer.Canvas.Handle, LOGPIXELSY), 8, 72);
  s := FormatDateTime('m/d/yy  h:nn', Now);
  Printer.Canvas.TextOut(LeftMargin,
                         Printer.PageHeight-Printer.Canvas.TextHeight('X'),
                         s);
END {PrinterFooterTimeStamp};

procedure TfrmMainDIsplay.btn1Click(Sender: TObject);
var
  Win: HWND;
  DC: HDC;
  Bmp: TBitmap;
  s : String;

  iFromLeftMargin    :  INTEGER;
  iPrintedImageWidth :  INTEGER;
  jDelta             :  INTEGER;
  jFromTopOfPage     :  INTEGER;
  jPrintedImageHeight:  INTEGER;

  printDialog    : TPrintDialog;
begin
  Win := Map.Handle;
  DC := GetDC(Win);

  try
    printDialog := TPrintDialog.Create(Self);
  except
    MessageDlg('Default Printer Not Found..!', mtError, [mbOK], 0);
    ReleaseDC(Win, DC);
    Exit;
  end;

  try

    Bmp := TBitmap.Create;
    try
      Bmp.Height := Map.Height;
      Bmp.Width := Map.Width;
      BitBlt(Bmp.Canvas.Handle, 0, 0, Width, Height, DC, 0, 0, SRCCOPY);
      Bmp.PixelFormat:=pf24bit;

      with printDialog do
      begin

        Copies := 1;
        MinPage := 1;
        MaxPage := 1;
        FromPage := 1;
        ToPage := 1;

        if Execute then
        begin

          Printer.Title := 'Map Screenshot';
          Printer.Orientation := poLandscape;
          Printer.Copies := Copies;
          Printer.BeginDoc;

          Printer.Canvas.Font.Height :=
            MulDiv(GetDeviceCaps(Printer.Canvas.Handle, LOGPIXELSY), 12, 72);
          Printer.Canvas.Font.Name := 'Arial';
          Printer.Canvas.Font.Size := 14;
          jDelta := Printer.Canvas.TextHeight('X');
          jFromTopOfPage := 1*jDelta;
          s := 'Map Screenshot ' + FormatDateTime('dd mmmm yyyy, hh:nn:ss', Now);

          Printer.Canvas.TextOut(CenterText(s), jFromTopOfPage, s);
          // 5th line from top
          jFromTopOfPage := 3*jDelta;

          // Image position and size
          // 5% left and right margin
          iFromLeftMargin    := MulDiv(Printer.PageWidth,5,100);  // 5%

          // Set printed bitmap with to be 85% of paper width
          iPrintedImageWidth := MulDiv(Printer.PageWidth,90,100);  // 85%

          // Set printed bitmap height to maintain aspect ratio
          jPrintedImageHeight := Bmp.Height*iPrintedImageWidth DIV
                                 Bmp.Width;  // maintain aspect ratio of bitmap

          PrintBitmap (Printer.Canvas,
                     Rect(iFromLeftMargin, jFromTopOfPage,
                          iFromLeftMargin + iPrintedImageWidth,
                          jFromTopOfPage  + jPrintedImageHeight),
                     Bmp);
          // PrintFooterTimeStamp (iFromLeftMargin);
          Printer.EndDoc;

        end;

      end;
    finally
      Bmp.Free;

    end;
  finally
    ReleaseDC(Win, DC);
    printDialog.Free;
  end;
end;

procedure TfrmMainDIsplay.btnAudioRecordClick(Sender: TObject);
begin
  gbAudioRecordTracks.BringToFront;
end;

procedure TfrmMainDIsplay.btnJumpClick(Sender: TObject);
var
  dt : TTime;
  l : TStrings;
  h,n,s: integer;
begin
  l := TStringList.Create;
  l.Delimiter := ':';
  l.DelimitedText := medtedt1.Text;

  TryStrToInt(l[0],h);
  TryStrToInt(l[1],n);
  TryStrToInt(l[2],s);

  l.Free;

  dt := EncodeTime(h,n,s,0);
  TT3ReplayClient(manager).JumpTo(dt);
end;

procedure TfrmMainDIsplay.btnWeaponEngagementClick(Sender: TObject);
begin
  Label50Click(Sender);
end;

procedure TfrmMainDIsplay.cbSetScaleChange(Sender: TObject);
var
  z: double;
  s: string;
begin
  if cbSetScale.ItemIndex < 0 then
    exit;

  s := cbSetScale.Items[cbSetScale.ItemIndex];
  try
    z := StrToFloat(s);
    TT3ReplayClient(manager).SimMap.SetMapZoom(z * 2);
  finally

  end;
end;

procedure TfrmMainDIsplay.Centre1Click(Sender: TObject);
begin
  ToolBtnCentreOnGameCentreClick(Sender);
end;

procedure TfrmMainDIsplay.ChangePerspective(groupID: integer);
var
  i,j : integer;
  f : boolean;
  aObject, aObject1 : TT3PlatformInstance;
  x,y : double;
  grp: T3CubicleGroup;
  gm: T3CubicleGroupMember;
  vObj: TT3Vehicle;
begin
  if Assigned(TT3ReplayClient(manager).HookedPlatform) then
    if TT3ReplayClient(manager).HookedPlatform is TT3PlatformInstance then
      TT3PlatformInstance(TT3ReplayClient(manager).HookedPlatform).Selected := false
    else 
    if TT3ReplayClient(manager).HookedPlatform is TT3DetectedTrack then
      TT3DetectedTrack(TT3ReplayClient(manager).HookedPlatform).Selected := false;

  f := false;

  // instruktur view
  if groupID = 0 then begin
    TT3ReplayClient(manager).SimDetectedTrackList.ClearAndRemove;
    TT3ReplayClient(manager).IsController := true;
    
    for i := 0 to TT3ReplayClient(manager).SimPlatforms.itemCount - 1 do
    begin
      aObject := TT3PlatformInstance(TT3ReplayClient(manager).SimPlatforms.getObject(i));
      aObject.UnitGroup := true;
      aObject.Enable := true;
      aObject.isInstructor := true;
      aObject.Visible := true;
      aObject.IsGroupLeader := false;

      if aObject is TT3Vehicle then
        TT3Vehicle(aObject).LoadPlatformSymbol;

      if (not f) and (aObject is TT3Vehicle) then
      begin
        TT3ReplayClient(manager).HookedPlatform := aObject;
        f := true;
      end;
    end;

    for i := 0 to TT3ReplayClient(manager).simNonRealPlatform.itemCount - 1 do
    begin
      aObject := TT3PlatformInstance(TT3ReplayClient(manager).simNonRealPlatform.getObject(i));

      if aObject.GroupIndex = 0 then
      begin
        aObject.UnitGroup := true;
        aObject.Enable := true;
        aObject.isInstructor := true;
        aObject.Visible := true;
        aObject.IsGroupLeader := false;

        if aObject is TT3Vehicle then
          TT3Vehicle(aObject).LoadPlatformSymbol;

        if (not f) and (aObject is TT3Vehicle) then
        begin
          TT3ReplayClient(manager).HookedPlatform := aObject;
          f := true;
        end;
      end
      else
      begin
        aObject.UnitGroup := False;
        aObject.Enable := true;
        aObject.isInstructor := False;
        aObject.Visible := False;
        aObject.IsGroupLeader := false;
      end;
    end;
  end else
  // cubicle view
  begin
    TT3ReplayClient(manager).SimDetectedTrackList.ClearAndRemove;

    for i := 0 to TT3ReplayClient(manager).SimPlatforms.itemCount - 1 do
    begin
      aObject := TT3PlatformInstance(TT3ReplayClient(manager).SimPlatforms.getObject(i));
      aObject.UnitGroup := false;
      aObject.Enable := false;
      aObject.isInstructor := false;
      aObject.Visible := false;
      aObject.IsGroupLeader := false;
    end;

    for i := 0 to TT3ReplayClient(manager).simNonRealPlatform.itemCount - 1 do
    begin
      aObject := TT3PlatformInstance(TT3ReplayClient(manager).simNonRealPlatform.getObject(i));
      aObject.UnitGroup := false;
      aObject.Enable := false;
      aObject.isInstructor := false;
      aObject.Visible := false;
      aObject.IsGroupLeader := false;
    end;

    grp := TT3ReplayClient(manager).Scenario.CubiclesGroupsListFromDB.GetGroupByID(groupID) as T3CubicleGroup;

    if grp = nil then
      Exit;

    for J := 0 to grp.Count - 1 do
    begin
      gm := grp.Items[J] as T3CubicleGroupMember;
      aObject := TT3ReplayClient(manager).FindT3PlatformByID(gm.FData.Platform_Instance_Index);
      if aObject = nil then // find nonreal
        aObject := TT3ReplayClient(manager).FindNonRealPlatformByID(gm.FData.Platform_Instance_Index,grp.FData.Group_Index);

      if aObject <> nil then
      begin
        aObject.UnitGroup := True;
        aObject.Enable := True;

        if aObject is TT3Vehicle then
        begin
          vObj := aObject as TT3Vehicle;
          vObj.TrackNumber := grp.GetTrackNumber(vObj.InstanceIndex);
          vObj.TrackLabel := FormatTrackNumber(vObj.TrackNumber);
          vObj.IsGroupLeader := True;
          vObj.TrackDomain := vObj.PlatformDomain;
          vObj.TrackIdent := piFriend;
          vObj.IsOwnShip := True;
        end;
      end;


      if (aObject <> nil) and (not f) and (aObject.Parent = nil) then
      begin
        TT3ReplayClient(manager).HookedPlatform := aObject;
        f := True;
      end;
    end;

    for i := 0 to TT3ReplayClient(manager).SimPlatforms.itemCount - 1 do
    begin
      aObject1 := TT3PlatformInstance(TT3ReplayClient(manager).SimPlatforms.getObject(i));

      for J := 0 to grp.Count - 1 do
      begin
        gm := grp.Items[J] as T3CubicleGroupMember;
        if aObject1.ParentInstanceIndex = gm.FData.Platform_Instance_Index then
        begin
          aObject1.UnitGroup := True;
          aObject1.Enable := True;
          aObject1.isInstructor := false;
          aObject1.Visible := True;
          aObject1.IsGroupLeader := false;

          Break;
        end;
      end;
    end;

    TT3ReplayClient(manager).IsController := false;
  end;
   
  x := 0;
  y := 0;

  if Assigned(TT3ReplayClient(manager).HookedPlatform) then begin

    UnSelectAllTrack;
    TT3PlatformInstance(TT3ReplayClient(manager).HookedPlatform).Selected := true;

    x := TT3PlatformInstance(TT3ReplayClient(manager).HookedPlatform).getPositionX;
    y := TT3PlatformInstance(TT3ReplayClient(manager).HookedPlatform).getPositionY;
  end;
  
  TT3ReplayClient(manager).SimMap.FMap.ZoomTo(TT3ReplayClient(manager).SimMap.FMap.Zoom, x, y);
end;

procedure TfrmMainDIsplay.FilterAnchor(X, Y : double);
var
  r, b: double;
begin
  b := 0.00;
  r := 0.00;
  if Assigned(FAnchorTrack) then    
  begin
    TT3ReplayClient(manager).LineVisual.Range := CalcRange(FAnchorTrack.getPositionX,
      FAnchorTrack.getPositionY, x, y);
    TT3ReplayClient(manager).LineVisual.Bearing := CalcBearing
      (FAnchorTrack.getPositionX, FAnchorTrack.getPositionY, x, y);

    lbRangeAnchor.Caption := FormatSpeed(r);
    lbBearingAnchor.Caption := FormatCourse(b);
  end;
end;

function TfrmMainDIsplay.FindTrackListByMember(const arg: string): TListItem;
var
  i: Integer;
  f: Boolean;
  li: TListItem;
begin
  result := nil;

  f := false;
  i := 0;
  li := nil;
  while not f and (i < lvTrackTable.Items.Count) do
  begin
    li := lvTrackTable.Items.Item[i];

    // f := SameText(li.Caption, arg);
    f := SameText(li.SubItems[0], arg);

    Inc(i);
  end;

  if f then
    result := li;
end;

procedure TfrmMainDIsplay.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Assigned(OnCloseForm) then
    OnCloseForm(Self);
  CanClose := false;
end;

procedure TfrmMainDIsplay.FormCreate(Sender: TObject);
var
  i : integer;
  z: double;
begin

  MapInitialization;

  cbSetScale.Clear;
  for i := CMin_Z to CMax_Z do
  begin
    z := ZoomIndexToScale(i);
    cbSetScale.Items.Add(FloatToStr(z));
  end;

  FAnchorFilterEnabled := false;
  FLeftMouseDown  := false;
  isOnAnchorLine  := false;

  FPerspectiveItem := TMenuItem.Create(Self);
  FPerspectiveItem.Caption := 'Perspective';
  View1.Add(FPerspectiveItem);

  FCenterOnHook := false;
  FLastMapCenterX := 0;
  FLastMapCenterY := 0;

  FTrackLists := TThreadList.Create;
  FIndexTrack := 0;

  StatusBar1.Panels[9].Text := 'FROZEN';
  StatusBar1.Repaint;

  statusR_List := TList.Create;
  statusY_List := TList.Create;
end;

procedure TfrmMainDIsplay.FormDestroy(Sender: TObject);
begin
  statusR_List.Clear;
  statusR_List.Free;

  statusY_List.Clear;
  statusY_List.Free;
  Fmap.Free;
end;

procedure TfrmMainDIsplay.FullScreen1Click(Sender: TObject);
begin
  FullScreen := not FullScreen;
end;

procedure TfrmMainDIsplay.KuadranInfo;
var
  long, lat: double;
  sX, sY: Integer;
  pX, pY: Extended;
begin
  long  := TT3ReplayClient(manager).GameEnvironment.FGameArea.Game_Centre_Long;
  lat   := TT3ReplayClient(manager).GameEnvironment.FGameArea.Game_Centre_Lat;

  TT3ReplayClient(manager).Converter.ConvertToScreen(long, lat, sX, sY);

  // pX dan pY koordinat cartesian dgn titik pusat (0,0) dalam satuan nautical mile;
  pX := CalcMove (mx, long);
  pY := CalcMove(my, lat);

  lbX.Caption := FormatFloat('0.00', Abs(pX));
  lbY.Caption := FormatFloat('0.00', Abs(pY));

  if (pX >= 0) and (pY >=0) then begin
    lbColor.Caption := 'White ';  //kuadran 1
  end;
  if (pX <= 0) and (pY >=0) then begin
    lbColor.Caption := 'Red ';   //kuadran 2
  end;
  if (pX < 0) and (pY < 0) then begin
    lbColor.Caption := 'Green '; //kuadran 3
  end;
  if (pX >= 0) and (pY <= 0) then begin
    lbColor.Caption := 'Blue ';  //kuadran 4
  end;

end;

procedure TfrmMainDIsplay.Label27Click(Sender: TObject);
begin
  gbAudioRecordTracks.BringToFront;
end;

procedure TfrmMainDIsplay.Label50Click(Sender: TObject);
begin
  gbWeaponEngagementsSUmmary.BringToFront;
  lvWeaponEngagement.Columns[0].Width := 200;
  lvWeaponEngagement.Columns[1].Width := 200;
  lvWeaponEngagement.Columns[2].Width := 200;
  lvWeaponEngagement.Columns[3].Width := 200;
  lvWeaponEngagement.Columns[4].Width := 200;
end;

procedure TfrmMainDIsplay.lvTrackTableSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  obj: TObject;
begin
  if Item = nil then
    exit;

  UnSelectAllTrack;

  obj := Item.Data;
  if obj is TT3DetectedTrack then (obj as TT3DetectedTrack)
    .Selected := true
  else if obj is TT3PlatformInstance then (obj as TT3PlatformInstance)
    .Selected := true;

  TT3ReplayClient(Manager).HookedPlatform := obj;

  Map.Repaint;
end;

procedure TfrmMainDIsplay.MapDrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull,
  RectInvalid: IDispatch);
begin

end;

procedure TfrmMainDIsplay.MapInitialization;
begin
  FMap := TMapXTouch.Create(Self);
  with FMap do begin
    Parent := pnlMap;
    Align  := alClient;
    Visible := True;
    DoubleBuffered := False;

    pnlMap.DoubleBuffered := False;

    if not FMap.WinXP then
      RegisterTouchWindow(FMap.Handle, 0);

    EnableComposited(pnlMap);

    OnMouseUp   := MapMouseUp;
    OnMouseDown := MapMouseDown;
    OnToolUsed  := MapToolUsed;
    OnDrawUserLayer := MapDrawUserLayer;
    OnMapViewChanged := MapViewChanged;
  end;
end;


procedure TfrmMainDIsplay.MapMouseDown(sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  mx, my: double;
  aObj : TObject;
begin
  TT3ReplayClient(manager).Converter.ConvertToMap(x, y, mx, my);

  FLeftMouseDown := true;

  if FLeftMouseDown then begin

    // Set selected track on view
    aObj := TT3ReplayClient(manager).FindNearestDetectedTrack(mx,my,10);
    if not Assigned(aObj) then
      aObj := TT3ReplayClient(manager).FindNearestTrack(mx, my, 10);

    if Assigned(aObj) then
      SetSelectedTrack(TSimObject(aObj));
    // ====

    // anchor line filter
    if FAnchorFilterEnabled then begin
      isOnAnchorLine := TT3ReplayClient(manager).LineVisual.isPointOnLine(mx, my);
      if isOnAnchorLine then begin    
        Map.CurrentTool := mtAnchorTool;         
        FilterAnchor(mx, my);
      end;
    end;
    // ====

  end;
end;

procedure TfrmMainDIsplay.MapMouseMove(sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  mx, my : double;
begin
  TT3ReplayClient(manager).Converter.ConvertToMap(x, y, mx, my);

  lbLongitude.Caption := formatDMS_long(mx);
  lbLatitude.Caption := formatDMS_latt(my);

  // line filter   
  if FLeftMouseDown and FAnchorFilterEnabled and isOnAnchorLine then
    FilterAnchor(mx,my);

  KuadranInfo(x,y,mx,my);

end;

procedure TfrmMainDIsplay.MapMouseUp(sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FLeftMouseDown := false;
  isOnAnchorLine := false;

  if Map.CurrentTool <> mtSelectObject then
    Map.CurrentTool := mtSelectObject;
  
end;

procedure TfrmMainDIsplay.MapToolUsed(ASender: TObject; ToolNum: Smallint; X1,
  Y1, X2, Y2, Distance: double; Shift, Ctrl: WordBool;
  var EnableDefault: WordBool);
begin
end;

procedure TfrmMainDIsplay.MapViewChanged(Sender: TObject);
var
  i: Integer;
  z, zCapt: double;
begin
  z := FixMapZoom(Map.Zoom);

  zCapt := 0.5 * z;
  cbSetScale.Text := FloatToStr(zCapt);
  lblRangeScale.Caption := cbSetScale.Text;

  i := FindClosestZoomIndex(zCapt);

  toolbtnDecreaseScale.Enabled := i > 0;
  toolbtnIncreaseScale.Enabled := i < CMax_Z;

  if toolBtnFilterRangeRings.Down then
  begin
    i := FindClosestZoomIndex(zCapt);
    z := ZoomIndexToScale(i);
    TT3ReplayClient(manager).RangeRing.Interval := 0.25 * z;
  end;

  Map.Repaint;

end;

procedure TfrmMainDIsplay.OnPerspectiveClick(Sender: TObject);
var
  i : integer;
begin
  if TMenuItem(Sender).Tag = TT3ReplayClient(manager).CurrentPerspective then exit;

  for I := 0 to FPerspectiveItem.Count - 1 do
    FPerspectiveItem.Items[i].Checked := false;

  TMenuItem(Sender).Checked := true;  
  TT3ReplayClient(manager).CurrentPerspective := TMenuItem(Sender).Tag;

  ChangePerspective(TT3ReplayClient(manager).CurrentPerspective);
end;

procedure TfrmMainDIsplay.OnWeaponEngaged(Sender, Target: TObject;
  Launcher: Integer);
var
  li: TListItem;
  emptyRow, i: Integer;
  wc, FiringModeStr: String;
  time : TDateTime;
  Distance : Double;
  Timeflight : Double;
  mov : TT3MissilesOnVehicle;

begin
  if not Assigned(Sender) then exit;

//  time := simMgrClient.GameTIME;
  li := lvWeaponEngagement.Items.Add;
  { Time, Launching Platform, Weapon Class, Target Platform, Engagement }
  li.Caption := FormatDateTime('hh : mm : ss', time);
  li.SubItems.Add(TT3Weapon(sender).InstanceName);

  case TT3Weapon(sender).WeaponCategory of
    wcMissileAirToSurfaceSubsurface:
      wc := 'Missile Air To Surface Subsurface';
    wcMissileSurfaceSubsurfaceToAir:
      wc := 'Missile Surface Subsurface To Air';
    wcMissileSurfaceSubsurfaceToSurfaceSubsurface:
      wc := 'Missile Surface/Subsurface To Surface/Subsurface';
    wcMissileAirToAir:
      wc := 'Missile Air To Air';
    wcMissileLandAttack:
      wc := 'Missile Land Attack';
    wcTorpedoStraigth:
      wc := 'Torpedo Straigth';
    wcTorpedoActiveAcoustic:
      wc := 'Torpedo Active Acoustic';
    wcTorpedoPassiveAcoustic:
      wc := 'Torpedo Passive Acoustic';
    wcTorpedoWireGuided:
      wc := 'Torpedo Wire Guided';
    wcTorpedoWakeHoming:
      wc := 'Torpedo Wake Homing';
    wcTorpedoActivePassive:
      wc := 'Torpedo Active Passive';
    wcTorpedoAirDropped:
      wc := 'Torpedo Air Dropped';
    wcMine:
      wc := 'Mine';
    wcGunCIWS:
      wc := 'Gun CIWS';
    wcGunGun:
      wc := 'Gun';
    wcGunRocket:
      wc := 'Gun Rocket';
    wcBomb:
      wc := 'Bomb';
  end;

  li.SubItems.Add(wc);
  li.SubItems.Add(TT3PlatformInstance(Target).InstanceName);
  li.SubItems.Add('Engaged');
  li.Data := TT3PlatformInstance(sender);

  //if sender is TT3Missile then
  if sender is TT3MissilesOnVehicle then
  begin
//    rec := TRec_Time_Row.Create;
//    sgSurToSurEditedRow := 0;
//    sgSurToAirEditedRow := 0;

    // add data Surface to air
    if TT3Vehicle(Target).PlatformDomain = 0 then
    begin
//      rec.isAir := true;
//      gbSurfaceToAir.BringToFront;
//      emptyRow := 0;
//
//      for i := 0 to sgSurfacetoAir.RowCount - 1 do
//      begin
//        if sgSurfacetoAir.Cells[0, i] = '' then
//        begin
//          emptyRow := i;
//          break;
//        end;
//      end;
//
//      if TT3Missile(sender).PredictionEngageTime = 0 then
//         TT3Missile(sender).PredictionEngageTime := TT3Missile(sender).LaunchDelay / (3600*24);
//
//      timeEngage := TimeOf(simMgrClient.GameTIME) + TimeOf(TT3Missile(sender).PredictionEngageTime);
//      rec.time := timeEngage;
//
//      sObject := simMgrClient.findDetectedTrack(TT3Missile(Sender).TargetObject);
//      if Assigned(sObject) then
//        trackNum := FormatTrackNumber(TT3DetectedTrack(sObject).TrackNumber)
//      else
//        trackNum := TT3PlatformInstance(TT3Missile(Sender).TargetObject).TrackLabel;
//
//      with sgSurfacetoAir do
//      begin
//        Cells[0, emptyRow] := TT3Missile(sender).InstanceName;
//        sgSurfacetoAir.Cells[1, emptyRow] := 'SAM Mount(designation)';
//        sgSurfacetoAir.Cells[2, emptyRow] := '' + trackNum;
//        sgSurfacetoAir.Cells[3, emptyRow] := FloatToStr
//          (TT3PlatformInstance(Target).Course);
//        sgSurfacetoAir.Cells[4, emptyRow] := FloatToStr
//          (TT3PlatformInstance(Target).Speed);
//        sgSurfacetoAir.Cells[5, emptyRow] := IntToStr
//          (Round(TT3PlatformInstance(Target).Altitude / C_Feet_To_Meter));
//        sgSurfacetoAir.Cells[6, emptyRow] := SecondToTimeString(TT3MissilesOnVehicle(sender).
//                                              LaunchDelay);
////        sgSurfacetoAir.Cells[6, emptyRow] := FormatDateTime('hh : mm : ss',
////          timeof(TT3MissilesOnVehicle(sender).LaunchDelay / (3600*24)));
//
//        Distance := CalcRange(TT3MissilesOnVehicle(sender).getPositionX, TT3MissilesOnVehicle(sender).getPositionY
//                              ,TT3PlatformInstance(Target).getPositionX, TT3PlatformInstance(Target).getPositionY);
//        Timeflight := (Distance / TT3MissilesOnVehicle(sender).UnitMotion.FData.Max_Ground_Speed)*3600;
//
//        Cells[7, emptyRow] := FormatDateTime('hh : mm : ss',
//          timeof((Timeflight) / (3600*24)));
//
//        sgSurToAirEditedRow := emptyRow;
//        rec.row := sgSurToAirEditedRow;
//      end;
    end
    // add data Surface to Surface
    else
    begin
//      emptyRow := 0;
//      rec.isAir := false;
//      gbSurfaceToSurface.BringToFront;
//
//      for i := 0 to sgSurfacetoSurface.RowCount - 1 do
//      begin
//        if sgSurfacetoSurface.Cells[0, i] = '' then
//        begin
//          emptyRow := i;
//          break;
//        end;
//      end;

      {hanya untuk hard code}
      if TT3Missile(sender).PredictionEngageTime = 0 then
         TT3Missile(sender).PredictionEngageTime := TT3Missile(sender).LaunchDelay / (3600*24);

//      timeEngage := TimeOf(simMgrClient.GameTIME) + TimeOf(FloatToDateTime(TT3Missile(sender).PredictionEngageTime));
//      timeEngage := TimeOf(simMgrClient.GameTIME) + TimeOf(TT3Missile(sender).PredictionEngageTime);
//      rec.time := timeEngage;
//
//      LaunchObj := nil;
//      mov := TT3MissilesOnVehicle(sender);
//      for i := 0 to mov.MissileDefinition.FLaunchs.Count - 1 do
//      begin
//        LaunchObj := TFitted_Weap_Launcher_On_Board(mov.MissileDefinition.FLaunchs.Items[i]);
//        if LaunchObj.FData.Launcher_Type > 8 then
//        begin
//          if (LaunchObj.FData.Launcher_Type-8) = (Launcher) then
//            Break;
//        end
//        else
//        begin
//          if LaunchObj.FData.Launcher_Type = (Launcher) then
//            Break;
//        end;
//      end;

      case mov.FiringMode of
        mfmRBL  : FiringModeStr := 'RBL';
        mfmBOL  : FiringModeStr := 'BOL';
      end;

      Distance := CalcRange(mov.getPositionX, mov.getPositionY,
                  TT3PlatformInstance(Target).getPositionX, TT3PlatformInstance(Target).getPositionY);
      Timeflight := (Distance / mov.UnitMotion.FData.Max_Ground_Speed)*3600;

//      with sgSurfacetoSurface do
//      begin
//        Cells[0, emptyRow] := mov.InstanceName;
//        Cells[1, emptyRow] := IntToStr(Launcher);
//        Cells[2, emptyRow] := 'Planned';
//        Cells[3, emptyRow] := (TT3PlatformInstance(Target).InstanceName);
//        Cells[4, emptyRow] := FiringModeStr;
//
//        if Assigned(LaunchObj) then
//          Cells[5, emptyRow] := IntToStr(LaunchObj.FData.Launcher_Angle)
//        else
//          Cells[5, emptyRow] := '0';
//
//        Cells[6, emptyRow] := FormatDateTime('hh : mm : ss', timeof(mov.LaunchDelay / (3600*24)));
//        Cells[7, emptyRow] := FormatDateTime('hh : mm : ss', timeof((Timeflight) / (3600*24)));
//      end;
//
//      sgSurToSurEditedRow := emptyRow;
//      rec.row := sgSurToSurEditedRow;
    end;
  end;
end;

procedure TfrmMainDIsplay.OnWeaponLaunched(Sender, Target: TObject);
var
  li: TListItem;
  wc: String;
begin
  if not Assigned(Sender) then exit;

//  time := simMgrClient.GameTIME;

  li := lvWeaponEngagement.Items.Add;
  { Time, Launching Platform, Weapon Class, Target Platform, Engagement }
  li.Caption := FormatDateTime('hh : mm : ss', Now);
  li.SubItems.Add(TT3Weapon(sender).InstanceName);

  case TT3Weapon(sender).WeaponCategory of
    wcMissileAirToSurfaceSubsurface:
      wc := 'Missile Air To Surface Subsurface';
    wcMissileSurfaceSubsurfaceToAir:
      wc := 'Missile Surface Subsurface To Air';
    wcMissileSurfaceSubsurfaceToSurfaceSubsurface:
      wc := 'Missile Surface/Subsurface To Surface/Subsurface';
    wcMissileAirToAir:
      wc := 'Missile Air To Air';
    wcMissileLandAttack:
      wc := 'Missile Land Attack';
    wcTorpedoStraigth:
      wc := 'Torpedo Staigth';
    wcTorpedoActiveAcoustic:
      wc := 'Torpedo Active Acoustic';
    wcTorpedoPassiveAcoustic:
      wc := 'Torpedo Passive Acoustic';
    wcTorpedoWireGuided:
      wc := 'Torpedo Wire Guided';
    wcTorpedoWakeHoming:
      wc := 'Torpedo Wake Homing';
    wcTorpedoActivePassive:
      wc := 'Torpedo Active Passive';
    wcTorpedoAirDropped:
      wc := 'Torpedo Air Dropped';
    wcMine:
      wc := 'Mine';
    wcGunCIWS:
      wc := 'Gun CIWS';
    wcGunGun:
      wc := 'Gun';
    wcGunRocket:
      wc := 'Gun Rocket';
    wcBomb:
      wc := 'Bomb';
  end;

  li.SubItems.Add(wc);

  if TT3PlatformInstance(Target) <> nil  then
    li.SubItems.Add(TT3PlatformInstance(Target).InstanceName);

  li.SubItems.Add('Launched');
  li.Data := TT3PlatformInstance(sender);
end;

procedure TfrmMainDIsplay.pnlStatusRedClick(Sender: TObject);
var
  CmdStatus : TStatus;
begin
  if statusR_List.Count > 0 then
  begin
    CmdStatus := TStatus(statusR_List.Items[statusR_List.Count-1]);
    if LowerCase(CmdStatus.state) = 'receive message' then
    begin
//      frmToteDisplay.gbMessageHandlingSystem.BringToFront;
//      frmToteDisplay.pcReceived.ActivePageIndex := 0;
    end;

    statusR_List.Delete(statusR_List.Count-1);
    updateStatus;
  end;
end;

procedure TfrmMainDIsplay.Rangeings1Click(Sender: TObject);
begin
  ToolBtnRangeRingsOnHookClick(Sender);
end;

procedure TfrmMainDIsplay.RefreshTrackList;
var
  i : integer;
  obj : TObject;
begin

  try
    with FTrackLists.LockList do begin
      Clear;

      if TT3ReplayClient(manager).CurrentPerspective = 0 then
        for i := 0 to TT3ReplayClient(manager).SimPlatforms.itemCount - 1 do begin
          obj := TT3ReplayClient(manager).SimPlatforms.getObject(i);
          if not TT3Unit(obj).FreeMe then
            Add(obj);
        end
      else begin
        for i := 0 to TT3ReplayClient(manager).SimPlatforms.itemCount - 1 do begin
          obj := TT3ReplayClient(manager).SimPlatforms.getObject(i);
          if TT3PlatformInstance(obj).UnitGroup then
            if not TT3Unit(obj).FreeMe then
              Add(obj);
        end;
        for i := 0 to TT3ReplayClient(manager).SimDetectedTrackList.itemCount - 1 do begin
          obj := TT3ReplayClient(manager).SimDetectedTrackList.getObject(i);
          Add(obj);
        end
      end;
    end;
  finally
    FTrackLists.UnlockList
  end;
end;

procedure TfrmMainDIsplay.RemoveFromTrackList(Sender: TObject);
var
  s : string;
  li : TListItem;
  det : TT3DetectedTrack;
  pi : TT3PlatformInstance;
begin
  if Sender is TT3DetectedTrack then
  begin
    det := Sender as TT3DetectedTrack;

    s := FormatTrackNumber(det.trackNumber);
  end
  else if (Sender is TT3PlatformInstance) then
  begin
    pi := Sender as TT3PlatformInstance;

    s := pi.TrackLabel;
  end;

  li := FindTrackListByMember(s);
  if li <> nil then
    li.Delete;
end;

procedure TfrmMainDIsplay.ResetTrackInfo;
begin
  lbTrackHook.Caption := '---';
  lbNameHook.Caption  := '---';
  lbClassHook.Caption := '---';
  lbBearingHook.Caption := '---';
  lbRangeHook.Caption   := '---';
  lbPositionHook1.Caption := '---';
  lbPositionHook2.Caption := '---';
  lbCourseHook.Caption  := '---';
  lbGround.Caption    := '---';
  lbDamage.Caption    := '---';
  lbFormation.Caption := '---';
  lbAltitude.Caption  := '---';
  lbDepth.Caption     := '---';

  lbCourseHooked.Caption := '---';
  lbSpeedHooked.Caption  := '---';


  pnlAltitude.Visible := false;
  pnlDepth.Visible    := false;
end;

procedure TfrmMainDIsplay.SetPerspectivesOption;
var
  i : integer;
  item : TMenuItem;
  cub : T3CubicleGroup; 
begin
  View1.Remove(FPerspectiveItem);
  FPerspectiveItem.Clear;

  // controller default;
  item := TMenuItem.Create(Self);
  item.Caption := 'Controller';
  item.Tag     := 0;
  item.OnClick := OnPerspectiveClick;
  item.Checked := true;
  FPerspectiveItem.Add(item);

  for i := 0 to TT3ReplayClient(manager).Scenario.CubiclesGroupsListFromDB.Count - 1 do begin
    cub := TT3ReplayClient(manager).Scenario.CubiclesGroupsListFromDB.Items[i] as T3CubicleGroup;
    if cub.FSList.Count > 0 then begin

      item := TMenuItem.Create(Self);
      item.Caption := cub.FData.Group_Identifier;
      item.Tag     := cub.FData.Group_Index;
      item.OnClick := OnPerspectiveClick;
      FPerspectiveItem.Add(item);
    end;
  end;

  View1.Add(FPerspectiveItem);
end;

procedure TfrmMainDIsplay.SetDisplayID(const Value: integer);
begin
  FDisplayID := Value;
end;

procedure TfrmMainDIsplay.SetFullScreen(const Value: boolean);
begin
  FFullScreen := Value;
  FullScreen1.Checked := FFullScreen;

  if FFullScreen then
  begin
    WindowState := wsMaximized;
    BorderStyle := bsNone;
  end
  else
  begin
    WindowState := wsNormal;
    BorderStyle := bsSingle;
  end;
end;

procedure TfrmMainDIsplay.SetManager(const Value: TObject);
begin
  FManager := Value;
  SetPerspectivesOption;
end;

procedure TfrmMainDIsplay.SetOnGameControl(const Value: TOnGameControl);
begin
  FOnGameControl := Value;
end;

procedure TfrmMainDIsplay.tbAddTrackClick(Sender: TObject);
begin
  if Assigned(TT3ReplayClient(Manager).HookedPlatform) then
    AddTrackPlatform(TT3ReplayClient(Manager).HookedPlatform);
end;

procedure TfrmMainDIsplay.tbAnchorClick(Sender: TObject);
begin
  if Assigned(TT3ReplayClient(manager).HookedPlatform) then
  begin
   
    if TT3ReplayClient(manager).HookedPlatform is TT3PlatformInstance then
    begin
      TT3ReplayClient(manager).LineVisual.X1 := TT3PlatformInstance(TT3ReplayClient(manager).HookedPlatform)
        .getPositionX;
      TT3ReplayClient(manager).LineVisual.Y1 := TT3PlatformInstance(TT3ReplayClient(manager).HookedPlatform)
        .getPositionY;
    end
    else if TT3ReplayClient(manager).HookedPlatform is TT3DetectedTrack then
    begin
      TT3ReplayClient(manager).LineVisual.X1 := TT3DetectedTrack(TT3ReplayClient(manager).HookedPlatform).getPositionX;
      TT3ReplayClient(manager).LineVisual.Y1 := TT3DetectedTrack(TT3ReplayClient(manager).HookedPlatform).getPositionY;
    end;

    FAnchorTrack := TT3ReplayClient(manager).HookedPlatform as TSimObject;
    Map.Repaint;
  end;

end;

procedure TfrmMainDIsplay.tbDeleteTrackClick(Sender: TObject);
begin
  if Assigned(TT3ReplayClient(Manager).HookedPlatform) then
    RemoveFromTrackList(TT3ReplayClient(Manager).HookedPlatform);
end;

procedure TfrmMainDIsplay.tbHistoryClick(Sender: TObject);
begin
  if Assigned(TT3ReplayClient(Manager).HookedPlatform) then
  begin
    if TT3ReplayClient(Manager).HookedPlatform is TT3Vehicle then
    begin
      TT3Vehicle(TT3ReplayClient(Manager).HookedPlatform).ShowTrails :=
        not TT3Vehicle(TT3ReplayClient(Manager).HookedPlatform).ShowTrails;
      tbHistory.Down := TT3Vehicle(TT3ReplayClient(Manager).HookedPlatform).ShowTrails;
    end
    else if TT3ReplayClient(Manager).HookedPlatform is TT3DetectedTrack then
    begin
      TT3DetectedTrack(TT3ReplayClient(Manager).HookedPlatform).ShowTrails := not TT3DetectedTrack
        (TT3ReplayClient(Manager).HookedPlatform).ShowTrails;

      tbHistory.Down := TT3DetectedTrack(TT3ReplayClient(Manager).HookedPlatform).ShowTrails;
    end;
  end;
end;

procedure TfrmMainDIsplay.tbRewindClick(Sender: TObject);
begin
  if Assigned(FOnGameControl) then
    FOnGameControl(4);
end;

procedure TfrmMainDIsplay.ToolBtnFilterCursorClick(Sender: TObject);
begin
  FAnchorFilterEnabled := not FAnchorFilterEnabled;

  ToolBtnFilterCursor.Down := FAnchorFilterEnabled;
  TT3ReplayClient(manager).LineVisual.Visible := FAnchorFilterEnabled;
  Map.Repaint;
end;

procedure TfrmMainDIsplay.tBtnDoubleSpeedClick(Sender: TObject);
begin
  if Assigned(FOnGameControl) then
    FOnGameControl(3);
end;

procedure TfrmMainDIsplay.tbtnFullScreenClick(Sender: TObject);
begin
  FullScreen := not FullScreen;
end;

procedure TfrmMainDIsplay.tBtnGameFreezeClick(Sender: TObject);
begin
  if Assigned(FOnGameControl) then
    FOnGameControl(2);
end;

procedure TfrmMainDIsplay.tbtnStartGameClick(Sender: TObject);
begin
  if Assigned(FOnGameControl) then
    FOnGameControl(1);
end;

procedure TfrmMainDIsplay.ToolBtnCentreOnGameCentreClick(Sender: TObject);
var
  long, lat: double;
begin
  long  := TT3ReplayClient(manager).GameEnvironment.FGameArea.Game_Centre_Long;
  lat   := TT3ReplayClient(manager).GameEnvironment.FGameArea.Game_Centre_Lat;
  TT3ReplayClient(manager).SimMap.SetMapCenter(long, lat);
end;

procedure TfrmMainDIsplay.ToolBtnCentreOnHookClick(Sender: TObject);
begin
  FCenterOnHook := not FCenterOnHook;
  ToolBtnCentreOnHook.Down := FCenterOnHook;
  TT3ReplayClient(manager).SimMap.FMap.CurrentTool :=  mtCenterOnHook;

  UpdateCenterOnHook;
end;

procedure TfrmMainDIsplay.toolbtnDecreaseScaleClick(Sender: TObject);
var
  i: Integer; // zoom out
  z, zNow: double;
begin
  zNow := FixMapZoom(0.5 * TT3ReplayClient(manager).SimMap.FMap.Zoom);
  i := FindClosestZoomIndex(zNow);
  z := ZoomIndexToScale(i);

  if z >= zNow then
    i := i - 1;
  if i < 0 then
    i := 0;
  if i > CMax_Z then
    i := CMax_Z;

  // do the zoom in
  cbSetScale.ItemIndex := i;
  cbSetScaleChange(cbSetScale);
end;

procedure TfrmMainDIsplay.toolBtnFilterRangeRingsClick(Sender: TObject);
var
  i: Integer;
  rrVis: Boolean;
  z: double;
  pfTrack : TT3PlatformInstance;
begin
  rrVis := toolBtnFilterRangeRings.Down;
  pfTrack := nil;

  if rrVis then
  begin
    z := FixMapZoom(TT3ReplayClient(manager).SimMap.FMap.Zoom);
    i := FindClosestZoomIndex(z);
    z := ZoomIndexToScale(i);
    TT3ReplayClient(manager).RangeRing.Interval := 0.125 * z;
  end;

  if Assigned(TT3ReplayClient(manager).HookedPlatform)then
  begin
    if TT3ReplayClient(manager).HookedPlatform is TT3PlatformInstance then
      pfTrack := TT3ReplayClient(manager).HookedPlatform as TT3PlatformInstance
    else
    if TT3ReplayClient(manager).HookedPlatform is TT3DetectedTrack then
      pfTrack := TT3DetectedTrack(TT3ReplayClient(manager).HookedPlatform).TrackObject as TT3PlatformInstance;

    if Assigned(pfTrack) then begin
      TT3ReplayClient(manager).RangeRing.mX := pfTrack.getPositionX;
      TT3ReplayClient(manager).RangeRing.mY := pfTrack.getPositionY;
    end;
  end;

  TT3ReplayClient(manager).RangeRing.Visible := rrVis;
end;

procedure TfrmMainDIsplay.ToolBtnHookNextClick(Sender: TObject);
var
  aObject : TObject;
begin
  try
    with FTrackLists.LockList do begin

      if FIndexTrack > (count - 1) then
        FIndexTrack := 0;

      if Count > 0 then begin
        aObject := Items[FIndexTrack];

        if aObject <> nil then
        begin
          UnSelectAllTrack;
          if aObject is TT3Unit then
            TT3Unit(aObject).Selected := true
          else if aObject is TT3DetectedTrack then
            TT3DetectedTrack(aObject).Selected := true;

          TT3ReplayClient(Manager).HookedPlatform := aObject;
          Map.Repaint;
        end;

        FIndexTrack := FIndexTrack + 1;
      end else
        FIndexTrack := 0;

      if FIndexTrack > Count - 1 then
        FIndexTrack := 0;
    end;
  finally
    FTrackLists.UnlockList;
  end;

end;

procedure TfrmMainDIsplay.ToolBtnHookPreviousClick(Sender: TObject);
var
  aObject : TObject;
begin
  try
    with FTrackLists.LockList do begin

      if FIndexTrack > (count - 1) then
        FIndexTrack := 0;

      if Count > 0 then begin
        aObject := Items[FIndexTrack];

        if aObject <> nil then
        begin
          UnSelectAllTrack;
          if aObject is TT3Unit then
            TT3Unit(aObject).Selected := true
          else if aObject is TT3DetectedTrack then
            TT3DetectedTrack(aObject).Selected := true;

          TT3ReplayClient(Manager).HookedPlatform := aObject;
          Map.Repaint;
        end;

        FIndexTrack := FIndexTrack - 1;
      end else
        FIndexTrack := 0;

      if FIndexTrack < 0 then
        FIndexTrack := Count - 1;
    end;
  finally
    FTrackLists.UnlockList;
  end;
end;

procedure TfrmMainDIsplay.toolbtnIncreaseScaleClick(Sender: TObject);
var
  i: Integer;
  z, zNow: double;
begin
  zNow := FixMapZoom(0.5 * TT3ReplayClient(manager).SimMap.FMap.Zoom);
  i := FindClosestZoomIndex(zNow);
  z := ZoomIndexToScale(i);

  if z <= zNow then
    i := i + 1;
  if i < 0 then
    i := 0;
  if i > CMax_Z then
    i := CMax_Z;

  // do the zoom out
  cbSetScale.ItemIndex := i;
  cbSetScaleChange(cbSetScale);
end;

procedure TfrmMainDIsplay.ToolBtnPanClick(Sender: TObject);
begin
  TT3ReplayClient(manager).SimMap.FMap.CurrentTool := miCenterTool;
end;

procedure TfrmMainDIsplay.ToolBtnRangeRingsOnHookClick(Sender: TObject);
var
  x, y : double;
  pfTrack : TT3PlatformInstance;
begin
  FRangeRingOnHook    := ToolBtnRangeRingsOnHook.Down;
  Rangeings1.Checked  := FRangeRingOnHook;
  x := 0;
  y := 0;
  pfTrack := nil;
  if FRangeRingOnHook and Assigned(TT3ReplayClient(manager).HookedPlatform) then
  begin

    if TT3ReplayClient(manager).HookedPlatform is TT3PlatformInstance then
      pfTrack := TT3ReplayClient(manager).HookedPlatform as TT3PlatformInstance
    else
    if TT3ReplayClient(manager).HookedPlatform is TT3DetectedTrack then
      pfTrack := TT3DetectedTrack(TT3ReplayClient(manager).HookedPlatform).TrackObject as TT3PlatformInstance;

    if Assigned(pfTrack) then begin
      x  := pfTrack.getPositionX;
      y  := pfTrack.getPositionY;
    end;

    TT3ReplayClient(manager).RangeRing.mx := x;
    TT3ReplayClient(manager).RangeRing.my := y;
  end;

end;

procedure TfrmMainDIsplay.toolbtnZoomClick(Sender: TObject);
begin
  FMap.CurrentTool := miZoomInTool;
end;

procedure TfrmMainDIsplay.Tote1Click(Sender: TObject);
begin
  pnlTote.BringToFront;
end;

procedure TfrmMainDIsplay.SetSelectedTrack(track: TSimObject);
begin

  if (track is TT3PlatformInstance) then
  begin
    UnSelectAllTrack;
    TT3PlatformInstance(track).Selected := true;
    TT3ReplayClient(manager).HookedPlatform := track
  end
  else
  if (track is TT3DetectedTrack) then
  begin
    UnSelectAllTrack;
    TT3DetectedTrack(track).Selected := true;
    TT3ReplayClient(manager).HookedPlatform := track
  end;
end;

procedure TfrmMainDIsplay.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
  I: Integer;
  wpn: TT3Weapon;
  gunfire: Boolean;
  Emcon: Boolean;
  jamming: Boolean;
  EmconCat : TEMCON_Category;
begin
  case Panel.Index of
    4 : //emcon
      begin
        Emcon := False;
        if Assigned(TT3ReplayClient(manager).HookedPlatform) then
          if TT3ReplayClient(manager).HookedPlatform.ClassType = TT3Vehicle then
          begin
            for I := 0 to TT3Vehicle(TT3ReplayClient(manager).HookedPlatform).ListEMCON.Count - 1 do
            begin
              EmconCat := TT3Vehicle(TT3ReplayClient(manager).HookedPlatform).ListEMCON.Items[i];

              if TEMCON_ChekBoxStatus(EmconCat.Mode) = Checked then
              begin
                Emcon := True;
                Break;
              end;
            end;
          end;

        if Emcon then
        begin
          StatusBar1.Canvas.Brush.Color := clBtnFace;
          StatusBar1.Canvas.FillRect(Rect);
          StatusBar1.Font.Color := clBlack;
          Panel.Bevel := pbLowered;
          StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
        end
        else
        begin
          StatusBar1.Canvas.Brush.Color := clBtnFace;
          StatusBar1.Canvas.FillRect(Rect);
          StatusBar1.Font.Color := clBlack;
          Panel.Bevel := pbLowered;
        end;
      end;
    5 : //jamming
      begin
        jamming := False;

        if Assigned(TT3ReplayClient(manager).HookedPlatform) then
          if TT3ReplayClient(manager).HookedPlatform.ClassType = TT3PlatformInstance then
          begin
            jamming := TT3PlatformInstance(TT3ReplayClient(manager).HookedPlatform).VehicleOnJamming.Count <> 0
          end;

        if jamming then
        begin
          StatusBar1.Canvas.Brush.Color := clYellow;
          StatusBar1.Canvas.FillRect(Rect);
          StatusBar1.Font.Color := clBlack;
          Panel.Bevel := pbLowered;
          StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
        end
        else
        begin
          StatusBar1.Canvas.Brush.Color := clBtnFace;
          StatusBar1.Canvas.FillRect(Rect);
          StatusBar1.Font.Color := clBlack;
          Panel.Bevel := pbLowered;
        end;
      end;
    6 : //Gun Fire
      begin
        gunfire := False;
        if Assigned(TT3ReplayClient(manager).HookedPlatform) then
          if TT3ReplayClient(manager).HookedPlatform.ClassType = TT3Vehicle then
          begin
            for I := 0 to TT3Vehicle(TT3ReplayClient(manager).HookedPlatform).Weapons.Count - 1 do
            begin
              wpn := TT3Weapon(TT3Vehicle(TT3ReplayClient(manager).HookedPlatform).Weapons.Items[i]);
              if wpn is TT3GunOnVehicle then
              begin
                if wpn.WeaponStatus = wsFiring then
                begin
                  gunfire := True;
                  Break;
                end;
              end;
            end;

          if gunfire then
          begin
            StatusBar1.Canvas.Brush.Color := clYellow;
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
            StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
          end
          else
          begin
            StatusBar1.Canvas.Brush.Color := clBtnFace;
            StatusBar1.Canvas.FillRect(Rect);
            StatusBar1.Font.Color := clBlack;
          end;
        end;
      end;
    7 : //Fire Control
      begin
        if Assigned(TT3ReplayClient(manager).HookedPlatform) then
          if TT3ReplayClient(manager).HookedPlatform.ClassType = TT3PlatformInstance then
          begin
            if TT3PlatformInstance(TT3ReplayClient(manager).HookedPlatform).LockFCR then
            begin
              StatusBar1.Canvas.Brush.Color := clRed;
              StatusBar1.Canvas.FillRect(Rect);
              StatusBar1.Font.Color := clBlack;
              StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
            end
            else
            begin
              StatusBar1.Canvas.Brush.Color := clBtnFace;
              StatusBar1.Canvas.FillRect(Rect);
              StatusBar1.Font.Color := clBlack;
            end;
          end;
      end;
    9 ://state game
      begin
        if Panel.Text = 'FROZEN' then
        begin
          StatusBar1.Canvas.Brush.Color := clRed;
          StatusBar1.Canvas.FillRect(Rect);
          StatusBar1.Font.Color := clBlack;
        end
        else if Panel.Text = '1 X' then
        begin
          StatusBar1.Canvas.Brush.Color := clBtnFace;
          StatusBar1.Canvas.FillRect(Rect);
          StatusBar1.Font.Color := clBlack;
        end
        else
        begin
          StatusBar1.Canvas.Brush.Color := clYellow;
          StatusBar1.Canvas.FillRect(Rect);
          StatusBar1.Font.Color := clBlack;

        end;

        StatusBar1.Canvas.TextOut(Rect.left + 4, Rect.top + 3, Panel.Text);
      end;
  end;
end;

procedure TfrmMainDIsplay.Tactical1Click(Sender: TObject);
begin
  pnlTactical.BringToFront;
end;

procedure TfrmMainDIsplay.UnSelectAllTrack;
var
  i : integer;
  pi : TT3PlatformInstance;
  dt : TT3DetectedTrack;
begin
  for I := 0 to TT3ReplayClient(manager).SimPlatforms.itemCount - 1 do begin
    pi := TT3ReplayClient(manager).SimPlatforms.getObject(i) as TT3PlatformInstance;
    pi.Selected := false;
  end;

  for I := 0 to TT3ReplayClient(manager).SimDetectedTrackList.itemCount - 1 do begin
    dt := TT3ReplayClient(manager).SimDetectedTrackList.getObject(i) as TT3DetectedTrack;
    dt.Selected := false;
  end;
end;


procedure TfrmMainDIsplay.UpdateCenterOnHook;
var
  range : double;
  pfTrack : TT3PlatformInstance;
begin
  pfTrack := nil;
  if FCenterOnHook and Assigned(TT3ReplayClient(manager).HookedPlatform) then
  begin

    if TT3ReplayClient(manager).HookedPlatform is TT3PlatformInstance then
      pfTrack := TT3ReplayClient(manager).HookedPlatform as TT3PlatformInstance
    else
    if TT3ReplayClient(manager).HookedPlatform is TT3DetectedTrack then
      pfTrack := TT3DetectedTrack(TT3ReplayClient(manager).HookedPlatform).TrackObject as TT3PlatformInstance;

    if not Assigned(pfTrack) then exit;    

    range := CalcRange(FLastMapCenterX,FLastMapCenterY, pfTrack.PosX, pfTrack.PosY)
             * C_NauticalMile_To_Metre;

    // default update center ketika dR = 100 meter
    if range > 10 then begin
      FLastMapCenterX := pfTrack.PosX;
      FLastMapCenterY := pfTrack.PosY;

      TT3ReplayClient(manager).SimMap.SetMapCenter(FLastMapCenterX,FLastMapCenterY);
    end;

    if FRangeRingOnHook then
    begin
      TT3ReplayClient(manager).RangeRing.mx := pfTrack.getPositionX;
      TT3ReplayClient(manager).RangeRing.my := pfTrack.getPositionY;
    end
    else
    begin
      TT3ReplayClient(manager).RangeRing.mx := Map.CenterX;
      TT3ReplayClient(manager).RangeRing.my := Map.CenterY;
    end;

  end;
end;

procedure TfrmMainDIsplay.UpdateForm;
begin
  lbRangeRings.Caption := FormatCourse(TT3ReplayClient(manager).RangeRing.Interval);

  if Assigned(TT3ReplayClient(manager).HookedPlatform) then begin
    if TT3ReplayClient(manager).HookedPlatform is TT3PlatformInstance then
      with TT3PlatformInstance(TT3ReplayClient(manager).HookedPlatform) do begin
        lbTrackHook.Caption := Track_ID;
        lbNameHook.Caption  := InstanceName;

        if TT3ReplayClient(manager).HookedPlatform is TT3Vehicle then
          lbClassHook.Caption := TT3Vehicle(TT3ReplayClient(manager).HookedPlatform).VehicleDefinition
            .FData.Vehicle_Identifier;
        if TT3ReplayClient(manager).HookedPlatform is TT3Missile then
          lbClassHook.Caption := TMissile_On_Board(UnitDefinition)
            .FDef.Class_Identifier;
        if TT3ReplayClient(manager).HookedPlatform is TT3Torpedo then
          lbClassHook.Caption := TTorpedo_On_Board(UnitDefinition)
            .FDef.Class_Identifier;

        if PlatformDomain = 0 then
        begin
          pnlDepth.Visible      := False;
          pnlAltitude.Visible   := True;
          try
          if Altitude <> 0 then
            lbAltitude.Caption    := FormatAltitude(Altitude / C_Feet_To_Meter)
          else
           lbAltitude.Caption := '0';
          except
            pnlDepth.Visible      := False;
            pnlAltitude.Visible   := False;
          end;
        end
        else if PlatformDomain = 2 then
        begin
          pnlDepth.Visible      := True;
          pnlAltitude.Visible   := False;
          try
          if Altitude <> 0 then
            lbDepth.Caption    := FormatAltitude(Altitude)
          else
            lbDepth.Caption := '0';
          except
            pnlDepth.Visible      := False;
            pnlAltitude.Visible   := False;
          end;
        end
        else
        begin
          pnlDepth.Visible      := False;
          pnlAltitude.Visible   := False;
        end;

        lbBearingHook.Caption := '---';
        lbRangeHook.Caption   := '---';
        lbPositionHook1.Caption := formatDMS_long(getPositionX);
        lbPositionHook2.Caption := formatDMS_latt(getPositionY);
        lbCourseHook.Caption  := FormatCourse(Course);
        lbGround.Caption    := FormatSpeed(GroundSpeed);
        lbDamage.Caption    := IntToStr(100 - Round(HealthPercent)) + '%';
        lbFormation.Caption := '---';

        if (PlatformDomain = vhdAir) or 
           ((PlatformDomain = vhdSubsurface) and (Altitude <> 0)) then
          begin
            Label10.Caption := FormatCourse(Course);
            Label21.Caption := FormatSpeed(Speed);

            lbCourseHooked.Caption := '---';
            lbSpeedHooked.Caption := '---';
          end
        else
        begin
            lbCourseHooked.Caption := FormatCourse(Course);
            lbSpeedHooked.Caption := FormatSpeed(Speed);

            Label10.Caption := FormatCourse(TT3ReplayClient(manager).Scenario.GameEnvironment.FData.Wind_Direction);
            Label21.Caption := FormatSpeed(TT3ReplayClient(manager).Scenario.GameEnvironment.FData.Wind_Speed);
         end;
      end else
        ResetTrackInfo;
  end else
    ResetTrackInfo
end;


procedure TfrmMainDIsplay.updateStatus;
begin
  if statusR_List.Count > 0 then
  begin
    pnlStatusRed.Visible := true;
    pnlStatusYellow.Visible := true;
    pnlStatusRed.Caption := TStatus(statusR_List[statusR_List.Count-1]).state;
  end
  else
  begin
    pnlStatusRed.Visible  := false;
    if statusY_List.Count <= 0 then
      pnlStatusYellow.Visible := false

  end;
end;

procedure TfrmMainDIsplay.DisplayGameTime(const gSpeed: single;
    const gTime: TDateTime);
var
  i: Integer;
begin
  if abs(gSpeed) < 0.000001 then
  begin
    StatusBar1.Panels[9].Text := 'FROZEN';
  end
  else
  begin
    if gSpeed < 1 then
    begin
      i := Round(1.0 / gSpeed);
      StatusBar1.Panels[9].Text := '1/' + IntToStr(i) + ' X';
    end
    else
      StatusBar1.Panels[9].Text := IntToStr(Round(gSpeed)) + ' X';

  end;

  StatusBar1.Panels[10].Text := FormatDateTime('ddhhnnss', gTime)
    + 'Z' + FormatDateTime('mmmyyyy', gTime);

  if TT3ReplayClient(manager).IsController then
    StatusBar1.Panels[1].Text := 'Entities = ' + IntToStr(TT3ReplayClient(manager).SimPlatforms.itemCount)
  else
    StatusBar1.Panels[1].Text := '';

  StatusBar1.Repaint;

end;

procedure TfrmMainDIsplay.DisplayValidTime(aStart, aStop: TDateTime);
begin
  lblMaxTime.Caption := '(' + FormatDateTime('hh:nn:ss', aStart) + ' to ' + FormatDateTime('hh:nn:ss', aStop) + ')';
end;

end.
